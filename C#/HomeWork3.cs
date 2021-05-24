//Строки.
//1. Создать метод, принимающий введенную пользователем
//строку, и выводящий на экран статистику по этой строке.
//Статистика должна включать общее кол-во символов, кол-во
//пробелом, кол-во цифр, кол-во символов пунктуации, кол-во
//букв и кол-во пробелов.
//2. Пользователь вводит строку и символ. В строке найти все
//вхождения этого символа и перевести его в верхний регистр, а
//также удалить часть строки, начиная с последнего вхождения
//этого символа и до конца.
//3. Удалить из строки повторяющиеся слова.
//4. Преобразовать все слова по правилу: удалить из слова все
//последующие вхождения первого символа.
//5. Преобразовать все слова по правилу: удалить в слове только
//последние вхождения каждого символа.

/////////////////////////////////////////////////////////////
//1
/////////////////////////////////////////////////////////////
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

/*  Статистика должна включать общее кол-во символов +
 кол-во пробелов + 
 кол-во цифр +
 кол-во символов пунктуации +
 кол-во букв +  .*/

namespace ArraysStrings
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Введите строку: ");
            StringBuilder sb = new StringBuilder(Console.ReadLine());

            string s = sb.ToString();
            Console.WriteLine($"Кол-во символов в строке: {sb.Length}");

            int countSpaces = s.Count(Char.IsWhiteSpace);
            Console.WriteLine($"Кол-во пробелов в строке: {countSpaces}");

            var count = s.Count(Char.IsDigit);
            Console.WriteLine("Кол-во цифр в строке: " + count);

            count = s.Count(Char.IsPunctuation);
            Console.WriteLine("Кол-во знаков пунктуации в строке: " + count);

            count = s.Count(Char.IsLetter);
            Console.WriteLine("Кол-во букв в строке: " + count);

            Console.ReadKey();
        }

    }
}
/////////////////////////////////////////////////////////////
//2
/////////////////////////////////////////////////////////////
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp8
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Введите строку:");
            string s1 = Console.ReadLine();
            Console.WriteLine("Введите символ:");
            string s2 = Console.ReadLine();
            
            //индексы всех вхождений символа
            int ind = s1.IndexOf(s2);
            while (ind != -1)
            {
                Console.WriteLine(ind);
                ind = s1.IndexOf(s2, ind + s2.Length);
            }

            //удаление всего , что находится после последнего вхождения символа
            Console.WriteLine(s1.Remove(s1.LastIndexOf(s2))); 


            Console.ReadKey();

        }
    }
}
/////////////////////////////////////////////////////////////
//3
/////////////////////////////////////////////////////////////
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

            Console.WriteLine("Введите строку: ");
            string[] text = Console.ReadLine().Split(' ');
            var a = text.GroupBy(x => x.ToLower()).ToList();

            string result = string.Empty;
            a.ForEach(x => result += (x.Key + " "));

            Console.WriteLine(result);

            Console.ReadKey();
        }
        
    }
}
/////////////////////////////////////////////////////////////
//4
/////////////////////////////////////////////////////////////
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp7
{
    class Program
    {
        static void Main(string[] args)
        {
           Console.WriteLine("Введите строку: ");
            string s = Console.ReadLine();
            string[] mas = s.Split(' ', '.', ',');
            string[] newmas = new string[mas.Length];
            char ch;
            for (int i = 0; i < mas.Length; i++)
            {
                ch = mas[0][0];
                newmas[i] = mas[i].Replace(ch.ToString(), "");
                Console.WriteLine(newmas[i]);
            }
            Console.ReadLine();
        }
    }
}
/////////////////////////////////////////////////////////////
//5
/////////////////////////////////////////////////////////////
