unit dRelFechamentoCarteiraLinear;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE, ppMemo, ppStrtch, ppRichTx;

type
   TdtmRelFechamentoCarteiraLinear = class(TdtmReports)
      pplFechamentoCarteiraCaixa: TppBDEPipeline;
      dsFechamentoCarteiraCaixa: TwwDataSource;
      rptFechamentoCarteiraLinear: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      ppLine2: TppLine;
      ppLabel3: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppDBText5: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppShape1: TppShape;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppLabel9: TppLabel;
      ppSummaryBand1: TppSummaryBand;
      ppLabel122: TppLabel;
      ppLine4: TppLine;
      ppLabel13: TppLabel;
      ppLabel15: TppLabel;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
      qryFechamentoCarteiraCaixa: TwwQuery;
      ppDBText15: TppDBText;
      ppDBText17: TppDBText;
      ppDBText18: TppDBText;
      ppLabel12: TppLabel;
      ppDBText10: TppDBText;
      ppDBText16: TppDBText;
      ppLabel20: TppLabel;
      ppLine6: TppLine;
      ppLabel23: TppLabel;
      ppDBText2: TppDBText;
      ppDBText6: TppDBText;
      ppDBText9: TppDBText;
      ppDBText12: TppDBText;
      ppDBText19: TppDBText;
      ppDBText20: TppDBText;
      ppDBText21: TppDBText;
      ppDBText22: TppDBText;
      ppDBText25: TppDBText;
      ppDBText26: TppDBText;
      ppDBText27: TppDBText;
      ppDBText28: TppDBText;
      ppLabel24: TppLabel;
      ppLabel10: TppLabel;
      ppLabel25: TppLabel;
      ppDBText4: TppDBText;
      ppDBText14: TppDBText;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      upd: TUpdateSQL;
      ppLabel8: TppLabel;
      ppDBText23: TppDBText;
      ppDBText24: TppDBText;
      ppLabel14: TppLabel;
      ppDBText29: TppDBText;
      ppDBText30: TppDBText;
      ppLabel21: TppLabel;
      ppLine7: TppLine;
      ppLabel22: TppLabel;
      ppDBText31: TppDBText;
      ppDBText32: TppDBText;
      ppLabel26: TppLabel;
      ppDBText33: TppDBText;
      ppDBText34: TppDBText;
      ppSystemVariable2: TppSystemVariable;
      ppLabel4: TppLabel;
      ppDBText35: TppDBText;
      ppDBText36: TppDBText;
      ppLabel11: TppLabel;
      ppLabel18: TppLabel;
      ppDBText37: TppDBText;
      ppDBText38: TppDBText;
      ppDBText39: TppDBText;
      ppDBText40: TppDBText;
      ppLabel19: TppLabel;
      ppLabel27: TppLabel;
      ppDBText41: TppDBText;
      ppDBText42: TppDBText;
      ppDBText43: TppDBText;
      ppDBText44: TppDBText;
      ppLabel28: TppLabel;
      ppLabel29: TppLabel;
      ppDBText45: TppDBText;
      ppDBText46: TppDBText;
      ppDBText47: TppDBText;
      ppDBText48: TppDBText;
      ppLabel43: TppLabel;
      ppLabel44: TppLabel;
      ppDBText73: TppDBText;
      ppDBText74: TppDBText;
      ppDBText75: TppDBText;
      ppDBText76: TppDBText;
      ppLabel45: TppLabel;
      ppLabel46: TppLabel;
      ppDBText77: TppDBText;
      ppDBText78: TppDBText;
      ppDBText79: TppDBText;
      ppDBText80: TppDBText;
      ppLabel47: TppLabel;
      ppLabel48: TppLabel;
      ppDBText81: TppDBText;
      ppDBText82: TppDBText;
      ppDBText83: TppDBText;
      ppDBText84: TppDBText;
      ppLabel49: TppLabel;
      ppLabel50: TppLabel;
      ppDBText85: TppDBText;
      ppDBText86: TppDBText;
      ppDBText87: TppDBText;
      ppDBText88: TppDBText;
      ppShape2: TppShape;
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
    ppLabel51: TppLabel;
    ppDBText1: TppDBText;
    ppDBText3: TppDBText;
    ppDBText13: TppDBText;
    ppDBText11: TppDBText;
    lblApropriado: TppLabel;
    lblAbonoContab: TppLabel;
    lblRenovacao: TppLabel;
    qryFechamentoCarteiraCaixaDESCTIPOEMPTMO: TStringField;
    qryFechamentoCarteiraCaixaTCEDESCRICAO: TStringField;
    qryFechamentoCarteiraCaixaSALDO_ANT: TFloatField;
    qryFechamentoCarteiraCaixaTOTALSALDO_ANT: TFloatField;
    qryFechamentoCarteiraCaixaCONCESSOES: TFloatField;
    qryFechamentoCarteiraCaixaTOTALCONCESSOES: TFloatField;
    qryFechamentoCarteiraCaixaPARCELAS_CR: TFloatField;
    qryFechamentoCarteiraCaixaTOTALPARC_CR: TFloatField;
    qryFechamentoCarteiraCaixaPARCELAS_FP: TFloatField;
    qryFechamentoCarteiraCaixaTOTALPARC_FP: TFloatField;
    qryFechamentoCarteiraCaixaPARCELAS_FB: TFloatField;
    qryFechamentoCarteiraCaixaTOTALPARC_FB: TFloatField;
    qryFechamentoCarteiraCaixaENCARGOS_CR: TFloatField;
    qryFechamentoCarteiraCaixaTOTALENC_CR: TFloatField;
    qryFechamentoCarteiraCaixaENCARGOS_FP: TFloatField;
    qryFechamentoCarteiraCaixaTOTALENC_FP: TFloatField;
    qryFechamentoCarteiraCaixaENCARGOS_FB: TFloatField;
    qryFechamentoCarteiraCaixaTOTALENC_FB: TFloatField;
    qryFechamentoCarteiraCaixaAMORTIZACAO_CR: TFloatField;
    qryFechamentoCarteiraCaixaTOTALAMO_CR: TFloatField;
    qryFechamentoCarteiraCaixaAMORTIZACAO_FP: TFloatField;
    qryFechamentoCarteiraCaixaTOTALAMO_FP: TFloatField;
    qryFechamentoCarteiraCaixaAMORTIZACAO_FB: TFloatField;
    qryFechamentoCarteiraCaixaTOTALAMO_FB: TFloatField;
    qryFechamentoCarteiraCaixaQUITACAO_CR: TFloatField;
    qryFechamentoCarteiraCaixaTOTALQUI_CR: TFloatField;
    qryFechamentoCarteiraCaixaQUITACAO_FP: TFloatField;
    qryFechamentoCarteiraCaixaTOTALQUI_FP: TFloatField;
    qryFechamentoCarteiraCaixaQUITACAO_FB: TFloatField;
    qryFechamentoCarteiraCaixaTOTALQUI_FB: TFloatField;
    qryFechamentoCarteiraCaixaREC_PARC_CR: TFloatField;
    qryFechamentoCarteiraCaixaTOT_REC_PARC_CR: TFloatField;
    qryFechamentoCarteiraCaixaREC_PARC_FP: TFloatField;
    qryFechamentoCarteiraCaixaTOT_REC_PARC_FP: TFloatField;
    qryFechamentoCarteiraCaixaREC_PARC_FB: TFloatField;
    qryFechamentoCarteiraCaixaTOT_REC_PARC_FB: TFloatField;
    qryFechamentoCarteiraCaixaREC_ENC_CR: TFloatField;
    qryFechamentoCarteiraCaixaTOT_REC_ENC_CR: TFloatField;
    qryFechamentoCarteiraCaixaREC_ENC_FP: TFloatField;
    qryFechamentoCarteiraCaixaTOT_REC_ENC_FP: TFloatField;
    qryFechamentoCarteiraCaixaREC_ENC_FB: TFloatField;
    qryFechamentoCarteiraCaixaTOT_REC_ENC_FB: TFloatField;
    qryFechamentoCarteiraCaixaREC_AMORT_CR: TFloatField;
    qryFechamentoCarteiraCaixaTOT_REC_AMORT_CR: TFloatField;
    qryFechamentoCarteiraCaixaREC_AMORT_FP: TFloatField;
    qryFechamentoCarteiraCaixaTOT_REC_AMORT_FP: TFloatField;
    qryFechamentoCarteiraCaixaREC_AMORT_FB: TFloatField;
    qryFechamentoCarteiraCaixaTOT_REC_AMORT_FB: TFloatField;
    qryFechamentoCarteiraCaixaREC_QUIT_CR: TFloatField;
    qryFechamentoCarteiraCaixaTOT_REC_QUIT_CR: TFloatField;
    qryFechamentoCarteiraCaixaREC_QUIT_FP: TFloatField;
    qryFechamentoCarteiraCaixaTOT_REC_QUIT_FP: TFloatField;
    qryFechamentoCarteiraCaixaREC_QUIT_FB: TFloatField;
    qryFechamentoCarteiraCaixaTOT_REC_QUIT_FB: TFloatField;
    qryFechamentoCarteiraCaixaABONADO: TFloatField;
    qryFechamentoCarteiraCaixaTOT_ABONADO: TFloatField;
    qryFechamentoCarteiraCaixaQUITADO: TFloatField;
    qryFechamentoCarteiraCaixaTOT_QUITADO: TFloatField;
    qryFechamentoCarteiraCaixaSALDO_DEV: TFloatField;
    qryFechamentoCarteiraCaixaTOTALSALDO_DEV: TFloatField;

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
  dtmRelFechamentoCarteiraLinear: TdtmRelFechamentoCarteiraLinear;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo, uSistema, cRelFechamentoCarteiraLinear;




function TdtmRelFechamentoCarteiraLinear.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelfechamentocarteiralinear') then
   begin
      frm := TcfgRelFechamentoCarteiraLinear.Create(Application);
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



procedure TdtmRelFechamentoCarteiraLinear.ppLine4Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelFechamentoCarteiraLinear.ppShape3Print(Sender: TObject);
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



procedure TdtmRelFechamentoCarteiraLinear.ppLabel13Print(Sender: TObject);
begin
   inherited;
   TppLabel(Sender).Caption := sMesCompetencia;
end;



procedure TdtmRelFechamentoCarteiraLinear.ppShape1Print(Sender: TObject);
begin
   inherited;
   (Sender as TppShape).Brush.Color := clSilver;
end;



end.
