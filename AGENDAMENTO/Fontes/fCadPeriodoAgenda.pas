unit fCadPeriodoAgenda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, uCtrlPeriodoAgenda,
  uCtrlGrupoAtende, uSistema, dBaseDados, wwdblook, wwdbdatetimepicker,
  Mask, DBCtrls, uCmTypes, fReplicarPeriodo;

type
  TfrmCadPeriodoAgenda = class(TFrmCadastroMestreDetMT)
    cdsDet: TCMClientDataSet;
    CdsIDPERIODOAGENDA: TFloatField;
    CdsIDGRUPOATENDE: TFloatField;
    CdsDATAINICIO: TDateTimeField;
    CdsDATAFIM: TDateTimeField;
    cdsGrupoAtendentes: TClientDataSet;
    cdsGrupoAtendentesIDGRUPOATENDE: TFloatField;
    cdsGrupoAtendentesDESCRICAO: TStringField;
    cdsGrupoAtendentesOBSERVACAO: TMemoField;
    Label1: TLabel;
    cmbGrupoAtendentes: TwwDBLookupCombo;
    dbdtDtInicial: TwwDBDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    dbdtDtFinal: TwwDBDateTimePicker;
    cdsDetIDHORARIOATENDE: TFloatField;
    cdsDetIDPERIODOAGENDA: TFloatField;
    cdsDetHORARIO: TStringField;
    Label4: TLabel;
    dtpkrHorario: TwwDBDateTimePicker;
    btnReplicar: TToolbarButton97;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure cdsDetBeforePost(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CdsAfterDelete(DataSet: TDataSet);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure btnReplicarClick(Sender: TObject);
  private
    CtrlPeriodoAgenda : TCtrlPeriodoAgenda;
    CtrlGrupoAtende   : TCtrlGrupoAtende;

    iIDPERIODOAGENDA : integer;

    procedure MsgErro(sMsg: String);
  public
    { Public declarations }
  end;

var
  frmCadPeriodoAgenda: TfrmCadPeriodoAgenda;

implementation

{$R *.DFM}

procedure TfrmCadPeriodoAgenda.MsgErro(sMsg: String);
begin
  ShowMessage( sMsg );
end;

procedure TfrmCadPeriodoAgenda.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPeriodoAgenda := TCtrlPeriodoAgenda.Create;
  CtrlPeriodoAgenda.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );
  CtrlPeriodoAgenda.CdsPeriodoAgenda := Cds;
  CtrlPeriodoAgenda.CdsHorarioAgenda := CdsDet;

  CtrlGrupoAtende := TCtrlGrupoAtende.Create;
  CtrlGrupoAtende.InitializeAs( CtrlPeriodoAgenda );

  Cds.CreateDataset;

  cdsGrupoAtendentes.Data := CtrlGrupoAtende.LookupGrupoAtende;

  iIDPERIODOAGENDA := 0;
end;

procedure TfrmCadPeriodoAgenda.FormDestroy(Sender: TObject);
begin
  CtrlPeriodoAgenda.Free;
  CtrlGrupoAtende.Free;
  inherited;             
end;

procedure TfrmCadPeriodoAgenda.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := CtrlPeriodoAgenda.ApagaPeriodoAgenda( iIDPERIODOAGENDA );
end;

procedure TfrmCadPeriodoAgenda.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := CtrlPeriodoAgenda.GravaPeriodoAgenda;
end;

procedure TfrmCadPeriodoAgenda.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := CtrlPeriodoAgenda.GravaPeriodoAgenda;
end;

procedure TfrmCadPeriodoAgenda.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
  begin
    cds.Data    := CtrlPeriodoAgenda.SelecionaPeriodoAgenda( StrToInt( MontaSelect.ValoresChave[0] ) );
    cdsDet.Data := CtrlPeriodoAgenda.SelecionaHorarioAgenda( StrToInt( MontaSelect.ValoresChave[0] ) );
    iIDPERIODOAGENDA := StrToInt( MontaSelect.ValoresChave[0] );
  end;
end;

procedure TfrmCadPeriodoAgenda.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  Cds.Close;
  Cds.CreateDataSet;
  CdsDet.Close;
  iIDPERIODOAGENDA := 0;
end;

procedure TfrmCadPeriodoAgenda.CmeCadastroInsert(Sender: TObject);
begin
  Cds.Close;
  Cds.CreateDataSet;
  cdsDet.Close;
  cdsDet.CreateDataSet;
  iIDPERIODOAGENDA := 0;
  inherited;
end;

procedure TfrmCadPeriodoAgenda.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

  Accept := False;

  if dbdtDtInicial.Date > dbdtDtFinal.Date then
  begin
    ShowMessage( 'A data final deve ser igual ou posterior à data inicial.');
    dbdtDtFinal.SetFocus;
    exit;
  end;

  if CtrlPeriodoAgenda.ExisteConflito( CdsIDPERIODOAGENDA.AsInteger,
                                       CdsIDGRUPOATENDE.AsInteger,
                                       CdsDATAINICIO.AsDateTime,
                                       CdsDATAFIM.AsDateTime ) then
  begin
    ShowMessage( 'Este período está em conflito com outro já cadastrado para este grupo.');
    dbdtDtInicial.SetFocus;
    exit;
  end;

  Accept := True;

end;

procedure TfrmCadPeriodoAgenda.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  dtpkrHorario.ClearDateTime;
  if dtpkrHorario.CanFocus then
    dtpkrHorario.SetFocus;
end;

procedure TfrmCadPeriodoAgenda.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  dtpkrHorario.ClearDateTime;
  dtpkrHorario.Time := EncodeTime( StrToInt( Copy( cdsDetHORARIO.AsString, 1, 2 ) ),
   StrToInt( Copy( cdsDetHORARIO.AsString, 3, 2 ) ), 0, 0 );
end;

procedure TfrmCadPeriodoAgenda.cdsDetBeforePost(DataSet: TDataSet);
begin
  inherited;
  if tb97Detalhe.Visible then
  begin
    pnlControlesDet.SetFocus;
    if trim( StringReplace( dtpkrHorario.Text, ':', '', [] ) ) = '' then
    begin
      ShowMessage( 'Preencha o horário.');
      dtpkrHorario.SetFocus;
      Abort;
    end;
    cdsDetHORARIO.AsString := StringReplace( dtpkrHorario.Text, ':', '', [] );
    dtpkrHorario.ClearDateTime;
  end;
end;

procedure TfrmCadPeriodoAgenda.bbtnConfirmarClick(Sender: TObject);
begin
  if tb97Detalhe.Visible then
    exit;

  inherited;
end;

procedure TfrmCadPeriodoAgenda.CdsAfterDelete(DataSet: TDataSet);
begin
  inherited;
  cdsDet.Close;
end;

procedure TfrmCadPeriodoAgenda.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  btnReplicar.Enabled := ( not ( CmeCadastro.Operacao in [opInserir,opAlterar] ) )
                         and ( not cds.IsEmpty )
                         and ( cds.State = dsBrowse );
end;

procedure TfrmCadPeriodoAgenda.btnReplicarClick(Sender: TObject);
begin
  inherited;

  if cdsDet.IsEmpty then
  begin
    ShowMessage('Não há horários a serem replicados.');
    exit;
  end;

  frmReplicarPeriodo := TfrmReplicarPeriodo.Create( Self );
  try
    cdsDet.DisableControls;
    cdsDet.First;
    frmReplicarPeriodo.cdsDet.CreateDataSet;
    while not cdsDet.Eof do
    begin
      frmReplicarPeriodo.cdsDet.Append;
      frmReplicarPeriodo.cdsDetIDHORARIOATENDE.AsInteger := 0;
      frmReplicarPeriodo.cdsDetIDPERIODOAGENDA.AsInteger := 0;
      frmReplicarPeriodo.cdsDetHORARIO.AsString := cdsDetHORARIO.AsString;
      frmReplicarPeriodo.cdsDet.Post;
      cdsDet.Next;
    end;
    cdsDet.First;
    frmReplicarPeriodo.ShowModal;
  finally
    frmReplicarPeriodo.Free;
    cdsDet.EnableControls;
  end;
end;

end.
