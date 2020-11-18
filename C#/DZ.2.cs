//Массивы
//1. Заполнить одномерный массив случайными числами. Сжать
//массив, удалив из него все 0 и заполнить освободившиеся
//справа элементы значениями -1.
//2. Заполнить одномерные массив случайными числами.
//Преобразовать массив так, чтобы сначала шли отрицательные
//элементы, а потом положительные.
//3. В двумерном массиве, размеры которого вводятся с
//клавиатуры, поменять местами заданные столбцы.


////////////////////////////////////////////////////////
//1
////////////////////////////////////////////////////////
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArraysStrings
{
    class Program
    {
        static void Main(string[] args)
        {
            var rand = new Random();
            int[] arr = new int[10];

            for (int i = 0; i < arr.Length; i++)
            {
                
                arr[i] = rand.Next(-20, 20);
                
            }

            for(int i=0;i<arr.Length;i++)
            {
                if (arr[i] == 0)
                    arr[i] = -1;
            }

            foreach (var item in arr)
            {

                Console.Write(item + " ");
            }
        
        }
     
    }
    
}
////////////////////////////////////////////////////////
//2
////////////////////////////////////////////////////////
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArraysStrings
{
    class Program
    {
        static void Main(string[] args)
        { 
            var rand = new Random();
            int[] arr=new int[10];
           
            for(int i = 0; i < arr.Length; i++)
            {               
                arr[i] = rand.Next(-20,20);
                                
            }
            Array.Sort(arr, (a, b) => Math.Sign(a) - Math.Sign(b));
            foreach(var item in arr)
            {
                Console.Write(item + " ");
            }
            
            
        }
    }
}
////////////////////////////////////////////////////////
//3
////////////////////////////////////////////////////////
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArraysStrings
{
    class Program
    {
        static void Main(string[] args)
        {




            Console.Write("Введите кол-во столбцов: ");
            int x = int.Parse(Console.ReadLine());
            Console.Write("Введите кол-во строчек: ");
            int y = int.Parse(Console.ReadLine());

            var rand = new Random();
            int[,] MyArray = new int[x, y];


            for (int i = 0; i < x; i++)
            {

                for (int j = 0; j < y; j++)
                {
                    MyArray[i,j] = rand.Next(10, 20);
                }
            }
            for (int i = 0; i < x; i++)
            {
                for (int j = 0; j < y; j++)
                {
                    Console.Write(MyArray[i, j] + " ");
                }
                Console.WriteLine();
            }

            Console.Write("Введите номер первого столбца: ");
            int column1 = int.Parse(Console.ReadLine());
            Console.Write("Введите номер второго столбца который хотите поменять местами: ");
            int column2 = int.Parse(Console.ReadLine());

            for (int i = 0; i < MyArray.GetLength(0); i++)
            {
                int temp = MyArray[i, column1];
                MyArray[i, column1] = MyArray[i, column2];
                MyArray[i, column2] = temp;
            }

            for (int i = 0; i < x; i++)
            {
                for (int j = 0; j < y; j++)
                {
                    Console.Write(MyArray[i, j] + " ");
                }
                Console.WriteLine();
            }

            Console.ReadKey();
        }
        
    }
}
