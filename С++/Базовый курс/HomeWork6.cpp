//Пользователь создает двумерный массив с размерностью 5 х 5 и заполняет его случайными числами. Программа считает сумму по главной или вспомогательной диагонали или по указанному пользователем столбцу либо по указанной строке. Общение с пользователем реализовать при помощи меню.  

#include <iostream>
#include <stdlib.h>
#include <time.h>
using namespace std;


int main()
{
	setlocale(LC_ALL, "ru");
	const int m = 5;//строки
	const int n = 5;//столбцы 
	int a[m][n];//5x5 размер массива 
	int sum_g=0;
	int sum_v=0;
	
	for (int i = 0; i < m; i++)
	{
		for (int j = 0; j < n; j++)
		{

			a[i][j] = rand() % 100;

			cout << a[i][j] << " ";
		}
		cout << "\n\n";
	}
	
	cout << "1-Посчитать сумму по главной диагонале \n";
	cout << "2-Посчитать сумму по вспомогательной диагонале \n";
	cout << "3-Посчитать сумму по указаному столбцу \n";
	cout << "4-Посчитать сумму по указаной строке \n";
	int b;
	cin >> b;

	if (b == 1) {
		for (int i = 0; i < 5; i++)
		{
			for (int j = 0; j < 5; j++)
			{
				if (i == j)
				{
					sum_g += a[i][j];
				}

			}
		}
		cout << "Сумма по главной диагонале : = " << sum_g << "\n";
	} 

	if (b == 2) {
		for (int i = 0; i < 5; i++)
		{
			for (int j = 0; j < 5; j++)
			{
				if (i + j == 4)
				{
					sum_v += a[i][j];
				}

			}

		}
		cout << "Сумма по вспомогательной диагонале : = " << sum_v << "\n";


	}

	if (b==3) {



	}
}
