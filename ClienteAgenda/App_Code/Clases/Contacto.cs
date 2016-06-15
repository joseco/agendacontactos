using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Agenda
{
    /// <summary>
    /// Summary description for Contacto
    /// </summary>
    public class Contacto
    {
        public int ContactoId { get; set; }
        public string Nombre { get; set; }
        public string Telefono { get; set; }
        public string Direccion { get; set; }

        public Contacto()
        {
            
        }
    }
}