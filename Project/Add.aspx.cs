using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class Add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string title = txtTitle.Text;
            string author = txtAuthor.Text;
            string genre = txtGenre.Text;
            int publicationYear = Convert.ToInt32(txtPublicationYear.Text);
            string isbn = txtISBN.Text;
            int quantity = Convert.ToInt32(txtQuantity.Text);

            // Check for duplicate ISBN
            if (IsISBNExists(isbn))
            {
                // Display an error message if ISBN already exists
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('ISBN already exists.');", true);
            }
            else
            {
                // If ISBN is not a duplicate, proceed with adding the record
                using (SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True;Pooling=False"))
                {
                    con.Open();  // Open the connection

                    // Create a SqlCommand with a parameterized INSERT query
                    using (SqlCommand comm = new SqlCommand("INSERT INTO books (Title, Author, Genre, [Year], ISBN, Quantity) VALUES (@title, @author, @genre, @publicationYear, @isbn, @quantity)", con))
                    {
                        // Add parameters to the SqlCommand
                        comm.Parameters.AddWithValue("@title", title);
                        comm.Parameters.AddWithValue("@author", author);
                        comm.Parameters.AddWithValue("@genre", genre);
                        comm.Parameters.AddWithValue("@publicationYear", publicationYear);
                        comm.Parameters.AddWithValue("@isbn", isbn);
                        comm.Parameters.AddWithValue("@quantity", quantity);

                        // Execute the INSERT query
                        comm.ExecuteNonQuery();
                    }  // SqlCommand and its resources are automatically disposed

                    // Display a success alert using ScriptManager
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Success');", true);
                    
                }
            }
        }
        private bool IsISBNExists(string isbn)
        {
            using (SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True;Pooling=False"))
            {
                con.Open();  // Open the connection

                SqlCommand comm = new SqlCommand("SELECT COUNT(*) FROM books WHERE ISBN = @isbn", con);
                comm.Parameters.AddWithValue("@isbn", isbn);

                int count = Convert.ToInt32(comm.ExecuteScalar());

                return count > 0;
            }
        }
    }

}