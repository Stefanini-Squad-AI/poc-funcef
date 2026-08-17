{ALterações:}
{Nome     : Henrique Massão
SOL       : 117141
Kintana   : 594895
Rotina    : gbxTipContra
Descrição :  Alterar os tipos de contrato no módulo conforme segue: Efetivo - manter o mesmo
  Efetivo Especial - alterar para LEF
  Temporário - alterar para Terceirizado
  Estagiário - manter o mesmo
  Terceiro - alterar para Cessão
  Prop/Dir s/Vinc - manter o mesmo
  Autônomo - - manter o mesmo
  Não é necessário alterar a nomenclatura utilizada nas fórmulas de cálculo das rubricas,
  mas em todos os relatórios e telas em que a informação aparece.}


unit fParamCadDependente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, wwdblook, Spin, checklst,
  IvDictio, IvMulti, IvEMulti, DBGrids, ComCtrls, wwdbdatetimepicker, CMDateTimePicker,
  fParamReports_Padrao, CmParamReport, DBClient, uCMClientDataSet, uCtrlPessoaFilialPessoa,
  uCtrlPessoaFuncionario, uCtrlListTerceirosRH, ColorCheckListBox;

type
  TTipoRelatorio = (tprDeclaracao, tprRelacao);

  TfrmParamCadDependente = class(TfrmParamReports_Padrao)
    gbxFunc: TGroupBox;
    pgctrlEmpregados: TPageControl;
    tbshListaFunc: TTabSheet;
    chklstFunc: TColorCheckListBox;
    bbtnInverteSel: TBitBtn;
    bbtnSelTodos: TBitBtn;
    tbshFiltroFunc: TTabSheet;
    gbxTipContra: TGroupBox;
    cbxEfetivos: TCheckBox;
    cbxEspeciais: TCheckBox;
    cbxTemporarios: TCheckBox;
    cbxEstagiarios: TCheckBox;
    cbxTerceiros: TCheckBox;
    cbxPropDirSemVinc: TCheckBox;
    cbxAutonomos: TCheckBox;
    gbxSituacao: TGroupBox;
    cbxAtivos: TCheckBox;
    cbxAfastados: TCheckBox;
    gbxDependente: TGroupBox;
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    pgctrlDepend: TPageControl;
    tbshTipoDepend: TTabSheet;
    tbshOpcoes: TTabSheet;
    GroupBox2: TGroupBox;
    cbxMasculinoDep: TCheckBox;
    cbxFemininoDep: TCheckBox;
    chklstTipoDepend: TColorCheckListBox;
    gbxIdade: TGroupBox;
    Label5: TLabel;
    ednIda1: TSpinEdit;
    ednIda2: TSpinEdit;
    gbxSexoFunc: TGroupBox;
    cbxMasculinoTit: TCheckBox;
    cbxFemininoTit: TCheckBox;
    CdsEstab: TCMClientDataSet;
    CdsAux: TCMClientDataSet;
    tbshEstabelecimento: TTabSheet;
    chklstEstab: TColorCheckListBox;
    bbtnSelTodosEstab: TBitBtn;
    bbtnInverteSelEstab: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gbxSituacaoEnter(Sender: TObject);
    procedure gbxSituacaoExit(Sender: TObject);
    procedure gbxTipContraEnter(Sender: TObject);
    procedure gbxTipContraExit(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure ednIda1Change(Sender: TObject);
    procedure ednIda2Change(Sender: TObject);
    procedure cbxMasculinoTitClick(Sender: TObject);
    procedure bbtnSelTodosEstabClick(Sender: TObject);
    procedure bbtnInverteSelEstabClick(Sender: TObject);
    procedure chklstEstabClickCheck(Sender: TObject);
  private
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;

    bTipContrEfet, bTipContrEspec, bTipContrTemp, bTipContrEst, bTipContrTerc,
    bTipContrProp, bTipContrAut, bSitAtivo, bSitAfast: boolean;
    Tipo: TTipoRelatorio;
    ListaIdFunc, ListaCodTipoDepend, ListaIdEstab: TStringList;
    sListaIdEstabSel: string;

    procedure MontaListaFuncionarios;    
    procedure HabilitaBtOk;
  public
    constructor Create(AOwner: TComponent; TipoRelatorio: TTipoRelatorio); reintroduce;
  end;

var
  frmParamCadDependente: TfrmParamCadDependente;

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH, fAguarde, RCadDependente,
  uCtrlUsoGeralRH;

{$R *.DFM}

constructor TfrmParamCadDependente.Create(AOwner: TComponent; TipoRelatorio: TTipoRelatorio);
begin
  Tipo := TipoRelatorio;
  inherited Create(AOwner);
end;

procedure TfrmParamCadDependente.FormCreate(Sender: TObject);
var
  c: byte;
begin
  inherited;
  ListaIdFunc := TStringList.Create;
  ListaCodTipoDepend := TStringList.Create;
  ListaIdEstab := TStringList.Create;

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  // Preenche ChkList de Estabelecimentos
  c := 0;
  CdsEstab.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));
  while not(CdsEstab.EOF) do
  begin
    ListaIdEstab.Add(CdsEstab.FieldByName('IDPESSOA').asString);
    chklstEstab.Items.Add(CdsEstab.FieldByName('NOME').asString);
    chklstEstab.Checked[c] := true;
    CdsEstab.Next;
    Inc(c);
  end;

  // Monto a Lista de Tipos de Dependência
  chklstTipoDepend.Items.Clear;
  ListaCodTipoDepend.Clear;
  CdsAux.Data := CtrlListTerceirosRH.ListTipoDependencia;
  while not(CdsAux.EOF) do
  begin
    ListaCodTipoDepend.Add(CdsAux.FieldByName('IDDEPENDENCIA').asString);
    chklstTipoDepend.Items.Add(CdsAux.FieldByName('DESCRICAO').asString);
    CdsAux.Next;
  end;

  if (Tipo = tprDeclaracao) then
    Caption := 'Declaração de Dependentes para Fins de Imposto de Renda'
  else
    Caption := 'Relação de Dependentes';

  cmbOrderBy.ItemIndex := 0;
  pgctrlEmpregados.ActivePageIndex := 0;
  pgctrlDepend.ActivePageIndex := 0;

  MontaListaFuncionarios;
  HabilitaBtOk;
end;

procedure TfrmParamCadDependente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(ListaCodTipoDepend);
  FreeAndNil(ListaIdFunc);
  FreeAndNil(ListaIdEstab);
  inherited;
end;

procedure TfrmParamCadDependente.ednIda1Change(Sender: TObject);
begin
  if (ednIda1.Value > ednIda2.Value) then
    ednIda1.Value := ednIda2.Value;
end;

procedure TfrmParamCadDependente.ednIda2Change(Sender: TObject);
begin
  if (ednIda2.Value < ednIda1.Value) then
    ednIda2.Value := ednIda1.Value;
end;

procedure TfrmParamCadDependente.gbxTipContraEnter(Sender: TObject);
begin
  bTipContrEfet := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp := cbxTemporarios.Checked;
  bTipContrEst := cbxEstagiarios.Checked;
  bTipContrTerc := cbxTerceiros.Checked;
  bTipContrProp := cbxPropDirSemVinc.Checked;
  bTipContrAut := cbxAutonomos.Checked;
end;

procedure TfrmParamCadDependente.gbxSituacaoEnter(Sender: TObject);
begin
  bSitAtivo := (cbxAtivos.Checked);
  bSitAfast := (cbxAfastados.Checked);
end;

procedure TfrmParamCadDependente.gbxTipContraExit(Sender: TObject);
begin
  if not(cbxEfetivos.Checked) and not(cbxEspeciais.Checked) and not(cbxTemporarios.Checked) and
     not(cbxTerceiros.Checked) and not(cbxPropDirSemVinc.Checked) and
     not(cbxAutonomos.Checked) and not(cbxEstagiarios.Checked) then
  begin
    MsgDlg('Pelo menos um Tipo de Contrato deve ser selecionado.', 'Aviso',
      mtWarning, [mbOk,mbHelp], 0);
    cbxEfetivos.SetFocus;
  end
  else
  if (bTipContrEfet <> cbxEfetivos.Checked) or (bTipContrEspec <> cbxEspeciais.Checked) or
     (bTipContrTemp <> cbxTemporarios.Checked) or (bTipContrEst <> cbxEstagiarios.Checked) or
     (bTipContrTerc <> cbxTerceiros.Checked) or (bTipContrProp <> cbxPropDirSemVinc.Checked) or
     (bTipContrAut <> cbxAutonomos.Checked) then
    MontaListaFuncionarios;
end;

procedure TfrmParamCadDependente.gbxSituacaoExit(Sender: TObject);
begin
  if not(cbxAtivos.Checked) and not(cbxAfastados.Checked) then
  begin
    MsgDlg('Pelo menos um Tipo de Situação deve ser selecionado.', 'Aviso',
      mtWarning, [mbOk,mbHelp], 0);
    cbxAtivos.SetFocus;
  end
  else
  if (bSitAtivo <> cbxAtivos.Checked) or (bSitAfast <> cbxAfastados.Checked) then
    MontaListaFuncionarios;
end;

procedure TfrmParamCadDependente.cbxMasculinoTitClick(Sender: TObject);
begin
  MontaListaFuncionarios;
end;

procedure TfrmParamCadDependente.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := true;
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamCadDependente.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamCadDependente.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
  sIdFuncSel, sCodTipoDependSel: string;
begin
  inherited;
  // Empregados escolhidos
  wNum := FU.CriaListaOpcoes(chklstFunc, ListaIdFunc, sIdFuncSel, ',', false);
  if (wNum = ListaIdFunc.Count) then
    sIdFuncSel := '';

  // Empregados escolhidos
  FU.CriaListaOpcoes(chklstTipoDepend, ListaCodTipoDepend, sCodTipoDependSel, ',', true);

  Cmp_Padrao.ParamByName('ListaIdEstab').asString := sListaIdEstabSel;
  Cmp_Padrao.ParamByName('CodFuncSel').asString := sIdFuncSel;
  Cmp_Padrao.ParamByName('SitFunc').asString := FU.GerarListaSitFuncSel(cbxAtivos.Checked,
    cbxAfastados.Checked, false, true);
  Cmp_Padrao.ParamByName('TipoContrato').asString := FU.GerarListaTipoContratoSel(
    cbxEfetivos.Checked, cbxEspeciais.Checked, cbxTemporarios.Checked, cbxTerceiros.Checked,
    cbxPropDirSemVinc.Checked, cbxAutonomos.Checked, cbxEstagiarios.Checked, true);
  Cmp_Padrao.ParamByName('CodTipoDependSel').asString := sCodTipoDependSel;
  Cmp_Padrao.ParamByName('SexoTitular').asString := FU.GerarListaSexoSel(
    cbxMasculinoTit.Checked, cbxFemininoTit.Checked, true);
  Cmp_Padrao.ParamByName('SexoDependente').asString := FU.GerarListaSexoSel(
    cbxMasculinoDep.Checked, cbxFemininoDep.Checked, true);
  Cmp_Padrao.ParamByName('FaixaEtariaIni').asInteger := ednIda1.Value;
  Cmp_Padrao.ParamByName('FaixaEtariaFin').asInteger := ednIda2.Value;
  Cmp_Padrao.ParamByName('Ordenacao').asInteger := cmbOrderBy.ItemIndex;

  frmAguarde.Mostra(Caption);
  frmAguarde.Pos := 0;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmParamCadDependente.MontaListaFuncionarios;
begin
  // Estabelecimentos selecionados
  FU.CriaListaOpcoes(chklstEstab, ListaIdEstab, sListaIdEstabSel, ',', false);
  ListaIdFunc.Clear;
  chklstFunc.Items.Clear;

  if (sListaIdEstabSel <> '') then
  begin
    CdsAux.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(Sistema.IdEmpresa, '',
      sListaIdEstabSel, FU.GerarListaSitFuncSel(cbxAtivos.Checked,
      cbxAfastados.Checked, false), FU.GerarListaTipoContratoSel(cbxEfetivos.Checked,
      cbxEspeciais.Checked, cbxTemporarios.Checked, cbxTerceiros.Checked,
      cbxPropDirSemVinc.Checked, cbxAutonomos.Checked, cbxEstagiarios.Checked),
      FU.GerarListaSexoSel(cbxMasculinoTit.Checked, cbxFemininoTit.Checked));

    while not(CdsAux.EOF) do
    begin
      ListaIdFunc.Add(CdsAux.FieldByName('IDPESSOA').asString);
      chklstFunc.Items.Add(CdsAux.FieldByName('NOME').asString);
      CdsAux.Next;
    end;
  end;
  HabilitaBtOk;
end;

procedure TfrmParamCadDependente.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := (sListaIdEstabSel <> '') and (chklstFunc.Items.Count > 0);
end;

procedure TfrmParamCadDependente.bbtnSelTodosEstabClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := true;
  chklstEstab.Repaint;
  MontaListaFuncionarios;
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamCadDependente.bbtnInverteSelEstabClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := not(chklstEstab.Checked[c]);
  chklstEstab.Repaint;
  MontaListaFuncionarios;
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamCadDependente.chklstEstabClickCheck(Sender: TObject);
begin
  inherited;
  MontaListaFuncionarios;
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

end.
