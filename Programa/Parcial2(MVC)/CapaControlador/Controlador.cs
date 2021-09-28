using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Odbc;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CapaModelo;

namespace CapaControlador
{
    public class Controlador
    {
         Sentencias gg = new Sentencias();

        public DataTable llenarTblEmpleado(string tabla)
        {
            OdbcDataAdapter dt = gg.llenarTblEmpleado(tabla);
            DataTable table = new DataTable();
            dt.Fill(table);
            return table;
        }
        public void registrarEmpleado(string pkIdInventarioDePersonal, string nombre, string apellido, string correo, string direccion, string añosDeExperiencia, string telefono)
        {
            gg.registrarEmpleado(pkIdInventarioDePersonal, nombre, apellido, correo, direccion, añosDeExperiencia, telefono);
        }
        public DataTable llenarTblDetalle(string tabla)
        {
            OdbcDataAdapter dt = gg.llenarTblDetalle(tabla);
            DataTable table = new DataTable();
            dt.Fill(table);
            return table;
        }
        public void registrarDetalle(string pkIdDesarrollodecarrera, string observaciones, string aspiracionSueldo, string ausencias, string pkIdInventarioDePersonal)
        {
            gg.registrarDetalle(pkIdDesarrollodecarrera, observaciones, aspiracionSueldo, ausencias, pkIdInventarioDePersonal);
        }
    }


}