<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login_Admin.aspx.cs" Inherits="WebApplication6.Admin_Site.Login_Admin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body bgcolor="#2d3e5c" dir="rtl" style="text-align: center; vertical-align: middle" >
    <form id="form1" runat="server">
    <div style="font-family: tahoma, arial; vertical-align: middle; text-align: center;" align="center">
    <div style="font-family: tahoma, arial; vertical-align: middle; position: relative; width: 750px; height: 400px; float: right; text-align: center;">
        <table style="width: 960px;margin-left:auto; margin-right:auto" align="center">
            <tr>
                <td rowspan="3">
                    <img alt="" src="Image/Admin_user.png" align="left" /></td>
                <td dir="rtl" style="color: #FFFFFF"> <marquee behavior="alternate" scrollamount="4"><p style="font-size: small; font-family: tahoma">ورود به بخش مدیریتی سایت فقط برای مدیر سایت امکان پذیر می باشد.</p></marquee>
                   </td>
            </tr>
            <tr>
                <td align="right" dir="ltr">
                    <div style="background-image: url('Image/Back_login_admin.png'); background-repeat: no-repeat; width: 300px; height: 200px;" 
                        align="right">
                        <table dir="rtl" style="width: 300px; height: 200px;">
                            <tr>
                                <td width="100">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="color: #FFFFFF; font-size: x-small;" width="100">
                                    نام کاربری :</td>
                                <td align="right">
                                    <asp:TextBox ID="TextBox_Account_Name" runat="server" Width="150px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="color: #FFFFFF; font-size: x-small;" width="100">
                                    رمز عبور :</td>
                                <td align="right">
                                    <asp:TextBox ID="TextBox_Password" runat="server" TextMode="Password" 
                                        Width="150px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" dir="rtl">
                                    <asp:Button ID="Button_Login_Admin" runat="server" Font-Names="Tahoma" Text="ورود به بخش مدیریتی سایت" 
                                        onclick="Button_Login_Admin_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <asp:Button ID="Button_Return_mainpage" runat="server" Font-Names="Tahoma" 
                                        onclick="Button_Return_mainpage_Click" Text="بازگشت به صحفه اصلی سایت" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" dir="rtl">
                                    <asp:Literal ID="Literal_Login_Admin" runat="server"></asp:Literal>
                                </td>
                            </tr>
                        </table>
                    </div></td>

            </tr>
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        </div>
    </div>
    </form>
</body>
</html>
