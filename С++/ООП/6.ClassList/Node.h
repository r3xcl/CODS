#pragma once

#include <iostream>

using namespace std;

template<class T>
class Node
{
    T data;
    Node<T>* next = nullptr;
public:
    Node(T val);
    T getData()const;
    Node<T>* getNext()const;
    void setData(T val);
    void setNext(Node<T>* val);
};

template<class T>
Node<T>::Node(T val)
{
    data = val;
}

template<class T>
T Node<T>::getData() const
{
    return data;
}

template<class T>
Node<T>* Node<T>::getNext() const
{
    return next;
}

template<class T>
void Node<T>::setData(T val)
{
    data = val;
}

template<class T>
void Node<T>::setNext(Node<T>* val)
{
    next = val;
}


