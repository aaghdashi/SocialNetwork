<%@ Page Title="" Language="C#" MasterPageFile="~/Groups/Admins_master.Master" AutoEventWireup="true"
    CodeBehind="Search_member.aspx.cs" Inherits="WebApplication6.Groups.WebForm3" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="MainContent">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <asp:MultiView ID="MultiView_Search_Member" runat="server">
                    <asp:View ID="View_Search" runat="server">
                        <div style="font-family: tahoma, arial; font-size: small; vertical-align: middle;
                            text-align: center; width: 874px; top: 0px; right: 0px" dir="rtl" align="center">
                            <table style="width: 100%;">
                                <tr>
                                    <td align="left" class="style1" style="font-size: small">
                                        نام:
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="TextBox_name" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" class="style1" style="font-size: small">
                                        نام خانوادگی:
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="TextBox_family" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" class="style1" style="font-size: small">
                                        نام کاربری:
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="TextBox_name_Account" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        جنسیت :
                                    </td>
                                    <td align="right">
                                        <asp:DropDownList ID="DropDownList_Gender" runat="server" Font-Names="Tahoma" Width="120px">
                                            <asp:ListItem Value="-1">تعیین نشده</asp:ListItem>
                                            <asp:ListItem Value="0">مرد</asp:ListItem>
                                            <asp:ListItem Value="1">زن</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        محل زندگی :
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="TextBox_City_Live" runat="server" Font-Names="Tahoma" Width="150px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        تاریخ عضویت:
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="TextBox_Member_Date1" runat="server" MaxLength="10" Width="80px"></asp:TextBox>
                                        &nbsp; تا &nbsp;<asp:TextBox ID="TextBox_Member_Date2" runat="server" Columns="10"
                                            MaxLength="10" Width="80px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        سن :
                                    </td>
                                    <td align="right">
                                        <telerik:RadMaskedTextBox ID="TextBox_Age_Date1" runat="server" Columns="3" DisplayMask="##"
                                            Mask="##" NumericRangeAlign="Left" Rows="1" Width="30px"></telerik:RadMaskedTextBox>
                                        &nbsp;تا
                                        <telerik:RadMaskedTextBox ID="TextBox_Age_Date2" runat="server" Columns="3" Mask="##"
                                            NumericRangeAlign="Left" Rows="1" Width="30px"></telerik:RadMaskedTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <asp:ImageButton ID="ImageButton_Search" runat="server" Height="30px" ImageUrl="~/Groups/images/search_G.png"
                                            OnClick="ImageButton_Search_Click" Width="60px" />
                                        <br />
                                        <asp:Literal ID="Literal_Search" runat="server"></asp:Literal>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <asp:GridView ID="Gridview_Search" runat="server" CellPadding="4" ForeColor="#333333"
                                GridLines="None" OnSelectedIndexChanged="Gridview_Search_SelectedIndexChanged"
                                AutoGenerateColumns="False" DataKeyNames="ID" Width="874px" OnRowDataBound="Gridview_Search_RowDataBound">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                                        SortExpression="ID" Visible="False" />
                                    <asp:ImageField DataImageUrlField="User_pic" HeaderText="عکس" 
                                        NullImageUrl="~/Groups/images/no_image.png">
                                        <ControlStyle Height="100px" Width="80px" />
                                    </asp:ImageField>
                                    <asp:BoundField DataField="Name" HeaderText="نام" SortExpression="Name" />
                                    <asp:BoundField DataField="Family" HeaderText="نام خانوادگی" 
                                        SortExpression="Family" />
                                    <asp:TemplateField HeaderText="تاریخ عضویت">
                                        <ItemTemplate>
                                            <asp:Label ID="Label_Date" runat="server" Text='<%# Eval("Date_member") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Account_name" HeaderText="نام کاربری" 
                                        SortExpression="Account_name" />
                                    <asp:BoundField DataField="Gender" HeaderText="جنسیت" ReadOnly="True" 
                                        SortExpression="Gender" />
                                    <asp:CommandField SelectText="لغو عضویت" ShowSelectButton="True" />
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <EmptyDataTemplate>
                                    <asp:Label ID="Label1" runat="server" Text="کاربر مورد نظر یافت نشد."></asp:Label>
                                </EmptyDataTemplate>
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
                    </asp:View>
                </asp:MultiView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
