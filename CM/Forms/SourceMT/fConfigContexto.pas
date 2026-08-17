unit fConfigContexto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBClient, uCMClientDataSet,
  uCtrlMsgContexto, uSistema, uCmTypes, dBaseDados, uMensErro,
  uCtrlEmailConexao, DBCtrls, Grids, Wwdbigrd, Wwdbgrid, uCtrlMsgContextoUsu,
  MontaSelect, Mask;

type
  TfrmConfigContexto = class(TfrmOkCancelar)
    grpAviso: TGroupBox;
    lblAviso: TLabel;
    lblContexto: TLabel;
    cdsContexto: TCMClientDataSet;
    dblkpContexto: TwwDBLookupCombo;
    cds: TCMClientDataSet;
    dts: TDataSource;
    cdsEmailConexao: TCMClientDataSet;
    pnlDados: TPanel;
    lblEmailConexao: TLabel;
    dblkpConexaEmail: TwwDBLookupCombo;
    dbrdgrpFlgTipoEnvio: TDBRadioGroup;
    lblMensagemPreDef: TLabel;
    edtMsgPreDef: TEdit;
    pnlOutrosDestinatarios: TPanel;
    btnIncluiDest: TSpeedButton;
    btnExcluiDest: TSpeedButton;
    dbgrdDestinatarios: TwwDBGrid;
    lblDestinatarios: TLabel;
    dtsDestinatarios: TDataSource;
    cdsDestinatarios: TCMClientDataSet;
    msDestinatarios: TMontaSelect;
    lblAssuntoMsg: TLabel;
    dbedtAssuntoMsg: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dblkpContextoChange(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnIncluiDestClick(Sender: TObject);
    procedure btnExcluiDestClick(Sender: TObject);
  private
    CtrlMsgContexto    : TCtrlMsgContexto;
    CtrlEmailConexao   : TCtrlEmailConexao;
    CtrlMsgContextoUsu : TCtrlMsgContextoUsu;
  public
    procedure MsgErro( sMsg : string );
    procedure Carrega;
  end;

var
  frmConfigContexto: TfrmConfigContexto;

implementation

{$R *.DFM}

procedure TfrmConfigContexto.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlMsgContexto := TCtrlMsgContexto.Create;
  CtrlMsgContexto.Initialize( DtmBaseDados.dbBaseDados, True,
   Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );
  CtrlMsgContexto.CdsMsgContexto := cds;

  CtrlEmailConexao := TCtrlEmailConexao.Create;
  CtrlEmailConexao.InitializeAs( CtrlMsgContexto );
  cdsEmailConexao.Data := CtrlEmailConexao.ListaConexoes;

  CtrlMsgContextoUsu := TCtrlMsgContextoUsu.Create;
  CtrlMsgContextoUsu.InitializeAs( CtrlMsgContexto );
  CtrlMsgContextoUsu.CdsMsgContextoUsu := cdsDestinatarios;

  cdsContexto.Data := CtrlMsgContexto.ListaContextosSemConfigPropria( Sistema.IdModulo );
end;

procedure TfrmConfigContexto.FormDestroy(Sender: TObject);
begin
  inherited;
  CtrlMsgContexto.Free;
  CtrlEmailConexao.Free;
  CtrlMsgContextoUsu.Free;
end;

procedure TfrmConfigContexto.MsgErro(sMsg: string);
begin
  MsgDlg( sMsg, 'Erro', mtError, [mbOk], 0 );
end;

procedure TfrmConfigContexto.dblkpContextoChange(Sender: TObject);
begin
  inherited;
  if cds.Active then
    if cds.Modified then
      if MessageDlg('Há alterações ainda não salvas. Deseja salvá-las?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        cds.Post;
        CtrlMsgContexto.GravaMsgContexto;
      end;

  Carrega;

  pnlDados.Enabled := True;
  bbtnConfirmar.Enabled := True;
  bbtnCancelar.Enabled := True;
end;

procedure TfrmConfigContexto.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  cds.CancelUpdates;
  Carrega;
end;

procedure TfrmConfigContexto.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  cds.Post;
  CtrlMsgContexto.GravaMsgContexto;
  CtrlMsgContextoUsu.GravaMsgContextoUsu;
  Carrega;
end;

procedure TfrmConfigContexto.Carrega;
begin
  cds.Data := CtrlMsgContexto.SelecionaMsgContexto( StrToIntDef( dblkpContexto.LookupValue, -1 ) );
  edtMsgPreDef.Text := CtrlMsgContexto.RecuperaMsgPreDefPeloContexto( cds.FieldByName('IDMSGCONTEXTO').AsInteger );

  cdsDestinatarios.Data := CtrlMsgContextoUsu.RecuperaDestContexto( cds.FieldByName('IDMSGCONTEXTO').AsInteger );

  cds.Edit;
end;

procedure TfrmConfigContexto.btnIncluiDestClick(Sender: TObject);
begin
  inherited;
  msDestinatarios.Executar;
  if msDestinatarios.RetornouValor then
  begin
    cdsDestinatarios.Append;
    cdsDestinatarios.FieldByName('IDMSGCONTEXTO').AsInteger := cds.FieldByName('IDMSGCONTEXTO').AsInteger;
    cdsDestinatarios.FieldByName('IDPESSOA').AsString       := msDestinatarios.ValoresChave[0];
    cdsDestinatarios.FieldByName('NOME').AsString           := msDestinatarios.ValoresChave[1];
    cdsDestinatarios.FieldByName('EMAIL').AsString          := msDestinatarios.ValoresChave[2];
    cdsDestinatarios.Post;
  end;
end;

procedure TfrmConfigContexto.btnExcluiDestClick(Sender: TObject);
begin
  inherited;
  if cdsDestinatarios.Active then
    if cdsDestinatarios.RecordCount > 0 then
      cdsDestinatarios.Delete;
end;

end.
