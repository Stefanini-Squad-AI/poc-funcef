unit fHstTrein;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Db, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, Mask,
  DBCtrls, TB97, TB97Tlbr, MontaSelect, IvDictio, IvMulti, IvEMulti, wwdbedit, DBClient,
  uCMClientDataSet, uCtrlHistPessoa, uCtrlGlobalRH;

type
  TfrmHstTrein = class(TfrmSairAjuda)
    Panel2: TPanel;
    ds: TwwDataSource;
    dsDet: TwwDataSource;
    Label1: TLabel;
    Label2: TLabel;
    sbtnProcurar: TSpeedButton;
    dbtxtSituacao: TDBText;
    MontaSelectFunc: TMontaSelect;
    dbedMat: TwwDBEdit;
    dbedNome: TwwDBEdit;
    MontaSelectCand: TMontaSelect;
    Cds: TCMClientDataSet;
    CdsDet: TCMClientDataSet;
    dbgrTrein: TwwDBGrid;
    sbtnProcurarCand: TSpeedButton;
    sbtnImprimirHist: TSpeedButton;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnProcurarCandClick(Sender: TObject);
    procedure sbtnImprimirHistClick(Sender: TObject);
  protected
    CtrlHistPessoa: TCtrlHistPessoa;
    CtrlGlobalRH: TCtrlGlobalRH;
    bAvalAluno: boolean;
  end;

var
  frmHstTrein: TfrmHstTrein;

implementation

uses uMensErro, uCtrlUsoGeralRH, uSistema, uCtrlPadroes, fParamHistPess, dCds;

{$R *.DFM}

procedure TfrmHstTrein.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);
  dmCds.Cds.Data := CtrlGlobalRH.GetParamRH('FLGAVALALUNO');
  bAvalAluno := (dmCds.Cds.FieldByName('FLGAVALALUNO').asInteger = 1);
  if bAvalAluno then
    dbgrTrein.Selected.Delete(6);

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

procedure TfrmHstTrein.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlHistPessoa);
  inherited;
end;

procedure TfrmHstTrein.sbtnProcurarClick(Sender: TObject);
begin
  sbtnProcurar.Down := false;

  MontaSelectFunc.Executar;
  if (MontaSelectFunc.RetornouValor) then
  begin
    Cds.Data := CtrlHistPessoa.ListEmpregado(StrToFloat(MontaSelectFunc.ValoresChave[0]));

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
  if (Cds.IsEmpty) then
    Cds.Data := CtrlHistPessoa.ListEmpregado(-1);

  if not(Cds.IsEmpty) then
    CdsDet.Data := CtrlHistPessoa.ListHistoricoTreinamento(Cds.FieldByName('IDPESSOA').asFloat)
  else
  if (Cds.IsEmpty) then
    CdsDet.Data := CtrlHistPessoa.ListHistoricoTreinamento(-1);

  if bAvalAluno then
    TFloatField(CdsDet.FieldByName('AVALTEOR')).DisplayLabel := 'Avaliação';

  sbtnImprimirHist.Enabled := not (CdsDet.IsEmpty);
end;

procedure TfrmHstTrein.sbtnProcurarCandClick(Sender: TObject);
begin
  inherited;
  sbtnProcurarCand.Down := false;

  MontaSelectCand.Executar;
  if (MontaSelectCand.RetornouValor) then
    Cds.Data := CtrlHistPessoa.ListCandidato(StrToFloat(MontaSelectCand.ValoresChave[0]))
  else
  if (Cds.IsEmpty) then
    Cds.Data := CtrlHistPessoa.ListCandidato(-1);

  dbtxtSituacao.Font.Color := clTeal;

  if not(Cds.IsEmpty) then
    CdsDet.Data := CtrlHistPessoa.ListHistoricoTreinamento(Cds.FieldByName('IDPESSOA').asFloat)
  else
  if (Cds.IsEmpty) then
    CdsDet.Data := CtrlHistPessoa.ListHistoricoTreinamento(-1);

  if bAvalAluno then
    TFloatField(CdsDet.FieldByName('AVALTEOR')).DisplayLabel := 'Avaliação';
  
  sbtnImprimirHist.Enabled := not (CdsDet.IsEmpty);
end;

procedure TfrmHstTrein.sbtnImprimirHistClick(Sender: TObject);
begin
  inherited;
  sbtnImprimirHist.Down := false;
  frmParamHistPess := TfrmParamHistPess.Create(Application);
  with (frmParamHistPess) do
  begin
    sIdPessoa := Cds.FieldByName('IDPESSOA').asString;
    if copy(Cds.FieldByName('SITUACAO').asString,1,4) = 'Cand' then
      sTipoPessoa := 'C'
    else
      sTipoPessoa := 'F';
    ShowModal;
  end;
  FreeAndNil(frmParamHistPess);
end;

end.
