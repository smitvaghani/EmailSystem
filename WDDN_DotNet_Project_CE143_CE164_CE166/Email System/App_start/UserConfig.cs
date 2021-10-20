using Email_System.Models;
using System;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin;
using Microsoft.Owin.Security;

namespace Email_System
{
    public class AppDbStore : UserStore<UserModel>
    {
        public AppDbStore(AppDbContext context) : base(context)
        {

        }
    }
    public class AppDbManager:UserManager<UserModel>
    {
        public AppDbManager(IUserStore<UserModel> userStore):base(userStore)
        {
            
            PasswordValidator = new PasswordValidator
            {
                RequiredLength = 8,
                RequireDigit = true,
                RequireLowercase = true,
                RequireUppercase = true,
                RequireNonLetterOrDigit = true
            };
        }
        public static AppDbManager Create(IdentityFactoryOptions<AppDbManager> options, IOwinContext context)
        {
            var manager = new AppDbManager(new UserStore<UserModel>(context.Get<AppDbContext>()));
            manager.UserValidator = new UserValidator<UserModel>(manager)
            {
                AllowOnlyAlphanumericUserNames = false,
                RequireUniqueEmail = true
            };

            // Configure validation logic for passwords
            manager.PasswordValidator = new PasswordValidator
            {
                RequiredLength = 8,
                RequireNonLetterOrDigit = true,
                RequireDigit = true,
                RequireLowercase = true,
                RequireUppercase = true,
            };
            return manager;
        }
    }
    public class AppSignInManager : SignInManager<UserModel, string>
    {
        public AppSignInManager(AppDbManager manager, IAuthenticationManager authentication):base(manager,authentication)
        {

        }
        public override Task<ClaimsIdentity> CreateUserIdentityAsync(UserModel user)
        {
            return user.GenerateUserIdentityAsync((AppDbManager)UserManager);
        }

        public static AppSignInManager Create(IdentityFactoryOptions<AppSignInManager> options, IOwinContext context)
        {
            return new AppSignInManager(context.GetUserManager<AppDbManager>(), context.Authentication);
        }
        
    }

}