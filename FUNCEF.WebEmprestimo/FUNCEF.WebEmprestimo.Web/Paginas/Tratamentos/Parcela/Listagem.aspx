<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/FormularioMestre.master"
    AutoEventWireup="true" CodeBehind="Listagem.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.Tratamentos.Parcela.Listagem" %>

<%@ Import Namespace="FUNCEF.Planus.WebEmprestimo.Web.Componentes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ConteudoAdicionalHeadFormulario"
    runat="server">

    <script type="text/javascript" language="javascript">
        function validarFiltros(objeto, args) {
            var caixaTextoNumContrato = document.getElementById('<%= caixaTextoNumContrato.ClientID %>');
        var caixaTextoNomeMutuario = document.getElementById('<%= caixaTextoNomeMutuario.ClientID %>');
        var caixaTextoNumMatricula = document.getElementById('<%= caixaTextoNumMatricula.ClientID %>');
        var caixaTextoCPF = document.getElementById('<%= caixaTextoCPF.ClientID %>');
        var comboTipoSuspensao = document.getElementById('<%= comboTipoSuspensao.ClientID %>');

            try {
                var possuiNumContrato = caixaTextoNumContrato.value != "";
                var possuiNomeMutuario = caixaTextoNomeMutuario.value != "";
                var possuiNumMatricula = caixaTextoNumMatricula.value != "";
                var possuiCPF = caixaTextoCPF.value != "";
                var possuiTipoSuspensao = comboTipoSuspensao.value != "" && comboTipoSuspensao.value != "0";

                if (!possuiNumContrato && !possuiNomeMutuario && !possuiNumMatricula && !possuiCPF && !possuiTipoSuspensao) {
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
    <glw:TituloPagina ID="aba1" titulo="Lançamento e Histórico de Suspensão por Contrato"
        runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ConteudoFormulario" runat="server">
    <table cellpadding="0" cellspacing="0" border="0" class="secoesFormulario">
        <glw:SecaoFormulario ID="secaoPrincipal" tituloSecao="Filtros da Busca" expandeContraiSecao="true"
            runat="server">
            <%--NILTON - CORRECAO 05/02/13 - posicao dos campos--%>
            <tr>
                <td style="padding-left:2%">
                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tr>
                            <td class="espacamento" style="width: 370px; vertical-align: top;">
                                Nome do Mutuário:&nbsp;
                                <glw:CaixaTexto ID="caixaTextoNomeMutuario" runat="server" Width="150px" MaxLength="60"></glw:CaixaTexto>
                                <div>
                                    <glw:ValidadorFiltroPesquisa ID="filtroNomeMutuario" ControlToValidate="caixaTextoNomeMutuario"
                                        nomeCampo="Nome do Mutuário" ValidationGroup="amortizacao" runat="server"></glw:ValidadorFiltroPesquisa>
                                </div>
                                <div>
                                    <%--William moreira da Silva - SOL 223634 KTN 2059069 - Colocando " " como um caracter valido para OnDataBinding search pelo nome--%>
                                    <asp:RegularExpressionValidator ID="validadorNomeMutuario" runat="server" ControlToValidate="caixaTextoNomeMutuario"
                                        ValidationExpression="[A-Z a-z]*" ErrorMessage="O Nome contém caracteres inválidos."
                                        Text="Caracteres inválidos." SetFocusOnError="true" Display="Dynamic" ValidationGroup="amortizacao"></asp:RegularExpressionValidator>
                                </div>
                            </td>
                            <td style="width: 370px; vertical-align: top;">
                                Matrícula:&nbsp;
                                <glw:CaixaTexto ID="caixaTextoNumMatricula" runat="server" Width="100px" MaxLength="13"></glw:CaixaTexto>
                                <asp:DropDownList runat="server" ID="comboLike">
                                </asp:DropDownList>
                                <div>
                                    <glw:ValidadorFiltroPesquisa ID="filtroNumMatricula" ControlToValidate="caixaTextoNumMatricula"
                                        nomeCampo="Número de Matrícula" ValidationGroup="amortizacao" runat="server"></glw:ValidadorFiltroPesquisa>
                                </div>
                                <div>
                                    <asp:RegularExpressionValidator ID="validadorNumMatricula" runat="server" ControlToValidate="caixaTextoNumMatricula"
                                        ValidationExpression="[0-9A-Za-z]*" ErrorMessage="O Número de Matrícula contém caracteres inválidos."
                                        Text="Caracteres inválidos." SetFocusOnError="true" Display="Dynamic" ValidationGroup="amortizacao"></asp:RegularExpressionValidator>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="espacamento" style="width: 305px; vertical-align: top;">
                                CPF:&nbsp;
                                <glw:CaixaTexto ID="caixaTextoCPF" runat="server" Width="150px" MaxLength="18"></glw:CaixaTexto>
                                <div>
                                    <glw:ValidadorFiltroPesquisa ID="filtroCPF" ControlToValidate="caixaTextoCPF" nomeCampo="CPF"
                                        ValidationGroup="amortizacao" runat="server"></glw:ValidadorFiltroPesquisa>
                                </div>
                                <div>
                                    <asp:RegularExpressionValidator ID="validadorCPF" runat="server" ControlToValidate="caixaTextoCPF"
                                        ValidationExpression="[0-9]*" ErrorMessage="O CPF contém caracteres inválidos."
                                        Text="Caracteres inválidos." SetFocusOnError="true" Display="Dynamic" ValidationGroup="amortizacao"></asp:RegularExpressionValidator>
                                </div>
                            </td>
                            <td style="width: 305px; vertical-align: top;">
                                Nº. Contrato:&nbsp;
                                <glw:CaixaTexto ID="caixaTextoNumContrato" runat="server" Width="158px" MaxLength="18"></glw:CaixaTexto>
                                <div>
                                    <glw:ValidadorFiltroPesquisa ID="filtroNumContrato" ControlToValidate="caixaTextoNumContrato"
                                        nomeCampo="Num. do Contrato" ValidationGroup="amortizacao" runat="server"></glw:ValidadorFiltroPesquisa>
                                </div>
                                <div>
                                    <asp:RegularExpressionValidator ID="validadorNumContrato" runat="server" ControlToValidate="caixaTextoNumContrato"
                                        ValidationExpression="[0-9]*" ErrorMessage="O Num. do Contrato contém caracteres inválidos."
                                        Text="Caracteres inválidos." SetFocusOnError="true" Display="Dynamic" ValidationGroup="amortizacao"></asp:RegularExpressionValidator>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="espacamento" style="vertical-align: top;" colspan="3">
                                Tipo de Suspensão:&nbsp;
                                <asp:DropDownList ID="comboTipoSuspensao" runat="server"></asp:DropDownList>
                            </td>
                            <td style="text-align: right; width: 280px; padding-right: 30px; vertical-align: top;">
                                <glw:BotaoProcurar ID="botaoProcurar" runat="server" ValidationGroup="amortizacao" OnClick="botaoProcurar_Click" permissoesExigidas="" Style="padding-top: 10px;"></glw:BotaoProcurar>
                                <glw:BotaoLimpar ID="botaoLimpar" OnClick="botaoLimpar_Click" CausesValidation="false" runat="server" Style="padding-top: 10px;"></glw:BotaoLimpar>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:CustomValidator ID="validadorFiltros" runat="server" Display="Dynamic" ErrorMessage="Selecione ao menos um filtro." ClientValidationFunction="validarFiltros" ValidationGroup="amortizacao"></asp:CustomValidator>
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
                <glw:Grid ID="gridParcelas" runat="server" Width="850px" DataKeyNames="numero" AllowSorting="true" OnRowDataBound="gridParcelas_RowDataBound">
                    <Columns>
                        <glw:CampoLinkLimitado DataTextField="numero" HeaderText="Num. Contrato" DataNavigateUrlFormatString="~/Paginas/Tratamentos/Parcela/Visualizacao.aspx?Numero={0}"
                            DataNavigateUrlFields="numero" tamanhoMaximo="20" permissoesExigidas="consultar" ControlStyle-CssClass="paddingLeftRight-5" />
                        <glw:CampoEntidadeComplexa DataField="mutuario.nome" HeaderText="Nome" ItemStyle-HorizontalAlign="Left" />
                        <glw:CampoEntidadeComplexa DataField="mutuario.matricula" HeaderText="Matrícula" />
                        <glw:CampoEntidadeComplexa DataField="idSituacao" HeaderText="Situação Contrato" />
                        <%-- Adição do campo Situação Willamy Henrique de Oliveira Sol- 235164  --%>
                        <glw:CampoEntidadeComplexa DataField="tipo.descricao" HeaderText="Tipo Contrato" />
                        <asp:TemplateField HeaderText="Dt. Assinatura" ItemStyle-HorizontalAlign="Right">
                            <ItemTemplate>
                                <div class="campoDataGrid">
                                    <span>
                                        <%# DataBinder.Eval(Container.DataItem, "dataAssinatura", "{0:dd/MM/yyyy}")%></span>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </glw:Grid>
                <asp:ObjectDataSource ID="dataSourceParcelas" runat="server" SelectMethod="consultarContratosSuspensao"
                    TypeName="FUNCEF.Planus.WebEmprestimo.Web.Proxies.ProxyContrato" SortParameterName="ordenacao"
                    StartRowIndexParameterName="indiceLinha" MaximumRowsParameterName="maximoLinhas"
                    SelectCountMethod="totalContratosSuspensao" OnDeleted="dataSourceParcelas_Deleted"
                    OnSelecting="dataSourceParcelas_Selecting" EnablePaging="true" EnableCaching="false">
                    <SelectParameters>
                        <asp:ControlParameter Name="numero" ControlID="caixaTextoNumContrato" PropertyName="Text"
                            Direction="Input" Type="Int64" />
                        <asp:ControlParameter Name="nome" ControlID="caixaTextoNomeMutuario" PropertyName="Text"
                            Direction="Input" Type="String" />
                        <asp:ControlParameter Name="matricula" ControlID="caixaTextoNumMatricula" PropertyName="Text"
                            Direction="Input" Type="String" />
                        <asp:ControlParameter Name="cpf" ControlID="caixaTextoCPF" PropertyName="Text" Direction="Input"
                            Type="String" />
                        <asp:ControlParameter Name="tipoSuspensao" ControlID="comboTipoSuspensao" PropertyName="SelectedValue"
                            Direction="Input" Type="Int32" />
                        <asp:ControlParameter Name="instrucaoLike" ControlID="comboLike" PropertyName="selectedValue"
                            Direction="Input" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
    <glw:SumarioValidacao ID="sumario" ValidationGroup="amortizacao" runat="server" />
    <br />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ConteudoBotoesAcao" runat="server">
    <glw:BotaoSair ID="botaoSair" comportamentoSair="irParaTelaInicial" runat="server" />
</asp:Content>
