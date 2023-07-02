using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication6
{
     public class Make_Post
     {
         #region variable
         private Cloop_class _str_connection = new Cloop_class();
         public SqlConnection new_connection = new SqlConnection();
         private int _state_add;
         private int _state_edit;
         private int _state_delete;
         #endregion variable

         public int Create_Post(string _add_post)
         {
             try
             {
                 new_connection.ConnectionString = _str_connection.ConnectionString;
                 new_connection.Open();
                 SqlCommand new_command = new SqlCommand();
                 new_command.Connection = new_connection;
                 new_command.CommandText = _add_post;
                 new_command.ExecuteNonQuery();
                 _state_add = 1;
             }
             catch
             {
                 _state_add = 0;
                 throw;
             }
             finally
             {
                 new_connection.Close();
             }
             return _state_add;
          }

         public int Edit_Post(string _edit_post)
         {
             try
             {
                 new_connection.ConnectionString = _str_connection.ConnectionString;
                 new_connection.Open();
                 SqlCommand new_command = new SqlCommand();
                 new_command.Connection = new_connection;
                 new_command.CommandText = _edit_post;
                 new_command.ExecuteNonQuery();
                 _state_edit = 1;
             }
             catch
             {
                 _state_edit = 0;
                 throw;
             }
             finally
             {
                 new_connection.Close();
             }
             return _state_edit;
         }

         public int Delete_Post(string _delete_post)
         {
             try
             {
                 new_connection.ConnectionString = _str_connection.ConnectionString;
                 new_connection.Open();
                 SqlCommand new_command = new SqlCommand();
                 new_command.Connection = new_connection;
                 new_command.CommandText = _delete_post;
                 new_command.ExecuteNonQuery();
                 _state_delete = 1;
             }
             catch
             {
                 _state_delete = 0;
                 throw;
             }
             finally
             {
                 new_connection.Close();
             }
             return _state_delete;
         }
    }
}