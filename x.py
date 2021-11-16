import streamlit as st
import pandas as pd
import numpy as np
import pickle as pkle
import os.path

st.title('Apartment Management System')



# create a button in the side bar that will move to the next page/radio button choice
next = st.sidebar.button('Go To')

# will use this list and next button to increment page, MUST BE in the SAME order
# as the list passed to the radio button
new_choice = ['Home','Facilities','Log In','Rent','Maintenance']

# This is what makes this work, check directory for a pickled file that contains
# the index of the page you want displayed, if it exists, then you pick up where the
#previous run through of your Streamlit Script left off,
# if it's the first go it's just set to 0
if os.path.isfile('next.p'):
    next_clicked = pkle.load(open('next.p', 'rb'))
    # check if you are at the end of the list of pages
    if next_clicked == len(new_choice):
        next_clicked = 0 # go back to the beginning i.e. homepage
else:
    next_clicked = 0 #the start

# this is the second tricky bit, check to see if the person has clicked the
# next button and increment our index tracker (next_clicked)
if next:
    #increment value to get to the next page
    next_clicked = next_clicked +1

    # check if you are at the end of the list of pages again
    if next_clicked == len(new_choice):
        next_clicked = 0 # go back to the beginning i.e. homepage

# create your radio button with the index that we loaded
choice = st.sidebar.radio("go to",('Home','Facilities','Log In','Rent','Maintenance'), index=next_clicked)

# pickle the index associated with the value, to keep track if the radio button has been used
pkle.dump(new_choice.index(choice), open('next.p', 'wb'))

# finally get to whats on each page
if choice == 'Home':
    st.write('this is home')
elif choice == 'Facilities':
    st.write('here is a Facilities page')
elif choice == 'Log In':
    st.write('A Log In of some sort')
elif choice == 'Rent':
    st.write('The Rent')
elif choice == 'Maintenance':
    st.write('Maintenance page')

# def fun():
#     st.write('fun click')
#     return
# if st.button("Click Func foo"):
#     fun()


# add_selectbox = st.sidebar.selectbox(

# )


# sideb = st.sidebar
# check1 = sideb.button("Facilities")
# check2 = sideb.button("Payment")
# check3 = sideb.button("Check or not?")




# if st.button('Say hello'):
#     st.write('Why hello there')
# else:
#     st.write('Goodbye')


