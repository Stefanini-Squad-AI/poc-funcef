unit fCadRegAval;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask,
  DBCtrls, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, TB97, TB97Ctls,
  MAHlpBtn, TB97Tlbr, Buttons, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, ExtCtrls,
  TabControlDetalhe, wwdbedit, CmEventosCadastro, ImgList, FCadastroMestreDetMT, DBClient,
  uCMClientDataSet, TREdit, wwdbdatetimepicker, CMDateTimePicker, wwdblook, uCtrlRegAval,
  uCtrlTipAval, uCtrlPessoaCandidato, uCtrlCargo;

type
  TfrmCadRegAval = class(TFrmCadastroMestreDetMT)
    tbshObserv: TTabSheet;
    CdsDet: TCMClientDataSet;
    Label1: TLabel;
    dbedMatricula: TDBEdit;
    Label2: TLabel;
    dbedNome: TDBEdit;
    dbedSit: TDBEdit;
    dbedCargo: TDBEdit;
    dbmemComent: TDBMemo;
    CdsTipAval: TCMClientDataSet;
    MontaSelectCand: TMontaSelect;
    sbtnProcurarCand: TToolbarButton97;
    MontaSelectAvaliador: TMontaSelect;
    Label3: TLabel;
    dblckTipoAval: TwwDBLookupCombo;
    Label5: TLabel;
    dbedAvaliacao: TDBEdit;
    Label4: TLabel;
    dbedDatPlan: TCMDateTimePicker;
    Label6: TLabel;
    dbedDatReal: TCMDateTimePicker;
    gbxAvaliador: TGroupBox;
    dbedAvaliador: TDBEdit;
    bbtnBuscaEmpregado: TBitBtn;
    Label9: TLabel;
    dbmObser: TDBMemo;
    dsCargo: TwwDataSource;
    CdsCargo: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure dsDetStateChange(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnBuscaEmpregadoClick(Sender: TObject);
    procedure sbtnProcurarCandClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    CtrlRegAval: TCtrlRegAval;
    CtrlTipAval: TCtrlTipAval;
    CtrlPessoaCandidato: TCtrlPessoaCandidato;
    CtrlCargo: TCtrlCargo;

    dIdPessoa: double;

    procedure Sel(SelPrincipal, SelEmpregado: boolean; IdPessoa: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadRegAval: TfrmCadRegAval;

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlUsoGeralRH, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmCadRegAval.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRegAval := TCtrlRegAval.Create;
  CtrlRegAval.InitializeAs(Padroes);
  CtrlRegAval.CdsHstAval := CdsDet;

  CtrlTipAval := TCtrlTipAval.Create;
  CtrlTipAval.InitializeAs(Padroes);

  CtrlPessoaCandidato := TCtrlPessoaCandidato.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaCandidato.InitializeAs(Padroes);

  CtrlCargo := TCtrlCargo.Create;
  CtrlCargo.InitializeAs(Padroes);

  Sel(true, true, -1);

  CdsTipAval.Data := CtrlTipAval.ListTipoAval(0, '2');

  with (MontaSelect.Filtro) do
  begin
    Clear;
    // Estabelecimento(s) habilitados para o usuário
    if (CtrlUsoGeralRH.UsuXFilial <> '') then
      Add('FUNCIONARIO.IDESTAB IN ' +CtrlUsoGeralRH.UsuXFilial);

    // C. de Custo(s) habilitado(s) para o usuário
    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      Add('FUNCIONARIO.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto);

    // Usuário Individual
    if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
      Add('FUNCIONARIO.IDPESSOA = ' + CtrlUsoGeralRH.IdUsuarioGeral);

    // Usuário RH
    if not(CtrlUsoGeralRH.UsuarioRH) then
      Add('FUNCIONARIO.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));

    Add('FUNCIONARIO.IDPESSOA  = PESSOA.IDPESSOA');
    Add('FUNCIONARIO.IDCARGO   = CARGO.IDCARGO(+)');
  end;

  with (MontaSelectAvaliador.Filtro) do
  begin
    Clear;
    // Estabelecimento(s) habilitados para o usuário
    if (CtrlUsoGeralRH.UsuXFilial <> '') then
      Add('FUNCIONARIO.IDESTAB IN ' +CtrlUsoGeralRH.UsuXFilial);

    // C. de Custo(s) habilitado(s) para o usuário
    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      Add('FUNCIONARIO.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto);

    // Usuário Individual
    if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
      Add('FUNCIONARIO.IDPESSOA = ' + CtrlUsoGeralRH.IdUsuarioGeral);

    if not(CtrlUsoGeralRH.UsuarioRH) then
      Add('FUNCIONARIO.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));

    Add('FUNCIONARIO.IDPESSOA  = PESSOA.IDPESSOA');
    Add('FUNCIONARIO.IDCARGO   = CARGO.IDCARGO(+)');
  end;

  sbtnProcurarCand.Visible := (Sistema.IdModulo = MODRES);
  if (sbtnProcurarCand.Visible) then
  begin
    HelpContext := 730011;
    Caption := 'Registro de Testes e Entrevistas';
    sbtnProcurar.Caption := '&Procurar Empregado';
    sbtnProcurar.Width := 134;
  end
  else
  begin
    HelpContext := 700010;
    Caption := 'Registro de Outras Avaliações e Entrevistas';
    sbtnProcurar.Caption := '&Procurar';
    sbtnProcurar.Width := 60;
  end;
end;

procedure TfrmCadRegAval.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlCargo);
  FreeAndNil(CtrlRegAval);
  FreeAndNil(CtrlTipAval);
  FreeAndNil(CtrlPessoaCandidato);
  inherited;
end;

procedure TfrmCadRegAval.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
  begin
    dIdPessoa := StrToFloat(MontaSelect.ValoresChave[0]);
    Sel(true, true, dIdPessoa);
  end;
end;

procedure TfrmCadRegAval.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  CdsDet.FieldByName('IDPESSOA').asInteger := Cds.FieldByName('IDPESSOA').asInteger;
  CdsDet.FieldByName('AVALIADOR').asString := Sistema.NomeUsuario;
end;

procedure TfrmCadRegAval.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadRegAval.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadRegAval.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert, dsEdit]) and (dblckTipoAval.CanFocus) then
    dblckTipoAval.SetFocus;
end;

procedure TfrmCadRegAval.sbtnProcurarCandClick(Sender: TObject);
begin
  MontaSelectCand.Executar;
  if (MontaSelectCand.RetornouValor)  then
  begin
    dIdPessoa := StrToFloat(MontaSelectCand.ValoresChave[0]);
    Sel(true, false, dIdPessoa);
  end;

  sbtnProcurarCand.Down := false;
  sbtnAlterar.Enabled := not(Cds.IsEmpty);
end;

procedure TfrmCadRegAval.bbtnBuscaEmpregadoClick(Sender: TObject);
begin
  MontaSelectAvaliador.Executar;
  if (MontaSelectAvaliador.RetornouValor) then
    dbedAvaliador.Text := MontaSelectAvaliador.ValoresChave[1];
end;

procedure TfrmCadRegAval.bbtnOkDetClick(Sender: TObject);
begin
  if (Trim(dblckTipoAval.Text) = '') then
  begin
    MsgDlg('Digite o Tipo de Avaliação.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dblckTipoAval.SetFocus;
  end
  else
  begin
    if (CdsDet.State = dsInsert) then
      CdsDet.FieldByName('NUMSEQ').asInteger := CtrlRegAval.GetProxNumSeq(
        CdsDet.FieldByName('CODTIPOAVAL').asInteger);

    CdsDet.FieldByName('DESCRTIPOAVAL').asString := Trim(dblckTipoAval.Text);
    inherited;
  end;
end;

procedure TfrmCadRegAval.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  Sel(false, false, dIdPessoa);
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmCadRegAval.Sel(SelPrincipal, SelEmpregado: boolean; IdPessoa: double);
begin
  if (SelPrincipal) then
  begin
    if (SelEmpregado) then
      Cds.Data := CtrlPessoaCandidato.CtrlPessoaFuncionario.ListPesFisFuncionario(IdPessoa,
        '  F.MATRICULA, P.NOME, F.IDPESSOA, ST.DESCRICAO AS SITUACAO, F.IDCARGO')
    else
      Cds.Data := CtrlPessoaCandidato.ListCandidatoPessoa(IdPessoa);

    if (Cds.IsEmpty) then
      CdsCargo.Data := CtrlCargo.ListCargo(-1)
    else  
      CdsCargo.Data := CtrlCargo.ListCargo(Cds.FieldByName('IDCARGO').asFloat);
  end;

  CdsDet.Data := CtrlRegAval.ListDetalhe(IdPessoa);
end;

function TfrmCadRegAval.GravarRegistro: boolean;
begin
  Result := CtrlRegAval.GravarRegAval;
  if not(Result) then
    raise Exception.Create(CtrlRegAval.MessageInfo);
end;

end.
