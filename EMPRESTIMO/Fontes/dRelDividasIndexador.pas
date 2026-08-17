unit dRelDividasIndexador;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE, ppRichTx, ppStrtch, ppMemo;

type
   TdtmRelDividasIndexador = class(TdtmReports)
      pplDividas: TppBDEPipeline;
      dsDividas: TwwDataSource;
      qryDividas: TwwQuery;
      rptDividasIndexador: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      ppLine2: TppLine;
      ppLabel3: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppLabel4: TppLabel;
      ppSummaryBand1: TppSummaryBand;
      ppLabel122: TppLabel;
      rptDividas_lblDataRef: TppLabel;
      ppDBText1: TppDBText;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppLine6: TppLine;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppLine1: TppLine;
      ppDBCalc1: TppDBCalc;
      ppDBCalc2: TppDBCalc;
      ppDBCalc3: TppDBCalc;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppDBCalc4: TppDBCalc;
      ppDBCalc5: TppDBCalc;
      ppDBCalc6: TppDBCalc;
      ppShape1: TppShape;
      ppLine3: TppLine;
      ppShape2: TppShape;
      qryDividasIDCONTRATOEMPTMO: TFloatField;
      qryDividasIDTIPOEMPTMO: TFloatField;
      qryDividasDESCTIPOEMPTMO: TStringField;
      qryDividasMOECODIGO: TFloatField;
      qryDividasMOESIGLA: TStringField;
      qryDividasMOEDESC: TStringField;
      qryDividasHMESALDODEV: TFloatField;
      qryDividasVALOR_DEVIDO: TFloatField;
      qryDividasTOTAL: TFloatField;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppDBText7: TppDBText;
      ppLine4: TppLine;
      ppShape3: TppShape;
      ppDBCalc7: TppDBCalc;
      ppDBCalc8: TppDBCalc;
      ppDBCalc9: TppDBCalc;
      ppShape4: TppShape;
      ppLabel9: TppLabel;
      qryDividasVLRCONTRATO: TFloatField;
      qryDividasVLR_PAG: TFloatField;
      ppDBText8: TppDBText;
      ppLabel10: TppLabel;
      ppDBCalc10: TppDBCalc;
      ppDBText9: TppDBText;
      ppLabel12: TppLabel;
      ppDBCalc11: TppDBCalc;
      ppDBCalc12: TppDBCalc;
      ppDBCalc13: TppDBCalc;
      ppDBCalc14: TppDBCalc;
      ppDBCalc15: TppDBCalc;
      lblQuitacao: TppLabel;
    ppLabel26: TppLabel;
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

      procedure rptDividas_lblDataRefPrint(Sender: TObject);
      procedure ppLine3Print(Sender: TObject);
      procedure ppShape2Print(Sender: TObject);


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
  dtmRelDividasIndexador: TdtmRelDividasIndexador;



implementation
{$R *.DFM}
uses
   uSistema, uFuncoesEmptmo, cRelDividasIndexador;



function TdtmRelDividasIndexador.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgreldividasindexador') then
   begin
      frm := TcfgRelDividasIndexador.Create(Application);
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



procedure TdtmRelDividasIndexador.rptDividas_lblDataRefPrint(Sender: TObject);
begin
   inherited;
   (Sender as TppLabel).Caption := sDataRef;
end;



procedure TdtmRelDividasIndexador.ppLine3Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelDividasIndexador.ppShape2Print(Sender: TObject);
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
