<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/FormularioMestre.master"
    AutoEventWireup="true" CodeBehind="Visualizacao.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.Tratamentos.Parcela.Visualizacao" %>

<%@ Import Namespace="FUNCEF.Planus.WebEmprestimo.Web.Componentes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ConteudoAdicionalHeadFormulario" runat="server">

    <script language="javascript" type="text/javascript">
        function verificarStatus(link) {
            var status = link.innerText.substr(0, 1).toUpperCase();
            if (status != "A") {
                alert("<%=MensagensAplicacao.instancia.mensagem033 %>");
                return false;
            }

            return true;
        }

        function getTab(sender, args) {
            var indexTab = 0;
            var nomeTab;

            indexTab = sender.get_activeTabIndex();
            nomeTab = sender.get_activeTab().get_headerText();
            document.getElementById('<%= hdnTabAtiva.ClientID %>').value = sender.get_activeTab().get_headerText();
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="EspacoTituloPagina" runat="server">
    <glw:TituloPagina ID="aba1" runat="server" titulo="Lançamento e Histórico de Suspensão por Contrato" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ConteudoFormulario" runat="server">

    <table cellpadding="3" cellspacing="3" border="0" width="100%" class="tableSecao">
        <tr>
            <td align="right">
                <!--William Moreira da Silva
                <glw:BotaoAcao ID="BotaoChaveMestre" runat="server" urlDaImagem="~/Imagens/imgChave.png"></glw:BotaoAcao>
                William Moreira da Silva-->
                <asp:HiddenField ID="hdnTabAtiva" runat="server" />
            </td>

        </tr>
    </table>

    <table cellpadding="1" cellspacing="0" border="0" width="100%">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" border="0" class="tableSecao">
                    <tr>
                        <td class="espacamento" style="padding-left: 10px !important; width: 100px;">Nº Contrato:
                        </td>
                        <td style="padding-left: 2px !important;">
                            <asp:Label ID="labelNumContrato" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                        <td style="padding-left: 10px !important; width: 70px;">Matrícula:
                        </td>
                        <td style="padding-left: 2px !important;">
                            <asp:Label ID="labelMatricula" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                        <td style="padding-left: 10px !important; width: 70px;">Mutuário:
                        </td>
                        <td style="padding-left: 2px !important;">
                            <asp:Label ID="labelMutuario" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                    </tr>
                </table>
                <table cellpadding="3" cellspacing="3" border="0" width="100%" class="tableSecao">
                    <tr>
                        <td>
                            <%--<ajaxToolkit:TabContainer ID="recipienteAbaSuspensoes" runat="server" CssClass="abaPainel"
                                    OnClientActiveTabChanged="getTab">--%>
                            <%--<ajaxToolkit:TabPanel runat="server" ID="painelAbaHistoricoSuspensao" HeaderText="Historico de Suspenção">--%>
                            <%--<HeaderTemplate>
                                            Historico de Suspensão
                                        </HeaderTemplate>--%>
                            <%--<contenttemplate>--%>
                            <table cellpadding="0" cellspacing="0">
                                <tr class="espacamento">
                                    <td colspan="6" style="">
                                        <glw:Grid ID="gridParcelas" runat="server" Width="850px" DataKeyNames="id" AllowSorting="true">
                                            <Columns>
                                                <%--William Moreira da Silva SOL 235167--%>
                                                <%--<glw:CampoEntidadeComplexa DataField="tipoSuspensao.descricao" HeaderText="Tipo Suspensão" />

                                                                <glw:CampoLinkLimitado DataTextField="status" HeaderText="Status" DataNavigateUrlFormatString="~/Paginas/Tratamentos/Parcela/Alteracao.aspx?Id={0}&Numero={1}"
                                                                    DataNavigateUrlFields="id,numeroContrato" tamanhoMaximo="20" permissoesExigidas="alterar"
                                                                    OnLinkClientClick="return verificarStatus(this);" />--%>

                                                <glw:CampoLinkLimitado DataTextField="descricaoTipoSuspAux" HeaderText="Tipo Suspensão" DataNavigateUrlFormatString="~/Paginas/Tratamentos/Parcela/Alteracao.aspx?Id={0}&Numero={1}" DataNavigateUrlFields="id, numeroContrato" tamanhoMaximo="20" permissoesExigidas="alterar" />
                                                <glw:CampoEntidadeComplexa DataField="status" HeaderText="Status"></glw:CampoEntidadeComplexa>
                                                <%--William Moreira da Silva SOL 235167--%>
                                                <glw:CampoEntidadeComplexa DataField="numeroMeses" HeaderText="N. Meses" />
                                                <asp:TemplateField HeaderText="Início Susp." ItemStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <div class="campoDataGrid">
                                                            <span>
                                                                <%# DataBinder.Eval(Container.DataItem, "dataInicio", "{0:dd/MM/yyyy}")%></span>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Final Susp." ItemStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <div class="campoDataGrid">
                                                            <span>
                                                                <%# DataBinder.Eval(Container.DataItem, "dataFim", "{0:dd/MM/yyyy}")%></span>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <glw:CampoBoolean DataField="ferias" HeaderText="Férias" />
                                                <%--<asp:TemplateField HeaderText="Liberação" ItemStyle-HorizontalAlign="Right">                                                                                                                      
                                                                    <ItemTemplate>
                                                                        <div class="campoDataGrid">
                                                                            <span>
                                                                                <%# DataBinder.Eval(Container.DataItem, "dataLiberacao", "{0:dd/MM/yyyy}")%></span>
                                                                        </div>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <glw:CampoEntidadeComplexa DataField="mesCobranca" HeaderText="Mês Cobrança"                                                              
                                                                <glw:CampoEntidadeComplexa DataField="anoCobranca" HeaderText="Ano Cobrança" />
                                                                Willamy Henrique de Oliveira SOL- 235164 --%>
                                                <asp:TemplateField HeaderText="Dt. Atend." ItemStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <div class="campoDataGrid">
                                                            <span>
                                                                <%# DataBinder.Eval(Container.DataItem, "dataAtendimento", "{0:dd/MM/yyyy}")%></span>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <glw:CampoEntidadeComplexa DataField="responsavelAtendimento" HeaderText="Resp Atend." />
                                                <asp:TemplateField HeaderText="Dt. Atua." ItemStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <div class="campoDataGrid">
                                                            <span>
                                                                <%# DataBinder.Eval(Container.DataItem, "dataAtualizacao", "{0:dd/MM/yyyy}")%></span>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <glw:CampoEntidadeComplexa DataField="responsavelAtualizacao" HeaderText="Resp Atua." />
                                            </Columns>
                                        </glw:Grid>
                                    </td>
                                </tr>
                            </table>
                            <%--William Moreira da Silva SOL 235167--%>
                            <%--</contenttemplate>--%>
                            <%--</ajaxToolkit:TabPanel>--%>
                            <%--William Moreira da Silva - SOL 155626--%>
                            <%--                                    <ajaxToolkit:TabPanel runat="server" ID="painelAbaHistoricoAlteracao" HeaderText="">
                                        <HeaderTemplate>
                                            Historico Alteração
                                        </HeaderTemplate>
                                        <ContentTemplate>
                                            <table cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <glw:Grid ID="gridLogAlteracoes" runat="server" Width="850px" DataKeyNames="id" AllowSorting="true"
                                                            PageSize="1000">
                                                            <Columns>
                                                                <glw:CampoEntidadeComplexa DataField="descricao" HeaderText="Descrição Suspensão" />
                                                                <glw:CampoEntidadeComplexa DataField="usuario.nome" HeaderText="Usuário" />
                                                                <glw:CampoEntidadeComplexa DataField="data" HeaderText="Data/Hora" />
                                                            </Columns>
                                                        </glw:Grid>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </ajaxToolkit:TabPanel>--%>
                            <%--William Moreira da Silva - SOL 155626--%>
                            <%--</ajaxToolkit:TabContainer>--%>
                            <%--William Moreira da Silva SOL 235167--%>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ConteudoBotoesAcao" runat="server">
    <glw:BotaoAcao ID="botaoIncluir" runat="server" OnClick="botaoIncluir_Click" permissoesExigidas="incluir"
        Text="Incluir" tagImagem="botaoIncluir"></glw:BotaoAcao>
    <glw:BotaoVoltar ID="botaoVoltar" runat="server" urlVoltar="Listagem.aspx" permissoesExigidas="mascaraVazia"></glw:BotaoVoltar>
    <glw:BotaoSair ID="botaoSair" runat="server" permissoesExigidas="mascaraVazia"></glw:BotaoSair>
</asp:Content>
