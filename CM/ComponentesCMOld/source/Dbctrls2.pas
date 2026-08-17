unit DBCtrls2;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Mask, DB, DBTables, DBCtrls, Menus;

type
{ TDBEdit2 }

  TDBEdit2 = class(TDBEdit)
  private
    FDecDigits  : Integer;
    FIntDigits : Integer;
    FSignal    : Boolean;

    procedure WMPaste(var Message: TMessage); message WM_PASTE;

  protected
    procedure KeyPress(var Key: Char); override;
    procedure SetDecDigits(Value: integer);

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  published
  	 property IntDigits : integer read FIntDigits write FIntDigits default 0;
	 property Signal    : boolean read FSignal    write FSignal     default false;
    property DecDigits  : integer read FDecDigits  write SetDecDigits default 0;

  end;

implementation

constructor TDBEdit2.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TDBEdit2.Destroy;
begin
  inherited Destroy;
end;

procedure TDBEdit2.KeyPress(var Key: Char);
var
   tam_dec,
   tam_int,
   pos_pnt : integer;
   decimal : boolean;

begin
   if (Field is TIntegerField) or (Field is TWordField)
        or (Field is TSmallintField)
   then begin
 	{ Testa a posição do sinal }
    	if (((Pos( '+', Text) <> 0) or (Pos('-', Text)<>0)
     	   or (SelStart <> 0) or (not FSignal))
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

        tam_int := Length(Text);

        if (Pos( '+', Text) <> 0) or (Pos('-', Text)<>0)
        then Dec(tam_int);

        if (tam_int >= FIntDigits) and
        (Key in ['0'..'9', ThousandSeparator]) and
        (SelLength = 0) and (FIntDigits <> -1)
        then begin
             MessageBeep(0);
             Key := #0;
        end
   end;

  if (Field is TFloatField) or (Field is TCurrencyField)
  then begin
       { Testa se o ponto é válido }
       if (Key = DecimalSeparator) and (FDecDigits = 0)
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
          or (SelStart <> 0) or (not FSignal))
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

            if ((tam_int >= FIntDigits) and
               (Key in ['0'..'9', ThousandSeparator]) and (FIntDigits <> -1))
               or ((pos_pnt <> 0) and (Key = DecimalSeparator))
            then begin
                 MessageBeep(0);
                 Key := #0;
            end
       end
       else begin
            tam_dec := Length(Text)-pos_pnt;
            if ((tam_dec >= FDecDigits) and
               (Key in ['0'..'9', ThousandSeparator, '+', '-', DecimalSeparator])
               and (FDecDigits <> -1))
               or (Key = DecimalSeparator)
            then begin
                 MessageBeep(0);
           	 Key := #0;
            end
       end;
  end;

  inherited KeyPress(Key);

end;

procedure TDBEdit2.SetDecDigits(Value: integer);
begin
     if not ((Field is TFloatField) or (Field is TCurrencyField)) and not (Field = nil)
     then begin
          ShowMessage('O controle não está associado a um campo do tipo Float ou Currency');
     	Exit;
     end
     else FDecDigits := Value;
end;

procedure TDBEdit2.WMPaste(var Message: TMessage);
begin
  if Not ((Field is TFloatField) or (Field is TCurrencyField)
      or (Field is TIntegerField) or (Field is TWordField)
      or (Field is TSmallintField))
  then inherited;
end;


end.
