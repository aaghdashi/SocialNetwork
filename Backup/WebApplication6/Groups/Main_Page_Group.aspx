<%@ Page Title="" Language="C#" MasterPageFile="~/Groups/Admins_master.Master" AutoEventWireup="true"
    CodeBehind="Main_Page_Group.aspx.cs" Inherits="WebApplication6.Groups.Main_Page_Group" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            font-size: x-small;
        }
        .style2
        {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="MainContent">
        <table style="width: 100%;" dir="rtl">
            <tr>
                <td align="right" class="style1">
                    &nbsp;</td>
                <td align="right" width="500">
                    <span class="style2">
                    <br />
                    <br />
                    <br />
                    *</span> کاربر گرامی در صورتی که برای گروه خود عکس انتخاب نکرده اید می توانید با 
                    مراجعه به بخش ویرایش اطلاعات عکس مورد نظر خود را انتخاب کنید.<br />
                    <br />
                    <br />
                    <br />
                    <span class="style2">*</span> برای مشاهده کاربران عضو این گروه می توانید به بخش 
                    اعضای گروه رفته و عملیات مورد نظر خود را انجام دهید.<br />
                    <br />
                    <br />
                    <br />
                    <span class="style2">*</span> برای جستجو&nbsp; کاربر و یا گروه مورد نظر خود می 
                    توانید به بخش جستجو مراجعه فرمایید.<br />
                    <br />
                    <br />
                    <br />
                    <span class="style2">*</span> برای تغییر نام کاربری و یا رمز عبور خود می توانید 
                    به بخش ویرایش اطلاعات مراجعه فرمایید.
                    <br />
                    <br />
                    <br />
                </td>
                <td align="right">
                    &nbsp;</td>
            </tr>
            </table>
    </div>
</asp:Content>
