<%@ Page Title="" Language="C#" MasterPageFile="~/Paginas/Mestre/FormularioMestre.master" AutoEventWireup="true" CodeBehind="Edicao.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.Tratamentos.Assinatura.Edicao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ConteudoAdicionalHeadFormulario" runat="server">
    <script type="text/javascript">
        function tratarMaxLength(evt, sender, maxLength) {
            var _value = sender.value.replace(/\n/g, "\r\n");

            if (_value.length >= maxLength) {
                sender.value = _value.substr(0, maxLength);
            }
            else if (evt) {
                var key = window.event ? evt.keyCode : evt.which;

                if ((key < 48 || key > 57) && _value.length > maxLength)
                    return false;
                else
                    return true;
            }

            return false;
        }

        function exibirLoading() {
            var div = document.getElementById('divLoading');
            var tr = document.getElementById('trLoading');
            var img = '<%= ResolveUrl("~/Imagens/aguarde.gif") %>';

            tr.style.display = '';
            div.style.display = '';
            div.innerHTML = '<img src=\"' + img + '\" style=\"border: 0; width: 16px; height: 16px;\" />&nbsp;Carregando...';

            setTimeout(function () {
                div.innerHTML = '<img src=\"' + img + '\" style=\"border: 0; width: 16px; height: 16px;\" />&nbsp;Carregando...';
            }, 10);
        }

        function somenteTexto(sender) {
            $(sender).val($("<span />").append($(sender).val()).text());
        }

        function validaCampo(sender) {
            if (sender.value.replace(/[^0-9]/g, '') != sender.originalvalue.replace(/[^0-9]/g, '')) {
                sender.value = sender.value.replace(/[^0-9./]/g, '');
                exibirLoading();
                sender.onchange();
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="EspacoTituloPagina" runat="server">
    <glw:TituloPagina ID="aba1" titulo="Assinatura de Contrato Padrão" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ConteudoFormulario" runat="server">
    <asp:HiddenField ID="hdnIdPessoa" runat="server" />
    <asp:HiddenField ID="hdnIdBeneficiario" runat="server" />
    <asp:HiddenField ID="hdnDtTrgInclusao" runat="server" />
    <asp:HiddenField ID="hdnMatricula" runat="server" />
    <table cellpadding="0" cellspacing="0" class="tableSecao" style="border-right: none;">
        <tbody>
            <tr>
                <td class="espacamento" style="width: 13%;">
                    Mutuário:
                </td>
                <td>
                    <asp:Label ID="labelMutuario" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="espacamento" style="width: 13%;">
                    Situação:
                </td>
                <td>
                    <asp:Label ID="labelSituacaoParticipante" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="espacamento" style="width: 13%;">
                    Plano:
                </td>
                <td>
                    <asp:Label ID="labelPlanoPrevidenciario" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="espacamento" style="width: 13%;">
                    Patrocinadora:
                </td>
                <td>
                    <asp:Label ID="labelPatrocinadora" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                </td>
            </tr>
        </tbody>
    </table>
    <table cellpadding="0" cellspacing="0" width="80%">
        <tbody>
            <tr>
                <td style="padding: 10px;">
                    Contrato Padrão:
                    <asp:RequiredFieldValidator ID="rfvContratoPadrao" runat="server" Text="*" Display="Static" ControlToValidate="campoContratoPadrao" ErrorMessage="Por favor, selecione o contrato padrão."></asp:RequiredFieldValidator>                                                           
                </td>
                <td colspan="2" style="width: 300px">
                    <asp:DropDownList ID="campoContratoPadrao" runat="server" Width="100%" DataSourceID="dataSourceContratos" DataTextField="Descricao" DataValueField="IdContratoPadrao" AppendDataBoundItems="true">
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="dataSourceContratos" runat="server" SelectMethod="consultarContratos" TypeName="FUNCEF.Planus.WebEmprestimo.Web.Proxies.ProxyAssinatura">
                    </asp:ObjectDataSource>
                </td>
                <td style="padding: 10px;">Data Assinatura:
                    <asp:RequiredFieldValidator ID="rfvDataAssinatura" runat="server" Text="*" Display="Static" ControlToValidate="campoDataAssinatura" ErrorMessage="Por favor, informe a data de assinatura."></asp:RequiredFieldValidator>
                </td>
                <td>
                    <glw:CaixaData ID="campoDataAssinatura" runat="server" Width="100px"></glw:CaixaData>
                </td>
            </tr>
            <tr>
                <td style="padding: 10px;vertical-align: top;">Observação:</td>
                <td colspan="4">
                    <asp:TextBox ID="campoObservacao" runat="server" TextMode="MultiLine" Width="99%" Height="80px" onkeypress="return tratarMaxLength(event, this, 1000);" onchange="tratarMaxLength(null, this, 1000);" onblur="somenteTexto(this)"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="padding: 10px;">NUP:
                    <asp:CustomValidator ID="cvdNumeroProtocolo" runat="server" ControlToValidate="campoNUP" Display="Dynamic" Text="*" ErrorMessage="O NUP informado já está associado a uma assinatura de contrato de outro participante." OnServerValidate="cvdNumeroProtocolo_ServerValidate"></asp:CustomValidator>
                    <asp:CustomValidator ID="cvdDocumentoNUP" runat="server" ControlToValidate="campoNUP" Display="Dynamic" Text="*" ErrorMessage="Não existe documento eletrônico vinculado ao NUP informado." OnServerValidate="cvdDocumentoNUP_ServerValidate"></asp:CustomValidator>
                </td>
                <td style="width: 150px">
                    <asp:TextBox ID="campoNUP" runat="server" MaxLength="20" Width="100%" AutoPostBack="true" OnFocus="this.originalvalue=this.value" OnBlur="validaCampo(this);" OnTextChanged="campoNUP_TextChanged" onkeyup="javascript:mask(this.id, '00000.000000/0000', event);"></asp:TextBox>
                </td>
                <td style="width: 150px; padding: 10px; text-align: right;">Número do selo:
                </td>
                <td colspan="2">
                    <asp:TextBox ID="campoComprovante" runat="server" MaxLength="40" Width="97%" ReadOnly="true"></asp:TextBox>
                </td>
            </tr>
            <tr id="trLoading" style="display: none;">
                <td>

                </td>
                <td colspan="4">
                    <div id="divLoading" style="display: none; font-weight: bold; color: red;"></div>
                </td>
            </tr>
            <tr>
                <td></td>
                <td colspan="4">
                    <asp:HyperLink ID="hplVisualizarArquivo" runat="server" CssClass="botaoAcao" NavigateUrl="#" Target="_blank" Visible="false">
                        <img src="<%= ResolveUrl("~/Imagens/imgPdf.png") %>" alt="" style="border: 0;" />&nbsp;
                        Visualizar arquivo
                    </asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td colspan="5">
                    <asp:ValidationSummary ID="vdsSumario"  runat="server" DisplayMode="BulletList" />
                </td>
            </tr>
        </tbody>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ConteudoBotoesAcao" runat="server">
    <glw:BotaoSalvar ID="botaoSalvar" runat="server" CausesValidation="true" OnClick="botaoSalvar_Click"></glw:BotaoSalvar>
    <glw:BotaoExcluir ID="botaoExcluir" runat="server" CausesValidation="false" permissoesExigidas="excluir" mensagemConfirmacao="Tem certeza que deseja excluir a assinatura de contrato padrão?" exibirMensagemConfirmacao="false" OnClick="botaoExcluir_Click"></glw:BotaoExcluir>
    <glw:BotaoVoltar ID="botaoVoltar" runat="server" CausesValidation="false" urlVoltar="~/Paginas/Tratamentos/Assinatura/Listagem.aspx"></glw:BotaoVoltar>
    <glw:BotaoSair ID="botaoSair" CausesValidation="false" comportamentoSair="irParaTelaInicial" runat="server" />
</asp:Content>
