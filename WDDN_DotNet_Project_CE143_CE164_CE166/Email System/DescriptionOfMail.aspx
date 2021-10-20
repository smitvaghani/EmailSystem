<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Main.Master" CodeBehind="DescriptionOfMail.aspx.cs" Inherits="Email_System.DescriptionOfMail" %>

<asp:Content ContentPlaceHolderID="title" runat="server">
    <asp:Literal ID="title" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ContentPlaceHolderID="styleSection" runat="server">
    <link rel="stylesheet" href="Static/Css/descriptionCss.css" />
    <style type="text/css">
        .auto-style1 {
            width: 101%;
        }

        .auto-style2 {
            width: 55px;
        }

        .auto-style3 {
            width: 741px;
        }

        .auto-style4 {
            width: 185px;
        }

        .auto-style5 {
            width: 26px;
        }
    </style>
</asp:Content>
<asp:Content ContentPlaceHolderID="contentSection" runat="server">
    <div class="btnPanel" >
        <a href="/Inbox"> <i class="fas fa-lg fa-arrow-left"></i></a>
    </div>
    <div class="mainSection">
    <div class="card">
        <div class="card-body">
            <div class="card-title">
                <asp:Label runat="server" ID="subjectOfMail"></asp:Label>
            </div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Image ID="profileImg" runat="server" ImageUrl="~/Static/Images/login_user.png" CssClass="mail-photo" />
                    </td>
                    <td class="auto-style3">&nbsp;<asp:Label Font-Bold="true" runat="server" ID="fullName"></asp:Label>
                        &lt;<asp:Label runat="server" ID="senderEmail"></asp:Label>&gt;

                    </td>
                    <td class="auto-style4">
                        <asp:Label runat="server" ID="time"></asp:Label></td>
                    <td class="auto-style5">
                        <asp:HyperLink ID="replyBtn" runat="server" Text="<i class='fas fa-reply fa-lg small-btn'></i>"></asp:HyperLink></td>
                    <td>
                        <asp:HyperLink ID="forwardBtn" runat="server" Text="<i class='fas fa-arrow-right fa-lg small-btn'></i>"></asp:HyperLink></td>
                </tr>
            </table>
        </div>
        <div class="card-text">
            <div class="des">
                <asp:Label runat="server" ID="descriptionOfMail"></asp:Label>
            </div>
            <asp:HyperLink runat="server" ID="replyBtn1" CssClass="btn btn-outline-secondary"><i class="fas fa-lg fa-reply"></i>&nbsp;&nbsp;Reply</asp:HyperLink>
            <asp:HyperLink runat="server" ID="forwardBtn1" CssClass="btn btn-outline-secondary"><i class="fas fa-lg fa-arrow-right"></i>&nbsp;&nbsp;Forward</asp:HyperLink>
        </div>
    </div>
    <asp:Panel ID="replayMailPanel" runat="server" Visible="false">
        <%--replys of mail--%>
        <%foreach (var mail in replyMails)
            {
                string replyUrl = "/Compose.aspx?Id=" + mail.mailId + "&btn=reply";
                string forwardUrl = "/Compose.aspx?Id=" + mail.mailId + "&btn=forward";
                string fullName = mail.SenderUserModel.FirstName + " " + mail.SenderUserModel.LastName;
                string imagePath = "/Static/Images/" + mail.SenderUserModel.ImagePath;
        %>
        <div class="card">
            <div class="card-body">
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style2">
                            <image class="mail-photo" src="<%=imagePath %>"  />
                        </td>
                        <td class="auto-style3">&nbsp;<b><%=fullName %></b>
                            &lt;<%=mail.SenderUserModel.Email %>&gt;

                        </td>
                        <td class="auto-style4"><%=mail.Date.ToString("MMM dd, yyyy h:m tt") %></td>
                        <td class="auto-style5"><a href="<%=replyUrl %>"></a><i class="fas fa-reply fa-lg small-btn"></td>
                        <td><a href="<%=forwardUrl %>"><i class="fas fa-arrow-right fa-lg small-btn"></i></a></td>
                    </tr>
                </table>
            </div>
            <div class="card-text">
                <div class="des">
                    <%=mail.Description %>
                </div>
                <a href="<%=replyUrl %>" class="btn btn-outline-secondary"><i class="fas fa-lg fa-reply"></i>&nbsp;&nbsp;Reply</a>
                <a href="<%=forwardUrl %>" class="btn btn-outline-secondary"><i class="fas fa-lg fa-arrow-right"></i>&nbsp;&nbsp;Forward</a>
            </div>
        </div>
        <%} %>
    </asp:Panel>
        </div>
</asp:Content>
