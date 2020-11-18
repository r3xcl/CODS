#include "time.h"

Time::Time(int h, int m, int s)
{
	setlocale(LC_ALL, "ru");
	if (h >= 0 && h < 24)
	{
		hour = h;
	}
	else
	{
		hour = 0;
		cout << "Значение часа не может быть больше 24 \n";
	}
	if (m >= 0 && m < 60)
	{
		min = m;
	}
	else
	{
		min = 0;
		cout << "Значение минут не может быть больше 60 \n";
	}
	if (s >= 0 && s < 60)
	{
		sec = s;
	}
	else
	{
		sec = 0;
		cout << "Значение секунд не может быть больше 60 \n";
	}
}

Time::Time()
{
	hour = 0;
	min = 0;
	sec = 0;
}

int Time::getHour() const
{
	return hour;
}

void Time::setHour(int val)
{
	if (val >= 0 && val < 24)
	{
		hour = val;
	}
	else
	{
		cout << "Error\n";
	}
}

int Time::getMin() const
{
	return min;
}

void Time::setMin(int val)
{
	if (val >= 0 && val < 60)
	{
		min = val;
	}
	else
	{
		cout << "Error\n";
	}
}

int Time::getSec() const
{
	return sec;
}

void Time::setSec(int val)
{
	if (val >= 0 && val < 60)
	{
		min = val;
	}
	else
	{
		cout << "Error\n";
	}
}

void Time::Show() const
{
	cout << hour << " : " << min << " : " << sec << "\n";
}

int Time::timeToSeconds(Time& t)
{
	return t.getSec() + t.getMin() * 60 + t.getHour() * 3600;
}

int Time::timeToSeconds(int h, int m, int s)
{
	return s + m * 60 + h * 3600;
}

Time Time::secondsToTime(int sec)
{
	int h = sec / 3600;
	int m = (sec - h * 3600) / 60;
	int s = sec - h * 3600 - m * 60;
	return Time(h, m, s);
}

Time Time::operator+(Time obj)
{
	return Time(this->secondsToTime(this->timeToSeconds(this->getHour(), this->getMin(), this->getSec()) + obj.timeToSeconds(obj)));
}

Time Time::operator+(int val)
{
	return Time(this->secondsToTime(this->timeToSeconds(this->getHour(), this->getMin(), this->getSec()) + val));
}

Time Time::operator-(Time obj)
{
	return Time(this->secondsToTime(this->timeToSeconds(this->getHour(), this->getMin(), this->getSec()) - obj.timeToSeconds(obj)));
}

Time Time::operator-(int val)
{
	return Time(this->secondsToTime(this->timeToSeconds(this->getHour(), this->getMin(), this->getSec()) - val));
}

void Time::operator++()
{
	++this->sec;
	if (this->sec >= 60)
	{
		this->min++; this->sec -= 60;
	}
	if (this->min >= 60)
	{
		this->hour++; this->min -= 60;
	}
	if (this->hour >= 24)
	{
		this->hour = 0;
	}
}

void Time::operator++(int)
{
	this->sec++;
	if (this->sec >= 60)
	{
		this->min++; this->sec -= 60;
	}
	if (this->min >= 60)
	{
		this->hour++; this->min -= 60;
	}
	if (this->hour >= 24)
	{
		this->hour = 0;
	}
}

void Time::operator--()
{
	--this->sec;
	while (this->sec < 0)
	{
		this->min--; this->sec += 60;
	}
	while (this->min < 0)
	{
		this->hour--; this->min += 60;
	}
	while (this->hour < 0)
		this->hour++;
}

void Time::operator--(int)
{
	this->sec--;
	while (this->sec < 0)
	{
		this->min--; this->sec += 60;
	}
	while (this->min < 0)
	{
		this->hour--; this->min += 60;
	}
	while (this->hour < 0)
		this->hour++;
}

bool Time::operator<(Time obj)
{
	if (this->hour < obj.hour)
	{
		if (this->min < obj.min)
		{
			if (this->sec < obj.sec)
				return true;
			else
				return false;
		}
		else return false;
	}
	else return false;
}

bool Time::operator>(Time obj)
{
	if (this->hour > obj.hour)
	{
		if (this->min > obj.min)
		{
			if (this->sec > obj.sec)
				return true;
			else
				return false;
		}
		else return false;
	}
	else return false;
}

bool Time::operator<=(Time obj)
{
	if (this->hour <= obj.hour)
	{
		if (this->min <= obj.min)
		{
			if (this->sec <= obj.sec)
				return true;
			else
				return false;
		}
		else return false;
	}
	else return false;
}

bool Time::operator>=(Time obj)
{
	if (this->hour >= obj.hour)
	{
		if (this->min >= obj.min)
		{
			if (this->sec >= obj.sec)
				return true;
			else
				return false;
		}
		else return false;
	}
	else return false;
}

bool Time::operator==(Time obj)
{
	if (this->hour == obj.hour)
	{
		if (this->min == obj.min)
		{
			if (this->sec == obj.sec)
				return true;
			else
				return false;
		}
		else return false;
	}
	else return false;
}

bool Time::operator!=(Time obj)
{
	if (this->hour == obj.hour)
	{
		if (this->min == obj.min)
		{
			if (this->sec == obj.sec)
				return false;
			else
				return true;
		}
		else return true;
	}
	else return true;
}
