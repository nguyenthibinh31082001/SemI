using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Net.Mail;
using System.Net;

/// <summary>
/// Summary description for SendMail
/// </summary>
public class SendMail
{
    public SendMail()
    {
    
    }
    public void SendMailToCustomer(string fromMail,string toMail,string subject, string body)
    {
        try
        {
             MailMessage mail = new MailMessage();
        mail.To.Add(toMail);
        mail.From = new MailAddress(fromMail);
        mail.Subject = subject;
        mail.Body = body;
        mail.IsBodyHtml = true;
        SmtpClient smtp = new SmtpClient();
        smtp.Host = ConfigurationManager.AppSettings["SMTP"];
        smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
        smtp.Port = int.Parse(ConfigurationManager.AppSettings["PORT"].ToString());
        smtp.Credentials = new NetworkCredential(ConfigurationManager.AppSettings["FROMEMAIL"], ConfigurationManager.AppSettings["FROMPWD"]);
        smtp.EnableSsl = true;
        smtp.Send(mail);
        }
        catch (Exception)
        {
        }
    }
 
}
