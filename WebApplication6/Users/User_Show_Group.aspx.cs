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
    public partial class WebForm9 : System.Web.UI.Page
    {
        public Cloop_class New_user = new Cloop_class();
        public SqlConnection new_connection = new SqlConnection();
        SqlCommand new_command = new SqlCommand();
        public  DataSet DS = new DataSet();
        string _command;
       
        public int _id;
        public string _id_group;
        public string _mode;

        public bool _checkAccount;
        public bool _checkTopic;

        public void Sign_Up()
        {
            string _command;
            new_connection.ConnectionString = New_user.ConnectionString;
            new_connection.Open();
            new_command.Connection = new_connection;
            SqlDataReader DR;
            new_command.CommandText = "SELECT ID_Group,ID_User FROM Member_Group_tbl WHERE  ID_Group= '" +_id_group  + "' AND ID_User='" + _id + "'";
            DR = new_command.ExecuteReader();

            if (!DR.HasRows)
            {
                DR.Close();
                new_command.Dispose();
                try
                {
                    _command = "INSERT INTO Member_Group_tbl(ID_Group,ID_User,Date_member) VALUES ('" + _id_group + "','" + _id + "','" + DateTime.Now.Date.ToShortDateString() + "')";
                    new_command.CommandText = _command;
                    SqlDataAdapter new_adapter = new SqlDataAdapter(new_command);
                    new_command.ExecuteNonQuery();
                    Literal_Signup.Text = "عضویت شما در گروه مورد نظر با موفقیت انجام شد.";
                }
                catch
                {
                    Literal_Signup.Text = "فرآیند عضویت با مشکل روبرو شده است لطفا مجددا برای عضو شدن در گروه عمل مربوطه را تکرار نمایید.";
                    throw;
                }
            }
            else
            {
                Literal_Signup.Text = " شما در این گروه قبلا عضو شده اید لذا امکان عضویت مجدد وجود ندارد.";
            }
            new_connection.Close();
            MultiView_Group.ActiveViewIndex = 0;
            MultiView_Type_Group.ActiveViewIndex = 0;
            _mode = "";
        }

        public void CheckAccount()
        {

            new_connection.ConnectionString = New_user.ConnectionString;
            new_connection.Open();
            new_command.Connection = new_connection;
            SqlDataReader DR;
            new_command.CommandText = "SELECT Admin_Name FROM Group_tbl WHERE  Admin_Name= '" + TextBox_Account_Name.Text + "' ";
            DR = new_command.ExecuteReader();

            if (DR.HasRows)
            {
                DR.Close();

                Literal_State_Group.Text += "<br /><span style=" + "color:red;" + ">این نام کاربری قبلا انتخاب شده است</span>.";
                _checkAccount = true;
            }
            else
            {
                _checkAccount = false;
                Literal_State_Group.Visible = false;
            }

            new_connection.Close();

        }

        public void CheckTopic()
        {

            new_connection.ConnectionString = New_user.ConnectionString;
            new_connection.Open();
            new_command.Connection = new_connection;
            SqlDataReader DR;
            new_command.CommandText = "SELECT Name_Group FROM Group_tbl WHERE  Name_Group= '" + RadTextBox_NameGroup.Text + "' ";
            DR = new_command.ExecuteReader();

            if (DR.HasRows)
            {
                DR.Close();

                Literal_State_Group.Text += "<br /><span style=" + "color:red;" + ">نام گروه تکراری می باشد.</span>.";
                _checkTopic = true;
            }
            else
            {
                _checkTopic = false;
                Literal_State_Group.Visible = false;
            }

            new_connection.Close();

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            _id =(int) Session["id_user"];

            if (_id == null)
            {
                Response.Redirect("Error_Page.aspx?Error=0");
                return;
            }

            if (!Page.IsPostBack)
            {
                _id_group=Request.QueryString["ID"];
                _mode = Request.QueryString["mode"];
            }
            switch (_mode)
            {
                case "signup":
                    Sign_Up();
                    break;
                case "Gap":
                    Response.Redirect("Gap_MemberShip_Group.aspx?id=" + _id_group);
                    break;
                //case "":
                //    break;
                default:
                    break;
            }
        }

        protected void Button_Create_Group_Click(object sender, EventArgs e)
        {
            SqlCommand new_command = new SqlCommand();

            Literal_Signup.Text = "";

            CheckAccount();
            CheckTopic();

            if (!(_checkTopic && _checkAccount))
            {
                try
                {
                    new_connection.ConnectionString = New_user.ConnectionString;
                    new_connection.Open();

                    new_command.Connection = new_connection;
                    new_command.CommandText = "INSERT INTO Group_tbl(ID_Creator,Name_Group,Topic_Group,Date_Create,Discreption_Group,Admin_Name,Admin_Password,Email) VALUES('" + _id + "','" + RadTextBox_NameGroup.Text.Trim() + "','" + DropDownList_Topic_Group.SelectedItem.Text.Trim() + "','" + DateTime.Now.Date.ToShortDateString() + "','" + TextBox_Description_Group.Text.Trim() + "','" + TextBox_Account_Name.Text.Trim() + "','" + TextBox_Password.Text.Trim() + "','" + TextBox_Email.Text.Trim() + "')";
                    new_command.ExecuteNonQuery();
                    Literal_State_Group.Text = "گروه جدید با موفقیت ایجاد شد.";

                }

                catch
                {
                    Literal_State_Group.Text = "عملیات با مشکل روبرو شده است .";
                    throw;
                }

                finally
                {
                    new_connection.Close();
                }
            }
        }

        protected void ImageButton_Make_Group_Click(object sender, ImageClickEventArgs e)
        {
            MultiView_Group.ActiveViewIndex = 1;
        }

        protected void Button_Cancel_Group_Click(object sender, EventArgs e)
        {
            DropDownList_Topic_Group.SelectedIndex = 0;
            RadTextBox_NameGroup.Text = "";
            TextBox_Description_Group.Text = "";

        }

        protected void ImageButton_Show_Group_Click(object sender, ImageClickEventArgs e)
        {
            MultiView_Group.ActiveViewIndex = 0;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            _command = "";
            if (DropDownList_Group_type.SelectedIndex == 0)
            {
                MultiView_Type_Group.ActiveViewIndex = 0;
            }
            if (DropDownList_Group_type.SelectedIndex == 1)
            {
                MultiView_Type_Group.ActiveViewIndex = 1;
            }
            if (DropDownList_Group_type.SelectedIndex == 2)
            {
                MultiView_Type_Group.ActiveViewIndex = 2;
            }
            
        }

     

      
        protected void DataList_Joined_Group_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            Label lbl3 = (Label)e.Item.FindControl("Label_Date_Join");
            if (lbl3 != null)
            {
                Date_Convert dt = new Date_Convert();
                lbl3.Text = dt.C_Date_en_to_fa(lbl3.Text);
            }
            Image IMG = (Image)e.Item.FindControl("Image1");
            if (IMG != null)
            {
                if (IMG.ImageUrl == string.Empty)
                    IMG.ImageUrl = "~/Users/images/no_image.png";
            }
        }

        protected void DataList_Maked_Group_By_me_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            Label lbl2 = (Label)e.Item.FindControl("Label_Date_Maked");
            if (lbl2 != null)
            {
                Date_Convert dt = new Date_Convert();
                lbl2.Text = dt.C_Date_en_to_fa(lbl2.Text);
            }

            Image IMG = (Image)e.Item.FindControl("Image1");
            if (IMG != null)
            {
                if (IMG.ImageUrl == string.Empty)
                    IMG.ImageUrl = "~/Users/images/no_image.png";
            }
        }

        protected void DataList_Exist_Group_Section1_ItemDataBound(object sender, DataListItemEventArgs e)
        {

            Label lbl1 = (Label)e.Item.FindControl("Label_Date_all");
            if (lbl1 != null)
            {
                Date_Convert dt = new Date_Convert();
                lbl1.Text = dt.C_Date_en_to_fa(lbl1.Text);
            }

            Image IMG = (Image)e.Item.FindControl("Image1");
            if (IMG != null)
            {
                if (IMG.ImageUrl == string.Empty)
                    IMG.ImageUrl = "~/Users/images/no_image.png";
            }
        }
              
    }
}