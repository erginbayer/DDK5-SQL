using northwindSQL_CSharp.Manager;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace northwindSQL_CSharp
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //string connectionString = "Server=94.73.145.4;Database=u9751868_db9EC;User Id=u9751868_user9EC;Password=PWtw68S5BRcg01S;";

            //SqlConnection connection = new SqlConnection(connectionString);

            //SqlCommand cmd = new SqlCommand("Select * From Products", connection);

            //connection.Open();

            //var result = cmd.ExecuteReader();

            //while (result.Read())
            //{
            //    Console.WriteLine(result["ProductName"]);
            //}
            //Console.Read();
            //connection.Close();

            ProductManager productManager = new ProductManager();

            var products = productManager.GetAllProducts();

            foreach (var product in products)
            {
                Console.WriteLine("ID: " + product.Id + "\nProduct Name: " + product.ProductName + "\nUnit Price: " 
                    + product.UnitPrice + "\nUnits In Stock: " + product.UnitsInStock);
                Console.WriteLine("-----------------------------------------");
            }
                
            SupplierManager supplierManager = new SupplierManager();

            var suppliers = supplierManager.GetAllProducts();

            Console.WriteLine("-----------------------------------------");
            foreach (var supplier in suppliers)
            {
                Console.WriteLine("ID: " + supplier.Id + "\nCompany Name: " + supplier.CompanyName + "\nAddress: " 
                    + supplier.Address + "\nCity: " + supplier.City);
                Console.WriteLine("-----------------------------------------");
            }
                

            Console.ReadLine();

        }
    }
}
