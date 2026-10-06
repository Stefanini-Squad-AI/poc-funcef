<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/FormularioMestre.master"
    AutoEventWireup="true" CodeBehind="Visualizacao.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.Tratamentos.ContaCorrente.Visualizacao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ConteudoAdicionalHeadFormulario"
    runat="server">

    <script language="javascript" type="text/javascript">
        function exibirMsgConfirmacao() {
            if (!(document.getElementById('<%= caixaNumericaUpDownNumeroParcelasAtrasadasCobranca.ClientID %>').disabled)) {
                if (confirm("Atenção:\n\nApenas os Itens EM ABERTO e NÃO ENVIADOS serão alterados para refletir a nova\nforma de cobrança do Contrato.\n\nSe for necessário alterar a forma de cobrança de TODOS os Itens em aberto,\né necessário desfazer o envio desses itens ANTES de fazer a alteração contratual.\n\nDeseja prosseguir, alterando APENAS os itens não enviados?")) {
                    document.getElementById('<%= hiddenStatus.ClientID %>').value = 'S';
                } else {
                    document.getElementById('<%= hiddenStatus.ClientID %>').value = 'N';
                }
            }
            return true;
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="EspacoTituloPagina" runat="server">
    <glw:TituloPagina ID="abaContrato" titulo="Alterações Contratuais" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ConteudoFormulario" runat="server">
    <table cellpadding="1" cellspacing="0" border="0" width="100%">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" class="tableSecao">
                    <tr>
                        <td class="espacamento" style="width: 20%;">
                            Número do Contrato:
                        </td>
                        <td>
                            <asp:Label ID="labelNumeroContrato" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                        <td style="width: 20%;">
                            Situação Contrato:
                        </td>
                        <td>
                            <asp:Label ID="labelSituacaoContrato" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="espacamento" style="width: 20%;">
                            Inscrição Previdenciária:
                        </td>
                        <td>
                            <asp:Label ID="labelInscricaoPrevidenciaria" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                        <td style="width: 20%;">
                            Matrícula:
                        </td>
                        <td>
                            <asp:Label ID="labelMatriculaEmpresa" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="espacamento" style="width: 20%;">
                            Situação do Participante:
                        </td>
                        <td>
                            <asp:Label ID="labelSituacaoParticipante" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                        <td style="width: 20%;">
                            Inscrição em Empréstimo:
                        </td>
                        <td>
                            <asp:Label ID="labelInscricaoEmprestimo" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="espacamento" style="width: 20%;">
                            Plano Previdenciário:
                        </td>
                        <td>
                            <asp:Label ID="labelPlanoPrevidenciario" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                        <td style="width: 20%;">
                            Patrocinadora:
                        </td>
                        <td>
                            <asp:Label ID="labelPatrocinadora" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="espacamento" style="width: 20%;">
                            Nome:
                        </td>
                        <td>
                            <asp:Label ID="labelNome" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                        <td style="width: 20%;">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <br />
                <ajaxToolkit:TabContainer ID="recipienteAbaContratoPrincipal" runat="server" CssClass="abaPainel">
                    <ajaxToolkit:TabPanel runat="server" ID="painelAbaInformacoesContratuais" HeaderText="Contrato">
                        <HeaderTemplate>
                            Informações Contratuais
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table cellpadding="0" cellspacing="0" class="tableSecao">
                                <tr>
                                    <td class="espacamento" style="width: 10%;">
                                        Beneficiário:<br />
                                        <asp:Label ID="labelBeneficiario" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>
                                    <td style="width: 10%;">
                                        Data da Assinatura:<br />
                                        <asp:Label ID="labelDataAssinatura" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>
                                    <td style="width: 10%;">
                                        Data do Crédito:<br />
                                        <asp:Label ID="labelDataCredito" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>
                                    <td style="width: 10%;">
                                        Valor Solicitado:<br />
                                        <asp:Label ID="LabelValorSolicitado" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="espacamento" style="width: 10%;">
                                        Tipo de Contrato:<br />
                                        <asp:Label ID="labelTipoContrato" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>
                                    <td style="width: 10%;">
                                        Tipo de Empréstimo:<br />
                                        <asp:Label ID="labelTipoEmprestimo" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>
                                    <td style="width: 10%;">
                                        &nbsp;
                                    </td>
                                    <td style="width: 10%;">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel runat="server" ID="painelAbaAlteracoesContratuais" HeaderText="Alterações Contratuais">
                        <HeaderTemplate>
                            Alterações Contratuais
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table cellpadding="0" cellspacing="0" class="tableSecao">
                                <tr>
                                    <td class="espacamento" style="width: 10%;" colspan="2">
                                        Forma Cobrança:<br />
                                        <asp:RadioButton ID="botaoSelecaoUnicaContasReceber" runat="server" GroupName="formaCobranca" Text="Contas a Receber" AutoPostBack="true" />
                                        <br />
                                        <asp:RadioButton ID="botaoSelecaoUnicaFolhaPagamento" runat="server" GroupName="formaCobranca" Text="Folha de Pagamento" AutoPostBack="true" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="espacamento" style="width: 10%;">
                                        Conta Bancária para Débito:<br />
                                        <glw:ListaDropDown ID="caixaSelecaoContaBancariaDebito" runat="server" Width="250px"></glw:ListaDropDown>
                                    </td>
                                    <td style="width: 10%;">
                                        Conta-Caixa x Forma Recebimento:<br />
                                        <glw:ListaDropDown ID="caixaSelecaoContaCaixaFormaRecebimento" runat="server" Width="250px"></glw:ListaDropDown>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="espacamentoMaior" colspan="2">
                                        Número de Parcelas Atrasadas para Cobrança:
                                        <div style="display: flex">
                                            <glw:CaixaNumericaUpDown ID="caixaNumericaUpDownNumeroParcelasAtrasadasCobranca"
                                                runat="server" ValidationGroup="alteracoesContratuais" nomeCampo="Parcelas Atrasadas para Cobrança"
                                                valorMaximo="12" valorMinimo="0" Width="15px"></glw:CaixaNumericaUpDown>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="espacamento" colspan="5">
                                        <asp:Label runat="server" ID="lblHistorico" Text="Histórico de alterações da Conta Corrente:"></asp:Label>
                                        <div style="width: 830px; overflow: auto; height: 100px;">
                                            <glw:Grid ID="gridHistorico" runat="server" Width="800px">
                                                <Columns>
                                                    <glw:CampoEntidadeComplexa DataField="mutuario.dadosBancarios.contaCorrente" HeaderText="Conta Corrente" />
                                                    <asp:TemplateField HeaderText="Data" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <div class="campoDataGrid">
                                                                <span>
                                                                    <%# DataBinder.Eval(Container.DataItem, "dataSolicitacao", "{0:dd/MM/yyyy HH:mm:ss}")%></span>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <glw:CampoEntidadeComplexa DataField="usuario.login" HeaderText="Usuário" />
                                                </Columns>
                                            </glw:Grid>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel runat="server" ID="painelAbaBeneficiariosSeguro" HeaderText="Beneficiários do Seguro">
                        <HeaderTemplate>
                            Beneficiários do Seguro
                        </HeaderTemplate>
                        <ContentTemplate>
                            <glw:Grid ID="gridBeneficiariosSeguro" runat="server" Width="850px" DataKeyNames="nome"
                                AllowSorting="true">
                                <Columns>
                                    <glw:CampoLimitado DataField="nome" HeaderText="Nome" />
                                    <glw:CampoLimitado DataField="percentual" HeaderText="Indenização(%)" />
                                    <glw:CampoEntidadeComplexa DataField="dadosBancarios.banco" HeaderText="Banco" />
                                    <glw:CampoEntidadeComplexa DataField="dadosBancarios.agencia" HeaderText="Agência" />
                                    <glw:CampoEntidadeComplexa DataField="dadosBancarios.contaCorrente" HeaderText="Conta Corrente" />
                                    <glw:CampoLimitado DataField="outrasInformacoes" HeaderText="Outras Informações" />
                                </Columns>
                            </glw:Grid>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                </ajaxToolkit:TabContainer>
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="hiddenStatus" runat="server" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ConteudoBotoesAcao" runat="server">
    <glw:BotaoAlterar ID="botaoAlterar" runat="server" permissoesExigidas="alterar" OnClick="botaoAlterar_Click"
        comportamentoAlteracao="implementacaoAlteracao"></glw:BotaoAlterar>
    <glw:BotaoOk ID="botaoSalvar" runat="server" permissoesExigidas="alterar" OnClientClick="return exibirMsgConfirmacao();"
        efetuaAcaoSalvar="true" OnClick="botaoOk_Click"></glw:BotaoOk>
    <glw:BotaoVoltar ID="botaoVoltar" runat="server" urlVoltar="Listagem.aspx" permissoesExigidas="mascaraVazia"></glw:BotaoVoltar>
    <glw:BotaoSair ID="botaoSair" runat="server" permissoesExigidas="mascaraVazia"></glw:BotaoSair>
</asp:Content>
