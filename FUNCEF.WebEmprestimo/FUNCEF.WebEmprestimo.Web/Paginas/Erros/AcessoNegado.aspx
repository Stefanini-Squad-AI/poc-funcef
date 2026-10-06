<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/Erro.master" AutoEventWireup="true"
    CodeBehind="AcessoNegado.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.Erros.AcessoNegado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ConteudoAdicionalHead" runat="server">
    <script language="javascript" type="text/javascript">
        var mensagemErro = 'Você não possui acesso a esta funcionalidade.';
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="EspacoTituloPagina" runat="server">
    <glw:TituloPagina titulo="Acesso negado" runat="server" />
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
                            <br />
                            <span class="textoAlerta">Voc&ecirc; n&atilde;o possui acesso a esta funcionalidade.
                            </span>
                            <br />
                            <br />
                            <br />
                        </div>
                    </td>
                </tr>
            </table>
        </glw:SecaoFormulario>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ConteudoBotoesAcao" runat="server">
    <glw:BotaoVoltar ID="botaoVoltar" runat="server" acaoPersonalizada="true" OnClientClick="javascript:history.back(2);return false;"></glw:BotaoVoltar>
</asp:Content>
