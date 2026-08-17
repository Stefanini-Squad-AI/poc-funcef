unit dRelMovContr;
//------------------------------------------------------------------------------
//Responsável  : Fanuel Junior
//Pendência    : SOL 174448 Kintana 1576064
//Data         : 29/02/2012
//Descrição    : Soma do valor previsto esta errado
//------------------------------------------------------------------------------
// Alteração:
// Autor(a)    :  Jéssica Lana
// Data        :  26/02/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: 
//------------------------------------------------------------------------------

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE, ADODB, DBClient, Provider, uSistema;

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
      ppLabel21: TppLabel;
      ppDBText3: TppDBText;
      ppDBText14: TppDBText;
      qryOriginal: TwwQuery;
      DateTimeField1: TDateTimeField;
      FloatField1: TFloatField;
      FloatField2: TFloatField;
      FloatField3: TFloatField;
      StringField1: TStringField;
      StringField2: TStringField;
      FloatField4: TFloatField;
      FloatField5: TFloatField;
      FloatField6: TFloatField;
      FloatField7: TFloatField;
      FloatField8: TFloatField;
      DateTimeField2: TDateTimeField;
      DateTimeField3: TDateTimeField;
      DateTimeField4: TDateTimeField;
      FloatField9: TFloatField;
      FloatField10: TFloatField;
      FloatField11: TFloatField;
      FloatField12: TFloatField;
      FloatField13: TFloatField;
      FloatField14: TFloatField;
      FloatField15: TFloatField;
      StringField3: TStringField;
      DateTimeField5: TDateTimeField;
      StringField4: TStringField;
      FloatField16: TFloatField;
      FloatField17: TFloatField;
      StringField5: TStringField;
      StringField6: TStringField;
      StringField7: TStringField;
      StringField8: TStringField;
      StringField9: TStringField;
      FloatField18: TFloatField;
      StringField10: TStringField;
      qryMovimentoContrMATRICULA: TStringField;
      qryMovimentoContrORDENACAO: TFloatField;
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
      qryMovimentoContrHMEPARCELA: TStringField;
      qryMovimentoContrHMESEQCOBRANCA: TFloatField;
      qryMovimentoContrHMESALDODEV: TFloatField;
      qryMovimentoContrPLNPLANIL: TStringField;
      qryMovimentoContrPLNDATDIA: TDateTimeField;
      qryMovimentoContrTCEDESCRICAO: TStringField;
      qryMovimentoContrTIPOMOV: TFloatField;
      qryMovimentoContrITCSEQCALCULO: TFloatField;
      qryMovimentoContrFLGFORMAPAG: TStringField;
      qryMovimentoContrSUSPENSAO: TStringField;
      qryMovimentoContrEVENTO: TStringField;
      qryMovimentoContrANOMESCOMP: TStringField;
      qryMovimentoContrANOMESCOBR: TStringField;
      ppLabel33: TppLabel;
      ppLabel34: TppLabel;
      ppDBCalc1: TppDBCalc;
      ppLine1: TppLine;
    qryMovimentoContrVLR_ABERTO: TFloatField;
    qryValorAberto: TwwQuery;
    wwDataSource1: TwwDataSource;
    ppBDEPipeline1: TppBDEPipeline;

      procedure rpMovimentoContrShapeDetPrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);


   private  // Private declarations

      CorAtual            : TColor;
      FIdContrato         : Extended;
      FTipoRelatorio      : String;
      FMesCompetencia     : String;

      //    Cores:
      //    ColorA = $FFFFFF     branco, clWhite
      //    ColorC = $00C0FFFF   amarelo - pastel
      //    ColorD = $00C6F9CC   verde - pastel
      //    ColorE = $00F3E6CD   azul - pastel
      //    ColorF = $00A0A0A0
      //    ColorG = $00BEBEBE
      //    ColorH = $00D2D2D2
      //    ColorI = $00E3E3E3

      //             $00E8E8E8   cinza bem claro

   public   // Public declarations

      wCorLinha   : TColor;
      wIsCorLinha : Boolean;

      property IdContrato : Extended read FIdContrato write FIdContrato;
      property TipoRelatorio : String read FTipoRelatorio write FTipoRelatorio;
      property MesCompetencia : String read FMesCompetencia write FMesCompetencia;

      function MostraParam(Form: string): boolean; override;

   end;



var
  dtmRelMovContr: TdtmRelMovContr;



implementation
{$R *.DFM}
uses
   CRelMovContr;




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



procedure TdtmRelMovContr.FormCreate(Sender: TObject);
begin
  inherited;
        //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
        rpMovimentoContr.Template.FileName:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\mov.ep1.rtm';

end;

end.
