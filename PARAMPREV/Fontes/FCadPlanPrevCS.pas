// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************

{
***************************************************************************************
Alteração  : qryBenefBeforePost Adicionado if 
Autor(a)   : Helen V Bianchi
Data       : 30/01/3024
Atender    : WO7360
Descricao  : Adicionado if para so alterar IDPLANPREVCONTAB caso seja nulo
***************************************************************************************
Alteração  : updBenef (InsertSQL / ModifySQL) - qryBenef->SQL
Autor(a)   : Leandfro Pocebon
Data       : 15/06/2023
SIG        : 135968
Descricao  : Inclusão do campo IDPLANPREVCONTAB na atualização da tabela BENEFPLANPREV
****************************************************************************************

Alteração  :
Autor(a)   : André Imakawa
Data       : 13/12/2021
SIG        : 112971
Descricao  : Criação do Campo LIMITEMUDANCAPERC
****************************************************************************************
Alteração  : (dfm) tsIsencaoiRAcJud
Autor(a)   : Edilaine
Data       : 16/08/2019
SIG        : 24483
Descricao  : Tratamento de IR sobre proventos de Acao Judicial
****************************************************************************************
Alteração  : bbtnConfirmarClick, CmeDetalheDelete, CmeCadastroConfirma  
Autor(a)   : Taffarel Sevaybriker
Data       : 05/09/2019
SIG        : 91251
Descricao  : Erro ao excluir benefício e exclusão indevida de rubrica.
****************************************************************************************
Alteração  : (dfm) tbsTrataDiverg, gbRubAcerto (tbsBenRubNorm), qryBenef, updBenef, updContPPatro
Autor(a)   : Edilaine Ferraresi
Data       : 30/01/2017
SIG        : 36752
Descricao  : Equacionamento - aba Tratamento de Divergencia
****************************************************************************************
Nº SOL....: 270984
Nº PPM....: 1345075
Data da Alteração: 24/03/2016
Responsável: Helio Lima Custódio
Descrição: Correção para que o campo dbdeDataFimPadrao não seja obrigatorio.
***************************************************************************************
Nº SOL....: 253577/18124
Nº PPM....: 1299709
Data da Alteração: 29/02/2016
Alteração  : Inclusão dos campos DATAINICIOPADRAO e DATAFIMPADRAO em qryDet, updDet
             Inclusão de grpDataInicioPadrao, grpDataFimPadrao, dbdeDataInicioPadrao
             e dbdeDataFimPadrao
Responsável: Helio Lima Custódio
Descrição: Incluir campos para parametrização das datas de inicio e fim padrão
           do déficit na interface de cadastro de plano previdenciário
***************************************************************************************
Nº SOL....: 258357/17801
Nº KINTANA: 1083052
Data da Alteração: 29/08/2015
Alteração  : qryBenef, updBenef
Responsável: Felipe A. Santos
Descrição:  alteração das rubricas de RRA, nos benefícios do plano.
***************************************************************************************
Alteração  : (dfm) beneficio plano->informacoes e regras / QryBenef, updBenef
Nº SOL.....: 253577-17349
KTN / PPM  : 840966
Data       : 11/06/2015
Responsável: Edilaine
Descrição..: Ajustes para Equacionamento do Deficit
****************************************************************************************
Nº SOL....: 191668
Nº KINTANA: 1820235
Data da Alteração: 25/11/2014
Alteração  : qryProvDesc, updProvDesc  (remoção dos flags)
Responsável: Edilaine
Descrição:  Trocar o tipo de cadastro de radio group para grid na aba "Incidência de
            Eventos" do cadastro de rubricas salariais
****************************************************************************************}
// -----------------------------------------------------------------------------
//Pendência   : SOL 174933 KINTANA 1733374
//Responsável : Douglas Siqueira
//Data        : 10/01/2014
//Descrição   : Controle de Saldo devedor.
// -----------------------------------------------------------------------------
// Autor(a)  : Douglas.siqueira SOL 205322 kintana 1996527
// Data      : 17/06/2013
// Descrição : Aba Bitributacação
// -----------------------------------------------------------------------------

// Autor(a)    : Aline Freire e Bruno Azevedo
// Pendência   : SOL 155182 Kintana 1228739
// Data        : 14/07/2011
// Descrição   : Criação da aba RRA - Rendimentos recebidos acumuladamente
//               para gravação dos seguintes campos:
//               IDRUBRICANORMALRRA ,IDRUBRICAATRASORRA,IDRUBRICADEVOLUCAORRA,
//               IDRUBRICAREVNORMALRRA,IDRUBRICAREVATRASORRA,IDRUBRICAREVDEVOLUCAORRA.
// -----------------------------------------------------------------------------
// Rotina    :
// Autor(a)  : André Felipe SOL 160185
// Data      : 14/01/2013
// Descrição : Criação de campos para cadastro do CNPB e Plano Receptor
// -----------------------------------------------------------------------------
// Autor(a)    : Otacilio aquino
// Pendência   : SOL 186966 Kintana 1762485
// Data        : 13/08/2012
// Descricao   : Registros de contribuições dos planos estão replicados
//------------------------------------------------------------------------------
// Autor(a)    : Thiago Melo
// Pendência   : SOL 181596 Kintana 1684065
// Data        : 31/05/2012
// Descricao   : Ao clicar no botão sbtnOpcoes, sistema erro
//------------------------------------------------------------------------------
// Autor(a)    : Otacilio Aquino
// Pendência   : SOL 177788 Kintana 1630609
// Data        : 05/04/2012
// Descricao   : Recompilação
//------------------------------------------------------------------------------
// Autor(a)    : Wylliam Leite da Silva
// Pendência   : 159477
// Data        : 09/01/2012
// Descricao   : Criar checkbox para quando estiver marcado receber o valor 1
//               para beneficio isento de IRRF
//------------------------------------------------------------------------------
// Autor(a)   : Vinicius Ferreira
// Data       : 02/10/2011
// Pendência  : SOL 154494 KINTANA 1188399
// Descricao  : Criar uma nova funcionalidade que permita efetuar o registro
//              de informações da habilitação dos benefícios do INSS para posterior
//              requerimento e/ou concessão em lote.
//------------------------------------------------------------------------------
// Autor(a)    : Fanuel Junior
// Pendência   : SOL148463 Kintana
// Data        : 10/02/2012
// Descricao   : Busca Automática %PBE, %FUNCEF e Benefício Mínimo.
//------------------------------------------------------------------------------
// Rotina      : AlteraQueryRubricas
// Autor(a)    : Claudio Faria
// Pendência   : 25156
// Data        : 24/04/2007
// Descricao   : Acerto no cadastro de rubricas de contribuição do plano previdenciário.
//------------------------------------------------------------------------------
// Rotina      : MsDescontoDevolucao
// Autor(a)    : Gleyber
// Pendência   : 24335
// Data        : 31/01/2007
// Descricao   : Acerto no filtro do montaselect
//------------------------------------------------------------------------------
// Rotina      : IncluiPlanoPrevContabil
// Autor(a)    : Claudio Faria
// Pendência   : 23369
// Data        : 03/11/2006
// Descricao   : Inclui "Plano Previdenciário Contábil" na criação de um novo "Plano Previdenciário"
//------------------------------------------------------------------------------
// Rotina      : qry
// Autor(a)    : Claudio Faria
// Pendência   : 23532
// Data        : 11/10/2006
// Descricao   : Inclui campo DATACRIACAO
//------------------------------------------------------------------------------
// Rotina      : qryDescontoNormal, qryDescontoAtraso, qryProventoDevolucao
// Autor(a)    : Claudio Faria
// Pendência   : 21988
// Data        : 30/08/2006
// Descricao   : Inclui FlgDesconto = 2 somente para contribuição paga pela patrocinadora
//------------------------------------------------------------------------------
// Rotina      : QryDescontos
// Autor(a)    : Leo
// Pendência   : 20966
// Data        : 08/12/2005
// Descricao   : acrescentei cáusula AND   (FLGTPRUBRICA LIKE '%B%')
//------------------------------------------------------------------------------
// Rotina      : QryDescontoDevolucao
// Autor(a)    : Leo
// Pendência   :
// Data        : 08/12/2005
// Descricao   : alterei para 1 na cáusula  (FLGDESCONTO    = 1)    AND
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Pendência   : 19535
// Data        : 20/10/2005
// Descricao   : Novo campo de Regra de Enquadramento
//------------------------------------------------------------------------------
// Rotina      : CmeCadastroConfirma
// Autor(a)    : Bruno Bastos
// Pendência   : 19502
// Data        : 27/06/2005
// Descricao   : Alterei a query que busca os benefícios e contribuições não pa_
//               rametrizados
//------------------------------------------------------------------------------
// Rotina      : -----
// Autor(a)    : Gleyber
// Pendência   : 18232
// Data        : 23/05/2005
// Descricao   : Criação dos campos IDRUBNORADICJUD, IDRUBATRADICJUD, IDRUBDEVADICJUD
//               para gravação de rubricas de Adicional de Ação Judicial.
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Data       : 06.05.2005
//  Descrição  : reinclusão da opção de cobrança bancária de mantidos (FLGCONTABMANTIDO)
//------------------------------------------------------------------------------
// Rotina      : -----
// Autor(a)    : Gleyber
// Pendência   : 17855
// Data        : 05/04/2005
// Descricao   : Criação do campo FLGNGRAVACONTZERO para utilização de parâmetro
//               que indicará que o plano não gravará contribuições com valores
//               zerados.
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Gleyber
// Pendência   : 18272
// Data        : 23/03/2005
// Descricao   : criação do campo FLGDESINDRES para a opção de DESINDEXAR RESERVA
//               ATÉ A DATA DO EVENTO
//------------------------------------------------------------------------------
// Rotina      : -----
// Autor(a)    : Camille
// Pendência   : 16938
// Data        : 02.12.2004
// Descricao   : criação dos campos IDREGRAQUITANT e IDRUBRICAQUITANT em
//               Beneficios x Plano para tratar quitacao automatica na folha
//               de beneficios
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Gleyber
// Pendência   : 17935
// Data        : 17/11/2004
// Descricao   : criação do campo FLGNDEVCNAFOLHA para a opção de DEVOLVER CONTRIBUIÇÃO
//               Não alimentada
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Leo
// Data        : 18.10.2004
// Descricao   : criação dos campos    IDRUBATRASOABONO,  IDRUBATR13ACJUD,  IDRUBDEV13ACJUD,
//               IDRUBATRREVACJUD, IDRUBDEVREVACJUD,  IDRUBATRREVISAO, IDRUBDEVREVISAO
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Leo
// Data        : 05.10.2004
// Descricao   : 1- alteração das queries de rubricas, acrecentando o CODPROVDESC
//               2- alteração dos combos de rubricas na parte de benefício para mostrar o código externo
//------------------------------------------------------------------------------
// Rotina      : qry
// Autor(a)    : Camille
// Pendência   : ------
// Data        : 15.09.2004
// Descricao   : Criar na tela o campo FLGDTALIMRESERVA (qry)
//------------------------------------------------------------------------------
// Rotina      : qry
// Autor(a)    : Camille
// Pendência   : ------
// Data        : 15.08.2004
// Descricao   : Criar na tela o campo MESPGABONO
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Gleyber
// Pendência   : 16606
// Data        : 21/07/2004
// Descricao   : Dois campos novos de rubricas de antecipação de abono anual
//               1 - Rubrica de Atraso
//               2 - Rubrica de Devolução
//------------------------------------------------------------------------------
// Rotina      : qryDet e tela
// Autor(a)    : Camille
// Pendência   : 17201
// Data        : 14.07.2004
// Descricao   : Parametro novo : CONTPREV.CODALTACRESCIMO
//------------------------------------------------------------------------------
// Rotina      : qry e tela
// Autor(a)    : Camille
// Pendência   : 16628
// Data        : 13.07.2004
// Descricao   : Parametro novo : PLANPREV.FLGGERACTNAOENV
//------------------------------------------------------------------------------
// Rotina      : InsereBenefPlanPatro, InsereContPlanPatro, CmeCadastroFind,
//               qryDetBeforePost, qryBenefBeforePost
// Autor(a)    : Gleyber
// Pendência   : 16279
// Data        : 09/07/2004
// Descricao   : Criação de rotinas para inserirem registros na CONTPLANPATRO e
//               na BENEFPLANPATRO no cadastro de uma contribuição e/ou benefício.
//------------------------------------------------------------------------------
// Rotina      : qry, upd
// Autor(a)    : Gleyber
// Pendência   : ???????
// Data        : 16/06/2004
// Descricao   : Criação do campo FLGREAJINSSNREQ que indicará se o valor do INSS
//               deve ser reajusta mesmo sem requerer o benefício.
//------------------------------------------------------------------------------
// Rotina      : --- ( Tela Beneficios | Tratamento de Exceção )
// Autor(a)    : Camille
// Pendência   : 16254
// Data        : 05.05.2004
// Descricao   : Criação do campo NUMDIASBENEFANT que indicará o número de
//               dias entre este beneficio que está sendo cadastrado e o beneficio
//               anterior. Por exemplo : Entre a DIB da PENSÃO será igual
//               a data final da aposentadoria. Assim, o NUMDIASBENEFANT deve
//               ser ZERO
//------------------------------------------------------------------------------
// Rotina      : --- ( Tela Beneficios | Tratamento de Exceção )
// Autor(a)    : Camille
// Pendência   : 16644
// Data        : 27.04.2004
// Descricao   : Criação do grupo Parâmetros para Controle de Limite de Alteração
//               de Valor
//------------------------------------------------------------------------------
// Rotina      : --- ( Tela Beneficios | Tratamento de Exceção )
// Autor(a)    : Camille
// Pendência   : ---
// Data        : 27.04.2004
// Descricao   : Retirada dos campos dos grupos Parametros para Pagamento Atrasado
//               e Parametros para Cobrança de Devolução, pois o AdmPrev e Folha
//               usam o cadastro de alteradores x beneficio
//------------------------------------------------------------------------------
// Rotina      : ---
// Autor(a)    : Gleyber
// Pendência   : 16276
// Data        : 30/03/2004
// Descricao   : Criação de campo para indicar a regra de indicação da Entidade
//               Contabil Financeira
//------------------------------------------------------------------------------
// Autor(a)    : LeoFuncef
// Data        : 09/02/2004
// Rotina      : updDet
// Alteração   : Inclusão do campo IDREGRAVLRRESERVA
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 05/01/2004
// Pendência   : 15091
// Rotina      : qryBenef
// Alteração   : Criação de campo na BENEFPLANPREV - (FLGMOVRESAPOSCONC)
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 13/10/2003
// Pendência   : 15202
// Rotina      : CmeDetalheInsert
// Alteração   : Na inserção passar valores default na aba TRATAMENTO DE EXCEÇÃO
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 14/08/2003
// Pendência   : 14846
// Alteração   : Campo IDRUBDEVADIANT13 estava sendo preenchido com 0 (zero)
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 28.07.2003
// Pendência   : 14657
// Alteração   : Criação do campo FLGTPBUSCAVALOR que indica se o valor integral
//               do beneficio deve ser buscado da benefbfciario (0) ou da
//               hstbenefbfciario(1) na rotina de reabertura/renovacao
//------------------------------------------------------------------------------
// Autor(a)    : Carlos Guedes
// Pendência   : 14645
// Data        : 25/07/2003
// Alteração   : Criação de campos para controlar a entrada de valores nos campos
//               Varlos SRb, Total Beneficio e Atual, mesmo que tenha regra associada.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 26/06/2003
// Alteração   : Criação do campo para gravação do Código do Plano no SPC
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 20.06.2003
// Alteração   : Criação do campo FLGTIPOGRAVAINSS com parametro do plano
//------------------------------------------------------------------------------
//  Função     : teste de compra de carência
//  Autor      : Leo
//  Data       : 18/06/2003
//  Descrição  : teste que verifica se a marcação de contribuição de compra de carência está marcada 
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 10.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
//  Função     : Informações Principais
//  Autor      : Augusto
//  Data       : 05/06/2003
//  Descrição  : Opção de Tipo de Busca para o Indice da Alimentação de reserva 
//------------------------------------------------------------------------------
//  Função     : Cadastro de Beneficios
//  Autor      : Camille
//  Data       : 27.05.2003
//  Descrição  : Inclusão dos parametros RUBRICA DE FÉRIAS (n,a,d)
//------------------------------------------------------------------------------
//  Função     : Cadastro de Beneficios
//  Autor      : Augusto
//  Data       : 23/05/2003
//  Descrição  : Inclusão da opção de Calculo por Regra em "Tipo de Data para Atualização da Reserva"
//------------------------------------------------------------------------------
//  Função     : bbtnOkDetClick
//  Autor      : Leo
//  Data       : 20.05.2003
//  Descrição  : tratamento para não permitir mais de uma contribuição marcada como
//               forma de cobrança de compra de carêcia
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Data       : 06.02.2003
//  Descrição  : Coloquei AllowClearKey = True nos combos de 13o. de contrib.
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Data       : 27.11.2002
//  Descrição  : inclusão das regdas de parcelamento
//------------------------------------------------------------------------------
//  Autor      : Alexandre Ramos.
//  Data       : 14.11.2002
//  Descrição  : inclusão da opção de cobrança bancária de mantidos (FLGCONTABMANTIDO)
//------------------------------------------------------------------------------
//  Autor      : Alexandre Ramos.
//  Data       : 01.01.1999
//  Descrição  : Incluir CheckBox de Pagamento ou não deste Beneficio no caso
//               do Posto Prisma
//               Label de Beneficio de Referencia (Texto e Funcionalidade)
//               Geração automática de Rubricas
//------------------------------------------------------------------------------
//  Autor      : Carlos Gleyber Macedo de Mesquita
//  Data       : 01.04.2002
//  Descrição  : Atualização automática da tabela de associação CONTPLANPATRO
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 03.04.2002
// Alteração   : Inclusão das rubricas para adiantamento de benefício e
//               cobrança de contribuição sobre benefício em adiantamento
//------------------------------------------------------------------------------
// Autor(a)    : Carlos Guedes
// Data        : 27.06.2002
// Alteração   : Colocando crítica sobre inclusão das rubrica de abono que
//              não foram "criadas" MAS estavam sendo gravadas com 0, o que
//              gerava um erro de constraints (chave-pai não localizada.)
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Data       : 10/10/2002
//  Descrição  : Comentada instrução no afterscroll da qrybeneficio
//               Pendência 9527
// *****************************************************************************


unit FCadPlanPrevCS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,
  wwdblook, Mask, wwdbedit, DBCtrls, Wwdotdot, Wwdbcomb, FCadastroCS,
  CmEventosCadastro, ImgList, UCMTypes, wwdbdatetimepicker,
  CMDateTimePicker  ;

  //padroes antigos
  //{$IFNDEF VERSAO0505 }, UCMTypes {$ENDIF} ;

Const
  vQL = #13+#10;

type
  TfrmCadPlanPrevCS = class(TfrmCadMestreDetalheCS)
    qryFundacao: TwwQuery;
    dbedNome: TwwDBEdit;
    dblkpcmbFundacao: TwwDBLookupCombo;
    tbsPlano: TTabSheet;
    tbsBenef: TTabSheet;
    dbgrdBenef: TwwDBGrid;
    pnlControlesBenef: TPanel;
    qryMoeda: TwwQuery;
    qryRegra: TwwQuery;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    dsBenef: TwwDataSource;

    qryVerificaIRRF: TwwQuery;
    qryBenef: TwwQuery;
    qryBenefIDPLANOPREV: TFloatField;
    qryBenefIDBENEFICIO: TFloatField;
    qryBenefFLGABONOFINALBEN: TFloatField;
    qryBenefFLGACEITAOPCAO: TFloatField;
    qryBenefFLGCALCTODOMES: TFloatField;
    qryBenefFLGCORRECAOATRASO: TFloatField;
    qryBenefFLGCORRECAODEVOL: TFloatField;
    qryBenefFLGEDITAOP1: TFloatField;
    qryBenefFLGEDITAOP2: TFloatField;
    qryBenefFLGEDITAOP3: TFloatField;
    qryBenefFLGOBRIGANPROC: TFloatField;
    qryBenefFLGOBRIGAOP1: TFloatField;
    qryBenefFLGOBRIGAOP2: TFloatField;
    qryBenefFLGOBRIGAOP3: TFloatField;
    qryBenefFLGPOSSUIABONO: TFloatField;
    qryBenefFLGQUITAASSISTEN: TFloatField;
    qryBenefFLGQUITAEMPRESTI: TFloatField;
    qryBenefFLGQUITAPREVIDEN: TFloatField;
    qryBenefFLGRECALCULAFIM: TFloatField;
    qryBenefFLGREFERENCIA: TFloatField;
    qryBenefIDBENEFREF: TFloatField;
    qryBenefIDPLANOBENEFREF: TFloatField;
    qryBenefIDREGRABENEFICIA: TFloatField;
    qryBenefCODALTERADORCORR: TFloatField;
    qryBenefIDREGRACALCABONO: TFloatField;
    qryBenefIDREGRACALCINSS: TFloatField;
    qryBenefIDREGRACALCOP1: TFloatField;
    qryBenefIDREGRACALCOP2: TFloatField;
    qryBenefIDREGRACALCOP3: TFloatField;
    qryBenefIDREGRACALCULO: TFloatField;
    qryBenefIDREGRAELEGIBILI: TFloatField;
    qryBenefIDREGRAFIM: TFloatField;
    qryBenefIDREGRAINICIO: TFloatField;
    qryBenefIDREGRAPAGAATRASO: TFloatField;
    qryBenefIDREGRAPAGAMENTO: TFloatField;
    qryBenefIDREGRAPRIMPAGTO: TFloatField;
    qryBenefIDREGRASIMULA: TFloatField;
    qryBenefIDREGRAULTPAGTO: TFloatField;
    qryBenefIDREGRAVALIDAOP1: TFloatField;
    qryBenefIDREGRAVALIDAOP2: TFloatField;
    qryBenefIDREGRAVALIDAOP3: TFloatField;
    qryBenefIDRGVALORTOTAL: TFloatField;
    qryBenefIDRUBABONO: TFloatField;
    qryBenefIDRUBANTECABONO: TFloatField;
    qryBenefIDRUBDESCANTECAB: TFloatField;
    qryBenefIDRUBDEVOLUCAO: TFloatField;
    qryBenefIDRUBRICA: TFloatField;
    qryBenefIDRUBRICACORRECAO: TFloatField;
    qryBenefIDRUBRICADIF: TFloatField;
    qryBenefINDICEREAJBENEF: TFloatField;
    qryBenefNOMEVALORBASE1: TStringField;
    qryBenefNOMEVALORBASE2: TStringField;
    qryBenefNOMEVALORBASE3: TStringField;
    qryBenefNUMOPCOES: TFloatField;
    qryBenefPRAZOCONCESSAO: TFloatField;
    qryBenefTPMODALIDADE: TStringField;
    qryBenefFLGBENEFINF: TFloatField;
    qryBenefIDRUBRICAATRASO: TFloatField;
    qryBenefIDRUBRICAREVISAO: TFloatField;
    qryBenefFLGDATAINDICERES: TFloatField;
    qryBenefFLGUSAEVOLFUNC: TFloatField;
    qryBenefFLGPAGAINSS: TFloatField;
    qryBenefFLGPAGAINTEG: TFloatField;
    qryBenefIDRELATBENEFICIO: TFloatField;
    qryBenefORIGEMCMBENEFICIO: TFloatField;
    qryBenefIDREGRABENEFMIN: TFloatField;
    qryBenefIDREGRASRB: TFloatField;
    qryBenefFLGACEITAACERTO: TFloatField;
    qryBenefIDRUBDEVOLABONO: TFloatField;
    qryBenefIDRUBADIANT: TFloatField;
    qryBenefIDRUBDEVOLADIANT: TFloatField;
    qryBenefIDRUBADIANT13: TFloatField;
    qryBenefIDRUBDEVADIANT13: TFloatField;
    qryBenefFLGACEITAZERO: TFloatField;
    qryBenefNOME: TStringField;
    qryBenefIDRUBACJUD: TFloatField;
    qryBenefIDRUBATRACJUD: TFloatField;
    qryBenefIDRUBDEVACJUD: TFloatField;
    qryBenefIDRUBREVACJUD: TFloatField;
    qryBenefIDRUBADTACJUD: TFloatField;
    qryBenefIDRUBDADACJUD: TFloatField;
    qryBenefIDRUB13ACJUD: TFloatField;
    qryBenefIDRUB13DESACJUD: TFloatField;
    qryBenefIDRUB13PGAN1ACJUD: TFloatField;
    qryBenefIDRUB13DVANACJUD: TFloatField;
    qryBenefIDRUB13ADTACJUD: TFloatField;
    qryBenefIDRUB13DADACJUD: TFloatField;
    qryBenefIDREGRADTINDRES: TFloatField;
    qryBenefIDRGDATAELEG: TFloatField;
    qryBenefIDRGVALORPREV: TFloatField;
    qryBenefFLGACTVLRSRB: TFloatField;
    qryBenefFLGACTVLRATUAL: TFloatField;
    qryBenefFLGACTVLRTOTBEN: TFloatField;
    qryBenefFLGTPBUSCAVALOR: TFloatField;
    qryBenefFLGMOVRESAPOSCONC: TFloatField;
    qryBenefIDRGPLANPREVCONT: TFloatField;
    qryBenefLIMITEALT: TFloatField;
    qryBenefPERCENTUALALT: TFloatField;
    qryBenefUSUARIOALT: TFloatField;
    qryBenefNUMDIASBENEFANT: TFloatField;
    qryBenefIDRUBACERTOABONO: TFloatField;
    qryBenefIDRUBDEVANTABONO: TFloatField;
    qryBenefIDRUBATRASOABONO: TFloatField;
    qryBenefIDRUBATR13ACJUD: TFloatField;
    qryBenefIDRUBDEV13ACJUD: TFloatField;
    qryBenefIDRUBATRREVACJUD: TFloatField;
    qryBenefIDRUBDEVREVACJUD: TFloatField;
    qryBenefIDRUBATRREVISAO: TFloatField;
    qryBenefIDRUBDEVREVISAO: TFloatField;
    qryBenefIDREGRAQUITANT: TFloatField;
    qryBenefIDRUBRICAQUITANT: TFloatField;
    qryBenefFLGDESINDRES: TFloatField;
    qryBenefIDRUBNORADICJUD: TFloatField;
    qryBenefIDRUBATRADICJUD: TFloatField;
    qryBenefIDRUBDEVADICJUD: TFloatField;
    qryBenefFLGISENTOIRRF: TFloatField;


    updBenef: TUpdateSQL;
    qryContribCorresp: TwwQuery;
    qryContribuicao: TwwQuery;
    lblValores: TLabel;
    lblFundacao: TLabel;
    pgctrlContPrev: TPageControl;
    tbsContPrev1: TTabSheet;
    tbsContPrev2: TTabSheet;
    Label5: TLabel;
    GroupBox1: TGroupBox;
    Label38: TLabel;
    Label41: TLabel;
    dbedOrdemCalculo: TDBEdit;
    dbcmbSitCorrespond: TwwDBComboBox;
    grpContribPai: TGroupBox;
    Label26: TLabel;
    Label9: TLabel;
    Label37: TLabel;
    dblkpcmbContribPai: TwwDBLookupCombo;
    dblkpcmbContribPai2: TwwDBLookupCombo;
    dblkpcmbContribPai3: TwwDBLookupCombo;
    qrpOpcoes: TGroupBox;
    sbtnOpcoes: TSpeedButton;
    dbchkAceitarOpcoes: TDBCheckBox;
    dbchkCobraDecTerc: TDBCheckBox;
    dbchkNaoExigeRec: TDBCheckBox;
    dbchkFlgDescFolha: TDBCheckBox;
    dblkpcmbContribuicao: TwwDBLookupCombo;
    GroupBox8: TGroupBox;
    Label33: TLabel;
    Label8: TLabel;
    Label34: TLabel;
    dblkpcmbRegraPrimPagto: TwwDBLookupCombo;
    dblkpcmbCalculo: TwwDBLookupCombo;
    wwDBLookupCombo2: TwwDBLookupCombo;
    dbrgrpPagador: TDBRadioGroup;
    pgctrlBenef: TPageControl;
    tbsBenefPlano1: TTabSheet;
    Panel6: TPanel;
    GroupBox2: TGroupBox;
    Label16: TLabel;
    dblkpcmbReajBenef: TwwDBLookupCombo;
    GroupBox6: TGroupBox;
    sbtnOpcoesBenef: TSpeedButton;
    dbchkAceitarOpBenef: TDBCheckBox;
    dbchkRecalcBenef: TDBCheckBox;
    dbchkPossuiAbono: TDBCheckBox;
    dbchkQuitPrev: TDBCheckBox;
    dbchkQuitAssist: TDBCheckBox;
    dbchkQuitEmp: TDBCheckBox;
    dbchkredividir: TDBCheckBox;
    dbchkBenefReferencia: TDBCheckBox;
    dbchkFlgObrigaNProc: TDBCheckBox;
    dblkpcmbBeneficio: TwwDBLookupCombo;
    grpBenefReferencia: TGroupBox;
    Label52: TLabel;
    dblkpcmbBenefRef: TwwDBLookupCombo;
    dbrgrpModalidade: TDBRadioGroup;
    tbsBenefPlano2: TTabSheet;
    Panel7: TPanel;
    tbsBenefPlano3: TTabSheet;
    Panel8: TPanel;
    dbrgpAbonoFinalBenef: TDBRadioGroup;
    GroupBox3: TGroupBox;
    Label27: TLabel;
    dblkpcmbCalcAbono: TwwDBLookupCombo;
    GroupBox4: TGroupBox;
    Label40: TLabel;
    dblkpcmbRubAbono: TwwDBLookupCombo;
    tbsBenefExcecao: TTabSheet;
    Panel10: TPanel;
    Label10: TLabel;
    qryBeneficio: TwwQuery;
    qryTpReajuste: TwwQuery;
    qryBenefReferen: TwwQuery;
    qryProventos: TwwQuery;
    tbsContPrev3: TTabSheet;
    qryDescontos: TwwQuery;
    qryAux: TwwQuery;
    qryProvDesc: TwwQuery;
    updProvDesc: TUpdateSQL;
    qryRubricaXPess: TwwQuery;
    updRubricaXPess: TUpdateSQL;
    edPaiDetalhe: TEdit;
    GroupBox7: TGroupBox;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    dblkpcmbCalcCob13: TwwDBLookupCombo;
    dblkpcmbUltCalcCob13: TwwDBLookupCombo;
    dblkpcmbPrimCalcCob13: TwwDBLookupCombo;
    dbgrpBenefInf: TDBRadioGroup;
    pnlDiverg: TPanel;
    Label7: TLabel;
    wwDBEdit2: TwwDBEdit;
    Label20: TLabel;
    qryRubAcerto: TwwQuery;
    qryAlterador: TwwQuery;
    tbsRubBenef: TTabSheet;
    DBRadioGroup1: TDBRadioGroup;
    dbchkPagaInteg: TDBCheckBox;
    DbChBxPagaInss: TDBCheckBox;
    pgctrlPlanos: TPageControl;
    tbsPlanoInfPrincipais: TTabSheet;
    GroupBox5: TGroupBox;
    dbchkAutoNumInsc: TDBCheckBox;
    dbchkRecalcContrib: TDBCheckBox;
    dbchkCalculaLimite: TDBCheckBox;
    dbchkUsaEvolFuncPlano: TDBCheckBox;
    pnlLimitePatro: TPanel;
    Label1: TLabel;
    Label6: TLabel;
    wwDBEdit1: TwwDBEdit;
    pnlInscricao: TPanel;
    Label17: TLabel;
    dbedNumInicial: TwwDBEdit;
    GroupBox14: TGroupBox;
    Label53: TLabel;
    dblkpcmbMoeda: TwwDBLookupCombo;
    tbsPlanoRegra: TTabSheet;
    grpRegras: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label48: TLabel;
    Label4: TLabel;
    Label39: TLabel;
    Label65: TLabel;
    dblkpcmbRegAdmissao: TwwDBLookupCombo;
    dblkpcmbRegDesistencia: TwwDBLookupCombo;
    dblkpcmbRegCancDescPrazo: TwwDBLookupCombo;
    dblkpcmbRegCancelamento: TwwDBLookupCombo;
    dblkpcmbRegraTransfPlano: TwwDBLookupCombo;
    dblkpcmbRegElegReins: TwwDBLookupCombo;
    qryRelatorios: TwwQuery;
    tbsBenefRelatParam: TTabSheet;
    Label67: TLabel;
    GroupBox12: TGroupBox;
    Label66: TLabel;
    sbtnNormaRelatBeneficio: TSpeedButton;
    dblkpcmbRelatBarra: TwwDBLookupCombo;
    Label68: TLabel;
    cmbFinalidade: TComboBox;
    GroupBox9: TGroupBox;
    dbrgrpUltimaCobranca: TDBRadioGroup;
    dbgrpCobraUlt13: TDBRadioGroup;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Label11: TLabel;
    dblkpcmbConcessao: TwwDBLookupCombo;
    lblRgConcBeneficiario: TLabel;
    dblkpcmbRegBeneficiario: TwwDBLookupCombo;
    Label12: TLabel;
    lblRgBenefCalculo: TLabel;
    Label14: TLabel;
    lblRgBenefValorTotal: TLabel;
    dblkpcmbCalcPrimPagto: TwwDBLookupCombo;
    dblkpcmbCalcBenef: TwwDBLookupCombo;
    dblkpcmbRegUltPagtoBenef: TwwDBLookupCombo;
    dblkpcmbRgValorTotal: TwwDBLookupCombo;
    Label13: TLabel;
    dblkpcmbRegraPagtoBenef: TwwDBLookupCombo;
    Label35: TLabel;
    wwDBLookupCombo5: TwwDBLookupCombo;
    lblRegraCalcINSS: TLabel;
    dblkpcmbRegraCalcINSS: TwwDBLookupCombo;
    Label28: TLabel;
    dblkpcmbRegraInicio: TwwDBLookupCombo;
    Label29: TLabel;
    dblkpcmbRegraFim: TwwDBLookupCombo;
    Label30: TLabel;
    wwDBLookupCombo4: TwwDBLookupCombo;
    Label18: TLabel;
    wwDBLookupCombo3: TwwDBLookupCombo;
    GroupBox17: TGroupBox;
    DBCheckBox1: TDBCheckBox;
    Label62: TLabel;
    wwDBLookupCombo6: TwwDBLookupCombo;
    GroupBox18: TGroupBox;
    Label63: TLabel;
    Label70: TLabel;
    wwDBLookupCombo7: TwwDBLookupCombo;
    wwDBLookupCombo10: TwwDBLookupCombo;
    DBCheckBox2: TDBCheckBox;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    dbchkParcelamento: TDBCheckBox;
    QryDescontoNormal: TwwQuery;
    QryDescontoAtraso: TwwQuery;
    QryProventoDevolucao: TwwQuery;
    QryProventoNormal: TwwQuery;
    QryProventoAtraso: TwwQuery;
    QryDescontoDevolucao: TwwQuery;
    Label31: TLabel;
    wwDBLookupCombo19: TwwDBLookupCombo;
    BtPesquisaRubrica: TSpeedButton;
    MsProvento: TMontaSelect;
    SpeedButton2: TSpeedButton;
    MsProventoNormal: TMontaSelect;
    MsProventoAtraso: TMontaSelect;
    MsDescontoDevolucao: TMontaSelect;
    MsDesconto: TMontaSelect;
    SpeedButton9: TSpeedButton;
    SpeedButton11: TSpeedButton;
    pgcRubricas: TPageControl;
    tbsRubNormais: TTabSheet;
    tbsAcaoJudicial: TTabSheet;
    Panel9: TPanel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    dblkpcmbContRubNormal: TwwDBLookupCombo;
    dbcmbContRubAtraso: TwwDBLookupCombo;
    dblkpcmbContRubDevol: TwwDBLookupCombo;
    dblkpcmb13Normal: TwwDBLookupCombo;
    dblkpcmb13Atraso: TwwDBLookupCombo;
    dblkpcmb13Devol: TwwDBLookupCombo;
    dblkpcmbDevAdBen: TwwDBLookupCombo;
    dblkpcmbDescAdBen: TwwDBLookupCombo;
    dblkpcmbDescAdBen13: TwwDBLookupCombo;
    dblkpcmbDevAdBen13: TwwDBLookupCombo;
    Panel2: TPanel;
    Label32: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label61: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    dblkpcmbContRubNomalJud: TwwDBLookupCombo;
    dbcmbContRubAtrasoJud: TwwDBLookupCombo;
    dblkpcmbContRubDevolJud: TwwDBLookupCombo;
    dblkpcmb13NormalJud: TwwDBLookupCombo;
    dblkpcmb13AtrasoJud: TwwDBLookupCombo;
    dblkpcmb13DevolJud: TwwDBLookupCombo;
    dblkpcmbDevAdBenJud: TwwDBLookupCombo;
    dblkpcmbDescAdBenJud: TwwDBLookupCombo;
    dblkpcmbDescAdBen13Jud: TwwDBLookupCombo;
    dblkpcmbDevAdBen13Jud: TwwDBLookupCombo;
    pgcRubBenef: TPageControl;
    tbsBenRubNorm: TTabSheet;
    tbsBenRubJud: TTabSheet;
    Panel1: TPanel;
    GroupBox19: TGroupBox;
    Label64: TLabel;
    Label69: TLabel;
    SpeedButton5: TSpeedButton;
    SpeedButton8: TSpeedButton;
    dblkpcmbRubricaBenefPagAd: TwwDBLookupCombo;
    dblkpcmbRubricaBenefDevAd: TwwDBLookupCombo;
    GroupBox20: TGroupBox;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    SpeedButton3: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    dblkpcmbRubricaBenefNormal: TwwDBLookupCombo;
    dblkpcmbRubricaBenefDevol: TwwDBLookupCombo;
    dblkpcmbRubricaBenefAtraso: TwwDBLookupCombo;
    Panel3: TPanel;
    DBCheckBox3: TDBCheckBox;
    tbCpCarencia: TTabSheet;
    Label91: TLabel;
    wwDBLookupCombo8: TwwDBLookupCombo;
    tbsRubContribFerias: TTabSheet;
    Label92: TLabel;
    wwDBLookupCombo9: TwwDBLookupCombo;
    Label93: TLabel;
    wwDBLookupCombo11: TwwDBLookupCombo;
    Label94: TLabel;
    wwDBLookupCombo12: TwwDBLookupCombo;
    DBRadioGroup3: TDBRadioGroup;
    grbCodigoSPC: TGroupBox;
    dbeCodigoSPC: TwwDBEdit;
    GroupBox22: TGroupBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    Label96: TLabel;
    wwDBLookupCombo13: TwwDBLookupCombo;
    Label97: TLabel;
    wwDBLookupCombo14: TwwDBLookupCombo;
    DBCheckBox7: TDBCheckBox;
    dbckMoveResAposConc: TDBCheckBox;
    Label98: TLabel;
    dblcRegraEntidadeContabil: TwwDBLookupCombo;
    GroupBox15: TGroupBox;
    Label19: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    dbedValorLimite: TwwDBEdit;
    dbedPercLimite: TwwDBEdit;
    qryUsuarioSistema: TwwQuery;
    dblkpcmbUsuarioLimite: TwwDBLookupCombo;
    Label101: TLabel;
    Label102: TLabel;
    dbedNumDiasBenefAnt: TwwDBEdit;
    dbchkFlgReajInssNReq: TDBCheckBox;
    Label103: TLabel;
    qryBenefPPatro: TwwQuery;
    dsBenefPPatro: TwwDataSource;
    updBenefPPatro: TUpdateSQL;
    qryContPPatro: TwwQuery;
    dsContPPatro: TwwDataSource;
    updContPPatro: TUpdateSQL;
    DBCheckBox8: TDBCheckBox;
    tbsContribExcecao: TTabSheet;
    Label104: TLabel;
    dblkpcmbContribAltAcrescimo: TwwDBLookupCombo;
    GroupBox16: TGroupBox;
    Label105: TLabel;
    Label106: TLabel;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    dblkpcmbRubAtrasoAntecAbono: TwwDBLookupCombo;
    dblkpcmbRubDevolAntecAbono: TwwDBLookupCombo;
    GroupBox23: TGroupBox;
    Label107: TLabel;
    dblkpcmbMesAbono: TwwDBLookupCombo;
    qryMeses: TwwQuery;
    tbsPlanoReserva: TTabSheet;
    dbrdgrpflgreservaultcot: TDBRadioGroup;
    GroupBox10: TGroupBox;
    Label95: TLabel;
    DbComboReserva: TwwDBComboBox;
    GroupBox25: TGroupBox;
    Label15: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    wwDBLookupCombo15: TwwDBLookupCombo;
    wwDBLookupCombo16: TwwDBLookupCombo;
    wwDBLookupCombo17: TwwDBLookupCombo;
    Label24: TLabel;
    wwDBLookupCombo18: TwwDBLookupCombo;
    GroupBox26: TGroupBox;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    wwDBLookupCombo20: TwwDBLookupCombo;
    wwDBLookupCombo21: TwwDBLookupCombo;
    wwDBLookupCombo22: TwwDBLookupCombo;
    wwDBLookupCombo23: TwwDBLookupCombo;
    DBRadioGroup2: TDBRadioGroup;
    Label25: TLabel;
    dblkpcmbRubAntecAbono: TwwDBLookupCombo;
    SpeedButton1: TSpeedButton;
    Label49: TLabel;
    SpeedButton10: TSpeedButton;
    dblkpcmbRubAtraso: TwwDBLookupCombo;
    GroupBox24: TGroupBox;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    SpeedButton21: TSpeedButton;
    SpeedButton22: TSpeedButton;
    SpeedButton23: TSpeedButton;
    dblkpcmbRubricaDevRevisao: TwwDBLookupCombo;
    dblkpcmbRubricaAtrasoRevisao: TwwDBLookupCombo;
    dblkpcmbRubricaRevisao: TwwDBLookupCombo;
    ScrollBox2: TScrollBox;
    GroupBox13: TGroupBox;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    SpeedButton14: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    dblkpcmbRubricaBenefNormalJud: TwwDBLookupCombo;
    dblkpcmbRubricaBenefDevolJud: TwwDBLookupCombo;
    dblkpcmbRubricaBenefAtrasoJud: TwwDBLookupCombo;
    GroupBox11: TGroupBox;
    Label81: TLabel;
    Label82: TLabel;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    dblkpcmbRubricaBenefPagAdJud: TwwDBLookupCombo;
    dblkpcmbRubricaBenefDevAdJud: TwwDBLookupCombo;
    GroupBox27: TGroupBox;
    Label108: TLabel;
    Label112: TLabel;
    Label113: TLabel;
    SpeedButton20: TSpeedButton;
    SpeedButton24: TSpeedButton;
    SpeedButton25: TSpeedButton;
    dblkpcmbRubDevRevisaoAcJud: TwwDBLookupCombo;
    dblkpcmbRubAtrasoRevisaoAcJud: TwwDBLookupCombo;
    dblkpcmbRubRevisaoAcJud: TwwDBLookupCombo;
    GroupBox28: TGroupBox;
    Label60: TLabel;
    Label86: TLabel;
    Label114: TLabel;
    SpeedButton4: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton26: TSpeedButton;
    dblkpcmbRubDevAbonoAcJud: TwwDBLookupCombo;
    dblkpcmbRubAtrasoAbonoAcJud: TwwDBLookupCombo;
    dblkpcmbRubAbonoAcJud: TwwDBLookupCombo;
    DBRadioGroup4: TDBRadioGroup;
    Label115: TLabel;
    wwDBLookupCombo24: TwwDBLookupCombo;
    Label116: TLabel;
    dblkpcmbRubricaQuitaAuto: TwwDBLookupCombo;
    SpeedButton27: TSpeedButton;
    DBCheckBox9: TDBCheckBox;
    DBCheckBox10: TDBCheckBox;
    GroupBox21: TGroupBox;
    Label117: TLabel;
    Label118: TLabel;
    Label119: TLabel;
    SpeedButton28: TSpeedButton;
    SpeedButton29: TSpeedButton;
    SpeedButton30: TSpeedButton;
    dblkpcmbRubJudAdicBenefDevol: TwwDBLookupCombo;
    dblkpcmbRubJudAdicBenefAtraso: TwwDBLookupCombo;
    dblkpcmbRubJudAdicBenefNormal: TwwDBLookupCombo;
    GroupBox29: TGroupBox;
    Label120: TLabel;
    wwDBLookupCombo25: TwwDBLookupCombo;
    dbchkContabMantido: TDBCheckBox;
    Label121: TLabel;
    GroupBox30: TGroupBox;
    dbdeDataEfetivacao: TCMDateTimePicker;
    qryIncPlanoPrevContabil: TwwQuery;
    DBCheckBox11: TDBCheckBox;
    qryBenefFLGVALORTITULAR1: TFloatField;
    qryBenefFLGVALORTITULAR2: TFloatField;
    qryBenefFLGVALORTITULAR3: TFloatField;
    sbtnOpcoesTextoBenef: TSpeedButton;
    dbchkAceitarOpTextoBenef: TDBCheckBox;
    qryBenefIDREGRAVALIDAOPTEXTO1: TFloatField;
    qryBenefIDREGRAVALIDAOPTEXTO2: TFloatField;
    qryBenefIDREGRAVALIDAOPTEXTO3: TFloatField;
    qryBenefIDREGRACALCOPTEXTO1: TFloatField;
    qryBenefIDREGRACALCOPTEXTO2: TFloatField;
    qryBenefIDREGRACALCOPTEXTO3: TFloatField;
    qryBenefNOMECAMPOTEXTO1: TStringField;
    qryBenefNOMECAMPOTEXTO2: TStringField;
    qryBenefNOMECAMPOTEXTO3: TStringField;
    qryBenefFLGOBRIGAOPTEXTO1: TFloatField;
    qryBenefFLGOBRIGAOPTEXTO2: TFloatField;
    qryBenefFLGOBRIGAOPTEXTO3: TFloatField;
    qryBenefFLGEDITAOPTEXTO1: TFloatField;
    qryBenefFLGEDITAOPTEXTO2: TFloatField;
    qryBenefFLGEDITAOPTEXTO3: TFloatField;
    qryBenefNUMOPCOESTEXTO: TFloatField;
    qryBenefFLGOPCAOTEXTO: TFloatField;
    tabRRA: TTabSheet;
    grbRRAPagNormal: TGroupBox;
    //Label122: TLabel; // Felipe A. Santos SOL 258357/17801 PPM 1083052
    Label123: TLabel;
    Label124: TLabel;
    //btnNPagto: TSpeedButton; // Felipe A. Santos SOL 258357/17801 PPM 1083052
    btnNPagtoAtrasado: TSpeedButton;
    btnNPagtoDevol: TSpeedButton;
    //cboNPagto: TwwDBLookupCombo; // Felipe A. Santos SOL 258357/17801 PPM 1083052
    cboNPagtoDevol: TwwDBLookupCombo;
    cboNPagtoAtrasado: TwwDBLookupCombo;
    grbRRARev: TGroupBox;
    //Label125: TLabel; // Felipe A. Santos SOL 258357/17801 PPM 1083052
    Label126: TLabel;
    Label127: TLabel;
    //btnRPagto: TSpeedButton; // Felipe A. Santos SOL 258357/17801 PPM 1083052
    btnRPagtoAtrasado: TSpeedButton;
    btnRPagtoDevol: TSpeedButton;
    //cboRPagto: TwwDBLookupCombo; // Felipe A. Santos SOL 258357/17801 PPM 1083052
    cboRPagtoDevol: TwwDBLookupCombo;
    cboRPagtoAtrasado: TwwDBLookupCombo;
    MsProvDescD: TMontaSelect;
    MsProvDescA: TMontaSelect;
    MsProvDescN: TMontaSelect;
    qryLkpProvDescN: TwwQuery;
    qryLkpProvDescA: TwwQuery;
    qryLkpProvDescD: TwwQuery;
    TabSheet6: TTabSheet;//douglas.siqueira SOL 205322 Kintana 1996527
    GroupBox31: TGroupBox;//douglas.siqueira SOL 205322 Kintana 1996527
    Label128: TLabel;//douglas.siqueira SOL 205322 Kintana 1996527
    Label129: TLabel;//douglas.siqueira SOL 205322 Kintana 1996527
    Label130: TLabel;//douglas.siqueira SOL 205322 Kintana 1996527
    SpeedButton31: TSpeedButton;//douglas.siqueira SOL 205322 Kintana 1996527
    SpeedButton32: TSpeedButton;//douglas.siqueira SOL 205322 Kintana 1996527
    SpeedButton33: TSpeedButton;//douglas.siqueira SOL 205322 Kintana 1996527
    cboNPagto_B: TwwDBLookupCombo;//douglas.siqueira SOL 205322 Kintana 1996527
    cboNPagtoDevol_B: TwwDBLookupCombo;//douglas.siqueira SOL 205322 Kintana 1996527
    cboNPagtoAtrasado_B: TwwDBLookupCombo;//douglas.siqueira SOL 205322 Kintana 1996527
    GroupBox32: TGroupBox;//douglas.siqueira SOL 205322 Kintana 1996527
    Label131: TLabel;//douglas.siqueira SOL 205322 Kintana 1996527
    Label132: TLabel;//douglas.siqueira SOL 205322 Kintana 1996527
    Label133: TLabel;//douglas.siqueira SOL 205322 Kintana 1996527
    SpeedButton34: TSpeedButton;//douglas.siqueira SOL 205322 Kintana 1996527
    SpeedButton35: TSpeedButton;//douglas.siqueira SOL 205322 Kintana 1996527
    SpeedButton36: TSpeedButton;//douglas.siqueira SOL 205322 Kintana 1996527
    cboAPagtoDevol_B: TwwDBLookupCombo;//douglas.siqueira SOL 205322 Kintana 1996527
    cboAPagtoAtrasado_B: TwwDBLookupCombo;//douglas.siqueira SOL 205322 Kintana 1996527
    cboAPagto_B: TwwDBLookupCombo;//douglas.siqueira SOL 205322 Kintana 1996527
    GroupBox33: TGroupBox;//douglas.siqueira SOL 205322 Kintana 1996527
    Label134: TLabel;//douglas.siqueira SOL 205322 Kintana 1996527
    Label135: TLabel;//douglas.siqueira SOL 205322 Kintana 1996527
    Label136: TLabel;//douglas.siqueira SOL 205322 Kintana 1996527
    SpeedButton37: TSpeedButton;//douglas.siqueira SOL 205322 Kintana 1996527
    SpeedButton38: TSpeedButton;//douglas.siqueira SOL 205322 Kintana 1996527
    SpeedButton39: TSpeedButton;//douglas.siqueira SOL 205322 Kintana 1996527
    cboRPagtoDevol_B: TwwDBLookupCombo;//douglas.siqueira SOL 205322 Kintana 1996527
    cboRPagtoAtrasado_B: TwwDBLookupCombo;//douglas.siqueira SOL 205322 Kintana 1996527
    cboRPagto_B: TwwDBLookupCombo;//douglas.siqueira SOL 205322 Kintana 1996527
    MsProvDescD_B: TMontaSelect; //douglas.siqueira SOL 205322 Kintana 1996527
    MsProvDescA_B: TMontaSelect; //douglas.siqueira SOL 205322 Kintana 1996527
    MsProvDescN_B: TMontaSelect; //douglas.siqueira SOL 205322 Kintana 1996527
    qryLkpProvDescN_B: TwwQuery; //douglas.siqueira SOL 205322 Kintana 1996527
    qryLkpProvDescA_B: TwwQuery; //douglas.siqueira SOL 205322 Kintana 1996527
    qryLkpProvDescD_B: TwwQuery; //douglas.siqueira SOL 205322 Kintana 1996527
    qryBenefIDRUBBIT: TFloatField; //douglas.siqueira SOL 205322 Kintana 1996527
    qryBenefIDRUBATRABIT: TFloatField;//douglas.siqueira SOL 205322 Kintana 1996527
    qryBenefIDRUB13BIT: TFloatField;  //douglas.siqueira SOL 205322 Kintana 1996527
    qryBenefIDRUBATR13BIT: TFloatField; //douglas.siqueira SOL 205322 Kintana 1996527
    qryBenefIDRUBDEV13BIT: TFloatField;//douglas.siqueira SOL 205322 Kintana 1996527
    qryBenefIDRUBREVABIT: TFloatField; //douglas.siqueira SOL 205322 Kintana 1996527
    qryBenefIDRUBATRREVBIT: TFloatField;//douglas.siqueira SOL 205322 Kintana 1996527
    qryBenefIDRUBDEVREVBIT: TFloatField;//douglas.siqueira SOL 205322 Kintana 1996527
    qryBenefIDRUBDEVABIT: TFloatField;
    TabSheet7: TTabSheet;
    GroupBox34: TGroupBox;
    Label137: TLabel;
    Label138: TLabel;
    Label139: TLabel;
    SpeedButton40: TSpeedButton;
    SpeedButton41: TSpeedButton;
    SpeedButton42: TSpeedButton;
    cboACobraAtras_D: TwwDBLookupCombo;
    cboACobraDevo_D: TwwDBLookupCombo;
    cboACobra_D: TwwDBLookupCombo;
    GroupBox35: TGroupBox;
    Label140: TLabel;
    Label141: TLabel;
    Label142: TLabel;
    SpeedButton43: TSpeedButton;
    SpeedButton44: TSpeedButton;
    SpeedButton45: TSpeedButton;
    cboNCobraAtras_D: TwwDBLookupCombo;
    cboNCobraDevo_D: TwwDBLookupCombo;
    cboNCobra_D: TwwDBLookupCombo;
    qryLkpProvCobraN_D: TwwQuery;
    qryLkpProvCobraA_D: TwwQuery;
    qryLkpProvCobraD_D: TwwQuery;
    MsProvCobraD_D: TMontaSelect;
    MsProvCobraA_D: TMontaSelect;
    MsProvCobraN_D: TMontaSelect;
    qryBenefIDRUBRICADIVIDABENEFNORMAL: TFloatField;
    qryBenefIDRUBRICADIVIDABENEFICIODEVOL: TFloatField;
    qryBenefIDRUBRICADIVIDABENEFTRASO: TFloatField;
    qryBenefIDRUBRICADIVIDABENEF13: TFloatField;
    qryBenefIDRUBRICADIVIDABENEF13DEVOL: TFloatField;
    qryBenefIDRUBRICADIVIDABENEF13ATRASO: TFloatField;
    qryRubxEvento: TwwQuery;
    updRubxEvento: TUpdateSQL;
    gbDeficit: TGroupBox;
    dbchkFlgBSFAB: TDBCheckBox;
    dbchkFlgBCDeficit: TDBCheckBox;
    Label143: TLabel;
    Label144: TLabel;
    Label145: TLabel;
    dblcRegraBS: TwwDBLookupCombo;
    dblcRegraFAB: TwwDBLookupCombo;
    dblcRegraCBD: TwwDBLookupCombo;
    qryBenefFLGAPRESENTABSFAB: TFloatField;
    qryBenefFLGAPRESENTADEFICIT: TFloatField;
    qryBenefIDREGRACALCBS: TFloatField;
    qryBenefIDREGRACALCFAB: TFloatField;
    qryBenefIDREGRACALCBASEDEFICIT: TFloatField;//douglas.siqueira SOL 205322 Kintana 1996527
    
    // Felipe A. Santos SOL 258357/17801 PPM 1083052 {Fim qryBenefIDRUBRICACORDEVOLUCAORRA}
    grbRubCorrecao: TGroupBox;
    lblRubCDevol: TLabel;
    lblRubCPagAtra: TLabel;
    sbtnRubCorA: TSpeedButton;
    sbtnRubCorD: TSpeedButton;
    cboCPagtoDevol: TwwDBLookupCombo;
    cboCPagtoAtrasado: TwwDBLookupCombo;
    qryBenefIDRUBRICACORATRASORRA: TFloatField;
    qryBenefIDRUBRICACORDEVOLUCAORRA: TFloatField;
    grpDataInicioPadrao: TGroupBox;
    dbdeDataInicioPadrao: TCMDateTimePicker;
    grpDataFimPadrao: TGroupBox;
    dbdeDataFimPadrao: TCMDateTimePicker;
    tbsTrataDiverg: TTabSheet;
    lblAltBaixaDoc: TLabel;
    dblkpcmbAltBxDoc: TwwDBLookupCombo;
    lblAltBaixaDocPGA: TLabel;
    dblkpcmbAltBxDocPGA: TwwDBLookupCombo;
    gbRubAcerto: TGroupBox;
    dblkpcmbRubricaAcerto: TwwDBLookupCombo;
    btnRubAcerto: TSpeedButton;
    QryProventoAcerto: TwwQuery;
    qryBenefIDRUBRICAACERTO: TFloatField;
    qryAltBaixa: TwwQuery;
    tsIsencaoiRAcJud: TTabSheet;
    pnlIsentoAcJud: TPanel;
    dbgrdIsentoAcJud: TwwDBGrid;
    GroupBox36: TGroupBox;
    dblkRubIsentaIRAcJud: TwwDBLookupCombo;
    sbtnRubIsenta: TSpeedButton;
    dblkRubIncideIRAcJud: TwwDBLookupCombo;
    sbtnRubIncide: TSpeedButton;
    Label122: TLabel;
    Label125: TLabel;
    qryIsentoIRAcJud: TwwQuery;
    updIsentoIR: TUpdateSQL;
    qryRubIncideIR: TwwQuery;
    qryRubIsentaIR: TwwQuery;
    dsIsentoIRAcJud: TDataSource;
    MSRubIsenta: TMontaSelect;
    MSRubIncide: TMontaSelect;
    GroupBox37: TGroupBox;
    dbedLimitePerc: TwwDBEdit;
    qryBenefIDPLANPREVCONTAB: TFloatField;      //edilaine - SIG36752
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbchkAutoNumInscClick(Sender: TObject);
    procedure dbchkCalculaLimiteClick(Sender: TObject);
    procedure dblkpcmbContribuicaoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dbchkAceitarOpcoesClick(Sender: TObject);
    procedure qryContribuicaoAfterScroll(DataSet: TDataSet);
    procedure sbtnOpcoesClick(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure dbchkAceitarOpBenefClick(Sender: TObject);
    procedure dbchkPossuiAbonoClick(Sender: TObject);
    procedure dbrgrpPagadorClick(Sender: TObject);
    procedure dblkpcmbBenefRefCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbBenefRefExit(Sender: TObject);
    procedure qryBeneficioAfterScroll(DataSet: TDataSet);
    procedure qryDetBeforePost(DataSet: TDataSet);
    procedure qryBenefBeforePost(DataSet: TDataSet);
    procedure sbtnOpcoesBenefClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure dbedNomeExit(Sender: TObject);
    procedure dblkpcmbBeneficioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure qryDetAfterScroll(DataSet: TDataSet);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure pgctrlDetalheChange(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure qryBenefAfterScroll(DataSet: TDataSet);
    procedure dbchkBenefReferenciaClick(Sender: TObject);
    procedure DbChBxPagaInssClick(Sender: TObject);
    procedure dblkpcmbRelatBarraCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormShow(Sender: TObject);
    procedure sbtnNormaRelatBeneficioClick(Sender: TObject);
    procedure qryBeforePost(DataSet: TDataSet);
    Procedure CmeDetalheDelete(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure dbchkCobraDecTercClick(Sender: TObject);
    procedure tbcDetalheChange(Sender: TObject);
    procedure BtPesquisaRubricaClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure tbsContPrev3Show(Sender: TObject);
    procedure tbsRubBenefShow(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure dbedPercLimiteEnter(Sender: TObject);
    procedure dbedValorLimiteEnter(Sender: TObject);
    procedure dblkpcmbUsuarioLimiteEnter(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure SpeedButton23Click(Sender: TObject);
    procedure SpeedButton22Click(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure SpeedButton26Click(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure SpeedButton24Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton27Click(Sender: TObject);
    procedure SpeedButton28Click(Sender: TObject);
    procedure SpeedButton29Click(Sender: TObject);
    procedure SpeedButton30Click(Sender: TObject);
    procedure sbtnOpcoesTextoBenefClick(Sender: TObject);
    procedure dbchkAceitarOpTextoBenefClick(Sender: TObject);
    procedure btnNPagtoClick(Sender: TObject);
    procedure btnNPagtoAtrasadoClick(Sender: TObject);
    procedure btnNPagtoDevolClick(Sender: TObject);
    procedure btnRPagtoClick(Sender: TObject);
    procedure btnRPagtoAtrasadoClick(Sender: TObject);
    procedure btnRPagtoDevolClick(Sender: TObject);
    procedure SpeedButton31Click(Sender: TObject);//douglas.siqueira SOL 205322 Kintana 1996527
    procedure SpeedButton32Click(Sender: TObject);//douglas.siqueira SOL 205322 Kintana 1996527
    procedure SpeedButton33Click(Sender: TObject);//douglas.siqueira SOL 205322 Kintana 1996527
    procedure SpeedButton37Click(Sender: TObject);//douglas.siqueira SOL 205322 Kintana 1996527
    procedure SpeedButton38Click(Sender: TObject);//douglas.siqueira SOL 205322 Kintana 1996527
    procedure SpeedButton39Click(Sender: TObject);//douglas.siqueira SOL 205322 Kintana 1996527
    procedure SpeedButton34Click(Sender: TObject);//douglas.siqueira SOL 205322 Kintana 1996527
    procedure SpeedButton35Click(Sender: TObject);//douglas.siqueira SOL 205322 Kintana 1996527
    procedure SpeedButton36Click(Sender: TObject);
    procedure SpeedButton43Click(Sender: TObject);
    procedure SpeedButton44Click(Sender: TObject);
    procedure SpeedButton45Click(Sender: TObject);
    procedure SpeedButton40Click(Sender: TObject);
    procedure SpeedButton41Click(Sender: TObject);
    procedure SpeedButton42Click(Sender: TObject);
    procedure dbchkFlgBSFABClick(Sender: TObject);
    procedure dbchkFlgBCDeficitClick(Sender: TObject);//douglas.siqueira SOL 205322 Kintana 1996527
    
	// Felipe A. Santos SOL 258357/17801 PPM 1083052 {Fim sbtnRubCorDClick}
    procedure sbtnRubCorAClick(Sender: TObject);
    procedure sbtnRubCorDClick(Sender: TObject);
    procedure btnRubAcertoClick(Sender: TObject);
    procedure dblkpcmbAltBxDocChange(Sender: TObject);
    procedure dblkpcmbAltBxDocPGAChange(Sender: TObject);
    procedure qryIsentoIRAcJudBeforePost(DataSet: TDataSet);
    procedure sbtnRubIsentaClick(Sender: TObject);
    procedure sbtnRubIncideClick(Sender: TObject);
    procedure MSRubIsentaBeforeOpenCds(var sqlText: String;
      strListParams: TStringList);
    procedure MSRubIncideBeforeOpenCds(var sqlText: String;
      strListParams: TStringList);
  private
    { Private declarations }
    bTelaOpcoesContrib : boolean;

    dValorLimiteAntes     : double; 
    dPercLimiteAntes      : double; 
    iIdUsuarioLimiteAntes : double; 

    // Variaveis para testar alteracao de flags que possuem consequencias
    // em outras tabelas
    iIdxPagadorAntes,
    iIdxPagadorDepois : integer;
    bDescIRAntes,
    bDescIRDepois,
    bCobra13Antes,
    bCobra13Depois : boolean;

    bMudouAltDeBaixa : boolean;                       //edilaine - SIG36752

    function  VerificaDetalhe : boolean;
    function  GravaRubricasContrib(var piIdRubNormal,
                                       piIdRubAtraso,
                                       piIdRubDevolu,
                                       piIdRubDecTercNormal,
                                       piIdRubDecTercAtra,
                                       piIdRubDecTercDevolu,
                                       piIdRubAdiant,        
                                       piIdRubDevolAdiant,
                                       piIdRubAdiant13,
                                       piIdRubDevAdiant13   : longint;
                                       bApenas13            : boolean ) : boolean;

    function  GravaRubricasBenef (var  piIdRubNormal,
                                       piIdRubricaAtraso,
                                       piIdRubDevolucao,
                                       piIdRubRevisao,
                                       piIdRubAbono,
                                       piIdRubAntecAbono,
                                       piIdRubDescAntecAbono,
                                       piIdRubDevolAbono,
                                       piIdRubAdiant,        
                                       piIdRubDevolAdiant,
                                       piIdRubAdiant13,
                                       piIdRubDevAdiant13   : longint ) : boolean;

    function  MoveContribuicao(piIdPlanoPrev, piIdContribuicao, piIdxPagadorAntes,
                               piIdxPagadorDepois : integer) : boolean;

    procedure InsereContPlanPatro(piIdPlanoPrev, piIdContribuicao : Integer);

    procedure InsereBenefPlanPatro(piIdPlanoPrev, piIdBeneficio : Integer);

    
    
    Function AlteraQueryRubricas(psFlgPagadora, psTipo,
                                 psContribBenef, psFlgAtrasODevol: String):String; 

    function IncluiPlanoPrevContabil (piIdPlanoPrev : Integer;
                                      psNomePlano   : String):Boolean;

    function VerificaRRA : boolean; // Felipe A. Santos - SOL 258357/17801 PPM 1083052

    function VerificaDuplicidadeRubIsenta : boolean;     //edilaine - SIG24483

  public
    { Public declarations }
    OperacaoDetalhe : TOperacao;

    Function SelecionaRubrica(MontaSelect : TMontaSelect): String;   

  end;

var
  frmCadPlanPrevCS: TfrmCadPlanPrevCS;

implementation

uses UAdmPrev, UDataBase, FPedeOpcoesContrib, UMensErro, FPedeOpcoesBenef,FPedeOpcoesTextoBenef,
  FMostraAux, dBaseDados, fAguarde, Usistema, UBeneficio, DAPrev, UModulo;

{$R *.DFM}

// *********************************************************************
// **************************  MÉTODOS AUXILIARES
// *********************************************************************
function  TfrmCadPlanPrevCS.GravaRubricasContrib(var piIdRubNormal,
                                                     piIdRubAtraso,
                                                     piIdRubDevolu,
                                                     piIdRubDecTercNormal,
                                                     piIdRubDecTercAtra,
                                                     piIdRubDecTercDevolu,
                                                     piIdRubAdiant,
                                                     piIdRubDevolAdiant,
                                                     piIdRubAdiant13,
                                                     piIdRubDevAdiant13 : longint;
                                                     bApenas13          : boolean ) : boolean;

var
   sRubricaNormal,
   sRubricaAtraso,
   sRubricaDevolucao,
   sNumPrioridade : string;
begin
   Result := False;

   piIdRubNormal        := -1;
   piIdRubAtraso        := -1;
   piIdRubDevolu        := -1;
   piIdRubDecTercNormal := -1;
   piIdRubDecTercAtra   := -1;

   piIdRubDecTercDevolu := -1;


   sNumPrioridade := '0';

   //*******************************************************************************
   //************ RUBRICAS DA PROPRIA CONTRIBUICAO
   //*******************************************************************************
   if not bApenas13
   then begin
      sRubricaNormal       := Copy('[Normal] - '+Trim(dblkpcmbContribuicao.Text)+' - '+Trim(dbedNome.Text),1,130);
      sRubricaAtraso       := Copy('[Atrasada] - '+Trim(dblkpcmbContribuicao.Text)+' - '+Trim(dbedNome.Text),1,130);
      sRubricaDevolucao    := Copy('[Devolvida] - '+Trim(dblkpcmbContribuicao.Text)+' - '+Trim(dbedNome.Text),1,130);

      // Gravar Rubrica Normal
      piIdRubNormal := LeUltRegistro(qryAux,'PROVDESC');

      with qryProvDesc do
      begin
         Insert;
         FieldByName('IDPROVENTO').AsInteger     := piIdRubNormal;
         FieldByName('DESCRICAO').AsString       := sRubricaNormal;
         FieldByName('FLGATRASODEVOL').AsString  := 'N';
         FieldByName('FLGCOMPOEREMTOTAL').AsInteger := 0;
         FieldByName('FLGCOMPOESALBENEF').AsInteger := 0;
         FieldByName('FLGCOMPOESALPART').AsInteger  := 0;
         FieldByName('FLGCONSOLIDA').AsInteger      := 0;
         FieldByName('FLGCONSTAFOLHA').AsInteger    := 0;
         //FieldByName('FLGDECIMOTERCEIRO').AsInteger := 0;   // edilaine - SOL 191668 / KTN 1820235
         FieldByName('FLGDESCONTO').AsInteger       := 1;
         FieldByName('FLGDESCPENSAO').AsInteger     := 0;
         FieldByName('FLGESPECIAL').AsInteger       := 0;
         //FieldByName('FLGFERIAS').AsInteger         := 0;   // edilaine - SOL 191668 / KTN 1820235
         FieldByName('FLGFGTS').AsInteger           := 0;
         FieldByName('FLGINCIDECONTRIB').AsInteger  := 0;
         FieldByName('FLGINCIDESALPART').AsInteger  := 0;
         FieldByName('FLGINSS').AsInteger           := 0;
         FieldByName('FLGINTERNO').AsInteger        := 1;
         FieldByName('FLGOBRIGAFAVOREC').AsInteger  := 0;
         FieldByName('FLGPRORATA').AsInteger        := 0;
         FieldByName('FLGRAIS').AsInteger           := 0;
         //FieldByName('FLGRESCISAO').AsInteger       := 0;   // edilaine - SOL 191668 / KTN 1820235
         //FieldByName('FLGSALFAMILIA').AsInteger     := 0;   // edilaine - SOL 191668 / KTN 1820235
         FieldByName('FLGTPRUBRICA').AsString       := 'P';
         FieldByName('FLGUSO').AsString             := 'P';
         FieldByName('NUMPRIORIDADE').AsInteger     := StrToInt(sNumPrioridade);
         Post;
      end;

      // Gravar Rubrica de Atraso
      piIdRubAtraso := LeUltRegistro(qryAux,'PROVDESC');

      with qryProvDesc do
      begin
         Insert;
         FieldByName('IDPROVENTO').AsInteger     := piIdRubAtraso;
         FieldByName('DESCRICAO').AsString       := sRubricaAtraso;
         FieldByName('FLGATRASODEVOL').AsString  := 'A';
         FieldByName('FLGCOMPOEREMTOTAL').AsInteger := 0;
         FieldByName('FLGCOMPOESALBENEF').AsInteger := 0;
         FieldByName('FLGCOMPOESALPART').AsInteger  := 0;
         FieldByName('FLGCONSOLIDA').AsInteger      := 0;
         FieldByName('FLGCONSTAFOLHA').AsInteger    := 0;
         //FieldByName('FLGDECIMOTERCEIRO').AsInteger := 0;     // edilaine - SOL 191668 / KTN 1820235
         FieldByName('FLGDESCONTO').AsInteger       := 1;
         FieldByName('FLGDESCPENSAO').AsInteger     := 0;
         FieldByName('FLGESPECIAL').AsInteger       := 0;
         //FieldByName('FLGFERIAS').AsInteger         := 0;     // edilaine - SOL 191668 / KTN 1820235
         FieldByName('FLGFGTS').AsInteger           := 0;
         FieldByName('FLGINCIDECONTRIB').AsInteger  := 0;
         FieldByName('FLGINCIDESALPART').AsInteger  := 0;
         FieldByName('FLGINSS').AsInteger           := 0;
         FieldByName('FLGINTERNO').AsInteger        := 1;
         FieldByName('FLGOBRIGAFAVOREC').AsInteger  := 0;
         FieldByName('FLGPRORATA').AsInteger        := 0;
         FieldByName('FLGRAIS').AsInteger           := 0;
         //FieldByName('FLGRESCISAO').AsInteger       := 0;     // edilaine - SOL 191668 / KTN 1820235
         //FieldByName('FLGSALFAMILIA').AsInteger     := 0;     // edilaine - SOL 191668 / KTN 1820235
         FieldByName('FLGTPRUBRICA').AsString       := 'P';
         FieldByName('FLGUSO').AsString             := 'P';
         FieldByName('NUMPRIORIDADE').AsInteger     := StrToInt(sNumPrioridade);
         Post;
      end;

      // Gravar rubrica de Devolucao
      piIdRubDevolu := LeUltRegistro(qryAux,'PROVDESC');

      with qryProvDesc do
      begin
         Insert;
         FieldByName('IDPROVENTO').AsInteger     := piIdRubDevolu;
         FieldByName('DESCRICAO').AsString       := sRubricaDevolucao;
         FieldByName('FLGATRASODEVOL').AsString  := 'D';
         FieldByName('FLGCOMPOEREMTOTAL').AsInteger := 0;
         FieldByName('FLGCOMPOESALBENEF').AsInteger := 0;
         FieldByName('FLGCOMPOESALPART').AsInteger  := 0;
         FieldByName('FLGCONSOLIDA').AsInteger      := 0;
         FieldByName('FLGCONSTAFOLHA').AsInteger    := 0;
         //FieldByName('FLGDECIMOTERCEIRO').AsInteger := 0;     // edilaine - SOL 191668 / KTN 1820235
         FieldByName('FLGDESCONTO').AsInteger       := 0;   
         FieldByName('FLGDESCPENSAO').AsInteger     := 0;
         FieldByName('FLGESPECIAL').AsInteger       := 0;
         //FieldByName('FLGFERIAS').AsInteger         := 0;     // edilaine - SOL 191668 / KTN 1820235
         FieldByName('FLGFGTS').AsInteger           := 0;
         FieldByName('FLGINCIDECONTRIB').AsInteger  := 0;
         FieldByName('FLGINCIDESALPART').AsInteger  := 0;
         FieldByName('FLGINSS').AsInteger           := 0;
         FieldByName('FLGINTERNO').AsInteger        := 1;
         FieldByName('FLGOBRIGAFAVOREC').AsInteger  := 0;
         FieldByName('FLGPRORATA').AsInteger        := 0;
         FieldByName('FLGRAIS').AsInteger           := 0;
         //FieldByName('FLGRESCISAO').AsInteger       := 0;    // edilaine - SOL 191668 / KTN 1820235
         //FieldByName('FLGSALFAMILIA').AsInteger     := 0;    // edilaine - SOL 191668 / KTN 1820235
         FieldByName('FLGTPRUBRICA').AsString       := 'P';
         FieldByName('FLGUSO').AsString             := 'P';
         FieldByName('NUMPRIORIDADE').AsInteger     := StrToInt(sNumPrioridade);
         Post;
      end;

      
      if qryDet.FieldByName('FLGINTERNO').AsString = 'AS'
      then begin
         // Gravar Rubrica de Cobrança sobre Adiantamento
         piIdRubAdiant := LeUltRegistro(qryAux,'PROVDESC');

         with qryProvDesc do
         begin
            Insert;
            FieldByName('IDPROVENTO').AsInteger     := piIdRubAdiant;
            FieldByName('DESCRICAO').AsString       := Copy('[Desc.Adiant.]'+Trim(dblkpcmbContribuicao.Text)+' - '+Trim(dbedNome.Text),1,130);
            FieldByName('FLGATRASODEVOL').AsString  := 'N';
            FieldByName('FLGCOMPOEREMTOTAL').AsInteger := 0;
            FieldByName('FLGCOMPOESALBENEF').AsInteger := 0;
            FieldByName('FLGCOMPOESALPART').AsInteger  := 0;
            FieldByName('FLGCONSOLIDA').AsInteger      := 0;
            FieldByName('FLGCONSTAFOLHA').AsInteger    := 0;
            //FieldByName('FLGDECIMOTERCEIRO').AsInteger := 0;     // edilaine - SOL 191668 / KTN 1820235
            FieldByName('FLGDESCONTO').AsInteger       := 1;
            FieldByName('FLGDESCPENSAO').AsInteger     := 0;
            FieldByName('FLGESPECIAL').AsInteger       := 0;
            //FieldByName('FLGFERIAS').AsInteger         := 0;     // edilaine - SOL 191668 / KTN 1820235
            FieldByName('FLGFGTS').AsInteger           := 0;
            FieldByName('FLGINCIDECONTRIB').AsInteger  := 0;
            FieldByName('FLGINCIDESALPART').AsInteger  := 0;
            FieldByName('FLGINSS').AsInteger           := 0;
            FieldByName('FLGINTERNO').AsInteger        := 1;
            FieldByName('FLGOBRIGAFAVOREC').AsInteger  := 0;
            FieldByName('FLGPRORATA').AsInteger        := 0;
            FieldByName('FLGRAIS').AsInteger           := 0;
            //FieldByName('FLGRESCISAO').AsInteger       := 0;     // edilaine - SOL 191668 / KTN 1820235
            //FieldByName('FLGSALFAMILIA').AsInteger     := 0;     // edilaine - SOL 191668 / KTN 1820235
            FieldByName('FLGTPRUBRICA').AsString       := 'P';
            FieldByName('FLGUSO').AsString             := 'P';
            FieldByName('NUMPRIORIDADE').AsInteger     := StrToInt(sNumPrioridade);
            Post;
         end;

         // Gravar rubrica de Devolucao sobre Adiantamento
         piIdRubDevolAdiant := LeUltRegistro(qryAux,'PROVDESC');

         with qryProvDesc do
         begin
            Insert;
            FieldByName('IDPROVENTO').AsInteger     := piIdRubDevolAdiant;
            FieldByName('DESCRICAO').AsString       := Copy('[Devol.Adiant.]'+Trim(dblkpcmbContribuicao.Text)+' - '+Trim(dbedNome.Text),1,130);
            FieldByName('FLGATRASODEVOL').AsString  := 'D';
            FieldByName('FLGCOMPOEREMTOTAL').AsInteger := 0;
            FieldByName('FLGCOMPOESALBENEF').AsInteger := 0;
            FieldByName('FLGCOMPOESALPART').AsInteger  := 0;
            FieldByName('FLGCONSOLIDA').AsInteger      := 0;
            FieldByName('FLGCONSTAFOLHA').AsInteger    := 0;
            //FieldByName('FLGDECIMOTERCEIRO').AsInteger := 0;    // edilaine - SOL 191668 / KTN 1820235
            FieldByName('FLGDESCONTO').AsInteger       := 0;   
            FieldByName('FLGDESCPENSAO').AsInteger     := 0;
            FieldByName('FLGESPECIAL').AsInteger       := 0;
            //FieldByName('FLGFERIAS').AsInteger         := 0;    // edilaine - SOL 191668 / KTN 1820235
            FieldByName('FLGFGTS').AsInteger           := 0;
            FieldByName('FLGINCIDECONTRIB').AsInteger  := 0;
            FieldByName('FLGINCIDESALPART').AsInteger  := 0;
            FieldByName('FLGINSS').AsInteger           := 0;
            FieldByName('FLGINTERNO').AsInteger        := 1;
            FieldByName('FLGOBRIGAFAVOREC').AsInteger  := 0;
            FieldByName('FLGPRORATA').AsInteger        := 0;
            FieldByName('FLGRAIS').AsInteger           := 0;
            //FieldByName('FLGRESCISAO').AsInteger       := 0;    // edilaine - SOL 191668 / KTN 1820235
            //FieldByName('FLGSALFAMILIA').AsInteger     := 0;    // edilaine - SOL 191668 / KTN 1820235
            FieldByName('FLGTPRUBRICA').AsString       := 'P';
            FieldByName('FLGUSO').AsString             := 'P';
            FieldByName('NUMPRIORIDADE').AsInteger     := StrToInt(sNumPrioridade);
            Post;
         end;
      end; 

   end;

   // *******************************************************************************
   // ************ RUBRICAS DA CONTRIBUICAO SOBRE 13º
   // *******************************************************************************
   if dbchkCobraDecTerc.checked
   then begin
       sRubricaNormal       := Copy('[Normal] - '+Trim(dblkpcmbContribuicao.Text)   +' sobre 13º - '+Trim(dbedNome.Text)  ,1,130);
       sRubricaAtraso       := Copy('[Atrasada] - '+Trim(dblkpcmbContribuicao.Text)   +' sobre 13º - '+Trim(dbedNome.Text) ,1,130);
       sRubricaDevolucao    := Copy('[Devolvida] - '+Trim(dblkpcmbContribuicao.Text)+' sobre 13º - '+Trim(dbedNome.Text),1,130);

       // Verificar se rubricas já existem
       with qryAux do
       begin
          Close;
          SQL.Clear;
          SQL.Add(' SELECT IDPROVENTO FROM PROVDESC '+
                  ' WHERE  DESCRICAO = '''+sRubricaNormal+'''');
          Open;
          if not IsEmpty
          then piIdRubDecTercNormal := FieldByName('IDPROVENTO').AsInteger;

          Close;
          SQL.Clear;
          SQL.Add(' SELECT IDPROVENTO FROM PROVDESC '+
                  ' WHERE  DESCRICAO = '''+sRubricaAtraso+'''');
          Open;
          if not IsEmpty
          then piIdRubDecTercAtra := FieldByName('IDPROVENTO').AsInteger;

          Close;
          SQL.Clear;
          SQL.Add(' SELECT IDPROVENTO FROM PROVDESC '+
                  ' WHERE  DESCRICAO = '''+sRubricaDevolucao+'''');
          Open;
          if not IsEmpty
          then piIdRubDecTercDevolu := FieldByName('IDPROVENTO').AsInteger;
       end;

       if(piIdRubDecTercNormal > 0 ) or ( piIdRubDecTercAtra > 0 ) or ( piIdRubDecTercDevolu > 0 )
       then begin
          Result := True;
          Exit;
       end;


       // Gravar Rubrica Normal
       piIdRubDecTercNormal := LeUltRegistro(qryAux,'PROVDESC');
       with qryProvDesc do
       begin
          Insert;
          FieldByName('IDPROVENTO').AsInteger     := piIdRubDecTercNormal;
          FieldByName('DESCRICAO').AsString       := sRubricaNormal;
          FieldByName('FLGATRASODEVOL').AsString  := 'N';
          FieldByName('FLGCOMPOEREMTOTAL').AsInteger := 0;
          FieldByName('FLGCOMPOESALBENEF').AsInteger := 0;
          FieldByName('FLGCOMPOESALPART').AsInteger  := 0;
          FieldByName('FLGCONSOLIDA').AsInteger      := 0;
          FieldByName('FLGCONSTAFOLHA').AsInteger    := 0;
          //FieldByName('FLGDECIMOTERCEIRO').AsInteger := 0;     // edilaine - SOL 191668 / KTN 1820235
          FieldByName('FLGDESCONTO').AsInteger       := 1;
          FieldByName('FLGDESCPENSAO').AsInteger     := 0;
          FieldByName('FLGESPECIAL').AsInteger       := 0;
          //FieldByName('FLGFERIAS').AsInteger         := 0;     // edilaine - SOL 191668 / KTN 1820235
          FieldByName('FLGFGTS').AsInteger           := 0;
          FieldByName('FLGINCIDECONTRIB').AsInteger  := 0;
          FieldByName('FLGINCIDESALPART').AsInteger  := 0;
          FieldByName('FLGINSS').AsInteger           := 0;
          FieldByName('FLGINTERNO').AsInteger        := 1;
          FieldByName('FLGOBRIGAFAVOREC').AsInteger  := 0;
          FieldByName('FLGPRORATA').AsInteger        := 0;
          FieldByName('FLGRAIS').AsInteger           := 0;
          //FieldByName('FLGRESCISAO').AsInteger       := 0;     // edilaine - SOL 191668 / KTN 1820235
          //FieldByName('FLGSALFAMILIA').AsInteger     := 0;     // edilaine - SOL 191668 / KTN 1820235
          FieldByName('FLGTPRUBRICA').AsString       := 'P';
          FieldByName('FLGUSO').AsString             := 'P';
          FieldByName('NUMPRIORIDADE').AsInteger     := StrToInt(sNumPrioridade);
          Post;
       end;

       // Gravar Rubrica de Atraso
       piIdRubDecTercAtra := LeUltRegistro(qryAux,'PROVDESC');

       with qryProvDesc do
       begin
          Insert;
          FieldByName('IDPROVENTO').AsInteger     := piIdRubDecTercAtra;
          FieldByName('DESCRICAO').AsString       := sRubricaAtraso;
          FieldByName('FLGATRASODEVOL').AsString  := 'A';
          FieldByName('FLGCOMPOEREMTOTAL').AsInteger := 0;
          FieldByName('FLGCOMPOESALBENEF').AsInteger := 0;
          FieldByName('FLGCOMPOESALPART').AsInteger  := 0;
          FieldByName('FLGCONSOLIDA').AsInteger      := 0;
          FieldByName('FLGCONSTAFOLHA').AsInteger    := 0;
          //FieldByName('FLGDECIMOTERCEIRO').AsInteger := 0;     // edilaine - SOL 191668 / KTN 1820235
          FieldByName('FLGDESCONTO').AsInteger       := 1;
          FieldByName('FLGDESCPENSAO').AsInteger     := 0;
          FieldByName('FLGESPECIAL').AsInteger       := 0;
          //FieldByName('FLGFERIAS').AsInteger         := 0;     // edilaine - SOL 191668 / KTN 1820235
          FieldByName('FLGFGTS').AsInteger           := 0;
          FieldByName('FLGINCIDECONTRIB').AsInteger  := 0;
          FieldByName('FLGINCIDESALPART').AsInteger  := 0;
          FieldByName('FLGINSS').AsInteger           := 0;
          FieldByName('FLGINTERNO').AsInteger        := 1;
          FieldByName('FLGOBRIGAFAVOREC').AsInteger  := 0;
          FieldByName('FLGPRORATA').AsInteger        := 0;
          FieldByName('FLGRAIS').AsInteger           := 0;
          //FieldByName('FLGRESCISAO').AsInteger       := 0;     // edilaine - SOL 191668 / KTN 1820235
          //FieldByName('FLGSALFAMILIA').AsInteger     := 0;     // edilaine - SOL 191668 / KTN 1820235
          FieldByName('FLGTPRUBRICA').AsString       := 'P';
          FieldByName('FLGUSO').AsString             := 'P';
          FieldByName('NUMPRIORIDADE').AsInteger     := StrToInt(sNumPrioridade);
          Post;
       end;

       // Gravar rubrica de Devolucao
       piIdRubDecTercDevolu := LeUltRegistro(qryAux,'PROVDESC');

       with qryProvDesc do
       begin
          Insert;
          FieldByName('IDPROVENTO').AsInteger     := piIdRubDecTercDevolu;
          FieldByName('DESCRICAO').AsString       := sRubricaDevolucao;
          FieldByName('FLGATRASODEVOL').AsString  := 'D';
          FieldByName('FLGCOMPOEREMTOTAL').AsInteger := 0;
          FieldByName('FLGCOMPOESALBENEF').AsInteger := 0;
          FieldByName('FLGCOMPOESALPART').AsInteger  := 0;
          FieldByName('FLGCONSOLIDA').AsInteger      := 0;
          FieldByName('FLGCONSTAFOLHA').AsInteger    := 0;
          //FieldByName('FLGDECIMOTERCEIRO').AsInteger := 0;    // edilaine - SOL 191668 / KTN 1820235
          FieldByName('FLGDESCONTO').AsInteger       := 0;   
          FieldByName('FLGDESCPENSAO').AsInteger     := 0;
          FieldByName('FLGESPECIAL').AsInteger       := 0;
          //FieldByName('FLGFERIAS').AsInteger         := 0;    // edilaine - SOL 191668 / KTN 1820235
          FieldByName('FLGFGTS').AsInteger           := 0;
          FieldByName('FLGINCIDECONTRIB').AsInteger  := 0;
          FieldByName('FLGINCIDESALPART').AsInteger  := 0;
          FieldByName('FLGINSS').AsInteger           := 0;
          FieldByName('FLGINTERNO').AsInteger        := 1;
          FieldByName('FLGOBRIGAFAVOREC').AsInteger  := 0;
          FieldByName('FLGPRORATA').AsInteger        := 0;
          FieldByName('FLGRAIS').AsInteger           := 0;
          //FieldByName('FLGRESCISAO').AsInteger       := 0;    // edilaine - SOL 191668 / KTN 1820235
          //FieldByName('FLGSALFAMILIA').AsInteger     := 0;    // edilaine - SOL 191668 / KTN 1820235
          FieldByName('FLGTPRUBRICA').AsString       := 'P';
          FieldByName('FLGUSO').AsString             := 'P';
          FieldByName('NUMPRIORIDADE').AsInteger     := StrToInt(sNumPrioridade);
          Post;
       end;

      
      if qryDet.FieldByName('FLGINTERNO').AsString = 'AS'
      then begin
         // Gravar Rubrica de Cobrança sobre Adiantamento
         piIdRubAdiant13 := LeUltRegistro(qryAux,'PROVDESC');

         with qryProvDesc do
         begin
            Insert;
            FieldByName('IDPROVENTO').AsInteger     := piIdRubAdiant13;
            FieldByName('DESCRICAO').AsString       := Copy('[Desc.Adiant.]'+Trim(dblkpcmbContribuicao.Text)   +' sobre 13º - '+Trim(dbedNome.Text)  ,1,130);
            FieldByName('FLGATRASODEVOL').AsString  := 'N';
            FieldByName('FLGCOMPOEREMTOTAL').AsInteger := 0;
            FieldByName('FLGCOMPOESALBENEF').AsInteger := 0;
            FieldByName('FLGCOMPOESALPART').AsInteger  := 0;
            FieldByName('FLGCONSOLIDA').AsInteger      := 0;
            FieldByName('FLGCONSTAFOLHA').AsInteger    := 0;
            //FieldByName('FLGDECIMOTERCEIRO').AsInteger := 0;      // edilaine - SOL 191668 / KTN 1820235
            FieldByName('FLGDESCONTO').AsInteger       := 1;
            FieldByName('FLGDESCPENSAO').AsInteger     := 0;
            FieldByName('FLGESPECIAL').AsInteger       := 0;
            //FieldByName('FLGFERIAS').AsInteger         := 0;      // edilaine - SOL 191668 / KTN 1820235
            FieldByName('FLGFGTS').AsInteger           := 0;
            FieldByName('FLGINCIDECONTRIB').AsInteger  := 0;
            FieldByName('FLGINCIDESALPART').AsInteger  := 0;
            FieldByName('FLGINSS').AsInteger           := 0;
            FieldByName('FLGINTERNO').AsInteger        := 1;
            FieldByName('FLGOBRIGAFAVOREC').AsInteger  := 0;
            FieldByName('FLGPRORATA').AsInteger        := 0;
            FieldByName('FLGRAIS').AsInteger           := 0;
            //FieldByName('FLGRESCISAO').AsInteger       := 0;      // edilaine - SOL 191668 / KTN 1820235
            //FieldByName('FLGSALFAMILIA').AsInteger     := 0;      // edilaine - SOL 191668 / KTN 1820235
            FieldByName('FLGTPRUBRICA').AsString       := 'P';
            FieldByName('FLGUSO').AsString             := 'P';
            FieldByName('NUMPRIORIDADE').AsInteger     := StrToInt(sNumPrioridade);
            Post;
         end;

         // Gravar rubrica de Devolucao sobre Adiantamento
         piIdRubDevAdiant13 := LeUltRegistro(qryAux,'PROVDESC');

         with qryProvDesc do
         begin
            Insert;
            FieldByName('IDPROVENTO').AsInteger     := piIdRubDevAdiant13;
            FieldByName('DESCRICAO').AsString       := Copy('[Devol.Adiant.]'+Trim(dblkpcmbContribuicao.Text)   +' sobre 13º - '+Trim(dbedNome.Text)  ,1,130);
            FieldByName('FLGATRASODEVOL').AsString  := 'D';
            FieldByName('FLGCOMPOEREMTOTAL').AsInteger := 0;
            FieldByName('FLGCOMPOESALBENEF').AsInteger := 0;
            FieldByName('FLGCOMPOESALPART').AsInteger  := 0;
            FieldByName('FLGCONSOLIDA').AsInteger      := 0;
            FieldByName('FLGCONSTAFOLHA').AsInteger    := 0;
            //FieldByName('FLGDECIMOTERCEIRO').AsInteger := 0;     // edilaine - SOL 191668 / KTN 1820235
            FieldByName('FLGDESCONTO').AsInteger       := 0;   
            FieldByName('FLGDESCPENSAO').AsInteger     := 0;
            FieldByName('FLGESPECIAL').AsInteger       := 0;
            //FieldByName('FLGFERIAS').AsInteger         := 0;     // edilaine - SOL 191668 / KTN 1820235
            FieldByName('FLGFGTS').AsInteger           := 0;
            FieldByName('FLGINCIDECONTRIB').AsInteger  := 0;
            FieldByName('FLGINCIDESALPART').AsInteger  := 0;
            FieldByName('FLGINSS').AsInteger           := 0;
            FieldByName('FLGINTERNO').AsInteger        := 1;
            FieldByName('FLGOBRIGAFAVOREC').AsInteger  := 0;
            FieldByName('FLGPRORATA').AsInteger        := 0;
            FieldByName('FLGRAIS').AsInteger           := 0;
            //FieldByName('FLGRESCISAO').AsInteger       := 0;     // edilaine - SOL 191668 / KTN 1820235
            //FieldByName('FLGSALFAMILIA').AsInteger     := 0;     // edilaine - SOL 191668 / KTN 1820235
            FieldByName('FLGTPRUBRICA').AsString       := 'P';
            FieldByName('FLGUSO').AsString             := 'P';
            FieldByName('NUMPRIORIDADE').AsInteger     := StrToInt(sNumPrioridade);
            Post;
         end;
      end; // if = assistido

   end;

   Result := True;
end; 

function TfrmCadPlanPrevCS.GravaRubricasBenef (var piIdRubNormal,
                                                   piIdRubricaAtraso,
                                                   piIdRubDevolucao,
                                                   piIdRubRevisao,
                                                   piIdRubAbono,
                                                   piIdRubAntecAbono,
                                                   piIdRubDescAntecAbono,
                                                   piIdRubDevolAbono,
                                                   piIdRubAdiant,
                                                   piIdRubDevolAdiant,
                                                   piIdRubAdiant13,
                                                   piIdRubDevAdiant13   : longint ) : boolean;
var
   liIdPessoa     : longint;
   sRubricaNormal : string;
begin
   Result := False;

   sRubricaNormal := Copy('[Normal] - '+Trim(dblkpcmbBeneficio.Text)+' - '+Trim(dbedNome.Text),1,130);

   // Gravar Rubrica Normal
   piIdRubNormal := LeUltRegistro(qryAux,'PROVDESC');

   with qryProvDesc do
   begin
      Insert;
      FieldByName('IDPROVENTO').AsInteger     := piIdRubNormal;
      FieldByName('CODPROVDESC').AsString     := IntToStr(piIdRubNormal);
      FieldByName('DESCRICAO').AsString       := sRubricaNormal;
      FieldByName('FLGATRASODEVOL').AsString  := 'N';
      FieldByName('FLGCOMPOEREMTOTAL').AsInteger := 0;
      FieldByName('FLGCOMPOESALBENEF').AsInteger := 0;
      FieldByName('FLGCOMPOESALPART').AsInteger  := 0;
      FieldByName('FLGCONSOLIDA').AsInteger      := 0;
      FieldByName('FLGCONSTAFOLHA').AsInteger    := 0;
      //FieldByName('FLGDECIMOTERCEIRO').AsInteger := 0;     // edilaine - SOL 191668 / KTN 1820235
      FieldByName('FLGDESCONTO').AsInteger       := 0;
      FieldByName('FLGDESCPENSAO').AsInteger     := 0;


// Caso Beneficio seja de INSS e Pago
      If (dbchkBenefReferencia.Checked = True) And (DbChBxPagaInss.Checked = True) Then
        FieldByName('FLGESPECIAL').AsInteger  := 0
// Caso Beneficio seja de INSS e não Pago
      Else If (dbchkBenefReferencia.Checked = True) And (DbChBxPagaInss.Checked = False) Then
        FieldByName('FLGESPECIAL').AsInteger  := 1
// Caso Beneficio não seja de INSS e não Pago
      Else If (dbchkBenefReferencia.Checked = False) Then
        FieldByName('FLGESPECIAL').AsInteger  := 1;

      //FieldByName('FLGFERIAS').AsInteger         := 0;     // edilaine - SOL 191668 / KTN 1820235
      FieldByName('FLGFGTS').AsInteger           := 0;
      FieldByName('FLGINCIDECONTRIB').AsInteger  := 0;
      FieldByName('FLGINCIDESALPART').AsInteger  := 0;
      FieldByName('FLGINSS').AsInteger           := 0;
      FieldByName('FLGINTERNO').AsInteger        := 1;
      FieldByName('FLGIRRF').AsInteger           := 1;
      FieldByName('FLGOBRIGAFAVOREC').AsInteger  := 0;
      FieldByName('FLGPRORATA').AsInteger        := 0;
      FieldByName('FLGRAIS').AsInteger           := 0;
      //FieldByName('FLGRESCISAO').AsInteger       := 0;     // edilaine - SOL 191668 / KTN 1820235
      //FieldByName('FLGSALFAMILIA').AsInteger     := 0;     // edilaine - SOL 191668 / KTN 1820235
      FieldByName('FLGTPRUBRICA').AsString       := 'B';
      FieldByName('FLGUSO').AsString             := 'P';
      FieldByName('NUMPRIORIDADE').AsInteger     := 0;
      Post;
   end;

   if not prmflgMultiFundacao
   then liIdPessoa := iIdFundacao
   else liIdPessoa := qryFundacao.FieldByName('IdPessoa').AsInteger;

   with qryRubricaXPess do
   begin
      Insert;
      FieldByName('IdPessoa').AsInteger      := liIdPessoa;
      FieldByName('IdRubrica').AsInteger     := piIdRubNormal;
      FieldByName('CodProvDesc').AsString    := IntToStr(piIdRubNormal);
      FieldByName('DescrProvDesc').AsString  := sRubricaNormal;
      Post;
   end;


   // Gravar Rubrica de Atraso
   sRubricaNormal := Copy('[Atraso] - '+Trim(dblkpcmbBeneficio.Text)+' - '+Trim(dbedNome.Text),1,130);

   piIdRubricaAtraso := LeUltRegistro(qryAux,'PROVDESC');

   with qryProvDesc do
   begin
      Insert;
      FieldByName('IDPROVENTO').AsInteger     := piIdRubricaAtraso;
      FieldByName('CODPROVDESC').AsString     := IntToStr(piIdRubricaAtraso);
      FieldByName('DESCRICAO').AsString       := sRubricaNormal;
      FieldByName('FLGATRASODEVOL').AsString  := 'A';
      FieldByName('FLGCOMPOEREMTOTAL').AsInteger := 0;
      FieldByName('FLGCOMPOESALBENEF').AsInteger := 0;
      FieldByName('FLGCOMPOESALPART').AsInteger  := 0;
      FieldByName('FLGCONSOLIDA').AsInteger      := 0;
      FieldByName('FLGCONSTAFOLHA').AsInteger    := 0;
      //FieldByName('FLGDECIMOTERCEIRO').AsInteger := 0;     // edilaine - SOL 191668 / KTN 1820235
      FieldByName('FLGDESCONTO').AsInteger       := 0;
      FieldByName('FLGDESCPENSAO').AsInteger     := 0;

// Caso Beneficio seja de INSS e Pago
      If (dbchkBenefReferencia.Checked = True) And (DbChBxPagaInss.Checked = True) Then
        FieldByName('FLGESPECIAL').AsInteger  := 0
// Caso Beneficio seja de INSS e não Pago
      Else If (dbchkBenefReferencia.Checked = True) And (DbChBxPagaInss.Checked = False) Then
        FieldByName('FLGESPECIAL').AsInteger  := 1
// Caso Beneficio não seja de INSS e não Pago
      Else If (dbchkBenefReferencia.Checked = False) Then
        FieldByName('FLGESPECIAL').AsInteger  := 0;

      //FieldByName('FLGFERIAS').AsInteger         := 0;     // edilaine - SOL 191668 / KTN 1820235
      FieldByName('FLGFGTS').AsInteger           := 0;
      FieldByName('FLGINCIDECONTRIB').AsInteger  := 0;
      FieldByName('FLGINCIDESALPART').AsInteger  := 0;
      FieldByName('FLGINSS').AsInteger           := 0;
      FieldByName('FLGINTERNO').AsInteger        := 1;
      FieldByName('FLGIRRF').AsInteger           := 1;
      FieldByName('FLGOBRIGAFAVOREC').AsInteger  := 0;
      FieldByName('FLGPRORATA').AsInteger        := 0;
      FieldByName('FLGRAIS').AsInteger           := 0;
      //FieldByName('FLGRESCISAO').AsInteger       := 0;     // edilaine - SOL 191668 / KTN 1820235
      //FieldByName('FLGSALFAMILIA').AsInteger     := 0;     // edilaine - SOL 191668 / KTN 1820235
      FieldByName('FLGTPRUBRICA').AsString       := 'B';
      FieldByName('FLGUSO').AsString             := 'P';
      FieldByName('NUMPRIORIDADE').AsInteger     := 0;
      Post;
   end;

   if not prmflgMultiFundacao
   then liIdPessoa := iIdFundacao
   else liIdPessoa := qryFundacao.FieldByName('IdPessoa').AsInteger;

   with qryRubricaXPess do
   begin
      Insert;
      FieldByName('IdPessoa').AsInteger      := liIdPessoa;
      FieldByName('IdRubrica').AsInteger     := piIdRubricaAtraso;
      FieldByName('CodProvDesc').AsString    := IntToStr(piIdRubricaAtraso);
      FieldByName('DescrProvDesc').AsString  := sRubricaNormal;
      Post;
   end;

   // Gravar rubrica de Devolucao
   piIdRubDevolucao := LeUltRegistro(qryAux,'PROVDESC');
   sRubricaNormal := Copy('[Devolução] - '+Trim(dblkpcmbBeneficio.Text)+' - '+Trim(dbedNome.Text),1,130);

   with qryProvDesc do
   begin
      Insert;
      FieldByName('IDPROVENTO').AsInteger     := piIdRubDevolucao;
      FieldByName('CODPROVDESC').AsString     := IntToStr(piIdRubDevolucao);
      FieldByName('DESCRICAO').AsString       := sRubricaNormal;
      FieldByName('FLGATRASODEVOL').AsString  := 'D';
      FieldByName('FLGCOMPOEREMTOTAL').AsInteger := 0;
      FieldByName('FLGCOMPOESALBENEF').AsInteger := 0;
      FieldByName('FLGCOMPOESALPART').AsInteger  := 0;
      FieldByName('FLGCONSOLIDA').AsInteger      := 0;
      FieldByName('FLGCONSTAFOLHA').AsInteger    := 0;
      //FieldByName('FLGDECIMOTERCEIRO').AsInteger := 0;    // edilaine - SOL 191668 / KTN 1820235
      FieldByName('FLGDESCONTO').AsInteger       := 1;
      FieldByName('FLGDESCPENSAO').AsInteger     := 0;

// Caso Beneficio seja de INSS e Pago
      If (dbchkBenefReferencia.Checked = True) And (DbChBxPagaInss.Checked = True) Then
        FieldByName('FLGESPECIAL').AsInteger  := 0
// Caso Beneficio seja de INSS e não Pago
      Else If (dbchkBenefReferencia.Checked = True) And (DbChBxPagaInss.Checked = False) Then
        FieldByName('FLGESPECIAL').AsInteger  := 1
// Caso Beneficio não seja de INSS e não Pago
      Else If (dbchkBenefReferencia.Checked = False) Then
        FieldByName('FLGESPECIAL').AsInteger  := 0;

      //FieldByName('FLGFERIAS').AsInteger         := 0;   // edilaine - SOL 191668 / KTN 1820235
      FieldByName('FLGFGTS').AsInteger           := 0;
      FieldByName('FLGINCIDECONTRIB').AsInteger  := 0;
      FieldByName('FLGINCIDESALPART').AsInteger  := 0;
      FieldByName('FLGINSS').AsInteger           := 0;
      FieldByName('FLGINTERNO').AsInteger        := 1;
      FieldByName('FLGIRRF').AsInteger           := 1;
      FieldByName('FLGOBRIGAFAVOREC').AsInteger  := 0;
      FieldByName('FLGPRORATA').AsInteger        := 0;
      FieldByName('FLGRAIS').AsInteger           := 0;
      //FieldByName('FLGRESCISAO').AsInteger       := 0;   // edilaine - SOL 191668 / KTN 1820235
      //FieldByName('FLGSALFAMILIA').AsInteger     := 0;   // edilaine - SOL 191668 / KTN 1820235
      FieldByName('FLGTPRUBRICA').AsString       := 'B';
      FieldByName('FLGUSO').AsString             := 'P';
      FieldByName('NUMPRIORIDADE').AsInteger     := 0;
      Post;
   end;

   if not prmflgMultiFundacao
   then liIdPessoa := iIdFundacao
   else liIdPessoa := qryFundacao.FieldByName('IdPessoa').AsInteger;

   with qryRubricaXPess do
   begin
      Insert;
      FieldByName('IdPessoa').AsInteger      := liIdPessoa;
      FieldByName('IdRubrica').AsInteger     := piIdRubDevolucao;
      FieldByName('CodProvDesc').AsString    := IntToStr(piIdRubDevolucao);
      FieldByName('DescrProvDesc').AsString  := sRubricaNormal;
      Post;
   end;

   // Gravar rubrica de Revisao
   // Esta rubrica é um provento, pois será usada para pagar beneficios revistos
   // no caso de ter que cobrar um beneficio revisto, o sistema deverá usar
   // a rubrica de devolucao
   piIdRubRevisao := LeUltRegistro(qryAux,'PROVDESC');
   sRubricaNormal := Copy('[Revisão] - '+Trim(dblkpcmbBeneficio.Text)+' - '+Trim(dbedNome.Text),1,130);

   with qryProvDesc do
   begin
      Insert;
      FieldByName('IDPROVENTO').AsInteger     := piIdRubRevisao;
      FieldByName('CODPROVDESC').AsString     := IntToStr(piIdRubRevisao);
      FieldByName('DESCRICAO').AsString       := sRubricaNormal;
      FieldByName('FLGATRASODEVOL').AsString  := 'A';
      FieldByName('FLGCOMPOEREMTOTAL').AsInteger := 0;
      FieldByName('FLGCOMPOESALBENEF').AsInteger := 0;
      FieldByName('FLGCOMPOESALPART').AsInteger  := 0;
      FieldByName('FLGCONSOLIDA').AsInteger      := 0;
      FieldByName('FLGCONSTAFOLHA').AsInteger    := 0;
      //FieldByName('FLGDECIMOTERCEIRO').AsInteger := 0;    // edilaine - SOL 191668 / KTN 1820235
      FieldByName('FLGDESCONTO').AsInteger       := 0;
      FieldByName('FLGDESCPENSAO').AsInteger     := 0;

// Caso Beneficio seja de INSS e Pago
      If (dbchkBenefReferencia.Checked = True) And (DbChBxPagaInss.Checked = True) Then
        FieldByName('FLGESPECIAL').AsInteger  := 0
// Caso Beneficio seja de INSS e não Pago
      Else If (dbchkBenefReferencia.Checked = True) And (DbChBxPagaInss.Checked = False) Then
        FieldByName('FLGESPECIAL').AsInteger  := 1
// Caso Beneficio não seja de INSS e não Pago
      Else If (dbchkBenefReferencia.Checked = False) Then
        FieldByName('FLGESPECIAL').AsInteger  := 0;

      //FieldByName('FLGFERIAS').AsInteger         := 0;    // edilaine - SOL 191668 / KTN 1820235
      FieldByName('FLGFGTS').AsInteger           := 0;
      FieldByName('FLGINCIDECONTRIB').AsInteger  := 0;
      FieldByName('FLGINCIDESALPART').AsInteger  := 0;
      FieldByName('FLGINSS').AsInteger           := 0;
      FieldByName('FLGINTERNO').AsInteger        := 1;
      FieldByName('FLGIRRF').AsInteger           := 1;
      FieldByName('FLGOBRIGAFAVOREC').AsInteger  := 0;
      FieldByName('FLGPRORATA').AsInteger        := 0;
      FieldByName('FLGRAIS').AsInteger           := 0;
      //FieldByName('FLGRESCISAO').AsInteger       := 0;    // edilaine - SOL 191668 / KTN 1820235
      //FieldByName('FLGSALFAMILIA').AsInteger     := 0;    // edilaine - SOL 191668 / KTN 1820235
      FieldByName('FLGTPRUBRICA').AsString       := 'B';
      FieldByName('FLGUSO').AsString             := 'P';
      FieldByName('NUMPRIORIDADE').AsInteger     := 0;
      Post;
   end;

   if not prmflgMultiFundacao
   then liIdPessoa := iIdFundacao
   else liIdPessoa := qryFundacao.FieldByName('IdPessoa').AsInteger;

   with qryRubricaXPess do
   begin
      Insert;
      FieldByName('IdPessoa').AsInteger      := liIdPessoa;
      FieldByName('IdRubrica').AsInteger     := piIdRubRevisao;
      FieldByName('CodProvDesc').AsString    := IntToStr(piIdRubRevisao);
      FieldByName('DescrProvDesc').AsString  := sRubricaNormal;
      Post;
   end;

   
   // Gravar Rubrica de Adiantamento
   piIdRubAdiant := LeUltRegistro(qryAux,'PROVDESC');

   with qryProvDesc do
   begin
      Insert;
      FieldByName('IDPROVENTO').AsInteger     := piIdRubAdiant;
      FieldByName('CODPROVDESC').AsString     := IntToStr(piIdRubAdiant);
      FieldByName('DESCRICAO').AsString       := Copy('[Adiant.] - '+Trim(dblkpcmbBeneficio.Text)+' - '+Trim(dbedNome.Text),1,130);
      FieldByName('FLGATRASODEVOL').AsString  := 'N';
      FieldByName('FLGCOMPOEREMTOTAL').AsInteger := 0;
      FieldByName('FLGCOMPOESALBENEF').AsInteger := 0;
      FieldByName('FLGCOMPOESALPART').AsInteger  := 0;
      FieldByName('FLGCONSOLIDA').AsInteger      := 0;
      FieldByName('FLGCONSTAFOLHA').AsInteger    := 0;
      //FieldByName('FLGDECIMOTERCEIRO').AsInteger := 0;    // edilaine - SOL 191668 / KTN 1820235
      FieldByName('FLGDESCONTO').AsInteger       := 0;
      FieldByName('FLGDESCPENSAO').AsInteger     := 0;
      If (dbchkBenefReferencia.Checked = True) And (DbChBxPagaInss.Checked = True)
      Then FieldByName('FLGESPECIAL').AsInteger  := 0
      Else If (dbchkBenefReferencia.Checked = True) And (DbChBxPagaInss.Checked = False)
           Then FieldByName('FLGESPECIAL').AsInteger  := 1
           Else If (dbchkBenefReferencia.Checked = False)
                Then FieldByName('FLGESPECIAL').AsInteger  := 1;
      //FieldByName('FLGFERIAS').AsInteger         := 0;    // edilaine - SOL 191668 / KTN 1820235
      FieldByName('FLGFGTS').AsInteger           := 0;
      FieldByName('FLGINCIDECONTRIB').AsInteger  := 0;
      FieldByName('FLGINCIDESALPART').AsInteger  := 0;
      FieldByName('FLGINSS').AsInteger           := 0;
      FieldByName('FLGINTERNO').AsInteger        := 1;
      FieldByName('FLGIRRF').AsInteger           := 1;
      FieldByName('FLGOBRIGAFAVOREC').AsInteger  := 0;
      FieldByName('FLGPRORATA').AsInteger        := 0;
      FieldByName('FLGRAIS').AsInteger           := 0;
      //FieldByName('FLGRESCISAO').AsInteger       := 0;    // edilaine - SOL 191668 / KTN 1820235
      //FieldByName('FLGSALFAMILIA').AsInteger     := 0;    // edilaine - SOL 191668 / KTN 1820235
      FieldByName('FLGTPRUBRICA').AsString       := 'B';
      FieldByName('FLGUSO').AsString             := 'P';
      FieldByName('NUMPRIORIDADE').AsInteger     := 0;
      Post;
   end;

   if not prmflgMultiFundacao
   then liIdPessoa := iIdFundacao
   else liIdPessoa := qryFundacao.FieldByName('IdPessoa').AsInteger;

   with qryRubricaXPess do
   begin
      Insert;
      FieldByName('IdPessoa').AsInteger      := liIdPessoa;
      FieldByName('IdRubrica').AsInteger     := piIdRubAdiant;
      FieldByName('CodProvDesc').AsString    := IntToStr(piIdRubAdiant);
      FieldByName('DescrProvDesc').AsString  := Copy('[Adiant.] - '+Trim(dblkpcmbBeneficio.Text)+' - '+Trim(dbedNome.Text),1,130);
      Post;
   end;

   
   // Gravar rubrica de Devolucao de Adiantamento
   piIdRubDevolAdiant := LeUltRegistro(qryAux,'PROVDESC');

   with qryProvDesc do
   begin
      Insert;
      FieldByName('IDPROVENTO').AsInteger     := piIdRubDevolAdiant;
      FieldByName('CODPROVDESC').AsString     := IntToStr(piIdRubDevolAdiant);
      FieldByName('DESCRICAO').AsString       := Copy('[Devol.Adiant.] - '+Trim(dblkpcmbBeneficio.Text)+' - '+Trim(dbedNome.Text),1,130);
      FieldByName('FLGATRASODEVOL').AsString  := 'D';
      FieldByName('FLGCOMPOEREMTOTAL').AsInteger := 0;
      FieldByName('FLGCOMPOESALBENEF').AsInteger := 0;
      FieldByName('FLGCOMPOESALPART').AsInteger  := 0;
      FieldByName('FLGCONSOLIDA').AsInteger      := 0;
      FieldByName('FLGCONSTAFOLHA').AsInteger    := 0;
      //FieldByName('FLGDECIMOTERCEIRO').AsInteger := 0;    // edilaine - SOL 191668 / KTN 1820235
      FieldByName('FLGDESCONTO').AsInteger       := 1;
      FieldByName('FLGDESCPENSAO').AsInteger     := 0;

// Caso Beneficio seja de INSS e Pago
      If (dbchkBenefReferencia.Checked = True) And (DbChBxPagaInss.Checked = True) Then
        FieldByName('FLGESPECIAL').AsInteger  := 0
// Caso Beneficio seja de INSS e não Pago
      Else If (dbchkBenefReferencia.Checked = True) And (DbChBxPagaInss.Checked = False) Then
        FieldByName('FLGESPECIAL').AsInteger  := 1
// Caso Beneficio não seja de INSS e não Pago
      Else If (dbchkBenefReferencia.Checked = False) Then
        FieldByName('FLGESPECIAL').AsInteger  := 0;

      //FieldByName('FLGFERIAS').AsInteger         := 0;    // edilaine - SOL 191668 / KTN 1820235
      FieldByName('FLGFGTS').AsInteger           := 0;
      FieldByName('FLGINCIDECONTRIB').AsInteger  := 0;
      FieldByName('FLGINCIDESALPART').AsInteger  := 0;
      FieldByName('FLGINSS').AsInteger           := 0;
      FieldByName('FLGINTERNO').AsInteger        := 1;
      FieldByName('FLGIRRF').AsInteger           := 1;
      FieldByName('FLGOBRIGAFAVOREC').AsInteger  := 0;
      FieldByName('FLGPRORATA').AsInteger        := 0;
      FieldByName('FLGRAIS').AsInteger           := 0;
      //FieldByName('FLGRESCISAO').AsInteger       := 0;    // edilaine - SOL 191668 / KTN 1820235
      //FieldByName('FLGSALFAMILIA').AsInteger     := 0;    // edilaine - SOL 191668 / KTN 1820235
      FieldByName('FLGTPRUBRICA').AsString       := 'B';
      FieldByName('FLGUSO').AsString             := 'P';
      FieldByName('NUMPRIORIDADE').AsInteger     := 0;
      Post;
   end;

   if not prmflgMultiFundacao
   then liIdPessoa := iIdFundacao
   else liIdPessoa := qryFundacao.FieldByName('IdPessoa').AsInteger;

   with qryRubricaXPess do
   begin
      Insert;
      FieldByName('IdPessoa').AsInteger      := liIdPessoa;
      FieldByName('IdRubrica').AsInteger     := piIdRubDevolAdiant;
      FieldByName('CodProvDesc').AsString    := IntToStr(piIdRubDevolAdiant);
      FieldByName('DescrProvDesc').AsString  := Copy('[Devol.Adiant.] - '+Trim(dblkpcmbBeneficio.Text)+' - '+Trim(dbedNome.Text),1,130);
      Post;
   end;

   if dbchkPossuiAbono.Checked
   then begin
      // Gravar Rubrica Abono
      piIdRubAbono := LeUltRegistro(qryAux,'PROVDESC');
      sRubricaNormal := Copy('[Abono] - '+Trim(dblkpcmbBeneficio.Text)+' - '+Trim(dbedNome.Text),1,130);

      with qryProvDesc do
      begin
         Insert;
         FieldByName('IDPROVENTO').AsInteger     := piIdRubAbono;
         FieldByName('CODPROVDESC').AsString     := IntToStr(piIdRubAbono);
         FieldByName('DESCRICAO').AsString       := sRubricaNormal;
         FieldByName('FLGATRASODEVOL').AsString  := 'N';
         FieldByName('FLGCOMPOEREMTOTAL').AsInteger := 0;
         FieldByName('FLGCOMPOESALBENEF').AsInteger := 0;
         FieldByName('FLGCOMPOESALPART').AsInteger  := 0;
         FieldByName('FLGCONSOLIDA').AsInteger      := 0;
         FieldByName('FLGCONSTAFOLHA').AsInteger    := 0;
         //FieldByName('FLGDECIMOTERCEIRO').AsInteger := 1;    // edilaine - SOL 191668 / KTN 1820235
         FieldByName('FLGDESCONTO').AsInteger       := 0;
         FieldByName('FLGDESCPENSAO').AsInteger     := 0;

   // Caso Beneficio seja de INSS e Pago
         If (dbchkBenefReferencia.Checked = True) And (DbChBxPagaInss.Checked = True) Then
           FieldByName('FLGESPECIAL').AsInteger  := 0
   // Caso Beneficio seja de INSS e não Pago
         Else If (dbchkBenefReferencia.Checked = True) And (DbChBxPagaInss.Checked = False) Then
           FieldByName('FLGESPECIAL').AsInteger  := 1
   // Caso Beneficio não seja de INSS e não Pago
         Else If (dbchkBenefReferencia.Checked = False) Then
           FieldByName('FLGESPECIAL').AsInteger  := 0;

         //FieldByName('FLGFERIAS').AsInteger         := 0;    // edilaine - SOL 191668 / KTN 1820235
         FieldByName('FLGFGTS').AsInteger           := 0;
         FieldByName('FLGINCIDECONTRIB').AsInteger  := 0;
         FieldByName('FLGINCIDESALPART').AsInteger  := 0;
         FieldByName('FLGINSS').AsInteger           := 0;
         FieldByName('FLGINTERNO').AsInteger        := 1;
         FieldByName('FLGIRRF').AsInteger           := 1;
         FieldByName('FLGOBRIGAFAVOREC').AsInteger  := 0;
         FieldByName('FLGPRORATA').AsInteger        := 0;
         FieldByName('FLGRAIS').AsInteger           := 0;
         //FieldByName('FLGRESCISAO').AsInteger       := 0;     // edilaine - SOL 191668 / KTN 1820235
         //FieldByName('FLGSALFAMILIA').AsInteger     := 0;     // edilaine - SOL 191668 / KTN 1820235
         FieldByName('FLGTPRUBRICA').AsString       := 'B';
         FieldByName('FLGUSO').AsString             := 'P';
         FieldByName('NUMPRIORIDADE').AsInteger     := 0;
         Post;
      end;

      if not prmflgMultiFundacao
      then liIdPessoa := iIdFundacao
      else liIdPessoa := qryFundacao.FieldByName('IdPessoa').AsInteger;

      with qryRubricaXPess do
      begin
         Insert;
         FieldByName('IdPessoa').AsInteger      := liIdPessoa;
         FieldByName('IdRubrica').AsInteger     := piIdRubAbono;
         FieldByName('CodProvDesc').AsString    := IntToStr(piIdRubAbono);
         FieldByName('DescrProvDesc').AsString  := sRubricaNormal;
         Post;
      end;

      // INICIO - edilaine - SOL 191668 / KTN 1820235
      with qryRubxEvento do
      begin
         Insert;
         FieldByName('IdProvento').AsInteger  := piIdRubAbono;
         FieldByName('IdMotivo').AsInteger    := 8;
         Post;
      end;
      // FIM - edilaine - SOL 191668 / KTN 1820235

      // Gravar Rubrica Antecipacao de Abono
      piIdRubAntecAbono := LeUltRegistro(qryAux,'PROVDESC');
      sRubricaNormal := Copy('[Antecip. Abono] - '+Trim(dblkpcmbBeneficio.Text)+' - '+Trim(dbedNome.Text),1,130);

      with qryProvDesc do
      begin
         Insert;
         FieldByName('IDPROVENTO').AsInteger     := piIdRubAntecAbono;
         FieldByName('CODPROVDESC').AsString     := IntToStr(piIdRubAntecAbono);
         FieldByName('DESCRICAO').AsString       := sRubricaNormal;
         FieldByName('FLGATRASODEVOL').AsString  := 'N';
         FieldByName('FLGCOMPOEREMTOTAL').AsInteger := 0;
         FieldByName('FLGCOMPOESALBENEF').AsInteger := 0;
         FieldByName('FLGCOMPOESALPART').AsInteger  := 0;
         FieldByName('FLGCONSOLIDA').AsInteger      := 0;
         FieldByName('FLGCONSTAFOLHA').AsInteger    := 0;
         //FieldByName('FLGDECIMOTERCEIRO').AsInteger := 1;    // edilaine - SOL 191668 / KTN 1820235
         FieldByName('FLGDESCONTO').AsInteger       := 0;
         FieldByName('FLGDESCPENSAO').AsInteger     := 0;
   
   // Caso Beneficio seja de INSS e Pago
         If (dbchkBenefReferencia.Checked = True) And (DbChBxPagaInss.Checked = True) Then
           FieldByName('FLGESPECIAL').AsInteger  := 0
   // Caso Beneficio seja de INSS e não Pago
         Else If (dbchkBenefReferencia.Checked = True) And (DbChBxPagaInss.Checked = False) Then
           FieldByName('FLGESPECIAL').AsInteger  := 1
   // Caso Beneficio não seja de INSS e não Pago
         Else If (dbchkBenefReferencia.Checked = False) Then
           FieldByName('FLGESPECIAL').AsInteger  := 0;

         //FieldByName('FLGFERIAS').AsInteger         := 0;    // edilaine - SOL 191668 / KTN 1820235
         FieldByName('FLGFGTS').AsInteger           := 0;
         FieldByName('FLGINCIDECONTRIB').AsInteger  := 0;
         FieldByName('FLGINCIDESALPART').AsInteger  := 0;
         FieldByName('FLGINSS').AsInteger           := 0;
         FieldByName('FLGINTERNO').AsInteger        := 1;
         FieldByName('FLGIRRF').AsInteger           := 1;
         FieldByName('FLGOBRIGAFAVOREC').AsInteger  := 0;
         FieldByName('FLGPRORATA').AsInteger        := 0;
         FieldByName('FLGRAIS').AsInteger           := 0;
         //FieldByName('FLGRESCISAO').AsInteger       := 0;    // edilaine - SOL 191668 / KTN 1820235
         //FieldByName('FLGSALFAMILIA').AsInteger     := 0;    // edilaine - SOL 191668 / KTN 1820235
         FieldByName('FLGTPRUBRICA').AsString       := 'B';
         FieldByName('FLGUSO').AsString             := 'P';
         FieldByName('NUMPRIORIDADE').AsInteger     := 0;
         Post;
      end;

      if not prmflgMultiFundacao
      then liIdPessoa := iIdFundacao
      else liIdPessoa := qryFundacao.FieldByName('IdPessoa').AsInteger;

      with qryRubricaXPess do
      begin
         Insert;
         FieldByName('IdPessoa').AsInteger      := liIdPessoa;
         FieldByName('IdRubrica').AsInteger     := piIdRubAntecAbono;
         FieldByName('CodProvDesc').AsString    := IntToStr(piIdRubAntecAbono);
         FieldByName('DescrProvDesc').AsString  := sRubricaNormal;
         Post;
      end;

      // INICIO - edilaine - SOL 191668 / KTN 1820235
      with qryRubxEvento do
      begin
         Insert;
         FieldByName('IdProvento').AsInteger  := piIdRubAntecAbono;
         FieldByName('IdMotivo').AsInteger    := 8;
         Post;
      end;
      // FIM - edilaine - SOL 191668 / KTN 1820235


      // Gravar Rubrica Desconto de Antecipacao de Abono
      piIdRubDescAntecAbono := LeUltRegistro(qryAux,'PROVDESC');
      sRubricaNormal := Copy('[Desc. Ant. Abono] - '+Trim(dblkpcmbBeneficio.Text)+' - '+Trim(dbedNome.Text),1,130);

      with qryProvDesc do
      begin
         Insert;
         FieldByName('IDPROVENTO').AsInteger     := piIdRubDescAntecAbono;
         FieldByName('CODPROVDESC').AsString     := IntToStr(piIdRubDescAntecAbono);
         FieldByName('DESCRICAO').AsString       := sRubricaNormal;
         FieldByName('FLGATRASODEVOL').AsString  := 'N';
         FieldByName('FLGCOMPOEREMTOTAL').AsInteger := 0;
         FieldByName('FLGCOMPOESALBENEF').AsInteger := 0;
         FieldByName('FLGCOMPOESALPART').AsInteger  := 0;
         FieldByName('FLGCONSOLIDA').AsInteger      := 0;
         FieldByName('FLGCONSTAFOLHA').AsInteger    := 0;
         //FieldByName('FLGDECIMOTERCEIRO').AsInteger := 1;      // edilaine - SOL 191668 / KTN 1820235
         FieldByName('FLGDESCONTO').AsInteger       := 1;
         FieldByName('FLGDESCPENSAO').AsInteger     := 0;
   
   // Caso Beneficio seja de INSS e Pago
         If (dbchkBenefReferencia.Checked = True) And (DbChBxPagaInss.Checked = True) Then
           FieldByName('FLGESPECIAL').AsInteger  := 0
   // Caso Beneficio seja de INSS e não Pago
         Else If (dbchkBenefReferencia.Checked = True) And (DbChBxPagaInss.Checked = False) Then
           FieldByName('FLGESPECIAL').AsInteger  := 1
   // Caso Beneficio não seja de INSS e não Pago
         Else If (dbchkBenefReferencia.Checked = False) Then
           FieldByName('FLGESPECIAL').AsInteger  := 0;

         //FieldByName('FLGFERIAS').AsInteger         := 0;     // edilaine - SOL 191668 / KTN 1820235
         FieldByName('FLGFGTS').AsInteger           := 0;
         FieldByName('FLGINCIDECONTRIB').AsInteger  := 0;
         FieldByName('FLGINCIDESALPART').AsInteger  := 0;
         FieldByName('FLGINSS').AsInteger           := 0;
         FieldByName('FLGINTERNO').AsInteger        := 1;
         FieldByName('FLGIRRF').AsInteger           := 1;
         FieldByName('FLGOBRIGAFAVOREC').AsInteger  := 0;
         FieldByName('FLGPRORATA').AsInteger        := 0;
         FieldByName('FLGRAIS').AsInteger           := 0;
         //FieldByName('FLGRESCISAO').AsInteger       := 0;    // edilaine - SOL 191668 / KTN 1820235
         //FieldByName('FLGSALFAMILIA').AsInteger     := 0;    // edilaine - SOL 191668 / KTN 1820235
         FieldByName('FLGTPRUBRICA').AsString       := 'B';
         FieldByName('FLGUSO').AsString             := 'P';
         FieldByName('NUMPRIORIDADE').AsInteger     := 0;
         Post;
      end;

      if not prmflgMultiFundacao
      then liIdPessoa := iIdFundacao
      else liIdPessoa := qryFundacao.FieldByName('IdPessoa').AsInteger;

      with qryRubricaXPess do
      begin
         Insert;
         FieldByName('IdPessoa').AsInteger      := liIdPessoa;
         FieldByName('IdRubrica').AsInteger     := piIdRubDescAntecAbono;
         FieldByName('CodProvDesc').AsString    := IntToStr(piIdRubDescAntecAbono);
         FieldByName('DescrProvDesc').AsString  := sRubricaNormal;
         Post;
      end;

      // INICIO - edilaine - SOL 191668 / KTN 1820235
      with qryRubxEvento do
      begin
         Insert;
         FieldByName('IdProvento').AsInteger  := piIdRubDescAntecAbono;
         FieldByName('IdMotivo').AsInteger    := 8;
         Post;
      end;
      // FIM - edilaine - SOL 191668 / KTN 1820235


      // Gravar Rubrica Desconto de Abono
      piIdRubDevolAbono := LeUltRegistro(qryAux,'PROVDESC');
      sRubricaNormal := Copy('[Devol. Abono] - '+Trim(dblkpcmbBeneficio.Text)+' - '+Trim(dbedNome.Text),1,130);

      with qryProvDesc do
      begin
         Insert;
         FieldByName('IDPROVENTO').AsInteger     := piIdRubDevolAbono;
         FieldByName('CODPROVDESC').AsString     := IntToStr(piIdRubDevolAbono);
         FieldByName('DESCRICAO').AsString       := sRubricaNormal;
         FieldByName('FLGATRASODEVOL').AsString  := 'D';
         FieldByName('FLGCOMPOEREMTOTAL').AsInteger := 0;
         FieldByName('FLGCOMPOESALBENEF').AsInteger := 0;
         FieldByName('FLGCOMPOESALPART').AsInteger  := 0;
         FieldByName('FLGCONSOLIDA').AsInteger      := 0;
         FieldByName('FLGCONSTAFOLHA').AsInteger    := 0;
         //FieldByName('FLGDECIMOTERCEIRO').AsInteger := 1;      // edilaine - SOL 191668 / KTN 1820235
         FieldByName('FLGDESCONTO').AsInteger       := 1;
         FieldByName('FLGDESCPENSAO').AsInteger     := 0;
   
   // Caso Beneficio seja de INSS e Pago
         If (dbchkBenefReferencia.Checked = True) And (DbChBxPagaInss.Checked = True) Then
           FieldByName('FLGESPECIAL').AsInteger  := 0
   // Caso Beneficio seja de INSS e não Pago
         Else If (dbchkBenefReferencia.Checked = True) And (DbChBxPagaInss.Checked = False) Then
           FieldByName('FLGESPECIAL').AsInteger  := 1
   // Caso Beneficio não seja de INSS e não Pago
         Else If (dbchkBenefReferencia.Checked = False) Then
           FieldByName('FLGESPECIAL').AsInteger  := 0;

         //FieldByName('FLGFERIAS').AsInteger         := 0;     // edilaine - SOL 191668 / KTN 1820235
         FieldByName('FLGFGTS').AsInteger           := 0;
         FieldByName('FLGINCIDECONTRIB').AsInteger  := 0;
         FieldByName('FLGINCIDESALPART').AsInteger  := 0;
         FieldByName('FLGINSS').AsInteger           := 0;
         FieldByName('FLGINTERNO').AsInteger        := 1;
         FieldByName('FLGIRRF').AsInteger           := 1;
         FieldByName('FLGOBRIGAFAVOREC').AsInteger  := 0;
         FieldByName('FLGPRORATA').AsInteger        := 0;
         FieldByName('FLGRAIS').AsInteger           := 0;
         //FieldByName('FLGRESCISAO').AsInteger       := 0;     // edilaine - SOL 191668 / KTN 1820235
         //FieldByName('FLGSALFAMILIA').AsInteger     := 0;     // edilaine - SOL 191668 / KTN 1820235
         FieldByName('FLGTPRUBRICA').AsString       := 'B';
         FieldByName('FLGUSO').AsString             := 'P';
         FieldByName('NUMPRIORIDADE').AsInteger     := 0;
         Post;
      end;

      if not prmflgMultiFundacao
      then liIdPessoa := iIdFundacao
      else liIdPessoa := qryFundacao.FieldByName('IdPessoa').AsInteger;

      with qryRubricaXPess do
      begin
         Insert;
         FieldByName('IdPessoa').AsInteger      := liIdPessoa;
         FieldByName('IdRubrica').AsInteger     := piIdRubDevolAbono;
         FieldByName('CodProvDesc').AsString    := IntToStr(piIdRubDevolAbono);
         FieldByName('DescrProvDesc').AsString  := sRubricaNormal;
         Post;
      end;

      // INICIO - edilaine - SOL 191668 / KTN 1820235
      with qryRubxEvento do
      begin
         Insert;
         FieldByName('IdProvento').AsInteger  := piIdRubDevolAbono;
         FieldByName('IdMotivo').AsInteger    := 8;
         Post;
      end;
      // FIM - edilaine - SOL 191668 / KTN 1820235


      // Gravar Rubrica Abono
      piIdRubAdiant13 := LeUltRegistro(qryAux,'PROVDESC');

      with qryProvDesc do
      begin
         Insert;
         FieldByName('IDPROVENTO').AsInteger     := piIdRubAdiant13;
         FieldByName('CODPROVDESC').AsString     := IntToStr(piIdRubAdiant13);
         FieldByName('DESCRICAO').AsString       := Copy('[Abono Adiant.] - '+Trim(dblkpcmbBeneficio.Text)+' - '+Trim(dbedNome.Text),1,130);
         FieldByName('FLGATRASODEVOL').AsString  := 'N';
         FieldByName('FLGCOMPOEREMTOTAL').AsInteger := 0;
         FieldByName('FLGCOMPOESALBENEF').AsInteger := 0;
         FieldByName('FLGCOMPOESALPART').AsInteger  := 0;
         FieldByName('FLGCONSOLIDA').AsInteger      := 0;
         FieldByName('FLGCONSTAFOLHA').AsInteger    := 0;
         //FieldByName('FLGDECIMOTERCEIRO').AsInteger := 1;      // edilaine - SOL 191668 / KTN 1820235
         FieldByName('FLGDESCONTO').AsInteger       := 0;
         FieldByName('FLGDESCPENSAO').AsInteger     := 0;
   
   // Caso Beneficio seja de INSS e Pago
         If (dbchkBenefReferencia.Checked = True) And (DbChBxPagaInss.Checked = True) Then
           FieldByName('FLGESPECIAL').AsInteger  := 0
   // Caso Beneficio seja de INSS e não Pago
         Else If (dbchkBenefReferencia.Checked = True) And (DbChBxPagaInss.Checked = False) Then
           FieldByName('FLGESPECIAL').AsInteger  := 1
   // Caso Beneficio não seja de INSS e não Pago
         Else If (dbchkBenefReferencia.Checked = False) Then
           FieldByName('FLGESPECIAL').AsInteger  := 0;

         //FieldByName('FLGFERIAS').AsInteger         := 0;     // edilaine - SOL 191668 / KTN 1820235
         FieldByName('FLGFGTS').AsInteger           := 0;
         FieldByName('FLGINCIDECONTRIB').AsInteger  := 0;
         FieldByName('FLGINCIDESALPART').AsInteger  := 0;
         FieldByName('FLGINSS').AsInteger           := 0;
         FieldByName('FLGINTERNO').AsInteger        := 1;
         FieldByName('FLGIRRF').AsInteger           := 1;
         FieldByName('FLGOBRIGAFAVOREC').AsInteger  := 0;
         FieldByName('FLGPRORATA').AsInteger        := 0;
         FieldByName('FLGRAIS').AsInteger           := 0;
         //FieldByName('FLGRESCISAO').AsInteger       := 0;       // edilaine - SOL 191668 / KTN 1820235
         //FieldByName('FLGSALFAMILIA').AsInteger     := 0;       // edilaine - SOL 191668 / KTN 1820235
         FieldByName('FLGTPRUBRICA').AsString       := 'B';
         FieldByName('FLGUSO').AsString             := 'P';
         FieldByName('NUMPRIORIDADE').AsInteger     := 0;
         Post;
      end;

      if not prmflgMultiFundacao
      then liIdPessoa := iIdFundacao
      else liIdPessoa := qryFundacao.FieldByName('IdPessoa').AsInteger;

      with qryRubricaXPess do
      begin
         Insert;
         FieldByName('IdPessoa').AsInteger      := liIdPessoa;
         FieldByName('IdRubrica').AsInteger     := piIdRubAdiant13;
         FieldByName('CodProvDesc').AsString    := IntToStr(piIdRubAdiant13);
         FieldByName('DescrProvDesc').AsString  := Copy('[Abono Adiant.] - '+Trim(dblkpcmbBeneficio.Text)+' - '+Trim(dbedNome.Text),1,130);
         Post;
      end;

      // INICIO - edilaine - SOL 191668 / KTN 1820235
      with qryRubxEvento do
      begin
         Insert;
         FieldByName('IdProvento').AsInteger  := piIdRubAdiant13;
         FieldByName('IdMotivo').AsInteger    := 8;
         Post;
      end;
      // FIM - edilaine - SOL 191668 / KTN 1820235


      // Gravar Rubrica Desconto de Abono de Adiantamento
      piIdRubDevAdiant13 := LeUltRegistro(qryAux,'PROVDESC');


      with qryProvDesc do
      begin
         Insert;
         FieldByName('IDPROVENTO').AsInteger     := piIdRubDevAdiant13;
         FieldByName('CODPROVDESC').AsString     := IntToStr(piIdRubDevAdiant13);
         FieldByName('DESCRICAO').AsString       := Copy('[Devol. Abono Adiant.] - '+Trim(dblkpcmbBeneficio.Text)+' - '+Trim(dbedNome.Text),1,130);
         FieldByName('FLGATRASODEVOL').AsString  := 'D';
         FieldByName('FLGCOMPOEREMTOTAL').AsInteger := 0;
         FieldByName('FLGCOMPOESALBENEF').AsInteger := 0;
         FieldByName('FLGCOMPOESALPART').AsInteger  := 0;
         FieldByName('FLGCONSOLIDA').AsInteger      := 0;
         FieldByName('FLGCONSTAFOLHA').AsInteger    := 0;
         //FieldByName('FLGDECIMOTERCEIRO').AsInteger := 1;       // edilaine - SOL 191668 / KTN 1820235
         FieldByName('FLGDESCONTO').AsInteger       := 1;
         FieldByName('FLGDESCPENSAO').AsInteger     := 0;
   
   // Caso Beneficio seja de INSS e Pago
         If (dbchkBenefReferencia.Checked = True) And (DbChBxPagaInss.Checked = True) Then
           FieldByName('FLGESPECIAL').AsInteger  := 0
   // Caso Beneficio seja de INSS e não Pago
         Else If (dbchkBenefReferencia.Checked = True) And (DbChBxPagaInss.Checked = False) Then
           FieldByName('FLGESPECIAL').AsInteger  := 1
   // Caso Beneficio não seja de INSS e não Pago
         Else If (dbchkBenefReferencia.Checked = False) Then
           FieldByName('FLGESPECIAL').AsInteger  := 0;

         //FieldByName('FLGFERIAS').AsInteger         := 0;       // edilaine - SOL 191668 / KTN 1820235
         FieldByName('FLGFGTS').AsInteger           := 0;
         FieldByName('FLGINCIDECONTRIB').AsInteger  := 0;
         FieldByName('FLGINCIDESALPART').AsInteger  := 0;
         FieldByName('FLGINSS').AsInteger           := 0;
         FieldByName('FLGINTERNO').AsInteger        := 1;
         FieldByName('FLGIRRF').AsInteger           := 1;
         FieldByName('FLGOBRIGAFAVOREC').AsInteger  := 0;
         FieldByName('FLGPRORATA').AsInteger        := 0;
         FieldByName('FLGRAIS').AsInteger           := 0;
         //FieldByName('FLGRESCISAO').AsInteger       := 0;      // edilaine - SOL 191668 / KTN 1820235
         //FieldByName('FLGSALFAMILIA').AsInteger     := 0;      // edilaine - SOL 191668 / KTN 1820235
         FieldByName('FLGTPRUBRICA').AsString       := 'B';
         FieldByName('FLGUSO').AsString             := 'P';
         FieldByName('NUMPRIORIDADE').AsInteger     := 0;
         Post;
      end;

      if not prmflgMultiFundacao
      then liIdPessoa := iIdFundacao
      else liIdPessoa := qryFundacao.FieldByName('IdPessoa').AsInteger;

      with qryRubricaXPess do
      begin
         Insert;
         FieldByName('IdPessoa').AsInteger      := liIdPessoa;
         FieldByName('IdRubrica').AsInteger     := piIdRubDevAdiant13;
         FieldByName('CodProvDesc').AsString    := IntToStr(piIdRubDevAdiant13);
         FieldByName('DescrProvDesc').AsString  := Copy('[Devol. Abono Adiant.] - '+Trim(dblkpcmbBeneficio.Text)+' - '+Trim(dbedNome.Text),1,130);
         Post;
      end;

      // INICIO - edilaine - SOL 191668 / KTN 1820235
      with qryRubxEvento do
      begin
         Insert;
         FieldByName('IdProvento').AsInteger  := piIdRubDevAdiant13;
         FieldByName('IdMotivo').AsInteger    := 8;
         Post;
      end;
      // FIM - edilaine - SOL 191668 / KTN 1820235

   end;

   Result := True;
end; //GravaRubricasBenef

procedure TfrmCadPlanPrevCS.CmeCadastroFind(Sender: TObject);
var iIdPlanoPrev : longint;
begin
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '')
  then begin
     iIdPlanoPrev := StrToInt(MontaSelect.ValoresChave[0]);
     qry.Close;
     qry.ParamByName('IdPlanoPrev').Value  := iIdPlanoPrev;
     qry.Open;

     qryDet.Close;
     qryDet.ParamByName('IdPlanoPrev').Value  := iIdPlanoPrev;
     qryDet.Open;

     qryBenef.Close;
     qryBenef.ParamByName('IdPlanoPrev').Value  := iIdPlanoPrev;
     qryBenef.Open;

     
     qryBenefPPatro.Close;
     qryBenefPPatro.ParamByName('PIDPLANOPREV').AsInteger := iIdPlanoPrev;
     qryBenefPPatro.Open;

     qryContPPatro.Close;
     qryContPPatro.ParamByName('PIDPLANOPREV').AsInteger  := iIdPlanoPrev;
     qryContPPatro.Open;

     //edilaine - SIG24483: inicio
     qryIsentoIRAcJud.close;
     qryIsentoIRAcJud.ParamByName('PIDPLANOPREV').AsInteger  := iIdPlanoPrev;
     qryIsentoIRAcJud.Open;
     //edilaine - SIG24483: fim

  end;
end;

function  TfrmCadPlanPrevCS.MoveContribuicao(piIdPlanoPrev, piIdContribuicao, piIdxPagadorAntes,
                               piIdxPagadorDepois : integer) : boolean;
var sAnoMesHoje : string;
begin
   Result := False;
   // Se o indice era 0 ou 1 e foi para 2
   // mover da CONTRIBPREVPARTP para CONTRIBPREVPATRO
   if (iIdxPagadorAntes in [0,1]) and (iIdxPagadorDepois = 2)
   then begin
      if MsgDlg(' Esta contribuição foi alterada para "Exclusiva da Patrocinadora". '+
                ' Para isto ela deverá ser desassociada dos participantes e '+
                ' associada às patrocinadoras que possuem este plano. Confirma ? ',
                'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrNo
      then Exit;

      // Verificar se alguma contribuicao, das que serão movidas, já foi preparada
      sAnoMesHoje := Copy(DateToStr(date), 7,4)+'/'+Copy(DateToStr(date),4,2);
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' SELECT COUNT(IDPESSOA) AS QTDECONTRIB FROM CONTRIBPREVPARTP '+
                     ' WHERE IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+' AND '+
                     '       IDCONTRIBUICAO = '+IntToStr(piIdContribuicao)+' AND '+
                     '       ULTMESPREPARO >= '''+sAnoMesHoje+'''');
      try
         qryAux.Open;
      except
         MsgDlg(' Erro na verificação dos lotes preparados no mês : '+sAnoMesHoje,'Erro', mtError, [mbOk, mbHelp], 0);
         qryAux.Close;
         TiraSQL(qryAux);
         Exit;
      end;

      if (not qryAux.IsEmpty) and
         (qryAux.FieldByName('QtdeContrib').AsInteger > 0)
      then begin
         MsgDlg(' Esta contribuição já foi preparada este mês. '+
                ' Utilize a função "Desfazer Preparo" antes de alterar a contribuição. ' ,'Erro', mtError, [mbOk, mbHelp], 0);
         qryAux.Close;
         TiraSQL(qryAux);
         Exit;
      end;

      // INSERIR EM CONTRIBPREVPATRO
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' INSERT INTO CONTRIBPREVPATRO(IDPESSOA,IDPLANOPREV,IDCONTRIBUICAO,DATAINICIO,FLGCOBRA, '+
                     '             IDTPPERIODICIDADE,QTDEPARCELAS) '+
                     ' SELECT PP.IDPESSJUR,CP.IDPLANOPREV,CP.IDCONTRIBUICAO,SYSDATE,1,C.IDTPPERIODICIDADE,C.QTDEPARCELAS '+
                     ' FROM PLANPREVPATRO PP, CONTRIBUICAO C, CONTPREV CP '+
                     ' WHERE PP.IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+' AND '+
                     '       C.IDCONTRIBUICAO = '+IntToStr(piIdContribuicao)+' AND '+
                     '       CP.IDPLANOPREV = PP.IDPLANOPREV AND '+
                     '       CP.IDCONTRIBUICAO = C.IDCONTRIBUICAO ');
      try
         qryAux.ExecSQL;
      except
         on E:EDBEngineError do
         begin
            MostrarErro(E);
            Exit;
         end;
      end;

      // APAGAR DA CONTRIBPREVPARTP
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' DELETE FROM CONTRIBPREVPARTP '+
                     ' WHERE IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+' AND '+
                     '       IDCONTRIBUICAO = '+IntToStr(piIdContribuicao));
      try
         qryAux.ExecSQL;
      except
         on E:EDBEngineError do
         begin
            MostrarErro(E);
            Exit;
         end;
      end;
   end 
   else begin
      // Se o indice era 2 e foi para 0 ou 1
      // mover da CONTRIBPREVPATRO para CONTRIBPREVPARTP
      if (iIdxPagadorAntes  = 2) and (iIdxPagadorDepois in [0,1])
      then begin
         if MsgDlg(' Esta contribuição deixará de ser "Exclusiva da Patrocinadora". '+
                   ' Para isto ela deverá ser desassociada da patrocinadora  e '+
                   ' associada aos participantes deste plano. Confirma ? ',
                   'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrNo
         then Exit;

         // Verificar se alguma contribuicao, das que serão movidas, já foi preparada
         sAnoMesHoje := Copy(DateToStr(date), 7,4)+'/'+Copy(DateToStr(date),4,2);
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' SELECT COUNT(IDPESSOA) AS QTDECONTRIB FROM CONTRIBPREVPATRO '+
                        ' WHERE IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+' AND '+
                        '       IDCONTRIBUICAO = '+IntToStr(piIdContribuicao)+' AND '+
                        '       ULTMESPREPARO >= '''+sAnoMesHoje+'''' );
         try
            qryAux.Open;
         except
            MsgDlg(' Erro na verificação dos lotes preparados no mês : '+sAnoMesHoje,'Erro', mtError, [mbOk, mbHelp], 0);
            qryAux.Close;
            TiraSQL(qryAux);
            Exit;
         end;

         if (not qryAux.IsEmpty) and
            (qryAux.FieldByName('QtdeContrib').AsInteger > 0)
         then begin
            MsgDlg(' Esta contribuição já foi preparada este mês. '+
                   ' Utilize a função "Desfazer Preparo" antes de alterar a contribuição. ' ,'Erro', mtError, [mbOk, mbHelp], 0);
            qryAux.Close;
            TiraSQL(qryAux);
            Exit;
         end;

         // INSERIR EM CONTRIBPREVPATRO
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' INSERT INTO CONTRIBPREVPARTP(IDPESSJUR,IDPESSOA,SEQPROPOSTA,IDPLANOPREV,IDCONTRIBUICAO,DATAINICIO,FLGCOBRA, '+
                        '             IDTPPERIODICIDADE,QTDEPARCELAS) '+
                        ' SELECT PP.IDPESSJUR,PART.IDPESSOA,PART.SEQPROPOSTA,CP.IDPLANOPREV,CP.IDCONTRIBUICAO,SYSDATE,1,C.IDTPPERIODICIDADE,C.QTDEPARCELAS '+
                        ' FROM PLANPREVPATRO PP, CONTRIBUICAO C, CONTPREV CP, PARTPREVPLAN PART '+
                        ' WHERE PP.IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+' AND '+
                        '       C.IDCONTRIBUICAO = '+IntToStr(piIdContribuicao)+' AND '+
                        '       CP.IDPLANOPREV = PP.IDPLANOPREV AND '+
                        '       CP.IDCONTRIBUICAO = C.IDCONTRIBUICAO AND '+
                        '       PART.IDPESSJUR = PP.IDPESSJUR AND '+
                        '       PART.IDPLANOPREV = PP.IDPLANOPREV ');

         try
            qryAux.ExecSQL;
         except
            on E:EDBEngineError do
            begin
               MostrarErro(E);
               Exit;
            end;
         end;

         // APAGAR DA CONTRIBPREVPATRO
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' DELETE FROM CONTRIBPREVPATRO   '+
                        ' WHERE IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+' AND '+
                        '       IDCONTRIBUICAO = '+IntToStr(piIdContribuicao));
         try
            qryAux.ExecSQL;
         except
            on E:EDBEngineError do
            begin
               MostrarErro(E);
               Exit;
            end;
         end;
      end; // then - if (iIdxPagadorAntes  = 2) and (iIdxPagadorDepois in [0,1])
   end;// else - if (iIdxPagadorAntes in [0,1]) and (iIdxPagadorDepois = 2)
   Result := True;
end;


procedure TfrmCadPlanPrevCS.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  qry.FieldByName('IdPlanoPrev').AsInteger    := LeUltRegistro(qryAux,'PLANPREV');
  qry.FieldByName('flgAutoNumInsc').AsInteger := 0;
  qry.FieldByName('FlgReservaUltCot').AsInteger := 0;
  edPaiDetalhe.Text := '';
  dbchkAutoNumInsc.Checked   := False;
  dbchkRecalcContrib.Checked := False;
  dbchkCalculaLimite.Checked := False;
  dbchkUsaEvolFuncPlano.Checked := False;
  pnlInscricao.Visible       := False;
 
  dbrdgrpflgreservaultcot.ItemIndex := 0;

  qryDet.Close;
  qryDet.ParamByName('IdPlanoPrev').Value  := qry.FieldByName('IdPlanoPrev').AsInteger;
  qryDet.Open;

  qryBenef.Close;
  qryBenef.ParamByName('IdPlanoPrev').Value  := qry.FieldByName('IdPlanoPrev').AsInteger;
  qryBenef.Open;

end; 

procedure TfrmCadPlanPrevCS.CmeCadastroConfirma(Sender: TObject);
Var
 qryVerPrev,
 qryInsPatro   : TwwQuery;
 sSql           : String;

 sDataInicio,
 sDataFinal,
 sQtdeParcelas,
 sPeriodicidade : string;
begin
   inherited;
   try
      // inicio - edilaine - SOL 191668 / KTN 1820235
      if OperacaoDetalhe <> opApagar
      //then AplicaAlteracoes([qryProvDesc,qryRubricaxPess,qryDet, qryBenef, qryBenefPPatro, qryContPPatro])
      //else AplicaAlteracoes([qryContPPatro, qryBenefPPatro, qryDet, qryBenef, qryRubricaxPess, qryProvDesc]);
      then AplicaAlteracoes([qryProvDesc,qryRubricaxPess,qryDet, qryBenef, qryBenefPPatro, qryContPPatro, qryRubxEvento, qryIsentoIRAcJud])       //edilaine - SIG24483
      else AplicaAlteracoes([qryContPPatro, qryBenefPPatro, qryDet, qryBenef, qryRubricaxPess, qryRubxEvento, qryProvDesc, qryIsentoIRAcJud]);    //edilaine - SIG24483
     // fim - edilaine - SOL 191668 / KTN 1820235
   except
      raise;
   end;

   
   if OperacaoDetalhe <> opApagar then      //TAES - SIG91251
   begin

     // Verifica se foi inserido uma nova contribuição/benefício após a associação

     // Início Contribuição
     qryVerPrev               := TwwQuery.Create(Self);
     qryInsPatro              := TwwQuery.Create(Self);
     qryVerPrev.DatabaseName  := qry.DatabaseName;
     qryInsPatro.DatabaseName := qry.DatabaseName;

     sSql := 'SELECT PP.IDPESSJUR,                                   '+ vQL +
             '       CP.IDPLANOPREV,                                 '+ vQL +
             '       CP.IDCONTRIBUICAO                               '+ vQL +
             'FROM CONTPREV      CP,                                 '+ vQL +
             '     PLANPREVPATRO PP                                  '+ vQL +
             'WHERE (CP.IDPLANOPREV = PP.IDPLANOPREV)                '+ vQL +

             ' MINUS                                                  '+ vQL +
             ' SELECT DISTINCT IDPESSJUR, IDPLANOPREV, IDCONTRIBUICAO '+ vQL +
             ' FROM CONTPLANPATRO ';


     qryVerPrev.Close;
     qryVerPrev.SQL.Clear;
     qryVerPrev.SQL.Add(sSql);
     qryVerPrev.Open;

     If qryVerPrev.RecordCount > 0 Then
      Begin
       While not qryVerPrev.Eof do
        Begin
         sSql := 'INSERT INTO CONTPLANPATRO '+ vQL +
                 ' (IDPESSJUR,              '+ vQL +
                 '  IDPLANOPREV,            '+ vQL +
                 '  IDCONTRIBUICAO)         '+ vQL +
                 'VALUES                    '+ vQL +
                 ' (' + qryVerPrev.FieldByName('IDPESSJUR').AsString      + ',' + vQL +
                 '  ' + qryVerPrev.FieldByName('IDPLANOPREV').AsString    + ',' + vQL +
                 '  ' + qryVerPrev.FieldByName('IDCONTRIBUICAO').AsString + ')';

         dtmBaseDados.dbBaseDados.StartTransaction;

         Try

          qryInsPatro.Close;
          qryInsPatro.SQL.Clear;
          qryInsPatro.SQL.Add(sSql);
          qryInsPatro.ExecSQL;

          dtmBaseDados.dbBaseDados.Commit;

         Except

          MsgDlg('Erro na atualização das tabelas de contribuição da patrocinadora.',
                 'Erro', mtError, [mbOk, mbHelp], 0);
          dtmBaseDados.dbBaseDados.Rollback;
          Exit;

         End;

        qryVerPrev.Next;
       End;
     End;

     // Início Benefício

     sSql := 'SELECT PP.IDPESSJUR,                               '+ vQL +
             '       BP.IDPLANOPREV,                             '+ vQL +
             '       BP.IDBENEFICIO                              '+ vQL +
             'FROM BENEFPLANPREV    BP,                          '+ vQL +
             '     PLANPREVPATRO    PP                           '+ vQL +
             'WHERE (BP.IDPLANOPREV = PP.IDPLANOPREV)            '+ vQL +

             'MINUS                                              '+ vQL +
             'SELECT IDPESSJUR, IDPLANOPREV, IDBENEFICIO         '+ vQL +
             'FROM BENEFPLANPATRO ';


     qryVerPrev.Close;
     qryVerPrev.SQL.Clear;
     qryVerPrev.SQL.Add(sSql);
     qryVerPrev.Open;

     If qryVerPrev.RecordCount > 0 Then
      Begin
       While not qryVerPrev.Eof do
        Begin

         sSql := 'INSERT INTO BENEFPLANPATRO '+ vQL +
                 ' (IDPESSJUR,               '+ vQL +
                 '  IDPLANOPREV,             '+ vQL +
                 '  IDBENEFICIO)             '+ vQL +
                 'VALUES                     '+ vQL +
                 ' (' + qryVerPrev.FieldByName('IDPESSJUR').AsString      + ',' + vQL +
                 '  ' + qryVerPrev.FieldByName('IDPLANOPREV').AsString    + ',' + vQL +
                 '  ' + qryVerPrev.FieldByName('IDBENEFICIO').AsString + ')';

         dtmBaseDados.dbBaseDados.StartTransaction;

         Try

          qryInsPatro.Close;
          qryInsPatro.SQL.Clear;
          qryInsPatro.SQL.Add(sSql);
          qryInsPatro.ExecSQL;

          dtmBaseDados.dbBaseDados.Commit;

         Except

          MsgDlg('Erro na atualização das tabelas de benefícios da patrocinadora.',
                 'Erro', mtError, [mbOk, mbHelp], 0);
          dtmBaseDados.dbBaseDados.Rollback;
          Exit;

         End;

         qryVerPrev.Next;

        End;
      End;
   end;    //TAES - SIG91251


    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

end; 

procedure TfrmCadPlanPrevCS.CmeDetalheConfirma(Sender: TObject);
begin
   if not VerificaDetalhe then Exit;

   inherited;

   if pgCtrlDetalhe.ActivePage = tbsDet
   then begin
      bTelaOpcoesContrib := False;
   end;
end; 

procedure TfrmCadPlanPrevCS.CmeDetalheInsert(Sender: TObject);
begin
   inherited;
   if pgctrlDetalhe.ActivePage = tbsDet
   then begin

      bMudouAltDeBaixa := false;                       //edilaine - SIG36752

      sbtnOpcoes.Visible := False;
      qryDet.FieldByName('IdPlanoPrev').AsInteger      := qry.FieldbyName('IdPlanoPrev').AsInteger;

      qryDet.FieldByName('flgPagador').AsString        := 'C';

      qryDet.FieldByName('FlgNaoExigeRec').AsInteger   := 0;
      qryDet.FieldByName('FLGACEITAOPCAO').AsInteger   := 0;
      qryDet.FieldByName('FLGCOBRADECTERC').AsInteger  := 0;
      qryDet.FieldByName('FLGCONTINGENCIA').AsInteger  := 0; 
      qryDet.FieldByName('FLGDESCFOLHAULT').AsInteger  := 0; 

      dbrgrpPagador.ItemIndex         := 0;
      dbchkNaoExigeRec.Checked        := False;
      dbchkAceitarOpcoes.Checked      := False;
      dbchkFlgDescFolha.Checked       := False;
      dbchkCobraDecTerc.Checked       := False;
      dbrgrpUltimaCobranca.ItemIndex  := 2;
      cmbFinalidade.ItemIndex         := 0;
      pgctrlContPrev.ActivePage       := tbsContPrev1;
   end
   //edilaine - SIG24483: inicio
   else if pgctrlDetalhe.ActivePage = tsIsencaoiRAcJud then
   begin

     qryIsentoIRAcJud.FieldByName('IdPlanoPrev').AsInteger  := qry.FieldbyName('IdPlanoPrev').AsInteger;

   end
   //edilaine - SIG24483 : fim
   else begin 

      qryBenef.FieldByName('IdPlanoPrev').AsInteger      := qry.FieldbyName('IdPlanoPrev').AsInteger;
      qryBenef.FieldByName('TPMODALIDADE').AsString      := 'BD';
      qryBenef.FieldByName('FLGREFERENCIA').AsInteger    := 0;
      qryBenef.FieldByName('FLGPOSSUIABONO').AsInteger   := 0;
      qryBenef.FieldByName('FLGRECALCULAFIM').AsInteger  := 0;
      qryBenef.FieldByName('FLGCALCTODOMES').AsInteger   := 0;
      qryBenef.FieldByName('FLGOBRIGANPROC').AsInteger   := 0;
      qryBenef.FieldByName('FLGPAGAINTEG').AsInteger     := 0;
      qryBenef.FieldByName('FLGQUITAPREVIDEN').AsInteger := 0;
      qryBenef.FieldByName('FLGQUITAEMPRESTI').AsInteger := 0;
      qryBenef.FieldByName('FLGQUITAASSISTEN').AsInteger := 0;
      qryBenef.FieldByName('FLGACEITAOPCAO').AsInteger   := 0;
      qryBenef.FieldByName('FLGACEITAOPCAO').AsInteger   := 0;
      qryBenef.FieldByName('FLGBENEFINF').AsInteger      := 1;
      dbgrpBenefInf.ItemIndex                            := 0;

      dbrgrpModalidade.ItemIndex   := 0;
      dbchkBenefReferencia.Checked := False;
      dbchkPossuiAbono.Checked     := False;
      dbchkredividir.Checked       := False;
      dbchkRecalcBenef.Checked     := False;
      dbchkFlgObrigaNProc.Checked  := False;
      dbchkPagaInteg.Checked       := False;
      dbchkQuitPrev.Checked        := False;
      dbchkQuitEmp.Checked         := False;
      dbchkQuitAssist.Checked      := False;
      dbchkAceitarOpBenef.Checked  := False;
      dbchkAceitarOpTextoBenef.Checked  := False;
      sbtnOpcoesBenef.Visible      := False;
      sbtnOpcoesTextoBenef.Visible      := False;
      pgctrlBenef.ActivePage       := tbsBenefPlano1;

      qryBenef.FieldByName('FLGCORRECAOATRASO').AsInteger := 0;
      qryBenef.FieldByName('FLGCORRECAODEVOL').AsInteger  := 0;
      qryBenef.FieldByName('FLGACEITAACERTO').AsInteger   := 0;
      qryBenef.FieldByName('FLGTPBUSCAVALOR').AsInteger   := 0;
      qryBenef.FieldByName('FLGACTVLRSRB').AsInteger      := 0;
      qryBenef.FieldByName('FLGACTVLRATUAL').AsInteger    := 0;
      qryBenef.FieldByName('FLGACTVLRTOTBEN').AsInteger   := 0;

      qryBenef.FieldByName('FLGAPRESENTABSFAB').AsInteger   := 0;    // edilaine - SOL 253577-17349 / PPM 840966
      qryBenef.FieldByName('FLGAPRESENTADEFICIT').AsInteger := 0;    // edilaine - SOL 253577-17349 / PPM 840966

   end;
end; 

procedure TfrmCadPlanPrevCS.CmeDetalheEdit(Sender: TObject);
begin
   inherited;
   if pgctrlDetalhe.ActivePage = tbsDet
   then begin // Contribuicoes

      bMudouAltDeBaixa := false;                       //edilaine - SIG36752

      sbtnOpcoes.Visible := (qryDet.FieldByName('FLGACEITAOPCAO').AsInteger = 1);
      dbchkAceitarOpcoes.Enabled := (qryDet.FieldByName('flgPagador').AsString <> 'E');
      bCobra13Antes      := (qryDet.FieldByName('FLGCOBRADECTERC').AsInteger = 1);
      if qryDet.FieldByName('FlgPagador').AsString = 'C'
      then iIdxPagadorAntes   := 0
      else if qryDet.FieldByName('FlgPagador').AsString = 'P'
           then iIdxPagadorAntes := 1
           else iIdxPagadorAntes := 2;
      pgctrlContPrev.ActivePage   := tbsContPrev1;

   end
   else if pgctrlDetalhe.ActivePage = tbsBenef then       //edilaine - SIG24483
   begin
      sbtnOpcoesBenef.Visible    := (qryBenef.FieldByName('FLGACEITAOPCAO').AsInteger = 1);
      sbtnOpcoesTextoBenef.Visible := (qryBenef.FieldByName('FLGOPCAOTEXTO').AsInteger = 1);
      tbsBenefPlano3.TabVisible  := (qryBenef.FieldByName('FLGPOSSUIABONO').AsInteger = 1) and
                                    ((qryBenef.FieldByName('FLGREFERENCIA').AsInteger <> 1) or
                                     (qryBenef.FieldByName('FLGPAGAINSS').AsInteger = 1) );

      tbsBenefPlano2.TabVisible  := (qryBenef.FieldByName('FLGREFERENCIA').AsInteger <> 1) or (qryBenef.FieldByName('FLGPAGAINSS').AsInteger = 1);
      tbsBenefExcecao.TabVisible := (qryBenef.FieldByName('FLGREFERENCIA').AsInteger <> 1) or
                                    (qryBenef.FieldByName('FLGPAGAINSS').AsInteger = 1);
      pgctrlBenef.ActivePage     := tbsBenefPlano1;

   end;
end; 

procedure TfrmCadPlanPrevCS.CmeDetalheDelete(Sender: TObject);
var iIdRubrica : longint;
    i          : integer;
begin
   if pgctrlDetalhe.ActivePage = tbsDet
   then begin
      if MsgDlg('Esta contribuição será desassociada da patrocinadora e, conseqüentemente, '+
                'sua parametrização contábil e financeira será perdida. Confirma ? ','Confirmação',
                mtConfirmation,[mbYes, mbNo, mbHelp],0) = mrNo
      then Abort;

      with qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' DELETE FROM CONTPLANPATRO '+
                 ' WHERE  (IDPLANOPREV    = '+IntToStr(qryDet.FieldbyName('IdPlanoPrev').AsInteger)+') '+
                 ' AND    (IDCONTRIBUICAO = '+IntToStr(qryDet.FieldbyName('IdContribuicao').AsInteger)+') ');
         try
            ExecSQL;
         except
            raise;
         end;
      end;

      // ***********************************************************************
      //          EXCLUIR AS RUBRICAS DA CONTRIBUICAO QUE ESTA SENDO APAGADA
      // ***********************************************************************
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' UPDATE CONTPREV SET IDRUBRICA = NULL, IDRUBRICAATRASO = NULL, IDRUBRICADEVOLUC = NULL, '+
                     '                     IDRUBDECTERC = NULL, IDRUBDECTERCATRA = NULL, IDRUBDECTERCDEVOL = NULL '+
                     ' WHERE  IDPLANOPREV    = '+IntToStr(qryDet.FieldbyName('IdPlanoPrev').AsInteger)+
                     ' AND    IDCONTRIBUICAO = '+IntToStr(qryDet.FieldbyName('IdContribuicao').AsInteger) );
      try
         qryAux.ExecSQL;
      except
         MsgDlg('Erro ao apagar as rubricas da contribuição. Verifique. ','Erro',mtError,[mbOk, mbHelp], 0);
         Abort;
      end;

      for i := 1 to 6 do
      begin
         case i of
              1 : iIdRubrica := qryDet.FieldByName('IdRubrica').AsInteger;
              2 : iIdRubrica := qryDet.FieldByName('IdRubricaAtraso').AsInteger;
              3 : iIdRubrica := qryDet.FieldByName('IdRubricaDevoluc').AsInteger;
              4 : iIdRubrica := qryDet.FieldByName('IDRUBDECTERC').AsInteger;
              5 : iIdRubrica := qryDet.FieldByName('IDRUBDECTERCATRA').AsInteger;
              6 : iIdRubrica := qryDet.FieldByName('IDRUBDECTERCDEVOL').AsInteger;
         end;

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' DELETE FROM RUBRICAXPESS WHERE  IDRUBRICA = '+IntToStr(iIdRubrica) );
         try
            qryAux.ExecSQL;
         except
            MsgDlg('A rubrica desta contribuição já foi inserida no histórico de rubricas e não pode mais ser alterada. Verifique. ',
                   'Erro',mtError,[mbOk, mbHelp], 0);
            Abort;
         end;

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' DELETE FROM PROVDESC WHERE  IDPROVENTO  = '+IntToStr(iIdRubrica) );
         try
            qryAux.ExecSQL;
         except
            MsgDlg('A rubrica desta contribuição já foi inserida no histórico de rubricas e não pode mais ser alterada. Verifique. ',
                   'Erro',mtError,[mbOk, mbHelp], 0);
            Abort;
         end;
      end; 
   end
   else  if pgctrlDetalhe.ActivePage = tbsBenef  then      //edilaine - SIG24483
   begin
      if MsgDlg('Este benefício será desassociado da patrocinadora e, conseqüentemente, '+
                'sua parametrização contábil e financeira será perdida. Confirma ? ','Confirmação',
                mtConfirmation,[mbYes, mbNo, mbHelp],0) = mrNo
      then Abort;

      with qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' DELETE FROM BENEFPLANPATRO '+
                 ' WHERE  (IDPLANOPREV    = '+IntToStr(qryBenef.FieldbyName('IdPlanoPrev').AsInteger)+') '+
                 ' AND    (IDBENEFICIO = '+IntToStr(qryBenef.FieldbyName('IdBeneficio').AsInteger)+') ');
         try
            ExecSQL;
         except
            raise;
         end;
      end;

      // Excluir rubricas do beneficio
      
      // Excluir rubrica normal
      iIdRubrica := qryBenef.FieldByName('IdRubrica').AsInteger;
      qryRubricaxPess.First;
      while (not qryRubricaxPess.Eof) and
            (qryRubricaXPess.Locate('IdRubrica',iIdRubrica,[loCaseInsensitive]))
      do qryRubricaxPess.Delete;
      //if qryProvDesc.Locate('IdProvento',iIdRubrica,[loCaseInsensitive]) //TAES - SIG91251
      //then qryProvDesc.Delete; //TAES - SIG91251
      // inicio - edilaine - SOL 191668 / KTN 1820235
      //if qryRubxEvento.Locate('IdProvento',iIdRubrica,[loCaseInsensitive])     //TAES - SIG91251
      //then qryRubxEvento.Delete;                                               //TAES - SIG91251
      // fim - edilaine - SOL 191668 / KTN 1820235

      // Excluir rubrica de atraso
      iIdRubrica := qryBenef.FieldByName('IDRUBRICAATRASO').AsInteger;
      qryRubricaxPess.First;
      while (not qryRubricaxPess.Eof) and
            (qryRubricaXPess.Locate('IdRubrica',iIdRubrica,[loCaseInsensitive]))
      do qryRubricaxPess.Delete;
      //if qryProvDesc.Locate('IdProvento',iIdRubrica,[loCaseInsensitive]) //TAES - SIG91251
      //then qryProvDesc.Delete; //TAES - SIG91251
      // inicio - edilaine - SOL 191668 / KTN 1820235
      //if qryRubxEvento.Locate('IdProvento',iIdRubrica,[loCaseInsensitive])    //TAES - SIG91251
      //then qryRubxEvento.Delete;                                              //TAES - SIG91251
      // fim - edilaine - SOL 191668 / KTN 1820235

      // Excluir rubrica de devolucao
      iIdRubrica := qryBenef.FieldByName('IDRUBDEVOLUCAO').AsInteger;
      qryRubricaxPess.First;
      while (not qryRubricaxPess.Eof) and
            (qryRubricaXPess.Locate('IdRubrica',iIdRubrica,[loCaseInsensitive]))
      do qryRubricaxPess.Delete;
      //if qryProvDesc.Locate('IdProvento',iIdRubrica,[loCaseInsensitive]) //TAES - SIG91251
      //then qryProvDesc.Delete; //TAES - SIG91251
      // inicio - edilaine - SOL 191668 / KTN 1820235
      //if qryRubxEvento.Locate('IdProvento',iIdRubrica,[loCaseInsensitive])      //TAES - SIG91251
      //then qryRubxEvento.Delete;                                                //TAES - SIG91251
      // fim - edilaine - SOL 191668 / KTN 1820235

      // Excluir rubrica de revisao
      iIdRubrica := qryBenef.FieldByName('IDRUBRICAREVISAO').AsInteger;
      qryRubricaxPess.First;
      while (not qryRubricaxPess.Eof) and
            (qryRubricaXPess.Locate('IdRubrica',iIdRubrica,[loCaseInsensitive]))
      do qryRubricaxPess.Delete;
      //if qryProvDesc.Locate('IdProvento',iIdRubrica,[loCaseInsensitive]) //TAES - SIG91251
      //then qryProvDesc.Delete; //TAES - SIG91251
      // inicio - edilaine - SOL 191668 / KTN 1820235
      //if qryRubxEvento.Locate('IdProvento',iIdRubrica,[loCaseInsensitive])       //TAES - SIG91251
      //then qryRubxEvento.Delete;                                                 //TAES - SIG91251
      // fim - edilaine - SOL 191668 / KTN 1820235

      // Excluir rubrica de abono
      iIdRubrica := qryBenef.FieldByName('IDRUBABONO').AsInteger;
      qryRubricaxPess.First;
      while (not qryRubricaxPess.Eof) and
            (qryRubricaXPess.Locate('IdRubrica',iIdRubrica,[loCaseInsensitive]))
      do qryRubricaxPess.Delete;
      //if qryProvDesc.Locate('IdProvento',iIdRubrica,[loCaseInsensitive]) //TAES - SIG91251
      //then qryProvDesc.Delete; //TAES - SIG91251
      // inicio - edilaine - SOL 191668 / KTN 1820235
      //if qryRubxEvento.Locate('IdProvento',iIdRubrica,[loCaseInsensitive])              //TAES - SIG91251
      //then qryRubxEvento.Delete;                                                        //TAES - SIG91251
      // fim - edilaine - SOL 191668 / KTN 1820235

      // Excluir rubrica de antecipacao de abono
      iIdRubrica := qryBenef.FieldByName('IDRUBANTECABONO').AsInteger;
      qryRubricaxPess.First;
      while (not qryRubricaxPess.Eof) and
            (qryRubricaXPess.Locate('IdRubrica',iIdRubrica,[loCaseInsensitive]))
      do qryRubricaxPess.Delete;
      //if qryProvDesc.Locate('IdProvento',iIdRubrica,[loCaseInsensitive]) //TAES - SIG91251
      //then qryProvDesc.Delete; //TAES - SIG91251
      // inicio - edilaine - SOL 191668 / KTN 1820235
      //if qryRubxEvento.Locate('IdProvento',iIdRubrica,[loCaseInsensitive])          //TAES - SIG91251
      //then qryRubxEvento.Delete;                                                    //TAES - SIG91251
      // fim - edilaine - SOL 191668 / KTN 1820235

      // Excluir rubrica de desconto de antecipacao de abono
      iIdRubrica := qryBenef.FieldByName('IDRUBDESCANTECAB').AsInteger;
      qryRubricaxPess.First;
      while (not qryRubricaxPess.Eof) and
            (qryRubricaXPess.Locate('IdRubrica',iIdRubrica,[loCaseInsensitive]))
      do qryRubricaxPess.Delete;
      //if qryProvDesc.Locate('IdProvento',iIdRubrica,[loCaseInsensitive]) //TAES - SIG91251
      //then qryProvDesc.Delete; //TAES - SIG91251
      // inicio - edilaine - SOL 191668 / KTN 1820235
      //if qryRubxEvento.Locate('IdProvento',iIdRubrica,[loCaseInsensitive])       //TAES - SIG91251
      //then qryRubxEvento.Delete;                                                 //TAES - SIG91251
      // fim - edilaine - SOL 191668 / KTN 1820235

      // Excluir rubrica de devolucao de abono
      iIdRubrica := qryBenef.FieldByName('IDRUBDEVOLABONO').AsInteger;
      qryRubricaxPess.First;
      while (not qryRubricaxPess.Eof) and
            (qryRubricaXPess.Locate('IdRubrica',iIdRubrica,[loCaseInsensitive]))
      do qryRubricaxPess.Delete;
      //if qryProvDesc.Locate('IdProvento',iIdRubrica,[loCaseInsensitive]) //TAES - SIG91251
      //then qryProvDesc.Delete; //TAES - SIG91251
      // inicio - edilaine - SOL 191668 / KTN 1820235
      //if qryRubxEvento.Locate('IdProvento',iIdRubrica,[loCaseInsensitive])          //TAES - SIG91251
      //then qryRubxEvento.Delete;                                                    //TAES - SIG91251
      // fim - edilaine - SOL 191668 / KTN 1820235

   end
   //edilaine - SIG24483 : inicio
   else if pgctrlDetalhe.ActivePage = tsIsencaoiRAcJud then
   begin
     if MsgDlg('Deseja realmente excluir este registro. ','Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrNo then
        Abort;
   end;
   //edilaine - SIG24483 : fim

   inherited;
end;

function TfrmCadPlanPrevCS.VerificaDetalhe;
var bPerguntaFeita : boolean;
begin
   Result := False;
   if pgCtrlDetalhe.ActivePage = tbsDet
   then begin
      if not (qryDet.State in [dsInsert, dsEdit])
      then begin
         Result := True;
         Exit;
      end;
      // Testar campos obrigatórios
      if Trim(dblkpcmbContribuicao.Text) = ''
      then begin
          MsgDlg('Contribuição não preenchida.','Erro',mtError,[mbOk,mbHelp],0);
          pgctrlContPrev.ActivePage    := tbsContPrev1;
          
          Exit;
      end;

      if Trim(dbedOrdemCalculo.Text) = ''
      then begin
          MsgDlg('Ordem de Cálculo da Contribuição não preenchida.','Erro',mtError,[mbOk,mbHelp],0);
          pgctrlContPrev.ActivePage    := tbsContPrev1;
         
          Exit;
      end;

      if Trim(dbcmbSitCorrespond.Text) = ''
      then begin
          MsgDlg('Situação Correspondente preenchida.','Erro',mtError,[mbOk,mbHelp],0);
          pgctrlContPrev.ActivePage    := tbsContPrev1;

          Exit;
      end;

      if Trim(dblkpcmbCalculo.Text) = ''
      then begin
         if MsgDlg('Regra de Cálculo da Contribuição não preenchida. Deseja cadastrar plano sem Regra de Cálculo ?','Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo
         then begin
            pgctrlContPrev.ActivePage    := tbsContPrev2;

            Exit;
         end
      end;
   end
   else if pgCtrlDetalhe.ActivePage = tbsBenef
        then begin
            bPerguntaFeita := False;
            if not (qryBenef.State in [dsInsert, dsEdit])
            then begin
               Result := True;
               Exit;
            end;

            // Testar campos obrigatórios
            if Trim(dblkpcmbBeneficio.Text) = ''
            then begin
                MsgDlg('Benefício não preenchido.','Erro',mtError,[mbOk,mbHelp],0);
                pgctrlBenef.ActivePage    := tbsBenefPlano1;
              
                Exit;
            end;

            if (not bPerguntaFeita) and (Trim(dblkpcmbConcessao.Text) = '')
            then begin
                bPerguntaFeita := True;
                if MsgDlg('Regra de Concessão de Benefício não preenchida. Deseja cadastrar plano sem Regra de Concessão ?','Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo
                then begin
                   pgctrlBenef.ActivePage    := tbsBenefPlano2;
                
                   Exit;
                end
            end;

             if (not bPerguntaFeita) and (dblkpcmbRegBeneficiario.Visible) and
                (Trim(dblkpcmbRegBeneficiario.Text) = '')
             then begin
                 bPerguntaFeita := True;
                 if MsgDlg('Regra de Beneficiário não preenchida. Deseja cadastrar plano sem Regra de Beneficiário ?','Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo
                 then begin
                    pgctrlBenef.ActivePage    := tbsBenefPlano2;
                  
                    Exit;
                 end
             end;

             if (qryBenef.FieldByName('IdBeneficio').AsInteger = qryBenef.FieldByName('IdBenefRef').AsInteger) and
                (Trim(dblkpcmbBenefRef.Text) <> '')
             then begin
                 MsgDlg('O Benefício de Referência não pode ser o próprio benefício. ','Erro',mtError,[mbOk,mbHelp],0);
                 pgctrlBenef.ActivePage    := tbsBenefPlano1;

                 Exit;
             end;
        end;
   Result := True;
end;

// *********************************************************************
// **************************  MÉTODOS DOS OBJETOS DO FORM
// *********************************************************************
procedure TfrmCadPlanPrevCS.FormCreate(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
  dbgrdDet.BringToFront;
  dbgrdBenef.BringToFront;

  if prmflgMultiFundacao = False
  then begin
     lblFundacao.Visible      := False;
     dblkpcmbFundacao.Visible := False;
  end;
  pgctrlDetalhe.ActivePage := tbsPlano;
  // Wylliam Silva Kintana: 1319244 SOL: 159477 - Inicio
  qryContribuicao.open;
  qryBeneficio.open;
  // Wylliam Silva Kintana: 1319244 SOL: 159477 - Fim
end;

procedure TfrmCadPlanPrevCS.FormActivate(Sender: TObject);
begin
  inherited;
  // Abrir querys principais com vazio
  qry.Close;
  qry.ParamByName('IdPlanoPrev').Value  := 0;
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IdPlanoPrev').Value  := 0;
  qryDet.Open;

  qryBenef.Close;
  qryBenef.ParamByName('IdPlanoPrev').Value  := 0;
  qryBenef.Open;

  //edilaine - SIG24483: inicio
  qryIsentoIRAcJud.close;
  qryIsentoIRAcJud.ParamByName('PIDPLANOPREV').AsInteger  := 0;
  qryIsentoIRAcJud.Open;
  //edilaine - SIG24483: fim


  qryProvDesc.Close;
  qryProvDesc.Open;

  // inicio - edilaine - SOL 191668 / KTN 1820235
  qryRubxEvento.Close;
  qryRubxEvento.Open;
  // fim - edilaine - SOL 191668 / KTN 1820235

  qryRubricaXPess.Close;
  qryRubricaXPess.Open;

  // Abrir querys auxiliares
  qryMoeda.Close;        qryMoeda.Open;
  qryFundacao.Close;     qryFundacao.Open;
  qryRegra.Close;        qryRegra.Open;
  qryContribuicao.Close; qryContribuicao.Open;
  qryBeneficio.Close;    qryBeneficio.Open;
  qryTpReajuste.Close;   qryTpReajuste.Open;
  qryProventos.Close;    qryProventos.Open;
  qryDescontos.Close;    qryDescontos.Open;
  qryRubAcerto.Close;    qryRubAcerto.Open;
  qryAlterador.Close;    qryAlterador.Open;
  qryRelatorios.Close;   qryRelatorios.Open;
  qryUsuarioSistema.Close; qryUsuarioSistema.Open;
  qryMeses.Close;          qryMeses.Open;


  QryDescontoNormal.Close; QryDescontoNormal.Open;
  QryDescontoAtraso.Close; QryDescontoAtraso.Open;
  QryProventoDevolucao.Close; QryProventoDevolucao.Open;
  QryProventoNormal.Close;    QryProventoNormal.Open;
  QryProventoAtraso.Close;    QryProventoAtraso.Open;
  QryDescontoDevolucao.Close; QryDescontoDevolucao.Open;

  qryAltBaixa.Close;          qryAltBaixa.Open;              //edilaine - SIG36752
  QryProventoAcerto.close;    QryProventoAcerto.open;        //edilaine - SIG36752

  qryBenefReferen.Close;
  qryBenefReferen.ParamByName('IdPlanoPrev').AsInteger := -1;
  qryBenefReferen.Open;

  qryContribCorresp.Close;
  qryContribCorresp.ParamByName('IdPlanoPrev').Value := 0;
  qryContribCorresp.ParamByName('IdContribuicao').Value := 0;
  qryContribCorresp.Open;

  //edilaine - SIG24483: inicio
  qryRubIsentaIR.close;
  qryRubIsentaIR.Open;

  qryRubIncideIR.close;
  qryRubIncideIR.Open;
  //edilaine - SIG24483: fim

  // Aline Freire SOL 155182 Kintana 1228739
  try
    if qryLkpProvDescN.Active then qryLkpProvDescN.Close;
      qryLkpProvDescN.open;
  except
    MsgDlg('Erro ao abrir lookup ProvDescN','Error',mtError,[mbok],0);
    Abort;
  end;

  try
    if qryLkpProvDescA.Active then qryLkpProvDescA.Close;
      qryLkpProvDescA.open;
  except
    MessageDlg('Erro ao abrir lookup ProvDescA',mtCustom,[mbok],0);
    Abort;
  end;

  try
    if qryLkpProvDescD.Active then qryLkpProvDescD.Close;
      qryLkpProvDescD.open;
  except
    MessageDlg('Erro ao abrir lookup ProvDescD',mtCustom,[mbok],0);
    Abort;
  end;
  // Aline Freire SOL 155182 Kintana 1228739




///SOL205322  KINTANA 1996527
  try
    if qryLkpProvDescN_B.Active then qryLkpProvDescN_B.Close;
      qryLkpProvDescN_B.open;
  except
    MsgDlg('Erro ao abrir lookup ProvDescN_B','Error',mtError,[mbok],0);
    Abort;
  end;

  try
    if qryLkpProvDescA_B.Active then qryLkpProvDescA_B.Close;
      qryLkpProvDescA_B.open;
  except
    MsgDlg('Erro ao abrir lookup ProvDescA_B','Error',mtError,[mbok],0);
    Abort;
  end;


    try
    if qryLkpProvDescD_B.Active then qryLkpProvDescD_B.Close;
      qryLkpProvDescD_B.open;
  except
    MsgDlg('Erro ao abrir lookup ProvDescD_B','Error',mtError,[mbok],0);
    Abort;
  end;
                                          
 ///SOL205322  KINTANA 1996527



 ///

  try
    if qryLkpProvCobraN_D.Active then qryLkpProvCobraN_D.Close;
      qryLkpProvCobraN_D.open;
  except
    MsgDlg('Erro ao abrir lookup qryLkpProvCobraN_D','Error',mtError,[mbok],0);
    Abort;
  end;

  try
    if qryLkpProvCobraA_D.Active then qryLkpProvCobraA_D.Close;
      qryLkpProvCobraA_D.open;
  except
    MsgDlg('Erro ao abrir lookup qryLkpProvCobraA_D','Error',mtError,[mbok],0);
    Abort;
  end;


    try
    if qryLkpProvCobraD_D.Active then qryLkpProvCobraD_D.Close;
      qryLkpProvCobraD_D.open;
  except
    MsgDlg('Erro ao abrir lookup qryLkpProvCobraD_D','Error',mtError,[mbok],0);
    Abort;
  end;

 ///

  // Configurar objetos invisiveis da tela
  lblFundacao.Visible      := prmflgMultiFundacao;
  dblkpcmbFundacao.Visible := prmflgMultiFundacao;
  pnlInscricao.Visible     := False;
  pnlLimitePatro.Visible   := False;
  bTelaOpcoesContrib       := False;
end;

procedure TfrmCadPlanPrevCS.dbchkAutoNumInscClick(Sender: TObject);
begin
  inherited;
  pnlInscricao.Visible := dbchkAutoNumInsc.Checked;
end;

procedure TfrmCadPlanPrevCS.dbchkCalculaLimiteClick(Sender: TObject);
begin
  inherited;
  pnlLimitePatro.Visible := dbchkCalculaLimite.Checked;
end;

procedure TfrmCadPlanPrevCS.dblkpcmbContribuicaoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryContribCorresp.Close;
  qryContribCorresp.ParamByName('IdPlanoPrev').Value    := qry.FieldByName('IdPlanoPrev').AsInteger;
  qryContribCorresp.ParamByName('IdContribuicao').Value := qryContribuicao.FieldByName('IdContribuicao').AsInteger;
  qryContribCorresp.Open;
  if pgctrlDetalhe.ActivePage = tbsDet
  then begin
     edPaiDetalhe.Text := qryContribuicao.FieldByName('Nome').AsString;
  end;
end;

procedure TfrmCadPlanPrevCS.dbchkAceitarOpcoesClick(Sender: TObject);
begin
  inherited;
  sbtnOpcoes.Visible := dbchkAceitarOpcoes.Checked;
end;

procedure TfrmCadPlanPrevCS.dbchkAceitarOpBenefClick(Sender: TObject);
begin
  inherited;
  sbtnOpcoesBenef.Visible := (dbchkAceitarOpBenef.Checked);
end;

procedure TfrmCadPlanPrevCS.qryContribuicaoAfterScroll(DataSet: TDataSet);
begin 
  qryContribCorresp.Close;
  if qry.Active
  then qryContribCorresp.ParamByName('IdPlanoPrev').Value    := qry.FieldByName('IdPlanoPrev').AsInteger
  else qryContribCorresp.ParamByName('IdPlanoPrev').Value    := 0;
  qryContribCorresp.ParamByName('IdContribuicao').Value := qryContribuicao.FieldByName('IdContribuicao').AsInteger;
  qryContribCorresp.Open;

  dblkpcmbContribPai.PerformSearch;
  dblkpcmbContribPai2.PerformSearch;
  dblkpcmbContribPai3.PerformSearch;
  inherited;
end;

procedure TfrmCadPlanPrevCS.sbtnOpcoesClick(Sender: TObject);
var
  sNumOpcoes, sNomeValorBase1Contrib,
  sNomeValorBase2Contrib,  sNomeValorBase3Contrib,
  sRegraOp1, sRegraOp2, sRegraOp3: string;
  sRegraCalcOp1, sRegraCalcOp2, sRegraCalcOp3: string;
  AYear, AMonth, ADay: Word;

  iIdRegraOp1, iIdRegraOp2, iIdRegraOp3, iIdRegraCalcOp1,
  iIdRegraCalcOp2, iIdRegraCalcOp3,
  ilFlgObrigaOp1, ilFlgObrigaOp2, ilFlgObrigaOp3,
  ilFlgAlteraOp1, ilFlgAlteraOp2, ilFlgAlteraOp3 : integer;
  // SOL 186966 KTN 1762485 Otacilio ** Inicio **
  //iFlgValorTitular1, iFlgValorTitular2, iFlgValorTitular3 : integer; // Marcos Merola Sol 148463
  //ilFlgValorTitular1, ilFlgValorTitular2, ilFlgValorTitular3 : integer; // Marcos Merola Sol 148463
  // SOL 186966 KTN 1762485 Otacilio ** Fim **

begin

  bTelaOpcoesContrib := True;

  ilFlgObrigaOp1 := 0;
  ilFlgObrigaOp2 := 0;
  ilFlgObrigaOp3 := 0;

  ilFlgAlteraOp1 := 0;
  ilFlgAlteraOp2 := 0;
  ilFlgAlteraOp3 := 0;

  // SOL 186966 KTN 1762485 Otacilio ** Inicio ** 
  //ilFlgValorTitular1 := 0; // Marcos Merola Sol 148463
  //ilFlgValorTitular2 := 0; // Marcos Merola Sol 148463
  //ilFlgValorTitular3 := 0; // Marcos Merola Sol 148463
  // SOL 186966 KTN 1762485 Otacilio ** Fim **

  // Preencher regras de validacao se já houverem
  if qryDet.FieldByName('IdRegraValidaOp1').AsString <> ''
  then begin
     if qryRegra.Locate('IdRegra', qryDet.Fieldbyname('IdRegraValidaOp1').AsInteger,[loCaseInsensitive,loPartialKey])
     then sRegraOp1 := qryRegra.FieldbyName('NomeRegra').AsString
     else sRegraOp1 := '';
  end;

  if qryDet.FieldByName('IdRegraValidaOp2').AsString <> ''
  then begin
     if qryRegra.Locate('IdRegra', qryDet.Fieldbyname('IdRegraValidaOp2').AsInteger,[loCaseInsensitive,loPartialKey])
     then sRegraOp2 := qryRegra.FieldbyName('NomeRegra').AsString
     else sRegraOp2 := '';
  end;

  if qryDet.FieldByName('IdRegraValidaOp3').AsString <> ''
  then begin
     if qryRegra.Locate('IdRegra', qryDet.Fieldbyname('IdRegraValidaOp3').AsInteger,[loCaseInsensitive,loPartialKey])
     then sRegraOp3 := qryRegra.FieldbyName('NomeRegra').AsString
     else sRegraOp3 := '';
  end;

  // Preencher regras de Calculo se já houverem
  if qryDet.FieldByName('IDREGRACALCOP1').AsString <> ''
  then begin
     if qryRegra.Locate('IDREGRA', qryDet.Fieldbyname('IDREGRACALCOP1').AsInteger,[loCaseInsensitive,loPartialKey])
     then sRegraCalcOp1 := qryRegra.FieldbyName('NOMEREGRA').AsString
     else sRegraCalcOp1 := '';
  end;

  if qryDet.FieldByName('IDREGRACALCOP2').AsString <> ''
  then begin
     if qryRegra.Locate('IDREGRA', qryDet.Fieldbyname('IDREGRACALCOP2').AsInteger,[loCaseInsensitive,loPartialKey])
     then sRegraCalcOp2 := qryRegra.FieldbyName('NOMEREGRA').AsString
     else sRegraCalcOp2 := '';
  end;

  if qryDet.FieldByName('IDREGRACALCOP3').AsString <> ''
  then begin
     if qryRegra.Locate('IDREGRA', qryDet.Fieldbyname('IDREGRACALCOP3').AsInteger,[loCaseInsensitive,loPartialKey])
     then sRegraCalcOp3 := qryRegra.FieldbyName('NOMEREGRA').AsString
     else sRegraCalcOp3 := '';
  end;

  frmPedeOpcoesContrib := TfrmPedeOpcoesContrib.Create(Application);
  with frmPedeOpcoesContrib do
  begin
    edPlano.Text := dbedNome.Text;
    edContribuicao.Text := frmCadPlanPrevCS.qryContribuicao.FieldByName('NOME').AsString;
    sTipoPlano      := 'F';

    if qryDet.FieldByName('NUMOPCOES').AsString <> ''
    then spedNumOpcoes.Text  := qryDet.FieldByName('NUMOPCOES').AsString
    else spedNumOpcoes.Text  := '1';



    lcsRegraOp1 := sRegraOp1;
    lcsRegraOp2 := sRegraOp2;
    lcsRegraOp3 := sRegraOp3;

    stRegraCalcOp1 := sRegraCalcOp1;
    stRegraCalcOp2 := sRegraCalcOp2;
    stRegraCalcOp3 := sRegraCalcOp3;

    iFlgObrigaOp1  := qryDet.FieldByName('FLGOBRIGAOP1').AsInteger;
    iFlgObrigaOp2  := qryDet.FieldByName('FLGOBRIGAOP2').AsInteger;
    iFlgObrigaOp3  := qryDet.FieldByName('FLGOBRIGAOP3').AsInteger;

    iFlgAlteraOp1  := qryDet.FieldByName('FLGEDITAOP1').AsInteger;
    iFlgAlteraOp2  := qryDet.FieldByName('FLGEDITAOP2').AsInteger;
    iFlgAlteraOp3  := qryDet.FieldByName('FLGEDITAOP3').AsInteger;

    // SOL 186966 KTN 1762485 Otacilio ** Inicio **
    {iFlgValorTitular1 := qryDet.FieldByName('FLGVALORTITULAR1').AsInteger; // Marcos Merola Sol 148463
    iFlgValorTitular2 := qryDet.FieldByName('FLGVALORTITULAR2').AsInteger; // Marcos Merola Sol 148463
    iFlgValorTitular3 := qryDet.FieldByName('FLGVALORTITULAR3').AsInteger; // Marcos Merola sol 148463}
    // SOL 186966 KTN 1762485 Otacilio ** Fim **

    if qryDet.FieldByName('NOMEVALORBASE1').AsString <> ''
    then edNomeValorBase1.Text := qryDet.FieldByName('NOMEVALORBASE1').AsString;

    if qryDet.FieldByName('NOMEVALORBASE2').AsString <> ''
    then edNomeValorBase2.Text := qryDet.FieldByName('NOMEVALORBASE2').AsString;

    if qryDet.FieldByName('NOMEVALORBASE3').AsString <> ''
    then edNomeValorBase3.Text := qryDet.FieldByName('NOMEVALORBASE3').AsString;

    sIdContribuicao := frmCadPlanPrevCS.qryContribuicao.FieldByName('IDCONTRIBUICAO').AsString;    
    sIdPlanoPrev    := frmCadPlanPrevCS.qry.FieldByName('IDPLANOPREV').AsString;

    ShowModal;

    sNumOpcoes  := spedNumOpcoes.Text;

    sNomeValorBase1Contrib := edNomeValorBase1.Text;
    sNomeValorBase2Contrib := edNomeValorBase2.Text;
    sNomeValorBase3Contrib := edNomeValorBase3.Text;

    iIdRegraOp1 := lcRegraOp1;
    iIdRegraOp2 := lcRegraOp2;
    iIdRegraOp3 := lcRegraOp3;

    iIdRegraCalcOp1 := iRegraCalcOp1;
    iIdRegraCalcOp2 := iRegraCalcOp2;
    iIdRegraCalcOp3 := iRegraCalcOp3;

    ilFlgObrigaOp1  := iFlgObrigaOp1;
    ilFlgObrigaOp2  := iFlgObrigaOp2;
    ilFlgObrigaOp3  := iFlgObrigaOp3;

    ilFlgAlteraOp1  := iFlgAlteraOp1;
    ilFlgAlteraOp2  := iFlgAlteraOp2;
    ilFlgAlteraOp3  := iFlgAlteraOp3;

    // SOL 186966 KTN 1762485 Otacilio ** Inicio **
    //ilFlgValorTitular1 := iFlgValorTitular1; // Marcos Merola Sol 148463
    //ilFlgValorTitular2 := iFlgValorTitular1; // Marcos Merola Sol 148463
    //ilFlgValorTitular3 := iFlgValorTitular1; // Marcos Merola Sol 148463
    // SOL 186966 KTN 1762485 Otacilio ** Fim **

  end;
  frmPedeOpcoesContrib.Free;

  if Trim(sNumOpcoes) <> ''
  then begin
     qryDet.FieldByName('NUMOPCOES').AsInteger        := StrToInt(sNumOpcoes);

     qryDet.FieldByName('NOMEVALORBASE1').AsString    := sNomeValorBase1Contrib;
     qryDet.FieldByName('NOMEVALORBASE2').AsString    := sNomeValorBase2Contrib;
     qryDet.FieldByName('NOMEVALORBASE3').AsString    := sNomeValorBase3Contrib;

     if iIdRegraOp1 > 0
     then qryDet.FieldByName('IDREGRAVALIDAOP1').AsInteger := iIdRegraOp1
     else qryDet.FieldByName('IDREGRAVALIDAOP1').AsString  := '';

     if iIdRegraOp2 > 0
     then qryDet.FieldByName('IDREGRAVALIDAOP2').AsInteger := iIdRegraOp2
     else qryDet.FieldByName('IDREGRAVALIDAOP2').AsString  := '';

     if iIdRegraOp3 > 0
     then qryDet.FieldByName('IDREGRAVALIDAOP3').AsInteger := iIdRegraOp3
     else qryDet.FieldByName('IDREGRAVALIDAOP3').AsString  := '';

     if iIdRegraCalcOp1 > 0
     then qryDet.FieldByName('IDREGRACALCOP1').AsInteger := iIdRegraCalcOp1
     else qryDet.FieldByName('IDREGRACALCOP1').AsString  := '';

     if iIdRegraCalcOp2 > 0
     then qryDet.FieldByName('IDREGRACALCOP2').AsInteger := iIdRegraCalcOp2
     else qryDet.FieldByName('IDREGRACALCOP2').AsString  := '';

     if iIdRegraCalcOp3 > 0
     then qryDet.FieldByName('IDREGRACALCOP3').AsInteger := iIdRegraCalcOp3
     else qryDet.FieldByName('IDREGRACALCOP3').AsString  := '';

     qryDet.FieldByName('FLGOBRIGAOP1').AsInteger   := ilFlgObrigaOp1;
     qryDet.FieldByName('FLGOBRIGAOP2').AsInteger   := ilFlgObrigaOp2;
     qryDet.FieldByName('FLGOBRIGAOP3').AsInteger   := ilFlgObrigaOp3;

     qryDet.FieldByName('FLGEDITAOP1').AsInteger    := ilFlgAlteraOp1;
     qryDet.FieldByName('FLGEDITAOP2').AsInteger    := ilFlgAlteraOp2;
     qryDet.FieldByName('FLGEDITAOP3').AsInteger    := ilFlgAlteraOp3;

     // SOL 186966 KTN 1762485 Otacilio ** Inicio **
     //qryDet.FieldByName('FLGVALORTITULAR1').AsInteger    := ilFlgValorTitular1;   // Marcos Merola Sol 148463
     //qryDet.FieldByName('FLGVALORTITULAR2').AsInteger    := ilFlgValorTitular2;   // Marcos Merola Sol 148463
     //qryDet.FieldByName('FLGVALORTITULAR3').AsInteger    := ilFlgValorTitular3;   // Marcos Merola Sol 148463
     // SOL 186966 KTN 1762485 Otacilio ** Fim **

  end
  else begin
     qryDet.FieldByName('NUMOPCOES').AsInteger       := 0;
     qryDet.FieldByName('FLGACEITAOPCAO').AsInteger  := 0;
     qryDet.FieldByName('IDREGRAVALIDAOP1').AsString := '';
     qryDet.FieldByName('IDREGRAVALIDAOP2').AsString := '';
     qryDet.FieldByName('IDREGRAVALIDAOP3').AsString := '';
     qryDet.FieldByName('IDREGRACALCOP1').AsString   := '';
     qryDet.FieldByName('IDREGRACALCOP2').AsString   := '';
     qryDet.FieldByName('IDREGRACALCOP3').AsString   := '';
     qryDet.FieldByName('NOMEVALORBASE1').AsString   := '';
     qryDet.FieldByName('NOMEVALORBASE2').AsString   := '';
     qryDet.FieldByName('NOMEVALORBASE3').AsString   := '';
  end;
end;

procedure TfrmCadPlanPrevCS.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;

  if not qry.Active then Exit;
  qryBenefReferen.Close;
  qryBenefReferen.ParamByName('IdPlanoPrev').AsInteger := qry.FieldByName('IdPlanoPrev').AsInteger;
  qryBenefReferen.Open;

  pnlInscricao.Visible   := (qry.FieldByName('flgAutoNumInsc').AsInteger = 1);
  pnlLimitePatro.Visible := (qry.FieldByName('FLGCALCULALIMITE').AsInteger = 1);
end;


procedure TfrmCadPlanPrevCS.dbchkPossuiAbonoClick(Sender: TObject);   
begin
  inherited;
 
 tbsBenefPlano3.TabVisible := (dbchkPossuiAbono.Checked) and
                               ((not dbchkBenefReferencia.Checked) or (dbchBxPagaInss.Checked));
end;

procedure TfrmCadPlanPrevCS.dbrgrpPagadorClick(Sender: TObject);
begin
  inherited; 
  dbchkAceitarOpcoes.Enabled := (dbrgrpPagador.ItemIndex < 3);
  sbtnOpcoes.Enabled         := (dbrgrpPagador.ItemIndex < 3);
end;

procedure TfrmCadPlanPrevCS.dblkpcmbBenefRefCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if (Trim(dblkpcmbBenefRef.Text) <> '') and
     (Trim(qryBenefReferen.FieldByName('IdRegraCalculo').AsString) <> '')
  then begin
     qryBenef.FieldByName('IdRegraCalcINSS').AsInteger := qryBenefReferen.FieldbyName('IdRegraCalculo').AsInteger;
     dblkpcmbRegraCalcINSS.PerformSearch;
  end
  else begin
    qryBenef.FieldByName('IdRegraCalcINSS').AsString  := '';
    dblkpcmbRegraCalcINSS.Text := '';
  end;

end;

procedure TfrmCadPlanPrevCS.dblkpcmbBenefRefExit(Sender: TObject);
begin
  inherited;
  if (Trim(dblkpcmbBenefRef.Text) <> '') and
     (Trim(qryBenefReferen.FieldByName('IdRegraCalculo').AsString) <> '')
  then begin
     qryBenef.FieldByName('IdRegraCalcINSS').AsInteger := qryBenefReferen.FieldbyName('IdRegraCalculo').AsInteger;
     dblkpcmbRegraCalcINSS.PerformSearch;
  end
  else begin
    qryBenef.FieldByName('IdRegraCalcINSS').AsString  := '';
    dblkpcmbRegraCalcINSS.Text := '';
  end;


end;

procedure TfrmCadPlanPrevCS.qryBeneficioAfterScroll(DataSet: TDataSet);
begin
  inherited;



  if qryBeneficio.FieldByName('FlgDestBenef').AsString = 'B'
  then begin // beneficio para beneficiario
     lblRgBenefCalculo.Caption := 'Regra de Cálculo do Valor a Pagar p/cada beneficiário';
     lblRgBenefValorTotal.Visible := True;
     dblkpcmbRgValorTotal.Visible := True;
     lblRgConcBeneficiario.Visible := True;
     dblkpcmbRegBeneficiario.Visible := True;
  end
  else begin // beneficio para participante
     lblRgBenefCalculo.Caption := 'Regra de Cálculo do Valor a Pagar';
     lblRgBenefValorTotal.Visible := False;
     dblkpcmbRgValorTotal.Visible := False;
     lblRgConcBeneficiario.Visible := False;
     dblkpcmbRegBeneficiario.Visible := False;
  end;

end;

procedure TfrmCadPlanPrevCS.qryDetBeforePost(DataSet: TDataSet);
var iIdRubNormal,
    iIdRubAtraso,
    iIdRubDevolu,
    iIdRubDecTercNormal,
    iIdRubDecTercAtra,
    iIdRubDecTercDevolu,
    iIdRubAdiant,
    iIdRubDevolAdiant,
    iIdRubAdiant13,
    iIdRubDevAdiant13 : longint;
begin
  iIdRubNormal          := 0;  iIdRubAtraso       := 0;  iIdRubDevolu        := 0;
  iIdRubDecTercNormal   := 0;  iIdRubDecTercAtra  := 0;  iIdRubDecTercDevolu := 0;
  iIdRubAdiant          := 0;  iIdRubDevolAdiant  := 0;  iIdRubAdiant13      := 0;
  iIdRubDevAdiant13     := 0;

  if qryDet.State = dsInsert
  then begin
     
     InsereContPlanPatro(qry.FieldByName('IdPlanoPrev').AsInteger {iIdPlanoPrev},             //edilaine - SIG36752
                         qryContribuicao.FieldByName('IDCONTRIBUICAO').AsInteger);


     // Colocar nome na query para aparecer no grid
     qryDet.FieldByName('Nome').AsString := qryContribuicao.FieldByName('Nome').AsString;

     // Gravar automaticamente rubricas de atraso e devolucao da contribuicao,
     // se assim estiver parametrizado
     if prmFlgRubricaAuto
     then begin
        if not GravaRubricasContrib( iIdRubNormal,
                                     iIdRubAtraso,
                                     iIdRubDevolu,
                                     iIdRubDecTercNormal,
                                     iIdRubDecTercAtra,
                                     iIdRubDecTercDevolu,
                                     iIdRubAdiant,
                                     iIdRubDevolAdiant,
                                     iIdRubAdiant13,
                                     iIdRubDevAdiant13,
                                     False)
        then begin
            if MsgDlg('Ocorreram problemas na geração das rubricas para cobrança da contribuição. '+
                      ' Deseja continuar gravação da contribuição ?','Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo
            then Abort;
        end;
        qryDet.FieldByName('IdRubrica').AsInteger          := iIdRubNormal;
        qryDet.FieldByName('IdRubricaAtraso').AsInteger    := iIdRubAtraso;
        qryDet.FieldByName('IdRubricaDevoluc').AsInteger   := iIdRubDevolu;

        
        if qryDet.FieldByName('FLGINTERNO').AsString = 'AS'
        then begin
           
           If iIdRubAdiant > 0 Then
             qryDet.FieldByName('IDRUBADIANT').AsInteger        := iIdRubAdiant;
           If iIdRubAdiant13 > 0 Then
             qryDet.FieldByName('IDRUBADIANT13').AsInteger      := iIdRubAdiant13;
           If iIdRubDevolAdiant > 0 Then
             qryDet.FieldByName('IDRUBDEVOLADIANT').AsInteger   := iIdRubDevolAdiant;
           If iIdRubDevAdiant13 > 0 Then
             qryDet.FieldByName('IDRUBDEVADIANT13').AsInteger   := iIdRubDevAdiant13;
           
        end;
     end;


     if dbchkCobraDecTerc.Checked
     then begin
        if prmFlgRubricaAuto
        then begin
           if (iIdRubDecTercNormal <= 0) or (iIDRUBDECTERCATRA <= 0) or (iIdRubDecTercDevolu <= 0)
           then begin
               if MsgDlg('Ocorreram problemas na geração das rubricas de cobrança sobre 13º. '+
                         ' Deseja continuar gravação da contribuição ?','Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo
               then Abort;
           end;
           qryDet.FieldByName('IDRUBDECTERC').AsInteger      := iIdRubDecTercNormal;
           qryDet.FieldByName('IDRUBDECTERCATRA').AsInteger  := iIDRUBDECTERCATRA;
           qryDet.FieldByName('IDRUBDECTERCDEVOL').AsInteger := iIdRubDecTercDevolu;
        end;
     end
     else qryDet.FieldByName('FLGCOBRA13DTFIM').AsInteger := 0;

  end
  else begin // alteracao
     // Se alterou de "nao cobra sobre 13o." para "cobra sobre 13o.",
     // gerar rubricas sobre 13o.
     bCobra13Depois :=  dbchkCobraDecTerc.Checked;

     
     if (prmFlgRubricaAuto) and (bCobra13Antes <> bCobra13Depois) and (bCobra13Depois )
     then begin
        if not GravaRubricasContrib( iIdRubNormal,
                                     iIdRubAtraso,
                                     iIdRubDevolu,
                                     iIdRubDecTercNormal,
                                     iIdRubDecTercAtra,
                                     iIdRubDecTercDevolu,
                                     iIdRubAdiant,
                                     iIdRubDevolAdiant,
                                     iIdRubAdiant13,
                                     iIdRubDevAdiant13,
                                     True)
        then begin
            if MsgDlg('Ocorreram problemas na geração das rubricas de cobrança sobre 13º. '+
                      ' Deseja continuar gravação da contribuição ?','Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo
            then Abort
            else Exit;
        end;
        qryDet.FieldByName('IDRUBDECTERC').AsInteger       := iIdRubDecTercNormal;
        qryDet.FieldByName('IDRUBDECTERCATRA').AsInteger   := iIDRUBDECTERCATRA;
        qryDet.FieldByName('IDRUBDECTERCDEVOL').AsInteger  := iIdRubDecTercDevolu;

        
        if qryDet.FieldByName('FLGINTERNO').AsString = 'AS'
        then begin

           If iIdRubAdiant > 0 Then
             qryDet.FieldByName('IDRUBADIANT').AsInteger        := iIdRubAdiant;
           If iIdRubAdiant13 > 0 Then
             qryDet.FieldByName('IDRUBADIANT13').AsInteger      := iIdRubAdiant13;
           If iIdRubDevolAdiant > 0 Then
             qryDet.FieldByName('IDRUBDEVOLADIANT').AsInteger   := iIdRubDevolAdiant;
           If iIdRubDevAdiant13 > 0 Then
             qryDet.FieldByName('IDRUBDEVADIANT13').AsInteger   := iIdRubDevAdiant13;
           
        end;
     end;

     // Se o usuario alterou o pagador, verificar se as contribuicoes
     // devem mudar da tabela CONTRIBPREVPARTP para a tabela CONTRIBPREVPATRO
     // ou vice-versa
     iIdxPagadorDepois := dbrgrpPagador.ItemIndex;
     if (iIdxPagadorAntes <> iIdxPagadorDepois)
     then begin
         if not MoveContribuicao(qry.FieldByName('IdPlanoPrev').AsInteger,
                                 qryDet.FieldByName('IdContribuicao').AsInteger,
                                 iIdxPagadorAntes,
                                 iIdxPagadorDepois)
         then Exit;
     end;
  end;

  qryDet.FieldByName('FlgContingencia').AsInteger := cmbFinalidade.ItemIndex;

  
  if Trim(dblkpcmbContribAltAcrescimo.Text) = ''
  then qryDet.FieldByName('IDEMPRESAALT').AsString := ''
  else qryDet.FieldByName('IDEMPRESAALT').AsString := qryAlterador.FieldByName('IDEMPRESA').AsString;

  //edilaine - SIG36752 - inicio
  if bMudouAltDeBaixa then
  begin
     //atualiza alteradores de baixa para todos as patros

     qryContPPatro.Filter := 'IDCONTRIBUICAO = '+qryDet.FieldByName('IDCONTRIBUICAO').AsString;
     qryContPPatro.Filtered := true;

     while (not qryContPPatro.eof) do
     begin
       qryContPPatro.Edit;
       qryContPPatro.FieldByName('CODALTBAIXANPAGO').AsInteger    := qryDet.FieldByName('CODALTBAIXANPAGO').AsInteger;
       qryContPPatro.FieldByName('CODALTBAIXANPAGOPGA').AsInteger := qryDet.FieldByName('CODALTBAIXANPAGOPGA').AsInteger;
       qryContPPatro.Post;

       qryContPPatro.next;
     end;
     qryContPPatro.Filtered := false;
     
     bMudouAltDeBaixa := false;
  end;
  //edilaine - SIG36752 - fim

  inherited;
end;

procedure TfrmCadPlanPrevCS.qryBenefBeforePost(DataSet: TDataSet);
var
  iMesReaj,
  iIdRubNormal,
  iIdRubAtraso,
  iIdRubDevolucao ,
  iIdRubRevisao,
  iIdRubAbono,
  iIdRubAntecAbono,
  iIdRubDescAntecAbono,
  iIdRubDevolAbono,
  iIdRubAdiant,
  iIdRubDevolAdiant,
  iIdRubAdiant13,
  iIdRubDevAdiant13 : longint;
  sMesReaj          : string;
begin
  inherited;
  // Helen V Bianchi - WO7360  - Adicionado If
  if qryBenef.FieldByName('IDPLANPREVCONTAB').Asstring = '' then
  begin
     //leandro sig135968 - inicio
     qryBenef.FieldByName('IDPLANPREVCONTAB').AsInteger := qry.FieldByName('IdPlanoPrev').AsInteger;
     //leandro sig135968 - inicio
  end;

  if (Trim(dblkpcmbBenefRef.Text) <> '')
  then begin
     qryBenef.FieldByName('IdPlanoBenefRef').AsInteger := qry.FieldByName('IdPlanoPrev').AsInteger;
  end
  else begin
     qryBenef.FieldByName('IdPlanoBenefRef').AsString := '';
     qryBenef.FieldByName('IdBenefRef').AsString := '';
  end;

  if qryBenef.State = dsInsert
  then begin
     
     InsereBenefPlanPatro(qry.FieldByName('IdPlanoPrev').AsInteger {iIdPlanoPrev},     //edilaine - SIG36752
                          qryBeneficio.FieldByName('IDBENEFICIO').AsInteger);

     // Colocar nome na query para aparecer no grid
     qryBenef.FieldByName('Nome').AsString := qryBeneficio.FieldByName('Nome').AsString;

     if prmFlgRubricaAuto
     then begin
        // Gravar automaticamente rubricas de atraso e devolucao da contribuicao
        if not GravaRubricasBenef(iIdRubNormal,
                                  iIdRubAtraso,
                                  iIdRubDevolucao,
                                  iIdRubRevisao,
                                  iIdRubAbono,
                                  iIdRubAntecAbono,
                                  iIdRubDescAntecAbono,
                                  iIdRubDevolAbono,
                                  iIdRubAdiant,
                                  iIdRubDevolAdiant,
                                  iIdRubAdiant13,
                                  iIdRubDevAdiant13 )
        then begin
            if MsgDlg('Ocorreram problemas na geração das rubricas do Benefício. Deseja continuar gravação do benefício ?','Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo
            then Abort;
        end;

        qryBenef.FieldByName('IdRubrica').AsInteger        := iIdRubNormal;
        qryBenef.FieldByName('IdRubricaAtraso').AsInteger  := iIdRubAtraso;
        qryBenef.FieldByName('IdRubDevolucao').AsInteger   := iIdRubDevolucao;
        qryBenef.FieldByName('IdRubricaRevisao').AsInteger := iIdRubRevisao;
        qryBenef.FieldByName('IDRUBADIANT').AsInteger      := iIdRubAdiant;
        qryBenef.FieldByName('IDRUBDEVOLADIANT').AsInteger := iIdRubDevolAdiant;
        
        if dbchkPossuiAbono.Checked then
        begin
          qryBenef.FieldByName('IDRUBADIANT13').AsInteger    := iIdRubAdiant13;
          
          
          If iIdRubDevAdiant13 > 0 Then
            qryBenef.FieldByName('IDRUBDEVADIANT13').AsInteger := iIdRubDevAdiant13;
            
          qryBenef.FieldByName('IDRUBANTECABONO').AsInteger  := iIdRubAntecAbono;
          qryBenef.FieldByName('IDRUBDESCANTECAB').AsInteger := iIdRubDescAntecAbono;
          qryBenef.FieldByName('IDRUBDEVOLABONO').AsInteger  := iIdRubDevolAbono;
          qryBenef.FieldByName('IDRUBABONO').AsInteger       := iIdRubAbono;
        End;
     end;
  end;

  
  if  FloatToStr(dValorLimiteAntes) <> qryBenef.FieldByName('LIMITEALT').AsString
  then Modulo.GravaLogTOTALPREV ('Plano:'+qryBenef.FieldByName('IDPLANOPREV').AsString+'-Benefício:'+qryBenef.FieldByName('IDBENEFICIO').AsString+'-Alteração de Valor Limite [Antes :'+FloatToStr(dValorLimiteAntes)+'-Depois :'+qryBenef.FieldByName('LIMITEALT').AsString+']');

  if  FloatToStr(dPercLimiteAntes) <> qryBenef.FieldByName('PERCENTUALALT').AsString
  then Modulo.GravaLogTOTALPREV ('Plano:'+qryBenef.FieldByName('IDPLANOPREV').AsString+'-Benefício:'+qryBenef.FieldByName('IDBENEFICIO').AsString+'-Alteração de % Limite [Antes :'+FloatToStr(dPercLimiteAntes)+'-Depois :'+qryBenef.FieldByName('PERCENTUALALT').AsString+']');

  if  FloatToStr(iIdUsuarioLimiteAntes) <> qryBenef.FieldByName('USUARIOALT').AsString
  then Modulo.GravaLogTOTALPREV ('Plano:'+qryBenef.FieldByName('IDPLANOPREV').AsString+'-Benefício:'+qryBenef.FieldByName('IDBENEFICIO').AsString+'-Alteração de Autoriz. Limite [Antes :'+FloatToStr(iIdUsuarioLimiteAntes)+'-Depois :'+qryBenef.FieldByName('USUARIOALT').AsString+']');
end;


procedure TfrmCadPlanPrevCS.sbtnOpcoesBenefClick(Sender: TObject);
var
  sRegraOp1, sRegraOp2, sRegraOp3,
  sRegraCalcOp1, sRegraCalcOp2, sRegraCalcOp3,
  sNumOpcoesBenef, sNomeValorBase1Benef, sNomeValorBase2Benef,
  sNomeValorBase3Benef : string;
  iIdRegraBenefOp1, iIdRegraBenefOp2, iIdRegraBenefOp3,
  iIdRegraCalcBenefOp1, iIdRegraCalcBenefOp2, iIdRegraCalcBenefOp3 : longint;
  ilFlgObrigaOp1, ilFlgObrigaOp2, ilFlgObrigaOp3,
  ilFlgAlteraOp1, ilFlgAlteraOp2, ilFlgAlteraOp3 : integer;
  ilFlgValorTitular1, ilFlgValorTitular2, ilFlgValorTitular3 : integer; // Marcos Merola Sol 148463
begin
  inherited;
  ilFlgObrigaOp1 := 0;
  ilFlgObrigaOp2 := 0;
  ilFlgObrigaOp3 := 0;

  ilFlgAlteraOp1 := 0;
  ilFlgAlteraOp2 := 0;
  ilFlgAlteraOp3 := 0;

  ilFlgValorTitular1 := 0; // Marcos Merola Sol 148463
  ilFlgValorTitular2 := 0; // Marcos Merola Sol 148463
  ilFlgValorTitular3 := 0; // Marcos Merola Sol 148463

  // Preencher regras de validacao se já houverem
  if qryBenef.FieldByName('IdRegraValidaOp1').AsString <> ''
  then begin
     if qryRegra.Locate('IdRegra', qryBenef.Fieldbyname('IdRegraValidaOp1').AsInteger,[loCaseInsensitive,loPartialKey])
     then sRegraOp1 := qryRegra.FieldbyName('NomeRegra').AsString
     else sRegraOp1 := '';
  end;

  if qryBenef.FieldByName('IdRegraValidaOp2').AsString <> ''
  then begin
     if qryRegra.Locate('IdRegra', qryBenef.Fieldbyname('IdRegraValidaOp2').AsInteger,[loCaseInsensitive,loPartialKey])
     then sRegraOp2 := qryRegra.FieldbyName('NomeRegra').AsString
     else sRegraOp2 := '';
  end;

  if qryBenef.FieldByName('IdRegraValidaOp3').AsString <> ''
  then begin
     if qryRegra.Locate('IdRegra', qryBenef.Fieldbyname('IdRegraValidaOp3').AsInteger,[loCaseInsensitive,loPartialKey])
     then sRegraOp3 := qryRegra.FieldbyName('NomeRegra').AsString
     else sRegraOp3 := '';
  end;

  // Preencher regras de Calculo se já houverem
  if qryBenef.FieldByName('IDREGRACALCOP1').AsString <> ''
  then begin
     if qryRegra.Locate('IDREGRA', qryBenef.Fieldbyname('IDREGRACALCOP1').AsInteger,[loCaseInsensitive,loPartialKey])
     then sRegraCalcOp1 := qryRegra.FieldbyName('NOMEREGRA').AsString
     else sRegraCalcOp1 := '';
  end;

  if qryBenef.FieldByName('IDREGRACALCOP2').AsString <> ''
  then begin
     if qryRegra.Locate('IDREGRA', qryBenef.Fieldbyname('IDREGRACALCOP2').AsInteger,[loCaseInsensitive,loPartialKey])
     then sRegraCalcOp2 := qryRegra.FieldbyName('NOMEREGRA').AsString
     else sRegraCalcOp2 := '';
  end;

  if qryBenef.FieldByName('IDREGRACALCOP3').AsString <> ''
  then begin
     if qryRegra.Locate('IDREGRA', qryBenef.Fieldbyname('IDREGRACALCOP3').AsInteger,[loCaseInsensitive,loPartialKey])
     then sRegraCalcOp3 := qryRegra.FieldbyName('NOMEREGRA').AsString
     else sRegraCalcOp3 := '';
  end;


  frmPedeOpcoesBenef := TfrmPedeOpcoesBenef.Create(Application);

  with frmPedeOpcoesBenef do
  begin
    edPlano.Text     := dbedNome.Text;
    edBeneficio.Text := dblkpcmbBeneficio.Text;

    if qryBenef.FieldByName('NUMOPCOES').AsString <> '' then
       spedNumOpcoesBenef.Text := qryBenef.FieldByName('NUMOPCOES').AsString
    else
       spedNumOpcoesBenef.Text := '1';

    if qryBenef.FieldByName('NOMEVALORBASE1').AsString <> '' then
       edNomeValorBase1.Text := qryBenef.FieldByName('NOMEVALORBASE1').AsString;

    if qryBenef.FieldByName('NOMEVALORBASE2').AsString <> '' then
       edNomeValorBase2.Text := qryBenef.FieldByName('NOMEVALORBASE2').AsString;

    if qryBenef.FieldByName('NOMEVALORBASE3').AsString <> '' then
       edNomeValorBase3.Text := qryBenef.FieldByName('NOMEVALORBASE3').AsString;

    iFlgObrigaOp1  := qryBenef.FieldByName('FLGOBRIGAOP1').AsInteger;
    iFlgObrigaOp2  := qryBenef.FieldByName('FLGOBRIGAOP2').AsInteger;
    iFlgObrigaOp3  := qryBenef.FieldByName('FLGOBRIGAOP3').AsInteger;

    iFlgAlteraOp1  := qryBenef.FieldByName('FLGEDITAOP1').AsInteger;
    iFlgAlteraOp2  := qryBenef.FieldByName('FLGEDITAOP2').AsInteger;
    iFlgAlteraOp3  := qryBenef.FieldByName('FLGEDITAOP3').AsInteger;

    iFlgValorTitular1  := qryBenef.FieldByName('FLGVALORTITULAR1').AsInteger; // Marcos Merola Sol 148463
    iFlgValorTitular2  := qryBenef.FieldByName('FLGVALORTITULAR2').AsInteger; // Marcos Merola Sol 148463
    iFlgValorTitular3  := qryBenef.FieldByName('FLGVALORTITULAR3').AsInteger; // Marcos Merola Sol 148463

    lcsRegraOp1 := sRegraOp1;
    lcsRegraOp2 := sRegraOp2;
    lcsRegraOp3 := sRegraOp3;

    stRegraCalcOp1 := sRegraCalcOp1;
    stRegraCalcOp2 := sRegraCalcOp2;
    stRegraCalcOp3 := sRegraCalcOp3;

    ShowModal;

    sNumOpcoesBenef      := spedNumOpcoesBenef.Text;
    sNomeValorBase1Benef := edNomeValorBase1.Text;
    sNomeValorBase2Benef := edNomeValorBase2.Text;
    sNomeValorBase3Benef := edNomeValorBase3.Text;

    ilFlgObrigaOp1 := iFlgObrigaOp1;
    ilFlgObrigaOp2 := iFlgObrigaOp2;
    ilFlgObrigaOp3 := iFlgObrigaOp3;

    ilFlgAlteraOp1 := iFlgAlteraOp1;
    ilFlgAlteraOp2 := iFlgAlteraOp2;
    ilFlgAlteraOp3 := iFlgAlteraOp3;

    ilFlgValorTitular1 := iFlgValorTitular1;  // Marcos Merola Sol 148463
    ilFlgValorTitular2 := iFlgValorTitular2;  // Marcos Merola Sol 148463
    ilFlgValorTitular3 := iFlgValorTitular3;  // Marcos Merola Sol 148463

    iIdRegraBenefOp1 := lcRegraOp1;
    iIdRegraBenefOp2 := lcRegraOp2;
    iIdRegraBenefOp3 := lcRegraOp3;

    iIdRegraCalcBenefOp1 := iRegraCalcOp1;
    iIdRegraCalcBenefOp2 := iRegraCalcOp2;
    iIdRegraCalcBenefOp3 := iRegraCalcOp3;
  end;
  frmPedeOpcoesBenef.Free;

  if Trim(sNumOpcoesBenef) <> ''
  then begin
     qryBenef.FieldByName('NUMOPCOES').AsString       := sNumOpcoesBenef;

     qryBenef.FieldByName('NOMEVALORBASE1').AsString  := sNomeValorBase1Benef;
     qryBenef.FieldByName('NOMEVALORBASE2').AsString  := sNomeValorBase2Benef;
     qryBenef.FieldByName('NOMEVALORBASE3').AsString  := sNomeValorBase3Benef;

     qryBenef.FieldByName('FLGOBRIGAOP1').AsInteger   := ilFlgObrigaOp1;
     qryBenef.FieldByName('FLGOBRIGAOP2').AsInteger   := ilFlgObrigaOp2;
     qryBenef.FieldByName('FLGOBRIGAOP3').AsInteger   := ilFlgObrigaOp3;

     qryBenef.FieldByName('FLGEDITAOP1').AsInteger    := ilFlgAlteraOp1;
     qryBenef.FieldByName('FLGEDITAOP2').AsInteger    := ilFlgAlteraOp2;
     qryBenef.FieldByName('FLGEDITAOP3').AsInteger    := ilFlgAlteraOp3;

     qryBenef.FieldByName('FLGVALORTITULAR1').AsInteger := ilFlgValorTitular1;  // Marcos Merola Sol 148463
     qryBenef.FieldByName('FLGVALORTITULAR2').AsInteger := ilFlgValorTitular2;  // Marcos Merola Sol 148463
     qryBenef.FieldByName('FLGVALORTITULAR3').AsInteger := ilFlgValorTitular3;  // Marcos Merola Sol 148463

     if iIdRegraBenefOp1 > 0
     then qryBenef.FieldByName('IDREGRAVALIDAOP1').AsInteger := iIdRegraBenefOp1
     else qryBenef.FieldByName('IDREGRAVALIDAOP1').AsString  := '';

     if iIdRegraBenefOp2 > 0
     then qryBenef.FieldByName('IDREGRAVALIDAOP2').AsInteger := iIdRegraBenefOp2
     else qryBenef.FieldByName('IDREGRAVALIDAOP2').AsString  := '';

     if iIdRegraBenefOp3 > 0
     then qryBenef.FieldByName('IDREGRAVALIDAOP3').AsInteger := iIdRegraBenefOp3
     else qryBenef.FieldByName('IDREGRAVALIDAOP3').AsString  := '';

     if iIdRegraCalcBenefOp1 > 0
     then qryBenef.FieldByName('IDREGRACALCOP1').AsInteger := iIdRegraCalcBenefOp1
     else qryBenef.FieldByName('IDREGRACALCOP1').AsString  := '';

     if iIdRegraCalcBenefOp2 > 0
     then qryBenef.FieldByName('IDREGRACALCOP2').AsInteger := iIdRegraCalcBenefOp2
     else qryBenef.FieldByName('IDREGRACALCOP2').AsString  := '';

     if iIdRegraCalcBenefOp3 > 0
     then qryBenef.FieldByName('IDREGRACALCOP3').AsInteger := iIdRegraCalcBenefOp3
     else qryBenef.FieldByName('IDREGRACALCOP3').AsString  := '';
  end
  else begin
     qryBenef.FieldByName('NUMOPCOES').AsInteger       := 0;
     qryBenef.FieldByName('FLGACEITAOPCAO').AsInteger  := 0;
     qryBenef.FieldByName('NOMEVALORBASE1').AsString   := '';
     qryBenef.FieldByName('NOMEVALORBASE2').AsString   := '';
     qryBenef.FieldByName('NOMEVALORBASE3').AsString   := '';
     qryBenef.FieldByName('IDREGRAVALIDAOP1').AsString := '';
     qryBenef.FieldByName('IDREGRAVALIDAOP2').AsString := '';
     qryBenef.FieldByName('IDREGRAVALIDAOP3').AsString := '';
     qryBenef.FieldByName('IDREGRACALCOP1').AsString   := '';
     qryBenef.FieldByName('IDREGRACALCOP2').AsString   := '';
     qryBenef.FieldByName('IDREGRACALCOP3').AsString   := '';
     qryBenef.FieldByName('FLGOBRIGAOP1').AsInteger    := 0;
     qryBenef.FieldByName('FLGOBRIGAOP2').AsInteger    := 0;
     qryBenef.FieldByName('FLGOBRIGAOP3').AsInteger    := 0;
     qryBenef.FieldByName('FLGEDITAOP1').AsInteger     := 0;
     qryBenef.FieldByName('FLGEDITAOP2').AsInteger     := 0;
     qryBenef.FieldByName('FLGEDITAOP3').AsInteger     := 0;
     qryBenef.FieldByName('FLGVALORTITULAR1').AsInteger := 0;  // Marcos Merola Sol 148463
     qryBenef.FieldByName('FLGVALORTITULAR2').AsInteger := 0;  // Marcos Merola Sol 148463
     qryBenef.FieldByName('FLGVALORTITULAR3').AsInteger := 0;  // Marcos Merola Sol 148463
  end;

end;

procedure TfrmCadPlanPrevCS.bbtnConfirmarClick(Sender: TObject);
var bPerguntaFeita : boolean;
begin
   //  Neste procedimento devemos testar se os campos obrigatorios estão preenchidos
   //TAES - SIG91251 - início
   if OperacaoDetalhe <> opApagar then
     begin
       if Trim(qry.FieldByName('Nome').AsString) = '' then
       begin
         MsgDlg('Nome do Plano não preenchido','Erro',mtError,[mbOk,mbHelp],0);

         Exit;
       end;

       if (prmflgMultiFundacao = True) and (Trim(dblkpcmbFundacao.Text) = '') then
       begin
         MsgDlg('Fundação não preenchida','Erro',mtError,[mbOk,mbHelp],0);

         Exit;
       end;

       if (not bPerguntaFeita) and (Trim(dblkpcmbRegAdmissao.Text) = '') then
       begin
         bPerguntaFeita := True;
         if MsgDlg('Regra de Admissão não preenchida. Deseja cadastrar plano sem Regra de Admissão ?',
                   'Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo then
         begin

           Exit;
         end
       end;

       if (not bPerguntaFeita) and (Trim(dblkpcmbRegDesistencia.Text) = '') then
       begin
         bPerguntaFeita := True;
         if MsgDlg('Regra de Desistência não preenchida. Deseja cadastrar plano sem Regra de Desistência ?',
                   'Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo then
         begin

           Exit;
         end
       end;

       if (not bPerguntaFeita) and (Trim(dblkpcmbRegCancelamento.Text) = '') then
       begin
         bPerguntaFeita := True;

         if MsgDlg('Regra de Cancelamento não preenchida. Deseja cadastrar plano sem Regra de Cancelamento ?',
                   'Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo then
         begin

           Exit;
         end
       end;


       if ( Not IncluiPlanoPrevContabil(qry.FieldByName('IdPlanoPrev').AsInteger,
                                        qry.FieldByName('Nome').AsString) ) then
       begin
           bPerguntaFeita := True;
           if MsgDlg('Erro na criação do Plano Previdenciário Contábil?, Deseja cadastrar plano sem o Plano Pre&videnciário Contábil',
                     'Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo
           then begin
              Exit;
           end
       end;
       // Wylliam Silva Kintana: 1319244 SOL: 159477 - Inicio
       //*Se DBCheckBox11 (Isenção INSS) estiver checado apresentar a messagem abaixo*

        if qryBenef.FieldByName('FLGISENTOIRRF').AsInteger = 1 then
        begin
            MessageDlg('O benefício atual está sendo programado com isenção de IRRF', mtInformation, [mbOK], 0);
        end;
        // Wylliam Silva Kintana: 1319244 SOL: 159477 - Fim
     end;
     //TAES - SIG91251 - fim

   inherited;
end;

procedure TfrmCadPlanPrevCS.sbtnApagarClick(Sender: TObject);
begin
  if not qryDet.IsEmpty
  then begin
     MsgDlg('Apague todas as contribuições do plano antes desta operação','Informação',mtInformation,[mbOk,mbHelp],0);
     sbtnApagar.Down := False;
     Exit;
  end;

  if not qryBenef.IsEmpty
  then begin
     MsgDlg('Apague todos os benefícios do plano antes desta operação','Informação',mtInformation,[mbOk,mbHelp],0);
     sbtnApagar.Down := False;
     Exit;
  end;

  inherited;
end;

procedure TfrmCadPlanPrevCS.dbedNomeExit(Sender: TObject);
begin
  inherited;
  if pgctrlDetalhe.ActivePage = tbsPlano
  then edPaiDetalhe.Text := dbedNome.Text;
end;

procedure TfrmCadPlanPrevCS.dblkpcmbBeneficioCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if pgctrlDetalhe.ActivePage = tbsBenef
  then begin
     edPaiDetalhe.Text := qryBeneficio.FieldByName('Nome').AsString;
     
     if qryBeneficio.FieldByName('FlgDestBenef').AsString <> 'P'
     then dbgrpBenefInf.Visible := True
     else dbgrpBenefInf.Visible := False;
  end;
end;

procedure TfrmCadPlanPrevCS.qryDetAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if pgctrlDetalhe.ActivePage = tbsPlano
  then begin
     edPaiDetalhe.Text := dbedNome.Text;
  end
  else if (pgctrlDetalhe.ActivePage = tbsDet) and (qryDet.Active)
       then begin
          edPaiDetalhe.Text := qryDet.FieldByName('Nome').AsString;
          cmbFinalidade.ItemIndex := qryDet.FieldByName('FlgContingencia').AsInteger;
          case qryDet.FieldByName('FlgContingencia').AsInteger of
                0 : cmbFinalidade.Text := 'Custeio';
                1 : cmbFinalidade.Text := 'Contingência';
                2 : cmbFinalidade.Text := 'Compra de Carência de Tempo';
                3 : cmbFinalidade.Text := 'Parcelamento de Contribuição';
          end;

          if  qryDet.FieldByname('FLGCOBRADECTERC').AsInteger = 1
          then dbgrpCobraUlt13.Visible := True
          else dbgrpCobraUlt13.Visible := False;
       end
       else begin
          if qryBenef.Active
          then edPaiDetalhe.Text := qryBenef.FieldByName('Nome').AsString;
       end;
end;



procedure TfrmCadPlanPrevCS.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  OperacaoDetalhe := opInserir;
end;

procedure TfrmCadPlanPrevCS.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  OperacaoDetalhe := opAlterar;

end;

procedure TfrmCadPlanPrevCS.sbtnExcluiDetClick(Sender: TObject);
begin
  inherited;
  OperacaoDetalhe := opApagar;
end;

procedure TfrmCadPlanPrevCS.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;

  if pgCtrlDetalhe.ActivePage = tbsDet
  then begin
    if qryDet.IsEmpty
    then OperacaoDetalhe := opVazio
    else OperacaoDetalhe := opIdle;
  end
  else if pgCtrlDetalhe.ActivePage = tbsBenef
       then begin
         if qryBenef.IsEmpty
         then OperacaoDetalhe := opVazio
         else OperacaoDetalhe := opIdle;
       end;


end;

procedure TfrmCadPlanPrevCS.pgctrlDetalheChange(Sender: TObject);
begin
  inherited;

  if pgCtrlDetalhe.ActivePage = tbsDet
  then begin
    if qryDet.IsEmpty
    then OperacaoDetalhe := opVazio
    else OperacaoDetalhe := opIdle;
  end
  else if pgCtrlDetalhe.ActivePage = tbsBenef
       then begin
         if qryBenef.IsEmpty
         then OperacaoDetalhe := opVazio
         else OperacaoDetalhe := opIdle;
       end;
end;

procedure TfrmCadPlanPrevCS.bbtnOkDetClick(Sender: TObject);
begin

  if (pgCtrlDetalhe.ActivePage = tbsDet) and
     (qrydet.fieldbyname('FLGCARENCIA').AsInteger = 1)
  then begin


     qryaux.close;
     qryaux.sql.text := ' SELECT IDCONTRIBUICAO, NOME '+
          ' FROM CONTRIBUICAO WHERE IDCONTRIBUICAO IN '+
          ' (SELECT IDCONTRIBUICAO FROM CONTPREV CT '+
          ' WHERE CT.IDPLANOPREV = '''+qrydet.fieldbyname('IDPLANOPREV').AsString+''' AND '+
          ' CT.IDCONTRIBUICAO <> '''+qrydet.fieldbyname('IDCONTRIBUICAO').AsString+''' AND '+
          ' FLGCARENCIA = 1)';
     qryaux.open;

     if not qryaux.isempty then
     begin
        MsgDlg(' A contribuição ('+qryaux.fieldbyname('NOME').AsString+') já foi selecionada como sendo '+
               'a forma de cobrana para compra de carência.',
               'Operação inválida', mtInformation, [mbOk], 0);

        qrydet.fieldbyname('FLGCARENCIA').AsInteger := 0;
        pgctrlDetalhe.activepage := tbsDet;
        pgctrlContPrev.activepage := tbCpCarencia;
        exit;

     end;

  end;

  //Inicio - Helio - SOL Nº 253577/18124 PPM Nº 1299709
  if pgctrlDetalhe.ActivePage = tbsDet then
  begin
         if dbdeDataFimPadrao.Text <> '' then //Helio - SOL Nº 270984 PPM Nº 1345075
         if dbdeDataInicioPadrao.Date >= dbdeDataFimPadrao.Date  then
         begin
              MsgDlg('A Data Fim Padrão deve ser maior que a Data Início Padrão.', '', mtInformation, [mbOk], 0);
              dbdeDataInicioPadrao.SetFocus;
              Exit;
         end;
  end;
  //Fim - Helio - SOL Nº 253577/18124 PPM Nº 1299709

  // edilaine - SOL 253577-17349 / PPM 840966 - inicio
  if pgctrlDetalhe.ActivePage = tbsBenef then
  begin
    {RN09 - Regra de Cálculo do BS e Regra de Cálculo do FAB: Serão obrigatórios o preenchimento dessas
            regras quando o flag "Apresentar os campos Benefício Saldado e FAB no requerimento de benefícios" estiver marcado}
    if (dbchkFlgBSFAB.checked) and
       ((qryBenef.fieldbyname('IDREGRACALCBS').AsString = '') or (qryBenef.fieldbyname('IDREGRACALCFAB').AsString = '')) then
    begin
      MsgDlg('É necessário preencher as regras de cálculo do BS e FAB na aba Regras de Cálculo.', '', mtInformation, [mbOk], 0);
      Exit;
    end;

    {RN09 - Regra de Cálculo da Base do Déficit: Será obrigatório o preenchimento da regra quando o flag
            "Apresentar o campo Base de Cálculo do Déficit no requerimento de benefícios" estiver marcado }
    if (dbchkFlgBCDeficit.checked) and (qryBenef.fieldbyname('IDREGRACALCBASEDEFICIT').AsString = '') then
    begin
      MsgDlg('É necessário preencher as regras de cálculo da Base do Déficit na aba Regras de Cálculo.', '', mtInformation, [mbOk], 0);
      Exit;
    end;
    
    // Felipe A. Santos - SOL 258357/17801 PPM 1083052 - início
    if not (VerificaRRA) then
    begin
      MsgDlg('Informe todas as Rubricas de RRA.', 'Aviso', mtInformation, [mbOk], 0);
      pgctrlBenef.ActivePage := tbsRubBenef;
      pgcRubBenef.ActivePage := tabRRA;
      Exit;
    end;
    // Felipe A. Santos - SOL 258357/17801 PPM 1083052 - fim


  end;
 // edilaine - SOL 253577-17349 / PPM 840966 - fim

 
  //edilaine - SIG24483 : inicio
  if pgCtrlDetalhe.ActivePage = tsIsencaoiRAcJud then
  begin
    if dblkRubIsentaIRAcJud.text = '' then
    begin
      MsgDlg('Informe a Rubrica Isenta.', 'Aviso', mtInformation, [mbOk], 0);
      dblkRubIsentaIRAcJud.setfocus;
      Exit;
    end;

    if dblkRubIncideIRAcJud.text = '' then
    begin
      MsgDlg('Informe a Rubrica com Incidência de IR.', 'Aviso', mtInformation, [mbOk], 0);
      dblkRubIncideIRAcJud.setfocus;
      Exit;
    end;

    if VerificaDuplicidadeRubIsenta() then
    begin
      MsgDlg('Parametrização duplicada.', 'Aviso', mtInformation, [mbOk], 0);
      Exit;
    end;
  end;
  //edilaine - SIG24483 : fim


  inherited;

  if pgCtrlDetalhe.ActivePage = tbsDet
  then begin
    if qryDet.IsEmpty
    then OperacaoDetalhe := opVazio
    else OperacaoDetalhe := opIdle;
  end
  else if pgCtrlDetalhe.ActivePage = tbsBenef
       then begin
         if qryBenef.IsEmpty
         then OperacaoDetalhe := opVazio
         else OperacaoDetalhe := opIdle;
       end;

end;

procedure TfrmCadPlanPrevCS.qryBenefAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if pgctrlDetalhe.ActivePage = tbsPlano
  then begin
     edPaiDetalhe.Text := dbedNome.Text;
  end
  else if (pgctrlDetalhe.ActivePage = tbsDet) and (qryDet.Active)
       then begin
          edPaiDetalhe.Text := qryDet.FieldByName('Nome').AsString;
       end
       else begin
          if qryBenef.Active
          then edPaiDetalhe.Text := qryBenef.FieldByName('Nome').AsString;
       end;

  tbsBenefPlano2.TabVisible   := (qryBenef.FieldByName('FLGREFERENCIA').AsInteger <> 1) or (qryBenef.FieldByName('FLGPAGAINSS').AsInteger = 1);
  tbsBenefPlano3.TabVisible   := (qryBenef.FieldByName('FLGPOSSUIABONO').AsInteger = 1) and
                                 ((qryBenef.FieldByName('FLGREFERENCIA').AsInteger <> 1) or
                                  (qryBenef.FieldByName('FLGPAGAINSS').AsInteger = 1) );

  tbsBenefExcecao.TabVisible := (qryBenef.FieldByName('FLGREFERENCIA').AsInteger <> 1) or
                                (qryBenef.FieldByName('FLGPAGAINSS').AsInteger = 1);

  
  dValorLimiteAntes     := qryBenef.FieldByName('LIMITEALT').AsFloat;
  dPercLimiteAntes      := qryBenef.FieldByName('PERCENTUALALT').AsFloat;
  iIdUsuarioLimiteAntes := qryBenef.FieldByName('USUARIOALT').AsInteger;
end;

procedure TfrmCadPlanPrevCS.dbchkBenefReferenciaClick(Sender: TObject);
begin
  inherited;
  tbsBenefPlano2.TabVisible := (not dbchkBenefReferencia.Checked ) or (dbchBxPagaInss.Checked);
  tbsBenefPlano3.TabVisible := (dbchkPossuiAbono.Checked) and
                               ((not dbchkBenefReferencia.Checked) or (dbchBxPagaInss.Checked));
  tbsBenefExcecao.TabVisible := (not dbchkBenefReferencia.Checked ) or (dbchBxPagaInss.Checked);

  // edilaine - SOL 253577-17349 / PPM 840966 - inicio
  {RN08 - O sistema só deverá apresentar esse campo para marcação quando o benefício selecionado for de fonte pagadora Funcef
          (FLGREFERENCIA = 0 ou NULL da estrutura BENEFPLANPREV)}
  gbDeficit.Visible := (not dbchkBenefReferencia.Checked);
  if not gbDeficit.Visible then
  begin
    dbchkFlgBCDeficit.checked := false;
    dbchkFlgBSFAB.checked     := false;
  end;
  // edilaine - SOL 253577-17349 / PPM 840966 - fim


  DbChBxPagaInss.Visible := dbchkBenefReferencia.Checked;
  If dbchkBenefReferencia.Checked = False Then
    DbChBxPagaInss.Checked := False;
end;

procedure TfrmCadPlanPrevCS.DbChBxPagaInssClick(Sender: TObject);
begin
  inherited;
  tbsBenefPlano2.TabVisible := (not dbchkBenefReferencia.Checked ) or (dbchBxPagaInss.Checked);
  tbsBenefPlano3.TabVisible := (dbchkPossuiAbono.Checked) and
                               ((not dbchkBenefReferencia.Checked) or (dbchBxPagaInss.Checked));
  tbsBenefExcecao.TabVisible := (not dbchkBenefReferencia.Checked ) or (dbchBxPagaInss.Checked);
end;

procedure TfrmCadPlanPrevCS.dblkpcmbRelatBarraCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if Trim(dblkpcmbRelatBarra.Text) <> ''
  then qryBenef.FieldByName('OrigemCMBeneficio').AsInteger := qryRelatorios.FieldByName('OrigemCM').AsInteger
  else qryBenef.FieldByName('OrigemCMBeneficio').AsString  := '';
end;

procedure TfrmCadPlanPrevCS.FormShow(Sender: TObject);
begin
  inherited;
  pgctrlPlanos.ActivePage := tbsPlanoInfPrincipais;
  MontaSelect.Filtro.Add(' PLANPREV.IDPLANOPREV IN (SELECT PLP.IDPLANOPREV FROM PLANPREVPATRO PLP, PATRO P '+
                         '                          WHERE   P.IDFUNDACAO = '+IntToStr(iIdFundacao)          +
                         '                          AND     PLP.IDPESSJUR = P.IDPESSOA ) OR                 '+
                         ' NOT EXISTS (SELECT 1 FROM PLANPREVPATRO PLP WHERE PLP.IDPLANOPREV = PLANPREV.IDPLANOPREV) ');
end;

procedure TfrmCadPlanPrevCS.sbtnNormaRelatBeneficioClick(Sender: TObject);
begin
  inherited;
  with frmMostraAux do
  begin
     Caption := 'Norma para Relatório de Simulação de Benefício';
     memResult.Lines.Clear;
     memResult.Lines.Add(' ');
     memResult.Lines.Add(' ');
     memResult.Lines.Add(' ');
     memResult.Lines.Add(' A consulta deste relatório, cadastrada no Gerador de Relatórios, deve conter '+
                         ' como uma das tabelas de seleção a tabela DETCALCULO, com este nome. ');
     memResult.Lines.Add(' Além disto, esta consulta não pode conter ordenação (ORDER BY) ou agrupamento '+
                         ' (GROUP BY). ');
     ShowModal;
  end;
end;


procedure TfrmCadPlanPrevCS.qryBeforePost(DataSet: TDataSet);
begin
  if qry.State = dsInsert
  then begin
     try
       
       
       
     except
       raise;
     end;
  end;
end;

procedure TfrmCadPlanPrevCS.dbchkCobraDecTercClick(Sender: TObject);
begin
  inherited;
  dbgrpCobraUlt13.Visible := dbchkCobraDecTerc.Checked;

  if not dbchkCobraDecTerc.Checked then dbgrpCobraUlt13.ItemIndex := 0;
end;

procedure TfrmCadPlanPrevCS.tbcDetalheChange(Sender: TObject);
Var sContribBenef:String;
begin
  inherited;

  If pgctrlDetalhe.ActivePage = tbsDet then
  Begin
     edPaiDetalhe.Text := qryContribuicao.FieldByName('Nome').AsString;
     sContribBenef := 'B'
  End
  Else
    If pgctrlDetalhe.ActivePage = tbsBenef then
    Begin
      edPaiDetalhe.Text := qryBeneficio.FieldByName('Nome').AsString;
      sContribBenef := 'C';
    End;

   

   
   QryDescontoNormal.Close;
   QryDescontoNormal.SQL.Text    := AlteraQueryRubricas(qryDet.FieldByName('FLGPAGADOR').AsString, 'D', sContribBenef, 'N');
   QryDescontoNormal.Open;

   QryDescontoAtraso.Close;
   QryDescontoAtraso.SQL.Text    := AlteraQueryRubricas(qryDet.FieldByName('FLGPAGADOR').AsString, 'D', sContribBenef, 'A');
   QryDescontoAtraso.Open;

   QryDescontoDevolucao.Close;
   QryDescontoDevolucao.SQL.Text := AlteraQueryRubricas(qryDet.FieldByName('FLGPAGADOR').AsString, 'D', sContribBenef, 'D');
   QryDescontoDevolucao.Open;

   
   QryProventoNormal.Close;
   QryProventoNormal.SQL.Text    := AlteraQueryRubricas(qryDet.FieldByName('FLGPAGADOR').AsString, 'P', sContribBenef, 'N');
   QryProventoNormal.Open;

   QryProventoAtraso.Close;
   QryProventoAtraso.SQL.Text    := AlteraQueryRubricas(qryDet.FieldByName('FLGPAGADOR').AsString, 'P', sContribBenef, 'A');
   QryProventoAtraso.Open;

   QryProventoDevolucao.Close;
   QryProventoDevolucao.SQL.Text := AlteraQueryRubricas(qryDet.FieldByName('FLGPAGADOR').AsString, 'P', sContribBenef, 'D');
   QryProventoDevolucao.Open;

   //edilaine - SIG36752 - inicio
   QryProventoAcerto.close;
   QryProventoAcerto.open;
   //edilaine - SIG36752 - fim

end;

procedure TfrmCadPlanPrevCS.BtPesquisaRubricaClick(Sender: TObject);
begin
  inherited;
  dblkpcmbRubAbono.Text := SelecionaRubrica(MsProventoNormal);  
  dblkpcmbRubAbono.PerformSearch;
end;

Function TfrmCadPlanPrevCS.SelecionaRubrica(MontaSelect : TMontaSelect): String;
begin
  MontaSelect.Executar;
  If MontaSelect.RetornouValor Then Begin
    Result := MontaSelect.ValoresChave[1];
  End;

end;

procedure TfrmCadPlanPrevCS.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  dblkpcmbRubAntecAbono.Text := SelecionaRubrica(MsProventoNormal);  
  dblkpcmbRubAntecAbono.PerformSearch;

end;

procedure TfrmCadPlanPrevCS.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  wwDBLookupCombo7.Text := SelecionaRubrica(MsProvento);
  wwDBLookupCombo7.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  dblkpcmbRubricaBenefNormal.Text := SelecionaRubrica(MsProventoNormal);
  dblkpcmbRubricaBenefNormal.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  dblkpcmbRubAbonoAcJud.Text := SelecionaRubrica(MsProventoNormal);
  dblkpcmbRubAbonoAcJud.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  dblkpcmbRubricaBenefPagAd.Text := SelecionaRubrica(MsProventoNormal);
  dblkpcmbRubricaBenefPagAd.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  dblkpcmbRubricaBenefAtraso.Text := SelecionaRubrica(MsProventoAtraso);
  dblkpcmbRubricaBenefAtraso.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  dblkpcmbRubricaBenefDevol.Text := SelecionaRubrica(MsDescontoDevolucao);
  dblkpcmbRubricaBenefDevol.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  dblkpcmbRubricaBenefDevAd.Text := SelecionaRubrica(MsDescontoDevolucao);
  dblkpcmbRubricaBenefDevAd.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  wwDBLookupCombo6.Text := SelecionaRubrica(MsDescontoDevolucao);  
  wwDBLookupCombo6.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  dblkpcmbRubAtraso.Text := SelecionaRubrica(MsProventoAtraso); 
  dblkpcmbRubAtraso.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.SpeedButton11Click(Sender: TObject);
begin
  inherited;
  wwDBLookupCombo10.Text := SelecionaRubrica(MsDescontoDevolucao); 
  wwDBLookupCombo10.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.tbsContPrev3Show(Sender: TObject);
begin
  inherited;
  pgcRubricas.ActivePage := tbsRubNormais;  
end;

procedure TfrmCadPlanPrevCS.tbsRubBenefShow(Sender: TObject);
begin
  inherited;
  pgcRubBenef.ActivePage := tbsBenRubNorm;
end;

procedure TfrmCadPlanPrevCS.SpeedButton14Click(Sender: TObject);
begin
  inherited;
  dblkpcmbRubricaBenefNormalJud.Text := SelecionaRubrica(MsProventoNormal);
  dblkpcmbRubricaBenefNormalJud.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.SpeedButton16Click(Sender: TObject);
begin
  inherited;
  dblkpcmbRubricaBenefAtrasoJud.Text := SelecionaRubrica(MsProventoAtraso);
  dblkpcmbRubricaBenefAtrasoJud.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.SpeedButton17Click(Sender: TObject);
begin
  inherited;
  dblkpcmbRubricaBenefDevolJud.Text := SelecionaRubrica(MsDescontoDevolucao);
  dblkpcmbRubricaBenefDevolJud.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.SpeedButton15Click(Sender: TObject);
begin
  inherited;
  dblkpcmbRubAtrasoAbonoAcJud.Text := SelecionaRubrica(MsProventoAtraso); 
  dblkpcmbRubAtrasoAbonoAcJud.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.SpeedButton12Click(Sender: TObject);
begin
  inherited;
  dblkpcmbRubricaBenefPagAdJud.Text := SelecionaRubrica(MsProventoNormal);
  dblkpcmbRubricaBenefPagAdJud.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.SpeedButton13Click(Sender: TObject);
begin
  inherited;
  dblkpcmbRubricaBenefDevAdJud.Text := SelecionaRubrica(MsDescontoDevolucao);
  dblkpcmbRubricaBenefDevAdJud.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.dbedValorLimiteEnter(Sender: TObject);
begin
  inherited;
  dValorLimiteAntes     := qryBenef.FieldByName('LIMITEALT').AsFloat; 


end;

procedure TfrmCadPlanPrevCS.dbedPercLimiteEnter(Sender: TObject);
begin
  inherited;
  dPercLimiteAntes      := qryBenef.FieldByName('PERCENTUALALT').AsFloat; 
end;

procedure TfrmCadPlanPrevCS.dblkpcmbUsuarioLimiteEnter(Sender: TObject);
begin
  inherited;
  iIdUsuarioLimiteAntes := qryBenef.FieldByName('USUARIOALT').AsFloat; 
end;


procedure TfrmCadPlanPrevCS.InsereBenefPlanPatro(piIdPlanoPrev,
  piIdBeneficio: Integer);
Var
  sSql : String;
begin
  sSql := ' SELECT P.IDPESSJUR'+
          ' FROM PLANPREVPATRO P'+
          ' WHERE P.IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+
          '   AND NOT EXISTS (SELECT 1'+
          '                   FROM BENEFPLANPATRO B'+
          '                   WHERE B.IDPLANOPREV  = P.IDPLANOPREV'+
          '                     AND B.IDPESSJUR    = P.IDPESSJUR'+
          '                     AND B.IDBENEFICIO  = '+IntToStr(piIdBeneficio)+')';

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(sSql);
  qryAux.Open;

  While Not qryAux.Eof do
   Begin
     qryBenefPPatro.Insert;
     qryBenefPPatro.FieldByName('IDPLANOPREV').AsInteger := piIdPlanoPrev;
     qryBenefPPatro.FieldByName('IDPESSJUR').AsInteger   := qryAux.FieldByName('IDPESSJUR').AsInteger;
     qryBenefPPatro.FieldByName('IDBENEFICIO').AsInteger := piIdBeneficio;
     qryBenefPPatro.Post;

     qryAux.Next;
   End;
end;

procedure TfrmCadPlanPrevCS.InsereContPlanPatro(piIdPlanoPrev, piIdContribuicao: Integer);
Var
  sSql : String;
begin
  sSql := ' SELECT P.IDPESSJUR'+
          ' FROM PLANPREVPATRO P'+
          ' WHERE P.IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+
          '   AND NOT EXISTS (SELECT 1'+
          '                   FROM CONTPLANPATRO C'+
          '                   WHERE C.IDPLANOPREV    = P.IDPLANOPREV'+
          '                     AND C.IDPESSJUR      = P.IDPESSJUR'+
          '                     AND C.IDCONTRIBUICAO = '+IntToStr(piIdContribuicao)+')';

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(sSql);
  qryAux.Open;

  While Not qryAux.Eof do
   Begin
     qryContPPatro.Insert;
     qryContPPatro.FieldByName('IDPLANOPREV').AsInteger    := piIdPlanoPrev;
     qryContPPatro.FieldByName('IDPESSJUR').AsInteger      := qryAux.FieldByName('IDPESSJUR').AsInteger;
     qryContPPatro.FieldByName('IDCONTRIBUICAO').AsInteger := piIdContribuicao;
     qryContPPatro.Post;

     qryAux.Next;
   End;
end;


procedure TfrmCadPlanPrevCS.SpeedButton19Click(Sender: TObject);
begin
  inherited;
  dblkpcmbRubDevolAntecAbono.Text := SelecionaRubrica(MsDescontoDevolucao); 
  dblkpcmbRubDevolAntecAbono.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.SpeedButton18Click(Sender: TObject);
begin
  inherited;
  dblkpcmbRubAtrasoAntecAbono.Text := SelecionaRubrica(MsProventoAtraso);  
  dblkpcmbRubAtrasoAntecAbono.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.SpeedButton23Click(Sender: TObject);
begin
  inherited;
  dblkpcmbRubricaDevRevisao.Text := SelecionaRubrica(MsDescontoDevolucao); 
  dblkpcmbRubricaDevRevisao.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.SpeedButton22Click(Sender: TObject);
begin
  inherited;
  dblkpcmbRubricaAtrasoRevisao.Text := SelecionaRubrica(MsProventoAtraso);  
  dblkpcmbRubricaAtrasoRevisao.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.SpeedButton21Click(Sender: TObject);
begin
  inherited;
  dblkpcmbRubricaRevisao.Text := SelecionaRubrica(MsProventoNormal);
  dblkpcmbRubricaRevisao.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.SpeedButton26Click(Sender: TObject);
begin
  inherited;
  dblkpcmbRubDevAbonoAcJud.Text := SelecionaRubrica(MsDescontoDevolucao);
  dblkpcmbRubDevAbonoAcJud.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.SpeedButton20Click(Sender: TObject);
begin
  inherited;
  dblkpcmbRubRevisaoAcJud.Text := SelecionaRubrica(MsProventoNormal); 
  dblkpcmbRubRevisaoAcJud.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.SpeedButton24Click(Sender: TObject);
begin
  inherited;
  dblkpcmbRubAtrasoRevisaoAcJud.Text := SelecionaRubrica(MsProventoAtraso); 
  dblkpcmbRubAtrasoRevisaoAcJud.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.SpeedButton25Click(Sender: TObject);
begin
  inherited;
  dblkpcmbRubDevRevisaoAcJud.Text := SelecionaRubrica(MsDescontoDevolucao);
  dblkpcmbRubDevRevisaoAcJud.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.SpeedButton27Click(Sender: TObject);
begin
  inherited;
  dblkpcmbRubricaQuitaAuto.Text := SelecionaRubrica(MsProventoNormal);
  dblkpcmbRubricaQuitaAuto.PerformSearch;
end;


procedure TfrmCadPlanPrevCS.SpeedButton28Click(Sender: TObject);
begin
  inherited;
  dblkpcmbRubJudAdicBenefNormal.Text := SelecionaRubrica(MsProventoNormal);
  dblkpcmbRubJudAdicBenefNormal.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.SpeedButton29Click(Sender: TObject);
begin
  inherited;
  dblkpcmbRubJudAdicBenefAtraso.Text := SelecionaRubrica(MsProventoAtraso);  
  dblkpcmbRubJudAdicBenefAtraso.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.SpeedButton30Click(Sender: TObject);
begin
  inherited;
  dblkpcmbRubJudAdicBenefDevol.Text := SelecionaRubrica(MsDescontoDevolucao);  
  dblkpcmbRubJudAdicBenefDevol.PerformSearch;
end;




Function TfrmCadPlanPrevCS.AlteraQueryRubricas(psFlgPagadora, psTipo,
                                               psContribBenef, psFlgAtrasODevol: String):String;
Var
   sSQL : String;
begin
  ;

  sSQL := ' SELECT ' + #13 +
          '   IDPROVENTO,DESCRICAO, CODPROVDESC ' + #13 +
          ' FROM ' + #13 +
          '  PROVDESC ' + #13 +
          ' WHERE ' + #13;

   If psFlgPagadora = 'P' Then
  Begin
    If psTipo = 'P' Then
      sSQL := sSQL + '       (FLGDESCONTO    IN (0, 2)) ' + #13
    Else
      sSQL := sSQL + '       (FLGDESCONTO    IN (1, 2)) ' + #13;
  End
  Else
  Begin
    If psTipo = 'P' Then
      sSQL := sSQL + '       (FLGDESCONTO    = 0) ' + #13
   Else
      sSQL := sSQL + '       (FLGDESCONTO    = 1) ' + #13;
  End;

  sSQL := sSQL + '   AND (FLGATRASODEVOL = ' + QuotedStr(psFlgAtrasODevol) + ') ' + #13;

  
  If psTipo = 'P' Then
    sSQL := sSQL + '   AND (NVL(PROVDESC.FLGESTADORUB,0) <> 2) ' + #13;
  

  If psContribBenef = 'C' Then
    sSQL := sSQL + '   AND ((FLGTPRUBRICA LIKE ''%B%'') OR (FLGTPRUBRICA LIKE ''%P%'') ) ' + #13
  Else
    sSQL := sSQL + '   AND (FLGTPRUBRICA LIKE ''%B%'') ' + #13;

  sSQL := sSQL + ' ORDER BY ' + #13 +
                 '   DESCRICAO';

  Result := sSQL;

end;


function TfrmCadPlanPrevCS.IncluiPlanoPrevContabil(piIdPlanoPrev: Integer;
  psNomePlano: String):Boolean;
begin
  Result := True;

  Try
    qryIncPlanoPrevContabil.ParamByName('IDPLANOPREV').AsInteger     := piIdPlanoPrev;
    qryIncPlanoPrevContabil.ParamByName('NOME').AsString             := psNomePlano;
    qryIncPlanoPrevContabil.ExecSQL;
  except
    //leandro sig135968 - inicio
    on E:Exception  do
    begin
      if POS('Key violation',e.Message) = 0 then
        Result := False;
    end;

    //Result := False;
    //leandro sig135968 - fim
  End;
end;


procedure TfrmCadPlanPrevCS.sbtnOpcoesTextoBenefClick(
  Sender: TObject);
var
  sRegraOp1, sRegraOp2, sRegraOp3,
  sRegraCalcOp1, sRegraCalcOp2, sRegraCalcOp3,
  sNumOpcoesBenef, sNomeValorBase1Benef, sNomeValorBase2Benef,
  sNomeValorBase3Benef : string;
  iIdRegraBenefOp1, iIdRegraBenefOp2, iIdRegraBenefOp3,
  iIdRegraCalcBenefOp1, iIdRegraCalcBenefOp2, iIdRegraCalcBenefOp3 : longint;
  ilFlgObrigaOp1, ilFlgObrigaOp2, ilFlgObrigaOp3,
  ilFlgAlteraOp1, ilFlgAlteraOp2, ilFlgAlteraOp3 : integer;
begin
  inherited;
  ilFlgObrigaOp1 := 0;
  ilFlgObrigaOp2 := 0;
  ilFlgObrigaOp3 := 0;

  ilFlgAlteraOp1 := 0;
  ilFlgAlteraOp2 := 0;
  ilFlgAlteraOp3 := 0;
  

  // Preencher regras de validacao se já houverem
  if qryBenef.FieldByName('IdRegraValidaOpTexto1').AsString <> ''
  then begin
     if qryRegra.Locate('IdRegra', qryBenef.Fieldbyname('IdRegraValidaOpTexto1').AsInteger,[loCaseInsensitive,loPartialKey])
     then sRegraOp1 := qryRegra.FieldbyName('NomeRegra').AsString
     else sRegraOp1 := '';
  end;

  if qryBenef.FieldByName('IdRegraValidaOpTexto2').AsString <> ''
  then begin
     if qryRegra.Locate('IdRegra', qryBenef.Fieldbyname('IdRegraValidaOpTexto2').AsInteger,[loCaseInsensitive,loPartialKey])
     then sRegraOp2 := qryRegra.FieldbyName('NomeRegra').AsString
     else sRegraOp2 := '';
  end;

  if qryBenef.FieldByName('IdRegraValidaOpTexto3').AsString <> ''
  then begin
     if qryRegra.Locate('IdRegra', qryBenef.Fieldbyname('IdRegraValidaOpTexto3').AsInteger,[loCaseInsensitive,loPartialKey])
     then sRegraOp3 := qryRegra.FieldbyName('NomeRegra').AsString
     else sRegraOp3 := '';
  end;

  // Preencher regras de Calculo se já houverem
  if qryBenef.FieldByName('IDREGRACALCOPTEXTO1').AsString <> ''
  then begin
     if qryRegra.Locate('IDREGRA', qryBenef.Fieldbyname('IDREGRACALCOPTEXTO1').AsInteger,[loCaseInsensitive,loPartialKey])
     then sRegraCalcOp1 := qryRegra.FieldbyName('NOMEREGRA').AsString
     else sRegraCalcOp1 := '';
  end;

  if qryBenef.FieldByName('IDREGRACALCOPTEXTO2').AsString <> ''
  then begin
     if qryRegra.Locate('IDREGRA', qryBenef.Fieldbyname('IDREGRACALCOPTEXTO2').AsInteger,[loCaseInsensitive,loPartialKey])
     then sRegraCalcOp2 := qryRegra.FieldbyName('NOMEREGRA').AsString
     else sRegraCalcOp2 := '';
  end;

  if qryBenef.FieldByName('IDREGRACALCOPTEXTO3').AsString <> ''
  then begin
     if qryRegra.Locate('IDREGRA', qryBenef.Fieldbyname('IDREGRACALCOPTEXTO3').AsInteger,[loCaseInsensitive,loPartialKey])
     then sRegraCalcOp3 := qryRegra.FieldbyName('NOMEREGRA').AsString
     else sRegraCalcOp3 := '';
  end;


  frmPedeOpcoesTextoBenef := TfrmPedeOpcoesTextoBenef.Create(Application);

  with frmPedeOpcoesTextoBenef do
  begin
    edPlano.Text     := dbedNome.Text;
    edBeneficio.Text := dblkpcmbBeneficio.Text;

    if qryBenef.FieldByName('NUMOPCOESTEXTO').AsString <> '' then
       spedNumOpcoesBenef.Text := qryBenef.FieldByName('NUMOPCOESTEXTO').AsString
    else
       spedNumOpcoesBenef.Text := '1';

    if qryBenef.FieldByName('NOMECAMPOTEXTO1').AsString <> '' then
       edNomeValorBase1.Text := qryBenef.FieldByName('NOMECAMPOTEXTO1').AsString;

    if qryBenef.FieldByName('NOMECAMPOTEXTO2').AsString <> '' then
       edNomeValorBase2.Text := qryBenef.FieldByName('NOMECAMPOTEXTO2').AsString;

    if qryBenef.FieldByName('NOMECAMPOTEXTO3').AsString <> '' then
       edNomeValorBase3.Text := qryBenef.FieldByName('NOMECAMPOTEXTO3').AsString;

    iFlgObrigaOp1  := qryBenef.FieldByName('FLGOBRIGAOPTEXTO1').AsInteger;
    iFlgObrigaOp2  := qryBenef.FieldByName('FLGOBRIGAOPTEXTO2').AsInteger;
    iFlgObrigaOp3  := qryBenef.FieldByName('FLGOBRIGAOPTEXTO3').AsInteger;

    iFlgAlteraOp1  := qryBenef.FieldByName('FLGEDITAOPTEXTO1').AsInteger;
    iFlgAlteraOp2  := qryBenef.FieldByName('FLGEDITAOPTEXTO2').AsInteger;
    iFlgAlteraOp3  := qryBenef.FieldByName('FLGEDITAOPTEXTO3').AsInteger;


    lcsRegraOp1 := sRegraOp1;
    lcsRegraOp2 := sRegraOp2;
    lcsRegraOp3 := sRegraOp3;

    stRegraCalcOp1 := sRegraCalcOp1;
    stRegraCalcOp2 := sRegraCalcOp2;
    stRegraCalcOp3 := sRegraCalcOp3;

    ShowModal;

    sNumOpcoesBenef      := spedNumOpcoesBenef.Text;
    sNomeValorBase1Benef := edNomeValorBase1.Text;
    sNomeValorBase2Benef := edNomeValorBase2.Text;
    sNomeValorBase3Benef := edNomeValorBase3.Text;

    ilFlgObrigaOp1 := iFlgObrigaOp1;
    ilFlgObrigaOp2 := iFlgObrigaOp2;
    ilFlgObrigaOp3 := iFlgObrigaOp3;

    ilFlgAlteraOp1 := iFlgAlteraOp1;
    ilFlgAlteraOp2 := iFlgAlteraOp2;
    ilFlgAlteraOp3 := iFlgAlteraOp3;

    iIdRegraBenefOp1 := lcRegraOp1;
    iIdRegraBenefOp2 := lcRegraOp2;
    iIdRegraBenefOp3 := lcRegraOp3;

    iIdRegraCalcBenefOp1 := iRegraCalcOp1;
    iIdRegraCalcBenefOp2 := iRegraCalcOp2;
    iIdRegraCalcBenefOp3 := iRegraCalcOp3;
  end;
  frmPedeOpcoesTextoBenef.Free;

  if Trim(sNumOpcoesBenef) <> ''
  then begin
     qryBenef.FieldByName('NUMOPCOESTEXTO').AsString       := sNumOpcoesBenef;

     qryBenef.FieldByName('NOMECAMPOTEXTO1').AsString  := sNomeValorBase1Benef;
     qryBenef.FieldByName('NOMECAMPOTEXTO2').AsString  := sNomeValorBase2Benef;
     qryBenef.FieldByName('NOMECAMPOTEXTO3').AsString  := sNomeValorBase3Benef;

     qryBenef.FieldByName('FLGOBRIGAOPTEXTO1').AsInteger   := ilFlgObrigaOp1;
     qryBenef.FieldByName('FLGOBRIGAOPTEXTO2').AsInteger   := ilFlgObrigaOp2;
     qryBenef.FieldByName('FLGOBRIGAOPTEXTO3').AsInteger   := ilFlgObrigaOp3;

     qryBenef.FieldByName('FLGEDITAOPTEXTO1').AsInteger    := ilFlgAlteraOp1;
     qryBenef.FieldByName('FLGEDITAOPTEXTO2').AsInteger    := ilFlgAlteraOp2;
     qryBenef.FieldByName('FLGEDITAOPTEXTO3').AsInteger    := ilFlgAlteraOp3;


     if iIdRegraBenefOp1 > 0
     then qryBenef.FieldByName('IDREGRAVALIDAOPTEXTO1').AsInteger := iIdRegraBenefOp1
     else qryBenef.FieldByName('IDREGRAVALIDAOPTEXTO1').AsString  := '';

     if iIdRegraBenefOp2 > 0
     then qryBenef.FieldByName('IDREGRAVALIDAOPTEXTO2').AsInteger := iIdRegraBenefOp2
     else qryBenef.FieldByName('IDREGRAVALIDAOPTEXTO2').AsString  := '';

     if iIdRegraBenefOp3 > 0
     then qryBenef.FieldByName('IDREGRAVALIDAOPTEXTO3').AsInteger := iIdRegraBenefOp3
     else qryBenef.FieldByName('IDREGRAVALIDAOPTEXTO3').AsString  := '';

     if iIdRegraCalcBenefOp1 > 0
     then qryBenef.FieldByName('IDREGRACALCOPTEXTO1').AsInteger := iIdRegraCalcBenefOp1
     else qryBenef.FieldByName('IDREGRACALCOPTEXTO1').AsString  := '';

     if iIdRegraCalcBenefOp2 > 0
     then qryBenef.FieldByName('IDREGRACALCOPTEXTO2').AsInteger := iIdRegraCalcBenefOp2
     else qryBenef.FieldByName('IDREGRACALCOPTEXTO2').AsString  := '';

     if iIdRegraCalcBenefOp3 > 0
     then qryBenef.FieldByName('IDREGRACALCOPTEXTO3').AsInteger := iIdRegraCalcBenefOp3
     else qryBenef.FieldByName('IDREGRACALCOPTEXTO3').AsString  := '';
  end
  else begin
     qryBenef.FieldByName('NUMOPCOESTEXTO').AsInteger       := 0;
     qryBenef.FieldByName('FLGOPCAOTEXTO').AsInteger  := 0;
     qryBenef.FieldByName('NOMECAMPOTEXTO1').AsString   := '';
     qryBenef.FieldByName('NOMECAMPOTEXTO2').AsString   := '';
     qryBenef.FieldByName('NOMECAMPOTEXTO3').AsString   := '';
     qryBenef.FieldByName('IDREGRAVALIDAOPTEXTO1').AsString := '';
     qryBenef.FieldByName('IDREGRAVALIDAOPTEXTO2').AsString := '';
     qryBenef.FieldByName('IDREGRAVALIDAOPTEXTO3').AsString := '';
     qryBenef.FieldByName('IDREGRACALCOPTEXTO1').AsString   := '';
     qryBenef.FieldByName('IDREGRACALCOPTEXTO2').AsString   := '';
     qryBenef.FieldByName('IDREGRACALCOPTEXTO3').AsString   := '';
     qryBenef.FieldByName('FLGOBRIGAOPTEXTO1').AsInteger    := 0;
     qryBenef.FieldByName('FLGOBRIGAOPTEXTO2').AsInteger    := 0;
     qryBenef.FieldByName('FLGOBRIGAOPTEXTO3').AsInteger    := 0;
     qryBenef.FieldByName('FLGEDITAOPTEXTO1').AsInteger     := 0;
     qryBenef.FieldByName('FLGEDITAOPTEXTO2').AsInteger     := 0;
     qryBenef.FieldByName('FLGEDITAOPTEXTO3').AsInteger     := 0;
  end;
end;

procedure TfrmCadPlanPrevCS.dbchkAceitarOpTextoBenefClick(Sender: TObject);
begin
  inherited;
  sbtnOpcoesTextoBenef.Visible := (dbchkAceitarOpTextoBenef.Checked);
end;

procedure TfrmCadPlanPrevCS.btnNPagtoClick(Sender: TObject);
begin
  inherited;
  { // Felipe A. Santos - SOL 258357/17801 PPM 1083052 - início
  cboNPagto.Text := SelecionaRubrica(MsProvDescN);
  cboNPagto.PerformSearch;}
  // Felipe A. Santos - SOL 258357/17801 PPM 1083052 - fim
end;

procedure TfrmCadPlanPrevCS.btnNPagtoAtrasadoClick(Sender: TObject);
begin
  inherited;
  cboNPagtoAtrasado.Text := SelecionaRubrica(MsProvDescA);
  cboNPagtoAtrasado.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.btnNPagtoDevolClick(Sender: TObject);
begin
  inherited;
  cboNPagtoDevol.Text := SelecionaRubrica(MsProvDescD);
  cboNPagtoDevol.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.btnRPagtoClick(Sender: TObject);
begin
  inherited;
  // Felipe A. Santos - SOL 258357/17801 PPM 1083052 - início
  {cboRPagto.Text := SelecionaRubrica(MsProvDescN);
  cboRPagto.PerformSearch;}
  // Felipe A. Santos - SOL 258357/17801 PPM 1083052 - fim
end;

procedure TfrmCadPlanPrevCS.btnRPagtoAtrasadoClick(Sender: TObject);
begin
  inherited;
  cboRPagtoAtrasado.Text := SelecionaRubrica(MsProvDescA);
  cboRPagtoAtrasado.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.btnRPagtoDevolClick(Sender: TObject);
begin
  inherited;
  cboRPagtoDevol.Text := SelecionaRubrica(MsProvDescD);
  cboRPagtoDevol.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.SpeedButton31Click(Sender: TObject); ///SOL205322  KINTANA 1996527
begin
  inherited;
  cboNPagto_B.Text := SelecionaRubrica(MsProvDescN_B);
  cboNPagto_B.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.SpeedButton32Click(Sender: TObject); ///SOL205322  KINTANA 1996527
begin
  inherited;
  cboNPagtoAtrasado_B.Text := SelecionaRubrica(MsProvDescA_B);
  cboNPagtoAtrasado_B.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.SpeedButton33Click(Sender: TObject); ///SOL205322  KINTANA 1996527
begin
  inherited;
  cboNPagtoDevol_B.Text := SelecionaRubrica(MsProvDescD_B);
  cboNPagtoDevol_B.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.SpeedButton37Click(Sender: TObject); ///SOL205322  KINTANA 1996527
begin
  inherited;
  cboRPagto_B.Text := SelecionaRubrica(MsProvDescN_B);
  cboRPagto_B.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.SpeedButton38Click(Sender: TObject); ///SOL205322  KINTANA 1996527
begin
  inherited;
  cboRPagtoAtrasado_B.Text := SelecionaRubrica(MsProvDescA_B);
  cboRPagtoAtrasado_B.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.SpeedButton39Click(Sender: TObject); ///SOL205322  KINTANA 1996527
begin
  inherited;
  cboRPagtoDevol_B.Text := SelecionaRubrica(MsProvDescD_B);
  cboRPagtoDevol_B.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.SpeedButton34Click(Sender: TObject); ///SOL205322  KINTANA 1996527
begin
  inherited;
  cboAPagto_B.Text := SelecionaRubrica(MsProvDescN_B);
  cboAPagto_B.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.SpeedButton35Click(Sender: TObject); ///SOL205322  KINTANA 1996527
begin
  inherited;
  cboAPagtoAtrasado_B.Text := SelecionaRubrica(MsProvDescA_B);
  cboAPagtoAtrasado_B.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.SpeedButton36Click(Sender: TObject); ///SOL205322  KINTANA 1996527
begin
  inherited;
  cboAPagtoDevol_B.Text := SelecionaRubrica(MsProvDescD_B);
  cboAPagtoDevol_B.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.SpeedButton43Click(Sender: TObject);
begin
  inherited;
  cboNCobra_D.Text:=SelecionaRubrica(MsProvCobraN_D);
  cboNCobra_D.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.SpeedButton44Click(Sender: TObject);
begin
  inherited;
  cboNCobraDevo_D.Text:=SelecionaRubrica(MsProvCobraD_D);
  cboNCobraDevo_D.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.SpeedButton45Click(Sender: TObject);
begin
  inherited;
  cboNCobraAtras_D.Text:=SelecionaRubrica(MsProvCobraA_D);
  cboNCobraAtras_D.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.SpeedButton40Click(Sender: TObject);
begin
  inherited;
  cboACobra_D.Text:=SelecionaRubrica(MsProvCobraN_D);
  cboACobra_D.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.SpeedButton41Click(Sender: TObject);
begin
  inherited;

  cboACobraDevo_D.Text:=SelecionaRubrica(MsProvCobraD_D);
  cboACobraDevo_D.PerformSearch;

end;

procedure TfrmCadPlanPrevCS.SpeedButton42Click(Sender: TObject);
begin
  inherited;
  cboACobraAtras_D.Text:=SelecionaRubrica(MsProvCobraA_D);
  cboACobraAtras_D.PerformSearch;
end;


procedure TfrmCadPlanPrevCS.dbchkFlgBSFABClick(Sender: TObject);
begin
  inherited;
  // edilaine - SOL 253577-17349 / PPM 840966
  {RN09. Quando o flag "Apresentar os campos Benefício Saldado e FAB no requerimento de benefícios" estiver desmarcado
         o sistema não deverá obrigar o preenchimento dos campos e eles deverão estar desabilitados para seleção de regra }
  dblcRegraBS.enabled  := dbchkFlgBSFAB.Checked;
  dblcRegraFAB.enabled := dbchkFlgBSFAB.Checked;

  if (not dblcRegraBS.enabled)  and (qryBenef.State in [dsInsert, dsEdit])  then
     qryBenef.FieldByName('IDREGRACALCBS').AsString := '';

  if (not dblcRegraFAB.enabled) and (qryBenef.State in [dsInsert, dsEdit]) then
     qryBenef.FieldByName('IDREGRACALCFAB').AsString := '';
end;


procedure TfrmCadPlanPrevCS.dbchkFlgBCDeficitClick(Sender: TObject);
begin
  inherited;
  // edilaine - SOL 253577-17349 / PPM 840966
  {RN09. Quando o flag "Apresentar o campo Base de Cálculo do Déficit no requerimento de benefícios" estiver desmarcado
         o sistema não deverá obrigar o preenchimento dos campos e eles deverão estar desabilitados para seleção de regra }
  dblcRegraCBD.enabled := dbchkFlgBCDeficit.checked;

  if (not dblcRegraCBD.enabled) and (qryBenef.State in [dsInsert, dsEdit]) then
     qryBenef.FieldByName('IDREGRACALCBASEDEFICIT').AsString := '';

end;

procedure TfrmCadPlanPrevCS.sbtnRubCorAClick(Sender: TObject);
begin
  inherited;
  // Felipe A. Santos - SOL 258357/17801 PPM 1083052 - início
  cboCPagtoAtrasado.Text := SelecionaRubrica(MsProvDescA);
  cboCPagtoAtrasado.PerformSearch;
  // Felipe A. Santos - SOL 258357/17801 PPM 1083052 - fim
end;

procedure TfrmCadPlanPrevCS.sbtnRubCorDClick(Sender: TObject);
begin
  inherited;
  // Felipe A. Santos - SOL 258357/17801 PPM 1083052 - início
  cboCPagtoDevol.Text := SelecionaRubrica(MsProvDescD);
  cboCPagtoDevol.PerformSearch;
  // Felipe A. Santos - SOL 258357/17801 PPM 1083052 - fim
end;

function TfrmCadPlanPrevCS.VerificaRRA: boolean;
var
  bVerificar : boolean;

begin
   // Felipe A. Santos - SOL 258357/17801 PPM 1083052 - início
   Result := False;

   bVerificar := (
                  (Trim(cboNPagtoAtrasado.Text) <> '') or
                  (Trim(cboNPagtoDevol.Text) <> '') or
                  (Trim(cboRPagtoAtrasado.Text) <> '') or
                  (Trim(cboRPagtoDevol.Text) <> '') or
                  (Trim(cboCPagtoAtrasado.Text) <> '') or
                  (Trim(cboCPagtoDevol.Text) <> '')
                 );


   if (bVerificar) then
   begin
     if (Trim(cboNPagtoAtrasado.Text) = '') then
     begin
       Exit;
     end
     else if (Trim(cboNPagtoDevol.Text) = '') then
     begin
       Exit;
     end
     else if (Trim(cboRPagtoAtrasado.Text) = '') then
     begin
       Exit;
     end
     else if (Trim(cboRPagtoDevol.Text) = '') then
     begin
       Exit;
     end
     else if (Trim(cboCPagtoAtrasado.Text) = '') then
     begin
       Exit;
     end
     else if (Trim(cboCPagtoDevol.Text) = '') then
     begin
       Exit;
     end;
   end;

   Result := True;
   // Felipe A. Santos - SOL 258357/17801 PPM 1083052  - fim
end;

//edilaine - SIG36752 - inicio
procedure TfrmCadPlanPrevCS.btnRubAcertoClick(Sender: TObject);
begin
  inherited;
  dblkpcmbRubricaAcerto.Text := SelecionaRubrica(MsProventoNormal);
  dblkpcmbRubricaAcerto.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.dblkpcmbAltBxDocChange(Sender: TObject);
begin
  inherited;
  if (qryDet.State in [dsInsert, dsEdit]) then
  begin
    bMudouAltDeBaixa := (qryDet.FieldByName('CODALTBAIXANPAGO').AsString <> dblkpcmbAltBxDoc.LookupValue);
  end;
end;

procedure TfrmCadPlanPrevCS.dblkpcmbAltBxDocPGAChange(Sender: TObject);
begin
  inherited;
  if (qryDet.State in [dsInsert, dsEdit]) then
  begin
    bMudouAltDeBaixa := (qryDet.FieldByName('CODALTBAIXANPAGOPGA').AsString <> dblkpcmbAltBxDocPGA.LookupValue);
  end;
end;
//edilaine - SIG36752 - fim


//edilaine - SIG24483 : inicio
procedure TfrmCadPlanPrevCS.qryIsentoIRAcJudBeforePost(DataSet: TDataSet);
begin
  inherited;
  qryIsentoIRAcJud.FieldByName('RUB_ISENTA').AsString := dblkRubIsentaIRAcJud.text;
  qryIsentoIRAcJud.FieldByName('RUB_INCIDE').AsString := dblkRubIncideIRAcJud.text;
  qryIsentoIRAcJud.FieldByName('COD_ISENTA').AsString := qryRubIsentaIR.FieldByName('CODPROVDESC').AsString;
  qryIsentoIRAcJud.FieldByName('COD_INCIDE').AsString := qryRubIncideIR.FieldByName('CODPROVDESC').AsString;
end;

procedure TfrmCadPlanPrevCS.sbtnRubIsentaClick(Sender: TObject);
begin
  inherited;
  dblkRubIsentaIRAcJud.Text := SelecionaRubrica(MSRubIsenta);
  dblkRubIsentaIRAcJud.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.sbtnRubIncideClick(Sender: TObject);
begin
  inherited;
  dblkRubIncideIRAcJud.Text := SelecionaRubrica(MSRubIncide);
  dblkRubIncideIRAcJud.PerformSearch;
end;

procedure TfrmCadPlanPrevCS.MSRubIsentaBeforeOpenCds(var sqlText: String;
  strListParams: TStringList);
var
  sSQLRub : string;
begin
  inherited;
  sSQLRub := qryRubIsentaIR.SQL.Text;
  sSQLRub := StringReplace(sSQLRub, 'ORDER BY 2', 'AND RI.IDPROVENTO = PROVDESC.IDPROVENTO', []);

  sqlText := StringReplace(sqlText, 'ORDER BY C0 ASC', '', []);
  sqlText := sqlText + ' AND EXISTS ('+ sSQLRub +')';
  sqlText := sqlText + ' ORDER BY C0 ASC';
end;

procedure TfrmCadPlanPrevCS.MSRubIncideBeforeOpenCds(var sqlText: String;
  strListParams: TStringList);
var
  sSQLRub : string;
begin
  inherited;
  sSQLRub := qryRubIncideIR.SQL.Text;
  sSQLRub := StringReplace(sSQLRub, 'ORDER BY 2', 'AND RI.IDPROVENTO = PROVDESC.IDPROVENTO', []);

  sqlText := StringReplace(sqlText, 'ORDER BY C0 ASC', '', []);
  sqlText := sqlText + ' AND EXISTS ('+ sSQLRub +')';
  sqlText := sqlText + ' ORDER BY C0 ASC';
end;

function TfrmCadPlanPrevCS.VerificaDuplicidadeRubIsenta: boolean;
begin
  try
    qryAux.close;
    qryAux.SQL.clear;
    qryAux.SQL.Add('SELECT 1 FROM TRATAISENCAOIRACAOJUD T ');
    qryAux.SQL.Add(' WHERE T.IDRUBRICA = ' + qryRubIncideIR.FieldByName('IDPROVENTO').AsString );
    qryAux.SQL.Add('   AND T.IDRUBISENTOAC = ' + qryRubIsentaIR.FieldByName('IDPROVENTO').AsString );
    qryAux.SQL.Add('   AND T.IDPLANOPREV   = ' + qry.FieldbyName('IdPlanoPrev').AsString );
    if qryIsentoIRAcJud.State = dsEdit then
       qryAux.SQL.Add('   AND IDTRATAISENCAOIRACAOJUD <> ' + qryIsentoIRAcJud.FieldByName('IDTRATAISENCAOIRACAOJUD').AsString );
    qryAux.Open;

    Result := not qryAux.eof;
  finally
    qryAux.close;
  end;
end;

end.


