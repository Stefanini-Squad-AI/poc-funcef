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
unit fParamAlfabMensal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwdatsrc, Mask, wwdbedit,
  Wwdotdot, Wwdbcomb, Machklb, wwdblook, checklst, TREdit, Spin, IvDictio, IvMulti, IvEMulti,
  ComCtrls, Grids, Wwdbigrd, IniFiles, Wwdbgrid, FSairAjuda, DBClient, uCMClientDataSet,
  fParamReports_Padrao, CmParamReport, uCtrlPessoaFilialPessoa, uCtrlGlobalRH, uCtrlProvDesc,
  ColorCheckListBox;

type
  TRegTitulo = record
    Linha1, Linha2: string;
  end;

  TfrmParamAlfabMensal = class(TfrmParamReports_Padrao)
    CdsEstab: TCMClientDataSet;
    gbxAnoMesRef: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    gbxTitulo: TGroupBox;
    edTitulo: TEdit;
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
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
    procedure dblkcbEstabChange(Sender: TObject);
    procedure edTituloLinha1Change(Sender: TObject);
    procedure gbxTipContraExit(Sender: TObject);
    procedure gbxSituacaoExit(Sender: TObject);
    procedure gbxTipContraEnter(Sender: TObject);
    procedure gbxSituacaoEnter(Sender: TObject);
    procedure bbtnSelTodosEstabClick(Sender: TObject);
    procedure bbtnInverteSelEstabClick(Sender: TObject);
    procedure chklstEstabClickCheck(Sender: TObject);
  private
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlProvDesc: TCtrlProvDesc;

    ArqConfig: TIniFile;
    chkListAux: TColorCheckListBox;
    ListaIdRubrica, ListaIdEstab: TStringList;

    sListaIdEstabSel: string;

    regTituloLinha: array[1..3] of TRegTitulo;
    sListaIdRubricaSel: array[1..3] of string;
    bSitAtivo, bSitAfast, bSitDemit, bTipContrEfet, bTipContrEspec, bTipContrTemp,
    bTipContrEst, bTipContrTerc, bTipContrProp, bTipContrAut: boolean;

    procedure HabilitaBtOk;
    procedure LeAlteracoes;
    procedure GravaAlteracoes;
  end;

var
  frmParamAlfabMensal: TfrmParamAlfabMensal;

implementation

uses uSistema, uMensErro, fAguarde, uCtrlPadroes, uCtrlFuncoesRH, dCds, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmParamAlfabMensal.FormCreate(Sender: TObject);
var
  NormalIni: TDate;
  c: byte;
begin
  inherited;
  ListaIdRubrica := TStringList.Create;
  ListaIdEstab := TStringList.Create;

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

  // Monto a Lista de Rubricas
  chklstRubrica1.Items.Clear;
  chklstRubrica2.Items.Clear;
  chklstRubrica3.Items.Clear;
  dmCds.Cds.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdRubrica.Add(dmCds.Cds.FieldByName('CODPROVDESC').asString);
    chklstRubrica1.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    chklstRubrica2.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    chklstRubrica3.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
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

  NormalIni := CtrlGlobalRH.GetNormalIni;
  cmbMes.ItemIndex := FU.ExtraiMes(NormalIni) - 1;
  speAno.Value := FU.ExtraiAno(NormalIni);

  cmbOrderBy.ItemIndex := 0;
  pgctrlPaginas.ActivePageIndex  := 0;
  pgctrlPaginas2.ActivePageIndex := 0;
  edTituloLinha1.Text := '';
  edTituloLinha2.Text := '';

  // Carrega alterações nas opções feitas anteriormente
  LeAlteracoes;
end;

procedure TfrmParamAlfabMensal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlProvDesc);
  GravaAlteracoes;
  FreeAndNil(ListaIdRubrica);
  FreeAndNil(ListaIdEstab);
  inherited;
end;

procedure TfrmParamAlfabMensal.dblkcbEstabChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamAlfabMensal.pgctrlPaginas2Change(Sender: TObject);
begin
  edCodRubricas.Text := sListaIdRubricaSel[pgctrlPaginas2.ActivePageIndex+1];
  edTituloLinha1.Text := regTituloLinha[pgctrlPaginas2.ActivePageIndex+1].Linha1;
  edTituloLinha2.Text := regTituloLinha[pgctrlPaginas2.ActivePageIndex+1].Linha2;
end;

procedure TfrmParamAlfabMensal.edTituloLinha1Change(Sender: TObject);
begin
  if (TEdit(Sender).Name = 'edTituloLinha1') then
    regTituloLinha[pgctrlPaginas2.ActivePageIndex+1].Linha1 := edTituloLinha1.Text
  else
    regTituloLinha[pgctrlPaginas2.ActivePageIndex+1].Linha2 := edTituloLinha2.Text;

  HabilitaBtOk;
end;

procedure TfrmParamAlfabMensal.gbxTipContraEnter(Sender: TObject);
begin
  bTipContrEfet := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp := cbxTemporarios.Checked;
  bTipContrEst := cbxEstagiarios.Checked;
  bTipContrTerc := cbxTerceiros.Checked;
  bTipContrProp := cbxPropDirSemVinc.Checked;
  bTipContrAut := cbxAutonomos.Checked;
end;

procedure TfrmParamAlfabMensal.gbxSituacaoEnter(Sender: TObject);
begin
  bSitAtivo := (cbxAtivos.Checked);
  bSitAfast := (cbxAfastados.Checked);
  bSitDemit := (cbxDemitidos.Checked);
end;

procedure TfrmParamAlfabMensal.gbxTipContraExit(Sender: TObject);
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

procedure TfrmParamAlfabMensal.gbxSituacaoExit(Sender: TObject);
begin
  if not(cbxAtivos.Checked) and not(cbxAfastados.Checked) and not(cbxDemitidos.Checked) then
  begin
    MsgDlg('Pelo menos um Tipo de Situação deve ser selecionado.', 'Aviso',
      mtWarning, [mbOk,mbHelp], 0);
    cbxAtivos.SetFocus;
  end;
end;

procedure TfrmParamAlfabMensal.chklstRubrica1ClickCheck(Sender: TObject);
begin
  inherited;
  FU.CriaListaOpcoes(TColorCheckListBox(Self.FindComponent('chklstRubrica'+
    IntToStr(pgctrlPaginas2.ActivePageIndex+1))), ListaIdRubrica,
    sListaIdRubricaSel[pgctrlPaginas2.ActivePageIndex+1], ',', false);

  edCodRubricas.Text := sListaIdRubricaSel[pgctrlPaginas2.ActivePageIndex+1];

  HabilitaBtOk;
end;

procedure TfrmParamAlfabMensal.sbtnMarcarRubClick(Sender: TObject);
begin
  edCodRubricas.Text := Trim(edCodRubricas.Text);

  FU.VerificaOpcoes(TColorCheckListBox(Self.FindComponent('chklstRubrica'+
    IntToStr(pgctrlPaginas2.ActivePageIndex+1))), ListaIdRubrica, edCodRubricas.Text, ',');

  sListaIdRubricaSel[pgctrlPaginas2.ActivePageIndex+1] := edCodRubricas.Text;

  TColorCheckListBox(Self.FindComponent('chklstRubrica'+
    IntToStr(pgctrlPaginas2.ActivePageIndex+1))).Repaint;

  HabilitaBtOk;
end;

procedure TfrmParamAlfabMensal.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  chkListAux := TColorCheckListBox(Self.FindComponent('chklstRubrica'+
    IntToStr(pgctrlPaginas2.ActivePageIndex+1)));

  for c:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[c] := true;

  FU.CriaListaOpcoes(chkListAux, ListaIdRubrica,
    sListaIdRubricaSel[pgctrlPaginas2.ActivePageIndex+1], ',', false);

  edCodRubricas.Text := sListaIdRubricaSel[pgctrlPaginas2.ActivePageIndex+1];

  chkListAux.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamAlfabMensal.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  chkListAux := TColorCheckListBox(Self.FindComponent('chklstRubrica'+
    IntToStr(pgctrlPaginas2.ActivePageIndex+1)));

  for c:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[c] := not(chkListAux.Checked[c]);

  FU.CriaListaOpcoes(chkListAux, ListaIdRubrica,
    sListaIdRubricaSel[pgctrlPaginas2.ActivePageIndex+1], ',', false);

  edCodRubricas.Text := sListaIdRubricaSel[pgctrlPaginas2.ActivePageIndex+1];

  chkListAux.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamAlfabMensal.bbtnConfirmarClick(Sender: TObject);
begin
  // Rubricas para Remuneração selecionadas
  FU.CriaListaOpcoes(chklstRubrica1, ListaIdRubrica, sListaIdRubricaSel[1], ',', true);
  if (sListaIdRubricaSel[1] = '') then
    sListaIdRubricaSel[1] := QuotedStr('-1');

  // Rubricas para Contribuição selecionadas
  FU.CriaListaOpcoes(chklstRubrica2, ListaIdRubrica, sListaIdRubricaSel[2], ',', true);
  if (sListaIdRubricaSel[2] = '') then
    sListaIdRubricaSel[2] := QuotedStr('-1');

  // Rubricas para Anuênio selecionadas
  FU.CriaListaOpcoes(chklstRubrica3, ListaIdRubrica, sListaIdRubricaSel[3], ',', true);
  if (sListaIdRubricaSel[3] = '') then
    sListaIdRubricaSel[3] := QuotedStr('-1');

  Cmp_Padrao.ParamByName('ListaIdEstab').asString := sListaIdEstabSel;
  Cmp_Padrao.ParamByName('MesRef').asInteger := cmbMes.ItemIndex+1;
  Cmp_Padrao.ParamByName('AnoRef').asInteger := speAno.Value;
  Cmp_Padrao.ParamByName('ListaIdRubrica1').asString := sListaIdRubricaSel[1];
  Cmp_Padrao.ParamByName('ListaIdRubrica2').asString := sListaIdRubricaSel[2];
  Cmp_Padrao.ParamByName('ListaIdRubrica3').asString := sListaIdRubricaSel[3];
  Cmp_Padrao.ParamByName('TipoContrato').asString := FU.GerarListaTipoContratoSel(
    cbxEfetivos.Checked, cbxEspeciais.Checked, cbxTemporarios.Checked, cbxTerceiros.Checked,
    cbxPropDirSemVinc.Checked, cbxAutonomos.Checked, cbxEstagiarios.Checked, true);
  Cmp_Padrao.ParamByName('SitFunc').asString := FU.GerarListaSitFuncSel(cbxAtivos.Checked,
    cbxAfastados.Checked, cbxDemitidos.Checked, true);
  Cmp_Padrao.ParamByName('Titulo1Linha1').asString := regTituloLinha[1].Linha1;
  Cmp_Padrao.ParamByName('Titulo1Linha2').asString := regTituloLinha[1].Linha2;
  Cmp_Padrao.ParamByName('Titulo2Linha1').asString := regTituloLinha[2].Linha1;
  Cmp_Padrao.ParamByName('Titulo2Linha2').asString := regTituloLinha[2].Linha2;
  Cmp_Padrao.ParamByName('Titulo3Linha1').asString := regTituloLinha[3].Linha1;
  Cmp_Padrao.ParamByName('Titulo3Linha2').asString := regTituloLinha[3].Linha2;
  Cmp_Padrao.ParamByName('TituloRelatorio').asString := edTitulo.Text;
  Cmp_Padrao.ParamByName('Ordenacao').asInteger := cmbOrderBy.ItemIndex;
  
  frmAguarde.Mostra('Rel. de Empregados Alfabética Mensal');
  frmAguarde.Pos := 0;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmParamAlfabMensal.HabilitaBtOk;
var
  c, I: integer;
  bSelRub: array[1..3] of boolean;
begin
  // Estabelecimentos selecionados
  FU.CriaListaOpcoes(chklstEstab, ListaIdEstab, sListaIdEstabSel, ',', false);

  for I:=1 to 3 do
  begin
    bSelRub[I] := false;
    chkListAux := TColorCheckListBox(Self.FindComponent('chklstRubrica'+IntToStr(I)));

    for c:=0 to chkListAux.Items.Count-1 do
      if (chkListAux.Checked[c]) then
      begin
        bSelRub[I] := true;
        break;
      end;
  end;

  bbtnConfirmar.Enabled := ((bSelRub[1]) or (bSelRub[2]) or (bSelRub[3])) and
    (sListaIdEstabSel <> '') and (Trim(speAno.Text) <> '') and
    ((Trim(regTituloLinha[1].Linha1) <> '') or (Trim(regTituloLinha[1].Linha2) <> '') or
     (Trim(regTituloLinha[2].Linha1) <> '') or (Trim(regTituloLinha[2].Linha2) <> '') or
     (Trim(regTituloLinha[3].Linha1) <> '') or (Trim(regTituloLinha[3].Linha2) <> ''));
end;

procedure TfrmParamAlfabMensal.LeAlteracoes;
var
  c: integer;
  sTitulo: string;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+ '\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  sListaIdRubricaSel[1] := ArqConfig.ReadString('REL_ALFABMENSAL', 'Rubricas1', '');
  sListaIdRubricaSel[2] := ArqConfig.ReadString('REL_ALFABMENSAL', 'Rubricas2', '');
  sListaIdRubricaSel[3] := ArqConfig.ReadString('REL_ALFABMENSAL', 'Rubricas3', '');
  sTitulo    := ArqConfig.ReadString('REL_ALFABMENSAL', 'Titulo', 'Relação de Empregados Alfabética Mensal');

  cbxEfetivos.Checked := (ArqConfig.ReadString('REL_ALFABMENSAL', 'Efetivos', 'V') = 'V');
  cbxEspeciais.Checked := (ArqConfig.ReadString('REL_ALFABMENSAL', 'Especiais', 'V') = 'V');
  cbxTemporarios.Checked := (ArqConfig.ReadString('REL_ALFABMENSAL', 'Temporarios', 'F') = 'V');
  cbxTerceiros.Checked := (ArqConfig.ReadString('REL_ALFABMENSAL', 'Terceiros', 'F') = 'V');
  cbxEstagiarios.Checked := (ArqConfig.ReadString('REL_ALFABMENSAL', 'Estagiarios', 'V') = 'V');
  cbxPropDirSemVinc.Checked := (ArqConfig.ReadString('REL_ALFABMENSAL', 'Proprietarios', 'F') = 'V');
  cbxAutonomos.Checked := (ArqConfig.ReadString('REL_ALFABMENSAL', 'Autonomos', 'F') = 'V');

  for c:=1 to 3 do
  begin
    regTituloLinha[c].Linha1 := ArqConfig.ReadString('REL_ALFABMENSAL', 'Coluna'+IntToStr(c)+'Linha1', '');
    regTituloLinha[c].Linha2 := ArqConfig.ReadString('REL_ALFABMENSAL', 'Coluna'+IntToStr(c)+'Linha2', '');
  end;

  FU.VerificaOpcoes(chklstRubrica1, ListaIdRubrica, sListaIdRubricaSel[1], ',');
  FU.VerificaOpcoes(chklstRubrica2, ListaIdRubrica, sListaIdRubricaSel[2], ',');
  FU.VerificaOpcoes(chklstRubrica3, ListaIdRubrica, sListaIdRubricaSel[3], ',');

  edTitulo.Text := sTitulo;
  edCodRubricas.Text  := sListaIdRubricaSel[1];
  edTituloLinha1.Text := regTituloLinha[1].Linha1;
  edTituloLinha2.Text := regTituloLinha[1].Linha2;

  HabilitaBtOk;
end;

procedure TfrmParamAlfabMensal.GravaAlteracoes;
var
  c: integer;
begin
  // Grava as últimas alterações da Opção de Rubricas 1
  FU.CriaListaOpcoes(chklstRubrica1, ListaIdRubrica, sListaIdRubricaSel[1], ',', false);
  ArqConfig.WriteString('REL_ALFABMENSAL', 'Rubricas1', sListaIdRubricaSel[1]);

  // Grava as últimas alterações da Opção de Rubricas 2
  FU.CriaListaOpcoes(chklstRubrica2, ListaIdRubrica, sListaIdRubricaSel[2], ',', false);
  ArqConfig.WriteString('REL_ALFABMENSAL', 'Rubricas2', sListaIdRubricaSel[2]);

  // Grava as últimas alterações da Opção de Rubricas 3
  FU.CriaListaOpcoes(chklstRubrica3, ListaIdRubrica, sListaIdRubricaSel[3], ',', false);
  ArqConfig.WriteString('REL_ALFABMENSAL', 'Rubricas3', sListaIdRubricaSel[3]);

  // Grava o Título do Relatório
  ArqConfig.WriteString('REL_ALFABMENSAL', 'Titulo', edTitulo.Text);

  for c:=1 to 3 do
  begin
    ArqConfig.WriteString('REL_ALFABMENSAL', 'Coluna'+IntToStr(c)+'Linha1', regTituloLinha[c].Linha1);
    ArqConfig.WriteString('REL_ALFABMENSAL', 'Coluna'+IntToStr(c)+'Linha2', regTituloLinha[c].Linha2);
  end;

  ArqConfig.WriteString('REL_ALFABMENSAL', 'Efetivos', FU.IFF(cbxEfetivos.Checked,'V','F'));
  ArqConfig.WriteString('REL_ALFABMENSAL', 'Especiais', FU.IFF(cbxEspeciais.Checked,'V','F'));
  ArqConfig.WriteString('REL_ALFABMENSAL', 'Temporarios', FU.IFF(cbxTemporarios.Checked,'V','F'));
  ArqConfig.WriteString('REL_ALFABMENSAL', 'Terceiros', FU.IFF(cbxTerceiros.Checked,'V','F'));
  ArqConfig.WriteString('REL_ALFABMENSAL', 'Estagiarios', FU.IFF(cbxEstagiarios.Checked,'V','F'));
  ArqConfig.WriteString('REL_ALFABMENSAL', 'Proprietarios', FU.IFF(cbxPropDirSemVinc.Checked,'V','F'));
  ArqConfig.WriteString('REL_ALFABMENSAL', 'Autonomos', FU.IFF(cbxAutonomos.Checked,'V','F'));
end;

procedure TfrmParamAlfabMensal.bbtnSelTodosEstabClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := true;
  chklstEstab.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamAlfabMensal.bbtnInverteSelEstabClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := not(chklstEstab.Checked[c]);
  chklstEstab.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamAlfabMensal.chklstEstabClickCheck(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
end;

end.
