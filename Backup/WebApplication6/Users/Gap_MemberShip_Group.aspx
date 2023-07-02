<%@ Page Title="" Language="C#" MasterPageFile="~/Users/Users_master.Master" AutoEventWireup="true"
    CodeBehind="Gap_MemberShip_Group.aspx.cs" Inherits="WebApplication6.Users.Gap_MemberShip_Group" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="mainContent">
        <div style="font-family: tahoma, arial; font-size: small; vertical-align: top; width: 750px;
            position: relative;">
            <p align="right" dir="rtl" style="color: #FFFFFF">
                <span style="color: #FF0000">*</span> کاربر گرامی،در اینجا می توانید با درج مطالب
                مورد نظر خود با هم گروهی هایتان به بحث و گفتگو بپردازید.</p>
            <hr style="background-color: #2C3E5B" />
            <div style="max-width: 750px; width: 750px; direction: rtl; position: relative; text-align: center;
                top: 0px; right: 0px; float: right; font-size: small;" align="center" dir="rtl">
                <br />
                <asp:Panel ID="Panel_Gap" runat="server" Direction="RightToLeft" Height="300px" 
                    HorizontalAlign="Center" ScrollBars="Vertical">               
                <asp:Repeater ID="Repeater_Gap_Section1" runat="server" 
                        DataSourceID="SqlDataSource_Gap_Section1" 
                        onitemdatabound="Repeater_Gap_Section1_ItemDataBound">
                    <ItemTemplate>
                        <table>
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
                                    تاریخ عضویت:<asp:Label ID="Label_member_Date" runat="server" Text='<%#Eval("Date_member") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    جنسیت :<asp:Label ID="Label1" runat="server" Text='<%#Eval("Gender") %>'></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <br />
                    </ItemTemplate>
                </asp:Repeater>
                 </asp:Panel>
                <asp:SqlDataSource ID="SqlDataSource_Gap_Section1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT  User_tbl.ID,User_tbl.Name +' ' + User_tbl.Family as 'name_user', Member_Group_tbl.Date_member, User_tbl.Account_name , CASE WHEN User_tbl.Sex_User = 1 THEN 'زن' WHEN User_tbl.Sex_User =0THEN 'مرد' END AS 'Gender',User_tbl.User_pic FROM User_tbl INNER JOIN Member_Group_tbl ON User_tbl.ID = Member_Group_tbl.ID_User INNER JOIN Group_tbl ON Member_Group_tbl.ID_Group = Group_tbl.ID
WHERE Group_tbl.ID=@id  AND  User_tbl.Log_In_State='True' ORDER BY ID  ASC
  ">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="id" QueryStringField="id" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
        <hr style="background-color: #2C3E5B" />
        <p align="right" dir="rtl" style="color: #FFFFFF">
            <span style="color: #FF0000">*</span> مطالب ارسالی از سوی کاربران حاظر در سایت،برای
            درج مطلب بایستی متن خود را در قسمت تعیین شده وارد نماییدو سپس بر روی دکمه ارسال
            کلیک نمایید.
        </p>
        <hr style="background-color: #2C3E5B" />
        <div style="font-family: tahoma, arial; font-size: small; vertical-align: top; width: 750px;
            position: relative;">
            <asp:Repeater ID="Repeater_Gap" runat="server" 
                onitemdatabound="Repeater_Gap_ItemDataBound">
                <ItemTemplate>
                    <table style="width: 750px; height: 150px;" dir="rtl">
                        <tr>
                            <td rowspan="2" align="right">
                                <table style="width: 200px; font-size: x-small">
                                    <tr>
                                        <td rowspan="3" style="text-align: right" width="90px">
                                            <asp:Image ID="Image_Gap" runat="server" ImageUrl='<%#Eval("User_pic")%>'
                                                Height="100px" Width="75px" />
                                        </td>
                                        <td style="text-align: right">
                                            <span class="style3" style="text-align: right">نام:</span><asp:Label ID="Label_Comment_user_name"
                                                runat="server" Text='<%#Eval("USERNAME")%>' Font-Names="Tahoma" Font-Size="X-Small"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right">
                                            <span class="style3">نام کاربری:</span><asp:Label ID="Label_Comment_user_accountname"
                                                runat="server" Text='<%#Eval("Account_name")%>' Font-Names="Tahoma" Font-Size="X-Small"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td rowspan="1">
                                <span class="style3" dir="rtl" style="text-align: left; max-width: 140px; font-size: x-small;">
                                    متن پیام:</span>
                            </td>
                            <td dir="rtl" align="right" style="text-align: right; max-width: 460px" width="460px">
                                <asp:Literal ID="Literal_body" runat="server" Text='<%#Eval("Message_Text")%>'></asp:Literal>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="style3" dir="rtl" style="text-align: left; max-width: 140px; font-size: x-small;">
                                    تاریخ:</span>
                            </td>
                            <td dir="rtl" align="right" style="text-align: right; max-width: 460px" width="460px">
                                <asp:Label ID="Label_date" runat="server" Text='<%#Eval("Date")%>'></asp:Label>                                
                            </td>
                        </tr>
                    </table>
                    <hr style="background-color: #2C3E5B; margin-top: 0px;" />
                    <br />
                </ItemTemplate>
            </asp:Repeater>
            <div style="font-family: tahoma, arial; font-size: small; vertical-align: top; width: 750px;
                position: relative;">
                <table style="border: thin solid #999966; width: 750px; max-width: 750px; font-size: x-small;">
                    <tr>
                        <td align="right" colspan="2" dir="rtl" style="color: #FFFFFF">
                            <span style="color: #FF0000">*</span> در این قسمت می توانید مطالب مورد نظر خود را
                            نوشته و سپس بر روی دکمه ارسال کلیک کنید تا افراد حاضر بتوانند به مطالب شما دسترسی
                            داشته باشند.
                            <hr style="background-color: #2C3E5B" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right" dir="rtl" width="650" style="border: thin solid #999966; font-size: x-small;">
                            &nbsp; &nbsp;
                            <asp:TextBox ID="TextBox_Message" runat="server" Height="250px" TextMode="MultiLine"
                                Width="650px"></asp:TextBox>
                        </td>
                        <td dir="rtl" width="100px" style="border: thin solid #999966; font-size: x-small;">
                            &nbsp;متن مورد نظر :
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2" style="border: thin solid #999966; font-size: x-small;">
                            <asp:Button ID="btn_send" runat="server" Font-Names="Tahoma" Font-Size="Small" Text="ارسال"
                                OnClick="btn_send_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2" dir="rtl">
                            <asp:Literal ID="Literal_Message" runat="server"></asp:Literal>
                        </td>
                    </tr>
                </table>
            </div>
            <asp:SqlDataSource ID="SqlDataSource_Gap" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                
                SelectCommand="SELECT TOP (20) CASE WHEN User_tbl.ID = Gap_MemberShip_Group_tbl.ID_User THEN User_tbl.Name + ' ' + User_tbl.Family END AS USERNAME, User_tbl.Account_name, User_tbl.User_pic, Gap_MemberShip_Group_tbl.Date, Gap_MemberShip_Group_tbl.Message_Text FROM User_tbl INNER JOIN Gap_MemberShip_Group_tbl ON User_tbl.ID = Gap_MemberShip_Group_tbl.ID_User WHERE (Gap_MemberShip_Group_tbl.ID_Group = @ID)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="ID" QueryStringField="id" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
