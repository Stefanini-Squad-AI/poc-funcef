<%@ Page Language="C#" 
    MasterPageFile="~/Paginas/Mestre/DialogoMestre.master" 
    AutoEventWireup="true"
    CodeBehind="PopUpImpressaoContratos.aspx.cs" 
    Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.Consultas.Contratos.PopUpImpressaoContratos" %>

<%--<asp:Content ID="conteudoAdicionalHead" runat="server" ContentPlaceHolderID="ConteudoAdicionalHead">
    <script type="text/javascript" language="javascript">
    </script>
</asp:Content>
<asp:Content ID="contentCabecalho" runat="server" ContentPlaceHolderID="ConteudoCabecalho">
    Início de Vigência da minuta de contrato
</asp:Content>
<asp:Content ID="contentConteudo" runat="server" ContentPlaceHolderID="ConteudoPrincipal">
    <table cellpadding="0" cellspacing="0" border="0" class="secoesFormulario">
        <tr style="padding-bottom: 10px;">
                <td style="width:90px">Data início vigência:</td>
                <td>
                    <glw:CaixaData ID="DataInicial" runat="server" mensagemDataInvalida="Data inválida." obrigatorio="true" tipoHoraRetorno="Padrao"></glw:CaixaData>
                </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="contentRodape" runat="server" ContentPlaceHolderID="ConteudoRodape">
    <table cellpadding="1" cellspacing="1" border="0" width="100%">
        <tr>
            <td align="center">               
                <glw:BotaoAcao ID="BotaoImprimir" runat="server" urlDaImagem="~/Imagens/imgImprimir.PNG" Text="Contrato" OnClick="BotaoImprimir_Click"></glw:BotaoAcao>
                <glw:BotaoCancelar ID="botaoCancelar" runat="server" OnClientClick="javascript:fechar()" acaoPersonalizada="true"></glw:BotaoCancelar>    
            </td>
        </tr>
    </table>
</asp:Content>--%>


<asp:content id="Content1" runat="server" contentplaceholderid="ConteudoAdicionalHead">
    <script type="text/javascript">
<%--        function msgEmBranco() {
            if (document.getElementById('<%= caixaTextoMotivo.ClientID %>').value == '') {
                alert('É obrigatório informar o motivo do abono.');
            }
        }--%>
    </script>

</asp:content>
<asp:content id="content2" runat="server" contentplaceholderid="ConteudoCabecalho">
    Data início vigência de minuta de contrato
</asp:content>
<asp:content id="content3" runat="server" contentplaceholderid="ConteudoPrincipal">
    <table>
        <tr>
            <td>
                <div id="divMotivoAbono" runat="server">
                Data início vigência:
                    <glw:CaixaData ID="DataInicial" runat="server" mensagemDataInvalida="Data inválida." obrigatorio="true" tipoHoraRetorno="Padrao"></glw:CaixaData>
                </div>
           </td>
        </tr>
    </table>
</asp:content>
<asp:content id="content4" runat="server" contentplaceholderid="ConteudoRodape">
    <glw:BotaoOk ID="botaoOk" runat="server" onClientClick="msgEmBranco();" OnClick="BotaoImprimir_Click"></glw:BotaoOk>
    &nbsp; &nbsp;
    <glw:BotaoVoltar ID="botaoVoltar" runat="server" OnClick="botaoVoltar_Click"
        acaoPersonalizada="true"></glw:BotaoVoltar>
</asp:content>
