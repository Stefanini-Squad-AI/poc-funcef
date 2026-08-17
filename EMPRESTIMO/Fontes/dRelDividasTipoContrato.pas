unit dRelDividasTipoContrato;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE, ppRichTx, ppStrtch, ppMemo;

type
   TdtmRelDividasTipoContrato = class(TdtmReports)
      pplDividas: TppBDEPipeline;
      dsDividas: TwwDataSource;
      qryDividas: TwwQuery;
      rptDividasTipoContrato: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLine1: TppLine;
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
      ppLabel6: TppLabel;
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
      qryDividasIDCONTRATOEMPTMO: TFloatField;
      qryDividasNOME_TITULAR: TStringField;
      qryDividasNOME_BENEF: TStringField;
      qryDividasMATRICULA: TStringField;
      qryDividasSIT_PART: TStringField;
      qryDividasHMEDATAATUALIZA: TDateTimeField;
      qryDividasHMESALDODEV: TFloatField;
      qryDividasHMEPARCELA: TFloatField;
      qryDividasHMENUMPARCELAS: TFloatField;
      qryDividasVALOR_DEVIDO: TFloatField;
      qryDividasTOTAL: TFloatField;
      qryDividasIDTIPOCONTREMPTMO: TFloatField;
      qryDividasTCEDESCRICAO: TStringField;
      qryDividasVLRCONTRATO: TFloatField;
      qryDividasVLR_PAG: TFloatField;
      ppDBText7: TppDBText;
      ppLabel15: TppLabel;
      ppLabel16: TppLabel;
      ppShape4: TppShape;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppLabel17: TppLabel;
      ppShape5: TppShape;
      ppDBCalc5: TppDBCalc;
      ppDBCalc6: TppDBCalc;
      ppDBCalc7: TppDBCalc;
      ppLine4: TppLine;
      ppDBText10: TppDBText;
      ppLabel18: TppLabel;
      ppLabel19: TppLabel;
      ppDBText11: TppDBText;
      ppLabel20: TppLabel;
      ppLabel21: TppLabel;
      ppDBCalc8: TppDBCalc;
      ppDBCalc9: TppDBCalc;
      ppDBCalc10: TppDBCalc;
      ppDBCalc11: TppDBCalc;
      lblQuitacao: TppLabel;
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
      upd: TUpdateSQL;

      procedure rptDividas_lblDataRefPrint(Sender: TObject);
      procedure ppLine3Print(Sender: TObject);
      procedure ppShape3Print(Sender: TObject);


   private  // Private declarations

      //    Cores:
      //    ColorA = $FFFFFF   { branco, clWhite }
      //    ColorC = $00C0FFFF { amarelo - pastel }
      //    ColorD = $00C6F9CC { verde - pastel }
      //    ColorE = $00F3E6CD { azul - pastel }
      //    ColorF = $00A0A0A0
      //    ColorG = $00BEBEBE
      //    ColorH = $00D2D2D2
      //    ColorI = $00E3E3E3


   public   // Public declarations

      sDataRef    : String;
      bSeparador  : Boolean;
      CorLinha    : TColor;
      CorAtual    : TColor;
      bCorLinha   : Boolean;

      function MostraParam(Form: string): boolean; override;


  end;



var
  dtmRelDividasTipoContrato: TdtmRelDividasTipoContrato;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo, cRelDividasTipoContrato;



function TdtmRelDividasTipoContrato.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgreldividastipocontrato') then
   begin
      frm := TcfgRelDividasTipoCOntrato.Create(Application);
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



procedure TdtmRelDividasTipoContrato.rptDividas_lblDataRefPrint(Sender: TObject);
begin
   inherited;
   (Sender as TppLabel).Caption := sDataRef;
end;



procedure TdtmRelDividasTipoContrato.ppLine3Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelDividasTipoContrato.ppShape3Print(Sender: TObject);
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
