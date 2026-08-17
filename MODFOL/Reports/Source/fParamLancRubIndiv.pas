unit fParamLancRubIndiv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, wwdblook, Spin, checklst, IvDictio, IvMulti,
  IvEMulti, fParamReports_Padrao, CmParamReport, uCMClientDataSet, DBClient, uCtrlGlobalRH,
  uCtrlProvDesc, uCtrlPessoaFilialPessoa, ColorCheckListBox;

type
  TfrmParamLancRubIndiv = class(TfrmParamReports_Padrao)
    gbxEstab: TGroupBox;
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    gbxRubricas: TGroupBox;
    chklstRubrica: TColorCheckListBox;
    gbxMesInicio: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    rgPermanente: TRadioGroup;
    cbxSelec: TCheckBox;
    Label1: TLabel;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    bbtnSelTodas: TBitBtn;
    bbtnInverteSel: TBitBtn;
    CdsEstab: TCMClientDataSet;
    chklstEstab: TColorCheckListBox;
    bbtnSelTodosEstab: TBitBtn;
    bbtnInverteSelEstab: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbxSelecClick(Sender: TObject);
    procedure chklstRubricaClickCheck(Sender: TObject);
    procedure sbtnMarcarRubClick(Sender: TObject);
    procedure bbtnSelTodasClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure bbtnSelTodosEstabClick(Sender: TObject);
    procedure bbtnInverteSelEstabClick(Sender: TObject);
    procedure chklstEstabClickCheck(Sender: TObject);
  private
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlProvDesc: TCtrlProvDesc;
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;

    ListaIdRubrica, ListaIdEstab: TStringList;

    sListaIdRubricaSel, sListaIdEstabSel: string;

    procedure HabilitaBtOk;
  end;

var
  frmParamLancRubIndiv: TfrmParamLancRubIndiv;

implementation

uses uSistema, uMensErro, fAguarde, dCds, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmParamLancRubIndiv.FormCreate(Sender: TObject);
var
  NormalIni: TDate;
  c: byte;
begin
  inherited;
  ListaIdRubrica := TStringList.Create;
  ListaIdEstab := TStringList.Create;

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  // Montar a Lista de Rubricas
  chklstRubrica.Items.Clear;
  dmCds.Cds.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdRubrica.Add(dmCds.Cds.FieldByName('CODPROVDESC').asString);
    chklstRubrica.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    dmCds.Cds.Next;
  end;

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

  NormalIni := CtrlGlobalRH.GetNormalIni;
  cmbMes.ItemIndex := FU.ExtraiMes(NormalIni) - 1;
  speAno.Value := FU.ExtraiAno(NormalIni);

  cmbOrderBy.ItemIndex := 0;

  HabilitaBtOk;
end;

procedure TfrmParamLancRubIndiv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(ListaIdRubrica);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlProvDesc);
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(ListaIdEstab);
  inherited;
end;

procedure TfrmParamLancRubIndiv.chklstRubricaClickCheck(Sender: TObject);
begin
  inherited;
  FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', false);
  edCodRubricas.Text := sListaIdRubricaSel;
  HabilitaBtOk;
end;

procedure TfrmParamLancRubIndiv.bbtnSelTodasClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := true;
  chklstRubrica.Repaint;
  chklstRubricaClickCheck(Sender);
end;

procedure TfrmParamLancRubIndiv.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := not(chklstRubrica.Checked[c]);
  chklstRubrica.Repaint;
  chklstRubricaClickCheck(Sender);
end;

procedure TfrmParamLancRubIndiv.sbtnMarcarRubClick(Sender: TObject);
begin
  edCodRubricas.Text := Trim(edCodRubricas.Text);
  FU.VerificaOpcoes(chklstRubrica, ListaIdRubrica, edCodRubricas.Text, ',');
  chklstRubrica.Repaint;
  HabilitaBtOk;  
end;

procedure TfrmParamLancRubIndiv.cbxSelecClick(Sender: TObject);
begin
  cmbMes.Visible := cbxSelec.Checked;
  speAno.Visible := cbxSelec.Checked;
  if (speAno.Visible) then
    cmbMes.SetFocus;
end;

procedure TfrmParamLancRubIndiv.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
begin
  // Rubrica(s) selecionada(s)
  wNum := FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', true);
  if (wNum = ListaIdRubrica.Count) then
    sListaIdRubricaSel := '';

  Cmp_Padrao.ParamByName('ListaIdEstab').asString := sListaIdEstabSel;
  Cmp_Padrao.ParamByName('IdEmpresa').asInteger := Sistema.IdEmpresa;
  Cmp_Padrao.ParamByName('ListaIdRubrica').asString := sListaIdRubricaSel;
  Cmp_Padrao.ParamByName('SelecionaAnoMesRef').asBoolean := cbxSelec.Checked;
  Cmp_Padrao.ParamByName('MesRef').asInteger := cmbMes.ItemIndex+1;
  Cmp_Padrao.ParamByName('AnoRef').asInteger := speAno.Value;
  Cmp_Padrao.ParamByName('IncluirRubPermanentes').asInteger := rgPermanente.ItemIndex;
  Cmp_Padrao.ParamByName('Ordenacao').asInteger := cmbOrderBy.ItemIndex;

  frmAguarde.Mostra('Lançamentos de Rubricas Individuais');
  frmAguarde.Pos := 0;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmParamLancRubIndiv.HabilitaBtOk;
var
  c: integer;
  bSelRub: boolean;
begin
  // Estabelecimentos selecionados
  FU.CriaListaOpcoes(chklstEstab, ListaIdEstab, sListaIdEstabSel, ',', false);

  bSelRub := false;
  for c:=0 to chklstRubrica.Items.Count-1 do
    if (chklstRubrica.Checked[c]) then
    begin
      bSelRub := true;
      break;
    end;

  bbtnConfirmar.Enabled := (bSelRub) and (sListaIdEstabSel <> '');
end;

procedure TfrmParamLancRubIndiv.bbtnSelTodosEstabClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := true;
  chklstEstab.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamLancRubIndiv.bbtnInverteSelEstabClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := not(chklstEstab.Checked[c]);
  chklstEstab.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamLancRubIndiv.chklstEstabClickCheck(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
end;

end.
