<%@ Page Title="" Language="C#" MasterPageFile="~/master_main.Master" AutoEventWireup="true" CodeBehind="Census_site.aspx.cs" Inherits="WebApplication6.Census_site" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script language="javascript" type="text/javascript">
// <![CDATA[

        function Button_Return_onclick()
         {
            window.history.go(-1);
            
        }

// ]]>
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style="background-repeat: no-repeat; width: 960px; height: 500px; background-image: url('images/consus.png');" >
<div style="font-family: tahoma, arial; font-size: small; float: right; width: 500px; height: 500px; position: relative; top: 0px; right: 200px; vertical-align: middle; text-align: center;" 
        align="center">
        
    <table style="width:100%;" dir="ltr">
        <tr>
            <td dir="rtl" height="80" colspan="2">
                &nbsp;</td>
            <td dir="rtl" width="150" height="80" colspan="2">
                &nbsp;</td>
            <td height="80">
                &nbsp;</td>
        </tr>
        <tr>
            <td dir="rtl" colspan="5">
              <hr style="color:Silver " /></td>
        </tr>
        <tr>
            <td dir="ltr" align="right">
                <asp:Label ID="Label_Milady_date" runat="server" Text="Label"></asp:Label>
            </td>
            <td dir="rtl" align="left">
                &nbsp;مصادف با:&nbsp;</td>
            <td dir="ltr" align="right">
                <asp:Label ID="lbl_Date" runat="server" Text="Label"></asp:Label>
            </td>
            <td dir="rtl" align="right">
                <asp:Label ID="Label1" runat="server" Text="امروز :"></asp:Label>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td dir="rtl" align="right">
                &nbsp;</td>
            <td dir="rtl" align="left">
                &nbsp;</td>
            <td dir="rtl" align="right">
                <asp:Label ID="Label_Time" runat="server" Text="Label"></asp:Label>
            </td>
            <td dir="rtl" align="right">
                ساعت :</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td dir="rtl" align="right" colspan="4">
                تعداد کل بازدید ها :<asp:Label ID="lbl_All_Visited" runat="server" Text="Label"></asp:Label>
            </td>
            <td style="background-position: right center; width: 32px; height: 32px; background-repeat: no-repeat; background-image: url('images/histogram.png');">
                &nbsp;</td>
        </tr>
        <tr>
            <td dir="rtl" align="right" colspan="4">
                تعداد کاربران آنلاین :<asp:Label ID="lbl_Online_user" runat="server" 
                    Text="Label"></asp:Label>
            </td>
            <td style="background-position: right center; width: 32px; height: 32px; background-repeat: no-repeat; background-image: url('images/histogram.png');">
                &nbsp;</td>
        </tr>
        <tr>
            <td dir="rtl" align="right" colspan="4">
                تعداد بازدید های امروز :<asp:Label ID="lbl_Today_visite" runat="server" 
                    Text="Label"></asp:Label>
            </td>
            <td style="background-position: right center; width: 32px; height: 32px; background-repeat: no-repeat; background-image: url('images/histogram.png');">
                &nbsp;</td>
        </tr>
        <tr>
            <td dir="rtl" align="right" colspan="4">
                تعداد کاربران عضو :<asp:Label ID="lbl_Count_User" runat="server" Text="Label"></asp:Label>
            </td>
            <td style="background-position: right center; width: 32px; height: 32px; background-repeat: no-repeat; background-image: url('images/histogram.png');">
                &nbsp;</td>
        </tr>
        <tr>
            <td dir="rtl" align="right" colspan="4">
                تعداد گروه های مو جود :<asp:Label ID="lbl_Count_Group" runat="server" 
                    Text="Label"></asp:Label>
            </td>
            <td style="background-position: right center; width: 32px; height: 32px; background-repeat: no-repeat; background-image: url('images/histogram.png');">
                &nbsp;</td>
        </tr>
        <tr>
            <td dir="rtl" align="center" colspan="5">
                <hr style="color:Silver" width="320" />
            </td>
        </tr>
        <tr>
            <td dir="rtl" align="center" colspan="4">
                <input id="Button_Return" style="font-family: tahoma" type="button" 
                    value="بازگشت به صحفه قبل" onclick="return Button_Return_onclick()" /></td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</div>
</div>
</asp:Content>
