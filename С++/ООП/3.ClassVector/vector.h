#pragma once
class myVector
{
private:
	int* arr = nullptr;
	int size = 0;
public:
	myVector();
	myVector(const myVector& c);
	myVector(myVector&& obj)noexcept;
	myVector(int n, int val);
	~myVector();
	int getSize()const;
	void setSize(int val);
	const int* getArr()const;
	void Show() const;
	myVector& operator=(const myVector& obj);
	myVector& operator=(myVector&& obj)noexcept;
	bool operator <(myVector& obj)const;
	bool operator >(myVector& obj)const;
	bool operator <=(myVector& obj)const;
	bool operator >=(myVector& obj)const;
	bool operator ==(myVector& obj)const;
	bool operator !=(myVector& obj)const;
	int& operator[](int pos);
	int operator[](int pos)const;
	bool Empty()const;
	int Size()const;
	int Capacity()const;
	void Clear();
	void Insert(int poz, int val);
	void Erase(int poz);
	void Erase(int begin, int end);
	void Push_Back(int val);
	void Pop_back();
	void Resize(int new_size);
};
