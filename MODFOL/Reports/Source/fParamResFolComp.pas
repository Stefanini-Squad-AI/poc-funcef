// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamResFolComp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, Spin, IniFiles,
  Wwdatsrc, DBTables, wwdblook, checklst, ComCtrls, Grids, DBGrids, DBClient, CmParamReport,
  uCMClientDataSet, fParamReports_Padrao, uCtrlMotivo, uCtrlProvDesc, uCtrlListTerceirosRH,
  uCtrlPessoaFilialPessoa, uCtrlGlobalRH, ColorCheckListBox;

type
  TfrmParamResFolComp = class(TfrmParamReports_Padrao)
    CdsEstab: TCMClientDataSet;
    Paginas: TPageControl;
    tbshTipoFolha: TTabSheet;
    chklstTipoFolha: TColorCheckListBox;
    tbsRubrica: TTabSheet;
    Label1: TLabel;
    chklstRubrica: TColorCheckListBox;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    tbshCCusto: TTabSheet;
    chklstCCusto: TColorCheckListBox;
    spbtInvSelecao: TBitBtn;
    spbtSelTodos: TBitBtn;
    gbxAnoMesRefIni: TGroupBox;
    cmbMesIni: TComboBox;
    speAnoIni: TSpinEdit;
    gbxAnoMesRefFin: TGroupBox;
    cmbMesFin: TComboBox;
    speAnoFin: TSpinEdit;
    rgRubApoio: TRadioGroup;
    rgTotalUnico: TRadioGroup;
    gbxAgruparPor: TGroupBox;
    cmbAgruparPor: TComboBox;
    rgBuscaHist: TRadioGroup;
    tbshEstabelecimento: TTabSheet;
    chklstEstab: TColorCheckListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure spbtInvSelecaoClick(Sender: TObject);
    procedure spbtSelTodosClick(Sender: TObject);
    procedure chklstTipoFolhaClickCheck(Sender: TObject);
    procedure chklstRubricaClickCheck(Sender: TObject);
    procedure sbtnMarcarRubClick(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
    procedure chklstEstabClickCheck(Sender: TObject);
  private
    CtrlMotivo: TCtrlMotivo;
    CtrlProvDesc: TCtrlProvDesc;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlGlobalRH: TCtrlGlobalRH;

    ArqConfig: TIniFile;
    chklstAux: TColorCheckListBox;
    ListaIdTipoFolha, ListaIdRubrica, ListaCodCCusto, ListaIdEstab: TStringList;

    sListaIdRubricaSel, sListaIdEstabSel: string;

    procedure HabilitaBtOk;
    procedure LeAlteracoes;
    procedure GravaAlteracoes;    
  end;

var
  frmParamResFolComp: TfrmParamResFolComp;

implementation

uses uSistema, uMensErro, fAguarde, dCds, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmParamResFolComp.FormCreate(Sender: TObject);
var
  NormalIni: TDate;
  c: byte;
begin
  inherited;
  ListaIdEstab := TStringList.Create;
  ListaIdTipoFolha := TStringList.Create;
  ListaIdRubrica := TStringList.Create;
  ListaCodCCusto := TStringList.Create;

  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);

  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  // Monto a Lista de Tipos de Folha
  chklstTipoFolha.Items.Clear;
  dmCds.Cds.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('F,D');
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdTipoFolha.Add(dmCds.Cds.FieldByName('IDMOTIVO').asString);
    chklstTipoFolha.Items.Add(dmCds.Cds.FieldByName('DESCRICAO').asString);
    dmCds.Cds.Next;
  end;

  // Monto a Lista de Rubricas
  chklstRubrica.Items.Clear;
  dmCds.Cds.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdRubrica.Add(dmCds.Cds.FieldByName('CODPROVDESC').asString);
    chklstRubrica.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    dmCds.Cds.Next;
  end;

  // Monto a Lista de C. Custo
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

  NormalIni := CtrlGlobalRH.GetNormalIni;
  cmbMesIni.ItemIndex := FU.ExtraiMes(StrToDate(FU.IncData(DateToStr(NormalIni),0,-1,0))) - 1;
  speAnoIni.Value := FU.ExtraiAno(StrToDate(FU.IncData(DateToStr(NormalIni),0,-1,0)));

  cmbMesFin.ItemIndex := FU.ExtraiMes(NormalIni) - 1;
  speAnoFin.Value := FU.ExtraiAno(NormalIni);

  cmbAgruparPor.ItemIndex := 0;
  Paginas.ActivePageIndex := 0;

  PaginasChange(Sender);

  // Carrega alterações nas opções feitas anteriormente
  LeAlteracoes;
end;

procedure TfrmParamResFolComp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlMotivo);
  FreeAndNil(CtrlProvDesc);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlGlobalRH);
  GravaAlteracoes;
  FreeAndNil(ListaIdTipoFolha);
  FreeAndNil(ListaIdRubrica);
  FreeAndNil(ListaCodCCusto);
  FreeAndNil(ListaIdEstab);
  inherited;
end;

procedure TfrmParamResFolComp.PaginasChange(Sender: TObject);
begin
  case (Paginas.ActivePageIndex) of
    0 : chklstAux := chklstTipoFolha;
    1 : chklstAux := chklstRubrica;
    2 : chklstAux := chklstCCusto;
    3 : chklstAux := chklstEstab;
  end;
end;

procedure TfrmParamResFolComp.chklstTipoFolhaClickCheck(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
end;

procedure TfrmParamResFolComp.chklstRubricaClickCheck(Sender: TObject);
begin
  inherited;
  FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', false);
  edCodRubricas.Text := sListaIdRubricaSel;
end;

procedure TfrmParamResFolComp.spbtSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstAux.Items.Count-1 do
    chklstAux.Checked[c] := true;
  chklstAux.Repaint;

  case (Paginas.ActivePageIndex) of
    0,2 : HabilitaBtOk;
    1 :
    begin
      FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', false);
      edCodRubricas.Text := sListaIdRubricaSel;
    end;
  end;
end;

procedure TfrmParamResFolComp.spbtInvSelecaoClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstAux.Items.Count-1 do
    chklstAux.Checked[c] := not(chklstAux.Checked[c]);
  chklstAux.Repaint;

  case (Paginas.ActivePageIndex) of
    0,2 : HabilitaBtOk;
    1 :
    begin
      FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', false);
      edCodRubricas.Text := sListaIdRubricaSel;
    end;
  end;
end;

procedure TfrmParamResFolComp.sbtnMarcarRubClick(Sender: TObject);
begin
  edCodRubricas.Text := Trim(edCodRubricas.Text);
  FU.VerificaOpcoes(chklstRubrica, ListaIdRubrica, edCodRubricas.Text, ',');
  HabilitaBtOk;
  chklstRubrica.Repaint;
end;

procedure TfrmParamResFolComp.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
  c: integer;
  sListaIdTipoFolhaSel, sListaCodCCustoSel, sListaNomeTipoFolha: string;
begin
  // Tipos de Folha selecionados
  FU.CriaListaOpcoes(chklstTipoFolha, ListaIdTipoFolha, sListaIdTipoFolhaSel, ',', false);

  // Estabelecimentos selecionados
  FU.CriaListaOpcoes(chklstEstab, ListaIdEstab, sListaIdEstabSel, ',', false);

  sListaNomeTipoFolha := '';
  for c:=0 to chklstTipoFolha.Items.Count-1 do
    if (chklstTipoFolha.Checked[c]) then
    begin
      if (sListaNomeTipoFolha = '') then
        sListaNomeTipoFolha := sListaNomeTipoFolha + chklstTipoFolha.Items[c]
      else
        sListaNomeTipoFolha := sListaNomeTipoFolha +' - '+ chklstTipoFolha.Items[c];
    end;

  // Rubrica(s) selecionada(s)
  wNum := FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', true);
  if (wNum = ListaIdRubrica.Count) then
    sListaIdRubricaSel := '';

  // C. de Custo selecionados
  FU.CriaListaOpcoes(chklstCCusto, ListaCodCCusto, sListaCodCCustoSel, ',', true);

  if (sListaIdRubricaSel <> '') then
    rgRubApoio.ItemIndex := 0;

  Cmp_Padrao.ParamByName('IdEmpresa').asInteger := Sistema.IdEmpresa;
  Cmp_Padrao.ParamByName('ListaIdEstab').asString := sListaIdEstabSel;
  Cmp_Padrao.ParamByName('MesInicial').asInteger := cmbMesIni.ItemIndex+1;
  Cmp_Padrao.ParamByName('AnoInicial').asInteger := speAnoIni.Value;
  Cmp_Padrao.ParamByName('MesFinal').asInteger := cmbMesFin.ItemIndex+1;
  Cmp_Padrao.ParamByName('AnoFinal').asInteger := speAnoFin.Value;
  Cmp_Padrao.ParamByName('BuscaHist').asInteger := rgBuscaHist.ItemIndex;  
  Cmp_Padrao.ParamByName('ListaCodCCusto').asString := sListaCodCCustoSel;
  Cmp_Padrao.ParamByName('ListaIdRubrica').asString := sListaIdRubricaSel;
  Cmp_Padrao.ParamByName('ListaIdTipoFolha').asString := sListaIdTipoFolhaSel;
  Cmp_Padrao.ParamByName('ListaNomeTipoFolha').asString := sListaNomeTipoFolha;
  Cmp_Padrao.ParamByName('SelRubricaApoio').asBoolean := (rgRubApoio.ItemIndex = 1);
  Cmp_Padrao.ParamByName('ImprimeTotalUnico').asBoolean := (rgTotalUnico.ItemIndex = 0);
  Cmp_Padrao.ParamByName('AgruparPor').asInteger := cmbAgruparPor.ItemIndex;

  frmAguarde.Mostra('Resumo de Folha Comparativo');
  frmAguarde.Pos := 0;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmParamResFolComp.HabilitaBtOk;
var
  c: integer;
  bSelecionado: boolean;
begin
  // Estabelecimentos selecionados
  FU.CriaListaOpcoes(chklstEstab, ListaIdEstab, sListaIdEstabSel, ',', false);

  // Verifica se algum Tipo de Folha foi selecionado
  bSelecionado := false;
  for c:=0 to chklstTipoFolha.Items.Count-1 do
    if (chklstTipoFolha.Checked[c]) then
    begin
      bSelecionado := true;
      break;
    end;

  bbtnConfirmar.Enabled := (bSelecionado) and (sListaIdEstabSel <> '') and
    (Trim(speAnoIni.Text) <> '') and (Trim(speAnoFin.Text) <> '');
end;

procedure TfrmParamResFolComp.LeAlteracoes;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+ '\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  sListaIdRubricaSel := ArqConfig.ReadString('REL_RESFOLCOMP', 'Rubricas', '');
  FU.VerificaOpcoes(chklstRubrica, ListaIdRubrica,  sListaIdRubricaSel, ',');
  edCodRubricas.Text := sListaIdRubricaSel;

  HabilitaBtOk;
end;

procedure TfrmParamResFolComp.GravaAlteracoes;
begin
  // Grava as últimas alterações da Opção de Rubricas 1
  FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', false);
  ArqConfig.WriteString('REL_RESFOLCOMP','Rubricas', sListaIdRubricaSel);
end;

procedure TfrmParamResFolComp.chklstEstabClickCheck(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
end;

end.
