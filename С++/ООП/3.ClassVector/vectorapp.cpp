#include "Vector.h"
#include <iostream>
using namespace std;
int main()
{
	myVector a;
	cout << "A = \n";
	a.Show();
	myVector b(10, 15);
	cout << "B = \n";
	b.Show();
	cout << "C = \n";
	myVector c(b);
	c.Show();
	cout << "A = B \n";
	a = b;
	a.Show();
	cout << "A == B " << (a == b) << endl;
	cout << "A > B " << (a > b) << endl;
	cout << "A < B " << (a < b) << endl;
	cout << "A >= B " << (a >= b) << endl;
	cout << "A <= B " << (a <= b) << endl;
	cout << "A != B " << (a != b) << endl;
	cout << "A[6] = " << a[6] << endl;
	cout << "A empty  " << a.Empty() << endl;
	cout << "A size  " << a.Size() << endl;
	cout << "A clear  \n";
	a.Clear();
	a.Show();
	cout << "b Insert (5, 108)  b Insert(9, 1000) \n";
	b.Insert(5, 108);
	b.Insert(9, 1000);
	b.Show();
	cout << "b Erase 5 \n";
	b.Erase(5);
	b.Show();
	cout << "A Insert  10 \n";
	a.Insert(0, 10);
	a.Show();
	cout << "b push_back 5 \n";
	b.Push_Back(5);
	b.Show();
	cout << "b Pop_back \n";
	b.Pop_back();
	b.Show();
	cout << "b resize \n";
	b.Resize(5);
	b.Show();
	cout << "b size " << b.Size() << endl;
	cout << "b Erase 0,3 \n";
	b.Erase(0, 3);
	b.Show();
}
