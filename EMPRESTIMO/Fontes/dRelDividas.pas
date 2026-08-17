unit dRelDividas;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE, ppMemo, ppStrtch, ppRichTx;

type
   TdtmRelDividas = class(TdtmReports)
      pplDividas: TppBDEPipeline;
      dsDividas: TwwDataSource;
      qryDividas: TwwQuery;
      rptDividas: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      ppLine2: TppLine;
      ppLabel3: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
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
      ppLabel14: TppLabel;
      ppDBCalc4: TppDBCalc;
      ppDBText7: TppDBText;
      ppShape4: TppShape;
      qryDividasIDCONTRATOEMPTMO: TFloatField;
      qryDividasNOME_TITULAR: TStringField;
      qryDividasNOME_BENEF: TStringField;
      qryDividasSIT_PART: TStringField;
      qryDividasMATRICULA: TStringField;
      qryDividasMATRICULA_TIT: TStringField;
      qryDividasHMEDATAATUALIZA: TDateTimeField;
      qryDividasHMESALDODEV: TFloatField;
      qryDividasHMEPARCELA: TFloatField;
      qryDividasHMENUMPARCELAS: TFloatField;
      qryDividasTCEDESCRICAO: TStringField;
      qryDividasDEVE: TFloatField;
      qryDividasTOTAL_DEV: TFloatField;
      lblQuitacao: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppShape1: TppShape;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel13: TppLabel;
    ppLabel16: TppLabel;
    ppLabel11: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel12: TppLabel;
    ppDBText9: TppDBText;
    memPlano: TppRichText;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppMemo2: TppMemo;
    memPatro: TppRichText;
    ppMemo1: TppMemo;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    lblTipoEmptmo: TppLabel;
    lblTipoContr: TppLabel;
    lblSaldoDevedor: TppLabel;
    lblSaldoZERO: TppLabel;
    lblItemAberto: TppLabel;
    lblDevolucao: TppLabel;
    lblValorDevido: TppLabel;

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
  dtmRelDividas: TdtmRelDividas;



implementation
{$R *.DFM}
uses
   uSistema, uFuncoesEmptmo, cRelDividas;





function TdtmRelDividas.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgreldividas') then
   begin
      frm := TcfgRelDividas.Create(Application);
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



procedure TdtmRelDividas.rptDividas_lblDataRefPrint(Sender: TObject);
begin
   inherited;
   (Sender as TppLabel).Caption := sDataRef;
end;



procedure TdtmRelDividas.ppLine3Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelDividas.ppShape3Print(Sender: TObject);
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



procedure TdtmRelDividas.ppShape1Print(Sender: TObject);
begin
   inherited;
   CorAtual := clWhite;
end;



end.
