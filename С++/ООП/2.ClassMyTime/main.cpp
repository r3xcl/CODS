//Создайте класс myTime, который будет содержать информацию
//о времени (часы(0-24), минуты(0-60), секунды(0-60)). Класс
//должен иметь сеттеры, геттеры, конструкторы. С помощью
//механизма перегрузки операторов, определите операции: 





#include <iostream>
#include "time.h"

int main()
{
	Time t1(3, 2, 1);
	Time t2(5, 6, 7);
	Time t3(1, 2, 3);

	t2.Show();
	t1.Show();
	cout << t2.timeToSeconds(t2) << endl;
	t3 = t2 + t1;
	t3.Show();
	t3 = t2 - t1;
	t3.Show();
	t3 = t2 + 1000;
	t3.Show();
	t3 = t2 - 1000;
	t3.Show();
	t2++;
	++t2;
	t2.Show();
	t2--;
	--t2;
	--t2;
	t2.Show();
	cout << (t1 > t2) << endl;
	cout << (t1 < t2) << endl;
	cout << (t1 == t2) << endl;
	cout << (t1 >= t2) << endl;
	cout << (t1 <= t2) << endl;
	cout << (t1 != t2) << endl;
}
