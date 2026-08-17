unit dRelItensEnvioSintCAPCAR;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE, ppRichTx, ppStrtch, ppMemo;

type
   TdtmRelItensEnvioSintCAPCAR = class(TdtmReports)
    pplItensEnvioSintCAPCAR: TppBDEPipeline;
    dtsItensEnvioSintCAPCAR: TwwDataSource;
    rptItensEnviadosSintCAPCAR: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      ppLine2: TppLine;
      ppLabel3: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppDBText1: TppDBText;
      ppSummaryBand1: TppSummaryBand;
      ppLine5: TppLine;
      ppLine4: TppLine;
      ppShape3: TppShape;
      ppLabel19: TppLabel;
    qryItensEnvioSintCAPCAR: TwwQuery;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppDBText5: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppDBText12: TppDBText;
      UpdateSQL: TUpdateSQL;
      ppGroup3: TppGroup;
      ppGroupHeaderBand3: TppGroupHeaderBand;
      ppGroupFooterBand3: TppGroupFooterBand;
      ppShape1: TppShape;
      ppDBText6: TppDBText;
      ppLine6: TppLine;
      ppLabel7: TppLabel;
      ppLine1: TppLine;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppDBText13: TppDBText;
      ppShape2: TppShape;
      ppDBCalc3: TppDBCalc;
      ppDBCalc4: TppDBCalc;
      ppDBCalc5: TppDBCalc;
      ppDBCalc6: TppDBCalc;
      ppDBCalc7: TppDBCalc;
      ppDBCalc8: TppDBCalc;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppDBText11: TppDBText;
      ppLabel4: TppLabel;
      ppShape4: TppShape;
      ppDBCalc12: TppDBCalc;
      ppDBCalc13: TppDBCalc;
      ppDBCalc14: TppDBCalc;
      ppDBCalc15: TppDBCalc;
      ppDBCalc16: TppDBCalc;
      ppDBCalc17: TppDBCalc;
      ppDBText14: TppDBText;
      ppShape5: TppShape;
    lblPositivoNegativo: TppLabel;
    qryItensEnvioSintCAPCARDESCTIPOEMPTMO: TStringField;
    qryItensEnvioSintCAPCARPATRO: TStringField;
    qryItensEnvioSintCAPCARTCEDESCRICAO: TStringField;
    qryItensEnvioSintCAPCARITEDESCRICAO: TStringField;
    qryItensEnvioSintCAPCARQUANT_CAP: TFloatField;
    qryItensEnvioSintCAPCARVLR_CAP: TFloatField;
    qryItensEnvioSintCAPCARVLR_CAPDOC: TFloatField;
    qryItensEnvioSintCAPCARVLR_REC_CAP: TFloatField;
    qryItensEnvioSintCAPCARQUANT_CAR: TFloatField;
    qryItensEnvioSintCAPCARVLR_CARDOC: TFloatField;
    qryItensEnvioSintCAPCARVLR_CAR: TFloatField;
    qryItensEnvioSintCAPCARVLR_REC_CAR: TFloatField;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLabel11: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel8: TppLabel;
    ppLabel12: TppLabel;
    ppLabel15: TppLabel;
    ppLabel17: TppLabel;
    ppLine3: TppLine;
    ppLabel18: TppLabel;
    ppLabel20: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    lblMesCobranca: TppLabel;
    ppLabel122: TppLabel;
    ppLabel16: TppLabel;
    lblDataEfetivaIni: TppLabel;
    ppLabel30: TppLabel;
    lblDataEfetivaFim: TppLabel;
    ppLabel31: TppLabel;
    lblDataVenctoIni: TppLabel;
    ppLabel33: TppLabel;
    lblDataVenctoFim: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppMemo2: TppMemo;
    memPatro: TppRichText;
    memPlano: TppRichText;
    ppMemo1: TppMemo;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    lblTipoEmptmo: TppLabel;
    lblTipoContr: TppLabel;

      procedure ppLine4Print(Sender: TObject);
      procedure ppShape3Print(Sender: TObject);


   private { Private declarations }

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

   public { Public declarations }

      bSeparador        : Boolean;
      CorLinha          : TColor;
      CorAtual          : TColor;
      bCorLinha         : Boolean;

      function MostraParam(Form: string): boolean; override;

   end;



var
  dtmRelItensEnvioSintCAPCAR: TdtmRelItensEnvioSintCAPCAR;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo, uSistema, cRelItensEnvioSintCAPCAR;




function TdtmRelItensEnvioSintCAPCAR.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelitensenviosintcapcar') then
   begin
      frm := TcfgRelItensEnvioSintCAPCAR.Create(Application);
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



procedure TdtmRelItensEnvioSintCAPCAR.ppLine4Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelItensEnvioSintCAPCAR.ppShape3Print(Sender: TObject);
begin
   inherited;

   if bCorLinha then
   begin
      if CorAtual = clWhite then
      begin
         CorAtual := CorLinha;
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
