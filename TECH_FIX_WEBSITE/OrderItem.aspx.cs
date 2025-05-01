using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Diagnostics;

namespace TECH_FIX_WEBSITE
{
    public partial class OrderItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateSupplierDropdown();
            }
        }

        private void PopulateSupplierDropdown()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["TechDatabaseConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT Name, CompanyName FROM Suppliers";
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader reader = cmd.ExecuteReader();

                supplierId.DataSource = reader;
                supplierId.DataTextField = "CompanyName";
                supplierId.DataValueField = "Name";
                supplierId.DataBind();
            }
        }

        protected void CreateOrderBtn_Click(object sender, EventArgs e)
        {
            // Validate form fields, including Item ID
            if (string.IsNullOrEmpty(itemId.Text) || string.IsNullOrEmpty(itemName.Text) ||
                string.IsNullOrEmpty(price.Text) || string.IsNullOrEmpty(quantity.Text) ||
                supplierId.SelectedIndex == -1 || string.IsNullOrEmpty(orderDate.Text))
            {
                Response.Write("<script>alert('Please fill in all fields.');</script>");
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["TechDatabaseConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "INSERT INTO Orders (ItemID, ItemName, Price, Quantity, SupplierUserID, OrderDate) " +
                               "VALUES (@ItemId, @ItemName, @Price, @Quantity, @SupplierID, @OrderDate)";
                SqlCommand cmd = new SqlCommand(query, conn);


                cmd.Parameters.AddWithValue("@ItemId", int.Parse(itemId.Text));
                cmd.Parameters.AddWithValue("@ItemName", itemName.Text);
                cmd.Parameters.AddWithValue("@Price", decimal.Parse(price.Text));
                cmd.Parameters.AddWithValue("@Quantity", int.Parse(quantity.Text));
                cmd.Parameters.AddWithValue("@SupplierID", supplierId.SelectedValue);
                cmd.Parameters.AddWithValue("@OrderDate", DateTime.Parse(orderDate.Text));

                cmd.ExecuteNonQuery();
            }

            Response.Write("<script>alert('Order created successfully!');</script>");
        }

        protected void HomeButton_Click(object sender, EventArgs e)
        {
            // Redirect to the dashboard
            Response.Redirect("AdminDashboard.aspx");
        }
    }
}
