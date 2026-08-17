unit QExport3Graphics;

{$I VerCtrl.inc}

interface

uses Classes;

{$IFDEF NOGUI}
type
  TFontCharset = 0..255;
  TFontName = string;
  TFontStyle = (fsBold, fsItalic, fsUnderline, fsStrikeOut);
  TFontStyles = set of TFontStyle;
  TColor = -$7FFFFFFF-1..$7FFFFFFF;
  TFont = class(TPersistent)
  private
    FFontStyle: TFontStyles;
    FSize: integer;
    FColor: TColor;
    FCharset: TFontCharSet;
    FName: TFontName;
  public
    procedure Assign(Source: TPersistent); override;

    property Style: TFontStyles read FFontStyle write FFontStyle;
    property Size: integer read FSize write FSize;
    property Color: TColor read FColor write FColor;
    property Charset: TFontCharSet read FCharset write FCharSet;
    property Name: TFontName read FName write FName;
  end;

const
  { Raw rgb values }
  clBlack = TColor($000000);
  clMaroon = TColor($000080);
  clGreen = TColor($008000);
  clOlive = TColor($008080);
  clNavy = TColor($800000);
  clPurple = TColor($800080);
  clTeal = TColor($808000);
  clGray = TColor($808080);
  clSilver = TColor($C0C0C0);
  clRed = TColor($0000FF);
  clLime = TColor($00FF00);
  clYellow = TColor($00FFFF);
  clBlue = TColor($FF0000);
  clFuchsia = TColor($FF00FF);
  clAqua = TColor($FFFF00);
  clLtGray = TColor($C0C0C0);
  clDkGray = TColor($808080);
  clWhite = TColor($FFFFFF);
  clNone = TColor($1FFFFFFF);
  clDefault = TColor($20000000);

  { Base, mapped, pseudo, rgb values }
  clForeground = TColor(-1);
  clButton = TColor(-2);
  clLight = TColor(-3);
  clMidlight = TColor(-4);
  clDark = TColor(-5);
  clMid = TColor(-6);
  clText = TColor(-7);
  clBrightText = TColor(-8);
  clButtonText = TColor(-9);
  clBase = TColor(-10);
  clBackground = TColor(-11);
  clShadow = TColor(-12);
  clHighlight = TColor(-13);
  clHighlightedText = TColor(-14);

  { Mapped role offsets }
  cloNormal = 32;
  cloDisabled = 64;
  cloActive = 96;

  { Normal, mapped, pseudo, rgb values }
  clNormalForeground = TColor(clForeground - cloNormal);
  clNormalButton = TColor(clButton - cloNormal);
  clNormalLight = TColor(clLight - cloNormal);
  clNormalMidlight = TColor(clMidlight - cloNormal);
  clNormalDark = TColor(clDark - cloNormal);
  clNormalMid = TColor(clMid - cloNormal);
  clNormalText = TColor(clText - cloNormal);
  clNormalBrightText = TColor(clBrightText - cloNormal);
  clNormalButtonText = TColor(clButtonText - cloNormal);
  clNormalBase = TColor(clBase - cloNormal);
  clNormalBackground = TColor(clBackground - cloNormal);
  clNormalShadow = TColor(clShadow - cloNormal);
  clNormalHighlight = TColor(clHighlight - cloNormal);
  clNormalHighlightedText = TColor(clHighlightedText - cloNormal);

  { Disabled, mapped, pseudo, rgb values }
  clDisabledForeground = TColor(clForeground - cloDisabled);
  clDisabledButton = TColor(clButton - cloDisabled);
  clDisabledLight = TColor(clLight - cloDisabled);
  clDisabledMidlight = TColor(clMidlight - cloDisabled);
  clDisabledDark = TColor(clDark - cloDisabled);
  clDisabledMid = TColor(clMid - cloDisabled);
  clDisabledText = TColor(clText - cloDisabled);
  clDisabledBrightText = TColor(clBrightText - cloDisabled);
  clDisabledButtonText = TColor(clButtonText - cloDisabled);
  clDisabledBase = TColor(clBase - cloDisabled);
  clDisabledBackground = TColor(clBackground - cloDisabled);
  clDisabledShadow = TColor(clShadow - cloDisabled);
  clDisabledHighlight = TColor(clHighlight - cloDisabled);
  clDisabledHighlightedText = TColor(clHighlightedText - cloDisabled);

  { Active, mapped, pseudo, rgb values }
  clActiveForeground = TColor(clForeground - cloActive);
  clActiveButton = TColor(clButton - cloActive);
  clActiveLight = TColor(clLight - cloActive);
  clActiveMidlight = TColor(clMidlight - cloActive);
  clActiveDark = TColor(clDark - cloActive);
  clActiveMid = TColor(clMid - cloActive);
  clActiveText = TColor(clText - cloActive);
  clActiveBrightText = TColor(clBrightText - cloActive);
  clActiveButtonText = TColor(clButtonText - cloActive);
  clActiveBase = TColor(clBase - cloActive);
  clActiveBackground = TColor(clBackground - cloActive);
  clActiveShadow = TColor(clShadow - cloActive);
  clActiveHighlight = TColor(clHighlight - cloActive);
  clActiveHighlightedText = TColor(clHighlightedText - cloActive);

  clFirstSpecialColor = clActiveHighlightedText;

  { Compatiblity colors }
  clScrollBar = clButton;
  clActiveCaption = clActiveHighlightedText;
  clInactiveCaption = clDisabledHighlightedText;
  clMenu = clMid;
  clWindow = clBase;
  clWindowFrame = clHighlight;
  clMenuText = clButtonText;
  clWindowText = clText;
  clCaptionText = clHighlightedText;
  clActiveBorder = clActiveHighlight;
  clInactiveBorder = clDisabledHighlight;
  clAppWorkSpace = clMid;
  clBtnFace = clButton;
  clBtnShadow = clDark;
  clGrayText = clLight;
  clBtnText = clButtonText;
  clInactiveCaptionText = clDisabledHighlightedText;
  clBtnHighlight = clActiveLight;
  cl3DDkShadow = clMid;
  cl3DLight = clMidLight;
  clInfoText = clText;
  clInfoBk = TColor($E1FFFF);
  clHighlightText = clHighlightedText;

{$IFDEF MSWINDOWS}
  clMask = clWhite;
  clDontMask = clBlack;
{$ENDIF}

const
  Colors: array[0..95] of TIdentMapEntry = (
    (Value: clBlack; Name: 'clBlack'),
    (Value: clMaroon; Name: 'clMaroon'),
    (Value: clGreen; Name: 'clGreen'),
    (Value: clOlive; Name: 'clOlive'),
    (Value: clNavy; Name: 'clNavy'),
    (Value: clPurple; Name: 'clPurple'),
    (Value: clTeal; Name: 'clTeal'),
    (Value: clGray; Name: 'clGray'),
    (Value: clSilver; Name: 'clSilver'),
    (Value: clRed; Name: 'clRed'),
    (Value: clLime; Name: 'clLime'),
    (Value: clYellow; Name: 'clYellow'),
    (Value: clBlue; Name: 'clBlue'),
    (Value: clFuchsia; Name: 'clFuchsia'),
    (Value: clAqua; Name: 'clAqua'),
    (Value: clWhite; Name: 'clWhite'),
    (Value: clNone; Name: 'clNone'),
    (Value: clBackground; Name: 'clBackground'),
    (Value: clHighlight; Name: 'clHighlight'),
    (Value: clHighlightText; Name: 'clHighlightText'),
    (Value: clForeground; Name: 'clForeground'),
    (Value: clButton; Name: 'clButton'),
    (Value: clLight; Name: 'clLight'),
    (Value: clMidlight; Name: 'clMidlight'),
    (Value: clDark; Name: 'clDark'),
    (Value: clMid; Name: 'clMid'),
    (Value: clText; Name: 'clText'),
    (Value: clBrightText; Name: 'clBrightText'),
    (Value: clButtonText; Name: 'clButtonText'),
    (Value: clBase; Name: 'clBase'),
    (Value: clShadow; Name: 'clShadow'),
    (Value: clNormalForeground; Name: 'clNormalForeground'),
    (Value: clNormalButton; Name: 'clNormalButton'),
    (Value: clNormalLight; Name: 'clNormalLight'),
    (Value: clNormalMidlight; Name: 'clNormalMidlight'),
    (Value: clNormalDark; Name: 'clNormalDark'),
    (Value: clNormalMid; Name: 'clNormalMid'),
    (Value: clNormalText; Name: 'clNormalText'),
    (Value: clNormalBrightText; Name: 'clNormalBrightText'),
    (Value: clNormalButtonText; Name: 'clNormalButtonText'),
    (Value: clNormalBase; Name: 'clNormalBase'),
    (Value: clNormalBackground; Name: 'clNormalBackground'),
    (Value: clNormalShadow; Name: 'clNormalShadow'),
    (Value: clNormalHighlight; Name: 'clNormalHighlight'),
    (Value: clNormalHighlightedText; Name: 'clNormalHighlightedText'),
    (Value: clDisabledForeground; Name: 'clDisabledForeground'),
    (Value: clDisabledButton; Name: 'clDisabledButton'),
    (Value: clDisabledLight; Name: 'clDisabledLight'),
    (Value: clDisabledMidlight; Name: 'clDisabledMidlight'),
    (Value: clDisabledDark; Name: 'clDisabledDark'),
    (Value: clDisabledMid; Name: 'clDisabledMid'),
    (Value: clDisabledText; Name: 'clDisabledText'),
    (Value: clDisabledBrightText; Name: 'clDisabledBrightText'),
    (Value: clDisabledButtonText; Name: 'clDisabledButtonText'),
    (Value: clDisabledBase; Name: 'clDisabledBase'),
    (Value: clDisabledBackground; Name: 'clDisabledBackground'),
    (Value: clDisabledShadow; Name: 'clDisabledShadow'),
    (Value: clDisabledHighlight; Name: 'clDisabledHighlight'),
    (Value: clDisabledHighlightedText; Name: 'clDisabledHighlightedText'),
    (Value: clActiveForeground; Name: 'clActiveForeground'),
    (Value: clActiveButton; Name: 'clActiveButton'),
    (Value: clActiveLight; Name: 'clActiveLight'),
    (Value: clActiveMidlight; Name: 'clActiveMidlight'),
    (Value: clActiveDark; Name: 'clActiveDark'),
    (Value: clActiveMid; Name: 'clActiveMid'),
    (Value: clActiveText; Name: 'clActiveText'),
    (Value: clActiveBrightText; Name: 'clActiveBrightText'),
    (Value: clActiveButtonText; Name: 'clActiveButtonText'),
    (Value: clActiveBase; Name: 'clActiveBase'),
    (Value: clActiveBackground; Name: 'clActiveBackground'),
    (Value: clActiveShadow; Name: 'clActiveShadow'),
    (Value: clActiveHighlight; Name: 'clActiveHighlight'),
    (Value: clActiveHighlightedText; Name: 'clActiveHighlightedText'),
    { compatibility values not shown in Object Inspector }
    (Value: clScrollBar; Name: 'clScrollBar'),
    (Value: clActiveCaption; Name: 'clActiveCaption'),
    (Value: clInactiveCaption; Name: 'clInactiveCaption'),
    (Value: clMenu; Name: 'clMenu'),
    (Value: clWindow; Name: 'clWindow'),
    (Value: clWindowFrame; Name: 'clWindowFrame'),
    (Value: clMenuText; Name: 'clMenuText'),
    (Value: clWindowText; Name: 'clWindowText'),
    (Value: clCaptionText; Name: 'clCaptionText'),
    (Value: clActiveBorder; Name: 'clActiveBorder'),
    (Value: clInactiveBorder; Name: 'clInactiveBorder'),
    (Value: clAppWorkSpace; Name: 'clAppWorkSpace'),
    (Value: clBtnFace; Name: 'clBtnFace'),
    (Value: clBtnShadow; Name: 'clBtnShadow'),
    (Value: clGrayText; Name: 'clGrayText'),
    (Value: clBtnText; Name: 'clBtnText'),
    (Value: clInactiveCaptionText; Name: 'clInactiveCaptionText'),
    (Value: clBtnHighlight; Name: 'clBtnHighlight'),
    (Value: cl3DDkShadow; Name: 'cl3DDkShadow'),
    (Value: cl3DLight; Name: 'cl3DLight'),
    (Value: clInfoText; Name: 'clInfoText'),
    (Value: clInfoBk; Name: 'clInfoBk'),
    (Value: clHighlightedText; Name: 'clHighlightedText'));

const
  {$EXTERNALSYM VK_LBUTTON}
  VK_LBUTTON = 1;
  {$EXTERNALSYM VK_RBUTTON}
  VK_RBUTTON = 2;
  {$EXTERNALSYM VK_CANCEL}
  VK_CANCEL = 3;
  {$EXTERNALSYM VK_MBUTTON}
  VK_MBUTTON = 4;  { NOT contiguous with L & RBUTTON }
  {$EXTERNALSYM VK_BACK}
  VK_BACK = 8;
  {$EXTERNALSYM VK_TAB}
  VK_TAB = 9;
  {$EXTERNALSYM VK_CLEAR}
  VK_CLEAR = 12;
  {$EXTERNALSYM VK_RETURN}
  VK_RETURN = 13;
  {$EXTERNALSYM VK_SHIFT}
  VK_SHIFT = $10;
  {$EXTERNALSYM VK_CONTROL}
  VK_CONTROL = 17;
  {$EXTERNALSYM VK_MENU}
  VK_MENU = 18;
  {$EXTERNALSYM VK_PAUSE}
  VK_PAUSE = 19;
  {$EXTERNALSYM VK_CAPITAL}
  VK_CAPITAL = 20;
  {$EXTERNALSYM VK_KANA }
  VK_KANA = 21;
  {$EXTERNALSYM VK_HANGUL }
  VK_HANGUL = 21;
  {$EXTERNALSYM VK_JUNJA }
  VK_JUNJA = 23;
  {$EXTERNALSYM VK_FINAL }
  VK_FINAL = 24;
  {$EXTERNALSYM VK_HANJA }
  VK_HANJA = 25;
  {$EXTERNALSYM VK_KANJI }
  VK_KANJI = 25;
  {$EXTERNALSYM VK_CONVERT }
  VK_CONVERT = 28;
  {$EXTERNALSYM VK_NONCONVERT }
  VK_NONCONVERT = 29;
  {$EXTERNALSYM VK_ACCEPT }
  VK_ACCEPT = 30;
  {$EXTERNALSYM VK_MODECHANGE }
  VK_MODECHANGE = 31;
  {$EXTERNALSYM VK_ESCAPE}
  VK_ESCAPE = 27;
  {$EXTERNALSYM VK_SPACE}
  VK_SPACE = $20;
  {$EXTERNALSYM VK_PRIOR}
  VK_PRIOR = 33;
  {$EXTERNALSYM VK_NEXT}
  VK_NEXT = 34;
  {$EXTERNALSYM VK_END}
  VK_END = 35;
  {$EXTERNALSYM VK_HOME}
  VK_HOME = 36;
  {$EXTERNALSYM VK_LEFT}
  VK_LEFT = 37;
  {$EXTERNALSYM VK_UP}
  VK_UP = 38;
  {$EXTERNALSYM VK_RIGHT}
  VK_RIGHT = 39;
  {$EXTERNALSYM VK_DOWN}
  VK_DOWN = 40;
  {$EXTERNALSYM VK_SELECT}
  VK_SELECT = 41;
  {$EXTERNALSYM VK_PRINT}
  VK_PRINT = 42;
  {$EXTERNALSYM VK_EXECUTE}
  VK_EXECUTE = 43;
  {$EXTERNALSYM VK_SNAPSHOT}
  VK_SNAPSHOT = 44;
  {$EXTERNALSYM VK_INSERT}
  VK_INSERT = 45;
  {$EXTERNALSYM VK_DELETE}
  VK_DELETE = 46;
  {$EXTERNALSYM VK_HELP}
  VK_HELP = 47;
{ VK_0 thru VK_9 are the same as ASCII '0' thru '9' ($30 - $39) }
{ VK_A thru VK_Z are the same as ASCII 'A' thru 'Z' ($41 - $5A) }
  {$EXTERNALSYM VK_LWIN}
  VK_LWIN = 91;
  {$EXTERNALSYM VK_RWIN}
  VK_RWIN = 92;
  {$EXTERNALSYM VK_APPS}
  VK_APPS = 93;
  {$EXTERNALSYM VK_NUMPAD0}
  VK_NUMPAD0 = 96;
  {$EXTERNALSYM VK_NUMPAD1}
  VK_NUMPAD1 = 97;
  {$EXTERNALSYM VK_NUMPAD2}
  VK_NUMPAD2 = 98;
  {$EXTERNALSYM VK_NUMPAD3}
  VK_NUMPAD3 = 99;
  {$EXTERNALSYM VK_NUMPAD4}
  VK_NUMPAD4 = 100;
  {$EXTERNALSYM VK_NUMPAD5}
  VK_NUMPAD5 = 101;
  {$EXTERNALSYM VK_NUMPAD6}
  VK_NUMPAD6 = 102;
  {$EXTERNALSYM VK_NUMPAD7}
  VK_NUMPAD7 = 103;
  {$EXTERNALSYM VK_NUMPAD8}
  VK_NUMPAD8 = 104;
  {$EXTERNALSYM VK_NUMPAD9}
  VK_NUMPAD9 = 105;
  {$EXTERNALSYM VK_MULTIPLY}
  VK_MULTIPLY = 106;
  {$EXTERNALSYM VK_ADD}
  VK_ADD = 107;
  {$EXTERNALSYM VK_SEPARATOR}
  VK_SEPARATOR = 108;
  {$EXTERNALSYM VK_SUBTRACT}
  VK_SUBTRACT = 109;
  {$EXTERNALSYM VK_DECIMAL}
  VK_DECIMAL = 110;
  {$EXTERNALSYM VK_DIVIDE}
  VK_DIVIDE = 111;
  {$EXTERNALSYM VK_F1}
  VK_F1 = 112;
  {$EXTERNALSYM VK_F2}
  VK_F2 = 113;
  {$EXTERNALSYM VK_F3}
  VK_F3 = 114;
  {$EXTERNALSYM VK_F4}
  VK_F4 = 115;
  {$EXTERNALSYM VK_F5}
  VK_F5 = 116;
  {$EXTERNALSYM VK_F6}
  VK_F6 = 117;
  {$EXTERNALSYM VK_F7}
  VK_F7 = 118;
  {$EXTERNALSYM VK_F8}
  VK_F8 = 119;
  {$EXTERNALSYM VK_F9}
  VK_F9 = 120;
  {$EXTERNALSYM VK_F10}
  VK_F10 = 121;
  {$EXTERNALSYM VK_F11}
  VK_F11 = 122;
  {$EXTERNALSYM VK_F12}
  VK_F12 = 123;
  {$EXTERNALSYM VK_F13}
  VK_F13 = 124;
  {$EXTERNALSYM VK_F14}
  VK_F14 = 125;
  {$EXTERNALSYM VK_F15}
  VK_F15 = 126;
  {$EXTERNALSYM VK_F16}
  VK_F16 = 127;
  {$EXTERNALSYM VK_F17}
  VK_F17 = 128;
  {$EXTERNALSYM VK_F18}
  VK_F18 = 129;
  {$EXTERNALSYM VK_F19}
  VK_F19 = 130;
  {$EXTERNALSYM VK_F20}
  VK_F20 = 131;
  {$EXTERNALSYM VK_F21}
  VK_F21 = 132;
  {$EXTERNALSYM VK_F22}
  VK_F22 = 133;
  {$EXTERNALSYM VK_F23}
  VK_F23 = 134;
  {$EXTERNALSYM VK_F24}
  VK_F24 = 135;
  {$EXTERNALSYM VK_NUMLOCK}
  VK_NUMLOCK = 144;
  {$EXTERNALSYM VK_SCROLL}
  VK_SCROLL = 145;
{ VK_L & VK_R - left and right Alt, Ctrl and Shift virtual keys.
  Used only as parameters to GetAsyncKeyState() and GetKeyState().
  No other API or message will distinguish left and right keys in this way. }
  {$EXTERNALSYM VK_LSHIFT}
  VK_LSHIFT = 160;
  {$EXTERNALSYM VK_RSHIFT}
  VK_RSHIFT = 161;
  {$EXTERNALSYM VK_LCONTROL}
  VK_LCONTROL = 162;
  {$EXTERNALSYM VK_RCONTROL}
  VK_RCONTROL = 163;
  {$EXTERNALSYM VK_LMENU}
  VK_LMENU = 164;
  {$EXTERNALSYM VK_RMENU}
  VK_RMENU = 165;
  {$EXTERNALSYM VK_PROCESSKEY}
  VK_PROCESSKEY = 229;
  {$EXTERNALSYM VK_ATTN}
  VK_ATTN = 246;
  {$EXTERNALSYM VK_CRSEL}
  VK_CRSEL = 247;
  {$EXTERNALSYM VK_EXSEL}
  VK_EXSEL = 248;
  {$EXTERNALSYM VK_EREOF}
  VK_EREOF = 249;
  {$EXTERNALSYM VK_PLAY}
  VK_PLAY = 250;
  {$EXTERNALSYM VK_ZOOM}
  VK_ZOOM = 251;
  {$EXTERNALSYM VK_NONAME}
  VK_NONAME = 252;
  {$EXTERNALSYM VK_PA1}
  VK_PA1 = 253;
  {$EXTERNALSYM VK_OEM_CLEAR}
  VK_OEM_CLEAR = 254;

  function ColorToString(Color: TColor): string;
  function StringToColor(const S: string): TColor;
  function ColorToIdent(Color: Longint; var Ident: string): Boolean;
  function IdentToColor(const Ident: string; var Color: Longint): Boolean;
{$ENDIF}

implementation

uses SysUtils;

{$IFDEF NOGUI}
function ColorToString(Color: TColor): string;
begin
  if not ColorToIdent(Color, Result) then
    FmtStr(Result, '%s%.8x', [HexDisplayPrefix, Color]);
end;

function StringToColor(const S: string): TColor;
begin
  if not IdentToColor(S, Longint(Result)) then
    Result := TColor(StrToInt(S));
end;

function ColorToIdent(Color: Longint; var Ident: string): Boolean;
begin
  Result := IntToIdent(Color, Ident, Colors);
end;

function IdentToColor(const Ident: string; var Color: Longint): Boolean;
begin
  Result := IdentToInt(Ident, Color, Colors);
end;

{ TFont }
procedure TFont.Assign(Source: TPersistent);
begin
  if Source is TFont then begin
    Style := (Source as TFont).Style;
    Size := (Source as TFont).Size;
    Color := (Source as TFont).Color;
    Charset := (Source as TFont).CharSet;
    Name := (Source as TFont).Name;

    Exit;
  end;
  inherited;
end;

{$ENDIF}

end.
