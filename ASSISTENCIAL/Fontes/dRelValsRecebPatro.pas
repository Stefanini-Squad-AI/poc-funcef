unit dRelValsRecebPatro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE;

type
  TdtmRelValsRecebPatro = class(TdtmReports)
    qryRelValRecebPatro: TwwQuery;
    DsValRecebPatro: TwwDataSource;
    ppDBPipeValRecebPatro: TppDBPipeline;
    ppReportValRecebPatro: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppShape1: TppShape;
    ppSummaryBand1: TppSummaryBand;
    ppLabel8: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppDBCalc2: TppDBCalc;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppPipeFundacao: TppBDEPipeline;
    ppPipeFundacaoppField1: TppField;
    ppPipeFundacaoppField2: TppField;
    ppPipeFundacaoppField3: TppField;
    ppPipeFundacaoppField4: TppField;
    ppPipeFundacaoppField5: TppField;
    ppPipeFundacaoppField6: TppField;
    ppPipeFundacaoppField7: TppField;
    ppPipeFundacaoppField8: TppField;
    ppPipeFundacaoppField9: TppField;
    ppPipeFundacaoppField10: TppField;
    dsFundacao: TwwDataSource;
    qryFundacao: TwwQuery;
    ppDBImage1: TppDBImage;
    ppDBText8: TppDBText;
    ppDBText7: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppLabel22: TppLabel;
    ppDBText14: TppDBText;
    ppLine6: TppLine;
    ppLabel9: TppLabel;
    procedure ppShape1Print(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function MostraParam(Form: string): boolean; override;
  end;

var
  dtmRelValsRecebPatro: TdtmRelValsRecebPatro;

implementation
uses fParamRelValRecebPatro;
{$R *.DFM}


function TdtmRelValsRecebPatro.MostraParam(Form: string): boolean;
var frm : TForm;
begin
 if UPPERCASE(Form)= 'FRMPARAMRELVALRECEBPATRO' then
   frm := TfrmParamRelValRecebPatro.Create(Application)
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


procedure TdtmRelValsRecebPatro.ppShape1Print(Sender: TObject);
begin
  inherited;
  if ppShape1.Brush.color = ClWhite then
    ppShape1.Brush.color := clInfoBK
  else
    ppShape1.Brush.color := ClWhite;
end;

end.
