using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication6
{

    public class Search
    {
        private Cloop_class _str_connection = new Cloop_class();
        public DataSet DS = new DataSet();

        Date_Convert persian_English = new Date_Convert();

        public DataSet Search_User(string _search_str)
        {
            DataSet _DT = new DataSet("User");
            SqlConnection new_connction = new SqlConnection();
            SqlCommand new_command = new SqlCommand();

            new_connction.ConnectionString = _str_connection.ConnectionString;
            new_connction.Open();
            new_command.Connection = new_connction;
            new_command.CommandText = " SELECT  ID,Name,Family,CASE WHEN Sex_User='True' THEN 'زن' WHEN Sex_User='False' THEN 'مرد' END AS 'Gender',Account_name,Favorites_user,Discreption_User,User_pic,Date_m FROM User_tbl WHERE  (Name LIKE '%" + _search_str + "%') OR  (Family LIKE '%" + _search_str + "%') OR  (Account_name LIKE '%" + _search_str + "%') OR  (City_live LIKE '%" + _search_str + "%') OR (Discreption_User LIKE '%" + _search_str + "%') OR (Favorites_user LIKE '%" + _search_str + "%')";
            SqlDataAdapter _Adapter = new SqlDataAdapter(new_command);

            new_command.ExecuteNonQuery();
            _Adapter.Fill(_DT);
            new_connction.Close();

            return _DT;
        }

        public DataSet Search_Group(string _search_str)
        {
            DataSet _DT = new DataSet("Group");
            SqlConnection new_connction = new SqlConnection();
            SqlCommand new_command = new SqlCommand();

            new_connction.ConnectionString = _str_connection.ConnectionString;
            new_connction.Open();
            new_command.Connection = new_connction;
            new_command.CommandText = "SELECT   Group_tbl.ID,CASE WHEN Group_tbl.ID_Creator= User_tbl.ID THEN User_tbl.Account_name END AS 'name_Account',Name_Group ,Topic_Group ,Date_Create,Discreption_Group,Pic_Group FROM Group_tbl INNER JOIN User_tbl ON Group_tbl.ID_Creator= User_tbl.ID WHERE (Name_Group LIKE '%" + _search_str + "%') OR (Topic_Group  LIKE '%" + _search_str + "%') OR (Discreption_Group LIKE '%" + _search_str + "%')";
            SqlDataAdapter _Adapter = new SqlDataAdapter(new_command);
            new_command.ExecuteNonQuery();

            _Adapter.Fill(_DT);
            new_connction.Close();
            return _DT;
        }
        public DataSet Search_Post(string _search_str)
        {
            DataSet _DT = new DataSet("Post");
            SqlConnection new_connction = new SqlConnection();
            SqlCommand new_command = new SqlCommand();

            new_connction.ConnectionString = _str_connection.ConnectionString;
            new_connction.Open();
            new_command.Connection = new_connction;
            new_command.CommandText = "SELECT  Post_Users_tbl.ID,Post_Users_tbl.ID_User,CASE WHEN Post_Users_tbl.ID_User= User_tbl.ID THEN User_tbl.Account_name END AS 'name_Account',Title,Body,DT_Create FROM Post_Users_tbl INNER JOIN User_tbl ON Post_Users_tbl.ID_User= User_tbl.ID WHERE (Title LIKE '%" + _search_str + "%') OR (Body  LIKE '%" + _search_str + "%')";
            SqlDataAdapter _Adapter = new SqlDataAdapter(new_command);
            new_command.ExecuteNonQuery();
            _Adapter.Fill(_DT);
            new_connction.Close();

            return _DT;
        }
        public DataSet ComplexSearch_Post(string _topic,string _memo,string _date1,string _date2)
        {   
            DataSet _DT = new DataSet("Post");
            SqlConnection new_connction = new SqlConnection();
            SqlCommand new_command = new SqlCommand();

            string _Criteria;

            new_connction.ConnectionString = _str_connection.ConnectionString;
            new_connction.Open();
            new_command.Connection = new_connction;
            _Criteria = "SELECT  Post_Users_tbl.ID,Post_Users_tbl.ID_User,CASE WHEN Post_Users_tbl.ID_User= User_tbl.ID THEN User_tbl.Account_name END AS 'name_Account',Title,Body,DT_Create FROM Post_Users_tbl INNER JOIN User_tbl ON Post_Users_tbl.ID_User= User_tbl.ID WHERE (Title LIKE '%" + _topic + "%') OR (Body  LIKE '%" + _memo + "%')";

            _Criteria += _date1 != "" ? "  OR ( Post_Users_tbl.DT_Create >= '" + persian_English.C_Date_fa_to_en(_date1).ToString() + "'" : "";
            _Criteria += _date2 != "" ? "  AND Post_Users_tbl.DT_Create <= '" + persian_English.C_Date_fa_to_en(_date2).ToString()+ "')" : "";

            new_command.CommandText = _Criteria;
                      
            SqlDataAdapter _Adapter = new SqlDataAdapter(new_command);
            new_command.ExecuteNonQuery();
            _Adapter.Fill(_DT);
            new_connction.Close();

            return _DT;
            
        }

        public DataSet Search_textFile(string _search_str)
        {
            DataSet _DT = new DataSet("textFile");
            SqlConnection new_connction = new SqlConnection();
            SqlCommand new_command = new SqlCommand();

            new_connction.ConnectionString = _str_connection.ConnectionString;
            new_connction.Open();
            new_command.Connection = new_connction;
            new_command.CommandText = "SELECT   ID_User,CASE WHEN Uploads_Textfile_User_tbl.ID_User= User_tbl.ID THEN User_tbl.Account_name END AS 'name_Account',Topic_Textfile, Discreption_Textfile, Date_Upload,Path_Textfile FROM Uploads_Textfile_User_tbl INNER JOIN User_tbl ON Uploads_Textfile_User_tbl.ID_User= User_tbl.ID WHERE (Topic_Textfile LIKE '%" + _search_str + "%') OR (Discreption_Textfile LIKE '%" + _search_str + "%')";
            SqlDataAdapter _Adapter = new SqlDataAdapter(new_command);
            new_command.ExecuteNonQuery();
            _Adapter.Fill(_DT);
            new_connction.Close();

            return _DT;
        }
        public DataSet Search_Picture(string _search_str)
        {
            DataSet _DT = new DataSet("Picture");
            SqlConnection new_connction = new SqlConnection();
            SqlCommand new_command = new SqlCommand();

            new_connction.ConnectionString = _str_connection.ConnectionString;
            new_connction.Open();
            new_command.Connection = new_connction;
            new_command.CommandText = "SELECT  ID_User,CASE WHEN Uploads_Pic_User_tbl.ID_User= User_tbl.ID THEN User_tbl.Account_name END AS 'name_Account', Path_pic,Topic_Pic,Discreption_Pic,Date_Upload FROM Uploads_Pic_User_tbl INNER JOIN User_tbl ON Uploads_Pic_User_tbl.ID_User= User_tbl.ID WHERE (Topic_Pic LIKE '%" + _search_str + "%') OR (Discreption_Pic LIKE '%" + _search_str + "%')";
            SqlDataAdapter _Adapter = new SqlDataAdapter(new_command);
            new_command.ExecuteNonQuery();
            _Adapter.Fill(_DT);
            new_connction.Close();

            return _DT;
        }
        public DataSet Search_Video(string _search_str)
        {
            DataSet _DT = new DataSet("Video");
            SqlConnection new_connction = new SqlConnection();
            SqlCommand new_command = new SqlCommand();

            new_connction.ConnectionString = _str_connection.ConnectionString;
            new_connction.Open();
            new_command.Connection = new_connction;
            new_command.CommandText = "SELECT   CASE WHEN Uploads_Movie_User_tbl.ID_User= User_tbl.ID THEN User_tbl.Account_name END AS 'name_Account',Topic_Movie, Discreption_Movie, Path_Movie,Date_Upload FROM Uploads_Movie_User_tbl INNER JOIN User_tbl ON Uploads_Movie_User_tbl.ID_User= User_tbl.ID WHERE (Topic_Movie LIKE '%" + _search_str + "%') OR (Discreption_Movie LIKE '%" + _search_str + "%')";
            SqlDataAdapter _Adapter = new SqlDataAdapter(new_command);
            new_command.ExecuteNonQuery();
            _Adapter.Fill(_DT);
            new_connction.Close();

            return _DT;
        }
    }
}