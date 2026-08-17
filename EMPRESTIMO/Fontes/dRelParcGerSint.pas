unit dRelParcGerSint;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE;

type
   TdtmRelParcGerSint = class(TdtmReports)
    pplParcGerSint: TppBDEPipeline;
    dsParcGerSint: TwwDataSource;
    qryParcGerSint: TwwQuery;
    rptParcGerSint: TppReport;
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
      ppLabel7: TppLabel;
      ppSummaryBand1: TppSummaryBand;
      ppLine5: TppLine;
      ppDBCalc2: TppDBCalc;
      rptContrato: TppShape;
      ppLabel122: TppLabel;
      rptContratosAdminAnal_lblAdministradora: TppLabel;
      rptContratosAdminAnalShape1: TppShape;
      ppShape2: TppShape;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppLine4: TppLine;
      ppDBText13: TppDBText;
      ppDBText5: TppDBText;
      ppDBText1: TppDBText;
      ppDBCalc3: TppDBCalc;
      ppShape3: TppShape;
      ppDBCalc10: TppDBCalc;
      ppDBCalc14: TppDBCalc;
      ppDBCalc15: TppDBCalc;
      ppDBText4: TppDBText;
      ppDBCalc16: TppDBCalc;
      ppDBCalc25: TppDBCalc;
      ppDBCalc31: TppDBCalc;
      ppDBCalc35: TppDBCalc;
      ppDBCalc36: TppDBCalc;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppDBCalc37: TppDBCalc;
    ppDBCalc38: TppDBCalc;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel12: TppLabel;
    qryParcGerSintDESCTIPOEMPTMO: TStringField;
    qryParcGerSintTCEDESCRICAO: TStringField;
    qryParcGerSintPLANO: TStringField;
    qryParcGerSintPATRO: TStringField;
    qryParcGerSintITEM: TStringField;
    qryParcGerSintHMECENTRALIZA: TFloatField;
    qryParcGerSintTOTAL: TFloatField;
    qryParcGerSintTOTCONTRATO: TFloatField;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppDBText17: TppDBText;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppDBCalc4: TppDBCalc;
    ppLabel4: TppLabel;
    ppLine1: TppLine;
    ppDBCalc1: TppDBCalc;
    qryParcGerSintTOTALPARCELA: TFloatField;
    ppLine8: TppLine;

      procedure rptContratoPrint(Sender: TObject);
      procedure rptContratosAdminAnal_lblAdministradoraPrint(Sender: TObject);

   private { Private declarations }

      CorAtual, FCorLinha : TColor;
      FIsCorLinha         : Boolean;

      FMesCompetencia     : String;
      FAnoCompetencia     : String;

  public { Public declarations }

//    Cores:
//    ColorA = $FFFFFF   { branco, clWhite }
//    ColorC = $00C0FFFF { amarelo - pastel }
//    ColorD = $00C6F9CC { verde - pastel }
//    ColorE = $00F3E6CD { azul - pastel }
//    ColorF = $00A0A0A0
//    ColorG = $00BEBEBE
//    ColorH = $00D2D2D2
//    ColorI = $00E3E3E3


    function MostraParam(Form: string): boolean; override;


    property MesCompetencia : String read FMesCompetencia write FMesCompetencia;
    property AnoCompetencia : String read FAnoCompetencia write FAnoCompetencia;

    property CorLinha : TColor read FCorLinha write FCorLinha;
    property IsCorLinha : Boolean read FIsCorLinha write FIsCorLinha;

  end;



var
  dtmRelParcGerSint: TdtmRelParcGerSint;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo, cRelParcGerSint;



function TdtmRelParcGerSint.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   if (LowerCase(Form) = 'cfgrelparcgersint') then begin
      frm := TcfgRelParcGerSint.Create(Application);
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



procedure TdtmRelParcGerSint.rptContratoPrint(Sender: TObject);
begin
  inherited;

   if FIsCorLinha then begin
      if CorAtual = clWhite then begin
         CorAtual := FCorLinha;
      end else begin
         CorAtual := clWhite;
      end;
   end else begin
      CorAtual := clWhite;
   end;

   (Sender as TppShape).Brush.Color := CorAtual;

end;



procedure TdtmRelParcGerSint.rptContratosAdminAnal_lblAdministradoraPrint(
  Sender: TObject);
begin
  inherited;
   TppLabel(Sender).Caption := FMesCompetencia + '/' + FAnoCompetencia;
end;



end.


