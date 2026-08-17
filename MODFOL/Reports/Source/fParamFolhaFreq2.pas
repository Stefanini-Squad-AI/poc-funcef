{Nome     : Henrique Massão
SOL       : 117141
Kintana   : 594895
Data:     : 20/08/2009
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

unit fParamFolhaFreq2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, wwdblook, Spin, checklst,
  IvDictio, IvMulti, IvEMulti, ComCtrls, fSairAjuda, fParamReports_Padrao, CmParamReport,
  DBClient, uCMClientDataSet, uCtrlPessoaFilialPessoa, uCtrlGlobalRH,
  uCtrlPessoaFuncionario, uCtrlCargo, ColorCheckListBox;

type
  TfrmParamFolhaFreq2 = class(TfrmParamReports_Padrao)
    gbxAnoMesRef: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    gbxFunc: TGroupBox;
    pgctrlEmpregados: TPageControl;
    tbshListaFunc: TTabSheet;
    chklstFunc: TColorCheckListBox;
    bbtnSelTodosFunc: TBitBtn;
    bbtnInverteSelFunc: TBitBtn;
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
    cbxDemitidos: TCheckBox;
    CdsEstab: TCMClientDataSet;
    tbshCargos: TTabSheet;
    chklstCargo: TColorCheckListBox;
    bbtnSelTodosCargo: TBitBtn;
    bbtnInverteSelCargo: TBitBtn;
    cbxImprimeHorarios: TCheckBox;
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
    procedure chklstFuncClickCheck(Sender: TObject);
    procedure bbtnSelTodosFuncClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
    procedure speAnoChange(Sender: TObject);
    procedure bbtnSelTodosCargoClick(Sender: TObject);
    procedure bbtnInverteSelCargoClick(Sender: TObject);
    procedure bbtnSelTodosEstabClick(Sender: TObject);
    procedure bbtnInverteSelEstabClick(Sender: TObject);
    procedure chklstEstabClickCheck(Sender: TObject);
  private
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlCargo: TCtrlCargo;    

    ListaIdFunc, ListaIdCargo, ListaIdEstab: TStringList;

    sListaIdEstabSel: string;
    FlgDoisCargos: integer;
    bSitAtivo, bSitAfast, bSitDemit, bTipContrEfet, bTipContrEspec, bTipContrTemp,
    bTipContrEst, bTipContrTerc, bTipContrProp, bTipContrAut: boolean;

    procedure MontaListaFuncionarios;
    procedure HabilitaBtOk;
  end;

var
  frmParamFolhaFreq2: TfrmParamFolhaFreq2;

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH, fAguarde, dCds, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmParamFolhaFreq2.FormCreate(Sender: TObject);
var
  c: byte;
begin
  inherited;
  ListaIdEstab := TStringList.Create;

  // Monta a Lista de Cragos
  CtrlCargo := TCtrlCargo.Create;
  CtrlCargo.InitializeAs(Padroes);
  ListaIdCargo := TStringList.Create;
  chklstCargo.Items.BeginUpdate;
  dmCds.Cds.Data := CtrlCargo.ListCargo;
  chklstCargo.Items.Clear;
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdCargo.Add(dmCds.Cds.FieldByName('IDCARGO').asString);
    chklstCargo.Items.Add(dmCds.Cds.FieldByName('TITULO').asString);
    dmCds.Cds.Next;
  end;
  chklstCargo.Items.EndUpdate;

  ListaIdFunc := TStringList.Create;

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  dmCds.Cds.Data := CtrlGlobalRH.GetParamRH('NORMALINI, FLGDOISCARGOS');
  cmbMes.ItemIndex := FU.ExtraiMes(dmCds.Cds.FieldByName('NORMALINI').asDateTime) - 1;
  speAno.Text := IntToStr(FU.ExtraiAno(dmCds.Cds.FieldByName('NORMALINI').asDateTime));
  FlgDoisCargos := dmCds.Cds.FieldByName('FLGDOISCARGOS').asInteger;

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

  cmbOrderBy.ItemIndex := 0;
  pgctrlEmpregados.ActivePageIndex := 0;

  MontaListaFuncionarios;
end;

procedure TfrmParamFolhaFreq2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlCargo);
  FreeAndNil(ListaIdFunc);
  FreeAndNil(ListaIdCargo);
  FreeAndNil(ListaIdEstab);
  inherited;
end;

procedure TfrmParamFolhaFreq2.speAnoChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamFolhaFreq2.gbxTipContraEnter(Sender: TObject);
begin
  bTipContrEfet := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp := cbxTemporarios.Checked;
  bTipContrEst := cbxEstagiarios.Checked;
  bTipContrTerc := cbxTerceiros.Checked;
  bTipContrProp := cbxPropDirSemVinc.Checked;
  bTipContrAut := cbxAutonomos.Checked;
end;

procedure TfrmParamFolhaFreq2.gbxSituacaoEnter(Sender: TObject);
begin
  bSitAtivo := (cbxAtivos.Checked);
  bSitAfast := (cbxAfastados.Checked);
  bSitDemit := (cbxDemitidos.Checked);
end;

procedure TfrmParamFolhaFreq2.gbxTipContraExit(Sender: TObject);
begin
  if not(cbxEfetivos.Checked) and not(cbxEspeciais.Checked) and
     not(cbxTemporarios.Checked) and not(cbxTerceiros.Checked) and
     not(cbxPropDirSemVinc.Checked) and not(cbxAutonomos.Checked) and
     not(cbxEstagiarios.Checked) then
  begin
    MsgDlg('Pelo menos um Tipo de Contrato deve ser selecionado.', 'Aviso',
      mtInformation, [mbOk,mbHelp], 0);
    cbxEfetivos.SetFocus;
  end
  else
  if (bTipContrEfet <> cbxEfetivos.Checked) or (bTipContrEspec <> cbxEspeciais.Checked) or
     (bTipContrTemp <> cbxTemporarios.Checked) or (bTipContrEst <> cbxEstagiarios.Checked) or
     (bTipContrTerc <> cbxTerceiros.Checked) or (bTipContrProp <> cbxPropDirSemVinc.Checked) or
     (bTipContrAut <> cbxAutonomos.Checked) then
    MontaListaFuncionarios;
end;

procedure TfrmParamFolhaFreq2.gbxSituacaoExit(Sender: TObject);
begin
  if not(cbxAtivos.Checked) and not(cbxAfastados.Checked) and not(cbxDemitidos.Checked) then
  begin
    MsgDlg('Pelo menos um Tipo de Situação deve ser selecionado.', 'Aviso',
      mtInformation, [mbOk,mbHelp], 0);
    cbxAtivos.SetFocus;
  end
  else
  if (bSitAtivo <> cbxAtivos.Checked) or (bSitAfast <> cbxAfastados.Checked) or
     (bSitDemit <> cbxDemitidos.Checked) then
    MontaListaFuncionarios;
end;

procedure TfrmParamFolhaFreq2.chklstFuncClickCheck(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
end;

procedure TfrmParamFolhaFreq2.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := true;
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamFolhaFreq2.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamFolhaFreq2.bbtnSelTodosCargoClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstCargo.Items.Count-1 do
    chklstCargo.Checked[c] := true;
  chklstCargo.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamFolhaFreq2.bbtnInverteSelCargoClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstCargo.Items.Count-1 do
    chklstCargo.Checked[c] := not(chklstCargo.Checked[c]);
  chklstCargo.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamFolhaFreq2.bbtnConfirmarClick(Sender: TObject);
var
  wNum, wCar: word;
  sListaIdFuncSel, sListaIdCargoSel: string;
begin
  // Empregados escolhidos
  wNum := FU.CriaListaOpcoes(chklstFunc, ListaIdFunc, sListaIdFuncSel, ',', false);
  if (wNum = ListaIdFunc.Count) then
    sListaIdFuncSel := '';

  wCar := FU.CriaListaOpcoes(chklstCargo, ListaIdCargo, sListaIdCargoSel, ',', false);
  if (wCar = ListaIdCargo.Count) then
    sListaIdCargoSel := '';

  Cmp_Padrao.ParamByName('ListaIdEstab').asString := sListaIdEstabSel;
  Cmp_Padrao.ParamByName('AnoRef').asInteger := speAno.Value;
  Cmp_Padrao.ParamByName('MesRef').asInteger := cmbMes.ItemIndex+1;
  Cmp_Padrao.ParamByName('ListaIdFunc').asString := sListaIdFuncSel;
  Cmp_Padrao.ParamByName('ListaIdCargo').asString := sListaIdCargoSel;
  Cmp_Padrao.ParamByName('TipoContrato').asString := FU.GerarListaTipoContratoSel(
    cbxEfetivos.Checked, cbxEspeciais.Checked, cbxTemporarios.Checked, cbxTerceiros.Checked,
    cbxPropDirSemVinc.Checked, cbxAutonomos.Checked, cbxEstagiarios.Checked, true);
  Cmp_Padrao.ParamByName('SitFunc').asString := FU.GerarListaSitFuncSel(cbxAtivos.Checked,
    cbxAfastados.Checked, cbxDemitidos.Checked, true);
  Cmp_Padrao.ParamByName('FlgDoisCargos').asInteger := FlgDoisCargos;
  Cmp_Padrao.ParamByName('ImprimeHorarios').asBoolean := cbxImprimeHorarios.Checked;
  Cmp_Padrao.ParamByName('Ordenacao').asInteger := cmbOrderBy.ItemIndex;

  frmAguarde.Mostra('Folha de Frequência - II');
  frmAguarde.Pos := 0;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmParamFolhaFreq2.MontaListaFuncionarios;
begin
  // Estabelecimentos selecionados
  FU.CriaListaOpcoes(chklstEstab, ListaIdEstab, sListaIdEstabSel, ',', false);

  ListaIdFunc.Clear;
  chklstFunc.Items.Clear;

  if (sListaIdEstabSel <> '') then
  begin
    dmCds.Cds.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(Sistema.IdEmpresa,
      '', sListaIdEstabSel, FU.GerarListaSitFuncSel(cbxAtivos.Checked,
      cbxAfastados.Checked, cbxDemitidos.Checked), FU.GerarListaTipoContratoSel(
      cbxEfetivos.Checked, cbxEspeciais.Checked, cbxTemporarios.Checked, cbxTerceiros.Checked,
      cbxPropDirSemVinc.Checked, cbxAutonomos.Checked, cbxEstagiarios.Checked),
      '', '', '', '', '', false, 0, 0, -1, 0);

    while not(dmCds.Cds.EOF) do
    begin
      ListaIdFunc.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
      chklstFunc.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
      dmCds.Cds.Next;
    end;
  end;
  HabilitaBtOk;
end;

procedure TfrmParamFolhaFreq2.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := (sListaIdEstabSel <> '') and (Trim(speAno.Text) <> '') and
                           (chklstFunc.Items.Count > 0);
end;

procedure TfrmParamFolhaFreq2.bbtnSelTodosEstabClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := true;
  chklstEstab.Repaint;
  MontaListaFuncionarios;
end;

procedure TfrmParamFolhaFreq2.bbtnInverteSelEstabClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := not(chklstEstab.Checked[c]);
  chklstEstab.Repaint;
  MontaListaFuncionarios;
end;

procedure TfrmParamFolhaFreq2.chklstEstabClickCheck(Sender: TObject);
begin
  inherited;
  MontaListaFuncionarios;
end;

end.
