GO
CREATE DATABASE ASSIGNMENT_JAVA4;
GO
USE ASSIGNMENT_JAVA4;

GO
CREATE TABLE USERS(
ID VARCHAR(20) PRIMARY KEY,
[PASSWORD] VARCHAR(50),
EMAIL VARCHAR(50),
FULLNAME NVARCHAR(50),
[ADMIN] BIT
)

GO
CREATE TABLE VIDEOS(
ID VARCHAR(20) PRIMARY KEY,
TITLE NVARCHAR(50),
POSTER VARCHAR(50),
[VIEWS] INT,
[DESCRIPTION] NVARCHAR(50),
ACTIVE BIT
)

GO
CREATE TABLE FAVORITES(
ID INT IDENTITY(1,1) PRIMARY KEY,
USERID VARCHAR(20),
VIDEOID VARCHAR(20),
LIKEDATE DATE,
CONSTRAINT FK_FAVORITES_USERS FOREIGN KEY (USERID) REFERENCES USERS(ID),
CONSTRAINT FK_FAVORITES_VIDEOS FOREIGN KEY (VIDEOID) REFERENCES VIDEOS(ID),
)

GO
CREATE TABLE SHARES(
ID INT IDENTITY(1,1) PRIMARY KEY,
USERID VARCHAR(20),
VIDEOID VARCHAR(20),
EMAIL VARCHAR(50),
SHAREDATE DATE,
CONSTRAINT FK_SHARES_USERS FOREIGN KEY (USERID) REFERENCES USERS(ID),
CONSTRAINT FK_SHARES_VIDEOS FOREIGN KEY (VIDEOID) REFERENCES VIDEOS(ID),
)

GO
INSERT INTO USERS(ID,[PASSWORD],EMAIL,FULLNAME,[ADMIN]) VALUES
('user1','111','phuongduy220502@gmail.com',N'Võ Đình Duy Phương',1),
('user2','222','nam@gmail.com',N'Nguyên Nam',0),
('user3','333','hang@gmail.com',N'Võ Hằng',1),
('user4','444','trung@gmail.com',N'Trung Trần',0),
('user5','555','tuan@gmail.com',N'Tuấn Phạm',1),
('user6','666','duy@gmail.com',N'Duy Võ',0),
('user7','333','dinh@gmail.com',N'Lê Đinh',0);

GO 
INSERT INTO VIDEOS(ID,TITLE,POSTER,[VIEWS],[DESCRIPTION],ACTIVE) VALUES
('video1',N'Spider Man','poster1.png',111,N'Very Nice',1),
('video2',N'Iron Man','poster2.png',222,N'Very Good',0),
('video3',N'Bố Già','poster3.png',333,N'Phim tình cảm',0),
('video4',N'Venom','poster4.png',444,N'Very Violent',1),
('video5',N'Dead Pool','poster5.png',555,N'Very Funny',0),
('video6',N'The Un Holly','poster6.png',666,N'Very Horror',1);

GO 
INSERT INTO FAVORITES(USERID,VIDEOID,LIKEDATE) VALUES
('user1','video2','2021-01-22'),
('user2','video4','2021-05-26'),
('user3','video1','2021-01-09'),
('user4','video3','2021-07-12'),
('user5','video6','2021-02-24'),
('user6','video5','2022-01-01');

GO 
INSERT INTO SHARES(USERID,VIDEOID,EMAIL,SHAREDATE) VALUES
('user2','video4','nam@gmail.com','2021-07-12'),
('user1','video1','phuongduy220502@gmail.com','2021-04-30'),
('user4','video3','trung@gmail.com','2021-07-12'),
('user1','video2','phuongduy220502@gmail.com','2021-05-22'),
('user3','video5','hang@gmail.com','2021-03-02'),
('user7','video1','dinh@gmail.com','2022-01-12');

