using Newtonsoft.Json;
using System.Net.Http.Headers;
using TMWebMvc.Models;
namespace TMWebMvc.Delegates
{
    /// <summary>
    /// Class DelegateTask.
    /// </summary>
    public class DelegateTask
    {        
        private readonly IConfiguration _configuration;
        private readonly HttpClientHandler _httpHandler;
        /// <summary>
        /// Constructor DelegateTask.
        /// </summary>        
        /// <param name="configuration">Injected depedency IConfiguration.</param>
        public DelegateTask(IConfiguration configuration)
        { 
            _configuration = configuration;
            _httpHandler = new HttpClientHandler();
            _httpHandler.ServerCertificateCustomValidationCallback = (message, cert, chain, errors) => { return true; };
        }

        /// <summary>
        /// Get all tasks.
        /// </summary>
        /// <returns></returns>
        public async Task<List<TaskModel>> GetAllTasks()
        {
            List<TaskModel> response = new List<TaskModel>();
            try
            {
                string url = "https://localhost:7136/Task/GetAllTasks";
                HttpClient client = new HttpClient(_httpHandler);                
                var resp = client.GetStringAsync(url);
                string getResp = await resp;
                if (!String.IsNullOrWhiteSpace(getResp))
                {
                    response = JsonConvert.DeserializeObject<List<TaskModel>>(getResp);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return response;
        }        
    }
}
