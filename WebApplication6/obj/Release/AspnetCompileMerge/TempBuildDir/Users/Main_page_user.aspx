<%@ Page Title="" Language="C#" MasterPageFile="~/Users/Users_master.Master" AutoEventWireup="true"
    CodeBehind="Main_page_user.aspx.cs" Inherits="WebApplication6.Users.WebForm1" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="mainContent" align="center">

        <div style="font-family: tahoma, arial; font-size: small; vertical-align: top; width: 874px;"
            align="center">
            <br />
            <br />
            <asp:LinkButton ID="LinkButton_ListPost" CssClass="link_style" runat="server" OnClick="LinkButton_ListPost_Click">‌‌آخرین مطالب درج شده</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton_ListVideo" CssClass="link_style" runat="server" OnClick="LinkButton_ListVideo_Click">آخرین فیلم ها</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton_ListPic" CssClass="link_style" runat="server" OnClick="LinkButton_ListPic_Click">آخرین تصاویر</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>

        <asp:MultiView ID="MultiView_Main" runat="server">
            <asp:View ID="View_Main" runat="server">
                <div style="font-family: tahoma, arial; font-size: small; vertical-align: top; width: 874px;" align="center">
                    <table style="width: 100%; height: 484px;">
                        <tr>
                            <td dir="rtl" align="right" style="height: 477px">
                                <span style="color: red">
                                    <br />
                                    *</span> کاربر گرامی در صورتی که سوال امنیتی و جواب آن 
                                را تعیین نکرده اید می توانید با مراجعه به قسمت ویرایش اطلاعات،سوال و جواب آن را 
                                تعیین و یا تغییر دهید.<br />
                                <br />
                                <br />
                                <span style="color: red">*</span> در صورتی که عکسی را برای حساب کاربری خود 
                                انتخاب نکرده اید می توانید در قسمت ویرایش اطلاعات،عکس خود را انتخاب و یا تغییر 
                                دهید.<br />
                                <br />
                                <br />
                                <span style="color: red">* </span>برای تغییر رمز عبور خود می توانید به قسمت 
                                تنظیمات رفته،رمز خود را تغییر دهید؛همچنین می توانید مجوزهای مربوط به سطح دسترسی 
                                کاربران و دوستان خود را تعیین و یا تغییر دهید.<br />
                                <br />
                                <br />
                                <span style="color: red">*</span> برای آپلود فایل ، عکس و فایل های متنی خود می 
                                توانید با مراجعه به قسمت&nbsp; فایل ها ، فایل مورد نظر خود را آپلود کنید.<br />
                                <br />
                                <br />
                                <span style="color: red">*</span> برای جستجوی کاربر و یا گروه مورد نظر خود&nbsp; می 
                                توانید به بخش&nbsp; جستجو مراجعه فرمایید. همچنین برای دوست شدن با سایر کاربران و 
                                عضویت در گروه ها&nbsp; بایستی از بخش جستجو استفاده نمایید.<br />
                                <br />
                                <br />
                                <span style="color: red">*</span> برای مشاهده دوستان خود و همچنین مدیریت دوستی 
                                های خود از قسمت دوستان استفاده نمایید.
                                <br />
                                <br />
                                <br />
                                <span style="color: red">*</span> برای مشاهده و مدیریت پیام های دریافتی و ارسالی 
                                از قسمت پیام ها استفاده کنید.<br />
                                <br />
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:View>
            <asp:View ID="View_ListPost" runat="server">
                <div class="mainContent_message" dir="rtl">
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        SelectCommand="SELECT User_tbl.Account_name,User_tbl.User_pic, Post_Users_tbl.ID_User, Post_Users_tbl.Title, Post_Users_tbl.Body, Post_Users_tbl.DT_Create, Post_Users_tbl.ID FROM Post_Users_tbl  INNER JOIN User_tbl ON Post_Users_tbl.ID_User =User_tbl.ID
WHERE (Post_Users_tbl.ID_User IN (SELECT DISTINCT  User_tbl.ID  FROM User_tbl INNER JOIN Request_Friend_tbl ON Request_Friend_tbl.Response_User_ID = User_tbl.ID  WHERE (Request_Friend_tbl.Request_User_ID = @id) 
 AND (Request_Friend_tbl.Block='false')
UNION
SELECT DISTINCT  User_tbl.ID  FROM User_tbl INNER JOIN Request_Friend_tbl ON Request_Friend_tbl.Request_User_ID = User_tbl.ID  WHERE (Request_Friend_tbl.Response_User_ID = @id)  
 AND (Request_Friend_tbl.Block='false')
)
)
">
                        <SelectParameters>
                            <asp:SessionParameter Name="id" SessionField="id_user" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:Repeater ID="Repeater_post" runat="server" DataSourceID="SqlDataSource2"
                        OnItemDataBound="Repeater_post_ItemDataBound">
                        <HeaderTemplate>
                            <p dir="rtl" align="center" style="font-family: tahoma, arial; font-size: small; color: #FF0000; vertical-align: middle; text-align: center">
                                «پست های درج شده»
                            </p>
                            <hr style="background-color: #2C3E5B" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <div class="Post">
                                <div>
                                    <asp:Image ID="Image_user" runat="server" ImageUrl='<%#Eval("User_pic")%>' AlternateText='<%#Eval("Account_name") %>' CssClass="imagep" />
                                </div>
                                <div>
                                    کاربر:<asp:Label ID="Label4" runat="server" Text='<%#Eval("Account_name") %>'></asp:Label>
                                </div>
                                <div>
                                    <p dir="rtl" style="text-align: right">
                                        <span style="font-size: x-small; color: #666666;">تاریخ:</span><asp:Label ID="lbl_date"
                                            runat="server" Text='<%#Eval("DT_Create")%>'></asp:Label>
                                    </p>
                                </div>
                                <div dir="rtl" style="text-align: right">
                                    <pre><span style="font-size: x-small; color: #666666;">عنوان پست:</span><%#Eval("Title")%></pre>
                                </div>
                                <div dir="rtl" style="text-align: right">
                                    <pre><span style="font-size: x-small; color: #666666;">متن پست:</span><%#Eval("Body")%></pre>
                                </div>

                                <br />
                                <a class="link_style" href="Main_page_user.aspx?post_id=<%#Eval("ID") %>&mode=comment" dir="rtl">...نظرات</a>
                            </div>
                            <hr style="background-color: #2C3E5B" />
                        </ItemTemplate>
                    </asp:Repeater>
                </div>


            </asp:View>
            <asp:View ID="View_Comment" runat="server">
                <asp:SqlDataSource ID="SqlDataSource_Comments_Post" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT User_tbl.ID, CASE WHEN Comment_Users_tbl.User_ID = User_tbl.ID THEN User_tbl.Name + ' ' + User_tbl.Family END AS USERNAME,Account_name, User_tbl.User_pic, Comment_Users_tbl.Body, Comment_Users_tbl.Create_date FROM Comment_Users_tbl INNER JOIN User_tbl ON Comment_Users_tbl.User_ID = User_tbl.ID WHERE  (Comment_Users_tbl.Post_ID = @Post_ID)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="Post_ID" QueryStringField="post_id" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <hr style="background-color: #2C3E5B; margin-top: 0px;" />


                <div dir="rtl">
                    <div dir="rtl">
                        <table style="width: 100%;">
                            <tr>
                                <td>
                                    <span class="style1">*</span> <span class="style2">کاربر گرامی شما در این بخش از سایت
                                        می توانیدنظر خود را درباره پست مورنظر اعلام نمایید.
                                        <br />
                                    </span>
                                    <hr style="background-color: #2C3E5B; margin-top: 0px;" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="style3">عنوان پست:</span><asp:Label ID="Label_topic_post_comment" runat="server"
                                        Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="style3">متن پست:</span><asp:Literal ID="Literal_body_post_comment" runat="server"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="style4">تاریخ ایجاد:</span><asp:Label ID="Label_date_create_post_comment"
                                        runat="server" Text="Label"></asp:Label>
                                    <asp:Repeater ID="Repeater_Comment_post" runat="server" OnItemDataBound="Repeater_Comment_post_ItemDataBound" OnItemCommand="Repeater_Comment_post_ItemCommand" >
                                        <ItemTemplate>
                                            <table style="width: 874px; height: 150px;">
                                                <tr>
                                                    <td rowspan="2" align="right">
                                                        <table style="width: 250px;">
                                                            <tr>
                                                                <td rowspan="3" style="text-align: right" width="90px">
                                                                    <asp:Image ID="Image_Comment_user" runat="server" ImageUrl='<%#Eval("User_pic")%>' CssClass="imagep" />
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
                                                        <span class="style3" dir="rtl" style="text-align: left; max-width: 140px">متن نظر:</span>
                                                    </td>
                                                    <td dir="rtl" align="right" style="text-align: right; max-width: 360px" width="360px">
                                                        <asp:Literal ID="Literal_body" runat="server" Text='<%#Eval("Body")%>'></asp:Literal>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span class="style3" dir="rtl" style="text-align: left; max-width: 140px;">تاریخ:</span>
                                                    </td>
                                                    <td dir="rtl" align="right" style="text-align: right; max-width: 360px" width="360px">
                                                        <asp:Literal ID="Literal_date" runat="server" Text='<%#Eval("Create_date")%>'></asp:Literal>
                                                    </td>
                                                </tr>
                                            </table>
                                            <hr style="background-color: #2C3E5B; margin-top: 0px;" />
                                            <br />
                                        </ItemTemplate>
                                    </asp:Repeater>
                    </div>
                    <div style="font-family: tahoma, arial; font-size: small; vertical-align: top; width: 874px;" align="center">
                        <table style="width: 100%;">
                            <tr>
                                <td colspan="2" dir="rtl">
                                    <span class="style1">*</span> <span class="style2">کاربر گرامی شما در این قسمت می توانید
                                        متن نظر خود را وارد کنید.</span>
                                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </td>
                            </tr>
                            <tr>
                                <td dir="rtl" align="left" width="100">عنوان متن:
                                </td>
                                <td dir="rtl">
                                    <telerik:RadEditor ID="RadEditor_Comment" runat="server" EnableResize="False" Height="250px"
                                        Width="650px">
                                        <Tools>
                                            <telerik:EditorToolGroup>
                                                <telerik:EditorSplitButton Name="Undo">
                                                </telerik:EditorSplitButton>
                                                <telerik:EditorSplitButton Name="Redo">
                                                </telerik:EditorSplitButton>
                                                <telerik:EditorSeparator />
                                                <telerik:EditorTool Name="Cut" />
                                                <telerik:EditorTool Name="Copy" />
                                                <telerik:EditorTool Name="Paste" ShortCut="CTRL+V" />
                                                <telerik:EditorTool Name="SelectAll" />
                                                <telerik:EditorSeparator />
                                                <telerik:EditorTool Name="InsertDate" />
                                                <telerik:EditorTool Name="InsertTime" />
                                            </telerik:EditorToolGroup>
                                            <telerik:EditorToolGroup>
                                                <telerik:EditorTool Name="Bold" />
                                                <telerik:EditorTool Name="Italic" />
                                                <telerik:EditorTool Name="Underline" />
                                                <telerik:EditorTool Name="StrikeThrough" />
                                                <telerik:EditorSeparator />
                                                <telerik:EditorTool Name="JustifyLeft" />
                                                <telerik:EditorTool Name="JustifyCenter" />
                                                <telerik:EditorTool Name="JustifyRight" />
                                                <telerik:EditorTool Name="JustifyFull" />
                                                <telerik:EditorTool Name="JustifyNone" />
                                                <telerik:EditorSeparator />
                                                <telerik:EditorTool Name="ConvertToLower" />
                                                <telerik:EditorTool Name="ConvertToUpper" />
                                            </telerik:EditorToolGroup>
                                            <telerik:EditorToolGroup Tag="DropdownToolbar">
                                                <telerik:EditorSplitButton Name="ForeColor">
                                                </telerik:EditorSplitButton>
                                                <telerik:EditorSplitButton Name="BackColor">
                                                </telerik:EditorSplitButton>
                                                <telerik:EditorSeparator />
                                                <telerik:EditorDropDown Name="FontName">
                                                </telerik:EditorDropDown>
                                                <telerik:EditorDropDown Name="FontSize">
                                                </telerik:EditorDropDown>
                                                <telerik:EditorDropDown Name="RealFontSize">
                                                </telerik:EditorDropDown>
                                            </telerik:EditorToolGroup>
                                        </Tools>
                                        <Content>
                                        </Content>
                                        <ImageManager EnableImageEditor="False" EnableThumbnailLinking="False" />
                                    </telerik:RadEditor>
                                    &nbsp;&nbsp;
                                </td>

                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <asp:Button ID="Button_Comment" runat="server" Font-Names="Tahoma" Font-Size="Small" Text="ثبت نظر" OnClick="Button_Comment_Click" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </asp:View>
            <asp:View ID="View_Picture" runat="server">
                <div class="ContentUserPage">
                    <hr style="background-color: #2C3E5B" />
                    <asp:SqlDataSource ID="SqlDataSource_Upload_pic" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        SelectCommand="SELECT User_tbl.Account_name,User_tbl.User_pic, Uploads_Pic_User_tbl.ID_User, Uploads_Pic_User_tbl.Path_pic, Uploads_Pic_User_tbl.Topic_Pic, Uploads_Pic_User_tbl.Date_Upload, Uploads_Pic_User_tbl.Discreption_Pic FROM Uploads_Pic_User_tbl  INNER JOIN User_tbl ON Uploads_Pic_User_tbl.ID_User =User_tbl.ID
WHERE (Uploads_Pic_User_tbl.ID_User IN (SELECT DISTINCT  User_tbl.ID  FROM User_tbl INNER JOIN Request_Friend_tbl ON Request_Friend_tbl.Response_User_ID = User_tbl.ID  WHERE (Request_Friend_tbl.Request_User_ID = @id)  AND (Request_Friend_tbl.Block='false')
UNION
SELECT DISTINCT  User_tbl.ID  FROM User_tbl INNER JOIN Request_Friend_tbl ON Request_Friend_tbl.Request_User_ID = User_tbl.ID  WHERE (Request_Friend_tbl.Response_User_ID =@id)  AND (Request_Friend_tbl.Block='false') )
)
">
                        <SelectParameters>
                            <asp:SessionParameter Name="id" SessionField="id_user" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:Repeater ID="Repeater_Picture_File" runat="server" OnItemDataBound="Repeater_Picture_File_ItemDataBound">
                        <ItemTemplate>
                             <div>
                                    <asp:Image ID="Image_user" runat="server" ImageUrl='<%#Eval("User_pic")%>' AlternateText='<%#Eval("Account_name") %>' CssClass="imagep"/>
                                </div>
                                <div>
                                    کاربر:<asp:Label ID="Label4" runat="server" Text='<%#Eval("Account_name") %>'></asp:Label>
                                </div>
                            <div>
                                    <p dir="rtl" style="text-align: right">
                                        <span style="font-size: x-small; color: #666666;">عنوان:</span><asp:Label ID="Label1"
                                            runat="server" Text='<%#Eval("Topic_Pic")%>'></asp:Label>
                                    </p>
                                </div>
                                <div>
                                    <p dir="rtl" style="text-align: right">
                                        <span style="font-size: x-small; color: #666666;">تاریخ:</span><asp:Label ID="lbl_date"
                                            runat="server" Text='<%#Eval("Date_Upload")%>'></asp:Label>
                                    </p>
                                </div>
                            <a href='<%#Eval("Path_pic")%>'>
                                <img class="widthpic2" alt='عنوان:<%#Eval("Topic_Pic") %>   توضیحات:<%#Eval("Discreption_Pic") %>' src='<%# Eval("Path_pic") %>' />
                                </a>
                                 <div>
                                    <p dir="rtl" style="text-align: right">
                                        <span style="font-size: x-small; color: #666666;">توضیحات:</span><asp:Label ID="Label2"
                                            runat="server" Text='<%#Eval("Discreption_Pic")%>'></asp:Label>
                                    </p>
                                </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <hr style="background-color: #2C3E5B" />
                </div>
            </asp:View>
            <asp:View ID="View_Video" runat="server">
                              <div class="ContentUserPage">

                  <asp:SqlDataSource ID="SqlDataSource_View_Movie" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT User_tbl.Account_name,User_tbl.User_pic, Uploads_Movie_User_tbl.ID_User, Uploads_Movie_User_tbl.Path_Movie, Uploads_Movie_User_tbl.Topic_Movie, Uploads_Movie_User_tbl.Date_Upload, Uploads_Movie_User_tbl.Discreption_Movie FROM Uploads_Movie_User_tbl  INNER JOIN User_tbl ON Uploads_Movie_User_tbl.ID_User =User_tbl.ID
WHERE (Uploads_Movie_User_tbl.ID_User IN (SELECT DISTINCT  User_tbl.ID  FROM User_tbl INNER JOIN Request_Friend_tbl ON Request_Friend_tbl.Response_User_ID = User_tbl.ID  WHERE (Request_Friend_tbl.Request_User_ID =@id) 
 AND (Request_Friend_tbl.Block='false')
UNION
SELECT DISTINCT  User_tbl.ID  FROM User_tbl INNER JOIN Request_Friend_tbl ON Request_Friend_tbl.Request_User_ID = User_tbl.ID  WHERE (Request_Friend_tbl.Response_User_ID =@id)  AND (Request_Friend_tbl.Block='false') )
)
">
                    <SelectParameters>
                        <asp:SessionParameter Name="id" SessionField="id_user" />
                    </SelectParameters>
                </asp:SqlDataSource>
                                                  <hr style="background-color: #2C3E5B" />
<br />
                <asp:Repeater ID="Repeater_Video_File" runat="server" OnItemDataBound="Repeater_Video_File_ItemDataBound">
                    <ItemTemplate>
                         <div>
                                    <asp:Image ID="Image_user" runat="server" ImageUrl='<%#Eval("User_pic")%>' AlternateText='<%#Eval("Account_name") %>' CssClass="imagep" />
                                </div>
                                <div>
                                    کاربر:<asp:Label ID="Label4" runat="server" Text='<%#Eval("Account_name") %>'></asp:Label>
                                </div>
                            <div>
                                    <p dir="rtl" style="text-align: right">
                                        <span style="font-size: x-small; color: #666666;">عنوان:</span><asp:Label ID="Label1"
                                            runat="server" Text='<%#Eval("Topic_Movie")%>'></asp:Label>
                                    </p>
                                </div>
                                <div>
                                    <p dir="rtl" style="text-align: right">
                                        <span style="font-size: x-small; color: #666666;">تاریخ:</span><asp:Label ID="lbl_date"
                                            runat="server" Text='<%#Eval("Date_Upload")%>'></asp:Label>
                                    </p>
                                </div>
                        <%--<a href='<%#Eval("Path_Movie")%>'>
                                           <img class="widthpic" alt='عنوان:<%#Eval("Topic_Movie") %>   توضیحات:<%#Eval("Discreption_Movie") %>' src="images/MovieFile.png" width="110px" height="100px" />
                                            </a>--%>
                        <video width="800" height="400" controls>
  <source src='<%#Eval("Path_Movie")%>' type="video/flv">
      <source src='<%#Eval("Path_Movie")%>' type="video/mp4">
       <source src='<%#Eval("Path_Movie")%>' type="video/webm">
  <source src='<%#Eval("Path_Movie")%>' type="video/ogg">
  Your browser does not support the video tag.
</video>
                        <p dir="rtl" style="text-align: right">
                                        <span style="font-size: x-small; color: #666666;">توضیحات:</span><asp:Label ID="Label2"
                                            runat="server" Text='<%#Eval("Discreption_Movie")%>'></asp:Label>
                                    </p>
                    </ItemTemplate>
                </asp:Repeater>
    </div>
    </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
