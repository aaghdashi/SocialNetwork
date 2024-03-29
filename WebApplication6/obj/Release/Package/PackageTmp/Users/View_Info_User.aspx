﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View_Info_User.aspx.cs"
    Inherits="WebApplication6.Users.View_Info_User" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: red;
        }
        .style2
        {
            color: white;
        }
        .style3
        {
            font-size: small;
            color: #666666;
        }
        .style4
        {
            font-size: small;
            color: #666666;
        }
        .Default.reWrapper
        {
            border: solid 1px #828282;
        }
        
        .Default.RadEditor
        {
            background-color: #ececec;
        }
        
        .reWrapper_corner
        {
            font-size: 1px;
            line-height: 1px;
        }
        
        .reWrapper_center
        {
            font-size: 1px;
            line-height: 1px;
        }
        
        .reLeftVerticalSide
        {
            padding: 1px;
        }
        
        .reLeftVerticalSide
        {
            font-size: 1px;
            line-height: 1px;
        }
        
        .RadEditor.reWrapper .reToolCell
        {
            vertical-align: top; /* Needed to position the toolbar wrapper at the top - and then set margin to it! */
            padding-bottom: 1px;
        }
        
        .reToolbarWrapper
        {
            margin-top: 0;
        }
        
        .reRightVerticalSide
        {
            padding: 1px;
        }
        
        .reRightVerticalSide
        {
            font-size: 1px;
            line-height: 1px;
        }
        
        .Default.RadEditor .reContentCell
        {
            border: solid 1px #828282;
        }
        
        .reContentCell
        {
            background-color: #fff;
        }
        
        .Default.RadEditor .reEditorModes
        {
            background-color: #ececec;
        }
        
        .reEditorModes
        {
            float: left;
            padding: 1px 0 1px 0 !important; /* Reset CSS */
        }
        
        .reEditorModes ul
        {
            padding: 0 !important; /* Reset CSS */
            margin: 0 !important; /* Reset CSS */
            list-style: none !important; /* Reset CSS */
        }
        
        .reEditorModes li
        {
            float: left !important; /* Reset CSS */
        }
        
        .reEditorModes li
        {
            padding: 0 !important; /* Reset CSS */
            margin: 0 !important; /* Reset CSS */
            list-style: none !important; /* Reset CSS */
        }
        
        .Default .reMode_selected
        {
            background-image: url('mvwres://Telerik.Web.UI, Version=2011.1.519.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.Editor.ToolbarVerticalSprites.gif');
            background-position: -948px 0;
        }
        
        .reMode_selected
        {
            background-repeat: no-repeat;
        }
        
        .reBottomZone
        {
            text-align: right;
            vertical-align: bottom;
        }
    </style>
    <link href="CSS/User_style_page.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript">
// <![CDATA[

        function Button_Return_onclick() {
            history.go(-1);
        }

        function Button_Ret_onclick() {
            history.go(-1);

        }

// ]]>
    </script>
</head>
<body style="font-family: Tahoma, arial; text-align: center; background-image: url('images/back.jpg');
    background-repeat: repeat;">
    <form id="form1" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
    </telerik:RadScriptManager>
    <div style="font-family: tahoma, arial; font-size: small; font-style: normal; font-weight: normal;
        vertical-align: middle; width: 1024px; height: 140px; top: 10px; right: 200px;
        position: absolute; float: right; background-color: #43577B;">
        <table align="right" class="Headertable" dir="rtl">
            <tr>
                <td rowspan="4" width="100">
                    <asp:Image ID="Img_User0" runat="server" Height="120px" Width="100px" />
                </td>
                <td height="22" style="font-family: tahoma; font-size: x-small; text-align: right;
                    vertical-align: middle; color: #FFFFFF;" width="400">
                    نام :<asp:Label ID="Label_name" runat="server" Text="Label"></asp:Label>
                </td>
                <td height="22px" style="font-family: tahoma; font-size: x-small; text-align: right;
                    vertical-align: middle; color: #FFFFFF;" width="400">
                    امروز :<asp:Label ID="Label_Date_today" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td height="22" style="font-family: tahoma; font-size: x-small; text-align: right;
                    vertical-align: middle; color: #FFFFFF;" width="400">
                    نام خانوادگی :<asp:Label ID="Label_family" runat="server" Text="Label"></asp:Label>
                </td>
                <td dir="rtl" height="22px" style="font-family: tahoma; font-size: x-small; text-align: right;
                    vertical-align: middle; color: #FFFFFF;" width="400">
                    مصادف با :<asp:Label ID="Label_Date_equal" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td height="22" style="font-family: tahoma; font-size: x-small; text-align: right;
                    vertical-align: middle; color: #FFFFFF;" width="400">
                    نام کاربری :<asp:Label ID="Label_name_account" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td  height="48" style="vertical-align: top" width="400">
                   
                </td>
                <td align="left">
                     <a href="Main_page_user.aspx" target="_self" class="link_style visited_link" style="border-style: none"><asp:Image ID="Image_return" runat="server" ImageUrl="~/images/main_p.png" CssClass="link_style visited_link"
                                Height="48" Width="48" /></a>
                </td>
            </tr>
        </table>
    </div>
    <div style="font-family: tahoma, arial; font-size: small; font-weight: normal; text-align: right;
        background-color: #9CAAC1; width: 1024px; top: 160px; right: 200px; float: right;
        position: absolute; min-height: 400px; vertical-align: top;">
        <div align="center">
            <asp:ImageButton ID="ImageButton_Info" runat="server" AlternateText="مشخصات" ImageUrl="~/Users/images/Window Information.png" ToolTip="مشخصات"
                Height="42px" Width="42px" OnClick="ImageButton_Info_Click" />
            <asp:ImageButton ID="ImageButton_Files" runat="server" AlternateText="فایل ها" Height="42px" ToolTip="فایل ها"
                ImageUrl="~/Users/images/folder.png" Width="42px" OnClick="ImageButton_Files_Click" />
            <asp:ImageButton ID="ImageButton_Posts" runat="server" AlternateText="پست ها" ImageUrl="~/Users/images/Comment.png" ToolTip="پست ها"
                Height="40px" Width="40px" OnClick="ImageButton_Posts_Click" />
            <asp:ImageButton ID="ImageButton_Friends" runat="server" AlternateText="دوستان" ImageUrl="~/Users/images/icon_friend.png" ToolTip="دوستان"
                Width="42px" OnClick="ImageButton_Friends_Click" />
            <hr style="background-color: #2C3E5B; margin-top: 0px;" />
        </div>
        <div>
            <asp:MultiView ID="MultiView_Info_User" runat="server" ActiveViewIndex="0">
                <asp:View ID="View_Directive" runat="server">
                    <div align="right" dir="rtl" >
                        <br />
                        <br />
                        <span class="style1">*</span> برای مشاهده مشخصات کاربر مورد نظر بر روی دکمه مشخصات
                        کلیک نمایید.<br />
                        <br />
                        <hr style="background-color: #2C3E5B; margin-top: 0px;" />
                        <br />
                        <span class="style1">*</span> برای مشاهده فایل هایی که کاربر مورد نظر شما آپلود
                        کرده است ، بر روی دکمه فایل ها کلیک نمایید.<br />
                        <br />
                        <hr style="background-color: #2C3E5B; margin-top: 0px;" />
                        <br />
                        <span class="style1">*</span> برای مشاهده پست های کاربر مورد نظر بر روی دکمه پست
                        ها کلیک نمایید.<br />
                        <br />
                        <hr style="background-color: #2C3E5B; margin-top: 0px;" />
                        <br />
                        <span class="style1">*</span> برای مشاهده دوستان کاربر انتخابی خود بر روی دکمه دوستان
                        کلیک نمایید.<br />
                        <br />
                        <hr style="background-color: #2C3E5B; margin-top: 0px;" />
                        <br />
                        <span class="style1">*</span>برای مشاهده گروه هایی که کاربر انتخابی ایجاد کرده است
                        بر روی دکمه گروه ها کلیک نمایید.<br />
                        <br />
                        <br />
                    </div>
                </asp:View>
                <asp:View ID="View_info" runat="server">
                    <div >
                        <table align="center" dir="rtl" style="height: 500px; font-family: tahoma, arial;
                            font-size: small; font-weight: normal; font-style: normal; color: #000000; text-align: center;
                            vertical-align: middle; width: 100%;">
                            <tr>
                                <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                                    height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                                    border-bottom-color: #FFFFFF;">
                                    نام:<asp:Label ID="Label_Name_user" runat="server" Text="Label"></asp:Label>
                                </td>
                                <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                                    height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                                    border-bottom-color: #FFFFFF;">
                                    نام خانوادگی:<asp:Label ID="Label_Family_User" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                                    height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                                    border-bottom-color: #FFFFFF;">
                                    نام کاربری :<asp:Label ID="Label_Account_Name_User" runat="server" Text="Label"></asp:Label>
                                </td>
                                <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                                    height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                                    border-bottom-color: #FFFFFF;">
                                    جنسیت :<asp:Label ID="Label_Gender_User" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                                    height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                                    border-bottom-color: #FFFFFF;">
                                    تاریخ تولد :
                                    <asp:Label ID="Label_Birth_Date_User" runat="server" Text="Label"></asp:Label>
                                </td>
                                <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                                    height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                                    border-bottom-color: #FFFFFF;">
                                    محل تولد :
                                    <asp:Label ID="Label_City_Birth_User" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                                    height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                                    border-bottom-color: #FFFFFF;">
                                    میزان تحصیلات :<asp:Label ID="Label_Education_User" runat="server" Text="Label"></asp:Label>
                                </td>
                                <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                                    height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                                    border-bottom-color: #FFFFFF;">
                                    استان :
                                    <asp:Label ID="Label_Ostan_User" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                                    height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                                    border-bottom-color: #FFFFFF;">
                                    رشته تحصیلی :
                                    <asp:Label ID="Label_Mager" runat="server" Text="Label"></asp:Label>
                                </td>
                                <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                                    height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                                    border-bottom-color: #FFFFFF;">
                                    دانشگاه محل تحصیل :
                                    <asp:Label ID="Label_Collage_Name_User" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                                    height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                                    border-bottom-color: #FFFFFF;">
                                    وضعیت تحصیلی :
                                    <asp:Label ID="Label_State_Education_User" runat="server" Text="Label"></asp:Label>
                                </td>
                                <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                                    height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                                    border-bottom-color: #FFFFFF;">
                                    شغل :
                                    <asp:Label ID="Label_Job_User" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                                    height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                                    border-bottom-color: #FFFFFF;">
                                    شماره تماس :
                                    <asp:Label ID="Label_Telephone_User" runat="server" Text="Label"></asp:Label>
                                </td>
                                <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                                    height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                                    border-bottom-color: #FFFFFF;">
                                    دین :
                                    <asp:Label ID="Label_Din_User" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                                    height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                                    border-bottom-color: #FFFFFF;">
                                    محل زندگی :
                                    <asp:Label ID="Label_City_Live" runat="server" Text="Label"></asp:Label>
                                </td>
                                <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                                    height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                                    border-bottom-color: #FFFFFF;">
                                    علاقمند به:
                                    <asp:Label ID="Label_Favoriets_User" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="font-family: tahoma, arial; font-size: small; font-style: normal;
                                    text-align: right; height: 40px; vertical-align: middle; border-bottom-style: dotted;
                                    border-bottom-width: thin; border-bottom-color: #FFFFFF;">
                                    آدرس ایمیل :
                                    <asp:Label ID="Label_Email_User" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="font-family: tahoma, arial; font-size: small; font-style: normal;
                                    text-align: right; height: 40px; vertical-align: middle; border-bottom-style: dotted;
                                    border-bottom-width: thin; border-bottom-color: #FFFFFF;">
                                    توضیحات :
                                    <asp:Label ID="Label_Description_User" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:View>
                <asp:View ID="View_File" runat="server">
                     <table style="width: 1024px;">
            <tr>
                <td align="center" style="width: 1024px; height: 50px">
                    <asp:ImageButton ID="Img_btn_TextFile_User" runat="server" ImageUrl="~/Users/images/Files-text.png"
                        AlternateText="آپلود فایل متنی" Height="48px" Width="48px" OnClick="Img_btn_TextFile_User_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="Img_btn_Picture_User" runat="server" ImageUrl="~/Users/images/gallery.png"
                        AlternateText="آپلود عکس" Height="48px" Width="48px" OnClick="Img_btn_Picture_User_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="Img_btn_Movie_User" runat="server" ImageUrl="~/Users/images/Movie.png"
                        AlternateText="آپلود فیلم" Height="48px" Width="48px" OnClick="Img_btn_Movie_User_Click" />
                    &nbsp;&nbsp;
                    
                    <br />
                    <hr style="background-color: #2C3E5B" />
                </td>
            </tr>
                         </table>
                    <asp:MultiView ID="MultiView_Files" runat="server">
                        <asp:View ID="View1" runat="server">
                             <div align="center" dir="rtl" >
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource_Text_File" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                            SelectCommand="SELECT [Topic_Textfile], [Discreption_Textfile], [Path_Textfile] FROM [Uploads_Textfile_User_tbl] WHERE ([ID_User] = @ID_User)">
                            <SelectParameters>
                                <asp:SessionParameter Name="ID_User" SessionField="info_user" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:Repeater ID="Repeater_Text_File" runat="server" DataSourceID="SqlDataSource_Text_File">
                            <HeaderTemplate>
                                «فایل های متنی»<br />
                                <hr style="background-color: #2C3E5B; margin-top: 0px;" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <a href='<%#Eval("Path_Textfile")%>'>
                                    <img alt='عنوان:<%#Eval("Topic_Textfile") %>   توضیحات:<%#Eval("Discreption_Textfile") %>'
                                        src="images/DOC1.png" class="widthpic"></img></a>
                            </ItemTemplate>
                        </asp:Repeater>
                                 </div>
                        </asp:View>
                        <asp:View ID="View2" runat="server">
                             <div align="center" dir="rtl" >
                            <br /> «عکس ها»<br />
                        <hr style="background-color: #2C3E5B; margin-top: 0px;" />
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource_Picture" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                            SelectCommand="SELECT [Topic_Pic], [Discreption_Pic], [Path_pic] FROM [Uploads_Pic_User_tbl] WHERE ([ID_User] = @ID_User)">
                            <SelectParameters>
                                <asp:SessionParameter Name="ID_User" SessionField="info_User" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:Repeater ID="Repeater_Picture" runat="server" DataSourceID="SqlDataSource_Picture">
                            <ItemTemplate>
                                <a href='<%#Eval("Path_pic")%>'>
                                    <img class="widthpic" alt='عنوان:<%#Eval("Topic_Pic") %>   توضیحات:<%#Eval("Discreption_Pic") %>'
                                        src='<%# Eval("Path_pic") %>' />
                            </ItemTemplate>
                        </asp:Repeater>
                        <br />
                            </div>
                        </asp:View>
                        <asp:View ID="View3" runat="server">
                            
                         <div align="center" dir="rtl" >
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource_Vidoes" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                            SelectCommand="SELECT [Topic_Movie], [Discreption_Movie], [Path_Movie] FROM [Uploads_Movie_User_tbl] WHERE ([ID_User] = @ID_User)">
                            <SelectParameters>
                                <asp:SessionParameter Name="ID_User" SessionField="info_user" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:Repeater ID="Repeater_Videos" runat="server" DataSourceID="SqlDataSource_Vidoes">
                            <HeaderTemplate>
                                «فایل های ویدیویی»<br />
                                <hr style="background-color: #2C3E5B; margin-top: 0px;" />
                            </HeaderTemplate>
                            <ItemTemplate>
                               <%-- <a href='<%#Eval("Path_Movie")%>'>
                                    <img class="widthpic" alt='عنوان:<%#Eval("Topic_Movie") %>   توضیحات:<%#Eval("Discreption_Movie") %>'
                                        src="images/MovieFile.png" width="110px" height="100px" />--%>
                                    <video width="320" height="240" controls>
  <source src='<%#Eval("Path_Movie")%>' type="video/flv">
      <source src='<%#Eval("Path_Movie")%>' type="video/mp4">
       <source src='<%#Eval("Path_Movie")%>' type="video/webm">
  <source src='<%#Eval("Path_Movie")%>' type="video/ogg">
  Your browser does not support the video tag.
</video>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                        </asp:View>

                    </asp:MultiView>
                   
                </asp:View>
                <asp:View ID="View_Post" runat="server">
                    <div align="right" dir="rtl">
                        <asp:SqlDataSource ID="SqlDataSource_Posts_user" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                            SelectCommand="SELECT ID_User, Title, Body, DT_Create, ID FROM Post_Users_tbl WHERE (ID_User = @ID_User)">
                            <SelectParameters>
                                <asp:SessionParameter Name="ID_User" SessionField="info_User" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:Repeater ID="Repeater_post" runat="server" 
                            DataSourceID="SqlDataSource_Posts_user" 
                            onitemdatabound="Repeater_post_ItemDataBound">
                            <HeaderTemplate>
                                <p dir="rtl" align="center" style="font-family: tahoma, arial; font-size: small;
                                    color: #FF0000; vertical-align: middle; text-align: center">
                                    «پست های درج شده»</p>
                                <hr style="background-color: #2C3E5B" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <div>
                                    <p dir="rtl" style="text-align: right">
                                        <span style="font-size: x-small; color: #666666;">تاریخ:<asp:Label ID="Label_Date" runat="server"
                                            Text='<%#Eval("DT_Create")%>'></asp:Label></span></p>
                                </div>
                                <div dir="rtl" style="text-align: right">
                                    <pre><span style="font-size: x-small; color: #666666;">عنوان پست:</span><%#Eval("Title")%></pre>
                                </div>
                                <div dir="rtl" style="text-align: right">
                                    <pre><span style="font-size: x-small; color: #666666;">متن پست:</span><%#Eval("Body")%></pre>
                                </div>
                                <a class="link_style" dir="rtl" href="View_Info_User.aspx?post_id=<%#Eval("ID") %>&mode=comment">
                                    نظرات ...</a>
                                <hr style="background-color: #2C3E5B" />
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </asp:View>
                <asp:View ID="View_Friend" runat="server">
                    <div align="center" dir="rtl">
                        <div style="max-width: 100%; width:100%; direction: rtl; position: relative; text-align: center;
                            top: 0px; right: 0px; float: right;" align="center" dir="rtl">
                            <asp:SqlDataSource ID="SqlDataSource_Friends_User_Section1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                
                                SelectCommand="
SELECT DISTINCT User_tbl.Name, User_tbl.Family, User_tbl.Account_name, User_tbl.Birth_date, User_tbl.E_mail, User_tbl.User_pic, User_tbl.ID FROM User_tbl INNER JOIN Request_Friend_tbl ON Request_Friend_tbl.Response_User_ID = User_tbl.ID  WHERE (Request_Friend_tbl.Request_User_ID = @id) 
UNION
SELECT DISTINCT User_tbl.Name, User_tbl.Family, User_tbl.Account_name, User_tbl.Birth_date, User_tbl.E_mail, User_tbl.User_pic, User_tbl.ID FROM User_tbl INNER JOIN Request_Friend_tbl ON Request_Friend_tbl.Request_User_ID = User_tbl.ID  WHERE (Request_Friend_tbl.Response_User_ID = @id) ">
                                <SelectParameters>
                                    <asp:SessionParameter Name="id" SessionField="info_User" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:DataList ID="DataList_Friend" runat="server" DataSourceID="SqlDataSource_Friends_User_Section1" RepeatColumns="4" OnItemDataBound="DataList_Friend_ItemDataBound" >
                                 <ItemTemplate>
                                    <table style="width: 250px;">
                                        <tr>
                                            <td>
                                                <a href="View_Info_User.aspx?id=<%#Eval("ID")%>&mode=info">
                                                    <asp:Image ID="Image_user_Section1" runat="server" ImageUrl='<%#Eval("User_pic")%>'
                                                        AlternateText='<%#Eval("Account_name") %>' Height="140px" Width="120px" />
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span style="font-size: x-small; color: #666666"> نام:</span><asp:Label ID="Label4" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span style="font-size: x-small; color: #666666"> نام خانوادگی:</span><asp:Label ID="Label2" runat="server" Text='<%#Eval("Family") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span style="font-size: x-small; color: #666666"> نام کاربری:</span><asp:Label ID="Label3" runat="server" Text='<%#Eval("Account_name") %>'></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                </ItemTemplate>
                            </asp:DataList>
                        </div>
                        
                    </div>
                </asp:View>
                <asp:View ID="View_Comment" runat="server">
                    <div align="right" dir="rtl">
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
                                    <asp:SqlDataSource ID="SqlDataSource_Comments_Post" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                        SelectCommand="SELECT User_tbl.ID, CASE WHEN Comment_Users_tbl.User_ID = User_tbl.ID THEN User_tbl.Name + ' ' + User_tbl.Family END AS USERNAME,Account_name, User_tbl.User_pic, Comment_Users_tbl.Body, Comment_Users_tbl.Create_date FROM Comment_Users_tbl INNER JOIN User_tbl ON Comment_Users_tbl.User_ID = User_tbl.ID WHERE  (Comment_Users_tbl.Post_ID = @Post_ID)">
                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="Post_ID" QueryStringField="post_id" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <br />
                                    <hr style="background-color: #2C3E5B; margin-top: 0px;" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div align="right" dir="rtl" >
                        <asp:Repeater ID="Repeater_Comment_post" runat="server">
                            <ItemTemplate>
                                <table style="width: 750px; height: 150px;">
                                    <tr>
                                        <td rowspan="2" align="right">
                                            <table style="width: 250px;">
                                                <tr>
                                                    <td rowspan="3" style="text-align: right" width="90px">
                                                        <asp:Image ID="Image_Comment_user" runat="server" ImageUrl='<%#Eval("User_pic")%>'
                                                            Height="120px" Width="90px" />
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
                    <div >
                        <table style="width: 100%;">
                            <tr>
                                <td colspan="2" dir="rtl">
                                    <span class="style1">*</span> <span class="style2">کاربر گرامی شما در این قسمت می توانید
                                        متن نظر خود را وارد کنید.</span>
                                </td>
                            </tr>
                            <tr>
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
                                <td dir="rtl" align="left" width="100">
                                    عنوان متن:
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <asp:Button ID="Button_Comment" runat="server" Font-Names="Tahoma" Font-Size="Small"
                                        OnClick="Button_Comment_Click" Text="ثبت نظر" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:View>
                <asp:View ID="View_Friend_info" runat="server">
                    <div  align="center" dir="rtl">
                        <table dir="rtl" style="width: 300px; height: 400px;">
                            <tr>
                                <td align="right" cols="2" style="font-family: tahoma, arial; font-size: 12px; color: #000000;
                                    line-height: normal; vertical-align: middle; text-align: right; width: 100px;
                                    height: 15px;">
                                    <asp:Image ID="Image1" runat="server" Height="120px" Width="90px" />
                                </td>
                            </tr>
                            <tr>
                                <td align="left" style="">
                                    نام:
                                </td>
                                <td style="">
                                    <asp:Label ID="lbl_Name_Result" runat="server" ForeColor="Black" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" style="">
                                    نام خانوادگی:
                                </td>
                                <td style="">
                                    <asp:Label ID="lbl_Family_Result" runat="server" ForeColor="Black" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" style="">
                                    نام کاربری :
                                </td>
                                <td style="">
                                    <asp:Label ID="lbl_AccountName_Result" runat="server" ForeColor="Black" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" style="">
                                    جنسیت :
                                </td>
                                <td style="">
                                    <asp:Label ID="lbl_Sex_Result" runat="server" ForeColor="Black" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" style="">
                                    رشته تحصیلی :
                                </td>
                                <td style="">
                                    <asp:Label ID="lbl_Mager_Result" runat="server" ForeColor="Black" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" style="">
                                    محل زندگی :
                                </td>
                                <td style="">
                                    <asp:Label ID="lbl_CityLive_Result" runat="server" ForeColor="Black" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" style="">
                                    پست الکترونیک :
                                </td>
                                <td style="">
                                    <asp:Label ID="lbl_Email_Result" runat="server" Style="color: #000000" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" style="">
                                    علاقمند به :
                                </td>
                                <td style="">
                                    <asp:Label ID="lbl_Favorites_Result" runat="server" ForeColor="Black" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" style="">
                                    توضیحات :
                                </td>
                                <td style="">
                                    <asp:Label ID="lbl_Description_Result" runat="server" ForeColor="Black" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="font-family: tahoma, arial; font-size: 12px; color: #000000;
                                    line-height: normal; vertical-align: middle; height: 15px;" colspan="2">
                                    <input id="Button_Return" style="font-family: tahoma" type="button" value="بازگشت به صحفه قبل"
                                        onclick="return Button_Return_onclick()" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:View>
                <asp:View ID="View_Permission" runat="server">
                <div align="center" >
                <p dir="rtl" align="center" 
                        style="font-family: Tahoma; font-size: medium; font-style: oblique">
                کاربر گرامی شما مجوز دسترسی به اطلاعات این کاربر را ندارید.
                </p>
                    <input id="Button_Ret" type="button" value="بازگشت" align="middle" onclick="return Button_Ret_onclick()" />
                </div>
                </asp:View>
            </asp:MultiView>
        </div>
    </div>
    </form>
</body>
</html>
