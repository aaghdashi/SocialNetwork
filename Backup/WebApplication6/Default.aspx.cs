using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;

namespace WebApplication6
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        public Cloop_class New_User = new Cloop_class();
        int _id;
        protected void Page_Load(object sender, EventArgs e)
        {
            New_User.Connection_DB.Open();
            SqlCommand new_command = new SqlCommand();
            new_command.Connection = New_User.Connection_DB;
            new_command.CommandText = "SELECT Main_Content_tbl.Subject_text,Main_Content_tbl.Body  FROM Main_Content_tbl";
            SqlDataReader DS;

            DS = new_command.ExecuteReader();
            DS.Read();
            if (DS.HasRows)
            {
                Literal1.Text = Convert.ToString(DS[0]);
                Literal2.Text = Convert.ToString(DS[1]);
            }
            DS.Close();            
            New_User.Connection_DB.Close();

            string str_day, str_year, str_month;
            PersianCalendar pc = new PersianCalendar();
            str_year = pc.GetYear(DateTime.Now.Date).ToString();
            str_day = pc.GetDayOfMonth(DateTime.Now.Date).ToString();
            str_month = pc.GetMonth(DateTime.Now.Date).ToString();
            Literal3.Text = DateTime.Now.Date.ToShortDateString();
            if (Request.QueryString["mode"] == "exit")
            {
                _id = (int)Session["id_user"];
                Session.RemoveAll();
                New_User.Connection_DB.Open();
                new_command.Connection = New_User.Connection_DB;
                new_command.CommandText = "UPDATE User_tbl SET Log_In_State='False' WHERE ID ='" + _id + "'";
                new_command.ExecuteNonQuery();
                New_User.Connection_DB.Close();
                Session.RemoveAll();

            }
            
        }

        protected void ImageButton_Login_admin_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Admin_Site/Login_Admin.aspx");
        }
    }
}