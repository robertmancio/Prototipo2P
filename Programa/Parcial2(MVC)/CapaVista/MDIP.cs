using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CapaVista
{
    public partial class MDIP : Form
    {
        public MDIP()
        {
            InitializeComponent();
            CenterToScreen();
            this.WindowState = FormWindowState.Maximized;
        }


        private void registrarEmpleado_Click(object sender, EventArgs e)
        {
            frmRegistrarEmpleado form3 = new frmRegistrarEmpleado();
            form3.MdiParent = this.MdiParent;

            form3.Show();
        }

        private void btnAplicacion_Click(object sender, EventArgs e)
        {
            frmDetalleEmp form3 = new frmDetalleEmp();
            form3.MdiParent = this.MdiParent;

            form3.Show();
        }

    }
}