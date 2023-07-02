    <%@ Page Title="" Language="C#" MasterPageFile="~/master_main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication6.WebForm2" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <table id="Table_2" width="500" height="760" border="0" cellpadding="0" 
                cellspacing="0" align="center" bgcolor="White" 
            
            style="font-family: tahoma, 'b zar', arial; width: 960px; height: 500px;">
            <tr>
                <td height="500" rowspan="2" 
                    style="background-image: url(images/left_main.jpg); background-repeat: no-repeat; background-attachment: inherit; " 
                    width="346" >
                <td rowspan="2" height="500" 
                    style="background-repeat: no-repeat; vertical-align: bottom;" 
                    width="380">
                    <div style="font-family: tahoma, arial; font-size: medium; font-weight: normal; font-style: normal; vertical-align: middle; text-align: right; width: 380px;max-width:380px; height: 20px; position: relative;" 
                        dir="rtl">
                    
                        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                    
                    </div>
                   <div style="font-family: tahoma, arial;max-width:380px; font-size: small; vertical-align: middle; text-align: right; width: 380px; height: 300px" 
                        dir="rtl">
                    
                       <asp:Literal ID="Literal2" runat="server"></asp:Literal>
                    
                    </div>
                 
                    <div style="font-family: tahoma, arial; font-size: small; font-weight: normal; font-style: normal; vertical-align: bottom; text-align: center; width: 380px; height: 20px; right: 0px; float: right; bottom: 0px; position: relative;">
                 
                        <asp:Literal ID="Literal3" runat="server"></asp:Literal>
                 
                    </div>
                    <td height="380" 
                    style="background-position: right top; background-image: url(images/top_right_main.jpg); background-repeat: no-repeat;" 
                    width="216" >
                </tr>
            <tr>
                <td height="120" 
                    style="background-position: right bottom; background-image: url(images/bottom_right_main.jpg); background-repeat: no-repeat;" 
                    width="216" >
                    <asp:ImageMap ID="ImageMap1" runat="server" 
                        ImageUrl="~/images/bottom_right_main.jpg">
                        <asp:RectangleHotSpot Bottom="120" HotSpotMode="Navigate" Left="216" 
                             Target="_self" NavigateUrl="~/Census_site.aspx" AlternateText="آمار سایت" />
                    </asp:ImageMap>
                </tr>
        </table>
        <div style="position: fixed; width: 120px; height: 100px; bottom: 0px; left: 0px; float: left;">
       
                <asp:ImageButton ID="ImageButton_Login_admin" runat="server" Height="100px" 
                    ImageUrl="~/images/Control-Panel.png" Width="120px" 
                    onclick="ImageButton_Login_admin_Click" 
                    AlternateText="ورود به بخش مدیریتی سایت" />
    </div>
        </asp:Content>
