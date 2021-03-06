﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" Theme="Default" AutoEventWireup="true" CodeFile="ListaContactos.aspx.cs" Inherits="ListaContactos_" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <section class="row">
        <div class="col-md-12">

            <asp:HyperLink runat="server" NavigateUrl="~/FormularioContacto.aspx"
                CssClass="btn btn-primary">
                Crear Contacto
            </asp:HyperLink>
            <br /><br />

            <asp:GridView ID="ContactosGridView" runat="server"
                CssClass="table" GridLines="None"
                AutoGenerateColumns="false"
                OnRowCommand="ContactosGridView_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="Editar">
                        <ItemTemplate>
                            <asp:LinkButton ID="EditButton" runat="server" CommandName="Editar"
                                CommandArgument='<%# Eval("ContactoId") %>'>
                                <i class="glyphicon glyphicon-pencil"></i>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Eliminar">
                        <ItemTemplate>
                            <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Eliminar"
                                OnClientClick="return confirm('Esta seguro que desea eliminar el Contacto seleccionado?')"
                                CommandArgument='<%# Eval("ContactoId") %>'>
                                <i class="glyphicon glyphicon-remove"></i>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre Completo" />
                    <asp:BoundField DataField="Direccion" HeaderText="Dirección" />
                    <asp:BoundField DataField="Telefono" HeaderText="Teléfono" />
                </Columns>
            </asp:GridView>

        </div>
    </section>
</asp:Content>

