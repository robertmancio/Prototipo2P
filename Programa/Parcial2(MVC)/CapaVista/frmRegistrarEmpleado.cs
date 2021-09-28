using CapaControlador;
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
    public partial class frmRegistrarEmpleado : Form
    {
        Controlador cn = new Controlador();
        public frmRegistrarEmpleado()
        {
            InitializeComponent();
            CenterToScreen();
        }

        private void btnRegistrarEmpleado_Click(object sender, EventArgs e)
        {
            Controlador s = new Controlador();
            s.registrarEmpleado(txtIdEmpleado.Text, txtNombre.Text, txtApellido.Text, txtCorreo.Text, txtDireccion.Text, txtAños.Text, txtTelefono.Text);

        }

        private void button1_Click(object sender, EventArgs e)
        {
            DataTable data = cn.llenarTblEmpleado("");
            dtgEmpleado.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dtgEmpleado.DataSource = data;    
        }
    }
}