using System.Net.Mail;
using System.Web.Mvc;
using TwoTierWithTicketTracker.Models;

namespace TwoTierWithTicketTracker.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        [Authorize]
        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }
        //begin mail message
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Contact(ContactInfo c1)
        {
            //ViewBag.Message = "Your contact page.";

            //body of mail
            string body = string.Format("Name: {0}<br />Phone: {1}<br />Email: {2}<br />Subject {3}<br />Message: {4}",
                c1.Name,
                c1.Phone,
                c1.Email,
                c1.Subject,
                c1.Message);
            //envelope
            MailMessage msg = new MailMessage("admin@trucoding.com", "tyleretruitt@gmail.com", "Contact " + c1.Name, body);
            //mail message created below
            msg.IsBodyHtml = true;
            msg.CC.Add("tyleretruitt@gmail.com");
            msg.ReplyToList.Add(c1.Email);
            SmtpClient emailSender = new SmtpClient("mail.trucoding.com");

            emailSender.Credentials = new System.Net.NetworkCredential(
                "admin@trucoding.com",
                "Serenity12.");//username and password
            emailSender.Send(msg);

            return RedirectToAction("ContactInfoDisplay", c1);

            //comment out because it is no longer needed
            //return View();
        }

        public ActionResult Contact()
        {
            return View();
        }

        public ActionResult ContactInfoDisplay(ContactInfo c1)
        {
            return View(c1);
        }
        public ActionResult Records()
        {
            return View();
        }
        public ActionResult Portfolio()
        {
            return View();
        }
    }
}
