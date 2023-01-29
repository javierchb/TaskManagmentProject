using Microsoft.AspNetCore.Mvc;
using TMApiDAO.Models;
using TMApiDAO.DAO;
namespace TMApiDAO.Controllers
{
    /// <summary>
    /// TaskController.
    /// </summary>
    [ApiController]
    [Route("[controller]")]
    public class TaskController : ControllerBase
    {
        private readonly IDAOTask _daoTask;
        /// <summary>
        /// Constructor TaskController.
        /// </summary>
        /// <param name="daoTask">Inject dependency IDAOTask.</param>
        public TaskController(IDAOTask daoTask)
        { 
            _daoTask = daoTask;
        }

        [HttpGet("GetAllTasks")]
        public List<TaskModel> GetAllTasks()
        {
            List<TaskModel> response = new List<TaskModel>();
            response = _daoTask.GetAllTasks();
            return response;        
        }
    }
}
