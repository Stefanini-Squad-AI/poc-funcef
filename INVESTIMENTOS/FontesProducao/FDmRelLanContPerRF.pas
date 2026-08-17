//******************************************************************************
// Data      : 23/01/2006
// Alteração : AL_3
// Pendencia : 21262
// SOL       : 39834
// Motivo    : Implementação de limitação de prazo entre as datas inicial e final em 30 dias
//             Diminuição no processamento da query, passando a resolução para
//               dentro da query basica.
//******************************************************************************

unit FDmRelLanContPerRF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE;

type
  TDmRelLanContPerRF = class(TDmRelatoriosInv)
    dsLanContPerRF: TwwDataSource;
    pplLanContRF: TppBDEPipeline;
    pprLanContPerRF: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    shpCabecalho: TppShape;
    pplblInvestimento: TppLabel;
    pplblPlanilha: TppLabel;
    pplblHistorico: TppLabel;
    pplblVlrLancto: TppLabel;
    pplblDtAplicacao: TppLabel;
    ppdbPlnPlanil: TppDBText;
    ppDBText7: TppDBText;
    ppdbValLanc: TppDBText;
    updLanContPerRF: TUpdateSQL;
    rptRenFixSaldoTitulo: TppLabel;
    ppLabel16: TppLabel;
    pplblPeriodo: TppLabel;
    ppDBImage1: TppDBImage;
    qryLancContPerRF: TwwQuery;
    qryLancContPerRFDATA: TDateTimeField;
    qryLancContPerRFPLANPRVCONTABPATRO: TStringField;
    qryLancContPerRFDESCINVESTIMENTO: TStringField;
    qryLancContPerRFDATAOPERACAO: TDateTimeField;
    qryLancContPerRFPLNCODIGO: TFloatField;
    qryLancContPerRFPLNPLANIL: TFloatField;
    qryLancContPerRFHISTORICO: TStringField;
    qryLancContPerRFLACVALOR: TFloatField;
    qryLancContPerRFIDPLANPREVCTBPATR: TFloatField;
    qryLancContPerRFCOR: TFloatField;
    qryPlanoConta: TwwQuery;
    qryLancContPerRFPLANO: TFloatField;
    qryLancContPerRFPLACONTA: TStringField;
    qryPlanoContaPLANATUREZA: TStringField;
    qryInvestimento: TwwQuery;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    qryOperacao: TwwQuery;
    qryOperacaoDATAOPERACAO: TDateTimeField;
    qryOperacaoPLANPRVCONTABPATRO: TStringField;
    qryOperacaoQTDEOPERACAO: TFloatField;
    qryOperacaoVLROPERACAO: TFloatField;
    qryOperacaoIDOPERRENFIX: TFloatField;
    pplblDtLancto: TppLabel;
    pplblConta: TppLabel;
    pplblPlanoPatro: TppLabel;
    ppdbData: TppDBText;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppdbConta: TppDBText;
    ppdbPlanoPatro: TppDBText;
    shpDetalhe: TppShape;
    qryLancContPerRFIDINVESTIMENTO: TStringField;
    qryLancContPerRFTIPOOPER: TStringField;
    procedure shpDetalhePrint(Sender: TObject);
    procedure pprLanContPerRFEndFirstPass(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
  public
    { Public declarations }
    function MostraParam(Form: String): boolean; OverRide;
  end;

var
  DmRelLanContPerRF: TDmRelLanContPerRF;

implementation

uses uSistema, fParamConsLanContPerRF, FConsLanContPerRF, UOperComum,
  UBibliotecaInvest;

{$R *.DFM}

function TDmRelLanContPerRF.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   if (UpperCase(Form) = 'FPARAMCONSLANCONTPERRF') then
      frm := TfrmParamConsLanContPerRF.Create(Application)
   else if (UpperCase(Form) = 'FRMPARAMCONSLANCONTPERRF') then
      frm := TfrmParamConsLanContPerRF.Create(Application)
   else
      frm := nil;

   if frm = nil then begin
      Result := False;
      Exit;
   end;
   with frm do begin
      Result := (ShowModal = mrOk);
      Free;
   end;
end;

procedure TDmRelLanContPerRF.shpDetalhePrint(Sender: TObject);
begin
  inherited;
   //AL_3 - Seja qual for a cor do zebrado do grid no relatório é cinza
   if DmRelLanContPerRF.qryLancContPerRFCOR.AsInteger <> clWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := clWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TDmRelLanContPerRF.pprLanContPerRFEndFirstPass(Sender: TObject);
begin
   inherited;
   // AL_03
   if ExisteForm(frmConsLanContPerRF) then
   begin
      if frmConsLanContPerRF.fraMensLanContRF.Visible then
      begin
         frmConsLanContPerRF.fraMensLanContRF.Apaga;
         Application.ProcessMessages;
      end;
   end;

end;

end.



