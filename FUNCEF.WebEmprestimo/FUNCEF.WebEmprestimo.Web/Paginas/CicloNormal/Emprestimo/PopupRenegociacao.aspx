<%-- SIG 21529
  Autor:
 Thayane Rabonato/Darivaldo Alencar

 Descrição da Alteração:
 Criação da opção de renegociação de dívidas de emprestimo
--%>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PopupRenegociacao.aspx.cs" MasterPageFile="~/Paginas/Mestre/DialogoMestre.master"
    Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.CicloNormal.Emprestimo.PopupRenegociacao" %>

<asp:Content ID="ConteudoAdicionalHead" runat="server" ContentPlaceHolderID="ConteudoAdicionalHead">
        <script type="text/javascript" src="../../../Scripts/jquery-1.10.2.min.js"></script>
        <script type="text/javascript" src="../../../Scripts/jquery-ui.min.js"></script>
        <script type="text/javascript" src="../../../Scripts/jquery.blockUI.js"></script>
        <script type="text/javascript">              

            //Darivaldo SIG21529 -inicio
            function SetarValoresRetorno(hdnAtualizouCalculo) {
                if (hdnAtualizouCalculo == "sim") {
                    var saldoQuitar = $('#<%=caixaNumericaValorTotalParcelasQuitar.ClientID %>').val().replace('.', '').replace(',', '.');
                    var valorSolicitado = $('#<%=caixaNumericaValorSolicitadoRefinanciamento.ClientID %>').val().replace('.', '').replace(',', '.');
                    var ValorAmortizar = $('#<%=caixaNumericaValorAmortizar.ClientID %>').val().replace('.', '').replace(',', '.');

                    if (ValorAmortizar == "") {
                        ValorAmortizar = 0;
                    }

                    var ValorRetorno = (parseFloat(saldoQuitar) + parseFloat(valorSolicitado));
                    //alert('retorno: ' + ValorRetorno + ' saldoQuitar:' + saldoQuitar + ' valorSolicitado: ' + valorSolicitado + ' ValorAmortizar:' + ValorAmortizar);

                    window.returnValue = ValorRetorno + ";" + valorSolicitado + ";" + hdnAtualizouCalculo;

                    localStorage.setItem("selecionado", ValorRetorno + ";" + valorSolicitado + ";" + hdnAtualizouCalculo);
                } else {
                    localStorage.setItem("selecionado", "0; 0;" + hdnAtualizouCalculo);
                }

                return true;
            }

            function SetarScrollAnterior(valor, valorLeft) {
                $grid = $('#DivGrid');
                $grid.scrollTop(valor);
                $grid.scrollLeft(valorLeft);
            };

            function GetScrollAtual() {
                var top = $('#DivGrid').scrollTop();
                var left = $('#DivGrid').scrollLeft();
                $('#<%= hdfScroll.ClientID %>').val(top);
                $('#<%= hdfScrollLeft.ClientID %>').val(left);
                return true;
            }

            function AbreModal() {
                var favDialog = document.getElementById('favDialog');
                favDialog.showModal();
            };

            function FechaModal() {
                var favDialog = document.getElementById('favDialog');
                favDialog.close();
                AbreLoading();
            };
            //Taffarel - SIG21529/52136 - início
            function AbreLoading() {
                document.getElementById('LoadDialog').showModal();
            };

            function FechaLoading() {
                document.getElementById('LoadDialog').close();
            };
            //Taffarel - SIG21529/52136 - fim
        //Darivaldo SIG21529 -fim
    </script>
    <style>
        #favDialog{           
           width:300px;
           border: none;  
        }
        #LoadDialog{           
           width:300px;
           border: none;  
        } 
        #hiddencol
        {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="contentCabecalho" runat="server" ContentPlaceHolderID="ConteudoCabecalho">
    Renegociação
</asp:Content>
<asp:Content ID="contentConteudo" runat="server" ContentPlaceHolderID="ConteudoPrincipal">
    <%--Darivaldo SIG21529 -inicio--%>
    <asp:HiddenField runat="server" ID="hdfScroll"/>                                                                        
    <asp:HiddenField runat="server" ID="hdfScrollLeft"/>      
    <%--Darivaldo SIG21529 -fim--%>
    <table style="border-bottom: dashed 1px rgb(215, 215, 215); padding: 7px 0px 0px 50px;">
        <tr>
            <td style="text-align: left;">
                <%-- Thayane Rabonato - SIG 21529 - Início --%>
                <asp:UpdatePanel ID="updatePanel12" runat="server">
                    <ContentTemplate>
                        <div class="espacamento" style="text-align: center;">
                            <b>Simulação para amortização do saldo do contrato anterior</b><br />
                            <br />
                            <br />
                        </div>
                        <table cellpadding="0" cellspacing="0" id="tableRefinanciamento">
                            <tr class="espacamento">
                                <td>Valor da soma das últimas prestações:<br />
                                    <glw:CaixaNumerica ID="caixaNumericaValorSomaUltimasPrestacoes" runat="server" casasDecimais="2" tipoNumerico="numero" valorMaximo="99999999.99" Width="212px" Enabled="false">                                       
                                    </glw:CaixaNumerica>
                                </td>
  <%--                              <td>Valor Prestação Base:<br />
                                    <glw:CaixaNumerica ID="caixaNumericaValorPrestacaoBase" runat="server" casasDecimais="2" tipoNumerico="numero" valorMaximo="99999999.99" Width="212px" Enabled="false">                                       
                                    </glw:CaixaNumerica>
                                </td>--%>
                            </tr>
                        </table>
                        <table cellpadding="0" cellspacing="0">
                            <tr class="espacamento">
                                <td style="padding:10px 10px 10px 0px">Parcelas a quitar para a amortização de Saldo Devedor:<br />
                                    <div id="DivGrid" style="border: 1px solid; height: 300px; width: 800px; overflow-y: scroll; padding-top: 10px;">
                                        <asp:Repeater runat="server" 
                                            ID="repeaterContratosRefinanciamento"
                                            OnItemDataBound="repeaterContratosRefinanciamento_ItemDataBound">
                                            <HeaderTemplate>
                                            <table>
                                            <tr style="vertical-align: top;">
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <td>
                                                    <span><%# DataBinder.Eval(Container.DataItem, "modalidade") %></span>
                                                    <br />
                                                    <span>Contrato: </span>
                                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "numeroContrato") %>' CssClass="textoEstaticoNegrito"></asp:Label>
                                                    <hr />
                                                    <glw:Grid ID="gridParcelasRefinanciamento" 
                                                        AutoGenerateColumns="false" runat="server" 
                                                        DataSource='<%# DataBinder.Eval(Container.DataItem, "itens") %>' AllowPaging="false"
                                                        OnRowDataBound="gridParcelasRefinanciamento_RowDataBound" 
                                                        AllowSorting="true" DataKeyNames="ID">
                                                        <Columns>
                                                            <%--Darivaldo SIG21529 -inicio--%>
                                                             <%--<glw:CampoCheckBoxSelecao />--%>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <div class="campoDataGrid">
                                                                        <asp:CheckBox ID="CheckBoxButton" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBoxButton_CheckedChanged" OnClick="GetScrollAtual()"/>                                                                        
                                                                    </div>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <%--Darivaldo SIG21529 -fim--%>
                                                            <glw:CampoEntidadeComplexa DataField="MesReferencia" HeaderText="Mês/Ano Referência" ControlStyle-Width="100px" ItemStyle-Width="100px" />
                                                            <glw:CampoEntidadeComplexa DataField="ItemPrestacao" HeaderText="Item *" />
                                                            <glw:CampoEntidadeComplexa DataField="ValorItemPrestacao" HeaderText="Valor" DataFormatString="{0:N2}" ItemStyle-CssClass="text-align-right" ControlStyle-Width="100px" ItemStyle-Width="100px" />
                                                            <glw:CampoEntidadeComplexa DataField="numeroContrato" HeaderText="Contrato" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol"/>
                                                        </Columns>
                                                    </glw:Grid>                                                    
                                                </td>                                                
                                            </ItemTemplate>
                                            <FooterTemplate>
                                            </tr>
                                            </table>
                                            </FooterTemplate>
                                        </asp:Repeater>
                                    </div>
                                </td>
                                <td>
                                    <table cellpadding="0" cellspacing="0" style="text-align: left;">
                                        <tr">
                                            <td style="padding-bottom: 15px">Valor mínimo para ser amortizado:<br />
                                                <glw:CaixaNumerica ID="caixaNumericaValorTotalParcelasQuitar" runat="server" casasDecimais="2" tipoNumerico="numero" valorMaximo="99999999.99" Width="190px" Enabled="false">                                       
                                                </glw:CaixaNumerica>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-bottom: 15px">Valor solicitado:<br />
                                                <glw:CaixaNumerica ID="caixaNumericaValorSolicitadoRefinanciamento" runat="server" casasDecimais="2" tipoNumerico="numero" valorMaximo="99999999.99" Width="190px" Enabled="false">                                       
                                                </glw:CaixaNumerica>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-bottom: 15px">Valor a Amortizar Informado:<br />                                               
                                                <glw:CaixaNumerica ID="caixaNumericaValorAmortizar" runat="server" casasDecimais="2" tipoNumerico="numero" valorMaximo="99999999.99" MaxLength="8"  Width="190px" OnTextChanged="caixaNumericaValorAmortizar_TextChanged" AutoPostBack="True" >  
                                                </glw:CaixaNumerica>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-bottom: 15px">Valor FGQC concessão:<br />
                                                <glw:CaixaNumerica ID="caixaNumericaFGQC" runat="server" casasDecimais="2" tipoNumerico="numero" valorMaximo="99999999.99" MaxLength="8"  Width="190px" Enabled="false">                                       
                                                </glw:CaixaNumerica>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-bottom: 15px">Valor IOF:<br />
                                                <glw:CaixaNumerica ID="caixaNumericaIOF" runat="server" casasDecimais="2" tipoNumerico="numero" valorMaximo="99999999.99" MaxLength="8"  Width="190px" Enabled="false">                                       
                                                </glw:CaixaNumerica>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-bottom: 15px">Valor taxa adm.:<br />
                                                <glw:CaixaNumerica ID="caixaNumericTxAdm" runat="server" casasDecimais="2" tipoNumerico="numero" valorMaximo="99999999.99" MaxLength="8"  Width="190px" Enabled="false">                                       
                                                </glw:CaixaNumerica>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-bottom: 15px">Valor total para amortizar:<br />
                                                <glw:CaixaNumerica ID="CaixaNumericaTotalAmortizar" runat="server" casasDecimais="2" tipoNumerico="numero" valorMaximo="99999999.99" MaxLength="8"  Width="190px" Enabled="false">                                       
                                                </glw:CaixaNumerica>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr class="espacamento">
                                <td>
                                    <asp:CheckBox ID="checkBoxSelecionarTodas" runat="server" Text="Selecionar Todas" OnCheckedChanged="checkBoxSelecionarTodas_CheckedChanged" AutoPostBack="True" />
                                </td>
                            </tr>
                            <tr>
                                <td><br />
                                    <span style="font-size:10px;">(*) Parcela = Valor da prestação + valor do FGQC. </span>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <%-- Thayane Rabonato - SIG 21529 - Fim --%>
            </td>
        </tr>
        <tr>
            <td>
                <dialog id="favDialog">                       
                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                       <tr>
                           <td class="cabecalhoDialogo">
                               <span>Tipo de Exportação</span>
                           </td>
                       </tr>
                       <tr>
                           <td style="padding: 20px 0px 20px 0px; text-align: center;">                                                              
                               <label for="rdbPDF">PDF</label>
                               <input type="radio" ID="rdbPDF" name="opRadio" checked value="P" runat="server"/>
                               <label for="rdbExcel">Excel</label>
                               <input type="radio" ID="rdbExcel" name="opRadio" value="E" runat="server"/>
                           </td>
                       </tr>
                       <tr>
                           <td style="text-align: right; padding: 5px 10px 0px 0px;">                                                                                                                            
                               <glw:BotaoOk runat="server" ID="btnOKModal" OnClientClick="FechaModal();" OnClick="btnOKModal_Click"  />                                                                                                
                           </td>                           
                       </tr>
                   </table>                    
                </dialog>
            </td>
        </tr>
        <%-- Taffarel - SIG21529/52136 - início --%>
        <tr>
            <td>
                <dialog id="LoadDialog">                       
                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                       <tr>
                           <td class="cabecalhoDialogo">
                               <span>Exportando...</span>
                           </td>
                       </tr>
                       <tr>
                           <td style="padding: 20px 0px 20px 0px; text-align: center;">                                                              
                               <input type="image" ID="LoadIcon" name="imgLoading" src="~/Imagens/aguarde.gif" runat="server"/>
                           </td>
                       </tr>
                        <tr>
                            <td>
                                 <glw:BotaoAcao ID="BotaoAcao1" runat="server" OnClientClick="fecharmodal();" Text="Fechar" EnableViewState="false"></glw:BotaoAcao>
                            </td>
                        </tr>
                   </table>                    
                </dialog>
            </td>
        </tr>
        <%-- Taffarel - SIG21529/52136 - fim --%>
    </table>
</asp:Content>
<asp:Content ID="contentRodape" runat="server" ContentPlaceHolderID="ConteudoRodape">
    <table style="padding: 7px 0px 0px 50px;text-align:right" border="0" >
        <tr>
            <td style="text-align: right; width: 900px;">
                 <glw:BotaoAcao ID="BotaoGeraBoleto" runat="server" urlDaImagem="~/Imagens/imgCalculadora.png" OnClick="btnGeraBoleto_Click" Text="Gerar Boleto" EnableViewState="false"></glw:BotaoAcao>
            </td>
            <td style="width:420px;">             
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        
                        <glw:BotaoAcao ID="botaoExportar" runat="server" urlDaImagem="~/Imagens/imgImprimir.png" OnClientClick="AbreModal();" Text="Exportar relatório" EnableViewState="false"></glw:BotaoAcao>
                        <glw:BotaoAcao ID="botaoAtualizarCalculo" runat="server" urlDaImagem="~/Imagens/imgCalculadora.PNG" OnClick="botaoAtualizarCalculo_Click" Text="Atualizar Cálculo" EnableViewState="false"></glw:BotaoAcao>
                        <glw:BotaoSair ID="botaoSair" runat="server" permissoesExigidas="mascaraVazia" comportamentoSair="fecharJanela" EnableViewState="false"></glw:BotaoSair>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>

    </table>
</asp:Content>
