using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if the session variable exists
                if (Session["Username"] != null)
                {
                    string username = Session["Username"].ToString();
                    lblUsername.Text = "Welcome, " + username + "!";
                }
                else
                {
                    // Handle the case when the session variable is not set (e.g., user not logged in)
                    Response.Redirect("Logincustomer.aspx");
                }
            }
        }

        
    }
}