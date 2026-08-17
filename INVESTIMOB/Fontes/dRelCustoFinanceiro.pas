unit dRelCustoFinanceiro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppPrnabl, ppClass,
  ppCtrls, ppBands, ppCache, ppDB, ppProd, ppReport, Db, Wwdatsrc, ppComm,
  ppRelatv, ppDBPipe, ppDBBDE, DBClient, uCMClientDataSet, Provider,
  DBTables, Wwquery;

type
  TdtmRelCustoFinanceiro = class(TFrmCmReport)
    qryCustoFinanceiro: TwwQuery;
    dspCustoFinanceiro: TDataSetProvider;
    cdsCustoFinanceiro: TCMClientDataSet;
    qryCustoFinanceiroCODTIPIMOVEL: TStringField;
    qryCustoFinanceiroDESCTIPOIMOVEL: TStringField;
    cdsCustoFinanceiroCODTIPIMOVEL: TStringField;
    cdsCustoFinanceiroDESCTIPOIMOVEL: TStringField;
    pplCustoFinanceiro: TppBDEPipeline;
    dsCustoFinanceiro: TwwDataSource;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    procedure CrmRptCMChangeDataBaseName(Sender: TObject;
      sDataBaseName: String);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmRelCustoFinanceiro: TdtmRelCustoFinanceiro;

implementation

uses uDataBase;

{$R *.DFM}

procedure TdtmRelCustoFinanceiro.CrmRptCMChangeDataBaseName(
  Sender: TObject; sDataBaseName: String);
begin
   inherited;
   ChangeDataBaseName([qryCustoFinanceiro], sDataBaseName);
end;

procedure TdtmRelCustoFinanceiro.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  cdsCustoFinanceiro.ParamByName('CODTIPIMOVEL').AsString := CmpRptCM.ParamValues[0].AsString;
  cdsCustoFinanceiro.Open;
end;

end.
