unit rListaRetorno;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppCtrls, ppBands, ppVar,
  ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams,
  MontaSelect, TXRB;

type
  TrptListaRetorno = class(TFrmCmReport)
    sqlListaRetorno: TCMSqlParams;
    cdsListaRetorno: TCMClientDataSet;
    dsListaRetorno: TwwDataSource;
    pplListaRetorno: TppBDEPipeline;
    rpListaRetorno: TppReport;
    ppHeaderBand12: TppHeaderBand;
    ppLabel86: TppLabel;
    ppLine21: TppLine;
    ppLabel87: TppLabel;
    ppLabel109: TppLabel;
    ppLabel110: TppLabel;
    ppLabel111: TppLabel;
    ppLabel112: TppLabel;
    ppLabel113: TppLabel;
    ppLabel114: TppLabel;
    ppLabel115: TppLabel;
    ppLabel116: TppLabel;
    ppLabel117: TppLabel;
    ppLabel118: TppLabel;
    ppLabel119: TppLabel;
    ppLabel120: TppLabel;
    ppLine30: TppLine;
    ppDetailBand12: TppDetailBand;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppFooterBand12: TppFooterBand;
    ppLine31: TppLine;
    ppLabel121: TppLabel;
    ppCalc22: TppSystemVariable;
    ppCalc23: TppSystemVariable;
    rptListaRetornoSummaryBand1: TppSummaryBand;
    rptListaRetornoDBCalc1: TppDBCalc;
    rptListaRetornoLine1: TppLine;
    rptListaRetornoLabel1: TppLabel;
    rptListaRetornoDBCalc2: TppDBCalc;
    rptListaRetornoLabel2: TppLabel;
    procedure sqlListaRetornoFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptListaRetorno: TrptListaRetorno;

implementation

uses uSistema;

{$R *.DFM}

procedure TrptListaRetorno.sqlListaRetornoFormartParam(sParamName,
  sOldValue: String; var sNewValue: String);
begin
  inherited;
  if (sParamName <> 'IDPESSOA') then
    sNewValue := sOldValue;
end;

procedure TrptListaRetorno.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with sqlListaRetorno do begin
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
      2 : ParamByName('ORDENACAO').AsString := 'ORDER BY C.NOMECONTAORCAMEN';
      3 : ParamByName('ORDENACAO').AsString := 'ORDER BY A.DATAREFERENCIA';
      4 : ParamByName('ORDENACAO').AsString := 'ORDER BY A.VLRSOLICITADO';
    end;
    Open;
  end;
end;

end.
