using TMApiDAO.Models;
namespace TMApiDAO.DAO
{
    public interface IDAOLogin
    {
        /// <summary>
        /// Authenticate user.
        /// </summary>
        /// <param name="Params">User login params.</param>
        /// <returns>Return user data.</returns>
        User AuthenticateUser(User loginParams);
    }
}
