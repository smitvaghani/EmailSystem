using Email_System.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Email_System
{
    public partial class compose : System.Web.UI.Page
    {
        AppDbContext dbContext = AppDbContext.Create();
        UserModel senderUser;
        string senderId,MailId,btn;
        Mail forReplyMail;
        protected void Page_Load(object sender, EventArgs e)
        {
            Err.Visible = false;
            senderId= Context.User.Identity.GetUserId();
            senderUser= dbContext.Users.Find(senderId);
            MailId = Request.QueryString["Id"];
            btn = Request.QueryString["btn"];
            Mail mail = dbContext.Mails.Find(MailId);
            ReplyMail replyMail = dbContext.ReplyMails.Where(r => r.mailId.Equals(MailId)).FirstOrDefault();
            
            
            if (!IsPostBack)
            {
                if (MailId != null && btn.Equals("reply"))
                {
                    Subject.Text = mail.Subject;
                    forReplyMail = dbContext.Mails.Find(MailId);
                    if (replyMail == null)
                    {
                        string senderId = dbContext.Mails.Find(MailId).SenderUserModelId;
                        userToEmail.Text = dbContext.Users.Find(senderId).Email;
                    }
                    else
                    {
                        userToEmail.Text = dbContext.Users.Find(replyMail.SenderUserModelId).Email;
                    }
                }
                if (MailId != null && btn.Equals("forward"))
                {
                    Subject.Text = mail.Subject;
                    txtEditor.Text = mail.Description;
                }
            }
        }
        protected void SendMail(object sender,EventArgs e)
        {
            string receiverEmail=userToEmail.Text;
            UserModel receiverUser=dbContext.Users.Where(u => u.Email == receiverEmail).FirstOrDefault();
            if (receiverUser == null)
            {
                Err.Visible = true;
                ErrorMessage.Text = "Please Enter Valid Email Id.";
            }
            else
            {
                if (string.IsNullOrEmpty(Subject.Text))
                    Subject.Text = "(no subject)";
                if(MailId != null && btn.Equals("reply"))
                {
                    ReplyMail replyMail = new ReplyMail
                    {
                        Id = Guid.NewGuid().ToString(),
                        SenderUserModel = senderUser,
                        SenderUserModelId = senderId,
                        ReceiverUserModel = receiverUser,
                        ReceiverUserModelId = receiverUser.Id,
                        Description = txtEditor.Text,
                        Date = DateTime.Now,
                        MarkAsRead = false,
                        mail = forReplyMail,
                        mailId = MailId
                    };
                    dbContext.ReplyMails.Add(replyMail);
                    dbContext.SaveChanges();
                    Response.Redirect("DescriptionOfMail.aspx?ID=" + replyMail.mailId);
                }
                else
                {
                    Mail mail = new Mail
                    {
                        Id = Guid.NewGuid().ToString(),
                        SenderUserModelId = senderId,
                        SenderUserModel = senderUser,
                        ReceiverUserModelId = receiverUser.Id,
                        ReceiverUserModel = receiverUser,
                        Subject = Subject.Text,
                        Description = txtEditor.Text,
                        Date = DateTime.Now,
                        MarkAsRead = false,
                        starred=false
                    };
                    dbContext.Mails.Add(mail);
                    dbContext.SaveChanges();
                    Response.Redirect("SentMail.aspx");
                }
            }
        }
        
    }
}