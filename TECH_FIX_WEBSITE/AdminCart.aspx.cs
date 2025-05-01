using System;
using System.Data.SqlClient;
using System.Configuration;

namespace TECH_FIX_WEBSITE
{
    public partial class AdminCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCartItems();
            }

            // Display success message if redirected from adding an item to the cart
            if (Request.QueryString["message"] == "success")
            {
                lblMessage.Text = "Item successfully added to the cart!";
            }
        }

        // Load the cart items from the database and display them
        private void LoadCartItems()
        {
            string userId = "1"; // Example user ID

            string connectionString = ConfigurationManager.ConnectionStrings["TechDatabaseConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT * FROM AdminCart WHERE ItemName = @UserId";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserId", userId);

                SqlDataReader reader = cmd.ExecuteReader();

                string cartItemsHtml = "";
                while (reader.Read())
                {
                    cartItemsHtml += "<div class='cart-item'>" +
                                     $"<p>{reader["ItemName"]}</p>" +
                                     $"<p>Price: Rs.{reader["Price"]}/=</p>" +
                                     $"<p>Quantity: {reader["Quantity"]}</p>" +
                                     $"<p>Total: Rs.{reader["TotalPrice"]}/=</p>" +
                                     "</div><hr />";
                }

                // Display cart items on the page
                cartItemsDiv.InnerHtml = cartItemsHtml;
            }
        }
    }
}
