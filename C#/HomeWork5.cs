//Написать статический класс, который предоставляет
//статические методы для:
//- расчета экспоненциальной функции;
//- нахождения арксинуса заданного аргумента;
//- нахождения расстояния между двумя точками в
//трехмерном пространстве;
//- транспонирования матрицы. 

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MathApp
{
    public class Point3D
    {
        public int X { get; }
        public int Y { get; }
        public int Z { get; }

        public Point3D(int x, int y, int z)
        {
            X = x; Y = y; Z = z;
        }
    }

    public static class TrigonometricMath
    {
        public static double CalculateExponentialFunction(int value)
        {
            return Math.Exp(value);
        }
        public static double CalculateArcSin(double value)
        {
            return Math.Asin(value);
        }

        public static double CalculateWayOf3DPoints(Point3D firstPoint, Point3D secondPoint)
        {
            double one = Math.Pow((secondPoint.X - firstPoint.X), 2);
            double two = Math.Pow((secondPoint.Y - firstPoint.Y), 2);
            double three = Math.Pow((secondPoint.Z - firstPoint.Z), 2);

            return Math.Sqrt(one + two + three);
        }
    }

    public class Program
    {
        static void Main(string[] args)
        {
            Point3D firstPoint = new Point3D(200, 200, 200);
            Point3D secondPoint = new Point3D(300, 300, 300);

            Console.WriteLine(TrigonometricMath.CalculateExponentialFunction(70));
            Console.WriteLine(TrigonometricMath.CalculateArcSin(0.2));
            Console.WriteLine(TrigonometricMath.CalculateWayOf3DPoints(firstPoint, secondPoint));

            Console.ReadKey();
        }
    }
}
