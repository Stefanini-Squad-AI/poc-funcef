unit dRelMovContr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, ADODB, DBClient, Provider;

type
  TdtmRelMovContr = class(TdtmReports)
    pplMovimentoContr: TppBDEPipeline;
    dtsMovimentoContr: TwwDataSource;
    rpMovimentoContr: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel16: TppLabel;
    ppLabel6: TppLabel;
    ppLabel17: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLine2: TppLine;
    ppDetailBand1: TppDetailBand;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLine4: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    qryMovimentoContr: TwwQuery;
    ppShape1: TppShape;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppDBText24: TppDBText;
    rpMovimentoContrShapeDet: TppShape;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel15: TppLabel;
    ppDBText20: TppDBText;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel32: TppLabel;
    qryMovimentoContrDATACREDITO: TDateTimeField;
    qryMovimentoContrIDTIPOCONTREMPTMO: TFloatField;
    qryMovimentoContrIDCONTRATOEMPTMO: TFloatField;
    qryMovimentoContrIDITEMEMPTMO: TFloatField;
    qryMovimentoContrITEDESCRICAO: TStringField;
    qryMovimentoContrNOME: TStringField;
    qryMovimentoContrHMEVLRPREVISTO: TFloatField;
    qryMovimentoContrHMEVLREFETIVO: TFloatField;
    qryMovimentoContrHMETXJUROS: TFloatField;
    qryMovimentoContrCODDOCUMENTO: TFloatField;
    qryMovimentoContrIDRUBRICA: TFloatField;
    qryMovimentoContrHMEDATAPREVISTA: TDateTimeField;
    qryMovimentoContrHMEDATAEFETIVA: TDateTimeField;
    qryMovimentoContrHMEDATAVENCTO: TDateTimeField;
    qryMovimentoContrANOCOMP: TFloatField;
    qryMovimentoContrMESCOMP: TFloatField;
    qryMovimentoContrANOCOBR: TFloatField;
    qryMovimentoContrMESCOBR: TFloatField;
    qryMovimentoContrHMEPARCELA: TFloatField;
    qryMovimentoContrHMESEQCOBRANCA: TFloatField;
    qryMovimentoContrHMESALDODEV: TFloatField;
    qryMovimentoContrPLNPLANIL: TStringField;
    qryMovimentoContrPLNDATDIA: TDateTimeField;
    qryMovimentoContrTCEDESCRICAO: TStringField;
    qryMovimentoContrTIPOMOV: TFloatField;
    qryMovimentoContrITCSEQCALCULO: TFloatField;
    qryMovimentoContrFLGFORMAPAG: TStringField;
    qryMovimentoContrEVENTO: TStringField;
    qryMovimentoContrANOMESCOMP: TStringField;
    qryMovimentoContrANOMESCOBR: TStringField;
    ppShape2: TppShape;
    ppDBCalc1: TppDBCalc;
    qryMovimentoContrVLR_ABERTO: TFloatField;
    ppLabel21: TppLabel;

    procedure rpMovimentoContrShapeDetPrint(Sender: TObject);


   private  // Private declarations

    CorAtual            : TColor;
    FIdContrato         : Extended;
    FTipoRelatorio      : String;
    FMesCompetencia     : String;


   public   // Public declarations

    wCorLinha : TColor;
    wIsCorLinha         : Boolean;

    property IdContrato : Extended read FIdContrato write FIdContrato;
    property TipoRelatorio : String read FTipoRelatorio write FTipoRelatorio;
    property MesCompetencia : String read FMesCompetencia write FMesCompetencia;

    function MostraParam(Form: string): boolean; override;

  end;



var
  dtmRelMovContr: TdtmRelMovContr;



implementation
uses
   CRelMovContr;
{$R *.DFM}



function TdtmRelMovContr.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelmovcontr') then
   begin
      frm := TcfgRelMovContr.Create(Application);
   end
   else
   begin
      frm := nil;
   end;

   if frm = nil then
   begin
      Result := False;
      Exit;
   end;

   with frm do
   begin
      Result := (ShowModal = mrOk);
      Free;
   end;
end;


procedure TdtmRelMovContr.rpMovimentoContrShapeDetPrint(Sender: TObject);
begin
   inherited;
   if wIsCorLinha then
   begin
      if CorAtual = clWhite then
      begin
         CorAtual := wCorLinha
      end
      else
      begin
         CorAtual := clWhite;
      end;
   end
   else
   begin
      CorAtual := clWhite;
   end;

   (Sender as TppShape).Brush.Color := CorAtual;
end;



end.
