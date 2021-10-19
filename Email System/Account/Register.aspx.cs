using Email_System.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Email_System.Account
{
    public partial class Register : System.Web.UI.Page
    {
        AppDbContext appDbContext = new AppDbContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Context.User.Identity.IsAuthenticated)
            {
                Response.Redirect("/Inbox");
            }
        }

        protected void Create_User(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<AppDbManager>();
            var signInManager = Context.GetOwinContext().Get<AppSignInManager>();
            UserModel user = new UserModel
            {
                UserName = Email.Text,
                Email = Email.Text,
                ImagePath = "avatar.png",
                FirstName = FirstName.Text,
                LastName = LastName.Text
            };
            var result = manager.Create(user, Password.Text);
            if (result.Succeeded)
            {

                signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);

                //welcome send mail
                UserModel loggedUser = manager.FindByEmail(Email.Text);
                Mail WelcomeMail = new Mail
                {
                    Id = Guid.NewGuid().ToString(),
                    SenderUserModelId = "f81f8d1a-3655-4ed8-ab08-417665e3a690",
                    ReceiverUserModelId = loggedUser.Id,
                    Subject = "Finish setting up your new account",
                    Description = "Hi, " + loggedUser.FirstName + "<br/>Welcome to Email System.<br><br><br><a href='/profile'>Update Your Profile</a>",
                    Date = DateTime.Now,
                    MarkAsRead = false,
                    starred = false
                };
                appDbContext.Mails.Add(WelcomeMail);
                appDbContext.SaveChanges();
                Response.Redirect("~/Account/Login.aspx");
            }
            else
            {
                Err.Visible = true;
                ErrorMessage.Text = "";
                foreach (var error in result.Errors)
                {
                    if(!error.StartsWith("Name"))
                    ErrorMessage.Text +=error;
                }

            }
        }
    }
}