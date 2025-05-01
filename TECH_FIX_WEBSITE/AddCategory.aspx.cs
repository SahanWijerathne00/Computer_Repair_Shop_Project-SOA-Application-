using System;
using System.Configuration; 
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TECH_FIX_WEBSITE
{
    public partial class AddCategory : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void AddCategoryButton_Click(object sender, EventArgs e)
        {
            string categoryName = CategoryName.Text.Trim();


            if (string.IsNullOrEmpty(categoryName))
            {
                ErrorMessage.Text = "Please enter a category name.";
                ErrorMessage.Visible = true;
                return;
            }          
            try
            {
                
                string connectionString = ConfigurationManager.ConnectionStrings["TechDatabaseConnectionString"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string query = "INSERT INTO Categories (CategoryName) VALUES (@CategoryName)";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@CategoryName", categoryName);

                        cmd.ExecuteNonQuery();
                    }
                }

                SuccessMessage.Text = "Category added successfully!";
                SuccessMessage.Visible = true;
                ErrorMessage.Visible = false;

                CategoryName.Text = "";

            }
            catch (Exception ex)
            {
                ErrorMessage.Text = "Error adding category: " + ex.Message;
                ErrorMessage.Visible = true;
            }
        }

        protected void ViewAllCategoriesButton_Click(object sender, EventArgs e)
        {
            LoadCategories();
        }

        private void LoadCategories()
        {
          
            CategoriesGridView.Visible = true;
            CategoriesGridView.DataSource = null;

            // Load categories from the database
            try
            {
                
                string connectionString = ConfigurationManager.ConnectionStrings["TechDatabaseConnectionString"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string query = "SELECT CategoryId, CategoryName FROM Categories";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        SqlDataReader reader = cmd.ExecuteReader();
                        CategoriesGridView.DataSource = reader;
                        CategoriesGridView.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                ErrorMessage.Text = "Error loading categories: " + ex.Message;
                ErrorMessage.Visible = true;
            }
        }

        protected void CategoriesGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                int categoryId = Convert.ToInt32(e.CommandArgument);

                // Remove the category from the database
                try
                {
                 
                    string connectionString = ConfigurationManager.ConnectionStrings["TechDatabaseConnectionString"].ConnectionString;

                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        conn.Open();
                        string query = "DELETE FROM Categories WHERE CategoryId = @CategoryId";
                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@CategoryId", categoryId);
                            cmd.ExecuteNonQuery();
                        }
                    }

                    LoadCategories();
                }
                catch (Exception ex)
                {
                    ErrorMessage.Text = "Error removing category: " + ex.Message;
                    ErrorMessage.Visible = true;
                }
            }
        }
    }
}
