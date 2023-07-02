    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Data;
    using System.Data.SqlClient;
    using System.Configuration;

    namespace WebApplication6
    {
    public  class Cloop_class
    {
               

    #region field
        public SqlConnection Connection_DB=new SqlConnection();
        protected string User_NameAccount;
        protected string User_Password;
        public int user_add_State = 0;
        protected string Header_text_Default;
        protected string Body_text_default;
        protected string _Allcahr = "QWERTYUIOPLKJHGFDSAZXCVBNMqwertyuioplkjhgfdsazxcvbnm1234567890";
        protected static string _Captcha_text;
        public string _Select_Info;
        string _Result_string;
        DataSet DS;
        public int _State_login = 0;
    #region User_Field

        protected static int _id=0;
        protected static string _name_user="";
        protected static string _family="";
        protected static string _name_account="";
        protected static DateTime _date_member;
        protected static int _count_friend=0;
        protected static int _id_Group = 0;
    #endregion User_Field

    #endregion field

        /// <summary>
        /// Constracotr
        /// </summary>
        public  Cloop_class()
        {
            Connection_DB.ConnectionString = ConfigurationManager.ConnectionStrings["Social_db"].ConnectionString; 
        }
    
        /// <summary>
        /// get Connecton string from Web.config
        /// </summary>
        public  string ConnectionString
        {

            get

                
            { 
                return ConfigurationManager.ConnectionStrings["Social_db"].ConnectionString; }
            }

    #region method

         /// <summary>
        /// Sign up User  
        /// </summary>
        /// <param name="_Add_User"></param>

        public void SignUp_User(string _Add_User)
        {
            try
            {
                Connection_DB.Open();
                SqlCommand new_command = new SqlCommand();
                new_command.Connection = Connection_DB;
                new_command.CommandText = _Add_User;
                new_command.ExecuteNonQuery();
                user_add_State = 1;
            }
            catch 
            {
                user_add_State = 0;
            }
            finally
            {
                Connection_DB.Close();
            }
        }

        /// <summary>
        /// Search User Account 
        /// </summary>
        /// <param name="_Search_str"></param>
        /// <returns></returns>

        public DataSet  Search_User(string _Search_str)
        
        { 
            DataSet Ds = new DataSet();

            try
            {
                Connection_DB.Open();
                SqlCommand new_command = new SqlCommand();
                new_command.Connection = Connection_DB;
                new_command.CommandText = _Search_str ;
                SqlDataAdapter new_adapter = new SqlDataAdapter(new_command);
                new_adapter.Fill(Ds); 
               
            }

            catch
            {
                throw;
            }
              

            finally
            {
                Connection_DB.Close();
            }
            return Ds;

        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="_SignIn_User_str"></param>
        /// <returns>check the User info for Sign_in </returns>

        public void SignIn_User(string _SignIn_User_str)
        {
           SqlDataReader DR;
            try
            {
                if (Connection_DB.State != ConnectionState.Open)
                {
                    Connection_DB.Open();
                }
                SqlCommand new_command = new SqlCommand();
                new_command.Connection = Connection_DB;
                new_command.CommandText = _SignIn_User_str;
                DR = new_command.ExecuteReader();
                DR.Read();
                _id =Convert.ToInt32( DR[0]);
                if (DR.FieldCount == 2)
                {
                    _id_Group = Convert.ToInt32(DR[1]);
                }
                if (DR.HasRows)
                {
                    _State_login = 1;
                    DR.Close();
                }
            }

            catch
            {
            }

            finally
            {
                Connection_DB.Close();
            }

        }
        /// <summary>
        /// get user information 
        /// </summary>
        /// <param name="ID"></param>
        public void SignIn_Information(int ID)
        {
            SqlDataReader DR;

            Connection_DB.Open();
            SqlCommand new_command = new SqlCommand();
            new_command.Connection = Connection_DB;
            try
            {
                _Select_Info = "SELECT  Name, Family, Account_name, Date_m FROM  User_tbl WHERE User_tbl.ID='"+ID+"' ";
                new_command.CommandText = _Select_Info;
                DR = new_command.ExecuteReader();

                DR.Read();
                _name_user = Convert.ToString(DR[0]);
                _family = Convert.ToString(DR[1]);
                _name_account = Convert.ToString(DR[2]);
                _date_member =Convert.ToDateTime(DR[3]);
                DR.Close();
            }
            catch
            {
                throw;
            }
            finally
            {
                Connection_DB.Close();
            }
        }


        /// <summary>
        /// get user information for edit section
        /// </summary>
        /// <returns></returns>
        /// 
        public DataSet User_info_Show(string _Info_Show)
        {
            DataSet Ds = new DataSet();

            try
            {
                Connection_DB.Open();
                SqlCommand new_command = new SqlCommand();
                new_command.Connection = Connection_DB;
                new_command.CommandText = _Info_Show;
                SqlDataAdapter new_adapter = new SqlDataAdapter(new_command);
                new_adapter.Fill(Ds);

            }

            catch
            {
                throw;
            }


            finally
            {
                Connection_DB.Close();
            }
            return Ds;
        }


        /// <summary>
        /// recovery password : get account name , security question , security answer
        /// </summary>
        /// <param name="_Recovery_str"></param>
        /// <returns></returns>
        public string Recovery_user_password(string _Recovery_str)
        {
            string _Account_name;
            string _Password;
            SqlDataReader DR;
            try
            {

                Connection_DB.Open();
                SqlCommand new_command = new SqlCommand();
                new_command.Connection = Connection_DB;
                new_command.CommandText = _Recovery_str;
                DR = new_command.ExecuteReader();
                if (DR.HasRows)
                {
                    DR.Read();
                    _Account_name = DR[0].ToString();
                    _Password = DR[1].ToString();
                    _Result_string ="Account name :" + _Account_name.ToString() + ";" + "Password:" + _Password.ToString();
                }
                else if(!DR.HasRows)
                {
                    _Result_string = "اطلاعات وارد شده شما صحیح نمی باشد، لطفا در وارد کردن اطلاعات دقت فرمایید.";

                }
            }
            catch
            {
                throw;
            }
            finally
            {
                Connection_DB.Close();
            }
            return _Result_string;
        }
              
            /// <summary>
            /// 
            /// </summary>
            /// <returns>create a captcha for final step sing_up</returns>

        public string Captcha()
        {
            string Recursive_str = "";
            Random Rand_num = new Random();

            object Rand_num1 = Rand_num.Next(0, 61);
            object Rand_num2 = Rand_num.Next(0, 61);
            object Rand_num3 = Rand_num.Next(0, 61);
            object Rand_num4 = Rand_num.Next(0, 61);
            object Rand_num5 = Rand_num.Next(0, 61);

            string sub_str1 = _Allcahr.Substring((int)Rand_num1, 1);
            string sub_str2 = _Allcahr.Substring((int)Rand_num2, 1);
            string sub_str3 = _Allcahr.Substring((int)Rand_num3, 1);
            string sub_str4 = _Allcahr.Substring((int)Rand_num4, 1);
            string sub_str5 = _Allcahr.Substring((int)Rand_num5, 1);

            Recursive_str = sub_str1 + sub_str2 + sub_str3 + sub_str4+ sub_str5 ;
            _Captcha_text = Recursive_str;
            return Recursive_str;

        }

    #endregion method 

    #region property

        /// <summary>
        /// return captcha for checking
        /// </summary>
        public string Captcha_Test
        {
            get { return _Captcha_text; }
        }

        public int ID
        {
            get { return _id; }
        }

        public int IDGroup
        {
            get { return _id_Group; }
        }
        public string User_name
        {
            get { return _name_user; }

        }
        public string User_Family
        {
            get { return _family; }

        }
        public DateTime Date_Member
        {
            get { return _date_member; }

        }
        public int Count_Friend
        {
            get { return _count_friend; }

        }
        public string Name_Account
        {
            get { return _name_account; }
        }
    #endregion property

    }
    }
