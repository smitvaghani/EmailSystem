<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/default.Master" CodeBehind="Register.aspx.cs" Inherits="Email_System.Account.Register" %>

<asp:Content ContentPlaceHolderID="titleSection" runat="server">
    Email
</asp:Content>
<asp:Content ContentPlaceHolderID="StyleSection" runat="server">
    <link rel="stylesheet" href="../Static/Css/register.css" />
</asp:Content>
<asp:Content ContentPlaceHolderID="contentSection" runat="server">
    <div class="form">
        <div class="card">
            <img src="../Static/Images/register_user.png" class="card-img-top user-image" alt="User Profile Image">
            <div class="card-body">
                <h5 class="card-title">
                    <marquee behavior="alternate">Register Your Self Here ! </marquee>
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
                                CssClass="text-danger" ErrorMessage="<br>The firstName field is required." /><br />
                            <asp:Label runat="server"><b>LastName</b></asp:Label><br>
                            <asp:TextBox ID="LastName" runat="server" placeholder="Enter Lastname" /><br />

                            <asp:Label runat="server"><b>Email</b></asp:Label><br>
                            <asp:TextBox ID="Email" runat="server" placeholder="Enter Email" /><br />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Email" Display="Dynamic"
                                CssClass="text-danger" ErrorMessage="The email field is required." />
                            <asp:RegularExpressionValidator runat="server" ControlToValidate="Email"
                                CssClass="text-danger" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                                Display="Dynamic" ErrorMessage="Invalid email address." />
                        </div>

                        <div class="col">
                            <asp:Label runat="server"><b>Password</b></asp:Label><br />
                            <asp:TextBox runat="server" placeholder="Enter Password" ID="Password" TextMode="Password" />
                            <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="<br>The password field is required." /><br />
    
                            <asp:Label runat="server"><b>Confirm password</b></asp:Label><br />
                            <asp:TextBox runat="server" placeholder="Retype Password" ID="ConfirmPassword" TextMode="Password" /><br />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                                CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                            <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                                CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirm password do not match." />

                        </div>
                    </div>
                </p>
                <asp:Button runat="server" OnClick="Create_User" Text="Register" CssClass="btn btn-color col-12" />
                <p class="footer">Already Have An Account ? <a href="/Account/login">Sign in</a> </p>
            </div>
        </div>
    </div>
</asp:Content>
