unit fCadDiaExtra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, TB97,
  Buttons, TB97Tlbr, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker, CmEventosCadastro, ImgList, fCadastroMT, DBClient, uCMClientDataSet,
  uCtrlDiaExtra, uCtrlPessoaFuncionario;

type
  TfrmCadDiaExtra = class(TFrmCadastroMT)
    lblNome: TLabel;
    dblcFunc: TwwDBLookupCombo;
    lblDataExtra: TLabel;
    dbdeDataExtra: TCMDateTimePicker;
    CdsFunc: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsStateChange(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
  private
    CtrlDiaExtra: TCtrlDiaExtra;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;

    procedure Sel(IdPessoa: double; DiaTrab: TDate);
    function GravarRegistro: boolean;
  end;

var
  frmCadDiaExtra: TfrmCadDiaExtra;

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmCadDiaExtra.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CtrlDiaExtra := TCtrlDiaExtra.Create;
  CtrlDiaExtra.InitializeAs(Padroes);
  CtrlDiaExtra.Cds := Cds;
  Sel(-1, -1);

  CdsFunc.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(Sistema.IdEmpresa);

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
    Add('DIAEXTRATRAB.IDPESSOA = FUNCIONARIO.IDPESSOA');
    Add('DIAEXTRATRAB.IDPESSOA = PESSOA.IDPESSOA');
  end;
end;

procedure TfrmCadDiaExtra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlDiaExtra);
  FreeAndNil(CtrlPessoaFuncionario);
  inherited;
end;

procedure TfrmCadDiaExtra.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]), StrToDate(MontaSelect.ValoresChave[1]));
end;

procedure TfrmCadDiaExtra.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1, -1);
  inherited;
end;

procedure TfrmCadDiaExtra.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadDiaExtra.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadDiaExtra.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadDiaExtra.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dblcFunc.CanFocus) then
    dblcFunc.SetFocus;
end;

procedure TfrmCadDiaExtra.bbtnConfirmarClick(Sender: TObject);
var
  bInserindo: boolean;
begin
  if (Trim(dblcFunc.Text) = '') then
  begin
    MsgDlg('Indique uma Pessoa.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dblcFunc.SetFocus;
  end
  else
  if (Trim(dbdeDataExtra.Text) = '') then
  begin
    MsgDlg('Preencha a Data.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbdeDataExtra.SetFocus;
  end
  else
  begin
    bInserindo := (Cds.State = dsInsert);
    inherited;
    if not(bInserindo) then
      CmeCadastroFind(Sender);
  end;
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmCadDiaExtra.Sel(IdPessoa: double; DiaTrab: TDate);
begin
  Cds.Data := CtrlDiaExtra.ListDiasExtra(FloatToStr(IdPessoa), DiaTrab);
end;

function TfrmCadDiaExtra.GravarRegistro: boolean;
begin
  Result := CtrlDiaExtra.Gravar;
  if not(Result) then
    raise exception.Create(CtrlDiaExtra.MessageInfo);
end;

end.
