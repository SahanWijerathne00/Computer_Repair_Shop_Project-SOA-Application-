using System;
using System.Data.SqlClient;
using System.Configuration;

namespace TECH_FIX_WEBSITE
{
    public partial class GetItemsByCategory : System.Web.UI.Page
    {
        protected void load(object sender, EventArgs e)
        {
            string categoryName = Request.QueryString["CategoryID"];

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
                cmd.Parameters.AddWithValue("@CategoryName", categoryName);

                SqlDataReader reader = cmd.ExecuteReader();

                string itemsHtml = "";
                while (reader.Read())
                {
                    itemsHtml += "<div class='card'>" +
                                 $"<img src='../admin/{reader["Image"]}' class='card-img-top' alt='{reader["ItemName"]}'>" +
                                 "<div class='card-body'>" +
                                 $"<h5 class='card-title'>{reader["ItemName"]}</h5>" +
                                 $"<p class='card-text'>Rs.{reader["Price"]}/=</p>" +
                                 $"<button class='btn btn-primary' onclick='addToCart(\"{reader["ItemName"]}\", \"{reader["Image"]}\", {reader["Price"]})'>Order</button>" +
                                 "</div></div>";
                }

                Response.Write(itemsHtml);
            }
        }
    }
}
