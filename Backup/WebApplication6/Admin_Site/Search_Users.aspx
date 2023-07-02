<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Site/Admin.Master" AutoEventWireup="true" CodeBehind="Search_Users.aspx.cs" Inherits="WebApplication6.Admin_Site.Search_Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            color: #FFFFFF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="mainContent" dir="rtl">
<p dir="rtl">
مدیر گرامی در این بخش شما می توانید کاربرانی را که به عضویت این سایت در آمده اند را جستجو و مشاهده کنید.
</p>
                <hr style="background-color: #2C3E5B" />

    <table style="width: 500px; direction:rtl; font-family: tahoma, arial;" 
        align="center">
        <tr>
            <td align="left" class="style1">
                نام:</td>
           
            <td>
                <asp:TextBox ID="TextBox_name" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="left" class="style1">
                نام خانوادگی:</td>
           
            <td>
                <asp:TextBox ID="TextBox_family" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="left" class="style1">
                نام کاربری:</td>
        
            <td>
                <asp:TextBox ID="TextBox_name_Account" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="left" class="style1">
                محل زندگی:</td>
        
            <td>
                <asp:TextBox ID="TextBox_City_Live" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="left" class="style1">
                جنسیت:</td>
        
            <td>
                <asp:DropDownList ID="DropDownList_Gender" runat="server">
                    <asp:ListItem Value="-1">تعیین نشده</asp:ListItem>
                    <asp:ListItem Value="0">مرد</asp:ListItem>
                    <asp:ListItem Value="1">زن</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="left" class="style1">
                تاریخ عضویت:</td>
        
            <td>
                <asp:TextBox ID="TextBox_Date_Member1" runat="server" Columns="10" 
                    MaxLength="10" Width="80px"></asp:TextBox>
&nbsp;تا
                <asp:TextBox ID="TextBox_Date_Member2" runat="server" Columns="10" 
                    MaxLength="10" Width="80px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center" class="style1" colspan="2">
                <asp:Button ID="Button_Search" runat="server" Font-Names="Tahoma" 
                    Text="جستجو" onclick="Button_Search_Click"  />
            </td>
        
        </tr>
    </table>
                    <hr style="background-color: #2C3E5B" />

    <asp:GridView ID="GridView_Result" runat="server" CellPadding="4" 
        ForeColor="#333333" GridLines="None" Width="750px" 
        AutoGenerateColumns="False" onrowdatabound="GridView_Result_RowDataBound">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="شناسه" SortExpression="ID" />
            <asp:ImageField DataImageUrlField="User_pic" HeaderText="عکس" 
                SortExpression="User_pic" NullImageUrl="~/Admin_Site/Image/no_image.png">
                <ControlStyle Height="100px" Width="80px" />
            </asp:ImageField>
            <asp:BoundField DataField="Name" HeaderText="نام" SortExpression="Name" />
            <asp:BoundField DataField="Family" HeaderText="نام خانوادگی" 
                SortExpression="Family" />
            <asp:BoundField DataField="Sex_User" HeaderText="جنسیت" 
                SortExpression="Sex_User" />
            <asp:TemplateField HeaderText="تاریخ">
                <ItemTemplate>
                    <asp:Label ID="lbl_date" runat="server" Text='<%# Eval("Date_m") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
</div>
</asp:Content>
