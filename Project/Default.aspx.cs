using System;
using System.Web.UI;

namespace Project
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            // Check if the username and password are both "admin" (case-insensitive)
            if (username.ToLower() == "admin" && password.ToLower() == "admin")
            {
                // Redirect to Admin.aspx for admin users
                Response.Redirect("Admin.aspx");
            }
            else
            {
                // Username or password is not "admin"
                // You can display an error message or take appropriate action
                lblStatus.Text = "Invalid username or password.";
            }
        }
    }
}
