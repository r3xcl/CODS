--1. Вывести все возможные пары строк преподавателей и групп.
--2. Вывести названия факультетов, фонд финансирования кафедр которых превышает фонд финансирования факультета.
--3. Вывести фамилии кураторов групп и названия групп, которые они курируют.
--4. Вывести имена и фамилии преподавателей, которые читают лекции у группы “P107”.
--5. Вывести фамилии преподавателей и названия факультетов на которых они читают лекции.
--6. Вывести названия кафедр и названия групп, которые к ним относятся.
--7. Вывести названия дисциплин, которые читает преподаватель “Samantha Adams”.
--8. Вывести названия кафедр, на которых читается дисциплина “Database Theory”.
--9. Вывести названия групп, которые относятся к факультету “Computer Science”.
--10. Вывести названия групп 5-го курса, а также название факультетов, к которым они относятся.
--11. Вывести полные имена преподавателей и лекции, которые они читают (названия дисциплин и групп), причем отобрать только те лекции, которые читаются в аудитории “B103”.

use [master];
go

if db_id('Academy') is not null
begin
drop database [Academy];
end
go

create database [Academy];
go

use [Academy];
go

create table [Curators]
(
	[Id] int not null identity(1, 1) primary key,
	[Name] nvarchar(max) not null check ([Name] <> N''),
	[Surname] nvarchar(max) not null check ([Surname] <> N'')
);
go

create table [Departments]
(
	[Id] int not null identity(1, 1) primary key,
	[Financing] money not null check ([Financing] >= 0.0) default 0.0,
	[Name] nvarchar(100) not null unique check ([Name] <> N''),
	[FacultyId] int not null
);
go

create table [Faculties]
(
	[Id] int not null identity(1, 1) primary key,
	[Financing] money not null check ([Financing] >= 0.0) default 0.0,
	[Name] nvarchar(100) not null unique check ([Name] <> N'')
);
go

create table [Groups]
(
	[Id] int not null identity(1, 1) primary key,
	[Name] nvarchar(100) not null unique check ([Name] <> N''),
	[Year] int not null check ([Year] between 1 and 5),
	[DepartmentId] int not null
);
go

create table [GroupsCurators]
(
	[Id] int not null identity(1, 1) primary key,
	[CuratorId] int not null,
	[GroupId] int not null
);
go

create table [GroupsLectures]
(
	[Id] int not null identity(1, 1) primary key,
	[GroupId] int not null,
	[LectureId] int not null
);
go

create table [Lectures]
(
	[Id] int not null identity(1, 1) primary key,
	[LectureRoom] nvarchar(max) not null check ([LectureRoom] <> N''),
	[SubjectId] int not null,
	[TeacherId] int not null
);
go

create table [Subjects]
(
	[Id] int not null identity(1, 1) primary key,
	[Name] nvarchar(100) not null unique check ([Name] <> N'')
);
go

create table [Teachers]
(
	[Id] int not null identity(1, 1) primary key,
  [Name] nvarchar(max) not null check ([Name] <> N''),
	[Salary] money not null check ([Salary] > 0.0),
	[Surname] nvarchar(max) not null check ([Surname] <> N'')
);
go

alter table [Departments]
add foreign key ([FacultyId]) references [Faculties]([Id]);
-go

alter table [Groups]
add foreign key ([DepartmentId]) references [Departments]([Id]);
go

alter table [GroupsCurators]
add foreign key ([CuratorId]) references [Curators]([Id]);
go

alter table [GroupsCurators]
add foreign key ([GroupId]) references [Groups]([Id]);
go

alter table [GroupsLectures]
add foreign key ([GroupId]) references [Groups]([Id]);
go

alter table [GroupsLectures]
add foreign key ([LectureId]) references [Lectures]([Id]);
go

alter table [Lectures]
add foreign key ([SubjectId]) references [Subjects]([Id]);
go

alter table [Lectures]
add foreign key ([TeacherId]) references [Teachers]([Id]);
go

insert Curators (Name,Surname) values 
('Samantha','Adams'),
('Samuel','Adamson'),
('Olivia','Smith'),
('Jack','Aldridge'),
('Amelia','Brown'),
('Joseph','Evans')


insert Faculties (Financing,Name) values 
(6000,'Computer Science'),
(5000,'Electronics'),
(4000,'Technical Cyberetics'),
(3000,'Software Systems'),
(2000,'Power Engineering'),
(1000,'Robotics')

insert Departments (Financing,Name,FacultyId) values 
(60000,'Computer Science',1),
(50000,'Electronics',2),
(40000,'Technical Cyberetics',3),
(30000,'Software Systems',4),
(20000,'Power Engineering',5),
(10000,'Robotics',6)

insert Groups(Name,Year,DepartmentId) values 
('P107',1,1),
('P108',2,2),
('P109',3,3),
('P110',4,4),
('P111',5,5),
('B101',1,6),
('B102',1,1),
('B103',2,2),
('B104',3,3),
('B105',4,4),
('B106',5,5),
('B107',1,6)

insert GroupsCurators(CuratorId,GroupId) values 
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6)

insert GroupsLectures(LectureId,GroupId) values
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6)

insert Lectures (LectureRoom,SubjectId,TeacherId) values
('1',1,1),
('2',2,2),
('3',3,3),
('4',4,4),
('5',5,5)

insert Subjects(Name) values
('Database Theory'),
('Physics'),
('C++'),
('Electronics'),
('Сybersecurity')

insert Teachers(Name,Salary,Surname) values 
('Samantha',3000,'Adams'),
('Samuel',4000,'Adamson'),
('Olivia',5000,'Smith'),
('Jack',6000,'Aldridge'),
('Amelia',8000,'Brown'),
('Joseph',10000,'Evans')

----1)Вывести все возможные пары строк преподавателей и групп.
select Teachers.Id as TeacherId,Teachers.Name as TeacherName,Groups.Id as GroupId,Groups.Name as GroupName
from Groups cross join Teachers 

----2)Вывести названия факультетов, фонд финансирования кафедр которых превышает фонд финансирования факультета.
select Faculties.Name from Faculties,Departments  where Faculties.Id = Departments.Id 
group by Departments.FacultyId,Faculties.Name,Faculties.Financing
having sum (Departments.Financing)>Faculties.Financing

--3)Вывести фамилии кураторов групп и названия групп, которые они курируют.
select Curators.Surname ,Groups.Name from Curators,Groups,GroupsCurators where GroupsCurators.CuratorId = Curators.Id and GroupsCurators.GroupId = Groups.Id

--4)Вывести имена и фамилии преподавателей, которые читают лекции у группы “P107”.
select Teachers.Name,Teachers.Surname from Teachers,Groups,GroupsLectures,Lectures where GroupsLectures.LectureId=Lectures.Id and GroupsLectures.GroupId = Groups.Id and Teachers.Id=Lectures.TeacherId and groups.name='P107'

--5)Вывести фамилии преподавателей и названия факультетов на которых они читают лекции.
select Teachers.Surname as TeacherSurname, Faculties.Name as FacultyName FROM Teachers 
join Lectures on Teachers.Id=Lectures.TeacherId 
join GroupsLectures  on Lectures.ID=GroupsLectures.LectureID
join Groups on GroupsLectures.GroupID=Groups.ID
join Departments on Groups.DepartmentID=Departments.ID
join Faculties on Departments.FacultyID=Faculties.ID

--6)Вывести названия кафедр и названия групп, которые к ним относятся.
select Departments.Name,Groups.Name 
 Departments join Groups on Departments.id=Groups.DepartmentId

--7)Вывести названия дисциплин, которые читает преподаватель “Samantha Adams”.
select Subjects.Name from Subjects 
join Teachers on Teachers.Name='Samantha' and Teachers.Surname='Adams'
join Lectures on Lectures.TeacherId=Teachers.Id where Lectures.SubjectId=Subjects.Id

--8)Вывести названия кафедр, на которых читается дисциплина “Database Theory”.
select Departments.Name from Departments 
join Groups on Groups.DepartmentId=Departments.id
join GroupsLectures on GroupsLectures.GroupId=Groups.id
join Lectures on Lectures.Id=GroupsLectures.Lectureid
join Subjects on Subjects.Id= Lectures.Subjectid where Subjects.name='Database Theory'

--9)Вывести названия групп, которые относятся к факультету “Computer Science”.
select Groups.Name from Groups 
join Departments on Groups.DepartmentId=Departments.Id
join Faculties on Departments.FacultyId=Faculties.Id
where Faculties.Name = 'Computer Science'

--10)Вывести названия групп 5-го курса, а также название факультетов, к которым они относятся.
select Groups.Name ,Faculties.Name from Groups 
join Departments on Groups.DepartmentId=Departments.Id
join Faculties on Departments.FacultyId=Faculties.Id where Groups.Year=5

--11)Вывести полные имена преподавателей и лекции, которые они читают (названия дисциплин и групп), причем отобрать только те лекции, которые читаются в аудитории “B103”.
select Teachers.Name,Subjects.Name,Groups.Name from Teachers
join Lectures on Lectures.TeacherId=Teachers.Id and LectureRoom='B103'
join groupslectures on GroupsLectures.LectureID=Lectures.id
join Groups on Groups.Id=GroupsLectures.GroupId
join Subjects on Subjects.Id=Lectures.SubjectId






