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
    public partial class Search_Users : System.Web.UI.Page
    {
        Cloop_class new_str_con = new Cloop_class();
        SqlConnection new_Connection = new SqlConnection();
        SqlCommand new_command = new SqlCommand();
        DataSet DS=new DataSet();
        
        string[] _Criteria=new string[8];
        string Criter;
        bool _sex;
        Date_Convert persian_English = new Date_Convert();
        string[] member_date = new string[2];
        int[] _age = new int[2];

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] == null)
            {
                Response.Redirect("~/Default.aspx?mode=exit");
                return;
            }
        }

       

        protected void GridView_Result_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            Label lbl1 = (Label)e.Row.FindControl("lbl_date");
            if (lbl1 != null)
            {
                Date_Convert dt = new Date_Convert();
                lbl1.Text = dt.C_Date_en_to_fa(lbl1.Text);
            }
        }


        protected void Button_Search_Click(object sender, EventArgs e)
        {
            string _command = "";
            new_Connection.ConnectionString = new_str_con.ConnectionString;
            new_Connection.Open();

            _command = "SELECT date_m,User_tbl.ID, User_tbl.Name , User_tbl.Family, User_tbl.Account_name , CASE WHEN User_tbl.Sex_User = 1 THEN 'زن' WHEN User_tbl.Sex_User = 0 THEN 'مرد' END as 'Sex_User', User_tbl.User_pic FROM  User_tbl WHERE 1=1 ";

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
            
            _Criteria[5] = DatePicker1.Text !="" ? " AND User_tbl.Date_m >= '" + DatePicker1.Date.Value.ToString() + "'"  : "";
            _Criteria[6] = DatePicker2.Text != "" ? " AND User_tbl.Date_m <= '" + DatePicker2.Date.Value.ToString() + "'" : "";
            
            
            Criter = "";
            for (int i = 0; i < _Criteria.Length - 1; i++)
            {
                Criter += _Criteria[i];
            }
            try
            {
                new_command.Connection = new_Connection;
                new_command.CommandText = _command + " " + Criter ;
                SqlDataAdapter new_adapter = new SqlDataAdapter(new_command);
                DS.Clear();
                new_command.ExecuteNonQuery();
                new_adapter.Fill(DS);
                GridView_Result.DataSource = DS.Tables[0];
                GridView_Result.DataBind();
            }
            catch
            {
                throw;
            }
            finally
            {
                new_Connection.Close();
            }
        }

       
    }
}