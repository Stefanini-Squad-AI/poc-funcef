unit dRelItensEnvioAnalCAPCAR;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE, ppModule, raCodMod, ppRichTx, ppStrtch, ppMemo;

type
   TdtmRelItensEnvioAnalCAPCAR = class(TdtmReports)
      pplItensEnvioAnalCAPCAR: TppBDEPipeline;
      dtsItensEnvioAnalCAPCAR: TwwDataSource;
      rptItensEnvioAnalCAPCAR: TppReport;
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
      qryItensEnvioAnalCAPCAR: TwwQuery;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppGroup3: TppGroup;
      ppGroupHeaderBand3: TppGroupHeaderBand;
      ppGroupFooterBand3: TppGroupFooterBand;
      ppShape1: TppShape;
      ppDBText6: TppDBText;
      ppLine6: TppLine;
      ppLabel12: TppLabel;
      ppLabel15: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppShape2: TppShape;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppDBText2: TppDBText;
      ppDBText5: TppDBText;
      ppLabel11: TppLabel;
      ppLine1: TppLine;
      ppLine3: TppLine;
      ppLine7: TppLine;
      ppDBCalc1: TppDBCalc;
      ppDBCalc2: TppDBCalc;
      ppDBCalc3: TppDBCalc;
      ppDBCalc5: TppDBCalc;
      ppDBCalc7: TppDBCalc;
      ppDBCalc8: TppDBCalc;
      ppDBCalc10: TppDBCalc;
      ppDBCalc11: TppDBCalc;
      ppShape4: TppShape;
      ppLabel7: TppLabel;
      ppShape6: TppShape;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
      ppShape5: TppShape;
      ppDBCalc9: TppDBCalc;
      ppDBCalc14: TppDBCalc;
      ppLabel18: TppLabel;
      ppDBText9: TppDBText;
      qryItensEnvioAnalCAPCARIDCONTRATOEMPTMO: TFloatField;
      qryItensEnvioAnalCAPCARIDPATRO: TFloatField;
      qryItensEnvioAnalCAPCARPATRO: TStringField;
      qryItensEnvioAnalCAPCARNOME: TStringField;
      qryItensEnvioAnalCAPCARMATRICULA: TStringField;
      qryItensEnvioAnalCAPCARTCEDESCRICAO: TStringField;
      qryItensEnvioAnalCAPCARHMEPARCELA: TFloatField;
      qryItensEnvioAnalCAPCARHMENUMPARCELAS: TFloatField;
      qryItensEnvioAnalCAPCARDESC_EVENTO: TStringField;
      qryItensEnvioAnalCAPCARORIGEM: TStringField;
      ppDBText11: TppDBText;
      ppLabel22: TppLabel;
      ppLabel23: TppLabel;
      ppDBText13: TppDBText;
      qryItensEnvioAnalCAPCARITEDESCRICAO: TStringField;
      ppLabel24: TppLabel;
      ppDBText14: TppDBText;
      ppDBText15: TppDBText;
      ppLabel25: TppLabel;
      ppLabel26: TppLabel;
      dtmRelItensEnviolAnal_lblSitPart: TppLabel;
      qryItensEnvioAnalCAPCARHMEVLRPREVISTODOCREC: TFloatField;
      qryItensEnvioAnalCAPCARHMEVLRPREVISTOREC: TFloatField;
      qryItensEnvioAnalCAPCARHMEVLRPREVISTODOCPAG: TFloatField;
      qryItensEnvioAnalCAPCARHMEVLRPREVISTOPAG: TFloatField;
      qryItensEnvioAnalCAPCARHMEVLREFETIVOPAG: TFloatField;
      qryItensEnvioAnalCAPCARHMEVLREFETIVOREC: TFloatField;
      ppDBText10: TppDBText;
      ppDBText12: TppDBText;
      ppLabel6: TppLabel;
      ppLabel8: TppLabel;
      ppLabel20: TppLabel;
      ppLabel21: TppLabel;
      ppLabel14: TppLabel;
      ppLabel27: TppLabel;
      ppLabel28: TppLabel;
      ppLabel29: TppLabel;
      ppDBCalc4: TppDBCalc;
      ppDBCalc6: TppDBCalc;
      ppDBCalc12: TppDBCalc;
      ppDBCalc13: TppDBCalc;
    lblMesCobranca: TppLabel;
    ppLabel122: TppLabel;
    ppLabel13: TppLabel;
    lblDataEfetivaIni: TppLabel;
    ppLabel30: TppLabel;
    lblDataEfetivaFim: TppLabel;
    lblPositivoNegativo: TppLabel;
    ppLabel31: TppLabel;
    lblDataVenctoIni: TppLabel;
    ppLabel33: TppLabel;
    lblDataVenctoFim: TppLabel;
    ppLabel32: TppLabel;
    ppLabel34: TppLabel;
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
      procedure ppDetailBand1BeforePrint(Sender: TObject);


   private  // Private declarations

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

      bSintetico        : Boolean;

      sMesCobranca      : String;
      bSeparador        : Boolean;
      CorLinha          : TColor;
      CorAtual          : TColor;
      bCorLinha         : Boolean;

      function MostraParam(Form: string): boolean; override;

   end;



var
  dtmRelItensEnvioAnalCAPCAR: TdtmRelItensEnvioAnalCAPCAR;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo, uSistema, cRelItensEnvioAnalCAPCAR;




function TdtmRelItensEnvioAnalCAPCAR.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   if (LowerCase(Form) = 'cfgrelitensenvioanalcapcar') then
   begin
      frm := TcfgRelItensEnvioAnalCAPCAR.Create(Application);
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



procedure TdtmRelItensEnvioAnalCAPCAR.ppLine4Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelItensEnvioAnalCAPCAR.ppShape3Print(Sender: TObject);
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



procedure TdtmRelItensEnvioAnalCAPCAR.ppDetailBand1BeforePrint(Sender: TObject);
begin
   inherited;
   (Sender as TppDetailBand).Visible := not(bSintetico);
end;



end.
