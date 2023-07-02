<%@ Page Title="" Language="C#" MasterPageFile="~/Users/Users_master.Master" AutoEventWireup="true" CodeBehind="Users_post.aspx.cs" Inherits="WebApplication6.Users.Users_post" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:ScriptManager ID="ScriptManager_Post" runat="server">
    </asp:ScriptManager>
    <div class="mainContent" align="center">
      
                <asp:MultiView ID="MultiView_Post" runat="server" ActiveViewIndex="0">
                    <asp:View ID="View_Show_post" runat="server">
                        <div class="mainContent_message" dir="rtl">
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                SelectCommand="SELECT ID_User, Title, Body, DT_Create, ID FROM Post_Users_tbl WHERE (ID_User = @ID_User)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="ID_User" SessionField="id_user" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:Repeater ID="Repeater_post" runat="server" DataSourceID="SqlDataSource2" 
                                onitemdatabound="Repeater_post_ItemDataBound">
                                <HeaderTemplate>
                                    <p dir="rtl" align="center" style="font-family: tahoma, arial; font-size: small;
                                        color: #FF0000; vertical-align: middle; text-align: center">
                                        «پست های درج شده»</p>
                                    <hr style="background-color: #2C3E5B" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <div>
                                        <p dir="rtl" style="text-align: right">
                                            <span style="font-size: x-small; color: #666666;">تاریخ:</span><asp:Label ID="lbl_date"
                                                runat="server" Text='<%#Eval("DT_Create")%>'></asp:Label>
                                        </p>
                                    </div>
                                    <div dir="rtl" style="text-align: right">
                                        <pre><span style="font-size: x-small; color: #666666;">عنوان پست:</span><%#Eval("Title")%></pre>
                                    </div>
                                    <div dir="rtl" style="text-align: right">
                                        <pre><span style="font-size: x-small; color: #666666;">متن پست:</span><%#Eval("Body")%></pre>
                                    </div>
                                    <a href="Users_post.aspx?id=<%#Eval("ID") %>&mode=Edit" class="link_style">ویرایش&nbsp;&nbsp;
                                    </a>
                                    <a href="Users_post.aspx?id=<%#Eval("ID") %>&mode=Delete" class="link_style">حذف
                                    </a>
                                    <br />
                                    <a class="link_style" href="Users_comments.aspx?post_id=<%#Eval("ID") %>" dir="rtl">...نظرات</a>
                                    <hr style="background-color: #2C3E5B" />
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <div class="mainContent_message">
                            <table width="750" style="max-width: 750px; max-height: 250px;">
                                <tr>
                                    <td style="border: thin solid #999966; font-size: x-small;">
                                        &nbsp;
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_topic" runat="server" ControlToValidate="TextBox_Topic"
                                            ErrorMessage="*" ForeColor="Red" ValidationGroup="validate"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="TextBox_Topic" runat="server"></asp:TextBox>
                                    </td>
                                    <td align="left" dir="rtl" style="border: thin solid #999966; font-size: x-small;"
                                        width="150">
                                        عنوان پست : &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" dir="rtl" style="border: thin solid #999966; font-size: x-small;">
                                        <asp:TextBox ID="TextBox_Body" runat="server" Rows="12" TextMode="MultiLine" 
                                            Width="670px" Height="250px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_Body_Post" runat="server"
                                            ControlToValidate="TextBox_Body" ErrorMessage="متن پست خود را وارد کنید." Font-Names="Tahoma"
                                            Font-Size="X-Small" ForeColor="Red" ValidationGroup="validate"></asp:RequiredFieldValidator>
                                    </td>
                                    <td align="left" dir="rtl" style="border: thin solid #999966; font-size: x-small;"
                                        width="150px">
                                        متن پست : &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <asp:Button ID="Button_Cancel_Post" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                            Text="انصراف" OnClick="Button_Cancel_Post_Click" />
                                        <asp:Button ID="Button_Add_Post" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                            OnClick="Button_Add_Post_Click" Text="اضافه کن" ValidationGroup="validate" />
                                        <hr style="background-color: #2C3E5B" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        &nbsp;
                                        <asp:Literal ID="Literal_add_post" runat="server"></asp:Literal>
                                        &nbsp;
                                        <br />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            Caption="مدیریت پست ها" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource_Post"
                            EmptyDataText="هیچ پستی از سوی شما درج نشده است." ForeColor="#333333" GridLines="None"
                            Width="750px">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                                    SortExpression="ID" Visible="False" />
                                <asp:BoundField DataField="DT_Create" HeaderText="تاریخ ایجاد" SortExpression="DT_Create" />
                                <asp:BoundField DataField="Body" HeaderText="متن پست" SortExpression="Body" />
                                <asp:BoundField DataField="Title" HeaderText="عنوان پست" SortExpression="Title" />
                                <asp:CommandField CancelText="انصراف" DeleteText="حذف" EditText="ویرایش" ShowDeleteButton="True"
                                    ShowEditButton="True" UpdateText="ثبت" />
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource_Post" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                            DeleteCommand="DELETE FROM Post_Users_tbl WHERE (ID = @ID)" SelectCommand="SELECT Title, Body, DT_Create, ID FROM Post_Users_tbl WHERE (ID_User = @ID_User)"
                            UpdateCommand="UPDATE Post_Users_tbl SET Title =@Title, Body =@Body WHERE ID=@ID">
                            <DeleteParameters>
                                <asp:Parameter Name="ID" />
                            </DeleteParameters>
                            <SelectParameters>
                                <asp:SessionParameter Name="ID_User" SessionField="id_user" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Title" />
                                <asp:Parameter Name="Body" />
                                <asp:Parameter Name="ID" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </asp:View>
                    <asp:View ID="View_Edit_post" runat="server">
                        <div class="mainContent_message">
                            <table width="750" style="max-width: 750px; max-height: 250px;">
                                <tr>
                                    <td colspan="2">
                                        <p dir="rtl" style="color: #FFFFFF">
                                            <span style="color: red">*</span> کاربر گرامی شما در این صحفه می توانید پست انتخابی
                                            خود را ویرایش نمایید بعد از اصلاح پست مورد نظر خود می توانید بر روی دکمه اضافه کن
                                            کلیک نمایید.</p>
                                        <hr style="background-color: #2C3E5B" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border: thin solid #999966; font-size: x-small;" align="right">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_Edit_Topic_Post" runat="server"
                                            ControlToValidate="TextBox_edit_topic" ErrorMessage="*" ForeColor="Red" 
                                            ValidationGroup="validate_Edit"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="TextBox_edit_topic" runat="server"></asp:TextBox>
                                    </td>
                                    <td align="left" dir="rtl" style="border: thin solid #999966; font-size: x-small;">
                                        عنوان پست : &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" dir="rtl" style="border: thin solid #999966; font-size: x-small;"
                                        width="600">
                                        <asp:TextBox ID="TextBox_edit_body_post" runat="server" Height="250px" 
                                            Width="670px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_Edit_Post" runat="server"
                                            ControlToValidate="TextBox_edit_body_post" ErrorMessage="متن پست خود را وارد کنید." Font-Names="Tahoma"
                                            Font-Size="X-Small" ForeColor="Red" ValidationGroup="validate_Edit"></asp:RequiredFieldValidator>
                                    </td>
                                    <td align="left" dir="rtl" style="border: thin solid #999966; font-size: x-small;">
                                        متن پست : &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" style="border: thin solid #999966; font-size: x-small;">
                                        <asp:Button ID="Button_Cancel_Edit" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                            OnClick="Button_Cancel_Edit_Click" Text="انصراف" />
                                        <asp:Button ID="Button_Edit_Post" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                            OnClick="Button_Edit_Post_Click" Text="ویرایش کن" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" dir="rtl">
                                        &nbsp;
                                        <asp:Literal ID="Literal_Edit_Post" runat="server"></asp:Literal>
                                        &nbsp;
                                        <br />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:View>
                    <asp:View ID="View_Delete_post" runat="server">
                        <div class="mainContent_message" dir="rtl" align="center">
                            کاربر گرامی پست شما با موفقیت حذف شد.
                        </div>
                        <div align="center">
                            <asp:Button ID="Button_Return" runat="server" Text="بازگشت" Font-Names="Tahoma" 
                                onclick="Button_Return_Click" />
                        </div>
                    </asp:View>
                </asp:MultiView>
         
    </div>
    <telerik:RadAjaxManager runat="server" ID="RadAjaxManager1">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadEditor1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadEditor1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
</asp:Content>
