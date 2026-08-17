// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamGRCS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, Spin, Wwdatsrc, TREdit,
  DBTables, IniFiles, checklst, ComCtrls, fSairAjuda, wwdblook, DBClient, uCMClientDataSet,
  wwdbdatetimepicker, CMDateTimePicker, fParamReports_Padrao, CmParamReport, uCtrlGlobalRH,
  uCtrlPessoaSindicato, uCtrlProvDesc, uCtrlListTerceirosRH, uCtrlPessoaFilialPessoa,
  ColorCheckListBox;

type
  TfrmParamGRCS = class(TfrmParamReports_Padrao)
    CdsMoeda: TCMClientDataSet;
    CdsCotacaoMoeda: TCMClientDataSet;
    CdsSindicato: TCMClientDataSet;
    pgctrlPrincipal: TPageControl;
    tbshPrincipal: TTabSheet;
    tbshOpcoesCalc: TTabSheet;
    gbxEstab: TGroupBox;
    chklstEstab: TColorCheckListBox;
    bbtnSelTodosEstab: TBitBtn;
    bbtnInverteSelEstab: TBitBtn;
    gbxRubricas: TGroupBox;
    Label5: TLabel;
    Paginas: TPageControl;
    tbshRubRem: TTabSheet;
    chklstRubrica1: TColorCheckListBox;
    tbshRubContrib: TTabSheet;
    chklstRubrica2: TColorCheckListBox;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    chkbxCorrecao: TCheckBox;
    cbJuros: TCheckBox;
    cbMulta: TCheckBox;
    pnlCorrecao: TPanel;
    dblkpCorrecao: TwwDBLookupCombo;
    pnlJuros: TPanel;
    rbPercentJuros: TRadioButton;
    rbValorJuros: TRadioButton;
    redJuros: TRealEdit;
    pnlMulta: TPanel;
    rbValorMulta: TRadioButton;
    rbPercentMulta: TRadioButton;
    redMulta: TRealEdit;
    Bevel1: TBevel;
    gbxDataProcess: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dtPagtoLimite: TCMDateTimePicker;
    dtPagamento: TCMDateTimePicker;
    dtVencimento: TCMDateTimePicker;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    GroupBox1: TGroupBox;
    chklstSindi: TColorCheckListBox;
    bbtnSelTodosSindi: TBitBtn;
    bbtnInverteSelSindi: TBitBtn;
    gbxTipContra: TGroupBox;
    cbxEfetivos: TCheckBox;
    cbxEspeciais: TCheckBox;
    cbxTemporarios: TCheckBox;
    cbxEstagiarios: TCheckBox;
    cbxTerceiros: TCheckBox;
    cbxPropDirSemVinc: TCheckBox;
    cbxAutonomos: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure chkbxCorrecaoClick(Sender: TObject);
    procedure cbJurosClick(Sender: TObject);
    procedure cbMultaClick(Sender: TObject);
    procedure sbtnMarcarRubClick(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure chklstRubrica1ClickCheck(Sender: TObject);
    procedure speAnoChange(Sender: TObject);
    procedure chklstEstabClickCheck(Sender: TObject);
    procedure bbtnSelTodosEstabClick(Sender: TObject);
    procedure bbtnInverteSelEstabClick(Sender: TObject);
    procedure bbtnSelTodosSindiClick(Sender: TObject);
    procedure bbtnInverteSelSindiClick(Sender: TObject);
  private
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlPessoaSindicato: TCtrlPessoaSindicato;
    CtrlProvDesc: TCtrlProvDesc;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;

    chkListAux: TColorCheckListBox;
    ListaIdRubrica: TStringList;
    ListaIdEstab, ListaIdSindi: TStringList;
    ArqConfig: TIniFile;

    CotacaoMoedaDataVenc, CotacaoMoedaDataPag: double;
    ListaIdRubricaSel: array[0..1] of string;

    function  VerificarTipoCorrMonet: boolean;
    function  VerificarOpcoesOk: boolean;
    procedure HabilitaBtOk;
    procedure LeAlteracoes;
    procedure GravaAlteracoes;
  end;

var
  frmParamGRCS: TfrmParamGRCS;

implementation

uses uSistema, uMensErro, fAguarde, dCds, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmParamGRCS.FormCreate(Sender: TObject);
var
  c: byte;
  NormalIni: TDate;
begin
  inherited;
  ListaIdRubrica := TStringList.Create;
  ListaIdEstab := TStringList.Create;
  ListaIdSindi := TStringList.Create;

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlPessoaSindicato := TCtrlPessoaSindicato.Create;
  CtrlPessoaSindicato.InitializeAs(Padroes);

  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  // Preenche ChkList das Rubricas
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

  // Preenche ChkList de Estabelecimentos
  c := 0;
  dmCds.Cds.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdEstab.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
    chklstEstab.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
    chklstEstab.Checked[c] := true;
    dmCds.Cds.Next;
    Inc(c);
  end;

  CdsSindicato.Data := CtrlPessoaSindicato.ListSindicatoComFuncionarios;
  // Preenche ChkList de Sindicatos
  c := 0;
  while not(CdsSindicato.EOF) do
  begin
    ListaIdSindi.Add(CdsSindicato.FieldByName('IDPESSOA').asString);
    chklstSindi.Items.Add(CdsSindicato.FieldByName('NOME').asString);
    chklstSindi.Checked[c] := true;
    CdsSindicato.Next;
    Inc(c);
  end;

  CdsMoeda.Data := CtrlListTerceirosRH.ListMoeda;

  NormalIni := CtrlGlobalRH.GetNormalIni;
  dtPagamento.Date := NormalIni;
  dtPagtoLimite.Date := NormalIni;
  dtVencimento.Date := NormalIni;
  cmbMes.ItemIndex := FU.ExtraiMes(NormalIni) - 1;
  speAno.Value := FU.ExtraiAno(NormalIni);

  Paginas.ActivePageIndex := 0;

  // Carrega alterações nas opções feitas anteriormente
  LeAlteracoes;
  HabilitaBtOk;
end;

procedure TfrmParamGRCS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlPessoaSindicato);
  FreeAndNil(CtrlProvDesc);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlPessoaFilialPessoa);
  GravaAlteracoes;
  FreeAndNil(ListaIdRubrica);
  FreeAndNil(ListaIdEstab);
  FreeAndNil(ListaIdSindi);
  inherited;
end;

procedure TfrmParamGRCS.speAnoChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamGRCS.PaginasChange(Sender: TObject);
begin
  edCodRubricas.Text := ListaIdRubricaSel[Paginas.ActivePageIndex];
end;

procedure TfrmParamGRCS.chklstRubrica1ClickCheck(Sender: TObject);
begin
  inherited;
  FU.CriaListaOpcoes(TColorCheckListBox(Sender), ListaIdRubrica,
    ListaIdRubricaSel[Paginas.ActivePageIndex], ',', false);
  edCodRubricas.Text := ListaIdRubricaSel[Paginas.ActivePageIndex];
  HabilitaBtOk;
end;

procedure TfrmParamGRCS.chklstEstabClickCheck(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
end;

procedure TfrmParamGRCS.sbtnMarcarRubClick(Sender: TObject);
begin
  case (Paginas.ActivePageIndex) of
    0 : chkListAux := chklstRubrica1;
    1 : chkListAux := chklstRubrica2;
  end;

  edCodRubricas.Text := Trim(edCodRubricas.Text);
  FU.VerificaOpcoes(chkListAux, ListaIdRubrica, edCodRubricas.Text, ',');
  ListaIdRubricaSel[Paginas.ActivePageIndex] := edCodRubricas.Text;

  HabilitaBtOk;
  chkListAux.Repaint;
end;

procedure TfrmParamGRCS.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  case (Paginas.ActivePageIndex) of
    0 : chkListAux := chklstRubrica1;
    1 : chkListAux := chklstRubrica2;
  end;

  for c:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[c] := true;

  FU.CriaListaOpcoes(chkListAux, ListaIdRubrica, ListaIdRubricaSel[Paginas.ActivePageIndex], ',', false);
  edCodRubricas.Text := ListaIdRubricaSel[Paginas.ActivePageIndex];
  chkListAux.Repaint;

  HabilitaBtOk;
end;

procedure TfrmParamGRCS.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  case (Paginas.ActivePageIndex) of
    0 : chkListAux := chklstRubrica1;
    1 : chkListAux := chklstRubrica2;
  end;

  for c:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[c] := not(chkListAux.Checked[c]);

  FU.CriaListaOpcoes(chkListAux, ListaIdRubrica, ListaIdRubricaSel[Paginas.ActivePageIndex], ',', false);
  edCodRubricas.Text := ListaIdRubricaSel[Paginas.ActivePageIndex];
  chkListAux.Repaint;

  HabilitaBtOk;
end;

procedure TfrmParamGRCS.bbtnSelTodosEstabClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := true;
  chklstEstab.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamGRCS.bbtnInverteSelEstabClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := not(chklstEstab.Checked[c]);
  chklstEstab.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamGRCS.bbtnSelTodosSindiClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstSindi.Items.Count-1 do
    chklstSindi.Checked[c] := true;
  chklstSindi.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamGRCS.bbtnInverteSelSindiClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstSindi.Items.Count-1 do
    chklstSindi.Checked[c] := not(chklstSindi.Checked[c]);
  chklstSindi.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamGRCS.chkbxCorrecaoClick(Sender: TObject);
begin
  pnlCorrecao.Visible := chkbxCorrecao.Checked;
end;

procedure TfrmParamGRCS.cbJurosClick(Sender: TObject);
begin
  pnlJuros.Visible := cbJuros.Checked;
  if (cbJuros.Checked) then
    redJuros.SetFocus;
end;

procedure TfrmParamGRCS.cbMultaClick(Sender: TObject);
begin
  pnlMulta.Visible := cbMulta.Checked;
  if (cbMulta.Checked) then
    redMulta.SetFocus;
end;

procedure TfrmParamGRCS.bbtnConfirmarClick(Sender: TObject);
var
  sListaIdEstabSel, sListaIdSindiSel: string;
begin
  if not(VerificarOpcoesOk) then
  begin
    ModalResult := mrNone;
    exit;
  end;

  // Estabelecimentos selecionados
  FU.CriaListaOpcoes(chklstEstab, ListaIdEstab, sListaIdEstabSel, ',', false);

  // Sindicatos selecionados
  FU.CriaListaOpcoes(chklstSindi, ListaIdSindi, sListaIdSindiSel, ',', false);

  // Rubricas para Remuneração selecionadas
  FU.CriaListaOpcoes(chklstRubrica1, ListaIdRubrica, ListaIdRubricaSel[0], ',', true);

  // Rubricas para Contribuição selecionadas
  FU.CriaListaOpcoes(chklstRubrica2, ListaIdRubrica, ListaIdRubricaSel[1], ',', true);

  Cmp_Padrao.ParamByName('IdSindicato').asString := sListaIdSindiSel;
  Cmp_Padrao.ParamByName('MesRef').asInteger := cmbMes.ItemIndex+1;
  Cmp_Padrao.ParamByName('AnoRef').asInteger := speAno.Value;
  Cmp_Padrao.ParamByName('ListaIdRubricaRemSel').asString := ListaIdRubricaSel[0];
  Cmp_Padrao.ParamByName('ListaIdRubricaContrib').asString := ListaIdRubricaSel[1];
  Cmp_Padrao.ParamByName('Juros').asFloat := redJuros.Value;
  Cmp_Padrao.ParamByName('PercentJuros').asBoolean := rbPercentJuros.Checked;
  Cmp_Padrao.ParamByName('Multa').asFloat := redMulta.Value;
  Cmp_Padrao.ParamByName('PercentMulta').asBoolean := rbPercentMulta.Checked;
  Cmp_Padrao.ParamByName('DataPagamento').asString := dtPagamento.Text;
  Cmp_Padrao.ParamByName('DataVencimento').asString := dtVencimento.Text;
  Cmp_Padrao.ParamByName('CotacaoMoedaDataPag').asFloat := CotacaoMoedaDataPag;
  Cmp_Padrao.ParamByName('CotacaoMoedaDataVenc').asFloat := CotacaoMoedaDataVenc;
  Cmp_Padrao.ParamByName('ListaIdEstab').asString := sListaIdEstabSel;
  Cmp_Padrao.ParamByName('TipoContrato').asString := FU.GerarListaTipoContratoSel(
    cbxEfetivos.Checked, cbxEspeciais.Checked, cbxTemporarios.Checked, cbxTerceiros.Checked,
    cbxPropDirSemVinc.Checked, cbxAutonomos.Checked, cbxEstagiarios.Checked, true);

  frmAguarde.Mostra('Impresso GRCS');
  frmAguarde.Pos := 0;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

function TfrmParamGRCS.VerificarTipoCorrMonet: boolean;
var
  iCorrecao: LongInt;
  sDataPgto, sDataVenc: string;
begin
  Result := false;

  if (pnlCorrecao.Visible) then
  begin
    if (dblkpCorrecao.Text = '') then
    begin
      MsgDlg('Tipo de Correção Monetária não escolhida.', 'Aviso', mtWarning, [mbOK,mbHelp], 0);
      dblkpCorrecao.SetFocus;
      exit;
    end
    else
    begin
      iCorrecao := CdsMoeda.FieldByName('MOECODIGO').asInteger;

      //******************************************************************************
      // Verfica se Tipo de Correção Monetária é Diário, Mensal, Semestral ou Anual
      // (tirando otipo DIÁRIO, vale sempre o 1º dia do Mês/Semestre/Ano)
      //******************************************************************************

      //***************
      // Vencimento
      //***************
      case (CdsMoeda.FieldByName('MOEPERIODICIDADE').asString[1]) of
        'D' : sDataVenc := dtVencimento.Text; // Diário
        'M' : sDataVenc := '01'+Copy(dtVencimento.Text,3,8); // Mensal
        'A' : sDataVenc := '01/01'+Copy(dtVencimento.Text,6,5); // Anual
        'S' : // Semestral
        if (StrToDate(dtVencimento.Text) < StrToDate('01/07'+Copy(dtVencimento.Text,6,5))) then
          sDataVenc := '01/01'+Copy(dtVencimento.Text,6,5) // 1º Semestre
        else
          sDataVenc := '01/07'+Copy(dtVencimento.Text,6,5); // 2º Semestre
      end;

      // Verifica se o Tipo está cadastrado na data referida
      CdsCotacaoMoeda.Data := CtrlListTerceirosRH.ListCotacaoMoeda(iCorrecao,
        StrToDate(sDataVenc));

      if (CdsCotacaoMoeda.IsEmpty) then
      begin
        MsgDlg('Tipo de Correção Monetária para Vencimento não cadastrado.',
          'Aviso', mtWarning, [mbOK,mbHelp], 0);
        exit;
      end
      else
        CotacaoMoedaDataVenc := CdsCotacaoMoeda.FieldByName('VALOR').AsFloat;

      //***************
      // Pagamento
      //***************
      case (CdsMoeda.FieldByName('MOEPERIODICIDADE').asString[1]) of
        'D' : sDataPgto := dtPagamento.Text; // Diário
        'M' : sDataPgto := '01'+Copy(dtPagamento.Text,3,8); // Mensal
        'A' : sDataPgto := '01/01'+Copy(dtPagamento.Text,6,5); // Anual
        'S' : // Semestral
          if (StrToDate(dtPagamento.Text) < StrToDate('01/07'+Copy(dtPagamento.Text,6,5))) then
            sDataPgto := '01/01'+Copy(dtPagamento.Text,6,5)  // 1º Semestre
          else
            sDataPgto := '01/07'+Copy(dtPagamento.Text,6,5); // 2º Semestre
      end;

      // Verifica se o Tipo está cadastrado na data referida
      CdsCotacaoMoeda.Data := CtrlListTerceirosRH.ListCotacaoMoeda(iCorrecao,
        StrToDate(sDataPgto));

      if (CdsCotacaoMoeda.IsEmpty) then
      begin
        MsgDlg('Tipo de Correção Monetária para Pagamento não cadastrado.',
          'Aviso', mtWarning, [mbOK,mbHelp], 0);
        exit;
      end
      else
        CotacaoMoedaDataPag := CdsCotacaoMoeda.FieldByName('VALOR').asFloat;
    end;
  end
  else
    CdsMoeda.Locate('MOEDESC', 'REAL', [loCaseInsensitive]);

  Result := true;
end;

function TfrmParamGRCS.VerificarOpcoesOk: boolean;
begin
  Result := false;

  // Verifica se os valores Informados são válidos
  // Juros
  if (pnlJuros.Visible) then
  begin
    if (redJuros.Value = 0) then
    begin
      MsgDlg('Valor do Juros não pode ser vazio.', 'Aviso', mtWarning, [mbOK,mbHelp], 0);
      redJuros.SetFocus;
      exit;
    end;
  end;

  // Multas
  if (pnlMulta.Visible) then
  begin
    if (redMulta.Value = 0) then
    begin
      MsgDlg('Valor da Multa não pode ser Vazio.', 'Aviso', mtWarning, [mbOK,mbHelp], 0);
      redMulta.SetFocus;
      exit;
    end;
  end;

  // Verfica se o Tipo de Correção Monetária foi escolhido
  if not(VerificarTipoCorrMonet) then
    exit;

  Result := true;
end;

procedure TfrmParamGRCS.HabilitaBtOk;
var
  c: integer;
  bSelEstab, bSelSindi, bSelRub1, bSelRub2: boolean;
begin
  bSelEstab := false;
  for c:=0 to chklstEstab.Items.Count-1 do
    if (chklstEstab.Checked[c]) then
    begin
      bSelEstab := true;
      break;
    end;

  bSelSindi := false;
  for c:=0 to chklstSindi.Items.Count-1 do
    if (chklstSindi.Checked[c]) then
    begin
      bSelSindi := true;
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

  bbtnConfirmar.Enabled := (bSelEstab) and (bSelRub1) and (bSelRub2) and
    (bSelSindi) and (Trim(speAno.Text) <> '') and
    (Trim(dtVencimento.Text) <> '') and (Trim(dtPagtoLimite.Text) <> '') and
    (Trim(dtPagamento.Text) <> '');
end;

procedure TfrmParamGRCS.LeAlteracoes;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  ListaIdRubricaSel[0] := ArqConfig.ReadString('REL_GRCS', 'RubRem', '');
  FU.VerificaOpcoes(chklstRubrica1, ListaIdRubrica, ListaIdRubricaSel[0], ',');

  ListaIdRubricaSel[1] := ArqConfig.ReadString('REL_GRCS', 'RubContrib', '');
  FU.VerificaOpcoes(chklstRubrica2, ListaIdRubrica, ListaIdRubricaSel[1], ',');

  edCodRubricas.Text := ListaIdRubricaSel[0];
end;

procedure TfrmParamGRCS.GravaAlteracoes;
var
  sGravaPadrao: string;
begin
  // Grava as últimas alterações da Opção de Rubricas para Remuneração
  FU.CriaListaOpcoes(chklstRubrica1, ListaIdRubrica, sGravaPadrao, ',', false);
  ArqConfig.WriteString('REL_GRCS', 'RubRem', sGravaPadrao);

  // Grava as últimas alterações da Opção de Rubricas para Cotribuição
  FU.CriaListaOpcoes(chklstRubrica2, ListaIdRubrica, sGravaPadrao, ',', false);
  ArqConfig.WriteString('REL_GRCS', 'RubContrib', sGravaPadrao);
end;

end.
