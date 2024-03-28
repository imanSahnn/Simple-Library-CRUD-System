using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Project
{
    public partial class Books : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindGridView();
            }
        }

        private void BindGridView()
        {
            SqlConnection con = new SqlConnection
            ("Data Source =.\\SQLEXPRESS; Initial Catalog = project; Integrated Security = True; Pooling = False");
            try
            {
                con.Open();
                SqlCommand cmmd = new SqlCommand("SELECT * FROM books", con);
                SqlDataAdapter sda = new SqlDataAdapter();
                DataTable dt = new DataTable();
                sda.SelectCommand = cmmd;
                sda.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind(); //adjust sini kalau ada error
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

        private DataTable GetFilteredData(string isbn, string title, string genre)
        {
            SqlConnection con = new SqlConnection("Data Source =.\\SQLEXPRESS; Initial Catalog = project; Integrated Security = True; Pooling = False");

            try
            {
                con.Open();
                SqlCommand cmmd = new SqlCommand("SELECT * FROM books WHERE ISBN LIKE @isbn AND (Title LIKE @title OR @title = '') AND (Genre LIKE @genre OR @genre = '')", con);
                cmmd.Parameters.AddWithValue("@isbn", "%" + isbn + "%");
                cmmd.Parameters.AddWithValue("@title", "%" + title + "%");
                cmmd.Parameters.AddWithValue("@genre", "%" + genre + "%");

                SqlDataAdapter sda = new SqlDataAdapter();
                DataTable dt = new DataTable();
                sda.SelectCommand = cmmd;
                sda.Fill(dt);

                return dt;
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
                return null; // Handle this error appropriately in your application
            }
            finally
            {
                con.Close();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            // Get the values from the search fields
            string isbn = Request.Form["txtSearchISBN"];
            string title = Request.Form["txtSearchTitle"];
            string genre = Request.Form["txtSearchGenre"];

            // Perform the search/filtering logic based on ISBN, Title, and Genre
            DataTable dt = GetFilteredData(isbn, title, genre);

            // Bind the filtered data to the GridView
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void btnClearFilter_Click(object sender, EventArgs e)
        {
            txtSearchISBN.Text = "";
            txtSearchTitle.Text = "";
            txtSearchGenre.Text = "";
            BindGridView(); // Rebind the GridView with the original data
            
        }
    }
}