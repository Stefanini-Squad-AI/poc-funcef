<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/DialogoMestre.master"
    AutoEventWireup="true" CodeBehind="PopupImpressaoContrato.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.CicloNormal.Emprestimo.PopupImpressaoContrato" %>



<asp:Content ID="ConteudoAdicionalHead" runat="server" ContentPlaceHolderID="ConteudoAdicionalHead">
    <style type="text/css">
        .tabelas {
            text-align: left;
            vertical-align: middle;
            padding: 10px;
            width: 100%;
        }

        .tabelas td {
            padding: 5px;
        }

        .tabelaPrincipal {
            padding: 50px;
        }

        .linhasRodape {
            border-bottom: 1px solid gray;
        }
    </style>

    <script language="javascript" type="text/javascript">
        $(function () {
            $('[placeholder]').focus(function (e) {
                var elemento = $(e.target);
                if (elemento.val() == elemento.attr('placeholder'))
                { elemento.val(''); }
                elemento.css({ 'color': 'black' });
            }).blur(function (e) {
                var elemento = $(e.target);
                if (elemento.val() == '' || elemento.val() == elemento.attr('placeholder')) {
                    elemento.val(elemento.attr('placeholder'));
                    elemento.css({ 'color': 'gray' });
                }
            }).trigger('blur');
        });

        window.onload = function () {
            formataTEL(document.getElementById('<%= CaixaTelCel.ClientID %>'));
            formataTEL(document.getElementById('<%= CaixaTelComercial.ClientID %>'));
            formataTEL(document.getElementById('<%= CaixaTelResid.ClientID %>'));
            formataCEP(document.getElementById('<%= CaixaCEP.ClientID %>'));
        }

        function formataTEL(valor) {
            if (mascaraInteiro(valor) == false) {
                event.returnValue = false;
            }
            if (valor.value != "(  )") {
                return formataCampo(valor, '(00) 000000000', event);
            }
        }

        function formataCEP(valor) {
            if (mascaraInteiro(valor) == false) {
                event.returnValue = false;
            }
            if (valor.value != "") {
                return formataCampo(valor, '00000-000', event);
            }
        }

        function remove(str, sub) {
            i = str.indexOf(sub);
            r = "";
            if (i == -1) return str;
            {
                r += str.substring(0, i) + remove(str.substring(i + sub.length), sub);
            }

            return r;
        }

        function mascara(o, f) {
            v_obj = o
            v_fun = f
            setTimeout("execmascara()", 1)
        }

        function execmascara() {
            v_obj.value = v_fun(v_obj.value)
        }

        function cpf_mask(v) {
            v = v.replace(/\D/g, "")                 //Remove tudo o que não é dígito
            v = v.replace(/(\d{3})(\d)/, "$1.$2")    //Coloca ponto entre o terceiro e o quarto dígitos
            v = v.replace(/(\d{3})(\d)/, "$1.$2")    //Coloca ponto entre o setimo e o oitava dígitos
            v = v.replace(/(\d{3})(\d)/, "$1-$2")    //Coloca ponto entre o decimoprimeiro e o decimosegundo dígitos
            return v
        }

    </script>
</asp:Content>

<asp:Content ID="contentCabecalho" runat="server" ContentPlaceHolderID="ConteudoCabecalho">
    Imprimir Contrato
</asp:Content>

<asp:Content ID="contentConteudo" runat="server" ContentPlaceHolderID="ConteudoPrincipal">
    <%--------------------------------------------------------------------------------%>
    <table style="padding: 10px">
        <tr>
            <td>
                <table class="tabelas linhasRodape">
                    <tr>
                        <td><b>Preencha e confirme os dados do mutuário:</b></td>
                    </tr>
                    <tr>
                        <td>Identidade:&nbsp;<glw:CaixaTexto ID="caixaIdentidade" runat="server" Width="200px" MaxLength="60"></glw:CaixaTexto>
                        </td>
                        <td></td>
                    </tr>
                </table>
            </td>
        </tr>
        <%--------------------------------------------------------------------------------%>
        <tr>
            <td>
                <table class="tabelas linhasRodape">
                    <tr style="padding-bottom: 10px;">
                        <td style="vertical-align: top;">Logradouro:&nbsp;
                        </td>
                        <td>
                            <glw:CaixaTexto ID="CaixaLogradouro" runat="server" Width="300px" MaxLength="60"></glw:CaixaTexto>
                        </td>
                        <td style="vertical-align: top;">Número:&nbsp;
                        </td>
                        <td>
                            <glw:CaixaTexto ID="CaixaNumero" runat="server" Width="50px" MaxLength="8" ></glw:CaixaTexto>
                            <%--William Moreire da Silva - SOL 257695 PPM 964306--%>
                        </td>
                    </tr>
                    <tr style="padding-bottom: 10px;">
                        <td style="vertical-align: top;">Complemento:&nbsp;
                        </td>
                        <td>
                            <glw:CaixaTexto ID="CaixaComplemento" runat="server" Width="150px" MaxLength="60"></glw:CaixaTexto>
                        </td>
                        <td style="vertical-align: top;">Bairro:&nbsp;
                        </td>
                        <td>
                            <glw:CaixaTexto ID="CaixaBairro" runat="server" Width="200px" MaxLength="60"></glw:CaixaTexto>
                        </td>
                    </tr>
                    <tr style="padding-bottom: 10px;">
                        <td style="vertical-align: top;">Cidade:&nbsp;
                        </td>
                        <td>
                            <glw:CaixaTexto ID="CaixaCidade" runat="server" Width="200px" MaxLength="60"></glw:CaixaTexto>
                        </td>
                        <td style="vertical-align: top;">UF:&nbsp;
                        </td>
                        <td>
                            <asp:DropDownList runat="server" ID="comboUF"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr style="padding-bottom: 10px;">
                        <td style="vertical-align: top;">CEP:&nbsp;
                        </td>
                        <td>
                            <glw:CaixaTexto ID="CaixaCEP" runat="server" Width="120px" onkeyup="formataInteiro(this,event); formataCEP(this);" MaxLength="9"></glw:CaixaTexto>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%--------------------------------------------------------------------------------%>
        <tr>
            <td>
                <table class="tabelas linhasRodape">
                    <tr style="padding-bottom: 10px;">
                        <td style="vertical-align: top;">Telefone celular:&nbsp;
                        </td>
                        <td>
                            <glw:CaixaTexto ID="CaixaTelCel" placeholder="(  )" runat="server" Width="150px" onkeyup="formataInteiro(this,event); formataTEL(this);" MaxLength="14"></glw:CaixaTexto>
                        </td>
                        <td style="vertical-align: top;">E-mail pessoal:&nbsp;
                        </td>
                        <td>
                            <glw:CaixaTexto ID="CaixaEmailPessoal" runat="server" Width="200px" MaxLength="60"></glw:CaixaTexto>
                        </td>
                    </tr>
                    <tr style="padding-bottom: 10px;">
                        <td style="vertical-align: top;">Telefone comercial:&nbsp;
                        </td>
                        <td>
                            <glw:CaixaTexto ID="CaixaTelComercial" placeholder="(  )" runat="server" Width="150px" onkeyup="formataInteiro(this,event); formataTEL(this);" MaxLength="14"></glw:CaixaTexto>
                        </td>
                        <td style="vertical-align: top;">E-mail comercial:&nbsp;
                        </td>
                        <td>
                            <glw:CaixaTexto ID="CaixaEmailComercial" runat="server" Width="200px" MaxLength="60"></glw:CaixaTexto>
                        </td>
                    </tr>
                    <tr style="padding-bottom: 10px;">
                        <td style="vertical-align: top;">Telefone residencial:&nbsp;
                        </td>
                        <td>
                            <glw:CaixaTexto ID="CaixaTelResid" placeholder="(  )" runat="server" Width="150px" onkeyup="formataInteiro(this,event); formataTEL(this);" MaxLength="14"></glw:CaixaTexto>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%--------------------------------------------------------------------------------%>
        <tr>
            <td>
                <table class="tabelas linhasRodape">
                    <tr style="padding-bottom: 10px;">
                        <td style="vertical-align: top;">
                            <b>Testemunha 1</b>&nbsp;
                        </td>
                        <td></td>
                        <td style="vertical-align: top;">
                            <b>Testemunha 2</b>&nbsp;
                        </td>
                        <td></td>
                    </tr>
                    <tr style="padding-bottom: 10px;">
                        <td style="vertical-align: top;">Nome:&nbsp;
                        </td>
                        <td>
                            <glw:CaixaTexto ID="CaixaTest1Nome" runat="server" Width="300px" MaxLength="60"></glw:CaixaTexto>
                        </td>
                        <td style="vertical-align: top;">Nome:&nbsp;
                        </td>
                        <td>
                            <glw:CaixaTexto ID="CaixaTest2Nome" runat="server" Width="300px" MaxLength="60"></glw:CaixaTexto>
                        </td>
                    </tr>
                    <tr style="padding-bottom: 10px;">
                        <td style="vertical-align: top;">CPF:&nbsp;
                        </td>
                        <td>
                            <glw:CaixaTexto ID="CaixaTest1CPF" placeholder="   .   .   -" runat="server" Width="150px" MaxLength="14" onkeypress="javascript: mascara(this, cpf_mask);"></glw:CaixaTexto>
                        </td>
                        <td style="vertical-align: top;">CPF:&nbsp;
                        </td>
                        <td>
                            <glw:CaixaTexto ID="CaixaTest2CPF" placeholder="   .   .   -" runat="server" Width="150px" MaxLength="14" onkeypress="javascript: mascara(this, cpf_mask);"></glw:CaixaTexto>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%--------------------------------------------------------------------------------%>
        <tr>
            <td>
                <table class="tabelas">
                    <tr style="padding-bottom: 10px;">
                        <td style="vertical-align: top;">Profissão:&nbsp;<glw:CaixaTexto ID="CaixaProfissao" runat="server" Width="200px" MaxLength="60"></glw:CaixaTexto>
                        </td>
                        <%--William Moreira da Silva - SOL 257106 - PPM 956387--%>
                        <td style="vertical-align: top; text-align:right;">Data Assinatura:&nbsp;<br /> <glw:CaixaTexto ID="CaixaDataAssinatura" runat="server" Width="100px" MaxLength="60" Enabled="false"></glw:CaixaTexto>
                        </td>
                        <%--William Moreira da Silva - SOL 257106 - PPM 956387--%>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

<asp:Content ID="contentRodape" runat="server" ContentPlaceHolderID="ConteudoRodape">
    <asp:UpdatePanel ID="updatePanel2" runat="server">
        <ContentTemplate>
            <glw:BotaoAcao ID="BotaoImprimir" runat="server" urlDaImagem="~/Imagens/imgImprimir.PNG"
                Text="Imprimir" OnClick="botaoImprimir_Click"></glw:BotaoAcao>
            <glw:BotaoSair runat="server" Text="Voltar" comportamentoSair="fecharJanela" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
