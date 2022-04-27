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
    internal class SupplierManager
    {

        public List<Supplier> GetAllProducts()
        {
            List<Supplier> suppliers = new List<Supplier>();

            using (SqlConnection sqlConnection = new SqlConnection(Connection.connectionString))
            {

                try
                {
                    sqlConnection.Open();


                    SqlCommand cmd = new SqlCommand("select * from Suppliers", sqlConnection);

                    var reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        Supplier supplier = new Supplier();

                        supplier.Id = Convert.ToInt32(reader["SupplierID"]);
                        supplier.CompanyName = reader["CompanyName"].ToString();
                        supplier.ContactName = reader["ContactName"].ToString();
                        supplier.Address = reader["Address"].ToString();
                        supplier.City = reader["City"].ToString();

                        suppliers.Add(supplier);

                    }


                    sqlConnection.Close();

                    return suppliers;
                }
                catch (Exception ex)
                {
                    return suppliers;
                }

            }
        }
    }
}
