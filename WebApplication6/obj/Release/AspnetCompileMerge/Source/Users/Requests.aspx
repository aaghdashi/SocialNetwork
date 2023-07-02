<%@ Page Title="" Language="C#" MasterPageFile="~/Users/Users_master.Master" AutoEventWireup="true" CodeBehind="Requests.aspx.cs" Inherits="WebApplication6.Users.Requests" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <div class="mainContent" align="center">
        <div style="font-family: tahoma, arial; font-size: small; vertical-align: top; width: 874px;"
            align="center">
            <table style="width: 874px;">
                <tr>
                    <td align="center" style="width: 874px; height: 50px">
                        <asp:ImageButton ID="Img_btn_recicve" runat="server" ImageUrl="~/Users/images/back.gif" ToolTip="درخواست های ارسالی"
                            AlternateText="درخواست های ارسالی" Height="48px" Width="48px" OnClick="Img_btn_recicve_Click"  />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="Img_btn_send" runat="server" ImageUrl="~/Users/images/go.gif" ToolTip="درخواست های رسیده"
                        AlternateText="درخواست های رسیده" Height="48px" Width="48px" OnClick="Img_btn_send_Click"  />
                </tr>
            </table>
            </div>
            <br />

            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

            <asp:MultiView ID="MultiView_Request" runat="server" ActiveViewIndex="0">
                <asp:View ID="View_receive" runat="server">
                   
                    <p style="direction: rtl">کاربر گرامی در این بخش درخواست های کاربران برای دوستی را می توانید تایید کنید ، در غیر این صورت می توانید آن را لغو کنید.</p>
                    <br />
                     <hr style="background-color: #2C3E5B" />
                     <p dir="rtl" align="center" style="font-family: tahoma, arial; font-size: small; color: #FF0000; vertical-align: middle; text-align: center">
                                «درخواست های دریافتی»
                            </p>
                    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource_Request" RepeatColumns="2" CellPadding="5" CellSpacing="5" HorizontalAlign="Justify" >
                        
                        <ItemTemplate>

                          

                            <table style="width: 420px; height: 150px; background-color: #CFD6E5" align="center" dir="rtl">
                                <tr>
                                    <td rowspan="5" align="center">
                                        <table style="width: 420px;" align="center">
                                            <tr>
                                                <td rowspan="5" style="text-align: right" width="150px">
                                                    <a href="./User_info.aspx?id=<%#Eval("ID")%>">
                                                        <asp:Image ID="Image_user" CssClass="imagep" runat="server" ImageUrl='<%#Eval("User_pic")%>' AlternateText='<%#Eval("Account_name") %>'
                                                            Style="border-radius: 10px 10px;" Height="140px" Width="120px" />
                                                    </a>
                                                </td>
                                                <td style="text-align: right">نام:<asp:Label ID="Label4" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right">نام خانوادگی:<asp:Label ID="Label2" runat="server" Text='<%#Eval("Family") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td dir="rtl" align="right" style="text-align: right; max-width: 360px" width="360px">نام کاربری:<asp:Label ID="Label3" runat="server" Text='<%#Eval("Account_name") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            
                                            <tr>
                                                <td dir="rtl" align="right" style="text-align: right; max-width: 360px" width="360px">ایمیل:<asp:Label ID="Label5" runat="server" Text='<%#Eval("E_mail") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td dir="rtl" align="right" style="text-align: right; max-width: 180px" width="180px"><a href="Requests.aspx?id=<%#Eval("ID") %>&mode=ADD" class="link_style">تایید درخواست&nbsp;&nbsp;</a></asp:Label>
                                                </td> 
                                                <td dir="rtl" align="right" style="text-align: right; max-width: 180px" width="180px"><a href="Requests.aspx?id=<%#Eval("ID") %>&mode=DELETE" class="link_style">لغو درخواست&nbsp;&nbsp;</a></td>
                                            </tr>
                                        </table>
                                    </td>

                                </tr>


                            </table>
                            
                        </ItemTemplate>

                       
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource_Request" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT User_tbl.Name, User_tbl.Family, User_tbl.Account_name, User_tbl.Birth_date, User_tbl.E_mail, User_tbl.User_pic, User_tbl.ID FROM User_tbl INNER JOIN Request_Friend_tbl ON Request_Friend_tbl.Response_User_ID = User_tbl.ID  WHERE (Request_Friend_tbl.Response_User_ID = @id)  AND
Request_Friend_tbl.Flag='false'
UNION
SELECT DISTINCT User_tbl.Name, User_tbl.Family, User_tbl.Account_name, User_tbl.Birth_date, User_tbl.E_mail, User_tbl.User_pic, User_tbl.ID FROM User_tbl INNER JOIN Request_Friend_tbl ON Request_Friend_tbl.Request_User_ID = User_tbl.ID  WHERE (Request_Friend_tbl.Response_User_ID = @id)  AND
Request_Friend_tbl.Flag='false'">
                        <SelectParameters>
                            <asp:SessionParameter Name="id" SessionField="id_user" />
                        </SelectParameters>
                    </asp:SqlDataSource>
        </div>

        </asp:View>
            <asp:View ID="View_send" runat="server">
                 <p style="direction: rtl">کاربر گرامی در این بخش درخواست های کاربران برای دوستی را می توانید تایید کنید ، در غیر این صورت می توانید آن را لغو کنید.</p>
                    <br />
                    <hr />
                  <HeaderTemplate>
                          <p dir="rtl" align="center" style="font-family: tahoma, arial; font-size: small; color: #FF0000; vertical-align: middle; text-align: center">
                                «درخواست های ارسالی»
                            </p>
                        </HeaderTemplate>
<asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource_send" RepeatColumns="2"  CellPadding="5" CellSpacing="5" HorizontalAlign="Justify">
                        

                        <ItemTemplate>

                          

                            <table style="width: 420px; height: 150px;  background-color: #CFD6E5" align="center" dir="rtl">
                                <tr>
                                    <td rowspan="5" align="center">
                                        <table style="width: 420px;" align="center">
                                            <tr>
                                                <td rowspan="5" style="text-align: right" width="150px">
                                                    <a href="./User_info.aspx?id=<%#Eval("ID")%>">
                                                        <asp:Image ID="Image_user" runat="server" CssClass="imagep"  ImageUrl='<%#Eval("User_pic")%>' AlternateText='<%#Eval("Account_name") %>'
                                                            Style="border-radius: 10px 10px;" Height="140px" Width="120px" />
                                                    </a>
                                                </td>
                                                <td style="text-align: right">نام:<asp:Label ID="Label4" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right">نام خانوادگی:<asp:Label ID="Label2" runat="server" Text='<%#Eval("Family") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td dir="rtl" align="right" style="text-align: right; max-width: 360px" width="360px">نام کاربری:<asp:Label ID="Label3" runat="server" Text='<%#Eval("Account_name") %>'></asp:Label>
                                                </td>
                                            </tr>
                                           
                                            <tr>
                                                <td dir="rtl" align="right" style="text-align: right; max-width: 360px" width="360px">ایمیل:<asp:Label ID="Label5" runat="server" Text='<%#Eval("E_mail") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td dir="rtl" align="right" style="text-align: right; max-width: 360px" width="180px"><a href="Requests.aspx?id=<%#Eval("ID") %>&mode=DELETE_req" class="link_style">لغو درخواست ارسالی&nbsp;&nbsp;</a></asp:Label>
                                                </td> 
                                                
                                            </tr>
                                        </table>
                                    </td>

                                </tr>


                            </table>
                            
                        </ItemTemplate>
                        <SeparatorStyle BackColor="#CCCCFF" />
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource_send" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT User_tbl.Name, User_tbl.Family, User_tbl.Account_name, User_tbl.Birth_date, User_tbl.E_mail, User_tbl.User_pic, User_tbl.ID FROM User_tbl INNER JOIN Request_Friend_tbl ON Request_Friend_tbl.Response_User_ID = User_tbl.ID  WHERE (Request_Friend_tbl.Request_User_ID = @id)  AND
Request_Friend_tbl.Flag='false'
UNION
SELECT DISTINCT User_tbl.Name, User_tbl.Family, User_tbl.Account_name, User_tbl.Birth_date, User_tbl.E_mail, User_tbl.User_pic, User_tbl.ID FROM User_tbl INNER JOIN Request_Friend_tbl ON Request_Friend_tbl.Request_User_ID = User_tbl.ID  WHERE (Request_Friend_tbl.Request_User_ID = @id)  AND
Request_Friend_tbl.Flag='false'">
                        <SelectParameters>
                            <asp:SessionParameter Name="id" SessionField="id_user" />
                        </SelectParameters>
                    </asp:SqlDataSource>
        </div>
            </asp:View>
        </asp:MultiView>
    </div>

  
</asp:Content>
