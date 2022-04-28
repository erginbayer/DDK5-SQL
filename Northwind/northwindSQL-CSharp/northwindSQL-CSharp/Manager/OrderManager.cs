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

       public List<Order> GetAllOrders()
        {
            List<Order> orders = new List<Order>();
            SqlConnection connection = singletonDBConnection.GetOpenDbConnection();

            SqlCommand command = new SqlCommand("Select * From Orders", connection);

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

        }
    }
}
