//Домашнее задание: Stack.
//Написать программу, принимающую арифметическое выражение в виде строки, и
//определяющую корректность расстановки скобок в этом выражении. Учесть круглые «()»,
//квадратные«[]», фигурные «{}» и угловые «<>» скобки.
//Скобки считаются сбалансированными, если:
//a) количество открывающихся скобок совпадает с количеством закрывающихся;
//b) закрывающаяся скобка не идет раньше соответствующей ей открывающейся;
//c) соблюдается принцип вложенности скобок. 


#include <iostream>
#include <string>
#include <stack>

using namespace std;

stack<char> sta;

bool checkString(string str)
{
	for (int i = 0; i < str.length(); ++i)
	{
		if ((str[i] == '(') || (str[i] == '{') || (str[i] == '[')|| (str[i]=='<'))
			sta.push(str[i]);
		else if ((str[i] == ')') || (str[i] == '}') || (str[i] == ']') || (str[i] == '>'))
		{
			if (sta.size() == 0)
				return false;
			char c = sta.top();
			sta.pop();
			if ((c == '(' && str[i] != ')') || (c == '{' && str[i] != '}') || (c == '[' && str[i] != ']') || (c == '<' && str[i] != '>'))
				return false;
		}
	}
	return (sta.size() == 0);
}
void main()
{
	setlocale(LC_ALL, "rus");
	string str;
	int oper;
	cout << "Введите 1 чтобы продолжить или 0 чтобы выйти:" << endl; cin >> oper;
	do {
		switch (oper)
		{
		case 1:
			cout << "Введите выражение: "; cin >> str;
			if (checkString(str)) cout << "Выражение корректно" << endl;
			else cout << "Выражение некорректно " << endl;
			cout << "Введите 1 для продолжения , 0 для выхода:" << endl; cin >> oper;
			break;
		}
	} while (oper != 0);
	system("pause");
}
