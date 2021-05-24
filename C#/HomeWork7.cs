//Реализовать класс для хранения комплексного числа. Выполнить в
//нем перегрузку всех необходимых операторов для успешной
//компиляции следующего фрагмента кода:
//Complex z = new Complex(1,1);
//Complex z1;
//z1 = z - (z * z * z - 1) / (3 * z * z);
//Console.WriteLine($“z1 = {z1}”); 

using System;


namespace Complex1
{
    class Complex
    {
        private decimal x;
        private decimal y;

        public Complex(decimal x, decimal y)
        {
            this.x = x;
            this.y = y;
        }



        public static Complex operator *(Complex a, Complex b)
        {
            return new Complex(a.x * b.x - a.y * b.y, a.y * b.x + a.x * b.y);
        }

        public static Complex operator *(decimal a, Complex b)
        {
            return new Complex(a * b.x, a * b.y);
        }

        public static Complex operator *(Complex b, decimal a)
        {
            return a * b;
        }

        public static Complex operator /(Complex a, Complex b)
        {
            return new Complex((a.x * b.x + a.y * b.y) / (b.x * b.x + b.y * b.y), (a.y * b.x - a.x * b.y) / (b.x * b.x + b.y * b.y));
        }

        public static Complex operator -(Complex a, decimal b)
        {
            return new Complex(a.x - b, a.y - b);
        }

        public static Complex operator -(Complex a, Complex b)
        {
            return new Complex(a.x - b.x, a.y - b.y);
        }

        public override string ToString()
        {
            return string.Format("{0:0.000} + i{1};", x, y);
        }
    }


    class Program
    {
        static void Main(string[] args)
        {
            Complex z = new Complex(1, 1);
            Complex z1;
            z1 = z - (z * z * z - 1) / (3 * z * z);
            Console.WriteLine("z1 = {0}", z1);

            Console.ReadKey();
        }
    }
}
