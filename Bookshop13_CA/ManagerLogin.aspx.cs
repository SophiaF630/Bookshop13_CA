using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bookshop13_CA
{
    public partial class ManagerLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox2.Text == "Admin" && TextBox1.Text == "Password")
            {
                Response.Redirect("ManagePage.aspx");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Please enter right username and password')", true);
            }
            //error handle   
        }
    }
}