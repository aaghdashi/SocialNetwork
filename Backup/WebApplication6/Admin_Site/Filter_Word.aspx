<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Site/Admin.Master" AutoEventWireup="true"
    CodeBehind="Filter_Word.aspx.cs" Inherits="WebApplication6.Admin_Site.Filter_Word" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        li
        {
            display: inline;
            list-style-type: none;
            border: 0;
            list-style-position: inside;
            margin-top: 5px;
            margin-left: 8px;
            direction: rtl;
            border-style: none;
            outline-style: none;
            padding: 2px 5px 0px 5px font-style: oblique;
            color: #115199;
            cursor: auto;
            text-align: center;
            vertical-align: text-top;
            bottom: 2px;
            cursor: pointer;
        }
        li:hover
        {
            cursor: pointer;
            font-size: medium;
            color: White;
        }
        .link
        {
            border-style: none;
            outline-color: none;
            vertical-align: text-top;
            font-size: larger;
            font-family: Tahoma,Arial;
            text-decoration: none;
            text-transform: none;
            cursor: pointer;
            color: Gray;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="mainContent">
        <p style="color: White; text-align: right" dir="rtl">
            <span style="color: red">*</span>مدیر گرامی شما در این بخش می توانید کلمات غیر اخلاقی
            را مشخص نمایید و از نمایش و انتشار آن در صحفات مختلف سایت جلوگیری نمایید.
        </p>
        <hr style="background-color: #2C3E5B" />
        <div dir="rtl" align="center">
            <ul>
                <li>
                    <asp:LinkButton ID="LinkButton_Show" runat="server" CssClass="link" OnClick="LinkButton_Show_Click">نمایش</asp:LinkButton></li>
                <li>
                    <asp:LinkButton ID="LinkButton_Insert" runat="server" CssClass="link" OnClick="LinkButton_Insert_Click">درج</asp:LinkButton></li>
                <li>
                    <asp:LinkButton ID="LinkButton_Edit" runat="server" CssClass="link" OnClick="LinkButton_Edit_Click">حذف و ویرایش</asp:LinkButton></li>
            </ul>
        </div>
        <div dir="rtl" style="text-align: right">
            <asp:MultiView ID="MultiView_Filter_Word" runat="server">
                <asp:View ID="View_Show_Word" runat="server">
                    <div dir="rtl" style="text-align: center">
                        <p style="color: White; text-align: right" dir="rtl">
                            <span style="color: red">*</span>مدیر گرامی شما در این بخش می توانید کلمات غیر اخلاقی
                            را که مشخص نموده اید را مشاهده کنید.
                        </p>
                        <hr style="background-color: #2C3E5B; height: -12px;" />
                        <asp:Panel ID="Panel_Show_Word" runat="server" style="color: #FFFFFF">
                            <asp:Repeater ID="Repeater_Show_Word" runat="server">
                                <HeaderTemplate>
                                    <p style="color:Gray;font-size:small ">
                                    لیست کلمات مشخص شده 
                                    </p>
                                    <hr style="background-color: #2C3E5B" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Literal ID="Literal_Show_Word" runat="server" Text='<%#Eval("Key_Word") %>'></asp:Literal>
                                    &nbsp;  &nbsp;,
                                </ItemTemplate>
                            </asp:Repeater>
                        </asp:Panel>
                        <asp:SqlDataSource ID="SqlDataSource_Show_Word" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                            SelectCommand="SELECT Key_Word, ID FROM Filter_Word_tbl" 
                            UpdateCommand="UPDATE Filter_Word_tbl SET Key_Word = @Key
WHERE ID=@ID" DeleteCommand="DELETE FROM Filter_Word_tbl WHERE (ID = @ID)">
                            <DeleteParameters>
                                <asp:Parameter Name="ID" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Key" />
                                <asp:Parameter Name="ID" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </div>
                </asp:View>
                <asp:View ID="View_Insert_Word" runat="server">
                    <div dir="rtl" style="text-align: right">
                        <p style="color: White; text-align: right" dir="rtl">
                            <span style="color: red">*</span>مدیر گرامی شما در این بخش می توانید کلمات غیر اخلاقی
                            را که مد نظر دارید را مشاهده کنید.
                        </p>
                        <hr style="background-color: #2C3E5B" />
                        <table style="width: 100%;">
                            <tr>
                                <td colspan="2">
                                    &nbsp; مدیر گرامی در قسمت پایین بایستی ابتدا کلمه مورد نظر را وارد نموده و سپس بر روی 
                                    دکمه درج کلیک نمایید،کلمات مشخص شده با حروف (****)جایگزین خواهند شد.</td>
                            </tr>
                            <tr>
                                <td align="left" dir="rtl" width="50%">
                                    کلمه مورد خود را وارد کنید:</td>
                                <td width="50%">
                                    &nbsp;<asp:TextBox ID="TextBox_Word" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <asp:Button ID="Button_Insert" runat="server" Font-Names="B Tahoma" 
                                        onclick="Button_Insert_Click" Text="اضافه شود" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <asp:Literal ID="Literal_Add_Word" runat="server"></asp:Literal>
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:View>
                <asp:View ID="View_Edit_Word" runat="server">
                    <div dir="rtl" style="text-align: right">
                        <p style="color: White; text-align: right" dir="rtl">
                            <span style="color: red">*</span>مدیر گرامی شما در این بخش می توانید کلمات غیر اخلاقی
                            را که مشخص نموده اید را ویرایش کنید.
                        </p>
                        <hr style="background-color: #2C3E5B" />
                        <table style="width: 100%;">
                            <tr>
                                <td align="right" dir="rtl">
                                    &nbsp; * کاربر گرامی برای ویراش کلمه مورد نظر خود بر روی دکمه ویرایش و برای حذف آن بر 
                                    روی دکمه مورد نظر خود کلیک کنید.</td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                                        AutoGenerateColumns="False" CellPadding="4" 
                                        DataSourceID="SqlDataSource_Show_Word" ForeColor="#333333" 
                                        GridLines="None" DataKeyNames="ID" PageSize="8" 
                                        EmptyDataText="هیچ کلمه ای درج نشده است." Width="300px">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:CommandField CancelText="انصراف" DeleteText="حذف" EditText="ویرایش" 
                                                ShowDeleteButton="True" ShowEditButton="True" UpdateText="ثبت" />
                                            <asp:BoundField DataField="Key_Word" 
                                                SortExpression="Key_Word" />
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
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:View>
            </asp:MultiView>
        </div>
    </div>
</asp:Content>
