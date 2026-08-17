unit fAgendaComum;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, uCtrlAgendamento, uSistema, dBaseDados, Db,
  DBClient, uCMClientDataSet, Mask, DBCtrls, wwdbdatetimepicker, wwdblook,
  uCtrlAtendeAgenda, uCtrlAssuntoAgenda, JCLSysUtils, TB97Ctls, MontaSelect;

type
  TfrmAgendaComum = class(TfrmOkCancelar)
    cdsAtendeAgenda: TCMClientDataSet;
    cdsAtendeAgendaNOME: TStringField;
    cdsAtendeAgendaNOMEUSUARIO: TStringField;
    cdsAtendeAgendaIDATENDEAGENDA: TFloatField;
    GroupBox1: TGroupBox;
    pnlAgendamento: TPanel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    cmbAtendente: TwwDBLookupCombo;
    dtData: TwwDBDateTimePicker;
    dbHora: TDBEdit;
    ds: TDataSource;
    Cds: TCMClientDataSet;
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
    CdsOBSERVACAO: TBlobField;
    CdsDATAALTERACAO: TDateTimeField;
    cdsAssunto: TClientDataSet;
    cdsAssuntoDESCRICAO: TStringField;
    cdsAssuntoIDASSUNTOAGENDA: TFloatField;
    cdsAssuntoOBSERVACAO: TMemoField;
    Label8: TLabel;
    cmbAssunto: TwwDBLookupCombo;
    Label13: TLabel;
    dbmemObservacao: TDBMemo;
    Label6: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    dbedtIdAtend: TDBEdit;
    dbedtDataAlteracao: TDBEdit;
    edtSituacao: TEdit;
    cdsSolicitanteEleg: TClientDataSet;
    grpSolicitante: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label11: TLabel;
    edtMatricula: TEdit;
    edtInscricao: TEdit;
    edtNome: TEdit;
    edtPlano: TEdit;
    edtPatrocinadora: TEdit;
    dbedtTelefone: TDBEdit;
    cbElegivel: TCheckBox;
    Dock972: TDock97;
    Toolbar: TToolbar97;
    btnCancelar: TToolbarButton97;
    btnEfetivar: TToolbarButton97;
    msSolicitante: TMontaSelect;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEfetivarClick(Sender: TObject);
    procedure btnElegivelClick(Sender: TObject);
  private
    CtrlAgendamento   : TCtrlAgendamento;
    CtrlAtendeAgenda  : TCtrlAtendeAgenda;
    CtrlAssuntoAgenda : TCtrlAssuntoAgenda;

    //1 - Inserção; 2 - Consulta
    iOperacao  : integer;

    procedure MsgErro( sMsg : string );
  public

    iIdAgendamento  : integer;
    iIdAtend        : integer;
    iIdPessoa       : integer;
    iIdAtendeAgenda : integer;
    dData           : TDateTime;
    sHora           : string;
    sNomeSolic      : string;
    bPodeEfetivar   : boolean;

    procedure DadosSolicitanteEleg( _iIdPessoa : integer );
    procedure PreencheSituacao;
  end;

var
  frmAgendaComum: TfrmAgendaComum;

function AgendamentoAtend( var iIdAgendamento : integer;
                           iIdAtend,
                           iIdPessoa : integer;
                           sNomeSolic : string;
                           iIdAtendeAgenda : integer;
                           dData : TDateTime;
                           sHora : string;
                           bPodeEfetivar : boolean ) : boolean;

implementation

{$R *.DFM}

procedure TfrmAgendaComum.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlAgendamento := TCtrlAgendamento.Create;
  CtrlAgendamento.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );
  CtrlAgendamento.CdsAgendamento := Cds;

  CtrlAtendeAgenda := TCtrlAtendeAgenda.Create;
  CtrlAtendeAgenda.InitializeAs( CtrlAgendamento );
  cdsAtendeAgenda.Data := CtrlAtendeAgenda.LookupAtendentes;

  CtrlAssuntoAgenda := TCtrlAssuntoAgenda.Create;
  CtrlAssuntoAgenda.InitializeAs( CtrlAgendamento );
  cdsAssunto.Data := CtrlAssuntoAgenda.LookupAssunto;
end;

procedure TfrmAgendaComum.FormDestroy(Sender: TObject);
begin
  CtrlAgendamento.Free;
  CtrlAtendeAgenda.Free;
  inherited;           
end;

procedure TfrmAgendaComum.MsgErro(sMsg: string);
begin
  ShowMessage( sMsg );
end;

function AgendamentoAtend( var iIdAgendamento : integer;
                           iIdAtend,
                           iIdPessoa : integer;
                           sNomeSolic : string;
                           iIdAtendeAgenda : integer;
                           dData : TDateTime;
                           sHora : string;
                           bPodeEfetivar : boolean ) : boolean;
var
  frm : TfrmAgendaComum;
begin
  Result := False;
  frm := TfrmAgendaComum.Create( Application );
  try
    frm.iIdAgendamento  := iIdAgendamento;
    frm.iIdAtend        := iIdAtend;
    frm.iIdPessoa       := iIdPessoa;
    frm.sNomeSolic      := sNomeSolic;
    frm.iIdAtendeAgenda := iIdAtendeAgenda;
    frm.dData           := dData;
    frm.sHora           := sHora;
    frm.bPodeEfetivar   := bPodeEfetivar;
    if frm.ShowModal = mrOk then
    begin
      iIdAgendamento := frm.iIdAgendamento;
      Result := True;
    end;
  finally
    frmAgendaComum.Free;
  end;
end;

procedure TfrmAgendaComum.FormShow(Sender: TObject);
begin
  inherited;
  iOperacao := iff( iIdAgendamento = 0, 1, 2 );

  if iOperacao = 1 then
  begin
    TB97oKCancelar.Visible := True;
    bbtnSair.Visible := False;

    btnCancelar.Enabled := False;
    btnEfetivar.Enabled := False;

    Cds.CreateDataset;
    Cds.Insert;
    if iIdPessoa > 0 then
    begin
      CdsIDPESSOA.AsInteger := iIdPessoa;
      DadosSolicitanteEleg( iIdPessoa );
      cbElegivel.Checked := True;
    end
    else
    begin
      CdsNOMESOLIC.AsString := sNomeSolic;
      edtNome.Text          := sNomeSolic;
      cbElegivel.Checked    := False;
    end;

    CdsIDATENDEAGENDA.AsInteger := iIdAtendeAgenda;
    CdsDATA.AsDateTime          := dData;
    CdsHORA.AsString            := sHora;

    CdsDATAALTERACAO.AsString := FormatDateTime( 'dd/mm/yyyy hh:nn', Now );
    CdsIDATEND.AsInteger      := iIdAtend;
    CdsFLGSITUACAO.AsInteger  := 1;

    cmbAssunto.SetFocus;
  end
  else
  begin
    cmbAssunto.Color := clBtnFace;
    dbmemObservacao.Color := clBtnFace;
    pnlFundo.Enabled := False;

    Cds.Data := CtrlAgendamento.SelecionaAgendamento( iIdAgendamento );

    if CdsFLGSITUACAO.AsInteger > 1 then
    begin
      btnCancelar.Enabled := False;
      btnEfetivar.Enabled := False;
    end
    else
      btnEfetivar.Enabled := bPodeEfetivar;

    if cdsIDPESSOA.AsInteger > 0 then
      DadosSolicitanteEleg( CdsIDPESSOA.AsInteger )
    else
    begin
      edtNome.Text          := CdsNOMESOLIC.AsString;
      cbElegivel.Checked    := False;
    end;
  end;

  PreencheSituacao;
end;

procedure TfrmAgendaComum.DadosSolicitanteEleg(_iIdPessoa: integer);
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

procedure TfrmAgendaComum.PreencheSituacao;
begin
  edtSituacao.Text := '';
  if CdsFLGSITUACAO.AsInteger = 1 then edtSituacao.Text := 'Agendado';
  if CdsFLGSITUACAO.AsInteger = 2 then edtSituacao.Text := 'Efetivado';
  if CdsFLGSITUACAO.AsInteger = 3 then edtSituacao.Text := 'Cancelado';
end;

procedure TfrmAgendaComum.bbtnConfirmarClick(Sender: TObject);
var
  iId : integer;
begin
  inherited;

  if CdsIDASSUNTOAGENDA.AsInteger <= 0 then
  begin
    ShowMessage( 'Selecione o assunto.' );
    cmbAssunto.SetFocus;
    exit;
  end;

  CdsDATAALTERACAO.AsDateTime := Now;

  if CtrlAgendamento.GravaAgendamento( iId ) then
  begin
    iIdAgendamento := iId;
    ShowMessage( 'Agendamento efetuado com sucesso.' );
    ModalResult := mrOk;
  end;

end;

procedure TfrmAgendaComum.btnCancelarClick(Sender: TObject);
var
  iId : integer;
begin
  inherited;
  if MessageDlg('Confirma o cancelamento deste agendamento?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    cds.Edit;
    CdsFLGSITUACAO.AsInteger := 3;
    CdsDATAALTERACAO.AsDateTime := Now;
    cds.Post;
    if CtrlAgendamento.GravaAgendamento( iId ) then
    begin
      ShowMessage( 'Agendamento cancelado.' );
      ModalResult := mrOk;
    end;
  end;
end;

procedure TfrmAgendaComum.btnEfetivarClick(Sender: TObject);
var
  iId : integer;
begin
  inherited;
  if MessageDlg('Confirma a efetivação deste agendamento?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    cds.Edit;
    CdsFLGSITUACAO.AsInteger := 2;
    CdsDATAALTERACAO.AsDateTime := Now;
    cds.Post;
    if CtrlAgendamento.GravaAgendamento( iId ) then
    begin
      ShowMessage( 'Agendamento efetivado.' );
      ModalResult := mrOk;
    end;
  end;
end;

procedure TfrmAgendaComum.btnElegivelClick(Sender: TObject);
begin
  inherited;
  msSolicitante.Executar;
  if msSolicitante.RetornouValor then
    DadosSolicitanteEleg( StrToInt( msSolicitante.ValoresChave[0] ) );
end;

end.
