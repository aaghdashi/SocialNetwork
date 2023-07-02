<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Site/Admin.Master" AutoEventWireup="true"
    CodeBehind="Show_Group.aspx.cs" Inherits="WebApplication6.Admin_Site.Show_Group" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style type="text/css">
        li
        {
            display:inline;
            list-style-type: none;
            border: 0;
            list-style-position: inside;
            margin-top: 5px;
            margin-left: 8px;
            direction: rtl;
            border-style: none;
            outline-style: none;
            padding: 2px 5px 0px 5px ;
            font-style: oblique;
            color:White;
            cursor: auto;
            text-align: center;
            vertical-align: text-top;
            bottom: 2px;
        }
        li:hover
        {
            cursor: pointer;
            font-size: small;
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
            color: White;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="mainContent" align="center" dir="rtl">
<div dir="rtl" align="right">
            <ul>
                <li>
                    <asp:LinkButton ID="LinkButton_Show_Topic" runat="server" CssClass="link" 
                        onclick="LinkButton_Show_Topic_Click" >نمایش موضوعات</asp:LinkButton></li>
                <li>
                    <asp:LinkButton ID="LinkButton_Show_Group" runat="server" CssClass="link" 
                        onclick="LinkButton_Show_Group_Click"> 
                        نمایش گروه های ایجاد شده</asp:LinkButton></li>
            </ul>
        </div>
                                    <hr style="background-color: #2C3E5B" />

        <asp:MultiView ID="MultiView_Group" runat="server" ActiveViewIndex="0">
            <asp:View ID="View_Topic" runat="server">
                <p align="center" dir="rtl" style="color: #FFFFFF">
                    <span dir="rtl" style="color: #FF0000">*</span> مدیر گرامی در این بخش می توانید
                    لیست موضوعات مربوط به گروه ها را مشاهده کرده و آنها را ویرایش و یا موضوع جدیدی را
                    اضافه کنید.
                </p>
                                            <hr style="background-color: #2C3E5B" />
                <br />
                <table style="width: 100%;">
                    <tr>
                        <td colspan="2">
                            &nbsp; مدیر گرامی ابتدا بایستی موضوع جدید را در کادر متن وارد کرده ، سپس بر روی دکمه 
                            درج کلیک کنید.</tr>
                    <tr>
                        
                        <td align="left" dir="rtl">
                            &nbsp; موضوع جدید:</td>
                        <td>
                            <asp:TextBox ID="TextBox_Topic" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        
                        <td align="center" colspan="2">
                            &nbsp;
                            <asp:Button ID="Button_Insert" runat="server" Font-Names="Tahoma" 
                                Font-Size="Small" onclick="Button_Insert_Click" Text="درج" Width="50px" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2">
                            <asp:Literal ID="Literal_Topic" runat="server"></asp:Literal>
                        </td>
                    </tr>
                </table>
                <asp:Panel ID="Panel_Show_Word" runat="server" Style="color: #FFFFFF">
                    <asp:Repeater ID="Repeater_Show_Word" runat="server" 
                        DataSourceID="SqlDataSource_Topic">
                        <HeaderTemplate>
                            <p style="color: Gray; font-size: small" align="center" dir="rtl">
                                لیست موضوعات مشخص شده
                            </p>
                            <hr style="background-color: #2C3E5B" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Literal ID="Literal_Show_Word" runat="server" Text='<%#Eval("Topic_Group") %>'></asp:Literal>
                            &nbsp; &nbsp;,
                        </ItemTemplate>
                    </asp:Repeater>
                                                <hr style="background-color: #2C3E5B" />

                    <asp:SqlDataSource ID="SqlDataSource_Topic" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT ID, Topic_Group FROM Topic_Group_tbl" 
                        UpdateCommand="UPDATE Topic_Group_tbl SET Topic_Group = @TOPIC WHERE (ID = @ID)">
                        <UpdateParameters>
                            <asp:Parameter Name="TOPIC" />
                            <asp:Parameter Name="ID" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:GridView ID="GridView_Topic" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource_Topic" 
                        ForeColor="#333333" GridLines="None" Width="200px">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:CommandField CancelText="انصراف" EditText="ویرایش" ShowEditButton="True" 
                                UpdateText="ثبت" />
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                ReadOnly="True" SortExpression="ID" Visible="False" />
                            <asp:BoundField DataField="Topic_Group" HeaderText="موضوع" 
                                SortExpression="Topic_Group" />
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
                </asp:Panel>
            </asp:View>
            <asp:View ID="View_Show_Group" runat="server">
                <asp:SqlDataSource ID="SqlDataSource_Show_Group" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT  CASE WHEN ID_Creator = User_tbl.ID THEN User_tbl.Name + ' ' + User_tbl.Family END AS 'Admin_Group', Group_tbl.Name_Group, Group_tbl.Topic_Group, Group_tbl.Discreption_Group AS 'Description', Group_tbl.Pic_Group, Group_tbl.ID FROM Group_tbl INNER JOIN User_tbl ON Group_tbl.ID_Creator = User_tbl.ID ORDER BY Group_tbl.ID ASC">
                </asp:SqlDataSource>
                <asp:Panel ID="Panel_Show_Group" runat="server" Direction="RightToLeft" 
                    Height="500px" ScrollBars="Vertical">
                    <asp:Repeater ID="Repeater_Show_Group" runat="server" 
                        DataSourceID="SqlDataSource_Show_Group" 
                        onitemdatabound="Repeater_Show_Group_ItemDataBound">
                        <HeaderTemplate>
                            <p align="center" dir="rtl" style="color: #FFFFFF">
                                لیست گروه های موجود</p>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table style="max-width: 750px" dir="rtl" align="center">
                                <tr>
                                    <td>
                                        <asp:Image ID="Image_Group" runat="server" ImageUrl='<%#Eval("Pic_Group")%>' AlternateText='برای نمایش اعضای گروه بر روی لینک ورد نظر کلیک کنید'
                                            Height="140px" Width="120px" />
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
                                        <span style="font-size: x-small; color: #666666">توضیحات:</span><asp:Label ID="Label10"
                                            runat="server" Text='<%#Eval("Description") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <a href="Show_Group.aspx?id=<%#Eval("ID")%>&mode=member" class="link_style">نمایش اعضای
                                            گروه </a>
                                    </td>
                                </tr>
                            </table>
                                                        <hr style="background-color: #2C3E5B" />

                            <br />
                        </ItemTemplate>
                    </asp:Repeater>
                </asp:Panel>
            </asp:View>
            <asp:View ID="View_Show_Member_Group" runat="server">
                <asp:SqlDataSource ID="SqlDataSource_Show_Member_Group" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT  User_tbl.ID,User_tbl.Name +' ' + User_tbl.Family as 'name_user', Member_Group_tbl.Date_member, User_tbl.Account_name , CASE WHEN User_tbl.Sex_User = 1 THEN 'زن' WHEN User_tbl.Sex_User =0THEN 'مرد' END AS 'Gender',User_tbl.User_pic FROM User_tbl INNER JOIN Member_Group_tbl ON User_tbl.ID = Member_Group_tbl.ID_User INNER JOIN Group_tbl ON Member_Group_tbl.ID_Group = Group_tbl.ID
WHERE Group_tbl.ID=@id   ORDER BY ID  ASC
  ">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="id" QueryStringField="id" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:Panel ID="Panel_Show_Member_Group" runat="server" Direction="RightToLeft" 
                    Height="500px" ScrollBars="Vertical">
                    <asp:Repeater ID="Repeater_Show_Member_Group" runat="server" 
                        DataSourceID="SqlDataSource_Show_Member_Group" 
                        onitemdatabound="Repeater_Show_Member_Group_ItemDataBound">
                        <ItemTemplate>
                            <table dir="rtl" align="center">
                                <tr>
                                    <td>
                                        <asp:Image ID="Image_user" runat="server" ImageUrl='<%#Eval("User_pic")%>' AlternateText='<%#Eval("name_user") %>'
                                            Height="140px" Width="120px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        نام:<asp:Label ID="Label4" runat="server" Text='<%#Eval("name_user") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        نام کاربری:<asp:Label ID="Label2" runat="server" Text='<%#Eval("Account_name") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        جنسیت :<asp:Label ID="Label1" runat="server" Text='<%#Eval("Gender") %>'></asp:Label>
                                    </td>
                                </tr>
                            </table>
                                                        <hr style="background-color: #2C3E5B" />

                        </ItemTemplate>
                    </asp:Repeater>
                </asp:Panel>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
