unit ROrcamQuantPess;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppDB, uCmSqlParams, Db,
  DBClient, uCMClientDataSet, Wwdatsrc, ppDBPipe, ppDBBDE, ppBands,
  ppRegion, ppMemo, ppClass, ppReport, ppStrtch, ppSubRpt, ppCtrls, ppVar,
  ppPrnabl, ppCache, ppComm, ppRelatv, ppProd;

type
  TRptOrcamQuantPess = class(TFrmCmReport)
    rpOrcamQuantPess: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    rpTabCursosLbl1: TppLabel;
    rpTabCursosLbl2: TppLabel;
    rpTabCursosCalc1: TppSystemVariable;
    rpTabCursosCalc2: TppSystemVariable;
    ppLabel2: TppLabel;
    ppDBText24: TppDBText;
    ppLabel5: TppLabel;
    ppDBText36: TppDBText;
    ppLabel6: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel7: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText3: TppDBText;
    ppLine1: TppLine;
    ppDBTextTeor: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppOrcamQuantPess: TppBDEPipeline;
    dsOrcamQuantPess: TwwDataSource;
    CdsOrcamQuantPess: TCMClientDataSet;
    sqlOrcamQuantPess: TCMSqlParams;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText5: TppDBText;
    ppDBText12: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppLine2: TppLine;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel8: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppOrcamQuantPess2: TppBDEPipeline;
    dsOrcamQuantPess2: TwwDataSource;
    CdsOrcamQuantPess2: TCMClientDataSet;
    sqlOrcamQuantPess2: TCMSqlParams;
    sqlAux: TCMSqlParams;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sCusto, sEstab, sCargo, sAno: string;
    bEfet, bEspc, bTemp, bEstg, bTerc, bProp, bAuto, bAfst: boolean;
    IdEmpresa: integer;
  end;

var
  RptOrcamQuantPess: TRptOrcamQuantPess;

implementation

uses fAguarde, uCtrlFuncoesRH;

{$R *.DFM}

procedure TRptOrcamQuantPess.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with (sqlOrcamQuantPess.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT F.IDESTAB, F.IDCARGO, F.CODCENTROCUSTO,');
    Add('  DECODE(P.NOME,NULL,''TODOS'',P.NOME) AS ESTABELECIMENTO,');
    Add('  DECODE(CC.NOME,NULL,''TODOS'',CC.NOME) AS CENTROCUSTO,');
    Add('  DECODE(C.TITULO,NULL,''TODOS'',C.TITULO) AS CARGO,');
    Add('  ' +sAno + ' AS ANO');
    Add('FROM FUNCIONARIO F, PESSOA P, CENTCUST CC, CARGO C, SITFUNC S');
    Add('WHERE (F.IDEMPRESA = '+IntToStr(IdEmpresa)+')');
    if sCargo <> '' then
      Add('   AND   (F.IDCARGO  IN ('+sCargo+'))');
    if sEstab <> '' then
      Add('   AND   (F.IDESTAB  IN ('+sEstab+'))');
    if sCusto <> '' then
      Add('   AND   (F.CODCENTROCUSTO IN ('+sCusto+'))');
    Add('AND   (TO_CHAR(DATAADMISSAO,''YYYY'') <= '+QuotedStr(sAno)+')');
    Add('AND   (TIPOSIT   <> ''D'' OR TO_CHAR(DATADESLIGAMENTO,''YYYY'') > '+QuotedStr(sAno)+')');
    Add('AND   (F.IDSITFUNC = S.IDSITFUNC)');
    Add('AND   (F.IDESTAB = P.IDPESSOA)');
    Add('AND   (F.IDCARGO = C.IDCARGO)');
    Add('AND   (F.IDEMPRESA = CC.IDEMPRESA)');
    Add('AND   (F.CODCENTROCUSTO  = CC.CODCENTROCUSTO)');
    Add('GROUP BY  F.IDESTAB, F.IDCARGO, F.CODCENTROCUSTO, P.NOME, C.TITULO, CC.NOME');
    Add('UNION');
    Add('SELECT DISTINCT F.IDESTAB, F.IDCARGO, F.CODCENTROCUSTO,');
    Add('  DECODE(P.NOME,NULL,''TODOS'',P.NOME) AS ESTABELECIMENTO,');
    Add('  DECODE(CC.NOME,NULL,''TODOS'',CC.NOME) AS CENTROCUSTO,');
    Add('  DECODE(C.TITULO,NULL,''TODOS'',C.TITULO) AS CARGO,');
    Add('  ' +sAno + ' AS ANO');
    Add('FROM ORCAMPESSOAL F, PESSOA P, CENTCUST CC, CARGO C');
    Add('WHERE (F.IDEMPRESA = '+IntToStr(IdEmpresa)+')');
    Add('AND   (F.ANO = '+sAno+')');
    if sCargo <> '' then
      Add('   AND   (F.IDCARGO  IN ('+sCargo+'))');
    if sEstab <> '' then
      Add('   AND   (F.IDESTAB  IN ('+sEstab+'))');
    if sCusto <> '' then
      Add('   AND   (F.CODCENTROCUSTO IN ('+sCusto+'))');
    Add('AND   (F.IDESTAB = P.IDPESSOA(+))');
    Add('AND   (F.IDCARGO = C.IDCARGO(+))');
    Add('AND   (F.IDEMPRESA = CC.IDEMPRESA(+))');
    Add('AND   (F.CODCENTROCUSTO  = CC.CODCENTROCUSTO(+))');
    Add('GROUP BY  F.IDESTAB, F.IDCARGO, F.CODCENTROCUSTO, P.NOME, C.TITULO, CC.NOME');
    Add('ORDER BY 4, 5, 6');
    SaveToFile('c:\qry.txt');
  end;
  sqlAux.Open;
  sqlOrcamQuantPess.Open;
  frmAguarde.Apaga;
end;

procedure TRptOrcamQuantPess.ppDetailBand1BeforePrint(Sender: TObject);
var
  sSql, ListaSitFunc, ListaTipoContrato: string;
begin
  inherited;
  ListaSitFunc := ''; //FU.GerarListaSitFuncSel(true, bAfst, false);

  ListaTipoContrato := FU.GerarListaTipoContratoSel(bEfet, bEspc, bTemp,
                          bTerc, bProp, bAuto, bEstg);

  sSQL := '';

  if (ListaSitFunc <> '') then
    if (Pos(',', ListaSitFunc) > 0) then
      sSQL := sSQL + 'AND  (TIPOSIT       IN (' +FU.QuotedListaString(ListaSitFunc,',')+ '))'+CR_LF
    else
      sSQL := sSQL + 'AND  (TIPOSIT        = ' +FU.QuotedListaString(ListaSitFunc,',')+ ')'+CR_LF;

  if (Trim(ListaTipoContrato) <> '') then
    if (Pos(',',ListaTipoContrato) > 0) then
      sSQL := sSQL + 'AND  (TIPOCONTRATO   IN (' +FU.QuotedListaString(ListaTipoContrato,',')+ '))'+CR_LF
    else
      sSQL := sSQL + 'AND  (TIPOCONTRATO    = ' +FU.QuotedListaString(ListaTipoContrato,',')+ ')'+CR_LF;
  with (sqlOrcamQuantPess2.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  ORC1.ORCADO AS ORC1, REA1.REALIZADO AS REA1,');
    Add('  NVL(REA1.REALIZADO,0) - NVL(ORC1.ORCADO,0) AS DIF1,');
    Add('  ORC2.ORCADO AS ORC2, REA2.REALIZADO AS REA2,');
    Add('  NVL(REA2.REALIZADO,0) - NVL(ORC2.ORCADO,0) AS DIF2,');
    Add('  ORC3.ORCADO AS ORC3, REA3.REALIZADO AS REA3,');
    Add('  NVL(REA3.REALIZADO,0) - NVL(ORC3.ORCADO,0) AS DIF3,');
    Add('  ORC4.ORCADO AS ORC4, REA4.REALIZADO AS REA4,');
    Add('  NVL(REA4.REALIZADO,0) - NVL(ORC4.ORCADO,0) AS DIF4,');
    Add('  ORC5.ORCADO AS ORC5, REA5.REALIZADO AS REA5,');
    Add('  NVL(REA5.REALIZADO,0) - NVL(ORC5.ORCADO,0) AS DIF5,');
    Add('  ORC6.ORCADO AS ORC6, REA6.REALIZADO AS REA6,');
    Add('  NVL(REA6.REALIZADO,0) - NVL(ORC6.ORCADO,0) AS DIF6,');
    Add('  ORC7.ORCADO AS ORC7, REA7.REALIZADO AS REA7,');
    Add('  NVL(REA7.REALIZADO,0) - NVL(ORC7.ORCADO,0) AS DIF7,');
    Add('  ORC8.ORCADO AS ORC8, REA8.REALIZADO AS REA8,');
    Add('  NVL(REA8.REALIZADO,0) - NVL(ORC8.ORCADO,0) AS DIF8,');
    Add('  ORC9.ORCADO AS ORC9, REA9.REALIZADO AS REA9,');
    Add('  NVL(REA9.REALIZADO,0) - NVL(ORC9.ORCADO,0) AS DIF9,');
    Add('  ORC10.ORCADO AS ORC10, REA10.REALIZADO AS REA10,');
    Add('  NVL(REA10.REALIZADO,0) - NVL(ORC10.ORCADO,0) AS DIF10,');
    Add('  ORC11.ORCADO AS ORC11, REA11.REALIZADO AS REA11,');
    Add('  NVL(REA11.REALIZADO,0) - NVL(ORC11.ORCADO,0) AS DIF11,');
    Add('  ORC12.ORCADO AS ORC12, REA12.REALIZADO AS REA12,');
    Add('  NVL(REA12.REALIZADO,0) - NVL(ORC12.ORCADO,0) AS DIF12');

    Add('FROM');

    Add('  (SELECT SUM(QTDEPESSOAL) AS ORCADO');
    Add('   FROM ORCAMPESSOAL OP');
    Add('   WHERE (OP.ANO = '+sAno+')');
    Add('   AND   (OP.MES = 1)');
    Add('   AND   (OP.IDEMPRESA = '+IntToStr(IdEmpresa)+')');
    if not CdsOrcamQuantPess.FieldByName('IDCARGO').IsNull then
      Add('   AND   (OP.IDCARGO  = '+CdsOrcamQuantPess.FieldByName('IDCARGO').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('IDESTAB').IsNull then
      Add('   AND   (OP.IDESTAB  = '+CdsOrcamQuantPess.FieldByName('IDESTAB').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').IsNull then
      Add('   AND   (OP.CODCENTROCUSTO = '+QuotedStr(CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').AsString)+')');
    Add(') ORC1,');
    Add('  (SELECT COUNT(DISTINCT F.IDPESSOA) AS REALIZADO');
    Add('   FROM FUNCIONARIO F, SITFUNC S,');
    Add('   (SELECT EVOL.IDCARGO, EVOL.IDPESSOA, EVOL.IDEMPRESA,');
    Add('           EVOL.CODCENTROCUSTO, EVOL.IDESTAB');
    Add('    FROM   EVOLFUNC EVOL,');
    Add('           (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA');
    Add('            FROM   EVOLFUNC');
    Add('            WHERE');
    Add('                (IDEMPRESA = '+IntToStr(IdEmpresa)+')');
    if not CdsOrcamQuantPess.FieldByName('IDCARGO').IsNull then
      Add('            AND (IDCARGO = '+CdsOrcamQuantPess.FieldByName('IDCARGO').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('IDESTAB').IsNull then
      Add('            AND (IDESTAB = '+CdsOrcamQuantPess.FieldByName('IDESTAB').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').IsNull then
      Add('            AND   (TRIM(CODCENTROCUSTO) = '+QuotedStr(CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').AsString)+')');
    Add('           AND (TO_CHAR(DATAALTERFUNC,''YYYYMM'') <= '+QuotedStr(sAno+'01')+')');
    Add('           GROUP BY IDPESSOA) HST2');
    Add('    WHERE  (EVOL.DATAALTERFUNC = HST2.DATAALTERFUNC) AND');
    Add('            (EVOL.IDPESSOA      = HST2.IDPESSOA)) HST');
    Add('   WHERE (TO_CHAR(DATAADMISSAO,''YYYYMM'') <= '+QuotedStr(sAno+'01')+')');
    Add(sSql);
    Add('   AND   (TIPOSIT   <> ''D'' OR TO_CHAR(DATADESLIGAMENTO,''YYYYMM'') > '+QuotedStr(sAno+'01')+')');
    Add('   AND   (F.IDSITFUNC = S.IDSITFUNC)');
    Add('   AND   (DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) = '+IntToStr(IdEmpresa)+')');
    if not CdsOrcamQuantPess.FieldByName('IDCARGO').IsNull then
      Add('   AND   (DECODE(HST.IDCARGO,NULL,F.IDCARGO,HST.IDCARGO) = '+CdsOrcamQuantPess.FieldByName('IDCARGO').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('IDESTAB').IsNull then
      Add('   AND   (DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) = '+CdsOrcamQuantPess.FieldByName('IDESTAB').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').IsNull then
      Add('   AND   (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) = '+QuotedStr(CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').AsString)+')');
    Add('   AND   (F.IDPESSOA = HST.IDPESSOA(+))');
    Add(') REA1,');

    Add('  (SELECT SUM(QTDEPESSOAL) AS ORCADO');
    Add('   FROM ORCAMPESSOAL OP');
    Add('   WHERE (OP.ANO = '+sAno+')');
    Add('   AND   (OP.MES = 2)');
    Add('   AND   (OP.IDEMPRESA = '+IntToStr(IdEmpresa)+')');
    if not CdsOrcamQuantPess.FieldByName('IDCARGO').IsNull then
      Add('   AND   (OP.IDCARGO  = '+CdsOrcamQuantPess.FieldByName('IDCARGO').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('IDESTAB').IsNull then
      Add('   AND   (OP.IDESTAB  = '+CdsOrcamQuantPess.FieldByName('IDESTAB').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').IsNull then
      Add('   AND   (OP.CODCENTROCUSTO = '+QuotedStr(CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').AsString)+')');
    Add(') ORC2,');
    Add('  (SELECT COUNT(DISTINCT F.IDPESSOA) AS REALIZADO');
    Add('   FROM FUNCIONARIO F, SITFUNC S,');
    Add('   (SELECT EVOL.IDCARGO, EVOL.IDPESSOA, EVOL.IDEMPRESA,');
    Add('           EVOL.CODCENTROCUSTO, EVOL.IDESTAB');
    Add('    FROM   EVOLFUNC EVOL,');
    Add('           (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA');
    Add('            FROM   EVOLFUNC');
    Add('            WHERE');
    Add('                (IDEMPRESA = '+IntToStr(IdEmpresa)+')');
    if not CdsOrcamQuantPess.FieldByName('IDCARGO').IsNull then
      Add('            AND (IDCARGO = '+CdsOrcamQuantPess.FieldByName('IDCARGO').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('IDESTAB').IsNull then
      Add('            AND (IDESTAB = '+CdsOrcamQuantPess.FieldByName('IDESTAB').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').IsNull then
      Add('            AND   (TRIM(CODCENTROCUSTO) = '+QuotedStr(CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').AsString)+')');
    Add('           AND (TO_CHAR(DATAALTERFUNC,''YYYYMM'') <= '+QuotedStr(sAno+'02')+')');
    Add('           GROUP BY IDPESSOA) HST2');
    Add('    WHERE  (EVOL.DATAALTERFUNC = HST2.DATAALTERFUNC) AND');
    Add('            (EVOL.IDPESSOA      = HST2.IDPESSOA)) HST');
    Add('   WHERE (TO_CHAR(DATAADMISSAO,''YYYYMM'') <= '+QuotedStr(sAno+'02')+')');
    Add(sSql);
    Add('   AND   (TIPOSIT   <> ''D'' OR TO_CHAR(DATADESLIGAMENTO,''YYYYMM'') > '+QuotedStr(sAno+'02')+')');
    Add('   AND   (F.IDSITFUNC = S.IDSITFUNC)');
    Add('   AND   (DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) = '+IntToStr(IdEmpresa)+')');
    if not CdsOrcamQuantPess.FieldByName('IDCARGO').IsNull then
      Add('   AND   (DECODE(HST.IDCARGO,NULL,F.IDCARGO,HST.IDCARGO) = '+CdsOrcamQuantPess.FieldByName('IDCARGO').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('IDESTAB').IsNull then
      Add('   AND   (DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) = '+CdsOrcamQuantPess.FieldByName('IDESTAB').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').IsNull then
      Add('   AND   (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) = '+QuotedStr(CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').AsString)+')');
    Add('   AND   (F.IDPESSOA = HST.IDPESSOA(+))');
    Add(') REA2,');

    Add('  (SELECT SUM(QTDEPESSOAL) AS ORCADO');
    Add('   FROM ORCAMPESSOAL OP');
    Add('   WHERE (OP.ANO = '+sAno+')');
    Add('   AND   (OP.MES = 3)');
    Add('   AND   (OP.IDEMPRESA = '+IntToStr(IdEmpresa)+')');
    if not CdsOrcamQuantPess.FieldByName('IDCARGO').IsNull then
      Add('   AND   (OP.IDCARGO  = '+CdsOrcamQuantPess.FieldByName('IDCARGO').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('IDESTAB').IsNull then
      Add('   AND   (OP.IDESTAB  = '+CdsOrcamQuantPess.FieldByName('IDESTAB').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').IsNull then
      Add('   AND   (OP.CODCENTROCUSTO = '+QuotedStr(CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').AsString)+')');
    Add(') ORC3,');
    Add('  (SELECT COUNT(DISTINCT F.IDPESSOA) AS REALIZADO');
    Add('   FROM FUNCIONARIO F, SITFUNC S,');
    Add('   (SELECT EVOL.IDCARGO, EVOL.IDPESSOA, EVOL.IDEMPRESA,');
    Add('           EVOL.CODCENTROCUSTO, EVOL.IDESTAB');
    Add('    FROM   EVOLFUNC EVOL,');
    Add('           (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA');
    Add('            FROM   EVOLFUNC');
    Add('            WHERE');
    Add('                (IDEMPRESA = '+IntToStr(IdEmpresa)+')');
    if not CdsOrcamQuantPess.FieldByName('IDCARGO').IsNull then
      Add('            AND (IDCARGO = '+CdsOrcamQuantPess.FieldByName('IDCARGO').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('IDESTAB').IsNull then
      Add('            AND (IDESTAB = '+CdsOrcamQuantPess.FieldByName('IDESTAB').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').IsNull then
      Add('            AND   (TRIM(CODCENTROCUSTO) = '+QuotedStr(CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').AsString)+')');
    Add('           AND (TO_CHAR(DATAALTERFUNC,''YYYYMM'') <= '+QuotedStr(sAno+'03')+')');
    Add('           GROUP BY IDPESSOA) HST2');
    Add('    WHERE  (EVOL.DATAALTERFUNC = HST2.DATAALTERFUNC) AND');
    Add('            (EVOL.IDPESSOA      = HST2.IDPESSOA)) HST');
    Add('   WHERE (TO_CHAR(DATAADMISSAO,''YYYYMM'') <= '+QuotedStr(sAno+'03')+')');
    Add(sSql);
    Add('   AND   (TIPOSIT   <> ''D'' OR TO_CHAR(DATADESLIGAMENTO,''YYYYMM'') > '+QuotedStr(sAno+'03')+')');
    Add('   AND   (F.IDSITFUNC = S.IDSITFUNC)');
    Add('   AND   (DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) = '+IntToStr(IdEmpresa)+')');
    if not CdsOrcamQuantPess.FieldByName('IDCARGO').IsNull then
      Add('   AND   (DECODE(HST.IDCARGO,NULL,F.IDCARGO,HST.IDCARGO) = '+CdsOrcamQuantPess.FieldByName('IDCARGO').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('IDESTAB').IsNull then
      Add('   AND   (DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) = '+CdsOrcamQuantPess.FieldByName('IDESTAB').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').IsNull then
      Add('   AND   (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) = '+QuotedStr(CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').AsString)+')');
    Add('   AND   (F.IDPESSOA = HST.IDPESSOA(+))');
    Add(') REA3,');

    Add('  (SELECT SUM(QTDEPESSOAL) AS ORCADO');
    Add('   FROM ORCAMPESSOAL OP');
    Add('   WHERE (OP.ANO = '+sAno+')');
    Add('   AND   (OP.MES = 4)');
    Add('   AND   (OP.IDEMPRESA = '+IntToStr(IdEmpresa)+')');
    if not CdsOrcamQuantPess.FieldByName('IDCARGO').IsNull then
      Add('   AND   (OP.IDCARGO  = '+CdsOrcamQuantPess.FieldByName('IDCARGO').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('IDESTAB').IsNull then
      Add('   AND   (OP.IDESTAB  = '+CdsOrcamQuantPess.FieldByName('IDESTAB').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').IsNull then
      Add('   AND   (OP.CODCENTROCUSTO = '+QuotedStr(CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').AsString)+')');
    Add(') ORC4,');
    Add('  (SELECT COUNT(DISTINCT F.IDPESSOA) AS REALIZADO');
    Add('   FROM FUNCIONARIO F, SITFUNC S,');
    Add('   (SELECT EVOL.IDCARGO, EVOL.IDPESSOA, EVOL.IDEMPRESA,');
    Add('           EVOL.CODCENTROCUSTO, EVOL.IDESTAB');
    Add('    FROM   EVOLFUNC EVOL,');
    Add('           (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA');
    Add('            FROM   EVOLFUNC');
    Add('            WHERE');
    Add('                (IDEMPRESA = '+IntToStr(IdEmpresa)+')');
    if not CdsOrcamQuantPess.FieldByName('IDCARGO').IsNull then
      Add('            AND (IDCARGO = '+CdsOrcamQuantPess.FieldByName('IDCARGO').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('IDESTAB').IsNull then
      Add('            AND (IDESTAB = '+CdsOrcamQuantPess.FieldByName('IDESTAB').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').IsNull then
      Add('            AND   (TRIM(CODCENTROCUSTO) = '+QuotedStr(CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').AsString)+')');
    Add('           AND (TO_CHAR(DATAALTERFUNC,''YYYYMM'') <= '+QuotedStr(sAno+'04')+')');
    Add('           GROUP BY IDPESSOA) HST2');
    Add('    WHERE  (EVOL.DATAALTERFUNC = HST2.DATAALTERFUNC) AND');
    Add('            (EVOL.IDPESSOA      = HST2.IDPESSOA)) HST');
    Add('   WHERE (TO_CHAR(DATAADMISSAO,''YYYYMM'') <= '+QuotedStr(sAno+'04')+')');
    Add(sSql);
    Add('   AND   (TIPOSIT   <> ''D'' OR TO_CHAR(DATADESLIGAMENTO,''YYYYMM'') > '+QuotedStr(sAno+'04')+')');
    Add('   AND   (F.IDSITFUNC = S.IDSITFUNC)');
    Add('   AND   (DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) = '+IntToStr(IdEmpresa)+')');
    if not CdsOrcamQuantPess.FieldByName('IDCARGO').IsNull then
      Add('   AND   (DECODE(HST.IDCARGO,NULL,F.IDCARGO,HST.IDCARGO) = '+CdsOrcamQuantPess.FieldByName('IDCARGO').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('IDESTAB').IsNull then
      Add('   AND   (DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) = '+CdsOrcamQuantPess.FieldByName('IDESTAB').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').IsNull then
      Add('   AND   (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) = '+QuotedStr(CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').AsString)+')');
    Add('   AND   (F.IDPESSOA = HST.IDPESSOA(+))');
    Add(') REA4,');

    Add('  (SELECT SUM(QTDEPESSOAL) AS ORCADO');
    Add('   FROM ORCAMPESSOAL OP');
    Add('   WHERE (OP.ANO = '+sAno+')');
    Add('   AND   (OP.MES = 5)');
    Add('   AND   (OP.IDEMPRESA = '+IntToStr(IdEmpresa)+')');
    if not CdsOrcamQuantPess.FieldByName('IDCARGO').IsNull then
      Add('   AND   (OP.IDCARGO  = '+CdsOrcamQuantPess.FieldByName('IDCARGO').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('IDESTAB').IsNull then
      Add('   AND   (OP.IDESTAB  = '+CdsOrcamQuantPess.FieldByName('IDESTAB').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').IsNull then
      Add('   AND   (OP.CODCENTROCUSTO = '+QuotedStr(CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').AsString)+')');
    Add(') ORC5,');
    Add('  (SELECT COUNT(DISTINCT F.IDPESSOA) AS REALIZADO');
    Add('   FROM FUNCIONARIO F, SITFUNC S,');
    Add('   (SELECT EVOL.IDCARGO, EVOL.IDPESSOA, EVOL.IDEMPRESA,');
    Add('           EVOL.CODCENTROCUSTO, EVOL.IDESTAB');
    Add('    FROM   EVOLFUNC EVOL,');
    Add('           (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA');
    Add('            FROM   EVOLFUNC');
    Add('            WHERE');
    Add('                (IDEMPRESA = '+IntToStr(IdEmpresa)+')');
    if not CdsOrcamQuantPess.FieldByName('IDCARGO').IsNull then
      Add('            AND (IDCARGO = '+CdsOrcamQuantPess.FieldByName('IDCARGO').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('IDESTAB').IsNull then
      Add('            AND (IDESTAB = '+CdsOrcamQuantPess.FieldByName('IDESTAB').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').IsNull then
      Add('            AND   (TRIM(CODCENTROCUSTO) = '+QuotedStr(CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').AsString)+')');
    Add('           AND (TO_CHAR(DATAALTERFUNC,''YYYYMM'') <= '+QuotedStr(sAno+'05')+')');
    Add('           GROUP BY IDPESSOA) HST2');
    Add('    WHERE  (EVOL.DATAALTERFUNC = HST2.DATAALTERFUNC) AND');
    Add('            (EVOL.IDPESSOA      = HST2.IDPESSOA)) HST');
    Add('   WHERE (TO_CHAR(DATAADMISSAO,''YYYYMM'') <= '+QuotedStr(sAno+'05')+')');
    Add(sSql);
    Add('   AND   (TIPOSIT   <> ''D'' OR TO_CHAR(DATADESLIGAMENTO,''YYYYMM'') > '+QuotedStr(sAno+'05')+')');
    Add('   AND   (F.IDSITFUNC = S.IDSITFUNC)');
    Add('   AND   (DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) = '+IntToStr(IdEmpresa)+')');
    if not CdsOrcamQuantPess.FieldByName('IDCARGO').IsNull then
      Add('   AND   (DECODE(HST.IDCARGO,NULL,F.IDCARGO,HST.IDCARGO) = '+CdsOrcamQuantPess.FieldByName('IDCARGO').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('IDESTAB').IsNull then
      Add('   AND   (DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) = '+CdsOrcamQuantPess.FieldByName('IDESTAB').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').IsNull then
      Add('   AND   (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) = '+QuotedStr(CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').AsString)+')');
    Add('   AND   (F.IDPESSOA = HST.IDPESSOA(+))');
    Add(') REA5,');

    Add('  (SELECT SUM(QTDEPESSOAL) AS ORCADO');
    Add('   FROM ORCAMPESSOAL OP');
    Add('   WHERE (OP.ANO = '+sAno+')');
    Add('   AND   (OP.MES = 6)');
    Add('   AND   (OP.IDEMPRESA = '+IntToStr(IdEmpresa)+')');
    if not CdsOrcamQuantPess.FieldByName('IDCARGO').IsNull then
      Add('   AND   (OP.IDCARGO  = '+CdsOrcamQuantPess.FieldByName('IDCARGO').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('IDESTAB').IsNull then
      Add('   AND   (OP.IDESTAB  = '+CdsOrcamQuantPess.FieldByName('IDESTAB').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').IsNull then
      Add('   AND   (OP.CODCENTROCUSTO = '+QuotedStr(CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').AsString)+')');
    Add(') ORC6,');
    Add('  (SELECT COUNT(DISTINCT F.IDPESSOA) AS REALIZADO');
    Add('   FROM FUNCIONARIO F, SITFUNC S,');
    Add('   (SELECT EVOL.IDCARGO, EVOL.IDPESSOA, EVOL.IDEMPRESA,');
    Add('           EVOL.CODCENTROCUSTO, EVOL.IDESTAB');
    Add('    FROM   EVOLFUNC EVOL,');
    Add('           (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA');
    Add('            FROM   EVOLFUNC');
    Add('            WHERE');
    Add('                (IDEMPRESA = '+IntToStr(IdEmpresa)+')');
    if not CdsOrcamQuantPess.FieldByName('IDCARGO').IsNull then
      Add('            AND (IDCARGO = '+CdsOrcamQuantPess.FieldByName('IDCARGO').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('IDESTAB').IsNull then
      Add('            AND (IDESTAB = '+CdsOrcamQuantPess.FieldByName('IDESTAB').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').IsNull then
      Add('            AND   (TRIM(CODCENTROCUSTO) = '+QuotedStr(CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').AsString)+')');
    Add('           AND (TO_CHAR(DATAALTERFUNC,''YYYYMM'') <= '+QuotedStr(sAno+'06')+')');
    Add('           GROUP BY IDPESSOA) HST2');
    Add('    WHERE  (EVOL.DATAALTERFUNC = HST2.DATAALTERFUNC) AND');
    Add('            (EVOL.IDPESSOA      = HST2.IDPESSOA)) HST');
    Add('   WHERE (TO_CHAR(DATAADMISSAO,''YYYYMM'') <= '+QuotedStr(sAno+'06')+')');
    Add(sSql);
    Add('   AND   (TIPOSIT   <> ''D'' OR TO_CHAR(DATADESLIGAMENTO,''YYYYMM'') > '+QuotedStr(sAno+'06')+')');
    Add('   AND   (F.IDSITFUNC = S.IDSITFUNC)');
    Add('   AND   (DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) = '+IntToStr(IdEmpresa)+')');
    if not CdsOrcamQuantPess.FieldByName('IDCARGO').IsNull then
      Add('   AND   (DECODE(HST.IDCARGO,NULL,F.IDCARGO,HST.IDCARGO) = '+CdsOrcamQuantPess.FieldByName('IDCARGO').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('IDESTAB').IsNull then
      Add('   AND   (DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) = '+CdsOrcamQuantPess.FieldByName('IDESTAB').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').IsNull then
      Add('   AND   (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) = '+QuotedStr(CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').AsString)+')');
    Add('   AND   (F.IDPESSOA = HST.IDPESSOA(+))');
    Add(') REA6,');

    Add('  (SELECT SUM(QTDEPESSOAL) AS ORCADO');
    Add('   FROM ORCAMPESSOAL OP');
    Add('   WHERE (OP.ANO = '+sAno+')');
    Add('   AND   (OP.MES = 7)');
    Add('   AND   (OP.IDEMPRESA = '+IntToStr(IdEmpresa)+')');
    if not CdsOrcamQuantPess.FieldByName('IDCARGO').IsNull then
      Add('   AND   (OP.IDCARGO  = '+CdsOrcamQuantPess.FieldByName('IDCARGO').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('IDESTAB').IsNull then
      Add('   AND   (OP.IDESTAB  = '+CdsOrcamQuantPess.FieldByName('IDESTAB').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').IsNull then
      Add('   AND   (OP.CODCENTROCUSTO = '+QuotedStr(CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').AsString)+')');
    Add(') ORC7,');
    Add('  (SELECT COUNT(DISTINCT F.IDPESSOA) AS REALIZADO');
    Add('   FROM FUNCIONARIO F, SITFUNC S,');
    Add('   (SELECT EVOL.IDCARGO, EVOL.IDPESSOA, EVOL.IDEMPRESA,');
    Add('           EVOL.CODCENTROCUSTO, EVOL.IDESTAB');
    Add('    FROM   EVOLFUNC EVOL,');
    Add('           (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA');
    Add('            FROM   EVOLFUNC');
    Add('            WHERE');
    Add('                (IDEMPRESA = '+IntToStr(IdEmpresa)+')');
    if not CdsOrcamQuantPess.FieldByName('IDCARGO').IsNull then
      Add('            AND (IDCARGO = '+CdsOrcamQuantPess.FieldByName('IDCARGO').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('IDESTAB').IsNull then
      Add('            AND (IDESTAB = '+CdsOrcamQuantPess.FieldByName('IDESTAB').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').IsNull then
      Add('            AND   (TRIM(CODCENTROCUSTO) = '+QuotedStr(CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').AsString)+')');
    Add('           AND (TO_CHAR(DATAALTERFUNC,''YYYYMM'') <= '+QuotedStr(sAno+'07')+')');
    Add('           GROUP BY IDPESSOA) HST2');
    Add('    WHERE  (EVOL.DATAALTERFUNC = HST2.DATAALTERFUNC) AND');
    Add('            (EVOL.IDPESSOA      = HST2.IDPESSOA)) HST');
    Add('   WHERE (TO_CHAR(DATAADMISSAO,''YYYYMM'') <= '+QuotedStr(sAno+'07')+')');
    Add(sSql);
    Add('   AND   (TIPOSIT   <> ''D'' OR TO_CHAR(DATADESLIGAMENTO,''YYYYMM'') > '+QuotedStr(sAno+'07')+')');
    Add('   AND   (F.IDSITFUNC = S.IDSITFUNC)');
    Add('   AND   (DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) = '+IntToStr(IdEmpresa)+')');
    if not CdsOrcamQuantPess.FieldByName('IDCARGO').IsNull then
      Add('   AND   (DECODE(HST.IDCARGO,NULL,F.IDCARGO,HST.IDCARGO) = '+CdsOrcamQuantPess.FieldByName('IDCARGO').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('IDESTAB').IsNull then
      Add('   AND   (DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) = '+CdsOrcamQuantPess.FieldByName('IDESTAB').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').IsNull then
      Add('   AND   (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) = '+QuotedStr(CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').AsString)+')');
    Add('   AND   (F.IDPESSOA = HST.IDPESSOA(+))');
    Add(') REA7,');

    Add('  (SELECT SUM(QTDEPESSOAL) AS ORCADO');
    Add('   FROM ORCAMPESSOAL OP');
    Add('   WHERE (OP.ANO = '+sAno+')');
    Add('   AND   (OP.MES = 8)');
    Add('   AND   (OP.IDEMPRESA = '+IntToStr(IdEmpresa)+')');
    if not CdsOrcamQuantPess.FieldByName('IDCARGO').IsNull then
      Add('   AND   (OP.IDCARGO  = '+CdsOrcamQuantPess.FieldByName('IDCARGO').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('IDESTAB').IsNull then
      Add('   AND   (OP.IDESTAB  = '+CdsOrcamQuantPess.FieldByName('IDESTAB').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').IsNull then
      Add('   AND   (OP.CODCENTROCUSTO = '+QuotedStr(CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').AsString)+')');
    Add(') ORC8,');
    Add('  (SELECT COUNT(DISTINCT F.IDPESSOA) AS REALIZADO');
    Add('   FROM FUNCIONARIO F, SITFUNC S,');
    Add('   (SELECT EVOL.IDCARGO, EVOL.IDPESSOA, EVOL.IDEMPRESA,');
    Add('           EVOL.CODCENTROCUSTO, EVOL.IDESTAB');
    Add('    FROM   EVOLFUNC EVOL,');
    Add('           (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA');
    Add('            FROM   EVOLFUNC');
    Add('            WHERE');
    Add('                (IDEMPRESA = '+IntToStr(IdEmpresa)+')');
    if not CdsOrcamQuantPess.FieldByName('IDCARGO').IsNull then
      Add('            AND (IDCARGO = '+CdsOrcamQuantPess.FieldByName('IDCARGO').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('IDESTAB').IsNull then
      Add('            AND (IDESTAB = '+CdsOrcamQuantPess.FieldByName('IDESTAB').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').IsNull then
      Add('            AND   (TRIM(CODCENTROCUSTO) = '+QuotedStr(CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').AsString)+')');
    Add('           AND (TO_CHAR(DATAALTERFUNC,''YYYYMM'') <= '+QuotedStr(sAno+'08')+')');
    Add('           GROUP BY IDPESSOA) HST2');
    Add('    WHERE  (EVOL.DATAALTERFUNC = HST2.DATAALTERFUNC) AND');
    Add('            (EVOL.IDPESSOA      = HST2.IDPESSOA)) HST');
    Add('   WHERE (TO_CHAR(DATAADMISSAO,''YYYYMM'') <= '+QuotedStr(sAno+'08')+')');
    Add(sSql);
    Add('   AND   (TIPOSIT   <> ''D'' OR TO_CHAR(DATADESLIGAMENTO,''YYYYMM'') > '+QuotedStr(sAno+'08')+')');
    Add('   AND   (F.IDSITFUNC = S.IDSITFUNC)');
    Add('   AND   (DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) = '+IntToStr(IdEmpresa)+')');
    if not CdsOrcamQuantPess.FieldByName('IDCARGO').IsNull then
      Add('   AND   (DECODE(HST.IDCARGO,NULL,F.IDCARGO,HST.IDCARGO) = '+CdsOrcamQuantPess.FieldByName('IDCARGO').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('IDESTAB').IsNull then
      Add('   AND   (DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) = '+CdsOrcamQuantPess.FieldByName('IDESTAB').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').IsNull then
      Add('   AND   (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) = '+QuotedStr(CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').AsString)+')');
    Add('   AND   (F.IDPESSOA = HST.IDPESSOA(+))');
    Add(') REA8,');

    Add('  (SELECT SUM(QTDEPESSOAL) AS ORCADO');
    Add('   FROM ORCAMPESSOAL OP');
    Add('   WHERE (OP.ANO = '+sAno+')');
    Add('   AND   (OP.MES = 9)');
    Add('   AND   (OP.IDEMPRESA = '+IntToStr(IdEmpresa)+')');
    if not CdsOrcamQuantPess.FieldByName('IDCARGO').IsNull then
      Add('   AND   (OP.IDCARGO  = '+CdsOrcamQuantPess.FieldByName('IDCARGO').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('IDESTAB').IsNull then
      Add('   AND   (OP.IDESTAB  = '+CdsOrcamQuantPess.FieldByName('IDESTAB').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').IsNull then
      Add('   AND   (OP.CODCENTROCUSTO = '+QuotedStr(CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').AsString)+')');
    Add(') ORC9,');
    Add('  (SELECT COUNT(DISTINCT F.IDPESSOA) AS REALIZADO');
    Add('   FROM FUNCIONARIO F, SITFUNC S,');
    Add('   (SELECT EVOL.IDCARGO, EVOL.IDPESSOA, EVOL.IDEMPRESA,');
    Add('           EVOL.CODCENTROCUSTO, EVOL.IDESTAB');
    Add('    FROM   EVOLFUNC EVOL,');
    Add('           (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA');
    Add('            FROM   EVOLFUNC');
    Add('            WHERE');
    Add('                (IDEMPRESA = '+IntToStr(IdEmpresa)+')');
    if not CdsOrcamQuantPess.FieldByName('IDCARGO').IsNull then
      Add('            AND (IDCARGO = '+CdsOrcamQuantPess.FieldByName('IDCARGO').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('IDESTAB').IsNull then
      Add('            AND (IDESTAB = '+CdsOrcamQuantPess.FieldByName('IDESTAB').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').IsNull then
      Add('            AND   (TRIM(CODCENTROCUSTO) = '+QuotedStr(CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').AsString)+')');
    Add('           AND (TO_CHAR(DATAALTERFUNC,''YYYYMM'') <= '+QuotedStr(sAno+'09')+')');
    Add('           GROUP BY IDPESSOA) HST2');
    Add('    WHERE  (EVOL.DATAALTERFUNC = HST2.DATAALTERFUNC) AND');
    Add('            (EVOL.IDPESSOA      = HST2.IDPESSOA)) HST');
    Add('   WHERE (TO_CHAR(DATAADMISSAO,''YYYYMM'') <= '+QuotedStr(sAno+'09')+')');
    Add(sSql);
    Add('   AND   (TIPOSIT   <> ''D'' OR TO_CHAR(DATADESLIGAMENTO,''YYYYMM'') > '+QuotedStr(sAno+'09')+')');
    Add('   AND   (F.IDSITFUNC = S.IDSITFUNC)');
    Add('   AND   (DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) = '+IntToStr(IdEmpresa)+')');
    if not CdsOrcamQuantPess.FieldByName('IDCARGO').IsNull then
      Add('   AND   (DECODE(HST.IDCARGO,NULL,F.IDCARGO,HST.IDCARGO) = '+CdsOrcamQuantPess.FieldByName('IDCARGO').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('IDESTAB').IsNull then
      Add('   AND   (DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) = '+CdsOrcamQuantPess.FieldByName('IDESTAB').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').IsNull then
      Add('   AND   (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) = '+QuotedStr(CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').AsString)+')');
    Add('   AND   (F.IDPESSOA = HST.IDPESSOA(+))');
    Add(') REA9,');

    Add('  (SELECT SUM(QTDEPESSOAL) AS ORCADO');
    Add('   FROM ORCAMPESSOAL OP');
    Add('   WHERE (OP.ANO = '+sAno+')');
    Add('   AND   (OP.MES = 10)');
    Add('   AND   (OP.IDEMPRESA = '+IntToStr(IdEmpresa)+')');
    if not CdsOrcamQuantPess.FieldByName('IDCARGO').IsNull then
      Add('   AND   (OP.IDCARGO  = '+CdsOrcamQuantPess.FieldByName('IDCARGO').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('IDESTAB').IsNull then
      Add('   AND   (OP.IDESTAB  = '+CdsOrcamQuantPess.FieldByName('IDESTAB').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').IsNull then
      Add('   AND   (OP.CODCENTROCUSTO = '+QuotedStr(CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').AsString)+')');
    Add(') ORC10,');
    Add('  (SELECT COUNT(DISTINCT F.IDPESSOA) AS REALIZADO');
    Add('   FROM FUNCIONARIO F, SITFUNC S,');
    Add('   (SELECT EVOL.IDCARGO, EVOL.IDPESSOA, EVOL.IDEMPRESA,');
    Add('           EVOL.CODCENTROCUSTO, EVOL.IDESTAB');
    Add('    FROM   EVOLFUNC EVOL,');
    Add('           (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA');
    Add('            FROM   EVOLFUNC');
    Add('            WHERE');
    Add('                (IDEMPRESA = '+IntToStr(IdEmpresa)+')');
    if not CdsOrcamQuantPess.FieldByName('IDCARGO').IsNull then
      Add('            AND (IDCARGO = '+CdsOrcamQuantPess.FieldByName('IDCARGO').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('IDESTAB').IsNull then
      Add('            AND (IDESTAB = '+CdsOrcamQuantPess.FieldByName('IDESTAB').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').IsNull then
      Add('            AND   (TRIM(CODCENTROCUSTO) = '+QuotedStr(CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').AsString)+')');
    Add('           AND (TO_CHAR(DATAALTERFUNC,''YYYYMM'') <= '+QuotedStr(sAno+'10')+')');
    Add('           GROUP BY IDPESSOA) HST2');
    Add('    WHERE  (EVOL.DATAALTERFUNC = HST2.DATAALTERFUNC) AND');
    Add('            (EVOL.IDPESSOA      = HST2.IDPESSOA)) HST');
    Add('   WHERE (TO_CHAR(DATAADMISSAO,''YYYYMM'') <= '+QuotedStr(sAno+'10')+')');
    Add(sSql);
    Add('   AND   (TIPOSIT   <> ''D'' OR TO_CHAR(DATADESLIGAMENTO,''YYYYMM'') > '+QuotedStr(sAno+'10')+')');
    Add('   AND   (F.IDSITFUNC = S.IDSITFUNC)');
    Add('   AND   (DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) = '+IntToStr(IdEmpresa)+')');
    if not CdsOrcamQuantPess.FieldByName('IDCARGO').IsNull then
      Add('   AND   (DECODE(HST.IDCARGO,NULL,F.IDCARGO,HST.IDCARGO) = '+CdsOrcamQuantPess.FieldByName('IDCARGO').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('IDESTAB').IsNull then
      Add('   AND   (DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) = '+CdsOrcamQuantPess.FieldByName('IDESTAB').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').IsNull then
      Add('   AND   (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) = '+QuotedStr(CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').AsString)+')');
    Add('   AND   (F.IDPESSOA = HST.IDPESSOA(+))');
    Add(') REA10,');

    Add('  (SELECT SUM(QTDEPESSOAL) AS ORCADO');
    Add('   FROM ORCAMPESSOAL OP');
    Add('   WHERE (OP.ANO = '+sAno+')');
    Add('   AND   (OP.MES = 11)');
    Add('   AND   (OP.IDEMPRESA = '+IntToStr(IdEmpresa)+')');
    if not CdsOrcamQuantPess.FieldByName('IDCARGO').IsNull then
      Add('   AND   (OP.IDCARGO  = '+CdsOrcamQuantPess.FieldByName('IDCARGO').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('IDESTAB').IsNull then
      Add('   AND   (OP.IDESTAB  = '+CdsOrcamQuantPess.FieldByName('IDESTAB').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').IsNull then
      Add('   AND   (OP.CODCENTROCUSTO = '+QuotedStr(CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').AsString)+')');
    Add(') ORC11,');
    Add('  (SELECT COUNT(DISTINCT F.IDPESSOA) AS REALIZADO');
    Add('   FROM FUNCIONARIO F, SITFUNC S,');
    Add('   (SELECT EVOL.IDCARGO, EVOL.IDPESSOA, EVOL.IDEMPRESA,');
    Add('           EVOL.CODCENTROCUSTO, EVOL.IDESTAB');
    Add('    FROM   EVOLFUNC EVOL,');
    Add('           (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA');
    Add('            FROM   EVOLFUNC');
    Add('            WHERE');
    Add('                (IDEMPRESA = '+IntToStr(IdEmpresa)+')');
    if not CdsOrcamQuantPess.FieldByName('IDCARGO').IsNull then
      Add('            AND (IDCARGO = '+CdsOrcamQuantPess.FieldByName('IDCARGO').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('IDESTAB').IsNull then
      Add('            AND (IDESTAB = '+CdsOrcamQuantPess.FieldByName('IDESTAB').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').IsNull then
      Add('            AND   (TRIM(CODCENTROCUSTO) = '+QuotedStr(CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').AsString)+')');
    Add('           AND (TO_CHAR(DATAALTERFUNC,''YYYYMM'') <= '+QuotedStr(sAno+'11')+')');
    Add('           GROUP BY IDPESSOA) HST2');
    Add('    WHERE  (EVOL.DATAALTERFUNC = HST2.DATAALTERFUNC) AND');
    Add('            (EVOL.IDPESSOA      = HST2.IDPESSOA)) HST');
    Add('   WHERE (TO_CHAR(DATAADMISSAO,''YYYYMM'') <= '+QuotedStr(sAno+'11')+')');
    Add(sSql);
    Add('   AND   (TIPOSIT   <> ''D'' OR TO_CHAR(DATADESLIGAMENTO,''YYYYMM'') > '+QuotedStr(sAno+'11')+')');
    Add('   AND   (F.IDSITFUNC = S.IDSITFUNC)');
    Add('   AND   (DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) = '+IntToStr(IdEmpresa)+')');
    if not CdsOrcamQuantPess.FieldByName('IDCARGO').IsNull then
      Add('   AND   (DECODE(HST.IDCARGO,NULL,F.IDCARGO,HST.IDCARGO) = '+CdsOrcamQuantPess.FieldByName('IDCARGO').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('IDESTAB').IsNull then
      Add('   AND   (DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) = '+CdsOrcamQuantPess.FieldByName('IDESTAB').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').IsNull then
      Add('   AND   (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) = '+QuotedStr(CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').AsString)+')');
    Add('   AND   (F.IDPESSOA = HST.IDPESSOA(+))');
    Add(') REA11,');

    Add('  (SELECT SUM(QTDEPESSOAL) AS ORCADO');
    Add('   FROM ORCAMPESSOAL OP');
    Add('   WHERE (OP.ANO = '+sAno+')');
    Add('   AND   (OP.MES = 12)');
    Add('   AND   (OP.IDEMPRESA = '+IntToStr(IdEmpresa)+')');
    if not CdsOrcamQuantPess.FieldByName('IDCARGO').IsNull then
      Add('   AND   (OP.IDCARGO  = '+CdsOrcamQuantPess.FieldByName('IDCARGO').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('IDESTAB').IsNull then
      Add('   AND   (OP.IDESTAB  = '+CdsOrcamQuantPess.FieldByName('IDESTAB').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').IsNull then
      Add('   AND   (OP.CODCENTROCUSTO = '+QuotedStr(CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').AsString)+')');
    Add(') ORC12,');
    Add('  (SELECT COUNT(DISTINCT F.IDPESSOA) AS REALIZADO');
    Add('   FROM FUNCIONARIO F, SITFUNC S,');
    Add('   (SELECT EVOL.IDCARGO, EVOL.IDPESSOA, EVOL.IDEMPRESA,');
    Add('           EVOL.CODCENTROCUSTO, EVOL.IDESTAB');
    Add('    FROM   EVOLFUNC EVOL,');
    Add('           (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA');
    Add('            FROM   EVOLFUNC');
    Add('            WHERE');
    Add('                (IDEMPRESA = '+IntToStr(IdEmpresa)+')');
    if not CdsOrcamQuantPess.FieldByName('IDCARGO').IsNull then
      Add('            AND (IDCARGO = '+CdsOrcamQuantPess.FieldByName('IDCARGO').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('IDESTAB').IsNull then
      Add('            AND (IDESTAB = '+CdsOrcamQuantPess.FieldByName('IDESTAB').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').IsNull then
      Add('            AND   (TRIM(CODCENTROCUSTO) = '+QuotedStr(CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').AsString)+')');
    Add('           AND (TO_CHAR(DATAALTERFUNC,''YYYYMM'') <= '+QuotedStr(sAno+'12')+')');
    Add('           GROUP BY IDPESSOA) HST2');
    Add('    WHERE  (EVOL.DATAALTERFUNC = HST2.DATAALTERFUNC) AND');
    Add('            (EVOL.IDPESSOA      = HST2.IDPESSOA)) HST');
    Add('   WHERE (TO_CHAR(DATAADMISSAO,''YYYYMM'') <= '+QuotedStr(sAno+'12')+')');
    Add(sSql);
    Add('   AND   (TIPOSIT   <> ''D'' OR TO_CHAR(DATADESLIGAMENTO,''YYYYMM'') > '+QuotedStr(sAno+'12')+')');
    Add('   AND   (F.IDSITFUNC = S.IDSITFUNC)');
    Add('   AND   (DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) = '+IntToStr(IdEmpresa)+')');
    if not CdsOrcamQuantPess.FieldByName('IDCARGO').IsNull then
      Add('   AND   (DECODE(HST.IDCARGO,NULL,F.IDCARGO,HST.IDCARGO) = '+CdsOrcamQuantPess.FieldByName('IDCARGO').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('IDESTAB').IsNull then
      Add('   AND   (DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) = '+CdsOrcamQuantPess.FieldByName('IDESTAB').AsString+')');
    if not CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').IsNull then
      Add('   AND   (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) = '+QuotedStr(CdsOrcamQuantPess.FieldByName('CODCENTROCUSTO').AsString)+')');
    Add('   AND   (F.IDPESSOA = HST.IDPESSOA(+))');
    Add(') REA12');
    SaveToFile('c:\qry2.txt');
  end;
  sqlOrcamQuantPess2.Open;
end;

end.
