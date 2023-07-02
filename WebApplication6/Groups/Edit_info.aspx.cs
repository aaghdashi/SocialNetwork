using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication6.Groups
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        public Cloop_class New_User = new Cloop_class();
        public SqlConnection new_connection = new SqlConnection();
        SqlCommand new_command = new SqlCommand();

        public int _id;
        public int _id_Group;
        public string _Virtual_path = "/Groups/Image_Group/";
        public string _pic_path;
        public bool _archive;
        public bool _active;

        public void _Show_Info()
        {
            DataSet _DS=new DataSet();
            string _Select_info;

            _Select_info = "SELECT Name_Group,Topic_Group, Discreption_Group,Email,Admin_Name,Security_Question,Security_Answer,Active,Archive FROM Group_tbl WHERE ID_Creator= '" + _id + "'";
            _DS = New_User.User_info_Show(_Select_info);
            txt_name_Group.Text = _DS.Tables[0].Rows[0][0].ToString();
            TextBox_Topic_Group.Text = _DS.Tables[0].Rows[0][1].ToString();
            txt_Discreption_Group.Text = _DS.Tables[0].Rows[0][2].ToString();
            txt_Email_Group.Text = _DS.Tables[0].Rows[0][3].ToString();
            txt_name_Account_Group.Text = _DS.Tables[0].Rows[0][4].ToString();
            txt_Security_question_Group.Text = _DS.Tables[0].Rows[0][5].ToString();
            txt_Secutity_answer_Group.Text = _DS.Tables[0].Rows[0][6].ToString();
            
            if ((bool)_DS.Tables[0].Rows[0][7])
            {
                CheckBox_Active.Checked = true;
            }
            else
            {
                CheckBox_Active.Checked = false;
            }
            
            if ((bool)_DS.Tables[0].Rows[0][8])
            {
                CheckBox_Archive.Checked = true;
            }
            else
            {
                CheckBox_Archive.Checked = false;
            }


        }
    
        protected void Page_Load(object sender, EventArgs e)
        {
            _id = (int)Session["id_user"];
            _id_Group = (int)Session["id_group"];
            if(!Page.IsPostBack)
            _Show_Info();
        }

        protected void Img_btn_Edit_Info_Group_Click(object sender, ImageClickEventArgs e)
        {
            MultiView_Edit.ActiveViewIndex = 1;
            _Show_Info();
        }

        protected void Img_btn_Edit_Members_Group_Click(object sender, ImageClickEventArgs e)
        {
            MultiView_Edit.ActiveViewIndex = 2;
        }

        protected void btn_Edit_info_Group_Click(object sender, EventArgs e)
        {
            if (CheckBox_Active.Checked)
            {
                _active = true;
            }
            else
            {
                _active = false;
            }

            if (CheckBox_Archive.Checked)
            {
                _archive = true;
            }
            else
            {
                _archive = false;
            }
            try
            {
                new_connection.ConnectionString = New_User.ConnectionString;
                new_connection.Open();
                new_command.Connection = new_connection;
                new_command.CommandText = "UPDATE Group_tbl SET Name_Group='" + txt_name_Group.Text + "',Topic_Group='" + TextBox_Topic_Group.Text + "', Discreption_Group='" + txt_Discreption_Group.Text + "',Email='" + txt_Email_Group.Text + "',Admin_Name='" + txt_name_Account_Group.Text + "',Active='"+_active+"',Archive='"+_archive+"'  WHERE ID_Creator='" + _id + "' AND ID='"+ _id_Group +"'";
                new_command.ExecuteNonQuery();
                Literal_Edit_Info_Group.Text = "ثبت اطلاعات با موفقیت انجام شد.";
            }
            catch
            {
                Literal_Edit_Info_Group.Text = "امکان تغییر اطلا عات وجود ندارد.";
                throw;
            }
            finally
            {
                new_connection.Close();
            }
        }

        protected void btn_Cancel_Edit_Group_Click(object sender, EventArgs e)
        {
            _Show_Info();
        }

        protected void btn_Cancel_Security_Group_Click(object sender, EventArgs e)
        {
            _Show_Info();
        }

        protected void btn_Submit_security_Group_Click(object sender, EventArgs e)
        {

            try
            {
                new_connection.ConnectionString = New_User.ConnectionString;
                new_connection.Open();
                new_command.Connection = new_connection;
                new_command.CommandText = "UPDATE Group_tbl SET Security_Question='" + txt_Security_question_Group.Text + "',Security_Answer='" + txt_Secutity_answer_Group.Text + "' WHERE ID_Creator='" + _id + "'";
                new_command.ExecuteNonQuery();
                Literal_Edit_Question_Group.Text = "ثبت اطلاعات با موفقیت انجام شد.";
            }
            catch
            {
                Literal_Edit_Question_Group.Text = "امکان تغییر اطلا عات وجود ندارد.";
                throw;
            }
            finally
            {
                new_connection.Close();
            }
        }

        protected void Img_btn_Image_group_Click(object sender, ImageClickEventArgs e)
        {
            MultiView_Edit.ActiveViewIndex = 0;
        }

       
        protected void btn_save_Group_pic_Click(object sender, EventArgs e)
        {
            SqlCommand new_command = new SqlCommand();
            string _filename;
            string _extentionfile;
            string _capacityfile;
            if (FileUpload_pic_Edit_Group.HasFile)
            {

                _filename = _id.ToString();
                _pic_path = _Virtual_path + _filename + System.IO.Path.GetExtension(FileUpload_pic_Edit_Group.PostedFile.FileName);
                _extentionfile = FileUpload_pic_Edit_Group.PostedFile.ContentType;
                _capacityfile = FileUpload_pic_Edit_Group.PostedFile.ContentLength/1024 + "KB";
                Label_FileUpload_Capacity_File_Group.Text = _capacityfile;
                Label_FileUpload_Extention_File_Group.Text = _extentionfile;
                try
                {

                    new_connection.ConnectionString = New_User.ConnectionString;
                    new_connection.Open();
                    new_command.Connection = new_connection;
                    new_command.CommandText = "UPDATE Group_tbl SET Pic_Group= '" + _pic_path + "' WHERE ID_Creator='" + _id + "' AND ID='" + _id_Group + "'";
                    new_command.ExecuteNonQuery();
                    Literal_pic_upload_Group.Text = "عکس شما با موفقیت آپلود شد.";
                    _pic_path = Convert.ToString(Server.MapPath(_pic_path));
                    FileUpload_pic_Edit_Group.SaveAs(_pic_path);
                    Img_Upload_Group_Pic.ImageUrl = _pic_path;
                    Response.Redirect(Request.Url.AbsoluteUri);
                }

                catch
                {
                    Literal_pic_upload_Group.Text = "امکان آپلود عکس وجود ندارد.";
                    throw;
                }

                finally
                {
                    new_connection.Close();
                    MultiView_Edit.ActiveViewIndex =1;
                }
            }
            else
                Literal_pic_upload_Group.Text = "عکسی برای آپلود وجود ندارد.";
        }

        protected void GridView_MemberShip_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            Label lbl1 = (Label)e.Row.FindControl("lbl_Date");
            if (lbl1 != null)
            {
                Date_Convert dt = new Date_Convert();
                lbl1.Text = dt.C_Date_en_to_fa(lbl1.Text);
            }
        }

      
        protected void GridView_MemberShip_SelectedIndexChanged(object sender, EventArgs e)
        {
           

            try
            {
                new_connection.ConnectionString = New_User.ConnectionString;
                new_connection.Open();
                new_command.Connection = new_connection;
                new_command.CommandText = "DELETE FROM Member_Group_tbl WHERE (ID_Group='" + _id_Group + "') ";
                new_command.ExecuteNonQuery();
                Literal_Member.Text = "کاربر مورد نظر حذف شد.";
            }
            catch
            { }
        }

        protected void Button_DeleteGroup_Click(object sender, EventArgs e)
        {
             try
            {
                new_connection.ConnectionString = New_User.ConnectionString;
                new_connection.Open();
                new_command.Connection = new_connection;
                new_command.CommandText = "DELETE FROM Group_tbl WHERE (ID='" + _id_Group + "') ";
                new_command.ExecuteNonQuery();
                Literal_Member.Text = "گروه مورد نظر حذف شد.";
            }
             catch
             { }
        }

    }
}