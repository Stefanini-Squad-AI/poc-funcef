<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/FormularioMestre.master"
    AutoEventWireup="true" CodeBehind="Confirmacao.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.Mensagens.Confirmacao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ConteudoAdicionalHeadFormulario"
    runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="EspacoTituloPagina" runat="server">
    <glw:TituloPagina titulo="Alerta de operação" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ConteudoFormulario" runat="server">
    <table cellpadding="0" cellspacing="0" border="0" class="secoesFormulario">
        <glw:SecaoFormulario ID="secaoPrincipal" tituloSecao="Alerta" expandeContraiSecao="false"
            runat="server">
            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr>
                    <td>
                        <div style="width: 100%; text-align: center;">
                            <br />
                            <br />
                            <asp:Label ID="labelMensagem" CssClass="textoAlerta" runat="server"></asp:Label>
                            <br />
                            <br />
                            <br />
                        </div>
                    </td>
                </tr>
            </table>
        </glw:SecaoFormulario>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ConteudoBotoesAcao" runat="server">
    <glw:BotaoVoltar ID="botaoVoltar" tagImagem="botaoOk" Text="Ok" runat="server"></glw:BotaoVoltar>
</asp:Content>
