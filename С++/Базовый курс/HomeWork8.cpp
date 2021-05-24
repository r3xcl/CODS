
//Написать программу, которая записывает в файл телефонную книгу. Фамилия / Имя / Отчество. И номер телефона  
//Задача 
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#include <iostream> 
#include <string>
#include <fstream> 
using namespace std;
int main()
{
	setlocale(LC_ALL, "ru");
	string name;
	int number;
	int i;
	int stop;
	
	ofstream outfile("telkniga.txt");


	while (true)
	{
		cout << "Введите ФИО или stop" << endl;
		getline(cin, name);
		if (name == "stop")
			break;
		cout << "Введите номер телефона " << endl;
		cin >> number;
	
		cin.ignore(1);
		outfile << name << " " << number << " " << endl;
		
	}

	
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
