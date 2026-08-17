unit FDmRelAgendaEventos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosRendaFixa, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass,
  ppCache, ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt, ppViewr, FPreview,
  FDMRelatoriosInv;

type
  TdmRelAgendaEventos = class(TDmRelatoriosInv)
    pprAgendaEventos: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppbDetalhePrincipal: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    pplAgendaEventos: TppBDEPipeline;
    qryAgendaEventos: TwwQuery;
    dsAgendaEventos: TwwDataSource;
    ppGroup1: TppGroup;
    ppbCabTipoRel: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    shpCabecalho: TppShape;
    ppdbNomeRel: TppDBText;
    srptRendaVariavel: TppSubReport;
    ppcrRV: TppChildReport;
    ppDetailBand2: TppDetailBand;
    ppRPRV: TppFooterBand;
    pphCabRV: TppHeaderBand;
    shpCabRV: TppShape;
    ppLabel5: TppLabel;
    shpDetRV: TppShape;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLabel6: TppLabel;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel7: TppLabel;
    ppDBText7: TppDBText;
    ppLabel9: TppLabel;
    ppDBText8: TppDBText;
    ppLabel10: TppLabel;
    srptBMF: TppSubReport;
    ppcrBMF: TppChildReport;
    ppDetailBand3: TppDetailBand;
    pphCabBMF: TppHeaderBand;
    shpCabBMF: TppShape;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel14: TppLabel;
    ppLabel16: TppLabel;
    shpDetBMF: TppShape;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppRPBMF: TppFooterBand;
    srptRendaFixa: TppSubReport;
    crpRendaFixa: TppChildReport;
    ppDetailBand4: TppDetailBand;
    pphCabRF: TppHeaderBand;
    ppRPRF: TppFooterBand;
    shpCabRendaFixa: TppShape;
    shpDetRF: TppShape;
    ppDBText15: TppDBText;
    ppLabel17: TppLabel;
    ppDBText16: TppDBText;
    ppLabel18: TppLabel;
    pplAgendaEventosDet: TppBDEPipeline;
    qryAgendaEventosDet: TwwQuery;
    dsAgendaEventosDet: TwwDataSource;
    srptEmprestimo: TppSubReport;
    crpEmprestimo: TppChildReport;
    pphCabEMP: TppHeaderBand;
    shpCabEmprestimo: TppShape;
    ppLabel23: TppLabel;
    ppDetailBand6: TppDetailBand;
    shpDetEMP: TppShape;
    ppRPEMP: TppFooterBand;
    qryAgendaEventosTIPOREL: TFloatField;
    qryAgendaEventosDESCREL: TStringField;
    qryAgendaEventosDetTIPOREL: TFloatField;
    qryAgendaEventosDetVENCIMENTO: TDateTimeField;
    qryAgendaEventosDetTITULO: TStringField;
    qryAgendaEventosDetPERFIL: TStringField;
    qryAgendaEventosDetTIPOTITULO: TStringField;
    qryAgendaEventosDetINVESTIMENTO: TStringField;
    qryAgendaEventosDetITEM: TStringField;
    qryAgendaEventosDetDESCTIPOOPERACAO: TStringField;
    qryAgendaEventosDetASSEMBLEIA: TDateTimeField;
    qryAgendaEventosDetQTDOPERACAO: TFloatField;
    qryAgendaEventosDetPU: TFloatField;
    qryAgendaEventosDetVLROPERACAO: TFloatField;
    qryAgendaEventosDetPERCENTUAL: TFloatField;
    qryAgendaEventosDetDATAEMISSAO: TDateTimeField;
    qryAgendaEventosDetDATAOPERACAO: TDateTimeField;
    qryAgendaEventosDetVLRRESGATE: TFloatField;
    qryAgendaEventosDetVLRJUROS: TFloatField;
    ppDBText1: TppDBText;
    ppLabel4: TppLabel;
    ppDBText17: TppDBText;
    ppLabel19: TppLabel;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppLabel20: TppLabel;
    ppDBText20: TppDBText;
    ppLabel21: TppLabel;
    ppDBText21: TppDBText;
    ppLabel22: TppLabel;
    ppLabel25: TppLabel;
    ppDBText22: TppDBText;
    ppLabel26: TppLabel;
    ppDBText23: TppDBText;
    ppDBText26: TppDBText;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppDBText27: TppDBText;
    ppLabel33: TppLabel;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppLabel32: TppLabel;
    ppLabel8: TppLabel;
    ppLabel13: TppLabel;
    ppLabel15: TppLabel;
    ppLabel24: TppLabel;
    ppDBImage1: TppDBImage;
    procedure pprAgendaEventosStartPage(Sender: TObject);
    procedure shpDetBMFPrint(Sender: TObject);
    procedure shpDetRFPrint(Sender: TObject);
    procedure shpDetRVPrint(Sender: TObject);
    procedure ppbCabTipoRelBeforePrint(Sender: TObject);
    procedure crpRendaFixaStartPage(Sender: TObject);
    procedure ppcrBMFStartPage(Sender: TObject);
    procedure ppcrRVStartPage(Sender: TObject);
    procedure srptResumoPrint(Sender: TObject);
    procedure shpDetResumoPrint(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
  public
    { Public declarations }
  end;

var
  dmRelAgendaEventos: TdmRelAgendaEventos;

implementation

uses dOperComum, FConsAgendaEventos;

{$R *.DFM}

procedure TdmRelAgendaEventos.pprAgendaEventosStartPage(
   Sender: TObject);
begin
   inherited;
   cCorZebra := $00E3E3E3;
   shpDetRV.Brush.Color := clWhite;
   shpDetRF.Brush.Color := clWhite;
   shpDetBMF.Brush.Color := clWhite;
   shpDetEMP.Brush.Color := clWhite;
end;

procedure TdmRelAgendaEventos.shpDetBMFPrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TdmRelAgendaEventos.shpDetRFPrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TdmRelAgendaEventos.shpDetRVPrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TdmRelAgendaEventos.ppbCabTipoRelBeforePrint(Sender: TObject);
var sFiltro: String;
begin
  inherited;
  sFiltro := 'TIPOREL = ' + qryAgendaEventosTIPOREL.AsString;
  qryAgendaEventosDet.Filter    := sFiltro;
  case qryAgendaEventosTIPOREL.AsInteger of
  1: begin // Renda Variavel
        srptRendaVariavel.Visible := True;
        pphCabRV.Visible := True;
        ppRPRV.Visible := True;
        srptBMF.Visible := False;
        srptEmprestimo.Visible := False;
        srptRendaFixa.Visible := False;
     end;
  2: begin // Renda Fixa
        srptRendaVariavel.Visible := False;
        srptBMF.Visible := False;
        srptEmprestimo.Visible := False;
        srptRendaFixa.Visible := True;
        pphCabRF.Visible := True;
        ppRPRF.Visible := True;
     end;
  3: begin // BM&F
        srptRendaVariavel.Visible := False;
        srptBMF.Visible := True;
        pphCabBMF.Visible := True;
        ppRPBMF.Visible := True;
        srptEmprestimo.Visible := False;
        srptRendaFixa.Visible := False;
     end;
  4: begin // Emprestimo
        srptRendaVariavel.Visible := False;
        srptBMF.Visible := False;
        srptEmprestimo.Visible := True;
        pphCabEMP.Visible := True;
        ppRPEMP.Visible := True;
        srptRendaFixa.Visible := True;
     end;
  end;
end;

procedure TdmRelAgendaEventos.crpRendaFixaStartPage(Sender: TObject);
begin
   inherited;
   cCorZebra := $00E3E3E3;
end;

procedure TdmRelAgendaEventos.ppcrBMFStartPage(Sender: TObject);
begin
   inherited;
   cCorZebra := $00E3E3E3;
end;

procedure TdmRelAgendaEventos.ppcrRVStartPage(Sender: TObject);
begin
   inherited;
   cCorZebra := $00E3E3E3;
end;

procedure TdmRelAgendaEventos.srptResumoPrint(Sender: TObject);
begin
   inherited;
   cCorZebra := $00E3E3E3;
end;

procedure TdmRelAgendaEventos.shpDetResumoPrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

end.
