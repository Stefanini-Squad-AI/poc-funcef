unit dRelDividasPP;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE, ppRichTx, ppStrtch, ppMemo;

type
   TdtmRelDividasPP = class(TdtmReports)
      pplDividasPP: TppBDEPipeline;
      dsDividasPP: TwwDataSource;
      qryDividasPP: TwwQuery;
      rptDividasPP: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      ppLine2: TppLine;
      ppLabel3: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppShape1: TppShape;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel7: TppLabel;
      ppSummaryBand1: TppSummaryBand;
      ppLine5: TppLine;
      ppLabel122: TppLabel;
      rptDividas_lblDataRef: TppLabel;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBCalc1: TppDBCalc;
      ppDBCalc2: TppDBCalc;
      ppShape2: TppShape;
      ppLabel9: TppLabel;
      ppLine3: TppLine;
      ppShape3: TppShape;
      ppDBCalc3: TppDBCalc;
      ppLabel10: TppLabel;
      ppDBText6: TppDBText;
      ppLabel11: TppLabel;
      ppLabel8: TppLabel;
      ppLabel12: TppLabel;
      ppLabel14: TppLabel;
      ppDBCalc4: TppDBCalc;
      ppLabel13: TppLabel;
      ppDBText7: TppDBText;
      ppLabel16: TppLabel;
      ppShape4: TppShape;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppShape5: TppShape;
      ppLabel15: TppLabel;
      ppShape6: TppShape;
      ppLine4: TppLine;
      ppDBCalc5: TppDBCalc;
      ppDBCalc6: TppDBCalc;
      ppDBCalc7: TppDBCalc;
      ppLabel17: TppLabel;
      ppDBCalc8: TppDBCalc;
      lblQuitacao: TppLabel;
      ppGroup3: TppGroup;
      ppGroupHeaderBand3: TppGroupHeaderBand;
      ppGroupFooterBand3: TppGroupFooterBand;
      ppDBText11: TppDBText;
      ppShape7: TppShape;
      ppLabel18: TppLabel;
      ppDBCalc9: TppDBCalc;
      ppLine6: TppLine;
      ppLabel19: TppLabel;
      ppShape8: TppShape;
      ppDBCalc10: TppDBCalc;
      ppDBCalc11: TppDBCalc;
      ppDBCalc12: TppDBCalc;
      updDividasPP: TUpdateSQL;
      qryDividasPPIDCONTRATOEMPTMO: TFloatField;
      qryDividasPPNOMEPLANO: TStringField;
      qryDividasPPNOMEPATRO: TStringField;
      qryDividasPPNOME_TITULAR: TStringField;
      qryDividasPPNOME_BENEF: TStringField;
      qryDividasPPSIT_PART: TStringField;
      qryDividasPPMATRICULA: TStringField;
      qryDividasPPMATRICULA_TIT: TStringField;
      qryDividasPPHMEDATAATUALIZA: TDateTimeField;
      qryDividasPPHMESALDODEV: TFloatField;
      qryDividasPPHMEPARCELA: TFloatField;
      qryDividasPPHMENUMPARCELAS: TFloatField;
      qryDividasPPTCEDESCRICAO: TStringField;
      qryDividasPPDEVE: TFloatField;
      qryDividasPPTOTAL_DEV: TFloatField;
      ppDBText8: TppDBText;
      ppDBText12: TppDBText;
      ppLabel6: TppLabel;
      ppLabel20: TppLabel;
      ppLabel21: TppLabel;
      ppDBText13: TppDBText;
      ppLabel22: TppLabel;
      ppLabel23: TppLabel;
      ppDBText14: TppDBText;
      ppLabel24: TppLabel;
      ppLabel25: TppLabel;
      ppShape9: TppShape;
      ppLabel26: TppLabel;
      ppDBCalc13: TppDBCalc;
      ppLine1: TppLine;
      ppLabel27: TppLabel;
      ppShape10: TppShape;
      ppDBCalc14: TppDBCalc;
      ppDBCalc15: TppDBCalc;
      ppDBCalc16: TppDBCalc;
      ppDBCalc17: TppDBCalc;
      ppDBCalc18: TppDBCalc;
      ppDBCalc19: TppDBCalc;
      ppDBCalc20: TppDBCalc;
      qryDividasPPQUANT_PARCELAS: TFloatField;
      qryDividasPPTXJUROS: TFloatField;
      qryDividasPPVLRCONTRATO: TFloatField;
      qryDividasPPDATACREDITO: TDateTimeField;
      qryDividasPPNUMPARCELAS: TFloatField;
      qryDividasPPPRIMEIRA_DATA: TDateTimeField;
      ppDBText15: TppDBText;
      ppLabel28: TppLabel;
      qryDividasPPNOMEPLANOPATRO: TStringField;
      ppDBText16: TppDBText;
      lblItensEmAberto: TppLabel;
      lblCOMSaldoDevedor: TppLabel;
      lblSEMSaldoDevedor: TppLabel;
      ppLabel30: TppLabel;
      ppLabel31: TppLabel;
      ppDBText17: TppDBText;
    ppLabel29: TppLabel;
    ppLabel32: TppLabel;
    ppMemo2: TppMemo;
    memPatro: TppRichText;
    memPlano: TppRichText;
    ppMemo1: TppMemo;

      procedure rptDividas_lblDataRefPrint(Sender: TObject);
      procedure ppLine3Print(Sender: TObject);
      procedure ppShape3Print(Sender: TObject);
      procedure ppShape1Print(Sender: TObject);


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

      sDataRef    : String;
      bSeparador  : Boolean;
      CorLinha    : TColor;
      CorAtual    : TColor;
      bCorLinha   : Boolean;

      function MostraParam(Form: string): boolean; override;


  end;



var
  dtmRelDividasPP: TdtmRelDividasPP;



implementation
{$R *.DFM}
uses
   uSistema, uFuncoesEmptmo, cRelDividasPP;





function TdtmRelDividasPP.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgreldividaspp') then
   begin
      frm := TcfgRelDividasPP.Create(Application);
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



procedure TdtmRelDividasPP.rptDividas_lblDataRefPrint(Sender: TObject);
begin
   inherited;
   (Sender as TppLabel).Caption := sDataRef;
end;



procedure TdtmRelDividasPP.ppLine3Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelDividasPP.ppShape3Print(Sender: TObject);
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



procedure TdtmRelDividasPP.ppShape1Print(Sender: TObject);
begin
   inherited;
   CorAtual := clWhite;
end;



end.
