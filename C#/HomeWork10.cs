//Реализовать метод, который осуществляет поиск элемента в
//массиве. Метод должен принимать массив Object [] array, в котором
//должен осуществляться поиск, и делегат, определяющий, является
//ли элемент искомым.

using System;

namespace App4
{
    class Program
    {
        public struct Food
        {
            public string Code;
            public string Name;
            public ArticleType Type;

            public enum ArticleType
            {
                Sport, Foods, Clothes, Furniture
            }

            public Food(string Code, string Name,  Food.ArticleType Type)
            {
                this.Code = Code;
                this.Name = Name;
                this.Type = Type;
            }

            public override string ToString()
            {
                return string.Format("\t (#{0}) \t {1} \t ${2}", Code, Name, Type);
            }
        }

        static public void Find(Object[] array, Comparer comparer)
        {
            for (int i = 0; i < array.Length; ++i)
            {
                if (comparer(array[i]))
                {
                    Console.WriteLine("\n Результат : Индекс = {0}\n{1}", i, array[i]);
                }
            }
        }

        public delegate Boolean Comparer(Object elem1);

        static public Boolean CodeComparer(Object goods)
        {
            return ((Food)goods).Code == "1";
        }

        static public Boolean TypeComparer(Object goods)
        {
            return ((Food)goods).Type == Food.ArticleType.Foods;
        }

        static public Boolean NameComparer(Object goods)
        {
            return ((Food)goods).Name == "Яблоко";
        }

        static void Main(string[] args)
        {
            Food goods1 = new Food("2", "Яблоко", Food.ArticleType.Foods);
            Food goods2 = new Food("1", "Клубника", Food.ArticleType.Foods);
          

            Object[] GoodsArray = { goods1, goods2 };
            uint i = 0;
            foreach (Object goods in GoodsArray)
            {
                Console.WriteLine("{0}.{1}", i, goods);
                i++;
            }

            Console.WriteLine("\nПоиск по номеру \"1\" -");
            Find(GoodsArray, new Comparer(CodeComparer));

            Console.WriteLine("\nПоиск по Артикулу \"Foods\" -");
            Find(GoodsArray, new Comparer(TypeComparer));

           

            Console.ReadKey();
        }
    }
}
