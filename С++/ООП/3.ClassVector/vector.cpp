#include "Vector.h"
#include <iostream>
#define _CRT_SECURE_NO_WARNINGS
using namespace std;

myVector::myVector()
{
	size = 0;
	arr = nullptr;
}

myVector::myVector(const myVector& c)
{
	size = c.size;
	arr = new int[size];
	for (int i = 0; i < size; i++)
	{
		arr[i] = c.arr[i];
	}
}

myVector::myVector(myVector&& obj) noexcept
{
	size = obj.size;
	arr = obj.arr;
	obj.size = 0;
	obj.arr = nullptr;
}

myVector::myVector(int n, int val)
{
	size = n;
	arr = new int[size];
	for (int i = 0; i < size; i++)
	{
		arr[i] = val;
	}
}

myVector::~myVector()
{
	if (size)
	{
		delete[] arr;
	}
}

int myVector::getSize() const
{
	return size;
}

void myVector::setSize(int val)
{
	if (val > 0)
	{
		size = val;
	}
}

const int* myVector::getArr() const
{
	return arr;
}

void myVector::Show() const
{
	for (int i = 0; i < size; i++)
	{
		cout << arr[i] << " ";
	}
	cout << endl;
}

myVector& myVector::operator=(const myVector& obj)
{
	if (this == &obj)
		return *this;
	if (size)
		delete[]arr;
	size = obj.size;
	arr = new int[size];
	size = obj.size;
	for (int i = 0; i < obj.size; i++)
	{
		this->arr[i] = obj.arr[i];
	}
	return *this;
}

myVector& myVector::operator=(myVector&& obj) noexcept
{
	if (this == &obj)
		return *this;
	if (size)
		delete[]arr;
	size = obj.size;
	arr = obj.arr;
	obj.size = 0;
	obj.arr = nullptr;
	return *this;
}

bool myVector::operator<(myVector& obj) const
{
	if (this->size < obj.size)
	{
		return true;
	}
	else
	{
		return false;
	}
}

bool myVector::operator>(myVector& obj) const
{
	if (this->size > obj.size)
	{
		return true;
	}
	else
	{
		return false;
	}
}

bool myVector::operator<=(myVector& obj) const
{
	if (this->size <= obj.size)
	{
		return true;
	}
	else
	{
		return false;
	}
}

bool myVector::operator>=(myVector& obj) const
{
	if (this->size >= obj.size)
	{
		return true;
	}
	else
	{
		return false;
	}
}

bool myVector::operator==(myVector& obj) const
{
	if (this->size == obj.size)
	{
		return true;
	}
	else
	{
		return false;
	}
}

bool myVector::operator!=(myVector& obj) const
{
	if (this->size == obj.size)
	{
		return false;
	}
	else
	{
		return true;
	}
}

int& myVector::operator[](int pos)
{
	return arr[pos];
}

int myVector::operator[](int pos) const
{
	return arr[pos];
}

bool myVector::Empty() const
{
	if (size == 0)
	{
		return true;
	}
	else
	{
		return false;
	}
}

int myVector::Size() const
{
	return size;
}

int myVector::Capacity() const
{
	return sizeof(arr);
}

void myVector::Clear()
{
	size = 0;
	arr = nullptr;
}

void myVector::Insert(int poz, int val)
{
	if (poz <= size && poz >= 0)
	{
		if (size == 0)
		{
			size++;
			arr = new int[size];
			arr[poz] = val;
		}
		else
		{
			size++;
			int* t = new int[size];
			for (int i = 0; i < size; i++)
			{
				if (i != poz)
				{
					t[i] = arr[i];
				}
				else
				{
					t[i] = val;
					break;
				}
			}
			for (int i = poz + 1; i < size; i++)
			{
				t[i] = arr[i - 1];
			}
			arr = t;
		}
	}
	else
	{
		cout << "Error\n";
	}
}

void myVector::Erase(int poz)
{
	if (poz <= size && poz >= 0)
	{
		int* t = new int[size - 1];
		int j = 0;;
		for (int i = 0; i < size; i++)
		{
			if (i != poz)
			{
				t[j] = arr[i];
				j++;
			}
		}
		delete[]arr;
		size--;
		arr = t;
	}
	else
	{
		cout << "Error\n";
	}
}
void myVector::Erase(int begin, int end)
{
	if (begin <= size && begin >= 0 && end <= size && end >= 0)
	{
		for (int i = 0; i < size; i++)
		{
			if (i >= begin && i <= end)
			{
				Erase(i);
			}
		}
	}
	else
	{
		cout << "Error\n";
	}
}

void myVector::Push_Back(int val)
{
	if (size == 0)
	{
		size++;
		arr = new int[size];
		arr[0] == val;
	}
	else
	{
		size++;
		int* t = new int[size];
		for (int i = 0; i < size; i++)
		{
			t[i] = arr[i];
		}
		t[size - 1] = val;
		delete[] arr;
		arr = t;
	}
}

void myVector::Pop_back()
{
	if (size == 0)
	{
		cout << "Error\n";
	}
	else
	{
		size--;
		int* t = new int[size];
		for (int i = 0; i < size; i++)
		{
			t[i] = arr[i];
		}
		delete[] arr;
		arr = t;
	}
}

void myVector::Resize(int new_size)
{
	if (new_size > 0)
	{
		int* t = new int[new_size];
		for (int i = 0; i < new_size; i++)
			if (i < size)
				t[i] = arr[i];
			else
				t[i] = 0;
		delete[]arr;
		arr = t;
		size = new_size;
	}
	else
	{
		cout << "Error\n";
	}
}
