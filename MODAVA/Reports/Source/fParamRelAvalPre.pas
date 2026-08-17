unit fParamRelAvalPre;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, ComCtrls,
  MontaSelect, wwdblook, Db, DBClient, uCMClientDataSet, Grids, Wwdbigrd, Wwdbgrid,
  Wwdatsrc, CmParamReport, fParamReports_Padrao, uCtrlRegAval;

type
  TfrmParamRelAvalPre = class(TfrmParamReports_Padrao)
    gbxNome: TGroupBox;
    sbtnProcurar: TSpeedButton;
    memNome: TMemo;
    MontaSelect: TMontaSelect;
    dsHstAval: TwwDataSource;
    wwDBGrid1: TwwDBGrid;
    CdsHstAval: TCMClientDataSet;
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    rgObserv: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlRegAval: TCtrlRegAval;

    sIdPessoaAvalPre: string;

    procedure HabilitaBtOk;
  public
    TipoParam: byte; // Tipo do Layout do Formulário
    NumCarta: string; // Número da carta a ser impressa
  end;

var
  frmParamRelAvalPre: TfrmParamRelAvalPre;

implementation

uses uSistema, uCtrlPadroes, uCtrlUsoGeralRH, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmParamRelAvalPre.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRegAval := TCtrlRegAval.Create;
  CtrlRegAval.InitializeAs(Padroes);

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
  end;

  cmbOrderBy.ItemIndex := 0;

  CdsHstAval.Data := CtrlRegAval.ListMestreAvalDesemp(-1);
  HabilitaBtOk;
end;

procedure TfrmParamRelAvalPre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CdsHstAval);
  inherited;
end;

// Muda o Layout do Formulário para impressão com ou sem a Seleção da Carta e das pessoas
procedure TfrmParamRelAvalPre.sbtnProcurarClick(Sender: TObject);
begin
  MontaSelect.Executar;

  if (MontaSelect.RetornouValor) then
  begin
    sIdPessoaAvalPre := MontaSelect.ValoresChave[0];
    memNome.Text := MontaSelect.ValoresChave[1];
    CdsHstAval.Data := CtrlRegAval.ListMestreAvalDesemp(StrToFloat(sIdPessoaAvalPre));
  end
  else
  begin
    sIdPessoaAvalPre := '';
    memNome.Text := '';
  end;

  sbtnProcurar.Down := false;
  HabilitaBtOk;
end;

procedure TfrmParamRelAvalPre.bbtnConfirmarClick(Sender: TObject);
begin
  Cmp_Padrao.ParamByName('IdPessoa').asFloat := StrToFloat(sIdPessoaAvalPre);
  Cmp_Padrao.ParamByName('TipoAval').asInteger := CdsHstAval.FieldByName('CODTIPOAVAL').asInteger;
  Cmp_Padrao.ParamByName('NumSeq').asInteger := CdsHstAval.FieldByName('NUMSEQ').asInteger;
  Cmp_Padrao.ParamByName('SeqRelat').asInteger := cmbOrderBy.ItemIndex;
  Cmp_Padrao.ParamByName('ComObserv').asInteger := rgObserv.ItemIndex;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmParamRelAvalPre.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := not(CdsHstAval.IsEmpty) and (Trim(memNome.Text) <> '');
end;

end.
