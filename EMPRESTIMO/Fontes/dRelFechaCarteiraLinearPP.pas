unit dRelFechaCarteiraLinearPP;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE, ppRichTx, ppStrtch, ppMemo;

type
   TdtmRelFechaCarteiraLinearPP = class(TdtmReports)
      pplFechamentoCarteiraCaixa: TppBDEPipeline;
      dsFechamentoCarteiraCaixa: TwwDataSource;
    rptFechaCarteiraLinearPP: TppReport;
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
      ppDBText11: TppDBText;
      ppLine3: TppLine;
      ppLabel5: TppLabel;
      ppLabel9: TppLabel;
      ppSummaryBand1: TppSummaryBand;
      ppLabel122: TppLabel;
      ppLine4: TppLine;
      ppLabel13: TppLabel;
      ppLabel15: TppLabel;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
      qryFechamentoCarteiraPP: TwwQuery;
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
      qryFechamentoCarteiraPPDESCTIPOEMPTMO: TStringField;
      qryFechamentoCarteiraPPTCEDESCRICAO: TStringField;
      qryFechamentoCarteiraPPSALDO_ANT: TFloatField;
      qryFechamentoCarteiraPPTOTALSALDO_ANT: TFloatField;
      qryFechamentoCarteiraPPCONCESSOES: TFloatField;
      qryFechamentoCarteiraPPTOTALCONCESSOES: TFloatField;
      qryFechamentoCarteiraPPPARCELAS_CR: TFloatField;
      qryFechamentoCarteiraPPTOTALPARC_CR: TFloatField;
      qryFechamentoCarteiraPPPARCELAS_FP: TFloatField;
      qryFechamentoCarteiraPPTOTALPARC_FP: TFloatField;
      qryFechamentoCarteiraPPPARCELAS_FB: TFloatField;
      qryFechamentoCarteiraPPTOTALPARC_FB: TFloatField;
      qryFechamentoCarteiraPPENCARGOS_CR: TFloatField;
      qryFechamentoCarteiraPPTOTALENC_CR: TFloatField;
      qryFechamentoCarteiraPPENCARGOS_FP: TFloatField;
      qryFechamentoCarteiraPPTOTALENC_FP: TFloatField;
      qryFechamentoCarteiraPPENCARGOS_FB: TFloatField;
      qryFechamentoCarteiraPPTOTALENC_FB: TFloatField;
      qryFechamentoCarteiraPPAMORTIZACAO_CR: TFloatField;
      qryFechamentoCarteiraPPTOTALAMO_CR: TFloatField;
      qryFechamentoCarteiraPPAMORTIZACAO_FP: TFloatField;
      qryFechamentoCarteiraPPTOTALAMO_FP: TFloatField;
      qryFechamentoCarteiraPPAMORTIZACAO_FB: TFloatField;
      qryFechamentoCarteiraPPTOTALAMO_FB: TFloatField;
      qryFechamentoCarteiraPPQUITACAO_CR: TFloatField;
      qryFechamentoCarteiraPPTOTALQUI_CR: TFloatField;
      qryFechamentoCarteiraPPQUITACAO_FP: TFloatField;
      qryFechamentoCarteiraPPTOTALQUI_FP: TFloatField;
      qryFechamentoCarteiraPPQUITACAO_FB: TFloatField;
      qryFechamentoCarteiraPPTOTALQUI_FB: TFloatField;
      qryFechamentoCarteiraPPPARCELAS_ECR: TFloatField;
      qryFechamentoCarteiraPPTOTALPARC_ECR: TFloatField;
      qryFechamentoCarteiraPPPARCELAS_EFP: TFloatField;
      qryFechamentoCarteiraPPTOTALPARC_EFP: TFloatField;
      qryFechamentoCarteiraPPPARCELAS_EFB: TFloatField;
      qryFechamentoCarteiraPPTOTALPARC_EFB: TFloatField;
      qryFechamentoCarteiraPPENCARGOS_ECR: TFloatField;
      qryFechamentoCarteiraPPTOTALENC_ECR: TFloatField;
      qryFechamentoCarteiraPPENCARGOS_EFP: TFloatField;
      qryFechamentoCarteiraPPTOTALENC_EFP: TFloatField;
      qryFechamentoCarteiraPPENCARGOS_EFB: TFloatField;
      qryFechamentoCarteiraPPTOTALENC_EFB: TFloatField;
      qryFechamentoCarteiraPPAMORTIZACAO_ECR: TFloatField;
      qryFechamentoCarteiraPPTOTALAMO_ECR: TFloatField;
      qryFechamentoCarteiraPPAMORTIZACAO_EFP: TFloatField;
      qryFechamentoCarteiraPPTOTALAMO_EFP: TFloatField;
      qryFechamentoCarteiraPPAMORTIZACAO_EFB: TFloatField;
      qryFechamentoCarteiraPPTOTALAMO_EFB: TFloatField;
      qryFechamentoCarteiraPPQUITACAO_ECR: TFloatField;
      qryFechamentoCarteiraPPTOTALQUI_ECR: TFloatField;
      qryFechamentoCarteiraPPQUITACAO_EFP: TFloatField;
      qryFechamentoCarteiraPPTOTALQUI_EFP: TFloatField;
      qryFechamentoCarteiraPPQUITACAO_EFB: TFloatField;
      qryFechamentoCarteiraPPTOTALQUI_EFB: TFloatField;
      qryFechamentoCarteiraPPREC_PARC_CR: TFloatField;
      qryFechamentoCarteiraPPTOT_REC_PARC_CR: TFloatField;
      qryFechamentoCarteiraPPREC_PARC_FP: TFloatField;
      qryFechamentoCarteiraPPTOT_REC_PARC_FP: TFloatField;
      qryFechamentoCarteiraPPREC_PARC_FB: TFloatField;
      qryFechamentoCarteiraPPTOT_REC_PARC_FB: TFloatField;
      qryFechamentoCarteiraPPABONADOS: TFloatField;
      qryFechamentoCarteiraPPTOT_ABONADOS: TFloatField;
      qryFechamentoCarteiraPPREC_ENC_CR: TFloatField;
      qryFechamentoCarteiraPPTOT_REC_ENC_CR: TFloatField;
      qryFechamentoCarteiraPPREC_ENC_FP: TFloatField;
      qryFechamentoCarteiraPPTOT_REC_ENC_FP: TFloatField;
      qryFechamentoCarteiraPPREC_ENC_FB: TFloatField;
      qryFechamentoCarteiraPPTOT_REC_ENC_FB: TFloatField;
      qryFechamentoCarteiraPPREC_PARC_ATRAS_CR: TFloatField;
      qryFechamentoCarteiraPPTOT_REC_PARC_ATRAS_CR: TFloatField;
      qryFechamentoCarteiraPPREC_PARC_ATRAS_FP: TFloatField;
      qryFechamentoCarteiraPPTOT_REC_PARC_ATRAS_FP: TFloatField;
      qryFechamentoCarteiraPPREC_PARC_ATRAS_FB: TFloatField;
      qryFechamentoCarteiraPPTOT_REC_PARC_ATRAS_FB: TFloatField;
      qryFechamentoCarteiraPPREC_AMORT_CR: TFloatField;
      qryFechamentoCarteiraPPTOT_REC_AMORT_CR: TFloatField;
      qryFechamentoCarteiraPPREC_AMORT_FP: TFloatField;
      qryFechamentoCarteiraPPTOT_REC_AMORT_FP: TFloatField;
      qryFechamentoCarteiraPPREC_AMORT_FB: TFloatField;
      qryFechamentoCarteiraPPTOT_REC_AMORT_FB: TFloatField;
      qryFechamentoCarteiraPPREC_QUIT_CR: TFloatField;
      qryFechamentoCarteiraPPTOT_REC_QUIT_CR: TFloatField;
      qryFechamentoCarteiraPPREC_QUIT_FP: TFloatField;
      qryFechamentoCarteiraPPTOT_REC_QUIT_FP: TFloatField;
      qryFechamentoCarteiraPPREC_QUIT_FB: TFloatField;
      qryFechamentoCarteiraPPTOT_REC_QUIT_FB: TFloatField;
      qryFechamentoCarteiraPPSALDO_DEV: TFloatField;
      qryFechamentoCarteiraPPTOTALSALDO_DEV: TFloatField;
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
      ppLabel30: TppLabel;
      ppLine1: TppLine;
      ppLabel31: TppLabel;
      ppDBText49: TppDBText;
      ppDBText50: TppDBText;
      ppLabel32: TppLabel;
      ppDBText51: TppDBText;
      ppDBText52: TppDBText;
      ppLabel33: TppLabel;
      ppDBText53: TppDBText;
      ppDBText54: TppDBText;
      ppLabel34: TppLabel;
      ppDBText55: TppDBText;
      ppDBText56: TppDBText;
      ppLabel35: TppLabel;
      ppDBText57: TppDBText;
      ppDBText58: TppDBText;
      ppLabel36: TppLabel;
      ppDBText59: TppDBText;
      ppDBText60: TppDBText;
      ppLabel37: TppLabel;
      ppDBText61: TppDBText;
      ppDBText62: TppDBText;
      ppLabel38: TppLabel;
      ppDBText63: TppDBText;
      ppDBText64: TppDBText;
      ppLabel39: TppLabel;
      ppDBText65: TppDBText;
      ppDBText66: TppDBText;
      ppLabel40: TppLabel;
      ppDBText67: TppDBText;
      ppDBText68: TppDBText;
      ppLabel41: TppLabel;
      ppDBText69: TppDBText;
      ppDBText70: TppDBText;
      ppLabel42: TppLabel;
      ppDBText71: TppDBText;
      ppDBText72: TppDBText;
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
      qryFechamentoCarteiraPPNOMEPATRO: TStringField;
      qryFechamentoCarteiraPPNOMEPLANO: TStringField;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppGroup3: TppGroup;
      ppGroupHeaderBand3: TppGroupHeaderBand;
      ppGroupFooterBand3: TppGroupFooterBand;
      ppLabel51: TppLabel;
      ppLabel52: TppLabel;
      ppDBText1: TppDBText;
      ppDBText3: TppDBText;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
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
  dtmRelFechaCarteiraLinearPP: TdtmRelFechaCarteiraLinearPP;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo, uSistema, cRelFechaCarteiraLinearPP;




function TdtmRelFechaCarteiraLinearPP.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelfechacarteiralinearpp') then
   begin
      frm := TcfgRelFechaCarteiraLinearPP.Create(Application);
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



procedure TdtmRelFechaCarteiraLinearPP.ppLine4Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelFechaCarteiraLinearPP.ppShape3Print(Sender: TObject);
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



procedure TdtmRelFechaCarteiraLinearPP.ppLabel13Print(Sender: TObject);
begin
   inherited;
   TppLabel(Sender).Caption := sMesCompetencia;
end;



procedure TdtmRelFechaCarteiraLinearPP.ppShape1Print(Sender: TObject);
begin
   inherited;
   (Sender as TppShape).Brush.Color := clSilver;
end;



end.
