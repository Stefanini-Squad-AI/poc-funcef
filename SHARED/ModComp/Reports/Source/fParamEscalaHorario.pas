unit fParamEscalaHorario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, wwdblook, Spin, checklst,
  IvDictio, IvMulti, ComCtrls, fSairAjuda, fParamReports_Padrao, CmParamReport, DBClient,
  uCMClientDataSet, ColorCheckListBox, uCtrlPessoaFilialPessoa, uCtrlGlobalRH,
  uCtrlPessoaFuncionario, uCtrlCargo, uCtrlListTerceirosRH, IniFiles,
  IvEMulti;

type
  TfrmParamEscalaHorario = class(TfrmParamReports_Padrao)
    gbxAnoMesRef: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    gbxFunc: TGroupBox;
    pgctrlEmpregados: TPageControl;
    tbshListaFunc: TTabSheet;
    chklstFunc: TColorCheckListBox;
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
    tbshCargos: TTabSheet;
    chklstCargo: TColorCheckListBox;
    cbxImprimeHorarios: TCheckBox;
    tbshEstabelecimento: TTabSheet;
    chklstEstab: TColorCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    tbshCCusto: TTabSheet;
    chklstCCusto: TColorCheckListBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gbxSituacaoEnter(Sender: TObject);
    procedure gbxSituacaoExit(Sender: TObject);
    procedure gbxTipContraEnter(Sender: TObject);
    procedure gbxTipContraExit(Sender: TObject);
    procedure chklstFuncClickCheck(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure speAnoChange(Sender: TObject);
    procedure chklstEstabClickCheck(Sender: TObject);
    procedure pgctrlEmpregadosChange(Sender: TObject);
  private
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlCargo: TCtrlCargo;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;

    ArqConfig: TIniFile;
    chkListAux: TColorCheckListBox;
    ListaIdFunc, ListaIdCargo, ListaIdEstab, ListaCodCCusto: TStringList;

    sListaIdEstabSel,sListaIdCargoSel, sListaCodCCustoSel: string;
    FlgDoisCargos: integer;
    bSitAtivo, bSitAfast, bSitDemit, bTipContrEfet, bTipContrEspec, bTipContrTemp,
    bTipContrEst, bTipContrTerc, bTipContrProp, bTipContrAut: boolean;

    procedure MontaListaFuncionarios;
    procedure HabilitaBtOk;
    procedure LerAlteracoes;
    procedure GravarAlteracoes;
  end;

var
  frmParamEscalaHorario: TfrmParamEscalaHorario;

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH, fAguarde, dCds, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmParamEscalaHorario.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlCargo := TCtrlCargo.Create;
  CtrlCargo.InitializeAs(Padroes);

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  ListaIdEstab := TStringList.Create;
  ListaIdCargo := TStringList.Create;
  ListaIdFunc := TStringList.Create;
  ListaCodCCusto := TStringList.Create;

  // Apagar o índice se este existir
  dmCds.Cds.IndexName := '';
  if (dmCds.Cds.IndexDefs.IndexOf('Index1') > 0) then
    dmCds.Cds.DeleteIndex('Index1');

  // Lista de Cragos
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

  // Lista de Centros de Custo
  chklstCCusto.Items.Clear;
  ListaCodCCusto.Clear;
  dmCds.Cds.Data := CtrlListTerceirosRH.ListCCusto(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaCodCCusto.Add(dmCds.Cds.FieldByName('CODCENTROCUSTO').asString);
    chklstCCusto.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
    dmCds.Cds.Next;
  end;

  // Lista de Estabelecimentos
  dmCds.Cds.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdEstab.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
    chklstEstab.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
    chklstEstab.Checked[chklstEstab.Items.Count-1] := true;
    dmCds.Cds.Next;
  end;

  dmCds.Cds.Data := CtrlGlobalRH.GetParamRH('NORMALINI, FLGDOISCARGOS');
  cmbMes.ItemIndex := FU.ExtraiMes(dmCds.Cds.FieldByName('NORMALINI').asDateTime) - 1;
  speAno.Text := IntToStr(FU.ExtraiAno(dmCds.Cds.FieldByName('NORMALINI').asDateTime));
  FlgDoisCargos := dmCds.Cds.FieldByName('FLGDOISCARGOS').asInteger;

  cmbOrderBy.ItemIndex := 0;
  pgctrlEmpregados.ActivePageIndex := 0;

  LerAlteracoes;
  MontaListaFuncionarios;
  pgctrlEmpregadosChange(nil);
end;

procedure TfrmParamEscalaHorario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravarAlteracoes;

  FreeAndNil(ListaIdFunc);
  FreeAndNil(ListaIdCargo);
  FreeAndNil(ListaIdEstab);
  FreeAndNil(ListaCodCCusto);

  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlCargo);
  FreeAndNil(CtrlListTerceirosRH);
  inherited;
end;

procedure TfrmParamEscalaHorario.pgctrlEmpregadosChange(Sender: TObject);
begin
  bbtnSelTodos.Visible := (pgctrlEmpregados.ActivePageIndex in [0,2,3,4]);
  bbtnInverteSel.Visible := bbtnSelTodos.Visible;

  case (pgctrlEmpregados.ActivePageIndex) of
    0 : chkListAux := chklstFunc;
    2 : chkListAux := chklstCargo;
    3 : chkListAux := chklstEstab;
    4 : chkListAux := chklstCCusto;
  end;
end;

procedure TfrmParamEscalaHorario.speAnoChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamEscalaHorario.gbxTipContraEnter(Sender: TObject);
begin
  bTipContrEfet := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp := cbxTemporarios.Checked;
  bTipContrEst := cbxEstagiarios.Checked;
  bTipContrTerc := cbxTerceiros.Checked;
  bTipContrProp := cbxPropDirSemVinc.Checked;
  bTipContrAut := cbxAutonomos.Checked;
end;

procedure TfrmParamEscalaHorario.gbxSituacaoEnter(Sender: TObject);
begin
  bSitAtivo := cbxAtivos.Checked;
  bSitAfast := cbxAfastados.Checked;
  bSitDemit := cbxDemitidos.Checked;
end;

procedure TfrmParamEscalaHorario.gbxTipContraExit(Sender: TObject);
begin
  if not(cbxEfetivos.Checked) and not(cbxEspeciais.Checked) and
     not(cbxTemporarios.Checked) and not(cbxTerceiros.Checked) and
     not(cbxPropDirSemVinc.Checked) and not(cbxAutonomos.Checked) and
     not(cbxEstagiarios.Checked) then
  begin
    MsgDlg(fu.CMTranslate('Pelo menos um Tipo de Contrato deve ser selecionado.'),
      fu.CMTranslate('Aviso'), mtInformation, [mbOk,mbHelp], 0);
    cbxEfetivos.SetFocus;
  end
  else
  if (bTipContrEfet <> cbxEfetivos.Checked) or (bTipContrEspec <> cbxEspeciais.Checked) or
     (bTipContrTemp <> cbxTemporarios.Checked) or (bTipContrEst <> cbxEstagiarios.Checked) or
     (bTipContrTerc <> cbxTerceiros.Checked) or (bTipContrProp <> cbxPropDirSemVinc.Checked) or
     (bTipContrAut <> cbxAutonomos.Checked) then
    MontaListaFuncionarios;
end;

procedure TfrmParamEscalaHorario.gbxSituacaoExit(Sender: TObject);
begin
  if not(cbxAtivos.Checked) and not(cbxAfastados.Checked) and not(cbxDemitidos.Checked) then
  begin
    MsgDlg(fu.CMTranslate('Pelo menos um Tipo de Situação deve ser selecionado.'),
      fu.CMTranslate('Aviso'), mtInformation, [mbOk,mbHelp], 0);
    cbxAtivos.SetFocus;
  end
  else
  if (bSitAtivo <> cbxAtivos.Checked) or (bSitAfast <> cbxAfastados.Checked) or
     (bSitDemit <> cbxDemitidos.Checked) then
    MontaListaFuncionarios;
end;

procedure TfrmParamEscalaHorario.chklstEstabClickCheck(Sender: TObject);
begin
  MontaListaFuncionarios;
end;

procedure TfrmParamEscalaHorario.chklstFuncClickCheck(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamEscalaHorario.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[c] := true;
  chkListAux.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamEscalaHorario.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[c] := not(chkListAux.Checked[c]);
  chkListAux.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamEscalaHorario.bbtnConfirmarClick(Sender: TObject);
var
  sListaIdFuncSel: string;
begin
  // Empregados escolhidos
  FU.CriaListaOpcoes(chklstFunc, ListaIdFunc, sListaIdFuncSel, ',', false);

  FU.CriaListaOpcoes(chklstCargo, ListaIdCargo, sListaIdCargoSel, ',', false);

  // Centros de Custo escolhidos
  FU.CriaListaOpcoes(chklstCCusto, ListaCodCCusto, sListaCodCCustoSel, ',', true);

  Cmp_Padrao.ParamByName('ListaIdEstab').asString := sListaIdEstabSel;
  Cmp_Padrao.ParamByName('AnoRef').asInteger := speAno.Value;
  Cmp_Padrao.ParamByName('MesRef').asInteger := cmbMes.ItemIndex+1;
  Cmp_Padrao.ParamByName('ListaIdFunc').asString := sListaIdFuncSel;
  Cmp_Padrao.ParamByName('ListaIdCargo').asString := sListaIdCargoSel;
  Cmp_Padrao.ParamByName('ListaCodCCusto').asString := sListaCodCCustoSel;
  Cmp_Padrao.ParamByName('TipoContrato').asString := FU.GerarListaTipoContratoSel(
    cbxEfetivos.Checked, cbxEspeciais.Checked, cbxTemporarios.Checked, cbxTerceiros.Checked,
    cbxPropDirSemVinc.Checked, cbxAutonomos.Checked, cbxEstagiarios.Checked, true);
  Cmp_Padrao.ParamByName('SitFunc').asString := FU.GerarListaSitFuncSel(cbxAtivos.Checked,
    cbxAfastados.Checked, cbxDemitidos.Checked, true);
  Cmp_Padrao.ParamByName('FlgDoisCargos').asInteger := FlgDoisCargos;
  Cmp_Padrao.ParamByName('ImprimeHorarios').asBoolean := cbxImprimeHorarios.Checked;
  Cmp_Padrao.ParamByName('Ordenacao').asInteger := cmbOrderBy.ItemIndex;

  frmAguarde.Mostra(fu.CMTranslate('Escala de Horários'));
  frmAguarde.Pos := 0;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmParamEscalaHorario.MontaListaFuncionarios;
begin
  // Estabelecimentos selecionados
  FU.CriaListaOpcoes(chklstEstab, ListaIdEstab, sListaIdEstabSel, ',', false);

  ListaIdFunc.Clear;
  chklstFunc.Items.BeginUpdate;
  chklstFunc.Items.Clear;

  if (sListaIdEstabSel <> '') then
  begin
    FU.CriaListaOpcoes(chklstCCusto, ListaCodCCusto, sListaCodCCustoSel, ',', false);
    FU.CriaListaOpcoes(chklstCargo, ListaIdCargo, sListaIdCargoSel, ',', false);

    dmCds.Cds.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(Sistema.IdEmpresa,
      '', sListaIdEstabSel, FU.GerarListaSitFuncSel(cbxAtivos.Checked,
      cbxAfastados.Checked, cbxDemitidos.Checked), FU.GerarListaTipoContratoSel(
      cbxEfetivos.Checked, cbxEspeciais.Checked, cbxTemporarios.Checked, cbxTerceiros.Checked,
      cbxPropDirSemVinc.Checked, cbxAutonomos.Checked, cbxEstagiarios.Checked),
      '', sListaCodCCustoSel, '', '',
      '', false, 0, 0, -1, 0, '', 0, 0, 0, 0, False, '', '', 0, 0, 0, True, 0,
      sListaIdCargoSel);

    while not(dmCds.Cds.EOF) do
    begin
      ListaIdFunc.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
      chklstFunc.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
      chklstFunc.Checked[chklstFunc.Items.Count-1] := true;
      dmCds.Cds.Next;
    end;
  end;
  HabilitaBtOk;
  chklstFunc.Items.EndUpdate;
end;

procedure TfrmParamEscalaHorario.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := (sListaIdEstabSel <> '') and (Trim(speAno.Text) <> '') and
    (chklstFunc.Items.Count > 0);
end;

procedure TfrmParamEscalaHorario.LerAlteracoes;
begin
  // Recupera as últimas alterações das opções
  ArqConfig := TIniFile.Create(FU.ArqConfig);

  cbxEfetivos.Checked := (ArqConfig.ReadString('REL_COMP_SALDO', 'Efetivos', 'V') = 'V');
  cbxEspeciais.Checked := (ArqConfig.ReadString('REL_COMP_SALDO', 'Especiais', 'V') = 'V');
  cbxTemporarios.Checked := (ArqConfig.ReadString('REL_COMP_SALDO', 'Temporarios', 'V') = 'V');
  cbxTerceiros.Checked := (ArqConfig.ReadString('REL_COMP_SALDO', 'Terceiros', 'V') = 'V');
  cbxEstagiarios.Checked := (ArqConfig.ReadString('REL_COMP_SALDO', 'Estagiarios', 'V') = 'V');
  cbxPropDirSemVinc.Checked := (ArqConfig.ReadString('REL_COMP_SALDO', 'Proprietarios', 'V') = 'V');
  cbxAutonomos.Checked := (ArqConfig.ReadString('REL_COMP_SALDO', 'Autonomos', 'V') = 'V');

  cbxAtivos.Checked := (ArqConfig.ReadString('REL_COMP_SALDO', 'Ativos', 'V') = 'V');
  cbxAfastados.Checked := (ArqConfig.ReadString('REL_COMP_SALDO', 'Afastados', 'V') = 'V');
  cbxDemitidos.Checked := (ArqConfig.ReadString('REL_COMP_SALDO', 'Demitidos', 'V') = 'V');
end;

procedure TfrmParamEscalaHorario.GravarAlteracoes;
begin
  ArqConfig.WriteString('REL_COMP_SALDO', 'Efetivos', FU.IFF(cbxEfetivos.Checked, 'V', 'F'));
  ArqConfig.WriteString('REL_COMP_SALDO', 'Especiais', FU.IFF(cbxEspeciais.Checked, 'V', 'F'));
  ArqConfig.WriteString('REL_COMP_SALDO', 'Temporarios', FU.IFF(cbxTemporarios.Checked, 'V', 'F'));
  ArqConfig.WriteString('REL_COMP_SALDO', 'Terceiros', FU.IFF(cbxTerceiros.Checked, 'V', 'F'));
  ArqConfig.WriteString('REL_COMP_SALDO', 'Estagiarios', FU.IFF(cbxEstagiarios.Checked, 'V', 'F'));
  ArqConfig.WriteString('REL_COMP_SALDO', 'Proprietarios', FU.IFF(cbxPropDirSemVinc.Checked, 'V', 'F'));
  ArqConfig.WriteString('REL_COMP_SALDO', 'Autonomos', FU.IFF(cbxAutonomos.Checked, 'V', 'F'));

  ArqConfig.WriteString('REL_COMP_SALDO', 'Ativos', FU.IFF(cbxAtivos.Checked, 'V', 'F'));
  ArqConfig.WriteString('REL_COMP_SALDO', 'Afastados', FU.IFF(cbxAfastados.Checked, 'V', 'F'));
  ArqConfig.WriteString('REL_COMP_SALDO', 'Demitidos', FU.IFF(cbxDemitidos.Checked, 'V', 'F'));

  FreeAndNil(ArqConfig);
end;

end.
