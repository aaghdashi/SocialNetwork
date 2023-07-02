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
    public partial class Create_New_Admin : System.Web.UI.Page
    {
        string _ID;
        Cloop_class Connection = new Cloop_class();
        SqlConnection new_connection = new SqlConnection();
        SqlCommand new_command = new SqlCommand();
        SqlDataReader DR;
        protected void Page_Load(object sender, EventArgs e)
        {
            _ID = (string)Session["ID"];
           
            if (Session["ID"] == null)
            {
                Response.Redirect("~/Default.aspx?mode=exit");
                return;
            }

            if (!Page.IsPostBack)
            {
                new_connection.ConnectionString = Connection.ConnectionString;
                new_command.Connection = new_connection;
                new_connection.Open();
                string _str = "SELECT Name,Family,Email,UserName,PassWord  FROM Admins_tbl  WHERE ID='" + _ID + "'";
                new_command.CommandText = _str;
                DR = new_command.ExecuteReader();
                DR.Read();
                TextBox_Name.Text = DR[0].ToString();
                TextBox_Family.Text = DR[1].ToString();
                TextBox_Email.Text = DR[2].ToString();
                TextBox_Name_Account.Text = DR[3].ToString();
                TextBox_Password.Text = DR[4].ToString();
                DR.Close();
                new_connection.Close();
            }
        }

        protected void Button_Add_Admin_Click(object sender, EventArgs e)
        {
            new_connection.ConnectionString = Connection.ConnectionString;           
            new_command.Connection = new_connection;
            try
            {
                new_connection.Open();
                string _str = "UPDATE Admins_tbl SET Name='" + TextBox_Name.Text.Trim() + "',Family='" + TextBox_Family.Text.Trim() + "',Email='" + TextBox_Email.Text.Trim() + "',UserName='" + TextBox_Name_Account.Text.Trim() + "',PassWord='" + TextBox_Password.Text.Trim() + "' WHERE ID='"+_ID+"'";
                new_command.CommandText = _str;
                new_command.ExecuteNonQuery();
                Literal_State_Add_user.Text = "ثبت تغییرات جدید با موفقیت انجام شد.";
                
            }

            catch 
            {
                Literal_State_Add_user.Text = "عمل ثبت با مشکل روبرو شده است.";
            }

            finally
            {               
                new_connection.Close();
            }
        }

        protected void Button_Cancel_Click(object sender, EventArgs e)
        {
            TextBox_Name.Text = "";
            TextBox_Family.Text = "";
            TextBox_Email.Text = "";
            TextBox_Name_Account.Text = "";
            TextBox_Password.Text = "";
        }
    }
}