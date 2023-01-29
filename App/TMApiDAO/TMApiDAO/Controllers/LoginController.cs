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

        [HttpPost("Login")]
        public string Login([FromBody] User loginParams)
        {
            string responseToken = "";
            User response = _daoLogin.AuthenticateUser(loginParams);
            if (response is not null)
            {
                responseToken = "OK";
            }
            else
            {
                responseToken = "ERROR";
            }
            return responseToken;
        }
    }
}
