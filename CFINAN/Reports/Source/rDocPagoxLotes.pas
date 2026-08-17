Unit rDocPagoxLotes;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppBands, ppClass, ppCtrls, ppVar, ppPrnabl, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc,
  DBTables, Wwquery, uCmRptManager, TXComp, CmParamReport, DBClient,
  uCMClientDataSet, uCmSqlParams;

Type
  TRptDocPagoxLotes = Class(TFrmCmReport)
    DsDocPagos: TwwDataSource;
    PpDocPagos: TppBDEPipeline;
    RptDocPagos: TppReport;
    ppHeaderBand21: TppHeaderBand;
    LblDocsPagReceb: TppLabel;
    ppLine40: TppLine;
    ppLabel65: TppLabel;
    ppDetailBand22: TppDetailBand;
    ppDBText27: TppDBText;
    ppDBText13: TppDBText;
    ppDBText21: TppDBText;
    RptDocPagosDBText1: TppDBText;
    RptDocPagosDBText2: TppDBText;
    ppFooterBand21: TppFooterBand;
    ppLine41: TppLine;
    ppLabel66: TppLabel;
    ppCalc37: TppSystemVariable;
    ppCalc38: TppSystemVariable;
    ppSummaryBand4: TppSummaryBand;
    ppLabel77: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppLabel82: TppLabel;
    ppDBText28: TppDBText;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppLabel90: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppLine42: TppLine;
    RptDocPagosGroup1: TppGroup;
    RptDocPagosGroupHeaderBand1: TppGroupHeaderBand;
    ppLabel84: TppLabel;
    ppDBText16: TppDBText;
    LblClientes: TppLabel;
    RptDocPagosLabel1: TppLabel;
    RptDocPagosLabel2: TppLabel;
    ppLabel88: TppLabel;
    ppLabel85: TppLabel;
    RptDocPagosGroupFooterBand1: TppGroupFooterBand;
    RptDocPagosLabel3: TppLabel;
    RptDocPagosDBCalc1: TppDBCalc;
    SqlDocPagos: TCMSqlParams;
    CdsDocPagos: TCMClientDataSet;
    Procedure CrmRptCMBeforePrint(Sender: TObject);
    Procedure CmpRptCMBeforeExecute(Var CanExecute: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  End;

Var
  RptDocPagoxLotes: TRptDocPagoxLotes;

Implementation

{$R *.DFM}

Procedure TRptDocPagoxLotes.CrmRptCMBeforePrint(Sender: TObject);
Var
  sSql: String;
Begin
  Inherited;
  sSql := 'SELECT /*+ RULE */ DISTINCT' +
    ' L.DATALANCTO, LP.NUMCHQBORDERO, LP.NUMLOTE, P.RAZAOSOCIAL, D.NODOCUMENTO, D.COMPLDOCUMENTO, H.HISTORICOCOMPL, ' +
    ' DECODE(L.DEBCRE,''D'',DECODE(D.RECPAG,''P'',L.VALOR,L.VALOR * -1),DECODE(D.RECPAG,''R'',L.VALOR,L.VALOR * -1)) AS VALOR ' +
    'FROM ' +
    '(select count(*) as totdocum , numlote from lanctodocum l,lotexdocum ld , documento d where ' +
    '        D.RECPAG         = ''P''  AND ' + ' D.IDPESSOA = ' + FloatToStr(CrmRptCm.IdEmpresa) + ' and ' +
    '(L.DATALANCTO Between to_date(''' + CmpRptCM.ParamValues[0].AsString + ''',''dd/MM/yyyy'')  and to_date(''' + CmpRptCM.ParamValues[1].AsString + ''',''dd/MM/yyyy'')) AND ' +
    ' l.operacao in (''5'',''15'',''10'') and l.coddocumento=d.coddocumento and ' +
    '         ld.CODDOCUMENTO = D.CODDOCUMENTO group by numlote  ) totdocum ' +
    ',(select count(*) as totdocum , numlote from lanctodocum l,lotexdocum ld , documento d where ' +
    '        D.RECPAG         = ''P''  AND   D.IDPESSOA = ' + FloatToStr(CrmRptCm.IdEmpresa) + ' and ' +
    '         ld.CODDOCUMENTO = D.CODDOCUMENTO  and ' +
    '(L.DATALANCTO Between to_date(''' + CmpRptCM.ParamValues[0].AsString + ''',''dd/MM/yyyy'')  and to_date(''' + CmpRptCM.ParamValues[1].AsString + ''',''dd/MM/yyyy'')) AND ' +
    ' l.operacao in (''5'',''15'',''10'') and l.coddocumento=d.coddocumento and ' +
    '         d.codtipdoc in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =  ''P''' +
    ' and not exists  (select 1 from UsuarioxTpdocto b where recpag=''P'' and b.idusuario=' + FloatToStr(CrmRptCm.IdUsuario) +
    '             ) union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''P''' +
    '  and exists (select 1 from UsuarioxTpdocto b where recpag=''P'' and a.codtipdoc=b.codtipdoc and b.idusuario=' + FloatToStr(CrmRptCm.IdUsuario) +
    ')) group by numlote  ) totlote ,' +
    '   LANCTODOCUM L,LOTEPAGTO LP, LOTEXDOCUM LX,  RECBTOPAGTO R, DOCUMENTO D, PESSOA P,' +
    '(SELECT D.CODDOCUMENTO, L.HISTORICOCOMPL FROM LANCTODOCUM L, DOCUMENTO D WHERE ' +
    ' (L.OPERACAO IN (''1'',''2'',''3'',''15'')) AND (D.IDPESSOA = ' + FloatToStr(CrmRptCm.IdEmpresa) + ') AND ' +
    ' (D.RECPAG = ''P'' ) AND (L.CODDOCUMENTO = D.CODDOCUMENTO)) H ' +
    'WHERE ' +
    '(D.IDPESSOA = ' + FloatToStr(CrmRptCm.IdEmpresa) + ' ) AND (LP.NUMCHQBORDERO IS NOT NULL) AND ' +
    '(L.DATALANCTO Between to_date(''' + CmpRptCM.ParamValues[0].AsString + ''',''dd/MM/yyyy'')  and to_date(''' + CmpRptCM.ParamValues[1].AsString + ''',''dd/MM/yyyy'')) AND ' +
    '(LP.FLAGCANCEL = ''B'') AND (D.RECPAG = ''P'') AND ' +
    '(L.ESTORNO IS NULL) AND ' +
    '(D.CODDOCUMENTO = H.CODDOCUMENTO ) AND ' +
    '(LX.CODDOCUMENTO = D.CODDOCUMENTO) AND (LX.NUMLOTE = LP.NUMLOTE) AND ' +
    '(D.CODDOCUMENTO = L.CODDOCUMENTO) AND (D.IDFORCLI = P.IDPESSOA) AND ' +
    '(R.NUMLANCTO = L.NUMLANCTO) AND (R.CODDOCUMENTO = D.CODDOCUMENTO) ' +
    ' and  totlote.totdocum=totdocum.totdocum and ' +
    ' totlote.numlote=totdocum.numlote and   totlote.numlote=  lp.NUMLOTE    ' +
    'ORDER BY L.DATALANCTO, LP.NUMCHQBORDERO, P.RAZAOSOCIAL';

  SqlDocPagos.sql.text := sSql;
  SqlDocPagos.open;
End;

Procedure TRptDocPagoxLotes.CmpRptCMBeforeExecute(Var CanExecute: Boolean);
Begin
  Inherited;
  CmpRptCM.ParamValues[0].TextDefault := DateToStr(date);
  CmpRptCM.ParamValues[1].TextDefault := DateToStr(date);
End;

End.

