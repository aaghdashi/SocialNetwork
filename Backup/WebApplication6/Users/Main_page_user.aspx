<%@ Page Title="" Language="C#" MasterPageFile="~/Users/Users_master.Master" AutoEventWireup="true"
    CodeBehind="Main_page_user.aspx.cs" Inherits="WebApplication6.Users.WebForm1" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="mainContent" align="center">
        <asp:MultiView ID="MultiView_Main" runat="server">
            <asp:View ID="View_Main" runat="server">
                <div style="font-family: tahoma, arial; font-size: small; vertical-align: top; width: 750px;"align="center">
                    <table style="width: 100%; height: 484px;">
                        <tr>
                            <td rowspan="10" dir="rtl" align="right" style="height: 477px">
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
                                توانید با مراجعه به قسمت&nbsp; فایل ها ، فایل مورد نظر خود را آپلود کنید.<br /> <br />
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
                        <tr>
                            <td class="rowtable" dir="rtl" 
                                
                                style="font-family: tahoma, arial; font-size: small; text-align: right; height: 53px;">
                                تعداد پست ها :<asp:Label ID="lbl_Post_User" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="rowtable" dir="rtl" 
                                
                                style="font-family: tahoma, arial; font-size: small; text-align: right; height: 53px;">
                                تعداد کاربران :<asp:Label ID="lbl_Count_User" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="rowtable" dir="rtl" 
                                
                                style="font-family: tahoma, arial; font-size: small; text-align: right; height: 53px;">
                                تعداد دوستان :<asp:Label ID="lbl_Friend_User" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="rowtable" dir="rtl" 
                                
                                style="font-family: tahoma, arial; font-size: small; text-align: right; height: 53px;">
                                تعداد پیام های ارسالی :<asp:Label ID="lbl_Message_Send_User" runat="server" 
                                    Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="rowtable" dir="rtl" 
                                
                                style="font-family: tahoma, arial; font-size: small; text-align: right; height: 54px;">
                                تعداد پیام های دریافتی:<asp:Label ID="lbl_Message_Recieved_User" 
                                    runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="rowtable" dir="rtl" 
                                
                                style="font-family: tahoma, arial; font-size: small; text-align: right; height: 54px;">
                                تعداد تصاویر موجود :<asp:Label ID="lbl_Pic_User" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="rowtable" dir="rtl" 
                                
                                style="font-family: tahoma, arial; font-size: small; text-align: right; height: 54px;">
                                تعداد فایل های متنی :<asp:Label ID="lbl_Textfile_User" runat="server" 
                                    Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="rowtable" dir="rtl" 
                                
                                style="font-family: tahoma, arial; font-size: small; text-align: right; height: 54px;">
                                تعداد ویدئو کلیپ ها :<asp:Label ID="lbl_Video_User" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="rowtable" dir="rtl" 
                                
                                style="font-family: tahoma, arial; font-size: small; text-align: right; height: 54px;">
                                تعداد گروه های موجود :
                                <asp:Label ID="lbl_ExistGroup_User" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
