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
    public partial class Filter_Word : System.Web.UI.Page
    {
        Cloop_class Connection_Str = new Cloop_class();
        SqlConnection new_connection = new SqlConnection();
        SqlCommand new_command = new SqlCommand();

        protected void Page_Load(object sender, EventArgs e)
        {
         
            if (Session["ID"] == null)
            {
                Response.Redirect("~/Default.aspx?mode=exit");
                return;
            }
        }

        protected void LinkButton_Show_Click(object sender, EventArgs e)
        {
            MultiView_Filter_Word.ActiveViewIndex = 0;
        }

        protected void LinkButton_Insert_Click(object sender, EventArgs e)
        {
            MultiView_Filter_Word.ActiveViewIndex = 1;

        }

        protected void LinkButton_Edit_Click(object sender, EventArgs e)
        {
            MultiView_Filter_Word.ActiveViewIndex = 2;

        }

      

        protected void Button_Insert_Click(object sender, EventArgs e)
        {
            try
            {
                new_connection.ConnectionString = Connection_Str.ConnectionString;
                new_connection.Open();
                new_command.CommandText = "INSERT INTO Filter_Word_tbl(Key_Word) VALUES('"+TextBox_Word.Text.Trim()+"')";
                new_command.Connection = new_connection;
                new_command.ExecuteNonQuery();
            }
            catch
            {
                Literal_Add_Word.Text = "کلمه مورد نظر شمااضافه نشد،لطفا در صورت تمایل به درج کلمه مورد نظر خود مجددا تلاش نمایید.";
                throw;
            }
            finally
            {
                new_connection.Close();
                Literal_Add_Word.Text = "کلمه مورد نظر شما با موفقیت اضافه شد.";
            }
        }
    }
}