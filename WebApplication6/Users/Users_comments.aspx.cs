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
    public partial class WebForm2 : System.Web.UI.Page
    {
        public string _mode;
        public static string _Comment_id;
        Cloop_class new_user = new Cloop_class();
        SqlConnection new_connection = new SqlConnection();
        SqlCommand new_command = new SqlCommand();

        public void Delete_Post(string post_id)
        {
            new_connection.ConnectionString = new_user.ConnectionString;
            new_connection.Open();

            string _command;
            _command = "DELETE FROM Comment_Users_tbl  WHERE ID='" + _Comment_id + "'";
            new_command.CommandText = _command;
            new_command.Connection = new_connection;
            new_command.ExecuteNonQuery();
            new_connection.Close();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                _Comment_id = Request.QueryString["comment_id"];
                _mode = Request.QueryString["mode"];
            }
            if (_mode == "comment")
            {
                Delete_Post(_Comment_id);
                _mode = "";
            }
          
           
        }

        protected void Repeater_Comment_ItemDataBound(object sender, RepeaterItemEventArgs e)
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
    }
}