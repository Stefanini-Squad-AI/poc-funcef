// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamTabCID;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, ExtCtrls, Db, DBTables, Wwquery, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, CheckLst;

type
  TfrmParamTabCID = class(TfrmOkCancelar)
    qryCID: TwwQuery;
    gbxCid: TGroupBox;
    rgOrderBy: TRadioGroup;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    rbTodos: TRadioButton;
    rpASelecionar: TRadioButton;
    chklstCID: TCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chklstCIDDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure chklstCIDClickCheck(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rbTodosClick(Sender: TObject);
  private
    lstCID: TStringList;
  public
    { Public declarations }
  end;

var
  frmParamTabCID: TfrmParamTabCID;

implementation

uses uSistema, uFuncoesUteis, fAguarde, dRelatoriosAsm;

{$R *.DFM}

procedure TfrmParamTabCID.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  lstCID := TStringList.Create;

  cmbTipoPapel.Items.Assign (dtmRelatoriosAsm.rpTabCID.PrinterSetup.PaperNames);

  iPos := ProcuraStList (cmbTipoPapel.Items,'A4');
  if (iPos = -1) then
    cmbTipoPapel. ItemIndex := 0
  else
    cmbTipoPapel. ItemIndex := iPos;

  rbTodosClick(Sender);  
end;

procedure TfrmParamTabCID.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  qryCID.Close;

  lstCID.Free;
end;

procedure TfrmParamTabCID.chklstCIDDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  inherited;
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

procedure TfrmParamTabCID.chklstCIDClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamTabCID.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  inherited;
  for c:=0 to chklstCID.Items.Count-1 do
    chklstCID.Checked[c] := true;

  chklstCID.Repaint;
end;

procedure TfrmParamTabCID.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  inherited;
  for c:=0 to chklstCID.Items.Count-1 do
    chklstCID.Checked[c] := not(chklstCID.Checked[c]);

  chklstCID.Repaint;
end;

procedure TfrmParamTabCID.rbTodosClick(Sender: TObject);
begin
  inherited;
  chklstCID.Visible      := (rpASelecionar.Checked);
  bbtnSelTodos.Visible   := (rpASelecionar.Checked);
  bbtnInverteSel.Visible := (rpASelecionar.Checked);

  if (rpASelecionar.Checked) and not(qryCID.Active) then
  begin
    // Crio a lista de Rubricas a selecionar
    frmAguarde.Mostra('Selecionando Registros...');
    with (qryCID) do
    begin
      Open;
      lstCID.Clear;
      chklstCID.Items.Clear;
      chklstCID.Items.BeginUpdate;
      while not(EOF) do
      begin
        lstCID.Add(FieldByName('CODCID').asString);
        chklstCID.Items.Add(FieldByName('DESCRCID').asString);
        Next;
      end;
    end;
    frmAguarde.Apaga;
    chklstCID.Items.EndUpdate;    
  end;
end;

procedure TfrmParamTabCID.bbtnConfirmarClick(Sender: TObject);
var
  sListaCID: string;
  iNumCID, c: integer;
begin
  inherited;
  // CID's selecionados
  iNumCID:=0;
  for c:=0 to chklstCID.Items.Count-1 do
    if (chklstCID.Checked[c]) then
      Inc(iNumCID);

  if (iNumCID < chklstCID.Items.Count-1) then
    CriaListaOpcoes (chklstCID, lstCID, sListaCID, ',', false)
  else
    sListaCID := '';  

  // Monto query principal
  dtmRelatoriosAsm.qryTabCID.Close;
  with (dtmRelatoriosAsm.qryTabCID.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS EMPRESA,');
    Add('  CODCID, DESCRCID');
    Add('FROM');
    Add('  CID');

    // Funcionários selecionado(s)
    if (sListaCID <> '') then
    begin
      Add('WHERE');
      if (Pos(',',sListaCID) > 0) then
        Add('  (CODCID IN (' +sListaCID+ '))')
      else
        Add('  (CODCID = ' +sListaCID+ ')');
    end;

    Add('ORDER BY');
    case (rgOrderBy.ItemIndex) of
      0 : Add('  CODCID');
      1 : Add('  UPPER(DESCRCID)');
    end;
    //SaveToFile ('c:\qry.txt');
    SaveToFile (Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  dtmRelatoriosAsm.rpTabCID.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
end;

end.
