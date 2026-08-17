unit dRelParamAtivo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, DBClient, dLookCota, uCMClientDataSet, ppStrtch,
  ppSubRpt;

type
  TdtmRelParamAtivo = class(TdtmReports)
    CdsParamAtivo: TCMClientDataSet;
    pplParamAtivo: TppDBPipeline;
    rptParamAtivo: TppReport;
    pplDadosEmpresa: TppDBPipeline;
    dsParamAtivo: TwwDataSource;
    ppHeaderBand1: TppHeaderBand;
    ppDbLogo: TppDBImage;
    ppLabel13: TppLabel;
    ppLabel12: TppLabel;
    ppLine4: TppLine;
    ppLbDescAtivo: TppLabel;
    ppLbDescOperacao: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppShpRelatorio: TppShape;
    ppDbAumDim: TppDBText;
    ppDbDescAtivo: TppDBText;
    ppDbDescOperacao: TppDBText;
    ppDBText4: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLinhaSepar: TppLine;
    ppLbAtivo: TppLabel;
    ppDbDescItemEmptmo: TppDBText;
    ppLbDescItemEmptmo: TppLabel;
    procedure ppLabel12Print(Sender: TObject);
    procedure rptParamAtivoStartPage(Sender: TObject);
    procedure ppShpRelatorioPrint(Sender: TObject);
    procedure ppShpSubRelatPrint(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    cCorZebra : TColor;
    function MostraParam(Form: string): boolean; override;

  end;

var
  dtmRelParamAtivo: TdtmRelParamAtivo;

implementation

uses cRelParamAtivo;

{$R *.DFM}

procedure TdtmRelParamAtivo.ppLabel12Print(Sender: TObject);
begin
  inherited;
  TppLabel(Sender).Caption := TppHeaderBand(TppLabel(Sender).Parent).report.printersetup.documentname;
end;

procedure TdtmRelParamAtivo.rptParamAtivoStartPage(
  Sender: TObject);
begin
  inherited;
  ppShpRelatorio.Brush.Color := clWhite;

end;

procedure TdtmRelParamAtivo.ppShpRelatorioPrint(Sender: TObject);
begin
  inherited;
  if TppShape(Sender).Brush.Color = clWhite then
     TppShape(Sender).Brush.Color := cCorZebra
  else
     TppShape(Sender).Brush.Color := clWhite;
end;

procedure TdtmRelParamAtivo.ppShpSubRelatPrint(Sender: TObject);
begin
  inherited;
  if TppShape(Sender).Brush.Color = clWhite then
     TppShape(Sender).Brush.Color := cCorZebra
  else
     TppShape(Sender).Brush.Color := clWhite;
end;


function TdtmRelParamAtivo.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   if (LowerCase(Form) = 'cfgrelparamativo') then
   begin

      frm := TcfgRelParamAtivo.Create(Application);
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

end.
