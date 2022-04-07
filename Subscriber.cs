using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;


namespace LicenceViewer
{
    public class Subscriber
    {
        public void SendSMTPEmail(string SMTPServer, string FromAddr, string SMTPUserName, string SMTPPassword, string ToAddr, string Cc, string Subject, string MsgBody, string Attachment)
        {
            if (!string.IsNullOrEmpty(SMTPServer) && !string.IsNullOrEmpty(FromAddr) && !string.IsNullOrEmpty(ToAddr) && MsgBody.Length > 0 && !string.IsNullOrEmpty(Subject))
            {
                char[] chrArray = null;
                chrArray = (!ToAddr.Contains(";") ? new char[] { ',' } : new char[] { ';' });
                MailMessage mailMessage = new MailMessage()
                {
                    From = new MailAddress(FromAddr)
                };
                if (!string.IsNullOrEmpty(ToAddr))
                {
                    string[] strArrays = ToAddr.Split(chrArray);
                    mailMessage.To.Clear();
                    string[] strArrays1 = strArrays;
                    for (int i = 0; i < (int)strArrays1.Length; i++)
                    {
                        string str = strArrays1[i];
                        if (!string.IsNullOrEmpty(str))
                        {
                            mailMessage.To.Add(new MailAddress(str.Trim()));
                        }
                    }
                }
                mailMessage.Subject = Subject;
                mailMessage.IsBodyHtml = true;
                mailMessage.Body = MsgBody.ToString();
                SmtpClient smtpClient = new SmtpClient(SMTPServer);
                if (Attachment.Trim() != string.Empty)
                {
                    System.Net.Mail.Attachment attachment = new System.Net.Mail.Attachment(Attachment);
                    mailMessage.Attachments.Add(attachment);
                }
                try
                {
                    try
                    {
                        if (!string.IsNullOrEmpty(SMTPUserName) && !string.IsNullOrEmpty(SMTPPassword))
                        {
                            smtpClient.Credentials = new NetworkCredential(SMTPUserName, SMTPPassword);
                        }
                        smtpClient.UseDefaultCredentials = false;
                        smtpClient.Send(mailMessage);
                        //Program.WriteLog("############### Mailed Successfully ###############", string.Empty);
                    }
                    catch (SmtpException smtpException1)
                    {
                        SmtpException smtpException = smtpException1;
                        //Program.log.Info(smtpException.Message ?? "");
                        throw new Exception(string.Format("Error while sending mail...{0}", smtpException.Message));
                    }
                    catch (Exception exception1)
                    {
                        Exception exception = exception1;
                        //Program.log.Info(string.Concat("Error while sending mail :: ", exception.Message));
                        throw new Exception(string.Format("Error while sending mail.. {0}", exception.Message));
                    }
                }
                finally
                {
                    if (mailMessage != null)
                    {
                        mailMessage.Dispose();
                        mailMessage = null;
                    }
                    if (smtpClient != null)
                    {
                        smtpClient = null;
                    }
                }
            }
        }

    }
}