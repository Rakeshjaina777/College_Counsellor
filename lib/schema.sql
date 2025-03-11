-- 1. Create Users Table
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('student', 'mentor', 'admin') DEFAULT 'student',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Create Colleges Table
CREATE TABLE colleges (
    college_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(255),
    website VARCHAR(255),
    ranking INT CHECK (ranking BETWEEN 1 AND 1000),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Create Reviews Table (Students reviewing colleges)
CREATE TABLE reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    college_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (college_id) REFERENCES colleges(college_id) ON DELETE CASCADE
);

-- 4. Create Messages Table (For student-mentor communication)
CREATE TABLE messages (
    message_id INT PRIMARY KEY AUTO_INCREMENT,
    sender_id INT,
    receiver_id INT,
    message_text TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (receiver_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- 5. Create Authentication Logs Table
CREATE TABLE auth_logs (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    login_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ip_address VARCHAR(45),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- 6. Insert Sample Users
INSERT INTO users (name, email, password_hash, role) VALUES
('Rakesh Jain', 'rakesh@example.com', 'hashed_password1', 'admin'),
('John Doe', 'john.doe@example.com', 'hashed_password2', 'student'),
('Alice Smith', 'alice.smith@example.com', 'hashed_password3', 'mentor');

-- 7. Insert Sample Colleges
INSERT INTO colleges (name, location, website, ranking) VALUES
('IIIT Surat', 'Gujarat, India', 'https://iiitsurat.ac.in', 50),
('IIT Bombay', 'Mumbai, India', 'https://iitb.ac.in', 3),
('NIT Trichy', 'Tamil Nadu, India', 'https://nitt.edu', 12);

-- 8. Insert Sample Reviews
INSERT INTO reviews (user_id, college_id, rating, comment) VALUES
(2, 1, 5, 'Great faculty and research opportunities!'),
(3, 2, 4, 'Excellent placements but competitive environment.');

-- 9. Insert Sample Messages
INSERT INTO messages (sender_id, receiver_id, message_text) VALUES
(2, 3, 'Hi Alice, can you guide me on how to prepare for IIIT Surat?'),
(3, 2, 'Sure! I will share some tips soon.');

-- 10. Retrieve All Users
SELECT * FROM users;

-- 11. Retrieve All Colleges
SELECT * FROM colleges;

-- 12. Retrieve All Reviews for a Specific College
SELECT users.name, reviews.rating, reviews.comment 
FROM reviews 
JOIN users ON reviews.user_id = users.user_id 
WHERE college_id = 1;

-- 13. Retrieve All Messages between Two Users
SELECT sender_id, receiver_id, message_text, sent_at 
FROM messages 
WHERE (sender_id = 2 AND receiver_id = 3) 
   OR (sender_id = 3 AND receiver_id = 2)
ORDER BY sent_at;

-- 14. Count Number of Reviews per College
SELECT colleges.name, COUNT(reviews.review_id) AS review_count 
FROM colleges 
LEFT JOIN reviews ON colleges.college_id = reviews.college_id 
GROUP BY colleges.name;

-- 15. Get Top 3 Colleges Based on Reviews
SELECT colleges.name, AVG(reviews.rating) AS avg_rating 
FROM colleges 
JOIN reviews ON colleges.college_id = reviews.college_id 
GROUP BY colleges.name 
ORDER BY avg_rating DESC 
LIMIT 3;

-- 16. Get List of Students Who Have Not Reviewed Any College
SELECT users.name, users.email 
FROM users 
LEFT JOIN reviews ON users.user_id = reviews.user_id 
WHERE reviews.review_id IS NULL;

-- 17. Get List of Mentors
SELECT name, email FROM users WHERE role = 'mentor';

-- 18. Update College Ranking
UPDATE colleges SET ranking = 10 WHERE name = 'IIIT Surat';

-- 19. Delete a User and Cascade Data
DELETE FROM users WHERE email = 'john.doe@example.com';

-- 20. Delete a College and Its Reviews
DELETE FROM colleges WHERE name = 'NIT Trichy';

-- 21. Get Latest Login Attempt
SELECT users.name, auth_logs.login_time, auth_logs.ip_address
FROM auth_logs
JOIN users ON auth_logs.user_id = users.user_id
ORDER BY auth_logs.login_time DESC
LIMIT 1;

-- 22. Get Messages Sent by a Specific User
SELECT * FROM messages WHERE sender_id = 2;

-- 23. Get All Users Sorted by Registration Date
SELECT * FROM users ORDER BY created_at DESC;

-- 24. Find Users Who Logged In from Multiple IP Addresses
SELECT user_id, COUNT(DISTINCT ip_address) AS unique_ips 
FROM auth_logs 
GROUP BY user_id 
HAVING unique_ips > 1;

-- 25. View Top 5 Active Users (Users Who Sent Most Messages)
SELECT sender_id, COUNT(*) AS message_count 
FROM messages 
GROUP BY sender_id 
ORDER BY message_count DESC 
LIMIT 5;

-- 26. Get Number of Users Per Role
SELECT role, COUNT(*) AS user_count FROM users GROUP BY role;

-- 27. Get Number of Reviews Each User Has Written
SELECT users.name, COUNT(reviews.review_id) AS total_reviews
FROM users
LEFT JOIN reviews ON users.user_id = reviews.user_id
GROUP BY users.name
ORDER BY total_reviews DESC;

-- 28. Create an Index on Email for Faster Authentication
CREATE INDEX idx_users_email ON users(email);

-- 29. Get the Last 5 Reviews
SELECT users.name, reviews.rating, reviews.comment 
FROM reviews 
JOIN users ON reviews.user_id = users.user_id 
ORDER BY reviews.created_at DESC 
LIMIT 5;

-- 30. Archive Old Messages (Older than 1 Year)
DELETE FROM messages WHERE sent_at < NOW() - INTERVAL 1 YEAR;
