namespace Email_System.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class addReplyMailTable : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.ReplyMails",
                c => new
                    {
                        Id = c.String(nullable: false, maxLength: 128),
                        SenderUserModelId = c.String(maxLength: 128),
                        ReceiverUserModelId = c.String(maxLength: 128),
                        Description = c.String(),
                        Date = c.DateTime(nullable: false),
                        MarkAsRead = c.Boolean(nullable: false),
                        mailId = c.String(nullable: false, maxLength: 128),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Mails", t => t.mailId, cascadeDelete: true)
                .ForeignKey("dbo.AspNetUsers", t => t.ReceiverUserModelId)
                .ForeignKey("dbo.AspNetUsers", t => t.SenderUserModelId)
                .Index(t => t.SenderUserModelId)
                .Index(t => t.ReceiverUserModelId)
                .Index(t => t.mailId);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.ReplyMails", "SenderUserModelId", "dbo.AspNetUsers");
            DropForeignKey("dbo.ReplyMails", "ReceiverUserModelId", "dbo.AspNetUsers");
            DropForeignKey("dbo.ReplyMails", "mailId", "dbo.Mails");
            DropIndex("dbo.ReplyMails", new[] { "mailId" });
            DropIndex("dbo.ReplyMails", new[] { "ReceiverUserModelId" });
            DropIndex("dbo.ReplyMails", new[] { "SenderUserModelId" });
            DropTable("dbo.ReplyMails");
        }
    }
}
