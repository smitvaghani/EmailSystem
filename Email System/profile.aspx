<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Main.Master" CodeBehind="profile.aspx.cs" Inherits="Email_System.Account.profile" %>

<asp:Content ContentPlaceHolderID="title" runat="server">
    Profile of User
</asp:Content>
<asp:Content ContentPlaceHolderID="styleSection" runat="server">
    <link rel="stylesheet" href="Static/Css/profile.css" />
</asp:Content>
<asp:Content ContentPlaceHolderID="contentSection" runat="server">
    <div class="form">
    <div class="card">
        <asp:Image runat="server" ID="profileImage" class="rounded-circle card-img-top user-image" alt="User Profile Image"/>
        <div class="card-body">
            <h5 class="card-title">
                <marquee behavior="alternate">Update Your profile Here ! </marquee>
            </h5>
            <asp:Panel CssClass="alert alert-danger" Visible="false" ID="Err" runat="server">
                <asp:Literal runat="server" ID="ErrorMessage" />
            </asp:Panel>
            <p class="card-text">

                <div class="row">
                    <div class="col">
                        <asp:Label runat="server"><b>FirstName</b></asp:Label><br>
                        <asp:TextBox ID="FirstName" runat="server" placeholder="Enter Firstname" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="FirstName" Display="Dynamic"
                            ForeColor="Red" ErrorMessage="<br>The firstName field is required." /><br />
                        <asp:Label runat="server"><b>LastName</b></asp:Label><br>
                        <asp:TextBox ID="LastName" runat="server" placeholder="Enter Lastname" /><br />
                    </div>
                    <div class="col">
                        <asp:Label runat="server"><b>Date of Birth</b></asp:Label><br />
                        <asp:TextBox runat="server" ID="DateOfBirth" TextMode="Date" />
                        <asp:RequiredFieldValidator
                            runat="server"
                            ControlToValidate="DateOfBirth"
                            ForeColor="Red"
                            ErrorMessage="<br>Date of Birth required."
                            Display="Dynamic"></asp:RequiredFieldValidator><br />
                        <asp:Label runat="server"><b>Profile picture</b></asp:Label><br />
                        <asp:FileUpload runat="server" CssClass="form-control" ID="file" />
                        <asp:RegularExpressionValidator
                            runat="server"
                            ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))(.jpg|.JPG|.jpeg|.JPEG|.png|.PNG)$"
                            ErrorMessage="only this image format allowed:jpg,jpeg,png,bmp."
                            ControlToValidate="file"
                            ForeColor="Red"
                            Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
                </div>

            </p>
        </div>
        <asp:Button runat="server" OnClick="Continue_Click" Text="Continue" CssClass="btnContinue btn-color col-12" />
    </div>
        </div>
</asp:Content>

