unit fLancaHoraPonto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Mask, wwdbedit, Db, DBTables, TREdit, Spin,
  wwdblook, TB97Tlbr, IvDictio, IvMulti, DBClient, DBCtrls, ComCtrls, uCMClientDataSet,
  wwdbdatetimepicker, CMDateTimePicker, CheckLst, ColorCheckListBox,uImplCBModAcessoCliente,
  uCtrlGlobalRH, uCtrlLancaHoras, uCtrlPessoaFilialPessoa, uCtrlPessoaFuncionario,
  uCtrlListTerceirosRH, IniFiles, IvEMulti;

type
  TfrmLancaHoraPonto = class(TfrmSairAjuda)
    CdsRub1: TCMClientDataSet;
    CdsRub2: TCMClientDataSet;
    CdsRub4: TCMClientDataSet;
    CdsRub5: TCMClientDataSet;
    CdsRub3: TCMClientDataSet;
    CdsRub6: TCMClientDataSet;
    bbtnExecutar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    CdsRub7: TCMClientDataSet;
    CdsEstab: TCMClientDataSet;
    pgctrlPrincipal: TPageControl;
    tbshParametros: TTabSheet;
    grpMesRef: TGroupBox;
    cmbMes: TComboBox;
    spnedAno: TSpinEdit;
    gbxIntervRef: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    dtedIni: TCMDateTimePicker;
    dtedFin: TCMDateTimePicker;
    tbshEmpregados: TTabSheet;
    gbxEstab: TGroupBox;
    dblkcbEstab: TwwDBLookupCombo;
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
    tbshCCusto: TTabSheet;
    chklstCCusto: TColorCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    gbxRubricas: TGroupBox;
    Label5: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label4: TLabel;
    dblckRub2: TwwDBLookupCombo;
    dblckRub3: TwwDBLookupCombo;
    dblckRub4: TwwDBLookupCombo;
    dblckRub5: TwwDBLookupCombo;
    dblckRub6: TwwDBLookupCombo;
    dblckRub7: TwwDBLookupCombo;
    dblckRub1: TwwDBLookupCombo;
    bbtnRubrica: TBitBtn;
    tbsBancoHoras: TTabSheet;
    gbxBancoHoras: TGroupBox;
    cbxFaltas: TCheckBox;
    cbxAtrasos: TCheckBox;
    pgbrProgresso: TProgressBar;
    gbxTolerancia: TGroupBox;
    Label8: TLabel;
    Label15: TLabel;
    ednTolEntra: TSpinEdit;
    ednTolSaida: TSpinEdit;
    Label10: TLabel;
    dblckRub8: TwwDBLookupCombo;
    CdsRub8: TCMClientDataSet;
    rgTransferir: TRadioGroup;
    procedure bbtnExecutarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure pgctrlEmpregadosChange(Sender: TObject);
    procedure gbxTipContraEnter(Sender: TObject);
    procedure gbxSituacaoEnter(Sender: TObject);
    procedure gbxTipContraExit(Sender: TObject);
    procedure gbxSituacaoExit(Sender: TObject);
    procedure chklstFuncClickCheck(Sender: TObject);
    procedure chklstCCustoClickCheck(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure bbtnRubricaClick(Sender: TObject);
  private
    CtrlLancaHoras: TCtrlLancaHoras;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    ArqConfig: TIniFile;

    chkListAux: TColorCheckListBox;
    ListaIdFunc, ListaCodCCusto: TStringList;

    IdEstab: double;
    sListaCodCCustoSel: string;
    bSitAtivo, bSitAfast, bSitDemit, bTipContrEfet, bTipContrEspec, bTipContrTemp,
    bTipContrEst, bTipContrTerc, bTipContrProp, bTipContrAut,
    bSabado, bDomingo, bFeriadoOrd, bFeriadoExtra: boolean;

    procedure HabilitaBtOk;
    procedure MontaListaFuncionarios;
    procedure AlimentaCombos(TipoRubrica: integer = 0);
    procedure DoProgresso(NumRegistros: integer);
    procedure LeAlteracoes;
    procedure GravaAlteracoes;
  end;

var
  frmLancaHoraPonto: TfrmLancaHoraPonto;

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH, dCds, uCtrlUsoGeralRH, fCriaRubrica;


{$R *.DFM}

procedure TfrmLancaHoraPonto.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlLancaHoras := TCtrlLancaHoras.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlLancaHoras.InitializeAs(Padroes);

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  frmCriaRubrica := TfrmCriaRubrica.Create(Application, false);

  ListaIdFunc := TStringList.Create;
  ListaCodCCusto := TStringList.Create;

  CdsEstab.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));

  AlimentaCombos;

  // Lista de C. Custo
  chklstCCusto.Items.Clear;
  ListaCodCCusto.Clear;
  dmCds.Cds.Data := CtrlListTerceirosRH.ListCCusto(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaCodCCusto.Add(dmCds.Cds.FieldByName('CODCENTROCUSTO').asString);
    chklstCCusto.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
    dmCds.Cds.Next;
  end;

  dmCds.Cds.Data := CtrlGlobalRH.GetParamRH(
    'NORMALINI, NORMALFIM, FLGBANCOHORAS, PERBANCOHORAS, LIMBANCOHORAS, '+
    'DSRBANCOHORAS, NORBANCOHORAS, INDPERBCHORAS, DATBANCOHORAS, PONTOINI, PONTOFIM');

  dtedIni.Date := dmCds.Cds.FieldByName('PONTOINI').asDateTime;
  dtedFin.Date := dmCds.Cds.FieldByName('PONTOFIM').asDateTime;
  tbsBancoHoras.TabVisible := dmCds.Cds.FieldByName('FLGBANCOHORAS').AsInteger = 1;

  cmbMes.ItemIndex := FU.ExtraiMes(CtrlGlobalRH.GetNormalIni)-1;
  spnedAno.Value := FU.ExtraiAno(CtrlGlobalRH.GetNormalIni);
  pgctrlEmpregados.ActivePageIndex := 0;
  IdEstab := -1;

  // Carrega alterações nas opções feitas anteriormente
  LeAlteracoes;

  HabilitaBtOk;
end;

procedure TfrmLancaHoraPonto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlLancaHoras);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(ListaIdFunc);
  FreeAndNil(ListaCodCCusto);
  FreeAndNil(frmCriaRubrica);
  GravaAlteracoes;
  inherited;
end;

procedure TfrmLancaHoraPonto.dblkcbEstabChange(Sender: TObject);
begin
  if (CdsEstab.FieldByName('IDPESSOA').asFloat <> IdEstab) then
  begin
    MontaListaFuncionarios;
    IdEstab := CdsEstab.FieldByName('IDPESSOA').asFloat;
    if (pgctrlEmpregados.ActivePageIndex = 0) then
      chklstFunc.Repaint;
  end;
end;

procedure TfrmLancaHoraPonto.pgctrlEmpregadosChange(Sender: TObject);
begin
  bbtnSelTodos.Visible := (pgctrlEmpregados.ActivePageIndex in [0,2]);
  bbtnInverteSel.Visible := bbtnSelTodos.Visible;
end;

procedure TfrmLancaHoraPonto.gbxTipContraEnter(Sender: TObject);
begin
  bTipContrEfet := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp := cbxTemporarios.Checked;
  bTipContrEst := cbxEstagiarios.Checked;
  bTipContrTerc := cbxTerceiros.Checked;
  bTipContrProp := cbxPropDirSemVinc.Checked;
  bTipContrAut := cbxAutonomos.Checked;
end;

procedure TfrmLancaHoraPonto.gbxSituacaoEnter(Sender: TObject);
begin
  bSitAtivo := cbxAtivos.Checked;
  bSitAfast := cbxAfastados.Checked;
  bSitDemit := cbxDemitidos.Checked;
end;

procedure TfrmLancaHoraPonto.gbxTipContraExit(Sender: TObject);
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

procedure TfrmLancaHoraPonto.gbxSituacaoExit(Sender: TObject);
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

procedure TfrmLancaHoraPonto.chklstFuncClickCheck(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmLancaHoraPonto.chklstCCustoClickCheck(Sender: TObject);
begin
  MontaListaFuncionarios;
end;

procedure TfrmLancaHoraPonto.bbtnRubricaClick(Sender: TObject);
begin
  if (frmCriaRubrica.ShowModal = mrOk) then
    AlimentaCombos(frmCriaRubrica.rgDestino.ItemIndex+1);
end;

procedure TfrmLancaHoraPonto.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  case (pgctrlEmpregados.ActivePageIndex) of
    0 : chkListAux := chklstFunc;
    2 : chkListAux := chklstCCusto;
  end;

  for c:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[c] := true;
  chkListAux.Repaint;

  if (pgctrlEmpregados.ActivePageIndex = 2) then
    MontaListaFuncionarios
  else
    HabilitaBtOk;
end;

procedure TfrmLancaHoraPonto.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  case (pgctrlEmpregados.ActivePageIndex) of
    0 : chkListAux := chklstFunc;
    2 : chkListAux := chklstCCusto;
  end;

  for c:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[c] := not(chkListAux.Checked[c]);
  chkListAux.Repaint;

  if (pgctrlEmpregados.ActivePageIndex = 2) then
    MontaListaFuncionarios
  else
    HabilitaBtOk;
end;

procedure TfrmLancaHoraPonto.bbtnExecutarClick(Sender: TObject);
var
  bOk: boolean;
  IntUm: integer;
  Msg: string;
  sListaIdFuncSel: string;
  DescrPasso: array[1..8] of string;
  InterfaceModAcesso: TImplCBModAcessoCliente;
begin
  DescrPasso[1] := fu.CMTranslate('Atrasos');
  DescrPasso[2] := fu.CMTranslate('Extras Diurnas');
  DescrPasso[3] := fu.CMTranslate('Extras Noturnas');
  DescrPasso[4] := fu.CMTranslate('Extraordinárias');
  DescrPasso[5] := fu.CMTranslate('Adicional Noturno');
  DescrPasso[6] := fu.CMTranslate('Faltas');
  DescrPasso[7] := fu.CMTranslate('Faltas Abonadas');
  DescrPasso[8] := fu.CMTranslate('Extras Transferidas');

  // Funcionários escolhidos
  FU.CriaListaOpcoes(chklstFunc, ListaIdFunc, sListaIdFuncSel, ',', false);

  Msg := '';
  IntUm := 1;
  InterfaceModAcesso := TImplCBModAcessoCliente.Create(DoProgresso);
  try
    bOk := CtrlLancaHoras.ProcessarColetivo((InterfaceModAcesso as IDispatch),
      Trim(spnedAno.Text) +'/'+ FU.PoeZero(cmbMes.ItemIndex+1),
      Sistema.IdEmpresa, sListaIdFuncSel,
      dblckRub1.LookupValue, dblckRub2.LookupValue, dblckRub3.LookupValue,
      dblckRub4.LookupValue, dblckRub5.LookupValue, dblckRub6.LookupValue,
      dblckRub7.LookupValue, dblckRub8.LookupValue,
      StrToDate(dtedIni.Text), StrToDate(dtedFin.Text), IntUm, rgTransferir.ItemIndex,
      cbxAtrasos.Checked, cbxFaltas.Checked, ednTolEntra.Value, ednTolSaida.Value,
      bSabado, bDomingo, bFeriadoOrd, bFeriadoExtra);
  finally
     InterfaceModAcesso := nil;
  end;

  if (bOk) then
  begin
    MsgDlg(fu.CMTranslate('Todos os Lançamentos foram atualizados com sucesso.'),
      fu.CMTranslate('Aviso'), mtInformation, [mbOk,mbHelp], 0);
    inherited;
  end
  else
    MsgDlg(fu.CMTranslate('Não pude atualizar os Lançamentos.') +CR_LF+CR_LF+
      fu.CMTranslate('Erro:') +CR_LF+ CtrlLancaHoras.MessageInfo, fu.CMTranslate('Erro'),
      mtError, [mbOk,mbHelp], 0);

  pgbrProgresso.Position := 0;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmLancaHoraPonto.MontaListaFuncionarios;
begin
  if (Trim(dblkcbEstab.Text) <> '') then
  begin
    ListaIdFunc.Clear;
    chklstFunc.Items.Clear;

    FU.CriaListaOpcoes(chklstCCusto, ListaCodCCusto, sListaCodCCustoSel, ',', false);

    dmCds.Cds.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(Sistema.IdEmpresa,
      'F.IDPESSOA, F.FLGMARCAPONTO, P.NOME', CdsEstab.FieldByName('IDPESSOA').asString,
      FU.GerarListaSitFuncSel(cbxAtivos.Checked, cbxAfastados.Checked, cbxDemitidos.Checked),
      FU.GerarListaTipoContratoSel(cbxEfetivos.Checked, cbxEspeciais.Checked,
        cbxTemporarios.Checked, cbxTerceiros.Checked, cbxPropDirSemVinc.Checked,
        cbxAutonomos.Checked, cbxEstagiarios.Checked),
      '', sListaCodCCustoSel, '', '', '', false, 0, 0);

    while not(dmCds.Cds.EOF) do
    begin
      if (dmCds.Cds.FieldByName('FLGMARCAPONTO').asInteger = 1) then
      begin
        ListaIdFunc.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
        chklstFunc.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
        chklstFunc.Checked[chklstFunc.Items.Count-1] := true;
      end;
      dmCds.Cds.Next;
    end;
  end;
  HabilitaBtOk;
end;

procedure TfrmLancaHoraPonto.HabilitaBtOk;
begin
  bbtnExecutar.Enabled := (Trim(dtedIni.Text) <> '') and (Trim(dtedFin.Text) <> '') and
    (Trim(dblkcbEstab.Text) <> '') and (dtedIni.Date <= dtedFin.Date) and
    ((dblckRub1.Text <> '') or (dblckRub2.Text <> '') or (dblckRub3.Text <> '') or
     (dblckRub4.Text <> '') or (dblckRub5.Text <> '') or (dblckRub6.Text <> '') or
     (dblckRub7.Text <> '') or (dblckRub8.Text <> ''));
end;

procedure TfrmLancaHoraPonto.AlimentaCombos(TipoRubrica: integer);
var
  c: byte;
  CodRubrica: array[1..8] of string;
begin
  // Armazena códigos das Rubricas selecionadas
  for c:=1 to 8 do
    CodRubrica[c] := TwwDbLookupCombo(Self.FindComponent('dblckRub'+IntToStr(c))).LookupValue;

  CdsRub1.Data := frmCriaRubrica.CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa));
  CdsRub2.Data := CdsRub1.Data;
  CdsRub3.Data := CdsRub1.Data;
  CdsRub4.Data := CdsRub1.Data;
  CdsRub5.Data := CdsRub1.Data;
  CdsRub6.Data := CdsRub1.Data;
  CdsRub7.Data := CdsRub1.Data;
  CdsRub8.Data := CdsRub1.Data;

  // Recupera códigos das Rubricas selecionadas
  for c:=1 to 8 do
    TwwDbLookupCombo(Self.FindComponent('dblckRub'+IntToStr(c))).LookupValue := CodRubrica[c];
end;

procedure TfrmLancaHoraPonto.DoProgresso(NumRegistros: integer);
begin
  if (NumRegistros > 0) then
  begin
    pgbrProgresso.Position := 0;
    pgbrProgresso.Max := NumRegistros;
  end
  else
    pgbrProgresso.StepIt;

  Self.Update;
end;

procedure TfrmLancaHoraPonto.LeAlteracoes;
begin
  // Recupera as últimas alterações das opções
  ArqConfig := TIniFile.Create(FU.ArqConfig);
  ednTolEntra.Value := StrToInt(ArqConfig.ReadString('LANCAPONTO', 'TolerEntra', '0'));
  ednTolSaida.Value := StrToInt(ArqConfig.ReadString('LANCAPONTO', 'TolerSaida', '0'));
  cbxFaltas.Checked := FU.StrToBool(ArqConfig.ReadString('LANCAPONTO', 'AbateFaltas', 'True'));
  cbxAtrasos.Checked := FU.StrToBool(ArqConfig.ReadString('LANCAPONTO', 'AbateAtrasos', 'True'));

  bSabado := FU.StrToBool(ArqConfig.ReadString('CONTRPONTO', 'Sabado', 'True'));
  bDomingo := FU.StrToBool(ArqConfig.ReadString('CONTRPONTO', 'Domingo', 'True'));
  bFeriadoOrd := FU.StrToBool(ArqConfig.ReadString('CONTRPONTO', 'FeriadoOrd', 'True'));
  bFeriadoExtra := FU.StrToBool(ArqConfig.ReadString('CONTRPONTO', 'FeriadoExtra', 'True'));
  rgTransferir.ItemIndex := StrToInt(ArqConfig.ReadString('CONTRPONTO', 'OpcaoTransferir', '1'));

  dblckRub1.LookUpValue := ArqConfig.ReadString('LANCAPONTO', 'Rubrica1', '');
  dblckRub1.UpDate;
  dblckRub2.LookUpValue := ArqConfig.ReadString('LANCAPONTO', 'Rubrica2', '');
  dblckRub2.UpDate;
  dblckRub3.LookUpValue := ArqConfig.ReadString('LANCAPONTO', 'Rubrica3', '');
  dblckRub3.UpDate;
  dblckRub4.LookUpValue := ArqConfig.ReadString('LANCAPONTO', 'Rubrica4', '');
  dblckRub4.UpDate;
  dblckRub5.LookUpValue := ArqConfig.ReadString('LANCAPONTO', 'Rubrica5', '');
  dblckRub5.UpDate;
  dblckRub6.LookUpValue := ArqConfig.ReadString('LANCAPONTO', 'Rubrica6', '');
  dblckRub6.UpDate;
  dblckRub7.LookUpValue := ArqConfig.ReadString('LANCAPONTO', 'Rubrica7', '');
  dblckRub7.UpDate;
  dblckRub8.LookUpValue := ArqConfig.ReadString('LANCAPONTO', 'Rubrica8', '');
  dblckRub8.UpDate;
end;

procedure TfrmLancaHoraPonto.GravaAlteracoes;
begin
  // Grava as últimas alterações das Opções
  ArqConfig.WriteString('LANCAPONTO', 'TolerEntra', IntToStr(ednTolEntra.Value));
  ArqConfig.WriteString('LANCAPONTO', 'TolerSaida', IntToStr(ednTolSaida.Value));
  ArqConfig.WriteString('LANCAPONTO', 'AbateFaltas', FU.BoolToStr(cbxFaltas.Checked,True));
  ArqConfig.WriteString('LANCAPONTO', 'AbateAtrasos', FU.BoolToStr(cbxAtrasos.Checked,True));

  ArqConfig.WriteString('LANCAPONTO', 'Rubrica1', dblckRub1.LookUpValue);
  ArqConfig.WriteString('LANCAPONTO', 'Rubrica2', dblckRub2.LookUpValue);
  ArqConfig.WriteString('LANCAPONTO', 'Rubrica3', dblckRub3.LookUpValue);
  ArqConfig.WriteString('LANCAPONTO', 'Rubrica4', dblckRub4.LookUpValue);
  ArqConfig.WriteString('LANCAPONTO', 'Rubrica5', dblckRub5.LookUpValue);
  ArqConfig.WriteString('LANCAPONTO', 'Rubrica6', dblckRub6.LookUpValue);
  ArqConfig.WriteString('LANCAPONTO', 'Rubrica7', dblckRub7.LookUpValue);
  ArqConfig.WriteString('LANCAPONTO', 'Rubrica8', dblckRub8.LookUpValue);
end;

end.
