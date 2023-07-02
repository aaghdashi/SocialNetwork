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
    public partial class Users_post : System.Web.UI.Page
    {
        public int _id;
        public string _mode;
        public static string _post_id;
        public Cloop_class New_user = new Cloop_class();
        public Make_Post new_post = new Make_Post();
        SqlConnection new_connection = new SqlConnection();
        SqlCommand new_command = new SqlCommand();
        SqlDataReader DR;
        public static List<string> _Filter = new List<string>();


        public void Edit_Post(string post_id)
        {
            int _state;
            string _command;


            for (int i = 0; i <= _Filter.Count - 1; i++)
            {
                TextBox_edit_topic.Text.Replace(_Filter[i], "****");
                TextBox_edit_body_post.Text = TextBox_edit_body_post.Text.Replace(_Filter[i], "****");
            }
            _command = "UPDATE Post_Users_tbl SET Title='" + TextBox_edit_topic.Text + "',Body='" + TextBox_edit_body_post.Text + "',DT_Create='" + DateTime.Now.ToString() + "' WHERE ID='" + _post_id + "'";
            _state = new_post.Edit_Post(_command);
            if (_state == 1)
            {
                Literal_Edit_Post.Text = "پست شما با موفقت ویرایش شد.";
                System.Threading.Thread.Sleep(200);
                MultiView_Post.ActiveViewIndex = 0;
            }
            else if (_state == 0)
            {
                Literal_Edit_Post.Text = "پست شما ویرایش نشد،لطفادوباره سعی به ویرایش پست کنید.";
                Response.Redirect(Request.Url.AbsoluteUri);
            }
        }

        public void Filter_Post()
        {
            _Filter.Clear();
            new_connection.ConnectionString = New_user.ConnectionString;
            new_connection.Open();
            new_command.Connection = new_connection;
            new_command.CommandText = "SELECT DISTINCT Key_Word FROM Filter_Word_tbl";
            DR = new_command.ExecuteReader();
            while (DR.Read())
            {
                _Filter.Add(DR[0].ToString());
            }
            DR.Close();
            new_connection.Close();
        }
        public void Delete_Post(string post_id)
        {
            int _state;
            string _command;
            _command = "DELETE FROM Post_Users_tbl  WHERE ID='" + _post_id + "' AND ID_User='" + _id + "'";
            _state = new_post.Delete_Post(_command);
            if (_state == 1)
            {
                System.Threading.Thread.Sleep(200);

            }
            else if (_state == 0)
            {
                Response.Redirect(Request.Url.AbsoluteUri);
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            _id = (int)Session["id_user"];

            if (_id == null)
            {
                Response.Redirect("Error_Page.aspx?Error=0");
                return;
            }
            if (!Page.IsPostBack)
            {
                _post_id = Request.QueryString["ID"];
                _mode = Request.QueryString["mode"];
                Filter_Post();

                if (_mode == "Edit")
                {
                    MultiView_Post.ActiveViewIndex = 1;
                    new_connection.ConnectionString = New_user.ConnectionString;
                    new_connection.Open();
                    new_command.Connection = new_connection;
                    new_command.CommandText = "SELECT Title,Body FROM Post_Users_tbl WHERE ID='" + _post_id + "' AND ID_User='" + _id + "'";
                    DR = new_command.ExecuteReader();
                    DR.Read();
                    TextBox_edit_topic.Text = DR[0].ToString();
                    TextBox_edit_body_post.Text = DR[1].ToString();
                    DR.Close();
                    new_connection.Close();
                    _mode = "";
                }
                if (_mode == "Delete")
                {
                    MultiView_Post.ActiveViewIndex = 2;
                    Delete_Post(_post_id);
                }
                if (_mode == null)
                {
                    MultiView_Post.ActiveViewIndex = 0;
                }
                _mode = "";
            }

        }

        protected void Button_Add_Post_Click(object sender, EventArgs e)
        {
            int _state;
            string _command;

            for (int i = 0; i <= _Filter.Count - 1; i++)
            {
                TextBox_Topic.Text = TextBox_Topic.Text.Replace(_Filter[i], "****");
                TextBox_Body.Text = TextBox_Body.Text.Replace(_Filter[i], "****");
            }
            _command = "INSERT INTO Post_Users_tbl(ID_User,Title,Body,DT_Create) VALUES('" + _id + "','" + TextBox_Topic.Text.Trim() + "','" + TextBox_Body.Text.Trim() + "','" + DateTime.Now.ToString() + "')";
            _state = new_post.Create_Post(_command);
            if (_state == 1)
            {
                Response.Redirect(Request.Url.AbsoluteUri);
                MultiView_Post.ActiveViewIndex = 0;
                Literal_add_post.Text = "پست شما با موفقت افزوده شد.";
            }
            else if (_state == 0)
            {
                Literal_add_post.Text = "پست شما درج نشد،لطفادوباره سعی به درج پست کنید.";
            }
            TextBox_Topic.Text = "";
            TextBox_Body.Text = "";
        }

        protected void Button_Edit_Post_Click(object sender, EventArgs e)
        {
            Edit_Post(_post_id);
        }

        protected void Button_Cancel_Edit_Click(object sender, EventArgs e)
        {
            TextBox_edit_topic.Text = "";
            TextBox_edit_body_post.Text = "";
            MultiView_Post.ActiveViewIndex = 0;
        }

        protected void Button_Cancel_Post_Click(object sender, EventArgs e)
        {
            TextBox_Topic.Text = "";
            TextBox_Body.Text = "";
        }

        protected void Button_Return_Click(object sender, EventArgs e)
        {
            MultiView_Post.ActiveViewIndex = 0;
        }

        protected void Repeater_post_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Label lbl1 = (Label)e.Item.FindControl("lbl_date");
            if (lbl1 != null)
            {
                Date_Convert dt = new Date_Convert();
                lbl1.Text = dt.C_Date_en_to_fa(lbl1.Text);
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
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