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

        public static void orderSort(List<Order> orders)
        {
            foreach (var order in orders)
            {
                Console.WriteLine("Order ID: " + order.OrderId + "\nEmloyee ID: " + order.EmployeeId + "\nOrder Date: " + order.OrderDate
                    + "\nRequired Date: " + order.RequiredDate + "\nFreight: " + order.Freight + "\nShip City: " + order.ShipCity + "\nShipCountry: " + order.ShipCountry);
                Console.WriteLine("-----------------------------------------");
            }
        }

        public static void supplierSort(List<Supplier> suppliers)
        {
            foreach (var supplier in suppliers)
            {
                Console.WriteLine("ID: " + supplier.Id + "\nCompany Name: " + supplier.CompanyName + "\nAddress: "
                    + supplier.Address + "\nCity: " + supplier.City);
                Console.WriteLine("-----------------------------------------");
            }
        }

        static void Main(string[] args)
        {
            #region SQL Sample
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
            #endregion

            ProductManager productManager = new ProductManager();
            SupplierManager supplierManager = new SupplierManager();
            OrderManager orderManager = new OrderManager();



            //var allProducts = productManager.GetAllProducts();
            //var getGermanyOrders = orderManager.GetCountryGermanyOrders();
            //var allOrders = orderManager.GetAllOrders();
            var allSuppliers = supplierManager.GetAllSuppliers();
            supplierSort(allSuppliers);
            


            #region 27 April Questions Test
            #region 1.Question Test
            //var productCount = productManager.GetMinOrMaxProduct(10, 50);

            //productSort(productCount);
            #endregion

            #region 2.Question Test

            //var product = productManager.GetFinishedStocksProduct();

            //productSort(product);
            #endregion

            #region 3.Question Test

            //var product = productManager.GetSearchName("Ch");

            //productSort(product);

            #endregion

            #region 4.Question Test

            //Console.WriteLine(productManager.GetAvgPriceofProducts());
            #endregion

            #region 5.Question Test

            //var product = productManager.GetAvgSearchCategoryId(1);

            //Console.WriteLine(product);
            #endregion
            #endregion

            Console.ReadLine();

        }
    }
}
