using Agenda;
using Agenda.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FormularioContacto : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
            return;


        string strId = Request.QueryString["id"];
        if (string.IsNullOrEmpty(strId))
            return;
        try
        {
            int contactoId = Convert.ToInt32(strId);
            Contacto obj = ContactoBLL.GetContactoById(contactoId);

            NombreTextBox.Text = obj.Nombre;
            TelefonoTextBox.Text = obj.Telefono;
            DireccionTextBox.Text = obj.Direccion;
            ContactoIdHiddenField.Value = strId;
        }
        catch (Exception ex)
        {
            
        }
    }

    protected void SaveButton_Click(object sender, EventArgs e)
    {
        try
        {
            ErrorPanel.Visible = false;
            int contactoId = Convert.ToInt32(ContactoIdHiddenField.Value);

            Contacto obj = new Contacto()
            {
                ContactoId = contactoId,
                Nombre = NombreTextBox.Text,
                Telefono = TelefonoTextBox.Text,
                Direccion = DireccionTextBox.Text
            };

            if (contactoId == 0)
                ContactoBLL.InsertarContacto(obj);
            else
                ContactoBLL.ActualizarContacto(obj);
        }
        catch (Exception ex)
        {
            ErrorPanel.Visible = true;
            return;
        }

        Response.Redirect("~/ListaContactos.aspx");
    }
}