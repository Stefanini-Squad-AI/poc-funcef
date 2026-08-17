unit fParamCotasPatrim;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, uCtrlParamCotasPatrim, Db, DBClient,
  uCMClientDataSet, uCtrlPadroes, wwdblook, uSistema, uMensErro,
  uCtrlRoteiros, DBCtrls, ComCtrls, Mask;

type
  TfrmParamCotasPatrim = class(TfrmOkCancelar)
    cds: TCMClientDataSet;
    cdsGrupoRegra: TCMClientDataSet;
    dts: TDataSource;
    cdsTipoRoteiro: TCMClientDataSet;
    PageControl: TPageControl;
    tabGeral: TTabSheet;
    tabNomesParaRegra: TTabSheet;
    lblGrupoRegra: TLabel;
    lblRoteiroSaldoAplicado: TLabel;
    dblkpGrupoRegra: TwwDBLookupCombo;
    dblkpRoteiroSaldoAplicado: TwwDBLookupCombo;
    dbCotaDiaUtil: TDBCheckBox;
    lblSLDAPLICADO: TLabel;
    dbedtSLDAPLICADO: TDBEdit;
    dbedtSLDATIVOANT: TDBEdit;
    lblSLDATIVOANT: TLabel;
    lblSAIDAINVEST: TLabel;
    dbedtSAIDAINVEST: TDBEdit;
    lblENTRINVEST: TLabel;
    dbedtENTRINVEST: TDBEdit;
    lblSALDOANTCTA: TLabel;
    dbedtSALDOANTCTA: TDBEdit;
    dbedtSALDOATUCTA: TDBEdit;
    lblSALDOATUCTA: TLabel;
    dbedtENTRRENT: TDBEdit;
    lblENTRRENT: TLabel;
    lblSAIDARENT: TLabel;
    dbedtSAIDARENT: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    CtrlParamCotasPatrim : TCtrlParamCotasPatrim;
    CtrlRoteiro          : TCtrlRoteiro;
  public
    procedure Inicializa;
  end;

var
  frmParamCotasPatrim: TfrmParamCotasPatrim;

implementation

{$R *.DFM}

procedure TfrmParamCotasPatrim.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlParamCotasPatrim := TCtrlParamCotasPatrim.Create;
  CtrlParamCotasPatrim.InitializeAs( Padroes );
  CtrlParamCotasPatrim.cds := cds;

  cdsGrupoRegra.Data := CtrlParamCotasPatrim.GruposRegra;

  CtrlRoteiro := TCtrlRoteiro.Create;
  CtrlRoteiro.InitializeAs( Padroes );
  cdsTipoRoteiro.Data := CtrlRoteiro.LookupRoteiros;

  PageControl.ActivePage := tabGeral;

  Inicializa;
end;

procedure TfrmParamCotasPatrim.FormDestroy(Sender: TObject);
begin
  CtrlParamCotasPatrim.Free;
  inherited;
end;

procedure TfrmParamCotasPatrim.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  cds.Post;
  if CtrlParamCotasPatrim.GravaParam then
  begin
    MsgDlg('Configuração salva com sucesso.', 'Atenção', mtInformation, [mbOk], 0);
    Inicializa;
  end;
end;

procedure TfrmParamCotasPatrim.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  cds.CancelUpdates;
  Inicializa;
end;

procedure TfrmParamCotasPatrim.Inicializa;
begin
  cds.Data := CtrlParamCotasPatrim.CarregaParamSistema( Sistema.IdEmpresa );
  if cds.IsEmpty then
  begin
    cds.Insert;
    cds.FieldByName('IDEMPRESA').AsInteger     := Sistema.IdEmpresa;
    cds.FieldByName('FLGCOTADIAUTIL').AsString := 'S';
  end                                                                            
  else
    cds.Edit;
end;

end.
