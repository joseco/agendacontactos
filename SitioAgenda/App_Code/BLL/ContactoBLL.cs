using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Agenda.BLL
{
    /// <summary>
    /// Summary description for ContactoBLL
    /// </summary>
    public class ContactoBLL
    {
        public ContactoBLL()
        {
            
        }

        public static List<Contacto> GetContactos()
        {
            ContactoDSTableAdapters.ContactoTableAdapter adapter = new ContactoDSTableAdapters.ContactoTableAdapter();
            ContactoDS.ContactoDataTable table = adapter.GetContactos();

            List<Contacto> list = new List<Contacto>();
            foreach (var row in table)
            {
                Contacto obj = GetContactoFromRow(row);
                list.Add(obj);
            }

            return list;
        }

        public static void EliminarContacto(int contactoId)
        {
            if (contactoId <= 0)
                throw new ArgumentException("El id del contacto no puede ser menor o igual que cero");

            ContactoDSTableAdapters.ContactoTableAdapter adapter = new ContactoDSTableAdapters.ContactoTableAdapter();
            adapter.EliminarContacto(contactoId);
        }


        private static Contacto GetContactoFromRow(ContactoDS.ContactoRow row)
        {
            Contacto obj = new Contacto()
            {
                ContactoId = row.contactoId,
                Nombre = row.nombre,
                Telefono = row.telefono,
                Direccion = row.direccion
            };
            return obj;
        }

    }
}