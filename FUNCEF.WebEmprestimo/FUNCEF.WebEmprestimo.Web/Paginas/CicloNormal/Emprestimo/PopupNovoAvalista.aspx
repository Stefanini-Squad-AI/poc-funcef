<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/DialogoMestre.master" AutoEventWireup="true"
    CodeBehind="PopupNovoAvalista.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.Consultas.Contratos.PopupNovoAvalista" %>

<asp:Content ID="ConteudoAdicionalHead" runat="server" ContentPlaceHolderID="ConteudoAdicionalHead">

    <script language="javascript" type="text/javascript">
        function verificarSelecaoGrupoAvalista(tipo) {
            var retorno = false;
            var url = "ListagemNovoAvalista.aspx?";

            retorno = exibirDialogo(url, 900, 380);

            var campoRetorno = document.getElementById('<%= hdnRetorno.ClientID %>');

            if (retorno != undefined) {
                alert(retorno);
                campoRetorno.Value = "OK";
                return true;
            }
            else {
                campoRetorno.value = '';
                return false;
            }
        }

        //William Moreira da Silva - SOL 199759
        function formataCEP(valor)
        {
            if (mascaraInteiro(valor) == false) {
                event.returnValue = false;
            }

            return formataCampo(valor, '00000-000', event);
        }

        function formataCPFCNPJ(valor) {
            if (mascaraInteiro(valor) == false) {
                event.returnValue = false;
            }

            var tipo = document.getElementById('<%= labelCPFCNPJ.ClientID %>').innerText;

            if (tipo == "CNPJ") {
                return formataCampo(valor, '00.000.000/0000-00', event);
            }
            else {
                return formataCampo(valor, '000.000.000-00', event);
            }
        }

        function guardaIndexAba() {
            var indexAtual = document.getElementById('<%= recipienteAbaContratoSecundario.ClientID %>').innerHTML;
            var index = document.getElementById('<%= indiceAba.ClientID %>').innerHTML;

            index = indexAtual;
        }

        <%--function formataMascaraCodeBehind()
        {
            var campo = document.getElementById('<%= CaixaTextoNumeroDocumento.ClientID %>').innerHTML;
            campo = document.getElementById('<%= CaixaTextoNumeroDocumento.ClientID %>').innerHTML;
            campo = document.getElementById('<%= CaixaTextoNumeroDocumento.ClientID %>').innerText;


            if (campo.value != null)
            {
                formataMascara(campo);
            }
        }--%>

        function formataMascara(valor) {
            if (mascaraInteiro(valor) == false) {
                event.returnValue = false;
            }

            var tipo = document.getElementById('<%= LabelNomeDocumento.ClientID %>').innerText;

            if (tipo == "CPF") {
                return formataCampo(valor, '000.000.000-00', event);
            }
            if (tipo == "CNPJ") {
                return formataCampo(valor, '00.000.000/0000-00', event);
            }
            if (tipo == "Matricula Caixa") {
                return formataCampo(valor, '000.000-0', event);
            }
            if (tipo == "Titulo de Eleitor - Zona/Secao") {
                return formataCampo(valor, '000/0000', event);
            }
            if (tipo == "Carteira de Trabalho") {
                return formataCampo(valor, '0000000/00000', event);
            }
            if (tipo == "Cert Militar - Tipo/Numero") {
                return formataCampo(valor, '0000/0000000000000', event);
            }
            if (tipo == "Cert Milit -Serie/CSM/RMDN/Cat") {
                return formataCampo(valor, '00/00/00/0', event);
            }
            if (tipo == "Dt. Instr. Part. Contratual") {
                return formataCampo(valor, '00/00/0000', event);
            }
        }
        //William Moreira da Silva - SOL 199759

        function verificarSelecaoNovoAvalista(tipo) {
            var retorno = false;
            var url = "ListagemPesquisarNovoAvalista.aspx?";

            retorno = exibirDialogo(url, 900, 380);

            var campoRetorno = document.getElementById('<%= hdnRetorno.ClientID %>');

            if (retorno != undefined) {
                alert(retorno);
                campoRetorno.Value = "OK";
                return true;
            }
            else {
                campoRetorno.value = '';
                return false;
            }
        }

        function formatar(src, mask) {
            var i = src.value.length;
            var saida = mask.substring(0, 1);
            var texto = mask.substring(i)
            if (texto.substring(0, 1) != saida) {
                src.value += texto.substring(0, 1);
            }
        }

    </script>

</asp:Content>
<asp:Content ID="contentCabecalho" runat="server" ContentPlaceHolderID="ConteudoCabecalho">
    Avalista
</asp:Content>
<asp:Content ID="contentConteudo" runat="server" ContentPlaceHolderID="ConteudoPrincipal">
    <table class="secoesFormulario" style="margin-left:20px">
        <tr>
            <td style="text-align: left;" class="espacamento">
                <ajaxToolkit:TabContainer ID="recipienteAbaNovoAvalista" runat="server" CssClass="abaPainel">
                    <ajaxToolkit:TabPanel ID="painelAbaGeral" runat="server" HeaderText="Cadastro de Avalista">
                        <ContentTemplate>
                            <table width="100%" border="0" class="espacamento">
                                <tr>
                                    <td colspan="4" class="espacamento">
                                        <glw:BotaoAcao ID="BotaoAcaoInserirNovoAvalista" runat="server" Text="Inserir" urlDaImagem="~/Imagens/imgInserir.png" OnClick="botaoIncluirNovoAvalista_Click" />
                                        <glw:BotaoAcao ID="BotaoAcaoAlterarNovoAvalista" runat="server" Text="Alterar" urlDaImagem="~/Imagens/imgAlterar.png" OnClick="botaoAlterarNovoAvalista_Click" />
                                        <glw:BotaoAcao ID="BotaoAcaoExcluirNovoAvalista" runat="server" Text="Excluir" urlDaImagem="~/Imagens/imgExcluir.png" OnClick="botaoExcluirNovoAvalista_Click" />
                                        <glw:BotaoAcao ID="BotaoAcaoPesquisarNovoAvalista" runat="server" Text="Pesquisar" urlDaImagem="~/Imagens/imgProcurar.png" OnClientClick="verificarSelecaoNovoAvalista();" />
                                        <glw:BotaoAcao ID="BotaoAcaoFisicaJurídica" runat="server" Text="Fisica/Jurídica" OnClick="botaoFisicaJurídica_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="labelCPFCNPJ" runat="server" Text="CPF"></asp:Label>
                                        <br />
                                        <%--<glw:CaixaAlfaNumerica ID="caixaTextoCPF" runat="server" Width="200px" onkeyup="formataInteiro(this,event); formataCPFCNPJ(this);"></glw:CaixaAlfaNumerica>--%>
                                        <glw:CaixaTexto ID="caixaTextoCPF" runat="server" MaxLength="14" Width="200px" onkeyup="formataInteiro(this,event); formataCPFCNPJ(this);"></glw:CaixaTexto>
                                    </td>
                                    <td>
                                        <asp:Label ID="LabelNomeFantasia" runat="server" Text="Nome Fantasia" />
                                        <br />
                                        <glw:CaixaTexto ID="CaixaTextoNomeFantasia" runat="server" Width="280px" MaxLength="60"></glw:CaixaTexto>
                                    </td>
                                    <td>Email
                                        <br />
                                        <glw:CaixaTexto ID="CaixaTextoEmail" runat="server" Width="280px" MaxLength="100"></glw:CaixaTexto>
                                    </td>
                                    <td>Home Page
                                        <br />
                                        <glw:CaixaTexto ID="CaixaTextoHomePage" runat="server" Width="280px" MaxLength="250"></glw:CaixaTexto>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="LabelRazaoSocial" runat="server" Text="Razão Social" />
                                        <br />
                                        <glw:CaixaTexto ID="CaixaTextoRazaoSocial" runat="server" Width="510px" MaxLength="60"></glw:CaixaTexto>
                                    </td>
                                    <td colspan="2">
                                        <asp:Label ID="LabelGrupo" runat="server" Text="Grupo" />
                                        <br />
                                        <glw:CaixaTexto ID="CaixaTextoGrupo" runat="server" Width="480px"></glw:CaixaTexto>
                                        <glw:BotaoAcao ID="botaoGrupo" runat="server"
                                            urlDaImagem="~/Imagens/imgProcurar.png" Text="Pesquisar"
                                            OnClientClick="verificarSelecaoGrupoAvalista();" />
                                    </td>
                                </tr>
                            </table>
                            <table style="text-align: left;" cellpadding="0" cellspacing="0" width="100%" border="0">
                                <tr>
                                    <td colspan="1" class="espacamento">
                                        <ajaxToolkit:TabContainer ID="recipienteAbaContratoSecundario" runat="server"
                                            CssClass="abaPainel" ActiveTabIndex="0" Enabled="false">
                                            <ajaxToolkit:TabPanel runat="server" ID="painelAbaDocumento" HeaderText="Contrato">
                                                <HeaderTemplate>
                                                    Documento
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <table class="tableSecao" width="100%" border="0">
                                                        <tr>
                                                            <td style="border-right: 1px dashed #ccc" width="35%">
                                                                <br />Documento<br />
                                                                <asp:DropDownList ID="caixaSelecaoTipoDocumento" runat="server" Width="300px" OnSelectedIndexChanged="caixaSelecaoTipoDocumento_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                                                <asp:ListBox ID="ListBoxTipoDocumentos" runat="server" Visible="false" />
                                                                <br />
                                                                <br />
                                                                <div style="height: 120px; overflow: auto;">
                                                                    <glw:Grid ID="gridDocumento" runat="server" DataKeyNames="idDocumento, numdocumento" AllowSorting="true">
                                                                        <Columns>
                                                                            <glw:CampoLimitado DataField="nome" HeaderText="Documento" />
                                                                            <glw:CampoLimitado DataField="numDocumento" HeaderText="Número" />
                                                                        </Columns>
                                                                    </glw:Grid>
                                                                </div>
                                                            </td>
                                                            <%-- </tr>
                                                    <tr>--%>
                                                            <td width="65%" style="padding-left:20px">
                                                                <div id="divDocumento" runat="server" visible="false">
                                                                    <asp:Label ID="LabelNomeDocumento" runat="server" Text="Documento" />
                                                                    <br />
                                                                    <glw:CaixaTexto ID="CaixaTextoNumeroDocumento" onkeyup="formataInteiro(this,event); formataMascara(this);" onBlur="formataMascara(this);" runat="server" Width="250px" MaxLength="18" />
                                                                    <glw:BotaoAcao ID="BotaoAcaoIncluirDocumento" runat="server"
                                                                        urlDaImagem="~/Imagens/imgAdd.gif" Text="Incluir" OnClick="BotaoAcaoIncluirDocumento_Click" />
                                                                </div>
                                                                <div id="divOrgaoEmissor" runat="server" visible="false">
                                                                    <asp:Label ID="LabelOrgaoEmissor" runat="server" Text="Orgão Emissor" />
                                                                    <br />
                                                                    <glw:CaixaTexto ID="CaixaTextoOrgaoEmissor" runat="server" Width="100px" MaxLength="30" />
                                                                </div>
                                                                <div id="divUnidadeFederacao" runat="server" visible="false">
                                                                    <asp:Label ID="LabelNomeUnidadeFederacao" runat="server" Text="Unidade Federação" />
                                                                    <br />
                                                                    <asp:DropDownList ID="DropDownListUnidadeFederacao" runat="server" Width="50px" AutoPostBack="false">
                                                                    </asp:DropDownList>
                                                                </div>
                                                                <div id="divDataEmissao" runat="server" visible="false">
                                                                    <asp:Label ID="LabelDataEmissao" runat="server" Text="Data da Emissão" />
                                                                    <br />
                                                                    <glw:CaixaData ID="CaixaTextoDataEmissao" runat="server" Width="100px" />
                                                                </div>
                                                                <div id="divDataValidade" runat="server" visible="false">
                                                                    <%-- Data de Validade--%>
                                                                    <asp:Label ID="LabelDataValidade" runat="server" Text="Data de Validade" />
                                                                    <br />
                                                                    <glw:CaixaData ID="CaixaDataDataValidade" runat="server" Width="100px" />
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <%--William Moreira da Silva--%>
                                                        <%--                                                        <tr>
                                                            <td>
                                                                <div style="height: 120px; overflow: auto;">
                                                                    <glw:Grid ID="gridDocumento" runat="server" DataKeyNames="idDocumento, numdocumento" AllowSorting="true">
                                                                        <Columns>
                                                                            <glw:CampoLimitado DataField="nome" HeaderText="Documento" />
                                                                            <glw:CampoLimitado DataField="numDocumento" HeaderText="Número" />
                                                                        </Columns>
                                                                    </glw:Grid>
                                                                </div>
                                                            </td>
                                                        </tr>--%>
                                                        <%--William Moreira da Silva--%>
                                                    </table>
                                                </ContentTemplate>
                                            </ajaxToolkit:TabPanel>
                                            <ajaxToolkit:TabPanel runat="server" ID="painelAbaEndereco" HeaderText="Contrato" Width="900px">
                                                <HeaderTemplate>
                                                    Endereços
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <table cellpadding="0" cellspacing="0" class="tableSecao" width="100%" border="0">
                                                        <tr>
                                                            <td class="espacamento">
                                                                <glw:BotaoAcao ID="BotaoAcaoNovoEndereco" runat="server" Text="Inserir" urlDaImagem="~/Imagens/imgInserir.png" OnClick="botaoIncluirEndereco_Click" />
                                                                <glw:BotaoAcao ID="botaoIncluirEndereco" runat="server" Text="Alterar" urlDaImagem="~/Imagens/imgAlterar.png" OnClick="botaoAlterarEndereco_Click" />
                                                                <glw:BotaoAcao ID="botaoExcluirEndereco" runat="server" Text="Excluir" urlDaImagem="~/Imagens/imgExcluir.png" OnClick="botaoExcluirEndereco_Click" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="espacamento">
                                                                <table cellpadding="0" cellspacing="0" class="tableSecao" width="100%" border="1">
                                                                    <asp:MultiView ID="MultiViewGridEndereco" runat="server" ActiveViewIndex="0">
                                                                        <tr>
                                                                            <td class="espacamento">
                                                                                <asp:View ID="ViewGridEndereco" runat="server">
                                                                                    <td>
                                                                                        <div style="height: 120px; overflow: auto;">
                                                                                            <glw:Grid ID="gridEndereco" runat="server" Width="100%" DataKeyNames="idEndereco" AllowSorting="true">
                                                                                                <Columns>
                                                                                                    <glw:CampoCheckBoxSelecao />
                                                                                                    <glw:CampoLimitado DataField="logradouro" HeaderText="Logradouro" />
                                                                                                    <glw:CampoLimitado DataField="numero" HeaderText="Número" />
                                                                                                    <glw:CampoLimitado DataField="complemento" HeaderText="Complemento" />
                                                                                                    <glw:CampoLimitado DataField="bairro" HeaderText="Bairro" />
                                                                                                    <glw:CampoLimitado DataField="cep" HeaderText="Cep" />
                                                                                                    <glw:CampoEntidadeComplexa DataField="cidade.nome" HeaderText="Cidade" />
                                                                                                    <glw:CampoEntidadeComplexa DataField="uf.nome" HeaderText="Estado" />
                                                                                                    <glw:CampoEntidadeComplexa DataField="pais.nome" HeaderText="Pais" />
                                                                                                    <glw:CampoLimitado DataField="idEndereco" HeaderText="idEndereco" Visible="false" />
                                                                                                    <glw:CampoLimitado DataField="endComercial" HeaderText="endComercial" Visible="false" />
                                                                                                    <glw:CampoLimitado DataField="endCorrespondencia" HeaderText="endCorrespondencia" Visible="false" />
                                                                                                    <glw:CampoLimitado DataField="endEntrega" HeaderText="endEntrega" Visible="false" />
                                                                                                    <glw:CampoLimitado DataField="endResidencial" HeaderText="endResidencial" Visible="false" />
                                                                                                    <glw:CampoLimitado DataField="endCobranca" HeaderText="endCobranca" Visible="false" />
                                                                                                </Columns>
                                                                                            </glw:Grid>
                                                                                        </div>
                                                                                    </td>
                                                                                </asp:View>
                                                                                <asp:View ID="ViewCampoEndereco" runat="server">
                                                                                    <td>
                                                                                        <div style="height: 250px; overflow: auto;">
                                                                                            <table class="tableSecao" width="300px" border="0">
                                                                                                <tr>
                                                                                                    <td class="espacamento" colspan="16"></td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td colspan="3">
                                                                                                        Local                                                                                        
                                                                                                        <asp:DropDownList ID="CaixaTextoLocal" runat="server" Width="160px"></asp:DropDownList>
                                                                                                    </td>
                                                                                                    <td rowspan="5">
                                                                                                        <asp:CheckBoxList ID="chkTiposEndereco" runat="server" RepeatDirection="Vertical">
                                                                                                            <asp:ListItem>Comercial</asp:ListItem>
                                                                                                            <asp:ListItem>Residencial</asp:ListItem>
                                                                                                            <asp:ListItem>Entrega</asp:ListItem>
                                                                                                            <asp:ListItem>Cobrança</asp:ListItem>
                                                                                                            <asp:ListItem>Correspondência</asp:ListItem>
                                                                                                        </asp:CheckBoxList>
                                                                                                    </td>
                                                                                                    <td rowspan="5">
                                                                                                        <glw:BotaoAcao ID="BotaoAcaoOkEndereco" runat="server" Text="OK" urlDaImagem="~/Imagens/imgOK.png" OnClick="BotaoAcaoOkEndereco_Click" />
                                                                                                        <glw:BotaoAcao ID="BtnCancelarEndereco" runat="server" Text="Cancelar" urlDaImagem="~/Imagens/imgCancelar.png" OnClick="BtnCancelarEndereco_Click" />
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td colspan="2">
                                                                                                        Logradouro
                                                                                                        <glw:CaixaTexto ID="CaixaTextoLogradouro" runat="server" Width="485px" MaxLength="200"></glw:CaixaTexto>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        Número
                                                                                                        <glw:CaixaTexto ID="CaixaTextoNumero" runat="server" Width="100px" MaxLength="8"></glw:CaixaTexto>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        Complemento
                                                                                                        <glw:CaixaTexto ID="CaixaTextoComplemento" runat="server" Width="200px" MaxLength="200"></glw:CaixaTexto>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        Bairro
                                                                                                        <glw:CaixaTexto ID="CaixaTextoBairro" runat="server" Width="200px" MaxLength="200"></glw:CaixaTexto>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        CEP
                                                                                                        <glw:CaixaTexto ID="CaixaTextoCep" runat="server" Width="118px" onkeyup="formataInteiro(this,event); formataCEP(this);" MaxLength="9"></glw:CaixaTexto>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td colspan="3">
                                                                                                        Cidade
                                                                                                        <asp:DropDownList ID="DropDownListCidade" AutoPostBack="true" OnSelectedIndexChanged="preencheUFPais_onSelectedIndexChanged" runat="server" Width="514px"></asp:DropDownList>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        Estado
                                                                                                        <asp:DropDownList ID="DropDownListEstado" runat="server" Width="160px"></asp:DropDownList>
                                                                                                    </td>
                                                                                                    <td colspan="2">
                                                                                                        Pais
                                                                                                        <asp:DropDownList ID="DropDownListPais" runat="server" Width="213px"></asp:DropDownList>
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </div>
                                                                                    </td>
                                                                                </asp:View>
                                                                            </td>
                                                                        </tr>
                                                                    </asp:MultiView>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ContentTemplate>
                                            </ajaxToolkit:TabPanel>
                                            <ajaxToolkit:TabPanel runat="server" ID="TabPanel1" HeaderText="Contrato">
                                                <HeaderTemplate>
                                                    Telefones
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <table cellpadding="0" cellspacing="0" class="tableSecao" width="100%" border="0">
                                                        <tr>
                                                            <td class="espacamento">
                                                                <glw:BotaoAcao ID="BotaoAcaoIncluirTelefone" runat="server" Text="Inserir" urlDaImagem="~/Imagens/imgInserir.png" OnClick="botaoIncluirTelefone_Click" />
                                                                <glw:BotaoAcao ID="BotaoAcaoAlterarTelefone" runat="server" Text="Alterar" urlDaImagem="~/Imagens/imgAlterar.png" OnClick="botaoAlterarTelefone_Click" />
                                                                <glw:BotaoAcao ID="BotaoAcaoExcluirTelefone" runat="server" Text="Excluir" urlDaImagem="~/Imagens/imgExcluir.png" OnClick="botaoExcluirTelefone_Click" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="espacamento">
                                                                <table style="text-align: left;" cellpadding="0" cellspacing="0" width="100%" border="0">
                                                                    <asp:MultiView ID="MultiViewTelefone" runat="server" ActiveViewIndex="0" OnActiveViewChanged="preencheContato_OnActiveViewChanged">
                                                                        <tr>
                                                                            <td class="espacamento">
                                                                                <asp:View ID="ViewGridTelefone" runat="server">
                                                                                    <td>
                                                                                        <div style="height: 120px; overflow: auto;">
                                                                                            <glw:Grid ID="gridTelefone" runat="server" Width="100%" DataKeyNames="idTelefone, idTelContato" AllowSorting="true">
                                                                                                <Columns>
                                                                                                    <glw:CampoCheckBoxSelecao />
                                                                                                    <glw:CampoLimitado DataField="ddd" HeaderText="DDD" />
                                                                                                    <glw:CampoLimitado DataField="ddi" HeaderText="DDI" />
                                                                                                    <glw:CampoLimitado DataField="telComercial" HeaderText="Com" />
                                                                                                    <glw:CampoLimitado DataField="telParticular" HeaderText="Part" />
                                                                                                    <glw:CampoLimitado DataField="telFax" HeaderText="Fax" />
                                                                                                    <glw:CampoLimitado DataField="telCelular" HeaderText="Cel" />
                                                                                                    <glw:CampoLimitado DataField="telRecado" HeaderText="Rec" />
                                                                                                    <glw:CampoLimitado DataField="numero" HeaderText="Número" />
                                                                                                </Columns>
                                                                                            </glw:Grid>
                                                                                        </div>
                                                                                    </td>
                                                                                </asp:View>
                                                                                <asp:View ID="ViewCamposTelefone" runat="server">
                                                                                    <td>
                                                                                        <div style="height: 220px; overflow: auto;">
                                                                                            <table style="text-align: left;" width="80%" border="0">
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        DDI
                                                                                                        <glw:CaixaTexto ID="CaixaTextoDDI" runat="server" Width="30px" onkeyup="formataInteiro(this,event);" MaxLength="2"></glw:CaixaTexto>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        DDD
                                                                                                        <glw:CaixaTexto ID="CaixaTextoDDD" runat="server" Width="30px" onkeyup="formataInteiro(this,event);" MaxLength="2"></glw:CaixaTexto>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        Número
                                                                                                        <glw:CaixaTexto ID="CaixaTextoNumeroFone" runat="server" Width="200px" onkeyup="formataInteiro(this,event);" MaxLength="9"></glw:CaixaTexto>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        Contato
                                                                                                        <asp:DropDownList ID="DropDownListContato" runat="server" Width="200px" AutoPostBack="true"></asp:DropDownList>
                                                                                                    </td>
                                                                                                    <td width="20%">
                                                                                                        <asp:CheckBoxList ID="CheckBoxListTipoTelefone" runat="server" RepeatDirection="Vertical">
                                                                                                            <asp:ListItem>Comercial</asp:ListItem>
                                                                                                            <asp:ListItem>Particular</asp:ListItem>
                                                                                                            <asp:ListItem>Fax</asp:ListItem>
                                                                                                            <asp:ListItem>Celular</asp:ListItem>
                                                                                                            <asp:ListItem>Recado</asp:ListItem>
                                                                                                        </asp:CheckBoxList>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        <glw:BotaoAcao ID="BotaoAcaoOkTelefone" runat="server" Text="OK" urlDaImagem="~/Imagens/imgOK.png" OnClick="BotaoAcaoOkTelefone_Click" />
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        <glw:BotaoAcao ID="BotaoAcaoCancelarTelefone" runat="server" Text="Cancelar" urlDaImagem="~/Imagens/imgCancelar.png" OnClick="BtnCancelarTelefone_Click" />
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </div>
                                                                                    </td>
                                                                                </asp:View>
                                                                            </td>
                                                                        </tr>
                                                                    </asp:MultiView>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ContentTemplate>
                                            </ajaxToolkit:TabPanel>
                                            <ajaxToolkit:TabPanel runat="server" ID="TabPanelContato" HeaderText="Contrato">
                                                <HeaderTemplate>
                                                    Contatos
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <table cellpadding="0" cellspacing="0" class="tableSecao" width="100%" border="0">
                                                        <tr>
                                                            <td class="espacamento">
                                                                <glw:BotaoAcao ID="BotaoAcaoIncluirContato" runat="server" Text="Inserir" urlDaImagem="~/Imagens/imgInserir.png" OnClick="botaoIncluirContato_Click" />
                                                                <glw:BotaoAcao ID="BotaoAcaoAlterarContato" runat="server" Text="Alterar" urlDaImagem="~/Imagens/imgAlterar.png" OnClick="botaoAlterarContato_Click" />
                                                                <glw:BotaoAcao ID="BotaoAcaoExcluirContato" runat="server" Text="Excluir" urlDaImagem="~/Imagens/imgExcluir.png" OnClick="botaoExcluirContato_Click" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="espacamento">
                                                                <table style="text-align: left;" cellpadding="0" cellspacing="0" width="100%" border="0">
                                                                    <asp:MultiView ID="MultiViewContato" runat="server" ActiveViewIndex="0" OnActiveViewChanged="preencheTelefone_OnActiveViewChanged">
                                                                        <tr>
                                                                            <td class="espacamento">
                                                                                <asp:View ID="ViewGridContato" runat="server">
                                                                                    <td>
                                                                                        <div style="height: 120px; overflow: auto;">
                                                                                            <glw:Grid ID="gridContato" runat="server" Width="100%" DataKeyNames="idContato, idTelContato" AllowSorting="true">
                                                                                                <Columns>
                                                                                                    <glw:CampoCheckBoxSelecao />
                                                                                                    <glw:CampoLimitado DataField="nome" HeaderText="Nome" />
                                                                                                    <glw:CampoLimitado DataField="cargo" HeaderText="Cargo" />
                                                                                                    <glw:CampoLimitado DataField="setor" HeaderText="Setor" />
                                                                                                    <glw:CampoLimitado DataField="telefone" HeaderText="Telefone" />
                                                                                                </Columns>
                                                                                            </glw:Grid>
                                                                                        </div>
                                                                                    </td>
                                                                                </asp:View>
                                                                                <asp:View ID="ViewCampoContato" runat="server">
                                                                                    <td>
                                                                                        <div style="height: 220px; overflow: auto;">
                                                                                            <table style="text-align: left;" width="200px" border="0">
                                                                                                <tr>
                                                                                                    <td colspan="2">
                                                                                                        Nome
                                                                                                        <glw:CaixaTexto ID="CaixaTextoNomeContato" runat="server" Width="625px" MaxLength="50"></glw:CaixaTexto>
                                                                                                    </td>
                                                                                                    <td rowspan="2">
                                                                                                        Telefone
                                                                                                        <asp:DropDownList ID="DropDownListTelefone" runat="server" Width="200px" AutoPostBack="true"></asp:DropDownList>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        E-mail
                                                                                                        <glw:CaixaTexto ID="CaixaTextoEmailContato" runat="server" Width="415px" MaxLength="40"></glw:CaixaTexto>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        Nascimento
                                                                                                        <glw:CaixaData ID="CaixaTextoNascimento" runat="server" Width="175px"></glw:CaixaData>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        Cargo
                                                                                                        <glw:CaixaTexto ID="CaixaTextoCargo" runat="server" Width="415px" MaxLength="30"></glw:CaixaTexto>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        Setor
                                                                                                        <glw:CaixaTexto ID="CaixaTextoSetor" runat="server" Width="200px" MaxLength="30"></glw:CaixaTexto>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td colspan="2">
                                                                                                        Observação
                                                                                                        <glw:AreaTexto ID="CaixaTextoObservacao" runat="server" Width="625px" MaxLength="300" />
                                                                                                    </td>
                                                                                                    <td rowspan="3">
                                                                                                        <glw:BotaoAcao ID="BotaoAcaoOkContato" runat="server" Text="OK" urlDaImagem="~/Imagens/imgOK.png" OnClick="BotaoAcaoOkContato_Click" />
                                                                                                        <glw:BotaoAcao ID="BotaoAcaoCancelarContato" runat="server" Text="Cancelar" urlDaImagem="~/Imagens/imgCancelar.png" OnClick="BtnCancelarContato_Click" />
                                                                                                    </td>
                                                                                                </tr>

                                                                                            </table>
                                                                                        </div>
                                                                                    </td>
                                                                                </asp:View>
                                                                            </td>
                                                                        </tr>
                                                                    </asp:MultiView>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>

                                                </ContentTemplate>
                                            </ajaxToolkit:TabPanel>
                                            <ajaxToolkit:TabPanel runat="server" ID="TabPanelAvalista" HeaderText="Contrato">
                                                <HeaderTemplate>
                                                    Avalistas
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <table class="tableSecao" width="200px" border="0">
                                                        <tr>
                                                            <td colspan="2" class="espacamento">
                                                                Origem do Rendimento
                                                                <br />
                                                                <glw:CaixaTexto ID="CaixaTextoOrigemRendimento" runat="server" Width="400px" MaxLength="60"></glw:CaixaTexto>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="espacamento" width="24%">
                                                                Renda Comprovada
                                                                <br />
                                                                <glw:CaixaNumerica ID="CaixaTextoRendaComprovada" runat="server" Width="200px" casasDecimais="2" MaxLength="12"></glw:CaixaNumerica>
                                                            </td>
                                                            <td>
                                                                Margem Consignável
                                                                <br />
                                                                <glw:CaixaNumerica ID="CaixaTextoMargemConsignavel" runat="server" Width="140px" casasDecimais="2" MaxLength="12"></glw:CaixaNumerica>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ContentTemplate>
                                            </ajaxToolkit:TabPanel>
                                        </ajaxToolkit:TabContainer>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                </ajaxToolkit:TabContainer>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="contentRodape" runat="server" ContentPlaceHolderID="ConteudoRodape">
    <table width="100%">
    <tr>
        <td class="espacamento" align="right" colspan="7" style="border-top: dashed 1px rgb(215, 215, 215); padding-top: 7px;">
            <glw:BotaoAcao ID="botaoOK" runat="server" urlDaImagem="~/Imagens/imgOK.png" Text="Ok"
                EnableViewState="False" OnClick="botaoOK_OnClick"></glw:BotaoAcao>
            <glw:BotaoAcao ID="botaoCancelar" runat="server" urlDaImagem="~/Imagens/imgCancelar.png"
                Text="Cancelar" EnableViewState="False" OnClick="botaoCalcelar_OnClick"></glw:BotaoAcao>
            <glw:CampoOculto ID="hdnRetorno" runat="server" />
            <glw:CampoOculto ID="indiceAba" runat="server" />
            <glw:CampoOculto ID="CampoOcultoFisicaJuridica" runat="server" />
            <glw:CampoOculto ID="CampoOcultoEvento" runat="server" />
            <glw:CampoOculto ID="CampoOcultoEventoEndereco" runat="server" />
            <glw:CampoOculto ID="CampoOcultoEventoContato" runat="server" />
            <glw:CampoOculto ID="CampoOcultoEventoTelefone" runat="server" />
            <glw:CampoOculto ID="CampoOcultoIdEndereco" runat="server" />
            <glw:CampoOculto ID="CampoOcultoIdTelefone" runat="server" />
            <glw:CampoOculto ID="CampoOcultoIdContato" runat="server" />
            <glw:CampoOculto ID="CampoOcultoIdPessoa" runat="server" />
            <glw:CampoOculto ID="CampoOcultoIdGrupo" runat="server" />
        </td>
    </tr>
    </table>
</asp:Content>
