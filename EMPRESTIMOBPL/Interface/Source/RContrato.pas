Unit RContrato;

//    Sistema.TipoCliente

//    Código   Cliente
//    -------- -------
//    19971    REFER
//    19981    CBS
//    19991    FUNCEF
//    20011    BRTPREV
//    20041    VALIA

// Alterações:
//----------------------------------------------------------------------------------
// N. Chamado....: WO30535
// Dt.Alteração..: 27/01/2026
// Responsável...: Paulo Nobre
// Descrição.....: na qryHistMov, inclusão de join com histmovemptmo para trazer a
//                 data de vencimento correta do item nesta tabela.
//----------------------------------------------------------------------------------
// N. Chamado....: WO31440
// Dt.Alteração..: 22/01/2026
// Responsável...: Paulo Nobre
// Descrição.....: Na QryContratosQuitados, inclusão de mais uma condição para somar
//                 apenas os lançamentos de quitação com o HMESALDODEV = 0
//----------------------------------------------------------------------------------
// N. Chamado....: MIGRACAO-ORACLE-2025 (TAS000000007015)
// Dt.Alteração..: 30/10/2025
// Responsável...: Paulo Nobre
// Descrição.....: Correção tamanho final da string concatenada de 3 para 21:
//                 .qryHistMov - coluna CONCAT_PARCELAS.
//----------------------------------------------------------------------------------
// N. Chamado....: MIGRACAO-ORACLE-2025 (TAS000000006779)    
// Dt.Alteração..: 16/10/2025
// Responsável...: Paulo Nobre
// Descrição.....: Inclusão da função CAST, em alguns campos, nas querys:
//                   .qry
//                   .qryItensAberto
//                   .qryHistMov
//----------------------------------------------------------------------------------
// N. Chamado....: WO15681
// Dt.Alteração..: 08/11/2024
// Responsável...: Leandro Pocebon
// Descrição.....: Inclusão popup de msg informativas cadastradas para o contrato
//-----------------------------------------------------------------------------------
// N. Chamado....: WO16118
// Dt.Alteração..: 30/10/2024
// Responsável...: Helen V Bianchi
// Descrição.....: Alterar o campo que estava trazendo: Parcelas a Cobrar para o novo
//                 campo : Carencia  na tela e add na Qry este campo
//-----------------------------------------------------------------------------------
// N. Chamado....: WO14160
// Dt.Alteração..: 20/06/2024
// Responsável...: Helen V Bianchi
// Descrição.....: Alteração da Mensagem implementada no WO10850.
//----------------------------------------------------------------------------------
// N. Chamado....: WO10850
// Dt.Alteração..: 23/05/2024  11/06/2024
// Responsável...: Paulo Nobre
// Descrição.....: Implementado condição para bloquear o acesso/consulta do próprio
//                 empregado ao seus contratos de Empréstimo no Sistema Planus
//                 Módulo de Empréstimo. O acesso/consulta, a partir de agora,
//                 somente poderá ser feita pelo site FUNCEF ou pelo WEB EMPRÉSTIMO.
//----------------------------------------------------------------------------------
//Alteracao   : qryHisMov
//SIG         : 131775
//Autor(a)    : Leandro
//Data        : 02/08/2023
//Alteração   : Alteração query obter campo ORIGEM
//--------------------------------------------------------------------------------
// Rotina      : FormShow
// Solicitação : SIG136494
// Data        : 20/11/2023
// Responsável : Paulo Nobre
// Descrição   : Inclusão de mais uma label para apresentar o tipo de contrato
//               "Politica de Renegociação" quando o contrato tiver este historico
//--------------------------------------------------------------------------------
//Alteracao   : (dfm)
//SIG         : 122230
//Autor(a)    : Everson Cunha
//Data        : 29/08/2023
//Alteração   : NO_ARQUIVO_ELETRONICO_REM e DT_ARQUIVO_ELETRONICO_REM
//------------------------------------------------------------------------------
//Alteracao   : (dfm)
//SIG         : 128458
//Autor(a)    : Luis Ferrari
//Data        : 07/11/2022 21/11/2022
//Alteração   : Alteração no label NUP para NUP / Funcef Suite
//------------------------------------------------------------------------------
//Nº SIG.............: 125588
//Data da Alteração..: 21/09/2022 25/11/ 2022
//Alteração Form.....:
//Responsável........: Luis Ferrari
//Descrição..........: Ajuste e entrada de campos para Consulta na aba cobrança.
//------------------------------------------------------------------------------
//SIG         : 125555
//Autor(a)    : Everson Cunha
//Data        : 19/08/2022
//Alteração   : Acordo Quero Pagar

//------------------------------------------------------------------------------
//Alteracao   : (dfm)
//SIG         : 122240
//Autor(a)    : Luis Ferrari
//Data        : 24/08/2022 21/09/2022
//Alteração   : Ajuste inclusão Agencia, contacorrente e nome Solicitante.
//              Acrescentando campo e parametro novo.
//------------------------------------------------------------------------------
//Alteracao   : (dfm)  qryHistMov, QryEventos, QryPrestacao
//SIG         : 118987
//Autor(a)    : Ewerton Beltramini
//Data        : 06/09/2021
//Alteração   : Ajuste no tamanho dos campos que concatenam a Parcela da Tab "Histórico".
//              Acrescentando campo e parametro novo.
//------------------------------------------------------------------------------
//Alteracao   : (dfm)  qryDebAutomatico
//SIG         : 82785
//Autor(a)    : Edilaine
//Data        : 12/02/2021
//Alteração   : Ajuste consulta Debito Automatico
//------------------------------------------------------------------------------
//Alteracao   : (dfm)  qryDebAutomatico
//SIG         : 113052
//Autor(a)    : Edilaine
//Data        : 12/02/2021
//Alteração   : Ajuste consulta Debito Automatico
//------------------------------------------------------------------------------
//SIG         : 95615
//Autor(a)    : Ewerton Beltramini
//Data        : 27/08/2020
//Alteração   : Criação de campo novo na tela:  Tipo de amortização.
//------------------------------------------------------------------------------
//Nº SIG.............: 94625
//Data da Alteração..: 20/12/2019
//Alteração Form.....: RContrato
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Inclusão de verififcação do histórico de autorização de
//                     débito automático em contas bancárias.
//------------------------------------------------------------------------------
//SIG         : 92989
//Autor(a)    : Ewerton Beltramini
//Data        : 16/10/2019
//Alteração   : Alteração da consulta da qryEventos para evitar produto cartesiano.
//--------------------------------------------------------------------------------

//--------------------------------------------------------------------------------
//SIG         : 64239
//Autor(a)    : Marcelo Ferreira
//Data        : 06/03/2018
//Alteração   : (DFM) - ALTERAÇÃO DA QUERY DO GRID DE HISTÓRICO DE MOVIMENTAÇÃO DO
//              EMPRÉSTIMO E ALTERAÇÃO DO TAMANHO DA COLUNA
//--------------------------------------------------------------------------------
//SIG         : 56779
//Autor(a)    : André Imakawa
//Data        : 18/10/2017
//Alteração   : Alterado QryPrestacao, passou a considerar o HMEORIGEM = 1 e 11
//--------------------------------------------------------------------------------
//Nº SOL.............: 224034/17909
//Nº PPM.............: 1165556
//Data da Alteração..: 24/01/2017
//Alteração Form.....: Inclusão label para indicar acordo judicial
//Responsável........: William Moreira da Silva
//Descrição..........: Inclusão label para indicar acordo judicial
//--------------------------------------------------------------------------------
//Nº SIG.............: 40174
//Data da Alteração..: 21/03/2017
//Alteração Form.....: recriação do componemte dsContratosQuitados
//Responsável........: William Santana
//Descrição..........: dsContratosQuitados havia sido deletado, foi recriado no form
//--------------------------------------------------------------------------------
//Nº SOL.............: 258351/18139
//Nº PPM.............: 1315865
//Data da Alteração..: 21/03/2016
//Alteração Form.....: Alteração do campo NUP
//Responsável........: Felipe A. Santos
//Descrição..........: Permitir a edição do campo NUP
//--------------------------------------------------------------------------------
//Nº SOL.............: 259755/17824
//Nº PPM.............: 1105015
//Data da Alteração..: 30/10/2015
//Alteração Form.....: Alteração na Aba Cobrança e QryEventos.
//Responsável........: Michelle Suellyn Mota
//Descrição..........: Alterada posição da aba Cobrança e inserido campos na
// QryEventos: NUMCRM,DTAJUIZAMENTO,JURISDICAO - Função DesabilitaVazio chamada em
// eventos para atualizar aba quando navega na lista de Eventos.
//--------------------------------------------------------------------------------
//Nº SOL.............: 255322/17559
//Nº PPM.............: 984370
//Data da Alteração..: 21/09/2015
//Alteração Form.....: Alteração na query QryContratosQuitados
//Responsável........: William Moreira da Silva
//Descrição..........: Ajustar funcionalidade para exibir os tipo de excepcinalisação
//--------------------------------------------------------------------------------
//Nº SOL.............: 253185
//Nº PPM.............: 771995
//Data da Alteração..: 04/05/2014
//Alteração Form.....: Alteração na query QryContratosQuitados
//Responsável........: Wylliam Leite da Silva
//Descrição..........: Ajustar queries para adequação a segregação da HISTMOVEMPTMO
//--------------------------------------------------------------------------------
//Pendência     : SOL 255979/17619 PPM 1006237
//Responsável   : Felipe A. Santos
//Data          : 04/08/2015
//Descrição     : inserção do item 0 - Recebido no campo Situação AR.
//               (Modificação QryEventos somente no DFM)
//--------------------------------------------------------------------------------
//Data       : 07.08.2015
// Sol        : 148922/8841
// PPM        : 1628565
// Autor      : Jonas Otavio
// Rotina     : Botão Ajuda
// Descrição  : Confeccionar documentação do módulo de Empréstimo
//--------------------------------------------------------------------------------
//Pendência     : SOL 241924 PPM 590036
//Responsável   : William Moreira da Silva
//Data          : 19/05/2015
//Descrição     : Ajuste para o sistema suportar o campo DESCOPERACAO da tabelas LOGTOTALPREV
//                Com 2000 caracteres(.DFM)
//--------------------------------------------------------------------------------
//Nº SOL.............: 219116/16182
//Nº PPM.............: 422309
//Data da Alteração..: 08/12/2014
//Alteração Form.....: Inserção de campos
//Responsável........: William Santana
//Descrição..........: Inserção de campos (somente no DFM)
//--------------------------------------------------------------------------------
//Pendência   : SOL 213592 Kintana 2040335
//Responsável : Sadi Freire
//Data        : 16/12/2013
//Descrição   : Alterações Voto Empréstimo
//------------------------------------------------------------------------------
//Pendência   : SOL 208708 Kintana 2015644
//Responsável : William Moreira da Silva
//Data        : 04/06/2013
//Descrição   : Recompilação para melhora no desempenho (.dfm)
//------------------------------------------------------------------------------
//Pendência   : SOL 207995 Kintana 2010105
//Responsável : Otacilio Aquino
//Data        : 27/05/2013
//Descrição   : Retirar alterações do SOL 206204 e SOL 201440 (.dfm)
//------------------------------------------------------------------------------
//Pendência   : SOL 206204 Kintana 1995909
//Responsável : William Moreira da Silva
//Data        : 06/05/2013
//Descrição   : Informações do contrato 300000180081 não estavam sendo exibidas (APENAS DFM)
//------------------------------------------------------------------------------
//Pendência   : SOL 205300 Kintana 1986077
//Responsável : Otacilio Aquino
//Data        : 19/024/2013
//Descrição   : Inconsistência na busca de informações de contrato concedidos
//              pela internet através do conector web
//              Alterado qry do dfm.
//------------------------------------------------------------------------------
//Pendência   : SOL 204839 Kintana 1981463
//Responsável : Otacilio Aquino
//Data        : 15/024/2013
//Descrição   : Inconsistência na busca de informações de contrato concedidos
//              pela internet através do conector web
//              Alterado qry do dfm.
//------------------------------------------------------------------------------
{      //Higor Nayde Ferreira SOL - 174521 KTN - 1576354 Inicio
-------------------------------------------------------------------------------
Pendência   : SOL 174521 KINTANA 1576354
Responsável : Higor Nayde Ferreira
Data        : 03/08/2012
Descrição   : alter campo "Quitado por" para um botão, criação do grid Contratos
Quitados na aba de Valores.
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
Pendência   : SOL 172525 KINTANA 1553886
Responsável : Monica Gonzaga
Data        : 09/04/2012
Descrição   : Alterações feitas nos dfm e na qry.
-------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
Pendência     : SOL 167451   Kintana 1469701
Responsável   : Vinicius Eduardo Nascimento Maciel
Data          : 02/03/2012
Descrição     : Chave Mestre, foi mudada a rotina de alteração para quando a
                contabilidade estiver bloqueada, abrir a tela mas apenas com o
                flag abono e a data abono liberadas.
----------------------------------------------------------------------------------------------------
Pendência     : SOL 163624   Kintana 1399837
Responsável   : Edilaine Ferraresi
Data          : 03/02/2012
Descrição     : Ajustar a query para trazer valor máximo pelo contrato
                (alterado direto no componente qry e qryValorMaximo)
----------------------------------------------------------------------------------------------------
Pendência   : SOL 168993 Kintana 1495750
Responsável : Fernando Xavier
Data        : 23/11/2011
Descrição   : Erro ao tentar alterar um registro utilizando a chave mestra
----------------------------------------------------------------------------------------------------
Pendência   : SOL 156370 Kintana 1230479
Responsável : Wylliam Silva
Data        : 07/11/2011
Dfm         : Foi criado a query QryHistEnvioEmptmo trazendo as informações do historico de envio
              de emprestimo no campo onde fica a grid DBGrdHistEnvio e foi adicionado a data source
              DSHistEnvioEmptmo.
Descrição   : Em complemento ao SOL N.° 137847, solicito criar grid de exibição do histórico de
              envio de cobrança e devolução de itens de empréstimo na tela de Consulta Contratos
             (Aba Detalhes / Sub aba Integração).
----------------------------------------------------------------------------------------------------
Pendência   : SOL 162081 Kintana 1374877
Responsável : Fernando Xavier
Data        : 13/10/2011
Descrição   : Melhorar o log gerado pela funcionalidade "Alteração de Histórico"
----------------------------------------------------------------------------------------------------
Pendência   : SOL 140792 Kintana 1250860
Responsável : Fernando Xavier
Data        : 19/09/2011
Dfm         : Somente alteração em Dfm incluido os componentes na tela para exibição da informação
              Incluido o campo Quantidade de Contratos Quitados" e "Quant. de Meses Suspenso" na QRY
Descrição   : Inserir os campos "Quantidade de Contratos Quitados" e "Quantidade de Meses Suspenso"
----------------------------------------------------------------------------------------------------
Pendência   : SOL 153382 Kintana 1159322
Responsável : Fanuel Junior
Data        : 22/08/2011
Descrição   : Criação do campo VALOR MÁXIMO DE PRESTAÇÃO AO PARTICIPANTE.
----------------------------------------------------------------------------------------------------
Pendência   : SOL 162129 Kintana 1374883
Responsável : Fernando Xavier
Data        : 27/07/2011
Descrição   : incluir trava na alteração de histórico dos itens (Chave Mestra)
----------------------------------------------------------------------------------------------------
Pendência   : SOL 156594 Kintana 1238459
Responsável : BRUNO AZEVEDO
Data        : 18/04/2011
Descrição   : Ajuste no título do formulário.
----------------------------------------------------------------------------------------------------
Pendência   : SOL 151912 Kintana 1124404
Responsável : Fanuel Junior
Data        : 31/01/2011
Descrição   : Formatação da mascara dos campos Valor Solicitado, Salário Considerado, Valor Parcela
Base e Margem Considerada
----------------------------------------------------------------------------------------------------
Pendência   : SOL 115363 Kintana 541409
Responsável : BRUNO AZEVEDO
Data        : 21/09/2010
Descrição   : Adicionado o campo "Valor máximo permitido" na aba "valores".
----------------------------------------------------------------------------------------------------
//***************************************************************************************
//Rotina:   RContrato.pas
//Nº SOL:     114613
//Nº KINTANA  539157
//Data da Alteração: 10/02/2010
//Responsável: Jéssica Lana
//Descrição:   Novo campo adicionado na aba de contratos. (FLGEXCEPCIONAL)
//***************************************************************************************
----------------------------------------------------------------------------------------------------
Rotina..........: AbreQueriesHistorico
N. Sol..........: 36024 (BACKLOG)
N. Kintana......: 523138
Data............: 16/04/2009
Responsável.....: Renato Visoni
Descrição.......: Não deixar enviar itens em aberto (FLGENVIO = null), retirei esse tratamento da
qryHistMov, pois ele transformava todos os itens como não enviado (flgenvio=1).
NVL(HME.FLGENVIO, 1)          AS FLGENVIO
----------------------------------------------------------------------------------------------------
Rotina..........: qry
N. Sol..........: 117071
N. Kintana......: 550995
Data............: 15/05/2009
Responsável.....: Renato Visoni
Descrição.......: Para participantes com todos os planos destavidas (PARTPREVPLAN com FLGDESATIVADO = 1)
a tela de consulta contratos e parcelas não retorna nenhum contrato
----------------------------------------------------------------------------------------------------
Rotina..........: AbreQueriesHistorico
N. Sol..........: 92695
N. Kintana......: 395894
Data............: 07/08/2008
Responsável.....: Denise Arruda
Descrição.......: Mostrar todos os itens em aberto, inclusive aqueles que ainda não venceram
----------------------------------------------------------------------------------------------------
Rotina    : FormShow
Data      : 28/03/2007
Autor     : Marchetti
Pendencia : 22042
Descrição : Colocado processo para mostrar form com os contratos da matricula passada pela CentralAP
----------------------------------------------------------------------------------------------------
Rotina    : Sel
Data      : 09/08/2005
Autor     : André Pontes
Pendencia : 19920
Descrição : Se for BrTPrev, a data da situação deve ser a de quitaçào, se o contrato estiver quitado,
            ou a de crédito, se o contrato estiver ativo.
----------------------------------------------------------------------------------------------------
Rotina    : CalculaItensQuitacao
Data      : 14/06/2004 a
Autor     : André Pontes
Pendencia : 16984
Descrição : Passagem da data de falecimento (nesse caso, -1)
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 15/07/2003
Autor     : Marchetti
Descrição : Mudança na ordenação dos itens em aberto, colocando por parcela e evento
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 14/07/2003
Autor     : Marchetti
Descrição : Conforme FLGEXCEPCIONAL, Abrir MontaSelect especifico FUNCEF na busca de contrato, visando
            poder consultar contratos de participantes que saíram da FUNCEF.
            (FLGDESATIVADO na PartPrevPlan)
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 06/01/2002
Autor     : André Pontes
Descrição : Exibição da data de inclusão, origem e usuário que incluiu o item
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 17/12/2002
Autor     : André Pontes
Descrição : Nova opção de filtro: itens em aberto
            Exibição diferenciada dos itens abonados e quitados
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 13/12/2002
Autor     : André Pontes
Descrição : Novas opções de filtro: por Item e por Evento
----------------------------------------------------------------------------------------------------
Rotina    : - (grpFlgas)
Data      : 12/12/2002
Autor     : André Pontes
Descrição : Só verifica se deve esconder os campos se tiver flgCalcDia = 1 (FUNCEF)
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 18/11/2002
Autor     : Marchetti
Descrição : Na página de Histórico foi criada a coluna que contém o tipo de operação relacionada ao
            item, ou seja, se abate saldo devedor, coloca sinal negativo, se incorpora saldo devedor,
            coloca sinal positivo, se não trata, deixa em branco
----------------------------------------------------------------------------------------------------
Rotina    : qryHistMov
Data      : 18/11/2002
Autor     : Marchetti
Descrição : Colocado comando no SELECT para fazer o DECODE conforme o ITCTRATASALDODEV
----------------------------------------------------------------------------------------------------
Rotina    : Exibição do Histórico (Filtro)
Data      : 06/11/2002
Autor     : Marchetti
Descrição : Não traz o checkbox de filtro de movimentação já marcado
----------------------------------------------------------------------------------------------------
Rotina    : Exibição do Histórico (qryHistMov)
Data      : 08/10/2002
Autor     : André Pontes
Descrição : Itens de quitação por morte são exibidos mesmo quando são selecionados apenas os itens
            centralizadores: quitação por morte tem centralizador (item do líquido) com valor ZERO
----------------------------------------------------------------------------------------------------
Rotina    : btnAtualizaSaldoClick
Data      : 08/10/2002
Autor     : André Pontes
Descrição : Verificação do status do contrato. Se for 'Q' ou 'K', envia msg e não prossegue.
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 01/10/2002
Autor     : Marchetti
Descrição : Colocado na query de parcelas restantes um filtro para não se levar em consideração
            item estornado
---------------------------------------------------------------------------------------------------}

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FSairAjudaImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, TREdit,
   Mask, DBCtrls, ComCtrls, fcLabel, Db, DBTables, Wwquery, Wwdatsrc, Grids,
   Wwdbigrd, Wwdbgrid, wwdblook, fcButton, fcImgBtn,
   fcShapeBtn, wwdbedit, Wwdbspin, Wwdotdot, Wwdbcomb, MontaSelect,
   uCtrlContab, uCtrlPadroes,
   // Marchetti - Pendencia 26267
   UAutorizacao,
   // Fim Marchetti - Pendencia 26267

   uTypesEmptmo, TB97Ctls, UIntegraModulo, uCMFileUtils, DBGrids, TB97Tlwn;
Type
   TstatusChave = (alterarCont, excluirCont, inserirCont, aguardarCont); //Vinicius Maciel - SOL 167451 - KINTANA 1469701

Type
   TfrmRelContrato = Class(TfrmSairAjudaImob)
      pgcDados: TPageControl;
      tbsCondicoes: TTabSheet;
      Label29: TLabel;
      DBedtNumContrato: TDBEdit;
      btnBuscaContrato: TBitBtn;
      DBedtParticipante: TDBEdit;
      tbsIntegracao: TTabSheet;
      tbsParcelas: TTabSheet;
      Label27: TLabel;
      Label8: TLabel;
      Label4: TLabel;
      Label34: TLabel;
      Label41: TLabel;
      Label18: TLabel;
      DBedtCodInsc: TDBEdit;
      DBedtPlanoPrev: TDBEdit;
      DBedtPatro: TDBEdit;
      DBedtInscricao: TDBEdit;
      DBedtMtrEmpresa: TDBEdit;
      DBedtSitPart: TDBEdit;
      dts: TwwDataSource;
      qry: TwwQuery;
      DBgrdHistMov: TwwDBGrid;
      dtsHistMov: TwwDataSource;
      grpCredito: TGroupBox;
      DBedtFormaPag: TDBEdit;
      DBedtFormaPagamento: TDBEdit;
      lbFormPag: TLabel;
      Label31: TLabel;
      DBedtCCaixaxFPagto: TDBEdit;
      grpDebito: TGroupBox;
      DBedtFormaRec: TDBEdit;
      Label30: TLabel;
      DBedtFormaRecebimento: TDBEdit;
      tbsDetalheParcela: TTabSheet;
      ToolbarSep973: TToolbarSep97;
      btnImprimir: TBitBtn;
      plnFiltro: TPanel;
      rdgEstorno: TRadioGroup;
      tbsSaldo: TTabSheet;
      btnAtualizaSaldo: TBitBtn;
      tbsItensAberto: TTabSheet;
      updHistMovVirtual: TUpdateSQL;
      dtsHistMovVirtual: TwwDataSource;
      qryHistMovVirtual: TwwQuery;
      qryHistMovVirtualHMEANOCOMPETENCIA: TFloatField;
      qryHistMovVirtualHMEMESCOMPETENCIA: TFloatField;
      qryHistMovVirtualHMESEQCOBRANCA: TFloatField;
      qryHistMovVirtualHMETIPOMOV: TFloatField;
      qryHistMovVirtualHMEDATAPREVISTA: TDateTimeField;
      qryHistMovVirtualHMEVLRPREVISTO: TFloatField;
      qryHistMovVirtualHMESALDODEV: TFloatField;
      qryHistMovVirtualHMETXJUROS: TFloatField;
      qryHistMovVirtualHMEPARCELA: TFloatField;
      qryHistMovVirtualEVENTO: TStringField;
      qryHistMovVirtualANOMES: TStringField;
      qryHistMovVirtualITEDESCRICAO: TStringField;
      qryHistMovVirtualIDCONTRATOEMPTMO: TFloatField;
      qryHistMovVirtualIDITEMEMPTMO: TFloatField;
      rdgExibe: TRadioGroup;
      qryItensAberto: TwwQuery;
      dtsItensAberto: TwwDataSource;
      qryItensAbertoITEDESCRICAO: TStringField;
      qryItensAbertoANOMESCOMP: TStringField;
      qryItensAbertoANOMESCOBR: TStringField;
      qryItensAbertoFLGENVIO: TFloatField;
      qryItensAbertoFLGBAIXADO: TFloatField;
      qryItensAbertoFLGESTORNADO: TFloatField;
      qryItensAbertoHMEANOCOMPETENCIA: TFloatField;
      qryItensAbertoHMEMESCOMPETENCIA: TFloatField;
      qryItensAbertoHMESEQCOBRANCA: TFloatField;
      qryItensAbertoHMETIPOMOV: TFloatField;
      qryItensAbertoIDCONTRATOEMPTMO: TFloatField;
      qryItensAbertoIDITEMEMPTMO: TFloatField;
      qryItensAbertoHMEDATAPREVISTA: TDateTimeField;
      qryItensAbertoHMEVLRPREVISTO: TFloatField;
      qryItensAbertoHMESALDODEV: TFloatField;
      qryItensAbertoHMETXJUROS: TFloatField;
      qryItensAbertoHMEPARCELA: TFloatField;
      qryItensAbertoHMEDATAEFETIVA: TDateTimeField;
      qryItensAbertoHMEDATAATUALIZA: TDateTimeField;
      qryItensAbertoHMEVLREFETIVO: TFloatField;
      qryItensAbertoPLNCODIGO: TFloatField;
      qryItensAbertoPLNCODIGOESTORNO: TFloatField;
      qryItensAbertoCODDOCUMENTO: TFloatField;
      qryItensAbertoIDRUBRICA: TFloatField;
      qryItensAbertoEVENTO: TStringField;
      wwDBGrid2: TwwDBGrid;
      wwDBGrid1: TwwDBGrid;
      qryItensAbertoHMEFORMACOBRANCA: TStringField;
      qryItensAbertoFORMA_COBRANCA: TStringField;
      chkFiltroCobranca: TCheckBox;
      Label36: TLabel;
      cboMesCobIni: TComboBox;
      DBspnAnoCobIni: TwwDBSpinEdit;
      cboMesCobFim: TComboBox;
      DBspnAnoCobFim: TwwDBSpinEdit;
      fcShapeBtn1: TfcShapeBtn;
      lblTitulo: TfcLabel;
      edtSaldoAtual: TRealEdit;
      lblSaldoAtualizado: TLabel;
      edtDataQuitacao: TCMDateTimePicker;
      qryParcelasRestantes: TwwQuery;
      qryParcelasRestantesPARCELAS_RESTANTES: TFloatField;
      tbsBenefSeguro: TTabSheet;
      qryBenefSeguro: TwwQuery;
      wwDBGrid3: TwwDBGrid;
      dsBenefSeguro: TDataSource;
      pnlHistBaca: TPanel;
      btnAltera: TfcShapeBtn;
      btnNovo: TfcShapeBtn;
      btnExcluir: TfcShapeBtn;
      pnlTitular: TPanel;
      DBedtBeneficiario: TDBEdit;
      Label2: TLabel;
      Image1: TImage;
      rdgOrdena: TRadioGroup;
      cboFlgSituacao: TComboBox;
      BitBtn1: TBitBtn;
      Panel1: TPanel;
      Panel2: TPanel;
      DBEdit6: TDBEdit;
      DBEdit7: TDBEdit;
      qryItensAbertoHMEDATAVENCTO: TDateTimeField;
      qryItensAbertoITCSEQCALCULO: TFloatField;
      Label53: TLabel;
      Label54: TLabel;
      Label56: TLabel;
      DBEdit9: TDBEdit;
      Label55: TLabel;
      DBEdit8: TDBEdit;
      Label57: TLabel;
      qryTotalizaAberto: TwwQuery;
      qryTotalizaAbertoQUANT_ABERTO: TFloatField;
      qryTotalizaAbertoVALOR_TOTAL_ABERTO: TFloatField;
      Label58: TLabel;
      DBEdit10: TDBEdit;
      Bevel1: TBevel;
      DBcboItem: TwwDBLookupCombo;
      chkFiltroEvento: TCheckBox;
      chkFiltroItem: TCheckBox;
      dtsTotalizaAberto: TwwDataSource;
      cboEvento: TComboBox;
      rdgFiltroEmAberto: TRadioGroup;
      fcShapeBtn2: TfcShapeBtn;
      lblInternet: TfcLabel;
      GroupBox3: TGroupBox;
      Label7: TLabel;
      Label9: TLabel;
      Label10: TLabel;
      DBedtBanco: TDBEdit;
      DBedtAgencia: TDBEdit;
      DBedtContaCorrente: TDBEdit;
      GroupBox4: TGroupBox;
      Label64: TLabel;
      Label65: TLabel;
      Label66: TLabel;
      DBEdit15: TDBEdit;
      DBEdit16: TDBEdit;
      DBEdit17: TDBEdit;
      pgcDetalhe: TPageControl;
      TabSheet1: TTabSheet;
      TabSheet2: TTabSheet;
      TabSheet3: TTabSheet;
      Label15: TLabel;
      Label24: TLabel;
      Label37: TLabel;
      Label45: TLabel;
      Label20: TLabel;
      Label59: TLabel;
      Label60: TLabel;
      Label61: TLabel;
      Bevel3: TBevel;
      Bevel4: TBevel;
      Label62: TLabel;
      DBedtEvento: TDBEdit;
      DBedtItem: TDBEdit;
      DBedtDataPrevisao: TCMDateTimePicker;
      DBedtDataEfetiva: TCMDateTimePicker;
      CMDateTimePicker1: TCMDateTimePicker;
      DBEdit1: TDBEdit;
      CMDateTimePicker6: TCMDateTimePicker;
      DBEdit11: TDBEdit;
      CMDateTimePicker7: TCMDateTimePicker;
      DBEdit12: TDBEdit;
      DBEdit13: TDBEdit;
      DBedtCompetencia: TDBEdit;
      label100: TLabel;
      Label28: TLabel;
      DBedtCobranca: TDBEdit;
      DBedtValorPrevisto: TDBEdit;
      Label11: TLabel;
      Label26: TLabel;
      DBedtValorEfetivo: TDBEdit;
      GroupBox2: TGroupBox;
      Label19: TLabel;
      Label16: TLabel;
      Label25: TLabel;
      DBedtTxJuros: TDBEdit;
      DBedtSaldoDev: TDBEdit;
      DBedtDataUltAtualiza: TCMDateTimePicker;
      CMDateTimePicker8: TCMDateTimePicker;
      Label63: TLabel;
      GroupBox6: TGroupBox;
      Label32: TLabel;
      Label33: TLabel;
      DBedtPlanilha: TDBEdit;
      DBedtPlanil: TDBEdit;
      DBedtPlanilhaEstorno: TDBEdit;
      DBedtPlanilEstorno: TDBEdit;
      GroupBox5: TGroupBox;
      Label35: TLabel;
      Label40: TLabel;
      Label52: TLabel;
      DBedtCodDocumento: TDBEdit;
      DBedtDestinoEnvio: TDBEdit;
      DBedtTipoFolha: TDBEdit;
      DBEdit5: TDBEdit;
      DBchkEnvio: TDBCheckBox;
      DBchkBaixado: TDBCheckBox;
      DBCheckBox3: TDBCheckBox;
      DBCheckBox4: TDBCheckBox;
      DBcboTipoDiverg: TwwDBComboBox;
      DBCheckBox6: TDBCheckBox;
      DBchkEstornado: TDBCheckBox;
      CMDateTimePicker5: TCMDateTimePicker;
      Label46: TLabel;
      DBCheckBox1: TDBCheckBox;
      DBCheckBox2: TDBCheckBox;
      CMDateTimePicker2: TCMDateTimePicker;
      DBCheckBox5: TDBCheckBox;
      DBCheckBox7: TDBCheckBox;
      Bevel2: TBevel;
      Bevel5: TBevel;
      DBCheckBox8: TDBCheckBox;
      CMDateTimePicker9: TCMDateTimePicker;
      Bevel7: TBevel;
      Label67: TLabel;
      wwDBComboBox1: TwwDBComboBox;
      Label68: TLabel;
      Label69: TLabel;
      Bevel6: TBevel;
      Bevel8: TBevel;
      Bevel9: TBevel;
      DBCheckBox9: TDBCheckBox;
      DBCheckBox10: TDBCheckBox;
      DBCheckBox11: TDBCheckBox;
      DBCheckBox12: TDBCheckBox;
      DBEdit18: TDBEdit;
      Label70: TLabel;
      tbsObservacao: TTabSheet;
      DBRichEdit1: TDBRichEdit;
      pgcSecundario: TPageControl;
      TabSheet5: TTabSheet;
      Label43: TLabel;
      Label12: TLabel;
      Label1: TLabel;
      Label3: TLabel;
      Label5: TLabel;
      Label47: TLabel;
      DBedtDataAssinatura: TCMDateTimePicker;
      DBedtDataCredito: TCMDateTimePicker;
      DBedtDataInsc: TCMDateTimePicker;
      DBedtDataPrimParcela: TCMDateTimePicker;
      DBedtDtCancelamento: TCMDateTimePicker;
      pgcValores: TTabSheet;
      DBedtValSolic: TDBEdit;
      Label17: TLabel;
      DBedtJuros: TDBEdit;
      Label21: TLabel;
      DBedtParcelas: TDBEdit;
      Label44: TLabel;
      dbEdtNumParcDesc: TDBEdit;
      Label71: TLabel;
      edtSaldoDevedor: TRealEdit;
      Label42: TLabel;
      DBedtValorParcela: TDBEdit;
      Label39: TLabel;
      edtParcRestante: TRealEdit;
      Label38: TLabel;
      Label13: TLabel;
      DBedtTipoContrato: TDBEdit;
      DBEdit4: TDBEdit;
      Label51: TLabel;
      DBedtTipoEmptmo: TDBEdit;
      Label14: TLabel;
      TabSheet6: TTabSheet;
      GroupBox1: TGroupBox;
      Label48: TLabel;
      Label49: TLabel;
      Label50: TLabel;
      DBEdit3: TDBEdit;
      CMDateTimePicker3: TCMDateTimePicker;
      CMDateTimePicker4: TCMDateTimePicker;
      CMDateTimePicker10: TCMDateTimePicker;
      Label72: TLabel;
      qryINSCRICAO: TFloatField;
      qryFLGINTERNET: TFloatField;
      qryINSCRICAONUMERO: TFloatField;
      qryDESCSITCONTRATO: TStringField;
      qryDESCFLGFORMAPAG: TStringField;
      qryDESCFLGFORMAREC: TStringField;
      qryDESCCODFORMAPAG: TStringField;
      qryDESCPORTFORMAPAG: TStringField;
      qryDESCPORTFORMAREC: TStringField;
      qryIDSITPART: TFloatField;
      qrySITUACAO: TStringField;
      qryFLGINTERNO: TStringField;
      qryPLANOPREV: TStringField;
      qryPATRO: TStringField;
      qryMATRICULA: TStringField;
      qryTITULAR: TStringField;
      qryBENEFICIARIO: TStringField;
      qryTCEDESCRICAO: TStringField;
      qryIDTIPOEMPTMO: TFloatField;
      qryDESCTIPOEMPTMO: TStringField;
      qryDATAINSC: TDateTimeField;
      qryBANCO: TStringField;
      qryCONTACORRENTE: TStringField;
      qryNUMAGENCIA: TStringField;
      qryIDCONTRATOEMPTMO: TFloatField;
      qryIDCONTRQUITACAO: TFloatField;
      qryIDPESSOA: TFloatField;
      qryIDVERBA: TFloatField;
      qryIDTIPOCONTREMPTMO: TFloatField;
      qryIDPLANOPREV: TFloatField;
      qryIDPATRO: TFloatField;
      qryNUMPARCELAS: TFloatField;
      qryIDINSCRICAOEMPTMO: TFloatField;
      qryIDBENEF: TFloatField;
      qryIDCBANCARIA: TFloatField;
      qryIDCBANCARIADEB: TFloatField;
      qryCODFORMAPAG: TFloatField;
      qryPORTFORMAPAG: TFloatField;
      qryPORTFORMAREC: TFloatField;
      qryDATACANC: TDateTimeField;
      qryDATACREDITO: TDateTimeField;
      qryDATASITUACAO: TDateTimeField;
      qryDATAASSINATURA: TDateTimeField;
      qryDATAPRIMPARC: TDateTimeField;
      qryVLRCONTRATO: TFloatField;
      qryVLRPARCELA: TFloatField;
      qryTXJUROS: TFloatField;
      qryFLGSITUACAO: TStringField;
      qryFLGFORMAREC: TStringField;
      qryFLGFORMAPAG: TStringField;
      qryVLRSALBASE: TFloatField;
      qryVLRMARGEM: TFloatField;
      qryVLRMAXPERMIT: TFloatField;
      qryMOECODIGO: TFloatField;
      qryIDTIPOSUSPEMPTMO: TFloatField;
      qryDATAINICIOSUSP: TDateTimeField;
      qryDATAFIMSUSP: TDateTimeField;
      qryANOSUSPENSAO: TFloatField;
      qryMESSUSPENSAO: TFloatField;
      qryIDPLANOORIGEM: TFloatField;
      qryMOESIGLA: TStringField;
      qryTSEDESCRICAO: TStringField;
      qryNOMERESPONSAVEL: TStringField;
      qryBANCODEB: TStringField;
      qryCONTACORRENTEDEB: TStringField;
      qryNUMAGENCIADEB: TStringField;
      qryNUMPARCDESCONTO: TFloatField;
      Panel3: TPanel;
      Panel4: TPanel;
      chkAtuDia: TCheckBox;
      chkFaixaDatas: TCheckBox;
      edtDataIni: TCMDateTimePicker;
      edtDataFim: TCMDateTimePicker;
      Label73: TLabel;
      Label74: TLabel;
      DBEdit19: TDBEdit;
      btnRefresh: TToolbarButton97;
      btnAjustaSaldo: TBitBtn;
      ToolbarSep974: TToolbarSep97;
      DBEdit20: TDBEdit;
      Label76: TLabel;
      DBEdit21: TDBEdit;
      Label77: TLabel;
      DBCheckBox13: TDBCheckBox;
      DBCheckBox14: TDBCheckBox;
      DBCheckBox15: TDBCheckBox;
      DBCheckBox16: TDBCheckBox;
      DBCheckBox17: TDBCheckBox;
      DBCheckBox18: TDBCheckBox;
      GroupBox7: TGroupBox;
      Label22: TLabel;
      Label23: TLabel;
      DBedtParcela: TDBEdit;
      DBEdit14: TDBEdit;
      DBEdit22: TDBEdit;
      Label78: TLabel;
      DBEdit23: TDBEdit;
      Label79: TLabel;
      DBEdit24: TDBEdit;
      Label80: TLabel;
      qrySITUACAO_PLANO: TStringField;
      qrySITUACAO_FUNC: TStringField;
      DBEdit25: TDBEdit;
      DBEdit26: TDBEdit;
      DBEdit27: TDBEdit;
      qrySITUACAO_INT: TStringField;
      qrySITUACAO_INT_PLANO: TStringField;
      qrySITUACAO_INT_FUNC: TStringField;
      DBEdit28: TDBEdit;
      Label81: TLabel;
      qryPLANOORIGEM: TStringField;
      DBEdit29: TDBEdit;
      Label82: TLabel;
      DBEdit30: TDBEdit;
      Label83: TLabel;
      btnAjustaSituacao: TBitBtn;
      DBText1: TDBText;
      qryTCELEGENDAEXIBE: TStringField;
      qryTCELEGENDACALC: TStringField;
      DBText2: TDBText;
      fcShapeBtn3: TfcShapeBtn;
      qryHistMov: TwwQuery;
      Label84: TLabel;
      Label85: TLabel;
      DBEdit31: TDBEdit;
      DBEdit32: TDBEdit;
      rdgRecPag: TDBRadioGroup;
      Label86: TLabel;
      DBEdit33: TDBEdit;
      qryCEDIDO: TStringField;
      DBmemObsBenef: TDBMemo;
      qryBenefSeguroIDINSCRICAOEMPTMO: TFloatField;
      qryBenefSeguroIDBENEFSEGURO: TFloatField;
      qryBenefSeguroPERCINDENIZACAO: TFloatField;
      qryBenefSeguroVLRSALDOREC: TFloatField;
      qryBenefSeguroVLRREPASSE: TFloatField;
      qryBenefSeguroDATAREPASSE: TDateTimeField;
      qryBenefSeguroBANCO: TStringField;
      qryBenefSeguroNOME: TStringField;
      qryBenefSeguroOBS: TStringField;
      qryItensAbertoQUANT_ABERTO: TFloatField;
      qryItensAbertoVALOR_TOTAL_ABERTO: TFloatField;
      Bevel10: TBevel;
      Label87: TLabel;
      DBEdit34: TDBEdit;
      DBText3: TDBText;
      DBText4: TDBText;
      btnAlteraHistContrato: TfcShapeBtn;
      DBEdit35: TDBEdit;
      tbsLogTotalprev: TTabSheet;
      qryLogTotalPrev: TwwQuery;
      dsLogTotalPrev: TwwDataSource;
      DBgrdLogContrato: TwwDBGrid;
      DBMemo1: TDBMemo;
      qryLogTotalPrevIDLOGTOTALPREV: TFloatField;
      qryLogTotalPrevIDMODULO: TFloatField;
      qryLogTotalPrevIDCONTRATOEMPTMO: TFloatField;
      qryLogTotalPrevIDHISTMOVEMPTMO: TFloatField;
      qryLogTotalPrevORIGEM: TFloatField;
      qryLogTotalPrevDESC_ORIGEM: TStringField;
      qryLogTotalPrevDATA: TDateTimeField;
      qryLogTotalPrevIDUSUARIO: TFloatField;
      qryLogTotalPrevVERSAO: TStringField;
      qryLogTotalPrevNOMEUSUARIO: TStringField;
      qryLogTotalPrevNOME: TStringField;
      qryDataQuitacao: TwwQuery;
      qryDataQuitacaoDATAQUITACAO: TDateTimeField;
      DBEdit36: TDBEdit;
      Label88: TLabel;
      Label89: TLabel;
      DBEdit37: TDBEdit;
      tbsLogTotalPrevHist: TTabSheet;
      DBgrdLogHist: TwwDBGrid;
      DBMemo2: TDBMemo;
      dsLogTotalPrevHist: TwwDataSource;
      qryLogTotalPrevHist: TwwQuery;
      DateTimeField1: TDateTimeField;
      StringField1: TStringField;
      StringField2: TStringField;
      StringField3: TStringField;
      StringField4: TStringField;
      FloatField1: TFloatField;
      FloatField2: TFloatField;
      FloatField3: TFloatField;
      FloatField4: TFloatField;
      FloatField5: TFloatField;
      FloatField6: TFloatField;
      btnAlteraObs: TBitBtn;
      Label75: TLabel;
      DBEdit38: TDBEdit;
      rdgMetodo: TRadioGroup;
      CMDateTimePicker11: TCMDateTimePicker;
      Label90: TLabel;
      Label91: TLabel;
      Label92: TLabel;
      spnParcela: TwwDBSpinEdit;
      chkParcela: TCheckBox;
      TabSheet7: TTabSheet;
      wwDBGrid4: TwwDBGrid;
      wwDBGrid5: TwwDBGrid;
      qryHistMigracoes: TwwQuery;
      dsHistMigracoes: TwwDataSource;
      qryItensMigracoes: TwwQuery;
      dsItensMigracoes: TwwDataSource;
      qryFLGUSAMARGEMALT: TFloatField;
      qryHistObservacao: TwwQuery;
      dsHistObservacao: TDataSource;
      qryHistObservacaoHMEOBSERVACAO: TMemoField;
      qryFLGEXCEPCIONAL: TFloatField;
      Label95: TLabel;
      dseventos: TwwDataSource;
      QryEventos: TwwQuery;
      QryPrestacao: TwwQuery;
      dsPrestacao: TwwDataSource;
      DBedtValorMaxPermitido: TDBEdit;
      qryVLRMAXPERMIT_1: TFloatField;
      GroupBox8: TGroupBox;
      Label97: TLabel;
      Label98: TLabel;
      Label99: TLabel;
      dbedtValor: TDBEdit;
      cmdtInicio: TCMDateTimePicker;
      cmdtFinal: TCMDateTimePicker;
      dsValorMaximo: TDataSource;
      qryValorMaximo: TwwQuery;
      qryDATAINICIO: TDateTimeField;
      qryDATAFIM: TDateTimeField;
      qryVALORMAX: TStringField;
      Label101: TLabel;
      DBEdit40: TDBEdit;
      Label102: TLabel;
      Label103: TLabel;
      DBEdit41: TDBEdit;
      qryQTDEMESSUSP: TFloatField;
      qryQTDECONTQUITADO: TFloatField;
      Historico: TGroupBox;
      DBGrdHistEnvio: TwwDBGrid;
      QryHistEnvioEmptmo: TwwQuery;
      QryHistEnvioEmptmoFORMAENVIO: TStringField;
      QryHistEnvioEmptmoIDRUBRICA: TFloatField;
      QryHistEnvioEmptmoDATAENVIO: TDateTimeField;
      QryHistEnvioEmptmoIDTMPDESC: TFloatField;
      QryHistEnvioEmptmoCODDOCUMENTO: TFloatField;
      QryHistEnvioEmptmoDATAVENCTO: TDateTimeField;
      DSHistEnvioEmptmo: TDataSource;
      QryHistEnvioEmptmoNOMEUSUARIO: TStringField;
      qryNUP: TStringField;
      lblNUP: TLabel;
      btnContratoQuitacao: TBitBtn;
      Label104: TLabel;
      QryContratosQuitados: TwwQuery;
      dsContratosQuitados: TwwDataSource;
      gridContratosQuitados: TwwDBGrid;
      qryFLGPERDAEFETIVA: TFloatField;
      fcLblPerda: TfcLabel;
      qryQryEventosIDCONTRATOEMPTMO: TFloatField;
      qryQryEventosIDTIPOEVENTOCOBEMPTMO: TFloatField;
      qryQryEventosDESCEVENTOCOB: TStringField;
      qryQryEventosDATAEVENTOCOB: TDateTimeField;
      qryQryEventosOBSCOB: TMemoField;
      qryQryEventosCE: TStringField;
      qryQryEventosAR: TStringField;
      qryQryEventosNUP: TStringField;
      qryQryEventosPROCJUD: TStringField;
      qryQryEventosSITAR: TStringField;
      qryLogTotalPrevDESCOPERACAO: TMemoField;
      qryLogTotalPrevHistDESCOPERACAO: TMemoField;
      qryHistMovITEDESCRICAO: TStringField;
      qryHistMovANOMESCOMP: TStringField;
      qryHistMovANOMESCOBR: TStringField;
      qryHistMovANOMESCOMPET: TStringField;
      qryHistMovANOMESCOB: TStringField;
      qryHistMovFLGENVIO: TFloatField;
      qryHistMovFLGBAIXADO: TFloatField;
      qryHistMovFLGESTORNADO: TFloatField;
      qryHistMovFLGABONADO: TFloatField;
      qryHistMovFLGQUITADO: TFloatField;
      qryHistMovFLGBAIXAMANUAL: TFloatField;
      qryHistMovFLGDIVERGPEND: TFloatField;
      qryHistMovFLGSUSPENSAO: TFloatField;
      qryHistMovFLGTIPODIVERG: TFloatField;
      qryHistMovFLGDIVERGTRAT: TFloatField;
      qryHistMovFLGENTRADAMANUAL: TFloatField;
      qryHistMovENVIADO: TStringField;
      qryHistMovHMECENTRALIZA: TFloatField;
      qryHistMovHMEDESTACADO: TFloatField;
      qryHistMovHMEANOCOMPETENCIA: TFloatField;
      qryHistMovHMEMESCOMPETENCIA: TFloatField;
      qryHistMovHMESEQCOBRANCA: TFloatField;
      qryHistMovHMETIPOMOV: TFloatField;
      qryHistMovIDCONTRATOEMPTMO: TFloatField;
      qryHistMovIDITEMEMPTMO: TFloatField;
      qryHistMovHMEDATAPREVISTA: TDateTimeField;
      qryHistMovTIPO_OPERACAO: TStringField;
      qryHistMovHMEVLRPREVISTO: TFloatField;
      qryHistMovHMESALDODEV: TFloatField;
      qryHistMovHMEVLRBASE: TFloatField;
      qryHistMovHMEDATA: TDateTimeField;
      qryHistMovHMEDATAEFETIVAORIG: TDateTimeField;
      qryHistMovHMEVLREFETIVOORIG: TFloatField;
      qryHistMovHMEDATAEFETIVA: TStringField;
      qryHistMovCONCAT_PARCELAS: TStringField;
      qryHistMovHMEPARCELA: TFloatField;
      qryHistMovHMEPARCELAALT: TFloatField;
      qryHistMovHMENUMPARCELAS: TFloatField;
      qryHistMovHMETXJUROS: TFloatField;
      qryHistMovHMEDATAATUALIZA: TDateTimeField;
      qryHistMovPLNCODIGO: TFloatField;
      qryHistMovPLNCODIGOESTORNO: TFloatField;
      qryHistMovCODDOCUMENTO: TFloatField;
      qryHistMovIDRUBRICA: TFloatField;
      qryHistMovHMEDATAVENCTO: TDateTimeField;
      qryHistMovEVENTO: TStringField;
      qryHistMovORIGEM: TStringField;
      qryHistMovSITENVIO: TStringField;
      qryHistMovNODOCUMENTO: TFloatField;
      qryHistMovSTATUS_DOC: TStringField;
      qryHistMovTRGDTINCLUSAO: TDateTimeField;
      qryHistMovTRGUSERINCLUSAO: TStringField;
      qryHistMovFORMACOBRANCA: TStringField;
      qryHistMovTIPOFOLHA: TStringField;
      qryHistMovHMEDATARECEB: TDateTimeField;
      qryHistMovHMEDATADIVERGTRAT: TDateTimeField;
      qryHistMovFLGTIPODIVERGTRAT: TFloatField;
      qryHistMovHMEDATAQUITABONO: TDateTimeField;
      qryHistMovHMEDATAESTORNO: TDateTimeField;
      qryHistMovHMEDATAESTORNOALT: TDateTimeField;
      qryHistMovHMEDATAENVIO: TDateTimeField;
      qryHistMovPLNPLANIL: TFloatField;
      qryHistMovPLANIL_ESTORNO: TFloatField;
      qryHistMovNOMEUSUARIO: TStringField;
      qryHistMovUSU_ESTORNO: TStringField;
      qryHistMovIDHISTMOVEMPTMO: TFloatField;
      qryHistMovHMEMESCOBRANCA: TFloatField;
      qryHistMovHMEANOCOBRANCA: TFloatField;
      qryHistMovCCDEBFINAN: TStringField;
      qryHistMovCCCREDFINAN: TStringField;
      qryHistMovHMERECPAG: TStringField;
      qryHistMovVERSAO: TStringField;
      qryHistMovIDTMPDESC: TFloatField;
      qryHistMovTSEDESCRICAO: TStringField;
      qryHistMovHMEVLREFETIVO: TFloatField;
      rgExcepcional: TRadioGroup;
      chkValorSolictado: TCheckBox;
      chkElegibilidade: TCheckBox;
      chkInadimplencia: TCheckBox;
      chkOutros: TCheckBox;
      // Início - Michelle Mota - SOL: 259755/17824 - PPM: 1105015
      tsCobranca: TTabSheet;
      fltfldQryEventosNUMCRM: TFloatField;
      QryEventosDTAJUIZAMENTO: TDateTimeField;
      QryEventosJURISDICAO: TStringField;
      btnNUP: TBitBtn;
      qryLogNUP: TwwQuery;
      updLogNUP: TUpdateSQL;
      qryUpdateNup: TwwQuery;
      updNup: TUpdateSQL;
      upd: TUpdateSQL;
      dbedtNUP: TMaskEdit;
      lblAcordoJudicial: TfcLabel;
      qryFLGACORDOJUDICIAL: TFloatField;                    // William Moreira da Silva - 224034/17909
      grpDebAutomatico: TGroupBox;
      grdDebAutomatico: TwwDBGrid;
      qryDebAutomatico: TwwQuery;
      dsDebAutomatico: TDataSource;
      Label106: TLabel;
      EdtDbTipoAmotizacao: TDBEdit;
      qrySISTEMA_AMORTIZACAO: TStringField;
      fltfldQryEventosIDHISTEVENTOCOBEMPTMO: TFloatField;   //Ewerton Beltramini - 17/09/2021 - SIG118987
      lblAcordoQueroPagar: TfcLabel;
      qryAcordoQueroPagar: TwwQuery;
      dtmfldQryEventosDATAASSINATURAACORDO: TDateTimeField;
      dtmfldQryEventosDATAHOMOLACORDO: TDateTimeField;
      strngfldQryEventosFORMAPAGTO: TStringField;
      strngfldQryEventosCI: TStringField;
      mfldQryEventosGEJUR: TMemoField;
      pnGrupo: TPanel;
      pnGeral: TPanel;
      Label96: TLabel;
      wwDBGrid6: TwwDBGrid;
      dbmmoOBSCOB: TDBMemo;
      pneventos: TPanel;
      lblNUP2: TLabel;
      Label105: TLabel;
      lblCE: TLabel;
      lblAr: TLabel;
      lblSitAR: TLabel;
      dbedtNUP1: TDBEdit;
      dbedtNUMCRM: TDBEdit;
      dbedtCE: TDBEdit;
      dbedtAR: TDBEdit;
      dbedtSITAR: TDBEdit;
      pnacordo: TPanel;
      lbl1: TLabel;
      lbl2: TLabel;
      Label108: TLabel;
      lbl3: TLabel;
      Label107: TLabel;
      dbedtAssinaturaAcordo: TDBEdit;
      dbedtHomolAcordo: TDBEdit;
      dbedtFormaPagto: TDBEdit;
      dbedtCI: TDBEdit;
      dbmmoFormGejur: TDBMemo;
      pnGrid: TPanel;
      pnlCobranca: TPanel;
      lblProcJud: TLabel;
      lblDtAjuiza: TLabel;
      lblLocOrgJuris: TLabel;
      dbedtLocOrgJuris: TDBEdit;
      dbedtPROCJUD: TDBEdit;
      dbedtDtAjuiza: TDBEdit;
      wwDBGrid7: TwwDBGrid;
      lblPolRenegociacao: TfcLabel;
      qryPolRenogociacao: TwwQuery;
      twMensagem: TToolWindow97;
    pnlBotoes: TPanel;
      btnFechar: TBitBtn;
    btnProximo: TBitBtn;
      btnAnterior: TBitBtn;
      reditMSG: TRichEdit;
      qryMessagem: TwwQuery;

      // Término - Michelle Mota - SOL: 259755/17824 - PPM: 1105015
      Procedure btnBuscaContratoClick(Sender: TObject);
      Procedure DBgrdHistMovCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      Procedure DBgrdHistMovTopRowChanged(Sender: TObject);
      Procedure DBgrdHistMovCellChanged(Sender: TObject);
      Procedure btnImprimirClick(Sender: TObject);
      Procedure btnAtualizaSaldoClick(Sender: TObject);
      Procedure DBgrdItensAbertoTopRowChanged(Sender: TObject);
      Procedure DBgrdHistMovVirtualTopRowChanged(Sender: TObject);
      Procedure DBgrdItensAbertoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      Procedure DBgrdHistMovVirtualCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      Procedure rdgExibeClick(Sender: TObject);
      Procedure rdgEstornoClick(Sender: TObject);
      Procedure chkOrdemClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure chkFaixaDatasClick(Sender: TObject);
      Procedure fcShapeBtn1Click(Sender: TObject);
      Procedure cboMesCobIniExit(Sender: TObject);
      Procedure DBspnAnoCobIniExit(Sender: TObject);
      Procedure cboMesCobFimExit(Sender: TObject);
      Procedure DBspnAnoCobFimExit(Sender: TObject);
      Procedure cboMesCobIniEnter(Sender: TObject);
      Procedure cboMesCobFimEnter(Sender: TObject);
      Procedure qryHistMovVirtualAfterClose(DataSet: TDataSet);
      Procedure pgcDadosChange(Sender: TObject);
      Procedure btnNovoClick(Sender: TObject);
      Procedure btnAlteraClick(Sender: TObject);
      Procedure btnExcluirClick(Sender: TObject);
      Procedure rdgOrdenaClick(Sender: TObject);
      Procedure BitBtn1Click(Sender: TObject);
      Procedure DBcboItemCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      Procedure cboEventoChange(Sender: TObject);
      Procedure qryHistMovHMEVLREFETIVOGetText(Sender: TField; Var Text: String; DisplayText: Boolean);
      Procedure qryHistMovAfterScroll(DataSet: TDataSet);
      Procedure edtDataIniExit(Sender: TObject);
      Procedure btnRefreshClick(Sender: TObject);
      Procedure btnAjustaSaldoClick(Sender: TObject);
      Procedure btnAjustaSituacaoClick(Sender: TObject);
      Procedure fcShapeBtn3Click(Sender: TObject);
      Procedure btnAlteraHistContratoClick(Sender: TObject);
      Procedure pgcDetalheChange(Sender: TObject);
      Procedure btnAlteraObsClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure qryHistMigracoesAfterScroll(DataSet: TDataSet);
      Procedure QryEventosAfterScroll(DataSet: TDataSet);
      Procedure wwDBGrid7CalcCellColors(Sender: TObject; Field: TField;
         State: TGridDrawState; Highlight: Boolean; AFont: TFont;
         ABrush: TBrush);
      Procedure wwDBGrid7TopRowChanged(Sender: TObject);
      Procedure qryBeforeOpen(DataSet: TDataSet);
      Procedure qryAfterOpen(DataSet: TDataSet);
      Procedure btnContratoQuitacaoClick(Sender: TObject);  //Higor Nayde Ferreira SOL - 174521 KTN - 1576354
      Procedure gridContratosQuitadosDblClick(Sender: TObject);
      Procedure bbtnAjudaClick(Sender: TObject);
      Procedure btnNUPClick(Sender: TObject);
      Procedure wwDBGrid6CellChanged(Sender: TObject);  //Higor Nayde Ferreira SOL - 174521 KTN - 1576354
      procedure twMensagemVisibleChanged(Sender: TObject);
      procedure btnFecharClick(Sender: TObject);
      procedure btnAnteriorClick(Sender: TObject);
      procedure btnProximoClick(Sender: TObject);

   Private                                                  // Private declarations

      Contab: TCtrlContab;

      rContrato: TDadosContrato;
      vLista: TListaItem;
      iIndiceIni: Integer;
      iIndiceFim: Integer;
      statusChave: TStatusChave;                            //Vinicius Maciel - SOL 167451 - KINTANA 1469701
      bControlaHabilitaNup: Boolean;                        // SOL 258351/18139 PPM 1315865

      Procedure Sel(i: Extended);
      Function VerificaPlnCodigo(pIdContratoEmptmo: String;
         pHmeDataPrevista: String;
         pIdItemEmptmo: String;
         pHmeTipomov: String
         ): boolean;
      Procedure DesabilitaVazio;
      Procedure PreencheTabelaVirtual;
      Procedure AbreQueriesHistorico;
      Procedure Imprime;
      Function VerificaPreenchimento: Boolean;
      Function verificaDisponibilidadeBloq: Boolean;
      Procedure ValorGetText(Sender: TField; Var Text: String; DisplayText: Boolean);

      Function _UsuarioLogadoNaoPodeConsultarPropriosContratos(pIdPessoaUsuarioLogado, pIdPessoaSelecao: Integer): Boolean; // Paulo Nobre - WO10850

   Public                                                   // Public declarations

      // Marchetti - Pendencia 22042
      sMatricula: String;

      sNUPOld: String;                                      // Felipe A. Santos - SOL 258351/18139 PPM 1315865

   End;

Var
   frmRelContrato: TfrmRelContrato;

Implementation
{$R *.DFM}
Uses
   uDataBase, uSistema, uMensErro, UFuncoesEmptmo, dEmptmo, dMS, FProgresso, uDiasUteis, ppTypes,
   DDividaEP, dLookEmptmo, dCalcEmptmo, FCadHistMovEmptmo, DBaseDados, dRelatoriosUsu, uCalcEmptmo,
   FConfigRelatorio, fImpressaoContrato, dAtualizacaoDiaria, FExecBuscaContrato, uLancContab,
   uIntegraBack, FCadObservacao, uVerificaPreenchimento, FExecSelecionaContrato,

   // Felipe A. Santos - SOL 258351/18139 PPM 1315865 {FJustificativaNup}
   FJustificativaNup;

Function TfrmRelContrato.VerificaPlnCodigo(pIdContratoEmptmo: String;
   pHmeDataPrevista: String;
   pIdItemEmptmo: String;
   pHmeTipomov: String
   ): boolean;
Var sSql: String;
   qryAux: TwwQuery;
Begin
   result := false;
   Try
      sSQL := ' SELECT DISTINCT 1 AS PlnCodigo ' +
         ' FROM histmovemptmo h ' +
         ' WHERE h.idcontratoemptmo    = ' + pIdContratoEmptmo +
         ' AND   h.hmedataprevista     = ' + quotedstr(pHmeDataPrevista) +
         ' AND   h.iditemcentraliza    = ' + pIdItemEmptmo +
         ' AND   h.hmetipomov          = ' + pHmeTipomov +
         ' AND   h.plncodigo IS NOT NULL ' +
         ' AND   h.hmecentraliza       = 0 ' +
         ' AND   h.hmedestacado        = 0 ' +
         ' AND   NVL(h.flgestornado,0) = 0 ';

      (* Cria a Query Auxiliar *)
      qryAux := TwwQuery.Create(Application);
      qryAux.DatabaseName := 'BASEDADOS';
      qryAux.SQL.Text := sSQL;

      qryAux.Open;

      result := (qryAux.FieldByName('PlnCodigo').asinteger = 1);

   Finally
      qryAux.Free;
   End;
End;

Procedure TfrmRelContrato.Sel(i: Extended);
Begin
   lblTitulo.Caption := '';

   With qry Do
   Begin
      LimpaParametros(qry);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat := i;
      Open;
   End;

   If qry.IsEmpty Then
   Begin
      MsgDlg('Não foi possível buscar os dados do Contrato.', 'Empréstimo', mtWarning, [mbOk], 0);
      Repaint;
      Exit;
   End;

   Try
      // Troca a cor do texto de acordo com a situação do Contrato
      Case qryFLGSITUACAO.AsString[1] Of
         'A': lblTitulo.Font.Color := clNavy;
         'C': lblTitulo.Font.Color := clMaroon;
         'E': lblTitulo.Font.Color := clOlive;
         'J': lblTitulo.Font.Color := clMaroon;
         'K': lblTitulo.Font.Color := clOlive;
         'Q': lblTitulo.Font.Color := clGreen;
      End;
   Except
   End;

   // William Moreira da Silva - 224034/17909 - Inicio
   If qryFLGACORDOJUDICIAL.AsInteger = 1 Then
   Begin
      lblAcordoJudicial.visible := True;
   End
   Else
   Begin
      lblAcordoJudicial.visible := False;
   End;
   // William Moreira da Silva - 224034/17909 - Fim

   //Everson Cunha - SIG125555 - Ini
   If qryAcordoQueroPagar.IsEmpty Then
      lblAcordoQueroPagar.Visible := False
   Else
      lblAcordoQueroPagar.Visible := True;
   //Everson Cunha - SIG125555 - Fim

   // Paulo Nobre - SIG136494 - Ini
   If qryPolRenogociacao.IsEmpty Then
      lblPolRenegociacao.Visible := False
   Else
      lblPolRenegociacao.Visible := True;
   // Paulo Nobre - SIG136494 - Fim

  //ALEX
   // ----------------------------------------------------------------------------------------------
{
   if not(qryDATASITUACAO.IsNULL) then
   begin
      lblTitulo.Caption    := qryDESCSITCONTRATO.AsString + ' (' +
                              FormatDateTime('dd/mm/yyyy', qryDATASITUACAO.AsDateTime) + ')';
   end;
}
   // ----------------------------------------------------------------------------------------------

   // André Pontes - pendência 19920 - 09/08/2005
   // ----------------------------------------------------------------------------------------------
   If (Sistema.TipoCliente = 20011) Or (qryDATASITUACAO.IsNULL) Then
   Begin
      Case qryFLGSITUACAO.AsString[1] Of
         'A': lblTitulo.Caption := qryDESCSITCONTRATO.AsString + ' (' +
            FormatDateTime('dd/mm/yyyy', qryDATACREDITO.AsDateTime) + ')';

         'C': lblTitulo.Caption := qryDESCSITCONTRATO.AsString + ' (' +
            FormatDateTime('dd/mm/yyyy', qryDATACANC.AsDateTime) + ')';

         // ----------------------------------------------------------------------------------------
         'E', 'K', 'Q':
            Begin
               With qryDataQuitacao Do
               Begin
                  LimpaParametros(qryDataQuitacao);
                  ParamByName('PIDCONTRATOEMPTMO').AsFloat := i;
                  Open;

                  lblTitulo.Caption := qryDESCSITCONTRATO.AsString + ' (' +
                     FormatDateTime('dd/mm/yyyy', qryDataQuitacaoDATAQUITACAO.AsDateTime) + ')';
               End;
            End;
         // ----------------------------------------------------------------------------------------
      End;
   End;
   // ----------------------------------------------------------------------------------------------
   // FIM André Pontes - pendência 19920 - 09/08/2005

   If Sistema.TipoCliente <> 20011 Then
   Begin
      lblTitulo.Caption := trim(qryDESCSITCONTRATO.AsString);
   End;

   lblInternet.Visible := (qryFLGINTERNET.AsInteger = 1);

   With qryBenefSeguro Do
   Begin
      LimpaParametros(qryBenefSeguro);
      ParamByName('PIDINSCRICAOEMPTMO').AsFloat := rContrato.IDINSCRICAOEMPTMO;
      Open;
   End;

   With qryLogTotalPrev Do
   Begin
      LimpaParametros(qryLogTotalPrev);
      ParamByName('PIDCONTRATO').AsFloat := qryIDCONTRATOEMPTMO.AsFloat;
      Open;
   End;

   qryLogTotalPrevHist.Close;

   AbreQueriesHistorico;

   // Felipe A. Santos SOL 258351/18139 PPM 1315865 - início

   sNUPOld := qry.FieldByName('NUP').AsString;
   dbedtNUP.Text := sNUPOld;

   If bControlaHabilitaNup Then
   Begin
      dbedtNUP.Enabled := True;
      dbedtNUP.Color := clWindow;

      qryLogNUP.Close;
      qryLogNUP.Open;

      qryUpdateNup.Close;
      qryUpdateNup.ParamByName('IDCONTRATOEMPTMO').AsString := qry.FieldByName('IDCONTRATOEMPTMO').AsString;
      qryUpdateNup.Open;

      btnNUP.Enabled := True;
   End;

   // Felipe A. Santos SOL 258351/18139 PPM 1315865 - fim

End;

Procedure TfrmRelContrato.AbreQueriesHistorico;
Var
   sMes: String;
   sAno: String;
Begin
   ParametrosSistema;

   If qryIDCONTRATOEMPTMO.AsFloat = 0 Then
      exit;

   With qryTotalizaAberto Do
   Begin
      LimpaParametros(qryTotalizaAberto);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat := qryIDCONTRATOEMPTMO.AsFloat;
      ParamByName('PHMEDATAPREVISTA').asString := DateTostr(now);
      If dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 Then
         ParamByName('PINIBESUSP').AsInteger := 1;
      Open;
   End;

   With qryItensAberto Do
   Begin
      LimpaParametros(qryItensAberto);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat := qryIDCONTRATOEMPTMO.AsFloat;
      // Denise 07/08/2008 N.Sol 92695 / N.Kintana 395894
      //ParamByName('PHMEDATAPREVISTA').asString    := DateTostr(now);
      // Fim // Denise 07/08/2008 N.Sol 92695 / N.Kintana 395894
      If dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 Then
         ParamByName('PINIBESUSP').AsInteger := 1;
      Open;
   End;

   With qryHistMov Do
   Begin
      LimpaParametros(qryHistMov);

      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;

      ParamByName('PIDCONTRATOEMPTMO').AsFloat := qryIDCONTRATOEMPTMO.AsFloat;

      // Itens de Envio ----------------------------------------------------------------------------
      If rdgExibe.ItemIndex = 1 Then
         ParamByName('PFLGENVIO').AsInteger := 1;

      // Itens Estornados --------------------------------------------------------------------------
      Case rdgEstorno.ItemIndex Of
         1: ParamByName('PFLGESTORNADO').AsInteger := 0;
         2: ParamByName('PFLGESTORNADO').AsInteger := 1;
      End;

      // Evento ------------------------------------------------------------------------------------
      If ((chkFiltroEvento.Checked) And (cboEvento.ItemIndex >= 0)) Then
      Begin
         ParamByName('PHMETIPOMOV').AsInteger := cboEvento.ItemIndex;
      End;

      // Item --------------------------------------------------------------------------------------
      If ((chkFiltroItem.Checked) And (cboEvento.ItemIndex >= 0)) Then
      Begin
         ParamByName('PIDITEMEMPTMO').AsInteger := StrToInt(DBcboItem.LookupValue);
      End;

      // Itens em Aberto ---------------------------------------------------------------------------
      Case rdgFiltroEmAberto.ItemIndex Of
         1: ParamByName('PFLGBAIXADO').AsInteger := 1;
         2: ParamByName('PFLGBAIXADO').AsInteger := 0;
      End;

      // Itens em Aberto ---------------------------------------------------------------------------
      If Not (chkAtuDia.Checked) Then
      Begin
         ParamByName('PNAOEXIBEATUDIA').AsInteger := 1;
      End;

      // Datas -------------------------------------------------------------------------------------
      If chkFaixaDatas.Checked Then
      Begin
         If ((length(trim(edtDataIni.Text)) > 0) Or (length(trim(edtDataFim.Text)) > 0)) Then
         Begin
            ParamByName('PFILTRODATA').AsInteger := 1;
            If length(trim(edtDataIni.Text)) > 0 Then
               ParamByName('PDATAINI').AsDateTime := edtDataIni.Date;
            If length(trim(edtDataFim.Text)) > 0 Then
               ParamByName('PDATAFIM').AsDateTime := edtDataFim.Date;
         End;
      End;

      // Mês de Cobrança ---------------------------------------------------------------------------
      If chkFiltroCobranca.Checked Then
      Begin
         If (((cboMesCobIni.ItemIndex >= 0) And (DBspnAnoCobIni.Value > 1980)) Or
            ((cboMesCobFim.ItemIndex >= 0) And (DBspnAnoCobFim.Value > 1980))) Then
         Begin
            ParamByName('PFILTROCOB').AsInteger := 1;

            If ((cboMesCobIni.ItemIndex >= 0) And (DBspnAnoCobIni.Value > 1980)) Then
            Begin
               sAno := FormatFloat('0000', DBspnAnoCobIni.Value);
               sMes := FormatFloat('00', cboMesCobIni.ItemIndex + 1);

               ParamByName('PANOMESCOBINI').AsString := sAno + sMes;
            End;

            If ((cboMesCobFim.ItemIndex >= 0) And (DBspnAnoCobFim.Value > 1980)) Then
            Begin
               sAno := FormatFloat('0000', DBspnAnoCobFim.Value);
               sMes := FormatFloat('00', cboMesCobFim.ItemIndex + 1);

               ParamByName('PANOMESCOBFIM').AsString := sAno + sMes;
            End;
         End;
      End;

      If chkFaixaDatas.Checked Then
      Begin
         If ((length(trim(edtDataIni.Text)) > 0) Or (length(trim(edtDataFim.Text)) > 0)) Then
         Begin
            ParamByName('PFILTRODATA').AsInteger := 1;
            If length(trim(edtDataIni.Text)) > 0 Then
               ParamByName('PDATAINI').AsDateTime := edtDataIni.Date;
            If length(trim(edtDataFim.Text)) > 0 Then
               ParamByName('PDATAFIM').AsDateTime := edtDataFim.Date;
         End;
      End;

      // Parcela -----------------------------------------------------------------------------------
      If chkParcela.Checked Then
         ParamByName('PHMEPARCELA').AsInteger := trunc(spnParcela.Value);

      // Ordenação ---------------------------------------------------------------------------------
      ParamByName('PORDEM').AsInteger := (rdgOrdena.ItemIndex + 1);

      ParamByName('PEXCEPCIONAL').AsInteger := dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger;

      Open;
   End;

End;

Procedure TfrmRelContrato.btnBuscaContratoClick(Sender: TObject);
Var
   MontaSelect: TMontaSelect;
   sValor: String;
   sSQL: String;                                            //William Moreira da Silva - SOL - PPm
   iIdPessoaSelecionada: Integer;                           // Paulo Nobre - WO10850
Begin
   qryMessagem.Close; //leandro wo15681
   twMensagem.hide;   //leandro wo15681

   // **************************************************************************
   // Marchetti - 14/07/2003
   // **************************************************************************
   ParametrosSistema;

   If dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 Then
   Begin
      Application.CreateForm(TfrmExecBuscaContrato, frmExecBuscaContrato);
      frmExecBuscaContrato.Filtro := '';
      frmExecBuscaContrato.ShowModal;

      Repaint;

      If frmExecBuscaContrato.RetornouValor Then
      Begin
         Screen.Cursor := crHourGlass;

         // Paulo Nobre - WO10850 - Inicio                                                                 // idpessoa
         If _UsuarioLogadoNaoPodeConsultarPropriosContratos(Sistema.idusuario, strtoint(frmExecBuscaContrato.ValoresChave[4])) Then
            Exit;
         // Paulo Nobre - WO10850 - Fim

         sValor := frmExecBuscaContrato.ValoresChave[0];
         frmExecBuscaContrato.Free;

         Screen.Cursor := crHourGlass;

         qryItensAberto.Close;
         qryHistMovVirtual.Close;
         qryHistMov.Close;

         edtSaldoAtual.Value := 0;
         edtParcRestante.Value := 0;
         edtSaldoDevedor.Value := 0;
         fcLblPerda.Visible := False;

         // Abre a query principal com o participante escolhido
         Sel(StrToFloat(sValor));

         If (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) And
            (qryIDPESSOA.AsInteger <> qryIDBENEF.AsInteger) And
            (qryFLGINTERNO.AsString = 'CA') Then
         Begin
            DBedtSitPart.Text := 'Pensionista';
         End;

         //ALEX

         PreencheDadosContrato(qry, rContrato);

         //Fanuel Junior SOL 153382 Kintana 1159322
         qryValorMaximo.Close;
         //qryValorMaximo.ParamByName('IDTITULAR').AsInteger := qryIDPESSOA.AsInteger;  // Edilaine - Sol 163624 / KTN 1399837 - comentei
         qryValorMaximo.ParamByname('IDCONTRATO').asFloat := rContrato.idContratoEmptmo; // Edilaine - Sol 163624 / KTN 1399837
         qryValorMaximo.Open;
         //Fanuel Junior SOL 153382 Kintana 1159322

         //Renato Visoni
         QryEventos.Close;
         QryEventos.ParamByname('IDCONTRATOEMPTMO').asFloat := rContrato.idContratoEmptmo;
         QryEventos.Open;
         //Renato Visoni

         // Pendência 23536 - Marcos Topini
         With qryHistMigracoes Do
         Begin
            LimpaParametros(qryHistMigracoes);
            ParamByName('IDCONTRATO').AsFloat := rContrato.idContratoEmptmo;
            Open;

            //Pendência 23536 - 15/02/2007 - Alberto
            qryHistMigracoesAfterScroll(qryHistMigracoes)
         End;
         // Fim Pendência 23536

         // Saldo Devedor -----------------------------------------------------------------------------
         With dtmCalcEmptmo.qrySaldoAnt Do
         Begin
            LimpaParametros(dtmCalcEmptmo.qrySaldoAnt);
            ParamByName('PIDCONTRATOEMPTMO').AsFloat := rContrato.IDContratoEmptmo;
            ParamByName('PHMEDATAATUALIZA').AsDateTime := Sysdate;
            Open;

            If Not (IsEmpty) Then
               edtSaldoDevedor.Value := dtmCalcEmptmo.qrySaldoAntHMESALDODEV.AsCurrency;
         End;
         // Fim Saldo Devedor -------------------------------------------------------------------------

         // Parcelas Restantes-------------------------------------------------------------------------
         With qryParcelasRestantes Do
         Begin
            LimpaParametros(qryParcelasRestantes);
            ParamByName('PIDCONTRATOEMPTMO').AsFloat := rContrato.IDContratoEmptmo;
            Open;

            If Not (IsEmpty) Then
               edtParcRestante.Value := qryParcelasRestantesPARCELAS_RESTANTES.AsInteger;
         End;
         // Fim Parcelas Restantes --------------------------------------------------------------------

         With qryBenefSeguro Do
         Begin
            LimpaParametros(qryBenefSeguro);
            ParamByName('PIDINSCRICAOEMPTMO').AsFloat := rContrato.IDINSCRICAOEMPTMO;
            Open;
         End;

         //Cássio Rovaroto - SIG nº 94625 - Início
         LimpaParametros(qryDebAutomatico);
         qryDebAutomatico.paramByName('PIDCONTRATOEMPTMO').asFloat := rContrato.IDContratoEmptmo;
         qryDebAutomatico.Open;
         //Cássio Rovaroto - SIG nº 94625 - Fim

         DesabilitaVazio;

         pgcDados.ActivePageIndex := 0;

         Screen.Cursor := crDefault;
      End
      Else
      Begin
         DBedtNumContrato.Color := clBtnFace;
         DBedtParticipante.Color := clBtnFace;
      End;                                                  // if MontaSelect.RetornouValor
   End
   Else
   Begin
      MontaSelect := dtmMS.MS_ContratoEmptmo;

      MontaSelect.Executar;

      // Redesenha o form na volta do MontaSelect
      Repaint;

      If MontaSelect.RetornouValor Then
      Begin
         Screen.Cursor := crHourGlass;

         // Paulo Nobre - WO10850 - Inicio
         iIdPessoaSelecionada := 0;
         With twwquery.create(self) Do
         Begin
            databasename := 'basedados';
            close;
            SQL.clear;
            sSQL := 'SELECT IDPESSOA FROM ELEGPATRO WHERE MATRICULA = ' + quotedstr(MontaSelect.ValoresChave[3]);  // Matricula
            SQL.Add(sSQL);
            Open;
            If Not isEmpty Then
               iIdPessoaSelecionada := fieldbyname('IDPESSOA').asInteger;
         End;

         If _UsuarioLogadoNaoPodeConsultarPropriosContratos(Sistema.idusuario, iIdPessoaSelecionada) Then
            Exit;
         // Paulo Nobre - WO10850 - Fim

         qryItensAberto.Close;
         qryHistMovVirtual.Close;
         qryHistMov.Close;

         edtSaldoAtual.Value := 0;
         edtParcRestante.Value := 0;
         edtSaldoDevedor.Value := 0;

         // Abre a query principal com o participante escolhido
         Sel(StrToFloat(MontaSelect.ValoresChave[0]));

         If (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) And
            (qryIDPESSOA.AsInteger <> qryIDBENEF.AsInteger) And
            (qryFLGINTERNO.AsString = 'CA') Then
         Begin
            DBedtSitPart.Text := 'Pensionista';
         End;

         PreencheDadosContrato(qry, rContrato);

         // Pendência 23536 - Marcos Topini
         With qryHistMigracoes Do
         Begin
            LimpaParametros(qryHistMigracoes);
            ParamByName('IDCONTRATO').AsFloat := rContrato.idContratoEmptmo;
            //ParamByName('IDCONTRATO').AsFloat := StrToFloat(MontaSelect.ValoresChave[0]);
            Open;

            //Pendência 23536 - 15/02/2007 - Alberto
            qryHistMigracoesAfterScroll(qryHistMigracoes)
         End;
         // Fim Pendência 23536

         // Saldo Devedor -----------------------------------------------------------------------------
         With dtmCalcEmptmo.qrySaldoAnt Do
         Begin
            LimpaParametros(dtmCalcEmptmo.qrySaldoAnt);
            ParamByName('PIDCONTRATOEMPTMO').AsFloat := rContrato.IDContratoEmptmo;
            ParamByName('PHMEDATAATUALIZA').AsDateTime := Sysdate;
            Open;

            If Not (IsEmpty) Then
               edtSaldoDevedor.Value := dtmCalcEmptmo.qrySaldoAntHMESALDODEV.AsCurrency;
         End;
         // Fim Saldo Devedor -------------------------------------------------------------------------

         // Parcelas Restantes-------------------------------------------------------------------------
         With qryParcelasRestantes Do
         Begin
            LimpaParametros(qryParcelasRestantes);
            ParamByName('PIDCONTRATOEMPTMO').AsFloat := rContrato.IDContratoEmptmo;
            Open;

            If Not (IsEmpty) Then
               edtParcRestante.Value := qryParcelasRestantesPARCELAS_RESTANTES.AsInteger;
         End;
         // Fim Parcelas Restantes --------------------------------------------------------------------

         With qryBenefSeguro Do
         Begin
            LimpaParametros(qryBenefSeguro);
            ParamByName('PIDINSCRICAOEMPTMO').AsFloat := rContrato.IDINSCRICAOEMPTMO;
            Open;
         End;

         DesabilitaVazio;

         pgcDados.ActivePageIndex := 0;

         Screen.Cursor := crDefault;
      End
      Else
      Begin
         DBedtNumContrato.Color := clBtnFace;
         DBedtParticipante.Color := clBtnFace;
      End;                                                  // if MontaSelect.RetornouValor

   End;
   // **************************************************************************

   If (qryFLGPERDAEFETIVA.AsInteger = 1) Then
      fcLblPerda.visible := True
   Else
      fcLblPerda.visible := False;

   //William Moreira da Silva - SOL 255322/17559 PPM 984370- Inicio
   If qry.FieldByname('FLGEXCEPCIONAL').AsInteger = 1 Then
   Begin
      //FclExcepcional.visible := True
      rgExcepcional.visible := true;

      chkValorSolictado.visible := true;
      chkValorSolictado.checked := true;

      chkElegibilidade.visible := true;
      chkElegibilidade.checked := true;

      chkInadimplencia.visible := true;
      chkInadimplencia.checked := true;

      chkOutros.visible := true;
      chkOutros.checked := true;
   End
   Else
   Begin
      rgExcepcional.visible := false;
      chkValorSolictado.visible := false;
      chkElegibilidade.visible := false;
      chkInadimplencia.visible := false;
      chkOutros.visible := false;
      //FclExcepcional.visible:= False;
   End;

   With twwquery.create(self) Do
   Begin
      databasename := 'basedados';
      close;
      sql.clear;

      sSQL := 'SELECT CXE.IDGRUPOEXCEPCIONAL FROM' + #13#10 +
         'CONTRATOEMPTMOXEXCEPCIONAL CXE, GRUPOEXCEPCIONALEMPTMO GRU' + #13#10 +
         'WHERE CXE.IDCONTRATOEMPTMO = CXE.IDCONTRATOEMPTMO' + #13#10 +
         'AND GRU.IDGRUPOEXCEPCIONAL = CXE.IDGRUPOEXCEPCIONAL' + #13#10 +
         'AND CXE.IDCONTRATOEMPTMO = ' + floattostr(rContrato.IDContratoEmptmo);

      SQL.Add(sSQl);
      Open;

      If Not isEmpty Then
      Begin
         rgExcepcional.visible := true;
         chkValorSolictado.checked := false;
         chkElegibilidade.checked := false;
         chkInadimplencia.checked := false;
         chkOutros.checked := false;
         While (Not EOF) Do
         Begin
            If (fieldByname('IDGRUPOEXCEPCIONAL').asInteger = 1) Then
            Begin
               chkValorSolictado.visible := true;
               chkValorSolictado.checked := true;
            End;

            If (fieldByname('IDGRUPOEXCEPCIONAL').asInteger = 2) Then
            Begin
               chkElegibilidade.visible := true;
               chkElegibilidade.checked := true;
            End;

            If (fieldByname('IDGRUPOEXCEPCIONAL').asInteger = 3) Then
            Begin
               chkInadimplencia.visible := true;
               chkInadimplencia.checked := true;
            End;

            If (fieldByname('IDGRUPOEXCEPCIONAL').asInteger = 4) Then
            Begin
               chkOutros.visible := true;
               chkOutros.checked := true;
            End;
            next;
         End;
         close;
      End;
   End;
   //William Moreira da Silva - SOL 255322/17559 PPM 984370- Fim

   //Higor Nayde Ferreira SOL - 174521 KTN - 1576354 Inicio
   btnContratoQuitacao.Caption := qry.FieldByName('IDCONTRQUITACAO').AsString;
   QryContratosQuitados.Close;
   QryContratosQuitados.ParamByname('IDCONTRATOEMPTMO').AsString := qry.FieldByName('IDCONTRATOEMPTMO').AsString;
   QryContratosQuitados.Open;
   //Higor Nayde Ferreira SOL - 174521 KTN - 1576354 Fim
   {

   QryContratosQuitados.ParamByName('IDCONTRATOEMPTMO').AsString
   QryContratosQuitados.Active := True;    }

   //leandro wo15681 inicio
   if not (qryMessagem.Active) then
   begin
     qryMessagem.ParamByName('IDCONTRATOEMPTMO').AsFloat  := rContrato.idContratoEmptmo;
     qryMessagem.Open;
     qryMessagem.First;

     if not (qryMessagem.IsEmpty) then
     begin
       qryMessagem.fetchall;
       rEditMSG.Text      := qryMessagem.FieldByName('DESCRICAO').AsString;
       twMensagem.Visible := True;
       if qryMessagem.RecordCount>1 then
         btnProximo.Enabled    := true
       else
         btnProximo.Enabled    := false;
       btnAnterior.Enabled    := False;
     end;
   end;
   //leandro wo15681 fim

End;

Procedure TfrmRelContrato.DBgrdHistMovCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
Begin
   Inherited;

   // faz com que as linhas do grid tenham cores alternadas
   If State <> [gdSelected] Then
   Begin
      If Not (Highlight) Then
      Begin
         // linhas ímpares = amarelo, linhas pares = branco
         If ((Sender As TwwDBGrid).CalcCellRow Mod 2) = 0 Then
         Begin
            ABrush.Color := $00C0FFFF;                      // amarelo bebê
         End
         Else
         Begin
            ABrush.Color := clWindow;
         End;
      End;

      // fonte fica azul em caso de abono
      // fonte fica verde em caso de quitação
      If Not (Highlight) Then
      Begin
         If Field = qryHistMovHMEDATAEFETIVA Then
         Begin
            AFont.Color := clWindowText;
            If qryHistMovFLGQUITADO.AsInteger = 1 Then
               AFont.Color := clGreen;
            If qryHistMovFLGABONADO.AsInteger = 1 Then
               AFont.Color := clBlue;
         End;
      End;

      If Not (Highlight) Then
      Begin
         If Field = qryHistMovHMEVLREFETIVO Then
         Begin
            AFont.Color := clWindowText;
            If qryHistMovFLGSUSPENSAO.AsInteger = 1 Then
               AFont.Color := clGreen;
            If qryHistMovFLGQUITADO.AsInteger = 1 Then
               AFont.Color := clGreen;
            If qryHistMovFLGABONADO.AsInteger = 1 Then
               AFont.Color := clBlue;
            If qryHistMovFLGESTORNADO.AsInteger = 1 Then
               AFont.Color := clMaroon;
         End;
      End;

   End
   Else
   Begin
      ABrush.Color := clHighLight;
      AFont.Color := clHighLightText;
   End;
End;

Procedure TfrmRelContrato.DBgrdHistMovTopRowChanged(Sender: TObject);
Begin
   Inherited;
   (* acerta as cores quando muda a linha da grid *)
   (Sender As TwwDBGrid).Invalidate;
End;

Procedure TfrmRelContrato.DesabilitaVazio;
Var
   TBS: TTabSheet;
   Group: TGroupBox;
   i, j, k: Integer;
Begin
   TBS := Nil;

   DBedtNumContrato.Color := clWindow;
   DBedtParticipante.Color := clWindow;

   // PageControl principal ------------------------------------------------------------------------
   For j := 0 To (pgcDados.ControlCount - 1) Do
   Begin
      If (pgcDados.Controls[j] Is TTabSheet) Then
         TBS := (pgcDados.Controls[j] As TTabSheet);

      For i := 0 To TBS.ControlCount - 1 Do
      Begin
         If (TBS.Controls[i] Is TDBEdit) Then
         Begin
            If (TBS.Controls[i] As TDBEdit).DataSource.DataSet.FieldByName((TBS.Controls[i] As TDBEdit).DataField).IsNull Then
            Begin
               (TBS.Controls[i] As TDBEdit).Color := clBtnFace;
            End
            Else
            Begin
               (TBS.Controls[i] As TDBEdit).Color := clWindow;
            End;
         End;                                               // if TDBEdit

         If (TBS.Controls[i] Is TRealEdit) Then
         Begin
            If (TBS.Controls[i] As TRealEdit).Value = 0 Then
            Begin
               (TBS.Controls[i] As TRealEdit).Color := clBtnFace;
            End
            Else
            Begin
               (TBS.Controls[i] As TRealEdit).Color := clWindow;
            End;
         End;                                               // if TRealEdit

         If (TBS.Controls[i] Is TCMDateTimePicker) Then
         Begin
            If (TBS.Controls[i] As TCMDateTimePicker).DataField <> '' Then
            Begin
               If (TBS.Controls[i] As TCMDateTimePicker).DataSource.DataSet.FieldByName((TBS.Controls[i] As TCMDateTimePicker).DataField).IsNull Then
               Begin
                  (TBS.Controls[i] As TCMDateTimePicker).Color := clBtnFace;
               End
               Else
               Begin
                  (TBS.Controls[i] As TCMDateTimePicker).Color := clWindow;
               End;
            End;
         End;                                               // if TCMDateTimePicker

         If (TBS.Controls[i] Is TGroupBox) Then
         Begin
            Group := (TBS.Controls[i] As TGroupBox);

            For k := 0 To Group.ControlCount - 1 Do
            Begin
               If (Group.Controls[k] Is TDBEdit) Then
               Begin
                  If (Group.Controls[k] As TDBEdit).DataSource.DataSet.FieldByName((Group.Controls[k] As TDBEdit).DataField).IsNull Then
                  Begin
                     (Group.Controls[k] As TDBEdit).Color := clBtnFace;
                  End
                  Else
                  Begin
                     (Group.Controls[k] As TDBEdit).Color := clWindow;
                  End;

               End;                                         // if TDBEdit
            End;                                            // for Group
         End;                                               // if TGroupBox
      End;                                                  // for TBS
   End;                                                     // for pgcDados
   // ----------------------------------------------------------------------------------------------

   // PageControl Detalhes -------------------------------------------------------------------------
   For j := 0 To (pgcSecundario.ControlCount - 1) Do
   Begin
      If (pgcSecundario.Controls[j] Is TTabSheet) Then
         TBS := (pgcSecundario.Controls[j] As TTabSheet);

      For i := 0 To TBS.ControlCount - 1 Do
      Begin
         If (TBS.Controls[i] Is TDBEdit) Then
         Begin
            If (TBS.Controls[i] As TDBEdit).DataSource.DataSet.FieldByName((TBS.Controls[i] As TDBEdit).DataField).IsNull Then
            Begin
               (TBS.Controls[i] As TDBEdit).Color := clBtnFace;
            End
            Else
            Begin
               (TBS.Controls[i] As TDBEdit).Color := clWindow;
            End;
         End;                                               // if TDBEdit

         If (TBS.Controls[i] Is TRealEdit) Then
         Begin
            If (TBS.Controls[i] As TRealEdit).Value = 0 Then
            Begin
               (TBS.Controls[i] As TRealEdit).Color := clBtnFace;
            End
            Else
            Begin
               (TBS.Controls[i] As TRealEdit).Color := clWindow;
            End;
         End;                                               // if TRealEdit

         If (TBS.Controls[i] Is TCMDateTimePicker) Then
         Begin
            If (TBS.Controls[i] As TCMDateTimePicker).DataField <> '' Then
            Begin
               If (TBS.Controls[i] As TCMDateTimePicker).DataSource.DataSet.FieldByName((TBS.Controls[i] As TCMDateTimePicker).DataField).IsNull Then
               Begin
                  (TBS.Controls[i] As TCMDateTimePicker).Color := clBtnFace;
               End
               Else
               Begin
                  (TBS.Controls[i] As TCMDateTimePicker).Color := clWindow;
               End;
            End;
         End;                                               // if TCMDateTimePicker

         If (TBS.Controls[i] Is TGroupBox) Then
         Begin
            Group := (TBS.Controls[i] As TGroupBox);

            For k := 0 To Group.ControlCount - 1 Do
            Begin
               If (Group.Controls[k] Is TDBEdit) Then
               Begin
                  If (Group.Controls[k] As TDBEdit).DataSource.DataSet.FieldByName((Group.Controls[k] As TDBEdit).DataField).IsNull Then
                  Begin
                     (Group.Controls[k] As TDBEdit).Color := clBtnFace;
                  End
                  Else
                  Begin
                     (Group.Controls[k] As TDBEdit).Color := clWindow;
                  End;

               End;                                         // if TDBEdit
            End;                                            // for Group
         End;                                               // if TGroupBox
      End;                                                  // for TBS
   End;                                                     // for pgcDados

   DBedtTipoContrato.Color := $00C0FFFF;

   // ----------------------------------------------------------------------------------------------

   // PageControl Detalhes -------------------------------------------------------------------------
   For j := 0 To (pgcDetalhe.ControlCount - 1) Do
   Begin
      If (pgcDetalhe.Controls[j] Is TTabSheet) Then
         TBS := (pgcDetalhe.Controls[j] As TTabSheet);

      For i := 0 To TBS.ControlCount - 1 Do
      Begin
         If (TBS.Controls[i] Is TDBEdit) Then
         Begin
            If (TBS.Controls[i] As TDBEdit).DataSource.DataSet.FieldByName((TBS.Controls[i] As TDBEdit).DataField).IsNull Then
            Begin
               (TBS.Controls[i] As TDBEdit).Color := clBtnFace;
            End
            Else
            Begin
               (TBS.Controls[i] As TDBEdit).Color := clWindow;
            End;
         End;                                               // if TDBEdit

         If (TBS.Controls[i] Is TRealEdit) Then
         Begin
            If (TBS.Controls[i] As TRealEdit).Value = 0 Then
            Begin
               (TBS.Controls[i] As TRealEdit).Color := clBtnFace;
            End
            Else
            Begin
               (TBS.Controls[i] As TRealEdit).Color := clWindow;
            End;
         End;                                               // if TRealEdit

         If (TBS.Controls[i] Is TCMDateTimePicker) Then
         Begin
            If (TBS.Controls[i] As TCMDateTimePicker).DataField <> '' Then
            Begin
               If (TBS.Controls[i] As TCMDateTimePicker).DataSource.DataSet.FieldByName((TBS.Controls[i] As TCMDateTimePicker).DataField).IsNull Then
               Begin
                  (TBS.Controls[i] As TCMDateTimePicker).Color := clBtnFace;
               End
               Else
               Begin
                  (TBS.Controls[i] As TCMDateTimePicker).Color := clWindow;
               End;
            End;
         End;                                               // if TCMDateTimePicker

         If (TBS.Controls[i] Is TGroupBox) Then
         Begin
            Group := (TBS.Controls[i] As TGroupBox);

            For k := 0 To Group.ControlCount - 1 Do
            Begin
               If (Group.Controls[k] Is TDBEdit) Then
               Begin
                  If (Group.Controls[k] As TDBEdit).DataSource.DataSet.FieldByName((Group.Controls[k] As TDBEdit).DataField).IsNull Then
                  Begin
                     (Group.Controls[k] As TDBEdit).Color := clBtnFace;
                  End
                  Else
                  Begin
                     (Group.Controls[k] As TDBEdit).Color := clWindow;
                  End;

               End;                                         // if TDBEdit
            End;                                            // for Group
         End;                                               // if TGroupBox
      End;                                                  // for TBS
   End;                                                     // for pgcDados
   // ----------------------------------------------------------------------------------------------
End;

Procedure TfrmRelContrato.DBgrdHistMovCellChanged(Sender: TObject);
Var
   i: Integer;
Begin
   Try
      For i := 0 To (tbsDetalheParcela.ControlCount - 1) Do
      Begin

         If (tbsDetalheParcela.Controls[i] Is TDBEdit) Then
         Begin

            If (tbsDetalheParcela.Controls[i] As TDBEdit).DataSource.DataSet.FieldByName((tbsDetalheParcela.Controls[i] As TDBEdit).DataField).IsNull Then
            Begin
               (tbsDetalheParcela.Controls[i] As TDBEdit).Color := clBtnFace;
            End
            Else
            Begin
               (tbsDetalheParcela.Controls[i] As TDBEdit).Color := clWindow;
            End;

         End;                                               (* if TDBEdit *)

         If (tbsDetalheParcela.Controls[i] Is TCMDateTimePicker) Then
         Begin

            If (tbsDetalheParcela.Controls[i] As TCMDateTimePicker).DataSource.DataSet.FieldByName((tbsDetalheParcela.Controls[i] As TCMDateTimePicker).DataField).IsNull Then
            Begin
               (tbsDetalheParcela.Controls[i] As TCMDateTimePicker).Color := clBtnFace;
            End
            Else
            Begin
               (tbsDetalheParcela.Controls[i] As TCMDateTimePicker).Color := clWindow;
            End;

         End;                                               // if TCMDateTimePicker *)

      End;                                                  // for tbsDetalheParcela *)
   Except
      //
   End;
End;

Procedure TfrmRelContrato.btnImprimirClick(Sender: TObject);
Begin
   twMensagem.hide;    //leandro wo15681

   Inherited;

   If MsgDlg('Deseja imprimir o Contrato?', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
      Repaint;
      Imprime;
   End;
   Repaint;
End;

Procedure TfrmRelContrato.Imprime;
Var
   sSQL, sSqldoUsuario, sArquivoTemp, sSQLTemp: String;
   qryAux: TwwQuery;
Begin
   sSql :=
      'SELECT' + #13 +
      '  TIP.IDREPORTS, TIP.ORIGEMCM ' + #13 +
      'FROM ' + #13 +
      '  TIPOCONTREMPTMO  TIP, ' + #13 +
      '  TIPOEMPTMO TEM ' + #13 +
      'WHERE ' + #13 +
      '      ( TIP.IDTIPOEMPTMO      = TEM.IDTIPOEMPTMO ) ' + #13 +
      '  AND ( TEM.IDEMPRESAPROP     = ' + IntToStr(Sistema.idEmpresa) + ' ) ' + #13 +
      '  AND ( TIP.IDTIPOCONTREMPTMO = ' + qryIDTIPOCONTREMPTMO.AsString + ' )';

   (* Cria a Query Auxiliar *)
   qryAux := TwwQuery.Create(Application);
   qryAux.DatabaseName := 'BASEDADOS';
   qryAux.SQL.Text := sSQL;

   Try
      MostraEspera('Preparando impressão do Contrato...');

      (* Verifica se existe algum relatório parametrizável para o Tipo de Contrato *)
      Try
         qryAux.Open
      Except
         MsgDlg('Não há Contrato a imprimir definido para esse Tipo de Contrato.', 'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;
         Exit;
      End;

      (* Vai usar o relatório parametrizado pelo usuário *)
      If Not (qryAux.IsEmpty) Then
      Begin

         sSql :=
            'SELECT ' + #13 +
            '  REP.NAME, DAT.TEMPLATE, REP.IDREPORTS, REP.ORIGEMCM ' + #13 +
            'FROM ' + #13 +
            '  REPORTS REP, ' + #13 +
            '  DATAVIEW DAT ' + #13 +
            'WHERE ' + #13 +
            '      ( REP.IDREPORTS  = ' + qryAux.FieldByName('IDREPORTS').AsString + ' ) ' + #13 +
            '  AND ( DAT.IDDATAVIEW = REP.IDDATAVIEW ) ' + #13 +
            '  AND ( DAT.ORIGEMCMDV = REP.ORIGEMCMDV ) ';

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Text := sSQL;

         Try
            qryAux.Open;
            sSqldoUsuario := qryAux.FieldByName('TEMPLATE').AsString;
         Except
            MsgDlg('Erro ao buscar modelo para impressão!', 'Empréstimo',
               mtError, [mbOk], 0);
            Repaint;
            Exit;
         End;                                               (* try..except *)

         (* Abrir query com LAY-OUT do relatorio. Para isto, o campo TEMPLATE tem
            que estar no FieldsEditor e a query tem que ser RequestLive *)
         dtmRelatoriosUsu.qryDoUsuario.Close;
         dtmRelatoriosUsu.qryDoUsuario.ParamByName('IDREPORTS').AsInteger := qryAux.FieldByName('IDREPORTS').AsInteger;
         dtmRelatoriosUsu.qryDoUsuario.ParamByName('ORIGEMCM').AsInteger := qryAux.FieldByName('ORIGEMCM').AsInteger;

         Try
            dtmRelatoriosUsu.qryDoUsuario.Open;
         Except
            MsgDlg('Erro ao abrir o layout do Tipo de Contrato.',
               'Empréstimo', mtError, [mbOk], 0);
            Repaint;
            Exit;
         End;

         If dtmRelatoriosUsu.qryDoUsuario.IsEmpty Then
         Begin
            MsgDlg('Não foi encontrado layout para o Tipo de Contrato. Favor verificar.',
               'Empréstimo', mtError, [mbOk], 0);
            Repaint;
            Exit;
         End;                                               (* if IsEmpty *)

         With dtmRelatoriosUsu Do
         Begin
            sArquivoTemp := Sistema.TempDir + 'APrevRelContrato.tmp';
            sSQLTemp := Sistema.TempDir + 'APrevSQLRelContrato.sql';

            qryDoUsuarioTEMPLATE.SaveToFile(sArquivoTemp);

            qryRelatParametrizavel.Close;
            qryRelatParametrizavel.SQL.Clear;
            qryRelatParametrizavel.SQL.Text := sSqldoUsuario;

            qryRelatParametrizavel.SQL.Add(' AND CONTRATOEMPTMO.IDCONTRATOEMPTMO  = ' + FloatToStr(qryIDCONTRATOEMPTMO.AsFloat));

            qryRelatParametrizavel.SQL.SaveToFile(sSQLTemp);
            qryRelatParametrizavel.Open;

            dsRelatParametrizavel.DataSet := qryRelatParametrizavel;
            pplRelatParametrizavel.DataSource := dsRelatParametrizavel;
            rpRelatParametrizavel.Template.SaveTo := stFile;
            rpRelatParametrizavel.Template.Format := ftBinary;
            rpRelatParametrizavel.Template.FileName := sArquivoTemp;
            rpRelatParametrizavel.Template.LoadFromFile;

            rpRelatParametrizavel.DataPipeline := pplRelatParametrizavel;

            EscondeEspera;
            Repaint;

            (* Visualização do Contrato *)

            frmImpressaoContrato := TfrmImpressaoContrato.Create(Application);
            frmImpressaoContrato.QryDados := qryRelatParametrizavel;
            frmImpressaoContrato.idReports := qryAux.FieldByName('IDREPORTS').AsInteger;
            frmImpressaoContrato.idOrigem := qryAux.FieldByName('ORIGEMCM').AsInteger;
            frmImpressaoContrato.sNomeRelat := 'Contrato - ' + qryIDCONTRATOEMPTMO.AsString;

            frmImpressaoContrato.bbtnConfirmarClick(Self);
            frmImpressaoContrato.bbtnSairClick(Self);

            DeleteFile(sArquivoTemp);
            DeleteFile(sSQLTemp);
         End;                                               (* with *)

      End
      Else
      Begin

         (* Vai usar o relatório padrão *)
         MsgDlg('É necessário implementar o modelo do Contrato através do módulo Gerador de Relatórios.',
            'Empréstimo', mtInformation, [mbOk], 0);
         Repaint;

      End;                                                  (* else not qryAux.IsEmpty *)

   Finally
      EscondeEspera;
      qryAux.Free;
   End;
End;

Procedure TfrmRelContrato.btnAtualizaSaldoClick(Sender: TObject);
Var
   sArq: String;
Begin
   sArq := 'SimulaQuitacao' + '-' +
      FormatDateTime('yyyymmdd-hhnnss', Now) + '-' +
      'matr' + qryMATRICULA.AsString +
      '.log';

   If ((qryFLGSITUACAO.AsString = 'K') Or (qryFLGSITUACAO.AsString = 'Q')) Then
   Begin
      MsgDlg('O Contrato já teve o valor de quitação calculado.', 'Empréstimo', mtInformation, [mbOk], 0);
      Repaint;
      Exit;
   End;

   Try
      //      DesabilitaBotoes;

            // Configurando o Form com a Barra de Progresso que será usado na função CalculaItensAtualiza
      With frmProgresso Do
      Begin
         BotaoVisivel := True;
         BotaoHabilitado := True;
      End;

      vLista := Nil;

      rContrato.IDSitPart := qryIDSITPART.AsInteger;

      // André Pontes - 06/10/2005
      // Limpa o IDCalculo para que não ocorra erro em uma nova iteração das regras
      dtmEmptmo.Regra.IDCalculo := 0;
      // FIM André Pontes - 06/10/2005

      If rdgMetodo.ItemIndex = 0 Then
      Begin
         If Not (CalcEmptmo.CalculaItensQuitacao(rContrato,
            3,                                              // Origem
            edtDataQuitacao.Date,
            -1,                                             // André Pontes - 14/06/2004 - pendência 16984
            0,
            vLista,
            True,
            True,
            False,
            sArq
            )) Then
         Begin
            MsgDlg('Houve ERRO no cálculo dos itens de atualização. Favor verificar a(s) Regra(s) associada(s).',
               'Empréstimo', mtError, [mbOk], 0);
            Repaint;

            // Não foi possível atualizar os itens, ou por problemas no Cálculo, ou
            // por Cancelamento do Usuário, logo o procedimento será abortado
            Exit;
         End;
      End
      Else
      Begin
         If Not (CalcEmptmo.CalculaItensQuitacaoNOVA(rContrato,
            3,                                              // Origem
            edtDataQuitacao.Date,
            -1,                                             // André Pontes - 14/06/2004 - pendência 16984
            0,
            vLista,
            True,
            True,
            False,
            sArq
            )) Then
         Begin
            MsgDlg('Houve ERRO no cálculo dos itens de atualização. Favor verificar a(s) Regra(s) associada(s).',
               'Empréstimo', mtError, [mbOk], 0);
            Repaint;

            // Não foi possível atualizar os itens, ou por problemas no Cálculo, ou
            // por Cancelamento do Usuário, logo o procedimento será abortado
            Exit;
         End;
      End;

      lblSaldoAtualizado.Caption := 'Valor projetado para Quitação em ' + edtDataQuitacao.Text + ':';

      PreencheTabelaVirtual;

   Finally
      EscondeFormProgresso;

      If btnAtualizaSaldo.CanFocus Then
         btnAtualizaSaldo.SetFocus;
      Repaint;
   End;
End;

Procedure TfrmRelContrato.PreencheTabelaVirtual;
Var
   i: Integer;
   sAno, sMes: String;
   fSaldo: Currency;
Begin
   qryHistMovVirtual.Close;
   qryHistMovVirtual.Open;

   (* Laço que varre o vetor Lista inserindo na tabela virtual TODOS os itens calculados *)

   fSaldo := 0;
   For i := 0 To High(vLista) Do
   Begin

      qryHistMovVirtual.Insert;

      qryHistMovVirtualITEDESCRICAO.AsString := vLista[i].Nome;
      qryHistMovVirtualANOMES.AsString := sMes + '/' + sAno;
      qryHistMovVirtualHMEANOCOMPETENCIA.AsInteger := vLista[i].AnoCompetencia;
      qryHistMovVirtualHMEMESCOMPETENCIA.AsInteger := vLista[i].MesCompetencia;
      qryHistMovVirtualHMESEQCOBRANCA.AsInteger := vLista[i].SeqCobranca;
      qryHistMovVirtualHMETIPOMOV.AsInteger := vLista[i].iEvento;

      Case vLista[i].iEvento Of
         0: qryHistMovVirtualEVENTO.AsString := 'Concessão';
         1: qryHistMovVirtualEVENTO.AsString := 'Parcela';
         2: qryHistMovVirtualEVENTO.AsString := 'Amortização';
         3: qryHistMovVirtualEVENTO.AsString := 'Quitação';
         4: qryHistMovVirtualEVENTO.AsString := 'Atualização Débito';
      End;                                                  (* case *)

      qryHistMovVirtualIDCONTRATOEMPTMO.AsFloat := rContrato.IDContratoEmptmo;
      qryHistMovVirtualIDITEMEMPTMO.AsInteger := vLista[i].CodigoItem;
      qryHistMovVirtualHMEDATAPREVISTA.AsDateTime := vLista[i].DataPrevista;
      qryHistMovVirtualHMEVLRPREVISTO.AsCurrency := vLista[i].Valor;
      qryHistMovVirtualHMESALDODEV.AsCurrency := vLista[i].SaldoDevedor;
      qryHistMovVirtualHMETXJUROS.AsCurrency := vLista[i].TxJuros;
      qryHistMovVirtualHMEPARCELA.AsInteger := vLista[i].Parcela;

      qryHistMovVirtual.Post;

      If (vLista[i].FlgCentraliza = 1) Or (vLista[i].FlgDestacado = 1) Then
         fSaldo := fSaldo + vLista[i].Valor;

   End;                                                     (* for *)

   edtSaldoAtual.Value := fSaldo;
End;

Procedure TfrmRelContrato.DBgrdItensAbertoTopRowChanged(Sender: TObject);
Begin
   Inherited;
   (* acerta as cores quando muda a linha da grid *)
   (Sender As TwwDBGrid).Invalidate;
End;

Procedure TfrmRelContrato.DBgrdHistMovVirtualTopRowChanged(Sender: TObject);
Begin
   Inherited;
   (* acerta as cores quando muda a linha da grid *)
   (Sender As TwwDBGrid).Invalidate;
End;

Procedure TfrmRelContrato.DBgrdItensAbertoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
Begin
   Inherited;

   (* faz com que as linhas do grid tenham cores alternadas *)
   If State <> [gdSelected] Then
   Begin

      If Not Highlight Then
      Begin
         (* linhas ímpares = amarelo, linhas pares = branco *)
         If ((Sender As TwwDBGrid).CalcCellRow Mod 2) = 0 Then
         Begin
            ABrush.Color := $00C0FFFF;                      (* amarelo bebê *)
         End
         Else
         Begin
            ABrush.Color := clWhite;
         End;
      End;

   End
   Else
   Begin
      ABrush.Color := clHighLight;
      AFont.Color := clHighLightText;
   End;
End;

Procedure TfrmRelContrato.DBgrdHistMovVirtualCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
Begin
   Inherited;

   (* faz com que as linhas do grid tenham cores alternadas *)
   If State <> [gdSelected] Then
   Begin

      If Not Highlight Then
      Begin
         (* linhas ímpares = amarelo, linhas pares = branco *)
         If ((Sender As TwwDBGrid).CalcCellRow Mod 2) = 0 Then
         Begin
            ABrush.Color := $00C0FFFF;                      (* amarelo bebê *)
         End
         Else
         Begin
            ABrush.Color := clWhite;
         End;
      End;

   End
   Else
   Begin
      ABrush.Color := clHighLight;
      AFont.Color := clHighLightText;
   End;
End;

Procedure TfrmRelContrato.rdgExibeClick(Sender: TObject);
Begin
   Inherited;
   AbreQueriesHistorico;
End;

Procedure TfrmRelContrato.rdgEstornoClick(Sender: TObject);
Begin
   Inherited;
   AbreQueriesHistorico;
End;

Procedure TfrmRelContrato.chkOrdemClick(Sender: TObject);
Begin
   Inherited;
   AbreQueriesHistorico;
End;

Procedure TfrmRelContrato.FormShow(Sender: TObject);
Begin
   Inherited;

   //ParametrosSistema;

   // Marchetti - Pendencia 22042
   If Sistema.IdModulo = 19 Then
   Begin
      btnBuscaContrato.Visible := False;
      Application.CreateForm(TFrmExecSelecionaContrato, frmExecSelecionaContrato);
      frmExecSelecionaContrato.Matricula := sMatricula;
      frmExecSelecionaContrato.ShowModal;

      If frmExecSelecionaContrato.RetornouValor Then
      Begin
         Screen.Cursor := crHourGlass;

         qryItensAberto.Close;
         qryHistMovVirtual.Close;
         qryHistMov.Close;

         edtSaldoAtual.Value := 0;
         edtParcRestante.Value := 0;
         edtSaldoDevedor.Value := 0;

         // Abre a query principal com o participante escolhido
         Sel(StrToFloat(frmExecSelecionaContrato.ValoresChave[0]));

         IntegraModulo.iEvento := 1;
         IntegraModulo.iContratoEmptmo := StrToFloat(frmExecSelecionaContrato.ValoresChave[0]);

         If (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) And
            (qryIDPESSOA.AsInteger <> qryIDBENEF.AsInteger) And
            (qryFLGINTERNO.AsString = 'CA') Then
         Begin
            DBedtSitPart.Text := 'Pensionista';
         End;

         PreencheDadosContrato(qry, rContrato);

         // Pendência 23536 - Marcos Topini
         With qryHistMigracoes Do
         Begin
            LimpaParametros(qryHistMigracoes);
            ParamByName('IDCONTRATO').AsFloat := rContrato.idContratoEmptmo;
            Open;

            //Pendência 23536 - 15/02/2007 - Alberto
            qryHistMigracoesAfterScroll(qryHistMigracoes)
         End;
         // Fim Pendência 23536

         // Saldo Devedor -----------------------------------------------------------------------------
         With dtmCalcEmptmo.qrySaldoAnt Do
         Begin
            LimpaParametros(dtmCalcEmptmo.qrySaldoAnt);
            ParamByName('PIDCONTRATOEMPTMO').AsFloat := rContrato.IDContratoEmptmo;
            ParamByName('PHMEDATAATUALIZA').AsDateTime := Sysdate;
            Open;

            If Not (IsEmpty) Then
               edtSaldoDevedor.Value := dtmCalcEmptmo.qrySaldoAntHMESALDODEV.AsCurrency;
         End;
         // Fim Saldo Devedor -------------------------------------------------------------------------

         // Parcelas Restantes-------------------------------------------------------------------------
         With qryParcelasRestantes Do
         Begin
            LimpaParametros(qryParcelasRestantes);
            ParamByName('PIDCONTRATOEMPTMO').AsFloat := rContrato.IDContratoEmptmo;
            Open;

            If Not (IsEmpty) Then
               edtParcRestante.Value := qryParcelasRestantesPARCELAS_RESTANTES.AsInteger;
         End;
         // Fim Parcelas Restantes --------------------------------------------------------------------

         With qryBenefSeguro Do
         Begin
            LimpaParametros(qryBenefSeguro);
            ParamByName('PIDINSCRICAOEMPTMO').AsFloat := rContrato.IDINSCRICAOEMPTMO;
            Open;
         End;

         DesabilitaVazio;

         pgcDados.ActivePageIndex := 0;

         Screen.Cursor := crDefault;
      End;
      frmExecSelecionaContrato.Free;
   End;
   // Fim Marchetti - Pendencia 22042

   pgcDados.ActivePageIndex := 0;
   pgcSecundario.ActivePageIndex := 0;

   edtDataQuitacao.Date := Sysdate;

   cboEvento.ItemIndex := 0;

   DBspnAnoCobIni.Value := DiasUteis.ExtraiAno(DiasUteis.SomaMeses(Sysdate, -2));
   cboMesCobIni.ItemIndex := DiasUteis.ExtraiMes(DiasUteis.SomaMeses(Sysdate, -2)) - 1;

   DBspnAnoCobFim.Value := DiasUteis.ExtraiAno(Sysdate);
   cboMesCobFim.ItemIndex := DiasUteis.ExtraiAno(Sysdate) - 1;

   DBedtDataInsc.ButtonWidth := 20;
   DBedtDataCredito.ButtonWidth := 20;
   DBedtDataAssinatura.ButtonWidth := 20;
   DBedtDtCancelamento.ButtonWidth := 20;
   DBedtDataPrimParcela.ButtonWidth := 20;
   DBedtDataPrevisao.ButtonWidth := 20;
   DBedtDataEfetiva.ButtonWidth := 20;
   DBedtDataUltAtualiza.ButtonWidth := 20;
   edtDataQuitacao.ButtonWidth := 20;

   CMDateTimePicker1.ButtonWidth := 20;
   CMDateTimePicker2.ButtonWidth := 20;
   CMDateTimePicker3.ButtonWidth := 20;
   CMDateTimePicker4.ButtonWidth := 20;
   CMDateTimePicker5.ButtonWidth := 20;
   CMDateTimePicker6.ButtonWidth := 20;

   // ----------------------------------------------------------------------------------------------

   If dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger <> 1 Then
   Begin
      btnAlteraHistContrato.Visible := False;
      btnAjustaSaldo.Visible := False;
      fcLblPerda.Visible := True;
   End;

   If Sistema.TipoCliente = 19981 Then
   Begin
      btnAlteraHistContrato.Visible := True;
   End;

   If Sistema.IDModulo <> 15 Then
   Begin
      btnAlteraHistContrato.Visible := False;
      btnAjustaSituacao.Visible := False;
      btnAjustaSaldo.Visible := False;
   End;

   // ----------------------------------------------------------------------------------------------

   lblTitulo.Caption := '';

   pnlTitular.Visible := (dtmEmptmo.qryParamEmptmoFLGMOSTRATIT.AsInteger = 0);

   dtmLookEmptmo.qryLookItemEmprestimo.Open;
   //Pendência 27294 - 01/02/2008
   chkFiltroItem.Enabled := false;
   //Fim Pendência 27294

   If btnBuscaContrato.CanFocus Then
      btnBuscaContrato.SetFocus;

   If (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) Or (Sistema.TipoCliente = 20071) Then
      rdgOrdena.ItemIndex := 4;

   qryHistMovCCDEBFINAN.EditMask := IntegraBack.MascaraPlano + ';0; ';
   qryHistMovCCCREDFINAN.EditMask := IntegraBack.MascaraPlano + ';0; ';

   // Marchetti - pendencia 26267
   Autorizacao.AutorizarForm(self, afNormal);

   bControlaHabilitaNup := btnNUP.Enabled;                  // Felipe A. Santos - SOL 258351/18139 PPM 1315865
   btnNUP.Enabled := False;                                 // Felipe A. Santos - SOL 258351/18139 PPM 1315865

   qryAcordoQueroPagar.open;

   // Paulo Nobre - SIG136494 - Ini
   qryPolRenogociacao.open;
   // Paulo Nobre - SIG136494 - Fim
End;

Procedure TfrmRelContrato.chkFaixaDatasClick(Sender: TObject);
Begin
   Inherited;
   AbreQueriesHistorico;
End;

Procedure TfrmRelContrato.fcShapeBtn1Click(Sender: TObject);
Begin
   Inherited;

   If plnFiltro.Height = 168 Then
   Begin
      plnFiltro.Height := 0;
   End
   Else
   Begin
      plnFiltro.Height := 168;
   End;

   Repaint;
End;

Procedure TfrmRelContrato.cboMesCobIniExit(Sender: TObject);
Begin
   Inherited;
   iIndiceFim := cboMesCobIni.ItemIndex;
   If (iIndiceIni <> iIndiceFim) And (chkFiltroCobranca.Checked) Then
      AbreQueriesHistorico;
End;

Procedure TfrmRelContrato.DBspnAnoCobIniExit(Sender: TObject);
Begin
   Inherited;
   If (DBspnAnoCobIni.Modified) And (chkFiltroCobranca.Checked) Then
      AbreQueriesHistorico;
End;

Procedure TfrmRelContrato.cboMesCobFimExit(Sender: TObject);
Begin
   Inherited;
   iIndiceFim := cboMesCobFim.ItemIndex;
   If (iIndiceIni <> iIndiceFim) And (chkFiltroCobranca.Checked) Then
      AbreQueriesHistorico;
End;

Procedure TfrmRelContrato.DBspnAnoCobFimExit(Sender: TObject);
Begin
   Inherited;
   If (DBspnAnoCobFim.Modified) And (chkFiltroCobranca.Checked) Then
      AbreQueriesHistorico;
End;

Procedure TfrmRelContrato.cboMesCobIniEnter(Sender: TObject);
Begin
   Inherited;
   iIndiceIni := cboMesCobIni.ItemIndex;
End;

Procedure TfrmRelContrato.cboMesCobFimEnter(Sender: TObject);
Begin
   Inherited;
   iIndiceIni := cboMesCobFim.ItemIndex;
End;

Procedure TfrmRelContrato.qryHistMovVirtualAfterClose(DataSet: TDataSet);
Begin
   Inherited;
   lblSaldoAtualizado.Caption := 'Valor projetado para Quitação: ';
End;

Procedure TfrmRelContrato.pgcDadosChange(Sender: TObject);
Begin
   Inherited;
   If pgcDados.ActivePage = tbsCondicoes Then
      pnlTitular.Visible := (dtmEmptmo.qryParamEmptmoFLGMOSTRATIT.AsInteger = 0);
   If (pgcDados.ActivePage = tbsDetalheParcela) Then
   Begin
      LimpaParametros(qryHistObservacao);

      qryHistObservacao.ParamByName('PIDHISTMOVEMPTMO').AsFloat := qryHistMovIDHISTMOVEMPTMO.AsFloat;
      qryHistObservacao.Open;
   End;

   DesabilitaVazio;                                         //Michelle Mota - SOL: 259755/17824 - PPM: 1105015
End;

Procedure TfrmRelContrato.btnNovoClick(Sender: TObject);
Begin
   Inherited;
   statusChave := inserirCont;                              //Vinicius Maciel - SOL 167451 - KINTANA 1469701
   Application.CreateForm(TfrmCadHistMovEmptmo, frmCadHistMovEmptmo);

   Try
      frmCadHistMovEmptmo.qry.Close;
      frmCadHistMovEmptmo.qry.ParamByName('IDHISTMOVEMPTMO').AsFloat := 1;
      frmCadHistMovEmptmo.qry.Open;
      frmCadHistMovEmptmo.statusChave := inserir;
      frmCadHistMovEmptmo.IDTipoEP := qryIDTIPOEMPTMO.AsInteger;
      frmCadHistMovEmptmo.iAcao := 1;                       // Inserção

      frmCadHistMovEmptmo.ShowModal;

   Finally

      frmCadHistMovEmptmo.Release;

      Repaint;

      qryHistMov.Close;
      qryHistMov.Open;

      qryItensAberto.Close;
      qryItensAberto.Open; ;

   End;                                                     (* try...finally *)
   statusChave := aguardarCont;                             //Vinicius Maciel - SOL 167451 - KINTANA 1469701
End;

Procedure TfrmRelContrato.btnAlteraClick(Sender: TObject);
Var
   bTelaCompleta: Boolean;                                  //Se verdadeiro carrega a tela completa, se não carrega apenas o flag de abono e a data de abono.
Begin
   Inherited;
   //Vinicius Maciel - SOL 167451 - KINTANA 1469701
   statusChave := alterarCont;
   bTelaCompleta := true;
   //Vinicius Maciel - SOL 167451 - KINTANA 1469701 - FIM
   // SOL 162129 Kintana 1374883
   If Not (VerificaPreenchimento) Then
      Exit;

   If verificaDisponibilidadeBloq Then
      bTelaCompleta := false;

   //Não pode permitir a alteração de itnes abonados já contabilizados.
   If ((qryHistMovPLNCODIGOESTORNO.asString <> '') And (statusChave = alterarCont)) Then
   Begin
      MessageDlg('Este item não pode ser alterado, pois foi contabilizado.', mtInformation, [mbOK], 0);
      Exit;
   End;

   {  if qryHistMovHMECENTRALIZA.asstring <> '1' then
     begin
        if qryHistMovPLNCODIGO.asstring <> '' then
        begin
           MessageDlg('Este item não pode ser alterado, pois foi contabilizado.', mtInformation, [mbOK], 0);
           Exit;
        end;
     end
     else
     if VerificaPlnCodigo(qryHistMovIDCONTRATOEMPTMO.asstring,
                          qryHistMovHMEDATAPREVISTA.asstring,
                          qryHistMovIDITEMEMPTMO.Asstring,
                          qryHistMovHMETIPOMOV.asstring ) then
     begin
            MessageDlg('Este item não pode ser alterado, pois foi contabilizado.', mtInformation, [mbOK], 0);
            Exit;
     end;            }
     // SOL 162129 Kintana 1374883
     //Vinicius Maciel - SOL 167451 - KINTANA 1469701 - FIM

   Application.CreateForm(TfrmCadHistMovEmptmo, frmCadHistMovEmptmo);

   Try
      frmCadHistMovEmptmo.qry.Close;
      frmCadHistMovEmptmo.qry.ParamByName('IDHISTMOVEMPTMO').AsFloat := qryHistMovIDHISTMOVEMPTMO.AsFloat;
      frmCadHistMovEmptmo.qry.Open;
      //Vinicius Maciel - SOL 167451 - KINTANA 1469701
      If Not bTelaCompleta Then
      Begin
         frmCadHistMovEmptmo.bloqueiaCampos;
         MsgDlg('A disponibilidade está bloqueada, por isso somente a marcação Abonado e Data de abono poderão ser alterados.', 'Aviso', mtWarning, [mbOk], 0);
      End;
      If Not bTelaCompleta Then
         frmCadHistMovEmptmo.statusChave := alterarBloq
      Else
         frmCadHistMovEmptmo.statusChave := alterar;
      //Vinicius Maciel - SOL 167451 - KINTANA 1469701 - FIM
      frmCadHistMovEmptmo.IDItem := qryHistMovIDITEMEMPTMO.AsInteger;
      frmCadHistMovEmptmo.iAcao := 2;                       // Alteração

      frmCadHistMovEmptmo.ShowModal;
   Finally
      frmCadHistMovEmptmo.Release;

      qryHistMov.Close;
      qryHistMov.Open;

      qryItensAberto.Close;
      qryItensAberto.Open; ;
   End;
   statusChave := aguardarCont;                             //Vinicius Maciel - SOL 167451 - KINTANA 1469701
End;

Procedure TfrmRelContrato.btnExcluirClick(Sender: TObject);
Var
   qryAux: TwwQuery;
   rLogTotalPrev: TLogTotalPrev;
Begin
   Inherited;
   statusChave := excluirCont;                              //Vinicius Maciel - SOL 167451 - KINTANA 1469701
   // SOL 162129 Kintana 1374883
   If Not (VerificaPreenchimento) Then
      Exit;

   If qryHistMovHMECENTRALIZA.asstring <> '1' Then
   Begin
      If qryHistMovPLNCODIGO.asstring <> '' Then
      Begin
         MessageDlg('Este item não pode ser alterado, pois foi contabilizado.', mtInformation, [mbOK], 0);
         Exit;
      End;
   End
   Else If VerificaPlnCodigo(qryHistMovIDCONTRATOEMPTMO.asstring,
      qryHistMovHMEDATAPREVISTA.asstring,
      qryHistMovIDITEMEMPTMO.Asstring,
      qryHistMovHMETIPOMOV.asstring) Then
   Begin
      MessageDlg('Este item não pode ser alterado, pois foi contabilizado.', mtInformation, [mbOK], 0);
      Exit;
   End;
   // SOL 162129 Kintana 1374883

   //Renato Visoni SOL 36024 Kintana 523138
   If qryHistMov.FieldByname('FlgEnvio').isNUll Then
   Begin
      MsgDlg('Esse item não pode ser Excluido.', 'Aviso', mtwarning, [mbok], 0);
      pnlHistBaca.Visible := False;
      Exit;
   End;
   //Renato Visoni SOL 36024 Kintana 523138

   qryAux := TwwQuery.Create(Application);
   qryAux.DatabaseName := 'BASEDADOS';

   If MsgDlg('Deseja realmente excluir este registro?', 'Exclusão', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
      Exit;
   If MsgDlg('Este registro será excluído. Confirma?', 'Exclusão', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
      Exit;

   // ----------------------------------------------------------------------------------------------

   LimpaRegistroLog(rLogTotalPrev);

   rLogTotalPrev.IDModulo := Sistema.IDModulo;
   rLogTotalPrev.IDContrato := qryIDCONTRATOEMPTMO.AsFloat;
   rLogTotalPrev.IDHistMov := qryHistMovIDHISTMOVEMPTMO.AsFloat;
   rLogTotalPrev.Origem := 15;
   rLogTotalPrev.Operacao := 'EXCLUSAO de Historico';
   rLogTotalPrev.Data := SysDate;
   rLogTotalPrev.IDUsuario := Sistema.IdUsuario;
   rLogTotalPrev.Versao := Sistema.Versao;

   GravaLogTotalPrev(rLogTotalPrev);

   // ----------------------------------------------------------------------------------------------

   qryAux.SQL.Add('DELETE FROM HISTMOVEMPTMO WHERE IDHISTMOVEMPTMO = ' + qryHistMovIDHISTMOVEMPTMO.AsString);

   Try
      qryAux.ExecSQL;

      qryHistMov.Close;
      qryHistMov.Open;

      qryItensAberto.Close;
      qryItensAberto.Open;

   Except
      ShowMessage('Não foi possível apagar este registro.');
   End;
   statusChave := aguardarCont;                             //Vinicius Maciel - SOL 167451 - KINTANA 1469701
End;

Procedure TfrmRelContrato.rdgOrdenaClick(Sender: TObject);
Begin
   Inherited;
   AbreQueriesHistorico;
End;

Procedure TfrmRelContrato.BitBtn1Click(Sender: TObject);
Var
   sFlag: String;
   sSQL: String;
   qryAltera: TwwQuery;
   rLogTotalPrev: TLogTotalPrev;
Begin
   Inherited;

   Case cboFlgSituacao.ItemIndex Of
      0: sFlag := 'A';                                      // Ativo
      1: sFlag := 'C';                                      // Cancelado
      2: sFlag := 'E';                                      // Encerrado
      3: sFlag := 'K';                                      // Pendente de Quitação
      4: sFlag := 'Q';                                      // Quitado
      5: sFlag := 'P';                                      // Pendente de Liberação
   End;

   sSQL :=
      'UPDATE ' + #13 +
      '  CONTRATOEMPTMO ' + #13 +
      'SET ' + #13 +
      '  FLGSITUACAO = ' + QuotedStr(sFlag) + #13 +
      'WHERE ' + #13 +
      '  IDCONTRATOEMPTMO = ' + FloatToStr(qryIDCONTRATOEMPTMO.AsFloat);

   qryAltera := TwwQuery.Create(Application);
   qryAltera.DatabaseName := 'BASEDADOS';
   qryAltera.SQL.Text := sSQL;
   qryAltera.ExecSQL;

   qryAltera.Close;
   qryAltera.Free;

   // ----------------------------------------------------------------------------------------------

   LimpaRegistroLog(rLogTotalPrev);

   rLogTotalPrev.IDModulo := Sistema.IDModulo;
   rLogTotalPrev.IDContrato := qryIDCONTRATOEMPTMO.AsFloat;
   rLogTotalPrev.IDHistMov := -1;
   rLogTotalPrev.Origem := 15;
   rLogTotalPrev.Operacao := 'Alteração MANUAL de Situação Contratual para: ' + cboFlgSituacao.Text;
   rLogTotalPrev.Data := SysDate;
   rLogTotalPrev.IDUsuario := Sistema.IdUsuario;
   rLogTotalPrev.Versao := Sistema.Versao;

   GravaLogTotalPrev(rLogTotalPrev);

   // ----------------------------------------------------------------------------------------------
End;

Procedure TfrmRelContrato.DBcboItemCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
   Inherited;
   //Pendência 27294 - 01/02/2008
   chkFiltroItem.Enabled := true;
   //Fim Pendência 27294
   If chkFiltroItem.Checked Then
      AbreQueriesHistorico;
End;

Procedure TfrmRelContrato.cboEventoChange(Sender: TObject);
Begin
   Inherited;
   If chkFiltroEvento.Checked Then
      AbreQueriesHistorico;
End;

Procedure TfrmRelContrato.qryHistMovHMEVLREFETIVOGetText(Sender: TField; Var Text: String; DisplayText: Boolean);
Begin
   Inherited;

   If Not (qryHistMovHMEVLREFETIVO.IsNull) Then
   Begin
      Text := FormatFloat('#,#0.00;(#,#0.00)', qryHistMovHMEVLREFETIVO.AsFloat);
   End;

   If qryHistMovFLGSUSPENSAO.AsInteger = 1 Then
      Text := 'suspenso';
   If qryHistMovFLGQUITADO.AsInteger = 1 Then
      Text := 'quitado';
   If qryHistMovFLGABONADO.AsInteger = 1 Then
      Text := 'abonado';
   If qryHistMovFLGESTORNADO.AsInteger = 1 Then
      Text := 'estornado';
End;

Procedure TfrmRelContrato.qryHistMovAfterScroll(DataSet: TDataSet);
Begin
   Inherited;
   DesabilitaVazio;
   // SOL 162081 Kintana 1374877
   // Abertura da query de log da Hist
   With qryLogTotalPrevHist Do
   Begin
      LimpaParametros(qryLogTotalPrevHist);
      ParamByName('PIDHISTMOVEMPTMO').AsFloat := qryHistMovIDHISTMOVEMPTMO.AsFloat;
      Open;
   End;
   // SOL 162081 Kintana 1374877

   // SOL 156370 Kintana 1230479
   QryHistEnvioEmptmo.Close;
   QryHistEnvioEmptmo.ParamByName('IDHISTMOVEMPTMO').AsFloat := qryHistMovIDHISTMOVEMPTMO.AsFloat;
   QryHistEnvioEmptmo.Open;
   // SOL 156370 Kintana 1230479

End;

Procedure TfrmRelContrato.edtDataIniExit(Sender: TObject);
Begin
   Inherited;
   If ((edtDataIni.Modified) Or (edtDataFim.Modified)) And chkFaixaDatas.Checked Then
      AbreQueriesHistorico;
End;

Procedure TfrmRelContrato.btnRefreshClick(Sender: TObject);
Var
   IDContrato: Extended;
Begin
   Inherited;

   btnRefresh.Down := False;
   Application.ProcessMessages;

   IDContrato := qryIDCONTRATOEMPTMO.AsFloat;

   Sel(IDContrato);

   btnRefresh.Down := False;
   Application.ProcessMessages;
End;

Procedure TfrmRelContrato.btnAjustaSaldoClick(Sender: TObject);
Var
   rLogTotalPrev: TLogTotalPrev;
Begin
   twMensagem.hide;    //leandro wo15681

   Inherited;

   If Sistema.TipoCliente <> 19991 Then
      Exit;

   If qryHistMovHMEDATAATUALIZA.AsDateTime < StrToDate('01/01/2005') Then
   Begin
      MsgDlg('Não é permitido ajustar saldos anteriores a 01/01/2005', 'Empréstimo', mtWarning, [mbOk], 0);
      Repaint;
      Exit;
   End;

   If Not (VerificaPreenchimento) Then
      Exit;

   If MsgDlg('Os saldos devedores serão ajustados a partir de ' +
      FormatDateTime('dd/mm/yyyy', qryHistMovHMEDATAATUALIZA.AsDateTime) + '.' + #13 + #13 +
      'Deseja prosseguir?',
      'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
      Repaint;

      dtmAtualizacaoDiaria.ExecutaAjusteSaldo(qryIDCONTRATOEMPTMO.AsFloat,
         qryHistMovHMEDATAPREVISTA.AsDateTime,
         -1                                                 // O saldo deve ser buscado
         );

      // -------------------------------------------------------------------------------------------

      LimpaRegistroLog(rLogTotalPrev);

      rLogTotalPrev.IDModulo := 15;
      rLogTotalPrev.IDContrato := qryIDCONTRATOEMPTMO.AsFloat;
      rLogTotalPrev.IDHistMov := -1;
      rLogTotalPrev.Origem := 15;
      rLogTotalPrev.Operacao := 'Ajuste de Saldo - a partir de ' + FormatDateTime('dd/mm/yyyy', qryHistMovHMEDATAPREVISTA.AsDateTime);
      rLogTotalPrev.Data := SysDate;
      rLogTotalPrev.IDUsuario := Sistema.IdUsuario;
      rLogTotalPrev.Versao := Sistema.Versao;

      GravaLogTotalPrev(rLogTotalPrev);

      // -------------------------------------------------------------------------------------------

      AbreQueriesHistorico;
   End;
End;

Function TfrmRelContrato.VerificaPreenchimento: Boolean;
Var
   sMsg: String;
   sDataLanc: String;
   sMsgContab: String;
   iEmpresa: Integer;
   iExercicio: Integer;
   iPeriodo: Integer;
Begin
   Result := False;

   Try
      // SOL 168993 Kintana 1495750
      //sDataLanc   := FormatDateTime('dd/mm/yyyy', qryHMEDATAATUALIZA.AsDateTime);
      sDataLanc := FormatDateTime('dd/mm/yyyy', qryHistMovHMEDATAPREVISTA.AsDateTime);
      // SOL 168993 Kintana 1495750
      iEmpresa := Sistema.idEmpresa;
      sMsgContab := '';

      If statusChave <> alterarCont Then                    //Vinicius Maciel - SOL 167451 - KINTANA 1469701
         {O Sol 167451, mudou a regra da chave mestre -alteração. Em caso de disponibilidade bloqueada
         deixar carregar a tela mas apenas com o Flag e a Data de abono liberados.}
      Begin
         If TestaPeriodo(False, 'BaseDados', sDataLanc, '15', iExercicio, iPeriodo, iEmpresa, sMsgContab) <> 0 Then
            Raise EValidacao.CreateVal('Não é possível usar a Data indicada:' + #13 + '"' + sMsgContab + '"', btnAjustaSaldo);

         If Not (Contab.TestaDataBloqueadaProc(iEmpresa, 15, sDataLanc)) Then
         Begin
            sMsgContab := Contab.MessageInfo;
            Raise EValidacao.CreateVal('Não é possível usar a Data indicada:' + #13 + '"' + sMsgContab + '"', btnAjustaSaldo);
         End;
      End;
      //Vinicius Maciel - SOL 167451 - KINTANA 150688 -FIM

   Except
      On ev: EValidacao Do
      Begin
         Screen.Cursor := crDefault;
         If ev.Show Then
            MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;
         If ev.Control.CanFocus Then
            ev.Control.SetFocus;
         Exit;
      End;
   End;
   Result := True;
End;

Procedure TfrmRelContrato.btnAjustaSituacaoClick(Sender: TObject);
Var
   IDContrato: Extended;
   rLogTotalPrev: TLogTotalPrev;
Begin
   twMensagem.hide;    //leandro wo15681

   Inherited;

   // ----------------------------------------------------------------------------------------------
   //    Acerto da situação do Contrato
   // ----------------------------------------------------------------------------------------------
   CalcEmptmo.AcertaSituacaoContratual(qryIDCONTRATOEMPTMO.AsFloat, 15);

   IDContrato := qryIDCONTRATOEMPTMO.AsFloat;

   Sel(IDContrato);
End;

Procedure TfrmRelContrato.fcShapeBtn3Click(Sender: TObject);
Var
   rSaldo: TSaldoDevAnt;
Begin
   Inherited;

   rSaldo := CalcEmptmo.SaldoDevAnt(qryIDCONTRATOEMPTMO.AsFloat,
      qryHistMovHMEDATAPREVISTA.AsDateTime,
      -1,
      -1,
      False
      );

   MsgDlg('Saldo Devedor em ' + FormatDateTime('dd/mm/yyyy', qryHistMovHMEDATAPREVISTA.AsDateTime) +
      ': ' + #13 + #13 + FormatFloat('#,#0.00', rSaldo.fSaldoDevAnt),
      'Empréstimo', mtInformation, [mbOk], 0);
   Repaint;
End;

Procedure TfrmRelContrato.btnAlteraHistContratoClick(Sender: TObject);
Begin
   Inherited;
   pnlHistBaca.Visible := Not (pnlHistBaca.Visible);
End;

Procedure TfrmRelContrato.pgcDetalheChange(Sender: TObject);
Begin
   Inherited;

   If (pgcDetalhe.ActivePage = tbsLogTotalPrevHist) And (qry.Active) And Not (qry.IsEmpty) Then
   Begin
      // Abertura da query de log da Hist
      With qryLogTotalPrevHist Do
      Begin
         LimpaParametros(qryLogTotalPrevHist);
         ParamByName('PIDHISTMOVEMPTMO').AsFloat := qryHistMovIDHISTMOVEMPTMO.AsFloat;
         Open;
      End;
   End;

End;

Procedure TfrmRelContrato.btnAlteraObsClick(Sender: TObject);
Begin
   Application.CreateForm(TfrmCadObservacao, frmCadObservacao);

   Try
      frmCadObservacao.qry.Close;
      frmCadObservacao.qry.ParamByName('IDHISTMOVEMPTMO').AsFloat := qryHistMovIDHISTMOVEMPTMO.AsFloat;
      frmCadObservacao.qry.Open;

      frmCadObservacao.IDItem := qryHistMovIDITEMEMPTMO.AsInteger;
      frmCadObservacao.iAcao := 2;                          // Alteração

      frmCadObservacao.ShowModal;
   Finally
      frmCadObservacao.Release;

      qryHistMov.Close;
      qryHistMov.Open;

      LimpaParametros(qryHistObservacao);
      qryHistObservacao.ParamByName('PIDHISTMOVEMPTMO').AsFloat := qryHistMovIDHISTMOVEMPTMO.AsFloat;
      qryHistObservacao.Open;

      qryItensAberto.Close;
      qryItensAberto.Open; ;
   End;
End;

Procedure TfrmRelContrato.FormCreate(Sender: TObject);
Begin
   Inherited;
   Top := 72;
   Left := 231;
   ClientHeight := 630;
   ClientWidth := 1011;

   Contab := TCtrlContab.Create;
   Contab.Initialize(dtmBaseDados.dbBaseDados,
      True,
      Sistema.ConnectionType,
      Sistema.ConnectionSide,
      Sistema.AppRemoteServer,
      True
      );

   Contab.OpenTransaction := False;
   statusChave := aguardarCont;                             //Vinicius Maciel - SOL 167451 - KINTANA 1469701

End;

Procedure TfrmRelContrato.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   qryValorMaximo.Close;                                    //Fanuel Junior SOL 153382 Kintana 1159322
   Contab.Free;
   Inherited;
End;

Procedure TfrmRelContrato.qryHistMigracoesAfterScroll(DataSet: TDataSet);
Begin
   Inherited;

   //Pendência 23536 - 15/02/2007 - Alberto
   With qryItensMigracoes Do
   Begin
      Close;
      ParamByName('PIDCONTRATOEMPTMO').Value := qryHistMigracoes.FieldByName('IDCONTRATOEMPTMO').Value;
      ParamByName('PDATAMIGRA').Value := qryHistMigracoes.FieldByName('DATAMIGRA').Value;
      Open;
   End;
   //Fim Pendência 23536
End;

Procedure TfrmRelContrato.QryEventosAfterScroll(DataSet: TDataSet);
Begin
   Inherited;
   // Início - Michelle Mota - SOL: 259755/17824 - PPM: 1105015
   If Not (QryEventos.isEmpty) Then
   Begin
      QryPrestacao.Close;
      QryPrestacao.ParamByname('IDCONTRATOEMPTMO').asString := QryEventos.FieldByname('IDCONTRATOEMPTMO').asString;
      QryPrestacao.ParamByname('IDTIPOEVENTOCOBEMPTMO').asString := QryEventos.FieldByname('IDTIPOEVENTOCOBEMPTMO').asString;
      QryPrestacao.ParamByname('IDHISTEVENTOCOBEMPTMO').asString := QryEventos.FieldByname('IDHISTEVENTOCOBEMPTMO').asString; //Ewerton Beltramini - 17/09/2021 - SIg 118987.
      QryPrestacao.ParamByname('DATAEVENTOCOB').asString := QryEventos.FieldByname('DATAEVENTOCOB').asString;

      QryPrestacao.Open;

      DesabilitaVazio;
   End
   Else
      QryPrestacao.Close;
   // Término - Michelle Mota - SOL: 259755/17824 - PPM: 1105015
End;

Procedure TfrmRelContrato.wwDBGrid7CalcCellColors(Sender: TObject;
   Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
   ABrush: TBrush);
Begin
   Inherited;
   // faz com que as linhas do grid tenham cores alternadas
   If Not wwDBGrid7.DataSource.DataSet.IsEmpty Then
   Begin
      If State <> [gdSelected] Then
      Begin
         If Not (Highlight) Then
         Begin
            // linhas ímpares = amarelo, linhas pares = branco
            If ((Sender As TwwDBGrid).CalcCellRow Mod 2) = 0 Then
            Begin
               ABrush.Color := $00C0FFFF;                   // amarelo bebê
            End
            Else
            Begin
               ABrush.Color := clWindow;
            End;
         End;
      End
      Else
      Begin
         ABrush.Color := clHighLight;
         AFont.Color := clHighLightText;
      End;
   End
   Else
   Begin
      ABrush.Color := clWindow;
   End;

End;

Procedure TfrmRelContrato.wwDBGrid7TopRowChanged(Sender: TObject);
Begin
   Inherited;
   (Sender As TwwDBGrid).Invalidate;

End;

Procedure TfrmRelContrato.ValorGetText(Sender: TField; Var Text: String; DisplayText: Boolean);
Begin
   Text := FormatFloat('#,###0.00', Sender.AsFloat);
End;

Procedure TfrmRelContrato.qryBeforeOpen(DataSet: TDataSet);
Begin
   Inherited;
   qry.FieldByName('VLRMAXPERMIT').OnGetText := ValorGetText;
   qry.FieldByName('VLRCONTRATO').OnGetText := ValorGetText;
   qry.FieldByName('VLRSALBASE').OnGetText := ValorGetText;
   qry.FieldByName('VLRPARCELA').OnGetText := ValorGetText;
   qry.FieldByName('VLRMARGEM').OnGetText := ValorGetText;

End;

Procedure TfrmRelContrato.qryAfterOpen(DataSet: TDataSet);
Begin
   Inherited;
   //Fanuel Junior SOL 153382 Kintana 1159322
   dbedtValor.Text := trim(qry.FieldByName('VALORMAX').AsString);
End;

//Retorna true se a Disponibilidade estiver bloqueada.

Function TfrmRelContrato.verificaDisponibilidadeBloq: Boolean;
Var
   sDataLanc: String;
   iEmpresa: Integer;
Begin
   result := false;
   sDataLanc := FormatDateTime('dd/mm/yyyy', qryHistMovHMEDATAPREVISTA.AsDateTime);
   iEmpresa := Sistema.idEmpresa;
   If Not (Contab.TestaDataBloqueadaProc(iEmpresa, 15, sDataLanc)) Then
      result := true;
End;

Procedure TfrmRelContrato.btnContratoQuitacaoClick(Sender: TObject);
Var svalor: String;
Var sSQL: String;                                           //William Moreira da Silva - SOL PPM
Begin
   Inherited;
   //Higor Nayde Ferreira SOL - 174521 KTN - 1576354 Inicio
   If (btnContratoQuitacao.Caption <> '') Then
   Begin
      Screen.Cursor := crHourGlass;

      sValor := btnContratoQuitacao.Caption;

      Screen.Cursor := crHourGlass;

      qryItensAberto.Close;
      qryHistMovVirtual.Close;
      qryHistMov.Close;

      edtSaldoAtual.Value := 0;
      edtParcRestante.Value := 0;
      edtSaldoDevedor.Value := 0;

      // Abre a query principal com o participante escolhido
      Sel(StrToFloat(sValor));

      If (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) And
         (qryIDPESSOA.AsInteger <> qryIDBENEF.AsInteger) And
         (qryFLGINTERNO.AsString = 'CA') Then
      Begin
         DBedtSitPart.Text := 'Pensionista';
      End;

      PreencheDadosContrato(qry, rContrato);

      //Fanuel Junior SOL 153382 Kintana 1159322
      qryValorMaximo.Close;
      //qryValorMaximo.ParamByName('IDTITULAR').AsInteger := qryIDPESSOA.AsInteger;  // Edilaine - Sol 163624 / KTN 1399837 - comentei
      qryValorMaximo.ParamByname('IDCONTRATO').asFloat := rContrato.idContratoEmptmo; // Edilaine - Sol 163624 / KTN 1399837
      qryValorMaximo.Open;
      //Fanuel Junior SOL 153382 Kintana 1159322

      //Renato Visoni
      QryEventos.Close;
      QryEventos.ParamByname('IDCONTRATOEMPTMO').asFloat := rContrato.idContratoEmptmo;
      QryEventos.Open;
      //Renato Visoni

      // Pendência 23536 - Marcos Topini
      With qryHistMigracoes Do
      Begin
         LimpaParametros(qryHistMigracoes);
         ParamByName('IDCONTRATO').AsFloat := rContrato.idContratoEmptmo;
         Open;

         //Pendência 23536 - 15/02/2007 - Alberto
         qryHistMigracoesAfterScroll(qryHistMigracoes)
      End;
      // Fim Pendência 23536

      // Saldo Devedor -----------------------------------------------------------------------------
      With dtmCalcEmptmo.qrySaldoAnt Do
      Begin
         LimpaParametros(dtmCalcEmptmo.qrySaldoAnt);
         ParamByName('PIDCONTRATOEMPTMO').AsFloat := rContrato.IDContratoEmptmo;
         ParamByName('PHMEDATAATUALIZA').AsDateTime := Sysdate;
         Open;

         If Not (IsEmpty) Then
            edtSaldoDevedor.Value := dtmCalcEmptmo.qrySaldoAntHMESALDODEV.AsCurrency;
      End;
      // Fim Saldo Devedor -------------------------------------------------------------------------

      // Parcelas Restantes-------------------------------------------------------------------------
      With qryParcelasRestantes Do
      Begin
         LimpaParametros(qryParcelasRestantes);
         ParamByName('PIDCONTRATOEMPTMO').AsFloat := rContrato.IDContratoEmptmo;
         Open;

         If Not (IsEmpty) Then
            edtParcRestante.Value := qryParcelasRestantesPARCELAS_RESTANTES.AsInteger;
      End;
      // Fim Parcelas Restantes --------------------------------------------------------------------

      With qryBenefSeguro Do
      Begin
         LimpaParametros(qryBenefSeguro);
         ParamByName('PIDINSCRICAOEMPTMO').AsFloat := rContrato.IDINSCRICAOEMPTMO;
         Open;
      End;

      DesabilitaVazio;

      pgcDados.ActivePageIndex := 0;

      Screen.Cursor := crDefault;

      //William Moreira da Silva - SOL 255322/17559 PPM 984370 - Inicio
      If qry.FieldByname('FLGEXCEPCIONAL').AsInteger = 1 Then
      Begin
         //FclExcepcional.visible := True
         rgExcepcional.visible := true;

         chkValorSolictado.visible := true;
         chkValorSolictado.checked := true;

         chkElegibilidade.visible := true;
         chkElegibilidade.checked := true;

         chkInadimplencia.visible := true;
         chkInadimplencia.checked := true;

         chkOutros.visible := true;
         chkOutros.checked := true;
      End
      Else
      Begin
         rgExcepcional.visible := false;
         chkValorSolictado.visible := false;
         chkElegibilidade.visible := false;
         chkInadimplencia.visible := false;
         chkOutros.visible := false;
         //FclExcepcional.visible:= False;
      End;

      With twwquery.create(self) Do
      Begin
         databasename := 'basedados';
         close;
         sql.clear;

         sSQL := 'SELECT CXE.IDGRUPOEXCEPCIONAL FROM' + #13#10 +
            'CONTRATOEMPTMOXEXCEPCIONAL CXE, GRUPOEXCEPCIONALEMPTMO GRU' + #13#10 +
            'WHERE CXE.IDCONTRATOEMPTMO = CXE.IDCONTRATOEMPTMO' + #13#10 +
            'AND GRU.IDGRUPOEXCEPCIONAL = CXE.IDGRUPOEXCEPCIONAL' + #13#10 +
            'AND CXE.IDCONTRATOEMPTMO = ' + floattostr(rContrato.IDContratoEmptmo);

         SQL.Add(sSQl);
         Open;

         If Not isEmpty Then
         Begin
            rgExcepcional.visible := true;
            While (Not EOF) Do
            Begin
               If (fieldByname('IDGRUPOEXCEPCIONAL').asInteger = 1) Then
               Begin
                  chkValorSolictado.visible := true;
                  chkValorSolictado.checked := true;
               End;

               If (fieldByname('IDGRUPOEXCEPCIONAL').asInteger = 2) Then
               Begin
                  chkElegibilidade.visible := true;
                  chkElegibilidade.checked := true;
               End;

               If (fieldByname('IDGRUPOEXCEPCIONAL').asInteger = 3) Then
               Begin
                  chkInadimplencia.visible := true;
                  chkInadimplencia.checked := true;
               End;

               If (fieldByname('IDGRUPOEXCEPCIONAL').asInteger = 4) Then
               Begin
                  chkOutros.visible := true;
                  chkOutros.checked := true;
               End;
               next;
            End;
            close;
         End;
      End;
      //William Moreira da Silva - SOL 255322/17559 PPM 984370 - Fim

      btnContratoQuitacao.Caption := qry.FieldByName('IDCONTRQUITACAO').AsString;
      // QryContratosQuitados.ParamByName('IDCONTRATOEMPTMO').AsString := qry.FieldByName('IDCONTRATOEMPTMO').AsString;
      QryContratosQuitados.Close;
      QryContratosQuitados.ParamByname('IDCONTRATOEMPTMO').AsString := qry.FieldByName('IDCONTRATOEMPTMO').AsString;
      QryContratosQuitados.Open;
   End;
   //Higor Nayde Ferreira SOL - 174521 KTN - 1576354 Fim
End;

Procedure TfrmRelContrato.gridContratosQuitadosDblClick(Sender: TObject);
Var sValor: String;
Var sSQL: String;                                           //William Moreira da Silva - SOL PPM
Begin
   Inherited;
   //Higor Nayde Ferreira SOL - 174521 KTN - 1576354 Inicio
   If (Not QryContratosQuitados.IsEmpty) Then
   Begin
      Screen.Cursor := crHourGlass;

      sValor := gridContratosQuitados.Fields[0].AsString;

      Screen.Cursor := crHourGlass;

      qryItensAberto.Close;
      qryHistMovVirtual.Close;
      qryHistMov.Close;

      edtSaldoAtual.Value := 0;
      edtParcRestante.Value := 0;
      edtSaldoDevedor.Value := 0;

      // Abre a query principal com o participante escolhido
      Sel(StrToFloat(sValor));

      If (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) And
         (qryIDPESSOA.AsInteger <> qryIDBENEF.AsInteger) And
         (qryFLGINTERNO.AsString = 'CA') Then
      Begin
         DBedtSitPart.Text := 'Pensionista';
      End;

      PreencheDadosContrato(qry, rContrato);

      //Fanuel Junior SOL 153382 Kintana 1159322
      qryValorMaximo.Close;
      //qryValorMaximo.ParamByName('IDTITULAR').AsInteger := qryIDPESSOA.AsInteger;  // Edilaine - Sol 163624 / KTN 1399837 - comentei
      qryValorMaximo.ParamByname('IDCONTRATO').asFloat := rContrato.idContratoEmptmo; // Edilaine - Sol 163624 / KTN 1399837
      qryValorMaximo.Open;
      //Fanuel Junior SOL 153382 Kintana 1159322

      //Renato Visoni
      QryEventos.Close;
      QryEventos.ParamByname('IDCONTRATOEMPTMO').asFloat := rContrato.idContratoEmptmo;
      QryEventos.Open;
      //Renato Visoni

      // Pendência 23536 - Marcos Topini
      With qryHistMigracoes Do
      Begin
         LimpaParametros(qryHistMigracoes);
         ParamByName('IDCONTRATO').AsFloat := rContrato.idContratoEmptmo;
         Open;

         //Pendência 23536 - 15/02/2007 - Alberto
         qryHistMigracoesAfterScroll(qryHistMigracoes)
      End;
      // Fim Pendência 23536

      // Saldo Devedor -----------------------------------------------------------------------------
      With dtmCalcEmptmo.qrySaldoAnt Do
      Begin
         LimpaParametros(dtmCalcEmptmo.qrySaldoAnt);
         ParamByName('PIDCONTRATOEMPTMO').AsFloat := rContrato.IDContratoEmptmo;
         ParamByName('PHMEDATAATUALIZA').AsDateTime := Sysdate;
         Open;

         If Not (IsEmpty) Then
            edtSaldoDevedor.Value := dtmCalcEmptmo.qrySaldoAntHMESALDODEV.AsCurrency;
      End;
      // Fim Saldo Devedor -------------------------------------------------------------------------

      // Parcelas Restantes-------------------------------------------------------------------------
      With qryParcelasRestantes Do
      Begin
         LimpaParametros(qryParcelasRestantes);
         ParamByName('PIDCONTRATOEMPTMO').AsFloat := rContrato.IDContratoEmptmo;
         Open;

         If Not (IsEmpty) Then
            edtParcRestante.Value := qryParcelasRestantesPARCELAS_RESTANTES.AsInteger;
      End;
      // Fim Parcelas Restantes --------------------------------------------------------------------

      With qryBenefSeguro Do
      Begin
         LimpaParametros(qryBenefSeguro);
         ParamByName('PIDINSCRICAOEMPTMO').AsFloat := rContrato.IDINSCRICAOEMPTMO;
         Open;
      End;

      DesabilitaVazio;

      pgcDados.ActivePageIndex := 0;

      Screen.Cursor := crDefault;

      //William Moreira da Silva - SOL 255322/17559 PPM 984370 - Inicio
      If qry.FieldByname('FLGEXCEPCIONAL').AsInteger = 1 Then
      Begin
         //FclExcepcional.visible := True
         rgExcepcional.visible := true;

         chkValorSolictado.visible := true;
         chkValorSolictado.checked := true;

         chkElegibilidade.visible := true;
         chkElegibilidade.checked := true;

         chkInadimplencia.visible := true;
         chkInadimplencia.checked := true;

         chkOutros.visible := true;
         chkOutros.checked := true;
      End
      Else
      Begin
         rgExcepcional.visible := false;
         chkValorSolictado.visible := false;
         chkElegibilidade.visible := false;
         chkInadimplencia.visible := false;
         chkOutros.visible := false;
         //FclExcepcional.visible:= False;
      End;

      With twwquery.create(self) Do
      Begin
         databasename := 'basedados';
         close;
         sql.clear;

         sSQL := 'SELECT CXE.IDGRUPOEXCEPCIONAL FROM' + #13#10 +
            'CONTRATOEMPTMOXEXCEPCIONAL CXE, GRUPOEXCEPCIONALEMPTMO GRU' + #13#10 +
            'WHERE CXE.IDCONTRATOEMPTMO = CXE.IDCONTRATOEMPTMO' + #13#10 +
            'AND GRU.IDGRUPOEXCEPCIONAL = CXE.IDGRUPOEXCEPCIONAL' + #13#10 +
            'AND CXE.IDCONTRATOEMPTMO = ' + floattostr(rContrato.IDContratoEmptmo);

         SQL.Add(sSQl);
         Open;

         If Not isEmpty Then
         Begin
            rgExcepcional.visible := true;
            While (Not EOF) Do
            Begin
               If (fieldByname('IDGRUPOEXCEPCIONAL').asInteger = 1) Then
               Begin
                  chkValorSolictado.visible := true;
                  chkValorSolictado.checked := true;
               End;

               If (fieldByname('IDGRUPOEXCEPCIONAL').asInteger = 2) Then
               Begin
                  chkElegibilidade.visible := true;
                  chkElegibilidade.checked := true;
               End;

               If (fieldByname('IDGRUPOEXCEPCIONAL').asInteger = 3) Then
               Begin
                  chkInadimplencia.visible := true;
                  chkInadimplencia.checked := true;
               End;

               If (fieldByname('IDGRUPOEXCEPCIONAL').asInteger = 4) Then
               Begin
                  chkOutros.visible := true;
                  chkOutros.checked := true;
               End;
               next;
            End;
            close;
         End;
      End;
      //William Moreira da Silva - SOL 255322/17559 PPM 984370 - Fim
      btnContratoQuitacao.Caption := qry.FieldByName('IDCONTRQUITACAO').AsString;

      // QryContratosQuitados.ParamByName('IDCONTRATOEMPTMO').AsString := qry.FieldByName('IDCONTRATOEMPTMO').AsString;
      QryContratosQuitados.Close;
      QryContratosQuitados.ParamByname('IDCONTRATOEMPTMO').AsString := qry.FieldByName('IDCONTRATOEMPTMO').AsString;
      QryContratosQuitados.Open;
      QryContratosQuitados.active := True;
   End;
   //Higor Nayde Ferreira SOL - 174521 KTN - 1576354 Fim
End;

Procedure TfrmRelContrato.bbtnAjudaClick(Sender: TObject);
Begin
   Inherited;
   //SOL 148922/8841 - Jonas
   If (Sistema.IdModulo = 15) Then
   Begin
      Application.HelpContext(230030)
   End;
End;

// Felipe A. Santos SOL 258351/18139 PPM 1315865 - início

Procedure TfrmRelContrato.btnNUPClick(Sender: TObject);
Var
   sDescricao: String;
   ModalOk: Boolean;
Begin
   Inherited;

   If (Trim(sNupOld) = Trim(dbedtNup.Text)) Then
   Begin
      MsgDlg('O número do NUP não foi alterado.', 'Aviso', mtWarning, [mbOk], 0);
      Exit;
   End;

   Try
      dtmBaseDados.DbBaseDados.StartTransaction;

      Try
         frmJustificativa := TfrmJustificativa.Create(Self);
         frmJustificativa.Visible := False;
         ModalOk := (frmJustificativa.ShowModal = mrOk);
      Finally
         sDescricao := frmJustificativa.MemoText;
         FreeAndNil(frmJustificativa);
      End;

      If (ModalOk) Then
      Begin
         If (MsgDlg('Confirma a alteração do número do NUP?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then
         Begin

            sDescricao := sDescricao + ' - Alterado número NUP de ' + sNUPOld + ' para ' + dbedtNUP.Text;

            sNUPOld := dbedtNUP.Text;

            qryLogNUP.Insert;
            qryLogNUP.FieldByName('idmodulo').AsInteger := 15;
            qryLogNUP.FieldByName('descoperacao').AsString := sDescricao;
            qryLogNUP.FieldByName('idusuario').AsInteger := Sistema.IdUsuario; ;
            qryLogNUP.FieldByName('data').AsString := FormatDateTime('DD/MM/YYYY hh:nn:ss', Now);
            qryLogNUP.FieldByName('idpesquisa1').AsString := qry.FieldByName('IDCONTRATOEMPTMO').AsString;
            qryLogNUP.FieldByName('origem').AsInteger := 15;
            qryLogNUP.FieldByName('versao').AsString := Sistema.Versao;
            qryLogNUP.Post;

            qryLogNUP.ApplyUpdates();

            qryUpdateNup.Edit;
            qryUpdateNup.FieldByName('NUMPROTOCOLO').AsString := dbedtNUP.Text;
            qryUpdateNup.Post;

            qryUpdateNup.ApplyUpdates();

            qry.Edit;
            qry.FieldByName('NUP').AsString := dbedtNUP.Text;
            qry.Post;

            dtmBaseDados.DbBaseDados.Commit;
         End
         Else
            dtmBaseDados.DbBaseDados.RollBack;
      End
      Else
         dtmBaseDados.DbBaseDados.RollBack;
   Except
      On E: Exception Do
      Begin
         dtmBaseDados.DbBaseDados.RollBack;
         MsgDlg(E.Message, 'Erro', mtError, [mbOk], 0);
      End
   End;

End;

// Felipe A. Santos SOL 258351/18139 PPM 1315865 - fim
// Inicio Sig 125588 Ferrari

Procedure TfrmRelContrato.wwDBGrid6CellChanged(Sender: TObject);
Begin
   Inherited;
   If QryEventos.FieldByname('DATAASSINATURAACORDO').asString = '' Then
   Begin
      pnGrid.visible := False;
      pnacordo.visible := False;
      pneventos.visible := True;
      pnGrid.visible := True;
   End
   Else
   Begin
      pnGrid.visible := False;
      pneventos.visible := False;
      pnacordo.visible := True;
      pnGrid.visible := True;
   End;

End;

// Paulo Nobre - WO10850 - Inicio

Function TfrmRelContrato._UsuarioLogadoNaoPodeConsultarPropriosContratos(pIdPessoaUsuarioLogado, pIdPessoaSelecao: Integer): Boolean; // Paulo Nobre - WO10850
Begin
   Result := False;

   If (pIdPessoaUsuarioLogado = pIdPessoaSelecao) Then
   Begin
      Application.MessageBox(pchar('Usuário(a): ' + Sistema.nomeusuario + #13 + #13 +
         'Consultas aos próprios contratos, somente poderão ser ' + #13 +
         //WO14160 - Helen V Bianchi - Inicio
         //'realizadas no site FUNCEF ou pelo WEB EMPRÉSTIMO.'), 'Atenção !', Mb_IconExclamation);
         'realizadas no Site da FUNCEF por meio do Autoatendimento.'), 'Atenção !', Mb_IconExclamation);
         //WO14160 - Helen V Bianchi - Fim
      Result := True;
   End;
        
End;
// Paulo Nobre - WO10850 - Fim

procedure TfrmRelContrato.twMensagemVisibleChanged(Sender: TObject);
begin
  inherited;
  //leandro wo15681 inicio
   twMensagem.left := (Self.width - twMensagem.width) div 2;
   twMensagem.top  := (Self.height - twMensagem.height) div 2;
  //leandro wo15681 fim

end;

procedure TfrmRelContrato.btnFecharClick(Sender: TObject);
begin
  inherited;
  twMensagem.Hide; //leandro wo15681

end;

procedure TfrmRelContrato.btnAnteriorClick(Sender: TObject);
begin
  inherited;
  //leandro wo15681 inicio
   qryMessagem.Prior;

   if not(qryMessagem.BOF) then
   begin
      reditMSG.text := qryMessagem.fieldByName('DESCRICAO').asString;
      btnAnterior.Enabled := True;
   end
   else
   begin
      btnProximo.Enabled := True;
      btnAnterior.Enabled := False;
   end;
  //leandro wo15681 fim

end;

procedure TfrmRelContrato.btnProximoClick(Sender: TObject);
begin
  inherited;
  //leandro wo15681 inicio
   qryMessagem.Next;

   if not(qryMessagem.EOF) then
   begin
      reditMSG.text := qryMessagem.fieldByName('DESCRICAO').asString;
      btnProximo.Enabled := True;
   end
   else
   begin
      btnProximo.Enabled := False;
      btnAnterior.Enabled := True;
   end;
  //leandro wo15681 fim

end;

End.

