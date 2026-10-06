<%--SIG 62003.69601
    Autor: Marcelo Valério Ferreira
  
    Descrição:
    Inclusão do sistema de amortização
--%>

<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/FormularioMestre.master"
    AutoEventWireup="true" CodeBehind="Visualizacao.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.CicloNormal.Cancelamento.Visualizacao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ConteudoAdicionalHeadFormulario"
    runat="server">

  
    <style type="text/css">      
        .lblAcordoJudicial {
            color: #DAA520;
            font-size:10pt;
        }   
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
        }

        function exibirLoading() {
            var div = document.getElementById('divLoading');            
            var img = '<%= ResolveUrl("~/Imagens/aguarde.gif") %>';

            //tr.style.display = '';
            div.style.display = '';
            div.innerHTML = '<img src=\"' + img + '\" style=\"border: 0; width: 16px; height: 16px;\" />';

            setTimeout(function () {
                div.innerHTML = '<img src=\"' + img + '\" style=\"border: 0; width: 16px; height: 16px;\" />';
            }, 10);
        }

        function validaCampo(sender) {
            if (sender.value.replace(/[^0-9]/g, '') != sender.originalvalue.replace(/[^0-9]/g, '')) {
                sender.value = sender.value.replace(/[^0-9./]/g, '');
                exibirLoading();
                sender.onchange();
            }
        }

        function ConfirmarComAtualizacaoDiaria() {
            if (!confirm('O contrato já possui atualização diária. Deseja continuar com o cancelamento?'))
                return false;
            else
                document.getElementById('<%= botaoOcultoCancelarConcessao.ClientID %>').click();
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="EspacoTituloPagina" runat="server">
    <glw:TituloPagina ID="aba1" titulo="Cancelamento de concessão" runat="server" />
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
                            <table cellpadding="0" cellspacing="0" width="100%" border="0">
                                <tr>
                                    <td style="width: 20%;"  class="espacamento">Nº Contrato:</td>
                                    <td style="width: 35%;">
                                        <asp:Label ID="labelNumeroContrato" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="espacamento">
                                        Mutuário:
                                    </td>
                                    <td>
                                        <asp:Label ID="labelMutuario" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>
                                    <td>
                                        Inscrição Previdenciária:
                                    </td>
                                    <td>
                                        <asp:Label ID="labelInscricaoPrevidenciara" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="espacamento">
                                        Matrícula:
                                    </td>
                                    <td>
                                        <asp:Label ID="labelMatriculaEmpresa" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>
                                    <td>
                                        Inscrição em Empréstimo:
                                    </td>
                                    <td>
                                        <asp:Label ID="labelInscricaoEmprestimo" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="espacamento">
                                        Plano Previdenciário:
                                    </td>
                                    <td>
                                        <asp:Label ID="labelPlanoPrevidenciario" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>
                                    <td>
                                        Entidade Contábil:
                                    </td>
                                    <td>
                                        <asp:Label ID="labelEntidadeContabil" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="espacamento">
                                        Situação do Participante:
                                    </td>
                                    <td>
                                        <asp:Label ID="labelSituacaoParticipante" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>
                                    <td>
                                        Patrocinadora:
                                    </td>
                                    <td>
                                        <asp:Label ID="labelPatrocinadora" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="espacamento">
                                        Cedido:
                                    </td>
                                    <td>
                                        <asp:Label ID="labelCedido" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>
                                    <td>
                                        Situação Funcional:
                                    </td>
                                    <td>
                                        <asp:Label ID="labelSituacaoFuncional" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="espacamento">
                                        Situação do Plano:
                                    </td>
                                    <td>
                                        <asp:Label ID="labelSituacaoPlano" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>
                                    <td>
                                        NUP:
                                    </td>
                                    <td>
                                        <asp:Label ID="labelNUP" runat="server" CssClass="textoEstaticoNegrito"> </asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="4" style="padding-bottom: 7px;">
                                        <ajaxToolkit:TabContainer ID="recipienteAbaContratoSecundario" runat="server" CssClass="">
                                            <ajaxToolkit:TabPanel runat="server" ID="painelAbaDadosContrato" HeaderText="Dados do Contrato">
                                                <HeaderTemplate>
                                                    Dados do Contrato
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <table cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                            <td style="width: 20%;" class="espacamento">
                                                                Tipo de Contrato:
                                                            </td>
                                                            <td style="width: 35%;">
                                                                <asp:Label ID="labelTipoContrato" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>
                                                            <td style="width: 20%;">
                                                                Indexador:
                                                            </td>
                                                            <td style="width: 30%;">
                                                                <asp:Label ID="labelIndexador" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="espacamento">
                                                                Responsável:
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="labelResponsavel" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>
                                                            <td >
                                                                Data Assinatura:
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="labelDataAssinatura" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="espacamento">
                                                                Data Solicitação:
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="labelDataSolicitacao" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
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
                                                                Data 1ª Parcela:
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="labelDataPrimeiraParcela" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>
                                                            <td>
                                                                Acordo Judicial:
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="labelAcordoJudicial" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td> 
                                                        </tr>
                                                        <tr>
                                                            <td class="espacamento">
                                                                Origem da Concessão:</td>
                                                            <td>
                                                                <asp:Label ID="labelInternet" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>                                                            
                                                        </tr>
                                                        <tr>
                                                            <td class="espacamento">
                                                                Concessão Excepcional:
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="labelExcepcional" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>                                                             
                                                        </tr>     
                                                        <tr>
                                                            <td colspan="2">
                                                                <fieldset id="fdsExcepcional" runat="server" class="BorderFildset">
                                                                    <asp:CheckBoxList runat="server" ID="chklistExcepcional" Enabled="false" RepeatDirection="Horizontal">
                                                                        <asp:ListItem Text="Valor Solicitado"></asp:ListItem>
                                                                        <asp:ListItem Text="Elegibilidade"></asp:ListItem>
                                                                        <asp:ListItem Text="Inadimplência"></asp:ListItem>
                                                                        <asp:ListItem Text="Outros"></asp:ListItem>
                                                                    </asp:CheckBoxList>
                                                                </fieldset>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ContentTemplate>
                                            </ajaxToolkit:TabPanel>
                                            <ajaxToolkit:TabPanel runat="server" ID="painelAbaValores" HeaderText="Valores">
                                                <ContentTemplate>
                                                    <table cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                            <td style="width: 20%;" class="espacamento">
                                                                Valor Solicitado:
                                                            </td>
                                                            <td style="width: 30%;">
                                                                <b>R$ </b><asp:Label ID="labelValorSolicitado" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>
                                                            <td style="width: 20%;">
                                                                Valor Parcela Base:
                                                            </td>
                                                            <td style="width: 20%;">
                                                                <b>R$ </b><asp:Label ID="labelValorParcelaBase" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="espacamento">
                                                                Salário Considerado:
                                                            </td>
                                                            <td>
                                                                <b>R$ </b><asp:Label ID="labelSalarioConsiderado" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>
                                                            <td>
                                                                Taxa de Juros:
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="labelTaxaJuros" runat="server" CssClass="textoEstaticoNegrito"></asp:Label><b>%</b>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="espacamento">
                                                                Saldo devedor:
                                                            </td>
                                                            <td>
                                                                <b>R$ </b><asp:Label ID="labelSaldoDevedor" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>
                                                            <td>
                                                                Margem Considerada:
                                                            </td>
                                                            <td>
                                                                <b>R$ </b><asp:Label ID="labelMargemConsiderada" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="espacamento">
                                                                Número Parcelas:
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="labelNumeroParcelas" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>
                                                            <td>
                                                                Parcelas Restantes:
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="labelParcelasRestantes" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="espacamento">
                                                                Parcelas a Cobrar:
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="labelParcelasCobrar" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>
                                                            <td>
                                                                Nº Contratos Quitados:
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="labelNrContratosQuitados" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="espacamento">
                                                                Valor Máximo Permitido:
                                                            </td>
                                                            <td>
                                                                <b>R$ </b><asp:Label ID="labelvlrMaxPermitido" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                            <td class="espacamento">Contratos Quitados:</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="espacamento">
                                                                <div style="width: 630px; overflow: auto; height: 100px;">
                                                                    <glw:Grid ID="gridContratosQuitados" runat="server" Width="610px">
                                                                        <Columns>                                                                                                                                                       
                                                                            <asp:TemplateField HeaderText="Número contrato" ItemStyle-HorizontalAlign="Right">
                                                                                <ItemTemplate>
                                                                                    <div class="campoDataGrid">
                                                                                        <span>
                                                                                            <%# DataBinder.Eval(Container.DataItem, "numero") != null ? DataBinder.Eval(Container.DataItem, "numero") : ""%></span>
                                                                                    </div>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>                                                                            
                                                                            <asp:TemplateField HeaderText="Data de crédito" ItemStyle-HorizontalAlign="Right">
                                                                                <ItemTemplate>
                                                                                    <div class="campoDataGrid">
                                                                                        <span>
                                                                                            <%# DataBinder.Eval(Container.DataItem, "dataCredito", "{0:dd/MM/yyyy}") != null ? DataBinder.Eval(Container.DataItem, "dataCredito", "{0:dd/MM/yyyy}") : ""%></span>
                                                                                    </div>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <glw:CampoLimitado DataField="valorQuitado" HeaderText="Valor da quitação (R$)" />
                                                                            <glw:CampoLimitado DataField="modalidade" HeaderText="Modalidade" />
                                                                        </Columns>
                                                                    </glw:Grid>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ContentTemplate>
                                            </ajaxToolkit:TabPanel>                                           
                                        </ajaxToolkit:TabContainer>
                                    </td>
                                </tr>

                                <tr>   
                                    <td colspan="4" style="border-top: dashed 1px rgb(215, 215, 215); padding-top: 6px;" >
                                        <table border="0" width="100%">
                                            <tr>
                                                <td align="right">
                                                    <asp:Label runat="server" Font-Bold="true">Informe o protocolo CRM:</asp:Label>                                                                           
                                                    <asp:CustomValidator ID="ValidateCRM" runat="server" 
                                                        ControlToValidate="campoCRM" Display="Dynamic" Text="*" style="color:DarkRed" 
                                                        ErrorMessage="Não foi encontrado o protocolo CRM." 
                                                        OnServerValidate="ValidateCRM_ServerValidate"></asp:CustomValidator>                                        
                                                    
                                                    <asp:TextBox ID="campoCRM" runat="server" MaxLength="14" Width="17%"></asp:TextBox>                                                                                      
                                                </td>
                                                <td>
                                                    <div id="divLoading" style="display: none; font-weight: bold; color: red;"></div> 
                                                </td>
                                                <td align="right" style="width: 35%;"> 
                                                    <glw:BotaoAcao ID="botaoValidarCRM" runat="server" urlDaImagem="~/Imagens/imgProcurar.png"  Text="Validar CRM" OnClick="botaoValidarCRM_Click" OnClientClick="exibirLoading();"></glw:BotaoAcao>
                                                    <glw:BotaoAcao ID="botaoCancelarConcessao" runat="server" urlDaImagem="~/Imagens/imgSuspender.png" Text="Cancelar contrato" OnClick="botaoCancelarConcessao_Click" ></glw:BotaoAcao>                                                    
                                                    <glw:BotaoOculto ID="botaoOcultoCancelarConcessao" runat="server" OnClick="botaoOcultoCancelarConcessao_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>                                        
                                    <td colspan="4">
                                        <asp:ValidationSummary ID="vdsSumario"  runat="server" DisplayMode="BulletList" style="margin-left:45%" ForeColor="DarkRed" />
                                    </td>                                   
                                </tr>
                            </table>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel runat="server" ID="painelAbaItegracao" HeaderText="Dados bancários">
                        <ContentTemplate>
                            <asp:Panel ID="painelContaBancariaCreditoConcessao" runat="server" GroupingText="Conta Bancária para Crédito da Concessão ">
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="espacamento">
                                            Banco:
                                        </td>
                                        <td>
                                            <asp:Label ID="labelBancoCredito" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                        </td>
                                        <td>
                                            Agência:
                                        </td>
                                        <td>
                                            <asp:Label ID="labelAgenciaCredito" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Conta Corrente:
                                        </td>
                                        <td>
                                            <asp:Label ID="labelContaCorrenteCredito" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                        </td>
                                        <td>
                                            Favorecido:
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
                                        <td class="espacamento">
                                            Banco:
                                        </td>
                                        <td>
                                            <asp:Label ID="labelBancoDebito" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                        </td>
                                        <td>
                                            Agência:
                                        </td>
                                        <td>
                                            <asp:Label ID="labelAgenciaDebito" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Conta Corrente:
                                        </td>
                                        <td>
                                            <asp:Label ID="labelContaCorrenteDebito" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <br />
                            <table cellpadding="0" cellspacing="0" width="100%">
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
                                                        Forma de Pagamento:
                                                        <br />
                                                        <asp:Label ID="labelFormaPagamentoCredito" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Conta Caixa x Forma Pgto:
                                                        <br />
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
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Forma de Pagamento:
                                                        <br />
                                                        <asp:Label ID="labelFormaPagamentoDebito" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
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
                </ajaxToolkit:TabContainer>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ConteudoBotoesAcao" runat="server">
    <glw:BotaoVoltar ID="botaoVoltar" runat="server" urlVoltar="Listagem.aspx" permissoesExigidas="mascaraVazia"></glw:BotaoVoltar>
    <glw:BotaoSair ID="botaoSair" runat="server" permissoesExigidas="mascaraVazia"></glw:BotaoSair>
</asp:Content>
