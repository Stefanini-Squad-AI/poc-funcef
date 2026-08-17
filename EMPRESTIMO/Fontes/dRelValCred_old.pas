unit dRelValCred_old;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE, ADODB, DBClient, Provider, FCmReport, uCmRptManager,
   TXComp, CmParamReport, ppModule, raCodMod;

type
   TdtmRelValCred_old = class(TdtmReports)
      dtsValCred: TwwDataSource;
      qryValCred: TwwQuery;
      rptValCred: TppReport;
      pplValCred: TppBDEPipeline;
      ppHeaderBand1: TppHeaderBand;
      ppDetailBand1: TppDetailBand;
      rptValCredShapeDet: TppShape;
      ppDBText10: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppDBText13: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppLine2: TppLine;
      ppLabel3: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppShape2: TppShape;
      ppLabel10: TppLabel;
      ppDBText12: TppDBText;
      ppDBCalc2: TppDBCalc;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppShape1: TppShape;
      ppDBText2: TppDBText;
      ppLabel4: TppLabel;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppDBCalc1: TppDBCalc;
      ppLabel9: TppLabel;
      ppDBText11: TppDBText;
      ppLine5: TppLine;
      ppLine4: TppLine;
      ppGroup3: TppGroup;
      ppGroupHeaderBand3: TppGroupHeaderBand;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLine6: TppLine;
      ppLabel11: TppLabel;
      ppGroupFooterBand3: TppGroupFooterBand;
      ppGroup4: TppGroup;
      ppGroupHeaderBand4: TppGroupHeaderBand;
      ppGroupFooterBand4: TppGroupFooterBand;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppLabel122: TppLabel;
      rptValCred_lblDataIni: TppLabel;
      rptValCred_lblDataFim: TppLabel;
      ppLabel13: TppLabel;
      ppLabel14: TppLabel;
      rptValCred_lblFormaCred: TppLabel;
      ppLabel12: TppLabel;
      rptValCred_lblSitPart: TppLabel;
      ppLine1: TppLine;
    qryValCredFLGFORMAPAG: TStringField;
    qryValCredDATACREDITO: TDateTimeField;
    qryValCredPORTFORMAPAG: TFloatField;
    qryValCredCODFORMAPAG: TFloatField;
    qryValCredIDCONTRATOEMPTMO: TFloatField;
    qryValCredMATRICULA: TStringField;
    qryValCredDESCRICAO: TStringField;
    qryValCredNUMBANCO: TStringField;
    qryValCredNUMAGENCIA: TStringField;
    qryValCredCONTACORRENTE: TStringField;
    qryValCredHMEVLRPREVISTO: TFloatField;

      procedure rptContratosAdminSint_CabecalhoRelatBeforePrint(Sender: TObject);
      procedure ppLine1Print(Sender: TObject);
    procedure rptValCredShapeDetPrint(Sender: TObject);
    procedure ppGroupHeaderBand3BeforePrint(Sender: TObject);


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

   public

      bSeparador  : Boolean;
      CorLinha    : TColor;
      CorAtual    : TColor;
      bCorLinha   : Boolean;

      function MostraParam(Form: string): boolean; override;
  end;



var
  dtmRelValCred_old: TdtmRelValCred_old;



implementation
{$R *.DFM}
uses
   CRelContrConc, USistema, CRelValCred;



function TdtmRelValCred_old.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelvalcred') then begin
      frm := TcfgRelValCred.Create(Application);
   end else begin
      frm := nil;
   end;

   if frm = nil then begin
      Result := False;
      Exit;
   end;

   with frm do begin
      Result := (ShowModal = mrOk);
      Free;
   end;
end;



procedure TdtmRelValCred_old.rptContratosAdminSint_CabecalhoRelatBeforePrint(Sender: TObject);
begin
   inherited;
   CorAtual := clWhite;
end;



procedure TdtmRelValCred_old.ppLine1Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelValCred_old.rptValCredShapeDetPrint(Sender: TObject);
begin
   inherited;

   if bCorLinha then begin
      if CorAtual = clWhite then begin
         CorAtual := CorLinha;
      end else begin
         CorAtual := clWhite;
      end;
   end else begin
      CorAtual := clWhite;
   end;

   (Sender as TppShape).Brush.Color := CorAtual;
end;



procedure TdtmRelValCred_old.ppGroupHeaderBand3BeforePrint(Sender: TObject);
begin
   inherited;
   CorAtual := clWhite;
end;



end.
