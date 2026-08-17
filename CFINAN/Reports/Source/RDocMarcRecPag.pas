unit RDocMarcRecPag;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, uCmSqlParams, Db,
  DBClient, uCMClientDataSet, ppDB, ppDBPipe, ppDBBDE, Wwdatsrc, ppCtrls,
  ppBands, ppVar, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd,
  ppReport, TXRB;

type
  TRptDocMarcRecPag = class(TFrmCmReport)
    cdsDocMarcRecPag: TCMClientDataSet;
    spDocMarcRecPag: TCMSqlParams;
    rpDocMarcRecPag: TppReport;
    ppHeaderBand8: TppHeaderBand;
    ppLabel16: TppLabel;
    ppLblEmpresa: TppLabel;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLabel18: TppLabel;
    ppLabel20: TppLabel;
    ppLabel23: TppLabel;
    ppLabel27: TppLabel;
    rpDispFinancLabel1: TppLabel;
    rpDispFinancLabel2: TppLabel;
    ppDetailBand9: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText5: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    rpDispFinancDBText2: TppDBText;
    ppFooterBand9: TppFooterBand;
    ppLblSistema: TppLabel;
    ppLine14: TppLine;
    ppCalc14: TppSystemVariable;
    ppCalc15: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    rpDispFinancLabel3: TppLabel;
    rpDispFinancDBCalc1: TppDBCalc;
    dsDocMarcRecPag: TwwDataSource;
    pplDocMarcRecPag: TppBDEPipeline;
    ppDBText2: TppDBText;

    procedure CrmRptCMBeforePrint(Sender: TObject);


  private { Private declarations }


  public  { Public declarations }


  end;



var
  RptDocMarcRecPag: TRptDocMarcRecPag;



implementation
{$R *.DFM}



procedure TRptDocMarcRecPag.CrmRptCMBeforePrint(Sender: TObject);
begin
   inherited;
   spDocMarcRecPag.Prepare;
   spDocMarcRecPag.ParamByName('IDPessoa').AsFloat:=CrmRptCM.IdEmpresa;
   spDocMarcRecPag.ParamByName('DataRef').AsString:=
        FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[0].AsDateTime);
   spDocMarcRecPag.Open;
end;



end.
