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
    public partial class User_info : System.Web.UI.Page
    {
        Cloop_class user_info = new Cloop_class();
        int _id;
        SqlConnection new_connection = new SqlConnection();
        SqlCommand new_command = new SqlCommand();
        SqlDataReader DR;

        protected void Page_Load(object sender, EventArgs e)
        {
            _id = Convert.ToInt32(Request.QueryString["ID"]);
            new_connection.ConnectionString = user_info.ConnectionString;
            new_connection.Open();
            new_command.CommandText = "SELECT Permission_Guest,Name, Family, Account_name, Sex_User, City_live, E_mail, Favorites_user, Discreption_User,User_pic,Mager FROM User_tbl WHERE ID='" + _id + "'";
            new_command.Connection = new_connection;
            try
            {
            DR = new_command.ExecuteReader();
            DR.Read();
            if (Convert.ToBoolean(DR[0]))
            {
                lbl_Name_Result.Text = DR[1].ToString();
                lbl_Family_Result.Text = DR[2].ToString();
                lbl_AccountName_Result.Text = DR[3].ToString();
                if (Convert.ToBoolean(DR[4]))
                    lbl_Sex_Result.Text = "زن";
                else
                    lbl_Sex_Result.Text = "مرد";
                lbl_CityLive_Result.Text = DR[5].ToString();
                lbl_Email_Result.Text = DR[6].ToString();
                lbl_Favorites_Result.Text = DR[7].ToString();
                lbl_Description_Result.Text = DR[8].ToString();
                Image1.ImageUrl = DR[9].ToString();
                lbl_Mager_Result.Text = DR[10].ToString();
            }
            else
            {
                Response.Redirect("Error_Page.aspx?Error=5");
            }
            }
             catch
            {
                 throw;
             }
            finally
            {
                DR.Close();
                new_connection.Close();
            }
        }
    }
}