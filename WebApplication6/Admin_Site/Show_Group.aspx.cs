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
    public partial class Show_Group : System.Web.UI.Page
    {
        Cloop_class new_str_connection = new Cloop_class();
        SqlConnection new_connection = new SqlConnection();
        SqlCommand new_command = new SqlCommand();
        string _mode;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                _mode = Request.QueryString["mode"];
            }
            if (_mode == "member")
            {
                MultiView_Group.ActiveViewIndex = 2;
                _mode = "";
            }
            if (Session["ID"] == null)
            {
                Response.Redirect("~/Default.aspx?mode=exit");
                return;
            }
        }

        protected void LinkButton_Show_Topic_Click(object sender, EventArgs e)
        {
            MultiView_Group.ActiveViewIndex = 0;
        }

        protected void LinkButton_Show_Group_Click(object sender, EventArgs e)
        {
            MultiView_Group.ActiveViewIndex = 1;
        }

        protected void Button_Insert_Click(object sender, EventArgs e)
        {
            new_connection.ConnectionString = new_str_connection.ConnectionString;
            new_connection.Open();
            if (TextBox_Topic.Text != "")
            {
                try
                {
                    new_command.Connection = new_connection;
                    new_command.CommandText = "INSERT INTO Topic_Group_tbl(Topic_Group) VALUES ('" + TextBox_Topic.Text.Trim() + "')";
                    new_command.ExecuteNonQuery();
                    Literal_Topic.Text = "درج موضوع جدید با موفقیت انجام شد.";
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
            else
            {
                Literal_Topic.Text = "لطفا موضوع مورد نظر خود را وارد کنید.";
            }
        }

      

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            Image IMG = (Image)e.Item.FindControl("Image_Group");
            if (IMG != null)
            {
                if (IMG.ImageUrl == string.Empty)
                    IMG.ImageUrl = "~/Admin_Site/Image/no_image.png";
            }
        }

        protected void DataList2_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            Image IMG = (Image)e.Item.FindControl("Image_user");
            if (IMG != null)
            {
                if (IMG.ImageUrl == string.Empty)
                    IMG.ImageUrl = "~/Admin_Site/Image/no_image.png";
            }
        }
    }
}