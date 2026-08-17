unit FCadConcederBenefInssLote;
//----------------------------------------------------------------------------------------------------------------------------------
// *********************************************************************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ****************************************************************************
// *********************************************************************************************************************************
// *********************************************************************************************************************************
//------------------------------------------------------------------------------
//Nº SIG.....: 89739
//Data.......: 05/11/2020
//Responsável: Taffarel Sevaybriker
//Descrição..: Inclusão do campo DATAFINAL no demonstrativo de concessão.
//------------------------------------------------------------------------------
//Nº SIG.....: 99677
//Data.......: 05/05/2020
//Responsável: Taffarel Sevaybriker
//Descrição..: Ajuste para não utilizar o RMI atualizado para anos anteriores.
//------------------------------------------------------------------------------
//Nº SIG.....: 92983
//Data.......: 23/04/2020
//Responsável: Ewerton Beltramini
//Descrição..: Bloqueio de requerimento e concessão para casos em que o tipo de
//             requerimento não é valido para o tipo de beneficio.
//------------------------------------------------------------------------------
//Alteração  : buscarequerimentos
//Nº SIG.....: 82823
//Data.......: 27/02/2019
//Responsável: Fábio Sampaio
//Descrição..: Adequação da busca devido incompatibilidade com o TIBERO
//------------------------------------------------------------------------------
//Alteração  : gera_impressao_requerimento
//Nº SIG.....: 63530
//Data.......: 07/03/2018
//Responsável: Luiz Carlos
//Descrição..: Ajuste na exportação do demostrativo para PDF
//----------------------------------------------------------------------------------------------------------------------------------
//Alteração  : (.dfm  rpReciboCedidos, qryDet) GravarHSTBENEFBFCIARIO
//Nº SIG.....: 55933
//Data.......: 02/10/2017
//Responsável: Edilaine Ferraresi
//Descrição..: Inclusão do perfil de investimento
//----------------------------------------------------------------------------------------------------------------------------------
//Nº SIG............: 26527
//Data da Alteração.: 29/05/2017
//Responsável.......: Darivaldo Alencar
//Descrição.........: Em continuidade ao SOL Nº 269970 o SIG será aberto para analisar as melhorias da funcionalidade de
//                    Requerimento/concessão de benefícios do INSS.
//----------------------------------------------------------------------------------------------------------------------------------
//Rotina............: sbtnRequererClick1
//Nº SIG............: 43158
//Data da Alteração.: 29/03/2017
//Responsável.......: William Moreira da Silva
//Descrição.........: O calculo de quantidade de meses para rateamento esta sendo realizado incoretamente.
//----------------------------------------------------------------------------------------------------------------------------------
//Rotina............: ppDetailBand1BeforePrint
//Nº SIG............: 41240
//Data da Alteração.: 15/03/2017
//Responsável.......: William Santana
//Descrição.........: Erro na informação "conta do participante".
//----------------------------------------------------------------------------------------------------------------------------------
//Rotina............: sbtnRequererClick
//Nº SIG............: 39243
//Data da Alteração.: 09/02/2017
//Responsável.......: William Moreira da Silva
//Descrição.........: O calculo reteado esta sendo realizado incoretamente
//----------------------------------------------------------------------------------------------------------------------------------
//Rotina............: sbtnRequererClick
//Nº SIG............: 37047
//Data da Alteração.: 04/01/2017
//Responsável.......: William Moreira da Silva
//Descrição.........: Não estava reduzindo do ultimo mÊs o valor rateado
//----------------------------------------------------------------------------------------------------------------------------------
//Rotina............: bbtnDesfazerClick
//Nº SIG............: 22026
//Data da Alteração.: 20/06/2016
//Responsável.......: Edilaine
//Descrição.........: verificar todos os pontos do benefícioprev que apaga registros
//                    da Prévia e bloquear para que não seja deletado
//----------------------------------------------------------------------------------------------------------------------------------
//Rotina............: Conceder / Desfazer
//Nº SOL............: 271037
//Nº PPM............: 1350100
//Data da Alteração.: 30/03/2016
//Responsável.......: Peterson Victor
//Descrição.........: Alterações na concessão para alterar somente o
//                    processo selecionado,
//                    no processo de desfazer validar somente o processo selecionado
//----------------------------------------------------------------------------------------------------------------------------------
//Rotina............: sbtnRequererClick
//Nº SOL............: 268697
//Nº PPM............: 1271911
//Data da Alteração.: 04/02/2016
//Responsável.......: William Moreira da Silva
//Descrição.........: Atualizar os valores do beneficio na BenefBficiario
//----------------------------------------------------------------------------------------------------------------------------------
//Rotina............: buscarequerimentos
//Nº SOL............: 251599.17194
//Nº PPM............: 783173
//Data da Alteração.: 20/05/2015
//Alteração Form....: melhorias na funcionalidade
//Responsável.......: William Santana
//Descrição.........: Alteração para requer / conceder benefício para mais de um
//                    pensionista de um nucleo familiar
//----------------------------------------------------------------------------------------------------------------------------------
//Rotina............: gera_impressao_log, gera_impressao_requerimento,
//Nº SOL............: 249376.17130
//Nº PPM............: 757902
//Data da Alteração.: 06/05/2015
//Alteração Form....: melhorias na funcionalidade
//Responsável.......: William Santana
//Descrição.........: Alteração no Demonstrativo de Requerimento e Concessão de Benefícios do INSS
//----------------------------------------------------------------------------------------------------------------------------------
//Rotina............: buscarequerimentos, sbtnRequererClick
//Nº SOL............: 218687.17129
//Nº PPM............: 757901
//Data da Alteração.: 06/04/2015
//Alteração Form....: melhorias na funcionalidade
//Responsável.......: William Santana
//Descrição.........: Ajustar funcionalidades de requerimento e concessão de benefícios
//----------------------------------------------------------------------------------------------------------------------------------
//Rotinas    : AtualizaBenefHabilita
//Autor(a)   : Wylliam Leite da Silva
//Data       : 20/05/2015
//Pendência  : SOL 251334  PPM 799358
//Descricao  : Correção, FLGCONCESSAO da BENEFHABILITA não estava sendo lançada
//             como 1 na concessão
//----------------------------------------------------------------------------------------------------------------------------------
//Rotinas    : rpReciboCedidos, gera_impressao_requerimento
//Autor(a)   : Helio Lima Custodio
//Data       : 13/10/2014
//Pendência  : SOL 207871  KTN 2014291 (Continuação)
//Descricao  : (Continuação)Novo layout para Demonstrativo de Concessão
//----------------------------------------------------------------------------------------------------------------------------------
//Rotinas    : rpReciboCedidos, gera_impressao_requerimento
//Autor(a)   : Edilaine Ferraresi
//Data       : 25/07/2014
//Pendência  : SOL 207871  KTN 2014291
//Descricao  : Novo layout para Demonstrativo de Concessão
//----------------------------------------------------------------------------------------------------------------------------------
//Autor(a)   : William Moreira da Silva
//Data       : 07/05/2014
//Pendência  : SOL 231534 PPM 375351
//Descricao  : Ajusta a rotina de concessao em lote.
//----------------------------------------------------------------------------------------------------------------------------------
//Autor(a)   : Fernando Xavier
//Data       : 24/10/2013
//Pendência  : SOL 218688 Kintana 2051172
//Descricao  : Não é gravada a data de concessão.
//----------------------------------------------------------------------------------------------------------------------------------
//Autor(a)   : Otacilio Aquino / Douglas
//Data       : 03/05/2013
//Pendência  : SOL 206134 Kintana 1995209
//Descricao  : Ajuste na rubrica individual e PAB - Concessão INSS em Lote
//----------------------------------------------------------------------------------------------------------------------------------
//Autor(a)   : Marcio Sanches Spinosa/ Douglas Siqueira SOL 203886 Kintana 1970485
//Data       : 28/03/2013
//Pendência  : SOL 203886 Kintana 1970485
//Descricao  : Ajuste na função de inserção de historico de beneficio
//----------------------------------------------------------------------------------------------------------------------------------
//Autor(a)   : Douglas.Siqueira
//Data       : 08/03/2013
//Pendência  : SOL 149652/3564 Kintana 1107607
//Descricao  : Requerimento e concessão dos benefícios INSS em lote
//----------------------------------------------------------------------------------------------------------------------------------

//----------------------------------------------------------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, Db, DBTables, Wwquery, CmEventosCadastro, ImgList,
  MontaSelect, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr,
  StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, Mask, DBCtrls, wwdbdatetimepicker,
  CMDateTimePicker, wwdbedit, Wwdotdot, Wwdbcomb, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, QExport3, QExport3PDF,
  QuickRpt, Qrctrls, uCmSqlParams, DBClient, uCMClientDataSet, ppDB,
  ppDBPipe, ppDBBDE, ppBands, ppClass, ppCtrls, ppPrnabl, ppCache, ppComm,
  ppRelatv, ppProd, ppReport, CmParamReport, TXComp, TXRB, uCmRptManager,
  ppModule, raCodMod, ppParameter, ppVar, ppArchiv,FileCtrl,Registry,
  QExport3CustomSource, ppStrtch, ppSubRpt, wwdblook
  //Luiz Carlos - SIG63530 - Inicio
  ,ShellApi
  //Luiz Carlos - SIG63530 - Fim
  ;

type
  TFrmCadConcederBenefInssLote = class(TfrmCadMestreDetalheCS)
    ToolbarButton971: TToolbarButton97;
    bbtnDesfazer: TBitBtn;
    lbl_matri: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    dbedNumProcINSS: TwwDBEdit;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    wwDBEdit3: TwwDBEdit;
    wwDBEdit4: TwwDBEdit;
    wwDBEdit5: TwwDBEdit;
    wwDBEdit6: TwwDBEdit;
    dtDataInicio: TCMDateTimePicker;
    dtEvento: TCMDateTimePicker;
    Label9: TLabel;
    Label10: TLabel;
    bbtnOpcoes: TBitBtn;
    CMDateTimePicker2: TCMDateTimePicker;
    Label11: TLabel;
    CMDateTimePicker3: TCMDateTimePicker;
    Label12: TLabel;
    wwDBEdit9: TwwDBEdit;
    Label13: TLabel;
    GroupBox1: TGroupBox;
    cb_tipo_recebedor: TComboBox;
    pnl_impressao: TPanel;
    rg_opcao_impressao: TRadioGroup;
    bt_imprimir: TButton;
    rd_benefreq: TRadioGroup;
    qry2: TwwQuery;
    qryaux: TwwQuery;
    qryaux2: TwwQuery;
    rg_molestia: TDBRadioGroup;
    updDet: TUpdateSQL;
    wwDBEdit10: TwwDBEdit;
    dtDataFinal: TCMDateTimePicker;
    qrySitPart: TwwQuery;
    qrySitFunc: TwwQuery;
    qrySitPlanoPrev: TwwQuery;
    cb_grava_indiv: TCheckBox;
    IdHTTP1: TIdHTTP;
    cb_validado: TCheckBox;
    param: TwwQuery;
    pnl1: TPanel;
    grid_log: TwwDBGrid;
    SpeedButton1: TSpeedButton;
    db_grid_irrf: TDBRadioGroup;
    lbl_listados: TLabel;
    bbtnInverte: TBitBtn;
    bbtnSelTudo: TBitBtn;
    CrmRptCM: TCmRptManager;
    DevRptCM: TExtraOptions;
    CmpRptCM: TCmParamReport;
    rpReciboCedidos: TppReport;
    ppReciboCedidos: TppBDEPipeline;
    dsReciboCedidos: TwwDataSource;
    CdsReciboCedidos: TCMClientDataSet;
    sqlReciboCedidos: TCMSqlParams;
    ppParameterList1: TppParameterList;
    qryDETCONCINSS: TwwQuery;
    qryRubricaxInss: TwwQuery;
    qryAux3: TwwQuery;
    qryAux4: TwwQuery;
    arPreview: TppArchiveReader;
    QExport3PDF1: TQExport3PDF;
    qeCustomSource1: TqeCustomSource;
    ExtraOptions1: TExtraOptions;
    qryDetRel: TwwQuery;
    qryDetRelMATRICULA: TStringField;
    qryDet: TwwQuery;
    qryDetSELECIONADO: TStringField;
    qryDetMATRICULA: TStringField;
    qryDetNOME: TStringField;
    qryDetNUMBENEFICIO: TStringField;
    qryDetESPECIE: TStringField;
    qryDetBENEFICIO: TStringField;
    qryDetRMI: TFloatField;
    qryDetDatadoEvento: TDateTimeField;
    qryDetDIB: TDateTimeField;
    qryDetDIP: TDateTimeField;
    qryDetDIBANT: TDateTimeField;
    qryDetDATAREQUERIMENTO: TDateTimeField;
    qryDetMOLESTIA: TStringField;
    qryDetDATAINICIO: TDateTimeField;
    qryDetDATAFIM: TDateTimeField;
    qryDetBENEFREQ: TStringField;
    qryDetIDPESSOA: TFloatField;
    qryDetIDTITULAR: TFloatField;
    qryDetDATAMORTE: TDateTimeField;
    qryDetIDSITPART: TFloatField;
    qryDetIDSITFUNC: TFloatField;
    qryDetIDPESSJUR: TFloatField;
    qryDetIDSITPLANOPREV: TFloatField;
    qryDetINSCNUMERO: TFloatField;
    qryDetSEQPROPOSTA: TFloatField;
    qryDetIDPLANOPREV: TFloatField;
    qryDetTIPO: TStringField;
    qryDetIDBENEFHABILITA: TFloatField;
    qryDetIDBENEFICIO: TFloatField;
    qryDeteventogerador: TFloatField;
    qryDetnumeroprocesso: TFloatField;
    qryDetISENTOIRRF: TStringField;
    qryDetFLGREQUERIMENTO: TFloatField;
    qryDetIdplanprevcontab: TFloatField;
    qryDetRelSELECIONADO: TStringField;
    qryDetRelNOME: TStringField;
    qryDetRelNUMBENEFICIO: TStringField;
    qryDetRelESPECIE: TStringField;
    qryDetRelBENEFICIO: TStringField;
    qryDetRelRMI: TFloatField;
    qryDetRelDatadoEvento: TDateTimeField;
    qryDetRelDIB: TDateTimeField;
    qryDetRelDIP: TDateTimeField;
    qryDetRelDIBANT: TDateTimeField;
    qryDetRelDATAREQUERIMENTO: TDateTimeField;
    qryDetRelMOLESTIA: TStringField;
    qryDetRelDATAINICIO: TDateTimeField;
    qryDetRelDATAFIM: TDateTimeField;
    qryDetRelBENEFREQ: TStringField;
    qryDetRelIDPESSOA: TFloatField;
    qryDetRelIDTITULAR: TFloatField;
    qryDetRelDATAMORTE: TDateTimeField;
    qryDetRelIDSITPART: TFloatField;
    qryDetRelIDSITFUNC: TFloatField;
    qryDetRelIDPESSJUR: TFloatField;
    qryDetRelIDSITPLANOPREV: TFloatField;
    qryDetRelINSCNUMERO: TFloatField;
    qryDetRelSEQPROPOSTA: TFloatField;
    qryDetRelIDPLANOPREV: TFloatField;
    qryDetRelTIPO: TStringField;
    qryDetRelIDBENEFHABILITA: TFloatField;
    qryDetRelIDBENEFICIO: TFloatField;
    qryDetReleventogerador: TFloatField;
    qryDetRelnumeroprocesso: TFloatField;
    qryDetRelISENTOIRRF: TStringField;
    qryDetRelFLGREQUERIMENTO: TFloatField;
    qryDetRelIdplanprevcontab: TFloatField;
    qrydetconcaux: TwwQuery;
    qryDetalhe: TwwQuery;
    dsDetalhe: TwwDataSource;
    ppDetalhe: TppBDEPipeline;
    UpdDetalhe: TUpdateSQL;
    ppDetalheppField6: TppField;
    qryDetalhe2: TwwQuery;
    dsDetalhe2: TwwDataSource;
    ppDetalhe2: TppBDEPipeline;
    ppField1: TppField;
    ppField2: TppField;
    ppField3: TppField;
    ppField4: TppField;
    ppField5: TppField;
    ppField6: TppField;
    qryDetalhe2mesano: TStringField;
    qryDetalhe2mesreferencia: TStringField;
    qryDetalhe2mesreembolso: TStringField;
    qryDetalhe2pagar: TFloatField;
    qryDetalhe2descontar: TFloatField;
    qryDetalhe2planocontabil: TStringField;
    qryDetalhemesano: TStringField;
    qryDetalhemesreferencia: TStringField;
    qryDetalhemesreembolso: TStringField;
    qryDetalhepagar: TFloatField;
    qryDetalhedescontar: TFloatField;
    qryDetalheplanocontabil: TStringField;
    UpdDetalhe2: TUpdateSQL;
    sbtnRequerer: TToolbarButton97;
    qryDetNUP: TStringField;
    qryDetCPF: TStringField;
    qryDetNOMEPLANOPREV: TStringField;
    qryDetFLGPAGAINSS: TFloatField;
    qryDetBENEFLEI142: TFloatField;
    qryDetTEMPOSERVICOANOS: TFloatField;
    qryDetTEMPOSERVICOMES: TFloatField;
    qryDetTEMPOSERVICODIAS: TFloatField;
    qryDetINDICEREAJUSTETETO: TFloatField;
    qryDetPERCENTUALINSS: TFloatField;
    qryDetDEC: TDateTimeField;
    qryDetDATAMORTETIT: TDateTimeField;
    qryDetFLGPAGAINSS_SN: TStringField;
    qryDetBENEFLEI142_SN: TStringField;
    qryDetVALORATUAL: TFloatField;
    lblNumBrdp: TLabel;
    dbedNumBrdp: TwwDBEdit;
    lblPctInss: TLabel;
    dbedPctInss: TwwDBEdit;
    lblIndReajTeto: TLabel;
    dbedIndReajTeto: TwwDBEdit;
    lblEstado: TLabel;
    dblkEstado: TwwDBLookupCombo;
    lblNup: TLabel;
    dbedNup: TwwDBEdit;
    dtDec: TCMDateTimePicker;
    lblDEC: TLabel;
    rgSetencaJudicial: TDBRadioGroup;
    rgBeneficioLei142: TDBRadioGroup;
    rgBenefForaConvenio: TDBRadioGroup;
    lblTempoSevico: TLabel;
    dbedAno: TwwDBEdit;
    lblAnos: TLabel;
    dbedMeses: TwwDBEdit;
    lblMeses: TLabel;
    dbedDias: TwwDBEdit;
    lblDias: TLabel;
    qryDetNUMBRDP: TStringField;
    qryDetESTADO: TStringField;
    PnlSelGravar: TPanel;
    lbl_local: TLabel;
    ed_local: TEdit;
    qryDetNOMEUSUARIO: TStringField;
    qryDetVALORTOTAL: TFloatField;
    qryDetSITBENEFICIO: TStringField;
    qryDetFLGSENTENCAJUDICIAL: TFloatField;
    gbxBeneficio: TGroupBox;
    lblMatricula: TLabel;
    lblNumBenef: TLabel;
    lblDer: TLabel;
    lblNome: TLabel;
    lblNmBenef: TLabel;
    dbedMatricula: TwwDBEdit;
    dbedNome: TwwDBEdit;
    dbedNumBenef: TwwDBEdit;
    dbedNmBenef: TwwDBEdit;
    dtpDer: TCMDateTimePicker;
    bbtnFiltrar: TBitBtn;
    qryDetNOMEPERFIL: TStringField;
    qryDetIDPERFILINVEST: TFloatField;
    qryDetideventogerador: TFloatField;
    ppHeaderBand1: TppHeaderBand;
    ppLabel2: TppLabel;
    lbl_dataconce: TppLabel;
    ppLine3: TppLine;
    ppImage1: TppImage;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel34: TppLabel;
    ppLabel36: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppDetailBand1: TppDetailBand;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppShape14: TppShape;
    ppShape13: TppShape;
    ppLabel89: TppLabel;
    ppLabel90: TppLabel;
    ppLabel91: TppLabel;
    ppLabel92: TppLabel;
    ppLabel93: TppLabel;
    ppLabel94: TppLabel;
    ppLine47: TppLine;
    ppLine48: TppLine;
    ppLabel4: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppLine49: TppLine;
    ppShape15: TppShape;
    ppShape16: TppShape;
    ppShape17: TppShape;
    ppShape18: TppShape;
    ppShape19: TppShape;
    ppShape20: TppShape;
    ppLine2: TppLine;
    ppSummaryBand2: TppSummaryBand;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppDBText2: TppDBText;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppDBText3: TppDBText;
    ppLabel9: TppLabel;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel10: TppLabel;
    ppDBText6: TppDBText;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppDBText7: TppDBText;
    ppLabel13: TppLabel;
    ppDBText8: TppDBText;
    lblCapIsentoIRRF: TppLabel;
    lblIsentoIRRF: TppDBText;
    ppDBText12: TppDBText;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppDBText13: TppDBText;
    ppLabel19: TppLabel;
    ppDBText14: TppDBText;
    ppLine1: TppLine;
    ppLabel20: TppLabel;
    ppLine6: TppLine;
    lbl_anos: TppLabel;
    lbl_meses: TppLabel;
    lbl_dias: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel33: TppLabel;
    lbl_banco: TppLabel;
    lbl_agencia: TppLabel;
    lbl_conta: TppLabel;
    lbl_conta2: TppLabel;
    lbl_banco2: TppLabel;
    lbl_agencia2: TppLabel;
    lbl_valortotalhis: TppLabel;
    lbl_valorbeneficio: TppLabel;
    lbl_valoratualbeneficio: TppLabel;
    lbl_msgimpeditiva: TppLabel;
    ppLabel35: TppLabel;
    lbl_valortotalinss: TppLabel;
    ppLine7: TppLine;
    lbl_valortotalgeral: TppLabel;
    ppLabel39: TppLabel;
    ppLabel38: TppLabel;
    lbl_CPF: TppLabel;
    ppLabel40: TppLabel;
    ppDBText25: TppDBText;
    lblCapSituacaoPlano: TppLabel;
    lbl_SituacaoPlano: TppLabel;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppShape21: TppShape;
    ppShape22: TppShape;
    ppLabel96: TppLabel;
    ppLabel97: TppLabel;
    ppLabel98: TppLabel;
    ppLabel99: TppLabel;
    ppLabel100: TppLabel;
    ppLabel101: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppLine52: TppLine;
    ppShape23: TppShape;
    ppShape24: TppShape;
    ppShape25: TppShape;
    ppShape26: TppShape;
    ppShape27: TppShape;
    ppShape28: TppShape;
    ppSummaryBand3: TppSummaryBand;
    ppLine4: TppLine;
    ppLine8: TppLine;
    plbl1: TppLabel;
    plblDEC: TppLabel;
    plbl3: TppLabel;
    plbl4: TppLabel;
    plbl5: TppLabel;
    lbl_FlgPagaInss: TppLabel;
    lbl_DEC: TppLabel;
    lbl_BENEFLEI142: TppLabel;
    lbl_PercINSS: TppLabel;
    lbl_INDICEREAJUSTE: TppLabel;
    ppLabel14: TppLabel;
    ppDBText9: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppCalc21: TppSystemVariable;
    ppLabel3: TppLabel;
    ppLabel27: TppLabel;
    ppLine5: TppLine;
    lblNomUsuario: TppLabel;
    lbl_usuario: TppLabel;
    lblNomNUP: TppLabel;
    lbl_NUP: TppLabel;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    raCodeModule1: TraCodeModule;
    ppLabel15: TppLabel;
    ppDBText10: TppDBText;
    ppReciboCedidosppField61: TppField;
    qryDetDATAFINAL: TDateTimeField;

    procedure sbtnProcurarClick(Sender: TObject);
    procedure RemoveDuplicates(var stringList : TStringList) ;
    procedure buscarequerimentos(_selecao,_ordem:string);
    procedure buscarlog();
    procedure configuralog();
    Function  BuscarUltMesreaj():string;
    Function  CalculaData(Data1, Data2: string): INTEGER;
    Function  BuscarValorReajustadoPAB(_rmi:double;_numprocinss,_mesref:string):double;
    procedure tbcDetalheChange(Sender: TObject);
    procedure bt_imprimirClick(Sender: TObject);
    procedure gera_impressao_log;
    procedure gera_impressao_requerimento;
    procedure sbtnRequererClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure sbtnConcedeUmClick(Sender: TObject);
    procedure CmeDetalheAtualizaBotoes(Sender: TObject);
    procedure CmeDetalheCancel(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeDetalheDelete(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure bbtnDesfazerClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure GravarEventoPrev(_query:TwwQuery;_EventoGerador:string);
    procedure GravarBfciarioTitPlan(_query:TwwQuery);
    procedure GravarHSTBENEFBFCIARIO(_query:TwwQuery;_Tipo,_idmotivo,_flgtiporegistro,_SEQbeneficio,_valorcalculado,_datapagamento,_sidmovbenef,_flgincluimesconc,_mesreferencia,_mesreflote:string);
    procedure GravarRubricaIndiv(_query:TwwQuery;_idmotivo,_mesreferencia,_seq,_mesreflote,_sidmovbenef:string);//206134


    procedure DeletarBfciarioTitPlan(_query:TwwQuery);
    procedure DeletarRubricaIndiv(_query:TwwQuery);
    procedure DeletarPrevia();
    procedure DeletarBENEFBFCIARIO(_query:TwwQuery;_NUMEROPROCESSO:string);
    procedure DeletarEventoPrev(_query:TwwQuery;_EventoGerador:string);
    procedure DeletarProcessoBenef(_query:TwwQuery;_NUMEROPROCESSO:string);

    procedure DeletarHSTBENEFBFCIARIO(_query:TwwQuery;_NUMEROPROCESSO:string);
    procedure DeletarMovbenef(_query:TwwQuery;_NUMEROPROCESSO:string);

    procedure GravarProcessoBenef(_query:TwwQuery;_EventoGerador,_NUMEROPROCESSO:string);
    procedure GravarBENEFBFCIARIO(_query:TwwQuery;_NUMEROPROCESSO:string);
    procedure AtualizaBenefHabilita(_query:TwwQuery;_flgrequerimento,_NUMEROPROCESSO,_EVENTOGERADOR:string);
    procedure AtualizaBenefbfciario(_query:TwwQuery;_idsitbeneficio:string);


    procedure Criar_temp();
    procedure Gravar_temp_log(_query:TwwQuery;_msgerro,_msgoracle:string);
    procedure Deletar_temp_log(_query:TwwQuery);
    procedure FormShow(Sender: TObject);
    procedure wwDBEdit10Change(Sender: TObject);
    procedure dtDataFinalChange(Sender: TObject);
    procedure qryDetBeforePost(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure qryDetAfterOpen(DataSet: TDataSet);
    procedure bbtnSelTudoClick(Sender: TObject);
    procedure bbtnInverteClick(Sender: TObject);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure dbgrdDetTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure lbl_SituacaoPlanoPrint(Sender: TObject);
    procedure ppGroupFooterBand3AfterPrint(Sender: TObject);
    procedure ppFooterBand1BeforePrint(Sender: TObject);


    //Helio - SOL 207871 / KTN 2014291
    function GeraLblUsuario : String;
    procedure lbl_NUPPrint(Sender: TObject);
    procedure lbl_CPFPrint(Sender: TObject);
    //FIM Helio - SOL 207871 / KTN 2014291

    //Início - William Santana - SOL 251599.17194 PPM 783173
    procedure CombosDropDown(Sender: TObject);
    procedure tbcDetalheChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure gera_impressao_req;

   // procedure FormCreate(Sender: TObject);    //Término - William Santana - SOL 251599.17194 PPM 783173

    function  BuscaLoteConcedido : integer;
    procedure bbtnFiltrarClick(Sender: TObject);    // edilaine - SIG22026

  private
    wHora, wMin, wSeg, wMSeg : word;
    iFlgIncluiMesConc,iIdLoteConcessao,iIdCalculo   : integer;
    sAnoMesLoteConcessao :string;
    //Luiz Carlos - SIG63530 - Inicio
    Fidpessoa, Fprocesso,Fmatricula : TStringList;
    //Luiz Carlos - SIG63530 - Fim
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadConcederBenefInssLote: TFrmCadConcederBenefInssLote;
  FIdbenefh  : TStrings;
  RegProc:integer;
  IDPROVENTO:STRING;
  SRubrica :Tstringlist;//206134
  imprimiuRodapteGrupoRelatorio : Boolean;
implementation

uses
  FMostraAux,UFuncoesUteis,USistema,uCMTypes,UMensErro,ubeneficio,UDataBase,UAdmPrev,DBaseDados,FSelecionaLote,FPreview;
{$R *.DFM}


function IsDate(str: string): Boolean; 
var 
  dt: TDateTime; 
begin 
  Result := True; 
  try   
    dt := StrToDate(str); 
  except
    Result := False; 
  end; 
end; 

procedure TFrmCadConcederBenefInssLote.buscarequerimentos(_selecao,_ordem:string);
var
  sql:string;
begin
sql:='';
/////RN004


qry.Active:=true;

qryDet.Close;
qryDet.sql.Clear;


QRYDET.SQL.ADD('SELECT '+#39+_selecao+#39+' AS SELECIONADO,');
qryDet.SQL.Add('       BH.IDBENEFHABILITA,');
qryDet.SQL.Add('       BH.NUMEROPROCESSO,');
qryDet.SQL.Add('       BH.EVENTOGERADOR,');
qryDet.SQL.Add('       BH.FLGREQUERIMENTO,');
//Início - William Santana - SIG 26527
qryDet.SQL.Add('       BH.NUMBRDP, BH.ESTADO, BH.NUP, BH.DEC, ');
qryDet.SQL.Add('       (SELECT U.NOMEUSUARIO FROM MOVBENEF MV, USUARIOSISTEMA U    ');
qryDet.SQL.Add('	  WHERE MV.IDPESSOA = BH.IDPESSOA                          ');
qryDet.SQL.Add('	    AND MV.IDBENEFICIO = BH.IDBENEFICIO                    ');
qryDet.SQL.Add('	    AND MV.IDPLANOPREV = PLA.IDPLANOPREV                   ');
qryDet.SQL.Add('	    AND U.IDUSUARIO(+) = regexp_substr(MV.TRGUSERINCLUSAO, ''[[:digit:]]+'') ');
qryDet.SQL.Add('            AND MV.NUMEROPROCESSO = BH.NUMEROPROCESSO              ');
qryDet.SQL.Add('            AND MV.IDSITANTERIOR = 4                               ');
qryDet.SQL.Add('            AND ROWNUM = 1                                         ');
qryDet.SQL.Add('        ) NOMEUSUARIO,                                             ');
qryDet.SQL.Add(  'NVL((SELECT SUM(BF.VALORTOTAL)                     ');
qryDet.SQL.Add('        FROM BENEFBFCIARIO BF                        ');
qryDet.SQL.Add('        WHERE BF.IDTITULAR = BH.IDTITULAR            ');
qryDet.SQL.Add('          AND BF.IDBENEFICIO = BH.IDBENEFICIO        ');
qryDet.SQL.Add('          AND BF.IDPESSOA = BH.IDPESSOA              ');
qryDet.SQL.Add('          AND BF.NUMEROPROCESSO = BH.NUMEROPROCESSO  ');
qryDet.SQL.Add('      AND BF.IDPLANPREVCONTAB = PLA.IDPLANPREVCONTAB ');
qryDet.SQL.Add('      ),0) AS VALORTOTAL,                            ');
qryDet.SQL.Add(' (  SELECT S.DESCRICAO                               ');
qryDet.SQL.Add('  FROM SITBENEFICIO S, BENEFBFCIARIO BF              ');
qryDet.SQL.Add(' WHERE S.IDSITBENEFICIO = BF.IDSITBENEFICIO          ');
qryDet.SQL.Add('   AND BF.IDTITULAR = BH.IDTITULAR                   ');
qryDet.SQL.Add('   AND BF.IDBENEFICIO = BH.IDBENEFICIO               ');
qryDet.SQL.Add('   AND BF.IDPESSOA = BH.IDPESSOA                     ');
qryDet.SQL.Add('   AND BF.NUMEROPROCESSO = BH.NUMEROPROCESSO         ');
qryDet.SQL.Add('   AND BF.IDPLANPREVCONTAB = PLA.IDPLANPREVCONTAB    ');
qryDet.SQL.Add('   AND BF.IDPLANOPREV =  PLA.IDPLANOPREV             ');
qryDet.SQL.Add('   AND ROWNUM = 1) SITBENEFICIO,                     ');
qryDet.SQL.Add('   BH.FLGSENTENCAJUDICIAL,                           ');
//Término - William Santana - SIG 26527
//Início - William Santana - SOL 218687.17129 PPM 757901
// qryDet.SQL.Add('       D.MATRICULA,');
qryDet.SQL.Add('       DECODE(EP.MATRICULA,NULL,D.MATRICULA,EP.MATRICULA) AS MATRICULA, ');
qryDet.SQL.Add('       BH.FLGPAGAINSS, ');
qryDet.SQL.Add('       BH.BENEFLEI142, ');
qryDet.SQL.Add('       BH.TEMPOSERVICOANOS, ');
qryDet.SQL.Add('       BH.TEMPOSERVICOMES,  ');
qryDet.SQL.Add('       BH.TEMPOSERVICODIAS, ');
qryDet.SQL.Add('       BH.INDICEREAJUSTETETO, ');
qryDet.SQL.Add('       BH.PERCENTUALINSS,     ');
qryDet.SQL.Add('       BH.DEC,  ');
qryDet.SQL.Add('       PFTIT.DATAMORTE DATAMORTETIT, ');
//Término - William Santana - SOL 218687.17129 PPM 757901
//Início - William Santana - SOL 249376.17130 PPM 757902
qryDet.SQL.Add(' (DECODE(BH.FLGPAGAINSS, 1, ''Não'', 0, ''Sim'', ''Sim'')) AS FLGPAGAINSS_SN,');
qryDet.SQL.Add(' (DECODE(BH.BENEFLEI142, 0, ''Não'', 1, ''Sim'', ''Não'')) AS BENEFLEI142_SN,');
//Término - William Santana - SOL 249376.17130 PPM 757902
qryDet.SQL.Add('       P.NOME,');
qryDet.SQL.Add('       PF.DATAMORTE,');
qryDet.SQL.Add('       PLA.IDPLANOPREV,');
qryDet.SQL.Add('       PLA.IDSITPART,');
qryDet.SQL.Add('       EP.IDSITFUNC,');
qryDet.SQL.Add('       PLA.IDPESSJUR, ');
qryDet.SQL.Add('       PLA.IDSITPLANOPREV,');
qryDet.SQL.Add('       PLA.SEQPROPOSTA,');
qryDet.SQL.Add('       PLA.INSCRICAONUMERO AS INSCNUMERO,');
qryDet.SQL.Add('       BH.IDBENEFICIO,');
qryDet.SQL.Add('       BH.NUMBENEFICIO,');
qryDet.SQL.Add('       BH.IDPESSOA,');
qryDet.SQL.Add('       BH.IDTITULAR,');
qryDet.SQL.Add('       DECODE(BH.IDTITULAR, BH.IDPESSOA, ''APOSENTADO'', ''PENSIONISTA'') AS TIPO,');
qryDet.SQL.Add('       B.NOME BENEFICIO,');
qryDet.SQL.Add('       BH.DIB "DATA DO EVENTO",');
qryDet.SQL.Add('       BH.DIB,');
qryDet.SQL.Add('       BH.DIP,');
qryDet.SQL.Add('       (SELECT BF.DIBBENEFANT');
qryDet.SQL.Add('        FROM BENEFBFCIARIO BF');
qryDet.SQL.Add('        WHERE BF.IDTITULAR = BH.IDTITULAR');
qryDet.SQL.Add('          AND BF.IDPESSOA = BH.IDPESSOA');
qryDet.SQL.Add('          AND BF.FONTEPAGADORA = 2');
qryDet.SQL.Add('          AND ROWNUM = 1) AS DIBANT,');

// Peterson victor SOL 271037 PPM 1350100 Inicio
qryDet.SQL.Add('      DECODE(BH.FLGPAGAINSS,0,BH.RMI,1, ');  //William Santana - SOL 218687.17129 PPM 757901
//TAES - SIG99677 - início
qryDet.SQL.Add(' CASE WHEN ' +
               ' NVL(BH.RMI,0) <> 0 THEN BH.RMI '+
               ' ELSE ');
qryDet.SQL.Add('(SELECT MAX(DC.RMREAJ)');
qryDet.SQL.Add('          FROM DETCONCINSS DC');
qryDet.SQL.Add('         WHERE DC.IDPESSOA = BH.IDPESSOA');
qryDet.SQL.Add('           AND DC.NUMPROCINSS = BH.NUMBENEFICIO');
qryDet.SQL.Add('           AND DC.DTINICIOCRED = (SELECT MIN(DC1.DTINICIOCRED)');
qryDet.SQL.Add('                                  FROM DETCONCINSS DC1');
qryDet.SQL.Add('                                  WHERE DC.IDPESSOA = DC1.IDPESSOA AND');
qryDet.SQL.Add('                                        DC.NUMPROCINSS = DC1.NUMPROCINSS)) END) AS RMI, ');
qryDet.SQL.Add('(SELECT MAX(DC.RMREAJ)');
qryDet.SQL.Add('          FROM DETCONCINSS DC');
qryDet.SQL.Add('         WHERE DC.IDPESSOA = BH.IDPESSOA');
qryDet.SQL.Add('           AND DC.NUMPROCINSS = BH.NUMBENEFICIO');
qryDet.SQL.Add('           AND DC.DTINICIOCRED = (SELECT MIN(DC1.DTINICIOCRED)');
qryDet.SQL.Add('                                  FROM DETCONCINSS DC1');
qryDet.SQL.Add('                                  WHERE DC.IDPESSOA = DC1.IDPESSOA AND');
qryDet.SQL.Add('                                        DC.NUMPROCINSS = DC1.NUMPROCINSS)) AS RMIREAJ, ');
//TAES - SIG99677 - fim
qryDet.SQL.Add('      DECODE(BH.FLGPAGAINSS, ');
qryDet.SQL.Add('              0, ');
qryDet.SQL.Add('              BH.RMI, ');
qryDet.SQL.Add('              1, ');
qryDet.SQL.Add('              (SELECT MAX(RMREAJ) ');
qryDet.SQL.Add('                 FROM DETCONCINSS DC ');
qryDet.SQL.Add('                WHERE DC.IDPESSOA = BH.IDPESSOA ');
qryDet.SQL.Add('                  AND DC.NUMPROCINSS = BH.NUMBENEFICIO ');
qryDet.SQL.Add('                  AND DC.MESREFERENCIA >= (SELECT MAX(RJ.MESREAJ) FROM REAJINSS RJ))) AS VALORATUAL, ');
// Peterson victor SOL 271037 PPM 1350100 FIM

qryDet.SQL.Add('       (DECODE(BH.FLGREQUERIMENTO, 0, ''NAO'', 1, ''SIM'', ''NAO'')) AS BENEFREQ,');
qryDet.SQL.Add('       B.CODBENEFICIO ESPECIE,');
qryDet.SQL.Add('       DECODE(B.CODBENEFICIO,92,''SIM'',''NÃO'') ISENTOIRRF,');
qryDet.SQL.Add('       BH.DATAREQUERIMENTO,');
qryDet.SQL.Add('       DECODE(PF.FLGMOLESTIAGRAVE,1,''SIM'',''NAO'') MOLESTIA,');
qryDet.SQL.Add('       PF.DATAMOLESTIAGRAVE DATAINICIO,');
qryDet.SQL.Add('       PF.DATAFIMMOLESTIA DATAFIM,');
qryDet.SQL.Add('       PLA.Idplanprevcontab IDPLANPREVCONTAB');

//edilaine - SIG55933 - inicio
qryDet.SQL.Add('       , NVL((SELECT P.NOME  ');
qryDet.SQL.Add('              FROM BENEFBFCIARIO BF ');
qryDet.SQL.Add('              LEFT JOIN PERFILINVEST P ON P.IDPERFILINVEST = BF.IDPERFILINVEST ');
qryDet.SQL.Add('             WHERE BF.IDTITULAR = BH.IDTITULAR      ');
qryDet.SQL.Add('               AND BF.IDBENEFICIO = BH.IDBENEFICIO  ');
qryDet.SQL.Add('               AND BF.IDPESSOA = BH.IDPESSOA        ');
qryDet.SQL.Add('               AND BF.NUMEROPROCESSO = BH.NUMEROPROCESSO  ');
qryDet.SQL.Add('               AND BF.IDPLANOPREV = PLA.IDPLANOPREV), '''') AS NOMEPERFIL ');
qryDet.SQL.Add('       , NVL((SELECT BF.IDPERFILINVEST  ');
qryDet.SQL.Add('              FROM BENEFBFCIARIO BF ');
qryDet.SQL.Add('             WHERE BF.IDTITULAR = BH.IDTITULAR      ');
qryDet.SQL.Add('               AND BF.IDBENEFICIO = BH.IDBENEFICIO  ');
qryDet.SQL.Add('               AND BF.IDPESSOA = BH.IDPESSOA        ');
qryDet.SQL.Add('               AND BF.NUMEROPROCESSO = BH.NUMEROPROCESSO  ');
qryDet.SQL.Add('               AND BF.IDPLANOPREV = PLA.IDPLANOPREV), -1) AS IDPERFILINVEST ');
//edilaine - SIG55933 - fim
//TAES - SIG89739 - início
qryDet.SQL.Add('       , (SELECT BF.DATAFINAL  ');
qryDet.SQL.Add('              FROM BENEFBFCIARIO BF ');
qryDet.SQL.Add('             WHERE BF.IDTITULAR = BH.IDTITULAR      ');
qryDet.SQL.Add('               AND BF.IDBENEFICIO = BH.IDBENEFICIO  ');
qryDet.SQL.Add('               AND BF.IDPESSOA = BH.IDPESSOA        ');
qryDet.SQL.Add('               AND BF.NUMEROPROCESSO = BH.NUMEROPROCESSO  ');
qryDet.SQL.Add('               AND BF.IDPLANOPREV = PLA.IDPLANOPREV) AS DATAFINAL ');
//TAES - SIG89739 - fim
//Helio - SOL 207871 / KTN 2014291
qryDet.SQL.Add('       ,BH.NUP,');
qryDet.SQL.Add('       P.NUMDOCUMENTO AS CPF, ');
qryDet.SQL.Add('       PLA.NOMEPLANOPREV, ');
qryDet.SQL.Add('       PLA.SITPLANO ');
//FIM Helio - SOL 207871 / KTN 2014291

//Ewerton Beltramini - 23/04/2020 - SIG92983
qryDet.SQL.Add('       ,b.ideventogerador');

qryDet.SQL.Add('FROM BENEFHABILITA BH');

qryDet.SQL.Add('     JOIN BENEFBFCIARIO BB ON BH.NUMEROPROCESSO = BB.NUMEROPROCESSO');
qryDet.SQL.Add('                              AND BH.IDPESSOA = BB.IDPESSOA AND');
qryDet.SQL.Add('                             BH.IDTITULAR = BB.IDTITULAR ');

IF rd_benefreq.ItemIndex = 1 THEN
   qryDet.SQL.Add('                             AND BB.IDSITBENEFICIO = 4     ')
ELSE
   qryDet.SQL.Add('                             AND BB.IDSITBENEFICIO IN(1,2,3,5)');

qryDet.SQL.Add('     JOIN DEPENTIT D ON BH.IDPESSOA = D.IDPESSOA AND');
qryDet.SQL.Add('                        BH.IDTITULAR = D.IDTITULAR  ');
qryDet.SQL.Add('     JOIN PESSOA P ON BH.IDPESSOA = P.IDPESSOA');
qryDet.SQL.Add('     JOIN PESSOAFISICA PF ON BH.IDPESSOA = PF.IDPESSOA');
qryDet.SQL.Add('     JOIN BENEFICIO B ON BH.IDBENEFICIO = B.IDBENEFICIO');
//Início - William Santana - SOL 218687.17129 PPM 757901
qryDet.SQL.Add('     LEFT JOIN PESSOAFISICA PFTIT ON BH.IDTITULAR = PFTIT.IDPESSOA  ');
//qryDet.SQL.Add('     LEFT JOIN ELEGPATRO EP ON BH.IDPESSOA = EP.IDPESSOA');
qryDet.SQL.Add('  LEFT JOIN (SELECT E1.IDPESSOA, E1.IDPESSJUR, E1.IDSITFUNC, E1.MATRICULA  ');
qryDet.SQL.Add('  FROM ELEGPATRO E1                                                        ');
qryDet.SQL.Add('  WHERE ((((SELECT COUNT(1) FROM ELEGPATRO E2 WHERE E1.IDPESSOA = E2.IDPESSOA) > 1) AND (E1.IDPESSJUR = 1)) ');
qryDet.SQL.Add('    OR ((SELECT COUNT(1) FROM ELEGPATRO E2 WHERE E1.IDPESSOA = E2.IDPESSOA) = 1)) ');
qryDet.SQL.Add('    ) EP ON BH.IDPESSOA = EP.IDPESSOA  ');
//Término - William Santana - SOL 218687.17129 PPM 757901
qryDet.SQL.Add('     LEFT JOIN (SELECT PP.IDPESSOA,');
qryDet.SQL.Add('       CASE');
qryDet.SQL.Add('         WHEN PP.IDSITPLANOPREV IN (25,26,27,28,29) THEN');
qryDet.SQL.Add('           PP.IDPLANOPREV');
qryDet.SQL.Add('         ELSE');
qryDet.SQL.Add('           NVL((SELECT bf.idplanoprev');
qryDet.SQL.Add('                FROM BENEFBFCIARIO BF ');
qryDet.SQL.Add('                WHERE PP.IDPESSOA = BF.IDTITULAR');
qryDet.SQL.Add('                  AND BF.IDTPPAGTOBENEFIC = 1');
qryDet.SQL.Add('                  AND BF.FONTEPAGADORA = 1');
qryDet.SQL.Add('                  AND BF.IDSITBENEFICIO = 1');
qryDet.SQL.Add('                  AND ROWNUM = 1');
qryDet.SQL.Add('                  AND (BF.IDPLANPREVCONTAB = 28');
qryDet.SQL.Add('                       OR (BF.IDPLANPREVCONTAB <> 28');
qryDet.SQL.Add('                           AND NOT EXISTS (SELECT 1');
qryDet.SQL.Add('                                           FROM BENEFBFCIARIO BF1');
qryDet.SQL.Add('                                           WHERE BF1.IDTPPAGTOBENEFIC = 1');
qryDet.SQL.Add('                                             AND BF1.FONTEPAGADORA = 1');
qryDet.SQL.Add('                                             AND BF1.IDPLANPREVCONTAB = 28');
qryDet.SQL.Add('                                             AND BF1.IDSITBENEFICIO = 1');
qryDet.SQL.Add('                                             AND BF1.IDTITULAR = BF.IDTITULAR');
qryDet.SQL.Add('                                             AND BF1.IDPESSOA = BF.IDPESSOA)))),PP.IDPLANOPREV)');
qryDet.SQL.Add('       END IDPLANOPREV,');
qryDet.SQL.Add('       CASE');
qryDet.SQL.Add('         WHEN PP.IDSITPLANOPREV IN (25,26,27,28,29) THEN');
qryDet.SQL.Add('           28');
qryDet.SQL.Add('         ELSE');
qryDet.SQL.Add('           NVL((SELECT bf.Idplanprevcontab');
qryDet.SQL.Add('                FROM BENEFBFCIARIO BF ');
qryDet.SQL.Add('                WHERE PP.IDPESSOA = BF.IDTITULAR');
qryDet.SQL.Add('                  AND BF.IDTPPAGTOBENEFIC = 1');
qryDet.SQL.Add('                  AND BF.FONTEPAGADORA = 1');
qryDet.SQL.Add('                  AND BF.IDSITBENEFICIO = 1');
qryDet.SQL.Add('                  AND ROWNUM = 1');
qryDet.SQL.Add('                  AND (BF.IDPLANPREVCONTAB = 28');
qryDet.SQL.Add('                       OR (BF.IDPLANPREVCONTAB <> 28');
qryDet.SQL.Add('                           AND NOT EXISTS (SELECT 1');
qryDet.SQL.Add('                                           FROM BENEFBFCIARIO BF1');
qryDet.SQL.Add('                                           WHERE BF1.IDTPPAGTOBENEFIC = 1');
qryDet.SQL.Add('                                             AND BF1.FONTEPAGADORA = 1');
qryDet.SQL.Add('                                             AND BF1.IDPLANPREVCONTAB = 28');
qryDet.SQL.Add('                                             AND BF1.IDSITBENEFICIO = 1');
qryDet.SQL.Add('                                             AND BF1.IDTITULAR = BF.IDTITULAR');
qryDet.SQL.Add('                                             AND BF1.IDPESSOA = BF.IDPESSOA)))),PP.IDPLANOPREV)');
qryDet.SQL.Add('       END Idplanprevcontab,');
qryDet.SQL.Add('       PP.IDSITPART,');
qryDet.SQL.Add('       PP.IDSITPLANOPREV,');
qryDet.SQL.Add('       PP.SEQPROPOSTA,');
qryDet.SQL.Add('       PP.INSCRICAONUMERO,');


//Helio - SOL 207871 / KTN 2014291
//qryDet.SQL.Add('       PP.IDPESSJUR');
//qryDet.SQL.Add('FROM PARTPREVPLAN PP');
//qryDet.SQL.Add('WHERE (PP.IDSITPLANOPREV IN (25,26,27,28,29)');

qryDet.SQL.Add('       PP.IDPESSJUR,');
qryDet.SQL.Add('       PPREV.NOME AS NOMEPLANOPREV, ');
qryDet.SQL.Add('       SITP.DESCRICAO AS SITPLANO ');

qryDet.SQL.Add('FROM PARTPREVPLAN PP, PLANPREV PPREV, SITPLANOPREV SITP ');
qryDet.SQL.Add('WHERE PP.IDPLANOPREV = PPREV.IDPLANOPREV(+) ');
qryDet.SQL.Add('      AND SITP.IDSITPLANOPREV(+) = PP.IDSITPLANOPREV ');
qryDet.SQL.Add('      AND (PP.IDSITPLANOPREV IN (25,26,27,28,29) ');
//FIM Helio - SOL 207871 / KTN 2014291

qryDet.SQL.Add('       OR (PP.IDSITPLANOPREV NOT IN (25,26,27,28,29)');
qryDet.SQL.Add('          AND PP.FLGDESATIVADO = 0');
qryDet.SQL.Add('           AND NOT EXISTS (SELECT 1');
qryDet.SQL.Add('                           FROM PARTPREVPLAN PPP1');
qryDet.SQL.Add('                           WHERE PPP1.IDPESSOA = PP.IDPESSOA');
qryDet.SQL.Add('                             AND PPP1.IDSITPLANOPREV IN (25,26,27,28,29))))) PLA ON PLA.IDPESSOA = BH.IDTITULAR');


qryDet.SQL.Add('WHERE BH.FLGREQUERIMENTO =:flgrequerimento');///filtro

//Início - William Santana - SOL 251599.17194 PPM 783173
//CASE CB_TIPO_RECEBEDOR.ITEMINDEX OF
//1: QRYDET.SQL.APPEND(' AND BH.IDTITULAR = BH.IDPESSOA');  ///APOSENTADO
//2: QRYDET.SQL.APPEND(' AND BH.IDTITULAR <> BH.IDPESSOA');  ///PENSIONISTA
//end;

CASE cb_tipo_recebedor.ItemIndex OF
1: qryDet.Sql.Append(' AND BH.IDTITULAR = BH.IDPESSOA AND BH.FLGPAGAINSS = 1');  //Aposentado
2: qryDet.Sql.Append(' AND BH.IDTITULAR <> BH.IDPESSOA AND BH.FLGPAGAINSS = 1');  //Pensionista
3: qryDet.Sql.Append(' AND BH.FLGPAGAINSS = 0');  //Benefício fora de convênio
end;
//Término - William Santana - SOL 251599.17194 PPM 783173
         

// Alterado por FHBS - 27/02/2019 - SIG82823
//qryDet.SQL.Add('   AND EXISTS (SELECT 1');
qryDet.SQL.Add('   AND (SELECT COUNT(1)');
// Fim - Alterado por FHBS - 27/02/2019 - SIG82823
qryDet.SQL.Add('               FROM HISTBENEFHABILITA HB');
qryDet.SQL.Add('               WHERE BH.idbenefhabilita = hb.idbenefhabilita AND');
qryDet.SQL.Add('                     hb.idsithabilitacao = (SELECT valorparam');
qryDet.SQL.Add('                                            FROM paramfolha');
qryDet.SQL.Add('                                            WHERE nomeparam = ''SITUACAOHABILITACAOINSS'') AND');
qryDet.SQL.Add('                     hb.dataregistro = (SELECT MAX(hb1.dataregistro)');
qryDet.SQL.Add('                                        FROM histbenefhabilita hb1');
// Alterado por FHBS - 27/02/2019 - SIG82823
//qryDet.SQL.Add('                                        WHERE hb.idbenefhabilita = hb1.idbenefhabilita))');
qryDet.SQL.Add('                                        WHERE hb.idbenefhabilita = hb1.idbenefhabilita)) > 0');
// Fim - Alterado por FHBS - 27/02/2019 - SIG82823

QRYDET.PARAMBYNAME('FLGREQUERIMENTO').ASINTEGER :=1;

if  trim(_ordem)='' then
    qryDet.SQL.Add(' order by Nome ')
else
    qryDet.SQL.Add(' order by '+_ordem);


qryDet.Active:=true;


if qryDet.IsEmpty then
  tbcDetalhe.Enabled:=false
else
  tbcDetalhe.Enabled:=true;

end;

procedure TFrmCadConcederBenefInssLote.sbtnProcurarClick(Sender: TObject);
var
   ConfirmaVisible : Boolean;


begin
//  inherited;

if Trim(cb_tipo_recebedor.Text) = '' then   ///msg1 //msg06
   begin
   MsgDlg( ' É necessário selecionar um dos tipos de recebedores disponíveis para concessão do benefício.','Erro',mtError,[mbOk],0);
   cb_tipo_recebedor.SetFocus;
   exit;
   end;

   qrydet.Filter := '';    //William Santana - SIG 26527
   qrydet.Filtered:=false; //William Santana - SOL 251599.17194 PPM 783173

//buscarequerimentos('S',''); //William Santana - SIG 26527
  buscarequerimentos('N',''); //William Santana - SIG 26527

if not qryDet.IsEmpty then
   begin
    if rd_benefreq.ItemIndex =0 then
       begin
       sbtnRequerer.Enabled:=false;
       sbtnRequerer.Enabled:=false;


       bbtnDesfazer.Enabled:=true;
       FrmCadConcederBenefInssLote.Refresh;
       end
    else
       begin
       sbtnRequerer.Enabled:=true;

       bbtnDesfazer.Enabled:=false;
       end;
   end
else
   begin
   sbtnRequerer.Enabled:=false;

   bbtnDesfazer.Enabled:=false;
   end;




   sbtnInserir.Enabled := false;
   sbtnAlterar.Enabled := false;
   sbtnApagar.Enabled := false;
   sbtnProcurar.Enabled := false;

    if qryDet.IsEmpty then
      CmeCadastro.Operacao := opVazio
   else
      CmeCadastro.Operacao := opIdle;

   case CmeCadastro.Operacao of
   opVazio :
          begin
               sbtnInserir.Down := false;
               sbtnAlterar.Down := false;
               sbtnApagar.Down  := false;

               sbtnInserir.Enabled := true;
               sbtnAlterar.Enabled := false;
               sbtnApagar.Enabled := false;
               sbtnProcurar.Enabled := true;

               ConfirmaVisible := false;
          end;
   opIdle :
          begin
               sbtnInserir.Down := false;
               sbtnAlterar.Down := false;
               sbtnApagar.Down  := false;
//               sbtnProcurar.Down := false;
               sbtnInserir.Enabled := true;
               sbtnProcurar.Enabled := true;

               if (qryDet.Active) and (not qryDet.IsEmpty) then
               begin
//                  sbtnAlterar.Enabled := true;
//                  sbtnApagar.Enabled := true;
               end
               else begin
                    sbtnAlterar.Enabled := false;
                    sbtnApagar.Enabled := false;
               end;
               ConfirmaVisible := false;
          end;
   opInserir :
             begin
                  sbtnInserir.Down := true;
                  sbtnInserir.Enabled := true;
                  ConfirmaVisible := true;
             end;
   opAlterar :
          begin
//               sbtnAlterar.Down := true;
//               sbtnAlterar.Enabled := true;
               ConfirmaVisible := true;
          end;
   opProcurar :
               begin
//                    sbtnProcurar.Down := true;
                    sbtnProcurar.Enabled := true;
                    ConfirmaVisible := false;
               end;
   opApagar :
            begin
                 sbtnApagar.Down  := false;
//                 sbtnApagar.Enabled := true;
                 ConfirmaVisible := false;
            end;
   else
       ConfirmaVisible := false;
   end;

   bbtnConfirmar.Enabled := ConfirmaVisible;
   bbtnCancelar.Enabled := ConfirmaVisible;


sbtnRequerer.Down:=false;
sbtnProcurar.Down:=false;

  if rd_benefreq.ItemIndex =0 then
       begin
       sbtnRequerer.Enabled:=false;
       end;

end;

procedure TFrmCadConcederBenefInssLote.tbcDetalheChange(Sender: TObject);
begin
//  inherited;
case tbcDetalhe.tabindex of
0:begin
  pnl_impressao.SendToBack;
  pnl1.SendToBack;


if not qryDet.IsEmpty then
   begin
    if rd_benefreq.ItemIndex =0 then
       begin
       sbtnRequerer.Enabled:=false;
    //   sbtnConcedeUm.Enabled:=false;
       bbtnDesfazer.Enabled:=true;
       end
    else
       begin
       sbtnRequerer.Enabled:=true;
    //   sbtnConcedeUm.Enabled:=true;
       bbtnDesfazer.Enabled:=false;
       end;
 // sbtnProcurarClick(sender);
  end;
  end;
1:begin
 // buscarlog;
  pnl1.BringToFront;
  pnl_impressao.SendToBack;
  sbtnRequerer.Enabled:=false;
//  sbtnConcedeUm.Enabled:=false;
  bbtnDesfazer.Enabled:=false;
  end;
2:begin
  configuralog;
  sbtnRequerer.Enabled:=false;
//  sbtnConcedeUm.Enabled:=false;
  bbtnDesfazer.Enabled:=false;
  end;
end;
end;

procedure TFrmCadConcederBenefInssLote.bt_imprimirClick(Sender: TObject);
begin
//  inherited;
//Início - William Santana - SOL 251599.17194 PPM 783173

   qrydet.Filter:='SELECIONADO ='+#39+'S'+#39;
   qrydet.Filtered:=True;
   qrydet.Active:=True;
   qrydet.First;

//Término - William Santana - SOL 251599.17194 PPM 783173

case rg_opcao_impressao.itemindex of
0:gera_impressao_log;
//Início - William Santana - SOL 251599.17194 PPM 783173
 //1:gera_impressao_requerimento;
 1: gera_impressao_req;
//Término - William Santana - SOL 251599.17194 PPM 783173
//1:=
end;

end;

procedure TFrmCadConcederBenefInssLote.gera_impressao_log;
var
     iInicio, iFim, nProcessados : integer;
     iQtdRegistros :integer; //Início - William Santana - SOL 251599.17194 PPM 783173
begin

   If frmMostraAux = Nil Then
     Application.CreateForm(TfrmMostraAux, frmMostraAux);


     DecodeTime(Time, wHora, wMin, wSeg, wMSeg);

     iInicio           := wMSeg + 1000 * wSeg + 60000 * wMin + 3600000 * wHora;
     buscarlog;

     iQtdRegistros := 0;   // William Santana - SOL 251599.17194 PPM 783173

      with frmMostraAux.memResult.Lines do
        begin
        Clear;


        Add('-----------------------------------------------------------------------------------------------------');
        //Início - William Santana - SOL 249376.17130 PPM 757902
        //Add(PreparaStr('LOG DO PROCESSAMENTO DE CONCESSÃO DE BENEFÍCIOS DO INSS EM LOTE',99));
        Add(PreparaStr('LOG DO PROCESSAMENTO DE CONCESSÃO DE BENEFÍCIOS DO INSS',99));
        //Término - William Santana - SOL 249376.17130 PPM 757902
        Add('-----------------------------------------------------------------------------------------------------');
        Add('Início do Processamento: '+FormatDateTime('dd/mm/yyyy', date)+' '+FormatDateTime('hh:mm:ss', time));


        while not qry.eof do
            begin
            Add('-----------------------------------------------------------------------------------------------------');

            Add(PreparaStr('Matrícula  : '+qry.FieldByName('Matrícula').AsString,30)+
             //  PreparaStr('Inscrição : '+qry.FieldByName('inscricao').AsString,20)+
               PreparaStr('Nome  : '+qry.FieldByName('Nome').AsString,49));

            Add('Mensagem de Erro: '+qry.FieldByName('Mensagem de Erro').AsString);
            Add(qry.FieldByName('Mensagem Oracle').AsString);

              inc(iQtdRegistros); // William Santana - SOL 251599.17194 PPM 783173

            qry.next;
            end;


        Add('-----------------------------------------------------------------------------------------------------');
         //Inídio - William Santana - SOL 251599.17194 PPM 783173
          //  Add(PreparaStr('Quantidade total de registros : '+inttostr(qryDet.recordcount),50)+
           Add(PreparaStr('Quantidade total de registros : '+inttostr(iQtdRegistros),50)+
         //Término - William Santana - SOL 251599.17194 PPM 783173
//               PreparaStr('Quantidade de registros processados :  '+inttostr(qry.recordcount),50));////precisa fazer
               PreparaStr('Quantidade de registros processados :  '+inttostr(RegProc),50));


         iFim := wMSeg + 1000 * wSeg + 60000 * wMin + 3600000 * wHora;

            Add(PreparaStr('Tempo de Processamento : '+TempoDecorrido(iFim - iInicio),50)+
               PreparaStr('Log gerado em : '+FormatDateTime('dd/mm/yyyy', date)+' às '+FormatDateTime('hh:mm', time)+' horas',50));



        Add('-----------------------------------------------------------------------------------------------------');
        Add(PreparaStr('Fim do Processamento: '+FormatDateTime('dd/mm/yyyy', date)+' '+FormatDateTime('hh:mm:ss', time),99));
        Add('-----------------------------------------------------------------------------------------------------');



      end;


frmMostraAux.ShowModal;

end;

//Início - William Santana - SOL 251599.17194 PPM 783173
procedure TFrmCadConcederBenefInssLote.gera_impressao_req;
var
  local:string;
  iQtdRegistros :integer;
begin

   lbl_usuario.Caption   := GeraLblUsuario;

   iQtdRegistros := 0 ;

   TFrmPreview.CreateModalPreview(Application, rpReciboCedidos,'Demonstrativo de Concessão de Benefícios de INSS');

    qryDetRel.SQL.Clear;
    qryDetRel.SQL.text :=StringREplace(qrydet.sql.GetText,'AND BB.IDSITBENEFICIO = 4 ','AND BB.IDSITBENEFICIO IN (1,2,3,5) ',[rfReplaceall]);
    qryDetRel.PARAMBYNAME('FLGREQUERIMENTO').ASINTEGER :=1;
    qryDetRel.Active:=True;
    qrydet.First;

    while not qrydet.eof do
     begin

       dsReciboCedidos.DataSet:=qryDetRel;
       qryDetRel.Filtered:=false;
       qryDetRel.Filter:='matricula ='+#39+qrydet.FieldByName('matricula').Text+#39;
       qryDetRel.Filtered:=True;

       if (qryDetRel.FieldByName('matricula').AsString = EmptyStr) then
       begin

         local:= ed_local.text+'\'+QRYDET.FIELDBYNAME('matricula').TEXT ;
         if not DirectoryExists(local) then
                ForceDirectories(local);

         rpReciboCedidos.DeviceType       := 'PDFFile';
         rpReciboCedidos.AllowPrintToFile := True;
         rpReciboCedidos.ShowPrintDialog  := False;
         rpReciboCedidos.TextFileName     := local+'\INSS_'+QRYDET.FIELDBYNAME('matricula').TEXT+'_'+QRYDET.FIELDBYNAME('nome').TEXT+'.pdf';
         rpReciboCedidos.Print;

       end;
         inc(iQtdRegistros);

       qrydet.Next;
     end;
     dsReciboCedidos.DataSet:=qrydet;

    lbl_listados.caption:=inttostr(iQtdRegistros)+' Listados';

end;
//Término - William Santana - SOL 251599.17194 PPM 783173

procedure TFrmCadConcederBenefInssLote.buscarlog;
begin
//pnl1.BringToFront;
//pnl_impressao.SendToBack;
qry.Close;
qry.Active:=false;
qry.sql.clear;
qry.sql.Add('SELECT matricula AS Matrícula,nome as Nome,msgerro as "Mensagem de Erro",msgerrooracle as "Mensagem Oracle" FROM LOGREQUERLOTE');

qry.Active:=true;

end;

procedure TFrmCadConcederBenefInssLote.configuralog;
begin
pnl_impressao.BringToFront;
pnl1.SendToBack;

end;

procedure TFrmCadConcederBenefInssLote.gera_impressao_requerimento;
var
  Sender: TObject;
  FmatriculaR  : TStrings;
  local, vBuffer, matricula, processo :string; //Luiz Carlos - SIG63530 - Inicio/Fim
  iQtdRegistros, i :integer;  //Início - William Santana - 251599.17194 PPM 783173
begin

FmatriculaR:= TStringList.Create;
FmatriculaR.clear;

   // edilaine - SOL 207871 / KTN 2014291 - inicio
   //lbl_versao.Caption:=Sistema.Versao;
   //lbl_lote.caption:=IntToStr(iIdLoteConcessao);
   //Helio - SOL 207871 / KTN 2014291
   //lbl_usuario.caption   := Sistema.NomeUsuario+': Assinatura/Carimbo';
   lbl_usuario.Caption   := GeraLblUsuario;
   //FIM Helio - SOL 207871 / KTN 2014291
        {if rd_benefreq.ItemIndex = 0 then
           lbl_tipoderecebedor.caption:= uppercase(cb_tipo_recebedor.text)
        else
           lbl_tipoderecebedor.caption:= uppercase(cb_tipo_recebedor.text); }

   // edilaine - SOL 207871 / KTN 2014291 - fim

   //Início - William Santana - SOL 251599.17194 PPM 783173
   iQtdRegistros := 0 ;
   //TFrmPreview.CreateModalPreview(Application, rpReciboCedidos,'Demonstrativo de Concessão de Benefícios de INSS em Lote');
   TFrmPreview.CreateModalPreview(Application, rpReciboCedidos,'Demonstrativo de Concessão de Benefícios de INSS');
   //Término - William Santana - SOL 251599.17194 PPM 783173

    //Luiz Carlos - SIG6350 - Inicio
    //qryDetRel.SQL.Clear;
    //qryDetRel.SQL.text :=StringREplace(qrydet.sql.GetText,'AND BB.IDSITBENEFICIO = 4 ','AND BB.IDSITBENEFICIO IN (1,2,3,5) ',[rfReplaceall]);
    //qryDetRel.PARAMBYNAME('FLGREQUERIMENTO').ASINTEGER :=1;
    //qryDetRel.Active:=True;
    //qryDetRel.First;

    qrydet.First;
    for i := 0 to Fidpessoa.Count -1 do
    begin

       //dsReciboCedidos.DataSet:=qryDetRel;
       qrydet.Filtered:=false;

       matricula := Fmatricula[i];
       processo  := Fprocesso[i];

       qrydet.Filter:=' matricula ='+matricula+' and NUMEROPROCESSO = '+processo; // SOL 271037 Peterson Victor;
       qrydet.Filtered:=True;


       local:= ed_local.text+'\'+QRYDET.FIELDBYNAME('matricula').TEXT ;
       if not DirectoryExists(local) then
              ForceDirectories(local);

       //Luiz Carlos - SIG63530 - Inicio
       vBuffer := local+'\INSS_'+QRYDET.FIELDBYNAME('matricula').TEXT+'_'+QRYDET.FIELDBYNAME('nome').TEXT+'.pdf';
       //Luiz Carlos - SIG63530 - Fim

       rpReciboCedidos.DeviceType       := 'PDFFile';
       rpReciboCedidos.AllowPrintToFile := True;
       rpReciboCedidos.ShowPrintDialog  := False;
       //Luiz Carlos - SIG63530 - Inicio
       rpReciboCedidos.TextFileName     := vBuffer;
       //Luiz Carlos - SIG63530 - Fim
       rpReciboCedidos.Print;

       //Luiz Carlos - SIG63530 - Inicio
       ShellExecute(Application.Handle, nil, PChar(vBuffer), nil, nil, SW_SHOWNORMAL);
       //Luiz Carlos - SIG63530 - Fim

       inc(iQtdRegistros);  // William Santana - SOL 251599.17194 PPM 783173

       //qrydet.Next;
    end;

    lbl_listados.caption:=inttostr(iQtdRegistros)+' Listados';  //William Santana - SOL 251599.17194 PPM 783173

  // TFrmPreview.MnuVisualizarClick(sender);

//      rpReciboCedidos.Archivefilename := ed_local.text + IntToStr(GetTickCount) + '.pdf';
//      rpReciboCedidos.AllowPrintToFile := True;
//      rpReciboCedidos.ShowPrintDialog := False;
//      rpReciboCedidos.DeviceType :='PDFFile';
//      rpReciboCedidos.Print;


//buscarequerimentos('S');

{  If frmMostraAux = Nil Then
     Application.CreateForm(TfrmMostraAux, frmMostraAux);
     frmMostraAux.Caption:='DEMONSTRATIVO DE REQUERIMENTOE BENEFÍCIOS DO INSS EM LOTE';

      with frmMostraAux.memResult.Lines do
        begin
        Clear;


         Clear;
         Add('------------------------------------------------------------------------------------------------------');
         Add('          DEMONSTRATIVO DE REQUERIMENTOE BENEFÍCIOS DO INSS EM LOTE        VERSÃO : ' + Sistema.Versao);
//         Add('                                                                           LOTE   : ' + IntToStr(iIdLoteConcessao)); fazer
         Add('USUÁRIO : ' + Sistema.NomeUsuario + '                               DATA DA CONCESSÃO : ' + FormatDateTime('dd/mm/yyyy', Date));
         Add('------------------------------------------------------------------------------------------------------');


         if rd_benefreq.ItemIndex = 0 then
           Add('TIPO DE RECEBEBDOR : ' + cb_tipo_recebedor.text+'      REQUERIDOS: '+'SIM')
        else
           Add('TIPO DE RECEBEBDOR : ' + cb_tipo_recebedor.text+'      REQUERIDOS: '+'NÃO');




        while not qrydet.eof do
            begin
            Add('-----------------------------------------------------------------------------------------------------');

            Add(PreparaStr('Matrícula  : '+qrydet.FieldByName('matricula').AsString,50)+
               PreparaStr('Número do Benefício : '+qrydet.FieldByName('numbeneficio').AsString,50));

            Add(PreparaStr('Nome do Participante : '+qrydet.FieldByName('nome').AsString,99));

            Add(PreparaStr('Espécie  : '+qrydet.FieldByName('especie').AsString,15)+
               PreparaStr('Benefício : '+qrydet.FieldByName('beneficio').AsString,47)+ '  '+
               PreparaStr('RMI : '+qrydet.FieldByName('rmi').AsString,33));


            Add(PreparaStr('Data do Evento  : '+qrydet.FieldByName('dib').AsString,33)+
               PreparaStr('DIP : '+qrydet.FieldByName('dip').AsString,33)+
               PreparaStr('Isento IRRF : '+qrydet.FieldByName('numbeneficio').AsString,33));//fazer


            Add(PreparaStr('DIB : '+qrydet.FieldByName('dib').AsString,50)+
               PreparaStr('DIB Anterior : '+qrydet.FieldByName('DIBANT').AsString,50));

         if rd_benefreq.ItemIndex =0 then


            Add(PreparaStr('Data do Requerimento : '+qrydet.FieldByName('datarequerimento').AsString,50)+
               PreparaStr('Benefício Requerido : '+'SIM',50))
          else


            Add(PreparaStr('Data do Requerimento : '+qrydet.FieldByName('datarequerimento').AsString,50)+
               PreparaStr('Benefício Requerido : '+'NÃO',50));




//            Add('Mensagem de Erro: '+qrydet.FieldByName('mensagem').AsString); ///fazer ??

            qrydet.next;
            end;

        Add('-----------------------------------------------------------------------------------------------------');
        Add(PreparaStr('APENAS PARA CONFERÊNCIA',99));
        Add('-----------------------------------------------------------------------------------------------------');



        end;



frmMostraAux.ShowModal;     }




end;

procedure TFrmCadConcederBenefInssLote.sbtnRequererClick(Sender: TObject);
var
achou:Boolean;
Ferro,sValorFinal  : TStringList;
idevento,valorcalculado,datapagamento,dataref,flgincluimesconc,mesrefatual:string;
iNumeroProcesso,seq,sidmovbenef:integer;
meses:integer;
prorata,i:integer;
valorprorata:double;
ValorInssRat:double;
Mesini:string;
MesReaj:string;
UsarValorReaj,parada:boolean;
ValorReajustadoF,valorreajantec:double;
sIdEventoAux, sMsgErroEvento : String;

_queryx:TwwQuery;



Mesgfim, pstrIdMotivo:string;

 bReajustou,bErro    : Boolean;
 sMsgErro,sDtDIBAnterior,sValorFinal2:string;

 rValorReal,rValorTotal,dValorSRBRetorno:Double;
begin
 Fidpessoa := TStringList.Create;
 Fidpessoa.Clear;
//Início - William Santana - SOL 251599.17194 PPM 783173
// Movido para o FormShow
// SRubrica:= TStringList.Create;//206134
// SRubrica.Clear;//206134
//Término - William Santana - SOL 251599.17194 PPM 783173
 Ferro:= TStringList.Create;
 Ferro.Clear;

 Fmatricula:= TStringList.Create;
 Fmatricula.clear;

 FIdbenefh:= TStringList.Create;
 FIdbenefh.clear;


 //Luiz Carlos - SIG63530 - Inicio
 Fprocesso := TStringList.Create;
 Fprocesso.clear;
 //Luiz Carlos - SIG63530 - Fim

///
  inherited;

_queryx:=TwwQuery.Create(Self);
_queryx.DataBaseName := 'BaseDados';
_queryx.Active:=false;
_queryx.Sql.Clear;


sbtnRequerer.Down:=false;
sbtnProcurar.Down:=false;
RegProc:=0;
//Deletar_temp_log(qry2);
Deletar_temp_log(qry2);
//Criar_temp(qrydet);

if Trim(cb_tipo_recebedor.Text) = '' then //msg02
   begin
   MsgDlg( ' É necessário selecionar um dos tipos de recebedores disponíveis para concessão do benefício.','Erro',mtError,[mbOk],0);
   cb_tipo_recebedor.SetFocus;
   exit;
   end;

if  not qrydet.IsEmpty then
   begin
          //Ewerton Beltramini - 23/04/2020 - SIG92983 Inicio...................................................................................
          sMsgErroEvento := '';
          qrydet.First;
          while not qrydet.eof do
          begin
                case cb_tipo_recebedor.ItemIndex of
                     0, 3:
                     begin
                          if QryDet.FieldByName('IDTITULAR').AsInteger = QryDet.FieldByName('IDPESSOA').AsInteger then  //APOSENTADO
                             sIdEventoAux:='129'
                          else
                             sIdEventoAux:='130';  //PENSIONISTA
                     end;
                     1: sIdEventoAux:='129';
                     2: sIdEventoAux:='130';
                end;

                if (sIdEventoAux <> qrydet.FieldByName('ideventogerador').AsString) then
                    sMsgErroEvento := sMsgErro + qrydet.FieldByName('Nome').AsString + ' - ' + qrydet.FieldByName('Matricula').AsString + ';' + #13;

                qrydet.Next;
          end;
          if sMsgErroEvento <> '' then
          begin
               MsgDlg('O(s) Participante(s) abaixo possui(em) divergência no "Benefício" informado. Favor verificar! ' + #13 + sMsgErroEvento , 'Erro', mtError, [mbOk], 0);
               Exit;
          end;
          //Ewerton Beltramini - 23/04/2020 - SIG92983 Fim.......................................................................................

   qrydet.Filter:='SELECIONADO ='+#39+'S'+#39;
   qrydet.Filtered:=True;
   qrydet.Active:=True;
   qrydet.First;


   if qrydet.IsEmpty then
      begin
      MsgDlg( ' É necessário selecionar pelo menos um participante para concessão do benefício.','Erro',mtError,[mbOk],0);
      qrydet.Filtered:=FALSE;
      Exit;
      end;   //msg3





/////selecao de lote


   if iIdLoteConcessao <= 0
   then begin
      iIdLoteConcessao := SelecionaLoteBeneficioAberto(sAnoMesLoteConcessao,
                                                       iFlgIncluiMesConc );
      if iIdLoteConcessao <= 0
      then begin

         MsgDlg('Nenhum lote selecinado para efetuar a concessão. Verifique. ','Erro',mtError,[mbOk],0);
         Exit;
      end;
   end;

///selecao de lote



///verificar se matricula existe se não criar.



      qrydet.First;
      while not qrydet.eof do
         begin
          if qrydet.FieldByName('matricula').Text='' then
             begin
             qrydet.edit;
             qrydet.FieldByName('matricula').Text:=GeraMatricula( qrydet ,0);
             qrydet.post;

             end;

         qrydet.Next;
         end;






   qrydet.First;
   Ferro.Clear;



   achou:=false;



      qrydet.First;
      while not qrydet.eof do
         begin

         Fidpessoa.Add(#39+qrydet.FieldByName('idpessoa').Text+#39);
         Fmatricula.Add(#39+qrydet.FieldByName('matricula').Text+#39);
         FIdbenefh.Add(#39+qrydet.FieldByName('IDBENEFHABILITA').Text+#39);
         //Luiz Carlos - SIG63530 - Inicio
         Fprocesso.Add(#39+qrydet.FieldByName('numeroprocesso').Text+#39);
         //Luiz Carlos - SIG63530 - Fim

         qrydet.Next;
         end;

      achou:=True;



   if achou= False then
      begin
      MsgDlg( ' É necessário selecionar pelo menos um participante para requerimento do benefício.','Erro',mtError,[mbOk],0);
      Exit;
      end
   else
      begin



      qrydet.First;
      Ferro.Clear;
      while not qrydet.Eof do
       begin




//rn001


//rn004

    try
           sidmovbenef:=CriaLogOcorrencia(qryDet.FieldByName('IDPLANOPREV').AsString,
                             qryDet.FieldByName('IdPessJur').AsString,
                             qryDet.FieldByName('IdTitular').AsString,
                             qryDet.FieldByName('IdBeneficio').AsString,
                             qryDet.FieldByName('NumeroProcesso').AsString,
                             qryDet.FieldByName('IdPessoa').AsString,
                             qryDet.FieldByName('SeqProposta').AsString,
                             '3', ///rn004
                             FormatDateTime('dd/mm/yyyy', date),
                             '',//qryDet.FieldByName('ValorAtual').AsString
                             '',//qryDet.FieldByName('ValorTotal').AsString
                             '',//qryDet.FieldByName('ValorCotas').AsString
                             '',//qryDet.FieldByName('DataInicio').AsString
                             '',//sDataFinal
                             '',//qryDet.FieldByName('ValorAtual').AsString
                             '',//qryDet.FieldByName('DataInicio').AsString
                             '',//sDataFinal
                             '4',
                             0,//qryDet.FieldByName('FlgDataPrevista').AsInteger
                             qryAux, '',
                             iIdLoteConcessao,
                             iIdCalculo,//iIdCalculo
                             False,
                             0,//qryDet.FieldByName('USUARIOALT').AsInteger
                             0//iFlgEmprestimo
                             )
        except
        //   frmAguarde.Apaga;

          If not dtmBaseDados.dbBaseDados.InTransaction Then
             dtmBaseDados.dbBaseDados.StartTransaction;

        buscarlog;



        pnl1.BringToFront;
        pnl_impressao.SendToBack;
        sbtnRequerer.Enabled:=false;
        bbtnDesfazer.Enabled:=false;

        if dtmBaseDados.dbBaseDados.InTransaction then
           dtmBaseDados.dbBaseDados.RollBack;
           MsgDlg('Erro no registro da operação.','Erro',mtError,[mbOk],0);
           TiraSQL(qryAux);
           Exit;
        end;

  //rn004


  qryaux.close;
  qryaux.SQL.Clear;
  qryaux.SQL.Add('select mesreferencia,datapagamento,flgincluimesconc from ctrlinterface');
  qryaux.SQL.Add('where idlote = '+#39+inttostr(iIdLoteConcessao)+#39);
  qryaux.open;

  datapagamento:=qryaux.fieldbyname('datapagamento').text;
  flgincluimesconc:=qryaux.fieldbyname('flgincluimesconc').text;
  dataref:=qryaux.fieldbyname('mesreferencia').text;




  ///verificar quais rubricas irão ser usadas

  qryaux.CLOSE;
  qryaux.SQL.CLEAR;
  qryaux.SQL.ADD('select idmotivoabono, idmotivofolhaben from paramaprev');
  qryaux.OPEN;


  QRYDETCONCINSS.CLOSE;
  QRYDETCONCINSS.SQL.CLEAR;
  QRYDETCONCINSS.SQL.ADD('SELECT * FROM DETCONCINSS');
  QRYDETCONCINSS.SQL.ADD('WHERE IDPESSOA = '+#39+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+#39);
  QRYDETCONCINSS.SQL.ADD('AND  NUMPROCINSS = '+#39+QRYDET.FIELDBYNAME('NUMBENEFICIO').TEXT+#39);
  //William Moreira da Silva - SIG 39243
  //QRYDETCONCINSS.SQL.ADD(' ORDER BY  MESREFERENCIA DESC');
  QRYDETCONCINSS.SQL.ADD(' ORDER BY  MESREFERENCIA DESC, sequencial');
  //William Moreira da Silva - SIG 39243
  QRYDETCONCINSS.OPEN;



  qrydetconcaux.CLOSE;
  qrydetconcaux.SQL.CLEAR;
  //Darivaldo Alencar SIG26527 -inicio
  //qrydetconcaux.SQL.ADD('SELECT min(DTINICIOCRED)DTINICIOCRED FROM DETCONCINSS');
  qrydetconcaux.SQL.ADD('SELECT min(DTINICIOCRED)DTINICIOCRED,MAX(DTFIMCRED)DTFIMCRED FROM DETCONCINSS');
  //Darivaldo Alencar SIG26527 -fim
  qrydetconcaux.SQL.ADD('WHERE IDPESSOA = '+#39+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+#39);
  qrydetconcaux.SQL.ADD('AND  NUMPROCINSS = '+#39+QRYDET.FIELDBYNAME('NUMBENEFICIO').TEXT+#39);
  qrydetconcaux.OPEN;

   seq:=0;
  valorreajantec:=0;
  parada:=False;
  while not QRYDETCONCINSS.eof do
  begin




  if int(strtodate('01/'+copy(QRYDETCONCINSS.fieldbyname('MESREFERENCIA').text,6,2)+'/'+copy(QRYDETCONCINSS.fieldbyname('MESREFERENCIA').text,1,4)))>=int(strtodate('01/'+copy(dataref,6,2)+'/'+copy(dataref,1,4))) then
     begin
     QRYDETCONCINSS.next;
     continue;
     end;     ///rn nova lote




        if qrydetconcaux.fieldbyname('DTINICIOCRED').text<>qryDet.fieldbyname('DIB').text then//RN18
         begin
         Ferro.Add(qrydet.fieldbyname('matricula').text);



         //Helio - SOL 207871 / KTN 2014291
         //Gravar_temp_log(param,'Não foi possível efetuar a concessão porque a matrícula '+ qryDet.fieldbyname('matricula').text+' possui inconsistência nas Datas de início. Verifique!'+QRYDETCONCINSS.fieldbyname('SEQUENCIAL').text,'');
         Gravar_temp_log(param,'Não foi possível efetuar a concessão porque a matrícula '+ qryDet.fieldbyname('matricula').text+' possui inconsistência nas Datas de início - Ajustar DER, DIB.', '');
         //FIM Helio - SOL 207871 / KTN 2014291



         parada:=True;
         break;

         end;
       //// trava feita item a item

  seq:=seq+1;

   QRYRUBRICAXINSS.CLOSE;
   QRYRUBRICAXINSS.SQL.CLEAR;
   QRYRUBRICAXINSS.SQL.ADD('SELECT * FROM RUBRICAXINSS');
   QRYRUBRICAXINSS.SQL.ADD('WHERE RUBRICAINSS = '+#39+QRYDETCONCINSS.FIELDBYNAME('RUBRICAINSS').TEXT+#39);
   QRYRUBRICAXINSS.SQL.ADD('AND  IDRUBRICA = '+#39+QRYDETCONCINSS.FIELDBYNAME('IDRUBRICA').TEXT+#39);
   QRYRUBRICAXINSS.OPEN;

 IDPROVENTO:='';
 if QRYRUBRICAXINSS.FIELDBYNAME('FLGTIPORUBRICAXINSS').TEXT = 'I' then
    begin
    _QUERYX.SQL.CLEAR;
    _QUERYX.SQL.APPEND('SELECT PD.IDPROVENTO IDPROVENTO');
    _QUERYX.SQL.APPEND('FROM RUBRICAXINSS RXI ');
    _QUERYX.SQL.APPEND('     JOIN PROVDESC PD ON TO_CHAR(RXI.RUBRICAINSSDESEMB) = PD.CODPROVDESC ');
    _QUERYX.SQL.APPEND('     WHERE RXI.IDRUBRICA =  '+#39+QRYDETCONCINSS.FIELDBYNAME('IDRUBRICA').TEXT+#39);
    _QUERYX.OPEN;



//  if QRYRUBRICAXINSS.FIELDBYNAME('RUBRICAINSSDESEMB').TEXT = '' then
     if _queryx.IsEmpty then
        begin

        Gravar_temp_log(param,'Rubrica Individual não está com a Rubrica de desembolso parametrizada para a matrícula '+ qryDet.fieldbyname('matricula').text+' . Verifique!'+QRYDETCONCINSS.fieldbyname('SEQUENCIAL').text,'');

        parada:=True;
        break;
        end;
    IDPROVENTO :=_QUERYX.FIELDBYNAME('IDPROVENTO').TEXT;
    _QUERYX.close;
    end;

  if QRYRUBRICAXINSS.FIELDBYNAME('FLGTIPORUBRICAXINSS').TEXT = '' then
    begin
     QRYDETCONCINSS.next;
     continue;
     end;     ///rn nova lote

     //Marcio Sanches Spinosa/ Douglas Siqueira SOL 203886 Kintana 1970485 - Inicio
     if (QRYRUBRICAXINSS.FIELDBYNAME('FLGTIPORUBRICAXINSS').AsString = 'B') then
        pstrIdMotivo := qryaux.FIELDBYNAME('idmotivofolhaben').AsString
     else
        pstrIdMotivo := qryaux.FIELDBYNAME('idmotivoabono').AsString;
     //Marcio Sanches Spinosa/ Douglas Siqueira SOL 203886 Kintana 1970485 - Fim

   if QRYRUBRICAXINSS.FIELDBYNAME('FLGTIPORUBRICAXINSS').TEXT = 'B' then
      begin

      if copy(QRYDETCONCINSS.FIELDBYNAME('dtiniciocred').TEXT,4,2)=copy(QRYDETCONCINSS.FIELDBYNAME('dtfimcred').TEXT,4,2) then //mes mês
         begin
           GravarHSTBENEFBFCIARIO(qryaux2,
                                 'B',
                                 pstrIdMotivo,//Marcio Sanches Spinosa/ Douglas Siqueira SOL 203886 Kintana 1970485
                                 '0',
                                 inttostr(seq),
                                 QRYDETCONCINSS.FIELDBYNAME('valorinss').TEXT,
                                 datapagamento,
                                 inttostr(sidmovbenef),
                                 flgincluimesconc,
                                 QRYDETCONCINSS.FIELDBYNAME('MESREFERENCIA').TEXT,
                                 dataref); //RN08, RN09  fazer para todos os tipo FLGTIPORUBRICAXINSS

           valorreajantec:=QRYDETCONCINSS.FIELDBYNAME('valorinss').VALUE;
         end
         else
         begin

         ValorInssRat:=QRYDETCONCINSS.FIELDBYNAME('valorinss').VALUE;
         Mesini:=QRYDETCONCINSS.FIELDBYNAME('MESREFERENCIA').TEXT;
         try
       //  meses:=strtoint(copy(QRYDETCONCINSS.FIELDBYNAME('dtfimcred').TEXT,4,2))-strtoint(copy(QRYDETCONCINSS.FIELDBYNAME('dtiniciocred').TEXT,4,2))+1;
         meses:=CalculaData(QRYDETCONCINSS.FIELDBYNAME('dtiniciocred').TEXT,QRYDETCONCINSS.FIELDBYNAME('dtfimcred').TEXT)+1;
         except
         end;
         MesReaj:=BuscarUltMesreaj();
         Mesgfim:= Mesini;//206134
         try
         for i:=1 to (meses-1) do//206134
             begin
             Mesgfim:=ProximoAnoMes(strtoint(copy(Mesgfim,6,2)),strtoint(copy(Mesgfim,1,4)));//206134
             end;
         except
         end;

         UsarValorReaj:=false;
         ValorReajustadoF:=0;
         for i:=meses downto 1 do
            begin

//            if I<>1 then
//               ValorInssRat:=ValorInssRat-QRYDETCONCINSS.FIELDBYNAME('rmreaj').value;
             try
             if mesreaj = ProximoAnoMes(strtoint(copy(Mesgfim,6,2)),strtoint(copy(Mesgfim,1,4))) then
                begin
                //
                UsarValorReaj:=true;
                ValorReajustadoF:=BuscarValorReajustadoPAB(QRYDETCONCINSS.FIELDBYNAME('rmreaj').value,QRYDET.FIELDBYNAME('NUMBENEFICIO').TEXT,Mesini);
                ValorReajustadoF:=BuscarValorReajustadoPAB(ValorReajustadoF,QRYDET.FIELDBYNAME('NUMBENEFICIO').TEXT,Mesini);
                end;
             except
             end;

            if I =1 then
            begin
               //William Moreira da Silva - SIG 37047
               //ValorInssRat:=ValorInssRat-valorreajantec;//William Moreira da Silva - SOL 231534 PPM 375351
               //William Moreira da Silva - SIG 37047

               GravarHSTBENEFBFCIARIO(qryaux2,
                                      'B',
                                      pstrIdMotivo,//Marcio Sanches Spinosa/ Douglas Siqueira SOL 203886 Kintana 1970485
                                      '0',
                                      inttostr(seq),
                                      formatfloat('#,##0.00',ValorInssRat),
                                      datapagamento,
                                      inttostr(sidmovbenef),
                                      flgincluimesconc,
                                      QRYDETCONCINSS.FIELDBYNAME('MESREFERENCIA').TEXT,
                                      dataref); //RN08, RN09  fazer para todos os tipo FLGTIPORUBRICAXINSS

               valorreajantec:=ValorInssRat; //TAES - SIG99677
			end
            else
               begin
               if UsarValorReaj then
                  ValorInssRat:=ValorInssRat-ValorReajustadoF
               else
                  //ValorInssRat:=ValorInssRat-valorreajantec;//William Moreira da Silva - SOL 231534 PPM 375351
//                  ValorInssRat:=ValorInssRat-QRYDETCONCINSS.FIELDBYNAME('rmreaj').value; ///alteracao


               if UsarValorReaj then
                  GravarHSTBENEFBFCIARIO(qryaux2,
                                         'B',
                                         pstrIdMotivo,//Marcio Sanches Spinosa/ Douglas Siqueira SOL 203886 Kintana 1970485
                                         '0',
                                         inttostr(seq),
                                         floattostr(ValorReajustadoF),
                                         datapagamento,
                                         inttostr(sidmovbenef),
                                         flgincluimesconc,
                                         Mesgfim,
                                         dataref)
               else
                   GravarHSTBENEFBFCIARIO(qryaux2,
                                         'B',
                                         pstrIdMotivo,//Marcio Sanches Spinosa/ Douglas Siqueira SOL 203886 Kintana 1970485
                                         '0',
                                         inttostr(seq),
                                         floattostr(valorreajantec),
                                         datapagamento,
                                         inttostr(sidmovbenef),
                                         flgincluimesconc,
                                         Mesgfim,
                                         dataref); //RN08, RN09  fazer para todos os tipo FLGTIPORUBRICAXINSS
               end;
            try
            Mesgfim:=AnoMesAnterior(strtoint(copy(Mesgfim,6,2)),strtoint(copy(Mesgfim,1,4)));
            except
            end;

                //William Moreira da Silva - SIG 39243
                if not UsarValorReaj then
                begin
                        ValorInssRat:=ValorInssRat-valorreajantec;//William Moreira da Silva - SIG 37047
                end;
                //William Moreira da Silva - SIG 39243

            seq:=seq+1;
            end;



         end;
      end
         else
               if QRYRUBRICAXINSS.FIELDBYNAME('FLGTIPORUBRICAXINSS').TEXT = 'A' then
                   begin
                   GravarHSTBENEFBFCIARIO(qryaux2,
                                          'A',
                                          pstrIdMotivo,//Marcio Sanches Spinosa/ Douglas Siqueira SOL 203886 Kintana 1970485
                                          '2',
                                          inttostr(seq),
                                          QRYDETCONCINSS.FIELDBYNAME('valorinss').TEXT,
                                          datapagamento,
                                          inttostr(sidmovbenef),
                                          flgincluimesconc,
                                          QRYDETCONCINSS.FIELDBYNAME('MESREFERENCIA').TEXT,
                                          dataref) //RN08, RN09  fazer para todos os tipo FLGTIPORUBRICAXINSS
                   end
                else
                        if QRYRUBRICAXINSS.FIELDBYNAME('FLGTIPORUBRICAXINSS').TEXT = 'I' then
                    begin
                      GravarRubricaIndiv(qryaux2,qryaux.FIELDBYNAME('idmotivoabono').TEXT,QRYDETCONCINSS.FIELDBYNAME('mesreferencia').TEXT,inttostr(seq),dataref,inttostr(sidmovbenef));//206134
                    end
                    else
                      if QRYRUBRICAXINSS.FIELDBYNAME('FLGTIPORUBRICAXINSS').TEXT = 'T' then
                         begin
                         GravarHSTBENEFBFCIARIO(qryaux2,
                                               'T',
                                               pstrIdMotivo, //Marcio Sanches Spinosa/ Douglas Siqueira SOL 203886 Kintana 1970485
                                               '1',
                                               inttostr(seq),
                                               QRYDETCONCINSS.FIELDBYNAME('valorinss').TEXT,
                                               datapagamento,
                                               inttostr(sidmovbenef),
                                               flgincluimesconc,
                                               QRYDETCONCINSS.FIELDBYNAME('MESREFERENCIA').TEXT,
                                               dataref) //RN08, RN09  fazer para todos os tipo FLGTIPORUBRICAXINSS
                         end;




   QRYDETCONCINSS.Next;
   end;

QRYDETCONCINSS.CLOSE;
qrydetconcaux.CLOSE;

///verificar quais rubricas irão ser usadas


if parada then
   begin
   qrydet.Next;
   Continue;
   end;

iIdCalculo:=0;






qryaux.close;
qryaux.SQL.Clear;
qryaux.SQL.Add('select mesreferencia,datapagamento,flgincluimesconc from ctrlinterface');
qryaux.SQL.Add('where idlote = '+#39+inttostr(iIdLoteConcessao)+#39);
qryaux.open;


qryaux2.close;
qryaux2.SQL.Clear;
qryaux2.SQL.Add('update BENEFBFCIARIO');
qryaux2.SQL.Add('set');
qryaux2.SQL.Add('  idsitbeneficio = 1, ');
qryaux2.SQL.Add('  dataconcessao = sysdate, '); // SOL 218688 Kintana 2051172
qryaux2.SQL.Add('  ultmespreparo ='+#39+AnoMesAnterior(strtoint(copy(qryaux.fieldbyname('mesreferencia').text,6,2)),strtoint(copy(qryaux.fieldbyname('mesreferencia').text,1,4)))+#39);
qryaux2.SQL.Add(' ,VALORATUAL = '+#39+QRYDET.FIELDBYNAME('RMIREAJ').text+#39 );//William Moreira da Silva - SOL 268697 PPM 1271911 //TAES - SIG99677
qryaux2.SQL.Add(' ,VALORTOTAL = '+#39+QRYDET.FIELDBYNAME('RMIREAJ').text+#39 );//William Moreira da Silva - SOL 268697 PPM 1271911 //TAES - SIG99677
qryaux2.SQL.Add('where');
qryaux2.SQL.Add('  NUMEROPROCESSO = '+#39+qryDet.fieldbyname('NUMEROPROCESSO').text+#39+' and'); // SOL 271037 Peterson Victor
qryaux2.SQL.Add('  IDTITULAR = '+#39+qryDet.fieldbyname('IDTITULAR').text+#39+' and');
qryaux2.SQL.Add('  IDBENEFICIO = '+#39+qryDet.fieldbyname('IDBENEFICIO').text+#39+' and');
qryaux2.SQL.Add('  IDPESSOA = '+#39+qryDet.fieldbyname('IDPESSOA').text+#39);

qryaux2.SQL.Add('  and  rownum = 1');
   try
             qryaux2.ExecSQL;
          except
             on E:EDBEngineError do
               begin
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;

 qryaux2.CLOSE;
qryaux.close;

       AtualizaBenefHabilita(qryaux,'1',inttostr(iNumeroProcesso),(idevento)); 
       //Início - William Santana - SOL 218687.17129 PPM 757901
       // AtualizaBenefbfciario(qryaux,'1');//rn14
        if (QryDet.FieldByName('FLGPAGAINSS').AsInteger = 0) then   //fora do convênio
           AtualizaBenefbfciario(qryaux,'2')//rn25
        else
           AtualizaBenefbfciario(qryaux,'1');//rn14
       //Término - William Santana - SOL 218687.17129 PPM 757901

       RegProc:=RegProc+1;

       if cb_grava_indiv.Checked then
          begin

          If not dtmBaseDados.dbBaseDados.InTransaction Then
             dtmBaseDados.dbBaseDados.StartTransaction;

          dtmBaseDados.dbBaseDados.Commit;
          end;

       qrydet.Next;
       end;


      end;
   end;


gera_impressao_requerimento;
qrydet.Filtered:=false;
if Ferro.Count>0 then
   begin
     if not cb_grava_indiv.Checked then
         begin


         If not dtmBaseDados.dbBaseDados.InTransaction Then
             dtmBaseDados.dbBaseDados.StartTransaction;




         if MsgDlg( 'Para pelo menos uma matrícula selecionada não foi possível efetuar a concessão do benefício. Verifique o log da operação! Deseja gravar as alterações ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
            begin
            buscarlog;
            tbcDetalhe.TabIndex:=1;
            pnl1.BringToFront;
            pnl_impressao.SendToBack;
            sbtnRequerer.Enabled:=false;
            bbtnDesfazer.Enabled:=false;

            dtmBaseDados.dbBaseDados.Commit;
            gera_impressao_requerimento;
            end
          else
             begin
             buscarlog;
            tbcDetalhe.TabIndex:=1;
            pnl1.BringToFront;
            pnl_impressao.SendToBack;
            sbtnRequerer.Enabled:=false;
            bbtnDesfazer.Enabled:=false;


             If dtmBaseDados.dbBaseDados.InTransaction   Then
                dtmBaseDados.dbBaseDados.Rollback;
             end;
          end
      else
         begin
         buscarlog;
            tbcDetalhe.TabIndex:=1;
            pnl1.BringToFront;
            pnl_impressao.SendToBack;
            sbtnRequerer.Enabled:=false;
            bbtnDesfazer.Enabled:=false;

         MsgDlg( 'Para pelo menos uma matrícula selecionada não foi possível efetuar a concessão do benefício. Verifique o log da operação!','Erro',mtError,[mbOk],0);
         end
   end
else
   begin

      if not cb_grava_indiv.Checked then
         begin

         If not dtmBaseDados.dbBaseDados.InTransaction Then
             dtmBaseDados.dbBaseDados.StartTransaction;

         if MsgDlg( ' Concessão efetuada com sucesso para as matrículas selecionadas.Deseja gravar as alterações ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
            begin
            dtmBaseDados.dbBaseDados.Commit;
            buscarlog;
            tbcDetalhe.TabIndex:=1;
            pnl1.BringToFront;
            pnl_impressao.SendToBack;
            sbtnRequerer.Enabled:=false;
            bbtnDesfazer.Enabled:=false;

            gera_impressao_requerimento;
            end
          else
             begin
             buscarlog;
            tbcDetalhe.TabIndex:=1;
            pnl1.BringToFront;
            pnl_impressao.SendToBack;
            sbtnRequerer.Enabled:=false;
            bbtnDesfazer.Enabled:=false;

             If dtmBaseDados.dbBaseDados.InTransaction   Then
                dtmBaseDados.dbBaseDados.Rollback;
             end;
          end
      else
         begin
         MsgDlg( '  Concessão efetuada com sucesso para as matrículas selecionadas.','Informação',mtInformation,[mbOk],0);
         end;
      
   end;

qrydet.Filtered:=false;
sbtnProcurarClick(sender);
sbtnRequerer.Down:=false;
sbtnProcurar.Down:=false;
end;

procedure TFrmCadConcederBenefInssLote.sbtnApagarClick(Sender: TObject);
begin

//
  inherited;

end;

procedure TFrmCadConcederBenefInssLote.sbtnAltDetClick(Sender: TObject);
begin

  inherited;



  if qryDet.IsEmpty then
  begin
     sbtnAltDet.Down := false;
     exit;
  end;

////
end;

procedure TFrmCadConcederBenefInssLote.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmCadConcederBenefInssLote.sbtnExcluiDetClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmCadConcederBenefInssLote.sbtnConcedeUmClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmCadConcederBenefInssLote.CmeDetalheAtualizaBotoes(
  Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmCadConcederBenefInssLote.CmeDetalheCancel(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmCadConcederBenefInssLote.CmeDetalheConfirma(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmCadConcederBenefInssLote.CmeDetalheDelete(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmCadConcederBenefInssLote.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmCadConcederBenefInssLote.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmCadConcederBenefInssLote.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmCadConcederBenefInssLote.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
//
//  If qry.State <> dsEdit Then
//     qry.Edit;

end;

procedure TFrmCadConcederBenefInssLote.CmeCadastroDelete(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmCadConcederBenefInssLote.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmCadConcederBenefInssLote.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
//
end;



procedure TFrmCadConcederBenefInssLote.bbtnDesfazerClick(Sender: TObject);
var
Fidpessoa,Ferro,Fmatricula,Fidbeneficio  : TStringList;
  achou:Boolean;

begin
Deletar_temp_log(qry2);


 Fidpessoa := TStringList.Create;
 Fidpessoa.Clear;

 Ferro:= TStringList.Create;
 Ferro.Clear;

 Fmatricula:= TStringList.Create;
 Fmatricula.clear;

Fidbeneficio:= TStringList.Create;
Fidbeneficio.clear;
///
RegProc:=0;
  inherited;

if Trim(cb_tipo_recebedor.Text) = '' then//msg07
   begin
   MsgDlg( ' É necessário selecionar um dos tipos de recebedores disponíveis para desfazer a concessão do benefício.','Erro',mtError,[mbOk],0);
   cb_tipo_recebedor.SetFocus;
   exit;
   end;


   qrydet.Filter:='SELECIONADO ='+#39+'S'+#39;
   qrydet.Filtered:=True;
   qrydet.Active:=True;
   qrydet.First;


   if qrydet.IsEmpty then //msg08
      begin
      MsgDlg( ' É necessário selecionar pelo menos um participante para desfazer a concessão do benefício.','Erro',mtError,[mbOk],0);
      qrydet.Filtered:=FALSE;
      Exit;
      end;



if  not qrydet.IsEmpty then
   begin


   achou:=true;


      qrydet.First;
      while not qrydet.eof do
         begin

         Fidpessoa.Add(#39+qrydet.FieldByName('idpessoa').Text+#39);
         Fmatricula.Add(#39+qrydet.FieldByName('matricula').Text+#39);
         Fidbeneficio.Add(#39+qrydet.FieldByName('idbeneficio').Text+#39);


         qrydet.Next;
         end;



     RemoveDuplicates(Fidpessoa);
     RemoveDuplicates(Fmatricula);
     RemoveDuplicates(Fidbeneficio);




 //Rn019
   qryaux.close;
   qryaux.SQL.Clear;


   QRYAUX.SQL.APPEND(' SELECT distinct MATRICULA FROM HISTRUBSAL H ');   // edilaine - SIG 22026
   QRYAUX.SQL.APPEND('   JOIN DEPENTIT D ON H.IDPESSOA = D.IDPESSOA');
   QRYAUX.SQL.APPEND('   AND H.IDTITULAR = D.IDTITULAR');
   QRYAUX.SQL.APPEND(' WHERE h.IDPESSOA IN('+FIDPESSOA.COMMATEXT+')');
   QRYAUX.SQL.APPEND('                AND h.IDBENEFICIO IN ('+FIDBENEFICIO.COMMATEXT+')');
   QRYAUX.SQL.APPEND('                AND H.Numeroprocesso =' + qrydet.fieldbyname('numeroprocesso').text); // SOL 271037 Peterson Victor

   qryaux.Open;
   qryaux.First;
   Ferro.Clear;

   if not qryaux.IsEmpty then
     begin
     while not qryaux.Eof do
        begin

        Ferro.Add(qryaux.fieldbyname('matricula').text);

        qryaux.Next;
        end;

      MsgDlg( ' A(S) matrículas '+trocaCaracter(Ferro.CommaText,',','e')+' já teve (tiveram) o benefício processado pela folha de benefícios','Erro',mtError,[mbOk],0);///msg11
      Exit;
     end;

      If not dtmBaseDados.dbBaseDados.InTransaction Then
         dtmBaseDados.dbBaseDados.StartTransaction;


   qrydet.First;
   while not qrydet.Eof do
      begin


         // edilaine - SIG 22026 - inicio
         //DeletarPrevia();//novo
         iIdLoteConcessao := BuscaLoteConcedido();
         if VerificaExistePrevia(iIdLoteConcessao, qrydet.fieldbyname('numeroprocesso').text, '', '')
         then begin
            qrydet.Next;
            continue;
         end;
         iIdLoteConcessao := 0;          
         // edilaine - SIG 22026 - fim

         DeletarRubricaIndiv(qry2);//206134
         DeletarHSTBENEFBFCIARIO(qry2,qrydet.fieldbyname('numeroprocesso').text);//0//rn14
         DeletarMovbenef(qry2,qrydet.fieldbyname('numeroprocesso').text); //rn14

      AtualizaBenefHabilita(qryaux,'0','','');//rn14
      AtualizaBenefbfciario(qryaux,'4');//rn14

      RegProc:=RegProc+1;

       if cb_grava_indiv.Checked then
         begin

         if dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Commit;

         end;      

      qrydet.Next;
      end;


   end;



     qrydet.Filtered:=FALSE;



if Ferro.Count>0 then
   begin

   if not cb_grava_indiv.Checked then
         begin
         if MsgDlg( 'Para pelo menos uma matrícula selecionada não foi possível desfazer a concessão do benefício. Verifique. Deseja gravar as alterações ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
            begin
            dtmBaseDados.dbBaseDados.Commit;
            buscarlog;
            tbcDetalhe.TabIndex:=1;
            pnl1.BringToFront;
            pnl_impressao.SendToBack;
            sbtnRequerer.Enabled:=false;
            bbtnDesfazer.Enabled:=false;

            end
          else
             begin
             buscarlog;
            tbcDetalhe.TabIndex:=1;
            pnl1.BringToFront;
            pnl_impressao.SendToBack;
            sbtnRequerer.Enabled:=false;
            bbtnDesfazer.Enabled:=false;

             If dtmBaseDados.dbBaseDados.InTransaction   Then
                dtmBaseDados.dbBaseDados.Rollback;
             end;
          end
      else
         MsgDlg( 'Para pelo menos uma matrícula selecionada não foi possível desfazer a concessão do benefício. Verifique.','Erro',mtError,[mbOk],0);

   end
else
   begin

   if not cb_grava_indiv.Checked then
         begin
         if MsgDlg( 'Concessão cancelada com sucesso para as matrículas selecionadas. Deseja gravar as alterações ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
            begin
            dtmBaseDados.dbBaseDados.Commit;
            buscarlog;
            tbcDetalhe.TabIndex:=1;
            pnl1.BringToFront;
            pnl_impressao.SendToBack;
            sbtnRequerer.Enabled:=false;
            bbtnDesfazer.Enabled:=false;            
            end
          else
             begin
             buscarlog;

            tbcDetalhe.TabIndex:=1;
            pnl1.BringToFront;
            pnl_impressao.SendToBack;
            sbtnRequerer.Enabled:=false;
            bbtnDesfazer.Enabled:=false;
             If dtmBaseDados.dbBaseDados.InTransaction   Then
                dtmBaseDados.dbBaseDados.Rollback;
             end;
          end
      else
         MsgDlg( 'Concessão cancelada com sucesso para as matrículas selecionadas.','Informação',mtInformation,[mbOk],0);

   end;
sbtnProcurarClick(sender);

sbtnRequerer.Down:=false;
sbtnProcurar.Down:=false;
sbtnAlterar.Down:=false;

end;

procedure TFrmCadConcederBenefInssLote.bbtnOkDetClick(Sender: TObject);
begin

     if MsgDlg('Deseja gravar as alterações ? ' ,'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
        begin

        if not cb_validado.Checked then
           begin
           if MsgDlg('Alterações foram efetuadas e o campo "Validado" está desmarcado - Deseja confirmar a alteração sem a validação ? ' ,'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrno then
              exit;
           end;


        if qryDet.fieldbyname('RMI').text='' then
           begin
           MsgDlg( ' A RMI para a matrícula '+qryDet.fieldbyname('matricula').text+' não está no formato correto.','Erro',mtError,[mbOk],0);
           Exit;
           end;

        if not IsDate(qryDet.fieldbyname('DIBANT').text) then
           begin
           MsgDlg( ' A DIB Anterior para a matrícula '+qryDet.fieldbyname('matricula').text+' não está no formato correto.','Erro',mtError,[mbOk],0);
           Exit;
           end;

        inherited;
        ///grava as alteraçõs

        end
     else
         begin
         bbtnCancelarDetClick(Sender);
         //cancela as alterações
         end;

end;

procedure TFrmCadConcederBenefInssLote.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmCadConcederBenefInssLote.GravarEventoPrev(_query: TwwQuery;_EventoGerador:string); ///RN015

var
iIdEventoPrev: integer;
sIdEventoGerador: string;
sFlgEfetivado,sDataEfetivado ,sFlgSitFuncImed,sFlgSitPartImed,sFlgSitPlanoImed: string;
sIDSITFUNC,sIDSITPART ,sIDSITPLANOPREV: string;

begin
 iIdEventoPrev := LeUltRegistro(_query,'EVENTOSPREV');
 sIdEventoGerador:= _EventoGerador;  //129 0u 130 regra 015

  sIdEventoGerador:= '131';  //teste


  _query.Close;
  _query.Sql.Clear;
  _query.Sql.Add(' SELECT FLGSITFUNCIMEDIA, FLGSITPARTIMEDIA, FLGSITPLANOIMEDI FROM EVENTOGERADOR ' +
                 ' WHERE IDEVENTOGERADOR = ' + sIdEventoGerador);
  try
     _query.Open;
  except

  end;

  if (_query.FieldByName('FLGSITFUNCIMEDIA').AsString  = '1') and
     (_query.FieldByName('FLGSITPARTIMEDIA').AsString  = '1') and
     (_query.FieldByName('FLGSITPLANOIMEDI').AsString = '1')
  then begin
     sFlgEfetivado  := '1';

     sDataEfetivado := ' To_Date(''' + FormatDateTime('dd/mm/yyyy', Date) + ''',''dd/MM/yyyy'')';
  end
  else begin
     sFlgEfetivado  := '0';
     sDataEfetivado := 'NULL';
  end;

    sFlgSitFuncImed :=_query.FieldByName('FLGSITFUNCIMEDIA').AsString ;
    sFlgSitPartImed := _query.FieldByName('FLGSITPARTIMEDIA').AsString;
    sFlgSitPlanoImed  := _query.FieldByName('FLGSITPLANOIMEDI').AsString ;


if Trim(qrySitFunc.FieldbyName('IDSITFUNC').AsString)='' then
    sIDSITFUNC:='0'
else
    sIDSITFUNC:=qrySitFunc.FieldbyName('IDSITFUNC').AsString;



if Trim(qrySitPart.FieldbyName('IDSITPART').AsString)='' then
    sIDSITPART:='0'
else
    sIDSITPART:=qrySitPart.FieldbyName('IDSITPART').AsString;



if Trim(qrySitPlanoPrev.FieldbyName('IDSITPLANOPREV').AsString)='' then
    sIDSITPLANOPREV:='0'
else
    sIDSITPLANOPREV:=qrySitPlanoPrev.FieldbyName('IDSITPLANOPREV').AsString;



          _query.Close;
          _query.SQL.Clear;
          _query.SQL.Add(' INSERT INTO EVENTOSPREV(IDEVENTOSPREV, DATAREGISTRO, DATAEVENTO, ' +
                         '                         IDPESSOA, IDPESSJUR, IDPLANOPREV, SEQPROPOSTA, ' +
                         '                         IDSITFUNCATUAL, IDSITPARTATUAL, IDSITPLANOATUAL, ' +
                         '                         IDSITFUNCNOVO, IDSITPARTNOVO, IDSITPLANONOVO, ' +
                         '                         IDEVENTOGERADOR, FLGSITFUNCIMED, FLGSITPARTIMED, FLGSITPLANOIMED, ' +
                         '                         DATAEFETIVADO, FLGEFETIVADO, INSCRICAONUMERO, DATAREQUERIMENTO) ' +
                         ' VALUES(' + IntToStr(iIdEventoPrev) + ',' + ' To_Date(''' + FormatDateTime('dd/mm/yyyy', Date) + ''',''dd/MM/yyyy'')' + ',' + ' To_Date(''' + Trim(dtEvento.Text) + ''',''dd/MM/yyyy'')' + ',' +
                                      qryDet.fieldbyname('idpessoa').text  + ',' + qryDet.fieldbyname('IDPESSJUR').text + ',' + qryDet.fieldbyname('IDPLANOPREV').text + ',' + qryDet.fieldbyname('SEQPROPOSTA').text + ',' +
                                      '''' + qryDet.fieldbyname('IDSITFUNC').text + '''' + ',' + qryDet.fieldbyname('IDSITPART').text + ',' + qryDet.fieldbyname('IDSITPLANOPREV').text + ',' +
                                      '''' + sIDSITFUNC + '''' + ',' + //ok
                                      sIDSITPART + ',' +   //ok
                                      sIDSITPLANOPREV + ',' + //ok
                                      sIdEventoGerador + ',' + sFlgSitFuncImed + ',' + sFlgSitPartImed + ',' + sFlgSitPlanoImed + ',' +  //sIdEventoGerador 129 0u 130 regra 015
                                      sDataEfetivado + ',' + sFlgEfetivado +','+OraNumero(qryDet.fieldbyname('InscNumero').text) + ', ' +
                                      'TO_DATE(''' + FormatDateTime('dd/mm/yyyy', dtDataInicio.Date) + ''',''DD/MM/YYYY'') )');
          try
             _query.ExecSQL;
          except
             on E:EDBEngineError do
               begin
 //                   MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;



end;

procedure TFrmCadConcederBenefInssLote.AtualizaBenefHabilita(
  _query: TwwQuery;_flgrequerimento,_NUMEROPROCESSO,_EVENTOGERADOR:string);
  var //Wylliam Leite da Silva - SOL:251334 PPM:799358
     vFlgConcessao : String; //Wylliam Leite da Silva - SOL:251334 PPM:799358   
begin

if trim(_NUMEROPROCESSO)='' then
_NUMEROPROCESSO:='0';

if trim(_EVENTOGERADOR)='' then
_EVENTOGERADOR:='0';        

           //Inicio - Wylliam Leite da Silva - SOL:251334 PPM:799358
          if _flgrequerimento = '1' then
              vFlgConcessao := '1'
          else
              vFlgConcessao := '0';
          //Fim - Wylliam Leite da Silva - SOL:251334 PPM:799358

          _query.Close;
          _query.SQL.Clear;
          //Inicio - Wylliam Leite da Silva - SOL:251334 PPM:799358
          //_query.SQL.Add(' update BENEFHABILITA set FLGCONCESSAO=0  where IDBENEFHABILITA ='+#39+qryDet.fieldbyname('IDBENEFHABILITA').text+#39);
          _query.SQL.Add(' update BENEFHABILITA set FLGCONCESSAO=' + vFlgConcessao + '  where IDBENEFHABILITA ='+#39+qryDet.fieldbyname('IDBENEFHABILITA').text+#39);
          //Fim - Wylliam Leite da Silva - SOL:251334 PPM:799358
//          _query.ExecSQL;
   try
             _query.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;



end;

procedure TFrmCadConcederBenefInssLote.GravarBfciarioTitPlan(
  _query: TwwQuery);
begin

          _query.Close;
          _query.SQL.Clear;
          _QUERY.SQL.ADD('INSERT INTO BFCIARIOTITPLAN  ' +
                         '(IDPESSJUR, ' +
                         'IDTITULAR,  ' +
                         'IDPLANOORIGEM, ' +
                         'IDPLANOPREV, ' +
                         'IDPESSOA, ' +
                         'IDBENEFICIO, ' +
                         'SEQPROPOSTA, ' +
                         'PRIORIDADE, ' +
                         'PERCENTUAL, ' +
                         'IDRESPONSAVEL) ' +
                      'VALUES  ' +
                        '('+#39+ QRYDET.FIELDBYNAME('IDPESSJUR').TEXT+#39+', '+
                            #39+QRYDET.FIELDBYNAME('IDTITULAR').TEXT+#39+',  ' +
                            #39+QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT+#39+',  ' +
                            #39+QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT+#39+',  ' +
                            #39+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+#39+',  ' +
                            #39+QRYDET.FIELDBYNAME('IDBENEFICIO').TEXT+#39+',  ' +
                            #39+QRYDET.FIELDBYNAME('SEQPROPOSTA').TEXT+#39+',  ' +
                         '0, ' +
                         '100, ' +
                         #39+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+#39+') ');


          try
             _query.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;
end;

procedure TFrmCadConcederBenefInssLote.GravarProcessoBenef(_query: TwwQuery;_EventoGerador,_NUMEROPROCESSO:string);


begin



          _query.Close;
          _query.SQL.Clear;
          _QUERY.SQL.ADD('insert into PROCESSOBENEF  ' +
          '(NUMEROPROCESSO,'+
          'IDEVENTOGERADOR,'+
          ' DTEVENTO,      '+
          ' DTDIREITO,     '+
          ' DTREGISTRO,    '+
          ' IDSITPROCESSO) '+
          ' values         '+
         '('+#39+ _NUMEROPROCESSO+#39+', '+
           #39+_EventoGerador+#39+',  ' +
           ' To_Date(''' + FormatDateTime('dd/mm/yyyy', StrToDate(QRYDET.FIELDBYNAME('DIB').TEXT)) + ''',''dd/MM/yyyy'')' +',  ' +
           ' To_Date(''' + FormatDateTime('dd/mm/yyyy', StrToDate(QRYDET.FIELDBYNAME('DIB').TEXT)) + ''',''dd/MM/yyyy'')' +',  ' +
             ' To_Date(''' + FormatDateTime('dd/mm/yyyy', date) + ''',''dd/MM/yyyy'')' +',  ' +
          ' 4)');  ////pendente de concessao.

          try
             _query.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;


end;

procedure TFrmCadConcederBenefInssLote.GravarBENEFBFCIARIO(_query: TwwQuery;
  _NUMEROPROCESSO: string);

var iIdSitBeneficio: integer ; //William Santana - SOL 218687.17129 PPM 757901
begin

//Início - William Santana - SOL 218687.17129 PPM 757901
    if (QryDet.FieldByName('FLGPAGAINSS').AsInteger = 0) then
      iIdSitBeneficio := 2
    else
     iIdSitBeneficio := 4;
//Término - William Santana - SOL 218687.17129 PPM 757901

          _query.Close;
          _query.SQL.Clear;
          _QUERY.SQL.ADD('insert into BENEFBFCIARIO ' +
          '(NUMEROPROCESSO,  ' +
          'IDPESSJUR,        ' +
          ' IDPLANOPREV,     ' +
          ' IDTITULAR,        ' +
          ' IDPESSOA,         ' +
          ' SEQPROPOSTA,      ' +
          ' IDBENEFICIO,      ' +
//          ' CODPORTFORMA,     ' +
          ' IDSITBENEFICIO,   ' +
//          ' IDDEPENDENCIA,    ' +
//          ' IDTPPAGTOBENEFIC, ' +
//          ' VALORATUAL,       ' +
          ' DATAREQUERIMENTO, ' +
//          ' DATAINICIO,       ' +
//          ' DATAFINAL,        ' +
//          ' FLGFORMAPAGTO,    ' +
//          ' VALORCALCULADO,   ' +
//          ' DATAULTREAJUSTE,  ' +
//          ' VLRCALCINSS,      ' +
//          ' VLRINFINSS,       ' +
//          ' DATAINICIOINSS,   ' +
          ' NUMPROCINSS,     ' +
//          ' DATAINICIOFUND,   ' +
//          ' VALORCOTAS,       ' +
//          ' VALORTOTAL,       ' +
          ' DATACONCESSAO,    ' +      // Xavier
//          ' FLGPROVISORIO,    ' +
//          ' PERCPROVISORIO,   ' +
//          ' PRAZOPROVISORIO,  ' +
//          ' ULTMESREAJUSTE,   ' +
//          ' ULTVALORATUALREAJ,' +
      //    ' DIBBENEFANT)      ' +
//          ' VALORBENEFANT,    ' +
//          ' VALORBINSSANT1,   ' +
//          ' VALORBINSSANT2,   ' +
//          ' VALORBINSSANT3,   ' +
//          ' FLGBENEFMIN,      ' +
//          ' VALORSRB,         ' +
//Início - William Santana - SOL 218687.17129 PPM 757901
//          ' IDPLANOORIGEM)    ' +
           ' IDPLANOORIGEM,    ' +
//Término - William Santana - SOL 218687.17129 PPM 757901
//          ' VALORNADIB,        ' +
//          ' IDPLANPREVCONTAB,  ' +
//          ' FONTEPAGADORA,     ' +
//          ' PLACONTAD,         ' +
//          ' PLACONTAC,         ' +
//Início - William Santana - SOL 218687.17129 PPM 757901
//         ' FLGPAGAINSS)       ' +
           ' FLGPAGAINSS,       ' +
           ' VALORBASE1,        ' +
           ' VALORBASE2,        ' +
           ' BENEFLEI142,       ' +
           ' TEMPOSERVICOANOS,  ' +
           ' TEMPOSERVICOMES,   ' +
           ' TEMPOSERVICODIAS,  ' +
           ' DEC)   ' +
///          ' VALORBASE1,        ' +
//          ' VALORBASE2,        ' +
//          ' VALORBASE3)        ' +
//Término - William Santana - SOL 218687.17129 PPM 757901
        'values                ' +
          '('+#39+ _NUMEROPROCESSO+#39+', '+
           #39+QRYDET.FIELDBYNAME('IDPESSJUR').TEXT+#39+',  ' +
           #39+QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT+#39+',  ' +
           #39+QRYDET.FIELDBYNAME('IDTITULAR').TEXT+#39+',  ' +
           #39+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+#39+',  ' +
           #39+QRYDET.FIELDBYNAME('SEQPROPOSTA').TEXT+#39+',  ' +
           #39+QRYDET.FIELDBYNAME('IDBENEFICIO').TEXT+#39+',  ' +
  //         ':CODPORTFORMA,     ' +
//Início - William Santana - SOL 218687.17129 PPM 757901
//           '4,   ' + ///IDSITBENEFICIO
           IntToStr(iIdSitBeneficio) +#39+',  ' +
//Término - William Santana - SOL 218687.17129 PPM 757901
 //          ':IDDEPENDENCIA,    ' +
 //           ':IDTPPAGTOBENEFIC, ' +
 //           ':VALORATUAL,       ' +
            ' To_Date(''' + FormatDateTime('dd/mm/yyyy', StrToDate(QRYDET.FIELDBYNAME('DATAREQUERIMENTO').TEXT)) + ''',''dd/MM/yyyy'')' +',  ' +
 //          ':DATAINICIO,       ' +
 //          ':DATAFINAL,        ' +
 //          ':FLGFORMAPAGTO,    ' +
 //          ':VALORCALCULADO,   ' +
 //          ':DATAULTREAJUSTE,  ' +
 //          ':VLRCALCINSS,      ' +
 //          ':VLRINFINSS,       ' +
 //          ':DATAINICIOINSS,   ' +
           #39+QRYDET.FIELDBYNAME('NUMBENEFICIO').TEXT+#39+',  ' +
  //         ':DATAINICIOFUND,   ' +
  //         ':VALORCOTAS,       ' +
  //         ':VALORTOTAL,       ' +
                       ' To_Date(''' + FormatDateTime('dd/mm/yyyy', StrToDate(QRYDET.FIELDBYNAME('DATACONCESSAO').TEXT)) + ''',''dd/MM/yyyy'')' +',  ' +  //  ':DATACONCESSAO,    ' +  Xavier
 //          ':FLGPROVISORIO,    ' +
 //          ':PERCPROVISORIO,   ' +
 //          ':PRAZOPROVISORIO,  ' +
//           ':ULTMESREAJUSTE,   ' +
//           ':ULTVALORATUALREAJ,' +
  //         ' To_Date(''' + FormatDateTime('dd/mm/yyyy', StrToDate(QRYDET.FIELDBYNAME('DIBANT').TEXT)) + ''',''dd/MM/yyyy'')' +')  ' );
  ///         ':VALORBENEFANT,    ' +
 //          ':VALORBINSSANT1,   ' +
//           ':VALORBINSSANT2,   ' +
//           ':VALORBINSSANT3,   ' +
//           ':FLGBENEFMIN,      ' +
//           ':VALORSRB,         ' +
//Início - William Santana - SOL 218687.17129 PPM 757901
//             #39+QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT+#39+')  ' );
             #39+QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT+#39+',  '+
//Término - William Santana - SOL 218687.17129 PPM 757901
//           ':VALORNADIB,       ' +
//           ':IDPLANPREVCONTAB, ' +
//           ':FONTEPAGADORA,    ' +
//           ':PLACONTAD,        ' +
//           ':PLACONTAC,        ' +
//Início - William Santana - SOL 218687.17129 PPM 757901
//             #39+'1'+#39+') ');//           ':FLGPAGAINSS') ');
             #39+QRYDET.FIELDBYNAME('FLGPAGAINSS').TEXT+#39+',  '+//           ':FLGPAGAINSS') ');
             #39+QRYDET.FIELDBYNAME('INDICEREAJUSTETETO').TEXT+#39+',  '+     //:VALORBASE1
             #39+QRYDET.FIELDBYNAME('PERCENTUALINSS').TEXT+#39+',  '+         //:VALORBASE2
             #39+QRYDET.FIELDBYNAME('BENEFLEI142').TEXT+#39+',  '+
             #39+QRYDET.FIELDBYNAME('TEMPOSERVICOANOS').TEXT+#39+',  '+
             #39+QRYDET.FIELDBYNAME('TEMPOSERVICOMES').TEXT+#39+',  '+
             #39+QRYDET.FIELDBYNAME('TEMPOSERVICODIAS').TEXT+#39+',  '+
             ' To_Date(''' + FormatDateTime('dd/mm/yyyy', StrToDate(QRYDET.FIELDBYNAME('DEC').TEXT)) + ''',''dd/MM/yyyy'')'+#39+') ');

//Término - William Santana - SOL 218687.17129 PPM 757901
//           ':VALORBASE1,       ' +
//           ':VALORBASE2,       ' +
//           ':VALORBASE3)       ' );

          try
             _query.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;

end;


procedure TFrmCadConcederBenefInssLote.DeletarBfciarioTitPlan(
  _query: TwwQuery);
begin


          _query.Close;
          _query.SQL.Clear;
          _QUERY.SQL.ADD('DELETE FROM BFCIARIOTITPLAN WHERE ' +
                         'IDPESSJUR = '+#39+ QRYDET.FIELDBYNAME('IDPESSJUR').TEXT+#39+' AND '+
                         'IDTITULAR =  '+#39+QRYDET.FIELDBYNAME('IDTITULAR').TEXT+#39+' AND  ' +
                         'IDPLANOORIGEM = '+#39+QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT+#39+'AND  ' +
                         'IDPLANOPREV = ' +#39+QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT+#39+'AND  ' +
                         'IDPESSOA = ' +   #39+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+#39+'AND  ' +
                         'IDBENEFICIO = ' +  #39+QRYDET.FIELDBYNAME('IDBENEFICIO').TEXT+#39+'AND  ' +
                         'SEQPROPOSTA = ' +  #39+QRYDET.FIELDBYNAME('SEQPROPOSTA').TEXT+#39+'AND  ' +
                         'PRIORIDADE = 0 AND ' +
                         'PERCENTUAL = 100 AND ' +
                         'IDRESPONSAVEL = '+#39+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+#39);


          try
             _query.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;

end;

procedure TFrmCadConcederBenefInssLote.DeletarBENEFBFCIARIO(_query:TwwQuery;_NUMEROPROCESSO:string);
begin

          _query.Close;
          _query.SQL.Clear;
          _QUERY.SQL.ADD('DELETE FROM BENEFBFCIARIO WHERE ' +
                        // 'NUMEROPROCESSO = '+#39+ _NUMEROPROCESSO+#39+' AND '+
                         'IDPESSJUR = '+#39+ QRYDET.FIELDBYNAME('IDPESSJUR').TEXT+#39+' AND '+
                         'IDTITULAR =  '+#39+QRYDET.FIELDBYNAME('IDTITULAR').TEXT+#39+' AND  ' +
                         'IDPLANOORIGEM = '+#39+QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT+#39+'AND  ' +
                         'IDPLANOPREV = ' +#39+QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT+#39+'AND  ' +
                         'IDPESSOA = ' +   #39+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+#39+'AND  ' +
                         'IDBENEFICIO = ' +  #39+QRYDET.FIELDBYNAME('IDBENEFICIO').TEXT+#39+'AND  ' +
                         'SEQPROPOSTA = ' +  #39+QRYDET.FIELDBYNAME('SEQPROPOSTA').TEXT+#39);

          try
             _query.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;

end;

procedure TFrmCadConcederBenefInssLote.DeletarEventoPrev(_query: TwwQuery;
  _EventoGerador: string);
begin

   _query.Close;
   _query.SQL.Clear;
   _QUERY.SQL.ADD('DELETE FROM EVENTOSPREV WHERE IDEVENTOSPREV='+_EventoGerador);
    try
             _query.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;


end;

procedure TFrmCadConcederBenefInssLote.DeletarProcessoBenef(_query: TwwQuery;
  _NUMEROPROCESSO: string);
begin

   _query.Close;
   _query.SQL.Clear;
   _QUERY.SQL.ADD('DELETE FROM PROCESSOBENEF WHERE NUMEROPROCESSO='+_NUMEROPROCESSO);
    try
             _query.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;


end;

procedure TFrmCadConcederBenefInssLote.Criar_temp();
var
  _query: TwwQuery;
begin
_query:=TwwQuery.Create(Self);
_query.DataBaseName := 'BaseDados';



TRY
_query.Close;
_query.RequestLive:=true;
_query.sql.Clear;
_query.sql.Add(' create global temporary table TEMPREL ');
_query.sql.Add('  (mesreferencia varchar2(50), ');
_query.sql.Add('  mesreembolso varchar2(50), ');
_query.sql.Add('  pagar NUMBER(1), ');
_query.sql.Add('  descontar NUMBER(1), ');
_query.sql.Add('  planocontabil varchar2(3) ) on commit preserve rows');
//_query.sql.Add('  msgerrooracle varchar2(150))on commit preserve rows ');
_query.ExecSQL;
EXCEPT
_query.Close;
_query.sql.Clear;
_query.sql.Add(' delete global temporary table TEMPREL ');
_query.ExecSQL;
Criar_temp();
end;

end;

procedure TFrmCadConcederBenefInssLote.Gravar_temp_log(_query: TwwQuery;_msgerro,_msgoracle:string);
begin

_query.Close;
_query.sql.Clear;
_query.sql.Add('insert into LOGREQUERLOTE ');
_query.sql.Add('  (  ');
_query.sql.Add('  IDBENEFHABILITA, ');
_query.sql.Add('  matricula, ');
_query.sql.Add('  nome, ');
_query.sql.Add('  msgerro , ');
_query.sql.Add('  msgerrooracle ');
_query.sql.Add('  )  ');
_query.sql.Add(' values');
_query.sql.Add('  (  ');
_query.sql.Add(' '+#39+qryDet.fieldbyname('IDBENEFHABILITA').text+#39+',');
_query.sql.Add(' '+#39+qryDet.fieldbyname('matricula').text+#39+',');
_query.sql.Add(' '+#39+qryDet.fieldbyname('nome').text+#39+',');
_query.sql.Add(' '+#39+_msgerro+#39+',');
_query.sql.Add(' '+#39+_msgoracle+#39);

_query.sql.Add('  )  ');
try
_query.ExecSQL;
except
end;

end;

procedure TFrmCadConcederBenefInssLote.FormShow(Sender: TObject);
begin
  inherited;
pnl_impressao.SendToBack;
pnl1.SendToBack;
 //Início - William Santana - SOL 251599.17194 PPM 783173
 SRubrica:= TStringList.Create;
 SRubrica.Clear;
 //Térmno - William Santana - SOL 251599.17194 PPM 783173
 //Início - William Santana - SIG 26527
 qryDet.Active := true;
 Self.Left := 10;
 Self.top := 10;
 //Término - William Santana SIG 26527
end;

procedure TFrmCadConcederBenefInssLote.DeletarHSTBENEFBFCIARIO(
  _query: TwwQuery; _NUMEROPROCESSO: string);
begin

   _query.Close;
   _query.SQL.Clear;


          _QUERY.SQL.ADD('DELETE FROM HSTBENEFBFCIARIO WHERE ' +
                        // 'NUMEROPROCESSO = '+#39+ _NUMEROPROCESSO+#39+' AND '+
                         'IDPESSJUR = '+#39+ QRYDET.FIELDBYNAME('IDPESSJUR').TEXT+#39+' AND '+
                         'IDTITULAR =  '+#39+QRYDET.FIELDBYNAME('IDTITULAR').TEXT+#39+' AND  ' +
                         'IDPLANOORIGEM = '+#39+QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT+#39+'AND  ' +
                         'IDPLANOPREV = ' +#39+QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT+#39+'AND  ' +
                         'IDPESSOA = ' +   #39+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+#39+'AND  ' +
                         'IDBENEFICIO = ' +  #39+QRYDET.FIELDBYNAME('IDBENEFICIO').TEXT+#39+'AND  ' +
                         'SEQPROPOSTA = ' +  #39+QRYDET.FIELDBYNAME('SEQPROPOSTA').TEXT+#39);


    try
             _query.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;


end;

procedure TFrmCadConcederBenefInssLote.DeletarMovbenef(_query: TwwQuery;
  _NUMEROPROCESSO: string);
begin


   _QUERY.CLOSE;
   _QUERY.SQL.CLEAR;
   _QUERY.SQL.ADD('DELETE FROM  MOVBENEF WHERE IDMOVBENEF IN (SELECT IDMOVBENEF FROM HSTBENEFBFCIARIO WHERE NUMEROPROCESSO='+_NUMEROPROCESSO+')');
    try
             _query.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;
end;

procedure TFrmCadConcederBenefInssLote.wwDBEdit10Change(Sender: TObject);
begin
  inherited;
cb_validado.Checked:=false;
end;

procedure TFrmCadConcederBenefInssLote.dtDataFinalChange(Sender: TObject);
begin
  inherited;
cb_validado.Checked:=false;
end;

procedure TFrmCadConcederBenefInssLote.qryDetBeforePost(DataSet: TDataSet);
begin
  inherited;
  qryDetDIBANT.AsString := qryDetDIBANT.AsString;

end;

procedure TFrmCadConcederBenefInssLote.bbtnConfirmarClick(Sender: TObject);
begin


If not dtmBaseDados.dbBaseDados.InTransaction Then
        dtmBaseDados.dbBaseDados.StartTransaction;

qryaux2.close;

qryaux2.SQL.Clear;
qryaux2.SQL.Add('update BENEFBFCIARIO');
qryaux2.SQL.Add('set');
qryaux2.SQL.Add('  DIBBENEFANT = '+#39+dtDataFinal.Text+#39);
qryaux2.SQL.Add('where');
qryaux2.SQL.Add('  NUMEROPROCESSO = ' + #39 + qryDet.fieldbyname('NUMEROPROCESSO').text+#39+' and'); // SOL 271037 Peterson Victor
qryaux2.SQL.Add('  IDTITULAR = '+#39+qryDet.fieldbyname('IDTITULAR').text+#39+' and');
qryaux2.SQL.Add('  IDBENEFICIO = '+#39+qryDet.fieldbyname('IDBENEFICIO').text+#39+' and');
qryaux2.SQL.Add('  IDPESSOA = '+#39+qryDet.fieldbyname('IDPESSOA').text+#39);
qryaux2.SQL.Add('  and  rownum = 1');
   try
             qryaux2.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;

 qryaux2.CLOSE;



qryaux.close;
qryaux.SQL.Clear;
qryaux.SQL.Add('SELECT *');
qryaux.SQL.Add('          FROM (SELECT NUMPROCINSS, IDRUBRICA, MESREFERENCIA, SEQUENCIAL, MESCOBRANCA, RUBRICAINSS,');
qryaux.SQL.Add('                       IDPESSOA, IDBENEFICIO, RMREAJ AS RMI');
qryaux.SQL.Add('                  FROM DETCONCINSS');
qryaux.SQL.Add('                 WHERE DTINICIOCRED = ''01'' || SUBSTR(DTINICIOCRED, 4, 7)');
qryaux.SQL.Add('                   AND DTFIMCRED =');
qryaux.SQL.Add('                       TO_DATE(''01/'' ||');
qryaux.SQL.Add('                               DECODE(SUBSTR(DTINICIOCRED, 4, 2),');
qryaux.SQL.Add('                                      12,');
qryaux.SQL.Add('                                      ''01'',');
qryaux.SQL.Add('                                      SUBSTR(DTINICIOCRED, 4, 2) + 1) || ''/'' ||');
qryaux.SQL.Add('                               DECODE(SUBSTR(DTINICIOCRED, 4, 2),');
qryaux.SQL.Add('                                      12,');
qryaux.SQL.Add('                                      SUBSTR(DTINICIOCRED, 7, 4) + 1,');
qryaux.SQL.Add('                                      SUBSTR(DTINICIOCRED, 7, 4))) - 1');
qryaux.SQL.Add('                 ORDER BY IDPESSOA, DTINICIOCRED) TEMP');
qryaux.SQL.Add('         WHERE IDPESSOA ='+#39+qryDet.fieldbyname('IDPESSOA').text+#39);
qryaux.SQL.Add('           AND IDBENEFICIO ='+#39+qryDet.fieldbyname('IDBENEFICIO').text+#39);
qryaux.SQL.Add('           AND ROWNUM = 1');
   try
             qryaux.open;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;




qryaux2.close;
qryaux2.SQL.Clear;
qryaux2.SQL.Add('UPDATE DETCONCINSS SET RMREAJ ='+#39+wwDBEdit10.text+#39);
qryaux2.SQL.Add('  WHERE');
qryaux2.SQL.Add('  NUMPROCINSS ='+#39+qryaux.FieldByName('NUMPROCINSS').text+#39);
qryaux2.SQL.Add('AND IDRUBRICA='+#39+qryaux.FieldByName('IDRUBRICA').text+#39);
qryaux2.SQL.Add('AND MESREFERENCIA='+#39+qryaux.FieldByName('MESREFERENCIA').text+#39);
qryaux2.SQL.Add('AND SEQUENCIAL='+#39+qryaux.FieldByName('SEQUENCIAL').text+#39);
qryaux2.SQL.Add('AND MESCOBRANCA='+#39+qryaux.FieldByName('MESCOBRANCA').text+#39);
qryaux2.SQL.Add('AND RMREAJ ='+#39+qryaux.FieldByName('RMI').text+#39);
qryaux2.SQL.Add('AND RUBRICAINSS='+#39+qryaux.FieldByName('RUBRICAINSS').text+#39);
   try
             qryaux2.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;

 qryaux2.CLOSE;
 qryaux.CLOSE;



qryaux2.close;
qryaux2.SQL.Clear;
qryaux2.SQL.Add('update pessoafisica');
qryaux2.SQL.Add('set');
if db_grid_irrf.ItemIndex = 0 then
   qryaux2.SQL.Add('  flgisentoirrf = 1')///ISENTO
else
   qryaux2.SQL.Add('  flgisentoirrf = 0');
qryaux2.SQL.Add('where');
qryaux2.SQL.Add('  IDPESSOA = '+#39+qryDet.fieldbyname('IDPESSOA').text+#39);

   try
             qryaux2.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;

 qryaux2.CLOSE;


     if dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.Commit;

  qry.Close;
  qry.Open;
  inherited;
end;

procedure TFrmCadConcederBenefInssLote.Button2Click(Sender: TObject);
begin
//  inherited;
buscarequerimentos('N','');
end;

procedure TFrmCadConcederBenefInssLote.qryDetAfterOpen(DataSet: TDataSet);
begin
//  inherited;
lbl_listados.caption:=inttostr(qryDet.recordcount)+' Listados';    
end;

procedure TFrmCadConcederBenefInssLote.AtualizaBenefbfciario(
  _query: TwwQuery; _idsitbeneficio: string);
begin



          _query.Close;
          _query.SQL.Clear;
          _query.SQL.Add(' update benefbfciario set '+
                         ' dataconcessao = DECODE('+#39+_idsitbeneficio+#39+',4,null,SYSDATE), '+ // SOL 218688 Kintana 2051172
                         ' idsitbeneficio='+#39+_idsitbeneficio+#39+' where '+
                         'IDPESSJUR = '+#39+ QRYDET.FIELDBYNAME('IDPESSJUR').TEXT+#39+' AND '+
                         'IDTITULAR =  '+#39+QRYDET.FIELDBYNAME('IDTITULAR').TEXT+#39+' AND  ' +
                         'IDPLANOORIGEM = '+#39+QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT+#39+' AND  ' +
                         'IDPLANOPREV = ' +#39+QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT+#39+' AND  ' +
                         'IDPESSOA = ' +   #39+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+#39+' AND  ' +
                         'IDBENEFICIO = ' +  #39+QRYDET.FIELDBYNAME('IDBENEFICIO').TEXT+#39+' AND  ' +
                         'SEQPROPOSTA = ' +  #39+QRYDET.FIELDBYNAME('SEQPROPOSTA').TEXT+#39 + ' AND  ' +
                         'NUMEROPROCESSO = ' + #39 +qryDet.fieldbyname('NUMEROPROCESSO').text + #39 ); // SOL 271037 Peterson Victor
//         _query.ExecSQL;
   try
             _query.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;


    _query.Close;
          _query.SQL.Clear;
          _query.SQL.Add(' update processobenef set idsitprocesso='+#39+_idsitbeneficio+#39+'  where '+
                         'NUMEROPROCESSO = '+#39+ QRYDET.FIELDBYNAME('NUMEROPROCESSO').TEXT+#39);
//          _query.ExecSQL;
   try
             _query.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;



end;

procedure TFrmCadConcederBenefInssLote.bbtnSelTudoClick(Sender: TObject);
begin
  inherited;
//buscarequerimentos('S');
if not qryDet.isempty then
   begin
   qryDet.First;
   while not qryDet.eof do
     begin
     qryDet.edit;
     qryDetSELECIONADO.text:='S';
     qryDet.post;
     qryDet.Next;
     end;
    end;

end;

procedure TFrmCadConcederBenefInssLote.bbtnInverteClick(Sender: TObject);
begin
  inherited;
//buscarequerimentos('N');

if not qryDet.isempty then
   begin
   qryDet.First;
   while not qryDet.eof do
     begin
     qryDet.edit;
     qryDetSELECIONADO.text:='N';
     qryDet.post;
     qryDet.Next;
     end;
    end;


end;

procedure TFrmCadConcederBenefInssLote.ppDetailBand1BeforePrint(
  Sender: TObject);
var
  totalhst, totalrem , totalinss:double;
  sAreaderFile: String;
  RegPdf: TRegistry;
  local:string;
 _query:TwwQuery;
  iIdConta : Integer;   //William Santana - SIG 41240
begin
  inherited;

   imprimiuRodapteGrupoRelatorio := False;//Helio - SOL 207871 / KTN 2014291


   QRYAUX.CLOSE;
   QRYAUX.SQL.CLEAR;
   //QRYAUX.SQL.APPEND('SELECT CONTACORRENTE FROM CONTABANCARIA ');              //William Santana - SIG 41240
   QRYAUX.SQL.APPEND('SELECT IDCBANCARIA, CONTACORRENTE FROM CONTABANCARIA ');   //William Santana - SIG 41240
   QRYAUX.SQL.APPEND('WHERE');
   QRYAUX.SQL.APPEND('TIPOCONTA=2 AND ');
   QRYAUX.SQL.APPEND(' IDPESSOA = ('+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+')');
   QRYAUX.OPEN;

   lbl_conta.caption:=QRYAUX.fieldbyname('contacorrente').text;
   iIdConta := QRYAUX.fieldbyname('IDCBANCARIA').AsInteger;                      //William Santana - SIG 41240

    QRYAUX.CLOSE;
    QRYAUX.SQL.CLEAR;
    QRYAUX.SQL.Add('SELECT C.IDCBANCARIA,');
    QRYAUX.SQL.Add('       C.IDPESSOA,');
    QRYAUX.SQL.Add('       C.IDAGENCIA,');
    QRYAUX.SQL.Add('       C.CONTACORRENTE,');
    QRYAUX.SQL.Add('       C.FLGCONTAPREF,');
    QRYAUX.SQL.Add('       C.FLGCONTAINATIVA,');
    QRYAUX.SQL.Add('       C.TIPOCONTA,');
    QRYAUX.SQL.Add('       A.NUMAGENCIA,');
    QRYAUX.SQL.Add('       A.IDBANCO,');
    QRYAUX.SQL.Add('       PB.NOME           AS NOMEBANCO,');
    QRYAUX.SQL.Add('       B.NUMBANCO,');
    QRYAUX.SQL.Add('       PA.NOME           AS NOMEAGENCIA');
    QRYAUX.SQL.Add('  FROM PESSOA PB, BANCO B, AGENCIABANCARIA A, CONTABANCARIA C, PESSOA PA');
    QRYAUX.SQL.Add(' WHERE (C.IDPESSOA = ('+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+'))');
    //QRYAUX.SQL.Add('   AND (C.CONTACORRENTE =  ('+lbl_conta.caption+'))');     //William Santana - SIG 41240
    QRYAUX.SQL.Add('   AND (C.IDCBANCARIA =  ('+intToStr(iIdConta)+'))');        //William Santana - SIG 41240
    QRYAUX.SQL.Add('   AND (C.IDAGENCIA = A.IDPESSOA)');
    QRYAUX.SQL.Add('   AND (A.IDBANCO = B.IDPESSOA)');
    QRYAUX.SQL.Add('   AND (PA.IDPESSOA = A.IDPESSOA)');
    QRYAUX.SQL.Add('   AND (B.IDPESSOA = PB.IDPESSOA)');
    QRYAUX.OPEN;

   lbl_banco.caption:= QRYAUX.fieldbyname('NOMEBANCO').text;
   lbl_agencia.caption:=QRYAUX.fieldbyname('NUMAGENCIA').text;


   QRYAUX.CLOSE;
   QRYAUX.SQL.CLEAR;
   //QRYAUX.SQL.APPEND('SELECT CONTACORRENTE FROM CONTABANCARIA ');  //William Santana - SIG 41240
   QRYAUX.SQL.APPEND('SELECT IDCBANCARIA, CONTACORRENTE FROM CONTABANCARIA ');      //William Santana - SIG 41240
   QRYAUX.SQL.APPEND('WHERE');
   QRYAUX.SQL.APPEND('FLGCONTAPREF=1 AND ');
   QRYAUX.SQL.APPEND(' IDPESSOA = ('+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+')');
   QRYAUX.OPEN;

   lbl_conta2.caption:=QRYAUX.fieldbyname('contacorrente').text;
   iIdConta := QRYAUX.fieldbyname('IDCBANCARIA').AsInteger;       //William Santana - SIG 41240


    QRYAUX.CLOSE;
    QRYAUX.SQL.CLEAR;
    QRYAUX.SQL.Add('SELECT C.IDCBANCARIA,');
    QRYAUX.SQL.Add('       C.IDPESSOA,');
    QRYAUX.SQL.Add('       C.IDAGENCIA,');
    QRYAUX.SQL.Add('       C.CONTACORRENTE,');
    QRYAUX.SQL.Add('       C.FLGCONTAPREF,');
    QRYAUX.SQL.Add('       C.FLGCONTAINATIVA,');
    QRYAUX.SQL.Add('       C.TIPOCONTA,');
    QRYAUX.SQL.Add('       A.NUMAGENCIA,');
    QRYAUX.SQL.Add('       A.IDBANCO,');
    QRYAUX.SQL.Add('       PB.NOME           AS NOMEBANCO,');
    QRYAUX.SQL.Add('       B.NUMBANCO,');
    QRYAUX.SQL.Add('       PA.NOME           AS NOMEAGENCIA');
    QRYAUX.SQL.Add('  FROM PESSOA PB, BANCO B, AGENCIABANCARIA A, CONTABANCARIA C, PESSOA PA');
    QRYAUX.SQL.Add(' WHERE (C.IDPESSOA = ('+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+'))');
    //QRYAUX.SQL.Add('   AND (C.CONTACORRENTE =  ('+lbl_conta2.caption+'))');    //William Santana - SIG 41240
    QRYAUX.SQL.Add('   AND (C.IDCBANCARIA =  ('+intToStr(iIdConta)+'))');        //William Santana - SIG 41240
    QRYAUX.SQL.Add('   AND (C.IDAGENCIA = A.IDPESSOA)');
    QRYAUX.SQL.Add('   AND (A.IDBANCO = B.IDPESSOA)');
    QRYAUX.SQL.Add('   AND (PA.IDPESSOA = A.IDPESSOA)');
    QRYAUX.SQL.Add('   AND (B.IDPESSOA = PB.IDPESSOA)');
    QRYAUX.OPEN;

   lbl_banco2.caption:= QRYAUX.fieldbyname('NOMEBANCO').text;
   lbl_agencia2.caption:=QRYAUX.fieldbyname('NUMAGENCIA').text;


   // edilaine - SOL 207871 / KTN 2014291 - inicio
   lbl_valoratualbeneficio.caption:= FormatFloat('#,##0.00', QRYDET.FIELDBYNAME('VALORATUAL').AsCurrency); // Peterson victor SOL 271037 PPM 1350100
   lbl_valorbeneficio.caption     := FormatFloat('#,##0.00', QRYDET.FIELDBYNAME('VALORATUAL').AsCurrency); // Peterson victor SOL 271037 PPM 1350100
   // edilaine - SOL 207871 / KTN 2014291 - fim

//Início - William Santana - SOL 249376.17130 PPM 757902
//   QRYAUX.CLOSE;
//   QRYAUX.SQL.CLEAR;
//   QRYAUX.SQL.APPEND('SELECT TEMPOSERVTOTAL,TEMPOSERVTOTMES,TEMPOSERVTOTDIA FROM ELEGPATRO ');
//   QRYAUX.SQL.APPEND('WHERE');
//   QRYAUX.SQL.APPEND(' MATRICULA = '+#39+QRYDET.FIELDBYNAME('MATRICULA').TEXT+#39);
//   QRYAUX.OPEN;                                                  
//
//   // edilaine - SOL 207871 / KTN 2014291 - inicio
//   lbl_anos.Caption := iff(QRYAUX.fieldbyname('TEMPOSERVTOTAL').text  <> EmptyStr, QRYAUX.fieldbyname('TEMPOSERVTOTAL').text,  '____') + ' Anos';
//   lbl_meses.Caption:= iff(QRYAUX.fieldbyname('TEMPOSERVTOTMES').text <> EmptyStr, QRYAUX.fieldbyname('TEMPOSERVTOTMES').text, '____') + ' Meses';
//   lbl_dias.Caption := iff(QRYAUX.fieldbyname('TEMPOSERVTOTdia').text <> EmptyStr, QRYAUX.fieldbyname('TEMPOSERVTOTdia').text, '____') + ' Dias';
//   // edilaine - SOL 207871 / KTN 2014291 - fim

   lbl_anos.Caption := iff(qrydet.fieldbyname('TEMPOSERVICOANOS').text <> EmptyStr, qrydet.fieldbyname('TEMPOSERVICOANOS').text,  '____') + ' Anos';
   lbl_meses.Caption:= iff(qrydet.fieldbyname('TEMPOSERVICOMES').text <> EmptyStr, qrydet.fieldbyname('TEMPOSERVICOMES').text, '____') + ' Meses';
   lbl_dias.Caption := iff(qrydet.fieldbyname('TEMPOSERVICODIAS').text <> EmptyStr, qrydet.fieldbyname('TEMPOSERVICODIAS').text, '____') + ' Dias';

  if (qrydet.fieldbyname('FLGPAGAINSS_SN').text = 'Sim') then
  begin
    plblDEC.Visible := false;
    lbl_DEC.Visible := false;
  end
  else
  begin
    plblDEC.Visible := true;
    lbl_DEC.Visible := true;
    lbl_DEC.Caption :=  qrydet.fieldbyname('DEC').text;  
  end;

  lbl_INDICEREAJUSTE.Caption :=  qrydet.fieldbyname('INDICEREAJUSTETETO').text;
  lbl_PercINSS.Caption       :=  qrydet.fieldbyname('PERCENTUALINSS').text;
  lbl_FlgPagaInss.Caption    :=  qrydet.fieldbyname('FLGPAGAINSS_SN').text;
  lbl_BENEFLEI142.Caption    :=  qrydet.fieldbyname('BENEFLEI142_SN').text;


//Término - William Santana - SOL 249376.17130 PPM 757902

   qryaux.Active:=false;
   qryaux.SQL.Clear;
   qryaux.sql.Add('SELECT msgerro FROM LOGREQUERLOTE');
   qryaux.sql.Add(' WHERE IDBENEFHABILITA='+#39+qrydet.FieldByName('IDBENEFHABILITA').AsString+#39);
   qryaux.OPEN;


   lbl_msgimpeditiva.CAPTION:=qryaux.FieldByName('msgerro').AsString;
   qryaux.Active:=false;

///2

totalhst:=0;
totalrem:=0;
totalinss:=0;
_query:=TwwQuery.Create(Self);
_query.DataBaseName := 'BaseDados';
_query.Active:=false;
_query.Sql.Clear;

qryDetalhe.Active:=True;
while not qryDetalhe.eof do
   qryDetalhe.delete;

while not qryDetalhe2.eof do
   qryDetalhe2.delete;



////////----


qryaux2.Active:=false;
qryaux2.SQL.clear;
qryaux2.SQL.add('SELECT * FROM HSTBENEFBFCIARIO WHERE ' +
               'IDPESSJUR = '+#39+ QRYDET.FIELDBYNAME('IDPESSJUR').TEXT+#39+' AND '+
                         'IDTITULAR =  '+#39+QRYDET.FIELDBYNAME('IDTITULAR').TEXT+#39+' AND  ' +
                         'IDPLANOORIGEM = '+#39+QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT+#39+' AND  ' +
                         'IDPLANOPREV = ' +#39+QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT+#39+' AND  ' +
                         'IDPESSOA = ' +   #39+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+#39+' AND  ' +
                         'IDBENEFICIO = ' +  #39+QRYDET.FIELDBYNAME('IDBENEFICIO').TEXT+#39+' AND  ' +
                         'SEQPROPOSTA = ' +  #39+QRYDET.FIELDBYNAME('SEQPROPOSTA').TEXT+#39+ ' AND  ' +
                         'NUMEROPROCESSO = ' + qryDet.FieldByName('NumeroProcesso').AsString + // Peterson victor SOL 271037 PPM 1350100
                         'ORDER BY  MESREFERENCIA ');
qryaux2.open;
qryaux2.First;
while not qryaux2.eof do
    begin


   qryDetalhe.Insert;
   qryDetalhemesano.text:=qryaux2.fieldbyname('MESREFERENCIA').text;
   if copy(qryaux2.fieldbyname('MESREFERENCIA').text,6,2)='13'then
      qryDetalhemesreferencia.text:='Abono Anual/'+copy(qryaux2.fieldbyname('MESREFERENCIA').text,1,4)
   else
      if qryaux2.fieldbyname('MESREFERENCIA').text<>'' then
      qryDetalhemesreferencia.text:=RetornaNomeMes(strtoint(copy(qryaux2.fieldbyname('MESREFERENCIA').text,6,2)))+'/'+copy(qryaux2.fieldbyname('MESREFERENCIA').text,1,4);

   if copy(qryaux2.fieldbyname('MESCOMPREEM').text,6,2)='13'then
      qryDetalhemesreembolso.text:='Abono Anual/'+copy(qryaux2.fieldbyname('MESCOMPREEM').text,1,4)
   else
      if qryaux2.fieldbyname('MESCOMPREEM').text<>'' then
         qryDetalhemesreembolso.text:=RetornaNomeMes(strtoint(copy(qryaux2.fieldbyname('MESCOMPREEM').text,6,2)))+'/'+copy(qryaux2.fieldbyname('MESCOMPREEM').text,1,4);

   if qryaux2.fieldbyname('FLGDEVOLUCAO').value=1 then
      qryDetalhedescontar.Value:=qryaux2.fieldbyname('valorprev').Value
   else
      qryDetalhepagar.value:=qryaux2.fieldbyname('valorprev').Value;

//   qryDetalhedescontar.Value:=

   _query.active:=False;
   _query.SQL.Clear;
   //edilaine - SIG55933 - inicio
   if qryaux2.fieldbyname('IDPERFILINVEST').AsString = '' then
      _query.SQL.Add('SELECT NOME FROM PLANPREVCONTABIL WHERE IDPLANOPREV = '+#39+QRYDET.fieldbyname('IDPLANPREVCONTAB').text+#39)
   else
   begin
      _query.SQL.Add('SELECT PC.NOME FROM PLANPREVCONTABIL PC ');
      _query.SQL.Add('  JOIN PERFILINVEST PI ON PI.IDPLANPREVCONTAB = PC.IDPLANOPREV');
      _query.SQL.Add(' WHERE PI.IDPERFILINVEST = '+qryaux2.fieldbyname('IDPERFILINVEST').AsString);
   end;
   //edilaine - SIG55933 - fim
   _query.active:=True;

   qryDetalheplanocontabil.Text:=_query.fieldbyname('nome').text;
   qryDetalhe.Post;


   qryaux.close;
   qryaux.SQL.Clear;
   qryaux.SQL.Add('select mesreferencia,datapagamento,flgincluimesconc from ctrlinterface');
   qryaux.SQL.Add('where idlote = '+#39+qryaux2.fieldbyname('idlote').text+#39);
   qryaux.open;
//   if  (qryaux2.fieldbyname('MESREFERENCIA').text<>qryaux.fieldbyname('mesreferencia').text) and (strtoint(copy(qryaux2.fieldbyname('MESREFERENCIA').text,6,2))<>13) then
 //      totalhst:=totalhst+qryaux2.fieldbyname('valorprev').value;
//       totalrem:=totalrem+qryaux2.fieldbyname('valorprev').value;

   if qryaux2.fieldbyname('FLGDEVOLUCAO').value=1 then
     begin
     totalhst:=totalhst-qryaux2.fieldbyname('valorprev').value;
     totalrem:=totalrem-qryaux2.fieldbyname('valorprev').value;
     end
   else
     begin
     totalhst:=totalhst+qryaux2.fieldbyname('valorprev').value;
     totalrem:=totalrem+qryaux2.fieldbyname('valorprev').value;
     end;



   qryaux2.next;
   end;
qryaux2.First;




qryDetalhe2.Active:=True;

RemoveDuplicates(SRubrica);//206134
qryaux2.Active:=false;
qryaux2.SQL.clear;
qryaux2.SQL.Append('SELECT * FROM RUBRICAINDIV WHERE IDPESSOA='+#39+qryDet.fieldbyname('IDPESSOA').text+#39);
//206134
try
  if SRubrica.Count>0 then
     qryaux2.SQL.Append(' AND IDRUBRICA in( '+SRubrica.CommaText+')');
except
end;
//206134
qryaux2.open;
qryaux2.First;
while not qryaux2.eof do
   begin

   _query.active:=False;
   _query.SQL.Clear;
   _query.SQL.Add('SELECT FLGDESCONTO FROM PROVDESC WHERE IDPROVENTO = '+#39+qryaux2.fieldbyname('IDRUBRICA').text+#39);
   _query.active:=True;



   qryDetalhe2.Insert;
   if copy(qryaux2.fieldbyname('ANOMESREF').text,6,2)='13'then
     qryDetalhe2mesreferencia.text:='Abono Anual/'+copy(qryaux2.fieldbyname('ANOMESREF').text,1,4)
   else
     if qryaux2.fieldbyname('ANOMESREF').text<>'' then
     qryDetalhe2mesreferencia.text:=RetornaNomeMes(strtoint(copy(qryaux2.fieldbyname('ANOMESREF').text,6,2)))+'/'+copy(qryaux2.fieldbyname('ANOMESREF').text,1,4);

   if copy(qryaux2.fieldbyname('MESCOMPREEM').text,6,2)='13'then
      qryDetalhe2mesreembolso.text:='Abono Anual/'+copy(qryaux2.fieldbyname('MESCOMPREEM').text,1,4)
   else
        if qryaux2.fieldbyname('MESCOMPREEM').text<>'' then
     qryDetalhe2mesreembolso.text:=RetornaNomeMes(strtoint(copy(qryaux2.fieldbyname('MESCOMPREEM').text,6,2)))+'/'+copy(qryaux2.fieldbyname('MESCOMPREEM').text,1,4);
     
  if _query.fieldbyname('FLGDESCONTO').value=1 then
     qryDetalhe2descontar.Value:=qryaux2.fieldbyname('VALORRUBRICA').Value
   else
     qryDetalhe2pagar.value:=qryaux2.fieldbyname('VALORRUBRICA').Value;

   if _query.fieldbyname('FLGDESCONTO').value=1 then
      begin
      totalrem:=totalrem-qryaux2.fieldbyname('VALORRUBRICA').value;
      totalinss:=totalinss-qryaux2.fieldbyname('VALORRUBRICA').value;
      end
   else
      begin
      totalrem:=totalrem+qryaux2.fieldbyname('VALORRUBRICA').value;
      totalinss:=totalinss+qryaux2.fieldbyname('VALORRUBRICA').value;
      end;     

   _query.active:=False;
   _query.SQL.Clear;
   _query.SQL.Add('SELECT NOME FROM PLANPREVCONTABIL WHERE IDPLANOPREV = '+#39+qryaux2.fieldbyname('IDPLANOCONTABIL').Text+#39);
   _query.active:=True;

   qryDetalhe2planocontabil.Text:=_query.fieldbyname('NOME').Text;
   qryDetalhe2.Post;


//
//   totalrem:=totalrem+qryaux2.fieldbyname('VALORRUBRICA').value;
//   totalinss:=totalinss+qryaux2.fieldbyname('VALORRUBRICA').value;





   qryaux2.Next;
   end;

// edilaine - SOL 207871 / KTN 2014291 - inicio
lbl_valortotalhis.caption   := FormatFloat('#,##0.00', totalhst);
lbl_valortotalinss.caption  := FormatFloat('#,##0.00', totalinss);
lbl_valortotalgeral.caption := FormatFloat('#,##0.00', totalhst+totalinss);
// edilaine - SOL 207871 / KTN 2014291 - fim

qryDetalhe2.First;
_query.active:=False;
_query.Destroy;

qryaux.close;
///aqui detalhe 2


///2



end;

procedure TFrmCadConcederBenefInssLote.GravarHSTBENEFBFCIARIO(
  _query: TwwQuery;_Tipo,_idmotivo,_flgtiporegistro,_SEQbeneficio,_valorcalculado,_datapagamento,_sidmovbenef,_flgincluimesconc,_mesreferencia,_mesreflote:string);
var
 sMsgErro,sDtDIBAnterior,sValorFinal2:string;

 rValorReal,rValorTotal,dValorSRBRetorno:Double;
  bReajustou,bErro    : Boolean;
begin


_query.Close;
_query.sql.Clear;
_query.sql.Add('insert into HSTBENEFBFCIARIO ');
_query.sql.Add('  (  ');
_query.sql.Add('  IDTITULAR, ');
_query.sql.Add('  IDPESSJUR, ');
_query.sql.Add('  IDPLANOPREV, ');
_query.sql.Add('  IDBENEFICIO , ');
_query.sql.Add('  IDMOTIVO, ');
_query.sql.Add('  IDPESSOA, ');
_query.sql.Add('  NUMEROPROCESSO, ');
_query.sql.Add('  MES, ');
_query.sql.Add('  SEQBENEFICIO, ');
//_query.sql.Add('  SEQPROPOSTA, ');
_query.sql.Add('  IDLOTE, ');
_query.sql.Add('  VALORPREV, ');
_query.sql.Add('  DATAPAGAMENTO, ');
_query.sql.Add('  CODPORTFORMA, ');
_query.sql.Add('  VALORCALCULADO, ');
_query.sql.Add('  FLGENVIADO, ');
_query.sql.Add('  MESREFERENCIA, ');
_query.sql.Add('  FLGCONCESSAO, ');
_query.sql.Add('  FLGDEVOLUCAO, ');
_query.sql.Add('  VALORTOTAL, ');
_query.sql.Add('  FONTEPAGADORA, ');
_query.sql.Add('  VALORINTEGRAL, ');
_query.sql.Add('  IDPLANOORIGEM, ');
_query.sql.Add('  IDTITBENEF, ');
//_query.sql.Add('  IDSEQINTERNOFB, ');
_query.sql.Add('  IDMOVBENEF, ');
_query.sql.Add('  PERCENTUAL, ');
_query.sql.Add('  FLGTIPOREGISTRO, ');
_query.sql.Add('  MESCOMPREEM ');
_query.sql.Add('  , IDPERFILINVEST ');    //edilaine - SIG55933
_query.sql.Add('  )  ');
_query.sql.Add(' values');
_query.sql.Add('  (  ');

_query.sql.Add(' '+#39+qryDet.fieldbyname('IDTITULAR').text+#39+',');
_query.sql.Add(' '+#39+qryDet.fieldbyname('IDPESSJUR').text+#39+',');
_query.sql.Add(' '+#39+qryDet.fieldbyname('IDPLANOPREV').text+#39+',');
_query.sql.Add(' '+#39+qryDet.fieldbyname('IDBENEFICIO').text+#39+',');
_query.sql.Add(' '+#39+_idmotivo+#39+',');/// RN09
_query.sql.Add(' '+#39+qryDet.fieldbyname('IDPESSOA').text+#39+',');
_query.sql.Add(' '+#39+qryDet.fieldbyname('NUMEROPROCESSO').text+#39+',');
//_query.sql.Add(' '+#39+QRYDETCONCINSS.FIELDBYNAME('MESCOBRANCA').TEXT+#39+',');///_mesreflote
_query.sql.Add(' '+#39+_mesreflote+#39+',');
_query.sql.Add(' '+#39+_SEQbeneficio+#39+',');
_query.sql.Add(' '+#39+INTTOSTR(iIdLoteConcessao)+#39+',');
//if _flgincluimesconc = '1' then
_query.sql.Add(' '+#39+ClienteNumero(_valorcalculado)+#39+',');
//_query.sql.Add(' '+#39+qryDet.fieldbyname('rmi').text+#39+',')
//else
//_query.sql.Add(' '+#39+'0'+#39+',');

_query.sql.Add(' '+#39+_datapagamento+#39+',');

qryAux3.active:=false;
qryAux3.sql.clear;
qryAux3.sql.append(' select CODPORTFORMA from benefplanprev where idplanoprev='+#39+qryDet.fieldbyname('idplanoprev').text+#39);
qryAux3.sql.append(' and  idbeneficio='+#39+qryDet.fieldbyname('idbeneficio').text+#39);
qryAux3.open;
_query.sql.Add(' '+#39+qryAux3.fieldbyname('CODPORTFORMA').text+#39+',');
qryAux3.close;




_query.sql.Add(' '+#39+ClienteNumero(_valorcalculado)+#39+',');///rn002
//Início - William Santana - SOL 218687.17129 KIN 2055744
if (qryDet.fieldbyname('FLGPAGAINSS').AsINteger = 0) then 
_query.sql.Add(' '+#39+'8'+#39+',') //FLGENVIADO
else
//Termino - William Santana - SOL 218687.17129 KIN 2055744
_query.sql.Add(' '+#39+'0'+#39+',');//FLGENVIADO
if _Tipo='B' then
_query.sql.Add(' '+#39+_mesreferencia+#39+',')///feito
//_query.sql.Add(' '+#39+QRYDETCONCINSS.FIELDBYNAME('MESREFERENCIA').TEXT+#39+',')

else
if (_Tipo='A') or (_Tipo='T') then
   _query.sql.Add(' '+#39+copy(QRYDETCONCINSS.FIELDBYNAME('MESREFERENCIA').TEXT,1,5)+'13'+#39+',')
else
//_query.sql.Add(' '+#39+QRYDETCONCINSS.FIELDBYNAME('MESREFERENCIA').TEXT+#39+',');
_query.sql.Add(' '+#39+_mesreferencia+#39+',');
_query.sql.Add(' '+#39+'1'+#39+',');//FLGCONCESSAO


qryAux3.active:=false;
qryAux3.sql.clear;
qryAux3.sql.append(' select flgdesconto from provdesc where');
qryAux3.sql.append('  idprovento ='+#39+qryRubricaxInss.FIELDBYNAME('idrubrica').TEXT+#39);
qryAux3.open;

_query.sql.Add(' '+#39+qryAux3.fieldbyname('flgdesconto').text+#39+',');///ok
qryAux3.CLOSE;
_query.sql.Add(' '+#39+QRYDETCONCINSS.fieldbyname('RMREAJ').text+#39+',');///feito
_query.sql.Add(' '+#39+'2'+#39+',');///fonte pagadora 2
_query.sql.Add(' '+#39+QRYDETCONCINSS.fieldbyname('RMREAJ').text+#39+',');///feito
_query.sql.Add(' '+#39+qryDet.fieldbyname('IDPLANOPREV').text+#39+','); //IDPLANOORIGEM
_query.sql.Add(' '+#39+qryDet.fieldbyname('IDTITULAR').text+#39+',');//IDTITBENEF
//_query.sql.Add(' '+#39+qryDet.fieldbyname('IDSEQINTERNOFB').text+#39+',');//VER COMO FAZER
_query.sql.Add(' '+#39+_sidmovbenef+#39+',');//feito
_query.sql.Add(' '+#39+'100'+#39+',');//regra requerer
_query.sql.Add(' '+#39+_flgtiporegistro+#39+',');//feito RN08
_query.sql.Add(' '+#39+QRYDETCONCINSS.fieldbyname('MESCOBRANCA').text+#39);//feito

_query.sql.Add(' , '+#39+qryDet.fieldbyname('IDPERFILINVEST').text+#39);    //edilaine - SIG55933

_query.sql.Add('  )  ');
//_query.ExecSQL;
   try
             _query.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;


IF rValorTotal<>0 THEN
//strtofloat(OraNumero((_valorcalculado)))
   BEGIN


   qryaux2.close;
    qryaux2.SQL.Clear;
    qryaux2.SQL.Add('update BENEFBFCIARIO');
    qryaux2.SQL.Add('set');
//    qryaux2.SQL.Add('  idsitbeneficio = 1, ');
    //qryaux2.SQL.Add('  idsitprocesso = 1, ');
   qryaux2.SQL.Add('  DATAULTREAJUSTE ='+'To_Date(''' + FormatDateTime('dd/mm/yyyy', Date) + ''',''dd/MM/yyyy'')');

    qryaux2.SQL.Add('where');
    qryaux2.SQL.Add('  NUMEROPROCESSO = ' + #39 + qryDet.fieldbyname('NUMEROPROCESSO').text+#39+' and'); // SOL 271037 Peterson Victor
    qryaux2.SQL.Add('  IDTITULAR = '+#39+qryDet.fieldbyname('IDTITULAR').text+#39+' and');
    qryaux2.SQL.Add('  IDBENEFICIO = '+#39+qryDet.fieldbyname('IDBENEFICIO').text+#39+' and');
    qryaux2.SQL.Add('  IDPESSOA = '+#39+qryDet.fieldbyname('IDPESSOA').text+#39);
    qryaux2.SQL.Add('  and  rownum = 1');
       try
                 qryaux2.ExecSQL;
              except
                 on E:EDBEngineError do
                   begin
    //                    MostrarErro(E);
                        Gravar_temp_log(param,'',string(E.message));
                        Exit;
                   end;
              end;

     qryaux2.CLOSE;

   end;


end;

procedure TFrmCadConcederBenefInssLote.GravarRubricaIndiv(
  _query: TwwQuery;_idmotivo,_mesreferencia,_seq,_mesreflote,_sidmovbenef:string);//206134
var
  ultdia:double;
begin
SRubrica.add(IDPROVENTO);//206134
ultdia:=0;
_query.Close;
_query.sql.Clear;
_query.sql.Add('insert into RUBRICAINDIV ');
_query.sql.Add('  (  ');
_query.sql.Add('  IDPESSOA, ');
_query.sql.Add('  IDEMPRESA, ');
_query.sql.Add('  IDRUBRICA, ');
_query.sql.Add('  SEQRUBRICAINDIV, ');
_query.sql.Add('  VALORRUBRICA, ');
_query.sql.Add('  PARCELAS, ');
_query.sql.Add('  FLGTPRUBMANUT, ');
_query.sql.Add('  DATAFINAL, ');
_query.sql.Add('  ANOMESREF, ');
_query.sql.Add('  CODPORTFORMA, ');
_query.sql.Add('  IDTITULAR, ');
_query.sql.Add('  DATAINICIO, ');
_query.sql.Add('  FLGUSAABONO, ');
_query.sql.Add('  IDLOTE, ');
_query.sql.Add('  FLGDESATIVADO, ');
_query.sql.Add('  FLGUSADO, ');
_query.sql.Add('  IDMOTIVO, ');
_query.sql.Add('  NUMPROCINSS, ');
_query.sql.Add('  IDPLANOCONTABIL, ');
_query.sql.Add('  FLGRETROACAO, ');
_query.sql.Add('  MESCOMPREEM, ');//206134
_query.sql.Add('  IDMOVBENEF ');//206134
_query.sql.Add('  )  ');
_query.sql.Add(' values');
_query.sql.Add('  (  ');
_query.sql.Add(' '+#39+qryDet.fieldbyname('IDPESSOA').text+#39+',');
_query.sql.Add(' '+#39+'1'+#39+',');
_query.sql.Add(' '+#39+IDPROVENTO+#39+',');//feito
//_query.sql.Add(' '+#39+QRYDETCONCINSS.FIELDBYNAME('IDRUBRICA').TEXT+#39+',');

//_query.sql.Add(' '+#39+QRYRUBRICAXINSS.FIELDBYNAME('RUBRICAINSS').TEXT+#39+',');
_query.sql.Add(' '+#39+_seq+#39+',');//---seqrubinttostr(seq)
//_query.sql.Add(' '+#39+'1'+#39+',');//---seqrubinttostr(seq)
_query.sql.Add(' '+#39+QRYDETCONCINSS.FIELDBYNAME('valorinss').TEXT+#39+',');///feito
_query.sql.Add(' '+#39+'1'+#39+',');
_query.sql.Add(' '+#39+'1'+#39+',');


try
ultdia:=TrazUltDiaMes(strtoint(copy(_mesreflote,6,2)),strtoint(copy(_mesreflote,1,4)));
//ultdia:=TrazUltDiaMes(strtoint(copy(QRYDETCONCINSS.FIELDBYNAME('MESCOBRANCA').TEXT,6,2)),strtoint(copy(QRYDETCONCINSS.FIELDBYNAME('MESCOBRANCA').TEXT,1,4)));

except
end;




_query.sql.Add(' '+#39+formatfloat('00',ultdia)+'/'+copy(_mesreflote,6,2)+'/'+copy(_mesreflote,1,4)+#39+',');
_query.sql.Add(' '+#39+_mesreferencia+#39+',');
qryAux3.active:=false;
qryAux3.sql.clear;
qryAux3.sql.append(' select CODPORTFORMA from benefplanprev where idplanoprev='+#39+qryDet.fieldbyname('idplanoprev').text+#39);
qryAux3.sql.append(' and  idbeneficio='+#39+qryDet.fieldbyname('idbeneficio').text+#39);
qryAux3.open;
_query.sql.Add(' '+#39+qryAux3.fieldbyname('CODPORTFORMA').text+#39+',');///feito
qryAux3.close;

_query.sql.Add(' '+#39+qryDet.fieldbyname('IDTITULAR').text+#39+',');
//_query.sql.Add(' '+#39+_mesreferencia+#39+',');
_query.sql.Add(' '+#39+'01'+'/'+copy(_mesreflote,6,2)+'/'+copy(_mesreflote,1,4)+#39+',');
_query.sql.Add(' '+#39+'0'+#39+',');
_query.sql.Add(' '+#39+INTTOSTR(iIdLoteConcessao)+#39+',');
_query.sql.Add(' '+#39+'0'+#39+',');
_query.sql.Add(' '+#39+'0'+#39+',');
_query.sql.Add(' '+#39+_idmotivo+#39+',');
_query.sql.Add(' '+#39+qryDet.fieldbyname('NUMBENEFICIO').text+#39+',');
_query.sql.Add(' '+#39+qryDet.fieldbyname('Idplanprevcontab').text+#39+','); //ver hebio
_query.sql.Add(' '+#39+'0'+#39+','); //ver
//_query.sql.Add(' '+#39+'0'+#39+',');
_query.sql.Add(' '+#39+QRYDETCONCINSS.fieldbyname('MESCOBRANCA').text+#39+',');//206134
_query.sql.Add(' '+#39+_sidmovbenef+#39); //206134
_query.sql.Add('  )  ');
//_query.ExecSQL;
   try
             _query.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;



end;

procedure TFrmCadConcederBenefInssLote.DeletarRubricaIndiv(
  _query: TwwQuery);
begin

   _QUERY.CLOSE;
   _QUERY.SQL.CLEAR;
//   _QUERY.SQL.ADD('DELETE RUBRICAINDIV WHERE IDPESSOA='+#39+qryDet.fieldbyname('IDPESSOA').text+#39);
    _QUERY.SQL.ADD('DELETE FROM  RUBRICAINDIV WHERE IDMOVBENEF IN (SELECT IDMOVBENEF FROM HSTBENEFBFCIARIO WHERE NUMEROPROCESSO='+qryDet.fieldbyname('NUMEROPROCESSO').text+')');//206134
  // _//QUERY.SQL.ADD(' AND IDEMPRESA = 1 AND IDRUBRICA = '+#39+qryDet.fieldbyname('IDPESSOA').text+#39);
    try
             _query.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;


end;

procedure TFrmCadConcederBenefInssLote.Deletar_temp_log(_query: TwwQuery);
begin
_query.Close;
_query.sql.Clear;
_query.sql.Add('Delete from LOGREQUERLOTE ');
//_query.ExecSQL;
   try
             _query.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;


end;

procedure TFrmCadConcederBenefInssLote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
Deletar_temp_log(qry2);

 FreeAndNil(SRubrica); //William Santana - SOL 251599.17194 PPM 783173
end;

procedure TFrmCadConcederBenefInssLote.FormActivate(Sender: TObject);
begin
  inherited;
cb_tipo_recebedor.ItemIndex:=0;
end;

function TFrmCadConcederBenefInssLote.BuscarUltMesreaj(): string;
var
_query:TwwQuery;
begin
_query:=TwwQuery.Create(Self);
_query.DataBaseName := 'BaseDados';
_query.Active:=false;
_query.Sql.Clear;
_query.Sql.Append('SELECT MAX(MESREAJ)MESREAJ FROM REAJINSS');
_query.Active:=true;
result:=_query.FieldByName('mesreaj').text;
_query.Close;
_query.Destroy;
end;

function TFrmCadConcederBenefInssLote.BuscarValorReajustadoPAB(
  _rmi: double; _numprocinss, _mesref: string): double;
var
_query:TwwQuery;
begin
_query:=TwwQuery.Create(Self);
_query.DataBaseName := 'BaseDados';
_query.Active:=false;
_query.Sql.Clear;

_mesref:=copy(_mesref,6,2)+'/'+copy(_mesref,1,4);

_query.SQL.Add('SELECT (TRUNC(('+OraNumero(floattostr(_rmi))+' / ((cm.cotvalor / 100) + 1)), 2) + 0.01)ValorRejustado');
_query.SQL.Add('  FROM cotacaomoeda cm');
_query.SQL.Add(' WHERE cm.moecodigo = 20');
_query.SQL.Add('   AND cm.cotdata =');
_query.SQL.Add('       (SELECT GREATEST(''01/'' || to_char(bf.datainiciofund, ''MM/YYYY''),');
_query.SQL.Add('                        '+#39+'01/'+_mesref+#39+')');
_query.SQL.Add('          FROM benefbfciario bf');
_query.SQL.Add('         WHERE bf.numprocinss = '+#39+_numprocinss+#39+')');


_query.Active:=true;

result:=_query.fieldbyname('ValorRejustado').Value;

_query.Active:=false;
_query.Destroy;

end;

procedure TFrmCadConcederBenefInssLote.dbgrdDetTitleButtonClick(
  Sender: TObject; AFieldName: String);
var
    campo:string;
begin
  inherited;



campo:=AFieldName;
//application.processmessages; // para considerar algo que aconteça no dbgrid durante a entrada nesta procedure

buscarequerimentos('S',campo);



end;

procedure TFrmCadConcederBenefInssLote.DeletarPrevia;
var
  _query,_query2:TwwQuery;
begin


_query:=TwwQuery.Create(Self);
_query.DataBaseName := 'BaseDados';
_query.Active:=false;

_query2:=TwwQuery.Create(Self);
_query2.DataBaseName := 'BaseDados';
_query2.Active:=false;


_query2.CLOSE;
_query2.SQL.CLEAR;
_query2.SQL.Add('SELECT HB.MES MESCOBRANCA');
_query2.SQL.Add('FROM HSTBENEFBFCIARIO HB');
_query2.SQL.Add('WHERE HB.IDPESSOA = '+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+' AND ');
_query2.SQL.Add('  HB.IDTITULAR = '+QRYDET.FIELDBYNAME('IDTITULAR').TEXT+' AND ');
_query2.SQL.Add('      EXISTS (SELECT 1');
_query2.SQL.Add('              FROM BENEFBFCIARIO BF');
_query2.SQL.Add('              WHERE BF.NUMPROCINSS =  '+#39+QRYDET.FIELDBYNAME('NUMBENEFICIO').TEXT+#39+' AND');
_query2.SQL.Add('                    hb.IDPLANOPREV = bf.idplanoprev AND');
_query2.SQL.Add('                    hb.IDBENEFICIO = bf.idbeneficio AND');
_query2.SQL.Add('                    hb.NUMEROPROCESSO = bf.numeroprocesso AND');
_query2.SQL.Add('                    hb.IDPESSJUR = bf.idpessjur AND');
_query2.SQL.Add('                    hb.IDTITULAR = bf.idtitular AND');
_query2.SQL.Add('                    hb.IDPLANOORIGEM = bf.idplanoorigem AND');
_query2.SQL.Add('                    hb.IDPESSOA = bf.idpessoa AND');
_query2.SQL.Add('                    hb.SEQPROPOSTA = bf.seqproposta)');
_query2.SQL.Add('ORDER BY HB.MES DESC');
_query2.Active:=TRUE;


//_query2.First;
while not _query2.eof do
begin
_query.Sql.Clear;
_QUERY.SQL.APPEND('DELETE FROM PREVIA WHERE');
_QUERY.SQL.APPEND('IDPESSOA  ='+#39+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+#39);
_QUERY.SQL.APPEND(' AND IDTITULAR  ='+#39+QRYDET.FIELDBYNAME('IDTITULAR').TEXT+#39);
_QUERY.SQL.APPEND(' AND MESCOBRANCA  ='+#39+_query2.FIELDBYNAME('MESCOBRANCA').TEXT+#39);
_query.ExecSQL;
_query2.Next;
end;

_query.Destroy;
_query2.CLOSE;
_query2.Destroy;






end;

function TFrmCadConcederBenefInssLote.CalculaData(Data1,
  Data2: string): INTEGER;
var
  D1,M1,A1,                {1234567890}
  D2,M2,A2,NumMeses:Integer;        {dd/mm/aaaa}
  UltDia1, UltDia2: Integer;//William Moreira da Silva - SIG 39243
begin
  D1 := StrTOInt(copy(Data1,1,2));
  M1 := StrTOInt(copy(Data1,4,2));
  A1 := StrTOInt(copy(Data1,7,4));

  UltDia1 := TrazUltDiaMes(M1,A1);//William Moreira da Silva - SIG 39243

  D2 := StrTOInt(copy(Data2,1,2));
  M2 := StrTOInt(copy(Data2,4,2));
  A2 := StrTOInt(copy(Data2,7,4));

  UltDia2 := TrazUltDiaMes(M2,A2);//William Moreira da Silva - SIG 39243

  NumMeses := (M2+12*(A2-1))-(M1+12*(A1-1));
  //William Moreira da Silva - SIG 43158
  //William Moreira da Silva - SIG 39243
  //if D1 < D2 OR then
  //if (D1 < D2) OR ((D1 > D2) and (D1 = UltDia1) and (D2 = UltDia2)) then
  //William Moreira da Silva - SIG 39243
    //NumMeses := NumMeses - 1;

//RESULT:=NumMeses+1;
RESULT:=NumMeses;
//William Moreira da Silva - SIG 43158
end;

procedure TFrmCadConcederBenefInssLote.RemoveDuplicates(
  var stringList: TStringList);
var  
  buffer: TStringList;  
  cnt: Integer;  
begin

  stringList.Sort;
  buffer := TStringList.Create;
  try
    buffer.Sorted := True;
    buffer.Duplicates := dupIgnore;
    buffer.BeginUpdate;
    for cnt := 0 to stringList.Count - 1 do  
      buffer.Add(stringList[cnt]) ;  
    buffer.EndUpdate;  
    stringList.Assign(buffer) ;  
  finally  
    FreeandNil(buffer) ;  
  end;
end;

//Helio - SOL 207871 / KTN 2014291
procedure TFrmCadConcederBenefInssLote.lbl_SituacaoPlanoPrint(
  Sender: TObject);
begin
  inherited;
  lbl_SituacaoPlano.Caption := qryDet.FieldByName('SITPLANO').AsString;
end;

//Helio - SOL 207871 / KTN 2014291
procedure TFrmCadConcederBenefInssLote.ppGroupFooterBand3AfterPrint(
  Sender: TObject);
begin
  inherited;
  imprimiuRodapteGrupoRelatorio := True;
end;

//Helio - SOL 207871 / KTN 2014291
procedure TFrmCadConcederBenefInssLote.ppFooterBand1BeforePrint(
  Sender: TObject);
begin
  inherited;

  //somente mostra a assinatura/carimbo
  //depois do rodape do grupo
  if imprimiuRodapteGrupoRelatorio then
  begin
     lblNomNUP.Visible      := True;
     lblNomUsuario.Visible  := True;
     lbl_NUP.Visible        := True;
     lbl_usuario.Visible    := True;
  end else
  begin
     lblNomNUP.Visible      := False;
     lblNomUsuario.Visible  := False;
     lbl_NUP.Visible        := False;
     lbl_usuario.Visible    := False;
  end;

end;

//Helio - SOL 207871 / KTN 2014291
function TFrmCadConcederBenefInssLote.GeraLblUsuario : String;
var
    sSQL : String;
    qryTemp: TwwQuery;
begin
      Try
        qryTemp := TwwQuery.Create(dtmBaseDados);
        qryTemp.DataBaseName := dtmBaseDados.dbBaseDados.DataBaseName;


        sSQL := ' SELECT NOME FROM PESSOA where idpessoa = ' + IntToStr(Sistema.IdUsuario);

        qryTemp.SQL.Text := sSQL;

        Result := '';

        qryTemp.Open;
        if Not qryTemp.IsEmpty then
           Result := qryTemp.FieldByName('NOME').AsString;

      Finally
        qryTemp.Close;
        FreeAndNil(qryTemp);
      End;

end;

//Helio - SOL 207871 / KTN 2014291
procedure TFrmCadConcederBenefInssLote.lbl_NUPPrint(Sender: TObject);
var
   sNup : String;
begin
  inherited;
   sNup                  := qryDet.FieldByName('NUP').AsString + '______________';
   lbl_NUP.Caption       := sNup[1]+sNup[2]+sNup[3]+sNup[4]+sNup[5]+'.'+
                            sNup[6]+sNup[7]+sNup[8]+sNup[9]+sNup[10]+sNup[11]+'/'+
                            sNup[12]+sNup[13]+sNup[14]+sNup[15];
end;

//Helio - SOL 207871 / KTN 2014291
procedure TFrmCadConcederBenefInssLote.lbl_CPFPrint(Sender: TObject);
var
  sCPF : String;
begin
  inherited;
  
   sCPF                  := qryDet.FieldByName('CPF').AsString + '___________';
   lbl_CPF.Caption       := sCPF[1]+sCPF[2]+sCPF[3]+'.'+
                            sCPF[4]+sCPF[5]+sCPF[6]+'.'+
                            sCPF[7]+sCPF[8]+sCPF[9]+'-'+
                            sCPF[10]+sCPF[11];
end;
//Início - William Santana - SOL 251599.17194 PPM 783173
procedure TFrmCadConcederBenefInssLote.CombosDropDown(Sender: TObject);
 var
   iWIDTH, i : integer ;
begin
  inherited;

  iWIDTH := 145;

  for i := 0 to Tcombobox(Sender).items.Count do
  begin
    if iWIDTH < Canvas.TextWidth(Tcombobox(Sender).Items.Strings[i]) then
    iWIDTH := Canvas.TextWidth(Tcombobox(Sender).Items.Strings[i]);
  end;

  Tcombobox(Sender).Perform(CB_SETDROPPEDWIDTH, iWIDTH + 10, 0);

end;

procedure TFrmCadConcederBenefInssLote.tbcDetalheChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
 // inherited;
end;

//Término - William Santana - SOL 251599.17194 PPM 783173



function TFrmCadConcederBenefInssLote.BuscaLoteConcedido: integer;
var
  query: TwwQuery;
begin
  query := TwwQuery.Create(Application);
  query.DataBaseName := 'BaseDados';

  query.close;
  query.sql.clear;
  query.SQL.Add('SELECT IDLOTEMOV');
  query.SQL.Add('  FROM MOVBENEF');
  query.SQL.Add(' WHERE IDPESSJUR ='+qrydet.fieldbyname('IDPESSJUR').text);
  query.SQL.Add('   AND IDTITULAR ='+qrydet.fieldbyname('IDTITULAR').text);
  query.SQL.Add('   AND IDPLANOORIGEM ='+qrydet.fieldbyname('IDPLANOPREV').text);
  query.SQL.Add('   AND IDPLANOPREV ='+qrydet.fieldbyname('IDPLANOPREV').text);
  query.SQL.Add('   AND IDPESSOA = '+qrydet.fieldbyname('IDPESSOA').text);
  query.SQL.Add('   AND NUMEROPROCESSO = '+qrydet.fieldbyname('NUMEROPROCESSO').text);
  query.SQL.Add('   AND SEQPROPOSTA = 1');
  query.SQL.Add(' order by idmovbenef desc');
  query.open;
  if not query.IsEmpty then
    result := query.fieldbyname('IDLOTEMOV').asinteger
  else
    Result := -1;
  query.open;
  query.Destroy;
end;

//Darivaldo Alencar SIG26527 -inicio
procedure TFrmCadConcederBenefInssLote.bbtnFiltrarClick(Sender: TObject);
var
  sFiltro : string;
Function TrataFiltro(sCampo: String):String;
begin
    if (sFiltro <> EmptyStr) then
         result := sFiltro + ' AND ' + sCampo
    else result := sCampo;
end;

begin
  inherited;
  sFiltro:= EmptyStr;
  try
    Screen.Cursor:= crSQLWait;
    if (dbedMatricula.Text <> EmptyStr) then
          sFiltro := TrataFiltro('MATRICULA = ' + QuotedStr(Trim(dbedMatricula.Text)));

    if (dbedNumBenef.Text <> EmptyStr) then
          sFiltro := TrataFiltro('NUMBENEFICIO = ' + QuotedStr(Trim(dbedNumBenef.Text)));

    if (dtpDer.Text <> EmptyStr) then
          sFiltro := TrataFiltro('DATAREQUERIMENTO = ' + QuotedStr(Trim(dtpDer.Text)));

    if (dbedNome.Text <> EmptyStr) then
          sFiltro := TrataFiltro('NOME = ' + QuotedStr(Trim(dbedNome.Text)));

    if (dbedNmBenef.Text <> EmptyStr) then
          sFiltro := TrataFiltro('BENEFICIO = ' + QuotedStr(Trim(dbedNmBenef.Text)));

    qryDet.Filtered := False;
    qryDet.Filter   := sFiltro;
  if (sFiltro<> EmptyStr) then
     qryDet.Filtered := True;
  finally
    Screen.Cursor:= crDefault;
  end;
end;
//Darivaldo Alencar SIG26527 -fim

end.



