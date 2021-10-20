<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="404.aspx.cs" Inherits="Email_System.Error._404" %>
<% Response.StatusCode = 404; %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Error Page not found</title>
    <link rel="icon" href="../Static/Images/gmail.ico" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>request Page not found!</h1>
        </div>
    </form>
</body>
</html>
