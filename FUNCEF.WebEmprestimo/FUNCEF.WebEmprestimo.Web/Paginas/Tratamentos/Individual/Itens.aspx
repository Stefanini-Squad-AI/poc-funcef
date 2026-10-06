<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/FormularioMestre.master"
    AutoEventWireup="true" CodeBehind="Itens.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.Tratamentos.Individual.Itens" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ConteudoAdicionalHeadFormulario" runat="server">
    <link rel="Stylesheet" href="../../../CssDinamico/jquery-ui.min.css" />
    <script type="text/javascript" src="../../../Scripts/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../../../Scripts/jquery-ui.min.js"></script>
    <script type="text/javascript" src="../../../Scripts/jquery.blockUI.js"></script>
    <script language="javascript" type="text/javascript">

        window.onload = function () {
            var totalSelecionado = document.getElementById('<%= hiddenValorTotal.ClientID %>').value;
            document.getElementById('<%= totalSelecionado.ClientID %>').value = totalSelecionado;
        }

        function abrePopUpMotivo() {
            var url = "PopupMotivoAbono.aspx";
            var retorno = false;

            retorno = exibirDialogo(url, 500, 200);
        }

        function calcularTotal(check) {
            var grid = document.getElementById('<%= gridItensEmAberto.ClientID %>')
            var total = 0.00;

            var inputList = grid.getElementsByTagName("input");

            for (var i = 0; i < inputList.length; i++) {
                //The First element is the Header Checkbox
                var headerCheckBox = inputList[0];
                var checked = true;
                console.log(i);
                if (inputList[i].type == "checkbox") {// && inputList[i] != headerCheckBox) {
                    if (inputList[i].checked) {
                        var aux = grid.rows[i + 1].cells[9].innerText.replace(".", "#");
                        aux = aux.replace(",", ".");
                        aux = aux.replace("#", "");
                        var valorItem = parseFloat(aux);

                        total += valorItem;
                    }
                }
            }

            for (var i = 0; i < grid.rows.length; i++) {
                var checkBox = grid.rows[i].cells[0].childNodes[0];
                if (checkBox.checked) {
                    var aux = grid.rows[i].cells[9].innerText.replace(".", "#");
                    aux = aux.replace(",", ".");
                    aux = aux.replace("#", "");
                    var valorItem = parseFloat(aux);

                    total += valorItem;
                }
            }

            if (total != 0) {
                document.getElementById('<%= totalSelecionado.ClientID %>').value = total.toFixed(2).replace(".", ",");
            }
            else {
                document.getElementById('<%= totalSelecionado.ClientID %>').value = 0;
            }
            document.getElementById('<%= totalSelecionado.ClientID %>').onblur();
            document.getElementById('<%= hiddenValorTotal.ClientID %>').value = total.toFixed(2).replace(".", ",");
        }

        function validaNegativo(valor) {
            if (parseFloat(valor.value) < 0) {
                document.getElementById('<%= valorRecebido.ClientID %>').value = 0;
            }
        }

        function desmarcaMesmaParcela() {
<%--            var grid = document.getElementById('<%= gridItensEmAberto.ClientID %>')

            for (var i = 0; i < grid.rows.length; i++) {
                var checkBox = grid.rows[i].cells[0].childNodes[0];
                if (!checkBox.checked) {
                    var parcela = grid.rows[i].cells[3].innerText;
                    for (var j = 0; j < grid.rows.length; j++) {
                        if (grid.rows[j].cells[3].innerText == parcela) {
                            document.getElementById('<%= gridItensEmAberto.ClientID %>').rows[j].cells[0].childNodes[0].checked = false;
                        }
                    }
                }
            }
            calcularTotal(this);--%>
            return false;
        }

        function marcaMesmaParcela() {
            var grid = document.getElementById('<%= gridItensEmAberto.ClientID %>')

            for (var i = 0; i < grid.rows.length; i++) {
                var checkBox = grid.rows[i].cells[0].childNodes[1];
                if (checkBox.checked) {
                    var parcela = grid.rows[i].cells[3].innerText;
                    for (var j = 0; j < grid.rows.length; j++) {
                        if (grid.rows[j].cells[3].innerText == parcela) {
                            grid.rows[j].cells[0].childNodes[1].checked = true;
                        }
                    }
                }
            }
            calcularTotal(this);
            return false;
        }

        function inverteSelecao() {
            var grid = document.getElementById('<%= gridItensEmAberto.ClientID %>')

            for (var i = 1; i < grid.rows.length; i++) {
                var checkBox = grid.rows[i].cells[0].childNodes[1];
                if (checkBox.checked) {
                    grid.rows[i].cells[0].childNodes[1].checked = false;
                }
                else {
                    grid.rows[i].cells[0].childNodes[1].checked = true;
                }
            }
            calcularTotal(this);
            return false;
        }

        function selecionaTodos() {
            var grid = document.getElementById('<%= gridItensEmAberto.ClientID %>')

            for (var i = 1; i < grid.rows.length; i++) {
                grid.rows[i].cells[0].childNodes[1].checked = true;
            }
            calcularTotal(this);
            return false;
        }

        function bloqueiaInterface() {
            $.blockUI({ message: '<img src="../../../Imagens/aguarde.gif" /><h1 style="font-size: 14px"> Aguarde...</h1>', css: { border: 'none', padding: '15px', opacity: '0.9', width: '200px', height: '50px' } });
        }

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="EspacoTituloPagina" runat="server">
    <glw:TituloPagina ID="aba1" runat="server" titulo="Tratamento Individual de Parcelas" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ConteudoFormulario" runat="server">
    <div style="padding:10px">
        <b>
        Contrato:
        <asp:Label id="lblNumContrato" runat="server"></asp:Label>
        </b>
    </div>
    <table cellpadding="2" cellspacing="2" width="100%">
        <tr class="espacamento">
            <td class="espacamento">Itens em Aberto/ Baixa Manual:
            </td>
            <td align="right">
                <%--<glw:BotaoAcao ID="botaoX" OnClientClick="return desmarcaMesmaParcela();" efetuaAcaoSalvar="false" ToolTip="Desmarca registros com mesmo nº de parcela que o registro atual" runat="server" urlDaImagem="~/Imagens/imgExcluir.png"></glw:BotaoAcao>
                <glw:BotaoAcao ID="botaoCerto" OnClientClick="return marcaMesmaParcela();" efetuaAcaoSalvar="false" ToolTip="Marca registros com mesmo nº de parcela que o registro atual" runat="server" tagImagem="botaoOk"></glw:BotaoAcao>--%>
                <glw:BotaoAcao ID="BotaoDesconto" OnClick="BotaoDesconto_OnClick" ToolTip="Resumo dos descontos" runat="server" urlDaImagem="~/Imagens/desconto.png"></glw:BotaoAcao>
                <glw:BotaoAcao ID="botaoAtualizar" OnClientClick="return inverteSelecao();" efetuaAcaoSalvar="false" ToolTip="Inverte a Seleção" runat="server" urlDaImagem="~/Imagens/imgRefazer.png"></glw:BotaoAcao>
                <glw:BotaoAcao ID="botaoDoisCertos" OnClientClick="return selecionaTodos();" efetuaAcaoSalvar="false" ToolTip="Seleciona Todos" runat="server" urlDaImagem="~/Imagens/imgokDuplo.png"></glw:BotaoAcao></td>
        </tr>
    </table>
    <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td class="espacamento">
                <div style="width: 1200px; position: relative;">
                    <div style="width: 1200px; font-size: 70%; height: 250px; overflow: scroll;">
                        <%--Grid Itens em Aberto--%>
                        <glw:Grid ID="gridItensEmAberto" Width="98.6%" runat="server" HeaderStyle-CssClass="barraFixa" OnPageIndexChanging="gridItensEmAberto_PageIndexChanging" PageSize="3500" OnRowDataBound="gridItensEmAberto_RowDataBound" DataKeyNames="id">
                            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderStyle CssClass="text-align" Wrap="false" />
                                    <HeaderTemplate>
                                        Sel.
                                    </HeaderTemplate>
                                    <ItemStyle CssClass="text-align" />
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBoxButton" Checked="false" runat="server" onclick="javascript: calcularTotal(this);" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--<glw:CampoCheckBoxSelecao HeaderText="Sel." />--%>
                                <glw:CampoEntidadeComplexa DataField="tipoMovimento.descricao" tamanhoMaximo="16" HeaderText="Evento" />
                                <glw:CampoEntidadeComplexa DataField="anoMesCobranca" HeaderText="Comp." ItemStyle-CssClass="text-align" />
                                <glw:CampoEntidadeComplexa DataField="parcela" HeaderText="Par" />
                                <glw:CampoEntidadeComplexa DataField="sequenciaCobranca " HeaderText="Seq" ItemStyle-CssClass="text-align" />
                                <glw:CampoEntidadeComplexa DataField="formaCobranca" HeaderText="Cobr." ItemStyle-CssClass="" />
                                <glw:CampoEntidadeComplexa DataField="item.descricao" HeaderText="Item" ItemStyle-CssClass="" tamanhoMaximo="16" />
                                <%--<glw:CampoLimitado DataField="item.descricao" HeaderText="Item" ItemStyle-CssClass="" />--%>
                                <glw:CampoEntidadeComplexa DataField="dataPrevista" HeaderText="Previsão." ItemStyle-CssClass="text-align" DataFormatString="{0:dd/MM/yyyy}" />
                                <asp:TemplateField HeaderText="Dt. Venc." ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <div class="campoDataGrid">
                                            <span>
                                                <%# DataBinder.Eval(Container.DataItem, "dataVencimento", "{0:dd/MM/yyyy}")%></span>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--<glw:CampoEntidadeComplexa DataField="dataVencimento" HeaderText="Vencto." ItemStyle-CssClass="text-align" DataFormatString="{0:dd/MM/yyyy}" />--%>
                                <%--<glw:CampoEntidadeComplexa DataField="valorPrevisto" HeaderText="Valor Prev." ItemStyle-CssClass="text-align" HeaderStyle-Wrap="false" />--%>
                                <asp:TemplateField HeaderText="Vlr. Prev." ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <div class="valorNumericoGrid">
                                            <span>
                                                <%# DataBinder.Eval(Container.DataItem, "valorPrevisto", "{0:N2}")%>&nbsp;</span>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <glw:CampoEntidadeComplexa DataField="statusDocumento" HeaderText="Info." ItemStyle-HorizontalAlign="Center" />
                                <%--<glw:CampoEntidadeComplexa DataField="valorEfetivo" HeaderText="Valor Efet." ItemStyle-CssClass="text-align"  />--%>
                                <asp:TemplateField HeaderText="Vlr. Efetivo">
                                    <ItemTemplate>
                                        <div class="campoDataGrid">
                                            <span>
                                                <%# DataBinder.Eval(Container.DataItem, "valorEfetivo", "{0:N2}")%>&nbsp;</span>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--<glw:CampoEntidadeComplexa DataField="data" HeaderText="Data Baixa" ItemStyle-CssClass="text-align" DataFormatString="{0:dd/MM/yyyy}" />--%>
                                <asp:TemplateField HeaderText="Data Baixa" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <div class="campoDataGrid">
                                            <span>
                                                <%# DataBinder.Eval(Container.DataItem, "dataEfetiva", "{0:dd/MM/yyyy}")%></span>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <glw:CampoEntidadeComplexa DataField="codigoDocumento" HeaderText="Nº Doc." ItemStyle-CssClass="text-align" />
                                <glw:CampoEntidadeComplexa DataField="tipoSuspensao.descricao" HeaderText="Tipo Susp" ItemStyle-CssClass="text-align" tamanhoMaximo="16" />
                                <glw:CampoEntidadeComplexa DataField="taxaJuros" HeaderText="Tx Juros" ItemStyle-CssClass="text-align" />
                                <%--<glw:CampoEntidadeComplexa DataField="saldoDevedor" HeaderText="Saldo Dev." ItemStyle-CssClass="text-align" />--%>
                                <asp:TemplateField HeaderText="Saldo Dev.">
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

                        <%--Grid Itens para campanha de desconto--%>
                        <glw:Grid ID="gridCampanhaDesconto" Width="98.6%" runat="server" HeaderStyle-CssClass="barraFixa" DataKeyNames="numParcela">
                            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="Parcela">
                                    <ItemTemplate>
                                        <div class="campoDataGrid" style="text-align: center">
                                            <span>
                                                <%# DataBinder.Eval(Container.DataItem, "numParcela")%>&nbsp;</span>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Competência">
                                    <ItemTemplate>
                                        <div class="campoDataGrid" style="text-align: center">
                                            <span>
                                                <%# DataBinder.Eval(Container.DataItem, "competencia")%>&nbsp;</span>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Valor">
                                    <ItemTemplate>
                                        <div class="campoDataGrid" style="text-align: right">
                                            <span>
                                                <%# DataBinder.Eval(Container.DataItem, "valorParcela", "{0:N2}")%>&nbsp;</span>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Desconto Parc.">
                                    <ItemTemplate>
                                        <div class="campoDataGrid" style="text-align: right">
                                            <span>
                                                <%# DataBinder.Eval(Container.DataItem, "percentualParcela", "{0:P2}")%>&nbsp;</span>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="FGQC">
                                    <ItemTemplate>
                                        <div class="campoDataGrid" style="text-align: right">
                                            <span>
                                                <%# DataBinder.Eval(Container.DataItem, "valorFGQC", "{0:N2}")%>&nbsp;</span>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Desconto FGQC">
                                    <ItemTemplate>
                                        <div class="campoDataGrid" style="text-align: right">
                                            <span>
                                                <%# DataBinder.Eval(Container.DataItem, "percentualFGQC", "{0:P2}")%>&nbsp;</span>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Corr. Monetária">
                                    <ItemTemplate>
                                        <div class="campoDataGrid" style="text-align: right">
                                            <span>
                                                <%# DataBinder.Eval(Container.DataItem, "valorCorrMonet", "{0:N2}")%>&nbsp;</span>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Desconto C.M.">
                                    <ItemTemplate>
                                        <div class="campoDataGrid" style="text-align: right">
                                            <span>
                                                <%# DataBinder.Eval(Container.DataItem, "percentualCorrMonet", "{0:P2}")%>&nbsp;</span>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Juros Rem.">
                                    <ItemTemplate>
                                        <div class="campoDataGrid" style="text-align: right">
                                            <span>
                                                <%# DataBinder.Eval(Container.DataItem, "valorJurosRem", "{0:N2}")%>&nbsp;</span>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Desconto J.Rem.">
                                    <ItemTemplate>
                                        <div class="campoDataGrid" style="text-align: right">
                                            <span>
                                                <%# DataBinder.Eval(Container.DataItem, "percentualJurosRem", "{0:P2}")%>&nbsp;</span>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Juros Mora">
                                    <ItemTemplate>
                                        <div class="campoDataGrid" style="text-align: right">
                                            <span>
                                                <%# DataBinder.Eval(Container.DataItem, "valorJurosMora", "{0:N2}")%>&nbsp;</span>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Desconto J.Mora.">
                                    <ItemTemplate>
                                        <div class="campoDataGrid" style="text-align: right">
                                            <span>
                                                <%# DataBinder.Eval(Container.DataItem, "percentualJurosMora", "{0:P2}")%>&nbsp;</span>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Multa">
                                    <ItemTemplate>
                                        <div class="campoDataGrid" style="text-align: right">
                                            <span>
                                                <%# DataBinder.Eval(Container.DataItem, "valorMulta", "{0:N2}")%>&nbsp;</span>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Desconto Multa">
                                    <ItemTemplate>
                                        <div class="campoDataGrid" style="text-align: right">
                                            <span>
                                                <%# DataBinder.Eval(Container.DataItem, "percentualMulta", "{0:P2}")%>&nbsp;</span>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="IOF Compl.">
                                    <ItemTemplate>
                                        <div class="campoDataGrid" style="text-align: right">
                                            <span>
                                                <%# DataBinder.Eval(Container.DataItem, "valorIOFComplementar", "{0:N2}")%>&nbsp;</span>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Desconto IOF">
                                    <ItemTemplate>
                                        <div class="campoDataGrid" style="text-align: right">
                                            <span>
                                                <%# DataBinder.Eval(Container.DataItem, "percentualIOFComplementar", "{0:P2}")%>&nbsp;</span>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <div class="campoDataGrid" style="text-align: right">
                                            <span>
                                                <%# DataBinder.Eval(Container.DataItem, "valorTotal", "{0:N2}")%>&nbsp;</span>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total com desconto">
                                    <ItemTemplate>
                                        <div class="campoDataGrid" style="text-align: right">
                                            <span>
                                                <%# DataBinder.Eval(Container.DataItem, "valorTotalComDesconto", "{0:N2}")%>&nbsp;</span>
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
    </table>
    <table cellpadding="0" cellspacing="0" width="100%" style="padding-left: 2%">
        <tr>
            <td class="espacamento" align="left">Data Processo:<br />
                <glw:CaixaData ID="dataProcesso" runat="server"></glw:CaixaData>
            </td>
            <td align="left">Nova Data Vencto, Efetiva ou Abono:
                <br />
                <glw:CaixaData ID="dataVenctoEfetivaAbono" runat="server" AutoPostBack="true" OnTextChanged="dataVenctoEfetivaAbono_TextChanged"></glw:CaixaData>
            </td>
            <td align="left">Total selecionado:<br />
                <glw:CaixaNumerica ID="totalSelecionado" runat="server" casasDecimais="2" tipoNumerico="numero" Enabled="false"></glw:CaixaNumerica>
            </td>
        </tr>
        <tr>
            <td class="espacamento">Valor Recebido:<br />
                <glw:CaixaNumerica ID="valorRecebido" runat="server" casasDecimais="2" onkeyup="validaNegativo(this);" onblur="validaNegativo(this);" tipoNumerico="numero" valor="0"></glw:CaixaNumerica>
                <br />
                <b>Usar sempre valores positivos: sinal será invertido<br />
                    quando necessário</b>
            </td>
            <td>
                <b>(Data Vencto.: só para itens do Financeiro)</b><br />
                <b>(Data Efetiva.: só para Baixa manual)</b><br />
                <b>(Data Abono.: só para itens abonados)</b><br />
            </td>
            <td>Tipo de Suspensão:<br />
                <asp:DropDownList runat="server" ID="ListaDropDowntipoSuspensao" Width="250px"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="3"></td>
        </tr>
        <tr>
            <td colspan="3"></td>
        </tr>
    </table>
    <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td align="center">
                <table>
                    <tr>
                        <td>
                            <div id="divAbonar" runat="server">
                                <glw:BotaoAcao ID="botaoAbonar" runat="server" urlDaImagem="~/Imagens/imgInserir.png" OnClientClick="abrePopUpMotivo();" OnClick="botaoAbonar_Click">Abonar</glw:BotaoAcao>&nbsp
                            </div>
                        </td>
                        <td>
                            <div id="divDesviar" runat="server">
                                <glw:BotaoAcao ID="botaoDesviar" runat="server" urlDaImagem="~/Imagens/imgDesviar.png" OnClick="botaoDesviar_Click">Desviar</glw:BotaoAcao>&nbsp
                            </div>
                        </td>
                        <td>
                            <div id="divSuspeder" runat="server">
                                <glw:BotaoAcao ID="botaoSuspender" runat="server" urlDaImagem="~/Imagens/imgSuspender.png" OnClick="botaoSuspender_Click">Suspender</glw:BotaoAcao>&nbsp
                            </div>
                        </td>
                        <td>
                            <div id="divLiberarSuspensao" runat="server">
                                <glw:BotaoAcao ID="botaoLiberarSuspensao" runat="server" urlDaImagem="~/Imagens/imgLiberarSuspensao.png" OnClick="botaoLiberarSuspensao_Click">Liberar Suspensao</glw:BotaoAcao>&nbsp
                            </div>
                        </td>
                        <td>
                            <div id="divAlterarVencimento" runat="server">
                                <glw:BotaoAcao ID="botaoAlterarVencimento" runat="server" urlDaImagem="~/Imagens/imgAlteraVencimento.png" OnClientClick="bloqueiaInterface()" OnClick="botaoAlterarVencimento_Click">Alterar Vencimento</glw:BotaoAcao>&nbsp
                            </div>
                        </td>
                        <td>
                            <div id="divAlterarVencimentoSemEncargos" runat="server">
                                <glw:BotaoAcao ID="botaoAlterarVenctoSemEncargos" runat="server" urlDaImagem="~/Imagens/imgAlteraVencimentoSemEncargo.png" OnClick="botaoAlterarVenctoSemEncargos_Click">Alterar Vencto. sem Encargos</glw:BotaoAcao>&nbsp
                            </div>
                        </td>
                        <td>
                            <div id="divBaixaManual" runat="server">
                                <glw:BotaoAcao ID="botaoBaixarManualmente" runat="server" urlDaImagem="~/Imagens/imgBaixar.png" OnClick="botaoBaixarManualmente_Click">Baixar Manualmente</glw:BotaoAcao>&nbsp
                            </div>
                        </td>
                        <td>
                            <div id="divBesfazerBaixa" runat="server">
                                <glw:BotaoAcao ID="botaoDesfazerBaixaManual" runat="server" urlDaImagem="~/Imagens/imgDesfazer.png" OnClick="botaoDesfazerBaixaManual_Click">Desfazer Baixa Manual</glw:BotaoAcao>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:HiddenField runat="server" ID="hiddenValorTotal" Value="0" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ConteudoBotoesAcao" runat="server">
    <%--<glw:BotaoAcao ID="botaoContinuar" runat="server" permissoesExigidas="incluir" tagImagem="botaoProximo"
        Text="Continuar"></glw:BotaoAcao>--%>
    <glw:BotaoVoltar ID="botaoVoltar" runat="server" acaoPersonalizada="true" permissoesExigidas="mascaraVazia" OnClick="voltar_OnClick"></glw:BotaoVoltar>
    <glw:BotaoSair ID="botaoSair" runat="server" permissoesExigidas="mascaraVazia"></glw:BotaoSair>
</asp:Content>
