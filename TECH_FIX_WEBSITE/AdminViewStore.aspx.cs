using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace TECH_FIX_WEBSITE
{
    public partial class AdminViewStore : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["TechDatabaseConnectionString"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCategories();

            }
        }

        private void LoadCategories()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT CategoryID, CategoryName FROM Categories";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    CategoryRepeater.DataSource = dt;
                    CategoryRepeater.DataBind();
                }
            }
        }

        private void LoadItems(string category)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query;
                if (category == "all")
                {
                    query = "SELECT * FROM Items";
                }
                else
                {
                    query = "SELECT * FROM Items WHERE Category = @CategoryName";
                }

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    if (category != "all")
                    {
                        cmd.Parameters.AddWithValue("@CategoryName", category); // Using Category name from Items table
                    }

                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    string itemsHtml = "";
                    while (reader.Read())
                    {
                        itemsHtml += "<div class='card'>" +
                                     $"<img src='../images/item/{reader["Image"]}' class='card-img-top' alt='{reader["ItemName"]}' onclick='openItemDetails({reader["ItemID"]})'>" +
                                     "<div class='card-body'>" +
                                     $"<h5 class='card-title'>{reader["ItemName"]}</h5>" +
                                     $"<p class='card-text'>Rs.{reader["Price"]}/=</p>" +
                                     "</div></div>";
                    }

                    Response.Write(itemsHtml); // This sends back the HTML to the AJAX call
                }
            }
        }


    }
}
