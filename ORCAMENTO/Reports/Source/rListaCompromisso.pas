unit rListaCompromisso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppCtrls, ppBands, ppVar,
  ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams,
  MontaSelect, TXRB;

type
  TrptListaCompromisso = class(TFrmCmReport)
    sqlListaCompromisso: TCMSqlParams;
    cdsListaCompromisso: TCMClientDataSet;
    dsListaCompromisso: TwwDataSource;
    pplListaCompromisso: TppBDEPipeline;
    pplListaCompromissoppField1: TppField;
    pplListaCompromissoppField2: TppField;
    pplListaCompromissoppField3: TppField;
    pplListaCompromissoppField4: TppField;
    pplListaCompromissoppField5: TppField;
    pplListaCompromissoppField6: TppField;
    pplListaCompromissoppField7: TppField;
    pplListaCompromissoppField8: TppField;
    pplListaCompromissoppField9: TppField;
    pplListaCompromissoppField10: TppField;
    pplListaCompromissoppField11: TppField;
    pplListaCompromissoppField12: TppField;
    pplListaCompromissoppField13: TppField;
    pplListaCompromissoppField14: TppField;
    pplListaCompromissoppField15: TppField;
    pplListaCompromissoppField16: TppField;
    pplListaCompromissoppField17: TppField;
    pplListaCompromissoppField18: TppField;
    pplListaCompromissoppField19: TppField;
    pplListaCompromissoppField20: TppField;
    pplListaCompromissoppField21: TppField;
    rpListaCompromisso: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppLabel23: TppLabel;
    ppLine11: TppLine;
    ppLabel24: TppLabel;
    ppLabel30: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLine12: TppLine;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel277: TppLabel;
    ppLabel283: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    rptListaCompromissoDBText1: TppDBText;
    ppDBText155: TppDBText;
    ppFooterBand5: TppFooterBand;
    ppLine13: TppLine;
    ppLabel43: TppLabel;
    ppCalc8: TppSystemVariable;
    ppCalc9: TppSystemVariable;
    rptListaCompromissoSummaryBand1: TppSummaryBand;
    rptListaCompromissoDBCalc1: TppDBCalc;
    rptListaCompromissoLine1: TppLine;
    rptListaCompromissoLabel1: TppLabel;
    rptListaCompromissoDBCalc2: TppDBCalc;
    rptListaCompromissoLabel2: TppLabel;
    ppDBCalc19: TppDBCalc;
    procedure sqlListaCompromissoFormartParam(sParamName,
      sOldValue: String; var sNewValue: String);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptListaCompromisso: TrptListaCompromisso;

implementation

uses uSistema;

{$R *.DFM}

procedure TrptListaCompromisso.sqlListaCompromissoFormartParam(sParamName,
  sOldValue: String; var sNewValue: String);
begin
  inherited;
  if (sParamName <> 'IDPESSOA') then
    sNewValue := sOldValue;
end;

procedure TrptListaCompromisso.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with sqlListaCompromisso do begin
    Prepare;
//******************************************************************************
    ParamByName('IDPESSOA').AsInteger := sistema.IdEmpresa;
//******************************************************************************
    ParamByName('DATAINI').AsString := 'TO_DATE(''' +
                                       FormatDateTime('dd/mm/yyyy',
                                       CmpRptCM.ParamValues[0].AsDateTime) +
                                       ''',''DD/MM/YYYY'')';
//******************************************************************************
    ParamByName('DATAFIM').AsString := 'TO_DATE(''' +
                                       FormatDateTime('dd/mm/yyyy',
                                       CmpRptCM.ParamValues[1].AsDateTime) +
                                       ''',''DD/MM/YYYY'')';
//******************************************************************************
    if Trim(CmpRptCM.ParamValues[2].AsString) <> '' then
      ParamByName('IDCONTAORCAMEN').AsString := 'AND (R.IDCONTAORCAMEN = ''' +
                                Trim(CmpRptCM.ParamValues[2].AsString) + ''') '
    else
      ParamByName('IDCONTAORCAMEN').AsString := 'AND (1 = 1) ';
//******************************************************************************
    if (CmpRptCM.ParamValues[4].AsBoolean) and
       (CmpRptCM.ParamValues[5].AsBoolean) and
       (CmpRptCM.ParamValues[8].AsBoolean) then
      ParamByName('STATUS').AsString :=
                      'AND ((R.FLGRESERVA = ''E'') OR (R.FLGRESERVA = ''C'') OR (R.FLGRESERVA = ''A'')) '
    else
      if (CmpRptCM.ParamValues[4].AsBoolean) then
        ParamByName('STATUS').AsString := 'AND (R.FLGRESERVA = ''E'') '
      else
        if (CmpRptCM.ParamValues[5].AsBoolean) then
          ParamByName('STATUS').AsString := 'AND (R.FLGRESERVA = ''C'') '
        else
          if (CmpRptCM.ParamValues[8].AsBoolean) then
            ParamByName('STATUS').AsString := 'AND (R.FLGRESERVA = ''A'') '
          else
            ParamByName('STATUS').AsString := 'AND (1 = 1) ';
//******************************************************************************
    Case CmpRptCM.ParamValues[6].AsInteger of
      0 : ParamByName('ORDENACAO').AsString := 'ORDER BY R.NUMRESERVA';
      1 : ParamByName('ORDENACAO').AsString := 'ORDER BY R.IDCONTAORCAMEN';
      2 : ParamByName('ORDENACAO').AsString := 'ORDER BY C.NOMECONTAORCAMEN';
      3 : ParamByName('ORDENACAO').AsString := 'ORDER BY R.DATAREFERENCIA';
      4 : ParamByName('ORDENACAO').AsString := 'ORDER BY R.VLRRESERVA';
      5 : ParamByName('ORDENACAO').AsString := 'ORDER BY R.FLGRESERVA';
    end;
//******************************************************************************
    Case CmpRptCM.ParamValues[7].AsInteger of
      0 : ParamByName('CONTAS').AsString := 'AND (1 = 1) ';
      1 : ParamByName('CONTAS').AsString :=
                          'AND ((C.FLGATIVA = ''A'') OR (C.FLGATIVA IS NULL)) ';
      2 : ParamByName('CONTAS').AsString :=
                    'AND ((C.FLGATIVA <> ''A'') AND (C.FLGATIVA IS NOT NULL)) ';
    end;
//******************************************************************************
    Open;
  end;
end;

end.
