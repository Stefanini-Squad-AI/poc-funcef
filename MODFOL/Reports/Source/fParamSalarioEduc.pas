// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamSalarioEduc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, wwdblook, Spin, checklst,
  IvDictio, IvMulti, IvEMulti, IniFiles, wwdbdatetimepicker, Mask, TREdit, CMDateTimePicker,
  fSairAjuda, DBClient, uCMClientDataSet, fParamReports_Padrao, CmParamReport,
  uCtrlPessoaFilialPessoa, uCtrlGlobalRH, uCtrlMotivo, ColorCheckListBox;

type
  TfrmParamSalarioEduc = class(TfrmParamReports_Padrao)
    CdsEstab: TCMClientDataSet;
    gbxEstabelecimento: TGroupBox;
    gbxAnoMesRef: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    gbxVencimento: TGroupBox;
    dtedVencimento: TCMDateTimePicker;
    rgProcesso: TRadioGroup;
    rgGera13: TRadioGroup;
    gbxNumConvRec: TGroupBox;
    spedNumConvRec: TSpinEdit;
    gbxAgCetraliz: TGroupBox;
    mkedAgCentraliz: TMaskEdit;
    gbxNumConta: TGroupBox;
    mkedNumConta: TMaskEdit;
    gbxPerContrFPAS: TGroupBox;
    redPercContrib: TRealEdit;
    gbxTipoPag: TGroupBox;
    chklstTipoFolha: TColorCheckListBox;
    bbtnSelTodosFunc: TBitBtn;
    bbtnInverteSelFunc: TBitBtn;
    bbtnSelTodosEstab: TBitBtn;
    bbtnInverteSelEstab: TBitBtn;
    chklstEstab: TColorCheckListBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSelTodosFuncClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
    procedure bbtnSelTodosEstabClick(Sender: TObject);
    procedure bbtnInverteSelEstabClick(Sender: TObject);
    procedure chklstEstabClickCheck(Sender: TObject);
  private
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlMotivo: TCtrlMotivo;

    ArqConfig: TIniFile;    
    ListaIdTipoFolha, ListaIdEstab: TStringList;

    sListaIdEstabSel: string;

    procedure HabilitaBtOk;
    procedure LeAlteracoes;
    procedure GravaAlteracoes;
  end;

var
  frmParamSalarioEduc: TfrmParamSalarioEduc;

implementation

uses uSistema, uMensErro, fAguarde, uCtrlPadroes, uCtrlFuncoesRH, dCds, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmParamSalarioEduc.FormCreate(Sender: TObject);
var
  NormalIni: TDate;
  c: byte;
begin
  inherited;
  ListaIdEstab := TStringList.Create;
  ListaIdTipoFolha := TStringList.Create;

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);

  // Montar a Lista de Tipos de Folha
  chklstTipoFolha.Items.Clear;
  dmCds.Cds.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('F,D');
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdTipoFolha.Add(dmCds.Cds.FieldByName('IDMOTIVO').asString);
    chklstTipoFolha.Items.Add(dmCds.Cds.FieldByName('DESCRICAO').asString);
    dmCds.Cds.Next;
  end;

  // Montar a Lista de Estabelecimentos
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

  // Carrega alterações nas opções feitas anteriormente
  LeAlteracoes;
end;

procedure TfrmParamSalarioEduc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlMotivo);
  GravaAlteracoes;
  FreeAndNil(ListaIdTipoFolha);
  FreeAndNil(ListaIdEstab);
  inherited;
end;

procedure TfrmParamSalarioEduc.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoFolha.Items.Count-1 do
    chklstTipoFolha.Checked[c] := true;
  chklstTipoFolha.Repaint;
end;

procedure TfrmParamSalarioEduc.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoFolha.Items.Count-1 do
    chklstTipoFolha.Checked[c] := not(chklstTipoFolha.Checked[c]);
  chklstTipoFolha.Repaint;
end;

procedure TfrmParamSalarioEduc.bbtnSelTodosEstabClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := true;
  chklstEstab.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamSalarioEduc.bbtnInverteSelEstabClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := not(chklstEstab.Checked[c]);
  chklstEstab.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamSalarioEduc.chklstEstabClickCheck(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
end;

procedure TfrmParamSalarioEduc.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
  sCodTipoFolhaSel: string;
begin
  // Tipos de Folha selecionados
  wNum := FU.CriaListaOpcoes(chklstTipoFolha, ListaIdTipoFolha, sCodTipoFolhaSel, ',', false);
  if (wNum = ListaIdTipoFolha.Count) then
    sCodTipoFolhaSel := '';

  Cmp_Padrao.ParamByName('ListaIdEstab').asString := sListaIdEstabSel;
  Cmp_Padrao.ParamByName('MesRef').asInteger := cmbMes.ItemIndex+1;
  Cmp_Padrao.ParamByName('AnoRef').asInteger := speAno.Value;
  Cmp_Padrao.ParamByName('ListaTipoFolha').asString := sCodTipoFolhaSel;
  Cmp_Padrao.ParamByName('NumConvRec').asString := spedNumConvRec.Text;
  Cmp_Padrao.ParamByName('DataVencimento').asDateTime := dtedVencimento.Date;
  Cmp_Padrao.ParamByName('AgenciaCentralizadora').asString := mkedAgCentraliz.Text;
  Cmp_Padrao.ParamByName('NumeroConta').asString := mkedNumConta.Text;
  Cmp_Padrao.ParamByName('Competencia13').asBoolean := (rgGera13.ItemIndex = 0);
  Cmp_Padrao.ParamByName('PercentualContribFPAS').asFloat := redPercContrib.Value;

  if (rgProcesso.ItemIndex = 0) then
    Cmp_Padrao.ParamByName('NomeTabela').asString := 'PREVIAFOLPAG'
  else
    Cmp_Padrao.ParamByName('NomeTabela').asString := 'HISTRUBSAL';

  frmAguarde.Mostra('Salário Educação');
  frmAguarde.Pos := 0;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmParamSalarioEduc.HabilitaBtOk;
begin
  // Estabelecimentos selecionados
  FU.CriaListaOpcoes(chklstEstab, ListaIdEstab, sListaIdEstabSel, ',', false);

  bbtnConfirmar.Enabled := (sListaIdEstabSel <> '') and (Trim(speAno.Text) <> '') and
    (Trim(mkedAgCentraliz.Text) <> '') and (Trim(mkedNumConta.Text) <> '') and
    (Trim(spedNumConvRec.Text) <> '');
end;

procedure TfrmParamSalarioEduc.LeAlteracoes;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  mkedAgCentraliz.Text := ArqConfig.ReadString('SALARIO_EDUC', 'AgCentraliz', '');
  mkedNumConta.Text := ArqConfig.ReadString('SALARIO_EDUC', 'NumConta', '');
  spedNumConvRec.Text  := ArqConfig.ReadString('SALARIO_EDUC', 'NumConvRec', '');

  HabilitaBtOk;
end;

procedure TfrmParamSalarioEduc.GravaAlteracoes;
begin
  ArqConfig.WriteString('SALARIO_EDUC', 'AgCentraliz', mkedAgCentraliz.Text);
  ArqConfig.WriteString('SALARIO_EDUC', 'NumConta', mkedNumConta.Text);
  ArqConfig.WriteString('SALARIO_EDUC', 'NumConvRec', spedNumConvRec.Text);
end;

end.
