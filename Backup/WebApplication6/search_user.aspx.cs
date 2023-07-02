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
   
    public partial class WebForm7 : System.Web.UI.Page
    {


        protected void Repeater_Section1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Image IMG = (Image)e.Item.FindControl("Image_user");
            if (IMG != null)
            {
                if (IMG.ImageUrl == string.Empty)
                    IMG.ImageUrl = "~/images/no_image.png";
            }
        }
    }
}