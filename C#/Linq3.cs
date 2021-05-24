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


            var selected1 = from Employee in employees
                               join Department in departments
                               on Employee.DepId equals Department.Id
                            orderby Employee.FirstName
                            where Department.Country == "Ukraine" 
                               select Employee;

            foreach(Employee employee in selected1)
                Console.WriteLine($"1){ employee.FirstName}-{ employee.LastName}");


            var selected2 = (from Employee in employees
                        orderby Employee.Age descending
                        select Employee);

            foreach (Employee employee in selected2)
                Console.WriteLine($"2){employee.Id}-{employee.FirstName}-{employee.LastName}-{employee.Age}");

           
                Console.WriteLine(string.Join(Environment.NewLine,
            employees.GroupBy  (s => s.Age, (Age, enumerable) => $"{Age} count: {enumerable.Count()}")));


        } 

    }

}
