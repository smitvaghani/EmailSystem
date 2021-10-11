using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Threading.Tasks;
using System.Security.Claims;

namespace Email_System.Models
{
    public class UserModel : IdentityUser
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public DateTime? DateOfBirth { get; set; }
        public string ImagePath { get; set; }
        public ICollection<Mail> SentMails { get; set; }
        public ICollection<Mail> ReceiveMails { get; set; }
        public Task<ClaimsIdentity> GenerateUserIdentityAsync(AppDbManager manager)
        {
            return Task.FromResult(GenerateUserIdentity(manager));
        }

        private ClaimsIdentity GenerateUserIdentity(AppDbManager manager)
        {
            // Note the authenticationType must match the one defined in CookieAuthenticationOptions.AuthenticationType
            var userIdentity = manager.CreateIdentity(this, DefaultAuthenticationTypes.ApplicationCookie);
            // Add custom user claims here
            return userIdentity;
        }
    }
}