<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/FormularioMestre.master"
    AutoEventWireup="true" CodeBehind="Parcelas.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.Tratamentos.Individual.Parcelas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ConteudoAdicionalHeadFormulario"
    runat="server">
    <script language="javascript" type="text/javascript">

        function habilitaContaCaixa(combo) {
            if (combo.rows[0].cells[0].firstChild.checked) {
                document.getElementById('<%= contaCaixaxRecebimento.ClientID %>').disabled = false;
            }
            else {
                document.getElementById('<%= contaCaixaxRecebimento.ClientID %>').disabled = true;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="EspacoTituloPagina" runat="server">
    <glw:TituloPagina ID="aba1" titulo="Tratamento Individual de Parcelas" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ConteudoFormulario" runat="server">
    <table cellpadding="2" cellspacing="2" width="100%">
        <tr>
            <td>Parcela Tratada
            </td>
        </tr>
    </table>
    <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td class="espacamento">
                <div style="padding-left: 2%">
                    <glw:Grid ID="gridParcelaTratada" runat="server" OnPageIndexChanging="gridParcelaTratada_PageIndexChanging" OnRowDataBound="gridParcelaTratada_RowDataBound" DataKeyNames="id">
                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="Tratamento" HeaderStyle-Width="240px">
                                <ItemTemplate>
                                    <div class="campoDataGrid">
                                        <span>
                                            <%# DataBinder.Eval(Container.DataItem, "tipoTratamento", "{0:dd/MM/yyyy}") %>
                                                    
                                        </span>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Mês Cobrança">
                                <ItemTemplate>
                                    <div class="campoDataGrid">
                                        <span>
                                            <%# DataBinder.Eval(Container.DataItem, "dataCobranca") %>
                                                    
                                        </span>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nº Parcela" HeaderStyle-Width="120px">
                                <ItemTemplate>
                                    <div class="campoDataGrid">
                                        <span>
                                            <%# DataBinder.Eval(Container.DataItem, "parcela", "{0}") %>
                                                    
                                        </span>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Item" HeaderStyle-Width="240px">
                                <ItemTemplate>
                                    <div class="campoDataGrid">
                                        <span>
                                            <%# DataBinder.Eval(Container.DataItem, "descricao", "{0:dd/MM/yyyy}") %>
                                                    
                                        </span>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Valor" HeaderStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <div class="campoDataGrid">
                                        <span>
                                            <%# DataBinder.Eval(Container.DataItem, "valor", "{0:N2}") %>
                                                    
                                        </span>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <SelectedRowStyle Font-Bold="true" ForeColor="Red" />
                    </glw:Grid>
                </div>
            </td>
        </tr>
    </table>
    <br />
    <table cellpadding="2" cellspacing="2" width="100%">
        <tr>
            <td class="espacamento" style="width: 250px;">
                <asp:Panel ID="pnlDebito" runat="server" Enabled="false" GroupingText="Débito" Width="200px">
                    <asp:RadioButtonList runat="server" ID="rblDebito" onclick="habilitaContaCaixa(this);">
                        <asp:ListItem Text="Contas a Receber"></asp:ListItem>
                        <asp:ListItem Text="Folha de Pagamento"></asp:ListItem>
                    </asp:RadioButtonList>
                </asp:Panel>
            </td>
            <td>Conta-Caixa x Forma Recebimento<br />
                <asp:DropDownList runat="server" ID="contaCaixaxRecebimento" Width="300px" Enabled="false">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <div id="divTipoRecurso" runat="server" width="100%">
                    <table width="100%">
                        <tr>
                            <td width="20%">
                                Tipo do Recurso<br />
                                <asp:DropDownList runat="server" ID="tipoRecurso" Width="90%" Enabled="false"></asp:DropDownList>
                            </td>
                            <td width="80%">
                                Identificação de Origem do Recurso<br />
                                <glw:CaixaTexto ID="origemRecurso" runat="server" Width="100%" Enabled="false"> </glw:CaixaTexto>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ConteudoBotoesAcao" runat="server">
    <glw:BotaoAcao ID="botaoContinuar" runat="server" OnClick="botaoContinuar_Click" permissoesExigidas="mascaraVazia" tagImagem="botaoProximo" Visible="true"
        Text="Continuar"></glw:BotaoAcao>
    <glw:BotaoVoltar ID="botaoVoltar" runat="server" acaoPersonalizada="true" permissoesExigidas="mascaraVazia" OnClick="voltar_OnClick"></glw:BotaoVoltar>
    <glw:BotaoSair ID="botaoSair" runat="server" permissoesExigidas="mascaraVazia"></glw:BotaoSair>
</asp:Content>
