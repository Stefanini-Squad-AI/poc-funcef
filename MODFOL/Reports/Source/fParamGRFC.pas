// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamGRFC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwdatsrc, wwdblook, checklst,
  TREdit, IvDictio, IvMulti, IvEMulti, IniFiles, ComCtrls, wwdbdatetimepicker, DBClient,
  CMDateTimePicker, uCMClientDataSet, fParamReports_Padrao, CmParamReport, uCtrlGlobalRH,
  uCtrlProvDesc, uCtrlPessoaFilialPessoa, uCtrlPessoaFuncionario, uCtrlListTerceirosRH,
  ColorCheckListBox, Spin;

type
  TfrmParamGRFC = class(TfrmParamReports_Padrao)
    CdsEstab: TCMClientDataSet;
    CdsResp: TCMClientDataSet;
    gbxEstab: TGroupBox;
    dblkcbEstab: TwwDBLookupCombo;
    rgProcesso: TRadioGroup;
    rgFGTSAnt: TRadioGroup;
    gbxFunc: TGroupBox;
    chklstFunc: TColorCheckListBox;
    bbtnSelTodosFunc: TBitBtn;
    bbtnInverteSelFunc: TBitBtn;
    gbxMulta: TGroupBox;
    Label4: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    redIndiceRecAtrasoRecolh1: TRealEdit;
    redIndiceRecAtrasoRecolh2: TRealEdit;
    redIndiceRecAtrasoMultaRes: TRealEdit;
    gbxMesAnoRef: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    gbxRescCompl: TGroupBox;
    rgRescCompl: TRadioButton;
    rgNaoRescCompl: TRadioButton;
    pnlRescCompl: TPanel;
    Label5: TLabel;
    cmbMesDeslig: TComboBox;
    speAnoDeslig: TSpinEdit;
    gbxResp: TGroupBox;
    dblkcbResp: TwwDBLookupCombo;
    gbxDataEmissao: TGroupBox;
    dtedDataEmissao: TCMDateTimePicker;
    rbxDisAcordo: TGroupBox;
    rbRecDisAcordo: TRadioButton;
    rbNaoRecDisAcordo: TRadioButton;
    dtedDataDisAcordo: TCMDateTimePicker;
    gbxPerc: TGroupBox;
    redPerc: TRealEdit;
    gbxRubricas: TGroupBox;
    Label1: TLabel;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    Paginas: TPageControl;
    tbshRubrica1: TTabSheet;
    chklstRubrica1: TColorCheckListBox;
    tbshRubrica2: TTabSheet;
    chklstRubrica2: TColorCheckListBox;
    tbshRubrica3: TTabSheet;
    chklstRubrica3: TColorCheckListBox;
    tbshRubrica4: TTabSheet;
    chklstRubrica4: TColorCheckListBox;
    tbshAdto13: TTabSheet;
    chklstRubrica5: TColorCheckListBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
    procedure sbtnMarcarRubClick(Sender: TObject);
    procedure chklstRubrica1ClickCheck(Sender: TObject);
    procedure bbtnSelTodosFuncClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
    procedure chklstFuncClickCheck(Sender: TObject);
    procedure dblkcbRespChange(Sender: TObject);
    procedure rbRecDisAcordoClick(Sender: TObject);
    procedure dtedDataDisAcordoChange(Sender: TObject);
    procedure cmbMesChange(Sender: TObject);
    procedure rgRescComplClick(Sender: TObject);
  private
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlProvDesc: TCtrlProvDesc;
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;

    ArqConfig: TIniFile;
    ListaIdFunc, ListaIdRubrica: TStringList;

    IdEstab: double;
    sListaIdRubricaSel: array[1..5] of string;

    procedure MontaListaFuncionarios;
    procedure HabilitaBtOk;
    procedure LeAlteracoes;
    procedure GravaAlteracoes;
  end;

var
  frmParamGRFC: TfrmParamGRFC;

implementation

uses uSistema, uMensErro, fAguarde, dCds, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmParamGRFC.FormCreate(Sender: TObject);
var
  dDataRef: TDate;
begin
  inherited;
  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  ListaIdFunc := TStringList.Create;
  ListaIdRubrica := TStringList.Create;

  // Apagar o índice se este existir
  dmCds.Cds.IndexName := '';
  if (dmCds.Cds.IndexDefs.IndexOf('Index1') > 0) then
    dmCds.Cds.DeleteIndex('Index1');

  // Lista de Rubricas
  chklstRubrica1.Items.Clear;
  chklstRubrica2.Items.Clear;
  chklstRubrica3.Items.Clear;
  chklstRubrica4.Items.Clear;
  chklstRubrica5.Items.Clear;
  dmCds.Cds.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdRubrica.Add(dmCds.Cds.FieldByName('CODPROVDESC').asString);
    chklstRubrica1.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    chklstRubrica2.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    chklstRubrica3.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    chklstRubrica4.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    chklstRubrica5.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    dmCds.Cds.Next;
  end;

  CdsEstab.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));
  CdsResp.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(0, '', '', 'A');

  dDataRef := CtrlGlobalRH.GetNormalIni;
  cmbMes.ItemIndex := FU.ExtraiMes(dDataRef) - 1;
  speAno.Value := FU.ExtraiAno(dDataRef);
  cmbMesDeslig.ItemIndex := cmbMes.ItemIndex - 1;
  speAnoDeslig.Value := speAno.Value;

  dtedDataEmissao.Date := Date;

  dblkcbResp.Text := CdsResp.FieldByName('NOME').asString;
  Paginas.ActivePageIndex := 0;
  IdEstab := -1;

  LeAlteracoes;
  rgRescComplClick(nil);
  cmbMesChange(nil);
  MontaListaFuncionarios;
end;

procedure TfrmParamGRFC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravaAlteracoes;

  FreeAndNil(ListaIdFunc);
  FreeAndNil(ListaIdRubrica);

  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlProvDesc);
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlListTerceirosRH);
  inherited;
end;

procedure TfrmParamGRFC.dblkcbEstabChange(Sender: TObject);
begin
  if (CdsEstab.FieldByName('IDPESSOA').asFloat <> IdEstab) then
  begin
    MontaListaFuncionarios;
    IdEstab := CdsEstab.FieldByName('IDPESSOA').asFloat;
    chklstFunc.Repaint;
  end;
end;

procedure TfrmParamGRFC.dblkcbRespChange(Sender: TObject);
begin
  dblkcbResp.Text := Trim(dblkcbResp.Text);
  HabilitaBtOk;
end;

procedure TfrmParamGRFC.PaginasChange(Sender: TObject);
begin
  edCodRubricas.Text := sListaIdRubricaSel[Paginas.ActivePageIndex+1];
end;

procedure TfrmParamGRFC.cmbMesChange(Sender: TObject);
begin
  MontaListaFuncionarios;
end;

procedure TfrmParamGRFC.dtedDataDisAcordoChange(Sender: TObject);
begin
  try
    StrToDate(dtedDataDisAcordo.Text);
    HabilitaBtOk;
  except
  end;
end;

procedure TfrmParamGRFC.chklstFuncClickCheck(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
end;

procedure TfrmParamGRFC.chklstRubrica1ClickCheck(Sender: TObject);
begin
  FU.CriaListaOpcoes(TColorCheckListBox(Self.FindComponent('chklstRubrica'+
    IntToStr(Paginas.ActivePageIndex+1))), ListaIdRubrica,
    sListaIdRubricaSel[Paginas.ActivePageIndex+1], ',', false);

  edCodRubricas.Text := sListaIdRubricaSel[Paginas.ActivePageIndex+1];

  HabilitaBtOk;
end;

procedure TfrmParamGRFC.sbtnMarcarRubClick(Sender: TObject);
begin
  edCodRubricas.Text := Trim(edCodRubricas.Text);

  FU.VerificaOpcoes(TColorCheckListBox(Self.FindComponent('chklstRubrica'+
    IntToStr(Paginas.ActivePageIndex+1))),
    ListaIdRubrica, edCodRubricas.Text, ',');

  sListaIdRubricaSel[Paginas.ActivePageIndex+1] := edCodRubricas.Text;
  TColorCheckListBox(Self.FindComponent('chklstRubrica'+
    IntToStr(Paginas.ActivePageIndex+1))).Repaint;

  HabilitaBtOk;
end;

procedure TfrmParamGRFC.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := true;
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamGRFC.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamGRFC.rgRescComplClick(Sender: TObject);
begin
  pnlRescCompl.Visible := rgRescCompl.Checked;
  MontaListaFuncionarios;
end;

procedure TfrmParamGRFC.rbRecDisAcordoClick(Sender: TObject);
begin
  dtedDataDisAcordo.Visible := rbRecDisAcordo.Checked;
  HabilitaBtOk;
end;

procedure TfrmParamGRFC.bbtnConfirmarClick(Sender: TObject);
var
  c: integer;
  sListaIdFuncSel: string;
begin
  // Rubricas selecionadas
  for c:=1 to 5 do
    FU.CriaListaOpcoes(TColorCheckListBox(Self.FindComponent('chklstRubrica'+IntToStr(c))),
      ListaIdRubrica, sListaIdRubricaSel[c], ',', true);

  // Empregados selecionados
  FU.CriaListaOpcoes(chklstFunc, ListaIdFunc, sListaIdFuncSel, ',', false);

  Cmp_Padrao.ParamByName('IdEstab').asFloat := CdsEstab.FieldByName('IDPESSOA').asFloat;
  Cmp_Padrao.ParamByName('MesRef').asInteger := cmbMes.ItemIndex+1;
  Cmp_Padrao.ParamByName('AnoRef').asInteger := speAno.Value;
  Cmp_Padrao.ParamByName('DataEmissao').asDateTime := dtedDataEmissao.Date;
  Cmp_Padrao.ParamByName('ListaIdFunc').asString := sListaIdFuncSel;
  Cmp_Padrao.ParamByName('NomeResponsavel').asString := CdsResp.FieldByName('NOME').asString;
  Cmp_Padrao.ParamByName('FGTSRecolhidoMesAnt').asBoolean := (rgFGTSAnt.ItemIndex = 0);
  Cmp_Padrao.ParamByName('ReferenteDissidio').asBoolean := rbRecDisAcordo.Checked;
  Cmp_Padrao.ParamByName('DataDissidio').asDateTime := dtedDataDisAcordo.Date;
  Cmp_Padrao.ParamByName('PercentualRec').asFloat := redPerc.Value;
  Cmp_Padrao.ParamByName('IndiceRecAtrasoRecolh1').asFloat := redIndiceRecAtrasoRecolh1.Value;
  Cmp_Padrao.ParamByName('IndiceRecAtrasoRecolh2').asFloat := redIndiceRecAtrasoRecolh2.Value;
  Cmp_Padrao.ParamByName('IndiceRecAtrasoMultaRes').asFloat := redIndiceRecAtrasoMultaRes.Value;

  for c:=1 to 5 do
    Cmp_Padrao.ParamByName('ListaIdRubrica'+IntToStr(c)).asString := sListaIdRubricaSel[c];

  if (rgProcesso.ItemIndex = 0) then
    Cmp_Padrao.ParamByName('NomeTabela').asString := 'PREVIAFOLPAG'
  else
    Cmp_Padrao.ParamByName('NomeTabela').asString := 'HISTRUBSAL';

  frmAguarde.Mostra('Impresso GRFC');
  frmAguarde.Pos := 0;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmParamGRFC.MontaListaFuncionarios;
var
  sAnoMesRef: string;
begin
  ListaIdFunc.Clear;
  chklstFunc.Items.BeginUpdate;
  chklstFunc.Items.Clear;

  if (Trim(dblkcbEstab.Text) <> '') then
  begin
    if not(rgRescCompl.Checked) then
      sAnoMesRef := speAno.Text +'/'+ FU.PoeZero(cmbMes.ItemIndex+1)
    else
      sAnoMesRef := speAnoDeslig.Text +'/'+ FU.PoeZero(cmbMesDeslig.ItemIndex+1);

    dmCds.Cds.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(Sistema.IdEmpresa,
      '', CdsEstab.FieldByName('IDPESSOA').asString, 'D', '', '', '', '', sAnoMesRef,
      '', false, 0, 0, -1, -1, 'I1,I2,I3,I4,L,S');

    while not(dmCds.Cds.EOF) do
    begin
      ListaIdFunc.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
      chklstFunc.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
      chklstFunc.Checked[chklstFunc.Items.Count-1] := true;
      dmCds.Cds.Next;
    end;
  end;
  HabilitaBtOk;
  chklstFunc.Items.EndUpdate;
end;

procedure TfrmParamGRFC.HabilitaBtOk;
var
  c, I: integer;
  bSelFunc: boolean;
  bSelRub: array[1..4] of boolean;
begin
  // Verifica se algum Funcionário foi selecionado
  bSelFunc := false;
  for c:=0 to chklstFunc.Items.Count-1 do
    if (chklstFunc.Checked[c]) then
    begin
      bSelFunc := true;
      break;
    end;

  for I:=1 to 4 do
  begin
    bSelRub[I] := false;
    for c:=0 to TColorCheckListBox(Self.FindComponent('chklstRubrica'+IntToStr(I))).Items.Count-1 do
      if (TColorCheckListBox(Self.FindComponent('chklstRubrica'+IntToStr(I))).Checked[c]) then
      begin
        bSelRub[I] := true;
        break;
      end;
  end;

  bbtnConfirmar.Enabled := (bSelFunc) and (bSelRub[2]) and (bSelRub[3]) and (bSelRub[4]) and
    ((rgFGTSAnt.ItemIndex = 0) or ((rgFGTSAnt.ItemIndex = 1) and (bSelRub[1]))) and
    (dblkcbEstab.Text <> '') and (dblkcbResp.Text <> '') and (((rbRecDisAcordo.Checked) and
    (dtedDataDisAcordo.Text <> '')) or not(rbRecDisAcordo.Checked));
end;

procedure TfrmParamGRFC.LeAlteracoes;
var
  sEstab: string;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+ '\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  sEstab := ArqConfig.ReadString('REL_GRFC', 'Estabelec', '');
  sListaIdRubricaSel[1] := ArqConfig.ReadString('REL_GRFC', 'Rubricas1', '');
  sListaIdRubricaSel[2] := ArqConfig.ReadString('REL_GRFC', 'Rubricas2', '');
  sListaIdRubricaSel[3] := ArqConfig.ReadString('REL_GRFC', 'Rubricas3', '');
  sListaIdRubricaSel[4] := ArqConfig.ReadString('REL_GRFC', 'Rubricas4', '');
  sListaIdRubricaSel[5] := ArqConfig.ReadString('REL_GRFC', 'Rubricas5', '');
  redPerc.Value := StrToFloat(ArqConfig.ReadString('REL_GRFC', 'Percentual',
    '8'+DecimalSeparator+'5'));

  FU.VerificaOpcoes(chklstRubrica1, ListaIdRubrica, sListaIdRubricaSel[1], ',');
  FU.VerificaOpcoes(chklstRubrica2, ListaIdRubrica, sListaIdRubricaSel[2], ',');
  FU.VerificaOpcoes(chklstRubrica3, ListaIdRubrica, sListaIdRubricaSel[3], ',');
  FU.VerificaOpcoes(chklstRubrica4, ListaIdRubrica, sListaIdRubricaSel[4], ',');
  FU.VerificaOpcoes(chklstRubrica5, ListaIdRubrica, sListaIdRubricaSel[5], ',');

  if (sEstab = '') then
  begin
    CdsEstab.First;
    sEstab := CdsEstab.FieldByName('IDPESSOA').asString;
  end;
  dblkcbEstab.LookUpValue := sEstab;
  dblkcbEstab.UpDate;

  edCodRubricas.Text := sListaIdRubricaSel[1];

  HabilitaBtOk;
end;

procedure TfrmParamGRFC.GravaAlteracoes;
var
  sGravaPadrao: string;
begin
  // Grava as últimas alterações da Opção de Rubricas para ...

  // Remuneração sem 13º
  FU.CriaListaOpcoes(chklstRubrica1, ListaIdRubrica, sGravaPadrao, ',', false);
  ArqConfig.WriteString('REL_GRFC', 'Rubricas1', sGravaPadrao);

  // Remuneração somente parcela de 13º
  FU.CriaListaOpcoes(chklstRubrica2, ListaIdRubrica, sGravaPadrao, ',', false);
  ArqConfig.WriteString('REL_GRFC', 'Rubricas2', sGravaPadrao);

  // Verbas Indenizatórias (34)
  FU.CriaListaOpcoes(chklstRubrica3, ListaIdRubrica, sGravaPadrao, ',', false);
  ArqConfig.WriteString('REL_GRFC', 'Rubricas3', sGravaPadrao);

  // Verbas Indenizatórias (35)
  FU.CriaListaOpcoes(chklstRubrica4, ListaIdRubrica, sGravaPadrao, ',', false);
  ArqConfig.WriteString('REL_GRFC', 'Rubricas4', sGravaPadrao);

  // Adiantamentos 13º
  FU.CriaListaOpcoes(chklstRubrica5, ListaIdRubrica, sGravaPadrao, ',', false);
  ArqConfig.WriteString('REL_GRFC', 'Rubricas5', sGravaPadrao);

  ArqConfig.WriteString('REL_GRFC', 'Estabelec', CdsEstab.FieldByName('IDPESSOA').asString);
  ArqConfig.WriteString('REL_GRFC', 'Percentual', FloatToStr(redPerc.Value));
end;

end.
