using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Web;

namespace Project2.Models.Infra
{
    public class EmailHelper
    {
        private string senderEmail = "lee871222@gmail.com";//寄件者
        private string fromPassword= "coou nmfp sgxu rmws";

        public void SendForgetPasswordEmail(string url, string name, string email)
        {
            var subject = "[重設密碼通知]";
            var body = $@"親愛的 {name},
<br/>
請點擊此連結[<a href='{url}' target='_blank'>我要重設密碼</a>],進行重設密碼的動作,如果您沒有提出申請,請忽略此信,謝謝";

            var from = senderEmail;
            var to = email;

            SendViaGoogle(from, to, subject, body);
        }

        public void SendConfirmRegisterEmail(string url, string name, string email)
        {
            var subject = "[重設密碼通知]";
            var body = $@"親愛的 {name},
<br/>
請點擊此連結 [<a href='{url}'target='_blank'>]的確是我申請會員</a>],如果您沒有提出申請,請忽略此信,謝謝";

            var from = senderEmail;
            var to = email;

            SendViaGoogle(from, to, subject, body);
        }

        public virtual void SendViaGoogle(string from ,string to, string subject, string body)
        {
            try
            {
                var smtpClient = new SmtpClient("smtp.gmail.com")
                {
                    Port = 587, // google smpt port
                    Credentials = new NetworkCredential(from, fromPassword),
                    EnableSsl = true, // Depending on your SMTP server's requirement
                };

                var mailMessage = new MailMessage
                {
                    From = new MailAddress(from),
                    Subject = subject,
                    Body = body,
                    IsBodyHtml = true, // Set this to true if the body content is HTML
                };

                mailMessage.To.Add(to);

                smtpClient.Send(mailMessage);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}