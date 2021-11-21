DROP DATABASE t_15_57_59; 

CREATE DATABASE t_15_57_59;

\c t_15_57_59 

CREATE TYPE addr AS(addrl1 varchar(25),addrl2 varchar(25), pincode INT, state varchar(25));

CREATE TABLE MAINTENANCE_STAFF(staff_id int, staff_name varchar(25), staff_duty varchar(25), staff_phno CHAR(10),PRIMARY KEY(staff_id)); 

CREATE TABLE block(bl_name varchar(15), bl_number INT, PRIMARY KEY(bl_number));

CREATE TABLE FLATS(size INT, no_of_rooms INT , flat_no varchar(25),bl_no int, foreign key(bl_no) references block(bl_number), PRIMARY KEY(flat_no));

CREATE TABLE OWNER(owner_id INT NOT NULL,  owner_name varchar(30),owner_ph_no char(10) not null ,owner_addr varchar(100) , PRIMARY KEY(owner_id), flat_no varchar(25), FOREIGN KEY(flat_no)  references flats(flat_no));

CREATE TABLE OWNED_BY(owner_id INT references OWNER(owner_id), flat_no varchar(25), FOREIGN KEY(flat_no) references FLATS(flat_no), cost int, PRIMARY KEY(owner_id, flat_no));

CREATE TABLE RESIDENT(resident_id INT, resident_name varchar(25), r_phno char(10), flat_no varchar(25), FOREIGN KEY(flat_no)  references FLATS(flat_no),PRIMARY KEY(resident_id));

CREATE TABLE MAY_RENT(owner_id INT, FOREIGN KEY(owner_id) references OWNER(owner_id), flat_no varchar(25), FOREIGN KEY(flat_no) references FLATS(flat_no), resident_id int, FOREIGN KEY(resident_id) references RESIDENT(resident_id), rent decimal(7,2), PRIMARY KEY(owner_id, resident_id));

CREATE TABLE MAINTENANCE(mb_id INT , due_date DATE , amount DECIMAL(7,2), flat_no varchar(25), FOREIGN KEY(flat_no) references flats(flat_no),PRIMARY KEY(mb_id,flat_no) );

CREATE TABLE FACILITIES(fac_id INT, fac_name varchar(25), type varchar(25),PRIMARY KEY(fac_id));

CREATE TABLE CAN_USE(fac_id int, FOREIGN KEY(fac_id) references FACILITIES(fac_id), resident_id int, foreign  key(resident_id) references RESIDENT(resident_id), entry_time timestamp,exit_time timestamp, PRIMARY KEY(fac_id, resident_id)); 

CREATE TABLE PETS(pet_name varchar(25), pet_type varchar(25), flat_no varchar(25), FOREIGN KEY(flat_no) references flats(flat_no) , PRIMARY KEY(pet_name,flat_no));

CREATE TABLE GUESTS(guest_name varchar(25), guest_phno char(10),flat_no varchar(25), FOREIGN KEY(flat_no)  references flats(flat_no),PRIMARY KEY(flat_no,guest_phno));


CREATE TABLE PARKING_SPOT(veh_no varchar(10),flat_no varchar(25), foreign key(flat_no)  references flats(flat_no), veh_type varchar(25), PRIMARY KEY(veh_no, flat_no));

CREATE TABLE COMM_MEM(mem_name varchar(25), mem_role varchar(25), mem_id INT, foreign key(mem_id) references resident(resident_id), PRIMARY KEY(mem_id));

CREATE TABLE MAINTAINED_BY(hours int,wage DECIMAL(7,2), staff_id int, foreign key(staff_id) references MAINTENANCE_STAFF(staff_id), mem_id INT, foreign key(mem_id) references COMM_MEM(mem_id),PRIMARY KEY(mem_id,staff_id));
