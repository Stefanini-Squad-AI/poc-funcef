{*******************************************************}
{                                                       }
{ Padrões de Desenvolvimento                            }
{ Copyright © 1998,2002 - CM Soluções Informática       }
{                                                       }
{ - Atualização para o padrão MT (3 Camadas)            }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 10/04/2002                             }
{                                                       }
{*******************************************************}
unit TreeWzd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, stdctrls;

type
  TEtapa = Class(TPersistent)
  Private
    FQuantidade,
    FBorderWidth,
    FLeft,
    FIdentacao,
    FTop,
    FCompoExtra,
    FEspaco,
    FHeight,
    FWidth,
    FLinhaWidth,
    FPos              :Integer;
    FBorderColor,
    FBrushColor       :TColor;
    FForma            :TShapeType;
    FCaption          :TStrings;
    FOwner            :TComponent;
    FImagem: TBitmap;
    FImage: TImage;
    procedure SeTQuantidade(Value: Integer);
    procedure SetTop(Value: Integer);
    procedure SetEspaco(Value: Integer);
    procedure SeTBorderWidth(Value: Integer);
    procedure SeTLeft(Value: Integer);
    procedure SeTIdentacao(Value: Integer);
    procedure SetHeight(Value: Integer);
    procedure SetWidth(Value: Integer);
    procedure SetLinhaWidth(Value: Integer);
    procedure SeTBrushColor(Value: TColor);
    procedure SeTBorderColor(Value: TColor);
    procedure SetForma(Value:TShapeType);
    procedure SetCaption(Value: TStrings);
    procedure SetImagem(Value: TBitmap);
    procedure SetPos(Value: Integer);
    procedure LimpaEtapas;
  Public
    constructor Create(AOwner: TComponent); reintroduce;
    Destructor  Destroy; override;
    Procedure Avancar;
    Procedure Retornar;
  Published
    Property Caption: TStrings Read FCaption Write SetCaption;
    Property Forma: TShapeType Read FForma Write SetForma;
    Property LinhaWidth: Integer Read FLinhaWidth Write SetLinhaWidth;
    Property Top: Integer Read FTop Write SetTop;
    Property Espaco: Integer Read FEspaco Write SetEspaco;
    Property Quantidade: Integer Read FQuantidade Write SeTQuantidade;
    Property BorderWidth: Integer Read FBorderWidth Write SeTBorderWidth;
    Property Left: Integer Read FLeft Write SeTLeft;
    Property Identacao: Integer Read FIdentacao Write SeTIdentacao;
    Property Height: Integer Read FHeight Write SetHeight;
    Property Width: Integer Read FWidth Write SetWidth;
    Property BoderColor: TColor Read FBorderColor Write SeTBorderColor;
    Property BrushColor: TColor Read FBrushColor Write SeTBrushColor;
    Property Imagem  :TBitmap Read FImagem Write SetImagem;
    Property Pos     :Integer Read FPos    Write SetPos;
  End;

  TTreeWzd = class(TCustomPanel)
  private
    FEtapa :TEtapa;
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    Destructor  Destroy; override;
    procedure   Resize; Override;
  published
    { Published declarations }
    Property Align;
    Property Color;
    Property BevelInner;
    Property BevelOuter;
    Property BevelWidth;
    Property BorderStyle;
    Property BorderWidth;
    Property Font;
    Property Caption;

    Property Etapa   :TEtapa  Read FEtapa  Write FEtapa;
  end;

implementation

Constructor TTreeWzd.Create(AOwner: TComponent);
Begin
   Inherited Create(AOwner);
   FEtapa := TEtapa.Create(Self);

   
End;

Destructor TTreeWzd.Destroy;
Begin
   FEtapa.Free;
   
   Inherited Destroy;
End;

procedure TEtapa.SeTQuantidade(Value: Integer);
Var
  EtapaShape : TShape;
  EtapaLabel : TLabel;
  x: Integer;
Begin
  If FOwner <> nil Then
  Begin
     LimpaEtapas;

     FCompoExtra := 3;

     //Cria Linhas
     If Value > 1 Then
     Begin
         For X:=0 To 2 Do
         Begin
           If (FIdentacao > (FLeft + (FHeight Div 2))) Or (X = 2) Then
           Begin
               EtapaShape := TShape.Create(FOwner);
                             EtapaShape.Tag := 99;
                             EtapaShape.Pen.Color := FBorderColor;
                             EtapaShape.Pen.Width := FLinhaWidth;


                             Case X of
                             0,2: EtapaShape.Top       := FTop + (FHeight Div 2)  - (FLinhaWidth Div 2);
                             1:   EtapaShape.Top       := (FTop + (FEspaco * (Value-1)) + (FHeight * (Value-1)) + (FHeight Div 2)) - (FLinhaWidth Div 2);
                             End;

                             Case X of
                             0,1:
                             Begin
                                EtapaShape.Left      := FLeft + FWidth;
                                EtapaShape.Height    := FLinhaWidth;
                                EtapaShape.Width     := Abs(FLeft + (FWidth Div 2) - FIdentacao);
                             End;
                             2:
                             Begin
                                EtapaShape.Left      := FIdentacao + (FWidth Div 2) - (FLinhaWidth Div 2);
                                EtapaShape.Height    := (FTop + ((FEspaco + FHeight) * (Value-1) + (FHeight Div 2))) - (FTop + (FHeight Div 2)) + FLinhaWidth;
                                EtapaShape.Width     := FLinhaWidth;
                             End;
                             End;

                             EtapaShape.Parent    := TTReeWzd(FOwner);
           End;
         End;
     End;

     //Cria Etapas

     For X:=1 To Value Do
     Begin

        If (FCaption.Count > 0) And (X <= FCaption.Count) Then
        Begin
            EtapaLabel := TLabel.Create(FOwner);
                          EtapaLabel.Tag := 99;
                          EtapaLabel.Top      := FTop + ((FEspaco + FHeight) * (X-1));
                          EtapaLabel.Left     := FIdentacao + FWidth + 5;
                          EtapaLabel.AutoSize := False;
                          EtapaLabel.WordWrap := True;
                          EtapaLabel.Height   := FHeight + 10;
                          EtapaLabel.Width    := TTreeWzd(FOwner).Width - EtapaLabel.Left - TTreeWzd(FOwner).BorderWidth - 5;
                          EtapaLabel.Caption    := Caption[X-1];
                          EtapaLabel.ParentFont := True;
                          EtapaLabel.Parent   := TTreeWzd(FOwner);

        End;

        EtapaShape := TShape.Create(FOwner);
                      EtapaShape.Tag := 99;
                      EtapaShape.Top       := FTop + ((FEspaco + FHeight) * (X-1));
                      EtapaShape.Shape     := FForma;

                      If (X = 1) Or (X = Value) Then
                         EtapaShape.Left   := FLeft
                      Else
                         EtapaShape.Left   := FIdentacao;

                      EtapaShape.Height    := FHeight;
                      EtapaShape.Width     := FWidth;
                      EtapaShape.Pen.Width := FBorderWidth;
                      EtapaShape.Pen.Color := FBorderColor;
                      EtapaShape.Brush.Color := FBrushColor;
                      EtapaShape.Parent    := TTreeWzd(FOwner);
     End;

     If (Value > 0) And (FImagem <> Nil) Then
     Begin
        FCompoExtra := 4;

        FImage := TImage.Create(FOwner);
                  FImage.Tag := 99;
                  FImage.Top      := FTop + ((FEspaco + FHeight) * (FPos-1));

                  If (FPos = 1) Or (FPos = Value) Then
                     FImage.Left   := FLeft
                  Else
                     FImage.Left   := FIdentacao;

                  FImage.AutoSize := False;
                  FImage.Center   := True;
                  FImage.Transparent := True;
                  FImage.Height   := FHeight;
                  FImage.Width    := FWidth;
                  FImage.Picture.Assign(FImagem);
                  FImage.Parent   := TTreeWzd(FOwner);
     End;

     TTreeWzd(FOwner).Paint;

     FQuantidade := Value;
  End;
End;

procedure TEtapa.SeTBorderWidth(Value: Integer);
Begin
   FBorderWidth := Value;
   SeTQuantidade(FQuantidade);
End;

procedure TEtapa.SeTLeft(Value: Integer);
Begin
   FLeft := Value;
   SeTQuantidade(FQuantidade);
End;

procedure TEtapa.SeTIdentacao(Value: Integer);
Begin
   FIdentacao := Value;
   SeTQuantidade(FQuantidade);
End;


procedure TEtapa.SeTBorderColor(Value: TColor);
Begin
   FBorderColor := Value;
   SeTQuantidade(FQuantidade);
End;

procedure TEtapa.SeTBrushColor(Value: TColor);
Begin
   FBrushColor := Value;
   SeTQuantidade(FQuantidade);
End;

procedure TEtapa.SetTop(Value: Integer);
Begin
   FTop := Value;
   SeTQuantidade(FQuantidade);
End;

procedure TEtapa.SetEspaco(Value: Integer);
Begin
   FEspaco := Value;
   SeTQuantidade(FQuantidade);
End;

procedure TEtapa.SetHeight(Value: Integer);
Begin
   FHeight := Value;
   SeTQuantidade(FQuantidade);
End;

procedure TEtapa.SetWidth(Value: Integer);
Begin
   FWidth := Value;
   SeTQuantidade(FQuantidade);
End;

procedure TEtapa.SetForma(Value:TShapeType);
Begin
   FForma := Value;
   SeTQuantidade(FQuantidade);
End;

procedure TEtapa.SetLinhaWidth(Value: Integer);
Begin
   FLinhaWidth := Value;
   SeTQuantidade(FQuantidade);
End;

procedure TEtapa.LimpaEtapas;
Var
  X, iCount, iNumCompo: Integer;
Begin
  iCount := 0;

  While iCount <= (FQuantidade + FCompoExtra + (FCaption.Count - 1)) Do
  Begin
     iNumCompo := TTreeWzd(FOwner).ComponentCount -1;

     For x:=0 To iNumCompo Do
         If TTreeWzd(FOwner).Components[x].Tag = 99 Then
         Begin
            TTreeWzd(FOwner).Components[x].Free;
            Break;
         End;

     Inc(iCount);
  End;
End;

procedure TEtapa.SetCaption(Value: TStrings);
begin
  Caption.Assign(Value);
  SeTQuantidade(FQuantidade);
end;

procedure TEtapa.SetImagem(Value: TBitmap);
begin
  Imagem.Assign(Value);
  SeTQuantidade(FQuantidade);
end;

procedure TTreeWzd.Resize;
Begin
  Inherited;
  If (FEtapa <> nil) And (FEtapa.FQuantidade > 0) Then
      FEtapa.SeTQuantidade(FEtapa.FQuantidade);
End;

procedure TEtapa.SetPos(Value: Integer);
Var
  IAuxPos: Integer;
Begin
  IAuxPos := Value;

  If IAuxPos = 0 Then
     IAuxPos := 1;

  If IAuxPos > FQuantidade Then
     FPos := FQuantidade
  Else
   Begin
     FPos := IAuxPos;

     FImage.Top      := FTop + ((FEspaco + FHeight) * (FPos-1));

     If (FPos = 1) Or (FPos = FQuantidade) Then
        FImage.Left   := FLeft
     Else
        FImage.Left   := FIdentacao;
   End;
End;

Procedure TEtapa.Avancar;
Begin
   Pos := Pos + 1;
End;

Procedure TEtapa.Retornar;
Begin
   Pos := Pos - 1;
End;


constructor TEtapa.Create(AOwner: TComponent);
begin
   Inherited Create;
   FOwner        := AOwner;
   FBorderWidth  := 1;
   FLeft         := 5;
   FIdentacao    := 25;
   FTop          := 5;
   FEspaco       := 10;
   FHeight       := 20;
   FWidth        := 20;
   FLinhaWidth   := 1;
   FBorderColor  := ClNavy;
   FBrushColor   := ClYellow;
   FCompoExtra   := 3;
   FCaption      := TStringList.Create;
   FImagem       := TBitmap.Create;
end;

destructor TEtapa.Destroy;
begin
  FQuantidade := 0;
  LimpaEtapas;
  FImagem.Free;
  FCaption.Free;

  inherited;
end;

end.

