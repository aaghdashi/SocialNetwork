<%@ Page Title="" Language="C#" MasterPageFile="~/Users/Users_master.Master" AutoEventWireup="true" CodeBehind="User_BlockList.aspx.cs" Inherits="WebApplication6.Users.User_BlockList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="mainContent">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div style="font-family: tahoma, arial; font-size: small; vertical-align: middle; text-align: center; width: 874px; height: 60px; top: 0px; right: 0px">
                    <asp:LinkButton ID="LinkButton_ListFriend" CssClass="link_style" runat="server" OnClick="LinkButton_ListFriend_Click">لیست دوستان</asp:LinkButton>
                    &nbsp&nbsp&nbsp
                    <asp:LinkButton ID="LinkButton_BlockList" CssClass="link_style" runat="server" OnClick="LinkButton_BlockList_Click">ویرایش بلاک لیست</asp:LinkButton>
                </div>
                <asp:MultiView ID="MultiView_Friends" runat="server" ActiveViewIndex="0">
                    <asp:View ID="View_Show_Friends" runat="server">
                        <div class="File_Content" dir="rtl">
                            
                                    <hr style="background-color: #2C3E5B" />
                                    <asp:GridView ID="GridView_Show_Friend" runat="server" AutoGenerateColumns="False"
                                        CellPadding="4" DataSourceID="SqlDataSource_Show_Friends" ForeColor="#333333"
                                        GridLines="None" AllowPaging="True" DataKeyNames="ID" OnSelectedIndexChanged="GridView_Show_Friend_SelectedIndexChanged"
                                        EmptyDataText="شما با هیچ کاربری دوست نیستید." Width="874px" OnRowDataBound="GridView_Show_Friend_RowDataBound" >
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:ImageField DataImageUrlField="User_pic" NullImageUrl="~/Users/images/no_image.png">
                                                <ControlStyle CssClass="picuser" Height="100px" Width="80px" />
                                            </asp:ImageField>
                                            <asp:BoundField DataField="Name" HeaderText="نام" SortExpression="Name" />
                                            <asp:BoundField DataField="Family" HeaderText="نام خانوادگی" SortExpression="Family" />
                                            <asp:BoundField DataField="Account_name" HeaderText="نام کاربری" SortExpression="Account_name" />
                                            <asp:TemplateField HeaderText="تاریخ تولد">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl_Date" runat="server" Text='<%# Eval("Birth_date") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="E_mail" HeaderText=" پست الکترونیک" SortExpression="E_mail" />
                                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                                                SortExpression="ID" Visible="False" />
                                            <asp:CommandField SelectText="بلاک ..." ShowSelectButton="True">
                                                <ControlStyle Font-Names="Tahoma" Font-Size="X-Small" />
                                            </asp:CommandField>
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
                                </div>
                                <asp:SqlDataSource ID="SqlDataSource_Show_Friends" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                    SelectCommand="SELECT DISTINCT User_tbl.Name, User_tbl.Family, User_tbl.Account_name, User_tbl.Birth_date, User_tbl.E_mail, User_tbl.User_pic, User_tbl.ID FROM User_tbl INNER JOIN Request_Friend_tbl ON Request_Friend_tbl.Response_User_ID = User_tbl.ID  WHERE (Request_Friend_tbl.Request_User_ID = @id) AND (Request_Friend_tbl.Flag='true') AND (Request_Friend_tbl.Block='false')
UNION
SELECT DISTINCT User_tbl.Name, User_tbl.Family, User_tbl.Account_name, User_tbl.Birth_date, User_tbl.E_mail, User_tbl.User_pic, User_tbl.ID FROM User_tbl INNER JOIN Request_Friend_tbl ON Request_Friend_tbl.Request_User_ID = User_tbl.ID  WHERE (Request_Friend_tbl.Response_User_ID = @id)  AND (Request_Friend_tbl.Flag='true') AND (Request_Friend_tbl.Block='false')">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="id" SessionField="id_user" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

                            </div>
                        <div align="center" dir="rtl">
                                <asp:Literal ID="Literal_State_Friend" runat="server"></asp:Literal>
                            </div>
                    </asp:View>
                    <asp:View ID="View_Edit_Friends" runat="server">
                        <div class="File_Content" dir="rtl">
                            <hr style="background-color: #2C3E5B" />
                             <div class="File_Content" dir="rtl">
                            <hr style="background-color: #2C3E5B" />
                            <asp:GridView ID="GridView_Edit_Friend" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource_Manage_Friend"
                                ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView_Edit_Friend_SelectedIndexChanged"
                                EmptyDataText="هیچ کاربری در بلاک لیست موجود نیست." Width="874px" 
                                onrowdatabound="GridView_Edit_Friend_RowDataBound">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:CommandField SelectText="مشاهده ..." ShowSelectButton="True" Visible="False">
                                        <ControlStyle Font-Names="Tahoma" Font-Size="X-Small" />
                                    </asp:CommandField>
                                    <asp:ImageField DataImageUrlField="User_pic" NullImageUrl="~/Users/images/no_image.png">
                                        <ControlStyle CssClass="picuser" Height="100px" Width="80px" />
                                        <ItemStyle Font-Names="Tahoma" Font-Size="X-Small" />
                                    </asp:ImageField>
                                    <asp:BoundField DataField="Name" HeaderText="نام" SortExpression="Name" />
                                    <asp:BoundField DataField="Family" HeaderText="نام خانوادگی " SortExpression="Family" />
                                    <asp:BoundField DataField="Account_name" HeaderText="نام کاربری" SortExpression="Account_name" />
                                    <asp:TemplateField HeaderText="تاریخ تولد">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_Date" runat="server" Text='<%# Eval("Birth_date") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="E_mail" HeaderText="پست الکترونیک" SortExpression="E_mail" />
                                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                                        SortExpression="ID" Visible="False" />
                                    <asp:CommandField DeleteText="برداشتن بلاک " ShowDeleteButton="True">
                                        <ControlStyle Font-Names="Tahoma" Font-Size="X-Small" />
                                    </asp:CommandField>
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
                            <asp:SqlDataSource ID="SqlDataSource_Manage_Friend" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                DeleteCommand="
UPDATE Request_Friend_tbl SET Request_Friend_tbl.Block='false' WHERE (Response_User_ID=@ID AND Request_User_ID=@ID) OR (Request_User_ID=@ID AND Response_User_ID=@ID)&quot;;"
                                SelectCommand="SELECT DISTINCT User_tbl.Name, User_tbl.Family, User_tbl.Account_name, User_tbl.Birth_date, User_tbl.E_mail, User_tbl.User_pic, User_tbl.ID FROM User_tbl INNER JOIN Request_Friend_tbl ON Request_Friend_tbl.Response_User_ID = User_tbl.ID  WHERE (Request_Friend_tbl.Request_User_ID = @id) AND (Request_Friend_tbl.Flag='true') AND (Request_Friend_tbl.Block='true')
UNION
SELECT DISTINCT User_tbl.Name, User_tbl.Family, User_tbl.Account_name, User_tbl.Birth_date, User_tbl.E_mail, User_tbl.User_pic, User_tbl.ID FROM User_tbl INNER JOIN Request_Friend_tbl ON Request_Friend_tbl.Request_User_ID = User_tbl.ID  WHERE (Request_Friend_tbl.Response_User_ID = @id)  AND (Request_Friend_tbl.Flag='true') AND (Request_Friend_tbl.Block='true')">
                                <DeleteParameters>
                                    <asp:Parameter Name="ID" />
                                </DeleteParameters>
                                <SelectParameters>
                                    <asp:SessionParameter DefaultValue="" Name="id" SessionField="id_user" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <div align="center" dir="rtl">
                                <asp:Literal ID="Literal_unblock" runat="server"></asp:Literal>
                            </div>
                        </div>
                            
                        </div>
                    </asp:View>
                </asp:MultiView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
