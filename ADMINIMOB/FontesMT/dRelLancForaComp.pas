unit dRelLancForaComp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCMReportMTImob, Db, uCmSqlParams, DBClient, uCmRptManager, TXComp,
  CmParamReport, ppBands, ppClass, ppCtrls, ppStrtch, ppRegion, ppVar,
  ppPrnabl, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe,
  ppDBBDE, uCtrlRelAdminImob, uModuloImobiliario;

type
  TdtmRelLancForaComp = class(TFrmCmReportImob)
    pplLancForaComp: TppBDEPipeline;
    rptLancForaComp: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    lblEmpresa: TppLabel;
    ppLabel148: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppLabel1: TppLabel;
    lblSistema: TppLabel;
    ppCalc27: TppSystemVariable;
    ppCalc28: TppSystemVariable;
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    ppLabel5: TppLabel;
    ppDBText5: TppDBText;
    ppLabel6: TppLabel;
    ppDBText6: TppDBText;
    ppLabel7: TppLabel;
    ppDBText7: TppDBText;
    ppLabel8: TppLabel;
    ppDBText8: TppDBText;
    ppLabel9: TppLabel;
    ppDBText9: TppDBText;
    ppLabel10: TppLabel;
    ppDBText10: TppDBText;
    ppLabel11: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLabel12: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppsCor: TppShape;
    pplSeparador: TppLine;
    ppLogoLancForaComp: TppImage;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure pplSeparadorPrint(Sender: TObject);
    procedure ppsCorPrint(Sender: TObject);

  private
    CtrlRelAdminImob : TCtrlRelAdminImob;

    bSeparador, bCorLinha : boolean;
    CorLinha, CorAtual    : TColor;

  public
    { Public declarations }

  end;

var
  dtmRelLancForaComp: TdtmRelLancForaComp;

implementation

uses
  dBaseDados, uSistema, uComunsImobiliario;

{$R *.DFM}

procedure TdtmRelLancForaComp.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRelAdminImob := TCtrlRelAdminImob.Create;
  CtrlRelAdminImob.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                              Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                              ComunsImobiliario.MensErroMT);
end;

procedure TdtmRelLancForaComp.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(CtrlRelAdminImob);
end;

procedure TdtmRelLancForaComp.CrmRptCMBeforePrint(Sender: TObject);
var
  DataIniLib, DataFimLib, DataIniLanc, DataFimLanc : TDateTime;
  iIdUsuario, iIdFavorecido, iIdTipoRecDesp, iPosCor : Integer;
begin
  inherited;

  // Carrega o Logotipo - Marcio Motta - 05/08/2004
  if ModuloImobiliario.AdminImob.bFlgLogoRelat then
     ppLogoLancForaComp.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
  else
     ppLogoLancForaComp.Picture := nil;

  // Carrega as variáveis com os parâmetros do relatório
  DataIniLib     := CmpRptCM.ParamValues[0].AsDateTime;
  DataFimLib     := CmpRptCM.ParamValues[1].AsDateTime;
  DataIniLanc    := CmpRptCM.ParamValues[2].AsDateTime;
  DataFimLanc    := CmpRptCM.ParamValues[3].AsDateTime;
  iIdFavorecido  := CmpRptCM.ParamValues[4].AsInteger;
  iIdTipoRecDesp := CmpRptCM.ParamValues[5].AsInteger;
  iIdUsuario     := CmpRptCM.ParamValues[6].AsInteger;

  // Carrega variáveis com os parametros de cores de linha e separadores
  bSeparador := CmpRptCM.ParamValues[7].AsBoolean;
  bCorLinha  := CmpRptCM.ParamValues[8].AsBoolean;
  iPosCor    := CmpRptCM.ParamValues[9].AsInteger;

  ComunsImobiliario.BuscaCorLinha(iPosCor, CorLinha);

  // Carrega o CDS com os dados
  cds.Data := CtrlRelAdminImob.SelecionaRelLancForaComp(iIdUsuario, iIdFavorecido, iIdTipoRecDesp,
                                                DataIniLib, DataFimLib, DataIniLanc, DataFimLanc);

end;

procedure TdtmRelLancForaComp.pplSeparadorPrint(Sender: TObject);
begin
  inherited;
  (Sender as TppLine).Visible := bSeparador;
end;

procedure TdtmRelLancForaComp.ppsCorPrint(Sender: TObject);
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

end.
