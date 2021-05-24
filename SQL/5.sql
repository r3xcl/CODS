--1. Вывести названия аудиторий, в которых читает лекции преподаватель “Edward Hopper”.
--2. Вывести фамилии ассистентов, читающих лекции в группе “F505”.
--3. Вывести дисциплины, которые читает преподаватель “AlexCarmack” для групп 5-го курса.
--4. Вывести фамилии преподавателей, которые не читаютлекции по понедельникам.
--5. Вывести названия аудиторий, с указанием их корпусов,
--в которых нет лекций в среду второй недели на третьей паре.
--6. Вывести полные имена преподавателей факультета “ComputerScience”, которые не курируют группы кафедры “SoftwareDevelopment”.
--7. Вывести список номеров всех корпусов, которые имеются в таблицах факультетов, кафедр и аудиторий.
--8. Вывести полные имена преподавателей в следующем порядке: деканы факультетов, заведующие кафедрами, преподаватели, кураторы, ассистенты.
--9. Вывести дни недели (без повторений), в которые имеются занятия в аудиториях “A311” и “A104” корпуса 6.

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

create table [Assistants]
(
	[Id] int not null identity(1, 1) primary key,
	[TeacherId] int not null
);
go

create table [Curators]
(
	[Id] int not null identity(1, 1) primary key,
	[TeacherId] int not null
);
go

create table [Deans]
(
	[Id] int not null identity(1, 1) primary key,
	[TeacherId] int not null
);
go

create table [Departments]
(
	[Id] int not null identity(1, 1) primary key,
	[Building] int not null check ([Building] between 1 and 5),
	[Name] nvarchar(100) not null unique check ([Name] <> N''),
	[FacultyId] int not null,
	[HeadId] int not null
);
go

create table [Faculties]
(
	[Id] int not null identity(1, 1) primary key,
	[Building] int not null check ([Building] between 1 and 5),
	[Name] nvarchar(100) not null unique check ([Name] <> N''),
	[DeanId] int not null
);
go

create table [Groups]
(
	[Id] int not null identity(1, 1) primary key,
	[Name] nvarchar(10) not null unique check ([Name] <> N''),
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

create table [Heads]
(
	[Id] int not null identity(1, 1) primary key,
	[TeacherId] int not null
);
go

create table [LectureRooms]
(
	[Id] int not null identity(1, 1) primary key,
	[Building] int not null check ([Building] between 1 and 5),
	[Name] nvarchar(10) not null unique check ([Name] <> N'')
);
go

create table [Lectures]
(
	[Id] int not null identity(1, 1) primary key,
	[SubjectId] int not null,
	[TeacherId] int not null
);
go

create table [Schedules]
(
	[Id] int not null identity(1, 1) primary key,
	[Class] int not null check ([Class] between 1 and 8),
	[DayOfWeek] int not null check ([DayOfWeek] between 1 and 7),
	[Week] int not null check ([Week] between 1 and 52),
	[LectureId] int not null,
	[LectureRoomId] int not null
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
	[Surname] nvarchar(max) not null check ([Surname] <> N'')
);
go

alter table [Assistants]
add foreign key ([TeacherId]) references [Teachers]([Id]);
go

alter table [Curators]
add foreign key ([TeacherId]) references [Teachers]([Id]);
go

alter table [Deans]
add foreign key ([TeacherId]) references [Teachers]([Id]);
go

alter table [Departments]
add foreign key ([FacultyId]) references [Faculties]([Id]);
go

alter table [Departments]
add foreign key ([HeadId]) references [Heads]([Id]);
go

alter table [Faculties]
add foreign key ([DeanId]) references [Deans]([Id]);
go

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

alter table [Heads]
add foreign key ([TeacherId]) references [Teachers]([Id]);
go

alter table [Lectures]
add foreign key ([SubjectId]) references [Subjects]([Id]);
go

alter table [Lectures]
add foreign key ([TeacherId]) references [Teachers]([Id]);
go

alter table [Schedules]
add foreign key ([LectureId]) references [Lectures]([Id]);
go

alter table [Schedules]
add foreign key ([LectureRoomId]) references [LectureRooms]([Id]);
go

insert into Teachers (Name,Surname) values 
('Samuel','Adamson'),
('Freddy','Aldridge'),
('Nicky','Evans'),
('Alex','Carmack'),
('Danny','Wilson'),
('Douglas','Evans'),
('Edgar','Ellington'),
('Chris','Gilbert')

insert into Assistants(TeacherId) values 
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8)

insert into Deans(TeacherId) values
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8)

insert into Curators (TeacherId) values
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8)
insert into Subjects (Name) values 
('Mathematics'),
('С++'),
('Java'),
('PHP'),
('HTML'),
('Phyton'),
('Swift'),
('SQL')
insert into Lectures(SubjectId,TeacherId) values 
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8)

insert into Faculties(Building,Name,DeanId) values 
(1,'Software Development',1),
(2,'Computer science',2),
(3,'Systems engineering',3),
(4,'Software engineering',4),
(5,'Computer engineering',5),
(1,'Applied Mathematics',6),
(2,'System analysis',7),
(3,'Information Security',8)

insert into Heads (TeacherId) values 
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8)


insert into Departments(Building,Name,FacultyId,HeadId) values
('1','Software Development',1,1),
('2','Computer science',2,2),
('3','Systems engineering',3,3),
('4','Software engineering',4,4),
('5','Computer engineering',5,5),
('1','Applied Mathematics',6,6),
('2','System analysis',7,7),
('3','Information Security',8,8)


insert into Groups (Name,Year,DepartmentId) values 
('A1',1,1),
('A2',2,2),
('A3',3,3),
('A4',4,4),
('A5',5,5),
('A7',1,6),
('B1',2,7),
('B2',3,8)

insert into GroupsLectures(GroupId,LectureId) values 
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8)

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

create table [Assistants]
(
	[Id] int not null identity(1, 1) primary key,
	[TeacherId] int not null
);
go

create table [Curators]
(
	[Id] int not null identity(1, 1) primary key,
	[TeacherId] int not null
);
go

create table [Deans]
(
	[Id] int not null identity(1, 1) primary key,
	[TeacherId] int not null
);
go

create table [Departments]
(
	[Id] int not null identity(1, 1) primary key,
	[Building] int not null check ([Building] between 1 and 5),
	[Name] nvarchar(100) not null unique check ([Name] <> N''),
	[FacultyId] int not null,
	[HeadId] int not null
);
go

create table [Faculties]
(
	[Id] int not null identity(1, 1) primary key,
	[Building] int not null check ([Building] between 1 and 5),
	[Name] nvarchar(100) not null unique check ([Name] <> N''),
	[DeanId] int not null
);
go

create table [Groups]
(
	[Id] int not null identity(1, 1) primary key,
	[Name] nvarchar(10) not null unique check ([Name] <> N''),
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

create table [Heads]
(
	[Id] int not null identity(1, 1) primary key,
	[TeacherId] int not null
);
go

create table [LectureRooms]
(
	[Id] int not null identity(1, 1) primary key,
	[Building] int not null check ([Building] between 1 and 5),
	[Name] nvarchar(10) not null unique check ([Name] <> N'')
);
go

create table [Lectures]
(
	[Id] int not null identity(1, 1) primary key,
	[SubjectId] int not null,
	[TeacherId] int not null
);
go

create table [Schedules]
(
	[Id] int not null identity(1, 1) primary key,
	[Class] int not null check ([Class] between 1 and 8),
	[DayOfWeek] int not null check ([DayOfWeek] between 1 and 7),
	[Week] int not null check ([Week] between 1 and 52),
	[LectureId] int not null,
	[LectureRoomId] int not null
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
	[Surname] nvarchar(max) not null check ([Surname] <> N'')
);
go

alter table [Assistants]
add foreign key ([TeacherId]) references [Teachers]([Id]);
go

alter table [Curators]
add foreign key ([TeacherId]) references [Teachers]([Id]);
go

alter table [Deans]
add foreign key ([TeacherId]) references [Teachers]([Id]);
go

alter table [Departments]
add foreign key ([FacultyId]) references [Faculties]([Id]);
go

alter table [Departments]
add foreign key ([HeadId]) references [Heads]([Id]);
go

alter table [Faculties]
add foreign key ([DeanId]) references [Deans]([Id]);
go

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

alter table [Heads]
add foreign key ([TeacherId]) references [Teachers]([Id]);
go

alter table [Lectures]
add foreign key ([SubjectId]) references [Subjects]([Id]);
go

alter table [Lectures]
add foreign key ([TeacherId]) references [Teachers]([Id]);
go

alter table [Schedules]
add foreign key ([LectureId]) references [Lectures]([Id]);
go

alter table [Schedules]
add foreign key ([LectureRoomId]) references [LectureRooms]([Id]);
go

insert into Teachers (Name,Surname) values 
('Samuel','Adamson'),
('Edward','Hopper'),
('Nicky','Evans'),
('Alex','Carmack'),
('Danny','Wilson'),
('Douglas','Evans'),
('Edgar','Ellington'),
('Chris','Gilbert')

insert into Assistants(TeacherId) values 
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8)

insert into Deans(TeacherId) values
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8)

insert into Curators (TeacherId) values
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8)
insert into Subjects (Name) values 
('Mathematics'),
('С++'),
('Java'),
('PHP'),
('HTML'),
('Phyton'),
('Swift'),
('SQL')
insert into Lectures(SubjectId,TeacherId) values 
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8)

insert into Faculties(Building,Name,DeanId) values 
(1,'Software Development',1),
(2,'Computer science',2),
(3,'Systems engineering',3),
(4,'Software engineering',4),
(5,'Computer engineering',5),
(1,'Applied Mathematics',6),
(2,'System analysis',7),
(3,'Information Security',8)

insert into Heads (TeacherId) values 
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8)


insert into Departments(Building,Name,FacultyId,HeadId) values
('1','Software Development',1,1),
('2','Computer science',2,2),
('3','Systems engineering',3,3),
('4','Software engineering',4,4),
('5','Computer engineering',5,5),
('1','Applied Mathematics',6,6),
('2','System analysis',7,7),
('3','Information Security',8,8)


insert into Groups (Name,Year,DepartmentId) values 
('F505',1,1),
('A100',2,2),
('A101',3,3),
('F502',5,4),
('C300',5,5),
('B523',1,6),
('R320',2,7),
('A106',3,8)

insert into GroupsLectures(GroupId,LectureId) values 
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8)


insert into GroupsCurators(CuratorId,GroupId) values 
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8)

insert into LectureRooms(Building,Name) values
(1,'A311'),
(2,'A104'),
(3,'A001'),
(4,'A002'),
(5,'A003'),
(1,'A004'),
(2,'A005'),
(3,'A313')

insert into Schedules(Class,DayOfWeek,Week,LectureId,LectureRoomId) values 
(1,1,1,1,1),
(2,2,2,2,2),
(3,3,3,3,3),
(4,4,4,4,4),
(5,5,1,5,5),
(6,6,2,6,6),
(7,7,3,7,7),
(8,7,4,8,8)

--////////////////////

--1. Вывести названия аудиторий, в которых читает лекции преподаватель “Edward Hopper”.

select LectureRooms.Name from LectureRooms inner join Teachers on LectureRooms.Id=Teachers.Id
where Teachers.Name='Edward' and Teachers.Surname='Hopper'

--2. Вывести фамилии ассистентов, читающих лекции в группе “F505”.

select Teachers.Surname from Teachers inner join Groups on Groups.Id=Teachers.Id
where Groups.Name='F505'


--3. Вывести дисциплины, которые читает преподаватель “Alex Carmack” для групп 5-го курса. 

select Subjects.Name 
from Subjects inner join Teachers on Teachers.Id=Subjects.Id
inner join Groups on Groups.Id=Teachers.Id
where Teachers.Name='Alex' and Teachers.Surname='Carmack' and Groups.Year='5'

--4. Вывести фамилии преподавателей, которые не читают лекции по понедельникам.
select Teachers.Surname
from Teachers inner join Schedules on Teachers.Id=Schedules.Id
where Schedules.DayOfWeek!=1

--5. Вывести названия аудиторий, с указанием их корпусов, в которых нет лекций в среду второй недели на третьей паре.
select LectureRooms.Name,LectureRooms.Building
from LectureRooms inner join Schedules on LectureRooms.Id=Schedules.Id
where Schedules.DayOfWeek!=3 and Schedules.Week!=2 and Schedules.Id!=3

--6.Вывести полные имена преподавателей факультета “Computer Science”, которые не курируют группы кафедры “Software Development”.
select Teachers.Name,Teachers.Surname 
from Teachers inner join Faculties on Teachers.Id=Faculties.Id
inner join GroupsCurators on Teachers.Id=GroupsCurators.Id
inner join Departments on Departments.Id=GroupsCurators.Id
where Faculties.Name='Computer Science' and Departments.Id!=1

--7.Вывести список номеров всех корпусов, которые имеются в таблицах факультетов, кафедр и аудиторий.
select Faculties.Building as 'Faculties Building' ,LectureRooms.Building as 'LectureRooms Building',Departments.Building as 'Departments Building' 
from Faculties inner join LectureRooms on Faculties.Id=LectureRooms.Id
inner join Departments on Departments.Id=LectureRooms.Id

--8.Вывести полные имена преподавателей в следующем порядке: деканы факультетов, заведующие кафедрами, преподаватели, кураторы, ассистенты.
select Teachers.Name,Teachers.Surname
from Teachers inner join Heads on Heads.Id=Teachers.Id
inner join Deans on Teachers.Id=Deans.Id
inner join Curators on Teachers.Id=Curators.Id
inner join Assistants on Teachers.Id=Assistants.Id
order by Heads.Id,Deans.Id,Teachers.Id,Curators.Id,Assistants.Id

--9.Вывести дни недели (без повторений), в которые имеются занятия в аудиториях “A311” и “A104” корпуса 6.
select Schedules.DayOfWeek 
from Schedules inner join LectureRooms on Schedules.Id=LectureRooms.Id
where LectureRooms.Name='A311' and LectureRooms.Name='A104' and LectureRooms.Building='6' 
group by DayOfWeek 







