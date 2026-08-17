unit fParamRubIntegrContab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwdatsrc, Mask, wwdbedit,
  Wwdotdot, Wwdbcomb, Machklb, wwdblook, checklst, Spin, IvDictio, IvMulti, IvEMulti, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, fParamReports_Padrao, CmParamReport, ColorCheckListBox,
  uCtrlProvDesc, uCtrlGlobalRH, uCtrlMotivo;

type
  TfrmParamRubIntegrContab = class(TfrmParamReports_Padrao)
    pgctrlPrincipal: TPageControl;
    tbshRubricas: TTabSheet;
    Label1: TLabel;
    chklstRubrica: TColorCheckListBox;
    bbtnSelTodas: TBitBtn;
    bbtnInverteSel: TBitBtn;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    chkRubConst: TCheckBox;
    tbshRubConst: TTabSheet;
    GroupBox1: TGroupBox;
    chklstTipoFolha: TColorCheckListBox;
    bbtnSelTodosTipoFolha: TBitBtn;
    bbtnInverteSelTipoFolha: TBitBtn;
    gbxMesAnoRef: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    rgProcesso: TRadioGroup;
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chklstRubricaClickCheck(Sender: TObject);
    procedure sbtnMarcarRubClick(Sender: TObject);
    procedure bbtnSelTodasClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure chkRubConstClick(Sender: TObject);
    procedure chklstTipoFolhaClickCheck(Sender: TObject);
    procedure bbtnSelTodosTipoFolhaClick(Sender: TObject);
    procedure bbtnInverteSelTipoFolhaClick(Sender: TObject);
  private
    CtrlProvDesc: TCtrlProvDesc;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlMotivo: TCtrlMotivo;

    ListaIdRubrica: TStringList;
    ListaIdTipoFolha: TStringList;

    sListaIdRubricaSel: string;

    procedure HabilitaBtOk;
  end;

var
  frmParamRubIntegrContab: TfrmParamRubIntegrContab;

implementation

uses uSistema, fAguarde, dCds, uCtrlPadroes, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmParamRubIntegrContab.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);

  ListaIdRubrica := TStringList.Create;
  ListaIdTipoFolha := TStringList.Create;

  // Apagar o índice se este existir
  dmCds.Cds.IndexName := '';
  if (dmCds.Cds.IndexDefs.IndexOf('Index1') > 0) then
    dmCds.Cds.DeleteIndex('Index1');

  dmCds.Cds.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdRubrica.Add(dmCds.Cds.FieldByName('CODPROVDESC').asString);
    chklstRubrica.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    dmCds.Cds.Next;
  end;

  // Montar a Lista de Tipos de Folha
  chklstTipoFolha.Items.Clear;
  dmCds.Cds.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('F,D');
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdTipoFolha.Add(dmCds.Cds.FieldByName('IDMOTIVO').asString);
    chklstTipoFolha.Items.Add(dmCds.Cds.FieldByName('DESCRICAO').asString);
    dmCds.Cds.Next;
  end;

  dmCds.Cds.Data := CtrlGlobalRH.GetParamRH('NORMALINI');
  cmbMes.ItemIndex := FU.ExtraiMes(dmCds.Cds.FieldByName('NORMALINI').asDateTime) - 1;
  speAno.Value := FU.ExtraiAno(dmCds.Cds.FieldByName('NORMALINI').asDateTime);

  cmbOrderBy.ItemIndex := 0;
  pgctrlPrincipal.ActivePageIndex := 0;
  chkRubConstClick(Sender);
end;

procedure TfrmParamRubIntegrContab.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlProvDesc);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlMotivo);
  FreeAndNil(ListaIdTipoFolha);
  FreeAndNil(ListaIdRubrica);
  inherited;
end;

procedure TfrmParamRubIntegrContab.chklstRubricaClickCheck(Sender: TObject);
begin
  FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', false);
  edCodRubricas.Text := sListaIdRubricaSel;
end;

procedure TfrmParamRubIntegrContab.chklstTipoFolhaClickCheck(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamRubIntegrContab.bbtnSelTodasClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := true;
  FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', false);
  edCodRubricas.Text := sListaIdRubricaSel;
  chklstRubrica.Repaint;
end;

procedure TfrmParamRubIntegrContab.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := not(chklstRubrica.Checked[c]);
  FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', false);
  edCodRubricas.Text := sListaIdRubricaSel;
  chklstRubrica.Repaint;
end;

procedure TfrmParamRubIntegrContab.bbtnSelTodosTipoFolhaClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoFolha.Items.Count-1 do
    chklstTipoFolha.Checked[c] := true;
  chklstTipoFolha.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamRubIntegrContab.bbtnInverteSelTipoFolhaClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoFolha.Items.Count-1 do
    chklstTipoFolha.Checked[c] := not(chklstTipoFolha.Checked[c]);
  chklstTipoFolha.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamRubIntegrContab.chkRubConstClick(Sender: TObject);
begin
  tbshRubConst.TabVisible := chkRubConst.Checked;
end;

procedure TfrmParamRubIntegrContab.sbtnMarcarRubClick(Sender: TObject);
begin
  edCodRubricas.Text := Trim(edCodRubricas.Text);
  FU.VerificaOpcoes(chklstRubrica, ListaIdRubrica, edCodRubricas.Text, ',');
  chklstRubrica.Repaint;
end;

procedure TfrmParamRubIntegrContab.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
  sListaIdTipoFolhaSel: string;
begin
  // Tipos de Folha selecionados
  wNum := FU.CriaListaOpcoes(chklstTipoFolha, ListaIdTipoFolha, sListaIdTipoFolhaSel, ',', false);
  if (wNum = ListaIdTipoFolha.Count) then
    sListaIdTipoFolhaSel := '';

  // Rubrica(s) selecionada(s)
  wNum := FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', true);
  if (wNum = ListaIdRubrica.Count) then
    sListaIdRubricaSel := '';

  Cmp_Padrao.ParamByName('NOMEEMPRESA').asString := Sistema.NomeEmpresa;
  Cmp_Padrao.ParamByName('LISTAIDRUBRICA').asString := sListaIdRubricaSel;
  Cmp_Padrao.ParamByName('IDEMPRESA').asInteger := Sistema.IdEmpresa;
  Cmp_Padrao.ParamByName('ORDENACAO').asInteger := cmbOrderBy.ItemIndex;

  Cmp_Padrao.ParamByName('SELTIPOFOLHA').asBoolean := chkRubConst.Checked;
  Cmp_Padrao.ParamByName('MESREF').asInteger := cmbMes.ItemIndex+1;
  Cmp_Padrao.ParamByName('ANOREF').asInteger := speAno.Value;
  Cmp_Padrao.ParamByName('ListaTipoFolha').asString := sListaIdTipoFolhaSel;

  if (rgProcesso.ItemIndex = 0) then
    Cmp_Padrao.ParamByName('NOMETABELA').asString := 'PREVIAFOLPAG'
  else
    Cmp_Padrao.ParamByName('NOMETABELA').asString := 'HISTRUBSAL';

  frmAguarde.Mostra('Relação das Rubricas de Integração Contábil');
  frmAguarde.Pos := 0;
end;

procedure TfrmParamRubIntegrContab.HabilitaBtOk;
var
  c: integer;
  bSelTipFol: boolean;
begin
  bSelTipFol := false;
  for c:=0 to chklstTipoFolha.Items.Count-1 do
    if (chklstTipoFolha.Checked[c]) then
    begin
      bSelTipFol := true;
      break;
    end;

  bbtnConfirmar.Enabled := not(chkRubConst.Checked) or
    ((chkRubConst.Checked) and (Trim(speAno.Text) <> '') and (bSelTipFol));
end;

end.
