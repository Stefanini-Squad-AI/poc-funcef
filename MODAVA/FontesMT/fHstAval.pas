unit fHstAval;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Db, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, Mask,
  DBCtrls, TB97, TB97Tlbr, MontaSelect, IvDictio, IvMulti, IvEMulti, wwdbedit, DBClient,
  uCMClientDataSet, uCtrlHistPessoa, uCtrlPessoaFuncionario;

type
  TfrmHstAval = class(TfrmSairAjuda)
    Panel2: TPanel;
    ds: TwwDataSource;
    dsDet: TwwDataSource;
    Label1: TLabel;
    Label2: TLabel;
    sbtnProcurar: TSpeedButton;
    dbtxtSituacao: TDBText;
    MontaSelect: TMontaSelect;
    dbedMat: TwwDBEdit;
    dbedNome: TwwDBEdit;
    Cds: TCMClientDataSet;
    CdsDet: TCMClientDataSet;
    dbgrHistorico: TwwDBGrid;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  protected
    CtrlHistPessoa: TCtrlHistPessoa;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
  end;

var
  frmHstAval: TfrmHstAval;

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmHstAval.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlHistPessoa := TCtrlHistPessoa.Create;
  CtrlHistPessoa.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

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

    if not(CtrlUsoGeralRH.UsuarioRH) then
      Add('FUNCIONARIO.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));

    Add('FUNCIONARIO.IDPESSOA  = PESSOA.IDPESSOA');
    Add('FUNCIONARIO.IDCARGO   = CARGO.IDCARGO(+)');
  end;

  sbtnProcurarClick(Self);
end;

procedure TfrmHstAval.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlHistPessoa);
  FreeAndNil(CtrlPessoaFuncionario);
  inherited;
end;

procedure TfrmHstAval.sbtnProcurarClick(Sender: TObject);
begin
  sbtnProcurar.Down := false;

  MontaSelect.Executar;
  if (MontaSelect.RetornouValor) then
    Cds.Data := CtrlPessoaFuncionario.ListPesFisFuncionario(
      StrToFloat(MontaSelect.ValoresChave[0]))
  else
  if (Cds.IsEmpty) then
    Cds.Data := CtrlPessoaFuncionario.ListPesFisFuncionario(-1);

  if not(Cds.IsEmpty) then
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

  if not(Cds.IsEmpty) then
    CdsDet.Data := CtrlHistPessoa.ListAvaliacoes(Cds.FieldByName('IDPESSOA').asFloat)
  else
  if (Cds.IsEmpty) then
    CdsDet.Data := CtrlHistPessoa.ListAvaliacoes(-1);
end;

end.
