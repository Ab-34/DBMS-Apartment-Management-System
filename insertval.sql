\c t_15_57_59
INSERT INTO MAINTENANCE_STAFF(staff_id, staff_name , staff_duty, staff_phno)
VALUES 
(1,'Simran','housekeeping','9999999999'),
(2,'Ritu','housekeeping','7234567890'),
(3,'Raju','gardener','8245783691'),
(4,'Sooraj','security','8456123789'),
(5,'Narendar','security','9856321475'),
(6,'Nisha','electrician','7412583695'),
(7,'Sandeep','plumber','9856321473'),
(8,'Amarjeeth','garbage collector','8456123790'),
(9,'Rithika','security','7412583692'),
(10,'Prathap','housekeeping','7481592635');

INSERT INTO BLOCK(bl_name, bl_number)
VALUES
('A',1),
('B',2),
('C',3),
('D',4);

INSERT INTO FLATS(size,no_of_rooms,flat_no,bl_no)
VALUES
(1500,3,'AG05',1),
(1200,2,'AS05',1),
(1000,2,'AS03',1),
(1250,1,'BT03',2),
(1450,4,'BG04',2),
(900,1,'BF03',2),
(1500,3,'CS07',3),
(1400,2,'CF06',3),
(1000,2,'CG10',3),
(950,2,'DG15',4),
(2050,4,'AT05',3),
(1050,3,'BR06',1);

INSERT INTO OWNER(owner_id, owner_name, owner_ph_no, owner_addr, flat_no)
VALUES
(1,'Pitambar','888888888',ROW('s1','s2',560012,'Karnataka'),'AG05'),
(2, 'Ranj', '7777777777',ROW('s2','s3',560082,'Karnataka'),'AS05'),
(3,'Kesari','8787878787',ROW('s4','s5',560014,'Karnataka'),'AS03'),
(4,'Shiv','7575757575',ROW('s6','s7',560042,'Karnataka'),'BT03'),
(5,'Sunil','7373737373',ROW('s8','s2',560089,'Karnataka'),'BG04'), 
(6,'Narayani','7473727171',ROW('s4','s7',560022,'Karnataka'),'BF03'),
(7,'Trishna','6234578123',ROW('s6','s2',560098,'Karnataka'),'CS07'),
(8,'Neelima','8484848484',ROW('s11','s2',560016,'Karnataka'),'CF06'), 
(9,'Prabhu','7172737475',ROW('s1201','s122',560052,'Karnataka'),'CG10'),
(10,'Susheel','7475767879',ROW('s14','s75',560075,'Karnataka'),'DG15'),
(11,'Abhijit','7624888570',ROW('s4','s70',560005,'Karnataka'),'AT05'),
(12,'Aditi','9575889345',ROW('s10','s84',560012,'Karnataka'),'BR06') ;

INSERT INTO OWNED_BY(owner_id,flat_no,cost)
VALUES
(1,'AG05',8000000),
(2,'AS05',7000000),
(3,'AS03',6000000),
(4,'BT03',7200000),
(5,'BG04',7900000),
(6,'BF03',5000000),
(7,'CS07',8000000),
(8,'CF06',7500000),
(9,'CG10',6000000),
(10,'DG15',5500000),
(11,'AT05',9900000),
(12,'BR06',8300000)
;

INSERT INTO RESIDENT(resident_id, resident_name, r_phno, flat_no)
VALUES
(1,'Pitambar','888888888','AG05'), 
(2, 'Ranj', '7777777777','AS05'),
(3,'Kesari','8787878787','AS03'),
(4,'Shiv','7575757575','BT03'),
(5,'Sunil','7373737373','BG04'), 
(6,'Narayani','7473727171','BF03'),
(7,'Trishna','6234578123','CS07'),
(8,'Yamuna','7574767172','CF06'),
(9,'Maya','8485868789','CG10'),
(10,'Dilip','98979695','DG15');

INSERT INTO MAY_RENT(owner_id, flat_no, resident_id, rent)
VALUES
(1, 'CF06', 1, 70000.00),
(2, 'CF06', 2, 90000.00),
(3, 'CF06', 3, 40000.00),
(4, 'CF06', 4, 35000.00),
(5, 'CF06', 5, 25000.00),
(6, 'CF06', 6, 55000.00),
(7, 'CF06', 7, 30000.00),
(8, 'CF06', 8, 30000.00),
(9, 'CG10', 9, 20000.00),
(10, 'DG15', 10, 15000.00);

INSERT INTO MAINTENANCE(mb_id, due_date, amount , flat_no)
VALUES
(1,'2021-10-12',4500.00,'AG05'),
(2,'2021-10-12',3600.00,'AS05'),
(3,'2021-10-12',3000.00,'AS03'),
(4,'2021-10-12',3750.00,'BT03'), 
(5,'2021-10-12',4350.00,'BG04'), 
(6,'2021-10-12',2700.00,'BF03'),
(7,'2021-10-12',4500.00,'CS07'),
(8,'2021-10-12',4200.00,'CF06'),
(9,'2021-10-12',3000.00,'CG10'),
(10,'2021-10-12',2870.00,'DG15');

INSERT INTO FACILITIES(fac_id, fac_name, type)
VALUES
(1, 'Swimming Pool','Outdoor'),
(2, 'Club House','Indoor'),
(3, 'Play Ground', 'Outdoor'),
(4, 'Play Ground', 'Indoor'),
(5, 'Gym', 'Outdoor'),
(6, 'Gym', 'Indoor'),
(7, 'Badminton Court' , 'Outdoor'),
(8, 'Football Ground', 'Outdoor'),
(9, 'Tennis Court', 'Indoor'),
(10, 'Squash Court','Indoor');

INSERT INTO CAN_USE(fac_id, resident_id, entry_time, exit_time)
VALUES
(1, 4, '2021-10-05 14:00:00', '2021-10-05 14:47:00'),
(2, 5, '2021-10-05 11:00:00', '2021-10-05 14:00:00'),
(3, 7, '2021-10-05 14:00:00', '2021-10-05 14:00:00'),
(4, 9, '2021-10-05 16:00:00', '2021-10-05 18:00:00'),
(6, 8, '2021-10-05 16:00:00', '2021-10-05 18:00:00'),
(6, 2, '2021-10-05 16:00:00', '2021-10-05 18:00:00'),
(10, 1, '2021-10-05 19:00:00', '2021-10-05 19:45:00'),
(10, 9, '2021-10-05 19:00:00', '2021-10-05 19:45:00'),
(7, 7, '2021-10-05 18:00:00', '2021-10-05 20:00:00'),
(7, 3, '2021-10-05 18:00:00', '2021-10-05 20:00:00');

INSERT INTO PETS(pet_name, pet_type, flat_no)
VALUES
('jojo','dog','AG05'),
('mars','dog','AG05'),
('krystal','cat','BF03'),
('bruno','hamster','BF03'),
('crimson','dog','CF06'),
('cody','cat','DG15');

INSERT INTO GUESTS(guest_name, guest_phno, flat_no)
VALUES
('Jeevan', '9438342412', 'AG05'),
('Krishna', '8675546534', 'BF03'),
('Jnana' , '8643513421', 'CG10');


INSERT INTO PARKING_SPOT(veh_no, flat_no, veh_type)
VALUES
('KA05MA1234','AG05','Car'),
('KA32PL4342','BT03','Scooter'),
('KA15MW6798','CS07','Car'),
('KA12AB1314','DG15','Scooter'),
('KA01KN9890','BF03','Car');

INSERT INTO COMM_MEM(mem_name, mem_role, mem_id)
VALUES
('Pitambar','housekeeping head',1),
('Kesari','security head',3),
('Sunil','utilities head',5),
('Maya','chairperson',9);

INSERT INTO MAINTAINED_BY(staff_id,mem_id,hours,wage)
VALUES
(1,1,120,20000.00),
(2,1,120,20000.00),
(3,5,60,20000.00),
(4,3,240,20000.00),
(5,3,240,20000.00),
(6,5,25,16000.00),
(7,5,45,12000.00),
(8,5,25,10000.00),
(9,3,240,20000.00),
(10,1,120,20000.00);
