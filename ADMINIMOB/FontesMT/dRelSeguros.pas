unit dRelSeguros;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, DBTables, Wwquery,
  ppDB, Provider, DBClient, ppDBPipe, ppDBBDE, Wwdatsrc, ppCtrls, ppBands,
  ppStrtch, ppMemo, ppClass, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv,
  ppProd, ppReport, uCmSqlParams, Grids, DBGrids, uCtrlRelAdminImob,
  uCMClientDataSet, myChkBox, uModuloImobiliario, ppRegion, TXRB;

type
  TdtmRelSeguros = class(TFrmCmReport)
    dsSeguros: TwwDataSource;
    pplSeguros: TppBDEPipeline;
    rptSeguros: TppReport;
    ppHeaderBand1: TppHeaderBand;
    lblEmpresa: TppLabel;
    ppLabel148: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    lblSistema: TppLabel;
    ppLine41: TppLine;
    ppCalc27: TppSystemVariable;
    ppCalc28: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    ppDBText1: TppDBText;
    ppLabel10: TppLabel;
    ppLabel2: TppLabel;
    ppLabel5: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    cdsSeguros: TCMClientDataSet;
    CMsp: TCMSqlParams;
    ppLabel13: TppLabel;
    ppDBText13: TppDBText;
    ppLabel7: TppLabel;
    ppDBText2: TppDBText;
    ppLabel8: TppLabel;
    ppLine1: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLabel6: TppLabel;
    ppLabel9: TppLabel;
    ppDBText9: TppDBText;
    ppLabel11: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppLogoTipo: TppImage;
    ppDBText10: TppDBText;
    ppLabel4: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLabel12: TppLabel;
    ppLabel14: TppLabel;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBMemo9: TppDBMemo;
    ppLine2: TppLine;
    ppRegion1: TppRegion;
    ppLabel15: TppLabel;
    ppDBText8: TppDBText;
    procedure FormCreate(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
    CtrlRelAdminImob : TCtrlRelAdminImob;
  public
    { Public declarations }

  end;

var
  dtmRelSeguros: TdtmRelSeguros;

implementation

uses uFuncoesImob, uSistema, dBaseDados, cRelExtrato, UComunsImobiliario, uVerificaPreenchimento;
{$R *.DFM}

procedure TdtmRelSeguros.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRelAdminImob := TCtrlRelAdminImob.Create;
  CtrlRelAdminImob.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                            ComunsImobiliario.MensErroMT);
end;


procedure TdtmRelSeguros.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  // Carrega o Logotipo - Marcio Motta - 30/07/2004
  if ModuloImobiliario.AdminImob.bFlgLogoRelat then
     ppLogotipo.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
  else
     ppLogotipo.Picture := nil;

  cdsSeguros.Data := CtrlRelAdminImob.SelecionaRelSeguros(
                                      CmpRptCM.ParamValues[0].AsInteger,   // idImovel
                                      CmpRptCM.ParamValues[1].AsInteger,   // idSeguradora
                                      CmpRptCM.ParamValues[2].AsInteger);  // Tipo
end;

end.
