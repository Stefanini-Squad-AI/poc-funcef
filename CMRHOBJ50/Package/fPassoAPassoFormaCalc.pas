unit fPassoAPassoFormaCalc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  ComCtrls;

type
  TfrmPassoAPassoFormaCalc = class(TfrmSairAjuda)
    bbtnCancelar: TBitBtn;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    rcedPasso: TRichEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    FNumeroRegra: double;
    FExpressao: string;
  public
    procedure ColorirExpressao(rced: TRichEdit);

    property Expressao: string read FExpressao write FExpressao;
    property NumeroRegra: double read FNumeroRegra write FNumeroRegra;
  end;

var
  frmPassoAPassoFormaCalc: TfrmPassoAPassoFormaCalc;

implementation

{$R *.DFM}

procedure TfrmPassoAPassoFormaCalc.FormShow(Sender: TObject);
begin
  inherited;
  Self.Width := Self.Constraints.MinWidth;
  Self.Height := Self.Constraints.MinHeight;
  Self.Caption := 'Passo a Passo da Forma de Cálculo Nº ' + FloatToStr(FNumeroRegra);
  rcedPasso.Text := FExpressao;
  ColorirExpressao(rcedPasso);
  bbtnConfirmar.SetFocus;
end;

procedure TfrmPassoAPassoFormaCalc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // inherited; Só para inibir o Action := caFree;
  Action := caHide;
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmPassoAPassoFormaCalc.ColorirExpressao(rced: TRichEdit);
const
  NUM_MAX_SIMBOLOS = 21;
  NUM_MAX_FUNCOES = 39;
  PARENTESES: array[1..2] of char = ('(', ')');
  SIMBOLOS: array[1..NUM_MAX_SIMBOLOS] of string = ('[', ']', '{', '}', '.', ',', ';', '*',
    '-', '+', '/', '*', '"', '^', '=', '<>', '>', '<', '>=', '<=', '&');
  FUNCOES: array[1..NUM_MAX_FUNCOES] of string = (
    'DIASTRAB', 'SOMAHISTRUB', 'MEDIAHISTRUB', 'QTDEHISTRUB', 'QTDEDEPEN', 'DIASFERIAS',
    'DIASFERIASNOMES', 'DIFDIAS', 'DIFANOS', 'DIFDIAS', 'DIFANOS', 'DIFMESES', 'INCDATA',
    'TRAZULTDIAMES', 'TRAZULTDIADATA', 'RETORNAANOMES', 'ANOMES', 'EXTRAIDIA', 'EXTRAIMES',
    'EXTRAIANO', 'JUROCOMPOSTO', 'INDICE', 'ARITM', 'SALVA', 'RECUPERA', 'TABGENERICA',
    'TABLONGA', 'MAXIMO', 'MINIMO', 'IRRF', 'REGATU', 'TOTREGS', 'AVOSFERIAS', 'AVOS13',
    'SE', 'TRUNCA', 'DATANUM', 'ARITM', 'SQRT');
var
  c: byte;
  iPos, Inicio: integer;
begin
//  rced.DefAttributes.Color := clTeal;
  rced.SelStart := 0;
  rced.SelLength := Length(rced.Text);
  rced.SelAttributes.Color := clTeal;  

  for c:=1 to NUM_MAX_SIMBOLOS do
  begin
    Inicio := 0;
    repeat
      iPos := rced.FindText(SIMBOLOS[c], Inicio, Length(rced.Text) - Inicio + 1, []);

      if (iPos > -1) then
      begin
        Inicio := iPos + Length(SIMBOLOS[c]);
        rced.SelStart := iPos;
        rced.SelLength := Length(SIMBOLOS[c]);
        rced.SelAttributes.Color := clBlack;
      end;
    until (iPos = -1);
  end;

  for c:=1 to 2 do
  begin
    Inicio := 0;
    repeat
      iPos := rced.FindText(PARENTESES[c], Inicio, Length(rced.Text) - Inicio + 1, []);

      if (iPos > -1) then
      begin
        Inicio := iPos + Length(PARENTESES[c]);
        rced.SelStart := iPos;
        rced.SelLength := Length(PARENTESES[c]);
        rced.SelAttributes.Color := clBlack;
      end;
    until (iPos = -1);
  end;

  for c:=0 to 9 do
  begin
    Inicio := 0;
    repeat
      iPos := rced.FindText(IntToStr(c), Inicio, Length(rced.Text) - Inicio + 1, []);

      if (iPos > -1) then
      begin
        Inicio := iPos + Length(IntToStr(c));
        rced.SelStart := iPos;
        rced.SelLength := Length(IntToStr(c));
        rced.SelAttributes.Color := clRed;
      end;
    until (iPos = -1);
  end;

  for c:=1 to NUM_MAX_FUNCOES do
  begin
    Inicio := 0;
    repeat
      iPos := rced.FindText(FUNCOES[c], Inicio, Length(rced.Text) - Inicio + 1, [stWholeWord]);

      if (iPos > -1) then
      begin
        Inicio := iPos + Length(FUNCOES[c]);
        rced.SelStart := iPos;
        rced.SelLength := Length(FUNCOES[c]);
        rced.SelAttributes.Color := clNavy;
      end;
    until (iPos = -1);
  end;

  rced.SelLength := 0;
end;

end.
