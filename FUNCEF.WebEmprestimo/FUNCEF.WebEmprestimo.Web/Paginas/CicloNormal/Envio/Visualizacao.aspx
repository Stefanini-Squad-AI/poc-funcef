<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Paginas/Mestre/Mestre.Master" CodeBehind="Visualizacao.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.CicloNormal.Envio.Visualizacao" %>

<asp:Content ContentPlaceHolderID="ConteudoAdicionalHead" runat="server">
    <script language="javascript" type="text/javascript">
        window.setInterval("statusReload();", 60000);

        function statusReload() {
            document.getElementById('<%= btnOcultorefresh.ClientID %>').click();
        }

        function abreSelecaoContrato() {
            var retorno = false;

            var url = "popUpContrato.aspx"
           
            //--inicio WO7885--------------------------------------------------------
            //retorno = exibirDialogo(url, 900, 300);
            
            //window.returnValue = undefined;            
            var retorno = exibirDialogo(url, 900, 300);
            var browser = get_browser();
            var campoRetorno = document.getElementById('<%= HFnumeroContrato.ClientID %>');            
                        
            if ((browser.name.toLocaleUpperCase() == "IE") || (browser.name.toLocaleUpperCase() == "MSIE")) {
                if (retorno != undefined) {                    
                    campoRetorno.Value = "OK";                    
                } else {
                    campoRetorno.value = '';                                        
                }
            } else {
                var timer = setInterval(function () {
                    if (retorno.closed) {
                        clearInterval(timer);                        
                        if (retorno != undefined) {                            
                            var contratoSelecionado = localStorage.getItem("selecionado").split(";"); 
                            retorno = contratoSelecionado;

                            document.getElementById('<%= HFnumeroContrato.ClientID %>').value = contratoSelecionado;  
                            //alert("campo: " + document.getElementById('<%= HFnumeroContrato.ClientID %>').value);
                            __doPostBack('<%= HFnumeroContrato.ClientID %>', '');
                            campoRetorno.Value = "OK";

                        } else {
                            campoRetorno.value = '';
                        }
                    }
                }, 500);
            }
           
            //document.getElementById('<%= HFnumeroContrato.ClientID %>').value = retorno;              
            return false;
            
            //if (dlgReturnValue == undefined)
            //{
            //    dlgReturnValue = window.returnValue;
            //}
            
            //window.returnValue = dlgReturnValue;          

            retorno = prevReturnValue;
            //--fim WO7885---------------------------------------------------------------------                  
            retorno = localStorage.getItem("selecionado");
            document.getElementById('<%= HFnumeroContrato.ClientID %>').value = retorno;    
            //return false;
        }

        function abreDetalhesOperacao() {
            var retorno = false;

            var url = "popUpEnvio.aspx";

            retorno = exibirDialogo(url, 565, 330);            
        }

        function confirmar() {
            if (!confirm('Deseja iniciar o processo de envio?'))
                return false;
        }

    </script>
    <style type="text/css">
        .clicavel {
            cursor: pointer;
        }

        .panel {
            overflow: scroll;
            border-style: solid;
            border-bottom-width: 1px;
            border-top-width: 2px;
            border-right-width: 1px;
            border-left-width: 1px;
            border-color: #808080;
            height: 125px;
            width: 280px;
            padding: 10px;
        }

        .panelEnviar {
            border-style: solid;
            border-bottom-width: 1px;
            border-top-width: 2px;
            border-right-width: 1px;
            border-left-width: 1px;
            border-color: #808080;
            height: 70px;
            width: 200px;
            padding: 10px;
        }

        .botoes {
            text-align: right;
            padding: 10px;
        }

        .imagens {
            vertical-align: central;
            padding: 0px 10px 10px 10px;
        }

        .tabelas {
            width: 100%;
            margin-left: 7px;
        }

        .label {
            position: relative;
            bottom: 12px;
        }
    </style>
</asp:Content>
<asp:Content ContentPlaceHolderID="ConteudoPrincipal" runat="server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
    </asp:ScriptManagerProxy>

    <table cellpadding="0" cellspacing="0" align="center" class="tabelaCorpoPrincipal">
        <asp:HiddenField ID="HFnumeroContrato" runat="server" Value="" />
        <asp:HiddenField ID="HFSessionID" runat="server" />
        <tr>
            <td>
                <glw:TituloPagina ID="aba1" titulo="Envio" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <table class="tabelaConteudoEnvio" cellpadding="0" cellspacing="0">
                    <tr>
                        <td style="padding: 10px 5px 10px 5px;">
                            <table class="tabelas">
                                <tr>
                                    <td>Contrato:
                                    </td>
                                    <td>Matrícula:
                                    </td>
                                    <td>Mutuário:
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" ID="txtContrato" Width="150px" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txtMatricula" Width="120px" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txtMutuario" Width="320px" Enabled="false"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                            <div class="botoes">
                                <glw:BotaoAcao ID="btnIncluir" runat="server" Text="Incluir" urlDaImagem="~/Imagens/imgInserir.png" OnClientClick="return abreSelecaoContrato();"></glw:BotaoAcao>
                                <glw:BotaoLimpar ID="btnLimpar" OnClick="btnLimpar_Click" runat="server"></glw:BotaoLimpar>
                            </div>
                            <br />
                            <table class="tabelas">
                                <tr>
                                    <td class="espacamento">Patrocinadoras
                <div class="panel">
                    <asp:CheckBoxList runat="server" ID="chkPatrocinadora" DataTextField="nome" DataValueField="id">
                    </asp:CheckBoxList>
                </div>
                                    </td>
                                    <td class="espacamento">Planos Previdenciários
                <div class="panel">
                    <asp:CheckBoxList runat="server" ID="ChkPlanos" DataTextField="descricao" DataValueField="id">
                    </asp:CheckBoxList>
                </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Enviar para:
                <div class="panelEnviar">
                    <div>
                        <asp:CheckBox Text="Folha da Patrocinadora" runat="server" ID="chkFolhaPatro" />
                    </div>
                    <div>
                        <asp:CheckBox Text="Folha de Benefícios" runat="server" ID="chkFolhaBenef" />
                    </div>
                    <div>
                        <asp:CheckBox Text="Financeiro a Receber" runat="server" ID="chkFinancReceber" />
                    </div>
                </div>
                                    </td>
                                    <td align="right" valign="middle" style="padding-right: 20px;">
                                        <asp:CheckBox ID="chkDesativaConcessao" runat="server" Text="Desativar concessões durante o processo" ForeColor="red" />
                                        <br />
                                        <br />
                                        <div style="padding: 5px 5px 5px 10px;">
                                            <div>
                                                Data de vencimento
                                            </div>
                                            <div>
                                                <glw:CaixaData Width="90px" runat="server" ID="caixaDataVencimento" Style="text-align: center"></glw:CaixaData>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <asp:UpdatePanel ID="updatePanel" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div style="padding-left: 15px; padding-top: 15px;">
                                        Estado do serviço ETL:
                                    </div>
                                    <div style="margin-left: 30px">
                                        <div runat="server" id="divDisponivel" visible="false">
                                            <asp:Image runat="server" ImageUrl="~/Imagens/imgDisponivel.png" />
                                            <asp:Label runat="server" Text="Disponível" Font-Bold="true" CssClass="label"></asp:Label>
                                        </div>
                                        <div runat="server" id="divOcupado" visible="false">
                                            <asp:Image runat="server" ImageUrl="~/Imagens/imgOcupado.png" CssClass="clicavel" Onclick="abreDetalhesOperacao();" />
                                            <asp:Label runat="server" Text="Ocupado" Font-Bold="true" CssClass="label clicavel" Onclick="abreDetalhesOperacao();"></asp:Label>
                                        </div>
                                        <div runat="server" id="divIndisponivel" visible="true">
                                            <asp:Image runat="server" ImageUrl="~/Imagens/imgIndisponivel.png" />
                                            <asp:Label runat="server" Text="Indisponível" Font-Bold="true" CssClass="label"></asp:Label>
                                        </div>
                                    </div>
                                    <%--<asp:Button ID="btnOcultorefresh" runat="server" Visible="false" OnClick="btnOcultorefresh_Click" />--%>
                                    <glw:BotaoOculto ID="btnOcultorefresh" runat="server" OnClick="btnOcultorefresh_Click" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="btnOcultorefresh" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding: 7px 20px 5px 0px; border-top: dashed 1px rgb(215, 215, 215); text-align: right;">
                            <glw:BotaoAcao ID="botaoContinuar" runat="server" permissoesExigidas="consultar" tagImagem="botaoProximo" Text="Continuar" OnClientClick="javascript:return confirmar();" OnClick="botaoContinuar_Click"></glw:BotaoAcao>
                            <glw:BotaoSair ID="botaoSair" runat="server" permissoesExigidas="mascaraVazia"></glw:BotaoSair>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>

    </table>
    <br />
</asp:Content>

