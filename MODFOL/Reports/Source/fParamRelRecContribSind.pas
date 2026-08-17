// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamRelRecContribSind;

interface

uses
  Windows, Messages, SysUtils, Classes , Graphics, Controls, Forms, Dialogs, IvDictio,
  IvMulti , IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, Spin,
  DBTables, IniFiles, checklst, TREdit, ComCtrls, wwdbdatetimepicker, CMDateTimePicker,
  wwdblook, fParamReports_Padrao, CmParamReport, DBClient, uCMClientDataSet, ColorCheckListBox,
  uCtrlGlobalRH, uCtrlMotivo, uCtrlPessoaSindicato, uCtrlProvDesc, uCtrlPessoaFilialPessoa;

type
  TfrmParamRelRecContribSind = class(TfrmParamReports_Padrao)
    CdsMotivo: TCMClientDataSet;
    pgctrlSel: TPageControl;
    tbshSindicato: TTabSheet;
    chklstSindicato: TColorCheckListBox;
    tbshEstab: TTabSheet;
    chklstEstab: TColorCheckListBox;
    bbtnSelTodosSindi: TBitBtn;
    bbtnInverteSelSindi: TBitBtn;
    gbxDataProcess: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    gbxTipoFolha: TGroupBox;
    rbtnTodosTipoFolha: TRadioButton;
    rbtnSelTipoFolha: TRadioButton;
    dblkcbMotivo: TwwDBLookupCombo;
    gbxRubricas: TGroupBox;
    Label5: TLabel;
    pgctrlRubricas: TPageControl;
    tbshRubRem: TTabSheet;
    chklstRubrica1: TColorCheckListBox;
    tbshRubContrib: TTabSheet;
    chklstRubrica2: TColorCheckListBox;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    bbtnSelTodasRub: TBitBtn;
    bbtnInverteSelRub: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnMarcarRubClick(Sender: TObject);
    procedure pgctrlRubricasChange(Sender: TObject);
    procedure bbtnSelTodasRubClick(Sender: TObject);
    procedure bbtnInverteSelRubClick(Sender: TObject);
    procedure chklstRubrica1ClickCheck(Sender: TObject);
    procedure speAnoChange(Sender: TObject);
    procedure chklstSindicatoClickCheck(Sender: TObject);
    procedure bbtnSelTodosSindiClick(Sender: TObject);
    procedure bbtnInverteSelSindiClick(Sender: TObject);
    procedure rbtnSelTipoFolhaClick(Sender: TObject);
  private
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlPessoaSindicato: TCtrlPessoaSindicato;
    CtrlMotivo: TCtrlMotivo;
    CtrlProvDesc: TCtrlProvDesc;
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;

    ArqConfig: TIniFile;
    chkListAux: TColorCheckListBox;
    ListaCodEstab: TStringList;
    ListaIdSindicato: TStringList;
    ListaIdRubrica: TStringList;

    sListaIdSindicatoSel: string;
    sListaIdRubricaSel: array[1..2] of string;

    procedure HabilitaBtOk;    
    procedure LeAlteracoes;
    procedure GravaAlteracoes;
  end;

var
  frmParamRelRecContribSind: TfrmParamRelRecContribSind;

implementation

uses uSistema, uMensErro, fAguarde, dCds, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmParamRelRecContribSind.FormCreate(Sender: TObject);
var
  NormalIni: TDate;
begin
  inherited;
  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlPessoaSindicato := TCtrlPessoaSindicato.Create;
  CtrlPessoaSindicato.InitializeAs(Padroes);

  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);
  
  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  ListaCodEstab := TStringList.Create;
  ListaIdRubrica := TStringList.Create;
  ListaIdSindicato := TStringList.Create;

  // Apagar o índice se este existir
  dmCds.Cds.IndexName := '';
  if (dmCds.Cds.IndexDefs.IndexOf('Index1') > 0) then
    dmCds.Cds.DeleteIndex('Index1');

  // Montar Lista de Sindicatos
  chklstSindicato.Items.Clear;
  dmCds.Cds.Data := CtrlPessoaSindicato.ListSindicatoComFuncionarios;
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdSindicato.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
    chklstSindicato.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
    dmCds.Cds.Next;
  end;

  // Montar Lista de Rubricas
  chklstRubrica1.Items.Clear;
  chklstRubrica2.Items.Clear;
  dmCds.Cds.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdRubrica.Add(dmCds.Cds.FieldByName('CODPROVDESC').asString);
    chklstRubrica1.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    chklstRubrica2.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    dmCds.Cds.Next;
  end;

  // Monta Lista de Estabelecimentos
  dmCds.Cds.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaCodEstab.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
    chklstEstab.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
    dmCds.Cds.Next;
  end;

  NormalIni := CtrlGlobalRH.GetNormalIni;
  cmbMes.ItemIndex := FU.ExtraiMes(NormalIni) - 1;
  speAno.Value := FU.ExtraiAno(NormalIni);

  pgctrlSel.ActivePageIndex := 0;
  pgctrlRubricas.ActivePageIndex := 0;

  pgctrlRubricasChange(Sender);
  // Carrega alterações nas opções feitas anteriormente
  LeAlteracoes;
end;

procedure TfrmParamRelRecContribSind.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravaAlteracoes;
  FreeAndNil(ListaIdRubrica);
  FreeAndNil(ListaIdSindicato);
  FreeAndNil(ListaCodEstab);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlPessoaSindicato);
  FreeAndNil(CtrlMotivo);
  FreeAndNil(CtrlProvDesc);
  FreeAndNil(CtrlPessoaFilialPessoa);
  inherited;
end;

procedure TfrmParamRelRecContribSind.speAnoChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamRelRecContribSind.pgctrlRubricasChange(Sender: TObject);
begin
  chkListAux := TColorCheckListBox(Self.FindComponent('chklstRubrica'+
    IntToStr(pgctrlRubricas.ActivePageIndex+1)));
  edCodRubricas.Text := sListaIdRubricaSel[pgctrlRubricas.ActivePageIndex+1];
end;

procedure TfrmParamRelRecContribSind.chklstSindicatoClickCheck(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
end;

procedure TfrmParamRelRecContribSind.chklstRubrica1ClickCheck(Sender: TObject);
begin
  inherited;
  FU.CriaListaOpcoes(TColorCheckListBox(Sender), ListaIdRubrica,
    sListaIdRubricaSel[pgctrlRubricas.ActivePageIndex+1], ',', false);

  edCodRubricas.Text := sListaIdRubricaSel[pgctrlRubricas.ActivePageIndex+1];

  HabilitaBtOk;
end;

procedure TfrmParamRelRecContribSind.bbtnSelTodosSindiClick(Sender: TObject);
var
  c: integer;
  CheckListBox: TColorCheckListBox;
begin
  case (pgctrlSel.ActivePageIndex) of
    0 :  CheckListBox := chklstSindicato;
    else CheckListBox := chklstEstab;
  end;

  for c:=0 to CheckListBox.Items.Count-1 do
    CheckListBox.Checked[c] := true;
  CheckListBox.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamRelRecContribSind.bbtnInverteSelSindiClick(Sender: TObject);
var
  c: integer;
  CheckListBox: TColorCheckListBox;
begin
  case (pgctrlSel.ActivePageIndex) of
    0 :  CheckListBox := chklstSindicato;
    else CheckListBox := chklstEstab;
  end;

  for c:=0 to CheckListBox.Items.Count-1 do
    CheckListBox.Checked[c] := not(CheckListBox.Checked[c]);
  CheckListBox.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamRelRecContribSind.bbtnSelTodasRubClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[c] := true;

  FU.CriaListaOpcoes(chkListAux, ListaIdRubrica,
    sListaIdRubricaSel[pgctrlRubricas.ActivePageIndex+1], ',', false);

  edCodRubricas.Text := sListaIdRubricaSel[pgctrlRubricas.ActivePageIndex+1];

  chkListAux.Repaint;

  HabilitaBtOk;
end;

procedure TfrmParamRelRecContribSind.bbtnInverteSelRubClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[c] := not(chkListAux.Checked[c]);

  FU.CriaListaOpcoes(chkListAux, ListaIdRubrica,
    sListaIdRubricaSel[pgctrlRubricas.ActivePageIndex+1], ',', false);

  edCodRubricas.Text := sListaIdRubricaSel[pgctrlRubricas.ActivePageIndex+1];

  chkListAux.Repaint;

  HabilitaBtOk;
end;

procedure TfrmParamRelRecContribSind.sbtnMarcarRubClick(Sender: TObject);
begin
  edCodRubricas.Text := Trim(edCodRubricas.Text);

  FU.VerificaOpcoes(chkListAux, ListaIdRubrica, edCodRubricas.Text, ',');
  sListaIdRubricaSel[pgctrlRubricas.ActivePageIndex+1] := edCodRubricas.Text;

  chkListAux.Repaint;

  HabilitaBtOk;
end;

procedure TfrmParamRelRecContribSind.rbtnSelTipoFolhaClick(Sender: TObject);
begin
  dblkcbMotivo.Visible := rbtnSelTipoFolha.Checked;
  if (dblkcbMotivo.Visible) and not(CdsMotivo.Active) then
    CdsMotivo.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('F');
end;

procedure TfrmParamRelRecContribSind.bbtnConfirmarClick(Sender: TObject);
var
  sCodEstabSel: string;
begin
  // Sindicatos selecionados
  FU.CriaListaOpcoes(chklstSindicato, ListaIdSindicato, sListaIdSindicatoSel, ',', false);

  // Rubricas para Remuneração selecionadas
  FU.CriaListaOpcoes(chklstRubrica1, ListaIdRubrica, sListaIdRubricaSel[1], ',', true);

  // Rubricas para Contribuição selecionadas
  FU.CriaListaOpcoes(chklstRubrica2, ListaIdRubrica, sListaIdRubricaSel[2], ',', true);

  // Estabelecimentos selecionados
  FU.CriaListaOpcoes(chklstEstab, ListaCodEstab, sCodEstabSel, ',', false);

  Cmp_Padrao.ParamByName('MesRef').asInteger := cmbMes.ItemIndex+1;
  Cmp_Padrao.ParamByName('AnoRef').asInteger := speAno.Value;
  Cmp_Padrao.ParamByName('ListaIdSindicato').asString := sListaIdSindicatoSel;
  Cmp_Padrao.ParamByName('ListaIdRubrica1').asString := sListaIdRubricaSel[1];
  Cmp_Padrao.ParamByName('ListaIdRubrica2').asString := sListaIdRubricaSel[2];
  Cmp_Padrao.ParamByName('ListaIdEstab').asString := sCodEstabSel;

  if (rbtnSelTipoFolha.Checked) then
    Cmp_Padrao.ParamByName('TipoPagamento').asInteger := CdsMotivo.FieldByName('IDMOTIVO').asInteger
  else
    Cmp_Padrao.ParamByName('TipoPagamento').asInteger := 0;

  frmAguarde.Mostra('Recolhimento da Contrib. Sindical');
  frmAguarde.Pos := 0;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmParamRelRecContribSind.HabilitaBtOk;
var
  c: integer;
  bSelSind, bSelRub1, bSelRub2: boolean;
begin
  bSelSind := false;
  for c:=0 to chklstSindicato.Items.Count-1 do
    if (chklstSindicato.Checked[c]) then
    begin
      bSelSind := true;
      break;
    end;

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

  bbtnConfirmar.Enabled := (bSelSind) and (bSelRub1) and (bSelRub2) and
    (Trim(speAno.Text) <> '');
end;

procedure TfrmParamRelRecContribSind.LeAlteracoes;
var
  sAux: string;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  rbtnSelTipoFolha.Checked := (ArqConfig.ReadString('REL_RELRECCONTRIBSIND',
    'SomenteTipoFolha', 'F') = 'V');

  if (rbtnSelTipoFolha.Checked) then
  begin
    sAux := ArqConfig.ReadString('REL_RELRECCONTRIBSIND', 'TipoFolha', '');
    if (sAux = '') then
    begin
      CdsMotivo.First;
      sAux := CdsMotivo.FieldByName('IDMOTIVO').asString;
    end;
    dblkcbMotivo.LookUpValue := sAux;
    dblkcbMotivo.Update;
    CdsMotivo.Open;
  end;
  dblkcbMotivo.Visible := rbtnSelTipoFolha.Checked;

  sListaIdRubricaSel[1] := ArqConfig.ReadString('REL_RELRECCONTRIBSIND', 'RubRem', '');
  FU.VerificaOpcoes(chklstRubrica1, ListaIdRubrica, sListaIdRubricaSel[1], ',');

  sListaIdRubricaSel[2] := ArqConfig.ReadString('REL_RELRECCONTRIBSIND', 'RubContrib', '');
  FU.VerificaOpcoes(chklstRubrica2, ListaIdRubrica, sListaIdRubricaSel[2], ',');

  edCodRubricas.Text := sListaIdRubricaSel[1];
end;

procedure TfrmParamRelRecContribSind.GravaAlteracoes;
var
  sGravaPadrao: string;
begin
  sGravaPadrao := FU.IFF(rbtnSelTipoFolha.Checked, 'V', 'F');
  ArqConfig.WriteString('REL_RELRECCONTRIBSIND','SomenteTipoFolha', sGravaPadrao);

  if (rbtnSelTipoFolha.Checked) then
    ArqConfig.WriteString('REL_RELRECCONTRIBSIND', 'TipoFolha', CdsMotivo.FieldByName('IDMOTIVO').asString);

  // Grava as últimas alterações da Opção de Rubricas para Remuneração
  FU.CriaListaOpcoes(chklstRubrica1, ListaIdRubrica, sGravaPadrao, ',', false);
  ArqConfig.WriteString('REL_RELRECCONTRIBSIND', 'RubRem', sGravaPadrao);

  // Grava as últimas alterações da Opção de Rubricas para Cotribuição
  FU.CriaListaOpcoes(chklstRubrica2, ListaIdRubrica, sGravaPadrao, ',', false);
  ArqConfig.WriteString('REL_RELRECCONTRIBSIND', 'RubContrib', sGravaPadrao);
end;

end.
