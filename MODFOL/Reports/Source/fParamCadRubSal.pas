unit fParamCadRubSal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwdatsrc, Mask, wwdbedit,
  Wwdotdot, Wwdbcomb, Machklb, wwdblook, checklst, Spin, IvDictio, IvMulti, IvEMulti,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, fParamReports_Padrao, CmParamReport, uCtrlProvDesc,
  ColorCheckListBox;

type
  TfrmParamCadRubSal = class(TfrmParamReports_Padrao)
    gbxRubricas: TGroupBox;
    Label1: TLabel;
    chklstRubrica: TColorCheckListBox;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    bbtnSelTodas: TBitBtn;
    bbtnInverteSel: TBitBtn;
    gbxTipoRub: TGroupBox;
    chkDeOutRub: TCheckBox;
    chkEmOutRub: TCheckBox;
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    chkEmAfast: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chklstRubricaClickCheck(Sender: TObject);
    procedure sbtnMarcarRubClick(Sender: TObject);
    procedure bbtnSelTodasClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
  private
    CtrlProvDesc: TCtrlProvDesc;
    ListaIdRubrica: TStringList;

    sListaIdRubricaSel: string;
  end;

var
  frmParamCadRubSal: TfrmParamCadRubSal;

implementation

uses uSistema, fAguarde, dCds, uCtrlPadroes, uFuncoesUteisRH;

{$R *.DFM}

procedure TfrmParamCadRubSal.FormCreate(Sender: TObject);
begin
  inherited;
  ListaIdRubrica := TStringList.Create;

  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

  dmCds.Cds.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdRubrica.Add(dmCds.Cds.FieldByName('CODPROVDESC').asString);
    chklstRubrica.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    dmCds.Cds.Next;
  end;

  cmbOrderBy.ItemIndex := 0;
end;

procedure TfrmParamCadRubSal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlProvDesc);
  FreeAndNil(ListaIdRubrica);
  inherited;
end;

procedure TfrmParamCadRubSal.bbtnSelTodasClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := true;
  CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', false);
  edCodRubricas.Text := sListaIdRubricaSel;
  chklstRubrica.Repaint;
end;

procedure TfrmParamCadRubSal.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := not(chklstRubrica.Checked[c]);
  CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', false);
  edCodRubricas.Text := sListaIdRubricaSel;
  chklstRubrica.Repaint;
end;

procedure TfrmParamCadRubSal.chklstRubricaClickCheck(Sender: TObject);
begin
  inherited;
  CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', false);
  edCodRubricas.Text := sListaIdRubricaSel;
end;

procedure TfrmParamCadRubSal.sbtnMarcarRubClick(Sender: TObject);
begin
  edCodRubricas.Text := Trim(edCodRubricas.Text);
  VerificaOpcoes(chklstRubrica, ListaIdRubrica, edCodRubricas.Text, ',');
  chklstRubrica.Repaint;
end;

procedure TfrmParamCadRubSal.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
begin
  // Rubrica(s) selecionada(s)
  wNum := CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', true);
  if (wNum = ListaIdRubrica.Count) then
    sListaIdRubricaSel := '';

  Cmp_Padrao.ParamByName('ListaIdRubrica').asString := sListaIdRubricaSel;
  Cmp_Padrao.ParamByName('ImprimeRubIncidEm').asBoolean := chkEmOutRub.Checked;
  Cmp_Padrao.ParamByName('ImprimeRubIncidDe').asBoolean := chkDeOutRub.Checked;
  Cmp_Padrao.ParamByName('ImprimeIncidAfast').asBoolean := chkEmAfast.Checked;
  Cmp_Padrao.ParamByName('Ordenacao').asInteger := cmbOrderBy.ItemIndex;

  frmAguarde.Mostra('Cadastro de Rubricas Salariais');
  frmAguarde.Pos := 0;
end;

end.
