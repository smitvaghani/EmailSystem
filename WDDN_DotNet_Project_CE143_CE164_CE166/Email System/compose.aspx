<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Main.Master" CodeBehind="compose.aspx.cs" Inherits="Email_System.compose" %>

<asp:Content ContentPlaceHolderID="title" runat="server">
    Compose
</asp:Content>
<asp:Content ContentPlaceHolderID="styleSection" runat="server">
    <link rel="stylesheet" href="Static/lib/jquery-te/jquery-te.css" />
    <link rel="stylesheet" href="Static/Css/compose.css" />
</asp:Content>
<asp:Content ContentPlaceHolderID="contentSection" runat="server">
    <div class="form">
    <div class="card">
        <div class="card-body">
            <asp:Panel CssClass="alert alert-danger" Visible="false" ID="Err" runat="server">
            <asp:Literal runat="server" ID="ErrorMessage" />
            </asp:Panel>
            <p class="card-text">
                <asp:Label runat="server"><b>To</b></asp:Label><br />
                <asp:TextBox runat="server" ID="userToEmail" placeholder="Enter Email" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="userToEmail" Display="Dynamic"
                    ForeColor="red" ErrorMessage="<br>The email field is required." />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="userToEmail"
                    ForeColor="red" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                    Display="Dynamic" ErrorMessage="<br>Invalid email address." />
                <br />
                <asp:Label runat="server"><b>Subject</b></asp:Label><br />
                <asp:TextBox runat="server" ID="Subject" TextMode="SingleLine" placeholder="Enter Subject" />
                 <br />
                <asp:Label runat="server"><b>Description</b></asp:Label><br />                
                <asp:TextBox ID="txtEditor" TextMode="MultiLine" runat="server" CssClass="textEditor"></asp:TextBox>
            </p>
            <asp:Button runat="server" OnClick="SendMail" Text="Send" CssClass="btn btn-color col-12" />
        </div>
    </div>
        </div>
</asp:Content>
<asp:Content ContentPlaceHolderID="scriptSection" runat="server">
    <script src="Static/lib/jquery-te/jquery-te.js" type="text/javascript"></script>
    <script>
        $(".textEditor").jqte();
    </script>

</asp:Content>
