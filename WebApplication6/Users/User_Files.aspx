<%@ Page Title="" Language="C#" MasterPageFile="~/Users/Users_master.Master" AutoEventWireup="true"
    CodeBehind="User_Files.aspx.cs" Inherits="WebApplication6.Users.WebForm11" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="mainContent">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <table style="width: 874px;">
            <tr>
                <td align="center" style="width: 874px; height: 50px">
                    <asp:ImageButton ID="Img_btn_TextFile_User" runat="server" ImageUrl="~/Users/images/Files-text.png"
                        AlternateText="آپلود فایل متنی" Height="48px" Width="48px" ToolTip="آپلود فایل متنی"
                        OnClick="Img_btn_TextFile_User_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="Img_btn_Picture_User" runat="server" ImageUrl="~/Users/images/gallery.png"
                        AlternateText="آپلود عکس" Height="48px" Width="48px" ToolTip="آپلود عکس"
                        OnClick="Img_btn_Picture_User_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="Img_btn_Movie_User" runat="server" ImageUrl="~/Users/images/Movie.png"
                        AlternateText="آپلود فیلم" Height="48px" Width="48px" ToolTip="آپلود فیلم"
                        OnClick="Img_btn_Movie_User_Click" />
                    &nbsp;&nbsp;
                    <asp:ImageButton ID="Img_btn_Upload" runat="server" ImageUrl="~/Users/images/upload.png"
                        AlternateText="قوانین آپلود فایل" Height="48px" Width="48px" ToolTip="قوانین آپلود فایل"
                        OnClick="Img_btn_Upload_Click" />
                    &nbsp;&nbsp;
                    <asp:ImageButton ID="Img_btn_control_panel" runat="server"
                        AlternateText="مدیریت فایل ها"  ImageUrl="~/Users/images/conrolpanel.png"
                        Height="48px" Width="48px" ToolTip="مدیریت فایل ها" OnClick="Img_btn_Download_Click" />
                    <br />
                    <hr style="background-color: #2C3E5B" />
                </td>
            </tr>
            <tr>
                <td style="font-family: tahoma, arial; font-size: small; font-weight: normal; font-style: normal; vertical-align: top; text-align: left; width: 874px; height: 350px"
                    align="center">
                    <asp:MultiView ID="MultiView_View" runat="server" ActiveViewIndex="3">
                        <asp:View ID="View_TextFile_User" runat="server">
                            <div class="ContentUserPage">
                                <table align="center" style="width: 874px;">
                                    <tr>
                                        <td colspan="4" align="right" dir="rtl">
                                            <span style="color: red">*</span> <span style="color: white">کاربر گرامی! قبل از ذخیره
                                                فایل خود می توانید عنوان مربوط به فایل و توضیحات مربوط به آن را وارد کنید.</span>
                                            <br />
                                            <hr style="background-color: #2C3E5B; margin-top: 0px;" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" align="center" dir="rtl" style="border: thin solid #999966; font-size: x-small;">&nbsp;
                                            <asp:FileUpload ID="FileUpload_Text_file" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" width="120" style="border: thin solid #999966; font-size: x-small;">عنوان مربوط به فایل:
                                        </td>
                                        <td align="right" style="border: thin solid #999966; font-size: x-small;" width="120">
                                            <asp:TextBox ID="TextBox_Topic_File" runat="server"></asp:TextBox>
                                        </td>
                                        <td align="right" style="border: thin solid #999966; font-size: x-small;">نام فایل:
                                        </td>
                                        <td style="border: thin solid #999966; font-size: x-small;">
                                            <asp:Label ID="Label_name_File_Text" runat="server">...</asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" width="120" style="border: thin solid #999966; font-size: x-small;">توضیحات مربوط به فایل:
                                        </td>
                                        <td align="right" style="border: thin solid #999966; font-size: x-small;" width="120">
                                            <asp:TextBox ID="TextBox_Description_File" runat="server"></asp:TextBox>
                                        </td>
                                        <td align="right" style="border: thin solid #999966; font-size: x-small;">حجم فایل:
                                        </td>
                                        <td style="border: thin solid #999966; font-size: x-small;">
                                            <asp:Label ID="Label_Capacity_Text_file" runat="server">...</asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" colspan="2">&nbsp; &nbsp;
                                        </td>
                                        <td align="right" style="border: thin solid #999966; font-size: x-small;">پسوند فایل :
                                        </td>
                                        <td style="border: thin solid #999966; font-size: x-small;">
                                            <asp:Label ID="Label_Extention_Text_File" runat="server">...</asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="4">
                                            <hr style="background-color: #2C3E5B; margin-top: 0px;" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="4">&nbsp; &nbsp;
                                            <asp:Button ID="btn_Save_Text_File" runat="server" Font-Names="Tahoma" OnClick="btn_Save_Text_File_Click"
                                                Text="ذخیره فایل" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="4">
                                            <hr style="background-color: #2C3E5B; margin-top: 0px;" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="4">&nbsp; &nbsp; &nbsp;
                                            <asp:Literal ID="Literal_Text_File" runat="server" Text="..."></asp:Literal>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="ContentUserPage">
                                <hr style="background-color: #2C3E5B" />
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                    SelectCommand="SELECT Topic_Textfile, Discreption_Textfile, Date_Upload, ID_User, Path_Textfile FROM Uploads_Textfile_User_tbl WHERE (ID_User = @ID_User) ORDER BY Date_Upload DESC">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="ID_User" SessionField="id_user" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:Repeater ID="Repeater_Text_File" runat="server">
                                    <ItemTemplate>
                                        <a href='<%#Eval("Path_Textfile")%>'>
                                            <img alt='عنوان:<%#Eval("Topic_Textfile") %>   توضیحات:<%#Eval("Discreption_Textfile") %>'
                                                src="images/DOC1.png" class="widthpic"></img></a>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <hr style="background-color: #2C3E5B" />
                            </div>

                        </asp:View>
                        <asp:View ID="View_Picture_User" runat="server">
                            <div class="ContentUserPage">
                                <table align="center" style="width: 874px;">
                                    <tr>
                                        <td colspan="4" align="right" dir="rtl">&nbsp; &nbsp; <span style="color: red">*</span> <span style="color: white">کاربر گرامی
                                                قبل از ذخیره عکس خود می توانید عنوان مربوط به عکس و توضیحات مربوط به آن را وارد
                                                کنید.</span>
                                            <br />
                                            <hr style="background-color: #2C3E5B; margin-top: 0px;" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" height="120" style="border: thin solid #999966; vertical-align: top"
                                            colspan="2">
                                            <asp:Image ID="Image_upload_pic" runat="server" Height="200px" Width="300px" />
                                        </td>
                                        <td align="left" height="120" style="border: thin solid #999966; vertical-align: middle"
                                            colspan="2" dir="rtl">&nbsp;
                                            <asp:FileUpload ID="FileUpload_Picture" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" colspan="4" style="font-size: x-small">
                                            <hr style="background-color: #2C3E5B" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="border: thin solid #999966; font-size: x-small;" width="200">عنوان عکس :
                                        </td>
                                        <td align="left" style="border: thin solid #999966;">&nbsp;<asp:TextBox ID="TextBox_Topic_pic" runat="server"></asp:TextBox>
                                        </td>
                                        <td style="border: thin solid #999966; font-size: x-small;" align="right">نام فایل:
                                        </td>
                                        <td width="200" style="border: thin solid #999966">&nbsp;
                                            <asp:Label ID="Label_name_Picture_File" runat="server" Style="font-size: x-small">...</asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="border: thin solid #999966; font-size: x-small;" width="200">توضیحات مربوط به عکس :
                                        </td>
                                        <td align="left" style="border: thin solid #999966;">&nbsp;<asp:TextBox ID="TextBox_Description" runat="server"></asp:TextBox>
                                        </td>
                                        <td style="border: thin solid #999966; font-size: x-small;" align="right">حجم فایل:
                                        </td>
                                        <td width="200" style="border: thin solid #999966">&nbsp;
                                            <asp:Label ID="Label_Capacity_Picture_File" runat="server" Style="font-size: x-small">...</asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="border: thin solid #999966;" width="200"></td>
                                        <td align="right">&nbsp;
                                        </td>
                                        <td style="border: thin solid #999966; font-size: x-small;" align="right">پسوند فایل :
                                        </td>
                                        <td width="200" style="border: thin solid #999966">&nbsp;
                                            <asp:Label ID="Label_Extention_Picture_File" runat="server" Style="font-size: x-small">...</asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="4">
                                            <hr style="background-color: #2C3E5B" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="4">&nbsp;
                                            <asp:Button ID="btn_Save_Picture_File" runat="server" Font-Names="Tahoma" OnClick="btn_Save_Picture_File_Click"
                                                Style="height: 26px" Text="ذخیره فایل" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="4" dir="rtl">&nbsp;
                                            <asp:Literal ID="Literal_Picture_file" runat="server" Text="..."></asp:Literal>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="ContentUserPage">
                                <hr style="background-color: #2C3E5B" />
                                <asp:SqlDataSource ID="SqlDataSource_Upload_pic" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                    SelectCommand="SELECT ID_User, Path_pic, Topic_Pic, Discreption_Pic, Date_Upload FROM Uploads_Pic_User_tbl WHERE (ID_User = @ID_User)">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="ID_User" SessionField="id_user" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:Repeater ID="Repeater_Picture_File" runat="server">
                                    <ItemTemplate>
                                        <a href='<%#Eval("Path_pic")%>'>
                                            <img class="widthpic" alt='عنوان:<%#Eval("Topic_Pic") %>   توضیحات:<%#Eval("Discreption_Pic") %>' src='<%# Eval("Path_pic") %>' />
                                    </ItemTemplate>
                                </asp:Repeater>
                                <hr style="background-color: #2C3E5B" />
                            </div>
                            <div class="ContentUserPage" align="center">
                                <asp:SqlDataSource ID="SqlDataSource_Show_Pic" runat="server" ConflictDetection="CompareAllValues"
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM Uploads_Pic_User_tbl WHERE (ID = @id)"
                                    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [ID_User], [ID], [Topic_Pic], [Discreption_Pic], [Path_pic], [Date_Upload] FROM [Uploads_Pic_User_tbl]
WHERE ID_User=@ID
"
                                    UpdateCommand="UPDATE Uploads_Pic_User_tbl SET Topic_Pic = @Topic_Pic, Discreption_Pic = @Discreption_Pic, Date_Upload = GETDATE() WHERE (ID = @id)">
                                    <DeleteParameters>
                                        <asp:Parameter Name="id" />
                                    </DeleteParameters>
                                    <SelectParameters>
                                        <asp:SessionParameter Name="ID" SessionField="id_user" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="Topic_Pic" Type="String" />
                                        <asp:Parameter Name="Discreption_Pic" Type="String" />
                                        <asp:Parameter Name="id" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <hr style="background-color: #2C3E5B" />
                            </div>
                        </asp:View>
                        <asp:View ID="View_Movie_User" runat="server">
                            <div class="ContentUserPage">
                                <table align="center" style="width: 874px;">
                                    <tr>
                                        <td colspan="4" align="right" dir="rtl" style="border: thin solid #999966">
                                            <span dir="rtl" style="color: #FF3300">*</span><span style="color: white">کاربر گرامی
                                                قبل از ذخیره فیلم خود می توانیدعنوان و توضیحات مربوط به آن را وارد کنید.</span>
                                            <br />
                                            <hr style="background-color: #2C3E5B; margin-top: 0px;" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" dir="ltr" style="border: thin solid #999966; font-size: x-small;">عنوان فیلم:
                                        </td>
                                        <td style="border: thin solid #999966">
                                            <asp:TextBox ID="TextBox_Topic_Film" runat="server" Font-Names="Tahoma"></asp:TextBox>
                                        </td>
                                        <td colspan="2" dir="rtl" rowspan="2" style="border: thin solid #999966">
                                            <asp:FileUpload ID="FileUpload_Movie_File" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="border: thin solid #999966; font-size: x-small;">توضیحات مربوط به فیلم:
                                        </td>
                                        <td style="border: thin solid #999966">
                                            <asp:TextBox ID="TextBox_Description_Film" runat="server" Font-Names="Tahoma"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">&nbsp;
                                            <hr style="background-color: #2C3E5B; margin-top: 0px;" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="border: thin solid #999966; font-size: x-small;">نام فایل:
                                        </td>
                                        <td colspan="2" style="border: thin solid #999966">
                                            <asp:Label ID="Label_Name_Movie_File" runat="server" Style="font-size: x-small">...</asp:Label>
                                        </td>
                                        <td rowspan="4" align="center" dir="rtl" style="border: thin solid #999966">&nbsp;
                                            <asp:Literal ID="Literal_Movie_File" runat="server" Text="..."></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="border: thin solid #999966; font-size: x-small;">حجم فایل:
                                        </td>
                                        <td colspan="2" style="border: thin solid #999966">
                                            <asp:Label ID="Label_Capacity_Movie_File" runat="server" Style="font-size: x-small">...</asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="border: thin solid #999966; font-size: x-small;">پسوند فایل :
                                        </td>
                                        <td colspan="2" style="border: thin solid #999966">
                                            <asp:Label ID="Label_Extention_Movie_File" runat="server" Style="font-size: x-small">...</asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="3" style="border: thin solid #999966">
                                            <asp:Button ID="Button_Save_Video" runat="server"
                                                OnClick="Button_Save_Video_Click" Text="ذخیره فایل" Font-Names="Tahoma" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="ContentUserPage">
                                <hr style="background-color: #2C3E5B" />
                                <br />
                                <asp:SqlDataSource ID="SqlDataSource_View_Movie" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                    SelectCommand="SELECT [Topic_Movie], [Discreption_Movie], [Path_Movie] FROM [Uploads_Movie_User_tbl] WHERE ([ID_User] = @ID_User)">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="ID_User" SessionField="id_user" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:Repeater ID="Repeater_Video_File" runat="server">
                                    <ItemTemplate>
                                        <%--<a href='<%#Eval("Path_Movie")%>'>
                                           <img class="widthpic" alt='عنوان:<%#Eval("Topic_Movie") %>   توضیحات:<%#Eval("Discreption_Movie") %>' src="images/MovieFile.png" width="110px" height="100px" />
                                            </a>--%>
                                        <video width="420" height="240" controls>
  <source src='<%#Eval("Path_Movie")%>' type="video/flv">
      <source src='<%#Eval("Path_Movie")%>' type="video/mp4">
       <source src='<%#Eval("Path_Movie")%>' type="video/webm">
  <source src='<%#Eval("Path_Movie")%>' type="video/ogg">
  Your browser does not support the video tag.
</video>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <hr style="background-color: #2C3E5B" />
                            </div>
                        </asp:View>
                        <asp:View ID="View_Upload_Files" runat="server">
                            <br />
                            <div style="font-family: tahoma, arial; width: 874px; height: 500px; background-color: #95A0B2; top: 0px; float: left; text-align: center; vertical-align: middle; font-size: medium; left: 0px; right: 0px;"
                                class="File_Content">
                                <marquee behavior="alternate" scrollamount="3"><p dir="rtl" style="font-size: x-small; font-family: tahoma">کاربر گرامی به قوانین و نکات مربوط به آپلود اسناد شخصیتان توجه کنید.</p></marquee>
                                <hr style="background-color: #2C3E5B" />
                                <table style="width: 100%;" border="1">
                                    <tr>
                                        <td>
                                            <img alt="" src="images/My%20Documents.png" width="235" />
                                        </td>
                                        <td align="center">
                                            <img alt="" src="images/My%20Videos.png" width="235" />
                                        </td>
                                        <td dir="rtl" width="250" align="center">
                                            <img alt="" src="images/My%20Images.png" width="235" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="font-family: tahoma, arial; vertical-align: top; text-align: right;"
                                            align="right">
                                            <dl>
                                                <dt dir="rtl"
                                                    style="font-family: tahoma; font-size: x-small; color: #006699; text-align: right; vertical-align: top;">- قوانین مربوط به آپلود فایل های متنی :</dt>
                                            </dl>
                                            <p align="right" dir="rtl" style="font-size: x-small">
                                                &nbsp;<span style="color: red">*</span>فرمت فایل های متنی مورد نظر بایستی PDFو یا&nbsp; 
                                                DOC باشد.
                                            </p>
                                            <p dir="rtl" style="font-size: x-small">
                                                <span style="color: red">*</span>&nbsp;در صورتی که سایز فایل شما بالا می باشد می 
                                                توانید آن را توسط نرم افزار های فشرده سازی ،فشرده نمایید و با پسوند Zipو یا Rar 
                                                آپلود کنید.
                                            </p>

                                            <p dir="rtl" style="font-size: x-small">
                                                &nbsp;
                                            </p>

                                        </td>
                                        <td align="right" style="font-family: tahoma, arial; vertical-align: top">
                                            <dl>
                                                <dt dir="rtl" style="font-family: tahoma; font-size: x-small; color: #006699">- قوانین
                                                    مربوط به آپلود کلیپ های ویدیویی :</dt>
                                            </dl>
                                            <p dir="rtl" style="font-size: x-small">
                                                <br />
                                                <span style="color: red">*</span>فرمت کلیپ های ویدیویی مورد نظر بایستی FLV یا&nbsp;
                                                MP4 و یا سایر فرمت های ویدیویی باشد.
                                            </p>
                                            <p dir="rtl" style="font-size: x-small">
                                                <span style="color: red">*</span> در صورتی که سایز فایل شما بالا می باشد می 
                                                توانید آن را توسط نرم افزار های فشرده سازی ،فشرده نمایید و با پسوند Zipو یا Rar 
                                                آپلود کنید.
                                            </p>
                                            <p dir="rtl" style="font-size: x-small">
                                                &nbsp;
                                            </p>
                                        </td>
                                        <td dir="rtl" style="font-family: tahoma, arial; font-size: x-small; text-align: right; vertical-align: top;"
                                            width="250">
                                            <dl>
                                                <dt style="font-family: tahoma; font-size: x-small; color: #336699;">-قوانین مربوط به
                                                    آپلود تصاویر :</dt>
                                            </dl>
                                            <p>
                                                <br />
                                                <span style="color: red">*</span>فرمت عکس مورد نظر بایستی png و یا&nbsp; jpeg و
                                                یا سایر فرمت های رایج باشد.
                                            </p>
                                            <p dir="rtl" style="font-size: x-small">
                                                <span style="color: red">*</span> در صورتی که سایز فایل شما بالا می باشد می 
                                                توانید آن را توسط نرم افزار های فشرده سازی ،فشرده نمایید و با پسوند Zipو یا Rar 
                                                آپلود کنید.
                                            </p>
                                            <p dir="rtl" style="font-size: x-small">
                                                &nbsp;
                                            </p>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </asp:View>
                        <asp:View ID="View_Download_Files" runat="server">
                            <div class="ContentUserPage" align="center">
                                <div class="ContentUserPage" align="center" dir="rtl">

                                    <br />
                                    <span style="color: red">*</span> کاربر گرامی آنچه که در لیست زیر به نمایش 
                                درآمده است ،فایل هایی می باشد که آپلود کرده اید؛در اینجا شما می توانید اطلاعات<br />
                                    خود را ویرایش کنید.
                                <hr style="background-color: #2C3E5B" />
                                    <br />
                                    «فایل های متنی»<br />
                                    <asp:GridView ID="GridView_Textfile_User0" runat="server"
                                        AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource_Text_File"
                                        ForeColor="#333333" GridLines="None" AllowPaging="True" PageSize="8"
                                        DataKeyNames="ID" Width="874px" EmptyDataText="هیچ فایلی آپلود نشده است."
                                        OnRowDataBound="GridView_Textfile_User0_RowDataBound">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:CommandField CancelText="انصراف" DeleteText="حذف" EditText="ویرایش"
                                                SelectText="انتخاب" ShowDeleteButton="True" ShowEditButton="True"
                                                UpdateText="ثبت" />
                                            <asp:BoundField DataField="Topic_Textfile" HeaderText="عنوان فایل"
                                                SortExpression="Topic_Textfile" />
                                            <asp:BoundField DataField="ID" HeaderText="ID"
                                                SortExpression="ID" InsertVisible="False" ReadOnly="True"
                                                Visible="False" />
                                            <asp:BoundField DataField="Discreption_Textfile" HeaderText="توضیحات"
                                                SortExpression="Discreption_Textfile" />
                                            <asp:TemplateField HeaderText="تاریخ آپلود">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl_Date" runat="server" Text='<%# Eval("Date_Upload") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
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
                                    <asp:SqlDataSource ID="SqlDataSource_Text_File" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                        DeleteCommand="DELETE FROM Uploads_Textfile_User_tbl WHERE (ID = @ID)" SelectCommand="SELECT Topic_Textfile, ID, Discreption_Textfile, Path_Textfile, Date_Upload FROM Uploads_Textfile_User_tbl
WHERE ID_USER=@id"
                                        UpdateCommand="UPDATE Uploads_Textfile_User_tbl SET Topic_Textfile = @topic, Discreption_Textfile = @Description, Path_Textfile = @path, Date_Upload = GETDATE() WHERE (ID = @ID)">
                                        <DeleteParameters>
                                            <asp:Parameter Name="ID" />
                                        </DeleteParameters>
                                        <SelectParameters>
                                            <asp:SessionParameter Name="id" SessionField="id_user" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="topic" />
                                            <asp:Parameter Name="Description" />
                                            <asp:Parameter Name="path" />
                                            <asp:Parameter Name="ID" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <hr style="background-color: #2C3E5B" />
                                    <br />
                                    «فایل های تصویری»<asp:GridView ID="GridView_Picture_User" runat="server" AllowPaging="True"
                                        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID"
                                        DataSourceID="SqlDataSource_Show_Pic" ForeColor="#333333" GridLines="None"
                                        PageSize="8" EmptyDataText="هیچ فایل تصویری آپلود نشده است." Width="874px"
                                        OnRowDataBound="GridView_Picture_User_RowDataBound" >
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:CommandField CancelText="انصراف" DeleteText="حذف" EditText="ویرایش"
                                                InsertText="درج" ShowDeleteButton="True" ShowEditButton="True"
                                                UpdateText="ثبت" />
                                            <asp:BoundField DataField="ID" HeaderText="ID"
                                                SortExpression="ID" Visible="False" InsertVisible="False"
                                                ReadOnly="True" />
                                            <asp:BoundField DataField="Topic_Pic" HeaderText="عنوان"
                                                SortExpression="Topic_Pic" />
                                            <asp:BoundField DataField="Discreption_Pic" HeaderText="توضیحات"
                                                SortExpression="Discreption_Pic" />
                                            <asp:TemplateField HeaderText="تاریخ آپلود">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl_Date" runat="server" Text='<%# Eval("Date_Upload") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
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
                                    <hr style="background-color: #2C3E5B" />
                                    <br />
                                    «فایل های ویدیویی»<br />
                                    <asp:GridView ID="GridView_Movie_User" runat="server" AllowPaging="True"
                                        AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2"
                                        EmptyDataText="هیچ فایل ویدیویی آپلود نشده است." ForeColor="#333333"
                                        GridLines="None" PageSize="8" DataKeyNames="ID" Width="874px"
                                        OnRowDataBound="GridView_Movie_User_RowDataBound">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:CommandField CancelText="انصراف" DeleteText="حذف" EditText="ویرایش"
                                                InsertText="درج" ShowDeleteButton="True" ShowEditButton="True"
                                                UpdateText="ثبت" />
                                            <asp:BoundField DataField="Topic_Movie" HeaderText="عنوان"
                                                SortExpression="Topic_Movie" />
                                            <asp:BoundField DataField="Discreption_Movie" HeaderText="توضیحات"
                                                SortExpression="Discreption_Movie" />
                                            <asp:TemplateField HeaderText="تاریخ آپلود">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl_Date" runat="server" Text='<%# Eval("Date_Upload") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
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
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                        SelectCommand="SELECT Topic_Movie, Discreption_Movie, Date_Upload, ID FROM Uploads_Movie_User_tbl WHERE (ID_User = @ID_User)"
                                        DeleteCommand="DELETE FROM Uploads_Movie_User_tbl WHERE (ID = @id)"
                                        UpdateCommand="UPDATE Uploads_Movie_User_tbl SET Topic_Movie = @topic, Discreption_Movie = @description,Date_Upload=GETDATE() WHERE (ID = @id)">
                                        <DeleteParameters>
                                            <asp:Parameter Name="id" />
                                        </DeleteParameters>
                                        <SelectParameters>
                                            <asp:SessionParameter Name="ID_User" SessionField="id_user" Type="Int32" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="topic" />
                                            <asp:Parameter Name="description" />
                                            <asp:Parameter Name="id" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <br />
                                </div>

                            </div>
                        </asp:View>
                    </asp:MultiView>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
