unit fHstAval;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Db, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, Mask,
  DBCtrls, TB97, TB97Tlbr, MontaSelect, IvDictio, IvMulti, IvEMulti, wwdbedit, DBClient,
  uCMClientDataSet, uCtrlHistPessoa;

type
  TfrmHstAval = class(TfrmSairAjuda)
    Panel2: TPanel;
    ds: TwwDataSource;
    dsDet: TwwDataSource;
    Label1: TLabel;
    Label2: TLabel;
    sbtnProcurar: TSpeedButton;
    dbtxtSituacao: TDBText;
    dbedMat: TwwDBEdit;
    dbedNome: TwwDBEdit;
    Cds: TCMClientDataSet;
    CdsDet: TCMClientDataSet;
    dbgrHistorico: TwwDBGrid;
    MontaSelectFunc: TMontaSelect;
    MontaSelectCand: TMontaSelect;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  protected
    CtrlHistPessoa: TCtrlHistPessoa;
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

    // Usuário RH
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
  inherited;
end;

procedure TfrmHstAval.sbtnProcurarClick(Sender: TObject);
begin
  sbtnProcurar.Down := false;

  if (MsgDlg('Procura Empregado? (Senão, Candidato)',
             'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes) then
  begin
    MontaSelectFunc.Executar;
    if (MontaSelectFunc.RetornouValor) then
      Cds.Data := CtrlHistPessoa.ListEmpregado(StrToFloat(MontaSelectFunc.ValoresChave[0]))
    else
    if (Cds.IsEmpty) then
      Cds.Data := CtrlHistPessoa.ListEmpregado(-1);

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
    CdsDet.Data := CtrlHistPessoa.ListTestesEntrevistas(Cds.FieldByName('IDPESSOA').asFloat)
  else
  if (Cds.IsEmpty) then
    CdsDet.Data := CtrlHistPessoa.ListTestesEntrevistas(-1);
end;

end.
