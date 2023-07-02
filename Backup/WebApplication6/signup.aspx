<%@ Page Title="" Language="C#" MasterPageFile="~/master_main.Master" AutoEventWireup="true"
    CodeBehind="signup.aspx.cs" Inherits="WebApplication6.WebForm8" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <div align="right">
                <asp:ImageButton ID="imgbtn_Signup_step3" runat="server" ImageUrl="~/images/final_subit.png"
                    OnClick="imgbtn_Signup_step3_Click" Visible="False" Height="30px" Width="60px" />
                <asp:ImageButton ID="imgbtn_Signup_step2" runat="server" ImageUrl="~/images/complete_info.png"
                    OnClick="imgbtn_Signup_step2_Click" Visible="False" Height="30px" Width="60px" />
                <asp:ImageButton ID="imgbtn_Signup_step1" runat="server" ImageUrl="~/images/signup.png"
                    OnClick="imgbtn_Signup_step1_Click" Visible="False" Height="30px" Width="60px" />
                <asp:ImageButton ID="imgbtn_rules" runat="server" ImageUrl="~/images/Rules.png" Height="30px"
                    Width="60px" onclick="imgbtn_rules_Click" />
            </div>
            <br />
            <asp:MultiView ID="mvw_Signup" runat="server" ActiveViewIndex="0">
                <asp:View ID="View_Account_rule" runat="server">
                    <div align="center" dir="rtl" style="font-size: small; vertical-align: middle; text-align: center;
                        width: 960px; height: 500px; top: 0px; background-color: #92C8FF; font-weight: normal;
                        font-style: normal; color: #000000; right: 115px;">
                        <table style="width: 900px; height: 420px; margin-right: 40px;">
                            <tr>
                                <td style="font-family: tahoma, arial; font-size: small; font-weight: normal; font-style: normal;
                                    text-align: center; height: 500px; line-height: normal;">
                                    <h1 style="font-size: medium">
                                        «قوانین عضویت»</h1>
                                    <p>
                                        &nbsp;</p>
                                    <div>
                                        <p style="text-align: right">
                                            &nbsp;<span style="color: #FF0000">*</span> با ثبت نام شما در این سایت شما می پذیرید
                                            که از ارسال هر مطلبی که محتوای دانستنی های غلط، مطالب بدون صحت، بد گویی، منفور و
                                            یا تجاوز به حقوق و شخصیت دیگران و مطالب غیر اخلاقی و یا هر مطلب دیگری که قوانین
                                            را نقض می کند خودداری&nbsp; کنید.</p>
                                    </div>
                                    <p>
                                        &nbsp;</p>
                                    <div>
                                        <p style="text-align: right">
                                            <span style="color: #FF0000">*</span> هرگونه اطلاعات شما در این سایت با رضایت و
                                            موافقت شما&nbsp; ارائه خواهد شد. هرچند که این سایت هیچ گونه مسئولیتی در مقابل حملات
                                            آنلاین (هک) که باعث فاش شدن اطلاعات شما می شود ندارد. پس در قرار دادن مطلب و اطلاعات
                                            شخصی خود در این سایت دقت کنید.
                                        </p>
                                    </div>
                                    <p style="text-align: right">
                                        <span style="color: #FF0000">*</span> عدم اجابت این قوانین ممکن است منجر به تعلیق
                                        حساب کاربری شما و یا ممنوعیت دائم از دسترسی شما به این سایت شود. شما می پذیرید که
                                        مدیر سایت و مدیر گروه ها توانایی و مجوز پاک کردن، ویرایش و یا بستن هر حساب کاربری
                                        و یا مطلب ارسالی را در هر زمان که مورد نیاز باشد را دارند. شما همچنین توافق می کنید
                                        که همه ی اطلاعاتی که شما در این انجمن وارد می کنید در یک دیتابیس حفظ می شود و همچنین
                                        کوکی ها در روی کامپیوتر شما جهت ذخیره اطلاعات ورود شما ذخیره می شوند.</p>
                                    <br />
                                    <br />
                                    <strong>با ثبت نام شما در این سایت و ادامه این مرحله شما با قوانین بالا و موارد دیگری
                                        که توسط مدیر سایت و سایر مدیران تعیین می شود موافقت می کنید. آیا با این قوانین موافق
                                        هستید؟<br />
                                        <br />
                                    </strong>
                                    <asp:Button ID="btn_submit_rules" runat="server" Font-Bold="True" Font-Names="Tahoma"
                                        Font-Size="Medium" OnClick="btn_submit_rules_Click" Text="موافقم" />
                                    <br />
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:View>
                <asp:View ID="View_Userinfo" runat="server">
                    <div dir="rtl" style="font-family: tahoma, arial; width: 960px; height: 500px; font-size: small;
                        font-weight: normal; font-style: normal; white-space: normal; float: none;">
                        <div align="right" dir="rtl" style="font-family: tahoma, arial; font-style: normal;
                            width: 220px; height: 500px; background-color: #92C8F3; right: 0px; top: 0px;
                            float: right; text-decoration: none; text-align: right; vertical-align: middle;
                            font-size: small; position: static;">
                            <br />
                            <br />
                            کاربر گرامی قبل از ثبت نام رعایت نکات
                            <br />
                            زیر ضروری است.<br />
                            <br />
                            <span style="color: red">*</span>قبل از ثبت نام <span>قوانین</span> را مطالعه کنید.<br />
                            <br />
                            <span style="color: red">*</span> پر کردن فیلدهایی از قبیل نام کاربری،<br />
                            رمز عبور و ... الزامی است.<br />
                            <br />
                            <span style="color: red">*</span> رمز عبور شما شخصی می باشد ، از<br />
                            افشای آن بپرهیزید.<br />
                            <br />
                            <span style="color: red">*</span> با استفاده از قسمت های دیگر این
                            <br />
                            صحفه می توانید اطلاعات تکمیلی خود
                            <br />
                            وارد کنید.<br />
                            <br />
                            <span style="color: red">*</span> در قسمت انجام تنظیمات کاربران دقت<br />
                            کنید.<br />
                            <br />
                            <span style="color: red">*</span> وارد کردن فیلد های علامت دار اجباری<br />
                            می باشد.<br />
                        </div>
                        <div style="font-family: tahoma, arial; font-size: medium; vertical-align: middle;
                            text-align: center; width: 735px; height: 500px; top: 0px; left: 0px; float: left;
                            background-color: #92C8ff;">
                            <table style="width: 735px; height: 500px; font-family: tahoma, arial; font-size: medium;
                                font-weight: normal; font-style: normal; color: #000000; text-align: center;
                                vertical-align: middle; border-bottom-style: dotted; border-bottom-color: #000000;
                                border-bottom-width: thin; border-collapse: separate;">
                                <tr>
                                    <td style="height: 40px; font-family: tahoma, arial; font-size: small; color: #000000;
                                        font-style: normal; vertical-align: middle; text-align: right; font-weight: normal;
                                        border-bottom-color: #FFFFFF; border-bottom-width: thin; border-bottom-style: dotted;">
                                        <span style="color: #FF0000">*</span>نام :
                                    </td>
                                    <td style="height: 40px; font-family: tahoma, arial; font-size: small; font-weight: normal;
                                        font-style: normal; color: #000000; text-align: right; vertical-align: middle;
                                        border-bottom-color: #FFFFFF; border-bottom-width: thin; border-bottom-style: dotted;">
                                        <asp:TextBox ID="txt_name_signup" runat="server" Width="160px" 
                                            AutoCompleteType="FirstName"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_name_signup"
                                            ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 40px; font-family: tahoma, arial; font-size: small; color: #000000;
                                        font-style: normal; vertical-align: middle; text-align: right; font-weight: normal;
                                        border-bottom-color: #FFFFFF; border-bottom-width: thin; border-bottom-style: dotted;">
                                        <span style="color: #FF0000">*</span>نام خانوادگی :
                                    </td>
                                    <td style="height: 40px; font-family: tahoma, arial; font-size: small; font-weight: normal;
                                        font-style: normal; color: #000000; text-align: right; vertical-align: middle;
                                        border-bottom-color: #FFFFFF; border-bottom-width: thin; border-bottom-style: dotted;">
                                        <asp:TextBox ID="txt_family_signup" runat="server" Width="160px" 
                                            AutoCompleteType="LastName"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_family_signup"
                                            ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 40px; font-family: tahoma, arial; font-size: small; color: #000000;
                                        font-style: normal; vertical-align: middle; text-align: right; font-weight: normal;
                                        border-bottom-color: #FFFFFF; border-bottom-width: thin; border-bottom-style: dotted;">
                                        <span style="color: #FF0000">*</span>نام کاربری :
                                    </td>
                                    <td style="height: 40px; font-family: tahoma, arial; font-size: small; font-weight: normal;
                                        font-style: normal; color: #000000; text-align: right; vertical-align: middle;
                                        border-bottom-color: #FFFFFF; border-bottom-width: thin; border-bottom-style: dotted;">
                                        <asp:TextBox ID="nameaccount" runat="server" Width="262px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="nameaccount"
                                            ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 40px; font-family: tahoma, arial; font-size: small; color: #000000;
                                        font-style: normal; vertical-align: middle; text-align: right; font-weight: normal;
                                        border-bottom-color: #FFFFFF; border-bottom-width: thin; border-bottom-style: dotted;">
                                        <span style="color: #FF0000">*</span>رمز عبور :
                                    </td>
                                    <td style="height: 40px; font-family: tahoma, arial; font-size: small; font-weight: normal;
                                        font-style: normal; color: #000000; text-align: right; vertical-align: middle;
                                        border-bottom-color: #FFFFFF; border-bottom-width: thin; border-bottom-style: dotted;">
                                        <asp:TextBox ID="txt_password_signup" runat="server" Width="141px" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_password_signup"
                                            ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 40px; font-family: tahoma, arial; font-size: small; color: #000000;
                                        font-style: normal; vertical-align: middle; text-align: right; font-weight: normal;
                                        border-bottom-color: #FFFFFF; border-bottom-width: thin; border-bottom-style: dotted;">
                                        تکرار رمز عبور :
                                    </td>
                                    <td style="height: 40px; font-family: tahoma, arial; font-size: small; font-weight: normal;
                                        font-style: normal; color: #000000; text-align: right; vertical-align: middle;
                                        border-bottom-color: #FFFFFF; border-bottom-width: thin; border-bottom-style: dotted;">
                                        <asp:TextBox ID="txt_confirm_password_signup" runat="server" Width="142px" TextMode="Password"></asp:TextBox>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txt_confirm_password_signup"
                                            ControlToValidate="txt_password_signup" ErrorMessage="لطفا در وارد نمودن رمز عبور خود دقت فر مایید ."
                                            ForeColor="Red">رمز عبور شما معتبر نمی باشد.</asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-bottom: thin dotted #FFFFFF; height: 46px; font-family: tahoma, arial;
                                        font-size: small; color: #000000; font-style: normal; vertical-align: middle;
                                        text-align: right; font-weight: normal;">
                                        جنسیت :
                                    </td>
                                    <td style="border-bottom: thin dotted #FFFFFF; height: 46px; font-family: tahoma, arial;
                                        font-size: small; font-weight: normal; font-style: normal; color: #000000; text-align: right;
                                        vertical-align: middle;">
                                        <asp:DropDownList ID="ddl_sex_signup" runat="server" Width="98px" Font-Names="Tahoma"
                                            Font-Size="Small" Font-Bold="False" Height="22px">
                                            <asp:ListItem Value="2">تعیین نشده</asp:ListItem>
                                            <asp:ListItem Value="false">مرد</asp:ListItem>
                                            <asp:ListItem Value="true">زن</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 40px; font-family: tahoma, arial; font-size: small; color: #000000;
                                        font-style: normal; vertical-align: middle; text-align: right; font-weight: normal;
                                        border-bottom-color: #FFFFFF; border-bottom-width: thin; border-bottom-style: dotted;">
                                        ایمیل :
                                    </td>
                                    <td style="height: 40px; font-family: tahoma, arial; font-size: small; font-weight: normal;
                                        font-style: normal; color: #000000; text-align: right; vertical-align: middle;
                                        border-bottom-color: #FFFFFF; border-bottom-width: thin; border-bottom-style: dotted;">
                                        <asp:TextBox ID="txt_Email_signup" runat="server" Width="354px" 
                                            AutoCompleteType="Email"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 40px; font-family: tahoma, arial; font-size: small; font-style: normal;
                                        color: #000000; text-align: right; vertical-align: middle; font-weight: normal;
                                        border-bottom-color: #FFFFFF; border-bottom-width: thin; border-bottom-style: dotted;">
                                        تکرار ایمیل :
                                    </td>
                                    <td style="height: 40px; font-family: tahoma, arial; font-size: small; font-weight: normal;
                                        font-style: normal; color: #000000; text-align: right; vertical-align: middle;
                                        border-bottom-color: #FFFFFF; border-bottom-width: thin; border-bottom-style: dotted;">
                                        <asp:TextBox ID="txt_confirm_Email" runat="server" Width="355px" 
                                            AutoCompleteType="Email"></asp:TextBox>
                                        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="txt_confirm_Email"
                                            ControlToValidate="txt_Email_signup" ErrorMessage="آدرس پست الکترونیک شما معتبر نمی باشد."
                                            ForeColor="Red"></asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 40px; font-family: tahoma, arial; font-size: small; font-style: normal;
                                        color: #000000; text-align: right; vertical-align: middle; font-weight: normal;
                                        border-bottom-color: #FFFFFF; border-bottom-width: thin; border-bottom-style: dotted;"
                                        colspan="2">
                                        <asp:CheckBox ID="ckb_Complete_Info" runat="server" Text="آیا مایل به پر کردن اطلاعات تکمیلی هستید؟" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 40px; font-family: tahoma, arial; font-size: small; font-style: normal;
                                        color: #000000; text-align: right; vertical-align: middle; font-weight: normal;
                                        border-bottom-color: #FFFFFF; border-bottom-width: thin; border-bottom-style: dotted;">
                                        &nbsp;
                                    </td>
                                    <td align="center" style="height: 40px; font-family: tahoma, arial; font-size: small;
                                        font-weight: normal; font-style: normal; color: #000000; text-align: right; vertical-align: middle;
                                        border-bottom-color: #FFFFFF; border-bottom-width: thin; border-bottom-style: dotted;">
                                        <asp:LinkButton ID="lkb_previous1" runat="server" OnClick="lkb_previous1_Click">مرحله قبلی</asp:LinkButton>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:LinkButton ID="lkb_forward1" runat="server" OnClick="lkb_forward1_Click">مرحله بعد</asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </asp:View>
                <asp:View ID="View_Complete_info" runat="server">
                    <div dir="rtl" style="font-family: tahoma, arial; width: 960px; height: 500px; font-size: small;
                        font-weight: normal; font-style: normal; white-space: normal; float: none;">
                        <div align="right" dir="rtl" style="font-family: tahoma, arial; font-style: normal;
                            width: 220px; height: 500px; background-color: #92C8F3; right: 0px; top: 0px;
                            float: right; text-decoration: none; text-align: right; vertical-align: middle;
                            font-size: small; position: static;">
                            <br />
                            <br />
                            کاربر گرامی قبل از ثبت نام رعایت نکات
                            <br />
                            زیر ضروری است.<br />
                            <br />
                            <span style="color: red">*</span>قبل از ثبت نام قوانین مربوط به سایت
                            <br />
                            را مطالعه کنید.<br />
                            <br />
                            <span style="color: red">*</span> پر کردن فیلدهایی از قبیل نام کاربری،<br />
                            رمز عبور و ... الزامی است.<br />
                            <br />
                            <span style="color: red">*</span> رمز عبور شما شخصی می باشد ، از<br />
                            افشای آن بپرهیزید.<br />
                            <br />
                            <span style="color: red">*</span> با استفاده از قسمت های دیگر این
                            <br />
                            صحفه می توانید اطلاعات تکمیلی خود
                            <br />
                            وارد کنید.<br />
                            <br />
                            <span style="color: red">*</span> در قسمت انجام تنظیمات کاربران دقت<br />
                            کنید.</div>
                        <div style="font-family: tahoma, arial; font-size: medium; vertical-align: middle;
                            text-align: center; width: 735px; height: 500px; top: 0px; left: 0px; float: left;
                            background-color: #92C8ff;">
                            <table style="width: 735px; height: 500px; font-family: tahoma, arial; font-size: small;
                                font-weight: normal; font-style: normal; color: #000000; text-align: center;
                                vertical-align: middle;">
                                <tr>
                                    <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                                        height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                                        border-bottom-color: #FFFFFF;">
                                        تاریخ تولد :
                                    </td>
                                    <td align="right" style="font-family: tahoma, arial; font-size: small; font-style: normal;
                                        vertical-align: middle; text-align: right; border-bottom-style: dotted; border-bottom-width: thin;
                                        height: 40px; border-bottom-color: #FFFFFF;">
                                        <telerik:RadDatePicker ID="RadDatePicker1" runat="server">
                                        </telerik:RadDatePicker>
                                    </td>
                                    <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                                        height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                                        border-bottom-color: #FFFFFF;">
                                        محل تولد :
                                    </td>
                                    <td align="right" style="font-family: tahoma, arial; font-size: small; font-style: normal;
                                        vertical-align: middle; text-align: right; border-bottom-style: dotted; border-bottom-width: thin;
                                        height: 40px; border-bottom-color: #FFFFFF;">
                                        <asp:TextBox ID="txt_Cityborn_signup" runat="server"></asp:TextBox>
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
                                        <asp:DropDownList ID="ddl_Education_Sign" runat="server" Height="20px" Style="margin-right: 0px"
                                            Width="140px">
                                            <asp:ListItem>تعیین نشده</asp:ListItem>
                                            <asp:ListItem>سیکل</asp:ListItem>
                                            <asp:ListItem>دیپلم</asp:ListItem>
                                            <asp:ListItem>فوق دیپلم</asp:ListItem>
                                            <asp:ListItem>لیسانس</asp:ListItem>
                                            <asp:ListItem>فوق لیسانس</asp:ListItem>
                                            <asp:ListItem>دکترا</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                                        height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                                        border-bottom-color: #FFFFFF;">
                                        استان :
                                    </td>
                                    <td align="right" style="font-family: tahoma, arial; font-size: small; font-style: normal;
                                        vertical-align: middle; text-align: right; border-bottom-style: dotted; border-bottom-width: thin;
                                        height: 40px; border-bottom-color: #FFFFFF;">
                                        <asp:TextBox ID="txt_Ostan_signup" runat="server"></asp:TextBox>
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
                                        <asp:TextBox ID="txt_Mager_signup" runat="server" Width="150px"></asp:TextBox>
                                    </td>
                                    <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                                        height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                                        border-bottom-color: #FFFFFF;">
                                        دانشگاه محل تحصیل :
                                    </td>
                                    <td align="right" style="font-family: tahoma, arial; font-size: small; font-style: normal;
                                        vertical-align: middle; text-align: right; border-bottom-style: dotted; border-bottom-width: thin;
                                        height: 40px; border-bottom-color: #FFFFFF;">
                                        <asp:TextBox ID="txt_Collegename_signup" runat="server"></asp:TextBox>
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
                                        <asp:DropDownList ID="ddl_Education_State_Signup" runat="server" Height="20px" Style="margin-right: 0px"
                                            Width="140px">
                                            <asp:ListItem>تعیین نشده</asp:ListItem>
                                            <asp:ListItem>در حال تحصیل</asp:ListItem>
                                            <asp:ListItem>فارغ التحصیل</asp:ListItem>
                                            <asp:ListItem>پشت کنکوری</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                                        height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                                        border-bottom-color: #FFFFFF;">
                                        شغل :
                                    </td>
                                    <td align="right" style="font-family: tahoma, arial; font-size: small; font-style: normal;
                                        vertical-align: middle; text-align: right; border-bottom-style: dotted; border-bottom-width: thin;
                                        height: 40px; border-bottom-color: #FFFFFF;">
                                        <asp:TextBox ID="txt_Jobuser_signup" runat="server"></asp:TextBox>
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
                                        <asp:TextBox ID="txt_Telephone_signup" runat="server" Width="157px" 
                                            MaxLength="11"></asp:TextBox>
                                        <asp:RangeValidator ID="RangeValidator_Telephone" runat="server" 
                                            ControlToValidate="txt_Telephone_signup" ErrorMessage="شماره تلفن غلط است." 
                                            Font-Size="X-Small" ForeColor="Red" 
                                            ValidationGroup="telephone_validate"></asp:RangeValidator>
                                    </td>
                                    <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                                        height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                                        border-bottom-color: #FFFFFF;">
                                        دین :
                                    </td>
                                    <td align="right" style="font-family: tahoma, arial; font-size: small; font-style: normal;
                                        vertical-align: middle; text-align: right; border-bottom-style: dotted; border-bottom-width: thin;
                                        height: 40px; border-bottom-color: #FFFFFF;">
                                        <asp:TextBox ID="txt_Din_signup" runat="server"></asp:TextBox>
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
                                        <asp:TextBox ID="txt_Citylive_signup" runat="server"></asp:TextBox>
                                    </td>
                                    <td style="font-family: tahoma, arial; font-size: small; font-style: normal; text-align: right;
                                        height: 40px; vertical-align: middle; border-bottom-style: dotted; border-bottom-width: thin;
                                        border-bottom-color: #FFFFFF;">
                                        علایق:
                                    </td>
                                    <td align="right" style="font-family: tahoma, arial; font-size: small; font-style: normal;
                                        vertical-align: middle; text-align: right; border-bottom-style: dotted; border-bottom-width: thin;
                                        height: 40px; border-bottom-color: #FFFFFF;">
                                        <asp:TextBox ID="txt_Favoretis_Search" runat="server" TextMode="MultiLine"></asp:TextBox>
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
                                        <asp:TextBox ID="txt_Discreption_signup" runat="server" TextMode="MultiLine" Width="491px"></asp:TextBox>
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
                                        &nbsp;&nbsp;&nbsp;
                                        <asp:LinkButton ID="lkb_previous2" runat="server" OnClick="lkb_previous2_Click">مرحله قبلی</asp:LinkButton>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:LinkButton ID="lkb_forward2" runat="server" OnClick="lkb_forward2_Click" 
                                            ValidationGroup="telephone_validate">مرحله بعد</asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </asp:View>
                <asp:View ID="View_finalstep" runat="server">
                    <div align="center" dir="rtl" style="font-size: small; vertical-align: middle; text-align: center;
                        width: 960px; height: 500px; top: 0px; background-color: #92C8FF; font-weight: normal;
                        font-style: normal; color: #000000; right: 115px;">
                        <table style="width: 900px; height: 420px; margin-right: 40px;">
                            <tr>
                                <td style="width: 960px" colspan="1">
                                </td>
                            </tr>
                            <tr>
                                <td style="font-family: tahoma, arial; font-size: small; font-weight: normal; font-style: normal;
                                    text-align: center; height: 270px; line-height: normal; width: 960px; vertical-align: top;">
                                    <h1 style="font-size: medium">
                                        «تایید نهایی»</h1>
                                    <p style="font-family: tahoma, arial; font-size: small">
                                        <strong>در این قسمت در صورتی مطمئن هستید که اطلاعات قبلی وارد شده&nbsp; درست می باشد
                                            ، با وارد نمودن کد امنیتی زیر<br />
                                            &nbsp;می توانید ثبت نام&nbsp; خود را انجام دهید.</strong></p>
                                    <p style="font-family: tahoma, arial; font-size: small">
                                        &nbsp;</p>
                                    <p style="font-family: tahoma, arial; font-size: small">
                                        <span style="color: #FF0000">**</span>توجه در وارد کردن اطلاعات به کوچکی و یا بزرگی
                                        حروف دقت فرمایید.<span style="color: #FF0000">**</span><strong><br />
                                        </strong>
                                    </p>
                                    <asp:Label ID="lbl_captcha" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="15pt"
                                        Text="Label"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txt_cptcha" runat="server"></asp:TextBox>
                                    <br />
                                    <br />
                                    <br />
                                    <asp:Button ID="btn_submit_final_Singup" runat="server" Font-Bold="True" Font-Names="Tahoma"
                                        Text="تایید" Width="78px" OnClick="btn_submit_final_Singup_Click" />
                                    <br />
                                    </strong>
                                    <br />
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:View>
                <br />
            </asp:MultiView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
