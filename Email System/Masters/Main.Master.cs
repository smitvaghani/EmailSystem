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
    public partial class Main : System.Web.UI.MasterPage
    {
        AppDbContext appDbContext = new AppDbContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Context.User.Identity.GetUserId();
            UserModel user = appDbContext.Users.Where(u => u.Id == id).FirstOrDefault();
            if (Context.User.Identity.IsAuthenticated)
            {
                string fName = user.FirstName + " " + user.LastName;
                navProfileBtn.ImageUrl=navProfileBtn1.ImageUrl = "/Static/Images/" + user.ImagePath;
                navProfileBtn.ToolTip = fName + Environment.NewLine + user.Email;
                fullName.Text = fName;
                email.Text = user.Email;
            }
            
        }

        protected void logout(object sender, EventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
            Response.Redirect("/Mail/About");
        }
    }
}