{
 FLGSITUACAO: 1 - 'Agendado', 2 - 'Efetivado', 3 - 'Cancelado'
}

unit fCadAgendamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, wwdblook,
  DBTables, uSistema, dBaseDados, uCtrlAgendamento, Mask, DBCtrls,
  wwdbdatetimepicker, uCtrlAssuntoAgenda, uCtrlAtendeAgenda, fCalendarioAgenda,
  uCmTypes, uCmFileUtils;

type
  TfrmCadAgendamento = class(TFrmCadastroMT)
    CdsIDAGENDAMENTO: TFloatField;
    CdsIDATENDEAGENDA: TFloatField;
    CdsIDATEND: TFloatField;
    CdsIDASSUNTOAGENDA: TFloatField;
    CdsIDPESSOA: TFloatField;
    CdsDATA: TDateTimeField;
    CdsHORA: TStringField;
    CdsTELEFONE: TStringField;
    CdsFLGSITUACAO: TFloatField;
    CdsNOMESOLIC: TStringField;
    msSolicitante: TMontaSelect;
    grpSolicitante: TGroupBox;
    edtMatricula: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtInscricao: TEdit;
    cbElegivel: TCheckBox;
    Label3: TLabel;
    edtNome: TEdit;
    btnElegivel: TSpeedButton;
    edtPlano: TEdit;
    Label4: TLabel;
    cdsSolicitanteEleg: TClientDataSet;
    Label5: TLabel;
    edtPatrocinadora: TEdit;
    Label6: TLabel;
    dbedtIdAtend: TDBEdit;
    Label8: TLabel;
    CdsOBSERVACAO: TBlobField;
    GroupBox1: TGroupBox;
    Label11: TLabel;
    dbedtTelefone: TDBEdit;
    Label13: TLabel;
    dbmemObservacao: TDBMemo;
    cmbAssunto: TwwDBLookupCombo;
    CdsDATAALTERACAO: TDateTimeField;
    Label12: TLabel;
    dbedtDataAlteracao: TDBEdit;
    Label14: TLabel;
    edtSituacao: TEdit;
    btnAgenda: TSpeedButton;
    cdsAssunto: TClientDataSet;
    cdsAssuntoIDASSUNTOAGENDA: TFloatField;
    cdsAssuntoDESCRICAO: TStringField;
    cdsAssuntoOBSERVACAO: TMemoField;
    cdsAtendeAgenda: TCMClientDataSet;
    cdsAtendeAgendaNOME: TStringField;
    cdsAtendeAgendaNOMEUSUARIO: TStringField;
    cdsAtendeAgendaIDATENDEAGENDA: TFloatField;
    pnlAgendamento: TPanel;
    Label7: TLabel;
    cmbAtendente: TwwDBLookupCombo;
    Label9: TLabel;
    dtData: TwwDBDateTimePicker;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    btnCancelar: TToolbarButton97;
    btnEfetivar: TToolbarButton97;
    ToolbarSep972: TToolbarSep97;
    procedure btnElegivelClick(Sender: TObject);
    procedure cbElegivelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CdsBeforeInsert(DataSet: TDataSet);
    procedure CdsAfterInsert(DataSet: TDataSet);
    procedure btnAgendaClick(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure btnEfetivarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    CtrlAgendamento : TCtrlAgendamento;
    CtrlAssuntoAgenda : TCtrlAssuntoAgenda;
    CtrlAtendeAgenda : TCtrlAtendeAgenda;

    procedure MsgErro(sMsg: String);
    procedure Reset;
  public
    iIdPessoa : integer;
    iId : integer;

    procedure PreparaSolicitante;
    procedure DadosSolicitanteEleg( _iIdPessoa : integer );
    procedure PreencheSituacao;
  end;

var
  frmCadAgendamento: TfrmCadAgendamento;

implementation

{$R *.DFM}

procedure TfrmCadAgendamento.btnElegivelClick(Sender: TObject);
begin
  inherited;
  msSolicitante.Executar;
  if msSolicitante.RetornouValor then
    DadosSolicitanteEleg( StrToInt( msSolicitante.ValoresChave[0] ) );
end;

procedure TfrmCadAgendamento.cbElegivelClick(Sender: TObject);
begin
  inherited;
  PreparaSolicitante;
end;

procedure TfrmCadAgendamento.PreparaSolicitante;
begin
  edtMatricula.Clear;
  edtPatrocinadora.Clear;
  edtInscricao.Clear;
  edtPlano.Clear;
  edtNome.Clear;
  btnElegivel.Enabled := cbElegivel.Checked;
  edtNome.ReadOnly    := cbElegivel.Checked;
  if cbElegivel.Checked then
    edtNome.Color := clBtnFace
  else
    edtNome.Color := clWhite;
  iIdPessoa := 0;
end;

procedure TfrmCadAgendamento.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlAgendamento := TCtrlAgendamento.Create;
  CtrlAgendamento.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );
  CtrlAgendamento.CdsAgendamento := Cds;
  Cds.CreateDataset;

  CtrlAssuntoAgenda := TCtrlAssuntoAgenda.Create;
  CtrlAssuntoAgenda.InitializeAs( CtrlAgendamento );
  cdsAssunto.Data := CtrlAssuntoAgenda.LookupAssunto;

  CtrlAtendeAgenda := TCtrlAtendeAgenda.Create;
  CtrlAtendeAgenda.InitializeAs( CtrlAgendamento );
  cdsAtendeAgenda.Data := CtrlAtendeAgenda.LookupAtendentes;

  Reset;
end;

procedure TfrmCadAgendamento.MsgErro(sMsg: String);
begin
  ShowMessage( sMsg );
end;

procedure TfrmCadAgendamento.FormDestroy(Sender: TObject);
begin
  CtrlAgendamento.Free;
  CtrlAssuntoAgenda.Free;
  CtrlAtendeAgenda.Free;
  inherited;
end;

procedure TfrmCadAgendamento.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  Reset;
  Cds.Close;
  Cds.CreateDataSet;
end;

procedure TfrmCadAgendamento.DadosSolicitanteEleg( _iIdPessoa : integer );
begin
  cdsSolicitanteEleg.Close;
  iIdPessoa               := _iIdPessoa;
  cdsSolicitanteEleg.Data := CtrlAgendamento.DadosSolicitanteEleg( _iIdPessoa );
  edtMatricula.Text       := cdsSolicitanteEleg.FieldByName('MATRICULA').AsString;
  edtPatrocinadora.Text   := cdsSolicitanteEleg.FieldByName('PATRO').AsString;
  edtInscricao.Text       := cdsSolicitanteEleg.FieldByName('INSCRICAONUMERO').AsString;
  edtPlano.Text           := cdsSolicitanteEleg.FieldByName('PLANO').AsString;
  edtNome.Text            := cdsSolicitanteEleg.FieldByName('NOME').AsString;
  if trim( CdsTELEFONE.AsString ) = ''  then
    if Cds.State in [dsInsert, dsEdit] then
      CdsTELEFONE.AsString := cdsSolicitanteEleg.FieldByName('TELEFONE').AsString;
end;

procedure TfrmCadAgendamento.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := CtrlAgendamento.GravaAgendamento( iId );
  if Accept then
    Reset;
end;

procedure TfrmCadAgendamento.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := CtrlAgendamento.GravaAgendamento( iId );
end;

procedure TfrmCadAgendamento.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := CtrlAgendamento.GravaAgendamento( iId );
end;

procedure TfrmCadAgendamento.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
  begin
    cds.Data := CtrlAgendamento.SelecionaAgendamento( StrToInt( MontaSelect.ValoresChave[0] ) );
    cbElegivel.Checked := not CdsIDPESSOA.IsNull;
    PreparaSolicitante;
    if CdsIDPESSOA.IsNull then
      edtNome.Text := CdsNOMESOLIC.AsString
    else
      DadosSolicitanteEleg( CdsIDPESSOA.AsInteger );
    PreencheSituacao;
  end;
end;

procedure TfrmCadAgendamento.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := False;

  if cbElegivel.Checked then
  begin

    if iIdPessoa = 0 then
    begin
      ShowMessage( 'Selecione o elegível/participante.' );
      exit;
    end;

    CdsIDPESSOA.AsInteger := iIdPessoa;
    CdsNOMESOLIC.Clear;

  end
  else
  begin

    if trim( edtNome.Text ) = '' then
    begin
      ShowMessage( 'Informe o nome do solicitante.' );
      edtNome.SetFocus;
      exit;
    end;

    CdsIDPESSOA.Clear;
    CdsNOMESOLIC.AsString := edtNome.Text;

  end;

  if CdsIDASSUNTOAGENDA.AsInteger <= 0 then
  begin
    ShowMessage( 'Selecione o assunto.' );
    cmbAssunto.SetFocus;
    exit;
  end;

  CdsDATAALTERACAO.AsDateTime := Now;

  Accept := True;
end;

procedure TfrmCadAgendamento.Reset;
begin
  cbElegivel.Checked := False;
  PreparaSolicitante;
end;

procedure TfrmCadAgendamento.CdsBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  Reset;
end;

procedure TfrmCadAgendamento.CdsAfterInsert(DataSet: TDataSet);
begin
  inherited;
  CdsFLGSITUACAO.AsInteger := 1;
  iIdPessoa := 0;
end;

procedure TfrmCadAgendamento.PreencheSituacao;
begin
  edtSituacao.Text := '';
  if CdsFLGSITUACAO.AsInteger = 1 then edtSituacao.Text := 'Agendado';
  if CdsFLGSITUACAO.AsInteger = 2 then edtSituacao.Text := 'Efetivado';
  if CdsFLGSITUACAO.AsInteger = 3 then edtSituacao.Text := 'Cancelado';
end;

procedure TfrmCadAgendamento.btnAgendaClick(Sender: TObject);
var
  Agendamento : TAgendamento;
begin
  inherited;
  Agendamento.iIdAtendeAgenda := CdsIDATENDEAGENDA.AsInteger;
  Agendamento.dData           := CdsDATA.AsDateTime;
  Agendamento.sHora           := CdsHORA.AsString;
  if SelecionaAgendamento( CdsIDAGENDAMENTO.AsInteger, Agendamento ) then
  begin
    CdsIDATENDEAGENDA.AsInteger := Agendamento.iIdAtendeAgenda;
    CdsDATA.AsDateTime          := Agendamento.dData;
    CdsHORA.AsString            := Agendamento.sHora;
  end;
end;

procedure TfrmCadAgendamento.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;

  btnEfetivar.Enabled := ( not ( CmeCadastro.Operacao in [opInserir,opAlterar] ) )
                           and ( not cds.IsEmpty )
                           and ( cds.State = dsBrowse );
  btnCancelar.Enabled := btnEfetivar.Enabled;

  if sbtnAlterar.Enabled then
  begin
    sbtnAlterar.Enabled := ( CdsFLGSITUACAO.AsInteger = 1 );
    sbtnApagar.Enabled  := ( CdsFLGSITUACAO.AsInteger = 1 );
    btnEfetivar.Enabled := ( CdsFLGSITUACAO.AsInteger = 1 );
    btnCancelar.Enabled := ( CdsFLGSITUACAO.AsInteger = 1 );
  end;

end;

procedure TfrmCadAgendamento.btnEfetivarClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Confirma efetivação do agendamento selecionado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    sbtnAlterarClick( Self );
    CdsFLGSITUACAO.AsInteger := 2;
    CdsDATAALTERACAO.AsDateTime := Now;
    bbtnConfirmarClick( Self );
    PreencheSituacao;
  end;
end;

procedure TfrmCadAgendamento.btnCancelarClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Confirma cancelamento do agendamento selecionado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    sbtnAlterarClick( Self );
    CdsFLGSITUACAO.AsInteger := 3;
    CdsDATAALTERACAO.AsDateTime := Now;
    bbtnConfirmarClick( Self );
    PreencheSituacao;
  end;
end;

end.
