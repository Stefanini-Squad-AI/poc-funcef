unit dRelRetencaoIOFPP;

// Alterações:
{
--------------------------------------------------------------------------------------------------
Alteracao : (dfm qryRetencaoIOFPP, rptRetencaoIOFPP)
Data      : 26/02/2018
Autor     : edilaine
Pendência : 63317
Descrição : Inclusão nome do perfil e ajuste do campo nome do plano para buscar em outra tabela
--------------------------------------------------------------------------------------------------
Pendência   : SOL 253185 PPM 771995
Responsável : William Moreira da Silva
Data        : 17/06/2015
Descrição   : Reestruturação da HistMovEmptmo(*Retirada dos Hint's)
--------------------------------------------------------------------------------------------------
Data      : 19/10/2009
Autor     : Daniel Begnami
Pendência : Sol 125883 Kintana 653469
Descrição : Inclusão de field na query
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 25/08/2004
Autor     : André Pontes
Pendência :
Descrição : Criado novo relatório
---------------------------------------------------------------------------------------------------}

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE, ADODB, DBClient, Provider, FCmReport, uCmRptManager,
   TXComp, CmParamReport, ppModule, raCodMod;

type
   TdtmRelRetencaoIOFPP = class(TdtmReports)
      dtsRetencaoIOFPP: TwwDataSource;
      qryRetencaoIOFPP: TwwQuery;
      rptRetencaoIOFPP: TppReport;
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
      pplRetencaoIOFPP: TppBDEPipeline;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppShape3: TppShape;
      ppDBCalc4: TppDBCalc;
      ppLabel20: TppLabel;
      ppDBCalc3: TppDBCalc;
      ppDBCalc5: TppDBCalc;
      ppDBCalc6: TppDBCalc;
      ppDBCalc7: TppDBCalc;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppDBText3: TppDBText;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLabel6: TppLabel;
      ppLabel18: TppLabel;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppLabel8: TppLabel;
      ppLine5: TppLine;
      ppLabel13: TppLabel;
      ppLabel15: TppLabel;
      ppLine4: TppLine;
      ppLabel7: TppLabel;
      ppLabel14: TppLabel;
      ppLabel16: TppLabel;
      ppShape1: TppShape;
      ppLabel1: TppLabel;
      ppShape6: TppShape;
      ppLine2: TppLine;
      ppShape7: TppShape;
      ppLabel19: TppLabel;
      ppDBCalc11: TppDBCalc;
      ppDBCalc12: TppDBCalc;
      ppDBCalc13: TppDBCalc;
      ppDBCalc14: TppDBCalc;
      ppDBCalc15: TppDBCalc;
      ppGroup4: TppGroup;
      ppGroupHeaderBand4: TppGroupHeaderBand;
      ppGroupFooterBand4: TppGroupFooterBand;
      ppDBText14: TppDBText;
      ppLine3: TppLine;
    ppDBText13: TppDBText;
    rptRetencaoIOFPP_lblTipoData: TppLabel;
    qryRetencaoIOFPPNOMEPATRO: TStringField;
    qryRetencaoIOFPPNOMEPLANO: TStringField;
    qryRetencaoIOFPPIDCONTRATOEMPTMO: TFloatField;
    qryRetencaoIOFPPMATRICULA: TStringField;
    qryRetencaoIOFPPNOME: TStringField;
    qryRetencaoIOFPPTCEDESCRICAO: TStringField;
    qryRetencaoIOFPPHMESALDODEV: TFloatField;
    qryRetencaoIOFPPPRAZO: TStringField;
    qryRetencaoIOFPPHMEDATAPREVISTA: TDateTimeField;
    qryRetencaoIOFPPHMEDATAEFETIVA: TDateTimeField;
    qryRetencaoIOFPPIOF_PREVISTO: TFloatField;
    qryRetencaoIOFPPIOF_EFETIVO: TFloatField;
    qryRetencaoIOFPPIOF_RECOLHIDO: TFloatField;
    qryRetencaoIOFPPHMEVLRBASE: TFloatField;
    qryRetencaoIOFPPVLRCONTRATO: TFloatField;
    qryRetencaoIOFPPEVENTO: TStringField;
    qryRetencaoIOFPPITEDESCRICAO: TStringField;
    ppLabel10: TppLabel;
    ppDBText15: TppDBText;
    qryRetencaoIOFPPNOMEPERFIL: TStringField;

      procedure ppShape1Print(Sender: TObject);
      procedure ppLine1Print(Sender: TObject);
      procedure ppItensContratoBeforePrint(Sender: TObject);
      procedure ppGroupHeaderBand4BeforePrint(Sender: TObject);
    procedure ppDBText13Print(Sender: TObject);


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


   public   // Public declarations

      bSintetico        : Boolean;
      bSeparador        : Boolean;
      bQuebraPatro      : Boolean;

      CorLinha          : TColor;
      CorAtual          : TColor;
      bCorLinha         : Boolean;

      function MostraParam(Form: string): boolean; override;


   end;



var
  dtmRelRetencaoIOFPP: TdtmRelRetencaoIOFPP;



implementation
{$R *.DFM}
uses
   CRelRetencaoIOFPP, USistema;



function TdtmRelRetencaoIOFPP.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelretencaoiofpp') then
   begin
      frm := TcfgRelRetencaoIOFPP.Create(Application);
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



procedure TdtmRelRetencaoIOFPP.ppShape1Print(Sender: TObject);
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



procedure TdtmRelRetencaoIOFPP.ppLine1Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelRetencaoIOFPP.ppItensContratoBeforePrint(Sender: TObject);
begin
   inherited;
   (Sender as TppDetailBand).Visible := not(bSintetico);
end;



procedure TdtmRelRetencaoIOFPP.ppGroupHeaderBand4BeforePrint(Sender: TObject);
begin
   inherited;
   (Sender as TppGroupHeaderBand).Visible := not(bQuebraPatro);
end;



procedure TdtmRelRetencaoIOFPP.ppDBText13Print(Sender: TObject);
begin
   inherited;
   (Sender as TppDBText).Visible := bQuebraPatro;
end;



end.
