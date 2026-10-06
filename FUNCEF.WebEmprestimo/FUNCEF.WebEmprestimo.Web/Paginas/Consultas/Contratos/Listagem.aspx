<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/FormularioMestre.master"
    AutoEventWireup="true" CodeBehind="Listagem.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.Consultas.Contratos.Listagem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ConteudoAdicionalHeadFormulario"
    runat="server">

    <script language="javascript" type="text/javascript">
        function validarFiltros(objeto, args) {
            var caixaTextoNumContrato = document.getElementById('<%= caixaTextoNumeroContrato.ClientID %>');
            var caixaTextoNomeMutuario = document.getElementById('<%= caixaTextoNomeMutuario.ClientID %>');
            var caixaTextoNumeroMatricula = document.getElementById('<%= caixaTextoNumeroMatricula.ClientID %>');
            var caixaTextoCPF = document.getElementById('<%= caixaTextoCPF.ClientID %>');
            var comboSituacao = document.getElementById('<%= dropDownSituacao.ClientID %>');

            try {
                var possuiNumContrato = caixaTextoNumContrato.value != "";
                var possuiNomeMutuario = caixaTextoNomeMutuario.value != "";
                var possuiNumeroMatricula = caixaTextoNumeroMatricula.value != "";
                var possuiCPF = caixaTextoCPF.value != "";
                var possuiSituacao = comboSituacao.value != "0";


                if (!possuiNumContrato && !possuiNomeMutuario && !possuiNumeroMatricula && !possuiCPF && !possuiSituacao) {
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
    <glw:TituloPagina ID="aba1" titulo="Contratos e Parcelas" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ConteudoFormulario" runat="server">
    <%--NILTON - CORRECAO 05/02/13 - posicao dos campos--%>
    <table cellpadding="0" cellspacing="0" border="0" class="secoesFormulario">
        <glw:SecaoFormulario ID="secaoPrincipal" tituloSecao="Filtros da Busca" expandeContraiSecao="true" runat="server">
            <tr>
                <td style="padding-left:2%">
                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tr style="padding-bottom: 10px;">
                            <td class="espacamento" style="width: 370px; vertical-align: top;">
                                Nome do Mutuário:&nbsp;
                                <glw:CaixaTexto ID="caixaTextoNomeMutuario" runat="server" Width="150px" MaxLength="60"></glw:CaixaTexto>
                                <div>
                                    <glw:ValidadorFiltroPesquisa ID="filtroNomeMutuario" ControlToValidate="caixaTextoNomeMutuario" nomeCampo="Nome do Mutuário" ValidationGroup="contrato" runat="server"></glw:ValidadorFiltroPesquisa>
                                </div>
                                <div>
                                    <%--William moreira da Silva - SOL 223634 KTN 2059069 - Colocando " " como um caracter valido para OnDataBinding search pelo nome--%>
                                    <asp:RegularExpressionValidator ID="validadorNomeMutuario" runat="server" ControlToValidate="caixaTextoNomeMutuario"
                                        ValidationExpression="[A-Z a-z]*" ErrorMessage="O Nome contém caracteres inválidos."
                                        Text="Caracteres inválidos." SetFocusOnError="true" Display="Dynamic" ValidationGroup="contrato"></asp:RegularExpressionValidator>
                                </div>
                            </td>
                            <td style="width: 370px; vertical-align: top;">
                                Matrícula:
                                <glw:CaixaTexto ID="caixaTextoNumeroMatricula" runat="server" Width="100px" MaxLength="13"></glw:CaixaTexto>
                                <asp:DropDownList runat="server" ID="comboLike">
                                </asp:DropDownList>
                                <div>
                                    <glw:ValidadorFiltroPesquisa ID="filtroNumeroMatricula" ControlToValidate="caixaTextoNumeroMatricula"
                                        nomeCampo="Número de Matrícula" ValidationGroup="contrato" runat="server"></glw:ValidadorFiltroPesquisa>
                                </div>
                                <div>
                                    <asp:RegularExpressionValidator ID="validadorNumeroMatricula" runat="server" ControlToValidate="caixaTextoNumeroMatricula"
                                        ValidationExpression="[A-Za-z0-9]*" ErrorMessage="O Número de Matrícula contém caracteres inválidos."
                                        Text="Caracteres inválidos." SetFocusOnError="true" Display="Dynamic" ValidationGroup="contrato"></asp:RegularExpressionValidator>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="espacamento" style="width: 305px; vertical-align: top;">
                                CPF:&nbsp;
                                <glw:CaixaTexto ID="caixaTextoCPF" runat="server" Width="150px" MaxLength="18"></glw:CaixaTexto>
                                <div>
                                    <glw:ValidadorFiltroPesquisa ID="filtroCPF" ControlToValidate="caixaTextoCPF" nomeCampo="CPF"
                                        ValidationGroup="contrato" runat="server"></glw:ValidadorFiltroPesquisa>
                                </div>
                                <div>
                                    <asp:RegularExpressionValidator ID="validadorCPF" runat="server" ControlToValidate="caixaTextoCPF"
                                        ValidationExpression="[0-9]*" ErrorMessage="O CPF contém caracteres inválidos."
                                        Text="Caracteres inválidos." SetFocusOnError="true" Display="Dynamic" ValidationGroup="contrato"></asp:RegularExpressionValidator>
                                </div>
                            </td>
                            <td style="width: 305px; vertical-align: top;">
                                Nº. Contrato:&nbsp;
                                <glw:CaixaTexto ID="caixaTextoNumeroContrato" runat="server" Width="154px" MaxLength="18"></glw:CaixaTexto>
                                <div>
                                    <glw:ValidadorFiltroPesquisa ID="filtroNumeroContrato" ControlToValidate="caixaTextoNumeroContrato"
                                        nomeCampo="Num. do Contrato" ValidationGroup="contrato" runat="server"></glw:ValidadorFiltroPesquisa>
                                </div>
                                <div>
                                    <asp:RegularExpressionValidator ID="validadorNumeroContrato" runat="server" ControlToValidate="caixaTextoNumeroContrato"
                                        ValidationExpression="[0-9]*" ErrorMessage="O Num. do Contrato contém caracteres inválidos."
                                        Text="Caracteres inválidos." SetFocusOnError="true" Display="Dynamic" ValidationGroup="contrato"></asp:RegularExpressionValidator>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="espacamento" style="width: 370px; vertical-align: top;">
                                Situação:&nbsp;
                                <glw:CampoDropDown ID="dropDownSituacao" runat="server" Width="214px" ValidationGroup="contrato" DataTextField="descricao" DataValueField="codigo" DefaultText="Selecione" DefaultValue="0"></glw:CampoDropDown>
                            </td>
                            <td style="width: 305px; vertical-align: top;">
                                &nbsp;
                            </td>
                            <td style="text-align: right; width: 350px; padding-right: 30px; vertical-align: top;">
                                <glw:BotaoProcurar ID="botaoProcurar" runat="server" ValidationGroup="contrato" OnClick="botaoProcurar_Click"
                                    permissoesExigidas="" Style="padding-top: 10px;"></glw:BotaoProcurar>
                                <glw:BotaoLimpar ID="botaoLimpar" OnClick="botaoLimpar_Click" CausesValidation="false"
                                    runat="server" Style="padding-top: 10px;"></glw:BotaoLimpar>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:CustomValidator ID="validadorFiltros" runat="server" Display="Dynamic" ErrorMessage="Selecione ao menos um filtro."
                                    ClientValidationFunction="validarFiltros" ValidationGroup="contrato"></asp:CustomValidator>
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
                <glw:Grid ID="gridContrato" runat="server" Width="850px" AllowSorting="true" OnRowDataBound ="gridContrato_RowDataBound">
                    <Columns>
                        <asp:HyperLinkField DataTextField="numero" HeaderText="Num. Contrato" DataNavigateUrlFormatString="~/Paginas/Consultas/Contratos/Visualizacao.aspx?Numero={0}"
                            DataNavigateUrlFields="numero" />
                        <glw:CampoEntidadeComplexa DataField="idSituacao" HeaderText="Situação" />
                        <glw:CampoEntidadeComplexa DataField="mutuario.nome" HeaderText="Nome" ItemStyle-HorizontalAlign="Left" />
                        <glw:CampoEntidadeComplexa DataField="mutuario.matricula" HeaderText="Matrícula" />
                        <glw:CampoEntidadeComplexa DataField="tipo.descricao" HeaderText="Tipo Contrato" />
                        <asp:TemplateField HeaderText="Dt. Assinatura" ItemStyle-HorizontalAlign="Right">
                            <ItemTemplate>
                                <div class="campoDataGrid">
                                    <span>
                                        <%# DataBinder.Eval(Container.DataItem, "dataAssinatura", "{0:dd/MM/yyyy}") != null ? DataBinder.Eval(Container.DataItem, "dataAssinatura", "{0:dd/MM/yyyy}") : "" %></span>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </glw:Grid>
                <asp:ObjectDataSource ID="dataSourceContrato" runat="server" SelectMethod="pesquisar"
                    TypeName="FUNCEF.Planus.WebEmprestimo.Web.Proxies.ProxyContrato" SortParameterName="ordenacao"
                    StartRowIndexParameterName="indiceLinha" MaximumRowsParameterName="maximoLinhas"
                    SelectCountMethod="totalContratos" OnSelecting="dataSourceContrato_Selecting"
                    EnablePaging="true" EnableCaching="false">
                    <SelectParameters>
                        <asp:ControlParameter Name="numeroContrato" ControlID="caixaTextoNumeroContrato"
                            PropertyName="Text" Direction="Input" Type="Int64" />
                        <asp:ControlParameter Name="nomeMutuario" ControlID="caixaTextoNomeMutuario" PropertyName="Text"
                            Direction="Input" Type="String" />
                        <asp:ControlParameter Name="matricula" ControlID="caixaTextoNumeroMatricula" PropertyName="Text"
                            Direction="Input" Type="String" />
                        <asp:ControlParameter Name="cpf" ControlID="caixaTextoCPF" PropertyName="Text" Direction="Input"
                            Type="String" />
                        <asp:ControlParameter Name="idSituacao" ControlID="dropDownSituacao" PropertyName="selectedValue"
                            Direction="Input" Type="String" />
                        <asp:ControlParameter Name="instrucaoLike" ControlID="comboLike" PropertyName="selectedValue"
                            Direction="Input" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
    <glw:SumarioValidacao ID="sumario" ValidationGroup="contrato" runat="server" />
    <br />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ConteudoBotoesAcao" runat="server">
    <glw:BotaoSair ID="botaoSair" comportamentoSair="irParaTelaInicial" runat="server" />
</asp:Content>
