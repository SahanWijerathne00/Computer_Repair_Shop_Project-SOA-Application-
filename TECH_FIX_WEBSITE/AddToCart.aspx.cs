using System;
using System.Data.SqlClient;
using System.Configuration;

namespace TECH_FIX_WEBSITE
{
    public partial class AddToCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.HttpMethod == "POST")
            {
                // Get values from the POST request
                string itemName = Request.Form["itemName"];
                string itemImage = Request.Form["itemImage"];
                decimal price = decimal.Parse(Request.Form["price"]);

                // Database connection
                string connectionString = ConfigurationManager.ConnectionStrings["TechDatabaseConnectionString"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    // Insert into AdminCart table
                    string query = "INSERT INTO AdminCart (ItemName, ItemImage, Price, Quantity) VALUES (@ItemName, @ItemImage, @Price, 1)";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@ItemName", itemName);
                    cmd.Parameters.AddWithValue("@ItemImage", itemImage);
                    cmd.Parameters.AddWithValue("@Price", price);

                    cmd.ExecuteNonQuery(); // Execute the insert command
                }
            }
        }
    }
}
