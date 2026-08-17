Unit rAutPag;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, DBClient, ppDB,
  ppDBPipe, ppDBBDE, Db, Wwdatsrc, ppBands, ppMemo, ppClass, ppCtrls,
  ppVar, ppRegion, ppStrtch, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd,
  ppReport, DBTables, Wwquery, uCMClientDataSet, uCmSqlParams, ppTypes,
  uCtrlRelatoriosCAPCAR, uCtrlDocumento, uCtrlParamIntegra, Mask, TXRB;

Type
  TRptAutPag = Class(TFrmCmReport)
    Dsautpagdoc: TwwDataSource;
    Ppautpagdoc: TppBDEPipeline;
    Rptautpagdoc: TppReport;
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
    ppLabel82: TppLabel;
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
    ppLabel107: TppLabel;
    ppLabel110: TppLabel;
    ppLine39: TppLine;
    ppLine40: TppLine;
    ppLine41: TppLine;
    ppLine42: TppLine;
    ppLine43: TppLine;
    ppLine44: TppLine;
    ppLine45: TppLine;
    ppLabel111: TppLabel;
    ppLabel112: TppLabel;
    ppLabel113: TppLabel;
    ppLabel114: TppLabel;
    ppDBText93: TppDBText;
    ppDBText97: TppDBText;
    ppDBText98: TppDBText;
    ppDBText99: TppDBText;
    ppDBText100: TppDBText;
    ppLabel115: TppLabel;
    ppLabel116: TppLabel;
    ppLabel117: TppLabel;
    ppGroupFooterBand8: TppGroupFooterBand;
    ppRegion1: TppRegion;
    ppLabel118: TppLabel;
    ppLabel119: TppLabel;
    ppLine46: TppLine;
    ppLabel120: TppLabel;
    ppLabel121: TppLabel;
    ppLabel123: TppLabel;
    ppLabel124: TppLabel;
    ppLine47: TppLine;
    ppLine48: TppLine;
    ppLine49: TppLine;
    ppLabel125: TppLabel;
    ppLabel127: TppLabel;
    ppLabel128: TppLabel;
    ppLine50: TppLine;
    ppLabel129: TppLabel;
    ppDBText101: TppDBText;
    ppRegion2: TppRegion;
    ppLabel130: TppLabel;
    ppDBMemo1: TppDBMemo;
    ppRegion4: TppRegion;
    ppLabel131: TppLabel;
    ppDBText102: TppDBText;
    ppRegion5: TppRegion;
    ppDBText104: TppDBText;
    ppLabel132: TppLabel;
    ppLabel133: TppLabel;
    ppDBText105: TppDBText;
    ppLabel136: TppLabel;
    ppDBText106: TppDBText;
    ppCalc29: TppSystemVariable;
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
    Procedure CrmRptCMBeforePrint(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure ppDBText92Format(Sender: TObject; DisplayFormat: String;
      DataType: TppDataType; Value: Variant; Var Text: String);
  private
    { Private declarations }
    sBanco, sAgencia, sAgenciaFormat, sNomeagencia, sNumeroFormat, sNomeBanco,
      sNumero, sDescTipo, sTipo, sMascaraAgencia, sMascaraConta, oldDoc: String;
    Id: double;
    rVLDEC, rVLACRE, rVLIMP, rVLLIQ: real;
    CtrlRelatoriosCAPCAR: TCtrlRelatoriosCAPCAR;
    Documento: TCtrlDocumento;
    Procedure montaregistro;
    Procedure BuscaContaDoc(CodDocumento: Real);
    Procedure GravaBancoAg;
  public
    { Public declarations }
  End;

Var
  RptAutPag: TRptAutPag;

Implementation

Uses dBaseDados, uString, uSistema;

{$R *.DFM}

Procedure TRptAutPag.CrmRptCMBeforePrint(Sender: TObject);
Var
  x: integer;
Begin
  Inherited;
  With SqlAutPagDoc Do
  Begin
    SQL.Clear;
    SQL.Add('SELECT /*+ RULE */ NUMFATURA, CODDOCUMENTO, NUMAPGR, REFERENCIA, NODOCUMENTO,  ');
    SQL.Add('  COMPLDOCUMENTO, DATAVENCTO, DATAEMISSAO, DATAPROGRAMADA, NUMDOCUMENTO,       ');
    SQL.Add('  VALOR, VALOROUTRAMOEDA, RAZAOSOCIAL, DESCRICAO, VALORRATEIO,                 ');
    SQL.Add('  DESCTDR, NOMEAP, NOMECR, NOMECC, OBS, FLGDOCBANCARIO, VLACRE,                ');
    SQL.Add('  VLDEC, VLIMP, VLLIQ, TRGUSERINCLUSAO,                                        ');
    SQL.Add('  TO_DATE(TO_CHAR(TRGDTINCLUSAO,''DD/MM/YYYY''),''DD/MM/YYYY'') AS TRGDTINCLUSAO,  ');
    SQL.Add('  (0) AS TOTVALORBRUTO, (0) AS TOTVALORDEDUCOES, (0) AS TOTVALORACRESCIMO,     ');
    SQL.Add('  (0) AS TOTVALORIMPOSTO, (0) AS TOTVALORAPAGAR, (0) AS SUMVALORBRUTO,         ');
    SQL.Add('  (0) AS SUMVALORDEDUCOES, (0) AS SUMVALORACRESCIMO, (0) AS SUMVALORIMPOSTO,   ');
    SQL.Add('  (0) AS SUMVALORAPAGAR, NUMIMOVEL, NOMEPATRO, DESCPLANO, DESCPROGRAMA,        ');
    SQL.Add('  IDFORCLI, (0) AS VALOLANCTOLIQ, (0) AS SUMVALOLANCTOLIQ,                     ');
    SQL.Add('  ''                    '' AS NOMEUSUARIO,                                     ');
    SQL.Add('  ''                    '' AS NUMBANCO,                                        ');
    SQL.Add('  ''                    '' AS NUMAGENCIA,                                      ');
    SQL.Add('  ''                    '' AS CONTACORRENTE                                    ');
    SQL.Add('FROM                                                                           ');
    SQL.Add('  (SELECT D.NUMFATURA, D.CODDOCUMENTO, D.NUMAPGR, D.REFERENCIA,                ');
    SQL.Add('          D.NODOCUMENTO, D.COMPLDOCUMENTO, D.DATAVENCTO, D.DATAEMISSAO,        ');
    SQL.Add('          D.DATAPROGRAMADA, P.NUMDOCUMENTO,                                    ');
    SQL.Add('          decode(d.recpag, ''P'', decode(l.debcre,''C'',L.VALOR,l.valor*-1),   ');
    SQL.Add('             decode(l.debcre, ''D'', L.VALOR, l.valor * -1)) as valor, ');
    SQL.Add('          decode(d.recpag,''P'',decode(l.debcre,''C'',L.VALOROUTRAMOEDA,       ');
    SQL.Add('             L.VALOROUTRAMOEDA*-1),                                            ');
    SQL.Add('             decode(l.debcre,''D'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1 )    ');
    SQL.Add('                ) as valoroutramoeda,                                          ');
    SQL.Add('          P.RAZAOSOCIAL, F.DESCRICAO, SUM(RD.VALOR) AS VALORRATEIO,            ');
    SQL.Add('          TDR.DESCRICAO AS DESCTDR, AP.NOME AS NOMEAP, CR.NOME AS NOMECR,      ');
    SQL.Add('          DECODE(trim(CC.NOME), '''', CR.NOME,CC.NOME) AS NOMECC,              ');
    SQL.Add('          D.OBS, F.FLGDADOSBANCARIOS AS FLGDOCBANCARIO, (0) AS VLACRE,         ');
    SQL.Add('         (0) AS VLDEC, (0) AS VLIMP, (0) AS VLLIQ, D.TRGUSERINCLUSAO,          ');
    SQL.Add('         D.TRGDTINCLUSAO, RD.NUMIMOVEL, PATRO.NOME AS NOMEPATRO,               ');
    SQL.Add('         PLANO.NOME AS DESCPLANO, PROGRAMA.DESCPROGRAMA, D.IDFORCLI            ');
    SQL.Add('   FROM PESSOA P, PESSOA PATRO, DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM RD,    ');
    SQL.Add('        FORMARECPAG F, TIPORECEBDESEMB TDR, CENTCUST CC, UNIDNEGOCIO AP,       ');
    SQL.Add('        CENTRESPON CR, PLANPREVCONTABIL PLANO, PROGRAMA                        ');
    SQL.Add('   WHERE                                                                       ');
    SQL.Add('-- #ADF1                                                                       ');
    SQL.Add('-- STRING PARA ADICIONAR FILTRO DAS TELAS DE PARÂMETRO NA CONSULTA             ');
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
    SQL.Add('    GROUP BY L.VALOR, D.NUMFATURA, D.CODDOCUMENTO, D.NUMAPGR,                  ');
    SQL.Add('             D.REFERENCIA, D.NODOCUMENTO, D.COMPLDOCUMENTO,                    ');
    SQL.Add('             D.DATAVENCTO, D.DATAEMISSAO, D.DATAPROGRAMADA,                    ');
    SQL.Add('             P.NUMDOCUMENTO, d.recpag, l.debcre, L.VALOROUTRAMOEDA,            ');
    SQL.Add('             P.RAZAOSOCIAL, F.DESCRICAO, TDR.DESCRICAO, AP.NOME,               ');
    SQL.Add('             CR.NOME, CC.NOME, D.OBS, F.FLGDADOSBANCARIOS, D.TRGUSERINCLUSAO,  ');
    SQL.Add('             D.TRGDTINCLUSAO, RD.NUMIMOVEL, PATRO.NOME, PLANO.NOME,            ');
    SQL.Add('             PROGRAMA.DESCPROGRAMA, D.IDFORCLI                                 ');
    SQL.Add('    UNION                                                                      ');
    SQL.Add('    SELECT Q1.NUMFATURA, Q1.CODDOCUMENTO, Q1.NUMAPGR, Q1.REFERENCIA,           ');
    SQL.Add('           Q1.NODOCUMENTO, Q1.COMPLDOCUMENTO, Q1.DATAVENCTO,                   ');
    SQL.Add('           Q1.DATAEMISSAO, Q1.DATAPROGRAMADA, Q1.NUMDOCUMENTO, Q1.VALOR,       ');
    SQL.Add('           Q1.VALOROUTRAMOEDA, Q1.RAZAOSOCIAL, Q1.DESCRICAO,                   ');
    SQL.Add('           SUM(((Q1.VALOR * Q2.VALOR)/ Q3.VALOR)) AS VALORRATEIO,              ');
    SQL.Add('           Q2.DESCTDR, Q2.NOMEAP, Q2.NOMECR, Q2.NOMECC, Q1.OBS,                ');
    SQL.Add('           Q1.FLGDOCBANCARIO, (0) AS VLACRE, (0) AS VLDEC, (0) AS VLIMP,       ');
    SQL.Add('           (0) AS VLLIQ, Q1.TRGUSERINCLUSAO, Q1.TRGDTINCLUSAO,                 ');
    SQL.Add('           Q2.NUMIMOVEL, Q2.NOMEPATRO, Q2.DESCPLANO, Q2.DESCPROGRAMA,          ');
    SQL.Add('           Q1.IDFORCLI                                                         ');
    SQL.Add('    FROM                                                                       ');
    SQL.Add('        (SELECT DOC.NUMFATURA, DOC.CODDOCUMENTO, DOC.NUMAPGR, DOC.REFERENCIA,  ');
    SQL.Add('            DOC.NODOCUMENTO, DOC.COMPLDOCUMENTO, DOC.DATAVENCTO,               ');
    SQL.Add('            DOC.DATAEMISSAO, DOC.DATAPROGRAMADA, P.NUMDOCUMENTO,               ');
    SQL.Add('            decode(doc.recpag,''P'',decode(lan.debcre,''C'',                   ');
    SQL.Add('              Lan.VALOR,lan.valor*-1),                                         ');
    SQL.Add('              decode(lan.debcre,''D'',Lan.VALOR,lan.valor*-1)) as valor,       ');
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
    SQL.Add('        ) Q1,                                                                  ');
    SQL.Add('        (SELECT D.NUMFATURA,(DECODE(D.RECPAG,''P'',DECODE(L.DEBCRE,''C'',      ');
    SQL.Add('                  Rd.VALOR, Rd.VALOR * -1),                                    ');
    SQL.Add('                DECODE(L.DEBCRE, ''D'', Rd.VALOR, Rd.VALOR * -1))) as valor,   ');
    SQL.Add('            TDR.DESCRICAO AS DESCTDR,                                          ');
    SQL.Add('            AP.NOME AS NOMEAP,                                                 ');
    SQL.Add('            CR.NOME AS NOMECR,                                                 ');
    SQL.Add('            DECODE(trim(CC.NOME),'''', CR.NOME, CC.NOME) AS NOMECC,            ');
    SQL.Add('            RD.NUMIMOVEL,PATRO.NOME AS NOMEPATRO,                              ');
    SQL.Add('            PLANO.NOME AS DESCPLANO,                                           ');
    SQL.Add('            PROGRAMA.DESCPROGRAMA                                              ');
    SQL.Add('          FROM PESSOA PATRO, DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM RD,       ');
    SQL.Add('            TIPORECEBDESEMB TDR, CENTCUST CC, UNIDNEGOCIO AP, CENTRESPON CR,   ');
    SQL.Add('            PLANPREVCONTABIL PLANO, PROGRAMA                                   ');
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
    SQL.Add('        ) Q2,                                                                  ');
    SQL.Add('        (SELECT D.NUMFATURA, sum(decode(d.recpag, ''P'', decode(l.debcre,      ');
    SQL.Add('                  ''C'', L.VALOR, l.valor*-1), decode(l.debcre, ''D'', L.VALOR,');
    SQL.Add('                  l.valor*-1))) as valor                                       ');
    SQL.Add('          FROM DOCUMENTO D, LANCTODOCUM L                                      ');
    SQL.Add('          WHERE (L.ESTORNO IS NULL) AND                                        ');
    SQL.Add('            (D.RECPAG= :RECPAG) AND                                            ');
    SQL.Add('            (D.IDPESSOA = :IDPESSOA) AND                                       ');
    SQL.Add('            (RTRIM(L.OPERACAO) IN (''1'',''11'')) AND                          ');
    SQL.Add('            (D.CODDOCUMENTO = L.CODDOCUMENTO) AND                              ');
    SQL.Add('            (D.OPERACAO = L.OPERACAO) AND                                      ');
    SQL.Add('            (D.NUMFATURA IS NOT NULL)                                          ');
    SQL.Add('          GROUP BY D.NUMFATURA                                                 ');
    SQL.Add('        ) Q3                                                                   ');
    SQL.Add('      WHERE                                                                    ');
    SQL.Add('        (Q1.NUMFATURA = Q2.NUMFATURA) AND                                      ');
    SQL.Add('        (Q3.NUMFATURA = Q2.NUMFATURA)                                          ');
    SQL.Add('      GROUP BY                                                                 ');
    SQL.Add('        Q1.NUMFATURA, Q1.CODDOCUMENTO, Q1.NUMAPGR, Q1.REFERENCIA,              ');
    SQL.Add('        Q1.NODOCUMENTO, Q1.COMPLDOCUMENTO, Q1.DATAVENCTO, Q1.DATAEMISSAO,      ');
    SQL.Add('        Q1.DATAPROGRAMADA, Q1.NUMDOCUMENTO, Q1.VALOR, Q1.VALOROUTRAMOEDA,      ');
    SQL.Add('        Q1.RAZAOSOCIAL, Q1.DESCRICAO, Q2.DESCTDR, Q2.NOMEAP, Q2.NOMECR,        ');
    SQL.Add('        Q2.NOMECC, Q1.OBS, Q1.FLGDOCBANCARIO, Q1.TRGUSERINCLUSAO,              ');
    SQL.Add('        Q1.TRGDTINCLUSAO, Q2.NUMIMOVEL, Q2.NOMEPATRO, Q2.DESCPLANO,            ');
    SQL.Add('        Q2.DESCPROGRAMA,Q1.IDFORCLI)                                           ');
    sql.Add(' ORDER BY CODDOCUMENTO                                                         ');
    Prepare;
    Parambyname('RECPAG').AsString := ParamIntegra.RecPag;
    Parambyname('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
    Parambyname('IDUSUARIO').AsFloat := CrmRptCM.IdUsuario;
    Open;
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

Procedure TRptAutPag.montaregistro;
Var
  rSaldo: real;
  iNumApGr: Integer;
  Doc: String;
Begin
  CdsAutPagDoc.Edit;
  Doc := CdsAutPagDoc.FieldByName('CODDOCUMENTO').AsString;
  If OldDoc <> CdsAutPagDoc.FieldByName('CODDOCUMENTO').AsString Then
  Begin
    OldDoc := CdsAutPagDoc.FieldByName('CODDOCUMENTO').AsString;
    If CdsAutPagDoc.FieldByName('NUMAPGR').IsNull Then
    Begin
      If Not CtrlRelatoriosCAPCAR.SetSEQAPGR(StrToInt(OldDoc), CdsAutPagDoc.FieldByName('NUMFATURA').AsString, iNumApGr) Then
        Abort;
      CdsAutPagDoc.FieldByName('NUMAPGR').AsInteger := iNumApGr;
    End
    Else
      doc := CdsAutPagDoc.FieldByName('CodDocumento').AsString;

    CdsAutPagDocAlt.Close;
    CdsAlteraParcOrigem.Close;
    Documento.Saldo.CalculaSaldo(StrToInt(Doc));
    rSaldo := Documento.Saldo.Valor;

    If Not CdsAutPagDoc.FieldByName('NUMFATURA').IsNull Then
    Begin
      SqlAlteraParcOrigem.Prepare;
      SqlAlteraParcOrigem.Params[0].AsFloat := StrToInt(Doc);
      SqlAlteraParcOrigem.Params[1].AsFloat := CdsAutPagDoc.FieldByName('NUMFATURA').AsFloat;
      SqlAlteraParcOrigem.Open;
      CdsAutPagDoc.FieldByName('valor').AsFloat := (CdsAutPagDoc.FieldByName('valor').AsFloat +
        CdsAlteraParcOrigem.FieldByName('valdecr').AsFloat + CdsAlteraParcOrigem.FieldByName('valimp').AsFloat -
        CdsAlteraParcOrigem.FieldByName('valacre').AsFloat);
      CdsAutPagDoc.FieldByName('VLDEC').AsFloat := CdsAlteraParcOrigem.FieldByName('valdecr').AsFloat;
      CdsAutPagDoc.FieldByName('VLACRE').AsFloat := CdsAlteraParcOrigem.FieldByName('valacre').AsFloat;
      CdsAutPagDoc.FieldByName('VLIMP').AsFloat := CdsAlteraParcOrigem.FieldByName('valimp').AsFloat;
      CdsAutPagDoc.FieldByName('VLLIQ').AsFloat := rSaldo;
    End;
    SqlAutPagDocAlt.Prepare;
    SqlAutPagDocAlt.Params[0].AsFloat := StrToInt(Doc);
    SqlAutPagDocAlt.Open;
    If CdsAutPagDoc.FieldByName('NumFatura').IsNull Then
    Begin
      CdsAutPagDoc.FieldByName('Valor').AsFloat := (CdsAutPagDoc.fieldbyname('Valor').AsFloat);
      CdsAutPagDoc.FieldByName('VLLIQ').AsFloat := rSaldo;
    End;
    CdsAutPagDoc.FieldByName('VLDEC').AsFloat := CdsAutPagDoc.FieldByName('VLDEC').AsFloat +
      CdsAutPagDocAlt.FieldByName('valdecr').AsFloat;
    CdsAutPagDoc.FieldByName('VLACRE').AsFloat := CdsAutPagDoc.FieldByName('VLACRE').AsFloat +
      CdsAutPagDocAlt.FieldByName('valacre').AsFloat;
    CdsAutPagDoc.FieldByName('VLIMP').AsFloat := CdsAutPagDoc.FieldByName('VLIMP').AsFloat +
      CdsAutPagDocAlt.FieldByName('valimp').AsFloat;
    If strtofloat(Format('%17.2f', [CdsAutPagDoc.FieldByName('VLLIQ').AsFloat])) = 0 Then
    Begin
      CdsAutPagDoc.FieldByName('VLLIQ').AsFloat := CdsAutPagDoc.FieldByName('valor').AsFloat + CdsAutPagDoc.FieldByName('VLACRE').AsFloat
        - CdsAutPagDoc.FieldByName('VLDEC').AsFloat - CdsAutPagDoc.FieldByName('VLIMP').AsFloat;
    End;
    rVLDEC := CdsAutPagDoc.FieldByName('VLDEC').AsFloat;
    rVLACRE := CdsAutPagDoc.FieldByName('VLACRE').AsFloat;
    rVLIMP := CdsAutPagDoc.FieldByName('VLIMP').AsFloat;
    rVLLIQ := CdsAutPagDoc.FieldByName('VLLIQ').AsFloat;
  End
  Else
  Begin
    CdsAutPagDoc.FieldByName('VLDEC').AsFloat := rVLDEC;
    CdsAutPagDoc.FieldByName('VLACRE').AsFloat := rVLACRE;
    CdsAutPagDoc.FieldByName('VLIMP').AsFloat := rVLIMP;
    CdsAutPagDoc.FieldByName('VLLIQ').AsFloat := rVLLIQ;
  End;
  GravaBancoAg;
  CdsAutPagDoc.post;
End;

Procedure TRptAutPag.FormCreate(Sender: TObject);
Begin
  Inherited;
  CtrlRelatoriosCAPCAR := TCtrlRelatoriosCAPCAR.Create;
  CtrlRelatoriosCAPCAR.Initialize(DtmBaseDados.dbBaseDados, true, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer,
    True);
  Documento := TCtrlDocumento.Create;
  Documento.Initialize(DtmBaseDados.dbBaseDados, true, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer,
    True);
End;

Procedure TRptAutPag.BuscaContaDoc(CodDocumento: Real);
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

Procedure TRptAutPag.GravaBancoAg;
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


Procedure TRptAutPag.ppDBText92Format(Sender: TObject;
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

End.

