unit rCompoOrcamen;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppBands, ppCtrls,
  ppClass, ppVar, ppPrnabl, ppCache, ppProd, ppReport, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBClient, uCMClientDataSet,
  uCmSqlParams, TXRB;

type
  TrptCompoOrcamen = class(TFrmCmReport)
    sqlCompoOrcamen: TCMSqlParams;
    cdsCompoOrcamen: TCMClientDataSet;
    cdsCompoOrcamenTIPOLINHA: TStringField;
    dsCompoOrcamen: TwwDataSource;
    pplCompoOrcamen: TppBDEPipeline;
    rpCompoOrcamen: TppReport;
    ppHeaderBand15: TppHeaderBand;
    ppLabel153: TppLabel;
    ppLine57: TppLine;
    ppLabel198: TppLabel;
    ppDetailBand22: TppDetailBand;
    rptCompoOrcamenDBText1: TppDBText;
    rptCompoOrcamenDBText2: TppDBText;
    rptCompoOrcamenDBText5: TppDBText;
    rptCompoOrcamenDBText6: TppDBText;
    rptCompoOrcamenDBText7: TppDBText;
    ppFooterBand15: TppFooterBand;
    ppLine58: TppLine;
    ppLabel201: TppLabel;
    ppCalc28: TppSystemVariable;
    ppCalc29: TppSystemVariable;
    rptCompoOrcamenGroup1: TppGroup;
    rptCompoOrcamenGroupHeaderBand1: TppGroupHeaderBand;
    rptCompoOrcamenShape1: TppShape;
    rptCompoOrcamenLabel1: TppLabel;
    rptCompoOrcamenDBText3: TppDBText;
    rptCompoOrcamenDBText4: TppDBText;
    rptCompoOrcamenLabel2: TppLabel;
    rptCompoOrcamenLabel3: TppLabel;
    rptCompoOrcamenLabel4: TppLabel;
    rptCompoOrcamenLabel5: TppLabel;
    rptCompoOrcamenLabel6: TppLabel;
    rptCompoOrcamenLine1: TppLine;
    rptCompoOrcamenGroupFooterBand1: TppGroupFooterBand;
    sqlRelatOrc: TCMSqlParams;
    cdsRelatOrc: TCMClientDataSet;
    ppLabel1: TppLabel;
    cdsCompoOrcamenNOMERELATORC: TStringField;
    cdsCompoOrcamenNOMECOMPRELATORC: TStringField;
    cdsCompoOrcamenIDCONTAORCAMEN: TStringField;
    cdsCompoOrcamenNOMECONTAORCAMEN: TStringField;
    cdsCompoOrcamenFLGINDENTACAO: TStringField;
    cdsCompoOrcamenFLGTIPOLINHA: TStringField;
    cdsCompoOrcamenNUMDECIMAIS: TFloatField;
    procedure sqlCompoOrcamenFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure cdsCompoOrcamenCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptCompoOrcamen: TrptCompoOrcamen;

implementation

{$R *.DFM}

procedure TrptCompoOrcamen.sqlCompoOrcamenFormartParam(sParamName,
  sOldValue: String; var sNewValue: String);
begin
  inherited;
  sNewValue := sOldValue;
end;

procedure TrptCompoOrcamen.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with sqlRelatOrc do begin
    Prepare;
    ParamByName('IDRELATORC').AsInteger := CmpRptCM.ParamValues[0].AsInteger;
    Open;
  end;
  with sqlCompoOrcamen do begin
    Prepare;
    if not cdsRelatOrc.IsEmpty then begin
      ParamByName('IDRELATORC').AsString := '(R.IDRELATORC = ' +
                              Trim(CmpRptCM.ParamValues[0].AsString) + ') AND ';
      ppLabel1.Visible := False;
    end else begin
      ParamByName('IDRELATORC').AsString := '(1 = 1) AND ';
      ppLabel1.Visible := True;
    end;
    Open;
  end;
  cdsRelatOrc.Close;
end;

procedure TrptCompoOrcamen.cdsCompoOrcamenCalcFields(DataSet: TDataSet);
begin
  inherited;
  with cdsCompoOrcamen do begin
    if FieldByName('FLGTIPOLINHA').asString = 'E' then
      FieldByName('TIPOLINHA').asString := 'Com espaçamento entre as linhas';
    if FieldByName('FLGTIPOLINHA').asString = 'F' then
      FieldByName('TIPOLINHA').asString := 'Desenha uma linha fina';
    if FieldByName('FLGTIPOLINHA').asString = 'G' then
      FieldByName('TIPOLINHA').asString := 'Desenha uma linha grossa';
    if FieldByName('FLGTIPOLINHA').asString = 'D' then
      FieldByName('TIPOLINHA').asString := 'Desenha uma linha dupla';
  end;
end;

end.
