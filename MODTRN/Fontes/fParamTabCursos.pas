unit fParamTabCursos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fOkCancelar,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdblook, Db, Wwdatsrc, DBTables, Wwquery, CheckLst;

type
  TfrmParamTabCursos = class(TfrmOkCancelar)
    qryGrupo: TwwQuery;
    GroupBox1: TGroupBox;
    chklstGrupos: TCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    rgOrderBy: TRadioGroup;
    rgImprObs: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chklstGruposDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure chklstGruposClickCheck(Sender: TObject);
    procedure chklstGruposKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    ListaGrupos: TStringList;
  end;

var
  frmParamTabCursos: TfrmParamTabCursos;

implementation

uses uSistema, uFuncoesUteis, dRelatoriosTrn;

{$R *.DFM}

procedure TfrmParamTabCursos.FormCreate(Sender: TObject);
begin
  inherited;
  ListaGrupos := TStringList.Create;

  chklstGrupos.Items.Clear;
  with (qryGrupo) do
  begin
    Open;
    while not(EOF) do
    begin
      ListaGrupos.Add(FieldByName('CODGRPTREIN').asString);
      chklstGrupos.Items.Add(FieldByName('DESCGRPTREIN').asString);
      Next;
    end;
  end;
end;

procedure TfrmParamTabCursos.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  FreeAndNil(ListaGrupos);
  qryGrupo.Close;
  inherited;
end;

procedure TfrmParamTabCursos.chklstGruposDrawItem(Control: TWinControl; Index: Integer;
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

procedure TfrmParamTabCursos.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstGrupos.Items.Count-1 do
    chklstGrupos.Checked[c] := true;
  chklstGrupos.Repaint;
end;

procedure TfrmParamTabCursos.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstGrupos.Items.Count-1 do
    chklstGrupos.Checked[c] := not(chklstGrupos.Checked[c]);
  chklstGrupos.Repaint;
end;

procedure TfrmParamTabCursos.chklstGruposClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamTabCursos.chklstGruposKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    chklstGruposClickCheck(Sender);
end;

procedure TfrmParamTabCursos.bbtnConfirmarClick(Sender: TObject);
var
  sGrupos: string;
begin
  inherited;
  // Grupos selecionados
  CriaListaOpcoes(chklstGrupos, ListaGrupos, sGrupos, ',', true);

  dtmRelatoriosTrn.qryTabCursos.Close;
  with (dtmRelatoriosTrn.qryTabCursos.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS EMPRESA,');
    Add('  IDCURSO, DESCRICAO, ABREV, CODGRPTREIN, OBSERVACAO');
    Add('FROM');
    Add('  CURSO');

    if (sGrupos <> '') then
    begin
      Add('WHERE');
      if (Pos(',',sGrupos) > 0) then
        Add('  (CODGRPTREIN IN (' +sGrupos+ '))')
      else
        Add('  (CODGRPTREIN  = ' +sGrupos+ ')');
    end;

    Add('ORDER BY');
    case (rgOrderBy.ItemIndex) of
      0 : Add('  IDCURSO');
      1 : Add('  DESCRICAO');
    end;
    SaveToFile('c:\qry.txt');
  end;

  dtmRelatoriosTrn.bImprimeObs := (rgImprObs.ItemIndex = 0);
end;

end.
