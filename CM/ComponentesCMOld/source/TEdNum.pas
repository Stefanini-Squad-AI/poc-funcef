unit TEdNum;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls;

type
  TEditNum = class(TEdit)
  private
    { Private declarations }
    FCanvas: TControlCanvas;
    FIntDigits_  : Integer;
    FSignal_     : Boolean;
    FDecDigits_  : Integer;
    FNumeric_    : Boolean;
    FAlignment: TAlignment;
    FFocused     : Boolean;
    procedure WMPaste(var Message: TMessage); message WM_PASTE;

  protected
    { Protected declarations }
    procedure KeyPress(var Key: Char); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure SetAlignment(Value:TAlignment);
    procedure CMEnter(var Msg: TCMEnter); message CM_ENTER;
    procedure CMExit(var Msg: TCMExit); message CM_EXIT;
    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
    procedure SetFocused(Value: Boolean);
    function GetTextMargins: TPoint;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  published
    { Published declarations }
  	 property IntDigits: Integer    read FIntDigits_ write FIntDigits_;
	 property Signal   : Boolean    read FSignal_    write FSignal_;
    property DecDigits: Integer    read FDecDigits_ write FDecDigits_;
    property Numeric  : Boolean    read FNumeric_   write FNumeric_;
    property Alignment: TAlignment read FAlignment  write SetAlignment default taLeftJustify;

  end;

implementation

{$R *.res}


constructor TEditNum.Create(AOwner:TComponent);
begin
   inherited Create(AOwner);
   FAlignment:=taLeftJustify;
end;

destructor TEditNum.Destroy;
begin
  FCanvas.Free;
  inherited Destroy;
end;

function TEditNum.GetTextMargins: TPoint;
var
  DC: HDC;
  SaveFont: HFont;
  I: Integer;
  SysMetrics, Metrics: TTextMetric;
begin
  if NewStyleControls then
  begin
    if BorderStyle = bsNone then I := 0 else
      if Ctl3D then I := 1 else I := 2;
    Result.X := SendMessage(Handle, EM_GETMARGINS, 0, 0) and $0000FFFF + I;
    Result.Y := I;
  end else
  begin
    if BorderStyle = bsNone then I := 0 else
    begin
      DC := GetDC(0);
      GetTextMetrics(DC, SysMetrics);
      SaveFont := SelectObject(DC, Font.Handle);
      GetTextMetrics(DC, Metrics);
      SelectObject(DC, SaveFont);
      ReleaseDC(0, DC);
      I := SysMetrics.tmHeight;
      if I > Metrics.tmHeight then I := Metrics.tmHeight;
      I := I div 4;
    end;
    Result.X := I;
    Result.Y := I;
  end;
end;

procedure TEditNum.WMPaint(var Message: TWMPaint);
var
  Left: Integer;
  Margins: TPoint;
  R: TRect;
  DC: HDC;
  PS: TPaintStruct;
  S: string;
begin
  if ((FAlignment = taLeftJustify) or FFocused) and
    not (csPaintCopy in ControlState) then
  begin
    inherited;
    Exit;
  end;
{ Since edit controls do not handle justification unless multi-line (and
  then only poorly) we will draw right and center justify manually unless
  the edit has the focus. }
  if FCanvas = nil then
  begin
    FCanvas := TControlCanvas.Create;
    FCanvas.Control := Self;
  end;
  DC := Message.DC;
  if DC = 0 then DC := BeginPaint(Handle, PS);
  FCanvas.Handle := DC;
  try
    FCanvas.Font := Font;
    with FCanvas do
    begin
      R := ClientRect;
      if not (NewStyleControls and Ctl3D) and (BorderStyle = bsSingle) then
      begin
        Brush.Color := clWindowFrame;
        FrameRect(R);
        InflateRect(R, -1, -1);
      end;
      Brush.Color := Color;
      if (csPaintCopy in ControlState) then
      begin
        S := Text;
        case CharCase of
          ecUpperCase: S := AnsiUpperCase(S);
          ecLowerCase: S := AnsiLowerCase(S);
        end;
      end else
        S := Text;
      if PasswordChar <> #0 then FillChar(S[1], Length(S), PasswordChar);
      Margins := GetTextMargins;
      case FAlignment of
        taLeftJustify: Left := Margins.X;
        taRightJustify: Left := ClientWidth - TextWidth(S) - Margins.X - 1;
      else
        Left := (ClientWidth - TextWidth(S)) div 2;
      end;
      TextRect(R, Left, Margins.Y, S);
    end;
  finally
    FCanvas.Handle := 0;
    if Message.DC = 0 then EndPaint(Handle, PS);
  end;
end;

procedure TEditNum.SetFocused(Value: Boolean);
begin
  if FFocused <> Value then
  begin
    FFocused := Value;
    if (FAlignment <> taLeftJustify) then Invalidate;
  end;
end;

procedure TEditNum.CMEnter(var Msg: TCMEnter);
begin
  SetFocused(True);
  inherited;
end;

procedure TEditNum.CMExit(var Msg: TCMExit);
begin
  SetFocused(False);
  inherited;
end;

procedure TEditNum.SetAlignment(Value:TAlignment);
begin
   if FAlignment<>Value then begin
      FAlignment:=Value;
      RecreateWnd;
   end;
end;

procedure TEditNum.KeyDown(var Key: Word; Shift: TShiftState);
var
   pnt : Integer;

begin
   pnt := Pos(DecimalSeparator, SelText);

   if (Text <> '') and
      ((pnt <> 0) or ((SelLength=0) and (Text[SelStart+1]=DecimalSeparator)))
      and (Key = VK_DELETE)
      and FNumeric_
   then begin
      MessageBeep(0);
      Key := 0;
   end;
   inherited KeyDown(Key, Shift);
end;


procedure TEditNum.KeyPress(var Key: Char);
var
	tam_dec,
   tam_int,
   pos_pnt : integer;
   decimal : boolean;

begin
  	if FNumeric_
   then begin
         { Testa se é válido }
         if Not (Key in ['0'..'9', DecimalSeparator, 'E', 'e', '+', '-', #8])
     		then begin
        			MessageBeep(0);
        			Key := #0;
               Exit;
     			  end;

   		{ Testa se o ponto é válido }
         if (Key = DecimalSeparator) and (FDecDigits_ = 0)
         then begin
        			MessageBeep(0);
        			Key := #0;
              end;

			if (Key = 'E') or (key = 'e')
  			then begin
     				MessageBeep(0);
     				Key := #0;
  		  		  end;

 			{ Testa a posição do sinal }
    		if (((Pos( '+', Text) <> 0) or (Pos('-', Text)<>0)
     			or (SelStart <> 0) or (not FSignal_))
            and ((Key = '+') or (Key = '-')))
     		then begin
        			MessageBeep(0);
        			Key := #0;
     			  end;


 	  		if  (SelStart+1<=Pos('+',Text)) or (SelStart+1<=Pos('-',Text))
     		then begin
       	 		MessageBeep(0);
       	 		Key := #0;
     			  end;

  	  		{ Testa para ver se está na parte decimal ou na inteira }
 	   	pos_pnt := Pos( DecimalSeparator, Text );
      	if (pos_pnt < (SelStart + 1)) and (pos_pnt <> 0)
     		then decimal := true
      	else decimal := false;

     		{ Verifica o número de digitos no campo }
     		if not decimal
     		then begin
     	  			if pos_pnt = 0
        			then tam_int := Length(Text)
         		else tam_int := pos_pnt-1;

               if (Pos( '+', Text) <> 0) or (Pos('-', Text)<>0)
               then Dec(tam_int);

        			if ((tam_int >= FIntDigits_) and
           			(Key in ['0'..'9', ThousandSeparator]) and (FIntDigits_ <> -1))
           			or ((pos_pnt <> 0) and (Key = DecimalSeparator))
        			then begin
           				MessageBeep(0);
           				Key := #0;
        			  	  end
     		 	  end
     		else begin
        			tam_dec := Length(Text)-pos_pnt;

               { Não deixa tirar o ponto com backspace se tiver parte decimal }
               if (tam_dec > 0) and
                  (SelLength=0) and
                  (Key = #8) and
                  (Text <> '')
               then if Text[SelStart]=DecimalSeparator
                    then begin
        	               MessageBeep(0);
        	               Key := #0;
                    end;

        			if ((tam_dec >= FDecDigits_) and
           			(Key in ['0'..'9', ThousandSeparator, '+', '-', DecimalSeparator])
                   and (FDecDigits_ <> -1))
           			or (Key = DecimalSeparator)
        			then begin
           				MessageBeep(0);
           				Key := #0;
        				  end
     		 	  end;
	  	  end;

	inherited KeyPress(Key);
end;

procedure TEditNum.WMPaste(var Message: TMessage);
begin
  if Not FNumeric_
  	then inherited;
end;

end.
