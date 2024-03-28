using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string isbn = Request.Form["txtSearchISBN"];

            // Perform the search/filtering logic based on ISBN
            DataTable dt = GetFilteredData(isbn);

            // Bind the filtered data to the GridView
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        private DataTable GetFilteredData(string isbn)
        {
            SqlConnection con = new SqlConnection("Data Source =.\\SQLEXPRESS; Initial Catalog = project; Integrated Security = True; Pooling = False");

            try
            {
                con.Open();
                SqlCommand cmmd = new SqlCommand("SELECT * FROM books WHERE ISBN LIKE @isbn", con);
                cmmd.Parameters.AddWithValue("@isbn", "%" + isbn + "%");

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
        protected void btnClearFilter_Click(object sender, EventArgs e)
        {
            BindGridView(); // Rebind the GridView with the original data
        }


    }
}