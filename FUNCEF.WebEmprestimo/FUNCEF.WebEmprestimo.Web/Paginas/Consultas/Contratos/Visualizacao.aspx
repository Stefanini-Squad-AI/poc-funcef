<%--SIG 62003.69601
    Autor: Marcelo Valério Ferreira
  
    Descrição:
    Inclusão do sistema de amortização
--%>

<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/FormularioMestre.master"
    AutoEventWireup="true" CodeBehind="Visualizacao.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.Consultas.Contratos.Visualizacao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ConteudoAdicionalHeadFormulario"
    runat="server">

    <%--william moreira da Silva SOL 235173--%>
    <style type="text/css">
        /*William Moreira da Silva - SOL 224034/17909*/
        .lblAcordoJudicial {
            color: #DAA520;
            font-size: 10pt;
        }
        /*William Moreira da Silva - SOL 224034/17909*/

        .textosgrid1 {
            font-weight: normal;
            color: #000000;
            font-size: 10px;
            font-family: Verdana, Arial, Helvetica, sans-serif;
            text-decoration: none;
            text-align: left;
            vertical-align: middle;
            padding: 3px 4px 3px 4px;
            background-color: #e6e6e6;
            cursor: pointer;
        }

        /*William Moreira da Silva SOL 235167*/
        .barraFixa th {
            text-align: center;
        }
    </style>

    <script language="javascript" type="text/javascript">

        function getTab(sender, args) {
            var indexTab = 0;
            var nomeTab;

            indexTab = sender.get_activeTabIndex();
            nomeTab = sender.get_activeTab().get_headerText();
            document.getElementById('<%= hdnTabAtiva.ClientID %>').value = sender.get_activeTab().get_headerText();
        }

        function validarFiltros(objeto, args) {

            var caixaSelecaoItensEnvio = document.getElementById('<%= caixaSelecaoItensEnvio.ClientID %>');
            var caixaSelecaoItensInternos = document.getElementById('<%= caixaSelecaoItensInternos.ClientID %>');
            var caixaSelecaoAtualizacaoDiaria = document.getElementById('<%= caixaSelecaoAtualizacaoDiaria.ClientID %>');
            var comboEventos = document.getElementById('<%= comboEventos.ClientID %>');
            var comboItens = document.getElementById('<%= comboItens.ClientID %>');
            var caixaTextoDataMovimentacaoDataPrevistaDe = document.getElementById('<%= caixaTextoDataMovimentacaoDataPrevistaDe.ClientID %>');
            var caixaTextoDataMovimentacaoDataPrevistaAte = document.getElementById('<%= caixaTextoDataMovimentacaoDataPrevistaAte.ClientID %>');
            var caixaTextoNumeroParcela = document.getElementById('<%= caixaTextoNumeroParcela.ClientID %>');
            var comboOrdenacao = document.getElementById('<%= comboOrdenacao.ClientID %>');
            var caixaTextoDataMovimentacaoMesCobrancaDe = document.getElementById('<%= caixaTextoDataMovimentacaoMesCobrancaDe.ClientID %>');
            var caixaTextoDataMovimentacaoMesCobrancaAte = document.getElementById('<%= caixaTextoDataMovimentacaoMesCobrancaAte.ClientID %>');

            try {
                var possuiItensEnvio = caixaSelecaoItensEnvio.checked != false;
                var possuiItensInternos = caixaSelecaoItensInternos.checked != false;
                var possuiAtualizacaoDiaria = caixaSelecaoAtualizacaoDiaria.checked != false;
                var possuiEventos = comboEventos.selectedIndex != "0";
                var possuiItens = comboItens.selectedIndex != "0";
                var possuiDataMovimentacaoDataPrevistaDe = caixaTextoDataMovimentacaoDataPrevistaDe.value != "";
                var possuiDataMovimentacaoDataPrevistaAte = caixaTextoDataMovimentacaoDataPrevistaAte.value != "";
                var possuiNumeroParcela = caixaTextoNumeroParcela.value != "";
                var possuiOrdenacao = comboOrdenacao.value != "0";
                var possuiDataMovimentacaoMesCobrancaDe = caixaTextoDataMovimentacaoMesCobrancaDe.value != "__/____";
                var possuiDataMovimentacaoMesCobrancaAte = caixaTextoDataMovimentacaoMesCobrancaAte.value != "__/____";

                if (!possuiItensEnvio && !possuiItensInternos && !possuiEstorno && !possuiEmAberto && !possuiAtualizacaoDiaria && !possuiEventos && !possuiItens && !possuiDataMovimentacaoDataPrevistaDe && !possuiDataMovimentacaoDataPrevistaAte && !possuiNumeroParcela && !possuiOrdenacao && !possuiDataMovimentacaoMesCobrancaDe && !possuiDataMovimentacaoMesCobrancaAte) {
                    args.IsValid = false;
                    return;
                }

                args.IsValid = true;
            }
            catch (e) {
                args.IsValid = false;
            }
        }

        //function abrePopUpImpressaoContratos() {
        //    var url = "PopUpImpressaoContratos.aspx";
        //    var retorno = false;

        //    retorno = exibirDialogo(url, 500, 200);
        //}
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="EspacoTituloPagina" runat="server">
    <glw:TituloPagina ID="aba1" titulo="Contratos e Parcelas" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ConteudoFormulario" runat="server">
    <table cellpadding="3" cellspacing="3" border="0" width="100%" class="tableSecao">
        <tr>
            <td>Origem contrato:
                <asp:Label ID="labelInternet" runat="server" Text="INTERNET" CssClass="textoEstaticoAzul"></asp:Label>
                <asp:Label ID="labelInterno" runat="server" Text="Atendimento" CssClass="textoEstaticoNegrito"></asp:Label>
            </td>
            <%--William Moreira da Silva--%>
            <td>
                <asp:Label ID="labelNomeCabecalho" runat="server" CssClass="textoEstaticoNegrito"
                    Visible="false"></asp:Label>
            </td>
            <td>
                <asp:Label ID="labelContratoCabecalho" runat="server" CssClass="textoEstaticoNegrito"
                    Visible="false"></asp:Label>
            </td>
            <td align="right">
                <glw:BotaoAcao ID="BotaoChaveMestre" runat="server" urlDaImagem="~/Imagens/imgChave.png" OnClick="BotaoChaveMestre_Click"></glw:BotaoAcao>
                <glw:BotaoAcao ID="BotaoAtualizar" runat="server" urlDaImagem="~/Imagens/imgRefazer.png" ToolTip="Atualizar interface"></glw:BotaoAcao>
                <asp:HiddenField ID="hdnTabAtiva" runat="server" />
            </td>
            <%--William Moreira da Silva--%>

        </tr>
    </table>
    <table cellpadding="3" cellspacing="3" border="0" width="100%" class="tableSecao">
        <tr>
            <td>
                <ajaxToolkit:TabContainer ID="recipienteAbaContratoPrincipal" runat="server" CssClass="abaPainel"
                    OnClientActiveTabChanged="getTab">
                    <ajaxToolkit:TabPanel runat="server" ID="painelAbaContrato" HeaderText="Contrato">
                        <HeaderTemplate>
                            Contrato
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td class="espacamento" style="width: 20%;">Nº Contrato:
                                    </td>
                                    <td style="width: 30%;">
                                        <asp:Label ID="labelNumeroContrato" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                       
                                    </td>
                                    <td style="width: 20%;">&nbsp;
                                    </td>
                                    <td style="width: 30%;">&nbsp;
                                        <%--<asp:Label ID="labelSituacao" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="espacamento">Mutuário:
                                    </td>
                                    <td>
                                        <asp:Label ID="labelMutuario" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>
                                    <td>Inscrição Previdenciária:
                                    </td>
                                    <td>
                                        <asp:Label ID="labelInscricaoPrevidenciara" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="espacamento">Matrícula:
                                    </td>
                                    <td>
                                        <asp:Label ID="labelMatriculaEmpresa" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>
                                    <td>Inscrição em Empréstimo:
                                    </td>
                                    <td>
                                        <asp:Label ID="labelInscricaoEmprestimo" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="espacamento">Plano Previdenciário:
                                    </td>
                                    <td>
                                        <asp:Label ID="labelPlanoPrevidenciario" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>
                                    <td>Entidade Contábil:
                                    </td>
                                    <td>
                                        <asp:Label ID="labelEntidadeContabil" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="espacamento">Situação do Participante:
                                    </td>
                                    <td>
                                        <asp:Label ID="labelSituacaoParticipante" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>
                                    <td>Patrocinadora:
                                    </td>
                                    <td>
                                        <asp:Label ID="labelPatrocinadora" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="espacamento">Cedido:
                                    </td>
                                    <td>
                                        <asp:Label ID="labelCedido" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>
                                    <td>Situação Funcional:
                                    </td>
                                    <td>
                                        <asp:Label ID="labelSituacaoFuncional" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="espacamento">Situação do Plano:
                                    </td>
                                    <td>
                                        <asp:Label ID="labelSituacaoPlano" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>
                                    <td>NUP:
                                    </td>
                                    <td>
                                        <asp:Label ID="labelNUP" runat="server" CssClass="textoEstaticoNegrito"> </asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="espacamento">Data Falecimento:
                                    </td>
                                    <td>
                                        <asp:Label ID="labelDataFalecimento" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>                                  
                                </tr>
                                <tr>
                                    <td colspan="4" style="padding-top: 7px;">
                                        <ajaxToolkit:TabContainer ID="recipienteAbaContratoSecundario" runat="server" CssClass="">
                                            <ajaxToolkit:TabPanel runat="server" ID="painelAbaDadosContrato" HeaderText="Dados do Contrato">
                                                <HeaderTemplate>
                                                    Dados do Contrato
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <table cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                            <td class="espacamento" style="width: 60%;">
                                                                Tipo de Contrato:
                                                                <asp:Label ID="labelTipoContrato" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>
                                                            <td style="width: 40%;">
                                                                Indexador:
                                                                <asp:Label ID="labelIndexador" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="espacamento">
                                                                Responsável:
                                                                <asp:Label ID="labelResponsavel" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>
                                                            <td>
                                                                Data Assinatura:
                                                                <asp:Label ID="labelDataAssinatura" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="espacamento">
                                                                Data Solicitação:
                                                                <asp:Label ID="labelDataSolicitacao" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>
                                                            <td>
                                                                Data do Crédito:
                                                                <asp:Label ID="labelDataCredito" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="espacamento">
                                                                Data 1ª Parcela:
                                                                <asp:Label ID="labelDataPrimeiraParcela" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>
                                                            <td>
                                                                Quitado Por:
                                                                <%--William Moreira da Silva - SOL 235175 PPM--%>
                                                                <asp:LinkButton ID="labelQuitadoPor" runat="server" OnClick="botaoContratoQuitado_Click"></asp:LinkButton>
                                                                <%--<asp:Label ID="labelQuitadoPor" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>--%>                                                 
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="espacamentoReduzido">
                                                                Data Cancelamento/Quitação:
                                                                <asp:Label ID="labelDataCancelamentoQuitacao" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>
                                                            <td>
                                                                CRM Cancelamento:
                                                                <asp:Label ID="lblProcoloCRMCancelamento" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ContentTemplate>
                                            </ajaxToolkit:TabPanel>
                                            <ajaxToolkit:TabPanel runat="server" ID="painelAbaValores" HeaderText="Valores">
                                                <ContentTemplate>
                                                    <table cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                            <td class="espacamento" style="width: 50%;">Valor Solicitado:
                                                                <asp:Label ID="labelValorSolicitado" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>
                                                            <td style="width: 50%;">Valor Parcela Base:
                                                                <asp:Label ID="labelValorParcelaBase" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="espacamento">Salário Considerado:
                                                                <asp:Label ID="labelSalarioConsiderado" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>
                                                            <td>Taxa de Juros:
                                                                <asp:Label ID="labelTaxaJuros" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="espacamento">Saldo devedor:
                                                                <asp:Label ID="labelSaldoDevedor" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>
                                                            <td>Margem Considerada:
                                                                <asp:Label ID="labelMargemConsiderada" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="espacamento">Número Parcelas:
                                                                <asp:Label ID="labelNumeroParcelas" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>
                                                            <td>Parcelas Restantes:
                                                                <asp:Label ID="labelParcelasRestantes" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="espacamento">Parcelas a Cobrar:
                                                                <asp:Label ID="labelParcelasCobrar" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>
                                                            <td>Nº. Contratos Quitados:
                                                                <asp:Label ID="labelNrContratosQuitados" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="espacamento">Valor Máximo Permitido:
                                                                <asp:Label ID="labelvlrMaxPermitido" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                            <td style="padding-bottom: 10px; border-top: dashed 1px rgb(215, 215, 215);"></td>
                                                        </tr>
                                                        <tr class="espacamento">
                                                            <td>Contratos Quitados:
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="espacamento">
                                                                <div style="overflow: auto">
                                                                    <glw:Grid ID="gridContratosQuitados" runat="server" Width="80%">
                                                                        <Columns>
                                                                            <%--<glw:CampoLimitado DataField="numero" HeaderText="Nr Contrato" />--%>
                                                                            <asp:HyperLinkField DataNavigateUrlFormatString="Visualizacao.aspx?Numero={0}" DataNavigateUrlFields="numero" DataTextField="numero" HeaderText="Nr Contrato" />
                                                                            <%--William Moreira da Silva - SOL 235175 PPM--%>
                                                                            <asp:TemplateField HeaderText="Data de Crédito" ItemStyle-HorizontalAlign="Right">
                                                                                <ItemTemplate>
                                                                                    <div class="campoDataGrid">
                                                                                        <span>
                                                                                            <%# DataBinder.Eval(Container.DataItem, "dataCredito", "{0:dd/MM/yyyy}") != null ? DataBinder.Eval(Container.DataItem, "dataCredito", "{0:dd/MM/yyyy}") : ""%></span>
                                                                                    </div>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <glw:CampoLimitado DataField="valorQuitado" HeaderText="Valor da Quitação" DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right" />
                                                                            <glw:CampoLimitado DataField="modalidade" HeaderText="Modalidade" />
                                                                        </Columns>
                                                                    </glw:Grid>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ContentTemplate>
                                            </ajaxToolkit:TabPanel>
                                            <ajaxToolkit:TabPanel runat="server" ID="painelAbaOutrasInformacoes" HeaderText="Outras Informações">
                                                <ContentTemplate>
                                                    <table cellpadding="0" cellspacing="0" width="100%">
                                                        <table cellpadding="0" cellspacing="0" width="100%">
                                                            <%--William Moreira da Silva--%>
                                                            <tr>
                                                                <td class="espacamento" style="width: 40%;">Tipo de Suspensão:
                                                                    <asp:Label ID="labelTipoSuspensao" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                                </td>
                                                                <td style="width: 30%;">Data Inicio:
                                                                    <asp:Label ID="labelDataInicio" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                                </td>
                                                                <td style="width: 30%;">Data Final:
                                                                    <asp:Label ID="labelDataFinal" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="espacamento">Valor Máximo Prestação:
                                                                    <asp:Label ID="labelvlrMaxPrestacao" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                                </td>
                                                                <td>Data Inicio:
                                                                    <asp:Label ID="labelDataIniciovlrMax" runat="server" CssClass="textoEstaticoNegrito"> </asp:Label>
                                                                </td>
                                                                <td>Data Final:
                                                                    <asp:Label ID="labelDataFinalvlrMax" runat="server" CssClass="textoEstaticoNegrito"> </asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <%--<td>
                                                                Data Final:
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="labelDataFinal" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>--%>
                                                                <td class="espacamento">Id. do titular:
                                                                    <asp:Label ID="labelIDPessoa" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                                </td>
                                                                <td>Id. da pessoa:
                                                                    <asp:Label ID="labelIDBeneficiario" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="espacamento">Auto-Emprestimo:
                                                                    <asp:Label ID="labelAutoEmprestimo" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                                </td>
                                                                <td>Meses Suspensão:
                                                                    <asp:Label ID="labelMesesSuspensao" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <%-- William Moreira da Silva--%>
                                                        </table>
                                                </ContentTemplate>
                                            </ajaxToolkit:TabPanel>
                                            <ajaxToolkit:TabPanel ID="painelAbaCobranca" runat="server" HeaderText="Eventos de Cobranças">
                                                <ContentTemplate>
                                                    <table width="100%">
                                                        <tr>
                                                            <td class="espacamento" align="center">
                                                                <div style="width: 100%; overflow: auto; height: 200px;">
                                                                    <glw:Grid ID="gridEventosCobranca" runat="server" Width="100%" 
                                                                        DataKeyNames="numeroContrato, eventoCobranca, data, id"
                                                                        OnRowDataBound="gridEventosCobranca_RowDataBound"
                                                                        OnRowCommand="gridEventosCobranca_RowCommand" >
                                                                        <Columns>
                                                                            <asp:HyperLinkField Text="Detalhe" ItemStyle-CssClass="textosgrid1" />
                                                                            <glw:CampoEntidadeComplexa HeaderText="Evento" DataField="eventoCobranca.descricao" />
                                                                            <asp:TemplateField HeaderText="Data do Evento" ItemStyle-HorizontalAlign="Right">
                                                                                <ItemTemplate>
                                                                                    <div class="campoDataGrid">
                                                                                        <span>
                                                                                            <%# DataBinder.Eval(Container.DataItem, "data", "{0:dd/MM/yyyy}")%></span>
                                                                                    </div>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                    </glw:Grid>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ContentTemplate>
                                            </ajaxToolkit:TabPanel>
                                        </ajaxToolkit:TabContainer>
                                        <%--bruno.silva SOL:255322/17559_PPM984370--%>

                                        <table width="100%">
                                            <tr>
                                                <td class="espacamento" style="padding-left: 40px;">
                                                    <asp:Label ID="labelPerda" runat="server" Text="PERDA EFETIVA" Font-Bold="true"></asp:Label></td>
                                                <td style="width: 20%;">
                                                    <%--<asp:Label ID="labelExcepcional" runat="server" Text="EXCEPCIONAL" Visible="false" CssClass="textoEstaticoVermelho"></asp:Label>--%>
                                                    <b>
                                                        <label id="labelExcepcional" visible="false" runat="server" style="position: relative; top: 11px; left: 3px; background-color: white; color: red;">EXCEPCIONAL</label>
                                                    </b>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="espacamento" style="padding-left: 30px;">
                                                    <%--William Moreira da Silva - SOL 224034/17909--%>
                                                    <div style="margin-top: 10px">
                                                        <asp:Label ID="labelContrato" Text="CONTRATO " runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                        <asp:Label ID="labelSituacao" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                    </div>

                                                    <%--Marcelo Ferreira - SIG 62003.69601 - Início--%>
                                                    <div style="margin-top: 10px">
                                                        <asp:Label ID="labelSistemaAmortiza" runat="server" CssClass="textoEstaticoAzul" Visible="false"></asp:Label>
                                                    </div>
                                                    <%--Marcelo Ferreira - SIG 62003.69601 - Final--%>

                                                    <div id="flgAcordoJudicial" style="margin-top: 10px" runat="server">
                                                        <asp:Label ID="labelAcordoJudicial" Text="ACORDO JUDICIAL" CssClass="lblAcordoJudicial" runat="server" Font-Bold="true"></asp:Label>
                                                    </div>
                                                    <%--William Moreira da Silva - SOL 224034/17909--%>
                                                     <div style="margin-top: 10px">Nível provisão:
                                                        <asp:Label ID="lblNivelProvisãoPerdas" runat="server" CssClass="textoEstaticoNegrito" Visible="true"></asp:Label>
                                                    </div>
                                                </td>
                                                <td>&nbsp;
                                                </td>
                                                <td>
                                                    <fieldset id="fdsExcepcional" runat="server">
                                                        <asp:CheckBoxList runat="server" ID="chklistExcepcional" Enabled="false">
                                                            <asp:ListItem Text="Valor Solicitado"></asp:ListItem>
                                                            <asp:ListItem Text="Elegibilidade"></asp:ListItem>
                                                            <asp:ListItem Text="Inadimplência"></asp:ListItem>
                                                            <asp:ListItem Text="Outros"></asp:ListItem>
                                                        </asp:CheckBoxList>
                                                    </fieldset>
                                                </td>
                                            </tr>
                                        </table>
                                        <%--bruno.silva SOL:255322/17559_PPM984370--%> 

                                    </td>
                                </tr>

                                <tr>
                                    <td align="right" colspan="4" style="border-top: dashed 1px rgb(215, 215, 215); padding-top: 7px;">
                                        <glw:BotaoAcao ID="botaoAjustarSituacao" runat="server" urlDaImagem="~/Imagens/imgRefazer.png"
                                            Text="Ajustar Situação" OnClick="botaoAjustarSituacao_Click"></glw:BotaoAcao>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel runat="server" ID="painelAbaItegracao" HeaderText="Integração">
                        <ContentTemplate>
                            <asp:Panel ID="painelContaBancariaCreditoConcessao" runat="server" GroupingText="Conta Bancária para Crédito da Concessão ">
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="espacamento">Banco:
                                        </td>
                                        <td>
                                            <asp:Label ID="labelBancoCredito" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                        </td>
                                        <td>Agência:
                                        </td>
                                        <td>
                                            <asp:Label ID="labelAgenciaCredito" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Conta Corrente:
                                        </td>
                                        <td>
                                            <asp:Label ID="labelContaCorrenteCredito" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                        </td>
                                        <td>Favorecido:
                                        </td>
                                        <td>
                                            <asp:Label ID="labelFavorecidoCredito" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <br />
                            <asp:Panel ID="painelContaBancariaDebitoPrestacoesDevolucoes" runat="server" GroupingText="Conta Bancária Débito de Prestações/Devoluções">
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="espacamento">Banco:
                                        </td>
                                        <td>
                                            <asp:Label ID="labelBancoDebito" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                        </td>
                                        <td>Agência:
                                        </td>
                                        <td>
                                            <asp:Label ID="labelAgenciaDebito" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Conta Corrente:
                                        </td>
                                        <td>
                                            <asp:Label ID="labelContaCorrenteDebito" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                        </td>
                                        <td>&nbsp;
                                        </td>
                                        <td>&nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <br />
                            <table cellpadding="5" cellspacing="0" width="100%">
                                <tr>
                                    <td style="width: 50%;">
                                        <asp:Panel ID="painelCredito" runat="server" GroupingText="Crédito">
                                            <table cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td class="espacamento">
                                                        <asp:Label ID="labelContasPagar" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="espacamento">
                                                        Forma de Pagamento:<br />
                                                        <asp:Label ID="labelFormaPagamentoCredito" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Conta Caixa x Forma Pgto:<br />
                                                        <asp:Label ID="labelContaCaixaFormaPagamento" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>
                                    <td style="width: 50%">
                                        <asp:Panel ID="painelDebito" runat="server" GroupingText="Débito">
                                            <table cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td class="espacamento">
                                                        <asp:Label ID="labelContasReceber" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="espacamento">
                                                        Forma de Pagamento:<br />
                                                        <asp:Label ID="labelFormaPagamentoDebito" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;<br />
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                        </asp:Panel>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel runat="server" ID="painelAbaHistorico" HeaderText="Histórico">
                        <HeaderTemplate>
                            Histórico
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" class="secoesFormulario" width="100%">
                                <tr>
                                    <td>
                                        <glw:SecaoFormulario ID="secaoPrincipal" tituloSecao="Filtros da Busca" expandeContraiSecao="true" runat="server">
                                            <table cellpadding="2" cellspacing="2" border="0" width="100%">
                                                <tr>
                                                    <td class="espacamento" style="vertical-align: top; width: 10%;">
                                                        <asp:CheckBox ID="caixaSelecaoItensEnvio" runat="server" Text="Itens de Envio" ValidationGroup="historico" />
                                                    </td>
                                                    <td style="vertical-align: top; width: 10%;">
                                                        <asp:CheckBox ID="caixaSelecaoItensInternos" runat="server" Text="Itens Internos" ValidationGroup="historico" />
                                                    </td>
                                                    <td style="vertical-align: top; width: 10%;">
                                                        <nobr><asp:CheckBox ID="caixaSelecaoAtualizacaoDiaria" runat="server" Text="Atualização Diária" ValidationGroup="historico" /></nobr>
                                                    </td>
                                                    <td style="width: 25%">
                                                        <asp:Panel GroupingText="Itens estornados" runat="server" ID="painelItensEstorno">
                                                            <asp:RadioButtonList RepeatDirection="Horizontal" ID="opcoesItensEstorno" runat="server">
                                                                <asp:ListItem Text="Exibir" Value="1"></asp:ListItem>
                                                                <asp:ListItem Text="Não exibir" Value="2"></asp:ListItem>
                                                                <asp:ListItem Text="Exibir apenas" Value="3"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </asp:Panel>
                                                    </td>
                                                    <td style="width: 25%">
                                                        <asp:Panel GroupingText="Itens em aberto" runat="server" ID="painelItensEmAberto">
                                                            <asp:RadioButtonList RepeatDirection="Horizontal" ID="opcoesItensEmAberto" runat="server">
                                                                <asp:ListItem Text="Exibir" Value="1"></asp:ListItem>
                                                                <asp:ListItem Text="Não exibir" Value="2"></asp:ListItem>
                                                                <asp:ListItem Text="Exibir apenas" Value="3"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </asp:Panel>
                                                    </td>
                                                    <td colspan="2" style="width: 20%; padding-left: 60px">
                                                        <b>Mês de Cobrança:</b><br />
                                                        De:
                                                        <glw:CaixaDataCompetencia ID="caixaTextoDataMovimentacaoMesCobrancaDe" runat="server" grupoValidacao="historico" Width="50"></glw:CaixaDataCompetencia>
                                                        Até:
                                                        <glw:CaixaDataCompetencia ID="caixaTextoDataMovimentacaoMesCobrancaAte" runat="server" grupoValidacao="historico" Width="50"></glw:CaixaDataCompetencia>
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td style="padding-top:10px" colspan="3">
                                                        <b>Data Prevista:</b><br />
                                                        De:
                                                        <glw:CaixaData ID="caixaTextoDataMovimentacaoDataPrevistaDe" grupoValidacao="historico" runat="server" Width="65"></glw:CaixaData>
                                                        Até:
                                                        <glw:CaixaData ID="caixaTextoDataMovimentacaoDataPrevistaAte" grupoValidacao="historico" runat="server" Width="65"></glw:CaixaData>
                                                    </td>
                                                    <td style="padding-top:10px">
                                                        Eventos:<br />
                                                        <asp:DropDownList ID="comboEventos" runat="server" ValidationGroup="historico">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="padding-top:10px">
                                                        Itens:<br />
                                                        <asp:DropDownList ID="comboItens" runat="server" ValidationGroup="historico">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="padding-top:10px">
                                                        Parcela:<br />
                                                        <glw:CaixaTexto ID="caixaTextoNumeroParcela" runat="server" Width="50px" MaxLength="3"
                                                            ValidationGroup="historico" OnKeyDown="return validaCampoNumerico(event);"></glw:CaixaTexto>
                                                        <div>
                                                            <asp:RegularExpressionValidator ID="validadorNumeroContrato" runat="server" ControlToValidate="caixaTextoNumeroParcela"
                                                                ValidationExpression="[0-9]*" ErrorMessage="O Número da Parcela contém caracteres inválidos."
                                                                Text="Caracteres inválidos." SetFocusOnError="true" Display="Dynamic" ValidationGroup="historico"></asp:RegularExpressionValidator>
                                                        </div>
                                                    </td>
                                                    <td style="padding-top:10px">
                                                        Ordenação:<br />
                                                        <asp:DropDownList ID="comboOrdenacao" runat="server" ValidationGroup="historico">
                                                            <asp:ListItem Value="0" Text="Selecione"></asp:ListItem>
                                                            <asp:ListItem Value="1" Text="Cobrança"></asp:ListItem>
                                                            <asp:ListItem Value="2" Text="Competência"></asp:ListItem>
                                                            <asp:ListItem Value="3" Text="Parcela"></asp:ListItem>
                                                            <asp:ListItem Value="4" Text="Saldo Devedor"></asp:ListItem>
                                                            <asp:ListItem Value="5" Text="Data Prevista"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="7" style="padding-bottom=15px"></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="7" style="text-align: right; vertical-align: top;">
                                                        <glw:BotaoProcurar ID="botaoProcurarHistorico" runat="server" ValidationGroup="historico"
                                                            OnClick="botaoProcurarHistorico_Click" permissoesExigidas="" Style="padding-top: 10px;"></glw:BotaoProcurar>
                                                        <glw:BotaoLimpar ID="botaoLimpar" OnClick="botaoLimparHistorico_Click" CausesValidation="false"
                                                            runat="server" Style="padding-top: 10px;"></glw:BotaoLimpar>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="7">
                                                        <asp:CustomValidator ID="validadorFiltros" runat="server" Display="Dynamic" ErrorMessage="Selecione ao menos um filtro." ClientValidationFunction="" ValidationGroup="historico"></asp:CustomValidator>
                                                    </td>
                                                </tr>
                                            </table>
                                            <glw:SumarioValidacao ID="SumarioValidacaoHistorico" ValidationGroup="historico" runat="server" />
                                        </glw:SecaoFormulario>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="posSecaoFormulario">
                                        <table cellpadding="0" cellspacing="0" border="0" class="secoesFormulario noPadding">
                                            <tr>
                                                <td>
                                                    <div style="width: 1200px; position: relative;">
                                                        <%-- William Moreira/Marcio Sanches--%>
                                                        <div style="width: 1200px; font-size: 70%; height: 350px; overflow: scroll;">
                                                            <glw:Grid ID="gridHistorico" runat="server" Width="1185px" PageSize="200" DataKeyNames="dataPrevista, saldoDevedor, id" HeaderStyle-CssClass="barraFixa"
                                                                OnRowDataBound="gridHistorico_RowDataBound" 
                                                                OnPageIndexChanging="gridHistorico_PageIndexChanging"
                                                                OnRowCommand="gridHistorico_RowCommand">
                                                                <%-- William Moreira da Silva - SOL 200709 KTN 1939145--%>
                                                                <Columns>
                                                                    <asp:TemplateField>
                                                                        <ItemTemplate>
                                                                            <input type="radio" name="rbItemHistorico" id="rbItemHistorico" value="<%# DataBinder.Eval(Container, "RowIndex") %>" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>

                                                                    <%--William Moreira da Silva SOL 235173--%>
                                                                    <%--Text="Detalhe" --%>
                                                                    <glw:CampoEntidadeComplexa DataField="tipoMovimento.descricao" HeaderText="Evento" />
                                                                    <%--<glw:CampoEntidadeComplexa DataField="item.descricao" HeaderText="Item" />--%>

                                                                    <%--<asp:HyperLinkField DataTextField="DescricaoItem" HeaderText="Item" ItemStyle-Wrap="false" title="Teste" />--%>
                                                                    <glw:CampoEntidadeComplexa DataField="DescricaoItem" ItemStyle-Wrap="false" HeaderText="Item" ItemStyle-Font-Underline="true" ItemStyle-ForeColor="Blue" ItemStyle-CssClass="textosgrid1" />
                                                                    <%--William Moreira da Silva SOL 235173--%>

                                                                    <glw:CampoEntidadeComplexa DataField="parcelaCompleta" HeaderText="Parcelas" />
                                                                    <glw:CampoEntidadeComplexa DataField="sequenciaCobranca" HeaderText="Seq." />
                                                                    <asp:TemplateField HeaderText="Comp." ItemStyle-HorizontalAlign="Right">
                                                                        <ItemTemplate>
                                                                            <div class="campoDataGrid">
                                                                                <span>
                                                                                    <%# DataBinder.Eval(Container.DataItem, "mesCompetencia") != null ? String.Concat(DataBinder.Eval(Container.DataItem, "mesCompetencia").ToString().PadLeft(2,'0'), "/", DataBinder.Eval(Container.DataItem, "anoCompetencia")) : null %>
                                                                                </span>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Cobr." ItemStyle-HorizontalAlign="Right">
                                                                        <ItemTemplate>
                                                                            <div class="campoDataGrid">
                                                                                <span>
                                                                                    <%# DataBinder.Eval(Container.DataItem, "mesCobranca") != null ? String.Concat(DataBinder.Eval(Container.DataItem, "mesCobranca").ToString().PadLeft(2,'0'), "/", DataBinder.Eval(Container.DataItem, "anoCobranca")) : null %>
                                                                                </span>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Dt. Prev." ItemStyle-HorizontalAlign="Right">
                                                                        <ItemTemplate>
                                                                            <div class="campoDataGrid">
                                                                                <asp:HiddenField ID="hdfDataPrev" runat="server" />
                                                                                <span>
                                                                                    <%# DataBinder.Eval(Container.DataItem, "dataPrevista", "{0:dd/MM/yyyy}")%></span>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Dt. Venc." ItemStyle-HorizontalAlign="Right">
                                                                        <ItemTemplate>
                                                                            <div class="campoDataGrid">
                                                                                <span>
                                                                                    <%# DataBinder.Eval(Container.DataItem, "dataVencimento", "{0:dd/MM/yyyy}")%></span>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Vlr. Prev." ItemStyle-HorizontalAlign="Right">
                                                                        <ItemTemplate>
                                                                            <div class="valorNumericoGrid">
                                                                                <span>
                                                                                    <%# DataBinder.Eval(Container.DataItem, "valorPrevisto", "{0:N2}")%>&nbsp;</span>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Dt. Efetiva" ItemStyle-HorizontalAlign="Right">
                                                                        <ItemTemplate>
                                                                            <div class="campoDataGrid">
                                                                                <span>
                                                                                    <%# DataBinder.Eval(Container.DataItem, "dataEfetiva", "{0:dd/MM/yyyy}")%></span>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Vlr. Efetivo" ItemStyle-HorizontalAlign="Center"><%--William Moreira da Silva - SOL 235173--%>
                                                                        <ItemTemplate>
                                                                            <div class="campoDataGrid">
                                                                                <span>
                                                                                    <%# DataBinder.Eval(Container.DataItem, "valorEfetivoTexto")%>&nbsp;</span><%--William Moreira da Silva - SOL 235173--%>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Saldo Dev." ItemStyle-HorizontalAlign="Right">
                                                                        <ItemTemplate>
                                                                            <div class="valorNumericoGrid">
                                                                                <span>
                                                                                    <%# DataBinder.Eval(Container.DataItem, "saldoDevedor", "{0:N2}")%>&nbsp;</span>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Envio" HeaderStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <div class="campoDataGrid">
                                                                                <span>
                                                                                    <%# DataBinder.Eval(Container.DataItem, "enviado") != null ? "Não" : "Sim" %></span>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Dt. Envio" ItemStyle-HorizontalAlign="Right">
                                                                        <ItemTemplate>
                                                                            <div class="campoDataGrid">
                                                                                <span>
                                                                                    <%# DataBinder.Eval(Container.DataItem, "dataEnvio", "{0:dd/MM/yyyy}")%></span>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Dt. Receb." ItemStyle-HorizontalAlign="Right">
                                                                        <ItemTemplate>
                                                                            <div class="campoDataGrid">
                                                                                <span>
                                                                                    <%# DataBinder.Eval(Container.DataItem, "dataRecebimento", "{0:dd/MM/yyyy}")%></span>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <glw:CampoEntidadeComplexa DataField="taxaJuros" HeaderText="Taxa" />
                                                                    <glw:CampoEntidadeComplexa DataField="tipoSuspensao.descricao" HeaderText="Tp. Susp." />
                                                                </Columns>
                                                                <SelectedRowStyle Font-Bold="true" ForeColor="Red" />
                                                            </glw:Grid>
                                                            <asp:ObjectDataSource ID="dataSourceHistorico" runat="server" SelectMethod="consultarHistorico"
                                                                TypeName="FUNCEF.Planus.WebEmprestimo.Web.Proxies.ProxyContrato" SortParameterName="ordenacao"
                                                                StartRowIndexParameterName="indiceLinha" MaximumRowsParameterName="maximoLinhas"
                                                                SelectCountMethod="totalHistoricos" OnSelecting="dataSourceHistorico_Selecting"
                                                                EnablePaging="true" EnableCaching="false"></asp:ObjectDataSource>
                                                        </div>
                                                    </div>
                                                    <br />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table cellpadding="0" cellspacing="0" border="0" class="secoesFormulario" width="100%">
                                            <td style="width: 150px;">
                                                <nobr>Itens em Aberto:</nobr>
                                                <asp:Label ID="labelItensAbertoHistorico" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                            </td>
                                            <td>
                                                <nobr>Valor Total:</nobr>
                                                <asp:Label ID="labelValorTotalHistorico" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                            </td>
                                        </table>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="border-top: dashed 1px rgb(215, 215, 215)">
                                        <br />
                                        <glw:BotaoAcao ID="botaoAjustarSaldo" runat="server" OnClick="botaoAjustarSaldo_Click"
                                            urlDaImagem="~/Imagens/imgRefazer.PNG" Text="Ajustar Saldo"></glw:BotaoAcao>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel runat="server" ID="painelAbaItensAberto" HeaderText="Itens em Aberto">
                        <HeaderTemplate>
                            Itens em Aberto
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" class="secoesFormulario">
                                <tr>
                                    <td class="espacamento" style="text-align: center;">
                                        <div style="width: 950px; height: 250px; overflow: scroll;">
                                            <glw:Grid ID="gridItens" runat="server" Width="950px" DataKeyNames="id" OnPageIndexChanging="gridItens_PageIndexChanging">
                                                <Columns>
                                                    <glw:CampoEntidadeComplexa DataField="tipoEvento.descricao" HeaderText="Evento" />
                                                    <glw:CampoEntidadeComplexa DataField="descricao" HeaderText="Item" />
                                                    <glw:CampoEntidadeComplexa DataField="parcela" HeaderText="Parcelas" />
                                                    <glw:CampoEntidadeComplexa DataField="sequencia" HeaderText="Seq." />
                                                    <asp:TemplateField HeaderText="Comp." ItemStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <div class="campoDataGrid">
                                                                <span>
                                                                    <%# DataBinder.Eval(Container.DataItem, "competencia", "{0:MM/yyyy}")%></span>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Cobr." ItemStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <div class="campoDataGrid">
                                                                <span>
                                                                    <%# DataBinder.Eval(Container.DataItem, "dataCobranca")%></span>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Dt. Prev." ItemStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <div class="campoDataGrid">
                                                                <span>
                                                                    <%# DataBinder.Eval(Container.DataItem, "dataPrevista", "{0:dd/MM/yyyy}")%></span>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Dt. Venc." ItemStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <div class="campoDataGrid">
                                                                <span>
                                                                    <%# DataBinder.Eval(Container.DataItem, "dataVencimento", "{0:dd/MM/yyyy}")%></span>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Dt. Efetiva" ItemStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <div class="campoDataGrid">
                                                                <span>
                                                                    <%# DataBinder.Eval(Container.DataItem, "dataEfetiva", "{0:dd/MM/yyyy}")%></span>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Vlr. Prev." ItemStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <div class="valorNumericoGrid">
                                                                <span>
                                                                    <%# DataBinder.Eval(Container.DataItem, "valor", "{0:N2}")%>&nbsp;</span>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Vlr. Efetivo" ItemStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <div class="valorNumericoGrid">
                                                                <span>
                                                                    <%# DataBinder.Eval(Container.DataItem, "valorEfetivo", "{0:N2}")%>&nbsp;</span>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </glw:Grid>
                                            <asp:ObjectDataSource ID="dataSourceItens" runat="server" SelectMethod="obterItensContratoEmAberto"
                                                TypeName="FUNCEF.Planus.WebEmprestimo.Web.Proxies.ProxyContrato" SortParameterName="ordenacao"
                                                StartRowIndexParameterName="indiceLinha" MaximumRowsParameterName="maximoLinhas"
                                                SelectCountMethod="totalItensContratoEmAberto" OnSelecting="dataSourceItens_Selecting"
                                                EnablePaging="true" EnableCaching="false"></asp:ObjectDataSource>
                                        </div>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="posSecaoFormulario">
                                        <table cellpadding="0" cellspacing="0" border="0" class="secoesFormulario">
                                            <td style="width: 100px;">
                                                <nobr>Itens em Aberto:</nobr>
                                            </td>
                                            <td style="width: 100px;"></nobr><asp:Label ID="labelItensAberto" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                            </td>
                                            <td style="width: 70px;">
                                                <nobr>Valor Total:</nobr>
                                            </td>
                                            <td>
                                                <asp:Label ID="labelValorTotalItens" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                            </td>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel runat="server" ID="painelAbaValorQuitacao" HeaderText="Valor para Quitação">
                        <HeaderTemplate>
                            Valor para Quitação
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" class="secoesFormulario">
                                <tr>
                                    <td style="padding-top: 10px">
                                        <table cellpadding="0" cellspacing="0" border="0" class="secoesFormulario">
                                            <tr>
                                                <td class="espacamento" style="width: 50%">
                                                    Valor em Aberto:
                                                    <asp:Label ID="labelValorTotalQuitacao" runat="server" CssClass="textoEstaticoNegrito" />
                                                </td>
                                                <td style="width: 35%; text-align: right">Data para Quitação:
                                                </td>
                                                <td style="width: 15%; text-align: right">
                                                    <glw:CaixaData ID="caixaTextoDataQuitacao" runat="server" Width="90" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" style="text-align: right; padding-top: 10px">
                                                    <glw:BotaoAcao ID="botaoCalcularValorQuitacao" runat="server" urlDaImagem="~/Imagens/imgCalculadora.PNG" Text="Calcular Valor para Quitação" OnClick="botaoCalcularValorQuitacao_Click"></glw:BotaoAcao>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                            <table>
                                <tr>
                                    <td class="espacamento" style="text-align: center;">
                                        <br />
                                        <glw:Grid ID="gridValorQuitacao" runat="server" Width="850px" DataKeyNames="id" AllowSorting="true"
                                            AllowPaging="false">
                                            <Columns>
                                                <glw:CampoEntidadeComplexa DataField="tipoEvento.descricao" HeaderText="Evento" />
                                                <glw:CampoEntidadeComplexa DataField="descricao" HeaderText="Item" ItemStyle-HorizontalAlign="Left" />
                                                <glw:CampoEntidadeComplexa DataField="parcela" HeaderText="Parcelas" />
                                                <glw:CampoEntidadeComplexa DataField="sequencia" HeaderText="Seq." />
                                                <asp:TemplateField HeaderText="Dt. Prev." ItemStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <div class="campoDataGrid">
                                                            <span>
                                                                <%# DataBinder.Eval(Container.DataItem, "dataPrevista", "{0:dd/MM/yyyy}")%></span>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Vlr. Prev." ItemStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <div class="valorNumericoGrid">
                                                            <span>
                                                                <%# DataBinder.Eval(Container.DataItem, "valor", "{0:N2}")%>&nbsp;</span>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Saldo Devedor" ItemStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <div class="valorNumericoGrid">
                                                            <span>
                                                                <%# DataBinder.Eval(Container.DataItem, "saldoDevedor", "{0:N2}")%>&nbsp;</span>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </glw:Grid>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="posSecaoFormulario">
                                        <table cellpadding="0" cellspacing="0" border="0" class="secoesFormulario">
                                            <td>
                                                <nobr>Valor Projetado para Quitação:</nobr>
                                                &nbsp; </nobr><asp:Label ID="labelValorProjetadoQuitacao" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                            </td>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel runat="server" ID="painelAbaBeneficiariosSeguro" HeaderText="Beneficiário(s) do Seguro">
                        <HeaderTemplate>
                            Beneficiário(s) do Seguro
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" class="secoesFormulario">
                                <tr>
                                    <td style="text-align: center;">
                                        <glw:Grid ID="gridBeneficiarioSeguro" runat="server" Width="850px" DataKeyNames="id"
                                            AllowSorting="true" AllowPaging="false">
                                            <Columns>
                                                <glw:CampoEntidadeComplexa DataField="nome" HeaderText="Nome" />
                                                <glw:CampoEntidadeComplexa DataField="percentual" HeaderText="%" />
                                                <glw:CampoEntidadeComplexa DataField="dadosBancarios.contaCorrente" HeaderText="Conta Corrente" />
                                                <asp:TemplateField HeaderText="Vlr. Fundação" ItemStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <div class="valorNumericoGrid">
                                                            <span>
                                                                <%# DataBinder.Eval(Container.DataItem, "valorFundacao", "{0:N2}")%>&nbsp;</span>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Vlr. Beneficio" ItemStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <div class="valorNumericoGrid">
                                                            <span>
                                                                <%# DataBinder.Eval(Container.DataItem, "valorBeneficio", "{0:N2}")%>&nbsp;</span>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Dt. Depósito" ItemStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <div class="campoDataGrid">
                                                            <span>
                                                                <%# DataBinder.Eval(Container.DataItem, "dataDeposito", "{0:dd/MM/yyyy}")%></span>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </glw:Grid>
                                        <br />
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel runat="server" ID="painelAbaLog" HeaderText="Log">
                        <HeaderTemplate>
                            Log
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" class="secoesFormulario">
                                <tr>
                                    <td style="text-align: center;">
                                        <div style="width: 1200px; height: 250px; overflow: scroll;">
                                            <glw:Grid ID="gridLog" runat="server" Width="1250px" DataKeyNames="id" AllowSorting="true"
                                                AllowPaging="false">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Data/Hora" ItemStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <div class="campoDataGrid">
                                                                <span>
                                                                    <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "data")).ToString("dd/MM/yyyy - HH:mm") %>
                                                                </span>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <glw:CampoEntidadeComplexa DataField="origem.descricao" HeaderText="Origem" />
                                                    <glw:CampoEntidadeComplexa DataField="versao" HeaderText="Versão" />
                                                    <glw:CampoEntidadeComplexa DataField="usuario.login" HeaderText="Login" />
                                                    <glw:CampoEntidadeComplexa DataField="usuario.nome" HeaderText="Usuário" />
                                                    <glw:CampoEntidadeComplexa DataField="descricao" HeaderText="Descrição" />
                                                    <glw:CampoEntidadeComplexa DataField="usuario.id" HeaderText="IDUsuário" />
                                                    <glw:CampoEntidadeComplexa DataField="idHistorico" HeaderText="IDHistMov" />
                                                    <glw:CampoEntidadeComplexa DataField="modulo" HeaderText="IDModulo" />
                                                    <glw:CampoEntidadeComplexa DataField="numeroContrato" HeaderText="Contrato" />
                                                    <glw:CampoEntidadeComplexa DataField="id" HeaderText="IDLog" />
                                                </Columns>
                                            </glw:Grid>
                                        </div>
                                        <br />
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                </ajaxToolkit:TabContainer>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ConteudoBotoesAcao" runat="server">
     <glw:BotaoAcao ID="BotaoImprimir" runat="server" urlDaImagem="~/Imagens/imgImprimir.PNG" Text="Contrato" OnClick="BotaoImprimir_Click"></glw:BotaoAcao>
    <glw:BotaoVoltar ID="botaoVoltar" runat="server" urlVoltar="Listagem.aspx" permissoesExigidas="mascaraVazia"></glw:BotaoVoltar>
    <glw:BotaoSair ID="botaoSair" runat="server" permissoesExigidas="mascaraVazia"></glw:BotaoSair>
</asp:Content>
