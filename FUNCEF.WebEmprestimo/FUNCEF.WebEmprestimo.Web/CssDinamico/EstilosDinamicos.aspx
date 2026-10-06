<%@ Page ContentType="text/css" Language="C#" EnableTheming="false" Theme="" StylesheetTheme="" EnableViewState="false"  %>
<%@ Import Namespace="FUNCEF.Planus.GlobalWeb.Web.IU" %>
body { 
    background-color: <%= EstiloConfiguravel.obterCorConfiguravel(TagCores.fundoAplicacao) %>; 
    padding: 0px 0px 0px 0px;
    margin: 0px 0px 0px 0px;
    color: Black;
    font-family: Arial, Helvetica, Sans-Serif !important;
    font-size: 10pt !important; 
} 

/* Caixas de texto */ 
.caixaTexto { 
    font-family: Arial, Sans-Serif; 
    font-size: 10pt; 
    color: Black; 
    <%= EstiloConfiguravel.obterCorBordaConfiguravel() %>;
    padding-left: 3px;
}

/* Caixas de texto login */ 
.caixaTextoLogin { 
    font-family: Arial, Sans-Serif; 
    font-size: 10pt; 
    color: Black; 
    border: solid 1px rgb(194, 194, 194); 
    background-color: <%= EstiloConfiguravel.obterCorConfiguravel(TagCores.fundoLogin) %>;
    padding-left: 3px;
}

/* Cabeçalho estático */
.dadosCabecalho {
	color: rgb(82,106,142);
    font-family: Arial, Helvetica, Sans-Serif;
    font-size: 11pt;
    top: 100px;
}

/* Tabelas */
.tabelaTopo {
    background-image: url(<%= EstiloConfiguravel.obterImagemConfiguravel(TagImagem.fundoCabecalho).Replace("~","..") %>);
    background-repeat: repeat-x;
    width: 100%;
}

.tableSecao
{
    padding: 3px 3px 3px 10px;
    border: solid 1px silver;
    border-left: none;
    border-right: none;
    border-top: none;
    width: 100%;
}

.tableSecao tbody tr td
{
    vertical-align:top;
}

.tabelaConteudo {
    width: 900px;
    border: solid 1px rgb(194, 194, 194);
    background-color: rgb(251, 251, 251);
    border-collapse: collapse;
    padding: 0px 0px 0px 0px;
    font-family: Arial;
    font-weight: none;
    font-size: 12px;
}

.tabelaConteudoEnvio {
    width: 650px;
    border: solid 1px rgb(194, 194, 194);
    background-color: rgb(251, 251, 251);
    border-collapse: collapse;
    padding: 0px 0px 0px 0px;
    font-family: Arial;
    font-weight: none;
    font-size: 12px;
}

.tabelaConteudoGrade {
    width: 750px;
    background-color: rgb(240, 240, 240);
    padding: 3px 3px 3px 10px;
    border: solid 1px silver;
    border-left: none;
    border-top: none;
    font-family: Arial;
    font-weight: none;
    font-size: 12px;
    height: 20px;
}

.tabelaConteudoModulo
{
    background-color:rgb(240, 240, 240) !important;
    padding: 3px 3px 3px 10px;
    border: solid 1px silver;
    border-left: none;
    border-top: none;
    font-family: Arial;
    font-weight: none;
    font-size: 12px;
}

.tabelaParametros
{
    background-color: silver;
}

.tabelaParametros tbody tr td
{
    background-color: rgb(251, 251, 251);
    padding: 2px 1px 2px 3px;
}

.tabelaGrid {
}

.tabelaGrid a {
    color: #004b9c;
}

.tabelaGrid a:hover {
    color: #f08c00;
}

.tabelaGrid td, th {
    font-family: Arial, Sans-Serif;
    font-size: 10pt;
    color: Black;
    border: solid 1px rgb(215, 215, 215);
    /*text-align: left;*/
    padding-left: 5px;
}

.cabecalhoTabelaGrid {
    text-align: center !important;
    background-color: <%= EstiloConfiguravel.obterCorConfiguravel(TagCores.cabecalhoTabelaGrid) %>;
}

.cabecalhoTabelaGrid th {
    text-align: center !important;
}

.cabecalhoTabelaGrid th a {
    text-align: center !important;
}

.cabecalhoTabelaGrid a {
    text-decoration: none;
    color: Black !important;
}

.linhaGrid td {
    background-color: <%= EstiloConfiguravel.obterCorConfiguravel(TagCores.fundoTabela) %>;
}

.linhaGridAlternada td {
   background-color: <%= EstiloConfiguravel.obterCorConfiguravel(TagCores.tabelaGridAlterna) %>;
}

.rodapeGrid {
    background-image: url(../Imagens/imgAbas.gif);
    background-repeat: repeat-x;
}

.rodapeGrid td {
    text-align: center !important;
    margin: 0 0 0 0;
    padding: 0 0 0 0;
}

.rodapeGrid td table tr td {
    border: none;
    padding: 0 3px 0 3px;
}

.rodapeGrid a {
    text-decoration: none;
}

.rodapeGrid span {
    font-weight: bold;
}

.divGrid {
    width: 797px;
    height: 200px;
}

.divGrid th {
    position: relative;
}

.divGrid tr {
    height: 0px;
}

.celulaExclusao {
    text-align: center !important;
    width: 47px;
}

.celulaSelecao {
    text-align: center !important;
    width: 47px;
}

.valorNumericoGrid {
    width: 100%;
    text-align: right;
    /*padding-right: 4px;*/
}

.campoDataGrid {
    width: 100%;
    text-align: center;
    /*padding-right: 4px;*/
}

/* Classes da Seção de Formulário */
.tituloSecao {
    font-family: Arial, Helvetica, Sans-Serif;
    font-weight: bold;
    font-size: 12px;
    color: rgb(82,106,142);
    text-decoration: none;
    color: <%= EstiloConfiguravel.obterFonteConfiguravel(TagFontes.corTituloInterno) %>;
    font-family: <%= EstiloConfiguravel.obterFonteConfiguravel(TagFontes.tituloInterno) %>;
    font-weight: <%= EstiloConfiguravel.obterEstiloNegritoConfiguravel(TagFontes.estiloTituloInterno) %>;
    font-style: <%= EstiloConfiguravel.obterEstiloItalicoConfiguravel(TagFontes.estiloTituloInterno)%>;
    text-decoration: <%= EstiloConfiguravel.obterEstiloSublinhadoConfiguravel(TagFontes.estiloTituloInterno)%>;
    font-size: <%= EstiloConfiguravel.obterFonteConfiguravel(TagFontes.tamanhoTituloInterno) %>px;
}

.secoesFormulario {
    width: 100%;
}

.posSecaoFormulario {
    border-top: solid 1px rgb(215, 215, 215);
    padding-top: 10px;
}

/*Classes de erro */
.mensagemErro {
    font-family: Arial, Helvetica, Sans-Serif;
	font-weight: bold;
	font-size: 10pt;
	color: #FF0000;
}

/* Classes de botão */
.botaoAcao {
	font-family: Arial, Helvetica, Sans-Serif;
	font-weight: bold;
	font-size: 12px;
	color: rgb(69,71,84);
	text-decoration: none;
	padding: 0px 7px 0px 7px;
    border: none;
}

.botaoPadrao, 
.botaoReajuste {
    height: 25px;
    background-color: White;
    border: solid 1px rgb(215, 215, 215);
    font-family: Arial, Helvetica, Sans-Serif;
    font-size: 11px;
    text-decoration: none;
    text-align: center;
    cursor: hand;
}

.botaoPadrao:hover {
    background-color: rgb(242, 242, 242);
    color: black;
}

.botaoPadrao {
    padding: 2px 6px 2px 6px;
    color: black;
}

.botaoReajuste {
    padding: 0px 6px 0px 6px;
    color: #004b9c;
}

.botaoReajuste:hover {
    background-color: rgb(242, 242, 242);
    color: #f08c00;
}

/* Abas */
.Abas {
    background-color: rgb(251, 251, 251);
    background-image: url(../Imagens/imgAbas.gif);
    background-repeat: repeat-x;
    text-align: left !important;
    cursor: hand !important;
    vertical-align: top !important;
    margin: 0 0 0 0 !important;
    padding: 5px !important;
    color: <%= EstiloConfiguravel.obterFonteConfiguravel(TagFontes.corAbaAtiva) %> !important;
    font-family: <%= EstiloConfiguravel.obterFonteConfiguravel(TagFontes.abaInativa) %>;
    font-weight: <%= EstiloConfiguravel.obterEstiloNegritoConfiguravel(TagFontes.estiloAbaInativa) %>;
    font-style: <%= EstiloConfiguravel.obterEstiloItalicoConfiguravel(TagFontes.estiloAbaInativa)%>;
    text-decoration: <%= EstiloConfiguravel.obterEstiloSublinhadoConfiguravel(TagFontes.estiloAbaInativa)%> !important;
    font-size: <%= EstiloConfiguravel.obterFonteConfiguravel(TagFontes.tamanhoAbaInativa) %>px;
}

.AbaAtiva {
    background-color: rgb(251, 251, 251);
    background-image: url(../Imagens/imgAbas.gif);
    background-repeat: repeat-x;
    text-align: left !important;
    cursor: hand !important;
    vertical-align: top !important;
    margin: 0 0 0 0 !important;
    padding: 5px !important;
    color: <%= EstiloConfiguravel.obterFonteConfiguravel(TagFontes.corAbaAtiva) %> !important;
    font-family: <%= EstiloConfiguravel.obterFonteConfiguravel(TagFontes.abaAtiva) %>;
    font-weight: <%= EstiloConfiguravel.obterEstiloNegritoConfiguravel(TagFontes.estiloAbaAtiva) %>;
    font-style: <%= EstiloConfiguravel.obterEstiloItalicoConfiguravel(TagFontes.estiloAbaAtiva)%>;
    text-decoration: <%= EstiloConfiguravel.obterEstiloSublinhadoConfiguravel(TagFontes.estiloAbaAtiva)%> !important;
    font-size: <%= EstiloConfiguravel.obterFonteConfiguravel(TagFontes.tamanhoAbaAtiva) %>px;
}

/* Alerta */
.textoAlerta
{
    font-family: Arial, Sans-Serif;
    font-size: 11pt;
    font-weight: bold;
    color: #526a8e;
}

/* Campos de formulário */
.camposMensagem {
    font-family: Arial, Sans-Serif;
    font-size: 10pt;
    color: Black;
}

.camposTelaInicial {
    font-family: <%= EstiloConfiguravel.obterFonteConfiguravel(TagFontes.corTelaInicial) %> !important;
    font-family: <%= EstiloConfiguravel.obterFonteConfiguravel(TagFontes.telaInicial) %>;
    font-weight: <%= EstiloConfiguravel.obterEstiloNegritoConfiguravel(TagFontes.estiloTelaInicial) %>;
    font-style: <%= EstiloConfiguravel.obterEstiloItalicoConfiguravel(TagFontes.estiloTelaInicial)%>;
    text-decoration: <%= EstiloConfiguravel.obterEstiloSublinhadoConfiguravel(TagFontes.estiloTelaInicial)%> !important;
    font-size: <%= EstiloConfiguravel.obterFonteConfiguravel(TagFontes.tamanhoTelaInicial) %>px;
    color: Black;
}

.separadorCampos {
    border-bottom: dashed 1px rgb(215, 215, 215);
    padding: 10px 0px 5px 0px;
}

.divTreeView {
    width: 97%; 
    height: 202px; 
    overflow-y: auto; 
    border: solid 1px rgb(215, 215, 215);
    font-family: Arial, Helvetica, Sans-Serif;
    font-size: 8pt; 
}

/* Calendario */
.calendario .ajax__calendar_container {
    border: 1px solid black;
    background-color: rgb(251, 251, 251);
}

.calendario .ajax__calendar_hover {
    color: #92D8EB;
}

.calendario .ajax__calendar_container tr td {
    border: none;
    background-color: rgb(251, 251, 251);
    font-family: Tahoma;
    font-size: 8pt; 
}

/* Menu */
.Menu-Static {
    width: 10%;
}

.MenuItem-Static {
    width: 137px;
    height: 30px;
    color: <%= EstiloConfiguravel.obterFonteConfiguravel(TagFontes.corMenu) %>;
    font-family: <%= EstiloConfiguravel.obterFonteConfiguravel(TagFontes.menu) %>;
    font-weight: <%= EstiloConfiguravel.obterEstiloNegritoConfiguravel(TagFontes.estiloMenu) %>;
    font-style: <%= EstiloConfiguravel.obterEstiloItalicoConfiguravel(TagFontes.estiloMenu) %>;
    text-decoration: <%= EstiloConfiguravel.obterEstiloSublinhadoConfiguravel(TagFontes.estiloMenu) %> !important;
    font-size: 12px;
    padding: 4px 2px 4px 8px;
    cursor: pointer !important;
    background-image: url(<%= EstiloConfiguravel.obterImagemConfiguravel(TagImagem.menu).Replace("~","..") %>);
    background-repeat: no-repeat;
    background-position: center;
    text-align: center;
    padding-right: 16px;
    padding-bottom: 0px;
}

.MenuItem-Static-Hover {
    color: <%= EstiloConfiguravel.obterFonteConfiguravel(TagFontes.corMenuSelecao) %>;
    font-family: <%= EstiloConfiguravel.obterFonteConfiguravel(TagFontes.menuSelecao) %>;
    font-size: <%= EstiloConfiguravel.obterFonteConfiguravel(TagFontes.tamanhoMenuSelecao) %>px;
    font-weight: <%= EstiloConfiguravel.obterEstiloNegritoConfiguravel(TagFontes.estiloMenuSelecao) %>;
    font-style: <%= EstiloConfiguravel.obterEstiloItalicoConfiguravel(TagFontes.estiloMenuSelecao) %>;
    text-decoration: <%= EstiloConfiguravel.obterEstiloSublinhadoConfiguravel(TagFontes.estiloMenuSelecao) %> !important;
    cursor: pointer !important;
}

.MenuItem-Dynamic {
    width: 355px;
    color: <%= EstiloConfiguravel.obterFonteConfiguravel(TagFontes.corMenu) %>;
    font-family: <%= EstiloConfiguravel.obterFonteConfiguravel(TagFontes.menu) %>;
    font-size: <%= EstiloConfiguravel.obterFonteConfiguravel(TagFontes.tamanhoMenu) %>px;
    font-weight: <%= EstiloConfiguravel.obterEstiloNegritoConfiguravel(TagFontes.estiloMenu) %>;
    font-style: <%= EstiloConfiguravel.obterEstiloItalicoConfiguravel(TagFontes.estiloMenu) %>;
    text-decoration: <%= EstiloConfiguravel.obterEstiloSublinhadoConfiguravel(TagFontes.estiloMenu) %> !important;
    padding: 4px 2px 4px 4px;
    background: <%= EstiloConfiguravel.obterCorConfiguravel(TagCores.fundoMenu) %>;
    text-align: left; /*border-collapse: collapse;*/
    border-top: none;
    border-bottom: none;
    border-left: none;
    border-right: none;
    height: 23px; /*cursor: pointer;*/
}

.MenuItem-Dynamic-Hover {
    text-align: left;
    background: <%= EstiloConfiguravel.obterCorConfiguravel(TagCores.fundoMenuSelecao) %>;
    color: <%= EstiloConfiguravel.obterFonteConfiguravel(TagFontes.corMenuSelecao) %>;
    font-family: <%= EstiloConfiguravel.obterFonteConfiguravel(TagFontes.menuSelecao) %>;
    font-size: <%= EstiloConfiguravel.obterFonteConfiguravel(TagFontes.tamanhoMenuSelecao) %>px;
    font-weight: <%= EstiloConfiguravel.obterEstiloNegritoConfiguravel(TagFontes.estiloMenuSelecao) %>;
    font-style: <%= EstiloConfiguravel.obterEstiloItalicoConfiguravel(TagFontes.estiloMenuSelecao) %>;
    text-decoration: <%= EstiloConfiguravel.obterEstiloSublinhadoConfiguravel(TagFontes.estiloMenuSelecao) %> !important;

}

.DivMenu {
    position: absolute;
    left: 0px;
    width: 890px;
    top: 125px;
    height: 25px;
}

/* Login */
.login {
    top: 210px;
    left: 400px;
    width: 335px;
    height: 166px;
    background: white;
    background-image: url(../Imagens/FundoLogin.png);
}

/* Espaçamento de Formulários */

.espacamento {
    padding-bottom: 10px;
}

/* Texto Estático */

.textoEstatico {
    font-family: Arial, Sans-Serif;
    font-size: 10pt;
    color: Black;
}

.textoEstaticoSemHyperlink {
    font-family: Arial, Sans-Serif;
    font-size: 10pt;
    color: Black;
    text-decoration:none;
    cursor:text;
}

.textoEstaticoNegrito {
    font-family: Arial, Sans-Serif;
    font-size: 10pt;
    font-weight: bold;
    color: Black;
}

.textoEstaticoVermelho {
    font-family: Arial, Sans-Serif;
    font-size: 10pt;
    font-weight: bold;
    color: Red;
}

.textoEstaticoAzul {
    font-family: Arial, Sans-Serif;
    font-size: 10pt;
    font-weight: bold;
    color: Blue;
}


/* Caixa de Cores */
.coresOk
{
    font-size: 11px;
    font-family: Arial, Helvetica, Sans-Serif;
    font-weight: bold;
    text-decoration: none;
    color: #000000;
    position: absolute;
    cursor: hand;
}
.coresOk:hover
{
}
.coresOk:visited
{
}
.coresOk:active
{
}

/* Dialogos */
.cabecalhoDialogo
{
    background: #92D8EB;
    width: 100%;
    height: 25px;
}

.cabecalhoDialogo span
{
    font-family: Arial;
    font-size: 10pt;
    color: White;
    vertical-align: middle;
    padding-left: 10px;
}

/* Carregando */
#idCarregando
{
	background: <%= EstiloConfiguravel.obterCorConfiguravel(TagCores.fundoAplicacao) %>;
	/*filter:Alpha(opacity=70);*/
	/*-moz-opacity:0.70;*/
	position:absolute;
	width:100%;
	padding-bottom:200%;
	top:1px;
	text-align:center;
}
#idCarregandoDentro
{
	position: absolute !important;
	display: block;
	background:  <%= EstiloConfiguravel.obterCorConfiguravel(TagCores.fundoAplicacao) %>; /* url(../../images/back-azul.gif)*/;
	/*border:solid 2px #859AC2*/;
	color:#000;
	left:50%;
	width: 180px;	
	height: 30px;
	margin-left:-92px;
	padding-top:4px;
	
}
#imgCarregando
{
	padding-left:20px;
	padding-right:20px;
	/*width:20px;*/
	float:left;
}
#spanCarregando
{	
	padding-top:5px;
	font-size:12px;
	display:block;
	color:#000;
	font-weight:bold;
	font-family:Verdana;
	color:#003366;
	font-size:xx-small;
	letter-spacing:1px;
}
.valoresCriticas
{
    font-family: Arial, Sans-Serif;
    font-size: 10pt;
    font-weight: bold;
    color: #526a8e;
    text-decoration: underline;
}

/* Table Parametrizar */

.tableParametrizar td, th
{
    font-family: Arial, Sans-Serif;
    font-size: 10pt;
    color: Black;
    border: solid 1px rgb(215, 215, 215);
    text-align: left;
    padding-left: 5px;
}

.headerParametrizar, .barraFixa
{
    background-color: #b9cde5;
    text-decoration: none;
    color: Black !important;
    position: relative;
}

.linhaRelatorio
{
    padding-top: 5px;
    border-top: dashed 1px silver;
}

/* Tab Panel Theme */

.abaPainel
{
	font-family: Arial, Helvetica, Sans-Serif;
	font-size: 12px;
    border-left:none !important;
    border-rigth: none !important;
    border-top: none !important;
    
}

.abaPainel li
{
	font-family: Arial, Helvetica, Sans-Serif;
	font-size: 11px;
}

.abaPainel .ajax__tab_header
{
	font-family: Arial, Helvetica, Sans-Serif;
	font-size: 11px;
	background: url("../Imagens/tab-line.gif") repeat-x bottom;
}
.abaPainel .ajax__tab_outer
{
	padding-right: 0px;
	background: url("../Imagens/tab-right.gif") no-repeat right;
	height: 21px;
}
.abaPainel .ajax__tab_inner
{
	padding-left: 3px;
	background: url("../Imagens/tab-left.gif") no-repeat;
}
.abaPainel .ajax__tab_tab
{
	height: 14px;
	padding: 5px;
	margin: 0px;
	background: url("../Imagens/tab.gif") repeat-x;
}
.abaPainel .ajax__tab_hover .ajax__tab_outer
{
	cursor: pointer;
	background: url("../Imagens/tab-hover-right.gif") no-repeat right;
}
.abaPainel .ajax__tab_hover .ajax__tab_inner
{
	cursor: pointer;
	background: url("../Imagens/tab-hover-left.gif") no-repeat;
}
.abaPainel .ajax__tab_hover .ajax__tab_tab
{
	cursor: pointer;
	background: url("../Imagens/tab-hover.gif") repeat-x;
}
.abaPainel .ajax__tab_active .ajax__tab_outer
{
	background: url("../Imagens/tab-active-right.gif") no-repeat right;
}
.abaPainel .ajax__tab_active .ajax__tab_inner
{
	background: url("../Imagens/tab-active-left.gif") no-repeat;
}
.abaPainel .ajax__tab_active .ajax__tab_tab
{
	background: url("../Imagens/tab-active.gif") repeat-x;
}
.abaPainel .ajax__tab_disabled
{
	color: #A0A0A0;
}
.abaPainel .ajax__tab_body
{
	font-family: Arial, Helvetica, Sans-Serif;
	font-size: 9pt;
	border: 1px solid #999999;
	border-top: 0;
	padding: 8px;
	background-color: #ffffff;
}

/* default layout */
.ajax__tab_default .ajax__tab_header
{
	white-space: normal !important;
}
.ajax__tab_default .ajax__tab_outer
{
	display: -moz-inline-box;
	display: inline-block;
}
.ajax__tab_default .ajax__tab_inner
{
	display: -moz-inline-box;
	display: inline-block;
}
.ajax__tab_default .ajax__tab_tab
{
	overflow: hidden;
	text-align: center;
	display: -moz-inline-box;
	display: inline-block;
}


/* scrolling */
.ajax__scroll_horiz
{
	overflow-x: scroll;
}
.ajax__scroll_vert
{
	overflow-y: scroll;
}
.ajax__scroll_both
{
	overflow: scroll;
}
.ajax__scroll_auto
{
	overflow: auto;
}

/*Ajustes para navegadores mais novos - Saulo*/

.espacamentoReduzido {
    padding-bottom: 5px;
}

.espacamentoMaior {
    padding-bottom: 15px;
} 

.tabelaCorpoPrincipal > tbody > tr > td {
    padding-bottom: 0px;
}

.inputValue {
    padding-right: 5px;
}

td {
    padding-right: 5px;
}

input {
    vertical-align: middle;
}

select {
    vertical-align: middle;
}

.aspNetDisabled {
    color: rgb(132,143,154);
}

.noPadding {
    padding: 0px;
}

.noPadding td:first-child {
    padding: 0px;
}

.paddingLeft-5 {
    padding-left: 5px;
}

.paddingLeftRight-5 {
    padding-left: 5px;
    padding-right: 5px;
}

tr > td > input[type="radio"] + label {
    vertical-align: bottom;
}

.displayNone {
    display: none;
}

img {
    border: none;
}

.sessaoFormulario {
    padding: 10px;
    margin: 10px;
    border: 1px solid #ccc;
}

.itemFormulario {
    padding-top: 1%;
    width:50%; 
    float:left;
}

.botoesFormulario {
    text-align: right;
    clear: both;
    padding-bottom: 10px;
}

.blink_me {
  animation: blinker 1s linear infinite;
}

@keyframes blinker {
  50% {
    opacity: 0.1;
  }
}