using Email_System.Models;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Email_System
{
    public partial class Inbox : System.Web.UI.Page
    {
        AppDbContext appDbContext = new AppDbContext();
        string email, userId;
        protected void Page_Load(object sender, EventArgs e)
        {
            email = Context.User.Identity.Name;
            userId = Context.User.Identity.GetUserId();
            IQueryable<Mail> mails = appDbContext.Mails.Where(m => m.ReceiverUserModelId == userId);
            int unreadCount=mails.Where(m => m.MarkAsRead == false).Count();
            if(unreadCount!=0)
            {
                title.Text = "Inbox (" + unreadCount + ") - " + email;
            }
            else
            title.Text = "Inbox - " + email;

            getMail();
        }
        public void getMail()
        {
            IQueryable<Mail> mails = appDbContext.Mails.Where(m => m.ReceiverUserModelId == userId);
            var result = (from m in mails
                          join u in appDbContext.Users
                          on m.ReceiverUserModelId equals u.Id
                          select new
                          {
                              Id = m.Id,
                              senderName = m.SenderUserModel.FirstName + " " + m.SenderUserModel.LastName,
                              mailSubject = m.Subject,
                              mailDate = m.Date,
                              mailReadStatus = m.MarkAsRead,
                              starredStatus = m.starred
                          }).OrderByDescending(m => m.mailDate);
            gridView.DataSource = result.ToList();
            gridView.DataBind();
        }
        protected void getMail_Command(object sender, CommandEventArgs e)
        {
            getMail();
        }

        protected void gridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = gridView.DataKeys[e.RowIndex].Values[0].ToString();
            Mail obj = appDbContext.Mails.Where(m => m.Id == id).FirstOrDefault();
            appDbContext.Mails.Remove(obj);
            appDbContext.SaveChanges();
            getMail();
        }


        protected void gridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                bool markAsRead = bool.Parse(((HiddenField)e.Row.FindControl("markAsRead")).Value);
                string id = gridView.DataKeys[e.Row.RowIndex].Values[0].ToString();
                if (!markAsRead)
                {
                    e.Row.Font.Bold = true;
                }
                else
                {
                    LinkButton linkButton = (LinkButton)e.Row.FindControl("markAsReadBtn");
                    linkButton.Text = "<i class='fa fa-envelope fa-lg'></i>";
                    linkButton.ToolTip = "mark as unread";
                }
                bool starred = bool.Parse(((HiddenField)e.Row.FindControl("starredHidden")).Value);
                if (starred)
                {
                    LinkButton linkButton = (LinkButton)e.Row.FindControl("starBtn");
                    linkButton.Text = "<i class='fas fa-star fa-lg'></i>";
                    linkButton.ToolTip = "starred";
                }

                e.Row.Attributes.Add("onmouseover", "this.style.cursor='pointer'");
                e.Row.Attributes.Add("onclick", String.Format("window.location='DescriptionOfMail.aspx?ID={0}'", id));

            }
        }

        protected void gridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridView.PageIndex = e.NewPageIndex;
            getMail();
        }

        protected void gridView_Sorting(object sender, GridViewSortEventArgs e)
        {

        }

        protected void gridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();
            Mail obj = appDbContext.Mails.Where(m => m.Id == id).FirstOrDefault();
            if (e.CommandName == "starred")
            {
                if (obj.starred)
                {
                    obj.starred = false;
                }
                else
                    obj.starred = true;
                appDbContext.SaveChanges();
            }
            if (e.CommandName == "markAsRead")
            {
                if (obj.MarkAsRead)
                {
                    obj.MarkAsRead = false;
                }
                else
                    obj.MarkAsRead = true;
                appDbContext.SaveChanges();
            }
            getMail();
        }
    }
}