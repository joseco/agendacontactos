using Agenda;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListaContactos_ : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
            CargarLista();
    }

    private void CargarLista()
    {
        try
        {
            string url = ConfigurationManager.AppSettings["WsUrl"];


            ServicioAgenda.ContactoWebServiceSoapClient client = string.IsNullOrEmpty(url) ?
                new ServicioAgenda.ContactoWebServiceSoapClient() :
                new ServicioAgenda.ContactoWebServiceSoapClient("ContactoWebServiceSoap", url + "/WebServices/ContactoWebService.asmx");
            ServicioAgenda.Contacto[] contactosFromWS = client.GetContactos();

            List<Contacto> contactos = new List<Contacto>();
            foreach (var item in contactosFromWS)
            {
                contactos.Add(new Contacto()
                {
                    Nombre = item.Nombre,
                    Telefono = item.Telefono,
                    Direccion = item.Direccion,
                    ContactoId = item.ContactoId
                });
            }
            ContactosGridView.DataSource = contactos;
            ContactosGridView.DataBind();
        }
        catch (Exception ex)
        {

        }
    }


    protected void ContactosGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName == "Eliminar")
        {
            try
            {
                int contactoId = Convert.ToInt32(e.CommandArgument);
                //ContactoBLL.EliminarContacto(contactoId);
                CargarLista();
            }
            catch (Exception ex)
            {
                
            }
        }

        if(e.CommandName == "Editar")
        {
            Response.Redirect("~/FormularioContacto.aspx?id=" + e.CommandArgument.ToString());
        }
    }
}