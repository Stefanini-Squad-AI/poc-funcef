// Alterações:

{ --------------------------------------------------------------------------------------------------
Rotina    : - ( SqlApGr3 )
Data      : 30/04/2004
Autor     : André Tavares
pendência : 16330
Descrição : criação do campo FLGIMPRIMEAP na tabela tipodocrecpag e utilização do mesmo na query
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : - ( SqlApGr3 )
Data      : 16/06/2003
Autor     : André Pontes
Descrição : Inclusão de mais 1 sub-query para trazer o nome do usuário que lançou o documento
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : - ( SqlApGr3 )
Data      : 16/06/2003
Autor     : André Pontes
Descrição : Inclusão dos campos planilha / data planilha (pendência 8531)
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : - ( SqlApGr3 )
Data      : 13/06/2003
Autor     : André Pontes
Descrição : Inclusão dos campos banco, agëncia e conta bancária na query (pendência 6671)
---------------------------------------------------------------------------------------------------}

unit RApGr3;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCmReport, ppBands, ppReport, ppSubRpt, ppRegion, ppClass, ppVar,
   ppCtrls, ppStrtch, ppMemo, ppPrnabl, ppCache, ppProd, ppDB, ppComm,
   ppRelatv, ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBTables, uCmRptManager, TXComp,
   CmParamReport, DBClient, uCMClientDataSet, uCmSqlParams, uCtrlRelatoriosCAPCAR,
   uCtrlDocumento, uCtrlParamIntegra, ppModule, uCtrlPadroes, TXRB;

type
   TRptApGr3 = class(TFrmCmReport)
      dsApGr3: TwwDataSource;
      dsChildRateio: TwwDataSource;
      ppApGr3: TppBDEPipeline;
      ppChildRateio: TppBDEPipeline;
      rptApgr3: TppReport;
      ppHeaderBand11: TppHeaderBand;
      ppLabel150: TppLabel;
      ppLabel151: TppLabel;
      ppLine65: TppLine;
      ppDBText22: TppDBText;
      DetalheM: TppDetailBand;
      ppDBText24: TppDBText;
      ppDBText95: TppDBText;
      ppDBText107: TppDBText;
      ppDBMemo4: TppDBMemo;
      ppDBText108: TppDBText;
      ppFooterBand28: TppFooterBand;
      ppShape7: TppShape;
      ppLine66: TppLine;
      ppLabel152: TppLabel;
      ppShape8: TppShape;
      ppShape9: TppShape;
      ppLabel153: TppLabel;
      ppLabel154: TppLabel;
      ppLabel155: TppLabel;
      ppLabel156: TppLabel;
      ppShape10: TppShape;
      ppLabel157: TppLabel;
      ppShape11: TppShape;
      ppLabel158: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppLabel160: TppLabel;
      ppLabel161: TppLabel;
      ppLabel162: TppLabel;
      ppLabel163: TppLabel;
      ppLabel164: TppLabel;
      pplblEmitente: TppLabel;
      ppSummaryBand9: TppSummaryBand;
      ppLabel159: TppLabel;
      ppDBText109: TppDBText;
      ppGroup17: TppGroup;
      ppGroupHeaderBand17: TppGroupHeaderBand;
      ppShape12: TppShape;
      ppDBText110: TppDBText;
      ppDBText111: TppDBText;
      ppLabel168: TppLabel;
      ppLabel170: TppLabel;
      ppRegion6: TppRegion;
      ppDBMemo7: TppDBMemo;
      ppSubReport6: TppSubReport;
      ppchRateio: TppChildReport;
      ppDetailBand33: TppDetailBand;
      ppDBText114: TppDBText;
      ppDBText115: TppDBText;
      ppLabel167: TppLabel;
      ppLabel176: TppLabel;
      ppLabel175: TppLabel;
      ppDBText116: TppDBText;
      ppLabel173: TppLabel;
      ppDBText117: TppDBText;
      ppLabel177: TppLabel;
      ppDBText118: TppDBText;
      ppDBText119: TppDBText;
      ppLabel178: TppLabel;
      ppRegion7: TppRegion;
      ppLabel165: TppLabel;
      ppLabel166: TppLabel;
      ppLabel171: TppLabel;
      ppLabel172: TppLabel;
      ppLabel169: TppLabel;
      ppDBText113: TppDBText;
      ppLabel50: TppLabel;
      ppLine71: TppLine;
      ppGroupFooterBand17: TppGroupFooterBand;
      SqlApGr3: TCMSqlParams;
      CdsApGr3: TCMClientDataSet;
      SqlChildRateio: TCMSqlParams;
      CdsChildRateio: TCMClientDataSet;
      SqlAlteraParcOrigem: TCMSqlParams;
      CdsAlteraParcOrigem: TCMClientDataSet;
      SqlAutPagDocAlt: TCMSqlParams;
      CdsAutPagDocAlt: TCMClientDataSet;
      sqlChildAlterador: TCMSqlParams;
      cdsChildAlterador: TCMClientDataSet;
      ppChildAlterador: TppBDEPipeline;
      dsChildAlterador: TwwDataSource;
      ppSummaryBand2: TppSummaryBand;
      ppSubReport3: TppSubReport;
      ppChildReport3: TppChildReport;
      ppDetailBand2: TppDetailBand;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppLabel1: TppLabel;
    ppDBText1: TppDBText;

      procedure rptApgr3BeforePrint(Sender: TObject);
      procedure rptApgr3PrintingComplete(Sender: TObject);
      procedure DetalheMBeforePrint(Sender: TObject);
      procedure CrmRptCMBeforePrint(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);


   private  // Private declarations

      iNumDetalhe : Integer;
      Doc, OldDoc : String;

      CtrlRelatoriosCAPCAR : TCtrlRelatoriosCAPCAR;
      Documento            : TCtrlDocumento;

      procedure montaregistro;

   public   // Public declarations

   end;



var
  RptApGr3: TRptApGr3;



implementation
{$R *.DFM}
uses
   uString, uSistema;




procedure TRptApGr3.rptApgr3BeforePrint(Sender: TObject);
begin
   inherited;
   iNumDetalhe := 0;
end;



procedure TRptApGr3.rptApgr3PrintingComplete(Sender: TObject);
begin
   inherited;
   iNumDetalhe := 0;
end;



procedure TRptApGr3.DetalheMBeforePrint(Sender: TObject);
begin
   inherited;
   Inc(iNumDetalhe);
end;



procedure TRptApGr3.CrmRptCMBeforePrint(Sender: TObject);
var
   RadioGroup1itemindex: Integer;
begin
   inherited;

   doc                         := CmpRptCM.ParamValues[0].AsString;
   RadioGroup1itemindex        := StrToIntDef(CmpRptCM.ParamValues[4].AsString, 0);
   detalheM.Visible            := CmpRptCM.ParamValues[1].AsBoolean;

   with SqlApGr3 do
   begin
      SQL.Clear;
      SQL.Add('  SELECT  LT.OPERACAO, LT.NUMFATURA, LT.CODDOCUMENTO, LT.NUMAPGR,           ');
      SQL.Add('        LT.REFERENCIA, LT.NODOCUMENTO, LT.COMPLDOCUMENTO, LT.DATAVENCTO,    ');
      SQL.Add('        LT.DATAEMISSAO, LT.DATAPROGRAMADA, LT.NUMDOCUMENTO, LT.VALOR,       ');
      SQL.Add('        LT.VALOROUTRAMOEDA, LT.RAZAOSOCIAL, LT.DESCRICAO, LT.PLAREDUZ,      ');
      SQL.Add('     LT.PLACONTA, LT.VALORCONTAB, LT.LACDEBCRE, LT.HISTORICO, LT.OBS,       ');
      SQL.Add('     LT.FLGDOCBANCARIO, LT.VLACRE, LT.VLDEC, LT.VLIMP, LT.VLLIQ,            ');
      SQL.Add('     LT.TRGUSERINCLUSAO, LT.TRGDTINCLUSAO, LT.IDFORCLI, LT.TIPODOC,         ');
      SQL.Add('     USU.IDUSUARIO, USU.NOMEUSUARIO,                                        ');
      SQL.Add('     '' '' AS DESCESTORNO,                                                  ');
      SQL.Add('     PLN.PLNDATDIA, PLN.PLNCODIGO, PLN.PLNPLANIL,                           ');
      SQL.Add('     CBA.CONTACORRENTE, CBA.NUMAGENCIA, CBA.NUMBANCO,                       ');
      SQL.Add('     SALDO.VALSALDO                                                         ');
      SQL.Add('   FROM                                                                     ');
      SQL.Add('   (                                                                        ');
      SQL.Add('   SELECT                                                                   ');
      SQL.Add('      D.CODDOCUMENTO,                                                       ');
      SQL.Add('      U.IDUSUARIO, U.NOMEUSUARIO                                            ');
      SQL.Add('   FROM                                                                     ');
      SQL.Add('      DOCUMENTO      D,                                                     ');
      SQL.Add('      USUARIOSISTEMA U                                                      ');
      SQL.Add('   WHERE                                                                    ');
      SQL.Add('      D.IDUSUARIOINCLUSAO = U.IDUSUARIO(+)                                  ');
      SQL.Add('   ) USU,                                                                   ');
      SQL.Add('   (                                                                        ');
      SQL.Add('   SELECT                                                                   ');
      SQL.Add('      L.CODDOCUMENTO,                                                       ');
      SQL.Add('      P.PLNPLANIL, P.PLNCODIGO, P.PLNDATDIA                                 ');
      SQL.Add('   FROM                                                                     ');
      SQL.Add('      LANCTODOCUM L,                                                        ');
      SQL.Add('      PLANILHA    P                                                         ');
      SQL.Add('   WHERE                                                                    ');
      SQL.Add('          RTRIM(LTRIM(L.OPERACAO)) = ''2''                                  ');
      SQL.Add('      AND L.ESTORNO   IS NULL                                               ');
      SQL.Add('      AND L.PLNCODIGO = P.PLNCODIGO(+)                                      ');
      SQL.Add('   ) PLN,                                                                   ');
      SQL.Add('      (                                                                     ');
      SQL.Add('      SELECT                                                                ');
      SQL.Add('         CBA.IDPESSOA,                                                      ');
      SQL.Add('         CBA.IDCBANCARIA,                                                   ');
      SQL.Add('         CBA.CONTACORRENTE,                                                 ');
      SQL.Add('         CBA.IDAGENCIA,                                                     ');
      SQL.Add('         AGE.IDBANCO,                                                       ');
      SQL.Add('         AGE.NUMAGENCIA,                                                    ');
      SQL.Add('         BAN.NUMBANCO                                                       ');
      SQL.Add('      FROM                                                                  ');
      SQL.Add('         CONTABANCARIA   CBA,                                               ');
      SQL.Add('         AGENCIABANCARIA AGE,                                               ');
      SQL.Add('         BANCO           BAN                                                ');
      SQL.Add('      WHERE                                                                 ');
      SQL.Add('             CBA.FLGCONTAPREF = 1                                           ');
      SQL.Add('         AND CBA.IDAGENCIA    = AGE.IDPESSOA                                ');
      SQL.Add('         AND AGE.IDBANCO      = BAN.IDPESSOA                                ');
      SQL.Add('      ) CBA,                                                                ');
      SQL.Add(' (SELECT                                                                    ');
      SQL.Add('    SUM(DECODE(DEBCRE,''C'',VALOR,VALOR * -1)) AS VALSALDO, CODDOCUMENTO    ');
      SQL.Add('  FROM                                                                      ');
      SQL.Add('   LANCTODOCUM                                                              ');
      SQL.Add('  GROUP BY CODDOCUMENTO) SALDO,                                             ');
      SQL.Add(' (                                                                          ');
      SQL.Add('   SELECT                                                                   ');
      SQL.Add('     L.OPERACAO,                                                            ');
      SQL.Add('     D.NUMFATURA,                                                           ');
      SQL.Add('     D.CODDOCUMENTO,                                                        ');
      SQL.Add('     D.NUMAPGR,                                                             ');
      SQL.Add('     D.REFERENCIA,                                                          ');
      SQL.Add('     D.NODOCUMENTO,                                                         ');
      SQL.Add('     D.COMPLDOCUMENTO,                                                      ');
      SQL.Add('     D.DATAVENCTO,                                                          ');
      SQL.Add('     D.DATAEMISSAO,                                                         ');
      SQL.Add('     D.DATAPROGRAMADA,                                                      ');
      SQL.Add('     P.NUMDOCUMENTO,                                                        ');
      SQL.Add('     L.VALOR,                                                               ');
      SQL.Add('     L.VALOROUTRAMOEDA,                                                     ');
      SQL.Add('     P.RAZAOSOCIAL,                                                         ');
      SQL.Add('     F.DESCRICAO,                                                           ');
      SQL.Add('     PNC.PLAREDUZ,                                                          ');
      SQL.Add('     LT.PLACONTA,                                                           ');
      SQL.Add('     LT.LACVALOR AS VALORCONTAB,                                            ');
      SQL.Add('     LT.LACDEBCRE,                                                          ');
      SQL.Add('     (LT.LACHIST1 || '' '' || LT.LACHIST2 || '' '' ||                       ');
      SQL.Add('      LT.LACHIST3 || '' '' || LT.LACHIST4 || '' '' ||                       ');
      SQL.Add('      LT.LACHIST5) AS HISTORICO,                                            ');
      SQL.Add('     D.OBS,                                                                 ');
      SQL.Add('     F.FLGDADOSBANCARIOS AS FLGDOCBANCARIO,                                 ');
      SQL.Add('     (0) AS VLACRE,                                                         ');
      SQL.Add('     (0) AS VLDEC,                                                          ');
      SQL.Add('     (0) AS VLIMP,                                                          ');
      SQL.Add('     (0) AS VLLIQ,                                                          ');
      SQL.Add('     D.TRGUSERINCLUSAO,                                                     ');
      SQL.Add('     D.TRGDTINCLUSAO,                                                       ');
      SQL.Add('     D.IDFORCLI,                                                            ');
      SQL.Add('     TD.DESCRICAO AS TIPODOC                                                ');
      SQL.Add('   FROM                                                                     ');
      SQL.Add('     PESSOA P,                                                              ');
      SQL.Add('     DOCUMENTO D,                                                           ');
      SQL.Add('     LANCTODOCUM L,                                                         ');
      SQL.Add('     FORMARECPAG F,                                                         ');
      SQL.Add('     TIPODOCRECPAG TD,                                                      ');
      SQL.Add('     PORTADORFORMA PF,                                                      ');
      SQL.Add('     LANCAMENTO LT,                                                         ');
    //Marcus Oliveira Inicio P. 23593 14/12/2006
      SQL.Add('     RATEIODOCUM RD,                                                        ');
      SQL.Add('     PLANOCONTA PNC                                                         ');
      SQL.Add('   WHERE                                                                    ');

    //Marcus Oliveira Inicio P. 23593 14/12/2006
      If (trim(CmpRptCM.ParamValues[2].AsString) <> '') then
         SQL.Add('rtrim(RD.CODCENTRORESPON) = ' + QuotedStr(CmpRptCM.ParamValues[2].AsString) + ' AND ');

    If (trim(CmpRptCM.ParamValues[2].AsString) <> '') Or (trim(CmpRptCM.ParamValues[3].AsString) <> '') Then

    Begin
      Case RadioGroup1itemindex Of
        0: SQL.Add('(D.NUMAPGR IS NOT NULL) AND ');
        1: SQL.Add('(D.NUMAPGR IS  NULL) AND ');
      End;

      If (trim(CmpRptCM.ParamValues[3].AsString) <> '') Then
        SQL.Add('   (D.DATAEMISSAO = TO_DATE(' + QuotedStr(CmpRptCM.ParamValues[3].AsString) + ',''DD/MM/YYYY''))  AND ');
    End
    Else
    if (CmpRptCM.ParamValues[0].AsString <> '') then
      SQL.Add('D.CODDOCUMENTO = ' + doc + '  AND ');

      SQL.Add('     (L.PLNCODIGO = LT.PLNCODIGO(+)) AND                                    ');
      SQL.Add('     (PNC.PLANO(+) = LT.PLANO) AND                                          ');
      SQL.Add('     (PNC.PLACONTA(+) = LT.PLACONTA) AND                                    ');
      SQL.Add('     (L.ESTORNO IS NULL) AND                                                ');
      SQL.Add('     (D.RECPAG = :RECPAG) AND                                               ');
      SQL.Add('     (D.IDPESSOA = :IDPESSOA) AND                                           ');
      SQL.Add('     (D.CODDOCUMENTO = L.CODDOCUMENTO) AND                                  ');
      SQL.Add('     (P.IDPESSOA = D.IDFORCLI) AND                                          ');
      SQL.Add('     (D.CODFORMA = F.CODFORMA(+)) AND                                       ');
      SQL.Add('     (TD.CODTIPDOC = D.CODTIPDOC)         AND                               ');
      SQL.Add('     (PF.CODPORTFORMA(+) = D.CODPORTFORMA) AND                              ');
      //Marcus Oliveira Inicio P. 23593 14/12/2006
      SQL.Add('     (RD.CODDOCUMENTO = D.CODDOCUMENTO)                                     ');
      SQL.Add('   UNION                                                                    ');
      SQL.Add('     SELECT                                                                 ');
      SQL.Add('       Q1.OPERACAO, Q1.NUMFATURA, Q1.CODDOCUMENTO, Q1.NUMAPGR,              ');
      SQL.Add('       Q1.REFERENCIA, Q1.NODOCUMENTO, Q1.COMPLDOCUMENTO,                    ');
      SQL.Add('       Q1.DATAVENCTO, Q1.DATAEMISSAO, Q1.DATAPROGRAMADA,                    ');
      SQL.Add('       Q1.NUMDOCUMENTO, Q1.VALOR, Q1.VALOROUTRAMOEDA,                       ');
      SQL.Add('       Q1.RAZAOSOCIAL, Q1.DESCRICAO, Q2.PLAREDUZ,                           ');
      SQL.Add('       Q2.PLACONTA,                                                         ');
      SQL.Add('       SUM(((Q1.VALOR * Q2.VALOR)/ Q3.VALOR)) AS VALORCONTAB,               ');
      SQL.Add('       Q2.LACDEBCRE, Q2.HISTORICO, Q1.OBS,                                  ');
      SQL.Add('       Q1.FLGDOCBANCARIO,                                                   ');
      SQL.Add('       (0) AS VLACRE,                                                       ');
      SQL.Add('       (0) AS VLDEC,                                                        ');
      SQL.Add('       (0) AS VLIMP,                                                        ');
      SQL.Add('       (0) AS VLLIQ,                                                        ');
      SQL.Add('       Q1.TRGUSERINCLUSAO, Q1.TRGDTINCLUSAO, Q1.IDFORCLI,                   ');
      SQL.Add('       Q1.DESCRICAO AS TIPODOC                                              ');
      SQL.Add('     FROM                                                                   ');
      SQL.Add('       (                                                                    ');
      SQL.Add('         SELECT                                                             ');
      SQL.Add('           LAN.OPERACAO, DOC.NUMFATURA, DOC.CODDOCUMENTO, DOC.NUMAPGR,      ');
      SQL.Add('           DOC.REFERENCIA, DOC.NODOCUMENTO,  DOC.COMPLDOCUMENTO,            ');
      SQL.Add('           DOC.DATAVENCTO, DOC.DATAEMISSAO, DOC.DATAPROGRAMADA,             ');
      SQL.Add('           P.NUMDOCUMENTO, LAN.VALOR, LAN.VALOROUTRAMOEDA, P.RAZAOSOCIAL,   ');
      SQL.Add('           F.DESCRICAO, DOC.OBS,                                            ');
      SQL.Add('           F.FLGDADOSBANCARIOS AS FLGDOCBANCARIO,                           ');
      SQL.Add('           (0) AS VLACRE,                                                   ');
      SQL.Add('           (0) AS VLDEC,                                                    ');
      SQL.Add('           (0) AS VLIMP,                                                    ');
      SQL.Add('           (0) AS VLLIQ,                                                    ');
      SQL.Add('           DOC.TRGUSERINCLUSAO, DOC.TRGDTINCLUSAO, DOC.IDFORCLI,            ');
      SQL.Add('           TD.DESCRICAO AS TIPODOC                                          ');
      SQL.Add('         FROM                                                               ');
      SQL.Add('           PESSOA P,                                                        ');
      SQL.Add('           DOCUMENTO DOC,                                                   ');
    //Marcus Oliveira Inicio P. 23593 14/12/2006
      SQL.Add('           RATEIODOCUM RD,                                                  ');

      SQL.Add('           LANCTODOCUM LAN,                                                 ');
      SQL.Add('           FORMARECPAG F,                                                   ');
      SQL.Add('           PORTADORFORMA PF,                                                ');
      SQL.Add('           TIPODOCRECPAG TD                                                 ');
      SQL.Add('         WHERE                                                              ');

    If (trim(CmpRptCM.ParamValues[2].AsString) <> '') Or (trim(CmpRptCM.ParamValues[3].AsString) <> '') Then

    Begin
        SQL.Add('rtrim(RD.CODCENTRORESPON) = ' + QuotedStr(CmpRptCM.ParamValues[2].AsString) + ' AND ');

     If (trim(CmpRptCM.ParamValues[3].AsString) <> '') Then
        SQL.Add('   (DOC.DATAEMISSAO = TO_DATE(' + QuotedStr(CmpRptCM.ParamValues[3].AsString) + ',''DD/MM/YYYY''))  AND ');

      Case RadioGroup1itemindex Of
        0: SQL.Add('(DOC.NUMAPGR IS NOT NULL) AND ');
        1: SQL.Add('(DOC.NUMAPGR IS NULL) AND ');
      End;
    End
    Else
      if (CmpRptCM.ParamValues[0].AsString <> '') then
      SQL.Add('DOC.CODDOCUMENTO = ' + DOC + ' AND ');

      SQL.Add('           (LAN.ESTORNO IS NULL) AND                                        ');
      SQL.Add('           (DOC.RECPAG = :RECPAG) AND                                       ');
      SQL.Add('           (DOC.IDPESSOA = :IDPESSOA) AND                                   ');
      SQL.Add('           (P.IDPESSOA = DOC.IDFORCLI) AND                                  ');
      SQL.Add('           (DOC.CODFORMA = F.CODFORMA(+)) AND                               ');
      SQL.Add('           (RTRIM(DOC.OPERACAO) IN (''3'',''13'')) AND                          ');
      SQL.Add('           (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO) AND                        ');
      SQL.Add('           (PF.CODPORTFORMA(+) = DOC.CODPORTFORMA)         AND              ');
      SQL.Add('           (TD.CODTIPDOC = DOC.CODTIPDOC)                                   ');
      SQL.Add('       ) Q1,                                                                ');
      SQL.Add('       (                                                                    ');
      SQL.Add('         SELECT                                                             ');
      SQL.Add('           D.NUMFATURA,                                                     ');
      SQL.Add('           PNC.PLAREDUZ,                                                    ');
      SQL.Add('           LT.PLACONTA,                                                     ');
      SQL.Add('           RD.CODCENTRORESPON,                                              ');
      SQL.Add('           LT.LACVALOR AS VALOR,                                            ');
      SQL.Add('           LT.LACDEBCRE,                                                    ');
      SQL.Add('           (LT.LACHIST1 || '' '' ||  LT.LACHIST2 || '' '' ||                ');
      SQL.Add('            LT.LACHIST3 || '' '' || LT.LACHIST4 || '' '' || LT.LACHIST5) AS HISTORICO  ');
      SQL.Add('         FROM                                                               ');
      SQL.Add('           DOCUMENTO D,                                                     ');

      SQL.Add('           LANCTODOCUM L,                                                   ');
    //Marcus Oliveira Inicio P. 23593 14/12/2006
      SQL.Add('           RATEIODOCUM RD,                                                  ');

      SQL.Add('           LANCAMENTO LT,                                                   ');
      SQL.Add('           PLANOCONTA PNC                                                   ');
      SQL.Add('         WHERE                                                              ');

    //Marcus Oliveira Inicio P. 23593 14/12/2006
      If (trim(CmpRptCM.ParamValues[2].AsString) <> '') then
         SQL.Add('rtrim(RD.CODCENTRORESPON) = ' + QuotedStr(CmpRptCM.ParamValues[2].AsString) + ' AND ' );

      SQL.Add('           (D.RECPAG = :RECPAG) AND                                         ');
      SQL.Add('           (D.IDPESSOA = :IDPESSOA) AND                                     ');
      SQL.Add('           (D.NUMFATURA IS NOT NULL) AND                                    ');
      SQL.Add('           (D.CODDOCUMENTO = L.CODDOCUMENTO) AND                            ');
      SQL.Add('           (L.PLNCODIGO = LT.PLNCODIGO(+)) AND                              ');
      SQL.Add('           (PNC.PLANO(+) = LT.PLANO) AND                                    ');
      SQL.Add('           (PNC.PLACONTA(+) = LT.PLACONTA) AND                              ');
      //Marcus Oliveira Inicio P. 23593 14/12/2006
      SQL.Add('           (RD.CODDOCUMENTO = D.CODDOCUMENTO)                               ');

      SQL.Add('       ) Q2,                                                                ');
      SQL.Add('       (                                                                    ');
      SQL.Add('         SELECT                                                             ');
      SQL.Add('           D.NUMFATURA,                                                     ');
      SQL.Add('           SUM(LT.LACVALOR) AS VALOR                                        ');
      SQL.Add('         FROM                                                               ');
      SQL.Add('           LANCTODOCUM L,                                                   ');
      SQL.Add('           DOCUMENTO D,                                                     ');
      SQL.Add('           LANCAMENTO LT                                                    ');
      SQL.Add('         WHERE                                                              ');
      SQL.Add('           (L.ESTORNO IS NULL) AND                                          ');
      SQL.Add('           (D.RECPAG= :RECPAG) AND                                          ');
      SQL.Add('           (D.IDPESSOA = :IDPESSOA) AND                                     ');
      SQL.Add('           (L.PLNCODIGO = LT.PLNCODIGO(+)) AND                              ');
      SQL.Add('           (RTRIM(D.OPERACAO) IN (''1'',''11'')) AND                        ');
      SQL.Add('           (D.CODDOCUMENTO = L.CODDOCUMENTO) AND                            ');
      SQL.Add('           (D.NUMFATURA IS NOT NULL)                                        ');
      SQL.Add('         GROUP BY                                                           ');
      SQL.Add('           D.NUMFATURA                                                      ');
      SQL.Add('       ) Q3                                                                 ');
      SQL.Add('     WHERE                                                                  ');
      SQL.Add('       (Q1.NUMFATURA = Q2.NUMFATURA) AND                                    ');
      SQL.Add('       (Q3.NUMFATURA = Q2.NUMFATURA)                                        ');
      SQL.Add('     GROUP BY                                                               ');
      SQL.Add('       Q1.OPERACAO, Q1.NUMFATURA, Q1.CODDOCUMENTO,                          ');
      SQL.Add('       Q1.NUMAPGR,                                                          ');
      SQL.Add('       Q1.REFERENCIA,                                                       ');
      SQL.Add('       Q1.NODOCUMENTO,                                                      ');
      SQL.Add('       Q1.COMPLDOCUMENTO,                                                   ');
      SQL.Add('       Q1.DATAVENCTO,                                                       ');
      SQL.Add('       Q1.DATAEMISSAO,                                                      ');
      SQL.Add('       Q1.DATAPROGRAMADA,                                                   ');
      SQL.Add('       Q1.NUMDOCUMENTO,                                                     ');
      SQL.Add('       Q1.VALOR,                                                            ');
      SQL.Add('       Q1.VALOROUTRAMOEDA,                                                  ');
      SQL.Add('       Q1.RAZAOSOCIAL,                                                      ');
      SQL.Add('       Q1.DESCRICAO,                                                        ');
      SQL.Add('                                                                            ');
      //Marcus Oliveira Inicio P. 23593 14/12/2006
      SQL.Add('       Q2.CODCENTRORESPON,                                                  ');
      SQL.Add('       Q2.PLAREDUZ,                                                         ');
      SQL.Add('       Q2.PLACONTA,                                                         ');
      SQL.Add('       Q2.LACDEBCRE,                                                        ');
      SQL.Add('       Q2.HISTORICO,                                                        ');
      SQL.Add('                                                                            ');
      SQL.Add('       Q1.OBS,                                                              ');
      SQL.Add('       Q1.FLGDOCBANCARIO,                                                   ');
      SQL.Add('       Q1.TRGUSERINCLUSAO,                                                  ');
      SQL.Add('       Q1.TRGDTINCLUSAO,                                                    ');
      SQL.Add('       Q1.IDFORCLI,                                                         ');
      SQL.Add('       Q1.DESCRICAO                                                         ');
      SQL.Add('   ) LT,                                                                    ');
      SQL.Add('( SELECT D.CODDOCUMENTO,  NVL(TP.FLGIMPRIMEAP, ''S'') AS FLGIMPRIMEAP       ');
      SQL.Add('  FROM TIPODOCRECPAG TP, DOCUMENTO D WHERE TP.CODTIPDOC = D.CODTIPDOC) TPD  ');
      SQL.Add('WHERE                                                                       ');
      SQL.Add('       (LT.IDFORCLI     = CBA.IDPESSOA(+))                                   ');
      SQL.Add('   AND (LT.CODDOCUMENTO = PLN.CODDOCUMENTO(+))                               ');
      SQL.Add('   AND (LT.CODDOCUMENTO = USU.CODDOCUMENTO(+))                               ');
      SQL.Add('   AND (LT.CODDOCUMENTO = TPD.CODDOCUMENTO)                                  ');
      SQL.Add('   AND (TPD.FLGIMPRIMEAP = ''S'')                                            ');

      // Rodolpho da Silva - P: 23593 - 26/10/2006
      SQL.Add('   AND LT.CODDOCUMENTO = SALDO.CODDOCUMENTO                                  ');

      Prepare;
      Parambyname('RECPAG').AsString  := ParamIntegra.RecPag;
      Parambyname('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      Open;

      OldDoc := '';
   end;


   while not(CdsApGr3.EOF) do
   begin
      MontaRegistro;
      CdsApGr3.Next;
   end;

   CdsApGr3.First;

   SqlChildRateio.Prepare;
   SqlChildRateio.ParamByName('codDocumento').AsFloat := CdsApGr3.FieldByName('CodDocumento').AsFloat;
   SqlChildRateio.Open;

   sqlChildAlterador.Prepare;
   sqlChildAlterador.ParamByName('codDocumento').AsFloat := CdsApGr3.FieldByName('CodDocumento').AsFloat;
   sqlChildAlterador.Open;

end;



procedure TRptApGr3.FormCreate(Sender: TObject);
begin
   inherited;

   CtrlRelatoriosCAPCAR := TCtrlRelatoriosCAPCAR.Create;
   CtrlRelatoriosCAPCAR.InitializeAs(Padroes);

   Documento            := TCtrlDocumento.Create;
   Documento.InitializeAs(Padroes);
end;



procedure TRptApGr3.montaregistro;
var
   rSaldo   : Double;
   iNumApGr : integer;
Begin
   CdsApGr3.Edit;
   Doc := CdsApGr3.FieldByName('CODDOCUMENTO').AsString;

   If OldDoc <> CdsApGr3.FieldByName('CODDOCUMENTO').AsString Then
   Begin
     OldDoc := CdsApGr3.FieldByName('CODDOCUMENTO').asString;
     If CdsApGr3.FieldByName('NUMAPGR').IsNull Then
     Begin
       If Not CtrlRelatoriosCAPCAR.SetSEQAPGR(StrToInt(OldDoc), CdsApGr3.FieldByName('NUMFATURA').AsString, iNumApGr) Then
         Abort;
       CdsApGr3.FieldByName('NUMAPGR').AsInteger := iNumApGr;
     End;
   End
   Else
     doc := CdsApGr3.FieldByName('coddocumento').asstring;

   CdsAlteraParcOrigem.Close;
   Documento.Saldo.CalculaSaldo(StrToInt(Doc));
   rSaldo := Documento.Saldo.Valor;
   If Not CdsApGr3.FieldByName('NUMFATURA').IsNull Then
   Begin
     SqlAlteraParcOrigem.Prepare;
     SqlAlteraParcOrigem.Params[0].AsFloat := StrToFloat(Doc);
     SqlAlteraParcOrigem.Params[1].AsFloat := CdsApGr3.FieldByName('NUMFATURA').asFloat;
     SqlAlteraParcOrigem.Open;
     CdsApGr3.FieldByName('valor').asFloat := (CdsApGr3.fieldbyname('valor').asfloat +
       CdsAlteraParcOrigem.fieldbyname('valdecr').asfloat + CdsAlteraParcOrigem.fieldbyname('valimp').asfloat -
       CdsAlteraParcOrigem.fieldbyname('valacre').asfloat);
     CdsApGr3.FieldByName('VLDEC').asFloat := CdsAlteraParcOrigem.fieldbyname('valdecr').asfloat;
     CdsApGr3.FieldByName('VLACRE').asFloat := CdsAlteraParcOrigem.fieldbyname('valacre').asfloat;
     CdsApGr3.FieldByName('VLIMP').asFloat := CdsAlteraParcOrigem.fieldbyname('valimp').asfloat;
     CdsApGr3.FieldByName('VLLIQ').asFloat := rSaldo;
   End;

   SqlAutPagDocAlt.Prepare;
   SqlAutPagDocAlt.Params[0].AsFloat := StrToFloat(doc);
   SqlAutPagDocAlt.open;

   If CdsApGr3.FIeldByName('numfatura').isnull Then
   Begin
     CdsApGr3.FIeldByName('valor').asfloat   := (CdsApGr3.fieldbyname('valor').asfloat);
     CdsApGr3.FIeldByName('VLLIQ').asfloat   := rSaldo;
   End;

   CdsApGr3.FIeldByName('VLDEC').asfloat     := CdsApGr3.FIeldByName('VLDEC').asfloat +
                                                CdsAutPagDocAlt.fieldbyname('valdecr').asfloat;
   CdsApGr3.FIeldByName('VLACRE').asfloat    := CdsApGr3.FIeldByName('VLACRE').asfloat +
                                                CdsAutPagDocAlt.fieldbyname('valacre').asfloat;
   CdsApGr3.FIeldByName('VLIMP').asfloat     := CdsApGr3.FIeldByName('VLIMP').asfloat +
                                                CdsAutPagDocAlt.fieldbyname('valimp').asfloat;

   if strtofloat(Format('%17.2f', [CdsApGr3.FIeldByName('VLLIQ').AsFloat])) = 0 then
   begin
     CdsApGr3.FIeldByName('VLLIQ').AsFloat   := CdsApGr3.FIeldByName('valor').Asfloat +
                                                CdsApGr3.FIeldByName('VLACRE').AsFloat -
                                                CdsApGr3.FIeldByName('VLDEC').AsFloat -
                                                CdsApGr3.FIeldByName('VLIMP').AsFloat;
   end;

   CdsApGr3.post;
end;



procedure TRptApGr3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   CtrlRelatoriosCAPCAR.Free;
   Documento.Free;
end;



end.
