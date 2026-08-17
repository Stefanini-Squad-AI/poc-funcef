unit dRelBenefINSS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, TeEngine, Series, ExtCtrls, TeeProcs, Chart, ppChrtDP,
  ppChrt;

type
  TdtmRelBenefINSS = class(TdtmReports)
    qryRelBenefINSS: TwwQuery;
    dsRelBenefINSS: TwwDataSource;
    ppRelBenefINSS: TppBDEPipeline;
    rpRelBenefINSS: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel183: TppLabel;
    ppDBText135: TppDBText;
    ppLabel175: TppLabel;
    ppLabel176: TppLabel;
    ppLabel184: TppLabel;
    ppLine85: TppLine;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLine1: TppLine;
    ppDPTeeChart1: TppDPTeeChart;
    Series1: TBarSeries;
    ppLine2: TppLine;
    ppDBCalc1: TppDBCalc;
    ppLabel3: TppLabel;
    rpRelaEntSaiFolhaDBImage1: TppDBImage;
    rpRelaEntSaiFolhaDBText7: TppDBText;
    rpRelaEntSaiFolhaDBText10: TppDBText;
    rpRelaEntSaiFolhaDBText9: TppDBText;
    rpRelaEntSaiFolhaDBText8: TppDBText;
    rpRelaEntSaiFolhaDBText1: TppDBText;
    ppLine3: TppLine;
    ppLabel4: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    function MostraParam(Form: string): boolean; override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmRelBenefINSS: TdtmRelBenefINSS;

implementation

uses UMensErro, dbaseDados, dRelFolha, UAdmPrevFB, FFILTRORELBENEFINSS;

{$R *.DFM}

function TdtmRelBenefINSS.MostraParam(Form: string): boolean;
 var frm: TForm;
begin
  if UPPERCASE(Form) = 'FRMFILTRORELBENEFINSS' then frm := TFRMFILTRORELBENEFINSS.Create(Application)
  else
    frm:=nil;

  if frm = nil then
    Result:= true
  else
  begin
    with frm do
    begin
      Result:= (ShowModal = mrOk);
      free;
    end;
  end;
end;




end.
