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
    public partial class WebForm1 : System.Web.UI.Page
    {
        public Cloop_class New_user = new Cloop_class();

            string _command_text;
            public int _id;
            SqlConnection new_connection = new SqlConnection();
            SqlCommand new_command = new SqlCommand();
            SqlDataReader DR;
            public static List<string> _Filter = new List<string>();

            Date_Convert perDate = new Date_Convert();
            long _post_id;
            string _mode;

            public void Filter_Comment()
            {
                _Filter.Clear();
                new_connection.ConnectionString = New_user.ConnectionString;
                new_connection.Open();
                new_command.Connection = new_connection;
                new_command.CommandText = "SELECT DISTINCT Key_Word FROM Filter_Word_tbl";
                DR = new_command.ExecuteReader();
                while (DR.Read())
                {
                    _Filter.Add(DR[0].ToString());
                }
                DR.Close();
                new_connection.Close();
            }
            protected void Page_Load(object sender, EventArgs e)
            {

                Repeater_Picture_File.DataSource = SqlDataSource_Upload_pic;
                Repeater_Picture_File.DataBind();
              
                Repeater_Video_File.DataSource = SqlDataSource_View_Movie;
                Repeater_Video_File.DataBind();
              
                
                if (!Page.IsPostBack)
                    _id = (int)Session["id_user"];
                    if (_id == null)
                    {
                        Response.Redirect("Error_Page.aspx?Error=0");
                        return;
                    }
                    MultiView_Main.ActiveViewIndex = 0;
                try
                {
                    new_connection.ConnectionString = New_user.ConnectionString;
                    new_connection.Open();
                    new_command.Connection = new_connection;
                    new_command.CommandText = "SELECT DISTINCT (SELECT COUNT(*)  FROM User_tbl)AS Count_User ,(SELECT COUNT(*) FROM Group_tbl) AS Count_Group,(SELECT COUNT(*)  FROM Post_Users_tbl WHERE ID_User='"+_id+"')AS Count_POST,(SELECT COUNT(*)  FROM Request_Friend_tbl WHERE Response_User_ID='"+_id+"' OR Request_User_ID='"+_id+"')AS Count_FRIEND,(SELECT COUNT(*)  FROM Messages_Users_tbl WHERE Reciever_User_ID='"+_id+"')AS Count_RECIVED_Message,(SELECT COUNT(*)  FROM Messages_Users_tbl WHERE Sender_User_ID='"+_id+"')AS Count_RECIVED_Message,(SELECT COUNT(*)  FROM Uploads_Pic_User_tbl WHERE ID_User='"+_id+"')AS Count_PICTURE,(SELECT COUNT(*)  FROM Uploads_Movie_User_tbl WHERE ID_User='"+_id+"')AS Count_MOVIE,(SELECT COUNT(*)  FROM Uploads_Textfile_User_tbl WHERE ID_User='"+_id+"')AS Count_TEXTFILE from User_tbl,Group_tbl,Post_Users_tbl,Request_Friend_tbl,Messages_Users_tbl,Uploads_Pic_User_tbl,Uploads_Movie_User_tbl,Uploads_Textfile_User_tbl";
                    DR = new_command.ExecuteReader();
                    DR.Read();
                    //lbl_Count_User.Text = DR[0].ToString();
                    //lbl_ExistGroup_User.Text = DR[1].ToString();
                    //lbl_Post_User.Text = DR[2].ToString();
                    //lbl_Friend_User.Text = DR[3].ToString();
                    //lbl_Message_Recieved_User.Text = DR[4].ToString();
                    //lbl_Message_Send_User.Text = DR[5].ToString();
                    //lbl_Pic_User.Text = DR[6].ToString();
                    //lbl_Video_User.Text = DR[7].ToString();
                    //lbl_Textfile_User.Text = DR[8].ToString();
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

                 _post_id = Convert.ToInt64(Request.QueryString["post_id"]);
                if (!Page.IsPostBack)
                {
                    _mode = Request.QueryString["mode"];
                    if (_mode == "comment")
                    {
                        new_connection.ConnectionString = New_user.ConnectionString;
                        new_connection.Open();
                        new_command.CommandText = "SELECT Title,Body,DT_Create FROM Post_Users_tbl WHERE ID= '" + _post_id + "'";
                        new_command.Connection = new_connection;
                        DR = new_command.ExecuteReader();
                        DR.Read();
                        Label_topic_post_comment.Text = DR[0].ToString();
                        Literal_body_post_comment.Text = DR[1].ToString();
                        Label_date_create_post_comment.Text = perDate.C_Date_en_to_fa((DR[2]).ToString());
                        DR.Close();
                        new_connection.Close();

                        Repeater_Comment_post.DataSource = SqlDataSource_Comments_Post;
                        Repeater_Comment_post.DataBind();

                        MultiView_Main.ActiveViewIndex = 2;
                        _mode = "";
                    }
                    
                    }
                    _mode = "";
                    Filter_Comment();
            }

            protected void LinkButton_ListPost_Click(object sender, EventArgs e)
            {
                MultiView_Main.ActiveViewIndex = 1;
            }

           

            protected void Repeater_post_ItemDataBound(object sender, RepeaterItemEventArgs e)
            {
                Label lbl1 = (Label)e.Item.FindControl("lbl_date");
                if (lbl1 != null)
                {
                    Date_Convert dt = new Date_Convert();
                    lbl1.Text = dt.C_Date_en_to_fa(lbl1.Text);
                }
            }

            protected void Button_Comment_Click(object sender, EventArgs e)
            {
                _id = (int)Session["id_user"];
                new_connection.ConnectionString = New_user.ConnectionString;
                new_connection.Open();
                new_command.Dispose();
                for (int i = 0; i <= _Filter.Count - 1; i++)
                {
                    RadEditor_Comment.Content = RadEditor_Comment.Text.Replace(_Filter[i], "****");
                }

                new_command.CommandText = "INSERT INTO Comment_Users_tbl(User_ID,Post_ID,Body,Create_date) VALUES('" + _id + "','" + _post_id + "','" + RadEditor_Comment.Text + "','" + DateTime.Now.Date.ToShortDateString() + "')";
                new_command.Connection = new_connection;
                new_command.ExecuteNonQuery();
                new_connection.Close();
                Repeater_Comment_post.DataSourceID = "SqlDataSource_Comments_Post";
                Repeater_Comment_post.DataBind();
            }

            protected void LinkButton_ListPic_Click(object sender, EventArgs e)
            {
                MultiView_Main.ActiveViewIndex = 3;
            }

            protected void LinkButton_ListVideo_Click(object sender, EventArgs e)
            {
                MultiView_Main.ActiveViewIndex = 4;
            }

            protected void Repeater_Comment_post_ItemDataBound(object sender, RepeaterItemEventArgs e)
            {
                Literal lbl1 = (Literal)e.Item.FindControl("Literal_date");
                if (lbl1 != null)
                {
                    Date_Convert dt = new Date_Convert();
                    lbl1.Text = dt.C_Date_en_to_fa(lbl1.Text);
                }
            }

            protected void Repeater_Picture_File_ItemDataBound(object sender, RepeaterItemEventArgs e)
            {
                Label lbl1 = (Label)e.Item.FindControl("lbl_date");
                if (lbl1 != null)
                {
                    Date_Convert dt = new Date_Convert();
                    lbl1.Text = dt.C_Date_en_to_fa(lbl1.Text);
                }
            }

            protected void Repeater_Video_File_ItemDataBound(object sender, RepeaterItemEventArgs e)
            {
                Label lbl1 = (Label)e.Item.FindControl("lbl_date");
                if (lbl1 != null)
                {
                    Date_Convert dt = new Date_Convert();
                    lbl1.Text = dt.C_Date_en_to_fa(lbl1.Text);
                }
            }

            protected void Repeater_Comment_post_ItemCommand(object source, RepeaterCommandEventArgs e)
            {

            }
   
    }
}