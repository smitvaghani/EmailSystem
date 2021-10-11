<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Main.Master" CodeBehind="Starred.aspx.cs" Inherits="Email_System.Starred" %>
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
        <asp:Panel Visible="false" ID="noStarredMail" runat="server">
            <asp:Label runat="server" Text="No starred messages. Stars let you give messages a special status to make them easier to find. To star a message, click on the star outline beside any message or conversation." ></asp:Label>
        </asp:Panel>
    <asp:GridView runat="server" ShowHeader="false" AllowPaging="true" GridLines="None" PageSize="14" OnPageIndexChanging="gridView_PageIndexChanging" ID="gridView"  AutoGenerateColumns="false" CssClass="table table-hover" DataKeyNames="Id" OnRowDeleting="gridView_RowDeleting" OnRowDataBound="gridView_RowDataBound" OnRowCommand="gridView_RowCommand">
        <PagerSettings Mode="NextPrevious" NextPageText="<i class='fas fa-greater-than fa-lg'></i>" PreviousPageText="<i class='fas fa-less-than fa-lg'></i>" Position="Top" />
            <PagerStyle ForeColor="#666666" BackColor="White" />
            
        <Columns>
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
            <asp:BoundField DataField="senderName"/>
            <asp:BoundField DataField="mailSubject" />
            <asp:BoundField DataField="mailDate" />
            <asp:CommandField ShowDeleteButton="true" ControlStyle-ForeColor="#666666" DeleteText="<i class='fa fa-trash fa-lg'></i>" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton
                        ID="markAsReadBtn"
                        CausesValidation="false" 
                        CommandName="markAsRead" 
                        ForeColor="#666666"
                        CommandArgument='<%# Eval("Id") %>' 
                        CssClass="fa fa-envelope-open fa-lg text-decoration-none" 
                        ToolTip="Mark as read" 
                        runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField Visible="false" >
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
