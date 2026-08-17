//******************************************************************************
// Data     : 12/04/2006
// Motivo   : Acerto no cálculo do VLRCUSTOATUAL da qryConsAmortFdo
//******************************************************************************
// Data     : 02/12/2004
// Motivo   : Implementacao do relatório de Operacoes
//******************************************************************************

unit FDmRelConsAmortFdo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppDB, ppBands, ppClass, ppCtrls, ppVar, ppPrnabl,
  ppCache, ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm,
  ppRelatv, ppDBPipe, ppDBBDE;

type
  TDmRelConsAmortFdo = class(TDmRelatoriosInv)
    rptConsAmortFdo: TppReport;
    ppHeaderBand6: TppHeaderBand;
    ppLabel9: TppLabel;
    ppLabel12: TppLabel;
    ppDBImage6: TppDBImage;
    ppDetailBand5: TppDetailBand;
    shpAmortCotasFnd: TppShape;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppFooterBand6: TppFooterBand;
    ppLine10: TppLine;
    ppLabel14: TppLabel;
    ppSystemVariable14: TppSystemVariable;
    ppSystemVariable13: TppSystemVariable;
    ppSummaryBand6: TppSummaryBand;
    ppGroup8: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppBDEPConsAmortizacaoCotas: TppBDEPipeline;
    qryConsAmortFdo: TwwQuery;
    dsConsAmortFdo: TwwDataSource;
    qryConsAmortFdoDATAAPLICACAO: TDateTimeField;
    qryConsAmortFdoDATAMOVFUNDO: TDateTimeField;
    qryConsAmortFdoVLRAPLICADO: TFloatField;
    qryConsAmortFdoVLRCUSTOATUAL: TFloatField;
    qryConsAmortFdoVLRRENDIMENTO: TFloatField;
    qryConsAmortFdoSALDOVLRFUNDO: TFloatField;
    qryConsAmortFdoIDFUNDOINVEST: TFloatField;
    qryConsAmortFdoIDHISTFUNDO: TFloatField;
    qryConsAmortFdoIDTIPOOPERACAO: TFloatField;
    qryConsAmortFdoIDCARTEIRAINVEST: TFloatField;
    qryConsAmortFdoIDOPERACAOFUNDO: TFloatField;
    qryConsAmortFdoDATAULTPGTOIR: TDateTimeField;
    qryConsAmortFdoDESCFUNDOINVEST: TStringField;
    qryConsAmortFdoVLRMOVFUNDO: TFloatField;
    qryConsAmortFdoVLRIRPROV: TFloatField;
    qryConsAmortFdoVLRIOFPROV: TFloatField;
    qryConsAmortFdoCOTASMOVFUNDO: TFloatField;
    qryConsAmortFdoSALDOQTDCOTAS: TFloatField;
    qryConsAmortFdoCOTAAPLICACAO: TFloatField;
    qryConsAmortFdoCODDOCUMENTO: TFloatField;
    qryConsAmortFdoPLNCODIGO: TFloatField;
    qryConsAmortFdoPLANO: TFloatField;
    qryConsAmortFdoIDTIPOINVEST: TFloatField;
    qryConsAmortFdoVLROPERACAO: TFloatField;
    qryConsAmortFdoPLANPRVCONTABPATRO: TStringField;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppShape1: TppShape;
    ppLine50: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    lblDtIni: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    lblDtFim: TppLabel;
    ppLine1: TppLine;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText1: TppDBText;
    ppDBText7: TppDBText;
    procedure shpAmortCotasFndPrint(Sender: TObject);
  private
    cCorZebra : TColor;
    { Private declarations }
  public
    { Public declarations }
    function MostraParam(Form: string): boolean; OverRide;   
  end;

var
  DmRelConsAmortFdo: TDmRelConsAmortFdo;

implementation

uses FParamOperAmortFdo;

{$R *.DFM}

function TDmRelConsAmortFdo.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios
   if (UpperCase(Form) = 'FPARAMOPERAMORTFDO') then
      frm := TFrmParamOperAmortFdo.Create(Application)
   else if (UpperCase(Form) = 'FRMPARAMOPERAMORTFDO') then
      frm := TFrmParamOperAmortFdo.Create(Application)
   else
      frm := nil;

   if frm = nil then
   begin
      Result := False;
      Exit;
   end;
   with frm do begin
      Result := (ShowModal = mrOk);
      Free;
   end;
end;

procedure TDmRelConsAmortFdo.shpAmortCotasFndPrint(Sender: TObject);
begin
  inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

  TppShape(Sender).Brush.Color := cCorZebra
end;

end.
