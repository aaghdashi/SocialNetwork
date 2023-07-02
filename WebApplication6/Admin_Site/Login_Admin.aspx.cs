using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication6.Admin_Site
{
    public partial class Login_Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button_Return_mainpage_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }

        protected void Button_Login_Admin_Click(object sender, EventArgs e)
        {
            Cloop_class Connection = new Cloop_class();
            SqlConnection new_connection = new SqlConnection();
            new_connection.ConnectionString = Connection.ConnectionString;
            SqlDataReader DR;
            SqlCommand new_command = new SqlCommand();
            new_command.Connection = new_connection;
            try
            {
                new_connection.Open();
                string _str = "SELECT ID,UserName,PassWord FROM  Admins_tbl WHERE UserName='" + TextBox_Account_Name.Text + "' AND PassWord='" + TextBox_Password.Text + "'";
                new_command.CommandText = _str;
                DR=new_command.ExecuteReader();
                if (DR.HasRows)
                {
                    DR.Read();
                    Session["ID"] = DR[0].ToString();
                    Response.Redirect("~/Admin_Site/Nots.aspx");
                    DR.Close();
                }
                else
                    Literal_Login_Admin.Text = "نام کاربری و یا رمز عبور به درستی وارد نشده است. ";
            }

            catch
            {
                  Literal_Login_Admin.Text = "ورود به بخش مدیریتی با مشکل روبرو شده است.";
            }

            finally
            {
                new_connection.Close();
            }
        }
    }
}