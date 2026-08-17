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
unit CMDateTimePicker;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, wwdbdatetimepicker, wwframe;

type
  TCMDateTimePicker = class(TwwDBDateTimePicker)
  private
    { Private declarations }
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
  protected
    { Protected declarations }
  public
    { Public declarations }
    Constructor Create(Aowner:TComponent); Override;

    
    procedure Clear; override;

  published
    { Published declarations }
  end;

implementation

{$R *.RES}

{ TCMDateTimePicker }

procedure TCMDateTimePicker.Clear;
begin
  inherited;
  DateTime := 0.0;
  TokenPos := 1;
  Update;
end;




procedure TCMDateTimePicker.CMTextChanged(var Message: TMessage);
 function IsDate(sDate :String):Boolean;
 Var
   X :Integer;
 Begin
   If (Length(sDate) >= 8) Then
   Begin
     Result := True;
     For X:=1 To Length(sDate) Do
     Begin
       Result := (sDate[x] in ['0','1','2','3','4','5','6','7','8','9','/',':']);

       If Not Result Then  Break;
     End;
   End
   Else
     Result := False;
 End;
begin
  If hasparent And
     (Not (csFreeNotification in ComponentState)) And
     (Not (csDesigning in ComponentState)) Then
  Begin
    If (Trim(Text) = '') Then
       Clear
    Else
      If IsDate(Text) Then
         Date := StrToDate(Text);
  End;

  Inherited;
end;

constructor TCMDateTimePicker.Create(Aowner: TComponent);
begin
  inherited Create(Aowner);
  ButtonGlyph.LoadFromResourceName(hinstance,'CMCALENDARIO_PADRAO');
  ButtonStyle := cbsCustom;
end;

end.
