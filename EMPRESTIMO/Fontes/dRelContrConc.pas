unit dRelContrConc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, ADODB, DBClient, Provider, FCmReport, uCmRptManager,
  TXComp, CmParamReport, ppModule, raCodMod, ppMemo, ppStrtch, ppRichTx;

type
   TdtmRelContrConc = class(TdtmReports)
      dtsContrConc: TwwDataSource;
      qryContrConc: TwwQuery;
      rpContrConc: TppReport;
      rptContratosAdminSint_CabecalhoRelat: TppHeaderBand;
      pplbTitulo: TppLabel;
      pplbNomeEmpresa: TppLabel;
      rptContratosAdminSint_LinhaTitulo: TppLine;
      rptContratosAdminSintLabel18: TppLabel;
      rptContratosAdminSintLabel19: TppLabel;
      ppItensContrato: TppDetailBand;
      shpItem: TppShape;
      ppDBText2: TppDBText;
      ppDBText1: TppDBText;
      ppFooterBand12: TppFooterBand;
      ppLine37: TppLine;
      rptContratosAdminSintSummaryBand1: TppSummaryBand;
      rptContratosAdminSintLine1: TppLine;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppShape1: TppShape;
      ppGroupFooterBand2: TppGroupFooterBand;
      pplbNomeSistema: TppLabel;
      ppCalc23: TppSystemVariable;
      ppSystemVariable1: TppSystemVariable;
      ppLine1: TppLine;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppDBText11: TppDBText;
      ppDBText15: TppDBText;
      ppDBText12: TppDBText;
      ppDBText13: TppDBText;
      ppDBText14: TppDBText;
      ppDBText3: TppDBText;
      ppLabel6: TppLabel;
      ppDBText4: TppDBText;
      ppShape3: TppShape;
      ppDBCalc1: TppDBCalc;
      ppLine4: TppLine;
      ppDBCalc2: TppDBCalc;
      ppLabel8: TppLabel;
      ppShape4: TppShape;
      ppDBCalc3: TppDBCalc;
      ppDBCalc4: TppDBCalc;
      ppLabel9: TppLabel;
      lblTipoData: TppLabel;
      rptContrCond_lblDataIni: TppLabel;
      ppLabel5: TppLabel;
      ppGroup3: TppGroup;
      ppGroupHeaderBand3: TppGroupHeaderBand;
      ppGroupFooterBand3: TppGroupFooterBand;
      ppDBText5: TppDBText;
      ppLine3: TppLine;
      ppShape6: TppShape;
      ppLabel10: TppLabel;
      ppDBCalc8: TppDBCalc;
      ppDBCalc6: TppDBCalc;
      ppGroup4: TppGroup;
      ppGroupHeaderBand4: TppGroupHeaderBand;
      ppGroupFooterBand4: TppGroupFooterBand;
      ppDBText6: TppDBText;
      ppShape7: TppShape;
      ppLabel11: TppLabel;
      ppLine5: TppLine;
      ppLine6: TppLine;
      ppLine7: TppLine;
      ppDBCalc7: TppDBCalc;
      ppDBCalc9: TppDBCalc;
      shpContrato: TppShape;
      ppLabel12: TppLabel;
      ppLabel13: TppLabel;
      ppLabel4: TppLabel;
      ppLabel7: TppLabel;
      ppLabel14: TppLabel;
      ppLabel15: TppLabel;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppLabel16: TppLabel;
      ppDBCalc5: TppDBCalc;
      ppDBCalc10: TppDBCalc;
      ppDBCalc11: TppDBCalc;
      ppDBCalc12: TppDBCalc;
      ppLabel17: TppLabel;
      ppLabel18: TppLabel;
      ppLabel19: TppLabel;
      ppLabel20: TppLabel;
      ppLine2: TppLine;
      rptContrCond_lblDataFim: TppLabel;
    qryContrConcPLANO: TStringField;
    qryContrConcPATRO: TStringField;
    qryContrConcTCEDESCRICAO: TStringField;
    qryContrConcIDCONTRATOEMPTMO: TFloatField;
    qryContrConcMATRICULA: TStringField;
    qryContrConcNOME: TStringField;
    qryContrConcVLRCONTRATO: TFloatField;
    qryContrConcVLRPREVISTO: TFloatField;
    qryContrConcVLRCREDITO: TFloatField;
    qryContrConcVLRPARCELA: TFloatField;
    qryContrConcDATACREDITO: TDateTimeField;
    qryContrConcDATAASSINATURA: TDateTimeField;
    qryContrConcSTATUSCONTR: TStringField;
    ppDBText7: TppDBText;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    qryContrConcSEGURO: TFloatField;

      procedure ppShape1Print(Sender: TObject);
      procedure ppLine1Print(Sender: TObject);
      procedure ppItensContratoBeforePrint(Sender: TObject);
      procedure shpContratoPrint(Sender: TObject);
      procedure lblTipoDataPrint(Sender: TObject);
      procedure shpItemPrint(Sender: TObject);

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

      //             $00E8E8E8   cinza bem claro

      FTipoRelatorio    : String;
      FDataIni          : String;
      FDataFim          : String;
      FTipoData         : String;

   public { Public declarations }

      bSeparador        : Boolean;
      CorLinha          : TColor;
      CorAtual          : TColor;
      bCorLinha         : Boolean;

      property TipoRelatorio : String  read FTipoRelatorio write FTipoRelatorio;
      property TipoData      : String  read FTipoData      write FTipoData;

      function MostraParam(Form: string): boolean; override;

   end;



var
  dtmRelContrConc: TdtmRelContrConc;



implementation
{$R *.DFM}
uses
   CRelContrConc, USistema;



function TdtmRelContrConc.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelcontrconc') then begin
      frm := TcfgRelContrConc.Create(Application);
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



procedure TdtmRelContrConc.ppShape1Print(Sender: TObject);
begin
   inherited;

   if FTipoRelatorio[1] = 'A' then
   begin
      (Sender as TppShape).Brush.Color := clSilver;
   end
   else
   begin
      (Sender as TppShape).Brush.Color := $00E8E8E8; // cinza bem claro
   end;

   CorAtual := clWhite;
end;



procedure TdtmRelContrConc.ppLine1Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelContrConc.ppItensContratoBeforePrint(Sender: TObject);
begin
   inherited;
   ppItensContrato.Visible := FTipoRelatorio[1] = 'A';
end;



procedure TdtmRelContrConc.shpContratoPrint(Sender: TObject);
begin
   inherited;

   if FTipoRelatorio[1] <> 'A' then
   begin
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
   end
   else
   begin
      (Sender as TppShape).Brush.Color := $00E8E8E8; // cinza bem claro

      CorAtual := clWhite;
   end;
end;



procedure TdtmRelContrConc.lblTipoDataPrint(Sender: TObject);
begin
   inherited;

   if FTipoData = 'A' then
   begin
      lblTipoData.Caption := 'Data de Assinatura:';
   end
   else
   begin
      lblTipoData.Caption := 'Data de Crédito:';
   end;
end;



procedure TdtmRelContrConc.shpItemPrint(Sender: TObject);
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
end;



end.

