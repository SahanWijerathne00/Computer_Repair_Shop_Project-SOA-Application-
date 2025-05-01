using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace TECH_FIX_WEBSITE
{
    public partial class SupplierView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindSupplierGrid();
            }
        }
        private void BindSupplierGrid()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["TechDatabaseConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT Id, Name, CompanyName, Email, PhoneNumber, Address FROM Suppliers";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                SupplierGridView.DataSource = dt;
                SupplierGridView.DataBind();
            }
        }

        protected void SupplierGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteSupplier")
            {
                int supplierId = Convert.ToInt32(e.CommandArgument);
                DeleteSupplier(supplierId);
                BindSupplierGrid(); // Refresh the grid after deletion
            }
        }

        private void DeleteSupplier(int supplierId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["TechDatabaseConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "DELETE FROM Suppliers WHERE Id = @SupplierId";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@SupplierId", supplierId);
                cmd.ExecuteNonQuery();
            }
        }

        protected void HomeButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDashboard.aspx"); 
        }
    }
}
