{*******************************************************************************

                        Sistema - Contas a Receber

 *******************************************************************************
 Data      : 12/03/2018
 Autor     : Everson Luiz Pereira da Cunha
 SIG       : SIG TIBERO
 Descrição : Melhoria em adequação ao TIBERO.
             Inserir alias nas tabelas e campos.
             Retirar INDEX, +rule, etc
--------------------------------------------------------------------------------}

unit rPrevObra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, DBTables, ppBands,
  ppClass, ppCtrls, ppVar, ppPrnabl, ppCache, ppProd, ppReport, Db,
  Wwquery, Wwdatsrc, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, DBClient,
  uCMClientDataSet, uCmSqlParams, uCtrlParamIntegra, uCtrlParamCap;

type
  TRptPrevObra = class(TFrmCmReport)
    PpQryPrevObra: TppBDEPipeline;
    PpQryPrevObrappField1: TppField;
    PpQryPrevObrappField2: TppField;
    PpQryPrevObrappField3: TppField;
    PpQryPrevObrappField4: TppField;
    PpQryPrevObrappField5: TppField;
    PpQryPrevObrappField6: TppField;
    PpQryPrevObrappField7: TppField;
    PpQryPrevObrappField8: TppField;
    DsQryPrevObra: TwwDataSource;
    RptQryPrevObra: TppReport;
    ppHeaderBand20: TppHeaderBand;
    ppLabel56: TppLabel;
    ppLabel59: TppLabel;
    RptQryPrevObraLine1: TppLine;
    LblPeridoPrevObra: TppLabel;
    RptQryPrevObraLabel3: TppLabel;
    RptQryPrevObraLabel4: TppLabel;
    RptQryPrevObraLabel5: TppLabel;
    RptQryPrevObraLabel7: TppLabel;
    RptQryPrevObraLabel6: TppLabel;
    ppDetailBand21: TppDetailBand;
    RptQryPrevObraDBText3: TppDBText;
    RptQryPrevObraDBText4: TppDBText;
    RptQryPrevObraDBText5: TppDBText;
    RptQryPrevObraDBText7: TppDBText;
    RptQryPrevObraDBText6: TppDBText;
    RptQryPrevObraDBText8: TppDBText;
    ppFooterBand20: TppFooterBand;
    ppLine39: TppLine;
    ppLabel63: TppLabel;
    ppCalc35: TppSystemVariable;
    ppCalc36: TppSystemVariable;
    RptQryPrevObraSummaryBand1: TppSummaryBand;
    LblValorTotal: TppDBCalc;
    RptQryPrevObraLabel2: TppLabel;
    RptQryPrevObraGroup1: TppGroup;
    RptQryPrevObraGroupHeaderBand1: TppGroupHeaderBand;
    RptQryPrevObraLabel1: TppLabel;
    RptQryPrevObraDBText1: TppDBText;
    RptQryPrevObraGroupFooterBand1: TppGroupFooterBand;
    LblSomaRateio: TppDBCalc;
    RptQryPrevObraLabel8: TppLabel;
    RptQryPrevObraLine2: TppLine;
    SqlPrevObra: TCMSqlParams;
    CdsPrevObra: TCMClientDataSet;
    SqlPrevObra2: TCMSqlParams;
    CdsPrevObra2: TCMClientDataSet;
    CdsParam: TCMClientDataSet;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
    CtrlParamCap: TCtrlParamCap;
  public
    { Public declarations }
  end;

var
  RptPrevObra: TRptPrevObra;

implementation

uses DBaseDados, uSistema;

{$R *.DFM}

procedure TRptPrevObra.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamValues[0].TextDefault := DatetoStr(date);
  CmpRptCM.ParamValues[1].TextDefault := DatetoStr(date);

end;

procedure TRptPrevObra.FormCreate(Sender: TObject);
begin
  inherited;
  if ParamIntegra.RecPag = 'R' then
  begin
    CmpRptCM.Caption := 'Previsão de Recebidos Por Centro de Responsabilidade';
  end
  else
  begin
    CmpRptCM.Caption := 'Previsão de Pagos Por Centro de Responsabilidade';
    CmpRptCM.ParamValues[0].Caption := ' Data Programada do Documento Inicial';
    CmpRptCM.ParamValues[1].Caption := ' Data Programada do Documento Final';
    CmpRptCM.ParamValues[2].LookupSettings.SQL.text :=
       ' SELECT CODEXTERNO AS CODCENTRORESPON, NOME ' +
       ' FROM CENTRESPON '+
       '  where IDPESSOA = ' + FloatToStr( Sistema.IdEmpresa ) +
       ' ORDER BY NOME ';
  end;
end;

procedure TRptPrevObra.CrmRptCMBeforePrint(Sender: TObject);
var
  sSql: string;
  bEmiteLancaBaixa: Boolean;
begin
  inherited;

  CtrlParamCap := TCtrlParamCap.Create;
  CtrlParamCap.Initialize(DtmBaseDados.dbBaseDados, False, Sistema.ConnectionType, Sistema.ConnectionSide,
    Sistema.AppRemoteServer, True);
  CdsParam.data := CtrlParamCap.ListParamCAP(ParamIntegra.RecPag, StrtoInt(FloatToStr(CrmRptCM.IdEmpresa)));
  bEmiteLancaBaixa := False;
  if not CdsParam.IsEmpty then
    bEmiteLancaBaixa := (CdsParam.FieldByName('FLGEMITELANCBAIX').AsString = 'S');
  CtrlParamCap.free;

//  sSql := 'SELECT /*+ RULE */ ' + //Everson TIBERO
  sSql := 'SELECT ' +  //Everson TIBERO
    '   C.NOME, D.DATAPROGRAMADA, ' +
    '   D.NODOCUMENTO, D.COMPLDOCUMENTO, P.RAZAOSOCIAL, L.HISTORICOCOMPL,C.CODCENTRORESPON, ' +
    '   SUM(((SALDO.SVALOR * R.VALOR) / L.VALOR)) AS SALDORATEIO ' +
    'FROM ' +
    '   DOCUMENTO D, ' +
    '   PESSOA P, ' +
    '   LANCTODOCUM L, ' +
    '   CENTRESPON C, ' +
    '   RATEIODOCUM R, ' +
    '   (SELECT S.CODDOCUMENTO, SUM(S.VREAL) AS SVALOR, SUM(S.VOUTRAMOEDA) AS SVALOROUTRAMOEDA FROM ' +
    '     (SELECT DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR * -1) AS VREAL, ' +
    '        DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA * -1) AS VOUTRAMOEDA, ' +
    '        L.CODDOCUMENTO ' +
    '        FROM LANCTODOCUM L ,DOCUMENTO D ' +
    '        WHERE L.CODDOCUMENTO = D.CODDOCUMENTO ' +
    '  AND  (D.DATAPROGRAMADA BETWEEN to_date(:PDATAINI,''dd/mm/yyyy'') AND to_date(:PDATAFIM,''dd/mm/yyyy'')) AND ' +
    ' D.RECPAG = ''P'' AND D.IDPESSOA = :PIDPESSOA)  S ' +
    '        GROUP BY S.CODDOCUMENTO) SALDO ' +
    'WHERE ' +
    '   (RTRIM(C.CODCENTRORESPON) = :OBRA) AND ' +
    '   (D.DATAPROGRAMADA BETWEEN to_date(:PDATAINI,''dd/mm/yyyy'') AND to_date(:PDATAFIM,''dd/mm/yyyy'')) AND ' +
    '   (D.IDPESSOA = :PIDPESSOA) AND ';
  if bEmiteLancaBaixa then
    sSql := sSql +
      ' ((((D.STATUS <> ''2'') or (D.STATUS is null)) AND ' +
      ' (rtrim(L.operacao) in (''1'',''2'',''3'',''14''))) OR  ' +
      ' (((D.STATUS) = ''2'') AND (D.OPERACAO = ''10'') AND ' +
      ' (D.FLGEMITELANCBAIX IS NULL))) AND '
  else
    sSql := sSql +
      '   (RTRIM(L.OPERACAO) IN (''1'',''2'',''3'',''14'')) AND ' +
      '   ((D.STATUS <> ''2'') or (D.STATUS is null)) AND ';
  sSql := sSql +
    ' ( D.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =' + #39
    + ParamIntegra.recpag + #39 +
    ' and not exists  (select 1 from UsuarioxTpdocto b where  recpag=' + #39 +
    ParamIntegra.recpag + #39 + ' and ' +
    ' b.idusuario=:idusuario)  ' +
    ' union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =' + #39 +
    ParamIntegra.recpag + #39 +
    ' and exists (select 1 from UsuarioxTpdocto b where recpag=' + #39 +
    ParamIntegra.recpag + #39 + ' and a.codtipdoc=b.codtipdoc and ' +
    ' b.idusuario=:idusuario ))   ) and     ';

  sSql := sSql +
    '   (D.RECPAG = ''P'')  AND ' +
    '   (D.IDFORCLI = P.IDPESSOA) AND ' +
    '   (D.CODDOCUMENTO = L.CODDOCUMENTO) AND ' +
    '   (D.CODDOCUMENTO = R.CODDOCUMENTO) AND ' +
    '   (R.CODCENTRORESPON = C.CODCENTRORESPON(+)) AND ' +
    '   (R.IDPESSOA = C.IDPESSOA(+)) AND (l.valor<>0) AND ' +
    '   (D.CODDOCUMENTO = SALDO.CODDOCUMENTO) ' +
    'GROUP BY ' +
    '    C.NOME, D.DATAPROGRAMADA, ' +
    '    D.NODOCUMENTO, D.COMPLDOCUMENTO, P.RAZAOSOCIAL, L.HISTORICOCOMPL, C.CODCENTRORESPON ' +
    'HAVING SUM((SALDO.SVALOR * R.VALOR / L.VALOR))  > 0 ';
  SqlPrevObra.Sql.Text := sSql;
  sSql :=
//    'SELECT /*+ RULE */ ' + //Everson TIBERO
    'SELECT  ' +  //Everson TIBERO
    '   C.NOME, D.DATAPROGRAMADA, ' +
    '   D.NODOCUMENTO, D.COMPLDOCUMENTO, P.RAZAOSOCIAL, L.HISTORICOCOMPL, C.CODCENTRORESPON, ' +
    '   SUM((SALDO.SVALOR * R.VALOR/ L.VALOR)) AS SALDORATEIO ' +
    'FROM ' +
    '   DOCUMENTO D, ' +
    '   PESSOA P, ' +
    '   LANCTODOCUM L, ' +
    '   CENTRESPON C, ' +
    '   RATEIODOCUM R, ' +
    '   (SELECT S.CODDOCUMENTO, SUM(S.VREAL) AS SVALOR, SUM(S.VOUTRAMOEDA) AS SVALOROUTRAMOEDA FROM ' +
    '      (SELECT DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR * -1) AS VREAL, ' +
    '        DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA * -1) AS VOUTRAMOEDA, ' +
    '        L.CODDOCUMENTO ' +
    '        FROM LANCTODOCUM L ,DOCUMENTO D ' +
    '        WHERE (L.CODDOCUMENTO = D.CODDOCUMENTO) AND (D.RECPAG = ''P'') ' +
    ' AND (D.DATAPROGRAMADA BETWEEN to_date(:PDATAINI,''dd/mm/yyyy'') AND to_date(:PDATAFIM,''dd/mm/yyyy'')) AND ' +
    '  (D.IDPESSOA = :PIDPESSOA))  S ' +
    '        GROUP BY S.CODDOCUMENTO) SALDO ' +
    'WHERE ' +
    '   (D.DATAPROGRAMADA BETWEEN to_date(:PDATAINI,''dd/mm/yyyy'') AND to_date(:PDATAFIM,''dd/mm/yyyy'')) AND ' +
    '   (D.IDPESSOA = :PIDPESSOA) AND ' +
    ' ( D.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =' + #39
    + ParamIntegra.recpag + #39 +
    ' and not exists  (select 1 from UsuarioxTpdocto b where  recpag=' + #39 +
    ParamIntegra.recpag + #39 + ' and ' +
    ' b.idusuario=:idusuario)  ' +
    ' union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =' + #39 +
    ParamIntegra.recpag + #39 +
    ' and exists (select 1 from UsuarioxTpdocto b where recpag=' + #39 +
    ParamIntegra.recpag + #39 + ' and a.codtipdoc=b.codtipdoc and ' +
    ' b.idusuario=:idusuario ))     ) and     ';

  if bEmiteLancaBaixa then
    sSql := sSql +
      ' ((((D.STATUS <> ''2'') or (D.STATUS is null) ) AND ' +
      ' (rtrim(L.operacao) in (''1'',''2'',''3'',''14''))) OR  ' +
      ' (((D.STATUS = ''2'') or (d.status is null)) AND (D.OPERACAO = ''10'') AND ' +
      ' (D.FLGEMITELANCBAIX IS NULL))) AND '
  else
    sSql := sSql +
      '   (RTRIM(L.OPERACAO) IN (''1'',''2'',''3'',''14'')) AND ' +
      '   ((D.STATUS <> ''2'') or (D.STATUS is null)) AND ';

  sSql := sSql +
    '   (D.RECPAG = ''P'') AND ' +
    '   (D.IDFORCLI = P.IDPESSOA) AND ' +
    '   (D.CODDOCUMENTO = L.CODDOCUMENTO) AND ' +
    '   (D.CODDOCUMENTO = R.CODDOCUMENTO) AND ' +
    '   (R.CODCENTRORESPON = C.CODCENTRORESPON(+)) AND ' +
    '   (R.IDPESSOA = C.IDPESSOA(+)) AND ' +
    '   (D.CODDOCUMENTO = SALDO.CODDOCUMENTO) and (L.VALOR <> 0)' +
    'GROUP BY     C.NOME, D.DATAPROGRAMADA, ' +
    '    D.NODOCUMENTO, D.COMPLDOCUMENTO, P.RAZAOSOCIAL, L.HISTORICOCOMPL, C.CODCENTRORESPON ' +
    'HAVING SUM((SALDO.SVALOR * R.VALOR / L.VALOR))  > 0 ';

  SqlPrevObra2.Sql.Text := sSql;

  if CmpRptCM.ParamValues[2].IsNull then
    SqlPrevObra.SQL.Text := SqlPrevObra2.SQL.Text;

  with SqlPrevObra do
  begin
    Sql.Text := Sql.Text +
      ' union all SELECT ' +
      'CR.NOME,DP.DATAPROGRAMADA,DP.NODOCUMENTO, DP.COMPLDOCUMENTO,PE.RAZAOSOCIAL,LP.HISTORICOCOMPL, RO.CODCENTRORESPON, ' +
      'SUM(((SALDO.SVALOR * RO.VALOR)/TD.VALOR)) AS SALDORATEIO ' +
      'FROM ' +
      '  DOCUMENTO DO, ' +
      '  LANCTODOCUM LO, ' +
      '  RATEIODOCUM RO, ' +
      '  DOCUMENTO DP, ' +
      '  CENTRESPON CR, ' +
      '  LANCTODOCUM LP, ' +
      '  PESSOA PE, ' +
      '  (SELECT D.NUMFATURA,SUM(L.VALOR) AS VALOR FROM DOCUMENTO D, LANCTODOCUM L WHERE rtrim(L.OPERACAO) = ''1'' ' +
      '  AND D.CODDOCUMENTO = L.CODDOCUMENTO and d.status=''2'' and d.recpag=''P'' GROUP BY D.NUMFATURA) TD, ' +
      '  (SELECT S.CODDOCUMENTO, SUM(S.VREAL) AS SVALOR, SUM(S.VOUTRAMOEDA) AS SVALOROUTRAMOEDA FROM ' +
      '  (SELECT DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR * -1) AS VREAL, ' +
      '  DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA * -1) AS VOUTRAMOEDA, ' +
      '  L.CODDOCUMENTO ' +
      '  FROM LANCTODOCUM L ,DOCUMENTO D ' +
      '  WHERE ' +
      '  (D.DATAPROGRAMADA BETWEEN TO_DATE(''' + CmpRptCM.ParamValues[0].AsString
      + ''',''DD/MM/YYYY'') AND TO_DATE(''' + CmpRptCM.ParamValues[1].AsString +
      ''',''DD/MM/YYYY'')) AND ' +
      '  L.CODDOCUMENTO = D.CODDOCUMENTO AND D.RECPAG = ''P'' AND D.IDPESSOA = ' +
      IntToStr(Sistema.IdEmpresa) + ') S ' +
      '  GROUP BY S.CODDOCUMENTO) SALDO ' +
      'WHERE ' +
      ' ( DP.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =' + #39
      + ParamIntegra.recpag + #39 +
      ' and not exists  (select 1 from UsuarioxTpdocto b where  recpag=' + #39
      + ParamIntegra.recpag + #39 + ' and ' +
      ' b.idusuario=:idusuario)  ' +
      ' union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =' + #39
      + ParamIntegra.recpag + #39 +
      ' and exists (select 1 from UsuarioxTpdocto b where recpag=' + #39 +
      ParamIntegra.recpag + #39 + ' and a.codtipdoc=b.codtipdoc and ' +
      ' b.idusuario=:idusuario ))  ) and     ' +
      '  (DP.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) + ')  AND ' +
      '  (DP.RECPAG = ''P'') AND ' +
      '  (DP.DATAPROGRAMADA BETWEEN TO_DATE(''' +
      CmpRptCM.ParamValues[0].AsString + ''',''DD/MM/YYYY'') AND TO_DATE(''' +
      CmpRptCM.ParamValues[1].AsString + ''',''DD/MM/YYYY'')) AND ' +
      '  (rtrim(DP.OPERACAO) = ''3'') AND ' +
      '  ((DP.STATUS <> ''2'') or (DP.STATUS is null) )  AND ' +
      '  (rtrim(LP.OPERACAO) = ''3'') AND ' +
      '  (LP.ESTORNO IS NULL)  AND (td.Valor <>0) and ' +
      '  (DP.NUMFATURA = DO.NUMFATURA) AND ' +
      '  (DP.CODDOCUMENTO = LP.CODDOCUMENTO) AND ' +
      '  (DO.STATUS = ''2'') AND ' +
      '  (rtrim(LO.OPERACAO) = ''1'') AND ' +
      '  (DO.CODDOCUMENTO = LO.CODDOCUMENTO) AND ' +
      '  (RO.CODDOCUMENTO = DO.CODDOCUMENTO) AND ' +
      '  (SALDO.CODDOCUMENTO =  DP.CODDOCUMENTO) AND ' +
      '  (PE.IDPESSOA = DP.IDFORCLI) AND ' +
      '  (DP.NUMFATURA = TD.NUMFATURA) AND ';

    if not CmpRptCM.ParamValues[2].IsNull then
      Sql.Text := Sql.Text + '  (RTRIM(CR.CODCENTRORESPON) =  ''' + CmpRptCM.ParamValues[2].AsString + ''') AND ';
    Sql.Text := Sql.Text +
      '  (RO.CODCENTRORESPON = CR.CODCENTRORESPON(+)) AND ' +
      '  (RO.IDPESSOA = CR.IDPESSOA(+)) ' +
      'GROUP BY ' +
      '  RO.CODCENTRORESPON,DP.DATAPROGRAMADA,PE.RAZAOSOCIAL,DP.NODOCUMENTO, DP.COMPLDOCUMENTO,' +
      '  LP.HISTORICOCOMPL, CR.NOME ' +
      'ORDER BY ' +
      '   NOME, DATAPROGRAMADA,RAZAOSOCIAL';
    LblPeridoPrevObra.Caption := 'Período de ' + CmpRptCM.ParamValues[0].AsString + ' à ' +
      CmpRptCM.ParamValues[1].AsString;
    Prepare;
    ParamByName('PDATAINI').AsString := CmpRptCM.ParamValues[0].AsString;
    ParamByName('PDATAFIM').AsString := CmpRptCM.ParamValues[1].AsString;
    ParamByName('PIDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
    ParamByName('idusuario').AsInteger := CrmRptCM.Idusuario;
    if not CmpRptCM.ParamValues[2].IsNull then
      ParamByName('OBRA').AsString := CmpRptCM.ParamValues[2].AsString;
    open;
  end;
end;

end.

