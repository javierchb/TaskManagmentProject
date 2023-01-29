using TMWebMvc.Models;
namespace TMWebMvc.UIModels
{
    public class UITask
    {
        public UITask()
        {
            TasksList = new List<TaskModel>();
        }
        public List<TaskModel> TasksList { get; set; }
    }
}
