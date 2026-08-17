unit dRelEvolInadimp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCMReportMTImob, Db, uCmSqlParams, DBClient, uCmRptManager, TXComp,
  CmParamReport, ppDB, ppDBPipe, ppBands, ppClass, ppVar, ppStrtch,
  ppRichTx, ppCtrls, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  ExtCtrls, TeeProcs, TeEngine, Chart, ppChrtDP, ppChrt, Series, Provider,
  DBTables, uCtrlIndicadorImovel, JCLStrings, JClSysUtils;

type
  TdtmRelEvolInadimp = class(TFrmCmReportImob)
    ppEvolInadimp: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLogo: TppImage;
    lblEmpresa: TppLabel;
    ppLabel148: TppLabel;
    ppLine3: TppLine;
    ppDetail: TppDetailBand;
    ppSeparador: TppShape;
    ppFooterBand1: TppFooterBand;
    lblSistema: TppLabel;
    ppCalc27: TppSystemVariable;
    ppCalc28: TppSystemVariable;
    ppdpEvolInadimp: TppDBPipeline;
    cdsIndicadores: TClientDataSet;
    cdsMESANO: TStringField;
    cdsDOCUMENTOS: TFloatField;
    cdsINADIMPLENCIAS: TFloatField;
    cdsIndicadoresANOMES: TStringField;
    cdsIndicadoresQTDDOC: TFloatField;
    cdsIndicadoresQTDINA: TFloatField;
    cdsIndicadoresVALDOC: TFloatField;
    cdsIndicadoresVALINA: TFloatField;
    ppDPTeeChart1: TppDPTeeChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    cdsCONTADOR: TIntegerField;
    ppDBText1: TppDBText;
    ppdbtxtContratos: TppDBText;
    ppdbtxtInadimp: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    pplblObs: TppLabel;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    pplblContratos: TppLabel;
    pplblInadimp: TppLabel;
    cdsPERCENTUAL: TFloatField;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    CtrlIndicadorImovel : TCtrlIndicadorImovel;
  public
    { Public declarations }
  end;

var
  dtmRelEvolInadimp: TdtmRelEvolInadimp;

implementation

{$R *.DFM}

uses dBaseDados, uMensErro, uSistema, uComunsImobiliario, uModuloImobiliario;

procedure TdtmRelEvolInadimp.CrmRptCMBeforePrint(Sender: TObject);
var
  sMesAnoIni, sMesAnoFim : string;
  sTipoContrato, sExibir : string;
begin

  inherited;

  if ModuloImobiliario.AdminImob.bFlgLogoRelat then
    ppLogo.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
  else
    ppLogo.Picture := nil;

  sTipoContrato := CmpRptCM.ParamByName('TipoContrato').AsString;
  sExibir       := CmpRptCM.ParamByName('Exibir').AsString;
  sMesAnoIni    := CmpRptCM.ParamByName('Inicio').AsString;
  sMesAnoFim    := CmpRptCM.ParamByName('Fim').AsString;

  cds.Close;
  cds.CreateDataset;

  cdsIndicadores.Close;

  cdsIndicadores.Data := CtrlIndicadorImovel.RecuperaApuracoes( sTipoContrato, sMesAnoIni, sMesAnoFim );

  cdsIndicadores.First;
  while not cdsIndicadores.Eof do
  begin
    cds.Append;
    cdsCONTADOR.AsInteger := cdsIndicadores.RecNo;
    cdsMESANO.AsString    := StrRight( cdsIndicadoresANOMES.AsString, 2 ) + '/' + StrLeft( cdsIndicadoresANOMES.AsString, 4 );

    if sExibir = 'Q' then
    begin
      cdsDOCUMENTOS.AsFloat     := cdsIndicadoresQTDDOC.AsFloat;
      cdsINADIMPLENCIAS.AsFloat := cdsIndicadoresQTDINA.AsFloat;
    end
    else
    begin
      cdsDOCUMENTOS.AsFloat     := cdsIndicadoresVALDOC.AsFloat;
      cdsINADIMPLENCIAS.AsFloat := cdsIndicadoresVALINA.AsFloat;
    end;

    cdsPERCENTUAL.AsFloat := 0;
    If cdsDOCUMENTOS.AsFloat <> 0 then
      cdsPERCENTUAL.AsFloat := ( cdsINADIMPLENCIAS.AsFloat / cdsDOCUMENTOS.AsFloat ) * 100;

    cds.Post;

    cdsIndicadores.Next;
  end;

  pplblObs.Caption := '* Exibindo ';

  if sExibir = 'Q' then
    pplblObs.Caption := pplblObs.Caption + 'quantidades '
  else
    pplblObs.Caption := pplblObs.Caption + 'valores ';

  pplblObs.Caption := pplblObs.Caption + 'de ';

  if sTipoContrato = 'T' then
    pplblObs.Caption := pplblObs.Caption + 'todos os contratos '
  else if sTipoContrato = 'L' then
    pplblObs.Caption := pplblObs.Caption + 'contratos de locação '
  else
    pplblObs.Caption := pplblObs.Caption + 'contratos de alienação ';

  pplblObs.Caption := pplblObs.Caption + 'vigentes de ' +
   StrRight( sMesAnoIni, 2 ) + '/' + StrLeft( sMesAnoIni, 4 ) + ' a ' +
   StrRight( sMesAnoFim, 2 ) + '/' + StrLeft( sMesAnoFim, 4 ) + '. ';


  if sExibir = 'Q' then
  begin
    pplblContratos.Caption := 'Nº';
    pplblInadimp.Caption   := 'Nº';
    ppdbtxtContratos.DisplayFormat := '';
    ppdbtxtInadimp.DisplayFormat   := '';
  end
  else
  begin
    pplblContratos.Caption := 'Valor';
    pplblInadimp.Caption   := 'Valor';
    ppdbtxtContratos.DisplayFormat := '#,##0.00';
    ppdbtxtInadimp.DisplayFormat   := '#,##0.00';
  end;

  pplblContratos.Caption := pplblContratos.Caption + ' de Doc no mês';
  pplblInadimp.Caption   := pplblInadimp.Caption + ' de inadimpl.acum.';




end;

procedure TdtmRelEvolInadimp.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlIndicadorImovel := TCtrlIndicadorImovel.Create (Sistema.IdEmpresa,
                                                      Sistema.IdModulo,
                                                      Sistema.IdUsuario,
                                                      Sistema.IdEspAcesso,
                                                      Sistema.UsaPlanoPatro);
  CtrlIndicadorImovel.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                Sistema.ConnectionSide, Sistema.AppRemoteServer, True, ComunsImobiliario.MensErroMT);
end;

procedure TdtmRelEvolInadimp.FormDestroy(Sender: TObject);
begin
  inherited;
  CtrlIndicadorImovel.Free;
end;

end.
