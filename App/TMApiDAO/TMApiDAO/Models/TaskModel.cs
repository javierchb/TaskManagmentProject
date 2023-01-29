namespace TMApiDAO.Models
{
    /// <summary>
    /// Class Task.
    /// </summary>
    public class TaskModel
    {
        /// <summary>
        /// Constructor TaskModel.
        /// </summary>
        public TaskModel()
        {
            Description = "";
            Observation = "";
            DaysPeriodicity = "";
        }
        public int IdTsk { get; set; }
        public string Description { get; set; }
        public string Observation { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime EndDate { get; set; }
        public DateTime CompletedDate { get; set; }
        public int Periodicity { get; set; }
        public string DaysPeriodicity { get; set; }
    }
}
