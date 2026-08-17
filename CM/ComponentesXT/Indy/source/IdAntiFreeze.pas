unit IdAntiFreeze;

{
NOTE - This unit must NOT appear in any Indy uses clauses. This is a ONE way relationship
and is linked in IF the user uses this component. This is done to preserve the isolation from the
massive FORMS unit.
}

interface

uses
  Classes,
  IdAntiFreezeBase,
  IdBaseComponent;

type
  TIdAntiFreeze = class(TIdAntiFreezeBase)
  public
    procedure Process; override;
  end;

implementation

uses
  {$IFDEF LINUX}
  QForms;
  {$ELSE}
  Forms,
  Messages,
  Windows;
  {$ENDIF}

{$IFDEF LINUX}
procedure TIdAntiFreeze.Process;
begin
  //TODO: Handle ApplicationHasPriority
  Application.ProcessMessages;
end;
{$ELSE}
procedure TIdAntiFreeze.Process;
var
  Msg: TMsg;
begin
  if ApplicationHasPriority then begin
    Application.ProcessMessages;
  end else begin
    // This guarantees it will not ever call Application.Idle
    if PeekMessage(Msg, 0, 0, 0, PM_NOREMOVE) then begin
      Application.HandleMessage;
    end;
  end;
end;
{$ENDIF}

end.
