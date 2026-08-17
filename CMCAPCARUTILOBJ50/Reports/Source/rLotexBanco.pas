unit rLotexBanco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppBands, ppClass, ppCtrls, ppVar, ppPrnabl, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc,
  DBTables, Wwquery, uCmRptManager, TXComp, CmParamReport, DBClient,
  uCMClientDataSet, uCmSqlParams, TXRB;

type
  TRptLotexBanco = class(TFrmCmReport)
    dsLoteXBanco: TwwDataSource;
    ppLoteXBanco: TppBDEPipeline;
    rptLoteXBanco: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppLine8: TppLine;
    lblLoteXBancoTitulo: TppLabel;
    lblLoteXBanco: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText2: TppDBText;
    ppFooterBand5: TppFooterBand;
    ppLine9: TppLine;
    ppLabel24: TppLabel;
    ppCalc9: TppSystemVariable;
    ppCalc10: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc1: TppDBCalc;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    rptLoteXBancoDBText1: TppDBText;
    rptLoteXBancoLine1: TppLine;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel21: TppLabel;
    ppLabel20: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBCalc3: TppDBCalc;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppLine10: TppLine;
    SqlLotexBanco: TCMSqlParams;
    CdsLotexBanco: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptLotexBanco: TRptLotexBanco;

implementation

{$R *.DFM}

procedure TRptLotexBanco.CrmRptCMBeforePrint(Sender: TObject);
var
  sTipo,
    sSituacao,
    sSqlData, sSqlCheque,
    sSqlStatus: string;
  function iif(c: boolean; a, b: string): string;
  begin
    if c then
      iif := a
    else
      iif := b;
  end;
begin
  inherited;
  sTipo := '';
  sSituacao := '';
  sSqlData := '';
  sSqlStatus := '';
  // filtra as datas inicial e final do lotepagto
  if not CmpRptCM.ParamValues[1].IsNull then
    sSqlData := ' (lpa.dataemissao >= TO_DATE(''' + CmpRptCM.ParamValues[1].AsString + ''',''DD/MM/YYYY'')) and ';
  sSqlData := sSqlData + ' (lpa.dataemissao <= TO_DATE(''' + CmpRptCM.ParamValues[2].AsString + ''',''DD/MM/YYYY'')) and ';
  if not CmpRptCM.ParamValues[3].IsNull then
    sSqlCheque := ' (lpa.numchqbordero >= ' + QuotedStr(CmpRptCM.ParamValues[3].AsString) + ') and ';
  if not CmpRptCM.ParamValues[4].IsNull then
    sSqlCheque := sSqlCheque + ' (lpa.numchqbordero <= ' + QuotedStr(CmpRptCM.ParamValues[4].AsString) + ') and ';
  // filtra a situacao do lotepagto
  case CmpRptCM.ParamValues[5].AsInteger of
    0:
      begin
        sSituacao := ' Emitidos e Pendentes de Emissão';
      end;
    1:
      begin
        sSituacao := ' Emitidos';
        sSqlStatus := ' (lpa.flagemissao = ''1'') and ';
      end;
    2:
      begin
        sSituacao := ' Pendentes de Emissão';
        sSqlStatus := ' ((lpa.flagemissao = ''0'') or ' +
          '(lpa.flagemissao = '' '') or ' +
          '(lpa.flagemissao is null)) and ';
      end;
  end;

  // monta o sql
  with SqlLoteXBanco do
  begin
    Sql.Text := 'select pfo.idpessoa, pfo.recpag, doc.idmodulo, pco.idbanco, ' +
      '    pco.idagencia, lpa.dataemissao, lpa.numlote, lpa.numchqbordero, ' +
      '    decode (lpa.flagcancel, ''C'', 0, decode(lpa.flagcancel, ''R'', 0, ' +
      '        sum(ldo.valor))) as VALOR, ' +
      '    lpa.favorecido, bnc.nome as BANCO, agn.nome as AGENCIA ' +
      ' from lotepagto lpa, lotexdocum ldo, portadorforma pfo, ' +
      '      portadorconta pco, pessoa bnc, pessoa agn, documento doc ' +
      ' where  ' +
      '    (lpa.codportforma = pfo.codportforma) and ' +
      '    (pfo.codportador = pco.codportador) and ' +
      '    (pco.idbanco = bnc.idpessoa) and ' +
      '    (pco.idagencia = agn.idpessoa) and ' +
      '    (lpa.numlote = ldo.numlote) and ' +
      '    (ldo.coddocumento = doc.coddocumento) and ' +
      sSqlData + sSqlStatus + sSqlCheque +
      '    (pfo.idpessoa = ' + FloatToStr(CrmRptCM.IdEmpresa) + ') and ' +
      iif((CmpRptCM.ParamValues[0].IsNull), '', '(pco.idbanco = ' + CmpRptCM.ParamValues[0].AsString + ') and') +
      '    (pfo.recpag = ''P'')' +
      '  group by ' +
      '     pfo.idpessoa, pfo.recpag, doc.idmodulo, pco.idbanco, pco.idagencia, ' +
      '     lpa.numlote, lpa.dataemissao, lpa.numchqbordero, lpa.favorecido, ' +
      '     bnc.nome, agn.nome, lpa.flagcancel, bnc.idpessoa ' +
      ' order by pco.idbanco, bnc.idpessoa, lpa.numlote'
  end;

  if not CmpRptCM.ParamValues[1].IsNull then
    lblLoteXBanco.Caption := 'Relação dos ' + sTipo + sSituacao + ' até ' + CmpRptCM.ParamValues[1].AsString
  else
    lblLoteXBanco.Caption := 'Relação dos ' + sTipo + sSituacao + ' entre ' + CmpRptCM.ParamValues[1].AsString + ' e ' +
      CmpRptCM.ParamValues[2].AsString;

  SqlLoteXBanco.Open;

end;

procedure TRptLotexBanco.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamValues[0].LookupSettings.SQL.text := 'select distinct ' +
    '   pco.idpessoa, pco.idbanco, bnc.nome as BANCO ' +
    ' from portadorconta pco, pessoa bnc ' +
    ' where (pco.idbanco = bnc.idpessoa) and ' +
    '       (pco.idpessoa = ' + FloatToStr(CrmRptCM.IdEmpresa) + ')' +
    ' order by  pco.idbanco ';
end;

end.

