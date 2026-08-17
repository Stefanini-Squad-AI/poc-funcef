unit fCadRegExp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, cmseldlg, wwidlg,
  Db, Wwdatsrc, DBCtrls, MAHlpBtn, StdCtrls, Buttons, ComCtrls, ToolWin, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, DBTables, Mask, TB97, IvDictio, IvMulti, IvEMulti, TB97Ctls, TB97Tlbr,
  MontaSelect, wwdbdatetimepicker, CMDateTimePicker, wwdblook, wwDialog, CmEventosCadastro,
  ImgList, TabControlDetalhe, wwdbedit, FCadastroMestreDetMT, DBClient, uCMClientDataSet,
  uCtrlExper, uCtrlRegExp, uCtrlPessoaCandidato;

type
  TfrmCadRegExp = class(TFrmCadastroMestreDetMT)
    MontaSelectCand: TMontaSelect;
    Label3: TLabel;
    dblckTipoExp: TwwDBLookupCombo;
    Label4: TLabel;
    dbdtedDataIni: TCMDateTimePicker;
    Label5: TLabel;
    dbdtedDataFim: TCMDateTimePicker;
    Label6: TLabel;
    dbedMatr: TwwDBEdit;
    Label10: TLabel;
    dbedNome: TwwDBEdit;
    dbtxtSituacao: TDBText;
    CdsTipoExp: TCMClientDataSet;
    sbtnProcurarCand: TToolbarButton97;
    CdsDet: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure sbtnProcurarCandClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dsDetStateChange(Sender: TObject);
  private
    CtrlExper: TCtrlExper;
    CtrlRegExp: TCtrlRegExp;
    CtrlPessoaCandidato: TCtrlPessoaCandidato;

    dIdPessoa: double;

    procedure Sel(SelPrincipal, SelEmpregado: boolean; IdPessoa: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadRegExp: TfrmCadRegExp;

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlUsoGeralRH, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmCadRegExp.FormCreate(Sender: TObject);
begin
  CtrlPessoaCandidato := TCtrlPessoaCandidato.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaCandidato.InitializeAs(Padroes);

  CtrlExper := TCtrlExper.Create;
  CtrlExper.InitializeAs(Padroes);

  CtrlRegExp := TCtrlRegExp.Create;
  CtrlRegExp.InitializeAs(Padroes);
  CtrlRegExp.CdsHstExper := CdsDet;

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

  CdsTipoExp.Data := CtrlExper.ListTabExper;

  Sel(true, true, -1);
  inherited;
end;

procedure TfrmCadRegExp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlExper);
  FreeAndNil(CtrlRegExp);
  FreeAndNil(CtrlPessoaCandidato);
  inherited;
end;

procedure TfrmCadRegExp.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
  begin
    dIdPessoa := StrToFloat(MontaSelect.ValoresChave[0]);
    Sel(true, true, dIdPessoa);

    if (Cds.FieldByName('TIPOSIT').asString = 'D') then
      dbtxtSituacao.Font.Color := clRed
    else
    if (Cds.FieldByName('TIPOSIT').asString = 'F') then
      dbtxtSituacao.Font.Color := clGreen
    else
    if (Cds.FieldByName('TIPOSIT').asString = 'A') then
      dbtxtSituacao.Font.Color := clBlue
    else
      dbtxtSituacao.Font.Color := clTeal;
  end;
end;

procedure TfrmCadRegExp.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  CdsDet.FieldByName('IDPESSOA').asFloat := Cds.FieldByName('IDPESSOA').asFloat;
end;

procedure TfrmCadRegExp.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadRegExp.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadRegExp.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert,dsEdit]) and (dblckTipoExp.CanFocus) then
    dblckTipoExp.SetFocus;
end;

procedure TfrmCadRegExp.sbtnProcurarCandClick(Sender: TObject);
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

procedure TfrmCadRegExp.bbtnOkDetClick(Sender: TObject);
var
  DatFim: TDateTime;
begin
  if (Trim(dblckTipoExp.Text) = '') then
  begin
    MsgDlg('Preencha o Tipo de Experiência.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dblckTipoExp.SetFocus;
    exit;
  end;

  if (Trim(dbdtedDataIni.Text) = '') then
  begin
    MsgDlg('Preencha a Data Inicial.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbdtedDataIni.SetFocus;
    exit;
  end;

  if (dbdtedDataIni.Date > Date) then
    if (MsgDlg('Data Final posterior a hoje. Confirma?',
               'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) <> mrYes) then
    begin
      dbdtedDataIni.SetFocus;
      exit;
    end;

  DatFim := CdsDet.FieldByName('DAT_FIM').asDateTime;
  if (DatFim = 0) then
    DatFim := Date;
  CdsDet.FieldByName('MESES').asInteger := Round((DatFim -
    CdsDet.FieldByName('DAT_INI').asDateTime) * 12 / 365.25);

  CdsDet.FieldByName('DESCRICAO').asString := Trim(dblckTipoExp.Text);
  inherited;
end;

procedure TfrmCadRegExp.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  Sel(false, false, dIdPessoa);
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmCadRegExp.Sel(SelPrincipal, SelEmpregado: boolean; IdPessoa: double);
begin
  if (SelPrincipal) then
    if (SelEmpregado) then
      Cds.Data := CtrlPessoaCandidato.CtrlPessoaFuncionario.ListPesFisFuncionario(IdPessoa,
        '  F.MATRICULA, P.NOME, F.IDPESSOA, ST.TIPOSIT,'+CR_LF+
        '  DECODE(ST.TIPOSIT,''A'',''(Ativ'', ''F'',''(Afastad'', ''D'',''(Demitid'') ||'+CR_LF+
        '    DECODE(PF.SEXO,''F'',''a)'',''o)'') AS SITUACAO')
    else
      Cds.Data := CtrlPessoaCandidato.ListCandidatoPessoa(IdPessoa);

  CdsDet.Data := CtrlRegExp.ListHstExper(IdPessoa);
end;

function TfrmCadRegExp.GravarRegistro: boolean;
begin
  Result := CtrlRegExp.GravarHstExper;
  if not(Result) then
    raise Exception.Create(CtrlRegExp.MessageInfo);
end;

end.
