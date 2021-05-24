//Создать базовый класс “Транспорт”. От него наследовать “Авто”,
//“Самолет”, “Поезд”. От класса “Авто” наследовать классы “Легковое
//авто”, “Грузовое авто”. От класса “Самолет” наследовать классы
//“Грузовой самолет” и “Пассажирский самолет”. Придумать поля для
//базового класса, а также добавить поля в дочерние классы, которые
//будут конкретно характеризовать объекты дочерних классов.
//Определить конструкторы, методы для заполнения полей классов
//(или использовать свойства). Написать метод, который выводит
//информацию о данном виде транспорта и его характеристиках.
//Использовать виртуальные методы.

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp32
{

    class Transport
    {
        public string Type;
        public string Name;
        

        public virtual void Show()
        {

        }

        public virtual void Vvod()
        {

        }
  
    }

    class Avto : Transport
    {
        public string Number;
        public string Color;
        public string Speed;

    }

    class Samolet : Transport
    {
        public string NomerReyca;
        
        public virtual void Show()
        {

        }

        public virtual void Vvod()
        {

        }

    }

    class Poezd : Transport
    {
        public virtual void Show()
        {

        }

        public virtual void Vvod()
        {

        }

    }


    class Legkovoe_Avto : Avto
    {
        public string Type1 = "Легковое авто";
        public virtual void Vvod()
        {
            Console.WriteLine("------------------------------------");
            Console.WriteLine("Введите информацию об Легковом Авто");
            Console.WriteLine("------------------------------------");
            Console.WriteLine("Введите марку авто: ");
            Name = Console.ReadLine();
            Console.WriteLine("Введите гос. номер: ");
            Number = Console.ReadLine();
            Console.WriteLine("Введите цвет: ");
            Color = Console.ReadLine();
            Console.WriteLine("Введите макс. скорость: ");
            Speed = Console.ReadLine();


        }

        public virtual void Show()
        {
            Console.WriteLine("Информация о легковом авто: ");
            Console.WriteLine("Тип авто : {0}\nМарка авто : {1}\nГос номер : {2}\nЦвет : {3}\nМакс.скорость : {4}",Type1,Name, Number, Color, Speed + " км/ч");

        }

    }

    class Gryzovoe_Avto : Avto
    {
        public string Type1 = "Грузовое Авто";
        public bool Pricep = true;
        public virtual void Vvod()
        {
            Console.WriteLine("------------------------------------");
            Console.WriteLine("Введите информацию об Грузовом Авто");
            Console.WriteLine("------------------------------------"); ;
            Console.WriteLine("Введите марку авто: ");
            Name = Console.ReadLine();
            Console.WriteLine("Введите гос. номер: ");
            Number = Console.ReadLine();
            Console.WriteLine("Введите цвет: ");
            Color = Console.ReadLine();
            Console.WriteLine("Введите макс. скорость: ");
            Speed = Console.ReadLine();
           


        }

        public virtual void Show()
        {
            Console.WriteLine("Информация о грузовом авто: ");
            Console.WriteLine("Тип авто : {0}\nМарка авто : {1}\nГос номер : {2}\nЦвет : {3}\nМакс.скорость : {4}\nПрицеп : {5}", Type1, Name, Number, Color, Speed + " км/ч",Pricep);

        }

    }

    class Pasagirskiy_Samolet : Samolet
    {
        public string Type1 = "Пассажирский Самолет";
        public string KolvoPasagirov;
        public virtual void Vvod()
        {
            Console.WriteLine("------------------------------------");
            Console.WriteLine("Введите информацию об Пассажирском Самолете");
            Console.WriteLine("------------------------------------"); ;
            Console.WriteLine("Введите марку самолета: ");
            Name = Console.ReadLine();
            Console.WriteLine("Введите номер рейса: ");
            NomerReyca = Console.ReadLine();
            Console.WriteLine("Введите кол-во пассажиров: ");
            KolvoPasagirov = Console.ReadLine();



        }

        public virtual void Show()
        {
            Console.WriteLine("Информация о Пассажирском Самолете: ");
            Console.WriteLine("Тип Самолета : {0}\nМарка : {1}\nНомер рейса : {2}\nКол-во пассажиров : {3}", Type1, Name, NomerReyca, KolvoPasagirov);

        }

    }

    class Gryzovoi_Samolet : Samolet
    {
        public string Type1 = "Грузовой Самолет";
        public string Gryzopodiemnost;
        public virtual void Vvod()
        {
            Console.WriteLine("------------------------------------");
            Console.WriteLine("Введите информацию об Грузовом Самолете");
            Console.WriteLine("------------------------------------"); ;
            Console.WriteLine("Введите марку самолета: ");
            Name = Console.ReadLine();
            Console.WriteLine("Введите номер рейса: ");
            NomerReyca = Console.ReadLine();
            Console.WriteLine("Грузоподъемность: ");
            Gryzopodiemnost = Console.ReadLine();



        }

        public virtual void Show()
        {
            Console.WriteLine("Информация о грузовом самолете: ");
            Console.WriteLine("Тип Самолета : {0}\nМарка : {1}\nНомер рейса : {2}\nГрузоподъемность : {3}", Type1, Name, NomerReyca, Gryzopodiemnost + " кг");

        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            Legkovoe_Avto legkovoe_Avto1 = new Legkovoe_Avto();
            legkovoe_Avto1.Vvod();
            legkovoe_Avto1.Show();

            Gryzovoe_Avto gryzovoe_Avto1 = new Gryzovoe_Avto();
            gryzovoe_Avto1.Vvod();
            gryzovoe_Avto1.Show();

            Gryzovoi_Samolet gryzovoi_Samolet = new Gryzovoi_Samolet();
            gryzovoi_Samolet.Vvod();
            gryzovoi_Samolet.Show();

            Console.ReadKey();

        }
    }
}
