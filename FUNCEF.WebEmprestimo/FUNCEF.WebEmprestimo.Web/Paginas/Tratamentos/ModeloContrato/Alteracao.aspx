<%-- SIG 50871
 Autor:  
 William Santana

 Data da Atualização:
 03/08/2017

 Criação de fucionalidade para importar modelos de contratos de empréstimo.--%>

<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/FormularioMestre.master"
    AutoEventWireup="true" CodeBehind="Alteracao.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.Tratamentos.ModeloContrato.Alteracao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ConteudoAdicionalHeadFormulario" runat="server">
    <style type="text/css">
        .esq {
            float: left;
        }

        .dir {
            float: right;
        }

        .selArq {
            cursor: default;
            background-color: #F0F0F0;
            width: 90%;
        }
    </style>

    <script language="javascript" type="text/javascript">

        $(document).ready(function () {
            $("#arquivo").click(function () {
                $("#<%=caminhoArquivo.ClientID %>").click();
            });

        });
        
        //Removido validações em codebehid e inserido no script
        //Darivaldo Alencar 50871-inicio
        function validacoesTela() {
            var FileUPL = $("#<%=caminhoArquivo.ClientID %>").val();
           <%-- var linktexto = $("#<%=link.ClientID %>").val();;--%>
            var OpCadastro = OperacaoCadastro();

            if (OpCadastro == "Inclusao") {
                //if ((linktexto == "") && (FileUPL == "")) {
                //    alert("Não existe link ou modelo de contrato a ser importado.");
                //    return false;
                //}

                if (FileUPL == "") {
                    alert("Por favor, selecione o modelo de contrato a ser importado. "); 
                    return false;
                }

                if (!validaArquivo()) {
                    return false;
                }
            }

            if (OpCadastro == "Alteracao") {
                if (FileUPL != "") {
                    if (!validaArquivo()) {
                        return false;
                    }
                }
            }

            if (linktexto != "") {
                if (!ValidarLINK(linktexto)) {
                    return false;
                }
            }
            else {
                alert("Por favor, informe o link do contrato.")
                return false;   
            }

            IncluirHTTPLINK(linktexto);

            return true;
        }

        function OperacaoCadastro() {
            var Op = "";
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '<%= ResolveUrl("~/Paginas/Tratamentos/ModeloContrato/Alteracao.aspx/StatusCadastro") %>',
                data: "{}",
                dataType: 'json',
                async: false,
                success: function (data, status) {
                    Op = data.d;
                },
                error: function (XHR, errStatus, errorThrown) {                    
                    Op = "";
                }
            });
            return Op;
        }

        function ValidarLINK(linktexto) {
            var isValido = true;
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '<%= ResolveUrl("~/Paginas/Tratamentos/ModeloContrato/Alteracao.aspx/validaLink") %>',
                data: "{url:'" + linktexto + "'}",
                dataType: 'json',
                async: false,
                success: function (data, status) {
                    if (data.d == false) {
                        //alert("Por favor, informe o link do contrato.")
                        alert("O link informando não é válido ou não está acessível, favor verificar!")
                        isValido = false;
                    } else {
                        isValido = true;
                    }
                },
                error: function (XHR, errStatus, errorThrown) {                    
                    isValido = false;
                }
            });
            return isValido;
        }

        function IncluirHTTPLINK(linktexto) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '<%= ResolveUrl("~/Paginas/Tratamentos/ModeloContrato/Alteracao.aspx/IncluirHTTP") %>',
                data: "{url:'" + linktexto + "'}",
                dataType: 'json',
                async: false,
                success: function (data, status) {
                   <%-- $("#<%=link.ClientID %>").val(data.d);--%>
                },
                error: function (XHR, errStatus, errorThrown) {
                    alert("ocorreu um erro");
                }
            });
            }
            //Darivaldo Alencar 50871-fim

            function validaArquivo() {
            var caminhoArq = $("#<%=caminhoArquivo.ClientID %>").val();
            var doc = new Array("doc", "docx");
            var ext = caminhoArq.substring(caminhoArq.lastIndexOf('.') + 1).toLowerCase();

            for (var i = 0; i < doc.length; i++) {
                if (ext.toLowerCase() == doc[i]) {
                    return true;
                }
            }

            alert("O formato do arquivo deverá ser .doc ou .docx");
            return false;
        }


    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="EspacoTituloPagina" runat="server">
    <glw:TituloPagina ID="aba1" runat="server" titulo="Modelo de Contrato de Mútuo" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ConteudoFormulario" runat="server">

    <div id="incAlt">
        <table cellpadding="5" cellspacing="5" border="0" class="secoesFormulario" >
            <tr>
                <td style="width:30%"><span class="esq">Tipo de Contrato:</span></td>
                <td>
                    <span>
                        <asp:DropDownList ID="caixaSelecaoTipoContrato" runat="server" Width="345px" Style="padding-top: 10px;"></asp:DropDownList>
                    </span>
                </td>
            </tr>
            <tr>               
                <td style="width:90px">Data início vigência:</td>
                <td>
                    <glw:CaixaData ID="DataInicio" runat="server" mensagemDataInvalida="Data inválida." obrigatorio="true" tipoHoraRetorno="Padrao"></glw:CaixaData>
                </td>
            </tr>
             <tr>               
                <td style="width:90px">Data final vigência:</td>
                <td>
                    <glw:CaixaData ID="DataFinal" runat="server" mensagemDataInvalida="Data inválida." obrigatorio="true" tipoHoraRetorno="Padrao"></glw:CaixaData>
                </td>
            </tr>
            <tr>
                <td ><span>Selecione o caminho do modelo de contrato:</span></Td>
                <td>
                    <span>                        
                        <asp:FileUpload runat="server" ID="caminhoArquivo" onchange=" validaArquivo();"></asp:FileUpload>
                    </span>
                </td>
            </tr>
<%--            <tr>
                <td >Link do contrato no portal FUNCEF:</td>
                <td>
                    <asp:TextBox runat="server" ID="link" style="width:95%"/>
                </td>
            </tr>--%>
        </table>
    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ConteudoBotoesAcao" runat="server">
    <glw:BotaoSalvar ID="botaoSalvar" runat="server" OnClick="botaoSalvar_Click" OnClientClick="return validacoesTela()" permissoesExigidas="" />
    <glw:BotaoExcluir ID="botaoExcluir" runat="server" OnClick="botaoExcluir_Click" exibirMensagemConfirmacao="false"
        mensagemConfirmacao="Deseja realmente excluir o modelo de contrato de empréstimo selecionado?" permissoesExigidas="" />
    <glw:BotaoVoltar ID="botaoVoltar" runat="server" CausesValidation="false" urlVoltar="~/Paginas/Tratamentos/ModeloContrato/Listagem.aspx"></glw:BotaoVoltar>
    <glw:BotaoSair ID="botaoSair" comportamentoSair="irParaTelaInicial" runat="server" />
</asp:Content>
