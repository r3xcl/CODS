#pragma once
#include <iostream>
#define _CRT_SECURE_NO_WARNINGS
using namespace std;
class Student
{
private: 
	char* name;
	int year;
public:
	Student(const char* name, int year);
	Student();
	Student(const Student&odj);
	Student(Student&& odj)noexcept;
	~Student();
	int getYear()const;
	void setYear(int val);
	const char* getName()const;
	void setName(const char* val);
	void Show()const;
};
