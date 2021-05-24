--1. Вывести содержимое таблицы палат.
--2. Вывести фамилии и телефоны всех врачей.
--3. Вывести все этажи без повторений, на которых располагаются палаты.
--4. Вывести названия заболеваний под именем “Name of Disease” и степень их тяжести под именем “Severity of Disease”.
--5. Использовать выражение FROM для любых трех таблиц базы данных, используя для них псевдонимы.
--6. Вывести названия отделений, расположенных в корпусе 5 и имеющих фонд финансирования менее 30000.
--7. Вывести названия отделений, расположенных в 3-м корпусе с фондом финансирования в диапазоне от 12000 до 15000.
--8. Вывести названия палат, расположенных в корпусах 4 и 5 на 1-м этаже.
--9. Вывести названия, корпуса и фонды финансирования отделений, расположенных в корпусах 3 или 6 и имеющих фонд финансирования меньше 11000 или больше 25000.
--10. Вывести фамилии врачей, чья зарплата (сумма ставки и надбавки) превышает 1500.
--11. Вывести фамилии врачей, у которых половина зарплаты превышает троекратную надбавку.
--12. Вывести названия обследований без повторений, проводимых в первые три дня недели с 12:00 до 15:00.
--13. Вывести названия и номера корпусов отделений, расположенных в корпусах 1, 3, 8 или 10.
--14. Вывести названия заболеваний всех степеней тяжести,кроме 1-й и 2-й.
--15. Вывести названия отделений, которые не располагаются в 1-м или 3-м корпусе.
--16. Вывести названия отделений, которые располагаются в 1-м или 3-м корпусе.
--17. Вывести фамилии врачей, начинающиеся на букву “N”.

create database Hospital
go
use Hospital
--table.1
create table Departments ( 
id int identity(1,1) primary key,
Building int not null check (Building>=1 and  Building<=5),
Financing money not null check(Financing!=0) default 0 ,
Floor int not null check (Floor>=1),
Name nvarchar(100) not null check(Name!=' ') unique 
)
--table.2
create table Diseases(
id int identity(1,1)primary key,
Name nvarchar(100) not null check(Name!=' ')unique, 
Severity int not null check(Severity>=1) default 1

)
--table.3
create table Doctors(
id int identity(1,1) primary key ,
Name nvarchar(max) not null check (Name!=' ') ,
Phone char(100) not null ,
Premium money not null check (Premium>0) default 0,
Salary money not null check (Salary>0),
Surname nvarchar(max) not null check(Surname!=' ')
)
--table.4
create table Examinations(
id int identity(1,1) primary key ,
DayOfWeek int not null check(DayOfWeek>=1 and DayOfWeek<=7),
EndTime time not null ,
Name nvarchar(100) not null check(Name!=' ') unique ,
StartTime time not null check(StartTime>='8:00' and StartTime<='18:00')
)
--table.5
create table Wards(
id int identity(1,1) primary key ,
Building int not null check(Building>=1 and Building<=5),
Floor int not null check(Floor>=1),
Name nvarchar(20) not null check(Name!=' ') unique 
)
--Заполнение таблицы 1
insert Departments(Building,Financing,Floor,Name) values 
(1,1000,2,'Стоматология'),
(2,2000,3,'Хирургия'),
(3,3000,4,'Неврология'),
(4,4000,5,'Кардиология'),
(5,5000,6,'Гастроэнтерология')
--Заполнение таблицы 2 
insert Diseases(Name,Severity) values
('Кариес',2),
('Абсцесс',3),
('Инсульт',2),
('Аритмия',4),
('Гастрит',5)
--Заполнение таблицы 3
insert Doctors(Name,Phone,Premium,Salary,Surname) values 
('Петя',0501111111,200,1000,'Петечкин'),
('Вася',0502222222,300,1500,'Васечкин'),
('Ваня',0503333333,400,2000,'Ванечкин'),
('Саша',0504444444,500,2500,'Сашечкин'),
('Бодя',0505555555,600,3000,'Бодечкин')
--Заполнение таблицы 4
insert Examinations(DayOfWeek,EndTime,Name,StartTime) values 
(1,'9:00','Обследование Кариеса','8:00'),
(2,'10:00','Обследование Абцесса','9:01'),
(3,'11:00','Обследование Инсульта','10:01'),
(4,'12:00','Обследование Аритмии','11:01'),
(5,'13:00','Обследование Гастрита','12:01')
--Заполнение таблицы 5 
insert Wards(Building,Floor,Name) values
(1,1,'Палата 1'),
(2,2,'Палата 2'),
(3,3,'Палата 3'),
(4,4,'Палата 4'),
(5,5,'Палата 5')
--1) Вывести содержимое таблицы палат.
select *
from Wards 
--2) Вывести фамилии и телефоны всех врачей.
select Phone,Surname 
from Doctors 
--3) Вывести все этажи без повторений, на которых распола- гаются палаты.
select distinct  Floor	
from Wards 
--4) Вывести названия заболеваний под именем “Name of Disease” и степень их тяжести под именем “Severity of Disease”.
select Name as 'Name of Disease',Severity as 'Severity of Disease'
from Diseases 
--5) Использовать выражение FROM для любых трех таблиц базы данных, используя для них псевдонимы.
create database Hospital 
go
use Hospital
--table.1
create table Departments ( 
id int identity(1,1) primary key,
Building int not null check (Building>=1 and  Building<=5),
Financing money not null check(Financing!=0) default 0 ,
Floor int not null check (Floor>=1),
Name nvarchar(100) not null check(Name!=' ') unique 
)
--table.2
create table Diseases(
id int identity(1,1)primary key,
Name nvarchar(100) not null check(Name!=' ')unique, 
Severity int not null check(Severity>=1) default 1

)
--table.3
create table Doctors(
id int identity(1,1) primary key ,
Name nvarchar(max) not null check (Name!=' ') ,
Phone char(100) not null ,
Premium money not null check (Premium>0) default 0,
Salary money not null check (Salary>0),
Surname nvarchar(max) not null check(Surname!=' ')
)
--table.4
create table Examinations(
id int identity(1,1) primary key ,
DayOfWeek int not null check(DayOfWeek>=1 and DayOfWeek<=7),
EndTime time not null ,
Name nvarchar(100) not null check(Name!=' ') unique ,
StartTime time not null check(StartTime>='8:00' and StartTime<='18:00')
)
--table.5
create table Wards(
id int identity(1,1) primary key ,
Building int not null check(Building>=1 and Building<=5),
Floor int not null check(Floor>=1),
Name nvarchar(20) not null check(Name!=' ') unique 
)
--Заполнение таблицы 1
insert Departments(Building,Financing,Floor,Name) values 
(1,1000,2,'Стоматология'),
(2,2000,3,'Хирургия'),
(3,3000,4,'Неврология'),
(4,4000,5,'Кардиология'),
(5,5000,6,'Гастроэнтерология')
--Заполнение таблицы 2 
insert Diseases(Name,Severity) values
('Кариес',2),
('Абсцесс',3),
('Инсульт',2),
('Аритмия',4),
('Гастрит',5)
--Заполнение таблицы 3
insert Doctors(Name,Phone,Premium,Salary,Surname) values 
('Петя',0501111111,200,1000,'Петечкин'),
('Вася',0502222222,300,1500,'Васечкин'),
('Ваня',0503333333,400,2000,'Ванечкин'),
('Саша',0504444444,500,2500,'Сашечкин'),
('Бодя',0505555555,600,3000,'Бодечкин')
--Заполнение таблицы 4
insert Examinations(DayOfWeek,EndTime,Name,StartTime) values 
(1,'9:00','Обследование Кариеса','8:00'),
(2,'10:00','Обследование Абцесса','9:01'),
(3,'11:00','Обследование Инсульта','10:01'),
(4,'12:00','Обследование Аритмии','11:01'),
(5,'13:00','Обследование Гастрита','12:01')
--Заполнение таблицы 5 
insert Wards(Building,Floor,Name) values
(1,1,'Палата 1'),
(2,2,'Палата 2'),
(3,3,'Палата 3'),
(4,4,'Палата 4'),
(5,5,'Палата 5')
--1) Вывести содержимое таблицы палат.
select *
from Wards 
--2) Вывести фамилии и телефоны всех врачей.
select Phone,Surname 
from Doctors 
--3) Вывести все этажи без повторений, на которых распола- гаются палаты.
select distinct  Floor	
from Wards 
--4) Вывести названия заболеваний под именем “Name of Disease” и степень их тяжести под именем “Severity of Disease”.
select Name as 'Name of Disease',Severity as 'Severity of Disease'
from Diseases 
--5) Использовать выражение FROM для любых трех таблиц базы данных, используя для них псевдонимы.
select D.Name,W.Name,E.Name 
from Departments as D,Wards as W,Examinations as E
--6) Вывести названия отделений, расположенных в корпусе 5 и имеющих фонд финансирования менее 30000.
select Name from Departments where Building=5 and Financing<30000
--7) Вывести названия отделений, расположенных в 3-м корпусе с фондом финансирования в диапазоне от 12000 до 15000.
select Name from Departments where Building=3 and Financing>=12000 and Financing<=15000
--8) Вывести названия палат, расположенных в корпусах 4 и 5 на 1-м этаже.
select Name from Wards where Building=4 and Building =5 and Floor=1 
--9) Вывести названия, корпуса и фонды финансирования отделений, расположенных в корпусах 3 или 6 и имеющих фонд финансирования меньше 11000 или больше 25000.
select Name,Building,Financing from Departments where Building=3 and Building=6 and Financing<11000 or Financing>25000
--10) Вывести фамилии врачей, чья зарплата (сумма ставки и надбавки) превышает 1500.
select Surname from Doctors where (Premium+Salary)>1500
--11) Вывести фамилии врачей, у которых половина зарплаты превышает троекратную надбавку.
select Surname from Doctors where (Salary/2)>(3*Premium)
--12) Вывести названия обследований без повторений, проводимых в первые три дня недели с 12:00 до 15:00.

select distinct Name from Examinations where DayOfWeek<=3 and StartTime>='12:00' and EndTime<='15:00'  
--13) Вывести названия и номера корпусов отделений, расположенных в корпусах 1, 3, 8 или 10.
select Name,Building from Departments where Building=1 and Building=3 and Building=8 or Building=10 
--14) Вывести названия заболеваний всех степеней тяжести, кроме 1-й и 2-й.
select Name from Diseases where Severity!=1 and Severity!=2

--15) Вывести названия отделений, которые не располагаются в 1-м или 3-м корпусе.
select Name from Departments where Building!=1 or Building!=3 

--16) Вывести названия отделений, которые располагаются в 1-м или 3-м корпусе.
select Name from Departments where Building=1 or Building=3

--17) Вывести фамилии врачей, начинающиеся на букву “N”.
select Surname from Doctors where Surname like 'N%'
--6) Вывести названия отделений, расположенных в корпусе 5 и имеющих фонд финансирования менее 30000.
select Name from Departments where Building=5 and Financing<30000
--7) Вывести названия отделений, расположенных в 3-м корпусе с фондом финансирования в диапазоне от 12000 до 15000.
select Name from Departments where Building=3 and Financing>=12000 and Financing<=15000
--8) Вывести названия палат, расположенных в корпусах 4 и 5 на 1-м этаже.
select Name from Wards where Building=4 and Building =5 and Floor=1 
--9) Вывести названия, корпуса и фонды финансирования отделений, расположенных в корпусах 3 или 6 и имеющих фонд финансирования меньше 11000 или больше 25000.
select Name,Building,Financing from Departments where Building=3 and Building=6 and Financing<11000 or Financing>25000
--10) Вывести фамилии врачей, чья зарплата (сумма ставки и надбавки) превышает 1500.
select Surname from Doctors where (Premium+Salary)>1500
--11) Вывести фамилии врачей, у которых половина зарплаты превышает троекратную надбавку.
select Surname from Doctors where (Salary/2)>(3*Premium)
--12) Вывести названия обследований без повторений, проводимых в первые три дня недели с 12:00 до 15:00.

select distinct Name from Examinations where DayOfWeek<=3 and StartTime>='12:00' and EndTime<='15:00'  
--13) Вывести названия и номера корпусов отделений, расположенных в корпусах 1, 3, 8 или 10.
select Name,Building from Departments where Building=1 and Building=3 and Building=8 or Building=10 
--14) Вывести названия заболеваний всех степеней тяжести, кроме 1-й и 2-й.
select Name from Diseases where Severity!=1 and Severity!=2

--15) Вывести названия отделений, которые не располагаются в 1-м или 3-м корпусе.
select Name from Departments where Building!=1 or Building!=3 

--16) Вывести названия отделений, которые располагаются в 1-м или 3-м корпусе.
select Name from Departments where Building=1 or Building=3

--17) Вывести фамилии врачей, начинающиеся на букву “N”.
select Surname from Doctors where Surname like 'N%'
