CREATE TABLE User (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    role VARCHAR(10) NOT NULL
);
CREATE TABLE Student (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    userId INT,
    sessionId INT,
    photoUrl VARCHAR(300),
    FOREIGN KEY (userId) REFERENCES User(id),
    FOREIGN KEY (sessionId) REFERENCES Session(id)
);
CREATE TABLE Formateur (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    userId INT,
    FOREIGN KEY (userId) REFERENCES User(id)
);
CREATE TABLE Session (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    startDate DATE NOT NULL,
    endDate DATE NOT NULL
);
CREATE TABLE Course (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(250) NOT NULL,
    sessionId INT,
    FOREIGN KEY (sessionId) REFERENCES Session(id)
);
CREATE TABLE CourseContent (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(250) NOT NULL,
    description TEXT NOT NULL,
    courseId INT,
    contentUrl VARCHAR(250),
    FOREIGN KEY (courseId) REFERENCES Course(id)
);
CREATE TABLE Evaluation (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(50) NOT NULL,
    courseId INT,
    FOREIGN KEY (courseId) REFERENCES Course(id)
);
CREATE TABLE Note (
    id INT AUTO_INCREMENT PRIMARY KEY,
    value DECIMAL(4,2) NOT NULL,
    evaluationId INT,
    studentId INT,
    FOREIGN KEY (evaluationId) REFERENCES Evaluation(id),
    FOREIGN KEY (studentId) REFERENCES Student(id)
);
