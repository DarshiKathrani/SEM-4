using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net.NetworkInformation;
using System.Runtime.ConstrainedExecution;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace Lab1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //1.Write a program to print your name, address, contact number & city
            //Console.WriteLine("My name is darshi");
            //Console.WriteLine("I live in Avenue Park");
            //Console.WriteLine("My contact number is 1234567891");
            //Console.WriteLine("I live in morbi");

            //2.Write a program to get two numbers from user and print those two
            //    numbers.

            // Console.WriteLine("Enter the first number:");
            // int a=Convert.ToInt32(Console.ReadLine());
            // Console.WriteLine("Enter the second number:");
            //int b = Convert.ToInt32(Console.ReadLine());
            // Console.WriteLine(a);
            // Console.WriteLine(b);

            //3.Write program to prompt a user to input his/ her name and country name
            //and then output will be shown as given: Hello<yourname> from country
            //<countryname>

            // Console.WriteLine("Enter your name:");
            //String name=Console.ReadLine();
            // Console.WriteLine("Enter your country name");
            //String country= Console.ReadLine();
            // Console.WriteLine("Hello"+" "+name+" from country"+" "+country);

            //4.Write a program to calculate the size of the area in square - feet based on
            //Specified length and width.

            //Console.WriteLine("Enter the length:");
            // int l=Convert.ToInt32(Console.ReadLine());
            // Console.WriteLine("Enter the width:");
            //int w = Convert.ToInt32(Console.ReadLine());
            //int ans = l * w;
            //Console.WriteLine("Area is:" + ans + "sq.ft");

            //5.Write a program to calculate area of Square, Rectangle and Circle.
            //Console.WriteLine("Enter the length:");
            //int l = Convert.ToInt32(Console.ReadLine());
            //Console.WriteLine("Enter the width:");
            //int w = Convert.ToInt32(Console.ReadLine());
            //Console.WriteLine("Enter the radius:");
            //int r = Convert.ToInt32(Console.ReadLine());
            //int sq_ar = l * l;
            //int rec_ar=l* w;
            //double cir_ar= Math.PI * r * r;
            //Console.WriteLine("Area of square:" + sq_ar);
            //Console.WriteLine("Area of rectangle:" + rec_ar);
            //Console.WriteLine("Area of circle:" + cir_ar);

            //6.Write a program to calculate Celsius to Fahrenheit and vice - versa using
            //function.
            //Console.WriteLine("Enter the Celsius:");
            //double a = Convert.ToDouble(Console.ReadLine());
            //Console.WriteLine("Temp. in fahrenheit is:" + fahrenheit(a));

            //Console.WriteLine("Enter the Fahrenheit:");
            //double b = Convert.ToDouble(Console.ReadLine());
            //Console.WriteLine("Temp. in fahrenheit is:" + celsius(b));

            //7.Write a program to find out Simple Interest using function. (I = PRN / 100)
            //Console.WriteLine("Enter the first number:");
            //int p = Convert.ToInt32(Console.ReadLine());
            //Console.WriteLine("Enter the second number:");
            //int r = Convert.ToInt32(Console.ReadLine());
            //Console.WriteLine("Enter the third number:");
            //int n = Convert.ToInt32(Console.ReadLine());

            //Console.WriteLine("Simple Interest:" + simpleInterest(p, r, n));

            //8. Write a program to create a Simple Calculator for two numbers (Addition,
            //    Multiplication, Subtraction, Division) [Also using if…else & Switch Case]8. Write a program to create a Simple Calculator for two numbers (Addition,
            //    Multiplication, Subtraction, Division) [Also using if…else & Switch Case]

            //Console.WriteLine("Enter the first number:");
            // int a=Convert.ToInt32(Console.ReadLine());
            // Console.WriteLine("Enter the second number:");
            //int b = Convert.ToInt32(Console.ReadLine());
            //Console.WriteLine("Enter the operator:");
            //char c = Convert.ToChar(Console.ReadLine());

            //if (c == '+')
            //{
            //    int ans = a + b;
            //    Console.WriteLine("a+b:"+ans);
            //}
            //else if (c == '-')
            //{
            //    int ans = a - b;
            //    Console.WriteLine("a-b:" + ans);
            //}
            //else if (c == '*')
            //{
            //    int ans = a*b;
            //    Console.WriteLine("a*b:" + ans);
            //}
            //else if (c == '/')
            //{
            //    double ans =(Convert.ToDouble( (a))/(Convert.ToDouble( b)));
            //    Console.WriteLine("a/b:" + ans);
            //}
            //else
            //{
            //    Console.WriteLine("Invalid operator");
            //}

            //9.Write a program to Swapping without using third variable.
            //Console.WriteLine("Enter the first number:");
            //int a = Convert.ToInt32(Console.ReadLine());
            //Console.WriteLine("Enter the second number:");
            //int b = Convert.ToInt32(Console.ReadLine());
            //a = a - b;
            //b = a + b;
            //a = b-a;
            //Console.WriteLine("First number is:"+a);
            //Console.WriteLine("Second number is:"+b);


            //10.Write a program to find maximum numbers from given 3 numbers using
            //ternary operator.
            //Console.WriteLine("Enter the first number:");
            //int a = Convert.ToInt32(Console.ReadLine());
            //Console.WriteLine("Enter the second number:");
            //int b = Convert.ToInt32(Console.ReadLine());
            //Console.WriteLine("Enter the third number:");
            //int c = Convert.ToInt32(Console.ReadLine());
            //Console.WriteLine("Max:" + ((a > b) ? ((a > c) ? a : c):(b > c) ? b : c));
        }
        //static double fahrenheit(double x)
        //{
        //    return (x * 9 / 5) + 32;
        //}
        //static double celsius(double x)
        //{
        //    return (x-32)*5/9;
        //}
        //static double simpleInterest(int x, int y, int z)
        //{
        //    return (x*y*z)/100.0;
        //}
    }
}
