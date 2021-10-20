using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace Email_System.Models
{
    public class UserInitializer : DropCreateDatabaseAlways<AppDbContext>
    {
        protected override void Seed(AppDbContext context)
        {
            AppDbStore dbStore = new AppDbStore(context);
            AppDbManager manager = new AppDbManager(dbStore);
            UserModel user = new UserModel()
            {
                Id = "adminId",
                FirstName = "admin",
                Email = "admin@emailSystem.com",
                ImagePath = "logo.jpg",
                UserName = "admin@emailSystem.com"
            };
            manager.Create(user, "Aa@1234Aa");
            base.Seed(context);
        }
    }
}