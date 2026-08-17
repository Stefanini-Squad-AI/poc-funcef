// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fPassosFormaCalc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  ComCtrls, USistema;

type
  TfrmPassosFormaCalc = class(TfrmSairAjuda)
    ToolbarSep971: TToolbarSep97;
    rcedPasso: TRichEdit;
    bbtnConfirmar: TBitBtn;
    pnlTipoVisualizacao: TPanel;
    chkTipoVisualizacao: TCheckBox;
    bbtnSalvar: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    SaveDlg: TSaveDialog;
    procedure FormShow(Sender: TObject);
    procedure chkTipoVisualizacaoClick(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FNumeroRegra: double;
    FExpressao: string;
  public
    procedure ColorirExpressao(rced: TRichEdit);

    property Expressao: string read FExpressao write FExpressao;
    property NumeroRegra: double read FNumeroRegra write FNumeroRegra;
  end;

var
  frmPassosFormaCalc: TfrmPassosFormaCalc;

implementation

uses uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmPassosFormaCalc.FormShow(Sender: TObject);
begin
  inherited;
  Self.Width := Self.Constraints.MinWidth;
  Self.Height := Self.Constraints.MinHeight;
  Self.Caption := 'Passos da Forma de Cálculo Nº ' + FloatToStr(FNumeroRegra);
  chkTipoVisualizacaoClick(Sender);
  rcedPasso.Text := FExpressao;
  ColorirExpressao(rcedPasso);
  bbtnConfirmar.SetFocus;
end;

procedure TfrmPassosFormaCalc.chkTipoVisualizacaoClick(Sender: TObject);
begin
  rcedPasso.WordWrap := not(chkTipoVisualizacao.Checked);
end;

procedure TfrmPassosFormaCalc.bbtnSalvarClick(Sender: TObject);
begin
  SaveDlg.Title := 'Salvar Resultado dos Passos da Forma de Cálculo Nº ' + FloatToStr(FNumeroRegra);
  SaveDlg.FileName := 'FormaCalc_' + FloatToStr(FNumeroRegra);
  if (SaveDlg.Execute) then
    rcedPasso.Lines.SaveToFile(SaveDlg.FileName);
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmPassosFormaCalc.ColorirExpressao(rced: TRichEdit);
const
  NUM_MAX_MARCADORES = 7;
var
  c: byte;
  iPos, Inicio: integer;
  Marcadores: array[1..NUM_MAX_MARCADORES] of string;
begin
  rced.SelStart := 0;
  rced.SelLength := Length(rced.Text);
  rced.SelAttributes.Color := clBlack;
  rced.SelAttributes.Style := [];

  Marcadores[1] := 'EXPRESSÃO:';
  Marcadores[2] := ' --> ';
  Marcadores[3] := FU.Replicate('-', 25)+' [CAMPOS] '  +FU.Replicate('-', 25);
  Marcadores[4] := FU.Replicate('-', 25)+' [FUNÇÕES] ' +FU.Replicate('-', 24);
  Marcadores[5] := FU.Replicate('-', 60);
  Marcadores[6] := FU.Replicate('-', 16)+' [FORMA DE CÁLCULO COMPLETA] '+FU.Replicate('-', 15);
  Marcadores[7] := FU.Replicate('-', 24)+' [RESULTADO] ' +FU.Replicate('-', 23);

  for c:=1 to NUM_MAX_MARCADORES do
  begin
    Inicio := 0;
    repeat
      iPos := rced.FindText(Marcadores[c], Inicio, Length(rced.Text) - Inicio + 1, []);

      if (iPos > -1) then
      begin
        Inicio := iPos + Length(Marcadores[c]);
        rced.SelStart := iPos;
        rced.SelLength := Length(Marcadores[c]);
        rced.SelAttributes.Color := clNavy;
      end;
    until (iPos = -1);
  end;

  rced.SelLength := 0;
end;

procedure TfrmPassosFormaCalc.FormCreate(Sender: TObject);
begin
  inherited;
  SaveDlg.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

end;

end.
