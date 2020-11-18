#pragma once
#include <iostream>
#define _CRT_SECURE_NO_WARNINGS
using namespace std;
class Time
{
private:
	int hour, min, sec;
public:
	Time(int h, int m, int s);
	Time();
	int getHour()const;
	void setHour(int val);
	int getMin()const;
	void setMin(int val);
	int getSec()const;
	void setSec(int val);
	void Show()const;
	int timeToSeconds(Time& t);
	int timeToSeconds(int h, int m, int s);
	Time secondsToTime(int sec);
	Time operator +(Time obj);
	Time operator +(int val);
	Time operator -(Time obj);
	Time operator -(int val);
	void operator ++();
	void operator ++(int);
	void operator --();
	void operator --(int);
	bool operator <(Time obj);
	bool operator >(Time obj);
	bool operator <=(Time obj);
	bool operator >=(Time obj);
	bool operator ==(Time obj);
	bool operator !=(Time obj);
};
