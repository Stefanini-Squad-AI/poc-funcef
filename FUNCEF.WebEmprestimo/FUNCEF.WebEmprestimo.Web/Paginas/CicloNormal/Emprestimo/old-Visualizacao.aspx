<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/FormularioMestre.master"
    AutoEventWireup="true" CodeBehind="Visualizacao.aspx.cs" Inherits="FUNCEF.WebEmprestimo.Web.Paginas.CicloNormal.Emprestimo.Visualizacao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ConteudoAdicionalHeadFormulario"
    runat="server">

    <script language="javascript" type="text/javascript">
        var precisaRecalcular = false;

        function confirmarContrarEp() {
            if (!confirm('Deseja realmente contratar o Empréstimo?'))
                return false;
        }
        
        function confirmarVerificarConcessaoExistente() {
            if (!confirm('Já existe outro contrato com a mesma ou posterior data de crédito. Deseja conceder assim mesmo?'))
                return false;
            else
                document.getElementById('<%= botaoOcultoContinuarContratacaoEP.ClientID %>').click();
        }
        
        function confirmarVerificarSuspensaoAnterior(){
            if (!confirm('O Contrato anterior possui suspensão temporária. Não será permitido o reaproveitamento. Deseja contratar assim mesmo?'))
                return false;
            else
                document.getElementById('<%= botaoOcultoContinuarContratacaoEP1.ClientID %>').click();
        }
                
        
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="EspacoTituloPagina" runat="server">
    <glw:TituloPagina ID="aba1" runat="server" titulo="Inscrição / Concessão / Renovação" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ConteudoFormulario" runat="server">
    <table cellpadding="1" cellspacing="0" border="0" width="100%" class="tableSecao">
        <tr>
            <td colspan="3">
                <table cellpadding="0" cellspacing="0" class="tableSecao">
                    <tr class="espacamento">
                        <td>
                            <asp:CheckBox ID="checkBoxLiquidoZero" runat="server" Text="Líquido Zero" />
                        </td>
                        <td style="width: 20%">
                            <asp:CheckBox ID="checkBoxFinanciamento" runat="server" Text="Financiamento" />
                        </td>
                        <td>
                            <asp:CheckBox ID="checkBoxExcepcional" runat="server" Text="Excepcional" ForeColor="red" />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr class="espacamento">
                        <td>
                            Mutuário:
                        </td>
                        <td>
                            <asp:Label ID="labelMutuario" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                        <td>
                            Matrícula:
                        </td>
                        <td>
                            <asp:Label ID="labelMatricula" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                    </tr>
                    <tr class="espacamento">
                        <td>
                            Patrocinadora:
                        </td>
                        <td>
                            <asp:Label ID="labelPatrocinadora" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                        <td>
                            C.P.F:
                        </td>
                        <td>
                            <asp:Label ID="labelCPF" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                    </tr>
                    <tr class="espacamento">
                        <td>
                            Situação do Participante:
                        </td>
                        <td>
                            <asp:Label ID="labelSituacaoParticipante" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                        <td>
                            Plano Previdenciário:
                        </td>
                        <td>
                            <asp:Label ID="labelPlanoPrevidenciario" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                    </tr>
                    <tr class="espacamento">
                        <td>
                            Tipo de Contrato:
                        </td>
                        <td>
                            <asp:DropDownList ID="caixaSelecaoTipoContrato" runat="server" Width="250px" Style="padding-top: 10px;"
                                OnSelectedIndexChanged="caixaSelecaoTipoContrato_SelectedIndexChanged" AutoPostBack="true">
                            </asp:DropDownList>
                        </td>
                        <td>
                            Nome do Responsável:
                        </td>
                        <td>
                            <asp:Label ID="labelNomeResponsavel" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <ajaxToolkit:TabContainer ID="recipienteAbaInscricaoEmprestimo" runat="server" CssClass="abaPainel"
                    Enabled="false">
                    <ajaxToolkit:TabPanel runat="server" ID="painelAbaCondicoesContratuais" HeaderText="Contrato">
                        <HeaderTemplate>
                            Condições Contratuais
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table cellpadding="0" cellspacing="0" class="tableSecao" id="tableCondicoesContratuais">
                                <tr class="espacamento">
                                    <td>
                                        Res. Poupança:<br />
                                        <asp:Label ID="labelResPoupanca" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>
                                    <td>
                                        Salário Base:<br />
                                        <glw:CaixaNumerica ID="caixaNumericaSalarioBase" runat="server" casasDecimais="2"
                                            tipoNumerico="numero" valorMaximo="99999999.99">
                                        </glw:CaixaNumerica>
                                    </td>
                                    <td>
                                        Total Parcelas:<br />
                                        <asp:Label ID="labelTotalParcelas" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>
                                    <td>
                                        Pendências:<br />
                                        <asp:Label ID="labelPendencias" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>
                                    <td>
                                        Margem Consignável:<br />
                                        <glw:CaixaNumerica ID="caixaNumericaMargemConsignavel" runat="server" casasDecimais="2"
                                            tipoNumerico="numero" valorMaximo="99999999.99">
                                        </glw:CaixaNumerica>
                                    </td>
                                </tr>
                                <tr class="espacamento">
                                    <td>
                                        Data da Solicitação:<br />
                                        <glw:CaixaData ID="caixaDataSolicitacao" runat="server" Width="65px">
                                        </glw:CaixaData>
                                    </td>
                                    <td>
                                        Data da Assinatura:<br />
                                        <glw:CaixaData ID="caixaDataAssinatura" runat="server" Width="65px">
                                        </glw:CaixaData>
                                    </td>
                                    <td>
                                        Data do Crédito:<br />
                                        <glw:CaixaData ID="caixaDataCredito" runat="server" Width="65px">
                                        </glw:CaixaData>
                                    </td>
                                    <td>
                                        Carência:<br />
                                        <asp:Label ID="labelCarencia" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>
                                    <td>
                                        Data da 1ª Parcela:<br />
                                        <glw:CaixaData ID="caixaDataPrimeiraParcela" runat="server" Width="65px">
                                        </glw:CaixaData>
                                    </td>
                                </tr>
                                <tr class="espacamento">
                                    <td>
                                        Valor Máximo Permitido:<br />
                                        <glw:CaixaNumerica ID="caixaNumericaValorMaximoPermitido" runat="server" casasDecimais="2"
                                            Enabled="false" tipoNumerico="numero" valorMaximo="99999999.99">
                                        </glw:CaixaNumerica>
                                    </td>
                                    <td>
                                        Valor Solicitado:<br />
                                        <glw:CaixaNumerica ID="caixaNumericaValorSolicitado" runat="server" casasDecimais="2"
                                            tipoNumerico="numero" valorMaximo="99999999.99">
                                        </glw:CaixaNumerica>
                                    </td>
                                    <td>
                                        Taxa de Juros:<br />
                                        <asp:Label ID="labelTaxaJuros" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>
                                    <td>
                                        Prazo:<br />
                                        <glw:CaixaNumericaUpDown ID="caixaNumericaPrazo" runat="server"></glw:CaixaNumericaUpDown>
                                    </td>
                                    <td>
                                        Prestação Básica:<br />
                                        <asp:Label ID="labelPrestacaoBasica" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>
                                </tr>
                                <tr class="espacamento">
                                    <td colspan="2">
                                        Suspensão de Cobrança:<br />
                                        <asp:DropDownList ID="ListaDropDownSuspensaoCobranca" runat="server" Width="335px"
                                            AutoPostBack="true" OnSelectedIndexChanged="ListaDropDownSuspensaoCobranca_SelectedIndexChanged"
                                            Style="padding-top: 10px;">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        Parc. Suspensa:<br />
                                        <glw:CaixaNumericaUpDown ID="caixaNumericaSuspensao" runat="server"></glw:CaixaNumericaUpDown>
                                    </td>
                                    <td>
                                        Término Suspensão:<br />
                                        <glw:CaixaData ID="caixaDataTerminoSuspensao" runat="server" Enabled="false" Width="65px">
                                        </glw:CaixaData>
                                    </td>
                                    <td>
                                        Valor Parc. Suspensa:<br />
                                        <asp:Label ID="labelValorParcSuspensa" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>
                                </tr>
                                <tr class="espacamento">
                                    <td>
                                        Hora Encerramento:<br />
                                        <asp:Label ID="labelHoraEncerramento" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>
                                    <td>
                                        Indexador:<br />
                                        <glw:ListaDropDown ID="ListaDropDownIndexador" runat="server" Width="150px" Style="padding-top: 10px;">
                                        </glw:ListaDropDown>
                                    </td>
                                    <td>
                                        <asp:Label runat="server" ID="lblDivida" Text="Valor Dívida Previdenciária:" /><br />
                                         <glw:CaixaNumerica ID="caixaNumericaDividaPrevi" runat="server" casasDecimais="2"
                                            tipoNumerico="numero" valorMaximo="99999999.99">
                                        </glw:CaixaNumerica>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel runat="server" ID="painelAbaItens" HeaderText="Contrato">
                        <HeaderTemplate>
                            Itens
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table cellpadding="0" cellspacing="0" class="tableSecao">
                                <tr class="espacamento">
                                    <td>
                                        <glw:Grid ID="gridItens" runat="server" Width="850px">
                                            <Columns>
                                                <glw:CampoLimitado DataField="descricao" HeaderText="Item" />
                                                <asp:TemplateField HeaderText="Valor" ItemStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <div class="valorNumericoGrid">
                                                            <span>
                                                                <%# DataBinder.Eval(Container.DataItem, "valor", "{0:N2}")%></span>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </glw:Grid>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel runat="server" ID="painelAbaIntegracao" HeaderText="Contrato">
                        <HeaderTemplate>
                            Integração
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table cellpadding="0" cellspacing="0" class="tableSecao">
                                <tr class="espacamento">
                                    <td>
                                        <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                            <tr>
                                                <td>
                                                    <table cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td colspan="2">
                                                                <a class="textoEstatico">Conta</a><br />
                                                                <glw:Grid ID="gridIntegracaoCredito" runat="server" Width="850px" DataKeyNames="id">
                                                                    <Columns>
                                                                        <glw:CampoCheckBoxSelecao />
                                                                        <glw:CampoLimitado DataField="nomeBanco" HeaderText="Banco" />
                                                                        <glw:CampoLimitado DataField="agencia" HeaderText="Agência" />
                                                                        <glw:CampoLimitado DataField="contaCorrente" HeaderText="Conta Corrente" />
                                                                    </Columns>
                                                                </glw:Grid>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Forma Pagamento:<br />
                                                                <glw:ListaDropDown ID="caixaSelecaoFormaPagamento" runat="server" Width="250px">
                                                                </glw:ListaDropDown>
                                                            </td>
                                                            <td>
                                                                Conta-Caixa x Forma Pagamento:<br />
                                                                <glw:ListaDropDown ID="caixaSelecaoContaCaixaFormaPagamento" runat="server" Width="250px">
                                                                </glw:ListaDropDown>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="border-top: dashed 1px rgb(215, 215, 215);">
                                                    <table cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td align="left">
                                                                Conta-Caixa x Forma Recebimento:<br />
                                                                <glw:ListaDropDown ID="caixaSelecaoContaCaixaFormaRecebimento" runat="server" Width="250px">
                                                                </glw:ListaDropDown>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel runat="server" ID="painelAbaDividasEmprestimo" HeaderText="Contrato">
                        <HeaderTemplate>
                            Dívidas de Empréstimo
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table cellpadding="0" cellspacing="0" class="tableSecao">
                                <tr class="espacamento">
                                    <td>
                                        <glw:Grid ID="gridDividasEmprestimo" runat="server" Width="850px" DataKeyNames="numero"
                                            AllowSorting="true" OnRowDataBound="gridDividasEmprestimo_RowDataBound">
                                            <Columns>
                                                <glw:CampoCheckBoxSelecao OnalterarCheckBox="campo_CheckedChanged" />
                                                <glw:CampoLimitado DataField="numero" HeaderText="Contrato" />
                                                <glw:CampoEntidadeComplexa DataField="tipo.descricao" HeaderText="Tipo Contrato" />
                                                <asp:TemplateField HeaderText="Vlr. Contrato" ItemStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <div class="campoDataGrid">
                                                            <span>
                                                                <%# DataBinder.Eval(Container.DataItem, "valorContrato", "{0:N2}")%></span>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Dt. Crédito" ItemStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <div class="campoDataGrid">
                                                            <span>
                                                                <%# DataBinder.Eval(Container.DataItem, "dataCredito", "{0:dd/MM/yyyy}")%></span>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <glw:CampoLimitado DataField="totalParcelas" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"
                                                    HeaderText="Prazo" />
                                                <asp:TemplateField HeaderText="Parcela" ItemStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <div class="valorNumericoGrid">
                                                            <span>
                                                                <%# DataBinder.Eval(Container.DataItem, "valorParcela", "{0:N2}")%>&nbsp;</span>
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
                                                <asp:TemplateField HeaderText="Pendências" ItemStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <div class="valorNumericoGrid">
                                                            <span>
                                                                <%# DataBinder.Eval(Container.DataItem, "valorEmAberto", "{0:N2}")%>&nbsp;</span>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <glw:CampoLimitado DataField="parcelasPagas" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"
                                                    HeaderText="Pagas" />
                                                <asp:TemplateField HeaderText="Vlr. a Quitar" ItemStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <div class="valorNumericoGrid">
                                                            <span>
                                                                <%# DataBinder.Eval(Container.DataItem, "valorAQuitar", "{0:N2}")%>&nbsp;</span>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </glw:Grid>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="width: 100%; margin-right: 10px;">
                                        Valor Total para Quitação do(s) Contrato(s) anterior(es):<asp:Label ID="labelValorTotalQuitacaoContratoAnterior"
                                            runat="server" CssClass="textoEstaticoNegrito" Style="margin-left: 5px;"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel runat="server" ID="painelAbaBeneficiariosSeguro" HeaderText="Contrato">
                        <HeaderTemplate>
                            Beneficiários do Seguro
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table cellpadding="0" cellspacing="0" class="tableSecao">
                                <tr class="espacamento">
                                    <td>
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
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                </ajaxToolkit:TabContainer>
            </td>
        </tr>
        <tr>
            <td>
                Saldo a Quitar:<br />
                <asp:Label ID="labelSaldoQuitar" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
            </td>
            <td>
                Outros Descontos:<br />
                <asp:Label ID="labelOutrosDescontos" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
            </td>
            <td>
                Liquido Geral:<br />
                <asp:Label ID="labelLiquidoGeral" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ConteudoBotoesAcao" runat="server">
    <glw:BotaoAcao ID="botaoCalcular" runat="server" urlDaImagem="~/Imagens/imgCalculadora.PNG"
        Text="Calcular" OnClick="botaoCalcular_Click" OnClientClick="javascript:precisaRecalcular=false;"></glw:BotaoAcao>
    <glw:BotaoAcao Visible="false" ID="botaoSimulacao" runat="server" urlDaImagem="~/Imagens/imgCalculadora.PNG"
        Text="Simulação"></glw:BotaoAcao>
    <glw:BotaoAcao ID="botaoContratarEp" runat="server" urlDaImagem="~/Imagens/imgContratarEP.png"
        Text="Contrar EP" OnClick="botaoContratarEp_Click" OnClientClick="javascript:return confirmarContrarEp();"></glw:BotaoAcao>
    <glw:BotaoVoltar ID="botaoVoltar" runat="server" urlVoltar="Listagem.aspx" permissoesExigidas="mascaraVazia"></glw:BotaoVoltar>
    <glw:BotaoSair ID="botaoSair" runat="server" permissoesExigidas="mascaraVazia"></glw:BotaoSair>
    <glw:BotaoOculto ID="botaoOcultoContinuarContratacaoEP" runat="server" OnClientClick="javascript:return confirmarVerificarConcessaoExistente();"
        OnClick="botaoOcultoContinuarContratacaoEP_Click" />
    <glw:BotaoOculto ID="botaoOcultoContinuarContratacaoEP1" runat="server" OnClientClick="javascript:return confirmarVerificarSuspensaoAnterior();"
        OnClick="botaoOcultoContinuarContratacaoEP1_Click" />
</asp:Content>
