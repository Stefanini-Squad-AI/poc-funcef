// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamVariavelMensal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn, StdCtrls,
  fParamReports_Padrao, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwdatsrc, Mask,
  wwdbedit, Wwdotdot, Wwdbcomb, Machklb, wwdblook, checklst, TREdit, Spin, IvDictio, IvMulti,
  IvEMulti, ComCtrls, Grids, Wwdbigrd, IniFiles, Wwdbgrid, CmParamReport, DBClient, TB97Tlwn,
  uCMClientDataSet, ColorCheckListBox, uCtrlGlobalRH, uCtrlPessoaFilialPessoa, uCtrlProvDesc,
  uCtrlListTerceirosRH, uCtrlMotivo;

type
  TRegTitulo = record
    Linha1, Linha2: string;
  end;

  TfrmParamVariavelMensal = class(TfrmParamReports_Padrao)
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    gbxTitulo: TGroupBox;
    edTitulo: TEdit;
    gbxAnoMesRef: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    gbxAnoMesRef2: TGroupBox;
    cmbMes2: TComboBox;
    speAno2: TSpinEdit;
    rgTipoRel: TRadioGroup;
    pgctrlPaginas: TPageControl;
    tbshRubricas: TTabSheet;
    Label1: TLabel;
    pgctrlPaginas2: TPageControl;
    tbshColuna1: TTabSheet;
    chklstRubrica1: TColorCheckListBox;
    tbshColuna2: TTabSheet;
    chklstRubrica2: TColorCheckListBox;
    tbshColuna3: TTabSheet;
    chklstRubrica3: TColorCheckListBox;
    tbshColuna4: TTabSheet;
    chklstRubrica4: TColorCheckListBox;
    tbshColuna5: TTabSheet;
    chklstRubrica5: TColorCheckListBox;
    tbshColuna6: TTabSheet;
    chklstRubrica6: TColorCheckListBox;
    tbshColuna7: TTabSheet;
    chklstRubrica7: TColorCheckListBox;
    tbshColuna8: TTabSheet;
    chklstRubrica8: TColorCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    gbxTituloColunas: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    edTituloLinha1: TEdit;
    edTituloLinha2: TEdit;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    tbshTipoEmpr: TTabSheet;
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
    spbtSelecao: TBitBtn;
    spbtInvSelecao: TBitBtn;
    townDica: TToolWindow97;
    btnFecharDica: TBitBtn;
    CdsEstab: TCMClientDataSet;
    Memo1: TMemo;
    bbtnDica: TBitBtn;
    cbxMudaPagina: TCheckBox;
    rgProcesso: TRadioGroup;
    tbshTipoFolha: TTabSheet;
    chklstTipoFolha: TColorCheckListBox;
    spbtSelTodosTipFol: TBitBtn;
    spbtInvSelecaoTipFol: TBitBtn;
    tbshEstabelecimento: TTabSheet;
    chklstEstab: TColorCheckListBox;
    bbtnSelTodosEstab: TBitBtn;
    bbtnInverteSelEstab: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnMarcarRubClick(Sender: TObject);
    procedure chklstRubrica1ClickCheck(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure pgctrlPaginas2Change(Sender: TObject);
    procedure edTituloLinha1Change(Sender: TObject);
    procedure gbxTipContraExit(Sender: TObject);
    procedure gbxSituacaoExit(Sender: TObject);
    procedure chklstCCustoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure chklstCCustoClickCheck(Sender: TObject);
    procedure spbtSelecaoClick(Sender: TObject);
    procedure spbtInvSelecaoClick(Sender: TObject);
    procedure rgTipoRelClick(Sender: TObject);
    procedure gbxTipContraEnter(Sender: TObject);
    procedure gbxSituacaoEnter(Sender: TObject);
    procedure btnFecharDicaClick(Sender: TObject);
    procedure bbtnDicaClick(Sender: TObject);
    procedure cmbOrderByChange(Sender: TObject);
    procedure spbtSelTodosTipFolClick(Sender: TObject);
    procedure spbtInvSelecaoTipFolClick(Sender: TObject);
    procedure bbtnSelTodosEstabClick(Sender: TObject);
    procedure bbtnInverteSelEstabClick(Sender: TObject);
    procedure chklstEstabClickCheck(Sender: TObject);
  private
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlProvDesc: TCtrlProvDesc;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlMotivo: TCtrlMotivo;

    ArqConfig: TIniFile;
    chkListAux: TColorCheckListBox;
    ListaIdTipoFolha, ListaIdRubrica, ListaCodCCusto, ListaIdEstab: TStringList;

    sListaIdEstabSel: String;

    regTituloLinha: array[1..8] of TRegTitulo;
    LiRubrica, LiRubricaSemSinal: array[1..8] of string;
    bSitAtivo, bSitAfast, bSitDemit, bTipContrEfet, bTipContrEspec, bTipContrTemp,
    bTipContrEst, bTipContrTerc, bTipContrProp, bTipContrAut: boolean;
    FlgIndPolitica: integer;
    LiRubricaTmp: String;

    procedure LeAlteracoes;
    procedure GravaAlteracoes;
    procedure HabilitaBtOk;
    function  SelecionaTipoContrato: string;
    function  SelecionaSitFunc: string;
  public
    sMes, sMes2: string;
  end;

var
  frmParamVariavelMensal: TfrmParamVariavelMensal;

implementation

uses uSistema, uMensErro, fAguarde, dCds, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmParamVariavelMensal.FormCreate(Sender: TObject);
var
  NormalIni: TDate;
  c: byte;
begin
  inherited;
  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);

  ListaIdRubrica := TStringList.Create;
  ListaCodCCusto := TStringList.Create;
  ListaIdTipoFolha := TStringList.Create;
  ListaIdEstab := TStringList.Create;

  NormalIni := CtrlGlobalRH.GetNormalIni;
  cmbMes.ItemIndex := FU.ExtraiMes(NormalIni) - 1;
  speAno.Value := FU.ExtraiAno(NormalIni);

  cmbMes2.ItemIndex := FU.ExtraiMes(NormalIni - 30) - 1;
  speAno2.Value := FU.ExtraiAno(NormalIni);
  if (cmbMes2.ItemIndex = 11) then
    speAno2.Value := speAno2.Value - 1;

  dmCds.Cds.Data := CtrlGlobalRH.GetParamRH('INDPOLITICA');
  FlgIndPolitica := dmCds.Cds.FieldByName('INDPOLITICA').asInteger;
  if (FlgIndPolitica = 1) then
    rgTipoRel.Items.Add('Demonstrativo Hay');

  // Montar a Lista de Rubricas
  chklstRubrica1.Items.Clear;
  chklstRubrica2.Items.Clear;
  chklstRubrica3.Items.Clear;
  chklstRubrica4.Items.Clear;
  chklstRubrica5.Items.Clear;
  chklstRubrica6.Items.Clear;
  chklstRubrica7.Items.Clear;
  chklstRubrica8.Items.Clear;
  dmCds.Cds.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdRubrica.Add(dmCds.Cds.FieldByName('CODPROVDESC').asString);
    chklstRubrica1.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    chklstRubrica2.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    chklstRubrica3.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    chklstRubrica4.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    chklstRubrica5.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    chklstRubrica6.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    chklstRubrica7.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    chklstRubrica8.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    dmCds.Cds.Next;
  end;

  // Montar a Lista de C. Custo
  chklstCCusto.Items.Clear;
  dmCds.Cds.Data := CtrlListTerceirosRH.ListCCusto(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaCodCCusto.Add(Trim(dmCds.Cds.FieldByName('CODCENTROCUSTO').asString));
    chklstCCusto.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
    dmCds.Cds.Next;
  end;

  // Montar a Lista de Tipos de Folha
  chklstTipoFolha.Items.Clear;
  dmCds.Cds.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('F,D');
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdTipoFolha.Add(dmCds.Cds.FieldByName('IDMOTIVO').asString);
    chklstTipoFolha.Items.Add(dmCds.Cds.FieldByName('DESCRICAO').asString);
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

  chkListAux := chklstRubrica1;
  cmbOrderBy.ItemIndex := 0;
  pgctrlPaginas.ActivePageIndex := 0;
  pgctrlPaginas2.ActivePageIndex := 0;
  edTituloLinha1.Text := '';
  edTituloLinha2.Text := '';

  // Carrega alterações nas opções feitas anteriormente
  LeAlteracoes;
end;

procedure TfrmParamVariavelMensal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravaAlteracoes;

  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlProvDesc);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlMotivo);

  FreeAndNil(ListaIdTipoFolha);
  FreeAndNil(ListaIdRubrica);
  FreeAndNil(ListaCodCCusto);
  FreeAndNil(ListaIdEstab);
  inherited;
end;

procedure TfrmParamVariavelMensal.pgctrlPaginas2Change(Sender: TObject);
begin
  chkListAux := TColorCheckListBox(Self.FindComponent('chklstRubrica'+
    IntToStr(pgctrlPaginas2.ActivePageIndex+1)));
  edCodRubricas.Text := LiRubrica[pgctrlPaginas2.ActivePageIndex+1];
  edTituloLinha1.Text := regTituloLinha[pgctrlPaginas2.ActivePageIndex+1].Linha1;
  edTituloLinha2.Text := regTituloLinha[pgctrlPaginas2.ActivePageIndex+1].Linha2;
end;

procedure TfrmParamVariavelMensal.edTituloLinha1Change(Sender: TObject);
begin
  if (TEdit(Sender).Name = 'edTituloLinha1') then
    regTituloLinha[pgctrlPaginas2.ActivePageIndex+1].Linha1 := edTituloLinha1.Text
  else
    regTituloLinha[pgctrlPaginas2.ActivePageIndex+1].Linha2 := edTituloLinha2.Text;

  HabilitaBtOk;
end;

procedure TfrmParamVariavelMensal.gbxTipContraEnter(Sender: TObject);
begin
  bTipContrEfet := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp := cbxTemporarios.Checked;
  bTipContrEst := cbxEstagiarios.Checked;
  bTipContrTerc := cbxTerceiros.Checked;
  bTipContrProp := cbxPropDirSemVinc.Checked;
  bTipContrAut := cbxAutonomos.Checked;
end;

procedure TfrmParamVariavelMensal.gbxSituacaoEnter(Sender: TObject);
begin
  bSitAtivo := (cbxAtivos.Checked);
  bSitAfast := (cbxAfastados.Checked);
  bSitDemit := (cbxDemitidos.Checked);
end;

procedure TfrmParamVariavelMensal.gbxTipContraExit(Sender: TObject);
begin
  if not(cbxEfetivos.Checked) and not(cbxEspeciais.Checked) and
     not(cbxTemporarios.Checked) and not(cbxTerceiros.Checked) and
     not(cbxPropDirSemVinc.Checked) and not(cbxAutonomos.Checked) and
     not(cbxEstagiarios.Checked) then
  begin
    MsgDlg('Pelo menos um Tipo de Contrato deve ser selecionado.', 'Aviso',
      mtWarning, [mbOk,mbHelp], 0);
    cbxEfetivos.SetFocus;
  end;
end;

procedure TfrmParamVariavelMensal.gbxSituacaoExit(Sender: TObject);
begin
  if not(cbxAtivos.Checked) and not(cbxAfastados.Checked) and not(cbxDemitidos.Checked) then
  begin
    MsgDlg('Pelo menos um Tipo de Situação deve ser selecionado.', 'Aviso',
      mtWarning, [mbOk,mbHelp], 0);
    cbxAtivos.SetFocus;
  end;
end;

procedure TfrmParamVariavelMensal.chklstCCustoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    FU.InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamVariavelMensal.chklstRubrica1ClickCheck(Sender: TObject);
begin
  inherited;
  LiRubricaTmp := StringReplace(LiRubrica[pgctrlPaginas2.ActivePageIndex+1],'-','',[rfReplaceAll]);
  FU.CriaListaOpcoes(chkListAux, ListaIdRubrica, LiRubricaTmp, ',', false);
  LiRubrica[pgctrlPaginas2.ActivePageIndex+1] := LiRubricaTmp;
  edCodRubricas.Text := LiRubrica[pgctrlPaginas2.ActivePageIndex+1];
  HabilitaBtOk;
end;

procedure TfrmParamVariavelMensal.chklstCCustoClickCheck(Sender: TObject);
begin
  FU.InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamVariavelMensal.spbtSelecaoClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstCCusto.Items.Count-1 do
    chklstCCusto.Checked[c] := true;
  chklstCCusto.Repaint;
end;

procedure TfrmParamVariavelMensal.spbtInvSelecaoClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstCCusto.Items.Count-1 do
    chklstCCusto.Checked[c] := not(chklstCCusto.Checked[c]);
  chklstCCusto.Repaint;
end;

procedure TfrmParamVariavelMensal.spbtSelTodosTipFolClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoFolha.Items.Count-1 do
    chklstTipoFolha.Checked[c] := true;
  chklstTipoFolha.Repaint;
end;

procedure TfrmParamVariavelMensal.spbtInvSelecaoTipFolClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoFolha.Items.Count-1 do
    chklstTipoFolha.Checked[c] := not(chklstTipoFolha.Checked[c]);
  chklstTipoFolha.Repaint;
end;

procedure TfrmParamVariavelMensal.rgTipoRelClick(Sender: TObject);
begin
  gbxAnoMesRef2.Visible  := (rgTipoRel.ItemIndex = 1) or (rgTipoRel.ItemIndex = 2) or
                            (rgTipoRel.ItemIndex = 4) or (rgTipoRel.ItemIndex = 5);
  tbshColuna8.TabVisible := (rgTipoRel.ItemIndex <> 6);
  rgTipoRel.ShowHint     := (rgTipoRel.ItemIndex = 6);
  cbxMudaPagina.Visible  := (rgTipoRel.ItemIndex in [0,1,2,6]) and
                            (cmbOrderBy.ItemIndex > 3);

  if (rgTipoRel.ItemIndex = 2) or (rgTipoRel.ItemIndex = 5) then
  begin
    gbxAnoMesRef.Caption  := 'Mês e Ano Final';
    gbxAnoMesRef2.Caption := 'Mês e Ano Inicial';
  end
  else
  begin
    gbxAnoMesRef.Caption  := 'Mês e Ano de Referência';
    gbxAnoMesRef2.Caption := 'Mês e Ano Base Comparativa';
  end;
end;

procedure TfrmParamVariavelMensal.sbtnMarcarRubClick(Sender: TObject);
begin
  LiRubricaTmp := StringReplace(Trim(edCodRubricas.Text),'-','',[rfReplaceAll]);
  FU.VerificaOpcoes(chkListAux, ListaIdRubrica, LiRubricaTmp, ',');
  LiRubrica[pgctrlPaginas2.ActivePageIndex+1] := edCodRubricas.Text;
  chkListAux.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamVariavelMensal.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[c] := true;

  FU.CriaListaOpcoes(chkListAux, ListaIdRubrica, LiRubrica[pgctrlPaginas2.ActivePageIndex+1], ',', false);
  edCodRubricas.Text := LiRubrica[pgctrlPaginas2.ActivePageIndex+1];
  chkListAux.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamVariavelMensal.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[c] := not(chkListAux.Checked[c]);

  FU.CriaListaOpcoes(chkListAux, ListaIdRubrica, LiRubrica[pgctrlPaginas2.ActivePageIndex+1], ',', false);
  edCodRubricas.Text := LiRubrica[pgctrlPaginas2.ActivePageIndex+1];
  chkListAux.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamVariavelMensal.bbtnConfirmarClick(Sender: TObject);
var
  c: byte;
  sListaIdTipoFolhaSel, sCodCCustoSel: string;
  iNum, iVirgula, iPos, iSinal, iConta: integer;
begin
  if (rgTipoRel.ItemIndex > 2) and (rgTipoRel.ItemIndex < 6) and (cmbOrderBy.ItemIndex <= 3) then
  begin
    MsgDlg('Relatório Sintético deve ter Ordem de Impressão por Centro de Custo.',
      'Aviso', mtInformation, [mbOk,mbHelp], 0);
    cmbOrderBy.SetFocus;
    ModalResult := mrNone;
    exit;
  end;

  if ((rgTipoRel.ItemIndex = 2) or (rgTipoRel.ItemIndex = 5)) and
     (MsgDlg('Informo que a opção "Acumulativa" é bem mais demorada.'+CR_LF+
      'Confirma execução assim mesmo ?', 'Aviso', mtInformation, [mbYes,mbNo], 0) = mrNo) then
  begin
    rgTipoRel.SetFocus;
    ModalResult := mrNone;
    exit;
  end;

  if (rgProcesso.ItemIndex = 0) and
     (MsgDlg('Execução a partir de Prévias.'+CR_LF+
      'Tem certeza de que é isto mesmo que deseja ?', 'Aviso', mtInformation, [mbYes,mbNo], 0) = mrNo) then
  begin
    rgProcesso.ItemIndex := 1;
    ModalResult := mrNone;
    exit;
  end;

  // Estabelecimentos selecionados
  FU.CriaListaOpcoes(chklstEstab, ListaIdEstab, sListaIdEstabSel, ',', false);

  // Tipos de Folha selecionados
  iNum := FU.CriaListaOpcoes(chklstTipoFolha, ListaIdTipoFolha, sListaIdTipoFolhaSel, ',', false);
  if (iNum = ListaIdTipoFolha.Count) then
    sListaIdTipoFolhaSel := '';

  // Verifica se algum C. de Custo foi selecionado
  iNum := FU.CriaListaOpcoes (chklstCCusto, ListaCodCCusto, sCodCCustoSel, ',', true);
  if (iNum = chklstCCusto.Items.Count-1) then
    sCodCCustoSel := '';

  // Seleção das Rubricas para cada Coluna
  for c:=1 to 8 do
  begin
    chkListAux := TColorCheckListBox(Self.FindComponent('chklstRubrica'+IntToStr(c)));
    FU.CriaListaOpcoes(chkListAux, ListaIdRubrica, LiRubricaSemSinal[c], ',', true);
    if (LiRubricaSemSinal[c] = '') then
      LiRubricaSemSinal[c] := QuotedStr('+XYZ');
    if (LiRubrica[c] = '') then
      LiRubrica[c] := QuotedStr('+XYZ');

    Cmp_Padrao.ParamByName('CodRubricas'+IntToStr(c)).asString := LiRubricaSemSinal[c];

    iSinal := 0;
    iConta := 0;
    while True do begin
       iPos := Pos('-',copy(LiRubrica[c],iSinal+1,length(LiRubrica[c])));
       if iPos = 0 then break;
       iSinal := iSinal + iPos;
       inc(iConta);
       iPos := Pos(',',copy(LiRubrica[c],iSinal+1,length(LiRubrica[c])));
       iVirgula := iSinal + iPos;
       Cmp_Padrao.ParamByName('CodRubricasComSinal'+IntToStr(c)).asString :=
         Cmp_Padrao.ParamByName('CodRubricasComSinal'+IntToStr(c)).asString +
         FU.iff(iConta > 1, ',', '') +
         QuotedStr(copy(LiRubrica[c],iSinal+1,FU.iff(iVirgula=iSinal,length(LiRubrica[c]),iVirgula-iSinal-1)));
    end;
    if Cmp_Padrao.ParamByName('CodRubricasComSinal'+IntToStr(c)).asString = '' then
      Cmp_Padrao.ParamByName('CodRubricasComSinal'+IntToStr(c)).asString := QuotedStr('+XYZ');

    Cmp_Padrao.ParamByName('Titulo'+IntToStr(c)+'Linha1').asString := regTituloLinha[c].Linha1;
    Cmp_Padrao.ParamByName('Titulo'+IntToStr(c)+'Linha2').asString := regTituloLinha[c].Linha2;
  end;

  Cmp_Padrao.ParamByName('Titulo').asString := edTitulo.Text;
  Cmp_Padrao.ParamByName('TipoRelatorio').asInteger := rgTipoRel.ItemIndex;
  Cmp_Padrao.ParamByName('ListaIdEstab').asString := sListaIdEstabSel;
  Cmp_Padrao.ParamByName('SitFunc').asString := SelecionaSitFunc;
  Cmp_Padrao.ParamByName('TipoContrato').asString := SelecionaTipoContrato;
  Cmp_Padrao.ParamByName('CodCCusto').asString := sCodCCustoSel;
  Cmp_Padrao.ParamByName('ListaTipoFolha').asString := sListaIdTipoFolhaSel;
  Cmp_Padrao.ParamByName('Mes1').asString := speAno.Text +'/'+ FU.PoeZero(cmbMes.ItemIndex+1);
  Cmp_Padrao.ParamByName('Mes2').asString := speAno2.Text +'/'+ FU.PoeZero(cmbMes2.ItemIndex+1);
  Cmp_Padrao.ParamByName('Ordem').asInteger := cmbOrderBy.ItemIndex;
  Cmp_Padrao.ParamByName('MudaPagina').asBoolean := cbxMudaPagina.Checked;
  Cmp_Padrao.ParamByName('Processo').asInteger := rgProcesso.ItemIndex;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------
procedure TfrmParamVariavelMensal.LeAlteracoes;
var
  c: byte;
  sTitulo: string;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  LiRubrica[1] := ArqConfig.ReadString('REL_VARMENSAL', 'Rubricas1', '');
  LiRubrica[2] := ArqConfig.ReadString('REL_VARMENSAL', 'Rubricas2', '');
  LiRubrica[3] := ArqConfig.ReadString('REL_VARMENSAL', 'Rubricas3', '');
  LiRubrica[4] := ArqConfig.ReadString('REL_VARMENSAL', 'Rubricas4', '');
  LiRubrica[5] := ArqConfig.ReadString('REL_VARMENSAL', 'Rubricas5', '');
  LiRubrica[6] := ArqConfig.ReadString('REL_VARMENSAL', 'Rubricas6', '');
  LiRubrica[7] := ArqConfig.ReadString('REL_VARMENSAL', 'Rubricas7', '');
  LiRubrica[8] := ArqConfig.ReadString('REL_VARMENSAL', 'Rubricas8', '');
  sTitulo := ArqConfig.ReadString('REL_VARMENSAL', 'Titulo', 'Relação de Rubricas Selecionadas por Empregado');

  cbxEfetivos.Checked := (ArqConfig.ReadString('REL_VARMENSAL', 'Efetivos', 'V') = 'V');
  cbxEspeciais.Checked := (ArqConfig.ReadString('REL_VARMENSAL', 'Especiais', 'V') = 'V');
  cbxTemporarios.Checked := (ArqConfig.ReadString('REL_VARMENSAL', 'Temporarios', 'F') = 'V');
  cbxTerceiros.Checked := (ArqConfig.ReadString('REL_VARMENSAL', 'Terceiros', 'F') = 'V');
  cbxEstagiarios.Checked := (ArqConfig.ReadString('REL_VARMENSAL', 'Estagiarios', 'V') = 'V');
  cbxPropDirSemVinc.Checked := (ArqConfig.ReadString('REL_VARMENSAL', 'Proprietarios', 'F') = 'V');
  cbxAutonomos.Checked := (ArqConfig.ReadString('REL_VARMENSAL', 'Autonomos', 'F') = 'V');

  for c:=1 to 8 do
  begin
    regTituloLinha[c].Linha1 := ArqConfig.ReadString('REL_VARMENSAL', 'Coluna'+IntToStr(c)+'Linha1', '');
    regTituloLinha[c].Linha2 := ArqConfig.ReadString('REL_VARMENSAL', 'Coluna'+IntToStr(c)+'Linha2', '');
  end;

  FU.VerificaOpcoes(chklstRubrica1, ListaIdRubrica, StringReplace(LiRubrica[1],'-','',[rfReplaceAll]), ',');
  FU.VerificaOpcoes(chklstRubrica2, ListaIdRubrica, StringReplace(LiRubrica[2],'-','',[rfReplaceAll]), ',');
  FU.VerificaOpcoes(chklstRubrica3, ListaIdRubrica, StringReplace(LiRubrica[3],'-','',[rfReplaceAll]), ',');
  FU.VerificaOpcoes(chklstRubrica4, ListaIdRubrica, StringReplace(LiRubrica[4],'-','',[rfReplaceAll]), ',');
  FU.VerificaOpcoes(chklstRubrica5, ListaIdRubrica, StringReplace(LiRubrica[5],'-','',[rfReplaceAll]), ',');
  FU.VerificaOpcoes(chklstRubrica6, ListaIdRubrica, StringReplace(LiRubrica[6],'-','',[rfReplaceAll]), ',');
  FU.VerificaOpcoes(chklstRubrica7, ListaIdRubrica, StringReplace(LiRubrica[7],'-','',[rfReplaceAll]), ',');
  FU.VerificaOpcoes(chklstRubrica8, ListaIdRubrica, StringReplace(LiRubrica[8],'-','',[rfReplaceAll]), ',');

  edTitulo.Text := sTitulo;
  edCodRubricas.Text := LiRubrica[1];
  edTituloLinha1.Text := regTituloLinha[1].Linha1;
  edTituloLinha2.Text := regTituloLinha[1].Linha2;

  HabilitaBtOk;
end;

procedure TfrmParamVariavelMensal.GravaAlteracoes;
var
  c: byte;
begin
  // Gravar as últimas alterações da Seleção de Rubricas
  for c:=1 to 8 do
  begin
//    chkListAux := TColorCheckListBox(Self.FindComponent('chklstRubrica'+IntToStr(c)));
//    FU.CriaListaOpcoes(chkListAux, ListaIdRubrica, LiRubrica[c], ',', false);
    ArqConfig.WriteString('REL_VARMENSAL', 'Rubricas'+IntToStr(c), LiRubrica[c]);
  end;

  // Gravar o Título do Relatório
  ArqConfig.WriteString('REL_VARMENSAL', 'Titulo', edTitulo.Text);

  for c:=1 to 8 do
  begin
    ArqConfig.WriteString('REL_VARMENSAL', 'Coluna'+IntToStr(c)+'Linha1', regTituloLinha[c].Linha1);
    ArqConfig.WriteString('REL_VARMENSAL', 'Coluna'+IntToStr(c)+'Linha2', regTituloLinha[c].Linha2);
  end;

  ArqConfig.WriteString('REL_VARMENSAL', 'Efetivos', FU.IFF(cbxEfetivos.Checked,'V','F'));
  ArqConfig.WriteString('REL_VARMENSAL', 'Especiais', FU.IFF(cbxEspeciais.Checked,'V','F'));
  ArqConfig.WriteString('REL_VARMENSAL', 'Temporarios', FU.IFF(cbxTemporarios.Checked,'V','F'));
  ArqConfig.WriteString('REL_VARMENSAL', 'Terceiros', FU.IFF(cbxTerceiros.Checked,'V','F'));
  ArqConfig.WriteString('REL_VARMENSAL', 'Estagiarios', FU.IFF(cbxEstagiarios.Checked,'V','F'));
  ArqConfig.WriteString('REL_VARMENSAL', 'Proprietarios', FU.IFF(cbxPropDirSemVinc.Checked,'V','F'));
  ArqConfig.WriteString('REL_VARMENSAL', 'Autonomos', FU.IFF(cbxAutonomos.Checked,'V','F'));
end;

procedure TfrmParamVariavelMensal.HabilitaBtOk;
var
  c: integer;
  bSelRub1, bSelRub2, bSelRub3: boolean;
begin
  // Estabelecimentos selecionados
  FU.CriaListaOpcoes(chklstEstab, ListaIdEstab, sListaIdEstabSel, ',', false);

  bSelRub1 := false;
  for c:=0 to chklstRubrica1.Items.Count-1 do
    if (chklstRubrica1.Checked[c]) then
    begin
      bSelRub1 := true;
      break;
    end;

  bSelRub2 := false;
  for c:=0 to chklstRubrica2.Items.Count-1 do
    if (chklstRubrica2.Checked[c]) then
    begin
      bSelRub2 := true;
      break;
    end;

  bSelRub3 := false;
  for c:=0 to chklstRubrica3.Items.Count-1 do
    if (chklstRubrica3.Checked[c]) then
    begin
      bSelRub3 := true;
      break;
    end;

  bbtnConfirmar.Enabled := ((bSelRub1) or (bSelRub2) or (bSelRub3)) and
    (sListaIdEstabSel <> '') and (Trim(speAno.Text) <> '') and
    ((Trim(regTituloLinha[1].Linha1) <> '') or (Trim(regTituloLinha[1].Linha2) <> '') or
     (Trim(regTituloLinha[2].Linha1) <> '') or (Trim(regTituloLinha[2].Linha2) <> '') or
     (Trim(regTituloLinha[3].Linha1) <> '') or (Trim(regTituloLinha[3].Linha2) <> ''));
end;

function TfrmParamVariavelMensal.SelecionaTipoContrato: string;
begin
  Result := '';

  if (cbxEfetivos.Checked) then
    Result := QuotedStr('E');

  if (cbxEspeciais.Checked) then
    if (length(Result) > 0) then
      Result := Result +','+ QuotedStr('S')
    else
      Result := QuotedStr('S');

  if (cbxTemporarios.Checked) then
    if (length(Result) > 0) then
      Result := Result +','+ QuotedStr('T')
    else
      Result := QuotedStr('T');

  if (cbxTerceiros.Checked) then
    if (length(Result) > 0) then
      Result := Result +','+ QuotedStr('3')
    else
      Result := QuotedStr('3');

  if (cbxPropDirSemVinc.Checked) then
    if (length(Result) > 0) then
      Result := Result +','+ QuotedStr('P')
    else
      Result := QuotedStr('P');

  if (cbxAutonomos.Checked) then
    if (length(Result) > 0) then
      Result := Result +','+ QuotedStr('A')
    else
      Result := QuotedStr('A');

  if (cbxEstagiarios.Checked) then
    if (length(Result) > 0) then
      Result := Result +','+ QuotedStr('G')
    else
      Result := QuotedStr('G');
end;

function TfrmParamVariavelMensal.SelecionaSitFunc: string;
begin
  Result := '';
  if (cbxAtivos.Checked) then
    Result := QuotedStr('A');

  if (cbxAfastados.Checked) then
    if (length(Result) > 0) then
      Result := Result +','+ QuotedStr('F')
    else
      Result := QuotedStr('F');

  if (cbxDemitidos.Checked) then
    if (length(Result) > 0) then
      Result := Result +','+ QuotedStr('D')
    else
      Result := QuotedStr('D');
end;

procedure TfrmParamVariavelMensal.bbtnDicaClick(Sender: TObject);
begin
  inherited;
  townDica.Top := 100;
  townDica.BringToFront;
  townDica.Visible := true;
  Self.Enabled := false;
end;

procedure TfrmParamVariavelMensal.btnFecharDicaClick(Sender: TObject);
begin
  inherited;
  Self.Enabled := true;
  townDica.Visible := false;
end;

procedure TfrmParamVariavelMensal.cmbOrderByChange(Sender: TObject);
begin
  inherited;
  cbxMudaPagina.Visible  := (rgTipoRel.ItemIndex in [0,1,2,6]) and
                            (cmbOrderBy.ItemIndex > 3);
end;

procedure TfrmParamVariavelMensal.bbtnSelTodosEstabClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := true;
  chklstEstab.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamVariavelMensal.bbtnInverteSelEstabClick(
  Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := not(chklstEstab.Checked[c]);
  chklstEstab.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamVariavelMensal.chklstEstabClickCheck(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
end;

end.
