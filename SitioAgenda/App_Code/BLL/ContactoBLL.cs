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

        public static Contacto GetContactoById(int contactoId)
        {
            if (contactoId <= 0)
                throw new ArgumentException("El id del contacto no puede ser menor o igual que cero");

            ContactoDSTableAdapters.ContactoTableAdapter adapter = new ContactoDSTableAdapters.ContactoTableAdapter();
            ContactoDS.ContactoDataTable table = adapter.GetContactoById(contactoId);
            
            Contacto obj = GetContactoFromRow(table[0]);

            return obj;
        }


        public static void EliminarContacto(int contactoId)
        {
            if (contactoId <= 0)
                throw new ArgumentException("El id del contacto no puede ser menor o igual que cero");

            ContactoDSTableAdapters.ContactoTableAdapter adapter = new ContactoDSTableAdapters.ContactoTableAdapter();
            adapter.EliminarContacto(contactoId);
        }

        public static int InsertarContacto(Contacto obj)
        {
            if(obj == null)
            {
                throw new ArgumentException("El objeto no puede ser nulo");
            }

            if (string.IsNullOrEmpty(obj.Nombre))
            {
                throw new ArgumentException("El nombre no puede ser nulo o vacio");
            }

            if (string.IsNullOrEmpty(obj.Telefono))
            {
                throw new ArgumentException("El Telefono no puede ser nulo o vacio");
            }

            if (string.IsNullOrEmpty(obj.Direccion))
            {
                throw new ArgumentException("El Direccion no puede ser nulo o vacio");
            }

            int? id = 0;
            ContactoDSTableAdapters.ContactoTableAdapter adapter = new ContactoDSTableAdapters.ContactoTableAdapter();
            adapter.InsertarContacto(obj.Nombre,
                                    obj.Telefono,
                                    obj.Direccion,
                                    ref id);

            if (id == null || id <= 0)
                throw new Exception("La llave primaria no se generó correctamente");

            return id.Value;

        }


        public static void ActualizarContacto(Contacto obj)
        {
            if (obj == null)
            {
                throw new ArgumentException("El objeto no puede ser nulo");
            }

            if(obj.ContactoId <= 0)
            {
                throw new ArgumentException("El id del contacto no puede ser menor o igual que cero");
            }

            if (string.IsNullOrEmpty(obj.Nombre))
            {
                throw new ArgumentException("El nombre no puede ser nulo o vacio");
            }

            if (string.IsNullOrEmpty(obj.Telefono))
            {
                throw new ArgumentException("El Telefono no puede ser nulo o vacio");
            }

            if (string.IsNullOrEmpty(obj.Direccion))
            {
                throw new ArgumentException("El Direccion no puede ser nulo o vacio");
            }
            
            ContactoDSTableAdapters.ContactoTableAdapter adapter = new ContactoDSTableAdapters.ContactoTableAdapter();
            adapter.ActualizarContacto(obj.Nombre,
                                    obj.Telefono,
                                    obj.Direccion,
                                    obj.ContactoId);
            

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