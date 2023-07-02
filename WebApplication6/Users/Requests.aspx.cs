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
    public partial class Requests : System.Web.UI.Page
    {
        public int _id;
        public string _mode;
        public static string _friend_id;
        public Cloop_class New_user = new Cloop_class();
        SqlConnection new_connection = new SqlConnection();
        SqlCommand new_command = new SqlCommand();


        
       
        protected void Page_Load(object sender, EventArgs e)
        {
            _id = (int)Session["id_user"];

            if (_id == null)
            {
                Response.Redirect("Error_Page.aspx?Error=0");
                return;
            }
            if (!Page.IsPostBack)
            {
                _friend_id = Request.QueryString["id"];
                _mode = Request.QueryString["mode"];

                if (_mode == "ADD")
                {
                    new_connection.ConnectionString = New_user.ConnectionString;
                    new_connection.Open();
                    new_command.Connection = new_connection;
                    new_command.CommandText = "UPDATE Request_Friend_tbl SET Request_User_ID='" + _friend_id + "',Response_User_ID='" + _id + "', Response_Date='" + DateTime.Now.Date.ToShortDateString() + "',Flag='true'  WHERE Request_User_ID='" + _friend_id + "' AND Response_User_ID='" + _id + "'";
                    new_command.ExecuteNonQuery();
                    
                    new_connection.Close();
                    _mode = "";
                }
                if (_mode == "DELETE")
                {
                   new_connection.ConnectionString = New_user.ConnectionString;
                    new_connection.Open();
                    new_command.Connection = new_connection;
                    new_command.CommandText = "DELETE FROM Request_Friend_tbl WHERE Request_User_ID='"+ _friend_id +"' AND Response_User_ID='"+ _id +"' ";
                    new_command.ExecuteNonQuery();
                   
                    new_connection.Close();
                    _mode = "";
                }
                if (_mode == "DELETE_req")
                {
                    new_connection.ConnectionString = New_user.ConnectionString;
                    new_connection.Open();
                    new_command.Connection = new_connection;
                    new_command.CommandText = "DELETE FROM Request_Friend_tbl WHERE Request_User_ID='" + _id + "' AND Response_User_ID='" + _friend_id + "' ";
                    new_command.ExecuteNonQuery();

                    new_connection.Close();
                    _mode = "";
                    MultiView_Request.ActiveViewIndex = 0;
                }
                
                _mode = "";
            }

        }

        protected void Img_btn_recicve_Click(object sender, ImageClickEventArgs e)
        {
            MultiView_Request.ActiveViewIndex = 0;
        }

        protected void Img_btn_send_Click(object sender, ImageClickEventArgs e)
        {
            MultiView_Request.ActiveViewIndex = 1;
        }

       

    }
}