<%@ Page Title="" Language="C#" MasterPageFile="~/Users/Users_master.Master" AutoEventWireup="true" CodeBehind="User_Census.aspx.cs" Inherits="WebApplication6.Users.User_Census" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <div class="mainContent" style="font-family: tahoma, arial; font-size: small; vertical-align: top; width: 874px;"align="center">
                    <table style="width: 100%; height: 484px;">
                                                    
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
</asp:Content>
