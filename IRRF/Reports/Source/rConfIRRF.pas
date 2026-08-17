unit rConfIRRF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, DBClient, uCMClientDataSet, uCmSqlParams, ppBands, ppClass,
  ppVar, ppCtrls, ppPrnabl, ppCache, ppProd, ppReport, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBTables, Wwquery, uCmRptManager,
  TXComp, CmParamReport;

type
  TfrmRptConfIRRF = class(TFrmCmReport)
    dsConfIRRF: TwwDataSource;
    pplConfIRRF: TppBDEPipeline;
    rpConfIRRF: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppLabel67: TppLabel;
    ppLine11: TppLine;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    lblConfIRRFPeriodo: TppLabel;
    ppDetailBand8: TppDetailBand;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppFooterBand4: TppFooterBand;
    ppSystemVariable3: TppSystemVariable;
    ppLabel75: TppLabel;
    ppLine12: TppLine;
    ppSystemVariable4: TppSystemVariable;
    ppVariable2: TppVariable;
    ppGroup8: TppGroup;
    ppGroupHeaderBand8: TppGroupHeaderBand;
    ppLine17: TppLine;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppLine13: TppLine;
    ppGroupFooterBand8: TppGroupFooterBand;
    sqlConfIRRF: TCMSqlParams;
    cdsAux: TCMClientDataSet;
    cdsConfIRRF: TCMClientDataSet;
    sqlAux: TCMSqlParams;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRptConfIRRF: TfrmRptConfIRRF;

implementation

{$R *.DFM}

procedure TfrmRptConfIRRF.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  SqlAux.Prepare;
  sqlAux.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
  SqlAux.Open;
  //
  lblConfIRRFPeriodo.caption    := 'Período: '+CmpRptCM.ParamValues[1].AsString+' a '+CmpRptCM.ParamValues[2].AsString;
  //
  SqlConfIRRF.Prepare;
  sqlConfIRRF.ParamByName('NUMDOCUMENTO').AsString := Copy(cdsAux.fieldByname('NUMDOCUMENTO').AsString,1,8);
  sqlConfIRRF.ParamByName('DATAINI').AsString      := CmpRptCM.ParamValues[1].AsString;
  sqlConfIRRF.ParamByName('DATAFIM').AsString      := CmpRptCM.ParamValues[2].AsString;
  if Trim(CmpRptCM.ParamValues[0].AsString) <> '' then
     sqlConfIRRF.ParamByName('PNOMEBENEF').Asstring := CmpRptCM.ParamValues[0].AsString + '%'
  else
     sqlConfIRRF.ParamByName('PNOMEBENEF').Asstring := '%';

  sqlConfIRRF.Open;
  //
end;

end.
