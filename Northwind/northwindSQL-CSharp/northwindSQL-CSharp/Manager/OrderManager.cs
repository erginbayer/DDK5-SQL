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
    internal class OrderManager
    {
        public SingletonDBConnection singletonDBConnection;

        public OrderManager()
        {
            singletonDBConnection = SingletonDBConnection.getDbConnection();
        }
        public List<Order> MapSqlDataOrders(SqlDataReader sqlDataReader)
        {
            List<Order> orders = new List<Order>();
            
            while (sqlDataReader.Read())
            {
                Order order = new Order();

                order.OrderId = Convert.ToInt32(sqlDataReader["OrderID"]);
                order.EmployeeId = Convert.ToInt32(sqlDataReader["EmployeeID"]);
                order.OrderDate = Convert.ToDateTime(sqlDataReader["OrderDate"]);
                order.RequiredDate = Convert.ToDateTime(sqlDataReader["RequiredDate"]);
                order.Freight = Convert.ToDecimal(sqlDataReader["Freight"]);
                order.ShipCity = sqlDataReader["ShipCity"].ToString();
                order.ShipCountry = sqlDataReader["ShipCountry"].ToString();

                orders.Add(order);
            }
            return orders;
        }
        public List<Order> GetAllOrders()
        {
            SqlConnection connection = singletonDBConnection.GetOpenDbConnection();

            SqlCommand command = new SqlCommand("Select * From Orders", connection);

            var reader = command.ExecuteReader();
            List<Order> orders = MapSqlDataOrders(reader);
            connection = singletonDBConnection.GetCloseDbConnection();
            return orders;

        }
        public List<Order> GetOrders(string query)
        {
            SqlConnection connection = singletonDBConnection.GetOpenDbConnection();

            SqlCommand command = new SqlCommand(query, connection);

            var reader = command.ExecuteReader();
            List<Order> orders = MapSqlDataOrders(reader);
            connection = singletonDBConnection.GetCloseDbConnection();
            return orders;

        }
        //public List<Order> GetAllOrders()
        //{
        //    List<Order> orders = new List<Order>();
        //    SqlConnection connection = singletonDBConnection.GetOpenDbConnection();

        //    SqlCommand command = new SqlCommand("Select * From Orders", connection);

        //    var reader = command.ExecuteReader();

        //    while (reader.Read())
        //    {
        //        Order order = new Order();

        //        order.OrderId = Convert.ToInt32(reader["OrderID"]);
        //        order.EmployeeId = Convert.ToInt32(reader["EmployeeID"]);
        //        order.OrderDate = Convert.ToDateTime(reader["OrderDate"]);
        //        order.RequiredDate = Convert.ToDateTime(reader["RequiredDate"]);
        //        order.Freight = Convert.ToDecimal(reader["Freight"]);
        //        order.ShipCity = reader["ShipCity"].ToString();
        //        order.ShipCountry = reader["ShipCountry"].ToString();

        //        orders.Add(order);
        //    }

        //    connection = singletonDBConnection.GetCloseDbConnection();
        //    return orders;

        //}
        public List<Order> GetCountryGermanyOrders()
        {
            List<Order> orders = new List<Order>();
            SqlConnection connection = singletonDBConnection.GetOpenDbConnection();

            SqlCommand command = new SqlCommand("Select * From Orders Where ShipCountry = 'Germany' ", connection);

            var reader = command.ExecuteReader();

            while (reader.Read())
            {
                Order order = new Order();

                order.OrderId = Convert.ToInt32(reader["OrderID"]);
                order.EmployeeId = Convert.ToInt32(reader["EmployeeID"]);
                order.OrderDate = Convert.ToDateTime(reader["OrderDate"]);
                order.RequiredDate = Convert.ToDateTime(reader["RequiredDate"]);
                order.Freight = Convert.ToDecimal(reader["Freight"]);
                order.ShipCity = reader["ShipCity"].ToString();
                order.ShipCountry = reader["ShipCountry"].ToString();

                orders.Add(order);
            }

            connection = singletonDBConnection.GetCloseDbConnection();
            return orders;

        }//Kontrol et
    }
}
