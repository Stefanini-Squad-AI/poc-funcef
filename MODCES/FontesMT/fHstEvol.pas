unit fHstEvol;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Db, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, Mask,
  DBCtrls, TB97, TB97Tlbr, MontaSelect, IvDictio, IvMulti, IvEMulti, wwdbedit, DBClient,
  uCMClientDataSet, uCtrlHistPessoa, uCtrlGlobalRH, uCtrlPessoaFuncionario;

type
  TfrmHstEvol = class(TfrmSairAjuda)
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
    dbgrEvol: TwwDBGrid;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  protected
    CtrlHistPessoa: TCtrlHistPessoa;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
  end;

var
  frmHstEvol: TfrmHstEvol;

implementation

uses uMensErro, uCtrlPadroes, uSistema, uDbParamRH, uCtrlFuncoesRH, uCtrlUsoGeralRH,
     uModulo;

{$R *.DFM}

procedure TfrmHstEvol.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CtrlHistPessoa := TCtrlHistPessoa.Create;
  CtrlHistPessoa.InitializeAs(Padroes);

  CtrlGlobalRH.DbParamRH.LoadFromDb;
  if (CtrlGlobalRH.DbParamRH.FlgDoisCargos.asInteger = 0) then
  begin
    Cds.DisableControls;
    dbgrEvol.Selected.Delete(6);
    Cds.EnableControls;
  end;

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
    if not(CtrlUsoGeralRH.UsuarioRH) or (Sistema.IdModulo = MODFOL) then
      Add('FUNCIONARIO.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));

    Add('FUNCIONARIO.IDPESSOA  = PESSOA.IDPESSOA');
    Add('FUNCIONARIO.IDCARGO   = CARGO.IDCARGO(+)');
  end;

  if (Modulo.IdContraCheque = FUNCEF) then
  with dbgrEvol.Selected do
  begin
    Clear;
    Add('DATAALTERFUNC'#9'10'#9'Data Efet.');
    Add('DESCRICAO'#9'50'#9'Tipo de Evento');
    Add('SALARIO'#9'10'#9'Salário');
    Add('NIVELINDIV1'#9'1'#9'Nível');
    Add('TIPOPAGAMENTO'#9'1'#9'Freq.');
    Add('PERC_REAJ'#9'10'#9'% Reaj.');
    Add('TITULO'#9'40'#9'Cargo');
    Add('FUNCAO'#9'40'#9'Cargo Alternativo ou Função');
    Add('CCUSTO'#9'30'#9'Centro de Custo'#9'F');
  end;

  sbtnProcurarClick(Self);

  case (Sistema.IdModulo) of
    MODCES : HelpContext := 740024;
    MODFOL : HelpContext := 210083;
  end;
end;

procedure TfrmHstEvol.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlHistPessoa);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlPessoaFuncionario);
  inherited;
end;

procedure TfrmHstEvol.sbtnProcurarClick(Sender: TObject);
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
    CdsDet.Data := CtrlHistPessoa.ListEvolucaoFuncional(Cds.FieldByName('IDPESSOA').asFloat)
  else
  if (Cds.IsEmpty) then
    CdsDet.Data := CtrlHistPessoa.ListEvolucaoFuncional(-1);
end;

end.
