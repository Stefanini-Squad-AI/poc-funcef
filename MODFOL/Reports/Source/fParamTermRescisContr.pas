unit fParamTermRescisContr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, wwdblook, Spin, checklst, IvDictio, IvMulti,
  IvEMulti, wwdbdatetimepicker, CMDateTimePicker, fParamReports_Padrao, CmParamReport,
  DBClient, uCMClientDataSet, uCtrlPessoaFilialPessoa, uCtrlPessoaFuncionario, uCtrlGlobalRH,
  uCtrlMotivo, uCtrlListTerceirosRH;

type
  TfrmParamTermRescisContr = class(TfrmParamReports_Padrao)
    gbxEstab: TGroupBox;
    dblkcbEstab: TwwDBLookupCombo;
    gbxAnoMesRef: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    gbxResp: TGroupBox;
    dblkcbResp: TwwDBLookupCombo;
    gbxFunc: TGroupBox;
    chklstFunc: TCheckListBox;
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
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure rgMotivoClick(Sender: TObject);
    procedure chklstFuncDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
    procedure dblkcbRespChange(Sender: TObject);
    procedure bbtnSelTodosFuncClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
    procedure cmbMesChange(Sender: TObject);
    procedure chklstFuncClickCheck(Sender: TObject);
    procedure dtedIniChange(Sender: TObject);
    procedure chklstFuncKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
  frmParamTermRescisContr: TfrmParamTermRescisContr;

implementation

uses uSistema, uMensErro, fAguarde, uFuncoesUteisRH, dBaseDados;

{$R *.DFM}

procedure TfrmParamTermRescisContr.FormCreate(Sender: TObject);
var
  NormalIni: TDate;
begin
  inherited;
  ListaIdFunc := TStringList.Create;

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create;
  CtrlPessoaFilialPessoa.Initialize(dtmBaseDados.dbBaseDados, true);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create;
  CtrlPessoaFuncionario.Initialize(dtmBaseDados.dbBaseDados, true);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.Initialize(dtmBaseDados.dbBaseDados, true);

  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.Initialize(dtmBaseDados.dbBaseDados, true);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create;
  CtrlListTerceirosRH.Initialize(dtmBaseDados.dbBaseDados, true);

  CdsEstab.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(Sistema.IdEmpresa);

  NormalIni := CtrlGlobalRH.GetNormalIni;
  cmbMes.ItemIndex := ExtraiMes(NormalIni) - 1;
  speAno.Value := ExtraiAno(NormalIni);
  dtedIni.Date := NormalIni;
  dtedFin.Date := CtrlGlobalRH.GetNormalFim;
  IdEstab := -1;

  HabilitaBtOk;
end;

procedure TfrmParamTermRescisContr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(ListaIdFunc);
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlMotivo);
  FreeAndNil(CtrlListTerceirosRH);
  inherited;
end;

procedure TfrmParamTermRescisContr.chklstFuncDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  with (TCheckListBox(Control).Canvas) do
  begin
    if (TCheckListBox(Control).Checked[Index]) then
      if (odSelected in State) then
      begin
        Brush.Color := clTeal;
        Font.Color := clWhite;
      end
      else
      begin
        Brush.Color := CL_AMARELO_CLARO;
        Font.Color := clBlack;
      end;

    FillRect(Rect);
    TextOut(Rect.Left, Rect.Top, TCheckListBox(Control).Items[Index]);
  end;
end;

procedure TfrmParamTermRescisContr.dblkcbEstabChange(Sender: TObject);
begin
  if (CdsEstab.FieldByName('IDPESSOA').asFloat <> IdEstab) then
  begin
    MontaListaFuncionarios;
    IdEstab := CdsEstab.FieldByName('IDPESSOA').asFloat;
    chklstFunc.Repaint;
  end;
end;

procedure TfrmParamTermRescisContr.cmbMesChange(Sender: TObject);
begin
  MontaListaFuncionarios;
end;

procedure TfrmParamTermRescisContr.dtedIniChange(Sender: TObject);
begin
  try
    StrToDate(TEdit(Sender).Text);
    MontaListaFuncionarios;
  except
  end;
end;

procedure TfrmParamTermRescisContr.dblkcbRespChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamTermRescisContr.chklstFuncKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    chklstFuncClickCheck(Sender);
end;

procedure TfrmParamTermRescisContr.chklstFuncClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
  HabilitaBtOk;
end;

procedure TfrmParamTermRescisContr.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := true;
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamTermRescisContr.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamTermRescisContr.rgMotivoClick(Sender: TObject);
begin
  gbxFolhaResc.Visible := (rgMotivo.ItemIndex = 2);
  if (rgMotivo.ItemIndex = 2) and not(CdsMotivo.Active) then
    CdsMotivo.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('F');
end;

procedure TfrmParamTermRescisContr.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;  
  sListaIdFuncSel: string;
begin
  // Funcionário selecionados
  wNum := CriaListaOpcoes(chklstFunc, ListaIdFunc, sListaIdFuncSel, ',', false);
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
procedure TfrmParamTermRescisContr.MontaListaFuncionarios;
begin
  if (Trim(dblkcbEstab.Text) <> '') then
  begin
    ListaIdFunc.Clear;
    chklstFunc.Items.Clear;

    dtmBaseDados.Cds.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(Sistema.IdEmpresa,
      '', CdsEstab.FieldByName('IDPESSOA').asString, 'D', '', '', '', '', '', '', false, 0,
      0, -1, -1, '', 0, 0, dtedIni.Date, dtedFin.Date);

    while not(dtmBaseDados.Cds.EOF) do
    begin
      ListaIdFunc.Add(dtmBaseDados.Cds.FieldByName('IDPESSOA').asString);
      chklstFunc.Items.Add(dtmBaseDados.Cds.FieldByName('NOME').asString);
      dtmBaseDados.Cds.Next;
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

procedure TfrmParamTermRescisContr.HabilitaBtOk;
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
