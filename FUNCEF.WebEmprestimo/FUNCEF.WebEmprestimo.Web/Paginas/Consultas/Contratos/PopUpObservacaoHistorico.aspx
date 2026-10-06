<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/DialogoMestre.master" AutoEventWireup="true"
    CodeBehind="PopUpObservacaoHistorico.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.Consultas.Contratos.PopUpObservacaoHistorico" %>

<asp:Content ID="conteudoAdicionalHead" runat="server" ContentPlaceHolderID="ConteudoAdicionalHead">
    <script type="text/javascript" language="javascript">
        function fecharJanela(){
            window.returnValue = document.getElementById('<%= caixaTextoObservacao.ClientID %>').value;
            window.close();
        }
    </script>
</asp:Content>
<asp:Content ID="contentCabecalho" runat="server" ContentPlaceHolderID="ConteudoCabecalho">
    Observação
</asp:Content>
<asp:Content ID="contentConteudo" runat="server" ContentPlaceHolderID="ConteudoPrincipal">
    <table cellpadding="0" cellspacing="0" border="0" class="secoesFormulario">
        <tr style="padding-bottom: 10px;">
            <td style="text-align: left;">
                <asp:TextBox ID="caixaTextoObservacao" runat="server" TextMode="MultiLine" Rows="5" Width="400px" MaxLength="2000"></asp:TextBox>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="contentRodape" runat="server" ContentPlaceHolderID="ConteudoRodape">
    <table cellpadding="1" cellspacing="1" border="0" width="100%">
        <tr>
            <td align="center">
                <glw:BotaoAlterar ID="botaoAlterar" runat="server" permissoesExigidas="alterar" OnClick="botaoAlterar_Click"
                    comportamentoAlteracao="implementacaoAlteracao"></glw:BotaoAlterar>
                <glw:BotaoCancelar ID="botaoCancelar" runat="server" OnClientClick="javascript:fechar()" acaoPersonalizada="true"></glw:BotaoCancelar>    
            </td>
        </tr>
    </table>
</asp:Content>
