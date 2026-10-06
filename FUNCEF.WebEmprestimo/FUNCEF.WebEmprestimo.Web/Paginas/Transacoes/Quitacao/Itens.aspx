<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/FormularioMestre.master"
    AutoEventWireup="true" CodeBehind="Itens.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.Transacoes.Quitacao.Itens" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ConteudoAdicionalHeadFormulario" runat="server">
    <link rel="Stylesheet" href="../../../CssDinamico/jquery-ui.min.css" />
    <script type="text/javascript" src="../../../Scripts/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../../../Scripts/jquery-ui.min.js"></script>
    <script type="text/javascript" src="../../../Scripts/jquery.blockUI.js"></script>
    <script language="javascript" type="text/javascript">
        function bloqueiaInterface() {
            $.blockUI({ message: '<img src="../../../Imagens/aguarde.gif" /><h1 style="font-size: 14px"> Calculando os itens de quitação...</h1>', css: { border: 'none', padding: '15px', opacity: '0.9', width: '200px', height: '80px' } });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="EspacoTituloPagina" runat="server">
    <glw:TituloPagina ID="aba1" runat="server" titulo="Quitação Antecipada / por Falecimento" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ConteudoFormulario" runat="server">
    <table class="noPadding" cellpadding="1" cellspacing="0" border="0" width="100%">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" class="tableSecao">
                    <tr class="espacamento">
                        <td colspan="4">Itens em Aberto:
                            <div style="width: 1050px; height: 250px; overflow: scroll;">
                                <glw:Grid ID="gridItens" runat="server" Width="1050px" DataKeyNames="id">
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
                                        <asp:TemplateField HeaderText="Vencimento" ItemStyle-HorizontalAlign="Right">
                                            <ItemTemplate>
                                                <div class="campoDataGrid">
                                                    <span>
                                                        <%# DataBinder.Eval(Container.DataItem, "dataVencimento", "{0:dd/MM/yyyy}")%></span>
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
                                <asp:ObjectDataSource ID="dataSourceItensAberto" runat="server" SelectMethod="obterItensContratoEmAberto"
                                    TypeName="FUNCEF.Planus.WebEmprestimo.Web.Proxies.ProxyContrato"
                                    SortParameterName="ordenacao"
                                    StartRowIndexParameterName="indiceLinha"
                                    MaximumRowsParameterName="maximoLinhas"
                                    SelectCountMethod="totalItensContratoEmAberto"
                                    OnSelecting="dataSourceItensAberto_Selecting"
                                    EnablePaging="true" EnableCaching="false"></asp:ObjectDataSource>
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
        Text="Continuar" OnClientClick="bloqueiaInterface()" OnClick="botaoContinuar_Click" ValidationGroup="amortizacao"></glw:BotaoAcao>
    <glw:BotaoVoltar ID="botaoVoltar" runat="server" urlVoltar="Listagem.aspx" permissoesExigidas="mascaraVazia"
        acaoPersonalizada="true" OnClick="botaoVoltar_Click"></glw:BotaoVoltar>
    <glw:BotaoSair ID="botaoSair" runat="server" permissoesExigidas="mascaraVazia"></glw:BotaoSair>
</asp:Content>
