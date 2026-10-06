<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/FormularioMestre.master" 
    AutoEventWireup="true" CodeBehind="Listagem.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.Tratamentos.Parametrizacao.Listagem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ConteudoAdicionalHeadFormulario"
    runat="server">

    <script language="javascript" type="text/javascript">

        function exibirLoading(operacao) {
            var DataInicio = document.getElementById('<%= txtDataInicio.ClientID %>'); 
            
            if (operacao == 'pesquisa') {
                if (DataInicio.value.length == 10) {
                    loading();
                }
            }
            else
            {
                var txtDataInicio = DataInicio.value != "";

                if (txtDataInicio) {
                    loading();                    
                }
            }
            
        }

        function loading()
        {            
            var div = document.getElementById('divLoading');
            var img = '<%= ResolveUrl("~/Imagens/aguarde.gif") %>';
                
            div.style.display = '';
            div.innerHTML = '<img src=\"' + img + '\" style=\"border:0; width:16px; height:16px;\"/>';

            setTimeout(function () {
                div.innerHTML = '<img src=\"' + img + '\" style=\"border:0; width:16px; height:16px;\"/>';
            }, 10);
        }

        function somenteNumeros(num) {
            var er = /[^0-9.]/;
            er.lastIndex = 0;
            var campo = num;
            if (er.test(campo.value)) {
                campo.value = "";
            }
        }

        function somenteLetra(string) {
            var er = /[^a-zA-Z" "]/;
            er.lastIndex = 0;
            var campo = string;
            if (er.test(campo.value)) {
                campo.value = "";
            }
        }

</script>
    <style>
        .hideGridColumn{
            display: none;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="EspacoTituloPagina" runat="server">
    <glw:TituloPagina ID="aba1" titulo="Parametrizar Campanha de Renegociação" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ConteudoFormulario" runat="server">
    <asp:HiddenField ID="hdInstrucaoLike" runat="server" />

    <table cellpadding="0" cellspacing="0" border="0" class="secoesFormulario">
        <glw:SecaoFormulario ID="secaoPrincipal" tituloSecao="Filtros da Busca" expandeContraiSecao="true" runat="server">
            <tr>
                <td>
                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tr>
                            <td style="padding: 10px; width:100px">Data Início:</td>
                            <td>
                                <glw:CaixaData ID="txtDataInicio" runat="server" Width="100px"></glw:CaixaData>
                            </td>
                                <%--<asp:RequiredFieldValidator ID="rfvDataInicio" runat="server" Display="Static" ControlToValidate="txtDataInicio" ErrorMessage="Por favor, informe a data inicial."></asp:RequiredFieldValidator>--%>
                            <td style="padding: 10px; width:100px">Data Fim:</td>
                            <td>
                                <glw:CaixaData ID="txtDataFim" runat="server" Width="100px"></glw:CaixaData>
                            </td>
                                <%--<asp:RequiredFieldValidator ID="rfvDataFim" runat="server" Display="Static" ControlToValidate="txtDataFim" ErrorMessage="Por favor, informe a data final."></asp:RequiredFieldValidator>--%>
                        </tr>
                        <tr>
                            <td colspan="6" style="text-align: right; padding-bottom: 10px">
                                <glw:BotaoProcurar ID="botaoProcurar" runat="server" 
                                    OnClick="botaoProcurar_Click" 
                                    OnClientClick="exibirLoading('pesquisa');" permissoesExigidas="">
                                </glw:BotaoProcurar>
                                <glw:BotaoIncluir ID="botaoIncluir" runat="server" permissoesExigidas="incluir" Text="Inserir">
                                </glw:BotaoIncluir>
                                <glw:BotaoLimpar ID="botaoLimpar" OnClick="botaoLimpar_Click" CausesValidation="false" runat="server">
                                </glw:BotaoLimpar>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </glw:SecaoFormulario>
        <tr>
            <td class="posSecaoFormulario" style="text-align: center;">
                <glw:Grid ID="gridParametros" runat="server" Width="1100px" AllowSorting="true" PageSize="1000" OnRowDataBound="gridParametros_RowDataBound" OnRowCommand="gridParametros_RowCommand">
                    <Columns>
                        <glw:CampoEntidadeComplexa DataField="IdCampanha" HeaderText="Id Campanha" HeaderStyle-CssClass="hideGridColumn" ItemStyle-CssClass="hideGridColumn" />
                        <glw:CampoEntidadeComplexa DataField="IdTipoPropostaCampanha" HeaderText="Tipo Proposta" />
                        <glw:CampoEntidadeComplexa DataField="TipoPropostaCampanha" HeaderText="Proposta" />
                        <glw:CampoEntidadeComplexa DataField="DataInicio" HeaderText="Data Inicio" DataFormatString="{0:dd/MM/yyyy}" />
                        <glw:CampoEntidadeComplexa DataField="DataFim" HeaderText="Data Fim" DataFormatString="{0:dd/MM/yyyy}" />
                        <%--<asp:ImageField HeaderImageUrl="~/Imagens/imgContratarEP.png" DataImageUrlFormatString="~/Imagens/{0}.png" DataImageUrlField="imgContratarEP" AlternateText="Employee Photo" NullDisplayText="No image on file." HeaderText="Photo" ReadOnly="true"></asp:ImageField>--%>
                        <asp:ButtonField ButtonType="Button" HeaderImageUrl="~/Imagens/imgAlterar.png" ControlStyle-Font-Size="X-Small" Text="Alterar" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center"></asp:ButtonField>
                    </Columns>
                </glw:Grid>
                <asp:ObjectDataSource ID="dataSourceParametro" runat="server" SelectMethod="BuscarParametrosCampanha"
                    TypeName="FUNCEF.Planus.WebEmprestimo.Web.Proxies.ProxyContrato"
                    SortParameterName="Ordenacao"
                    StartRowIndexParameterName="IndiceLinha"
                    MaximumRowsParameterName="MaximoLinhas"
                    SelectCountMethod="TotalParametros"
                    OnSelecting="dataSourceParametro_Selecting"
                    EnablePaging="true" EnableCaching="false">
                    <SelectParameters>
                        <asp:ControlParameter Name="DataInicio" ControlID="txtDataInicio" PropertyName="Text" Direction="Input" Type="DateTime" />        
                        <asp:ControlParameter Name="DataFim" ControlID="txtDataFim" PropertyName="Text" Direction="Input" Type="DateTime" />        
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
    <div style="text-align: right; padding-top: 1px">
        <strong>
            <asp:Label runat="server" ID="lblTotalRegistros"></asp:Label></strong>
    </div>
    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ConteudoBotoesAcao" runat="server">
    <glw:BotaoSair ID="botaoSair" comportamentoSair="irParaTelaInicial" runat="server" />
</asp:Content>
