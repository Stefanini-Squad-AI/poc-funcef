<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/DialogoMestre.master" AutoEventWireup="true"
    CodeBehind="PopupInputRegra.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.CicloNormal.Emprestimo.PopupInputRegra" %>

<asp:Content ID="ConteudoAdicionalHead" runat="server" ContentPlaceHolderID="ConteudoAdicionalHead">

    <script type="text/javascript" language="javascript">        
    </script>

    <style type="text/css">
        .style1 {
            width: 397px;
        }
    </style>
</asp:Content>
<%--William Moreira da Silva - SOL 235732--%>
<%--<asp:Content ID="contentCabecalho" runat="server" ContentPlaceHolderID="ConteudoCabecalho">
    Input Regra
</asp:Content>--%>
<%--William Moreira da Silva - SOL 235732--%>
<asp:Content ID="contentConteudo" runat="server" ContentPlaceHolderID="ConteudoPrincipal">
    <table>
        <tr>
            <td>
                <%--William Moreira da Silva - SOL 235732--%>
                <div id="divValorDivida" runat="server" visible="false">
                    <%--<td>--%>
                    <glw:CaixaNumerica ID="caixaNumericaValorDivida" runat="server" Width="75px" casasDecimais="2"
                        tipoNumerico="numero" valorMaximo="99999999.99" Enabled="true"></glw:CaixaNumerica>
                    <%--</td>
            <td align="left">--%>
                : Informe o Valor da Dívida de Contribuições Previdenciais.
                </div>
                <%--</td>--%>
            </td>
        </tr>
        <tr>
            <td>
                <div id="divValorAmortizacao" runat="server" visible="false">
                    <glw:CaixaNumerica ID="caixaNumericaValorAmortizacao" runat="server"
                        Width="75px" casasDecimais="2"
                        tipoNumerico="numero" valorMaximo="99999999.99" Enabled="true"></glw:CaixaNumerica>
                    <%--</td>
            <td align="left">--%>: Informe o valor da amortização do financiamento habitacional.
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div id="divValorquitacao" runat="server" visible="false">
                    <glw:CaixaNumerica ID="caixaNumericaValorQuitacao" runat="server" Width="75px" casasDecimais="2"
                        tipoNumerico="numero" valorMaximo="99999999.99" Enabled="true"></glw:CaixaNumerica>
                    <%--</td>
            <td align="left">--%>: Informe o valor da quitação do Financiamento Habitacional:
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="contentRodape" runat="server" ContentPlaceHolderID="ConteudoRodape">
    <glw:BotaoOk ID="botaoOk" runat="server" OnClick="botaoOk_Click"></glw:BotaoOk>
    &nbsp; &nbsp;
    <glw:BotaoVoltar ID="botaoVoltar" runat="server" OnClientClick="javascript:fechar()"
        acaoPersonalizada="true"></glw:BotaoVoltar>
</asp:Content>
