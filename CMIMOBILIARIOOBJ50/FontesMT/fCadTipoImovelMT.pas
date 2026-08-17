unit fCadTipoImovelMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTImob, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, wwdblook, Mask, wwdbedit, Provider, DBTables, Wwquery,
  dBaseDados, uSistema, uMensErro, uMidasUtil, uCtrlTipoImovel, uCtrlTipoAlterador,
  uComunsImobiliario, uVerificaPreenchimento, Wwdotdot, Wwdbcomb, uCmSqlParams,
  DBCtrls;

type
  TfrmCadTipoImovelMT = class(TfrmCadastroGridMTImob)
    Label1: TLabel;
    DBedtCodigo: TwwDBEdit;
    dbedDescricao: TwwDBEdit;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBcboAltMulta: TwwDBLookupCombo;
    DBcboAltJuros: TwwDBLookupCombo;
    DBcboAltCorrMon: TwwDBLookupCombo;
    gbGrupos: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label6: TLabel;
    Bevel2: TBevel;
    DBcboGrupoEdif: TwwDBLookupCombo;
    DBcboGrupoTerr: TwwDBLookupCombo;
    DBcboGrupoInst: TwwDBLookupCombo;
    DBcboGrupoElet: TwwDBLookupCombo;
    DBcboGrupoVeiculo: TwwDBLookupCombo;
    DBcboGrupoUtilitario: TwwDBLookupCombo;
    DBcboGrupoMaquina: TwwDBLookupCombo;
    DBcboGrupoAr: TwwDBLookupCombo;
    CdsAlteradores: TCMClientDataSet;
    CdsGrupos: TCMClientDataSet;
    CdsCODTIPIMOVEL: TStringField;
    CdsDESCTIPOIMOVEL: TStringField;
    CdsCODALTMULTA: TFloatField;
    CdsCODALTJUROS: TFloatField;
    CdsCODALTCORRMON: TFloatField;
    CdsIDGRUPOTERRENO: TFloatField;
    CdsIDGRUPOEDIFICACAO: TFloatField;
    CdsIDGRUPOINST: TFloatField;
    CdsIDGRUPOELET: TFloatField;
    CdsIDGRUPOAR: TFloatField;
    CdsIDGRUPOVEICULO: TFloatField;
    CdsIDGRUPOUTILITARIO: TFloatField;
    CdsIDGRUPOMAQUINA: TFloatField;
    CdsIDGRUPOMOVEL: TFloatField;
    CdsAlteradoresCODALTERADOR: TFloatField;
    CdsAlteradoresRECPAG: TStringField;
    CdsAlteradoresACRESDECRES: TStringField;
    CdsAlteradoresIDPESSOA: TFloatField;
    CdsAlteradoresDESCRICAO: TStringField;
    DataSetProvider1: TDataSetProvider;
    wwQuery1: TwwQuery;
    CdsCODALTMTAL: TFloatField;
    CdsCODALTJRAL: TFloatField;
    CdsCODALTCMAL: TFloatField;
    gbDaiea: TGroupBox;
    Label10: TLabel;
    Label15: TLabel;
    CdsCODIMOVELSPC: TFloatField;
    dbcbTipoSpc: TwwDBComboBox;
    wwDBCodDaiea: TwwDBLookupCombo;
    cdsDaiea: TCMClientDataSet;
    CdsIDCARTEIRASPC: TFloatField;
    sqlDaiea: TCMSqlParams;
    cdsDaieaIDCARTEIRASPC: TFloatField;
    cdsDaieaDESCARTEIRASPC: TStringField;
    CMSqlParams1: TCMSqlParams;
    Label16: TLabel;
    GroupBox2: TGroupBox;
    dbcbSitImovel: TwwDBComboBox;
    CdsFLGTIPOINTERNO: TStringField;
    sqlGrupo: TCMSqlParams;
    pnlConfissao: TPanel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    Label2: TLabel;
    chkContabiliza: TDBCheckBox;
    CdsCODALTCONFISSAO: TFloatField;
    CdsFLGCTBCONFISSAO: TFloatField;
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);

  protected
    procedure FazerRefresh; override;

  private
    { Private declarations }
    CtrlTipoImovel: tCtrlTipoImovel;
    CtrlTipoAlterador: TCtrlTipoalterador;

  public
    { Public declarations }
  end;

var
  frmCadTipoImovelMT: TfrmCadTipoImovelMT;

implementation

{$R *.DFM}

{ TfrmCadTipoImovelMT }

procedure TfrmCadTipoImovelMT.FazerRefresh;
begin
  inherited;
  Cds.Data := CtrlTipoImovel.LookupTipoImovel;
end;

procedure TfrmCadTipoImovelMT.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := CtrlTipoImovel.GravaTipoImovel;
end;

procedure TfrmCadTipoImovelMT.FormCreate(Sender: TObject);
begin
  CtrlTipoImovel := tCtrlTipoImovel.Create;
  CtrlTipoImovel.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                            ComunsImobiliario.MensErroMT);
  CtrlTipoImovel.CdsTipoImovel := Cds;

  CtrlTipoAlterador := TCtrlTipoalterador.Create;
  CtrlTipoAlterador.InitializeAs(CtrlTipoImovel);
  CdsAlteradores.Data := CtrlTipoAlterador.ListTipoalterador (Sistema.IdEmpresa, 'R');

  sqlGrupo.Prepare;
  sqlGrupo.ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
  sqlGrupo.Open;

  sqlDaiea.Open;

  FazerRefresh ;

  pnlConfissao.Visible := (Sistema.IdModulo = 64);

  // Altera DataFields para os Alteradores de ALIENAÇÃO
  if Sistema.IdModulo = 135 then begin
     DBcboAltMulta.DataField   := 'CODALTMTAL';
     DBcboAltJuros.DataField   := 'CODALTJRAL';
     DBcboAltCorrMon.DataField := 'CODALTCMAL';
     gbGrupos.Visible          := False;
     gbDaiea.Visible           := False;
  end else begin
     DBcboAltMulta.DataField   := 'CODALTMULTA';
     DBcboAltJuros.DataField   := 'CODALTJUROS';
     DBcboAltCorrMon.DataField := 'CODALTCORRMON';
     gbGrupos.Visible          := True;
     gbDaiea.Visible           := True;
  end;
  inherited;
end;

procedure TfrmCadTipoImovelMT.CmeCadastroEdit(Sender: TObject);
begin
  Cds.Data := CtrlTipoImovel.LookupTipoImovel(CdsCODTIPIMOVEL.AsString);
  inherited;
end;

procedure TfrmCadTipoImovelMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlTipoImovel);
  inherited;
end;

procedure TfrmCadTipoImovelMT.FormShow(Sender: TObject);
begin
  inherited;
  // Desabilita DAIEA para RioPrevidencia
  if Sistema.TipoCliente = 20061 then begin
     gbDaiea.Visible := False;
  end;
end;

end.
