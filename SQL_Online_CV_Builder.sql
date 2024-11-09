CREATE DATABASE Online_CV_Builder
GO

USE Online_CV_Builder
GO

--Users Table
CREATE TABLE Users (
    user_ID INT PRIMARY KEY NOT NULL,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL,
    full_name VARCHAR(100),
    phone_number VARCHAR(15)
);
GO

--CV Table
CREATE TABLE CV (
    cv_ID INT PRIMARY KEY NOT NULL,
	user_ID INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    summary TEXT
);
ALTER TABLE CV
ADD CONSTRAINT fk_usercv_id
FOREIGN KEY (user_ID) REFERENCES Users(user_ID);
GO

--Section Table
CREATE TABLE Section (
    section_ID INT PRIMARY KEY NOT NULL,
    section_type NVARCHAR(50) NOT NULL,
    content TEXT,
    ordered INT
);
GO

--Comment Table
CREATE TABLE Comment (
    comment_ID INT PRIMARY KEY NOT NULL,
    cv_ID INT,
    user_ID INT,
    content TEXT NOT NULL
);
ALTER TABLE Comment
ADD CONSTRAINT fk_cvcomment_id
FOREIGN KEY (cv_ID) REFERENCES CV(cv_ID);

ALTER TABLE Comment
ADD CONSTRAINT fk_usercomment_id
FOREIGN KEY (user_ID) REFERENCES Users(user_ID);
GO

--Guide Table
CREATE TABLE Guide (
    guide_ID INT PRIMARY KEY NOT NULL,
    title VARCHAR(100) NOT NULL,
    content TEXT NOT NULL
);
GO

--Login_Session Table
CREATE TABLE Login_Session (
    login_ID INT PRIMARY KEY NOT NULL,
    user_ID INT,
    login_time TIMESTAMP,
    ip_address VARCHAR(45)
);
ALTER TABLE Login_Session
ADD CONSTRAINT fk_userlogin_id
FOREIGN KEY (user_ID) REFERENCES Users(user_ID);
GO

--Users_Guide Table
CREATE TABLE USERS_GUIDE (
	user_ID INT NOT NULL,
	guide_ID INT NOT NULL,
	number_read INT,

	CONSTRAINT pk_USERS_GUIDE PRIMARY KEY(user_ID, guide_ID),

	CONSTRAINT fk_user_id_USERS_GUIDE FOREIGN KEY(user_ID) REFERENCES Users(user_ID),
	CONSTRAINT fk_guide_id_USERS_GUIDE FOREIGN KEY(guide_ID) REFERENCES Guide(guide_ID)
);
GO

--CV_Section Table
CREATE TABLE CV_SECTION (
	section_ID INT NOT NULL,
	cv_ID INT NOT NULL,
	passion NVARCHAR(50),

	CONSTRAINT pk_CV_SECTION PRIMARY KEY(section_ID, cv_ID),

	CONSTRAINT fk_section_id_CV_SECTION FOREIGN KEY(section_ID) REFERENCES Section(section_ID),
	CONSTRAINT fk_cv_id_CV_SECTION FOREIGN KEY(cv_ID) REFERENCES CV(cv_ID)
);


-- Insert data into Users table
INSERT INTO Users (user_ID, username, password, email, full_name, phone_number)
VALUES 
(1, 'jdoe', 'hashed_password_1', 'jdoe@example.com', 'John Doe', '1234567890'),
(2, 'asmith', 'hashed_password_2', 'asmith@example.com', 'Alice Smith', '0987654321'),
(3, 'bnguyen', 'hashed_password_3', 'bnguyen@example.com', 'Bao Nguyen', '0123456789'),
(4, 'ccruz', 'hashed_password_4', 'ccruz@example.com', 'Carlos Cruz', '1230984567'),
(5, 'dmartin', 'hashed_password_5', 'dmartin@example.com', 'Dana Martin', '5678901234'),
(6, 'elopez', 'hashed_password_6', 'elopez@example.com', 'Elena Lopez', '6789012345'),
(7, 'fjones', 'hashed_password_7', 'fjones@example.com', 'Frank Jones', '7890123456'),
(8, 'ggarcia', 'hashed_password_8', 'ggarcia@example.com', 'Grace Garcia', '8901234567'),
(9, 'hkim', 'hashed_password_9', 'hkim@example.com', 'Hana Kim', '9012345678'),
(10, 'ilam', 'hashed_password_10', 'ilam@example.com', 'Ivy Lam', '2345678901'),
(11, 'jmoore', 'hashed_password_11', 'jmoore@example.com', 'Jack Moore', '3456789012'),
(12, 'kwhite', 'hashed_password_12', 'kwhite@example.com', 'Kara White', '4567890123');

-- Insert data into CV table
INSERT INTO CV (cv_ID, user_ID, title, summary)
VALUES 
(1, 1, 'Software Engineer CV', 'Experienced in Java and SQL development'),
(2, 2, 'Data Scientist CV', 'Skilled in Python, data analysis, and ML'),
(3, 3, 'Project Manager CV', '5 years experience in managing tech projects'),
(4, 4, 'UX Designer CV', 'Specializes in user-centric design principles'),
(5, 5, 'Marketing Specialist CV', 'Focused on digital marketing strategies'),
(6, 6, 'HR Manager CV', 'Proficient in HR software and recruitment'),
(7, 7, 'IT Support CV', 'Experienced in troubleshooting and IT support'),
(8, 8, 'Graphic Designer CV', 'Creative graphic designer with Adobe skills'),
(9, 9, 'Content Writer CV', 'Skilled in copywriting and editing content'),
(10, 10, 'Finance Analyst CV', 'Data-driven financial analysis'),
(11, 11, 'Civil Engineer CV', 'Experience in infrastructure projects'),
(12, 12, 'Business Analyst CV', 'Analytical skills and business knowledge');

-- Insert data into Section table
INSERT INTO Section (section_ID, section_type, content, ordered)
VALUES 
(1, 'Education', 'B.Sc. in Computer Science', 1),
(2, 'Experience', 'Software Engineer at TechCorp', 2),
(3, 'Skills', 'Java, SQL, Python', 3),
(4, 'Education', 'B.A. in Marketing', 1),
(5, 'Experience', 'Marketing Specialist at AdAgency', 2),
(6, 'Skills', 'SEO, Content Marketing', 3),
(7, 'Education', 'M.S. in Data Science', 1),
(8, 'Experience', 'Data Scientist at DataCorp', 2),
(9, 'Skills', 'R, Python, Machine Learning', 3),
(10, 'Education', 'B.A. in UX Design', 1),
(11, 'Experience', 'UX Designer at DesignFirm', 2),
(12, 'Skills', 'Adobe XD, Figma', 3);

-- Insert data into Comment table
INSERT INTO Comment (comment_ID, cv_ID, user_ID, content)
VALUES 
(1, 1, 2, 'Great CV! Very informative.'),
(2, 1, 3, 'Nice layout, but consider adding more projects.'),
(3, 2, 1, 'Interesting career path!'),
(4, 3, 4, 'Good summary on the experience.'),
(5, 4, 5, 'Impressive design portfolio!'),
(6, 5, 6, 'Well-organized CV!'),
(7, 6, 7, 'Looks professional and clean.'),
(8, 7, 8, 'Perfect for IT roles.'),
(9, 8, 9, 'Creative and engaging.'),
(10, 9, 10, 'Relevant experience noted.'),
(11, 10, 11, 'Very detailed finance background.'),
(12, 12, 1, 'Excellent analytical skills.');

-- Insert data into Guide table
INSERT INTO Guide (guide_ID, title, content)
VALUES 
(1, 'How to Create a Professional CV', 'Steps to make a compelling CV.'),
(2, 'Cover Letter Basics', 'Tips for writing an effective cover letter.'),
(3, 'Interview Preparation Guide', 'How to prepare for job interviews.'),
(4, 'LinkedIn Profile Tips', 'Optimize your LinkedIn profile.'),
(5, 'Networking Basics', 'How to network effectively.'),
(6, 'Job Search Strategies', 'Techniques for finding job opportunities.'),
(7, 'Freelancing 101', 'Getting started as a freelancer.'),
(8, 'Remote Work Guide', 'Tips for effective remote work.'),
(9, 'Work-Life Balance', 'Achieving balance in professional life.'),
(10, 'Salary Negotiation Tips', 'How to negotiate your salary.'),
(11, 'Personal Branding', 'Building your personal brand.'),
(12, 'Time Management for Professionals', 'Techniques to manage time.');

-- Insert data into Login_Session table
INSERT INTO Login_Session (login_ID, user_ID, ip_address)
VALUES 
(1, 1, '192.168.0.1'),
(2, 2, '192.168.0.2'),
(3, 3, '192.168.0.3'),
(4, 4, '192.168.0.4'),
(5, 5, '192.168.0.5'),
(6, 6, '192.168.0.6'),
(7, 7, '192.168.0.7'),
(8, 8, '192.168.0.8'),
(9, 9, '192.168.0.9'),
(10, 10, '192.168.0.10'),
(11, 11, '192.168.0.11'),
(12, 12, '192.168.0.12');

-- Insert data into USERS_GUIDE table
INSERT INTO USERS_GUIDE (user_ID, guide_ID, number_read)
VALUES 
(1, 1, 3),
(1, 2, 1),
(2, 1, 2),
(2, 3, 4),
(3, 2, 2),
(3, 4, 5),
(4, 1, 1),
(5, 6, 2),
(6, 5, 3),
(7, 8, 1),
(8, 10, 2),
(9, 11, 1);

-- Insert data into CV_SECTION table
INSERT INTO CV_SECTION (section_ID, cv_ID, passion)
VALUES 
(1, 1, 'Technology'),
(2, 1, 'Problem Solving'),
(3, 2, 'Data Analysis'),
(4, 2, 'Machine Learning'),
(5, 3, 'Project Management'),
(6, 4, 'User Experience'),
(7, 5, 'Digital Marketing'),
(8, 6, 'Human Resources'),
(9, 7, 'IT Support'),
(10, 8, 'Graphic Design'),
(11, 9, 'Content Creation'),
(12, 10, 'Financial Analysis');
