<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/DialogoMestre.master" AutoEventWireup="true" CodeBehind="PopupConfirmacao.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.Tratamentos.Individual.PopupConfirmacao" %>

<asp:Content ID="ConteudoAdicionalHead" runat="server" ContentPlaceHolderID="ConteudoAdicionalHead">
    <script type="text/javascript">
        function msgEmBranco() {
            if (document.getElementById('<%= caixaTextoOrigemRecurso.ClientID %>').value == '') {
                alert('É obrigatório informar a origem do recurso.');
            }
        }
    </script>

</asp:Content>
<asp:Content ID="contentCabecalho" runat="server" ContentPlaceHolderID="ConteudoCabecalho">
    <label style="font-weight: bold; color:black">Deseja realizar o tratamento das parcelas?</label>
</asp:Content>
<asp:Content ID="contentConteudo" runat="server" ContentPlaceHolderID="ConteudoPrincipal">
    <table>
        <tr>
            <td>
                <div id="divOrigemRecurso" runat="server">
                    <label>Origem do recurso:</label>
                    <glw:CaixaTexto runat="server" ID="caixaTextoOrigemRecurso" MaxLength="200"></glw:CaixaTexto>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="contentRodape" runat="server" ContentPlaceHolderID="ConteudoRodape">
    <glw:BotaoOk ID="botaoOk" runat="server" OnClientClick="msgEmBranco();" OnClick="botaoOk_Click"></glw:BotaoOk>
    <glw:BotaoCancelar ID="botaoCancelar" runat="server" OnClick="botaoCancelar_Click" acaoPersonalizada="true"></glw:BotaoCancelar>
</asp:Content>
