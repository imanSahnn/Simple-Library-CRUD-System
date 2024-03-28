using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Project
{
    public partial class Logincustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = Username.Text;
            string password = Password.Text;

            SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS; Initial Catalog=project; Integrated Security=True; Pooling=False");

            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM Register WHERE Username = @username AND Password = @password", con);
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@password", password);

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    Session["Username"] = username; // Save the username in a session variable
                    Response.Redirect("Dashboard.aspx");
                }
                else
                {
                    lblStatus.Text = "Invalid username or password";
                }

                reader.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
            finally
            {
                con.Close();
            }
        }
    }
}
