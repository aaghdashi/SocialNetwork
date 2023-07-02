<%@ Page Title="" Language="C#" MasterPageFile="~/Users/Users_master.Master" AutoEventWireup="true"
    CodeBehind="User_Show_Group.aspx.cs" Inherits="WebApplication6.Users.WebForm9" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="mainContent">
        <div style="font-family: tahoma, arial; font-size: small; vertical-align: middle;
            text-align: center; width: 874px; height: 60px; top: 0px; right: 0px">
            <asp:ImageButton ID="ImageButton_Make_Group" runat="server" ImageUrl="~/Users/images/Make_Group.png" ToolTip="ایجاد گروه"
                AlternateText="ایجاد گروه" OnClick="ImageButton_Make_Group_Click" /> 
            <asp:ImageButton ID="ImageButton_Show_Group" runat="server" ImageUrl="~/Users/images/users (2).png" ToolTip="گروه های موجود"
                AlternateText="گروه های موجود" OnClick="ImageButton_Show_Group_Click" />
        </div>
        <asp:MultiView ID="MultiView_Group" runat="server" ActiveViewIndex="0">
            <asp:View ID="View_Show_Groups" runat="server">
                <table style="width: 874px;" align="center">
                    <tr>
                        <td style="font-family: tahoma, arial; font-size: small; font-weight: normal; font-style: normal;
                            vertical-align: middle;" align="right">
                            <asp:Button ID="Button1" runat="server" Font-Names="Tahoma" OnClick="Button1_Click"
                                Style="height: 26px" Text="نمایش بده" />
                        </td>
                        <td align="right" dir="rtl" style="font-family: tahoma, arial; font-size: small;
                            font-weight: normal; font-style: normal; vertical-align: middle;">
                            <asp:DropDownList ID="DropDownList_Group_type" runat="server" Font-Names="Tahoma"
                                Width="300px">
                                <asp:ListItem Value="0">گروه های فعال </asp:ListItem>
                                <asp:ListItem Value="1">گروه هایی که خود ایجاد کرده ام</asp:ListItem>
                                <asp:ListItem Value="2">گروه هایی که در آنها عضو هستم</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td align="left" dir="rtl" style="font-family: tahoma, arial; font-size: small; font-weight: normal;
                            font-style: normal; vertical-align: middle;">
                            نمایش:
                        </td>
                    </tr>
                </table>
                <hr style="background-color: #2C3E5B" />
                <div style="text-align: center" align="center">
                    <asp:MultiView ID="MultiView_Type_Group" runat="server">
                        <asp:View ID="View_Exist_Group" runat="server">
                            <div style="font-family: tahoma, arial; font-size: small; vertical-align: top; width: 874px;">
                                <div style="max-width: 874px; width: 874px; direction: rtl; position: relative; text-align: center;
                                    top: 0px; right: 0px; float: right;" align="center" dir="rtl">
                                    <asp:DataList ID="DataList_Exist_Group_Section1" runat="server" DataSourceID="SqlDataSource_Exist_Group_Section1" RepeatColumns="3" CellPadding="5" OnItemDataBound="DataList_Exist_Group_Section1_ItemDataBound">
                                        <ItemTemplate>
                                            <table style="width: 280px" dir="rtl" align="center">
                                                <tr>
                                                    <td>
                                                        <a href="User_Show_Group.aspx?id=<%#Eval("ID")%>&mode=signup">
                                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("Pic_Group")%>' AlternateText='برای عضویت در گروه کلیک کنید'
                                                                Height="140px" Width="120px" />
                                                        </a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span style="font-size: x-small; color: #666666">مدیر گروه:</span><asp:Label ID="Label6"
                                                            runat="server" Text='<%#Eval("Admin_Group") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span style="font-size: x-small; color: #666666">نام گروه:</span><asp:Label ID="Label7"
                                                            runat="server" Text='<%#Eval("Name_Group") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span style="font-size: x-small; color: #666666">موضوع:</span><asp:Label ID="Label8"
                                                            runat="server" Text='<%#Eval("Topic_Group") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span style="font-size: x-small; color: #666666">تاریخ ایجاد:</span><asp:Label ID="Label_Date_all"
                                                            runat="server" Text='<%#Eval("Date_Create") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span style="font-size: x-small; color: #666666">توضیحات:</span><asp:Label ID="Label10"
                                                            runat="server" Text='<%#Eval("Description") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                        </ItemTemplate>
                                    </asp:DataList>
                                </div>
                                <asp:SqlDataSource ID="SqlDataSource_Exist_Group_Section1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                    SelectCommand="SELECT  CASE WHEN ID_Creator = User_tbl.ID THEN User_tbl.Name + ' ' + User_tbl.Family END AS 'Admin_Group', Group_tbl.Name_Group, Group_tbl.Topic_Group, Group_tbl.Date_Create, Group_tbl.Discreption_Group AS 'Description', Group_tbl.Pic_Group, Group_tbl.ID FROM Group_tbl INNER JOIN User_tbl ON Group_tbl.ID_Creator = User_tbl.ID
WHERE (Group_tbl.Active='true') AND (Group_tbl.Archive='false')
 ORDER BY Group_tbl.ID ASC">
                                </asp:SqlDataSource>
                            </div>
                            <div style="text-align: center; font-size: small; color: #FF0000">
                                <asp:Literal ID="Literal_Signup" runat="server"></asp:Literal>
                            </div>
                        </asp:View>
                        <asp:View ID="View_Maked_Group_By_me" runat="server">
                            <asp:SqlDataSource ID="SqlDataSource_Maked_Group_By_me_Section1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                SelectCommand="SELECT Name_Group, Topic_Group, Date_Create, Discreption_Group, Pic_Group FROM Group_tbl WHERE (ID_Creator = @id) ORDER BY Date_Create ASC
">
                                <SelectParameters>
                                    <asp:SessionParameter Name="id" SessionField="id_user" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <div style="font-family: tahoma, arial; font-size: small; vertical-align: top; width: 874px;">
                                <div style="max-width: 874px; width: 874px; direction: rtl; position: relative; text-align: center;
                                    top: 0px; right: 0px; float: right; margin-left: 0px;" align="center" dir="rtl">
                                    <asp:DataList ID="DataList_Maked_Group_By_me" runat="server" DataSourceID="SqlDataSource_Maked_Group_By_me_Section1" RepeatColumns="3" CellPadding="5" OnItemDataBound="DataList_Maked_Group_By_me_ItemDataBound">
                                         <ItemTemplate>
                                            <table style="width: 280px" dir="rtl" align="center">
                                                <tr>
                                                    <td>
                                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("Pic_Group")%>' AlternateText=''
                                                            Height="140px" Width="120px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span style="font-size: x-small; color: #666666">نام گروه:</span><asp:Label ID="Label7"
                                                            runat="server" Text='<%#Eval("Name_Group") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span style="font-size: x-small; color: #666666">موضوع:</span><asp:Label ID="Label8"
                                                            runat="server" Text='<%#Eval("Topic_Group") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span style="font-size: x-small; color: #666666">تاریخ ایجاد:</span><asp:Label ID="Label_Date_Maked"
                                                            runat="server" Text='<%#Eval("Date_Create") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span style="font-size: x-small; color: #666666">توضیحات:</span><asp:Label ID="Label10"
                                                            runat="server" Text='<%#Eval("Discreption_Group") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                        </ItemTemplate>
                                    </asp:DataList>
                                </div>
                            </div>
                        </asp:View>
                        <asp:View ID="View_Joined_Group" runat="server">
                            <asp:SqlDataSource ID="SqlDataSource_Joined_Group_Section1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                SelectCommand="SELECT  Group_tbl.Name_Group, Group_tbl.Topic_Group, Member_Group_tbl.Date_member, Group_tbl.Discreption_Group, Group_tbl.Pic_Group, Group_tbl.ID,CASE WHEN Group_tbl.Archive='false' THEN 'فعال'  WHEN Group_tbl.Archive='true' THEN 'آرشیو' END AS 'State' FROM Member_Group_tbl INNER JOIN Group_tbl ON Member_Group_tbl.ID_Group=Group_tbl.ID
WHERE Member_Group_tbl.ID_User = @id
ORDER BY Group_tbl.ID  ASC
">
                                <SelectParameters>
                                    <asp:SessionParameter Name="id" SessionField="id_user" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <div style="font-family: tahoma, arial; font-size: small; vertical-align: top; width: 874px;">
                                <div style="max-width: 874px; width: 750px; direction: rtl; position: relative; text-align: center;
                                    top: 0px; right: 0px; float: right;" align="center" dir="rtl">
                                    <asp:DataList ID="DataList_Joined_Group" runat="server" DataSourceID="SqlDataSource_Joined_Group_Section1" CellPadding="5" OnItemDataBound="DataList_Joined_Group_ItemDataBound" RepeatColumns="3">
                                        <ItemTemplate>
                                            <table style="width: 280px" dir="rtl" align="center">
                                                <tr>
                                                    <td>
                                                        <a href="User_Show_Group.aspx?id=<%#Eval("ID")%>&mode=Gap">
                                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("Pic_Group")%>' AlternateText='برای مشاهده اعضای گروه و بحث و گفتگو کلیک کنید.'
                                                                Height="140px" Width="120px" />
                                                        </a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span style="font-size: x-small; color: #666666">نام گروه:</span><asp:Label ID="Label7"
                                                            runat="server" Text='<%#Eval("Name_Group") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span style="font-size: x-small; color: #666666">موضوع:</span><asp:Label ID="Label8"
                                                            runat="server" Text='<%#Eval("Topic_Group") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span style="font-size: x-small; color: #666666">تاریخ عضویت:</span><asp:Label ID="Label_Date_Join"
                                                            runat="server" Text='<%#Eval("Date_member") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                 <tr>
                                                    <td>
                                                        <span style="font-size: x-small; color: #666666">وضعیت گروه:</span><asp:Label ID="Label1"
                                                            runat="server" Text='<%#Eval("State") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span style="font-size: x-small; color: #666666">توضیحات:</span><asp:Label ID="Label10"
                                                            runat="server" Text='<%#Eval("Discreption_Group") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                        </ItemTemplate>
                                    </asp:DataList>
                                </div>
                            </div>
                        </asp:View>
                    </asp:MultiView>
                </div>
            </asp:View>
            <asp:View ID="View_Create_Group" runat="server">
                <div style="font-family: tahoma, arial; font-size: small; vertical-align: top; width: 874px;">
                    <table style="width: 100%;" dir="rtl">
                        <tr>
                            <td colspan="4">
                                <span style="color: red">*</span><span style="color: white"> در این قسمت از سایت می
                                    توانید با وارد کردن اطلاعات خواسته شده ، یک گروه ایجاد کنید.</span>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <hr style="background-color: #2C3E5B" />
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="border-style: 1; border-width: thin; border-color: #FFFFFF;">
                                &nbsp; نام گروه :
                            </td>
                            <td style="border-style: 1; border-width: thin; border-color: #FFFFFF;" colspan="3">
                                <asp:TextBox ID="RadTextBox_NameGroup" runat="server" ValidationGroup="CreateGroup"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="RadTextBox_NameGroup" ErrorMessage="*" Font-Size="Medium" ForeColor="Red" ValidationGroup="CreateGroup"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="border-style: 1; border-width: thin; border-color: #FFFFFF;">
                                &nbsp;موضوع گروه :
                            </td>
                            <td style="border-style: 1; border-width: thin; border-color: #FFFFFF;" colspan="3">
                                <asp:DropDownList ID="DropDownList_Topic_Group" runat="server" DataSourceID="SqlDataSource_Topic_Group"
                                    DataTextField="Topic_Group" DataValueField="ID" Font-Names="Tahoma" Width="150px">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource_Topic_Group" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                    SelectCommand="SELECT [ID], [Topic_Group] FROM [Topic_Group_tbl]"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="border-style: 1; border-width: thin; border-color: #FFFFFF;">
                                توضیحات:
                            </td>
                            <td style="border-style: 1; border-width: thin; border-color: #FFFFFF;" colspan="3">
                                <asp:TextBox ID="TextBox_Description_Group" runat="server" Height="150px" TextMode="MultiLine"
                                    Width="300px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" colspan="4" style="border-style: 1; border-width: thin; border-color: #FFFFFF;">
                                <hr style="background-color: #2C3E5B" />
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="border-style: 1; border-width: thin; border-color: #FFFFFF;">
                                آدرس پست الکترونیک :
                            </td>
                            <td colspan="3" style="border-style: 1; border-width: thin; border-color: #FFFFFF;">
                                <asp:TextBox ID="TextBox_Email" runat="server" AutoCompleteType="Email" Width="350px" ValidationGroup="CreateGroup"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox_Email" EnableTheming="True" ErrorMessage="لطفا در وارد کردن آدرس ایمیل دقت فرمایید." ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="4" dir="rtl" style="border-style: 1; border-width: thin;
                                border-color: #FFFFFF;">
                                <hr style="background-color: #2C3E5B" />
                                <p>
                                    <span style="color: red">*</span>برای ثبت گروه و ورود به بخش مدیریتی گروه بایستی
                                    نام کاربری و&nbsp; رمز عبور را تعیین کنید.</p>
                                <hr style="background-color: #2C3E5B" />
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="border-style: 1; border-width: thin; border-color: #FFFFFF;">
                                نام کاربری:
                            </td>
                            <td colspan="3" style="border-style: 1; border-width: thin; border-color: #FFFFFF;">
                                <asp:TextBox ID="TextBox_Account_Name" runat="server" ValidationGroup="CreateGroup"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox_Account_Name" ErrorMessage="لطفا نام کاربری را وارد کنید." Font-Size="Small" ForeColor="Red" ValidationGroup="CreateGroup"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="border-style: 1; border-width: thin; border-color: #FFFFFF;">
                                رمز عبور :
                            </td>
                            <td style="border-style: 1; border-width: thin; border-color: #FFFFFF;">
                                <asp:TextBox ID="TextBox_Password" runat="server" TextMode="Password" ValidationGroup="CreateGroup"></asp:TextBox>
                            </td>
                            <td align="left" style="border-style: 1; border-width: thin; border-color: #FFFFFF;">
                                تکرار رمز عبور:
                            </td>
                            <td style="border-style: 1; border-width: thin; border-color: #FFFFFF;">
                                <asp:TextBox ID="TextBox_Confirm_password" runat="server" TextMode="Password" ValidationGroup="CreateGroup"></asp:TextBox>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox_Confirm_password"
                                    ControlToValidate="TextBox_Password" ErrorMessage="*لطفا در وارد کردن رمز عبور دقت فرمایید."
                                    Font-Names="Tahoma" Font-Size="Small" ValidationGroup="a" ForeColor="Red"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <hr style="background-color: #2C3E5B" />
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="4">
                                &nbsp;
                                <asp:Button ID="Button_Create_Group" runat="server" Font-Names="Tahoma" OnClick="Button_Create_Group_Click"
                                    Text="ایجاد گروه" ValidationGroup="CreateGroup" />
                                <asp:Button ID="Button_Cancel_Group" runat="server" Font-Names="Tahoma" OnClick="Button_Cancel_Group_Click"
                                    Text="انصراف" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <hr style="background-color: #2C3E5B" />
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="4">
                                &nbsp;
                                <asp:Literal ID="Literal_State_Group" runat="server"></asp:Literal>
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
