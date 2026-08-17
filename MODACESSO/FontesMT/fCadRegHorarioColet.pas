unit fCadRegHorarioColet;

interface
                                       
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, wwdblook, Spin, checklst,
  IvDictio, IvMulti, ComCtrls, fSairAjuda, fParamReports_Padrao, CmParamReport, DBClient,
  uCMClientDataSet, ColorCheckListBox, uCtrlPessoaFilialPessoa, uCtrlGlobalRH,
  uCtrlPessoaFuncionario, uCtrlCargo, uCtrlListTerceirosRH, uCtrlHoraTrab,
  TREdit, wwdbdatetimepicker, CMDateTimePicker, uCtrlHorarioVariavel, IvEMulti;

type
  TfrmCadRegHorarioColet = class(TfrmParamReports_Padrao)
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
    tbshEstabelecimento: TTabSheet;
    chklstEstab: TColorCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    tbshCCusto: TTabSheet;
    chklstCCusto: TColorCheckListBox;
    Label7: TLabel;
    dblcHorario: TwwDBLookupCombo;
    gbxDataServico: TGroupBox;
    Label2: TLabel;
    dbedDatIni: TCMDateTimePicker;
    dbedDatFim: TCMDateTimePicker;
    CdsHorario: TCMClientDataSet;
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
    procedure chklstEstabClickCheck(Sender: TObject);
    procedure pgctrlEmpregadosChange(Sender: TObject);
    procedure dblcEstacaoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dbdtedDataIniChange(Sender: TObject);
    procedure dbdtedDataFimChange(Sender: TObject);
    procedure redVezesChange(Sender: TObject);
  private
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlCargo: TCtrlCargo;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlHoraTrab: TCtrlHoraTrab;
    CtrlHorarioVariavel: TCtrlHorarioVariavel;

    chkListAux: TColorCheckListBox;
    ListaIdFunc, ListaIdCargo, ListaIdEstab, ListaCodCCusto: TStringList;

    sListaIdFuncSel, sListaIdEstabSel,sListaIdCargoSel, sListaCodCCustoSel: string;
    FlgDoisCargos: integer;
    bSitAtivo, bSitAfast, bSitDemit, bTipContrEfet, bTipContrEspec, bTipContrTemp,
    bTipContrEst, bTipContrTerc, bTipContrProp, bTipContrAut: boolean;

    procedure MontaListaFuncionarios;
    procedure HabilitaBtOk;
  end;

var
  frmCadRegHorarioColet: TfrmCadRegHorarioColet;

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH, fAguarde, dCds, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmCadRegHorarioColet.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlCargo := TCtrlCargo.Create;
  CtrlCargo.InitializeAs(Padroes);

  CtrlHorarioVariavel := TCtrlHorarioVariavel.Create;
  CtrlHorarioVariavel.InitializeAs(Padroes);

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

  CtrlHoraTrab := TCtrlHoraTrab.Create;
  CtrlHoraTrab.InitializeAs(Padroes);

  ListaIdEstab := TStringList.Create;
  ListaIdCargo := TStringList.Create;
  ListaIdFunc := TStringList.Create;
  ListaCodCCusto := TStringList.Create;

  // Listar somente horários fixos na semana TIPO = 0
  CdsHorario.Data := CtrlHoraTrab.ListHoraTrab(0, 0);

  // Lista de Cargos
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
  FlgDoisCargos := dmCds.Cds.FieldByName('FLGDOISCARGOS').asInteger;

  pgctrlEmpregados.ActivePageIndex := 0;

  MontaListaFuncionarios;
  pgctrlEmpregadosChange(nil);
end;

procedure TfrmCadRegHorarioColet.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(ListaIdFunc);
  FreeAndNil(ListaIdCargo);
  FreeAndNil(ListaIdEstab);
  FreeAndNil(ListaCodCCusto);

  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlCargo);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlHoraTrab);
  FreeAndNil(CtrlHorarioVariavel);
  inherited;
end;

procedure TfrmCadRegHorarioColet.pgctrlEmpregadosChange(Sender: TObject);
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

procedure TfrmCadRegHorarioColet.gbxTipContraEnter(Sender: TObject);
begin
  bTipContrEfet := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp := cbxTemporarios.Checked;
  bTipContrEst := cbxEstagiarios.Checked;
  bTipContrTerc := cbxTerceiros.Checked;
  bTipContrProp := cbxPropDirSemVinc.Checked;
  bTipContrAut := cbxAutonomos.Checked;
end;

procedure TfrmCadRegHorarioColet.gbxSituacaoEnter(Sender: TObject);
begin
  bSitAtivo := cbxAtivos.Checked;
  bSitAfast := cbxAfastados.Checked;
  bSitDemit := cbxDemitidos.Checked;
end;

procedure TfrmCadRegHorarioColet.gbxTipContraExit(Sender: TObject);
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

procedure TfrmCadRegHorarioColet.gbxSituacaoExit(Sender: TObject);
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

procedure TfrmCadRegHorarioColet.chklstEstabClickCheck(Sender: TObject);
begin
  MontaListaFuncionarios;
end;

procedure TfrmCadRegHorarioColet.chklstFuncClickCheck(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmCadRegHorarioColet.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[c] := true;
  chkListAux.Repaint;
  HabilitaBtOk;
end;

procedure TfrmCadRegHorarioColet.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[c] := not(chkListAux.Checked[c]);
  chkListAux.Repaint;
  HabilitaBtOk;
end;

procedure TfrmCadRegHorarioColet.bbtnConfirmarClick(Sender: TObject);
begin
  // Empregados escolhidos
  FU.CriaListaOpcoes(chklstFunc, ListaIdFunc, sListaIdFuncSel, ',', false);

  frmAguarde.Mostra(fu.CMTranslate('Horários Variáveis'));
  frmAguarde.Pos := 0;
  // Chama a rotina de inserção
  CtrlHorarioVariavel.InserirHorarioColetivo(sListaIdFuncSel, dblcHorario.LookupValue,
    dbedDatIni.Text, dbedDatFim.Text);
  //
  frmAguarde.Apaga;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmCadRegHorarioColet.MontaListaFuncionarios;
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

  // Empregados escolhidos
  FU.CriaListaOpcoes(chklstFunc, ListaIdFunc, sListaIdFuncSel, ',', false);

  HabilitaBtOk;
  chklstFunc.Items.EndUpdate;
end;

procedure TfrmCadRegHorarioColet.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := (sListaIdFuncSel <> '') and (Trim(dbedDatIni.Text) <> '') and
    (Trim(dbedDatFim.Text) <> '') and (chklstFunc.Items.Count > 0) and
    (dbedDatIni.Date <= dbedDatFim.Date) and (dblcHorario.Text <> '');
end;

procedure TfrmCadRegHorarioColet.dblcEstacaoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  HabilitaBtOk;
end;

procedure TfrmCadRegHorarioColet.dbdtedDataIniChange(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
end;

procedure TfrmCadRegHorarioColet.dbdtedDataFimChange(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
end;

procedure TfrmCadRegHorarioColet.redVezesChange(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
end;

end.
