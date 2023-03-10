using System.Data;
using Dapper;
using TMApiDAO.Models;
using TMApiDAO.ConnectionDB;
namespace TMApiDAO.DAO
{
    /// <summary>
    /// Class DAOLogin.
    /// </summary>
    public class DAOLogin : IDAOLogin
    {
        private readonly IConnectionDB _connection;        
        /// <summary>
        /// Constructor DAOLogin.
        /// </summary>
        /// <param name="connection">Injection dependency IConnectionDB.</param>        
        public DAOLogin(IConnectionDB connection)
        {
            _connection = connection;
        }
        
        
        public User AuthenticateUser(User loginParams)
        {
            User response = new User();

            using (var connection = _connection.GetConnection)
            {
                var query = "SELECT * FROM [dbo].tg_user " +
                    "WHERE Username = @inUsername " +
                    "AND UserPassword = @inPassword";
                var resultQuery = connection.QueryFirstOrDefault<User>(query, new { inUsername = loginParams.Username, inPassword = loginParams.Password}, commandType: CommandType.Text);
                response = resultQuery;
            }
            return response;
        }
    }
}
