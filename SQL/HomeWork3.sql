create database Academy 
go
use Academy 

----table 1
create table Faculties (
id int identity(1,1)not null primary key,
Name nvarchar(100) not null check(Name!=' ')unique
)
----table 2
create table Departments(
id int identity(1,1) not null primary key,
Financing money not null check (Financing>=0) default 0,
Name nvarchar(100) not null check(Name!=' ') unique ,
FacultyId int not null references Faculties(Id)
)

----table 3
create table Groups(
id int identity(1,1) not null primary key,
Name nvarchar(10) not null check(Name!=' ')unique,
Year int not null check(Year>=1 and Year <=5),
DepartmentId int not null references Departments(Id)
)
----table 4
create table Subjects(
id int identity(1,1) not null primary key,
Name nvarchar (100) not null check (Name!=' ') unique 
)
----table 5
create table Teachers(
id int identity(1,1) not null primary key,
Name nvarchar(max) not null check (Name!=' '),
Salary money not null check(Salary>0),
Surname nvarchar(max) not null	check(Surname!=' ')
)
----table 6
create table Lectures(
id int identity(1,1) not null primary key,
DayOfWeek int  not null check(DayOfWeek>=1 and DayOfWeek<=7),
LectureRoom nvarchar(max) not null check (LectureRoom!=' '),
SubjectId int not null references Subjects(Id),
TeacherId int not null references Teachers(Id)
)
----table 7
create table GroupsLectures(
id int identity(1,1) not null primary key,
GroupId int not null references Groups(Id),
LectureId int not null references Lectures(Id)
)
-------------------------
----заполнение 1
insert into Faculties(Name) values
('Software Development'),
('Computer science'),
('Systems engineering'),
('Software engineering'),
('Computer engineering'),
('Applied Mathematics'),
('System analysis')

----заполнение 2
insert into Departments (Financing,Name,FacultyId) values
(10000,'Software Development',1),
(15000,'Computer science',2),
(20000,'Systems engineering',3),
(25000,'Software engineering',4),
(30000,'Computer engineering',5),
(35000,'Applied Mathematics',6),
(40000,'System analysis',1)



----заполнение 3 
insert into Groups(Name,Year,DepartmentId) values
('A1',1,1),
('A2',2,2),
('A3',3,3),
('A4',4,4),
('A5',5,5),
('A7',5,5),
('B1',1,1)

----заполнение 4
insert into Subjects(Name) values
('Mathematics'),
('С++'),
('Java'),
('PHP'),
('HTML'),
('Phyton'),
('Swift')

----заполнение 5
insert into Teachers(Name,Salary,Surname) values 
('Dave',5000,'McQueen'),
('Jack',6000,'Underhill'),
('Samuel',7000,'Adamson'),
('Jack',8000,'Aldridge'),
('Joseph',9000,'Evans'),
('Harry',10000,'Johnson'),
('Alfie',11000,'Davies')

----заполнение 6
insert into Lectures(DayOfWeek,LectureRoom,SubjectId,TeacherId) values 
(1,'D201',1,1),
(2,'A100',2,2),
(3,'A101',3,3),
(4,'A102',4,4),
(5,'A103',5,5),
(6,'A104',6,6),
(7,'D201',1,1)

----заполнение 7
insert into GroupsLectures(GroupId,LectureId) values 
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(1,1)

-----------------------------

----1. Вывести количество преподавателей кафедры “Software Development”.
select count(Teachers.Name) as 'Teachers of Software Development' from Teachers 
join Lectures on Teachers.Id=Lectures.Id
join GroupsLectures on GroupsLectures.LectureId=Lectures.Id
join Groups on GroupsLectures.GroupId=Groups.Id
join Departments on Groups.DepartmentId=Departments.Id and Departments.Name='Software Development'



----2. Вывести количество лекций, которые читает преподаватель “Dave McQueen”. 
select count(*) as 'Dave McQueen'
from Lectures 
join Teachers on Teachers.Id=Lectures.TeacherId and Teachers.Name='Dave' and Teachers.Surname='McQueen'

----3.Вывести количество занятий, проводимых в аудитории “D201”.
select count(*) as 'D201'
from Lectures 
where LectureRoom='D201'

----4. Вывести названия аудиторий и количество лекций, проводимых в них.
select LectureRoom,count(*) as 'Кол-во занятий'
from Lectures 
group by LectureRoom


--5. Вывести количество студентов, посещающих лекции преподавателя “Jack Underhill”.



--6. Вывести среднюю ставку преподавателей факультета “Computer Science”.
select avg(Salary) from Teachers
join Lectures on Lectures.TeacherId=Teachers.Id
join GroupsLectures on GroupsLectures.LectureId=Lectures.Id
join Groups on Groups.Id=GroupsLectures.Id
join Departments on Groups.DepartmentId=Departments.Id
join Faculties on Faculties.Id = Departments.FacultyId and Faculties.Name='Computer Science'



--7. Вывести минимальное и максимальное количество студентов среди всех групп.




--8. Вывести средний фонд финансирования кафедр.
select avg(Financing) as 'AVG Financing' from Departments 



--9. Вывести полные имена преподавателей и количество читаемых ими дисциплин.
select Teachers.Name,Teachers.Surname,count(Subjects.Id)
from Teachers 
join Lectures on Teachers.Id=Lectures.TeacherId
join Subjects on Lectures.SubjectId=Subjects.Id
group by Teachers.Name, Teachers.Surname



--10. Вывести количество лекций в каждый день недели.
select count(Lectures.Id) as 'Kol-vo' ,Lectures.DayOfWeek
from Lectures 
join GroupsLectures on GroupsLectures.LectureId=Lectures.Id
group by Lectures.DayOfWeek



--11. Вывести номера аудиторий и количество кафедр, чьи лекции в них читаются.
select Lectures.LectureRoom,count(Departments.Id) as 'Kol-vo'
from Lectures 
join GroupsLectures on GroupsLectures.LectureId=Lectures.Id
join Groups on Groups.Id=GroupsLectures.GroupId
join Departments on Groups.DepartmentId=Departments.Id
group by Lectures.LectureRoom



--12. Вывести названия факультетов и количество дисциплин,которые на них читаются.
select Faculties.Name,count(Subjects.Id) from Faculties
join Departments on Departments.FacultyId=Faculties.Id
join Groups on Groups.DepartmentId=Departments.Id
join GroupsLectures on GroupsLectures.GroupId=Groups.Id
join Lectures on GroupsLectures.LectureId=Lectures.Id
join Subjects on Subjects.Id=Lectures.SubjectId
group by Faculties.Name



--13. Вывести количество лекций для каждой пары преподаватель-аудитория
select(Teachers.Name+' '+Teachers.Surname) as Teacher, Lectures.LectureRoom, count(Lectures.Id) as 'Kol-vo'
from Teachers
join Lectures on Lectures.TeacherId=Teachers.Id
group by Lectures.LectureRoom, Teachers.Name, Teachers.Surname




