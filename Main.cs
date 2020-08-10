using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace Quanlybanhang
{
    public partial class Main : Form
    {
        public Main()
        {
            InitializeComponent();
        }

        private void nhânViênToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmDMChatlieu F = new frmDMChatlieu();
            
            F.Show();
            
        }
    }
}
