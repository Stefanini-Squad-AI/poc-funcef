unit rConfIRRFAna;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, DBClient, uCMClientDataSet, uCmSqlParams, ppBands, ppClass,
  ppVar, ppCtrls, ppPrnabl, ppCache, ppProd, ppReport, ppDB, ppComm,
  ppRelatv, ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBTables, Wwquery,
  uCmRptManager, TXComp, CmParamReport;

type
  TfrmRptConfIRRFAna = class(TFrmCmReport)
    dsConfIRRFAna: TwwDataSource;
    pplConfIRRFAna: TppBDEPipeline;
    pplConfIRRFAnappField1: TppField;
    pplConfIRRFAnappField2: TppField;
    pplConfIRRFAnappField3: TppField;
    pplConfIRRFAnappField4: TppField;
    pplConfIRRFAnappField5: TppField;
    pplConfIRRFAnappField6: TppField;
    pplConfIRRFAnappField7: TppField;
    pplConfIRRFAnappField8: TppField;
    pplConfIRRFAnappField9: TppField;
    pplConfIRRFAnappField10: TppField;
    pplConfIRRFAnappField11: TppField;
    pplConfIRRFAnappField12: TppField;
    pplConfIRRFAnappField13: TppField;
    pplConfIRRFAnappField14: TppField;
    pplConfIRRFAnappField15: TppField;
    pplConfIRRFAnappField16: TppField;
    rpConfIRRFAna: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLabel59: TppLabel;
    ppLine10: TppLine;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    lblConfIRRFAnaPeriodo: TppLabel;
    ppDetailBand7: TppDetailBand;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    ppLabel84: TppLabel;
    ppLine15: TppLine;
    ppSystemVariable2: TppSystemVariable;
    ppVariable1: TppVariable;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText18: TppDBText;
    ppLabel86: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppLine16: TppLine;
    ppLabel85: TppLabel;
    ppDBText57: TppDBText;
    ppDBText58: TppDBText;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppLine14: TppLine;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppDBText23: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText24: TppDBText;
    ppGroupFooterBand5: TppGroupFooterBand;
    sqlAux: TCMSqlParams;
    sqlConfIRRFAna: TCMSqlParams;
    cdsAux: TCMClientDataSet;
    cdsConfIRRFAna: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRptConfIRRFAna: TfrmRptConfIRRFAna;

implementation

{$R *.DFM}

procedure TfrmRptConfIRRFAna.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  SqlAux.Prepare;
  sqlAux.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
  SqlAux.Open;
  //
  lblConfIRRFAnaPeriodo.caption := 'Período: '+CmpRptCM.ParamValues[1].AsString+' a '+CmpRptCM.ParamValues[2].AsString;
  sqlConfIRRFAna.Prepare;
  sqlConfIRRFAna.ParamByName('NUMDOCUMENTO').AsString := Copy(cdsAux.fieldByname('NUMDOCUMENTO').AsString,1,8);
  sqlConfIRRFAna.ParamByName('DATAINI').AsString      := CmpRptCM.ParamValues[1].AsString;
  sqlConfIRRFAna.ParamByName('DATAFIM').AsString      := CmpRptCM.ParamValues[2].AsString;
  if Trim(CmpRptCM.ParamValues[0].AsString) <> '' then
     sqlConfIRRFAna.ParamByName('PNOMEBENEF').Asstring := CmpRptCM.ParamValues[0].AsString + '%'
  else
     sqlConfIRRFAna.ParamByName('PNOMEBENEF').Asstring := '%';
  sqlConfIRRFAna.Open;
end;

end.
