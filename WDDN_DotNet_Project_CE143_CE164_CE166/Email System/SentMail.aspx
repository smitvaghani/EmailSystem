<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Main.Master" CodeBehind="SentMail.aspx.cs" Inherits="Email_System.SendMail" %>

<asp:Content ContentPlaceHolderID="title" runat="server">
        <asp:Literal ID="title" runat="server"></asp:Literal>
</asp:Content>

<asp:Content ContentPlaceHolderID="contentSection" runat="server">
    <div class="btnPanel" >
        <asp:LinkButton OnCommand="getMail_Command" ForeColor="#666666" runat="server"><i class="fas fa-redo"></i></asp:LinkButton>
    </div>
    
    <div class="mainSection" >
        <asp:Panel runat="server" ID="noSentMails" Visible="false">
        <asp:Label runat="server" Text="No sent messages! "></asp:Label>
        <asp:HyperLink runat="server" Text="Send" ForeColor="Blue" Font-Underline="true" NavigateUrl="~/compose.aspx"></asp:HyperLink>
            <asp:Label runat="server" Text=" one now!"></asp:Label>
            </asp:Panel>
    <asp:GridView runat="server" ShowHeader="false" GridLines="None" ID="gridView" PageSize="14" OnPageIndexChanging="gridView_PageIndexChanging"  AutoGenerateColumns="false" CssClass="table table-hover" DataKeyNames="Id" OnRowDeleting="gridView_RowDeleting" OnRowCommand="gridView_RowCommand" OnRowDataBound="gridView_RowDataBound" AllowPaging="True" >
        <PagerSettings Mode="NextPrevious" NextPageText="<i class='fas fa-greater-than fa-lg'></i>" PreviousPageText="<i class='fas fa-less-than fa-lg'></i>" Position="Top" />
            <PagerStyle ForeColor="#666666" BackColor="White" />
            
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Label ForeColor="#cccccc" ID="markForRead" ToolTip="Your email not yet read." Text="<i class='fa fa-check'></i>" runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton
                        ID="starBtn"
                        CommandName="starred"
                        CommandArgument='<%# Eval("Id") %>'
                        Text="<i class='far fa-star fa-lg'></i>"
                        Font-Underline="false"
                        ToolTip="Not starred"
                       ForeColor="#eebd01"
                        runat="server"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="receiverName"/>
            <asp:BoundField DataField="mailSubject" />
            <asp:BoundField DataField="mailDate" />
            <asp:CommandField ShowDeleteButton="true" ControlStyle-ForeColor="#666666" DeleteText="<i class='fa fa-trash fa-lg'></i>" >
<ControlStyle ForeColor="#666666"></ControlStyle>
            </asp:CommandField>
            <asp:TemplateField Visible="false">
                <ItemTemplate>
                    <asp:HiddenField ID="markAsRead"  runat="server" Value='<%# Eval("mailReadStatus") %>' />
                    <asp:HiddenField ID="starredHidden" runat="server" Value='<%# Eval("starredStatus") %>' />                    
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
        </div>
</asp:Content>
