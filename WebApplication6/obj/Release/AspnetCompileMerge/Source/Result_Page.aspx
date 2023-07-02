<%@ Page Title="" Language="C#" MasterPageFile="~/master_main.Master" AutoEventWireup="true"
    CodeBehind="Result_Page.aspx.cs" Inherits="WebApplication6.Result_Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script language="javascript" type="text/javascript">
// <![CDATA[

        function Button2_onclick() {
            window.history.go(-1);
        }

// ]]>
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="right" dir="rtl" style="font-size: small; vertical-align: middle; text-align: center;
        width: 960px; height: 500px; top: 0px; font-weight: normal; font-style: normal;
        color: #000000; right: 115px; background-image: url('images/Result_back.jpg');">
        <div align="center" 
            style="position: relative; vertical-align: middle; width: 350px; right: 250px; float: right; top: 100px;">
         
        <asp:Literal ID="Literal_Result" runat="server"></asp:Literal>

        </div>
        <div style="position: absolute; vertical-align: middle; width: 420px; right: 80px; float: right; top: 700px;">
        
            <asp:Button ID="btn_Return_try" runat="server" Font-Names="Tahoma" 
                onclick="btn_Return_try_Click" Text="تلاش مجدد" Visible="False" />
            <asp:Button ID="btn_Login" runat="server" onclick="btn_Login_Click" 
                Text="صحفه ورود اعضا" Visible="False" Font-Names="Tahoma" />
        
            <input id="Button2" type="button" value="بازگشت به صحفه قبل" 
                onclick="return Button2_onclick()" style="font-family: tahoma" /></div>
    </div>
</asp:Content>
