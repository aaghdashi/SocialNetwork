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
    public partial class WebForm11 : System.Web.UI.Page
    {
        #region object

        public Cloop_class New_User = new Cloop_class();
        public SqlConnection new_connection = new SqlConnection();
        #endregion object

        #region variable
        public int _id;
        public string _Virtual_path_pic = "/Users/pics/";
        public string _pic_path;
        public string _Virtual_path_movie = "/Users/Videos/";
        public string _movie_path;
        public string _Virtual_path_file = "/Users/Files/";
        public string _file_path;
        public string[] _Extention_Movie = { ".avi", ".3gp", ".flv", ".mp4", ".rar", ".zip" };
        public string[] _Extention_Picture = { ".jpg", ".png", ".gif" ,".rar", ".zip"};
        public string[] _Extention_Textfile = { ".txt", ".pdf", ".doc", ".docx", ".rar", ".zip" };
#endregion variable
        protected void Page_Load(object sender, EventArgs e)
        {
            _id = (int)Session["id_user"];
            
            if (_id == null)
            {
                Response.Redirect("Error_Page.aspx?Error=0");
                return;
            }

            Repeater_Picture_File.DataSource = SqlDataSource_Upload_pic;
            Repeater_Picture_File.DataBind();
            Repeater_Text_File.DataSource = SqlDataSource1;
            Repeater_Text_File.DataBind();
            Repeater_Video_File.DataSource = SqlDataSource_View_Movie;
            Repeater_Video_File.DataBind();
        }

        protected void Img_btn_TextFile_User_Click(object sender, ImageClickEventArgs e)
        {
            MultiView_View.ActiveViewIndex = 0;
        }

        protected void Img_btn_Picture_User_Click(object sender, ImageClickEventArgs e)
        {
            MultiView_View.ActiveViewIndex = 1;

        }

        protected void Img_btn_Movie_User_Click(object sender, ImageClickEventArgs e)
        {
            MultiView_View.ActiveViewIndex = 2;

        }

        protected void Img_btn_Upload_Click(object sender, ImageClickEventArgs e)
        {
            MultiView_View.ActiveViewIndex = 3;

        }

      
        protected void btn_Save_Picture_File_Click(object sender, EventArgs e)
        {
            SqlCommand new_command = new SqlCommand();
            string _filename;
            string _extentionfile;
            string _capacityfile;
            string ext = System.IO.Path.GetExtension(FileUpload_Picture.PostedFile.FileName);
            if(Array.IndexOf(_Extention_Picture,ext.ToLower())<0)
            {        
                Literal_Picture_file.Text = "پسوند عکس مورد نظر برای آپلود مناسب نمی باشد.";
            }

            else
            {
            if (FileUpload_Picture.HasFile)
            {
                _filename = FileUpload_Picture.PostedFile.FileName;
                _pic_path = _Virtual_path_pic + Guid.NewGuid() + ext;
                _extentionfile = FileUpload_Picture.PostedFile.ContentType;
                _capacityfile = FileUpload_Picture.PostedFile.ContentLength/1024 + "KB";
                Label_name_Picture_File.Text = _filename;
                Label_Capacity_Picture_File.Text = _capacityfile;
                Label_Extention_Picture_File.Text = _extentionfile;
                try
                {
                    new_connection.ConnectionString = New_User.ConnectionString;
                    new_connection.Open();
                    new_command.Connection = new_connection;
                    new_command.CommandText = "INSERT INTO Uploads_Pic_User_tbl(ID_User,Path_pic,Date_Upload,Topic_Pic,Discreption_Pic) VALUES('" + _id + "','" + _pic_path + "','" + DateTime.Now.Date.ToShortDateString() + "','" + TextBox_Topic_pic.Text.Trim() + "','" + TextBox_Description.Text.Trim() + "')";
                    new_command.ExecuteNonQuery();
                    Literal_Picture_file.Text = "عکس شما با موفقیت آپلود شد.";
                    FileUpload_Picture.SaveAs(Server.MapPath(_pic_path));
                    Image_upload_pic.ImageUrl = _pic_path;                    
                }

                catch
                {
                    Literal_Picture_file.Text = "امکان آپلود عکس وجود ندارد.";
                    throw;
                }

                finally
                {
                    Repeater_Picture_File.DataSource = SqlDataSource_Upload_pic;
                    Repeater_Picture_File.DataBind();
                    new_connection.Close();
                }
            }
            else
                Literal_Picture_file.Text = "عکسی برای آپلود وجود ندارد.";
            }            
        }

      
        protected void btn_Save_Text_File_Click(object sender, EventArgs e)
        {
            SqlCommand new_command = new SqlCommand();
            string _filename;
            string _extentionfile;
            string _capacityfile;
            string ext = System.IO.Path.GetExtension(FileUpload_Text_file.PostedFile.FileName);
            if (Array.IndexOf(_Extention_Textfile, ext.ToLower()) < 0)
            {
                Literal_Text_File.Text = "پسوند فایل مورد نظر برای آپلود مناسب نمی باشد.";
            }

            else
            {
                if (FileUpload_Text_file.HasFile)
                {

                    _filename = FileUpload_Text_file.PostedFile.FileName;
                    _file_path = _Virtual_path_file + Guid.NewGuid()+ext;
                    _extentionfile = FileUpload_Text_file.PostedFile.ContentType;
                    _capacityfile = FileUpload_Text_file.PostedFile.ContentLength / 1024 + "KB";
                    Label_name_File_Text.Text = _filename;
                    Label_Capacity_Text_file.Text = _capacityfile;
                    Label_Extention_Text_File.Text = _extentionfile;
                    try
                    {

                        new_connection.ConnectionString = New_User.ConnectionString;
                        new_connection.Open();
                        new_command.Connection = new_connection;
                        new_command.CommandText = "INSERT INTO Uploads_Textfile_User_tbl (ID_User,Path_Textfile,Date_Upload,Topic_Textfile,Discreption_Textfile) VALUES ('" + _id + "','" + _file_path + "','" + DateTime.Now.Date.ToShortDateString() + "','" + TextBox_Topic_File.Text.Trim() + "','" + TextBox_Description_File.Text.Trim() + "')";
                        new_command.ExecuteNonQuery();
                        FileUpload_Text_file.SaveAs(Server.MapPath(_file_path));
                        Literal_Text_File.Text = "فایل شما با موفقیت آپلود شد.";
                    }

                    catch
                    {
                        Literal_Text_File.Text = "امکان آپلود فایل وجود ندارد.";
                        throw;
                    }

                    finally
                    {
                        Repeater_Text_File.DataSource = SqlDataSource1;
                        Repeater_Text_File.DataBind();
                        new_connection.Close();
                    }
                }
                else
                    Literal_Text_File.Text = "فایلی برای آپلود وجود ندارد.";
            }
        }

       

        protected void Img_btn_Download_Click(object sender, ImageClickEventArgs e)
        {
            MultiView_View.ActiveViewIndex = 4;

        }

        protected void Button_Save_Video_Click(object sender, EventArgs e)
        {
            SqlCommand new_command = new SqlCommand();
            string _filename;
            string _extentionfile;
            string _capacityfile;
            string ext = System.IO.Path.GetExtension(FileUpload_Movie_File.PostedFile.FileName);
            if (Array.IndexOf(_Extention_Movie, ext.ToLower()) < 0)
            {
                Literal_Movie_File.Text = "پسوند فایل مورد نظر برای آپلود مناسب نمی باشد.";
            }

            else
            {
                if (FileUpload_Movie_File.HasFile)
                {

                    _filename = FileUpload_Movie_File.PostedFile.FileName;
                    _movie_path = _Virtual_path_movie + Guid.NewGuid()+ext;
                    _extentionfile = FileUpload_Movie_File.PostedFile.ContentType;
                    _capacityfile = FileUpload_Movie_File.PostedFile.ContentLength / 1024 + "KB";
                    Label_Name_Movie_File.Text = _filename;
                    Label_Capacity_Movie_File.Text = _capacityfile;
                    Label_Extention_Movie_File.Text = _extentionfile;
                    try
                    {
                        new_connection.ConnectionString = New_User.ConnectionString;
                        new_connection.Open();
                        new_command.Connection = new_connection;
                        new_command.CommandText = "INSERT INTO Uploads_Movie_User_tbl(ID_User,Path_Movie,Date_Upload,Topic_Movie,Discreption_Movie) VALUES('" + _id + "','" + _movie_path + "','" + DateTime.Now.Date.ToShortDateString() + "','" + TextBox_Topic_Film.Text.Trim() + "','" + TextBox_Description_Film.Text.Trim() + "')";
                        new_command.ExecuteNonQuery();
                        Literal_Movie_File.Text = "فیلم شما با موفقیت آپلود شد.";
                        FileUpload_Movie_File.SaveAs(Server.MapPath(_movie_path));
                    }

                    catch
                    {
                        Literal_Movie_File.Text = "امکان آپلود فیلم وجود ندارد.";
                        throw;
                    }

                    finally
                    {
                        new_connection.Close();
                        Repeater_Video_File.DataSource = SqlDataSource_View_Movie;
                        Repeater_Video_File.DataBind();
                    }
                }
                else
                    Literal_Movie_File.Text = "فیلمی برای آپلود وجود ندارد.";
            }
        }

        protected void GridView_Movie_User_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            Label lbl1 = (Label)e.Row.FindControl("lbl_Date");
            if (lbl1 != null)
            {
                Date_Convert dt = new Date_Convert();
                lbl1.Text = dt.C_Date_en_to_fa(lbl1.Text);
            }
        }

        protected void GridView_Textfile_User0_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            Label lbl1 = (Label)e.Row.FindControl("lbl_Date");
            if (lbl1 != null)
            {
                Date_Convert dt = new Date_Convert();
                lbl1.Text = dt.C_Date_en_to_fa(lbl1.Text);
            }

        }

        protected void GridView_Picture_User_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            Label lbl1 = (Label)e.Row.FindControl("lbl_Date");
            if (lbl1 != null)
            {
                Date_Convert dt = new Date_Convert();
                lbl1.Text = dt.C_Date_en_to_fa(lbl1.Text);
            }
        }

    }
}