unit rListaTransf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppCtrls, ppBands, ppVar,
  ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams,
  MontaSelect, TXRB;

type
  TrptListaTransf = class(TFrmCmReport)
    sqlListaTransf: TCMSqlParams;
    cdsListaTransf: TCMClientDataSet;
    dsListaTransf: TwwDataSource;
    pplListaTransf: TppBDEPipeline;
    rpListaTransf: TppReport;
    ppHeaderBand6: TppHeaderBand;
    ppLabel44: TppLabel;
    ppLine14: TppLine;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    rptListaTransfLabel1: TppLabel;
    rptListaTransfLabel2: TppLabel;
    rptListaTransfLabel3: TppLabel;
    rptListaTransfLabel4: TppLabel;
    rptListaTransfLabel5: TppLabel;
    rptListaTransfLabel6: TppLabel;
    rptListaTransfLabel7: TppLabel;
    rptListaTransfLabel8: TppLabel;
    rptListaTransfLabel9: TppLabel;
    rptListaTransfLabel10: TppLabel;
    rptListaTransfLine1: TppLine;
    ppDetailBand6: TppDetailBand;
    ppDBText16: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText21: TppDBText;
    rptListaTransfDBText1: TppDBText;
    rptListaTransfDBText2: TppDBText;
    rptListaTransfDBText3: TppDBText;
    rptListaTransfDBText4: TppDBText;
    rptListaTransfDBText5: TppDBText;
    ppFooterBand6: TppFooterBand;
    ppLine16: TppLine;
    ppLabel58: TppLabel;
    ppCalc10: TppSystemVariable;
    ppCalc11: TppSystemVariable;
    rptListaTransfSummaryBand1: TppSummaryBand;
    rptListaTransfDBCalc1: TppDBCalc;
    rptListaTransfLine2: TppLine;
    rptListaTransfLabel11: TppLabel;
    rptListaTransfDBCalc2: TppDBCalc;
    rptListaTransfLabel12: TppLabel;
    procedure sqlListaTransfFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptListaTransf: TrptListaTransf;

implementation

uses uSistema;

{$R *.DFM}

procedure TrptListaTransf.sqlListaTransfFormartParam(sParamName,
  sOldValue: String; var sNewValue: String);
begin
  inherited;
  if (sParamName <> 'IDPESSOA') then
    sNewValue := sOldValue;
end;

procedure TrptListaTransf.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with sqlListaTransf do begin
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
      ParamByName('IDCONTAORIGEM').AsString := 'AND (IDCONTAORIGEM = ''' +
                                Trim(CmpRptCM.ParamValues[2].AsString) + ''') '
    else
      ParamByName('IDCONTAORIGEM').AsString := 'AND (1 = 1) ';
    if Trim(CmpRptCM.ParamValues[4].AsString) <> '' then
      ParamByName('IDCONTADESTINO').AsString := 'AND (IDCONTADESTINO = ''' +
                                Trim(CmpRptCM.ParamValues[4].AsString) + ''') '
    else
      ParamByName('IDCONTADESTINO').AsString := 'AND (1 = 1) ';
    Case CmpRptCM.ParamValues[6].AsInteger of
      0 : ParamByName('ORDENACAO').AsString := 'ORDER BY NUMALTERACAO';
      1 : ParamByName('ORDENACAO').AsString := 'ORDER BY IDCONTAORIGEM';
      2 : ParamByName('ORDENACAO').AsString := 'ORDER BY IDCONTADESTINO';
      3 : ParamByName('ORDENACAO').AsString := 'ORDER BY DATAREFERENCIA';
      4 : ParamByName('ORDENACAO').AsString := 'ORDER BY VLRSOLICITADO';
    end;
    Open;
  end;
end;

end.
