<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/FormularioMestre.master"
    AutoEventWireup="true" CodeBehind="Listagem.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.Tratamentos.Serasa.Listagem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ConteudoAdicionalHeadFormulario"
    runat="server">

    <script language="javascript" type="text/javascript">
        function validarFiltros(objeto, args) {
            var DataInicial = document.getElementById('<%= txtDataInicial.ClientID %>');
    
            try {
                var txtDataInicial = DataInicial.value != "";

                if (!txtDataInicial) {
                    args.IsValid = false;
                    return;
                }

                args.IsValid = true;
            }
            catch (e) {
                args.IsValid = false;
            }
        }

        function validarFiltrosArquivo(objeto, args)
        {
            var DataInicial = document.getElementById('<%= txtDataInicial.ClientID %>');

            var txtNomeResposavel = document.getElementById('<%= txtNomeResposavel.ClientID %>');
            var txtLogonSerasa = document.getElementById('<%= txtLogonSerasa.ClientID %>');
            var txtNumRemessa = document.getElementById('<%= txtNumRemessa.ClientID %>');
            var txtNumTelefone = document.getElementById('<%= txtNumTelefone.ClientID %>');

            try {
                var txtDataInicial = DataInicial.value != "";         
                var NomeResposavel = txtNomeResposavel.value != "";
                var LogonSerasa = txtLogonSerasa.value != "";
                var NumRemessa = txtNumRemessa.value != "";
                var NumTelefone = txtNumTelefone.value != "";

                if (!txtDataInicial || !NomeResposavel || !LogonSerasa || !NumRemessa || !NumTelefone) {
                    args.IsValid = false;
                    return;
                }

                args.IsValid = true;
            }
            catch (e) {
                args.IsValid = false;
            }
        }

        function exibirLoading(operacao) {
            var DataInicial = document.getElementById('<%= txtDataInicial.ClientID %>'); 

            var txtNomeResposavel = document.getElementById('<%= txtNomeResposavel.ClientID %>');
            var txtLogonSerasa = document.getElementById('<%= txtLogonSerasa.ClientID %>');
            var txtNumRemessa = document.getElementById('<%= txtNumRemessa.ClientID %>');
            var txtNumTelefone = document.getElementById('<%= txtNumTelefone.ClientID %>');

            if (operacao == 'pesquisa') {
                if (DataInicial.value.length == 10) {
                    loading();
                }
            }
            else
            {
                var txtDataInicial = DataInicial.value != "";
                var NomeResposavel = txtNomeResposavel.value != "";
                var LogonSerasa = txtLogonSerasa.value != "";
                var NumRemessa = txtNumRemessa.value != "";
                var NumTelefone = txtNumTelefone.value != "";

                if (txtDataInicial && NomeResposavel && LogonSerasa && NumRemessa && NumTelefone) {
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

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="EspacoTituloPagina" runat="server">
    <glw:TituloPagina ID="aba1" titulo="Arquivo de inclusão no Serasa" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ConteudoFormulario" runat="server">
    <asp:HiddenField ID="hdInstrucaoLike" runat="server" />

    <table cellpadding="0" cellspacing="0" border="0" class="secoesFormulario">
        <glw:SecaoFormulario ID="secaoPrincipal" tituloSecao=" 1 - Filtros da Busca" expandeContraiSecao="false" runat="server">
            <tr>
                <td>
                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tr>
                            <td style="padding: 10px; width:240px">Data de geração do evento de cobrança:</td>
                            <td>
                                <glw:CaixaData ID="txtDataInicial" runat="server" Width="100px" ValidationGroup="contrato"></glw:CaixaData>                                
                            </td>
                                <asp:RequiredFieldValidator ID="rfvDataInicial" runat="server" Display="Static" ControlToValidate="txtDataInicial" ErrorMessage="Por favor, informe a data inicial."></asp:RequiredFieldValidator>                                
                        </tr>                        
                    </table>
                </td>
            </tr>
        </glw:SecaoFormulario>



        <glw:SecaoFormulario ID="SecaoArquivo" tituloSecao=" 2 - Dados para gerar remessa" expandeContraiSecao="false" runat="server">
            <tr>
                <td>
                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tr>
                            <td class="espacamento" style="vertical-align: top; padding: 10px;">Nome do responsável:</td>
                            <td style="vertical-align: top; padding: 10px;">
                                <glw:CaixaTexto ID="txtNomeResposavel" runat="server" Width="350px" MaxLength="70" ValidationGroup="arquivo" onkeyup="somenteLetra(this);" Enabled="false"></glw:CaixaTexto>
                                <div>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtNomeResposavel"                                        
                                        ValidationExpression="[A-Z a-zàèìòùÀÈÌÒÙáéíóúýÁÉÍÓÚÝâêîôûÂÊÎÔÛãñõÃÑÕçÇ]*" ErrorMessage="O campo aceita somente texto."
                                        Text="O campo aceita somente texto." SetFocusOnError="true" Display="Dynamic" ValidationGroup="arquivo" />
                                </div>
                            </td>

                            <td class="espacamento" style="vertical-align: top; padding: 10px;">Logon Serasa:</td>
                            <td style="vertical-align: top; padding: 10px;" colspan="4">
                                <glw:CaixaTexto ID="txtLogonSerasa" runat="server" Width="150px" MaxLength="8" onkeyup="somenteNumeros(this);" ValidationGroup="arquivo"></glw:CaixaTexto>
                            </td>
                        </tr>
                        <tr>
                            <td class="espacamento" style="vertical-align: top; padding: 10px;">Telefone do responsável:</td>
                            <td style="vertical-align: top; padding: 10px;">
                                <glw:CaixaTexto ID="txtNumTelefone" runat="server" Width="150px" MaxLength="8" onkeyup="somenteNumeros(this);" ValidationGroup="arquivo"></glw:CaixaTexto>
                            </td>

                            <td class="espacamento" style="vertical-align: top; padding: 10px;">Nº da remessa:</td>
                            <td style="vertical-align: top; padding: 10px;" colspan="4">
                                <glw:CaixaTexto ID="txtNumRemessa" runat="server" Width="150px" MaxLength="5" onkeyup="somenteNumeros(this);" ValidationGroup="arquivo" Enabled="false"></glw:CaixaTexto>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" style="text-align: right; padding-bottom: 10px">
                                <glw:BotaoProcurar ID="botaoProcurar" runat="server" ValidationGroup="contrato" 
                                    OnClick="botaoProcurar_Click" 
                                    OnClientClick="exibirLoading('pesquisa');" permissoesExigidas="">
                                </glw:BotaoProcurar>

                                <glw:BotaoLimpar ID="botaoLimpar" OnClick="botaoLimpar_Click" CausesValidation="false" runat="server">
                                </glw:BotaoLimpar>
                            </td>
                            
                            <td colspan="6" style="text-align: right; padding-bottom: 10px">
                                <asp:LinkButton ID="GerarArquivoSerasa" runat="server" Width="100%"
                                    OnClick="GerarArquivoSerasa_Click"
                                    OnClientClick="exibirLoading('arquivo')"
                                    ValidationGroup="arquivo"
                                    Style="text-decoration: none; color: black">
                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Imagens/imgContratarEP.png" BackColor="Transparent" />
                                    <asp:Label ID="Label5" runat="server" Text="  Gerar arquivo" Style="vertical-align: bottom;"></asp:Label>
                                </asp:LinkButton>
                            </td>
                            <td colspan="6">
                                <div id="divLoading" style="display: none;"></div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </glw:SecaoFormulario>
        <tr>
            <td class="posSecaoFormulario" style="text-align: center;">
                <glw:Grid ID="gridContrato" runat="server" Width="1100px" AllowSorting="true" PageSize="1000" OnRowDataBound="gridContrato_RowDataBound">
                    <Columns>
                        <glw:CampoEntidadeComplexa DataField="NumeroContrato" HeaderText="Nº contrato" />
                        <glw:CampoEntidadeComplexa DataField="Modalidade" HeaderText="Modalidade" />
                        <glw:CampoEntidadeComplexa DataField="NumeroPrestacao" HeaderText="Nº prestação" />
                        <glw:CampoEntidadeComplexa DataField="SaldoInadimplencia" HeaderText="Valor inadimplência (R$)" DataFormatString="{0:N2}" ItemStyle-CssClass="text-align-right" />
                        <glw:CampoEntidadeComplexa DataField="DataInadimplencia" HeaderText="Data inadimplência" DataFormatString="{0:dd/MM/yyyy}" />                        
                        <glw:CampoEntidadeComplexa DataField="NumCPF" HeaderText="CPF" />
                        <glw:CampoEntidadeComplexa DataField="Matricula" HeaderText="Matrícula" />
                        <glw:CampoEntidadeComplexa DataField="NomeParticipante" HeaderText="Participante" ItemStyle-HorizontalAlign="Left" />
                        <glw:CampoEntidadeComplexa DataField="FormaPagamento" HeaderText="Forma pagamento" />
                    </Columns>
                </glw:Grid>
                <asp:ObjectDataSource ID="dataSourceContrato" runat="server" SelectMethod="BuscarContratosInclusaoSerasa"
                    TypeName="FUNCEF.Planus.WebEmprestimo.Web.Proxies.ProxyContrato"
                    SortParameterName="Ordenacao"
                    StartRowIndexParameterName="IndiceLinha"
                    MaximumRowsParameterName="MaximoLinhas"
                    SelectCountMethod="TotalContratosInadimplentes"
                    OnSelecting="dataSourceContrato_Selecting"
                    EnablePaging="true" EnableCaching="false">
                    <SelectParameters>
                        <asp:ControlParameter Name="NumeroRemessa" ControlID="txtNumRemessa" PropertyName="Text" Direction="Input" Type="Int32" />
                        <asp:ControlParameter Name="Usuario" ControlID="txtNumRemessa" PropertyName="Text" Direction="Input" Type="String" />
                        <asp:ControlParameter Name="DataEventoCobranca" ControlID="txtDataInicial" PropertyName="Text" Direction="Input" Type="DateTime" />        
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
    <div style="text-align: right; padding-top: 1px">
        <strong>
            <asp:Label runat="server" ID="lblTotalRegistros"></asp:Label></strong>
    </div>
    <glw:SumarioValidacao ID="sumario" ValidationGroup="contrato" runat="server" />
    <glw:SumarioValidacao ID="SumarioValidacao1" ValidationGroup="arquivo" runat="server" />
                               
    <asp:CustomValidator ID="validadorFiltros" runat="server" Display="None"  
        ErrorMessage="Prencha as datas do período desejado."
        ClientValidationFunction="validarFiltros" 
        ValidationGroup="contrato">
    </asp:CustomValidator>
    <asp:CustomValidator ID="CustomValidatorArquivo" runat="server" Display="None" 
        ErrorMessage="Preencha o período desejado e todos os campos de dados para o arquivo."
        ClientValidationFunction="validarFiltrosArquivo" 
        ValidationGroup="arquivo">
    </asp:CustomValidator>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ConteudoBotoesAcao" runat="server">
    <glw:BotaoSair ID="botaoSair" comportamentoSair="irParaTelaInicial" runat="server" />
</asp:Content>
