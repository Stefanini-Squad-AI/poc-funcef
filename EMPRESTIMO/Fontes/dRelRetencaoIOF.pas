unit dRelRetencaoIOF;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE, ADODB, DBClient, Provider, FCmReport, uCmRptManager,
   TXComp, CmParamReport, ppModule, raCodMod;

type
   TdtmRelRetencaoIOF = class(TdtmReports)
      dtsRetencaoIOF: TwwDataSource;
      qryRetencaoIOF: TwwQuery;
      rptRetencaoIOF: TppReport;
      rptContratosAdminSint_CabecalhoRelat: TppHeaderBand;
      pplbTitulo: TppLabel;
      pplbNomeEmpresa: TppLabel;
      ppItensContrato: TppDetailBand;
      rptContrato: TppShape;
      ppDBText2: TppDBText;
      ppDBText1: TppDBText;
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
      pplRetencaoIOF: TppBDEPipeline;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppLabel1: TppLabel;
      ppDBText3: TppDBText;
      ppShape1: TppShape;
      ppLine2: TppLine;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppLabel10: TppLabel;
      ppShape2: TppShape;
      ppLine3: TppLine;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppLabel14: TppLabel;
      ppLabel15: TppLabel;
      ppLabel16: TppLabel;
      ppLine4: TppLine;
      ppLabel13: TppLabel;
      ppLine5: TppLine;
      ppShape3: TppShape;
      ppShape5: TppShape;
      ppDBCalc4: TppDBCalc;
      ppLabel17: TppLabel;
      ppLabel20: TppLabel;
      ppDBCalc1: TppDBCalc;
      ppDBCalc2: TppDBCalc;
      ppDBCalc3: TppDBCalc;
      ppDBCalc5: TppDBCalc;
      ppDBCalc6: TppDBCalc;
      ppDBCalc7: TppDBCalc;
      ppDBCalc8: TppDBCalc;
      ppDBCalc9: TppDBCalc;
      ppDBCalc10: TppDBCalc;
      qryRetencaoIOFIDCONTRATOEMPTMO: TFloatField;
      qryRetencaoIOFMATRICULA: TStringField;
      qryRetencaoIOFNOME: TStringField;
      qryRetencaoIOFPRAZO: TStringField;
      qryRetencaoIOFHMEDATAPREVISTA: TDateTimeField;
      qryRetencaoIOFHMEDATAEFETIVA: TDateTimeField;
      qryRetencaoIOFIOF_PREVISTO: TFloatField;
      qryRetencaoIOFIOF_EFETIVO: TFloatField;
      qryRetencaoIOFIOF_RECOLHIDO: TFloatField;
      qryRetencaoIOFHMEVLRBASE: TFloatField;
      qryRetencaoIOFVLRCONTRATO: TFloatField;
      qryRetencaoIOFEVENTO: TStringField;
      ppDBText11: TppDBText;
      ppLabel6: TppLabel;
      ppDBText12: TppDBText;
      ppLabel18: TppLabel;
      qryRetencaoIOFTCEDESCRICAO: TStringField;
    rptRetencaoIOF_lblTipoData: TppLabel;
    qryRetencaoIOFITEDESCRICAO: TStringField;

      procedure ppShape1Print(Sender: TObject);
      procedure ppLine1Print(Sender: TObject);
    procedure ppItensContratoBeforePrint(Sender: TObject);

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

      bSintetico        : Boolean;
      bSeparador        : Boolean;
      CorLinha          : TColor;
      CorAtual          : TColor;
      bCorLinha         : Boolean;

      function MostraParam(Form: string): boolean; override;

   end;



var
  dtmRelRetencaoIOF: TdtmRelRetencaoIOF;



implementation
{$R *.DFM}
uses
   CRelRetencaoIOF, USistema;



function TdtmRelRetencaoIOF.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelretencaoiof') then
   begin
      frm := TcfgRelRetencaoIOF.Create(Application);
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



procedure TdtmRelRetencaoIOF.ppShape1Print(Sender: TObject);
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



procedure TdtmRelRetencaoIOF.ppLine1Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelRetencaoIOF.ppItensContratoBeforePrint(Sender: TObject);
begin
   inherited;
   (Sender as TppDetailBand).Visible := not(bSintetico);
end;



end.

