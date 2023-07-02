<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Site/Admin.Master" AutoEventWireup="true" CodeBehind="Contact_User.aspx.cs" Inherits="WebApplication6.Admin_Site.Contact_User" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            font-size: x-small;
        }
        .style2
        {
            color: #FF0000;
        }
        .style3
        {
            color: #FFFFFF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
 <div class="mainContent" dir="rtl">
     * مدیر گرامی شما در این قسمت از سایت می توانید با کاربرانی که از سایت انتقاد 
     ،پشنهاد و یا تعریف کرده اند ارتباط برقرار کرده و همچنین به سوالات آنها جواب 
     دهید.<br />
                <hr style="background-color: #2C3E5B" />
            <br />
     <table style="width: 100%;">
         <tr>
             <td colspan="2">
                 <span class="style2">*</span> <span class="style1"><span class="style3">لیست 
                 کاربرانی که از طریق صفحه ارتباط با مدیر سایت نظرات ، سوالات و پیشنهادات خود را 
                 ارائه کرده اند.<br />
                 </span>
                <hr style="background-color: #2C3E5B" />
                 </span>
             </td>
         </tr>
         <tr>
             <td align="center" colspan="2">
                 <asp:GridView ID="GridView_Contact" runat="server" AllowPaging="True" 
                     AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" 
                     DataSourceID="SqlDataSource_Cantact_By_User" ForeColor="#333333" 
                     GridLines="None" 
                     onselectedindexchanged="GridView_Contact_SelectedIndexChanged" Width="750px">
                     <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                     <Columns>
                         <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" 
                             DeleteText="حذف" SelectText="انتخاب" />
                         <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                             ReadOnly="True" SortExpression="ID" Visible="False" />
                         <asp:BoundField DataField="Name" HeaderText="نام کاربر" SortExpression="Name" />
                         <asp:BoundField DataField="E_mail" HeaderText="آدرس پست الکترونیک" 
                             SortExpression="E_mail" />
                         <asp:BoundField DataField="Telephone" HeaderText="شماره تماس" 
                             SortExpression="Telephone" />
                         <asp:BoundField DataField="Subject" HeaderText="عنوان پیام" 
                             SortExpression="Subject" />
                         <asp:BoundField DataField="Body" HeaderText="متن پیام" SortExpression="Body" />
                     </Columns>
                     <EditRowStyle BackColor="#999999" />
                     <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                     <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                     <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                     <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                     <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                     <SortedAscendingCellStyle BackColor="#E9E7E2" />
                     <SortedAscendingHeaderStyle BackColor="#506C8C" />
                     <SortedDescendingCellStyle BackColor="#FFFDF8" />
                     <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource_Cantact_By_User" runat="server" 
                     ConflictDetection="CompareAllValues" 
                     ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                     DeleteCommand="DELETE FROM [Suggest_tbl] WHERE [ID] = @original_ID AND (([E_mail] = @original_E_mail) OR ([E_mail] IS NULL AND @original_E_mail IS NULL)) AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL)) AND (([Telephone] = @original_Telephone) OR ([Telephone] IS NULL AND @original_Telephone IS NULL)) AND (([Subject] = @original_Subject) OR ([Subject] IS NULL AND @original_Subject IS NULL)) AND (([Body] = @original_Body) OR ([Body] IS NULL AND @original_Body IS NULL))" 
                     InsertCommand="INSERT INTO [Suggest_tbl] ([E_mail], [Name], [Telephone], [Subject], [Body]) VALUES (@E_mail, @Name, @Telephone, @Subject, @Body)" 
                     OldValuesParameterFormatString="original_{0}" 
                     SelectCommand="SELECT [E_mail], [ID], [Name], [Telephone], [Subject], [Body] FROM [Suggest_tbl]" 
                     UpdateCommand="UPDATE [Suggest_tbl] SET [E_mail] = @E_mail, [Name] = @Name, [Telephone] = @Telephone, [Subject] = @Subject, [Body] = @Body WHERE [ID] = @original_ID AND (([E_mail] = @original_E_mail) OR ([E_mail] IS NULL AND @original_E_mail IS NULL)) AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL)) AND (([Telephone] = @original_Telephone) OR ([Telephone] IS NULL AND @original_Telephone IS NULL)) AND (([Subject] = @original_Subject) OR ([Subject] IS NULL AND @original_Subject IS NULL)) AND (([Body] = @original_Body) OR ([Body] IS NULL AND @original_Body IS NULL))">
                     <DeleteParameters>
                         <asp:Parameter Name="original_ID" Type="Int32" />
                         <asp:Parameter Name="original_E_mail" Type="String" />
                         <asp:Parameter Name="original_Name" Type="String" />
                         <asp:Parameter Name="original_Telephone" Type="String" />
                         <asp:Parameter Name="original_Subject" Type="String" />
                         <asp:Parameter Name="original_Body" Type="String" />
                     </DeleteParameters>
                     <InsertParameters>
                         <asp:Parameter Name="E_mail" Type="String" />
                         <asp:Parameter Name="Name" Type="String" />
                         <asp:Parameter Name="Telephone" Type="String" />
                         <asp:Parameter Name="Subject" Type="String" />
                         <asp:Parameter Name="Body" Type="String" />
                     </InsertParameters>
                     <UpdateParameters>
                         <asp:Parameter Name="E_mail" Type="String" />
                         <asp:Parameter Name="Name" Type="String" />
                         <asp:Parameter Name="Telephone" Type="String" />
                         <asp:Parameter Name="Subject" Type="String" />
                         <asp:Parameter Name="Body" Type="String" />
                         <asp:Parameter Name="original_ID" Type="Int32" />
                         <asp:Parameter Name="original_E_mail" Type="String" />
                         <asp:Parameter Name="original_Name" Type="String" />
                         <asp:Parameter Name="original_Telephone" Type="String" />
                         <asp:Parameter Name="original_Subject" Type="String" />
                         <asp:Parameter Name="original_Body" Type="String" />
                     </UpdateParameters>
                 </asp:SqlDataSource>
             </td>
         </tr>
         <tr>
             <td colspan="2">
                 <span class="style1">
                <hr style="background-color: #2C3E5B" />
                 </span>
             </td>
         </tr>
         <tr>
             <td align="left" dir="rtl" 
                 style="border: thin solid #999966; font-size: x-small;">
                 آدرس پست الکترونیک :</td>
             <td style="border: thin solid #999966; font-size: x-small;">
                 <asp:TextBox ID="TextBox_Email_Address" runat="server" Width="300px"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                     ControlToValidate="TextBox_Email_Address" ErrorMessage="*" Font-Names="Tahoma" 
                     Font-Size="Small" ForeColor="Red" ValidationGroup="mail_validate"></asp:RequiredFieldValidator>
             </td>
         </tr>
         <tr>
             <td align="left" dir="rtl" 
                 style="border: thin solid #999966; font-size: x-small;">
                 عنوان پیام :</td>
             <td style="border: thin solid #999966; font-size: x-small;">
                 <asp:TextBox ID="TextBox_Topic_message" runat="server" Width="400px"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                     ControlToValidate="TextBox_Topic_message" ErrorMessage="*" Font-Size="Small" 
                     ForeColor="Red" ValidationGroup="mail_validate"></asp:RequiredFieldValidator>
             </td>
         </tr>
         <tr>
             <td align="left" dir="rtl" 
                 style="border: thin solid #999966; font-size: x-small;">
                 متن پیام :</td>
             <td style="border: thin solid #999966; font-size: x-small;">
                 <asp:TextBox ID="TextBox_Body_Message" runat="server" EnableViewState="False" 
                     Height="200px" TextMode="MultiLine" Width="400px"></asp:TextBox>
             </td>
         </tr>
         <tr>
             <td align="center" colspan="2">
                 <asp:ImageButton ID="ImageButton_Send_Email" runat="server" Height="30px" 
                     ImageUrl="~/images/NEWsend.png" Width="60px" 
                     onclick="ImageButton_Send_Email_Click" ValidationGroup="mail_validate" />
                 <br />
                 <asp:Literal ID="Literal_Mail" runat="server"></asp:Literal>
             </td>
         </tr>
     </table>
 </div>
</asp:Content>
