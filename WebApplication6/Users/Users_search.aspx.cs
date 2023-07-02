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
    public partial class WebForm4 : System.Web.UI.Page
    {    
        public Cloop_class New_user = new Cloop_class();
        bool _sex;
        
        DataSet DS=new DataSet();
        SqlConnection new_connection = new SqlConnection();
        SqlCommand new_command = new SqlCommand();
        
        string _command="";
        string[] criteria = new string[6];
        string _criter;
        int _id;


        DataSet DS_Search1 = new DataSet();
        DataSet DS_Search2 = new DataSet();
        DataSet DS_Search3 = new DataSet();
        DataSet DS_Search4 = new DataSet();
        DataSet DS_Search5 = new DataSet();
        DataSet DS_Search6 = new DataSet();

        Search Search_Complex = new Search();

        protected void Page_Load(object sender, EventArgs e)
        {
            _id = (int)Session["id_user"];
            if (_id == null)
            {
                Response.Redirect("Error_Page.aspx?Error=0");
                return;
            }
            if (!IsPostBack)
                MultiView_Search.ActiveViewIndex = 0;
        }

        protected void Img_btn_Search_User_Click(object sender, ImageClickEventArgs e)
        {
            MultiView_Search.ActiveViewIndex = 1;
        }

        protected void Img_btn_Search_Group_Click(object sender, ImageClickEventArgs e)
        {
            MultiView_Search.ActiveViewIndex = 2;
        }

       

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            string _command;
           
            new_connection.ConnectionString = New_user.ConnectionString;

            _command = "SELECT  Group_tbl.ID,CASE WHEN Group_tbl.ID_Creator= User_tbl.ID THEN User_tbl.Account_name END AS  'مدیر گروه',Name_Group as 'نام گروه',Topic_Group as 'موضوع گروه',Date_Create as 'تاریخ ایجاد',Discreption_Group as 'توضیحات' FROM Group_tbl INNER JOIN User_tbl ON Group_tbl.ID_Creator= User_tbl.ID WHERE Name_Group LIKE '%" + txt_Name_Group.Text.Trim() + "%' OR Topic_Group='" + DropDownList_Topic_Group.SelectedItem.Text + "'";


            try
            {
                new_connection.Open();
                new_command.Connection = new_connection;
                new_command.CommandText = _command;
                SqlDataAdapter new_adapter = new SqlDataAdapter(new_command);
                new_command.ExecuteNonQuery();
                new_adapter.Fill(DS);
                GridView_Groups.DataSource = DS.Tables[0];
                GridView_Groups.DataBind();
                Literal_Search_User.Text = "کاربرانی که مشخصاتشان مشابه است با آنچه که شما مد نظر دارید.";
            }
            catch
            {
                throw;
            }
            finally
            {
                new_connection.Close();
            }
        }

        protected void GridView_Users_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataReader DR;
            new_connection.ConnectionString = New_user.ConnectionString;
            new_connection.Open();
            new_command.Connection = new_connection;
            if (_id != (int)GridView_Users.SelectedValue)
            {
                new_command.CommandText = "SELECT Request_User_ID,Response_User_ID FROM Request_Friend_tbl WHERE  ((Response_User_ID= '" + GridView_Users.SelectedValue + "' AND Request_User_ID='" + _id + "') OR(Response_User_ID= '" + _id + "' AND Request_User_ID='" + GridView_Users.SelectedValue + "'))";
                DR = new_command.ExecuteReader();
                if (!DR.HasRows)
                {
                    DR.Close();
                    new_command.Dispose();
                    try
                    {
                        new_command.CommandText = "INSERT INTO Request_Friend_tbl(Request_User_ID,Response_User_ID,Response_Date,Flag) VALUES ('" + _id + "','" + GridView_Users.SelectedValue + "','" + DateTime.Now.Date.ToShortDateString() + "','false')";
                        new_command.ExecuteNonQuery();
                        Literal_Status_Friend.Text = "دوستی شما با کاربر مورد نظر با موفقیت انجام شد.";
                    }
                    catch
                    {
                        Literal_Status_Friend.Text = "فرآیندی دوستی با مشکل روبرو شده است، لطفا مجددا سعی نمایید.";
                        throw;
                    }
                }
                else
                {
                    Literal_Status_Friend.Text = " شما با این کاربر قبلا دوست شده اید و یا او با شما دوست شده است لذا امکان دوستی مجدد وجود ندارد.";
                }
            }
            else
            {
                Literal_Status_Friend.Text = "کاربر گرامی امکان اینکه شما با خودتان دوست شوید وجود ندارد.";
            }
                    new_connection.Close();
                
        }

        protected void GridView_Groups_SelectedIndexChanged(object sender, EventArgs e)
        {
            string _command;
            new_connection.ConnectionString = New_user.ConnectionString;
            new_connection.Open();
            new_command.Connection = new_connection;
            SqlDataReader DR;
           
                new_command.CommandText = "SELECT ID_Group,ID_User FROM Member_Group_tbl WHERE  ID_Group= '" + GridView_Groups.SelectedValue + "' AND ID_User='" + _id + "'";
                DR = new_command.ExecuteReader();

                if (!DR.HasRows)
                {
                    DR.Close();
                    new_command.Dispose();
                    try
                    {
                        _command = "INSERT INTO Member_Group_tbl(ID_Group,ID_User,Date_member) VALUES ('" + GridView_Groups.SelectedValue + "','" + _id + "','" + DateTime.Now.Date.ToShortDateString() + "')";
                        new_command.CommandText = _command;
                        SqlDataAdapter new_adapter = new SqlDataAdapter(new_command);
                        new_command.ExecuteNonQuery();
                        Literal_Search_Group.Text = "عضویت شما در گروه مورد نظر با موفقیت انجام شد.";
                    }
                    catch
                    {
                        Literal_Search_Group.Text = "فرآیند عضویت با مشکل روبرو شده است لطفا مجددا برای عضو شدن در گروه عمل مربوطه را تکرار نمایید.";
                        throw;
                    }
                }
                else
                {
                    Literal_Search_Group.Text = " شما در این گروه قبلا عضو شده اید لذا امکان عضویت مجدد وجود ندارد.";
                }
            
                new_connection.Close();
        }

        protected void ImageButton_Search_User_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                new_connection.ConnectionString = New_user.ConnectionString;
                _command = "SELECT DISTINCT ID,Name as 'نام ',Family as 'نام خانوادگی',CASE WHEN Sex_User='True' THEN 'زن' WHEN Sex_User='False' THEN 'مرد' END AS 'جنسیت',Account_name as 'نام کاربری',City_live as 'محل سکونت',E_mail as 'ایمیل' FROM User_tbl WHERE  1=1 ";

                criteria[0] = txt_Name.Text.Trim() != "" ? " AND (Name LIKE '%" + txt_Name.Text.ToString() + "%')" : "";
                criteria[1] = txt_Family.Text.Trim() != "" ? " AND (Family LIKE '%" + txt_Family.Text.ToString() + "%')" : "";
                criteria[2] = txt_Account_Name.Text.Trim() != "" ? " AND (Account_name LIKE '%" + txt_Account_Name.Text.ToString() + "%')" : "";
                criteria[3] = txt_City_live.Text.Trim() != "" ? " AND (City_live LIKE '%" + txt_City_live.Text.ToString() + "%')" : "";

                if (DropDownList_Sex_user.SelectedValue == "0")
                    _sex = false;
                else if (DropDownList_Sex_user.SelectedValue == "1")
                    _sex = true;
                criteria[4] = " AND (Sex_User='" + _sex + "')";

                if (DropDownList_Sex_user.SelectedValue == "-1")
                {
                    criteria[4] = "";
                }

                for (int i = 0; i < criteria.Length - 1; i++)
                {
                    _criter += criteria[i];
                }
                _command += _criter;
                new_connection.Open();
                new_command.Connection = new_connection;
                new_command.CommandText = _command;
                SqlDataAdapter new_adapter = new SqlDataAdapter(new_command);
                new_command.ExecuteNonQuery();
                DS.Clear();
                new_adapter.Fill(DS);
                GridView_Users.DataSource = DS;
                GridView_Users.DataBind();
                Literal_Search_User.Text = "کاربرانی که مشخصاتشان مشابه است با آنچه که شما مد نظر دارید.";
            }
            catch
            {
                throw;
            }
            finally
            {
                new_connection.Close();
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string _Search;
            _Search = TextBox_Search.Text.Trim();
            if (_Search != "")
            {
                DS_Search1.Clear();
                DS_Search2.Clear();
                DS_Search3.Clear();
                DS_Search4.Clear();
                DS_Search5.Clear();
                DS_Search6.Clear();

                DS_Search1 =Search_Complex.Search_Post(_Search);
                DS_Search2=Search_Complex.Search_User(_Search);
                DS_Search3=Search_Complex.Search_Group(_Search);
                DS_Search4=Search_Complex.Search_Picture(_Search);
                DS_Search5=Search_Complex.Search_textFile(_Search);
                DS_Search6=Search_Complex.Search_Video(_Search);

                Repeater_Post.DataSource = DS_Search1;
                Repeater_Post.DataBind();

                Repeater_User.DataSource = DS_Search2;
                Repeater_User.DataBind();

                Repeater_Group.DataSource = DS_Search3;
                Repeater_Group.DataBind();

                Repeater_Picture.DataSource = DS_Search4;
                Repeater_Picture.DataBind();

                Repeater_TextFile.DataSource = DS_Search5;
                Repeater_TextFile.DataBind();

                Repeater_Video.DataSource = DS_Search6;
                Repeater_Video.DataBind();
            }
        }

        protected void Repeater_Post_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Label lbl1 = (Label)e.Item.FindControl("Label_Date");
            if (lbl1 != null)
            {
                Date_Convert dt = new Date_Convert();
                lbl1.Text = dt.C_Date_en_to_fa(lbl1.Text);
            }        
            
        }

        protected void Repeater_User_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Image IMG = (Image)e.Item.FindControl("Image_user");
            if (IMG != null)
            {
                if (IMG.ImageUrl == string.Empty)
                    IMG.ImageUrl = "~/Users/images/no_image.png";
            }
            Label lbl1 = (Label)e.Item.FindControl("Label_member_Date");
            if (lbl1 != null)
            {
                Date_Convert dt = new Date_Convert();
                lbl1.Text = dt.C_Date_en_to_fa(lbl1.Text);
            }       
        }

        protected void Repeater_Group_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Image IMG = (Image)e.Item.FindControl("Image1");
            if (IMG != null)
            {
                if (IMG.ImageUrl == string.Empty)
                    IMG.ImageUrl = "~/Users/images/no_image.png";
            }
            Label lbl1 = (Label)e.Item.FindControl("Label_Date_all");
            if (lbl1 != null)
            {
                Date_Convert dt = new Date_Convert();
                lbl1.Text = dt.C_Date_en_to_fa(lbl1.Text);
            }       
        }

        protected void Repeater_TextFile_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Label lbl1 = (Label)e.Item.FindControl("Label9");
            if (lbl1 != null)
            {
                Date_Convert dt = new Date_Convert();
                lbl1.Text = dt.C_Date_en_to_fa(lbl1.Text);
            }       
        }

        protected void Repeater_Video_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Label lbl1 = (Label)e.Item.FindControl("Label9");
            if (lbl1 != null)
            {
                Date_Convert dt = new Date_Convert();
                lbl1.Text = dt.C_Date_en_to_fa(lbl1.Text);
            }       
        }

        protected void Repeater_Picture_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Label lbl1 = (Label)e.Item.FindControl("Label9");
            if (lbl1 != null)
            {
                Date_Convert dt = new Date_Convert();
                lbl1.Text = dt.C_Date_en_to_fa(lbl1.Text);
            }       
        }

        protected void Img_btn_user_Click(object sender, ImageClickEventArgs e)
        {
            MultiView_Result.ActiveViewIndex = 1;
        }

        protected void Img_btn_Post_Click(object sender, ImageClickEventArgs e)
        {
            MultiView_Result.ActiveViewIndex = 0;

        }

        protected void Img_btn_Group_Click(object sender, ImageClickEventArgs e)
        {
            MultiView_Result.ActiveViewIndex = 2;

        }

        protected void Img_btn_Textfile_Click(object sender, ImageClickEventArgs e)
        {
            MultiView_Result.ActiveViewIndex = 3;

        }

        protected void Img_btn_Video_Click(object sender, ImageClickEventArgs e)
        {
            MultiView_Result.ActiveViewIndex = 4;

        }

        protected void Img_btn_Pic_Click(object sender, ImageClickEventArgs e)
        {
            MultiView_Result.ActiveViewIndex = 5;

        }

        protected void ImageButton_SearchPost_Click(object sender, ImageClickEventArgs e)
        {
            
                DS_Search1.Clear();

                DS_Search1 = Search_Complex.ComplexSearch_Post(TextBox_TopicPost.Text, TextBox_Memo.Text, TextBox_time1.Text.ToString(), TextBox_time2.Text.ToString());
               

                Repeater_SearchPost.DataSource = DS_Search1;
                Repeater_SearchPost.DataBind();
        }

        protected void Repeater_SearchPost_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Label lbl1 = (Label)e.Item.FindControl("Label_Date");
            if (lbl1 != null)
            {
                Date_Convert dt = new Date_Convert();
                lbl1.Text = dt.C_Date_en_to_fa(lbl1.Text);
            }       
        }

        protected void ImageButton_search_Post_Click(object sender, ImageClickEventArgs e)
        {
            MultiView_Search.ActiveViewIndex = 3;
        }
               
    }
}