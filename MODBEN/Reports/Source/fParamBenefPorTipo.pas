unit fParamBenefPorTipo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker, CheckLst, Db, DBTables, Wwdatsrc, Spin,
  fParamReports_Padrao, CmParamReport, ColorCheckListBox, uCtrlProvDesc;

type
  TfrmParamBenefPorTipo = class(TfrmParamReports_Padrao)
    gbxData: TGroupBox;
    gbxBenef: TGroupBox;
    chklstBenef: TColorCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chklstBenefClickCheck(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure speAnoChange(Sender: TObject);
  private
    CtrlProvDesc: TCtrlProvDesc;

    ListaCodBenef: TStringList;

    procedure HabilitaBtOk;
  end;

var
  frmParamBenefPorTipo: TfrmParamBenefPorTipo;

implementation

uses uSistema, uCtrlFuncoesRH, uCtrlPadroes, fAguarde, dCds;

{$R *.DFM}

procedure TfrmParamBenefPorTipo.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

  ListaCodBenef := TStringList.Create;

  // Crio a lista de Rubricas a selecionar
  dmCds.Cds.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa), -1,
    '  PD.IDPROVENTO, RP.DESCRPROVDESC', 1);

  while not(dmCds.Cds.EOF) do
  begin
    ListaCodBenef.Add(dmCds.Cds.FieldByName('IDPROVENTO').asString);
    chklstBenef.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    dmCds.Cds.Next;
  end;

  cmbMes.ItemIndex := FU.ExtraiMes(Date) - 1;
  speAno.Value := FU.ExtraiAno(Date);
end;

procedure TfrmParamBenefPorTipo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlProvDesc);
  FreeAndNil(ListaCodBenef);
  inherited;
end;

procedure TfrmParamBenefPorTipo.speAnoChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamBenefPorTipo.chklstBenefClickCheck(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
end;

procedure TfrmParamBenefPorTipo.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstBenef.Items.Count-1 do
    chklstBenef.Checked[c] := true;
  chklstBenef.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamBenefPorTipo.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstBenef.Items.Count-1 do
    chklstBenef.Checked[c] := not(chklstBenef.Checked[c]);
  chklstBenef.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamBenefPorTipo.bbtnConfirmarClick(Sender: TObject);
var
  sListaIdRubrica: string;
begin
  FU.CriaListaOpcoes(chklstBenef, ListaCodBenef, sListaIdRubrica, ',', false);

  Cmp_Padrao.ParamByName('ListaIdRubrica').asString := sListaIdRubrica;
  Cmp_Padrao.ParamByName('MesRef').asString := IntToStr(speAno.Value) +'/'+
    FU.PoeZero(cmbMes.ItemIndex+1);

  frmAguarde.Mostra('Benefícios por Tipo');
  frmAguarde.Pos := 0;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmParamBenefPorTipo.HabilitaBtOk;
var
  c: integer;
  bAchou: boolean;
begin
  bAchou := false;
  for c:=0 to chklstBenef.Items.Count-1 do
    if (chklstBenef.Checked[c]) then
      bAchou := true;

  bbtnConfirmar.Enabled := (speAno.Value > 0) and (bAchou);
end;

end.
