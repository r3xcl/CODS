//Первые 5 задачи Эйлера

////////////////////////////////////
//1
////////////////////////////////////
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {
            int sum = 0;
            for (int i = 1; i < 1000; i++)
            {
                if (i % 3 == 0 || i % 5 == 0)
                {
                    sum += i;
                }
              
            }
            Console.WriteLine(sum);
            Console.ReadLine();
        }
    
    }

}
////////////////////////////////////////
//2
////////////////////////////////////////
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp2
{
    class Program
    {
        static void Main(string[] args)
        {
            int sum = 0;
            int num1 = 1, num2 = 2;
            int a;

            while (num2 < 4000000)
            {
                if (num2 % 2 == 0)
                {
                    sum += num2;
                }
                a = num2;
                num2 = num2 + num1;
                num1 = a;
            }
            Console.WriteLine("Sum="+sum);
            Console.ReadLine();
        }
    
    }

}
///////////////////////////////////////////////
//3
///////////////////////////////////////////////
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp3
{
    class Program
    {
        static void Main()
        {
            long a1 = 1;
            for (long x = 3; x < 10000; x += 2)
            {
                if (isa1(x) && 600851475143 % x == 0)
                    a1 = x;
            }
            Console.WriteLine(a1);
            Console.ReadLine();
        }

         static bool isa1(long x)
        {
            for (int y = 2; y < x; y++)
            {
                if (x % y == 0)
                    return false;
            }
            return true;
        }


    }
}

////////////////////////////////////////////////////////
//4
////////////////////////////////////////////////////////
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp4
{
    class Program
    {
        static void Main(string[] args)
        {
            int reverse(int num)
            {
                int rev_num = 0;
                while (num > 0)
                {
                    rev_num = rev_num * 10 + num % 10;
                    num = num / 10;
                }
                return rev_num;
            }


            int result = 0;
            int palindrome = 0;
            for (int i = 999; i > 0; i--)
            {
                for (int y = 999; y > 0; y--)
                {
                    result = i * y;
                    if (result == reverse(result))
                    {
                        if (result > palindrome)
                        {
                            palindrome = result;
                        }
                    }
                }
            }
            Console.Write(palindrome);
            Console.Read();
        }
    }
}
////////////////////////////////////////////////////////
//5
////////////////////////////////////////////////////////
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp5
{
    class Program
    {
        static void Main(string[] args)

        {
            int x = 1;
            int y = 1;
            while (y <= 20)
            {
                if (x % y == 0) y++;
                else { x++; y = 1; }

           
            }
            Console.WriteLine(x);
            Console.ReadKey();

        }


    }
}
