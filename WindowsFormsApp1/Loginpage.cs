using System;
using System.Windows.Forms;

namespace WindowsFormsApp1
{
    public partial class Loginpage : Form
    {
        public Loginpage()
        {
            InitializeComponent();
        }
        private void button1_Click(object sender, EventArgs e)
        {
            AdminLoginpage loginPage = new AdminLoginpage();

            loginPage.Show();
            this.Hide();
        }
        private void button2_Click(object sender, EventArgs e)
        {
            SupplierLoginpage loginPage = new SupplierLoginpage();

            loginPage.Show();
            this.Hide();
        }
        private void button3_Click(object sender, EventArgs e)
        {
            Home loginPage = new Home();

            loginPage.Show();
            this.Hide();
        }
    }
}
