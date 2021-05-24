//Разработать собственный тип данных для хранения
//целочисленных коэффициентов A, B и С линейного уравнения
//A*x + B*y = С.
//В классе реализовать:
//• Статический метод Parse, который принимает строку со
//значениями коэффициентов, разделенных запятой или
//пробелом. В случае передачи в метод строки недопустимого
//формата генерируется исключение FormatException. 


using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App3
{
    class Program
    {
        public struct Coefficient
        {
            public int a, b;
        }

        static void Main(string[] args)
        {
            while (true)
            {
                Console.WriteLine("Введите два коэф. через запятую");
                string line = Console.ReadLine();
                Coefficient k = new Coefficient();
                try
                {
                    Parse(line, ref k.a, ref k.b);
                    Console.WriteLine(k.a + "   " + k.b);
                    break;
                }
                catch (FormatException e)
                {
                    Console.WriteLine("\"{0}\"", e.Message);
                    continue;
                }
                finally
                {
                    Console.WriteLine("");
                }
            }
            Console.ReadKey();
        }

        static void Parse(string data, ref int a, ref int b)
        {
            if (string.IsNullOrEmpty(data))
            {
                throw new FormatException("Не строк");
            }

            data = data.Trim();
            int commaPlace = CommaCheck(data);

            string data1 = data.Substring(0, commaPlace);                                       
            string data2 = data.Substring(commaPlace + 1, data.Length - commaPlace - 1);

            a = ToNumber(data1);
            b = ToNumber(data2);
        }

        static int CommaCheck(string data)
        {
            if (data[0] == ',' || data[data.Length - 1] == ',')
                throw new FormatException("Запятая не в правильном месте");

            int i = 0;
            int commaPlace = -1;
            int commaQuantity = 0;
            foreach (char el in data)
            {
                if (el == ',')
                {
                    commaPlace = i;
                    commaQuantity++;
                }
                i++;
            }
            if (commaQuantity > 1)
                throw new FormatException("Слишком много аргументов");
            if (commaQuantity < 1)
                throw new FormatException("Слишком мало аргументов");
            return commaPlace;
        }

        static int ToNumber(string line)
        {
            int x;
            bool rez = int.TryParse(line, out x);
            if (rez)
                return x;
            else
                throw new FormatException("Невозможно приравнять  строку к числу");
        }
    }
}
