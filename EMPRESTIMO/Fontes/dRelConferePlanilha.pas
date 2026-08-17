unit dRelConferePlanilha;

// Alterações:
{
 --------------------------------------------------------------------------------------------------
Pendência   : SOL 253185 PPM 771995
Responsável : William Moreira da Silva
Data        : 17/06/2015
Descrição   : Reestruturação da HistMovEmptmo(*Retirada dos Hint's)
 --------------------------------------------------------------------------------------------------}

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppCtrls, ppBands, ppVar, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt;

type
   TdtmRelConferePlanilha = class(TdtmReports)
      pplConferePlanilha: TppBDEPipeline;
      dtsConferePlanilha: TwwDataSource;
      qryConferePlanilha: TwwQuery;
      rptConferePlanilha: TppReport;
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
      dtmRelConferePlanilha_lblDataIni: TppLabel;
      ppLabel5: TppLabel;
      dtmRelConferePlanilha_lblDataFim: TppLabel;
      ppLabel7: TppLabel;
      ppLabel9: TppLabel;
      ppLabel11: TppLabel;
      ppDBText4: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText9: TppDBText;
      ppLine5: TppLine;
      ppLabel14: TppLabel;
      ppLabel15: TppLabel;
      ppLabel16: TppLabel;
      ppGroup4: TppGroup;
      ppGroupHeaderBand4: TppGroupHeaderBand;
      ppGroupFooterBand4: TppGroupFooterBand;
      ppShape2: TppShape;
      ppLine1: TppLine;
      ppDBCalc1: TppDBCalc;
      ppDBCalc3: TppDBCalc;
      ppDBCalc5: TppDBCalc;
      ppDBCalc6: TppDBCalc;
      ppLabel4: TppLabel;
      ppLabel17: TppLabel;
      ppLabel18: TppLabel;
      ppLine7: TppLine;
      qryConferePlanilhaPLNCODIGO: TFloatField;
      qryConferePlanilhaPLNPLANIL: TFloatField;
      qryConferePlanilhaPLNDATDIA: TDateTimeField;
      qryConferePlanilhaVLR_EP: TFloatField;
      qryConferePlanilhaCONTABDEB: TFloatField;
      qryConferePlanilhaCONTABCRED: TFloatField;
      ppLabel6: TppLabel;
    ppDbTextPlanilha: TppDBText;
      ppDBText2: TppDBText;
      ppLabel8: TppLabel;
      ppDBText3: TppDBText;
      qryConferePlanilhaDIFERENCA: TFloatField;
      dtmRelConferePlanilha_lblDiverg: TppLabel;
    qryContratos: TwwQuery;
    pplContratos: TppBDEPipeline;
    dsContratos: TwwDataSource;
    qryContratosPLANO: TStringField;
    qryContratosPATRO: TStringField;
    qryContratosIDCONTRATOEMPTMO: TFloatField;
    qryContratosNOME: TStringField;
    qryContratosMATRICULA: TStringField;
    rptSubContratos: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel10: TppLabel;
    ppLabel12: TppLabel;
    ppDBText5: TppDBText;
    ppLabel13: TppLabel;
    ppDBText8: TppDBText;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLine4: TppLine;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;

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
  dtmRelConferePlanilha: TdtmRelConferePlanilha;



implementation
{$R *.DFM}
uses
   uFuncoesEmptmo, uSistema, cRelConferePlanilha;



function TdtmRelConferePlanilha.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelconfereplanilha') then
   begin
      frm := TcfgRelConferePlanilha.Create(Application);
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



procedure TdtmRelConferePlanilha.ppLine3Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelConferePlanilha.ppShape3Print(Sender: TObject);
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
