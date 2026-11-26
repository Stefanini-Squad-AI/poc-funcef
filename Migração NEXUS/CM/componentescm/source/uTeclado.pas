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
unit uTeclado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FTeclado,
  extctrls, stdctrls, buttons, dbtables;

type
  TMudouValor = procedure (sender: TObject; valor: String) of object;
  TTeclado = class(TComponent)
  private
    { Private declarations }
    FSaida: String;
    FOwner: TComponent;
    FPassWordChar: Char;
    FCaption: TCaption;
    FEditControl: TEdit;
    function ExecuteProcuraDlg(AOwner:TComponent): Boolean;
    procedure SetCaption(const Value: TCaption);
    procedure SetPassWordChar(const Value: Char);
    procedure SetEditControl(const Value: TEdit);
  protected
    { Protected declarations }
    procedure Notification(AComponent: TComponent; Operation: TOperation); Override;    
  public
    { Public declarations }
    function Execute: Boolean;
    property Saida: String read FSaida;
    constructor Create(AOwner: TComponent);override;
  published
    { Published declarations }
    property Caption: TCaption read FCaption write SetCaption;
    property PassWordChar: Char read FPassWordChar write SetPassWordChar default #0;
    property EditControl: TEdit read FEditControl write SetEditControl;
  end;

  TTecladoPesquisa = class(TPanel)
     protected
       procedure CreateWnd; override;
     private
       edValor      : TEdit;
       sbtnSobrenome,
       sbtnNome,
       sQQParteNome : TSpeedButton;

       Acento       : Char;
       FQuery       : TQuery;
       FCaption,
       sTextoPassado: String;
       FOnMudouValor: TMudouValor;
       function  TrataCharEsp(sAnt,sDep:Char):String;
       function  GetQuery: TQuery;
       procedure CriaComponentes;
       procedure SetQuery(valor: TQuery);
       procedure TelaChange(sender: TObject);
       function  GetCaption: String;
       procedure SetCaption(valor: String);

     public
       constructor Create(AOwner: TComponent); override;
       destructor Destroy; override;
       procedure  TeclaClick(Sender: TObject);
       procedure  TeclaSpeedClick(Sender: TObject);
     published
       property Query        : TQuery      read GetQuery write SetQuery;
       property OnMudouValor : TMudouValor read FOnMudouValor write FOnMudouValor;
       property sCaption     : String      read GetCaption    write SetCaption;
   end;


implementation

function TTeclado.Execute: Boolean;
begin
  result := ExecuteProcuraDlg(FOwner);
end;

procedure TTeclado.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);

  if (aComponent = FEditControl) and (Operation = opRemove) then
      FEditControl := nil;
end;


function TTeclado.ExecuteProcuraDlg(AOwner:TComponent): Boolean;
begin
  result := Teclado(Self,FSaida);

  If (Result) And Assigned(FeditControl) Then FeditControl.Text := FSaida;
end;

constructor TTeclado.Create(AOwner: TComponent);
begin
  FOwner := AOwner;
  inherited create(AOwner);

  FCaption := 'Teclado';
end;

constructor TTecladoPesquisa.Create(AOwner: TComponent);
begin
   inherited Create(AOwner);
   Self.Width         := 782;
   Self.Height        := 158;
   Caption            := '';
   BevelOuter         := bvLowered;
   FQuery             := nil;
   CriaComponentes;
   sbtnSobrenome.Down := True;
   FCaption           := 'Sobrenome';
end;

destructor TTecladoPesquisa.Destroy;
begin
   inherited Destroy;
end;


procedure TTecladoPesquisa.CreateWnd;
begin
   inherited CreateWnd;
   Self.Width    := 782;
   Self.Height   := 158;
   Caption       := '';
end;

function TTecladoPesquisa.GetQuery: TQuery;
begin
  Result := FQuery;
end;

procedure  TTecladoPesquisa.SetQuery(valor: TQuery);
begin
  if valor <> nil then
  begin
    FQuery        := valor;
    sTextoPassado := FQuery.Sql.Text;
  end;
end;

function TTecladoPesquisa.GetCaption: String;
begin
  Result    := FCaption;
end;

procedure  TTecladoPesquisa.SetCaption(valor: String);
begin
  FCaption  := valor;
end;

procedure TTecladoPesquisa.CriaComponentes;
var
  pnlBotoes,
  pnlEntrada : TPanel;
  Button1,
  Button2,
  Button3,
  Button4,
  Button5,
  Button6,
  Button7,
  Button8,
  Button9,
  Button10,
  Button11,
  Button12,
  Button13,
  Button14,
  Button15,
  Button16,
  Button17,
  Button18,
  Button19,
  Button20,
  Button21,
  Button22,
  Button23,
  Button24,
  Button25,
  Button26,
  Button27,
  Button28,
  Button29,
  Button30,
  Button31,
  Button32,
  Button33,
  Button34,
  Button35,
  Button36     : TButton;

begin
  pnlEntrada :=  TPanel.Create(Self);
  with pnlEntrada do
  begin
    Parent            := Self;
    Align             := alTop;
    Tag               := 124;
    Left              := 0;
    Top               := 0;
    Width             := 782;
    Height            := 44;
    BevelInner        := bvRaised;
    BevelOuter        := bvLowered;
    Caption           := '';
    TabOrder          := 1;

    sbtnSobrenome := TSpeedButton.Create(Self);
    with sbtnSobrenome do
    begin
      Left            := 447;
      Top             := 6;
      Width           := 110;
      Height          := 34;
      Hint            := '';
      AllowAllUp      := True;
      GroupIndex      := 1;
      Caption         := 'Sobrenome';
      Layout          :=  blGlyphTop;
      NumGlyphs       := 2;
      ParentShowHint  := False;
      Parent          := pnlEntrada;
      ShowHint        := True;
      Spacing         := 0;
      onclick         := TeclaSpeedClick;
    end;
    sbtnNome := TSpeedButton.Create(Self);
    with sbtnNome do
    begin
      Left            := 557;
      Top             := 6;
      Width           := 110;
      Height          := 34;
      Hint            := '';
      AllowAllUp      := True;
      GroupIndex      := 1;
      Caption         := 'Nome';
      Layout          := blGlyphTop;
      NumGlyphs       := 2;
      ParentShowHint  := False;
      Parent          := pnlEntrada;
      ShowHint        := True;
      Spacing         := 0;
      onclick         := TeclaSpeedClick;
    end;
    sQQParteNome := TSpeedButton.Create(Self);
    with sQQParteNome do
    begin
      Left            := 667;
      Top             := 6;
      Width           := 110;
      Height          := 34;
      Hint            := '';
      AllowAllUp      := True;
      GroupIndex      := 1;
      Caption         := 'QQ Parte Nome';
      Layout          := blGlyphTop;
      NumGlyphs       := 2;
      ParentShowHint  := False;
      Parent          := pnlEntrada;
      ShowHint        := True;
      Spacing         := 0;
      onclick         := TeclaSpeedClick;
    end;

    edValor := TEdit.Create(Self);
    with edValor do
    begin
      Left           := 6;
      Top            := 6;
      Width          := 438;
      Height         := 32;
      CharCase       := ecUpperCase;
      Font.Charset   := DEFAULT_CHARSET;
      Font.Color     := clWindowText;
      Font.Height    := -19;
      Font.Name      := 'MS Sans Serif';
      Font.Style     := [];
      ParentFont     := False;
      Parent         := pnlEntrada;
      TabOrder       := 0;
      OnChange       := TelaChange;
      Text           := '';
    end;
  end;

  pnlBotoes := TPanel.Create(Self);
  with pnlBotoes do
  begin
    Parent          := Self;
    Left            := 0;
    Top             := 42;
    Width           := 782;
    Height          := 114;
    Align           := alBottom;
    BevelInner      := bvRaised;
    BevelOuter      := bvLowered;
    Caption         := '';
    Font.Charset    := DEFAULT_CHARSET;
    Font.Color      := clWindowText;
    Font.Height     := -16;
    Font.Name       := 'MS Sans Serif';
    Font.Style      := [];
    ParentFont      := False;
    TabOrder        := 0;

    Button1 := TButton.Create(Self);
    with Button1 do
    begin
      Left          := 170;
      Top           := 76;
      Width         := 60;
      Height        := 35;
      Caption       := 'Z';
      Font.Charset  := DEFAULT_CHARSET;
      Font.Color    := clWindowText;
      Font.Height   := -19;
      Font.Name     := 'MS Sans Serif';
      Font.Style    := [fsBold];
      ParentFont    := False;
      TabOrder      := 0;
      Parent        := pnlBotoes;
      OnClick       := TeclaClick;
    end;
    Button2 := TButton.Create(Self);
    with Button2 do
    begin
      Left          := 230;
      Top           := 76;
      Width         := 60;
      Height        := 35;
      Caption       := 'X';
      Font.Charset  := DEFAULT_CHARSET;
      Font.Color    := clWindowText;
      Font.Height   := -19;
      Font.Name     := 'MS Sans Serif';
      Font.Style    := [fsBold];
      ParentFont    := False;
      TabOrder      := 1;
      Parent        := pnlBotoes;
      OnClick       := TeclaClick;
    end;
    Button3 := TButton.Create(Self);
    with Button3 do
    begin
      Left          := 290;
      Top           := 76;
      Width         := 60;
      Height        := 35;
      Caption       := 'C';
      Font.Charset  := DEFAULT_CHARSET;
      Font.Color    := clWindowText;
      Font.Height   := -19;
      Font.Name     := 'MS Sans Serif';
      Font.Style    := [fsBold];
      ParentFont    := False;
      TabOrder      := 2;
      Parent        := pnlBotoes;
      OnClick       := TeclaClick;
    end;
    Button4 := TButton.Create(Self);
    with Button4 do
    begin
      Left          := 350;
      Top           := 76;
      Width         := 60;
      Height        := 35;
      Caption       := 'V';
      Font.Charset  := DEFAULT_CHARSET;
      Font.Color    := clWindowText;
      Font.Height   := -19;
      Font.Name     := 'MS Sans Serif';
      Font.Style    := [fsBold];
      ParentFont    := False;
      TabOrder      := 3;
      Parent        := pnlBotoes;
      OnClick       := TeclaClick;
    end;
    Button5 := TButton.Create(Self);
    with Button5 do
    begin
      Left          := 410;
      Top           := 76;
      Width         := 60;
      Height        := 35;
      Caption       := 'B';
      Font.Charset  := DEFAULT_CHARSET;
      Font.Color    := clWindowText;
      Font.Height   := -19;
      Font.Name     := 'MS Sans Serif';
      Font.Style    := [fsBold];
      ParentFont    := False;
      TabOrder      := 4;
      Parent        := pnlBotoes;
      OnClick       := TeclaClick;
    end;
    Button6 := TButton.Create(Self);
    with Button6 do
    begin
      Left          := 470;
      Top           := 76;
      Width         := 60;
      Height        := 35;
      Caption       := 'N';
      Font.Charset  := DEFAULT_CHARSET;
      Font.Color    := clWindowText;
      Font.Height   := -19;
      Font.Name     := 'MS Sans Serif';
      Font.Style    := [fsBold];
      ParentFont    := False;
      TabOrder      := 5;
      Parent        := pnlBotoes;
      OnClick       := TeclaClick;
    end;
    Button7 := TButton.Create(Self);
    with Button7 do
    begin
      Left          := 530;
      Top           := 76;
      Width         := 60;
      Height        := 35;
      Caption       := 'M';
      Font.Charset  := DEFAULT_CHARSET;
      Font.Color    := clWindowText;
      Font.Height   := -19;
      Font.Name     := 'MS Sans Serif';
      Font.Style    := [fsBold];
      ParentFont    := False;
      TabOrder      := 6;
      Parent        := pnlBotoes;
      OnClick       := TeclaClick;
    end;
    Button8 := TButton.Create(Self);
    with Button8 do
    begin
      Left          := 80;
      Top           := 2;
      Width         := 60;
      Height        := 35;
      Caption       := 'Q';
      Font.Charset  := DEFAULT_CHARSET;
      Font.Color    := clWindowText;
      Font.Height   := -19;
      Font.Name     := 'MS Sans Serif';
      Font.Style    := [fsBold];
      ParentFont    := False;
      TabOrder      := 7;
      Parent        := pnlBotoes;
      OnClick       := TeclaClick;
    end;
    Button9 := TButton.Create(Self);
    with Button9 do
    begin
      Left          := 140;
      Top           := 2;
      Width         := 60;
      Height        := 35;
      Caption       := 'W';
      Font.Charset  := DEFAULT_CHARSET;
      Font.Color    := clWindowText;
      Font.Height   := -19;
      Font.Name     := 'MS Sans Serif';
      Font.Style    := [fsBold];
      ParentFont    := False;
      TabOrder      := 8;
      Parent        := pnlBotoes;
      OnClick       := TeclaClick;
    end;
    Button10 := TButton.Create(Self);
    with Button10 do
    begin
      Left          := 200;
      Top           := 2;
      Width         := 60;
      Height        := 35;
      Caption       := 'E';
      Font.Charset  := DEFAULT_CHARSET;
      Font.Color    := clWindowText;
      Font.Height   := -19;
      Font.Name     := 'MS Sans Serif';
      Font.Style    := [fsBold];
      ParentFont    := False;
      TabOrder      := 9;
      Parent        := pnlBotoes;
      OnClick       := TeclaClick;
    end;
    Button11 := TButton.Create(Self);
    with Button11 do
    begin
      Left          := 260;
      Top           := 2;
      Width         := 60;
      Height        := 35;
      Caption       := 'R';
      Font.Charset  := DEFAULT_CHARSET;
      Font.Color    := clWindowText;
      Font.Height   := -19;
      Font.Name     := 'MS Sans Serif';
      Font.Style    := [fsBold];
      ParentFont    := False;
      TabOrder      := 10;
      Parent        := pnlBotoes;
      OnClick       := TeclaClick;
    end;
    Button12 := TButton.Create(Self);
    with Button12 do
    begin
      Left          := 320;
      Top           := 2;
      Width         := 60;
      Height        := 35;
      Caption       := 'T';
      Font.Charset  := DEFAULT_CHARSET;
      Font.Color    := clWindowText;
      Font.Height   := -19;
      Font.Name     := 'MS Sans Serif';
      Font.Style    := [fsBold];
      ParentFont    := False;
      TabOrder      := 11;
      Parent        := pnlBotoes;
      OnClick       := TeclaClick;
    end;
    Button13 := TButton.Create(Self);
    with Button13 do
    begin
      Left          := 380;
      Top           := 2;
      Width         := 60;
      Height        := 35;
      Caption       := 'Y';
      Font.Charset  := DEFAULT_CHARSET;
      Font.Color    := clWindowText;
      Font.Height   := -19;
      Font.Name     := 'MS Sans Serif';
      Font.Style    := [fsBold];
      ParentFont    := False;
      TabOrder      := 12;
      Parent        := pnlBotoes;
      OnClick       := TeclaClick;
    end;
    Button14 := TButton.Create(Self);
    with Button14 do
    begin
      Left          := 440;
      Top           := 2;
      Width         := 60;
      Height        := 35;
      Caption       := 'U';
      Font.Charset  := DEFAULT_CHARSET;
      Font.Color    := clWindowText;
      Font.Height   := -19;
      Font.Name     := 'MS Sans Serif';
      Font.Style    := [fsBold];
      ParentFont    := False;
      TabOrder      := 13;
      Parent        := pnlBotoes;
      OnClick       := TeclaClick;
    end;
    Button15 := TButton.Create(Self);
    with Button15 do
    begin
      Left          := 500;
      Top           := 2;
      Width         := 60;
      Height        := 35;
      Caption       := 'I';
      Font.Charset  := DEFAULT_CHARSET;
      Font.Color    := clWindowText;
      Font.Height   := -19;
      Font.Name     := 'MS Sans Serif';
      Font.Style    := [fsBold];
      ParentFont    := False;
      TabOrder      := 14;
      Parent        := pnlBotoes;
      OnClick       := TeclaClick;
    end;
    Button16 := TButton.Create(Self);
    with Button16 do
    begin
      Left          := 560;
      Top           := 2;
      Width         := 60;
      Height        := 35;
      Caption       := 'O';
      Font.Charset  := DEFAULT_CHARSET;
      Font.Color    := clWindowText;
      Font.Height   := -19;
      Font.Name     := 'MS Sans Serif';
      Font.Style    := [fsBold];
      ParentFont    := False;
      TabOrder      := 15;
      Parent        := pnlBotoes;
      OnClick       := TeclaClick;
    end;
    Button17 := TButton.Create(Self);
    with Button17 do
    begin
      Left          := 620;
      Top           := 2;
      Width         := 60;
      Height        := 35;
      Caption       := 'P';
      Font.Charset  := DEFAULT_CHARSET;
      Font.Color    := clWindowText;
      Font.Height   := -19;
      Font.Name     := 'MS Sans Serif';
      Font.Style    := [fsBold];
      ParentFont    := False;
      TabOrder      := 16;
      Parent        := pnlBotoes;
      OnClick       := TeclaClick;
    end;
    Button18 := TButton.Create(Self);
    with Button18 do
    begin
      Left           := 682;
      Top            := 2;
      Width          := 96;
      Height         := 35;
      Caption        := '¬';
      Font.Charset   := SYMBOL_CHARSET;
      Font.Color     := clWindowText;
      Font.Height    := -19;
      Font.Name      := 'Symbol';
      Font.Style     := [fsBold];
      ParentFont     := False;
      TabOrder       := 17;
      Parent         := pnlBotoes;
      OnClick        := TeclaClick;
    end;
    Button19 := TButton.Create(Self);
    with Button19 do
    begin
      Left           := 123;
      Top            := 39;
      Width          := 60;
      Height         := 35;
      Caption        := 'A';
      Font.Charset   := DEFAULT_CHARSET;
      Font.Color     := clWindowText;
      Font.Height    := -19;
      Font.Name      := 'MS Sans Serif';
      Font.Style     := [fsBold];
      ParentFont     := False;
      TabOrder       := 18;
      Parent         := pnlBotoes;
      OnClick        := TeclaClick;
    end;
    Button20 := TButton.Create(Self);
    with Button20 do
    begin
      Left           := 183;
      Top            := 39;
      Width          := 60;
      Height         := 35;
      Caption        := 'S';
      Font.Charset   := DEFAULT_CHARSET;
      Font.Color     := clWindowText;
      Font.Height    := -19;
      Font.Name      := 'MS Sans Serif';
      Font.Style     := [fsBold];
      ParentFont     := False;
      TabOrder       := 19;
      Parent         := pnlBotoes;
      OnClick        := TeclaClick;
    end;
    Button21 := TButton.Create(Self);
    with Button21 do
    begin
      Left           := 243;
      Top            := 39;
      Width          := 60;
      Height         := 35;
      Caption        := 'D';
      Font.Charset   := DEFAULT_CHARSET;
      Font.Color     := clWindowText;
      Font.Height    := -19;
      Font.Name      := 'MS Sans Serif';
      Font.Style     := [fsBold];
      ParentFont     := False;
      TabOrder       := 20;
      Parent         := pnlBotoes;
      OnClick        := TeclaClick;
    end;
    Button22 := TButton.Create(Self);
    with Button22 do
    begin
      Left           := 303;
      Top            := 39;
      Width          := 60;
      Height         := 35;
      Caption        := 'F';
      Font.Charset   := DEFAULT_CHARSET;
      Font.Color     := clWindowText;
      Font.Height    := -19;
      Font.Name      := 'MS Sans Serif';
      Font.Style     := [fsBold];
      ParentFont     := False;
      TabOrder       := 21;
      Parent         := pnlBotoes;
      OnClick        := TeclaClick;
    end;
    Button23 := TButton.Create(Self);
    with Button23 do
    begin
      Left           := 364;
      Top            := 39;
      Width          := 60;
      Height         := 35;
      Caption        := 'G';
      Font.Charset   := DEFAULT_CHARSET;
      Font.Color     := clWindowText;
      Font.Height    := -19;
      Font.Name      := 'MS Sans Serif';
      Font.Style     := [fsBold];
      ParentFont     := False;
      TabOrder       := 22;
      Parent         := pnlBotoes;
      OnClick        := TeclaClick;
    end;
    Button24 := TButton.Create(Self);
    with Button24 do
    begin
      Left           := 424;
      Top            := 39;
      Width          := 60;
      Height         := 35;
      Caption        := 'H';
      Font.Charset   := DEFAULT_CHARSET;
      Font.Color     := clWindowText;
      Font.Height    := -19;
      Font.Name      := 'MS Sans Serif';
      Font.Style     := [fsBold];
      ParentFont     := False;
      TabOrder       := 23;
      Parent         := pnlBotoes;
      OnClick        := TeclaClick;
    end;
    Button25 := TButton.Create(Self);
    with Button25 do
    begin
      Left           := 484;
      Top            := 39;
      Width          := 60;
      Height         := 35;
      Caption        := 'J';
      Font.Charset   := DEFAULT_CHARSET;
      Font.Color     := clWindowText;
      Font.Height    := -19;
      Font.Name      := 'MS Sans Serif';
      Font.Style     := [fsBold];
      ParentFont     := False;
      TabOrder       := 24;
      Parent         := pnlBotoes;
      OnClick        := TeclaClick;
    end;
    Button26 := TButton.Create(Self);
    with Button26 do
    begin
      Left           := 544;
      Top            := 39;
      Width          := 60;
      Height         := 35;
      Caption        := 'K';
      Font.Charset   := DEFAULT_CHARSET;
      Font.Color     := clWindowText;
      Font.Height    := -19;
      Font.Name      := 'MS Sans Serif';
      Font.Style     := [fsBold];
      ParentFont     := False;
      TabOrder       := 25;
      Parent         := pnlBotoes;
      OnClick        := TeclaClick;
    end;
    Button27 := TButton.Create(Self);
    with Button27 do
    begin
      Left           := 604;
      Top            := 39;
      Width          := 60;
      Height         := 35;
      Caption        := 'L';
      Font.Charset   := DEFAULT_CHARSET;
      Font.Color     := clWindowText;
      Font.Height    := -19;
      Font.Name      := 'MS Sans Serif';
      Font.Style     := [fsBold];
      ParentFont     := False;
      TabOrder       := 26;
      Parent         := pnlBotoes;
      OnClick        := TeclaClick;
    end;
    Button28 := TButton.Create(Self);
    with Button28 do
    begin
      Tag            := 34;
      Left           := 657;
      Top            := 76;
      Width          := 60;
      Height         := 35;
      Caption        := #39;
      Font.Charset   := DEFAULT_CHARSET;
      Font.Color     := clWindowText;
      Font.Height    := -19;
      Font.Name      := 'MS Sans Serif';
      Font.Style     := [fsBold];
      ParentFont     := False;
      TabOrder       := 27;
      Parent         := pnlBotoes;
      OnClick        := TeclaClick;
    end;
    Button29 := TButton.Create(Self);
    with Button29 do
    begin
      Tag             := 1;
      Left            := 2;
      Top             := 76;
      Width           := 163;
      Height          := 35;
      Caption         := 'Space';
      Font.Charset    := DEFAULT_CHARSET;
      Font.Color      := clWindowText;
      Font.Height     := -16;
      Font.Name       := 'MS Sans Serif';
      Font.Style      := [fsBold];
      ParentFont      := False;
      TabOrder        := 28;
      Parent          := pnlBotoes;
      OnClick         := TeclaClick;
    end;
    Button30 := TButton.Create(Self);
    with Button30 do
    begin
      Left            := 725;
      Top             := 39;
      Width           := 53;
      Height          := 35;
      Caption         := 'End';
      Font.Charset    := DEFAULT_CHARSET;
      Font.Color      := clWindowText;
      Font.Height     := -16;
      Font.Name       := 'MS Sans Serif';
      Font.Style      := [fsBold];
      ParentFont      := False;
      TabOrder        := 29;
      Parent          := pnlBotoes;
      OnClick         := TeclaClick;
    end;
    Button31 := TButton.Create(Self);
    with Button31 do
    begin
      Left            := 63;
      Top             := 39;
      Width           := 60;
      Height          := 35;
      Caption         := 'Þ';
      Font.Charset    := SYMBOL_CHARSET;
      Font.Color      := clWindowText;
      Font.Height     := -19;
      Font.Name       := 'Symbol';
      Font.Style      := [fsBold];
      ParentFont      := False;
      TabOrder        := 30;
      Parent          := pnlBotoes;
      OnClick         := TeclaClick;
    end;
    Button32 := TButton.Create(Self);
    with Button32 do
    begin
      Left            := 3;
      Top             := 39;
      Width           := 60;
      Height          := 35;
      Caption         := 'Ü';
      Font.Charset    := SYMBOL_CHARSET;
      Font.Color      := clWindowText;
      Font.Height     := -19;
      Font.Name       := 'Symbol';
      Font.Style      := [fsBold];
      ParentFont      := False;
      TabOrder        := 31;
      Parent          := pnlBotoes;
      OnClick         := TeclaClick;
    end;
    Button33 := TButton.Create(Self);
    with Button33 do
    begin
      Left            := 664;
      Top             := 39;
      Width           := 60;
      Height          := 35;
      Caption         := 'Home';
      Font.Charset    := DEFAULT_CHARSET;
      Font.Color      := clWindowText;
      Font.Height     := -16;
      Font.Name       := 'MS Sans Serif';
      Font.Style      := [fsBold];
      ParentFont      := False;
      TabOrder        := 32;
      Parent          := pnlBotoes;
      OnClick         := TeclaClick;
    end;
    Button34 := TButton.Create(Self);
    with Button34 do
    begin
      Left            := 4;
      Top             := 2;
      Width           := 74;
      Height          := 35;
      Caption         := 'Del';
      Font.Charset    := DEFAULT_CHARSET;
      Font.Color      := clWindowText;
      Font.Height     := -19;
      Font.Name       := 'MS Sans Serif';
      Font.Style      := [fsBold];
      ParentFont      := False;
      TabOrder        := 33;
      Parent          := pnlBotoes;
      OnClick         := TeclaClick;
    end;
    Button35 := TButton.Create(Self);
    with Button35 do
    begin
      Tag             := 34;
      Left            := 718;
      Top             := 76;
      Width           := 60;
      Height          := 35;
      Caption         := '~';
      Font.Charset    := DEFAULT_CHARSET;
      Font.Color      := clWindowText;
      Font.Height     := -19;
      Font.Name       := 'MS Sans Serif';
      Font.Style      := [fsBold];
      ParentFont      := False;
      Parent          := pnlBotoes;
      TabOrder        := 34;
      OnClick         := TeclaClick;
    end;
    Button36 := TButton.Create(Self);
    with Button36 do
    begin
      Tag             := 34;
      Left            := 596;
      Top             := 76;
      Width           := 60;
      Height          := 35;
      Caption         := '^';
      Font.Charset    := DEFAULT_CHARSET;
      Font.Color      := clWindowText;
      Font.Height     := -19;
      Font.Name       := 'MS Sans Serif';
      Font.Style      := [fsBold];
      ParentFont      := False;
      TabOrder        := 35;
      Parent          := pnlBotoes;
      OnClick         := TeclaClick;
    end;
  end;

end;

procedure TTecladoPesquisa.TeclaClick(Sender: TObject);
var
  s, c     : String;
  i,
  SelLength: Byte;
begin
  with ( Sender as TButton ) do
  begin
    if Caption = 'Home' then
    begin
      edValor.SetFocus;
      edValor.SelStart := 0;
    end
    else if Caption = 'End' then
    begin
      edValor.SetFocus;
      edValor.SelStart := Length(edValor.Text)+1;
    end
    else if Caption = 'Del' then
    begin
      s := edValor.Text;
      i := edValor.SelStart;
      if i < Length(edValor.Text) then
      begin
        SelLength := edValor.SelLength;
        if SelLength = 0 then
          Delete(s,i+1,1)
        else Delete(s,i+1,SelLength);
        edValor.Text := s;
        edValor.SetFocus;
        if i = 0 then edValor.SelStart := 0
        else
        edValor.SelStart := i;
      end
      else
        begin
          edValor.SetFocus;
          edValor.SelStart := i;
        end;
    end
    else if Caption = 'Ü' then
    begin
      i := edValor.SelStart;
      edValor.SetFocus;
      if i > 0 then
        edValor.SelStart := i - 1
      else edValor.SelStart := 0;
    end
    else if Caption = 'Þ' then
    begin
      i := edValor.SelStart;
      edValor.SetFocus;
      if i < Length(edValor.Text) then
        edValor.SelStart := i + 1
      else edValor.SelStart := Length(edValor.Text);
    end
    else if Caption = '¬' then
    begin
      Acento := #0;
      s := edValor.Text;
      i := edValor.SelStart;
      SelLength := edValor.SelLength;
      if SelLength = 0 then
        Delete(s,i,1)
      else Delete(s,i+1,SelLength);
      edValor.Text := s;
      edValor.SetFocus;
      if i = 0 then edValor.SelStart := 0
      else
      if SelLength > 0 then
        edValor.SelStart := i
      else edValor.SelStart := i - 1;

    end
    else if (Caption[1] in ['A'..'Z']) or (Caption[1] in ['^',#39,'~']) or (Caption = 'Space') then
    begin
      SelLength := edValor.SelLength;
      if TButton(Sender).Tag = 1 then
      begin
        if Acento <> '' then
        begin
          c := Acento;
          Acento := #0;
        end
        else c := ' ';
      end
      else
      begin
        c := Caption;

        if (Acento <> '') and (pos(c,Vogais) > 0) then
        begin
           c := TrataCharEsp(Acento,c[1]);
           Acento := #0;
        end
        else
        begin
          if (Acento <> '') then
          begin
            c := Acento + c;
            Acento := #0;
          end
          else
            Case ord(c[1]) of
              39,96,94,126,34:begin
                                Acento := c[1];
                                exit;
                              end;
             end;
         end;
      end;
      s := edValor.Text;
      i := edValor.SelStart;
      if SelLength > 0 then
        Delete(s,i+1,SelLength);

      if i = 0 then
        s := c+s
      else
      begin
        if i > length(s) then
          s := s + c
        else
        begin
          s := copy(s,1,i)+c+copy(s,i+1,length(s));
        end;
      end;
      edValor.SetFocus;
      edValor.Text      := s;
      edValor.SelStart := i + 1;
    end
  end;
end;

procedure TTecladoPesquisa.TeclaSpeedClick(Sender: TObject);
begin
  with ( Sender as TSpeedButton ) do
  begin
    FCaption      := Caption;
    if (Sender as TSpeedButton = sbtnNome) or ( Sender as TSpeedButton = sbtnSobrenome) then
      edValor.Text  := '';
    TelaChange(Self);
  end;

end;

function TTecladoPesquisa.TrataCharEsp(sAnt,sDep:Char):String;
var lin: Byte;
    Achou: Boolean;
begin
  result := sDep;
  case ord(sAnt) of
   39,96,94,126,34:begin
                     if pos(sDep,Vogais) > 0 then
                     begin
                       lin := 1;
                       Achou := False;
                       while (lin <= 52) and not (Achou) do
                         if (VetAcento[lin,1] = sAnt) and (VetAcento[lin,2] = sDep) then
                         begin
                           result := VetAcento[lin,3];
                           Achou := True;
                         end
                         else inc(lin);
                     end;
                   end;
   end;
end;

procedure  TTecladoPesquisa.TelaChange(Sender: TObject);
begin
  if Assigned(FOnMudouValor) then
    FOnMudouValor(edValor,edValor.Text);
end;

procedure TTeclado.SetCaption(const Value: TCaption);
begin
  FCaption := Value;
end;

procedure TTeclado.SetPassWordChar(const Value: Char);
begin
  FPassWordChar := Value;
end;

procedure TTeclado.SetEditControl(const Value: TEdit);
begin
  FEditControl := Value;
end;

end.
