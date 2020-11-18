#include "Student.h"
#include "Group.h"

int input_int()
{
	int i;
	cin >> i;
	while (cin.fail())
	{
		cin.clear();
		cin.ignore(100, '\n');
		cout << "Введено неправильное значение" << endl;
		cin >> i;
	}
	return i;
}

int main()
{
	setlocale(LC_ALL, "rus");
	Group group("Mehaniki", 1);
	group.AddStudent(Student("Petr", 2000));
	group.AddStudent(Student("Mariya", 2000));
	group.AddStudent(Student("Ivan", 2000));
	group.AddStudent(Student("Sergey", 2000));
	int year = 0;
	int el = 0;
	int choice = 0;
	while (choice != 4)
	{
		cout << "-----------------------------------------\n";
		cout << "Выберите действие:\n1.Вывод на экран \n2.Добавить студента в группу\n3.Удалить студента\n4.Выход " << endl;
		cout << "-----------------------------------------\n";
		choice = input_int();
		switch (choice)
		{
		case 1:
			group.Show();
			break;
		case 2:
			char name[1000];
			cout << "Введите имя на англ.  \n";
			cin.ignore();
			cin.getline(name, 1000);
			cout << "Введите год рождения \n";
			year = input_int();
			group.AddStudent(Student(name, year));
			group.Show();
			break;
		case 3:
			cout << "Введите номер строки для удаления: ";
			el = input_int();
			group.DelStudent(el);
			group.Show();
			break;
		default:
			choice = 4;
			break;
		}
	}
	return 0;
}
