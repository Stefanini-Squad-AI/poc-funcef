// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
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

//------------------------------------------------------------------------------
unit fParamDemPagEspecial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn, StdCtrls,
  fParamReports_Padrao, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwdatsrc, Mask,
  wwdbedit, Wwdotdot, Wwdbcomb, Machklb, wwdblook, checklst, TREdit, Spin, IvDictio, IvMulti,
  IvEMulti, ComCtrls, Grids, Wwdbigrd, IniFiles, Wwdbgrid, CmParamReport, DBClient,
  uCMClientDataSet, uCtrlGlobalRH, uCtrlPessoaFilialPessoa, uCtrlProvDesc,
  uCtrlListTerceirosRH, ColorCheckListBox;

type
  TRegTitulo = record
    Linha1: string;
  end;

  TfrmParamDemPagEspecial = class(TfrmParamReports_Padrao)
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
    CdsEstab: TCMClientDataSet;
    rgBuscaHist: TRadioGroup;
    edTituloLinha1: TwwDBEdit;
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
    procedure spbtSelecaoClick(Sender: TObject);
    procedure spbtInvSelecaoClick(Sender: TObject);
    procedure gbxTipContraEnter(Sender: TObject);
    procedure gbxSituacaoEnter(Sender: TObject);
    procedure bbtnSelTodosEstabClick(Sender: TObject);
    procedure bbtnInverteSelEstabClick(Sender: TObject);
    procedure chklstEstabClickCheck(Sender: TObject);
  private
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlProvDesc: TCtrlProvDesc;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;

    ArqConfig: TIniFile;
    chkListAux: TColorCheckListBox;
    ListaIdRubrica, ListaCodCCusto, ListaIdEstab: TStringList;

    sListaIdEstabSel: String;

    regTituloLinha: array[1..8] of TRegTitulo;
    LiRubrica: array[1..8] of string;
    bSitAtivo, bSitAfast, bSitDemit, bTipContrEfet, bTipContrEspec, bTipContrTemp,
    bTipContrEst, bTipContrTerc, bTipContrProp, bTipContrAut: boolean;

    procedure LeAlteracoes;
    procedure GravaAlteracoes;
    procedure HabilitaBtOk;
    function  SelecionaTipoContrato: string;
    function  SelecionaSitFunc: string;
  public
    sMes, sMes2: string;
  end;

var
  frmParamDemPagEspecial: TfrmParamDemPagEspecial;

implementation

uses uSistema, uMensErro, fAguarde, dCds, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmParamDemPagEspecial.FormCreate(Sender: TObject);
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

  ListaIdRubrica := TStringList.Create;
  ListaCodCCusto := TStringList.Create;
  ListaIdEstab := TStringList.Create;

  NormalIni := CtrlGlobalRH.GetNormalIni;
  cmbMes.ItemIndex := FU.ExtraiMes(NormalIni) - 1;
  speAno.Value := FU.ExtraiAno(NormalIni);

  cmbMes2.ItemIndex := FU.ExtraiMes(NormalIni) - 1;
  speAno2.Value := FU.ExtraiAno(NormalIni);

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

  chkListAux := chklstRubrica1;
  cmbOrderBy.ItemIndex := 0;
  pgctrlPaginas.ActivePageIndex := 0;
  pgctrlPaginas2.ActivePageIndex := 0;
  edTituloLinha1.Text := '';

  // Carrega alterações nas opções feitas anteriormente
  LeAlteracoes;
end;

procedure TfrmParamDemPagEspecial.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravaAlteracoes;

  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlProvDesc);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(ListaIdRubrica);
  FreeAndNil(ListaCodCCusto);
  FreeAndNil(ListaIdEstab);
  inherited;
end;

procedure TfrmParamDemPagEspecial.pgctrlPaginas2Change(Sender: TObject);
begin
  chkListAux := TColorCheckListBox(Self.FindComponent('chklstRubrica'+
    IntToStr(pgctrlPaginas2.ActivePageIndex+1)));
  edCodRubricas.Text := LiRubrica[pgctrlPaginas2.ActivePageIndex + 1];
  edTituloLinha1.Text := regTituloLinha[pgctrlPaginas2.ActivePageIndex+1].Linha1;
end;

procedure TfrmParamDemPagEspecial.edTituloLinha1Change(Sender: TObject);
begin
  regTituloLinha[pgctrlPaginas2.ActivePageIndex+1].Linha1 := edTituloLinha1.Text;
  HabilitaBtOk;
end;

procedure TfrmParamDemPagEspecial.gbxTipContraEnter(Sender: TObject);
begin
  bTipContrEfet := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp := cbxTemporarios.Checked;
  bTipContrEst := cbxEstagiarios.Checked;
  bTipContrTerc := cbxTerceiros.Checked;
  bTipContrProp := cbxPropDirSemVinc.Checked;
  bTipContrAut := cbxAutonomos.Checked;
end;

procedure TfrmParamDemPagEspecial.gbxSituacaoEnter(Sender: TObject);
begin
  bSitAtivo := (cbxAtivos.Checked);
  bSitAfast := (cbxAfastados.Checked);
  bSitDemit := (cbxDemitidos.Checked);
end;

procedure TfrmParamDemPagEspecial.gbxTipContraExit(Sender: TObject);
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

procedure TfrmParamDemPagEspecial.gbxSituacaoExit(Sender: TObject);
begin
  if not(cbxAtivos.Checked) and not(cbxAfastados.Checked) and not(cbxDemitidos.Checked) then
  begin
    MsgDlg('Pelo menos um Tipo de Situação deve ser selecionado.', 'Aviso',
      mtWarning, [mbOk,mbHelp], 0);
    cbxAtivos.SetFocus;
  end;
end;

procedure TfrmParamDemPagEspecial.chklstRubrica1ClickCheck(Sender: TObject);
begin
  inherited;
  FU.CriaListaOpcoes(chkListAux, ListaIdRubrica, LiRubrica[pgctrlPaginas2.ActivePageIndex+1],
    ',', false);
  edCodRubricas.Text := LiRubrica[pgctrlPaginas2.ActivePageIndex+1];
  HabilitaBtOk;
end;

procedure TfrmParamDemPagEspecial.spbtSelecaoClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstCCusto.Items.Count-1 do
    chklstCCusto.Checked[c] := true;
  chklstCCusto.Repaint;
end;

procedure TfrmParamDemPagEspecial.spbtInvSelecaoClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstCCusto.Items.Count-1 do
    chklstCCusto.Checked[c] := not(chklstCCusto.Checked[c]);
  chklstCCusto.Repaint;
end;

procedure TfrmParamDemPagEspecial.sbtnMarcarRubClick(Sender: TObject);
begin
  edCodRubricas.Text := Trim(edCodRubricas.Text);
  FU.VerificaOpcoes (chkListAux, ListaIdRubrica, edCodRubricas.Text, ',');
  LiRubrica[pgctrlPaginas2.ActivePageIndex+1] := edCodRubricas.Text;
  chkListAux.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamDemPagEspecial.bbtnSelTodosClick(Sender: TObject);
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

procedure TfrmParamDemPagEspecial.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[c] := not(chkListAux.Checked[c]);

  FU.CriaListaOpcoes(chkListAux, ListaIdRubrica, LiRubrica[pgctrlPaginas2.ActivePageIndex+1],
    ',', false);
  edCodRubricas.Text := LiRubrica[pgctrlPaginas2.ActivePageIndex+1];
  chkListAux.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamDemPagEspecial.bbtnConfirmarClick(Sender: TObject);
var
  c: byte;
  sCodCCustoSel: string;
  iNum: integer;
begin
  // Estabelecimentos selecionados
  FU.CriaListaOpcoes(chklstEstab, ListaIdEstab, sListaIdEstabSel, ',', false);

  // Verifica se algum C. de Custo foi selecionado
  iNum := FU.CriaListaOpcoes (chklstCCusto, ListaCodCCusto, sCodCCustoSel, ',', true);
  if (iNum = chklstCCusto.Items.Count-1) then
    sCodCCustoSel := '';

  // Seleção das Rubricas para cada Grupo
  for c:=1 to 8 do
  begin
    chkListAux := TColorCheckListBox(Self.FindComponent('chklstRubrica'+IntToStr(c)));
    FU.CriaListaOpcoes(chkListAux, ListaIdRubrica, LiRubrica[c], ',', true);
    if (LiRubrica[c] = '') then
      LiRubrica[c] := QuotedStr('-1');

    Cmp_Padrao.ParamByName('CodRubricas'+IntToStr(c)).asString := LiRubrica[c];
    Cmp_Padrao.ParamByName('Titulo'+IntToStr(c)+'Linha1').asString := regTituloLinha[c].Linha1;
  end;

  Cmp_Padrao.ParamByName('Titulo').asString := edTitulo.Text;
  Cmp_Padrao.ParamByName('ListaIdEstab').asString := sListaIdEstabSel;
  Cmp_Padrao.ParamByName('SitFunc').asString := SelecionaSitFunc;
  Cmp_Padrao.ParamByName('TipoContrato').asString := SelecionaTipoContrato;
  Cmp_Padrao.ParamByName('CodCCusto').asString := sCodCCustoSel;
  Cmp_Padrao.ParamByName('Mes1').asString := speAno.Text +'/'+ FU.PoeZero(cmbMes.ItemIndex+1);
  Cmp_Padrao.ParamByName('Mes2').asString := speAno2.Text +'/'+ FU.PoeZero(cmbMes2.ItemIndex+1);
  Cmp_Padrao.ParamByName('Ordem').asInteger := cmbOrderBy.ItemIndex;
  Cmp_Padrao.ParamByName('BuscaHist').asInteger := rgBuscaHist.ItemIndex;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmParamDemPagEspecial.LeAlteracoes;
var
  c: byte;
  sTitulo: string;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+ '\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  LiRubrica[1] := ArqConfig.ReadString('REL_DEMPAGESP', 'Rubricas1', '');
  LiRubrica[2] := ArqConfig.ReadString('REL_DEMPAGESP', 'Rubricas2', '');
  LiRubrica[3] := ArqConfig.ReadString('REL_DEMPAGESP', 'Rubricas3', '');
  LiRubrica[4] := ArqConfig.ReadString('REL_DEMPAGESP', 'Rubricas4', '');
  LiRubrica[5] := ArqConfig.ReadString('REL_DEMPAGESP', 'Rubricas5', '');
  LiRubrica[6] := ArqConfig.ReadString('REL_DEMPAGESP', 'Rubricas6', '');
  LiRubrica[7] := ArqConfig.ReadString('REL_DEMPAGESP', 'Rubricas7', '');
  LiRubrica[8] := ArqConfig.ReadString('REL_DEMPAGESP', 'Rubricas8', '');
  sTitulo := ArqConfig.ReadString('REL_DEMPAGESP', 'Titulo', 'Demonstrativo de Pagamento Especial');

  cbxEfetivos.Checked := (ArqConfig.ReadString('REL_DEMPAGESP', 'Efetivos', 'V') = 'V');
  cbxEspeciais.Checked := (ArqConfig.ReadString('REL_DEMPAGESP', 'Especiais', 'V') = 'V');
  cbxTemporarios.Checked := (ArqConfig.ReadString('REL_DEMPAGESP', 'Temporarios', 'F') = 'V');
  cbxTerceiros.Checked := (ArqConfig.ReadString('REL_DEMPAGESP', 'Terceiros', 'F') = 'V');
  cbxEstagiarios.Checked := (ArqConfig.ReadString('REL_DEMPAGESP', 'Estagiarios', 'V') = 'V');
  cbxPropDirSemVinc.Checked := (ArqConfig.ReadString('REL_DEMPAGESP', 'Proprietarios', 'F') = 'V');
  cbxAutonomos.Checked := (ArqConfig.ReadString('REL_DEMPAGESP', 'Autonomos', 'F') = 'V');

  for c:=1 to 8 do
    regTituloLinha[c].Linha1 := ArqConfig.ReadString('REL_DEMPAGESP', 'Coluna'+IntToStr(c)+'Linha1', '');

  FU.VerificaOpcoes(chklstRubrica1, ListaIdRubrica, LiRubrica[1], ',');
  FU.VerificaOpcoes(chklstRubrica2, ListaIdRubrica, LiRubrica[2], ',');
  FU.VerificaOpcoes(chklstRubrica3, ListaIdRubrica, LiRubrica[3], ',');
  FU.VerificaOpcoes(chklstRubrica4, ListaIdRubrica, LiRubrica[4], ',');
  FU.VerificaOpcoes(chklstRubrica5, ListaIdRubrica, LiRubrica[5], ',');
  FU.VerificaOpcoes(chklstRubrica6, ListaIdRubrica, LiRubrica[6], ',');
  FU.VerificaOpcoes(chklstRubrica7, ListaIdRubrica, LiRubrica[7], ',');
  FU.VerificaOpcoes(chklstRubrica8, ListaIdRubrica, LiRubrica[8], ',');

  edTitulo.Text := sTitulo;
  edCodRubricas.Text := LiRubrica[1];
  edTituloLinha1.Text := regTituloLinha[1].Linha1;

  HabilitaBtOk;
end;

procedure TfrmParamDemPagEspecial.GravaAlteracoes;
var
  c: byte;
begin
  // Gravar as últimas alterações da Seleção de Rubricas
  for c:=1 to 8 do
  begin
    chkListAux := TColorCheckListBox(Self.FindComponent('chklstRubrica'+IntToStr(c)));
    FU.CriaListaOpcoes(chkListAux, ListaIdRubrica, LiRubrica[c], ',', false);
    ArqConfig.WriteString('REL_DEMPAGESP', 'Rubricas'+IntToStr(c), LiRubrica[c]);
  end;

  // Gravar o Título do Relatório
  ArqConfig.WriteString('REL_DEMPAGESP', 'Titulo', edTitulo.Text);

  for c:=1 to 8 do
    ArqConfig.WriteString('REL_DEMPAGESP', 'Coluna'+IntToStr(c)+'Linha1', regTituloLinha[c].Linha1);

  ArqConfig.WriteString('REL_DEMPAGESP', 'Efetivos', FU.IFF(cbxEfetivos.Checked,'V','F'));
  ArqConfig.WriteString('REL_DEMPAGESP', 'Especiais', FU.IFF(cbxEspeciais.Checked,'V','F'));
  ArqConfig.WriteString('REL_DEMPAGESP', 'Temporarios', FU.IFF(cbxTemporarios.Checked,'V','F'));
  ArqConfig.WriteString('REL_DEMPAGESP', 'Terceiros', FU.IFF(cbxTerceiros.Checked,'V','F'));
  ArqConfig.WriteString('REL_DEMPAGESP', 'Estagiarios', FU.IFF(cbxEstagiarios.Checked,'V','F'));
  ArqConfig.WriteString('REL_DEMPAGESP', 'Proprietarios', FU.IFF(cbxPropDirSemVinc.Checked,'V','F'));
  ArqConfig.WriteString('REL_DEMPAGESP', 'Autonomos', FU.IFF(cbxAutonomos.Checked,'V','F'));
end;

procedure TfrmParamDemPagEspecial.HabilitaBtOk;
var
  c: integer;
  bSelRub1, bSelRub2, bSelRub3, bSelRub4, bSelRub5, bSelRub6, bSelRub7, bSelRub8: boolean;
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

  bSelRub4 := false;
  for c:=0 to chklstRubrica4.Items.Count-1 do
    if (chklstRubrica4.Checked[c]) then
    begin
      bSelRub4 := true;
      break;
    end;

  bSelRub5 := false;
  for c:=0 to chklstRubrica5.Items.Count-1 do
    if (chklstRubrica5.Checked[c]) then
    begin
      bSelRub5 := true;
      break;
    end;

  bSelRub6 := false;
  for c:=0 to chklstRubrica6.Items.Count-1 do
    if (chklstRubrica6.Checked[c]) then
    begin
      bSelRub6 := true;
      break;
    end;

  bSelRub7 := false;
  for c:=0 to chklstRubrica7.Items.Count-1 do
    if (chklstRubrica7.Checked[c]) then
    begin
      bSelRub7 := true;
      break;
    end;

  bSelRub8 := false;
  for c:=0 to chklstRubrica8.Items.Count-1 do
    if (chklstRubrica8.Checked[c]) then
    begin
      bSelRub8 := true;
      break;
    end;

  bbtnConfirmar.Enabled := ((bSelRub1) or (bSelRub2) or (bSelRub3)  or
                            (bSelRub4) or (bSelRub5) or (bSelRub6)  or
                            (bSelRub7) or (bSelRub8) or (bSelRub1)) and
    (sListaIdEstabSel <> '') and (Trim(speAno.Text) <> '') and
    ((Trim(regTituloLinha[1].Linha1) <> '') or (Trim(regTituloLinha[2].Linha1) <> '') or
     (Trim(regTituloLinha[3].Linha1) <> '') or (Trim(regTituloLinha[4].Linha1) <> '') or
     (Trim(regTituloLinha[5].Linha1) <> '') or (Trim(regTituloLinha[6].Linha1) <> '') or
     (Trim(regTituloLinha[7].Linha1) <> '') or (Trim(regTituloLinha[8].Linha1) <> ''));
end;

function TfrmParamDemPagEspecial.SelecionaTipoContrato: string;
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

function TfrmParamDemPagEspecial.SelecionaSitFunc: string;
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

procedure TfrmParamDemPagEspecial.bbtnSelTodosEstabClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := true;
  chklstEstab.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamDemPagEspecial.bbtnInverteSelEstabClick(
  Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := not(chklstEstab.Checked[c]);
  chklstEstab.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamDemPagEspecial.chklstEstabClickCheck(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
end;

end.
