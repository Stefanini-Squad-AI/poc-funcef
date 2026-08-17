unit dRelConciliaContabDia;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppCtrls, ppBands, ppVar, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE, ppStrtch, ppMemo, ppRichTx;

type
   TdtmRelConciliaContabDia = class(TdtmReports)
      pplConciliaContabDia: TppBDEPipeline;
      dtsConciliaContabDia: TwwDataSource;
      qryConciliaContabDia: TwwQuery;
      rptConciliaContabDia: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppLabel122: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppShape3: TppShape;
      ppLine3: TppLine;
      ppFooterBand1: TppFooterBand;
      ppLine2: TppLine;
      ppLabel3: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      rptConciliaContablblDataIni: TppLabel;
      ppLabel5: TppLabel;
      rptConciliaContablblDataFim: TppLabel;
      ppDBtxtContaContabil: TppDBText;
      ppLabel7: TppLabel;
      ppLabel9: TppLabel;
      ppLabel8: TppLabel;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppLabel12: TppLabel;
      ppLabel13: TppLabel;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppLine4: TppLine;
      ppLine5: TppLine;
      ppLine6: TppLine;
      ppLabel14: TppLabel;
      ppLabel15: TppLabel;
      ppLabel16: TppLabel;
      ppGroup4: TppGroup;
      ppGroupHeaderBand4: TppGroupHeaderBand;
      ppGroupFooterBand4: TppGroupFooterBand;
      ppShape2: TppShape;
      ppDBText10: TppDBText;
      ppLine1: TppLine;
    qryConciliaContabDiaDATA: TDateTimeField;
    qryConciliaContabDiaCONTACONTABIL: TStringField;
    qryConciliaContabDiaEPDEB: TFloatField;
    qryConciliaContabDiaEPCRED: TFloatField;
    qryConciliaContabDiaCONTABDEB: TFloatField;
    qryConciliaContabDiaCONTABCRED: TFloatField;
    qryConciliaContabDiaDIFDEB: TFloatField;
    qryConciliaContabDiaDIFCRED: TFloatField;
      ppLabel6: TppLabel;
      lblContaEP: TppLabel;
      lblLancamentoEP: TppLabel;
      lblPlnCodigo: TppLabel;
      lblContaDiverg: TppLabel;
      ppDBCalc1: TppDBCalc;
      ppDBCalc2: TppDBCalc;
      ppDBCalc3: TppDBCalc;
      ppDBCalc4: TppDBCalc;
      ppDBCalc5: TppDBCalc;
      ppDBCalc6: TppDBCalc;
      ppLabel4: TppLabel;
      ppLabel17: TppLabel;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
    qryConciliaContabDiaPLANOME: TStringField;
    qryConciliaContabDiaNOMEMODULO: TStringField;
    ppLabel18: TppLabel;
    lblContaContabil: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppMemo2: TppMemo;
    memPatro: TppRichText;
    memPlano: TppRichText;
    ppMemo1: TppMemo;

      procedure ppDetailBand1BeforePrint(Sender: TObject);
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

      //             $00E8E8E8   cinza bem claro

   public   // Public declarations

      bSeparador        : Boolean;
      CorLinha          : TColor;
      CorAtual          : TColor;
      bCorLinha         : Boolean;

      function MostraParam(Form: String): Boolean; override;


   end;



var
  dtmRelConciliaContabDia: TdtmRelConciliaContabDia;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo, uSistema, cRelConciliaContabDia, uIntegraBack;



function TdtmRelConciliaContabDia.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelconciliacontabdia') then
   begin
      frm := TcfgRelConciliaContabDia.Create(Application);
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



procedure TdtmRelConciliaContabDia.ppDetailBand1BeforePrint(Sender: TObject);
begin
   inherited;
   ppDBtxtContaContabil.DisplayFormat := IntegraBack.MascaraPlano + ';0;';
end;



procedure TdtmRelConciliaContabDia.ppLine3Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelConciliaContabDia.ppShape3Print(Sender: TObject);
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
