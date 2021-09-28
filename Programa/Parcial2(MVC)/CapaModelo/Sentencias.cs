using System;
using System.Collections.Generic;
using System.Data.Odbc;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaModelo
{
    public class Sentencias
    {
        private Conexion cn = new Conexion();

        public void registrarEmpleado(string pkIdInventarioDePersonal, string nombre, string apellido, string correo, string direccion, string añosDeExperiencia, string telefono)
        {
            string sql = "INSERT INTO inventariodepersonal (pkIdInventarioDePersonal, nombre, apellido, correo, direccion, añosDeExperiencia, telefono) Values('" + pkIdInventarioDePersonal + "', '" + nombre + "' , '" + apellido + "', '" + correo + "', '" + direccion + "', '" + añosDeExperiencia + "', '" + telefono + "');";
                OdbcCommand consulta = new OdbcCommand(sql, cn.conexion());
                consulta.ExecuteNonQuery();
 
        }
        public OdbcDataAdapter llenarTblDetalle(string tabla)
        {
 
            string sql = "call consultaDetalles();";
            OdbcDataAdapter dataTable = new OdbcDataAdapter(sql, cn.conexion());
            return dataTable;
        }
        public void registrarDetalle(string pkIdDesarrollodecarrera, string observaciones, string aspiracionSueldo, string ausencias, string pkIdInventarioDePersonal)
        {
            string sql = "INSERT INTO detallesempleado (pkIdDesarrollodecarrera, observaciones, aspiracionSueldo, ausencias, pkIdInventarioDePersonal) Values('" + pkIdDesarrollodecarrera + "', '" + observaciones + "' , '" + aspiracionSueldo + "', '" + ausencias + "', '" + pkIdInventarioDePersonal + "');";
                OdbcCommand consulta = new OdbcCommand(sql, cn.conexion());
                consulta.ExecuteNonQuery();
            }
        public OdbcDataAdapter llenarTblEmpleado(string tabla)
        {

            string sql = "call consultaEmpleado();";
            OdbcDataAdapter dataTable = new OdbcDataAdapter(sql, cn.conexion());
            return dataTable;
        }
    }
}