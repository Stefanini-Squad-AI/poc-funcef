<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/DialogoMestre.master" AutoEventWireup="true"
    CodeBehind="PopupChaveMestre.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.Consultas.Contratos.PopupChaveMestre" %>

<asp:Content ID="ConteudoAdicionalHead" runat="server" ContentPlaceHolderID="ConteudoAdicionalHead">
</asp:Content>
<asp:Content ID="contentCabecalho" runat="server" ContentPlaceHolderID="ConteudoCabecalho">
    Chave Mestre
</asp:Content>
<asp:Content ID="contentConteudo" runat="server" ContentPlaceHolderID="ConteudoPrincipal">
    <table style="padding-left:20px">
        <tr>
            <td class="espacamento">
                Alterar situação do contrato para:
                <br />
                <asp:DropDownList ID="ListaDropDownSituacaoContrato" runat="server" Width="200px">
                    <asp:ListItem Value="A">Ativo</asp:ListItem>
                    <asp:ListItem Value="C">Cancelado</asp:ListItem>
                    <asp:ListItem Value="J">Em Cobrança Jurídica</asp:ListItem>
                    <asp:ListItem Value="K">Em Quitação</asp:ListItem>
                    <asp:ListItem Value="E">Encerrado</asp:ListItem>
                    <asp:ListItem Value="Q">Quitado</asp:ListItem>
                    <asp:ListItem Value="R">Renovado</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <glw:BotaoAcao ID="BotaoAlterarSituacao" Text="Alterar" runat="server" urlDaImagem="~/Imagens/imgAlterar.png" OnClick="BotaoAlterarSituacao_Click"></glw:BotaoAcao>
            </td>
            <td>
                <glw:BotaoCancelar ID="botaoCancelar" runat="server" OnClientClick="javascript:fechar()" acaoPersonalizada="true"></glw:BotaoCancelar>
            </td>
        </tr>
        <tr>
            <td style="border-top: 1px dashed #ccc; padding-top:10px">
                <glw:BotaoAcao ID="BotaoIncluir" runat="server" Text="Novo item de histórico" tagImagem="botaoIncluir" OnClick="BotaoIncluir_Click"></glw:BotaoAcao>
            </td>
            <td>
                <glw:BotaoAcao ID="BotaoAlterarHistorico" Text="Alterar" runat="server" urlDaImagem="~/Imagens/imgAlterar.png"></glw:BotaoAcao>
            </td>
            <td>
                <glw:BotaoAcao ID="BotaoExcluir" Text="Excluir" runat="server" urlDaImagem="~/Imagens/imgExcluir.png" OnClick="BotaoExcluir_Click"></glw:BotaoAcao>
            </td>
            
        </tr>
    </table>
</asp:Content>
<asp:Content ID="contentRodape" runat="server" ContentPlaceHolderID="ConteudoRodape">
</asp:Content>
