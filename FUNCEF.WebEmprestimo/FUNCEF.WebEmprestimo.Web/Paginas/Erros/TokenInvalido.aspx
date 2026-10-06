<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/Erro.master" AutoEventWireup="true"
    CodeBehind="TokenInvalido.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.Erros.TokenInvalido" %>

<asp:Content ID="Content2" ContentPlaceHolderID="EspacoTituloPagina" runat="server">
    <glw:TituloPagina titulo="Requisição inválida" runat="server" />
</asp:Content>
<asp:Content ContentPlaceHolderID="ConteudoAdicionalHead" runat="server">

    <script language="javascript" type="text/javascript">
        var mensagemErro = 'Sua requisição foi considerada inválida para o sistema.\r\nIsto ocorre porque:\r\n';
        mensagemErro += '- a tecla F5 do navegador foi pressionada após a realização de alguma ação no sistema;\r\n';
        mensagemErro += '- algum botão de ação do sistema foi pressionado várias vezes antes que a transação pudesse ser concluída;\r\n';
        mensagemErro += '- a requisição refere-se a uma transação que expirou.';
    </script>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ConteudoFormulario" runat="server">
    <table cellpadding="0" cellspacing="0" border="0" class="secoesFormulario">
        <glw:SecaoFormulario ID="secaoPrincipal" tituloSecao="Alerta" expandeContraiSecao="false"
            runat="server">
            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr>
                    <td>
                        <div style="width: 100%; text-align: center;">
                            <br />
                            <span class="textoAlerta">Sua requisição foi considerada inválida para o sistema.</span>
                            <br />
                            <br />
                        </div>
                        <br />
                        <span class="textoAlerta">Isto ocorre porque: </span>
                        <br />
                        <ul style="text-align: left;" class="textoAlerta">
                            <li>a tecla F5 do navegador foi pressionada após a realização de alguma ação no sistema;</li>
                            <li>algum botão de ação do sistema foi pressionado várias vezes antes que a transação
                                pudesse ser concluída;</li>
                            <li>a requisição refere-se a uma transação que expirou.</li>
                        </ul>
                    </td>
                </tr>
            </table>
        </glw:SecaoFormulario>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ConteudoBotoesAcao" runat="server">
    <glw:BotaoVoltar ID="botaoVoltar" runat="server" urlVoltar="~/Paginas/Home/Default.aspx"></glw:BotaoVoltar>
</asp:Content>
