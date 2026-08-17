// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamOcorrExames;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, ExtCtrls, Db, DBTables, Wwquery, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, CheckLst;

type
  TfrmParamOcorrExames = class(TfrmOkCancelar)
    gbxOcorr: TGroupBox;
    rgOrderBy: TRadioGroup;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    chklstOcorr: TCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    qryOcorr: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chklstOcorrDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure chklstOcorrClickCheck(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    lstOcorr: TStringList;
  public
    { Public declarations }
  end;

var
  frmParamOcorrExames: TfrmParamOcorrExames;

implementation

uses uSistema, uFuncoesUteis, dRelatoriosAsm;

{$R *.DFM}

procedure TfrmParamOcorrExames.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  lstOcorr := TStringList.Create;

  cmbTipoPapel.Items.Assign (dtmRelatoriosAsm.rpOcorrExames.PrinterSetup.PaperNames);

  iPos := ProcuraStList (cmbTipoPapel.Items,'A4');
  if (iPos = -1) then
    cmbTipoPapel. ItemIndex := 0
  else
    cmbTipoPapel. ItemIndex := iPos;

  // Crio a lista de Rubricas a selecionar
  with (qryOcorr) do
  begin
    Open;
    while not(EOF) do
    begin
      lstOcorr.Add(FieldByName('CODTIPOOCMED').asString);
      chklstOcorr.Items.Add(FieldByName('DESCRTIPOOCMED').asString);
      Next;
    end;
  end;
end;

procedure TfrmParamOcorrExames.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  qryOcorr.Close;

  lstOcorr.Free;
end;

procedure TfrmParamOcorrExames.chklstOcorrDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
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

procedure TfrmParamOcorrExames.chklstOcorrClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamOcorrExames.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  inherited;
  for c:=0 to chklstOcorr.Items.Count-1 do
    chklstOcorr.Checked[c] := true;

  chklstOcorr.Repaint;
end;

procedure TfrmParamOcorrExames.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  inherited;
  for c:=0 to chklstOcorr.Items.Count-1 do
    chklstOcorr.Checked[c] := not(chklstOcorr.Checked[c]);

  chklstOcorr.Repaint;
end;

procedure TfrmParamOcorrExames.bbtnConfirmarClick(Sender: TObject);
var
  sListaOcorr: string;
  iNumOcorr, c: integer;
begin
  inherited;
  // Ocorrências selecionadas
  iNumOcorr:=0;
  for c:=0 to chklstOcorr.Items.Count-1 do
    if (chklstOcorr.Checked[c]) then
      Inc(iNumOcorr);

  if (iNumOcorr < chklstOcorr.Items.Count) then
    CriaListaOpcoes (chklstOcorr, lstOcorr, sListaOcorr, ',', false)
  else
    sListaOcorr := '';

  // Monto query principal
  dtmRelatoriosAsm.qryOcorrExames.Close;
  with (dtmRelatoriosAsm.qryOcorrExames.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS EMPRESA,');
    Add('  CODTIPOOCMED, DESCRTIPOOCMED, AVALMIN');
    Add('FROM');
    Add('  TIPOCMED');

    // Funcionários selecionado(s)
    if (sListaOcorr <> '') then
    begin
      Add('WHERE');
      if (Pos(',',sListaOcorr) > 0) then
        Add('  (CODTIPOOCMED IN (' +sListaOcorr+ '))')
      else
        Add('  (CODTIPOOCMED = ' +sListaOcorr+ ')');
    end;

    Add('ORDER BY');
    case (rgOrderBy.ItemIndex) of
      0 : Add('  CODTIPOOCMED');
      1 : Add('  UPPER(DESCRTIPOOCMED)');
    end;
    //SaveToFile ('c:\qry.txt');
    SaveToFile (Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  dtmRelatoriosAsm.rpOcorrExames.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
end;

end.
