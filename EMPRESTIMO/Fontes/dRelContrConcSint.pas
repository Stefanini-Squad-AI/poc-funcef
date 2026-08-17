unit dRelContrConcSint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, ADODB, DBClient, Provider, FCmReport, uCmRptManager,
  TXComp, CmParamReport, ppMemo, ppStrtch, ppRichTx;

type
   TdtmRelContrConcSint = class(TdtmReports)
      dtsContrConcSint: TwwDataSource;
      qryContrConcSint: TwwQuery;
      rptContrConcSint: TppReport;
      rptContratosAdminSint_CabecalhoRelat: TppHeaderBand;
      pplbTitulo: TppLabel;
      pplbNomeEmpresa: TppLabel;
      rptContratosAdminSint_LinhaTitulo: TppLine;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppItensContrato: TppDetailBand;
      rptContrato: TppShape;
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
      dtpContrConc: TDataSetProvider;
      cdsContrConc: TClientDataSet;
      cdsContrConcITEDESCRICAO: TStringField;
      cdsContrConcVRLPREVISTO: TFloatField;
      cdsContrConcIDCONTRATOEMPTMO: TFloatField;
      cdsContrConcNOME: TStringField;
      cdsContrConcVLRCONTRATO: TFloatField;
      cdsContrConcVLRLIQUIDO: TFloatField;
      cdsContrConcVLRPARCELA: TFloatField;
      cdsContrConcDATACREDITO: TDateTimeField;
      cdsContrConcDATAASSINATURA: TDateTimeField;
      cdsContrConcSTATUSCONTR: TStringField;
      adoqryContrConc: TADOQuery;
      pplbNomeSistema: TppLabel;
      ppCalc23: TppSystemVariable;
      ppSystemVariable1: TppSystemVariable;
      ppLine1: TppLine;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppDBText10: TppDBText;
      ppDBText12: TppDBText;
      ppDBText13: TppDBText;
      ppDBText3: TppDBText;
      ppShape2: TppShape;
      ppShape3: TppShape;
      ppDBCalc1: TppDBCalc;
      ppLine4: TppLine;
      ppDBCalc2: TppDBCalc;
      ppLabel8: TppLabel;
      ppShape4: TppShape;
      ppDBCalc3: TppDBCalc;
      ppDBCalc4: TppDBCalc;
      ppLabel9: TppLabel;
      qryContrConcSintDESCTIPOEMPTMO: TStringField;
      qryContrConcSintTCEDESCRICAO: TStringField;
      qryContrConcSintITEDESCRICAO: TStringField;
      qryContrConcSintITCSEQCALCULO: TFloatField;
      qryContrConcSintVLRSOLIC: TFloatField;
      qryContrConcSintVLRCREDITO: TFloatField;
      qryContrConcSintVLRPREVISTO: TFloatField;
      pplContrConSint: TppBDEPipeline;
      ppLabel3: TppLabel;
      ppShape5: TppShape;
      ppLine2: TppLine;
      ppLine3: TppLine;
      ppDBCalc7: TppDBCalc;
      ppDBCalc5: TppDBCalc;
    lblTipoData: TppLabel;
    lblIni: TppLabel;
    ppLabel5: TppLabel;
    lblFim: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    lblTipoEmptmo: TppLabel;
    lblTipoContr: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    memPatro: TppRichText;
    memPlano: TppRichText;
    ppMemo2: TppMemo;
    ppMemo1: TppMemo;

      procedure ppShape1Print(Sender: TObject);
      procedure ppLine1Print(Sender: TObject);
      procedure ppLabel5Print(Sender: TObject);
      procedure pplbTituloPrint(Sender: TObject);
      procedure ppItensContratoBeforePrint(Sender: TObject);
      procedure lblIniPrint(Sender: TObject);
    procedure rptContratoPrint(Sender: TObject);
    procedure lblTipoDataPrint(Sender: TObject);

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

      FTipoRelatorio    : String;
      FDataIni          : String;
      FDataFim          : String;
      FTipoData         : String;

   public { Public declarations }

      sMesCompetencia   : String;
      sContrato         : String;
      bSeparador        : Boolean;
      CorLinha          : TColor;
      CorAtual          : TColor;
      bCorLinha         : Boolean;

      property TipoRelatorio : String read FTipoRelatorio write FTipoRelatorio;
      property DataIni       : String read FDataIni       write FDataIni;
      property DataFim       : String read FDataFim       write FDataFim;
      property TipoData      : String read FTipoData      write FTipoData;


      function MostraParam(Form: string): boolean; override;

   end;



var
  dtmRelContrConcSint: TdtmRelContrConcSint;



implementation
{$R *.DFM}
uses
   CRelContrConcSint, USistema;



function TdtmRelContrConcSint.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelcontrconcsint') then begin
      frm := TcfgRelContrConcSint.Create(Application);
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



procedure TdtmRelContrConcSint.ppShape1Print(Sender: TObject);
begin
   inherited;

   if FTipoRelatorio[1] <> 'A' then begin
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
   end else
      (Sender as TppShape).Brush.Color := $00DADADA;
end;



procedure TdtmRelContrConcSint.ppLine1Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelContrConcSint.ppLabel5Print(Sender: TObject);
begin
   inherited;
   if length(trim(sContrato)) > 0 then (Sender as TppLabel).Caption := sContrato;
end;



procedure TdtmRelContrConcSint.pplbTituloPrint(Sender: TObject);
begin
   inherited;
   pplbTitulo.Caption := 'Empréstimos Concedidos (por Tipo de Contrato)';
end;



procedure TdtmRelContrConcSint.ppItensContratoBeforePrint(Sender: TObject);
begin
   inherited;
   ppItensContrato.Visible                   := FTipoRelatorio[1] = 'A';
   rptContratosAdminSint_LinhaTitulo.Visible := FTipoRelatorio[1] = 'A';
end;



procedure TdtmRelContrConcSint.lblIniPrint(Sender: TObject);
begin
   inherited;
   if length(trim(sMesCompetencia)) > 0 then (Sender as TppLabel).Caption := sMesCompetencia;
end;



procedure TdtmRelContrConcSint.rptContratoPrint(Sender: TObject);
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

procedure TdtmRelContrConcSint.lblTipoDataPrint(
  Sender: TObject);
begin
  inherited;
  if FTipoData = 'A' then begin
     lblTipoData.Caption := 'Data de Assinatura:';
     lblIni.Caption      := FDataIni;
     lblFim.Caption      := FDataFim;
  end else begin
     lblTipoData.Caption := 'Data de Crédito:';
     lblIni.Caption      := FDataIni;
     lblFim.Caption      := FDataFim;
  end;
end;

end.
