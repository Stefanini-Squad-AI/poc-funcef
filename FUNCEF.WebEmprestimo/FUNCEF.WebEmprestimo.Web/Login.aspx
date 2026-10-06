<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>
        <glw:TituloNavegador runat="server" />
    </title>
    <link rel="Stylesheet" type="text/css" href="CssDinamico/EstilosDinamicos.aspx" />

    <script language="javascript" type="text/javascript">
        try {        
            var loginUrl = '<%= System.Web.Security.FormsAuthentication.LoginUrl %>';
            
            if(window.dialogArguments != undefined) {
                var argumentosExpiracao = new Object();
                argumentosExpiracao.expirou = true;
                argumentosExpiracao.urlLogin = loginUrl;
                
                window.returnValue = argumentosExpiracao;
                window.close();            
            }
            else {
                var tratado = false;
                
                try {
                    if(window.opener) {
                        try {
                            if(window.opener.opener) {
                                window.opener.location.href = loginUrl;
                                self.close();
                            }
                        }
                        catch(e) {
                        }
                    }
                }
                catch(e) {
                }
            }
        }
        catch(e) {}
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <table border="0" align="center" style="vertical-align: middle">
        <tr>
            <td height="150" width="300px">
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td height="110">
                <glw:ImagemConfiguravel runat="server" tagImagem="logoLogin"/>
            </td>
            <td align="center" valign="middle">
                <table>
                    <tr>
                        <td align="left" height="125" valign="bottom">
                            <glw:ImagemConfiguravel runat="server" tagImagem="planusLogin" Width="192" Height="108" />
                        </td>
                    </tr>
                    <tr>
                        <td valign="bottom">
                            <glw:Login TitleText="" TextLayout="TextOnLeft" runat="server" DisplayRememberMe="false"
                                CssClass="login" DestinationPageUrl="~/Paginas/Home/Default.aspx" FailureAction="Refresh"
                                FailureText="Acesso negado." ID="loginControl">
                                <LayoutTemplate>
                                    <asp:Panel ID="pnlLogin" runat="server" DefaultButton="btnOk">
                                        <table border="0" cellpadding="1" cellspacing="0" style="border-collapse: collapse;">
                                            <tr>
                                                <td>
                                                    <table border="0" cellpadding="0">
                                                        <tr valign="top">
                                                            <td align="center" height="30" valign="middle" width="100">
                                                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">
                                                                <p class="camposTelaInicial" style="font-weight: bold;">
                                                                    Usu&aacute;rio:
                                                                </p>
                                                                </asp:Label>
                                                            </td>
                                                            <td valign="middle">
                                                                <glw:CaixaTexto ID="UserName" runat="server" Width="180px" MaxLength="50" CssClass="caixaTextoLogin"></glw:CaixaTexto>
                                                                <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ControlToValidate="UserName"
                                                                    ErrorMessage="O campo usuário é obrigatório." SetFocusOnError="true" ValidationGroup="ValidLogin">
                                                                &nbsp;
                                                                </asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center" valign="middle">
                                                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">
                                                                <p class="camposTelaInicial" style="font-weight: bold;">
                                                                    Senha:
                                                                </p>
                                                                </asp:Label>
                                                            </td>
                                                            <td valign="middle">
                                                                <glw:CaixaTexto ID="Password" runat="server" TextMode="Password" Width="180px"
                                                                    MaxLength="50" CssClass="caixaTextoLogin"></glw:CaixaTexto>
                                                                <asp:RequiredFieldValidator ID="rfvSenha" runat="server" ControlToValidate="Password"
                                                                    ErrorMessage="O campo senha é obrigatório." SetFocusOnError="true" ValidationGroup="ValidLogin">
                                                                &nbsp;
                                                                </asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    <span class="mensagemErro">&nbsp;&nbsp;<asp:Literal ID="FailureText" runat="server" />
                                                    </span>
                                                </td>
                                            </tr>
                                        </table>
                                        <table border="0" cellpadding="0" align="center">
                                            <tr>
                                                <td width="110">
                                                    &nbsp;
                                                </td>
                                                <td align="left" valign="middle" width="50">
                                                    <glw:BotaoOk ID="btnOk" runat="server" ValidationGroup="ValidLogin" CommandName="Login"
                                                        efetuaAcaoSalvar="false" />
                                                </td>
                                                <td align="left" valign="middle" width="60">
                                                    <glw:BotaoSair runat="server" comportamentoSair="fecharJanela" />
                                                </td>
                                            </tr>
                                        </table>
                                        <glw:SumarioValidacao ID="sumario" ValidationGroup="ValidLogin" runat="server" />
                                    </asp:Panel>
                                </LayoutTemplate>
                            </glw:Login>
                        </td>
                    </tr>
                    <tr>
                        <td style="color: mediumvioletred; padding-top:20px; font-weight:bold" class="blink_me">
                            Atenção: utilize apenas o Google Chrome, Mozilla Firefox ou Microsoft Edge
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
