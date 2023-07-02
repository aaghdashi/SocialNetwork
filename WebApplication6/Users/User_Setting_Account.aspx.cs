using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
namespace WebApplication6.Users
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        public Cloop_class New_User = new Cloop_class();
        public int _id;
        public void Setting_info()
        {
            DataSet _DS;
            string _Select_info;
            _Select_info = "SELECT Permission_Guest,permission_Freinds,User_pic FROM User_tbl WHERE ID= '" + _id + "'";
            _DS = New_User.User_info_Show(_Select_info);
            if((bool)_DS.Tables[0].Rows[0][0])
            CheckBox_Users_Permission.Checked=true;
            if((bool)_DS.Tables[0].Rows[0][1])
            CheckBox_Friends_Permission.Checked=true;

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            _id = (int)Session["id_user"];
            if (_id == null)
            {
                Response.Redirect("Error_Page.aspx?Error=0");
                return;
            }
            MultiView_Setting.ActiveViewIndex = 0;
            if(!Page.IsPostBack)
            Setting_info();
        }
           

        protected void btn_Submit_Permission_Click(object sender, EventArgs e)
        {
            bool _Guest=false,_Friend=false;
            SqlConnection new_connection = new SqlConnection();
            SqlCommand new_command = new SqlCommand();

            if (CheckBox_Users_Permission.Checked)
                _Guest = true;
            else if (!CheckBox_Users_Permission.Checked)
                _Guest = false;
            if (CheckBox_Friends_Permission.Checked)
                _Friend = true;
            else if (!CheckBox_Friends_Permission.Checked)
                _Friend = false;

            new_connection.ConnectionString = New_User.ConnectionString;
            new_connection.Open();
            new_command.Connection = new_connection;
            new_command.CommandText = "UPDATE User_tbl SET Permission_Guest='" + _Guest + "',permission_Freinds='" + _Friend + "' WHERE ID='" + _id + "'";
            new_command.ExecuteNonQuery();
            new_connection.Close();
            Literal_permission.Text = "ثبت تغییرات با موفقیت انجام شد.";
        }

        protected void btn_Cancel_Permission_Click(object sender, EventArgs e)
        {
            Setting_info();
            Literal_permission.Text = "انجام تغییرات لغو گردید.";
        }

        protected void btn_Submit_Change_Password_Click(object sender, EventArgs e)
        {
            DataSet _DS;
            string _Select_info;
            SqlConnection new_connection = new SqlConnection();
            SqlCommand new_command = new SqlCommand();

            _Select_info = "SELECT Password FROM User_tbl WHERE ID= '" + _id + "'";
            _DS = New_User.User_info_Show(_Select_info);
            if (RadTextBox_Old_Password.Text == _DS.Tables[0].Rows[0][0].ToString())
            {
                if (RadTextBox_New_Password.Text == RadTextBox_Confirm_New_Password.Text)
                {
                    new_connection.ConnectionString = New_User.ConnectionString;
                    new_connection.Open();
                    new_command.Connection = new_connection;
                    new_command.CommandText = "UPDATE User_tbl SET Password='" + RadTextBox_New_Password.Text.Trim() + "' WHERE ID='" + _id + "'";
                    new_command.ExecuteNonQuery();
                    new_connection.Close();
                    Literal_password.Text = "تغییر رمز عبور با موفقیت انجام شد.";
                }
                else
                {
                    Literal_password.Text = "فرآیند تغییر رمز عبور با مشکل مواجه شده است ، لطفا در وارد کردن اطلاعات دقت فرمایید.";
                }
            }
        }

        protected void btn_Cancel_Change_PassWord_Click(object sender, EventArgs e)
        {
            RadTextBox_Old_Password.Text = "";
            RadTextBox_New_Password.Text = "";
            RadTextBox_Confirm_New_Password.Text = "";
        }
    }
}