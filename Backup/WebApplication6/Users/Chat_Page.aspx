<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Chat_Page.aspx.cs" Inherits="WebApplication6.Users.Chat_Page" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="CSS/StyleSheet_Chat.css" rel="stylesheet" type="text/css" />
    <link href="CSS/User_style_page.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            color: #FF0000;
        }
    </style>
</head>
<body style="font-family: tahoma, arial; font-size: small; font-weight: normal; text-align: center;
    background-repeat: repeat; width: 960px; background-color: #2E405F; background-image: url('/Users/images/1.png');">
    <form id="form1" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
    </telerik:RadScriptManager>
    <div class="head">
        <asp:Repeater ID="Repeater_Online_User" runat="server" 
            onitemdatabound="Repeater_Online_User_ItemDataBound">
            <HeaderTemplate>
                <p>
                    کاربران حاضر در سایت
                </p>
                <hr style="background-color: #2C3E5B" />
            </HeaderTemplate>
            <ItemTemplate>
                <asp:Image ID="Image_Chat" runat="server" ImageUrl='<%#Eval("User_pic") %>' AlternateText='<%#Eval("User_pic") %>'
                    Height="120px" Width="90px" />
                &nbsp;
            </ItemTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="SqlDataSource_List_Chater" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT ID, Account_name, User_pic FROM User_tbl WHERE (Log_In_State = 'True')">
        </asp:SqlDataSource>
    </div>
    <div class="body" dir="rtl">
        <asp:SqlDataSource ID="SqlDataSource_Chat" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT User_tbl.ID, CASE WHEN Chat_tbl.ID_User = User_tbl.ID THEN User_tbl.Name + ' ' + User_tbl.Family END AS USERNAME, User_tbl.Account_name, User_tbl.User_pic, Chat_tbl.Body, Chat_tbl.Date_Create FROM User_tbl INNER JOIN Chat_tbl ON User_tbl.ID = Chat_tbl.ID_User">
        </asp:SqlDataSource>
        <asp:Panel ID="Panel_Chat" runat="server" Direction="RightToLeft" Height="500px"
            HorizontalAlign="Right" ScrollBars="Vertical">
            <asp:Repeater ID="Repeater_Chat" runat="server" 
                onitemdatabound="Repeater_Chat_ItemDataBound">
                <ItemTemplate>
                    <table style="width: 720px; height: 150px;">
                        <tr>
                            <td rowspan="2" align="right">
                                <table style="width: 250px;">
                                    <tr>
                                        <td rowspan="3" style="text-align: right; vertical-align: top;" width="90px">
                                            <asp:Image ID="Image_user" runat="server" ImageUrl='<%#Eval("User_pic")%>'
                                                Height="100px" Width="80px" />
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
                                <span class="style3" dir="rtl" style="text-align: left;">متن :</span>
                            </td>
                            <td dir="rtl" align="right" style="text-align: right; max-width: 360px" width="360px">
                                <asp:Literal ID="Literal_body" runat="server" Text='<%#Eval("Body")%>'></asp:Literal>
                            </td>
                        </tr>
                    </table>
                    <div>
                        <hr style="background-color: #2C3E5B; margin-top: 0px;" />
                        <br />
                </ItemTemplate>
            </asp:Repeater>
        </asp:Panel>
  
        <table style="background-color: #9CAAC1;" align="right" dir="rtl">
            <tr>
                <td align="right" dir="rtl" style="color: #FFFFFF">
                    <span class="style1">*</span> کاربر گرامی در این قسمت می توانید متن مورد نظر خود
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
    </form>
</body>
</html>
