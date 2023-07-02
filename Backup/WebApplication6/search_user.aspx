<%@ Page Title="" Language="C#" MasterPageFile="~/master_main.Master" AutoEventWireup="true"
    CodeBehind="search_user.aspx.cs" Inherits="WebApplication6.WebForm7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:MultiView ID="MultiView_Search" runat="server" ActiveViewIndex="0">
                <asp:View ID="View_suggest" runat="server">
                    <div style="font-family: Tahoma, Arial; font-size: x-small; width: 960px; position: absolute;
                        background-color: #92C8FF; background-image: url('images/back_search.png'); background-repeat: repeat;"
                        dir="rtl">
                        <asp:SqlDataSource ID="Section1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                            SelectCommand="SELECT  ID, Name, Family, Account_name, Sex_User, E_mail, User_pic FROM User_tbl ORDER BY  ID  ASC">
                        </asp:SqlDataSource>
                        <div style="max-width: 960px; direction: rtl; position: relative; text-align: center;
                            top: 0px; right: 0px; float: right;" align="center" dir="rtl">
                            <asp:Repeater ID="Repeater_Section1" runat="server" DataSourceID="Section1" 
                                onitemdatabound="Repeater_Section1_ItemDataBound">
                                <ItemTemplate>
                                    
                                    <br />
                                    <table style="width: 960px; height: 150px;" align="center" dir="rtl">
                                        <tr>
                                            <td rowspan="2" align="center">
                                                <table style="width: 250px;">
                                                    <tr>
                                                        <td rowspan="3" style="text-align: right" width="90px">
                                                            <a href="./User_info.aspx?id=<%#Eval("ID")%>">
                                                                <asp:Image ID="Image_user" runat="server" ImageUrl='<%#Eval("User_pic")%>' AlternateText='<%#Eval("Account_name") %>'
                                                                    Height="140px" Width="120px" />
                                                            </a>
                                                        </td>
                                                        <td style="text-align: right">
                                                            نام:<asp:Label ID="Label4" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right">
                                                            نام خانوادگی:<asp:Label ID="Label2" runat="server" Text='<%#Eval("Family") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                     <td dir="rtl" align="right" style="text-align: right; max-width: 360px" width="360px">
                                                نام کاربری:<asp:Label ID="Label3" runat="server" Text='<%#Eval("Account_name") %>'></asp:Label>
                                            </td>
                                                </table>
                                            </td>

                                        </tr>
                                       
                                    </table>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </asp:View>
            </asp:MultiView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
