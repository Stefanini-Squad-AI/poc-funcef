<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/DialogoMestre.master" AutoEventWireup="true"
    CodeBehind="PopupEditHistorico.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.Consultas.Contratos.PopupEditHistorico" %>

<asp:Content ID="ConteudoAdicionalHead" runat="server" ContentPlaceHolderID="ConteudoAdicionalHead">

    <script language="javascript" type="text/javascript">
            
    </script>

</asp:Content>
<asp:Content ID="contentCabecalho" runat="server" ContentPlaceHolderID="ConteudoCabecalho">
    Historico
</asp:Content>
<asp:Content ID="contentConteudo" runat="server" ContentPlaceHolderID="ConteudoPrincipal">
    <table class="secoesFormulario" style="padding-left:12px">
        <tr>
            <td style="text-align: left;">
                <ajaxToolkit:TabContainer ID="recipienteAbaHistoricoEdit" runat="server" CssClass="abaPainel">
                    <ajaxToolkit:TabPanel ID="painelAbaGeral" runat="server" HeaderText="Geral">
                        <ContentTemplate>
                            <table style="text-align: left; vertical-align:top" cellpadding="0" cellspacing="0" border="0" class="tableSecao">
                                <tr>
                                    <td class="espacamento">
                                        Contrato
                                        <br />
                                        <glw:CaixaAlfaNumerica ID="caixaTextoContrato" runat="server" Width="125px"></glw:CaixaAlfaNumerica>
                                    </td>
                                    <td>
                                        Evento
                                        <br />
                                        <glw:CaixaTexto ID="caixaTextoEvento" runat="server" Width="60px" MaxLength="10"
                                            OnKeyDown="return validaCampoNumerico(event);"></glw:CaixaTexto>
                                    </td>
                                    <td>
                                        Item
                                        <br />
                                        <glw:CaixaTexto ID="caixaTextoItem" runat="server" Width="60px" MaxLength="10" OnKeyDown="return validaCampoNumerico(event);"></glw:CaixaTexto>
                                    </td>
                                    <td>
                                        Sequencial
                                        <br />
                                        <div style="display: flex">
                                            <glw:CaixaNumericaUpDown ID="caixaNumericaSeq" runat="server" nomeCampo="Seq" valorMaximo="99" valorMinimo="0"></glw:CaixaNumericaUpDown>
                                        </div>
                                    </td>
                                    <td>
                                        Alt. Parcela
                                        <br />
                                        <div style="display: flex">
                                            <glw:CaixaNumericaUpDown ID="caixaNumericaParcelaAlt" runat="server" nomeCampo="Parcelas Alt" valorMaximo="240" valorMinimo="0"></glw:CaixaNumericaUpDown>
                                        </div>
                                    </td>
                                    <td>
                                        Parcela
                                        <br />
                                        <div style="display: flex">
                                            <glw:CaixaNumericaUpDown ID="caixaNumericaParcelas" runat="server" nomeCampo="Parcelas" valorMaximo="240" valorMinimo="0"></glw:CaixaNumericaUpDown>
                                        </div>
                                    </td>
                                    <td>
                                        Restam
                                        <br />
                                        <div style="display: flex">
                                            <glw:CaixaNumericaUpDown ID="caixaNumericaRestam" runat="server" nomeCampo="Restam" valorMaximo="240" valorMinimo="0" MaxLength="2"></glw:CaixaNumericaUpDown>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="espacamento">
                                        Mês Competência
                                        <br />
                                        <glw:CaixaNumerica ID="caixaNumericaMesCompetencia" runat="server" casasDecimais="0"  Width="20px" valorMaximo="12" MaxLength="2"></glw:CaixaNumerica>
                                        <glw:CaixaTexto ID="caixaTextoAnoCompetencia" runat="server" Width="40px" MaxLength="4" OnKeyDown="return validaCampoNumerico(event);"></glw:CaixaTexto>
                                    </td>
                                    <td>
                                        Mês Cobrança
                                        <br />
                                        <glw:CaixaNumerica ID="caixaNumericaMesCobranca" runat="server" casasDecimais="0" Width="20px" valorMaximo="12" MaxLength="2"> </glw:CaixaNumerica>
                                        <glw:CaixaTexto ID="caixaTextoAnoCobranca" runat="server" Width="40px" MaxLength="4" OnKeyDown="return validaCampoNumerico(event);"></glw:CaixaTexto>
                                    </td>
                                    <td colspan="2">
                                        <fieldset>
                                            <glw:ListaOpcoes ID="listaOpcoesBancoFolha" runat="server" RepeatDirection="Horizontal">
                                                <asp:ListItem Value="C" Text="Banco" />
                                                <asp:ListItem Value="F" Text="Folha" />
                                            </glw:ListaOpcoes>
                                        </fieldset>
                                    </td>
                                    <td colspan="3">
                                        <fieldset>
                                            <glw:ListaOpcoes ID="listaOpcoesBenefPatro" runat="server" RepeatDirection="Horizontal">
                                                <asp:ListItem Value="B" Text="Benefício" />
                                                <asp:ListItem Value="P" Text="Patrocinadora" />
                                            </glw:ListaOpcoes>
                                        </fieldset>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="espacamento">
                                        Data Prevista<br />
                                        <glw:CaixaData ID="caixaDataPrevista" runat="server" Width="75px" exibirValidacaoAbaixo="False"
                                            grupoValidacao="" mensagemDataInvalida="Data inválida." mensagemDataVazia="A data deve ser informada."
                                            obrigatorio="False" tipoHoraRetorno="Padrao">
                                        </glw:CaixaData>
                                    </td>
                                    <td>
                                        Data Vencimento<br />
                                        <glw:CaixaData ID="caixaDataVencto" runat="server" Width="75px" exibirValidacaoAbaixo="False"
                                            grupoValidacao="" mensagemDataInvalida="Data inválida." mensagemDataVazia="A data deve ser informada."
                                            obrigatorio="False" tipoHoraRetorno="Padrao">
                                        </glw:CaixaData>
                                    </td>
                                    <td>
                                        Data Efetiva<br />
                                        <glw:CaixaData ID="caixaDataEfetiva" runat="server" Width="75px" exibirValidacaoAbaixo="False"
                                            grupoValidacao="" mensagemDataInvalida="Data inválida." mensagemDataVazia="A data deve ser informada."
                                            obrigatorio="False" tipoHoraRetorno="Padrao">
                                        </glw:CaixaData>
                                    </td>
                                    <td>
                                        Saldo Devedor
                                        <br />
                                        <glw:CaixaNumerica ID="caixaNumericaSaldoDevedor" runat="server" casasDecimais="2"
                                            Width="90px" valorMaximo="99999999.99">
                                        </glw:CaixaNumerica>
                                    </td>
                                    <td colspan="2">
                                        Data da Atualização<br />
                                        <glw:CaixaData ID="caixaDataAtualizacao" runat="server" Width="75px" exibirValidacaoAbaixo="False"
                                            grupoValidacao="" mensagemDataInvalida="Data inválida." mensagemDataVazia="A data deve ser informada."
                                            obrigatorio="False" tipoHoraRetorno="Padrao">
                                        </glw:CaixaData>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="espacamento">
                                        Valor Previsto
                                        <br />
                                        <glw:CaixaNumerica ID="caixaNumericaValorPrevisto" runat="server" casasDecimais="2"
                                            Width="90px" valorMaximo="99999999.99">
                                        </glw:CaixaNumerica>
                                    </td>
                                    <td>
                                        Valor Efetivo
                                        <br />
                                        <glw:CaixaNumerica ID="caixaNumericaValorEfetivo" runat="server" casasDecimais="2"
                                            Width="90px" valorMaximo="99999999.99">
                                        </glw:CaixaNumerica>
                                    </td>
                                    <td>
                                        Valor Base
                                        <br />
                                        <glw:CaixaNumerica ID="caixaNumericaValorBase" runat="server" casasDecimais="2" Width="90px"
                                            valorMaximo="99999999.99">
                                        </glw:CaixaNumerica>
                                    </td>
                                    <td>
                                        Taxa de Juros
                                        <br />
                                        <glw:CaixaNumerica ID="caixaNumericaTaxaJuros" runat="server" casasDecimais="2" Width="90px"
                                            valorMaximo="999">
                                        </glw:CaixaNumerica>
                                    </td>
                                    <td colspan="2">
                                        Planilha
                                        <br />
                                        <glw:CaixaAlfaNumerica ID="caixaAlfaNumericaPlanilha" runat="server" Width="90px"></glw:CaixaAlfaNumerica>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="espacamento">
                                        <fieldset>
                                            Data de Abono/Quitação<br />
                                            <glw:CaixaData ID="caixaDataQuitAbono" runat="server" Width="65px" exibirValidacaoAbaixo="False"
                                                grupoValidacao="" mensagemDataInvalida="Data inválida." mensagemDataVazia="A data deve ser informada."
                                                obrigatorio="False" tipoHoraRetorno="Padrao">
                                            </glw:CaixaData><br />
                                            <glw:CaixaSelecao ID="CaixaSelecaoAbonado" Text="Abonado" runat="server" />
                                            <glw:CaixaSelecao ID="CaixaSelecaoQuitado" Text="Quitado" runat="server" />
                                        </fieldset>
                                    </td>
                                    <td>
                                        <glw:CaixaSelecao ID="CaixaSelecaoBaixado" Text="Baixado" runat="server" /><br />
                                        <glw:CaixaSelecao ID="CaixaSelecaoBaixaManual" Text="Baixa Manual" runat="server" />
                                    </td>
                                    <td>
                                        Cod. Documento
                                        <br />
                                        <glw:CaixaTexto ID="caixaTextoCodDocumento" runat="server" Width="90px" MaxLength="10"
                                            OnKeyDown="return validaCampoNumerico(event);"></glw:CaixaTexto>
                                    </td>
                                    <td>
                                        IDTmpDesc
                                        <br />
                                        <glw:CaixaAlfaNumerica ID="caixaAlfaNumericaIDTmpDesc" runat="server" Width="90px"></glw:CaixaAlfaNumerica>
                                    </td>
                                    <td colspan="3">
                                        <fieldset>
                                            Data Estorno<br />
                                            <glw:CaixaData ID="caixaDataEstornado" runat="server" Width="65px" exibirValidacaoAbaixo="False"
                                                grupoValidacao="" mensagemDataInvalida="Data inválida." mensagemDataVazia="A data deve ser informada."
                                                obrigatorio="False" tipoHoraRetorno="Padrao" />
                                            <glw:CaixaSelecao ID="caixaSelecaEstornado" Text="Estornado" runat="server" /><br />
                                            Pln
                                            <br />
                                            <glw:CaixaAlfaNumerica ID="caixaAlfaNumericaPln" runat="server" Width="90px"></glw:CaixaAlfaNumerica>
                                        </fieldset>
                                    </td>
                                    <tr class="espacamento">
                                        <td>
                                            <glw:CaixaSelecao ID="caixaSelecaoEnviado" Text="Enviado" runat="server" /><br />
                                            <glw:CaixaSelecao ID="caixaSelecaoEntradaManual" Text="Entrada Manual" runat="server" />
                                        </td>
                                        <td>
                                            <glw:CaixaSelecao ID="caixaSelecaoDivergente" Text="Divergente" runat="server" /><br />
                                            <glw:CaixaSelecao ID="caixaSelecaoDivirgenciaTratada" Text="Divirgência Tratada"
                                                runat="server" />
                                        </td>
                                        <td colspan="2">
                                            Motivo Divergência
                                            <br />
                                            <asp:DropDownList ID="listaDropDownMotivoDivergencia" runat="server" Width="222px">
                                                <asp:ListItem></asp:ListItem>
                                                <asp:ListItem Value="1">Valores ainda não recebidos</asp:ListItem>
                                                <asp:ListItem Value="2">Recebimentos Inesperados</asp:ListItem>
                                                <asp:ListItem Value="3">Valores recebidos a menor</asp:ListItem>
                                                <asp:ListItem Value="4">Valores recebidos a maior</asp:ListItem>
                                                <asp:ListItem Value="5">Divergência de datas</asp:ListItem>
                                                <asp:ListItem Value="6">Valores não recebidos</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td colspan="3">
                                            IDTipoSusp<br />
                                            <glw:CaixaAlfaNumerica ID="caixaAlfaNumericaIdTipoSusp" runat="server" Width="65px"></glw:CaixaAlfaNumerica>
                                            <glw:CaixaSelecao ID="caixaSelecaoSuspenso" Text="Suspenso" runat="server" />
                                        </td>
                                    </tr>
                                </tr>
                                <tr>
                                    <td colspan="2" class="espacamento">
                                        <fieldset>
                                            <glw:ListaOpcoes ID="listaOpcoesApagarReceber" runat="server" RepeatDirection="Horizontal">
                                                <asp:ListItem Value="P" Text="A Pagar" />
                                                <asp:ListItem Value="R" Text="A Receber" />
                                            </glw:ListaOpcoes>
                                        </fieldset>
                                    </td>
                                    <td>
                                        <glw:CaixaSelecao ID="caixaSelecaoCentraliza" Text="Centraliza" runat="server" /><br />
                                        <glw:CaixaSelecao ID="caixaSelecaoDestacado" Text="Destacado" runat="server" />
                                    </td>
                                </tr>
                                
                            </table>
                            <table width="100%">
                                <tr>
                                    <td align="right" style="padding-top: 10px;">
                                        <glw:BotaoAcao ID="botaoOK" runat="server" urlDaImagem="~/Imagens/imgOK.png" Text="Ok" EnableViewState="False" OnClick="botaoOK_Click"></glw:BotaoAcao>
                                        <glw:BotaoAcao ID="botaoCancelar" runat="server" urlDaImagem="~/Imagens/imgCancelar.png" Text="Cancelar" EnableViewState="False" OnClick="botaoCancelar_Click"></glw:BotaoAcao>
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
<asp:Content ID="contentRodape" runat="server" ContentPlaceHolderID="ConteudoRodape">
</asp:Content>
