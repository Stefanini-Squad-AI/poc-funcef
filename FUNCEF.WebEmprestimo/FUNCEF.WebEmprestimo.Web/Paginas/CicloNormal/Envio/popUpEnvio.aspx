<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/DialogoMestre.master" AutoEventWireup="true" CodeBehind="popUpEnvio.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.CicloNormal.Envio.popUpEnvio" %>

<asp:Content ID="ConteudoAdicionalHead" runat="server" ContentPlaceHolderID="ConteudoAdicionalHead">
    <style type="text/css">
        .panelContrato {
            border-style: solid;
            border-bottom-width: 1px;
            border-top-width: 2px;
            border-right-width: 1px;
            border-left-width: 1px;
            background-color: #ffffff;
            border-color: #808080;
            width: 300px;
        }

        .panel {
            text-align: left;
            height: 125px;
            padding: 10px;
            line-height: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="contentCabecalho" runat="server" ContentPlaceHolderID="ConteudoCabecalho">
    Envio de débitos
</asp:Content>
<asp:Content ID="contentConteudo" runat="server" ContentPlaceHolderID="ConteudoPrincipal">
    <table>
        <tr>
            <td>
                <div class="panelContrato panel ">
                    Contrato:
                    <asp:Label runat="server" ID="lblContrato"></asp:Label><br />
                    Data de vencimento:
                    <asp:Label runat="server" ID="lblDataVencimento"></asp:Label><br />
                    Planos:
                    <asp:Label runat="server" ID="lblPlanos"></asp:Label><br />
                    Patrocinadoras:
                    <asp:Label runat="server" ID="lblPatrocinadoras"></asp:Label><br />
                </div>
            </td>
            <td>
                <div class="panel">
                    Enviado para:
                    <br />
                    <asp:CheckBox runat="server" ID="chkFinancAReceber" Text="Financeiro a receber" Enabled="false" /><br />
                    <asp:CheckBox runat="server" ID="chkFolhaPatro" Text="Folha da Patrocinadora" Enabled="false" /><br />
                    <asp:CheckBox runat="server" ID="chkFolhaBenef" Text="Folha de benefícios" Enabled="false" /><br />
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div style="text-align: left; height: 125px; padding-top:15px; line-height: 40px;">
                    Executado por:
                    <asp:Label runat="server" ID="lblExecutadoPor"></asp:Label><br />
                    Iniciado em:
                    <asp:Label runat="server" ID="lblIniciadoEm"></asp:Label><br />
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="contentRodape" runat="server" ContentPlaceHolderID="ConteudoRodape">
</asp:Content>

