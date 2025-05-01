using System;
using System.Windows.Forms;

namespace WindowsFormsApp1
{
    public partial class Home : Form
    {
        public Home()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {
            // Label click event (if needed)
        }

        private void button1_Click(object sender, EventArgs e)
        {
           
            Loginpage loginPage = new Loginpage();
            
            loginPage.Show();
             this.Hide();
        }
    }
}
