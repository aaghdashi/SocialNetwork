using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication6.Admin_Site
{
    public partial class Nots : System.Web.UI.Page
    {
        public Cloop_class New_user = new Cloop_class();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] == null)
            {
                Response.Redirect("~/Default.aspx?mode=exit");
                return;
            }
        }

        protected void Button_add_Click(object sender, EventArgs e)
        {
             SqlConnection new_connection = new SqlConnection();
             new_connection.ConnectionString = New_user.ConnectionString;
            try
            {               
                new_connection.Open();
                SqlCommand new_command = new SqlCommand();
                new_command.Connection = new_connection;
                new_command.CommandText = "INSERT INTO Main_Content_tbl(Subject_text,Body)VALUES('" + TextBox_Topic_Note.Text + "','" + TextBox_Body_Memo.Text + "')";
                new_command.ExecuteNonQuery();
                Response.Redirect(Request.Url.AbsoluteUri);
            }
            catch
            {
            }
            finally
            {
                new_connection.Close();
            }
        }

        protected void Button_Cancel_Click(object sender, EventArgs e)
        {
            TextBox_Body_Memo.Text = "";
            TextBox_Topic_Note.Text = "";
        }
    }
}