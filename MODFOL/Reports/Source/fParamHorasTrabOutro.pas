// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamHorasTrabOutro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn, TB97,
  TB97Tlbr, StdCtrls, Buttons, ExtCtrls, Db, DBTables, wwdblook, Spin, checklst, IvDictio,
  IvMulti, ComCtrls, wwdbdatetimepicker, fSairAjuda, CMDateTimePicker, DBClient, IniFiles,
  uCMClientDataSet, fParamReports_Padrao, CmParamReport, ColorCheckListBox,
  uCtrlPessoaFilialPessoa, uCtrlGlobalRH, uCtrlPessoaFuncionario, uCtrlListTerceirosRH,
  IvEMulti;

type
  TfrmParamHorasTrabOutro = class(TfrmParamReports_Padrao)
    gbxIntervRef: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtedIni: TCMDateTimePicker;
    dtedFin: TCMDateTimePicker;
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
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    gbxSituacao: TGroupBox;
    cbxAtivos: TCheckBox;
    cbxAfastados: TCheckBox;
    cbxDemitidos: TCheckBox;
    tbshCCusto: TTabSheet;
    chklstCCusto: TColorCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    tbshEstabelecimento: TTabSheet;
    chklstEstab: TColorCheckListBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gbxTipContraEnter(Sender: TObject);
    procedure gbxTipContraExit(Sender: TObject);
    procedure chklstFuncClickCheck(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure dtedIniChange(Sender: TObject);
    procedure gbxSituacaoEnter(Sender: TObject);
    procedure gbxSituacaoExit(Sender: TObject);
    procedure pgctrlEmpregadosChange(Sender: TObject);
    procedure chklstCCustoClickCheck(Sender: TObject);
  private
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;

    ArqConfig: TIniFile;
    chkListAux: TColorCheckListBox;
    ListaIdFunc, ListaCodCCusto, ListaIdEstab: TStringList;

    sListaIdEstabSel, sListaCodCCustoSel: string;

    bSitAtivo, bSitAfast, bSitDemit, bTipContrEfet, bTipContrEspec, bTipContrTemp,
    bTipContrEst, bTipContrTerc, bTipContrProp, bTipContrAut: boolean;

    procedure MontaListaFuncionarios;
    procedure HabilitaBtOk;
    procedure LerAlteracoes;
    procedure GravarAlteracoes;
  end;

var
  frmParamHorasTrabOutro: TfrmParamHorasTrabOutro;

implementation

uses uSistema, uMensErro, fAguarde, dCds, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmParamHorasTrabOutro.FormCreate(Sender: TObject);
begin
  inherited;
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

  ListaIdFunc := TStringList.Create;
  ListaIdEstab := TStringList.Create;
  ListaCodCCusto := TStringList.Create;

  // Apagar o índice se este existir
  dmCds.Cds.IndexName := '';
  if (dmCds.Cds.IndexDefs.IndexOf('Index1') > 0) then
    dmCds.Cds.DeleteIndex('Index1');

  // Lista de Estabelecimentos
  dmCds.Cds.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdEstab.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
    chklstEstab.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
    chklstEstab.Checked[chklstEstab.Items.Count-1] := true;
    dmCds.Cds.Next;
  end;

  // Lista de Centros de Custo
  chklstCCusto.Items.Clear;
  ListaCodCCusto.Clear;
  dmCds.Cds.Data := CtrlListTerceirosRH.ListCCusto(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaCodCCusto.Add(dmCds.Cds.FieldByName('CODCENTROCUSTO').asString);
    chklstCCusto.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
    chklstCCusto.Checked[chklstCCusto.Items.Count-1] := true;
    dmCds.Cds.Next;
  end;

  dtedIni.Date := CtrlGlobalRH.GetNormalIni;
  dtedFin.Date := CtrlGlobalRH.GetNormalFim;

  cmbOrderBy.ItemIndex := 0;
  pgctrlEmpregados.ActivePageIndex := 0;

  LerAlteracoes;
  MontaListaFuncionarios;
  pgctrlEmpregadosChange(nil);
end;

procedure TfrmParamHorasTrabOutro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravarAlteracoes;

  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlListTerceirosRH);

  FreeAndNil(ListaIdFunc);
  FreeAndNil(ListaCodCCusto);
  FreeAndNil(ListaIdEstab);
  inherited;
end;

procedure TfrmParamHorasTrabOutro.pgctrlEmpregadosChange(Sender: TObject);
begin
  bbtnSelTodos.Visible := (pgctrlEmpregados.ActivePageIndex in [0,2,3]);
  bbtnInverteSel.Visible := bbtnSelTodos.Visible;

  case (pgctrlEmpregados.ActivePageIndex) of
    0 : chkListAux := chklstFunc;
    2 : chkListAux := chklstCCusto;
    3 : chkListAux := chklstEstab;
  end;
end;

procedure TfrmParamHorasTrabOutro.dtedIniChange(Sender: TObject);
begin
  try
    StrToDate(TEdit(Sender).Text);
    MontaListaFuncionarios;
  except
  end;
end;

procedure TfrmParamHorasTrabOutro.gbxTipContraEnter(Sender: TObject);
begin
  bTipContrEfet := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp := cbxTemporarios.Checked;
  bTipContrEst := cbxEstagiarios.Checked;
  bTipContrTerc := cbxTerceiros.Checked;
  bTipContrProp := cbxPropDirSemVinc.Checked;
  bTipContrAut := cbxAutonomos.Checked;
end;

procedure TfrmParamHorasTrabOutro.gbxSituacaoEnter(Sender: TObject);
begin
  bSitAtivo := cbxAtivos.Checked;
  bSitAfast := cbxAfastados.Checked;
  bSitDemit := cbxDemitidos.Checked;
end;

procedure TfrmParamHorasTrabOutro.gbxTipContraExit(Sender: TObject);
begin
  if not(cbxEfetivos.Checked) and not(cbxEspeciais.Checked) and
     not(cbxTemporarios.Checked) and not(cbxTerceiros.Checked) and
     not(cbxPropDirSemVinc.Checked) and not(cbxAutonomos.Checked) and
     not(cbxEstagiarios.Checked) then
  begin
    MsgDlg(FU.CMTranslate('Pelo menos um Tipo de Contrato deve ser selecionado.'),
      FU.CMTranslate('Aviso'), mtInformation, [mbOk,mbHelp], 0);
    cbxEfetivos.SetFocus;
  end
  else
  if (bTipContrEfet <> cbxEfetivos.Checked) or (bTipContrEspec <> cbxEspeciais.Checked) or
     (bTipContrTemp <> cbxTemporarios.Checked) or (bTipContrEst <> cbxEstagiarios.Checked) or
     (bTipContrTerc <> cbxTerceiros.Checked) or (bTipContrProp <> cbxPropDirSemVinc.Checked) or
     (bTipContrAut <> cbxAutonomos.Checked) then
    MontaListaFuncionarios;
end;

procedure TfrmParamHorasTrabOutro.gbxSituacaoExit(Sender: TObject);
begin
  if not(cbxAtivos.Checked) and not(cbxAfastados.Checked) and not(cbxDemitidos.Checked) then
  begin
    MsgDlg(FU.CMTranslate('Pelo menos um Tipo de Situação deve ser selecionado.'),
      FU.CMTranslate('Aviso'), mtInformation, [mbOk,mbHelp], 0);
    cbxAtivos.SetFocus;
  end
  else
  if (bSitAtivo <> cbxAtivos.Checked) or (bSitAfast <> cbxAfastados.Checked) or
     (bSitDemit <> cbxDemitidos.Checked) then
    MontaListaFuncionarios;
end;

procedure TfrmParamHorasTrabOutro.chklstFuncClickCheck(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamHorasTrabOutro.chklstCCustoClickCheck(Sender: TObject);
begin
  MontaListaFuncionarios;
end;

procedure TfrmParamHorasTrabOutro.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[c] := true;
  chkListAux.Repaint;

  if (pgctrlEmpregados.ActivePageIndex in [2,3]) then
    MontaListaFuncionarios
  else
    HabilitaBtOk;
end;

procedure TfrmParamHorasTrabOutro.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[c] := not(chkListAux.Checked[c]);
  chkListAux.Repaint;

  if (pgctrlEmpregados.ActivePageIndex in [2,3]) then
    MontaListaFuncionarios
  else
    HabilitaBtOk;
end;

procedure TfrmParamHorasTrabOutro.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
  sListaIdFuncSel: string;
begin
  // Funcionários escolhidos
  wNum := FU.CriaListaOpcoes(chklstFunc, ListaIdFunc, sListaIdFuncSel, ',', false);
  if (wNum = ListaIdFunc.Count) then
    sListaIdFuncSel := '';

  // Centros de Custo escolhidos
  wNum := FU.CriaListaOpcoes(chklstCCusto, ListaCodCCusto, sListaCodCCustoSel, ',', true);
  if (wNum = ListaCodCCusto.Count) then
    sListaCodCCustoSel := '';

  Cmp_Padrao.ParamByName('InicioPeriodo').asDateTime := dtedIni.Date;
  Cmp_Padrao.ParamByName('FinalPeriodo').asDateTime := dtedFin.Date;
  Cmp_Padrao.ParamByName('ListaIdEstab').asString := sListaIdEstabSel;
  Cmp_Padrao.ParamByName('ListaIdFunc').asString := sListaIdFuncSel;
  Cmp_Padrao.ParamByName('ListaCodCCusto').asString := sListaCodCCustoSel;
  Cmp_Padrao.ParamByName('TipoContrato').asString := FU.GerarListaTipoContratoSel(
    cbxEfetivos.Checked, cbxEspeciais.Checked, cbxTemporarios.Checked, cbxTerceiros.Checked,
    cbxPropDirSemVinc.Checked, cbxAutonomos.Checked, cbxEstagiarios.Checked, true);
  Cmp_Padrao.ParamByName('SitFunc').asString := FU.GerarListaSitFuncSel(cbxAtivos.Checked,
    cbxAfastados.Checked, cbxDemitidos.Checked, true);
  Cmp_Padrao.ParamByName('Ordenacao').asInteger := cmbOrderBy.ItemIndex;

  frmAguarde.Mostra(FU.CMTranslate('Horas Trabalhadas em Outro Setor'));
  frmAguarde.Pos := 0;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmParamHorasTrabOutro.MontaListaFuncionarios;
begin
  // Estabelecimentos selecionados
  FU.CriaListaOpcoes(chklstEstab, ListaIdEstab, sListaIdEstabSel, ',', false);

  ListaIdFunc.Clear;
  chklstFunc.Items.BeginUpdate;
  chklstFunc.Items.Clear;

  if (sListaIdEstabSel <> '') then
  begin
    FU.CriaListaOpcoes(chklstCCusto, ListaCodCCusto, sListaCodCCustoSel, ',', false);

    dmCds.Cds.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(Sistema.IdEmpresa,
      '', sListaIdEstabSel, FU.GerarListaSitFuncSel(cbxAtivos.Checked,
      cbxAfastados.Checked, cbxDemitidos.Checked), FU.GerarListaTipoContratoSel(
      cbxEfetivos.Checked, cbxEspeciais.Checked, cbxTemporarios.Checked, cbxTerceiros.Checked,
      cbxPropDirSemVinc.Checked, cbxAutonomos.Checked, cbxEstagiarios.Checked),
      '', sListaCodCCustoSel);

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

procedure TfrmParamHorasTrabOutro.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := (Trim(dtedIni.Text) <> '') and (Trim(dtedFin.Text) <> '') and
    (sListaIdEstabSel <> '') and (sListaCodCCustoSel <> '');
end;

procedure TfrmParamHorasTrabOutro.LerAlteracoes;
begin
  // Recupera as últimas alterações das opções
  // ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  cbxEfetivos.Checked := (ArqConfig.ReadString('REL_HORA_TRAB_OUTRO_CC', 'Efetivos', 'V') = 'V');
  cbxEspeciais.Checked := (ArqConfig.ReadString('REL_HORA_TRAB_OUTRO_CC', 'Especiais', 'V') = 'V');
  cbxTemporarios.Checked := (ArqConfig.ReadString('REL_HORA_TRAB_OUTRO_CC', 'Temporarios', 'F') = 'V');
  cbxTerceiros.Checked := (ArqConfig.ReadString('REL_HORA_TRAB_OUTRO_CC', 'Terceiros', 'F') = 'V');
  cbxEstagiarios.Checked := (ArqConfig.ReadString('REL_HORA_TRAB_OUTRO_CC', 'Estagiarios', 'V') = 'V');
  cbxPropDirSemVinc.Checked := (ArqConfig.ReadString('REL_HORA_TRAB_OUTRO_CC', 'Proprietarios', 'F') = 'V');
  cbxAutonomos.Checked := (ArqConfig.ReadString('REL_HORA_TRAB_OUTRO_CC', 'Autonomos', 'F') = 'V');

  cbxAtivos.Checked := (ArqConfig.ReadString('REL_HORA_TRAB_OUTRO_CC', 'Ativos', 'V') = 'V');
  cbxAfastados.Checked := (ArqConfig.ReadString('REL_HORA_TRAB_OUTRO_CC', 'Afastados', 'V') = 'V');
  cbxDemitidos.Checked := (ArqConfig.ReadString('REL_HORA_TRAB_OUTRO_CC', 'Demitidos', 'V') = 'V');
end;

procedure TfrmParamHorasTrabOutro.GravarAlteracoes;
begin
  ArqConfig.WriteString('REL_HORA_TRAB_OUTRO_CC', 'Efetivos', FU.IFF(cbxEfetivos.Checked,'V','F'));
  ArqConfig.WriteString('REL_HORA_TRAB_OUTRO_CC', 'Especiais', FU.IFF(cbxEspeciais.Checked,'V','F'));
  ArqConfig.WriteString('REL_HORA_TRAB_OUTRO_CC', 'Temporarios', FU.IFF(cbxTemporarios.Checked,'V','F'));
  ArqConfig.WriteString('REL_HORA_TRAB_OUTRO_CC', 'Terceiros', FU.IFF(cbxTerceiros.Checked,'V','F'));
  ArqConfig.WriteString('REL_HORA_TRAB_OUTRO_CC', 'Estagiarios', FU.IFF(cbxEstagiarios.Checked,'V','F'));
  ArqConfig.WriteString('REL_HORA_TRAB_OUTRO_CC', 'Proprietarios', FU.IFF(cbxPropDirSemVinc.Checked,'V','F'));
  ArqConfig.WriteString('REL_HORA_TRAB_OUTRO_CC', 'Autonomos', FU.IFF(cbxAutonomos.Checked,'V','F'));

  ArqConfig.WriteString('REL_HORA_TRAB_OUTRO_CC', 'Ativos', FU.IFF(cbxAtivos.Checked, 'V', 'F'));
  ArqConfig.WriteString('REL_HORA_TRAB_OUTRO_CC', 'Afastados', FU.IFF(cbxAfastados.Checked, 'V', 'F'));
  ArqConfig.WriteString('REL_HORA_TRAB_OUTRO_CC', 'Demitidos', FU.IFF(cbxDemitidos.Checked, 'V', 'F'));

  FreeAndNil(ArqConfig);
end;

end.
