using System;
using System.Data;
using System.Data.SqlClient;

namespace Project
{
    public partial class Update : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           if (!IsPostBack)
    {
        // Check if the ISBN is provided in the query string
        if (Request.QueryString["ISBN"] != null)
        {
            // Load the data for the specified ISBN
            string isbn = Request.QueryString["ISBN"];
            LoadBookData(isbn);
        }
        else
        {
            lblStatus.Text = "ISBN is missing in the query string.";
        }
    }
        }

        private void LoadBookData(string isbn)
        {
            string connectionString = "Data Source=.\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True;Pooling=False";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string selectQuery = "SELECT Title, Author, Genre, Year, ISBN, Quantity FROM books WHERE ISBN = @ISBN";

                using (SqlCommand command = new SqlCommand(selectQuery, connection))
                {
                    command.Parameters.AddWithValue("@ISBN", isbn);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            txtTitle.Text = reader["Title"].ToString();
                            txtAuthor.Text = reader["Author"].ToString();
                            txtGenre.Text = reader["Genre"].ToString();
                            txtPublicationYear.Text = reader["Year"].ToString();
                            txtISBN.Text = reader["ISBN"].ToString();
                            txtQuantity.Text = reader["Quantity"].ToString();
                        }
                        else
                        {
                            lblStatus.Text = "Book not found.";
                        }
                    }
                }
            }
        }


        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string isbn = txtISBN.Text;
            string Title = txtTitle.Text;
            string Author = txtAuthor.Text;
            string Genre = txtGenre.Text;
           string Year = txtPublicationYear.Text;
           string Quantity = txtQuantity.Text;

            try
            {
                using (SqlConnection connection = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True;Pooling=False"))
                {
                    connection.Open();
                    string updateQuery = "UPDATE books SET Title = @Title, Author = @Author, Genre = @Genre, Year = @Year, Quantity = @Quantity WHERE ISBN = @ISBN";

                    using (SqlCommand command = new SqlCommand(updateQuery, connection))
                    {
                        command.Parameters.AddWithValue("@Title", txtTitle.Text);
                        command.Parameters.AddWithValue("@Author", txtAuthor.Text);
                        command.Parameters.AddWithValue("@Genre", txtGenre.Text);
                        command.Parameters.AddWithValue("@Year", Convert.ToInt32(txtPublicationYear.Text));
                        command.Parameters.AddWithValue("@Quantity", Convert.ToInt32(txtQuantity.Text));
                        command.Parameters.AddWithValue("@ISBN", isbn);

                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            lblStatus.Text = "Book updated successfully.";
                        }
                        else
                        {
                            lblStatus.Text = "No records updated. ISBN not found or no changes made.";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblStatus.Text = "An error occurred: " + ex.Message;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("View.aspx");
        }
    }
}
