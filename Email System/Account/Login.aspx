<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/default.Master" CodeBehind="Login.aspx.cs" Inherits="Email_System.Account.Login" %>

<asp:Content ContentPlaceHolderID="titleSection" runat="server">
    Email
</asp:Content>
<asp:Content ContentPlaceHolderID="styleSection" runat="server">
    <link rel="stylesheet" href="../Static/Css/login.css" />
</asp:Content>
<asp:Content ContentPlaceHolderID="contentSection" runat="server">
    <div class="form">
    <div class="card">
        <img src="../Static/Images/login_user.png" class="card-img-top user-image" alt="User Profile Image" />
        <div class="card-body">
            <h5 class="card-title">
                <marquee behavior="alternate">Welcome to Login Page !</marquee>
            </h5>
            <asp:Panel CssClass="alert alert-danger" Visible="false" ID="Err" runat="server">
            <asp:Literal runat="server" ID="ErrorMessage" />
            </asp:Panel>
            <p class="card-text">
                <asp:Label runat="server"><b>Email</b></asp:Label><br>
                <asp:TextBox ID="Email" runat="server" placeholder="Enter Email" /><br />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email" Display="Dynamic"
                    CssClass="text-danger" ErrorMessage="The email field is required.<br>" />
                <asp:RegularExpressionValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                    Display="Dynamic" ErrorMessage="Invalid email address.<br>" />

                <asp:Label runat="server"><b>Password</b></asp:Label><br />
                <asp:TextBox runat="server" placeholder="Enter Password" ID="Password" TextMode="Password" />
                <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="<br>The password field is required." /><br />
                <br />

                <asp:CheckBox CssClass="rememberCheckBox" runat="server" ID="rememberMe" />
                <asp:Label  runat="server">
    <b>Remember me</b>
                </asp:Label>
            </p>
            <asp:Button runat="server" OnClick="LogIn" Text="Log in" CssClass="btn btn-color col-12" />
        <p class="footer">Don't Have An Account?
            <asp:HyperLink runat="server" NavigateUrl="~/Account/Register.aspx">Sign up</asp:HyperLink>
        </p>
        </div>
        
    </div>
        </div>
</asp:Content>
