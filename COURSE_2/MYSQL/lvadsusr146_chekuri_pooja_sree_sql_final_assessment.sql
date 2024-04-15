-- Lab 1:
-- Create Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    address VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(15)
);

-- Insert data into Customers table
INSERT INTO Customers (customer_id, customer_name, address, email, phone_number) VALUES
(1, 'PharmaCo Inc.', '123 Pharma St., Pharma City', 'info@pharmaco.com', '123-456-7890'),
(2, 'MediCare Solutions', '456 Health Blvd., Medtown', 'contact@medicare.com', '234-567-8901'),
(3, 'PharmaPlus Ltd.', '789 Wellness Ave., Pharmaville', 'support@pharmaplus.com', '345-678-9012'),
(4, 'HealLife Pharmaceuticals', '987 Cure Road, Healville', 'info@heallife.com', '456-789-0123');

-- Create Products table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    product_category VARCHAR(50)
);

-- Insert data into Products table
INSERT INTO Products (product_id, product_name, product_category) VALUES
(101, 'Product A', 'Category 1'),
(102, 'Product B', 'Category 2'),
(103, 'Product C', 'Category 1'),
(104, 'Product D', 'Category 3'),
(105, 'Product E', 'Category 2'),
(106, 'Product F', 'Category 1'),
(107, 'Product G', 'Category 3'),
(108, 'Product H', 'Category 2');

-- Create Sales_Records table
CREATE TABLE Sales_Records (
    record_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    sales_amount DECIMAL(10, 2),
    sales_date DATE
);

-- Insert data into Sales_Records table
INSERT INTO Sales_Records (record_id, customer_id, product_id, sales_amount, sales_date) VALUES
(1, 1, 101, 1000.50, '2024-03-01'),
(2, 2, 102, 2000.75, '2024-03-02'),
(3, 1, 103, 1500.25, '2024-03-03'),
(4, 3, 104, 3000.00, '2024-03-04'),
(5, 4, 105, 1200.90, '2024-03-05'),
(6, 2, 106, 1800.30, '2024-03-06'),
(7, 1, 107, 2500.60, '2024-03-07'),
(8, 3, 108, 4000.75, '2024-03-08');



-- Lab 2:
CREATE TABLE Flights (
    flight_id INT PRIMARY KEY,
    flight_number VARCHAR(10),
    departure_airport VARCHAR(50),
    arrival_airport VARCHAR(50),
    departure_date DATE,
    arrival_date DATE,
    base_price DECIMAL(10, 2)
);

CREATE TABLE Passengers (
    passenger_id INT PRIMARY KEY,
    passenger_name VARCHAR(100),
    age INT,
    gender ENUM('Male', 'Female', 'Other'),
    frequent_flyer_status BOOLEAN
);

CREATE TABLE Tickets (
    ticket_id INT PRIMARY KEY,
    flight_id INT,
    passenger_id INT,
    ticket_price DECIMAL(10, 2),
    ticket_date DATE,
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id),
    FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id)
);


INSERT INTO Flights VALUES (1, 'FL123', 'JFK', 'LAX', '2024-04-01', '2024-04-01', 500.00);
INSERT INTO Flights VALUES (2, 'FL456', 'LAX', 'ORD', '2024-04-02', '2024-04-02', 400.00);
INSERT INTO Flights VALUES (3, 'FL789', 'ORD', 'DFW', '2024-04-03', '2024-04-03', 300.00);

INSERT INTO Passengers VALUES (1, 'John Doe', 35, 'Male', true);
INSERT INTO Passengers VALUES (2, 'Jane Smith', 28, 'Female', false);
INSERT INTO Passengers VALUES (3, 'Michael Johnson', 40, 'Male', true);

INSERT INTO Tickets VALUES (101, 1, 1, 500.00, '2024-03-30');
INSERT INTO Tickets VALUES (102, 2, 2, 400.00, '2024-03-31');
INSERT INTO Tickets VALUES (103, 3, 3, 300.00, '2024-04-01');
INSERT INTO Tickets VALUES (104, 1, 2, 500.00, '2024-03-30');
INSERT INTO Tickets VALUES (105, 2, 3, 400.00, '2024-03-31');
INSERT INTO Tickets VALUES (106, 3, 1, 300.00, '2024-04-01');

-- Lab3:
-- Create Players table
CREATE TABLE Players (
    player_id INT PRIMARY KEY,
    player_name VARCHAR(255),
    player_email VARCHAR(255),
    registration_date DATE
);

-- Create Games table
CREATE TABLE Games (
    game_id INT PRIMARY KEY,
    game_name VARCHAR(255),
    game_genre VARCHAR(255),
    release_date DATE
);

-- Create PlayerScores table
CREATE TABLE PlayerScores (
    score_id INT PRIMARY KEY,
    player_id INT,
    game_id INT,
    score INT,
    play_date DATE,
    FOREIGN KEY (player_id) REFERENCES Players(player_id),
    FOREIGN KEY (game_id) REFERENCES Games(game_id)
);



-- Insert statements for Players table
INSERT INTO Players (player_id, player_name, player_email, registration_date) VALUES
(1, 'John Doe', 'johndoe@example.com', '2023-01-15'),
(2, 'Jane Smith', 'janesmith@example.com', '2023-02-20'),
(3, 'Mark Johnson', 'markjohnson@example.com', '2023-03-10');

-- Insert statements for Games table
INSERT INTO Games (game_id, game_name, game_genre, release_date) VALUES
(1, 'Fortnite', 'Battle Royale', '2020-07-25'),
(2, 'Minecraft', 'Sandbox', '2011-11-18'),
(3, 'League of Legends', 'MOBA', '2009-10-27');

-- Insert statements for PlayerScores table
INSERT INTO PlayerScores (score_id, player_id, game_id, score, play_date) VALUES
(1, 1, 1, 250, '2023-01-20'),
(2, 1, 2, 500, '2023-02-01'),
(3, 2, 1, 300, '2023-02-15'),
(4, 2, 3, 700, '2023-03-05'),
(5, 3, 1, 400, '2023-03-20'),
(6, 3, 2, 600, '2023-03-25'),
(7, 3, 3, 800, '2023-04-01');


-- Lab 4:
-- Create Patients table
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    admission_date DATE,
    discharge_date DATE,
    diagnosis VARCHAR(100),
    bill_amount DECIMAL(10, 2)
);

-- Insert data into Patients table
INSERT INTO Patients (patient_id, patient_name, age, gender, admission_date, discharge_date, diagnosis, bill_amount)
VALUES
    (1, 'John Doe', 45, 'Male', '2023-01-15', '2023-01-30', 'Hypertension', 1500.00),
    (2, 'Jane Smith', 30, 'Female', '2023-02-10', '2023-02-20', 'Diabetes', 2000.00),
    (3, 'Michael Johnson', 65, 'Male', '2023-03-05', '2023-03-20', 'Stroke', 3500.00),
    (4, 'Emily Wilson', 50, 'Female', '2023-04-12', '2023-04-25', 'Pneumonia', 2800.00),
    (5, 'David Brown', 55, 'Male', '2023-05-20', '2023-06-05', 'Heart Attack', 5000.00);

-- Create Doctors table
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(50),
    specialization VARCHAR(50),
    years_of_experience INT
);

-- Insert data into Doctors table
INSERT INTO Doctors (doctor_id, doctor_name, specialization, years_of_experience)
VALUES
    (101, 'Dr. Smith', 'Cardiology', 10),
    (102, 'Dr. Johnson', 'Neurology', 15),
    (103, 'Dr. Brown', 'Endocrinology', 8),
    (104, 'Dr. Wilson', 'Pulmonology', 12),
    (105, 'Dr. White', 'Internal Medicine', 5);

-- Create Treatments table
CREATE TABLE Treatments (
    treatment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    treatment_name VARCHAR(100),
    treatment_date DATE,
    cost DECIMAL(10, 2),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- Insert data into Treatments table
INSERT INTO Treatments (treatment_id, patient_id, doctor_id, treatment_name, treatment_date, cost)
VALUES
    (1, 1, 101, 'Angioplasty', '2023-01-20', 5000.00),
    (2, 2, 103, 'Insulin Therapy', '2023-02-15', 1000.00),
    (3, 3, 102, 'Physical Therapy', '2023-03-10', 2000.00),
    (4, 4, 104, 'Oxygen Therapy', '2023-04-15', 1500.00),
    (5, 5, 101, 'Heart Surgery', '2023-05-25', 10000.00);

-- Lab 5:
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    major VARCHAR(50),
    enrollment_year INT
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    credits INT,
    department VARCHAR(50)
);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    grade DECIMAL(4,2),
    semester VARCHAR(10),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);



-- Inserting data into the Students table
INSERT INTO Students (student_id, student_name, major, enrollment_year) VALUES
(1, 'John Doe', 'Computer Science', 2020),
(2, 'Jane Smith', 'Biology', 2021),
(3, 'Alice Johnson', 'History', 2019),
(4, 'Michael Brown', 'Mathematics', 2020),
(5, 'Emily Wilson', 'Psychology', 2021),
(6, 'David Lee', 'Economics', 2019);

-- Inserting data into the Courses table
INSERT INTO Courses (course_id, course_name, credits, department) VALUES
(101, 'Introduction to Computer Science', 3, 'Computer Science'),
(102, 'Cell Biology', 4, 'Biology'),
(103, 'World History', 3, 'History'),
(104, 'Calculus I', 4, 'Mathematics'),
(105, 'Introduction to Psychology', 3, 'Psychology'),
(106, 'Microeconomics', 3, 'Economics');

-- Inserting data into the Enrollments table
INSERT INTO Enrollments (enrollment_id, student_id, course_id, grade, semester) VALUES
(1, 1, 101, 85.0, 'Fall'),
(2, 1, 104, 78.5, 'Fall'),
(3, 2, 102, 92.0, 'Spring'),
(4, 3, 103, 88.5, 'Fall'),
(5, 3, 106, 95.0, 'Spring'),
(6, 4, 101, 90.0, 'Fall'),
(7, 4, 104, 85.5, 'Spring'),
(8, 5, 105, 87.5, 'Fall'),
(9, 5, 106, 91.0, 'Spring'),
(10, 6, 106, 94.0, 'Fall');

SELECT product_category,AVG(sales_amount) FROM products p JOIN sales_records
USING(product_id) JOIN customers USING(customer_id) WHERE customer_name='PharmaCo Inc.'
AND sales_date>date_sub(current_date(), INTERVAL 1 MONTH) GROUP BY product_category;

WITH RANK_TABLE AS
(SELECT product_name,sales_amount,RANK() OVER (ORDER BY sales_amount DESC) as ranking
FROM products p 
JOIN sales_records s USING(product_id) WHERE YEAR(sales_date)=YEAR(NOW()))
SELECT product_name,ranking FROM RANK_TABLE
ORDER BY ranking limit 3;
;

SET @total_sales := (SELECT SUM(sales_amount) FROM sales_records);
WITH percentage AS
(SELECT customer_id,customer_name,
(SUM(sales_amount)/@total_sales)*100 AS percentage_contribution
FROM sales_records JOIN customers USING(customer_id) 
GROUP BY customer_id,customer_name)
SELECT customer_id,customer_name,percentage_contribution,
RANK() OVER(ORDER BY percentage_contribution DESC) FROM percentage;

WITH buyers AS 
(SELECT customer_id,customer_name,COUNT(
CASE WHEN sales_date BETWEEN '2024-04-01' AND '2024-04-30' THEN 1
WHEN sales_date BETWEEN '2024-03-01' AND '2024-03-31' THEN 1
WHEN sales_date BETWEEN '2024-02-01' AND '2024-02-29' THEN 1
WHEN sales_date BETWEEN '2024-01-01' AND '2024-01-31' THEN 1
WHEN sales_date BETWEEN '2023-12-01' AND '2023-12-31' THEN 1
WHEN sales_date BETWEEN '2023-11-01' AND '2023-11-30' THEN 1
ELSE 0 END)AS count_times FROM customers JOIN sales_records USING(customer_id) 
GROUP BY customer_id,customer_name)
SELECT customer_id,customer_name,
(CASE WHEN count_times>=4 THEN 'Consistent Buyers'
ELSE 'Occasional Buyers' END ) AS type_of_buyers FROM buyers;

SELECT CONCAT(departure_airport,'-',arrival_airport) AS flight_route,
AVG(ticket_price)
FROM tickets t JOIN flights f USING(flight_id)
GROUP BY departure_airport,arrival_airport;

SELECT flight_number,departure_date,
count(*) OVER (PARTITION BY flight_number) AS tickets_sold
FROM tickets t JOIN flights f USING(flight_id)
WHERE YEAR(departure_date)=YEAR(current_date()) AND 
MONTH(departure_date)=MONTH(current_date())-1
ORDER BY tickets_sold;

SELECT DISTINCT passenger_name,
SUM(ticket_price) OVER (Partition by passenger_name) AS total_amount_spent,
frequent_flyer_status
FROM passengers join tickets USING(passenger_id) 
ORDER BY total_amount_spent DESC LIMIT 5;

SELECT MONTH(ticket_date) AS month ,COUNT(*) AS no_of_tickets_sold_in_month
FROM tickets
GROUP BY MONTH(ticket_date)
ORDER BY COUNT(*) DESC limit 1;

SELECT player_name,game_genre,
AVG(datediff(play_date,registration_date)) FROM playerscores JOIN games USING(game_id)
JOIN players USING(player_id) 
GROUP BY player_name,game_genre;

SELECT game_name,count(distinct player_id) as no_of_players FROM playerscores join games USING(game_id)
GROUP BY game_name
ORDER BY no_of_players desc limit 3;

SELECT game_name,AVG(score) AS avg_score,MAX(score) as max_score,
count(distinct player_id) as no_of_players
FROM playerscores join games USING(game_id)
GROUP BY game_name;

SELECT player_name,registration_date,MAX(play_date) 
FROM playerscores JOIN games USING(game_id)
JOIN players USING(player_id) 
GROUP BY player_name HAVING MAX(play_date)<date_sub(current_date(), INTERVAL 1 MONTH);

SELECT doctor_id,doctor_name,sum(cost) as total_cost 
FROM treatments t JOIN doctors d USING(doctor_id)
GROUP BY doctor_id,doctor_name
order by total_cost desc ;

SELECT treatment_name,SUM(cost),
(SUM(cost)/(SELECT SUM(cost) FROM treatments))*100 as percentage
FROM treatments group by treatment_name;

SELECT patient_id,patient_name,admission_date,discharge_date FROM patients
WHERE patient_id IN 
(SELECT patient_id FROM patients GROUP BY patient_id having count(*)>2);

SELECT gender,diagnosis, AVG(DATEDIFF(discharge_date,admission_date))
OVER(PARTITION BY gender,diagnosis) FROM patients;

select department,semester,AVG(grade)
OVER (PARTITION BY department,semester)
from enrollments JOIN courses using(course_id);

SELECT distinct major,COUNT(*) OVER (PARTITION by major,enrollment_year) as total_students_enrolled,
enrollment_year
from enrollments JOIN students using(student_id);

SELECT student_id,student_name,semester,sum(credits)
from enrollments JOIN students using(student_id) 
JOIN courses USING(course_id) 
GROUP BY student_id,student_name,semester 
HAVING sum(credits)>50;

WITH TOP AS
(SELECT course_name,enrollment_year,COUNT(*) AS students_enrolled
from enrollments JOIN students using(student_id) 
JOIN courses USING(course_id)
GROUP BY course_name,enrollment_year)
SELECT course_name,enrollment_year,students_enrolled,
RANK() OVER (PARTITION BY enrollment_year ORDER BY students_enrolled DESC) AS rank_
FROM TOP;


