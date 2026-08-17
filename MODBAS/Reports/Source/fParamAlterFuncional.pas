unit fParamAlterFuncional;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn, TB97,
  TB97Tlbr, StdCtrls, Buttons, ExtCtrls, Db, DBTables, wwdblook, Spin, checklst, IvDictio,
  IvMulti, IvEMulti, ComCtrls, wwdbdatetimepicker, CMDateTimePicker, fParamReports_Padrao,
  CmParamReport, DBClient, uCMClientDataSet, uCtrlPessoaFilialPessoa, uCtrlMotivo,
  uCtrlListTerceirosRH, uCtrlPessoaFuncionario, ColorCheckListBox;

type
  TfrmParamAlterFuncional = class(TfrmParamReports_Padrao)
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
    tbshMotivo: TTabSheet;
    chklstMotivo: TColorCheckListBox;
    CdsEstab: TCMClientDataSet;
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
    CtrlMotivo: TCtrlMotivo;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;

    ListaIdFunc: TStringList;
    ListaIdTipoFolha: TStringList;
    ListaCodCCusto: TStringList;
    ListaIdEstab: TStringList;

    chkListAux: TColorCheckListBox;

    sListaIdTipoFolhaSel, sListaCodCCustoSel, sListaIdEstabSel: string;
    bSitAtivo, bSitAfast, bSitDemit, bTipContrEfet, bTipContrEspec, bTipContrTemp,
    bTipContrEst, bTipContrTerc, bTipContrProp, bTipContrAut: boolean;

    procedure HabilitaBtOk;
    procedure MontaListaFuncionarios;
  end;

var
  frmParamAlterFuncional: TfrmParamAlterFuncional;

implementation

uses uSistema, uMensErro, uCtrlPadroes, fAguarde, dCds, uCtrlFuncoesRH, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmParamAlterFuncional.FormCreate(Sender: TObject);
var
  c: byte;
begin
  inherited;
  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  ListaIdFunc := TStringList.Create;
  ListaIdTipoFolha := TStringList.Create;
  ListaCodCCusto := TStringList.Create;
  ListaIdEstab := TStringList.Create;

  dtedIni.Date := Date - 365;
  dtedFin.Date := Date;

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

  // Lista de Motivos
  dmCds.Cds.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('A');
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdTipoFolha.Add(dmCds.Cds.FieldByName('IDMOTIVO').asString);
    chklstMotivo.Items.Add(dmCds.Cds.FieldByName('DESCRICAO').asString);
    dmCds.Cds.Next;
  end;

  // Lista dos C. Custo
  dmCds.Cds.Data := CtrlListTerceirosRH.ListCCusto(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaCodCCusto.Add(dmCds.Cds.FieldByName('CODCENTROCUSTO').asString);
    chklstCCusto.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
    dmCds.Cds.Next;
  end;

  cmbOrderBy.ItemIndex := 0;
  pgctrlEmpregados.ActivePageIndex := 0;

  MontaListaFuncionarios;
end;

procedure TfrmParamAlterFuncional.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlMotivo);
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(ListaIdFunc);
  FreeAndNil(ListaIdTipoFolha);
  FreeAndNil(ListaCodCCusto);
  FreeAndNil(ListaIdEstab);
  inherited;
end;

procedure TfrmParamAlterFuncional.pgctrlEmpregadosChange(Sender: TObject);
begin
  bbtnSelTodos.Visible := (pgctrlEmpregados.ActivePageIndex in [0,1,3]);
  bbtnInverteSel.Visible := bbtnSelTodos.Visible;
end;

procedure TfrmParamAlterFuncional.dtedIniChange(Sender: TObject);
begin
  try
    StrToDate(TEdit(Sender).Text);
    MontaListaFuncionarios;
  except
  end;
end;

procedure TfrmParamAlterFuncional.gbxTipContraEnter(Sender: TObject);
begin
  bTipContrEfet := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp := cbxTemporarios.Checked;
  bTipContrEst := cbxEstagiarios.Checked;
  bTipContrTerc := cbxTerceiros.Checked;
  bTipContrProp := cbxPropDirSemVinc.Checked;
  bTipContrAut := cbxAutonomos.Checked;
end;

procedure TfrmParamAlterFuncional.gbxTipContraExit(Sender: TObject);
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

procedure TfrmParamAlterFuncional.gbxSituacaoEnter(Sender: TObject);
begin
  bSitAtivo := (cbxAtivos.Checked);
  bSitAfast := (cbxAfastados.Checked);
  bSitDemit := (cbxDemitidos.Checked);
end;

procedure TfrmParamAlterFuncional.gbxSituacaoExit(Sender: TObject);
begin
  if not(cbxAtivos.Checked) and not(cbxAfastados.Checked) and not(cbxDemitidos.Checked) then
  begin
    MsgDlg ('Pelo menos um Tipo de Situação deve ser selecionado.', 'Aviso',
      mtInformation, [mbOk,mbHelp], 0);
    cbxAtivos.SetFocus;
  end
  else
  if (bSitAtivo <> cbxAtivos.Checked) or (bSitAfast <> cbxAfastados.Checked) or
     (bSitDemit <> cbxDemitidos.Checked) then
    MontaListaFuncionarios;
end;

procedure TfrmParamAlterFuncional.chklstFuncClickCheck(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
end;

procedure TfrmParamAlterFuncional.chklstCCustoClickCheck(Sender: TObject);
begin
  inherited;
  MontaListaFuncionarios;
end;

procedure TfrmParamAlterFuncional.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  case (pgctrlEmpregados.ActivePageIndex) of
    0 : chkListAux := chklstMotivo;
    1 : chkListAux := chklstFunc;
    3 : chkListAux := chklstCCusto;
    4 : chkListAux := chklstEstab;
  end;

  for c:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[c] := true;
  chkListAux.Repaint;

  if (pgctrlEmpregados.ActivePageIndex = 3) or (pgctrlEmpregados.ActivePageIndex = 4) then
    MontaListaFuncionarios
  else
    HabilitaBtOk;
end;

procedure TfrmParamAlterFuncional.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  case (pgctrlEmpregados.ActivePageIndex) of
    0 : chkListAux := chklstMotivo;
    1 : chkListAux := chklstFunc;
    3 : chkListAux := chklstCCusto;
    4 : chkListAux := chklstEstab;
  end;

  for c:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[c] := not(chkListAux.Checked[c]);
  chkListAux.Repaint;

  if (pgctrlEmpregados.ActivePageIndex = 3) or (pgctrlEmpregados.ActivePageIndex = 4) then
    MontaListaFuncionarios
  else
    HabilitaBtOk;
end;

procedure TfrmParamAlterFuncional.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
  sListaIdFuncSel: string;
begin
  // Lista dos Funcionários selecionados
  wNum := FU.CriaListaOpcoes(chklstFunc, ListaIdFunc, sListaIdFuncSel, ',', false);
  if (wNum = ListaIdFunc.Count) then
    sListaIdFuncSel := '';

  // Lista dos Motivos selecionados
  wNum := FU.CriaListaOpcoes(chklstMotivo, ListaIdTipoFolha, sListaIdTipoFolhaSel, ',', false);
  if (wNum = ListaIdTipoFolha.Count) then
    sListaIdTipoFolhaSel := '';

  // Lista dos Centros de Custo selecionados
  wNum := FU.CriaListaOpcoes(chklstCCusto, ListaCodCCusto, sListaCodCCustoSel, ',', false);
  if (wNum = ListaCodCCusto.Count) then
    sListaCodCCustoSel := '';

  Cmp_Padrao.ParamByName('ListaIdEstab').asString := sListaIdEstabSel;
  Cmp_Padrao.ParamByName('DataInicial').asDateTime := dtedIni.Date;
  Cmp_Padrao.ParamByName('DataFinal').asDateTime := dtedFin.Date;
  Cmp_Padrao.ParamByName('ListaIdTipoFolha').asString := sListaIdTipoFolhaSel;
  Cmp_Padrao.ParamByName('ListaIdFunc').asString := sListaIdFuncSel;
  Cmp_Padrao.ParamByName('ListaCodCCusto').asString := sListaCodCCustoSel;
  Cmp_Padrao.ParamByName('SitFunc').asString := FU.GerarListaSitFuncSel(cbxAtivos.Checked,
    cbxAfastados.Checked, cbxDemitidos.Checked);
  Cmp_Padrao.ParamByName('TipoContrato').asString := FU.GerarListaTipoContratoSel(
    cbxEfetivos.Checked, cbxEspeciais.Checked, cbxTemporarios.Checked, cbxTerceiros.Checked,
    cbxPropDirSemVinc.Checked, cbxAutonomos.Checked, cbxEstagiarios.Checked);
  Cmp_Padrao.ParamByName('Ordem').asInteger := cmbOrderBy.ItemIndex;

  frmAguarde.Mostra('Alterações Funcionais');
  frmAguarde.Pos := 0;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmParamAlterFuncional.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := (chklstFunc.Items.Count > 0) and (Trim(dtedIni.Text) <> '') and
    (Trim(dtedFin.Text) <> '') and (sListaIdEstabSel <> '');
end;

procedure TfrmParamAlterFuncional.MontaListaFuncionarios;
begin
  // Estabelecimentos selecionados
  FU.CriaListaOpcoes(chklstEstab, ListaIdEstab, sListaIdEstabSel, ',', false);

  if (sListaIdEstabSel <> '') then
  begin
    ListaIdFunc.Clear;
    chklstFunc.Items.Clear;

    FU.CriaListaOpcoes(chklstMotivo, ListaIdTipoFolha, sListaIdTipoFolhaSel, ',', false);
    FU.CriaListaOpcoes(chklstCCusto, ListaCodCCusto, sListaCodCCustoSel, ',', false);

    dmCds.Cds.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(Sistema.IdEmpresa,
      '', sListaIdEstabSel, FU.GerarListaSitFuncSel(cbxAtivos.Checked,
      cbxAfastados.Checked, cbxDemitidos.Checked), FU.GerarListaTipoContratoSel(
      cbxEfetivos.Checked, cbxEspeciais.Checked, cbxTemporarios.Checked, cbxTerceiros.Checked,
      cbxPropDirSemVinc.Checked, cbxAutonomos.Checked, cbxEstagiarios.Checked), '',
      sListaCodCCustoSel, '', '', '', false, 0, 0, -1, -1, '', 0, 0, 0, 0, false, '',
      sListaIdTipoFolhaSel, dtedIni.Date, dtedFin.Date);

    while not(dmCds.Cds.EOF) do
    begin
      ListaIdFunc.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
      chklstFunc.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
      dmCds.Cds.Next;
    end;
  end;
  HabilitaBtOk;
end;

end.
