unit rPosicaoLote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppBands, ppClass, ppCtrls, ppVar, ppPrnabl, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, uCmRptManager, TXComp, CmParamReport, DBClient,
  uCMClientDataSet, uCmSqlParams, TXRB;

type
  TRptPosicaoLote = class(TFrmCmReport)
    PpEmisCq: TppBDEPipeline;
    DsEmisCq: TwwDataSource;
    RptEmisCq: TppReport;
    ppHeaderBand16: TppHeaderBand;
    ppLine23: TppLine;
    ppLabel1: TppLabel;
    LblRelChequeEmiss: TppLabel;
    RptEmisCqLabel1: TppLabel;
    RptEmisCqLabel2: TppLabel;
    RptEmisCqLabel4: TppLabel;
    RptEmisCqLabel11: TppLabel;
    ppDetailBand17: TppDetailBand;
    RptEmisCqDBText1: TppDBText;
    RptEmisCqDBText2: TppDBText;
    RptEmisCqDBText4: TppDBText;
    RptEmisCqDBText5: TppDBText;
    RptEmisCqDBText7: TppDBText;
    ppFooterBand16: TppFooterBand;
    ppLine24: TppLine;
    ppLabel19: TppLabel;
    ppCalc27: TppSystemVariable;
    ppCalc28: TppSystemVariable;
    RptEmisCqSummaryBand1: TppSummaryBand;
    RptEmisCqDBCalc3: TppDBCalc;
    RptEmisCqLabel9: TppLabel;
    RptEmisCqLabel10: TppLabel;
    RptEmisCqDBCalc4: TppDBCalc;
    RptEmisCqLabel12: TppLabel;
    SqlEmisCq: TCMSqlParams;
    CdsEmisCq: TCMClientDataSet;
    ppDBText2: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppLine1: TppLine;
    ppLabel3: TppLabel;
    ppLine3: TppLine;
    ppDBCalc1: TppDBCalc;
    ppLabel4: TppLabel;
    ppLine4: TppLine;
    ppLine2: TppLine;
    ppLine5: TppLine;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptPosicaoLote: TRptPosicaoLote;

implementation

{$R *.DFM}

procedure TRptPosicaoLote.CrmRptCMBeforePrint(Sender: TObject);
var
  sTipo, sSqlData, sSqlStatus, sSqlDataProg, sSituacao: string;
begin
  inherited;

  sSqlData := '';
  sSqlDataProg := '';

  if not CmpRptCM.ParamValues[0].IsNull then
    sSqlData := ' (LP.DATAEMISSAO >= TO_DATE(''' + CmpRptCM.ParamValues[0].AsString + ''',''DD/MM/YYYY'')) AND ';
  if not CmpRptCM.ParamValues[1].IsNull then
  sSqlData := sSqlData + ' (LP.DATAEMISSAO <= TO_DATE(''' + CmpRptCM.ParamValues[1].AsString + ''',''DD/MM/YYYY'')) AND ';

  if not CmpRptCM.ParamValues[2].IsNull then
    sSqlDataProg := ' (D.DATAPROGRAMADA >= TO_DATE(''' + CmpRptCM.ParamValues[2].AsString + ''',''DD/MM/YYYY'')) AND ';

  if not CmpRptCM.ParamValues[3].IsNull then
    sSqlDataProg := sSqlDataProg + ' (D.DATAPROGRAMADA <= TO_DATE(''' + CmpRptCM.ParamValues[3].AsString + ''',''DD/MM/YYYY'')) AND ';

  if not CmpRptCM.ParamValues[6].IsNull then
    sSqlDataProg := sSqlDataProg + ' (P.CODPORTFORMA = ' + CmpRptCM.ParamValues[6].AsString + ') AND ';

  case CmpRptCM.ParamValues[7].AsInteger of
    0:
      begin
        sSqlStatus := '(LP.FLAGEMISSAO = ''1'') AND ';
        sSituacao := ' Emitidos';
      end;
    1:
      begin
        sSituacao := ' Emitidos';
        sSqlStatus := '((LP.FLAGCANCEL <> ''C'') OR (LP.FLAGCANCEL IS NULL)) AND (LP.FLAGEMISSAO = ''1'') AND ';
      end;
    2:
      begin
        sSituacao := ' Baixados';
        sSqlStatus := '(LP.FLAGCANCEL = ''B'') AND ';
      end;
    3:
      begin
        sSituacao := ' em aberto';
        sSqlStatus := '((LP.FLAGEMISSAO = ''1'') AND ' +
          '(((LP.FLAGCANCEL <> ''B'') AND (LP.FLAGCANCEL <> ''C'')) OR LP.FLAGCANCEL IS NULL)) AND ';
      end;
    4:
      begin
        sSqlStatus := '(LP.FLAGCANCEL = ''C'') AND (LP.FLAGEMISSAO = ''1'') AND ';
        sSituacao := ' Cancelados';
      end;
  end;

  with SqlEmisCq do
  begin
    Close;
    Sql.Text :=
        'SELECT  '+
        'LD.NUMLOTE, R.IDPLANOPREV, LP.DATAEMISSAO, LP.NUMCHQBORDERO, P.DESCRICAO, LP.FAVORECIDO, '+
        'DECODE(LP.FLAGCANCEL,NULL,''E'',LP.FLAGCANCEL) AS FLAGCANCEL, PL.NOME, D.DATAPROGRAMADA, '+
        'SUM(LD.VALOR / L.VALOR * R.VALOR) AS VLRBASE '+
        'FROM  '+
        'DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R,  '+
        'LOTEXDOCUM LD, LOTEPAGTO LP, PORTADORFORMA P, '+
        'PLANPREVCONTABIL PL '+
        'WHERE '+
        'D.CODDOCUMENTO = L.CODDOCUMENTO '+
        'AND (D.OPERACAO <> 3 AND D.OPERACAO <> 1) '+
        'AND D.OPERACAO = L.OPERACAO '+
        'AND D.CODDOCUMENTO = R.CODDOCUMENTO '+
        'AND D.CODDOCUMENTO = LD.CODDOCUMENTO '+
        'AND LD.NUMLOTE = LP.NUMLOTE  AND';
        if not CmpRptCM.ParamValues[0].IsNull then
        Sql.Text := Sql.Text +  ' (LP.DATAEMISSAO >= TO_DATE(''' + CmpRptCM.ParamValues[0].AsString + ''',''DD/MM/YYYY'')) AND ';
        if not CmpRptCM.ParamValues[1].IsNull then
        Sql.Text := Sql.Text + ' (LP.DATAEMISSAO <= TO_DATE(''' + CmpRptCM.ParamValues[1].AsString + ''',''DD/MM/YYYY'')) AND ';
         if not CmpRptCM.ParamValues[2].IsNull then
        Sql.Text := Sql.Text +  ' (D.DATAPROGRAMADA >= TO_DATE(''' + CmpRptCM.ParamValues[2].AsString + ''',''DD/MM/YYYY'')) AND ';
        if not CmpRptCM.ParamValues[3].IsNull then
        Sql.Text := Sql.Text + ' (D.DATAPROGRAMADA <= TO_DATE(''' + CmpRptCM.ParamValues[3].AsString + ''',''DD/MM/YYYY'')) AND ';
        if not CmpRptCM.ParamValues[4].IsNull then
           Sql.Text := Sql.Text + ' (LP.NUMLOTE >= ' + CmpRptCM.ParamValues[4].AsString + ') AND ';
         if not CmpRptCM.ParamValues[5].IsNull then
           Sql.Text := Sql.Text + ' (LP.NUMLOTE <= ' + CmpRptCM.ParamValues[5].AsString + ') AND ';
         if not CmpRptCM.ParamValues[7].IsNull then
           Sql.Text := Sql.Text + sSqlStatus;
        Sql.Text := Sql.Text +' LP.CODPORTFORMA = P.CODPORTFORMA  '+
        'AND R.IDPLANOPREV = PL.IDPLANOPREV '+
        'GROUP BY '+
        'D.DATAPROGRAMADA, LD.NUMLOTE, R.IDPLANOPREV, '+
        'LP.DATAEMISSAO, LP.NUMCHQBORDERO, P.DESCRICAO, LP.FAVORECIDO,  '+
        'DECODE(LP.FLAGCANCEL,NULL,''E'',LP.FLAGCANCEL), '+
        'PL.NOME    '+
        'UNION '+
        'SELECT  '+
        'LD.NUMLOTE, EFETIVO.IDPLANOPREV,  '+
        'LP.DATAEMISSAO, LP.NUMCHQBORDERO, P.DESCRICAO, LP.FAVORECIDO, '+
        'DECODE(LP.FLAGCANCEL,NULL,''E'',LP.FLAGCANCEL) AS FLAGCANCEL, '+
        'PL.NOME, D.DATAPROGRAMADA, SUM(LD.VALOR / EFETIVO.LANCTO * EFETIVO.RATEIO) AS VLRBASE '+
        'FROM   '+
        ' DOCUMENTO D, LANCTODOCUM L,  LOTEXDOCUM LD,  '+
        ' LOTEPAGTO LP, PORTADORFORMA P, PLANPREVCONTABIL PL,  '+
        ' (    '+
        '   SELECT RAT.NUMFATURA, RAT.IDPLANOPREV, RAT.RATEIO, LANCTO.LANCTO  '+
        '   FROM    '+
        ' ( SELECT  '+
        '      DOC.NUMFATURA, RT.IDPLANOPREV, '+
        '      SUM(RT.VALOR) AS RATEIO   '+
        '   FROM   '+
        '      DOCUMENTO DOC, RATEIODOCUM RT  '+
        '   WHERE '+
        '      DOC.OPERACAO = 1      '+
        '      AND DOC.CODDOCUMENTO = RT.CODDOCUMENTO '+
        '   GROUP BY  '+
        '      DOC.NUMFATURA, RT.IDPLANOPREV '+
        ') RAT, '+
        '( SELECT   '+
        '      DOC.NUMFATURA, SUM(LD.VALOR) AS LANCTO '+
        '   FROM   '+
        '      DOCUMENTO DOC, LANCTODOCUM LD  '+
        '   WHERE  '+
        '      DOC.OPERACAO = 1  '+
        '      AND DOC.CODDOCUMENTO = LD.CODDOCUMENTO  '+
        '      AND DOC.OPERACAO = LD.OPERACAO '+
        '   GROUP BY   '+
        '      DOC.NUMFATURA   '+
        ' ) LANCTO   '+
        ' WHERE        '+
        ' RAT.NUMFATURA = LANCTO.NUMFATURA  '+
        ' ) EFETIVO  '+
        ' WHERE   '+
        'D.OPERACAO = 3  '+
        'AND D.CODDOCUMENTO = L.CODDOCUMENTO '+
        'AND D.OPERACAO = L.OPERACAO  '+
        'AND D.CODDOCUMENTO = LD.CODDOCUMENTO  '+
        'AND LD.NUMLOTE = LP.NUMLOTE AND ';
        if not CmpRptCM.ParamValues[0].IsNull then
        Sql.Text := Sql.Text +' (LP.DATAEMISSAO >= TO_DATE(''' + CmpRptCM.ParamValues[0].AsString + ''',''DD/MM/YYYY'')) AND ';
        if not CmpRptCM.ParamValues[1].IsNull then
        Sql.Text := Sql.Text + ' (LP.DATAEMISSAO <= TO_DATE(''' + CmpRptCM.ParamValues[1].AsString + ''',''DD/MM/YYYY'')) AND ';
         if not CmpRptCM.ParamValues[2].IsNull then
        Sql.Text := Sql.Text +  ' (D.DATAPROGRAMADA >= TO_DATE(''' + CmpRptCM.ParamValues[2].AsString + ''',''DD/MM/YYYY'')) AND ';
        if not CmpRptCM.ParamValues[3].IsNull then
        Sql.Text := Sql.Text + ' (D.DATAPROGRAMADA <= TO_DATE(''' + CmpRptCM.ParamValues[3].AsString + ''',''DD/MM/YYYY'')) AND ';
        if not CmpRptCM.ParamValues[4].IsNull then
         Sql.Text := Sql.Text + ' (LP.NUMLOTE >= ' + CmpRptCM.ParamValues[4].AsString + ') AND ';
        if not CmpRptCM.ParamValues[5].IsNull then
         Sql.Text := Sql.Text + ' (LP.NUMLOTE <= ' + CmpRptCM.ParamValues[5].AsString + ') AND ';
         if not CmpRptCM.ParamValues[7].IsNull then
         Sql.Text := Sql.Text + sSqlStatus;
         Sql.Text := Sql.Text +'LP.CODPORTFORMA = P.CODPORTFORMA  '+
        'AND D.NUMFATURA = EFETIVO.NUMFATURA '+
        'AND EFETIVO.IDPLANOPREV = PL.IDPLANOPREV  '+
        'GROUP BY '+
        'D.DATAPROGRAMADA, LD.NUMLOTE, EFETIVO.IDPLANOPREV, LP.DATAEMISSAO, LP.NUMCHQBORDERO, P.DESCRICAO, LP.FAVORECIDO,  '+
        'DECODE(LP.FLAGCANCEL,NULL,''E'',LP.FLAGCANCEL), PL.NOME ';

    Open;
  end;

  LblRelChequeEmiss.Caption := 'Posição dos Lotes - Segregado por Plano' ;
end;

procedure TRptPosicaoLote.CmpRptCMBeforeExecute(
  var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamValues[6].LookupSettings.SQL.text := 'select codportforma, descricao ' +
    'from   portadorforma  ' +
    'where  IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa)  +
    '     order by descricao ';

end;

end.

