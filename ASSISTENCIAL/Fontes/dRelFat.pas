unit dRelFat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppDB, ppModule, raCodMod, ppBands, ppClass, ppVar, ppCtrls,
  ppPrnabl, ppCache, ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc,
  ppComm, ppRelatv, ppDBPipe, ppDBBDE;

type
  TdtmRelFat = class(TdtmReports)
    qryRelFat: TwwQuery;
    DsRelFat: TwwDataSource;
    ppPipeRelFat: TppBDEPipeline;
    ppRrelFat: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDBImage1: TppDBImage;
    ppLabel22: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppLine18: TppLine;
    ppDetailBand1: TppDetailBand;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppLine19: TppLine;
    ppLine21: TppLine;
    ppLine23: TppLine;
    ppLine26: TppLine;
    ppLabel24: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLine27: TppLine;
    ppLine28: TppLine;
    ppLine29: TppLine;
    ppLine30: TppLine;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLine31: TppLine;
    ppLine32: TppLine;
    ppLine33: TppLine;
    ppLine34: TppLine;
    ppLine35: TppLine;
    ppLine36: TppLine;
    ppLabel42: TppLabel;
    ppLine37: TppLine;
    ppLine38: TppLine;
    ppLabel37: TppLabel;
    ppDBText12: TppDBText;
    ppLine41: TppLine;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText21: TppDBText;
    ppVariable2: TppVariable;
    ppVariable3: TppVariable;
    ppVariable4: TppVariable;
    ppVariable5: TppVariable;
    ppFooterBand1: TppFooterBand;
    ppLabel51: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLine40: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLine39: TppLine;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppLabel43: TppLabel;
    ppDBText18: TppDBText;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppGroupFooterBand3: TppGroupFooterBand;
    dsFundacao: TwwDataSource;
    qryFundacao: TwwQuery;
    ppPipeFundacao: TppBDEPipeline;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppDBText22: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBText23: TppDBText;
  private
    { Private declarations }
  public
    { Public declarations }
    function MostraParam(Form: string): boolean; override;
  end;

var
  dtmRelFat: TdtmRelFat;

implementation
{$R *.DFM}
uses FFiltroRelFatura;


function TdtmRelFat.MostraParam(Form: string): boolean;
var frm : TForm;
begin
 if UPPERCASE(Form)= 'FRMFILTRORELFATURA' then
   frm := TFrmFiltroRelFatura.Create(Application)
 else
    frm := nil;

 if frm = nil then
    Result := true
 else
 begin
   with frm do
   begin
     Result := (ShowModal = mrOk);
     free;
   end;
 end;
end;

// FERNANDO P.15189 e P.15242 e P.16262 - INICIO
// ALTEREI O  SQL DA QUERY QRYRELFAT
// FERNANDO P.15189 e P.15242 e P.16262- FIM

end.
