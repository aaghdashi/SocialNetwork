using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication6
{
    public partial class Error_Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string _error;
            _error = Request.QueryString["Error"].ToString();
            Literal_Result.Text = _error;
            if (_error == "5")
            {
                btn_Login_Return.Enabled = false;
                btn_Login_Return.Visible = false;
                Literal_Result.Text = "کاربر گرامی شما مجوز دسترسی به اطلاعات این کاربر را ندارید";
            }
            if (_error == "0")
            {
                btn_Login_Return.Enabled = false;
                btn_Login_Return.Visible = false;
                Literal_Result.Text = "کاربر گرامی جلسه کاری شما منقضی شده است ،برای ادامه کار خود بایستی مجددا رمز عبور و نام کاربری خود را وارد کنید.";
            }
        }

        protected void btn_Login_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/login.aspx");
        }

        protected void Button_Return_Click(object sender, EventArgs e)
        {
            Response.Redirect("search_user.aspx");
        }

        protected void Button_Return_Home_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

      
    }
}