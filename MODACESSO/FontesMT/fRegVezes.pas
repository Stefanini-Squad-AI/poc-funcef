unit fRegVezes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, cmseldlg, wwidlg,
  Db, Wwdatsrc, DBCtrls, MAHlpBtn, StdCtrls, Buttons, ComCtrls, ToolWin, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, DBTables, Mask, TB97, IvDictio, IvMulti, TB97Ctls, TB97Tlbr, TREdit, 
  MontaSelect, wwdbdatetimepicker, CMDateTimePicker, wwdblook, wwDialog, CmEventosCadastro,
  ImgList, TabControlDetalhe, wwdbedit, FCadastroMestreDetMT, DBClient, uCMClientDataSet,
   uCtrlEstacaoAcesso, uCtrlPessoaFuncionario, uCtrlRegAcessoFunc, fTelaAut,
  IvEMulti;

type
  TfrmRegVezes = class(TFrmCadastroMestreDetMT)
    Label3: TLabel;
    dblcEstacao: TwwDBLookupCombo;
    Label4: TLabel;
    dbdtedDataIni: TCMDateTimePicker;
    Label5: TLabel;
    dbdtedDataFim: TCMDateTimePicker;
    Label6: TLabel;
    dbedMatr: TwwDBEdit;
    Label10: TLabel;
    dbedNome: TwwDBEdit;
    dbtxtSituacao: TDBText;
    CdsEstacao: TCMClientDataSet;
    CdsDet: TCMClientDataSet;
    dbredVezes: TDBRealEdit;
    Label1: TLabel;
    sbtnCriaColetivo: TToolbarButton97;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dsDetStateChange(Sender: TObject);
    procedure sbtnCriaColetivoClick(Sender: TObject);
  private
    CtrlEstacaoAcesso: TCtrlEstacaoAcesso;
    CtrlRegAcessoFunc: TCtrlRegAcessoFunc;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;

    dIdPessoa: double;

    procedure Sel(SelPrincipal: boolean; IdPessoa: double);
    function  GravarRegistro: boolean;
    function  ExecOkDetalhe: boolean;
  end;

var
  frmRegVezes: TfrmRegVezes;

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlUsoGeralRH, uCtrlFuncoesRH,
  fRegQuantAcessosColet;

{$R *.DFM}

procedure TfrmRegVezes.FormCreate(Sender: TObject);
begin
  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CtrlEstacaoAcesso := TCtrlEstacaoAcesso.Create;
  CtrlEstacaoAcesso.InitializeAs(Padroes);

  CtrlRegAcessoFunc := TCtrlRegAcessoFunc.Create;
  CtrlRegAcessoFunc.InitializeAs(Padroes);
  CtrlRegAcessoFunc.CdsAcessoFunc := CdsDet;

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

    Add('FUNCIONARIO.IDPESSOA  = PESSOA.IDPESSOA');
    Add('FUNCIONARIO.IDCARGO   = CARGO.IDCARGO(+)');
  end;

  CdsEstacao.Data := CtrlEstacaoAcesso.ListEstacaoAcesso(0);

  Sel(true, -1);
  inherited;
end;

procedure TfrmRegVezes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlEstacaoAcesso);
  FreeAndNil(CtrlRegAcessoFunc);
  FreeAndNil(CtrlPessoaFuncionario);
  inherited;
end;

procedure TfrmRegVezes.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
  begin
    dIdPessoa := StrToFloat(MontaSelect.ValoresChave[0]);
    Sel(true, dIdPessoa);

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

procedure TfrmRegVezes.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  CdsDet.FieldByName('IDPESSOA').asFloat := Cds.FieldByName('IDPESSOA').asFloat;
  CdsDet.FieldByName('INDFUNCAO').asString := 'Q';
end;

procedure TfrmRegVezes.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmRegVezes.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmRegVezes.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert,dsEdit]) and (dblcEstacao.CanFocus) then
    dblcEstacao.SetFocus;
end;

procedure TfrmRegVezes.bbtnOkDetClick(Sender: TObject);
begin
  if (ExecOkDetalhe) then
    inherited;
end;

procedure TfrmRegVezes.bbtnConfirmarClick(Sender: TObject);
begin
  if (ExecOkDetalhe) then
  begin
    inherited;
    Sel(false, dIdPessoa);
  end;
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmRegVezes.Sel(SelPrincipal: boolean; IdPessoa: double);
begin
  if (SelPrincipal) then
    Cds.Data := CtrlPessoaFuncionario.ListPesFisFuncionario(IdPessoa,
      '  F.MATRICULA, P.NOME, F.IDPESSOA, ST.TIPOSIT,'+CR_LF+
      '  ('+CR_LF+
      '     TO_CHAR(DECODE(ST.TIPOSIT,'+CR_LF+
        '       ''A'',' +QuotedStr(fu.CMTranslate('(Ativo(a))'))+ ','+CR_LF+
        '       ''F'',' +QuotedStr(fu.CMTranslate('(Afastado(a))'))+ ','+CR_LF+
        '       ''D'',' +QuotedStr(fu.CMTranslate('(Demitido(a))'))+ ','+CR_LF+
        '       ' +QuotedStr(fu.CMTranslate('Indefinido'))+ '))'+CR_LF+
      '  ) AS SITUACAO');

  CdsDet.Data := CtrlRegAcessoFunc.ListAcessoRegVezesFunc(IdPessoa);
end;

function TfrmRegVezes.GravarRegistro: boolean;
begin
  Result := CtrlRegAcessoFunc.GravarAcessoFunc;
  if not(Result) then
    MsgDlg(CtrlRegAcessoFunc.MessageInfo, fu.CMTranslate('Erro'), mtError, [mbOk,mbHelp], 0);
end;

function TfrmRegVezes.ExecOkDetalhe: boolean;
begin
  Result := false;
  if (CdsDet.State in [dsInsert,dsEdit]) then
  begin
    if (Trim(dblcEstacao.Text) = '') then
    begin
      MsgDlg(fu.CMTranslate('Informe a Estação.'), fu.CMTranslate('Aviso'),
        mtInformation, [mbOk,mbHelp], 0);
      dblcEstacao.SetFocus;
      exit;
    end;

    if (Trim(dbdtedDataIni.Text) = '') then
    begin
      MsgDlg(fu.CMTranslate('Preencha a Data Inicial.'), fu.CMTranslate('Aviso'),
        mtInformation, [mbOk,mbHelp], 0);
      dbdtedDataIni.SetFocus;
      exit;
    end;

    if (Trim(dbdtedDataFim.Text) = '') then
    begin
      MsgDlg(fu.CMTranslate('Preencha a Data Final.'), fu.CMTranslate('Aviso'),
        mtInformation, [mbOk,mbHelp], 0);
      dbdtedDataIni.SetFocus;
      exit;
    end;

    if (dbdtedDataFim.Date < dbdtedDataIni.Date) then
    begin
      MsgDlg(fu.CMTranslate('Data Final Não Pode Ser Anterior à Data Inicial.'),
        fu.CMTranslate('Aviso'), mtInformation, [mbOk,mbHelp], 0);
      dbdtedDataIni.SetFocus;
      exit;
    end;

    if (dbredVezes.Value = 0) then
    begin
      MsgDlg(fu.CMTranslate('Informe o Número de Vezes.'), fu.CMTranslate('Aviso'),
        mtInformation, [mbOk,mbHelp], 0);
      dbredVezes.SetFocus;
      exit;
    end;

    CdsDet.FieldByName('DESCRICAO').asString := CdsEstacao.FieldByName('ESTACAO').asString +
      ' - ' + CdsEstacao.FieldByName('DESCRICAO').asString;
  end;
  Result := true;
end;

procedure TfrmRegVezes.sbtnCriaColetivoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmRegQuantAcessosColet, TfrmRegQuantAcessosColet, false);
end;

end.
