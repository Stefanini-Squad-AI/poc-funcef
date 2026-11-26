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
unit MskEdDlg;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Mask, Buttons;

type
  TcmMaskEditDlg = class(TMaskEdit)
  private
    FButton: TSpeedButton;
    FOnBtnClick: TNotifyEvent;

    function GetMinHeight: Integer;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;

    procedure BtnClick(Sender: TObject);

  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;

    procedure SetBtnGlyph(Glyph: TBitmap);
    function GetBtnGlyph: TBitmap;

    procedure SetBtnNumGlyphs(NumGlyphs: TNumGlyphs);
    function GetBtnNumGlyphs: TNumGlyphs;

    procedure SetBtnWidth(w: Integer);
    function GetBtnWidth: Integer;

    procedure SetOnBtnMouseDown(OnBtnMouseDown: TMouseEvent);
    function GetOnBtnMouseDown: TMouseEvent;

    procedure SetOnBtnMouseUp(OnBtnMouseUp: TMouseEvent);
    function GetOnBtnMouseUp: TMouseEvent;

    procedure KeyDown(var Key: Word; Shift: TShiftState); override;

  public
    procedure SetEditRect;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    property Button: TSpeedButton read FButton;

  published
    property OnBtnClick: TNotifyEvent read FOnBtnClick write FOnBtnClick;
    property OnBtnMouseDown: TMouseEvent read GetOnBtnMouseDown write SetOnBtnMouseDown;
    property OnBtnMouseUp: TMouseEvent read GetOnBtnMouseUp write SetOnBtnMouseUp;
    property BtnGlyph: TBitmap read GetBtnGlyph write SetBtnGlyph;
    property BtnNumGlyphs: TNumGlyphs read GetBtnNumGlyphs write SetBtnNumGlyphs;
    property BtnWidth: Integer read GetBtnWidth write SetBtnWidth;
  end;

implementation

{ TcmMaskEditDlg }

procedure TcmMaskEditDlg.WMPaint(var Message: TWMPaint);
begin
   inherited;
   SetEditRect;
end;

procedure TcmMaskEditDlg.BtnClick(Sender: TObject);
begin
   FButton.Down := True;
   if Assigned(FOnBtnClick) then FOnBtnClick(Sender);
   FButton.Down := False;
   SetFocus;
   SelectAll;
end;

procedure TcmMaskEditDlg.SetBtnGlyph(Glyph: TBitmap);
begin
   FButton.Glyph := Glyph;
end;

function TcmMaskEditDlg.GetBtnGlyph: TBitmap;
begin
   Result := FButton.Glyph;
end;

procedure TcmMaskEditDlg.SetBtnNumGlyphs(NumGlyphs: TNumGlyphs);
begin
   FButton.NumGlyphs := NumGlyphs;
end;

function TcmMaskEditDlg.GetBtnNumGlyphs: TNumGlyphs;
begin
   Result := FButton.NumGlyphs;
end;

procedure TcmMaskEditDlg.SetBtnWidth(w: Integer);
begin
   FButton.Width := w;

{$IFDEF WIN32}
    if NewStyleControls then
       FButton.SetBounds (Width - FButton.Width - 4, 0, FButton.Width, Height - 4)
    else
       FButton.SetBounds (Width - FButton.Width, 0, FButton.Width, Height);
{$ELSE}
    if NewStyleControls then
       FButton.SetBounds (Width - FButton.Width - 2, 2, FButton.Width, Height - 4)
    else
       FButton.SetBounds (Width - FButton.Width, 0, FButton.Width, Height);
{$ENDIF}

   SetEditRect;
end;

function TcmMaskEditDlg.GetBtnWidth: Integer;
begin
   Result := FButton.Width;
end;

procedure TcmMaskEditDlg.SetOnBtnMouseDown(OnBtnMouseDown: TMouseEvent);
begin
   FButton.OnMouseDown := OnBtnMouseDown;
end;

function TcmMaskEditDlg.GetOnBtnMouseDown: TMouseEvent;
begin
   Result := FButton.OnMouseDown;
end;

procedure TcmMaskEditDlg.SetOnBtnMouseUp(OnBtnMouseUp: TMouseEvent);
begin
   FButton.OnMouseUp := OnBtnMouseUp;
end;

function TcmMaskEditDlg.GetOnBtnMouseUp: TMouseEvent;
begin
   Result := FButton.OnMouseUp;
end;

procedure TcmMaskEditDlg.KeyDown(var Key: Word; Shift: TShiftState);
var
   FButtonOnClick: TNotifyEvent;

begin
   if Key in [VK_UP, VK_DOWN]
   then begin
         FButtonOnClick := FButton.OnClick;
         if Assigned(FButtonOnClick) then FButton.OnClick(Self);
        end
   else inherited KeyDown(Key, Shift);
end;

procedure TcmMaskEditDlg.CreateWnd;
begin
  inherited CreateWnd;
  SetEditRect;
end;

constructor TcmMaskEditDlg.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle - [csSetCaption];
  FButton := TSpeedButton.Create (Self);
  FButton.Width := 17;
  FButton.Height := 15;
  FButton.Visible := True;
  FButton.GroupIndex := 1;
  FButton.Parent := Self;
  FButton.Cursor := crArrow;
  FButton.AllowAllUp := True;
  FButton.OnClick := BtnClick;
end;

destructor TcmMaskEditDlg.Destroy;
begin
  FButton.Free;

  inherited Destroy;
end;

procedure TcmMaskEditDlg.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);

  Params.Style := Params.Style or ES_MULTILINE or WS_CLIPCHILDREN;
end;

procedure TcmMaskEditDlg.SetEditRect;
var
  Loc: TRect;

begin
  SendMessage(Handle, EM_GETRECT, 0, LongInt(@Loc));
  Loc.Bottom := Height + 1;
  if NewStyleControls
     then Loc.Right := ClientWidth - FButton.Width - 4
     else Loc.Right := ClientWidth - FButton.Width - 2;
  Loc.Top := 0;
  Loc.Left := 0;
  SendMessage(Handle, EM_SETRECTNP, 0, LongInt(@Loc));
  SendMessage(Handle, EM_GETRECT, 0, LongInt(@Loc));
end;

procedure TcmMaskEditDlg.WMSize(var Message: TWMSize);
var

  MinHeight: Integer;
  FBWidth : integer;
begin
  inherited;
  MinHeight := GetMinHeight;
    { text edit bug: if size to less than minheight, then edit ctrl does
      not display the text }
  if Height < MinHeight then
    Height := MinHeight
  else if FButton <> nil then
  begin
    FBWidth := FButton.Width;

{$IFDEF WIN32}
   if NewStyleControls then
       FButton.SetBounds (Width - FButton.Width - 4, 0, FBWidth, Height-4)
    else
       FButton.SetBounds (Width - FButton.Width, 0, FBWidth, Height);
{$ELSE}
   if NewStyleControls then
       FButton.SetBounds (Width - FButton.Width - 2, 2, FBWidth, Height - 4)
    else
       FButton.SetBounds (Width - FButton.Width, 0, FBWidth, Height);
{$ENDIF}
    FButton.Width := FBWidth;
    SetEditRect;
  end;
end;

function TcmMaskEditDlg.GetMinHeight: Integer;
var
  DC: HDC;
  SaveFont: HFont;
  I: Integer;
  SysMetrics, Metrics: TTextMetric;

begin
  DC := GetDC(0);
  GetTextMetrics(DC, SysMetrics);
  SaveFont := SelectObject(DC, Font.Handle);
  GetTextMetrics(DC, Metrics);
  SelectObject(DC, SaveFont);
  ReleaseDC(0, DC);
  I := SysMetrics.tmHeight;
  if I > Metrics.tmHeight then I := Metrics.tmHeight;
  Result := Metrics.tmHeight + I div 4 + GetSystemMetrics(SM_CYBORDER) * 2 {4} + 1;
end;

end.
