using Email_System.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Email_System.Account
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Context.User.Identity.IsAuthenticated)
            {
                Response.Redirect("/Inbox");
            }
        }

        protected void LogIn(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<AppDbManager>();
            var signInManager = Context.GetOwinContext().Get<AppSignInManager>();
            var result = signInManager.PasswordSignIn(Email.Text, Password.Text, rememberMe.Checked, shouldLockout: false);
            switch(result)
            {
                case SignInStatus.Success:
                     string redirectUrl = Request.QueryString["ReturnUrl"];
                    if (!string.IsNullOrEmpty(redirectUrl))
                    {
                        Response.Redirect(redirectUrl);
                    }
                    else
                        Response.Redirect("/Inbox");
                    break;
                case SignInStatus.Failure:
                    Err.Visible = true;
                    ErrorMessage.Text = "Invalid Login Attempt";
                    break;
            }
        }
    }
}