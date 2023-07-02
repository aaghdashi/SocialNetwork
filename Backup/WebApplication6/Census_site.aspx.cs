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
    public partial class Census_site : System.Web.UI.Page
    {            
        protected void Page_Load(object sender, EventArgs e)
        {
            Cloop_class new_census = new Cloop_class();
            SqlCommand new_command = new SqlCommand();
            SqlDataReader DR;
            new_census.Connection_DB.ConnectionString = new_census.ConnectionString;
            new_census.Connection_DB.Open();
            new_command.CommandText = "SELECT DISTINCT (SELECT COUNT(*) AS Count_User FROM User_tbl) ,(SELECT COUNT(*) AS Count_Group FROM Group_tbl) from User_tbl,Group_tbl";
            new_command.Connection = new_census.Connection_DB;
            DR = new_command.ExecuteReader();
            if (DR.HasRows)
            {
                DR.Read();
                lbl_Count_User.Text = DR[0].ToString();
                lbl_Count_Group.Text = DR[1].ToString();
                DR.Close();
                DR.Dispose();
            }
           
            Label_Milady_date.Text = DateTime.Now.Date.ToShortDateString();
            Label_Time.Text = DateTime.Now.ToShortTimeString();  
            lbl_Online_user.Text = Application["Online_User"].ToString();
            lbl_All_Visited.Text = Application["Visited_Count"].ToString();
            lbl_Today_visite.Text = Application["Users_Today"].ToString();

            string str_day, str_year, str_month;
            PersianCalendar pc = new PersianCalendar();
            str_year = pc.GetYear(DateTime.Now.Date).ToString();
            str_day = pc.GetDayOfMonth(DateTime.Now.Date).ToString();
            str_month = pc.GetMonth(DateTime.Now.Date).ToString();
            lbl_Date.Text=(str_year + "/" + str_month + "/" + str_day);
        }
    }
}