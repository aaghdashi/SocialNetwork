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
    public partial class WebForm1 : System.Web.UI.Page
    {
        public int _id;
        public int _id_Group;

        public Cloop_class New_user = new Cloop_class();
        SqlConnection new_connection = new SqlConnection();
        SqlCommand new_command = new SqlCommand();


        protected void Page_Load(object sender, EventArgs e)
        {
            _id = (int)Session["id_user"];
            _id_Group = (int)Session["id_group"];
        }

        protected void GridView_Member_Group_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Session["info_user"] = GridView_Member_Group.SelectedValue;
            //Response.Redirect("View_Info_User.aspx");
            try
            {

                new_connection.ConnectionString = New_user.ConnectionString;
                new_connection.Open();
                new_command.Connection = new_connection;
                new_command.CommandText = "DELETE FROM Member_Group_tbl WHERE (ID_Group='" + _id_Group + "') AND (ID_User='" + GridView_Member_Group.SelectedValue.ToString() + "') ";
                new_command.ExecuteNonQuery();
            }
            catch
            { }
            finally
            {
                new_connection.Close();
            }
        }

        protected void GridView_Member_Group_RowDataBound(object sender, GridViewRowEventArgs e)
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