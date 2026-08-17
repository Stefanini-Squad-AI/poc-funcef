// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamRelSalContribINSS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, wwdblook, Spin, checklst,
  TREdit, IvDictio, IvMulti, IvEMulti, ComCtrls, IniFiles, DBClient, Grids, DBGrids,
  Wwdatsrc, wwdbdatetimepicker, CMDateTimePicker, Wwdbigrd, Wwdbgrid, fParamReports_Padrao,
  CmParamReport, uCMClientDataSet, uCtrlPessoaFuncionario, uCtrlPessoaFilialPessoa,
  uCtrlProvDesc, uCtrlPessoaDependente, uCtrlMotivo, ColorCheckListBox;

type
  TfrmParamRelSalContribINSS = class(TfrmParamReports_Padrao)
    pgctrlPrincipal: TPageControl;
    tbshPrincipal: TTabSheet;
    TabSheet2: TTabSheet;
    gbxEstab: TGroupBox;
    dblckEstab: TwwDBLookupCombo;
    gbxFunc: TGroupBox;
    dblckFunc: TwwDBLookupCombo;
    gbxLimitadoPor: TGroupBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    lblDe1: TLabel;
    lblDe2: TLabel;
    lblQuantMeses: TLabel;
    rbLimitadoPorData: TRadioButton;
    rbLimitadoPorQuantMeses: TRadioButton;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    spedQuantMeses: TSpinEdit;
    gbxSalContrib: TGroupBox;
    Label1: TLabel;
    rgTipoSel: TRadioGroup;
    chklstRubrica: TColorCheckListBox;
    bbtnSelTodas: TBitBtn;
    bbtnInverteSel: TBitBtn;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    gbxSalParteFixa: TGroupBox;
    dblckSalParteFixa: TwwDBLookupCombo;
    rgImprimeRelReqBenefIncap: TRadioGroup;
    Bevel3: TBevel;
    rgGozoBenef: TRadioGroup;
    rgOutraAtiv: TRadioGroup;
    gbxFilhos: TGroupBox;
    stgrFilhos: TStringGrid;
    Bevel4: TBevel;
    rgImprimeRelAtestAfastTrab: TRadioGroup;
    Label2: TLabel;
    dtedUltDiaTrab: TCMDateTimePicker;
    CdsFunc: TCMClientDataSet;
    CdsEstab: TCMClientDataSet;
    CdsRubrica: TCMClientDataSet;
    CdsRubSalParteFixa: TCMClientDataSet;
    CdsFilhos: TCMClientDataSet;
    tbshTipoFolha: TTabSheet;
    chklstTipoFolha: TColorCheckListBox;
    spbtSelTodos: TBitBtn;
    spbtInvSelecao: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblckEstabChange(Sender: TObject);
    procedure rbLimitadoPorDataClick(Sender: TObject);
    procedure chklstRubricaClickCheck(Sender: TObject);
    procedure bbtnSelTodasClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure sbtnMarcarRubClick(Sender: TObject);
    procedure rgTipoSelClick(Sender: TObject);
    procedure pgctrlPrincipalChange(Sender: TObject);
    procedure dblckFuncChange(Sender: TObject);
    procedure spbtSelTodosClick(Sender: TObject);
    procedure spbtInvSelecaoClick(Sender: TObject);
    procedure chklstTipoFolhaClickCheck(Sender: TObject);
  private
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlProvDesc: TCtrlProvDesc;
    CtrlPessoaDependente: TCtrlPessoaDependente;
    CtrlMotivo: TCtrlMotivo;

    ArqConfig: TIniFile;
    ListaIdTipoFolha, ListaIdRubrica: TStringList;

    sListaIdRubricaSel: string;

    procedure LerAlteracoes;
    procedure GravarAlteracoes;
    procedure HabilitaBtOk;
    procedure MontaListaFuncionarios;
  end;

var
  frmParamRelSalContribINSS: TfrmParamRelSalContribINSS;

implementation

uses uSistema, uMensErro, fAguarde, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH, dCds;

{$R *.DFM}

procedure TfrmParamRelSalContribINSS.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

  CtrlPessoaDependente := TCtrlPessoaDependente.Create;
  CtrlPessoaDependente.InitializeAs(Padroes);

  CdsEstab.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));

  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);

  // Lista de Tipos de Folha
  ListaIdTipoFolha := TStringList.Create;
  chklstTipoFolha.Items.Clear;
  ListaIdTipoFolha.Clear;
  dmCds.Cds.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('F,D');
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdTipoFolha.Add(dmCds.Cds.FieldByName('IDMOTIVO').asString);
    chklstTipoFolha.Items.Add(dmCds.Cds.FieldByName('DESCRICAO').asString);
    dmCds.Cds.Next;
  end;

  // Montagem da Lista de Rubricas
  ListaIdRubrica := TStringList.Create;
  CdsRubrica.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa));
  rgTipoSelClick(Sender);
  CdsRubSalParteFixa.Data := CdsRubrica.Data;

  cmbMes.ItemIndex := 6;
  pgctrlPrincipal.ActivePageIndex := 0;

  // Carrega alterações nas opções feitas anteriormente
  LerAlteracoes;
end;

procedure TfrmParamRelSalContribINSS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravarAlteracoes;
  FreeAndNil(ListaIdRubrica);
  FreeAndNil(ListaIdTipoFolha);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlProvDesc);
  FreeAndNil(CtrlPessoaDependente);
  FreeAndNil(CtrlMotivo);
  inherited;
end;

procedure TfrmParamRelSalContribINSS.dblckEstabChange(Sender: TObject);
begin
  MontaListaFuncionarios;
end;

procedure TfrmParamRelSalContribINSS.dblckFuncChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamRelSalContribINSS.pgctrlPrincipalChange(Sender: TObject);
var
  c: byte;
begin
  if (pgctrlPrincipal.ActivePageIndex = 1) then
  begin
    // Selecionar os Filhos do Empregado Selecionado
    if (CdsFunc.Active) then
    begin
      CdsFilhos.Data := CtrlPessoaDependente.SelDependentesPessoa(
        CdsFunc.FieldByName('IdPessoa').asFloat, 'FIL');
      CdsFilhos.Filter := 'FLGCONTASALARIOF = 1';
      CdsFilhos.Filtered := True;
      stgrFilhos.RowCount := CdsFilhos.RecordCount;
      stgrFilhos.ColWidths[0] := 480;
      if not(CdsFilhos.IsEmpty) then
      begin
        c := 0;
        repeat
          stgrFilhos.Cells[0,c] := CdsFilhos.FieldByName('NOME').asString;
          CdsFilhos.Next;
          Inc(c);
        until (CdsFilhos.EOF);
      end;
      HabilitaBtOk;
    end;
  end;  
end;

procedure TfrmParamRelSalContribINSS.chklstRubricaClickCheck(Sender: TObject);
begin
  inherited;
  FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', false);
  edCodRubricas.Text := sListaIdRubricaSel;
  HabilitaBtOk;
end;

procedure TfrmParamRelSalContribINSS.rgTipoSelClick(Sender: TObject);
begin
  // Seleciona Rubricas de acordo com a composição escolhida:
  // Composto por Incidências -> Seleciona somente Rubricas de Apoio
  // Composto pelas Rubricas Indicadas -> Seleciona todas as Rubricas
  chklstRubrica.Items.BeginUpdate;
  chklstRubrica.Items.Clear;
  ListaIdRubrica.Clear;
  CdsRubrica.First;
  while not(CdsRubrica.EOF) do
  begin
    if (rgTipoSel.ItemIndex = 1) or ((rgTipoSel.ItemIndex = 0) and
       (CdsRubrica.FieldByName('FLGDESCONTO').asInteger = 2)) then
    begin
      ListaIdRubrica.Add(CdsRubrica.FieldByName('CODPROVDESC').asString);
      chklstRubrica.Items.Add(CdsRubrica.FieldByName('DESCRPROVDESC').asString);
    end;
    CdsRubrica.Next;
  end;
  sbtnMarcarRubClick(Sender);
  FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', false);
  edCodRubricas.Text := sListaIdRubricaSel;
  chklstRubrica.Items.EndUpdate;
end;

procedure TfrmParamRelSalContribINSS.bbtnSelTodasClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := true;
  chklstRubrica.Repaint;
  chklstRubricaClickCheck(Sender);
end;

procedure TfrmParamRelSalContribINSS.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := not(chklstRubrica.Checked[c]);
  chklstRubrica.Repaint;
  chklstRubricaClickCheck(Sender);
end;

procedure TfrmParamRelSalContribINSS.sbtnMarcarRubClick(Sender: TObject);
begin
  edCodRubricas.Text := Trim(edCodRubricas.Text);
  FU.VerificaOpcoes(chklstRubrica, ListaIdRubrica, edCodRubricas.Text, ',');
  chklstRubrica.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamRelSalContribINSS.rbLimitadoPorDataClick(Sender: TObject);
begin
  lblDe1.Visible := rbLimitadoPorData.Checked;
  lblDe2.Visible := rbLimitadoPorData.Checked;
  cmbMes.Visible := rbLimitadoPorData.Checked;
  speAno.Visible := rbLimitadoPorData.Checked;
  spedQuantMeses.Visible := rbLimitadoPorQuantMeses.Checked;
  lblQuantMeses.Visible := rbLimitadoPorQuantMeses.Checked;
  HabilitaBtOk;
end;

procedure TfrmParamRelSalContribINSS.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
  c: byte;
  sListaPreNomeFilhos, sListaDataNascFilhos, sListaIdTipoFolhaSel: string;
begin
  // Rubrica(s) selecionada(s)
  FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', true);

  // Tipos de Folha selecionados
  wNum := FU.CriaListaOpcoes(chklstTipoFolha, ListaIdTipoFolha, sListaIdTipoFolhaSel, ',', false);
  if (wNum = ListaIdTipoFolha.Count) then
    sListaIdTipoFolhaSel := '';

  // Pré-Nome dos Filhos
  sListaPreNomeFilhos := '';
  sListaDataNascFilhos := '';
  if (rgImprimeRelAtestAfastTrab.ItemIndex = 0) then
  begin
    for c:=0 to stgrFilhos.RowCount-1 do
      if (sListaPreNomeFilhos = '') then
        sListaPreNomeFilhos := stgrFilhos.Cells[0,c]
      else
        sListaPreNomeFilhos := sListaPreNomeFilhos +','+ stgrFilhos.Cells[0,c];

    if not(CdsFilhos.IsEmpty) then
    begin
      CdsFilhos.First;
      repeat
        if (sListaDataNascFilhos = '') then
          sListaDataNascFilhos := CdsFilhos.FieldByName('DataNasc').asString
        else
          sListaDataNascFilhos := sListaDataNascFilhos +','+ CdsFilhos.FieldByName('DataNasc').asString;

        CdsFilhos.Next;
      until (CdsFilhos.EOF);
    end;
  end;

  Cmp_Padrao.ParamByName('IdEstab').asFloat := CdsEstab.FieldByName('IDPESSOA').asFloat;
  Cmp_Padrao.ParamByName('IdFunc').asFloat := CdsFunc.FieldByName('IDPESSOA').asFloat;
  Cmp_Padrao.ParamByName('LimitadoPorData').asBoolean := rbLimitadoPorData.Checked;
  Cmp_Padrao.ParamByName('Mes').asInteger := cmbMes.ItemIndex+1;
  Cmp_Padrao.ParamByName('Ano').asInteger := speAno.Value;
  Cmp_Padrao.ParamByName('QuantMeses').asInteger := spedQuantMeses.Value+1;
  Cmp_Padrao.ParamByName('UltimoDiaTrab').asDateTime := dtedUltDiaTrab.Date;
  Cmp_Padrao.ParamByName('SelRubricaPorIncid').asBoolean := (rgTipoSel.ItemIndex = 0);
  Cmp_Padrao.ParamByName('ListaIdRubrica').asString := sListaIdRubricaSel;
  Cmp_Padrao.ParamByName('ListaTipoFolha').asString := sListaIdTipoFolhaSel;
  Cmp_Padrao.ParamByName('IdRubricaSalParteFixa').asString := CdsRubSalParteFixa.FieldByName('CODPROVDESC').asString;
  Cmp_Padrao.ParamByName('ImprimirRelReqBenefIncap').asBoolean := (rgImprimeRelReqBenefIncap.ItemIndex = 0);
  Cmp_Padrao.ParamByName('ImprimirRelAtestAfastTrab').asBoolean := (rgImprimeRelAtestAfastTrab.ItemIndex = 0);
  Cmp_Padrao.ParamByName('PessoaGozaBenef').asBoolean := (rgGozoBenef.ItemIndex = 0);
  Cmp_Padrao.ParamByName('PessoaPossuiOutraAtiv').asBoolean := (rgOutraAtiv.ItemIndex = 0);
  Cmp_Padrao.ParamByName('ListaPreNomeFilhos').asString := sListaPreNomeFilhos;
  Cmp_Padrao.ParamByName('ListaDataNascFilhos').asString := sListaDataNascFilhos;

  frmAguarde.Mostra('Relação dos Salários de Contribuição');
  frmAguarde.Pos := 0;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmParamRelSalContribINSS.LerAlteracoes;
var
  sAuxiliar: string;
begin
  // Recupera as últimas alterações das opções
 // ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  rgImprimeRelReqBenefIncap.ItemIndex := StrToInt(ArqConfig.ReadString(
    'REL_RELSALCONTRIB', 'RelReqBenefIncap', '1'));

  sAuxiliar := ArqConfig.ReadString('REL_RELSALCONTRIB', 'Estabelec', '');
  if (sAuxiliar = '') then
  begin
    CdsEstab.First;
    sAuxiliar := CdsEstab.FieldByName('IDPESSOA').asString;
  end;
  dblckEstab.LookUpValue := sAuxiliar;
  dblckEstab.UpDate;

  sAuxiliar := ArqConfig.ReadString('REL_RELSALCONTRIB', 'TipoSelecaoRub', 'Incidências');
  rgTipoSel.ItemIndex := FU.IFF(sAuxiliar = 'Incidências',0,1);

  sAuxiliar := ArqConfig.ReadString ('REL_RELSALCONTRIB', 'RubricaSalContrib', '');
  FU.VerificaOpcoes(chklstRubrica, ListaIdRubrica, sAuxiliar, ',');
  edCodRubricas.Text := sAuxiliar;

  sAuxiliar := ArqConfig.ReadString('REL_RELSALCONTRIB', 'RubricaSalParteFixa', '');
  if (sAuxiliar = '') then
  begin
    CdsRubSalParteFixa.First;
    sAuxiliar := CdsRubSalParteFixa.FieldByName('CODPROVDESC').asString;
  end;
  dblckSalParteFixa.LookUpValue := sAuxiliar;
  dblckSalParteFixa.Update;

  HabilitaBtOk;
end;

procedure TfrmParamRelSalContribINSS.GravarAlteracoes;
var
  sGravaPadrao: string;
begin
  ArqConfig.WriteString('REL_RELSALCONTRIB','Estabelec',CdsEstab.FieldByName('IDPESSOA').asString);
  ArqConfig.WriteString('REL_RELSALCONTRIB','RubricaSalParteFixa',CdsRubSalParteFixa.FieldByName('CODPROVDESC').asString);
  ArqConfig.WriteString('REL_RELSALCONTRIB','TipoSelecaoRub',FU.IFF(rgTipoSel.itemIndex = 0,'Incidências','Valor'));
  ArqConfig.WriteString('REL_RELSALCONTRIB','RelReqBenefIncap',IntToStr(rgImprimeRelReqBenefIncap.ItemIndex));

  // Grava as últimas alterações da Opção de Rubricas
  FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sGravaPadrao, ',', false);
  ArqConfig.WriteString('REL_RELSALCONTRIB','RubricaSalContrib',sGravaPadrao);
end;

procedure TfrmParamRelSalContribINSS.MontaListaFuncionarios;
begin
  if (Trim(dblckEstab.Text) <> '') then
  begin
    CdsFunc.DisableControls;
    
    CdsFunc.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(Sistema.IdEmpresa,
      '', CdsEstab.FieldByName('IDPESSOA').asString);

    CdsFunc.EnableControls;
  end;
  HabilitaBtOk;
end;

procedure TfrmParamRelSalContribINSS.HabilitaBtOk;
var
  c: integer;
  bSelRub: boolean;
begin
  bSelRub := false;
  for c:=0 to chklstRubrica.Items.Count-1 do
    if (chklstRubrica.Checked[c]) then
    begin
      bSelRub := true;
      break;
    end;

  bbtnConfirmar.Enabled := (bSelRub) and (Trim(dblckEstab.Text) <> '') and
    (Trim(dblckFunc.Text) <> '') and (Trim(dblckSalParteFixa.Text) <> '') and
    (((rbLimitadoPorData.Checked) and (Trim(speAno.Text) <> '')) or
     ((rbLimitadoPorQuantMeses.Checked) and (Trim(spedQuantMeses.Text) <> '')));
end;

procedure TfrmParamRelSalContribINSS.spbtSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoFolha.Items.Count-1 do
    chklstTipoFolha.Checked[c] := true;
  chklstTipoFolha.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamRelSalContribINSS.spbtInvSelecaoClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoFolha.Items.Count-1 do
    chklstTipoFolha.Checked[c] := not(chklstTipoFolha.Checked[c]);
  chklstTipoFolha.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamRelSalContribINSS.chklstTipoFolhaClickCheck(
  Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
end;

end.
