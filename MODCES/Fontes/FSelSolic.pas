unit FSelSolic;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Db, DBTables, wwdblook, TB97, IvDictio, IvMulti,
  IvEMulti, TB97Tlbr, checklst, Wwquery, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmSelSolic = class(TfrmSairAjuda)
    qryPessoal: TwwQuery;
    gbxFaixaData: TGroupBox;
    Label1: TLabel;
    edData1: TCMDateTimePicker;
    edData2: TCMDateTimePicker;
    rgSelIndic: TRadioGroup;
    gbxSit: TGroupBox;
    cbxProposta: TCheckBox;
    cbxEfetiv: TCheckBox;
    gbxRequisit: TGroupBox;
    chklstRequisit: TCheckListBox;
    bbtnInverteSelRequisit: TBitBtn;
    bbtnSelTodosRequisit: TBitBtn;
    gbxAcoes: TGroupBox;
    chklstAcoes: TCheckListBox;
    bbtnInverteSelAcoes: TBitBtn;
    bbtnSelTodosAcoes: TBitBtn;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    procedure FormCreate(Sender: TObject);
    procedure edData1Change(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chklstRequisitDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
    procedure chklstRequisitClickCheck(Sender: TObject);
    procedure bbtnSelTodosRequisitClick(Sender: TObject);
    procedure bbtnInverteSelRequisitClick(Sender: TObject);
    procedure chklstRequisitKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure HabilitaBtOk;
  public
    bSelRequisit, bSelAcoes: boolean;
    ListaRequisit, ListaAcoes: TStringList;
  end;

var
  frmSelSolic: TfrmSelSolic;

implementation

uses uFuncoesUteisRH, uSistema, uMensErro, fTelaAut, UsoGeralRH, fAnalSolic, dBaseDados;

{$R *.DFM}

procedure TfrmSelSolic.FormCreate(Sender: TObject);
begin
  inherited;
  if (Sistema.IdModulo = 417) then
     HelpContext := 4170015;

  if sUsoGeralIdPessoa <> '' then
  begin
    MsgDlg('Tela de Uso Restrito a Usuários RH e Gestores', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    Close;
    exit;
  end;
  
  ListaRequisit := TStringList.Create;
  ListaAcoes    := TStringList.Create;

  // Crio a lista de Motivos a selecionar
  with (dtmBaseDados.qry) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT');
    SQL.Add('  IDMOTIVO, DESCRICAO');
    SQL.Add('FROM');
    SQL.Add('  MOTIVO');
    SQL.Add('WHERE');
    SQL.Add('  (GRUPOMOTIVO = ''A'')');
    SQL.Add('ORDER BY');
    SQL.Add('  DESCRICAO');
    Open;
    while not(EOF) do
    begin
      ListaAcoes.Add(FieldByName('IDMOTIVO').asString);
      chklstAcoes.Items.Add(FieldByName('DESCRICAO').asString);
      Next;
    end;
  end;

  // Crio a lista de Pessoas a selecionar
  with (dtmBaseDados.qry) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT');
    SQL.Add('  P.IDPESSOA, P.NOME');
    SQL.Add('FROM');
    SQL.Add('  PESSOA P, FUNCIONARIO F');
    SQL.Add('WHERE');
    if (sUsuXccusto <> '') then
    begin
      SQL.Add('  ((F.IDPESSOA = ' + IntToStr(Sistema.IdUsuario) + ') OR ');
      if (Pos(',',sUsuXccusto) > 0) then
        SQL.Add('  (F.CODCENTROCUSTO IN ' +sUsuXccusto+ ')) AND')
      else
        SQL.Add('  (F.CODCENTROCUSTO  = ' +sUsuXccusto+ ')) AND');
    end;

    if (sUsuXfilial <> '') then
    begin
      SQL.Add('  ((F.IDPESSOA = ' + IntToStr(Sistema.IdUsuario) + ') OR ');
      if (Pos(',',sUsuXccusto) > 0) then
        SQL.Add('  (F.IDESTAB IN ' + sUsuXfilial+ ')) AND')
      else
        SQL.Add('  (F.IDESTAB  = ' + sUsuXfilial+ ')) AND');
    end;

    SQL.Add('  (F.IDPESSOA = P.IDPESSOA)');
    SQL.Add('ORDER BY P.NOME');
    Open;
    while not(EOF) do
    begin
      ListaRequisit.Add(FieldByName('IDPESSOA').asString);
      chklstRequisit.Items.Add(FieldByName('NOME').asString);
      Next;
    end;
  end;

  edData1.Date := Date;
  edData2.Date := Date + 30;
end;

procedure TfrmSelSolic.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  ListaRequisit.Free;
  ListaAcoes.Free;
end;

procedure TfrmSelSolic.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := (EdData1.Text <> '') and (EdData2.Text <> '') and
    (EdData1.Date <= EdData2.Date);
end;

procedure TfrmSelSolic.chklstRequisitDrawItem(Control: TWinControl; Index: Integer;
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

procedure TfrmSelSolic.edData1Change(Sender: TObject);
begin
  try
    StrToDate(TCMDateTimePicker(Sender).Text);
    HabilitaBtOk;
  except
  end;
end;

procedure TfrmSelSolic.chklstRequisitKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmSelSolic.chklstRequisitClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmSelSolic.bbtnSelTodosRequisitClick(Sender: TObject);
var
  c: integer;
begin
  if (TBitBtn(Sender).Name = 'bbtnSelTodosRequisit') then
  begin
    for c:=0 to chklstRequisit.Items.Count-1 do
      chklstRequisit.Checked[c] := true;
    chklstRequisit.Repaint;
  end
  else
  begin
    for c:=0 to chklstAcoes.Items.Count-1 do
      chklstAcoes.Checked[c] := true;
    chklstAcoes.Repaint;
  end;
end;

procedure TfrmSelSolic.bbtnInverteSelRequisitClick(Sender: TObject);
var
  c: integer;
begin
  if (TBitBtn(Sender).Name = 'bbtnInverteSelRequisit') then
  begin
    for c:=0 to chklstRequisit.Items.Count-1 do
      chklstRequisit.Checked[c] := not(chklstRequisit.Checked[c]);
    chklstRequisit.Repaint;
  end
  else
  begin
    for c:=0 to chklstAcoes.Items.Count-1 do
      chklstAcoes.Checked[c] := not(chklstAcoes.Checked[c]);
    chklstAcoes.Repaint;
  end
end;

procedure TfrmSelSolic.bbtnConfirmarClick(Sender: TObject);
var
  c: integer;
begin
  bSelRequisit := false;
  for c:=0 to chklstRequisit.Items.Count-1 do
    if (chklstRequisit.Checked[c]) then
    begin
      bSelRequisit := true;
      break;
    end;

  bSelAcoes := false;
  for c:=0 to chklstAcoes.Items.Count-1 do
    if (chklstAcoes.Checked[c]) then
    begin
      bSelAcoes := true;
      break;
    end;

  AbrirForm(frmAnalSolic, TfrmAnalSolic, false);
end;

end.
