unit dRelFechamentoCarteiraPP;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE, ppMemo, ppStrtch, ppRichTx;

type
   TdtmRelFechamentoCarteiraPP = class(TdtmReports)
      pplFechamentoCarteiraPP: TppBDEPipeline;
      dsFechamentoCarteiraPP: TwwDataSource;
      rptFechamentoCarteiraPP: TppReport;
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
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText5: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppShape1: TppShape;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppDBText11: TppDBText;
      ppLine3: TppLine;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel7: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppSummaryBand1: TppSummaryBand;
      ppLine5: TppLine;
      ppDBCalc2: TppDBCalc;
      ppDBCalc3: TppDBCalc;
      ppDBCalc4: TppDBCalc;
      ppDBCalc6: TppDBCalc;
      ppDBCalc7: TppDBCalc;
      ppDBCalc8: TppDBCalc;
      ppDBCalc9: TppDBCalc;
      ppDBCalc11: TppDBCalc;
      ppDBCalc12: TppDBCalc;
      ppDBCalc13: TppDBCalc;
      ppDBCalc15: TppDBCalc;
      ppDBCalc16: TppDBCalc;
      ppDBCalc17: TppDBCalc;
      ppDBCalc18: TppDBCalc;
      ppLabel122: TppLabel;
      rptContratosAdminAnalShape1: TppShape;
      ppShape2: TppShape;
      ppLine4: TppLine;
      ppShape3: TppShape;
      ppLabel13: TppLabel;
      ppLabel15: TppLabel;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
      ppLabel18: TppLabel;
      ppLabel19: TppLabel;
      ppLine1: TppLine;
      qryFechamentoCarteiraPP: TwwQuery;
      ppDBText12: TppDBText;
      ppDBText13: TppDBText;
      ppDBText15: TppDBText;
      ppDBText17: TppDBText;
      ppDBText18: TppDBText;
      ppDBText19: TppDBText;
      ppDBText20: TppDBText;
      ppDBCalc19: TppDBCalc;
      ppDBCalc20: TppDBCalc;
      ppDBCalc22: TppDBCalc;
      ppDBCalc24: TppDBCalc;
      ppDBCalc25: TppDBCalc;
      ppDBCalc26: TppDBCalc;
      ppDBCalc27: TppDBCalc;
      ppDBCalc28: TppDBCalc;
      ppDBCalc29: TppDBCalc;
      ppDBCalc31: TppDBCalc;
      ppDBCalc33: TppDBCalc;
      ppDBCalc34: TppDBCalc;
      ppDBCalc35: TppDBCalc;
      ppDBCalc36: TppDBCalc;
      ppLabel6: TppLabel;
      ppLabel8: TppLabel;
      ppDBText4: TppDBText;
      ppDBText6: TppDBText;
      ppDBCalc1: TppDBCalc;
      ppDBCalc5: TppDBCalc;
      ppDBCalc10: TppDBCalc;
      ppDBCalc14: TppDBCalc;
      ppDBText16: TppDBText;
      ppDBCalc23: TppDBCalc;
      ppDBCalc32: TppDBCalc;
      ppLabel14: TppLabel;
      ppLabel20: TppLabel;
      upd: TUpdateSQL;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppGroup3: TppGroup;
      ppGroupHeaderBand3: TppGroupHeaderBand;
      ppGroupFooterBand3: TppGroupFooterBand;
      ppDBText14: TppDBText;
      ppDBText21: TppDBText;
      qryFechamentoCarteiraPPDESCTIPOEMPTMO: TStringField;
      qryFechamentoCarteiraPPTCEDESCRICAO: TStringField;
      qryFechamentoCarteiraPPNOMEPLANO: TStringField;
      qryFechamentoCarteiraPPNOMEPATRO: TStringField;
      qryFechamentoCarteiraPPSALDODEV: TFloatField;
      qryFechamentoCarteiraPPTOTALSLDDEV: TFloatField;
      qryFechamentoCarteiraPPCONCESSOES: TFloatField;
      qryFechamentoCarteiraPPTOTALCONCESSOES: TFloatField;
      qryFechamentoCarteiraPPTOTALQUIPARC: TFloatField;
      qryFechamentoCarteiraPPPARCELAS: TFloatField;
      qryFechamentoCarteiraPPTOTALPARC: TFloatField;
      qryFechamentoCarteiraPPENCERRADOS: TFloatField;
      qryFechamentoCarteiraPPTOTAL_ENCERRA: TFloatField;
      qryFechamentoCarteiraPPAMORTIZACAO: TFloatField;
      qryFechamentoCarteiraPPTOTALAMO: TFloatField;
      qryFechamentoCarteiraPPQUITACAO: TFloatField;
      qryFechamentoCarteiraPPTOTALQUI: TFloatField;
      qryFechamentoCarteiraPPQUIT_MORT: TFloatField;
      qryFechamentoCarteiraPPTOTALQUM: TFloatField;
      qryFechamentoCarteiraPPSALDOATU: TFloatField;
      qryFechamentoCarteiraPPTOTALSLA: TFloatField;
    ppLine6: TppLine;
    ppLine7: TppLine;
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
  dtmRelFechamentoCarteiraPP: TdtmRelFechamentoCarteiraPP;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo, uSistema, cRelFechamentoCarteiraPP;




function TdtmRelFechamentoCarteiraPP.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelfechamentocarteirapp') then
   begin
      frm := TcfgRelFechamentoCarteiraPP.Create(Application);
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



procedure TdtmRelFechamentoCarteiraPP.ppLine4Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelFechamentoCarteiraPP.ppShape3Print(Sender: TObject);
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



procedure TdtmRelFechamentoCarteiraPP.ppLabel13Print(Sender: TObject);
begin
   inherited;
   TppLabel(Sender).Caption := sMesCompetencia;
end;



procedure TdtmRelFechamentoCarteiraPP.ppShape1Print(Sender: TObject);
begin
   inherited;
   (Sender as TppShape).Brush.Color := clSilver;
end;



end.
