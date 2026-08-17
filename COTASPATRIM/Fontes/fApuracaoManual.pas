unit fApuracaoManual;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, wwdblook,
  CMDBLookupCombo, wwdbdatetimepicker, CMDateTimePicker, DBCtrls, Mask,
  uCtrlCpRotApurado, uMensErro, dBaseDados, uSistema, uCtrlRoteiros, fProgresso,
  fResultExecucao, uCtrlCpExecRot;

type
  TfrmApuracaoManual = class(TFrmCadastroMestreDetMT)
    cdsDet: TCMClientDataSet;
    lblRoteiro: TLabel;
    dblkpRoteiro: TCMDBLookupCombo;
    lblData: TLabel;
    dtApuracao: TCMDateTimePicker;
    lblSituacao: TLabel;
    lblUsuario: TLabel;
    lblObservacao: TLabel;
    dbmemObservacao: TDBMemo;
    Label1: TLabel;
    dtExecucao: TCMDateTimePicker;
    dbedtUsuario: TDBEdit;
    dbedtSituacao: TDBEdit;
    cdsRoteiro: TCMClientDataSet;
    dbedtIdApuracao: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    dbedtValor: TDBEdit;
    cdsEntrada: TCMClientDataSet;
    Label4: TLabel;
    dbedtEntrada: TDBEdit;
    sbtnSimular: TToolbarButton97;
    ToolbarSep972: TToolbarSep97;
    cdsMovimentacoes: TCMClientDataSet;
    cdsSimulaMovim: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure cdsDetAfterOpen(DataSet: TDataSet);
    procedure CdsAfterOpen(DataSet: TDataSet);
    procedure CmeDetalheBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure sbtnSimularClick(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
  private
    CtrlCpRotApurado : TCtrlCpRotApurado;
    CtrlRoteiro      : TCtrlRoteiro;
    CtrlCpExecRot    : TCtrlCpExecRot;

    iIdCpRotApurado : integer;
    iProgresso      : integer;

    function Salva : boolean;
    procedure Seleciona( iId : integer );
    procedure SelecionaRoteiro( Sender : TField );
  public
    procedure MsgErro( sMsg : string );

    procedure ExecucaoRoteiroInicio;
    procedure ExecucaoRoteiroMovto;
    procedure ExecucaoRoteiroTermino;
  end;

var
  frmApuracaoManual: TfrmApuracaoManual;

implementation

{$R *.DFM}

{ TfrmApuracaoManual }

procedure TfrmApuracaoManual.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlCpRotApurado := TCtrlCpRotApurado.Create;
  CtrlCpRotApurado.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );
  CtrlCpRotApurado.cds    := cds;
  CtrlCpRotApurado.cdsEnt := cdsDet;

  CtrlRoteiro := TCtrlRoteiro.Create;
  CtrlRoteiro.InitializeAs( CtrlCpRotApurado );
  cdsRoteiro.Data := CtrlRoteiro.LookupRoteiros;

  CtrlCpExecRot := TCtrlCpExecRot.Create;
  CtrlCpExecRot.InitializeAs( CtrlCpRotApurado );
  CtrlCpExecRot.iIdEmpresa := Sistema.IdEmpresa;

  CtrlCpExecRot.MovtoInicio  := ExecucaoRoteiroInicio;
  CtrlCpExecRot.MovtoPasso   := ExecucaoRoteiroMovto;
  CtrlCpExecRot.MovtoTermino := ExecucaoRoteiroTermino;

  frmProgresso := TfrmProgresso.Create( nil );

  iIdCpRotApurado := 0;
end;


procedure TfrmApuracaoManual.FormDestroy(Sender: TObject);
begin
  CtrlCpRotApurado.Free;
  CtrlRoteiro.Free;
  CtrlCpExecRot.Free;
  frmProgresso.Free;
  inherited;
end;


procedure TfrmApuracaoManual.MsgErro(sMsg: string);
begin
  MsgDlg( sMsg, 'Atenção', mtError, [mbOK], 0 );
  frmProgresso.EscondeFormProgresso;
end;


function TfrmApuracaoManual.Salva: boolean;
begin
  Result := CtrlCpRotApurado.GravaDados;
  if Result then
    Seleciona( iIdCpRotApurado );
end;

procedure TfrmApuracaoManual.Seleciona(iId: integer);
begin
  cds.Data    := CtrlCpRotApurado.DadosRotApurado( iId );
  cdsDet.Data := CtrlCpRotApurado.DadosRotAprEnt( iId );
  dblkpRoteiro.ReadOnly := True;
end;

procedure TfrmApuracaoManual.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := False;

  if dblkpRoteiro.Text = '' then
  begin
    MsgDlg('O roteiro deve ser informado.', 'Atenção', mtWarning, [mbOk], 0);
    dblkpRoteiro.SetFocus;
    exit;
  end;

  if dtApuracao.Text = '' then
  begin
    MsgDlg('A data de apuração deve ser informada.', 'Atenção', mtWarning, [mbOk], 0);
    dtApuracao.SetFocus;
    exit;
  end;

  Accept := True;
end;

procedure TfrmApuracaoManual.CmeCadastroInsert(Sender: TObject);
begin
  Seleciona( -1 );

  inherited;
  
  iIdCpRotApurado := 0;

  cds.FieldByName('IDCPROTAPURADO').AsInteger := 0;
  cds.FieldByName('IDUSUARIO').AsInteger      := Sistema.IdUsuario;
  cds.FieldByName('NOMEUSUARIO').AsString     := Sistema.NomeUsuario;
  cds.FieldByName('FLGSTATUS').AsString       := 'A';
  cds.FieldByName('SITUACAO').AsString        := 'Apurado';
  cds.FieldByName('FLGTIPOAPUR').AsString     := 'M';

  dblkpRoteiro.ReadOnly := False;

  if dblkpRoteiro.CanFocus then dblkpRoteiro.SetFocus;
end;

procedure TfrmApuracaoManual.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := Salva;
end;

procedure TfrmApuracaoManual.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
  begin
    iIdCpRotApurado := StrToInt( MontaSelect.ValoresChave[0] );
    Seleciona( iIdCpRotApurado );
  end;
end;

procedure TfrmApuracaoManual.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  cdsDet.First;
  while not CdsDet.Eof do
    cdsDet.Delete;

  Accept := CtrlCpRotApurado.ExcluiDados;
  if Accept then
    iIdCpRotApurado := 0;
end;

procedure TfrmApuracaoManual.cdsDetAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField( DataSet.FieldByName('VALOR') ).DisplayFormat := '#,##0.000000';
  TFloatField( DataSet.FieldByName('VALOR') ).EditFormat    := '###0.000000';
end;

procedure TfrmApuracaoManual.SelecionaRoteiro( Sender : TField );
var
  cdsAux : TCMClientDataset;
begin
  if cds.State = dsInsert then
  begin
    cdsDet.Close;
    cdsDet.Data := CtrlCpRotApurado.DadosRotAprEnt( -1 );

    cdsAux := TCMClientDataset.Create( nil );
    try
      cdsAux.Data := CtrlRoteiro.CarregaCpREntrada( cds.FieldByName('IDCPROTEIRO').AsInteger );
      while not cdsAux.Eof do
      begin
        cdsDet.Append;

        cdsDet.FieldByName('IDCPROTAPRENT').AsInteger  := 0;
        cdsDet.FieldByName('NOME').AsString            := cdsAux.FieldByName('NOME_ENTRADA').AsString;
        cdsDet.FieldByName('VALOR').AsFloat            := 0;
        cdsDet.FieldByName('IDCPTPENTRADA').AsInteger  := cdsAux.FieldByName('IDCPTPENTRADA').AsInteger;
        cdsDet.FieldByName('IDCPROTAPURADO').AsInteger := 0;
        cdsDet.FieldByName('FLGORIGEM').AsString       := cdsAux.FieldByName('FLGORIGEM').AsString;
        cdsDet.FieldByName('ORIGEM').AsString          := cdsAux.FieldByName('ORIGEM').AsString;

        cdsDet.Post;
        cdsAux.Next;
      end;
      cdsDet.First;

      CmeDetalheAtualizaBotoes( nil );

    finally
      cdsAux.Free;
    end;    

  end;
end;

procedure TfrmApuracaoManual.CdsAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('IDCPROTEIRO').OnChange := SelecionaRoteiro;
end;

procedure TfrmApuracaoManual.CmeDetalheBeforeConfirma(sender: TObject;  var Accept: Boolean);
begin
  inherited;
  Accept := False;

  if dbedtEntrada.Text = '' then
  begin
    MsgDlg('A entrada deve ser informada.', 'Atenção', mtWarning, [mbOk], 0);
    dbedtEntrada.SetFocus;
    exit;
  end;

  if dbedtValor.Text = '' then
  begin
    MsgDlg('O valor da entrada deve ser informado.', 'Atenção', mtWarning, [mbOk], 0);
    dbedtValor.SetFocus;
    exit;
  end;

  Accept := True;
end;

procedure TfrmApuracaoManual.sbtnSimularClick(Sender: TObject);
begin
  inherited;

  if Cds.IsEmpty then exit;

  cdsMovimentacoes.Data := CtrlRoteiro.CarregaCpRTpMovim( cds.FieldByName('IDCPROTEIRO').AsInteger );
  if cdsMovimentacoes.IsEmpty then
  begin
    MsgDlg( 'Não existem movimentações para este roteiro.', 'Atenção', mtWarning, [mbOk], 0 );
    exit;
  end;              

  Application.MainForm.Enabled := False;
  try
    cdsSimulaMovim.Close;
    cdsSimulaMovim.Data := CtrlCpExecRot.ProcessaMovimentacoes( cds.FieldByName('IDCPROTAPURADO').AsInteger, cdsDet.Data, cdsMovimentacoes.Data );

    TfrmResultExecucao.Modo( 2 );
    frmResultExecucao := TfrmResultExecucao.Create( Self );
    try
      frmResultExecucao.cdsExecRot.Data  := CtrlCpExecRot.ConsultaExecRot( -1, -1, 0, 0 );
      frmResultExecucao.cdsExecRot.Append;
      frmResultExecucao.cdsExecRot.FieldByName('IDCPEXECROT').AsInteger := -1;
      frmResultExecucao.cdsExecRot.FieldByName('IDCPATIVO').AsInteger   := cdsRoteiro.FieldByName('IDCPATIVO').AsInteger;
      frmResultExecucao.cdsExecRot.FieldByName('ATIVO').AsString        := cdsRoteiro.FieldByName('NOME').AsString;
      frmResultExecucao.cdsExecRot.FieldByName('DTREF').AsDateTime      := Now;
      frmResultExecucao.cdsExecRot.FieldByName('FLGSTATUS').AsString    := 'E';
      frmResultExecucao.cdsExecRot.FieldByName('STATUS').AsString       := 'Executado';
      frmResultExecucao.cdsExecRot.FieldByName('IDUSUARIO').AsInteger   := Sistema.IdUsuario;
      frmResultExecucao.cdsExecRot.FieldByName('NOMEUSUARIO').AsString  := Sistema.NomeUsuario;
      frmResultExecucao.cdsExecRot.FieldByName('DTEXECUCAO').AsDateTime := Now;
      frmResultExecucao.cdsExecRot.Post;
      frmResultExecucao.cdsRoteiros.Data := cds.Data;
      frmResultExecucao.cdsEntradas.Data := cdsDet.Data;
      frmResultExecucao.cdsMovimentacoes.Data := cdsSimulaMovim.Data;

      frmResultExecucao.ShowModal;
    finally
      frmResultExecucao.Free;
    end;

  finally
    Application.MainForm.Enabled := True;
    sbtnSimular.Down := False;
  end;

end;

procedure TfrmApuracaoManual.CmeCadastroAtualizaBotoes(Sender: TObject);
var
  bHabilita : boolean;
begin
  inherited;

  bHabilita := ( not Cds.IsEmpty) and ( Cds.State = dsBrowse );
  if bHabilita then
    bHabilita := cds.FieldByName( 'IDCPEXECROT').IsNull;

  sbtnAlterar.Enabled := bHabilita;
  sbtnApagar.Enabled  := bHabilita;
  sbtnSimular.Enabled := bHabilita;
end;

procedure TfrmApuracaoManual.ExecucaoRoteiroInicio;
begin
  frmProgresso.Pos := 0;
  iProgresso       := 0;
  frmProgresso.MostraFormProgresso( 'Simulando execução do roteiro...',
   True, False, True, 0, CtrlCpExecRot.iQtdePassos );
end;

procedure TfrmApuracaoManual.ExecucaoRoteiroMovto;
begin
  inc( iProgresso );
  frmProgresso.AndaFormProgresso( iProgresso );
end;

procedure TfrmApuracaoManual.ExecucaoRoteiroTermino;
begin
  Sleep( 100 );
  frmProgresso.EscondeFormProgresso;
end;

procedure TfrmApuracaoManual.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  dbedtValor.SetFocus;
end;

end.
