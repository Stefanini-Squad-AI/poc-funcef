<%@ Page Language="C#"  MasterPageFile="~/Paginas/Mestre/DialogoMestre.master" AutoEventWireup="true" CodeBehind="PopupMotivoAbono.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.Tratamentos.Individual.PopupMotivoAbono" %>

<asp:content id="ConteudoAdicionalHead" runat="server" contentplaceholderid="ConteudoAdicionalHead">
    <script type="text/javascript">
        function msgEmBranco()
        {
            if(document.getElementById('<%= caixaTextoMotivo.ClientID %>').value == '')
            {
                alert('É obrigatório informar o motivo do abono.');
            }
        }
    </script>

</asp:content>
<asp:content id="contentCabecalho" runat="server" contentplaceholderid="ConteudoCabecalho">
    Motivo Abono
</asp:content>
<asp:content id="contentConteudo" runat="server" contentplaceholderid="ConteudoPrincipal">
    <table>
        <tr>
            <td>
                <div id="divMotivoAbono" runat="server">
                Digite o Motivo do Abono<br />
                    <glw:CaixaTexto runat="server" id="caixaTextoMotivo" MaxLength="200"></glw:CaixaTexto>
                </div>
           </td>
        </tr>
    </table>
</asp:content>
<asp:content id="contentRodape" runat="server" contentplaceholderid="ConteudoRodape">
    <glw:BotaoOk ID="botaoOk" runat="server" onClientClick="msgEmBranco();" OnClick="botaoOk_Click"></glw:BotaoOk>
    &nbsp; &nbsp;
    <glw:BotaoVoltar ID="botaoVoltar" runat="server" OnClick="botaoVoltar_Click"
        acaoPersonalizada="true"></glw:BotaoVoltar>
</asp:content>
