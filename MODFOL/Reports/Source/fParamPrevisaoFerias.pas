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

unit fParamPrevisaoFerias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, wwdblook, Spin, checklst,
  IvDictio, IvMulti, IvEMulti, DBGrids, ComCtrls, wwdbdatetimepicker, CMDateTimePicker,
  DBClient, uCMClientDataSet, fParamReports_Padrao, CmParamReport, uCtrlPessoaFilialPessoa,
  uCtrlGlobalRH, uCtrlPessoaFuncionario, uCtrlListTerceirosRH,
  ColorCheckListBox;

type
  TfrmParamPrevisaoFerias = class(TfrmParamReports_Padrao)
    gbDataRef: TGroupBox;
    dtedDataRef: TCMDateTimePicker;
    rgSelDataLim: TRadioGroup;
    dtedDataLimIni: TCMDateTimePicker;
    stlblDataLim: TStaticText;
    dtedDataLimFin: TCMDateTimePicker;
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
    tbshCCusto: TTabSheet;
    chklstCCusto: TColorCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    CdsEstab: TCMClientDataSet;
    rgFeriasReduzidas: TRadioGroup;
    cbkExibeDataProg: TCheckBox;
    tbshEstabelecimento: TTabSheet;
    chklstEstab: TColorCheckListBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gbxSituacaoEnter(Sender: TObject);
    procedure gbxSituacaoExit(Sender: TObject);
    procedure gbxTipContraEnter(Sender: TObject);
    procedure gbxTipContraExit(Sender: TObject);
    procedure chklstCCustoClickCheck(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure dtedDataRefChange(Sender: TObject);
    procedure rgSelDataLimClick(Sender: TObject);
    procedure pgctrlEmpregadosChange(Sender: TObject);
    procedure chklstEstabClickCheck(Sender: TObject);
  private
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;

    chkListAux: TColorCheckListBox;
    ListaCodCCusto, ListaIdFunc, ListaIdEstab: TStringList;

    sListaIdEstabSel: string;
    bSitAtivo, bSitAfast, bTipContrEfet, bTipContrEspec, bTipContrTemp,
    bTipContrEst, bTipContrTerc, bTipContrProp, bTipContrAut: boolean;
    sListaCodCCustoSel: string;

    procedure MontaListaFuncionarios;
    procedure HabilitaBtOk;
  end;

var
  frmParamPrevisaoFerias: TfrmParamPrevisaoFerias;

implementation

uses uSistema, uMensErro, fAguarde, dCds, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmParamPrevisaoFerias.FormCreate(Sender: TObject);
var
  c: byte;
begin
  inherited;
  ListaIdEstab := TStringList.Create;
  ListaCodCCusto := TStringList.Create;
  ListaIdFunc := TStringList.Create;

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

  // Montar a Lista de C. Custo
  chklstCCusto.Items.Clear;
  dmCds.Cds.Data := CtrlListTerceirosRH.ListCCusto(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaCodCCusto.Add(dmCds.Cds.FieldByName('CODCENTROCUSTO').asString);
    chklstCCusto.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
    dmCds.Cds.Next;
  end;

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

  dmCds.Cds.Data := CtrlGlobalRH.GetParamRH('NORMALINI, NORMALFIM');
  dtedDataRef.Date := dmCds.Cds.FieldByName('NORMALINI').asDateTime;
  dtedDataLimIni.Date := dmCds.Cds.FieldByName('NORMALINI').asDateTime;
  dtedDataLimFin.Date := dmCds.Cds.FieldByName('NORMALFIM').asDateTime;

  cmbOrderBy.ItemIndex := 0;
  pgctrlEmpregados.ActivePageIndex := 0;

  pgctrlEmpregadosChange(Sender);

  MontaListaFuncionarios;
end;

procedure TfrmParamPrevisaoFerias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(ListaIdEstab);
  FreeAndNil(ListaIdEstab);
  FreeAndNil(ListaIdFunc);
  inherited;
end;

procedure TfrmParamPrevisaoFerias.pgctrlEmpregadosChange(Sender: TObject);
begin
  bbtnSelTodos.Visible := (pgctrlEmpregados.ActivePageIndex in [0,2,3]);
  bbtnInverteSel.Visible := (pgctrlEmpregados.ActivePageIndex in [0,2,3]);

  case (pgctrlEmpregados.ActivePageIndex) of
    0 : chkListAux := chklstFunc;
    2 : chkListAux := chklstCCusto;
    3 : chkListAux := chklstEstab;
  end;
end;

procedure TfrmParamPrevisaoFerias.dtedDataRefChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamPrevisaoFerias.gbxTipContraEnter(Sender: TObject);
begin
  bTipContrEfet := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp := cbxTemporarios.Checked;
  bTipContrEst := cbxEstagiarios.Checked;
  bTipContrTerc := cbxTerceiros.Checked;
  bTipContrProp := cbxPropDirSemVinc.Checked;
  bTipContrAut := cbxAutonomos.Checked;
end;

procedure TfrmParamPrevisaoFerias.gbxTipContraExit(Sender: TObject);
begin
  if not(cbxEfetivos.Checked) and not(cbxEspeciais.Checked) and not(cbxTemporarios.Checked) and
     not(cbxTerceiros.Checked) and not(cbxPropDirSemVinc.Checked) and
     not(cbxAutonomos.Checked) and not(cbxEstagiarios.Checked) then
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

procedure TfrmParamPrevisaoFerias.gbxSituacaoEnter(Sender: TObject);
begin
  bSitAtivo := (cbxAtivos.Checked);
  bSitAfast := (cbxAfastados.Checked);
end;

procedure TfrmParamPrevisaoFerias.gbxSituacaoExit(Sender: TObject);
begin
  if not(cbxAtivos.Checked) and not(cbxAfastados.Checked) then
  begin
    MsgDlg('Pelo menos um Tipo de Situação deve ser selecionado.', 'Aviso',
      mtInformation, [mbOk,mbHelp], 0);
    cbxAtivos.SetFocus;
  end
  else
  if (bSitAtivo <> cbxAtivos.Checked) or (bSitAfast <> cbxAfastados.Checked) then
    MontaListaFuncionarios;
end;

procedure TfrmParamPrevisaoFerias.chklstCCustoClickCheck(Sender: TObject);
begin
  inherited;
  MontaListaFuncionarios;
end;

procedure TfrmParamPrevisaoFerias.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[c] := true;
  chkListAux.Repaint;

  if (pgctrlEmpregados.ActivePageIndex > 0) then
    MontaListaFuncionarios
  else
    HabilitaBtOk;
end;

procedure TfrmParamPrevisaoFerias.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[c] := not(chkListAux.Checked[c]);
  chkListAux.Repaint;

  if (pgctrlEmpregados.ActivePageIndex > 0) then
    MontaListaFuncionarios
  else
    HabilitaBtOk;
end;

procedure TfrmParamPrevisaoFerias.rgSelDataLimClick(Sender: TObject);
begin
  dtedDataLimIni.Visible := (rgSelDataLim.ItemIndex = 0);
  dtedDataLimFin.Visible := (rgSelDataLim.ItemIndex = 0);
  stlblDataLim.Visible := (rgSelDataLim.ItemIndex = 0);
end;

procedure TfrmParamPrevisaoFerias.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
  sListaIdFuncSel: string;
begin
  // C. de Custo selecionados
  FU.CriaListaOpcoes(chklstCCusto, ListaCodCCusto, sListaCodCCustoSel, ',', true);

  // Funcionários escolhidos
  wNum := FU.CriaListaOpcoes(chklstFunc, ListaIdFunc, sListaIdFuncSel, ',', false);
  if (wNum = ListaIdFunc.Count) then
    sListaIdFuncSel := '';

  Cmp_Padrao.ParamByName('NomeEmpresa').asString := Sistema.NomeEmpresa;
  Cmp_Padrao.ParamByName('ListaIdEstab').asString := sListaIdEstabSel;
  Cmp_Padrao.ParamByName('SelDataLimite').asBoolean := (rgSelDataLim.ItemIndex = 0);
  if (rgSelDataLim.ItemIndex = 0) then
  begin
    Cmp_Padrao.ParamByName('DataLimiteInicial').asDateTime := dtedDataLimIni.Date;
    Cmp_Padrao.ParamByName('DataLimiteFinal').asDateTime := dtedDataLimFin.Date;
  end;
  Cmp_Padrao.ParamByName('DataRef').asDateTime := dtedDataRef.Date;
  Cmp_Padrao.ParamByName('ExibeDataProgramada').asBoolean := cbkExibeDataProg.Checked;
  Cmp_Padrao.ParamByName('ListaIdFunc').asString := sListaIdFuncSel;
  Cmp_Padrao.ParamByName('ListaCodCCusto').asString := sListaCodCCustoSel;
  Cmp_Padrao.ParamByName('TipoContrato').asString := FU.GerarListaTipoContratoSel(
    cbxEfetivos.Checked, cbxEspeciais.Checked, cbxTemporarios.Checked, cbxTerceiros.Checked,
    cbxPropDirSemVinc.Checked, cbxAutonomos.Checked, cbxEstagiarios.Checked, true);
  Cmp_Padrao.ParamByName('SitFunc').asString := FU.GerarListaSitFuncSel(cbxAtivos.Checked,
    cbxAfastados.Checked, false, true);
  Cmp_Padrao.ParamByName('Ordenacao').asInteger := cmbOrderBy.ItemIndex;
  Cmp_Padrao.ParamByName('FeriasReduzidas').asInteger := rgFeriasReduzidas.ItemIndex;

  frmAguarde.Mostra('Previsão de Férias');
  frmAguarde.Pos := 0;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmParamPrevisaoFerias.MontaListaFuncionarios;
begin
  // Estabelecimentos selecionados
  FU.CriaListaOpcoes(chklstEstab, ListaIdEstab, sListaIdEstabSel, ',', false);

  ListaIdFunc.Clear;
  chklstFunc.Items.Clear;

  if (sListaIdEstabSel <> '') then
  begin
    FU.CriaListaOpcoes(chklstCCusto, ListaCodCCusto, sListaCodCCustoSel, ',', false);

    dmCds.Cds.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(Sistema.IdEmpresa,
      '', sListaIdEstabSel, FU.GerarListaSitFuncSel(cbxAtivos.Checked,
      cbxAfastados.Checked, false), FU.GerarListaTipoContratoSel(cbxEfetivos.Checked,
      cbxEspeciais.Checked, cbxTemporarios.Checked, cbxTerceiros.Checked,
      cbxPropDirSemVinc.Checked, cbxAutonomos.Checked, cbxEstagiarios.Checked), '',
      sListaCodCCustoSel);

    while not(dmCds.Cds.EOF) do
    begin
      ListaIdFunc.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
      chklstFunc.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
      dmCds.Cds.Next;
    end;
  end;
  HabilitaBtOk;
end;

procedure TfrmParamPrevisaoFerias.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := (sListaIdEstabSel <> '') and (chklstFunc.Items.Count > 0) and
    (Trim(dtedDataRef.Text) <> '') and ((rgSelDataLim.ItemIndex = 1) or
    ((rgSelDataLim.ItemIndex = 0) and (Trim(dtedDataLimIni.Text) <> '') and
    (Trim(dtedDataLimFin.Text) <> '')));
end;

procedure TfrmParamPrevisaoFerias.chklstEstabClickCheck(Sender: TObject);
begin
  inherited;
  MontaListaFuncionarios;
end;

end.
