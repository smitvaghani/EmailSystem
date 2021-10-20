namespace Email_System.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class addStarredColumnInMailTable : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Mails", "starred", c => c.Boolean(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Mails", "starred");
        }
    }
}
