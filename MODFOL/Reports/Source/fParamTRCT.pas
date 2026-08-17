unit fParamTRCT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, wwdblook, Spin, checklst, IvDictio, IvMulti,
  IvEMulti, wwdbdatetimepicker, CMDateTimePicker, fParamReports_Padrao, CmParamReport,
  DBClient, uCMClientDataSet, uCtrlPessoaFilialPessoa, uCtrlPessoaFuncionario, uCtrlGlobalRH,
  uCtrlMotivo, uCtrlListTerceirosRH, ColorCheckListBox;

type
  TfrmParamTRCT = class(TfrmParamReports_Padrao)
    gbxEstab: TGroupBox;
    dblkcbEstab: TwwDBLookupCombo;
    gbxAnoMesRef: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    gbxResp: TGroupBox;
    dblkcbResp: TwwDBLookupCombo;
    gbxFunc: TGroupBox;
    chklstFunc: TColorCheckListBox;
    bbtnSelTodosFunc: TBitBtn;
    bbtnInverteSelFunc: TBitBtn;
    gbxIntervRef: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtedIni: TCMDateTimePicker;
    dtedFin: TCMDateTimePicker;
    rgProcesso: TRadioGroup;
    rgExibeCCusto: TRadioGroup;
    rgMotivo: TRadioGroup;
    gbxFolhaResc: TGroupBox;
    dblcMotivo: TwwDBLookupCombo;
    CdsEstab: TCMClientDataSet;
    CdsMotivo: TCMClientDataSet;
    CdsResp: TCMClientDataSet;
    rgTotais: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure rgMotivoClick(Sender: TObject);
    procedure dblkcbRespChange(Sender: TObject);
    procedure bbtnSelTodosFuncClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
    procedure cmbMesChange(Sender: TObject);
    procedure chklstFuncClickCheck(Sender: TObject);
    procedure dtedIniChange(Sender: TObject);
  private
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlMotivo: TCtrlMotivo;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;

    ListaIdFunc: TStringList;

    IdEstab: double;

    procedure MontaListaFuncionarios;
    procedure HabilitaBtOk;
  end;

var
  frmParamTRCT: TfrmParamTRCT;

implementation

uses uSistema, uMensErro, fAguarde, uCtrlPadroes, uCtrlFuncoesRH, dCds, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmParamTRCT.FormCreate(Sender: TObject);
var
  NormalIni: TDate;
begin
  inherited;
  ListaIdFunc := TStringList.Create;

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CdsEstab.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));

  dmCds.Cds.Data := CtrlGlobalRH.GetParamRH('NORMALINI, NORMALFIM, IDMOTIVORESCISAO');
  NormalIni := dmCds.Cds.FieldByName('NORMALINI').asDateTime;
  cmbMes.ItemIndex := FU.ExtraiMes(NormalIni) - 1;
  speAno.Value := FU.ExtraiAno(NormalIni);
  dtedIni.Date := NormalIni;
  dtedFin.Date := dmCds.Cds.FieldByName('NORMALFIM').asDateTime;
  IdEstab := -1;

  rgMotivoClick(Self);
  dblcMotivo.LookupValue := dmCds.Cds.FieldByName('IDMOTIVORESCISAO').asString;
  dblcMotivo.Update;

  HabilitaBtOk;
end;

procedure TfrmParamTRCT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(ListaIdFunc);
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlMotivo);
  FreeAndNil(CtrlListTerceirosRH);
  inherited;
end;

procedure TfrmParamTRCT.dblkcbEstabChange(Sender: TObject);
begin
  if (CdsEstab.FieldByName('IDPESSOA').asFloat <> IdEstab) then
  begin
    MontaListaFuncionarios;
    IdEstab := CdsEstab.FieldByName('IDPESSOA').asFloat;
    chklstFunc.Repaint;
  end;
end;

procedure TfrmParamTRCT.cmbMesChange(Sender: TObject);
begin
  MontaListaFuncionarios;
end;

procedure TfrmParamTRCT.dtedIniChange(Sender: TObject);
begin
  try
    StrToDate(TEdit(Sender).Text);
    MontaListaFuncionarios;
  except
  end;
end;

procedure TfrmParamTRCT.dblkcbRespChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamTRCT.chklstFuncClickCheck(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
end;

procedure TfrmParamTRCT.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := true;
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamTRCT.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamTRCT.rgMotivoClick(Sender: TObject);
begin
  gbxFolhaResc.Visible := (rgMotivo.ItemIndex = 2);
  if (rgMotivo.ItemIndex = 2) and not(CdsMotivo.Active) then
    CdsMotivo.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('F');
end;

procedure TfrmParamTRCT.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;  
  sListaIdFuncSel: string;
begin
  // Funcionário selecionados
  wNum := FU.CriaListaOpcoes(chklstFunc, ListaIdFunc, sListaIdFuncSel, ',', false);
  if (wNum > 255) and (wNum = ListaIdFunc.Count) then
    sListaIdFuncSel := '';

  Cmp_Padrao.ParamByName('IdEmpresa').asInteger := Sistema.IdEmpresa;
  Cmp_Padrao.ParamByName('IdEstab').asFloat := CdsEstab.FieldByName('IDPESSOA').asFloat;
  Cmp_Padrao.ParamByName('MesRef').asInteger := cmbMes.ItemIndex+1;
  Cmp_Padrao.ParamByName('AnoRef').asInteger := speAno.Value;
  Cmp_Padrao.ParamByName('ListaIdFunc').asString := sListaIdFuncSel;
  Cmp_Padrao.ParamByName('ExibeCCusto').asBoolean := (rgExibeCCusto.ItemIndex = 0);
  Cmp_Padrao.ParamByName('IdResponsavel').asFloat := CdsResp.FieldByName('IDCONTATO').asFloat;
  Cmp_Padrao.ParamByName('TipoRescisao').asInteger := rgMotivo.ItemIndex;
  Cmp_Padrao.ParamByName('TotaisTodasFolhas').asBoolean := (rgTotais.ItemIndex = 0);

  if not(CdsMotivo.IsEmpty) then
    Cmp_Padrao.ParamByName('IdTipoFolha').asFloat := CdsMotivo.FieldByName('IDMOTIVO').asFloat;

  if (rgProcesso.ItemIndex = 0) then
    Cmp_Padrao.ParamByName('NomeTabela').asString := 'PREVIAFOLPAG'
  else
    Cmp_Padrao.ParamByName('NomeTabela').asString := 'HISTRUBSAL';
  
  frmAguarde.Mostra('Termo de Rescisão Contratual');
  frmAguarde.Pos := 0;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmParamTRCT.MontaListaFuncionarios;
begin
  if (Trim(dblkcbEstab.Text) <> '') then
  begin
    ListaIdFunc.Clear;
    chklstFunc.Items.Clear;

    dmCds.Cds.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(Sistema.IdEmpresa,
      '', CdsEstab.FieldByName('IDPESSOA').asString, 'D', '', '', '', '', '', '', false, 0,
      0, -1, -1, '', 0, 0, dtedIni.Date, dtedFin.Date);

    while not(dmCds.Cds.EOF) do
    begin
      ListaIdFunc.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
      chklstFunc.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
      dmCds.Cds.Next;
    end;
    bbtnSelTodosFuncClick(Self);

    if (CdsEstab.FieldByName('IDPESSOA').asFloat <> IdEstab) then
    begin
      CdsResp.Data := CtrlListTerceirosRH.ListContatoPessoaJuridica(
        CdsEstab.FieldByName('IDPESSOA').asFloat);
      dblkcbResp.Enabled := not(CdsResp.IsEmpty);
    end;
  end;
  HabilitaBtOk;
end;

procedure TfrmParamTRCT.HabilitaBtOk;
var
  c: integer;
  bSelFunc: boolean;
begin
  // Verifica se algum Funcionário foi selecionado
  bSelFunc := false;
  for c:=0 to chklstFunc.Items.Count-1 do
    if (chklstFunc.Checked[c]) then
    begin
      bSelFunc := true;
      break;
    end;

  bbtnConfirmar.Enabled := (bSelFunc) and (Trim(speAno.Text) <> '') and
    (Trim(dblkcbResp.Text) <> '') and (Trim(speAno.Text) <> '') and
    (Trim(dblkcbResp.Text) <> '') and (dtedIni.Date <= dtedFin.Date);
end;

end.
