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
    public partial class Gap_MemberShip_Group : System.Web.UI.Page
    {
        public int _id;
        public string  _id_group;
        public string _state;

        SqlCommand new_command = new SqlCommand();
        SqlConnection new_connectoin = new SqlConnection();
        Cloop_class new_user = new Cloop_class();
        
        SqlDataReader DR;
        public static List<string> _Filter = new List<string>();
        public void Filter_Message()
        {
            _Filter.Clear();
            new_connectoin.ConnectionString = new_user.ConnectionString;
            new_connectoin.Open();
            new_command.Connection = new_connectoin;
            new_command.CommandText = "SELECT DISTINCT Key_Word FROM Filter_Word_tbl";
            DR = new_command.ExecuteReader();
            while (DR.Read())
            {
                _Filter.Add(DR[0].ToString());
            }
            DR.Close();
            new_connectoin.Close();
        }

        public void CheckGroup()
        {

            new_connectoin.ConnectionString = new_user.ConnectionString;
            new_connectoin.Open();
            new_command.Connection = new_connectoin;
            SqlDataReader DR;
            new_command.CommandText = "SELECT Group_tbl.Archive FROM Group_tbl WHERE  ID= '" + _id_group + "' ";
            DR = new_command.ExecuteReader();
            DR.Read();
            if (DR.HasRows)
            {
                if ((bool)DR[0])
                {
                    btn_send.Enabled = false;
                    Literal_Message.Text = "<br /><span style=" + "color:red;" + ">به دلیل آرشیو بودن گروه امکان ارسال پیام وجو ندارد.</span>.";
                }
                else
                {

                    btn_send.Enabled = true;
                    Literal_Message.Text = "";
                }
                
            }
            DR.Close();

            new_connectoin.Close();

        }


        protected void Page_Load(object sender, EventArgs e)
        {
            _id =(int) Session["id_user"];
            _id_group = Request.QueryString["id"];


            CheckGroup();

            
            if (_id == null)
            {
                Response.Redirect("Error_Page.aspx?Error=0");
                return;
            }
           
            Repeater_Gap.DataSourceID = "SqlDataSource_Gap";
            Repeater_Gap.DataBind();
            Filter_Message();
        }

        protected void btn_send_Click(object sender, EventArgs e)
        {
            new_connectoin.ConnectionString = new_user.ConnectionString;
            new_connectoin.Open();
            new_command.Connection = new_connectoin;
             for (int i = 0; i <= _Filter.Count - 1; i++)
             {
                TextBox_Message.Text= TextBox_Message.Text.Replace(_Filter[i], "****");
             }
            new_command.CommandText = "INSERT INTO Gap_MemberShip_Group_tbl(ID_Group,ID_User,Date,Message_Text) VALUES ('"+_id_group+"','"+_id+"','"+DateTime.Now.ToString()+"','"+TextBox_Message.Text.Trim()+"')";
            new_command.ExecuteNonQuery();
            new_connectoin.Close();
            Literal_Message.Text = "پیام شما با موفقیت ارسال شد.";
            Repeater_Gap.DataSourceID = "SqlDataSource_Gap";
            Repeater_Gap.DataBind();
            Response.Redirect(Request.Url.AbsoluteUri);
            TextBox_Message.Text = "";
        }

        protected void Repeater_Gap_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Label lbl1 = (Label)e.Item.FindControl("Label_date");
            if (lbl1 != null)
            {
                Date_Convert dt = new Date_Convert();
                lbl1.Text = dt.C_Date_en_to_fa(lbl1.Text);
            }

            Image IMG = (Image)e.Item.FindControl("Image_Gap");
            if (IMG != null)
            {
                if (IMG.ImageUrl == string.Empty)
                    IMG.ImageUrl = "~/Users/images/no_image.png";
            }
            
        }

       

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {

            Label lbl1 = (Label)e.Item.FindControl("Label_member_Date");
            if (lbl1 != null)
            {
                Date_Convert dt = new Date_Convert();
                lbl1.Text = dt.C_Date_en_to_fa(lbl1.Text);
            }

            Image IMG = (Image)e.Item.FindControl("Image_user");
            if (IMG != null)
            {
                if (IMG.ImageUrl == string.Empty)
                    IMG.ImageUrl = "~/Users/images/no_image.png";
            }
        }
    }
}