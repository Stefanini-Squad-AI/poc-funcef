//******************************************************************************
// Autor    : Fabio Fagundes
// Data     : 10/06/2005
// Motivo   : Implementacao do relatório de Operacoes
//******************************************************************************

unit FDMRelOperacoesFdo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE;

type
  TDMRelOperacoesFdo = class(TDmRelatoriosInv)
    ppOperacoesFdo: TppBDEPipeline;
    ppOperRecebtoFdoppField1: TppField;
    ppOperRecebtoFdoppField2: TppField;
    ppOperRecebtoFdoppField3: TppField;
    ppOperRecebtoFdoppField4: TppField;
    ppOperRecebtoFdoppField5: TppField;
    ppOperRecebtoFdoppField6: TppField;
    ppOperRecebtoFdoppField7: TppField;
    ppOperRecebtoFdoppField8: TppField;
    ppOperRecebtoFdoppField9: TppField;
    ppOperRecebtoFdoppField10: TppField;
    ppOperRecebtoFdoppField11: TppField;
    ppOperRecebtoFdoppField12: TppField;
    ppOperRecebtoFdoppField13: TppField;
    ppOperRecebtoFdoppField14: TppField;
    ppOperRecebtoFdoppField15: TppField;
    ppOperRecebtoFdoppField16: TppField;
    ppOperRecebtoFdoppField17: TppField;
    ppOperRecebtoFdoppField18: TppField;
    ppOperRecebtoFdoppField19: TppField;
    ppOperRecebtoFdoppField20: TppField;
    ppOperRecebtoFdoppField21: TppField;
    ppOperRecebtoFdoppField22: TppField;
    ppOperRecebtoFdoppField23: TppField;
    ppOperRecebtoFdoppField24: TppField;
    rptOperacoesFdo: TppReport;
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
    lblTipoOper: TppLabel;
    lblQuantidade: TppLabel;
    lblPU: TppLabel;
    ppDetailBand1: TppDetailBand;
    shpDetalhe: TppShape;
    ppdbDtaIni: TppDBText;
    ppdbDtaLiq: TppDBText;
    ppdbVlrBruto: TppDBText;
    ppdbVlrIR: TppDBText;
    ppdbVlrIOF: TppDBText;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppdbVlrLiq: TppDBText;
    ppDBText3: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel5: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppdbPlanoPatro: TppDBText;
    ppLabel4: TppLabel;
    ppLine4: TppLine;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppLabel11: TppLabel;
    ppdbDescFundo: TppDBText;
    ppLine1: TppLine;
    ppLine5: TppLine;
    ppGroupFooterBand3: TppGroupFooterBand;
    qryOperacoesFdo: TwwQuery;
    qryOperacoesFdoDATAOPERACAO: TDateTimeField;
    qryOperacoesFdoDATALIQUIDACAO: TDateTimeField;
    qryOperacoesFdoDESCTIPOOPERACAO: TStringField;
    qryOperacoesFdoQTDOPERACAO: TFloatField;
    qryOperacoesFdoVLRCOTA: TFloatField;
    qryOperacoesFdoVLROPERACAO: TFloatField;
    qryOperacoesFdoVLRIR: TFloatField;
    qryOperacoesFdoVLRLIQUIDO: TFloatField;
    qryOperacoesFdoQTDUSUFRUTO: TFloatField;
    qryOperacoesFdoIDOPERACAOFUNDO: TFloatField;
    qryOperacoesFdoIDCARTEIRAINVEST: TFloatField;
    qryOperacoesFdoIDPEDIDOFUNDO: TFloatField;
    qryOperacoesFdoIDTIPOINVEST: TFloatField;
    qryOperacoesFdoIDTIPOOPERACAO: TFloatField;
    qryOperacoesFdoIDFUNDOINVEST: TFloatField;
    qryOperacoesFdoVLRIOF: TFloatField;
    qryOperacoesFdoVLRRENDIMENTO: TFloatField;
    qryOperacoesFdoSTACONFIRMA: TStringField;
    qryOperacoesFdoIDOPERACAOORIGEM: TFloatField;
    qryOperacoesFdoIDPLANPREVCTBPATR: TFloatField;
    qryOperacoesFdoDATACOTIZACAO: TDateTimeField;
    qryOperacoesFdoVLRDESCONTO: TFloatField;
    qryOperacoesFdoDESCFUNDOINVEST: TStringField;
    qryOperacoesFdoPLANPRVCONTABPATRO: TStringField;
    dsOperacoesFdo: TwwDataSource;
    updOperacoesFdo: TUpdateSQL;
    procedure shpDetalhePrint(Sender: TObject);
  private
    cCorZebra : TColor;
  public
    { Public declarations }
    function MostraParam(Form: string): boolean; OverRide;
    { Public declarations }
  end;

var
  DMRelOperacoesFdo: TDMRelOperacoesFdo;

implementation

uses FParamOperacoesFdo;

{$R *.DFM}

function TDMRelOperacoesFdo.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios
   if (UpperCase(Form) = 'FPARAMOPERACOESFDO') then
      frm := TFrmParamOperacoesFdo.Create(Application)
   else if (UpperCase(Form) = 'FRMPARAMOPERACOESFDO') then
      frm := TFrmParamOperacoesFdo.Create(Application)
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


procedure TDMRelOperacoesFdo.shpDetalhePrint(Sender: TObject);
begin
  inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

  TppShape(Sender).Brush.Color := cCorZebra
end;

end.
