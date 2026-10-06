<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/FormularioMestre.master"
    AutoEventWireup="true" CodeBehind="Valores.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.Transacoes.Quitacao.Valores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ConteudoAdicionalHeadFormulario" runat="server">
    <link rel="Stylesheet" href="../../../CssDinamico/jquery-ui.min.css" />
    <script type="text/javascript" src="../../../Scripts/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../../../Scripts/jquery-ui.min.js"></script>
    <script type="text/javascript" src="../../../Scripts/jquery.blockUI.js"></script>
    <script language="javascript" type="text/javascript">
        //William Moreira da Silva - SOL 239074 PPM 512316
        function desabilitaBotao(botao)
        {
            var caixaTexto = document.getElementById('<%= caitaTextoOrigemRecurso.ClientID %>');

            if (caixaTexto.value !== '') {
                document.getElementById('<%= botaoConfirmar.ClientID %>').style.visibility = "hidden";
                document.getElementById('<%= botaoVoltar.ClientID %>').style.visibility = "hidden";//Willliam Moreira da Silva - SOL 239915
                document.getElementById('<%= botaoSair.ClientID %>').style.visibility = "hidden";//Willliam Moreira da Silva - SOL 239915
                document.getElementById('<%= botaoDesconto.ClientID %>').style.visibility = "hidden";

                bloqueiaInterface();
            }
        }
        //William Moreira da Silva - SOL 239074 PPM 512316

        function bloqueiaInterface() {
            $.blockUI({ message: '<img src="../../../Imagens/aguarde.gif" /><h1 style="font-size: 14px"> Aguarde...</h1>', css: { border: 'none', padding: '15px', opacity: '0.9', width: '200px', height: '50px'}});
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="EspacoTituloPagina" runat="server">
    <glw:TituloPagina ID="aba1" runat="server" titulo="Quitação Antecipada / por Falecimento" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ConteudoFormulario" runat="server">
    <table cellpadding="1" cellspacing="0" border="0" width="100%">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="espacamento" colspan="4">
                            Valores Atualizados:
                            <glw:Grid ID="gridItens" runat="server" Width="850px" DataKeyNames="id" AllowSorting="true"
                                AllowPaging="false">
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
                                    <asp:TemplateField HeaderText="Saldo Devedor" ItemStyle-HorizontalAlign="Right">
                                        <ItemTemplate>
                                            <div class="valorNumericoGrid">
                                                <span>
                                                    <%# DataBinder.Eval(Container.DataItem, "saldoDevedor", "{0:N2}")%>&nbsp;</span>
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
                        </td>
                    </tr>
                </table>
                <table class="noPadding" cellpadding="0" cellspacing="0">
                    <tr>
                        <td style="padding-top:10px" />
                    </tr>
                    <tr>
                        <td colspan="4">
                            Dados Bancários:
                            <glw:Grid ID="gridDadosBancarios" runat="server" Width="850px" DataKeyNames="id"
                                AllowSorting="true" AllowPaging="false">
                                <Columns>
                                    <glw:CampoCheckBoxSelecao />
                                    <glw:CampoLimitado DataField="nomeBanco" HeaderText="Banco" ItemStyle-Width="300px"
                                        tamanhoMaximo="80" />
                                    <asp:BoundField HeaderText="Agência" DataField="agencia" />
                                    <asp:BoundField HeaderText="Conta Corrente" DataField="contaCorrente" />
                                </Columns>
                            </glw:Grid>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-top:15px" />
                    </tr>
                    <tr>
                        <td>
                            Forma Recebimento:
                        </td>
                        <td colspan="3">
                            <asp:DropDownList ID="comboFormaPagamento" runat="server" Width="350px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-top:15px" />
                    </tr>
                    <tr>
                        <td>
                            Forma de Envio:
                        </td>
                        <td>
                            <glw:ListaOpcoes ID="listaOpcoesFormaEnvio" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="C" Text="Financeiro" />
                                <asp:ListItem Value="F" Text="Folha" />
                            </glw:ListaOpcoes>
                        </td>
                        <td>
                            <div>
                                Tipo do Recurso:
                                <asp:DropDownList ID="comboTipoRecurso" runat="server" />                            
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-top:15px" />
                    </tr>
                    <tr>
                        <td>
                            Origem do Recurso:
                        </td>
                        <td colspan="3">
                            <glw:CaixaTexto ID="caitaTextoOrigemRecurso" runat="server" Width="347px" MaxLength="200"></glw:CaixaTexto>
                            <div>
                                <asp:RequiredFieldValidator ID="validadorOrigemRecurso" runat="server" ControlToValidate="caitaTextoOrigemRecurso"
                                    ErrorMessage="O campo Origem do Recurso é obrigatório." SetFocusOnError="true"
                                    Display="Dynamic" ValidationGroup="amortizacao">
                                </asp:RequiredFieldValidator>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-top:15px" />
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <glw:SumarioValidacao ID="sumario" ValidationGroup="amortizacao" runat="server" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ConteudoBotoesAcao" runat="server">
    <glw:BotaoAcao ID="botaoConfirmar" runat="server" permissoesExigidas="incluir" tagImagem="botaoOk"
        Text="Confirmar" OnClick="botaoConfirmar_Click" ValidationGroup="amortizacao" Enabled="true" Visible="true" OnClientClick="desabilitaBotao(this)"></glw:BotaoAcao>
    <glw:BotaoVoltar ID="botaoVoltar" runat="server" urlVoltar="Itens.aspx" permissoesExigidas="mascaraVazia"
        acaoPersonalizada="true" OnClick="botaoVoltar_Click"></glw:BotaoVoltar>
    <glw:BotaoAcao ID="botaoDesconto" runat="server" urlDaImagem="~/Imagens/Desconto.png"
        Text="Ver descontos" OnClick="botaoDesconto_Click"></glw:BotaoAcao>
    <glw:BotaoSair ID="botaoSair" runat="server" permissoesExigidas="mascaraVazia"></glw:BotaoSair>
</asp:Content>
