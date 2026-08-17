unit dRelFechamentoCarteiraCaixa;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE, ppMemo, ppStrtch, ppRichTx;

type
   TdtmRelFechamentoCarteiraCaixa = class(TdtmReports)
      pplFechamentoCarteiraCaixa: TppBDEPipeline;
      dsFechamentoCarteiraCaixa: TwwDataSource;
      rptFechamentoCarteiraCaixa: TppReport;
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
      ppDBText5: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppShape1: TppShape;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppDBText11: TppDBText;
      ppLabel4: TppLabel;
      ppLabel9: TppLabel;
      ppSummaryBand1: TppSummaryBand;
      ppLine5: TppLine;
      ppDBCalc2: TppDBCalc;
      ppDBCalc6: TppDBCalc;
      ppDBCalc7: TppDBCalc;
      ppDBCalc11: TppDBCalc;
      ppDBCalc15: TppDBCalc;
      ppDBCalc16: TppDBCalc;
      ppLabel122: TppLabel;
      rptContratosAdminAnalShape1: TppShape;
      ppShape2: TppShape;
      ppLine4: TppLine;
      ppShape3: TppShape;
      ppLabel13: TppLabel;
      ppLabel15: TppLabel;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
      ppLabel19: TppLabel;
      ppLine1: TppLine;
      qryFechamentoCarteiraCaixa: TwwQuery;
      ppDBText15: TppDBText;
      ppDBText17: TppDBText;
      ppDBText18: TppDBText;
      ppDBCalc22: TppDBCalc;
      ppDBCalc24: TppDBCalc;
      ppDBCalc25: TppDBCalc;
      ppDBCalc31: TppDBCalc;
      ppDBCalc33: TppDBCalc;
      ppDBCalc34: TppDBCalc;
      ppLabel12: TppLabel;
      ppDBText10: TppDBText;
      ppDBText16: TppDBText;
      ppDBCalc17: TppDBCalc;
      ppDBCalc18: TppDBCalc;
      ppDBCalc23: TppDBCalc;
      ppDBCalc26: TppDBCalc;
      ppLabel20: TppLabel;
      ppLine6: TppLine;
      ppLabel23: TppLabel;
      ppDBText2: TppDBText;
      ppDBText6: TppDBText;
      ppDBText19: TppDBText;
      ppDBText20: TppDBText;
      ppDBCalc3: TppDBCalc;
      ppDBCalc5: TppDBCalc;
      ppDBCalc12: TppDBCalc;
      ppDBCalc14: TppDBCalc;
      ppDBCalc19: TppDBCalc;
      ppDBCalc27: TppDBCalc;
      ppDBCalc35: TppDBCalc;
      ppDBCalc36: TppDBCalc;
      ppDBCalc37: TppDBCalc;
      ppDBCalc38: TppDBCalc;
      ppDBCalc39: TppDBCalc;
      ppDBCalc40: TppDBCalc;
      ppDBText21: TppDBText;
      ppDBText22: TppDBText;
      ppDBText25: TppDBText;
      ppDBText26: TppDBText;
      ppDBText27: TppDBText;
      ppDBText28: TppDBText;
      ppDBCalc41: TppDBCalc;
      ppDBCalc42: TppDBCalc;
      ppDBCalc43: TppDBCalc;
      ppDBCalc44: TppDBCalc;
      ppDBCalc47: TppDBCalc;
      ppDBCalc48: TppDBCalc;
      ppDBCalc49: TppDBCalc;
      ppDBCalc50: TppDBCalc;
      ppDBCalc51: TppDBCalc;
      ppDBCalc52: TppDBCalc;
      ppLabel18: TppLabel;
      ppLabel24: TppLabel;
      ppLabel10: TppLabel;
      ppLabel25: TppLabel;
      ppDBText4: TppDBText;
      ppDBText14: TppDBText;
      ppDBCalc1: TppDBCalc;
      ppDBCalc10: TppDBCalc;
    qryFechamentoCarteiraCaixaDESCTIPOEMPTMO: TStringField;
    qryFechamentoCarteiraCaixaTCEDESCRICAO: TStringField;
    qryFechamentoCarteiraCaixaSALDO_ANT: TFloatField;
    qryFechamentoCarteiraCaixaTOTALSALDO_ANT: TFloatField;
    qryFechamentoCarteiraCaixaCONCESSOES: TFloatField;
    qryFechamentoCarteiraCaixaTOTALCONCESSOES: TFloatField;
    qryFechamentoCarteiraCaixaPARCELAS: TFloatField;
    qryFechamentoCarteiraCaixaTOTALPARC: TFloatField;
    qryFechamentoCarteiraCaixaENCARGOS: TFloatField;
    qryFechamentoCarteiraCaixaTOTALENC: TFloatField;
    qryFechamentoCarteiraCaixaAMORTIZACAO: TFloatField;
    qryFechamentoCarteiraCaixaTOTALAMO: TFloatField;
    qryFechamentoCarteiraCaixaQUITACAO: TFloatField;
    qryFechamentoCarteiraCaixaTOTALQUI: TFloatField;
    qryFechamentoCarteiraCaixaREC_PARC: TFloatField;
    qryFechamentoCarteiraCaixaTOT_REC_PARC: TFloatField;
    qryFechamentoCarteiraCaixaREC_ENC: TFloatField;
    qryFechamentoCarteiraCaixaTOT_REC_ENC: TFloatField;
    qryFechamentoCarteiraCaixaREC_PARC_ATRAS: TFloatField;
    qryFechamentoCarteiraCaixaTOT_REC_PARC_ATRAS: TFloatField;
    qryFechamentoCarteiraCaixaREC_AMORT: TFloatField;
    qryFechamentoCarteiraCaixaTOT_REC_AMORT: TFloatField;
    qryFechamentoCarteiraCaixaREC_QUIT: TFloatField;
    qryFechamentoCarteiraCaixaTOT_REC_QUIT: TFloatField;
    qryFechamentoCarteiraCaixaSALDO_DEV: TFloatField;
    qryFechamentoCarteiraCaixaTOTALSALDO_DEV: TFloatField;
    ppLabel6: TppLabel;
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
    ppDBText9: TppDBText;
    ppDBText12: TppDBText;
    ppDBText3: TppDBText;
    ppDBText13: TppDBText;
    ppLabel5: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel11: TppLabel;
    qryFechamentoCarteiraCaixaABONADO: TFloatField;
    qryFechamentoCarteiraCaixaTOT_ABONADO: TFloatField;
    qryFechamentoCarteiraCaixaQUITADO: TFloatField;
    qryFechamentoCarteiraCaixaTOT_QUITADO: TFloatField;
    ppDBCalc4: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppDBCalc20: TppDBCalc;
    ppDBCalc21: TppDBCalc;
    ppDBCalc28: TppDBCalc;
    ppDBCalc29: TppDBCalc;
    lblApropriado: TppLabel;
    lblAbonoContab: TppLabel;
    lblRenovacao: TppLabel;
    upd: TUpdateSQL;

      procedure ppLine4Print(Sender: TObject);
      procedure ppShape3Print(Sender: TObject);
      procedure ppLabel13Print(Sender: TObject);
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

      sMesCompetencia   : String;
      bSeparador        : Boolean;
      CorLinha          : TColor;
      CorAtual          : TColor;
      bCorLinha         : Boolean;

      function MostraParam(Form: string): boolean; override;

   end;



var
  dtmRelFechamentoCarteiraCaixa: TdtmRelFechamentoCarteiraCaixa;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo, uSistema, cRelFechamentoCarteiraCaixa;




function TdtmRelFechamentoCarteiraCaixa.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelfechamentocarteiracaixa') then
   begin
      frm := TcfgRelFechamentoCarteiraCaixa.Create(Application);
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



procedure TdtmRelFechamentoCarteiraCaixa.ppLine4Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelFechamentoCarteiraCaixa.ppShape3Print(Sender: TObject);
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



procedure TdtmRelFechamentoCarteiraCaixa.ppLabel13Print(Sender: TObject);
begin
   inherited;
   TppLabel(Sender).Caption := sMesCompetencia;
end;



procedure TdtmRelFechamentoCarteiraCaixa.ppShape1Print(Sender: TObject);
begin
   inherited;
   (Sender as TppShape).Brush.Color := clSilver;
end;



end.
