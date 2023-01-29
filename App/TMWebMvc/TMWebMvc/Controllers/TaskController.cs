using Microsoft.AspNetCore.Mvc;
using TMWebMvc.Models;
using TMWebMvc.UIModels;
using TMWebMvc.Delegates;
namespace TMWebMvc.Controllers
{    
    /// <summary>
    /// TaskController.
    /// </summary>
    [Route("[controller]")]
    public class TaskController : Controller
    {
        private readonly UITask _UITask = new UITask();
        private readonly DelegateTask _delegateTask;
        /// <summary>
        /// Constructor TaskController.
        /// </summary>
        /// <param name="configuration">Inject dependency IConfiguration.</param>
        public TaskController(IConfiguration configuration)
        {
            _delegateTask = new DelegateTask(configuration);
        }

        /// <summary>
        /// Route to view task index.
        /// </summary>
        /// <returns></returns>
        [Route("Index")]
        public async Task<IActionResult> Index()
        {            
            _UITask.TasksList = await _delegateTask.GetAllTasks();
            return View(_UITask);
        }

    }
}
