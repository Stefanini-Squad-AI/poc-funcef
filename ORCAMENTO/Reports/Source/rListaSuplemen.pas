unit rListaSuplemen;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppCtrls, ppBands, ppVar,
  ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams,
  MontaSelect, TXRB;

type
  TrptListaSuplemen = class(TFrmCmReport)
    sqlListaSuplemen: TCMSqlParams;
    cdsListaSuplemen: TCMClientDataSet;
    dsListaSuplemen: TwwDataSource;
    pplListaSuplemen: TppBDEPipeline;
    rpListaSuplemen: TppReport;
    ppHeaderBand7: TppHeaderBand;
    ppLabel48: TppLabel;
    ppLine15: TppLine;
    ppLabel49: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppLabel68: TppLabel;
    ppLabel70: TppLabel;
    rptListaSuplemenLabel1: TppLabel;
    rptListaSuplemenLabel2: TppLabel;
    rptListaSuplemenLine1: TppLine;
    ppDetailBand7: TppDetailBand;
    ppDBText17: TppDBText;
    ppDBText20: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    rptListaSuplemenDBText1: TppDBText;
    ppFooterBand7: TppFooterBand;
    ppLine17: TppLine;
    ppLabel75: TppLabel;
    ppCalc12: TppSystemVariable;
    ppCalc13: TppSystemVariable;
    rptListaSuplemenSummaryBand1: TppSummaryBand;
    rptListaSuplemenDBCalc1: TppDBCalc;
    rptListaSuplemenLine2: TppLine;
    rptListaSuplemenLabel3: TppLabel;
    rptListaSuplemenDBCalc2: TppDBCalc;
    rptListaSuplemenLabel4: TppLabel;
    procedure sqlListaSuplemenFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptListaSuplemen: TrptListaSuplemen;

implementation

uses uSistema;

{$R *.DFM}

procedure TrptListaSuplemen.sqlListaSuplemenFormartParam(sParamName,
  sOldValue: String; var sNewValue: String);
begin
  inherited;
  if (sParamName <> 'IDPESSOA') then
    sNewValue := sOldValue;
end;

procedure TrptListaSuplemen.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with sqlListaSuplemen do begin
    Prepare;
    ParamByName('IDPESSOA').AsInteger := sistema.IdEmpresa;
    ParamByName('DATAINI').AsString := 'TO_DATE(''' +
                                       FormatDateTime('dd/mm/yyyy',
                                       CmpRptCM.ParamValues[0].AsDateTime) +
                                       ''',''DD/MM/YYYY'')';
    ParamByName('DATAFIM').AsString := 'TO_DATE(''' +
                                       FormatDateTime('dd/mm/yyyy',
                                       CmpRptCM.ParamValues[1].AsDateTime) +
                                       ''',''DD/MM/YYYY'')';
    if Trim(CmpRptCM.ParamValues[2].AsString) <> '' then
      ParamByName('IDCONTAORIGEM').AsString := 'AND (A.IDCONTAORIGEM = ''' +
                                Trim(CmpRptCM.ParamValues[2].AsString) + ''') '
    else
      ParamByName('IDCONTAORIGEM').AsString := 'AND (1 = 1) ';
    Case CmpRptCM.ParamValues[4].AsInteger of
      0 : ParamByName('ORDENACAO').AsString := 'ORDER BY A.NUMALTERACAO';
      1 : ParamByName('ORDENACAO').AsString := 'ORDER BY A.IDCONTAORIGEM';
      2 : ParamByName('ORDENACAO').AsString := 'ORDER BY C.IDCONTADESTINO';
      3 : ParamByName('ORDENACAO').AsString := 'ORDER BY A.DATAREFERENCIA';
      4 : ParamByName('ORDENACAO').AsString := 'ORDER BY A.VLRSOLICITADO';
    end;
    Open;
  end;
end;

end.
