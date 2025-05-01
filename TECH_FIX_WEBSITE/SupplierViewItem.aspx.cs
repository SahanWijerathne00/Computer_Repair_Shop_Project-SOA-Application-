using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace TECH_FIX_WEBSITE
{
    public partial class SupplierViewItem : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["TechDatabaseConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
         }
       protected void SearchItems(object sender, EventArgs e)
        {
            string supplierUserID = supplierID.Value.Trim(); 

            if (string.IsNullOrEmpty(supplierUserID))
            {
                // If no Supplier ID is entered, show an error
                Response.Write("<script>alert('Please enter a valid Supplier ID');</script>");
                return;
            }

            // Fetch items for the entered Supplier ID
            DataTable dt = GetItemsBySupplierID(supplierUserID);

            if (dt.Rows.Count > 0)
            {
                ItemsGridView.DataSource = dt;
                ItemsGridView.DataBind();
            }
            else
            {
                // Show message if no items found
                Response.Write("<script>alert('No items found for this Supplier ID');</script>");
                ItemsGridView.DataSource = null;
                ItemsGridView.DataBind();
            }
        }

        private DataTable GetItemsBySupplierID(string supplierUserID)
        {
            DataTable dt = new DataTable();
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT ItemID, Category, ItemName, Description, Price, Quantity, Image, DateAdded, SupplierUserID " +
                               "FROM Items WHERE SupplierUserID = @SupplierUserID";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@SupplierUserID", supplierUserID);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                }
            }
            return dt;
        }
    }
}
