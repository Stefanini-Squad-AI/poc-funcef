<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/FormularioMestre.master"
    AutoEventWireup="true" CodeBehind="Valores.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.Tratamentos.Individual.Valores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ConteudoAdicionalHeadFormulario"
    runat="server">

    <link rel="Stylesheet" href="../../../CssDinamico/jquery-ui.min.css" />
    <script type="text/javascript" src="../../../Scripts/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../../../Scripts/jquery-ui.min.js"></script>
    <script type="text/javascript" src="../../../Scripts/jquery.blockUI.js"></script>
    <script language="javascript" type="text/javascript">

        //window.onload = calcularTotal;

        function calcularTotal() {
            debugger;
            var grid = document.getElementById('<%= gridItensGerados.ClientID %>');
            var total = 0.00;

            for (var i = 1; i < grid.rows.length; i++) {
                var aux = grid.rows[i].cells[4].innerText.replace(".", "#".trim());
                aux = aux.replace(",", ".");
                aux = aux.replace("#", "");
                var valorItem = parseFloat(aux);

                total += valorItem;
            }

            if (total != 0) {
                document.getElementById('<%= totalSelecionado.ClientID %>').value = total.toFixed(2).replace(".", ",");
                    }
                    else {
                        document.getElementById('<%= totalSelecionado.ClientID %>').value = 0;
                    }
                    document.getElementById('<%= totalSelecionado.ClientID %>').onblur();
        }
        function confirmar() {
            if (!confirm('Deseja realizar o tratamento das parcelas previamente selecionadas?'))
                return false;
            $.blockUI({ message: '<img src="../../../Imagens/aguarde.gif" /><h1 style="font-size: 14px"> Aguarde...</h1>', css: { border: 'none', padding: '15px', opacity: '0.9', width: '200px', height: '50px'}});
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="EspacoTituloPagina" runat="server">
    <glw:TituloPagina ID="aba1" titulo="Tratamento Individual de Parcelas" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ConteudoFormulario" runat="server">
    <table cellpadding="2" cellspacing="2" width="100%">
        <tr>
            <td class="espacamento">Itens a gerar:
            </td>
        </tr>
    </table>
    <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td class="espacamento">
                <div style="padding-left:2%">
                    <div style="width: 100%; height: 250px; overflow: scroll;">
                        <glw:Grid ID="gridItensGerados" Width="98%" PageSize="200" HeaderStyle-CssClass="barraFixa" 
                            OnPageIndexChanging="gridItensGerados_PageIndexChanging" runat="server" DataKeyNames="id">
                            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                            <Columns>
                                <glw:CampoEntidadeComplexa DataField="item.descricao" HeaderText="Item" ItemStyle-CssClass="text-align"/>
                                <glw:CampoEntidadeComplexa DataField="parcela" HeaderText="Nº Parcela" />
                                <glw:CampoEntidadeComplexa DataField="tipoMovimento.descricao" HeaderText="Evento" ItemStyle-CssClass="text-align" />
                                <glw:CampoEntidadeComplexa DataField="dataVencimento" HeaderText="Data Vencto." ItemStyle-CssClass="text-align" DataFormatString="{0:dd/MM/yyyy}" />
                                <asp:TemplateField HeaderText="Valor Previsto" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <div class="valorNumericoGrid">
                                            <span>
                                                <%# DataBinder.Eval(Container.DataItem, "valorPrevisto", "{0:N2}")%>&nbsp;</span>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Saldo Devedor" ItemStyle-HorizontalAlign="Right" Visible="true">
                                    <ItemTemplate>
                                        <div class="valorNumericoGrid">
                                            <span>
                                                <%# DataBinder.Eval(Container.DataItem, "saldoDevedor", "{0:N2}")%>&nbsp;</span>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                            <SelectedRowStyle Font-Bold="true" ForeColor="Red" />
                        </glw:Grid>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td class="espacamento" align="right">Total a lançar:
                <glw:CaixaNumerica ID="totalSelecionado" runat="server" casasDecimais="2" tipoNumerico="numero" Enabled="false"></glw:CaixaNumerica>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ConteudoBotoesAcao" runat="server">
    <glw:BotaoAcao ID="botaoConfirmar" OnClientClick="return confirmar();" runat="server" tagImagem="botaoOk" Text="Confirmar" OnClick="botaoConfirmar_Click"></glw:BotaoAcao>    
    <glw:BotaoAcao ID="BotaoImprimirTermo" runat="server" Text="Termo" OnClick="BotaoImprimirTermo_Click" urlDaImagem ="~/Imagens/imgPdf.png"></glw:BotaoAcao>    
    <glw:BotaoVoltar ID="botaoVoltar" runat="server" OnClick="voltar_OnClick" acaoPersonalizada="true" permissoesExigidas="mascaraVazia"></glw:BotaoVoltar>
    <glw:BotaoSair ID="botaoSair" runat="server" permissoesExigidas="mascaraVazia"></glw:BotaoSair>
</asp:Content>
