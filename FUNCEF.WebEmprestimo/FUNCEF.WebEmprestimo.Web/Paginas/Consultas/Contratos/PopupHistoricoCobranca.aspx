<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/DialogoMestre.master" AutoEventWireup="true"
    CodeBehind="PopupHistoricoCobranca.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.Consultas.Contratos.PopupHistoricoCobranca" %>

<asp:Content ID="conteudoAdicionalHead" runat="server" ContentPlaceHolderID="ConteudoAdicionalHead">

    <script type="text/javascript" language="javascript">

        function fechar() {
            window.close();
        }

    </script>

</asp:Content>
<asp:Content ID="contentCabecalho" runat="server" ContentPlaceHolderID="ConteudoCabecalho">
    Evento de Cobrança
</asp:Content>
<asp:Content ID="contentConteudo" runat="server" ContentPlaceHolderID="ConteudoPrincipal">
    <div style="padding:20px">
        <table cellpadding="0" cellspacing="0" border="0" width="100%">
            <tr>
                <td align="left" style="padding-right:0px">
                    Observação:
                    <br />
                    <asp:TextBox ID="caixaTextoObservacaoCobranca" Width="650px" Height="80px" runat="server" TextMode="MultiLine" roRows="5" ReadOnly="true"></asp:TextBox>
                    <%--William Moreira da Silva--%>
                    <asp:HiddenField ID="hdnObservacao" runat="server" />

                </td>
            </tr>
            <tr style="height: 10px">
                <td style="padding-right:0px"></td>
            </tr>
            <tr>
                <td style="border: solid 1px #ccc; padding-right:0px">
                    <div style="width: 650px; overflow: auto; height: 250px;">
                        <glw:Grid ID="gridPrestacoesCobranca" runat="server" Width="100%">
                            <Columns>
                                <glw:CampoEntidadeComplexa HeaderText="Nº Prestação" DataField="parcelaCompleta" />
                                <glw:CampoEntidadeComplexa HeaderText="Item" DataField="item.descricao" />
                                <glw:CampoEntidadeComplexa HeaderText="Data Prev. Prest" DataField="dataPrevista" DataFormatString="{0:dd/MM/yyyy}" />
                                <glw:CampoEntidadeComplexa HeaderText="Vlr.Prestação" DataField="valorPrevisto" />
                                <glw:CampoEntidadeComplexa HeaderText="Vlr.Efetivo" DataField="valorEfetivo" />
                                <glw:CampoEntidadeComplexa HeaderText="Data Efetiva" DataField="dataEfetiva" DataFormatString="{0:dd/MM/yyyy}" />
                                <glw:CampoEntidadeComplexa HeaderText="Vencimento" DataField="dataVencimento" DataFormatString="{0:dd/MM/yyyy}" />
                            </Columns>
                        </glw:Grid>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content ID="contentRodape" runat="server" ContentPlaceHolderID="ConteudoRodape">
    <table cellpadding="1" cellspacing="1" border="0" width="100%">
        <tr>
            <td align="right">
                <glw:BotaoVoltar ID="botaoVoltar" runat="server" OnClientClick="javascript:fechar();" acaoPersonalizada="true"></glw:BotaoVoltar>
            </td>
        </tr>
    </table>
</asp:Content>
