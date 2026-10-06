<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/FormularioMestre.master"
    AutoEventWireup="true" CodeBehind="Visualizacao.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.Transacoes.Amortizacao.Visualizacao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ConteudoAdicionalHeadFormulario"
    runat="server">
        <script language="javascript" type="text/javascript">

            //Jessica Y. Oshiro - SOL 235314-18140 -INICIO
            function ValidaData() {

            var ValorData = $("#<%= caixaTextoData.ClientID %>").val();
            var util = ""

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '<%= ResolveUrl("~/Paginas/transacoes/Amortizacao/Visualizacao.aspx/verificaData") %>',
                data: "{dataAmortizacao:'" + ValorData + "'}",
                dataType: 'json',
                async: false,
                success: function (data, status) {
                    util = data.d;
                },
                error: function (XHR, errStatus, errorThrown) {
                    alert('Erro ao verificar data util.');
                }
            });

            if (!util) {
                alert("A data de amortizacao deve ser um dia útil .");
            }
        }
            //Jessica Y. Oshiro - SOL 235314-18140 -FIM
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="EspacoTituloPagina" runat="server">
    <glw:TituloPagina ID="aba1" runat="server" titulo="Amortização / Refinanciamento" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ConteudoFormulario" runat="server">
    <table cellpadding="1" cellspacing="0" border="0" width="100%">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" class="tableSecao">
                    <tr>
                        <td class="espacamento" style="width: 150px;">
                            Nº Contrato:
                        </td>
                        <td >
                            <asp:Label ID="labelNumContrato" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                        <td style="width: 120px;">
                            Mutuário:
                        </td>
                        <td style="width: 230px;">
                            <asp:Label ID="labelMutuario" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="espacamento">
                            Matrícula:
                        </td>
                        <td>
                            <asp:Label ID="labelMatricula" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                        <td>
                            CPF:
                        </td>
                        <td>
                            <asp:Label ID="labelCPF" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="espacamento">
                            Situação do Participante:
                        </td>
                        <td>
                            <asp:Label ID="labelSituacao" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                        <td>
                            Plano Previdenciário:
                        </td>
                        <td>
                            <asp:Label ID="labelPlano" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="espacamento">
                            Patrocinadora:
                        </td>
                        <td>
                            <asp:Label ID="labelPatrocinadora" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                        <td>
                            Tipo de Empréstimo:
                        </td>
                        <td>
                            <asp:Label ID="labelTipoEmprestimo" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="espacamento">
                            Tipo de Contrato:
                        </td>
                        <td>
                            <asp:Label ID="labelTipoContrato" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                        <td>
                            Indexador:
                        </td>
                        <td>
                            <asp:Label ID="labelIndexador" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="espacamento">
                            Data da Assinatura:
                        </td>
                        <td>
                            <asp:Label ID="labelDataAssinatura" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                        <td>
                            Data do Crédito:
                        </td>
                        <td>
                            <asp:Label ID="labelDataCredito" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="espacamento">
                            Data da 1ª Parcela:
                        </td>
                        <td>
                            <asp:Label ID="labelDataPrimeiraParcela" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                        <td>
                            Taxa de Juros:
                        </td>
                        <td>
                            <asp:Label ID="labelTaxaJuros" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="espacamento">
                            Vlr. Solicitado:
                        </td>
                        <td>
                            <asp:Label ID="labelValorSolicitado" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                        <td>
                            Num. Parcelas:
                        </td>
                        <td>
                            <asp:Label ID="labelNumParcelas" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="espacamento">
                            Vlr. da Parcela:
                        </td>
                        <td>
                            <asp:Label ID="labelValorParcela" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                        <td>
                            Dt. Amortização:
                        </td>
                        <td>
                             <%--Alteração:ValidaData Jessica Y. Oshiro - SOL 235314-18140--%>
                             <%--<glw:CaixaData ID="CaixaData1" runat="server"></glw:CaixaData>--%>
                            <glw:CaixaData ID="caixaTextoData" runat="server" onchange="ValidaData()"></glw:CaixaData>                           
                            <div>
                                <asp:RequiredFieldValidator ID="validadorData" runat="server" ControlToValidate="caixaTextoData"
                                    ErrorMessage="O campo Dt. Amortização é obrigatório." SetFocusOnError="true" Display="Dynamic"
                                    ValidationGroup="amortizacao">
                                </asp:RequiredFieldValidator>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="espacamento" colspan="4">
                            <asp:CheckBox ID="caixaSelecaoExcepcional" runat="server" Text="Excepcional" style="color: Red;" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <glw:SumarioValidacao ID="sumario" ValidationGroup="amortizacao" runat="server" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ConteudoBotoesAcao" runat="server">
    <glw:BotaoAcao ID="botaoContinuar" runat="server" permissoesExigidas="incluir" tagImagem="botaoProximo" Text="Continuar" OnClick="botaoContinuar_Click" ValidationGroup="amortizacao"></glw:BotaoAcao>
    <glw:BotaoVoltar ID="botaoVoltar" runat="server" urlVoltar="Listagem.aspx" permissoesExigidas="mascaraVazia"></glw:BotaoVoltar>
    <glw:BotaoSair ID="botaoSair" runat="server" permissoesExigidas="mascaraVazia"></glw:BotaoSair>
</asp:Content>
