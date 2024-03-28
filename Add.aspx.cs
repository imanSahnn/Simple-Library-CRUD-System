using System;
using System.Data;
using System.Data.SqlClient;
using System.Runtime.Remoting.Messaging;
using System.Web.UI;
using System.Xml.Linq;

namespace Project
{
    public partial class Add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    txtId.Text = Request.QueryString["id"];
                    txtTitle.Text = Server.UrlDecode(Request.QueryString["title"]);
                    txtAuthor.Text = Server.UrlDecode(Request.QueryString["author"]);
                    txtGenre.Text = Server.UrlDecode(Request.QueryString["genre"]);
                    txtPublicationYear.Text = Server.UrlDecode(Request.QueryString["publicationYear"]);
                    txtISBN.Text = Server.UrlDecode(Request.QueryString["isbn"]);
                    txtQuantity.Text = Server.UrlDecode(Request.QueryString["quantity"]);
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (!int.TryParse(txtPublicationYear.Text, out int publicationYear) || !int.TryParse(txtQuantity.Text, out int quantity))
            {
                return;
            }

            string title = txtTitle.Text;
            string author = txtAuthor.Text;
            string genre = txtGenre.Text;
            string isbn = txtISBN.Text;

            bool isUpdate = int.TryParse(Request.QueryString["id"], out int id);

            string connectionString = @"Data Source=.\SQLEXPRESS;Initial Catalog=project;Integrated Security=True;Pooling=False";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    SqlCommand cmd;

                    if (isUpdate)
                    {
                        cmd = new SqlCommand("UPDATE books SET Title = @Title, Author = @Author, Genre = @Genre, Year = @Year, ISBN = @ISBN, Quantity = @Quantity WHERE Id = @Id", con);
                        cmd.Parameters.AddWithValue("@Id", id);
                    }
                    else
                    {
                        cmd = new SqlCommand("INSERT INTO books (Title, Author, Genre, [Year], ISBN, Quantity) VALUES (@Title, @Author, @Genre, @Year, @ISBN, @Quantity)", con);
                        //cmd.Parameters.AddWithValue("@Id", id);

                    }

                    cmd.Parameters.AddWithValue("@Title", title);
                    cmd.Parameters.AddWithValue("@Author", author);
                    cmd.Parameters.AddWithValue("@Genre", genre);
                    cmd.Parameters.AddWithValue("@ISBN", isbn);
                    cmd.Parameters.AddWithValue("@Year", publicationYear);
                    cmd.Parameters.AddWithValue("@Quantity", quantity);

                    int rowsAffected = cmd.ExecuteNonQuery();

                    lblStatus.Text = isUpdate ? "Book updated successfully" : "New book info added successfully";

                    ClearFormFields();
                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }
            }
        }

        private void ClearFormFields()
        {
            txtAuthor.Text = "";
            txtGenre.Text = "";
            txtTitle.Text = "";
            txtISBN.Text = "";
            txtPublicationYear.Text = "";
            txtQuantity.Text = "";
        }

        protected void ButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFormFields();
        }
    }
}
