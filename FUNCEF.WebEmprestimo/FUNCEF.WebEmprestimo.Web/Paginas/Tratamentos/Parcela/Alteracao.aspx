<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/FormularioMestre.master"
    AutoEventWireup="true" CodeBehind="Alteracao.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.Tratamentos.Parcela.Alteracao" %>

<%@ Register Src="~/Paginas/Tratamentos/Parcela/FormularioParcelas.ascx" TagName="userControlFormularioParcelas"
    TagPrefix="wem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ConteudoAdicionalHeadFormulario"
    runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="EspacoTituloPagina" runat="server">
    <glw:TituloPagina ID="aba1" runat="server" titulo="Lançamento e Histórico de Suspensão por Contrato" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ConteudoFormulario" runat="server">
    <wem:userControlFormularioParcelas ID="userControlFormularioParcelas" runat="server" grupoValidacao="parcelas" />
    <glw:SumarioValidacao ID="sumario" ValidationGroup="parcelas" runat="server" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ConteudoBotoesAcao" runat="server">

    <%--William Moreira da Silva SOL 235167--%>
    <table cellpadding="0" cellspacing="0" width="100%">
        <tr class="espacamento">
            <td align="left">Historico Alteração
            </td>
        </tr>
        <tr class="espacamento">
            <td>
                <div style="width: 100%; font-size: 70%; height: 200px; overflow: scroll;">
                    <glw:Grid ID="gridLogAlteracoes" runat="server" Width="850px" DataKeyNames="id" AllowSorting="true"
                        PageSize="1000">
                        <Columns>
                            <glw:CampoEntidadeComplexa DataField="descricao" HeaderText="Descrição Suspensão" />
                            <glw:CampoEntidadeComplexa DataField="usuario.nome" HeaderText="Usuário" />
                            <glw:CampoEntidadeComplexa DataField="data" HeaderText="Data/Hora" />
                        </Columns>
                    </glw:Grid>
                </div>
            </td>
        </tr>
    </table>
    <%--William Moreira da Silva SOL 235167--%>

    <glw:BotaoSalvar ID="botaoSalvar" runat="server" OnClick="botaoSalvar_Click" ValidationGroup="parcelas" permissoesExigidas="alterar"></glw:BotaoSalvar>
    <glw:BotaoCancelar ID="botaoCancelar" runat="server" exibirConfirmacao="true" permissoesExigidas="mascaraVazia"></glw:BotaoCancelar>
    <glw:BotaoSair ID="botaoSair" runat="server" permissoesExigidas="mascaraVazia"></glw:BotaoSair>
</asp:Content>
