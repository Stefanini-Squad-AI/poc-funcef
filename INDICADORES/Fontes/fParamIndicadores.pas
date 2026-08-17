{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Padrão      : 5.10.18 em diante...
Pendência   : 27596
Responsável : Daniel Simões
Data        : 17/03/2008
Descrição   : Ajuste do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fParamIndicadores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCadastroMtImob, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  uSistema, Provider, DBTables, Wwquery, wwdblook, dBaseDados, uMidasUtil,
  uComunsImobiliario, uVerificaPreenchimento, ComCtrls, uModuloIndicadores,
  uCtrlMoeda, uCtrlGrpRegra, uCtrlParamIndicadores, uCmSqlParams, DBCtrls;


type
  TfrmParamIndicadores = class(TfrmCadastroMtImob)
    CdsIDPESSOA: TFloatField;
    CdsMOECODIGOUPV: TFloatField;
    cdsMoeda: TCMClientDataSet;
    cdsMoedaMOECODIGO: TFloatField;
    cdsMoedaMOEDESC: TStringField;
    cdsMoedaMOESIGLA: TStringField;
    cdsMoedaFLGPERCVALOR: TStringField;
    Label4: TLabel;
    Label7: TLabel;
    Label3: TLabel;
    dblcUpv: TwwDBLookupCombo;
    cdsGrpRegra: TCMClientDataSet;
    Label1: TLabel;
    dblcGrpRegra: TwwDBLookupCombo;
    cdsGrpRegraIDGRUPOREGRA: TFloatField;
    cdsGrpRegraDESCRICAO: TStringField;
    CdsIDGRUPOREGRA: TFloatField;
    dbCkbLogotipo: TDBCheckBox;
    CMSqlParams1: TCMSqlParams;
    CdsFLGLOGORELAT: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);

  private
    { Private declarations }
    CtrlParamIndicadores: TCtrlParamIndicadores;
    CtrlMoeda    : TCtrlMoeda;
    CtrlGrpRegra : TCtrlGrpRegra;

  public
    { Public declarations }
  end;

var
  frmParamIndicadores: TfrmParamIndicadores;

implementation

{$R *.DFM}

{ TfrmParamIndicadores }


procedure TfrmParamIndicadores.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlParamIndicadores := TCtrlParamIndicadores.Create;
  CtrlParamIndicadores.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                            ComunsImobiliario.MensErroMT);
  CtrlParamIndicadores.CdsParamIndicadores := Cds;

  CtrlMoeda := TCtrlMoeda.Create;
  CtrlMoeda.InitializeAs(CtrlParamIndicadores);
  CtrlGrpRegra := TCtrlGrpRegra.Create;
  CtrlGrpRegra.InitializeAs(CtrlParamIndicadores);

  cdsMoeda.Data    := CtrlMoeda.ListaMoeda(0, False, True, 'V');
  cdsGrpRegra.Data := CtrlGrpRegra.ListaGrpRegra;

end;

procedure TfrmParamIndicadores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlParamIndicadores);
  FreeAndNil(CtrlMoeda);
end;

procedure TfrmParamIndicadores.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlParamIndicadores.GravaParamIndicadores;
end;

procedure TfrmParamIndicadores.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  Cds.Data := CtrlParamIndicadores.SelecionaParamIndicadores(Sistema.IdEmpresa);
end;

procedure TfrmParamIndicadores.FormShow(Sender: TObject);
begin
  inherited;
  Cds.Data := CtrlParamIndicadores.SelecionaParamIndicadores(Sistema.IdEmpresa);
  // primeira vez que entrar na tela
  if Cds.IsEmpty then begin
    Cds.Insert;
    CdsIDPESSOA.AsInteger := Sistema.IdEmpresa;
    Cds.Post;
    if CtrlParamIndicadores.GravaParamIndicadores then
      Cds.Data := CtrlParamIndicadores.SelecionaParamIndicadores(Sistema.IdEmpresa);
  end;
  sbtnAlterar.Enabled := True;
end;

procedure TfrmParamIndicadores.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  ModuloIndicadores.GetParam(Sistema.IdEmpresa);
end;

end.
