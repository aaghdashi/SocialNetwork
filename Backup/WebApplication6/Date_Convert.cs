using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication6
{
    public class Date_Convert
    {
         string Date;
    string[] dt_split = new string[3];
    string Day, Year, Month;
   
    public string C_Date_fa_to_en(string dt)
    {
        System.Globalization.PersianCalendar p_c = new System.Globalization.PersianCalendar();
        dt_split = dt.Split('/');
        Date = p_c.ToDateTime(Convert.ToInt32(dt_split[0]), Convert.ToInt32(dt_split[1]), Convert.ToInt32(dt_split[2]), 0, 0, 0, 0).ToString();
        
        dt_split  = Date.Split('/');
        Date = dt_split[0].ToString() + "/" + dt_split[1].ToString() + "/" + dt_split[2].Substring(0, 4).ToString();
        return Date;
    }
    public string C_Date_en_to_fa(string dt)
    {
        System.Globalization.PersianCalendar p_c = new System.Globalization.PersianCalendar();
        dt_split = dt.Split('/');
        DateTime d_t = new DateTime(Convert.ToInt32(dt_split[2].Substring(0, 4)), Convert.ToInt32(dt_split[0]), Convert.ToInt32(dt_split[1]));
        Date = p_c.GetYear(d_t).ToString() + "/" + p_c.GetMonth(d_t).ToString() + "/" + p_c.GetDayOfMonth(d_t).ToString();       
        return Date;
    }
    }
}