//******************************************************************************
// Data     : 30/10/2006
// Código   : AL_2
// Pendencia: 22989
// SOL      :
// Desc     : Segregação de Planos
//******************************************************************************

unit FDmRelLanContAtuRV;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, DBTables, ppCtrls, ppBands, ppClass, Db, ppVar,
  ppPrnabl, ppCache, ppProd, ppReport, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE;

type
  TDmRelLanContAtuRV = class(TDmRelatoriosInv)
    pplLanContAtuRV: TppBDEPipeline;
    rptLanContAtuRV: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    shpCabecalho: TppShape;
    pplInvestimento: TppLabel;
    pplVlrContab: TppLabel;
    pplVlrDif: TppLabel;
    pplCarteira: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    shpDet: TppShape;
    ppdbInvestimento: TppDBText;
    ppdbVlrDif: TppDBText;
    ppdbVlrAtu: TppDBText;
    pplCodigo: TppLabel;
    pplVlrAtu: TppLabel;
    ppdbPlanilha: TppDBText;
    pplContaD: TppLabel;
    pplHistContab: TppLabel;
    pplDataRef: TppLabel;
    ppdbCarteira: TppDBText;
    dsLanContAtuRv: TwwDataSource;
    qryLanContAtuRV: TwwQuery;
    qryInvestimento: TwwQuery;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    qryCarteira: TwwQuery;
    qryCarteiraDESCCARTINVEST: TStringField;
    qryCarteiraDATAULTFECH: TDateTimeField;
    qryCarteiraIDCARTEIRAINVEST: TFloatField;
    qryLanContAtuRVPLNCODIGO: TFloatField;
    qryLanContAtuRVDATAMOVCARTINV: TDateTimeField;
    qryLanContAtuRVVLRMOVCARTINV: TFloatField;
    qryLanContAtuRVDIF: TFloatField;
    qryLanContAtuRVLACVALOR: TFloatField;
    qryLanContAtuRVSALDOVLRINVCART: TFloatField;
    qryLanContAtuRVSALDOQTDEINVCART: TFloatField;
    qryLanContAtuRVHISTMOVCARTINV: TStringField;
    qryLanContAtuRVDESCINVESTIMENTO: TStringField;
    qryLanContAtuRVDESCCARTINVEST: TStringField;
    qryLanContAtuRVIDINVESTIMENTO: TFloatField;
    qryLanContAtuRVIDCARTEIRAINVEST: TFloatField;
    qryLanContAtuRVPLACONTAD: TStringField;
    qryLanContAtuRVPLACONTAC: TStringField;
    ppDBImage6: TppDBImage;
    ppdbVlrContab: TppDBText;
    ppdbHistContab: TppDBText;
    pplContaC: TppLabel;
    ppdbContaD: TppDBText;
    ppdbContaC: TppDBText;
    qryLanContAtuRVHISTCONTAB: TStringField;
    ppDBText1: TppDBText;
    qryLanContAtuRVDESCTIPOOPERACAO: TStringField;
    QryPlanoPatro: TwwQuery;
    QryPlanoPatroPLANPRVCONTABPATRO: TStringField;
    QryPlanoPatroIDPLANPREVCTBPATR: TFloatField;
    QryPlanoPatroIDPLANOPREV: TFloatField;
    QryPlanoPatroIDPATRO: TFloatField;
    qryLanContAtuRVPLANPRVCONTABPATRO: TStringField;
    ppDBText2: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    procedure rptLanContAtuRVStartPage(Sender: TObject);
    procedure shpDetPrint(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
  public
    { Public declarations }
    function MostraParam(Form: String): boolean; OverRide;
  end;

var
  DmRelLanContAtuRV: TDmRelLanContAtuRV;

implementation

uses fConsLanContAtuRV, fParamConsLanContAtuRV;
{$R *.DFM}

procedure TDmRelLanContAtuRV.rptLanContAtuRVStartPage(Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3;
   shpDet.Brush.Color := clWhite;
end;

procedure TDmRelLanContAtuRV.shpDetPrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

function TDmRelLanContAtuRV.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   if (UpperCase(Form) = 'FPARAMCONSLANCONTATURV') then
      frm := TfrmParamConsLanContAtuRV.Create(Application)
   else if (UpperCase(Form) = 'FRMPARAMCONSLANCONTATURV') then
      frm := TfrmParamConsLanContAtuRV.Create(Application)
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

end.
