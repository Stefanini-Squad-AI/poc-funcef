// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      :
Autor     :
Pendência :
Descrição :
---------------------------------------------------------------------------------------------------}

unit dRelItensEnvioCapCarPP;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, Db, ppBands, ppPrnabl, ppClass, ppCtrls, ppCache, ppProd,
   ppReport, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB, ppDBPipe,
   ppDBBDE, ppVar, ppStrtch, ppSubRpt;

type
   TdtmRelItensEnvioCapCarPP = class(TdtmReports)
      qryItensEnvioCapCarPP: TwwQuery;
      pplItensEnvioCapCarPP: TppBDEPipeline;
      dtsItensEnvioCapCarPP: TwwDataSource;
      rptItensEnvioCapCarPP: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel4: TppLabel;
      lblDataIni: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppShape3: TppShape;
      ppLine4: TppLine;
      ppLabel2: TppLabel;
      ppDBText11: TppDBText;
      ppLine1: TppLine;
      ppDBText12: TppDBText;
      ppDBText16: TppDBText;
      ppShape5: TppShape;
      ppDBText17: TppDBText;
      ppShape2: TppShape;
      ppDBCalc7: TppDBCalc;
      ppDBCalc8: TppDBCalc;
      ppDBCalc12: TppDBCalc;
      ppFooterBand1: TppFooterBand;
      ppLabel3: TppLabel;
      ppLine2: TppLine;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppLabel5: TppLabel;
      ppLabel24: TppLabel;
      ppGroup4: TppGroup;
      ppGroupHeaderBand4: TppGroupHeaderBand;
      ppGroupFooterBand4: TppGroupFooterBand;
      ppGroup5: TppGroup;
    ppGroupHeaderRecPag: TppGroupHeaderBand;
    ppGroupFooterRecPag: TppGroupFooterBand;
      ppDBText1: TppDBText;
      lblDataFim: TppLabel;
      ppLabel10: TppLabel;
      qryItensEnvioCapCarPPCODDOCUMENTO: TFloatField;
      qryItensEnvioCapCarPPNODOCUMENTO: TFloatField;
      qryItensEnvioCapCarPPCOMPLDOCUMENTO: TStringField;
      qryItensEnvioCapCarPPNODOCUMENTO_COMPL: TStringField;
      qryItensEnvioCapCarPPREC_PAG: TStringField;
      qryItensEnvioCapCarPPREC_PAG_DATA: TStringField;
      qryItensEnvioCapCarPPDATA_REF: TDateTimeField;
      qryItensEnvioCapCarPPIDCONTRATOEMPTMO: TFloatField;
      qryItensEnvioCapCarPPIDHISTMOVEMPTMO: TFloatField;
      qryItensEnvioCapCarPPMATRICULA: TStringField;
      qryItensEnvioCapCarPPINSCRICAONUMERO: TFloatField;
      qryItensEnvioCapCarPPNOME_PLANO: TStringField;
      qryItensEnvioCapCarPPNOME_PATRO: TStringField;
      qryItensEnvioCapCarPPNOME_PLANOPATRO: TStringField;
      qryItensEnvioCapCarPPTCEDESCRICAO: TStringField;
      qryItensEnvioCapCarPPNOME_MUTUARIO: TStringField;
      qryItensEnvioCapCarPPSIT_PART: TStringField;
      qryItensEnvioCapCarPPHMEVLRPREVISTO: TFloatField;
      qryItensEnvioCapCarPPHMEVLREFETIVO: TFloatField;
      qryItensEnvioCapCarPPVLRNAORECEBIDO: TFloatField;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppGroup2: TppGroup;
    ppGroupHeaderPatro: TppGroupHeaderBand;
    ppGroupFooterPatro: TppGroupFooterBand;
      ppShape1: TppShape;
      ppDBText3: TppDBText;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppLabel13: TppLabel;
      ppLabel18: TppLabel;
      ppLabel14: TppLabel;
      ppLine3: TppLine;
      ppDBText2: TppDBText;
      ppDBText4: TppDBText;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      qryItensEnvioCapCarPPEVENTO: TStringField;
      qryItensEnvioCapCarPPORIGEM: TStringField;
      qryItensEnvioCapCarPPPARCELA: TStringField;
      ppDBText9: TppDBText;
      ppShape4: TppShape;
      ppLine5: TppLine;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppDBText10: TppDBText;
      ppLabel15: TppLabel;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
      ppLabel19: TppLabel;
      ppLabel20: TppLabel;
      ppLabel21: TppLabel;
      ppLabel22: TppLabel;
      ppLine6: TppLine;
      ppShape6: TppShape;
      ppDBCalc1: TppDBCalc;
      ppDBCalc2: TppDBCalc;
      ppDBCalc3: TppDBCalc;
    ppLabel23: TppLabel;
    ppLabel25: TppLabel;
    ppDBText13: TppDBText;
    ppLabel26: TppLabel;
    lblEvento: TppLabel;
    lblValorAbsoluto: TppLabel;
    ppLabel27: TppLabel;

      procedure ppHeaderBand1BeforePrint(Sender: TObject);
      procedure ppLine4Print(Sender: TObject);
      procedure ppShape3Print(Sender: TObject);
      procedure ppDetailBand1BeforePrint(Sender: TObject);
      procedure ppGroupHeaderBand3BeforePrint(Sender: TObject);
      procedure ppGroupHeaderPatroBeforePrint(Sender: TObject);
    procedure ppLabel15Print(Sender: TObject);
    procedure ppDBText13Print(Sender: TObject);
    procedure ppGroupHeaderRecPagBeforePrint(Sender: TObject);
    procedure ppGroupFooterPatroBeforePrint(Sender: TObject);


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
      bQuebra     : Boolean;

      bSeparador  : Boolean;
      CorLinha    : TColor;
      CorAtual    : TColor;
      bCorLinha   : Boolean;

      function MostraParam(Form: string): boolean; override;

   end;



var
  dtmRelItensEnvioCapCarPP: TdtmRelItensEnvioCapCarPP;




implementation
{$R *.DFM}
uses
   uSistema, uFuncoesEmptmo, cRelItensEnvioCapCarPP;



function TdtmRelItensEnvioCapCarPP.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelitensenviocapcarpp') then
   begin
      frm := TcfgRelItensEnvioCapCarPP.Create(Application);
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



procedure TdtmRelItensEnvioCapCarPP.ppHeaderBand1BeforePrint(Sender: TObject);
begin
   inherited;
   CorAtual := clWhite;
end;



procedure TdtmRelItensEnvioCapCarPP.ppLine4Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelItensEnvioCapCarPP.ppShape3Print(Sender: TObject);
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



procedure TdtmRelItensEnvioCapCarPP.ppDetailBand1BeforePrint(Sender: TObject);
begin
   inherited;
   (Sender as TppDetailBand).Visible := not(bSintetico);
end;



procedure TdtmRelItensEnvioCapCarPP.ppGroupHeaderBand3BeforePrint(Sender: TObject);
begin
   inherited;
   (Sender as TppGroupHeaderBand).Visible := not(bSintetico);
end;



procedure TdtmRelItensEnvioCapCarPP.ppGroupHeaderPatroBeforePrint(Sender: TObject);
begin
   inherited;
   (Sender as TppGroupHeaderBand).Visible := not(bSintetico) or bQuebra;
end;



procedure TdtmRelItensEnvioCapCarPP.ppLabel15Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLabel).Visible := not(bSintetico);
end;



procedure TdtmRelItensEnvioCapCarPP.ppDBText13Print(Sender: TObject);
begin
   inherited;
   (Sender as TppDBText).Visible := bSintetico;
end;



procedure TdtmRelItensEnvioCapCarPP.ppGroupHeaderRecPagBeforePrint(Sender: TObject);
begin
   inherited;
   (Sender as TppGroupHeaderBand).Visible := bSintetico or not(bQuebra);
end;



procedure TdtmRelItensEnvioCapCarPP.ppGroupFooterPatroBeforePrint(Sender: TObject);
begin
   inherited;
   (Sender as TppGroupFooterBand).Visible := bQuebra;
end;



end.
