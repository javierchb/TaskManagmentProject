using Dapper;
using System.Data;
using Microsoft.AspNetCore.Mvc;
using TMApiDAO.ConnectionDB;
using TMApiDAO.Models;
namespace TMApiDAO.DAO
{
    /// <summary>
    /// Class DAOTask implement IDAOTask.
    /// </summary>
    public class DAOTask : IDAOTask
    {
        private readonly IConnectionDB _connection;
        /// <summary>
        /// Contructor DAOTask.
        /// </summary>
        /// <param name="connection">Injection dependency IConnectionDB.</param>
        public DAOTask(IConnectionDB connection)
        { 
            _connection = connection;
        }
                
        public List<TaskModel> GetAllTasks()
        {
            List<TaskModel> response = new List<TaskModel>();
            using (var connection = _connection.GetConnection)
            {
                var query = "SELECT " +
                    "tt.IdTsk, " +
                    "tt.TskDescription Description, " +
                    "tt.TskObservation Observation, " +
                    "tt.TskCreatedDate CreatedDate, " +
                    "tt.TskEndDate EndDate, " +
                    "tt.TskCompletedDate CompletedDate, " +
                    "tt.IdTskPeriod Periodicity, " +
                    "tt.TskPeriodDays DaysPeriodicity " +
                    "FROM [dbo].tg_task tt";
                var resultQuery = connection.Query<TaskModel>(query, commandType: CommandType.Text);
                response = resultQuery.ToList();
            }
            return response;        
        }
    }
}
