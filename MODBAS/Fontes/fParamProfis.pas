unit fParamProfis;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Wwdatsrc,
  wwdbedit, Wwdotdot, Wwdbcomb, Machklb, wwdblook, checklst, IvDictio, IvMulti, IvEMulti,
  Wwdbigrd, Wwdbgrid, ComCtrls;

type
  TfrmParamProfis = class(TfrmSairAjuda)
    gbxProfis: TGroupBox;
    chklstProfis: TCheckListBox;
    bbtnSelTodosFunc: TBitBtn;
    bbtnInverteSelFunc: TBitBtn;
    cmbOrderBy: TRadioGroup;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    ToolbarSep971: TToolbarSep97;
    bbtnConfirmar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chklstProfisDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
    procedure chklstProfisClickCheck(Sender: TObject);
    procedure bbtnSelTodosFuncClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
    procedure chklstProfisKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    ListaCodProfis: TStringList;
  end;

var
  frmParamProfis: TfrmParamProfis;

implementation

uses uSistema, uMensErro, uFuncoesUteis, dBaseDados, dRelatorios, fAguarde;

{$R *.DFM}

procedure TfrmParamProfis.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  ListaCodProfis := TStringList.Create;

  cmbTipoPapel.Items.Assign (dtmRelatorios.rpProfis.PrinterSetup.PaperNames);

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
    SQL.Add('  IDPROFISS, DESCRICAO');
    SQL.Add('FROM');
    SQL.Add('  PROFISS');
    SQL.Add('ORDER BY');
    SQL.Add('  DESCRICAO');
    Open;
    while not(EOF) do
    begin
      ListaCodProfis.Add(FieldByName('IDPROFISS').asString);
      chklstProfis.Items.Add(FieldByName('DESCRICAO').asString);
      Next;
    end;
  end;

  cmbOrderBy.ItemIndex := 0;
end;

procedure TfrmParamProfis.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dtmBaseDados.qry.Close;
  inherited;
  ListaCodProfis.Free;
end;

procedure TfrmParamProfis.chklstProfisDrawItem(Control: TWinControl; Index: Integer;
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

procedure TfrmParamProfis.chklstProfisKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamProfis.chklstProfisClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamProfis.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstProfis.Items.Count-1 do
    chklstProfis.Checked[c] := true;
  chklstProfis.Repaint;
end;

procedure TfrmParamProfis.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstProfis.Items.Count-1 do
    chklstProfis.Checked[c] := not(chklstProfis.Checked[c]);
  chklstProfis.Repaint;
end;

procedure TfrmParamProfis.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
  sCodProfisSel: string;
begin
  // Profissões escolhidos
  wNum := CriaListaOpcoes (chklstProfis, ListaCodProfis, sCodProfisSel, ',', false);
  if (wNum = chklstProfis.Items.Count) then
    sCodProfisSel := '';

  dtmRelatorios.qryProfis.Close;
  with (dtmRelatorios.qryProfis.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS EMPRESA,');
    Add('  IDPROFISS, DESCRICAO');
    Add('FROM');
    Add('  PROFISS');

    // Profissões selecionada(s)
    if (sCodProfisSel <> '') then
    begin
      Add('WHERE');
      if (Pos(',',sCodProfisSel) > 0) then
        Add('  (IDPROFISS IN (' +sCodProfisSel+ '))')
      else
        Add('  (IDPROFISS = ' +sCodProfisSel+ ')');
    end;

    Add('ORDER BY');
    case (cmbOrderBy.ItemIndex) of
      0 : Add('  IDPROFISS');
      1 : Add('  DESCRICAO');
    end;
    SaveToFile ('c:\qry.txt');
  end;

  frmAguarde.Mostra ('Listagem de Profissões');
  frmAguarde.Pos := 0;
  dtmRelatorios.qryProfis.Open;
  if (dtmRelatorios.qryProfis.IsEmpty) then
  begin
    ModalResult := mrNone;
    frmAguarde.Apaga;
    MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
  end;
                         
  dtmRelatorios.rpProfis.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
end;

end.
