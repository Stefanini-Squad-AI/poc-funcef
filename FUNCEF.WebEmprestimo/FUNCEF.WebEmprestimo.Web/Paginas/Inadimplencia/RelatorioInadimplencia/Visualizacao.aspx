
<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/FormularioMestre.master"
    AutoEventWireup="true" CodeBehind="Visualizacao.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.Inadimplencia.RelatorioInadimplencia.Visualizacao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ConteudoAdicionalHeadFormulario"
    runat="server">

    <style type="text/css">
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
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="EspacoTituloPagina" runat="server">
    <glw:TituloPagina ID="aba1" titulo="Contratos inadimplentes" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ConteudoFormulario" runat="server">

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
                                </tr>
                                <tr>
                                    <td class="espacamento">Plano Previdenciário:
                                    </td>
                                    <td>
                                        <asp:Label ID="labelPlanoPrevidenciario" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="espacamento">Situação do Participante:
                                    </td>
                                    <td>
                                        <asp:Label ID="labelSituacaoParticipante" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>

                                    <td class="espacamento">Patrocinadora:
                                    </td>
                                    <td>
                                        <asp:Label ID="labelPatrocinadora" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="espacamento">Situação Funcional:
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
                                </tr>
                                <tr>
                                    <td class="espacamento">Data Falecimento:
                                    </td>
                                    <td>
                                        <asp:Label ID="labelDataFalecimento" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>                                  
                                </tr>
                                <tr>
                                    <td class="espacamento">Data cálculo:</td>
                                    <td>
                                    <glw:CaixaData ID="caixaDataCalculo" runat="server" Width="90px" AutoPostBack="true"  OnTextChanged="caixaDataCalculo_TextChanged"></glw:CaixaData>                                          
                                    <asp:HiddenField ID="hdfCaixaDataCalculo" runat="server" />                                           
                                    </td>
                                </tr>

                                                        <tr class="espacamento">
                                                            <td>Contratos com inadimplência:
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="espacamento" colspan="6">
                                                                <div style="overflow: auto">
                                                                    <glw:Grid ID="gridContratosInadimplentes" runat="server" Width="100%">
                                                                        <Columns>                                                                        
                                                                            <asp:HyperLinkField 
                                                                                DataNavigateUrlFormatString="Visualizacao.aspx?Numero={0}" 
                                                                                DataNavigateUrlFields="NumeroContrato" 
                                                                                DataTextField="NumeroContrato" 
                                                                                HeaderText="Contrato" /> 
                                                                            <glw:CampoLimitado DataField="parcela" HeaderText="Parcela nominal (R$)" DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right" />
                                                                             <glw:CampoLimitado DataField="correcaoMonetaria" HeaderText="Correção monetária (R$)" DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right" />
                                                                             <glw:CampoLimitado DataField="multa" HeaderText="Multa (R$)" DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right" />
                                                                             <glw:CampoLimitado DataField="jurosMora" HeaderText="Juros de mora (R$)" DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right" />
                                                                             <glw:CampoLimitado DataField="jurosRemuneratorios" HeaderText="Juros remuneratórios (R$)" DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right" />
                                                                             <glw:CampoLimitado DataField="iofComplementar" HeaderText="IOF complementar (R$)" DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right" />
                                                                             <glw:CampoLimitado DataField="totalEncargos" HeaderText="Total encargos (R$)" DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right" />
                                                                             <glw:CampoLimitado DataField="saldoDevedor" HeaderText="Saldo devedor (R$)" DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right" />                                                                          
                                                           
                                                                            <asp:TemplateField HeaderText="Relatório" >
                                                                                <ItemStyle CssClass="text-align-center" />
                                                                                <ItemTemplate >
                                                                                    <glw:BotaoAcao ID="botaoGerarPDF2" runat="server" urlDaImagem="~/Imagens/imgPDF.png" Visible="true" OnClick="botaoGerarPDF_Click"/>                                                                    
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            
                                                                        </Columns>
                                                                    </glw:Grid>
                                                                </div>
                                                            </td>
                                                        </tr>

                                <tr>
                                    <td colspan="4" style="padding-top: 7px;">
                                        <ajaxToolkit:TabContainer ID="recipienteAbaContratoSecundario" runat="server" CssClass="" Visible="false">
                                            <ajaxToolkit:TabPanel runat="server" ID="painelAbaDadosContrato" HeaderText="Dados do Contrato">
                                                <HeaderTemplate>Dados do Contrato</HeaderTemplate>
                                                <ContentTemplate>
                                                    <table cellpadding="0" cellspacing="0" width="100%" class="tableSecao">
                                                        <tr>
                                                            <td class="espacamento">Nº Contrato:                 
                                                                <asp:Label ID="labelNumeroContrato" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>

                                                            <td class="espacamento" style="width: 60%;">Tipo de Contrato:
                                                                <asp:Label ID="labelTipoContrato" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="espacamento">Data do Crédito:
                                                                <asp:Label ID="labelDataCredito" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>

                                                            <td class="espacamento">Data Assinatura:
                                                                <asp:Label ID="labelDataAssinatura" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                           <td class="espacamento">Data 1ª Parcela:
                                                                <asp:Label ID="labelDataPrimeiraParcela" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>

                                                            <td class="espacamento">Indexador:
                                                                <asp:Label ID="labelIndexador" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="espacamento">Data Solicitação:
                                                                <asp:Label ID="labelDataSolicitacao" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td> 
    <%--                                                        <td class="espacamento">Quitado Por:                                                           
                                                                <asp:LinkButton ID="labelQuitadoPor" runat="server" OnClick="botaoContratoQuitado_Click"></asp:LinkButton>                                                                                                
                                                            </td>--%>
                                                        </tr>
     

                                                    </table>

                                                    <table cellpadding="0" cellspacing="0" width="100%" class="tableSecao">
                                                        <tr>
                                                            <td class="espacamento">Salário considerado:
                                                                <asp:Label ID="labelSalarioConsiderado" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td class="espacamento">Valor solicitado:
                                                                <asp:Label ID="labelValorSolicitado" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>

                                                            <td class="espacamento">Margem considerada:
                                                                <asp:Label ID="labelMargemConsiderada" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="espacamento">Prazo (meses):
                                                                <asp:Label ID="labelNumeroParcelas" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>

                                                               <td class="espacamento">Taxa de juros:
                                                                <asp:Label ID="labelTaxaJuros" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>

                                                        </tr>
                                                        <tr>
                                                            <td class="espacamento">Valor prestação base:
                                                                <asp:Label ID="labelValorParcelaBase" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>
                                                            <td class="espacamento">Nº. contratos quitados:
                                                                <asp:Label ID="labelNrContratosQuitados" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>


                                                        </tr>
                                                        <tr>
                                                            <td class="espacamento">Saldo devedor:
                                                                <asp:Label ID="labelSaldoDevedor" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>
                                                            <td class="espacamento">Parcelas a cobrar:
                                                                <asp:Label ID="labelParcelasCobrar" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>

                                                        </tr>
                                                        <tr>
                                                            <td class="espacamento">Parcelas restantes:
                                                                <asp:Label ID="labelParcelasRestantes" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>                                                   
                                                            <td class="espacamento">Data última atualização diária:                                                           
                                                                <asp:Label ID="labelUltimaDataAtualizacao" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>                                                                                                
                                                            </td>                                                        
                                                        </tr>
                                                        <tr>
                                                            <td align="right">
                                                                <asp:HiddenField ID="hdnTabAtiva" runat="server" />
                                                            </td> 
                                                        </tr>
                                                    </table>
                                                </ContentTemplate>
                                            </ajaxToolkit:TabPanel>
                                            <ajaxToolkit:TabPanel runat="server" ID="painelAbaOutrasInformacoes" HeaderText="Outras Informações">
                                                <ContentTemplate>
                                                    <table cellpadding="0" cellspacing="0" width="100%">
                                                        <table cellpadding="0" cellspacing="0" width="100%">                                               
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


                                      

                             <%--       </td>
                                </tr>--%>

<%--                                <tr>
                                    <td align="right" colspan="4" style="border-top: dashed 1px rgb(215, 215, 215); padding-top: 7px;">
                                        <glw:BotaoAcao ID="botaoGerarPDF" runat="server" urlDaImagem="~/Imagens/imgPDF.png"
                                            Text="Gerar PDF" OnClick="botaoGerarPDF_Click"></glw:BotaoAcao>
                                    </td>
                                </tr>--%>
                            </table>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                </ajaxToolkit:TabContainer>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ConteudoBotoesAcao" runat="server">
    <glw:BotaoVoltar ID="botaoVoltar" runat="server" urlVoltar="Listagem.aspx" permissoesExigidas="mascaraVazia"></glw:BotaoVoltar>
    <glw:BotaoSair ID="botaoSair" runat="server" permissoesExigidas="mascaraVazia"></glw:BotaoSair>
</asp:Content>
