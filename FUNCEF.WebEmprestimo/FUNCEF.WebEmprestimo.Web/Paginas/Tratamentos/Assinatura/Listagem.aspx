<%@ Page Title="" Language="C#" MasterPageFile="~/Paginas/Mestre/FormularioMestre.master" AutoEventWireup="true" CodeBehind="Listagem.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.Tratamentos.Assinatura.Listagem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ConteudoAdicionalHeadFormulario" runat="server">
    <script type="text/javascript">
        function validarFiltros(objeto, args) {
            var caixaTextoNumMatricula = document.getElementById('<%= caixaTextoNumMatricula.ClientID %>');
            var caixaTextoCPF = document.getElementById('<%= caixaTextoCPF.ClientID %>');

            args.IsValid = caixaTextoNumMatricula.value || caixaTextoCPF.value;
        }

        function validarCPF(sender, args) {
            var control = document.getElementById(sender.controltovalidate);
            var cpf = '';

            if (control.value == '') {
                args.IsValid = true;
                return;
            }

            cpf = control.value.replace(/[^\d]+/g, '');

            if (cpf == '') {
                args.IsValid = false;
                return;
            }

            // Elimina CPFs invalidos conhecidos
            if (cpf.length != 11 || cpf == "00000000000" || cpf == "11111111111" || cpf == "22222222222" || cpf == "33333333333" || cpf == "44444444444" || cpf == "55555555555" || cpf == "66666666666" || cpf == "77777777777" || cpf == "88888888888" || cpf == "99999999999") {
                args.IsValid = false;
                return;
            }

            // Valida 1o digito
            add = 0;

            for (i = 0; i < 9; i++)
                add += parseInt(cpf.charAt(i)) * (10 - i);

            rev = 11 - (add % 11);

            if (rev == 10 || rev == 11)
                rev = 0;

            if (rev != parseInt(cpf.charAt(9))) {
                args.IsValid = false;
                return;
            }

            // Valida 2o digito
            add = 0;

            for (i = 0; i < 10; i++)
                add += parseInt(cpf.charAt(i)) * (11 - i);

            rev = 11 - (add % 11);

            if (rev == 10 || rev == 11)
                rev = 0;

            if (rev != parseInt(cpf.charAt(10))) {
                args.IsValid = false;
                return;
            }

            args.IsValid = true;
        }
    </script>
    <style type="text/css">
        tr[id$=trConteudo] > td {
            display: block;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="EspacoTituloPagina" runat="server">
    <glw:TituloPagina ID="aba1" titulo="Assinatura de Contrato Padrão" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ConteudoFormulario" runat="server">
    <table cellpadding="0" cellspacing="0" border="0" class="secoesFormulario">
        <glw:SecaoFormulario ID="secaoPrincipal" tituloSecao="Filtros da Busca" expandeContraiSecao="true" runat="server">
            <tr>
                <td style="padding-left: 2%">
                    <table cellpadding="" cellspacing="0" border="0" width="100%">
                        <tr>
                            <td class="espacamento" style="text-align: right; width: 5%; padding: 0px">Matrícula:&nbsp;
                            </td>
                            <td style="width: 10%;">
                                <glw:CaixaTexto ID="caixaTextoNumMatricula" runat="server" Width="100px" MaxLength="13"></glw:CaixaTexto>
                            </td>
                            <td style="text-align: right; width: 5%;">CPF:&nbsp;
                            </td>
                            <td>
                                <glw:CaixaTexto ID="caixaTextoCPF" runat="server" Width="150px" MaxLength="18"></glw:CaixaTexto>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" style="text-align: right; padding-right: 30px; vertical-align: bottom">
                                <glw:BotaoProcurar ID="botaoProcurar" runat="server" ValidationGroup="emprestimo" OnClick="botaoProcurar_Click" Style="padding-top: 10px;"></glw:BotaoProcurar>
                                <glw:BotaoIncluir ID="botaoIncluir" runat="server" permissoesExigidas="incluir" Text="Inserir" Visible="false"></glw:BotaoIncluir>
                                <glw:BotaoLimpar ID="botaoLimpar" OnClick="botaoLimpar_Click" CausesValidation="false" runat="server" Style="padding-top: 10px;"></glw:BotaoLimpar>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <div>
                                    <glw:ValidadorFiltroPesquisa ID="filtroNumMatricula" ControlToValidate="caixaTextoNumMatricula" nomeCampo="Matricula" ValidationGroup="emprestimo" runat="server"></glw:ValidadorFiltroPesquisa>
                                </div>
                                <div>
                                    <asp:RegularExpressionValidator ID="validadorNumeroMatricula" runat="server" ControlToValidate="caixaTextoNumMatricula" ValidationExpression="[0-9A-Za-z]*" ErrorMessage="O Número de Matrícula contém caracteres inválidos." SetFocusOnError="true" Display="Dynamic" ValidationGroup="emprestimo"></asp:RegularExpressionValidator>
                                </div>
                                <div>
                                    <asp:CustomValidator ID="validarCPF" runat="server" ClientValidationFunction="validarCPF" ControlToValidate="caixaTextoCPF" ErrorMessage="CPF Inválido" SetFocusOnError="true" Display="Dynamic" ValidationGroup="emprestimo"></asp:CustomValidator>
                                </div>
                                <div>
                                    <asp:CustomValidator ID="validadorFiltros" runat="server" Display="Dynamic" ErrorMessage="Selecione ao menos um filtro." ClientValidationFunction="validarFiltros" ValidationGroup="emprestimo"></asp:CustomValidator>
                                </div>
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
                <glw:Grid ID="gridAssinaturas" runat="server" Width="100%" DataKeyNames="idContratoPadrao,mutuario,dataAssinatura"
                    AllowSorting="true" OnRowDataBound="gridAssinaturas_RowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderText="Doc." ItemStyle-HorizontalAlign="Right">
                            <ItemTemplate>
                                <div class="campoDataGrid">
                                    <asp:HyperLink ID="hplPdf" runat="server" Target="_blank">
                                        <asp:Image ID="imgPdf" runat="server" ImageUrl='<%# ResolveUrl("~/Imagens/imgPdf.png") %>'></asp:Image>
                                    </asp:HyperLink>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <glw:CampoLimitado DataField="dataAssinatura" HeaderText="Data" DataFormatString="{0:dd/MM/yyyy}" />
                        <glw:CampoLinkLimitado DataTextField="observacao" HeaderText="Descrição" tamanhoMaximo="60" ItemStyle-HorizontalAlign="Left" />
                        <glw:CampoEntidadeComplexa DataField="mutuario.matricula" HeaderText="Matrícula" />
                        <glw:CampoEntidadeComplexa DataField="mutuario.nome" HeaderText="Mutuario" tamanhoMaximo="60" />
                    </Columns>
                </glw:Grid>
                <asp:ObjectDataSource ID="dataSourceMutuarios" runat="server" SelectMethod="consultar"
                    TypeName="FUNCEF.Planus.WebEmprestimo.Web.Proxies.ProxyAssinatura" SortParameterName="ordenacao"
                    StartRowIndexParameterName="indiceLinha" MaximumRowsParameterName="maximoLinhas"
                    SelectCountMethod="total" OnSelecting="dataSourceMutuario_Selecting" OnSelected="dataSourceMutuarios_Selected"
                    EnablePaging="true" EnableCaching="false">
                    <SelectParameters>
                        <asp:ControlParameter Name="matricula" ControlID="caixaTextoNumMatricula" PropertyName="Text" Direction="Input" Type="String" />
                        <asp:ControlParameter Name="cpf" ControlID="caixaTextoCPF" PropertyName="Text" Direction="Input" Type="String" />
                        <asp:Parameter Name="queryString" Direction="Output" Type="String" />
                        <asp:Parameter Name="mensagemExcecao" Direction="Output" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
    <glw:SumarioValidacao ID="sumario" ValidationGroup="emprestimo" runat="server" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ConteudoBotoesAcao" runat="server">
    <glw:BotaoSair ID="botaoSair" comportamentoSair="irParaTelaInicial" runat="server" />
</asp:Content>
