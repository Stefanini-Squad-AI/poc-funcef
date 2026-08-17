unit dRelTempoServico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, DBTables, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, Grids, DBGrids, ppModule, raCodMod;

type
  TdtmTempoServico = class(TdtmReports)
    ppTempoServico: TppBDEPipeline;
    dsTempoServico: TwwDataSource;
    qryTempoServico: TwwQuery;
    ppRTempoServico: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    updTS: TUpdateSQL;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText5: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel7: TppLabel;
    ppLabel9: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppDBText4: TppDBText;
    ppDBText14: TppDBText;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel21: TppLabel;
    pplblDescTempo: TppLabel;
    ppFundacao: TppBDEPipeline;
    dsFundacao: TwwDataSource;
    qryFundacao: TwwQuery;
    rpResumoCobrDBImage1: TppDBImage;
    rpResumoCobrDBText1: TppDBText;
    rpResumoCobrDBText2: TppDBText;
    rpResumoCobrDBText3: TppDBText;
    rpResumoCobrDBText11: TppDBText;
    rpResumoCobrLabel10: TppLabel;
    rpResumoCobrDBText14: TppDBText;
    rpResumoCobrDBText12: TppDBText;
    rpResumoCobrDBText13: TppDBText;
    rpResumoCobrDBText10: TppDBText;
    ppLabel2: TppLabel;
    ppLabel23: TppLabel;
    ppDBText15: TppDBText;
    ppShape1: TppShape;
    ppLinha: TppShape;
    ppLine1: TppLine;
    ppLabel22: TppLabel;
    ppDBText16: TppDBText;
    ppLabel24: TppLabel;
    ppDBText17: TppDBText;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    lblDataRef: TppLabel;
    function  MostraParam(Form: string): boolean; Override;
    procedure ppDetailBand1BeforePrint(Sender: TObject);
    procedure ppGroupHeaderBand1BeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sDataReferencia : string;
  end;

var
  dtmTempoServico: TdtmTempoServico;


implementation

{$R *.DFM}

uses fPRelHisFuncional;

function TdtmTempoServico.MostraParam(Form: string): boolean;
var frm : TForm;
begin
  if (UPPERCASE(Form)      = UpperCase('frmPRelHisFuncional'))
  then frm := TfrmPRelHisFuncional.Create(Application)
  else frm := nil;

  if frm = nil
  then Result := false
  else begin
     with frm do
     begin
        Result := (ShowModal = mrOk);
        Free;
     end;
   end;
end;
procedure TdtmTempoServico.ppDetailBand1BeforePrint(Sender: TObject);
begin
  inherited;
  if ppLinha.Brush.Color = clSilver
  then ppLinha.Brush.Color := clWhite
  else ppLinha.Brush.Color := clSilver;  
end;

procedure TdtmTempoServico.ppGroupHeaderBand1BeforePrint(Sender: TObject);
begin
  inherited;
  lblDataRef.Caption := sDataReferencia;
end;

end.
