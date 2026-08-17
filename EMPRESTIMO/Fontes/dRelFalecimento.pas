unit dRelFalecimento;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE, ADODB, DBClient, Provider, FCmReport, uCmRptManager,
   TXComp, CmParamReport, ppModule, raCodMod, ppMemo, ppStrtch, ppRichTx;

type
   TdtmRelFalecimento = class(TdtmReports)
      dtsFalecimento: TwwDataSource;
      qryFalecimento: TwwQuery;
      rptFalecimento: TppReport;
      rptContratosAdminSint_CabecalhoRelat: TppHeaderBand;
      pplbTitulo: TppLabel;
      pplbNomeEmpresa: TppLabel;
      ppItensContrato: TppDetailBand;
      rptContrato: TppShape;
      ppDBText2: TppDBText;
      ppFooterBand12: TppFooterBand;
      ppLine37: TppLine;
      rptContratosAdminSintSummaryBand1: TppSummaryBand;
      rptContratosAdminSintLine1: TppLine;
      pplbNomeSistema: TppLabel;
      ppCalc23: TppSystemVariable;
      ppSystemVariable1: TppSystemVariable;
      ppLine1: TppLine;
      ppShape4: TppShape;
      ppLabel9: TppLabel;
      lblTipoData: TppLabel;
      rptRetencaoIOF_lblDataIni: TppLabel;
      ppLabel5: TppLabel;
      rptRetencaoIOF_lblDataFim: TppLabel;
      pplFalecimento: TppBDEPipeline;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText7: TppDBText;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppShape3: TppShape;
      ppDBCalc4: TppDBCalc;
      ppLabel20: TppLabel;
      ppDBCalc5: TppDBCalc;
      ppDBCalc6: TppDBCalc;
      ppDBCalc7: TppDBCalc;
      ppDBText11: TppDBText;
      ppLabel6: TppLabel;
      ppDBText12: TppDBText;
      ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppDBText13: TppDBText;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel8: TppLabel;
    ppLabel1: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    qryFalecimentoIDCONTRATOEMPTMO: TFloatField;
    qryFalecimentoMATRICULA: TStringField;
    qryFalecimentoNOME: TStringField;
    qryFalecimentoTCEDESCRICAO: TStringField;
    qryFalecimentoVLRCONTRATO: TFloatField;
    qryFalecimentoDATACREDITO: TDateTimeField;
    qryFalecimentoVLRSALDODEV: TFloatField;
    qryFalecimentoHMEVLRPREVISTO: TFloatField;
    qryFalecimentoHMEDATAPREVISTA: TDateTimeField;
    qryFalecimentoDATAMORTE: TDateTimeField;
    ppLabel16: TppLabel;
    ppLabel23: TppLabel;
    ppDBText1: TppDBText;
    qryFalecimentoRECEBIDO: TStringField;
    ppDBText3: TppDBText;
    ppShape6: TppShape;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    lblTipoEmptmo: TppLabel;
    lblTipoContr: TppLabel;
    ppLabel7: TppLabel;
    ppLabel10: TppLabel;
    memPatro: TppRichText;
    memPlano: TppRichText;
    ppMemo2: TppMemo;
    ppMemo1: TppMemo;
    qryFalecimentoDATASOLICITACAO: TDateTimeField;
    pplFalecimentoppField12: TppField;
    ppLabel15: TppLabel;
    ppDBText6: TppDBText;
    ppLabel17: TppLabel;

      procedure ppShape1Print(Sender: TObject);
      procedure ppLine1Print(Sender: TObject);


   private { Private declarations }

      //    Cores:
      //    ColorA = $FFFFFF   { branco, clWhite }
      //    ColorC = $00C0FFFF { amarelo - pastel }
      //    ColorD = $00C6F9CC { verde - pastel }
      //    ColorE = $00F3E6CD { azul - pastel }
      //    ColorF = $00A0A0A0
      //    ColorG = $00BEBEBE
      //    ColorH = $00D2D2D2
      //    ColorI = $00E3E3E3


   public { Public declarations }

      bSeparador        : Boolean;
      CorLinha          : TColor;
      CorAtual          : TColor;
      bCorLinha         : Boolean;

      function MostraParam(Form: string): boolean; override;

   end;



var
  dtmRelFalecimento: TdtmRelFalecimento;



implementation
{$R *.DFM}
uses
   CRelFalecimento, USistema;



function TdtmRelFalecimento.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelfalecimento') then
   begin
      frm := TcfgRelFalecimento.Create(Application);
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



procedure TdtmRelFalecimento.ppShape1Print(Sender: TObject);
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



procedure TdtmRelFalecimento.ppLine1Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



end.

