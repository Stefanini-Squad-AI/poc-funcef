unit fRegBancoHoras;
// 'SITUACAO'#9'10'#9'Situação'#9'F') 27/02/08 estava na linha 125 do dfm (campo tirado da grid)

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, cmseldlg, wwidlg,
  Db, Wwdatsrc, DBCtrls, MAHlpBtn, StdCtrls, Buttons, ComCtrls, ToolWin, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, DBTables, Mask, TB97, IvDictio, IvMulti, TB97Ctls, TB97Tlbr, ImgList,
  MontaSelect, wwdbdatetimepicker, CMDateTimePicker, wwdblook, wwDialog, CmEventosCadastro,
  TabControlDetalhe, wwdbedit, FCadastroMestreDetMT, DBClient, uCMClientDataSet, TREdit,
  Wwdotdot, Wwdbcomb, uCtrlBancoHoras, uCtrlPessoaCandidato, uCtrlGlobalRH,
  IvEMulti;

type
  TfrmRegBancoHoras = class(TFrmCadastroMestreDetMT)
    Label4: TLabel;
    dbdtedDataIni: TCMDateTimePicker;
    Label6: TLabel;
    dbedMatr: TwwDBEdit;
    Label10: TLabel;
    dbedNome: TwwDBEdit;
    dbtxtSituacao: TDBText;
    CdsDet: TCMClientDataSet;
    dbredValor: TDBRealEdit;
    Label1: TLabel;
    dbcmbSit: TwwDBComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Data1: TCMDateTimePicker;
    Data2: TCMDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure Data1Change(Sender: TObject);
    procedure dsDetStateChange(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
  private
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlBancoHoras: TCtrlBancoHoras;
    CtrlPessoaCandidato: TCtrlPessoaCandidato;

    dIdPessoa: double;

    procedure Sel(SelPrincipal, SelEmpregado: boolean; IdPessoa: double);
    function  GravarRegistro: boolean;
    function  ExecOkDetalhe: boolean;
  end;

var
  frmRegBancoHoras: TfrmRegBancoHoras;

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlUsoGeralRH, uCtrlFuncoesRH, dCds;

{$R *.DFM}

procedure TfrmRegBancoHoras.FormCreate(Sender: TObject);
begin
  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlPessoaCandidato := TCtrlPessoaCandidato.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaCandidato.InitializeAs(Padroes);

  CtrlBancoHoras := TCtrlBancoHoras.Create;
  CtrlBancoHoras.InitializeAs(Padroes);
  CtrlBancoHoras.CdsBancoHoras := CdsDet;

  dmCds.Cds.Data := CtrlGlobalRH.GetParamRH('FLGBANCOHORAS, '+
   'PERBANCOHORAS, INDPERBCHORAS, DATBANCOHORAS');
  if (dmCds.Cds.FieldByName('INDPERBCHORAS').asInteger <> 1) then
    Data1.Date := Date - 365
  else
    Data1.Date := dmCds.Cds.FieldByName('DATBANCOHORAS').asDateTime;
  Data2.Date := Date;

  with (MontaSelect.Filtro) do
  begin
    Clear;
    // Estabelecimento(s) habilitados para o usuário
    if (CtrlUsoGeralRH.UsuXFilial <> '') then
      if (Pos(',',CtrlUsoGeralRH.UsuXFilial) = 0) then
        Add('FUNCIONARIO.IDESTAB = ' +CtrlUsoGeralRH.UsuXFilial)
      else
        Add('FUNCIONARIO.IDESTAB IN (' +CtrlUsoGeralRH.UsuXFilial +')');

    // C. de Custo(s) habilitado(s) para o usuário
    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      if (Pos(',',CtrlUsoGeralRH.UsuXCCusto) = 0) then
        Add('FUNCIONARIO.CODCENTROCUSTO = ' +CtrlUsoGeralRH.UsuXCCusto)
      else
        Add('FUNCIONARIO.CODCENTROCUSTO IN (' +CtrlUsoGeralRH.UsuXCCusto +')');

    // Usuário Individual
    if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
      Add('FUNCIONARIO.IDPESSOA = ' + CtrlUsoGeralRH.IdUsuarioGeral);

    // Usuário RH
    if not(CtrlUsoGeralRH.UsuarioRH) then
      Add('FUNCIONARIO.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));

    Add('FUNCIONARIO.IDPESSOA      = PESSOA.IDPESSOA');
    Add('FUNCIONARIO.FLGMARCAPONTO = 1');
    Add('FUNCIONARIO.IDCARGO       = CARGO.IDCARGO(+)');
  end;

  Sel(true, true, -1);
  inherited;
end;

procedure TfrmRegBancoHoras.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlBancoHoras);
  FreeAndNil(CtrlPessoaCandidato);
  inherited;
end;

procedure TfrmRegBancoHoras.CmeCadastroFind(Sender: TObject);
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

procedure TfrmRegBancoHoras.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  CdsDet.FieldByName('IDPESSOA').asFloat := Cds.FieldByName('IDPESSOA').asFloat;
  CdsDet.FieldByName('SITBANCOHORAS').asFloat := 1;
  CdsDet.FieldByName('SITUACAO').asString := fu.CMTranslate('Aberto');
end;

procedure TfrmRegBancoHoras.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmRegBancoHoras.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmRegBancoHoras.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert,dsEdit]) and (dbdtedDataIni.CanFocus) then
    dbdtedDataIni.SetFocus;
end;

procedure TfrmRegBancoHoras.Data1Change(Sender: TObject);
begin
  if (dIdPessoa > 0) then
  try
    if (StrToDate(Data1.Text) <= StrToDate(Data2.Text)) then
      Sel(false, false, dIdPessoa);
  except
  end;
end;

procedure TfrmRegBancoHoras.dsStateChange(Sender: TObject);
begin
  inherited;
  Data1.Enabled := (Cds.State <> dsEdit);
  Data2.Enabled := (Cds.State <> dsEdit);
end;

procedure TfrmRegBancoHoras.bbtnOkDetClick(Sender: TObject);
begin
  if (ExecOkDetalhe) then
    inherited;
end;

procedure TfrmRegBancoHoras.bbtnConfirmarClick(Sender: TObject);
begin
  if (ExecOkDetalhe) then
  begin
    inherited;
    Sel(false, false, dIdPessoa);
  end;
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmRegBancoHoras.Sel(SelPrincipal, SelEmpregado: boolean; IdPessoa: double);
begin
  if (SelPrincipal) then
  begin
    if (SelEmpregado) then
      Cds.Data := CtrlPessoaCandidato.CtrlPessoaFuncionario.ListPesFisFuncionario(IdPessoa,
        '  F.MATRICULA, P.NOME, F.IDPESSOA, ST.TIPOSIT,'+CR_LF+
        '  ('+CR_LF+
        '     TO_CHAR(DECODE(ST.TIPOSIT,'+CR_LF+
        '       ''A'',' +QuotedStr(fu.CMTranslate('(Ativo(a))'))+ ','+CR_LF+
        '       ''F'',' +QuotedStr(fu.CMTranslate('(Afastado(a))'))+ ','+CR_LF+
        '       ''D'',' +QuotedStr(fu.CMTranslate('(Demitido(a))'))+ ','+CR_LF+
        '       ' +QuotedStr(fu.CMTranslate('Indefinido'))+ '))'+CR_LF+
        '  ) AS SITUACAO')
    else
      Cds.Data := CtrlPessoaCandidato.ListCandidatoPessoa(IdPessoa);
  end;

  CdsDet.Data := CtrlBancoHoras.ListBancoHorasPeriodo(IdPessoa, Data1.Text, Data2.Text);
end;

function TfrmRegBancoHoras.GravarRegistro: boolean;
begin
  Result := CtrlBancoHoras.GravarBancoHoras;
  if not(Result) then
    MsgDlg(CtrlBancoHoras.MessageInfo, fu.CMTranslate('Erro'), mtError, [mbOk,mbHelp], 0);
end;

function TfrmRegBancoHoras.ExecOkDetalhe: boolean;
begin
  Result := false;
  if (CdsDet.State in [dsInsert,dsEdit]) then
  begin
    if (Trim(dbdtedDataIni.Text) = '') then
    begin
      MsgDlg(fu.CMTranslate('Preencha a Data do Lançamento.'), fu.CMTranslate('Aviso'),
        mtInformation, [mbOk,mbHelp], 0);
      dbdtedDataIni.SetFocus;
      exit;
    end;

    if (dbredValor.Value = 0) then
    begin
      MsgDlg(fu.CMTranslate('Informe o Valor (em minutos).'), fu.CMTranslate('Aviso'),
        mtInformation, [mbOk,mbHelp], 0);
      dbredValor.SetFocus;
      exit;
    end;

    if (CdsDet.FieldByName('VALBANCOHORAS').asFloat <= 0) then
      CdsDet.FieldByName('TIPO').asString := fu.CMTranslate('Débito')
    else
      CdsDet.FieldByName('TIPO').asString := fu.CMTranslate('Crédito');

    CdsDet.FieldByName('SITUACAO').asString := dbcmbSit.Text;
  end;
  Result := true;
end;

end.
