<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/FormularioMestre.master"
    AutoEventWireup="true" CodeBehind="Inclusao.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.Tratamentos.Parametrizacao.Inclusao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ConteudoAdicionalHeadFormulario"
    runat="server">

    <script language="javascript" type="text/javascript">

        function validarFiltrosParametrizacao(objeto, args)
        {            
            <%--var txtTipoProposta = document.getElementById('<%= txtTipoProposta.ClientID %>');--%>
            var txtDataFim = document.getElementById('<%= txtDataFim.ClientID %>');
            var txtDataInicio = document.getElementById('<%= txtDataInicio.ClientID %>');

            try {
                //var TipoProposta = txtTipoProposta.value != "";
                var DataFimInclusao = txtDataFim.value != "";
                var DataInicioInclusao = txtDataInicio.value != "";

                //if (!TipoProposta || !DataFimInclusao || !DataInicioInclusao) {
                //    args.IsValid = false;
                //    return;
                //}
                if (!DataFimInclusao || !DataInicioInclusao) {
                    args.IsValid = false;
                    return;
                }

                args.IsValid = true;
            }
            catch (e) {
                args.IsValid = false;
            }
        }


        function exibirLoading(operacao) {
            
            <%--var txtTipoProposta = document.getElementById('<%= txtTipoProposta.ClientID %>');--%>
            var txtDataFim = document.getElementById('<%= txtDataFim.ClientID %>');
            var txtDataInicio = document.getElementById('<%= txtDataInicio.ClientID %>');

            if (operacao == 'pesquisa') {
                if (DataInicio.value.length == 10) {
                    loading();
                }
            }
            else
            {
                var txtDataInicio = DataInicio.value != "";
                //var TipoProposta = txtTipoProposta.value != "";
                var DataFimInclusao = txtDataFim.value != "";
                var DataInicioInclusao = txtDataInicio.value != "";

                //if (TipoProposta && DataFimInclusao && DataInicioInclusao) {
                //    loading();                    
                //}

                if (DataFimInclusao && DataInicioInclusao) {
                    loading();                    
                }
            }
            
        }

        function loading()
        {            
            var div = document.getElementById('divLoading');
            var img = '<%= ResolveUrl("~/Imagens/aguarde.gif") %>';
                
            div.style.display = '';
            div.innerHTML = '<img src=\"' + img + '\" style=\"border:0; width:16px; height:16px;\"/>';

            setTimeout(function () {
                div.innerHTML = '<img src=\"' + img + '\" style=\"border:0; width:16px; height:16px;\"/>';
            }, 10);
        }
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="EspacoTituloPagina" runat="server">
    <glw:TituloPagina ID="aba1" titulo="Parametrizar Campanha de Renegociação" runat="server" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ConteudoFormulario" runat="server">
    <table cellpadding="0" cellspacing="0" border="0" class="secoesFormulario">
        <glw:SecaoFormulario ID="SecaoParametro" tituloSecao="Dados da parametrização" expandeContraiSecao="false" runat="server">
            <tr>
                <td>
                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tr>
                            <td class="espacamento" style="vertical-align: top; padding: 10px;">Tipo de Proposta:</td>
                            <td style="vertical-align: top; padding: 10px;" colspan="4">
                                <asp:UpdatePanel ID="updatePanel" runat="server">
                                    <ContentTemplate>
                                        <asp:DropDownList ID="caixaSelecaoTipoProposta" runat="server" Width="270px">
                                        </asp:DropDownList>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                            <asp:RequiredFieldValidator ID="rfvTipoProposta" runat="server" Display="Static" ControlToValidate="caixaSelecaoTipoProposta" ErrorMessage="Por favor, informe o tipo de proposta."></asp:RequiredFieldValidator>
                            <td class="espacamento" style="vertical-align: top; padding: 10px;">Data Início:</td>
                            <td style="vertical-align: top; padding: 10px;">
                                <glw:CaixaData ID="txtDataInicio" runat="server" Width="100px" ValidationGroup="parametros"></glw:CaixaData>
                            </td>
                            <asp:RequiredFieldValidator ID="rfvDataInicio" runat="server" Display="Static" ControlToValidate="txtDataInicio" ErrorMessage="Por favor, informe a data de início."></asp:RequiredFieldValidator>
                            <td class="espacamento" style="vertical-align: top; padding: 10px;">Data Fim:</td>
                            <td style="vertical-align: top; padding: 10px;" colspan="4">
                                <glw:CaixaData ID="txtDataFim" runat="server" Width="100px" ValidationGroup="parametros"></glw:CaixaData>
                            </td>
                            <asp:RequiredFieldValidator ID="rfvDataFim" runat="server" Display="Static" ControlToValidate="txtDataFim" ErrorMessage="Por favor, informe a data fim."></asp:RequiredFieldValidator>
                        </tr>
                        <tr>
                            <td colspan="10" style="text-align: right; padding-bottom: 10px">
                                <glw:BotaoSalvar ID="botaoSalvar" runat="server" OnClick="botaoSalvar_Click" ValidationGroup="parametros" permissoesExigidas="alterar"></glw:BotaoSalvar>
                                <glw:BotaoCancelar ID="botaoCancelar" runat="server" exibirConfirmacao="true" permissoesExigidas="mascaraVazia"></glw:BotaoCancelar>
                                <glw:BotaoSair ID="botaoSair" runat="server" permissoesExigidas="mascaraVazia"></glw:BotaoSair>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <div id="divLoading" style="display: none;"></div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </glw:SecaoFormulario>
    </table>
    <glw:SumarioValidacao ID="SumarioValidacao1" ValidationGroup="parametros" runat="server" />
    <asp:CustomValidator ID="CustomValidatorParametros" runat="server" Display="None" 
        ErrorMessage="Preencha todos os campos de dados para a parametrização."
        ClientValidationFunction="validarFiltrosParametrizacao" 
        ValidationGroup="parametros">
    </asp:CustomValidator>
</asp:Content>
