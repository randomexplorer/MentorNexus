-- Sample data for SwasthSaarthi application

-- Create Residents table if not exists
CREATE TABLE IF NOT EXISTS Resident (
    resident_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    village_name VARCHAR(100) NOT NULL,
    gender VARCHAR(10),
    phone VARCHAR(15),
    email VARCHAR(100),
    password VARCHAR(100) NOT NULL,
    dob DATE
);

-- Create HealthWorker table if not exists
CREATE TABLE IF NOT EXISTS HealthWorker (
    health_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    village_name VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100),
    password VARCHAR(100) NOT NULL
);

-- Insert sample Residents
INSERT INTO Resident (name, village_name, gender, phone, email, password, dob) VALUES
('Arjun Singh', 'Mohanbari', 'Male', '9876543210', 'arjun@example.com', 'password123', '1992-05-15'),
('Priya Sharma', 'Tilakpur', 'Female', '8765432109', 'priya@example.com', 'password123', '1995-08-22'),
('Ravi Kumar', 'Ganeshpur', 'Male', '7654321098', 'ravi@example.com', 'password123', '1988-11-30'),
('Meera Patel', 'Chandanpur', 'Female', '6543210987', 'meera@example.com', 'password123', '1990-03-10'),
('Vijay Tiwari', 'Sitapur', 'Male', '5432109876', 'vijay@example.com', 'password123', '1985-07-05');

-- Insert sample HealthWorkers
INSERT INTO HealthWorker (name, specialization, village_name, phone, email, password) VALUES
('Dr. Rajesh Khanna', 'General Physician', 'Mohanbari', '9876123450', 'rajesh@hospital.com', 'doctor123'),
('Dr. Sunita Gupta', 'Gynecologist', 'Tilakpur', '8765123459', 'sunita@hospital.com', 'doctor123'),
('Dr. Anil Verma', 'Pediatrician', 'Ganeshpur', '7654123458', 'anil@hospital.com', 'doctor123'),
('Dr. Neha Shah', 'Dentist', 'Chandanpur', '6543123457', 'neha@hospital.com', 'doctor123'),
('Nurse Kavita Yadav', 'Nursing', 'Sitapur', '5432123456', 'kavita@hospital.com', 'nurse123');
