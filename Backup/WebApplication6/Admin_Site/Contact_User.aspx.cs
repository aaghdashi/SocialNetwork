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
    public partial class Contact_User : System.Web.UI.Page
    {
        string _From_Mail_address;
        SqlCommand new_command = new SqlCommand();
        SqlConnection new_connection = new SqlConnection();
        Cloop_class Connection_str = new Cloop_class();
        SqlDataReader DR;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                
                    new_connection.ConnectionString = Connection_str.ConnectionString;
                    new_connection.Open();
                    new_command.CommandText = "SELECT  Email FROM Admins_tbl";
                    new_command.Connection = new_connection;
                    DR = new_command.ExecuteReader();
                    DR.Read();
                    _From_Mail_address = DR[0].ToString();
                    DR.Close();
                    new_connection.Close();
               
            }
            if (Session["ID"] == null)
            {
                Response.Redirect("~/Default.aspx?mode=exit");
                return;
            }
        }

        protected void ImageButton_Send_Email_Click(object sender, ImageClickEventArgs e)
        {
            string _Error;
            MailMessage _New_mail = new MailMessage();
            string fromEmail = ConfigurationManager.AppSettings["Email"].ToString();
            _New_mail.From = new MailAddress(fromEmail); 
            _New_mail.Subject = TextBox_Topic_message.Text;
            _New_mail.Body = TextBox_Body_Message.Text;
            _New_mail.To.Add(TextBox_Email_Address.Text.Trim());
            _New_mail.IsBodyHtml = false;
            SmtpClient _smtp = new SmtpClient();
                 
            _smtp.DeliveryMethod = SmtpDeliveryMethod.Network;

            if (fromEmail != null)
            {
                _smtp.Credentials = new System.Net.NetworkCredential(_From_Mail_address, "890711748");
                _smtp.Port = 465;
                _smtp.Host = "smtp.gmail.com";
                _smtp.EnableSsl = true;
                _New_mail.From = new MailAddress(fromEmail);
                try
                {
                    _smtp.Send(_New_mail);
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

        protected void GridView_Contact_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBox_Email_Address.Text = GridView_Contact.SelectedRow.Cells[3].Text.ToString();
        }
    }
}