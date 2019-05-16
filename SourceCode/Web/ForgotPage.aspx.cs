using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web.Controller;

namespace Web
{
    public partial class ForgotPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public static string GetLetter()
        {
            string chars = "$%#@!*abcdefghijklmnopqrstuvwxyz1234567890?;:ABCDEFGHIJKLMNOPQRSTUVWXYZ^&";
            Random rand = new Random();
            int num = rand.Next(0, chars.Length - 1);
            return num.ToString();
        }
        protected void btnForgot_Click(object sender, EventArgs e)
        {
            
            string email = emailInput.Value;
            
            MailMessage objeto_mail = new MailMessage();
            SmtpClient client = new SmtpClient();
            client.EnableSsl = true;
            client.Port = 587;
            client.Host = "smtp.gmail.com";
            client.Timeout = 20000;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.UseDefaultCredentials = false;
            client.Credentials = new System.Net.NetworkCredential("skycloud1096@gmail.com", "hoanganh96honguyen");
            objeto_mail.From = new MailAddress(email);
            objeto_mail.To.Add(new MailAddress("hoanganhit9610@gmail.com"));
            Random rd = new Random();
            string passReset= GetLetter();
            string result = "";
            for (int i = 0; i < 4; i++)
            {
                result += Convert.ToString((char)rd.Next(97, 122))+ Convert.ToString((char)rd.Next(65, 90))+ rd.Next(1, 100);
            }
            UserDAO.Instance.SetPassword(UserDAO.Instance.EndCode(result), email);
            objeto_mail.Subject = "Password Recover";
            objeto_mail.Body = "Your password is: "+ result + " !\nLogin and change your password!";
            client.Send(objeto_mail);
        }

    }
}