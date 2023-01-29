using System.Data;

namespace TMApiDAO.ConnectionDB
{
    /// <summary>
    /// Interface IConnectionDB.
    /// </summary>
    public interface IConnectionDB
    {
        IDbConnection GetConnection { get; }
    }
}
