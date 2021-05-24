//1. Придумать класс, описывающий студента и предусмотреть в
//нем следующие поля: имя, фамилия, отчество, группа,
//возраст, массив (рваный) оценок по программированию,
//администрированию и дизайну. Также добавить методы по
//работе с перечисленными данными: возможность установки/
//получения оценки, получение среднего балла по данному
//предмету, распечатка данных о студенте.

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StudentApp
{
    class Student
    {
        private string _Name;
        public string Name
        {
            get { return _Name; }
            set { _Name = value; }
        }
        private string _SecondName;
        public string SecondName
        {
            get { return _SecondName; }
            set { _SecondName = value; }
        }
        private string _MidleName;
        public string MidleName
        {
            get { return _MidleName; }
            set { _MidleName = value; }
        }
        private int _Group;
        public int Group
        {
            get { return _Group; }
            set { _Group = value; }
        }
        private int _Age;
        public int Age
        {
            get { return _Age; }
            set { _Age = value; }
        }
        public int[][] Grades = new int[3][] { new int[0], new int[0], new int[0] };
        public void GradeProg(int n)
        {
            int[] buf = new int[Grades[0].Length + 1];
            for (int i = 0; i < buf.Length - 1; i++)
            {
                buf[i] = Grades[0][i];
            }
            buf[buf.Length - 1] = n;
            Grades[0] = new int[buf.Length];
            for (int i = 0; i < buf.Length; i++)
            {
                Grades[0][i] = buf[i];
            }
        }
        public void GradeAdmin(int n)
        {
            int[] buf = new int[Grades[1].Length + 1];
            for (int i = 0; i < buf.Length - 1; i++)
            {
                buf[i] = Grades[1][i];
            }
            buf[buf.Length - 1] = n;
            Grades[1] = new int[buf.Length];
            for (int i = 0; i < buf.Length; i++)
            {
                Grades[1][i] = buf[i];
            }
        }
        public void GradeDesign(int n)
        {
            int[] buf = new int[Grades[2].Length + 1];
            for (int i = 0; i < buf.Length - 1; i++)
            {
                buf[i] = Grades[2][i];
            }
            buf[buf.Length - 1] = n;
            Grades[2] = new int[buf.Length];
            for (int i = 0; i < buf.Length; i++)
            {
                Grades[2][i] = buf[i];
            }
        }
        public void PrintInfo()
        {
            Console.WriteLine("Фамилия - " + SecondName);
            Console.WriteLine("Имя - " + Name);
            Console.WriteLine("Отчество -  " + MidleName);
            
            Console.WriteLine("Группа - " + Group);
            Console.WriteLine("Возраст -  " + Age);


            Console.Write("----------------------\n");
            Console.Write("Программирование - ");
            double sp = 0, sa = 0, sd = 0;
            for (int i = 0; i < Grades[0].Length; i++)
            {
                sp += Grades[0][i];
                Console.Write(Grades[0][i] + " ");
            }
            Console.WriteLine("\nСредняя оценка = " + sp / Grades[0].Length);
            Console.Write("----------------------");


            Console.Write("----------------------\n");
            Console.Write("Администрирование - ");
            for (int i = 0; i < Grades[1].Length; i++)
            {
                sa += Grades[1][i];
                Console.Write(Grades[1][i] + " ");
            }
            Console.WriteLine("\nСредняя оценка = " + sa / Grades[1].Length);
            Console.Write("----------------------");


            Console.Write("----------------------\n");
            Console.Write("Дизайн -  ");
            for (int i = 0; i < Grades[2].Length; i++)
            {
                sd += Grades[2][i];
                Console.Write(Grades[2][i] + " ");
            }
            Console.WriteLine("\nСредняя оценка = " + sd / Grades[2].Length);
            Console.Write("----------------------");
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            Student a = new Student();
            a.SecondName = "Фещенко";
            a.Name = "Иван";
            a.MidleName = "Иванович";
            a.Group = 7;
            a.Age = 18;

            a.GradeProg(9);
            a.GradeProg(8);
            a.GradeProg(12);
            a.GradeProg(10);

            a.GradeAdmin(8);
            a.GradeAdmin(10);
            a.GradeAdmin(12);

            a.GradeDesign(10);
            a.GradeDesign(11);
            a.GradeDesign(6);
            
            a.PrintInfo();

            Console.ReadKey();
        }
    }
}
