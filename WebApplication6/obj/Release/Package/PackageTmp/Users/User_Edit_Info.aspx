<%@ Page Title="" Language="C#" MasterPageFile="~/Users/Users_master.Master" AutoEventWireup="true"
    CodeBehind="User_Edit_Info.aspx.cs" Inherits="WebApplication6.Users.User_Edit_Info" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register assembly="Heidarpour.WebControlUI" namespace="Heidarpour.WebControlUI" tagprefix="rhp" %>
<script runat="server">

    protected void btn_save_user_pic_Click(object sender, EventArgs e)
    {

    }
  </script>  

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
    </telerik:RadScriptManager>
   
            <div class=" mainContent_mainpage">
                <div style="font-family: tahoma, arial; font-size: small; vertical-align: middle;
                    text-align: center; width: 874px; height: 60px; top: 0px; background-color: #8F98A6;
                    position: relative; right: 0px; float: left;    border-radius:3px 4px;">
                    <asp:ImageButton ID="Img_btn_Contact_info" runat="server" ImageUrl="~/Users/images/Contact Information.png"
                        OnClick="Img_btn_Contact_info_Click" AlternateText="ویرایش اطلاعات تکمیلی"  ToolTip="ویرایش اطلاعات تکمیلی"/>
                    <asp:ImageButton ID="Img_btn_User_pic" runat="server" ImageUrl="~/Users/images/pictures.png"
                        OnClick="Img_btn_User_pic_Click" AlternateText="عکس" ToolTip="ویرایش عکس"/>
                    <asp:ImageButton ID="Img_btn_Info_user" runat="server" ImageUrl="~/Users/images/Window Information.png"
                        OnClick="Img_btn_Info_user_Click" AlternateText="نمایش مشخصات فردی" ToolTip="نمایش مشخصات فردی"/>
                </div>
                <asp:MultiView ID="mvw_Edit_info" runat="server">
                    <asp:View ID="View_Complete_info" runat="server">
                        <div style="font-family: tahoma, arial; width: 874px; background-color: #95A0B2;
                            top: 0px; float: left; text-align: right; vertical-align: middle; font-size: medium;
                            right: 0px;    border-radius:3px 4px;
">
                            <table style="width: 874px; height: 500px; font-family: tahoma, arial; font-size: small;
                                font-weight: normal; font-style: normal; color: #000000; text-align: center;
                                vertical-align: middle; background-color: #95A0B2;" dir="rtl">
                                <tr>
                                    <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                                        height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                                        border-bottom-color: #FFFFFF;">
                                        نام:</td>
                                    <td align="right" style="font-family: tahoma, arial; font-size: small; font-style: normal;
                                        vertical-align: middle; text-align: right; border-bottom-style: dotted; border-bottom-width: thin;
                                        height: 40px; border-bottom-color: #FFFFFF;">
                                        <asp:TextBox ID="txt_name" runat="server"></asp:TextBox>
                                    </td>
                                    <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                                        height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                                        border-bottom-color: #FFFFFF;" align="left">
                                        نام خانوادگی:</td>
                                    <td align="right" style="font-family: tahoma, arial; font-size: small; font-style: normal;
                                        vertical-align: middle; text-align: right; border-bottom-style: dotted; border-bottom-width: thin;
                                        height: 40px; border-bottom-color: #FFFFFF;">
                                        <asp:TextBox ID="txt_Family" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right; height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin; border-bottom-color: #FFFFFF;">
                                        نام کاربری :</td>
                                    <td align="right" 
                                        style="font-family: tahoma, arial; font-size: small; font-style: normal; vertical-align: middle; text-align: right; border-bottom-style: dotted; border-bottom-width: thin; height: 40px; border-bottom-color: #FFFFFF;">
                                        <asp:TextBox ID="txt_name_Account" runat="server" ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right; height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin; border-bottom-color: #FFFFFF;" 
                                        align="left">
                                        جنسیت :</td>
                                    <td align="right" 
                                        style="font-family: tahoma, arial; font-size: small; font-style: normal; vertical-align: middle; text-align: right; border-bottom-style: dotted; border-bottom-width: thin; height: 40px; border-bottom-color: #FFFFFF;">
                                        <asp:DropDownList ID="ddl_Sex" runat="server" Font-Names="Tahoma" Width="130px">
                                            <asp:ListItem Value="0">مرد</asp:ListItem>
                                            <asp:ListItem Value="1">زن</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right; height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin; border-bottom-color: #FFFFFF;">
                                        تاریخ تولد :
                                    </td>
                                    <td align="right" 
                                        style="font-family: tahoma, arial; font-size: small; font-style: normal; vertical-align: middle; text-align: right; border-bottom-style: dotted; border-bottom-width: thin; height: 40px; border-bottom-color: #FFFFFF;">
                                        <asp:TextBox ID="TextBox_BirthDate" runat="server" ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right; height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin; border-bottom-color: #FFFFFF;" 
                                        align="left">
                                        محل تولد :
                                    </td>
                                    <td align="right" 
                                        style="font-family: tahoma, arial; font-size: small; font-style: normal; vertical-align: middle; text-align: right; border-bottom-style: dotted; border-bottom-width: thin; height: 40px; border-bottom-color: #FFFFFF;">
                                        <asp:TextBox ID="txt_Cityborn" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                                        height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                                        border-bottom-color: #FFFFFF;">
                                        میزان تحصیلات :
                                    </td>
                                    <td align="right" style="font-family: tahoma, arial; font-size: small; font-style: normal;
                                        vertical-align: middle; text-align: right; border-bottom-style: dotted; border-bottom-width: thin;
                                        height: 40px; border-bottom-color: #FFFFFF;">
                                        <asp:TextBox ID="txt_Education" runat="server"></asp:TextBox>
                                    </td>
                                    <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                                        height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                                        border-bottom-color: #FFFFFF;" align="left">
                                        استان :
                                    </td>
                                    <td align="right" style="font-family: tahoma, arial; font-size: small; font-style: normal;
                                        vertical-align: middle; text-align: right; border-bottom-style: dotted; border-bottom-width: thin;
                                        height: 40px; border-bottom-color: #FFFFFF;">
                                        <asp:TextBox ID="txt_Ostan" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                                        height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                                        border-bottom-color: #FFFFFF;">
                                        رشته تحصیلی :
                                    </td>
                                    <td align="right" style="font-family: tahoma, arial; font-size: small; font-style: normal;
                                        vertical-align: middle; text-align: right; border-bottom-style: dotted; border-bottom-width: thin;
                                        height: 40px; border-bottom-color: #FFFFFF;">
                                        <asp:TextBox ID="txt_Mager" runat="server" Width="150px"></asp:TextBox>
                                    </td>
                                    <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                                        height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                                        border-bottom-color: #FFFFFF;" align="left">
                                        دانشگاه محل تحصیل :
                                    </td>
                                    <td align="right" style="font-family: tahoma, arial; font-size: small; font-style: normal;
                                        vertical-align: middle; text-align: right; border-bottom-style: dotted; border-bottom-width: thin;
                                        height: 40px; border-bottom-color: #FFFFFF;">
                                        <asp:TextBox ID="txt_Collegename" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                                        height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                                        border-bottom-color: #FFFFFF;">
                                        وضعیت تحصیلی :
                                    </td>
                                    <td align="right" style="font-family: tahoma, arial; font-size: small; font-style: normal;
                                        vertical-align: middle; text-align: right; border-bottom-style: dotted; border-bottom-width: thin;
                                        height: 40px; border-bottom-color: #FFFFFF;">
                                        <asp:TextBox ID="txt_Education_State" runat="server" Width="150px"></asp:TextBox>
                                    </td>
                                    <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                                        height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                                        border-bottom-color: #FFFFFF;" align="left">
                                        شغل :
                                    </td>
                                    <td align="right" style="font-family: tahoma, arial; font-size: small; font-style: normal;
                                        vertical-align: middle; text-align: right; border-bottom-style: dotted; border-bottom-width: thin;
                                        height: 40px; border-bottom-color: #FFFFFF;">
                                        <asp:TextBox ID="txt_Jobuser" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                                        height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                                        border-bottom-color: #FFFFFF;">
                                        شماره تماس :
                                    </td>
                                    <td align="right" style="font-family: tahoma, arial; font-size: small; font-style: normal;
                                        vertical-align: middle; text-align: right; border-bottom-style: dotted; border-bottom-width: thin;
                                        height: 40px; border-bottom-color: #FFFFFF;">
                                        <asp:TextBox ID="txt_Telephone" runat="server" Width="150px"></asp:TextBox>
                                    </td>
                                    <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                                        height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                                        border-bottom-color: #FFFFFF;" align="left">
                                        دین :
                                    </td>
                                    <td align="right" style="font-family: tahoma, arial; font-size: small; font-style: normal;
                                        vertical-align: middle; text-align: right; border-bottom-style: dotted; border-bottom-width: thin;
                                        height: 40px; border-bottom-color: #FFFFFF;">
                                        <asp:TextBox ID="txt_Din" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                                        height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                                        border-bottom-color: #FFFFFF;">
                                        محل زندگی :
                                    </td>
                                    <td align="right" style="font-family: tahoma, arial; font-size: small; font-style: normal;
                                        vertical-align: middle; text-align: right; border-bottom-style: dotted; border-bottom-width: thin;
                                        height: 40px; border-bottom-color: #FFFFFF;">
                                        <asp:TextBox ID="txt_Citylive" runat="server"></asp:TextBox>
                                    </td>
                                    <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                                        height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                                        border-bottom-color: #FFFFFF;" align="left">
                                        علاقمند به:
                                    </td>
                                    <td align="right" style="font-family: tahoma, arial; font-size: small; font-style: normal;
                                        vertical-align: middle; text-align: right; border-bottom-style: dotted; border-bottom-width: thin;
                                        height: 40px; border-bottom-color: #FFFFFF;">
                                        <asp:TextBox ID="txt_Favoretis" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                                        height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                                        border-bottom-color: #FFFFFF;">
                                        آدرس ایمیل :
                                    </td>
                                    <td align="right" colspan="3" style="font-family: tahoma, arial; font-size: small;
                                        font-style: normal; vertical-align: middle; text-align: right; border-bottom-style: dotted;
                                        border-bottom-width: thin; height: 40px; border-bottom-color: #FFFFFF;">
                                        <asp:TextBox ID="txt_Email" runat="server" Width="350px" 
                                            AutoCompleteType="Email"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                                        height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                                        border-bottom-color: #FFFFFF;">
                                        توضیحات :
                                    </td>
                                    <td align="right" colspan="3" style="font-family: tahoma, arial; font-size: small;
                                        font-style: normal; vertical-align: middle; text-align: right; border-bottom-style: dotted;
                                        border-bottom-width: thin; height: 40px; border-bottom-color: #FFFFFF;">
                                        <asp:TextBox ID="txt_Discreption" runat="server" TextMode="MultiLine" 
                                            Width="491px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: center;
                                        height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                                        border-bottom-color: #FFFFFF;" align="center" colspan="4">
                                        &nbsp; &nbsp;<asp:Button ID="btn_Edit_info_user" runat="server" Font-Names="Tahoma" 
                                            onclick="btn_Edit_info_user_Click" Text="ویرایش اطلاعات" />
                                        <asp:Button ID="btn_Cancel_Edit_user" runat="server" Font-Names="Tahoma" 
                                            onclick="btn_Cancel_Edit_user_Click" Text="لغو عملیات" />
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
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
                                        border-bottom-color: #FFFFFF;">
                                        &nbsp;
                                    </td>
                                    <td align="right" colspan="3" style="font-family: tahoma, arial; font-size: small;
                                        font-style: normal; vertical-align: middle; text-align: right; border-bottom-style: dotted;
                                        border-bottom-width: thin; height: 40px; border-bottom-color: #FFFFFF;">
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
                                        <asp:TextBox ID="txt_Security_question" runat="server" Columns="80"></asp:TextBox>
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
                                        <asp:TextBox ID="txt_Secutity_answer" runat="server" Columns="80"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                                        height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                                        border-bottom-color: #FFFFFF;">
                                        &nbsp;
                                    </td>
                                    <td align="right" colspan="3" style="font-family: tahoma, arial; font-size: small;
                                        font-style: normal; vertical-align: middle; text-align: right; border-bottom-style: dotted;
                                        border-bottom-width: thin; height: 40px; border-bottom-color: #FFFFFF;">
                                        <asp:Button ID="btn_Submit_security" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                            Text="ویرایش سوال" onclick="btn_Submit_security_Click" />
                                        <asp:Button ID="btn_Cancel_Security" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                            Text="لغو عملیات" onclick="btn_Cancel_Security_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" align="center" dir="rtl">
                                        <hr style="background-color: #2C3E5B" />
                                        <asp:Literal ID="Literal_Info" runat="server"></asp:Literal>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:View>
                    <asp:View ID="View_User_pic" runat="server">
                        <div style="font-family: tahoma, arial; width: 874px; background-color: #95A0B2;
                            top: 0px; float: left; text-align: right; vertical-align: middle; font-size: medium;
                            right: 0px;">
                            <table style="width: 100%;">
                                <tr>
                                    <td colspan="3">
                                        <p>
                                            <span style="color: red">*</span>&nbsp; با کلیک بر روی دکمه Browse می توانید عکس مورد 
                                            نظر خود را انتخاب کنید.</p>
                                    </td>
                                    <td dir="rtl" rowspan="8" style="font-size: x-small;
                                        " width="250">
                                        <dl>
                                            <dt style="font-family: tahoma; font-size: x-small; color: #006699">- قوانین مربوط 
                                                به آپلود تصاویر :</dt>
                                            <dd>
                                            </dd>
                                            <dd>
                                                <span style="color: red">*</span>حجم عکس مورد نظر بایستی کمتر از 1 مگا بایت 
                                                باشد.<br />
                                                <br />
                                                <span style="color: red">*</span>فرمت عکس مورد نظر بایستی png و یا&nbsp; jpeg باشد.</dd>
                                        </dl>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" style="font-size: x-small; vertical-align: top;" 
                                        rowspan="7">
                                        &nbsp;<asp:Image ID="Img_Upload_User_Pic" runat="server" Height="120px" Width="100px" />
                                        &nbsp; &nbsp;
                                    </td>
                                    <td colspan="2" height="100" 
                                        style="font-size: x-small;">
                                        &nbsp;<asp:FileUpload ID="FileUpload_pic_Edit_user" runat="server" Height="25px"
                                            Width="300px" />
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="font-size: x-small;">
                                        <hr style="background-color: #2C3E5B" /></td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="font-size: x-small;" 
                                        align="center">
                                        <asp:Button ID="btn_Cancel_Upload_pic" runat="server" Font-Names="Tahoma" 
                                            Text="لغو عملیات" onclick="btn_Cancel_Upload_pic_Click" />
                                        <asp:Button ID="Button_Editpic" runat="server" Text="ویرایش عکس" Font-Names="Tahoma" OnClick="Button_Editpic_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" height="30" 
                                        style="font-size: x-small;">
                                        <asp:Label ID="Label2" runat="server" Font-Size="X-Small" Text="پسوند فایل :" 
                                            Font-Names="Tahoma"></asp:Label>
                                    </td>
                                    <td align="left" height="30" 
                                        style=" font-size: x-small;">
                                        <asp:Label ID="Label_FileUpload_Extention_File" runat="server" Text="Label" 
                                            Font-Size="X-Small"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" height="30" 
                                        style=" font-size: x-small;">
                                        <asp:Label ID="Label3" runat="server" Font-Size="X-Small" Text="حجم فایل :" 
                                            Font-Names="Tahoma"></asp:Label>
                                    </td>
                                    <td align="left" height="30" 
                                        style=" font-size: x-small;">
                                        <asp:Label ID="Label_FileUpload_Capacity_File" runat="server" Text="Label" 
                                            Font-Size="X-Small"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" dir="rtl">
                                        &nbsp;
                                        <asp:Literal ID="Literal_pic_upload" runat="server"></asp:Literal>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:View>
                    <asp:View ID="View_Info_user" runat="server">
                        <div style="font-family: tahoma, arial; width: 874px; background-color: #95A0B2;
                            top: 0px; float: left; text-align: right; vertical-align: middle; font-size: medium;
                            right: 0px;">
                            <table style="width: 735px; height: 500px; font-family: tahoma, arial; font-size: small;
                                font-weight: normal; font-style: normal; color: #000000; text-align: center;
                                vertical-align: middle; background-color: #95A0B2;" dir="rtl">
                                <tr>
                                    <td style="border-bottom: thin dotted #FFFFFF; font-family: tahoma, arial; font-size: x-small; font-style: normal; text-align: right;
                                        height: 40px; vertical-align: middle; " width="120" align="left">
                                        نام :</td>
                                    <td align="right" style="font-family: tahoma, arial; font-size: small; font-style: normal;
                                        vertical-align: middle; text-align: right; border-bottom-style: dotted; border-bottom-width: thin;
                                        height: 40px; border-bottom-color: #FFFFFF;" width="250">
                                        <asp:Label ID="Label_Info_name" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td style="border-bottom: thin dotted #FFFFFF; font-family: tahoma, arial; font-size: x-small; font-style: normal; text-align: right;
                                        height: 40px; vertical-align: middle; " width="125" align="left">
                                        نام خانوادگی:</td>
                                    <td align="right" style="font-family: tahoma, arial; font-size: small; font-style: normal;
                                        vertical-align: middle; text-align: right; border-bottom-style: dotted; border-bottom-width: thin;
                                        height: 40px; border-bottom-color: #FFFFFF;">
                                        <asp:Label ID="Label_Info_Family" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-bottom: thin dotted #FFFFFF; font-family: tahoma, arial; font-size: x-small; font-style: normal; text-align: right;
                                        height: 40px; vertical-align: middle; " width="120" align="left">
                                        نام کاربری:</td>
                                    <td align="right" style="font-family: tahoma, arial; font-size: small; font-style: normal;
                                        vertical-align: middle; text-align: right; border-bottom-style: dotted; border-bottom-width: thin;
                                        height: 40px; border-bottom-color: #FFFFFF;" width="250">
                                        <asp:Label ID="Label_Info_NameAccount" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td style="border-bottom: thin dotted #FFFFFF; font-family: tahoma, arial; font-size: x-small; font-style: normal; text-align: right;
                                        height: 40px; vertical-align: middle; " width="125" align="left">
                                        جنسیت :</td>
                                    <td align="right" style="font-family: tahoma, arial; font-size: small; font-style: normal;
                                        vertical-align: middle; text-align: right; border-bottom-style: dotted; border-bottom-width: thin;
                                        height: 40px; border-bottom-color: #FFFFFF;">
                                        <asp:Label ID="Label_Info_Sex" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-bottom: thin dotted #FFFFFF; font-family: tahoma, arial; font-size: x-small; font-style: normal; text-align: right;
                                        height: 40px; vertical-align: middle; " width="120" align="left">
                                        تاریخ تولد :
                                    </td>
                                    <td align="right" style="font-family: tahoma, arial; font-size: small; font-style: normal;
                                        vertical-align: middle; text-align: right; border-bottom-style: dotted; border-bottom-width: thin;
                                        height: 40px; border-bottom-color: #FFFFFF;" width="250">
                                        <asp:Label ID="Label_Info_Born" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td style="border-bottom: thin dotted #FFFFFF; font-family: tahoma, arial; font-size: x-small; font-style: normal; text-align: right;
                                        height: 40px; vertical-align: middle; " width="125" align="left">
                                        محل تولد :
                                    </td>
                                    <td align="right" style="font-family: tahoma, arial; font-size: small; font-style: normal;
                                        vertical-align: middle; text-align: right; border-bottom-style: dotted; border-bottom-width: thin;
                                        height: 40px; border-bottom-color: #FFFFFF;">
                                        <asp:Label ID="Label_Info_Cityborn" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-bottom: thin dotted #FFFFFF; font-family: tahoma, arial; font-size: x-small; font-style: normal; text-align: right;
                                        height: 39px; vertical-align: middle; " width="120" align="left">
                                        میزان تحصیلات :
                                    </td>
                                    <td align="right" style="border-bottom: thin dotted #FFFFFF; font-family: tahoma, arial; font-size: small; font-style: normal;
                                        vertical-align: middle; text-align: right; height: 39px; " width="250">
                                        <asp:Label ID="Label_Info_Education" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td style="border-bottom: thin dotted #FFFFFF; font-family: tahoma, arial; font-size: x-small; font-style: normal; text-align: right;
                                        height: 39px; vertical-align: middle; " width="125" align="left">
                                        استان :
                                    </td>
                                    <td align="right" style="border-bottom: thin dotted #FFFFFF; font-family: tahoma, arial; font-size: small; font-style: normal;
                                        vertical-align: middle; text-align: right; height: 39px; ">
                                        <asp:Label ID="Label_Info_Ostan" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-bottom: thin dotted #FFFFFF; font-family: tahoma, arial; font-size: x-small; font-style: normal; text-align: right;
                                        height: 40px; vertical-align: middle; " width="120" align="left">
                                        رشته تحصیلی :
                                    </td>
                                    <td align="right" style="font-family: tahoma, arial; font-size: small; font-style: normal;
                                        vertical-align: middle; text-align: right; border-bottom-style: dotted; border-bottom-width: thin;
                                        height: 40px; border-bottom-color: #FFFFFF;" width="250">
                                        <asp:Label ID="Label_Info_Mager" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td style="border-bottom: thin dotted #FFFFFF; font-family: tahoma, arial; font-size: x-small; font-style: normal; text-align: right;
                                        height: 40px; vertical-align: middle; " width="125" align="left">
                                        دانشگاه محل تحصیل :
                                    </td>
                                    <td align="right" style="font-family: tahoma, arial; font-size: small; font-style: normal;
                                        vertical-align: middle; text-align: right; border-bottom-style: dotted; border-bottom-width: thin;
                                        height: 40px; border-bottom-color: #FFFFFF;">
                                        <asp:Label ID="Label_Info_Collegename" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-bottom: thin dotted #FFFFFF; font-family: tahoma, arial; font-size: x-small; font-style: normal; text-align: right;
                                        height: 40px; vertical-align: middle; " width="120" align="left">
                                        وضعیت تحصیلی :
                                    </td>
                                    <td align="right" style="font-family: tahoma, arial; font-size: small; font-style: normal;
                                        vertical-align: middle; text-align: right; border-bottom-style: dotted; border-bottom-width: thin;
                                        height: 40px; border-bottom-color: #FFFFFF;" width="250">
                                        <asp:Label ID="Label_Info_Education_State" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td style="border-bottom: thin dotted #FFFFFF; font-family: tahoma, arial; font-size: x-small; font-style: normal; text-align: right;
                                        height: 40px; vertical-align: middle; " width="125" align="left">
                                        شغل :
                                    </td>
                                    <td align="right" style="font-family: tahoma, arial; font-size: small; font-style: normal;
                                        vertical-align: middle; text-align: right; border-bottom-style: dotted; border-bottom-width: thin;
                                        height: 40px; border-bottom-color: #FFFFFF;">
                                        <asp:Label ID="Label_Info_Jobuser" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-bottom: thin dotted #FFFFFF; font-family: tahoma, arial; font-size: x-small; font-style: normal; text-align: right;
                                        height: 40px; vertical-align: middle; " width="120" align="left">
                                        شماره تماس :
                                    </td>
                                    <td align="right" style="font-family: tahoma, arial; font-size: small; font-style: normal;
                                        vertical-align: middle; text-align: right; border-bottom-style: dotted; border-bottom-width: thin;
                                        height: 40px; border-bottom-color: #FFFFFF;" width="250">
                                        <asp:Label ID="Label_Info_Telephone" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td style="border-bottom: thin dotted #FFFFFF; font-family: tahoma, arial; font-size: x-small; font-style: normal; text-align: right;
                                        height: 40px; vertical-align: middle; " width="125" align="left">
                                        دین :
                                    </td>
                                    <td align="right" style="font-family: tahoma, arial; font-size: small; font-style: normal;
                                        vertical-align: middle; text-align: right; border-bottom-style: dotted; border-bottom-width: thin;
                                        height: 40px; border-bottom-color: #FFFFFF;">
                                        <asp:Label ID="Label_Info_Din" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-bottom: thin dotted #FFFFFF; font-family: tahoma, arial; font-size: x-small; font-style: normal; text-align: right;
                                        height: 40px; vertical-align: middle; " width="120" align="left">
                                        محل زندگی :
                                    </td>
                                    <td align="right" style="font-family: tahoma, arial; font-size: small; font-style: normal;
                                        vertical-align: middle; text-align: right; border-bottom-style: dotted; border-bottom-width: thin;
                                        height: 40px; border-bottom-color: #FFFFFF;" width="250">
                                        <asp:Label ID="Label_Info_Citylive" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td style="border-bottom: thin dotted #FFFFFF; font-family: tahoma, arial; font-size: x-small; font-style: normal; text-align: right;
                                        height: 40px; vertical-align: middle; " width="125" align="left">
                                        علایق:
                                    </td>
                                    <td align="right" style="font-family: tahoma, arial; font-size: small; font-style: normal;
                                        vertical-align: middle; text-align: right; border-bottom-style: dotted; border-bottom-width: thin;
                                        height: 40px; border-bottom-color: #FFFFFF;">
                                        <asp:Label ID="Label_Info_Favoretis" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-bottom: thin dotted #FFFFFF; font-family: tahoma, arial; font-size: x-small; font-style: normal; text-align: right;
                                        height: 40px; vertical-align: middle; " width="120" align="left">
                                        آدرس ایمیل :
                                    </td>
                                    <td align="right" colspan="3" style="font-family: tahoma, arial; font-size: small;
                                        font-style: normal; vertical-align: middle; text-align: right; border-bottom-style: dotted;
                                        border-bottom-width: thin; height: 40px; border-bottom-color: #FFFFFF;">
                                        <asp:Label ID="Label_Info_Email" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-bottom: thin dotted #FFFFFF; font-family: tahoma, arial; font-size: x-small; font-style: normal; text-align: right;
                                        height: 40px; vertical-align: middle; " width="120" align="left">
                                        توضیحات :
                                    </td>
                                    <td align="right" colspan="3" style="font-family: tahoma, arial; font-size: small;
                                        font-style: normal; vertical-align: middle; text-align: right; border-bottom-style: dotted;
                                        border-bottom-width: thin; height: 40px; border-bottom-color: #FFFFFF;">
                                        <asp:Label ID="Label_Info_Discreption" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:View>
                </asp:MultiView>
            </div>
        
</asp:Content>
