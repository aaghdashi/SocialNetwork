﻿using System;
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
    public partial class View_Info_User : System.Web.UI.Page
    {
        Date_Convert English_Persian = new Date_Convert();
        public Cloop_class New_info = new Cloop_class();
        public int _id;
        public int _id_info;
        public int _id_user;
 
        public SqlConnection new_connection = new SqlConnection();
        public SqlCommand new_command = new SqlCommand();
        public DataSet DS = new DataSet();
        string str_day, str_year, str_month;
        public SqlDataReader DR;
        public static List<string> _Filter = new List<string>();

        PersianCalendar pc = new PersianCalendar();
        long _post_id;
        string _mode;
        string _Permission;
        /// <summary>
        /// this method read information selected user by session from database 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>

        public void read_info()
        {
          
            new_connection.ConnectionString = New_info.ConnectionString;
            new_connection.Open();
            string _Select_info;

            _Select_info = "SELECT Name,Family, Account_name,Sex_User,Birth_date,E_mail,Mager,Telephone,City_born,City_live,Ostan,Education,College_Name,Job_user,Discreption_User,Date_m,User_pic,Favorites_user,Din,State_Education FROM User_tbl WHERE ID= '" + _id + "'";
            
            new_command.CommandText = _Select_info;
            new_command.Connection = new_connection;
            SqlDataAdapter adapter = new SqlDataAdapter(new_command);
            adapter.Fill(DS);
            Label_name.Text = DS.Tables[0].Rows[0][0].ToString();
            Label_family.Text = DS.Tables[0].Rows[0][1].ToString();
            Label_name_account.Text = DS.Tables[0].Rows[0][2].ToString();
            Img_User0.ImageUrl = DS.Tables[0].Rows[0][16].ToString();
            Label_Date_equal.Text = DateTime.Now.Date.ToShortDateString();
            str_year = pc.GetYear(DateTime.Now.Date).ToString();
            str_day = pc.GetDayOfMonth(DateTime.Now.Date).ToString();
            str_month = pc.GetMonth(DateTime.Now.Date).ToString();
            Label_Date_today.Text = str_year + "/" + str_month + "/" + str_day;
            new_connection.Close();
            DS.Dispose();
        }
        
        public void read_Permission()
        {
            new_connection.ConnectionString = New_info.ConnectionString;
            new_connection.Open();
            new_command.Connection = new_connection;
            new_command.CommandText = "SELECT permission_Freinds FROM User_tbl WHERE ID= '" + _id + "'";
            DR = new_command.ExecuteReader();
            DR.Read();
            _Permission = DR[0].ToString();
            if (_Permission == "False")
            {
                MultiView_Info_User.ActiveViewIndex = 7;
                ImageButton_Info.Enabled = false;
                ImageButton_Files.Enabled = false;
                ImageButton_Posts.Enabled = false;
                ImageButton_Friends.Enabled = false;
            }
            DR.Close();
            new_connection.Close();
           
            return;
        }

        public void user_info()
        {
            new_connection.ConnectionString = New_info.ConnectionString;
            new_connection.Open();
            string _Select_info;
            new_command.Dispose();
            DS.Dispose();
            _Select_info = "SELECT Name,Family, Account_name,Sex_User,Birth_date,E_mail,Mager,Telephone,City_born,City_live,Ostan,Education,College_Name,Job_user,Discreption_User,Favorites_user,Din,State_Education FROM User_tbl WHERE ID= '" + _id + "'";

            new_command.CommandText = _Select_info;
            new_command.Connection = new_connection;
            SqlDataAdapter adapter = new SqlDataAdapter(new_command);
            DS.Clear();
            adapter.Fill(DS);
            Label_Name_user.Text = DS.Tables[0].Rows[0][0].ToString();
            Label_Family_User.Text = DS.Tables[0].Rows[0][1].ToString();
            Label_Account_Name_User.Text = DS.Tables[0].Rows[0][2].ToString();
            if (Convert.ToBoolean(DS.Tables[0].Rows[0][3]) == false)
            { Label_Gender_User.Text = "مرد"; }
            else { Label_Gender_User.Text = "زن"; }
            Label_Birth_Date_User.Text =English_Persian.C_Date_en_to_fa(DS.Tables[0].Rows[0][4].ToString());
            Label_Email_User.Text = DS.Tables[0].Rows[0][5].ToString();
            Label_Mager.Text = DS.Tables[0].Rows[0][6].ToString();
            Label_Telephone_User.Text = DS.Tables[0].Rows[0][7].ToString();
            Label_City_Birth_User.Text = DS.Tables[0].Rows[0][8].ToString();
            Label_City_Live.Text = DS.Tables[0].Rows[0][9].ToString();
            Label_Ostan_User.Text = DS.Tables[0].Rows[0][10].ToString();
            Label_Education_User.Text = DS.Tables[0].Rows[0][11].ToString();
            Label_Collage_Name_User.Text = DS.Tables[0].Rows[0][12].ToString();
            Label_Job_User.Text = DS.Tables[0].Rows[0][13].ToString();
            Label_Description_User.Text = DS.Tables[0].Rows[0][14].ToString();
            Label_Favoriets_User.Text = DS.Tables[0].Rows[0][15].ToString();
            Label_Din_User.Text = DS.Tables[0].Rows[0][16].ToString();
            Label_State_Education_User.Text = DS.Tables[0].Rows[0][17].ToString();
            new_connection.Close();
            DS.Dispose();
        }

        public void Filter_Comment()
        {
            _Filter.Clear();
            new_connection.ConnectionString = New_info.ConnectionString;
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

            Repeater_Comment_post.DataSourceID = "SqlDataSource_Comments_Post";
            Repeater_Comment_post.DataBind();

            _id_user = (int)Session["id_user"];

           
                _id = (int)Session["info_user"];

            if (_id == null)
            {
                Response.Redirect("Error_Page.aspx?Error=0");
                return;
            }

            read_Permission();
            if (_Permission != "False")
            {
                read_info();
                _post_id = Convert.ToInt64(Request.QueryString["post_id"]);
                if (!Page.IsPostBack)
                {
                    _mode = Request.QueryString["mode"];
                    if (_mode == "comment")
                    {
                        MultiView_Info_User.ActiveViewIndex = 5;
                        new_connection.ConnectionString = New_info.ConnectionString;
                        new_connection.Open();
                        new_command.CommandText = "SELECT Title,Body,DT_Create FROM Post_Users_tbl WHERE ID= '" + _post_id + "' AND ID_User='" + _id + "'";
                        new_command.Connection = new_connection;
                        DR = new_command.ExecuteReader();
                        DR.Read();
                        Label_topic_post_comment.Text = DR[0].ToString();
                        Literal_body_post_comment.Text = DR[1].ToString();
                        Label_date_create_post_comment.Text = Convert.ToDateTime(DR[2]).ToShortDateString();
                        DR.Close();
                        new_connection.Close();
                    }
                    else if (_mode == "info")
                    {
                        MultiView_Info_User.ActiveViewIndex = 6;
                        _id_info = Convert.ToInt32(Request.QueryString["ID"]);
                        new_connection.ConnectionString = New_info.ConnectionString;
                        new_connection.Open();
                        new_command.CommandText = "SELECT Name, Family, Account_name, Sex_User, City_live, E_mail, Favorites_user, Discreption_User,User_pic,Mager FROM User_tbl WHERE ID='" + _id_info + "'";
                        new_command.Connection = new_connection;
                        try
                        {
                            DR = new_command.ExecuteReader();
                            DR.Read();

                            lbl_Name_Result.Text = DR[0].ToString();
                            lbl_Family_Result.Text = DR[1].ToString();
                            lbl_AccountName_Result.Text = DR[2].ToString();
                            if (Convert.ToBoolean(DR[3]))
                                lbl_Sex_Result.Text = "زن";
                            else
                                lbl_Sex_Result.Text = "مرد";
                            lbl_CityLive_Result.Text = DR[4].ToString();
                            lbl_Email_Result.Text = DR[5].ToString();
                            lbl_Favorites_Result.Text = DR[6].ToString();
                            lbl_Description_Result.Text = DR[7].ToString();
                            Image1.ImageUrl = DR[8].ToString();
                            lbl_Mager_Result.Text = DR[9].ToString();

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
                    _mode = "";
                    Filter_Comment();
                }
            }
        }

        protected void ImageButton_Info_Click(object sender, ImageClickEventArgs e)
        {
            MultiView_Info_User.ActiveViewIndex = 1;
            user_info();
        }

        protected void ImageButton_Files_Click(object sender, ImageClickEventArgs e)
        {
            MultiView_Info_User.ActiveViewIndex = 2;
        }

        protected void ImageButton_Posts_Click(object sender, ImageClickEventArgs e)
        {
            MultiView_Info_User.ActiveViewIndex = 3;
        }

        protected void ImageButton_Friends_Click(object sender, ImageClickEventArgs e)
        {
            MultiView_Info_User.ActiveViewIndex = 4;
        }
             
        protected void Button_Comment_Click(object sender, EventArgs e)
        {
            new_connection.ConnectionString = New_info.ConnectionString;
            new_connection.Open();
            new_command.Dispose();
             for (int i = 0; i <= _Filter.Count - 1; i++)
            {
                RadEditor_Comment.Content = RadEditor_Comment.Text.Replace(_Filter[i], "****");
             }
            new_command.CommandText = "INSERT INTO Comment_Users_tbl(User_ID,Post_ID,Body,Create_date) VALUES('" +_id_user + "','" + _post_id + "','" + RadEditor_Comment.Text + "','" + DateTime.Now.Date.ToShortDateString() + "')";            
            new_command.Connection = new_connection;
            new_command.ExecuteNonQuery();
            new_connection.Close();
            Repeater_Comment_post.DataSourceID = "SqlDataSource_Comments_Post";
            Repeater_Comment_post.DataBind();
        }

        protected void Repeater_post_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Label lbl1 = (Label)e.Item.FindControl("Label_Date");
            if (lbl1 != null)
            {
                Date_Convert dt = new Date_Convert();
                lbl1.Text = dt.C_Date_en_to_fa(lbl1.Text);
            }
        }

        protected void Repeater_Section1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Image IMG = (Image)e.Item.FindControl("Image_user_Section1");
            if (IMG != null)
            {
                if (IMG.ImageUrl == string.Empty)
                    IMG.ImageUrl = "~/Users/images/no_image.png";
            }
        }

        protected void Img_btn_TextFile_User_Click(object sender, ImageClickEventArgs e)
        {
            MultiView_Files.ActiveViewIndex = 0;
        }

        protected void Img_btn_Picture_User_Click(object sender, ImageClickEventArgs e)
        {
            MultiView_Files.ActiveViewIndex = 1;
        }

        protected void Img_btn_Movie_User_Click(object sender, ImageClickEventArgs e)
        {
            MultiView_Files.ActiveViewIndex = 2;
        }

        protected void DataList_Friend_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            Image IMG = (Image)e.Item.FindControl("Image_user_Section1");
            if (IMG != null)
            {
                if (IMG.ImageUrl == string.Empty)
                    IMG.ImageUrl = "~/Users/images/no_image.png";
            }
        }

      
    }
}