<%@ Page Title="" Language="C#" MasterPageFile="~/master_main.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="WebApplication6.WebForm6" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <head>
        
    </head>
    <body>
    <table style="width: 1024px; height: 500px; font-family: Tahoma, arial; background-repeat: no-repeat; background-image: url('images/contact.jpg');">
        <tr>
            <td style="width: 239px">
                &nbsp;</td>
            <td style="width: 530px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 239px; height: 400px">
            </td>
            <td style="height: 400px; width: 530px">
                <table style="width: 530px; height: 400px;">
                    <tr>
                        <td align="left" dir="rtl" 
                            
                            
                            
                            style="height: 61px; width: 265px;">
                            <telerik:RadTextBox ID="txt_lfname" Runat="server" 
                                EmptyMessage="نام و نام خانوادگی خود را وارد کنید" Width="200px">
                            </telerik:RadTextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txt_lfname" 
                                ErrorMessage="*لطفا نام ونام خانوادگی خود را وارد کنید." Font-Names="Tahoma" 
                                Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                        <td align="left" dir="rtl" 
                            
                            
                            
                            
                            style="background-position: right center; background-image: url('images/2Contact-Us_08.png'); background-repeat: no-repeat; height: 61px;">
                            <telerik:RadTextBox ID="txt_Email" Runat="server" 
                                EmptyMessage="آدر س ایمیل خود را وارد کنید" Width="200px">
                            </telerik:RadTextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txt_Email" 
                                ErrorMessage="*لطفا آدرس پست الکترونیک خود را وارد کنید." Font-Names="Tahoma" 
                                Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" dir="rtl" 
                            
                            
                            
                            style="background-position: right bottom; background-image: url('images/subject.jpg'); background-repeat: no-repeat; width: 265px; height: 63px;">
                            <telerik:RadTextBox ID="txt_subject" Runat="server" 
                                EmptyMessage="عنوان مربوط به پیام خود را وارد نمایید" Width="200px">
                            </telerik:RadTextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="txt_subject" 
                                ErrorMessage="*عنوان مربوط به پیام خود را وارد کنید." Font-Names="Tahoma" 
                                Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                        <td align="left" dir="ltr" 
                            
                            
                            style="background-position: right center; background-image: url('images/2Contact-Us_07.png'); background-repeat: no-repeat; height: 63px;">
                            <telerik:RadTextBox ID="txt_phone" Runat="server" 
                                EmptyMessage="شماره تماس خود را وارد نمایید" Width="200px">
                            </telerik:RadTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" 
                            
                            style="background-position: right center; height: 222px; background-image: url('images/2Contact-Us_05.png'); background-repeat: no-repeat;" 
                            align="left" dir="rtl">
                            <asp:TextBox ID="txt_memo" runat="server" Height="205px" 
                                MaxLength="500" Rows="5" TextMode="MultiLine" ViewStateMode="Enabled" 
                                Width="465px" ToolTip="در این قسمت متن مورد نظر خود را درج کنید" 
                                EnableViewState="False" TabIndex="4"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="txt_memo" ErrorMessage="*متن پیام خود را وارد نمایید." 
                                Font-Names="Tahoma" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:ImageButton ID="Img_btn_Suggest_send" runat="server" 
                                ImageUrl="~/images/NEWsend.png" onclick="Img_btn_Suggest_send_Click" 
                                TabIndex="5" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="height: 400px">
            </td>
        </tr>
        <tr>
            <td style="width: 239px">
                &nbsp;</td>
            <td style="width: 530px; font-family: tahoma; font-size: small; color: #FF0000;" 
                align="center">
                <asp:Literal ID="Literal_Contact" runat="server"></asp:Literal>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    </body>
</asp:Content>
