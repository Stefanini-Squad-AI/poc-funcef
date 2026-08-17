unit fHstOcorr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Db, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, Mask,
  DBCtrls, TB97, TB97Tlbr, MontaSelect, IvDictio, IvMulti, IvEMulti, wwdbedit, DBClient,
  uCMClientDataSet, uCtrlHistPessoa, uCtrlPessoaFuncionario;

type
  TfrmHstOcorr = class(TfrmSairAjuda)
    Panel2: TPanel;
    ds: TwwDataSource;
    dsDet: TwwDataSource;
    Label1: TLabel;
    Label2: TLabel;
    sbtnProcurar: TSpeedButton;
    dbgrHistorico: TwwDBGrid;
    dbtxtSituacao: TDBText;
    MontaSelectFunc: TMontaSelect;
    dbedMat: TwwDBEdit;
    dbedNome: TwwDBEdit;
    MontaSelectCand: TMontaSelect;
    Cds: TCMClientDataSet;
    CdsDet: TCMClientDataSet;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  protected
    CtrlHistPessoa: TCtrlHistPessoa;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
  end;

var
  frmHstOcorr: TfrmHstOcorr;

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmHstOcorr.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlHistPessoa := TCtrlHistPessoa.Create;
  CtrlHistPessoa.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  with (MontaSelectFunc.Filtro) do
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

procedure TfrmHstOcorr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlHistPessoa);
  FreeAndNil(CtrlPessoaFuncionario);
  inherited;
end;

procedure TfrmHstOcorr.sbtnProcurarClick(Sender: TObject);
begin
  sbtnProcurar.Down := false;

  if (MsgDlg('Procura Empregado? (Senão, Candidato)',
             'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes) then
  begin
    MontaSelectFunc.Executar;
    if (MontaSelectFunc.RetornouValor) then
      Cds.Data := CtrlPessoaFuncionario.ListPesFisFuncionario(StrToFloat(
        MontaSelectFunc.ValoresChave[0]))
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
  end
  else
  begin
    MontaSelectCand.Executar;
    if (MontaSelectCand.RetornouValor) then
      Cds.Data := CtrlHistPessoa.ListCandidato(StrToFloat(MontaSelectCand.ValoresChave[0]))
    else
    if (Cds.IsEmpty) then
      Cds.Data := CtrlHistPessoa.ListCandidato(-1);

    dbtxtSituacao.Font.Color := clTeal;
  end;

  if not(Cds.IsEmpty) then
    CdsDet.Data := CtrlHistPessoa.ListOcorrenciasMedicas(Cds.FieldByName('IDPESSOA').asFloat)
  else
  if (Cds.IsEmpty) then
    CdsDet.Data := CtrlHistPessoa.ListOcorrenciasMedicas(-1);
end;

end.
