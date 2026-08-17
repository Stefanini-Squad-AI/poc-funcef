unit rListaReserva;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmSqlParams, uCmRptManager, TXComp, CmParamReport, ppCtrls,
  ppBands, ppVar, ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBClient,
  uCMClientDataSet, MontaSelect, TXRB;

type
  TrptListaReserva = class(TFrmCmReport)
    sqlListaReserva: TCMSqlParams;
    cdsListaReserva: TCMClientDataSet;
    dsListaReserva: TwwDataSource;
    pplListaReserva: TppBDEPipeline;
    rpListaReserva: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLabel15: TppLabel;
    ppLine7: TppLine;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLine9: TppLine;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    rptListaReservaLabel1: TppLabel;
    rptListaReservaLabel2: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppDBText3: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    rptListaReservaDBText1: TppDBText;
    rptListaReservaDBText2: TppDBText;
    ppFooterBand4: TppFooterBand;
    ppLine10: TppLine;
    ppLabel29: TppLabel;
    ppCalc6: TppSystemVariable;
    ppCalc7: TppSystemVariable;
    rptListaReservaSummaryBand1: TppSummaryBand;
    rptListaReservaDBCalc1: TppDBCalc;
    rptListaReservaLine1: TppLine;
    rptListaReservaLabel3: TppLabel;
    rptListaReservaDBCalc2: TppDBCalc;
    rptListaReservaLabel4: TppLabel;
    procedure sqlListaReservaFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptListaReserva: TrptListaReserva;

implementation

uses uSistema;
{$R *.DFM}

procedure TrptListaReserva.sqlListaReservaFormartParam(sParamName,
  sOldValue: String; var sNewValue: String);
begin
  inherited;
  if (sParamName <> 'IDPESSOA') then
    sNewValue := sOldValue;
end;

procedure TrptListaReserva.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with sqlListaReserva do begin
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
      ParamByName('IDCONTAORCAMEN').AsString := 'AND (R.IDCONTAORCAMEN = ''' +
                                Trim(CmpRptCM.ParamValues[2].AsString) + ''') '
    else
      ParamByName('IDCONTAORCAMEN').AsString := 'AND (1 = 1) ';
    if (CmpRptCM.ParamValues[4].AsBoolean) then
      if (CmpRptCM.ParamValues[5].AsBoolean) and
         (CmpRptCM.ParamValues[6].AsBoolean) then
        ParamByName('STATUS').AsString := 'AND ((R.FLGRESERVA = ''A'') OR ' +
                           '(R.FLGRESERVA = ''E'') OR (R.FLGRESERVA = ''C'')) '
      else
        if (CmpRptCM.ParamValues[5].AsBoolean) then
          ParamByName('STATUS').AsString := 'AND ((R.FLGRESERVA = ''A'') OR ' +
                                                     '(R.FLGRESERVA = ''E'')) '
        else
          if (CmpRptCM.ParamValues[6].AsBoolean) then
            ParamByName('STATUS').AsString := 'AND ((R.FLGRESERVA = ''A'') ' +
                                                  'OR (R.FLGRESERVA = ''C'')) '
          else
            ParamByName('STATUS').AsString := 'AND (R.FLGRESERVA = ''A'') '
    else
      if (CmpRptCM.ParamValues[5].AsBoolean) and
         (CmpRptCM.ParamValues[6].AsBoolean) then
        ParamByName('STATUS').AsString :=
                      'AND ((R.FLGRESERVA = ''E'') OR (R.FLGRESERVA = ''C'')) '
      else
        if (CmpRptCM.ParamValues[5].AsBoolean) then
          ParamByName('STATUS').AsString := 'AND (R.FLGRESERVA = ''E'') '
        else
          if (CmpRptCM.ParamValues[6].AsBoolean) then
            ParamByName('STATUS').AsString := 'AND (R.FLGRESERVA = ''C'') '
          else
            ParamByName('STATUS').AsString := 'AND (1 = 1) ';
    Case CmpRptCM.ParamValues[7].AsInteger of
      0 : ParamByName('ORDENACAO').AsString := 'ORDER BY R.NUMRESERVA';
      1 : ParamByName('ORDENACAO').AsString := 'ORDER BY R.IDCONTAORCAMEN';
      2 : ParamByName('ORDENACAO').AsString := 'ORDER BY C.NOMECONTAORCAMEN';
      3 : ParamByName('ORDENACAO').AsString := 'ORDER BY R.DATAREFERENCIA';
      4 : ParamByName('ORDENACAO').AsString := 'ORDER BY R.VLRRESERVA';
      5 : ParamByName('ORDENACAO').AsString := 'ORDER BY R.FLGRESERVA';
    end;
    Open;
  end;
end;

end.
