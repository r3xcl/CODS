using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp17
{

    public class Person
    {
        public string Name { get; set; }
        public int Age { get; set; }
        public string City { get; set; }
    }
    class Program
    {
        static void Main(string[] args)
        {
            List<Person> Persons = new List<Person>()
            {
             new Person(){ Name = "Andrey", Age = 24, City = "Kyiv" },
             new Person(){ Name = "Liza", Age = 18, City = "Moscow" },
             new Person(){ Name = "Oleg", Age = 15, City = "London" },
             new Person(){ Name = "Sergey", Age = 55, City = "Kyiv" },
             new Person(){ Name = "Sergey", Age = 32, City = "Kyiv" }

            
            };
            var selectedAge = from Person in Persons
                                  where Person.Age > 25
                                  select Person;

            var selectedCity = from Person in Persons
                               where Person.City != "Kyiv"
                               select Person;

            var selectedName = from Person in Persons
                               where Person.City == "Kyiv"
                               select Person;

            var selected35Serg = from Person in Persons
                                 where Person.Name == "Sergey" && Person.Age>35
                                 select Person;

            var selectedMoscow = from Person in Persons
                                 where Person.City == "Moscow" 
                               select Person;

            foreach (Person person in selectedAge)
            Console.WriteLine($"1){person.Name}-{person.Age}");


            foreach (Person person in selectedCity)
                Console.WriteLine($"2){person.Name}-{person.Age}-{person.City}");

            foreach (Person person in selectedName)
                Console.WriteLine($"3){person.Name}");

            foreach (Person person in selected35Serg)
                Console.WriteLine($"4){person.Name}-{person.Age}-{person.City}");

            foreach (Person person in selectedMoscow)
                Console.WriteLine($"5){person.Name}-{person.Age}-{person.City}");
            Console.ReadKey();

        }
        
    }
    
}
