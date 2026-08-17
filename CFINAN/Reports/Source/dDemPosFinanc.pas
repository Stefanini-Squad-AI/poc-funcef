unit dDemPosFinanc;

{**********************************************************}
{  Autor     : Rodolpho da Silva                           }
{  Data      : 29/04/2005                                  }
{  Pendência : 17761                                       }
{**********************************************************}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, DBClient, uCMClientDataSet, uCmSqlParams, ppStrtch,
  ppSubRpt;

type
  TdtmDemPosFinanc = class(TdtmReports)
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel1: TppLabel;
    SqlMestre: TCMSqlParams;
    CdsMestre: TCMClientDataSet;
    SqlDetalhe: TCMSqlParams;
    CdsDetalhe: TCMClientDataSet;
    lbData: TppLabel;
    ppShape1: TppShape;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppSubReport2: TppSubReport;
    ppChildReport1: TppChildReport;
    pplDetalhe: TppBDEPipeline;
    dsDetalhe: TwwDataSource;
    ppTitleBand1: TppTitleBand;
    ppDetailBand1: TppDetailBand;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLine3: TppLine;
    rptDemonst: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLine4: TppLine;
    ppLabel2: TppLabel;
    ppLabel5: TppLabel;
    ppLine5: TppLine;
    ppLine6: TppLine;
    lbPortador: TppLabel;
    lbDataFinal: TppLabel;
    ppDetailBand2: TppDetailBand;
    shpLinhaDest: TppShape;
    lbStatus: TppDBText;
    ppSubReport: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppDetailBand3: TppDetailBand;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    lnSeparadora: TppLine;
    ppFooterBand1: TppFooterBand;
    ppLine8: TppLine;
    ppLabel8: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    pplMestre: TppBDEPipeline;
    dsMestre: TwwDataSource;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppShape2: TppShape;
    LinhaDrilDraw: TppLine;

    procedure rpExemploStartPage(Sender: TObject);
    procedure rpExemploEndPage(Sender: TObject);
    procedure ppSubReportPrint(Sender: TObject);


  private { Private declarations }


  public  { Public declarations }

    bMostraLinhaSeparadora : boolean;
    cCorLinhaSeparadora    : TColor;

    function MostraParam(Form: string): boolean; override;


  end;




var
  dtmDemPosFinanc: TdtmDemPosFinanc;



implementation
{$R *.DFM}
uses
  cDemPosFinanc;




procedure TdtmDemPosFinanc.rpExemploStartPage(Sender: TObject);
begin
  inherited;
  CdsDetalhe.Filtered      := true;
  shpLinhaDest.Brush.Color := cCorLinhaSeparadora;
  lnSeparadora.Visible     := bMostraLinhaSeparadora;
end;




procedure TdtmDemPosFinanc.rpExemploEndPage(Sender: TObject);
begin
  inherited;
  CdsDetalhe.Filtered := false;
end;




function TdtmDemPosFinanc.MostraParam(Form: string): boolean;
var
   frm : TForm;
   
begin
   if (LowerCase(Form) = 'cfgdemposfinanc') then
   begin
      frm := TcfgDemPosFinanc.Create(Application);
   end
   else
   begin
      frm := nil;
   end;

   if frm = nil then begin
      Result := False;
      Exit;
   end;

   with frm do begin
      Result := (ShowModal = mrOk);
      Free;
   end;
end;




procedure TdtmDemPosFinanc.ppSubReportPrint(Sender: TObject);
begin
  inherited;
  CdsDetalhe.Filter := 'STATUSCONCILIA=' + QuotedStr(CdsMestre.FieldByName('STATUSCONCILIA').AsString);
end;



end.
