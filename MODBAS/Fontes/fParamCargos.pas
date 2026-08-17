unit fParamCargos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fOkCancelar,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Wwdatsrc,
  Mask, wwdbedit, Wwdotdot, Wwdbcomb, Machklb, wwdblook, checklst, Spin, IvDictio, IvMulti,
  IvEMulti, Grids, Wwdbigrd, Wwdbgrid, DBGrids, ComCtrls, fSairAjuda;

type
  TfrmParamCargos = class(TfrmSairAjuda)
    gbxGrupoFunc: TGroupBox;
    chklstGrupoFunc: TCheckListBox;
    bbtnSelTodosFunc: TBitBtn;
    bbtnInverteSelFunc: TBitBtn;
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    rgImprDescr: TRadioGroup;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chklstGrupoFuncDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
    procedure chklstGrupoFuncClickCheck(Sender: TObject);
    procedure bbtnSelTodosFuncClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
  private
    ListaCodGrupoFunc: TStringList;
  end;

var
  frmParamCargos: TfrmParamCargos;

implementation

uses uSistema, uMensErro, uFuncoesUteis, dBaseDados, dRelatorios, fAguarde;

{$R *.DFM}

procedure TfrmParamCargos.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  ListaCodGrupoFunc := TStringList.Create;

  cmbTipoPapel.Items.Assign (dtmRelatorios.rpCargos.PrinterSetup.PaperNames);

  iPos := ProcuraStList (cmbTipoPapel.Items,'A4');
  if (iPos = -1) then
    cmbTipoPapel. ItemIndex := 0
  else
    cmbTipoPapel. ItemIndex := iPos;

  with (dtmBaseDados.qry) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT');
    SQL.Add('  CODGRPFUNC, DESCGRPFUNC');
    SQL.Add('FROM');
    SQL.Add('  GRUPFUNC');
    SQL.Add('ORDER BY');
    SQL.Add('  DESCGRPFUNC');
    Open;
    while not(EOF) do
    begin
      ListaCodGrupoFunc.Add(FieldByName('CODGRPFUNC').asString);
      chklstGrupoFunc.Items.Add(FieldByName('DESCGRPFUNC').asString);
      Next;
    end;
  end;

  cmbOrderBy.ItemIndex := 0;
end;

procedure TfrmParamCargos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dtmBaseDados.qry.Close;
  inherited;
  ListaCodGrupoFunc.Free;  
end;

procedure TfrmParamCargos.chklstGrupoFuncDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  with (TCheckListBox(Control).Canvas) do
  begin
    if (TCheckListBox(Control).Checked[Index]) then
    begin
      Brush.Color := CL_AMARELO_CLARO;
      Font.Color  := clBlack;
    end;

    FillRect(Rect);
    TextOut(Rect.Left, Rect.Top, TCheckListBox(Control).Items[Index]);
  end;
end;

procedure TfrmParamCargos.chklstGrupoFuncClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamCargos.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstGrupoFunc.Items.Count-1 do
    chklstGrupoFunc.Checked[c] := true;
  chklstGrupoFunc.Repaint;
end;

procedure TfrmParamCargos.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstGrupoFunc.Items.Count-1 do
    chklstGrupoFunc.Checked[c] := not(chklstGrupoFunc.Checked[c]);
  chklstGrupoFunc.Repaint;
end;

procedure TfrmParamCargos.bbtnConfirmarClick(Sender: TObject);
var
  sGrupoFuncSel: string;
begin
  dtmRelatorios.bImprimeDescricao := (rgImprDescr.ItemIndex = 0);

  // Grupos Funcionas escolhidos
  CriaListaOpcoes (chklstGrupoFunc, ListaCodGrupoFunc, sGrupoFuncSel, ',', true);

  dtmRelatorios.qryCargos.Close;
  with (dtmRelatorios.qryCargos.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS EMPRESA,');

    if (dtmRelatorios.bImprimeDescricao) then
      Add('  IDCARGO AS CODIGO, TITULO, CBO, DESCRICAO')
    else
      Add('  IDCARGO AS CODIGO, TITULO, CBO');

    Add('FROM');
    Add('  CARGO');

    // Grupos Funcionas selecionado(s)
    if (sGrupoFuncSel <> '') then
    begin
      Add('WHERE');
      if (Pos(',',sGrupoFuncSel) > 0) then
        Add('  (CODGRPFUNC IN (' +sGrupoFuncSel+ '))')
      else
        Add('  (CODGRPFUNC = ' +sGrupoFuncSel+ ')');
    end;

    Add('ORDER BY');
    case (cmbOrderBy.ItemIndex) of
      0 : Add('  CODIGO');
      1 : Add('  TITULO');
      2 : Add('  CBO');
    end;
    SaveToFile ('c:\qry.txt');
  end;

  frmAguarde.Mostra ('Listagem de Cargos');
  frmAguarde.Pos := 0;
  dtmRelatorios.qryCargos.Open;
  if (dtmRelatorios.qryCargos.IsEmpty) then
  begin
    ModalResult := mrNone;
    frmAguarde.Apaga;
    MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
  end;
  dtmRelatorios.rpCargos.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
end;

end.
