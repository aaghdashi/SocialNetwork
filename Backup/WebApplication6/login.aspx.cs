using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication6
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        Cloop_class New_user = new Cloop_class();
        SqlCommand new_command = new SqlCommand();
        SqlConnection new_connection = new SqlConnection();
        public int _type_user;
        SqlDataReader DR;

        public void Set_login_state(int _id)
        {
            new_connection.ConnectionString = New_user.ConnectionString;
            new_connection.Open();
            new_command.Connection = new_connection;
            new_command.CommandText = "UPDATE User_tbl SET Log_In_State='True' WHERE ID ='"+_id+"'";
            new_command.ExecuteNonQuery();
            new_connection.Close();

        }

        public void Cookie_UserPass()
       
        {
            if (txt_username.Text != null && txt_password.Text != null)
            {
                    HttpCookie Login_Cookie = new HttpCookie("User_Pass");
                    Login_Cookie.Value = txt_username.Text;
                    Request.Cookies.Add(Login_Cookie);
                    Request.Cookies["User_Pass"].Expires = DateTime.Now.Date.AddMonths(1);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                MultiView_Login.ActiveViewIndex = 0;
            }
         

        }

       

        protected void img_btn_submit_Click(object sender, ImageClickEventArgs e)
        {


            string _Select_command="";

            //بررسی مدیر یا کاربر بودن
            if(RadioButtonList_member.SelectedValue=="0")
            {
                _type_user = 0;
                _Select_command = "SELECT ID FROM User_tbl WHERE Password='" + txt_password.Text + "' AND Account_name='" + txt_username.Text + "'";

            }
            else if(RadioButtonList_member.SelectedValue=="1")
            {
                _type_user = 1;
                _Select_command = "SELECT ID_Creator,ID FROM Group_tbl WHERE Admin_Password='" + txt_password.Text.Trim() + "' AND Admin_Name='" + txt_username.Text.Trim() + "'";
            }
            try
            {
                New_user.SignIn_User(_Select_command);
            }
            catch (Exception _Error)
            {

                Response.Redirect("~/Error_Page.aspx?Error=" + _Error.Message.ToString());
                throw;
            }
            finally
            {
                if (New_user._State_login == 1)
                {
                    switch (_type_user)
                    {
                        case 0:
                            Session.Clear();
                            Session.Add("id_user", New_user.ID);
                            Session.Timeout = 300;
                            Set_login_state(New_user.ID);
                            Response.Redirect("/Users/Main_page_user.aspx");
                            break;
                        case 1:
                            Session.Clear();
                            Session.Add("id_user", New_user.ID);

                             new_connection.ConnectionString = New_user.ConnectionString;
                             new_connection.Open();
                             new_command.Connection = new_connection;
                             new_command.CommandText =_Select_command;
                             DR=new_command.ExecuteReader();
                            DR.Read();
                            Session.Add("id_group",Convert.ToInt32(DR[1]));
                            new_connection.Close();
                            DR.Close();
                            Response.Redirect("/Groups/Main_Page_Group.aspx");
                            break;
                    }
                }
                else
                {
                    Literal_Login_state.Text = "نام کاربری و یا رمز عبور خود را اشتباه وارد کرده اید.";
                }
            }
           
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            MultiView_Login.ActiveViewIndex = 1;
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            MultiView_Login.ActiveViewIndex = 0;
        }

        protected void Img_btn_Security_Sumit_Click(object sender, ImageClickEventArgs e)
        {
            Cloop_class New_user = new Cloop_class();
            string _Select_command_Security;

            if (RadioButtonList_Recovry_Password.SelectedIndex == 0)
            {
                _Select_command_Security = "SELECT Account_name,Password FROM User_tbl WHERE Account_name='" + txt_username_Recovery.Text.Trim() + "' AND Security_Question='" + txt_Question_Security.Text.Trim() + "' AND Security_Answer='" + txt_Answer_Security.Text.Trim() + "' ";
                Literal_Recovery_userpass.Text = New_user.Recovery_user_password(_Select_command_Security);
            }
            else if (RadioButtonList_Recovry_Password.SelectedIndex == 1)
            {
                _Select_command_Security = "SELECT Admin_Name,Admin_Password FROM Group_tbl WHERE Admin_Name='" + txt_username_Recovery.Text.Trim() + "' AND Security_Question='" + txt_Question_Security.Text.Trim() + "' AND Security_Answer='" + txt_Answer_Security.Text.Trim() + "' ";
                Literal_Recovery_userpass.Text = New_user.Recovery_user_password(_Select_command_Security);
            }

        }

      
    }
}