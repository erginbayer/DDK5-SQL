using northwindSQL_CSharp.Manager;
using northwindSQL_CSharp.Models;
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
        public static void productSort(List<Product> products)
        {
            foreach (var product in products)
            {
                Console.WriteLine("ID: " + product.Id + "\nProduct Name: " + product.ProductName + "\nCategory ID: " + product.CategoryId
                    + "\nUnit Price: " + product.UnitPrice + "\nUnits In Stock: " + product.UnitsInStock);
                Console.WriteLine("-----------------------------------------");
            }
        }
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
            SupplierManager supplierManager = new SupplierManager();

            //var product = productManager.GetAllSuppliers(); 
            //productSort(product);

            //var suppliers = supplierManager.GetAllProducts();

            //Console.WriteLine("-----------------------------------------");
            //foreach (var supplier in suppliers)
            //{
            //    Console.WriteLine("ID: " + supplier.Id + "\nCompany Name: " + supplier.CompanyName + "\nAddress: " 
            //        + supplier.Address + "\nCity: " + supplier.City);
            //    Console.WriteLine("-----------------------------------------");
            //}

            #region 1.Soru Test
            //var productCount = productManager.GetMinOrMaxProduct(10, 50);

            //productSort(productCount);
            #endregion

            #region 2.Soru Test

            //var product = productManager.GetFinishedStocksProduct();

            //productSort(product);
            #endregion

            #region 3.Soru Test

            //var product = productManager.GetSearchName("Ch");

            //productSort(product);

            #endregion

            #region 4.Soru Test

            //Console.WriteLine(productManager.GetAvgPriceofProducts());
            #endregion

            #region 5.Soru Test

            var product = productManager.GetAvgSearchCategoryId(1);

            Console.WriteLine(product);
            #endregion

            Console.ReadLine();

        }
    }
}
