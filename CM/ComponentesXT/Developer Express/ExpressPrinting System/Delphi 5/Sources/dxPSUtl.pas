{*******************************************************************}
{                                                                   }
{       Developer Express Visual Component Library                  }
{       ExpressPrinting System(tm) COMPONENT SUITE                  }
{                                                                   }
{       Copyright (C) 1998-2001 Developer Express Inc.              }
{       ALL RIGHTS RESERVED                                         }
{                                                                   }
{   The entire contents of this file is protected by U.S. and       }
{   International Copyright Laws. Unauthorized reproduction,        }
{   reverse-engineering, and distribution of all or any portion of  }
{   the code contained in this file is strictly prohibited and may  }
{   result in severe civil and criminal penalties and will be       }
{   prosecuted to the maximum extent possible under the law.        }
{                                                                   }
{   RESTRICTIONS                                                    }
{                                                                   }
{   THIS SOURCE CODE AND ALL RESULTING INTERMEDIATE FILES           }
{   (DCU, OBJ, DLL, ETC.) ARE CONFIDENTIAL AND PROPRIETARY TRADE    }
{   SECRETS OF DEVELOPER EXPRESS INC. THE REGISTERED DEVELOPER IS   }
{   LICENSED TO DISTRIBUTE THE EXPRESSPRINTINGSYSTEM AND            }
{   ALL ACCOMPANYING VCL CONTROLS AS PART OF AN                     }
{   EXECUTABLE PROGRAM ONLY.                                        }
{                                                                   }
{   THE SOURCE CODE CONTAINED WITHIN THIS FILE AND ALL RELATED      }
{   FILES OR ANY PORTION OF ITS CONTENTS SHALL AT NO TIME BE        }
{   COPIED, TRANSFERRED, SOLD, DISTRIBUTED, OR OTHERWISE MADE       }
{   AVAILABLE TO OTHER INDIVIDUALS WITHOUT EXPRESS WRITTEN CONSENT  }
{   AND PERMISSION FROM DEVELOPER EXPRESS INC.                      }
{                                                                   }
{   CONSULT THE END USER LICENSE AGREEMENT FOR INFORMATION ON       }
{   ADDITIONAL RESTRICTIONS.                                        }
{                                                                   }
{*******************************************************************}

unit dxPSUtl;

interface

{$I dxPSVer.inc}

uses
  Classes, Windows, SysUtils, Graphics, Messages, Controls, StdCtrls, TypInfo,
  Dialogs, comCtrls, Menus, Registry, dxPSRes, dxPSGlbl;

{------------------------------------------------------------------- }
{ returns count of Rects in region ARgn                              }
{ if ARgnDataHeader <> nil then  returns RgnDataHeader field too     }
{ ARects pointer to array of TRect                                   }
{ count of TRect in ARects array has been returned as result value   }
{------------------------------------------------------------------- }
{ for more details have a look to the WinAPI function GetRegionData  }
{------------------------------------------------------------------- }
type
  PRects = ^TRects;
  TRects = array[0..0] of TRect;

function GetRgnData(ARgn: HRGN; ARgnDataHeader: PRgnDataHeader; var ARects: PRects): Integer;

procedure dxDrawShadow(DC: HDC; const ARect: TRect; AWidth, AHeight: Integer;
  ABrush: HBRUSH);
  
function FindNearestColor(AColor: TColor): TColor;
function OffsetColor(AColor: TColor; ARed, AGreen, ABlue: Byte): TColor;
  

{ Arithmetic }
function Min(A, B: Integer): Integer;
function Max(A, B: Integer): Integer;
function MinMax(A, B, C: Integer): Integer;
function ScalePoint(const Pt: TPoint; Numerator, Denominator: Integer): TPoint;
function ScaleRect(const R: TRect; NumeratorW, DenominatorW,
  NumeratorH, DenominatorH: Integer): TRect;
function IsEqualPoint(const P1, P2: TPoint): Boolean;

{VCL graphics }
function dxIsEqualBitmap(ABitmap1, ABitmap2: TBitmap): Boolean;
function dxIsEqualBrush(ABrush1, ABrush2: TBrush): Boolean;
function dxIsEqualFont(AFont1, AFont2: TFont): Boolean;
function dxIsEqualPen(APen1, APen2: TPen): Boolean;
function dxIsTrueTypeFont(AFont: TFont): Boolean;
function BitmapToIcon(ABitmap: TBitmap): HICON;
function LoadIconFromBitmapRes(AResID: Integer): HICON;
procedure TransparentDraw(DrawDC: HDC; Brush: HBRUSH; const R: TRect; ABitmap: TBitmap);
procedure DrawSizeGrip(DC: HDC; R: TRect);

function IsDisplayDC(DC: HDC): Boolean;
function IsMetafileDC(DC: HDC): Boolean;
function IsPrinterDC(DC: HDC): Boolean;

{ system }
function GetDesktopWorkArea: TRect;
function CopyData(AHandle: THandle): THandle;
procedure MessageError(const message: string);
procedure MessageWarning(const message: string);
function MessageQuestion(const message: string): Boolean;

function DropAmpersand(const Source: string): string;
function DropEndEllipsis(const Source: string): string;

{ show message }
function RectToStr(const ARect: TRect): string;
function RectSizeToStr(const ARect: TRect): string;
function SizeToStr(const ASize: TSize): string;
function PointToStr(const APoint: TPoint): string;
procedure ShowRect(const ARect: TRect);
procedure ShowRectSize(const ARect: TRect);
procedure ShowPoint(const APoint: TPoint);
procedure ShowSize(const ASize: TSize);
procedure ShowError;
procedure ShowRgnData(ARgn: HRGN);

function FormatFontInfo(AFont: TFont): string;
procedure FontInfoToText(AFont: TFont; AEdit: TEdit);
function MakePageIndexes(const Source: string): Variant;
function ReplaceSubStr(const Source, OldChars, NewChars: string): string;
function ReplicateChar(C: Char; Count: Integer): string;

function Chars2Int(Text: string; UpperCase: Boolean): Integer;
function Int2Chars(Value: Integer; UpperCase: Boolean): string;
function Roman2Int(Text: string; UpperCase: Boolean): Integer;
function Int2Roman(Value: Integer; UpperCase: Boolean): string;

{ RTTI  }
function HasPropertyEx(AClass: TClass; const AName: string;
  ATypeKinds: TTypeKinds): Boolean;
function HasProperty(AClass: TClass; const AName: string): Boolean;
procedure SetProperty(AObj: TObject; const AName: string;
  const AValue: Variant);

function SafetyReadKeyValue(ARegistry: TRegistry; const AKey, AName: string;
  const DefaultValue: Variant): Variant;
function ValidateFileName(const FileName: string): Boolean;

function DropT(const Source: string): string;

const
  sdxFontStyles: array[TFontStyle] of string = 
    (sdxFontStyleBold, sdxFontStyleItalic,  sdxFontStyleUnderline, sdxFontStyleStrikeOut);

implementation

uses
 {$IFDEF DELPHI6} Variants, {$ENDIF} Consts, CommCtrl, Forms;

function Min(A, B: Integer): Integer;
begin
  Result := A;
  if A > B then Result := B;
end;

function Max(A, B: Integer): Integer;
begin
  Result := A;
  if B > A then Result := B;
end;

function MinMax(A, B, C: Integer): Integer;
begin
  if B > C then
    Result := A
  else 
    if A < B then
      Result := B
    else 
      if A > C then
        Result := C
      else
        Result := A;
end;

function ScaleRect(const R: TRect; NumeratorW, DenominatorW, NumeratorH, 
   DenominatorH: Integer): TRect;
begin
  Result.Left := MulDiv(R.Left, NumeratorW, DenominatorW);
  Result.Top := MulDiv(R.Top, NumeratorH, DenominatorH);
  Result.Right := MulDiv(R.Right, NumeratorW, DenominatorW);
  Result.Bottom := MulDiv(R.Bottom, NumeratorH, DenominatorH);
end;

function ScalePoint(const Pt: TPoint; Numerator, Denominator: Integer): TPoint;
begin
  Result.X := MulDiv(Pt.X, Numerator, Denominator);
  Result.Y := MulDiv(Pt.Y, Numerator, Denominator);
end;

function IsEqualPoint(const P1, P2: TPoint): Boolean;
begin
  Result := (P1.X = P2.X) and (P1.Y = P2.Y);
end;

function PointToStr(const APoint: TPoint): string;
begin
  with APoint do
    Result := Format('X = %d; Y = %d', [X, Y]);
end;

function SizeToStr(const ASize: TSize): string;
begin
  with ASize do
    Result := Format('cX = %d; cY = %d', [cx, cy]);
end;

function RectSizeToStr(const ARect: TRect): string;
begin
  Result := Format('Width = %d; Height = %d',
    [ARect.Right - ARect.Left, ARect.Bottom - ARect.Top]);
end;

function RectToStr(const ARect: TRect): string;
begin
  with ARect do
    Result := Format('Left = %d; Top = %d; Right = %d; Bottom = %d', [Left, Top, Right, Bottom]);
end;

procedure ShowRect(const ARect: TRect);
begin
  MessageDlg(RectToStr(ARect), mtInformation, [mbOK], 0)
end;

procedure ShowRectSize(const ARect: TRect);
begin
  MessageDlg(RectSizeToStr(ARect), mtInformation, [mbOK], 0)
end;

procedure ShowPoint(const APoint: TPoint);
begin
  MessageDlg(PointToStr(APoint), mtInformation, [mbOK], 0)
end;

procedure ShowSize(const ASize: TSize);
begin
  MessageDlg(SizeToStr(ASize), mtInformation, [mbOK], 0)
end;

procedure ShowError;
begin
  ShowException(ExceptObject, ExceptAddr);
end;

function GetRgnData(ARgn: HRGN; ARgnDataHeader: PRgnDataHeader; var ARects: PRects): Integer;
const
  SORgnDataHeader = SizeOf(TRgnDataHeader);
  SORect = SizeOf(TRect);
var
  ARgnData: PRgnData;
  ASize: Integer;
begin
  ARects := nil;
  ASize := GetRegionData(ARgn, 1, nil);
  ARgnData := AllocMem(SORgnDataHeader + SORect * (ASize - SORgnDataHeader));
  try
    GetRegionData(ARgn, ASize, ARgnData);
    if Assigned(ARgnDataHeader) then
      System.Move(ARgnData^, ARgnDataHeader, SORgnDataHeader);
    Result := ARgnData^.rdh.nCount;
    if (Result > 0) then
    begin
      ARects := AllocMem(Result * SORect);
      System.Move(ARgnData^.Buffer, ARects^, Result * SORect);
    end;
  finally
    FreeMem(ARgnData, ASize);
  end;
end;

procedure ShowRgnData(ARgn: HRGN);
const
  CRLF = #13#10;
var
  ACount: Integer;
  I: Integer;
  ARects: PRects;
  S: string;
begin
  ACount := GetRgnData(ARgn, nil, ARects);
  if (ACount > 0) then
  try
    S := '';
    for I := 0 to ACount - 1 do
    begin
      S := S + RectToStr(ARects^[I]);
      if (I < ACount - 1) then S := S + CRLF;
    end;
    ShowMessage(S);
  finally
    FreeMem(ARects, SizeOf(TRect) * ACount);
  end
  else
    ShowMessage('There is no existing cliping region in the device context');
end;

function HasPropertyEx(AClass: TClass; const AName: string; ATypeKinds: TTypeKinds): Boolean;
var
  APropList: PPropList;
  APropCount: Integer;
  I: Integer;
begin
  APropCount := GetPropList(AClass.ClassInfo, ATypeKinds, nil);
  if (APropCount > 0) then
  begin
    APropList := AllocMem(APropCount * SizeOf(PPropInfo));
    try
      APropCount := GetPropList(AClass.ClassInfo, ATypeKinds, APropList);
      I := 0;
      while (I < APropCount) and not (CompareText(APropList^[I].name, AName) = 0) do
        Inc(I);
      Result := (I < APropCount);
    finally
      FreeMem(APropList, APropCount * SizeOf(PPropInfo));
    end;
  end
  else
    Result := False;
end;

function HasProperty(AClass: TClass; const AName: string): Boolean;
begin
  Result := HasPropertyEx(AClass, AName, tkAny);
end;

procedure SetProperty(AObj: TObject; const AName: string; const AValue: Variant);
var
  APropInfo: PPropInfo;
begin
  if HasProperty(AObj.ClassType, AName) then
  begin
    APropInfo := GetPropInfo(AObj.ClassInfo, AName);
    if Assigned(APropInfo) then
    begin
      case APropInfo.PropType^^.Kind of
        tkInteger,
        tkChar,
        tkWChar,
        tkEnumeration,
        tkClass,
        tkSet:
          SetOrdProp(AObj, APropInfo, VarAsType(AValue, varInteger));

        tkString,
        tkLString,
        tkWString:
          SetStrProp(AObj, APropInfo, string(VarAsType(AValue, varString)));

        tkFloat:
          SetFloatProp(AObj, APropInfo, VarAsType(AValue, varDouble));

        tkVariant:
          SetVariantProp(AObj, APropInfo, AValue);
      end;
    end;
  end;
end;


function SafetyReadKeyValue(ARegistry: TRegistry; const AKey, AName: string;
  const DefaultValue: Variant): Variant;
var
  ASavePath: string;
begin
  Result := DefaultValue;
  with ARegistry do
  begin
    ASavePath := '\' + CurrentPath;
    CloseKey;
    try
      if KeyExists(AKey) and OpenKey(AKey, False) and ValueExists(AName) then
      begin
        try
          case VarType(DefaultValue) of
            varInteger: 
              Result := ReadInteger(AName);
            varDouble: 
              Result := ReadFloat(AName);
            varCurrency: 
              Result := ReadCurrency(AName);
            varDate: 
              Result := ReadDateTime(AName);
            varBoolean: 
              Result := ReadBool(AName);
            varString: 
              Result := ReadString(AName);
          end;
        except
          Result := DefaultValue;
        end;
      end
      else
        Result := DefaultValue;
    finally
      OpenKey(ASavePath, False);
    end;
  end;
end;

function ValidateFileName(const FileName: string): Boolean;
  function HasChars(const Str, Substr: string): Boolean;
  var
    I: Integer;
  begin
    Result := False;
    for I := 1 to Length(Substr) do
      if Pos(Substr[I], Str) > 0 then
      begin
        Result := True;
        Break;
      end;
  end;
begin
  Result := (Trim(FileName) <> '') and not HasChars(FileName, '<>"[]|');
  if Result then 
    Result := Pos('\', ExtractFileName(FileName)) = 0;
end;

function dxIsEqualBitmap(ABitmap1, ABitmap2: TBitmap): Boolean;
var
  ABitmapInfo1: TBitmapInfo;
  ABitmapInfo2: TBitmapInfo;
  ASize1: Integer;
  ASize2: Integer;
  ABits1: Pointer;
  ABits2: Pointer;
begin
  Result := Assigned(ABitmap1) and Assigned(ABitmap2);
  if not Result then Exit;
  Result := False;

{ ABitmap1 }
  FillChar(ABitmapInfo1, SizeOf(TBitmapInfo), #0);
  with ABitmapInfo1.bmiHeader do
  begin
    biSize := SizeOf(TBitmapInfoHeader);
    biWidth := ABitmap1.Width;
    biHeight := ABitmap1.Height;
    biPlanes := 1;
    biBitCount := 24;
    biCompression := BI_RGB;
    biSizeImage := ((biWidth * Longint(biBitCount)) div 8) * biHeight;
  end;

  GetDIBits(ABitmap1.Canvas.Handle, ABitmap1.Handle, 0,
    ABitmapInfo1.bmiHeader.biHeight, nil, ABitmapInfo1, DIB_RGB_COLORS);
  ASize1 := ABitmapInfo1.bmiHeader.biSizeImage;
  ABits1 := GlobalAllocPtr(GMEM_MOVEABLE, ASize1);
  if (ABits1 <> nil) then
  try
    GetDIBits(ABitmap1.Canvas.Handle, ABitmap1.Handle, 0,
      ABitmapInfo1.bmiHeader.biHeight, ABits1, ABitmapInfo1, DIB_RGB_COLORS);

{ ABitmap2 }
    FillChar(ABitmapInfo2, SizeOf(TBitmapInfo), #0);
    with ABitmapInfo2.bmiHeader do
    begin
      biSize := SizeOf(TBitmapInfoHeader);
      biWidth := ABitmap2.Width;
      biHeight := ABitmap2.Height;
      biPlanes := 1;
      biBitCount := 24;
      biCompression := BI_RGB;
      biSizeImage := ((biWidth * Longint(biBitCount)) div 8) * biHeight;
    end;

    GetDIBits(ABitmap2.Canvas.Handle, ABitmap2.Handle, 0,
      ABitmapInfo2.bmiHeader.biHeight, nil, ABitmapInfo2, DIB_RGB_COLORS);
    ASize2 := ABitmapInfo2.bmiHeader.biSizeImage;
    if (ASize2 <> ASize1) then Exit;

    ABits2 := GlobalAllocPtr(GMEM_MOVEABLE, ASize2);
    if (ABits2 <> nil) then
    try
      GetDIBits(ABitmap2.Canvas.Handle, ABitmap2.Handle, 0,
        ABitmapInfo2.bmiHeader.biHeight, ABits2, ABitmapInfo2, DIB_RGB_COLORS);

      Result := CompareMem(ABits1, ABits2, ASize1);
    finally
      GlobalFreePtr(ABits2);
    end;
  finally
    GlobalFreePtr(ABits1);
  end;
end;


function dxIsEqualFont(AFont1, AFont2: TFont): Boolean;
begin
  Result := (not Assigned(AFont1) and not Assigned(AFont2))
    or
    (Assigned(AFont1) and Assigned(AFont2) and
    (AFont1.Color = AFont2.Color) and
    (AFont1.Name = AFont2.Name) and
    (AFont1.Pitch = AFont2.Pitch) and
    (AFont1.Style = AFont2.Style) and
    (AFont1.Size = AFont2.Size)) // and
//    (AFont1.Charset = AFont2.Charset));
end;

function dxIsEqualPen(APen1, APen2: TPen): Boolean;
begin
  Result := (not Assigned(APen1) and not Assigned(APen2))
    or
    (Assigned(APen1) and Assigned(APen2) and
    (APen1.Color = APen2.Color) and
    (APen1.Mode = APen2.Mode) and
    (APen1.Style = APen2.Style) and
    (APen1.Width = APen2.Width));
end;

function dxIsEqualBrush(ABrush1, ABrush2: TBrush): Boolean;
begin
  Result := (not Assigned(ABrush1) and not Assigned(ABrush2))
    or
    (Assigned(ABrush1) and Assigned(ABrush2) and
    (ABrush1.Color = ABrush2.Color) and
    (ABrush1.Style = ABrush2.Style));
end;

function FormatFontInfo(AFont: TFont): string;
var
  FontStyle: TFontStyle;
  S: string;
begin
  Result := '';
  if AFont = nil then Exit;  
  Result := Format('%d %s %s ', [AFont.Size, sdxPt, AFont.Name]);
  if AFont.Style <> [] then
  begin
    Result := Result + ' [';
    S := '';
    for FontStyle := Low(TFontStyle) to High(TFontStyle) do
      if FontStyle in AFont.Style then
      begin
        if S <> '' then S := S + ' ';
        S := S + sdxFontStyles[FontStyle];
      end;
    Result := Result + S + ']';        
  end;  
end;

procedure FontInfoToText(AFont: TFont; AEdit: TEdit);
begin
  AEdit.Text := FormatFontInfo(AFont);
  if ColorToRGB(AFont.Color) <> ColorToRGB(AEdit.Color) then
    AEdit.Font.Color := AFont.Color
  else
    AEdit.Font.Color := clWindowText;
end;

type
  PSearchBuffer = ^TSearchBuffer;
  TSearchBuffer = record
    FontName: PChar;
    IsTrueType: Boolean;
  end;

function EnumFontProc(var EnumLogFont: TEnumLogFont; var TextMetric: TNewTextMetric; 
  FontType: Integer; Data: LPARAM): Integer; stdcall;
begin
  with EnumLogFont.elfLogFont do
  begin
    Result := Integer(not (StrIComp(PSearchBuffer(Data)^.FontName, PChar(@lfFaceName[0])) = 0));
    if Result = 0 then
      PSearchBuffer(Data)^.IsTrueType := (FontType and TRUETYPE_FONTTYPE = TRUETYPE_FONTTYPE);
  end;
end;

function dxIsTrueTypeFont(AFont: TFont): Boolean;
var
  SearchBuffer: PSearchBuffer;
  DC: HDC;
begin
  DC := GetDC(0);
  try
    New(SearchBuffer);
    try
      SearchBuffer^.FontName := PChar(AFont.name);
      try
        EnumFontFamilies(DC, nil, @EnumFontProc, LPARAM(SearchBuffer));
        Result := SearchBuffer^.IsTrueType;
      except
        Result := False;
      end;
    finally
      Dispose(PSearchBuffer(SearchBuffer));
    end;
  finally
    ReleaseDC(0, DC);
  end;
end;

function GetDesktopWorkArea: TRect;
begin
  SystemParametersInfo(SPI_GETWORKAREA, 0, @Result, 0);
end;

{ strings management routines }

function ReplaceSubStr(const Source, OldChars, NewChars: string): string;
var
  L, P: Integer;
begin
  Result := Source;
  P := Pos(OldChars, Result);
  L := Length(OldChars);
  while (P > 0) do
  begin
    Delete(Result, P, L);
    if (NewChars <> #0) then
      Insert(NewChars, Result, P);
    P := Pos(OldChars, Result);
  end;
end;

function KillChars(const Source: string; const AChars: array of Char): string;
var
  i, j: Integer;
  InChars: Boolean;
begin
  Result := '';
  for i := 1 to Length(Source) do
  begin
    InChars := False;
    for j := Low(AChars) to High(AChars) do
      if (Source[i] = AChars[j]) then
      begin
        InChars := True;
        Break;
      end;
    if not InChars then
      Result := Result + Source[i];
  end;
end;

procedure CutString(const ASource, ACutStr: string; AStrings: TStrings);
var
  P, L: Integer;
  tmp: string;
begin
  tmp := ASource;
  P := Pos(ACutStr, tmp);
  if (P > 0) then
  begin
    L := Length(ACutStr);
    while (P > 0) do
    begin
      if (P > 1) then
        AStrings.Add(System.Copy(tmp, 1, P + L - 2));
      System.Delete(tmp, 1, P + L - 1);
      P := Pos(ACutStr, tmp);
    end;
  end;
  if (Length(tmp) > 0) then AStrings.Add(tmp);
end;

function varArrayElementCount(const V: Variant; ABounds: Integer): Integer;
begin
  if VarIsArray(V) then
    Result := TVarData(V).VArray^.Bounds[ABounds].ElementCount
  else
    Result := 0;
end;

function MakePageIndexes(const Source: string): Variant;
const
  PageSeparator: char = ',';
var
  AStrings: TStrings;
  AStrings2: TStrings;
  tmp: string;
  I, J, K, P, Count: Integer;
  StartValue: Integer;
  EndValue: Integer;
begin
  Result := Unassigned;
  tmp := KillChars(Source, [' ', #9]);
  try
    if (Length(tmp) > 0) then
    begin
      AStrings := TStringList.Create;
      try
        CutString(Source, PageSeparator, AStrings);
        if (AStrings.Count > 0) then
        begin
          Result := VarArrayCreate([0, 0], varInteger);
          Result[0] := 0;
          for I := 0 to AStrings.Count - 1 do
          begin
            Count := varArrayElementCount(Result, 0);
            P := Pos('-', AStrings[I]);
            if (P > 0) then
            begin
              AStrings2 := TStringList.Create;
              try
                CutString(AStrings[I], '-', AStrings2);
                if (AStrings2.Count = 2) then
                begin
                  StartValue := StrToInt(AStrings2[0]);
                  EndValue := StrToInt(AStrings2[1]);
                  if (StartValue > EndValue) then
                    raise EConvertError.Create('');
                  varArrayReDim(Result, EndValue - StartValue + Count - 1);
                  try
                    J := 0;
                    for k := StartValue to EndValue do
                    begin
                      Result[Count + j - 1] := k;
                      Inc(j);
                    end;
                  except
                    raise EConvertError.Create('');
                  end;
                  Count := varArrayElementCount(Result, 0);
                  //if ( i < AStrings.Count-1 ) then varArrayReDim(Result, Count);
                end;
              finally
                AStrings2.Free;
              end;
            end
            else
            try
              Result[Count - 1] := StrToInt(AStrings[I]);
            except
              raise EConvertError.Create('');
            end;
            if (I < AStrings.Count - 1) then varArrayReDim(Result, Count);
          end;
        end;
      finally
        AStrings.Free;
      end;
    end;
    if VarIsArray(Result) and (Result[0] = 0) then
      raise EConvertError.Create('');
  except
    varClear(Result);
    raise;
  end;
end;

function Int2Roman(Value: Integer; UpperCase: Boolean): string;
const
  Max = 13;
  RomanNumbers: array[1..Max] of integer = 
    (1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000);
  RomanStrings: array[Boolean, 1..Max] of string =
    (('i', 'iv', 'v', 'ix', 'x', 'xl', 'l', 'xc', 'c', 'cd', 'd', 'cm', 'm'),
     ('I', 'IV', 'V', 'IX', 'X', 'XL', 'L', 'XC', 'C', 'CD', 'D', 'CM', 'M'));
var
  Index: Integer;
begin
  Result := '';
  Index := Max;
  while (Value > 0) do
  begin
    while (Value < RomanNumbers[Index]) do
      Dec(Index);
    while (Value >= RomanNumbers[Index]) do
    begin
      Dec(Value, RomanNumbers[Index]);
      Result := Result + RomanStrings[UpperCase, Index];
    end;
  end;
end;

function Roman2Int(Text: string; UpperCase: Boolean): Integer;
type
  TdxNumberOrder = (noOnes, noTens, noHundreds);
  TdxRomanNumber = 1..9;
const
  RomanNumbers: array[TdxNumberOrder, TdxRomanNumber] of Integer =
    ((  1,   2,   3,   4,   5,   6,   7,   8,   9),
     ( 10,  20,  30,  40,  50,  60,  70,  80,  90),
     (100, 200, 300, 400, 500, 600, 700, 800, 900));
  RomanThousand: array[Boolean] of string = ('m', 'M');
  RomanStrings: array[Boolean, TdxNumberOrder, TdxRomanNumber] of string =
    ((('i', 'ii', 'iii', 'iv', 'v', 'vi', 'vii', 'viii', 'ix'),
      ('x', 'xx', 'xxx', 'xl', 'l', 'lx', 'lxx', 'lxxx', 'lc'),
      ('c', 'cc', 'ccc', 'cd', 'd', 'dc', 'dcc', 'dccc', 'dm')),
     (('I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX'),
      ('X', 'XX', 'XXX', 'XL', 'L', 'LX', 'LXX', 'LXXX', 'XC'),
      ('C', 'CC', 'CCC', 'CD', 'D', 'DC', 'DCC', 'DCCC', 'CM')));
var
  Number: TdxRomanNumber;
  Order: TdxNumberOrder;
begin
  Result := 0;
  while (Length(Text) > 0) and (Text[1] = RomanThousand[UpperCase]) do
  begin
    Delete(Text, 1, 1);
    Inc(Result, 1000);
  end;
  if (Length(Text) > 0) then
    for Order := noHundreds downto noOnes do
    begin
      Number := High(TdxRomanNumber);
      while (Number > 0) and (Pos(RomanStrings[UpperCase, Order, Number], Text) <> 1) do
        Dec(Number);
      if (Number > 0) then
      begin
        Inc(Result, RomanNumbers[Order, Number]);
        Delete(Text, 1, Length(RomanStrings[UpperCase, Order, Number]));
        if (Length(Text) = 0) then Exit;
      end;
    end;
  if (Length(Text) > 0) then Result := -1;
end;

const
  CharCount = 26;
  Chars: array[Boolean] of string[CharCount] =
    (('abcdefghijklmnopqrstuvwxyz'), ('ABCDEFGHIJKLMNOPQRSTUVWXYZ'));

function ReplicateChar(C: Char; Count: Integer): string;
var
  i: Integer;
begin
  SetLength(Result, Count);
  Result := '';
  for i := 0 to Count - 1 do
    Result := Result + C;
end;

function Int2Chars(Value: Integer; UpperCase: Boolean): string;
var
  i, C: Integer;
begin
  i := Value mod CharCount;
  C := Value div CharCount;
  if (i = 0) then
    i := 26
  else
    Inc(C);
  Result := ReplicateChar(Chars[UpperCase][i], C);
end;

function Chars2Int(Text: string; UpperCase: Boolean): Integer;
begin
  Result := CharCount * (Length(Text) - 1) + Pos(Text[1], Chars[UpperCase]);
end;

function DropAmpersand(const Source: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(Source) do
    if Source[I] <> '&' then
      Result := Result + Source[I];
end;
                        
function DropEndEllipsis(const Source: string): string;
begin
  Result := Source;
  while (Length(Result) > 0) and (Result[Length(Result)] = '.') do 
    Delete(Result, Length(Result), 1);
end;

{ = ======================== }
{ from Borland olectrls.pas  }
{ = ======================== }

procedure ShadeRect(DC: HDC; const ARect: TRect);
const
  aBits: array[0..7] of Word = 
    ($0055, $00AA, $0055, $00AA, $0055, $00AA, $0055, $00AA);
  //ABits: array[0..7] of Word = ($11, $22, $44, $88, $11, $22, $44, $88);
var
  Bitmap: HBITMAP;
  Brush: HBRUSH;
  TextColor, BkColor: COLORREF;
begin
  Bitmap := CreateBitmap(8, 8, 1, 1, @ABits);
  Brush := SelectObject(DC, CreatePatternBrush(Bitmap));
  TextColor := SetTextColor(DC, clWhite);
  BkColor := SetBkColor(DC, clBlack);
  with ARect do
    PatBlt(DC, Left, Top, Right - Left, Bottom - Top, $00A000C9);
  SetBkColor(DC, BkColor);
  SetTextColor(DC, TextColor);
  DeleteObject(SelectObject(DC, Brush));
  DeleteObject(Bitmap);
end;

procedure dxDrawShadow(DC: HDC; const ARect: TRect; AWidth, AHeight: Integer; ABrush: HBRUSH);
var
  R: TRect;
begin
  //vert.
  with ARect do
    R := Rect(Left, Top + (AWidth shr 1) + 1, Right + AWidth, Bottom + AHeight);
  //Windows.FillRect(ADC, R, ABrush);
  ShadeRect(DC, R);
  //horz.
  with ARect do
    R := Rect(Left + (AHeight shr 1) + 1, Bottom, Right, Bottom + AHeight);
  ShadeRect(DC, R);
  //Windows.FillRect(DC, R, ABrush);
end;

function FindNearestColor(AColor: TColor): TColor;
var
  DC: HDC;
begin
  DC := GetDC(0);
  Result := GetNearestColor(DC, AColor);
  ReleaseDC(0, DC);
end;
  
function OffsetColor(AColor: TColor; ARed, AGreen, ABlue: Byte): TColor;
var
  Red, Green, Blue: Integer;
begin
  AColor := ColorToRGB(AColor);
  Red := GetRValue(AColor) + ARed;
  if Red > High(Byte) then Red := High(Byte);
  if Red < Low(Byte) then Red := Low(Byte);  
  
  Green := GetGValue(AColor) + AGreen;  
  if Green > High(Byte) then Green := High(Byte);
  if Green < Low(Byte) then Green := Low(Byte);  
  
  Blue := GetBValue(AColor) + ABlue;  
  if Blue > High(Byte) then Blue := High(Byte);
  if Blue < Low(Byte) then Blue := Low(Byte);  
  
  Result := RGB(Red, Green, Blue);
end;

function CopyData(AHandle: THandle): THandle;
var
  Src, Dest: PChar;
  ASize: Integer;
begin
  if (AHandle <> 0) then
  begin
    ASize := GlobalSize(AHandle);
    Result := GlobalAlloc(GHND, ASize);
    if (Result <> 0) then
    begin
      Src := GlobalLock(AHandle);
      if (Src <> nil) then
      try
        Dest := GlobalLock(Result);
        if (Dest <> nil) then
        try
          Move(Src^, Dest^, ASize);
        finally
          GlobalUnlock(Result);
        end;
      finally
        GlobalUnlock(AHandle);
      end;
    end;
  end
  else
    Result := 0;
end;

procedure MessageError(const message: string);
begin
  MessageBeep(MB_ICONEXCLAMATION);
  Application.MessageBox(PChar(message), PChar(Application.Title), 
    MB_OK or MB_ICONERROR);
end;

procedure MessageWarning(const message: string);
begin
  MessageBeep(MB_ICONEXCLAMATION);
  Application.MessageBox(PChar(message), PChar(Application.Title), 
    MB_OK or MB_ICONEXCLAMATION);
end;

function MessageQuestion(const message: string): Boolean;
begin
  MessageBeep(MB_ICONQUESTION);
  Result := (ID_YES = Application.MessageBox(PChar(message), PChar(Application.Title), 
    MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON1));
end;

procedure DrawSizeGrip(DC: HDC; R: TRect);
var
  V: Integer;
begin
  V := GetSystemMetrics(SM_CXVSCROLL);
  R := Rect(R.Right - V, R.Bottom - V, R.Right, R.Bottom);
  DrawFrameControl(DC, R, DFC_SCROLL, DFCS_SCROLLSIZEGRIP); 
end;

function IsDisplayDC(DC: HDC): Boolean;
begin
  Result := GetDeviceCaps(DC, TECHNOLOGY) = DT_RASDISPLAY;
end;

function IsMetafileDC(DC: HDC): Boolean;
begin
  Result := GetObjectType(DC) in [OBJ_METADC, OBJ_ENHMETADC];  
end;

function IsPrinterDC(DC: HDC): Boolean;
begin
  Result := GetDeviceCaps(DC, TECHNOLOGY) = DT_RASPRINTER;
end;

function BitmapToIcon(ABitmap: TBitmap): HICON;
var
  ImageList: TImageList;
begin
  ImageList := TImageList.CreateSize(ABitmap.Width, ABitmap.Height);
  try
    ImageList.AllocBy := 1;
    ImageList.AddMasked(ABitmap, clDefault);
    Result := ImageList_GetIcon(ImageList.Handle, 0, ILD_NORMAL);
  finally
    ImageList.Free;
  end;
end;

function LoadIconFromBitmapRes(AResID: Integer): HICON;
var
  Bitmap: TBitmap;
begin
  Bitmap := TBitmap.Create;
  try
    Bitmap.LoadFromResourceID(hInstance, AResID);
    Result := BitmapToIcon(Bitmap);
  finally
   Bitmap.Free;
  end;
end;

procedure TransparentDraw(DrawDC: HDC; Brush: HBRUSH; const R: TRect; 
  ABitmap: TBitmap);
const
  ROP_DSPDxax = $00E20746;
var
  BW, BH: Integer;
  DC, MaskDC: HDC;
  B, MaskHandle: HBITMAP;
  ATextColor, ABackColor: COLORREF;
  ABrush: HBRUSH;
begin
  with R do
  begin
    BW := ABitmap.Width;
    BH := ABitmap.Height;

    DC := CreateCompatibleDC(DrawDC);
    B := SelectObject(DC, CreateCompatibleBitmap(DrawDC, BW, BH));
    try
      BitBlt(DC, 0, 0, BW, BH, ABitmap.Canvas.Handle, 0, 0, SRCCOPY);

      MaskDC := CreateCompatibleDC(DrawDC);
      MaskHandle := SelectObject(MaskDC, CreateBitmap(BW, BH, 1, 1, nil));
      try
        ABackColor := SetBkColor(DC, ColorToRGB(ABitmap.TransparentColor){GetPixel(DC, 0, BH - 1)});
        BitBlt(MaskDC, 0, 0, BW, BH, DC, 0, 0, SRCCOPY);
        SetBkColor(DC, ABackColor);

        ATextColor := SetTextColor(DC, 0);
        ABackColor := SetBkColor(DC, $FFFFFF);
        ABrush := SelectObject(DC, Brush);
        BitBlt(DC, 0, 0, BW, BH, MaskDC, 0, 0, ROP_DSPDxax);
        SelectObject(DC, ABrush);
        SetTextColor(DC, ATextColor);
        SetBkColor(DC, ABackColor);
      finally
        DeleteObject(SelectObject(MaskDC, MaskHandle));
        DeleteDC(MaskDC);
      end;

      BitBlt(DrawDC, Left, Top, Right - Left, Bottom - Top, DC, 0, 0, SRCCOPY);
    finally
      DeleteObject(SelectObject(DC, B));
      DeleteDC(DC);
    end;
  end;
end;

function DropT(const Source: string): string;
begin
  Result := Source;
  if Result[1] = 'T' then Delete(Result, 1, 1);
end;

end.

