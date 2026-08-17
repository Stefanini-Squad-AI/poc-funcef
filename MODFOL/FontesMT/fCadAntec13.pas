unit fCadAntec13;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask,
  wwdbedit, wwdblook, DBCtrls, CmEventosCadastro, ImgList, MontaSelect, DBTables, IvDictio,
  IvMulti, IvEMulti, Db, Wwdatsrc, MAHlpBtn, TB97Tlbr, Buttons, TB97Ctls, TB97, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Grids, fCadastroMestreDetMT, DBClient,
  uCMClientDataSet, Wwdbspin, uCtrlAntec13, uCtrlPessoaFuncionario;

type
  TfrmCadAntec13 = class(TFrmCadastroMestreDetMT)
    CdsDet: TCMClientDataSet;
    Label1: TLabel;
    dbedMat: TwwDBEdit;
    Label10: TLabel;
    dbedNome: TwwDBEdit;
    dbtxtSituacao: TDBText;
    Label15: TLabel;
    Label3: TLabel;
    speAnoAntec: TwwDBSpinEdit;
    speMesAntec: TwwDBSpinEdit;
    dbrgProc: TDBRadioGroup;
    edNomeMes: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure dsDetStateChange(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure speMesAntecChange(Sender: TObject);
    procedure dbrgProcChange(Sender: TObject);
    procedure dsDetDataChange(Sender: TObject; Field: TField);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure CdsDetBeforeInsert(DataSet: TDataSet);
    procedure CdsDetAfterInsert(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    CtrlAntec13: TCtrlAntec13;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;

    wMesAtual, wAnoAtual: word;

    procedure Sel(IdPessoa: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadAntec13: TfrmCadAntec13;

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmCadAntec13.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CtrlAntec13 := TCtrlAntec13.Create;
  CtrlAntec13.InitializeAs(Padroes);
  CtrlAntec13.CdsAntecip13 := CdsDet;

  with (MontaSelect.Filtro) do
  begin
    Clear;
    // Estabelecimento(s) habilitados para o usuário
    if (CtrlUsoGeralRH.UsuXFilial <> '') then
      Add('FUNCIONARIO.IDESTAB IN ' + CtrlUsoGeralRH.UsuXFilial);

    // C. de Custo(s) habilitado(s) para o usuário
    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      Add('FUNCIONARIO.CODCENTROCUSTO IN ' + CtrlUsoGeralRH.UsuXCCusto);

    // Usuário Individual
    if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
      Add('FUNCIONARIO.IDPESSOA = ' + CtrlUsoGeralRH.IdUsuarioGeral);

    Add('FUNCIONARIO.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));
    Add('FUNCIONARIO.IDPESSOA  = PESSOA.IDPESSOA');
    Add('FUNCIONARIO.IDCARGO   = CARGO.IDCARGO(+)');
  end;

  sbtnProcurarClick(Sender);
end;

procedure TfrmCadAntec13.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlAntec13);
  FreeAndNil(CtrlPessoaFuncionario);
  inherited;
end;

procedure TfrmCadAntec13.CmeCadastroFind(Sender: TObject);
begin
  inherited;
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

procedure TfrmCadAntec13.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadAntec13.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadAntec13.CdsDetBeforeInsert(DataSet: TDataSet);
var
  JaTem: boolean;
begin
  inherited;
  JaTem := not(CdsDet.EOF);

  if (JaTem) then
  begin
    CdsDet.Last;
    wAnoAtual := CdsDet.FieldByName('ANO').asInteger;
    wMesAtual := CdsDet.FieldByName('MES').asInteger;
  end
  else
  begin
    wAnoAtual := FU.ExtraiAno(Cds.FieldByName('DATAADMISSAO').asDateTime);
    wMesAtual := FU.ExtraiMes(Cds.FieldByName('DATAADMISSAO').asDateTime);
  end;

  Inc(wAnoAtual);
end;

procedure TfrmCadAntec13.CdsDetAfterInsert(DataSet: TDataSet);
begin
  inherited;
  CdsDet.FieldByName('IDPESSOA').asInteger := Cds.FieldByName('IDPESSOA').asInteger;
  CdsDet.FieldByName('FLGOCORRIDA').asInteger := 0;
  CdsDet.FieldByName('ANO').asInteger := wAnoAtual;
  CdsDet.FieldByName('MES').asInteger := wMesAtual;
end;

procedure TfrmCadAntec13.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert, dsEdit]) and (speMesAntec.CanFocus) then
    speMesAntec.SetFocus;
end;

procedure TfrmCadAntec13.dsDetDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if (CdsDet.State in [dsEdit, dsInsert]) and (speMesAntec.Value > 0) then
    edNomeMes.Text := AnsiUpperCase(MesLongo[Round(speMesAntec.Value)]);
end;

procedure TfrmCadAntec13.speMesAntecChange(Sender: TObject);
begin
  if (speMesAntec.Value > 12) then
    speMesAntec.Value := 1
  else
  if (speMesAntec.Value < 1) then
    speMesAntec.Value := 12;

  edNomeMes.Text := AnsiUpperCase(MesLongo[Round(speMesAntec.Value)]);
end;

procedure TfrmCadAntec13.dbrgProcChange(Sender: TObject);
begin
  if (CdsDet.State in [dsEdit, dsInsert]) and (dbrgProc.ItemIndex = 0) then
    if (MsgDlg('Confirma registro apenas para histórico?', 'Aviso', mtConfirmation,
       [mbYes, mbNo], 0) <> mrYes) then
      dbrgProc.ItemIndex := 1;
end;

procedure TfrmCadAntec13.sbtnAltDetClick(Sender: TObject);
begin
  if (dbrgProc.ItemIndex = 0) then
  begin
    MsgDlg('Antecipação Processada.'+CR_LF+'Alteração Não Permitida.', 'Aviso',
      mtInformation, [mbOk,mbHelp], 0);
    sbtnAlterar.Down := false;
    sbtnAltDet.Down := false;
  end
  else
    inherited;
end;

procedure TfrmCadAntec13.bbtnOkDetClick(Sender: TObject);
begin
  if (CdsDet.FieldbyName('ANO').IsNull) then
  begin
    MsgDlg('Informe o ano de referência.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    speAnoAntec.SetFocus;
  end
  else
  if (CdsDet.FieldbyName('MES').IsNull) then
  begin
    MsgDlg('Informe o mês da antecipação.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    speMesAntec.SetFocus;
  end
  else
    inherited;
end;

procedure TfrmCadAntec13.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmCadAntec13.Sel(IdPessoa: double);
begin
  Cds.Data := CtrlPessoaFuncionario.ListPesFisFuncionario(IdPessoa);
  CdsDet.Data := CtrlAntec13.ListAntecipacao13(IdPessoa);
end;

function TfrmCadAntec13.GravarRegistro: boolean;
begin
  Result := CtrlAntec13.Gravar;
  if not(Result) then
    raise exception.Create(CtrlAntec13.MessageInfo);
end;

end.
