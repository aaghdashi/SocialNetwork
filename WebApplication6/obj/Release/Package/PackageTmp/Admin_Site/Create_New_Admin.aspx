<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Site/Admin.Master" AutoEventWireup="true" CodeBehind="Create_New_Admin.aspx.cs" Inherits="WebApplication6.Admin_Site.Create_New_Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            color: #FF0000;
        }
        .style2
        {
            color: #666666;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="mainContent" dir="rtl">

    <table style="width:100%;">
        <tr>
            <td colspan="4">
                <p style="color: #FFFFFF">
                    <span class="style2">مدیر گرامی در این قسمت از سایت میتوانید اطلاعات خود را ویرایش کنید.
                    </span>
                    <br />
                    <br />
                    <span class="style1">*</span> کاربر گرامی لطفا در وارد کردن اطلاعات دقت کنید.<br />
                    <br />
                    <span class="style1">*</span> مدیر گرامی برای برقراری ارتباط با کاربران از طریق 
                    ایمیل بایستی از آدرس ایمیل معتبر استفاده شود ، در غیر این صورت امکان ارسال ایمیل 
                    به کاربر مورد نظر وجو ندارد.</p>
                <hr style="background-color: #2C3E5B" />
               </td>
        </tr>
        <tr>
            <td align="left">
                نام :</td>
            <td>
                <asp:TextBox ID="TextBox_Name" runat="server" AutoCompleteType="FirstName"></asp:TextBox>
            </td>
            <td align="left">
                نام خانوادگی :</td>
            <td>
                <asp:TextBox ID="TextBox_Family" runat="server" AutoCompleteType="LastName"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="left">
                نام کاربری :</td>
            <td>
                <asp:TextBox ID="TextBox_Name_Account" runat="server"></asp:TextBox>
            </td>
            <td align="left">
                رمز عبور :</td>
            <td>
                <asp:TextBox ID="TextBox_Password" runat="server" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="left">
                آدرس ایمیل :</td>
            <td colspan="3">
                <asp:TextBox ID="TextBox_Email" runat="server" Width="300px" 
                    AutoCompleteType="Email"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="left" colspan="4">
                <hr style="background-color: #2C3E5B" />
            </td>
        </tr>
        <tr>
            <td align="left">
                &nbsp;</td>
            <td align="left">
                <asp:Button ID="Button_Add_Admin" runat="server" Font-Names="Tahoma" 
                    Text="ثبت تغییرات" onclick="Button_Add_Admin_Click" />
            </td>
            <td align="right">
                <asp:Button ID="Button_Cancel" runat="server" Font-Names="Tahoma" 
                    Text="انصراف" onclick="Button_Cancel_Click" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td align="left" colspan="4">
                <hr style="background-color: #2C3E5B" />
            </td>
        </tr>
        <tr>
            <td align="left">
                &nbsp;</td>
            <td align="center" colspan="2" dir="rtl">
                <asp:Literal ID="Literal_State_Add_user" runat="server"></asp:Literal>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td align="left" colspan="4">
                &nbsp;</td>
        </tr>
    </table>
<div dir="rtl" align="center">
 </div>
</div>
 
</asp:Content>
