<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/FormularioMestre.master"
    AutoEventWireup="true" CodeBehind="Itens.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.Transacoes.Amortizacao.Itens" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ConteudoAdicionalHeadFormulario"
    runat="server">
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
                        <td class="espacamento" colspan="4">
                            Itens em Aberto:
                            <div style="width: 950px; height: 250px; overflow: scroll;">
                                <glw:Grid ID="gridItens" runat="server" Width="950px" DataKeyNames="id">
                                    <Columns>
                                        <glw:CampoEntidadeComplexa DataField="tipoEvento.descricao" HeaderText="Evento" />
                                        <asp:TemplateField HeaderText="Competência">
                                            <ItemTemplate>
                                                <span>
                                                    <%# DataBinder.Eval(Container.DataItem, "competencia", "{0:MM/yyyy}")%></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <glw:CampoEntidadeComplexa DataField="parcela" HeaderText="Parcela" />
                                        <glw:CampoEntidadeComplexa DataField="sequencia" HeaderText="Sequência" />
                                        <glw:CampoEntidadeComplexa DataField="descricao" HeaderText="Item" />
                                        <asp:TemplateField HeaderText="Previsão" ItemStyle-HorizontalAlign="Right">
                                            <ItemTemplate>
                                                <div class="campoDataGrid">
                                                    <span>
                                                        <%# DataBinder.Eval(Container.DataItem, "dataPrevista", "{0:dd/MM/yyyy}")%></span>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Valor Previsto" ItemStyle-HorizontalAlign="Right">
                                            <ItemTemplate>
                                                <div class="valorNumericoGrid">
                                                    <span>
                                                        <%# DataBinder.Eval(Container.DataItem, "valor", "{0:N2}")%>&nbsp;</span>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Taxa Juros" ItemStyle-HorizontalAlign="Right">
                                            <ItemTemplate>
                                                <div class="valorNumericoGrid">
                                                    <span>
                                                        <%# DataBinder.Eval(Container.DataItem, "taxaJuros", "{0:N2}")%>%&nbsp;</span>
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
                        </td>
                    </tr>
                    <tr>
                        <td class="espacamento" style="width: 150px;">
                            Margem Consignável:
                        </td>
                        <td>
                            <glw:CaixaNumerica ID="caixaTextoMargem" runat="server" casasDecimais="2" tipoNumerico="numero" valorMaximo="99999999.99" CssClass="inputValue" />
                            <div>
                                <asp:RequiredFieldValidator ID="validadorMargem" runat="server" ControlToValidate="caixaTextoMargem"
                                    ErrorMessage="O campo Margem Consignável é obrigatório." SetFocusOnError="true"
                                    Display="Dynamic" ValidationGroup="amortizacao">
                                </asp:RequiredFieldValidator>
                            </div>
                        </td>
                        <td style="width: 120px;">
                            Saldo Devedor:
                        </td>
                        <td style="width: 230px;">
                            <asp:Label ID="labelSaldo" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="espacamento">
                            Em Aberto:
                        </td>
                        <td>
                            <asp:Label ID="labelEmAberto" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
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
                            Valor a Amortizar:
                        </td>
                        <td>
                            <glw:CaixaNumerica ID="caixaTextoValor" runat="server" casasDecimais="2" tipoNumerico="numero" valorMaximo="99999999.99" CssClass="inputValue" />
                        </td>
                        <td>
                            Novo Prazo:
                        </td>
                        <td>
                            <asp:DropDownList ID="comboPrazo" runat="server">
                            </asp:DropDownList>
                            <div>
                                <asp:RequiredFieldValidator ID="validadorPrazo" runat="server" ControlToValidate="comboPrazo"
                                    ErrorMessage="O campo Novo Prazo é obrigatório." SetFocusOnError="true" Display="Dynamic"
                                    ValidationGroup="amortizacao">
                                </asp:RequiredFieldValidator>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <glw:SumarioValidacao ID="sumario" ValidationGroup="amortizacao" runat="server" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ConteudoBotoesAcao" runat="server">
    <glw:BotaoAcao ID="botaoContinuar" runat="server" permissoesExigidas="incluir" tagImagem="botaoProximo"
        Text="Continuar" OnClick="botaoContinuar_Click" ValidationGroup="amortizacao"></glw:BotaoAcao>
    <glw:BotaoVoltar ID="botaoVoltar" runat="server" urlVoltar="Visualizacao.aspx" permissoesExigidas="mascaraVazia"
        manterEstado="false" acaoPersonalizada="true" OnClick="botaoVoltar_Click"></glw:BotaoVoltar>
    <glw:BotaoSair ID="botaoSair" runat="server" permissoesExigidas="mascaraVazia"></glw:BotaoSair>
</asp:Content>
