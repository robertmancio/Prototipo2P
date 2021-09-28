using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Odbc;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CapaControlador;

namespace CapaVista
{
    public partial class frmDetalleEmp : Form
    {
        Controlador conAplicacion = new Controlador();
        Controlador cn = new Controlador();
        //string Usuario = "";
        public frmDetalleEmp()
        {
            InitializeComponent();
            CenterToScreen();
           
        }
        private void btnRegistrarEmpleado_Click(object sender, EventArgs e)
        {
            Controlador s = new Controlador();
            s.registrarDetalle(txtIdDesarrollo.Text, txtObservaciones.Text, txtAspiracion.Text, txtAusencias.Text, txtInvent.Text);

        }
        private void button1_Click(object sender, EventArgs e)
        {
            DataTable data = cn.llenarTblDetalle("");
            dtgDetalle.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dtgDetalle.DataSource = data;
        }

    }
}
