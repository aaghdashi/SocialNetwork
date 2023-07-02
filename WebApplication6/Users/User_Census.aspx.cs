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
    public partial class User_Census : System.Web.UI.Page
    {
        public Cloop_class New_user = new Cloop_class();

        string _command_text;
        public int _id;
        SqlConnection new_connection = new SqlConnection();
        SqlCommand new_command = new SqlCommand();
        SqlDataReader DR;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
                _id = (int)Session["id_user"];
            if (_id == null)
            {
                Response.Redirect("Error_Page.aspx?Error=0");
                return;
            }
            try
            {
                new_connection.ConnectionString = New_user.ConnectionString;
                new_connection.Open();
                new_command.Connection = new_connection;
                new_command.CommandText = "SELECT DISTINCT (SELECT COUNT(*)  FROM User_tbl)AS Count_User ,(SELECT COUNT(*) FROM Group_tbl) AS Count_Group,(SELECT COUNT(*)  FROM Post_Users_tbl WHERE ID_User='" + _id + "')AS Count_POST,(SELECT COUNT(*)  FROM Request_Friend_tbl WHERE Response_User_ID='" + _id + "' OR Request_User_ID='" + _id + "')AS Count_FRIEND,(SELECT COUNT(*)  FROM Messages_Users_tbl WHERE Reciever_User_ID='" + _id + "')AS Count_RECIVED_Message,(SELECT COUNT(*)  FROM Messages_Users_tbl WHERE Sender_User_ID='" + _id + "')AS Count_RECIVED_Message,(SELECT COUNT(*)  FROM Uploads_Pic_User_tbl WHERE ID_User='" + _id + "')AS Count_PICTURE,(SELECT COUNT(*)  FROM Uploads_Movie_User_tbl WHERE ID_User='" + _id + "')AS Count_MOVIE,(SELECT COUNT(*)  FROM Uploads_Textfile_User_tbl WHERE ID_User='" + _id + "')AS Count_TEXTFILE from User_tbl,Group_tbl,Post_Users_tbl,Request_Friend_tbl,Messages_Users_tbl,Uploads_Pic_User_tbl,Uploads_Movie_User_tbl,Uploads_Textfile_User_tbl";
                DR = new_command.ExecuteReader();
                DR.Read();
                lbl_Count_User.Text = DR[0].ToString();
                lbl_ExistGroup_User.Text = DR[1].ToString();
                lbl_Post_User.Text = DR[2].ToString();
                lbl_Friend_User.Text = DR[3].ToString();
                lbl_Message_Recieved_User.Text = DR[4].ToString();
                lbl_Message_Send_User.Text = DR[5].ToString();
                lbl_Pic_User.Text = DR[6].ToString();
                lbl_Video_User.Text = DR[7].ToString();
                lbl_Textfile_User.Text = DR[8].ToString();
            }
            catch
            {
                throw;
            }
            finally
            {
                DR.Close();
                DR.Dispose();
                new_connection.Close();
            }
        }
    }
}