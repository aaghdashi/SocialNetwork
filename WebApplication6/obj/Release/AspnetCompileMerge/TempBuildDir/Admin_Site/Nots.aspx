<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Site/Admin.Master" AutoEventWireup="true" CodeBehind="Nots.aspx.cs" Inherits="WebApplication6.Admin_Site.Nots" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="mainContent" dir="rtl">
<div style="font-family: Tahoma, arial; font-size: small; text-align: right;">
  &nbsp;مدیر گرامی !<br />
    <dl>
        <dt>شما در این صحفه می توانید محتوای صحفه اصلی خود را درج و یا آن را تغییر دهید.برای 
            انجام این کار مراحل زیر را طی کنید.</dt>
        <dd>
        </dd>
        <dd>
            1- ابتدا عنوان اطلاعیه خود را وارد کنید.</dd>
        <dd>
            2-متن اطلاعیه را با دقت وارد نموده و سپس در صورتی که از صحت اطلاعات وارد شده 
            اطمینان دارید دکمه ثبت اطلاعات را زده ودر غیر این صورت می توانید دکمه انصراف از 
            درج اطلاعیه را بزنید.</dd>
    </dl>
    <br />
    </div>
    <table style="width: 100%;" dir="rtl">
        <tr>
            <td colspan="2">
              <hr style="background-color: #2C3E5B" />
            </td>
        </tr>
        <tr>
            <td align="left">
                &nbsp;
                عنوان اطلاعیه:</td>
            <td>
                <asp:TextBox ID="TextBox_Topic_Note" runat="server" Font-Names="Tahoma"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBox_Topic_Note" ErrorMessage="*" Font-Names="Tahoma" 
                    ForeColor="Red" ValidationGroup="note_validate"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="left">
                &nbsp;متن اطلاعیه:
            </td>
            <td>
                <asp:TextBox ID="TextBox_Body_Memo" runat="server" Height="200px" 
                    TextMode="MultiLine" Width="400px" Font-Names="Tahoma"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextBox_Body_Memo" ErrorMessage="*" Font-Names="Tahoma" 
                    Font-Size="Small" ForeColor="Red" ValidationGroup="note_validate"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="Button_add" runat="server" Font-Names="Tahoma" 
                    Text=" درج اطلاعیه" onclick="Button_add_Click" 
                    ValidationGroup="note_validate" />
                <asp:Button ID="Button_Cancel" runat="server" Font-Names="Tahoma" 
                    Text="انصراف" onclick="Button_Cancel_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
              <hr style="background-color: #2C3E5B" />
            </td>
        </tr>
    </table>
    <asp:GridView ID="GridView_Note" runat="server" CellPadding="4" 
        ForeColor="#333333" GridLines="None" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="ID" 
        DataSourceID="SqlDataSource1" Width="874px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                ShowSelectButton="True" />
            <asp:BoundField DataField="Subject_text" HeaderText="عنوان" 
                SortExpression="Subject_text" />
            <asp:BoundField DataField="Body" HeaderText="متن" SortExpression="Body" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM Main_Content_tbl WHERE (ID = @ID)" 
        SelectCommand="SELECT [Subject_text], [Body], [ID] FROM [Main_Content_tbl] " 
        UpdateCommand="UPDATE Main_Content_tbl SET Subject_text = @TOPIC, Body = @BODY WHERE (ID = @ID)">
        <DeleteParameters>
            <asp:Parameter Name="ID" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="TOPIC" />
            <asp:Parameter Name="BODY" />
            <asp:Parameter Name="ID" />
        </UpdateParameters>
    </asp:SqlDataSource>
  </div>
</asp:Content>
