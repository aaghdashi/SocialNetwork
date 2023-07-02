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
    public partial class User_BlockList : System.Web.UI.Page
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

        protected void ImageButton_ListFriend_Click(object sender, ImageClickEventArgs e)
        {
            MultiView_Friends.ActiveViewIndex=0;
        }

        protected void ImageButton_BlockList_Click(object sender, ImageClickEventArgs e)
        {
            MultiView_Friends.ActiveViewIndex=1;
        }

        protected void LinkButton_ListFriend_Click(object sender, EventArgs e)
        {
        MultiView_Friends.ActiveViewIndex=0;
        }

        protected void LinkButton_BlockList_Click(object sender, EventArgs e)
        {
        MultiView_Friends.ActiveViewIndex=1;
        }

        protected void GridView_Show_Friend_SelectedIndexChanged(object sender, EventArgs e)
        {
            new_connection.ConnectionString = New_user.ConnectionString;
            new_connection.Open();
            new_command.Connection = new_connection;
            try
            {
                new_command.CommandText = "UPDATE Request_Friend_tbl SET Request_Friend_tbl.Block='true' WHERE (Response_User_ID='" + _id + "' AND Request_User_ID='" + GridView_Show_Friend.SelectedValue.ToString() + "') OR (Request_User_ID='" + _id + "' AND Response_User_ID='" + GridView_Show_Friend.SelectedValue.ToString() + "')";
                new_command.ExecuteNonQuery();
                Literal_State_Friend.Text = "عملیات با موفقیت انجام شد.";
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

        protected void GridView_Edit_Friend_SelectedIndexChanged(object sender, EventArgs e)
        {
            new_connection.ConnectionString = New_user.ConnectionString;
            new_connection.Open();
            new_command.Connection = new_connection;
            try
            {
                new_command.CommandText = "UPDATE Request_Friend_tbl SET Request_Friend_tbl.Block='false' WHERE (Response_User_ID='" + _id + "' AND Request_User_ID='" + GridView_Edit_Friend.SelectedValue.ToString() + "') OR (Request_User_ID='" + _id + "' AND Response_User_ID='" + GridView_Edit_Friend.SelectedValue.ToString() + "')";
                new_command.ExecuteNonQuery();
                Literal_unblock.Text = "عملیات با موفقیت انجام شد.";
            }
            catch
            {
                throw;
                Literal_unblock.Text = "انجام عملیات با مشکل روبرو شده است.";
            }
            finally
            {
                new_connection.Close();
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
