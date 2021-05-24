//ДЗ: Пользователь создает массив размером  5х5 и заполняет его случайными числами. Найти минимальный элемент массива и заменить им элементы ниже главной диагонали

#include <iostream> 

using namespace std;

int main()
{
	setlocale(LC_ALL, "ru");
	const int size = 5;
	int matriza[size][size];
	int min;
	int i, j;

	for (i = 0; i < size; i++)
		for (j = 0; j < size; j++)
		{
			cout << "Введите элементы матрицы:" << "[" << i << "][" << j << "]" << endl;
			cin >> matriza[i][j];
		}

	min = matriza[0][0];

	for (i = 0; i < size; i++)
		for (j = 1; j < size; j++)
			if (min > matriza[i][j])
			{
				min = matriza[i][j];
				
			}

	cout << "----------------\n";
	cout << "Минимальный элемент матрицы:" << min << endl;
	cout << "----------------\n";
	
}
