using Microsoft.AspNetCore.Mvc;
using TMApiDAO.DAO;
using TMApiDAO.Models;
namespace TMApiDAO.Controllers
{
    /// <summary>
    /// LoginController.
    /// </summary>
    [ApiController]
    [Route("[controller]")]
    public class LoginController : ControllerBase
    {
        private readonly IDAOLogin _daoLogin;
        private readonly IConfiguration _config;
        /// <summary>
        /// Constructor LoginController.
        /// </summary>
        /// <param name="daoLogin">Injenction dependency IDAOLogin.</param>
        /// <param name="config">Injection dependency IConfiguration.</param>
        public LoginController(IDAOLogin daoLogin, IConfiguration config)
        {
            _daoLogin = daoLogin;
            _config = config;
        }
    }
}
