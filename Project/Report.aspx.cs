using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ViewReport_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection ("Data Source =.\\SQLEXPRESS; Initial Catalog = project; Integrated Security = True; Pooling = False");
            try
            {
                con.Open();
                SqlCommand com = new SqlCommand("SELECT * from books", con);

                SqlDataReader reader = com.ExecuteReader();

                DataTable dt = new DataTable();
                dt.Load(reader);
                ReportViewer1.LocalReport.DataSources.Add(new Microsoft.Reporting.WebForms.ReportDataSource("DataSet1", dt));
                ReportViewer1.LocalReport.ReportPath = Server.MapPath("Report1.rdlc");
                ReportViewer1.LocalReport.EnableHyperlinks = true;  
                reader.Close();
            }
            catch (Exception ex)
            {

            }
            finally { con.Close(); }
        }
    }
}