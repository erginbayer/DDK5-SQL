using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace northwindSQL_CSharp.Env
{
    internal class SingletonDBConnection
    {
        private static SingletonDBConnection dbInstance;

        private readonly SqlConnection sqlConnection = new SqlConnection(Connection.connectionString);

        private SingletonDBConnection()
        {

        }

        public static SingletonDBConnection getDbConnection()
        {
            if(dbInstance == null)
                dbInstance = new SingletonDBConnection();

            return dbInstance;
        }

        public SqlConnection GetOpenDbConnection()
        {
            try
            {
                sqlConnection.Open();
            }
            catch (Exception ex)
            {
                throw;
            }

            return sqlConnection;
        }
        public SqlConnection GetCloseDbConnection()
        {
            try
            {
                sqlConnection.Close();
            }
            catch(Exception ex)
            {
                throw;
            }
            return sqlConnection;
        }
    }
}
