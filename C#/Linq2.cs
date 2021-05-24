using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp18
{

    class Employee
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int Age { get; set; }
        public int DepId { get; set; }
    }
    class Department
    {
        public int Id { get; set; }
        public string Country { get; set; }
        public string City { get; set; }
    }

    class Program
    {
        static void Main()
        {
            List<Department> departments = new List<Department>()
            { new Department(){ Id = 1, Country = "Ukraine", City = "Donetsk" },
              new Department(){ Id = 2, Country = "Ukraine", City = "Kyiv" },
              new Department(){ Id = 3, Country = "France", City = "Paris" },
              new Department(){ Id = 4, Country = "Russia", City = "Moscow" }
            };

            List<Employee> employees = new List<Employee>()
{
             new Employee(){ Id = 1, FirstName = "Tamara", LastName = "Ivanova", Age = 22, DepId = 2 },
             new Employee(){ Id = 2, FirstName = "Nikita", LastName = "Larin", Age = 33, DepId = 1 },
             new Employee() { Id = 3, FirstName = "Alica", LastName = "Ivanova", Age = 43, DepId = 3 },
             new Employee(){ Id = 4, FirstName = "Lida", LastName = "Marusyk", Age = 22, DepId = 2 },
             new Employee(){ Id = 5, FirstName = "Lida", LastName = "Voron", Age = 36, DepId = 4 },
             new Employee(){ Id = 6, FirstName = "Ivan", LastName = "Kalyta", Age = 22, DepId = 2 },
             new Employee(){ Id = 7, FirstName = "Nikita", LastName = " Krotov ", Age = 27,DepId = 4 }
            };

            var selectedCity = from Employee in employees
                               join Department in departments
                               on Employee.DepId equals Department.Id
                               where Department.Country == "Ukraine" && Department.City != "Donetsk"
                               select Employee.FirstName;

           foreach(var item in selectedCity)
            {
                Console.WriteLine($"1){item}");
            }


            Console.WriteLine(string.Join(Environment.NewLine,
            departments.GroupBy(s => s.Country, (name,numerable) => $"{name}")));


            var top3 = (from Employee in employees
                        where Employee.Age > 25
                        select Employee).Take(3);


            foreach (Employee employee in top3)
                Console.WriteLine($"3){employee.FirstName}-{employee.LastName}-{employee.Age}");

            var kyiv23=(from Employee in employees
                        join Department in departments
                        on Employee.DepId equals Department.Id
                        where Department.City=="Kyiv" && Employee.Age > 23
                        select Employee);

            foreach (Employee employee in kyiv23)
                Console.WriteLine($"4){employee.FirstName}-{employee.LastName}-{employee.Age}");
        }
        
    }
     
}
