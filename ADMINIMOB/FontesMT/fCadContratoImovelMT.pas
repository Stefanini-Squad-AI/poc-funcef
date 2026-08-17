{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
//***************************************************************************************
N. Chamado....: WO38917
Dt Alterações.: 20/05/2026
Responsável...: Leandro Pocebon
Descrição.....: Na aba fiança campo observação tratamento não incluir  dados indevidos e
                causar erro ao salvar.
//***************************************************************************************
N. Chamado....: WO28516
Dt Alterações.: 09/12/2025
Responsável...: Paulo Nobre
Descrição.....: Na aba Eventos, campo "Descrição do Evento", trocado o componente de
                TwwRichEdit para TDBMemo devido problemas encontrados com a migração para
                o Oracle. Alteração apenas no .dfm
//***************************************************************************************
//SIG         : 54326
//Responsável : Cássio Florencio Rovaroto
//Data        : 01/12/2021
//Form        : fCadContratoImovelMT
//Descrição   : Alteração da descrição do campo "Prazo indeterminado" para "Em negociação".  
//***************************************************************************************
//SIG         : 75448
//Responsável : Andre Imakawa
//Data        : 29/09/2018
//Rotina      : bbtnConfirmarClick
//Descrição   : Apenas verificar Saldo em Aberto quando FLGSTATUS = 'V'
//***************************************************************************************
//SIG         : SIG43082
//Responsável : Peterson Victor
//Data        : 06/04/2017
//Rotina      : VerificaSaldoAberto
//Descrição   : Verificação de saldo em aberto e, se existir, o sistema envie um alerta
//              indicando tal saldo a receber.
//***************************************************************************************
//SIG         : SIG26726
//Responsável : Marcelo Cardoso
//Data        : 23/02/2017
//Descrição   : Verificação de saldo em aberto e, se existir, o sistema envie um alerta
//              indicando tal saldo a receber.
//Rotina      : VerificaSaldoAberto
//***************************************************************************************
//Rotina: VerificaPreenchimentoImovel
//Nº SOL: 260023
//Nº PPM: 1033917
//Data da Alteração: 04/09/2014  / 16/11/2015
//Alteração Form: Alterado o componente qryVerificaContrato
//Responsável: Fernando Xavier / William Santana
//Descrição:  Alterar a mensagem 'Existe contrato vigente para este imóvel', para que passe
//            a verificar por periodo e não por contrato.
//***************************************************************************************
//Rotina: VerificaPreenchimentoImovel
//Nº SOL: 230104
//Nº PPM: 519149
//Data da Alteração: 22/10/2014
//Alteração Form: adicionei o componente qryVerificaContrato
//Responsável: William Santana
//Descrição:   Criar mensagem de alerta 'Existe contrato vigente para este imóvel',
               caso seja selecionado um imóvel objeto de um contrato "A" vigente e
               tentar incluí-lo em novo contrato de locação "B".
//***************************************************************************************
//Rotina: VerificaPreenchimentoMulta
//Nº SOL: 233031
//Nº PPM: 446225
//Data da Alteração: 30/07/2014
//Alteração Form: Não foi efetuada alteração de Form
//Responsável: Sadi Freire
//Descrição: Obrigatoriedade de preenchimento do campo indice na correção monetária
//**************************************************************************************
--------------------------------------------------------------------------------
SOL         : 226416
PPM         : 437042
Responsável : William Moreira da Silva
Data        : 01/07/2014
Descrição   : O FLG "Exibir apenas imóveis vigentes" estava na "Valor Futuro"
              ao invés de esta na aba Imóveis.
--------------------------------------------------------------------------------
SOL         : 186863/15592
Kintana     : 2057021
Responsável : Felipe A. Santos
Data        : 06/01/2014
Descrição   : alteração somente no DFM, retirando uma tbsDatas que estava
              duplicado.
--------------------------------------------------------------------------------
SOL         : 136341
Kintana     : 815095
Responsável : Helen V. Bianchi
Data        : 09/10/2011
Descrição   : Implementação da Aba Confissão de Dívida
--------------------------------------------------------------------------------
SOL : 137256
KINTANA : 828397
Responsável : MARCELO ALMEIDA
Data        : 03/01/2011
Descrição   : Implementação, na base de dados e no sistema,
              de campos específicos para registro de pagamento de taxas,
              impostos e demais valores associados aos imóveis em carteira.
              Este registro pode ser feito como um flag no sistema para que a
              GEIMO, anualmente, registre que determinado imóvel está em dia
              com os pagamentos das taxas aplicáveis relacionadas aos imóveis.
--------------------------------------------------------------------------------
SOL : 143756
KINTANA : 939119
Responsável : Felipe de Oliveira
Data        : 14/09/2010
Descrição   : Alterada função verificapreenchimento, para tratar o valor do
              contrato
--------------------------------------------------------------------------------
SOL : 110145
KINTANA : 503093
Responsável : Felipe de Oliveira
Data        : 26/05/2010
Descrição   : Ao alterar ou inserir imóveis no contrato o usuário agora terá que
              informar o valor total do contrato e terá 2 botões com a opção de
              ratear o valor dos imóveis no contrato por área ou valor contábil
              do imóvel
--------------------------------------------------------------------------------
Pendência   : 26104
Responsável : Daniel Simões
Data        : 14/08/2007
Descrição   : Métodos relacionados a Parametrização de Multas e Juros passa a
              trazer da CtrlParamMulta no lugar da CtrlContratoImovel...
--------------------------------------------------------------------------------
Pendência   : 24079
Responsável : Daniel Simões
Data        : 06/06/2007
Descrição   : Implementação do campo 'OBSERVAÇAO' no cadastro de descontos...
--------------------------------------------------------------------------------
Pendência   : 24083
Responsável : Daniel Simões
Data        : 22/05/2007
Descrição   : Inclusão do Número do Processo no Cadastro de Eventos.
--------------------------------------------------------------------------------
Pendência   : 24081
Responsável : Andre Mesquita
Data        : 14/03/2007
Descrição   : Tipo de Contrato
--------------------------------------------------------------------------------
Pendência   : 22687
Responsável : Daniel Simões
Data        : 28/01/2007
Descrição   : 1º Implementação do cadastro de Juros e Multas como
                 Mestre/Detalhe, Implementação de período de vigência de Juros e
                 Multa e inclusão do tipo de receita no cadastro...
--------------------------------------------------------------------------------
Pendência   : 21413
Responsável : Daniel Simões
Data        : 18/01/2007
Descrição   : Implmentação de gravação de registro no evento com a data,
              descrição do evento e o nome do usuário que efetuou o cadastro
              toda vez que algum dado sofrer aleração no sistema...
--------------------------------------------------------------------------------
Pendência   : 24159
Responsável : Daniel Simões
Data        : 16/01/2007
Descrição   : Implementação de crítica ao alterar / excluir um imóvel caso
              exista lançamentos feitos para ele naquele contrato...
--------------------------------------------------------------------------------
Pendência   : 23272
Responsável : Daniel Simões
Data        : 15/01/2007
Descrição   : Vínculo das datas de vigência dos imóveis com as datas de vigência
              do contrato se estas forem do mesmo período...
--------------------------------------------------------------------------------
Pendência   : 23518
Responsável : Daniel Simões
Data        : 11/01/2007
Descrição   : Implementação da TabSheet de Dados Complementares por Imóvel passa
              a utilizar a TreeList para exibir os dados relacionados...
--------------------------------------------------------------------------------
Pendência   : Complementa a pendência 19901
Responsável : Daniel Simões
Data        : 10/03/2006
Descrição   : Criada uma opção quando for alterada a data do término do
              contrato. Dá a opção do usuário alterar também a data do término
              da vigência dos imóveis do respectivo contrato...
--------------------------------------------------------------------------------
Pendência   : Complementa a pendência 19901
Responsável : Daniel Simões
Data        : 14/02/2006
Descrição   : Foi adicionada uma CheckBox que aparecerá quando clicar na
              TabSheet "Imóveis" responsável por filtrar na Grid apenas os
              imóveis com a data dentro da vigência...
--------------------------------------------------------------------------------
Pendência   : Complementa a pendência 19901
Responsável : Daniel Simões
Data        : 08/02/2006
Descrição   : Foi adicionada na função VerificaPreenchimentoImovel críticas
              adicionais com respeito as regras de preenchimento das datas das
              vigências dos imóveis...
--------------------------------------------------------------------------------
Pendência   : 19901
Responsável : Daniel Simões
Data        : 02/02/2006
Descrição   : Adicionados os campos CIMDTINI e CIMDTFIM na tabela
              CONTRATOXIMOVEL. Adicionados também no formulário para
              preenchimento...
--------------------------------------------------------------------------------
Pendência   : 17959
Responsável : Vinícius Meyer Lana
Data        : 22/11/2004
Descrição   : Implementação de Evento Programado.
--------------------------------------------------------------------------------
Pendência   : 17340
Responsável : David Ayrolla
Data        : 30/08/2004 (término)
Descrição   : Implementação dos descontos programados.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 186863
Responsável : Sadi Freire
Data        : 05/11/2013 (término)
Descrição   : Implementação do preenchimento automático das datas na inserção e alteração.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}
unit fCadContratoImovelMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMTImob, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask, DBCtrls, DBCtrls2,
  wwdblook, TREdit, mResponsavel, wwdbedit, Wwdbspin, mAdministradora, uCMTypes,
  mLocatario, wwdbdatetimepicker, CMDateTimePicker, Wwdotdot, Wwdbcomb,
  wwriched, Wwdbgrd2, mFiador, mImovelAtivo, uCtrlAtividade, uCtrlMarcas, uCtrlImovel,
  uCtrlContratoImovel, uCtrlMoeda, uCtrlPais, uCtrlEstado, uCtrlTipoCustoRecImov,
  uCtrlPortadorForma, uCtrlCidade, uCtrlEventoImovel, uCtrlMsgBoleto, uCtrlSitContImob,
  uCtrlBanco, uCtrlCadRegra, uCtrlRegra, Provider, DBTables, DBGrids,
  uCtrlTipoImovel, uCmSqlParams, mArvoreCompl, CMDBLookupCombo, uCtrlTipoContrato,
  uCtrlParamMulta,// Daniel - 26104
  uCMMath, Wwquery;//SOL 110145 Kintana 503093 Felipe de Oliveira

type
  TfrmCadContratoImovelMT = class(TFrmCadastroMestreDetMTImob)
    Label1: TLabel;
    DBedtNumeroContrato: TDBEdit2;
    Label4: TLabel;
    DBedtNomeContrato: TDBEdit2;
    tbsGeral: TTabSheet;
    Label19: TLabel;
    DBedtValorContrato: TDBRealEdit;
    Label20: TLabel;
    DBcboMoedaContrato: TwwDBLookupCombo;
    Label55: TLabel;
    lblMarca: TLabel;
    DBcboMarca: TwwDBLookupCombo;
    Label65: TLabel;
    DBcboAtividade: TwwDBLookupCombo;
    Label66: TLabel;
    DBchkCobrancaAuto: TDBCheckBox;
    molLocatario1: TmolLocatario;
    DBSpnVagas: TwwDBSpinEdit;
    Bevel2: TBevel;
    lblSituacao: TLabel;
    dblcSitContratual: TwwDBLookupCombo;
    tbsDatas: TTabSheet;
    tbsValorFuturo: TTabSheet;
    tbsCobranca: TTabSheet;
    tbsMulta: TTabSheet;
    tbsObs: TTabSheet;
    tbsEventos: TTabSheet;
    tbsFianca: TTabSheet;
    tbsFiadores: TTabSheet;
    Label6: TLabel;
    DBedtDataAssinatura: TCMDateTimePicker;
    Label7: TLabel;
    DBedtDataInicio: TCMDateTimePicker;
    DBchkIndeterminado: TDBCheckBox;
    Label8: TLabel;
    DBedtDataFim: TCMDateTimePicker;
    Bevel3: TBevel;
    Bevel1: TBevel;
    Label45: TLabel;
    DBedtDataAvRenegoc: TCMDateTimePicker;
    Label44: TLabel;
    DBedtDataRenegoc: TCMDateTimePicker;
    Label43: TLabel;
    DBedtDataAvisoDenuncia: TCMDateTimePicker;
    Label9: TLabel;
    DBedtDataDenuncia: TCMDateTimePicker;
    Label42: TLabel;
    DBedtDataIniCarencia: TCMDateTimePicker;
    Label3: TLabel;
    DBedtDataFimCarencia: TCMDateTimePicker;
    Label21: TLabel;
    DBcboTipoRecCusto: TwwDBLookupCombo;
    Label22: TLabel;
    DBcboPortadorForma: TwwDBLookupCombo;
    DBrdgCompetencia: TDBRadioGroup;
    grpReajuste: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label34: TLabel;
    DBcboIndiceReajuste: TwwDBLookupCombo;
    DBspnPeriodicidadeReajuste: TwwDBSpinEdit;
    Label53: TLabel;
    DBcboMsgBoleto: TwwDBLookupCombo;
    Panel1: TPanel;
    pnlCidade: TPanel;
    Panel3: TPanel;
    DBmemContrato: TwwDBRichEdit;
    Panel4: TPanel;
    dbgrdEvento: TwwDBGrid2;
    Panel10: TPanel;
    Label2: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    Label23: TLabel;
    Label32: TLabel;
    Label36: TLabel;
    DBedtDataEvento: TCMDateTimePicker;
    DBedtCabEvento: TDBEdit;
    DBedtVlrAnterior: TDBEdit;
    DBedtVlrAjustado: TDBEdit;
    DBedtPercent: TDBEdit;
    Panel5: TPanel;
    gbEvento: TGroupBox;
    Panel7: TPanel;
    DBrdgTipoFianca: TDBRadioGroup;
    GroupBox1: TGroupBox;
    Label37: TLabel;
    Label38: TLabel;
    Label59: TLabel;
    DBedtTerminoFianca: TCMDateTimePicker;
    DBedtAvisoFianca: TCMDateTimePicker;
    DBedtDataIniFianca: TCMDateTimePicker;
    GroupBox2: TGroupBox;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    DBedtNumBanco: TDBEdit;
    DBcboBanco: TwwDBLookupCombo;
    Label64: TLabel;
    dbmemObsFianca: TwwDBRichEdit;
    dsEvento: TwwDataSource;
    cdsEvento: TCMClientDataSet;
    cdsEventoIDEVENTOIMOVEL: TFloatField;
    cdsEventoIDIMOVEL: TFloatField;
    cdsEventoEVIDATA: TDateTimeField;
    cdsEventoEVICABECALHO: TStringField;
    cdsEventoIDUSUARIO: TFloatField;
    cdsEventoIDCONTRATOIMOVEL: TFloatField;
    cdsEventoFLGTIPOEVENTO: TStringField;
    cdsEventoEVIVLRANTERIOR: TFloatField;
    cdsEventoEVIVLRAJUSTADO: TFloatField;
    cdsEventoEVIDATAPROX: TDateTimeField;
    cdsEventoEVIPERCENT: TFloatField;
    cdsEventoEVIINDICEREAJUSTE: TFloatField;
    cdsEventoIDCONTRATOLOJA: TFloatField;
    cdsEventoDSC_INDICE: TStringField;
    dsFiador: TwwDataSource;
    cdsFiador: TCMClientDataSet;
    Panel6: TPanel;
    dbgrdFiador: TwwDBGrid2;
    molFiador1: TmolFiador;
    cdsMoeda: TCMClientDataSet;
    cdsMoedaMOESIGLA: TStringField;
    cdsMoedaMOECODIGO: TFloatField;
    cdsMoedaMOEDESC: TStringField;
    cdsMoedaMOEPERIODICIDADE: TStringField;
    cdsMoedaFLGPERCVALOR: TStringField;
    cdsMarcas: TCMClientDataSet;
    cdsMarcasMRCNOME: TStringField;
    cdsMarcasIDMARCA: TFloatField;
    cdsPais: TCMClientDataSet;
    cdsPaisNOMEPAIS: TStringField;
    cdsPaisIDPAIS: TFloatField;
    cdsEstado: TCMClientDataSet;
    cdsEstadoCODESTADO: TStringField;
    cdsEstadoIDPAIS: TFloatField;
    cdsEstadoNOMEESTADO: TStringField;
    cdsEstadoIDESTADO: TFloatField;
    cdsAtividade: TCMClientDataSet;
    cdsAtividadeATVDESCRICAO: TStringField;
    cdsAtividadeIDATIVIDADE: TFloatField;
    cdsImovel: TCMClientDataSet;
    Query1: TQuery;
    cdsTipoCustoRec: TCMClientDataSet;
    cdsTipoCustoRecDESCCUSTORECIMO: TStringField;
    cdsTipoCustoRecIDTIPOCUSTORECIMO: TFloatField;
    cdsTipoCustoRecRECCUSTO: TStringField;
    cdsPortadorForma: TCMClientDataSet;
    cdsPortadorFormaCODPORTFORMA: TFloatField;
    cdsPortadorFormaDESCRICAO: TStringField;
    cdsCidade: TCMClientDataSet;
    cdsCidadeIDCIDADES: TFloatField;
    cdsCidadeCODESTADO: TStringField;
    cdsCidadeIDPAIS: TFloatField;
    cdsCidadeNOME: TStringField;
    cdsCidadeCODMUNICIPIO: TStringField;
    cdsCidadeIDESTADO: TFloatField;
    CdsCODESTADO: TStringField;
    CdsCODPORTFORMA: TFloatField;
    CdsCONBANCOFIANCA: TFloatField;
    CdsCONDATAASSINATURA: TDateTimeField;
    CdsCONDATAAVDENUNCIA: TDateTimeField;
    CdsCONDATAAVRENEGOC: TDateTimeField;
    CdsCONDATACARENCIA: TDateTimeField;
    CdsCONDATADENUNCIA: TDateTimeField;
    CdsCONDATAFIANCAAV: TDateTimeField;
    CdsCONDATAFIANCAFIM: TDateTimeField;
    CdsCONDATAFIANCAINI: TDateTimeField;
    CdsCONDATAFIM: TDateTimeField;
    CdsCONDATAINICAREN: TDateTimeField;
    CdsCONDATAINICIO: TDateTimeField;
    CdsCONDATAREAJUSTE: TDateTimeField;
    CdsCONDATARENEGOC: TDateTimeField;
    CdsCONDESCRICAO: TMemoField;
    CdsCONDIASREPASSE: TFloatField;
    CdsCONDIASTOLERANCIA: TFloatField;
    CdsCONDIAVENCIMENTO: TFloatField;
    CdsCONINDICEREAJUSTE: TFloatField;
    CdsCONMESREFREAJUSTE: TStringField;
    CdsCONMOEDAMORA: TFloatField;
    CdsCONMOEDAMULTA: TFloatField;
    CdsCONNOME: TStringField;
    CdsCONNUMERO: TStringField;
    CdsCONPERALUGUEL: TFloatField;
    CdsCONPERCENTMORA: TFloatField;
    CdsCONPERCENTMULTA: TFloatField;
    CdsCONPERMORA: TStringField;
    CdsCONPERREAJUSTE: TFloatField;
    CdsCONPROXREAJUSTE: TDateTimeField;
    CdsCONQUANTVAGAS: TFloatField;
    CdsCONTAXAADMIN: TFloatField;
    CdsCONVLRAJUSTADO: TFloatField;
    CdsCONVLRFIANCA: TFloatField;
    CdsCONVLRMORA: TFloatField;
    CdsCONVLRMULTA: TFloatField;
    CdsCONVLRTOTAL: TFloatField;
    CdsFLGCOBRANCAAUTO: TFloatField;
    CdsFLGCOMPETALUGUEL: TStringField;
    CdsFLGFIANCA: TStringField;
    CdsFLGINDETERMINADO: TStringField;
    CdsFLGMORAPROPORC: TFloatField;
    CdsFLGSTATUS: TStringField;
    CdsFLGTIPOCONTRATO: TStringField;
    CdsFLGTIPODIATOLERA: TStringField;
    CdsFLGTIPODIAVENC: TStringField;
    CdsIDADMINIMOVEL: TFloatField;
    CdsIDATIVIDADE: TFloatField;
    CdsIDCIDADES: TFloatField;
    CdsIDCONTRATOIMOVEL: TFloatField;
    CdsIDINDCORRECAO: TFloatField;
    CdsIDLOCATARIO: TFloatField;
    CdsIDMARCA: TFloatField;
    CdsIDMSGBOLETO: TFloatField;
    CdsIDPAIS: TFloatField;
    CdsIDPESSOA: TFloatField;
    CdsIDRESPONSAVEL: TFloatField;
    CdsIDSITCONTIMOB: TFloatField;
    CdsIDTIPOCUSTORECIMO: TFloatField;
    CdsMOECODIGO: TFloatField;
    CdsPERALUGUELIDEAL: TFloatField;
    CdsPERCTXJURMERC: TFloatField;
    CdsPERITXJURMERC: TStringField;
    CdsVLRCONTABIL: TFloatField;
    CdsVLRPRESENTE: TFloatField;
    CdsVLRPROPOSTA: TFloatField;
    CdsDSC_ADMINISTRADORA: TStringField;
    CdsDSC_LOCATARIO: TStringField;
    CdsDSC_RESPONSAVEL: TStringField;
    sbtnImovel: TToolbarButton97;
    cdsMsgBoleto: TCMClientDataSet;
    cdsMsgBoletoIDMSGBOLETO: TFloatField;
    cdsMsgBoletoMSGDESCRICAO: TStringField;
    cdsSitContImob: TCMClientDataSet;
    cdsSitContImobIDSITCONTIMOB: TFloatField;
    cdsSitContImobDESCRICAO: TStringField;
    cdsFiadorIDCONTRATOIMOVEL: TFloatField;
    cdsFiadorIDAVALISTA: TFloatField;
    cdsFiadorNF_FIADOR: TStringField;
    cdsFiadorRS_FIADOR: TStringField;
    lblVigencia: TLabel;
    Label52: TLabel;
    DBedtDescricaoImovel: TDBEdit2;
    Label35: TLabel;
    Label51: TLabel;
    Label39: TLabel;
    edtMoeda: TEdit;
    DBchkRateio: TDBCheckBox;
    Label40: TLabel;
    molImovelAtivo1: TmolImovelAtivo;
    dbEdtTaxaAdmin: TDBRealEdit;
    lblPerc: TLabel;
    dbEdtPercentRateio: TDBRealEdit;
    Label33: TLabel;
    Label41: TLabel;
    dbedtVlrAluguelAnt: TDBRealEdit;
    dbedtVlrAluguelAtual: TDBRealEdit;
    cdsBanco: TCMClientDataSet;
    cdsBancoNOME: TStringField;
    cdsBancoRAZAOSOCIAL: TStringField;
    cdsBancoNUMBANCO: TStringField;
    cdsBancoIDPESSOA: TFloatField;
    dsBanco: TwwDataSource;
    dbedtVlrFianca: TDBRealEdit;
    CdsCONOBSFIANCA: TMemoField;
    CdsFLGTIPOALUGUEL: TStringField;
    molAdministradora1: TmolAdministradora;
    MolResponsavel1: TMolResponsavel;
    grpVencPrincipal: TGroupBox;
    Label12: TLabel;
    DBspnVencimento: TwwDBSpinEdit;
    DBrdgTipoDiaVenc: TDBRadioGroup;
    GroupBox3: TGroupBox;
    Label68: TLabel;
    DBspnPeriodicidade: TwwDBSpinEdit;
    GroupBox5: TGroupBox;
    Label50: TLabel;
    DBedtUltReajuste: TCMDateTimePicker;
    Label11: TLabel;
    DBedtProxReajuste: TCMDateTimePicker;
    Bevel4: TBevel;
    dsVlrAno: TwwDataSource;
    cdsVlrAno: TCMClientDataSet;
    cdsVlrAnoDSC_MESTRE: TStringField;
    cdsVlrAnoDSC_IMOVEL: TStringField;
    cdsVlrAnoANOINICIO: TFloatField;
    cdsVlrAnoVALOR: TFloatField;
    pnlVlrAno: TPanel;
    molImovelAtivo2: TmolImovelAtivo;
    GroupBox6: TGroupBox;
    DBspnAno: TwwDBSpinEdit;
    GroupBox7: TGroupBox;
    dbedtVlrAno: TDBRealEdit;
    Label54: TLabel;
    cdsVlrAnoIDCONTRATOIMOVEL: TFloatField;
    cdsVlrAnoIDIMOVEL: TFloatField;
    dbgrdVlrAno: TwwDBGrid;
    cdsVlrAnoIDCONTRATOXVLRANO: TFloatField;
    cdsVlrAnoFLGCORRIGE: TStringField;
    dbchkCorrigeVlrAno: TDBCheckBox;
    CdsCONDATASOLRESC: TDateTimeField;
    Label46: TLabel;
    CMDateTimePicker2: TCMDateTimePicker;
    Label63: TLabel;
    cdsRegra: TCMClientDataSet;
    cdsRegraNOMEREGRA: TStringField;
    cdsRegraIDREGRA: TFloatField;
    CdsIDREGRARES: TFloatField;
    CdsPERMULTARESC: TFloatField;
    CdsQTDEMULTARESC: TFloatField;
    cdsRegraDESCRICAOREGRA: TMemoField;
    chkSemReajuste: TCheckBox;
    tbsDescontos: TTabSheet;
    cdsContratoXDesc: TCMClientDataSet;
    dsContratoXDesc: TwwDataSource;
    dbgrdContratoXDesc: TwwDBGrid;
    cdsContratoXDescIDCONTRATOXDESC: TFloatField;
    cdsContratoXDescCODALTERADOR: TFloatField;
    cdsContratoXDescIDCONTRATOIMOVEL: TFloatField;
    cdsContratoXDescMOECODIGO: TFloatField;
    cdsContratoXDescVLRDESCONTO: TFloatField;
    cdsContratoXDescPERDESCONTO: TFloatField;
    cdsContratoXDescDATAINICIO: TDateTimeField;
    cdsContratoXDescDATAFIM: TDateTimeField;
    cdsContratoXDescMOESIGLA: TStringField;
    cdsContratoXDescDESCRICAO: TStringField;
    pnlContratoXDesc: TPanel;
    cdsAlteradorXTipoImovel: TCMClientDataSet;
    dsAlteradorXTipoImovel: TwwDataSource;
    cdsAlteradorXTipoImovelCODTIPIMOVEL: TStringField;
    cdsAlteradorXTipoImovelCODALTERADOR: TFloatField;
    cdsAlteradorXTipoImovelDESCRICAO: TStringField;
    cdsAlteradorXTipoImovelACRESDECRES: TStringField;
    cdsAlteradorXTipoImovelRECPAG: TStringField;
    cdsAlteradorXTipoImovelCHAVE: TStringField;
    cdsMoedaDesc: TCMClientDataSet;
    cdsMoedaDescMOESIGLA: TStringField;
    cdsMoedaDescMOECODIGO: TFloatField;
    cdsMoedaDescMOEDESC: TStringField;
    cdsMoedaDescMOEPERIODICIDADE: TStringField;
    cdsMoedaDescFLGPERCVALOR: TStringField;
    dtsMoeda: TwwDataSource;
    GroupBox8: TGroupBox;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    dbedtPercDesc: TDBRealEdit;
    dbedtValorDesc: TDBRealEdit;
    dblkpMoedaDesc: TwwDBLookupCombo;
    GroupBox11: TGroupBox;
    Label73: TLabel;
    dtpckrDtInicial: TCMDateTimePicker;
    Label79: TLabel;
    dtpckrDtFinal: TCMDateTimePicker;
    GroupBox12: TGroupBox;
    dblkpAlterador: TwwDBLookupCombo;
    DBRealEdit3: TDBRealEdit;
    Label72: TLabel;
    CdsCONPERCREAJUSTE: TFloatField;
    Image2: TImage;
    DBedtDataProx: TCMDateTimePicker;
    cdsEventoFLGAVISO: TStringField;
    cdsEventoDIASAVISO: TFloatField;
    GroupBox13: TGroupBox;
    wwDBSpinEdit1: TwwDBSpinEdit;
    Label80: TLabel;
    cbAvisoEvento: TDBCheckBox;
    GroupBox14: TGroupBox;
    DBcboPais: TwwDBLookupCombo;
    Label47: TLabel;
    DBcboEstado: TwwDBLookupCombo;
    Label48: TLabel;
    DBcboCidade: TwwDBLookupCombo;
    Label49: TLabel;
    gbUsuarioInclusao: TGroupBox;
    Label81: TLabel;
    Label82: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    CdsTRGDTINCLUSAO: TDateTimeField;
    CdsTRGUSERINCLUSAO: TStringField;
    CdsUSUARIO: TStringField;
    GroupBox16: TGroupBox;
    Label84: TLabel;
    DBedtDataFinalVigencia: TCMDateTimePicker;
    Label83: TLabel;
    DBedtDataInicioVigencia: TCMDateTimePicker;
    cbContratoVigente: TCheckBox;
    DataSetProvider1: TDataSetProvider;
    cdsImovelIDIMOVEL: TFloatField;
    cdsImovelIDCONTRATOIMOVEL: TFloatField;
    cdsImovelCIMVLRALUGUEL: TFloatField;
    cdsImovelCIMVLRAJUSTADO: TFloatField;
    cdsImovelFLGRATEIO: TFloatField;
    cdsImovelCIMPERCENTRATEIO: TFloatField;
    cdsImovelCIMDESCRICAO: TStringField;
    cdsImovelCODTIPIMOVEL: TStringField;
    cdsImovelIMOCODIGO: TStringField;
    cdsImovelCIMDTFIM: TDateTimeField;
    cdsImovelDSC_IMOVEL: TStringField;
    cdsImovelDSC_MESTRE: TStringField;
    cdsImovelCIMDTINI: TDateTimeField;
    CMSqlParams1: TCMSqlParams;
    tbsComplemento: TTabSheet;
    molArvoreCompl1: TmolArvoreCompl;
    cdsEventoNOMEUSUARIO: TStringField;
    CMSqlParams2: TCMSqlParams;
    CdsCondPagImovel: TCMClientDataSet;
    CdsCondPagImovelcal_tipo: TStringField;
    CdsCondPagImovelNOME: TStringField;
    CdsCondPagImovelDATAVENCIMENTO: TDateTimeField;
    CdsCondPagImovelVLRFINANC: TFloatField;
    CdsCondPagImovelNUMPARCELAS: TFloatField;
    CdsCondPagImovelMESREFREAJUSTE: TFloatField;
    CdsCondPagImovelDATACARENCIA: TDateTimeField;
    CdsCondPagImovelCODESTADO: TStringField;
    CdsCondPagImovelCODFORMA: TFloatField;
    CdsCondPagImovelCODPORTFORMA: TFloatField;
    CdsCondPagImovelCONDATACARENCIA: TDateTimeField;
    CdsCondPagImovelCONDATAFIM: TDateTimeField;
    CdsCondPagImovelCONDATAINICAREN: TDateTimeField;
    CdsCondPagImovelCONDATAINICIO: TDateTimeField;
    CdsCondPagImovelCONDIASREPASSE: TFloatField;
    CdsCondPagImovelCONDIASTOLERANCIA: TFloatField;
    CdsCondPagImovelCONNOME: TStringField;
    CdsCondPagImovelCONNUMERO: TStringField;
    CdsCondPagImovelDATAFIM: TDateTimeField;
    CdsCondPagImovelDATAINI: TDateTimeField;
    CdsCondPagImovelDATAINIAMORTIZ: TDateTimeField;
    CdsCondPagImovelDIAVENCIMENTO: TStringField;
    CdsCondPagImovelFLGTIPODIATOLERA: TStringField;
    CdsCondPagImovelIDCIDADES: TFloatField;
    CdsCondPagImovelIDCONDPAGIMOVEL: TFloatField;
    CdsCondPagImovelIDCONTRATOIMOVEL: TFloatField;
    CdsCondPagImovelIDFORMACALCIMOB: TFloatField;
    CdsCondPagImovelIDLOCATARIO: TFloatField;
    CdsCondPagImovelIDPAIS: TFloatField;
    CdsCondPagImovelMOECODIGO: TFloatField;
    CdsCondPagImovelMOECODIGOCORRENTE: TFloatField;
    CdsCondPagImovelMOESIGLA: TStringField;
    CdsCondPagImovelPERIODO: TFloatField;
    CdsCondPagImovelPERIODOREAJUSTE: TFloatField;
    CdsCondPagImovelPERIODOTAXA: TStringField;
    CdsCondPagImovelPRAZO: TStringField;
    CdsCondPagImovelTAXAJUROS: TFloatField;
    CdsCondPagImovelTIPOCONDPAG: TStringField;
    dsCondPagImovel: TDataSource;
    sqlDescCondicional: TCMSqlParams;
    CdsCondPagImovelINDCORRECAO: TFloatField;
    CdsCondPagImovelPERINDPROJ: TFloatField;
    cdsDescCondicional: TCMClientDataSet;
    CMSqlParams3: TCMSqlParams;
    pnlMulta: TPanel;
    dbgrdMulta: TwwDBGrid;
    pnlDetMulta: TPanel;
    grpMulta: TGroupBox;
    Label13: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label24: TLabel;
    DBedtPercentMulta: TDBRealEdit;
    DBedtVlrMulta: TDBRealEdit;
    DBcboMoedaMulta: TwwDBLookupCombo;
    GroupBox4: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    Bevel5: TBevel;
    DBspnDiaTolerancia: TwwDBSpinEdit;
    DBrdgTipoDiaTolera: TDBRadioGroup;
    DBspnDiaRepasse: TwwDBSpinEdit;
    DBrdgTipoDiaRepasse: TDBRadioGroup;
    GroupBox17: TGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    dblcbIndCM: TCMDBLookupCombo;
    dbSpinMesesAnteriores: TwwDBSpinEdit;
    grpMora: TGroupBox;
    Label30: TLabel;
    Label31: TLabel;
    Label56: TLabel;
    lblOu: TLabel;
    lblmoedajuros: TLabel;
    lblperiodjuros: TLabel;
    DBedtVlrMora: TDBRealEdit;
    DBedtPercentMora: TDBRealEdit;
    DBedtMoedaMora: TwwDBLookupCombo;
    dblcPeriodicidade: TwwDBComboBox;
    cbcbMoraProporc: TDBCheckBox;
    GroupBox18: TGroupBox;
    lblviginicio: TLabel;
    lblvigfim: TLabel;
    edDataIniVigencia: TCMDateTimePicker;
    edDataFimVigencia: TCMDateTimePicker;
    cbDataFimIndeterminada: TDBCheckBox;
    cdsMulta: TCMClientDataSet;
    dsMulta: TwwDataSource;
    CMSqlParams4: TCMSqlParams;
    cdsMultaDATAINI: TDateTimeField;
    cdsMultaDATAFIM: TDateTimeField;
    cdsMultaFLGINDETERMINADO: TStringField;
    cdsMultaDSCINDCORR: TStringField;
    cdsMultaMESREFCORRECAO: TFloatField;
    cdsMultaVLRMULTA: TFloatField;
    cdsMultaDSCMOEMULTA: TStringField;
    cdsMultaPERCMULTA: TFloatField;
    cdsMultaVLRJUROS: TFloatField;
    cdsMultaDSCMOEJUROS: TStringField;
    cdsMultaPERCJUROS: TFloatField;
    cdsMultaDSCPERIODOJUROS: TStringField;
    cdsMultaFLGJUROSPROPORC: TStringField;
    cdsMultaDIASTOLERANCIA: TFloatField;
    cdsMultaDSCTIPODIATOLERA: TStringField;
    cdsMultaDIASREPASSE: TFloatField;
    cdsMultaDSCTIPODIAREPASS: TStringField;
    cdsMultaIDCONTRATOXMULTA: TFloatField;
    cdsMultaIDCONTRATOIMOVEL: TFloatField;
    cdsMultaIDINDCORRECAO: TFloatField;
    cdsMultaMOEDAJUROS: TFloatField;
    cdsMultaMOEDAMULTA: TFloatField;
    cdsMultaPERIODOJUROS: TStringField;
    cdsMultaFLGTIPODIATOLERA: TStringField;
    cdsMultaFLGTIPODIAREPASS: TStringField;
    cdsMultaIDTIPOCUSTORECIMO: TFloatField;
    pnlMultaRescisoria: TPanel;
    gbRegra: TGroupBox;
    sbHelpRegra: TSpeedButton;
    dblcRegra: TwwDBLookupCombo;
    GroupBox10: TGroupBox;
    Label67: TLabel;
    Label71: TLabel;
    Label70: TLabel;
    DBRealEdit1: TDBRealEdit;
    DBRealEdit2: TDBRealEdit;
    GroupBox9: TGroupBox;
    edtMultaRes: TDBRealEdit;
    btnCalcMulta: TBitBtn;
    DBcboTipoRecDes: TwwDBLookupCombo;
    lbltiporeceita: TLabel;
    cdsMultaTRGDTINCLUSAO: TDateTimeField;
    cdsMultaTRGUSERINCLUSAO: TStringField;
    cdsMultaDESCCUSTORECIMO: TStringField;
    dblkTipoContrato: TwwDBLookupCombo;
    lblTipoContrato: TLabel;
    cdsTipoContrato: TCMClientDataSet;
    dsTipoContrato: TwwDataSource;
    cdsTipoContratoIDTIPOCONTRIMOB: TFloatField;
    cdsTipoContratoSIGLA: TStringField;
    cdsTipoContratoNOME: TStringField;
    CdsIDTIPOCONTRIMOB: TFloatField;
    cdsTipoContratoDESCRICAO: TStringField;
    DBrdgMesReferencia: TDBRadioGroup;
    Label57: TLabel;
    DBedtNumProcesso: TDBEdit;
    cdsEventoCODDOCUMENTO: TFloatField;
    cdsEventoUSUARIO_EXTENSO: TStringField;
    cdsEventoNUMPROCESSO: TStringField;
    lblObsAlt: TLabel;
    dbmemObservacao: TDBMemo;
    sqlContratoXDesc: TCMSqlParams;
    cdsContratoXDescOBSERVACAO: TStringField;
    cdsPortadorFormaFLGATIVO: TStringField;
    btnRateioArea: TBitBtn;
    btnRateioValorCtbl: TBitBtn;
    tsTributos: TTabSheet;
    cmspHISTPAGENCIMOV: TCMSqlParams;
    cdsHISTPAGENCIMOV: TCMClientDataSet;
    dsHISTPAGENCIMOV: TwwDataSource;
    cdsHISTPAGENCIMOVDSC_MESTRE: TStringField;
    cdsHISTPAGENCIMOVIDIMOVEL: TFloatField;
    cdsHISTPAGENCIMOVIMONOME: TStringField;
    cdsHISTPAGENCIMOVANO: TFloatField;
    cdsHISTPAGENCIMOVDESCENCARGO: TStringField;
    cdsHISTPAGENCIMOVDESCSITUACAO: TStringField;
    dbgrdTributos: TwwDBGrid2;
    cdsHISTPAGENCIMOVIDENCARGO: TFloatField;
    cdsHISTPAGENCIMOVIDSITUACAO: TFloatField;
    pnlTributos_Item: TPanel;
    dblcTributos_Encargo: TwwDBLookupCombo;
    dblcTributos_Situacao: TwwDBLookupCombo;
    Label58: TLabel;
    Label69: TLabel;
    Label85: TLabel;
    cdsENCARGOIMOV: TCMClientDataSet;
    cdsSITPAGENCIMOV: TCMClientDataSet;
    sqlENCARGOIMOV: TCMSqlParams;
    sqlSITPAGENCIMOV: TCMSqlParams;
    cdsENCARGOIMOVIDENCARGO: TFloatField;
    cdsENCARGOIMOVDESCENCARGO: TStringField;
    cdsSITPAGENCIMOVIDSITUACAO: TFloatField;
    cdsSITPAGENCIMOVDESCSITUACAO: TStringField;
    dbseTributos_Ano: TwwDBSpinEdit;
    dblcTributos_Imovel: TwwDBLookupCombo;
    cdsHISTPAGENCIMOV_Validacao: TCMClientDataSet;
    dsHISTPAGENCIMOV_Validacao: TwwDataSource;
    pnlTributos_Parametros: TPanel;
    Label87: TLabel;
    Label88: TLabel;
    edtTributos_Filtro_CodigoImovel: TEdit;
    Label89: TLabel;
    Label90: TLabel;
    edtTributos_Filtro_NomeImovel: TEdit;
    cbTributos_Filtro_Encargo: TComboBox;
    cbTributos_Filtro_Situacao: TComboBox;
    Label91: TLabel;
    Label92: TLabel;
    btnTributos_Filtro_Procurar: TBitBtn;
    edtTributos_Filtro_AnoFim: TwwDBSpinEdit;
    edtTributos_Filtro_AnoInicio: TwwDBSpinEdit;
    msImovelTributo: TMontaSelect;
    edtImovel: TEdit;
    btnBuscaImovel: TBitBtn;
    btnLimpaImovel: TBitBtn;
    Label93: TLabel;
    cdsHISTPAGENCIMOVCIMDTINI: TDateTimeField;
    cdsHISTPAGENCIMOVCIMDTFIM: TDateTimeField;
    cdsHISTPAGENCIMOVIMOCODIGO: TStringField;
    tbsConfissaoDivida: TTabSheet;
    dsParcelasConfissao: TDataSource;
    Label86: TLabel;
    Label94: TLabel;
    Label95: TLabel;
    DBEdit5: TDBEdit;
    Label96: TLabel;
    dsConfissaoDivida: TDataSource;
    dbConfissaoDivida: TwwDBLookupCombo;
    edtNumParcelas: TEdit;
    dbgrdParcelasConfissao: TwwDBGrid;
    cdsConfissaoDivida: TCMClientDataSet;
    cdsConfissaoDividaDATACONFISSAO: TDateTimeField;
    cdsConfissaoDividaIDCONFISSAODIVIDA: TFloatField;
    cdsConfissaoDividaIDCONTRATOIMOVEL: TFloatField;
    cdsConfissaoDividaMESCONFISSAO: TFloatField;
    cdsConfissaoDividaANOCONFISSAO: TFloatField;
    cdsConfissaoDividaCONDRESULTANTES: TFloatField;
    cdsConfissaoDividaVLRSALDO: TFloatField;
    cdsConfissaoDividaIDMODULO: TFloatField;
    cdsConfissaoDividaPLNCODIGO_OPER: TFloatField;
    edtTotalPagar: TEdit;
    qryAlterador: TQuery;
    qryAlteradorTOTAL: TFloatField;
    updParcelasConfissao: TUpdateSQL;
    qryParcelasConfissao: TwwQuery;
    qryParcelasConfissaoCODDOCUMENTO: TFloatField;
    qryParcelasConfissaoDATAVENCIMENTO: TDateTimeField;
    qryParcelasConfissaoVALOR: TFloatField;
    qryParcelasConfissaoJUR: TFloatField;
    qryParcelasConfissaoMUL: TFloatField;
    qryParcelasConfissaoCOR: TFloatField;
    qryParcelasConfissaoSALDO: TFloatField;
    qryParcelasConfissaoTOT_RECEBER: TFloatField;
    qryParcelasConfissaoRECEBIDO: TFloatField;
    qryParcelasConfissaoALT: TFloatField;
    qryParcelasConfissaoIDCONFISSAODIVIDA: TFloatField;
    qryParcelasConfissaoAlterador: TFloatField;
    qryVerificaContrato: TwwQuery;
    cdsAux: TCMClientDataSet;
    DBMemo1: TDBMemo;
    cdsEventoEVIDESCRICAO: TMemoField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure sbtnImovelClick(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeDetalheAtualizaBotoes(Sender: TObject);
    procedure DBcboPaisCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DBcboEstadoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dbgrdEventoTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure DBcboMoedaContratoChange(Sender: TObject);
    procedure DBchkIndeterminadoClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure dbgrdDetUpdateFooter(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure btnCalcMultaClick(Sender: TObject);
    procedure sbHelpRegraClick(Sender: TObject);
    procedure tbcDetalheChange(Sender: TObject);
    procedure dblkpAlteradorCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkpMoedaDescCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure cbContratoVigenteClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure CmeDetalheDelete(Sender: TObject);
    procedure molImovelAtivo1btnBuscaImovelClick(Sender: TObject);
    procedure CdsCondPagImovelCalcFields(DataSet: TDataSet);
    procedure cbDataFimIndeterminadaClick(Sender: TObject);
    procedure CmeDetalheCancel(Sender: TObject);
    procedure DBspnDiaToleranciaChange(Sender: TObject);
    procedure DBspnDiaRepasseChange(Sender: TObject);
    procedure dblcbIndCMChange(Sender: TObject);
    procedure cdsMultaAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure btnRateioAreaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnRateioValorCtblClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure molImovelTributosbtnLimpaImovelClick(Sender: TObject);
    procedure cdsHISTPAGENCIMOVBeforeInsert(DataSet: TDataSet);
    procedure btnTributos_Filtro_ProcurarClick(Sender: TObject);
    procedure edtTributos_Filtro_CodigoImovelKeyPress(Sender: TObject;
      var Key: Char);
    procedure edtTributos_Filtro_AnoFimKeyPress(Sender: TObject;
      var Key: Char);
    procedure edtTributos_Filtro_AnoInicioKeyPress(Sender: TObject;
      var Key: Char);
    procedure btnBuscaImovelClick(Sender: TObject);
    procedure btnLimpaImovelClick(Sender: TObject);
    procedure DBchkRateioClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure DBedtDataFimExit(Sender: TObject);
    procedure DBEdit5Change(Sender: TObject);
    procedure qryParcelasConfissaoCalcFields(DataSet: TDataSet);
    procedure bbtnOkDetClick(Sender: TObject);

  private
    { Private declarations }
    CtrlContratoImovel : TCtrlContratoImovel;
    CtrlMarcas         : TCtrlMarcas;
    CtrlAtividade      : TCtrlAtividade;
    CtrlImovel         : TCtrlImovel;
    CtrlMoeda          : TCtrlMoeda;
    CtrlPais           : TCtrlPais;
    CtrlEstado         : TCtrlEstado;
    CtrlCidade         : TCtrlCidade;
    CtrlBanco          : TCtrlBanco;
    CtrlEventoImovel   : TCtrlEventoImovel;
    CtrlTipoCustoRec   : TCtrlTipoCustoRecImov;
    CtrlPortadorForma  : TCtrlPortadorForma;
    CtrlMsgBoleto      : TCtrlMsgBoleto;
    CtrlSitContImob    : TCtrlSitContImob;
    CtrlCadRegra       : TCtrlCadRegra;
    CtrlRegra          : TCtrlRegra;

    //DAVID  - Pendência 17340
    CtrlTipoImovel     : TCtrlTipoImovel;

    CtrlTipoContrato   : TCtrlTipoContrato;

    CtrlParamMulta     : TCtrlParamMulta; // Daniel - 26104

    dFimContratoAnterior : TDateTime; // Daniel Simões [ data término do contrato anterior ]
    dIniContratoAnterior : TDateTime; // Daniel Simões [ data inicial do contrato anterior ]

    bMensagem: Boolean;   // Daniel

    iSitContAnt: Integer; // Situação Contratual Anterior para verificar alterações
    cdsTempImovel : TCMClientDataSet;  // temporário para validar duplicidade imóveis
    cdsTempVlrAno : TCMClientDataSet;  // temporário para validar duplicidade vlrAno

    // Daniel - 22687
    cdsTempMulta  : TCMClientDataSet;  // temporário para validar duplicidade Mula/Juros

    // Daniel - 23518
    iContrato : Integer;

    // Daniel - 22687
    iTipoRec       : Integer;
    sIndeterminado : String;
    // Fim.


    procedure SelecionaMestreDetalhe(const iIdContrato:Integer);

    //SOL 110145 Kintana 503093 Felipe de Oliveira - Início
    Function  VerificaTotais : Boolean;
    //SOL 110145 Kintana 503093 Felipe de Oliveira - Fim

    function  VerificaPreenchimento       : Boolean;
    function  VerificaPreenchimentoImovel : Boolean;
    function  VerificaPreenchimentoVlrAno : Boolean;
    function  VerificaPreenchimentoEvento : Boolean;
    function  VerificaPreenchimentoFiador : Boolean;
    function  VerificaImovelIncluso(const iIdImovel:Integer; var sErro:String; const iAno:Integer = -1; const bVlrAno:Boolean = False) : Boolean;

    //MARCELO ALMEIDA - SOL 137256 - KTN 828397
    function  VerificaPreenchimentoTributos : Boolean;
    function  VerificaTributoJaExisteParaImovel : Boolean;
    procedure CarregarComboParametrosPesquisaTributos;
    //MARCELO ALMEIDA - SOL 137256 - KTN 828397


    //DAVID - Pendência 17340
    function  VerificaPreenchimentoDescontos: Boolean;

    // Daniel - 22687
    function VerificaPreenchimentoMulta: Boolean;
    function VerificaMultaExistente(const iIdTipoRec:Integer=-1; const sFlgIndterminado:String=''): Boolean;
    // Fim.

    function VerificaValorContrato(iIDContratoImovel: integer) : Double;
    function TotalizaValorImoveisContrato: Double;

    //DAVID - Pendência 17640
    function AbreTipoAlterador : boolean;

    //function ExisteAlteracao : Boolean;
    function MudouValorCampos : Boolean;

  public
    { Public declarations }
   //SOL 110145 Kintana 503093 Felipe de Oliveira - Início
      fValorAluguelTotal,fSomatoriaAlugueis : Double;
   //SOL 110145 Kintana 503093 Felipe de Oliveira - Fim

    Procedure AbreContrato(const iIdContrato: Integer);
  end;

var
  frmCadContratoImovelMT: TfrmCadContratoImovelMT;
  //Criadas para controlar a ação do campo "Próxima Revisão"
  // Sadi Freire kintana 1796059 sol 186863
  unic : Integer;
  operation : String; //Controle de ações Inserir e Alterar
  security : String; //Controle de ações do evento onChange do campo Término da Vigência

  //Criada para controlar a mensagem de exigencia do Início da Vigencia
  // Sadi Freire kintana 1796059 sol 186863
  msg : Integer;


implementation

uses dBaseDados, uMensErro, uSistema, uComunsImobiliario, dMS, uModuloImobiliario,
     fCadEventoContratoMT, uVerificaPreenchimento;

{$R *.DFM}

procedure TfrmCadContratoImovelMT.FormCreate(Sender: TObject);

begin
   inherited;
   // Sadi Freire kintana 1796059 sol 186863
   security := 'never';
   unic := 0;

   dtmMS.MS_Contrato.Filtro.Text :=  'C.IDRESPONSAVEL = PR.IDPESSOA(+)' + #13 +
                                     'C.IDLOCATARIO = PL.IDPESSOA(+)'   + #13 +
                                     'C.IDRESPONSAVEL = U.IDUSUARIO(+)' + #13 +
                                     'C.IDTIPOCONTRIMOB = TC.IDTIPOCONTRIMOB(+)' + #13 +
                                     'C.FLGTIPOCONTRATO = ''L'''        + #13;


  // Cria os CtrlObjects dos objetos a serem utilizados
  CtrlContratoImovel := TCtrlContratoImovel.Create( Sistema.IdEmpresa,
                                                    Sistema.IdModulo,
                                                    Sistema.IdUsuario,
                                                    Sistema.IdEspAcesso,
                                                    Sistema.UsaPlanoPatro );
  CtrlImovel         := TCtrlImovel.Create;
  CtrlMarcas         := TCtrlMarcas.Create;
  CtrlAtividade      := TCtrlAtividade.Create;
  CtrlMoeda          := TCtrlMoeda.Create;
  CtrlPais           := TCtrlPais.Create;
  CtrlEstado         := TCtrlEstado.Create;
  CtrlCidade         := TCtrlCidade.Create;
  CtrlBanco          := TCtrlBanco.Create;
  CtrlEventoImovel   := TCtrlEventoImovel.Create;
  CtrlTipoCustoRec   := TCtrlTipoCustoRecImov.Create;
  CtrlPortadorForma  := TCtrlPortadorForma.Create;
  CtrlMsgBoleto      := TCtrlMsgBoleto.Create;
  CtrlSitContImob    := TCtrlSitContImob.Create;
  CtrlCadRegra       := TCtrlCadRegra.Create;
  CtrlRegra          := TCtrlRegra.Create;

  // Andre Mesquita - Pendência 24081
  CtrlTipoContrato   := TCtrlTipoContrato.Create;

  //DAVID  - Pendência 17340
  CtrlTipoImovel    := TCtrlTipoImovel.Create;

  // Daniel - 26104
  CtrlParamMulta    := TCtrlParamMulta.Create( Sistema.IdEmpresa,
                                               Sistema.IdModulo,
                                               Sistema.IdUsuario,
                                               Sistema.IdEspAcesso,
                                               Sistema.UsaPlanoPatro );
  // Fim.

  // Inicializa os CtrlObjects dos objetos a serem utilizados
  CtrlContratoImovel.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                                ComunsImobiliario.MensErroMT);
  CtrlImovel.InitializeAs( CtrlContratoImovel );
  CtrlMarcas.InitializeAs( CtrlContratoImovel );
  CtrlAtividade.InitializeAs( CtrlContratoImovel );
  CtrlMoeda.InitializeAs( CtrlContratoImovel );
  CtrlPais.InitializeAs( CtrlContratoImovel );
  CtrlEstado.InitializeAs( CtrlContratoImovel );
  CtrlCidade.InitializeAs( CtrlContratoImovel );
  CtrlBanco.InitializeAs( CtrlContratoImovel );
  CtrlEventoImovel.InitializeAs( CtrlContratoImovel );
  CtrlTipoCustoRec.InitializeAs( CtrlContratoImovel );
  CtrlPortadorForma.InitializeAs( CtrlContratoImovel );
  CtrlMsgBoleto.InitializeAs( CtrlContratoImovel );
  CtrlSitContImob.InitializeAs( CtrlContratoImovel );
  CtrlCadRegra.InitializeAs( CtrlContratoImovel );
  CtrlRegra.InitializeAs( CtrlContratoImovel );

  // Andre Mesquita - Pendência 24081
  CtrlTipoContrato.InitializeAs( CtrlContratoImovel );

  //DAVID  - Pendência 17340
  CtrlTipoImovel.InitializeAs( CtrlContratoImovel );

  CtrlParamMulta.InitializeAs( CtrlContratoImovel ); // Daniel - 26104

  // Associa o Cds do CtrlObject ao Cds local para as alterações locais refletirem
  // no CtrlObject
  CtrlContratoImovel.CdsContratoImovel    := Cds;
  CtrlContratoImovel.CdsContratoXImovel   := CdsImovel;
  CtrlContratoImovel.CdsContratoXVlrAno   := CdsVlrAno;
  CtrlContratoImovel.CdsEventoImovel      := cdsEvento;
  CtrlContratoImovel.CdsAvalistaXContrato := cdsFiador;

  //MARCELO ALMEIDA - SOL 137256 - KTN 828397
  CtrlContratoImovel.CdsHistpagencimov    := cdsHISTPAGENCIMOV;
  //MARCELO ALMEIDA - SOL 137256 - KTN 828397

  // Andre Mesquita - P. 24081
  CtrlTipoContrato.CdsTipoContrato        := cdsTipoContrato;

  //DAVID - Pendência 17340
  CtrlContratoImovel.CdsContratoXDesc     := cdsContratoXDesc;

  CtrlContratoImovel.CdsCondPagImovel     := CdsCondPagImovel;

  // Utilizado somente para confissão de dívidas
  CtrlContratoImovel.CdsDescCondicional   := CdsDescCondicional;

  // Daniel - 23518
  CtrlContratoImovel.CdsOutroDadoxImovel  := molArvoreCompl1.Cds;

  // Daniel - 26104 (22687)
  CtrlContratoImovel.CdsContratoXMulta    := cdsMulta;
  //CtrlParamMulta.CdsContratoXMulta    := cdsMulta;
  // Fim.

  sqlDescCondicional.Open;

  CdsImovel.Data        := CtrlContratoImovel.LookupContratoXImovel( -2 );
  cdsVlrAno.Data        := CtrlContratoImovel.LookupContratoXVlrAno( -2 );
  cdsEvento.Data        := CtrlEventoImovel.LookupEventoImovel( -1, -1, -2, -1, -1, True );
  cdsFiador.Data        := CtrlContratoImovel.LookupContratoXFiador( -2 );
  CdsCondPagImovel.Data := CtrlContratoImovel.LookupCondPagImovel( -2 );

  //MARCELO ALMEIDA - SOL 137256 - KTN 828397
  cdsHISTPAGENCIMOV.Data := CtrlContratoImovel.LookupHistoricoPagamentosEncargos(-2, -1, -1, EmptyStr, EmptyStr, -1, -1);
  pnlTributos_Parametros.Visible := True;
  cdsENCARGOIMOV.Data    := CtrlContratoImovel.LookupTiposEncargos;
  cdsSITPAGENCIMOV.Data  := CtrlContratoImovel.LookupSituacaoPagamentoEncargos;
  CarregarComboParametrosPesquisaTributos;
  //MARCELO ALMEIDA - SOL 137256 - KTN 828397

  // Daniel - 26104 (22687)
  //cdsMulta.Data         := CtrlContratoImovel.LookupMultaJuros(-2);
  cdsMulta.Data          := CtrlParamMulta.LookupMultaJuros(-2);
  // Fim.

  //DAVID - Pendência 17340
  cdsContratoXDesc.Data  := CtrlContratoImovel.LookupContratoXDesc( -2 );

  // Carrega os Cds de Lookup com os valores dos devidos CtrlObjects
  cdsMarcas.Data         := CtrlMarcas.LookupMarcas;
  cdsMoeda.Data          := CtrlMoeda.ListaMoeda;
  cdsAtividade.Data      := CtrlAtividade.LookupAtividade;
  cdsPais.Data           := CtrlPais.ListaPais;
  cdsEstado.Data         := CtrlEstado.ListaEstado(-1);
  cdsCidade.Data         := CtrlCidade.ListaCidade(-1);
  cdsBanco.Data          := CtrlBanco.LookupBanco;
  cdsTipoCustoRec.Data   := CtrlTipoCustoRec.LookupTipoCustoRecImov(Sistema.IdModulo, 'R');
  cdsPortadorForma.Data  := CtrlPortadorForma.ListPortadorforma('R');
  cdsMsgBoleto.Data      := CtrlMsgBoleto.LookupMsgBoleto(-1,Sistema.IdModulo);
  cdsSitContImob.Data    := CtrlSitContImob.LookupSitContImob;
  cdsRegra.Data          := CtrlCadRegra.ListaRegra( ModuloImobiliario.AdminImob.iGrupoRegra );

  //DAVID - Pendência 17340
  cdsMoedaDesc.Data      := CtrlMoeda.ListaMoeda( 0, False, True, 'V' );

  // Andre Mesquita - P.24081
  cdsTipoContrato.Data   := CtrlTipoContrato.LookupTipoContrato;

  // Define Defaults
  lblVigencia.Visible := False;
  if not ModuloImobiliario.AdminImob.bFlgSugereContrato then
     begin
      DBedtNumeroContrato.Enabled := True;
      DBedtNumeroContrato.Color   := clWindow;
     end
     else
     begin
      DBedtNumeroContrato.Enabled := False;
      DBedtNumeroContrato.Color   := $00C0FFFF;
  end;

  //Helen - SOL: 136341 Kintana : 815095 - Inicio
  cdsConfissaoDivida.Data   := CtrlContratoImovel.LookupConfissaoDivida(-1);
  qryParcelasConfissao.Close;
  //Helen - SOL: 136341 Kintana : 815095 - Sol

  // Cria CdsTemporários
  cdsTempImovel := TCMClientDataSet.Create( nil );
  cdsTempVlrAno := TCMClientDataSet.Create( nil );

  // Daniel - 22687
  cdsTempMulta  := TCMClientDataSet.Create( nil );
  // Daniel - 23518
  molArvoreCompl1.InicializaFrame;

  dbmemObsFianca.PlainText := True;  //WO38917 Leandro

end;

procedure TfrmCadContratoImovelMT.FormDestroy(Sender: TObject);
begin
  // Elimina os Ctrls criados
  FreeAndNil( CtrlContratoImovel );
  FreeAndNil( CtrlImovel );
  FreeAndNil( CtrlMarcas );
  FreeAndNil( CtrlAtividade );
  FreeAndNil( CtrlMoeda );
  FreeAndNil( CtrlPais );
  FreeAndNil( CtrlEstado );
  FreeAndNil( CtrlCidade );
  FreeAndNil( CtrlBanco );
  FreeAndNil( CtrlEventoImovel );
  FreeAndNil( CtrlTipoCustoRec );
  FreeAndNil( CtrlPortadorForma );
  FreeAndNil( CtrlMsgBoleto );
  FreeAndNil( CtrlSitContImob );
  FreeAndNil( CtrlCadRegra );
  FreeAndNil( CtrlRegra );

  //DAVID - Pendência 17340
  FreeAndNil( CtrlTipoIMovel );

  FreeAndNil( cdsTempImovel );
  FreeAndNil( cdsTempVlrAno );

  // Daniel - 22687
  FreeAndNil( cdsTempMulta );

  // Andre Mesquita
  FreeAndNil( CtrlTipoContrato );

  // Daniel - 26104
  FreeAndNil( CtrlParamMulta );

  // Daniel - 23518
  molArvoreCompl1.EncerraFrame;

  // Felipe de Oliveira Silva Sol150528 Ktn1096850
  //FreeAndNil( Cds );

  inherited;
end;

procedure TfrmCadContratoImovelMT.sbtnProcurarClick(Sender: TObject);
begin
  // Executa o Monta Select padrão para contratos do dtmMS ao invés do herdado no form
  CmeCadastro.Operacao := opProcurar;
  dtmMS.MS_Contrato.Executar;

  CmeCadastro.Find(Self);

  if cds.IsEmpty then
       CmeCadastro.Operacao := opVazio
  else CmeCadastro.Operacao := opIdle;
  CmeCadastro.AtualizaBotoes(self);

//SOL 110145 KINTANA 503093 Felipe de Oliveira Início
 if not cdsImovel.IsEmpty then
 begin
    //MARCELO ALMEIDA - SOL 137256 - KTN 828397
    btnRateioArea.Visible      := True;
    btnRateioValorCtbl.Visible := True;
    //MARCELO ALMEIDA - SOL 137256 - KTN 828397

    btnRateioArea.Enabled      := True;
    btnRateioValorCtbl.Enabled := True;
    end;
//SOL 110145 KINTANA 503093 Felipe de Oliveira Fim

end;


procedure TfrmCadContratoImovelMT.sbtnImovelClick(Sender: TObject);
begin
  inherited;
  // Executa o Monta Select padrão para imóvel por Contrato do dtmMS ao invés do herdado no form
  CmeCadastro.Operacao := opProcurar;

  if ModuloImobiliario.AdminImob.bFlgUsaUnidade then
     begin
     dtmMS.MS_UnidadeContrato.Executar;
     Repaint;

     // se houve busca, abre a query principal com apenas o registro selecionado
  if dtmMS.MS_UnidadeContrato.RetornouValor then
     SelecionaMestreDetalhe(StrToInt(dtmMS.MS_UnidadeContrato.ValoresChave[0]));
  end
  else
      begin
      dtmMS.MS_ImovelContrato.Executar;
      Repaint;

     // se houve busca, abre a query principal com apenas o registro selecionado
     if dtmMS.MS_ImovelContrato.RetornouValor then
        SelecionaMestreDetalhe(StrToInt(dtmMS.MS_ImovelContrato.ValoresChave[0]));
      end;

  if cds.IsEmpty then
     CmeCadastro.Operacao := opVazio
  else
     CmeCadastro.Operacao := opIdle;
  CmeCadastro.AtualizaBotoes(self);
end;

procedure TfrmCadContratoImovelMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  // redesenha o form na volta do MontaSelect
  Repaint;
  // se houve busca, abre a query principal com apenas o registro selecionado
  if dtmMS.MS_Contrato.RetornouValor then
     SelecionaMestreDetalhe(StrToInt(dtmMS.MS_Contrato.ValoresChave[0]));
end;

procedure TfrmCadContratoImovelMT.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  // Atualiza o botão de procura por imóvel, pois o mesmo não foi herdado.
  sbtnImovel.Down := False;

  // Habilita as páginas e campos memo somente na edição ou inserção
  if cmeCadastro.Operacao in [opInserir, opAlterar] then
     begin
     sbtnImovel.Enabled         := False;
     tbsGeral.Enabled           := True;
     tbsDatas.Enabled           := True;
     tbsCobranca.Enabled        := True;
     tbsFianca.Enabled          := True;
     pnlCidade.Enabled          := True;
     pnlMultaRescisoria.Enabled := True; // Daniel - 22687
     DBmemContrato.ReadOnly     := False;
   end
   else
   begin
    sbtnImovel.Enabled          := True;
    tbsGeral.Enabled            := False;
    tbsDatas.Enabled            := False;
    tbsCobranca.Enabled         := False;
    tbsFianca.Enabled           := False;
    pnlCidade.Enabled           := False;
    pnlMultaRescisoria.Enabled  := False; // Daniel - 22687
    DBmemContrato.ReadOnly      := True;
    end;
end;

procedure TfrmCadContratoImovelMT.CmeDetalheAtualizaBotoes(Sender: TObject);
begin
  inherited;
  // No tab de eventos, habilita o Descrição do evento que está fora do grid padrão
  if pgctrlDetalhe.ActivePage = tbsEventos then
     begin
    if cdsEvento.State in dsEditModes then
       gbEvento.Enabled := True
    else
       gbEvento.Enabled := False;
  end;

  if (pgctrlDetalhe.ActivePage = tbsDet) then
     cbContratoVigente.Enabled := not (cdsImovel.State in dsEditModes);
end;

procedure TfrmCadContratoImovelMT.SelecionaMestreDetalhe(const iIdContrato: Integer);
begin
  // Carrega o pacote de dados do Cds local com os valores retornados do CtrlObject
  cds.Data       := CtrlContratoImovel.LookupContratoImovel(iIdContrato);

  cdsImovel.Data := CtrlContratoImovel.LookupContratoXImovel(iIdContrato);

  cdsVlrAno.Data := CtrlContratoImovel.LookupContratoXVlrAno(iIdContrato);
  cdsFiador.Data := CtrlContratoImovel.LookupContratoXFiador(iIdContrato);

  //MARCELO ALMEIDA - SOL 137256 - KTN 828397
  cdsHISTPAGENCIMOV.Data := CtrlContratoImovel.LookupHistoricoPagamentosEncargos(iIdContrato,  -1, -1, EmptyStr, EmptyStr, -1, -1);
  pnlTributos_Parametros.Visible := True;
  //MARCELO ALMEIDA - SOL 137256 - KTN 828397

  cdsEvento.Data := CtrlEventoImovel.LookupEventoImovel( -1, -1, iIdContrato, -1, -1, True );
  cdsEstado.Data := CtrlEstado.ListaEstado(CdsIDPAIS.AsInteger);
  cdsCidade.Data := CtrlCidade.ListaCidade(CdsIDPAIS.AsInteger);

  CdsCondPagImovel.Data := CtrlContratoImovel.LookupCondPagImovel(iIdContrato);

  //DAVID - Pendência 17340
  cdsContratoXDesc.Data := CtrlContratoImovel.LookupContratoXDesc( iIdContrato );

  // Daniel - 26104 (22687)
  cdsMulta.Data  := CtrlParamMulta.LookupMultaJuros(iIdContrato);
  // Fim.

  // Daniel - 23518
  molArvoreCompl1.MontaArvore(-1,iIdContrato,'C');
  iContrato := iIdContrato;

  // Carrega conteúdo dos Frames
  molLocatario1.edtLocatario.Text           := trim(CdsDSC_LOCATARIO.AsString);
  molAdministradora1.edtAdministradora.Text := trim(CdsDSC_ADMINISTRADORA.AsString);
  molResponsavel1.edtResponsavel.Text       := trim(CdsDSC_RESPONSAVEL.AsString);

  if CdsIDLOCATARIO.IsNull then
       molLocatario1.iLocatario := -1
  else molLocatario1.iLocatario := CdsIDLOCATARIO.AsInteger;

  if CdsIDADMINIMOVEL.IsNull then
       molAdministradora1.iAdministradora := -1
  else molAdministradora1.iAdministradora := CdsIDADMINIMOVEL.AsInteger;

  if CdsIDRESPONSAVEL.IsNull then
       molResponsavel1.iResponsavel := -1
  else molResponsavel1.iResponsavel := CdsIDRESPONSAVEL.AsInteger;

  // Verifica Vigência
  if not CdsFLGSTATUS.IsNull then
     begin
     case CdsFLGSTATUS.AsString[1] of
      'R' : begin
              lblVigencia.Caption := 'Rescindido';
              lblVigencia.Visible := True;
            end;
      'V' : begin
              lblVigencia.Caption := 'Vigente';
              lblVigencia.Visible := True;
            end;
      'E' : begin
              lblVigencia.Caption := 'Encerrado';
              lblVigencia.Visible := True;
            end;
      'S' : begin
              lblVigencia.Caption := 'Suspenso';
              lblVigencia.Visible := True;
            end;
      else begin
        lblVigencia.Caption := '';
        lblVigencia.Visible := False;
      end;
    end;
  end else begin
    lblVigencia.Caption := '';
    lblVigencia.Visible := False;
  end;

  // Daniel Simões - 22/02/2006 - ----------------------------------------------
  if not ( CdsFLGSTATUS.AsString = 'V' ) then
     cbContratoVigente.Checked := False;

  // Verifica se o contrato será reajustado
  chkSemReajuste.Checked := CdsCONINDICEREAJUSTE.IsNull;

  // Guarda a situação contratual anterior para registro de evento
  iSitContAnt := CdsIDSITCONTIMOB.AsInteger;

  // habilita/desabilita Data de Término
  DBedtDataFim.Enabled := not(DBchkIndeterminado.Checked);
  // Exibe a moeda do contrato na página de imóveis
  edtMoeda.Text := trim(DBcboMoedaContrato.Text);

  // Filtra apenas os imóveis vigentes no contrato...
  cbContratoVigenteClick( Self );
  //Helen - SOL: 136341 Kintana : 815095 - Inicio
   if pgctrlDetalhe.ActivePage = tbsConfissaoDivida then
   begin
      cdsConfissaoDivida.Data   := CtrlContratoImovel.LookupConfissaoDivida(iContrato);
      Dock973.Visible := False;
      edtTotalPagar.text := '0';   edtNumParcelas.Text := '0';
   end
   else
      Dock973.Visible := True;
   //Helen - SOL: 136341 Kintana : 815095 - Fim
end;


procedure TfrmCadContratoImovelMT.DBcboPaisCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  // Abre o Cds de estado apenas com os estados do país selecionado
  cdsEstado.Data := CtrlEstado.ListaEstado(StrToInt(dbcboPais.LookupValue));
end;

procedure TfrmCadContratoImovelMT.DBcboEstadoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  // Abre o Cds de cidade apenas com as cidades do estado
  cdsCidade.Data := CtrlCidade.ListaCidade( cdsEstadoIDPAIS.AsInteger, cdsEstadoIDESTADO.AsInteger );
end;

procedure TfrmCadContratoImovelMT.dbgrdEventoTitleButtonClick(Sender: TObject; AFieldName: String);
begin
  inherited;
  // Altera o indice do Grid conforme seleção
  case pgctrlDetalhe.ActivePageIndex of
     //Helen - SOL: 136341 Kintana : 815095
     //1 : cdsImovel.IndexFieldNames := AFieldName;
     //2 : cdsVlrAno.IndexFieldNames := AFieldName;
     2 : cdsImovel.IndexFieldNames := AFieldName;
     3 : cdsVlrAno.IndexFieldNames := AFieldName;

    //DAVID - Pendência 17340
    // 3 : cdsContratoXDesc.IndexFieldNames := AFieldName; - Helen - SOL: 136341 Kintana : 815095
     4 : cdsContratoXDesc.IndexFieldNames := AFieldName;

     8 : cdsEvento.IndexFieldNames := AFieldName;
    10 : cdsFiador.IndexFieldNames := AFieldName;
  end;
end;

procedure TfrmCadContratoImovelMT.CmeCadastroInsert(Sender: TObject);
begin
  // Limpa TODOS os Cds para um novo registro, -2 abre grid em branco
  SelecionaMestreDetalhe( -2 );

  inherited;

  // Retorna para o Tab principal
  tbcDetalhe.TabIndex       := 0;
  pgctrlDetalhe.ActivePage  := tbsGeral;
  tbcDetalheChange( Self );

  if DBedtNumeroContrato.CanFocus then
     DBedtNumeroContrato.SetFocus
  else
     DBedtNomeContrato.SetFocus;

  // Carrega Defaults
  CdsIDPESSOA.AsInteger         := Sistema.IdEmpresa;
  CdsFLGTIPOCONTRATO.asString   := 'L';
  CdsFLGINDETERMINADO.asString  := 'N';
  CdsFLGFIANCA.AsString         := 'N';
  CdsFLGTIPODIAVENC.asString    := 'C';
  CdsFLGTIPODIATOLERA.asString  := 'C';
  CdsFLGCOMPETALUGUEL.asString  := 'C';
  CdsCONMESREFREAJUSTE.AsString := 'A';
  CdsCONDIASTOLERANCIA.asFloat  := 0;
  CdsCONDIASREPASSE.AsInteger   := 0;
  CdsCONTAXAADMIN.AsInteger     := 0;
  CdsCONQUANTVAGAS.AsInteger    := 0;
  CdsFLGCOBRANCAAUTO.asInteger  := 1;
  CdsCONPERALUGUEL.asInteger    := 1;
  CdsFLGMORAPROPORC.AsFloat     := 1;
  DBchkCobrancaAuto.Checked     := True;
  DBchkIndeterminado.Checked    := False;
  chkSemReajuste.Checked        := False;
  iSitContAnt                   := 0;

  // Excluir após apagar os campos ref. ao aluguel variável !!!
  CdsFLGTIPOALUGUEL.AsString    := 'F';  // Fixo

  // se houver integração com CAP/CAR, preenche o Portador Forma e Tipo de Receita default
  if ModuloImobiliario.AdminImob.bFlgIntegraCapCar then
     begin
     CdsIDTIPOCUSTORECIMO.asInteger := ModuloImobiliario.AdminImob.iTipoReceitaAlug;
     DBcboTipoRecCusto.Enabled      := True;
     DBcboTipoRecCusto.LookupValue  := IntToStr(ModuloImobiliario.AdminImob.iTipoReceitaAlug);

     CdsCODPORTFORMA.asInteger      := ModuloImobiliario.AdminImob.iCodPortForma;
     DBcboPortadorForma.Enabled     := True;
     DBcboPortadorForma.LookupValue := IntToStr(ModuloImobiliario.AdminImob.iCodPortForma);
  end;

  // Limpa o conteúdo dos frames
  molLocatario1.btnLimpaLocatarioClick(Self);
  molAdministradora1.btnLimpaAdministradoraClick(Self);
  molResponsavel1.btnLimpaResponsavelClick(Self);

  // Daniel - 23518
  molArvoreCompl1.FlgStatus := True;
end;

procedure TfrmCadContratoImovelMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  // se houver integração com CAP/CAR, preenche o Portador Forma default
  if ModuloImobiliario.AdminImob.bFlgIntegraCapCar then
     DBcboPortadorForma.Enabled := True;
  // Daniel - 23518
     molArvoreCompl1.FlgStatus  := True;
end;

procedure TfrmCadContratoImovelMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);

var xTeste : Boolean;

begin
  inherited;
  // Limpa campos memo
  if trim(DBmemContrato.Text)  = EmptyStr  then
     CdsCONDESCRICAO.Clear;
  if trim(DBmemObsFianca.Text) = EmptyStr then
     CdsCONOBSFIANCA.Clear;

  // Limpa campos de reajuste
  if chkSemReajuste.Checked then
     begin
     CdsCONINDICEREAJUSTE.Clear;
     CdsCONDATAREAJUSTE.Clear;
     CdsCONPROXREAJUSTE.Clear;
     CdsCONPERREAJUSTE.Clear;
     end;

// Daniel - 23272 - Início -----------------------------------------------------
  // Se foi alterada a data inicial do contrato...
  if (dIniContratoAnterior<>CdsCONDATAINICIO.AsDateTime) then
      begin
      MsgDlg('A data inicial do contrato foi alterada. Serão alteradas também'+#13+
             'as datas iniciais da vigência de todos os imóveis do mesmo período.',
             'Informação',mtInformation,[mbOk],0);

    cdsImovel.First;
    while not cdsImovel.Eof do begin
      if (cdsImovelCIMDTINI.AsDateTime=dIniContratoAnterior) then
         begin
         cdsImovel.Edit;
         cdsImovelCIMDTINI.AsDateTime := CdsCONDATAINICIO.AsDateTime;
         cdsImovel.Post;
         end;
      cdsImovel.Next;
    end;
  end;
  // Se foi alterada a data final do contrato...
  if (dFimContratoAnterior<>CdsCONDATAFIM.AsDateTime) then
      begin
      MsgDlg('A data do término do contrato foi alterada. Serão alteradas também'+#13+
             'as datas do término da vigência de todos os imóveis do mesmo período.',
             'Informação',mtInformation,[mbOk],0);

    cdsImovel.First;
    while not cdsImovel.Eof do
       begin
      if (cdsImovelCIMDTFIM.AsDateTime=dFimContratoAnterior) then
         begin
         cdsImovel.Edit;
         cdsImovelCIMDTFIM.AsDateTime := CdsCONDATAFIM.AsDateTime;
         cdsImovel.Post;
      end;
      cdsImovel.Next;
    end;
  end;
  // Daniel - 23272 - Fim --------------------------------------------------------

  // Aplica Alterações
  Accept := CtrlContratoImovel.GravaContratoImovel;

  // Daniel - 23518
  molArvoreCompl1.FlgStatus := False;
end;

//SOL 110145 Kintana 503093 Felipe de Oliveira - Início
function TfrmCadContratoImovelMT.VerificaTotais: Boolean;
begin
   Result := True;
   fSomatoriaAlugueis := 0;

   //Fitra apenas os imóveis ativos...
   if cbContratoVigente.Checked then
   begin
     cdsImovel.Filtered  := False;
     cdsImovel.Filter    := ' ( (CIMDTFIM IS NOT NULL) AND ('+QuotedStr(DateToStr(Date))+' >= CIMDTINI AND '+QuotedStr(DateToStr(Date))+' <= CIMDTFIM) ) OR ' +
                                    ' ( (CIMDTFIM IS NULL) AND ('+QuotedStr(DateToStr(Date))+' >= CIMDTINI) ) ';
     cdsImovel.Filtered  := True;
   end;


   cdsImovel.First;
   while not cdsImovel.Eof do
   begin
      fSomatoriaAlugueis := fSomatoriaAlugueis + cdsImovel.FieldByName('CIMVLRAJUSTADO').AsFloat;
      cdsImovel.next;
   end;
   if cbContratoVigente.Checked then
    cdsImovel.Filtered   := False;

   if FloatToStr(DBedtValorContrato.Value) <> FloatToStr(RoundCM(fSomatoriaAlugueis,2)) then
     Result := False
   else
     CtrlContratoImovel.fTotalContratoReajustado := fSomatoriaAlugueis;
end;
//SOL 110145 Kintana 503093 Felipe de Oliveira - Fim

procedure TfrmCadContratoImovelMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  // Aplica Alterações de exclusão ( ordem inversa da inclusão - filho / pai )
  cdsImovel.Filtered := false;
  Accept := CtrlContratoImovel.ExcluiContratoImovel;
  if Accept then begin
     SelecionaMestreDetalhe( -2 );
  end;
end;

procedure TfrmCadContratoImovelMT.CmeCadastroBeforeConfirma(
  sender: TObject; var Accept: Boolean);
begin
  inherited;

  // Carrega Campos dos Frames para o cds de imóvel
  if cds.State in dsEditModes then begin
    if (molLocatario1.iLocatario > 0) then
         CdsIDLOCATARIO.AsInteger := molLocatario1.iLocatario
    else CdsIDLOCATARIO.Clear;
    if (molAdministradora1.iAdministradora > 0) then
         CdsIDADMINIMOVEL.AsInteger := molAdministradora1.iAdministradora
    else CdsIDADMINIMOVEL.Clear;
    if (molResponsavel1.iResponsavel > 0) then
         CdsIDRESPONSAVEL.AsInteger := molResponsavel1.iResponsavel
    else CdsIDRESPONSAVEL.Clear;

    Accept := VerificaPreenchimento;
  end;
end;

function TfrmCadContratoImovelMT.VerificaPreenchimento: Boolean;
begin
  Result := False;

  // Verifica dados TAB Geral
  try
    if (DBedtValorContrato.Value <= 0) and (cds.FieldByName('FLGSTATUS').asString = 'V') and (cds.State in [dsInsert])then
      raise Evalidacao.createVal('Por favor preencha o valor do contrato.',DBedtValorContrato);
    //SOL 110145 Kintana 503093 Felipe de Oliveira - Fim

    //SOL 110145 Kintana 503093 Felipe de Oliveira - Início
    if (cds.State in [dsInsert]) or ((cds.State in [dsEdit]) and  ((cds.FieldByName('CONVLRAJUSTADO').asFloat <> VerificaValorContrato(iContrato))
       or (cds.FieldByName('CONVLRAJUSTADO').asFloat <> TotalizaValorImoveisContrato))) then
    begin
      if (not VerificaTotais) and (cds.FieldByName('FLGSTATUS').asString = 'V') then
          raise Evalidacao.createVal('A somatória dos aluguéis dos imóveis no contrato ('+FloatToStr(RoundCM(fSomatoriaAlugueis,2))+
                                     ') é diferente do valor total do contrato('+FloatToStr(RoundCM(DBedtValorContrato.Value,2))+').'+#13+#10+
                                     '  Por favor corrija o valor do contrato  ou aluguel e tente denovo.',DBedtValorContrato);
    end;


    if (not ModuloImobiliario.AdminImob.bFlgSugereContrato) and (length(trim(DBedtNumeroContrato.Text)) = 0) then
      raise EValidacao.CreateVal('É necessário indicar o Número do Contrato', DBedtNumeroContrato);

    if length(trim(DBedtNomeContrato.Text)) = 0 then
       raise EValidacao.CreateVal('É necessário indicar o Nome do Contrato', DBedtNomeContrato);

    if (molLocatario1.iLocatario <= 0) then
        raise EValidacao.CreateVal('É necessário indicar o Locatário!', molLocatario1.btnBuscaLocatario);

    if VarToStr(trim(DBcboMoedaContrato.LookupValue)) = EmptyStr then
       raise EValidacao.CreateVal('É necessário indicar a Moeda do Contrato!', DBcboMoedaContrato);

  except
    on ev : EValidacao do
       begin
      if ev.Show then
         MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
      tbcDetalhe.TabIndex      := 0;
      pgctrlDetalhe.ActivePage := tbsGeral;
      if ev.Control.CanFocus then
         ev.Control.SetFocus;
      Exit;
    end;
  end;

  // Verifica TAB de Datas
  try
    if CdsCONDATAINICIO.IsNull then
       raise EValidacao.CreateVal('É necessário indicar a Data de Início da Vigência!', DBedtDataInicio);

    if (trim(CdsFLGINDETERMINADO.AsString) = 'N') and (CdsCONDATAFIM.IsNull) then
       raise EValidacao.CreateVal('É necessário indicar a Data de Término da Vigência!', DBedtDataFim);

    if CdsCONDATACARENCIA.IsNull then
       raise EValidacao.CreateVal('É necessário indicar a Data de Término da Carência!', DBedtDataFimCarencia);

  except
    on ev : EValidacao do
       begin
       if ev.Show then
          MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
          Repaint;
      tbcDetalhe.TabIndex      := 3;
      pgctrlDetalhe.ActivePage := tbsDatas;
      if ev.Control.CanFocus then
         ev.Control.SetFocus;
      Exit;
    end;
  end;

  // Verifica TAB de Cobrança
  try
    if (trim(CdsFLGTIPOCONTRATO.AsString) = 'L') and (CdsCONDIAVENCIMENTO.isNULL) then
       raise EValidacao.CreateVal('É necessário indicar a Dia de Vencimento do Contrato!', DBspnVencimento);

    if (trim(CdsFLGTIPOCONTRATO.AsString) = 'L') and (CdsFLGTIPODIAVENC.isNULL) then
       raise EValidacao.CreateVal('É necessário indicar o tipo do Dia de Vencimento!', DBrdgTipoDiaVenc);

    // Daniel - comentado devido à implementação da pendência 22687
    if (trim(CdsFLGTIPOCONTRATO.AsString) = 'L') and (VarToStr(trim(DBcboTipoRecCusto.LookupValue)) = EmptyStr) then
       raise EValidacao.CreateVal('É necessário indicar o Tipo de Receita referente ao Aluguel!', DBcboTipoRecCusto);

    if (ModuloImobiliario.AdminImob.bFlgIntegraCapCar) and (trim(DBcboPortadorForma.LookupValue) = EmptyStr) then
       raise EValidacao.CreateVal('É necessário indicar a Forma de Cobrança!', DBcboPortadorForma);

    if (CdsFLGTIPOCONTRATO.AsString = 'L') and (CdsFLGCOMPETALUGUEL.IsNull) then
       raise EValidacao.CreateVal('É necessário indicar o Mês de Competência do Aluguel!', DBrdgCompetencia);

    if not chkSemReajuste.Checked then
       begin
       if CdsCONDATAREAJUSTE.IsNULL then
          raise EValidacao.CreateVal('É necessário indicar a data base do Reajuste!', DBedtUltReajuste);

      if CdsCONPROXREAJUSTE.IsNULL then
         raise EValidacao.CreateVal('É necessário indicar a data base do Reajuste!', DBedtProxReajuste);

      if CdsCONPERREAJUSTE.IsNULL then
         raise EValidacao.CreateVal('É necessário indicar a periodicidade do Reajuste!', DBspnPeriodicidadeReajuste);

      if VarToStr(Trim(DBcboIndiceReajuste.LookupValue)) = EmptyStr then
         raise EValidacao.CreateVal('É necessário indicar o indice de Reajuste!', DBcboIndiceReajuste);

      if (cdsPortadorFormaFLGATIVO.AsString = 'N') then
         raise EValidacao.CreateVal('Forma de cobrança selecionada está desativada!', DBcboPortadorForma);
    end;
  except
    on ev : EValidacao do begin
      if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      //tbcDetalhe.TabIndex      := 4; - Helen - SOL: 136341 Kintana : 815095
      tbcDetalhe.TabIndex      := 5;
      pgctrlDetalhe.ActivePage := tbsCobranca;
      if ev.Control.CanFocus then
         ev.Control.SetFocus;
      Exit;
    end;
  end;

  // Verifica TAB de Observações ( País/Estado/Cidade )
  try
    if CdsIDPAIS.IsNull then
       raise EValidacao.CreateVal('É necessário indicar o País do Contrato!', DBcboPais);

    if CdsCODESTADO.isNULL then
       raise EValidacao.CreateVal('É necessário indicar o Estado do Contrato!', DBcboEstado);

    if CdsIDCIDADES.isNULL then
       raise EValidacao.CreateVal('É necessário indicar a Cidade do Contrato!', DBcboCidade);

  except
    on ev : EValidacao do begin
      if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      //tbcDetalhe.TabIndex      := 5;  - Helen - SOL: 136341 Kintana : 815095
      tbcDetalhe.TabIndex      := 7;
      pgctrlDetalhe.ActivePage := tbsObs;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;
  Result := True;
end;

function TfrmCadContratoImovelMT.VerificaPreenchimentoFiador: Boolean;
begin
  Result := False;
  try
  if (molFiador1.iFiador <= 0) then
      raise EValidacao.CreateVal('É necessário indicar o Fiador do Contrato', molFiador1.btnBuscaFiador);
  except
    on ev : EValidacao do
       begin
      if ev.Show then
         MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
      tbcDetalhe.TabIndex      := 9;
      pgctrlDetalhe.ActivePage := tbsFiadores;
      if ev.Control.CanFocus then
         ev.Control.SetFocus;
      Exit;
    end;
  end;
  Result := True;
end;

function TfrmCadContratoImovelMT.VerificaPreenchimentoImovel: Boolean;
var sErro : String;
begin
  Result := False;

  try
    if (molImovelAtivo1.iImovel <= 0) then
      raise EValidacao.CreateVal('É necessário indicar um Imóvel', molImovelAtivo1.btnBuscaImovel);

    if VerificaImovelIncluso(molImovelAtivo1.iImovel, sErro) then
      raise EValidacao.CreateVal(sErro, molImovelAtivo1.btnBuscaImovel);

// Daniel Simões - Início ------------------------------------------------------
    if not (CtrlContratoImovel.CdsContratoXImovel.FieldByName('CIMDTINI').IsNull) then begin
      // Se a Data do Início da Vigência for inferior a Data do início do Contrato...
      if (CtrlContratoImovel.CdsContratoXImovel.FieldByName('CIMDTINI').AsDateTime)<
         (Cds.FieldByName('CONDATAINICIO').AsDateTime) then
          raise EValidacao.createVal('A data do Início da Vigência não pode ser inferior a data do Início do Contrato.',DBedtDataInicioVigencia);
    end
      else
      raise EValidacao.createVal('É necessário indicar a Data do Início da Vigência.',DBedtDataInicioVigencia);

    // Realiza o teste apenas se não houver prazo indeterminado...
    if (CdsFLGINDETERMINADO.IsNull) or (Cds.FieldByName('FLGINDETERMINADO').AsString='N') then
       begin
       if not (CtrlContratoImovel.CdsContratoXImovel.FieldByName('CIMDTFIM').IsNull) then
          begin
        // Imóvel: Se a Data do Início for superior a Data do Término...
        if ((CtrlContratoImovel.CdsContratoXImovel.FieldByName('CIMDTINI').AsDateTime)>
           (CtrlContratoImovel.CdsContratoXImovel.FieldByName('CIMDTFIM').AsDateTime)) then
          raise EValidacao.createVal('A data do Início da Vigência não pode ser superior a data do Término.',DBedtDataInicioVigencia);

        // Se a Data do Término da Vigência for superior a Data do Término do Contrato...
        if ((CtrlContratoImovel.CdsContratoXImovel.FieldByName('CIMDTFIM').AsDateTime)>
           (Cds.FieldByName('CONDATAFIM').AsDateTime)) then
          raise EValidacao.createVal('A data do Término da Vigência não pode ser superior a data do Término do Contrato.',DBedtDataFinalVigencia);
      end else begin
        // Se a Data Inicial da Vigência for superior a Data do Término do Contrato...
        if ((CtrlContratoImovel.CdsContratoXImovel.FieldByName('CIMDTINI').AsDateTime)>
           (Cds.FieldByName('CONDATAFIM').AsDateTime)) then
          raise EValidacao.createVal('A data do Início da Vigência não pode ser superior a data do Término do Contrato.', DBedtDataInicioVigencia);
      end;
    end;
// Daniel Simões - Fim ---------------------------------------------------------

// Daniel - 24159 - Início -----------------------------------------------------
    if (cdsImovel.State=dsEdit) then
        begin
      // 29/01/2007
       if (molImovelAtivo1.iImovel<>cdsImovelIDIMOVEL.AsInteger) then
           begin
           if (CtrlContratoImovel.ExisteLancamento(cdsImovelIDIMOVEL.AsInteger,cdsImovelIDCONTRATOIMOVEL.AsInteger)) then
           raise EValidacao.CreateVal('Não é possível alterar este imóvel do contrato pois já existem lançamentos'+#13+
                                     'registrados. Altere a vigência do imóvel para desativar o mesmo.', molImovelAtivo1.btnBuscaImovel);
           end;
    end;
// Daniel - 24159 - Fim --------------------------------------------------------

    //Início - William Santana - SOL 230104 PPM 519149
    //Início - William Santana - SOL 260023 PPM 1033917
    // Verificar somente caso haja alteração de vigência, de contrato ou insersão de novo contrato
    if (cdsImovel.State in [dsEdit]) then
       cdsTempImovel.RecNo :=  cdsImovel.RecNo;
    if (cdsImovel.fieldByName('CIMDTINI').AsString <> cdsTempImovel.fieldByName('CIMDTINI').AsString) or
       (cdsImovel.fieldByName('CIMDTFIM').AsString <> cdsTempImovel.fieldByName('CIMDTFIM').AsString) or
       (molImovelAtivo1.iImovel                    <> cdsTempImovel.fieldByName('IDIMOVEL').AsInteger) or
       (cdsImovel.State in [dsinsert]) then
    begin
    //Término - William Santana -  SOL 260023 PPM 1033917
      qryVerificaContrato.Close;
      qryVerificaContrato.ParamByName('IDIMOVEL').AsInteger := molImovelAtivo1.iImovel;
      qryVerificaContrato.ParamByName('IDCONTRATOIMOVEL').AsInteger := cdsImovelIDCONTRATOIMOVEL.AsInteger;
      qryVerificaContrato.ParamByName('CIMDTINICIO').AsString  := DBedtDataInicioVigencia.text; //SOL 260023 PPM 1033917
      qryVerificaContrato.ParamByName('CIMDTFIM').AsString     := DBedtDataFinalVigencia.text;  //SOL 260023 PPM 1033917
      qryVerificaContrato.Open;

      if not (qryVerificaContrato.IsEmpty ) then
      begin
        raise EValidacao.CreateVal('Existe contrato vigente para este imóvel. '
        +'Não é possível realizar a associação de um imóvel em dois contratos vigentes no mesmo período.', molImovelAtivo1.btnBuscaImovel);
      end;
    end; //William Santana - SOL 260023 PPM 1033917
    //Término - William Santana - SOL 230104 PPM 519149

  except
    on ev : EValidacao do begin
      if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      //tbcDetalhe.TabIndex      := 1; - Helen - SOL: 136341 Kintana : 815095
      tbcDetalhe.TabIndex      := 2;
      pgctrlDetalhe.ActivePage := tbsDet;
      if ev.Control.CanFocus then
         ev.Control.SetFocus;
      Exit;
    end;
  end;
  Result := True;
end;

function TfrmCadContratoImovelMT.VerificaPreenchimentoVlrAno: Boolean;
var sErro : String;
begin
  Result := False;
  try
    if (molImovelAtivo2.iImovel <= 0) then
      raise EValidacao.CreateVal('É necessário indicar um Imóvel', molImovelAtivo2.btnBuscaImovel);

    if (DBspnAno.Value <= 0) then
        raise EValidacao.CreateVal('É necessário indicar o Ano de início do novo valor', DBspnAno);

    if (dbedtVlrAno.Value <= 0) then
        raise EValidacao.CreateVal('É necessário indicar o novo valor a ser cobrado para o imóvel', dbedtVlrAno);

    if VerificaImovelIncluso(molImovelAtivo2.iImovel, sErro, StrToInt(FloatToStr(DBspnAno.Value)), True) then
        raise EValidacao.CreateVal(sErro, molImovelAtivo2.btnBuscaImovel);

  except
    on ev : EValidacao do
      begin
      if ev.Show then
         MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      //tbcDetalhe.TabIndex      := 2;  - Helen - SOL: 136341 Kintana : 815095
      tbcDetalhe.TabIndex      := 3;
      pgctrlDetalhe.ActivePage := tbsValorFuturo;
      if ev.Control.CanFocus then
         ev.Control.SetFocus;
      Exit;
    end;
  end;
  Result := True;
end;

function TfrmCadContratoImovelMT.VerificaPreenchimentoEvento: Boolean;
begin
  Result := False;
  try
    if (trim(dbedtDataEvento.Text) = EmptyStr) then
        raise EValidacao.CreateVal('|Informe a data do evento.', dbedtDataEvento);

    if length(trim(DBedtCabEvento.Text)) = 0 then
       raise EValidacao.CreateVal('Informe o cabeçalho do evento.', dbedtCabEvento);
  except
    on ev : EValidacao do
       begin
      if ev.Show then
         MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      if ev.Control.CanFocus then
         ev.Control.SetFocus;
      Exit;
    end;
  end;
  Result := True;
end;

procedure TfrmCadContratoImovelMT.CmeDetalheInsert(Sender: TObject);
var iDia, iMes, iAno : word;
begin
  // Carrega cds temporários para validar duplicidade na função VerificaImovelIncluso
  cdsTempImovel.Data := cdsImovel.Data;
  cdsTempVlrAno.Data := cdsVlrAno.Data;

  // Daniel - 22687
  cdsTempMulta.Data  := cdsMulta.Data;

  inherited;

  if pgctrlDetalhe.ActivePage = tbsDet then
     begin
     cdsImovelFLGRATEIO.AsFloat := 0;
    //Felipe de Oliveira SOL156166
    if cdsImovel.State in [dsinsert] then
       cdsImovelCIMPERCENTRATEIO.AsFloat := 100.00 ;
    DBchkRateio.Checked := False;
    molImovelAtivo1.btnLimpaImovelClick(Self);
    molImovelAtivo1.btnBuscaImovel.SetFocus;
    end;

  if (pgctrlDetalhe.ActivePage = tbsValorFuturo) then
     begin
     DecodeDate(Date, iAno, iMes, iDia);
     cdsVlrAnoFLGCORRIGE.AsString := 'S';
     cdsVlrAnoANOINICIO.AsInteger := iAno;
     dbchkCorrigeVlrAno.Checked   := True;
     molImovelAtivo2.btnLimpaImovelClick(Self);
     molImovelAtivo2.btnBuscaImovel.SetFocus;
     end;

  if (pgctrlDetalhe.ActivePage = tbsEventos) then
     begin
     cdsEventoFLGAVISO.AsString := 'N';
     cbAvisoEvento.Checked      := False;
     end;

  if (pgctrlDetalhe.ActivePage = tbsFiadores) then
     begin
     molFiador1.btnLimpaFiadorClick( Self );
     molFiador1.btnBuscaFiador.SetFocus;
     end;

  //DAVID - Pendência 17340
  if (pgctrlDetalhe.ActivePage = tbsDescontos) then
     begin
     cdsContratoXDescIDCONTRATOXDESC.AsFloat := 0;
     if not AbreTipoAlterador then
     begin
       pgctrlDetalhe.ActivePage := tbsDet;
       tbcDetalheChange( tbcDetalhe );
     end;
  end;

  //MARCELO ALMEIDA - SOL 137256 - KTN 828397
  if (pgctrlDetalhe.ActivePage = tsTributos) then
  begin
    cdsHISTPAGENCIMOV.FieldByName('ANO').AsInteger := StrToInt(FormatDateTime('yyyy', Now()));
    dblcTributos_Imovel.Enabled    := True;
    dbseTributos_Ano.Enabled       := True;
    dblcTributos_Encargo.Enabled   := True;
    dblcTributos_Situacao.Enabled  := True;
    pnlTributos_Parametros.Visible := False;
    btnLimpaImovel.Enabled         := True;
    btnBuscaImovel.Enabled         := True;
    btnLimpaImovelClick(btnLimpaImovel);
    cbContratoVigente.Visible      := False;
  end;
  //MARCELO ALMEIDA - SOL 137256 - KTN 828397
  //Helen - SOL: 136341 Kintana : 815095 - Inicio
   if pgctrlDetalhe.ActivePage = tbsConfissaoDivida then
   begin
      cdsConfissaoDivida.Data   := CtrlContratoImovel.LookupConfissaoDivida(iContrato);
      Dock973.Visible := False;
      edtTotalPagar.text := '0';   edtNumParcelas.Text := '0';
   end
   else
      Dock973.Visible := True;
   //Helen - SOL: 136341 Kintana : 815095 - Fim
end;

procedure TfrmCadContratoImovelMT.CmeDetalheEdit(Sender: TObject);
begin
  // Carrega cds temporários para validar duplicidade na função VerificaImovelIncluso
  cdsTempImovel.Data := cdsImovel.Data;
  cdsTempVlrAno.Data := cdsVlrAno.Data;

  // Daniel - 22687
  cdsTempMulta.Data  := cdsMulta.Data;

  inherited;

  // Carrega os frames com o conteúdo do registro para serem atualizados
  if (pgctrlDetalhe.ActivePage = tbsDet) then
     begin
     molImovelAtivo1.edtImovel.Text := (trim(cdsImovelDSC_MESTRE.AsString) + ' - ' + trim(cdsImovelDSC_IMOVEL.AsString));
     molImovelAtivo1.iImovel        := cdsImovelIDIMOVEL.AsInteger;
     molImovelAtivo1.sMestre        := trim(cdsImovelDSC_MESTRE.AsString);
     molImovelAtivo1.sImovel        := trim(cdsImovelDSC_IMOVEL.AsString);
     molImovelAtivo1.sCodTipoImo    := trim(cdsImovelCODTIPIMOVEL.AsString);
     molImovelAtivo1.sImoCodigo     := trim(cdsImovelIMOCODIGO.AsString);
     molImovelAtivo1.btnBuscaImovel.SetFocus;
     end;

  if (pgctrlDetalhe.ActivePage = tbsValorFuturo) then
     begin
     molImovelAtivo2.edtImovel.Text := (trim(cdsVlrAnoDSC_MESTRE.AsString) + ' - ' + trim(cdsVlrAnoDSC_IMOVEL.AsString));
     molImovelAtivo2.iImovel        := cdsVlrAnoIDIMOVEL.AsInteger;
     molImovelAtivo2.sMestre        := trim(cdsVlrAnoDSC_MESTRE.AsString);
     molImovelAtivo2.sImovel        := trim(cdsVlrAnoDSC_IMOVEL.AsString);
     molImovelAtivo2.btnBuscaImovel.SetFocus;
     end;

  if (pgctrlDetalhe.ActivePage = tbsFiadores) then
     begin
     molFiador1.edtFiador.Text := trim(cdsFiadorNF_FIADOR.AsString);
     molFiador1.iFiador        := cdsFiadorIDAVALISTA.AsInteger;
     molFiador1.sFiador        := trim(cdsFiadorNF_FIADOR.AsString);
     molFiador1.sFiador_RS     := trim(cdsFiadorRS_FIADOR.AsString);
     molFiador1.btnBuscaFiador.SetFocus;
     end;

  //MARCELO ALMEIDA - SOL 137256 - KTN 828397
  if (pgctrlDetalhe.ActivePage = tsTributos) then
  begin
    dblcTributos_Imovel.Enabled    := False;
    dbseTributos_Ano.Enabled       := False;
    dblcTributos_Encargo.Enabled   := False;
    dblcTributos_Situacao.Enabled  := True;
    pnlTributos_Parametros.Visible := False;
    btnLimpaImovel.Enabled := False;
    btnBuscaImovel.Enabled := False;
    edtImovel.Text := (trim(cdsHISTPAGENCIMOVDSC_MESTRE.AsString) +' - '+trim(cdsHISTPAGENCIMOVIMONOME.AsString));
    cbContratoVigente.Visible := False;
  end;
  //MARCELO ALMEIDA - SOL 137256 - KTN 828397

  { Daniel Simões - Descobri que estava abrindo a query somente no Insert e
    coloquei pra abrir aqui também... }
  if (pgctrlDetalhe.ActivePage = tbsDescontos) then
     begin
     cdsContratoXDescIDCONTRATOXDESC.AsFloat := 0;
     if not AbreTipoAlterador then
     begin
       pgctrlDetalhe.ActivePage := tbsDet;
       tbcDetalheChange(tbcDetalhe);
     end;
  end;
end;

procedure TfrmCadContratoImovelMT.CmeDetalheConfirma(Sender: TObject);
begin
  //DAVID - Pendência 17340
  //Todos os pageindex >= 3 foram aumentados devido à inclusão da page Descontos

  case pgctrlDetalhe.ActivePageIndex of
    1:begin
        if (cdsImovel.State in dsEditModes) then
           begin
          if VerificaPreenchimentoImovel then
             begin
             cdsImovelIDIMOVEL.AsInteger    := molImovelAtivo1.iImovel;
             cdsImovelDSC_MESTRE.AsString   := molImovelAtivo1.sMestre;
             cdsImovelDSC_IMOVEL.AsString   := molImovelAtivo1.sImovel;
             cdsImovelCODTIPIMOVEL.AsString := molImovelAtivo1.sCodTipoImo;
             cdsImovelIMOCODIGO.AsString    := molImovelAtivo1.sImoCodigo;
            inherited;
          end;
        end else inherited;
      end; // END BEGIN 1

    2:begin
        if (cdsVlrAno.State in dsEditModes) then
           begin
          if VerificaPreenchimentoVlrAno then
             begin
             cdsVlrAnoIDIMOVEL.AsInteger  := molImovelAtivo2.iImovel;
             cdsVlrAnoDSC_MESTRE.AsString := molImovelAtivo2.sMestre;
             cdsVlrAnoDSC_IMOVEL.AsString := molImovelAtivo2.sImovel;
            inherited;
          end;
        end else inherited;
      end; // END BEGIN 2

    // DAVID - Pendência 17340
    //3:begin  - Helen - SOL: 136341 Kintana : 815095
    4:begin
        if cdsContratoXDesc.State in dsEditModes then begin
          if VerificaPreenchimentoDescontos then begin
            inherited;
          end;
        end else inherited;
      end; // END BEGIN 3

// Daniel - 22687 - Início -----------------------------------------------------
    6:begin
        if cdsMulta.State in dsEditModes then
           begin
          if VerificaPreenchimentoMulta then
             begin
            // PREENCHE OS CAMPOS COM AS STRINGS PARA MELHOR VISUALIZAÇÃO PELO USUÁRIO
            cdsMultaDSCMOEMULTA.AsString     := trim(DBcboMoedaMulta.Text);
            cdsMultaDSCMOEJUROS.AsString     := trim(DBedtMoedaMora.Text);
            cdsMultaDSCPERIODOJUROS.AsString := trim(dblcPeriodicidade.Text);
            cdsMultaDSCINDCORR.AsString      := trim(dblcbIndCM.Text);
            cdsMultaDESCCUSTORECIMO.AsString := trim(DBcboTipoRecDes.Text);

            case DBrdgTipoDiaTolera.ItemIndex of
              0: cdsMultaDSCTIPODIATOLERA.AsString := 'Dias Corridos';
              1: cdsMultaDSCTIPODIATOLERA.AsString := 'Dias Úteis';
            end;

            case DBrdgTipoDiaRepasse.ItemIndex of
              0: cdsMultaDSCTIPODIAREPASS.AsString := 'Dias Corridos';
              1: cdsMultaDSCTIPODIAREPASS.AsString := 'Dias Úteis';
            end;

            inherited;
          end;
        end else inherited;
      end; // END BEGIN 6
// Daniel - 22687 - Fim --------------------------------------------------------

    8:begin
        if cdsEvento.State in dsEditModes then
           begin
          if VerificaPreenchimentoEvento then
             begin

// Daniel - 21967 ( complemento ) ----------------------------------------------
{ Acrescentei a condição de só deixar gravar o IdUsuario que está operando o
  sistema quando for inserir um novo evento... }
            if cdsEvento.State = dsInsert then
               begin
               CdsEventoIDUSUARIO.AsInteger    := Sistema.IdUsuario;
               CdsEventoFLGTIPOEVENTO.AsString := 'US';
            end;
// Daniel - 21967 ( complemento ) ----------------------------------------------

            inherited;
          end;
        end else inherited;
      end; // END BEGIN 8

    10:begin
         if (cdsFiador.State in dsEditModes) then
            begin
           if VerificaPreenchimentoFiador then
              begin
              cdsFiadorIDAVALISTA.AsInteger := molFiador1.iFiador;
              cdsFiadorNF_FIADOR.AsString   := molFiador1.sFiador;
              cdsFiadorRS_FIADOR.AsString   := molFiador1.sFiador_RS;
              inherited;
           end;
         end
         else
         inherited;
       end; // END BEGIN 10

     //MARCELO ALMEIDA - SOL 137256 - KTN 828397
     12 : begin
            if (cdsHISTPAGENCIMOV.State in dsEditModes) then
            begin
              if (VerificaPreenchimentoTributos) then
                 begin
                 cdsHISTPAGENCIMOVDESCENCARGO.AsString  := trim(cdsENCARGOIMOVDESCENCARGO.AsString);
                 cdsHISTPAGENCIMOVDESCSITUACAO.AsString := trim(cdsSITPAGENCIMOVDESCSITUACAO.AsString);

                //**MARCELO ALMEIDA - SOL 137256 - KTN 828397
                {
                cdsHISTPAGENCIMOVIDIMOVEL.AsInteger := cdsImovelIDIMOVEL.AsInteger;
                cdsHISTPAGENCIMOVIMONOME.AsString := cdsImovelDSC_IMOVEL.AsString;
                cdsHISTPAGENCIMOVDSC_MESTRE.AsString := cdsImovelDSC_MESTRE.AsString;
                }

                if (not(VerificaTributoJaExisteParaImovel)) then
                begin
                  //Foi utilizado o sbtnAltDet.Down porque CmeCadastro.Operacao e CmeCadastro.DataSource.DataSet.State não se comporta como esperado nesta herança.
                  if (sbtnAltDet.Down) then
                  begin
                    inherited;
                    pnlTributos_Parametros.Visible := (dbgrdTributos.Visible);
                    cbContratoVigente.Visible := True;
                  end
                  else
                  begin
                    inherited;
                    pnlTributos_Parametros.Visible := (dbgrdTributos.Visible) and (not(Dock974.Visible));
                    if (not(Dock974.Visible)) then
                    begin
                      cbContratoVigente.Visible := True;
                    end;
                  end;
                end
                else
                begin
                  MsgDlg('Encargo já lançado no ano para este imóvel.', 'Aviso', mtWarning, [mbOk], 0);
                  Repaint;
                  if (dblcTributos_Imovel.CanFocus) then
                  begin
                    dblcTributos_Imovel.SetFocus;
                  end;
                end;
              end;
            end
            else
            begin
              //Foi utilizado o sbtnAltDet.Down porque CmeCadastro.Operacao e CmeCadastro.DataSource.DataSet.State não se comporta como esperado nesta herança.
              if (sbtnAltDet.Down) then
              begin
                inherited;
                pnlTributos_Parametros.Visible := (dbgrdTributos.Visible);
              end
              else
              begin
                inherited;
                pnlTributos_Parametros.Visible := (dbgrdTributos.Visible) and (not(Dock974.Visible));
              end;
            end;
          end;
     //MARCELO ALMEIDA - SOL 137256 - KTN 828397

    else inherited; // ELSE CASE
  end; // END CASE
end;

procedure TfrmCadContratoImovelMT.DBcboMoedaContratoChange(Sender: TObject);
begin
  inherited;
  // Exibe a moeda do contrato na página de imóveis
  edtMoeda.Text := trim(DBcboMoedaContrato.Text);
end;

procedure TfrmCadContratoImovelMT.DBchkIndeterminadoClick(Sender: TObject);
begin
  inherited;
  // Desabilita a data final do contrato, caso este seja indeterminado
  if ( Cds.State in dsEditModes ) then
      begin // Daniel Simões - 20/02/2006 -----
      if DBchkIndeterminado.Checked then
         CdsCONDATAFIM.Clear;
    DBedtDataFim.Enabled := not DBchkIndeterminado.Checked;
  end;
end;

procedure TfrmCadContratoImovelMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;

// Daniel - 21413 - Início -----------------------------------------------------
  if (ModuloImobiliario.AdminImob.bFlgRegEvento) then
      begin
    if (Cds.UpdateStatus=usModified)       or
       (CdsImovel.UpdateStatus=usModified) or
       (CdsVlrAno.UpdateStatus=usModified) or
       (CdsFiador.UpdateStatus=usModified) or
       (CdsEvento.UpdateStatus=usModified) or
       (CdsContratoXDesc.UpdateStatus=usModified) then
    begin

      if (MsgDlg('Ocorreu uma alteração Cadastral. '+#13#10+
                 'Deseja registrar um evento para esta alteração?',
                 'Confirmação',mtConfirmation,[mbYes,mbNo],0)=mrYes) then
      begin
        // Cria form de Lancamento de Eventos
        Application.CreateForm(TfrmCadEventoContratoMT, frmCadEventoContratoMT);

        // Carrega valores e procedimentos default
        frmCadEventoContratoMT.bCadastroContrato             := True;
        frmCadEventoContratoMT.sFlgTipoEvento                := 'AR';
        frmCadEventoContratoMT.molContrato1.iContrato        := CdsIDCONTRATOIMOVEL.AsInteger;
        frmCadEventoContratoMT.molContrato1.edtContrato.Text := trim(CdsCONNOME.AsString);
        frmCadEventoContratoMT.sbtnInserirClick(Self);
        frmCadEventoContratoMT.CdsEVICABECALHO.AsString      := 'Alteração Cadastral';
        frmCadEventoContratoMT.DBedtHistorico.Enabled        := False;
        frmCadEventoContratoMT.CdsEVIDATA.AsDateTime         := Date;
        frmCadEventoContratoMT.DBedtDataHistorico.Enabled    := False;
        frmCadEventoContratoMT.Label6.Visible                := False;
        frmCadEventoContratoMT.DBedtVlrAnterior.Visible      := False;
        frmCadEventoContratoMT.Label7.Visible                := False;
        frmCadEventoContratoMT.DBedtVlrAjustado.Visible      := False;
        frmCadEventoContratoMT.Label8.Visible                := False;
        frmCadEventoContratoMT.DBedtPercent.Visible          := False;

        // Abre o form de eventos
        frmCadEventoContratoMT.Show;
      end;
    end;
  end;
// Daniel - 21413 - Fim --------------------------------------------------------

  // Verifica a necessidade de registro de evento para Situação Contratual
  if (CdsIDSITCONTIMOB.AsInteger <> iSitContAnt) then
      begin
      if MsgDlg('Houve alteração da Situação Contratual. ' +#13#10+
                'Deseja registrar um evento para a nova situação ?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin

      // Cria form de Lancamento de Eventos
      Application.CreateForm(TfrmCadEventoContratoMT, frmCadEventoContratoMT);

      // Carrega valores e procedimentos default
      frmCadEventoContratoMT.bCadastroContrato := True;
      frmCadEventoContratoMT.sFlgTipoEvento    := 'US';
      frmCadEventoContratoMT.molContrato1.iContrato        := CdsIDCONTRATOIMOVEL.AsInteger;
      frmCadEventoContratoMT.molContrato1.edtContrato.Text := trim(CdsCONNOME.AsString);
      frmCadEventoContratoMT.sbtnInserirClick( Self );
      frmCadEventoContratoMT.CdsEVICABECALHO.AsString := 'Alteração da Situação Contratual';
      frmCadEventoContratoMT.CdsEVIDATA.AsDateTime    := Date;

      // Abre o form de eventos
      frmCadEventoContratoMT.Show;
    end;
  end;

  // Recarrega o registro após a edição ( bug do padrão )
  if (cmeCadastro.Operacao = opAlterar) then
     begin
     cmeCadastro.Operacao := opProcurar;
     SelecionaMestreDetalhe(CdsIDCONTRATOIMOVEL.AsInteger);
     end;
end;


procedure TfrmCadContratoImovelMT.sbtnAltDetClick(Sender: TObject);
begin
  if (pgctrlDetalhe.ActivePage = tbsEventos) then
      begin
      if (not CdsEventoFLGTIPOEVENTO.IsNull) and (trim(CdsEventoFLGTIPOEVENTO.AsString) <> 'US') then
          begin
          MsgDlg('Eventos de sistema não podem ser editados.', 'Aviso', mtWarning, [mbOk], 0);
          sbtnAltDet.Down    := False;
          tbsEventos.Enabled := False;
          end
      else
     begin
// Daniel - 21967 - ------------------------------------------------------------
      if (ModuloImobiliario.AdminImob.bFlgAlteraEvento=True) then
          begin

        if (Sistema.IdUsuario<>cdsEventoIDUSUARIO.AsInteger) then
           begin
           MsgDlg('Eventos de sistema só podem ser editados pelo usuário de lançamento', 'Aviso', mtWarning, [mbOk], 0);
           sbtnAltDet.Down    := False;
           tbsEventos.Enabled := False;
        end else begin
          inherited;

          sbtnAltDet.Down    := True;
          tbsEventos.Enabled := True;
        end;

      end else begin
        inherited;

        sbtnAltDet.Down    := True;
        tbsEventos.Enabled := True;
      end;
// Daniel - 21967 - ------------------------------------------------------------
    end;
  end
  else
  begin
    inherited;
  end;
end;

procedure TfrmCadContratoImovelMT.sbtnExcluiDetClick(Sender: TObject);
begin
  if (pgctrlDetalhe.ActivePage = tbsEventos) then
     begin
    if (not CdsEventoFLGTIPOEVENTO.IsNull) and (trim(CdsEventoFLGTIPOEVENTO.AsString) <> 'US') then
       begin
       MsgDlg('Eventos de sistema não podem ser excluídos.', 'Aviso', mtWarning, [mbOk], 0);
       sbtnAltDet.Down := False;
    end
    else
    begin

// Daniel - 21967 - ------------------------------------------------------------
      if (ModuloImobiliario.AdminImob.bFlgAlteraEvento=True) then
          begin
          if (Sistema.IdUsuario<>cdsEventoIDUSUARIO.AsInteger) then
             begin
             MsgDlg('Eventos de sistema só podem ser excluídos pelo usuário de lançamento', 'Aviso', mtWarning, [mbOk], 0);
          sbtnAltDet.Down := False;
        end
        else
        inherited;
      end
      else
      inherited;
// Daniel - 21967 - ------------------------------------------------------------

    end;
  end
  else
  begin
    inherited;
  end;
end;

procedure TfrmCadContratoImovelMT.dbgrdDetUpdateFooter(Sender: TObject);
var fTotalAtual, fTotalAnt : Extended;
    cdsTemp : TCMClientDataSet;
begin
  inherited;
  fTotalAtual := 0;
  fTotalAnt   := 0;
  try
    try
       cdsTemp          := TCMClientDataSet.Create( nil );
       cdsTemp.Data     := cdsImovel.Data;
       cdsTemp.Filter   := cdsImovel.Filter;
       cdsTemp.Filtered := cdsImovel.Filtered;
       cdsTemp.First;

       while not cdsTemp.Eof do
         begin
         fTotalAtual := (fTotalAtual + cdsTemp.FieldByName('CIMVLRAJUSTADO').AsFloat);
         fTotalAnt   := (fTotalAnt   + cdsTemp.FieldByName('CIMVLRALUGUEL').AsFloat);
         cdsTemp.Next
         end;

         dbgrdDet.ColumnByName('CIMVLRAJUSTADO').FooterValue := FormatFloat('###,###0.00', fTotalAtual);
         dbgrdDet.ColumnByName('CIMVLRALUGUEL').FooterValue  := FormatFloat('###,###0.00', fTotalAnt);
    except
    end;
  finally
    FreeAndNil( cdsTemp );
  end;
end;

procedure TfrmCadContratoImovelMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  bMensagem := False;
  dbgrdDetUpdateFooter(Self);

  // Daniel - 23518
  molArvoreCompl1.FlgStatus := False;
end;

// Verifica se o imóvel já está incluso no Grid ( de Imóveis ou VlrAno )
function TfrmCadContratoImovelMT.VerificaImovelIncluso(const iIdImovel: Integer;
                                                       var   sErro: String;
                                                       const iAno: Integer;
                                                       const bVlrAno: Boolean): Boolean;
var bImovel : Boolean;
begin
  Result := False;
  sErro  := '';

  // verifica existencia em cdsImovel
  bImovel := False;
  cdsTempImovel.First;
  while not cdsTempImovel.Eof do
    begin
    if (cdsTempImovel.FieldByName('IDIMOVEL').AsInteger = iIdImovel) then
        bImovel := True;
    cdsTempImovel.Next;
  end;

  // verifica existencia em cdsVlrAno
  if bVlrAno then
     begin
    if bImovel then
       begin
       bImovel := False;
       cdsTempVlrAno.First;
      while not cdsTempVlrAno.Eof do
        begin
        if (cdsTempVlrAno.FieldByName('IDIMOVEL').AsInteger  = iIdImovel) and
           (cdsTempVlrAno.FieldByName('ANOINICIO').AsInteger = iAno) then
            bImovel := True;
        cdsTempVlrAno.Next;
        end;
      if (bImovel) and (cdsVlrAno.State = dsInsert) then
         begin
        Result := True;
        sErro  := 'O Imóvel já está relacionado para o período informado';
      end;
    end else begin
      Result := True;
      sErro  := 'O Imóvel dever estar relacionado no contrato';
    end;
  end else begin
    if (bImovel) and (cdsImovel.State = dsInsert) then
        begin
        Result := True;
        sErro  := 'O Imóvel já está relacionado no contrato';
        end;
     end;
end;

// Abre a tela de contrato já com o contrato selecionado
procedure TfrmCadContratoImovelMT.AbreContrato(const iIdContrato: Integer);

begin
   SelecionaMestreDetalhe(iIdContrato);
   CmeCadastro.AtualizaBotoes(Self);
   sbtnAlterar.Enabled := True;
   sbtnApagar.Enabled  := True;
   Show;
end;

procedure TfrmCadContratoImovelMT.btnCalcMultaClick(Sender: TObject);
begin
  inherited;
  if VarToStr(trim(dblcRegra.LookupValue)) = EmptyStr then
      begin
      MsgDlg('Selecione uma regra de calculo', 'Aviso', mtWarning, [mbOk], 0);
      Exit;
  end;

  // Carrega dados e parametros para o ctrlRegra
  CtrlRegra.CopiaData(cds.Data);
  CtrlRegra.GravaCalculo := False;
  CtrlRegra.ReloadRule   := True;
  CtrlRegra.RuleNumber   := dblcRegra.LookupValue;

  // Executa a Regra e busca o resultado
  CtrlRegra.Execute;
  if not CtrlRegra.Error then
     edtMultaRes.Value   := StrToFloat( ComunsImobiliario.StrTran(CtrlRegra.Result,'.',',') );
end;

procedure TfrmCadContratoImovelMT.sbHelpRegraClick(Sender: TObject);
begin
  inherited;
  MsgDlg(trim(cdsRegraDESCRICAOREGRA.AsString),' Descrição da Regra ',mtInformation,[mbOk],0);
end;

function TfrmCadContratoImovelMT.AbreTipoAlterador : boolean;
var
  iTiposImoveis : integer;
  sTipoImovel : string;
begin
  Result := False;

  if cdsImovel.IsEmpty then
  begin
    MsgDlg( 'Para cadastrar descontos, é necessário que se tenham imóveis cadastrados.',
     'Aviso', mtWarning, [mbOk], 0 );
    exit;
  end;

  // Monta a string com os tipos diferentes de imóveis para passar para a função do ctrlObject
  // Conta a quantidade diferente de tipos de imóveis existentes
  iTiposImoveis := 0;
  sTipoImovel := '';

  cdsImovel.First;
  while not cdsImovel.Eof do begin
    if Pos(trim(cdsImovelCODTIPIMOVEL.AsString), sTipoImovel) = 0 then
       begin
       inc(iTiposImoveis);
       if trim(sTipoImovel) = EmptyStr then
          sTipoImovel := trim(cdsImovelCODTIPIMOVEL.AsString)
       else if (iTiposImoveis = 2) then
          sTipoImovel := QuotedStr(sTipoImovel) + ',' + QuotedStr(cdsImovelCODTIPIMOVEL.AsString)
       else
          sTipoImovel := sTipoImovel + ',' + QuotedStr( cdsImovelCODTIPIMOVEL.AsString )
    end;
    cdsImovel.Next;
  end;

  // Carrega o CDS chamando uma função do ctrlObject
  cdsAlteradorXTipoImovel.Data := CtrlTipoImovel.LookupAlteradoXTipoImo( Sistema.idEmpresa,
                                                                         -1,
                                                                         sTipoImovel,
                                                                         'R',
                                                                         'C' );
  Result := True;
end;

procedure TfrmCadContratoImovelMT.tbcDetalheChange(Sender: TObject);
begin
  inherited;
  if Sender is TTabControl then
  begin
    {//MARCELO ALMEIDA - SOL 137256 - KTN 828397
    if (((Sender as TTabControl).TabIndex = 1) or ((Sender as TTabControl).TabIndex = 12)) then
    //MARCELO ALMEIDA - SOL 137256 - KTN 828397
     - Helen - SOL: 136341 Kintana : 815095
    }
    //if (((Sender as TTabControl).TabIndex = 2) or ((Sender as TTabControl).TabIndex = 12)) then
     if (((Sender as TTabControl).TabIndex = 1) or ((Sender as TTabControl).TabIndex = 12)) then//William Moreira da Silva - SOL 226416 PPM 437042
       cbContratoVigente.Visible := True  else
       cbContratoVigente.Visible := False;
  end;

  //SOL 110145 KINTANA 503093 Felipe de Oliveira Início
 if (pgctrlDetalhe.ActivePage = tbsDet) and (not cdsImovel.IsEmpty)then
  begin
    //MARCELO ALMEIDA - SOL 137256 - KTN 828397
    btnRateioArea.Visible      := True;
    btnRateioValorCtbl.Visible := True;
    //MARCELO ALMEIDA - SOL 137256 - KTN 828397

    btnRateioArea.Enabled      := True;
    btnRateioValorCtbl.Enabled := True;
  end
  else
  begin
    //MARCELO ALMEIDA - SOL 137256 - KTN 828397
    btnRateioArea.Visible := False;
    btnRateioValorCtbl.Visible := False;
    //MARCELO ALMEIDA - SOL 137256 - KTN 828397
  end;
//SOL 110145 KINTANA 503093 Felipe de Oliveira Fim

   //Helen - SOL: 136341 Kintana : 815095 - Inicio
   if pgctrlDetalhe.ActivePage = tbsConfissaoDivida then
   begin
      cdsConfissaoDivida.Data   := CtrlContratoImovel.LookupConfissaoDivida(iContrato);
      Dock973.Visible := False;
      edtTotalPagar.text := '0';   edtNumParcelas.Text := '0';
   end
   else
      Dock973.Visible := True;
   //Helen - SOL: 136341 Kintana : 815095 - Fim
end;

function TfrmCadContratoImovelMT.VerificaPreenchimentoDescontos: Boolean;
begin
  Result := False;
  try
    if trim(dtpckrDtInicial.Text) = EmptyStr then
      raise EValidacao.CreateVal('É necessário preencher a data inicial do desconto.', dtpckrDtInicial );

    if trim(dtpckrDtFinal.Text) <> EmptyStr then
      if dtpckrDtInicial.Date > dtpckrDtFinal.Date  then
        raise EValidacao.CreateVal('A data inicial do desconto não pode ser posterior à data final.', dtpckrDtInicial );

    if trim(dblkpAlterador.Text) = EmptyStr then
      raise EValidacao.CreateVal('É necessário preencher o alterador.', dblkpAlterador );

    if (dbedtValorDesc.Value < 0) then
      raise EValidacao.CreateVal('O valor do desconto não pode ser menor que 0.', dblkpAlterador );

    if (dbedtPercDesc.Value < 0) then
      raise EValidacao.CreateVal('O percentual do desconto não pode ser menor que 0.', dblkpAlterador );

    if ((dbedtValorDesc.Value  > 0) and (dbedtPercDesc.Value > 0)) or
       ((trim(dblkpMoedaDesc.Text)  <> EmptyStr) and (dbedtPercDesc.Value > 0)) or
       ((dbedtValorDesc.Value =  0) and (dbedtPercDesc.Value = 0)) then
      raise EValidacao.CreateVal('Deve-se escolher o valor fixo ou o percentual do desconto.', dbedtValorDesc);

    if ((dbedtValorDesc.Value > 0) and (trim(dblkpMoedaDesc.Text) = EmptyStr)) or
       ((dbedtValorDesc.Value > 0) and (trim(dblkpMoedaDesc.Text) = EmptyStr)) then
      raise EValidacao.CreateVal('É necessário indicar o valor e a moeda, quando o desconto for por valor fixo.', dbedtValorDesc );

    if (dbedtPercDesc.Value > 100) then
      raise EValidacao.CreateVal('O percentual de desconto não pode ser superior a 100%.', dbedtValorDesc );
  Result := True;
  except
    on ev : EValidacao do begin
      if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
     // tbcDetalhe.TabIndex      := 3; - Helen - SOL: 136341 Kintana : 815095
      tbcDetalhe.TabIndex      := 4;
      pgctrlDetalhe.ActivePage := tbsDescontos;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;
  Result := True;
end;

procedure TfrmCadContratoImovelMT.dblkpAlteradorCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if cdsContratoXDesc.State in [dsEdit, dsInsert] then
     cdsContratoXDescDESCRICAO.AsString := trim(dblkpAlterador.Text);
end;

procedure TfrmCadContratoImovelMT.dblkpMoedaDescCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if cdsContratoXDesc.State in [dsEdit, dsInsert] then
    cdsContratoXDescMOESIGLA.AsString := dblkpMoedaDesc.Text;
end;

procedure TfrmCadContratoImovelMT.cbContratoVigenteClick(Sender: TObject);
var
  sDate: string;
begin
  inherited;
  //MARCELO ALMEIDA - SOL 137256 - KTN 828397
  case pgctrlDetalhe.ActivePageIndex of
       // 1 : begin //tabDet - Helen - SOL: 136341 Kintana : 815095
              // Daniel Simões - 14/02/2006 - ------------------------------------------------
       //2 : begin
         1 : begin//William Moreira da Silva - SOL 226416 PPM 437042
                sDate  := DateToStr(Date);

                if (cbContratoVigente.Checked) then
                begin
                  cdsImovel.Filtered := False;
                  cdsImovel.Filter   := ' ( (CIMDTFIM IS NOT NULL) AND ('+QuotedStr(sDate)+' >= CIMDTINI AND '+QuotedStr(sDate)+' <= CIMDTFIM) ) OR ' +
                                        ' ( (CIMDTFIM IS NULL) AND ('+QuotedStr(sDate)+' >= CIMDTINI) ) ';
                  cdsImovel.Filtered := True;
                end else cdsImovel.Filtered := False;

                dbgrdDetUpdateFooter(Self);
              // Daniel Simões - 14/02/2006 - ------------------------------------------------
            end;
       12 : begin //tsTributos
                sDate  := DateToStr(Date);
                if (cbContratoVigente.Checked) then
                begin
                  cdsHISTPAGENCIMOV.Filtered := False;
                  cdsHISTPAGENCIMOV.Filter   := ' ( (CIMDTFIM IS NOT NULL) AND ('+QuotedStr(sDate)+' >= CIMDTINI AND '+QuotedStr(sDate)+' <= CIMDTFIM) ) OR ' +
                                                ' ( (CIMDTFIM IS NULL) AND ('+QuotedStr(sDate)+' >= CIMDTINI) ) ';
                  cdsHISTPAGENCIMOV.Filtered := True;
                end
                else
                begin
                  cdsHISTPAGENCIMOV.Filtered := False;
                end;
            end;
  end;
  //MARCELO ALMEIDA - SOL 137256 - KTN 828397
end;

procedure TfrmCadContratoImovelMT.sbtnInsDetClick(Sender: TObject);
begin
  inherited;

// Daniel Simões - 09/08/2006 - 23011 - Início ---------------------------------
  if (Cds.FieldByName('CONDATAINICIO').IsNull) then
      begin
      MsgDlg('Informe primeiro a vigência do contrato.','Informação',mtWarning,[mbOk],0);
      bbtnCancelarDetClick(Sender);
      pgctrlDetalhe.ActivePage    := tbsDatas;
      tbcDetalhe.TabIndex         := 4;
      tbcDetalheChange(tbcDetalhe);
      DBedtDataInicio.SetFocus;
  end
  else
  begin
// Daniel Simões - 09/08/2006 - 23011 - Fim ------------------------------------

// Daniel Simões - 06/02/2006 - Início -----------------------------------------
    if (pgctrlDetalhe.ActivePage = tbsDet) then
       begin
      if not (Cds.FieldByName('CONDATAINICIO').IsNull) then //CtrlContratoImovel.CdsContratoXImovel.FieldByName('CIMDTINI').AsDateTime :=
        cdsImovel.FieldByName('CIMDTINI').AsDateTime := Cds.FieldByName('CONDATAINICIO').AsDateTime;

    if not (Cds.FieldByName('CONDATAFIM').IsNull) then //CtrlContratoImovel.CdsContratoXImovel.FieldByName('CIMDTFIM').AsDateTime :=
       cdsImovel.FieldByName('CIMDTFIM').AsDateTime := Cds.FieldByName('CONDATAFIM').AsDateTime;
    end;
// Daniel Simões - 06/02/2006 - Fim --------------------------------------------
  end; // 23011
end;

procedure TfrmCadContratoImovelMT.sbtnAlterarClick(Sender: TObject);
begin

  inherited;

// Daniel - 23272 --------------------------------------------------------------
  dIniContratoAnterior := CdsCONDATAINICIO.AsDateTime;
  dFimContratoAnterior := CdsCONDATAFIM.AsDateTime;

// Daniel - 23272 --------------------------------------------------------------

   // Sadi Freire kintana 1796059 sol 186863
   //Para controlar a ação do campo "Término Vigência"
   operation := 'Alteracao';
   security  := 'always';
end;

procedure TfrmCadContratoImovelMT.CmeDetalheDelete(Sender: TObject);
begin
// Daniel - 24159 - Início -----------------------------------------------------
  if (pgctrlDetalhe.ActivePage=tbsDet) then begin
    if CtrlContratoImovel.ExisteLancamento(cdsImovelIDIMOVEL.AsInteger,cdsImovelIDCONTRATOIMOVEL.AsInteger) then
      MsgDlg('Não é possível excluir este imóvel do contrato pois já existem lançamentos'+#13+
             'registrados. Altere a vigência do imóvel para desativar o mesmo.','Aviso',mtWarning,[mbOk],0)
    else
    inherited;
    end
      else
       inherited;
// Daniel - 24159 - Fim --------------------------------------------------------

  //MARCELO ALMEIDA - SOL 137256 - KTN 828397
  if (pgctrlDetalhe.ActivePage = tsTributos) then
      begin
      pnlTributos_Parametros.Visible := True;
      end;
  //MARCELO ALMEIDA - SOL 137256 - KTN 828397

end;

procedure TfrmCadContratoImovelMT.molImovelAtivo1btnBuscaImovelClick(
  Sender: TObject);
begin
  inherited;
  molImovelAtivo1.btnBuscaImovelClick(Sender);
end;

procedure TfrmCadContratoImovelMT.CdsCondPagImovelCalcFields(DataSet: TDataSet);
begin
   inherited;
   if cdsCondPagImovel.FieldByName('TIPOCONDPAG').AsString = 'S' then
      cdsCondPagImovel.FieldByName('cal_Tipo').AsString := 'Sinal';
   if cdsCondPagImovel.FieldByName('TIPOCONDPAG').AsString = 'V' then
      cdsCondPagImovel.FieldByName('cal_Tipo').AsString := 'A Vista';
   if cdsCondPagImovel.FieldByName('TIPOCONDPAG').AsString = 'C' then
      cdsCondPagImovel.FieldByName('cal_Tipo').AsString := 'Caução';
   if cdsCondPagImovel.FieldByName('TIPOCONDPAG').AsString = 'P' then
      cdsCondPagImovel.FieldByName('cal_Tipo').AsString := 'Parcelamento';
   if cdsCondPagImovel.FieldByName('TIPOCONDPAG').AsString = 'R' then
      cdsCondPagImovel.FieldByName('cal_Tipo').AsString := 'Repactuação';
end;

procedure TfrmCadContratoImovelMT.cbDataFimIndeterminadaClick(Sender: TObject);
begin
  inherited;

// Daniel - 22687 - Início -----------------------------------------------------
  if (cdsMulta.State in dsEditModes) then
      begin
      if (cbDataFimIndeterminada.Checked) then
          cdsMultaDATAFIM.Clear;

    if (cbDataFimIndeterminada.Checked) then
        edDataFimVigencia.Enabled := False
    else
        edDataFimVigencia.Enabled := True;
  end;
// Daniel - 22687 - Fim --------------------------------------------------------

end;

procedure TfrmCadContratoImovelMT.CmeDetalheCancel(Sender: TObject);
begin
  inherited;

  // Daniel - 22687
  if (tbcDetalhe.TabIndex=6) then
    edDataFimVigencia.Enabled := not cbDataFimIndeterminada.Checked;
  // Fim.

  //MARCELO ALMEIDA - SOL 137256 - KTN 828397
  if (pgctrlDetalhe.ActivePage = tsTributos) then
  begin
    pnlTributos_Parametros.Visible := True;
    cbContratoVigente.Visible      := True;
  end;
  //MARCELO ALMEIDA - SOL 137256 - KTN 828397

end;

// Daniel - 22687 - Início -----------------------------------------------------
function TfrmCadContratoImovelMT.VerificaPreenchimentoMulta: Boolean;
{ Valida Tab de Período de Vigência de Juros e Multa... }
var sErro : String;
begin
  Result := False;
  try
    if (Trim(edDataIniVigencia.Text)=EmptyStr) then
      raise EValidacao.createVal('Data de inicio da vigência não foi preenchida.',edDataIniVigencia);

       //Inicio - Sadi - SOL 233031 - PPM  446225
       if (Trim(dblcbIndCM.Text)=EmptyStr) then
      raise EValidacao.createVal('O índice da correção monetária não foi preenchido.',dblcbIndCM);
       //Termino - Sadi - SOL 233031 - PPM  446225
    if (Trim(edDataFimVigencia.Text)=EmptyStr) and (not cbDataFimIndeterminada.Checked) then
      raise EValidacao.createVal('Data de término da vigência não foi preenchida.',edDataFimVigencia);

    if (not cbDataFimIndeterminada.Checked) and (edDataFimVigencia.Date<edDataIniVigencia.Date) then
      raise EValidacao.createVal('Data de término da vigência não pode ser inferior a data de início da vigência.',edDataFimVigencia);

    if (trim(dblcbIndCM.Text)<>EmptyStr) and (trim(dbSpinMesesAnteriores.Text)=EmptyStr) then
      raise EValidacao.createVal('O período de utilização do índice de correção não foi definido.',dbSpinMesesAnteriores);

    if (trim(DBspnDiaTolerancia.Text)<>EmptyStr) and (DBrdgTipoDiaTolera.ItemIndex=-1) then
      raise EValidacao.createVal('O tipo de intervalo da tolerância não foi definido em dias úteis ou corridos.',DBrdgTipoDiaTolera);

    if (trim(DBspnDiaRepasse.Text)<>EmptyStr) and (DBrdgTipoDiaRepasse.ItemIndex=-1) then
      raise EValidacao.createVal('O tipo de intervalo do repasse não foi definido em dias úteis ou corridos.',DBrdgTipoDiaRepasse);

    if (DBedtVlrMulta.Value>0) and (trim(DBcboMoedaMulta.Text)=EmptyStr) then
      raise EValidacao.createVal('O tipo de moeda do valor da multa não foi definido.',DBcboMoedaMulta);

    if (DBedtVlrMora.Value>0) and (trim(DBedtMoedaMora.Text)=EmptyStr) then
      raise EValidacao.createVal('O tipo de moeda do valor dos juros de mora não foi definido.',DBedtMoedaMora);

    if (DBedtPercentMora.Value>0) and (trim(dblcPeriodicidade.Text)=EmptyStr) then
      raise EValidacao.createVal('Informe a periodicidade do percentual de juros de mora por atraso.',dblcPeriodicidade);

    if (DBedtVlrMulta.Value>0) and (DBedtPercentMulta.Value>0) then
      raise EValidacao.createVal('Para definição da multa, valor ou percentual devem estar definidos e não ambos.',DBedtVlrMulta);

    if (DBedtVlrMora.Value>0) and (DBedtPercentMora.Value>0) then
      raise EValidacao.createVal('Para definição dos juros de mora, valor ou percentual devem estar definidos e não ambos.',DBedtVlrMora);

    if (DBedtVlrMulta.Value=0) and (trim(DBcboMoedaMulta.Text)<>EmptyStr) then
      raise EValidacao.createVal('Se o tipo de moeda for definido para o valor da multa, '+#13+
                                 'é necessário informar um valor diferente de zero para a Multa.',DBedtVlrMulta);

    if (DBedtVlrMora.Value=0) and (trim(DBedtMoedaMora.Text)<>EmptyStr) then
      raise EValidacao.createVal('Se o tipo de moeda for definido para o valor dos Juros, '+#13+
                                 'é necessário informar um valor diferente de zero para os Juros.',DBedtVlrMora);

    if (cdsMultaDATAINI.AsDateTime < CdsCONDATAINICIO.AsDateTime) then
       raise EValidacao.createVal('A data de início do período de vigência está inferior a data de início do Contrato.',edDataIniVigencia);

    if ((cdsMulta.State=dsInsert) or (MudouValorCampos)) and
       (VerificaMultaExistente(cdsMultaIDTIPOCUSTORECIMO.AsInteger,cdsMultaFLGINDETERMINADO.AsString)) then
        raise EValidacao.CreateVal('Tipo de receita já existe com período indeterminado.',DBcboTipoRecDes);
  except
    on ev : EValidacao do
       begin
       if ev.Show then
          MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
          Repaint;
          tbcDetalhe.TabIndex      := 6;
          pgctrlDetalhe.ActivePage := tbsMulta;
       if ev.Control.CanFocus then
          ev.Control.SetFocus;
       Exit;
    end;
  end;
  Result := True;
end;

function TfrmCadContratoImovelMT.VerificaMultaExistente(const iIdTipoRec:Integer; const sFlgIndterminado:String): Boolean;
begin
  Result := cdsTempMulta.Locate('IDTIPOCUSTORECIMO;FLGINDETERMINADO', VarArrayOf([iIdTipoRec,sFlgIndterminado]),[]);
end;
// Daniel - 22687 - Fim --------------------------------------------------------

procedure TfrmCadContratoImovelMT.DBspnDiaToleranciaChange(
  Sender: TObject);
begin
  inherited;

  if (trim(DBspnDiaTolerancia.Text)<>EmptyStr) then
    DBrdgTipoDiaTolera.Enabled := True
  else
    DBrdgTipoDiaTolera.Enabled := False;
end;

procedure TfrmCadContratoImovelMT.DBspnDiaRepasseChange(Sender: TObject);
begin
  inherited;

  if (trim(DBspnDiaRepasse.Text)<>EmptyStr) then
      DBrdgTipoDiaRepasse.Enabled := True
  else
      DBrdgTipoDiaRepasse.Enabled := False;
end;

procedure TfrmCadContratoImovelMT.dblcbIndCMChange(Sender: TObject);
begin
  inherited;

  if (trim(dblcbIndCM.Text)<>EmptyStr) then
      begin
      dbSpinMesesAnteriores.Enabled := True;
      dbSpinMesesAnteriores.Value   := 0;
      end
  else
    dbSpinMesesAnteriores.Enabled   := False;
end;

function TfrmCadContratoImovelMT.MudouValorCampos: Boolean;
{ Variável recebe zero caso o 'Value' do campo 'IDTIPOCUSTORECIMO' tiver nulo. }
var iTipoRecTemp : Integer;
begin

// Daniel - 22687 - Início -----------------------------------------------------
  iTipoRecTemp := 0;

  if not (cdsMulta.FieldByName('IDTIPOCUSTORECIMO').IsNull) then
     iTipoRecTemp := cdsMulta.FieldByName('IDTIPOCUSTORECIMO').Value;

  Result := iTipoRec<>iTipoRecTemp;

  if not (Result) then
     Result := sIndeterminado<>cdsMulta.FieldByName('FLGINDETERMINADO').Value;
// Daniel - 22687 - Fim --------------------------------------------------------

end;

procedure TfrmCadContratoImovelMT.cdsMultaAfterScroll(DataSet: TDataSet);
begin
  inherited;

// Daniel - 22687 - Início -----------------------------------------------------
  if not (cdsMulta.FieldByName('IDTIPOCUSTORECIMO').IsNull) then
     iTipoRec := cdsMulta.FieldByName('IDTIPOCUSTORECIMO').Value;

  if not (cdsMulta.FieldByName('FLGINDETERMINADO').IsNull) then
     sIndeterminado := cdsMulta.FieldByName('FLGINDETERMINADO').Value;
// Daniel - 22687 - Fim --------------------------------------------------------

end;

procedure TfrmCadContratoImovelMT.FormShow(Sender: TObject);
begin
  inherited;
  // Desabilita DAIEA para RioPrevidencia
  if Sistema.TipoCliente = 20061 then
     begin
     gbUsuarioInclusao.Visible := False;
     lblMarca.Visible          := False;
     DBcboMarca.Visible        := False;
     lblSituacao.Left          := 16;
     lblSituacao.Top           := 142;
     dblcSitContratual.Left    := 16;
     dblcSitContratual.Top     := 156;
     end;
end;

//SOL 110145 Kintana 503093 Felipe de Oliveira
// calcula o valor dos imóveis de acordo com sua respectiva área
procedure TfrmCadContratoImovelMT.btnRateioAreaClick(Sender: TObject);
var
  cdsTemp : TCMClientDataSet;
  fAreaTotal : Double;
  iTotalImoveis : Integer;
begin
  inherited;
  cdsTemp := TCMClientDataSet.Create(nil);

  if (DBedtValorContrato.Value <= 0) then
  begin
     MessageDlg('Por favor preencha o valor do contrato.', mtWarning, [mbOK],0);
  end;

  if CmeCadastro.Operacao in [opInserir,opAlterar] then
  begin
    fAreaTotal := 0;
    Try
    //while que acha  a área total dos imóveis no cds
    cdsImovel.First;
    while not cdsImovel.Eof do
    begin

       cdsTemp.Data := CtrlContratoImovel.GetDataPacket('SELECT  I.IMOAREA FROM IMOVEL I'+
                                                        ' WHERE  I.IDIMOVEL =  '+ cdsImovelIDIMOVEL.AsString);

       fAreaTotal := (fAreaTotal + cdsTemp.FieldByName('IMOAREA').AsFloat);
       cdsImovel.Next
    end;//end while

    // while que rateia o valor dos imóveis de acordo com sua área
    cdsImovel.First;
    fValorAluguelTotal := 0;
    iTotalImoveis := cdsImovel.RecordCount;
{    if not(cdsImovel.State = dsEdit) then
    begin
      MessageDlg('O Contrato não está em modo de inserção/alteração!', mtError, [mbOK], 0);
      Exit;
    end;}

      while not cdsImovel.Eof do
      begin
         cdsTemp.Data := CtrlContratoImovel.GetDataPacket('SELECT  I.IMOAREA FROM IMOVEL I'+
                                                          ' WHERE  I.IDIMOVEL =  '+trim(cdsImovelIDIMOVEL.AsString));

         if not(cdsImovel.State = dsEdit) then
            cdsImovel.Edit;

         if cdsImovel.RecNo = iTotalImoveis then
            cdsImovelCIMVLRAJUSTADO.AsFloat :=  (DBedtValorContrato.Value - fValorAluguelTotal)
         else
         begin
           cdsImovelCIMVLRAJUSTADO.AsFloat  :=  (cdsTemp.FieldByName('IMOAREA').AsFloat * DBedtValorContrato.Value) / fAreaTotal;
           fValorAluguelTotal := (fValorAluguelTotal + cdsImovelCIMVLRAJUSTADO.AsFloat);
         end;
         cdsImovel.Post;
         cdsImovel.Next;
      end;//end while
      cdsImovel.First;
    finally
      FreeAndNil(cdsTemp);
    end;
  end//end if
  else
  begin
     MessageDlg('O rateio só pode ser aplicado durante a criação ou alteração de um contrato!', mtError, [mbOK], 0);
  end;
end;

procedure TfrmCadContratoImovelMT.FormActivate(Sender: TObject);
begin
  inherited;
//SOL 110145 KINTANA 503093 Felipe de Oliveira Início
  if (pgctrlDetalhe.ActivePage = tbsDet) and (not cdsImovel.IsEmpty)then
  begin
    //MARCELO ALMEIDA - SOL 137256 - KTN 828397
    btnRateioArea.Visible      := True;
    btnRateioValorCtbl.Visible := True;
    //MARCELO ALMEIDA - SOL 137256 - KTN 828397

    btnRateioArea.Enabled      := True;
    btnRateioValorCtbl.Enabled := True;
  end
  else
  begin
    btnRateioArea.Visible      := False;
    btnRateioValorCtbl.Visible := False;
  end;
//SOL 110145 KINTANA 503093 Felipe de Oliveira Fim
end;

procedure TfrmCadContratoImovelMT.btnRateioValorCtblClick(Sender: TObject);
var
  cdsTemp : TCMClientDataSet;
  fValorContabilTotal : Double;
  iTotalImoveis : Integer;
begin
  inherited;
  cdsTemp := TCMClientDataSet.Create(nil);

  if (DBedtValorContrato.Value <= 0) then
  begin
//     MessageDlg('Por favor preencha o valor do contrato.', mtWarning, [mbOK],0);
     Application.MessageBox(pchar('Por favor preencha o valor do contrato.'), ' Atenção !', MB_ICONEXCLAMATION + mb_OK + mb_DefButton1);
  end;

  if (CmeCadastro.Operacao in [opInserir, opAlterar]) then
     begin
     fValorContabilTotal := 0;
     Try
    //while que acha  o valor contábil total dos imóveis no cds
     cdsImovel.First;
     while not cdsImovel.Eof do
       begin

       cdsTemp.Data := CtrlContratoImovel.GetDataPacket('SELECT  (DECODE(I.IMOVLRREAVAL,NULL,I.IMOVLRMERCADO,I.IMOVLRREAVAL)) AS VlRIMOVEL FROM IMOVEL I'+
                                                        ' WHERE  I.IDIMOVEL =  '+ cdsImovelIDIMOVEL.AsString);
       fValorContabilTotal := (fValorContabilTotal + cdsTemp.FieldByName('VlRIMOVEL').AsFloat);
       cdsImovel.Next;
       end;//end while

     // while que rateia o valor dos imóveis de acordo com sua área
     cdsImovel.First;
     fValorAluguelTotal := 0;
     iTotalImoveis      := cdsImovel.RecordCount;
     while not cdsImovel.Eof do
       begin
        cdsTemp.Data := CtrlContratoImovel.GetDataPacket('SELECT  (DECODE(I.IMOVLRREAVAL,NULL,I.IMOVLRMERCADO,I.IMOVLRREAVAL)) AS VlRIMOVEL FROM IMOVEL I'+
                                                         ' WHERE  I.IDIMOVEL =  '+ cdsImovelIDIMOVEL.AsString);

     {if not(cdsImovel.State = dsEdit) then
      begin
        MessageDlg('O Contrato não está em modo de inserção/alteração!', mtError, [mbOK], 0);
        Exit;
      end;}

        if not(cdsImovel.State = dsEdit) then
          cdsImovel.Edit;

        if (cdsImovel.RecNo = iTotalImoveis) then
           cdsImovelCIMVLRAJUSTADO.AsFloat :=  (DBedtValorContrato.Value - fValorAluguelTotal)
        else
          begin
           cdsImovelCIMVLRAJUSTADO.AsFloat  :=  (cdsTemp.FieldByName('VlRIMOVEL').AsFloat * DBedtValorContrato.Value) / fValorContabilTotal;
           fValorAluguelTotal := (fValorAluguelTotal + cdsImovelCIMVLRAJUSTADO.AsFloat);
          end;

        cdsImovel.Post;
        cdsImovel.Next;
     end;//end while
     cdsImovel.First;
     Finally
       FreeAndNil(cdsTemp);
     end;
     end// fim if
     else
     begin
        MessageDlg('O rateio só pode ser aplicado durante a criação ou alteração de um contrato!', mtError, [mbOK], 0);
     end;
end;

//procedure TfrmCadContratoImovelMT.tbcDetalheChanging(Sender: TObject;
//  var AllowChange: Boolean);
//begin
//  inherited;
//  //SOL 110145 KINTANA 503093 Felipe de Oliveira Início
//  if (pgctrlDetalhe.ActivePage = tbsGeral) and (DBedtValorContrato.Value <= 0 ) then
//  begin
//     MessageDlg('Por favor preencha o valor do contrato ', mtWarning, [mbOK],0);
//     pgctrlDetalhe.ActivePage:= tbsGeral;
//     DBedtValorContrato.SetFocus;

//  end;
//  //SOL 110145 KINTANA 503093 Felipe de Oliveira Fim
//end;

procedure TfrmCadContratoImovelMT.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  if (pgctrlDetalhe.ActivePage = tbsDet) and (not cdsImovel.IsEmpty)then
      begin
    //MARCELO ALMEIDA - SOL 137256 - KTN 828397
      btnRateioArea.Visible      := True;
      btnRateioValorCtbl.Visible := True;
    //MARCELO ALMEIDA - SOL 137256 - KTN 828397

      btnRateioArea.Enabled      := True;
      btnRateioValorCtbl.Enabled := True;
      end
  else
  begin
    btnRateioArea.Visible        := False;
    btnRateioValorCtbl.Visible   := False;
  end;

  //MARCELO ALMEIDA - SOL 137256 - KTN 828397
  if (pgctrlDetalhe.ActivePage = tsTributos) then
      begin
      pnlTributos_Parametros.Visible := True;
      cbContratoVigente.Visible      := True;
      end;
  //MARCELO ALMEIDA - SOL 137256 - KTN 828397
end;

function TfrmCadContratoImovelMT.VerificaValorContrato(
  iIDContratoImovel: integer): Double;
var
  sSQL : string;
  _cdsAux : TCmClientDataSet;
begin
  _cdsAux := TCMClientDataSet.Create(nil);
  try
    sSQL := 'SELECT C.IDCONTRATOIMOVEL, C.CONVLRAJUSTADO                           '+#13+
          '       FROM CONTRATOIMOVEL C                                            '+#13+
          '       WHERE ( (C.CONDATAFIM IS NOT NULL AND                            '+#13+
          '                     SYSDATE BETWEEN C.CONDATAINICIO AND C.CONDATAFIM ) OR '+#13+
          '                (C.CONDATAFIM IS NULL AND                               '+#13+
          '                     SYSDATE >= C.CONDATAINICIO ) )                        '+#13+
          '   AND C.IDCONTRATOIMOVEL = ' + IntToStr(iIDContratoImovel);
    _cdsAux.Data := CtrlContratoImovel.GetDataPacket(sSQL);

    Result := _cdsAux.FieldByName('CONVLRAJUSTADO').asFloat;
  finally
    FreeAndNil(_cdsAux);
  end;
end;

function TfrmCadContratoImovelMT.TotalizaValorImoveisContrato: Double;
begin
  Result := 0;

   //Fitra apenas os imóveis ativos...
//   if cbContratoVigente.Checked then
//   begin
     cdsImovel.Filtered  := False;
     cdsImovel.Filter    := ' ( (CIMDTFIM IS NOT NULL) AND ('+QuotedStr(DateToStr(Date))+' >= CIMDTINI AND '+QuotedStr(DateToStr(Date))+' <= CIMDTFIM) ) OR ' +
                            ' ( (CIMDTFIM IS NULL) AND ('+QuotedStr(DateToStr(Date))+' >= CIMDTINI) ) ';
     cdsImovel.Filtered  := True;
//   end;

  cdsImovel.First;

  while not cdsImovel.Eof do
  begin
    Result := (Result + cdsImovelCIMVLRAJUSTADO.asFloat);
    cdsImovel.Next;
  end;

//  if cbContratoVigente.Checked then
   cdsImovel.Filtered  := False;

end;

procedure TfrmCadContratoImovelMT.molImovelTributosbtnLimpaImovelClick(
  Sender: TObject);
begin
  inherited;
end;

//MARCELO ALMEIDA - SOL 137256 - KTN 828397
function TfrmCadContratoImovelMT.VerificaPreenchimentoTributos: Boolean;
begin
  Result := False;
  try
    if (cdsHISTPAGENCIMOVIDIMOVEL.IsNull) then
    begin
      //**MARCELO ALMEIDA - SOL 137256 - KTN 828397
      //raise EValidacao.CreateVal('Informe o Imóvel.', dblcTributos_Imovel);
    end;

    if (dbseTributos_Ano.DataSource.DataSet.FieldByName(dbseTributos_Ano.DataField).IsNull) then
    begin
      raise EValidacao.CreateVal('Informe o Ano.', dbseTributos_Ano);
    end;

    if (dblcTributos_Encargo.DataSource.DataSet.FieldByName(dblcTributos_Encargo.DataField).IsNull) then
    begin
      raise EValidacao.CreateVal('Informe o Encargo.', dblcTributos_Encargo);
    end;

    if (dblcTributos_Situacao.DataSource.DataSet.FieldByName(dblcTributos_Situacao.DataField).IsNull) then
    begin
      raise EValidacao.CreateVal('Informe a Situação.', dblcTributos_Situacao);
    end;
  except
    on ev : EValidacao do begin
      if ev.Show then
         MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      if ev.Control.CanFocus then
         ev.Control.SetFocus;
      Exit;
    end;
  end;
  Result := True;
end;
//MARCELO ALMEIDA - SOL 137256 - KTN 828397

//MARCELO ALMEIDA - SOL 137256 - KTN 828397
function TfrmCadContratoImovelMT.VerificaTributoJaExisteParaImovel: Boolean;
begin
Result := False;
if ((cdsHISTPAGENCIMOV_Validacao.Active) and (not(cdsHISTPAGENCIMOV_Validacao.IsEmpty)) and (cdsHISTPAGENCIMOV.State = dsInsert)) then
     begin
     cdsHISTPAGENCIMOV_Validacao.First;
     Result := (cdsHISTPAGENCIMOV_Validacao.Locate('IDIMOVEL;ANO;IDENCARGO', VarArrayOf([cdsHISTPAGENCIMOVIDIMOVEL.AsFloat, cdsHISTPAGENCIMOVANO.AsFloat, cdsHISTPAGENCIMOVIDENCARGO.AsFloat]), []));
     end;
end;
//MARCELO ALMEIDA - SOL 137256 - KTN 828397

procedure TfrmCadContratoImovelMT.cdsHISTPAGENCIMOVBeforeInsert(
  DataSet: TDataSet);
begin
  inherited;
  //MARCELO ALMEIDA - SOL 137256 - KTN 828397
  cdsHISTPAGENCIMOV_Validacao.CloneCursor(cdsHISTPAGENCIMOV, False);
  //MARCELO ALMEIDA - SOL 137256 - KTN 828397
end;

//MARCELO ALMEIDA - SOL 137256 - KTN 828397
procedure TfrmCadContratoImovelMT.btnTributos_Filtro_ProcurarClick(
  Sender: TObject);
var
  anoInicio,
  anoFim : Integer;
  imovel_IdImovel : String;
  imovel_Nome : String;
  imovel_IdEncargo : Integer;
  imovel_IdSituacao : Integer;
  tributosModificados : Boolean;
begin
  inherited;
  tributosModificados := False;

  if not(cdsHISTPAGENCIMOV.IsEmpty) and ((cmeCadastro.Operacao in [opInserir, opAlterar])) then
  begin
    with TCMClientDataSet.Create(Self) do
    begin
      if (cdsHISTPAGENCIMOV.ChangeCount > 0) then
      begin
        Data := cdsHISTPAGENCIMOV.Delta;
        tributosModificados := not(IsEmpty);
      end;
      Free;
    end;
  end;

  if not(tributosModificados) then
  begin
    anoInicio         := -1;
    anoFim            := -1;
    imovel_IdImovel   := EmptyStr;
    imovel_Nome       := EmptyStr;
    imovel_IdEncargo  := -1;
    imovel_IdSituacao := -1;

    //Ano Inicio
    if (Trim(edtTributos_Filtro_AnoInicio.Text) <> EmptyStr) then
    begin
      try
        anoInicio := StrToInt(Trim(edtTributos_Filtro_AnoInicio.Text));
      except
        anoInicio := -1;
      end;
    end;

    //Ano Fim
    if ((anoInicio <> -1) and (Trim(edtTributos_Filtro_AnoFim.Text) <> EmptyStr)) then
    begin
      try
        anoFim := StrToInt(Trim(edtTributos_Filtro_AnoFim.Text));
      except
        anoFim := -1;
      end;
    end;

    if (anoInicio > anoFim) then
    begin
      MsgDlg('Valor do Ano Início deve ser maio que Ano Fim.', 'Aviso', mtWarning, [mbOk], 0);
      if (edtTributos_Filtro_AnoInicio.CanFocus) then
          begin
           edtTributos_Filtro_AnoInicio.SetFocus;
          end;
      Exit;
    end;

    //Código do Imóvel
    if (Trim(edtTributos_Filtro_CodigoImovel.Text) <> EmptyStr) then
    begin
      imovel_IdImovel := Trim(edtTributos_Filtro_CodigoImovel.Text);
    end;

    //Nome do Imóvel
    if (Trim(edtTributos_Filtro_NomeImovel.Text) <> EmptyStr) then
    begin
      imovel_Nome := Trim(edtTributos_Filtro_NomeImovel.Text);
    end;

    //Encargo
    if (cbTributos_Filtro_Encargo.ItemIndex > -1) then
    begin
      try
        imovel_IdEncargo := Integer(cbTributos_Filtro_Encargo.Items.Objects[cbTributos_Filtro_Encargo.ItemIndex]);
      except
        imovel_IdEncargo := -1;
      end;
    end;

    //Situacao
    if (cbTributos_Filtro_Situacao.ItemIndex > -1) then
    begin
      try
        imovel_IdSituacao := Integer(cbTributos_Filtro_Situacao.Items.Objects[cbTributos_Filtro_Situacao.ItemIndex]);
      except
        imovel_IdSituacao := -1;
      end;
    end;

    cdsHISTPAGENCIMOV.Data := CtrlContratoImovel.LookupHistoricoPagamentosEncargos(iContrato, anoInicio, anoFim, imovel_IdImovel, imovel_Nome, imovel_IdEncargo, imovel_IdSituacao);
 end
 else
 begin
   MsgDlg('Ocorreu alteração no cadastro de tributos, para mudar o filtro efetue a gravação do contrato.', 'Aviso', mtWarning, [mbOk], 0);
 end;
end;
//MARCELO ALMEIDA - SOL 137256 - KTN 828397

//MARCELO ALMEIDA - SOL 137256 - KTN 828397
procedure TfrmCadContratoImovelMT.CarregarComboParametrosPesquisaTributos;
begin
  edtTributos_Filtro_AnoInicio.Value := StrToInt(FormatDateTime('yyyy', Now()));;
  edtTributos_Filtro_AnoFim.Value := StrToInt(FormatDateTime('yyyy', Now()));;

  cbTributos_Filtro_Encargo.Items.Clear;
  if ((cdsENCARGOIMOV.Active) and (not(cdsENCARGOIMOV.IsEmpty))) then
  begin
    cbTributos_Filtro_Encargo.Items.InsertObject(0, '<Todos Encargos>', TObject(-1));
    cdsENCARGOIMOV.First;
    while (not(cdsENCARGOIMOV.Eof)) do
    begin
      cbTributos_Filtro_Encargo.Items.AddObject(cdsENCARGOIMOVDESCENCARGO.AsString, TObject(cdsENCARGOIMOVIDENCARGO.AsInteger));
      cdsENCARGOIMOV.Next;
    end;
  end;
  cbTributos_Filtro_Encargo.ItemIndex := 0;


  cbTributos_Filtro_Situacao.Items.Clear;
  if ((cdsSITPAGENCIMOV.Active) and (not(cdsSITPAGENCIMOV.IsEmpty))) then
  begin
    cbTributos_Filtro_Situacao.Items.InsertObject(0, '<Todas Situações>', TObject(-1));
    cdsSITPAGENCIMOV.First;
    while (not(cdsSITPAGENCIMOV.Eof)) do
    begin
      cbTributos_Filtro_Situacao.Items.AddObject(cdsSITPAGENCIMOVDESCSITUACAO.AsString, TObject(cdsSITPAGENCIMOVIDSITUACAO.AsInteger));
      cdsSITPAGENCIMOV.Next;
    end;
  end;
  cbTributos_Filtro_Situacao.ItemIndex := 0;

end;
//MARCELO ALMEIDA - SOL 137256 - KTN 828397


procedure TfrmCadContratoImovelMT.edtTributos_Filtro_CodigoImovelKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if not(Key in (['0'..'9','.',#8])) then
  begin
    Key := #0;
  end;
end;

procedure TfrmCadContratoImovelMT.edtTributos_Filtro_AnoFimKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if not(Key in (['0'..'9', #8])) then
  begin
    Key := #0;
  end;
end;

procedure TfrmCadContratoImovelMT.edtTributos_Filtro_AnoInicioKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if not(Key in (['0'..'9', #8])) then
  begin
    Key := #0;
  end;
end;

procedure TfrmCadContratoImovelMT.btnBuscaImovelClick(Sender: TObject);
var
  filtroContrato : String;
  iMestre,
  iImovel : Integer;
  sMestre,
  sImovel,
  sCodTipoImo,
  sDscTipoImo,
  sStatus,
  sImoCodigo : String;
begin
  inherited;
  //MARCELO ALMEIDA - SOL 137256 - KTN 828397
  if (cdsHISTPAGENCIMOV.State = dsInsert) then
  begin
    filtroContrato := 'CI.IDCONTRATOIMOVEL = '+IntToStr(iContrato);
    try
      msImovelTributo.Filtro.Add(filtroContrato);
      msImovelTributo.Executar;
      Repaint;
      if (msImovelTributo.RetornouValor) then
      begin
        iMestre     := StrToInt(msImovelTributo.ValoresChave[0]);
        iImovel     := StrToInt(msImovelTributo.ValoresChave[1]);
        sMestre     := msImovelTributo.ValoresChave[2];
        sImovel     := msImovelTributo.ValoresChave[3];
        sCodTipoImo := msImovelTributo.ValoresChave[4];
        sDscTipoImo := msImovelTributo.ValoresChave[6];
        sImoCodigo  := msImovelTributo.ValoresChave[7];
        sStatus     := msImovelTributo.ValoresChave[11];
        edtImovel.Text := sMestre + ' - ' + sImovel;
        cdsHISTPAGENCIMOVIDIMOVEL.AsInteger  := iImovel;
        cdsHISTPAGENCIMOVIMONOME.AsString    := sImovel;
        cdsHISTPAGENCIMOVDSC_MESTRE.AsString := sMestre;
        cdsHISTPAGENCIMOVIMOCODIGO.AsString  := sImoCodigo;
      end;
    finally
      msImovelTributo.Filtro.Delete(msImovelTributo.Filtro.IndexOf(filtroContrato));
      btnBuscaImovel.SetFocus;
    end;
  end;
  //MARCELO ALMEIDA - SOL 137256 - KTN 828397   
end;

procedure TfrmCadContratoImovelMT.btnLimpaImovelClick(Sender: TObject);
begin
  inherited;
  //MARCELO ALMEIDA - SOL 137256 - KTN 828397
  if (cdsHISTPAGENCIMOV.State = dsInsert) then
  begin
    cdsHISTPAGENCIMOVIDIMOVEL.Clear;
    cdsHISTPAGENCIMOVIMONOME.Clear;
    cdsHISTPAGENCIMOVDSC_MESTRE.Clear;
    edtImovel.Clear;
  end;
  //MARCELO ALMEIDA - SOL 137256 - KTN 828397  
end;

//Felipe de Oliveira SOL156166
procedure TfrmCadContratoImovelMT.DBchkRateioClick(Sender: TObject);
var
  porcentagem : Currency;
begin
  inherited;
  porcentagem := 0.00;

  if (cdsImovel.State in [dsinsert , dsedit]) then
  begin
       if not DBchkRateio.Checked then
       begin
          porcentagem := cdsImovelCIMPERCENTRATEIO.AsFloat;
          cdsImovelCIMPERCENTRATEIO.AsFloat := 100.00;
       end
       else
          cdsImovelCIMPERCENTRATEIO.AsFloat := porcentagem;
  end;
end;

procedure TfrmCadContratoImovelMT.sbtnInserirClick(Sender: TObject);
begin
  inherited;
operation := 'Insercao';
security  := 'always';
end;

procedure TfrmCadContratoImovelMT.bbtnCancelarClick(Sender: TObject);
begin
  security := 'never';
  unic:= 0;
  inherited;
end;

procedure TfrmCadContratoImovelMT.bbtnSairClick(Sender: TObject);
begin
  security := 'never';
  unic:= 0;
  inherited;
end;

procedure TfrmCadContratoImovelMT.bbtnConfirmarClick(Sender: TObject);
var
   sVlrSaldoReceber, sVlrSaldoPagar: Double; //SIG26726 - Marcelo Cardoso
begin


  //Início - William Santana - SOL 260023 PPM 1033917
   if (pgctrlDetalhe.ActivePage = tbsDet) then
    if not(VerificaPreenchimentoImovel) then
       exit;
  //Término - William Santana - SOL 260023 PPM 1033917

      if (DBedtDataInicio.Date =0) and (operation = 'Insercao') then
      Begin
         Application.MessageBox(pchar('Por favor, insira o ínicio da vigência'), ' Atenção !', MB_ICONEXCLAMATION + mb_OK + mb_DefButton1);
         exit;
      end;
      security := 'never';
      unic := 0;

      // Andre Imakawa - SIG 75448 - Inicio
      if (cds.FieldByName('FLGSTATUS').asString = 'V') then
      begin
        //SIG26726 - Marcelo Cardoso - INICIO
        //Verrificação de saldo em aberto e, se existir, o sistema envie um alerta indicando tal saldo a receber.

        CtrlContratoImovel.VerificaSaldoAberto(sVlrSaldoReceber, sVlrSaldoPagar, iContrato);
        if (DBedtDataFim.date <= Date) and (( sVlrSaldoReceber <> 0) or (sVlrSaldoPagar <> 0)) and
           (not DBchkIndeterminado.Checked) then //SIG43082 Peterson Victor
        begin
          Application.MessageBox(pchar('O contrato não pode ser encerrado, pois ainda possui o saldo de R$ ' +
                                          FormatFloat('#,##0.00', sVlrSaldoReceber) + ' a receber e R$ ' +
                                          FormatFloat('#,##0.00', sVlrSaldoPagar) + ' a pagar. '), ' Atenção !',
                                           MB_ICONEXCLAMATION + mb_OK + mb_DefButton1);
          Exit;
        end;
        //SIG26726 - Marcelo Cardoso - FIM
      end;
      // Andre Imakawa - SIG 75448 - Fim

      inherited;

      DBedtDataFimExit(Sender);

end;
procedure TfrmCadContratoImovelMT.DBedtDataFimExit(Sender: TObject);
// Sadi Freire kintana 1796059 sol 186863
var
date, dateLimiteDenuncia, dateAvisoDenuncia, dateProximaRevisao, dateAvisoRevisao : TDate;
dateString {, dateProximaRevisaoStr} : String;

begin
  inherited;
  msg := 1;

  //Garantindo a execução apenas quando as ações Inserir e Alterar forem acionadas

  if security <> 'never' then
     begin
  //Garantido que os parâmetros para acão de DBedtDataFimChange existe
    if trim(DBedtDataInicio.Text) <> EmptyStr then
       begin
//Recuperando a data no campo término de Vigência caso não seja vazio

    if (DBedtDataFim.Date > 0) then
       begin
       date := DBedtDataFim.Date;
      //Preenchendo o campo "Limite Denuncia" com
     // conteúdo "Término da Vigência" -3 meses
       dateLimiteDenuncia       :=  IncMonth(date, -3);
       CdsCONDATADENUNCIA.Value := dateLimiteDenuncia;

//Preenchendo o campo "Aviso Denuncia" com
// conteúdo "LimitevDenuncia" -6 meses
       dateAvisoDenuncia :=  IncMonth(dateLimiteDenuncia, -6);
       CdsCONDATAAVDENUNCIA.Value := dateAvisoDenuncia;
       end;
//Preenchendo o campo "Próxima Revisão" com  conteudo de "Inico da Vigencia" + 3 anos
if operation = 'Insercao' then
   begin
  if (DBedtDataInicio.Date > 0) then
     begin
     dateProximaRevisao :=  StrToDate(DBedtDataInicio.text);
     if (IncMonth(DBedtDataInicio.Date, +36) < DBedtDataFim.Date) Then
        CdsCONDATARENEGOC.Value := IncMonth(dateProximaRevisao, +36);
     end;
    //
 end;

//Preenchendo o campo "Próxima Revisão" com  conteudo de "Próxima Revisão" + 3 anos
if operation = 'Alteracao' then
begin
//Validando a execução da operação apenas 1 vez
 if unic <> 1 then
 begin
//dateProximaRevisaoStr := DBedtDataRenegoc.text;
//   if trim(dateProximaRevisaoStr) <> EmptyStr then
   if (DBedtDataRenegoc.Date > 0)  then
   begin
   //dateProximaRevisao :=  StrToDate(DBedtDataRenegoc.text);
    dateProximaRevisao :=  DBedtDataRenegoc.Date;
    if (IncMonth(DBedtDataRenegoc.Date, + 36) < DBedtDataFim.Date) Then
       CdsCONDATARENEGOC.Value :=  IncMonth(dateProximaRevisao, +36)
    else
       CdsCONDATARENEGOC.Value :=  DBedtDataRenegoc.Date;
   unic := 1;
   end;
   if (IncMonth(DBedtDataInicio.Date, + 36) >= DBedtDataFim.Date) Then
      CdsCONDATARENEGOC.Value  := Null;
      if (DBedtDataRenegoc.Date = 0)  then
         begin
         dateProximaRevisao      :=  DBedtDataInicio.Date;
         CdsCONDATARENEGOC.Value :=  IncMonth(dateProximaRevisao, +36);
         unic:= 1;
         end;
   end;
end;

//Preenchendo o campo "Aviso Revisão" com
// conteúdo "Próxima Revisão" - 3 meses para Inclusão e Alteração
if (DBedtDataRenegoc.Date > 0) then
   begin
   dateString := trim(DBedtDataRenegoc.Text);
   date := StrToDAte(dateString);
   dateAvisoRevisao :=  IncMonth(date, -3);
   CdsCONDATAAVRENEGOC.Value := dateAvisoRevisao;
end;
//Finaliza if responsávelpor garantir os parametros da ação de DBedtDataInicio.Text
end;

//Limpando conteúdo do campo "Solicitação de revisão"
  CMDateTimePicker2.Text := '';
 //Orientando usuário quanto a ausência de dados
//Finalizando if do security para defenir execução apenas quando inserir e alterar
end;
end;
procedure TfrmCadContratoImovelMT.DBEdit5Change(Sender: TObject);
var Saldo : Currency;   iParc : Integer;
begin
  inherited;
   //Helen - SOL: 136341 Kintana : 815095 - Inicio
   edtTotalPagar.text := '0';   edtNumParcelas.Text := '0';
   if (cdsConfissaoDividaIDCONFISSAODIVIDA.Value > 0) and
     (cdsConfissaoDividaIDCONTRATOIMOVEL.Value  > 0) then
   begin   
     qryParcelasConfissao.Close;
     qryParcelasConfissao.ParamByName('pIDCONTRATOIMOVEL').AsFloat :=  cdsConfissaoDividaIDCONTRATOIMOVEL.AsFloat;
     qryParcelasConfissao.ParamByName('pIDCONFISSAODIVIDA').AsFloat := cdsConfissaoDividaIDCONFISSAODIVIDA.AsFloat;
     qryParcelasConfissao.Open;
     qryParcelasConfissao.First;
     Saldo := 0 ; iParc := 0;
      while not qryParcelasConfissao.eof do
      begin
          iParc := iParc + 1 ;
          Saldo :=  Saldo + qryParcelasConfissaoSALDO.value ;
          qryParcelasConfissao.Next;
      end;
      edtTotalPagar.text := FormatFloat('#,##0.00', Saldo);
      edtNumParcelas.Text := IntToStr(iParc);
  end
  else
     qryParcelasConfissao.Close;

  //Helen - SOL: 136341 Kintana : 815095 - Fim
end;

procedure TfrmCadContratoImovelMT.qryParcelasConfissaoCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  if qryParcelasConfissaoCODDOCUMENTO.Value > 0 then
  begin
       qryAlterador.Close;
       qryAlterador.ParamByName('pcoddocumento').asString :=  qryParcelasConfissaoCODDOCUMENTO.AsString;
       qryAlterador.Open;
       if qryAlteradorTOTAL.Value <> 0 then
          qryParcelasConfissaoAlterador.Value :=  qryAlteradorTOTAL.Value ;

  end;
end;


procedure TfrmCadContratoImovelMT.bbtnOkDetClick(Sender: TObject);
begin
  //Início - William Santana - SOL 260023 PPM 1033917
   if (pgctrlDetalhe.ActivePage = tbsDet) then
    if not(VerificaPreenchimentoImovel) then
       exit;
  //Término - William Santana - SOL 260023 PPM 1033917
     inherited;
end;

end.
