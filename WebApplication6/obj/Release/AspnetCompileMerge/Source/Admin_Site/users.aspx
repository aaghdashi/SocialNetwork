<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Site/Admin.Master" AutoEventWireup="true"
    CodeBehind="users.aspx.cs" Inherits="WebApplication6.Admin_Site.users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            font-size: medium;
        }
        .style2
        {
            font-size: medium;
            color: white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="mainContent">
        <asp:SqlDataSource ID="SqlDataSource_users" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT Account_name, E_mail, Name + '  ' + Family AS user_name, ID, User_pic, City_live FROM User_tbl">
        </asp:SqlDataSource>
        <asp:MultiView ID="MultiView_users" runat="server" ActiveViewIndex="0">
            <asp:View ID="View_Show" runat="server">
                <div class="mainContent_message">
                    <asp:Panel ID="Panel_users" runat="server" ScrollBars="Vertical" Height="600px">
                        <asp:Repeater ID="Repeater_users" runat="server" 
                            DataSourceID="SqlDataSource_users" 
                            onitemdatabound="Repeater_users_ItemDataBound">
                            <HeaderTemplate>
                                <p style="font-family: tahoma, arial; text-align: center; color: #FFFFFF;">
                                    لیست کاربران عضو</p>
                                <hr style="background-color: #2C3E5B" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <table style="width: 250px;" dir="rtl" align="center">
                                    <tr>
                                        <td rowspan="3" style="text-align: right" width="90px">
                                          
                                                <asp:Image ID="Image_user" runat="server" ImageUrl='<%#Eval("User_pic")%>'
                                                    AlternateText="عکس کاربر" Height="120px" Width="90px" />
                                        </td>
                                        <td style="text-align: right">
                                            <span class="style3" style="text-align: right">نام:</span><asp:Label ID="Label_Comment_user_name"
                                                runat="server" Text='<%#Eval("user_name")%>' Font-Names="Tahoma" Font-Size="X-Small"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right">
                                            <span class="style3">نام کاربری:</span><asp:Label ID="Label_Comment_user_accountname"
                                                runat="server" Text='<%#Eval("Account_name")%>' Font-Names="Tahoma" Font-Size="X-Small"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right">
                                            <span class="style3">محل سکونت:</span><asp:Label ID="Label1" runat="server" Text='<%#Eval("City_live")%>'
                                                Font-Names="Tahoma" Font-Size="X-Small"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right">
                                            <a href="users.aspx?mode=info&mailaddress=<%#Eval("E_mail") %>&id=<%#Eval("ID") %>" class="link_style" dir="rtl"><span class="style3">مشاهده جزئیات</span></a> &nbsp;&nbsp;
                                        </td> 
                                        &nbsp;&nbsp;
                                        <td style="text-align: right">
                                             <a href="users.aspx?mode=contact&mailaddress=<%#Eval("E_mail") %>" class="link_style" dir="rtl"> <span class="style3">ارتباط با ...</span></a>
                                        </td>
                                    </tr>
                                </table>
                                <hr style="background-color: #2C3E5B" />
                                <br />
                            </ItemTemplate>
                        </asp:Repeater>
                    </asp:Panel>
                </div>
            </asp:View>
            <asp:View ID="View_Contact" runat="server">
                <div class="mainContent_message">
                    <table style="width: 100%;" align="right" dir="rtl">
                       
                        <tr>
                            <td align="left" dir="rtl">
                                آدرس پست الکترونیک :
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox_Email_Address" runat="server" Width="300px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox_Email_Address"
                                    ErrorMessage="*" Font-Names="Tahoma" Font-Size="Small" ForeColor="Red" ValidationGroup="mail_validate"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl">
                                عنوان پیام :
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox_Topic_message" runat="server" Width="400px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox_Topic_message"
                                    ErrorMessage="*" Font-Size="Small" ForeColor="Red" ValidationGroup="mail_validate"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl">
                                متن پیام :
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox_Body_Message" runat="server" EnableViewState="False" Height="200px"
                                    TextMode="MultiLine" Width="400px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <asp:ImageButton ID="ImageButton_Send_Email" runat="server" Height="30px" ImageUrl="~/images/NEWsend.png"
                                    OnClick="ImageButton_Send_Email_Click" ValidationGroup="mail_validate" Width="60px" />
                                <br />
                                <asp:Literal ID="Literal_Mail" runat="server"></asp:Literal>
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:View>
            <asp:View ID="View_Info" runat="server">
             <div class="mainContent_message">
                 <table style="width: 100%;" dir="rtl">
                     <tr>
                         <td align="center" class="style2" dir="rtl">
                             مشخصات کاربری</td>
                     </tr>
                     <tr>
                         <td>
                             <asp:Image ID="Image_Info" runat="server" Height="100px" Width="80px" />
                         </td>
                     </tr>
                     <tr>
                         <td>
                             &nbsp;نام:&nbsp;
                             <asp:Label ID="label_name" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             &nbsp;نام خانوادگی: <asp:Label ID="Label_family" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             نام کاربری:<asp:Label ID="Label_Accountname" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             جنسیت:<asp:Label ID="Label_sex" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             تاریخ تولد:<asp:Label ID="Label_date_birth" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             محل تولد:<asp:Label ID="Label_City_birth" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             میزان تحصلات:<asp:Label ID="Label_Education" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             استان:<asp:Label ID="Label_Ostan" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             رشته تحصیلی:<asp:Label ID="Label_Mager" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             دانشگاه محل تحصیل:<asp:Label ID="Label_Univercity" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             وضعیت تحصیلی:<asp:Label ID="Label_State_Education" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             شغل:<asp:Label ID="Label_Job" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             شماره تماس:<asp:Label ID="Label_Tele" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             دین:<asp:Label ID="Label_Din" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             محل زندگی:<asp:Label ID="Label_City_Live" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             علاقه مند به :<asp:Label ID="Label_favorites" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             آدرس ایمیل:<asp:Label ID="Label_Email" runat="server" Text="Label" 
                                 ViewStateMode="Enabled"></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             توضیحات:<asp:Label ID="Label_Description" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             <span class="style1">
                             <hr style="background-color: #2C3E5B" />
                             </span>
                         </td>
                     </tr>
                     <tr>
                         <td align="center" style="color: #FFFFFF">
                          <a href="users.aspx?mode=contact" class="link_style" dir="rtl">برقراری ارتباط از طریق ایمیل&nbsp;&nbsp;</a>
                         </td>
                         
                     </tr>
                 </table>
             </div>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
