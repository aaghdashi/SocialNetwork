<%@ Page Title="" Language="C#" MasterPageFile="~/Groups/Admins_master.Master" AutoEventWireup="true"
    CodeBehind="Membership_Gruop.aspx.cs" Inherits="WebApplication6.Groups.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="MainContent">
        <div class="File_Content" align="center" dir="rtl">
            <asp:GridView ID="GridView_Member_Group" runat="server" AutoGenerateColumns="False"
                CellPadding="4" DataSourceID="SqlDataSource_member_group" ForeColor="#333333"
                GridLines="None" OnSelectedIndexChanged="GridView_Member_Group_SelectedIndexChanged"
                DataKeyNames="ID" Width="750px" OnRowDataBound="GridView_Member_Group_RowDataBound">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" InsertVisible="False"
                        ReadOnly="True" />
                    <asp:ImageField DataImageUrlField="User_pic" 
                        NullImageUrl="~/Groups/images/no_image.png" HeaderText="عکس">
                        <ControlStyle Height="100px" Width="80px" />
                    </asp:ImageField>
                    <asp:BoundField DataField="نام" HeaderText="نام" SortExpression="نام" />
                    <asp:BoundField DataField="نام خانوادگی" HeaderText="نام خانوادگی" SortExpression="نام خانوادگی" />
                    <asp:TemplateField HeaderText="تاریخ عضویت">
                        <ItemTemplate>
                            <asp:Label ID="lbl_Date" runat="server" Text='<%# Eval("تاریخ عضویت") %>'></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="نام کاربری" HeaderText="نام کاربری" SortExpression="نام کاربری" />
                    <asp:BoundField DataField="جنسیت" HeaderText="جنسیت" ReadOnly="True" SortExpression="جنسیت" />
                    <asp:CommandField SelectText="مشاهده ..." ShowSelectButton="True" />
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
            <asp:SqlDataSource ID="SqlDataSource_member_group" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT User_tbl.ID, User_tbl.Name AS 'نام', User_tbl.Family AS 'نام خانوادگی', Member_Group_tbl.Date_member AS 'تاریخ عضویت', User_tbl.Account_name AS 'نام کاربری', CASE WHEN User_tbl.Sex_User = 1 THEN 'زن' WHEN User_tbl.Sex_User = 0 THEN 'مرد' END AS 'جنسیت', User_tbl.User_pic FROM  User_tbl INNER JOIN Member_Group_tbl ON User_tbl.ID = Member_Group_tbl.ID_User WHERE  Member_Group_tbl.ID_Group=@id">
                <SelectParameters>
                    <asp:SessionParameter Name="id" SessionField="id_group" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
