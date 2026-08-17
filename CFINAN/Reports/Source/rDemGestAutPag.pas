Unit rDemGestAutPag;

Interface                            


Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, DBTables, Db, Wwquery,
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppBands, ppMemo, ppClass, ppCtrls,
  ppVar, ppRegion, ppStrtch, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd,
  ppReport, DBClient, uCmSqlParams, uCMClientDataSet, uCtrlDocumento, uSistema,
  uCtrlParamIntegra, Mask;

Type
  TRptDemGestAutPag = Class(TFrmCmReport)
    RptDemGestAutPag: TppReport;
    ppHeaderBand14: TppHeaderBand;
    ppLabel74: TppLabel;
    LblDemGestao: TppLabel;
    MenCrespon: TppMemo;
    RptdemgestautpagRegion1: TppRegion;
    RptdemgestautpagLine1: TppLine;
    RptDemGestaoLine32: TppLine;
    RptDemGestaoLine31: TppLine;
    RptDemGestaoLine29: TppLine;
    RptDemGestaoLine28: TppLine;
    RptdemgestautpagLine3: TppLine;
    RptdemgestautpagLine4: TppLine;
    RptdemgestautpagLabel2: TppLabel;
    RptDemGestaoLabel7: TppLabel;
    RptDemGestaoLabel8: TppLabel;
    RptDemGestaoLabel6: TppLabel;
    RptDemGestaoLabel4: TppLabel;
    RptdemgestautpagLabel1: TppLabel;
    RptDemGestaoLabel2: TppLabel;
    RptDemGestaoLabel3: TppLabel;
    ppDetailBand18: TppDetailBand;
    ppFooterBand13: TppFooterBand;
    ppLabel98: TppLabel;
    ppCalc27: TppSystemVariable;
    ppCalc28: TppSystemVariable;
    ppSummaryBand3: TppSummaryBand;
    ppShape6: TppShape;
    ppLabel99: TppLabel;
    ppLabel100: TppLabel;
    ppLabel101: TppLabel;
    ppLabel102: TppLabel;
    ppLabel103: TppLabel;
    ppLabel104: TppLabel;
    ppDBText83: TppDBText;
    ppDBText84: TppDBText;
    ppDBText85: TppDBText;
    ppDBText86: TppDBText;
    ppDBText87: TppDBText;
    ppGroup7: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppDBText94: TppDBText;
    ppDBText96: TppDBText;
    ppDBMemo3: TppDBMemo;
    RptDemGestaoDBText7: TppDBText;
    RptDemGestaoDBText1: TppDBText;
    ppDBText103: TppDBText;
    RptdemgestautpagDBText1: TppDBText;
    RptdemgestautpagLine5: TppLine;
    RptdemgestautpagLine6: TppLine;
    RptdemgestautpagLine7: TppLine;
    RptdemgestautpagLine8: TppLine;
    RptdemgestautpagLine9: TppLine;
    RptdemgestautpagLine10: TppLine;
    RptdemgestautpagLine11: TppLine;
    RptdemgestautpagLine19: TppLine;
    RptdemgestautpagLine21: TppLine;
    RptdemgestautpagDBText3: TppDBText;
    MemCCusto: TppMemo;
    ppGroupFooterBand7: TppGroupFooterBand;
    RptDemGestaoLabel9: TppLabel;
    RptDemGestaoDBText2: TppDBText;
    RptDemGestaoDBText3: TppDBText;
    RptDemGestaoLabel10: TppLabel;
    RptDemGestaoLabel11: TppLabel;
    RptDemGestaoDBText4: TppDBText;
    RptDemGestaoLabel12: TppLabel;
    RptDemGestaoDBText5: TppDBText;
    RptdemgestautpagLine2: TppLine;
    RptdemgestautpagLine12: TppLine;
    RptdemgestautpagLine13: TppLine;
    RptdemgestautpagLine14: TppLine;
    RptdemgestautpagLine15: TppLine;
    RptdemgestautpagLine16: TppLine;
    RptdemgestautpagLine17: TppLine;
    RptdemgestautpagLine18: TppLine;
    RptdemgestautpagLine20: TppLine;
    RptdemgestautpagLine22: TppLine;
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
    CdsAutPagDoc: TCMClientDataSet;
    SqlAutPagDoc: TCMSqlParams;
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
    SqlDemGestAutPag: TCMSqlParams;
    SqlListaCCusto: TCMSqlParams;
    CdsListaCCusto: TCMClientDataSet;
    CdsBuscaContaDocForn: TCMClientDataSet;
    SqlBuscaContaDocForn: TCMSqlParams;
    CdsBuscaContaDoc: TCMClientDataSet;
    SqlBuscaContaDoc: TCMSqlParams;
    Procedure CrmRptCMBeforePrint(Sender: TObject);
    Procedure ppGroupHeaderBand7BeforePrint(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure CdsAutPagDocCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
     sBanco, sAgencia, sAgenciaFormat, sNomeagencia, sNumeroFormat, sNomeBanco,
      sNumero, sDescTipo, sTipo, sMascaraAgencia, sMascaraConta, oldDoc: String;
    Id: double;
    Documento: TCtrlDocumento;
//    sCamposOrderDefault, sCampoOrderDefault0, sCampoOrderDefault1: String;
    Procedure Montaregistro;
    Procedure BuscaContaDoc(CodDocumento: Real);
    Function UltDiaMes(FDate: TDateTime): TDateTime;
  public
    { Public declarations }
  End;

Var
  RptDemGestAutPag: TRptDemGestAutPag;

Implementation

Uses dBaseDados, uString;

{$R *.DFM}

Procedure TRptDemGestAutPag.CrmRptCMBeforePrint(Sender: TObject);
Var
  rSumValorBruto, rSumValorDeducoes, rSumValorAcrescimo, rSumValorImposto,
    rSumValorAPagar, rSumValorLanctoLiq, rTotValorLanctoLiq, rTotValorBruto,
    rTotValorDeducoes, rTotValorAcrescimo, rTotValorImposto, rTotValorAPagar: Double;
  sTitulo, sCampodata, sDescData, sListaCentroRespon, sCamposOrder,
    sStatus, sGrupo0, sGrupo1, sCampoData0, sCampoData1, OldCodDoc,
    OldCCusto, sListCusto: String;
  X: Integer;

  rgdata, RgSitDoc, RgStatus: integer;
  DtIni, DtFin, RgSitDocNome, sListaDescricao, moduloCodDocCPMF, TreeOrdemString: String;
  cbMostraCPMF: Boolean;
Begin
  Inherited;
//        sCamposOrderDefault := 'RAZAOSOCIAL, IDFORCLI, CODDOCUMENTO ';
//        sCampoOrderDefault0 := 'IDFORCLI';
//        sCampoOrderDefault1 := 'CODDOCUMENTO';




  {
    DtmRelatoriosCapCar2.QryContabLanc.DataSource := DtmRelatoriosCapCar2.Dsautpagdoc;
    DtmRelatoriosCapCar2.QryContab3.DataSource := DtmRelatoriosCapCar2.Dsautpagdoc;}

  rgdata             := CmpRptCM.ParamValues[0].AsInteger;
  RgSitDoc           := CmpRptCM.ParamValues[1].AsInteger;
  RgStatus           := CmpRptCM.ParamValues[2].AsInteger;
  DtIni              := CmpRptCM.ParamValues[3].AsString;
  DtFin              := CmpRptCM.ParamValues[4].AsString;
  RgSitDocNome       := CmpRptCM.ParamValues[5].AsString;
  sListaDescricao    := CmpRptCM.ParamValues[6].AsString;
  moduloCodDocCPMF   := CmpRptCM.ParamValues[7].AsString;
  sCamposOrder       := CmpRptCM.ParamValues[8].AsString;
  cbMostraCPMF       := CmpRptCM.ParamValues[9].AsBoolean;
  sListaCentroRespon := CmpRptCM.ParamValues[10].aSsTRING;

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

  sTitulo := 'Demonstrativo de Atos de Gestão';

  If (DtIni <> '') And (DtFin <> '') Then
    sTitulo := sTitulo + sDescData + ' - Entre ' + DtIni + ' e ' + DtFin
  Else If (DtIni <> '') Then
    sTitulo := sTitulo + sDescData + ' - Em ' + DtIni
  Else If (DtFin <> '') Then
    sTitulo := sTitulo + sDescData + ' - Em ' + DtFin;

  If sStatus <> '' Then
    sTitulo := sTitulo + ' Listagem de Documentos ' + RgSitDocNome;

  If sListaDescricao <> '' Then
    MenCrespon.Lines.Text := ' Centro(s) de Responsabilidade selecionado(s): ' + sListaDescricao;

  Case RgStatus Of
    0: sTitulo := sTitulo + ' - Somente Documentos Autorizados';
    1: sTitulo := sTitulo + ' - Somente Documentos Não Autorizados';
    2: sTitulo := sTitulo + ' - Todos os Documentos';
  End;

  LblDemGestao.Caption := sTitulo;

  With SqlAutPagDoc Do
  Begin
    SQL.Clear;
    SQL.Add('SELECT  distinct                                                                    ');
    SQL.Add('  NUMFATURA, CODDOCUMENTO, NUMAPGR, REFERENCIA, NODOCUMENTO,                        ');
    SQL.Add('  COMPLDOCUMENTO, DATAVENCTO, DATAEMISSAO, DATAPROGRAMADA,                          ');
    SQL.Add('  NUMDOCUMENTO, VALOR, VALOROUTRAMOEDA, RAZAOSOCIAL, DESCRICAO,                     ');
    SQL.Add('  VALORRATEIO, DESCTDR, NOMEAP, NOMECR, NOMECC, OBS,                                ');
    SQL.Add('  FLGDOCBANCARIO, VLACRE, VLDEC,  VLIMP, VLLIQ,                                     ');
    SQL.Add('  TRGUSERINCLUSAO,                                                                  ');
    SQL.Add('  TO_DATE(TO_CHAR(TRGDTINCLUSAO,''DD/MM/YYYY''),''DD/MM/YYYY'') AS TRGDTINCLUSAO,   ');
    SQL.Add('  (0) AS TOTVALORBRUTO,                                                             ');
    SQL.Add('  (0) AS TOTVALORDEDUCOES,                                                          ');
    SQL.Add('  (0) AS TOTVALORACRESCIMO,                                                         ');
    SQL.Add('  (0) AS TOTVALORIMPOSTO,                                                           ');
    SQL.Add('  (0) AS TOTVALORAPAGAR,                                                            ');
    SQL.Add('  (0) AS SUMVALORBRUTO,                                                             ');
    SQL.Add('  (0) AS SUMVALORDEDUCOES,                                                          ');
    SQL.Add('  (0) AS SUMVALORACRESCIMO,                                                         ');
    SQL.Add('  (0) AS SUMVALORIMPOSTO,                                                           ');
    SQL.Add('  (0) AS SUMVALORAPAGAR,                                                            ');
    SQL.Add('  NUMIMOVEL, NOMEPATRO, DESCPLANO, DESCPROGRAMA, IDFORCLI,                          ');
    SQL.Add('  (0) AS VALOLANCTOLIQ,                                                             ');
    SQL.Add('  (0) AS SUMVALOLANCTOLIQ                                                           ');
    SQL.Add('FROM                                                                                ');
    SQL.Add('  (                                                                                 ');
    SQL.Add('    SELECT D.NUMFATURA, D.CODDOCUMENTO, D.NUMAPGR, D.REFERENCIA,                    ');
    SQL.Add('      D.NODOCUMENTO, D.COMPLDOCUMENTO, D.DATAVENCTO, D.DATAEMISSAO,                 ');
    SQL.Add('      D.DATAPROGRAMADA, P.NUMDOCUMENTO,                                             ');
    SQL.Add('      decode(d.recpag, ''P'', decode(l.debcre, ''C'', L.VALOR, l.valor*-1 ),        ');
    SQL.Add('        decode (l.debcre, ''D'', L.VALOR, l.valor*-1 )) as valor,                   ');
    SQL.Add('      decode(d.recpag, ''P'', decode(l.debcre, ''C'', L.VALOROUTRAMOEDA, L.VALOROUTRAMOEDA*-1),  ');
    SQL.Add('        decode(l.debcre, ''D'', L.VALOROUTRAMOEDA, L.VALOROUTRAMOEDA*-1)) as valoroutramoeda,  ');
    SQL.Add('      P.RAZAOSOCIAL, F.DESCRICAO,                                                            ');
    SQL.Add('      SUM(RD.VALOR) AS VALORRATEIO,                                                          ');
    SQL.Add('      TDR.DESCRICAO AS DESCTDR,                                                              ');
    SQL.Add('      AP.NOME AS NOMEAP,                                                                     ');
    SQL.Add('      CR.NOME AS NOMECR,                                                                     ');
    SQL.Add('--    CC.NOME AS NOMECC,                                                                     ');
    SQL.Add('      DECODE (trim(CC.NOME), '''', CR.NOME, CC.NOME) AS NOMECC,                              ');
    SQL.Add('      D.OBS,                                                                                 ');
    SQL.Add('      F.FLGDADOSBANCARIOS AS FLGDOCBANCARIO,                                                 ');
    SQL.Add('      (0) AS VLACRE,                                                                         ');
    SQL.Add('      (0) AS VLDEC,                                                                          ');
    SQL.Add('      (0) AS VLIMP,                                                                          ');
    SQL.Add('      (0) AS VLLIQ,                                                                          ');
    SQL.Add('      D.TRGUSERINCLUSAO, D.TRGDTINCLUSAO, RD.NUMIMOVEL, PATRO.NOME AS NOMEPATRO,             ');
    SQL.Add('      PLANO.NOME AS DESCPLANO, PROGRAMA.DESCPROGRAMA,                                        ');
    SQL.Add('      D.IDFORCLI                                                                             ');
    SQL.Add('    FROM                                                                                     ');
    SQL.Add('      PESSOA P,                                                                              ');
    SQL.Add('      PESSOA PATRO,                                                                          ');
    SQL.Add('      DOCUMENTO D,                                                                           ');
    SQL.Add('      LANCTODOCUM L,                                                                         ');
    SQL.Add('      RATEIODOCUM RD,                                                                        ');
    SQL.Add('      FORMARECPAG F,                                                                         ');
    SQL.Add('      TIPORECEBDESEMB TDR,                                                                   ');
    SQL.Add('      CENTCUST CC,                                                                           ');
    SQL.Add('      UNIDNEGOCIO AP,                                                                        ');
    SQL.Add('      CENTRESPON CR,                                                                         ');
    SQL.Add('      PLANPREVCONTABIL PLANO,                                                                ');
    SQL.Add('      PROGRAMA                                                                               ');
    SQL.Add('    WHERE                                                                                    ');
    SQL.Add('-- #ADF1                                                                                     ');
    If (sListaCentroRespon <> '') Then
      sql.Add(' RD.CODCENTRORESPON IN (' + sListaCentroRespon + ') AND ');
    Case RgStatus Of
      0: sql.Add(' (D.NUMAPGR IS NOT NULL) AND ');
      1: sql.Add(' (D.NUMAPGR IS  NULL) AND ');
    End;
    If Not cbMostraCPMF Then
      sql.Add(' (D.codtipdoc <> ' + moduloCodDocCPMF + ') AND ');
    If (Trim(DtIni) <> '') Then
      sql.Add(' TO_DATE(TO_CHAR(D.' + sCampodata + ',''DD/MM/YYYY''),''DD/MM/YYYY'') >=  TO_DATE(' + #39 +
        Trim(DtIni) + #39 + ',''DD/MM/YYYY'') AND ');
    If (Trim(DtFin) <> '') Then
      sql.Add('  TO_DATE(TO_CHAR(D.' + sCampodata + ',''DD/MM/YYYY''),''DD/MM/YYYY'') <=  TO_DATE(' + #39 +
        Trim(DtFin) + #39 + ',''DD/MM/YYYY'') AND ');
    If sStatus = '0' Then
      sql.Add(' (RTRIM(D.STATUS) = ''0'' OR D.STATUS IS NULL) AND ')
    Else If sStatus = '2' Then
      sql.Add(' (RTRIM(D.STATUS) = ''2'') AND ');
    SQL.Add('-- STRING PARA ADICIONAR FILTRO DAS TELAS DE PARÂMETRO NA CONSULTA                           ');
    SQL.Add('      D.CODTIPDOC IN                                                                         ');
    SQL.Add('      (SELECT CODTIPDOC                                                                      ');
    SQL.Add('        FROM TIPODOCRECPAG A                                                                 ');
    SQL.Add('        WHERE A.RECPAG = :RECPAG AND                                                         ');
    SQL.Add('          NOT EXISTS                                                                         ');
    SQL.Add('          (SELECT *                                                                          ');
    SQL.Add('            FROM USUARIOXTPDOCTO B                                                           ');
    SQL.Add('            WHERE RECPAG= :RECPAG AND                                                        ');
    SQL.Add('              B.IDUSUARIO = :IDUSUARIO)                                                      ');
    SQL.Add('       UNION                                                                                 ');
    SQL.Add('       SELECT CODTIPDOC                                                                      ');
    SQL.Add('        FROM TIPODOCRECPAG A                                                                 ');
    SQL.Add('        WHERE A.RECPAG = :RECPAG AND                                                         ');
    SQL.Add('          EXISTS                                                                             ');
    SQL.Add('            (SELECT *                                                                        ');
    SQL.Add('              FROM USUARIOXTPDOCTO B                                                         ');
    SQL.Add('              WHERE RECPAG = :RECPAG AND                                                     ');
    SQL.Add('                A.CODTIPDOC = B.CODTIPDOC AND                                                ');
    SQL.Add('                B.IDUSUARIO = :IDUSUARIO)                                                    ');
    SQL.Add('      ) AND                                                                                  ');
    SQL.Add('      (d.numfatura is null) and                                                              ');
    SQL.Add('      (L.ESTORNO IS NULL) AND                                                                ');
    SQL.Add('      (D.RECPAG = :RECPAG) AND                                                               ');
    SQL.Add('      (D.IDPESSOA =  :IDPESSOA) AND                                                          ');
    SQL.Add('      (D.CODDOCUMENTO = L.CODDOCUMENTO) AND                                                  ');
    SQL.Add('      (D.OPERACAO = L.OPERACAO) AND                                                          ');
    SQL.Add('      (D.CODDOCUMENTO = RD.CODDOCUMENTO) AND                                                 ');
    SQL.Add('      (P.IDPESSOA = D.IDFORCLI) AND                                                          ');
    SQL.Add('      (D.CODFORMA = F.CODFORMA(+)) AND                                                       ');
    SQL.Add('      (CC.CODCENTROCUSTO(+) = RD.CODCENTROCUSTO) AND                                         ');
    SQL.Add('      (CC.IDEMPRESA(+) = RD.IDEMPRESA) AND                                                   ');
    SQL.Add('      (TDR.CODTIPRECDES(+) = RD.CODTIPRECDES) AND                                            ');
    SQL.Add('      (TDR.RECPAG(+) = RD.RECPAG) AND                                                        ');
    SQL.Add('      (TDR.IDPESSOA(+) = RD.IDPESSOA) AND                                                    ');
    SQL.Add('      (AP.UNIDNEGOC(+) = RD.UNIDNEGOC) AND                                                   ');
    SQL.Add('      (AP.IDPESSOA(+) = RD.IDPESSOA) AND                                                     ');
    SQL.Add('      (CR.CODCENTRORESPON(+) = RD.CODCENTRORESPON) AND                                       ');
    SQL.Add('      (CR.IDPESSOA(+) = RD.IDPESSOA) AND                                                     ');
    SQL.Add('      (PLANO.IDPLANOPREV(+) = RD.IDPLANOPREV) AND                                            ');
    SQL.Add('      (PROGRAMA.IDPROGRAMA(+) = RD.IDPROGRAMA) AND                                           ');
    SQL.Add('      (PATRO.IDPESSOA(+) = RD.IDPATRO)                                                       ');
    SQL.Add('    GROUP BY                                                                                 ');
    SQL.Add('      L.VALOR, D.NUMFATURA, D.CODDOCUMENTO, D.NUMAPGR, D.REFERENCIA,                         ');
    SQL.Add('      D.NODOCUMENTO, D.COMPLDOCUMENTO, D.DATAVENCTO, D.DATAEMISSAO,                          ');
    SQL.Add('      D.DATAPROGRAMADA, P.NUMDOCUMENTO, d.recpag, l.debcre,                                  ');
    SQL.Add('      L.VALOROUTRAMOEDA, P.RAZAOSOCIAL, F.DESCRICAO, TDR.DESCRICAO,                          ');
    SQL.Add('      AP.NOME, CR.NOME, CC.NOME, D.OBS, F.FLGDADOSBANCARIOS,                                 ');
    SQL.Add('      D.TRGUSERINCLUSAO, D.TRGDTINCLUSAO, RD.NUMIMOVEL, PATRO.NOME,                          ');
    SQL.Add('      PLANO.NOME, PROGRAMA.DESCPROGRAMA, D.IDFORCLI                                          ');
    SQL.Add('    UNION                                                                                    ');
    SQL.Add('      SELECT                                                                                 ');
    SQL.Add('        Q1.NUMFATURA, Q1.CODDOCUMENTO, Q1.NUMAPGR, Q1.REFERENCIA, Q1.NODOCUMENTO,            ');
    SQL.Add('        Q1.COMPLDOCUMENTO, Q1.DATAVENCTO, Q1.DATAEMISSAO, Q1.DATAPROGRAMADA,                 ');
    SQL.Add('        Q1.NUMDOCUMENTO, Q1.VALOR, Q1.VALOROUTRAMOEDA, Q1.RAZAOSOCIAL,                       ');
    SQL.Add('        Q1.DESCRICAO,                                                                        ');
    SQL.Add('        SUM(((Q1.VALOR * Q2.VALOR)/ Q3.VALOR)) AS VALORRATEIO,                               ');
    SQL.Add('        Q2.DESCTDR, Q2.NOMEAP, Q2.NOMECR, Q2.NOMECC, Q1.OBS, Q1.FLGDOCBANCARIO,              ');
    SQL.Add('        (0) AS VLACRE,                                                                       ');
    SQL.Add('        (0) AS VLDEC,                                                                        ');
    SQL.Add('        (0) AS VLIMP,                                                                        ');
    SQL.Add('        (0) AS VLLIQ,                                                                        ');
    SQL.Add('        Q1.TRGUSERINCLUSAO, Q1.TRGDTINCLUSAO, Q2.NUMIMOVEL, Q2.NOMEPATRO,                    ');
    SQL.Add('        Q2.DESCPLANO, Q2.DESCPROGRAMA, Q1.IDFORCLI                                           ');
    SQL.Add('      FROM                                                                                   ');
    SQL.Add('        (SELECT                                                                              ');
    SQL.Add('            DOC.NUMFATURA,                                                                   ');
    SQL.Add('            DOC.CODDOCUMENTO,                                                                ');
    SQL.Add('            DOC.NUMAPGR,                                                                     ');
    SQL.Add('            DOC.REFERENCIA,                                                                  ');
    SQL.Add('            DOC.NODOCUMENTO,                                                                 ');
    SQL.Add('            DOC.COMPLDOCUMENTO,                                                              ');
    SQL.Add('            DOC.DATAVENCTO,                                                                  ');
    SQL.Add('            DOC.DATAEMISSAO,                                                                 ');
    SQL.Add('            DOC.DATAPROGRAMADA,                                                              ');
    SQL.Add('            P.NUMDOCUMENTO,                                                                  ');
    SQL.Add('            decode                                                                           ');
    SQL.Add('            (doc.recpag, ''P'',                                                              ');
    SQL.Add('              decode(lan.debcre, ''C'', Lan.VALOR, lan.valor*-1),                            ');
    SQL.Add('              decode(lan.debcre, ''D'', Lan.VALOR, lan.valor*-1)) as valor,                  ');
    SQL.Add('            decode(doc.recpag, ''P'', decode(lan.debcre,''C'', Lan.VALOROUTRAMOEDA,          ');
    SQL.Add('                Lan.VALOROUTRAMOEDA*-1),                                                     ');
    SQL.Add('              decode(lan.debcre, ''D'', Lan.VALOROUTRAMOEDA, Lan.VALOROUTRAMOEDA*-1)         ');
    SQL.Add('            ) as valoroutramoeda,                                                            ');
    SQL.Add('            P.RAZAOSOCIAL, F.DESCRICAO, DOC.OBS,                                             ');
    SQL.Add('            F.FLGDADOSBANCARIOS AS FLGDOCBANCARIO,                                           ');
    SQL.Add('            (0) AS VLACRE,                                                                   ');
    SQL.Add('            (0) AS VLDEC,                                                                    ');
    SQL.Add('            (0) AS VLIMP,                                                                    ');
    SQL.Add('            (0) AS VLLIQ,                                                                    ');
    SQL.Add('            DOC.TRGUSERINCLUSAO,                                                             ');
    SQL.Add('            DOC.TRGDTINCLUSAO,                                                               ');
    SQL.Add('            DOC.IDFORCLI                                                                     ');
    SQL.Add('          FROM                                                                               ');
    SQL.Add('            PESSOA P, DOCUMENTO DOC, LANCTODOCUM LAN, FORMARECPAG F                          ');
    SQL.Add('          WHERE                                                                              ');
    SQL.Add('-- #ADF2                                                                                     ');
    Case RgStatus Of
      0: sql.Add(' (DOC.NUMAPGR IS NOT NULL) AND ');
      1: sql.Add(' (DOC.NUMAPGR IS  NULL) AND ');
    End;
    If Not cbMostraCPMF Then
      sql.Add(' (Doc.codtipdoc <> ' + moduloCodDocCPMF + ') AND ');
    If (Trim(DtIni) <> '') Then
      sql.Add(' TO_DATE(TO_CHAR(DOC.' + sCampodata + ',''DD/MM/YYYY''),''DD/MM/YYYY'') >=  TO_DATE(' + #39 +
        TRIM(DtIni) + #39 + ',''DD/MM/YYYY'') AND ');
    If (Trim(DtFin) <> '') Then
      sql.Add(' TO_DATE(TO_CHAR(DOC.' + sCampodata + ',''DD/MM/YYYY''),''DD/MM/YYYY'') <=  TO_DATE(' + #39 +
        TRIM(DtFin) + #39 + ',''DD/MM/YYYY'') AND ');
    If sStatus = '0' Then
      sql.Add(' (RTRIM(DOC.STATUS) = ''0'' OR DOC.STATUS IS NULL) AND ')
    Else If sStatus = '2' Then
      sql.Add(' (RTRIM(DOC.STATUS) = ''2'') AND ');
    SQL.Add('-- STRING PARA ADICIONAR FILTRO DAS TELAS DE PARÂMETRO NA CONSULTA                           ');
    SQL.Add('            DOC.CODTIPDOC IN                                                                 ');
    SQL.Add('            (                                                                                ');
    SQL.Add('              SELECT CODTIPDOC                                                               ');
    SQL.Add('              FROM TIPODOCRECPAG A                                                           ');
    SQL.Add('              WHERE                                                                          ');
    SQL.Add('                A.RECPAG = :RECPAG AND                                                       ');
    SQL.Add('                NOT EXISTS                                                                   ');
    SQL.Add('                (SELECT *                                                                    ');
    SQL.Add('                  FROM USUARIOXTPDOCTO B                                                     ');
    SQL.Add('                  WHERE RECPAG = :RECPAG AND                                                 ');
    SQL.Add('                    B.IDUSUARIO = :IDUSUARIO                                                 ');
    SQL.Add('                )                                                                            ');
    SQL.Add('              UNION                                                                          ');
    SQL.Add('                SELECT CODTIPDOC                                                             ');
    SQL.Add('                FROM TIPODOCRECPAG A                                                         ');
    SQL.Add('                WHERE A.RECPAG = :RECPAG AND                                                 ');
    SQL.Add('                  EXISTS                                                                     ');
    SQL.Add('                  (SELECT *                                                                  ');
    SQL.Add('                    FROM USUARIOXTPDOCTO B                                                   ');
    SQL.Add('                    WHERE RECPAG = :RECPAG AND                                               ');
    SQL.Add('                      A.CODTIPDOC = B.CODTIPDOC AND                                          ');
    SQL.Add('                      B.IDUSUARIO = :IDUSUARIO                                               ');
    SQL.Add('                  )                                                                          ');
    SQL.Add('            ) AND                                                                            ');
    SQL.Add('            (LAN.ESTORNO IS NULL) AND                                                        ');
    SQL.Add('            (DOC.RECPAG = :RECPAG) AND                                                       ');
    SQL.Add('            (DOC.IDPESSOA = :IDPESSOA) AND                                                   ');
    SQL.Add('            (P.IDPESSOA = DOC.IDFORCLI)AND                                                   ');
    SQL.Add('            (DOC.CODFORMA = F.CODFORMA(+)) AND                                               ');
    SQL.Add('            (RTRIM(LAN.OPERACAO) IN (''3'',''13'')) AND                                      ');
    SQL.Add('            (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)                                            ');
    SQL.Add('        ) Q1,                                                                                ');
    SQL.Add('        (SELECT D.NUMFATURA,                                                                 ');
    SQL.Add('            (DECODE                                                                          ');
    SQL.Add('              (D.RECPAG,''P'', DECODE(L.DEBCRE, ''C'', Rd.VALOR, Rd.VALOR * -1),             ');
    SQL.Add('                DECODE(L.DEBCRE, ''D'', Rd.VALOR, Rd.VALOR * -1)                             ');
    SQL.Add('              )) as valor,                                                                   ');
    SQL.Add('            TDR.DESCRICAO AS DESCTDR,                                                        ');
    SQL.Add('            AP.NOME AS NOMEAP,                                                               ');
    SQL.Add('            CR.NOME AS NOMECR,                                                               ');
    SQL.Add('--          CC.NOME AS NOMECC,                                                               ');
    SQL.Add('            DECODE(trim(CC.NOME), '''', CR.NOME, CC.NOME) AS NOMECC,                         ');
    SQL.Add('            RD.NUMIMOVEL,                                                                    ');
    SQL.Add('            PATRO.NOME AS NOMEPATRO,                                                         ');
    SQL.Add('            PLANO.NOME AS DESCPLANO,                                                         ');
    SQL.Add('            PROGRAMA.DESCPROGRAMA                                                            ');
    SQL.Add('          FROM                                                                               ');
    SQL.Add('            PESSOA PATRO,                                                                    ');
    SQL.Add('            DOCUMENTO D,                                                                     ');
    SQL.Add('            LANCTODOCUM L,                                                                   ');
    SQL.Add('            RATEIODOCUM RD,                                                                  ');
    SQL.Add('            TIPORECEBDESEMB TDR,                                                             ');
    SQL.Add('            CENTCUST CC,                                                                     ');
    SQL.Add('            UNIDNEGOCIO AP,                                                                  ');
    SQL.Add('            CENTRESPON CR,                                                                   ');
    SQL.Add('            PLANPREVCONTABIL PLANO,                                                          ');
    SQL.Add('            PROGRAMA                                                                         ');
    SQL.Add('          WHERE                                                                              ');
    SQL.Add('-- #ADF3                                                                                     ');
    If (sListaCentroRespon <> '') Then
    Begin
      SQL.Add(' RD.CODCENTRORESPON IN (' + sListaCentroRespon + ') AND ');
    End;
    Case RgStatus Of
      0: SQL.Add(' (D.NUMAPGR IS NOT NULL) AND ');
      1: SQL.Add(' (D.NUMAPGR IS  NULL) AND ');
    End;
    If Not cbMostraCPMF Then
      SQL.Add(' (D.codtipdoc <> ' + moduloCodDocCPMF + ') AND ');
    SQL.Add('-- STRING PARA ADICIONAR FILTRO DAS TELAS DE PARÂMETRO NA CONSULTA                           ');
    SQL.Add('            (D.RECPAG = :RECPAG) AND                                                         ');
    SQL.Add('            d.coddocumento=l.coddocumento and                                                ');
    SQL.Add('            l.operacao=d.operacao and                                                        ');
    SQL.Add('            (D.IDPESSOA =  :IDPESSOA) AND                                                    ');
    SQL.Add('            (D.NUMFATURA IS NOT NULL) AND                                                    ');
    SQL.Add('            (CC.CODCENTROCUSTO(+) = RD.CODCENTROCUSTO) AND                                   ');
    SQL.Add('            (CC.IDEMPRESA(+) = RD.IDEMPRESA) AND                                             ');
    SQL.Add('            (D.CODDOCUMENTO = RD.CODDOCUMENTO) AND                                           ');
    SQL.Add('            (TDR.CODTIPRECDES(+) = RD.CODTIPRECDES) AND                                      ');
    SQL.Add('            (TDR.RECPAG(+) = RD.RECPAG) AND                                                  ');
    SQL.Add('            (TDR.IDPESSOA(+) = RD.IDPESSOA) AND                                              ');
    SQL.Add('            (AP.UNIDNEGOC(+) = RD.UNIDNEGOC) AND                                             ');
    SQL.Add('            (AP.IDPESSOA(+) = RD.IDPESSOA) AND                                               ');
    SQL.Add('            (CR.CODCENTRORESPON(+) = RD.CODCENTRORESPON) AND                                 ');
    SQL.Add('            (PLANO.IDPLANOPREV(+) = RD.IDPLANOPREV) AND                                      ');
    SQL.Add('            (PROGRAMA.IDPROGRAMA(+) = RD.IDPROGRAMA) AND                                     ');
    SQL.Add('            (PATRO.IDPESSOA(+) = RD.IDPATRO) AND                                             ');
    SQL.Add('            (CR.IDPESSOA(+) = RD.IDPESSOA)                                                   ');
    SQL.Add('        ) Q2,                                                                                ');
    SQL.Add('        (                                                                                    ');
    SQL.Add('          SELECT                                                                             ');
    SQL.Add('            D.NUMFATURA,                                                                     ');
    SQL.Add('            sum(decode                                                                       ');
    SQL.Add('              (d.recpag,''P'',                                                               ');
    SQL.Add('                decode(l.debcre, ''C'', L.VALOR, l.valor*-1),                                ');
    SQL.Add('                decode(l.debcre, ''D'', L.VALOR, l.valor*-1                                  ');
    SQL.Add('                ))) as valor                                                                 ');
    SQL.Add('          FROM                                                                               ');
    SQL.Add('            DOCUMENTO D,                                                                     ');
    SQL.Add('            LANCTODOCUM L                                                                    ');
    SQL.Add('          WHERE                                                                              ');
    SQL.Add('            (L.ESTORNO IS NULL) AND                                                          ');
    SQL.Add('            (D.RECPAG= :RECPAG) AND                                                          ');
    SQL.Add('            (D.IDPESSOA = :IDPESSOA) AND                                                     ');
    SQL.Add('            (RTRIM(L.OPERACAO) IN (''1'',''11'')) AND                                        ');
    SQL.Add('            (D.CODDOCUMENTO = L.CODDOCUMENTO) AND                                            ');
    SQL.Add('            (D.OPERACAO = L.OPERACAO) AND                                                    ');
    SQL.Add('            (D.NUMFATURA IS NOT NULL)                                                        ');
    SQL.Add('          GROUP BY D.NUMFATURA                                                               ');
    SQL.Add('        ) Q3                                                                                 ');
    SQL.Add('      WHERE                                                                                  ');
    SQL.Add('        (Q1.NUMFATURA = Q2.NUMFATURA) AND                                                    ');
    SQL.Add('        (Q3.NUMFATURA = Q2.NUMFATURA)                                                        ');
    SQL.Add('      GROUP BY                                                                               ');
    SQL.Add('        Q1.NUMFATURA,                                                                        ');
    SQL.Add('        Q1.CODDOCUMENTO,                                                                     ');
    SQL.Add('        Q1.NUMAPGR,                                                                          ');
    SQL.Add('        Q1.REFERENCIA,                                                                       ');
    SQL.Add('        Q1.NODOCUMENTO,                                                                      ');
    SQL.Add('        Q1.COMPLDOCUMENTO,                                                                   ');
    SQL.Add('        Q1.DATAVENCTO,                                                                       ');
    SQL.Add('        Q1.DATAEMISSAO,                                                                      ');
    SQL.Add('        Q1.DATAPROGRAMADA,                                                                   ');
    SQL.Add('        Q1.NUMDOCUMENTO,                                                                     ');
    SQL.Add('        Q1.VALOR,                                                                            ');
    SQL.Add('        Q1.VALOROUTRAMOEDA,                                                                  ');
    SQL.Add('        Q1.RAZAOSOCIAL,                                                                      ');
    SQL.Add('        Q1.DESCRICAO,                                                                        ');
    SQL.Add('        Q2.DESCTDR,                                                                          ');
    SQL.Add('        Q2.NOMEAP,                                                                           ');
    SQL.Add('        Q2.NOMECR,                                                                           ');
    SQL.Add('        Q2.NOMECC,                                                                           ');
    SQL.Add('        Q1.OBS,                                                                              ');
    SQL.Add('        Q1.FLGDOCBANCARIO,                                                                   ');
    SQL.Add('        Q1.TRGUSERINCLUSAO,                                                                  ');
    SQL.Add('        Q1.TRGDTINCLUSAO,                                                                    ');
    SQL.Add('        Q2.NUMIMOVEL,                                                                        ');
    SQL.Add('        Q2.NOMEPATRO,                                                                        ');
    SQL.Add('        Q2.DESCPLANO,                                                                        ');
    SQL.Add('        Q2.DESCPROGRAMA,                                                                     ');
    SQL.Add('        Q1.IDFORCLI)                                                                         ');
    sql.Add(' group by NUMFATURA, CODDOCUMENTO, NUMAPGR, REFERENCIA, NODOCUMENTO, COMPLDOCUMENTO,         ');
    sql.Add('  DATAVENCTO, DATAEMISSAO, DATAPROGRAMADA, NUMDOCUMENTO, VALOR, VALOROUTRAMOEDA,             ');
    sql.Add('  RAZAOSOCIAL, DESCRICAO, VALORRATEIO,  NOMECR, NOMECC, OBS,                                 ');
    sql.Add('  FLGDOCBANCARIO, TRGUSERINCLUSAO,                                                           ');
    sql.Add('  TRGDTINCLUSAO,                                                                             ');
    sql.Add('  NUMIMOVEL, NOMEPATRO, DESCPLANO, DESCPROGRAMA, IDFORCLI, DESCTDR, NOMEAP, VLACRE,          ');
    sql.Add('  VLDEC, VLIMP, VLLIQ                                                                        ');
{    sCamposOrder := sCamposOrderDefault;
    For X := 0 To 2 Do
    Begin
      If TreeOrdemString = 'DATA' Then
        sCamposOrder := sCamposOrder + ', TRGDTINCLUSAO'
      Else
        sCamposOrder := sCamposOrder + ',' + TreeOrdemString;
    End;}
   sql.Add(' ORDER BY ' + sCamposOrder + ', OBS DESC');

    //Altera o grupo de Acordo com o Order By
//    Sql.SaveToFile(Sistema.TempDir + 'ScrAp.Sql');
    Prepare;
    Parambyname('RECPAG').AsString := ParamIntegra.RecPag;
    Parambyname('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
    Parambyname('IDUSUARIO').AsFloat := CrmRptCM.IdUsuario;
    Open;
  End;
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

  While Not CdsAutPagDoc.eof Do
  Begin
    Montaregistro;

    If (Trim(sGrupo1) <> Trim(CdsAutPagDoc.FieldByName(sCampoData1).AsString)) Then
    Begin
      rTotValorBruto := CdsAutPagDoc.FieldByName('VALOR').AsFloat + rTotValorBruto;
      rTotValorDeducoes := CdsAutPagDoc.FieldByName('VLDEC').AsFloat + rTotValorDeducoes;
      rTotValorAcrescimo := CdsAutPagDoc.FieldByName('VLACRE').AsFloat + rTotValorAcrescimo;
      rTotValorImposto := CdsAutPagDoc.FieldByName('VLIMP').AsFloat + rTotValorImposto;
      rTotValorAPagar := CdsAutPagDoc.FieldByName('VLLIQ').AsFloat + rTotValorAPagar;
      rTotValorLanctoLiq := CdsAutPagDoc.FieldByName('VALOLANCTOLIQ').AsFloat + rTotValorLanctoLiq;
      rSumValorBruto := 0;
      rSumValorDeducoes := 0;
      rSumValorAcrescimo := 0;
      rSumValorImposto := 0;
      rSumValorAPagar := 0;
      rSumValorLanctoLiq := 0;
    End;

    If Trim(sGrupo0) <> Trim(CdsAutPagDoc.FieldByName(sCampoData0).AsString) Then
    Begin
      rSumValorBruto := rSumValorBruto + CdsAutPagDoc.FieldByName('VALOR').AsFloat;
      rSumValorDeducoes := rSumValorDeducoes + CdsAutPagDoc.FieldByName('VLDEC').AsFloat;
      rSumValorAcrescimo := rSumValorAcrescimo + CdsAutPagDoc.FieldByName('VLACRE').AsFloat;
      rSumValorImposto := rSumValorImposto + CdsAutPagDoc.FieldByName('VLIMP').AsFloat;
      rSumValorAPagar := rSumValorAPagar + CdsAutPagDoc.FieldByName('VLLIQ').AsFloat;
      rSumValorLanctoLiq := rSumValorLanctoLiq + CdsAutPagDoc.FieldByName('VALOLANCTOLIQ').AsFloat;
    End;

    sGrupo0 := Trim(CdsAutPagDoc.FieldByName(sCampoData0).AsString);
    sGrupo1 := Trim(CdsAutpagDoc.FieldByName(sCampoData1).AsString);

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

    If (oldCodDoc <> CdsAutPagDoc.FieldByName('CODDOCUMENTO').AsString) And
      (oldCodDoc <> '') Then
    Begin
      CdsListaCCusto.Append;
      CdsListaCCusto.FieldByName('CODDOCUMENTO').AsFloat := StrToFloat(oldCodDoc);
      CdsListaCCusto.FieldByName('OBS').AsString := Copy(sListCusto, 3, Length(sListCusto));
      CdsListaCCusto.Post;
      sListCusto := ''
    End;

    If (Not CdsAutPagDoc.FieldByName('NOMECC').IsNull) And
      (Pos(CdsAutPagDoc.FieldByName('NOMECC').AsString, sListCusto) = 0) Then
      sListCusto := sListCusto + ', ' + CdsAutPagDoc.FieldByName('NOMECC').AsString;

    CdsAutPagDoc.Post;

    OldCodDoc := CdsAutPagDoc.FieldByName('CODDOCUMENTO').AsString;
    OldCCusto := CdsAutPagDoc.FieldByName('NOMECC').AsString;
    CdsDemGestAutPag.Append;
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
    CdsAutPagDoc.Next;
  End;
  If Not CdsAutPagDoc.IsEmpty Then
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

    CdsDemGestAutPag.Edit;
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
  End;

  CdsDemGestAutPag.First;
End;

Procedure TRptDemGestAutPag.Montaregistro;
Var
  rSaldo, rSaldoOm: real;
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
  //    rSaldoOm := Documento.Saldo.ValorOM;
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
    CdsAutPagDoc.FieldByName('VLIMP').AsFloat := CdsAutPagDoc.FieldByName('VLIMP').AsFloat + CdsAutPagDocAlt.FieldByName('Valimp').AsFloat;
    CdsAutPagDoc.FieldByName('VLLIQ').AsFloat := rSaldo;
  End;

  CdsAutPagDoc.FieldByName('VALOLANCTOLIQ').AsFloat := CdsAutPagDoc.FieldByName('Valor').AsFloat -
    CdsAutPagDoc.FieldByName('VLDEC').AsFloat +
    CdsAutPagDoc.FieldByName('VLACRE').AsFloat -
    CdsAutPagDoc.FieldByName('VLIMP').AsFloat;

  CdsAutPagDoc.post;
End;

Procedure TRptDemGestAutPag.ppGroupHeaderBand7BeforePrint(Sender: TObject);
Begin
  Inherited;
  With CdsListaCCusto Do
    If Active Then
    Begin
      If Locate('CODDOCUMENTO', CdsDemGestAutPagCODDOCUMENTO.AsFloat, []) Then
        MemCCusto.Lines.Text := CdsListaCCusto.FieldByName('OBS').AsString
      Else
        MemCCusto.Lines.Clear;
    End;
End;

Function TRptDemGestAutPag.UltDiaMes(FDate: TDateTime): TDateTime;
Const
  DaysPerMonth: Array[1..12] Of Integer =
  (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
Var
  Ano, Mes, Dia, iUltDia: Word;

  Function IsLeapYear(Year: Word): Boolean;
  Begin
    Result := (Year Mod 4 = 0)
      And ((Year Mod 100 <> 0)
      Or (Year Mod 400 = 0));
  End;
Begin
  DecodeDate(FDate, Ano, Mes, Dia);
  iUltDia := DaysPerMonth[Mes];
  If (Mes = 2) And IsLeapYear(Ano) Then
    Inc(iUltDia);
  Result := EncodeDate(Ano, Mes, iUltDia);
End;

Procedure TRptDemGestAutPag.FormCreate(Sender: TObject);
Begin
  Inherited;
  Documento := TCtrlDocumento.Create;
  Documento.InitializeAs(ParamIntegra);

End;

Procedure TRptDemGestAutPag.CdsAutPagDocCalcFields(DataSet: TDataSet);
Begin
  Inherited;
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
    BuscaContaDoc(CdsAutPagDoc.fieldByName('CODDOCUMENTO').AsFloat);
    CdsAutPagDoc.FieldByName('NUMBANCO').AsString := sBanco;
    CdsAutPagDoc.FieldByName('NUMAGENCIA').AsString := sAgenciaFormat;
    CdsAutPagDoc.FieldByName('CONTACORRENTE').AsString := sNumeroFormat;
  End;
End;

Procedure TRptDemGestAutPag.BuscaContaDoc(CodDocumento: Real);
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
      sNomeBanco := CdsBuscaContaDoc.FieldByName('FornNOMEBANCO').AsString;
      sAgencia := CdsBuscaContaDocForn.FieldByName('NUMAGENCIA').AsString;
      sNomeagencia := CdsBuscaContaDoc.FieldByName('FornNOMEAGENCIA').AsString;
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

End.

