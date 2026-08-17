unit fParamFolhaEmprRub;

interface                   

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Spin, wwdblook, checklst,
  IvDictio, IvMulti, ComCtrls, fSairAjuda, DBClient, uCMClientDataSet, CmParamReport,
  fParamReports_Padrao, ColorCheckListBox, uCtrlPessoaFilialPessoa, uCtrlGlobalRH,
  uCtrlListTerceirosRH, uCtrlProvDesc, uCtrlMotivo, IvEMulti;

type
  TfrmParamFolhaEmprRub = class(TfrmParamReports_Padrao)
    CdsEstab: TCMClientDataSet;
    Paginas: TPageControl;
    tbshTipoFolha: TTabSheet;
    chklstTipoFolha: TColorCheckListBox;
    tbshCCusto: TTabSheet;
    chklstCCusto: TColorCheckListBox;
    spbtSelTodos: TBitBtn;
    spbtInvSelecao: TBitBtn;
    gbxAnoMesRef: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    rgProcesso: TRadioGroup;
    rgImprimeTipoProcesso: TRadioGroup;
    rgBuscaHist: TRadioGroup;
    gbxRubricas: TGroupBox;
    Label1: TLabel;
    chklstRubrica: TColorCheckListBox;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    rgTipoRelat: TRadioGroup;
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    tbshEstabelecimento: TTabSheet;
    chklstEstab: TColorCheckListBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chklstRubricaClickCheck(Sender: TObject);
    procedure sbtnMarcarRubClick(Sender: TObject);
    procedure spbtSelTodosClick(Sender: TObject);
    procedure spbtInvSelecaoClick(Sender: TObject);
    procedure chklstTipoFolhaClickCheck(Sender: TObject);
    procedure speAnoChange(Sender: TObject);
    procedure cmbOrderByChange(Sender: TObject);
  private
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlProvDesc: TCtrlProvDesc;
    CtrlMotivo: TCtrlMotivo;

    chkListAux: TColorCheckListBox;
    ListaIdTipoFolha, ListaCodCCusto, ListaIdRubrica, ListaIdEstab: TStringList;

    sListaIdRubricaSel, sListaIdEstabSel: string;

    procedure HabilitaBtOk;
  end;

var
  frmParamFolhaEmprRub: TfrmParamFolhaEmprRub;

implementation

uses uSistema, uMensErro, fAguarde, dCds, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmParamFolhaEmprRub.FormCreate(Sender: TObject);
var
  NormalIni: TDate;
  c: byte;
begin
  inherited;
  ListaIdTipoFolha := TStringList.Create;
  ListaCodCCusto := TStringList.Create;
  ListaIdRubrica := TStringList.Create;
  ListaIdEstab := TStringList.Create;

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);

  if (Sistema.TipoEmpresa = 'P') then
    cmbOrderBy.Items.Add('Programa');

  // Apagar o índice se este existir
  dmCds.Cds.IndexName := '';
  if (dmCds.Cds.IndexDefs.IndexOf('Index1') > 0) then
    dmCds.Cds.DeleteIndex('Index1');

  // Lista de Rubricas
  chklstRubrica.Items.Clear;
  dmCds.Cds.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdRubrica.Add(Trim(dmCds.Cds.FieldByName('CODPROVDESC').asString));
    chklstRubrica.Items.Add(Trim(dmCds.Cds.FieldByName('DESCRPROVDESC').asString));
    dmCds.Cds.Next;
  end;

  // Lista de Tipos de Folha
  chklstTipoFolha.Items.Clear;
  ListaIdTipoFolha.Clear;
  dmCds.Cds.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('F,D');
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdTipoFolha.Add(dmCds.Cds.FieldByName('IDMOTIVO').asString);
    chklstTipoFolha.Items.Add(dmCds.Cds.FieldByName('DESCRICAO').asString);
    dmCds.Cds.Next;
  end;

  // Lista de C. Custo
  chklstCCusto.Items.Clear;
  ListaCodCCusto.Clear;
  dmCds.Cds.Data := CtrlListTerceirosRH.ListCCusto(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaCodCCusto.Add(Trim(dmCds.Cds.FieldByName('CODCENTROCUSTO').asString));
    chklstCCusto.Items.Add(Trim(dmCds.Cds.FieldByName('NOME').asString));
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
  speAno.Text := IntToStr(FU.ExtraiAno(NormalIni));

  rgTipoRelat.Enabled := false;
  cmbOrderBy.ItemIndex := 0;
  Paginas.ActivePageIndex := 0;

  HabilitaBtOk;
end;

procedure TfrmParamFolhaEmprRub.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlMotivo);
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlProvDesc);
  FreeAndNil(CtrlMotivo);
  FreeAndNil(ListaIdTipoFolha);
  FreeAndNil(ListaCodCCusto);
  FreeAndNil(ListaIdRubrica);
  FreeAndNil(ListaIdEstab);
  inherited;
end;

procedure TfrmParamFolhaEmprRub.speAnoChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamFolhaEmprRub.cmbOrderByChange(Sender: TObject);
begin
  rgTipoRelat.Enabled := (cmbOrderBy.ItemIndex in [4..8]);
  
  if (cmbOrderBy.ItemIndex = 8) then
    rgTipoRelat.Caption := 'Agrupar por Programa'
  else
    rgTipoRelat.Caption := 'Agrupar por Centro de Custo';

  if not(rgTipoRelat.Enabled) then
    rgTipoRelat.ItemIndex := 0;
end;

procedure TfrmParamFolhaEmprRub.chklstTipoFolhaClickCheck(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
end;

procedure TfrmParamFolhaEmprRub.chklstRubricaClickCheck(Sender: TObject);
begin
  inherited;
  FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', false);
  edCodRubricas.Text := sListaIdRubricaSel;
  HabilitaBtOk;
end;

procedure TfrmParamFolhaEmprRub.spbtSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  case (Paginas.ActivePageIndex) of
    0 : chkListAux := chklstTipoFolha;
    1 : chkListAux := chklstCCusto;
    2 : chkListAux := chklstEstab;
  end;

  for c:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[c] := true;
  chkListAux.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamFolhaEmprRub.spbtInvSelecaoClick(Sender: TObject);
var
  c: integer;
begin
  case (Paginas.ActivePageIndex) of
    0 : chkListAux := chklstTipoFolha;
    1 : chkListAux := chklstCCusto;
    2 : chkListAux := chklstEstab;
  end;

  for c:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[c] := not(chkListAux.Checked[c]);
  chkListAux.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamFolhaEmprRub.sbtnMarcarRubClick(Sender: TObject);
begin
  edCodRubricas.Text := Trim(edCodRubricas.Text);
  FU.VerificaOpcoes(chklstRubrica, ListaIdRubrica, edCodRubricas.Text, ',');
  HabilitaBtOk;
  chklstRubrica.Repaint;
end;

procedure TfrmParamFolhaEmprRub.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
  sListaIdTipoFolhaSel, sListaCodCCustoSel: string;
begin
  // Rubrica(s) selecionada(s)
  wNum := FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', true);
  if (wNum = ListaIdRubrica.Count) then
    sListaIdRubricaSel := '';

  // Tipos de Folha selecionados
  wNum := FU.CriaListaOpcoes(chklstTipoFolha, ListaIdTipoFolha, sListaIdTipoFolhaSel, ',', false);
  if (wNum = ListaIdTipoFolha.Count) then
    sListaIdTipoFolhaSel := '';

  // C. de Custo selecionados
  wNum := FU.CriaListaOpcoes(chklstCCusto, ListaCodCCusto, sListaCodCCustoSel, ',', true);
  if (wNum = ListaCodCCusto.Count) then
    sListaCodCCustoSel := '';

  Cmp_Padrao.ParamByName('IdEmpresa').asInteger := Sistema.IdEmpresa;
  Cmp_Padrao.ParamByName('ListaIdEstab').asString := sListaIdEstabSel;

  if (rgProcesso.ItemIndex = 0) then
    Cmp_Padrao.ParamByName('NomeTabela').asString := 'PREVIAFOLPAG'
  else
    Cmp_Padrao.ParamByName('NomeTabela').asString := 'HISTRUBSAL';

  Cmp_Padrao.ParamByName('ListaCodCCusto').asString := sListaCodCCustoSel;
  Cmp_Padrao.ParamByName('ListaIdRubrica').asString := sListaIdRubricaSel;
  Cmp_Padrao.ParamByName('ListaTipoFolha').asString := sListaIdTipoFolhaSel;
  Cmp_Padrao.ParamByName('AnoRef').asInteger := speAno.Value;
  Cmp_Padrao.ParamByName('MesRef').asInteger := cmbMes.ItemIndex+1;
  Cmp_Padrao.ParamByName('ImprimeTipoProcesso').asBoolean :=
    (rgImprimeTipoProcesso.ItemIndex = 0);
  Cmp_Padrao.ParamByName('TipoRelatorio').asInteger := rgTipoRelat.ItemIndex;
  Cmp_Padrao.ParamByName('Ordenacao').asInteger := cmbOrderBy.ItemIndex;
  Cmp_Padrao.ParamByName('BuscaHist').asBoolean := (rgBuscaHist.ItemIndex = 0);

  frmAguarde.Mostra('Folha de Empregados por Rubrica');
  frmAguarde.Pos := 0;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmParamFolhaEmprRub.HabilitaBtOk;
var
  c: integer;
  bSelRub, bSelTipoFolha: boolean;
begin
  // Estabelecimentos selecionados
  FU.CriaListaOpcoes(chklstEstab, ListaIdEstab, sListaIdEstabSel, ',', false);

  // Verifica se algum Tipo de Folha foi selecionado
  bSelTipoFolha := false;
  for c:=0 to chklstTipoFolha.Items.Count-1 do
    if (chklstTipoFolha.Checked[c]) then
    begin
      bSelTipoFolha := true;
      break;
    end;

  bSelRub := false;
  for c:=0 to chklstRubrica.Items.Count-1 do
    if (chklstRubrica.Checked[c]) then
    begin
      bSelRub := true;
      break;
    end;

  bbtnConfirmar.Enabled := (bSelTipoFolha) and (bSelRub) and (sListaIdEstabSel <> '') and
    (Trim(speAno.Text) <> '');
end;

end.
