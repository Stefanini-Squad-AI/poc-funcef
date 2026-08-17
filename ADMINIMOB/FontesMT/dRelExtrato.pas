unit dRelExtrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, DBTables, Wwquery,
  ppDB, Provider, DBClient, ppDBPipe, ppDBBDE, Wwdatsrc, ppCtrls, ppBands,
  ppStrtch, ppMemo, ppClass, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv,
  ppProd, ppReport, uCmSqlParams, Grids, DBGrids, uCtrlRelAdminImob,
  uCMClientDataSet, myChkBox, uModuloImobiliario;

type
  TdtmRelExtrato = class(TFrmCmReport)
    dsExtrato: TwwDataSource;
    pplExtrato: TppBDEPipeline;
    rptExtrato: TppReport;
    ppHeaderBand1: TppHeaderBand;
    lblEmpresa: TppLabel;
    ppLabel148: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText9: TppDBText;
    ppDBText11: TppDBText;
    ppDBText2: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppFooterBand1: TppFooterBand;
    lblSistema: TppLabel;
    ppLine41: TppLine;
    ppCalc27: TppSystemVariable;
    ppCalc28: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    ppDBText1: TppDBText;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine1: TppLine;
    ppLabel7: TppLabel;
    ppLine2: TppLine;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    cdsExtrato: TCMClientDataSet;
    CMsp: TCMSqlParams;
    ppDBText10: TppDBText;
    ppLabel12: TppLabel;
    ppDBText12: TppDBText;
    myDBCheckBox1: TmyDBCheckBox;
    ppLabel13: TppLabel;
    ppDBText13: TppDBText;
    ppLogoExtratoContratual: TppImage;
    procedure FormCreate(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
    CtrlRelAdminImob : TCtrlRelAdminImob;
  public
    { Public declarations }

    // variáveis de impressão
    bLinhaFina, bSeparador, bCorLinha  : boolean;
    CorLinha, CorAtual                 : TColor;
  end;

var
  dtmRelExtrato: TdtmRelExtrato;

implementation

uses uFuncoesImob, uSistema, dBaseDados, cRelExtrato, UComunsImobiliario, uVerificaPreenchimento;
{$R *.DFM}

procedure TdtmRelExtrato.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRelAdminImob := TCtrlRelAdminImob.Create;
  CtrlRelAdminImob.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                            ComunsImobiliario.MensErroMT);
end;


procedure TdtmRelExtrato.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  // Carrega o Logotipo - Marcio Motta - 05/08/2004
  if ModuloImobiliario.AdminImob.bFlgLogoRelat then
     ppLogoExtratoContratual.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
  else
     ppLogoExtratoContratual.Picture := nil;

  cdsExtrato.Data := CtrlRelAdminImob.SelecionaRelExtrato(Sistema.IdModulo,
                                      CmpRptCM.ParamValues[0].AsInteger,   // idcontrato
                                      CmpRptCM.ParamValues[1].AsInteger,   // idcliente
                                      CmpRptCM.ParamValues[6].AsInteger,   // idTipoReceita
                                      CmpRptCM.ParamValues[7].AsInteger,   // idSitCont
                                      CmpRptCM.ParamValues[2].AsInteger,   // flgTipo
                                      CmpRptCM.ParamValues[4].AsDateTime,  // dt inicio
                                      CmpRptCM.ParamValues[5].AsDateTime,  // dt termino
                                      CmpRptCM.ParamValues[3].AsDateTime); // dt corrige
end;

end.
