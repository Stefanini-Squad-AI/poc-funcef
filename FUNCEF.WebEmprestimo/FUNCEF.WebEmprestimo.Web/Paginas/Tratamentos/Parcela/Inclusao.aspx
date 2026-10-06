<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/FormularioMestre.master"
    AutoEventWireup="true" CodeBehind="Inclusao.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.Tratamentos.Parcela.Inclusao" %>

<%@ Register Src="~/Paginas/Tratamentos/Parcela/FormularioParcelas.ascx" TagName="userControlFormularioParcelas"
    TagPrefix="wem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ConteudoAdicionalHeadFormulario" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="EspacoTituloPagina" runat="server">
    <glw:TituloPagina ID="aba1" runat="server" titulo="Lançamento e Histórico de Suspensão por Contrato" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ConteudoFormulario" runat="server">
    <wem:userControlFormularioParcelas ID="userControlFormularioParcelas" runat="server" grupoValidacao="parcelas" />
    <glw:SumarioValidacao ID="sumario" ValidationGroup="parcelas" runat="server" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ConteudoBotoesAcao" runat="server">
    <glw:BotaoSalvar ID="botaoSalvar" runat="server" OnClick="botaoSalvar_Click" ValidationGroup="parcelas" permissoesExigidas="alterar"></glw:BotaoSalvar>
    <glw:BotaoCancelar ID="botaoCancelar" runat="server" exibirConfirmacao="true" permissoesExigidas="mascaraVazia"></glw:BotaoCancelar>
    <glw:BotaoSair ID="botaoSair" runat="server" permissoesExigidas="mascaraVazia"></glw:BotaoSair>
</asp:Content>
