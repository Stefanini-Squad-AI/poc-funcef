<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/FormularioMestre.master"
    AutoEventWireup="true" CodeBehind="Visualizacao.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.Transacoes.Quitacao.Visualizacao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ConteudoAdicionalHeadFormulario"
    runat="server">
    <link rel="Stylesheet" href="../../../CssDinamico/jquery-ui.min.css" />
    <script type="text/javascript" src="../../../Scripts/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../../../Scripts/jquery-ui.min.js"></script>
    <script type="text/javascript" src="../../../Scripts/jquery.blockUI.js"></script>
    <script language="javascript" type="text/javascript">
        //Jessica Y. Oshiro - SOL 235314-18140 -INICIO
        function ValidaData()
        {
            var ValorData = $("#<%= caixaTextoData.ClientID %>").val();
            var util = ""

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '<%= ResolveUrl("~/Paginas/transacoes/Quitacao/Visualizacao.aspx/verificaData") %>',
                data: "{dataQuitacao:'" + ValorData + "'}",
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
                alert("A data de quitação deve ser um dia útil .");                
            }
        }
        //Jessica Y. Oshiro - SOL 235314-18140 -FIM

        //Saulo Cirineu
        function bloqueiaInterface() {
            $.blockUI({ message: '<img src="../../../Imagens/aguarde.gif" /><h1 style="font-size: 14px"> Buscando itens em atraso...</h1>', css: { border: 'none', padding: '15px', opacity: '0.9', width: '200px', height: '50px' } });
        }

    </script> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="EspacoTituloPagina" runat="server">
    <glw:TituloPagina ID="aba1" runat="server" titulo="Quitação Antecipada / por Falecimento" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ConteudoFormulario" runat="server">
    <table cellpadding="1" cellspacing="0" border="0" width="100%">
        <tr>
            <td style="padding-left:2%">
                <table cellpadding="0" cellspacing="0" class="tableSecao">
                    <tr>
                        <td class="espacamento" style="width: 150px;">
                            Nº Contrato:
                        </td>
                        <td>
                            <asp:Label ID="labelNumContrato" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                        <td style="width: 120px;">
                            Mutuário:
                        </td>
                        <td>
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
                            Data da Quitação:
                        </td>
                        <td>
                             <%--Alteração:ValidaData Jessica Y. Oshiro - SOL 235314-18140--%>
                             <%--<glw:CaixaData ID="caixaTextoData" runat="server"></glw:CaixaData>--%>
                            <glw:CaixaData ID="caixaTextoData" runat="server" onchange="ValidaData()"></glw:CaixaData>
                            <div>
                                <asp:RequiredFieldValidator ID="validadorData" runat="server" ControlToValidate="caixaTextoData"
                                    ErrorMessage="O campo Data da Quitação é obrigatório." SetFocusOnError="true" Display="Dynamic"
                                    ValidationGroup="quitacao">
                                </asp:RequiredFieldValidator>                                                                                                
                            </div>
                        </td>
                    </tr>
                    <tr id="trFalecimento" runat="server">
                        <td class="espacamento">
                            Data de Falecimento:
                        </td>
                        <td>
                            <asp:Label ID="labelDataFalecimento" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td  class="espacamento" colspan="4" style="border-top: dotted 1px rgb(215, 215, 215); padding-top:5px">
                            <asp:CheckBox ID="caixaSelecaoExcepcional" runat="server" Text="Excepcional" style="color: Red;" />
                        </td>
                    </tr>
                    <tr>
                        <td class="espacamento" colspan="4">
                            <asp:CheckBox ID="caixaSelecaoCampanhaInad" runat="server" Text="Política de Renegociação" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <glw:SumarioValidacao ID="sumario" ValidationGroup="quitacao" runat="server" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ConteudoBotoesAcao" runat="server">
    <glw:BotaoAcao ID="botaoContinuar" runat="server" permissoesExigidas="incluir" tagImagem="botaoProximo" Text="Continuar" OnClientClick="bloqueiaInterface()" OnClick="botaoContinuar_Click" ValidationGroup="quitacao"></glw:BotaoAcao>
    <glw:BotaoVoltar ID="botaoVoltar" runat="server" urlVoltar="Listagem.aspx" permissoesExigidas="mascaraVazia"></glw:BotaoVoltar>
    <glw:BotaoSair ID="botaoSair" runat="server" permissoesExigidas="mascaraVazia"></glw:BotaoSair>
</asp:Content>
