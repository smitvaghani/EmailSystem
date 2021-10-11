using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace Email_System.Models
{
    public class AppDbContext:IdentityDbContext<UserModel>
    {
        public AppDbContext():base("EmailSystemDbCon",throwIfV1Schema: false)
        {

        }
        public static AppDbContext Create()
        {
            return new AppDbContext();
        }
        public DbSet<Mail> Mails { get; set; }
        public DbSet<ReplyMail> ReplyMails { get; set; }
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            //many to many relationships
            modelBuilder.Entity<Mail>()
                        .HasRequired(m => m.SenderUserModel)
                        .WithMany(u => u.SentMails)
                        .HasForeignKey(m => m.SenderUserModelId)
                        .WillCascadeOnDelete(false);

            modelBuilder.Entity<Mail>()
                        .HasRequired(m => m.ReceiverUserModel)
                        .WithMany(u => u.ReceiveMails)
                        .HasForeignKey(m => m.ReceiverUserModelId)
                        .WillCascadeOnDelete(false);
            modelBuilder.Entity<ReplyMail>()
                .HasRequired(r => r.mail)
                .WithMany(m => m.replayMails)
                .HasForeignKey(r => r.mailId)
                .WillCascadeOnDelete(true);

        }
    }
}