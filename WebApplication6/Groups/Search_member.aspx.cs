using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using PersianCalendarVB;
namespace WebApplication6.Groups
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        public Cloop_class New_user = new Cloop_class();
        DataSet DS = new DataSet();      
       
      
        string[] _Criteria = new string[10];
        string Criter;
        bool _sex;
        Date_Convert persian_English = new Date_Convert();
        string[] member_date = new string[2];
        string[] _age = new string[2];


        public int _id;
        public int _id_Group;

        SqlConnection new_connection = new SqlConnection();
        SqlCommand new_command = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            MultiView_Search_Member.ActiveViewIndex = 0;
            _id =(int) Session["id_group"];
        }



        protected void ImageButton_Search_Click(object sender, ImageClickEventArgs e)
        {        
           
            SqlConnection new_connection = new SqlConnection();
            new_connection.ConnectionString = New_user.ConnectionString;
            SqlCommand new_command = new SqlCommand();

             string _command = "";

             _command = "SELECT DISTINCT User_tbl.ID,User_tbl.User_pic,User_tbl.Name, User_tbl.Family , Member_Group_tbl.Date_member, User_tbl.Account_name , CASE WHEN User_tbl.Sex_User = 1 THEN 'زن' WHEN User_tbl.Sex_User =0 THEN 'مرد' END AS 'Gender' FROM User_tbl INNER JOIN Member_Group_tbl ON User_tbl.ID = Member_Group_tbl.ID_User   WHERE Member_Group_tbl.ID_Group='"+_id+"' ";

            _Criteria[0] = TextBox_name.Text.Trim() != "" ? " AND (Name like '%" + TextBox_name.Text.Trim() + "%')" : "";
            _Criteria[1] = TextBox_family.Text.Trim() != "" ? " AND (Family like '%" + TextBox_family.Text.Trim() + "%')" : "";
            _Criteria[2] = TextBox_name_Account.Text.Trim() != "" ? " AND (Account_name like '%" + TextBox_name_Account.Text.Trim() + "%')" : "";
            _Criteria[3] = TextBox_City_Live.Text.Trim() != "" ? " AND (City_live Like '%" + TextBox_City_Live.Text.Trim() + "%')" : "";
            
            if (DropDownList_Gender.SelectedValue == "0")
                _sex = false;
            else if (DropDownList_Gender.SelectedValue == "1")
                _sex = true;
            _Criteria[4] = " AND (User_tbl.Sex_User='" + _sex + "')";

            if (DropDownList_Gender.SelectedValue == "-1")
                _Criteria[4] = "";
            
            _Criteria[5] = TextBox_Member_Date1.Text !="" ? " AND User_tbl.Date_m >= '" + persian_English.C_Date_fa_to_en(TextBox_Member_Date1.Text) + "'"  : "";
            _Criteria[6] = TextBox_Member_Date2.Text != "" ? " AND User_tbl.Date_m <= '" + persian_English.C_Date_fa_to_en(TextBox_Member_Date2.Text) + "'" : "";
            
           
            _age[0] =TextBox_Age_Date2.Text.Trim();
            _age[1] = TextBox_Age_Date2.Text.Trim();
            _Criteria[7] = TextBox_Age_Date1.Text != "" ? " AND DATEDIFF(YY,User_tbl.Birth_date,GETDATE()) >= '" + TextBox_Age_Date1.Text + "'" : "";
            _Criteria[8] = TextBox_Age_Date2.Text != "" ? " AND DATEDIFF(YY,User_tbl.Birth_date,GETDATE()) <= '" + TextBox_Age_Date2.Text + "'" : "";
            
           
            Criter = "";
            for (int i = 0; i < _Criteria.Length - 1; i++)
            {
                Criter += _Criteria[i];
            }
            try
            {
                new_command.Connection = new_connection;
                new_connection.Open();
                new_command.CommandText = _command + " " + Criter ;
                SqlDataAdapter new_adapter = new SqlDataAdapter(new_command);
                DS.Clear();
                new_command.ExecuteNonQuery();
                new_adapter.Fill(DS);
                Gridview_Search.DataSource = DS.Tables[0];
                Gridview_Search.DataBind();
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

          
        

        protected void Gridview_Search_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Session["Info_user"] = Gridview_Search.SelectedValue;
            //Response.Redirect("~/Users/View_Info_User.aspx");

            try
            {

                new_connection.ConnectionString = New_user.ConnectionString;
                new_connection.Open();
                new_command.Connection = new_connection;
                new_command.CommandText = "DELETE FROM Member_Group_tbl WHERE (ID_Group='" + _id_Group + "') AND (ID_User='" + Gridview_Search.SelectedValue.ToString() + "') ";
                new_command.ExecuteNonQuery();
            }
            catch
            { }
            finally
            {
                new_connection.Close();
            }
        }

        protected void Gridview_Search_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            Label lbl1 = (Label)e.Row.FindControl("Label_Date");
            if (lbl1 != null)
            {
                Date_Convert dt = new Date_Convert();
                lbl1.Text = dt.C_Date_en_to_fa(lbl1.Text);
            }
        }

       
    }
}