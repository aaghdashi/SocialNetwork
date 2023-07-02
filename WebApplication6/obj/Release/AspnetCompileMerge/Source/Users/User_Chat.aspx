<%@ Page Title="" Language="C#" MasterPageFile="~/Users/Users_master.Master" AutoEventWireup="true" CodeBehind="User_Chat.aspx.cs" Inherits="WebApplication6.Users.User_Chat" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="mainContent">
        <br />
        <br />
        <div style="font-family: tahoma, arial; font-size: small; vertical-align: middle; text-align: center; width: 874px; height: 60px;">
            <asp:LinkButton ID="LinkButton_ListFriend" CssClass="link_style" runat="server" OnClick="LinkButton_ListFriend_Click">لیست کاربران آنلاین</asp:LinkButton>
            &nbsp&nbsp&nbsp
                    <asp:LinkButton ID="LinkButton_BlockList" CssClass="link_style" runat="server" OnClick="LinkButton_BlockList_Click">پیام ها</asp:LinkButton>
        </div>
        <asp:MultiView ID="MultiView_Chat" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <div style="font-family: tahoma, arial; width: 874px; background-color: #95A0B2; top: 0px; float: left; text-align: right; vertical-align: middle; font-size: medium; right: 0px; border-radius: 3px 4px;">
                    <p algin="center" style="text-align:center;">
                        کاربران حاضر در سایت
                    </p>
                                                <hr style="background-color: #2C3E5B" />

                    <asp:DataList ID="DataList_Online" runat="server" RepeatColumns="6" OnItemDataBound="DataList_Online_ItemDataBound" DataSourceID="SqlDataSource_List_Chater" CellPadding="8">
                        
                        <ItemTemplate>
                            <asp:Image ID="Image_Chat" runat="server" ImageUrl='<%#Eval("User_pic") %>' AlternateText='<%#Eval("User_pic") %>' CssClass="imageC" />
                            &nbsp;
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource_List_Chater" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        SelectCommand="SELECT ID, Account_name, User_pic FROM User_tbl WHERE (Log_In_State = 'True')"></asp:SqlDataSource>

                </div>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <div style="font-family: tahoma, arial; width: 874px; background-color: #95A0B2; top: 0px; float: left; text-align: right; vertical-align: middle; font-size: medium; right: 0px; border-radius: 3px 4px;">
                    <asp:SqlDataSource ID="SqlDataSource_Chat" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        SelectCommand="SELECT User_tbl.ID, CASE WHEN Chat_tbl.ID_User = User_tbl.ID THEN User_tbl.Name + ' ' + User_tbl.Family END AS USERNAME, User_tbl.Account_name, User_tbl.User_pic, Chat_tbl.Body, Chat_tbl.Date_Create FROM User_tbl INNER JOIN Chat_tbl ON User_tbl.ID = Chat_tbl.ID_User"></asp:SqlDataSource>
                    <asp:Panel ID="Panel1" runat="server" Direction="RightToLeft" Height="500px"
                        HorizontalAlign="Right" ScrollBars="Vertical">
                        <asp:Repeater ID="Repeater_Chat" runat="server" OnItemDataBound="Repeater_Chat_ItemDataBound" OnLoad="Repeater_Chat_Load">
                            <ItemTemplate>
                                <table style="width: 720px; height: 150px;">
                                    <tr>
                                        <td rowspan="2" align="right">
                                            <table style="width: 250px;">
                                                <tr>
                                                    <td rowspan="3" style="text-align: right; vertical-align: top;" width="90px">
                                                        <asp:Image ID="Image_user" runat="server" ImageUrl='<%#Eval("User_pic")%>' CssClass="imagep" />
                                                    </td>
                                                    <td style="text-align: right" width="150px">
                                                        <span class="style3" style="text-align: right">نام:</span><asp:Label ID="Label_Comment_user_name"
                                                            runat="server" Text='<%#Eval("USERNAME")%>' Font-Names="Tahoma" Font-Size="X-Small"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right" width="150px">
                                                        <span class="style3">نام کاربری:</span><asp:Label ID="Label_Comment_user_accountname"
                                                            runat="server" Text='<%#Eval("Account_name")%>' Font-Names="Tahoma" Font-Size="X-Small"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="150px" style="text-align: right;">
                                                        <span dir="rtl">تاریخ:</span>
                                                        <asp:Label ID="Label_date" runat="server" Text='<%#Eval("Date_Create")%>'></asp:Label>

                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td rowspan="1">
                                            <span class="style3" dir="rtl" style="text-align: left;">پیام :</span>
                                        </td>
                                        <td dir="rtl" align="right" style="text-align: right; max-width: 360px" width="360px">
                                            <asp:Literal ID="Literal_body" runat="server" Text='<%#Eval("Body")%>'></asp:Literal>
                                        </td>
                                    </tr>
                                </table>

                                <hr style="background-color: #2C3E5B; margin-top: 0px;" />
                                <br />
                            </ItemTemplate>
                        </asp:Repeater>
                    </asp:Panel>
                    <table style="background-color: #9CAAC1; width: 874px;" align="right" dir="rtl">
                        <tr>
                            <td align="right" dir="rtl" style="color: #FFFFFF">
                                <span class="style1">*</span> کاربر گرامی در این قسمت می توانید پیام خود
                    را تایپ کرده و سپس بر روی دکمه ارسال کلیک کنید.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <telerik:RadEditor ID="RadEditor_Chat" runat="server" Height="300px" Skin="Simple"
                                    Width="720px">
                                    <Tools>
                                        <telerik:EditorToolGroup>
                                            <telerik:EditorSplitButton Name="Undo">
                                            </telerik:EditorSplitButton>
                                            <telerik:EditorSplitButton Name="Redo">
                                            </telerik:EditorSplitButton>
                                            <telerik:EditorSeparator />
                                            <telerik:EditorTool Name="Cut" />
                                            <telerik:EditorTool Name="Copy" />
                                            <telerik:EditorTool Name="Paste" ShortCut="CTRL+V" />
                                            <telerik:EditorSeparator />
                                            <telerik:EditorTool Name="SelectAll" />
                                            <telerik:EditorSeparator />
                                            <telerik:EditorTool Name="InsertDate" />
                                            <telerik:EditorTool Name="InsertTime" />
                                        </telerik:EditorToolGroup>
                                        <telerik:EditorToolGroup>
                                            <telerik:EditorTool Name="Bold" />
                                            <telerik:EditorTool Name="Italic" />
                                            <telerik:EditorTool Name="Underline" />
                                            <telerik:EditorSeparator />
                                        </telerik:EditorToolGroup>
                                        <telerik:EditorToolGroup Tag="DropdownToolbar">
                                            <telerik:EditorDropDown Name="FontName">
                                            </telerik:EditorDropDown>
                                            <telerik:EditorDropDown Name="FontSize">
                                            </telerik:EditorDropDown>
                                        </telerik:EditorToolGroup>
                                    </Tools>
                                    <Content>
                            
                                    </Content>
                                </telerik:RadEditor>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Button ID="Button_Send" runat="server" Text="ارسال" Font-Names="Tahoma" OnClick="Button_Send_Click" />
                            </td>
                        </tr>
                    </table>
                </div>

            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
