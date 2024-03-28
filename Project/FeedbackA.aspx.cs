using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;

namespace Project
{
    public partial class FeedbackA : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadFeedbackData();
            }
        }

        void LoadFeedbackData()
        {
            // Your database connection string
            string connectionString = "Data Source=.\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True;Pooling=False";

            // SQL query to select data from the Feedback table
            string query = "SELECT Name, ContactNumber, Comment FROM Feedback";

            // Create SqlConnection and SqlCommand objects
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Create a SqlDataAdapter to fetch data from the database
                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        // Create a DataTable to hold the retrieved data
                        DataTable dt = new DataTable();

                        // Open the database connection
                        connection.Open();

                        // Fill the DataTable with data from the database
                        adapter.Fill(dt);

                        // Close the database connection
                        connection.Close();

                        // Bind the GridView with the DataTable
                        GridViewFeedback.DataSource = dt;
                        GridViewFeedback.DataBind();
                    }
                }
            }
        }
    }
}
