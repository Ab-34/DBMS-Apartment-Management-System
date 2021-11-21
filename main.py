import streamlit as st
import pandas as pd
import numpy as np
import pickle as pkle
import os.path
import psycopg2
from PIL import Image
import streamlit.components.v1 as components
import hashlib
import pandas as pd

st.title('Apartment Management System')


def main():

    imageCarouselComponent = components.declare_component("image-carousel-component", path="frontend/public")

    imageUrls = [
        "https://i.pinimg.com/736x/30/fa/66/30fa6619095149b3a7e8b29ecfe1d873--nanjing-green-architecture.jpg",
        "https://images.unsplash.com/photo-1567220720374-a67f33b2a6b9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80",
        "https://images.unsplash.com/photo-1540496905036-5937c10647cc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80",
        "https://images.unsplash.com/photo-1575429198097-0414ec08e8cd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
        "https://images.unsplash.com/photo-1582654344606-2b9d8f65162b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1776&q=80",
        "https://media.istockphoto.com/photos/interior-empty-room-3d-rendering-picture-id1072179270?b=1&k=20&m=1072179270&s=170667a&w=0&h=nPJIcwqT94Ds1oxaR2DG7IiBEQlbNrabcthc76JytiM=",
        "https://images.unsplash.com/photo-1615873968403-89e068629265?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1332&q=80",
      ]
    selectedImageUrl = imageCarouselComponent(imageUrls=imageUrls, height=200)

    if selectedImageUrl is not None:
        st.image(selectedImageUrl)

conn = psycopg2.connect(host='localhost',
                      port='5432',
                      database='t_15_57_59',
                      user= 'postgres',
                      password= 'dbms')
conn.autocommit = True

def run_query(query):
    with conn.cursor() as cur:
        cur.execute(query)
        return cur.fetchall()

def create_usertable():
    with conn.cursor() as cur:
        cur.execute('CREATE TABLE IF NOT EXISTS userstable(username varchar NOT NULL,password varchar NOT NULL)')
        conn.commit()

def add_userdata(username,password):
    with conn.cursor() as c:
	    c.execute('INSERT INTO userstable(username,password) VALUES (%s,%s)',(username,password))
	    conn.commit()

def login_user(username,password):
    with conn.cursor() as c:
        c.execute('SELECT * FROM userstable WHERE username =%s AND password = %s',(username,password))
        data = c.fetchall()
        return data

def make_hashes(password):
	return hashlib.sha256(str.encode(password)).hexdigest()

def check_hashes(password,hashed_text):
	if make_hashes(password) == hashed_text:
		return hashed_text
	return False

choice = st.sidebar.selectbox("Menu",('Home','Facilities','Log In','Sign up','About'))

if choice == 'Home':
    st.write('this is home')
    main()

elif choice == 'Facilities':
    st.subheader('Amenities that we have to offer:')
    rows = run_query("SELECT * from facilities;")
    indoor=pd.DataFrame([row[1] for row in rows if row[2]=="Indoor"],columns=["Indoor"])
    outdoor=pd.DataFrame([row[1] for row in rows if row[2]=="Outdoor"],columns=["Outdoor"])

    # Print results.
    # st.write("Indoor")
    st.write(indoor)
    st.header("")
    # st.write("Outdoor")
    st.write(outdoor)

elif choice == 'Log In':
        user = st.sidebar.text_input('Username')
        passwd = st.sidebar.text_input('Password',type='password')
        if st.sidebar.checkbox('Login') :
            create_usertable()
            hashed_pswd = make_hashes(passwd)
            result = login_user(user,check_hashes(passwd,hashed_pswd))
            if result:
                st.success("Logged In as {}".format(user) )
                column_names = ["a", "b", "c"]
                df = pd.DataFrame(columns = column_names)

                # Tasks For Only Logged In Users
                task = st.selectbox('Select Task',['Rent','Maintenance','Add pet','Delete pet','Add Guest','Delete Guest'])
                if task == "Rent":
                    rent = run_query("SELECT rent FROM MAY_RENT WHERE resident_id=(SELECT resident_id FROM Resident WHERE resident_name='{}');".format(user))
                    st.write("Your rent to be paid is:")
                    st.write(rent[0][0])
                if task == "Maintenance":
                    rent = run_query("SELECT amount FROM MAINTENANCE WHERE flat_no=(SELECT flat_no FROM Resident WHERE resident_name='{}');".format(user))
                    st.write("Your maintenance bill amounts to:")
                    st.write(rent[0][0])
                if task == "Add pet":
                    p_name = st.text_input("Enter pet name")
                    p_type = st.text_input("Enter pet type")
                    fl = run_query("SELECT flat_no FROM Resident WHERE resident_name='{}';".format(user))[0][0]
                    if st.button('Add') :
                        with conn.cursor() as c:
                            c.execute('INSERT INTO PETS(pet_name, pet_type, flat_no) VALUES (%s,%s,%s);',(str(p_name),str(p_type),str(fl)))
                            conn.commit()
                    rows = pd.DataFrame(run_query("SELECT pet_name,pet_type FROM PETS WHERE flat_no='{}';".format(fl)),columns=["Name","Type"])
                    st.write(rows)
                
                if task == "Add Guest":
                    p_name = st.text_input("Enter Guest name")
                    p_type = st.text_input("Enter Guest phone number")
                    fl = run_query("SELECT flat_no FROM Resident WHERE resident_name='{}';".format(user))[0][0]
                    if st.button('Add') :
                        with conn.cursor() as c:
                            c.execute('INSERT INTO GUESTS(guest_name, guest_phno, flat_no) VALUES (%s,%s,%s);',(str(p_name),str(p_type),str(fl)))
                            conn.commit()
                    rows = pd.DataFrame(run_query("SELECT guest_name,guest_phno FROM GUESTS WHERE flat_no='{}';".format(fl)),columns=["Name","Phone"])
                    st.write(rows)

                if task == "Delete pet":
                    p_name = st.text_input("Enter pet name")
                    fl = run_query("SELECT flat_no FROM Resident WHERE resident_name='{}';".format(user))[0][0]

                    if st.button('Delete') :
                        with conn.cursor() as c:
                            query="DELETE FROM PETS WHERE pet_name='{}';".format(str(p_name))
                            c.execute(query)
                            conn.commit()
                    rows = pd.DataFrame(run_query("SELECT pet_name,pet_type FROM PETS WHERE flat_no='{}';".format(fl)),columns=["Name","Type"])
                    st.write(rows)

                if task == "Delete Guest":
                    p_name = st.text_input("Enter Guest name")
                    fl = run_query("SELECT flat_no FROM Resident WHERE resident_name='{}';".format(user))[0][0]

                    if st.button('Delete') :
                        with conn.cursor() as c:
                            query="DELETE FROM GUESTS WHERE guest_name='{}';".format(str(p_name))
                            c.execute(query)
                            conn.commit()
                    rows = pd.DataFrame(run_query("SELECT guest_name,guest_phno FROM GUESTS WHERE flat_no='{}';".format(fl)),columns=["Name","Phone"])
                    st.write(rows)
elif choice == 'Sign up':
    st.subheader("Create an Account")
    new_user = st.text_input('Username')
    new_passwd = st.text_input('Password',type='password')
    if st.button('SignUp'):
        create_usertable()
        add_userdata(new_user,make_hashes(new_passwd))
        st.success("You have successfully created an account.Go to the Login Menu to login")
		
elif choice == 'About':
    st.subheader("Shoutout to our Maintenance Staff")
    rows = run_query("SELECT * from MAINTENANCE_STAFF;")
    a=pd.DataFrame(rows,columns=["index","Name","Role","Contact"])
    del a['index']
    st.write(a)
    st.header("")
    st.subheader("Made with :heart:")
    st.write("Abhijnya")
    st.write("Anagha")
    st.write("Aanchal")

elif choice=='Buy Now!':
    st.write("to do")