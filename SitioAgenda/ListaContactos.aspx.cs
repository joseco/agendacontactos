using Agenda;
using Agenda.BLL;
using System;
using System.Collections.Generic;
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
            List<Contacto> contactos = ContactoBLL.GetContactos();
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
                ContactoBLL.EliminarContacto(contactoId);
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