<%@ Page Title="" Language="C#" MasterPageFile="~/master_main.Master" AutoEventWireup="true"
    CodeBehind="User_info.aspx.cs" Inherits="WebApplication6.User_info" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script language="javascript" type="text/javascript">
// <![CDATA[

        function Button_Return_onclick() {
            history.go(-1);
        }

// ]]>
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="font-family: tahoma,arial; font-size: small; font-weight: normal; font-style: normal;
        text-align: center; color: #BCC7D8; width: 960px; height: 400px; top: 0px; right: 0px;
        background-color: #92C8FF;" dir="rtl" align="center">
        <table dir="rtl" style="width: 550px; height: 400px;">
            <tr>
                <td align="right" cols="2" style="font-family: tahoma, arial; font-size: 12px; color: #000000;
                    line-height: normal; vertical-align: middle; text-align: right; width: 100px;
                    height: 15px;">
                    <asp:Image ID="Image1" runat="server" Height="120px" Width="90px" />
                </td>
            </tr>
            <tr>
                <td align="left" style="border-bottom: thin dotted #FFFFFF; font-family: tahoma, arial;
                    font-size: 12px; color: #000000; line-height: normal; vertical-align: middle;
                    text-align: left; width: 100px; height: 15px;">
                    نام:
                </td>
                <td style="border-bottom: thin dotted #FFFFFF; font-family: tahoma, arial; font-size: small;
                    font-weight: normal; line-height: normal; vertical-align: middle; text-align: right;
                    width: 450px; height: 15px; border-bottom: thin dotted #FFFFFF">
                    <asp:Label ID="lbl_Name_Result" runat="server" ForeColor="Black" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="left" style="border-bottom: thin dotted #FFFFFF; font-family: tahoma, arial;
                    font-size: 12px; color: #000000; line-height: normal; vertical-align: middle;
                    text-align: left; width: 100px; height: 15px;">
                    نام خانوادگی:
                </td>
                <td style="border-bottom: thin dotted #FFFFFF; font-family: tahoma, arial; font-size: small;
                    font-weight: normal; line-height: normal; vertical-align: middle; text-align: right;
                    width: 450px; height: 15px; border-bottom: thin dotted #FFFFFF">
                    <asp:Label ID="lbl_Family_Result" runat="server" ForeColor="Black" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="left" style="border-bottom: thin dotted #FFFFFF; font-family: tahoma, arial;
                    font-size: 12px; color: #000000; line-height: normal; vertical-align: middle;
                    text-align: left; width: 100px; height: 15px;">
                    نام کاربری :
                </td>
                <td style="border-bottom: thin dotted #FFFFFF; font-family: tahoma, arial; font-size: small;
                    font-weight: normal; line-height: normal; vertical-align: middle; text-align: right;
                    width: 450px; height: 15px; border-bottom: thin dotted #FFFFFF">
                    <asp:Label ID="lbl_AccountName_Result" runat="server" ForeColor="Black" 
                        Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="left" style="border-bottom: thin dotted #FFFFFF; font-family: tahoma, arial;
                    font-size: 12px; color: #000000; line-height: normal; vertical-align: middle;
                    text-align: left; width: 100px; height: 15px;">
                    جنسیت :
                </td>
                <td style="border-bottom: thin dotted #FFFFFF; font-family: tahoma, arial; font-size: small;
                    font-weight: normal; line-height: normal; vertical-align: middle; text-align: right;
                    width: 450px; height: 15px; border-bottom: thin dotted #FFFFFF">
                    <asp:Label ID="lbl_Sex_Result" runat="server" ForeColor="Black" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="left" style="border-bottom: thin dotted #FFFFFF; font-family: tahoma, arial;
                    font-size: 12px; color: #000000; line-height: normal; vertical-align: middle;
                    text-align: left; width: 100px; height: 15px;">
                    رشته تحصیلی :
                </td>
                <td style="border-bottom: thin dotted #FFFFFF; font-family: tahoma, arial; font-size: small;
                    font-weight: normal; line-height: normal; vertical-align: middle; text-align: right;
                    width: 450px; height: 15px; border-bottom: thin dotted #FFFFFF">
                    <asp:Label ID="lbl_Mager_Result" runat="server" ForeColor="Black" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="left" style="border-bottom: thin dotted #FFFFFF; font-family: tahoma, arial;
                    font-size: 12px; color: #000000; line-height: normal; vertical-align: middle;
                    text-align: left; width: 100px; height: 15px;">
                    محل زندگی :
                </td>
                <td style="border-bottom: thin dotted #FFFFFF; font-family: tahoma, arial; font-size: small;
                    font-weight: normal; line-height: normal; vertical-align: middle; text-align: right;
                    width: 450px; height: 15px; border-bottom: thin dotted #FFFFFF">
                    <asp:Label ID="lbl_CityLive_Result" runat="server" ForeColor="Black" 
                        Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="left" style="border-bottom: thin dotted #FFFFFF; font-family: tahoma, arial;
                    font-size: 12px; color: #000000; line-height: normal; vertical-align: middle;
                    text-align: left; width: 100px; height: 15px;">
                    پست الکترونیک :</td>
                <td style="border-bottom: thin dotted #FFFFFF; font-family: tahoma, arial; font-size: small;
                    font-weight: normal; line-height: normal; vertical-align: middle; text-align: right;
                    width: 450px; height: 15px; border-bottom: thin dotted #FFFFFF">
                    <asp:Label ID="lbl_Email_Result" runat="server" style="color: #000000" 
                        Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="left" style="border-bottom: thin dotted #FFFFFF; font-family: tahoma, arial;
                    font-size: 12px; color: #000000; line-height: normal; vertical-align: middle;
                    text-align: left; width: 100px; height: 15px;">
                    علایق :
                </td>
                <td style="border-bottom: thin dotted #FFFFFF; font-family: tahoma, arial; font-size: small;
                    font-weight: normal; line-height: normal; vertical-align: middle; text-align: right;
                    width: 450px; height: 15px; border-bottom: thin dotted #FFFFFF">
                    <asp:Label ID="lbl_Favorites_Result" runat="server" ForeColor="Black" 
                        Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="left" style="border-bottom: thin dotted #FFFFFF; font-family: tahoma, arial;
                    font-size: 12px; color: #000000; line-height: normal; vertical-align: middle;
                    text-align: left; width: 100px; height: 15px;">
                    توضیحات :
                </td>
                <td style="border-bottom: thin dotted #FFFFFF; font-family: tahoma, arial; font-size: small;
                    font-weight: normal; line-height: normal; vertical-align: middle; text-align: right;
                    width: 450px; height: 15px; border-bottom: thin dotted #FFFFFF">
                    <asp:Label ID="lbl_Description_Result" runat="server" ForeColor="Black" 
                        Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center" style="font-family: tahoma, arial;
                    font-size: 12px; color: #000000; line-height: normal; vertical-align: middle;
                    height: 15px;" colspan="2">
                    <input id="Button_Return" style="font-family: tahoma" type="button" 
                        value="بازگشت به صحفه قبل" onclick="return Button_Return_onclick()" /></td>
            </tr>
        </table>
    </div>
</asp:Content>
