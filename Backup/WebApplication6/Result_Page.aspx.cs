using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication6
{
    public partial class Result_Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            string _State;
            _State = Request.QueryString["add"].ToString();
            if (_State == "1")
            {
                Literal_Result.Text = "ثبت نام با موفقیت انجام شد.";
                btn_Login.Visible = true;
            }
            else if (_State == "0")
            {
                Literal_Result.Text = "فرآیند ثبت نام با مشکل رو برو شده است .";
                btn_Return_try.Visible = true;
            }
            else
                Literal_Result.Text = Request.QueryString["add"].ToString(); ;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }

        protected void btn_Return_try_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/signup.aspx");
        }

        protected void btn_Login_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/login.aspx");

        }
    }
}