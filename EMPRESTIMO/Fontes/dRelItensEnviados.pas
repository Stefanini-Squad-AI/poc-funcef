unit dRelItensEnviados;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE;

type
   TdtmRelItensEnviados = class(TdtmReports)
      pplItensEnviados: TppBDEPipeline;
      dsItensEnviados: TwwDataSource;
    qryItensEnviados1: TwwQuery;
      rptItensEnviados: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      ppLine2: TppLine;
      ppLabel3: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppShape1: TppShape;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppLine3: TppLine;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppSummaryBand1: TppSummaryBand;
      ppLine5: TppLine;
      ppDBCalc2: TppDBCalc;
      ppDBCalc5: TppDBCalc;
      ppDBCalc6: TppDBCalc;
      ppDBCalc7: TppDBCalc;
      ppDBCalc8: TppDBCalc;
      rptContrato: TppShape;
      ppLabel122: TppLabel;
      ppLabel872: TppLabel;
      rptContratosAdminAnalShape1: TppShape;
      ppShape2: TppShape;
    qryItensEnviados1NOME: TStringField;
    qryItensEnviados1TCEDESCRICAO: TStringField;
    qryItensEnviados1TOTALPARCMES: TFloatField;
    qryItensEnviados1TOTALPARCATR: TFloatField;
    qryItensEnviados1TOTALENC: TFloatField;
    qryItensEnviados1TOTALAMO: TFloatField;
    qryItensEnviados1TOTALQUI: TFloatField;
    qryItensEnviados1TOTALQUM: TFloatField;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppLine4: TppLine;
      ppDBText13: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppDBText1: TppDBText;
      ppDBCalc1: TppDBCalc;
      ppLabel4: TppLabel;
      ppDBCalc3: TppDBCalc;
      ppShape3: TppShape;
      ppDBCalc4: TppDBCalc;
      ppDBCalc9: TppDBCalc;
      ppDBCalc19: TppDBCalc;
      ppDBCalc20: TppDBCalc;
      ppDBCalc21: TppDBCalc;
      ppDBCalc10: TppDBCalc;
      ppDBCalc11: TppDBCalc;
      ppDBCalc12: TppDBCalc;
      ppDBCalc13: TppDBCalc;
      ppDBCalc14: TppDBCalc;
      ppDBCalc15: TppDBCalc;
      ppDBText2: TppDBText;
    qryItensEnviados1VLRPARCMES: TFloatField;
    qryItensEnviados1VLRPARCATR: TFloatField;
    qryItensEnviados1VLRENCARGO: TFloatField;
    qryItensEnviados1VLRAMORT: TFloatField;
    qryItensEnviados1VLRQUITACAO: TFloatField;
    qryItensEnviados1VLRQUITMORT: TFloatField;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText10: TppDBText;
      ppDBText14: TppDBText;
      ppDBText15: TppDBText;
      ppDBText16: TppDBText;
      ppDBCalc16: TppDBCalc;
      ppDBCalc17: TppDBCalc;
      ppDBCalc18: TppDBCalc;
      ppDBCalc22: TppDBCalc;
      ppDBCalc23: TppDBCalc;
      ppDBCalc24: TppDBCalc;
      ppDBCalc25: TppDBCalc;
      ppDBCalc26: TppDBCalc;
      ppDBCalc27: TppDBCalc;
      ppDBCalc28: TppDBCalc;
      ppDBCalc29: TppDBCalc;
      ppDBCalc30: TppDBCalc;
      ppDBCalc31: TppDBCalc;
      ppDBCalc32: TppDBCalc;
      ppDBCalc33: TppDBCalc;
      ppDBCalc34: TppDBCalc;
      ppDBCalc35: TppDBCalc;
      ppDBCalc36: TppDBCalc;
    qryItensEnviados1DESCPLANO: TStringField;
      ppGroup3: TppGroup;
      ppGroupHeaderBand3: TppGroupHeaderBand;
      ppGroupFooterBand3: TppGroupFooterBand;
      ppDBCalc37: TppDBCalc;
      ppDBCalc38: TppDBCalc;
      ppDBCalc39: TppDBCalc;
      ppDBCalc40: TppDBCalc;
      ppDBCalc41: TppDBCalc;
      ppDBCalc42: TppDBCalc;
      ppDBCalc43: TppDBCalc;
      ppDBCalc44: TppDBCalc;
      ppDBCalc45: TppDBCalc;
      ppDBCalc46: TppDBCalc;
      ppDBCalc47: TppDBCalc;
      ppDBCalc48: TppDBCalc;
      ppLine6: TppLine;
      ppLine7: TppLine;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLine1: TppLine;
      ppLabel13: TppLabel;
      ppLabel14: TppLabel;
      ppLabel15: TppLabel;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
    qryItensEnviados1TOTALCONCMES: TFloatField;
    qryItensEnviados1VLRCONCMES: TFloatField;
      ppDBCalc49: TppDBCalc;
      ppDBCalc50: TppDBCalc;
      ppDBCalc51: TppDBCalc;
      ppDBCalc52: TppDBCalc;
      ppDBCalc53: TppDBCalc;
      ppDBCalc54: TppDBCalc;
      ppDBText17: TppDBText;
      ppDBText18: TppDBText;
      ppLabel7: TppLabel;
      ppDBCalc55: TppDBCalc;
      ppDBCalc56: TppDBCalc;
      qryItensEnviados: TwwQuery;
      qryItensEnviadosIDPESSOA: TFloatField;
      qryItensEnviadosNOME: TStringField;
      qryItensEnviadosIDPLANOPREV: TFloatField;
      qryItensEnviadosDESCPLANO: TStringField;
      qryItensEnviadosIDTIPOCONTREMPTMO: TFloatField;
      qryItensEnviadosTCEDESCRICAO: TStringField;
      qryItensEnviadosTOTALCONCMES: TFloatField;
      qryItensEnviadosVLRCONCMES: TFloatField;
      qryItensEnviadosTOTALPARCMES: TFloatField;
      qryItensEnviadosVLRPARCMES: TFloatField;
      qryItensEnviadosTOTALPARCATR: TFloatField;
      qryItensEnviadosVLRPARCATR: TFloatField;
      qryItensEnviadosTOTALENC: TFloatField;
      qryItensEnviadosVLRENCARGO: TFloatField;
      qryItensEnviadosTOTALAMO: TFloatField;
      qryItensEnviadosVLRAMORT: TFloatField;
      qryItensEnviadosTOTALQUI: TFloatField;
      qryItensEnviadosVLRQUITACAO: TFloatField;
      qryItensEnviadosTOTALQUM: TFloatField;
      qryItensEnviadosVLRQUITMORT: TFloatField;
      UpdateSQL: TUpdateSQL;
      ppShape5: TppShape;

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
  dtmRelItensEnviados: TdtmRelItensEnviados;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo, cRelItensEnviados;




function TdtmRelItensEnviados.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   if (LowerCase(Form) = 'cfgrelitensenviados') then begin
      frm := TcfgRelItensEnviados.Create(Application);
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



procedure TdtmRelItensEnviados.rptContratoPrint(Sender: TObject);
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



procedure TdtmRelItensEnviados.ppLabel872Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLabel).Caption := sMesCompetencia;
end;



end.


