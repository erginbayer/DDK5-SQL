using northwindSQL_CSharp.Env;
using northwindSQL_CSharp.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace northwindSQL_CSharp.Manager
{
    internal class ProductManager
    {
        public SingletonDBConnection singletonDBConnection;

        public ProductManager()
        {
            singletonDBConnection = SingletonDBConnection.getDbConnection();
        }

        //public List<Product> GetAllProducts()
        //{
        //    List<Product> products = new List<Product>();

        //    using (SqlConnection sqlConnection = new SqlConnection(Connection.connectionString))
        //    {
        //        try
        //        {
        //            sqlConnection.Open();

        //            SqlCommand cmd = new SqlCommand("select * from Products", sqlConnection);

        //            var reader = cmd.ExecuteReader();

        //            while (reader.Read())
        //            {
        //                Product product = new Product();

        //                product.Id = Convert.ToInt32(reader["ProductID"]);
        //                product.ProductName = reader["ProductName"].ToString();
        //                product.UnitPrice = Convert.ToDecimal(reader["UnitPrice"]);
        //                product.UnitsInStock = Convert.ToInt32(reader["UnitsInStock"]);
        //                product.CategoryId = Convert.ToInt32(reader["CategoryID"]);

        //                products.Add(product);

        //            }

        //            sqlConnection.Close();

        //            return products;
        //        }
        //        catch (Exception ex)
        //        {
        //            throw;
        //        }

        //    }
        //}
        public List<Product> GetAllProducts()
        {
            List<Product> products = new List<Product>();
            SqlConnection connection = singletonDBConnection.GetOpenDbConnection();

            SqlCommand command = new SqlCommand("Select * From Products", connection);
            var reader = command.ExecuteReader();

            while (reader.Read())
            {
                Product product = new Product();

                product.Id = Convert.ToInt32(reader["ProductID"]);
                product.ProductName = reader["ProductName"].ToString();
                product.UnitPrice = Convert.ToDecimal(reader["UnitPrice"]);
                product.UnitsInStock = Convert.ToInt32(reader["UnitsInStock"]);
                product.CategoryId = Convert.ToInt32(reader["CategoryID"]);

                products.Add(product);
            }
            connection.Close();
            return products;

        }

        #region 27 April Questions

        #region 1) Dışarıdan decimal minimum ve maximum price alan ve onlara uygun ürünleri bana dönen metot.

        public List<Product> GetMinOrMaxProduct(decimal minimum, decimal maximum)
        {
            List<Product> products = new List<Product>();

            using (SqlConnection sqlConnection = new SqlConnection(Connection.connectionString))
            {
                try
                {
                    sqlConnection.Open();
                    SqlCommand command = new SqlCommand("Select * From Products Where UnitPrice>@min and UnitPrice<@max", sqlConnection);
                    command.Parameters.AddWithValue("@min", minimum);
                    command.Parameters.AddWithValue("@max", maximum);

                    var reader = command.ExecuteReader();

                    while (reader.Read())
                    {
                        Product product = new Product();

                        product.Id = Convert.ToInt32(reader["ProductId"]);
                        product.ProductName = reader["ProductName"].ToString();
                        product.UnitPrice = Convert.ToDecimal(reader["UnitPrice"]);
                        product.UnitsInStock = Convert.ToInt32(reader["UnitsInStock"]);
                        product.CategoryId = Convert.ToInt32(reader["CategoryID"]);

                        products.Add(product);
                    }
                    sqlConnection.Close();
                    return products;
                }
                catch(Exception ex)
                {
                    throw;
                }
            }

        }
        #endregion

        #region 2) Stokta olmayan(stok sayısı 0) olan ürünleri bana dönen metot.
        public List<Product> GetFinishedStocksProduct()
        {
            List<Product> products = new List<Product>();

            using(SqlConnection sqlConnection = new SqlConnection(Connection.connectionString))
            {
                try
                {
                    sqlConnection.Open();

                    SqlCommand command = new SqlCommand("Select * From Products Where UnitsInStock = 0",sqlConnection);

                    var reader = command.ExecuteReader();

                    while (reader.Read())
                    {
                        Product product = new Product();

                        product.Id = Convert.ToInt32(reader["ProductId"]);
                        product.ProductName = reader["ProductName"].ToString();
                        product.UnitPrice = Convert.ToDecimal(reader["UnitPrice"]);
                        product.UnitsInStock = Convert.ToInt32(reader["UnitsInStock"]);
                        product.CategoryId = Convert.ToInt32(reader["CategoryID"]);

                        products.Add(product);
                    }
                    sqlConnection.Close();
                    return products;
                }
                catch(Exception ex)
                {
                    throw;
                }
            }
        }
        #endregion

        #region 3) Dışarıdan name alan ve aldığı name değerindeki ürünleri arayıp bana dönen metot.
        public List<Product> GetSearchName(string name)
        {
            List<Product> products = new List<Product>();
            using(SqlConnection sqlConnection = new SqlConnection(Connection.connectionString))
            {
                try
                {
                    sqlConnection.Open();

                    SqlCommand command = new SqlCommand("Select * From Products Where ProductName Like '%'+@name+'%'", sqlConnection);
                    command.Parameters.AddWithValue("@name", name.ToLower());

                    var reader = command.ExecuteReader();

                    while (reader.Read())
                    {
                        Product product = new Product();

                        product.Id = Convert.ToInt32(reader["ProductId"]);
                        product.ProductName = reader["ProductName"].ToString();
                        product.UnitPrice = Convert.ToDecimal(reader["UnitPrice"]);
                        product.UnitsInStock = Convert.ToInt32(reader["UnitsInStock"]);
                        product.CategoryId = Convert.ToInt32(reader["CategoryID"]);

                        products.Add(product);
                    }
                    sqlConnection.Close();
                    return products;
                }
                catch (Exception ex)
                {
                    throw;
                }
            }
        }
        #endregion

        #region 4) Ürünlerin ortalama fiyatını bana veren metot.

        public decimal GetAvgPriceofProducts()
        {
            decimal result = 0;
            using(SqlConnection sqlConnection = new SqlConnection(Connection.connectionString))
            {
                sqlConnection.Open();
                SqlCommand command = new SqlCommand("Select AVG(UnitPrice) From Products", sqlConnection);

                var reader = command.ExecuteReader();

                while (reader.Read())
                {
                    result = Convert.ToDecimal(reader[0]);
                }

                sqlConnection.Close();

            }

            return result;
        }
        #endregion

        #region 5) Dışarıdan CategoryId alan ve o categoryId e ait ürünlerin ortalama fiyatını bana dönen metot.
        
        public decimal GetAvgSearchCategoryId(int categoryId)
        {
            using (SqlConnection sqlConnection = new SqlConnection(Connection.connectionString))
            {
                decimal result = 0;
                try
                {
                    sqlConnection.Open();

                    SqlCommand command = new SqlCommand("Select AVG(UnitPrice) From Products Where CategoryID = @categoryId", sqlConnection);
                    command.Parameters.AddWithValue("@categoryId", categoryId);

                    var reader = command.ExecuteReader();

                    while (reader.Read())
                    {
                        result = Convert.ToDecimal(reader[0]);

                    }
                    sqlConnection.Close();
                    return result;
                }
                catch (Exception ex)
                {
                    throw;
                }

            }
        }
        #endregion
        #endregion

    }
}
