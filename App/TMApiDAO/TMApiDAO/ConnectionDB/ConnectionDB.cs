using Microsoft.Data.SqlClient;
using System.Data;
namespace TMApiDAO.ConnectionDB
{
    /// <summary>
    /// Class ConnectionDB.
    /// </summary>
    public class ConnectionDB : IConnectionDB
    {
        private readonly IConfiguration _config;
        /// <summary>
        /// ConnectionDB constructor.
        /// </summary>
        /// <param name="config"></param>
        public ConnectionDB(IConfiguration config)
        { 
            _config = config;
        }

        /// <summary>
        /// Get database connection.
        /// </summary>
        public IDbConnection GetConnection
        {
            get
            {
                var sqlConnection = new SqlConnection();
                if (sqlConnection != null)
                {
                    sqlConnection.ConnectionString = _config["ConnectionString"];
                    sqlConnection.Open();
                    return sqlConnection;
                }
                return null;
            }
        }

    }
}
