//Статический метод для решения системы 2 линейных уравнений:
 //A1*x + B1*y = C1
 //A2*x + B2*y = C2
//Метод с помощью выходных параметров должен возвращать
//найденное решение или генерирует исключение ArgumentOutOfRangeException, если решение не существует.


namespace App2
{
    class Program
    {
        static void Main(string[] args)
        {
            double x, y;
            int a1 = -1, b1 = 3, a2 = -2, b2 = 6;

            try
            {
                Solve(a1, b1, a2, b2, out x, out y);
                Console.WriteLine("x = " + x + ";\ny = " + y + ";");
            }
            catch (ArgumentOutOfRangeException e)
            {
                Console.WriteLine("Solution is not existing. " + e.Message);
            }
            
            Console.ReadKey();
        }

        
        private static void Solve(int a1, int b1, int a2, int b2, out double x, out double y)
        {
            if (a1 == 0 && b1 == 0 && (a2 != 0 || b2 != 0))
                throw new ArgumentOutOfRangeException("First line is not existing.");

            else if ((a1 != 0 || b1 != 0) && a2 == 0 && b2 == 0)
                throw new ArgumentOutOfRangeException("Second line is not existing.");

            else if (a1 == 0 && b1 == 0 && a2 == 0 && b2 == 0)
                throw new ArgumentOutOfRangeException("Both lines are not existing.");

            else if (a1 == a2 && b1 == b2)
                throw new ArgumentOutOfRangeException("The lines are coincident.");

            else if (a1 * b2 == b1 * a2)
                throw new ArgumentOutOfRangeException("The lines are coincident.");

            else
                x = y = 0;
        }
    }
}

