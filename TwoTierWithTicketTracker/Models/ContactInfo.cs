using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace TwoTierWithTicketTracker.Models
{
    public class ContactInfo
    {

        [StringLength(50, ErrorMessage = "[Name needs to be less than 50 characters long]")]
        [Required(ErrorMessage = "**Please Enter Your Name.")]
        public string Name { get; set; }

        [Required(ErrorMessage = "**Please Enter Your Email."), EmailAddress]
        public string Email { get; set; }

        [StringLength(30, ErrorMessage = "[Subject needs to be less than 30 characters]")]
        [Required(ErrorMessage = "**Please Enter Your Subject.")]
        public string Subject { get; set; }

        [Required(ErrorMessage = "**Please Enter Your Message.")]
        [UIHint("MultilineText")]
        public string Message { get; set; }


        [Required(ErrorMessage = "**Please Enter Your Phone Number.")]
        public string Phone { get; set; }
        
    }
}