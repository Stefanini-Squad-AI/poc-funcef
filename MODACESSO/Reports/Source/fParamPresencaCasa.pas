unit fParamPresencaCasa;
// Pessoas Presentes no Momento da Emissão (entrada <= hora atual e saída em branco) ou
// no Período Selecionado (Relat. # 4880)
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelPessoalMT,
  DBTables, Db, Wwdatsrc, MAHlpBtn, StdCtrls, Buttons, TEdNum, Spin, wwdblook, ExtCtrls,
  Qrctrls, quickrpt, TB97, ComCtrls, TB97Tlbr, IvDictio, IvMulti, CMDateTimePicker,
  CheckLst, wwdbdatetimepicker, MontaSelect, uCmSqlParams, DBClient, uCMClientDataSet,
  CmParamReport, ColorCheckListBox, Mask, IniFiles, uCtrlEstacaoAcesso,
  IvEMulti, uCtrlPessoaFuncionario;

type
  TfrmParamPresencaCasa = class(TfrmSelPessoalMT)
    tbshRelatorio: TTabSheet;
    gbxEstacao: TGroupBox;
    chklstEstacao: TColorCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    CdsFunc: TCMClientDataSet;
    rgSelecao: TRadioGroup;
    dblckFunc: TwwDBLookupCombo;
    gbxSequenciaRel: TGroupBox;
    cmbSequenciaRel: TComboBox;
    gbxFaixaDataHora: TGroupBox;
    Label9: TLabel;
    edData1: TCMDateTimePicker;
    edData2: TCMDateTimePicker;
    rgOpcao: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rgSelecaoClick(Sender: TObject);
    procedure rgOpcaoClick(Sender: TObject);
  private
    CtrlEstacaoAcesso: TCtrlEstacaoAcesso;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;

    ListaCodEstacao: TStringList;
    ArqConfig: TIniFile;

    procedure HabilitaOpcoes(Habilita: boolean);
  end;

var
  frmParamPresencaCasa: TfrmParamPresencaCasa;

implementation

uses uSistema, uCtrlPadroes, uCtrlFuncoesRH, fAguarde, dCds, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmParamPresencaCasa.FormCreate(Sender: TObject);
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

  CdsFunc.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(Sistema.IdEmpresa);
  dblckFunc.LookupValue := CdsFunc.FieldByName('IDPESSOA').asString;
  dblckFunc.Update;

  pgctrlPrincipal.ActivePage := tbshRelatorio;
  IrPaginaResult := false;

  edData1.Date := (Date);
  edData2.Date := (Date);
  edData2.Time := (Time);

  cmbSequenciaRel.ItemIndex := 0;
end;

procedure TfrmParamPresencaCasa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlEstacaoAcesso);
  FreeAndNil(ListaCodEstacao);
  inherited;
end;

procedure TfrmParamPresencaCasa.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstacao.Items.Count-1 do
    chklstEstacao.Checked[c] := true;
  chklstEstacao.Repaint;
end;

procedure TfrmParamPresencaCasa.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstacao.Items.Count-1 do
    chklstEstacao.Checked[c] := not(chklstEstacao.Checked[c]);
  chklstEstacao.Repaint;
end;

procedure TfrmParamPresencaCasa.bbtnConfirmarClick(Sender: TObject);
var
  sListaIdFuncSel, sListaCodEstacaoSel: string;
begin
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

  Cmp_Padrao.ParamByName('ListaCodEstacao').asString := sListaCodEstacaoSel;
  Cmp_Padrao.ParamByName('ListaIdFunc').asString := sListaIdFuncSel;
  Cmp_Padrao.ParamByName('Sequencia').asInteger := cmbSequenciaRel.ItemIndex;
  Cmp_Padrao.ParamByName('DataInicial').asString := edData1.Text;
  Cmp_Padrao.ParamByName('DataFinal').asString := edData2.Text;
  Cmp_Padrao.ParamByName('Opcao').asInteger := rgOpcao.ItemIndex;
end;

// ------------------------------------------------------------------------------------------
// Funções do Form
// ------------------------------------------------------------------------------------------

procedure TfrmParamPresencaCasa.HabilitaOpcoes(Habilita: boolean);
begin
  tsDadosFunc.TabVisible := Habilita;
  tsDadosPess.TabVisible := Habilita;
  tsDadosOutros.TabVisible := Habilita;
  tbsDemit.TabVisible := Habilita;
end;

procedure TfrmParamPresencaCasa.rgSelecaoClick(Sender: TObject);
begin
  inherited;
  dblckFunc.Visible := (rgSelecao.ItemIndex = 0);
  HabilitaOpcoes(not(dblckFunc.Visible));
end;

procedure TfrmParamPresencaCasa.rgOpcaoClick(Sender: TObject);
begin
  inherited;
  gbxFaixaDataHora.Visible := rgOpcao.ItemIndex = 1;
end;

end.
