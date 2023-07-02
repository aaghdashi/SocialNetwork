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
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ( Session["ID"]==null)
            {
                Response.Redirect("~/Default.aspx?mode=exit");
                return;
            }
        }

        protected void ImageButton_Exit_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Default.aspx?mode=exit");
            Session.RemoveAll();
        }

        protected void ImageButton_Contact_User_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Admin_Site/Contact_User.aspx");
        }

        protected void ImageButton_Notes_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Admin_Site/Nots.aspx");
        }

        protected void ImageButton_Create_New_Admin_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Admin_Site/Create_New_Admin.aspx");
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Admin_Site/Filter_Word.aspx");

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Admin_Site/users.aspx");
        }

        protected void LinkButton_Exit_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx?mode=exit");

        }

        protected void ImageButton_Search_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect(" ~/Admin_Site/Search_Users.aspx");
        }

        protected void ImageButton_Group_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect(" ~/Admin_Site/Show_Group.aspx");
        }
    }
}