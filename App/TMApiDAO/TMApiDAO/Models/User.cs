using System.Runtime.CompilerServices;

namespace TMApiDAO.Models
{
    public class User
    {
        public User()
        {
            Names = "";
            Lastname1 = "";
            Lastname2 = "";
            Username = "";
            Email = "";
            Phone = "";
            Password = "";
        }
        public int IdUsr { get; set; }
        public string Names { get; set; }
        public string Lastname1 { get; set; }
        public string Lastname2 { get; set; }
        public string Username { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Password { get; set; }
    }
}
