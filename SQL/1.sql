--1. Вывести таблицу кафедр, но расположить ее поля в обратном порядке.
--2. Вывести названия групп и их рейтинги с уточнением имен
--полей именем таблицы.
--3. Вывести для преподавателей их фамилию, процент ставки
--по отношению к надбавке и процент ставки по отношению
--к зарплате (сумма ставки и надбавки).
--4. Вывести таблицу факультетов в виде одного поля в следующем формате: “The dean of faculty [faculty] is [dean].”.
--5. Вывести фамилии преподавателей, которые являются профессорами и ставка которых превышает 1050.
--6. Вывести названия кафедр, фонд финансирования которых
--меньше 11000 или больше 25000.
--7. Вывести названия факультетов кроме факультета “Computer
--Science”.
--8. Вывести фамилии и должности преподавателей, которые
--не являются профессорами.
--9. Вывести фамилии, должности, ставки и надбавки ассистентов, у которых надбавка в диапазоне от 160 до 550.
--10.Вывести фамилии и ставки ассистентов.
--11.Вывести фамилии и должности преподавателей, которые
--были приняты на работу до 01.01.2000.
--12.Вывести названия кафедр, которые в алфавитном порядке
--располагаются до кафедры “Software Development”. Выводимое поле должно иметь название “Name of Department”.
--13.Вывести фамилии ассистентов, имеющих зарплату (сумма
--ставки и надбавки) не более 1200.
--14.Вывести названия групп 5-го курса, имеющих рейтинг
--в диапазоне от 2 до 4.
--15.Вывести фамилии ассистентов со ставкой меньше 550 или
--надбавкой меньше 200.

create database Academy 
go
use Academy

create table Departments(
id int identity(1,1) primary key ,
Name nvarchar(100) not null unique check (Name!=' ')  ,
Financing money not null check (Financing>=0) default 0
)

create table Groups(
id int identity(1,1) primary key,
Name nvarchar(10) not null unique check (Name!=' '),
Rating int not null check (Rating>=0 and Rating<=5),
year int not null check (year>=1 and year<=5)
)

create table Faculties(
id int identity (1,1) primary key,
Name nvarchar(100) not null unique check (Name!=' '),
Dean nvarchar(max) not null 
)

create table Teachers(
id int identity(1,1) primary key,
EmploymentDate date not null check (EmploymentDate>='01.01.1990'),
IsAssistant bit not null default 0,
IsProfessor bit not null default 0 ,
Name nvarchar(100)not null unique check (Name!=' '),
Position nvarchar(max) not null check(Position!=' '),
Premium money not null default 0 check(Premium>=0),
Salary money not null check(Salary>0),
Surname nvarchar(max) not null check(Surname!=' ')
)

insert Departments (Financing,Name) values
(1000,'Biomedical Engenieer'),
(2000,'Mobile Technology'),
(3000,'Computer Science and Technology'),
(1500,'Power Engineering'),
(2500,'Cybernetics and Measurments')

insert Groups(Name,Rating,year) values
('BE-1',3,5),
('MT-2',4,4),
('CSaT-3',5,5),
('PE-4',2,2),
('CaM',1,1)

insert Faculties(Dean,Name) values
('Dean1', 'Biomedical Engenieer'),
('Dean2', 'Mobile Technology'),
('Dean3','Computer Scienc and Technology'),
('Dean4', 'Power Engineering'),
('Dean5', 'Cybernetics and Measurments')

insert Teachers(EmploymentDate,IsAssistant,IsProfessor,Name,Position,Premium,Salary,Surname) values 
('27.08.1991',0,1,'Dean1','Biomedical Engenieer teacher',500,1060,'Dean1'),
('28.09.1992',0,1,'Dean2','Mobile Technology teacher',600,1200,'Dean2'),
('29.10.1993',1,0,'Dean3','Computer Scienc and Technology',400,900,'Dean3'),
('30.11.1994',1,0,'Dean4','Power Engineering',300,800,'Dean4'),
('26.06.1995',0,1,'Dean5','Cybernetics and Measurments',200,800,'Dean5')

--1)Вывести таблицу кафедр, но расположить ее поля в обратном порядке.
select Name,Financing
from Departments

--2)Вывести названия групп и их рейтинги с уточнением имен полей именем таблицы.
select Name as Name_Groups ,Rating as Rating_Groups
from Groups

--3)Вывести для преподавателей их фамилию, процент ставки по отношению к надбавке и процент ставки по отношению к зарплате (сумма ставки и надбавки).
select Surname , (salary/premium)*100 as 'Процент ставки по отношению к надбавки ' ,(salary/premium+salary) as 'Процент ставки по отношению к зарплате'
from Teachers

--4)Вывести таблицу факультетов в виде одного поля в следующем формате: “The dean of faculty [faculty] is [dean].”.
select 'The dean of faculty '  +Name+ ' is ' +Dean 
from Faculties

--5). Вывести фамилии преподавателей, которые являются профессорами и ставка которых превышает 1050.
select Surname from Teachers  where IsProfessor=1 and Salary > 1050

--6)Вывести названия кафедр, фонд финансирования которых меньше 11000 или больше 25000.
select Name from Departments where Financing<11000 or Financing>25000

--7)Вывести названия факультетов кроме факультета “Computer Scienc and Technology”
select Name from Faculties where Name!='Computer Scienc and Technology'

--8)Вывести фамилии и должности преподавателей, которые не являются профессорами.
select Name,Position from Teachers where IsProfessor=0

--9)Вывести фамилии, должности, ставки и надбавки ассистентов, у которых надбавка в диапазоне от 160 до 550.
select Surname,Position,Salary,Premium from Teachers where IsAssistant=1 and Premium>160 and Premium<550

--10)Вывести фамилии и ставки ассистентов.
select Surname,Salary from Teachers where IsAssistant=1

--11)Вывести фамилии и должности преподавателей, которые были приняты на работу до 01.01.2000.
select Surname,Position from Teachers where EmploymentDate<='01.01.2000'

--12)Вывести названия кафедр, которые в алфавитном порядке располагаются до кафедры “Power Engineering”. Выводимое поле должно иметь название “Name of Department”
select Name as 'Name of Departments' from Departments where Name<'Power Engineering' order by Name 

--13)Вывести фамилии ассистентов, имеющих зарплату (сумма ставки и надбавки) не более 1200.
select Surname from Teachers where IsAssistant=1 and Salary+Premium<=1200

--14)Вывести названия групп 5-го курса, имеющих рейтинг в диапазоне от 2 до 4.
select Name from Groups where year=5 and Rating>2 and Rating<4

--15)Вывести фамилии ассистентов со ставкой меньше 550 или надбавкой меньше 200.
select Surname from Teachers where IsAssistant=1 and Salary<550 or Premium<200





