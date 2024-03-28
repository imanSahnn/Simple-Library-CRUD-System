using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class Feedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string contactNumber = txtContactNumber.Text;
            string comment = txtComment.Text;

            // Insert feedback into the database (Feedback table)
            InsertFeedback(username, contactNumber, comment);

            // Optionally, you can redirect the user to another page or display a success message
            // Response.Redirect("SuccessPage.aspx");
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Feedback submitted successfully.');", true);
        }
        private void InsertFeedback(string username, string contactNumber, string comment)
        {
            // Your database connection string
            string connectionString = "Data Source=.\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True;Pooling=False";

            // SQL query to insert data into the Feedback table
            string query = "INSERT INTO Feedback (Name, ContactNumber, Comment) VALUES (@Name, @ContactNumber, @Comment)";

            // Create a SqlConnection and SqlCommand objects
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters to the SqlCommand to avoid SQL injection
                    command.Parameters.AddWithValue("@Name", username);
                    command.Parameters.AddWithValue("@ContactNumber", contactNumber);
                    command.Parameters.AddWithValue("@Comment", comment);

                    // Open the database connection
                    connection.Open();

                    // Execute the INSERT query
                    command.ExecuteNonQuery();

                    // Close the database connection
                    connection.Close();
                }
            }
        }
    }
}