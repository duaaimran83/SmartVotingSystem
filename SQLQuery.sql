CREATE TABLE Voter ( 
 VoterID INT PRIMARY KEY, 
 Name VARCHAR(100), 
 DOB DATE, 
 Address VARCHAR(255), 
 PhoneNumber VARCHAR(15), 
 Email VARCHAR(100),
 Registered BIT, 
 VoterStatus VARCHAR(20) 
); 

CREATE TABLE Election ( 
 ElectionID INT PRIMARY KEY, 
 ElectionName VARCHAR(100), 
 ElectionDate DATE, 
 StartTime TIME, 
 EndTime TIME, 
 Description TEXT, 
 Status VARCHAR(20) 
); 

CREATE TABLE Candidate ( 
 CandidateID INT PRIMARY KEY, 
 Name VARCHAR(100), 
 Party VARCHAR(100), 
 ElectionID INT, 
 Bio TEXT, 
 Policies TEXT, 
 FOREIGN KEY (ElectionID) REFERENCES Election(ElectionID) ); 


CREATE TABLE Vote ( 
 VoteID INT PRIMARY KEY, 
 VoterID INT, 
 ElectionID INT, 
 CandidateID INT,
 Timestamp DATETIME, 
 FOREIGN KEY (VoterID) REFERENCES Voter(VoterID),  FOREIGN KEY (ElectionID) REFERENCES Election(ElectionID),  FOREIGN KEY (CandidateID) REFERENCES Candidate(CandidateID) ); 
 
CREATE TABLE Admin ( 
 AdminID INT PRIMARY KEY, 
 Name VARCHAR(100), 
 Email VARCHAR(100), 
 PhoneNumber VARCHAR(15), 
 Role VARCHAR(50), 
 Password VARCHAR(255) 
); 

CREATE TABLE Results ( 
 ResultID INT PRIMARY KEY, 
 ElectionID INT, 
 CandidateID INT, 
 TotalVotes INT, 
 Percentage FLOAT, 
 FOREIGN KEY (ElectionID) REFERENCES Election(ElectionID),  FOREIGN KEY (CandidateID) REFERENCES Candidate(CandidateID) ); 

CREATE TABLE Feedback ( 
 FeedbackID INT PRIMARY KEY, 
 VoterID INT, 
 ElectionID INT,
 Comments TEXT, 
 Rating INT, 
 Timestamp DATETIME, 
 FOREIGN KEY (VoterID) REFERENCES Voter(VoterID), 
 FOREIGN KEY (ElectionID) REFERENCES Election(ElectionID) ); 


CREATE TABLE AuditLog ( 
 LogID INT PRIMARY KEY, 
 AdminID INT, 
 Action TEXT, 
 Timestamp DATETIME, 
 Details TEXT, 
 FOREIGN KEY (AdminID) REFERENCES Admin(AdminID) 
); 



INSERT INTO Voter (VoterID, Name, DOB, Address, PhoneNumber, Email, Registered, VoterStatus)
VALUES 
(1, 'Ali Raza', '1980-05-01', '123 Street, Karachi', '03001234567', 'ali.raza@example.com', 1, 'active'),
(2, 'Fatima Khan', '1985-07-15', '456 Lane, Lahore', '03007654321', 'fatima.khan@example.com', 1, 'active'),
(3, 'Ahmed Hassan', '1990-10-30', '789 Road, Islamabad', '03009876543', 'ahmed.hassan@example.com', 1, 'active'),
(4, 'Sara Ahmed', '1995-02-20', '321 Avenue, Peshawar', '03003216598', 'sara.ahmed@example.com', 1, 'active'),
(5, 'Usman Ali', '2000-12-12', '654 Boulevard, Quetta', '03005678901', 'usman.ali@example.com', 1, 'active');

-- Inserting data into Election table
INSERT INTO Election (ElectionID, ElectionName, ElectionDate, StartTime, EndTime, Description, Status)
VALUES 
(1, 'General Election 2023', '2023-07-25', '08:00:00', '18:00:00', 'General Election for National Assembly', 'upcoming'),
(2, 'Provincial Election 2023', '2023-07-25', '08:00:00', '18:00:00', 'Provincial Election for Provincial Assembly', 'upcoming'),
(3, 'Local Body Election 2022', '2022-12-30', '08:00:00', '18:00:00', 'Local Body Election for Municipal Corporation', 'upcoming'),
(4, 'Senate Election 2024', '2024-03-03', '08:00:00', '18:00:00', 'Senate Election for Senate of Pakistan', 'upcoming'),
(5, 'Presidential Election 2024', '2024-09-04', '08:00:00', '18:00:00', 'Presidential Election for President of Pakistan', 'upcoming');

-- Inserting data into Candidate table
INSERT INTO Candidate (CandidateID, Name, Party, ElectionID, Bio, Policies)
VALUES 
(1, 'Candidate 1', 'Party A', 1, 'Bio of Candidate 1', 'Policies of Candidate 1'),
(2, 'Candidate 2', 'Party B', 1, 'Bio of Candidate 2', 'Policies of Candidate 2'),
(3, 'Candidate 3', 'Party C', 2, 'Bio of Candidate 3', 'Policies of Candidate 3'),
(4, 'Candidate 4', 'Party D', 2, 'Bio of Candidate 4', 'Policies of Candidate 4'),
(5, 'Candidate 5', 'Party E', 3, 'Bio of Candidate 5', 'Policies of Candidate 5');

-- Inserting data into Admin table
INSERT INTO Admin (AdminID, Name, Email, PhoneNumber, Role, Password)
VALUES 
(1, 'Admin 1', 'admin1@example.com', '03001112233', 'super admin', 'password1'),
(2, 'Admin 2', 'admin2@example.com', '03004445566', 'election manager', 'password2'),
(3, 'Admin 3', 'admin3@example.com', '03007778899', 'election manager', 'password3'),
(4, 'Admin 4', 'admin4@example.com', '03002223344', 'super admin', 'password4'),
(5, 'Admin 5', 'admin5@example.com', '03005556677', 'election manager', 'password5');