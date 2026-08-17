unit fParamAcessoPessEstacao;
// Acessos e/ou Marcação de Ponto por Pessoa = 4055
// Acessos e/ou Marcação de Ponto por Estação = 4056
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelPessoalMT,
  DBTables, Db, Wwdatsrc, MAHlpBtn, StdCtrls, Buttons, TEdNum, Spin, wwdblook, ExtCtrls,
  Qrctrls, quickrpt, TB97, ComCtrls, TB97Tlbr, IvDictio, IvMulti, CMDateTimePicker,
  CheckLst, wwdbdatetimepicker, MontaSelect, uCmSqlParams, DBClient, uCMClientDataSet,
  CmParamReport, ColorCheckListBox, Mask, IniFiles, uCtrlEstacaoAcesso,
  IvEMulti, uCtrlPessoaFuncionario;

type                                                        
  TTipoRelatAcesso = (tpRelatPorPessoa, tpRelatPorEstacao);

  TfrmParamAcessoPessEstacao = class(TfrmSelPessoalMT)
    tbshRelatorio: TTabSheet;
    gbxFaixaData: TGroupBox;
    edData1: TCMDateTimePicker;
    edData2: TCMDateTimePicker;
    Label9: TLabel;
    gbxOcorr: TGroupBox;
    chklstEstacao: TColorCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    rgTipo: TRadioGroup;
    gbxTurnos: TGroupBox;
    mkedInicio1: TMaskEdit;
    mkedFinal1: TMaskEdit;
    edNome1: TEdit;
    mkedInicio2: TMaskEdit;
    mkedFinal2: TMaskEdit;
    edNome2: TEdit;
    mkedInicio3: TMaskEdit;
    mkedFinal3: TMaskEdit;
    edNome3: TEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    rgTipoRel: TRadioGroup;
    CdsFunc: TCMClientDataSet;
    rgSelecao: TRadioGroup;
    dblckFunc: TwwDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure edData1Exit(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LeAlteracoes;
    procedure GravaAlteracoes;
    procedure rgSelecaoClick(Sender: TObject);
  private
    CtrlEstacaoAcesso: TCtrlEstacaoAcesso;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;

    ListaCodEstacao: TStringList;
    ArqConfig: TIniFile;
    Tipo: TTipoRelatAcesso;

    procedure HabilitaOpcoes(Habilita: boolean);
    procedure HabilitaBtOk;
  public
    constructor Create(AOwner: TComponent; TipoRelatorio: TTipoRelatAcesso); reintroduce;
  end;

var
  frmParamAcessoPessEstacao: TfrmParamAcessoPessEstacao;

implementation

uses uSistema, uCtrlPadroes, uCtrlFuncoesRH, fAguarde, dCds, uCtrlUsoGeralRH;

{$R *.DFM}

constructor TfrmParamAcessoPessEstacao.Create(AOwner: TComponent;
  TipoRelatorio: TTipoRelatAcesso);
begin
  Tipo := TipoRelatorio;
  inherited Create(AOwner);
end;

procedure TfrmParamAcessoPessEstacao.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlEstacaoAcesso := TCtrlEstacaoAcesso.Create;
  CtrlEstacaoAcesso.InitializeAs(Padroes);

  ListaCodEstacao := TStringList.Create;

  // Lista de Estações
  dmCds.Cds.Data := CtrlEstacaoAcesso.ListEstacaoAcesso(0);
  while not(dmCds.Cds.EOF) do
  begin
    ListaCodEstacao.Add(dmCds.Cds.FieldByName('IDESTACAOACESSO').asString);
    chklstEstacao.Items.Add(dmCds.Cds.FieldByName('ESTACAO').asString +
      ' - ' + dmCds.Cds.FieldByName('DESCRICAO').asString);
    dmCds.Cds.Next;
  end;

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  rgSelecao.Visible := (Tipo = tpRelatPorPessoa);
  CdsFunc.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(Sistema.IdEmpresa);
  dblckFunc.LookupValue := CdsFunc.FieldByName('IDPESSOA').asString;
  dblckFunc.Update;

  edData1.Date := (Date - 30);
  edData2.Date := (Date);
  pgctrlPrincipal.ActivePage := tbshRelatorio;
  IrPaginaResult := false;

  if (Tipo = tpRelatPorPessoa) then
    Self.Caption := fu.CMTranslate('Relatório de Acessos e/ou Marcação de Ponto por Pessoa')
  else
    Self.Caption := fu.CMTranslate('Relatório de Acessos e/ou Marcação de Ponto por Estação');

  // Carrega alterações nas opções feitas anteriormente
  LeAlteracoes;
end;

procedure TfrmParamAcessoPessEstacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlEstacaoAcesso);
  FreeAndNil(ListaCodEstacao);
  GravaAlteracoes;
  inherited;
end;

procedure TfrmParamAcessoPessEstacao.edData1Exit(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamAcessoPessEstacao.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstacao.Items.Count-1 do
    chklstEstacao.Checked[c] := true;
  chklstEstacao.Repaint;
end;

procedure TfrmParamAcessoPessEstacao.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstacao.Items.Count-1 do
    chklstEstacao.Checked[c] := not(chklstEstacao.Checked[c]);
  chklstEstacao.Repaint;
end;

procedure TfrmParamAcessoPessEstacao.bbtnConfirmarClick(Sender: TObject);
var
  sListaIdFuncSel, sListaCodEstacaoSel: string;
begin
  if (Tipo = tpRelatPorPessoa) then
    frmAguarde.Mostra(fu.CMTranslate('Acessos e/ou Marcação de Ponto por Pessoa'))
  else
    frmAguarde.Mostra(fu.CMTranslate('Acessos e/ou Marcação de Ponto por Estação'));

  FU.CriaListaOpcoes(chklstEstacao, ListaCodEstacao, sListaCodEstacaoSel, ',', false);
  frmAguarde.Pos := 0;
  sListaIdFuncSel := '';

  if (rgSelecao.ItemIndex = 1) then
  begin
    inherited;
    while not(CdsPrincipal.EOF) do
    begin
      if (sListaIdFuncSel = '') then
        sListaIdFuncSel := CdsPrincipal.FieldByName('IDPESSOA').asString
      else
        sListaIdFuncSel := sListaIdFuncSel +','+ CdsPrincipal.FieldByName('IDPESSOA').asString;

      CdsPrincipal.Next;
    end;
  end
  else
    sListaIdFuncSel := CdsFunc.FieldByName('IDPESSOA').asString;

  Cmp_Padrao.ParamByName('NomeEmpresa').asString := Sistema.NomeEmpresa;
  Cmp_Padrao.ParamByName('ListaCodEstacao').asString := sListaCodEstacaoSel;
  Cmp_Padrao.ParamByName('ListaIdFunc').asString := sListaIdFuncSel;
  Cmp_Padrao.ParamByName('DataInicial').asDateTime := edData1.Date;
  Cmp_Padrao.ParamByName('DataFinal').asDateTime := edData2.Date;
  Cmp_Padrao.ParamByName('TipoEstacao').asInteger := rgTipo.ItemIndex;
  Cmp_Padrao.ParamByName('TipoRel').asInteger := rgTipoRel.ItemIndex;
  Cmp_Padrao.ParamByName('Nome1').asString := edNome1.Text;
  Cmp_Padrao.ParamByName('Nome2').asString := edNome2.Text;
  Cmp_Padrao.ParamByName('Nome3').asString := edNome3.Text;
  Cmp_Padrao.ParamByName('Inicio1').asString := mkedInicio1.Text;
  Cmp_Padrao.ParamByName('Inicio2').asString := mkedInicio2.Text;
  Cmp_Padrao.ParamByName('Inicio3').asString := mkedInicio3.Text;
  Cmp_Padrao.ParamByName('Final1').asString := mkedFinal1.Text;
  Cmp_Padrao.ParamByName('Final2').asString := mkedFinal2.Text;
  Cmp_Padrao.ParamByName('Final3').asString := mkedFinal3.Text;
end;

// ------------------------------------------------------------------------------------------
// Funções do Form
// ------------------------------------------------------------------------------------------

procedure TfrmParamAcessoPessEstacao.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := (Trim(edData1.Text) <> '') and (Trim(edData2.Text) <> '') and
    (edData1.Date <= edData2.Date);
end;

procedure TfrmParamAcessoPessEstacao.LeAlteracoes;
begin
  // Recupera as últimas alterações das opções
  ArqConfig := TIniFile.Create(FU.ArqConfig);
  mkedInicio1.Text := ArqConfig.ReadString('RELACESSO', 'Inicio1', '00:00');
  mkedInicio2.Text := ArqConfig.ReadString('RELACESSO', 'Inicio2', '00:00');
  mkedInicio3.Text := ArqConfig.ReadString('RELACESSO', 'Inicio3', '00:00');
  mkedFinal1.Text := ArqConfig.ReadString('RELACESSO', 'Final1', '00:00');
  mkedFinal2.Text := ArqConfig.ReadString('RELACESSO', 'Final2', '00:00');
  mkedFinal3.Text := ArqConfig.ReadString('RELACESSO', 'Final3', '00:00');
  edNome1.Text := ArqConfig.ReadString('RELACESSO', 'Nome1', ' ');
  edNome2.Text := ArqConfig.ReadString('RELACESSO', 'Nome2', ' ');
  edNome3.Text := ArqConfig.ReadString('RELACESSO', 'Nome3', ' ');
end;

procedure TfrmParamAcessoPessEstacao.GravaAlteracoes;
begin
  // Grava as últimas alterações da Opção de Rubricas
  ArqConfig.WriteString('RELACESSO', 'Inicio1', mkedInicio1.Text);
  ArqConfig.WriteString('RELACESSO', 'Inicio2', mkedInicio2.Text);
  ArqConfig.WriteString('RELACESSO', 'Inicio3', mkedInicio3.Text);
  ArqConfig.WriteString('RELACESSO', 'Final1', mkedFinal1.Text);
  ArqConfig.WriteString('RELACESSO', 'Final2', mkedFinal2.Text);
  ArqConfig.WriteString('RELACESSO', 'Final3', mkedFinal3.Text);
  ArqConfig.WriteString('RELACESSO', 'Nome1', edNome1.Text);
  ArqConfig.WriteString('RELACESSO', 'Nome2', edNome2.Text);
  ArqConfig.WriteString('RELACESSO', 'Nome3', edNome3.Text);
end;

procedure TfrmParamAcessoPessEstacao.HabilitaOpcoes(Habilita: boolean);
begin
  tsDadosFunc.TabVisible := Habilita;
  tsDadosPess.TabVisible := Habilita;
  tsDadosOutros.TabVisible := Habilita;
  tbsDemit.TabVisible := Habilita;
end;

procedure TfrmParamAcessoPessEstacao.rgSelecaoClick(Sender: TObject);
begin
  inherited;
  dblckFunc.Visible := (rgSelecao.ItemIndex = 0);
  HabilitaOpcoes(not(dblckFunc.Visible));
  HabilitaBtOk;
end;

end.
