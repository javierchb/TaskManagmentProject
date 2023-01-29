using TMApiDAO.Models;
namespace TMApiDAO.DAO
{
    /// <summary>
    /// Interface IDAOTask.
    /// </summary>
    public interface IDAOTask
    {
        /// <summary>
        /// Get all tasks.
        /// </summary>
        /// <returns>
        /// Return list of tasks.
        /// </returns>
        List<TaskModel> GetAllTasks();
    }
}
