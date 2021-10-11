using Email_System.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Email_System
{
    public partial class DescriptionOfMail : System.Web.UI.Page
    {
        public AppDbContext appDbContext = new AppDbContext();
        public IEnumerable<ReplyMail> replyMails;
        public Mail obj;
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["ID"];
            if (id == null)
            {
                Response.Redirect("/");
            }
            else
            {
                //sender User Model
                obj = appDbContext.Mails.Where(m => m.Id.Equals(id)).FirstOrDefault();
                title.Text = obj.Subject;
                UserModel senderUser = appDbContext.Users.Find(obj.SenderUserModelId);
                UserModel receiverUser = appDbContext.Users.Find(obj.ReceiverUserModelId);
                if (Context.User.Identity.Name.Equals(receiverUser.Email))
                {
                    obj.MarkAsRead = true;
                    appDbContext.SaveChanges();
                }


                subjectOfMail.Text = obj.Subject;
                profileImg.ImageUrl = "/Static/Images/" + senderUser.ImagePath;
                fullName.Text = senderUser.FirstName + " " + senderUser.LastName;
                senderEmail.Text = senderUser.Email;
                time.Text = obj.Date.ToString("MMM dd, yyyy h:m tt");
                descriptionOfMail.Text = obj.Description;
                replyBtn.NavigateUrl = "/Compose.aspx?Id=" + obj.Id + "&btn=reply";
                replyBtn1.NavigateUrl = "/Compose.aspx?Id=" + obj.Id + "&btn=reply";
                forwardBtn.NavigateUrl = "/Compose.aspx?Id=" + obj.Id + "&btn=forward";
                forwardBtn1.NavigateUrl = "/Compose.aspx?Id=" + obj.Id + "&btn=forward";

                replyMails = appDbContext.ReplyMails.Where(r => r.mailId.Equals(id)).OrderBy(r => r.Date);
                if (replyMails.Count() != 0)
                {
                    replayMailPanel.Visible = true;
                }
            }
        }
    }
}