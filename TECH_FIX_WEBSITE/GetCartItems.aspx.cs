using System;
using System.Data.SqlClient;
using System.Configuration;

namespace TECH_FIX_WEBSITE
{
    public partial class GetItemsByCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string categoryName = Request.QueryString["CategoryID"]; // Get the Category name from the query string

                if (string.IsNullOrEmpty(categoryName))
                {
                    Response.Write("Invalid category selection.");
                    return;
                }

                string connectionString = ConfigurationManager.ConnectionStrings["TechDatabaseConnectionString"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string query = "SELECT * FROM Items WHERE Category = @CategoryName";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@CategoryName", categoryName); // Use Category name

                    SqlDataReader reader = cmd.ExecuteReader();

                    string itemsHtml = "";
                    while (reader.Read())
                    {
                        itemsHtml += "<div class='card'>" +
                                     $"<img src='../admin/{reader["Image"]}' class='card-img-top' alt='{reader["ItemName"]}' onclick='openItemDetails({reader["ItemID"]})'>" +
                                     "<div class='card-body'>" +
                                     $"<h5 class='card-title'>{reader["ItemName"]}</h5>" +
                                     $"<p class='card-text'>Rs.{reader["Price"]}/=</p>" +
                                     $"<button class='btn btn-primary' onclick='addToCart({reader["ItemID"]}, \"{reader["ItemName"]}\", {reader["Price"]})'>Order</button>" + // Add Order button
                                     "</div></div>";
                    }

                    Response.Write(itemsHtml); // Write the HTML to the response
                }
            }
        }

        // Method to add an item to the cart
        protected void AddToCart(int itemId, string itemName, decimal price)
        {
            string userId = "1"; // You can replace this with the actual user ID if you're tracking logged-in users

            string connectionString = ConfigurationManager.ConnectionStrings["TechDatabaseConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "INSERT INTO AdminCart (UserId, ItemId, ItemName, Price, Quantity, TotalPrice) VALUES (@UserId, @ItemId, @ItemName, @Price, @Quantity, @TotalPrice)";
                SqlCommand cmd = new SqlCommand(query, conn);

                cmd.Parameters.AddWithValue("@UserId", userId);
                cmd.Parameters.AddWithValue("@ItemId", itemId);
                cmd.Parameters.AddWithValue("@ItemName", itemName);
                cmd.Parameters.AddWithValue("@Price", price);
                cmd.Parameters.AddWithValue("@Quantity", 1); // Default to 1 for now; this can be dynamic later
                cmd.Parameters.AddWithValue("@TotalPrice", price * 1); // Total price is price * quantity

                cmd.ExecuteNonQuery();
            }

            // Redirect to the AdminCart page
            Response.Redirect("AdminCart.aspx?message=success");
        }
    }
}
