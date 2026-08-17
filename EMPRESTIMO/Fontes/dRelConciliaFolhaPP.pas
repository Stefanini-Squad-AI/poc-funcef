unit dRelConciliaFolhaPP;

// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      :
Autor     :
Descrição :
----------------------------------------------------------------------------------------------------
Rotina    :
Data      :
Autor     :
Descrição :
---------------------------------------------------------------------------------------------------}

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, Db, ppBands, ppPrnabl, ppClass, ppCtrls, ppCache, ppProd,
   ppReport, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB, ppDBPipe,
   ppDBBDE, ppVar, ppStrtch, ppSubRpt;

type
   TdtmRelConciliaFolhaPP = class(TdtmReports)
      qryConciliaFolhaPP: TwwQuery;
      pplConciliaFolhaPP: TppBDEPipeline;
      dtsConciliaFolhaPP: TwwDataSource;
      rptConciliaFolhaPP: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel4: TppLabel;
      lblMesCobranca: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppLabel13: TppLabel;
      ppLabel15: TppLabel;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel14: TppLabel;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
      ppLabel19: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppShape3: TppShape;
      ppLine4: TppLine;
      ppDBText1: TppDBText;
      ppDBText7: TppDBText;
      ppDBText2: TppDBText;
      ppDBText5: TppDBText;
      ppDBText9: TppDBText;
      ppDBText8: TppDBText;
      ppDBText6: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppLabel2: TppLabel;
      ppLabel23: TppLabel;
      ppDBText11: TppDBText;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppDBText13: TppDBText;
      ppLine1: TppLine;
      ppShape4: TppShape;
      ppLine5: TppLine;
      ppDBText14: TppDBText;
      ppLabel27: TppLabel;
      ppDBText15: TppDBText;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppGroup3: TppGroup;
      ppGroupHeaderBand3: TppGroupHeaderBand;
      ppGroupFooterBand3: TppGroupFooterBand;
      ppDBText10: TppDBText;
      ppDBText12: TppDBText;
      ppDBText16: TppDBText;
      ppLine6: TppLine;
      ppLabel18: TppLabel;
      ppLine7: TppLine;
      ppLabel20: TppLabel;
      ppLabel22: TppLabel;
      ppLabel26: TppLabel;
      ppLabel29: TppLabel;
      ppShape5: TppShape;
      ppDBText17: TppDBText;
      ppDBText18: TppDBText;
      ppLine8: TppLine;
      ppDBText19: TppDBText;
      ppShape6: TppShape;
      ppDBCalc1: TppDBCalc;
      ppDBCalc2: TppDBCalc;
      ppDBCalc3: TppDBCalc;
      ppDBCalc4: TppDBCalc;
      ppDBCalc5: TppDBCalc;
      ppDBCalc6: TppDBCalc;
      ppShape2: TppShape;
      ppDBCalc7: TppDBCalc;
      ppDBCalc8: TppDBCalc;
      ppDBCalc9: TppDBCalc;
      ppDBCalc10: TppDBCalc;
      ppDBCalc11: TppDBCalc;
      ppDBCalc12: TppDBCalc;
      ppFooterBand1: TppFooterBand;
      ppLabel3: TppLabel;
      ppLine2: TppLine;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppLine3: TppLine;
      ppShape1: TppShape;
      ppLabel5: TppLabel;
      ppLabel21: TppLabel;
      ppLine9: TppLine;
      ppLabel24: TppLabel;
      ppLabel25: TppLabel;
      ppLabel28: TppLabel;
      ppLine10: TppLine;
      ppLabel30: TppLabel;
      ppLabel31: TppLabel;
      ppLabel32: TppLabel;
      ppLabel33: TppLabel;
      lblCabecalhoFolha: TppLabel;
      lblValorDivergFolha: TppLabel;
      lblValorNAOZeroFolha: TppLabel;
      lblValorZeroFolha: TppLabel;
      lblNaoProcessadoFolha: TppLabel;
      lblCabecalhoEP: TppLabel;
      lblValorDivergEP: TppLabel;
      lblValorNAOZeroEP: TppLabel;
      lblValorZeroEP: TppLabel;
      lblNaoProcessadoEP: TppLabel;
      lblDivergFolhaEP: TppLabel;
      linCabecalhoFolha: TppLine;
      linCabecalhoEP: TppLine;
      ppSubReport1: TppSubReport;
      ppChildReport1: TppChildReport;
      ppTitleBand1: TppTitleBand;
      ppDetailBand2: TppDetailBand;
      ppSummaryBand1: TppSummaryBand;
      pplEnviadoSemTmpDesc: TppBDEPipeline;
      pplNaoEnviado: TppBDEPipeline;
      qryHistMovSemTmpDesc: TwwQuery;
      dtsHistMovSemTmpDesc: TwwDataSource;
      qryHistMovNaoEnviado: TwwQuery;
      dtsHistMovNaoEnviado: TwwDataSource;
      ppSubReport2: TppSubReport;
      ppChildReport2: TppChildReport;
      ppSummaryBand2: TppSummaryBand;
      ppTitleBand2: TppTitleBand;
      ppDetailBand3: TppDetailBand;
      ppSummaryBand3: TppSummaryBand;
      ppShape7: TppShape;
      ppLabel34: TppLabel;
      ppLabel35: TppLabel;
      ppLabel36: TppLabel;
      ppLabel37: TppLabel;
      ppLabel38: TppLabel;
      ppLabel39: TppLabel;
      ppLabel40: TppLabel;
      ppShape8: TppShape;
      ppLabel41: TppLabel;
      ppLabel42: TppLabel;
      ppLabel43: TppLabel;
      ppLabel44: TppLabel;
      ppLabel45: TppLabel;
      ppLabel46: TppLabel;
      ppLabel47: TppLabel;

      qryHistMovSemTmpDescIDCONTRATOEMPTMO: TFloatField;
      qryHistMovSemTmpDescNOME: TStringField;
      qryHistMovSemTmpDescMATRICULA: TStringField;
      qryHistMovSemTmpDescTCEDESCRICAO: TStringField;
      qryHistMovSemTmpDescHMEPARCELA: TFloatField;
      qryHistMovSemTmpDescHMENUMPARCELAS: TFloatField;
      qryHistMovSemTmpDescEVENTO: TStringField;
      qryHistMovSemTmpDescORIGEM: TStringField;
      qryHistMovSemTmpDescHMEVLRPREVISTO: TFloatField;
      qryHistMovSemTmpDescHMEVLREFETIVO: TFloatField;

      qryHistMovNaoEnviadoIDCONTRATOEMPTMO: TFloatField;
      qryHistMovNaoEnviadoNOME: TStringField;
      qryHistMovNaoEnviadoMATRICULA: TStringField;
      qryHistMovNaoEnviadoTCEDESCRICAO: TStringField;
      qryHistMovNaoEnviadoHMEPARCELA: TFloatField;
      qryHistMovNaoEnviadoHMENUMPARCELAS: TFloatField;
      qryHistMovNaoEnviadoEVENTO: TStringField;
      qryHistMovNaoEnviadoORIGEM: TStringField;
      qryHistMovNaoEnviadoHMEVLRPREVISTO: TFloatField;
      qryHistMovNaoEnviadoHMEVLREFETIVO: TFloatField;

      qryConciliaFolhaPPNOME_MUTUARIO: TStringField;
      qryConciliaFolhaPPNOME_PLANO: TStringField;
      qryConciliaFolhaPPNOME_PATRO: TStringField;
      qryConciliaFolhaPPNOME_PLANOPATRO: TStringField;
      qryConciliaFolhaPPTCEDESCRICAO: TStringField;
      qryConciliaFolhaPPIDDESCONTO: TFloatField;
      qryConciliaFolhaPPMATRICULA: TStringField;
      qryConciliaFolhaPPINSCRICAONUMERO: TFloatField;
      qryConciliaFolhaPPMESREFERENCIA: TStringField;
      qryConciliaFolhaPPIDPROVENTO: TFloatField;
      qryConciliaFolhaPPCODPROVDESC: TStringField;
      qryConciliaFolhaPPFLGDESCFOLHA: TStringField;
      qryConciliaFolhaPPDATARECEBIMENTO: TDateTimeField;
      qryConciliaFolhaPPPARCELA: TFloatField;
      qryConciliaFolhaPPNUMPARCELAS: TFloatField;
      qryConciliaFolhaPPPARC_RESTA: TFloatField;
      qryConciliaFolhaPPHMEVLRPREVISTO: TFloatField;
      qryConciliaFolhaPPHMEVLREFETIVO: TFloatField;
      qryConciliaFolhaPPVLRNAORECEBIDO: TFloatField;
      qryConciliaFolhaPPVALOR: TFloatField;
      qryConciliaFolhaPPVALORRECEBIDO: TFloatField;
      qryConciliaFolhaPPRESIDUO: TFloatField;
      qryConciliaFolhaPPTIPO_FOLHA: TStringField;
      ppDBText20: TppDBText;
      ppDBText21: TppDBText;
      ppDBText22: TppDBText;
      ppDBText23: TppDBText;
      ppDBText24: TppDBText;
      ppDBText25: TppDBText;
      ppDBText26: TppDBText;
      ppLine11: TppLine;
      ppLine12: TppLine;
      ppDBText27: TppDBText;
      ppDBText28: TppDBText;
      ppDBText29: TppDBText;
      ppDBText30: TppDBText;
      ppDBText31: TppDBText;
      ppDBText32: TppDBText;
      ppDBText33: TppDBText;
      ppLine13: TppLine;
      ppLine14: TppLine;
      ppLabel48: TppLabel;
      ppLabel49: TppLabel;
      ppLine15: TppLine;
      ppDBCalc13: TppDBCalc;
      ppDBCalc14: TppDBCalc;
      ppLine16: TppLine;
      ppDBCalc15: TppDBCalc;
      ppDBCalc16: TppDBCalc;
    lblFolhaPatro: TppLabel;
    lblFolhaBenef: TppLabel;
    ppLabel50: TppLabel;
    ppDBText34: TppDBText;
    ppLabel51: TppLabel;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppLabel52: TppLabel;
    ppDBText37: TppDBText;
    ppLabel53: TppLabel;
    ppDBCalc17: TppDBCalc;
    ppLabel54: TppLabel;
    ppDBCalc18: TppDBCalc;
    ppLabel55: TppLabel;
    lblNaoEnviado: TppLabel;

      procedure ppHeaderBand1BeforePrint(Sender: TObject);
      procedure ppLine4Print(Sender: TObject);
      procedure ppShape3Print(Sender: TObject);
      procedure ppDetailBand1BeforePrint(Sender: TObject);
      procedure ppGroupHeaderBand3BeforePrint(Sender: TObject);
      procedure ppGroupHeaderBand2BeforePrint(Sender: TObject);


   private { Private declarations }

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

   public { Public declarations }

      bSintetico  : Boolean;
      bSeparador  : Boolean;
      CorLinha    : TColor;
      CorAtual    : TColor;
      bCorLinha   : Boolean;

      function MostraParam(Form: string): boolean; override;

   end;



var
  dtmRelConciliaFolhaPP: TdtmRelConciliaFolhaPP;




implementation
{$R *.DFM}
uses
   uSistema, uFuncoesEmptmo, cRelConciliaFolhaPP;



function TdtmRelConciliaFolhaPP.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelconciliafolhapp') then
   begin
      frm := TcfgRelConciliaFolhaPP.Create(Application);
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



procedure TdtmRelConciliaFolhaPP.ppHeaderBand1BeforePrint(Sender: TObject);
begin
   inherited;
   CorAtual := clWhite;
end;



procedure TdtmRelConciliaFolhaPP.ppLine4Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelConciliaFolhaPP.ppShape3Print(Sender: TObject);
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



procedure TdtmRelConciliaFolhaPP.ppDetailBand1BeforePrint(Sender: TObject);
begin
   inherited;
   (Sender as TppDetailBand).Visible := not(bSintetico);
end;



procedure TdtmRelConciliaFolhaPP.ppGroupHeaderBand3BeforePrint(Sender: TObject);
begin
   inherited;
   (Sender as TppGroupHeaderBand).Visible := not(bSintetico);
end;



procedure TdtmRelConciliaFolhaPP.ppGroupHeaderBand2BeforePrint(Sender: TObject);
begin
   inherited;
   (Sender as TppGroupHeaderBand).Visible := bSintetico;
end;



end.
