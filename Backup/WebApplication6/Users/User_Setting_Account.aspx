<%@ Page Title="" Language="C#" MasterPageFile="~/Users/Users_master.Master" AutoEventWireup="true"
    CodeBehind="User_Setting_Account.aspx.cs" Inherits="WebApplication6.Users.WebForm10" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
    </telerik:RadScriptManager>
    <div class="mainContent">
        <asp:MultiView ID="MultiView_Setting" runat="server" ActiveViewIndex="0">
            <asp:View ID="View_Access_User" runat="server">
                <p dir="rtl">
                    <span style="color: red">*</span> کاربر گرامی شما در این بخش از سایت می توانید به
                    دوستان و گروه هایی که در آن عضو هستید ، مجوز دسترسی به اطلاعات و
                </p>
                <p dir="rtl">
                    صحفات خود را بدهید؛ در دادن مجوز ها دقت فرمایید.</p>
                <div class="File_Content">
                    <hr style="background-color: #2C3E5B" />
                    <table style="width: 100%;">
                        <tr>
                            <td align="right" height="60" dir="rtl">
                                <br />
                                <asp:CheckBox ID="CheckBox_Users_Permission" runat="server" 
                                    Text="اجازه دسترسی به کاربران " />
                                <p style="font-size: x-small">
                                    <span style="color: red">*</span> با دادن این مجوز به کاربران که دوست شما نیستند 
                                    این امکان را به آنها می دهید که به اطلاعات شما دسترسی داشته باشند.</p>
                                <hr style="background-color: #2C3E5B" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" height="60" dir="rtl">
                                <br />
                                <asp:CheckBox ID="CheckBox_Friends_Permission" runat="server" 
                                    Text="اجازه دسترسی به دوستان " />
                                <p style="font-size: x-small">
                                    <span style="color: red">*</span> با دادن این مجوز به کاربران که دوست شما هستند 
                                    این امکان را به آنها می دهید که به اطلاعات شما دسترسی داشته باشند.</p>
                                <hr style="background-color: #2C3E5B" />
                            </td>
                        </tr>
                        <tr>
                            <td height="60" align="center" dir="rtl">
                                &nbsp; &nbsp;<asp:Button ID="btn_Submit_Permission" runat="server" Font-Names="Tahoma" 
                                    OnClick="btn_Submit_Permission_Click" Text="ثبت تغییرات" />
                                <asp:Button ID="btn_Cancel_Permission" runat="server" Font-Names="Tahoma" 
                                    OnClick="btn_Cancel_Permission_Click" Text="لغو تغییرات" />
                                <br />
                                <asp:Literal ID="Literal_permission" runat="server"></asp:Literal>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="2" dir="rtl">
                                <hr style="background-color: #2C3E5B" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" dir="rtl">
                                <span style="color: red">*</span> برای تغییر رمز عبور ، ابتدا رمز قبلی خود را وارد
                                کرده و سپس رمز جدید و تکرار آن را وارد کنید.
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" dir="rtl">
                                <hr style="background-color: #2C3E5B" />
                            </td>
                        </tr>
                        <tr>
                            <td dir="rtl" bgcolor="#8F98A6">
                                <telerik:RadTextBox ID="RadTextBox_Old_Password" runat="server" 
                                    EmptyMessage="رمز عبور قبلی" TextMode="Password">
                                </telerik:RadTextBox>
                            </td>
                            <td dir="rtl" align="left" bgcolor="#8F98A6">
                                رمزعبور قبلی:
                            </td>
                        </tr>
                        <tr>
                            <td dir="rtl" style="height: 26px" bgcolor="#8F98A6">
                                <telerik:RadTextBox ID="RadTextBox_New_Password" runat="server" 
                                    EmptyMessage="رمز عبور جدید" TextMode="Password">
                                </telerik:RadTextBox>
                            </td>
                            <td dir="rtl" align="left" style="height: 26px" bgcolor="#8F98A6">
                                &nbsp; رمز عبور جدید:
                            </td>
                        </tr>
                        <tr>
                            <td dir="rtl" bgcolor="#8F98A6">
                                <telerik:RadTextBox ID="RadTextBox_Confirm_New_Password" runat="server" 
                                    EmptyMessage="تکرا رمز عبور جدید" TextMode="Password">
                                </telerik:RadTextBox>
                            </td>
                            <td dir="rtl" align="left" bgcolor="#8F98A6">
                                تکرا رمز عبور جدید:
                            </td>
                        </tr>
                        <tr>
                            <td dir="rtl" colspan="2">
                                <hr style="background-color: #2C3E5B" />
                            </td>
                        </tr>
                        <tr>
                            <td dir="rtl" align="center" colspan="2">
                                &nbsp;<asp:Button ID="btn_Submit_Change_Password" runat="server" Font-Names="Tahoma" OnClick="btn_Submit_Change_Password_Click"
                                    Text="ثبت تغییرات" />
                                &nbsp;<asp:Button ID="btn_Cancel_Change_PassWord" runat="server" Font-Names="Tahoma" Text="انصراف"
                                    OnClick="btn_Cancel_Change_PassWord_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" dir="rtl" align="center">
                                <hr style="background-color: #2C3E5B" />
                                <asp:Literal ID="Literal_password" runat="server"></asp:Literal>
                            </td>
                        </tr>
                    </table>
                </div>
                
            </asp:View>
            <br />
        </asp:MultiView>
    </div>
</asp:Content>
