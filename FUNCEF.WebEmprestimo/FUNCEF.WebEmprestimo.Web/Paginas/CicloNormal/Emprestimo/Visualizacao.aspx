<%-- SIG 21529
  Autor:
 Thayane Rabonato/ Darivaldo Alencar

 Descrição da Alteração:
 Criação da opção de renegociação de dívidas de emprestimo
--%>
<%--SIG 74591
    Autor:
    Darivaldo Alencar

    Descrição:
    Campo tipo de contrato perdendo indice após selecionar excepcionalidade
--%>
<%--SIG 65101
    Autor:
    Darivaldo Alencar

    Descrição:
    Erro na prestação base ao clicar no botão atualizar
--%>
<%--SIG 57632
    Autor:
    Marcelo Valério Ferreira

    Descrição:
    Execução do recálculo após remoção da seleção do campo "Líquido Zero"
--%>
<%--SIG 62658   
    Autor: Marcelo Valério Ferreira
  
    Descrição:
    Alteração do prazoMaximo do campo Prazo, correção do maxLength e inclusão do parseint na validação do valor máximo
--%>
<%--SIG 62003.69601
    Autor: Marcelo Valério Ferreira
  
    Descrição:
    Inclusão do sistema de amortização
--%>
<%--SIG 32345
    Autor: Darivaldo Alencar SIG 32345
  
    Descrição:
    Campo pestação básica só estava sendo atualizado ao clicar no botão calcular
--%>
<%-- SOL 264992 PPM 1165447
    Autor:  
    William Santana

    Descrição :
    Removido o componente da tela AjaxToolKit (TabContainer e TabPanel) e adicionado a exibição em abas por jQuery
    Removido nested tables (tables dentro de tables dentro de tables)
--%>

<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/FormularioMestre.master"
    AutoEventWireup="true" CodeBehind="Visualizacao.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.CicloNormal.Emprestimo.Visualizacao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ConteudoAdicionalHeadFormulario" 
    runat="server">
    <link rel="Stylesheet" href="../../../CssDinamico/jquery-ui.min.css" />    
    
    <!--William Oliveira - Defect Log 199759 - Inicio-->
    <style type="text/css">
        .text-align-center {
            text-align: center !important;
        }

        .text-align-right {
            text-align: right !important;
        }

        .tiraBordaTableSecao {
            border: none !important;
        }       
    </style>
    <!--William Oliveira - Defect Log 199759 - Fim-->
    <script type="text/javascript" src="../../../Scripts/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../../../Scripts/jquery-ui.min.js"></script>
    <script type="text/javascript" src="../../../Scripts/jquery.blockUI.js"></script>
    <%--
   <style type="text/css">
        #dialog
        {
        	background-color:#0000FF;
        }
    </style>--%>

    <script language="javascript" type="text/javascript">
        var precisaRecalcular = false;
        var prazoAnterior = null;

        //Início - William Santana 
        $(function () {
            $("#recipienteAbaInscricaoEmprestimo").tabs();
            $("#recipienteAbaContratoSecundario").tabs();

        });
        //Término - William Santana

        //William Moreira da Silva - SOL 247087
        function desabilitaBotao(botao) {

            document.getElementById('<%= botaoCalcular.ClientID %>').style.visibility = "hidden";

        }

        //Darivaldo Alencar SIG 32345 -inicio
        function LiquidoZeroClick(e) {            
            var tipoContrato = document.getElementById('<%= caixaSelecaoTipoContrato.ClientID %>').value;
            var chkLiqZero = document.getElementById('<%= checkBoxLiquidoZero.ClientID %>');
            var checkBoxMargem = document.getElementById('<%= checkBoxMargem.ClientID %>');
            var checkBoxInadimplencia = document.getElementById('<%= checkBoxInadimplencia.ClientID %>');                                            
            
            checkBoxMargem.disabled = chkLiqZero.checked;
            checkBoxInadimplencia.disabled = chkLiqZero.checked;

            checkBoxMargem.checked = chkLiqZero.checked;
            checkBoxInadimplencia.checked = chkLiqZero.checked;

            if (tipoContrato != '') {                
                NecessitaRecalculo();                
            }               
        }

        //Saulo Cirineu SIG 
        function DescontoClick(e) {
            var tipoContrato = document.getElementById('<%= caixaSelecaoTipoContrato.ClientID %>').value;
            if (ValidaModalidadesCampanhaDesc())
                chamarBarraProgresso();
        }

        function chamarBarraProgresso() {
            var html = '<div id="dialog"><div id="progresso"></div></div><div id="mensagem"></div>';
            $.blockUI({ message: html, css: { border: '1px dotted grey' } });
            var time = setInterval(function () {
                $.ajax({
                    type: 'POST',
                    url: 'Progresso.ashx',
                    success: function (result) {
                        var i = 0;
                        var valores = result;
                        var a = valores.split(".");
                        //a[0] Porcentagem
                        //a[1] Total de regras
                        //a[2] Regras Processadas
                        //a[3] Total de Itens
                        //a[4] Itens Processados
                        //a[5] Mensagem
                        if (a[0] == "100") {
                            clearInterval(time);
                            $.unblockUI();
                        }
                        var porcentagem = parseInt(a[0]);
                        if (porcentagem > 5 && porcentagem < 91 && a[1] > 0) {
                            $('#progresso').progressbar({ value: porcentagem });
                            $('#mensagem').block({ message: 'Calculando ' + a[2] + ' de ' + a[1], css: { border: '1px dotted grey', width: '250px' } });
                        }
                        else {
                            $('#progresso').progressbar({ value: porcentagem });
                        }
                    },
                    error: function () {
                        clearInterval(time);
                        alert("houve um erro");
                    }
                });

            }, 100);
        }
        //Darivaldo Alencar SIG 32345 -fim

        //William Moreira da Silva - SOL 235732
        //function RecalcQuitacaoHabitacional() {
        //    precisaRecalcular = false;
        //    quitacaoHabitacional();            
        //}
        //Comentado por Saulo Cirineu

        <%--function quitacaoHabitacional() { 
            var tipoContrato = document.getElementById('<%= caixaSelecaoTipoContrato.ClientID %>').value;
            var checkBox = document.getElementById('<%= checkBoxFinanciamento.ClientID %>');
            var url = "PopupInputRegra.aspx?listaRegras=|24768"
            var retorno = false;

            if (tipoContrato == '') {
                //alert('Por favor, selecione o tipo de contrato.');
                return false;
            }

            if (checkBox.checked) {

                retorno = exibirDialogo(url, 500, 200);
            }
        }--%>
        //William Moreira da Silva - SOL 235732

        function mudaCursorProcessando() {
            document.body.style.cursor = 'wait';
        }

        function mudaCursorpadrao() {
            document.body.style.cursor = 'default';
        }
        //William Moreira da Silva - SOL 247087

        function confirmarContrarEp(e) {
            var classes = e.className.split(' ');
            if (classes[0] != 'aspNetDisabled') {
                if (!confirm('Deseja realmente contratar o Empréstimo?'))
                    return false;

                var chkImpressaoContrato = document.getElementById("<%= chkImpressaoContrato.ClientID %>");
                if (chkImpressaoContrato.checked == false){
                    if (!confirm('Deseja efetuar a concessão sem a geração do contrato de empréstimo?'))
                        return false;   
                }
            }
        }
        //        SOL 199759
        function verificarSelecao(tipo) {
            var tipoContrato = document.getElementById('<%= caixaSelecaoTipoContrato.ClientID %>').value;
            var conjuge;

            if (tipoContrato == '') {
                //alert('Por favor, selecione o tipo de contrato.');
                return false;
            }

            if (tipo != null && tipo != 0) {
                conjuge = tipo;
            }
            else {
                conjuge = 0;
            }

            var retorno = false;

            var campoRetorno = document.getElementById('<%= hdnRetornoIdPessoa.ClientID %>');

            var url = "ListagemAvalista.aspx?idPessoa=" + campoRetorno.Value + "&conjuge=" + conjuge;//William Moreira da Silva - SOL 143476/16437

            retorno = exibirDialogo(url, 900, 300);

            var campoRetorno = document.getElementById('<%= hdnRetorno.ClientID %>');

            if (retorno != undefined) {
                alert(retorno);
                campoRetorno.Value = "OK";
                __doPostBack('<%= hdnRetorno.UniqueID %>', '');
                return true;
            }
            else {
                campoRetorno.value = '';
                return false;
            }
        }

        function verificarSelecaoNovoAvalista(tipo) {
            var tipoContrato = document.getElementById('<%= caixaSelecaoTipoContrato.ClientID %>').value;

            if (tipoContrato == '') {
                return false;
            }

            var retorno = false;
            var url = "PopupNovoAvalista.aspx?cpfMutuario=" + document.getElementById('<%= cpfMutuario.ClientID %>').value;

            retorno = exibirDialogo(url, 1300, 600);

            var campoRetorno = document.getElementById('<%= hdnRetorno.ClientID %>');

            if (retorno != undefined) {
                alert(retorno);
                campoRetorno.Value = "OK";
                return true;
            }
            else {
                campoRetorno.value = '';
                return false;
            }
        }

        //        SOL 199759        
        function confirmarVerificarConcessaoExistente() {
            if (!confirm('Já existe outro contrato com a mesma ou posterior data de crédito. Deseja conceder assim mesmo?'))
                return false;
            else
                document.getElementById('<%= botaoOcultoContinuarContratacaoEP.ClientID %>').click();
        }

        function confirmarVerificarSuspensaoAnterior() {
            if (!confirm('O Contrato anterior possui suspensão temporária. Não será permitido o reaproveitamento. Deseja contratar assim mesmo?'))
                return false;
            else
                    //William Moreira da Silva - SIG 36211 - Inicio
                    //document.getElementById('<%= botaoOcultoContinuarContratacaoEP1.ClientID %>').click();
                document.getElementById('<%= botaoOcultoContinuarContratacaoEP.ClientID %>').click();
            //William Moreira da Silva - SIG 36211 - Fim
        }

        function confirmarVerificarSuspensaoAnterior() {
            if (!confirm('O Contrato anterior possui suspensão temporária. Não será permitido o reaproveitamento. Deseja contratar assim mesmo?'))
                return false;
            else
                document.getElementById('<%= botaoOcultoContinuarContratacaoEP1.ClientID %>').click();
        }

        //NILTON - SOL201705 KTN1950511 - 07/03/2013              
        function validarPrazoMaximo() {

            var prazoMaximo = Number(document.getElementById('<%= hdfPrazo.ClientID %>').value);
            var prazoDigitado = Number(document.getElementById('<%= caixaNumericaPrazo.ClientID %>').value);

            if (prazoDigitado > prazoMaximo) {
                document.getElementById('<%= caixaNumericaPrazo.ClientID %>').value = prazoMaximo.toString();
            } else if (prazoDigitado == 0) {
                document.getElementById('<%= caixaNumericaPrazo.ClientID %>').value = '1';
            }
        }

        //William Moreira da Silva - SOL 143476/16437
        function deletarConjuge(idConjuge) {
            var id = idConjuge;
            document.getElementById('<%= idDltConjuge.ClientID %>').value = id;
        }
        //William Moreira da Silva - SOL 143476/16437

        function HabilDesabilLiquidoZero() {
            var tipoContrato = document.getElementById('<%= caixaSelecaoTipoContrato.ClientID %>').value
            //Campanha Desconto
            var checkCampanhaDesconto = document.getElementById('<%= checkBoxDesconto.ClientID %>');

            if (checkCampanhaDesconto.checked == true) {
                $('#<%= checkBoxLiquidoZero.ClientID %>').attr('checked', true);
                $('#<%= checkBoxLiquidoZero.ClientID %>').attr('disabled', true);
            }
            else {
                $('#<%= checkBoxLiquidoZero.ClientID %>').attr('checked', false);
                $('#<%= checkBoxLiquidoZero.ClientID %>').attr('disabled', false);
            }
        }

        function ObrigaLiquidoZero() {
            var chkLiqZero = document.getElementById("<%= checkBoxLiquidoZero.ClientID %>");
            chkLiqZero.checked = true;
            chkLiqZero.disabled = true;
        }

        function LiberaLiquidoZero() {
            var chkLiqZero = document.getElementById("<%= checkBoxLiquidoZero.ClientID %>");
            chkLiqZero.checked = false;
            chkLiqZero.disabled = false;
        }

        //Campanha Desconto
        function HabilitarDesabilitarDesconto() {
            var chkLiqZero = document.getElementById('<%= checkBoxLiquidoZero.ClientID %>');
            var chkFH = document.getElementById('<%= checkBoxFinanciamento.ClientID %>');
            var chkDesconto = document.getElementById('<%= checkBoxDesconto.ClientID %>');
            var chkMargem = document.getElementById('<%= checkBoxMargem.ClientID %>');
            var chkInad = document.getElementById('<%= checkBoxInadimplencia.ClientID %>');
            var cxNumeroPrazo = document.getElementById('<%= caixaNumericaPrazo.ClientID %>');

            if (chkDesconto.checked) {
                chkLiqZero.checked =
                    chkMargem.checked =
                    chkInad.checked = true;

                chkLiqZero.disabled =
                    chkMargem.disabled =
                    chkInad.disabled = true;
            } else {
                chkLiqZero.checked =
                    chkMargem.checked =
                    chkInad.checked = false;

                chkLiqZero.disabled =
                    chkMargem.disabled =
                    chkInad.disabled = false;
            }

            cxNumeroPrazo.value = '0';
            cxNumeroPrazo.setAttribute('valorMinimo', 0);
            cxNumeroPrazo.setAttribute('valorMaximo', 0);

            NecessitaRecalculo();
        }

        function DesabilitarCheckCampanhaDesconto() {
            $('#<%= checkBoxDesconto.ClientID %>').attr('checked', false);
        }
        //Campanha Desconto
        function ValidaModalidadesCampanhaDesc() {
            var tipoContrato = document.getElementById('<%= caixaSelecaoTipoContrato.ClientID %>').value;
            var checkBox = document.getElementById('<%= checkBoxDesconto.ClientID %>');

            if (tipoContrato == '') {
                return false;
            }

            if (checkBox.checked) {
                if (tipoContrato != 89 && tipoContrato != 90) {
                    alert('Modalidade indisponível para a campanha de descontos.');
                    return false;
                }
            }
            return true;
        }

        function ExibirIncluirFiador() {
            document.getElementById('divIncluirFiador').style.display = 'block';
        }

        function HabilitarDesabilitarFH() {
            var FHmarcado = document.getElementById('<%= checkBoxFinanciamento.ClientID %>').checked;
            if (FHmarcado)
                document.getElementById('<%= divPainelFH.ClientID %>').style.display = 'block';
            else
                document.getElementById('<%= divPainelFH.ClientID %>').style.display = 'none';
            NecessitaRecalculo();
        }

        function alteracaoDePrazo(elementPrazo) {
            if (elementPrazo.oldvalue !== elementPrazo.value && elementPrazo.oldvalue !== undefined)
                NecessitaRecalculo();
        }

        function NecessitaRecalculo() {
            var botaoCalcular = document.getElementById('<%= botaoCalcular.ClientID %>');
            var botaoContratar = document.getElementById('<%= botaoContratarEp.ClientID %>');
            var botaoImprimir = document.getElementById('<%= BotaoImprimir.ClientID %>');
            var tipoContrato = document.getElementById('<%= caixaSelecaoTipoContrato.ClientID %>').value;            
            <%--var BotaoAcaoAbrirRenegociacao = document.getElementById('<%= BotaoAcaoAbrirRenegociacao.ClientID %>');--%> //SIG21529 

            if (tipoContrato !== "") {
                botaoCalcular.style.color = "red";
                botaoImprimir.classList.add("aspNetDisabled");
                botaoImprimir.removeAttribute("href");
                botaoImprimir.removeAttribute("onclick");
                botaoImprimir.disabled = true;
                botaoImprimir.title = 'Alguns parâmetros para cálculo foram alterados. Por favor, realize o cálculo novamente.';
            }
            if (!botaoContratar.classList.contains("aspNetDisabled")) {
                botaoContratar.removeAttribute("href");
                botaoContratar.removeAttribute("onclick");
                botaoContratar.disabled = true;
                botaoContratar.classList.add("aspNetDisabled");
                botaoContratar.title = 'Alguns parâmetros para cálculo foram alterados. Por favor, realize o cálculo novamente.';                
            }                                 

            //SIG21529 -Inicio            
            if (!BotaoAcaoAbrirRenegociacao.classList.contains("aspNetDisabled")) {
                BotaoAcaoAbrirRenegociacao.removeAttribute("href");
                BotaoAcaoAbrirRenegociacao.removeAttribute("onclick");
                BotaoAcaoAbrirRenegociacao.disabled = true;
                BotaoAcaoAbrirRenegociacao.classList.add("aspNetDisabled");
                BotaoAcaoAbrirRenegociacao.title = 'Alguns parâmetros para cálculo foram alterados. Por favor, realize o cálculo novamente.';
            }
            //SIG21529 -Fim
        }

        function abrirRenegociacao() {
            var tipoContrato = $('#<%= caixaSelecaoTipoContrato.ClientID %>').val();
            var matricula = $('#<%= hdfMatricula.ClientID %>').val();
            var idContratosAnteriores = $('#<%= hdfContratosDividasEmprestimo.ClientID %>').val();
            var dataCredito = $('#<%= hdfCaixaDataCredito.ClientID %>').val();
            var dataPrimeiraParcela = $('#<%= hdfCaixaDataPrimeiraParcela.ClientID %>').val();
            var taxaJuros = $('span[id*="labelTaxaJuros"]').text();
            var quantidadeParcelas = $('#<%= caixaNumericaPrazo.ClientID %>').val();
            var valorSaldoQuitar = $('span[id*="labelSaldoQuitar"]').text();
            var valorSolicitado = $('#<%= hdfCaixaNumericaValorSolicitado.ClientID %>').val();
            var valorMaximoPermitido = $('#<%= caixaNumericaValorMaximoPermitido.ClientID %>').val();
            var valorPrestacaoBase    =  $('span[id*="labelPrestacaoBasica"]').text();
            var valorMargem           =  $('#<%= hdfCaixaNumericaMargemConsignavel.ClientID %>').val();
            var valorFGQC = $('span[id*="labelFGQCBase"]').text();                   
            var ValorUltimaPrestacaoFGQC = $('#<%= hdfValorUltimaPrestacaoFGQC.ClientID %>').val();
            var colunas = document.getElementById('<%= gridDividasEmprestimo.ClientID %>').getElementsByTagName("td");
            var contratos = null; 
            var valorDescFGQC = $('span[id*="labelDescFGQCBase"]').text(); //SIG 128871 - Inclusão da linha
            var contador = 0;

            for (i = 1; i < colunas.length; i++) {
                if (contratos == null) {
                    contratos = colunas[i].firstChild.nodeValue;                    
                } else {   
                    contador++;
                    if (contador == 12) {
                        contratos = contratos + "," + colunas[i].firstChild.nodeValue;
                        contador = 0;
                    }
                }
            }


             var parametros = "?tipoContrato=" + tipoContrato +
                            "&matricula=" + matricula +
                            "&idContratosAnteriores=" + idContratosAnteriores +
                            "&dataCredito=" + dataCredito +
                            "&dataPrimeiraParcela=" + dataPrimeiraParcela +
                            "&taxaJuros=" + taxaJuros +
                            "&quantidadeParcelas=" + quantidadeParcelas +
                            "&valorSaldoQuitar=" + valorSaldoQuitar +
                            "&valorSolicitado=" + valorSolicitado +
                            "&valorMaximoPermitido=" + valorMaximoPermitido +
                            "&valorPrestacaoBase=" + valorPrestacaoBase +
                            "&valorMargem=" + valorMargem +
                            "&valorFGQC=" + valorFGQC +                            
                            "&idContratosAnteriores=" + contratos +
                            "&ValorUltimaPrestacaoFGQC=" + ValorUltimaPrestacaoFGQC;
   
            var url = "PopupRenegociacao.aspx" + parametros;                   
           var retorno = exibirDialogo(url, 1100, 620);     
        
            var browser = get_browser();
            var campoRetorno = document.getElementById('<%= hdnRetorno.ClientID %>');  

            if ((browser.name.toLocaleUpperCase() == "IE") || (browser.name.toLocaleUpperCase() == "MSIE")) {                
                if (retorno != undefined) {
                    var valores = retorno.split(";");
                    var atualizouCalculo = valores[2].toLocaleString();

                    if (atualizouCalculo == "sim") {                        
                        valorSolicitado = Number(valores[1]).toLocaleString('pt-BR', { minimumFractionDigits: 2, style: 'decimal', currency: 'BRL' });                        

                        $('#<%= hdfCaixaNumericaValorSolicitado.ClientID %>').val(valorSolicitado);
                        $('#<%= caixaNumericaValorSolicitado.ClientID %>').val(valorSolicitado);
                    }
                    campoRetorno.Value = "OK";                    
                } else {
                    campoRetorno.value = '';                                        
                }
            } else {
                var timer = setInterval(function () {
                    if (retorno.closed) {
                        clearInterval(timer);
                        if (retorno != undefined) {                            
                            var valores = localStorage.getItem("selecionado").split(";");                            
                            var atualizouCalculo = valores[2].toLocaleString();

                            if (atualizouCalculo == "sim") {                                
                                valorSolicitado = Number(valores[1]).toLocaleString('pt-BR', { minimumFractionDigits: 2, style: 'decimal', currency: 'BRL' });                                

                                $('#<%= hdfCaixaNumericaValorSolicitado.ClientID %>').val(valorSolicitado);
                                $('#<%= caixaNumericaValorSolicitado.ClientID %>').val(valorSolicitado);
                            }
                            campoRetorno.Value = "OK";

                        } else {
                            campoRetorno.value = '';
                        }
                    }
                }, 500);
            }
            return false;
        }         

        function ConcessaoAcordoJudicial() {

            var tipoContrato = document.getElementById('<%= caixaSelecaoTipoContrato.ClientID %>').value;
            var chkLiquidoZero = document.getElementById('<%= checkBoxLiquidoZero.ClientID %>');
            var chkAcordoJudicial = document.getElementById('<%= checkBoxAcordoJudicial.ClientID %>');

            if (tipoContrato == 94) {
                chkLiquidoZero.checked = chkAcordoJudicial.checked = true;                
                chkLiquidoZero.disabled = chkAcordoJudicial.disabled = true;                
            }
            else
            {               
                //chkLiquidoZero.checked = chkAcordoJudicial.checked = false;                
                chkLiquidoZero.disabled = chkAcordoJudicial.disabled = false; 
            }

            return true;
        }

    </script>

    <%--NILTON 17/01/13--%>

    <%-- <script type="text/javascript" language="javascript">
		var ModalProgress = '<%= ModalProgress.ClientID %>';         
    </script>--%>

    <%--NILTON 17/01/13--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="EspacoTituloPagina" runat="server">
    <glw:TituloPagina ID="aba1" runat="server" titulo="Inscrição / Concessão / Renovação" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ConteudoFormulario" runat="server">

    <%--<script src="../../../Scripts/jsUpdateProgress.js" type="text/javascript"></script>--%>

    <%--NILTON 17/01/13--%>
    <%--<asp:UpdatePanel ID="updatePanel1" runat="server">
        <ContentTemplate>--%>
    <asp:HiddenField ID="imprimiuRelatorio" runat="server" Value="0" />
	<glw:CampoOculto runat="server" ID="hdfIdPessoa" />
    <glw:CampoOculto runat="server" ID="hdfMatricula" />
    <glw:CampoOculto runat="server" ID="cpfMutuario" />
    <glw:CampoOculto runat="server" ID="idDltConjuge" Value="0" />
    <table cellpadding="1" cellspacing="0" border="0" width="100%" class="tableSecao tiraBordaTableSecao">
        <tr>
            <td colspan="3" class="espacamentoMaior">
                <table cellpadding="0" cellspacing="0" class="tableSecao tiraBordaTableSecao">
                    <tr>
                        <td class="espacamentoMaior">
                            <%--  Darivaldo Alencar SIG 32345  -inicio --%>
                            <%-- <asp:CheckBox ID="checkBoxLiquidoZero" runat="server" Text="Líquido Zero"/> --%>
                            <%--<asp:CheckBox ID="checkBoxLiquidoZero" runat="server" Text="Líquido Zero" OnClick="LiquidoZeroClick(this)" OnCheckedChanged="checkBoxLiquidoZero_CheckedChanged" AutoPostBack="true"/> --%>                            
							<%--SIG21529 inicio--%>
							<asp:CheckBox ID="checkBoxLiquidoZero" runat="server" Text="Líquido Zero" OnClick="NecessitaRecalculo()" /> 
							<%--<asp:CheckBox ID="checkBoxLiquidoZero" runat="server" Text="Renegociação" OnClick="LiquidoZeroClick(this)" />--%>
							<%--SIG21529 fim--%>
                            <%--  Darivaldo Alencar SIG 32345  -fim--%>
                            <asp:Label ID="lblTipoProcesso" runat="server" Visible="false"></asp:Label>
                        </td>
                        <td style="width: 20%">
                            <asp:CheckBox ID="checkBoxFinanciamento" runat="server" Text="Financiamento" OnClick="HabilitarDesabilitarFH()" />
                        </td>
                        <!-- Felipe A. Santos  SOL 208770 PPM 2016022 - início  -->

                        <!-- Felipe A. Santos  SOL 224034  - início  -->
                        <td>
                            <asp:CheckBox ID="checkBoxAcordoJudicial" runat="server" Text="Acordo Judicial" />
                        </td>
                        <td>
                            <asp:CheckBox ID="checkBoxDesconto" runat="server" Text="Política de Renegociação" OnClick="HabilitarDesabilitarDesconto()" />
                        </td>
                        <!-- Felipe A. Santos  SOL 224034  - fim  -->
                        <td rowspan="6">
                            <fieldset style="width: 120px;">
                                <legend style="color: #ff0000;">Renegociação</legend>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="checkBoxMargem" runat="server" Text="Valor Solicitado" OnClick="NecessitaRecalculo()" ToolTip="O valor solicitado não será vinculado à margem consignável." />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="checkBoxElegibilidade" runat="server" Text="Elegibilidade" OnClick="NecessitaRecalculo()" ToolTip="Verificação da elegibilidade não será considerada." />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="checkBoxInadimplencia" runat="server" Text="Inadimplência" OnClick="NecessitaRecalculo()" ToolTip="Contratos inadimplentes não irão bloquear novas concessões." />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="checkBoxOutros" runat="server" Text="Outros" OnClick="NecessitaRecalculo()" ToolTip="Desconsidera a busca do salário base, busca da margem, busca dos dias úties para data de crédito, verificação da quantidade de parcelas pagas para novação e valor da prestação base acima das prestações anteriores para concessões com líquido zero." />
                                        </td>
                                    </tr>

                                </table>
                            </fieldset>
                        </td>
                        <!-- Felipe A. Santos SOL 208770 PPM 2016022 - fim -->

                        <!-- Felipe A. Santos SOL 208770 PPM 2016022 - início
                                <td>
                                    <asp:CheckBox ID="checkBoxExcepcional" runat="server" Text="Excepcional" ForeColor="red"
                                        OnCheckedChanged="checkBoxExcepcional_CheckedChanged" AutoPostBack="true" />
                                </td>
                                <td>
                                    <asp:DropDownList ID="caixaSelecaoGrupoExcepcional" runat="server" Width="250px"
                                        Style="padding-top: 10px;" AutoPostBack="false" OnSelectedIndexChanged="caixaSelecaoGrupoExcepcional_SelectedIndexChanged"
                                        Enabled="False">
                                    </asp:DropDownList>
                                </td>

                               Felipe A. Santos SOL 208770 PPM 2016022 - fim -->
                    </tr>
                    <tr>
                        <td class="espacamentoMaior">Mutuário:
                        </td>
                        <td>
                            <asp:Label ID="labelMutuario" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                        <td>Matrícula:
                        </td>
                        <td>
                            <asp:Label ID="labelMatricula" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="espacamentoMaior">Patrocinadora:
                        </td>
                        <td>
                            <asp:Label ID="labelPatrocinadora" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                        <td>C.P.F:
                        </td>
                        <td>
                            <asp:Label ID="labelCPF" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="espacamentoMaior">Situação do Participante:
                        </td>
                        <td>
                            <asp:Label ID="labelSituacaoParticipante" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                        <td>Plano Previdenciário:
                        </td>
                        <td>
                            <asp:Label ID="labelPlanoPrevidenciario" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="espacamentoMaior">Tipo de Contrato:
                        </td>
                        <td>
                            <asp:UpdatePanel ID="updatePanel" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList ID="caixaSelecaoTipoContrato" runat="server" Width="250px" OnSelectedIndexChanged="caixaSelecaoTipoContrato_SelectedIndexChanged" AutoPostBack="true">
                                    </asp:DropDownList>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>Nome do Responsável:
                        </td>
                        <td>
                            <asp:Label ID="labelNomeResponsavel" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="espacamento">Número Único de Protocolo:
                        </td>
                        <td>
                            <glw:CaixaTexto ID="caixatextoNup" runat="server" Width="150px" onkeyup="javascript:mask(this.id, '00000.000000/0000', event);" MaxLength="17"></glw:CaixaTexto>
                        </td>
                        <td>Sistema de Amortização:</td>
                        <td> 
                               <asp:UpdatePanel ID="updatePanelSisAmort" runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="labelSistemaAmortizacao" runat="server" CssClass="textoEstaticoNegrito" AutoPostBack="true" OnTextChanged="caixaSelecaoTipoContrato_SelectedIndexChanged"></asp:Label>   
                                </ContentTemplate>
                             </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="3" class="espacamento">
                <%-- <ajaxToolkit:TabContainer ID="recipienteAbaInscricaoEmprestimo" runat="server" CssClass="abaPainel"
                            Enabled="false">
                            <ajaxToolkit:TabPanel runat="server" ID="painelAbaCondicoesContratuais" HeaderText="Contrato">--%>
                <div id="recipienteAbaInscricaoEmprestimo">

                    <ul class="abaPainel" style="background-color: white;">
                        <li><a href="#painelAbaCondicoesContratuais">Condições Contratuais</a></li>
                        <li><a href="#painelAbaItens">Itens</a></li>
                        <li><a href="#painelAbaIntegracao">Integração</a></li>
                        <li><a href="#painelAbaDividasEmprestimo">Dívidas de Empréstimo</a></li>
                        <li><a href="#painelAbaBeneficiariosSeguro">Beneficiários do Seguro</a></li>
                        <li><a href="#painelAbaOutrasDividas">Outras Dividas</a></li>
                        <li><a href="#painelAbaOutrasInformacaoes">Fiadores/Avalistas</a></li>
                    </ul>

                    <div id="painelAbaCondicoesContratuais" class="abaPainel">
                        <asp:UpdatePanel ID="updatePanel1" runat="server">
                            <ContentTemplate>
                                <table cellpadding="0" cellspacing="0" class="tableSecao tiraBordaTableSecao" id="tableCondicoesContratuais">

                                    <tr>
                                        <td>Res. Poupança:<br />
                                            <asp:Label ID="labelResPoupanca" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                        </td>
                                        <td class="espacamento">Salário Base:<br />
                                            <glw:CaixaNumerica ID="caixaNumericaSalarioBase" runat="server" casasDecimais="2" tipoNumerico="numero" valorMaximo="99999999.99" CssClass="inputValue" onchange="NecessitaRecalculo()"></glw:CaixaNumerica>
                                            <%--INICIO - NILTON - SOL205608 KTN198892 - 24/04/2013--%>
                                            <asp:HiddenField ID="hdfCaixaNumericaSalarioBase" runat="server" />
                                            <%--FINAL - NILTON - SOL205608 KTN198892 - 24/04/2013--%>
                                                
                                        </td>
                                        <td>Total Parcelas:<br />
                                            <asp:Label ID="labelTotalParcelas" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                        </td>
                                        <td>Pendências:<br />
                                            <asp:Label ID="labelPendencias" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                        </td>
                                        <td>Margem Consignável:<br />
                                            <glw:CaixaNumerica ID="caixaNumericaMargemConsignavel" runat="server" casasDecimais="2" tipoNumerico="numero" valorMaximo="99999999.99" CssClass="inputValue" onchange="NecessitaRecalculo()"></glw:CaixaNumerica>
                                            <%--INICIO - NILTON - SOL205608 KTN198892 - 24/04/2013--%>
                                            <asp:HiddenField ID="hdfCaixaNumericaMargemConsignavel" runat="server" />
                                            <%--FINAL - NILTON - SOL205608 KTN198892 - 24/04/2013--%>
                                                
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="espacamento">Data da Solicitação:<br />
                                            <glw:CaixaData ID="caixaDataSolicitacao" runat="server" Width="90px"></glw:CaixaData>
                                            <%--INICIO - NILTON - SOL205608 KTN198892 - 24/04/2013--%>
                                            <asp:HiddenField ID="hdfCaixaDataSolicitacao" runat="server" />
                                            <%--FINAL - NILTON - SOL205608 KTN198892 - 24/04/2013--%>
                                                
                                        </td>
                                        <td>Data da Assinatura:<br />
                                            <glw:CaixaData ID="caixaDataAssinatura" runat="server" Width="90px"></glw:CaixaData>
                                            <%--INICIO - NILTON - SOL205608 KTN198892 - 24/04/2013--%>
                                            <asp:HiddenField ID="hdfCaixaDataAssinatura" runat="server" />
                                            <%--INICIO - NILTON - SOL205608 KTN198892 - 24/04/2013--%>
                                        </td>
                                        <td>Data do Crédito:<br />
                                            <glw:CaixaData ID="caixaDataCredito" runat="server" Width="90px" onchange="NecessitaRecalculo()"></glw:CaixaData>
                                            <%--INICIO - NILTON - SOL205608 KTN198892 - 24/04/2013--%>
                                            <asp:HiddenField ID="hdfCaixaDataCredito" runat="server" />
                                            <%--FINAL - NILTON - SOL205608 KTN198892 - 24/04/2013--%>
                                        </td>
                                        <td>Carência:<br />
                                            <asp:Label ID="labelCarencia" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                        </td>
                                        <td>Data da 1ª Parcela:<br />
                                            <glw:CaixaData ID="caixaDataPrimeiraParcela" runat="server" Width="90px" horarioVerao="true"></glw:CaixaData>
                                            <%--Thiago Melo SOL 216474 Kintana 2045796--%>

                                            <%--INICIO - NILTON - SOL205608 KTN198892 - 24/04/2013--%>
                                            <asp:HiddenField ID="hdfCaixaDataPrimeiraParcela" runat="server" />
                                            <%--FINAL - NILTON - SOL205608 KTN198892 - 24/04/2013--%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="espacamento">Valor Máximo Permitido:<br />
                                            <glw:CaixaNumerica ID="caixaNumericaValorMaximoPermitido" runat="server" casasDecimais="2" Enabled="false" tipoNumerico="numero" valorMaximo="99999999.99" CssClass="inputValue"></glw:CaixaNumerica>
                                        </td>
                                        <td>Valor Solicitado:<br />
                                            <glw:CaixaNumerica ID="caixaNumericaValorSolicitado" runat="server" casasDecimais="2" tipoNumerico="numero" valorMaximo="99999999.99" CssClass="inputValue" onchange="NecessitaRecalculo()"></glw:CaixaNumerica>
                                            <%--INICIO - NILTON - SOL205608 KTN198892 - 24/04/2013--%>
                                            <asp:HiddenField ID="hdfCaixaNumericaValorSolicitado" runat="server" />
                                            <%--FINAL - NILTON - SOL205608 KTN198892 - 24/04/2013--%>
                                        </td>
                                        <td>Taxa de Juros:<br />
                                            <asp:Label ID="labelTaxaJuros" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                            <asp:Label ID="labelTaxaJurosConsiderar" runat="server" Visible="false"></asp:Label>
                                            <%--William Moreira da Silva - SOL 205549 KTN 1988203--%>
                                        </td>
                                        <td>Prazo:<br />
                                            <div style="display: flex">
                                                <glw:CaixaNumericaUpDown ID="caixaNumericaPrazo" runat="server" valorMinimo="0" valorMaximo="0" onBlur="validarPrazoMaximo()" onfocus="this.oldvalue = this.value;" onchange="alteracaoDePrazo(this);this.oldvalue = this.value;" />
                                            </div>
                                            <%--INICIO - NILTON - SOL201705 KTN1950511 - 07/03/2013--%>
                                            <%--INICIO - NILTON - SOL205608 KTN198892 - 24/04/2013--%>
                                            <asp:HiddenField ID="hdfCaixaNumericaPrazo" runat="server" />
                                            <%--FINAL - NILTON - SOL205608 KTN198892 - 24/04/2013--%>

                                            <%--INICIO - NILTON - SOL201705 KTN1950511 - 07/03/2013--%>
                                            <asp:HiddenField ID="hdfPrazo" runat="server" />
                                            <asp:HiddenField ID="hdfPrazoDigitado" runat="server" />
                                            <%--FINAL- SOL201705 KTN1950511 - 07/03/2013--%>
                                        </td>
                                        <td>Prestação Básica:<br />
                                            <asp:Label ID="labelPrestacaoBasica" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                            <asp:HiddenField ID="hdfValorUltimaPrestacaoFGQC" runat="server" />                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="espacamento">Suspensão de Cobrança:<br />
                                            <asp:DropDownList ID="ListaDropDownSuspensaoCobranca" runat="server" Width="335px" AutoPostBack="true" OnSelectedIndexChanged="ListaDropDownSuspensaoCobranca_SelectedIndexChanged"></asp:DropDownList>
                                            <%--INICIO - NILTON - SOL205608 KTN198892 - 24/04/2013--%>
                                            <asp:HiddenField ID="hdfListaDropDownSuspensaoCobranca" runat="server" />
                                            <%--FINAL - NILTON - SOL205608 KTN198892 - 24/04/2013--%> 
                                        </td>
                                        <td>Parc. Suspensa:<br />
                                            <div style="display: flex">
                                                <glw:CaixaNumericaUpDown ID="caixaNumericaSuspensao" runat="server"></glw:CaixaNumericaUpDown>
                                            </div>
                                            <%--INICIO - NILTON - SOL205608 KTN198892 - 24/04/2013--%>
                                            <asp:HiddenField ID="hdfCaixaNumericaSuspensao" runat="server" />
                                            <%--FINAL - NILTON - SOL205608 KTN198892 - 24/04/2013--%>
                                        </td>
                                        <td>Término Suspensão:<br />
                                            <glw:CaixaData ID="caixaDataTerminoSuspensao" runat="server" Enabled="false" Width="65px"></glw:CaixaData>
                                            <%--INICIO - NILTON - SOL205608 KTN198892 - 24/04/2013--%>
                                            <asp:HiddenField ID="hdfCaixaDataTerminoSuspensao" runat="server" />
                                            <%--FINAL - NILTON - SOL205608 KTN198892 - 24/04/2013--%>
                                        </td>
                                        <td>Valor Parc. Suspensa:<br />
                                            <asp:Label ID="labelValorParcSuspensa" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="espacamento">Hora Encerramento:<br />
                                            <asp:Label ID="labelHoraEncerramento" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                        </td>
                                        <td>Indexador:<br />
                                            <glw:ListaDropDown ID="ListaDropDownIndexador" runat="server" Width="150px" Enabled="false"></glw:ListaDropDown>
                                        </td>
                                        <%--William Moreira da Silva - SIG27879--%>
                                        <td>Taxa de Correção:<br />
                                            <asp:Label ID="labelTxCorrecao" runat="server" CssClass="textoEstaticoNegrito" />
                                        </td>
                                        <%--William Moreira da Silva - SIG27879--%>
                                        <td>
                                            <asp:Label runat="server" ID="lblDivida" Text="Valor Dívida Previdenciária:" /><br />
                                            <glw:CaixaNumerica ID="caixaNumericaDividaPrevi" runat="server" casasDecimais="2" tipoNumerico="numero" valorMaximo="99999999.99"></glw:CaixaNumerica>
                                            <%--INICIO - NILTON - SOL205608 KTN198892 - 24/04/2013--%>
                                            <asp:HiddenField ID="hdfCaixaNumericaDividaPrevi" runat="server" />
                                            <%--FINAL - NILTON - SOL205608 KTN198892 - 24/04/2013--%>
                                        </td>
                                        <%-- INICIO - Jessica Y. Oshiro -SOL 225057/18141 PPM 1315874 --%>
                                        <%--                                        <td>&nbsp;
                                        </td>--%>
                                        <td>FGQC Base: 
                                            <br />
                                            <asp:Label ID="labelFGQCBase" runat="server" CssClass="textoEstaticoNegrito" />
                                        </td>
                                        <%-- FIM - Jessica Y. Oshiro - SOL 225057/18141 PPM 1315874 --%>

                                         <%-- SIG 128871 - Criação do label para exibir o valor do desconto calculado --%>
                                        <td>Desc. FGQC: 
                                            <br />
                                            <asp:Label ID="labelDescFGQCBase" runat="server" CssClass="textoEstaticoNegrito" />
                                        </td>
                                    </tr>																		
                                    <tr>
                                        <td colspan="2">
                                            <div id="divPainelFH" style="display: none" runat="server">
                                                <div style="display: flex">
                                                    <asp:Panel ID="panelFH" GroupingText="Financiamento Habitacional" runat="server">
                                                        <div>
                                                            <asp:RadioButtonList runat="server" ID="rblTipoFH" TextAlign="Right" RepeatDirection="Horizontal">
                                                                <asp:ListItem Text="Quitação" Selected="True"></asp:ListItem>
                                                                <asp:ListItem Text="Amortização"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </div>
                                                        <div style="margin-top: 10px">
                                                            Valor:
                                                            <glw:CaixaNumerica ID="caixaNumericaFH" runat="server" casasDecimais="2" tipoNumerico="numero" valorMaximo="99999999.99" CssClass="inputValue" onchange="NecessitaRecalculo()">0,00</glw:CaixaNumerica>
                                                        </div>
                                                    </asp:Panel>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
<%--									<tr>
                                        <td colspan="5" style="text-align: right;">                                           
                                            <glw:BotaoAcao ID="BotaoAcaoAbrirRenegociacao" runat="server" 
                                                urlDaImagem="~/Imagens/imgCalculadora.PNG" Text="Valor a amortizar" 
                                                OnClientClick="return abrirRenegociacao();">
                                            </glw:BotaoAcao>                                            
                                        </td>
                                    </tr>--%>
                                    <tr>
                                        <td>
                                            <asp:HiddenField ID="hdfChkbxDesconto" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="margin-top:20px">
                                            <asp:CheckBox ID="chkImpressaoContrato" runat="server" Text="Habilitar impressão de contrato de empréstimo" />
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div id="painelAbaItens" class="abaPainel">
                        <asp:UpdatePanel ID="updatePanel3" runat="server">
                            <ContentTemplate>
                                <table cellpadding="0" cellspacing="0" class="tableSecao">
                                    <tr class="espacamento">
                                        <td>
                                            <glw:Grid ID="gridItens" runat="server" Width="100%">
                                                <Columns>
                                                    <glw:CampoLimitado DataField="descricao" HeaderText="Item" />
                                                    <asp:TemplateField HeaderText="Valor" ItemStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <div class="valorNumericoGrid">
                                                                <span>
                                                                    <%# DataBinder.Eval(Container.DataItem, "valor", "{0:N2}")%></span>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </glw:Grid>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div id="painelAbaIntegracao" class="abaPainel">
                        <asp:UpdatePanel ID="updatePanel4" runat="server">
                            <ContentTemplate>
                                <table cellpadding="0" cellspacing="0" class="tableSecao">
                                    <tr>
                                        <td class="espacamento">
                                            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                <tr>
                                                    <td class="espacamento">
                                                        <table cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td colspan="2" class="espacamento">
                                                                    <a class="textoEstatico">Conta</a><br />
                                                                    <glw:Grid ID="gridIntegracaoCredito" runat="server" Width="850px" DataKeyNames="id">
                                                                        <Columns>
                                                                            <glw:CampoCheckBoxSelecao />
                                                                            <glw:CampoLimitado DataField="nomeBanco" HeaderText="Banco" />
                                                                            <glw:CampoLimitado DataField="agencia" HeaderText="Agência" />
                                                                            <glw:CampoLimitado DataField="contaCorrente" HeaderText="Conta Corrente" />
                                                                        </Columns>
                                                                    </glw:Grid>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>Forma Pagamento:<br />
                                                                    <glw:ListaDropDown ID="caixaSelecaoFormaPagamento" runat="server" Width="250px">
                                                                    </glw:ListaDropDown>
                                                                </td>
                                                                <td>Conta-Caixa x Forma Pagamento:<br />
                                                                    <glw:ListaDropDown ID="caixaSelecaoContaCaixaFormaPagamento" runat="server" Width="250px">
                                                                    </glw:ListaDropDown>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <table cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td align="left">Conta-Caixa x Forma Recebimento:<br />
                                                                    <glw:ListaDropDown ID="caixaSelecaoContaCaixaFormaRecebimento" runat="server" Width="250px">
                                                                    </glw:ListaDropDown>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div id="painelAbaDividasEmprestimo" class="abaPainel noPadding">
                        <asp:UpdatePanel ID="updatePanel5" runat="server">
                            <ContentTemplate>
                                <table cellpadding="0" cellspacing="0" class="tableSecao">
                                    <tr>
                                        <td class="espacamento">
                                            <glw:Grid ID="gridDividasEmprestimo"
                                                runat="server"
                                                Width="900px"
                                                DataKeyNames="numero"
                                                AllowSorting="false"
                                                OnRowDataBound="gridDividasEmprestimo_RowDataBound"
                                                OnRowCommand="gridDividasEmprestimo_RowCommand">
                                                <Columns>
                                                    <glw:CampoCheckBoxSelecao OnalterarCheckBox="campo_CheckedChanged" />
                                                    <glw:CampoLimitado DataField="numero" HeaderText="Contrato" />
                                                    <glw:CampoEntidadeComplexa DataField="tipo.descricao" HeaderText="Tipo Contrato" />
                                                    <asp:TemplateField HeaderText="Vlr. Contrato" ItemStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <div class="campoDataGrid">
                                                                <span>
                                                                    <%# DataBinder.Eval(Container.DataItem, "valorContrato", "{0:N2}")%></span>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Dt. Crédito" ItemStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <div class="campoDataGrid">
                                                                <span>
                                                                    <%# DataBinder.Eval(Container.DataItem, "dataCredito", "{0:dd/MM/yyyy}")%></span>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <glw:CampoLimitado DataField="totalParcelas" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"
                                                        HeaderText="Prazo" />
                                                    <asp:TemplateField HeaderText="Parcela" ItemStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <div class="valorNumericoGrid">
                                                                <span>
                                                                    <%# DataBinder.Eval(Container.DataItem, "valorParcela", "{0:N2}")%>&nbsp;</span>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Saldo Devedor" ItemStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <div class="valorNumericoGrid">
                                                                <span>
                                                                    <%# DataBinder.Eval(Container.DataItem, "saldoDevedor", "{0:N2}")%>&nbsp;</span>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Pendências" ItemStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <div class="valorNumericoGrid">
                                                                <span>
                                                                    <%# DataBinder.Eval(Container.DataItem, "valorEmAberto", "{0:N2}")%>&nbsp;</span>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <glw:CampoLimitado DataField="parcelasPagas" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"
                                                        HeaderText="Pagas" />
                                                    <asp:TemplateField HeaderText="Vlr. a Quitar" ItemStyle-HorizontalAlign="Right" ItemStyle-VerticalAlign="Middle">
                                                        <ItemTemplate>
                                                            <div class="valorNumericoGrid">
                                                                <span>
                                                                    <%# DataBinder.Eval(Container.DataItem, "valorAQuitar", "{0:N2}")%>&nbsp;</span>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:ButtonField ButtonType="Button" HeaderImageUrl="~/Imagens/Desconto_fazul.png" ControlStyle-Font-Size="X-Small" Text="Ver" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center"></asp:ButtonField>
                                                </Columns>
                                            </glw:Grid>
                                            <glw:CampoOculto ID="hdfContratosDividasEmprestimo" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 100%; margin-right: 10px; padding-top: 16px">Valor total para quitação do(s) contrato(s) anterior(es):
                                            <asp:Label ID="labelValorTotalQuitacaoContratoAnterior" runat="server" CssClass="textoEstaticoNegrito" Style="margin-left: 5px;"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 100%; margin-right: 10px; padding-top: 5px">Valor total dos descontos:
                                            <asp:Label ID="labelValorTotalDescontos" runat="server" CssClass="textoEstaticoNegrito" Style="margin-left: 5px;"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div id="painelAbaBeneficiariosSeguro" class="abaPainel">
                        <asp:UpdatePanel ID="updatePanel6" runat="server">
                            <ContentTemplate>
                                <table cellpadding="0" cellspacing="0" class="tableSecao">
                                    <tr class="espacamento">
                                        <td>
                                            <glw:Grid ID="gridBeneficiariosSeguro" runat="server" Width="850px" DataKeyNames="nome"
                                                AllowSorting="true">
                                                <Columns>
                                                    <glw:CampoLimitado DataField="nome" HeaderText="Nome" />
                                                    <glw:CampoLimitado DataField="percentual" HeaderText="Indenização(%)" />
                                                    <glw:CampoEntidadeComplexa DataField="dadosBancarios.banco" HeaderText="Banco" />
                                                    <glw:CampoEntidadeComplexa DataField="dadosBancarios.agencia" HeaderText="Agência" />
                                                    <glw:CampoEntidadeComplexa DataField="dadosBancarios.contaCorrente" HeaderText="Conta Corrente" />
                                                    <glw:CampoLimitado DataField="outrasInformacoes" HeaderText="Outras Informações" />
                                                </Columns>
                                            </glw:Grid>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div id="painelAbaOutrasDividas" class="abaPainel">
                        <asp:UpdatePanel ID="updatePanel7" runat="server">
                            <ContentTemplate>
                                <div class="espacamento" style="height: 150px; position: relative; top: 0px; left: 0px; width: 865px; overflow: scroll;">
                                    <glw:Grid ID="gridOutrasDividas" runat="server" Width="850px" DataKeyNames="tipo" PageSize="1000"
                                        AllowSorting="true" HeaderStyle-CssClass="barraFixa" OnPageIndexChanging="gridOutrasDividas_PageIndexChanging">
                                        <Columns>
                                            <glw:CampoCheckBoxSelecao />
                                            <glw:CampoEntidadeComplexa DataField="tipo" HeaderText="Tipo de Dívida" />
                                            <glw:CampoEntidadeComplexa DataField="parcela" HeaderText="Parcela" />
                                            <glw:CampoEntidadeComplexa DataField="mesReferencia" HeaderText="Mês Referência" />
                                            <glw:CampoEntidadeComplexa DataField="mesCobranca" HeaderText="Mês de Cobrança" />
                                            <glw:CampoEntidadeComplexa DataField="dataPrevista" HeaderText="Data Prevista" />
                                            <glw:CampoEntidadeComplexa DataField="valorCalculado" HeaderText="Valor" DataFormatString="{0:N2}" ItemStyle-CssClass="text-align-right" />
                                        </Columns>
                                    </glw:Grid>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>

                    <div id="painelAbaOutrasInformacaoes" class="abaPainel">
                        <div id="recipienteAbaContratoSecundario">
                            <ul>
                                <li><a href="#painelAbaAvalista">Fiadores</a></li>
                            </ul>
                            <div id="painelAbaAvalista">
                                <asp:UpdatePanel ID="updatePanel9" runat="server">
                                    <ContentTemplate>
                                        <table cellpadding="0" cellspacing="0" class="tableSecao">
                                            <tr>
                                                <td>
                                                    <glw:BotaoAcao ID="botaoIncluirAvalista" runat="server" Text="Incluir" urlDaImagem="~/Imagens/imgInserir.png" OnClientClick="ExibirIncluirFiador(); return false;" />
                                                    <glw:BotaoAcao ID="botaoExcluirAvalista" runat="server" Text="Excluir" urlDaImagem="~/Imagens/imgExcluir.png" OnClick="botaoExcluirAvalista_Click" />

                                                    <glw:CampoOculto runat="server" ID="hdnRetorno" />
                                                    <glw:CampoOculto runat="server" ID="hdnRetornoIdPessoa" />
                                                </td>
                                                <td style="text-align: right">
                                                    <glw:BotaoAcao ID="botaoNovoAvalista" runat="server" Text="Cadastrar" urlDaImagem="~/Imagens/imgAdd.gif" OnClick="botaoNovoAvalista_Click" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <glw:Grid ID="gridAvalista" runat="server" Width="850px" DataKeyNames="id" AllowSorting="true" OnRowDataBound="gridAvalista_RowDataBound">
                                                        <Columns>
                                                            <glw:CampoEntidadeComplexa DataField="id" HeaderText="Avalista" Visible="false" />
                                                            <%--<glw:CampoCheckBoxSelecao  />--%>
                                                            <asp:TemplateField>
                                                                <HeaderStyle CssClass="text-align" />
                                                                <%--                                                                                    <HeaderTemplate>
                                                                                    <asp:CheckBox ID="CheckBoxButton" CssClass="chk-cabecalho-assistidos" runat="server" />
                                                                                </HeaderTemplate>--%>
                                                                <ItemStyle CssClass="text-align" />
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="CheckBoxButton" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <glw:CampoEntidadeComplexa DataField="nome" HeaderText="Nome" />
                                                            <%--William Oliveira - Defect Log 199759 - Inicio--%>
                                                            <glw:CampoEntidadeComplexa DataField="renda" HeaderText="Renda" DataFormatString="{0:N2}" ItemStyle-CssClass="text-align-right" />
                                                            <glw:CampoEntidadeComplexa DataField="margem" HeaderText="Margem" DataFormatString="{0:N2}" ItemStyle-CssClass="text-align-right" />
                                                            <glw:CampoEntidadeComplexa DataField="nomeConjugue" HeaderText="Nome do Cônjuge" />

                                                            <%--William Moreira da Silva - SOL 143476/16437--%>
                                                            <asp:TemplateField HeaderText="Cônjuge">
                                                                <ItemStyle CssClass="text-align-center" />
                                                                <ItemTemplate>
                                                                    <glw:BotaoAcao ID="botaoIncluirConjuge" runat="server" urlDaImagem="~/Imagens/imgInserir.png" Visible="true" OnClick="botaoIncluirConjuge_Click" />
                                                                    <glw:BotaoAcao ID="botaoExcluirConjuge" runat="server" urlDaImagem="~/Imagens/imgExcluir.png" Visible="false" OnClick="botaoExcluirConjuge_Click" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <%--William Oliveira - Defect Log 199759 - Fim--%>
                                                        </Columns>
                                                    </glw:Grid>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <asp:UpdatePanel ID="updatePanel12" runat="server">
                                <ContentTemplate>
                                    <div id="divIncluirFiador" class="sessaoFormulario" style="display: none">
                                        <table cellpadding="0" cellspacing="0" border="0" class="secoesFormulario">
                                            <tr>
                                                <td>
                                                    <glw:SecaoFormulario ID="incluirFiador" tituloSecao="Filtros da Busca" expandeContraiSecao="true" runat="server">
                                                        <div class="itemFormulario">
                                                            Nome:
                                                        <glw:CaixaTexto ID="caixaTextoNome" runat="server" Width="300px" MaxLength="60"></glw:CaixaTexto>
                                                            <div>
                                                                <glw:ValidadorFiltroPesquisa ID="filtroNome" ControlToValidate="caixaTextoNome" nomeCampo="Nome" ValidationGroup="emprestimoIncluirFiador" runat="server"></glw:ValidadorFiltroPesquisa>
                                                            </div>
                                                            <div>
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator" runat="server" ControlToValidate="caixaTextoNome" ValidationExpression="[A-Z a-z]*" ErrorMessage="Nome contém caracteres inválidos." Text="Caracteres inválidos." SetFocusOnError="true" Display="Dynamic" ValidationGroup="emprestimoIncluirFiador"></asp:RegularExpressionValidator>
                                                            </div>
                                                        </div>
                                                        <div class="itemFormulario">
                                                            Razão social:
                                                        <glw:CaixaTexto ID="caixaTextoRazaoSocial" runat="server" Width="100px" MaxLength="60"></glw:CaixaTexto>
                                                            <asp:DropDownList runat="server" ID="comboLike"></asp:DropDownList>
                                                        </div>
                                                        <div class="itemFormulario">
                                                            CPF ou CNPJ:
                                                        <glw:CaixaTexto ID="caixaTextoCPF" runat="server" Width="150px" MaxLength="14"></glw:CaixaTexto>
                                                            <div>
                                                                <glw:ValidadorFiltroPesquisa ID="filtroCPF" ControlToValidate="caixaTextoCPF" nomeCampo="CPF" ValidationGroup="emprestimoIncluirFiador" runat="server"></glw:ValidadorFiltroPesquisa>
                                                            </div>
                                                            <div>
                                                                <asp:RegularExpressionValidator ID="validadorCPF" runat="server" ControlToValidate="caixaTextoCPF" ValidationExpression="[0-9]*" ErrorMessage="O CPF contém caracteres inválidos." Text="Caracteres inválidos." SetFocusOnError="true" Display="Dynamic" ValidationGroup="emprestimoIncluirFiador"></asp:RegularExpressionValidator>
                                                            </div>
                                                        </div>
                                                        <div class="botoesFormulario">
                                                            <glw:BotaoProcurar ID="botaoProcurarFiador" runat="server" ValidationGroup="emprestimo" OnClick="botaoProcurarFiador_Click" permissoesExigidas="" Style="padding-top: 10px;"></glw:BotaoProcurar>
                                                        </div>
                                                        <div>
                                                            <asp:CustomValidator ID="validadorFiltros" runat="server" Display="Dynamic" ErrorMessage="Selecione ao menos um filtro." ClientValidationFunction="validarFiltros" ValidationGroup="emprestimoIncluirFiador"></asp:CustomValidator>
                                                        </div>
                                                        <table cellpadding="" cellspacing="0" border="0" width="100%">
                                                            <tr style="padding-bottom: 10px;">
                                                                <td class="posSecaoFormulario" style="text-align: center;">
                                                                    <div style="height: 120px; overflow: auto;">
                                                                        <glw:Grid ID="gridIncluirAvalista" runat="server" Width="850px" DataKeyNames="CPF"
                                                                            AllowSorting="true" OnRowDataBound="gridProcuraAvalista_RowDataBound" Style="overflow: scroll;"
                                                                            OnSelectedIndexChanged="gridProcuraAvalista_SelectedIndexChanged">
                                                                            <Columns>
                                                                                <glw:CampoLinkLimitado DataTextField="CPF" HeaderText="CPF" ItemStyle-CssClass="link" tamanhoMaximo="60" permissoesExigidas="consultar" />
                                                                                <glw:CampoLimitado DataField="nome" HeaderText="Nome" />
                                                                                <glw:CampoLimitado DataField="razaoSocial" HeaderText="Razao Social" />
                                                                                <glw:CampoLimitado DataField="id" HeaderText="Avalista" Visible="false" />
                                                                                <glw:CampoLimitado DataField="idConjugue" HeaderText="Avalista" Visible="false" />
                                                                            </Columns>
                                                                        </glw:Grid>
                                                                    </div>
                                                                    <asp:ObjectDataSource ID="dataSourceAvalista" runat="server" SelectMethod="consultarAvalista"
                                                                        TypeName="FUNCEF.Planus.WebEmprestimo.Web.Proxies.ProxyAvalista" SortParameterName="ordenacao"
                                                                        StartRowIndexParameterName="indiceLinha" MaximumRowsParameterName="maximoLinhas"
                                                                        SelectCountMethod="totalAvalista" OnSelecting="dataSourceAvalista_Selecting"
                                                                        EnablePaging="true" EnableCaching="false">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter Name="nomeAvalista" ControlID="caixaTextoNome" PropertyName="Text" Direction="Input" Type="String" />
                                                                            <asp:ControlParameter Name="razaoSocial" ControlID="caixaTextoRazaoSocial" PropertyName="Text" Direction="Input" Type="String" />
                                                                            <asp:ControlParameter Name="cpf" ControlID="caixaTextoCPF" PropertyName="Text" Direction="Input" Type="String" />
                                                                            <asp:ControlParameter Name="instrucaoLike" ControlID="comboLike" PropertyName="SelectedValue" Direction="Input" Type="String" />
                                                                        </SelectParameters>
                                                                    </asp:ObjectDataSource>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </glw:SecaoFormulario>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>Saldo a Quitar:<br />
                <asp:UpdatePanel ID="updatePanel8" runat="server">
                    <ContentTemplate>
                        <asp:Label ID="labelSaldoQuitar" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
						<%--Darivaldo Alencar SIG21529 inicio--%>
                        <asp:HiddenField ID="hdflabelSaldoQuitar" runat="server" />
                        <%--Darivaldo Alencar SIG21529 fim--%>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td>Outros Descontos:<br />
                <asp:UpdatePanel ID="updatePanel10" runat="server">
                    <ContentTemplate>
                        <asp:Label ID="labelOutrosDescontos" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td>Valor Líquido:<br />
                <asp:UpdatePanel ID="updatePanel11" runat="server">
                    <ContentTemplate>
                        <asp:Label ID="labelLiquidoGeral" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>

        </tr>
    </table>
    <%--NILTON 17/01/13--%>
    <%--  </ContentTemplate>
   </asp:UpdatePanel>--%>
    <%--NILTON 17/01/13--%>
    <%--   <asp:Panel ID="panelUpdateProgress" runat="server" CssClass="updateProgress">
        <asp:UpdateProgress ID="UpdateProg1" DisplayAfter="0" runat="server">
            <ProgressTemplate>
                <div style="position: relative; top: 30%; text-align: center;">
                    <img src="../../../Imagens/loading.gif" style="vertical-align: middle" alt="Calculando" />
                    Calculando ...
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </asp:Panel>
    <ajaxToolkit:ModalPopupExtender ID="ModalProgress" runat="server" TargetControlID="panelUpdateProgress"
        BackgroundCssClass="modalBackground" PopupControlID="panelUpdateProgress" />--%>
    <%--NILTON 17/01/13--%>    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ConteudoBotoesAcao" runat="server">
    <asp:UpdatePanel ID="updatePanel2" runat="server">
        <ContentTemplate>
            <%--William Moreira da Silva - SOL 235732--%>
            <glw:BotaoAcao ID="botaoCalcular" runat="server" urlDaImagem="~/Imagens/imgCalculadora.PNG" Text="Calcular" OnClick="botaoCalcular_Click"></glw:BotaoAcao>
            <%--Text="Calcular" OnClick="botaoCalcular_Click" OnClientClick="javascript:precisaRecalcular=false;"></glw:BotaoAcao>--%>
            <%--William Moreira da Silva - SOL 235732--%>
            <%-- Petri Nocentini SOL 143476/16437 PPM 491462--%>
            <glw:BotaoAcao ID="BotaoImprimir" runat="server" urlDaImagem="~/Imagens/imgImprimir.PNG" Text="Imprimir" OnClick="BotaoImprimir_Click"></glw:BotaoAcao>
            <glw:BotaoAcao Visible="false" ID="botaoSimulacao" runat="server" urlDaImagem="~/Imagens/imgCalculadora.PNG" Text="Simulação"></glw:BotaoAcao>
            <%--William Moreira da Silva - SOL 205807 KTN 1989865 - Mudança na permissão do botão contratarEP--%>
            <glw:BotaoAcao ID="botaoContratarEp" runat="server" urlDaImagem="~/Imagens/imgContratarEP.png" permissoesExigidas="incluir" Text="Contratar EP" OnClick="botaoContratarEp_Click" OnClientClick="javascript:return confirmarContrarEp(this);"></glw:BotaoAcao>
            <glw:BotaoVoltar ID="botaoVoltar" runat="server" urlVoltar="Listagem.aspx" permissoesExigidas="mascaraVazia"></glw:BotaoVoltar>
            <glw:BotaoSair ID="botaoSair" runat="server" permissoesExigidas="mascaraVazia"></glw:BotaoSair>
            <glw:BotaoOculto ID="botaoOcultoContinuarContratacaoEP" runat="server" OnClick="botaoOcultoContinuarContratacaoEP_Click" />
            <%--WILLIAM MOREIRA DA SILVA - SOL 214086 KTN 2043803--%>
            <glw:BotaoOculto ID="botaoOcultoContinuarContratacaoEP1" runat="server" OnClientClick="javascript:return confirmarVerificarSuspensaoAnterior();" OnClick="botaoOcultoContinuarContratacaoEP1_Click" />
            <glw:BotaoOculto ID="botaoOcultoPopupInputRegra" runat="server" />
            <glw:BotaoOculto ID="botaoOcultoPopupAvalista" runat="server" />
            <%--SOL 199759--%>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(function () {

            var html = '<div id="dialog"><div id="progresso"></div></div><div id="mensagem"></div>';

            $.blockUI({ message: html, css: { border: '1px dotted grey' } });

            var time = setInterval(function () {

                $.ajax({
                    type: 'POST',
                    url: 'Progresso.ashx',
                    success: function (result) {
                        //if (result == "100") {
                        //   clearInterval(time);
                        //    $.unblockUI();
                        //}

                        var i = 0;
                        var valores = result;
                        var a = valores.split(".");
                        //a[0] Porcentagem
                        //a[1] Total de regras
                        //a[2] Regras Processadas
                        //a[3] Total de Itens
                        //a[4] Itens Processados
                        if (a[0] == "100") {
                            clearInterval(time);
                            $.unblockUI();
                        }

                        var porcentagem = parseInt(a[0]);
                        //alert('Porcentagem'+a[0]+' Total Itens'+a[3]+' Regra Atual'+a[2]);
                        //var porcentagem = result;
                        //alert(porcentagem);
                        if (porcentagem > 5 && porcentagem < 91 && a[1] > 0) {
                            //if(a[3] == 0)
                            //{
                            $('#progresso').progressbar({ value: porcentagem });
                            //$('#mensagem').block({message: porcentagem+'%', css:{border:'1px dotted grey'}});
                            $('#mensagem').block({ message: 'Calculando ' + a[2] + ' de ' + a[1], css: { border: '1px dotted grey', width: '250px' } });
                            //}
                            //else
                            //{
                            //    $('#progresso').progressbar({ value: porcentagem});                        
                            //$('#mensagem').block({message: porcentagem+'%', css:{border:'1px dotted grey'}});
                            //    $('#mensagem').block({message: 'Calculando itens '+a[4]+' de '+a[3], css:{border:'1px dotted grey', width:'250px'}});
                            //}
                        }
                        else {
                            $('#progresso').progressbar({ value: porcentagem });
                        }
                    },
                    error: function () {
                        clearInterval(time);
                        alert("houve um erro");
                    }
                });

            }, 1000);
        });
    </script>          
</asp:Content>
