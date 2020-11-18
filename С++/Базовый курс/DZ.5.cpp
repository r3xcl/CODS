//Пользователь создает массив из 10 элементов. Подсчитать кол-во положительных, отрицательных и нулевых элементов

#include <locale>
#include <iostream>

using namespace std;

int main() {
	setlocale(LC_ALL, "Russian");
	const int m = 10;
	int plus = 0, minys = 0, nyl = 0;
	int a[10];
	cout << "Введите 10 элементов массива " << endl;
	for (int i = 0; i < m; i++) {      
		cin >> a[i];
		if (a[i] > 0) plus++;
		else if (a[i] < 0) minys++;
		else nyl++;
	}
	for (int i = 0; i < m; i++) {           
		cout << a[i] << " ";
	}
	cout << endl;
	cout << "Кол-во положительных элементов  = " << plus << endl;
	cout << "Кол-во отрицательных элементов  = " << minys << endl;
	cout << "Кол-во нулевых элементов  = " << nyl << endl;

	return 0;
}
