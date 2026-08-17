//******************************************************************************
// Rotina     : ppOperRecebtoFdo
// SOL        : 129885
// Kintana    : 717793
// Data       : 29/01/2010
// Responsável: Ricardo Cristiano
// Motivo     : Implementação no relatório para trabalhar com qualquer tipo de
//              Fundo de Investimentos.
//******************************************************************************
// Data     : 13/06/2007
// Linha(s) : Al_5
// Motivo   : Implementado a view para plano/patrocinadora na query qryPlanPrevCtbPatr
//******************************************************************************
// Data     : 13/10/2005
// Linha(s) : Al_4
// Motivo   : Ajustes no layout
//******************************************************************************
// Data     : 04/07/2005
// Código   : AL_3
// Motivo   : Implementação da qryPlanPrevCtbPatr
//******************************************************************************
// Data     : 27/10/2004
// Motivo   : Acerto no order by da qryOperRecebtoFdo
//******************************************************************************
// Data     : 18/10/2004
// Motivo   : Implementacao do relatório de Operacoes
//******************************************************************************

unit FDMRelOperRecebtoFdo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, DBTables, Db, ppBands, ppClass, ppCtrls, ppDB, ppVar,
  ppPrnabl, ppCache, ppProd, ppReport, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE;

type
  TDMRelOperRecebtoFdo = class(TDmRelatoriosInv)
    ppOperRecebtoFdo: TppBDEPipeline;
    rptOperRecebtoFdo: TppReport;
    ppHeaderBand1: TppHeaderBand;
    shpCabecalho: TppShape;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBImage1: TppDBImage;
    lblPeriodo: TppLabel;
    ppLabel3: TppLabel;
    lblData: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    lblDtaIni: TppLabel;
    lblDtaFin: TppLabel;
    ppLabel4: TppLabel;
    ppdbPlanoPatro: TppDBText;
    lblTipoOper: TppLabel;
    ppDetailBand1: TppDetailBand;
    shpDetalhe: TppShape;
    ppdbDtaIni: TppDBText;
    ppdbDtaLiq: TppDBText;
    ppdbVlrBruto: TppDBText;
    ppdbVlrIR: TppDBText;
    ppdbVlrIOF: TppDBText;
    ppdbVlrLiq: TppDBText;
    ppdbTipoOper: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel5: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppLabel11: TppLabel;
    ppdbDescFundo: TppDBText;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    qryOperRecebtoFdo: TwwQuery;
    dsOperRecebtoFdo: TwwDataSource;
    updOperRecebtoFdo: TUpdateSQL;
    lblQuantidade: TppLabel;
    lblPU: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLine4: TppLine;
    ppLine1: TppLine;
    qryPlanPrevCtbPatr: TwwQuery;
    qryPlanPrevCtbPatrPLANPRVCONTABPATRO: TStringField;
    qryPlanPrevCtbPatrIDPLANPREVCTBPATR: TFloatField;
    qryOperRecebtoFdoIDOPERACAOFUNDO: TFloatField;
    qryOperRecebtoFdoIDCARTEIRAINVEST: TFloatField;
    qryOperRecebtoFdoIDPEDIDOFUNDO: TFloatField;
    qryOperRecebtoFdoIDTIPOINVEST: TFloatField;
    qryOperRecebtoFdoIDTIPOOPERACAO: TFloatField;
    qryOperRecebtoFdoIDFUNDOINVEST: TFloatField;
    qryOperRecebtoFdoDATAOPERACAO: TDateTimeField;
    qryOperRecebtoFdoDATALIQUIDACAO: TDateTimeField;
    qryOperRecebtoFdoQTDOPERACAO: TFloatField;
    qryOperRecebtoFdoQTDUSUFRUTO: TFloatField;
    qryOperRecebtoFdoSTACONFIRMA: TStringField;
    qryOperRecebtoFdoIDOPERACAOORIGEM: TFloatField;
    qryOperRecebtoFdoIDPLANPREVCTBPATR: TFloatField;
    qryOperRecebtoFdoDATACOTIZACAO: TDateTimeField;
    qryOperRecebtoFdoVLROPERACAO: TFloatField;
    qryOperRecebtoFdoVLRCOTA: TFloatField;
    qryOperRecebtoFdoVLRIR: TFloatField;
    qryOperRecebtoFdoVLRIOF: TFloatField;
    qryOperRecebtoFdoVLRRENDIMENTO: TFloatField;
    qryOperRecebtoFdoVLRLIQUIDO: TFloatField;
    qryOperRecebtoFdoVLRDESCONTO: TFloatField;
    qryOperRecebtoFdoDESCTIPOOPERACAO: TStringField;
    qryOperRecebtoFdoDESCFUNDOINVEST: TStringField;
    qryOperRecebtoFdoPLANPRVCONTABPATRO: TStringField;
    //Al_5
    qryPlanPrevCtbPatrPLANOCONTABIL: TStringField;
    qryPlanPrevCtbPatrPATROCINADORA: TStringField;
    qryPlanPrevCtbPatrIDPLANOPREV: TFloatField;
    qryPlanPrevCtbPatrIDPATRO: TFloatField;
    procedure shpDetalhePrint(Sender: TObject);
    procedure rptOperRecebtoFdoStartPage(Sender: TObject);
  private
    cCorZebra : TColor;
  public
    { Public declarations }
    function MostraParam(Form: string): boolean; OverRide;
  end;

var
  DMRelOperRecebtoFdo: TDMRelOperRecebtoFdo;

implementation

uses FParamOperRecebtoFdo;

{$R *.DFM}

procedure TDMRelOperRecebtoFdo.shpDetalhePrint(Sender: TObject);
begin
  inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

  TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TDMRelOperRecebtoFdo.rptOperRecebtoFdoStartPage(Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3;
   shpDetalhe.Brush.Color := clWhite;
end;

function TDMRelOperRecebtoFdo.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios       `
   if (UpperCase(Form) = 'FPARAMOPERRECEBTOFDO') then
      frm := TFrmParamOperRecebtoFdo.Create(Application)
   else if (UpperCase(Form) = 'FRMPARAMOPERRECEBTOFDO') then
      frm := TFrmParamOperRecebtoFdo.Create(Application)
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

end.
