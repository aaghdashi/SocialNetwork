<%@ Page Title="" Language="C#" MasterPageFile="~/Users/Users_master.Master" AutoEventWireup="true"
    CodeBehind="Users_comments.aspx.cs" Inherits="WebApplication6.Users.WebForm2" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:ScriptManager ID="ScriptManager_Comment" runat="server">
    </asp:ScriptManager>
    <div class="mainContent">
        <asp:UpdatePanel ID="UpdatePanel_Comment" runat="server">
            <ContentTemplate>
                <div class="File_Content" align="right" dir="rtl">
                    <asp:Repeater ID="Repeater_Comment" runat="server" 
                        DataSourceID="SqlDataSource_Comment_Post" 
                        onitemdatabound="Repeater_Comment_ItemDataBound">
                    <ItemTemplate>
                                <table style="width: 874px; height: 150px;">
                                    <tr>
                                        <td rowspan="2" align="right">
                                            <table style="width: 250px;">
                                                <tr>
                                                    <td rowspan="3" style="text-align: right" width="90px">
                                                        <asp:Image ID="Image_user" runat="server" ImageUrl='<%#Eval("User_pic")%>' CssClass="imagep"/>
                                                    </td>
                                                    <td style="text-align: right">
                                                        <span class="style3" style="text-align: right">نام:</span><asp:Label ID="Label_Comment_user_name"
                                                            runat="server" Text='<%#Eval("USERNAME")%>' Font-Names="Tahoma" Font-Size="X-Small"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <span class="style3">نام کاربری:</span><asp:Label ID="Label_Comment_user_accountname"
                                                            runat="server" Text='<%#Eval("Account_name")%>' Font-Names="Tahoma" Font-Size="X-Small"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td rowspan="1">
                                            <span class="style3" dir="rtl" style="text-align: left; max-width: 140px">متن نظر:</span>
                                        </td>
                                        <td dir="rtl" align="right" style="text-align: right; max-width: 360px" width="360px">
                                            <asp:Literal ID="Literal_body" runat="server" Text='<%#Eval("Body")%>'></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <span class="style3" dir="rtl" style="text-align: left; max-width: 140px;">تاریخ:</span>
                                        </td>
                                        <td dir="rtl" align="right" style="text-align: right; max-width: 360px" width="360px">
                                            <asp:Label ID="Label_date" runat="server" Text='<%#Eval("Create_date")%>'></asp:Label>                                        
                                        </td>
                                    </tr>
                                </table>
                                <div><a class="link_style" href="Users_comments.aspx?comment_id=<%#Eval("Comment_ID") %>&mode=comment&post_id=<%#Eval("Post_ID") %>">حذف </a> </div>
                                <hr style="background-color: #2C3E5B; margin-top: 0px;" />
                                <br />
                                </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="SqlDataSource_Comment_Post" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        
                        SelectCommand="SELECT User_tbl.ID, CASE WHEN Comment_Users_tbl.User_ID = User_tbl.ID THEN User_tbl.Name + ' ' + User_tbl.Family END AS USERNAME, User_tbl.Account_name, User_tbl.User_pic, Comment_Users_tbl.Body, Comment_Users_tbl.Create_date, Comment_Users_tbl.ID as Comment_ID, Comment_Users_tbl.Post_ID FROM Comment_Users_tbl INNER JOIN User_tbl ON Comment_Users_tbl.User_ID = User_tbl.ID WHERE (Comment_Users_tbl.Post_ID = @Post_ID)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="Post_ID" QueryStringField="post_id" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
