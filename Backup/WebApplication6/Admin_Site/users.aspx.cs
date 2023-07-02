using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication6.Admin_Site
{
    public partial class users : System.Web.UI.Page
    {
        string _mode;
        string _Email_address;
        static string _Email_address_2;
        string _id;
        string _From_Mail_address;
        Date_Convert English_Persian = new Date_Convert();
        SqlCommand new_command = new SqlCommand();
        SqlConnection new_connection = new SqlConnection();
        Cloop_class Connection_str = new Cloop_class();
        SqlDataReader DR;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] == null)
            {
                Response.Redirect("~/Default.aspx?mode=exit");
                return;
            }

                _mode = Request.QueryString["mode"];
                _Email_address = Request.QueryString["mailaddress"];
                if (_mode == "contact")
                {
                    MultiView_users.ActiveViewIndex = 1;
                    TextBox_Email_Address.Text = _Email_address;
                    new_connection.ConnectionString = Connection_str.ConnectionString;
                    new_connection.Open();
                    new_command.CommandText = "SELECT  Email FROM Admins_tbl";
                    new_command.Connection = new_connection;
                    DR = new_command.ExecuteReader();
                    DR.Read();
                    _From_Mail_address = DR[0].ToString();
                    DR.Close();
                    new_connection.Close();
                    if (_Email_address == null)
                        TextBox_Email_Address.Text = _Email_address_2;
                }
                if (_mode == "info")
                {
                    _id = Request.QueryString["id"];
                    new_connection.ConnectionString = Connection_str.ConnectionString;
                    new_connection.Open();
                    new_command.CommandText = "SELECT Name,Family, Account_name,Sex_User,Birth_date,City_born,Education,Ostan,Mager,College_Name,State_Education,Job_user,Telephone,City_live,Favorites_user,E_mail,Discreption_User,Din,User_pic FROM User_tbl WHERE ID= '" + _id + "'";
                    new_command.Connection = new_connection;
                    DR = new_command.ExecuteReader();
                    DR.Read();
                    label_name.Text = DR[0].ToString();
                    Label_family.Text = DR[1].ToString();
                    Label_Accountname.Text = DR[2].ToString();
                    if ((bool)DR[3])
                        Label_sex.Text = "زن";
                    else
                        Label_sex.Text= "مرد";
                    Label_date_birth.Text =English_Persian.C_Date_en_to_fa(DR[4].ToString());
                    Label_City_birth.Text = DR[5].ToString();
                    Label_Education.Text = DR[6].ToString();
                    Label_Ostan.Text = DR[7].ToString();
                    Label_Mager.Text = DR[8].ToString();
                    Label_Univercity.Text = DR[9].ToString();
                    Label_State_Education.Text = DR[10].ToString();
                    Label_Job.Text = DR[11].ToString();
                    Label_Tele.Text = DR[12].ToString();
                    Label_City_Live.Text = DR[13].ToString();
                    Label_favorites.Text = DR[14].ToString();
                    Label_Email.Text = DR[15].ToString();
                    Label_Description.Text = DR[16].ToString();
                    Label_Din.Text = DR[17].ToString();
                    Image_Info.ImageUrl = DR[18].ToString();
                    DR.Close();
                    new_connection.Close();
                    MultiView_users.ActiveViewIndex = 2;

                }
                _Email_address_2 = _Email_address;
           
        }

        protected void ImageButton_Send_Email_Click(object sender, ImageClickEventArgs e)
        {
            string _Error;
            MailMessage new_message = new MailMessage();
            SmtpClient new_smtp = new SmtpClient();
            new_message.Subject = TextBox_Topic_message.Text;
            new_message.Body = TextBox_Body_Message.Text;
            new_message.To.Add( TextBox_Email_Address.Text.Trim());
            new_message.IsBodyHtml = false;
            new_smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            if (ConfigurationManager.AppSettings["Email"].ToString()!= null)
            {
                new_message.From =new MailAddress(ConfigurationManager.AppSettings["Email"].ToString());
                try
                {
                    new_smtp.Send(new_message);
                    Literal_Mail.Text = "ایمیل شما با موفقیت ارسال شد.";
                }
                catch (Exception er)
                {
                    _Error = er.Message.ToString();
                    Literal_Mail.Text = "ایمیل شما ارسال نشد." + "\n" + er.ToString();
                    throw;
                }
            }
            else
            {
                Literal_Mail.Text = "مدیر گرامی آدرس ایمیل شما تعیین نشده است،در صورتی که می خواهید با کاربران عضو این سایت ارتباط داشته باشید آن را تعیین کنید.";

            }
        }

        protected void Repeater_users_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Image IMG =(Image) e.Item.FindControl("Image_user");
            if (IMG != null )
            {
                if(IMG.ImageUrl == string.Empty)
                IMG.ImageUrl = "/Admin_Site/Image/no_image.png";
            }
        }
    }
}