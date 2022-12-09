-- Table 1
CREATE TABLE admins(
	id inT UNIQUE NOT NULL PRIMARY KEY,
	name varchar(255) NOT NULL,
	email varchar(255) NOT NULL,
	pasword varchar(255) NOT NULL,
	location varchar(255) NOT NULL
);
--inserting data into table1
INSERT INTO admins(id,name,email,pasword,location)
VALUES(1,'Obbo John','obbo.john@gmail.com','john', 'Kawempe'),
(2,'Abbo Jane','abbo.jane@gmail.com','jane', 'jane'),
(3,'Adee Joyce','adee.joyce@gmail.com','joyce', 'Jinja'),
(4,'Ojupa Yoweri','yoweri@gmail.com','yoweri', 'Tororo'),
(5,'Akello Mary','mary@gmail.com','mary', 'Mbale');
--selecting from table 1
SELECT * FROM admins

-- Table 2
CREATE TABLE venders(
	id inT UNIQUE NOT NULL PRIMARY KEY,
	name varchar(255) NOT NULL,
	email varchar(255) NOT NULL,
	passwoord varchar(255) NOT NULL,
	contact bigint NOT NULL,
	location varchar(255) NOT NULL
);
--inserting data into table2
INSERT INTO venders(id,name,email,passwoord, contact,location)
VALUES(1,'Mugisha John','john@gmail.com','john@',0787807880, 'Kawempe'),
(2,'Awor Jane','awor.jane@gmail.com','jane@','0787807881', 'Jinja'),
(3,'Adon Joyce','adon.joyce@gmail.com','joyce@','0787807882', 'Jinja'),
(4,'Ojupa Miff','miff@gmail.com','miff@','0787807883', 'Kawempe'),
(5,'Akol Mary','akol.mary@gmail.com','mary@',0787807884, 'Mbale');
--selecting all from venders
SELECT * FROM venders

-- -- Table 3
    CREATE TABLE products(
	id inT UNIQUE NOT NULL PRIMARY KEY,
	name varchar(255) NOT NULL,
	price bigint NOT NULL,
	description varchar(255) NOT NULL,
	image varchar(255)NULL,
	posted varchar(255) NOT NULL,
	admins_id int NOT NULL,
	customers_id int NOT NULL,
	delivery_men_id int NOT NULL,
	venders_id int NOT NULL,
	wishlists_id int NOT NULL,
	catergories_id int NOT NULL,
	FOREIGN KEY(id) REFERENCES admins(id),
	FOREIGN KEY(id) REFERENCES customers(id),
	FOREIGN KEY(id) REFERENCES delivery_men(id),
	FOREIGN KEY(id) REFERENCES venders(id),
	FOREIGN KEY(id) REFERENCES wishlists(id),
	FOREIGN KEY(id) REFERENCES catergories(id)
);
--inserting data into table3
INSERT INTO products(id,name,price,description, image,posted,admins_id,customers_id,delivery_men_id,venders_id,wishlists_id,catergories_id)
VALUES(1,'apples',1000,'fruit','','venders',1,1,1,1,1,1),
(2,'bananas',200,'fruit','','admins', 2,2,2,2,2,2),
(3,'cakes',5000,'snack','','venders', 3,3,3,3,3,3);
--selecting all from products
SELECT * FROM products

-- Table 4
CREATE TABLE catergories(
	id inT UNIQUE NOT NULL PRIMARY KEY,
	name varchar(255) NOT NULL
);
--inserting data into table 4
INSERT INTO catergories(id,name)
VALUES(1,'fruits'),
(2,'meats'),
(3,'snacks');

--selecting all from table 4
SELECT * FROM catergories

-- Table 5
CREATE TABLE customers(
	id inT UNIQUE NOT NULL PRIMARY KEY,
	name varchar(255) NOT NULL,
	email varchar(255)NOT NULL,
	password varchar(255) NOT NULL,
	location varchar(255) NOT NULL,
	delivery_men_id int NOT NULL,
	payments_id int NOT NULL,
	FOREIGN KEY(id) REFERENCES delivery_men(id),
	FOREIGN KEY(id) REFERENCES payments(id)
);
--inserting data into table 5
INSERT INTO customers(id,name,email,password,location,delivery_men_id,payments_id)
VALUES(1,'Aki Doreen','doreen@gmail.com','doreen','Kawempe',1,1),
(2,'Nata July','july@gmail.com','julye','Jinja',2,2),
(3,'Natal Lain','natal@gmail.com','natal','Kawempe',3,3),
(4,'Odon Micky','micky@gmail.com','micky','Tororo',4,4),
(5,'Odonji Loves','loves@gmail.com','loves','Mukono',5,5);
--selecting all from table 9
SELECT * FROM customers

-- Table 6
CREATE TABLE wishlists(
	id inT UNIQUE NOT NULL PRIMARY KEY,
	name varchar(255) NOT NULL
);
--inserting data into table 6
INSERT INTO wishlists(id,name)
VALUES(1,'apples'),
(2,'bananas'),
(3,'oranges'),
(4,'cakes'),
(5,'yam');

--selecting all from table 6
SELECT * FROM wishlists 

-- Table 7
CREATE TABLE orders(
	id inT UNIQUE NOT NULL PRIMARY KEY,
	name varchar(255) NOT NULL,
	status varchar(255) NOT NULL,
	admins_id int NOT NULL,
	FOREIGN KEY(id) REFERENCES admins(id)
);
--inserting data into table 7
INSERT INTO orders(id,name,status,admins_id)
VALUES(1,'apples','pending',1),
(2,'bananas','confirmed',2),
(3,'cakes','pending',3),
(4,'yam','pending',4),
(5,'avoccado','confirmed',5);
--selecting all from table 7
SELECT * FROM orders 

-- -- Table 8
CREATE TABLE payments(
	id inT UNIQUE NOT NULL PRIMARY KEY,
	name varchar(255) NOT NULL,
	admins_id int NOT NULL,
	orders_id int NOT NULL,
	FOREIGN KEY(id) REFERENCES admins(id),
	FOREIGN KEY(id) REFERENCES orders(id)
);
--inserting data into table 8
INSERT INTO payments(id,name,admins_id,orders_id)
VALUES(1,'full',1,1),
(2,'half',2,2),
(3,'full',3,3),
(4,'half',4,4),
(5,'full',5,5);
--selecting all from table 7
SELECT * FROM payments 

-- Table 9
CREATE TABLE delivery_men(
	id inT UNIQUE NOT NULL PRIMARY KEY,
	name varchar(255) NOT NULL,
	email varchar(255)NOT NULL,
	password varchar(255) NOT NULL,
	contact bigint NOT NULL,
	location varchar(255) NOT NULL,
	admins_id int NOT NULL,
	orders_id int NOT NULL,
	FOREIGN KEY(id) REFERENCES admins(id),
	FOREIGN KEY(id) REFERENCES orders(id)
);
--inserting data into table 9
INSERT INTO delivery_men(id,name,email,password, contact, location, admins_id,orders_id)
VALUES(1,'Odongo Lucky','lucky@gmail.com','lucky',0751304593,'Kawempe',1,1),
(2,'Obong Luke','lucke@gmail.com','lucke',0751304594,'Jinja',2,2),
(3,'Odio Lain','lain@gmail.com','lain',0751304595,'Kawempe',3,3),
(4,'Odon Mike','mike@gmail.com','mike',0751304596,'Tororo',4,4),
(5,'Odonji Louse','louse@gmail.com','louse',0751304597,'Mukono',5,5);
--selecting all from table 9
SELECT * FROM delivery_men 

-- -- Table 10
CREATE TABLE grocerise_table(
	id inT UNIQUE NOT NULl PRIMARY KEY,
	admins_id int NOT NULL,
	products_id int NOT NULL,
	customers_id int NOT NULL,
	delivery_men_id int NOT NULL,
	venders_id int NOT NULL,
	FOREIGN KEY(id) REFERENCES admins(id),
	FOREIGN KEY(id) REFERENCES products(id),
	FOREIGN KEY(id) REFERENCES customers(id),
	FOREIGN KEY(id) REFERENCES delivery_men(id),
	FOREIGN KEY(id) REFERENCES venders(id)
);
--inserting data into table 10
INSERT INTO grocerise_table(id,admins_id,products_id,customers_id,delivery_men_id,venders_id)
VALUES(1,1,1,1,1,1),
(2,2,2,2,2,2),
(3,3,3,3,3,3);

--selecting all from table 7
SELECT * FROM grocerise_table 


--dropped table 11 after i had created at first
DROP TABLE users;


-- Table 11 being re_created
CREATE TABLE users(
	id inT UNIQUE NOT NULL PRIMARY KEY,
	type varchar(255) NOT NULL
);
--inserting data into table 11
INSERT INTO users(id,type)
VALUES(1,'venders'),
(2,'delivery_men'),
(3,'admin'),
(4,'customers');

--selecting all from table 11
SELECT * FROM users

--Question1-ii
--making ordes
SELECT name FROM orders
WHERE status='confirmed';

--Question1-iii
--selecting products posted by admin
SELECT name FROM products
WHERE posted='admins'

--Question1-iv
--selecting products posted by venders
SELECT name FROM products
WHERE posted='vender'

--Question1-vi
--selecting all users where type is venders
SELECT * FROM users
WHERE type='venders';

--Question1-vii
--selecting all users where type is admin and customers
SELECT * FROM users
WHERE type= 'admin' AND type='customers';



















