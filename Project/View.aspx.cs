using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Project
{
    public partial class View : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRecord();
            }
        }
        void LoadRecord()
        {
            SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True;Pooling=False");
            SqlCommand comm = new SqlCommand("SELECT * from books", con);
            SqlDataAdapter d = new SqlDataAdapter(comm);
            DataTable dt = new DataTable();
            d.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string title = txtTitle.Text;
            string author = txtAuthor.Text;
            string genre = txtGenre.Text;
            int publicationYear = Convert.ToInt32(txtPublicationYear.Text);
            string isbn = txtISBN.Text;
            int quantity = Convert.ToInt32(txtQuantity.Text);
            try
            {
                using (SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True;Pooling=False"))
                {
                    con.Open();  // Open the connection

                    SqlCommand commm = new SqlCommand("UPDATE books SET Title=@title, Author=@author, Genre=@genre, [Year]=@publicationYear, ISBN=@isbn, Quantity=@quantity WHERE ISBN=@isbn", con);

                    // Add parameters to the SqlCommand
                    commm.Parameters.AddWithValue("@title", title);
                    commm.Parameters.AddWithValue("@author", author);
                    commm.Parameters.AddWithValue("@genre", genre);
                    commm.Parameters.AddWithValue("@publicationYear", publicationYear);
                    commm.Parameters.AddWithValue("@isbn", isbn);
                    commm.Parameters.AddWithValue("@quantity", quantity);

                    // Execute the UPDATE query
                    commm.ExecuteNonQuery();
                    // SqlCommand and its resources are automatically disposed

                    // Display a success alert using ScriptManager
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Succesttts');", true);
                    LoadRecord();
                }
                GridView1.DataBind();
            }
            catch (Exception ex)
            {

            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True;Pooling=False");
            con.Open();  // Open the connection

            SqlCommand commmm = new SqlCommand("Delete books WHERE ISBN= '" + txtISBN.Text + "'", con);
            commmm.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Padam');", true);
            LoadRecord();
        }
        protected void btnGet_Click(object sender, EventArgs e)
        {
            // Your database connection string
            string connectionString = "Data Source=.\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True;Pooling=False";

            // SQL query to select data based on ISBN
            string query = "SELECT * FROM books WHERE ISBN = @ISBN";

            // Create SqlConnection and SqlCommand objects
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters to the SqlCommand to avoid SQL injection
                    command.Parameters.AddWithValue("@ISBN", txtISBN.Text.Trim());

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
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }
        protected void btnWant_Click(object sender, EventArgs e)
        {
            

            try
            {
                using (SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True;Pooling=False"))
                {
                    con.Open();  // Open the connection

                    SqlCommand commm = new SqlCommand("SELECT * FROM books WHERE ISBN = '" + txtISBN.Text + "'", con);
                    SqlDataReader reader = commm.ExecuteReader();
                    while(reader.Read())
                    {
                        txtTitle.Text = reader.GetValue(1).ToString();
                        txtAuthor.Text = reader.GetValue(2).ToString();
                        txtGenre.Text = reader.GetValue(3).ToString();
                        txtPublicationYear.Text = reader.GetValue(4).ToString();
                        txtISBN.Text = reader.GetValue(5).ToString();
                        txtQuantity.Text = reader.GetValue(6).ToString();
                    }
                    
                }
                GridView1.DataBind();
            }
            catch (Exception ex)
            {

            }
        }
    }
}
