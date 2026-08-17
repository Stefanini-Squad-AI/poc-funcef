unit fParamTabCID;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Db,
  DBTables, ExtCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97,
  CheckLst, fParamReports_Padrao, CmParamReport, uCtrlCID, ColorCheckListBox;

type
  TfrmParamTabCID = class(TfrmParamReports_Padrao)
    gbxCid: TGroupBox;
    rgOrderBy: TRadioGroup;
    rbTodos: TRadioButton;
    rpASelecionar: TRadioButton;
    chklstCID: TColorCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rbTodosClick(Sender: TObject);
  private
    CtrlCID: TCtrlCID;

    ListaCodCID: TStringList;
  end;

var
  frmParamTabCID: TfrmParamTabCID;

implementation

uses uSistema, uCtrlPadroes, uCtrlFuncoesRH, fAguarde, dCds;

{$R *.DFM}

procedure TfrmParamTabCID.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlCID := TCtrlCID.Create;
  CtrlCID.InitializeAs(Padroes);

  ListaCodCID := TStringList.Create;

  dmCds.Cds.Close;
  rbTodosClick(Sender);
end;

procedure TfrmParamTabCID.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlCID);
  FreeAndNil(ListaCodCID);
  inherited;
end;

procedure TfrmParamTabCID.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstCID.Items.Count-1 do
    chklstCID.Checked[c] := true;
  chklstCID.Repaint;
end;

procedure TfrmParamTabCID.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstCID.Items.Count-1 do
    chklstCID.Checked[c] := not(chklstCID.Checked[c]);
  chklstCID.Repaint;
end;

procedure TfrmParamTabCID.rbTodosClick(Sender: TObject);
begin
  inherited;
  chklstCID.Visible := (rpASelecionar.Checked);
  bbtnSelTodos.Visible := (rpASelecionar.Checked);
  bbtnInverteSel.Visible := (rpASelecionar.Checked);

  if (rpASelecionar.Checked) and not(dmCds.Cds.Active) then
  begin
    // Crio a lista de Rubricas a selecionar
    frmAguarde.Mostra('Selecionando Registros...');
    dmCds.Cds.Data := CtrlCID.ListCID;

    ListaCodCID.Clear;
    chklstCID.Items.BeginUpdate;
    chklstCID.Items.Clear;
    while not(dmCds.Cds.EOF) do
    begin
      ListaCodCID.Add(dmCds.Cds.FieldByName('CODCID').asString);
      chklstCID.Items.Add(dmCds.Cds.FieldByName('DESCRCID').asString);
      dmCds.Cds.Next;
    end;
    frmAguarde.Apaga;
    chklstCID.Items.EndUpdate;
  end;
end;

procedure TfrmParamTabCID.bbtnConfirmarClick(Sender: TObject);
var
  sListaCodCIDSel: string;
  iNumCID, c: integer;
begin
  inherited;
  // CID's selecionados
  iNumCID:=0;
  for c:=0 to chklstCID.Items.Count-1 do
    if (chklstCID.Checked[c]) then
      Inc(iNumCID);

  if (iNumCID < chklstCID.Items.Count-1) then
    FU.CriaListaOpcoes(chklstCID, ListaCodCID, sListaCodCIDSel, ',', true)
  else
    sListaCodCIDSel := '';

  Cmp_Padrao.ParamByName('NomeEmpresa').asString := Sistema.NomeEmpresa;
  Cmp_Padrao.ParamByName('ListaCodCID').asString := sListaCodCIDSel;
  Cmp_Padrao.ParamByName('Ordenacao').asInteger := rgOrderBy.ItemIndex;

  frmAguarde.Mostra('Tabela CID');
  frmAguarde.Pos := 0;
end;

end.
