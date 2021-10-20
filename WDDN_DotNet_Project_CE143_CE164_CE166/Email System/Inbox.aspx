    <%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Main.Master" CodeBehind="Inbox.aspx.cs" Inherits="Email_System.Inbox" %>

<asp:Content ContentPlaceHolderID="title" runat="server">
    <asp:Literal ID="title" runat="server"></asp:Literal>
</asp:Content>

<asp:Content ContentPlaceHolderID="styleSection" runat="server">
</asp:Content>

<asp:Content ContentPlaceHolderID="contentSection" runat="server">
    
    <div class="btnPanel" >
        <asp:LinkButton OnCommand="getMail_Command" ForeColor="#666666" runat="server"><i class="fas fa-redo"></i></asp:LinkButton>
    </div>
    
    <div class="mainSection" >
        <asp:GridView runat="server" AllowSorting="true" OnSorting="gridView_Sorting" ShowHeader="false" GridLines="None" PageSize="14" ID="gridView" AutoGenerateColumns="false" CssClass="table table-hover" DataKeyNames="Id" OnRowDeleting="gridView_RowDeleting" OnRowDataBound="gridView_RowDataBound" OnRowCommand="gridView_RowCommand" AllowPaging="True" OnPageIndexChanging="gridView_PageIndexChanging">
            <PagerSettings Mode="NextPrevious" NextPageText="<i class='fas fa-greater-than fa-lg'></i>" PreviousPageText="<i class='fas fa-less-than fa-lg'></i>" Position="Top" />
            <PagerStyle ForeColor="#666666" BackColor="White" />
            <Columns>
                <asp:TemplateField SortExpression="mailDate">
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
                <asp:BoundField DataField="senderName" SortExpression="mailDate" />
                <asp:BoundField DataField="mailSubject" SortExpression="mailDate" />
                <asp:BoundField DataField="mailDate" SortExpression="mailDate" />
                <asp:CommandField ShowDeleteButton="true" SortExpression="mailDate" ControlStyle-ForeColor="#666666" DeleteText="<i class='fa fa-trash fa-lg'></i>">
                    <ControlStyle ForeColor="#666666"></ControlStyle>
                </asp:CommandField>
                <asp:TemplateField SortExpression="mailDate">
                    <ItemTemplate>
                        <asp:LinkButton
                            runat="server"
                            ID="markAsReadBtn"
                            CommandName="markAsRead"
                            ForeColor="#666666"
                            CommandArgument='<%# Eval("Id") %>'
                            Text="<i class='fa fa-envelope-open fa-lg'></i>"
                            ToolTip="Mark as read"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField SortExpression="mailDate" Visible="false">
                    <ItemTemplate>
                        <asp:HiddenField ID="markAsRead" runat="server" Value='<%# Eval("mailReadStatus") %>' />
                        <asp:HiddenField ID="starredHidden" runat="server" Value='<%# Eval("starredStatus") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
<asp:Content ContentPlaceHolderID="scriptSection" runat="server">
</asp:Content>
