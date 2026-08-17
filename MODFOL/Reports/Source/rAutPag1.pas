{******************************************************************************}
{  Sistema - Contas a Receber                                                    }
{                                                 }
{******************************************************************************

  N. Sol..........: 178983
  N. Kintana......: 1656753
  Data............: 20/07/2012
  Responsável.....: Douglas.Siqueira
  Descrição.......: criação do relatório Aviso de Recebimento - AR
}

Unit rAutPag1;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, DBClient, ppDB,
  ppDBPipe, ppDBBDE, Db, Wwdatsrc, ppBands, ppMemo, ppClass, ppCtrls,
  ppVar, ppRegion, ppStrtch, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd,
  ppReport, DBTables, uCMClientDataSet, uCmSqlParams, ppTypes,
  uCtrlRelatoriosCAPCAR, uCtrlDocumento, uCtrlParamIntegra, Mask , Math,
  TXRB, ppSubRpt, StdCtrls, ppModule, raCodMod, ppParameter;

Type
  TRptAutPag1 = Class(TFrmCmReport)
    Dsautpagdoc: TwwDataSource;
    Ppautpagdoc: TppBDEPipeline;
    Rptautpagdoc: TppReport;
    CdsDemGestAutPag: TClientDataSet;
    CdsDemGestAutPagNUMFATURA: TFloatField;
    CdsDemGestAutPagCODDOCUMENTO: TFloatField;
    CdsDemGestAutPagNUMAPGR: TFloatField;
    CdsDemGestAutPagREFERENCIA: TStringField;
    CdsDemGestAutPagNODOCUMENTO: TFloatField;
    CdsDemGestAutPagCOMPLDOCUMENTO: TStringField;
    CdsDemGestAutPagDATAVENCTO: TDateTimeField;
    CdsDemGestAutPagNUMDOCUMENTO: TStringField;
    CdsDemGestAutPagVALOR: TFloatField;
    CdsDemGestAutPagVALOROUTRAMOEDA: TFloatField;
    CdsDemGestAutPagRAZAOSOCIAL: TStringField;
    CdsDemGestAutPagDESCRICAO: TStringField;
    CdsDemGestAutPagVALORRATEIO: TFloatField;
    CdsDemGestAutPagDESCTDR: TStringField;
    CdsDemGestAutPagNOMEAP: TStringField;
    CdsDemGestAutPagNOMECR: TStringField;
    CdsDemGestAutPagNOMECC: TStringField;
    CdsDemGestAutPagOBS: TMemoField;
    CdsDemGestAutPagNUMBANCO: TStringField;
    CdsDemGestAutPagNUMAGENCIA: TStringField;
    CdsDemGestAutPagCONTACORRENTE: TStringField;
    CdsDemGestAutPagFLGDOCBANCARIO: TStringField;
    CdsDemGestAutPagVLACRE: TFloatField;
    CdsDemGestAutPagVLDEC: TFloatField;
    CdsDemGestAutPagVLIMP: TFloatField;
    CdsDemGestAutPagVLLIQ: TFloatField;
    CdsDemGestAutPagTRGUSERINCLUSAO: TStringField;
    CdsDemGestAutPagNOMEUSUARIO: TStringField;
    CdsDemGestAutPagTRGDTINCLUSAO: TDateTimeField;
    CdsDemGestAutPagTOTVALORBRUTO: TFloatField;
    CdsDemGestAutPagTOTVALORDEDUCOES: TFloatField;
    CdsDemGestAutPagTOTVALORACRESCIMO: TFloatField;
    CdsDemGestAutPagTOTVALORIMPOSTO: TFloatField;
    CdsDemGestAutPagTOTVALORAPAGAR: TFloatField;
    CdsDemGestAutPagSUMVALORBRUTO: TFloatField;
    CdsDemGestAutPagSUMVALORDEDUCOES: TFloatField;
    CdsDemGestAutPagSUMVALORACRESCIMO: TFloatField;
    CdsDemGestAutPagSUMVALORIMPOSTO: TFloatField;
    CdsDemGestAutPagSUMVALORAPAGAR: TFloatField;
    CdsDemGestAutPagNUMIMOVEL: TStringField;
    CdsDemGestAutPagNOMEPATRO: TStringField;
    CdsDemGestAutPagDESCPLANO: TStringField;
    CdsDemGestAutPagDESCPROGRAMA: TStringField;
    CdsDemGestAutPagDATAEMISSAO: TDateTimeField;
    CdsDemGestAutPagDATAPROGRAMADA: TDateTimeField;
    CdsDemGestAutPagIDFORCLI: TFloatField;
    CdsDemGestAutPagVALOLANCTOLIQ: TFloatField;
    CdsDemGestAutPagSUMVALOLANCTOLIQ: TFloatField;
    SqlAutPagDoc: TCMSqlParams;
    CdsAutPagDoc: TCMClientDataSet;
    SqlDemGestAutPag: TCMSqlParams;
    SqlNomeUsuario: TCMSqlParams;
    CdsNomeUsuario: TCMClientDataSet;
    CdsBuscaContaDocForn: TCMClientDataSet;
    SqlBuscaContaDocForn: TCMSqlParams;
    CdsBuscaContaDoc: TCMClientDataSet;
    SqlBuscaContaDoc: TCMSqlParams;
    CdsAlteraParcOrigem: TCMClientDataSet;
    SqlAlteraParcOrigem: TCMSqlParams;
    CdsAutPagDocAlt: TCMClientDataSet;
    SqlAutPagDocAlt: TCMSqlParams;
    SqlDocumFilhosAP: TCMSqlParams;
    CdsDocumFilhosAP: TCMClientDataSet;
    PpDocumFilhoAP: TppBDEPipeline;
    DsDocumFilhoAP: TwwDataSource;
    SqlDocumFilhoAR: TCMSqlParams;
    CdsDocumFilhosAR: TCMClientDataSet;
    PpDocumFilhoAR: TppBDEPipeline;
    DsDocumFilhoAR: TwwDataSource;
    CdsDocumFilhosARCODDOCUMENTO: TFloatField;
    CdsDocumFilhosARCARDOCUMENTO: TFloatField;
    CdsDocumFilhosARCODTIPRECDES: TStringField;
    CdsDocumFilhosARRECPAG: TStringField;
    CdsDocumFilhosARIDPESSOA: TFloatField;
    CdsDocumFilhosARIDRESERVAORCAMEN: TFloatField;
    CdsDocumFilhosARCODCENTRORESPON: TStringField;
    CdsDocumFilhosARCODEXTERNOCR: TStringField;
    CdsDocumFilhosARUNIDNEGOC: TFloatField;
    CdsDocumFilhosARMOECODIGO: TFloatField;
    CdsDocumFilhosARVALOR: TFloatField;
    CdsDocumFilhosARVALOROUTRAMOEDA: TFloatField;
    CdsDocumFilhosARPLACONTACREDITO: TStringField;
    CdsDocumFilhosARIDUSUARIOINCLUSAO: TFloatField;
    CdsDocumFilhosARNOME: TStringField;
    CdsDocumFilhosARNOME_1: TStringField;
    CdsDocumFilhosARCODCENTROCUSTO: TStringField;
    CdsDocumFilhosARCODEXTERNOCC: TStringField;
    CdsDocumFilhosARIDRATEIODOCUM: TFloatField;
    CdsDocumFilhosARDESCRICAO: TStringField;
    CdsDocumFilhosARMOESIGLA: TStringField;
    CdsDocumFilhosARNOMECENTROCUSTO: TStringField;
    CdsDocumFilhosARPLANO: TFloatField;
    CdsDocumFilhosARIDPATRO: TFloatField;
    CdsDocumFilhosARIDPROGRAMA: TFloatField;
    CdsDocumFilhosARFLGTIPOPROGRAMA: TStringField;
    CdsDocumFilhosARNUMIMOVEL: TStringField;
    CdsDocumFilhosARNOMEPATRO: TStringField;
    CdsDocumFilhosARDESCPLANO: TStringField;
    CdsDocumFilhosARDESCPROGRAMA: TStringField;
    CdsDocumFilhosARHITCODHIST: TStringField;
    CdsDocumFilhosARIDPLANOPREV: TFloatField;
    CdsDocumFilhosARNUMRESERVA: TFloatField;
    CdsDocumFilhosARFLGOBRIGARESERVA: TStringField;
    CdsDocumFilhosARNUMRESERVAOLD: TFloatField;
    CdsDocumFilhosARVALORRESERVAOLD: TFloatField;
    CdsDocumFilhosARVLRRESORCAMEN: TFloatField;
    CdsDocumFilhosARIDSEGREGACRITER: TFloatField;
    CdsDocumFilhosARCODSUBCONTA: TFloatField;
    CdsDocumFilhosARCODSUBCONTAPASS: TFloatField;
    CdsDocumFilhosARIDPLANOVIRTUAL: TFloatField;
    CdsDocumFilhosARIDSEGREGACONTR: TFloatField;
    CdsDocumFilhosARFLGOBRQTDECOTAS: TStringField;
    CdsDocumFilhosARIDPATROORIGEM: TFloatField;
    CdsDocumFilhosARIDPLANOORIGEM: TFloatField;
    CdsDocumFilhosARNOMEPATROORIGEM: TStringField;
    CdsDocumFilhosARDESCPLANOORIGEM: TStringField;
    CdsDocumFilhosAPCODDOCUMENTO: TFloatField;
    CdsDocumFilhosAPCAPDOCUMENTO: TFloatField;
    CdsDocumFilhosAPCODTIPRECDES: TStringField;
    CdsDocumFilhosAPRECPAG: TStringField;
    CdsDocumFilhosAPIDPESSOA: TFloatField;
    CdsDocumFilhosAPIDRESERVAORCAMEN: TFloatField;
    CdsDocumFilhosAPCODCENTRORESPON: TStringField;
    CdsDocumFilhosAPCODEXTERNOCR: TStringField;
    CdsDocumFilhosAPUNIDNEGOC: TFloatField;
    CdsDocumFilhosAPMOECODIGO: TFloatField;
    CdsDocumFilhosAPVALOR: TFloatField;
    CdsDocumFilhosAPVALOROUTRAMOEDA: TFloatField;
    CdsDocumFilhosAPPLACONTACREDITO: TStringField;
    CdsDocumFilhosAPIDUSUARIOINCLUSAO: TFloatField;
    CdsDocumFilhosAPNOME: TStringField;
    CdsDocumFilhosAPNOME_1: TStringField;
    CdsDocumFilhosAPCODCENTROCUSTO: TStringField;
    CdsDocumFilhosAPCODEXTERNOCC: TStringField;
    CdsDocumFilhosAPIDRATEIODOCUM: TFloatField;
    CdsDocumFilhosAPDESCRICAO: TStringField;
    CdsDocumFilhosAPMOESIGLA: TStringField;
    CdsDocumFilhosAPNOMECENTROCUSTO: TStringField;
    CdsDocumFilhosAPPLANO: TFloatField;
    CdsDocumFilhosAPIDPATRO: TFloatField;
    CdsDocumFilhosAPIDPROGRAMA: TFloatField;
    CdsDocumFilhosAPFLGTIPOPROGRAMA: TStringField;
    CdsDocumFilhosAPNUMIMOVEL: TStringField;
    CdsDocumFilhosAPNOMEPATRO: TStringField;
    CdsDocumFilhosAPDESCPLANO: TStringField;
    CdsDocumFilhosAPDESCPROGRAMA: TStringField;
    CdsDocumFilhosAPHITCODHIST: TStringField;
    CdsDocumFilhosAPIDPLANOPREV: TFloatField;
    CdsDocumFilhosAPNUMRESERVA: TFloatField;
    CdsDocumFilhosAPFLGOBRIGARESERVA: TStringField;
    CdsDocumFilhosAPNUMRESERVAOLD: TFloatField;
    CdsDocumFilhosAPVALORRESERVAOLD: TFloatField;
    CdsDocumFilhosAPVLRRESORCAMEN: TFloatField;
    CdsDocumFilhosAPIDSEGREGACRITER: TFloatField;
    CdsDocumFilhosAPCODSUBCONTA: TFloatField;
    CdsDocumFilhosAPCODSUBCONTAPASS: TFloatField;
    CdsDocumFilhosAPIDPLANOVIRTUAL: TFloatField;
    CdsDocumFilhosAPIDSEGREGACONTR: TFloatField;
    CdsDocumFilhosAPFLGOBRQTDECOTAS: TStringField;
    CdsDocumFilhosAPIDPATROORIGEM: TFloatField;
    CdsDocumFilhosAPIDPLANOORIGEM: TFloatField;
    CdsDocumFilhosAPNOMEPATROORIGEM: TStringField;
    CdsDocumFilhosAPDESCPLANOORIGEM: TStringField;
    ppParameterList1: TppParameterList;
    ppHeaderBand12: TppHeaderBand;
    ppLabel51: TppLabel;
    ppLabel53: TppLabel;
    ppDetailBand16: TppDetailBand;
    ppDBText28: TppDBText;
    ppDBText61: TppDBText;
    ppDBText62: TppDBText;
    ppDBText76: TppDBText;
    ppDBText77: TppDBText;
    ppDBText78: TppDBText;
    ppDBText79: TppDBText;
    ppFooterBand11: TppFooterBand;
    ppLabel54: TppLabel;
    ppCalc21: TppSystemVariable;
    ppCalc22: TppSystemVariable;
    ppGroup8: TppGroup;
    ppGroupHeaderBand8: TppGroupHeaderBand;
    ppLine27: TppLine;
    ppLine30: TppLine;
    ppLine31: TppLine;
    ppLine32: TppLine;
    ppLine33: TppLine;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel72: TppLabel;
    ppLabel80: TppLabel;
    ppDBText80: TppDBText;
    ppDBText81: TppDBText;
    ppDBText82: TppDBText;
    ppDBText88: TppDBText;
    ppDBText89: TppDBText;
    ppDBText90: TppDBText;
    ppLine34: TppLine;
    ppLabel81: TppLabel;
    ppLine35: TppLine;
    ppLine36: TppLine;
    ppLine37: TppLine;
    ppDBText91: TppDBText;
    ppDBText92: TppDBText;
    ppLine38: TppLine;
    ppLabel83: TppLabel;
    ppLabel86: TppLabel;
    ppLabel105: TppLabel;
    ppLabel106: TppLabel;
    ppLabel110: TppLabel;
    ppLine39: TppLine;
    ppLine40: TppLine;
    ppLine41: TppLine;
    ppLine43: TppLine;
    ppLine44: TppLine;
    ppLine45: TppLine;
    ppLabel111: TppLabel;
    ppLabel112: TppLabel;
    ppLabel113: TppLabel;
    ppLabel114: TppLabel;
    ppDBText93: TppDBText;
    ppDBText98: TppDBText;
    ppDBText99: TppDBText;
    ppDBText100: TppDBText;
    ppLabel115: TppLabel;
    ppLabel116: TppLabel;
    ppLabel117: TppLabel;
    ppGroupFooterBand8: TppGroupFooterBand;
    ppRegion1: TppRegion;
    ppLabel118: TppLabel;
    ppLine46: TppLine;
    ppLabel120: TppLabel;
    ppLine47: TppLine;
    ppLine48: TppLine;
    ppLabel125: TppLabel;
    ppLabel127: TppLabel;
    ppLabel129: TppLabel;
    ppDBText101: TppDBText;
    ppRegion2: TppRegion;
    ppLabel130: TppLabel;
    ppDBMemo1: TppDBMemo;
    ppRegion4: TppRegion;
    ppLabel131: TppLabel;
    ppDBText102: TppDBText;
    ppRegion5: TppRegion;
    ppCalc29: TppSystemVariable;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    SubDocumAR: TppSubReport;
    ppChildReport2: TppChildReport;
    ppDetailBand2: TppDetailBand;
    ppLabel15: TppLabel;
    ppDBText13: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppLabel26: TppLabel;
    ppLine2: TppLine;
    ppSummaryBand2: TppSummaryBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppDBCalc2: TppDBCalc;
    ppDBText14: TppDBText;
    ppLabel16: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    raCodeModule3: TraCodeModule;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppSubDocumFilhoAP: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDetailBand1: TppDetailBand;
    ppLabel3: TppLabel;
    ppDBText12: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLabel14: TppLabel;
    ppLine1: TppLine;
    raCodeModule1: TraCodeModule;
    ppLine3: TppLine;
    ppLabel4: TppLabel;
    ppDBText3: TppDBText;
    ppLabel12: TppLabel;
    ppLine4: TppLine;
    ppLabel13: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    PpautpagdocppField49: TppField;
    CdsDemGestAutPagDATALANCTO: TDateField;
    raCodeModule2: TraCodeModule;
    Procedure CrmRptCMBeforePrint(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure ppDBText92Format(Sender: TObject; DisplayFormat: String;
      DataType: TppDataType; Value: Variant; Var Text: String);
    procedure ppDBCalc1Print(Sender: TObject);
    procedure ppDBCalc2Print(Sender: TObject);
  private
    { Private declarations }
    sBanco, sAgencia, sAgenciaFormat, sNomeagencia, sNumeroFormat, sNomeBanco,
      sNumero, sDescTipo, sTipo, sMascaraAgencia, sMascaraConta, oldDoc: String;
    Id: double;
    rVLDEC, rVLACRE, rVLIMP, rVLLIQ: real;
    CtrlRelatoriosCAPCAR: TCtrlRelatoriosCAPCAR;
    Documento: TCtrlDocumento;
    // função de arredondamento de valores
    function  Arredonda(pNumero : double; pCasas : byte) : double;
 //   function  MostraParam(Form: string): boolean;

    Procedure montaregistro;
    Procedure BuscaContaDoc(CodDocumento: Real);
    Procedure GravaBancoAg;
  public
    { Public declarations }
  End;

Var
  RptAutPag1: TRptAutPag1;

Implementation

Uses dBaseDados, uString, uSistema;

{$R *.DFM}

{function TRptAutPag1.MostraParam(Form: string): boolean;
var frm : TForm;
begin
  if (UPPERCASE(Form)      = UpperCase('frmParamRelGerencial'))
  then frm := TfrmParamRelGerencial.Create(Application)
  Else if (UPPERCASE(Form)      = UpperCase('frmParamRelGerencial02'))
  then frm := TfrmParamRelGerencial02.Create(Application)
  Else if (UPPERCASE(Form)      = UpperCase('frmParamRelGerencial03'))
  then frm := TfrmParamRelGerencial03.Create(Application)
  Else if (UPPERCASE(Form)      = UpperCase('frmParamRelGerencial04'))
  then frm := TfrmParamRelGerencial04.Create(Application)
  Else if (UPPERCASE(Form)      = UpperCase('frmPRelConsolidaMovRes'))
  then frm := TfrmPRelConsolidaMovRes.Create(Application)
  //Marcio Sanches Spinosa SOL 172882 KINTANA 1601494 - Inicio
  Else if (UPPERCASE(Form)      = UpperCase('frmRelEtiquetasAutoPatroc'))
  then frm := TfrmRelEtiquetasAutoPatroc.Create(Application)
  //Marcio Sanches Spinosa SOL 172882 KINTANA 1601494 - Fim
  else frm := nil;

  if frm = nil
  then Result := false
  else begin
     with frm do
     begin
        Result := (ShowModal = mrOk);
        Free;
     end;
   end;
end;      }

Procedure TRptAutPag1.CrmRptCMBeforePrint(Sender: TObject);
Var
  x: integer;
Begin
  Inherited;

  With SqlAutPagDoc Do
  Begin
    SQL.Clear;
    SQL.Add('SELECT /*+ RULE */ NUMFATURA, CODDOCUMENTO, NUMAPGR, REFERENCIA, NODOCUMENTO,  ');
    SQL.Add('  COMPLDOCUMENTO, DATAVENCTO, DATAEMISSAO,DATALANCTO, DATAPROGRAMADA, NUMDOCUMENTO,       ');
    SQL.Add('  round(VALOR,2) as valor, round(VALOROUTRAMOEDA,2) as VALOROUTRAMOEDA, RAZAOSOCIAL, DESCRICAO, round(VALORRATEIO,2) as VALORRATEIO, ');
    SQL.Add('  DESCTDR, NOMEAP, NOMECR, NOMECC, OBS, FLGDOCBANCARIO, round(VLACRE,2) as VLACRE,                ');
    SQL.Add('  round(VLDEC,2) AS VLDEC, round(VLIMP,2) as VLIMP, round(VLLIQ,2) as VLLIQ, TRGUSERINCLUSAO,                                        ');
    SQL.Add('  TO_DATE(TO_CHAR(TRGDTINCLUSAO,''DD/MM/YYYY''),''DD/MM/YYYY'') AS TRGDTINCLUSAO,  ');
    SQL.Add('  (0) AS TOTVALORBRUTO, (0) AS TOTVALORDEDUCOES, (0) AS TOTVALORACRESCIMO,     ');
    SQL.Add('  (0) AS TOTVALORIMPOSTO, (0) AS TOTVALORAPAGAR, (0) AS SUMVALORBRUTO,         ');
    SQL.Add('  (0) AS SUMVALORDEDUCOES, (0) AS SUMVALORACRESCIMO, (0) AS SUMVALORIMPOSTO,   ');
    SQL.Add('  (0) AS SUMVALORAPAGAR, NUMIMOVEL, NOMEPATRO, DESCPLANO, DESCPROGRAMA,        ');
    SQL.Add('  IDFORCLI, (0) AS VALOLANCTOLIQ, (0) AS SUMVALOLANCTOLIQ,                     ');
    SQL.Add('  ''                    '' AS NOMEUSUARIO,                                     ');
    SQL.Add('  ''                    '' AS NUMBANCO,                                        ');
    SQL.Add('  ''                    '' AS NUMAGENCIA,                                      ');
    SQL.Add('  ''                    '' AS CONTACORRENTE,                                   ');

    // Ricardo A. SOL 122623 KTN 603580
    SQL.Add('  NOMEPATROORIGEM, DESCPLANOORIGEM                                             ');
    // Fim Ricardo

    SQL.Add('FROM                                                                           ');
    SQL.Add('  (SELECT D.NUMFATURA, D.CODDOCUMENTO, D.NUMAPGR, D.REFERENCIA,                ');
    SQL.Add('          D.NODOCUMENTO, D.COMPLDOCUMENTO, D.DATAVENCTO, D.DATAEMISSAO,L.DATALANCTO,        ');
    SQL.Add('          D.DATAPROGRAMADA, P.NUMDOCUMENTO,                                    ');
    SQL.Add('          decode(d.recpag, ''P'', decode(l.debcre,''C'',round(L.VALOR,2) ,round(l.valor,2)*-1),   ');
    SQL.Add('             decode(l.debcre, ''D'', round(L.VALOR,2), round(l.valor,2) * -1)) as valor, ');
    SQL.Add('          decode(d.recpag,''P'',decode(l.debcre,''C'',round(L.VALOROUTRAMOEDA,2),       ');
    SQL.Add('             round(L.VALOROUTRAMOEDA,2)*-1),                                            ');
    SQL.Add('             decode(l.debcre,''D'',round(L.VALOROUTRAMOEDA,2),round(L.VALOROUTRAMOEDA,2)*-1 )    ');
    SQL.Add('                ) valoroutramoeda,                                          ');
    SQL.Add('          P.RAZAOSOCIAL, F.DESCRICAO, round(SUM(round(RD.VALOR,2)),2) AS VALORRATEIO,            ');
    SQL.Add('          TDR.DESCRICAO AS DESCTDR, AP.NOME AS NOMEAP, CR.NOME AS NOMECR,      ');

    //Marcus Oliveira P. 26056 09/08/2007
    SQL.Add('          (CC.NOME) AS NOMECC,              ');

    SQL.Add('          D.OBS, F.FLGDADOSBANCARIOS AS FLGDOCBANCARIO, (0) AS VLACRE,         ');
    SQL.Add('         (0) AS VLDEC, (0) AS VLIMP, (0) AS VLLIQ, D.TRGUSERINCLUSAO,          ');
    SQL.Add('         D.TRGDTINCLUSAO, RD.NUMIMOVEL, PATRO.NOME AS NOMEPATRO,               ');
    SQL.Add('         PLANO.NOME AS DESCPLANO, PROGRAMA.DESCPROGRAMA, D.IDFORCLI,           ');

    // Ricardo A. SOL 122623 KTN 603580
    SQL.Add('          PATROO.NOME AS NOMEPATROORIGEM, PLANOO.NOME AS DESCPLANOORIGEM       ');
    // fim Ricardo

    SQL.Add('   FROM PESSOA P, PESSOA PATRO, DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM RD,    ');
    SQL.Add('        FORMARECPAG F, TIPORECEBDESEMB TDR, CENTCUST CC, UNIDNEGOCIO AP,       ');
    //início - André Tavares - pendência 16330 - 30/04/2004
    SQL.Add('        CENTRESPON CR, PLANPREVCONTABIL PLANO, PROGRAMA , tipodocrecpag tpd    ');
    //fim - André Tavares - pendência 16330 - 30/04/2004

    // Ricardo A. SOL 122623 KTN 603580
    SQL.Add('        , PLANPREVCONTABIL PLANOO, PESSOA PATROO                                 ');
    // fim Ricardo

    SQL.Add('   WHERE                                                                       ');
    SQL.Add('-- #ADF1                                                                       ');
    SQL.Add('-- STRING PARA ADICIONAR FILTRO DAS TELAS DE PARÂMETRO NA CONSULTA             ');

    //início - André Tavares - pendência 16330 - 30/04/2004
    SQL.Add(' d.CODTIPDOC = tpd.CODTIPDOC and ');
    SQL.Add('  ((tpd.FLGIMPRIMEAP IS NULL) OR (tpd.FLGIMPRIMEAP = ''S'')) and ' );
    //fim    - André Tavares - pendência 16330 - 30/04/2004

    If (Not CmpRptCM.ParamValues[1].IsNull) Or (Not CmpRptCM.ParamValues[2].IsNull) Then
    Begin
      Case StrToInt(CmpRptCM.ParamValues[3].AsString) Of
        0: SQL.Add('   (d.numapgr is not null) and ');
        1: SQL.Add('   (d.numapgr is  null) and ');
      End;
      If (Not CmpRptCM.ParamValues[1].IsNull) Then
        SQL.Add('   rtrim(RD.CODCENTRORESPON) = ' + #39 + Espaco(CmpRptCM.ParamValues[1].AsString, 10) + #39 + ' and ');
      If (Not CmpRptCM.ParamValues[2].IsNull) Then
        SQL.Add('   to_char(d.TRGDTINCLUSAO,''dd/mm/yyyy'') = ' + #39 + CmpRptCM.ParamValues[2].AsString + #39 + ' and ');
    End
    Else
      SQL.Add('   d.coddocumento = ' + CmpRptCM.ParamValues[0].AsString + '  and ');
    SQL.Add('        D.CODTIPDOC IN                                                         ');
    SQL.Add('    (SELECT CODTIPDOC                                                          ');
    SQL.Add('     FROM TIPODOCRECPAG A                                                      ');
    SQL.Add('     WHERE A.RECPAG = :RECPAG AND                                              ');
    SQL.Add('           NOT EXISTS(SELECT *                                                 ');
    SQL.Add('                      FROM USUARIOXTPDOCTO B                                   ');
    SQL.Add('                      WHERE RECPAG= :RECPAG AND                                ');
    SQL.Add('                            B.IDUSUARIO = :IDUSUARIO                           ');
    SQL.Add('                      )                                                        ');
    SQL.Add('     UNION                                                                     ');
    SQL.Add('     SELECT CODTIPDOC                                                          ');
    SQL.Add('     FROM TIPODOCRECPAG A                                                      ');
    SQL.Add('     WHERE A.RECPAG = :RECPAG AND                                              ');
    SQL.Add('           EXISTS (SELECT *                                                    ');
    SQL.Add('                   FROM USUARIOXTPDOCTO B                                      ');
    SQL.Add('                   WHERE RECPAG = :RECPAG AND                                  ');
    SQL.Add('                         A.CODTIPDOC = B.CODTIPDOC AND                         ');
    SQL.Add('                         B.IDUSUARIO = :IDUSUARIO                              ');
    SQL.Add('                  )                                                            ');
    SQL.Add('     ) AND                                                                     ');
    SQL.Add('      (d.numfatura is null) and                                                ');
    SQL.Add('      (L.ESTORNO IS NULL) AND                                                  ');
    SQL.Add('      (D.RECPAG = :RECPAG) AND                                                 ');
    SQL.Add('      (D.IDPESSOA =  :IDPESSOA) AND                                            ');
    SQL.Add('      (D.CODDOCUMENTO = L.CODDOCUMENTO) AND                                    ');
    SQL.Add('      (D.OPERACAO = L.OPERACAO) AND                                            ');
    SQL.Add('      (D.CODDOCUMENTO = RD.CODDOCUMENTO) AND                                   ');
    SQL.Add('      (P.IDPESSOA = D.IDFORCLI) AND                                            ');
    SQL.Add('      (D.CODFORMA = F.CODFORMA(+)) AND                                         ');
    SQL.Add('      (CC.CODCENTROCUSTO(+) = RD.CODCENTROCUSTO) AND                           ');
    SQL.Add('      (CC.IDEMPRESA(+) = RD.IDEMPRESA) AND                                     ');
    SQL.Add('      (TDR.CODTIPRECDES(+) = RD.CODTIPRECDES) AND                              ');
    SQL.Add('      (TDR.RECPAG(+) = RD.RECPAG) AND                                          ');
    SQL.Add('      (TDR.IDPESSOA(+) = RD.IDPESSOA) AND                                      ');
    SQL.Add('      (AP.UNIDNEGOC(+) = RD.UNIDNEGOC) AND                                     ');
    SQL.Add('      (AP.IDPESSOA(+) = RD.IDPESSOA) AND                                       ');
    SQL.Add('      (CR.CODCENTRORESPON(+) = RD.CODCENTRORESPON) AND                         ');
    SQL.Add('      (CR.IDPESSOA(+) = RD.IDPESSOA) AND                                       ');
    SQL.Add('      (PLANO.IDPLANOPREV(+) = RD.IDPLANOPREV) AND                              ');
    SQL.Add('      (PROGRAMA.IDPROGRAMA(+) = RD.IDPROGRAMA) AND                             ');
    SQL.Add('      (PATRO.IDPESSOA(+) = RD.IDPATRO)                                         ');

    // Ricardo A. SOL 122623 KTN 603580
    SQL.Add('      AND (PLANOO.IDPLANOPREV(+) = RD.IDPLANOORIGEM)                           ');
    SQL.Add('      AND (PATROO.IDPESSOA(+) = RD.IDPATROORIGEM)                              ');
    // fim Ricardo
    //William M. Santos - Ini
    SQL.Add('      AND NOT EXISTS (SELECT 1                                                 ');
    SQL.Add('                        FROM DOCUMXDOCUM DXD                                   ');
    SQL.Add('                       WHERE D.CODDOCUMENTO = DXD.IDDOCUMENTO)                 ');
    //William M. Santos - Fim
    SQL.Add('    GROUP BY L.VALOR, D.NUMFATURA, D.CODDOCUMENTO, D.NUMAPGR,                  ');
    SQL.Add('             D.REFERENCIA, D.NODOCUMENTO, D.COMPLDOCUMENTO,                    ');
    SQL.Add('             D.DATAVENCTO, D.DATAEMISSAO,L.DATALANCTO, D.DATAPROGRAMADA,                    ');
    SQL.Add('             P.NUMDOCUMENTO, d.recpag, l.debcre, L.VALOROUTRAMOEDA,            ');
    SQL.Add('             P.RAZAOSOCIAL, F.DESCRICAO, TDR.DESCRICAO, AP.NOME,               ');
    SQL.Add('             CR.NOME, CC.NOME, D.OBS, F.FLGDADOSBANCARIOS, D.TRGUSERINCLUSAO,  ');
    SQL.Add('             D.TRGDTINCLUSAO, RD.NUMIMOVEL, PATRO.NOME, PLANO.NOME,            ');
    SQL.Add('             PROGRAMA.DESCPROGRAMA, D.IDFORCLI                                 ');

    // Ricardo A. SOL 122623 KTN 603580
    SQL.Add('             , PATROO.NOME, PLANOO.NOME                                          ');
    // fim Ricardo

    SQL.Add('    UNION                                                                      ');
    SQL.Add('    SELECT Q1.NUMFATURA, Q1.CODDOCUMENTO, Q1.NUMAPGR, Q1.REFERENCIA,           ');
    SQL.Add('           Q1.NODOCUMENTO, Q1.COMPLDOCUMENTO, Q1.DATAVENCTO,                   ');
    SQL.Add('           Q1.DATAEMISSAO,Q1.DATALANCTO, Q1.DATAPROGRAMADA, Q1.NUMDOCUMENTO, round(Q1.VALOR,2) AS VALOR,       ');
    SQL.Add('           Q1.VALOROUTRAMOEDA, Q1.RAZAOSOCIAL, Q1.DESCRICAO,                   ');
    SQL.Add('           round(SUM(((Q1.VALOR * Q2.VALOR)/ Q3.VALOR)),2) AS VALORRATEIO,              ');
    SQL.Add('           Q2.DESCTDR, Q2.NOMEAP, Q2.NOMECR, Q2.NOMECC, Q1.OBS,                ');
    SQL.Add('           Q1.FLGDOCBANCARIO, (0) AS VLACRE, (0) AS VLDEC, (0) AS VLIMP,       ');
    SQL.Add('           (0) AS VLLIQ, Q1.TRGUSERINCLUSAO, Q1.TRGDTINCLUSAO,                 ');
    SQL.Add('           Q2.NUMIMOVEL, Q2.NOMEPATRO, Q2.DESCPLANO, Q2.DESCPROGRAMA,          ');
    SQL.Add('           Q1.IDFORCLI                                                         ');

    // Ricardo A. SOL 122623 KTN 603580
    SQL.Add('           , Q2.NOMEPATROORIGEM, Q2.DESCPLANOORIGEM                            ');
    // fim Ricardo

    SQL.Add('    FROM                                                                       ');
    SQL.Add('        (SELECT DOC.NUMFATURA, DOC.CODDOCUMENTO, DOC.NUMAPGR, DOC.REFERENCIA,  ');
    SQL.Add('            DOC.NODOCUMENTO, DOC.COMPLDOCUMENTO, DOC.DATAVENCTO,               ');
    SQL.Add('            DOC.DATAEMISSAO,LAN.DATALANCTO, DOC.DATAPROGRAMADA, P.NUMDOCUMENTO,               ');
    SQL.Add('            decode(doc.recpag,''P'',decode(lan.debcre,''C'',                   ');
    SQL.Add('              round(Lan.VALOR,2),round(lan.valor,2)*-1),                                         ');
    SQL.Add('              decode(lan.debcre,''D'',round(Lan.VALOR,2),round(lan.valor,2)*-1)) as valor,       ');
    SQL.Add('            decode(doc.recpag,''P'',decode(lan.debcre,''C'',Lan.VALOROUTRAMOEDA,');
    SQL.Add('                Lan.VALOROUTRAMOEDA*-1),decode(lan.debcre,''D'',               ');
    SQL.Add('                Lan.VALOROUTRAMOEDA,                                           ');
    SQL.Add('                Lan.VALOROUTRAMOEDA*-1)) as valoroutramoeda,                   ');
    SQL.Add('            P.RAZAOSOCIAL, F.DESCRICAO, DOC.OBS,                               ');
    SQL.Add('            F.FLGDADOSBANCARIOS AS FLGDOCBANCARIO, (0) AS VLACRE, (0) AS VLDEC,');
    SQL.Add('            (0) AS VLIMP, (0) AS VLLIQ, DOC.TRGUSERINCLUSAO,                   ');
    SQL.Add('            DOC.TRGDTINCLUSAO, DOC.IDFORCLI                                    ');
    SQL.Add('          FROM PESSOA P, DOCUMENTO DOC, LANCTODOCUM LAN, FORMARECPAG F         ');
    SQL.Add('          WHERE                                                                ');
    SQL.Add('-- #ADF2                                                                       ');
    SQL.Add('-- STRING PARA ADICIONAR FILTRO DAS TELAS DE PARÂMETRO NA CONSULTA             ');
    If (Not CmpRptCM.ParamValues[1].IsNull) Or (Not CmpRptCM.ParamValues[2].IsNull) Then
    Begin
      If (Not CmpRptCM.ParamValues[2].IsNull) Then
        SQL.Add('   to_char(doc.TRGDTINCLUSAO,''dd/mm/yyyy'') = ' + #39 + CmpRptCM.ParamValues[2].AsString + #39 + ' and ');
      Case StrToInt(CmpRptCM.ParamValues[3].AsString) Of
        0: SQL.Add('   (doc.numapgr is not null) and ');
        1: SQL.Add('   (doc.numapgr is null) and ');
      End;
    End
    Else
      SQL.Add('   doc.coddocumento = ' + CmpRptCM.ParamValues[0].AsString + ' and ');
    SQL.Add('            DOC.CODTIPDOC IN                                                   ');
    SQL.Add('            (SELECT CODTIPDOC                                                  ');
    SQL.Add('              FROM TIPODOCRECPAG A                                             ');
    SQL.Add('              WHERE A.RECPAG = :RECPAG AND                                     ');
    SQL.Add('                NOT EXISTS(SELECT *                                            ');
    SQL.Add('                           FROM USUARIOXTPDOCTO B                              ');
    SQL.Add('                           WHERE RECPAG = :RECPAG AND                          ');
    SQL.Add('                                 B.IDUSUARIO = :IDUSUARIO)                     ');
    SQL.Add('UNION                                                                          ');
    SQL.Add('             SELECT CODTIPDOC                                                  ');
    SQL.Add('             FROM TIPODOCRECPAG A                                              ');
    SQL.Add('             WHERE A.RECPAG = :RECPAG AND                                      ');
    SQL.Add('                   EXISTS(SELECT *                                             ');
    SQL.Add('                          FROM USUARIOXTPDOCTO B                               ');
    SQL.Add('                          WHERE RECPAG = :RECPAG AND                           ');
    SQL.Add('                                A.CODTIPDOC = B.CODTIPDOC AND                  ');
    SQL.Add('                                B.IDUSUARIO = :IDUSUARIO)                      ');
    SQL.Add('            ) AND                                                              ');
    SQL.Add('            (LAN.ESTORNO IS NULL) AND                                          ');
    SQL.Add('            (DOC.RECPAG = :RECPAG) AND                                         ');
    SQL.Add('            (DOC.IDPESSOA = :IDPESSOA) AND                                     ');
    SQL.Add('            (P.IDPESSOA = DOC.IDFORCLI)AND                                     ');
    SQL.Add('            (DOC.CODFORMA = F.CODFORMA(+)) AND                                 ');
    SQL.Add('            (RTRIM(LAN.OPERACAO) IN (''3'',''13'')) AND                        ');
    SQL.Add('            (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)                              ');
    //William M. Santos - Ini
    SQL.Add('              AND NOT EXISTS (SELECT 1                                         ');
    SQL.Add('                        FROM DOCUMXDOCUM DXD                                   ');
    SQL.Add('                       WHERE DOC.CODDOCUMENTO = DXD.IDDOCUMENTO)                 ');
    //William M. Santos - Fim

    SQL.Add('        ) Q1,                                                                  ');
    SQL.Add('        (SELECT D.NUMFATURA,(DECODE(D.RECPAG,''P'',DECODE(L.DEBCRE,''C'',      ');
    SQL.Add('                  round(Rd.VALOR,2), round(Rd.VALOR,2) * -1),                                    ');
    SQL.Add('                DECODE(L.DEBCRE, ''D'', round(Rd.VALOR,2), round(Rd.VALOR,2) * -1))) as valor,   ');
    SQL.Add('            TDR.DESCRICAO AS DESCTDR,                                          ');
    SQL.Add('            AP.NOME AS NOMEAP,                                                 ');
    SQL.Add('            CR.NOME AS NOMECR,                                                 ');
    SQL.Add('            (CC.NOME) AS NOMECC,            ');
    SQL.Add('            RD.NUMIMOVEL,PATRO.NOME AS NOMEPATRO,                              ');
    SQL.Add('            PLANO.NOME AS DESCPLANO,                                           ');
    SQL.Add('            PROGRAMA.DESCPROGRAMA                                              ');

    // Ricardo A. SOL 122623 KTN 603580
    SQL.Add('            , PATROO.NOME AS NOMEPATROORIGEM, PLANOO.NOME AS DESCPLANOORIGEM   ');
    // fim Ricardo

    SQL.Add('          FROM PESSOA PATRO, DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM RD,       ');
    SQL.Add('            TIPORECEBDESEMB TDR, CENTCUST CC, UNIDNEGOCIO AP, CENTRESPON CR,   ');
    SQL.Add('            PLANPREVCONTABIL PLANO, PROGRAMA                                   ');

    // Ricardo A. SOL 122623 KTN 603580
    SQL.Add('            , PLANPREVCONTABIL PLANOO, PESSOA PATROO                           ');
    // fim Ricardo

    SQL.Add('          WHERE                                                                ');
    SQL.Add('-- #ADF3                                                                       ');
    SQL.Add('-- STRING PARA ADICIONAR FILTRO DAS TELAS DE PARÂMETRO NA CONSULTA             ');
    If (Not CmpRptCM.ParamValues[1].IsNull) Then
      SQL.Add('   rtrim(RD.CODCENTRORESPON) = ' + #39 + Espaco(CmpRptCM.ParamValues[1].AsString, 10) + #39 + ' and ');
    SQL.Add('            (D.RECPAG = :RECPAG) AND                                           ');
    SQL.Add('            d.coddocumento=l.coddocumento and                                  ');
    SQL.Add('            l.operacao=d.operacao and                                          ');
    SQL.Add('            (D.IDPESSOA =  :IDPESSOA) AND                                      ');
    SQL.Add('            (D.NUMFATURA IS NOT NULL) AND                                      ');
    SQL.Add('            (CC.CODCENTROCUSTO(+) = RD.CODCENTROCUSTO) AND                     ');
    SQL.Add('            (CC.IDEMPRESA(+) = RD.IDEMPRESA) AND                               ');
    SQL.Add('            (D.CODDOCUMENTO = RD.CODDOCUMENTO) AND                             ');
    SQL.Add('            (TDR.CODTIPRECDES(+) = RD.CODTIPRECDES) AND                        ');
    SQL.Add('            (TDR.RECPAG(+) = RD.RECPAG) AND                                    ');
    SQL.Add('            (TDR.IDPESSOA(+) = RD.IDPESSOA) AND                                ');
    SQL.Add('            (AP.UNIDNEGOC(+) = RD.UNIDNEGOC) AND                               ');
    SQL.Add('            (AP.IDPESSOA(+) = RD.IDPESSOA) AND                                 ');
    SQL.Add('            (CR.CODCENTRORESPON(+) = RD.CODCENTRORESPON) AND                   ');
    SQL.Add('            (PLANO.IDPLANOPREV(+) = RD.IDPLANOPREV) AND                        ');
    SQL.Add('            (PROGRAMA.IDPROGRAMA(+) = RD.IDPROGRAMA) AND                       ');
    SQL.Add('            (PATRO.IDPESSOA(+) = RD.IDPATRO) AND                               ');
    SQL.Add('            (CR.IDPESSOA(+) = RD.IDPESSOA)                                     ');

    // Ricardo A. SOL 122623 KTN 603580
    SQL.Add('            AND (PLANOO.IDPLANOPREV(+) = RD.IDPLANOORIGEM)                     ');
    sql.Add('            AND (PATROO.IDPESSOA(+) = RD.IDPATROORIGEM)                        ');
    // fim Ricardo

    //William M. Santos - Ini
    SQL.Add('            AND NOT EXISTS (SELECT 1                                           ');
    SQL.Add('                      FROM DOCUMXDOCUM DXD                                     ');
    SQL.Add('                     WHERE D.CODDOCUMENTO = DXD.IDDOCUMENTO)                   ');
    //William M. Santos - Fim


    SQL.Add('        ) Q2,                                                                  ');
    SQL.Add('        (SELECT D.NUMFATURA, sum(decode(d.recpag, ''P'', decode(l.debcre,      ');
    SQL.Add('                  ''C'', round(L.VALOR,2), round(l.valor,2)*-1), decode(l.debcre, ''D'', round(L.VALOR,2),');
    SQL.Add('                  round(l.valor,2)*-1))) as valor                                       ');
    SQL.Add('          FROM DOCUMENTO D, LANCTODOCUM L                                      ');
    SQL.Add('          WHERE (L.ESTORNO IS NULL) AND                                        ');
    SQL.Add('            (D.RECPAG= :RECPAG) AND                                            ');
    SQL.Add('            (D.IDPESSOA = :IDPESSOA) AND                                       ');
    SQL.Add('            (RTRIM(L.OPERACAO) IN (''1'',''11'')) AND                          ');
    SQL.Add('            (D.CODDOCUMENTO = L.CODDOCUMENTO) AND                              ');
    SQL.Add('            (D.OPERACAO = L.OPERACAO) AND                                      ');
    SQL.Add('            (D.NUMFATURA IS NOT NULL)                                          ');

    //William M. Santos - Ini
    SQL.Add('            AND NOT EXISTS (SELECT 1                                           ');
    SQL.Add('                      FROM DOCUMXDOCUM DXD                                     ');
    SQL.Add('                     WHERE D.CODDOCUMENTO = DXD.IDDOCUMENTO)                   ');
    //William M. Santos - Fim


    SQL.Add('          GROUP BY D.NUMFATURA                                                 ');
    SQL.Add('        ) Q3                                                                   ');
    SQL.Add('      WHERE                                                                    ');
    SQL.Add('        (Q1.NUMFATURA = Q2.NUMFATURA) AND                                      ');
    SQL.Add('        (Q3.NUMFATURA = Q2.NUMFATURA)                                          ');
    SQL.Add('      GROUP BY                                                                 ');
    SQL.Add('        Q1.NUMFATURA, Q1.CODDOCUMENTO, Q1.NUMAPGR, Q1.REFERENCIA,              ');
    SQL.Add('        Q1.NODOCUMENTO, Q1.COMPLDOCUMENTO, Q1.DATAVENCTO, Q1.DATAEMISSAO,Q1.DATALANCTO,      ');
    SQL.Add('        Q1.DATAPROGRAMADA, Q1.NUMDOCUMENTO, Q1.VALOR, Q1.VALOROUTRAMOEDA,      ');
    SQL.Add('        Q1.RAZAOSOCIAL, Q1.DESCRICAO, Q2.DESCTDR, Q2.NOMEAP, Q2.NOMECR,        ');
    SQL.Add('        Q2.NOMECC, Q1.OBS, Q1.FLGDOCBANCARIO, Q1.TRGUSERINCLUSAO,              ');
    SQL.Add('        Q1.TRGDTINCLUSAO, Q2.NUMIMOVEL, Q2.NOMEPATRO, Q2.DESCPLANO,            ');
    SQL.Add('        Q2.DESCPROGRAMA,Q1.IDFORCLI                                            ');

    // Ricardo A. SOL 122623 KTN 603580
    SQL.Add('        , Q2.DESCPLANOORIGEM, Q2.NOMEPATROORIGEM)                                ');
    // fim Ricardo

    sql.Add(' ORDER BY CODDOCUMENTO, DESCPLANO                                              ');
    Prepare;
    Parambyname('RECPAG').AsString := 'R';//Douglas.Siqueira
//    Parambyname('RECPAG').AsString := ParamIntegra.RecPag;
    Parambyname('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
    Parambyname('IDUSUARIO').AsFloat := CrmRptCM.IdUsuario;
    Open;

    //William M. Santos - 26/01/2010 - Ini
    //Query para trazer os documentos filhos referentes a Contas a Pagar
    With SqlDocumFilhosAP Do
    begin
      SQL.Clear;
      SQL.Add('SELECT R.CODDOCUMENTO, DF.NODOCUMENTO as CAPDOCUMENTO,                                                       ');
      SQL.Add('       R.CODTIPRECDES,                                                       ');
      SQL.Add('       R.RECPAG,                                                             ');
      SQL.Add('       R.IDPESSOA,                                                           ');
      SQL.Add('       R.IDRESERVAORCAMEN,                                                   ');
      SQL.Add('       R.CODCENTRORESPON,                                                    ');
      SQL.Add('       C.CODEXTERNO AS CODEXTERNOCR,                                         ');
      SQL.Add('       R.UNIDNEGOC,                                                          ');
      SQL.Add('       R.MOECODIGO,                                                          ');
      SQL.Add('       R.VALOR,                                                              ');
      SQL.Add('       R.VALOROUTRAMOEDA,                                                    ');
      SQL.Add('       t.PLACONTACREDITO,                                                    ');
      SQL.Add('       R.IDUSUARIOINCLUSAO,                                                  ');
      SQL.Add('       U.NOME,                                                               ');
      SQL.Add('       C.NOME,                                                               ');
      SQL.Add('       R.CODCENTROCUSTO,                                                     ');
      SQL.Add('       CC.CODEXTERNO as CODEXTERNOCC,                                        ');
      SQL.Add('       R.IDRATEIODOCUM,                                                      ');
      SQL.Add('       T.DESCRICAO,                                                          ');
      SQL.Add('       I.MOESIGLA,                                                           ');
      SQL.Add('       CC.NOME AS NOMECENTROCUSTO,                                           ');
      SQL.Add('       R.PLANO,                                                              ');
      SQL.Add('       R.IDPATRO,                                                            ');
      SQL.Add('       R.IDPROGRAMA,                                                         ');
      SQL.Add('       PROGRAMA.FLGTIPOPROGRAMA,                                             ');
      SQL.Add('       R.NUMIMOVEL,                                                          ');
      SQL.Add('       PATRO.NOME AS NOMEPATRO,                                              ');
      SQL.Add('       PLANO.NOME AS DESCPLANO,                                              ');
      SQL.Add('       PROGRAMA.DESCPROGRAMA,                                                ');
      SQL.Add('       T.HITCODHIST,                                                         ');
      SQL.Add('       R.IDPLANOPREV,                                                        ');
      SQL.Add('       RESERVAORCAMEN.NUMRESERVA,                                            ');
      SQL.Add('       T.FLGOBRIGARESERVA,                                                   ');
      SQL.Add('       RESERVAORCAMEN.NUMRESERVA AS NUMRESERVAOLD,                           ');
      SQL.Add('       R.VALOR AS VALORRESERVAOLD,                                           ');
      SQL.Add('       R.VLRRESORCAMEN,                                                      ');
      SQL.Add('       -1 AS IDSEGREGACRITER,                                                ');
      SQL.Add('       0 AS CODSUBCONTA,                                                     ');
      SQL.Add('       0 AS CODSUBCONTAPASS,                                                 ');
      SQL.Add('       IDPLANOVIRTUAL,                                                       ');
      SQL.Add('       IDSEGREGACONTR,                                                       ');
      SQL.Add('       T.FLGOBRQTDECOTAS,                                                    ');
      SQL.Add('       R.IDPATROORIGEM,                                                      ');
      SQL.Add('       R.IDPLANOORIGEM,                                                      ');
      SQL.Add('       PATROORIGEM.NOME AS NOMEPATROORIGEM,                                  ');
      SQL.Add('       PLANOORIGEM.NOME AS DESCPLANOORIGEM                                   ');
      SQL.Add('  FROM RATEIODOCUM R,                                                        ');
      SQL.Add('       UNIDNEGOCIO U,                                                        ');
      SQL.Add('       CENTRESPON C,                                                         ');
      SQL.Add('       TIPORECEBDESEMB T,                                                    ');
      SQL.Add('       MOEDA I,                                                              ');
      SQL.Add('       CENTCUST CC,                                                          ');
      SQL.Add('       PESSOA PATRO,                                                         ');
      SQL.Add('       PLANPREVCONTABIL PLANO,                                               ');
      SQL.Add('       PROGRAMA,                                                             ');
      SQL.Add('       RESERVAORCAMEN,                                                       ');
      SQL.Add('       PESSOA PATROORIGEM,                                                   ');
      SQL.Add('       PLANPREVCONTABIL PLANOORIGEM,                                         ');
      SQL.Add('       DOCUMENTO DOC,                                                        ');
      SQL.Add('       DOCUMXDOCUM DXD, DOCUMENTO DF                                                       ');

      SQL.Add('WHERE (DOC.CODDOCUMENTO = ' + CmpRptCM.ParamValues[0].AsString + ')          ');

      SQL.Add('      AND (T.CODTIPRECDES = R.CODTIPRECDES)  AND (DF.CODDOCUMENTO = R.CODDOCUMENTO)                                   ');
      SQL.Add('      AND (T.RECPAG = R.RECPAG)                                              ');
      SQL.Add('      AND (T.IDPESSOA = R.IDPESSOA)                                          ');
      SQL.Add('      AND (U.UNIDNEGOC = R.UNIDNEGOC)                                        ');
      SQL.Add('      AND (U.IDPESSOA = R.IDPESSOA)                                          ');
      SQL.Add('      AND (I.MOECODIGO(+) = R.MOECODIGO)                                     ');
      SQL.Add('      AND (C.CODCENTRORESPON(+) = R.CODCENTRORESPON)                         ');
      SQL.Add('      AND (CC.IDEMPRESA(+) = R.IDPESSOA)                                     ');
      SQL.Add('      AND (R.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))                          ');
      SQL.Add('      AND (C.IDPESSOA(+) = R.IDPESSOA)                                       ');
      SQL.Add('      AND (PLANO.IDPLANOPREV(+) = R.IDPLANOPREV)                             ');
      SQL.Add('      AND (PROGRAMA.IDPROGRAMA(+) = R.IDPROGRAMA)                            ');
      SQL.Add('      AND (PATRO.IDPESSOA(+) = R.IDPATRO)                                    ');
      SQL.Add('      AND (RESERVAORCAMEN.IDRESERVAORCAMEN(+) = R.IDRESERVAORCAMEN)          ');
      SQL.Add('      AND (PLANOORIGEM.IDPLANOPREV(+) = R.IDPLANOORIGEM)                     ');
      SQL.Add('      AND (PATROORIGEM.IDPESSOA(+) = R.IDPATROORIGEM)                        ');

      SQL.Add('      AND DXD.IDDOCUMENTOPAI = DOC.CODDOCUMENTO                              ');
      SQL.Add('      AND DXD.IDDOCUMENTO = R.CODDOCUMENTO                                   ');
      SQL.Add('      AND R.RECPAG = ''R''                                                   ');///TROQUEI PARA TESTE
//      SQL.Add('      AND R.RECPAG = ''P''                                                   ');

      if not CdsAutPagDoc.IsEmpty  then
      begin
        Prepare;
        Open;
      end;
    end;


    //Query para trazer os documentos filhos referentes a Contas a Receber
    With SqlDocumFilhoAR Do
    begin
      SQL.Clear;
      SQL.Add('SELECT R.CODDOCUMENTO,DF.NODOCUMENTO as CARDOCUMENTO,                         ');
      SQL.Add('       R.CODTIPRECDES,                                                       ');
      SQL.Add('       R.RECPAG,                                                             ');
      SQL.Add('       R.IDPESSOA,                                                           ');
      SQL.Add('       R.IDRESERVAORCAMEN,                                                   ');
      SQL.Add('       R.CODCENTRORESPON,                                                    ');
      SQL.Add('       C.CODEXTERNO AS CODEXTERNOCR,                                         ');
      SQL.Add('       R.UNIDNEGOC,                                                          ');
      SQL.Add('       R.MOECODIGO,                                                          ');
      SQL.Add('       R.VALOR,                                                              ');
      SQL.Add('       R.VALOROUTRAMOEDA,                                                    ');
      SQL.Add('       t.PLACONTACREDITO,                                                    ');
      SQL.Add('       R.IDUSUARIOINCLUSAO,                                                  ');
      SQL.Add('       U.NOME,                                                               ');
      SQL.Add('       C.NOME,                                                               ');
      SQL.Add('       R.CODCENTROCUSTO,                                                     ');
      SQL.Add('       CC.CODEXTERNO as CODEXTERNOCC,                                        ');
      SQL.Add('       R.IDRATEIODOCUM,                                                      ');
      SQL.Add('       T.DESCRICAO,                                                          ');
      SQL.Add('       I.MOESIGLA,                                                           ');
      SQL.Add('       CC.NOME AS NOMECENTROCUSTO,                                           ');
      SQL.Add('       R.PLANO,                                                              ');
      SQL.Add('       R.IDPATRO,                                                            ');
      SQL.Add('       R.IDPROGRAMA,                                                         ');
      SQL.Add('       PROGRAMA.FLGTIPOPROGRAMA,                                             ');
      SQL.Add('       R.NUMIMOVEL,                                                          ');
      SQL.Add('       PATRO.NOME AS NOMEPATRO,                                              ');
      SQL.Add('       PLANO.NOME AS DESCPLANO,                                              ');
      SQL.Add('       PROGRAMA.DESCPROGRAMA,                                                ');
      SQL.Add('       T.HITCODHIST,                                                         ');
      SQL.Add('       R.IDPLANOPREV,                                                        ');
      SQL.Add('       RESERVAORCAMEN.NUMRESERVA,                                            ');
      SQL.Add('       T.FLGOBRIGARESERVA,                                                   ');
      SQL.Add('       RESERVAORCAMEN.NUMRESERVA AS NUMRESERVAOLD,                           ');
      SQL.Add('       R.VALOR AS VALORRESERVAOLD,                                           ');
      SQL.Add('       R.VLRRESORCAMEN,                                                      ');
      SQL.Add('       -1 AS IDSEGREGACRITER,                                                ');
      SQL.Add('       0 AS CODSUBCONTA,                                                     ');
      SQL.Add('       0 AS CODSUBCONTAPASS,                                                 ');
      SQL.Add('       IDPLANOVIRTUAL,                                                       ');
      SQL.Add('       IDSEGREGACONTR,                                                       ');
      SQL.Add('       T.FLGOBRQTDECOTAS,                                                    ');
      SQL.Add('       R.IDPATROORIGEM,                                                      ');
      SQL.Add('       R.IDPLANOORIGEM,                                                      ');
      SQL.Add('       PATROORIGEM.NOME AS NOMEPATROORIGEM,                                  ');
      SQL.Add('       PLANOORIGEM.NOME AS DESCPLANOORIGEM                                   ');
      SQL.Add('  FROM RATEIODOCUM R,                                                        ');
      SQL.Add('       UNIDNEGOCIO U,                                                        ');
      SQL.Add('       CENTRESPON C,                                                         ');
      SQL.Add('       TIPORECEBDESEMB T,                                                    ');
      SQL.Add('       MOEDA I,                                                              ');
      SQL.Add('       CENTCUST CC,                                                          ');
      SQL.Add('       PESSOA PATRO,                                                         ');
      SQL.Add('       PLANPREVCONTABIL PLANO,                                               ');
      SQL.Add('       PROGRAMA,                                                             ');
      SQL.Add('       RESERVAORCAMEN,                                                       ');
      SQL.Add('       PESSOA PATROORIGEM,                                                   ');
      SQL.Add('       PLANPREVCONTABIL PLANOORIGEM,                                         ');
      SQL.Add('       DOCUMENTO DOC,                                                        ');
      SQL.Add('       DOCUMXDOCUM DXD, DOCUMENTO DF                                                       ');

      SQL.Add('WHERE (DOC.CODDOCUMENTO = ' + CmpRptCM.ParamValues[0].AsString + ')          ');

      SQL.Add('      AND (T.CODTIPRECDES = R.CODTIPRECDES)  AND (DF.CODDOCUMENTO = R.CODDOCUMENTO)                                   ');
      SQL.Add('      AND (T.RECPAG = R.RECPAG)                                              ');
      SQL.Add('      AND (T.IDPESSOA = R.IDPESSOA)                                          ');
      SQL.Add('      AND (U.UNIDNEGOC = R.UNIDNEGOC)                                        ');
      SQL.Add('      AND (U.IDPESSOA = R.IDPESSOA)                                          ');
      SQL.Add('      AND (I.MOECODIGO(+) = R.MOECODIGO)                                     ');
      SQL.Add('      AND (C.CODCENTRORESPON(+) = R.CODCENTRORESPON)                         ');
      SQL.Add('      AND (CC.IDEMPRESA(+) = R.IDPESSOA)                                     ');
      SQL.Add('      AND (R.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))                          ');
      SQL.Add('      AND (C.IDPESSOA(+) = R.IDPESSOA)                                       ');
      SQL.Add('      AND (PLANO.IDPLANOPREV(+) = R.IDPLANOPREV)                             ');
      SQL.Add('      AND (PROGRAMA.IDPROGRAMA(+) = R.IDPROGRAMA)                            ');
      SQL.Add('      AND (PATRO.IDPESSOA(+) = R.IDPATRO)                                    ');
      SQL.Add('      AND (RESERVAORCAMEN.IDRESERVAORCAMEN(+) = R.IDRESERVAORCAMEN)          ');
      SQL.Add('      AND (PLANOORIGEM.IDPLANOPREV(+) = R.IDPLANOORIGEM)                     ');
      SQL.Add('      AND (PATROORIGEM.IDPESSOA(+) = R.IDPATROORIGEM)                        ');

      SQL.Add('      AND DXD.IDDOCUMENTOPAI = DOC.CODDOCUMENTO                              ');
      SQL.Add('      AND DXD.IDDOCUMENTO = R.CODDOCUMENTO                                   ');
      SQL.Add('      AND R.RECPAG = ''R''                                                   ');

      if not CdsAutPagDoc.IsEmpty  then
      begin
        Prepare;
        Open;
      end;
    end;
    //William M. Santos - 26/01/2010 - Fim
  End;
  OldDoc := '';
  SqlDemGestAutPag.Open;
  While Not CdsAutPagDoc.Eof Do
  Begin
    MontaRegistro;

    CdsDemGestAutPag.Append;
    For X := 0 To CdsAutPagDoc.FieldCount - 1 Do
    Begin
      If CdsDemGestAutPag.FindField(CdsAutPagDoc.Fields[x].FieldName) <> Nil Then
        Case CdsAutPagDoc.FieldByName(CdsAutPagDoc.Fields[x].FieldName).DataType Of
          ftBoolean:
            CdsDemGestAutPag.FieldByName(CdsAutPagDoc.Fields[x].FieldName).AsBoolean := CdsAutPagDoc.Fields[x].AsBoolean;
          ftSmallint, ftInteger, ftWord, ftBytes:
            CdsDemGestAutPag.FieldByName(CdsAutPagDoc.Fields[x].FieldName).AsInteger := CdsAutPagDoc.Fields[x].AsInteger;
          ftFloat, ftCurrency:
            CdsDemGestAutPag.FieldByName(CdsAutPagDoc.Fields[x].FieldName).AsFloat := CdsAutPagDoc.Fields[x].AsFloat;
          ftString:
            CdsDemGestAutPag.FieldByName(CdsAutPagDoc.Fields[x].FieldName).AsString := CdsAutPagDoc.Fields[x].AsString;
          ftDate, ftTime, ftDateTime:
            CdsDemGestAutPag.FieldByName(CdsAutPagDoc.Fields[x].FieldName).AsDateTime := CdsAutPagDoc.Fields[x].AsDateTime;
        Else
          CdsDemGestAutPag.FieldByName(CdsAutPagDoc.Fields[x].FieldName).Value := CdsAutPagDoc.Fields[x].Value;
        End;
    End;
    CdsDemGestAutPag.Post;
    CdsAutPagDoc.Next;
  End;
End;

procedure TRptAutPag1.montaregistro;
var
  rSaldo: real;
  iNumApGr: Integer;
  Doc: String;
begin
  CdsAutPagDoc.Edit;
  Doc := CdsAutPagDoc.FieldByName( 'CODDOCUMENTO' ).AsString;

  if OldDoc <> CdsAutPagDoc.FieldByName( 'CODDOCUMENTO' ).AsString Then
  begin

    OldDoc := CdsAutPagDoc.FieldByName( 'CODDOCUMENTO' ).AsString;
    if CdsAutPagDoc.FieldByName( 'NUMAPGR' ).IsNull Then
    begin

      // Ricardo Alves SOL: 98935 Kintana: 428807
      // gera o número da AP e armazena em iNumApGr
      if not CtrlRelatoriosCAPCAR.SetSEQAPGR(
        StrToInt( OldDoc ), CdsAutPagDoc.FieldByName( 'NUMFATURA' ).AsString,
        iNumApGr ) then
        Abort;

      CdsAutPagDoc.FieldByName( 'NUMAPGR' ).AsInteger := iNumApGr;
    end
    else
      doc := CdsAutPagDoc.FieldByName( 'CodDocumento' ).AsString;

    CdsAutPagDocAlt.Close;
    CdsAlteraParcOrigem.Close;
    Documento.Saldo.CalculaSaldo( StrToInt( Doc ) );
    rSaldo := Arredonda( Documento.Saldo.Valor, 2 );

    if not CdsAutPagDoc.FieldByName( 'NUMFATURA' ).IsNull then
    begin
      SqlAlteraParcOrigem.Prepare;
      SqlAlteraParcOrigem.Params[ 0 ].AsFloat := StrToInt( Doc );
      SqlAlteraParcOrigem.Params[ 1 ].AsFloat :=
        CdsAutPagDoc.FieldByName( 'NUMFATURA' ).AsFloat;
      SqlAlteraParcOrigem.Open;
      CdsAutPagDoc.FieldByName( 'valor' ).AsFloat :=
        Arredonda( ( CdsAutPagDoc.FieldByName( 'valor' ).AsFloat +
        CdsAlteraParcOrigem.FieldByName( 'valdecr' ).AsFloat +
        CdsAlteraParcOrigem.FieldByName( 'valimp' ).AsFloat -
        CdsAlteraParcOrigem.FieldByName( 'valacre' ).AsFloat ),
        2
        );
      CdsAutPagDoc.FieldByName( 'VLDEC' ).AsFloat :=
        Arredonda( CdsAlteraParcOrigem.FieldByName( 'valdecr' ).AsFloat, 2 );
      CdsAutPagDoc.FieldByName( 'VLACRE' ).AsFloat :=
        Arredonda( CdsAlteraParcOrigem.FieldByName( 'valacre' ).AsFloat, 2 );
      CdsAutPagDoc.FieldByName( 'VLIMP' ).AsFloat :=
        Arredonda( CdsAlteraParcOrigem.FieldByName( 'valimp' ).AsFloat, 2 );
      CdsAutPagDoc.FieldByName( 'VLLIQ' ).AsFloat := rSaldo;
    end;

    SqlAutPagDocAlt.Prepare;
    SqlAutPagDocAlt.Params[ 0 ].AsFloat := StrToInt( Doc );
    SqlAutPagDocAlt.Open;

    if CdsAutPagDoc.FieldByName( 'NumFatura' ).IsNull then
    begin
      CdsAutPagDoc.FieldByName( 'Valor' ).AsFloat :=
        Arredonda( ( CdsAutPagDoc.fieldbyname( 'Valor' ).AsFloat ), 2 );
      CdsAutPagDoc.FieldByName( 'VLLIQ' ).AsFloat := rSaldo;
    end;

    CdsAutPagDoc.FieldByName( 'VLDEC' ).AsFloat :=
      Arredonda( ( CdsAutPagDoc.FieldByName( 'VLDEC' ).AsFloat +
      CdsAutPagDocAlt.FieldByName( 'valdecr' ).AsFloat ), 2 );
    CdsAutPagDoc.FieldByName( 'VLACRE' ).AsFloat :=
      Arredonda( ( CdsAutPagDoc.FieldByName( 'VLACRE' ).AsFloat +
      CdsAutPagDocAlt.FieldByName( 'valacre' ).AsFloat ), 2 );
    CdsAutPagDoc.FieldByName( 'VLIMP' ).AsFloat :=
      Arredonda( ( CdsAutPagDoc.FieldByName( 'VLIMP' ).AsFloat +
      CdsAutPagDocAlt.FieldByName( 'valimp' ).AsFloat ), 2 );

    if strtofloat( Format( '%17.2f', [
      CdsAutPagDoc.FieldByName( 'VLLIQ' ).AsFloat ] ) ) = 0 Then
    begin
      CdsAutPagDoc.FieldByName( 'VLLIQ' ).AsFloat :=
        Arredonda( ( CdsAutPagDoc.FieldByName( 'valor' ).AsFloat +
        CdsAutPagDoc.FieldByName( 'VLACRE' ).AsFloat -
        CdsAutPagDoc.FieldByName( 'VLDEC' ).AsFloat -
        CdsAutPagDoc.FieldByName( 'VLIMP' ).AsFloat ),
        2
        );
    end;

    rVLDEC  := Arredonda( CdsAutPagDoc.FieldByName( 'VLDEC' ).AsFloat, 2 );
    rVLACRE := Arredonda( CdsAutPagDoc.FieldByName( 'VLACRE' ).AsFloat, 2 );
    rVLIMP  := Arredonda( CdsAutPagDoc.FieldByName( 'VLIMP' ).AsFloat, 2 );
    rVLLIQ  := Arredonda( CdsAutPagDoc.FieldByName( 'VLLIQ' ).AsFloat, 2);
  end
  else
  begin
    CdsAutPagDoc.FieldByName( 'VLDEC' ).AsFloat  := rVLDEC;
    CdsAutPagDoc.FieldByName( 'VLACRE' ).AsFloat := rVLACRE;
    CdsAutPagDoc.FieldByName( 'VLIMP' ).AsFloat  := rVLIMP;
    CdsAutPagDoc.FieldByName( 'VLLIQ' ).AsFloat  := rVLLIQ;
  end;
  GravaBancoAg;
  CdsAutPagDoc.post;
end;

Procedure TRptAutPag1.FormCreate(Sender: TObject);
Begin
  Inherited;
  CtrlRelatoriosCAPCAR := TCtrlRelatoriosCAPCAR.Create;
  CtrlRelatoriosCAPCAR.Initialize(DtmBaseDados.dbBaseDados, true, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer,
    True);
  Documento := TCtrlDocumento.Create;
  Documento.Initialize(DtmBaseDados.dbBaseDados, true, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer,
    True);
End;

Procedure TRptAutPag1.BuscaContaDoc(CodDocumento: Real);
Begin
  If CdsBuscaContaDoc.Active Then
    CdsBuscaContaDoc.Close;
  SqlBuscaContaDoc.Prepare;
  SqlBuscaContaDoc.Params[0].AsFloat := CodDocumento;
  SqlBuscaContaDoc.Open;
  If Not CdsBuscaContaDoc.IsEmpty Then
  Begin
    Id := CdsBuscaContaDoc.FieldByName('IDCBANCARIA').AsFloat;
    sBanco := CdsBuscaContaDoc.FieldByName('NUMBANCO').AsString;
    sNomeBanco := CdsBuscaContaDoc.FieldByName('NOMEBANCO').AsString;
    sAgencia := CdsBuscaContaDoc.FieldByName('NUMAGENCIA').AsString;
    sNomeagencia := CdsBuscaContaDoc.FieldByName('NOMEAGENCIA').AsString;
    sNumero := CdsBuscaContaDoc.FieldByName('CONTACORRENTE').AsString;
    sDescTipo := CdsBuscaContaDoc.FieldByName('DESCTIPOCONTA').AsString;
    sTipo := CdsBuscaContaDoc.FieldByName('TIPOCONTA').AsString;
    If CdsBuscaContaDoc.FieldByName('MASCARACC').IsNull Then
    Begin
      sMascaraConta := '';
      sNumeroFormat := sNumero;
    End
    Else
    Begin
      sMascaraConta := CdsBuscaContaDoc.FieldByName('MASCARACC').AsString + ';0; ';
      sNumeroFormat := FormatMasktext(sMascaraConta, sNumero);
    End;
    If CdsBuscaContaDoc.FieldByName('MASCARACC').IsNull Then
    Begin
      sMascaraAgencia := '';
      sAgenciaFormat := sAgencia;
    End
    Else
    Begin
      sMascaraAgencia := CdsBuscaContaDoc.FieldByName('MASCARAAGENCIA').AsString + ';0; ';
      sAgenciaFormat := FormatMasktext(sMascaraAgencia, sAgencia);
    End;
  End
  Else
  Begin
    If CdsBuscaContaDocForn.Active Then
      CdsBuscaContaDocForn.Close;

    SqlBuscaContaDocForn.Prepare;
    SqlBuscaContaDocForn.Params[0].AsFloat := CodDocumento;
    SqlBuscaContaDocForn.Open;
    If Not CdsBuscaContaDocForn.IsEmpty Then
    Begin
      Id := CdsBuscaContaDocForn.FieldByName('IDCBANCARIA').AsFloat;
      sBanco := CdsBuscaContaDocForn.FieldByName('NUMBANCO').AsString;
      sNomeBanco := CdsBuscaContaDocForn.FieldByName('NOMEBANCO').AsString;
      sAgencia := CdsBuscaContaDocForn.FieldByName('NUMAGENCIA').AsString;
      sNomeagencia := CdsBuscaContaDocForn.FieldByName('NOMEAGENCIA').AsString;
      sNumero := CdsBuscaContaDocForn.FieldByName('CONTACORRENTE').AsString;
      sDescTipo := CdsBuscaContaDocForn.FieldByName('DESCTIPOCONTA').AsString;
      sTipo := CdsBuscaContaDocForn.FieldByName('TIPOCONTA').AsString;

      If CdsBuscaContaDocForn.FieldByName('MASCARACC').IsNull Then
      Begin
        sMascaraConta := '';
        sNumeroFormat := sNumero;
      End
      Else
      Begin
        sMascaraConta := CdsBuscaContaDocForn.FieldByName('MASCARACC').AsString + ';0; ';
        sNumeroFormat := FormatMasktext(sMascaraConta, sNumero);
      End;

      If CdsBuscaContaDocForn.FieldByName('MASCARAAGENCIA').IsNull Then
      Begin
        sMascaraAgencia := '';
        sAgenciaFormat := sAgencia;
      End
      Else
      Begin
        sMascaraAgencia := CdsBuscaContaDocForn.FieldByName('MASCARAAGENCIA').AsString + ';0; ';
        sAgenciaFormat := FormatMasktext(sMascaraAgencia, sAgencia);
      End;
    End
    Else
    Begin
      Id := -1;
      sBanco := '';
      sNomeBanco := '';
      sAgencia := '';
      sNomeagencia := '';
      sNumero := '';
      sDescTipo := '';
      sTipo := '0';
      sMascaraConta := '';
      sMascaraAgencia := '';
      sAgenciaFormat := '';
      sNumeroFormat := '';
    End;
  End;
End;

Procedure TRptAutPag1.GravaBancoAg;
Begin
  If Not CdsAutPagDoc.FieldByName('TRGUSERINCLUSAO').IsNull Then
  Begin
    If CdsNomeUsuario.Active Then
      CdsNomeUsuario.Close;
    SqlNomeUsuario.Prepare;
    SqlNomeUsuario.Params[0].AsFloat := StrToFloat(Copy(CdsAutPagDoc.FieldByName('TRGUSERINCLUSAO').AsString, 3,
      Length(CdsAutPagDoc.FieldByName('TRGUSERINCLUSAO').AsString)));
    SqlNomeUsuario.Open;
    CdsAutPagDoc.FieldByName('NOMEUSUARIO').AsString := CdsNomeUsuario.Fields[0].AsString;
  End
  Else
    CdsAutPagDoc.FieldByName('NOMEUSUARIO').AsString := '';

  If (CdsAutPagDoc.AutoCalcFields) And
    (CdsAutPagDoc.FieldByName('FLGDOCBANCARIO').AsString = 'S') Then
  Begin
    BuscaContaDoc(CdsAutPagDoc.FieldByName('CODDOCUMENTO').AsFloat);
    CdsAutPagDoc.FieldByName('NUMBANCO').AsString := sBanco;
    CdsAutPagDoc.FieldByName('NUMAGENCIA').AsString := sAgenciaFormat;
    CdsAutPagDoc.FieldByName('CONTACORRENTE').AsString := sNumeroFormat;
  End;
End;

Procedure TRptAutPag1.ppDBText92Format(Sender: TObject;
  DisplayFormat: String; DataType: TppDataType; Value: Variant;
  Var Text: String);
Var
  sTmp: String;
Begin
  Inherited;
  If VarType(Value) = varString Then
  Begin
    sTmp := trim(VarAsType(Value, varString));
    If length(sTmp) = 11 Then
    Begin
      // CPF
      sTmp := copy(sTmp, 1, 3) +
        '.' +
        copy(sTmp, 4, 3) +
        '.' +
        copy(sTmp, 7, 3) +
        '-' +
        copy(sTmp, 10, 2);
    End
    Else If length(sTmp) = 14 Then
    Begin
      // CGC = CNPJ
      sTmp := copy(sTmp, 1, 2) +
        '.' +
        copy(sTmp, 3, 3) +
        '.' +
        copy(sTmp, 6, 3) +
        '/' +
        copy(sTmp, 9, 4) +
        '-' +
        copy(sTmp, 13, 2);
    End;
    Text := sTmp;
  End;
End;

function TRptAutPag1.Arredonda(pNumero : double;pCasas : byte) : double;
 var p: double;
     s: string;
begin
  p := pNumero * Power( 10, pCasas);
  s := floattostr(p);
  if pos(DecimalSeparator, s) <> 0 then
    p := round( p );
  p := p / Power( 10, pCasas );
  result:=p;
end;

procedure TRptAutPag1.ppDBCalc1Print(Sender: TObject);
begin
  inherited;
   ppLabel14.Caption := ppDBCalc1.Text;
end;

procedure TRptAutPag1.ppDBCalc2Print(Sender: TObject);
begin
  inherited;
  ppLabel26.Caption := ppDBCalc2.Text;
end;

End.


