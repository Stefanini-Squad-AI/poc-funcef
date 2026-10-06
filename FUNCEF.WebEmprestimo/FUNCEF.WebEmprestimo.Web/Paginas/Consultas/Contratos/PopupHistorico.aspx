<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/DialogoMestre.master" AutoEventWireup="true"
    CodeBehind="PopupHistorico.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.Consultas.Contratos.PopupHistorico" %>

<asp:Content ID="ConteudoAdicionalHead" runat="server" ContentPlaceHolderID="ConteudoAdicionalHead">

    <script type="text/javascript" language="javascript">

        function abrirAlteracao(url) {
            var retorno = exibirDialogo(url, 450, 210);

            if (retorno) {
                document.getElementById('<%= hdnObservacao.ClientID %>').value = retorno;
                //document.getElementById('<%= caixaTextoObservacao.ClientID %>').value = retorno;
                location.reload(true);
            }

            return false;
        }

        function fechar() {
            window.close();
        }

    </script>

</asp:Content>
<asp:Content ID="contentCabecalho" runat="server" ContentPlaceHolderID="ConteudoCabecalho">
    Contrato
</asp:Content>
<asp:Content ID="contentConteudo" runat="server" ContentPlaceHolderID="ConteudoPrincipal">
    <table cellpadding="3" cellspacing="3" border="0" width="100%" class="tableSecao">
        <tr>
            <td align="right">
                <glw:BotaoAcao ID="BotaoChaveMestre" runat="server" urlDaImagem="~/Imagens/imgChave.png" OnClick="BotaoChaveMestre_Click"></glw:BotaoAcao>
            </td>
        </tr>
    </table>
    <table cellpadding="0" cellspacing="0" border="0" class="secoesFormulario" style="padding-left:20px; padding-top: 20px;">
        <tr style="padding-bottom: 10px;">
            <td style="text-align: left;">
                <ajaxToolkit:TabContainer ID="recipienteAbaContratoPrincipal" runat="server" CssClass="abaPainel">
                    <ajaxToolkit:TabPanel ID="painelAbaGeral" runat="server" HeaderText="Geral">
                        <ContentTemplate>
                            <table style="margin-bottom:50px" width="800px">
                                <tr>
                                    <td colspan="3">
                                        <b>Item de Empréstimo</b>
                                        <br />
                                        (<asp:Label ID="labelIdItem" runat="server"></asp:Label>)&nbsp;
                                        <asp:Label ID="labelItemEmprestimo" runat="server"></asp:Label>
                                    </td>
                                    <td rowspan="2">
                                        <asp:CheckBox ID="checkEstornado" runat="server" Text="Estornado" ForeColor="Black" Font-Bold="true" Enabled="false" />
                                        <br />
                                        <asp:CheckBox ID="checkAbonado" runat="server" Text="Abonado" ForeColor="Black" Font-Bold="true" Enabled="false" />
                                        <br />
                                        <asp:CheckBox ID="checkQuitado" runat="server" Text="Quitado" ForeColor="Black" Font-Bold="true" Enabled="false" />
                                    </td>
                                    <td rowspan="2">
                                        <asp:CheckBox ID="checkEnviado" runat="server" Text="Enviado" ForeColor="Black" Font-Bold="true" Enabled="false" />
                                        <br />
                                        <asp:CheckBox ID="checkBaixado" runat="server" Text="Baixado" ForeColor="Black" Font-Bold="true" Enabled="false" />
                                        <br />
                                        <asp:CheckBox ID="checkSuspenso" runat="server" Text="Suspenso" ForeColor="DarkRed" Font-Bold="true" Enabled="false" />
                                    </td>
                                    <td rowspan="2">
                                        <asp:CheckBox ID="checkEntradaManual" runat="server" Text="Entrada Manual" ForeColor="Blue" Font-Bold="true" Enabled="false" />
                                        <br />
                                        <asp:CheckBox ID="checkCentraliza" runat="server" Text="Centralizador" ForeColor="Green" Font-Bold="true" Enabled="false" />
                                        <br />
                                        <asp:CheckBox ID="checkDestacado" runat="server" Text="Destacado" ForeColor="Green" Font-Bold="true" Enabled="false" />
                                    </td> 
                                </tr>
                                <tr>
                                    <td>
                                        <b>Evento</b>
                                        <br />
                                        <asp:Label ID="labelEvento" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <b>Origem</b>
                                        <br />
                                        <asp:Label ID="labelOrigem" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Data Prevista</b>
                                        <br />
                                        <asp:Label ID="labelDataPrevista" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <b>Data Efetiva</b>
                                        <br />
                                        <asp:Label ID="labelDataEfetiva" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <b>Data Vencimento</b>
                                        <br />
                                        <asp:Label ID="labelDataVencimento" runat="server"></asp:Label>
                                    </td>
                                    <td></td>
                                    <td>
                                        <b>Nº Parcela</b>
                                        <br />
                                        <asp:Label ID="labelParcelas" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <b>Parcelas Restantes</b> 
                                        <br />
                                        <asp:Label ID="labelParcelasRestantes" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Valor Previsto</b>
                                        <br />
                                        <asp:Label ID="labelValorPrevisto" runat="server" ></asp:Label>
                                    </td>
                                    <td>
                                        <b>Valor Efetivo</b>
                                        <br />
                                        <asp:Label ID="labelValorEfetivo" runat="server" ></asp:Label>
                                    </td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Competência</b>
                                        <br />
                                        <asp:Label ID="labelCompetencia" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <b>Cobrança</b>
                                        <br />
                                        <asp:Label ID="labelCobranca" runat="server"></asp:Label>
                                    </td>
                                    <td></td>
                                    <td>
                                        <b>Taxa de Juros</b>
                                        <br />
                                        <asp:Label ID="labelTaxaJuros" runat="server" ></asp:Label>
                                    </td>
                                    <td>
                                        <b>Saldo Devedor</b>
                                        <br />
                                        <asp:Label ID="labelSaldoDevedor" runat="server" ></asp:Label>
                                    </td>
                                    <td>
                                        <b>Data de Atualização</b>
                                        <br />
                                        <asp:Label ID="labelDataAtualizacao" runat="server" ></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="espacamento" colspan="6" style="border-bottom: dashed 1px #ccc">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="espacamento" colspan="6">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Usuário</b>
                                        <br />
                                        <asp:Label ID="labelUsuario" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <b>Data de inclusão</b>
                                        <br />
                                        <asp:Label ID="labelDataInclusao" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <b>Versão</b>
                                        <br />
                                        <asp:Label ID="labelVersao" runat="server"></asp:Label>
                                    </td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td colspan="6" style="padding-bottom:5px; padding-top:20px">
                                        <b>Observação</b>
                                        <glw:BotaoAcao ID="botaoAlterarObservacao" runat="server" urlDaImagem="~/Imagens/imgAlterar.png" EnableViewState="true"></glw:BotaoAcao>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6">
                                        <asp:TextBox ID="caixaTextoObservacao" Width="100%" runat="server" TextMode="MultiLine" Rows="2" ReadOnly="true"></asp:TextBox>
                                        <asp:HiddenField ID="hdnObservacao" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="painelAbaStatus" runat="server" HeaderText="Status">
                        <ContentTemplate>
                            <table style="text-align: left;" cellpadding="2" cellspacing="2" width="800px">
                                <%--William Moreira da Silva - SOL 199847 KINTANA 1926357--%>
                                <tr>
                                    <td colspan="2">
                                        <fieldset>
                                            <legend>
                                                <asp:CheckBox ID="checkSuspenso_status" runat="server" Text="Suspenso" Enabled="false" />
                                            </legend>
                                            <table>
                                                <tr>
                                                    <td>
                                                        Tipo Suspensão:
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="labelTipoSuspensao" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </fieldset>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <fieldset>
                                            <legend>
                                                <asp:CheckBox ID="checkBaixado_status" runat="server" Text="Baixado" Enabled="false" />
                                                <asp:CheckBox ID="checkBaixaManual" runat="server" Text="Baixa Manual" Enabled="false" />
                                            </legend>
                                            <table>
                                                <tr>
                                                    <td>
                                                        Data Efetiva:&nbsp;
                                                        <asp:Label ID="labelDataEfetivaStatus" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Data Recebimento:&nbsp;
                                                        <asp:Label ID="labelDataRecebimento" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </fieldset>
                                    </td>
                                    <td>
                                        <fieldset>
                                            <legend>
                                                <asp:CheckBox ID="checkEnviado_status" runat="server" Text="Enviado" Enabled="false" />
                                            </legend>
                                            <table>
                                                <tr>
                                                    <td>
                                                        Data do último envio:
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="labelDataUltimoEnvio" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                        </fieldset>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <fieldset>
                                            <legend>
                                                <asp:CheckBox ID="checkDivergencia" runat="server" Text="Divergência" Enabled="false" />
                                            </legend>
                                            <table>
                                                <tr>
                                                    <td>Tipo de Divergência:
                                                        <asp:Label ID="labelTipoDivergencia" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                        </fieldset>
                                    </td>
                                    <td>
                                        <fieldset>
                                            <legend>
                                                <asp:CheckBox ID="checkDivergenciaTratada" runat="server" Text="Divergência Tratada" Enabled="false" />
                                            </legend>
                                            <table>
                                                <tr>
                                                    <td>
                                                        Data Tratamento:
                                                        <asp:Label ID="labelDataTratamento" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Tipo de Tratamento Dado:
                                                        <asp:Label ID="labelTipoTratamentoDado" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </fieldset>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <fieldset>
                                            <legend>
                                                <asp:CheckBox ID="checkEstornado_status" runat="server" Text="Estornado" Enabled="false" />
                                            </legend>
                                            <table>
                                                <tr>
                                                    <td>
                                                        Data p/ Estorno:
                                                        <asp:Label ID="labelDataParaEstorno" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Data do Estorno:
                                                        <asp:Label ID="labelDataDoEstorno" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Usuário estorno:
                                                        <asp:Label ID="labelUsuarioEstorno" runat="server" CssClass="textoEstaticoNegrito"></asp:Label><br />
                                                    </td>
                                                </tr>
                                            </table>
                                        </fieldset>
                                    </td>
                                    <td>
                                        <fieldset>
                                            <legend>
                                                <asp:CheckBox ID="checkAbonado_status" runat="server" Text="Abonado" Enabled="false" />
                                                
                                                <asp:CheckBox ID="checkQuitado_status" runat="server" Text="Quitado" Enabled="false" />
                                            </legend>
                                            <table>
                                                <tr>
                                                    <td>
                                                        Data Quitação/Abono:
                                                        <asp:Label ID="labelDataQuitacaoAbono" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                        </fieldset>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <table width="100%" style="padding-top:20px">
                                            <tr>
                                                <td>
                                                    Valor Base:
                                                    <asp:Label ID="labelValorBase" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                </td>
                                                <td>
                                                    Destacado:
                                                    <asp:Label ID="labelDestacado" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                </td>
                                                <td style="padding-left:20px">
                                                    <asp:RadioButton ID="radioPagar" runat="server" Enabled="false" Text="A Pagar" />
                                                    <asp:RadioButton ID="radioReceber" runat="server" Enabled="false" Text="A Receber" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Entrada Manual:
                                                    <asp:Label ID="labelEntradaManual" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                </td>
                                                <td>
                                                    Centraliza:
                                                    <asp:Label ID="labelCentraliza" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Chave:
                                                    <asp:Label ID="labelChave" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="painelAbaIntegracao" runat="server" HeaderText="Integração">
                        <ContentTemplate>
                            <table style="text-align: left;" cellpadding="2" cellspacing="2" width="1050px">
                                <%--William Moreira da Silva - SOL 199847 KINTANA 1926357--%>
                                <tr>
                                    <td>
                                        <fieldset>
                                            <legend>Envio</legend>
                                            <table>
                                                <tr>
                                                    <td>
                                                        Destino do Envio:
                                                        <asp:Label ID="labelDestinoEnvio" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Rubrica para folha:
                                                        <asp:Label ID="labelRubricaFolha" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Data do último envio:
                                                        <asp:Label ID="labelDataUltimoEnvioIntegracao" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Chave Folha:
                                                        <asp:Label ID="labelChaveFolha" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <%--William Moreira da Silva - SOL 235176--%>
                                                    <td>
                                                        Documento CAP/ CAR:
                                                        <%--<asp:Label ID="labelDocumentoCaP" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>--%>
                                                        <asp:Label ID="labelDocumentoCaPCaR" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>  
                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                        <asp:Label ID="labelStatusDoc" runat="server" CssClass="textoEstaticoNegrito" ForeColor="Blue"></asp:Label>
                                                    </td>
                                                </tr>
                                                <%--<tr>
                                                    <td>
                                                        Documento CaR:
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="labelDocumentoCaR" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                    </td>
                                                </tr>--%>
                                                <%--William Moreira da Silva - SOL 235176--%>
                                            </table>
                                        </fieldset>
                                    </td>
                                    <td>
                                        <fieldset>
                                            <legend>Contabilidade</legend>
                                            <table>
                                                <tr>
                                                    <td>
                                                        Planilha de Apropriação:
                                                        <asp:Label ID="labelPlanilhaApropriacao" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Conta Contábil Débito:
                                                        <asp:Label ID="labelContaContabilDebito" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Conta Contábil Crédito:
                                                        <asp:Label ID="labelContaContabilCredito" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Planilha de Estorno:
                                                        <asp:Label ID="labelPlanilhaEstorno" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                        </fieldset>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="espacamento" colspan="2">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Histórico de Envio:
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="border: solid 1px #ccc">
                                        <div style="width: 1050px; overflow: auto; height: 180px;">
                                            <%--William Moreira da Silva - SOL 199847 KINTANA 1926357--%>
                                            <glw:Grid ID="gridHistorico" runat="server" Width="1050px" OnPageIndexChanging="gridHistorico_PageIndexChanging">
                                                <%--William Moreira da Silva - SOL 199847 KINTANA 1926357--%>
                                                <%--William Moreira da Silva - Ordenação do GRID - SOL 220958 KTN 2053543--%>
                                                <Columns>
                                                    <%--William Moreira da Silva SOL 220958 KTN 2053543--%>
                                                    <%--<glw:CampoLimitado DataField="formaCobranca" HeaderText="Cobrança" />--%>
                                                    <glw:CampoLimitado DataField="formaCobranca" HeaderText="Destino do Envio" />
                                                    <%--<glw:CampoLimitado DataField="tipoFolha" HeaderText="Folha" />--%>
                                                    <glw:CampoLimitado DataField="rubrica" HeaderText="Rubrica" />
                                                    <asp:TemplateField HeaderText="Data Envio" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <div class="campoDataGrid">
                                                                <span>
                                                                    <%# DataBinder.Eval(Container.DataItem, "dataEnvio", "{0:dd/MM/yyyy HH:mm:ss}")%></span>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <glw:CampoLimitado DataField="chaveFolha" HeaderText="Chave" />
                                                    <glw:CampoLimitado DataField="codigoDocumento" HeaderText="Doc. CaP/CaR" />
                                                    <asp:TemplateField HeaderText="Data Vencto" ItemStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <div class="campoDataGrid">
                                                                <span>
                                                                    <%# DataBinder.Eval(Container.DataItem, "dataVencimento", "{0:dd/MM/yyyy}") != "01/01/0001" ? DataBinder.Eval(Container.DataItem, "dataVencimento", "{0:dd/MM/yyyy}") : ""%></span>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <glw:CampoLimitado DataField="usuarioInclusao" HeaderText="Usuário" />
                                                    <glw:CampoLimitado DataField="observacao" HeaderText="Observações de Retorno" />
                                                    <%--William Moreira da Silva - SOL 199847 KINTANA 1926357--%>
                                                </Columns>
                                            </glw:Grid>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel ID="painelAbaLog" runat="server" HeaderText="Log">
                        <ContentTemplate>
                            <table style="text-align: left;" cellpadding="0" cellspacing="0" width="1050px">
                                <%--William Moreira da Silva - SOL 199847 KINTANA 1926357--%>
                                <tr>
                                    <td style="text-align: center;">
                                        <div style="width: 1050px; height: 250px; overflow: scroll;">
                                            <%--William Moreira da Silva - SOL 199847 KINTANA 1926357--%>
                                            <glw:Grid ID="gridLog" runat="server" Width="1250px" DataKeyNames="id" AllowSorting="true"
                                                AllowPaging="false">
                                                <%--William Moreira da Silva - SOL 199847 KINTANA 1926357--%>
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Data/Hora" ItemStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <div class="campoDataGrid">
                                                                <span>
                                                                    <%# DataBinder.Eval(Container.DataItem, "data", "{0:dd/MM/yyyy}")%></span>
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
<asp:Content ID="contentRodape" runat="server" ContentPlaceHolderID="ConteudoRodape">
    <glw:BotaoVoltar ID="botaoVoltar" runat="server" OnClientClick="javascript:fechar()"
        acaoPersonalizada="true"></glw:BotaoVoltar>
</asp:Content>
