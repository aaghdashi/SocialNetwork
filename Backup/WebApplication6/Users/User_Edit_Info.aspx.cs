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
    
    public partial class User_Edit_Info : System.Web.UI.Page
    {
        public Cloop_class New_User = new Cloop_class();
        public SqlConnection new_connection = new SqlConnection();
        Date_Convert English_Persian = new Date_Convert();
        public int _id;
        public string _Virtual_path = "/Users/Image_User/";
        public string _pic_path;
        DataSet _DS;

        public void _Show_Info()
        {
            string _Select_info;

            _Select_info = "SELECT Name,Family, Account_name,Sex_User,Birth_date,E_mail,Mager,Telephone,City_born,City_live,Ostan,Education,College_Name,Job_user,Discreption_User,Favorites_user,Din,State_Education,Security_Question,Security_Answer,User_pic FROM User_tbl WHERE ID= '" + _id + "'";
            _DS = New_User.User_info_Show(_Select_info);
            txt_name.Text = _DS.Tables[0].Rows[0][0].ToString();
            txt_Family.Text = _DS.Tables[0].Rows[0][1].ToString();
            txt_name_Account.Text = _DS.Tables[0].Rows[0][2].ToString();
            if ((bool)_DS.Tables[0].Rows[0][3])
                ddl_Sex.SelectedIndex=1;
            else
                ddl_Sex.SelectedIndex = 0;

            RadDatePicker_Born.SelectedDate = Convert.ToDateTime(Convert.ToDateTime(_DS.Tables[0].Rows[0][4]).ToShortDateString());
            txt_Email.Text = _DS.Tables[0].Rows[0][5].ToString();
            txt_Mager.Text = _DS.Tables[0].Rows[0][6].ToString();
            txt_Telephone.Text = _DS.Tables[0].Rows[0][7].ToString();
            txt_Cityborn.Text = _DS.Tables[0].Rows[0][8].ToString();
            txt_Citylive.Text = _DS.Tables[0].Rows[0][9].ToString();
            txt_Ostan.Text = _DS.Tables[0].Rows[0][10].ToString();
            txt_Education.Text = _DS.Tables[0].Rows[0][11].ToString();
            txt_Collegename.Text = _DS.Tables[0].Rows[0][12].ToString();
            txt_Jobuser.Text = _DS.Tables[0].Rows[0][13].ToString();
            txt_Discreption.Text = _DS.Tables[0].Rows[0][14].ToString();
            txt_Favoretis.Text = _DS.Tables[0].Rows[0][15].ToString();
            txt_Din.Text = _DS.Tables[0].Rows[0][16].ToString();
            txt_Education_State.Text = _DS.Tables[0].Rows[0][17].ToString();
            txt_Security_question.Text = _DS.Tables[0].Rows[0][18].ToString();
            txt_Secutity_answer.Text = _DS.Tables[0].Rows[0][19].ToString();
            Img_Upload_User_Pic.ImageUrl = _DS.Tables[0].Rows[0][20].ToString();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            _id =(int) Session["id_user"];
            
            if (_id == null)
            {
                Response.Redirect("Error_Page.aspx?Error=0");
                return;
            }

            mvw_Edit_info.ActiveViewIndex = 0;
            if (!Page.IsPostBack)
            {
                _Show_Info();
            }
        }

        protected void Img_btn_Contact_info_Click(object sender, ImageClickEventArgs e)
        {
            mvw_Edit_info.ActiveViewIndex = 0;
            _Show_Info();
        }

        protected void Img_btn_User_pic_Click(object sender, ImageClickEventArgs e)
        {
            mvw_Edit_info.ActiveViewIndex = 1;
        }

        protected void Img_btn_Info_user_Click(object sender, ImageClickEventArgs e)
        {
            DataSet _DS;
            string _Select_info;
            mvw_Edit_info.ActiveViewIndex = 2;
            _Select_info = "SELECT Name,Family, Account_name,Sex_User,Birth_date,E_mail,Mager,Telephone,City_born,City_live,Ostan,Education,College_Name,Job_user,Discreption_User,Date_m,User_pic,Favorites_user,Din,State_Education FROM User_tbl WHERE ID= '" + _id + "'";
            _DS= New_User.User_info_Show(_Select_info);
            Label_Info_name.Text = _DS.Tables[0].Rows[0][0].ToString();
            Label_Info_Family.Text = _DS.Tables[0].Rows[0][1].ToString();
            Label_Info_NameAccount.Text = _DS.Tables[0].Rows[0][2].ToString();
            if (Convert.ToBoolean(_DS.Tables[0].Rows[0][3])==false)
            { Label_Info_Sex.Text = "مرد"; }
            else { Label_Info_Sex.Text = "زن"; }
            Label_Info_Born.Text = English_Persian.C_Date_en_to_fa(_DS.Tables[0].Rows[0][4].ToString());
            Label_Info_Email.Text = _DS.Tables[0].Rows[0][5].ToString();
            Label_Info_Mager.Text = _DS.Tables[0].Rows[0][6].ToString();
            Label_Info_Telephone.Text = _DS.Tables[0].Rows[0][7].ToString();
            Label_Info_Cityborn.Text = _DS.Tables[0].Rows[0][8].ToString();
            Label_Info_Citylive.Text = _DS.Tables[0].Rows[0][9].ToString();
            Label_Info_Ostan.Text = _DS.Tables[0].Rows[0][10].ToString();
            Label_Info_Education.Text = _DS.Tables[0].Rows[0][11].ToString();
            Label_Info_Collegename.Text = _DS.Tables[0].Rows[0][12].ToString();
            Label_Info_Jobuser.Text = _DS.Tables[0].Rows[0][13].ToString();
            Label_Info_Discreption.Text = _DS.Tables[0].Rows[0][14].ToString();
            Label_Info_Favoretis.Text = _DS.Tables[0].Rows[0][17].ToString();
            Label_Info_Din.Text = _DS.Tables[0].Rows[0][18].ToString();
            Label_Info_Education_State.Text = _DS.Tables[0].Rows[0][19].ToString();
        }

        protected void Img_btn_Submit_Upload_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void btn_Cancel_Edit_user_Click(object sender, EventArgs e)
        {
            _Show_Info();
        }

        protected void btn_Cancel_Security_Click(object sender, EventArgs e)
        {
            _Show_Info();
        }

        protected void btn_Submit_security_Click(object sender, EventArgs e)
        {
            string _Command;
            SqlCommand new_command = new SqlCommand();
            try
            {
                
                new_connection.ConnectionString = New_User.ConnectionString;
                new_connection.Open();
                _Command = "UPDATE User_tbl SET Security_Question= '" + txt_Security_question.Text.Trim() + "', Security_Answer='" + txt_Secutity_answer.Text.Trim() + "' WHERE ID='" + _id + "'";
               if ((txt_Security_question.Text != null) || (txt_Secutity_answer.Text != null))
                {
                    new_command.Connection = new_connection;
                    new_command.CommandText = _Command;
                    new_command.ExecuteNonQuery();
                    Literal_Info.Text = "ثبت اطلاعات امنیتی با موفقیت انجام شد.";
                }
                else
                {
                    Literal_Info.Text = "کاربر گرامی لطفا هم سوال و هم جواب آن را وارد کنید.";
                }
            }

            catch
            {
                Literal_Info.Text = "امکان تغییر اطلا عات امنیتی وجود ندارد.";
                throw;
            }

            finally
            {
                new_connection.Close();
                mvw_Edit_info.ActiveViewIndex = 0;
            }
        }

        protected void btn_Edit_info_user_Click(object sender, EventArgs e)
        {
            SqlCommand new_command = new SqlCommand();
            try
            {

                new_connection.ConnectionString = New_User.ConnectionString;
                new_connection.Open();
               
                    new_command.Connection = new_connection;
                    new_command.CommandText = "UPDATE User_tbl SET Name='" + txt_name.Text.Trim() + "',Family='" + txt_Family.Text + "', Account_name='" + txt_name_Account.Text.Trim() + "',Sex_User='" + ddl_Sex.SelectedIndex + "',Birth_date='" + RadDatePicker_Born.SelectedDate + "',E_mail='" + txt_Email.Text.Trim() + "',Mager='" + txt_Mager.Text.Trim() + "',Telephone='" + txt_Telephone.Text.Trim() + "',City_born='" + txt_Cityborn.Text.Trim() + "',City_live='" + txt_Citylive.Text.Trim() + "',Ostan='" + txt_Ostan.Text.Trim() + "',Education='" + txt_Education.Text.Trim() + "',College_Name='" + txt_Collegename.Text.Trim() + "',Job_user='" + txt_Jobuser.Text.Trim() + "',Discreption_User='" + txt_Discreption.Text.Trim() + "',Favorites_user='" + txt_Favoretis.Text.Trim() + "',Din='" + txt_Din.Text.Trim() + "',State_Education='" + txt_Education_State.Text.Trim() + "'  WHERE ID='" + _id + "'";
                    new_command.ExecuteNonQuery();
                    Literal_Info.Text = "ثبت اطلاعات با موفقیت انجام شد.";
              
            }

            catch
            {
                Literal_Info.Text = "امکان تغییر اطلا عات وجود ندارد.";
                throw;
            }

            finally
            {
                new_connection.Close();
            }
        }

        protected void btn_save_user_pic_Click(object sender, EventArgs e)
        {
            SqlCommand new_command = new SqlCommand();
            string _filename;
            string _extentionfile;
            string _capacityfile;
            if (FileUpload_pic_Edit_user.HasFile)
            {

                _filename = _id.ToString();
                _extentionfile = FileUpload_pic_Edit_user.PostedFile.ContentType;
                _capacityfile = FileUpload_pic_Edit_user.PostedFile.ContentLength/1024 + "KB";
                _pic_path = _Virtual_path + _filename + System.IO.Path.GetExtension(FileUpload_pic_Edit_user.PostedFile.FileName); 
                Label_FileUpload_Extention_File.Text = _extentionfile;
                Label_FileUpload_Capacity_File.Text = _capacityfile;
                try
                {

                    new_connection.ConnectionString = New_User.ConnectionString;
                    new_connection.Open();
                    new_command.Connection = new_connection;
                    new_command.CommandText = "UPDATE User_tbl SET User_pic= '"+_pic_path+"' WHERE ID='" + _id + "'";
                    new_command.ExecuteNonQuery();
                    Literal_pic_upload.Text = "عکس شما با موفقیت آپلود شد.";
                    FileUpload_pic_Edit_user.SaveAs(Server.MapPath(_pic_path));
                    Img_Upload_User_Pic.ImageUrl = _pic_path;
                }

                catch
                {
                    Literal_pic_upload.Text = "امکان آپلود عکس وجود ندارد.";
                    throw;
                }

                finally
                {
                    new_connection.Close();
                    mvw_Edit_info.ActiveViewIndex = 1;
                }
            }
            else
                Literal_pic_upload.Text = "عکسی برای آپلود وجود ندارد.";
        }

        protected void btn_Cancel_Upload_pic_Click(object sender, EventArgs e)
        {
            mvw_Edit_info.ActiveViewIndex = 1;

        }
    }
}