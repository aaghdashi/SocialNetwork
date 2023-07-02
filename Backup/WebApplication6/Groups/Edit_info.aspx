<%@ Page Title="" Language="C#" MasterPageFile="~/Groups/Admins_master.Master" AutoEventWireup="true"
    CodeBehind="Edit_info.aspx.cs" Inherits="WebApplication6.Groups.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            color: red;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="MainContent">
        <div style="font-family: tahoma, arial; font-size: small; vertical-align: middle;
            text-align: center; width: 750px; height: 60px; top: 0px; right: 0px">
            <asp:ImageButton ID="Img_btn_Edit_Info_Group" runat="server" ImageUrl="~/Groups/images/edit_info.png"
                OnClick="Img_btn_Edit_Info_Group_Click" />
            <asp:ImageButton ID="Img_btn_Edit_Members_Group" runat="server" ImageUrl="~/Groups/images/member.png"
                OnClick="Img_btn_Edit_Members_Group_Click" Style="width: 48px" />
            <asp:ImageButton ID="Img_btn_Image_group" runat="server" ImageUrl="~/Groups/images/pictures.png"
                OnClick="Img_btn_Image_group_Click" />
        </div>
        <asp:MultiView ID="MultiView_Edit" runat="server">
            <asp:View ID="View_Edit_Picture_Group" runat="server">
                <div style="font-family: tahoma, arial; width: 750px; background-color: #95A0B2;
                    top: 0px; float: left; text-align: right; vertical-align: middle; font-size: medium;
                    right: 0px;">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="3">
                                <h6 align="right" dir="rtl">
                                    <span style="color: red">*</span>&nbsp; با کلیک بر روی دکمه Browse می توانید عکس
                                    مورد نظر خود را انتخاب کنید.</h6>
                            </td>
                            <td dir="rtl" rowspan="8" style="border: thin solid #999966; font-size: x-small;"
                                width="250">
                                <dl>
                                    <dt style="font-family: tahoma; font-size: x-small; color: #006699">- قوانین مربوط به
                                        آپلود تصاویر :</dt>
                                    <dd>
                                    </dd>
                                    <dd>
                                        <span style="color: red">*</span>حجم عکس مورد نظر بایستی کمتر از 1 مگا بایت باشد.<br />
                                        <br />
                                        <span style="color: red">*</span>فرمت عکس مورد نظر بایستی png و یا&nbsp; jpeg باشد.</dd>
                                </dl>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="border: thin solid #999966; font-size: x-small; vertical-align: top;"
                                rowspan="7">
                                &nbsp;<asp:Image ID="Img_Upload_Group_Pic" runat="server" Height="120px" Width="100px" />
                                &nbsp; &nbsp;
                            </td>
                            <td colspan="2" height="100" style="border: thin solid #999966; font-size: x-small;">
                                &nbsp;<asp:FileUpload ID="FileUpload_pic_Edit_Group" runat="server" Height="25px"
                                    Width="300px" />
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="border: thin solid #999966; font-size: x-small;">
                                <hr style="background-color: #2C3E5B" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="border: thin solid #999966; font-size: x-small;" align="center">
                                <asp:Button ID="btn_Cancel_Upload_pic_Group" runat="server" Font-Names="Tahoma" Text="لغو عملیات" />
                                <asp:Button ID="btn_save_Group_pic" runat="server" Font-Names="Tahoma" Text="ثبت عکس"
                                    OnClick="btn_save_Group_pic_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" height="30" style="border: thin solid #999966; font-size: x-small;">
                                <asp:Label ID="Label2" runat="server" Font-Size="X-Small" Text="پسوند فایل :" Font-Names="Tahoma"></asp:Label>
                            </td>
                            <td align="left" height="30" style="border: thin solid #999966; font-size: x-small;">
                                <asp:Label ID="Label_FileUpload_Extention_File_Group" runat="server" Text="Label"
                                    Font-Size="X-Small"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" height="30" style="border: thin solid #999966; font-size: x-small;">
                                <asp:Label ID="Label3" runat="server" Font-Size="X-Small" Text="حجم فایل :" Font-Names="Tahoma"></asp:Label>
                            </td>
                            <td align="left" height="30" style="border: thin solid #999966; font-size: x-small;">
                                <asp:Label ID="Label_FileUpload_Capacity_File_Group" runat="server" Text="Label"
                                    Font-Size="X-Small"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <hr style="background-color: #2C3E5B" />
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" dir="rtl">
                                &nbsp;
                                <asp:Literal ID="Literal_pic_upload_Group" runat="server"></asp:Literal>
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:View>
            <asp:View ID="View_Edit_Info_Group" runat="server">
                <table style="width: 750px; height: 500px; font-family: tahoma, arial; font-size: small;
                    font-weight: normal; font-style: normal; color: #000000; text-align: center;
                    vertical-align: middle; background-color: #95A0B2;" dir="rtl">
                    <tr>
                        <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                            height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                            border-bottom-color: #FFFFFF;" align="left">
                            نام گروه :
                        </td>
                        <td align="right" style="font-family: tahoma, arial; font-size: small; font-style: normal;
                            vertical-align: middle; text-align: right; border-bottom-style: dotted; border-bottom-width: thin;
                            height: 40px; border-bottom-color: #FFFFFF;">
                            <asp:TextBox ID="txt_name_Group" runat="server"></asp:TextBox>
                        </td>
                        <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                            height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                            border-bottom-color: #FFFFFF;">
                            موضوع گروه :
                        </td>
                        <td align="right" style="font-family: tahoma, arial; font-size: small; font-style: normal;
                            vertical-align: middle; text-align: right; border-bottom-style: dotted; border-bottom-width: thin;
                            height: 40px; border-bottom-color: #FFFFFF;">
                            <asp:TextBox ID="TextBox_Topic_Group" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                            height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                            border-bottom-color: #FFFFFF;" align="left">
                            نام کاربری :
                        </td>
                        <td align="right" style="font-family: tahoma, arial; font-size: small; font-style: normal;
                            vertical-align: middle; text-align: right; border-bottom-style: dotted; border-bottom-width: thin;
                            height: 40px; border-bottom-color: #FFFFFF;">
                            <asp:TextBox ID="txt_name_Account_Group" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                            height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                            border-bottom-color: #FFFFFF;" colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                            height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                            border-bottom-color: #FFFFFF;" align="left">
                            آدرس ایمیل :
                        </td>
                        <td align="right" colspan="3" style="font-family: tahoma, arial; font-size: small;
                            font-style: normal; vertical-align: middle; text-align: right; border-bottom-style: dotted;
                            border-bottom-width: thin; height: 40px; border-bottom-color: #FFFFFF;">
                            <asp:TextBox ID="txt_Email_Group" runat="server" Width="350px" AutoCompleteType="Email"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                            height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                            border-bottom-color: #FFFFFF;" align="left">
                            توضیحات :
                        </td>
                        <td align="right" colspan="3" style="font-family: tahoma, arial; font-size: small;
                            font-style: normal; vertical-align: middle; text-align: right; border-bottom-style: dotted;
                            border-bottom-width: thin; height: 40px; border-bottom-color: #FFFFFF;">
                            <asp:TextBox ID="txt_Discreption_Group" runat="server" TextMode="MultiLine" Width="491px"
                                ClientIDMode="AutoID"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: center;
                            height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                            border-bottom-color: #FFFFFF;" colspan="4">
                            &nbsp; &nbsp;<asp:Button ID="btn_Edit_info_Group" runat="server" Font-Names="Tahoma"
                                OnClick="btn_Edit_info_Group_Click" Text="ویرایش اطلاعات" />
                            <asp:Button ID="btn_Cancel_Edit_Group" runat="server" Font-Names="Tahoma" OnClick="btn_Cancel_Edit_Group_Click"
                                Text="لغو عملیات" />
                            <hr style="background-color: #2C3E5B" />
                            <asp:Literal ID="Literal_Edit_Info_Group" runat="server"></asp:Literal>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                SelectCommand="SELECT Birth_date, City_born, Education, Ostan, Mager, College_Name, State_Education, Job_user, Telephone, Din, City_live, Favorites_user, E_mail, Discreption_User FROM User_tbl WHERE (ID = @ID)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="ID" SessionField="id_user" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                            height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                            border-bottom-color: #FFFFFF;" colspan="4">
                            <hr style="background-color: #2C3E5B" />
                            <p>
                                <span style="color: #FF0000">*</span>&nbsp;در این قسمت می توانید با تعیین یک سوال
                                و جواب آن ، زمانی که رمز عبور خود را فراموش کردید آن را بازیابی نمایید.</p>
                        </td>
                    </tr>
                    <tr>
                        <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                            height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                            border-bottom-color: #FFFFFF;">
                            سوال امنیتی :
                        </td>
                        <td align="right" colspan="3" style="font-family: tahoma, arial; font-size: small;
                            font-style: normal; vertical-align: middle; text-align: right; border-bottom-style: dotted;
                            border-bottom-width: thin; height: 40px; border-bottom-color: #FFFFFF;">
                            <asp:TextBox ID="txt_Security_question_Group" runat="server" Columns="80"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                            height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                            border-bottom-color: #FFFFFF;">
                            جواب سوال :
                        </td>
                        <td align="right" colspan="3" style="font-family: tahoma, arial; font-size: small;
                            font-style: normal; vertical-align: middle; text-align: right; border-bottom-style: dotted;
                            border-bottom-width: thin; height: 40px; border-bottom-color: #FFFFFF;">
                            <asp:TextBox ID="txt_Secutity_answer_Group" runat="server" Columns="80"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: center;
                            height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                            border-bottom-color: #FFFFFF;" align="center" colspan="4">
                            &nbsp;
                            <asp:Button ID="btn_Submit_security_Group" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                OnClick="btn_Submit_security_Group_Click" Text="ثبت تغییرات" />
                            <asp:Button ID="btn_Cancel_Security_Group" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                OnClick="btn_Cancel_Security_Group_Click" Text="لغو عملیات" />
                        </td>
                    </tr>
                    <tr>
                        <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: center;
                            height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                            border-bottom-color: #FFFFFF;" colspan="4" align="center">
                            <hr style="background-color: #2C3E5B" />
                            <asp:Literal ID="Literal_Edit_Question_Group" runat="server"></asp:Literal>
                            <br />
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="View_Edit_Members_Group" runat="server">
                <div align="center" dir="rtl">
                    <asp:SqlDataSource ID="SqlDataSource_MemberShip" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        SelectCommand="SELECT  Member_Group_tbl.ID, User_tbl.Name AS 'نام', User_tbl.Family AS 'نام خانوادگی', Member_Group_tbl.Date_member AS 'تاریخ عضویت', User_tbl.Account_name AS 'نام کاربری', CASE WHEN User_tbl.Sex_User = 1 THEN 'زن' WHEN User_tbl.Sex_User = 0 THEN 'مرد' END AS 'جنسیت', User_tbl.User_pic FROM  User_tbl INNER JOIN Member_Group_tbl ON User_tbl.ID = Member_Group_tbl.ID_User WHERE  Member_Group_tbl.ID_Group=@id"
                        DeleteCommand="DELETE FROM Member_Group_tbl WHERE (ID = @ID)">
                        <DeleteParameters>
                            <asp:Parameter Name="ID" />
                        </DeleteParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="id" SessionField="id_group" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:GridView ID="GridView_MemberShip" runat="server" AutoGenerateColumns="False"
                        CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource_MemberShip" ForeColor="#333333"
                        GridLines="None" Width="750px" OnRowDataBound="GridView_MemberShip_RowDataBound"
                        OnSelectedIndexChanged="GridView_MemberShip_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                            <asp:ImageField DataImageUrlField="User_pic" NullImageUrl="~/Groups/images/no_image.png">
                                <ControlStyle Height="100px" Width="80px" />
                            </asp:ImageField>
                            <asp:BoundField DataField="نام" HeaderText="نام" SortExpression="نام" />
                            <asp:BoundField DataField="نام خانوادگی" HeaderText="نام خانوادگی" SortExpression="نام خانوادگی" />
                            <asp:TemplateField HeaderText="تاریخ عضویت">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_Date" runat="server" Text='<%# Eval("تاریخ عضویت") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="نام کاربری" HeaderText="نام کاربری" SortExpression="نام کاربری" />
                            <asp:BoundField DataField="جنسیت" HeaderText="جنسیت" ReadOnly="True" SortExpression="جنسیت" />
                            <asp:CommandField DeleteText="لغو عضویت" ShowDeleteButton="True" />
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
                <div>
                    <asp:Literal ID="Literal_Member" runat="server"></asp:Literal>
                </div>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
