using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
 
namespace WebApplication6
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Img_btn_Suggest_send_Click(object sender, ImageClickEventArgs e)
        {

           Cloop_class Connection = new Cloop_class();
           SqlConnection new_connection=new SqlConnection();
           Boolean _Contact_State = false;
           new_connection.ConnectionString = Connection.ConnectionString;
           new_connection.Open();
            
            SqlCommand new_command=new SqlCommand();
            new_command.Connection=new_connection;
            try
            {
                string _str = "INSERT INTO Suggest_tbl(E_mail,Name,Telephone,Subject,Body) VALUES('" + txt_Email.Text.Trim() + "','" + txt_lfname.Text.Trim() + "','" + txt_phone.Text.Trim() + "','" + txt_subject.Text.Trim() + "','" + txt_memo.Text.Trim() + "')";
                new_command.CommandText = _str;
                new_command.ExecuteNonQuery();
                _Contact_State = true;
            }
            
            catch(Exception er)
            {
                _Contact_State = false;
                Response.Write(er.Message.ToString());
            }

            finally
            {
                if(_Contact_State)
                {
                   Literal_Contact.Text="پیام با موفقیت ارسال شد.";
                }
                else
	            {
                Literal_Contact.Text="پیام با موفقیت ارسال نشد.";                   
                }
                
                new_connection.Close();
            }
        }


    }
}