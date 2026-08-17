unit dRelConciliaCaPCar;

// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      :
Autor     :
Pendência :
Descrição :
----------------------------------------------------------------------------------------------------
Rotina    :
Data      :
Autor     :
Pendência :
Descrição :
---------------------------------------------------------------------------------------------------}

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, Db, ppBands, ppPrnabl, ppClass, ppCtrls, ppCache, ppProd,
   ppReport, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB, ppDBPipe,
   ppDBBDE, ppVar, ppStrtch, ppSubRpt;

type
   TdtmRelConciliaCapCar = class(TdtmReports)
      qryConciliaCapCar: TwwQuery;
      pplConciliaCapCar: TppBDEPipeline;
      dtsConciliaCapCar: TwwDataSource;
      rptConciliaCapCar: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel4: TppLabel;
      lblDataIni: TppLabel;
      ppLabel9: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppShape3: TppShape;
      ppLine4: TppLine;
      ppDBText7: TppDBText;
      ppDBText2: TppDBText;
      ppDBText5: TppDBText;
      ppDBText9: TppDBText;
      ppDBText8: TppDBText;
      ppLabel2: TppLabel;
      ppDBText11: TppDBText;
      ppLine1: TppLine;
      ppDBText10: TppDBText;
      ppDBText12: TppDBText;
      ppDBText16: TppDBText;
      ppShape5: TppShape;
      ppDBText17: TppDBText;
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
      ppGroup4: TppGroup;
      ppGroupHeaderBand4: TppGroupHeaderBand;
      ppGroupFooterBand4: TppGroupFooterBand;
      ppGroup5: TppGroup;
      ppGroupHeaderBand5: TppGroupHeaderBand;
      ppGroupFooterBand5: TppGroupFooterBand;
      ppLabel6: TppLabel;
      ppDBText1: TppDBText;
      lblDataFim: TppLabel;
      ppLabel10: TppLabel;
      ppLine5: TppLine;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppSubReport1: TppSubReport;
      ppChildReport1: TppChildReport;
      ppTitleBand1: TppTitleBand;
      ppDetailBand2: TppDetailBand;
      ppSummaryBand1: TppSummaryBand;
      dtsHistMov: TwwDataSource;
      qryHistMov: TwwQuery;
      pplHistMov: TppBDEPipeline;
      ppLabel11: TppLabel;
      ppLabel13: TppLabel;
      ppLabel19: TppLabel;
      ppDBText3: TppDBText;
      qryHistMovIDCONTRATOEMPTMO: TFloatField;
      qryHistMovNOME: TStringField;
      qryHistMovMATRICULA: TStringField;
      qryHistMovTCEDESCRICAO: TStringField;
      qryHistMovHMEPARCELA: TFloatField;
      qryHistMovHMENUMPARCELAS: TFloatField;
      qryHistMovEVENTO: TStringField;
      qryHistMovORIGEM: TStringField;
      qryHistMovHMEVLRPREVISTO: TFloatField;
      qryHistMovHMEVLREFETIVO: TFloatField;
      ppLabel12: TppLabel;
      ppDBText4: TppDBText;
      ppDBText6: TppDBText;
      ppLabel14: TppLabel;
      ppShape4: TppShape;
      ppDBText13: TppDBText;
      ppDBText14: TppDBText;
      ppLabel15: TppLabel;
      ppLine6: TppLine;
      ppLabel16: TppLabel;
      ppDBText15: TppDBText;
      ppDBText18: TppDBText;
      ppLine7: TppLine;
      ppLine8: TppLine;
      qryHistMovCODDOCUMENTO: TFloatField;
      ppDBCalc1: TppDBCalc;
      ppDBCalc2: TppDBCalc;
      linCabecalhoFolha: TppLine;
      lblCabecalhoFolha: TppLabel;
      lblValorDivergFolha: TppLabel;
      lblValorNAOZeroFolha: TppLabel;
      lblValorZeroFolha: TppLabel;
      lblNaoProcessadoFolha: TppLabel;
      lblCabecalhoEP: TppLabel;
      lblValorDivergEP: TppLabel;
      lblValorNAOZeroEP: TppLabel;
      lblValorZeroEP: TppLabel;
      lblDivergFolhaEP: TppLabel;
      linCabecalhoEP: TppLine;
      pplEnviadoSemTmpDesc: TppBDEPipeline;
      pplNaoEnviado: TppBDEPipeline;
    lblCaP: TppLabel;
    lblCaR: TppLabel;
      ppSummaryBand2: TppSummaryBand;
      ppSubReport2: TppSubReport;
      ppChildReport2: TppChildReport;
      ppSubReport3: TppSubReport;
      ppChildReport3: TppChildReport;

      qryConciliaCapCarDATA_REF: TDateTimeField;
      qryConciliaCapCarCODDOCUMENTO: TFloatField;
      qryConciliaCapCarNODOCUMENTO: TFloatField;
      qryConciliaCapCarCOMPLDOCUMENTO: TStringField;
      qryConciliaCapCarNODOCUMENTO_COMPL: TStringField;
      qryConciliaCapCarREC_PAG: TStringField;
      qryConciliaCapCarREC_PAG_DATA: TStringField;
      qryConciliaCapCarPESSOA_DOCUMENTO: TStringField;
      qryConciliaCapCarHMEVLRPREVISTO: TFloatField;
      qryConciliaCapCarHMEVLREFETIVO: TFloatField;
      qryConciliaCapCarVLRNAORECEBIDO: TFloatField;
      qryConciliaCapCarVALOR_LANCADO: TFloatField;
      qryConciliaCapCarVALOR_BAIXADO: TFloatField;
      qryConciliaCapCarRESIDUO: TFloatField;

      qryHistMovSemTmpDesc: TwwQuery;
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
      dtsHistMovSemTmpDesc: TwwDataSource;

      qryHistMovNaoEnviado: TwwQuery;
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
      dtsHistMovNaoEnviado: TwwDataSource;
      ppTitleBand2: TppTitleBand;
      ppDetailBand3: TppDetailBand;
      ppSummaryBand3: TppSummaryBand;
      ppTitleBand3: TppTitleBand;
      ppDetailBand4: TppDetailBand;
      ppSummaryBand4: TppSummaryBand;
      ppShape7: TppShape;
      ppLabel34: TppLabel;
      ppLabel35: TppLabel;
      ppLabel36: TppLabel;
      ppLabel37: TppLabel;
      ppLabel38: TppLabel;
      ppLabel39: TppLabel;
      ppLabel40: TppLabel;
      ppLabel48: TppLabel;
      ppShape6: TppShape;
      ppLabel20: TppLabel;
      ppLabel22: TppLabel;
      ppLabel23: TppLabel;
      ppLabel26: TppLabel;
      ppLabel27: TppLabel;
      ppLabel29: TppLabel;
      ppLabel41: TppLabel;
      ppLabel42: TppLabel;
      ppLine12: TppLine;
      ppLine11: TppLine;
      ppDBText20: TppDBText;
      ppDBText21: TppDBText;
      ppDBText22: TppDBText;
      ppDBText23: TppDBText;
      ppDBText24: TppDBText;
      ppDBText25: TppDBText;
      ppDBText26: TppDBText;
      ppLine13: TppLine;
      ppLine14: TppLine;
      ppDBText27: TppDBText;
      ppDBText28: TppDBText;
      ppDBText29: TppDBText;
      ppDBText30: TppDBText;
      ppDBText31: TppDBText;
      ppDBText32: TppDBText;
      ppDBText33: TppDBText;
      ppLine15: TppLine;
      ppDBCalc13: TppDBCalc;
      ppDBCalc14: TppDBCalc;
      ppLine16: TppLine;
      ppDBCalc15: TppDBCalc;
      ppDBCalc16: TppDBCalc;
      ppDBText34: TppDBText;
      ppLabel51: TppLabel;
      ppDBText35: TppDBText;
      ppLabel50: TppLabel;
      ppDBText19: TppDBText;
      ppLabel17: TppLabel;
      ppDBText36: TppDBText;
      ppLabel18: TppLabel;
    pplDocSemVinculo: TppBDEPipeline;
    qryDocSemVinculo: TwwQuery;
    dtsDocSemVinculo: TwwDataSource;
    ppSubReport4: TppSubReport;
    ppChildReport4: TppChildReport;
    ppTitleBand4: TppTitleBand;
    ppDetailBand5: TppDetailBand;
    ppSummaryBand5: TppSummaryBand;
    qryDocSemVinculoDATA_REF: TDateTimeField;
    qryDocSemVinculoCODDOCUMENTO: TFloatField;
    qryDocSemVinculoNODOCUMENTO: TFloatField;
    qryDocSemVinculoCOMPLDOCUMENTO: TStringField;
    qryDocSemVinculoNODOCUMENTO_COMPL: TStringField;
    qryDocSemVinculoREC_PAG: TStringField;
    qryDocSemVinculoREC_PAG_DATA: TStringField;
    qryDocSemVinculoPESSOA_DOCUMENTO: TStringField;
    qryDocSemVinculoVALOR_LANCADO: TFloatField;
    qryDocSemVinculoVALOR_BAIXADO: TFloatField;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppLabel47: TppLabel;
    ppLabel49: TppLabel;
    qryHistMovSemTmpDescHMEDATAVENCTO: TDateTimeField;
    qryHistMovNaoEnviadoHMEDATAVENCTO: TDateTimeField;
    ppShape8: TppShape;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLabel52: TppLabel;
    ppDBText43: TppDBText;
    ppLabel53: TppLabel;
    ppLine19: TppLine;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppLabel54: TppLabel;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppLabel55: TppLabel;
    qryHistMovSemTmpDescHMERECPAG: TStringField;
    qryHistMovNaoEnviadoHMERECPAG: TStringField;
    ppDBText46: TppDBText;
    ppLine21: TppLine;
    lblNaoEnviado: TppLabel;

      procedure ppHeaderBand1BeforePrint(Sender: TObject);
      procedure ppLine4Print(Sender: TObject);
      procedure ppShape3Print(Sender: TObject);
      procedure ppDetailBand1BeforePrint(Sender: TObject);
      procedure ppDBText3Print(Sender: TObject);
      procedure ppSubReport1Print(Sender: TObject);


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

      bSintetico  : Boolean;
      bSeparador  : Boolean;
      CorLinha    : TColor;
      CorAtual    : TColor;
      bCorLinha   : Boolean;

      dDataIni    : TDateTime;
      dDataFim    : TDateTime;

      function MostraParam(Form: string): boolean; override;

   end;



var
  dtmRelConciliaCapCar: TdtmRelConciliaCapCar;




implementation
{$R *.DFM}
uses
   uSistema, uFuncoesEmptmo, cRelConciliaCapCar;



function TdtmRelConciliaCapCar.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelconciliacapcar') then
   begin
      frm := TcfgRelConciliaCapCar.Create(Application);
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



procedure TdtmRelConciliaCapCar.ppHeaderBand1BeforePrint(Sender: TObject);
begin
   inherited;
   CorAtual := clWhite;
end;



procedure TdtmRelConciliaCapCar.ppLine4Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelConciliaCapCar.ppShape3Print(Sender: TObject);
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



procedure TdtmRelConciliaCapCar.ppDetailBand1BeforePrint(Sender: TObject);
begin
   inherited;
   (Sender as TppDetailBand).Visible := not(bSintetico);
end;



procedure TdtmRelConciliaCapCar.ppDBText3Print(Sender: TObject);
begin
   inherited;
   (Sender as TppDBText).Visible := bSintetico;
end;



procedure TdtmRelConciliaCapCar.ppSubReport1Print(Sender: TObject);
begin
   inherited;

   ppSubReport1.Visible := False;

   qryHistMov.Filtered  := False;
   qryHistMov.Filter    := 'CODDOCUMENTO = ' + FormatFloat('#0', qryConciliaCapCarCODDOCUMENTO.AsFloat);
   qryHistMov.Filtered  := True;

   ppSubReport1.Visible := not(qryHistMov.IsEmpty);
end;



end.
