using Agenda;
using Agenda.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// Summary description for ContactoWebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class ContactoWebService : System.Web.Services.WebService
{

    public ContactoWebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }
    
    [WebMethod]
    public int InsertarContacto(string nombre, string telefono, string direccion)
    {
        Contacto obj = new Contacto()
        {
            Nombre = nombre,
            Telefono = telefono,
            Direccion = direccion
        };
        int id = -1;
        try
        {
            id = ContactoBLL.InsertarContacto(obj);
        }
        catch (Exception ex)
        {
            
        }
        return id;
    }

    [WebMethod]
    public List<Contacto> GetContactos()
    {
        List<Contacto> list = null;
        try
        {
            list = ContactoBLL.GetContactos();
        }
        catch (Exception ex)
        {
            list = new List<Contacto>();
        }
        return list;
    }

    [WebMethod]
    public string HelloWorld()
    {
        return "Hello World";
    }

}
