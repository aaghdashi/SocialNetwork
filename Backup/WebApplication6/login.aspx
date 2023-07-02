<%@ Page Title="" Language="C#" MasterPageFile="~/master_main.Master" AutoEventWireup="true"
    CodeBehind="login.aspx.cs" Inherits="WebApplication6.WebForm3" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
     
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div style="width: 960px;">
                <asp:MultiView ID="MultiView_Login" runat="server">
                    <asp:View ID="View_Login" runat="server">
                        <table 
                
                            style="width: 960px; height: 500px; font-family: Tahoma, arial; background-repeat: no-repeat; background-image: url('images/login_main.png'); background-color: #FFFFFF;">
                            <tr>
                                <td colspan="3">
                                    <hr />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 291px; height: 113px">
                                </td>
                                <td style="height: 113px; width: 340px">
                                    <table dir="rtl" style="width: 370px; height: 340px;">
                                        <tr>
                                            <td colspan="2" style="font-size: small; height: 58px">
                                                <p>
                                                    <span  style="color: #FF0000; ">*</span> کاربر گرامی در وارد 
                                        کردن اطلاعات دقت فرمایید.</p>
                                                <p style="height: 40px">
                                                    <span style="color: #FF0000">*</span> <span style="font-size: x-small">چنانچه نام&nbsp; کاربری و یا 
                                        رمز عبور خود را فراموش کرده اید، می توانید با جواب دادن به سوالات امنیتی که خود 
                                        آن را تعریف کرده اید رمز عبور&nbsp; و نام کاربری خود را دریافت کنید.</span></p>
                                                <hr />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="" colspan="2" dir="rtl" style="height: 20px; vertical-align: middle;
                                        text-align: right; font-family: tahoma, arial; font-size: small;">
                                                <asp:RadioButtonList ID="RadioButtonList_member" runat="server" 
                                                    RepeatDirection="Horizontal">
                                                    <asp:ListItem Selected="True" Value="0">کاربر عضو</asp:ListItem>
                                                    <asp:ListItem Value="1">مدیر گروه</asp:ListItem>
                                                </asp:RadioButtonList>
                                                <hr />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" class="" dir="rtl" style="height: 20px; width: 150px; vertical-align: middle;
                                        text-align: left; font-family: tahoma, arial; font-size: small;">
                                                نام کاربری:
                                            </td>
                                            <td align="right" class="" dir="ltr" 
                                    style="height: 20px; vertical-align: middle;
                                        text-align: right; font-family: tahoma, arial; font-size: small; width: 180px;">
                                                <telerik:RadTextBox ID="txt_username" Runat="server" 
                                                    EmptyMessage="نام کاربری را وارد کنید">
                                                    <EmptyMessageStyle ForeColor="Silver" />
                                                </telerik:RadTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" dir="rtl" style="height: 20px; vertical-align: middle; text-align: left;
                                        font-family: tahoma, arial; font-size: small; width: 150px;">
                                                رمز عبور:
                                            </td>
                                            <td align="right" dir="ltr" style="height: 20px; vertical-align: middle; text-align: right;
                                        font-family: tahoma, arial; font-size: small; width: 180px;">
                                                <telerik:RadTextBox ID="txt_password" Runat="server" 
                                                    EmptyMessage="0000" TextMode="Password">
                                                </telerik:RadTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" style="height: 21px">
                                                <hr />
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" class="" colspan="2" dir="rtl" 
                                    style="height: 17px">
                                                <asp:ImageButton ID="img_btn_submit" runat="server" 
                                        Height="30px" ImageUrl="~/images/submit.png" OnClick="img_btn_submit_Click" 
                                        Width="60px" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" class="" colspan="2" dir="rtl" style="height: 17px">
                                                <hr />
                                                <br />
                                                <asp:Literal ID="Literal_Login_state" runat="server" ></asp:Literal>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td style="height: 113px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 291px">
                                    &nbsp;
                                </td>
                                <td align="center" dir="rtl" style="width: 347px">
                                    <asp:LinkButton ID="LinkButton1" runat="server" 
                            Font-Names="Tahoma" Font-Size="X-Small" OnClick="LinkButton1_Click">رمز عبور خود را فراموش کرده ام.</asp:LinkButton>
                                    <br />
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="View_Recovery" runat="server">
                        <table 
                
                            style="width: 960px; height: 500px; font-family: Tahoma, arial; background-repeat: no-repeat; background-image: url('images/login_main.png'); background-color: #FFFFFF;">
                            <tr>
                                <td colspan="3">
                                    <hr />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 291px; height: 113px">
                                </td>
                                <td style="height: 113px; width: 340px">
                                    <table dir="rtl" style="width: 370px; height: 340px;">
                                        <tr>
                                            <td colspan="2" style="font-size: small; height: 58px">
                                                <p>
                                                    <span style="color: #FF0000">*</span> کاربر گرامی در وارد 
                                        کردن اطلاعات دقت فرمایید.</p>
                                                <p style="font-size: x-small">
                                                    <span style="color: #FF0000">*</span>&nbsp; با وارد کردن نام 
                                        کاربری ، سوال امنیتی و جواب آن می توانید رمز عبور خود را بازیابی نماییدو به صورت 
                                        مجدد از حساب کاربری خود استفاده نمایید.</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="" colspan="2" dir="rtl" style="height: 20px; vertical-align: middle;
                                        text-align: left; font-family: tahoma, arial; font-size: small;">
                                                <hr />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="" dir="rtl" style="height: 20px; vertical-align: middle;
                                        text-align: right; font-family: tahoma, arial; font-size: small;" colspan="2">
                                                <asp:RadioButtonList ID="RadioButtonList_Recovry_Password" runat="server" 
                                                    RepeatDirection="Horizontal">
                                                    <asp:ListItem Value="0">کاربر عضو </asp:ListItem>
                                                    <asp:ListItem Value="1">مدیر گروه</asp:ListItem>
                                                </asp:RadioButtonList>
                                                <hr />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" class="" dir="rtl" style="height: 20px; width: 150px; vertical-align: middle;
                                        text-align: left; font-family: tahoma, arial; font-size: small;">
                                                نام کاربری:
                                            </td>
                                            <td align="right" class="" dir="ltr" style="height: 20px; vertical-align: middle;
                                        text-align: right; font-family: tahoma, arial; font-size: small; width: 260px;">
                                                <telerik:RadTextBox ID="txt_username_Recovery" Runat="server" 
                                                    EmptyMessage="نام کاربری را وارد کنید">
                                                </telerik:RadTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" dir="rtl" style="height: 20px; vertical-align: middle; text-align: left;
                                        font-family: tahoma, arial; font-size: small; width: 150px;">
                                                سوال امنیتی :
                                            </td>
                                            <td align="right" dir="ltr" style="height: 20px; vertical-align: middle; text-align: right;
                                        font-family: tahoma, arial; font-size: small; width: 260px;">
                                                <telerik:RadTextBox ID="txt_Question_Security" Runat="server" 
                                                    EmptyMessage="سوال امنیتی که خود آن را تعیین کرده اید،را وارد کنید" 
                                                    Width="250px">
                                                </telerik:RadTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" dir="rtl" style="height: 20px; vertical-align: middle; text-align: left;
                                        font-family: tahoma, arial; font-size: small; width: 150px;">
                                                جواب سوال :
                                            </td>
                                            <td align="right" dir="ltr" style="height: 20px; vertical-align: middle; text-align: right;
                                        font-family: tahoma, arial; font-size: small; width: 260px;">
                                                <telerik:RadTextBox ID="txt_Answer_Security" Runat="server" 
                                                    EmptyMessage="جواب سوالی امنیتی را که تعیین کرده اید وارد کنید" Width="250px">
                                                </telerik:RadTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" class="" colspan="2" dir="rtl" 
                                    style="height: 17px">
                                                <hr />
                                                <asp:ImageButton ID="Img_btn_Security_Sumit" runat="server" Height="30px" ImageUrl="~/images/submit.png" 
                                        onclick="Img_btn_Security_Sumit_Click" Width="60px" />
                                                <br />
                                                <hr />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" class="" colspan="2" dir="rtl" 
                                    style="height: 17px">
                                                <asp:Literal ID="Literal_Recovery_userpass" runat="server" Mode="PassThrough" 
                                                    ViewStateMode="Disabled"></asp:Literal>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td style="height: 113px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 291px">
                                    &nbsp;
                                </td>
                                <td align="center" dir="rtl" style="width: 347px">
                                    <asp:LinkButton ID="LinkButton3" runat="server" 
                            Font-Names="Tahoma" Font-Size="X-Small" OnClick="LinkButton3_Click">بازگشت به صحفه ورود اعضا</asp:LinkButton>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                </asp:MultiView>
            </div>
        </ContentTemplate>

    </asp:UpdatePanel>
</asp:Content>
