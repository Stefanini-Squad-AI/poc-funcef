{**************************************************************
Componente:  ExpressBuilder

Autor     : Paulo André M. de Carvalho

Data      : 07/11/1999

Objetivo: Propiciar uma Interface para construção de Expressões
          matemáticas que possa conter variáveis pré-definidas.
          Possibilita também a validação sintática da Expressão.

Propriedades Publicadas:

Métodos Publicos:

****************************************************************}

unit uExpresBuilder;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, DB, DBTables, Grids, DBGrids, uVarCalc;

type
  TfrmExpresBuilder = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    EditExpressao: TMemo;
    SpdBttn1: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton20: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton21: TSpeedButton;
    SpeedButton22: TSpeedButton;
    SpeedButton24: TSpeedButton;
    SpeedButton25: TSpeedButton;
    SpeedButton26: TSpeedButton;
    BtBtnLimpar: TBitBtn;
    BtBtnConfirma: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    EdtBusca: TEdit;
    qryVariavel: TQuery;
    DtSrcVariavel: TDataSource;
    qryVariavelNO_VARIAVEL: TStringField;
    qryVariavelDS_VARIAVEL: TStringField;
    DBGrdVariavel: TDBGrid;
    Panel1: TPanel;
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    procedure EditExpressaoDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure EditExpressaoDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtBtnConfirmaClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtBtnLimparClick(Sender: TObject);
    procedure SpdBttn1Click(Sender: TObject);
    procedure DBGrdVariavelDblClick(Sender: TObject);
    procedure EdtBuscaChange(Sender: TObject);
    procedure Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
    Function  FormatExpresText : String;
    Procedure SetFormText (Texto : String);
  public
    { Public declarations }
  end;

Var
  frmExpresBuilder: TfrmExpresBuilder;
  Wg_Variavel : TVarCalc;

implementation

uses uExpresCalc;
{$R *.DFM}

procedure TfrmExpresBuilder.EditExpressaoDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
     if (Source As TDBGrid).Name = 'DBGrdVariavel' then
         Accept := True
     else
         Accept := False;
end;

procedure TfrmExpresBuilder.EditExpressaoDragDrop(Sender, Source: TObject;
  X, Y: Integer);
begin
     SetFormText(qryVariavel.FieldByName('NO_VARIAVEL').AsString)
end;

Procedure TfrmExpresBuilder.SetFormText(Texto : String);
Begin
     EditExpressao.Text := EditExpressao.Text + Texto;
     EditExpressao.SetFocus;
     EditExpressao.SelStart := Length(EditExpressao.Text) + 1;
End;

procedure TfrmExpresBuilder.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TfrmExpresBuilder.BtBtnConfirmaClick(Sender: TObject);
Var W_variavel  : TVarCalc;
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
            End;
        End;

     // Destroi Expressao criada para validação
     W_Expressao.Destroy;

     // Destroi Lista de Variáveis criada para validação
     W_Variavel.Destroy;

end;

Function TfrmExpresBuilder.FormatExpresText : String;
Var WFormula : String;
    WI : Integer;
Begin
  WFormula := '';
  WI := 0;
  While WI <= EditExpressao.Lines.Count Do
    Begin
      WFormula := WFormula + EditExpressao.Lines[WI];
      WI := WI + 1;
    End;
  Result := WFormula;
End;

procedure TfrmExpresBuilder.BitBtn2Click(Sender: TObject);
begin
     qryVariavel.Close;
     Close;
end;

procedure TfrmExpresBuilder.FormCreate(Sender: TObject);
begin
     qryVariavel.Open;
end;

procedure TfrmExpresBuilder.FormActivate(Sender: TObject);
begin
     EditExpressao.SetFocus;
end;

procedure TfrmExpresBuilder.BtBtnLimparClick(Sender: TObject);
begin
     EditExpressao.Text := '';
end;

procedure TfrmExpresBuilder.SpdBttn1Click(Sender: TObject);
begin
     SetFormText((Sender As TSpeedButton).Caption);
end;

procedure TfrmExpresBuilder.DBGrdVariavelDblClick(Sender: TObject);
begin
     SetFormText(qryVariavel.FieldByName('NO_VARIAVEL').AsString)
end;

procedure TfrmExpresBuilder.EdtBuscaChange(Sender: TObject);
begin
     With qryVariavel Do
       Begin
         DisableControls;
         Locate('NO_VARIAVEL', EdtBusca.Text , [loCaseInsensitive,loPartialKey]);
         EnableControls;
       End;
end;

procedure TfrmExpresBuilder.Panel1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
     Panel1.Hint := qryVariavel.FieldByname('DS_VARIAVEL').AsString;
end;

procedure TfrmExpresBuilder.Image1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
     Image1.Hint := qryVariavel.FieldByName('DS_Variavel').AsString;
end;

End.
