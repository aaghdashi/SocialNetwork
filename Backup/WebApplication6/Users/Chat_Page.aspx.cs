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
    public partial class Chat_Page : System.Web.UI.Page
    {
        Cloop_class new_chatter = new Cloop_class();
        SqlConnection new_connection = new SqlConnection();
        SqlCommand new_command = new SqlCommand();
        int _id;
        
        public void Refresh_List_chater()
        {           
            Repeater_Online_User.DataSource = SqlDataSource_List_Chater;
            Repeater_Online_User.DataBind();
            Repeater_Chat.DataSource = SqlDataSource_Chat;
            Repeater_Chat.DataBind();
            Application["new_chater"] = 0;  
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Repeater_Online_User.DataSource = SqlDataSource_List_Chater;
            Repeater_Online_User.DataBind();            
            Repeater_Chat.DataSource = SqlDataSource_Chat;
            Repeater_Chat.DataBind();
            _id=(int)Session["id_user"];
            if (_id == null)
            {
                Response.Redirect("Error_Page.aspx?Error=0");
                return;
            }
            if ((int)Application["new_chater"] == 1)
            { Refresh_List_chater(); }
        }

        protected void Button_Send_Click(object sender, EventArgs e)
        {
            try
            {
                new_connection.ConnectionString = new_chatter.ConnectionString;
                new_connection.Open();
                new_command.Connection = new_connection;
                new_command.CommandText = "INSERT INTO Chat_tbl(ID_User,Body,Date_Create) VALUES ('" + _id + "','" + RadEditor_Chat.Text + "','"+DateTime.Now.ToString()+"')";
                new_command.ExecuteNonQuery();
                RadEditor_Chat.Content = "";
                Response.Redirect(Request.Url.AbsoluteUri);
            }
            catch
            {
                throw;
            }
            finally
            {
                new_connection.Dispose();
            }
        }

        protected void Repeater_Chat_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Label lbl1 = (Label)e.Item.FindControl("Label_date");
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

        protected void Repeater_Online_User_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Image IMG = (Image)e.Item.FindControl("Image_Chat");
            if (IMG != null)
            {
                if (IMG.ImageUrl == string.Empty)
                    IMG.ImageUrl = "~/Users/images/no_image.png";
            }
        }
    }
}