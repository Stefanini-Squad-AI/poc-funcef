unit dRelAbonos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCMReportMTImob, Db, uCmSqlParams, DBClient, uCmRptManager, TXComp, TXRB,
  CmParamReport, uCtrlRelAlienacao, ppDB, ppDBPipe, ppDBBDE, ppBands,
  ppClass, ppCtrls, ppStrtch, ppRegion, ppVar, ppPrnabl, ppCache, ppComm,
  ppRelatv, ppProd, ppReport, uModuloImobiliario, ppModule, daDataModule;

type
  TdtmRelAbonos = class(TFrmCmReportImob)
    rptAbonos: TppReport;
    ppHeaderBand1: TppHeaderBand;
    lblEmpresa: TppLabel;
    ppLabel148: TppLabel;
    ppLogoTipo: TppImage;
    ppDetailBand1: TppDetailBand;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppCalc27: TppSystemVariable;
    lblSistema: TppLabel;
    ppLine41: TppLine;
    pplAbonos: TppBDEPipeline;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText7: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText8: TppDBText;
    ppLabel7: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppCalc28: TppSystemVariable;
    ppRegion1: TppRegion;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel2: TppLabel;
    ppLabel9: TppLabel;
    ppLabel12: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel1: TppLabel;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppLabel8: TppLabel;
    ppLabel10: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppRegion2: TppRegion;
    ppRegion3: TppRegion;
    ppLine3: TppLine;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine4: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppRegion4: TppRegion;
    ppLabel11: TppLabel;
    ppDBCalc3: TppDBCalc;
    daDataModule1: TdaDataModule;
    ppLbPeriodo: TppLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
    CtrlRelAlienacao : TCtrlRelAlienacao;
  public
    { Public declarations }
  end;

var
  dtmRelAbonos: TdtmRelAbonos;

implementation

uses uFuncoesImob, uSistema, dBaseDados, cRelExtrato, uVerificaPreenchimento, uComunsImobiliario;

{$R *.DFM}

procedure TdtmRelAbonos.FormCreate(Sender: TObject);
begin
  inherited;

  CtrlRelAlienacao := TCtrlRelAlienacao.Create;
  CtrlRelAlienacao.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                              Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                              ComunsImobiliario.MensErroMT);


end;

procedure TdtmRelAbonos.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlRelAlienacao);
  inherited;
end;

procedure TdtmRelAbonos.CrmRptCMBeforePrint(Sender: TObject);
var
  iContrato  : Integer;
  sSegmento  : String;
  sDataIni   : String;
  sDataFim   : String;
  sTipoAbono : String;
begin
  inherited;

  if ModuloImobiliario.Alienacao.bFlgLogoRelat then
       ppLogotipo.Picture := ModuloImobiliario.Alienacao.LogoTipo.Picture
  else ppLogotipo.Picture := nil;

  iContrato  := CmpRptCM.ParamByName('iContrato').AsInteger;
  sSegmento  := CmpRptCM.ParamByName('sSegmento').AsString;
  sDataIni   := CmpRptCM.ParamByName('sDataIni').AsString;
  sDataFim   := CmpRptCM.ParamByName('sDataFim').AsString;
  sTipoAbono := CmpRptCM.ParamByName('sTipoAbono').AsString;

  if (Trim(sDataIni) <> '') and (Trim(sDataFim) <> '') then
    ppLbPeriodo.Caption := 'Período de ' + sDataIni + ' até ' + sDataFim
  else
    ppLbPeriodo.Caption := '';

  cds.Data  := CtrlRelAlienacao.LookupAbonos(iContrato,sSegmento,sDataIni,sDataFim,sTipoAbono);

end;

end.
