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
    public partial class WebForm5 : System.Web.UI.Page
    {
        public Cloop_class New_user = new Cloop_class();
        SqlConnection new_connection = new SqlConnection();
        SqlCommand new_command = new SqlCommand();
        public int _id;
        protected void Page_Load(object sender, EventArgs e)
        {
            _id = (int)Session["id_user"];
            
            if (_id == null)
            {
                Response.Redirect("Error_Page.aspx?Error=0");
                return;
            }
        }

        protected void GridView_Show_Friend_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["Info_user"] = GridView_Show_Friend.SelectedValue;
            Response.Redirect("View_Info_User.aspx");
        }

        protected void Img_btn_Show_Friends_User_Click(object sender, ImageClickEventArgs e)
        {
            MultiView_Friends.ActiveViewIndex = 0;
            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void Img_btn_Edit_Friends_User_Click(object sender, ImageClickEventArgs e)
        {
            MultiView_Friends.ActiveViewIndex = 1;
        }

        protected void GridView_Edit_Friend_SelectedIndexChanged(object sender, EventArgs e)
        {
            new_connection.ConnectionString = New_user.ConnectionString;
            new_connection.Open();
            new_command.Connection = new_connection;
            try
            {
                new_command.CommandText = "DELETE FROM Request_Friend_tbl WHERE Response_User_ID='"+_id+"' OR Request_User_ID='"+_id+"'";
                new_command.ExecuteNonQuery();
                Literal_State_Friend.Text = "عمل لغو دوستی با موفقیت انجام شد.";
            }
            catch
            {
                throw;
                Literal_State_Friend.Text = "انجام عملیات با مشکل روبرو شده است.";
            }
            finally
            {
                new_connection.Close();
            }
        }

        protected void GridView_Show_Friend_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            Label lbl1 = (Label)e.Row.FindControl("lbl_Date");
            if (lbl1 != null)
            {
                Date_Convert dt = new Date_Convert();
                lbl1.Text = dt.C_Date_en_to_fa(lbl1.Text);
            }
        }

        protected void GridView_Edit_Friend_RowDataBound(object sender, GridViewRowEventArgs e)
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