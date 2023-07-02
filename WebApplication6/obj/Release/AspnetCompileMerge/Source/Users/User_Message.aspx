<%@ Page Title="" Language="C#" MasterPageFile="~/Users/Users_master.Master" AutoEventWireup="true"
    CodeBehind="User_Message.aspx.cs" Inherits="WebApplication6.Users.WebForm7" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="mainContent" align="center">
                <div style="font-family: tahoma, arial; font-size: small; vertical-align: top; width: 874px;"
                    align="center">
                    <asp:ImageButton ID="Img_btn_Show_Recive_Message" runat="server" AlternateText="پیام های دریافتی" ToolTip="پیام های دریافتی"
                        ImageUrl="~/Users/images/mail_attention.png" OnClick="Img_btn_Show_Recive_Message_Click" />
                    <asp:ImageButton ID="Img_btn_Show_Send_message" runat="server" AlternateText="پیام های ارسالی" ToolTip="پیام های ارسالی"
                        ImageUrl="~/Users/images/mess.png" OnClick="Img_btn_Show_Send_message_Click" />
                    <asp:ImageButton ID="Img_btn_Create_Message_User" runat="server" AlternateText="ایجاد پیام" ToolTip="ایجاد پیام"
                        ImageUrl="~/Users/images/Create Mess.png" OnClick="Img_btn_Create_Message_User_Click" />
                </div>
                <asp:MultiView ID="MultiView_Message" runat="server" ActiveViewIndex="0">
                    <asp:View ID="View_Show_Message_User" runat="server">
                        <hr style="background-color: #2C3E5B" />
                        <table style="width: 100%;">
                            <tr>
                                <td style="font-family: tahoma, arial; font-size: small; font-weight: normal; font-style: normal;
                                    text-align: right; vertical-align: middle;" align="right" dir="rtl">
                                    <span style="color: red">
                                        <br />
                                        * </span>در این بخش از سایت شما می توانید به دوستان و سایر کاربران پیام خود
                                    را ارسال کنید.<br />
                                    <br />
                                    <br />
                                    <br />
                                    <span style="color: red">*</span> برای ارسال پیام خود به کاربر مورد نظر بر روی دکمه
                                    ایجاد پیام کلیک کرده و اطلاعات مورد نظر خود را وارد نموده و سپس با تعیین کاربر مورد
                                    نظر&nbsp; بر روی دکمه ارسال کلیک کنید.<br />
                                    <br />
                                    <br />
                                    <br />
                                    <span style="color: red">* </span>برای مشاهده و مدیریت پیام های ارسال شده بر روی
                                    دکمه پیام های ارسالی کلیک نمایید.<br />
                                    <br />
                                    <br />
                                    <br />
                                    <span style="color: red">*</span> برای مشاهده و مدیریت پیام های دریافت شده بر روی
                                    دکمه پیام های دریافتی&nbsp; کلیک نمایید.<br />
                                    <br />
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="View_Create_Message_User" runat="server">
                        <div style="font-family: tahoma, arial; font-size: small; vertical-align: middle;
                            text-align: center; width: 874px; top: 0px; right: 0px" align="center">
                            <table style="width: 100%;" dir="rtl">
                                <tr>
                                    <td colspan="2" dir="rtl">
                                        &nbsp; &nbsp; &nbsp;<span style="color: red">*</span><span style="color: white">کاربر
                                            گرامی شما در این بخش از سایت می توانید به دوست و یا کاربر مورد نظر خود ، پیام خود
                                            را ارسال کنید.</span><br />
                                        <hr style="background-color: #2C3E5B" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" style="border: thin solid #999966; font-size: x-small;">
                                        &nbsp; عنوان پیام:
                                    </td>
                                    <td align="right" style="border: thin solid #999966; font-size: x-small;">
                                        <telerik:RadTextBox ID="RadTextBox_Topic_Message" runat="server" EmptyMessage="عنوان پیام خود را وارد کنید"
                                            Width="125px">
                                        </telerik:RadTextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="RadTextBox_Topic_Message"
                                            ErrorMessage="*" Font-Names="Tahoma" Font-Size="Small" ForeColor="Red" ValidationGroup="message_validate"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" style="border: thin solid #999966; font-size: x-small;">
                                        متن پیام :
                                    </td>
                                    <td align="right" style="border: thin solid #999966; font-size: x-small;">
                                        <telerik:RadTextBox ID="RadTextBox_Body_Message" runat="server" EmptyMessage="متن پیام خود را وارد کنید."
                                            Height="250px" TextMode="MultiLine" Width="450px">
                                        </telerik:RadTextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="RadTextBox_Body_Message"
                                            ErrorMessage="*" Font-Size="Small" ForeColor="Red" ValidationGroup="message_validate"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <hr style="background-color: #2C3E5B" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" style="border: thin solid #999966; font-size: x-small;">
                                        نوع کاربر مورد نظر را انتخاب کنید:
                                    </td>
                                    <td align="right" style="border: thin solid #999966; font-size: x-small;">
                                        <asp:DropDownList ID="DropDownList_Type_User" runat="server" Width="150px" Font-Names="Tahoma"
                                            OnSelectedIndexChanged="DropDownList_Type_User_SelectedIndexChanged" AutoPostBack="True">
                                            <asp:ListItem Value="0">تمامی کاربران</asp:ListItem>
                                            <asp:ListItem Value="1">دوستان</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" style="border: thin solid #999966; font-size: x-small;">
                                        نام کاربری ، کاربر مورد نظر را انتخاب کنید:
                                    </td>
                                    <td align="right" style="border: thin solid #999966; font-size: x-small;">
                                        <asp:DropDownList ID="DropDownList_AccountName" runat="server" Width="150px">
                                        </asp:DropDownList>
                                        <br />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div style="font-family: tahoma, arial; font-size: small; vertical-align: top; width: 750px;
                            text-align: center;">
                            <asp:ImageButton ID="ImageButton_Send_Message" runat="server" Height="30px" ImageUrl="~/images/NEWsend.png"
                                Width="60px" OnClick="ImageButton_Send_Message_Click" />
                                <br />
                            <asp:Literal ID="Literal_message" runat="server"></asp:Literal>
                        </div>
                    </asp:View>
                    <asp:View ID="View_Send_message" runat="server">
                        <div align="center" dir="rtl">
                            <asp:GridView ID="GridView_Send_Message" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource_Send_Message" EmptyDataText="هیچ پیامی از سوی شما به هیچ یک از کاربران و یا دوستانتان ارسال نشده است."
                                ForeColor="#333333" GridLines="None" Width="874px" OnRowDataBound="GridView_Send_Message_RowDataBound">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:CommandField DeleteText="حذف" ShowDeleteButton="True" Visible="False" />
                                    <asp:BoundField DataField="Sender_User_ID" HeaderText="Sender_User_ID" SortExpression="Sender_User_ID"
                                        Visible="False" />
                                    <asp:BoundField DataField="Reciever_User_ID" HeaderText="گیرنده" SortExpression="Reciever_User_ID" />
                                    <asp:BoundField DataField="Topic_Message" HeaderText="عنوان پیام" SortExpression="Topic_Message" />
                                    <asp:BoundField DataField="Text_Message" HeaderText="متن پیام" SortExpression="Text_Message" />
                                    <asp:TemplateField HeaderText="تاریخ ارسال"><ItemTemplate><asp:Label ID="lbl_Date" runat="server" Text='<%# Eval("Date_Create") %>'></asp:Label></ItemTemplate></asp:TemplateField>
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
                            <asp:SqlDataSource ID="SqlDataSource_Send_Message" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                SelectCommand="SELECT Messages_Users_tbl.ID,Messages_Users_tbl.Sender_User_ID,CASE WHEN Messages_Users_tbl.Reciever_User_ID=User_tbl.ID THEN User_tbl.Name + ' ' +User_tbl.Family END AS Reciever_User_ID, Messages_Users_tbl.Topic_Message,Messages_Users_tbl.Text_Message,Messages_Users_tbl.Date_Create FROM [Messages_Users_tbl] INNER JOIN User_tbl ON  Messages_Users_tbl.Reciever_User_ID=User_tbl.ID WHERE ([Sender_User_ID] = @Sender_User_ID) ORDER BY [Date_Create] DESC"
                                ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Messages_Users_tbl] WHERE [ID] = @original_ID "
                                OldValuesParameterFormatString="original_{0}">
                                <DeleteParameters>
                                    <asp:Parameter Name="original_ID" Type="Int32" />
                                </DeleteParameters>
                                <SelectParameters>
                                    <asp:SessionParameter Name="Sender_User_ID" SessionField="id_user" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </asp:View>
                    <asp:View ID="View_Recived_Message" runat="server">
                        <div align="center" dir="rtl">
                            <asp:GridView ID="GridView_Recived_Message" runat="server" AutoGenerateColumns="False"
                                CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource_Recived_Message"
                                EmptyDataText="هیچ پیامی از سوی هیچ یک از کاربران و یا دوستانتان برای شما ارسال نشده است."
                                ForeColor="#333333" GridLines="None" AllowPaging="True" Width="874px" OnRowDataBound="GridView_Recived_Message_RowDataBound">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:CommandField DeleteText="حذف" ShowDeleteButton="True" />
                                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                                        SortExpression="ID" Visible="False" />
                                    <asp:BoundField DataField="Sender_User_ID" HeaderText="فرستنده" SortExpression="Sender_User_ID" />
                                    <asp:BoundField DataField="Reciever_User_ID" HeaderText="Reciever_User_ID" SortExpression="Reciever_User_ID"
                                        Visible="False" />
                                    <asp:BoundField DataField="Topic_Message" HeaderText="عنوان پیام" SortExpression="Topic_Message" />
                                    <asp:BoundField DataField="Text_Message" HeaderText="متن پیام" SortExpression="Text_Message" />
                                    <asp:TemplateField HeaderText="تاریخ دریافت"><ItemTemplate><asp:Label ID="lbl_Date" runat="server" Text='<%# Eval("Date_Create") %>'></asp:Label></ItemTemplate></asp:TemplateField>
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
                            <asp:SqlDataSource ID="SqlDataSource_Recived_Message" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                SelectCommand="SELECT Messages_Users_tbl.ID,CASE WHEN Messages_Users_tbl.Sender_User_ID=User_tbl.ID THEN User_tbl.Name+' '+User_tbl.Family END AS Sender_User_ID,Messages_Users_tbl.Reciever_User_ID,Messages_Users_tbl.Topic_Message, Messages_Users_tbl.Text_Message,Messages_Users_tbl.Date_Create FROM [Messages_Users_tbl] INNER JOIN  User_tbl ON Messages_Users_tbl.Sender_User_ID=User_tbl.ID WHERE ([Reciever_User_ID] = @Reciever_User_ID)"
                                DeleteCommand="DELETE FROM Messages_Users_tbl WHERE (ID = @ID)">
                                <DeleteParameters>
                                    <asp:Parameter Name="ID" />
                                </DeleteParameters>
                                <SelectParameters>
                                    <asp:SessionParameter Name="Reciever_User_ID" SessionField="id_user" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </asp:View>
                </asp:MultiView>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
