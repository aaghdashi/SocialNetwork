using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;

namespace WebApplication6.Users
{
    public partial class Users_master : System.Web.UI.MasterPage
    {
        public Cloop_class New_Login = new Cloop_class();
        SqlCommand new_command = new SqlCommand();
        SqlConnection new_connection = new SqlConnection();
            int _id;

        protected void Page_Load(object sender, EventArgs e)
        {
            SqlCommand new_command = new SqlCommand();
            SqlDataReader DR;
            string str_day, str_year, str_month;
            PersianCalendar pc = new PersianCalendar();
           if(!Page.IsPostBack)
            _id = (int)Session["id_user"];
            if (_id == null)
            {
                Response.Redirect("Error_Page.aspx?Error=0");
                return;
            }
            New_Login.Connection_DB.ConnectionString = New_Login.ConnectionString;
            New_Login.Connection_DB.Open();
            new_command.CommandText = "SELECT Name,Family,Account_name,Date_m,User_pic,(SELECT COUNT(*)  FROM Request_Friend_tbl WHERE Response_User_ID='" + _id + "' OR Request_User_ID='" + _id + "')AS Count_FRIEND FROM User_tbl WHERE ID='" + _id + "'";
            new_command.Connection = New_Login.Connection_DB;
            DR = new_command.ExecuteReader();
            if (DR.HasRows)
            {
                DR.Read();
                Label_name.Text = DR[0].ToString();
                Label_family.Text = DR[1].ToString();
                Label_name_account.Text = DR[2].ToString();
                str_year = pc.GetYear((DateTime)DR[3]).ToString();
                str_day = pc.GetDayOfMonth((DateTime)DR[3]).ToString();
                str_month = pc.GetMonth((DateTime)DR[3]).ToString();
                Label_Date_Member.Text = str_year + "/" + str_month + "/" + str_day;
                Img_User0.ImageUrl =DR[4].ToString();
                Label_Online_User.Text = Application["Online_User"].ToString();
                Label_Count_friend.Text = DR[5].ToString();
                DR.Close();
            }
            Label_Date_today.Text = DateTime.Now.Date.ToShortDateString();
            str_year = pc.GetYear(DateTime.Now.Date).ToString();
            str_day = pc.GetDayOfMonth(DateTime.Now.Date).ToString();
            str_month = pc.GetMonth(DateTime.Now.Date).ToString();
            Label_Date_equal.Text = str_year + "/" + str_month + "/" + str_day;

            
            New_Login.Connection_DB.Close();
        }
               
        protected void Img_btn_Comments_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Users_post.aspx");
        }

        protected void Img_btn_Search_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Users_search.aspx");
        }

        protected void Img_btn_Friends_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Users_Friends.aspx"); 
        }

     
        protected void Img_btn_Document_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("User_Files.aspx");
        }

        protected void Img_btn_Messages_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("User_Message.aspx");
        }

        protected void Img_btn_Edit_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("User_Edit_Info.aspx");
        }

        protected void Img_btn_Groups_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("User_Show_Group.aspx");
        }

        protected void Img_btn_Setting_User_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("User_Setting_Account.aspx");
        }

        protected void Img_btn_Chat_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Chat_Page.aspx");
        }

        protected void Img_btn_Exit_Click(object sender, ImageClickEventArgs e)
        {           
            new_connection.ConnectionString = New_Login.ConnectionString;
            new_connection.Open();
            new_command.Connection = new_connection;
            new_command.CommandText = "UPDATE User_tbl SET Log_In_State='False' WHERE ID ='" + _id + "'";
            new_command.ExecuteNonQuery();
            new_connection.Close();
            Session.Remove("id_user");
            Response.Redirect("~/Default.aspx");
            Session.RemoveAll();
        }

        protected void LinkButton_Exit_Click(object sender, EventArgs e)
        {
            new_connection.ConnectionString = New_Login.ConnectionString;
            new_connection.Open();
            new_command.Connection = new_connection;
            new_command.CommandText = "UPDATE User_tbl SET Log_In_State='False' WHERE ID ='" + _id + "'";
            new_command.ExecuteNonQuery();
            new_connection.Close();
            Response.Redirect("~/Default.aspx?mode=exit");
        }

    
    }
}