{*******************************************************************************
   Unit
      utdUtils.pas
   Description:
      Misc. utils used by sEditTools pack and other programs.
   Versions:
   	2.0b
   History:
      2.0c  -  Notify procedure. Used internally by sEditTools' cntrols.
      2.0b  -  November 1998
               Some new routines.
      2.0a	- 	01/11/1998.
      			Small fix suggested by Jim Reid: Changed property of T_ViewStrForm
               is renamed to IsChanged, to avoid warning about that it hides the
					parent class's Changed method.
      2.0*	- 	End of September 1998.
      			Initial release
   Autor(s):
      Dimitry Statilko - dstatus@iname.com, dima@mobitel.com**
   Comments:
*     I did not track the versions before, so let's consider it as 2.0
*******************************************************************************}

unit BftdUtils;

interface

uses Classes, Windows, Controls, Forms, Graphics, Registry, BfConsts;


function S2I( S: String): Integer;
function GetToken( var S: String; token: Char; IncludeToken: Boolean): String;
function BreakApart(const theString, Separator: String; var Tokens: TStringList): Integer;
function AssembleString(Tokens: TStringList; Separator: String): String;
function StripWS(S: String): String;
procedure ExchangeWordValues(var val1, val2: Word);
procedure ExchangeIntValues(var val1, val2: Integer);
function Max(val1, val2: Word): Word;
function MaxInteger( vals: array of integer): Integer;

function GetFontMetrics(Font: TFont): TTextMetric;
function GetFontHeight(Font: TFont): Integer;
function GetFontWidth(Font: TFont): Integer;
function WidthOf(const R: TRect): Integer;
function HeightOf(const R: TRect): Integer;
function RectInRect(R1, R2: TRect): Boolean;

function GetRegValue( key: HKey; section, ident: String): String;

const
   __MaskMultyChar = '%';
   __MaskSingleChar = '?';

function CompareMask(S, mask: String): Boolean;

type
   // TStringList whichg deallocate objects as well as strings
   TsStringList = class(TStringList)
   private
      FDeleteingObjects: Boolean;
   protected
      procedure DeleteObjects; virtual;
      procedure Changed; override;
      procedure Changing; override;
   public
      destructor Destroy; override;
      procedure Clear; override;
      procedure Delete(index: Integer); override;
   end;

{ log functions}
const
   _LogFileName: String = SDefaultLogFilename;
   _GeneralErrorMessage: String = SDefaultErrorMessage;
   _LogDateTimeSeparator: String = '-';


type
   TViewParam = (vpCanClear, vpCanEdit);
   TViewParams = set of TViewParam;

procedure Log(const msg: String);
procedure LogFmt(const msg: String; const Args: array of const);
procedure ViewLog( AOwner: TComponent; CanClear: Boolean; aCaption: String);
function ViewFile( AOwner: TComponent; aParams: TViewParams; aFileName, aCaption: String): Boolean;
procedure ViewStrings( AOwner: TComponent; Lines: TStrings; aCaption: String);

{ Misk}
type
   TProcedureWithoutParams = procedure of object;

procedure ExecuteWithoutParams( proc: TProcedureWithoutParams);

type
   TFormClass = class of TCustomForm;

function RunForm(formClass: TFormClass; AOwner: TComponent): Boolean;


procedure Notify(Ctrl: TWinControl; msg: Integer; lParam: Integer);


implementation



uses SysUtils, Consts, Messages, comctrls, stdctrls, extctrls, Buttons, Dialogs;

function S2I( S: String): Integer;
var
   ii: Integer;
   len: Integer;
begin
   len := Length(S);
   for ii := 1 to len do
      if S[ii] in ['1'..'9'] then
         Break;
   S := Copy( S, ii, len - ii + 1);
   len := Length(S);
   for ii := 1 to len do
      if not (S[ii] in ['0'..'9']) then
         Break;
   SetLength(S, ii - 1);
   try
      Result := StrToInt(S);
   except
      Result := 0;
   end;
end;

function GetToken( var S: String; token: Char; IncludeToken: Boolean): String;
var
   p: Integer;
begin
   p := Pos(token, S);
   if P = 0 then begin
      Result := S;
      S := '';
   end else begin
      Result := S;
      S := Copy( S, p + 1, Length(S) - p);
      if not IncludeToken then
         dec(p);
      SetLength( Result, p);
   end;
end;

{Breaks a string into tokens and places the tokens in a string list}
function BreakApart(const theString, Separator: String; var Tokens: TStringList): Integer;
var
   Index: Integer;
	CurrentString: String;
	CurrentToken: String;
	Done: Boolean;
begin
	Result:=0;
	CurrentString:=theString;
	Done:=FALSE;
	Tokens.Clear;
	repeat
		{Find the first separator in the string}
		Index:=Pos(Separator,CurrentString);
 		{If separator not found, we are done}
		if Index=0 then begin
         {Last token is whatever string is left}
         CurrentToken:=CurrentString;
         Done:=TRUE;
  		end else begin
         {Get token and chop off the beginning}
         CurrentToken:=Copy(CurrentString,1,Index-1);
         CurrentString:=Copy(CurrentString,Index+1,Length(CurrentString)-Index);
      end;
		{Add the token to the string list}
		Tokens.Add(CurrentToken);
		Inc(Result);
   until Done;
end;

function AssembleString(Tokens: TStringList; Separator: String): String;
var
   ii: Integer;
begin
   Result := '';
   for ii := 0 to Tokens.Count - 1 do begin
      if ii > 0 then
         Result := Result + Separator;
      Result := Result + Tokens[ii];
   end;
end;

function CompareMask(S, mask: String): Boolean;
var
   ii, jj: Integer;
   done: Boolean;
begin
   Result := FALSE;
   ii := 1;
   jj := 1;
   if S = '' then begin
      Result := (Mask = '') or (Mask = __MaskMultyChar);
      Exit;
   end;
   done := FALSE;
   while not done do begin
      if (mask[ii] = S[jj]) or ( mask[ii] = __MaskSingleChar) then begin
         Inc(ii);
         Inc(jj);
      end else if mask[ii] = __MaskMultyChar then begin
         while (mask[ii] = __MaskMultyChar) and (ii <= Length(mask)) do
            Inc(ii);
         while (S[jj] <> mask[ii]) and (jj <= Length(S)) do
            Inc(jj);
      end else
         Exit;
      done := (ii > Length( mask)) or (jj > Length(S));
   end;
   Result := TRUE;
end;

function StripWS(S: String): String;
var
   ii: integer;
begin
   Result := '';
   for ii := 1 to length(S) do
      if S[ii] <> ' ' then
         Result := Result + S[ii];
end;

procedure ExchangeWordValues(var val1, val2: Word);
begin
   val1 := val1 xor val2;
   val2 := val2 xor val1;
   val1 := val1 xor val2;
end;

procedure ExchangeIntValues(var val1, val2: Integer);
begin
   val1 := val1 xor val2;
   val2 := val2 xor val1;
   val1 := val1 xor val2;
end;

function Max(val1, val2: Word): Word;
begin
   Result := val1;
   if val1 < val2 then
      Result := val2;
end;

function MaxInteger( vals: array of integer): Integer;
var
   ii: Integer;
begin
   Result := vals[Low(vals)];
   for ii := Low(vals) to high(vals) do begin
      if Result < vals[ii] then
         Result := vals[ii];
   end;
end;

function GetFontMetrics(Font: TFont): TTextMetric;
var
   DC: HDC;
   SaveFont: HFont;
begin
   DC := GetDC(0);
  	SaveFont := SelectObject(DC, Font.Handle);
  	GetTextMetrics(DC, Result);
   SelectObject(DC, SaveFont);
  	ReleaseDC(0, DC);
end;

function GetFontHeight(Font: TFont): Integer;
begin
   with GetFontMetrics(Font) do
      Result := Round(tmHeight + tmHeight / 8);
end;

function GetFontWidth(Font: TFont): Integer;
begin
   Result := GetFontMetrics(Font).tmAveCharWidth;
end;

function WidthOf(const R: TRect): Integer;
begin
   Result := R.Right - R.Left;
end;

function HeightOf(const R: TRect): Integer;
begin
   Result := R.Bottom - R.Top;
end;

function RectInRect( R1, R2: TRect): Boolean;
begin
   Result := IntersectRect( R1, R1, R2);
end;

procedure ExecuteWithoutParams( proc: TProcedureWithoutParams);
begin
   try
      proc;
   except
      on E: Exception do
         LogFmt( _GeneralErrorMessage, [E.Message]);
   end;
end;

function RunForm(formClass: TFormClass; AOwner: TComponent): Boolean;
begin
   with formClass.Create(AOwner) do try
      Result := ShowModal = mrOk;
   finally
      Free;
   end;
end;

{*******************************************************************************
   TsStringList
*******************************************************************************}
destructor TsStringList.Destroy;
begin
   DeleteObjects;
   inherited;
end;

procedure TsStringList.DeleteObjects;
var
   ii: Integer;
begin
   try
      FDeleteingObjects := TRUE;
      for ii := 0 to Count - 1 do begin
         Objects[ii].Free;
         Objects[ii] := nil;
      end;
   finally
      FDeleteingObjects := FALSE;
   end;
end;

procedure TsStringList.Clear;
begin
   DeleteObjects;
   inherited;
end;

procedure TsStringList.Delete(index: Integer);
begin
   if (Index < 0) or (Index >= Count) then
      Error(SListIndexError, Index);
   try
      FDeleteingObjects := TRUE;
      Objects[index].Free;
      Objects[index] := nil;
   finally
      FDeleteingObjects := FALSE;
   end;
   inherited;
end;

procedure TsStringList.Changed;
begin
   if not FDeleteingObjects then
      inherited;
end;

procedure TsStringList.Changing;
begin
   if not FDeleteingObjects then
      inherited;
end;

function GetRegValue( key: HKey; section, ident: String): String;
begin
   with TRegIniFile.Create( '') do try
      RootKey := Key;
      Result := ReadString( section, ident, '');
   finally
      Free;
   end;
end;


{*******************************************************************************
   Log family
*******************************************************************************}
procedure Log(const msg: String);
var
   F: TextFile;
begin
   AssignFile(F, _LogFileName);
   if FileExists( _LogFileName) then
      Append(F)
   else
      Rewrite(F);
         WriteLn(F, DateTimeToStr(Now) + _LogDateTimeSeparator + msg);
   CloseFile(F);
end;

procedure LogFmt(const msg: String; const Args: array of const);
begin
   Log( Format( msg, Args));
end;


type
   T_ViewStrForm = class(TForm)
      ToolPanel: TPanel;
      ExitBtn: TSpeedButton;
      StatusBar1: TStatusBar;
      Memo: TRichEdit;
      ClearBtn: TSpeedButton;
      SaveBtn: TSpeedButton;
      RefreshBtn: TSpeedButton;
      procedure ExitBtnClick(Sender: TObject);
      procedure ClearBtnClick(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure SaveBtnClick(Sender: TObject);
      procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    	procedure RefreshBtnClick(Sender: TObject);
   private
      FFileName: String;
      FParams: TViewParams;
      FChanged: Boolean;
      procedure SetParams(Value: TViewParams);
   public
      procedure Load;
      procedure Save;
      property FileName: String read FFileName write FFileName;
      property Params: TViewParams read FParams write SetParams;
      property IsChanged: Boolean read FChanged;
   end;

function ViewFile( AOwner: TComponent; aParams: TViewParams; aFileName, aCaption: String): Boolean;
begin
   with T_ViewStrForm.Create(AOwner) do try
      Caption := aCaption;
      FileName := aFileName;
      Params := aParams;
      Load;
      ShowModal;
      Result := IsChanged;
   finally
      Free;
   end;
end;

procedure ViewLog( AOwner: TComponent; CanClear: Boolean; aCaption: String);
var
   prm: TViewParams;
begin
   prm := [];
   if CanClear then
      prm := [vpCanClear];
   ViewFile( AOwner, prm, _LogFileName, aCaption);
end;

procedure ViewStrings( AOwner: TComponent; Lines: TStrings; aCaption: String);
begin
   with T_ViewStrForm.Create(AOwner) do try
      Caption := aCaption;
      Params := [];
      Memo.Lines.Assign(Lines);
      ShowModal;
   finally
      Free;
   end;
end;

procedure T_ViewStrForm.Load;
begin
   Memo.Lines.Clear;
   try
      Memo.Lines.LoadFromFile(FFileName);
      Memo.Modified := FALSE;
      ClearBtn.Enabled := TRUE;
      RefreshBtn.Enabled := TRUE;
   except
      ClearBtn.Enabled := FALSE;
      RefreshBtn.Enabled := FALSE;
   end;
end;

procedure T_ViewStrForm.Save;
begin
   try
      FChanged := Memo.Modified;
      if FChanged then begin
         Memo.Lines.SaveToFile(FFileName);
         Memo.Modified := FALSE;
      end;
   except
   end;
end;

procedure T_ViewStrForm.ExitBtnClick(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

procedure T_ViewStrForm.ClearBtnClick(Sender: TObject);
begin
   SysUtils.DeleteFile(FFileName);
   Load;
end;

procedure T_ViewStrForm.RefreshBtnClick(Sender: TObject);
begin
   Load;
end;

procedure T_ViewStrForm.SaveBtnClick(Sender: TObject);
begin
   Save;
end;

procedure T_ViewStrForm.SetParams(Value: TViewParams);
begin
   FParams := Value;
   ClearBtn.Visible := vpCanClear in Value;
   SaveBtn.Visible := vpCanEdit in Params;
   RefreshBtn.Visible := vpCanEdit in Params;
   Memo.ReadOnly := not (vpCanEdit in Params);
   if not ClearBtn.Visible then begin
      SaveBtn.Left := 35;
      RefreshBtn.Left := 70;
   end;
end;

procedure T_ViewStrForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   if (Shift = []) and (key = VK_ESCAPE) then
      Exit;
end;

procedure T_ViewStrForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   if SaveBtn.Visible and Memo.Modified then
      case MessageDlg( SSaveChangesQuery, mtConfirmation, [mbYes,mbNo,mbCancel],0) of
         mrCancel: CanClose := FALSE;
         mrYes: Save;
      end;
end;

procedure Notify(Ctrl: TWinControl; msg: Integer; lParam: Integer);
var
   m: TMessage;
begin
   m.Msg := msg;
   m.WParam := LongInt(Ctrl);
   m.LParam := lParam;
   m.Result := 0;
   Ctrl.Parent.Broadcast( m);
end;


end.
