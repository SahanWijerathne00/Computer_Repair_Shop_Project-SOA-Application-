using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApp1
{
    public partial class AddItem : Form
    {
        private int selectedItemID;

        public AddItem()
        {
            InitializeComponent();
        }

            private void AddItem_Load(object sender, EventArgs e)
            {
                PopulateCategoryComboBox();
            }

            // Method to populate Category ComboBox from the Categories table
            private void PopulateCategoryComboBox()
            {
                string connectionString = "your_connection_string_here";
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string query = "SELECT CategoryName FROM Categories";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        SqlDataReader reader = cmd.ExecuteReader();
                        while (reader.Read())
                        {
                            comboBox2.Items.Add(reader["CategoryName"].ToString());
                        }
                    }
                }
            }

            // ADD BUTTON: Inserts new item into the database
            private void button5_Click(object sender, EventArgs e)
            {
                string connectionString = "your_connection_string_here";
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string query = "INSERT INTO Items (Category, ItemName, Description, Price, Quantity, SupplierUserID) " +
                                   "VALUES (@Category, @ItemName, @Description, @Price, @Quantity, @SupplierUserID)";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Category", comboBox2.SelectedItem.ToString());
                        cmd.Parameters.AddWithValue("@ItemName", textBox2.Text);
                        cmd.Parameters.AddWithValue("@Description", textBox7.Text);
                        cmd.Parameters.AddWithValue("@Price", Convert.ToDecimal(textBox8.Text));
                        cmd.Parameters.AddWithValue("@Quantity", Convert.ToInt32(textBox9.Text));
                        cmd.Parameters.AddWithValue("@SupplierUserID", textBox10.Text);

                        cmd.ExecuteNonQuery();
                    }
                }

                MessageBox.Show("Item added successfully.");
                ClearFields();
            }

            // VIEW BUTTON: Fetches and displays items related to a specific Supplier UserID
            private void button10_Click(object sender, EventArgs e)
            {
                if (string.IsNullOrEmpty(textBox10.Text))
                {
                    MessageBox.Show("Enter Supplier UserID to view items.");
                    return;
                }

                string connectionString = "your_connection_string_here";
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string query = "SELECT ItemID, Category, ItemName, Description, Price, Quantity, DateAdded " +
                                   "FROM Items WHERE SupplierUserID = @SupplierUserID";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@SupplierUserID", textBox10.Text);
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        dataGridView2.DataSource = dt;
                    }
                }
            }

            // Populates fields with data from the selected row in the DataGridView for editing
            private void itemsDataGridView_CellClick(object sender, DataGridViewCellEventArgs e)
            {
                if (e.RowIndex >= 0)
                {
                    DataGridViewRow row = dataGridView2.Rows[e.RowIndex];
                    comboBox2.SelectedItem = row.Cells["Category"].Value.ToString();
                    textBox2.Text = row.Cells["ItemName"].Value.ToString();
                    textBox7.Text = row.Cells["Description"].Value.ToString();
                    textBox8.Text = row.Cells["Price"].Value.ToString();
                    textBox9.Text = row.Cells["Quantity"].Value.ToString();
                    textBox10.Text = row.Cells["SupplierUserID"].Value.ToString();
                    selectedItemID = Convert.ToInt32(row.Cells["ItemID"].Value);
                }
            }

            // UPDATE BUTTON: Updates the selected item in the database
            private void button7_Click(object sender, EventArgs e)
            {
                if (selectedItemID == 0)
                {
                    MessageBox.Show("Select an item to update.");
                    return;
                }

                string connectionString = "your_connection_string_here";
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string query = "UPDATE Items SET Category = @Category, ItemName = @ItemName, Description = @Description, " +
                                   "Price = @Price, Quantity = @Quantity WHERE ItemID = @ItemID";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Category", comboBox2.SelectedItem.ToString());
                        cmd.Parameters.AddWithValue("@ItemName", textBox2.Text);
                        cmd.Parameters.AddWithValue("@Description", textBox7.Text);
                        cmd.Parameters.AddWithValue("@Price", Convert.ToDecimal(textBox8.Text));
                        cmd.Parameters.AddWithValue("@Quantity", Convert.ToInt32(textBox9.Text));
                        cmd.Parameters.AddWithValue("@ItemID", selectedItemID);

                        cmd.ExecuteNonQuery();
                    }
                }

                MessageBox.Show("Item updated successfully.");
                ClearFields();
                button10_Click(sender, e); // Refresh the grid
            }

            // DELETE BUTTON: Deletes the selected item from the database
            private void Button6_Click(object sender, EventArgs e)
            {
                if (selectedItemID == 0)
                {
                    MessageBox.Show("Select an item to delete.");
                    return;
                }

                string connectionString = "your_connection_string_here";
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string query = "DELETE FROM Items WHERE ItemID = @ItemID";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@ItemID", selectedItemID);

                        cmd.ExecuteNonQuery();
                    }
                }

                MessageBox.Show("Item deleted successfully.");
                ClearFields();
                button10_Click(sender, e); // Refresh the grid
            }

            // Clears the form fields after any operation
            private void ClearFields()
            {
                comboBox2.SelectedIndex = -1;
                textBox2.Clear();
                textBox7.Clear();
                textBox8.Clear();
                textBox9.Clear();
                textBox10.Clear();
                selectedItemID = 0;
            }

        private void button9_Click(object sender, EventArgs e)
        {
            ClearFields();
        }



        private void label8_Click(object sender, EventArgs e)
        {

        }

        private void textBox5_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox7_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox6_TextChanged(object sender, EventArgs e)
        {

        }

        private void label7_Click(object sender, EventArgs e)
        {

        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void label8_Click_1(object sender, EventArgs e)
        {

        }

       

       
            private void button6_Click(object sender, EventArgs e)
            {

            }

        private void button7_Click_1(object sender, EventArgs e)
        {

        }
    }
}
