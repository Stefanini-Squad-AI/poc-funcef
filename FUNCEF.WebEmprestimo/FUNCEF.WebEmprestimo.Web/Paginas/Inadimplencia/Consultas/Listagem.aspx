<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/FormularioMestre.master"
    AutoEventWireup="true" CodeBehind="Listagem.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.Inadimplencia.Consultas.Listagem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ConteudoAdicionalHeadFormulario"
    runat="server">

    <script language="javascript" type="text/javascript">
        function validarFiltros(objeto, args) {
            var caixaTextoNome = document.getElementById('<%= caixaTextoNome.ClientID %>');
            var caixaTextoNumMatricula = document.getElementById('<%= caixaTextoNumMatricula.ClientID %>');
            var caixaTextoCPF = document.getElementById('<%= caixaTextoCPF.ClientID %>');

            try {
                var possuiNome = caixaTextoNome.value != "";
                var possuiNumMatricula = caixaTextoNumMatricula.value != "";
                var possuiCPF = caixaTextoCPF.value != "";

                if (!possuiNome && !possuiNumMatricula && !possuiCPF) {
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
    <glw:TituloPagina ID="aba1" titulo="Consultar mutuário" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ConteudoFormulario" runat="server">
    <table cellpadding="0" cellspacing="0" border="0" class="secoesFormulario">
        <glw:SecaoFormulario ID="secaoPrincipal" tituloSecao="Filtros da Busca" expandeContraiSecao="true" runat="server">
            <tr>
                <td class="espacamento" style="padding-left:2%">
                    <table cellpadding="" cellspacing="0" border="0" width="100%">
                        <tr>
                            <%--NILTON - CORRECAO 05/02/13 - Trocado as posições dos campos--%>
                            <td style="width: 20px; vertical-align: top" class="espacamento">
                                Nome:
                            </td>
                            <td style="width: 405px; vertical-align: top">
                                <glw:CaixaTexto ID="caixaTextoNome" runat="server" Width="300px" MaxLength="60"></glw:CaixaTexto>
                                <div>
                                    <glw:ValidadorFiltroPesquisa ID="filtroNome" ControlToValidate="caixaTextoNome" nomeCampo="Nome" ValidationGroup="emprestimo " runat="server"></glw:ValidadorFiltroPesquisa>
                                </div>
                                <div>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="caixaTextoNome"
                                        ValidationExpression="[A-Z a-z]*" ErrorMessage="Nome contém caracteres inválidos."
                                        Text="Caracteres inválidos." SetFocusOnError="true" Display="Dynamic" ValidationGroup="emprestimo"></asp:RegularExpressionValidator>
                                </div>
                            </td>

                            <td style="width: 350px; vertical-align: top">
                                Matrícula:&nbsp;
                                <glw:CaixaTexto ID="caixaTextoNumMatricula" runat="server" Width="100px" MaxLength="13"></glw:CaixaTexto>
                                <asp:DropDownList runat="server" ID="comboLike">
                                </asp:DropDownList>
                                <div>
                                    <glw:ValidadorFiltroPesquisa ID="filtroNumMatricula" ControlToValidate="caixaTextoNumMatricula"
                                        nomeCampo="Matricula" ValidationGroup="emprestimo" runat="server"></glw:ValidadorFiltroPesquisa>
                                </div>
                                <div>
                                    <asp:RegularExpressionValidator ID="validadorNumeroMatricula" runat="server" ControlToValidate="caixaTextoNumMatricula"
                                        ValidationExpression="[0-9A-Za-z]*" ErrorMessage="O Número de Matrícula contém caracteres inválidos."
                                        Text="Caracteres inválidos." SetFocusOnError="true" Display="Dynamic" ValidationGroup="emprestimo"></asp:RegularExpressionValidator>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="espacamento" style="vertical-align: top;">
                                CPF:
                            </td>
                            <td style="vertical-align: top;">
                                <glw:CaixaTexto ID="caixaTextoCPF" runat="server" Width="150px" MaxLength="18"></glw:CaixaTexto>
                                <div>
                                    <glw:ValidadorFiltroPesquisa ID="filtroCPF" ControlToValidate="caixaTextoCPF" nomeCampo="CPF"
                                        ValidationGroup="emprestimo" runat="server"></glw:ValidadorFiltroPesquisa>
                                </div>
                                <div>
                                    <asp:RegularExpressionValidator ID="validadorCPF" runat="server" ControlToValidate="caixaTextoCPF"
                                        ValidationExpression="[0-9]*" ErrorMessage="O CPF contém caracteres inválidos."
                                        Text="Caracteres inválidos." SetFocusOnError="true" Display="Dynamic" ValidationGroup="emprestimo"></asp:RegularExpressionValidator>
                                </div>
                            </td>

                            <%--NILTON - CORRECAO 05/02/13 - Trocado as posições dos campos--%>
                            <td style="text-align: right; padding-right: 30px; vertical-align: bottom">
                                <glw:BotaoProcurar ID="botaoProcurar" runat="server" ValidationGroup="emprestimo"
                                    OnClick="botaoProcurar_Click" permissoesExigidas="" Style="padding-top: 10px;"></glw:BotaoProcurar>
                                <glw:BotaoLimpar ID="botaoLimpar" OnClick="botaoLimpar_Click" CausesValidation="false"
                                    runat="server" Style="padding-top: 10px;"></glw:BotaoLimpar>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:CustomValidator ID="validadorFiltros" runat="server" Display="Dynamic" ErrorMessage="Selecione ao menos um filtro de pesquisa."
                                    ClientValidationFunction="validarFiltros" ValidationGroup="emprestimo"></asp:CustomValidator>
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
                <glw:Grid ID="gridMutuarios" runat="server" Width="100%" DataKeyNames="id" AllowSorting="true">
                    <Columns>
                        <%--Thiago Melo - SOL 206149 KTN 1994973 - Inclusão do parametro matricula na qrystring--%>
                        <glw:CampoLinkLimitado DataTextField="nome" HeaderText="Nome" 
                            DataNavigateUrlFormatString="~/Paginas/Inadimplencia/Consultas/Visualizacao.aspx?idPessoa={0}&matricula={1}"
                            DataNavigateUrlFields="id,matricula" tamanhoMaximo="60" permissoesExigidas="consultar" 
                            ItemStyle-HorizontalAlign="Left" 
                            ControlStyle-CssClass="paddingLeft-5" />
                        <%--William Moreira da Silva - SOL 205807 KTN 1989865 - Mudança na permissão do botão--%>
                        <glw:CampoLimitado DataField="matricula" HeaderText="Matrícula" />
                        <%--<glw:CampoLimitado DataField="tipo" HeaderText="Tipo" />--%>
                        <%--<glw:CampoLimitado DataField="inscricaoPrevidenciaria" HeaderText="Inscrição Prev." />--%>
                        <asp:TemplateField HeaderText="CPF" ItemStyle-HorizontalAlign="Right">
                            <ItemTemplate>
                                <div class="campoDataGrid">
                                    <span>
                                        <%# FUNCEF.Planus.WebEmprestimo.Web.Componentes.Utilidades.UtilidadeSistema.formatarCPF(DataBinder.Eval(Container.DataItem, "cpf").ToString()) %></span>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <glw:CampoLimitado DataField="situacao" HeaderText="Situação" />
                        <glw:CampoEntidadeComplexa DataField="plano.situacao" HeaderText="Situação no Plano" />
                        <glw:CampoEntidadeComplexa DataField="plano.descricao" HeaderText="Plano" />
                    </Columns>
                </glw:Grid>
                <asp:ObjectDataSource ID="dataSourceMutuarios" runat="server" SelectMethod="consultarMutuario"
                    TypeName="FUNCEF.Planus.WebEmprestimo.Web.Proxies.ProxyMutuario" SortParameterName="ordenacao"
                    StartRowIndexParameterName="indiceLinha" MaximumRowsParameterName="maximoLinhas"
                    SelectCountMethod="totalMutuarios" OnSelecting="dataSourceMutuario_Selecting"
                    EnablePaging="true" EnableCaching="false">
                    <SelectParameters>
                        <asp:ControlParameter Name="nomeMutuario" ControlID="caixaTextoNome" PropertyName="Text"
                            Direction="Input" Type="String" />
                        <asp:ControlParameter Name="matricula" ControlID="caixaTextoNumMatricula" PropertyName="Text"
                            Direction="Input" Type="String" />
                        <asp:ControlParameter Name="cpf" ControlID="caixaTextoCPF" PropertyName="Text" Direction="Input"
                            Type="String" />
                        <asp:ControlParameter Name="instrucaoLike" ControlID="comboLike" PropertyName="SelectedValue"
                            Direction="Input" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
    <glw:SumarioValidacao ID="sumario" ValidationGroup="emprestimo" runat="server" />
    <br />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ConteudoBotoesAcao" runat="server">
    <glw:BotaoSair ID="botaoSair" comportamentoSair="irParaTelaInicial" runat="server" />
</asp:Content>
