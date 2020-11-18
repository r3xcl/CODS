
#pragma once

#include "Node.h"
#include <initializer_list>
template <class T>
class List
{
    Node<T>* head = nullptr;
    Node<T>* tail = nullptr;
    int size = 0;
public:
    List();
    List(const initializer_list<T>& lst);
    ~List();
    List(const List& obj);
    List(List&& obj)noexcept;
    void push_back(T val);
    void push_front(T val);
    void pop_front();
    void pop_back();
    void print()const;
    void emplace(int pos, T val);
    void clear();
    void erase(int pos);
    void erase(int begin, int end);
    List<T>& operator=(const List& obj);
    List<T>& operator=(List&& obj)noexcept;
    List<T>& operator+(const List& obj);
};

template<class T>
List<T>& List<T>:: operator+(const List& obj)
{
    auto cur = obj.head;
    while (cur != nullptr)
    {
        this->push_back(cur->getData());
        cur = cur->getNext();
    }
    return *this;
}

template<class T>
List<T>& List<T>:: operator=(const List& obj)
{
    if (this == &obj)
        return *this;
    if (obj.size)
    {
        this->clear();
        auto cur = obj.head;
        while (cur != nullptr)
        {
            this->push_back(cur->getData());
            cur = cur->getNext();
        }
    }
    return *this;
}

template<class T>
List<T>& List<T>:: operator=(List&& obj)noexcept
{
    if (this == &obj)
        return *this;
    if (obj.size)
    {
        this->clear();
        auto cur = obj.head;
        while (cur != nullptr)
        {
            this->push_back(cur->getData());
            cur = cur->getNext();
        }
    }
    obj.clear();
    return *this;
}

template<class T>
List<T>::List() = default;

template<class T>
List<T>::List(List && obj)noexcept
{
    this->clear();
    auto cur = obj.head;
    while (cur != nullptr)
    {
        this->push_back(cur->getData());
        cur = cur->getNext();
    }
    obj.clear();
}

template<class T>
List<T>::List(const List & obj)
{
    this->clear();
    auto cur = obj.head;
    while (cur != nullptr)
    {
        this->push_back(cur->getData());
        cur = cur->getNext();
    }
}

template<class T>
List<T>::List(const initializer_list<T> & lst)
{
    for (auto item : lst)
    {
        push_back(item);
    }
}

template<class T>
List<T>::~List()
{
    while (size)
        pop_front();
}

template<class T>
void List<T>::pop_front()
{
    if (size == 0)
        return;
    if (size == 1)
    {
        delete head;
        head = tail = nullptr;
        size = 0;
        return;
    }
    auto tmp = head;
    head = head->getNext();
    delete tmp;
    size--;
}

template<class T>
inline void List<T>::pop_back()
{
    if (size == 0)
        return;
    if (size == 1)
    {
        delete tail;
        head = tail = nullptr;
        size = 0;
        return;
    }
    auto cur = head;
    for (int i = 0; i < size - 2; ++i)
    {
        cur = cur->getNext();
    }
    tail = cur;
    delete tail->getNext();
    tail->setNext(nullptr);
    size--;
}


template<class T>
void List<T>::print() const
{
    auto cur = head;
    while (cur != nullptr)
    {
        cout << cur->getData() << " ";
        cur = cur->getNext();
    }
    cout << endl;
}

template<class T>
void List<T>::push_back(T val)
{
    auto tmp = new Node<T>(val);
    if (size == 0)
        head = tail = tmp;
    else
    {
        tail->setNext(tmp);
        tail = tmp;
    }
    size++;
}

template<class T>
inline void List<T>::push_front(T val)
{
    auto tmp = new Node<T>(val);
    if (size == 0)
        head = tail = tmp;
    else
    {
        tmp->setNext(head);
        head = tmp;
    }
    size++;
}

template<class T>
void List<T>::clear()
{
    while (size)
        pop_front();
}

template<class T>
void List<T>::emplace(int pos, T val)
{
    if (pos < 1 || pos > size)
    {
        cout << "Incorrect pos!\n";
        return;
    }
    else if (pos == size)
    {
        push_back(val);
    }
    else
    {
        auto tmp = new Node<T>(val);
        auto cur = head;
        for (int i = 0; i < pos - 2; ++i)
        {
            cur = cur->getNext();
        }
        tmp->setNext(cur->getNext());
        cur->getNext();
        cur->setNext(tmp);
        size++;
    }
}

template<class T>
void List<T>::erase(int pos)
{
    if (pos < 1 || pos > size)
    {
        cout << "Incorrect pos!\n";
        return;
    }
    else if (pos == 1)
    {
        pop_front();
    }
    else
    {
        auto cur = head;
        for (int i = 0; i < pos - 2; ++i)
        {
            cur = cur->getNext();
        }
        auto tmp = cur->getNext();
        cur->setNext(tmp->getNext());
        delete tmp;
    }
    size--;
}

template<class T>
void List<T>::erase(int begin, int end)
{
    if (begin <= size && begin >= 0 && end <= size && end >= 0)
    {
        while (begin - 1 != end)
        {
            erase(end);
            end--;
        }
    }
    else
    {
        cout << "Incorrect pos!\n";
    }
}
