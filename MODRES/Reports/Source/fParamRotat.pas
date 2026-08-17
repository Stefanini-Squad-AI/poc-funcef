unit fParamRotat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, CmParamReport,
  fParamReports_Padrao, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  TB97, ExtCtrls, Spin, CheckLst, wwdblook, uCmSqlParams, Db, DBClient, uCMClientDataSet,
  ColorCheckListBox, uCtrlPessoaFilialPessoa;

type
  TfrmParamRotat = class(TfrmParamReports_Padrao)
    CdsCCusto: TCMClientDataSet;
    sqlCCusto: TCMSqlParams;
    gbxFaixaData: TGroupBox;
    spedAno1: TSpinEdit;
    gbxCCusto: TGroupBox;
    gbxEstab: TGroupBox;
    chklstEstab: TColorCheckListBox;
    gbxTipContra: TGroupBox;
    cbxEfetivos: TCheckBox;
    cbxTemporarios: TCheckBox;
    cbxEstagiarios: TCheckBox;
    cbxTerceiros: TCheckBox;
    cbxAutonomos: TCheckBox;
    cbxProprietarios: TCheckBox;
    cbxEspeciais: TCheckBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    dblckCCusto: TwwDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblckCCustoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
  private
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;

    ListaIdEstab: TStringList;
  end;

var
  frmParamRotat: TfrmParamRotat;

implementation

uses uSistema, uCtrlPadroes, dCds, uCtrlFuncoesRH, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmParamRotat.FormCreate(Sender: TObject);
var
  Ano, Mes, Dia: word;
begin
  inherited;
  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

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

  // Monto a Lista de Estabelecimentos
  chklstEstab.Items.Clear;
  dmCds.Cds.Data := CtrlPessoaFilialPessoa.ListPessoaEstab('');
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdEstab.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
    chklstEstab.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
    dmCds.Cds.Next;
  end;

  DecodeDate(Date, Ano, Mes, Dia);
  spedAno1.Value := Ano - 1;
  spedAno1.MaxValue := Ano;
end;

procedure TfrmParamRotat.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(ListaIdEstab);
  inherited;
end;

procedure TfrmParamRotat.dblckCCustoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  if (modified) and not(CdsCCusto.IsEmpty) then
    (Sender as TwwDBLookupCombo).Text := CdsCCusto.FieldByName('CODCENTROCUSTO').asString;
end;

procedure TfrmParamRotat.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := true;
  chklstEstab.Repaint;
end;

procedure TfrmParamRotat.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := not(chklstEstab.Checked[c]);
  chklstEstab.Repaint;
end;

procedure TfrmParamRotat.bbtnConfirmarClick(Sender: TObject);
var
  sListaIdEstabSel, sNomeCC: string;
begin
  inherited;
  FU.CriaListaOpcoes(chklstEstab, ListaIdEstab, sListaIdEstabSel, ',', false);

  sNomeCC := '';
  if (Pos(Trim(dblckCCusto.Text),'*') = 0) then
    sNomeCC := CdsCCusto.FieldByName('NOME').asString;

  Cmp_Padrao.ParamByName('ListaEstab').asString := sListaIdEstabSel;
  Cmp_Padrao.ParamByName('Ano').asInteger := spedAno1.Value;
  Cmp_Padrao.ParamByName('Efet').asBoolean := cbxEfetivos.Checked;
  Cmp_Padrao.ParamByName('Efes').asBoolean := cbxEspeciais.Checked;
  Cmp_Padrao.ParamByName('Temp').asBoolean := cbxTemporarios.Checked;
  Cmp_Padrao.ParamByName('Estg').asBoolean := cbxEstagiarios.Checked;
  Cmp_Padrao.ParamByName('Terc').asBoolean := cbxTerceiros.Checked;
  Cmp_Padrao.ParamByName('Prop').asBoolean := cbxProprietarios.Checked;
  Cmp_Padrao.ParamByName('Auto').asBoolean := cbxAutonomos.Checked;
  Cmp_Padrao.ParamByName('Mascara').asString := Trim(dblckCCusto.Text);
  Cmp_Padrao.ParamByName('NomeCC').asString := sNomeCC;
end;

end.
