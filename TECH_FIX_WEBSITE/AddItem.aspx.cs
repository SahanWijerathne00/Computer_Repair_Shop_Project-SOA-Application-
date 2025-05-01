using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TECH_FIX_WEBSITE
{
    public partial class AddItem : Page
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
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT CategoryName FROM Categories"; 
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    SqlDataReader reader = cmd.ExecuteReader();
                    itemCategory.DataSource = reader;
                    itemCategory.DataTextField = "CategoryName";
                    itemCategory.DataValueField = "CategoryName"; 
                    itemCategory.DataBind();
                }
            }
            itemCategory.Items.Insert(0, new ListItem("Select Category", "")); 
        }

        protected void AddItemForm_ServerClick(object sender, EventArgs e)
        {
            string category = itemCategory.SelectedValue;
            string itemNameValue = itemName.Text.Trim();
            string description = itemDescription.Text.Trim();
            string priceText = itemPrice.Text.Trim();
            string quantityText = itemQuantity.Text.Trim();
            string imagePath = string.Empty;
            string supplierUserIdValue = supplierUserId.Text.Trim();

            // Validate inputs
            if (string.IsNullOrEmpty(category) || string.IsNullOrEmpty(itemNameValue) ||
                string.IsNullOrEmpty(description) || string.IsNullOrEmpty(priceText) ||
                string.IsNullOrEmpty(quantityText) || string.IsNullOrEmpty(supplierUserIdValue) || !itemImage.HasFile)
            {
                Response.Write("<script>alert('Please fill in all fields and upload an image.');</script>");
                return;
            }

            // Try to parse price and quantity
            if (!decimal.TryParse(priceText, out decimal price) || !int.TryParse(quantityText, out int quantity))
            {
                Response.Write("<script>alert('Please enter valid numeric values for price and quantity.');</script>");
                return;
            }

  
            try
            {
                string fileName = System.IO.Path.GetFileName(itemImage.PostedFile.FileName);
                imagePath = "~/images/item/" + fileName;
                itemImage.SaveAs(Server.MapPath(imagePath));
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error uploading image: " + ex.Message + "');</script>");
                return;
            }


            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    string query = "INSERT INTO Items (Category, ItemName, Description, Price, Quantity, Image, SupplierUserID) " +
                                   "VALUES (@Category, @ItemName, @Description, @Price, @Quantity, @ImagePath, @SupplierUserId)";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Category", category);
                        cmd.Parameters.AddWithValue("@ItemName", itemNameValue);
                        cmd.Parameters.AddWithValue("@Description", description);
                        cmd.Parameters.AddWithValue("@Price", price);
                        cmd.Parameters.AddWithValue("@Quantity", quantity);
                        cmd.Parameters.AddWithValue("@ImagePath", imagePath);
                        cmd.Parameters.AddWithValue("@SupplierUserId", supplierUserIdValue);

                        cmd.ExecuteNonQuery();
                    }
                }

                Response.Write("<script>alert('Item added successfully!');</script>");
               
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error adding item: " + ex.Message + "');</script>");
            }
        }
    }
}
