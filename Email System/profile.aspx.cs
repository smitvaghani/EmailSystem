using Email_System.Models;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Email_System.Account
{
    public partial class profile : System.Web.UI.Page
    {
        AppDbContext appDbContext = new AppDbContext();
        UserModel user;
        protected void Page_Load(object sender, EventArgs e)
        {
            string id=Context.User.Identity.GetUserId();
            user=appDbContext.Users.Where(u => u.Id == id).FirstOrDefault();
            Err.Visible = false;
            if (!IsPostBack)
            {
                FirstName.Text = user.FirstName;
                LastName.Text = user.LastName;
                profileImage.ImageUrl = "/Static/Images/"+user.ImagePath;
            }
        }

        protected void Continue_Click(object sender, EventArgs e)
        {
            DateTime date = Convert.ToDateTime(DateOfBirth.Text);
            user.FirstName = FirstName.Text;
            user.LastName = LastName.Text;
            user.DateOfBirth = date.Date;
            if (file.HasFile)
            {
                try
                {
                    if (!user.ImagePath.Equals("avatar.png")&&!String.IsNullOrEmpty(user.ImagePath))
                    {
                        File.Delete(Server.MapPath("/Static/Images/") + user.ImagePath);
                    }
                    if (file.PostedFile.ContentLength < 10485760)
                    {
                        string fName = Guid.NewGuid() + "_" + file.FileName;
                        file.SaveAs(Server.MapPath("/Static/Images/") + fName);
                        user.ImagePath = fName;
                    }
                    else
                    {
                        Err.Visible = true;
                        ErrorMessage.Text = "The file has to be less than 10mb!";
                    }
                }
                catch(Exception ex)
                {
                    Err.Visible = true;
                    ErrorMessage.Text = "Error:" + ex;
                }
            }
            appDbContext.SaveChanges();
            Response.Redirect("/Inbox");
        }
    }
}