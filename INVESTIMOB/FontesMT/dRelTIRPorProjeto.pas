unit dRelTIRPorProjeto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, Provider, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE, DBClient, uCMClientDataSet, ppStrtch, ppRegion,
  uCmSqlParams, ppSubRpt;

type
  TdtmRelTIRPorProjeto = class(TdtmReports)
    cds: TCMClientDataSet;
    cdsIDIMOVEL: TFloatField;
    cdsIMONOME: TStringField;
    cdsMOESIGLA: TStringField;
    cdsTAXACOMPRA: TFloatField;
    cdsDATAAQUISICAO: TDateTimeField;
    cdsTXTIR1: TFloatField;
    cdsTXTIR2: TFloatField;
    cdsVPL1: TFloatField;
    cdsVPL2: TFloatField;
    cdsVPL3: TFloatField;
    cdsPAYBACK: TFloatField;
    dts: TDataSource;
    ppppln: TppDBPipeline;
    pprpt: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLogoTipo: TppImage;
    pplblEmpresa: TppLabel;
    ppLabel14: TppLabel;
    ppLine2: TppLine;
    ppImage1: TppImage;
    pplblSistema: TppLabel;
    ppLine3: TppLine;
    ppOrcamentoSystemVariable8: TppSystemVariable;
    ppOrcamentoSystemVariable7: TppSystemVariable;
    rgParam: TppRegion;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    pplblCompetencia: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    pplblTipoSegmento: TppLabel;
    ppLabel24: TppLabel;
    pplblDia: TppLabel;
    ppLine1: TppLine;
    ppLabel3: TppLabel;
    ppDBText4: TppDBText;
    ppDbNome: TppDBText;
    ppLabel1: TppLabel;
    ppDBText2: TppDBText;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppLabel6: TppLabel;
    ppDBText3: TppDBText;
    ppShape1: TppShape;
    ppShape4: TppShape;
    ppLabel9: TppLabel;
    ppdbTXTIR1: TppDBText;
    ppdbTXTIR2: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppShapeVPL: TppShape;
    ppLbl_VPL: TppShape;
    ppLblVPL: TppLabel;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppdbVPL1: TppDBText;
    ppdbVPL2: TppDBText;
    ppDBText13: TppDBText;
    ppdbVPL3: TppDBText;
    ppDBText15: TppDBText;
    ppLabel7: TppLabel;
    cdsINDTIR1: TStringField;
    cdsINDTIR2: TStringField;
    cdsPERCVPL1: TStringField;
    cdsPERCVPL2: TStringField;
    cdsPERCVPL3: TStringField;
    ppLabel2: TppLabel;
    pplblIndicePayBack: TppLabel;
    ppsCor: TppShape;
    cdsFluxo: TCMClientDataSet;
    dsFluxo: TDataSource;
    sqlFluxo: TCMSqlParams;
    pplFluxo: TppDBPipeline;
    rptFluxo: TppSubReport;
    ppChildReport1: TppChildReport;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel15: TppLabel;
    ppLine4: TppLine;
    ppDBText1: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText11: TppDBText;
    ppLine5: TppLine;
    ppLabel16: TppLabel;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel23: TppLabel;
    ppDBText12: TppDBText;
    ppDBText14: TppDBText;
    ppShape5: TppShape;
    ppTitleBand1: TppTitleBand;
    procedure pprptBeforePrint(Sender: TObject);
    procedure ppsCorPrint(Sender: TObject);
    procedure rptFluxoPrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bCorLinha : boolean;
    CorLinha, CorAtual : TColor;
  end;

var
  dtmRelTIRPorProjeto: TdtmRelTIRPorProjeto;

implementation

{$R *.DFM}

uses uSistema, uModuloImobiliario;

procedure TdtmRelTIRPorProjeto.pprptBeforePrint(Sender: TObject);
begin
  inherited;
  // Carrega o Logotipo
  if ModuloImobiliario.InvestImob.bFlgLogoRelat then
       ppLogotipo.Picture := ModuloImobiliario.InvestImob.LogoTipo.Picture
  else ppLogotipo.Picture := nil;
  ppLblEmpresa.Text := Sistema.NomeEmpresa;
  ppLblSistema.Text := Sistema.NomeModulo;
end;

procedure TdtmRelTIRPorProjeto.ppsCorPrint(Sender: TObject);
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

procedure TdtmRelTIRPorProjeto.rptFluxoPrint(Sender: TObject);
begin
  inherited;
  // Define Filtro do imovel mestre
  cdsFluxo.Filtered := False;
  cdsFluxo.Filter   := 'IDIMOVEL = ' + cds.FieldByName('IDIMOVEL').AsString;
  cdsFluxo.Filtered := True;
end;

end.
