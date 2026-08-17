unit dRelItemAnalitico;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE;

type
   TdtmRelItemAnalitico = class(TdtmReports)
      pplSaldoParcelas: TppBDEPipeline;
      dsSaldoParcelas: TwwDataSource;
    rptItemAnalitico: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      ppLine2: TppLine;
      ppLabel3: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppLine3: TppLine;
      ppLabel8: TppLabel;
      ppSummaryBand1: TppSummaryBand;
      rptContrato: TppShape;
      ppLabel122: TppLabel;
      ppLabel872: TppLabel;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppLine4: TppLine;
      ppDBText5: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppGroup3: TppGroup;
      ppGroupHeaderBand3: TppGroupHeaderBand;
      ppGroupFooterBand3: TppGroupFooterBand;
      ppLine6: TppLine;
      ppLabel13: TppLabel;
      qrySaldoParcelas: TwwQuery;
      UpdateSQL: TUpdateSQL;
      qrySaldoParcelasIDPATRO: TFloatField;
      qrySaldoParcelasNOMEPATRO: TStringField;
      qrySaldoParcelasIDPLANOPREV: TFloatField;
      qrySaldoParcelasDESCPLANO: TStringField;
      qrySaldoParcelasIDTIPOCONTREMPTMO: TFloatField;
      qrySaldoParcelasTCEDESCRICAO: TStringField;
      qrySaldoParcelasITEDESCRICAO: TStringField;
      qrySaldoParcelasIDITEMEMPTMO: TFloatField;
      qrySaldoParcelasVALOR: TFloatField;
      qrySaldoParcelasQUANT: TFloatField;
      ppDBText13: TppDBText;
      ppShape1: TppShape;
      ppLine1: TppLine;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      qrySaldoParcelasAFETASALDO: TStringField;
      qrySaldoParcelasCENTRALIZADOR: TStringField;
      ppDBText1: TppDBText;
      ppDBText4: TppDBText;
    ppLabel6: TppLabel;

      procedure rptContratoPrint(Sender: TObject);
      procedure ppLabel872Print(Sender: TObject);

   private { Private declarations }

      // Cores:
      //    ColorA = $FFFFFF   { branco, clWhite }
      //    ColorC = $00C0FFFF { amarelo - pastel }
      //    ColorD = $00C6F9CC { verde - pastel }
      //    ColorE = $00F3E6CD { azul - pastel }
      //    ColorF = $00A0A0A0
      //    ColorG = $00BEBEBE
      //    ColorH = $00D2D2D2
      //    ColorI = $00E3E3E3

   public { Public declarations }

      sMesCompetencia   : String;
      sAnoCompetencia   : String;
      CorLinha          : TColor;
      CorAtual          : TColor;
      bCorLinha         : Boolean;

      function MostraParam(Form: string): boolean; override;

  end;



var
  dtmRelItemAnalitico: TdtmRelItemAnalitico;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo, cRelItemAnalitico;


function TdtmRelItemAnalitico.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   if (LowerCase(Form) = 'cfgrelitemanalitico') then begin
      frm := TcfgRelItemAnalitico.Create(Application);
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



procedure TdtmRelItemAnalitico.rptContratoPrint(Sender: TObject);
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



procedure TdtmRelItemAnalitico.ppLabel872Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLabel).Caption := sMesCompetencia;
end;



end.


