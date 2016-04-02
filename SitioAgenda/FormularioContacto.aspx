<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FormularioContacto.aspx.cs" Inherits="FormularioContacto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">

    <section class="row">
        <div class="col-md-6">

            <asp:Panel ID="ErrorPanel" runat="server" Visible="false"
                CssClass="alert alert-danger" role="alert">
                Error al Guardar el contacto
            </asp:Panel>

            <div class="form-group">
                <label>Nombre</label>
                <asp:TextBox ID="NombreTextBox" runat="server"
                    CssClass="form-control">
                </asp:TextBox>
                <asp:RequiredFieldValidator runat="server"
                    ControlToValidate="NombreTextBox"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="Contacto"
                    ErrorMessage="Debe ingresar el nombre">
                </asp:RequiredFieldValidator>
            </div>
            
            <div class="form-group">
                <label>Telefono</label>
                <asp:TextBox ID="TelefonoTextBox" runat="server"
                    CssClass="form-control">
                </asp:TextBox>
                <asp:RequiredFieldValidator runat="server"
                    ForeColor="Red"
                    ControlToValidate="TelefonoTextBox"
                    Display="Dynamic"
                    ValidationGroup="Contacto"
                    ErrorMessage="Debe ingresar el telefono">
                </asp:RequiredFieldValidator>
            </div>
            
            <div class="form-group">
                <label>Direccion</label>
                <asp:TextBox ID="DireccionTextBox" runat="server"
                    TextMode="MultiLine" Rows="3"
                    CssClass="form-control">
                </asp:TextBox>
                <asp:RequiredFieldValidator runat="server"
                    ControlToValidate="TelefonoTextBox"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="Contacto"
                    ErrorMessage="Debe ingresar la dirección">
                </asp:RequiredFieldValidator>
            </div>

            <asp:LinkButton ID="SaveButton" runat="server"
                CssClass="btn btn-primary"
                ValidationGroup="Contacto"
                OnClick="SaveButton_Click">
                Guardar
            </asp:LinkButton>
            <asp:HyperLink runat="server" CssClass="btn"
                NavigateUrl="~/ListaContactos.aspx">
                Cancelar
            </asp:HyperLink>

            <asp:HiddenField ID="ContactoIdHiddenField" runat="server"
                Value="0" />
        </div>
    </section>
</asp:Content>

