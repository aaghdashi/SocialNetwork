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
    public partial class WebForm7 : System.Web.UI.Page
    {
        public Cloop_class New_user = new Cloop_class();
        string _command_str;
        SqlConnection New_connection=new SqlConnection();
        SqlCommand New_command = new SqlCommand();

        public int _id;

        public void Select_User(string _command)
        {
            SqlDataReader DR;
            New_connection.ConnectionString = New_user.ConnectionString;
            New_connection.Open();
            New_command.CommandText = _command;
            New_command.Connection = New_connection;
            DR = New_command.ExecuteReader();
            DropDownList_AccountName.Items.Clear();
            while (DR.Read())
            {        
                ListItem list_user=new ListItem();
                list_user.Value = DR[0].ToString();
                list_user.Text = DR[1].ToString();
                DropDownList_AccountName.Items.Add(list_user);
            }
            DR.Close();
            New_connection.Close();

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            _id =(int) Session["id_user"];

            if (_id == null)
            {
                Response.Redirect("Error_Page.aspx?Error=0");
                return;
            }
        }

        protected void Img_btn_Create_Message_User_Click(object sender, ImageClickEventArgs e)
        {
            MultiView_Message.ActiveViewIndex = 1;
        }

        protected void Img_btn_Show_Send_message_Click(object sender, ImageClickEventArgs e)
        {
            MultiView_Message.ActiveViewIndex = 2;

        }

        protected void ImageButton_Send_Message_Click(object sender, ImageClickEventArgs e)
        {
            New_connection.ConnectionString = New_user.ConnectionString;
            New_connection.Open();
            New_command.CommandText = "INSERT INTO Messages_Users_tbl(Sender_User_ID,Reciever_User_ID,Topic_Message,Text_Message,Date_Create) VALUES('" + _id + "','" + DropDownList_AccountName.SelectedValue + "','" + RadTextBox_Topic_Message.Text.Trim() + "','" + RadTextBox_Body_Message.Text.Trim() + "','" + DateTime.Now.ToString() + "')";
            New_command.Connection = New_connection;
            New_command.ExecuteNonQuery();
            New_connection.Close();
            Literal_message.Text = "پیام شما با موفقیت ارسال شد.";
            RadTextBox_Topic_Message.Text = "";
            RadTextBox_Body_Message.Text = "";
        }

        protected void DropDownList_Type_User_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList_Type_User.SelectedValue =="0")
            {
             _command_str = "SELECT [ID], [Account_name] FROM [User_tbl]";
             Select_User(_command_str);
            }
            else if (DropDownList_Type_User.SelectedValue == "1")
            {
                _command_str = "SELECT User_tbl.ID, User_tbl.Account_name FROM User_tbl INNER JOIN Request_Friend_tbl ON User_tbl.ID = Request_Friend_tbl.Response_User_ID WHERE ((Request_Friend_tbl.Response_User_ID ='" + _id + "') OR (Request_Friend_tbl.Request_User_ID ='" + _id + "')) AND (Request_Friend_tbl.Flag='true') AND (Request_Friend_tbl.Block='false') ";
                Select_User(_command_str);
            }
        }

        protected void Img_btn_Show_Recive_Message_Click(object sender, ImageClickEventArgs e)
        {
            MultiView_Message.ActiveViewIndex = 3;

        }

        protected void GridView_Send_Message_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            Label lbl1 = (Label)e.Row.FindControl("lbl_Date");
            if (lbl1 != null)
            {
                Date_Convert dt = new Date_Convert();
                lbl1.Text = dt.C_Date_en_to_fa(lbl1.Text);
            }
        }

        protected void GridView_Recived_Message_RowDataBound(object sender, GridViewRowEventArgs e)
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