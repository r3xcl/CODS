#include <iostream>
#include "Node.h"
#include "List.h"
using namespace std;
int main()
{
    List<int> list{ 21,35,40 };
    List<int> li{ 21,35,40 };
    auto l = list;
    l.print();
    list.print();
    list.push_back(234);
    list.print();
    list.push_back(92);
    list.print();
    list.push_back(175);
    list.print();
    list.push_back(88);
    list.print();
	cout << "------------------------\n";
    cout << "Pop front\n";
    list.pop_front();
    list.pop_back();
    list.print();
	cout << "------------------------\n";
    cout << "List + li\n";
    list = list + li;
    list.print();
    list = li;
    list.print();
	cout << "------------------------\n";
    cout << "Emplace\n";
    li.emplace(2, 2);
    li.print();
    list = list + li;
    list.print();
	cout << "------------------------\n";
    cout << "Push front\n";
    list.push_front(88);
    list.push_front(8);
    list.print();
	cout << "------------------------\n";
    cout << "Erase 3\n";
    list.erase(3);
    list.print();
	cout << "------------------------\n";
    cout << "Erase 2\n";
    list.erase(2);
    list.print();
	cout << "------------------------\n";
    cout << "Erase 1,3\n";
    list.erase(1, 3);
    list.print();
}
