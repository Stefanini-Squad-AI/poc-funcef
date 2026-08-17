// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamGerencial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, wwdblook, Spin, checklst, IvDictio, IvMulti,
  IvEMulti, ComCtrls, IniFiles, Grids, DBGrids, DBClient, uCMClientDataSet, CmParamReport,
  fParamReports_Padrao, uCtrlPessoaFilialPessoa, uCtrlMotivo, uCtrlSitFunc, uCtrlProvDesc,
  uCtrlListTerceirosRH, uCtrlGlobalRH, ColorCheckListBox;

type
  TfrmParamGerencial = class(TfrmParamReports_Padrao)
    pgctrGerencial: TPageControl;
    tbshGeral: TTabSheet;
    tbshDespPessoal: TTabSheet;
    gbxEstab: TGroupBox;
    gbxSetor: TGroupBox;
    edSetor: TEdit;
    gbxAnoMesRef: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    gbxOrdemImpr: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cmbOrdemRelEmprTempServ: TComboBox;
    cmbOrdemDistribPessSal: TComboBox;
    cbmOrdemDemDespPessoal: TComboBox;
    gbxRubricas: TGroupBox;
    Label4: TLabel;
    Paginas: TPageControl;
    tbshRemCCusto: TTabSheet;
    chklstRubrica1: TColorCheckListBox;
    tbshDistribGratifCCusto: TTabSheet;
    chklstRubrica2: TColorCheckListBox;
    tbshTotFolha: TTabSheet;
    chklstRubrica3: TColorCheckListBox;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    gbxTipoPag: TGroupBox;
    dblckMotivo: TwwDBLookupCombo;
    gbxSituacoes: TGroupBox;
    chklstSituacoes: TColorCheckListBox;
    rgApanhaDataTrein: TRadioGroup;
    rgTipoDataTrein: TRadioGroup;
    gbxComplementares: TGroupBox;
    sgrInfComplem: TStringGrid;
    gbxRubricas2: TGroupBox;
    Label5: TLabel;
    chklstRubrica4: TColorCheckListBox;
    edCodRubricas2: TEdit;
    sbtnMarcarRub2: TBitBtn;
    CdsEstab: TCMClientDataSet;
    CdsMotivo: TCMClientDataSet;
    chklstEstab: TColorCheckListBox;
    bbtnSelTodosEstab: TBitBtn;
    bbtnInverteSelEstab: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgrInfComplemKeyPress(Sender: TObject; var Key: Char);
    procedure PaginasChange(Sender: TObject);
    procedure sbtnMarcarRubClick(Sender: TObject);
    procedure chklstRubrica1ClickCheck(Sender: TObject);
    procedure chklstSituacoesClickCheck(Sender: TObject);
    procedure chklstRubrica4ClickCheck(Sender: TObject);
    procedure sbtnMarcarRub2Click(Sender: TObject);
    procedure rgApanhaDataTreinClick(Sender: TObject);
    procedure bbtnSelTodosEstabClick(Sender: TObject);
    procedure bbtnInverteSelEstabClick(Sender: TObject);
    procedure chklstEstabClickCheck(Sender: TObject);
  private
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlMotivo: TCtrlMotivo;
    CtrlSitFunc: TCtrlSitFunc;
    CtrlProvDesc: TCtrlProvDesc;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlGlobalRH: TCtrlGlobalRH;

    ArqConfig: TIniFile;
    ListaIdRubrica, ListaCodCCusto, ListaIdSitFunc, ListaIdEstab: TStringList;

    sListaIdRubricaSel1, sListaIdRubricaSel2, sListaIdRubricaSel3,
    sListaIdRubricaSel4, sListaIdSitFuncSel, sListaIdEstabSel: string;

    procedure LeArquivoConfig;
    procedure GravaArquivoConfig;
    procedure HabilitaBtOk;
  end;

var
  frmParamGerencial: TfrmParamGerencial;

implementation

uses uSistema, uMensErro, dCds, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmParamGerencial.FormCreate(Sender: TObject);
var
  x: integer;
  c: byte;
begin
  inherited;
  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);

  CtrlSitFunc := TCtrlSitFunc.Create;
  CtrlSitFunc.InitializeAs(Padroes);

  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  ListaIdRubrica := TStringList.Create;
  ListaCodCCusto := TStringList.Create;
  ListaIdSitFunc := TStringList.Create;
  ListaIdEstab   := TStringList.Create;

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

  CdsMotivo.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('F');

  // Preenche ChkList das Situações de Afastamento
  dmCds.Cds.Data := CtrlSitFunc.ListGeral(0, 'F', 'R,G');
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdSitFunc.Add(dmCds.Cds.FieldByName('IDSITFUNC').asString);
    chklstSituacoes.Items.Add(dmCds.Cds.FieldByName('DESCRICAO').asString);
    dmCds.Cds.Next;
  end;

  // Preenche ChkList das Rubricas
  dmCds.Cds.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdRubrica.Add(dmCds.Cds.FieldByName('CODPROVDESC').asString);
    chklstRubrica1.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    chklstRubrica2.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    chklstRubrica3.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    chklstRubrica4.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    dmCds.Cds.Next;
  end;

  // Monto ChkList de C. de Custo
  dmCds.Cds.Data := CtrlListTerceirosRH.ListCCusto(IntToStr(Sistema.IdEmpresa));
  sgrInfComplem.ColWidths[0] := 130;
  sgrInfComplem.Cells[0,1] := 'Temporários/Autônomos';
  sgrInfComplem.Cells[0,2] := 'Vale Transporte';
  sgrInfComplem.Cells[0,3] := 'Aliment. com H. Extra';
  sgrInfComplem.Cells[0,4] := 'Transp. com H. Extra';
  sgrInfComplem.Cells[0,5] := 'Ass. Médica/Odonto';
  sgrInfComplem.Cells[0,6] := 'Treinamento';

  // Preenche Grid com os Centros de Custo e lista de códigos dos Centros de Custo
  x := 1;
  while not(dmCds.Cds.EOF) do
  begin
    if (Trim(dmCds.Cds.FieldByName('CODREDUZIDO').asString) <> '') then
    begin
      ListaCodCCusto.Add(dmCds.Cds.FieldByName('CODCENTROCUSTO').asString);

      sgrInfComplem.ColCount := sgrInfComplem.ColCount + 1;
      sgrInfComplem.Cells[x,0] := Trim(dmCds.Cds.FieldByName('NOME').asString) +
        ' ('+ Trim(dmCds.Cds.FieldByName('CODREDUZIDO').asString)+ ')';
      sgrInfComplem.ColWidths[x] := (Length(sgrInfComplem.Cells[x,0]) * 7);
      Inc(x);
    end;
    dmCds.Cds.Next;
  end;

  dmCds.Cds.Data := CtrlGlobalRH.GetParamRH('NORMALINI, IDMOTIVO');

  // Seleciono o motivo no PARAMRH como o Tipo de Pagamento Padrão
  if (CdsMotivo.Locate('IDMOTIVO', dmCds.Cds.FieldByName('IDMOTIVO').asString,
      [loCaseInsensitive])) then
  begin
    dblckMotivo.LookUpValue := CdsMotivo.FieldByName('IDMOTIVO').asString;
    dblckMotivo.UpDate;
  end;

  // Valores iniciais dos Componentes
  cmbMes.ItemIndex := FU.ExtraiMes(dmCds.Cds.FieldByName('NORMALINI').asDateTime) - 1;
  speAno.Text:= Copy(dmCds.Cds.FieldByName('NORMALINI').asString,7,4);
  Paginas.ActivePageIndex := 0;
  pgctrGerencial.ActivePageIndex := 0;
  cbmOrdemDemDespPessoal.ItemIndex := 0;
  cmbOrdemDistribPessSal.ItemIndex := 2;
  cmbOrdemRelEmprTempServ.ItemIndex := 2;

  // Carrega alterações nas opções feitas anteriormente
  LeArquivoConfig;
end;

procedure TfrmParamGerencial.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravaArquivoConfig;

  FreeAndNil(ListaIdSitFunc);
  FreeAndNil(ListaIdRubrica);
  FreeAndNil(ListaCodCCusto);
  FreeAndNil(ListaIdEstab);
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlMotivo);
  FreeAndNil(CtrlSitFunc);
  FreeAndNil(CtrlProvDesc);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlGlobalRH);
  inherited;
end;

procedure TfrmParamGerencial.PaginasChange(Sender: TObject);
begin
  case (Paginas.ActivePageIndex) of
    0 : edCodRubricas.Text := sListaIdRubricaSel1;
    1 : edCodRubricas.Text := sListaIdRubricaSel2;
    2 : edCodRubricas.Text := sListaIdRubricaSel3;
  end;
end;

procedure TfrmParamGerencial.sgrInfComplemKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0'..'9',DecimalSeparator,#13,#8]) then
    Key := #0;
end;

procedure TfrmParamGerencial.chklstSituacoesClickCheck(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
end;

procedure TfrmParamGerencial.chklstRubrica1ClickCheck(Sender: TObject);
begin
  inherited;
  case (Paginas.ActivePageIndex) of
    0 : begin
          FU.CriaListaOpcoes (chklstRubrica1, ListaIdRubrica, sListaIdRubricaSel1, ',', false);
          edCodRubricas.Text := sListaIdRubricaSel1;
        end;
    1 : begin
          FU.CriaListaOpcoes (chklstRubrica2, ListaIdRubrica, sListaIdRubricaSel2, ',', false);
          edCodRubricas.Text := sListaIdRubricaSel2;
        end;
    2 : begin
          FU.CriaListaOpcoes (chklstRubrica3, ListaIdRubrica, sListaIdRubricaSel3, ',', false);
          edCodRubricas.Text := sListaIdRubricaSel3;
        end;
  end;
  HabilitaBtOk;
end;

procedure TfrmParamGerencial.chklstRubrica4ClickCheck(Sender: TObject);
begin
  inherited;
  FU.CriaListaOpcoes(chklstRubrica4, ListaIdRubrica, sListaIdRubricaSel4, ',', false);
  edCodRubricas2.Text := sListaIdRubricaSel4;
end;

procedure TfrmParamGerencial.sbtnMarcarRubClick(Sender: TObject);
begin
  edCodRubricas.Text := Trim(edCodRubricas.Text);

  case (Paginas.ActivePageIndex) of
    0 : begin
          FU.VerificaOpcoes (chklstRubrica1, ListaIdRubrica, edCodRubricas.Text, ',');
          sListaIdRubricaSel1 := edCodRubricas.Text;
          chklstRubrica1.Repaint;
        end;
    1 : begin
          FU.VerificaOpcoes (chklstRubrica2, ListaIdRubrica, edCodRubricas.Text, ',');
          sListaIdRubricaSel2 := edCodRubricas.Text;
          chklstRubrica2.Repaint;
        end;
    2 : begin
          FU.VerificaOpcoes (chklstRubrica3, ListaIdRubrica, edCodRubricas.Text, ',');
          sListaIdRubricaSel3 := edCodRubricas.Text;
          chklstRubrica3.Repaint;
        end;
  end;
  HabilitaBtOk;
end;

procedure TfrmParamGerencial.rgApanhaDataTreinClick(Sender: TObject);
begin
  rgTipoDataTrein.Enabled := (rgApanhaDataTrein.ItemIndex = 0);
end;

procedure TfrmParamGerencial.sbtnMarcarRub2Click(Sender: TObject);
begin
  edCodRubricas2.Text := Trim(edCodRubricas2.Text);
  FU.VerificaOpcoes (chklstRubrica4, ListaIdRubrica, edCodRubricas2.Text, ',');
  sListaIdRubricaSel4 := edCodRubricas2.Text;
  chklstRubrica4.Repaint;
end;

procedure TfrmParamGerencial.bbtnConfirmarClick(Sender: TObject);
var
  sLinhasCompl, sLinhaComplAtual: string;
  x, y, iNumLinhasInfCompl: integer;
begin
  // Número de linhas complementares a verificar
  iNumLinhasInfCompl := sgrInfComplem.RowCount-1;
  if (rgApanhaDataTrein.ItemIndex = 0) then
    Dec(iNumLinhasInfCompl);

  // Inserir linhas que tenham vindo da Entrada do Usuário da Tela (Informações Complementares)
  sLinhasCompl := '';
  for y:=1 to iNumLinhasInfCompl do
  begin
    sLinhaComplAtual := '';
    for x:=1 to sgrInfComplem.ColCount-1 do
    begin
      if (Trim(sgrInfComplem.Cells[x,y]) <> '') then
      begin
        if (sLinhaComplAtual <> '') then
          sLinhaComplAtual := sLinhaComplAtual +',';

        sLinhaComplAtual := sLinhaComplAtual +
          Trim(ListaCodCCusto[x-1]) +','+ // Código do Centro de Custo
          Trim(sgrInfComplem.Cells[x,0]) +','+ // Nome do Centro de Custo
          Trim(FU.TrocaCaracter(sgrInfComplem.Cells[x,y], ',', '.')); // Valor
      end;
    end;
    if (sLinhaComplAtual <> '') then
      sLinhasCompl := sLinhasCompl + FU.IFF(sLinhasCompl<>'', CR_LF, '')+
        FU.Alinha(sgrInfComplem.Cells[0,y], 130, 'E', ' ') + // Nome da Rubrica
        sLinhaComplAtual; // Valores
  end;

  // Cria a lista de Códigos das Rubricas selecionadas
  FU.CriaListaOpcoes(chklstRubrica1, ListaIdRubrica, sListaIdRubricaSel1, ',', true);
  FU.CriaListaOpcoes(chklstRubrica2, ListaIdRubrica, sListaIdRubricaSel2, ',', true);
  FU.CriaListaOpcoes(chklstRubrica3, ListaIdRubrica, sListaIdRubricaSel3, ',', true);
  FU.CriaListaOpcoes(chklstRubrica4, ListaIdRubrica, sListaIdRubricaSel4, ',', true);

  // Cria a lista de Códigos das Situações Funcionais selecionadas
  FU.CriaListaOpcoes(chklstSituacoes, ListaIdSitFunc, sListaIdSitFuncSel, ',', false);

  // Estabelecimentos selecionados
  FU.CriaListaOpcoes(chklstEstab, ListaIdEstab, sListaIdEstabSel, ',', false);

  Cmp_Padrao.ParamByName('ListaIdEstab').asString := sListaIdEstabSel;
  Cmp_Padrao.ParamByName('Mes').asInteger := cmbMes.ItemIndex+1;
  Cmp_Padrao.ParamByName('Ano').asInteger := speAno.Value;
  Cmp_Padrao.ParamByName('NomeSetorResp').asString := edSetor.Text;
  Cmp_Padrao.ParamByName('IdTipoFolha').asFloat := CdsMotivo.FieldByName('IDMOTIVO').asFloat;
  Cmp_Padrao.ParamByName('ListaIdSitFunc').asString := sListaIdSitFuncSel;
  Cmp_Padrao.ParamByName('ListaIdRubricaRelCargoRemCC').asString := sListaIdRubricaSel1;
  Cmp_Padrao.ParamByName('ListaIdRubricaRelGratifCC').asString := sListaIdRubricaSel2;
  Cmp_Padrao.ParamByName('ListaIdRubricaTotFolha').asString := sListaIdRubricaSel3;
  Cmp_Padrao.ParamByName('ListaIdRubricaRelDespPessoal').asString := sListaIdRubricaSel4;
  Cmp_Padrao.ParamByName('OrdemRelDespPessoal').asInteger := cbmOrdemDemDespPessoal.ItemIndex;
  Cmp_Padrao.ParamByName('OrdemRelDistribPessSal').asInteger := cmbOrdemDistribPessSal.ItemIndex;
  Cmp_Padrao.ParamByName('OrdemRelEmprTempServ').asInteger := cmbOrdemRelEmprTempServ.ItemIndex;
  Cmp_Padrao.ParamByName('ApanhaDadosTrein').asBoolean := (rgApanhaDataTrein.ItemIndex = 0);
  Cmp_Padrao.ParamByName('ConsideraDataTreinInicial').asBoolean := (rgTipoDataTrein.ItemIndex = 0);
  Cmp_Padrao.ParamByName('LinhasComplRelDemDespPessoa').asString := sLinhasCompl;
  Cmp_Padrao.ParamByName('LinhasComplRelDemDespPessoaLin6').asString := sgrInfComplem.Cells[0,6];
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmParamGerencial.HabilitaBtOk;
var
  c: integer;
  bSelRub1, bSelRub2, bSelRub3, bSelSit: boolean;
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

  bSelSit := false;
  for c:=0 to chklstSituacoes.Items.Count-1 do
    if (chklstSituacoes.Checked[c]) then
    begin
      bSelSit := true;
      break;
    end;

  bbtnConfirmar.Enabled := (bSelRub1) and (bSelRub2) and (bSelRub3) and (bSelSit) and
    (sListaIdEstabSel <> '') and (Trim(speAno.Text) <> '') and
    (Trim(dblckMotivo.Text) <> '');
end;

procedure TfrmParamGerencial.LeArquivoConfig;
var
  sOrdemRelA: string;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+ '\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  sListaIdRubricaSel1 := ArqConfig.ReadString('REL_GERENCIAL', 'Rubricas1', '');
  sListaIdRubricaSel2 := ArqConfig.ReadString('REL_GERENCIAL', 'Rubricas2', '');
  sListaIdRubricaSel3 := ArqConfig.ReadString('REL_GERENCIAL', 'Rubricas3', '');
  sListaIdRubricaSel4 := ArqConfig.ReadString('REL_GERENCIAL', 'Rubricas4', '');
  sListaIdSitFuncSel := ArqConfig.ReadString('REL_GERENCIAL', 'Situacoes', '');
  sOrdemRelA := ArqConfig.ReadString('REL_GERENCIAL', 'OrdemRelA', '0');
  edSetor.Text := ArqConfig.ReadString('REL_GERENCIAL', 'TituloRel',
    'Divisão de Recursos Humanos e Logísticos - DIR');

  FU.VerificaOpcoes(chklstRubrica1, ListaIdRubrica, sListaIdRubricaSel1, ',');
  FU.VerificaOpcoes(chklstRubrica2, ListaIdRubrica, sListaIdRubricaSel2, ',');
  FU.VerificaOpcoes(chklstRubrica3, ListaIdRubrica, sListaIdRubricaSel3, ',');
  FU.VerificaOpcoes(chklstRubrica4, ListaIdRubrica, sListaIdRubricaSel4, ',');
  FU.VerificaOpcoes(chklstSituacoes, ListaIdSitFunc, sListaIdSitFuncSel, ',');

  cbmOrdemDemDespPessoal.ItemIndex := StrToIntDef(sOrdemRelA,0);

  edCodRubricas.Text := sListaIdRubricaSel1;
  edCodRubricas2.Text := sListaIdRubricaSel4;

  HabilitaBtOk;
end;

procedure TfrmParamGerencial.GravaArquivoConfig;
var
  sGravaPadrao: string;
begin
  // Grava as últimas alterações da Opção de Rubricas 1
  FU.CriaListaOpcoes(chklstRubrica1, ListaIdRubrica, sGravaPadrao, ',', false);
  ArqConfig.WriteString('REL_GERENCIAL','Rubricas1',sGravaPadrao);

  // Grava as últimas alterações da Opção de Rubricas 2
  FU.CriaListaOpcoes(chklstRubrica2, ListaIdRubrica, sGravaPadrao, ',', false);
  ArqConfig.WriteString('REL_GERENCIAL','Rubricas2',sGravaPadrao);

  // Grava as últimas alterações da Opção de Rubricas 3
  FU.CriaListaOpcoes(chklstRubrica3, ListaIdRubrica, sGravaPadrao, ',', false);
  ArqConfig.WriteString('REL_GERENCIAL','Rubricas3',sGravaPadrao);

  // Grava as últimas alterações da Opção de Rubricas 4
  FU.CriaListaOpcoes(chklstRubrica4, ListaIdRubrica, sGravaPadrao, ',', false);
  ArqConfig.WriteString('REL_GERENCIAL','Rubricas4',sGravaPadrao);

  // Grava as últimas alterações da Opção de Situações
  FU.CriaListaOpcoes(chklstSituacoes, ListaIdSitFunc, sGravaPadrao, ',', false);
  ArqConfig.WriteString('REL_GERENCIAL','Situacoes',sGravaPadrao);

  ArqConfig.WriteString('REL_GERENCIAL','OrdemRelA',IntToStr(cbmOrdemDemDespPessoal.ItemIndex));
  ArqConfig.WriteString('REL_GERENCIAL','TituloRel',edSetor.Text);
end;

procedure TfrmParamGerencial.bbtnSelTodosEstabClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := true;
  chklstEstab.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamGerencial.bbtnInverteSelEstabClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := not(chklstEstab.Checked[c]);
  chklstEstab.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamGerencial.chklstEstabClickCheck(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
end;

end.
