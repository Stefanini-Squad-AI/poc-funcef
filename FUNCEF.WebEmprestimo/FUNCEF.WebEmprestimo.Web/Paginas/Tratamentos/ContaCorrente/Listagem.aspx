<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/FormularioMestre.master"
    AutoEventWireup="true" CodeBehind="Listagem.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.Tratamentos.ContaCorrente.Listagem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ConteudoAdicionalHeadFormulario"
    runat="server">

    <script language="javascript" type="text/javascript">
        function validarFiltros(objeto, args) {
            var caixaTextoNumContrato = document.getElementById('<%= caixaTextoNumContrato.ClientID %>');
            var caixaTextoNomeMutuario = document.getElementById('<%= caixaTextoNomeMutuario.ClientID %>');
            var caixaTextoNumMatricula = document.getElementById('<%= caixaTextoNumMatricula.ClientID %>');
            var caixaTextoCPF = document.getElementById('<%= caixaTextoCPF.ClientID %>');

            try {
                var possuiNumContrato = caixaTextoNumContrato.value != "";
                var possuiNomeMutuario = caixaTextoNomeMutuario.value != "";
                var possuiNumMatricula = caixaTextoNumMatricula.value != "";
                var possuiCPF = caixaTextoCPF.value != "";

                if (!possuiNumContrato && !possuiNomeMutuario && !possuiNumMatricula && !possuiCPF) {
                    args.IsValid = false;
                    return;
                }

                args.IsValid = true;
            }
            catch (e) {
                args.IsValid = false;
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="EspacoTituloPagina" runat="server">
    <glw:TituloPagina ID="aba1" titulo="Alterações Contratuais" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ConteudoFormulario" runat="server">
    <%--NILTON - CORRECAO 05/02/13 - posicao dos campos--%>
    <table cellpadding="0" cellspacing="0" border="0" class="secoesFormulario">
        <glw:SecaoFormulario ID="secaoPrincipal" tituloSecao="Filtros da Busca" expandeContraiSecao="true" runat="server">
            <tr>
                <td style="padding-left:2%">
                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tr>
                            <td class="espacamento" style="width: 370px; vertical-align: top;">
                                Nome do Mutuário:&nbsp;
                                <glw:CaixaTexto ID="caixaTextoNomeMutuario" runat="server" Width="150px" MaxLength="60"></glw:CaixaTexto>
                                <div>
                                    <glw:ValidadorFiltroPesquisa ID="filtroNomeMutuario" ControlToValidate="caixaTextoNomeMutuario" nomeCampo="Nome do Mutuário" ValidationGroup="contaCorrente" runat="server"></glw:ValidadorFiltroPesquisa>
                                </div>
                                <div>
                                    <%--William moreira da Silva - SOL 223634 KTN 2059069 - Colocando " " como um caracter valido para OnDataBinding search pelo nome--%>
                                    <asp:RegularExpressionValidator ID="validadorNomeMutuario" runat="server" ControlToValidate="caixaTextoNomeMutuario"
                                        ValidationExpression="[A-Z a-z]*" ErrorMessage="O Nome contém caracteres inválidos."
                                        Text="Caracteres inválidos." SetFocusOnError="true" Display="Dynamic" ValidationGroup="contaCorrente"></asp:RegularExpressionValidator>
                                </div>
                            </td>
                            <td style="width: 370px; vertical-align: top;">
                                Matrícula:&nbsp;
                                <glw:CaixaTexto ID="caixaTextoNumMatricula" runat="server" Width="100px" MaxLength="13"></glw:CaixaTexto>
                                <asp:DropDownList runat="server" ID="comboLike">
                                </asp:DropDownList>
                                <div>
                                    <glw:ValidadorFiltroPesquisa ID="filtroNumMatricula" ControlToValidate="caixaTextoNumMatricula"
                                        nomeCampo="Número de Matrícula" ValidationGroup="contaCorrente" runat="server"></glw:ValidadorFiltroPesquisa>
                                </div>
                                <div>
                                    <asp:RegularExpressionValidator ID="validadorNumMatricula" runat="server" ControlToValidate="caixaTextoNumMatricula"
                                        ValidationExpression="[A-Za-z0-9]*" ErrorMessage="O Número de Matrícula contém caracteres inválidos."
                                        Text="Caracteres inválidos." SetFocusOnError="true" Display="Dynamic" ValidationGroup="contaCorrente"></asp:RegularExpressionValidator>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="espacamento" style="width: 305px; vertical-align: top;">
                                CPF:&nbsp;
                                <glw:CaixaTexto ID="caixaTextoCPF" runat="server" Width="150px" MaxLength="18"></glw:CaixaTexto>
                                <div>
                                    <glw:ValidadorFiltroPesquisa ID="filtroCPF" ControlToValidate="caixaTextoCPF" nomeCampo="CPF"
                                        ValidationGroup="contaCorrente" runat="server"></glw:ValidadorFiltroPesquisa>
                                </div>
                                <div>
                                    <asp:RegularExpressionValidator ID="validadorCPF" runat="server" ControlToValidate="caixaTextoCPF"
                                        ValidationExpression="[0-9]*" ErrorMessage="O CPF contém caracteres inválidos."
                                        Text="Caracteres inválidos." SetFocusOnError="true" Display="Dynamic" ValidationGroup="contaCorrente"></asp:RegularExpressionValidator>
                                </div>
                            </td>
                            <td style="width: 305px; vertical-align: top;">
                                Nº. Contrato:&nbsp;
                                <glw:CaixaTexto ID="caixaTextoNumContrato" runat="server" Width="158px" MaxLength="18"></glw:CaixaTexto>
                                <div>
                                    <glw:ValidadorFiltroPesquisa ID="filtroNumContrato" ControlToValidate="caixaTextoNumContrato"
                                        nomeCampo="Num. do Contrato" ValidationGroup="contaCorrente" runat="server"></glw:ValidadorFiltroPesquisa>
                                </div>
                                <div>
                                    <asp:RegularExpressionValidator ID="validadorNumContrato" runat="server" ControlToValidate="caixaTextoNumContrato"
                                        ValidationExpression="[0-9]*" ErrorMessage="O Num. do Contrato contém caracteres inválidos."
                                        Text="Caracteres inválidos." SetFocusOnError="true" Display="Dynamic" ValidationGroup="contaCorrente"></asp:RegularExpressionValidator>
                                </div>
                            </td>
                            <td style="text-align: right; width: 350px; padding-right: 30px; vertical-align: top;">
                                <glw:BotaoProcurar ID="botaoProcurar" runat="server" ValidationGroup="contaCorrente"
                                    OnClick="botaoProcurar_Click" permissoesExigidas="" Style="padding-top: 10px;"></glw:BotaoProcurar>
                                <glw:BotaoLimpar ID="botaoLimpar" OnClick="botaoLimpar_Click" CausesValidation="false"
                                    runat="server" Style="padding-top: 10px;"></glw:BotaoLimpar>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:CustomValidator ID="validadorFiltros" runat="server" Display="Dynamic" ErrorMessage="Selecione ao menos um filtro."
                                    ClientValidationFunction="validarFiltros" ValidationGroup="contaCorrente"></asp:CustomValidator>
                                <asp:Label ID="caixaDataAtualizacao" runat="server" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </glw:SecaoFormulario>
    </table>
    <table width="100%">
        <tr>
            <td class="posSecaoFormulario" style="text-align: center;">
                <div id="divGrid" style="width: 850px; overflow: auto;" runat="server">
                    <glw:Grid ID="gridContaCorrente" runat="server" Width="2000px" DataKeyNames="numero" AllowSorting="true" OnRowDataBound="gridContaCorrente_RowDataBound">
                        <Columns>
                            <glw:CampoLinkLimitado DataTextField="numero" HeaderText="Num. Contrato" DataNavigateUrlFormatString="~/Paginas/Tratamentos/contaCorrente/Visualizacao.aspx?Numero={0}"
                                DataNavigateUrlFields="numero" tamanhoMaximo="20" permissoesExigidas="incluir" />
                            <asp:TemplateField HeaderText="Dt. Crédito" ItemStyle-HorizontalAlign="Right">
                                <ItemTemplate>
                                    <div class="campoDataGrid">
                                        <span>
                                            <%# DataBinder.Eval(Container.DataItem, "dataCredito", "{0:dd/MM/yyyy}")%></span>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <glw:CampoEntidadeComplexa DataField="mutuario.situacao" HeaderText="Situação Mutuário" />
                            <glw:CampoEntidadeComplexa DataField="tipo.descricao" HeaderText="Tipo do Contrato" />
                            <glw:CampoEntidadeComplexa DataField="mutuario.matricula" HeaderText="Matrícula" />
                            <glw:CampoEntidadeComplexa DataField="mutuario.nome" HeaderText="Nome" />
                            <glw:CampoEntidadeComplexa DataField="tipoEmprestimo.descricao" HeaderText="Tipo Empréstimo" />
                            <glw:CampoEntidadeComplexa DataField="plano.descricao" HeaderText="Plano Patrocinadora" />
                            <glw:CampoEntidadeComplexa DataField="patrocinadora.nome" HeaderText="Patrocinadora" />
                            <asp:TemplateField HeaderText="Dt. Assinatura" ItemStyle-HorizontalAlign="Right">
                                <ItemTemplate>
                                    <div class="campoDataGrid">
                                        <span>
                                            <%# DataBinder.Eval(Container.DataItem, "dataAssinatura", "{0:dd/MM/yyyy}")%></span>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <glw:CampoEntidadeComplexa DataField="mutuario.inscricaoPrevidenciaria" HeaderText="Inscrição Previdenciária" />
                            <asp:TemplateField HeaderText="CPF" ItemStyle-HorizontalAlign="Right">
                                <ItemTemplate>
                                    <div class="campoDataGrid">
                                        <span>
                                            <%#  FUNCEF.Planus.WebEmprestimo.Web.Componentes.Utilidades.UtilidadeSistema.formatarCPF(DataBinder.Eval(Container.DataItem, "mutuario.cpf").ToString()) %></span>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <glw:CampoEntidadeComplexa DataField="plano.situacao" HeaderText="Situação Plano" />
                        </Columns>
                    </glw:Grid>
                    <asp:ObjectDataSource ID="dataSourceContaCorrente" runat="server" SelectMethod="consultarContratosAtivos"
                        TypeName="FUNCEF.Planus.WebEmprestimo.Web.Proxies.ProxyContrato" SortParameterName="ordenacao"
                        StartRowIndexParameterName="indiceLinha" MaximumRowsParameterName="maximoLinhas"
                        SelectCountMethod="totalContratosAtivos" OnSelecting="dataSourceContaCorrente_Selecting"
                        EnablePaging="true" EnableCaching="false">
                        <SelectParameters>
                            <asp:ControlParameter Name="numero" ControlID="caixaTextoNumContrato" PropertyName="Text" Direction="Input" Type="Int64" />
                            <asp:ControlParameter Name="nome" ControlID="caixaTextoNomeMutuario" PropertyName="Text"  Direction="Input" Type="String" />
                            <asp:ControlParameter Name="matricula" ControlID="caixaTextoNumMatricula" PropertyName="Text" Direction="Input" Type="String" />
                            <asp:ControlParameter Name="cpf" ControlID="caixaTextoCPF" PropertyName="Text" Direction="Input" Type="String" />
                            <asp:ControlParameter Name="instrucaoLike" ControlID="comboLike" PropertyName="selectedValue"  Direction="Input" Type="String" />
                            <asp:ControlParameter Name="DataLimite" ControlID="caixaDataAtualizacao" PropertyName="Text"  Direction="Input" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
            </td>
        </tr>
    </table>
    <glw:SumarioValidacao ID="sumario" ValidationGroup="contaCorrente" runat="server" />
    <br />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ConteudoBotoesAcao" runat="server">
    <glw:BotaoSair ID="botaoSair" comportamentoSair="irParaTelaInicial" runat="server" />
</asp:Content>
