unit gs6_thrd;
{------------------------------------------------------------------------------
                               Disk File Handler

       gs6_thrd Copyright (c) 2000 Griffin Solutions, Inc.

       Date
          21 Jan 1999

       Programmer:
          Richard F. Griffin                     tel: (912) 953-2680
          Griffin Solutions, Inc.             e-mail: halcyon@grifsolu.com
          102 Molded Stone Pl
          Warner Robins, GA  31088

       -------------------------------------------------------------
       This unit handles the objects for multithreading.

------------------------------------------------------------------------------}
{$I gs6_flag.pas}

interface

uses Sysutils, Windows, Messages, Classes;

type
  TgsCriticalSection = class(TObject)
  private
    FSection: TRTLCriticalSection;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Enter;
    procedure Leave;
  end;

implementation

{ TgsCriticalSection }

constructor TgsCriticalSection.Create;
begin
  inherited Create;
  InitializeCriticalSection(FSection);
end;

destructor TgsCriticalSection.Destroy;
begin
  DeleteCriticalSection(FSection);
  inherited Destroy;
end;

procedure TgsCriticalSection.Enter;
begin
  EnterCriticalSection(FSection);
end;

procedure TgsCriticalSection.Leave;
begin
  LeaveCriticalSection(FSection);
end;

end.
