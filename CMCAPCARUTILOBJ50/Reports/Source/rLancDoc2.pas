Unit rLancDoc2;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, DBClient, ppDB,
  ppDBPipe, ppDBBDE, Db, Wwdatsrc, ppBands, ppMemo, ppClass, ppCtrls,
  ppVar, ppRegion, ppStrtch, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, uCtrlDocumento,
  ppReport, DBTables, Wwquery, uCMClientDataSet, uCmSqlParams, uCtrlParamIntegra,
  ppSubRpt, TXRB;

Type
  TRptLancDoc2 = Class(TFrmCmReport)
    Dsautpagdoc: TwwDataSource;
    Ppautpagdoc: TppBDEPipeline;
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
    sqlautpagdoc: TCMSqlParams;
    sqlListaCCusto: TCMSqlParams;
    cdsListaCCusto: TCMClientDataSet;
    SqlDemGestAutPag: TCMSqlParams;
    Cdsautpagdoc: TCMClientDataSet;
    CdsAuxDemGestAutPag: TCMClientDataSet;
    SqlAuxDemGestAutPag: TCMSqlParams;
    CdsAuxDemSintGest: TCMClientDataSet;
    SqlAuxDemSintGest: TCMSqlParams;
    CdsAutPagDocAlt: TCMClientDataSet;
    SqlAutPagDocAlt: TCMSqlParams;
    CdsNomeUsuario: TCMClientDataSet;
    SqlNomeUsuario: TCMSqlParams;
    CdsAlteraParcOrigem: TCMClientDataSet;
    SqlAlteraParcOrigem: TCMSqlParams;
    CdsBuscaContaDocForn: TCMClientDataSet;
    SqlBuscaContaDocForn: TCMSqlParams;
    CdsBuscaContaDoc: TCMClientDataSet;
    SqlBuscaContaDoc: TCMSqlParams;
    DsContabLanc: TwwDataSource;
    PpContabLanc: TppBDEPipeline;
    PpContabLancppField1: TppField;
    PpContabLancppField2: TppField;
    PpContabLancppField3: TppField;
    PpContabLancppField4: TppField;
    PpContabLancppField5: TppField;
    PpContabLancppField6: TppField;
    PpContabLancppField7: TppField;
    PpContabLancppField8: TppField;
    PpContabLancppField9: TppField;
    PpContabLancppField10: TppField;
    PpContabLancppField11: TppField;
    PpContabLancppField12: TppField;
    DsContab3: TwwDataSource;
    PpContab3: TppBDEPipeline;
    PpContab3ppField1: TppField;
    PpContab3ppField2: TppField;
    PpContab3ppField3: TppField;
    PpContab3ppField4: TppField;
    PpContab3ppField5: TppField;
    PpContab3ppField6: TppField;
    PpContab3ppField7: TppField;
    PpContab3ppField8: TppField;
    PpContab3ppField9: TppField;
    PpContab3ppField10: TppField;
    PpContab3ppField11: TppField;
    PpLancAp: TppReport;
    ppHeaderBand13: TppHeaderBand;
    ppLabel73: TppLabel;
    lblParamCap: TppLabel;
    ppDetailBand17: TppDetailBand;
    ppDBText18: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppLancApDBText13: TppDBText;
    ppLancApDBText14: TppDBText;
    ppLancApDBText15: TppDBText;
    ppLancApDBText16: TppDBText;
    ppFooterBand12: TppFooterBand;
    ppLabel75: TppLabel;
    ppCalc23: TppSystemVariable;
    ppCalc24: TppSystemVariable;
    ppLancApSummaryBand1: TppSummaryBand;
    ppLancApShape4: TppShape;
    ppLancApLabel9: TppLabel;
    ppLancApLabel10: TppLabel;
    ppLancApLabel11: TppLabel;
    ppLancApLabel12: TppLabel;
    ppLancApLabel13: TppLabel;
    ppLancApLabel14: TppLabel;
    ppLancApLine3: TppLine;
    ppLancApDBText8: TppDBText;
    ppLancApDBText9: TppDBText;
    ppLancApDBText10: TppDBText;
    ppLancApDBText11: TppDBText;
    ppLancApDBText12: TppDBText;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    RgInclusao: TppRegion;
    ppLancApLabel2: TppLabel;
    ppLancApDBText2: TppDBText;
    RgEmissao: TppRegion;
    ppLancApLabel27: TppLabel;
    ppLancApDBText17: TppDBText;
    RgProgramada: TppRegion;
    ppLancApLabel28: TppLabel;
    ppLancApDBText18: TppDBText;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppLancApShape3: TppShape;
    ppLancApLabel3: TppLabel;
    ppLancApLabel4: TppLabel;
    ppLancApLabel5: TppLabel;
    ppLancApLabel6: TppLabel;
    ppLancApLabel7: TppLabel;
    ppLancApLabel8: TppLabel;
    ppLancApLine2: TppLine;
    ppLancApDBText3: TppDBText;
    ppLancApDBText4: TppDBText;
    ppLancApDBText5: TppDBText;
    ppLancApDBText6: TppDBText;
    ppLancApDBText7: TppDBText;
    ppLancApGroup1: TppGroup;
    ppLancApGroupHeaderBand1: TppGroupHeaderBand;
    ppLancApShape1: TppShape;
    ppLancApShape2: TppShape;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppDBText59: TppDBText;
    ppDBText63: TppDBText;
    ppDBText64: TppDBText;
    ppDBText65: TppDBText;
    ppDBText66: TppDBText;
    ppDBText67: TppDBText;
    ppLabel87: TppLabel;
    ppDBText68: TppDBText;
    ppLabel89: TppLabel;
    ppLabel90: TppLabel;
    ppLabel91: TppLabel;
    ppLabel94: TppLabel;
    ppLabel95: TppLabel;
    ppLabel96: TppLabel;
    ppDBText72: TppDBText;
    ppDBText73: TppDBText;
    ppDBText74: TppDBText;
    ppLancApLabel1: TppLabel;
    ppLancApDBText1: TppDBText;
    ppDBText69: TppDBText;
    ppLabel88: TppLabel;
    ppLabel97: TppLabel;
    ppDBText71: TppDBText;
    ppDBText70: TppDBText;
    ppLabel92: TppLabel;
    ppLabel93: TppLabel;
    ppLancApLine1: TppLine;
    ppLancApLabel23: TppLabel;
    ppLancApLabel24: TppLabel;
    ppLancApLabel25: TppLabel;
    ppLancApLabel26: TppLabel;
    ppLancApGroupFooterBand1: TppGroupFooterBand;
    PpRegDadosRodape: TppRegion;
    ppLabel108: TppLabel;
    ppDBMemo2: TppDBMemo;
    ppLabel109: TppLabel;
    ppDBText75: TppDBText;
    LblBancoAp: TppLabel;
    DbeBancoAp: TppDBText;
    DbeAgenciaAp: TppDBText;
    LblAgenciaAp: TppLabel;
    DbeContaAp: TppDBText;
    LblContaAp: TppLabel;
    SrptContanParcelado: TppSubReport;
    ppLancApChildReport2: TppChildReport;
    ppLancApDetailBand2: TppDetailBand;
    ppLancApDBText19: TppDBText;
    ppLancApDBText20: TppDBText;
    ppLancApDBText21: TppDBText;
    ppLancApDBText22: TppDBText;
    ppLancApDBText23: TppDBText;
    ppLancApDBText24: TppDBText;
    ppLancApDBText25: TppDBText;
    ppLancApChildReport2DBText9: TppDBText;
    ppLancApChildReport2DBMemo2: TppDBMemo;
    ppLancApChildReport2DBText1: TppDBText;
    SrptContabEfetivo: TppSubReport;
    ppLancApChildReport3: TppChildReport;
    ppLancApHeaderBand1: TppHeaderBand;
    ppLancApLabel15: TppLabel;
    ppLancApLabel16: TppLabel;
    ppLancApLabel17: TppLabel;
    ppLancApLabel18: TppLabel;
    ppLancApLabel19: TppLabel;
    ppLancApLine4: TppLine;
    ppLancApLabel20: TppLabel;
    ppLancApLabel21: TppLabel;
    ppLancApLabel22: TppLabel;
    ppLancApChildReport3Label1: TppLabel;
    ppLancApChildReport3Label2: TppLabel;
    ppLancApDetailBand3: TppDetailBand;
    ppLancApDBText26: TppDBText;
    ppLancApDBText27: TppDBText;
    ppLancApDBText28: TppDBText;
    ppLancApDBText29: TppDBText;
    ppLancApDBText30: TppDBText;
    ppLancApDBText31: TppDBText;
    ppLancApDBText32: TppDBText;
    ppLancApChildReport3DBText1: TppDBText;
    ppLancApChildReport3DBMemo1: TppDBMemo;
    ppLancApChildReport3DBText2: TppDBText;
    cdsContabLanc: TCMClientDataSet;
    sqlContabLanc: TCMSqlParams;
    cdsContab3: TCMClientDataSet;
    sqlContab3: TCMSqlParams;
    Procedure CrmRptCMBeforePrint(Sender: TObject);
    Procedure Montaregistro;
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

    Documento: TCtrlDocumento;
  public
    { Public declarations }
  End;

Var
  RptLancDoc2: TRptLancDoc2;

Implementation

{$R *.DFM}

Procedure TRptLancDoc2.CrmRptCMBeforePrint(Sender: TObject);
Var
  rSumValorBruto, rSumValorDeducoes, rSumValorAcrescimo, rSumValorImposto,
    rSumValorAPagar, rSumValorLanctoLiq, rTotValorLanctoLiq, rTotValorBruto,
    rTotValorDeducoes, rTotValorAcrescimo, rTotValorImposto, rTotValorAPagar: Double;
  sTitulo, sCampodata, sDescData, sListaCentroRespon, sCamposOrder,
    sStatus, sGrupo0, sGrupo1, sCampoData0, sCampoData1, OldCodDoc,
    OldCCusto, sListCusto: String;
   X: Integer;

  rgdata, RgSitDoc, RgStatus: integer;
  DtIni, DtFin, RgSitDocNome, cmpForcli, sListaDescricao, moduloCodDocCPMF: String;
Begin
  Inherited;

  rgdata := CmpRptCM.ParamValues[0].AsInteger;
  RgSitDoc := CmpRptCM.ParamValues[1].AsInteger;
  RgStatus := CmpRptCM.ParamValues[2].AsInteger;
  DtIni := CmpRptCM.ParamValues[3].AsString;
  DtFin := CmpRptCM.ParamValues[4].AsString;
  RgSitDocNome := CmpRptCM.ParamValues[5].AsString;
  sListaDescricao := CmpRptCM.ParamValues[6].AsString;
  moduloCodDocCPMF := CmpRptCM.ParamValues[7].AsString;
  sCamposOrder := CmpRptCM.ParamValues[8].AsString;
  sListaCentroRespon := CmpRptCM.ParamValues[10].aSsTRING;
  CmpForCli := CmpRptCM.ParamValues[11].aSsTRING;

  Case Rgdata Of
    0:
      Begin
        sCampodata := 'TRGDTINCLUSAO ';
        sDescData := ' - Data de Inclusão ';
      End;
    1:
      Begin
        sCampodata := 'DATAEMISSAO ';
        sDescData := ' - Data de Emissão ';
      End;
    2:
      Begin
        sCampodata := 'DATAPROGRAMADA ';
        sDescData := ' - Data Programada ';
      End;
  End;

  Case RgSitDoc Of
    0: sStatus := '0';
    1: sStatus := '2';
    2: sStatus := '';
  End;

  sTitulo := 'Lançamento de Documentos - Modelo 2';

  If (DtIni <> '') And (DtFin <> '') Then
    sTitulo := sTitulo + sDescData + ' - Entre ' + DtIni + ' e ' + DtFin
  Else If (DtIni <> '') Then
    sTitulo := sTitulo + sDescData + ' - Em ' + DtIni
  Else If (DtFin <> '') Then
    sTitulo := sTitulo + sDescData + ' - Em ' + DtFin;

  If sStatus <> '' Then
    sTitulo := sTitulo + ' Listagem de Documentos ' + RgSitDocNome;

  Case RgStatus Of
    0: sTitulo := sTitulo + ' - Somente Documentos Autorizados';
    1: sTitulo := sTitulo + ' - Somente Documentos Não Autorizados';
    2: sTitulo := sTitulo + ' - Todos os Documentos';
  End;

  With SqlAutPagDoc Do
  Begin
    SQL.Clear;
    SQL.Add('SELECT                                                                     ');
    SQL.Add('             NUMFATURA,                                                    ');
    SQL.Add('             CODDOCUMENTO,                                                 ');
    SQL.Add('             NUMAPGR,                                                      ');
    SQL.Add('             REFERENCIA,                                                   ');
    SQL.Add('             NODOCUMENTO,                                                  ');
    SQL.Add('             COMPLDOCUMENTO,                                               ');
    SQL.Add('             DATAVENCTO,                                                   ');
    SQL.Add('             DATAEMISSAO,                                                  ');
    SQL.Add('             DATAPROGRAMADA,                                               ');
    SQL.Add('             NUMDOCUMENTO,                                                 ');
    SQL.Add('             VALOR,                                                        ');
    SQL.Add('             VALOROUTRAMOEDA,                                              ');
    SQL.Add('             RAZAOSOCIAL,                                                  ');
    SQL.Add('             DESCRICAO,                                                    ');
    SQL.Add('             VALORRATEIO,                                                  ');
    SQL.Add('             DESCTDR,                                                      ');
    SQL.Add('             NOMEAP,                                                       ');
    SQL.Add('             NOMECR,                                                       ');
    SQL.Add('             NOMECC,                                                       ');
    SQL.Add('             OBS,                                                          ');
    SQL.Add('             FLGDOCBANCARIO,                                               ');
    SQL.Add('             VLACRE,                                                       ');
    SQL.Add('             VLDEC,                                                        ');
    SQL.Add('             VLIMP,                                                        ');
    SQL.Add('             VLLIQ,                                                        ');
    SQL.Add('             TRGUSERINCLUSAO,                                              ');
    SQL.Add('             TO_DATE(TO_CHAR(TRGDTINCLUSAO, ''DD/MM/YYYY''),               ');
    SQL.Add('                                               ''DD/MM/YYYY'')             ');
    SQL.Add('             As TRDTINCLUSAO,                                              ');
    SQL.Add('             (0) As TOTVALORBRUTO,                                         ');
    SQL.Add('             (0) As TOTVALORDEDUCOES,                                      ');
    SQL.Add('             (0) As TOTVALORACRESCIMO,                                     ');
    SQL.Add('             (0) As TOTVALORIMPOSTO,                                       ');
    SQL.Add('             (0) As TOTVALORAPAGAR,                                        ');
    SQL.Add('             (0) As SUMVALORBRUTO,                                         ');
    SQL.Add('             (0) As SUMVALORDEDUCOES,                                      ');
    SQL.Add('             (0) As SUMVALORACRESCIMO,                                     ');
    SQL.Add('             (0) As SUMVALORIMPOSTO,                                       ');
    SQL.Add('             (0) As SUMVALORAPAGAR,                                        ');
    SQL.Add('             NUMIMOVEL,                                                    ');
    SQL.Add('             NOMEPATRO,                                                    ');
    SQL.Add('             DESCPLANO,                                                    ');
    SQL.Add('             DESCPROGRAMA,                                                 ');
    SQL.Add('  IDFORCLI,                                                                ');
    SQL.Add('    (0) AS VALOLANCTOLIQ,                                                  ');
    SQL.Add('    (0) AS SUMVALOLANCTOLIQ                                                ');
    SQL.Add('  FROM                                                                     ');
    SQL.Add('    (                                                                      ');
    SQL.Add('      SELECT                                                               ');
    SQL.Add('        D.NUMFATURA,                                                       ');
    SQL.Add('        D.CODDOCUMENTO,                                                    ');
    SQL.Add('        D.NUMAPGR,                                                         ');
    SQL.Add('        D.REFERENCIA,                                                      ');
    SQL.Add('        D.NODOCUMENTO,                                                     ');
    SQL.Add('        D.COMPLDOCUMENTO,                                                  ');
    SQL.Add('        D.DATAVENCTO,                                                      ');
    SQL.Add('        D.DATAEMISSAO,                                                     ');
    SQL.Add('        D.DATAPROGRAMADA,                                                  ');
    SQL.Add('        P.NUMDOCUMENTO,                                                    ');
    SQL.Add('        decode                                                             ');
    SQL.Add('        (                                                                  ');
    SQL.Add('          d.recpag,                                                        ');
    SQL.Add('          ''P'',                                                           ');
    SQL.Add('          decode                                                           ');
    SQL.Add('          (                                                                ');
    SQL.Add('            l.debcre,                                                      ');
    SQL.Add('            ''C'',                                                         ');
    SQL.Add('            L.VALOR,                                                       ');
    SQL.Add('            l.valor*-1                                                     ');
    SQL.Add('          ),                                                               ');
    SQL.Add('          decode                                                           ');
    SQL.Add('          (                                                                ');
    SQL.Add('            l.debcre,                                                      ');
    SQL.Add('            ''D'',                                                         ');
    SQL.Add('            L.VALOR,                                                       ');
    SQL.Add('            l.valor*-1                                                     ');
    SQL.Add('          )                                                                ');
    SQL.Add('        ) as valor,                                                        ');
    SQL.Add('        decode                                                             ');
    SQL.Add('        (                                                                  ');
    SQL.Add('          d.recpag,                                                        ');
    SQL.Add('          ''P'',                                                           ');
    SQL.Add('          decode                                                           ');
    SQL.Add('          (                                                                ');
    SQL.Add('            l.debcre,                                                      ');
    SQL.Add('            ''C'',                                                         ');
    SQL.Add('            L.VALOROUTRAMOEDA,                                             ');
    SQL.Add('            L.VALOROUTRAMOEDA*-1                                           ');
    SQL.Add('          ),                                                               ');
    SQL.Add('          decode                                                           ');
    SQL.Add('          (                                                                ');
    SQL.Add('            l.debcre,                                                      ');
    SQL.Add('            ''D'',                                                         ');
    SQL.Add('            L.VALOROUTRAMOEDA,                                             ');
    SQL.Add('            L.VALOROUTRAMOEDA*-1                                           ');
    SQL.Add('          )                                                                ');
    SQL.Add('        ) as valoroutramoeda,                                              ');
    SQL.Add('        P.RAZAOSOCIAL,                                                     ');
    SQL.Add('        F.DESCRICAO,                                                       ');
    SQL.Add('        SUM(RD.VALOR) AS VALORRATEIO,                                      ');
    SQL.Add('        TDR.DESCRICAO AS DESCTDR,                                          ');
    SQL.Add('        AP.NOME AS NOMEAP,                                                 ');
    SQL.Add('        CR.NOME AS NOMECR,                                                 ');
    SQL.Add('  --    CC.NOME AS NOMECC,                                                 ');
    SQL.Add('        DECODE                                                             ');
    SQL.Add('        (                                                                  ');
    SQL.Add('                    trim(CC.NOME),                                         ');
    SQL.Add('          '''',                                                            ');
    SQL.Add('          CR.NOME,                                                         ');
    SQL.Add('          CC.NOME                                                          ');
    SQL.Add('        ) AS NOMECC,                                                       ');
    SQL.Add('        D.OBS,                                                             ');
    SQL.Add('        F.FLGDADOSBANCARIOS AS FLGDOCBANCARIO,                             ');
    SQL.Add('        (0) AS VLACRE,                                                     ');
    SQL.Add('        (0) AS VLDEC,                                                      ');
    SQL.Add('        (0) AS VLIMP,                                                      ');
    SQL.Add('        (0) AS VLLIQ,                                                      ');
    SQL.Add('        D.TRGUSERINCLUSAO,                                                 ');
    SQL.Add('        D.TRGDTINCLUSAO,                                                   ');
    SQL.Add('        RD.NUMIMOVEL,                                                      ');
    SQL.Add('        PATRO.NOME AS NOMEPATRO,                                           ');
    SQL.Add('        PLANO.NOME AS DESCPLANO,                                           ');
    SQL.Add('        PROGRAMA.DESCPROGRAMA,                                             ');
    SQL.Add('        D.IDFORCLI                                                         ');
    SQL.Add('      FROM                                                                 ');
    SQL.Add('        PESSOA P,                                                          ');
    SQL.Add('        PESSOA PATRO,                                                      ');
    SQL.Add('        DOCUMENTO D,                                                       ');
    SQL.Add('        LANCTODOCUM L,                                                     ');
    SQL.Add('        RATEIODOCUM RD,                                                    ');
    SQL.Add('        FORMARECPAG F,                                                     ');
    SQL.Add('        TIPORECEBDESEMB TDR,                                               ');
    SQL.Add('        CENTCUST CC,                                                       ');
    SQL.Add('        UNIDNEGOCIO AP,                                                    ');
    SQL.Add('        CENTRESPON CR,                                                     ');
    SQL.Add('        PLANPREVCONTABIL PLANO,                                            ');
    SQL.Add('        PROGRAMA                                                           ');
    SQL.Add('    WHERE                                                                  ');
    SQL.Add('         -- #ADF1                                                          ');

    //Adiciona Filtro no primeiro grupo de SELECT'S
    If (sListaCentroRespon <> '') Then
      sql.add(' (RD.CODCENTRORESPON IN (' + sListaCentroRespon + ')) AND ');

    Case RgStatus Of
      0: sql.add(' (D.NUMAPGR IS NOT NULL) AND ');
      1: sql.add(' (D.NUMAPGR IS  NULL) AND ');
    End;

    If (Trim(CmpForCli) <> '') Then
      sql.add(' (D.IDFORCLI = ' + CmpForCli + ') AND ');

    If (Trim(DtIni) <> '') Then
      sql.add('TO_DATE(TO_CHAR(D.' + sCampodata + ',''DD/MM/YYYY''),''DD/MM/YYYY'') >=  TO_DATE(' + #39 +
        Trim(DtIni) + #39 + ',''DD/MM/YYYY'') AND ');

    If (Trim(DtFin) <> '') Then
      sql.add('TO_DATE(TO_CHAR(D.' + sCampodata + ',''DD/MM/YYYY''),''DD/MM/YYYY'') <=  TO_DATE(' + #39 +
        Trim(DtFin) + #39 + ',''DD/MM/YYYY'') AND ');

    If sStatus = '0' Then
      sql.add(' (RTRIM(D.STATUS) = ''0'' OR D.STATUS IS NULL) AND ')
    Else If sStatus = '2' Then
      sql.add('(RTRIM(D.STATUS) = ''2'') AND ');

    SQL.Add('        -- STRING PARA ADICIONAR FILTRO DAS TELAS DE PARÂMETRO NA CONSULTA ');
    SQL.Add('              D.CODTIPDOC IN                                               ');
    SQL.Add('              (                                                            ');
    SQL.Add('                SELECT                                                     ');
    SQL.Add('                  CODTIPDOC                                                ');
    SQL.Add('                FROM                                                       ');
    SQL.Add('                  TIPODOCRECPAG A                                          ');
    SQL.Add('                WHERE                                                      ');
    SQL.Add('                  A.RECPAG = ''' + ParamIntegra.RecPag + ''' AND           ');
    SQL.Add('                  NOT EXISTS                                               ');
    SQL.Add('                  (                                                        ');
    SQL.Add('                    SELECT                                                 ');
    SQL.Add('                      *                                                    ');
    SQL.Add('                    FROM                                                   ');
    SQL.Add('                      USUARIOXTPDOCTO B                                    ');
    SQL.Add('                    WHERE                                                  ');
    SQL.Add('                      RECPAG= ''' + ParamIntegra.RecPag + ''' AND          ');
    SQL.Add('                      B.IDUSUARIO = ' + INtToStr(CrmRptCM.IdUsuario) + '   ');
    SQL.Add('                  )                                                        ');
    SQL.Add('                UNION                                                      ');
    SQL.Add('                  SELECT                                                   ');
    SQL.Add('                    CODTIPDOC                                              ');
    SQL.Add('                  FROM                                                     ');
    SQL.Add('                    TIPODOCRECPAG A                                        ');
    SQL.Add('                  WHERE                                                    ');
    SQL.Add('                    A.RECPAG =''' + ParamIntegra.RecPag + ''' AND          ');
    SQL.Add('                    EXISTS                                                 ');
    SQL.Add('                    (                                                      ');
    SQL.Add('                      SELECT                                               ');
    SQL.Add('                        *                                                  ');
    SQL.Add('                      FROM                                                 ');
    SQL.Add('                        USUARIOXTPDOCTO B                                  ');
    SQL.Add('                      WHERE                                                ');
    SQL.Add('                        RECPAG = ''' + ParamIntegra.RecPag + ''' AND       ');
    SQL.Add('                        A.CODTIPDOC = B.CODTIPDOC AND                      ');
    SQL.Add('                        B.IDUSUARIO = ' + INtToStr(CrmRptCM.IdUsuario) + ' ');
    SQL.Add('                    )                                                      ');
    SQL.Add('              ) AND                                                        ');
    SQL.Add('              (d.numfatura is null) and                                    ');
    SQL.Add('              (L.ESTORNO IS NULL) AND                                      ');
    SQL.Add('              (D.RECPAG = ''' + ParamIntegra.RecPag + ''') AND             ');
    SQL.Add('              (D.IDPESSOA =  ' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND   ');
    SQL.Add('              (D.CODDOCUMENTO = L.CODDOCUMENTO) AND                        ');
    SQL.Add('              (D.OPERACAO = L.OPERACAO) AND                                ');
    SQL.Add('              (D.CODDOCUMENTO = RD.CODDOCUMENTO) AND                       ');
    SQL.Add('              (P.IDPESSOA = D.IDFORCLI) AND                                ');
    SQL.Add('              (D.CODFORMA = F.CODFORMA(+)) AND                             ');
    SQL.Add('              (CC.CODCENTROCUSTO(+) = RD.CODCENTROCUSTO) AND               ');
    SQL.Add('              (CC.IDEMPRESA(+) = RD.IDEMPRESA) AND                         ');
    SQL.Add('              (TDR.CODTIPRECDES(+) = RD.CODTIPRECDES) AND                  ');
    SQL.Add('              (TDR.RECPAG(+) = RD.RECPAG) AND                              ');
    SQL.Add('              (TDR.IDPESSOA(+) = RD.IDPESSOA) AND                          ');
    SQL.Add('              (AP.UNIDNEGOC(+) = RD.UNIDNEGOC) AND                         ');
    SQL.Add('              (AP.IDPESSOA(+) = RD.IDPESSOA) AND                           ');
    SQL.Add('              (CR.CODCENTRORESPON(+) = RD.CODCENTRORESPON) AND             ');
    SQL.Add('              (CR.IDPESSOA(+) = RD.IDPESSOA) AND                           ');
    SQL.Add('              (PLANO.IDPLANOPREV(+) = RD.IDPLANOPREV) AND                  ');
    SQL.Add('              (PROGRAMA.IDPROGRAMA(+) = RD.IDPROGRAMA) AND                 ');
    SQL.Add('              (PATRO.IDPESSOA(+) = RD.IDPATRO)                             ');
    SQL.Add('            GROUP BY                                                       ');
    SQL.Add('              L.VALOR,                                                     ');
    SQL.Add('              D.NUMFATURA,                                                 ');
    SQL.Add('              D.CODDOCUMENTO,                                              ');
    SQL.Add('              D.NUMAPGR,                                                   ');
    SQL.Add('              D.REFERENCIA,                                                ');
    SQL.Add('              D.NODOCUMENTO,                                               ');
    SQL.Add('              D.COMPLDOCUMENTO,                                            ');
    SQL.Add('              D.DATAVENCTO,                                                ');
    SQL.Add('              D.DATAEMISSAO,                                               ');
    SQL.Add('              D.DATAPROGRAMADA,                                            ');
    SQL.Add('              P.NUMDOCUMENTO,                                              ');
    SQL.Add('              d.recpag,                                                    ');
    SQL.Add('              l.debcre,                                                    ');
    SQL.Add('              L.VALOROUTRAMOEDA,                                           ');
    SQL.Add('              P.RAZAOSOCIAL,                                               ');
    SQL.Add('              F.DESCRICAO,                                                 ');
    SQL.Add('        --      RD.VALOR,                                                  ');
    SQL.Add('              TDR.DESCRICAO,                                               ');
    SQL.Add('              AP.NOME,                                                     ');
    SQL.Add('              CR.NOME,                                                     ');
    SQL.Add('              CC.NOME,                                                     ');
    SQL.Add('              D.OBS,                                                       ');
    SQL.Add('              F.FLGDADOSBANCARIOS,                                         ');
    SQL.Add('              D.TRGUSERINCLUSAO,                                           ');
    SQL.Add('              D.TRGDTINCLUSAO,                                             ');
    SQL.Add('              RD.NUMIMOVEL,                                                ');
    SQL.Add('              PATRO.NOME,                                                  ');
    SQL.Add('              PLANO.NOME,                                                  ');
    SQL.Add('              PROGRAMA.DESCPROGRAMA,                                       ');
    SQL.Add('              D.IDFORCLI                                                   ');
    SQL.Add('            UNION                                                          ');
    SQL.Add('              SELECT                                                       ');
    SQL.Add('                Q1.NUMFATURA,                                              ');
    SQL.Add('                Q1.CODDOCUMENTO,                                           ');
    SQL.Add('                Q1.NUMAPGR,                                                ');
    SQL.Add('                Q1.REFERENCIA,                                             ');
    SQL.Add('                Q1.NODOCUMENTO,                                            ');
    SQL.Add('                Q1.COMPLDOCUMENTO,                                         ');
    SQL.Add('                Q1.DATAVENCTO,                                             ');
    SQL.Add('                Q1.DATAEMISSAO,                                            ');
    SQL.Add('                Q1.DATAPROGRAMADA,                                         ');
    SQL.Add('                Q1.NUMDOCUMENTO,                                           ');
    SQL.Add('                Q1.VALOR,                                                  ');
    SQL.Add('                Q1.VALOROUTRAMOEDA,                                        ');
    SQL.Add('                Q1.RAZAOSOCIAL,                                            ');
    SQL.Add('                Q1.DESCRICAO,                                              ');
    SQL.Add('                SUM(((Q1.VALOR * Q2.VALOR)/ Q3.VALOR)) AS VALORRATEIO,     ');
    SQL.Add('                Q2.DESCTDR,                                                ');
    SQL.Add('                Q2.NOMEAP,                                                 ');
    SQL.Add('                Q2.NOMECR,                                                 ');
    SQL.Add('                Q2.NOMECC,                                                 ');
    SQL.Add('                Q1.OBS,                                                    ');
    SQL.Add('                Q1.FLGDOCBANCARIO,                                         ');
    SQL.Add('                (0) AS VLACRE,                                             ');
    SQL.Add('                (0) AS VLDEC,                                              ');
    SQL.Add('                (0) AS VLIMP,                                              ');
    SQL.Add('                (0) AS VLLIQ,                                              ');
    SQL.Add('                Q1.TRGUSERINCLUSAO,                                        ');
    SQL.Add('                Q1.TRGDTINCLUSAO,                                          ');
    SQL.Add('                Q2.NUMIMOVEL,                                              ');
    SQL.Add('                Q2.NOMEPATRO,                                              ');
    SQL.Add('                Q2.DESCPLANO,                                              ');
    SQL.Add('                Q2.DESCPROGRAMA,                                           ');
    SQL.Add('                Q1.IDFORCLI                                                ');
    SQL.Add('              FROM                                                         ');
    SQL.Add('                (                                                          ');
    SQL.Add('                  SELECT                                                   ');
    SQL.Add('                    DOC.NUMFATURA,                                         ');
    SQL.Add('                    DOC.CODDOCUMENTO,                                      ');
    SQL.Add('                    DOC.NUMAPGR,                                           ');
    SQL.Add('                    DOC.REFERENCIA,                                        ');
    SQL.Add('                    DOC.NODOCUMENTO,                                       ');
    SQL.Add('                    DOC.COMPLDOCUMENTO,                                    ');
    SQL.Add('                    DOC.DATAVENCTO,                                        ');
    SQL.Add('                    DOC.DATAEMISSAO,                                       ');
    SQL.Add('                    DOC.DATAPROGRAMADA,                                    ');
    SQL.Add('                    P.NUMDOCUMENTO,                                        ');
    SQL.Add('                    decode                                                 ');
    SQL.Add('                    (                                                      ');
    SQL.Add('                      doc.recpag,                                          ');
    SQL.Add('                      ''P'',                                               ');
    SQL.Add('                      decode                                               ');
    SQL.Add('                      (                                                    ');
    SQL.Add('                        lan.debcre,                                        ');
    SQL.Add('                        ''C'',                                             ');
    SQL.Add('                        Lan.VALOR,                                         ');
    SQL.Add('                        lan.valor*-1                                       ');
    SQL.Add('                      ),                                                   ');
    SQL.Add('                      decode                                               ');
    SQL.Add('                      (                                                    ');
    SQL.Add('                        lan.debcre,                                        ');
    SQL.Add('                        ''D'',                                             ');
    SQL.Add('                        Lan.VALOR,                                         ');
    SQL.Add('                        lan.valor*-1                                       ');
    SQL.Add('                      )                                                    ');
    SQL.Add('                    ) as valor,                                            ');
    SQL.Add('                    decode                                                 ');
    SQL.Add('                    (                                                      ');
    SQL.Add('                      doc.recpag,                                          ');
    SQL.Add('                      ''P'',                                               ');
    SQL.Add('                      decode                                               ');
    SQL.Add('                      (                                                    ');
    SQL.Add('                        lan.debcre,                                        ');
    SQL.Add('                        ''C'',                                             ');
    SQL.Add('                        Lan.VALOROUTRAMOEDA,                               ');
    SQL.Add('                        Lan.VALOROUTRAMOEDA*-1                             ');
    SQL.Add('                      ),                                                   ');
    SQL.Add('                      decode                                               ');
    SQL.Add('                      (                                                    ');
    SQL.Add('                        lan.debcre,                                        ');
    SQL.Add('                        ''D'',                                             ');
    SQL.Add('                        Lan.VALOROUTRAMOEDA,                               ');
    SQL.Add('                        Lan.VALOROUTRAMOEDA*-1                             ');
    SQL.Add('                      )                                                    ');
    SQL.Add('                    ) as valoroutramoeda,                                  ');
    SQL.Add('                    P.RAZAOSOCIAL,                                         ');
    SQL.Add('                    F.DESCRICAO,                                           ');
    SQL.Add('                    DOC.OBS,                                               ');
    SQL.Add('                    F.FLGDADOSBANCARIOS AS FLGDOCBANCARIO,                 ');
    SQL.Add('                    (0) AS VLACRE,                                         ');
    SQL.Add('                    (0) AS VLDEC,                                          ');
    SQL.Add('                    (0) AS VLIMP,                                          ');
    SQL.Add('                    (0) AS VLLIQ,                                          ');
    SQL.Add('                    DOC.TRGUSERINCLUSAO,                                   ');
    SQL.Add('                    DOC.TRGDTINCLUSAO,                                     ');
    SQL.Add('                    DOC.IDFORCLI                                           ');
    SQL.Add('                  FROM                                                     ');
    SQL.Add('                    PESSOA P,                                              ');
    SQL.Add('                    DOCUMENTO DOC,                                         ');
    SQL.Add('                    LANCTODOCUM LAN,                                       ');
    SQL.Add('                    FORMARECPAG F                                          ');
    SQL.Add('                  WHERE                                                    ');
    SQL.Add('        -- #ADF2                                                           ');

    //Adiciona Filtro no segundo grupo de SELECT'S
    Case RgStatus Of
      0: sql.add(' (DOC.NUMAPGR IS NOT NULL) AND ');
      1: sql.add('(DOC.NUMAPGR IS  NULL) AND ');
    End;

    If (Trim(CmpForCli) <> '') Then
      sql.add(' (DOC.IDFORCLI = ' + CmpForCli + ') AND ');

    If (Trim(DtIni) <> '') Then
      sql.add(' TO_DATE(TO_CHAR(DOC.' + sCampodata + ',''DD/MM/YYYY''),''DD/MM/YYYY'') >=  TO_DATE(' + #39 +
        TRIM(DtIni) + #39 + ',''DD/MM/YYYY'') AND ');

    If (Trim(DtFin) <> '') Then
      sql.add(' TO_DATE(TO_CHAR(DOC.' + sCampodata + ',''DD/MM/YYYY''),''DD/MM/YYYY'') <=  TO_DATE(' + #39 +
        TRIM(DtFin) + #39 + ',''DD/MM/YYYY'') AND ');

    If sStatus = '0' Then
      sql.add(' (RTRIM(DOC.STATUS) = ''0'' OR DOC.STATUS IS NULL) AND ')
    Else If sStatus = '2' Then
      sql.add('  (RTRIM(DOC.STATUS) = ''2'') AND ');

    SQL.Add('   -- STRING PARA ADICIONAR FILTRO DAS TELAS DE PARÂMETRO NA CONSULTA      ');
    SQL.Add('               DOC.CODTIPDOC IN                                            ');
    SQL.Add('               (                                                           ');
    SQL.Add('                 SELECT                                                    ');
    SQL.Add('                   CODTIPDOC                                               ');
    SQL.Add('                 FROM                                                      ');
    SQL.Add('                   TIPODOCRECPAG A                                         ');
    SQL.Add('                 WHERE                                                     ');
    SQL.Add('                   A.RECPAG = ''' + ParamIntegra.RecPag + ''' AND          ');
    SQL.Add('                   NOT EXISTS                                              ');
    SQL.Add('                   (                                                       ');
    SQL.Add('                     SELECT                                                ');
    SQL.Add('                       *                                                   ');
    SQL.Add('                     FROM                                                  ');
    SQL.Add('                       USUARIOXTPDOCTO B                                   ');
    SQL.Add('                     WHERE                                                 ');
    SQL.Add('                       RECPAG = ''' + ParamIntegra.RecPag + ''' AND        ');
    SQL.Add('                       B.IDUSUARIO = ' + INtToStr(CrmRptCM.IdUsuario) + '  ');
    SQL.Add('                   )                                                       ');
    SQL.Add('                 UNION                                                     ');
    SQL.Add('                   SELECT                                                  ');
    SQL.Add('                     CODTIPDOC                                             ');
    SQL.Add('                   FROM                                                    ');
    SQL.Add('                     TIPODOCRECPAG A                                       ');
    SQL.Add('                   WHERE                                                   ');
    SQL.Add('                     A.RECPAG = ''' + ParamIntegra.RecPag + ''' AND        ');
    SQL.Add('                     EXISTS                                                ');
    SQL.Add('                     (                                                     ');
    SQL.Add('                       SELECT                                              ');
    SQL.Add('                         *                                                 ');
    SQL.Add('                       FROM                                                ');
    SQL.Add('                         USUARIOXTPDOCTO B                                 ');
    SQL.Add('                       WHERE                                               ');
    SQL.Add('                         RECPAG = ''' + ParamIntegra.RecPag + ''' AND      ');
    SQL.Add('                         A.CODTIPDOC = B.CODTIPDOC AND                     ');
    SQL.Add('                         B.IDUSUARIO = ' + INtToStr(CrmRptCM.IdUsuario) + '');
    SQL.Add('                     )                                                     ');
    SQL.Add('               ) AND                                                       ');
    SQL.Add('               (LAN.ESTORNO IS NULL) AND                                   ');
    SQL.Add('               (DOC.RECPAG = ''' + ParamIntegra.RecPag + ''') AND          ');
    SQL.Add('               (DOC.IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
    SQL.Add('               (P.IDPESSOA = DOC.IDFORCLI)AND                              ');
    SQL.Add('               (DOC.CODFORMA = F.CODFORMA(+)) AND                          ');
    SQL.Add('               (RTRIM(LAN.OPERACAO) IN (''3'',''13'')) AND                 ');
    SQL.Add('               (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)                       ');
    SQL.Add('           ) Q1,                                                           ');
    SQL.Add('           (                                                               ');
    SQL.Add('             SELECT                                                        ');
    SQL.Add('               D.NUMFATURA,                                                ');
    SQL.Add('               (                                                           ');
    SQL.Add('                 DECODE                                                    ');
    SQL.Add('                 (                                                         ');
    SQL.Add('                   D.RECPAG,                                               ');
    SQL.Add('                   ''P'',                                                  ');
    SQL.Add('                   DECODE                                                  ');
    SQL.Add('                   (                                                       ');
    SQL.Add('                     L.DEBCRE,                                             ');
    SQL.Add('                     ''C'',                                                ');
    SQL.Add('                     Rd.VALOR,                                             ');
    SQL.Add('                     Rd.VALOR * -1                                         ');
    SQL.Add('                   ),                                                      ');
    SQL.Add('                   DECODE                                                  ');
    SQL.Add('                   (                                                       ');
    SQL.Add('                     L.DEBCRE,                                             ');
    SQL.Add('                     ''D'',                                                ');
    SQL.Add('                     Rd.VALOR,                                             ');
    SQL.Add('                     Rd.VALOR * -1                                         ');
    SQL.Add('                   )                                                       ');
    SQL.Add('                 )                                                         ');
    SQL.Add('               ) as valor,                                                 ');
    SQL.Add('               TDR.DESCRICAO AS DESCTDR,                                   ');
    SQL.Add('               AP.NOME AS NOMEAP,                                          ');
    SQL.Add('               CR.NOME AS NOMECR,                                          ');
    SQL.Add('   --          CC.NOME AS NOMECC,                                          ');
    SQL.Add('               DECODE                                                      ');
    SQL.Add('               (                                                           ');
    SQL.Add('                 trim(CC.NOME),                                            ');
    SQL.Add('                 '''',                                                     ');
    SQL.Add('                 CR.NOME,                                                  ');
    SQL.Add('                 CC.NOME                                                   ');
    SQL.Add('               ) AS NOMECC,                                                ');
    SQL.Add('               RD.NUMIMOVEL,                                               ');
    SQL.Add('               PATRO.NOME AS NOMEPATRO,                                    ');
    SQL.Add('               PLANO.NOME AS DESCPLANO,                                    ');
    SQL.Add('               PROGRAMA.DESCPROGRAMA                                       ');
    SQL.Add('             FROM                                                          ');
    SQL.Add('               PESSOA PATRO,                                               ');
    SQL.Add('               DOCUMENTO D,                                                ');
    SQL.Add('               LANCTODOCUM L,                                              ');
    SQL.Add('               RATEIODOCUM RD,                                             ');
    SQL.Add('               TIPORECEBDESEMB TDR,                                        ');
    SQL.Add('               CENTCUST CC,                                                ');
    SQL.Add('               UNIDNEGOCIO AP,                                             ');
    SQL.Add('               CENTRESPON CR,                                              ');
    SQL.Add('               PLANPREVCONTABIL PLANO,                                     ');
    SQL.Add('               PROGRAMA                                                    ');
    SQL.Add('             WHERE                                                         ');
    SQL.Add('   -- #ADF3                                                                ');
    //Adiciona Filtro no terceiro grupo de SELECT'S
    If (sListaCentroRespon <> '') Then
    Begin
      sql.Add(' RD.CODCENTRORESPON IN (' + sListaCentroRespon + ') AND ');
    End;
    If (Trim(CmpForCli) <> '') Then
      sql.add(' (D.IDFORCLI = ' + CmpForCli + ') AND ');
    If Not Prepared Then

      SQL.Add(' -- STRING PARA ADICIONAR FILTRO DAS TELAS DE PARÂMETRO NA CONSULTA      ');
    SQL.Add('               (D.RECPAG = ''' + ParamIntegra.RecPag + ''') AND            ');
    SQL.Add('               d.coddocumento=l.coddocumento and                           ');
    SQL.Add('               l.operacao=d.operacao and                                   ');
    SQL.Add('               (D.IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND   ');
    SQL.Add('               (D.NUMFATURA IS NOT NULL) AND                               ');
    SQL.Add('               (CC.CODCENTROCUSTO(+) = RD.CODCENTROCUSTO) AND              ');
    SQL.Add('               (CC.IDEMPRESA(+) = RD.IDEMPRESA) AND                        ');
    SQL.Add('               (D.CODDOCUMENTO = RD.CODDOCUMENTO) AND                      ');
    SQL.Add('               (TDR.CODTIPRECDES(+) = RD.CODTIPRECDES) AND                 ');
    SQL.Add('               (TDR.RECPAG(+) = RD.RECPAG) AND                             ');
    SQL.Add('               (TDR.IDPESSOA(+) = RD.IDPESSOA) AND                         ');
    SQL.Add('               (AP.UNIDNEGOC(+) = RD.UNIDNEGOC) AND                        ');
    SQL.Add('               (AP.IDPESSOA(+) = RD.IDPESSOA) AND                          ');
    SQL.Add('               (CR.CODCENTRORESPON(+) = RD.CODCENTRORESPON) AND            ');
    SQL.Add('               (PLANO.IDPLANOPREV(+) = RD.IDPLANOPREV) AND                 ');
    SQL.Add('               (PROGRAMA.IDPROGRAMA(+) = RD.IDPROGRAMA) AND                ');
    SQL.Add('               (PATRO.IDPESSOA(+) = RD.IDPATRO) AND                        ');
    SQL.Add('               (CR.IDPESSOA(+) = RD.IDPESSOA)                              ');
    SQL.Add('           ) Q2,                                                           ');
    SQL.Add('           (                                                               ');
    SQL.Add('             SELECT                                                        ');
    SQL.Add('               D.NUMFATURA,                                                ');
    SQL.Add('               sum                                                         ');
    SQL.Add('               (                                                           ');
    SQL.Add('                 decode                                                    ');
    SQL.Add('                 (                                                         ');
    SQL.Add('                   d.recpag,                                               ');
    SQL.Add('                   ''P'',                                                  ');
    SQL.Add('                   decode                                                  ');
    SQL.Add('                   (                                                       ');
    SQL.Add('                     l.debcre,                                             ');
    SQL.Add('                     ''C'',                                                ');
    SQL.Add('                     L.VALOR,                                              ');
    SQL.Add('                     l.valor*-1                                            ');
    SQL.Add('                   ),                                                      ');
    SQL.Add('                   decode                                                  ');
    SQL.Add('                   (                                                       ');
    SQL.Add('                     l.debcre,                                             ');
    SQL.Add('                     ''D'',                                                ');
    SQL.Add('                     L.VALOR,                                              ');
    SQL.Add('                     l.valor*-1                                            ');
    SQL.Add('                   )                                                       ');
    SQL.Add('                 )                                                         ');
    SQL.Add('               ) as valor                                                  ');
    SQL.Add('             FROM                                                          ');
    SQL.Add('               DOCUMENTO D,                                                ');
    SQL.Add('               LANCTODOCUM L                                               ');
    SQL.Add('             WHERE                                                         ');
    SQL.Add('               (L.ESTORNO IS NULL) AND                                     ');
    SQL.Add('               (D.RECPAG= ''' + ParamIntegra.RecPag + ''') AND             ');
    SQL.Add('               (D.IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND   ');
    SQL.Add('               (RTRIM(L.OPERACAO) IN (''1'',''11'')) AND                   ');
    SQL.Add('               (D.CODDOCUMENTO = L.CODDOCUMENTO) AND                       ');
    SQL.Add('               (D.OPERACAO = L.OPERACAO) AND                               ');
    SQL.Add('               (D.NUMFATURA IS NOT NULL)                                   ');
    SQL.Add('             GROUP BY                                                      ');
    SQL.Add('               D.NUMFATURA                                                 ');
    SQL.Add('           ) Q3                                                            ');
    SQL.Add('         WHERE                                                             ');
    SQL.Add('           (Q1.NUMFATURA = Q2.NUMFATURA) AND                               ');
    SQL.Add('           (Q3.NUMFATURA = Q2.NUMFATURA)                                   ');
    SQL.Add('         GROUP BY                                                          ');
    SQL.Add('           Q1.NUMFATURA,                                                   ');
    SQL.Add('           Q1.CODDOCUMENTO,                                                ');
    SQL.Add('           Q1.NUMAPGR,                                                     ');
    SQL.Add('           Q1.REFERENCIA,                                                  ');
    SQL.Add('           Q1.NODOCUMENTO,                                                 ');
    SQL.Add('           Q1.COMPLDOCUMENTO,                                              ');
    SQL.Add('           Q1.DATAVENCTO,                                                  ');
    SQL.Add('           Q1.DATAEMISSAO,                                                 ');
    SQL.Add('           Q1.DATAPROGRAMADA,                                              ');
    SQL.Add('           Q1.NUMDOCUMENTO,                                                ');
    SQL.Add('           Q1.VALOR,                                                       ');
    SQL.Add('           Q1.VALOROUTRAMOEDA,                                             ');
    SQL.Add('           Q1.RAZAOSOCIAL,                                                 ');
    SQL.Add('           Q1.DESCRICAO,                                                   ');
    SQL.Add('           Q2.DESCTDR,                                                     ');
    SQL.Add('           Q2.NOMEAP,                                                      ');
    SQL.Add('           Q2.NOMECR,                                                      ');
    SQL.Add('           Q2.NOMECC,                                                      ');
    SQL.Add('           Q1.OBS,                                                         ');
    SQL.Add('           Q1.FLGDOCBANCARIO,                                              ');
    SQL.Add('           Q1.TRGUSERINCLUSAO,                                             ');
    SQL.Add('           Q1.TRGDTINCLUSAO,                                               ');
    SQL.Add('           Q2.NUMIMOVEL,                                                   ');
    SQL.Add('           Q2.NOMEPATRO,                                                   ');
    SQL.Add('           Q2.DESCPLANO,                                                   ');
    SQL.Add('           Q2.DESCPROGRAMA,                                                ');
    SQL.Add('           Q1.IDFORCLI                                                     ');
    SQL.Add('     )                                                                     ');
    sqlautpagdoc.open;
  End;

  sqlContabLanc.sql.clear;
  sqlContabLanc.Prepare;
  With sqlContabLanc Do
  Begin
    SQL.Add('SELECT                                                                               ');
    SQL.Add('  DOC.OPERACAO,                                                                      ');
    SQL.Add('  LC.LACDEBCRE,                                                                      ');
    SQL.Add('  LC.PLACONTA,                                                                       ');
    SQL.Add('  LC.LACVALOR,                                                                       ');
    SQL.Add('  CC.NOME AS NOMECC,                                                                 ');
    SQL.Add('  AP.NOME AS NOMEAP,                                                                 ');
    SQL.Add('  SC.NOMESUBCONTA,                                                                   ');
    SQL.Add('  LC.LACHIST1 || LC.LACHIST2 || LC.LACHIST3 || LC.LACHIST4 || LC.LACHIST5            ');
    SQL.Add('  AS HISTLANCAMENTOCONTABIL,                                                         ');
    SQL.Add('  P.PLNPLANIL,                                                                       ');
    SQL.Add('  PC.PLANOME,                                                                        ');
    SQL.Add('  PC.PLAREDUZ,                                                                       ');
    SQL.Add('  LC.LACNUMLAN                                                                       ');
    SQL.Add('FROM                                                                                 ');
    SQL.Add('  DOCUMENTO DOC,                                                                     ');
    SQL.Add('  LANCTODOCUM LAN,                                                                   ');
    SQL.Add('  LANCAMENTO LC,                                                                     ');
    SQL.Add('  SUBCONTA SC,                                                                       ');
    SQL.Add('  CENTCUST CC,                                                                       ');
    SQL.Add('  UNIDNEGOCIO AP,                                                                    ');
    SQL.Add('  PLANILHA P,                                                                        ');
    SQL.Add('  PLANOCONTA PC                                                                      ');
    SQL.Add('WHERE                                                                                ');
    SQL.Add('  (DOC.CODDOCUMENTO  = ''' + cdsAutPagDoc.Fieldbyname('CODDOCUMENTO').AsString + ''') AND');
    SQL.Add('  (LAN.CODDOCUMENTO  = DOC.CODDOCUMENTO)       AND                                   ');
    SQL.Add('  (PC.PLANO = LC.PLANO)                        AND                                   ');
    SQL.Add('  (PC.PLACONTA = LC.PLACONTA)                  AND                                   ');
    SQL.Add('  (LAN.PLNCODIGO     = LC.PLNCODIGO)           AND                                   ');
    SQL.Add('  (LC.PLNCODIGO      = P.PLNCODIGO)            AND                                   ');
    SQL.Add('  (AP.UNIDNEGOC(+)   = LC.UNIDNEGOC)           AND                                   ');
    SQL.Add('  (AP.IDPESSOA(+)    = LC.IDPESSOA)            AND                                   ');
    SQL.Add('  (SC.CODSUBCONTA(+) = LC.CODSUBCONTA)         AND                                   ');
    SQL.Add('  (SC.IDPESSOA(+)    = LC.IDPESSOA)            AND                                   ');
    SQL.Add('  (CC.CODCENTROCUSTO(+) = LC.CODCENTROCUSTO)   AND                                   ');
    SQL.Add('  (CC.IDEMPRESA(+) = LC.IDEMPRESA)             AND                                   ');
    SQL.Add('  (LAN.OPERACAO     <> ''5 '')                 AND                                   ');
    SQL.Add('  (LAN.OPERACAO     <> ''15'')                 AND                                   ');
    SQL.Add('  (LAN.OPERACAO     <> ''3 '')                 AND                                   ');
    SQL.Add('  (LAN.OPERACAO     <> ''13'')                                                       ');
    SQL.Add('ORDER BY                                                                             ');
    SQL.Add('  LC.LACDEBCRE DESC, LC.LACNUMLAN                                                    ');
    open;
  End;

  sqlContab3.sql.clear;
  sqlContab3.Prepare;
  With sqlContab3 Do
  Begin
    SQL.Add('SELECT DISTINCT                                                                          ');
    SQL.Add('       Q2.LACDEBCRE,                                                                     ');
    SQL.Add('       Q2.PLACONTA,                                                                      ');
    SQL.Add('       ((Q1.VALOR * Q2.LACVALOR)/ Q3.VALOR) AS VALOR,                                    ');
    SQL.Add('       Q2.NOMECC,                                                                        ');
    SQL.Add('       Q2.NOMEAP,                                                                        ');
    SQL.Add('       Q2.NOMESUBCONTA,                                                                  ');
    SQL.Add('       Q1.HISTORICOCOMPL AS HISTLANCAMENTOCONTABIL,                                      ');
    SQL.Add('       Q2.PLNPLANIL,                                                                     ');
    SQL.Add('       Q2.PLANOME,                                                                       ');
    SQL.Add('       Q2.PLAREDUZ,                                                                      ');
    SQL.Add('       Q2.LACNUMLAN                                                                      ');
    SQL.Add('FROM                                                                                     ');
    SQL.Add('   (SELECT                                                                               ');
    SQL.Add('       LAN.VALOR, DOC.NUMFATURA,''LANÇAMENTO DO DOCUMENTO '' || DOC.NODOCUMENTO          ');
    SQL.Add('              || ''/'' || DOC.COMPLDOCUMENTO || P.RAZAOSOCIAL AS HISTORICOCOMPL          ');
    SQL.Add('    FROM                                                                                 ');
    SQL.Add('       PESSOA P,                                                                         ');
    SQL.Add('       DOCUMENTO DOC,                                                                    ');
    SQL.Add('       LANCTODOCUM LAN                                                                   ');
    SQL.Add('    WHERE                                                                                ');
    SQL.Add('      (DOC.CODDOCUMENTO = ''' + cdsAutPagDoc.Fieldbyname('CODDOCUMENTO').AsString + ''') AND ');
    SQL.Add('      ((LAN.OPERACAO = ''3 '') OR (LAN.OPERACAO = ''13'')) AND                           ');
    SQL.Add('      (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)     AND                                      ');
    SQL.Add('      (DOC.IDFORCLI = P.IDPESSOA)) Q1,                                                   ');
    SQL.Add('   (SELECT                                                                               ');
    SQL.Add('       DOC.NUMFATURA, LC.LACDEBCRE, LC.PLACONTA,  LC.LACVALOR, LAN.VALOR,                ');
    SQL.Add('       CC.NOME AS NOMECC, AP.NOME AS NOMEAP, SC.NOMESUBCONTA,                            ');
    SQL.Add('       LC.LACHIST1 || LC.LACHIST2 || LC.LACHIST3 || LC.LACHIST4 || LC.LACHIST5           ');
    SQL.Add('       AS HISTLANCAMENTOCONTABIL,                                                        ');
    SQL.Add('       P.PLNPLANIL, PC.PLANOME, PC.PLAREDUZ, LC.LACNUMLAN                                ');
    SQL.Add('    FROM                                                                                 ');
    SQL.Add('       DOCUMENTO DOC,                                                                    ');
    SQL.Add('       LANCTODOCUM LAN,                                                                  ');
    SQL.Add('       LANCAMENTO LC,                                                                    ');
    SQL.Add('       SUBCONTA SC,                                                                      ');
    SQL.Add('       CENTCUST CC,                                                                      ');
    SQL.Add('       UNIDNEGOCIO AP,                                                                   ');
    SQL.Add('       PLANILHA P,                                                                       ');
    SQL.Add('       PLANOCONTA PC                                                                     ');
    SQL.Add('    WHERE                                                                                ');
    SQL.Add('       ((LAN.OPERACAO = ''1 '') OR (LAN.OPERACAO = ''11'')) AND                          ');
    SQL.Add('       (DOC.NUMFATURA IS NOT NULL)                AND                                    ');
    SQL.Add('       (DOC.NUMFATURA = ''' + cdsAutPagDoc.fieldbyname('NUMFATURA').AsString + ''')AND       ');
    SQL.Add('       (PC.PLANO = LC.PLANO)                      AND                                    ');
    SQL.Add('       (PC.PLACONTA = LC.PLACONTA)                AND                                    ');
    SQL.Add('       (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)      AND                                    ');
    SQL.Add('       (AP.UNIDNEGOC(+) = LC.UNIDNEGOC)           AND                                    ');
    SQL.Add('       (AP.IDPESSOA(+) = LC.IDPESSOA)             AND                                    ');
    SQL.Add('       (SC.CODSUBCONTA(+) = LC.CODSUBCONTA)       AND                                    ');
    SQL.Add('       (SC.IDPESSOA(+) = LC.IDPESSOA)             AND                                    ');
    SQL.Add('       (CC.CODCENTROCUSTO(+) = LC.CODCENTROCUSTO) AND                                    ');
    SQL.Add('       (CC.IDEMPRESA(+) = LC.IDEMPRESA)           AND                                    ');
    SQL.Add('       (LC.PLNCODIGO = P.PLNCODIGO)               AND                                    ');
    SQL.Add('       (LAN.PLNCODIGO = LC.PLNCODIGO)) Q2,                                               ');
    SQL.Add('      (SELECT D.NUMFATURA, SUM(L.VALOR) AS VALOR FROM LANCTODOCUM L, DOCUMENTO D         ');
    SQL.Add('      WHERE ((L.OPERACAO = ''1 '') OR (L.OPERACAO = ''11'')) AND                         ');
    SQL.Add('         (D.CODDOCUMENTO = L.CODDOCUMENTO) AND                                           ');
    SQL.Add('         (D.OPERACAO = L.OPERACAO) AND                                                   ');
    SQL.Add('         (D.NUMFATURA =  ''' + cdsAutPagDoc.fieldbyname('NUMFATURA').AsString + ''') AND     ');
    SQL.Add('         (D.NUMFATURA IS NOT NULL)                                                       ');
    SQL.Add('         GROUP BY D.NUMFATURA) Q3                                                        ');
    SQL.Add('WHERE (Q1.NUMFATURA = Q2.NUMFATURA) AND (Q3.NUMFATURA = Q2.NUMFATURA)                    ');
    SQL.Add('ORDER BY Q2.LACDEBCRE DESC, Q2.LACNUMLAN                                                 ');
    open;
  End;

  // errro e nestes open abaixo

  With cdsautpagdoc Do
  Begin

    AutoCalcFields := false;
    rSumValorBruto := 0;
    rSumValorDeducoes := 0;
    rSumValorAcrescimo := 0;
    rSumValorImposto := 0;
    rSumValorAPagar := 0;
    rSumValorLanctoLiq := 0;
    rTotValorLanctoLiq := 0;
    rTotValorBruto := 0;
    rTotValorDeducoes := 0;
    rTotValorAcrescimo := 0;
    rTotValorImposto := 0;
    rTotValorAPagar := 0;
    sGrupo0 := '';

    sCampoData0 := 'IDFORCLI';
    sCampoData1 := 'CODDOCUMENTO';
    OldCodDoc := '';
    OldCCusto := '';
    SqlListaCCusto.Open;
    SqlDemGestAutPag.Open;

    While Not Cdsautpagdoc.eof Do
    Begin
      Montaregistro;

      If (Trim(sGrupo1) <> Trim(Cdsautpagdoc.FieldByName(sCampoData1).AsString)) Then
      Begin
        rTotValorBruto := Cdsautpagdoc.FieldByName('VALOR').AsFloat + rTotValorBruto;
        rTotValorDeducoes := Cdsautpagdoc.FieldByName('VLDEC').AsFloat + rTotValorDeducoes;
        rTotValorAcrescimo := Cdsautpagdoc.FieldByName('VLACRE').AsFloat + rTotValorAcrescimo;
        rTotValorImposto := Cdsautpagdoc.FieldByName('VLIMP').AsFloat + rTotValorImposto;
        rTotValorAPagar := Cdsautpagdoc.FieldByName('VLLIQ').AsFloat + rTotValorAPagar;
        rTotValorLanctoLiq := Cdsautpagdoc.FieldByName('VALOLANCTOLIQ').AsFloat + rTotValorLanctoLiq;

        rSumValorBruto := 0;
        rSumValorDeducoes := 0;
        rSumValorAcrescimo := 0;
        rSumValorImposto := 0;
        rSumValorAPagar := 0;
        rSumValorLanctoLiq := 0;
      End;

      If Trim(sGrupo0) <> Trim(Cdsautpagdoc.FieldByName(sCampoData0).AsString) Then
      Begin
        rSumValorBruto := rSumValorBruto + Cdsautpagdoc.FieldByName('VALOR').AsFloat;
        rSumValorDeducoes := rSumValorDeducoes + Cdsautpagdoc.FieldByName('VLDEC').AsFloat;
        rSumValorAcrescimo := rSumValorAcrescimo + Cdsautpagdoc.FieldByName('VLACRE').AsFloat;
        rSumValorImposto := rSumValorImposto + Cdsautpagdoc.FieldByName('VLIMP').AsFloat;
        rSumValorAPagar := rSumValorAPagar + Cdsautpagdoc.FieldByName('VLLIQ').AsFloat;
        rSumValorLanctoLiq := rSumValorLanctoLiq + Cdsautpagdoc.FieldByName('VALOLANCTOLIQ').AsFloat;
      End;

      sGrupo0 := Trim(Cdsautpagdoc.FieldByName(sCampoData0).AsString);
      sGrupo1 := Trim(Cdsautpagdoc.FieldByName(sCampoData1).AsString);

      CdsAutPagDoc.Edit;
      CdsAutPagDoc.FieldByName('TotValorBruto').AsFloat := rTotValorBruto;
      CdsAutPagDoc.FieldByName('TotValorDeducoes').AsFloat := rTotValorDeducoes;
      CdsAutPagDoc.FieldByName('TotValorAcrescimo').AsFloat := rTotValorAcrescimo;
      CdsAutPagDoc.FieldByName('TotValorImposto').AsFloat := rTotValorImposto;
      CdsAutPagDoc.FieldByName('TotValorAPagar').AsFloat := rTotValorAPagar;
      CdsAutPagDoc.FieldByName('SumValorBruto').AsFloat := rSumValorBruto;
      CdsAutPagDoc.FieldByName('SumValorDeducoes').AsFloat := rSumValorDeducoes;
      CdsAutPagDoc.FieldByName('SumValorAcrescimo').AsFloat := rSumValorAcrescimo;
      CdsAutPagDoc.FieldByName('SumValorImposto').AsFloat := rSumValorImposto;
      CdsAutPagDoc.FieldByName('SumValorAPagar').AsFloat := rSumValorAPagar;
      CdsAutPagDoc.FieldByName('SumVALOLANCTOLIQ').AsFloat := rTotValorLanctoLiq;

      If (oldCodDoc <> Cdsautpagdoc.FieldByName('CODDOCUMENTO').AsString) And
        (oldCodDoc <> '') Then
      Begin
        CdsListaCCusto.Append;
        CdsListaCCusto.FieldByName('CODDOCUMENTO').AsFloat := StrToFloat(oldCodDoc);
        CdsListaCCusto.FieldByName('OBS').AsString := Copy(sListCusto, 3, Length(sListCusto));
        CdsListaCCusto.Post;

        sListCusto := '';
      End;

      If (Not Cdsautpagdoc.FieldByName('NOMECC').IsNull) And
        (Pos(Cdsautpagdoc.FieldByName('NOMECC').AsString, sListCusto) = 0) Then
        sListCusto := sListCusto + ', ' + Cdsautpagdoc.FieldByName('NOMECC').AsString;

      Cdsautpagdoc.Post;

      OldCodDoc := Cdsautpagdoc.FieldByName('CODDOCUMENTO').AsString;
      OldCCusto := Cdsautpagdoc.FieldByName('NOMECC').AsString;

      {**
        Implementado para corrigir o erro "Invalid Blob Record in Buffer" quando o
        relatório era gerado muitos registros.
        O Relatório passou a ter sua fonte de dados a partir de um clientdataset.
      **}
      CdsDemGestAutPag.append;
      For X := 0 To CdsAutPagDoc.FieldCount - 1 Do
      Begin
        If CdsDemGestAutPag.FindField(CdsAutPagDoc.Fields[x].FieldName) <> Nil Then
          Case CdsDemGestAutPag.FieldByName(CdsAutPagDoc.Fields[x].FieldName).DataType Of
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
      {** Fim do Procedimento **}

      Cdsautpagdoc.next;
    End;

    If Not Cdsautpagdoc.IsEmpty Then
    Begin

      CdsAutPagDoc.Edit;
      CdsAutPagDoc.FieldByName('TotValorBruto').AsFloat := rTotValorBruto;
      CdsAutPagDoc.FieldByName('TotValorDeducoes').AsFloat := rTotValorDeducoes;
      CdsAutPagDoc.FieldByName('TotValorAcrescimo').AsFloat := rTotValorAcrescimo;
      CdsAutPagDoc.FieldByName('TotValorImposto').AsFloat := rTotValorImposto;
      CdsAutPagDoc.FieldByName('TotValorAPagar').AsFloat := rTotValorAPagar;
      CdsAutPagDoc.FieldByName('SumValorBruto').AsFloat := rSumValorBruto;
      CdsAutPagDoc.FieldByName('SumValorDeducoes').AsFloat := rSumValorDeducoes;
      CdsAutPagDoc.FieldByName('SumValorAcrescimo').AsFloat := rSumValorAcrescimo;
      CdsAutPagDoc.FieldByName('SumValorImposto').AsFloat := rSumValorImposto;
      CdsAutPagDoc.FieldByName('SumValorAPagar').AsFloat := rSumValorAPagar;
      CdsAutPagDoc.FieldByName('SumVALOLANCTOLIQ').AsFloat := rTotValorLanctoLiq;
      CdsAutPagDoc.Post;

    End;
  End;
End;

Procedure TRptLancDoc2.Montaregistro;
Var
  rSaldo: real;
Begin
  CdsAutPagDocAlt.Close;
  SqlAutPagDocAlt.Prepare;
  SqlAutPagDocAlt.ParamByName('CODDOCUMENTO').AsFloat := CdsAutPagDoc.FieldByName('CODDOCUMENTO').AsFloat;
  SqlAutPagDocAlt.open;

  CdsAutPagDoc.Edit;
  If CdsAutPagDoc.FieldByName('VLDEC').isnull Then
    CdsAutPagDoc.FieldByName('VLDEC').asfloat := 0;
  If CdsAutPagDoc.FieldByName('VLACRE').isnull Then
    CdsAutPagDoc.FieldByName('VLACRE').asfloat := 0;
  If CdsAutPagDoc.FieldByName('VLIMP').isnull Then
    CdsAutPagDoc.FieldByName('VLIMP').asfloat := 0;
  If CdsAutPagDoc.FieldByName('VLLIQ').isnull Then
    CdsAutPagDoc.FieldByName('VLLIQ').asfloat := 0;
  Documento.Saldo.CalculaSaldo(CdsAutPagDoc.FieldByName('coddocumento').AsInteger);
  rSaldo := Documento.Saldo.Valor;

  If Not CdsAutPagDoc.FieldByName('numfatura').isnull Then
  Begin
    If CdsAlteraParcOrigem.Active Then
      CdsAlteraParcOrigem.Close;
    SqlAlteraParcOrigem.Prepare;
    SqlAlteraParcOrigem.ParamByName('CODDOCUMENTO').AsInteger := CdsAutPagDoc.FieldByName('Coddocumento').AsInteger;
    SqlAlteraParcOrigem.ParamByName('NUMFATURA').AsInteger := CdsAutPagDoc.FieldByName('Numfatura').AsInteger;
    SqlAlteraParcOrigem.open;

    CdsAutPagDoc.FieldByName('valor').AsFloat := (CdsAutPagDoc.FieldByName('Valor').Asfloat +
      CdsAlteraParcOrigem.FieldByName('Valdecr').Asfloat +
      CdsAlteraParcOrigem.FieldByName('Valimp').Asfloat -
      CdsAlteraParcOrigem.FieldByName('Valacre').Asfloat);

    CdsAutPagDoc.FieldByName('VLDEC').AsFloat := CdsAlteraParcOrigem.FieldByName('Valdecr').Asfloat;
    CdsAutPagDoc.FieldByName('VLACRE').AsFloat := CdsAlteraParcOrigem.FieldByName('Valacre').Asfloat;
    CdsAutPagDoc.FieldByName('VLIMP').AsFloat := CdsAlteraParcOrigem.FieldbyName('Valimp').Asfloat;
    CdsAutPagDoc.FieldByName('VLLIQ').AsFloat := rSaldo;
  End
  Else
  Begin
    CdsAutPagDoc.FieldByName('VLDEC').AsFloat := CdsAutPagDoc.FieldByName('VLDEC').AsFloat +
      CdsAutPagDocAlt.FieldByName('Valdecr').AsFloat;
    CdsAutPagDoc.FieldByName('VLACRE').AsFloat := CdsAutPagDoc.FieldByName('VLACRE').AsFloat +
      CdsAutPagDocAlt.FieldByName('Valacre').AsFloat;
    CdsAutPagDoc.FieldByName('VLIMP').AsFloat := CdsAutPagDoc.FieldByName('VLIMP').AsFloat +
      CdsAutPagDocAlt.FieldByName('Valimp').AsFloat;
    CdsAutPagDoc.FieldByName('VLLIQ').AsFloat := rSaldo;
  End;

  CdsAutPagDoc.FieldByName('VALOLANCTOLIQ').AsFloat := CdsAutPagDoc.FieldByName('Valor').AsFloat -
    CdsAutPagDoc.FieldByName('VLDEC').AsFloat +
    CdsAutPagDoc.FieldByName('VLACRE').AsFloat -
    CdsAutPagDoc.FieldByName('VLIMP').AsFloat;

  CdsAutPagDoc.post;

End;

Procedure TRptLancDoc2.FormClose(Sender: TObject;
  Var Action: TCloseAction);
Begin
  Inherited;
  Documento.free;
End;

Procedure TRptLancDoc2.FormCreate(Sender: TObject);
Begin
  Inherited;
  Documento := TCtrlDocumento.Create;
  Documento.InitializeAs(ParamIntegra);
End;

End.

