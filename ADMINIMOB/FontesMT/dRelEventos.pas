unit dRelEventos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCMReportMTImob, Db, uCmSqlParams, DBClient, uCmRptManager, TXComp,
  CmParamReport, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppDB,
  ppBands, ppCache, ppDBPipe, ppPrnabl, ppCtrls, uCtrlRelAdminImob, ppVar,
  ppStrtch, ppMemo, ppRichTx;

type
  TdtmRelEventos = class(TFrmCmReportImob)
    rptEventos: TppReport;
    cdsCONTRATO: TStringField;
    cdsLOCATARIO: TStringField;
    cdsFLGTIPOEVENTO: TStringField;
    cdsEVIDATA: TDateTimeField;
    cdsEVIDESCRICAO: TMemoField;
    cdsMOESIGLA: TStringField;
    cdsFATOR: TFloatField;
    cdsVALOR_ANTERIOR: TFloatField;
    cdsVALOR_ATUAL: TFloatField;
    ppdpEventos: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetail: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLogo: TppImage;
    lblEmpresa: TppLabel;
    ppLabel148: TppLabel;
    ppLine3: TppLine;
    lblSistema: TppLabel;
    ppCalc27: TppSystemVariable;
    ppCalc28: TppSystemVariable;
    ppDBText5: TppDBText;
    cdsTIPOEVENTO: TStringField;
    ppDBText6: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel8: TppLabel;
    ppLine1: TppLine;
    ppLabel3: TppLabel;
    ppDBText4: TppDBText;
    ppLabel4: TppLabel;
    ppDBText1: TppDBText;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel7: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppSeparador: TppShape;
    ppShape1: TppShape;
    ppDBRichText: TppDBRichText;
    ppLine2: TppLine;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    CtrlRelAdminImob : TCtrlRelAdminImob;
  public
    { Public declarations }
  end;

var
  dtmRelEventos: TdtmRelEventos;

implementation

uses
  dBaseDados, uSistema, uComunsImobiliario, uModuloImobiliario;

{$R *.DFM}

procedure TdtmRelEventos.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;

  if ModuloImobiliario.AdminImob.bFlgLogoRelat then
    ppLogo.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
  else
    ppLogo.Picture := nil;

  cds.Data := CtrlRelAdminImob.SelecionaRelEventos( CmpRptCM.ParamValues[0].AsInteger,
                                                    CmpRptCM.ParamValues[1].AsDateTime,
                                                    CmpRptCM.ParamValues[2].AsDateTime,
                                                    CmpRptCM.ParamValues[3].AsString );
end;

procedure TdtmRelEventos.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRelAdminImob := TCtrlRelAdminImob.Create;
  CtrlRelAdminImob.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                              Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                              ComunsImobiliario.MensErroMT);
end;

procedure TdtmRelEventos.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(CtrlRelAdminImob);
end;

end.
