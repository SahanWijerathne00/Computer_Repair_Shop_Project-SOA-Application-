using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace TECH_FIX_WEBSITE
{
    public partial class ViewQuotation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindQuotationData();
            }
        }
        private void BindQuotationData()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["TechDatabaseConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    string query = "SELECT QuotationID, SupplierUserID, QuotationDate, TotalAmount, Description, Status FROM Quotations";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    conn.Open();

                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    GridViewQuotations.DataSource = dt;
                    GridViewQuotations.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("An error occurred: " + ex.Message);
                }
            }
        }
    }
}
