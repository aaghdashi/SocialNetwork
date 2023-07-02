using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication6
{
    public class Global : System.Web.HttpApplication
    {
        public static DateTime _date_today = DateTime.Now.Date;
        public static int _day;

        Cloop_class new_str_con = new Cloop_class();
        SqlCommand new_command = new SqlCommand();
        SqlConnection new_connnection = new SqlConnection();
        
        protected void Application_Start(object sender, EventArgs e)
        {
            _day = _date_today.Day;
            Application["Online_User"] = 0;
            Application["Visited_Count"] = 0;
            Application["Users_Today"] = 0;
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            if (_day <= DateTime.Now.Date.Day)
            {
                Application["Users_Today"] = Convert.ToInt32(Application["Users_Today"]) + 1;
            }
            else
            {
                _day = DateTime.Now.Date.Day;
                Application["Users_Today"] = 0;

                //DELETE OLD ROW(s) FORM Chat_tbl
                new_connnection.ConnectionString = new_str_con.ConnectionString;
                new_connnection.Open();
                new_command.CommandText = "DELETE FROM Chat_tbl  WHERE DATEDIFF(DD,Date_Create,GETDATE())>0";
                new_command.Connection = new_connnection;
                new_command.ExecuteNonQuery();
                new_connnection.Close();
                new_connnection.ConnectionString = new_str_con.ConnectionString;
                new_connnection.Open();
                new_command.CommandText = "DELETE FROM Gap_MemberShip_Group_tbl  WHERE DATEDIFF(DD,[Date],GETDATE())>0";
                new_command.Connection = new_connnection;
                new_command.ExecuteNonQuery();
                new_connnection.Close();
            }

            Application["Online_User"] = Convert.ToInt32(Application["Online_user"]) + 1;
            Application["Visited_Count"]=Convert.ToInt32(Application["Visited_Count"])+1;
            Application["new_chater"] = 1;
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {
            Application["Online_User"] = Convert.ToInt32(Application["Online_user"]) - 1;

        }

        protected void Application_End(object sender, EventArgs e)
        {
            Application["Online_User"] = 0;
            Application["Visited_Count"] = 0;
        }
    }
}