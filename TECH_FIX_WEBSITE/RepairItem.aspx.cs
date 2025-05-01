using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace TECH_FIX_WEBSITE
{
    public partial class RepairItem : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void CreateRepairBtn_Click(object sender, EventArgs e)
        {           
            string customerNameValue = customerName.Text; 
            string repairItemName = repairItem.Text; 
            string descriptionText = description.Text; 

            
            string repairDateText = repairDate.Text; 
            DateTime parsedRepairDate; 
            
            if (!DateTime.TryParse(repairDateText, out parsedRepairDate))
            {
               
                SuccessMessage.Text = "Invalid date format.";
                SuccessMessage.Visible = true;
                return;
            }

            string statusValue = status.SelectedValue;
           
            if (SaveRepairItem(customerNameValue, repairItemName, descriptionText, parsedRepairDate, statusValue))
            {
               
                SuccessMessage.Text = "Repair item created successfully!";
                SuccessMessage.Visible = true;
              
                ClearFields();
            }
            else
            {
                SuccessMessage.Text = "Error occurred while creating the repair item.";
                SuccessMessage.Visible = true;
            }
        }

        protected void HomeButton_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("AdminDashboard.aspx"); // 
        }

        private bool SaveRepairItem(string customerName, string repairItem, string description, DateTime repairDate, string status)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["TechDatabaseConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO RepairItems (CustomerName, RepairItem, Description, RepairDate, Status) " +
                               "VALUES (@CustomerName, @RepairItem, @Description, @RepairDate, @Status)";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@CustomerName", customerName);
                    command.Parameters.AddWithValue("@RepairItem", repairItem);
                    command.Parameters.AddWithValue("@Description", description);
                    command.Parameters.AddWithValue("@RepairDate", repairDate);
                    command.Parameters.AddWithValue("@Status", status);

                    connection.Open();
                    try
                    {
                        command.ExecuteNonQuery();
                        return true; 
                    }
                    catch
                    {
                        return false; 
                    }
                }
            }
        }
     private void ClearFields()
        {
            customerName.Text = string.Empty;
            repairItem.Text = string.Empty;
            description.Text = string.Empty;
            repairDate.Text = string.Empty; 
            status.SelectedIndex = 0; 
        }

      
    }
}
