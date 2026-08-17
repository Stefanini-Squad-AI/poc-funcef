{===============================================================================
Unit    :  uExpressao
Form    :  frmExpressao

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 15/07/2000

Objetivo: Assitente para construir as Expressões das Fórmulas.

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit uExpressao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, DBTables,
  Wwquery, uVarCalc, Wwdatsrc;

type
  TfrmExpressao = class(TfrmOkCancelar)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton22: TSpeedButton;
    SpeedButton17: TSpeedButton;
    SpeedButton24: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SpeedButton21: TSpeedButton;
    SpeedButton20: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton23: TSpeedButton;
    GroupBox1: TGroupBox;
    EditExpressao: TMemo;
    Panel2: TPanel;
    DBGrdVariavel: TwwDBGrid;
    qryVariaveis: TwwQuery;
    qryVariaveisNO_VARIAVEL: TStringField;
    ds: TwwDataSource;
    GroupBox2: TGroupBox;
    edtVar: TEdit;
    BtnBusca: TButton;
    BtBtnLimpar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditExpressaoDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure EditExpressaoDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrdVariavelDblClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure DBGrdVariavelDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure DBGrdVariavelEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure DBGrdVariavelColEnter(Sender: TObject);
    procedure edtVarChange(Sender: TObject);
    procedure SpBtnBuscaClick(Sender: TObject);
    procedure BtBtnLimparClick(Sender: TObject);
    procedure edtVarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure setTextoFormula(Sender: TObject; sVAR: String);
  public
    { Public declarations }
    DsFormula: String;
    Function  FormatExpresText: String;
    Procedure SetFormText(Texto: String);
  end;

var
  frmExpressao: TfrmExpressao;
  Wg_Variavel : TVarCalc;

implementation

uses uExpresCalc, uFormula;

{$R *.DFM}

function TfrmExpressao.FormatExpresText: String;
var
  WFormula : String;
  WI : Integer;
begin
  WFormula := '';
  WI := 0;
  While WI <= EditExpressao.Lines.Count Do
    Begin
      WFormula := WFormula + EditExpressao.Lines[WI];
      WI := WI + 1;
    End;
  Result := WFormula;
end;

procedure TfrmExpressao.SetFormText(Texto: String);
var
  TextoFinal, aux, aux2: String;
  a, i, PosCursor: Byte;
begin
  TextoFinal := Trim(EditExpressao.Text);
  Aux := TextoFinal;
  Aux2 := TextoFinal;
//Posição do Cursor no Memo
  PosCursor := EditExpressao.SelStart;

//Limpa as Strings Auxiliares
  for i := 1 to Length(trim(TextoFinal)) do
   begin
    Aux [i] := ' ';
    Aux2[i] := ' ';
   end;

//Aux := O texto até a posição do Cursor no Memo
  if (Length(aux) >= PosCursor) and (Length(TextoFinal) >= PosCursor) then
  for a := 1 to PosCursor do
    aux[a] := TextoFinal[a];
  aux := trim(aux);

//Aux2 := O texto depois da posição do Cursor no Memo
  i := 1;
  for a := PosCursor + 1 to Length(trim(TextoFinal)) do
   begin
    aux2[i] := TextoFinal[a];
    inc(i);
   end;
  aux2 := trim(aux2);

  TextoFinal := aux +' '+ Texto +' '+ aux2;

  EditExpressao.Text := TextoFinal;
  EditExpressao.SetFocus;
  EditExpressao.SelStart := PosCursor + Length(Trim(Texto)) + 2; 
end;

procedure TfrmExpressao.FormShow(Sender: TObject);
begin
  inherited;
  qryVariaveis.Open;
end;

procedure TfrmExpressao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryVariaveis.Close;
end;

procedure TfrmExpressao.EditExpressaoDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  setTextoFormula(Sender, qryVariaveis.FieldByName('NO_VARIAVEL').asString);
  //---
end;

procedure TfrmExpressao.EditExpressaoDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if (Source is TwwDBGrid) and ((Source as TwwDBGrid).Name = 'DBGrdVariavel') then
    Accept := True
  else
    Accept := False;
end;

procedure TfrmExpressao.bbtnConfirmarClick(Sender: TObject);
Var
  W_variavel  : TVarCalc;
  W_Expressao : TExpresCalc;
begin
  // Cria a Lista de Variáveis para validação
  W_Variavel := TVarCalc.Create(Self);

  // Cria a instância de Expressão para validação
  W_Expressao := TExpresCalc.Create;

  //Seta a propriedade de TExpressao com ponteiro para a Lista de
  //variáveis criada
  W_Expressao.FVarCalcList := @W_Variavel;

  If EditExpressao.Text = '' Then
    ModalResult := mrOK
  Else
   Begin
    If W_Expressao.Expressao_Valida(FormatExpresText) Then
     ModalResult := mrOK
    Else
     Begin
      ShowMessage(W_Expressao.Ferros);
      EditExpressao.SetFocus;
      W_Expressao.Destroy;
      W_Variavel.Destroy;
      exit;
     End;
   End;

  // Destroi Expressao criada para validação
  W_Expressao.Destroy;

  // Destroi Lista de Variáveis criada para validação
  W_Variavel.Destroy;

  frmFormula.QryPrincipal.Edit;
  frmFormula.DBMmExpressao.Text := EditExpressao.Text;
  frmFormula.QryPrincipal.Post;
  bbtnSair.Click;
end;

procedure TfrmExpressao.SpeedButton1Click(Sender: TObject);
begin
  setTextoFormula(Sender, (Sender as TSpeedButton).Caption);
  //---
end;

procedure TfrmExpressao.DBGrdVariavelDblClick(Sender: TObject);
begin
  setTextoFormula(Sender, qryVariaveis.FieldByName('NO_VARIAVEL').asString);
  //---
end;

procedure TfrmExpressao.bbtnCancelarClick(Sender: TObject);
begin
  EditExpressao.Text := DsFormula;
  frmFormula.bbtnCancelar.Click;
  bbtnSair.Click;
end;

procedure TfrmExpressao.DBGrdVariavelDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  DBGrdVariavel.DragMode := dmAutomatic;
end;

procedure TfrmExpressao.DBGrdVariavelEndDrag(Sender, Target: TObject; X,
  Y: Integer);
begin
  DBGrdVariavel.DragMode := dmManual;
end;

procedure TfrmExpressao.DBGrdVariavelColEnter(Sender: TObject);
begin
  DBGrdVariavel.DragMode := dmAutomatic;
end;

procedure TfrmExpressao.edtVarChange(Sender: TObject);
begin
  if trim(edtVar.Text) = '' then
    BtnBusca.Enabled := false
  else
   begin
    BtnBusca.Enabled := true;
    qryVariaveis.Locate('NO_VARIAVEL', edtVar.Text, [loPartialKey]);
   end;
end;

procedure TfrmExpressao.SpBtnBuscaClick(Sender: TObject);
begin
  if not(qryVariaveis.Locate('NO_VARIAVEL', edtVar.Text, [loPartialKey])) then
    ShowMessage('Variável não encontrada !');
end;

procedure TfrmExpressao.BtBtnLimparClick(Sender: TObject);
begin
  EditExpressao.Text := '';
end;

procedure TfrmExpressao.edtVarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    DBGrdVariavel.SetFocus;
end;

procedure TfrmExpressao.setTextoFormula(Sender: TObject; sVAR: String);
var
  iPosicao: Integer;
  sEspaco: String;
begin
  if (Sender is TSpeedButton) or (Trim(EditExpressao.Text) = '') then
    sEspaco := ''
  else
    sEspaco := ' ';

  iPosicao := EditExpressao.SelStart;

  if iPosicao <= 0 then
   begin
     EditExpressao.Text := EditExpressao.Text + sEspaco + sVAR;
     EditExpressao.SelStart := Length(EditExpressao.Text);
   end
  else
   begin
     EditExpressao.Text := copy(EditExpressao.Text, 1, iPosicao) + sEspaco + sVAR +
       copy(EditExpressao.Text, (iPosicao + 1), (Length(EditExpressao.Text) - iPosicao));
     EditExpressao.SelStart := iPosicao + Length(sVAR) + 1;
   end;

  EditExpressao.SetFocus;

end;

end.
