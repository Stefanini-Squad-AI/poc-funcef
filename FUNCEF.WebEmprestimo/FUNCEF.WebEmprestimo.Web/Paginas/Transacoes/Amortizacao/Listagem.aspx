<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/FormularioMestre.master"
    AutoEventWireup="true" CodeBehind="Listagem.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.Transacoes.Amortizacao.Listagem" %>

<%@ Import Namespace="FUNCEF.Planus.WebEmprestimo.Web.Componentes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ConteudoAdicionalHeadFormulario"
    runat="server">

    <script type="text/javascript" language="javascript">
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
    <glw:TituloPagina ID="aba1" titulo="Amortização / Refinanciamento" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ConteudoFormulario" runat="server">
    <table cellpadding="0" cellspacing="0" border="0" class="secoesFormulario">
        <glw:SecaoFormulario ID="secaoPrincipal" tituloSecao="Filtros da Busca" expandeContraiSecao="true" runat="server">
            <tr>
                <td style="padding-left:2%" class="espacamento">
                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <%--NILTON - CORRECAO - 05/02/13  - Mudança das posições das caixas de texto--%>
                        <tr>
                            <td class="espacamento" style="width: 280px; vertical-align: top;">Nome do Mutuário:&nbsp;
                        <glw:CaixaTexto ID="caixaTextoNomeMutuario" runat="server" Width="150px" MaxLength="60"></glw:CaixaTexto>
                                <div>
                                    <glw:ValidadorFiltroPesquisa ID="filtroNomeMutuario" ControlToValidate="caixaTextoNomeMutuario"
                                        nomeCampo="Nome do Mutuário" ValidationGroup="amortizacao" runat="server"></glw:ValidadorFiltroPesquisa>
                                </div>
                                <div>
                                    <asp:RegularExpressionValidator ID="validadorNomeMutuario" runat="server" ControlToValidate="caixaTextoNomeMutuario"
                                        ValidationExpression="[A-Z a-z]*" ErrorMessage="O Nome contém caracteres inválidos."
                                        Text="Caracteres inválidos." SetFocusOnError="true" Display="Dynamic" ValidationGroup="amortizacao"></asp:RegularExpressionValidator>
                                </div>
                            </td>
                            <td style="width: 370px; vertical-align: top;">Matrícula:&nbsp;
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
                            <td class="espacamento" style="width: 305px; vertical-align: top;">CPF:&nbsp;
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
                            <td style="width: 305px; vertical-align: top;" colspan="2">Nº. Contrato:&nbsp;
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
                            <%--NILTON - CORRECAO - 05/02/13  - Mudança das posições das caixas de texto--%>
                            <td style="text-align: right; vertical-align: bottom;">
                                <glw:BotaoProcurar ID="botaoProcurar" runat="server" ValidationGroup="amortizacao"
                                    OnClick="botaoProcurar_Click" permissoesExigidas="" Style="padding-top: 10px;"></glw:BotaoProcurar>
                                <glw:BotaoLimpar ID="botaoLimpar" OnClick="botaoLimpar_Click" CausesValidation="false"
                                    runat="server" Style="padding-top: 10px;"></glw:BotaoLimpar>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:CustomValidator ID="validadorFiltros" runat="server" Display="Dynamic" ErrorMessage="Selecione ao menos um filtro."
                                    ClientValidationFunction="validarFiltros" ValidationGroup="amortizacao"></asp:CustomValidator>
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
                <glw:Grid ID="gridAmortizacao" runat="server" width="100%" DataKeyNames="numero" AllowSorting="true" OnRowDataBound="gridAmortizacao_RowDataBound">
                    <Columns>
                        <glw:CampoLinkLimitado DataTextField="numero" HeaderText="Num. Contrato" DataNavigateUrlFormatString="~/Paginas/Transacoes/Amortizacao/Visualizacao.aspx?Numero={0}"
                            DataNavigateUrlFields="numero" tamanhoMaximo="20" permissoesExigidas="incluir" />
                        <glw:CampoEntidadeComplexa DataField="mutuario.nome" HeaderText="Nome" />
                        <glw:CampoEntidadeComplexa DataField="mutuario.matricula" HeaderText="Matrícula" />
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
                <asp:ObjectDataSource ID="dataSourceAmortizacao" runat="server" SelectMethod="consultarContratosAtivos"
                    TypeName="FUNCEF.Planus.WebEmprestimo.Web.Proxies.ProxyContrato" SortParameterName="ordenacao"
                    StartRowIndexParameterName="indiceLinha" MaximumRowsParameterName="maximoLinhas"
                    SelectCountMethod="totalContratosAtivos" OnDeleted="dataSourceAmortizacao_Deleted"
                    OnSelecting="dataSourceAmortizacao_Selecting" EnablePaging="true" EnableCaching="false">
                    <SelectParameters>
                        <asp:ControlParameter Name="numero" ControlID="caixaTextoNumContrato" PropertyName="Text" Direction="Input" Type="Int64" />
                        <asp:ControlParameter Name="nome" ControlID="caixaTextoNomeMutuario" PropertyName="Text" Direction="Input" Type="String" />
                        <asp:ControlParameter Name="matricula" ControlID="caixaTextoNumMatricula" PropertyName="Text"  Direction="Input" Type="String" />
                        <asp:ControlParameter Name="cpf" ControlID="caixaTextoCPF" PropertyName="Text" Direction="Input" Type="String" />
                        <asp:ControlParameter Name="instrucaoLike" ControlID="comboLike" PropertyName="selectedValue"  Direction="Input" Type="String" />
                        <asp:ControlParameter Name="DataLimite" ControlID="caixaDataAtualizacao" PropertyName="Text"  Direction="Input" Type="String" />
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
