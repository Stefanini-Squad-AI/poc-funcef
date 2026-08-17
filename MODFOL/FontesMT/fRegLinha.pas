unit fRegLinha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, TB97Ctls, MAHlpBtn, TB97Tlbr, TB97, StdCtrls,
  Buttons, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask, DBCtrls,
  wwdbedit, Wwdbspin, wwdblook, CmEventosCadastro, ImgList, fCadastroMestreDetMT, DBClient,
  uCMClientDataSet, TREdit, uCtrlRegLinha, uCtrlPessoaFuncionario, uCtrlGlobalRH, uCtrlLinha;

type
  TfrmRegLinha = class(TFrmCadastroMestreDetMT)
    Label1: TLabel;
    Label10: TLabel;
    Label3: TLabel;
    dblcLinhaTransp: TwwDBLookupCombo;
    Label5: TLabel;
    dbtxtSituacao: TDBText;
    dbedMat: TwwDBEdit;
    dbedNome: TwwDBEdit;
    CdsDet: TCMClientDataSet;
    CdsLinhaTransp: TCMClientDataSet;
    dbspQtdDiaria: TDBRealEdit;
    CdsRadInst: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure dsDetStateChange(Sender: TObject);
    procedure dblcLinhaTranspChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    CtrlRegLinha: TCtrlRegLinha;
    CtrlLinha: TCtrlLinha;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    iIdTipoProcesso: LongInt;

    procedure Sel(IdPessoa: double);
  end;

var
  frmRegLinha: TfrmRegLinha;

implementation

uses uMensErro, uCtrlPadroes, uRAD, uSistema, uCtrlFuncoesRH, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmRegLinha.FormCreate(Sender: TObject);
begin
  inherited;
  if (Sistema.IdModulo = MODAUTO) then
    HelpContext := 4170018;

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CtrlLinha := TCtrlLinha.Create;
  CtrlLinha.InitializeAs(Padroes);

  CtrlRegLinha := TCtrlRegLinha.Create;
  CtrlRegLinha.InitializeAs(Padroes);
  CtrlRegLinha.CdsDet := CdsDet;
  Sel(-1);

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

    Add('FUNCIONARIO.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));
    Add('FUNCIONARIO.IDPESSOA  = PESSOA.IDPESSOA');
    Add('FUNCIONARIO.IDCARGO   = CARGO.IDCARGO(+)');
  end;

  sbtnProcurarClick(Sender);

  CdsLinhaTransp.Data := CtrlLinha.ListLinhaTransporte;

  if (Sistema.UsaRAD) then
    iIdTipoProcesso := CtrlGlobalRH.GetIdTipoProcessoRAD(23)
  else
    iIdTipoProcesso := -1;
end;

procedure TfrmRegLinha.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlLinha);
  FreeAndNil(CtrlRegLinha);
  inherited;
end;

procedure TfrmRegLinha.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
  begin
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));

    if (Cds.FieldByName('TIPOSIT').asString = 'D') then
      dbtxtSituacao.Font.Color := clRed
    else
    if (Cds.FieldByName('TIPOSIT').asString = 'F') then
      dbtxtSituacao.Font.Color := clGreen
    else
    if (Cds.FieldByName('TIPOSIT').asString = 'A') then
      dbtxtSituacao.Font.Color := clBlue;
  end;
end;

procedure TfrmRegLinha.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  CdsDet.FieldByName('IDPESSOA').asFloat := Cds.FieldByName('IDPESSOA').asFloat;
  CdsDet.FieldByName('QTDDIARIA').asInteger := 1;
  CdsDet.FieldByName('IDLINHATRANSP').asInteger := 0;
end;

procedure TfrmRegLinha.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmRegLinha.CmeCadastroConfirma(Sender: TObject);
var
  sItinerario: string;
begin
  if (Sistema.UsaRAD) and (iIdTipoProcesso > 0) then
  begin
    sItinerario := '';
    cdsDet.First;
    while not cdsDet.Eof do
    begin
      sItinerario := sItinerario + CR_LF + CdsDet.FieldByName('QTDDIARIA').asString +
                     ' '+ CdsDet.FieldByName('TIPOLINHATRANSP').asString +
                     ' '+ CdsDet.FieldByName('DESCRICAO').asString+
                     ' '+ CdsDet.FieldByName('VLRLINHATRANSP').asString;
      cdsDet.Next;
    end;
    cdsDet.First;

    if (CtrlRegLinha.AtualizarProcRAD(Cds.FieldByName('IdPessoa').asFloat,
        dbedNome.Text + sItinerario, iIdTipoProcesso, Sistema.IdEmpresa)) then
      MsgDlg(CtrlRegLinha.MessageInfo, 'Aviso', mtInformation, [mbOk,mbHelp], 0)
    else
      MsgDlg(CtrlRegLinha.MessageInfo, 'Erro', mtError, [mbOk,mbHelp], 0);
  end;    
  inherited;
end;

procedure TfrmRegLinha.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := (CtrlRegLinha.Gravar);
  if not(Accept) then
    MsgDlg(CtrlRegLinha.MessageInfo, 'Erro', mtError, [mbOk,mbHelp], 0);
end;

procedure TfrmRegLinha.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := (CtrlRegLinha.Gravar);
  if not(Accept) then
    MsgDlg(CtrlRegLinha.MessageInfo, 'Erro', mtError, [mbOk,mbHelp], 0);
end;

procedure TfrmRegLinha.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := (CtrlRegLinha.Gravar);
  if not(Accept) then
    MsgDlg(CtrlRegLinha.MessageInfo, 'Erro', mtError, [mbOk,mbHelp], 0);
end;

procedure TfrmRegLinha.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert, dsEdit]) and (dblcLinhaTransp.CanFocus) then
    dblcLinhaTransp.SetFocus;
end;

procedure TfrmRegLinha.dblcLinhaTranspChange(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert, dsEdit]) then
    if (Trim(dblcLinhaTransp.Text) = '') then
    begin
      CdsDet.FieldByName('TIPOLINHATRANSP').Clear;
      CdsDet.FieldByName('DESCRICAO').Clear;
      CdsDet.FieldByName('NUMLINHATRANSP').Clear;
      CdsDet.FieldByName('VLRLINHATRANSP').Clear;
    end
    else
    begin
      CdsDet.FieldByName('TIPOLINHATRANSP').asString := CdsLinhaTransp.FieldByName('TIPOLINHATRANSP').asString;
      CdsDet.FieldByName('DESCRICAO').asString := CdsLinhaTransp.FieldByName('DESCRICAO').asString;
      CdsDet.FieldByName('NUMLINHATRANSP').asString := CdsLinhaTransp.FieldByName('NUMLINHATRANSP').asString;
      CdsDet.FieldByName('VLRLINHATRANSP').asString := CdsLinhaTransp.FieldByName('VLRLINHATRANSP').asString;
    end;
end;

procedure TfrmRegLinha.sbtnAlterarClick(Sender: TObject);
begin
  if (Cds.FieldByName('TIPOSIT').asString <> 'A') then
  begin
    MsgDlg('Situação Funcional não permite esta operação.', 'Aviso',
      mtWarning, [mbOk,mbHelp], 0);
    sbtnAlterar.Down := false;
  end
  else
    inherited;
end;

procedure TfrmRegLinha.bbtnOkDetClick(Sender: TObject);
begin
  if (Trim(dblcLinhaTransp.Text) = '') then
  begin
    MsgDlg('Selecione uma Linha de Transporte.','Aviso', mtWarning, [mbOk,mbHelp], 0);
    dblcLinhaTransp.SetFocus;
  end
  else
  if (Trim(dbspQtdDiaria.Text) = '') then
  begin
    MsgDlg('Preencha a Quantidade Diária.','Aviso', mtWarning, [mbOk,mbHelp], 0);
    dbspQtdDiaria.SetFocus;
  end
  else
    inherited;
end;

procedure TfrmRegLinha.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmRegLinha.Sel(IdPessoa: double);
begin
  Cds.Data := CtrlPessoaFuncionario.ListPesFisFuncionario(IdPessoa);
  CdsDet.Data := CtrlRegLinha.ListLinhaTransporte(IdPessoa);
end;

end.
