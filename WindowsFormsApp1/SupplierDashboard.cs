using System;
using System.Windows.Forms;

namespace WindowsFormsApp1
{
    public partial class SupplierDashboard : Form
    {
        public SupplierDashboard()
        {
            InitializeComponent();
        }
        private void button4_Click(object sender, EventArgs e)
        {
            Loginpage loginPage = new Loginpage();

            loginPage.Show();
            this.Hide();
        }
        private void button1_Click(object sender, EventArgs e)
        {
            AddItem add = new AddItem();

            add.Show();
            this.Hide();
        }
        private void button2_Click(object sender, EventArgs e)
        {
            ViewOrders view = new ViewOrders();
            view.Show();
            this.Hide();
        }
        private void button3_Click(object sender, EventArgs e)
        {
            AddQuotation add = new AddQuotation();
            add.Show();
            this.Hide();
        }
    }
}
