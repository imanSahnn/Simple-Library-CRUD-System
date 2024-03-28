using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class View : System.Web.UI.Page
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
        protected void GridView1_RowDataBound(object sender, EventArgs e)
        {
        }
        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            string ID = GridView1.SelectedRow.Cells[0].Text;
            string Title = GridView1.SelectedRow.Cells[1].Text;
            string Author = GridView1.SelectedRow.Cells[2].Text;
            string Genre = GridView1.SelectedRow.Cells[3].Text;
            string Publication_Year = GridView1.SelectedRow.Cells[4].Text;
            string ISBN = GridView1.SelectedRow.Cells[5].Text;
            string Quantity = GridView1.SelectedRow.Cells[6].Text;

            Session["id"] = ID;
            Session["Title"] = Title;
            Session["Author"] = Author;
            Session["Genre"] = Author;
            Session["Publication_Year"] = Author;
            Session["ISBN"] = Author;
            Session["Quantity"] = Author;
            
            
        }
        protected void ButtonAddNew_Click(object sender, EventArgs e)
        {
        }
        protected void GridView1_PageIndexChanging(object sender,
       GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.BindGridView();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                if (int.TryParse(e.CommandArgument.ToString(), out int bookId))
                {
                    string connectionString = "Data Source=.\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True;Pooling=False";

                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        try
                        {
                            connection.Open();
                            string deleteQuery = "DELETE FROM books WHERE Id = @BookID";

                            using (SqlCommand command = new SqlCommand(deleteQuery, connection))
                            {
                                command.Parameters.AddWithValue("@BookID", bookId);
                                int rowsAffected = command.ExecuteNonQuery();
                                if (rowsAffected > 0)
                                {
                                    // Deletion successful, rebind the GridView
                                    BindGridView();
                                }
                                else
                                {
                                    // Handle deletion failure if necessary
                                }
                            }
                        }
                        catch (Exception ex)
                        {
                            // Handle exceptions
                            Response.Write(ex.ToString());
                        }
                    }
                }
                else
                {
                    // Handle invalid or missing CommandArgument (BookID) 
                }
            }
            else if (e.CommandName == "Update")
            {
                if (int.TryParse(e.CommandArgument.ToString(), out int bookId))
                {
                    // Retrieve the book details from the selected row
                    GridViewRow row = GridView1.Rows[Convert.ToInt32(e.CommandArgument)];
                    string title = row.Cells[1].Text;
                    string author = row.Cells[2].Text;
                    string genre = row.Cells[3].Text;
                    string publicationYear = row.Cells[4].Text;
                    string isbn = row.Cells[5].Text;
                    string quantity = row.Cells[6].Text;

                    // Redirect to Add.aspx with query parameters for pre-filled data
                    Response.Redirect($"Add.aspx?id={bookId}&title={Server.UrlEncode(title)}&author={Server.UrlEncode(author)}&genre={Server.UrlEncode(genre)}&publicationYear={Server.UrlEncode(publicationYear)}&isbn={Server.UrlEncode(isbn)}&quantity={Server.UrlEncode(quantity)}");
                }
                else
                {
                    // Handle invalid or missing CommandArgument (BookID)
                }
            }


        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            if (e.RowIndex >= 0 && GridView1.DataKeys.Count > e.RowIndex)
            {
                int bookId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex]["Id"]);

                string connectionString = "Data Source=.\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True;Pooling=False";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    try
                    {
                        connection.Open();
                        string deleteQuery = "DELETE FROM books WHERE Id = @BookID";

                        using (SqlCommand command = new SqlCommand(deleteQuery, connection))
                        {
                            command.Parameters.AddWithValue("@BookID", bookId);
                            int rowsAffected = command.ExecuteNonQuery();
                            if (rowsAffected > 0)
                            {
                                // Deletion successful, rebind the GridView
                                BindGridView();
                            }
                            else
                            {
                                // Handle deletion failure if necessary
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        // Handle exceptions
                        Response.Write(ex.ToString());
                    }
                }
            }
            else
            {
                // Handle invalid row index or DataKeys issue
                // You can log this or perform error handling as needed
            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // Handle the RowUpdating event here
        }






    }
}
