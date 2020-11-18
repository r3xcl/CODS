// Итак, у нас с вами – неделя на выполнение экзаменационного задания. Задание такое: создать телефонную книгу. Поля: ФИО, номер телефона, email.
//-	Заполнение из файла и из консоли
//-	Сортировка по имени
//-	Добавление и удаление элементов
//-	Редактирование элементов
//-	Поиск элементов
//-	Ну и вывод на экран само собой 


#include <iostream>
#include <string>
#include <fstream>
#include <sstream>
#include <windows.h>
#include <list>
#include <algorithm>
#include <iterator>

#define _DataBase "E:\\phonebook.txt"
#define _MAX_LEN 1000




using namespace std;

class PhoneBook
{

	int i = 0;

private:
	char *FIO;
	char *Number;
	char *Email;
	
	

public:
	PhoneBook();
	~PhoneBook();
	void _Delete_Data();
	void _Menu_of_PhoneBook();
	void _Write_to_file();
	void _Read_from_file();
	void Redaction();
	void Sortirovka();
	

	friend ostream & operator << (ostream &stream, const PhoneBook &obj);
	friend istream & operator >> (istream &stream, PhoneBook &obj);
};


int main()
{
	
	PhoneBook obj;
	obj._Menu_of_PhoneBook();
}


PhoneBook::PhoneBook()
{

	FIO = new char[_MAX_LEN];
	Number = new char[_MAX_LEN];
	Email = new char[_MAX_LEN];
	

}

PhoneBook::~PhoneBook()
{

	delete[] FIO;
	delete[] Number;
	delete[] Email;


}

void PhoneBook::_Delete_Data()
{




	ifstream file_in;

	file_in.open("E:\\phonebook.txt");

	if (!file_in)
	{
		cerr << "Ошибка, невозможно открыть файл : E:\\phonebook.txt" << endl;

	}

	cout << "Введите номер строки для удаления :" << endl;
	int i_number_line_delete = 0;
	cin >> i_number_line_delete;

	int i_number_line_now = 0;
	string line;
	string line_file_text;

	while (getline(file_in, line))
	{
		i_number_line_now++;

		if (!(i_number_line_now == i_number_line_delete))
		{
			line_file_text.insert(line_file_text.size(), line);

			line_file_text.insert(line_file_text.size(), "\r\n");

		}
	}

	file_in.close();



	ofstream file_out;

	file_out.open("E:\\phonebook.txt", ios::trunc | ios::binary);



	file_out.write(line_file_text.c_str(), line_file_text.size());
	file_out.clear();


}


ostream &operator << (ostream &stream, const PhoneBook& obj)
{

	stream << obj.FIO << endl;
	stream << obj.Number << endl;
	stream << obj.Email << endl;
	return stream;
}

istream &operator >> (istream &stream, PhoneBook &obj)
{
	
	
	int FIO;
	cout << "Введите ФИО:" << endl; 
	cin >> FIO;
	stream >> obj.FIO;
	

	cout << "Введите номер телефона:" << endl;
	stream >> obj.Number;


	cout << "Введите электронный адрес:" << endl;
	stream >> obj.Email;

	
		

	


	return stream;
}


void PhoneBook::_Write_to_file()
{

	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);




	fstream io(_DataBase, ios::in | ios::app);
	if (!io)
	{
		cout << "Ошибка открытия файла" << endl;
	}
	else
	{
		cout << "Введите кол-во людей:" << endl;
		int kol;
		cin >> kol;
		for (int i = 0; i < kol; i++)
		{

			cin >> *this;
			io << *this;
		}
		io.close();
		
		
	}
}

void PhoneBook::_Read_from_file()
{

	fstream io(_DataBase, ios::in | ios::app);
	if (!io)
	{
		cout << "Ошибка открытия файла" << endl;
	}
	else
	{
		char _TempCH;
		while (!io.eof())
		{
			io.get(_TempCH);
			if (!io.eof())
				cout << _TempCH;
		}
		io.clear();
		cout << endl;
		io.close();
		
		
	}
}

void PhoneBook::Redaction()
{








}

void PhoneBook::Sortirovka()
{
	ifstream in("E:\\phonebook.txt");
	ofstream out("E:\\phonebooksort.txt");
	list<string> lines;

	while (!in.eof())
	{
		string s1;
		getline(in, s1, '\n');
		lines.push_back(s1);
	}
	lines.sort();
	copy(lines.begin(), lines.end(), ostream_iterator<string>(out, "\n"));
	in.close();
	out.close();



}


void PhoneBook::_Menu_of_PhoneBook()
{
	setlocale(0, "Rus");

	int choise = 0;
	cout << "\tMENU:" << endl;
	cout << "-----------------------------------------\n";
	cout << "1. Добавить данные в телефонную книгу:" << endl;
	cout << "2. Удалить данные из телефонной книги:" << endl;
	cout << "3. Редактировать данные из телефонной книги:" << endl;
	cout << "4. Вывести все данные на экран:" << endl;
	cout << "5. Сортировка по алфавиту:" << endl;
	cout << "6. Выход:" << endl;
	cout << "-----------------------------------------\n";
	cout << "Сделайте выбор:" << endl;
	cin >> choise;
	cout << "-----------------------------------------\n";
	switch (choise)
	{
	case 1:
		_Write_to_file();
		break;
	case 2:
		_Delete_Data();
		break;
	case 3:
		Redaction();
		break;
	case 4:
		_Read_from_file();
		break;
	case 5:
		Sortirovka();
		break;
	case 6:
		break;
	default:
		cout << "Выбрано неправильное значение меню" << endl;
	}
}
