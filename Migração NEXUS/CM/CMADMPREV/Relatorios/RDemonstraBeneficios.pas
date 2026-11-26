unit RDemonstraBeneficios;

{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Alteração   : CrmRptCMBeforePrint     
WO          : WO23998
Responsável : Paulo Nobre
Data        : 05/08/2025
Descrição   : Voltar a mostrar o nome da Pessoa, para ser apresentado na
              assinatura do relatório.
--------------------------------------------------------------------------------
Alteração  : rpDemonstraBeneficiosBeforePrint
Nº SIG.....: SIG50850
Data.......: 12/09/2019
Responsável: Fábio Sampaio
Descrição..: Inclusão das Informações da Ação Judicial
-------------------------------------------------------------------------------
Alteração  : (dfm) rpDemonstraBeneficios, SubRelHstBenefPrint
Nº SIG.....: 63991
Data.......: 27/02/2017
Responsável: Luiz Carlos
Descrição..: Exibicao campos FAB. BS e Base Déficit
-------------------------------------------------------------------------------
Alteração  : (.dfm NOMEPERFIL) rpDemonstraBeneficios, sqlDemonstra, CmpRptCM, AbreConsultas
Nº SIG.....: 55933
Data.......: 02/10/2017
Responsável: Edilaine Ferraresi
Descrição..: Inclusão do perfil de investimento
-------------------------------------------------------------------------------
Alteração  : (dfm) rpDemonstraBeneficios
Nº SIG.....: 48492
Data.......: 14/06/2017
Responsável: Andre Imakawa
Descrição..: Acerto dos campos com valores wordwrap = false
-------------------------------------------------------------------------------
Alteração  : (dfm) qryHstContribP, qryHstContrib, rpDemonstraBeneficios
Nº SIG.....: 32303          
Data.......: 31/10/2016
Responsável: Edilaine Ferraresi
Descrição..: Equacionamento - separação das contribuições em grupo
-------------------------------------------------------------------------------
Alteração  : (dfm)
Nº SIG.....: 19643
Data.......: 28/04/2016
Responsável: William Moreira
Descrição..: Ajuste em campos que estavao como memo evitando erro em algumas
             maquinas
-------------------------------------------------------------------------------
Alteração  : (dfm) sqlDemonstrativo, CrmRptCMBeforePrint, rpDemonstraBeneficiosBeforePrint,
             AbreConsultas, SalvarArquivoDemonstrativo
Nº SOL.....: 253577-18174
KTN / PPM  : 1327585
Data       : 31/03/2016
Responsável: Edilaine Ferraresi
Descrição..: Ajustes para Equacionamento do Deficit - gravação de demonstrativos
{-------------------------------------------------------------------------------
Alteração  : Alteração da query sqldemonstra
Nº SOL.....: 267497
KTN / PPM  :
Data       : 08/01/2016
Responsável: Peterson Victor
Descrição..: Alteração da query sqldemonstra
--------------------------------------------------------------------------------
Alteração  : criação do demonstrativo para ser usado na reabertura, retenção e liberação
Nº SOL.....: 253577-17570
KTN / PPM  : 989569
Data       : 22/09/2015
Responsável: Edilaine
Descrição..: Ajustes para Equacionamento do Deficit - reabertura
--------------------------------------------------------------------------------}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, TXRB, CmParamReport, ppComm, ppRelatv,
  ppProd, ppClass, ppReport, ppCtrls, ppVar, ppPrnabl, ppBands, ppCache,
  ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBTables, Wwquery, ppStrtch,
  ppSubRpt, UParticipante, USistema, UBeneficio, UFuncoesUteis, ShellApi,
  ppModule, raCodMod, UDataBase;

type
  TRptDemonstraBeneficios = class(TFrmCmReport)
    rpDemonstraBeneficios: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppImage2: TppImage;
    lbl_Titulo: TppLabel;
    ppLabel2: TppLabel;
    ppLabel16: TppLabel;
    ppLabel28: TppLabel;
    ppLabel37: TppLabel;
    ppLabel41: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLine9: TppLine;
    ppLabel53: TppLabel;
    ppDBText26: TppDBText;
    ppLabel52: TppLabel;
    ppLabel50: TppLabel;
    ppDBText3: TppDBText;
    ppLabel76: TppLabel;
    ppDBText34: TppDBText;
    ppLabel54: TppLabel;
    ppDBText27: TppDBText;
    ppLabel78: TppLabel;
    ppDBText38: TppDBText;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel58: TppLabel;
    ppDBText29: TppDBText;
    ppLine11: TppLine;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    lbl_banco: TppLabel;
    lbl_agencia: TppLabel;
    lbl_conta: TppLabel;
    lbl_conta2: TppLabel;
    lbl_banco2: TppLabel;
    lbl_agencia2: TppLabel;
    ppLine12: TppLine;
    ppLine13: TppLine;
    sqlDemonstra: TwwQuery;
    dsDemonstra: TwwDataSource;
    ppDemonstra: TppBDEPipeline;
    ppSystemVariable1: TppSystemVariable;
    ppLabel3: TppLabel;
    lbl_Rodape: TppLabel;
    ppLine1: TppLine;
    lbl_usuario: TppLabel;
    lblNomUsuario: TppLine;
    SubRelFuncef: TppSubReport;
    ppChildReport1: TppChildReport;
    SubRelINSS: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    ppLabel5: TppLabel;
    ppDBNome1: TppDBText;
    lblBSAtu1: TppLabel;
    ppDbBSAtu1: TppDBText;
    lblBSTot1: TppLabel;
    ppDbBSTot1: TppDBText;
    lblDeficit1: TppLabel;
    ppDBDeficit1: TppDBText;
    lblFABAtu1: TppLabel;
    ppDbFABAtu1: TppDBText;
    lblFABTot1: TppLabel;
    ppDbFABTot1: TppDBText;
    lblVlrAtual1: TppLabel;
    ppDbVlrAtual1: TppDBText;
    lblVlrTotal1: TppLabel;
    ppDbVlrTotal1: TppDBText;
    VlrOriginal1: TppLabel;
    lbl_vlrOriginal1: TppLabel;
    lbl_DIB1: TppLabel;
    ppDIB1: TppDBText;
    lbl_DIP1: TppLabel;
    ppDIP1: TppDBText;
    lbl_DIBAnt1: TppLabel;
    ppDIBAnt1: TppDBText;
    ppTitleBand2: TppTitleBand;
    ppDetailBand3: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    lbl_DtFinal1: TppLabel;
    ppDtFinal1: TppDBText;
    lbl_DtNova1: TppLabel;
    ppDtNova1: TppDBText;
    ppLabel11: TppLabel;
    ppDBText2: TppDBText;
    lbl_DER2: TppLabel;
    ppDER2: TppDBText;
    lbl_DIP2: TppLabel;
    ppDIP2: TppDBText;
    lbl_DIBAnt2: TppLabel;
    ppDIBAnt2: TppDBText;
    lbl_DtFinal2: TppLabel;
    ppDtFinal2: TppDBText;
    lbl_DtNova2: TppLabel;
    ppDtNova2: TppDBText;
    ppDIB2: TppDBText;
    lbl_DIB2: TppLabel;
    lbl_NumINSS: TppLabel;
    ppNumProcINSS: TppDBText;
    ppTempo: TppDBText;
    lbl_Tempo: TppLabel;
    qryBenefFuncef: TwwQuery;
    dsBenefFuncef: TwwDataSource;
    qryBenefInss: TwwQuery;
    dsBenefInss: TwwDataSource;
    ppBenefnss: TppBDEPipeline;
    ppBenefFuncef: TppBDEPipeline;
    SubRelLegenda: TppSubReport;
    ppChildReport3: TppChildReport;
    qryLegenda: TwwQuery;
    qryLegendaCODIGO: TFloatField;
    qryLegendaPLANO: TStringField;
    dsLegenda: TwwDataSource;
    ppLegenda: TppBDEPipeline;
    ppLegendappField1: TppField;
    ppLegendappField2: TppField;
    ppTitleBand3: TppTitleBand;
    ppDetailBand4: TppDetailBand;
    ppSummaryBand3: TppSummaryBand;
    ppLabel125: TppLabel;
    ppLabel126: TppLabel;
    ppLabel127: TppLabel;
    ppDBText104: TppDBText;
    ppDBText105: TppDBText;
    SubRelSituacao: TppSubReport;
    ppChildReport4: TppChildReport;
    ppTitleBand4: TppTitleBand;
    ppDetailBand5: TppDetailBand;
    ppSummaryBand4: TppSummaryBand;
    ppLine14: TppLine;
    ppSituacao: TppLabel;
    lblSituacao: TppLabel;
    ppLinSit: TppLine;
    SubRelHstBenef: TppSubReport;
    ppChildReport5: TppChildReport;
    SubRelHstContrA: TppSubReport;
    ppChildReport6: TppChildReport;
    dsHstBenef: TwwDataSource;
    qryHstBenef: TwwQuery;
    qryHstContrib: TwwQuery;
    dsHstContrib: TwwDataSource;
    ppHstBenef: TppBDEPipeline;
    ppHstContrib: TppBDEPipeline;
    ppTitleBand5: TppTitleBand;
    ppDetailBand6: TppDetailBand;
    ppSummaryBand5: TppSummaryBand;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppLabel4: TppLabel;
    ppLabel95: TppLabel;
    ppLabel108: TppLabel;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLabel109: TppLabel;
    ppLabel110: TppLabel;
    ppDBText89: TppDBText;
    ppDBText90: TppDBText;
    ppVlrFAB: TppDBText;
    ppVlrDeficit: TppDBText;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppShape8: TppShape;
    ppShape10: TppShape;
    ppDBText94: TppDBText;
    ppShape11: TppShape;
    ppVlrBS: TppDBText;
    lblVlrAtual2: TppLabel;
    ppDbVlrAtual2: TppDBText;
    lblVlrTotal2: TppLabel;
    ppDbVlrTotal2: TppDBText;
    VlrOriginal2: TppLabel;
    lbl_vlrOriginal2: TppLabel;
    ppTitleBand6: TppTitleBand;
    ppDetailBand7: TppDetailBand;
    ppHCARodape: TppSummaryBand;
    lblAvisoContrib: TppLabel;
    ppShape29: TppShape;
    ppShape30: TppShape;
    lblHCRef: TppLabel;
    lblHCCobr: TppLabel;
    lblHCPagar: TppLabel;
    lblHCDesc: TppLabel;
    lblHCNome: TppLabel;
    ppLabel117: TppLabel;
    ppHCMesRef: TppDBText;
    ppHCMesCobr: TppDBText;
    ppHCNome: TppDBText;
    ppHCVlrPag: TppDBText;
    ppHCVlrDesc: TppDBText;
    ppLine23: TppLine;
    ppShape31: TppShape;
    ppShape32: TppShape;
    ppShape33: TppShape;
    ppShape34: TppShape;
    ppShape37: TppShape;
    ppShape41: TppShape;
    qryBenefFuncefIDBENEFICIO: TFloatField;
    qryBenefFuncefIDPESSOA: TFloatField;
    qryBenefFuncefIDPESSJUR: TFloatField;
    qryBenefFuncefNOME: TStringField;
    qryBenefFuncefVALORATUAL: TFloatField;
    qryBenefFuncefVALORTOTAL: TFloatField;
    qryBenefFuncefVLRBSATUAL: TFloatField;
    qryBenefFuncefVLRBSTOTAL: TFloatField;
    qryBenefFuncefVLRFABATUAL: TFloatField;
    qryBenefFuncefVLRFABTOTAL: TFloatField;
    qryBenefFuncefVLRBASEDEFICIT: TFloatField;
    qryBenefFuncefDIB: TDateTimeField;
    qryBenefFuncefDIP: TDateTimeField;
    qryBenefFuncefDIBANT: TDateTimeField;
    qryBenefFuncefDATAFINAL: TDateTimeField;
    qryBenefFuncefFLGAPRESENTABSFAB: TFloatField;
    qryBenefFuncefFLGAPRESENTADEFICIT: TFloatField;
    qryBenefFuncefVALORNADIB: TFloatField;
    qryHstBenefNOME: TStringField;
    qryHstBenefMESREFERENCIA: TStringField;
    qryHstBenefDATAPAGAMENTO: TDateTimeField;
    qryHstBenefVALORFAB: TFloatField;
    qryHstBenefVALORBS: TFloatField;
    qryHstBenefVLRBASEDEFICIT: TFloatField;
    qryHstBenefVALORPREV: TFloatField;
    qryHstBenefFLGAPRESENTABSFAB: TFloatField;
    qryHstBenefFLGAPRESENTADEFICIT: TFloatField;
    SubRelHstContrP: TppSubReport;
    ppChildReport7: TppChildReport;
    ppTitleBand7: TppTitleBand;
    ppDetailBand8: TppDetailBand;
    ppHCPRodade: TppSummaryBand;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel12: TppLabel;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppHCVlrPagP: TppDBText;
    ppHCVlrDescP: TppDBText;
    ppLine3: TppLine;
    ppShape3: TppShape;
    ppShape13: TppShape;
    ppShape14: TppShape;
    ppShape15: TppShape;
    ppShape16: TppShape;
    ppShape18: TppShape;
    lblAvisoContribP: TppLabel;
    qryHstContribP: TwwQuery;
    dsHstContribP: TwwDataSource;
    ppHstContribP: TppBDEPipeline;
    qryHstContribIDCONTRIBUICAO: TFloatField;
    qryHstContribNOME: TStringField;
    qryHstContribFLGPAGADOR: TStringField;
    qryHstContribMESREFERENCIA: TStringField;
    qryHstContribMESCOBRANCA: TStringField;
    qryHstContribVLRDEVOLVER: TFloatField;
    qryHstContribVLRCOBRAR: TFloatField;
    qryHstContribPIDCONTRIBUICAO: TFloatField;
    qryHstContribPNOME: TStringField;
    qryHstContribPFLGPAGADOR: TStringField;
    qryHstContribPMESREFERENCIA: TStringField;
    qryHstContribPMESCOBRANCA: TStringField;
    qryHstContribPVLRDEVOLVER: TFloatField;
    qryHstContribPVLRCOBRAR: TFloatField;
    ppDBText7: TppDBText;
    sqlDemonstraNUMEROPROCESSO: TFloatField;
    sqlDemonstraIDPESSOA: TFloatField;
    sqlDemonstraCPF: TStringField;
    sqlDemonstraMATRICULA: TStringField;
    sqlDemonstraTIPORECEBE: TStringField;
    sqlDemonstraIDRECEBEDOR: TFloatField;
    sqlDemonstraNOMERECEBEDOR: TStringField;
    sqlDemonstraDATANASC: TDateTimeField;
    sqlDemonstraIDTITULAR: TFloatField;
    sqlDemonstraNOMEPLANO: TStringField;
    sqlDemonstraNOMESITPLANO: TStringField;
    sqlDemonstraIRRFISENTO: TStringField;
    sqlDemonstraIDPLANOPREV: TFloatField;
    sqlDemonstraSEQPROPOSTA: TFloatField;
    sqlDemonstraIDPESSJUR: TFloatField;
    qryBenefInssIDBENEFICIO: TFloatField;
    qryBenefInssIDPESSOA: TFloatField;
    qryBenefInssIDPESSJUR: TFloatField;
    qryBenefInssNOME: TStringField;
    qryBenefInssVALORATUAL: TFloatField;
    qryBenefInssVALORTOTAL: TFloatField;
    qryBenefInssVLRBSATUAL: TFloatField;
    qryBenefInssVLRBSTOTAL: TFloatField;
    qryBenefInssVLRFABATUAL: TFloatField;
    qryBenefInssVLRFABTOTAL: TFloatField;
    qryBenefInssVLRBASEDEFICIT: TFloatField;
    qryBenefInssDER: TDateTimeField;
    qryBenefInssDIB: TDateTimeField;
    qryBenefInssDIP: TDateTimeField;
    qryBenefInssDIBANT: TDateTimeField;
    qryBenefInssDATAFINAL: TDateTimeField;
    qryBenefInssNUMPROCINSS: TStringField;
    qryBenefInssTEMPOSERVICO: TStringField;
    qryBenefInssVALORNADIB: TFloatField;
    sqlDemonstraFONTEPAGADORA: TFloatField;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    SubRelTotal: TppSubReport;
    ppChildReport8: TppChildReport;
    ppBndTotal: TppTitleBand;
    ppDetailBand9: TppDetailBand;
    ppSummaryBand6: TppSummaryBand;
    ppLabel119: TppLabel;
    lbl_totalBenef: TppLabel;
    lbl_totContrib: TppLabel;
    lbl_vlrtotContrib: TppLabel;
    ppLinhaTot: TppLine;
    ppMotivo: TppLabel;
    lblMotivo: TppLabel;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    sqlDemonstraMATRICULATIT: TStringField;
    qryBenefFuncefDATANOVA: TDateTimeField;
    qryBenefInssDATANOVA: TDateTimeField;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppLabel13: TppLabel;
    ppDBText8: TppDBText;
    sqlDemonstraNOMEPERFIL: TStringField;
    linha4: TppShape;
    linha5: TppShape;
    lblFAB: TppLabel;
    lblBS: TppLabel;
    lblValorBeneficio: TppLabel;
    lblBaseDeficit: TppLabel;
    ppvlbenef: TppDBText;
    linha6: TppShape;
    SubRelAcJud: TppSubReport;
    ppChildReportAcJudDeficit: TppChildReport;
    ppDetailBandAcJudDeficit: TppDetailBand;
    ppTitleBandAcJudDeficit: TppTitleBand;
    ppAcJudDeficit: TppBDEPipeline;
    ppAcJudDeficitppField1: TppField;
    ppAcJudDeficitppField2: TppField;
    ppAcJudDeficitppField3: TppField;
    ppAcJudDeficitppField4: TppField;
    ppAcJudDeficitppField5: TppField;
    dsAcJudDeficit: TwwDataSource;
    qryAcJudDeficit: TwwQuery;
    qryAcJudDeficitIDCONTRIBUICAO: TFloatField;
    qryAcJudDeficitNOME: TStringField;
    qryAcJudDeficitPERCACJUDDEFICIT: TFloatField;
    qryAcJudDeficitANOMESINIACJUDDEFICIT: TStringField;
    qryAcJudDeficitANOMESFIMACJUDDEFICIT: TStringField;
    ppLabelLote: TppLabel;
    ppLabelVersao: TppLabel;
    ppShapeDetailBandAcJudDeficit1: TppShape;
    ppLineDetailBandAcJudDeficit3: TppLine;
    ppLineDetailBandAcJudDeficit2: TppLine;
    ppLineDetailBandAcJudDeficit1: TppLine;
    ppDBTextAcJudANOMESINIACJUDDEFICIT: TppDBText;
    ppDBTextAcJudANOMESFIMACJUDDEFICIT: TppDBText;
    ppDBTextAcJudPERCACJUDDEFICIT: TppDBText;
    ppDBTextAcJudNOME: TppDBText;
    ppShapeTitleBandAcJudDeficit2: TppShape;
    ppLabelAcJudANOMESFIMACJUDDEFICIT: TppLabel;
    ppLabelAcJudANOMESINIACJUDDEFICIT: TppLabel;
    ppLabelAcJudPERCACJUDDEFICIT: TppLabel;
    ppLabelAcJudNOME: TppLabel;
    ppLineTitleBandAcJudDeficit3: TppLine;
    ppLineTitleBandAcJudDeficit2: TppLine;
    ppLineTitleBandAcJudDeficit1: TppLine;
    ppShapeTitleBandAcJudDeficit1: TppShape;
    ppLabelTitleBandAcJudDeficit1: TppLabel;
    qryAuxLote: TwwQuery;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure lbl_contaPrint(Sender: TObject);
    procedure ppFooterBand1BeforePrint(Sender: TObject);
    procedure lbl_vlrOriginal1Print(Sender: TObject);
    procedure lbl_vlrOriginal2Print(Sender: TObject);
    procedure qryBenefFuncefAfterScroll(DataSet: TDataSet);
    procedure ppHCARodapeBeforePrint(Sender: TObject);
    procedure ppHCVlrDescPrint(Sender: TObject);
    procedure ppHCVlrPagPrint(Sender: TObject);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
    procedure ppHCVlrPagPPrint(Sender: TObject);
    procedure ppHCVlrDescPPrint(Sender: TObject);
    procedure ppHCPRodadeBeforePrint(Sender: TObject);
    procedure ppBndTotalBeforePrint(Sender: TObject);
    procedure ppBndTotalAfterPrint(Sender: TObject);
    procedure ppDetailBand6BeforePrint(Sender: TObject);
    procedure ppDetailBand7BeforePrint(Sender: TObject);
    procedure ppDetailBand8BeforePrint(Sender: TObject);
    procedure ppVlrFABGetText(Sender: TObject; var Text: String);
    procedure ppVlrBSGetText(Sender: TObject; var Text: String);
    procedure ppVlrDeficitGetText(Sender: TObject; var Text: String);
    procedure SubRelTotalPrint(Sender: TObject);
    procedure ppGroupFooterBand2AfterPrint(Sender: TObject);
    procedure rpDemonstraBeneficiosBeforePrint(Sender: TObject);
    procedure SubRelHstBenefPrint(Sender: TObject);
    procedure TotalizaContrib(qryContriAux: TwwQuery); // Andre Imakawa - SIG 121019
  private
    { Private declarations }
    imprimiuRodapteGrupoRelatorio : Boolean;
    bAlgumPagadorPatro : boolean;
    rTotalBeneficio    : currency;
    rTotalContribuicao : currency;
    bTemContribuicoes  : boolean;

  public
    { Public declarations }
    procedure AbreConsultas;                             // edilaine - SOL 253577-18174 / PPM 1327585
    procedure SalvarArquivoDemonstrativo;                // edilaine - SOL 253577-18174 / PPM 1327585
  end;

var
  RptDemonstraBeneficios: TRptDemonstraBeneficios;

implementation

uses DAPrev;

{$R *.DFM}

procedure TRptDemonstraBeneficios.CrmRptCMBeforePrint(Sender: TObject);
begin
  // edilaine - SOL 253577-18174 / PPM 1327585 - comentado inicio
 { inherited;

  // dados gerais
  sqlDemonstra.Close;
  sqlDemonstra.Sql.Text := StringReplace( sqlDemonstra.Sql.Text, '&NUMEROPROCESSO', CmpRptCM.ParamValues[2].AsString, [rfReplaceAll]);
  sqlDemonstra.ParamByName('pIDPESSOA').AsInteger := CmpRptCM.ParamValues[8].AsInteger;
  sqlDemonstra.Open;

  lbl_usuario.Caption     := Sistema.NomeUsuario;


  // título do relatório
  lbl_Titulo.caption := 'Demonstrativo de '+ CmpRptCM.ParamValues[0].AsString +' de Benefícios';
  lbl_Rodape.caption := lbl_Titulo.caption;

  if Trim(CmpRptCM.ParamValues[5].AsString) <> '' then
  begin
    SubRelSituacao.Visible := true;
    ppSituacao.Caption  := CmpRptCM.ParamValues[5].AsString;

    if Trim(CmpRptCM.ParamValues[7].AsString) <> '' then
    begin
      lblMotivo.Caption := Trim(CmpRptCM.ParamValues[4].AsString);
      ppMotivo.Caption  := Trim(CmpRptCM.ParamValues[7].AsString);
      ppMotivo.left     := lblMotivo.left + lblMotivo.width + 1.350;
    end
    else
    begin
      lblMotivo.visible := false;
      ppMotivo.visible  := false;
      ppLinSit.Top      := lblMotivo.Top;
    end;

    //linha do SubRelTotal
    ppLinhaTot.visible  := false;
  end
  else
  begin
    SubRelSituacao.Visible := false;
    ppLinhaTot.visible     := true;
  end;

  lbl_DtNova1.caption := 'Data de '+ CmpRptCM.ParamValues[0].AsString +': ';
  ppDtNova1.left := lbl_DtNova1.left + lbl_DtNova1.width + 1.250;

  lbl_DtNova2.caption := 'Data de '+ CmpRptCM.ParamValues[0].AsString + ': ';
  ppDtNova2.left := lbl_DtNova2.left + lbl_DtNova2.width + 1.250;
  } // edilaine - SOL 253577-18174 / PPM 1327585 - comentado fim
end;

procedure TRptDemonstraBeneficios.lbl_contaPrint(Sender: TObject);
begin
  inherited;

  lbl_conta.caption   := '';
  lbl_banco.caption   := '';
  lbl_agencia.caption := '';

  lbl_conta2.caption   := '';
  lbl_banco2.caption   := '';
  lbl_agencia2.caption := '';


  {Conta Bancária}
  with TwwQuery.create(nil) do
    try
      DatabaseName := 'BaseDados';

      SQL.Clear;
      SQL.Add('SELECT C.CONTACORRENTE, C.FLGCONTAPREF, C.TIPOCONTA, ');
      SQL.Add('       A.NUMAGENCIA, PB.NOME AS NOMEBANCO ');
      SQL.Add('  FROM PESSOA PB, BANCO B, AGENCIABANCARIA A, CONTABANCARIA C ');
      SQL.Add(' WHERE (C.IDAGENCIA = A.IDPESSOA)  ');
      SQL.Add('   AND (A.IDBANCO = B.IDPESSOA)    ');
      SQL.Add('   AND (B.IDPESSOA = PB.IDPESSOA)  ');
      SQL.Add('   AND (c.flgcontainativa = ''N'') ');
      SQL.Add('   AND ((c.tipoconta = 2) or (c.flgcontapref = 1)) ');
      SQL.Add('   AND (C.IDPESSOA = '+ sqlDemonstra.FieldByName('IDPESSOA').AsString +') ');
      SQL.Add(' ORDER BY c.tipoconta desc ');
      Open;
      if not isEmpty then
      begin
        while not eof do
        begin
          if FieldByName('TIPOCONTA').AsInteger = 2 then   // conta salario
          begin
            lbl_conta.caption   := fieldbyname('CONTACORRENTE').text;
            lbl_banco.caption   := fieldbyname('NOMEBANCO').text;
            lbl_agencia.caption := fieldbyname('NUMAGENCIA').text;
          end
          else if FieldByName('FLGCONTAPREF').AsInteger = 1 then   // preferencial
          begin
            lbl_conta2.caption   := fieldbyname('CONTACORRENTE').text;
            lbl_banco2.caption   := fieldbyname('NOMEBANCO').text;
            lbl_agencia2.caption := fieldbyname('NUMAGENCIA').text;
          end;
          next;
        end;
      end
      else
        lbl_conta.caption := '< não cadastrada até o momento > ';

    finally
      Free;
    end;
end;

procedure TRptDemonstraBeneficios.ppFooterBand1BeforePrint(
  Sender: TObject);
begin
  inherited;
  lblNomUsuario.visible := imprimiuRodapteGrupoRelatorio;
  lbl_usuario.visible   := imprimiuRodapteGrupoRelatorio;
end;

procedure TRptDemonstraBeneficios.lbl_vlrOriginal1Print(Sender: TObject);
var
  dValorNaDib : double;
begin
  inherited;
  {calcular Beneficio Original}
  if sqlDemonstra.FieldByName('TIPORECEBE').AsString = 'APOSENTADO'  then
     dValorNaDib := PegaValorIntegral( dtmAPrev.qry,
                                      sqlDemonstra.FieldByName('NumeroProcesso').AsInteger,
                                      qryBenefFuncef.FieldByName('IDBENEFICIO').AsInteger,
                                      sqlDemonstra.FieldByName('IDTITULAR').AsInteger,
                                      qryBenefFuncef.FieldByName('DIB').AsString )
  else
     dValorNaDib := qryBenefFuncef.FieldByName('VALORNADIB').AsCurrency;

  lbl_vlrOriginal1.caption := 'R$ '+FormatFloat('#,#0.00', dValorNaDib);

end;


procedure TRptDemonstraBeneficios.lbl_vlrOriginal2Print(Sender: TObject);
var
  dValorNaDib : double;
begin
  inherited;
  {calcular Beneficio Original}
  if sqlDemonstra.FieldByName('TIPORECEBE').AsString = 'APOSENTADO'  then
     dValorNaDib := PegaValorIntegral(dtmAPrev.qry,
                                      sqlDemonstra.FieldByName('NumeroProcesso').AsInteger,
                                      qryBenefINSS.FieldByName('IDBENEFICIO').AsInteger,
                                      sqlDemonstra.FieldByName('IDTITULAR').AsInteger,
                                      qryBenefINSS.FieldByName('DIB').AsString )
  else
     dValorNaDib := qryBenefINSS.FieldByName('VALORNADIB').AsCurrency;

  lbl_vlrOriginal2.caption := 'R$ '+FormatFloat('#,#0.00', dValorNaDib);

end;


procedure TRptDemonstraBeneficios.qryBenefFuncefAfterScroll(DataSet: TDataSet);
begin
  inherited;
  {Apresenta BS e FAB}
  lblBSAtu1.Visible  := qryBenefFuncef.FieldByName('FLGAPRESENTABSFAB').AsInteger = 1;
  lblBSTot1.Visible  := qryBenefFuncef.FieldByName('FLGAPRESENTABSFAB').AsInteger = 1;
  lblFABAtu1.Visible := qryBenefFuncef.FieldByName('FLGAPRESENTABSFAB').AsInteger = 1;
  lblFABTot1.Visible := qryBenefFuncef.FieldByName('FLGAPRESENTABSFAB').AsInteger = 1;

  ppDbBSAtu1.Visible  := qryBenefFuncef.FieldByName('FLGAPRESENTABSFAB').AsInteger = 1;
  ppDbBSTot1.Visible  := qryBenefFuncef.FieldByName('FLGAPRESENTABSFAB').AsInteger = 1;
  ppDbFABAtu1.Visible := qryBenefFuncef.FieldByName('FLGAPRESENTABSFAB').AsInteger = 1;
  ppDbFABTot1.Visible := qryBenefFuncef.FieldByName('FLGAPRESENTABSFAB').AsInteger = 1;

  {apresenta Deficit}
  lblDeficit1.Visible  := qryBenefFuncef.FieldByName('FLGAPRESENTADEFICIT').AsInteger = 1;
  ppDBDeficit1.Visible := qryBenefFuncef.FieldByName('FLGAPRESENTADEFICIT').AsInteger = 1;

  {arruma disposicao}
  if qryBenefFuncef.FieldByName('FLGAPRESENTABSFAB').AsInteger = 0 then
  begin
    lblVlrAtual1.Left := lblBSAtu1.Left;
    lblVlrTotal1.Left := lblBSTot1.Left;
  end
  else
  begin
    lblVlrAtual1.Left := lbl_DtNova1.Left;
    lblVlrTotal1.Left := lbl_DtNova1.Left;
  end;

  if qryBenefFuncef.FieldByName('FLGAPRESENTADEFICIT').AsInteger = 0 then
    VlrOriginal1.Left := lblDeficit1.left
  else
    VlrOriginal1.Left := lbl_DtNova1.Left;

  ppDbVlrAtual1.Left := lblVlrAtual1.Left + lblVlrAtual1.Width + 0.53;
  ppDbVlrTotal1.Left := lblVlrTotal1.Left + lblVlrTotal1.Width + 0.53;
  lbl_vlrOriginal1.Left := VlrOriginal1.Left + VlrOriginal1.width + 0.53;

end;


procedure TRptDemonstraBeneficios.ppHCARodapeBeforePrint(Sender: TObject);
begin
  inherited;
  lblAvisoContrib.visible := bAlgumPagadorPatro;
end;


procedure TRptDemonstraBeneficios.ppHCVlrDescPrint(Sender: TObject);
begin
  inherited;
  if qryHstContrib.FieldByName('FLGPAGADOR').AsString <> 'C' then
  begin
    ppHCVlrDesc.Caption := ppHCVlrDesc.Caption + ' (*)';
    bAlgumPagadorPatro := true;
  end;
end;


procedure TRptDemonstraBeneficios.ppHCVlrPagPrint(Sender: TObject);
begin
  inherited;
  if qryHstContrib.FieldByName('FLGPAGADOR').AsString <> 'C' then
  begin
    ppHCVlrPag.Caption := ppHCVlrPag.Caption + ' (*)';
    bAlgumPagadorPatro := true;
  end;
end;

procedure TRptDemonstraBeneficios.ppDetailBand1BeforePrint(Sender: TObject);
begin
  inherited;

  imprimiuRodapteGrupoRelatorio := false;

  {Benefícios FUNCEF}
  qryBenefFuncef.Close;
  qryBenefFuncef.ParamByName('NUMEROPROCESSO').AsInteger := sqlDemonstra.FieldByName('NumeroProcesso').AsInteger;
  qryBenefFuncef.ParamByName('DATANOVA').AsString        := CmpRptCM.ParamValues[1].AsString;
  qryBenefFuncef.ParamByName('IDPESSOA').Asinteger       := sqlDemonstra.FieldByName('IdPessoa').AsInteger;
  qryBenefFuncef.Open;

  {Benefícios INSS}
  qryBenefInss.Close;
  qryBenefInss.ParamByName('NUMEROPROCESSO').AsInteger := sqlDemonstra.FieldByName('NumeroProcesso').AsInteger;
  qryBenefInss.ParamByName('DATANOVA').AsString        := CmpRptCM.ParamValues[1].AsString;
  qryBenefInss.ParamByName('IDPESSOA').Asinteger       := sqlDemonstra.FieldByName('IdPessoa').AsInteger;
  qryBenefInss.Open;

  {Valores a pagar/receber}
  qryHstBenef.Close;
  qryHstBenef.ParamByName('NUMEROPROCESSO').AsInteger := sqlDemonstra.FieldByName('NumeroProcesso').AsInteger;
  qryHstBenef.ParamByName('IDPESSOA').Asinteger       := sqlDemonstra.FieldByName('IdPessoa').AsInteger;
  qryHstBenef.ParamByName('IDLOTE').AsInteger         := CmpRptCM.ParamValues[3].AsInteger;
  qryHstBenef.Open;

  {Contribuições}
  bAlgumPagadorPatro := false;

  {contribuições apenas para Funcef}
  if sqlDemonstra.FieldByName('FONTEPAGADORA').AsInteger = 1  then
  begin
    if sqlDemonstra.FieldByName('TIPORECEBE').AsString = 'APOSENTADO'  then
    begin
      qryHstContrib.Close;
      qryHstContrib.ParamByName('idpessoa').AsInteger    := sqlDemonstra.FieldByName('IdPessoa').AsInteger;
      qryHstContrib.ParamByName('IDPESSJUR').AsInteger   := sqlDemonstra.FieldByName('IdPessJur').AsInteger;
      qryHstContrib.ParamByName('IDPLANOPREV').AsInteger := sqlDemonstra.FieldByName('IdPlanoPrev').AsInteger;
      qryHstContrib.ParamByName('SEQPROPOSTA').AsInteger := sqlDemonstra.FieldByName('SeqProposta').AsInteger;
      qryHstContrib.ParamByName('IDLOTE').AsInteger      := CmpRptCM.ParamValues[3].AsInteger;
      qryHstContrib.ParamByName('DTINICIOPROCESSO').AsDateTime := StrToDateTime(CmpRptCM.ParamValues[6].AsString);
      qryHstContrib.Open;
      TotalizaContrib(qryHstContrib); // Andre Imakawa - SIG 121019
      bTemContribuicoes       := not qryHstContrib.eof;
      SubRelHstContrA.visible := true;
      SubRelAcJud.Visible     := true; // Alterado por FHBS - 12/09/2019 - SIG50850

      // Alterado por FHBS - 12/09/2019 - SIG50850
      qryAcJudDeficit.Close;
      qryAcJudDeficit.SQL.Clear;
      qryAcJudDeficit.SQL.Add('SELECT DISTINCT C.IDCONTRIBUICAO, C.NOME');
      qryAcJudDeficit.SQL.Add('      ,AC.PERCACJUDDEFICIT');
      qryAcJudDeficit.SQL.Add('      ,AC.ANOMESINIACJUDDEFICIT');
      qryAcJudDeficit.SQL.Add('      ,AC.ANOMESFIMACJUDDEFICIT');
      qryAcJudDeficit.SQL.Add('  FROM CONTRIBUICAO C');
      qryAcJudDeficit.SQL.Add('      ,CONTPREV CP');
      qryAcJudDeficit.SQL.Add('      ,HSTCONTRIBPREV HST');
      qryAcJudDeficit.SQL.Add('      ,CONTRIBPARTPACJUDDEFICIT AC');
      qryAcJudDeficit.SQL.Add(' WHERE HST.IDPESSJUR = :IDPESSJUR');
      qryAcJudDeficit.SQL.Add('   AND HST.IDPLANOPREV = :IDPLANOPREV');
      qryAcJudDeficit.SQL.Add('   AND HST.SEQPROPOSTA = :SEQPROPOSTA');
      qryAcJudDeficit.SQL.Add('   AND HST.IDLOTE = :IDLOTE');
      qryAcJudDeficit.SQL.Add('   AND HST.IDPESSOA = :IDPESSOA');
      qryAcJudDeficit.SQL.Add('   AND hst.trgdtinclusao >= :DTINICIOPROCESSO');
      qryAcJudDeficit.SQL.Add('   AND HST.FLGDESCFOLHA = 1');
      qryAcJudDeficit.SQL.Add('   AND HST.FLGCONCESSAO = 1');
      qryAcJudDeficit.SQL.Add('   AND C.IDCONTRIBUICAO = HST.IDCONTRIBUICAO');
      qryAcJudDeficit.SQL.Add('   AND CP.IDPLANOPREV = HST.IDPLANOPREV');
      qryAcJudDeficit.SQL.Add('   AND CP.IDCONTRIBUICAO = HST.IDCONTRIBUICAO');
      qryAcJudDeficit.SQL.Add('   AND AC.IDCONTRIBUICAO = HST.IDCONTRIBUICAO');
      qryAcJudDeficit.SQL.Add('   AND AC.IDPESSJUR = HST.IDPESSJUR');
      qryAcJudDeficit.SQL.Add('   AND AC.IDPLANOPREV = HST.IDPLANOPREV');
      qryAcJudDeficit.SQL.Add('   AND AC.IDPESSOA = HST.IDPESSOA');
      qryAcJudDeficit.SQL.Add('   AND AC.SEQPROPOSTA = HST.SEQPROPOSTA');
      qryAcJudDeficit.SQL.Add('   AND HST.MESREFERENCIA BETWEEN AC.ANOMESINIACJUDDEFICIT AND NVL(AC.ANOMESFIMACJUDDEFICIT, TO_CHAR(SYSDATE, ''YYYY/MM''))');
      qryAcJudDeficit.SQL.Add(' ORDER BY C.IDCONTRIBUICAO, AC.ANOMESINIACJUDDEFICIT');

      qryAcJudDeficit.ParamByName('IDPESSOA').AsInteger          := qryHstContrib.ParamByName('IDPESSOA').AsInteger;
      qryAcJudDeficit.ParamByName('IDPESSJUR').AsInteger         := qryHstContrib.ParamByName('IDPESSJUR').AsInteger;
      qryAcJudDeficit.ParamByName('IDPLANOPREV').AsInteger       := qryHstContrib.ParamByName('IDPLANOPREV').AsInteger;
      qryAcJudDeficit.ParamByName('SEQPROPOSTA').AsInteger       := qryHstContrib.ParamByName('SEQPROPOSTA').AsInteger;
      qryAcJudDeficit.ParamByName('IDLOTE').AsInteger            := qryHstContrib.ParamByName('IDLOTE').AsInteger;
      qryAcJudDeficit.ParamByName('DTINICIOPROCESSO').AsDateTime := qryHstContrib.ParamByName('DTINICIOPROCESSO').AsDateTime;

      qryAcJudDeficit.Open;
      // Fim - Alterado por FHBS - 12/09/2019 - SIG50850

    end
    else
    begin
      qryHstContribP.Close;
      qryHstContribP.ParamByName('idpessoa').AsInteger    := sqlDemonstra.FieldByName('IdPessoa').AsInteger;
      qryHstContribP.ParamByName('IDPESSJUR').AsInteger   := sqlDemonstra.FieldByName('IdPessJur').AsInteger;
      qryHstContribP.ParamByName('IDPLANOPREV').AsInteger := sqlDemonstra.FieldByName('IdPlanoPrev').AsInteger;
      qryHstContribP.ParamByName('SEQPROPOSTA').AsInteger := sqlDemonstra.FieldByName('SeqProposta').AsInteger;
      qryHstContribP.ParamByName('IDLOTE').AsInteger      := CmpRptCM.ParamValues[3].AsInteger;
      qryHstContribP.ParamByName('DTINICIOPROCESSO').AsDateTime := StrToDateTime(CmpRptCM.ParamValues[6].AsString);
      qryHstContribP.Open;
      TotalizaContrib(qryHstContribP); // Andre Imakawa - SIG 121019
      bTemContribuicoes       := not qryHstContribP.eof;
      SubRelHstContrP.visible := true;
      SubRelAcJud.Visible     := true; // Alterado por FHBS - 12/09/2019 - SIG50850

      // Alterado por FHBS - 12/09/2019 - SIG50850
      qryAcJudDeficit.Close;
      qryAcJudDeficit.SQL.Clear;
      qryAcJudDeficit.SQL.Add('SELECT DISTINCT C.IDCONTRIBUICAO, C.NOME');
      qryAcJudDeficit.SQL.Add('      ,AC.PERCACJUDDEFICIT');
      qryAcJudDeficit.SQL.Add('      ,AC.ANOMESINIACJUDDEFICIT');
      qryAcJudDeficit.SQL.Add('      ,AC.ANOMESFIMACJUDDEFICIT');
      qryAcJudDeficit.SQL.Add('  FROM CONTRIBUICAO C');
      qryAcJudDeficit.SQL.Add('      ,CONTPREV CP');
      qryAcJudDeficit.SQL.Add('      ,HSTCONTRIBPREV HST');
      qryAcJudDeficit.SQL.Add('      ,CONTRIBPREVNUCLEO CPN');
      qryAcJudDeficit.SQL.Add('      ,CONTRIBNUCLEOACJUDDEFICIT AC');
      qryAcJudDeficit.SQL.Add(' WHERE HST.IDPESSJUR = :IDPESSJUR');
      qryAcJudDeficit.SQL.Add('   AND HST.IDPLANOPREV = :IDPLANOPREV');
      qryAcJudDeficit.SQL.Add('   AND HST.SEQPROPOSTA = :SEQPROPOSTA');
      qryAcJudDeficit.SQL.Add('   AND HST.IDLOTE = :IDLOTE');
      qryAcJudDeficit.SQL.Add('   AND HST.IDPESSOA = :IDPESSOA');
      qryAcJudDeficit.SQL.Add('   AND hst.trgdtinclusao >= :DTINICIOPROCESSO');
      qryAcJudDeficit.SQL.Add('   AND HST.FLGDESCFOLHA = 1');
      qryAcJudDeficit.SQL.Add('   AND HST.FLGCONCESSAO = 1');
      qryAcJudDeficit.SQL.Add('   AND HST.SITRECEBIMENTO <= 1');
      qryAcJudDeficit.SQL.Add('   AND CP.IDPLANOPREV = HST.IDPLANOPREV');
      qryAcJudDeficit.SQL.Add('   AND CP.IDCONTRIBUICAO = HST.IDCONTRIBUICAO');
      qryAcJudDeficit.SQL.Add('   AND C.IDCONTRIBUICAO = HST.IDCONTRIBUICAO');
      qryAcJudDeficit.SQL.Add('   AND AC.IDCONTRIBUICAO = CPN.IDCONTRIBUICAO');
      qryAcJudDeficit.SQL.Add('   AND AC.IDNUCLEOFAMILIAR = CPN.IDNUCLEOFAMILIAR');
      qryAcJudDeficit.SQL.Add('   AND AC.IDCONTRIBUICAO = HST.IDCONTRIBUICAO');
      qryAcJudDeficit.SQL.Add('   AND CPN.IDPLANOPREV = HST.IDPLANOPREV');
      qryAcJudDeficit.SQL.Add('   AND CPN.IDPESSJUR = HST.IDPESSJUR');
      qryAcJudDeficit.SQL.Add('   AND CPN.IDPESSOA = HST.IDPESSOA');
      qryAcJudDeficit.SQL.Add('   AND CPN.SEQPROPOSTA = HST.SEQPROPOSTA');
      qryAcJudDeficit.SQL.Add('   AND HST.MESREFERENCIA BETWEEN AC.ANOMESINIACJUDDEFICIT AND NVL(AC.ANOMESFIMACJUDDEFICIT, TO_CHAR(SYSDATE, ''YYYY/MM''))');
      qryAcJudDeficit.SQL.Add(' ORDER BY C.IDCONTRIBUICAO, AC.ANOMESINIACJUDDEFICIT');

      qryAcJudDeficit.ParamByName('IDPESSOA').AsInteger          := qryHstContribP.ParamByName('IDPESSOA').AsInteger;
      qryAcJudDeficit.ParamByName('IDPESSJUR').AsInteger         := qryHstContribP.ParamByName('IDPESSJUR').AsInteger;
      qryAcJudDeficit.ParamByName('IDPLANOPREV').AsInteger       := qryHstContribP.ParamByName('IDPLANOPREV').AsInteger;
      qryAcJudDeficit.ParamByName('SEQPROPOSTA').AsInteger       := qryHstContribP.ParamByName('SEQPROPOSTA').AsInteger;
      qryAcJudDeficit.ParamByName('IDLOTE').AsInteger            := qryHstContribP.ParamByName('IDLOTE').AsInteger;
      qryAcJudDeficit.ParamByName('DTINICIOPROCESSO').AsDateTime := qryHstContribP.ParamByName('DTINICIOPROCESSO').AsDateTime;

      qryAcJudDeficit.Open;
      // Fim - Alterado por FHBS - 12/09/2019 - SIG50850
      
    end;

    SubRelAcJud.Visible := (Sistema.IdModulo = 454) and (not qryAcJudDeficit.isEmpty); // Alterado por FHBS - 31/10/2019 - SIG50850;

  end
  else
  begin
    SubRelHstContrA.visible := false;
    SubRelHstContrP.visible := false;
    qryAcJudDeficit.Close; // Alterado por FHBS - 31/10/2019 - SIG50850
    SubRelAcJud.Visible := false; // Alterado por FHBS - 12/09/2019 - SIG50850
  end;


 {Legenda dos Planos}
  qryLegenda.Close;
  qryLegenda.ParamByName('IDPESSJUR').Asinteger   := sqlDemonstra.FieldByName('IdPessJur').AsInteger;
  qryLegenda.ParamByName('IDPESSOA').Asinteger    := sqlDemonstra.FieldByName('IdPessoa').AsInteger;
  qryLegenda.ParamByName('IDLOTE').Asinteger      := CmpRptCM.ParamValues[3].AsInteger;
  qryLegenda.Open;





end;


procedure TRptDemonstraBeneficios.ppHCVlrPagPPrint(Sender: TObject);
begin
  inherited;
  if qryHstContribP.FieldByName('FLGPAGADOR').AsString <> 'C' then
  begin
    ppHCVlrPagP.Caption := ppHCVlrPagP.Caption + ' (*)';
    bAlgumPagadorPatro := true;
  end;
end;


procedure TRptDemonstraBeneficios.ppHCVlrDescPPrint(Sender: TObject);
begin
  inherited;
  if qryHstContribP.FieldByName('FLGPAGADOR').AsString <> 'C' then
  begin
    ppHCVlrDesc.Caption := ppHCVlrDesc.Caption + ' (*)';
    bAlgumPagadorPatro := true;
  end;
end;


procedure TRptDemonstraBeneficios.ppHCPRodadeBeforePrint(Sender: TObject);
begin
  inherited;
  lblAvisoContribP.visible := bAlgumPagadorPatro;
end;

procedure TRptDemonstraBeneficios.ppBndTotalBeforePrint(Sender: TObject);
begin
  inherited;
  lbl_totalBenef.caption    := 'R$ '+FormatFloat('#,#0.00', rTotalBeneficio);
  lbl_vlrtotContrib.caption := 'R$ '+FormatFloat('#,#0.00', rTotalContribuicao);

end;

procedure TRptDemonstraBeneficios.ppBndTotalAfterPrint(Sender: TObject);
begin
  inherited;
  rTotalBeneficio    := 0;
  rTotalContribuicao := 0;
end;

procedure TRptDemonstraBeneficios.ppDetailBand6BeforePrint(Sender: TObject);
begin
  inherited;
  rTotalBeneficio := rTotalBeneficio + qryHstBenef.FieldByName('VALORPREV').AsCurrency;
end;

procedure TRptDemonstraBeneficios.ppDetailBand7BeforePrint(Sender: TObject);
begin
  inherited;
  // Andre Imakawa - SIG 121019 - Inicio
  {
  rTotalContribuicao := rTotalContribuicao + qryHstContrib.FieldByName('VLRDEVOLVER').AsCurrency -
                                             qryHstContrib.FieldByName('VLRCOBRAR').AsCurrency;
  }
  // Andre Imakawa - SIG 121019 - Fim  
end;

procedure TRptDemonstraBeneficios.ppDetailBand8BeforePrint(Sender: TObject);
begin
  inherited;
  // Andre Imakawa - SIG 121019 - Inicio  
  {
  rTotalContribuicao := rTotalContribuicao + qryHstContribP.FieldByName('VLRDEVOLVER').AsCurrency -
                                             qryHstContribP.FieldByName('VLRCOBRAR').AsCurrency;
  }                                     
  // Andre Imakawa - SIG 121019 - Fim         
end;

procedure TRptDemonstraBeneficios.ppVlrFABGetText(Sender: TObject; var Text: String);
begin
  if qryHstBenef.FieldbyName('FLGAPRESENTABSFAB').AsInteger = 0 then
     Text := '';
end;

procedure TRptDemonstraBeneficios.ppVlrBSGetText(Sender: TObject; var Text: String);
begin
  if qryHstBenef.FieldbyName('FLGAPRESENTABSFAB').AsInteger = 0 then
     Text := '';
end;

procedure TRptDemonstraBeneficios.ppVlrDeficitGetText(Sender: TObject; var Text: String);
begin
  if qryHstBenef.FieldbyName('FLGAPRESENTADEFICIT').AsInteger = 0 then
     Text := '';
end;

procedure TRptDemonstraBeneficios.SubRelTotalPrint(Sender: TObject);
begin
  inherited;

  if (bTemContribuicoes) then
  begin
    lbl_totContrib.Visible    := sqlDemonstra.FieldByName('FONTEPAGADORA').AsInteger = 1;
    lbl_vlrtotContrib.visible := sqlDemonstra.FieldByName('FONTEPAGADORA').AsInteger = 1;

    if sqlDemonstra.FieldByName('FONTEPAGADORA').AsInteger = 2 then
       ppBndTotal.Height := 7.171
    else
    begin
      ppBndTotal.Height := 12.171;
      ppLinhaTot.Top    := 10.583;
      lbl_totContrib.Top := 5.821;
      lbl_vlrtotContrib.Top := 5.821;
    end
  end
  else
  begin
    lbl_vlrtotContrib.visible := False;
    lbl_totContrib.Visible    := False;
    ppBndTotal.Height := 7.171
  end;

end;

procedure TRptDemonstraBeneficios.ppGroupFooterBand2AfterPrint(Sender: TObject);
begin
  inherited;
  imprimiuRodapteGrupoRelatorio := true;
end;

// edilaine - SOL 253577-18174 / PPM 1327585 - inicio
procedure TRptDemonstraBeneficios.SalvarArquivoDemonstrativo;
var
   sCaminho, vBuffer, sNomeArq : string;
begin
  sCaminho := CaminhoParaSalvarArquivo(sqlDemonstra.FieldByName('MATRICULATIT').AsString,
                                       sqlDemonstra.FieldByName('MATRICULA').AsString);

  sNomeArq := 'Demonstrativo de '+CmpRptCM.ParamValues[0].AsString+' de Benefício - ' + sqlDemonstra.FieldByName('Matricula').AsString + ' - ' + FormatDateTime('DD-MM-YYYY' + ' - ' + 'HH-MM-SS', Now)+' - Confirmado';

  vBuffer := sCaminho + '\' + sNomeArq  + '.PDF';

  rpDemonstraBeneficios.DeviceType       := 'PDFFile';
  rpDemonstraBeneficios.AllowPrintToFile := True;
  rpDemonstraBeneficios.ShowPrintDialog  := False;
  rpDemonstraBeneficios.TextFileName     := vBuffer;
  rpDemonstraBeneficios.print;
  
  ShellExecute(Application.Handle, nil, PChar(vBuffer), nil, nil, SW_SHOWNORMAL);

end;


procedure TRptDemonstraBeneficios.rpDemonstraBeneficiosBeforePrint(
  Sender: TObject);
begin
  inherited;

  // edilaine - SOL 253577-18174 / PPM 1327585 - inicio
  
  // Paulo Nobre - WO23998 - Inicio
  //  lbl_usuario.Caption := Sistema.NomeUsuario;
  lbl_usuario.Caption := UBeneficio.RetornaNomePessoaXUsuarioSistema(Sistema.IdUsuario);
  // Paulo Nobre - WO23998 - Fim

  // título do relatório
  lbl_Titulo.caption := 'Demonstrativo de '+ CmpRptCM.ParamValues[0].AsString +' de Benefícios';
  lbl_Rodape.caption := lbl_Titulo.caption;

  if Trim(CmpRptCM.ParamValues[5].AsString) <> '' then
  begin
    SubRelSituacao.Visible := true;
    ppSituacao.Caption  := CmpRptCM.ParamValues[5].AsString;

    if Trim(CmpRptCM.ParamValues[7].AsString) <> '' then
    begin
      lblMotivo.Caption := Trim(CmpRptCM.ParamValues[4].AsString);
      ppMotivo.Caption  := Trim(CmpRptCM.ParamValues[7].AsString);
      ppMotivo.left     := lblMotivo.left + lblMotivo.width + 1.350;
    end
    else
    begin
      lblMotivo.visible := false;
      ppMotivo.visible  := false;
      ppLinSit.Top      := lblMotivo.Top;
    end;

    {linha do SubRelTotal}
    ppLinhaTot.visible  := false;
  end
  else
  begin
    SubRelSituacao.Visible := false;
    ppLinhaTot.visible     := true;
  end;

  lbl_DtNova1.caption := 'Data de '+ CmpRptCM.ParamValues[0].AsString +': ';
  ppDtNova1.left := lbl_DtNova1.left + lbl_DtNova1.width + 1.250;

  lbl_DtNova2.caption := 'Data de '+ CmpRptCM.ParamValues[0].AsString + ': ';
  ppDtNova2.left := lbl_DtNova2.left + lbl_DtNova2.width + 1.250;
  // edilaine - SOL 253577-18174 / PPM 1327585 - inicio - fim

  // Alterado por FHBS - 12/09/2019 - SIG50850
  ppLabelVersao.Caption := 'Versão do Módulo: V' + Sistema.Versao;
  if FazQuery( qryAuxLote, 'SELECT DESCRICAO FROM CTRLINTERFACE WHERE IDLOTE = ' + IntToStr(CmpRptCM.ParamValues[3].AsInteger)) then
    ppLabelLote.Caption := 'Lote: ' + qryAuxLote.Fields[0].asString
  else
    ppLabelLote.Caption := '';

  ppLabelVersao.Visible := (Sistema.IdModulo = 454); // Alterado por FHBS - 13/09/2019 - SIG50850;
  ppLabelLote.Visible   := (Sistema.IdModulo = 454); // Alterado por FHBS - 13/09/2019 - SIG50850;
  // Fim - Alterado por FHBS - 12/09/2019 - SIG50850
  
end;


procedure TRptDemonstraBeneficios.AbreConsultas;
begin

  {abre consulta principal}
  sqlDemonstra.Close;
  sqlDemonstra.Sql.Text := StringReplace( sqlDemonstra.Sql.Text, '&NUMEROPROCESSO', CmpRptCM.ParamValues[2].AsString, [rfReplaceAll]);
  sqlDemonstra.ParamByName('pIDPESSOA').AsInteger := CmpRptCM.ParamValues[8].AsInteger;
  sqlDemonstra.ParamByName('pIDPERFIL').AsInteger := CmpRptCM.ParamValues[9].AsInteger;   //edilaine - SIG55933
  sqlDemonstra.Open;


end;
// edilaine - SOL 253577-18174 / PPM 1327585 - fim

// Andre Imakawa - SIG 121019 - Inicio
procedure TRptDemonstraBeneficios.SubRelHstBenefPrint(Sender: TObject);
begin
  inherited;

  //Luiz Carlos - SIG63991 - Inicio
  if (qryHstBenef.FieldbyName('FLGAPRESENTABSFAB').AsInteger = 0) and
     (qryHstBenef.FieldbyName('FLGAPRESENTADEFICIT').AsInteger = 0) then
  begin
     linha4.visible := False;
     linha5.visible := False;
     lblFAB.Visible := False;
     lblBS.Visible  := False;
     lblBaseDeficit.Visible := False;
     lblValorBeneficio.Left := 176;
     ppvlbenef.left         := 183;
     linha6.left            := 176;
  end
  else
  begin
     linha4.visible := True;
     linha5.visible := True;
     lblFAB.Visible := True;
     lblBS.Visible  := True;
     lblBaseDeficit.Visible := True;
     lblValorBeneficio.Left := 157;
     ppvlbenef.left         := 163;
     linha6.left            := 179;
  end
  //Luiz Carlos - SIG63991 - Fim
end;

// Andre Imakawa - SIG 121019 - Inicio
procedure TRptDemonstraBeneficios.TotalizaContrib(qryContriAux: TwwQuery);
var

  sSQL   : string;
  oDados : OleVariant;
  qryAux : TwwQuery;
begin
  qryAux := TwwQuery.Create(Application);


  try
    if not(qryContriAux.IsEmpty) then
    begin
      qryAux.DatabaseName := 'BaseDados';
      qryAux.Params.Clear;
      qryAux.Params.CreateParam(ftInteger,   'IDPESSOA',        ptinput);
      qryAux.Params.CreateParam(ftInteger,   'IDPESSJUR', ptinput);
      qryAux.Params.CreateParam(ftInteger,   'IDPLANOPREV', ptinput);
      qryAux.Params.CreateParam(ftInteger,   'SEQPROPOSTA', ptinput);
      qryAux.Params.CreateParam(ftInteger,   'IDLOTE', ptinput);
      qryAux.Params.CreateParam(ftDateTime,  'DTINICIOPROCESSO', ptinput);


      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add('SELECT SUM(X.VLRDEVOLVER) AS VLRDEVOLVER, SUM(X.VLRCOBRAR) AS VLRCOBRAR FROM ( ');
      qryAux.Sql.Add( qryContriAux.sql.gettext );
      qryAux.Sql.Add(') X ');
      qryAux.ParamByName('IDPESSOA').AsInteger    := sqlDemonstra.FieldByName('IdPessoa').AsInteger;
      qryAux.ParamByName('IDPESSJUR').AsInteger   := sqlDemonstra.FieldByName('IdPessJur').AsInteger;
      qryAux.ParamByName('IDPLANOPREV').AsInteger := sqlDemonstra.FieldByName('IdPlanoPrev').AsInteger;
      qryAux.ParamByName('SEQPROPOSTA').AsInteger := sqlDemonstra.FieldByName('SeqProposta').AsInteger;
      qryAux.ParamByName('IDLOTE').AsInteger      := CmpRptCM.ParamValues[3].AsInteger;
      qryAux.ParamByName('DTINICIOPROCESSO').AsDateTime := StrToDateTime(CmpRptCM.ParamValues[6].AsString);

      qryAux.Open;
      if not qryAux.Eof then
        rTotalContribuicao := qryAux.Fields[0].AsCurrency - qryAux.Fields[1].AsCurrency;
    end;



  finally
    FreeAndNil(qryAux);
  end;

end;
// Andre Imakawa - SIG 121019 - Fim

end.


