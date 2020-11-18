#include "Student.h"

Student::Student(const char* n, int y) //конструктор класа
{
	year = y;
	name = _strdup(n); 
}

Student::Student()
{
	name = _strdup("empty");
	year = 0;
}

Student::Student(const Student& obj)
{
	year = obj.year;
	name = _strdup(obj.name);
}

Student::Student(Student&& obj) noexcept 
{
	year = obj.year;
	name = obj.name;
	obj.name = nullptr;
}

Student::~Student() 
{
	delete[]name;
}

int Student::getYear()const
{
	return year;
}

void Student::setYear(int val) // сеттер для установки и проверки значений 
{
	year = val;
}

const char* Student::getName()const
{
	return name;
}

void Student::setName(const char* val)
{
	delete[]name;
	name = _strdup(val);
}

void Student::Show()const
{
	cout << "Имя: " << name << "; Год рождения: " << year << "\n";
}
