using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.CodeDom.Compiler;
namespace WebApplication6.Groups
{
    public partial class Admins_master : System.Web.UI.MasterPage
    {
        public Cloop_class New_Login = new Cloop_class();
       
        protected void Page_Load(object sender, EventArgs e)
        {
            int _id;
            SqlCommand new_command = new SqlCommand();
            SqlDataReader DR;
            string str_day, str_year, str_month;
            PersianCalendar pc = new PersianCalendar();

            _id = (int)Session["id_group"];
            if(_id==null)
            {
                Response.Redirect("Error_Page.aspx?Error=0");
                return;
            }
            New_Login.Connection_DB.ConnectionString = New_Login.ConnectionString;
            New_Login.Connection_DB.Open();
            new_command.CommandText = "SELECT Group_tbl.Name_Group,CASE WHEN Group_tbl.ID_Creator = User_tbl.ID THEN User_tbl.Name + ' ' + User_tbl.Family END AS ADMIN, Group_tbl.Date_Create,Group_tbl.Pic_Group FROM Group_tbl INNER JOIN User_tbl ON Group_tbl.ID_Creator = User_tbl.ID WHERE Group_tbl.ID = '" + _id + "'";
            new_command.Connection = New_Login.Connection_DB;
            DR = new_command.ExecuteReader();
            if (DR.HasRows)
            {
                DR.Read();
                Label_name.Text = DR[0].ToString();
                Label_admin.Text = DR[1].ToString();
                str_year = pc.GetYear((DateTime)DR[2]).ToString();
                str_day = pc.GetDayOfMonth((DateTime)DR[2]).ToString();
                str_month = pc.GetMonth((DateTime)DR[2]).ToString();
                Label_Create_date.Text = str_year + "/" + str_month + "/" + str_day;
                Img_User.ImageUrl = DR[3].ToString();
                Label_online_user.Text = Application["Online_User"].ToString();
                DR.Close();
            }
            Label_Date_equal.Text = DateTime.Now.Date.ToShortDateString();
            str_year = pc.GetYear(DateTime.Now.Date).ToString();
            str_day = pc.GetDayOfMonth(DateTime.Now.Date).ToString();
            str_month = pc.GetMonth(DateTime.Now.Date).ToString();
            Label_Date.Text = str_year + "/" + str_month + "/" + str_day;
            New_Login.Connection_DB.Close();

            New_Login.Connection_DB.Open();
            new_command.CommandText = "SELECT COUNT(Member_Group_tbl.ID) AS Expr1 FROM Member_Group_tbl WHERE Member_Group_tbl.ID_Group='" + _id + "'";
            new_command.Connection = New_Login.Connection_DB;
            DR = new_command.ExecuteReader();
            if (DR.HasRows)
            {
                DR.Read();
                Label_Count_User.Text = DR[0].ToString();
                DR.Close();
            }
            New_Login.Connection_DB.Close();
        }

        protected void Img_btn_Member_Group_exit_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Default.aspx");
            Session.Remove("id_group");
            Session.RemoveAll();
        }

        protected void Img_btn_Member_Group_request_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Request_User.aspx");
        }

        protected void Img_btn_Member_Group_Edit_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Edit_info.aspx");
        }

        protected void Img_btn_Member_Group_Search_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Search_member.aspx");
        }

        protected void Img_btn_Member_Group_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Membership_Gruop.aspx");
        }

        protected void LinkButton_Exit_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx?mode=exit");
            Session.RemoveAll();
        }

       
    }
}