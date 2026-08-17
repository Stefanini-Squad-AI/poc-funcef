unit fParamRequi;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls,
  fParamReports_Padrao, CheckLst, CmParamReport, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, wwdbdatetimepicker, CMDateTimePicker, wwdblook, uCmSqlParams, Db,
  DBClient, uCMClientDataSet, ColorCheckListBox, uCtrlPessoaFilialPessoa, uCtrlCargo;

type
  TfrmParamRequi = class(TfrmParamReports_Padrao)
    gbxEstab: TGroupBox;
    chklstEstab: TColorCheckListBox;
    gbxCargos: TGroupBox;
    chklstCargo: TColorCheckListBox;
    gbxSituacao: TGroupBox;
    cbxAbert: TCheckBox;
    cbxEncer: TCheckBox;
    cbxCanc: TCheckBox;
    rgListaCand: TRadioGroup;
    gbxSeqRel: TGroupBox;
    cmbSeqRel: TComboBox;
    gbxFaixaData: TGroupBox;
    Label9: TLabel;
    EdData1: TCMDateTimePicker;
    EdData2: TCMDateTimePicker;
    gbxCCusto: TGroupBox;
    CdsCCusto: TCMClientDataSet;
    sqlCCusto: TCMSqlParams;
    dblckCCusto: TwwDBLookupCombo;
    bbtnSelTodosCargo: TBitBtn;
    bbtnInverteSelCargo: TBitBtn;
    bbtnSelTodosEstab: TBitBtn;
    bbtnInverteSelEstab: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblckCCustoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSelTodosCargoClick(Sender: TObject);
    procedure bbtnInverteSelCargoClick(Sender: TObject);
    procedure bbtnSelTodosEstabClick(Sender: TObject);
    procedure bbtnInverteSelEstabClick(Sender: TObject);
  private
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlCargo: TCtrlCargo;

    ListaIdEstab, ListaIdCargo: TStringList;
  end;

var
  frmParamRequi: TfrmParamRequi;

implementation

uses uSistema, dCds, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmParamRequi.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlCargo := TCtrlCargo.Create;
  CtrlCargo.InitializeAs(Padroes);

  ListaIdCargo := TStringList.Create;
  ListaIdEstab := TStringList.Create;

  // Máscara C.Custo
  with (sqlCCusto.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  ''**********'' AS NOME, ''**********'' AS CODCENTROCUSTO, 0 AS TIPO');
    Add('FROM');
    Add('  DUAL');
    Add('UNION');
    Add('SELECT');
    Add('  NOME, CODCENTROCUSTO, 1 AS TIPO');
    Add('FROM');
    Add('  CENTCUST');
    Add('WHERE');

    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      if (Pos(',', CtrlUsoGeralRH.UsuXCCusto) > 0) then
        Add('  (CODCENTROCUSTO IN ' + CtrlUsoGeralRH.UsuXCCusto+ ') AND')
      else
        Add('  (CODCENTROCUSTO  = ' + CtrlUsoGeralRH.UsuXCCusto+ ') AND');

    Add('  (IDEMPRESA = ' +IntToStr(Sistema.IdEmpresa)+ ')');
    Add('ORDER BY 3,1');
  end;
  sqlCCusto.Open;

  dblckCCusto.LookupValue := CdsCCusto.FieldByName('NOME').asString;
  dblckCCusto.Update;

  // Monto a Lista de Estabs
  chklstEstab.Items.Clear;
  dmCds.Cds.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdEstab.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
    chklstEstab.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
    dmCds.Cds.Next;
  end;

  // Monto a Lista de Cargos
  chklstCargo.Items.Clear;
  dmCds.Cds.Data := CtrlCargo.ListCargo;
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdCargo.Add(dmCds.Cds.FieldByName('IDCARGO').asString);
    chklstCargo.Items.Add(dmCds.Cds.FieldByName('TITULO').asString);
    dmCds.Cds.Next;
  end;

  edData1.Date := Date - 365;
  edData2.Date := Date;
  cmbSeqRel.ItemIndex := 0;
end;

procedure TfrmParamRequi.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlCargo);
  FreeAndNil(ListaIdEstab);
  FreeAndNil(ListaIdCargo);
  inherited;
end;

procedure TfrmParamRequi.dblckCCustoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  if (modified) and not(CdsCCusto.IsEmpty) then
    (Sender as TwwDBLookupCombo).Text := CdsCCusto.FieldByName('CODCENTROCUSTO').asString;
end;

procedure TfrmParamRequi.bbtnSelTodosCargoClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstCargo.Items.Count-1 do
    chklstCargo.Checked[c] := true;
  chklstCargo.Repaint;
end;

procedure TfrmParamRequi.bbtnInverteSelCargoClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstCargo.Items.Count-1 do
    chklstCargo.Checked[c] := not(chklstCargo.Checked[c]);
  chklstCargo.Repaint;
end;

procedure TfrmParamRequi.bbtnSelTodosEstabClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := true;
  chklstEstab.Repaint;
end;

procedure TfrmParamRequi.bbtnInverteSelEstabClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := not(chklstEstab.Checked[c]);
  chklstEstab.Repaint;
end;

procedure TfrmParamRequi.bbtnConfirmarClick(Sender: TObject);
var
  sEstab, sCargo: string;
begin
  inherited;
  FU.CriaListaOpcoes(chklstEstab, ListaIdEstab, sEstab, ',', false);
  FU.CriaListaOpcoes(chklstCargo, ListaIdCargo, sCargo, ',', false);

  Cmp_Padrao.ParamByName('ListaEstab').asString := sEstab;
  Cmp_Padrao.ParamByName('ListaCargo').asString := sCargo;
  Cmp_Padrao.ParamByName('ListaCand').asInteger := rgListaCand.ItemIndex;
  Cmp_Padrao.ParamByName('Aber').asBoolean := cbxAbert.Checked;
  Cmp_Padrao.ParamByName('Ence').asBoolean := cbxEncer.Checked;
  Cmp_Padrao.ParamByName('Canc').asBoolean := cbxCanc.Checked;
  Cmp_Padrao.ParamByName('SeqRelat').asInteger := 0;
  Cmp_Padrao.ParamByName('DataIni').asDateTime := EdData1.Date;
  Cmp_Padrao.ParamByName('DataFim').asDateTime := EdData2.Date;
  Cmp_Padrao.ParamByName('Mascara').asString := Trim(dblckCCusto.Text);
end;

end.
