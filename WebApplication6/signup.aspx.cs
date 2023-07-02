using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication6
{
    public partial class WebForm8 : System.Web.UI.Page
    {

        Cloop_class New_user = new Cloop_class();

        #region Variables
        Boolean _sex_user=false;
        string _birthDate;
        Date_Convert _dateConvert = new Date_Convert();
        public static string _resamble_captch = "";
        public static string _Password;

        public bool _checkEmail;
        public bool _checkAccount;

        #endregion Variables

        public SqlConnection new_connection = new SqlConnection();
        SqlCommand new_command = new SqlCommand();
        public DataSet DS = new DataSet();
        /// <summary>
        /// check selected file for upload
        /// </summary>
        /// <returns></returns>
        /// 
       
  
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {         
                mvw_Signup.ActiveViewIndex = 0;
                lbl_captcha.Text = New_user.Captcha();
                _resamble_captch = New_user.Captcha_Test.ToString();
            }
        }



        public void CheckAccount()
        {
           
            new_connection.ConnectionString = New_user.ConnectionString;
            new_connection.Open();
            new_command.Connection = new_connection;
            SqlDataReader DR;
            new_command.CommandText = "SELECT Account_name FROM User_tbl WHERE  Account_name= '" + nameaccount.Text + "' ";
            DR = new_command.ExecuteReader();

            if (DR.HasRows)
            {
                DR.Close();
                Literal_check.Visible = true;
                Literal_check.Text += "<br /><span style=" + "color:red;" + ">این نام کاربری قبلا انتخاب شده است</span>.";
                _checkAccount = true;
            }
            else
            {
                _checkAccount = false;
                Literal_check.Visible = false;
            }
            
            new_connection.Close();
           
        }

        public void CheckEmail()
        {

            new_connection.ConnectionString = New_user.ConnectionString;
            new_connection.Open();
            new_command.Connection = new_connection;
            SqlDataReader DR;
            new_command.CommandText = "SELECT E_mail FROM User_tbl WHERE  E_mail= '" + txt_Email_signup.Text + "' ";
            DR = new_command.ExecuteReader();

            if (DR.HasRows)
            {
                DR.Close();
                Literal_check.Visible = true;
                Literal_check.Text += "<br /><span style="+"color:red;"+">این ایمیل قبلا وارد شده است</span>.";
                _checkEmail = true;
            }
            else
            {
                _checkEmail = false;
                Literal_check.Visible = false;
            }

            new_connection.Close();
           
        }
        protected void btn_submit_rules_Click(object sender, EventArgs e)
        {
            mvw_Signup.ActiveViewIndex = 1;
        }

        protected void lkb_previous1_Click(object sender, EventArgs e)
        {
            mvw_Signup.ActiveViewIndex = 0;
        }

        protected void lkb_forward1_Click(object sender, EventArgs e)
        {
            _Password = txt_password_signup.Text;

            Literal_check.Text = "";

            CheckEmail();
            CheckAccount();


            if (_checkAccount == false && _checkEmail==false)
            {

                if (ckb_Complete_Info.Checked)
                {
                    Literal_check.Visible = false;
                    mvw_Signup.ActiveViewIndex = 2;
                }
                else
                {
                    Literal_check.Visible=false;

                    mvw_Signup.ActiveViewIndex = 3;
                }
            }
        }

        protected void lkb_previous2_Click(object sender, EventArgs e)
        {
            mvw_Signup.ActiveViewIndex = 1;
        }

        protected void lkb_forward2_Click(object sender, EventArgs e)
        {
           
                mvw_Signup.ActiveViewIndex = 3;
             
               
          
        }
        protected void btn_submit_final_Singup_Click(object sender, EventArgs e)
        {
            DateTime _Date_member;           
            _Date_member=DateTime.Now.Date;
            switch (ddl_sex_signup.SelectedValue.ToString())
            {
                case "true":
                    _sex_user = true;
                    break;
                case "false":
                    _sex_user = false;
                    break;               
            }
            if (DatePicker1.DatePersian != null)
                _birthDate = DatePicker1.Date.Value.ToString();

            String _Field_Sign_up_User = "(Name,Family, Account_name,Password,Sex_User,Birth_date,E_mail,Mager,Telephone,City_born,City_live,Ostan,Education,College_Name,Job_user,Discreption_User,Date_m,Favorites_user,Din,State_Education)";
            String _Main_Sign_up_User = "INSERT INTO User_tbl" + _Field_Sign_up_User + " VALUES('" + txt_name_signup.Text.Trim() + "','" + txt_family_signup.Text.Trim() + "', '" + nameaccount.Text.Trim() + "','" + _Password.Trim() + "','" + _sex_user + "','" + _birthDate + "','" + txt_Email_signup.Text.Trim() + "','" + txt_Mager_signup.Text.Trim() + "','" + txt_Telephone_signup.Text.Trim() + "','" + txt_Cityborn_signup.Text.Trim() + "','" + txt_Citylive_signup.Text.Trim() + "','" + txt_Ostan_signup.Text.Trim() + "','" + ddl_Education_Sign.Text.Trim() + "','" + txt_Collegename_signup.Text.Trim() + "','" + txt_Jobuser_signup.Text.Trim() + "' ,'" + txt_Discreption_signup.Text.Trim() + "','" + _Date_member.ToShortDateString() + "','" + txt_Favoretis_Search.Text.Trim() + "','" + txt_Din_signup.Text.Trim() + "','" + ddl_Education_State_Signup.Text.Trim() + "')";

            New_user.SignUp_User(_Main_Sign_up_User);
            if ((string.Compare(txt_cptcha.Text.ToString() ,_resamble_captch.ToString(),true ))==0)
            {            
                if (New_user.user_add_State == 1)
                {
                  Response.Redirect("Result_Page.aspx?add=1"); 
                }
                if (New_user.user_add_State == 0)
                {
                    Response.Redirect("Result_Page.aspx?add=0");
                }
            }

            else
            {
           Response.Redirect("Result_Page.aspx?add=متن امنیتی به درستی وارد نشده است.");
         }
        }


                  
    }
}