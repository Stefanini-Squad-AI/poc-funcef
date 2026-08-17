unit rImprimeCompromisso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppVar, ppBands, ppCtrls,
  ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams,
  TXRB;

type
  TrptImprimeCompromisso = class(TFrmCmReport)
    sqlImprimeCompromisso: TCMSqlParams;
    cdsImprimeCompromisso: TCMClientDataSet;
    dsImprimeCompromisso: TwwDataSource;
    pplImprimeCompromisso: TppBDEPipeline;
    rpImprimeCompromisso: TppReport;
    ppHeaderBand16: TppHeaderBand;
    ppLabel122: TppLabel;
    ppLine32: TppLine;
    ppLabel126: TppLabel;
    ppLabel140: TppLabel;
    ppLabel141: TppLabel;
    ppLabel142: TppLabel;
    ppLabel143: TppLabel;
    ppLabel144: TppLabel;
    ppLabel145: TppLabel;
    ppLine37: TppLine;
    ppLabel146: TppLabel;
    ppLabel147: TppLabel;
    ppLabel149: TppLabel;
    ppLabel150: TppLabel;
    ppLabel151: TppLabel;
    ppLabel154: TppLabel;
    ppDetailBand15: TppDetailBand;
    ppDBText49: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppDBText53: TppDBText;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    ppFooterBand16: TppFooterBand;
    ppLine39: TppLine;
    ppLabel155: TppLabel;
    ppCalc30: TppSystemVariable;
    ppCalc31: TppSystemVariable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptImprimeCompromisso: TrptImprimeCompromisso;

implementation

{$R *.DFM}

end.
