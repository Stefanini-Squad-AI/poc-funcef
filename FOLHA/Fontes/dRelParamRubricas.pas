unit dRelParamRubricas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, dRelFolha;

type
  TdtmRelParamRubricas = class(TdtmReports)
    qryRelParamRubricas: TwwQuery;
    ppRelParamRubricas: TppBDEPipeline;
    DsRelParamRubricas: TwwDataSource;
    RpRelParamRubricas: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBText3: TppDBText;
    ppLabel3: TppLabel;
    ppDBText4: TppDBText;
    ppDBText6: TppDBText;
    ppLabel4: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppLabel7: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLine1: TppLine;
    ppDBImage13: TppDBImage;
    ppDBText152: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText139: TppDBText;
    ppLabel8: TppLabel;
    ppDBText10: TppDBText;
    ppLabel9: TppLabel;
    ppLine5: TppLine;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppLabel10: TppLabel;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppLabel11: TppLabel;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppLine6: TppLine;
    ppLabel12: TppLabel;
    ppDBText17: TppDBText;
    ppLabel15: TppLabel;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppLabel17: TppLabel;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppLine7: TppLine;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppLabel20: TppLabel;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppLabel5: TppLabel;
    ppLine4: TppLine;
    ppLabel6: TppLabel;
    ppLabel21: TppLabel;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppLabel13: TppLabel;
    ppDBText5: TppDBText;
    function MostraParam(Form: string): boolean; override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmRelParamRubricas: TdtmRelParamRubricas;

implementation

uses FRelParamRubricas;

{$R *.DFM}


function TdtmRelParamRubricas.MostraParam(Form: string): boolean;
 var frm: TForm;
begin
  if UPPERCASE(Form) = 'FRMRELPARAMRUBRICAS' then frm := TFrmRelParamRubricas.Create(Application)
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
