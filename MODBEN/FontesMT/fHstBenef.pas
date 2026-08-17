unit fHstBenef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Db, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, Mask,
  DBCtrls, TB97, TB97Tlbr, MontaSelect, IvDictio, IvMulti, IvEMulti, wwdbedit, DBClient,
  uCMClientDataSet, uCtrlHistPessoa;

type
  TfrmHstBenef = class(TfrmSairAjuda)
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
  end;

var
  frmHstBenef: TfrmHstBenef;

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmHstBenef.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlHistPessoa := TCtrlHistPessoa.Create;
  CtrlHistPessoa.InitializeAs(Padroes);

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
    if not(CtrlUsoGeralRH.UsuarioRH) then
      Add('FUNCIONARIO.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));

    Add('FUNCIONARIO.IDPESSOA  = PESSOA.IDPESSOA');
    Add('FUNCIONARIO.IDCARGO   = CARGO.IDCARGO(+)');
  end;

  sbtnProcurarClick(Self);
end;

procedure TfrmHstBenef.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlHistPessoa);
  inherited;
end;

procedure TfrmHstBenef.sbtnProcurarClick(Sender: TObject);
begin
  sbtnProcurar.Down := false;

  MontaSelect.Executar;
  if (MontaSelect.RetornouValor) then
    Cds.Data := CtrlHistPessoa.ListEmpregado(StrToFloat(MontaSelect.ValoresChave[0]))
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

  if (MontaSelect.RetornouValor) and not(Cds.IsEmpty) then
    CdsDet.Data := CtrlHistPessoa.ListBeneficios(Cds.FieldByName('IDPESSOA').asFloat)
  else
  if (Cds.IsEmpty) then
    CdsDet.Data := CtrlHistPessoa.ListBeneficios(-1);

  TFloatField(CdsDet.FieldByName('VALORRUBRICA')).DisplayFormat := '###,###,##0.00';
end;

end.
