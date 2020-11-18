//Домашнее задание: Конструкторы. Деструкторы. Конструктор копирования.
//Написать класс, описывающий группу студентов. Описание студента
//также реализуется с помощью соответствующего класса.
//Студент:
//Поля:
//Имя;
//Год рождения.
//Группа:
//Поля:
//Факультет;
//Курс;
//Количество студентов;
//Студенты.
//Методы:
//Добавление студента в группу;
//Удаление студента из группы(по позиции);
//Вывод на экран всех студентов.

#include "Group.h"

Group::Group(const char* f, const int c)
{
	faculty = _strdup(f);
	cource = c;
}

Group::Group()
{
	faculty = _strdup("noname");
	cource = 0;
}

Group::Group(const Group& obj)
{
	faculty = _strdup(obj.faculty);
	cource = obj.cource;
	size = obj.size;
	arr = new Student[size];
	for (int i = 0; i < size; i++)
	{
		arr[i].setName(obj.arr[i].getName());
		arr[i].setYear(obj.arr[i].getYear());
	}
}

Group::Group(Group&& obj)noexcept
{
	faculty = obj.faculty;
	cource = obj.cource;
	size = obj.size;
	arr = obj.arr;
	obj.faculty = nullptr;
	obj.cource = 0;
	obj.size = 0;
	obj.arr = nullptr;
}

Group::~Group()
{
	delete[]faculty;
	if (size > 0)
		delete[]arr;
}

const char* Group::getFaculty() const
{
	return faculty;
}

const int Group::getCource() const
{
	return cource;
}

int Group::getSize() const
{
	return size;
}

void Group::setFaculty(const char* val)
{
	delete[]faculty;
	faculty = _strdup(val);
}

void Group::setCource(const int val)
{
	cource = val;
}

void Group::Show() const
{
	cout << "-----------------------------------------\n";
	cout << " Факультет: " << faculty << " Курс: " << cource << "\n" << "Студенты: \n";
	cout << "-----------------------------------------\n";
	for (int i = 0; i < size; i++)
	{
		cout << i + 1 << ". ";
		arr[i].Show();
	}
}

void Group::AddStudent(const Student& obj)
{
	if (size == 0)
	{
		arr = new Student[1];
	}
	else
	{
		Student* tmp = new Student[size + 1];
		for (int i = 0; i < size; i++)
		{
			tmp[i].setName(arr[i].getName());
			tmp[i].setYear(arr[i].getYear());
		}
		delete[]arr;
		arr = tmp;
	}
	arr[size].setName(obj.getName());
	arr[size].setYear(obj.getYear());
	size++;
}

void Group::DelStudent(int poz)
{
	if (poz > 0 && poz <= size) 
	{
		Student* tmp = new Student[size - 1];
		int j = 0;
		for (int i = 0; i < size; i++)
		{
			if (i != poz - 1)
			{
				tmp[j].setName(arr[i].getName());
				tmp[j].setYear(arr[i].getYear());
				j++;
			}
		}
		delete[]arr;
		arr = tmp;
		size--;
	}
	else
	{
		cout << "\nEROOR\n Выбраная строка не существует\n";
	}
}

