using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Project_For_Graduation.Areas.Admin.Models
{
    public class LoginModel
    {
        [Required(ErrorMessage = "Please enter a UserName")]
        public string UserName { get; set; }

        [Required(ErrorMessage = "Please enter a Password")]
        public string Password { get; set; }

        public bool RememberMe { get; set; }

    }
}