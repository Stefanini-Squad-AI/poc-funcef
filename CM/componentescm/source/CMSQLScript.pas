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
unit CMSQLScript;

interface

uses
  Windows, Messages, Bde, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DB, DBTables, DBCtrls;

type
  EScriptError = class(Exception)
    ErrPos : integer;
    constructor Create2(AMessage : string; AErrPos : integer);
  end;

  TCommit = (ctNone, ctStep, ctAll);

  TCMSQLScript = class;
  TOnScriptProgress = procedure(Sender : TCMSQLScript; var Cancel : boolean; Line : integer; cmd : string) of object;

  TScriptErrorAction = (eaNone, eaRepeat, eaSkip, eaAbort);
  TScriptError = procedure(cmd:string; e:Exception; var Action:TScriptErrorAction) of object;

  TAfterCommand = procedure(Sender : TCMSQLScript) of object;
  TCMSQLScript = class(TComponent)
  private
    FOnProgress : TOnScriptProgress;
    FOnScriptError : TScriptError;
    FAfterCommand : TAfterCommand;
    FScript : TStrings;
    FCommit : TCommit;
    FDatabase : TDatabase;
    FStopOnError : boolean;
    FDataBaseName : string;
    _ExecuteAll : boolean;
    procedure SetScript(AValue : TStrings);
    procedure Progress(UserData : integer; var Cancel : boolean; Line : integer; cmd : string);
    procedure ExecuteSQLScript(Base : TDataBase; const Script : string; const Commit : TCommit; const UserData : integer; StopOnError : boolean);
    procedure GetXYByPos(const S : string; const Pos : integer; var X, Y : integer);
    procedure SetDataBaseName(s:string);
    procedure ScriptErro(cmd:string; e:Exception; var Action:TScriptErrorAction);
    procedure DepoisDoComando(Sender : TCMSQLScript);
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
  published
    procedure Execute;
    property OnProgress : TOnScriptProgress read FOnProgress write FOnProgress;
    property Script : TStrings read FScript write SetScript;
    property Commit : TCommit read FCommit write FCommit;
    property DataBaseName: string   read FDataBaseName write SetDataBaseName;
    property OnScriptError: TScriptError read FOnScriptError write FOnScriptError;
    property AfterCommand: TAfterCommand read FAfterCommand write FAfterCommand;
  end;

implementation



{******************* TCMSQLScript ********************}
constructor TCMSQLScript.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  FScript := TStringList.Create;
end;

destructor TCMSQLScript.Destroy;
begin
  FScript.Free;
  inherited Destroy;
end;

procedure TCMSQLScript.SetScript(AValue : TStrings);
begin
  FScript.Assign(AValue);
end;

procedure TCMSQLScript.Execute;
Var
  upperScript: String;
begin
  upperScript := UpperCase(Script.Text);

  _ExecuteAll :=  ((Pos('DROP ', upperScript) = 0) And
                   ((Pos(' VIEW ',upperScript) <> 0) Or
                   (Pos(' FUNCTION ',upperScript) <> 0) Or
                   (Pos(' TRIGGER ',upperScript) <> 0) Or
                   (Pos(' PROCEDURE ',upperScript) <> 0)));


  ExecuteSQLScript(FDatabase, FScript.Text, FCommit, 0, FStopOnError);
end;

procedure TCMSQLScript.SetDataBaseName(s:string);
var i : integer;
    db : TDataBase;
begin
     if (s <> '') and (s <> FDataBaseName) then
     begin
          FDataBaseName := s;
          if not(csDesigning in ComponentState) then
          begin
               for i := 0 to Sessions.Count-1 do
               begin
                    db := Sessions.Sessions[i].FindDatabase(s);
                    if db <> nil then
                       FDataBase := db;
              end;
          end;
     end;
end;

procedure TCMSQLScript.ExecuteSQLScript(Base : TDataBase; const Script : string; const Commit : TCommit; const UserData : integer; StopOnError : boolean);
var
  N : integer;
  Term : char;
  ErrorAction : TScriptErrorAction;

  function NextQuery : string;
  var
    C : char;
    Rem : boolean;
  begin
    Result := '';
    Rem := false;

    If _ExecuteAll Then
    Begin
      N := (Length(Script) + 1);
      Result := Script;
      Exit; 
    End
    Else
      while Length(Script) >= N do begin
        C := Script[N];
        inc(N);
        if (C = Term) and not Rem then exit;
        Result := Result + C;
        if (C = '/') and (Length(Script) >= N) and (Script[N] = '*') then
          Rem := true;
        if (C = '*') and (Length(Script) >= N) and (Script[N] = '/') and Rem then
          Rem := false;
      end;

    Result := '';
  end;

  function SetTerm(S : string) : boolean;
  var
    Rem : boolean;
  begin
    Rem := false;
    while (Length(S) > 0) do begin
      if (S[1] in [' ', #13, #10]) then Delete(S, 1, 1)
      else
      if Rem then
        if (S[1] = '*') and (Length(S) > 1) and (S[2] = '/') then begin
          Delete(S, 1, 2);
          Rem := false;
        end else
          Delete(S, 1, 1)
      else
      if (S[1] = '/') and (Length(S) > 1) and (S[2] = '*') then begin
        Delete(S, 1, 2);
        Rem := true;
      end
      else break;
    end;
    Result := ANSIStrLIComp(PChar(S), 'set term', 8) = 0;
    if Result then begin
      S := Trim(Copy(S, 9, 1024));
      if Length(S) = 1 then
        Term := S[1] else
        EDatabaseError.Create('Bad term');
      exit;
    end;
    Result := ANSIStrLIComp(PChar(S), 'commit work', 11) = 0;
    if Result then begin
      FDataBase.Commit;
      FDataBase.StartTransaction;
      exit;
    end;
  end;

var
  Q : string;
  ErrPos : integer;
  NBeg : integer;
  X, Y, N2, i : integer;
  S1 : string;
  Query : TQuery;
  Stop : boolean;
begin
     if FCommit in [ctStep, ctAll] then
        FDataBase.StartTransaction;

     Query := TQuery.Create(Application);
     try
        Query.DatabaseName := FDatabaseName;
        Query.ParamCheck := false;
        N := 1;
        Term := ';';
        Stop := false;
        NBeg := 1;
        try
           Q := NextQuery;
           while Q <> '' do
           begin
                ErrorAction := eaNone;
                if not SetTerm(Q) then
                begin
                     if Assigned(OnProgress) then
                     begin
                          S1 := Q;
                          N2 := 0;
                          while (Length(S1) > 0) and (S1[1] in [' ', #13, #10]) do
                          begin
                               Delete(S1, 1, 1);
                               inc(N2);
                          end;
                          GetXYByPos(Script, NBeg+N2, X, Y);
                          Progress(UserData, Stop, Y, q);

                          if Stop then
                          begin
                               ErrorAction := eaAbort;
                               Abort;
                          end;
                     end;
                     Query.SQL.Text := Q;
                     try
                        Query.ExecSQL;
                        DepoisdoComando(self);
                        if FCommit = ctStep then
                        begin
                             Base.Commit;
                             Base.StartTransaction;
                        end;
                     except on E : Exception do
                            ScriptErro(q, e, ErrorAction);
                     end;
                     Query.Close;
                end;

                case ErrorAction of
                     eaAbort : begin
                                    Q := '';
                                    if (FCommit in [ctStep, ctAll]) and Base.InTransaction then
                                       Base.Rollback;
                               end;
                     eaSkip, eaNone : begin
                                           NBeg := N+1;
                                           If _ExecuteAll Then
                                              Q := ''
                                           Else
                                              Q := NextQuery;
                                      end;
                     eaRepeat :  If _ExecuteAll Then Q := '';
                end;
           end;
           if (FCommit in [ctStep, ctAll]) and Base.InTransaction then
              Base.Commit;
        except
              on E : Exception do
              begin
                   if FCommit in [ctStep, ctAll] then
                      Base.Rollback;

                   if E is EDatabaseError then
                   begin
                        if E is EDBEngineError then
                        begin
                             for i := 0 to EDBEngineError(e).ErrorCount -1 do
                                 ShowMessage(EDBEngineError(e).Errors[i].Message);
                             raise;
                        end
                        else
                        begin
                             ErrPos := NBeg;
                             //..
                             raise EScriptError.Create2(E.Message, ErrPos)
                        end;
                   end
                   else
                       raise;
              end;
        end;
     finally
            Query.Free;
     end;
end;

procedure TCMSQLScript.Progress(UserData : integer; var Cancel : boolean; Line : integer; cmd : string);
begin
  if Assigned(FOnProgress) then FOnProgress(Self, Cancel, Line, cmd);
  Application.ProcessMessages;
end;

procedure TCMSQLScript.GetXYByPos(const S : string; const Pos : integer; var X, Y : integer);
{âîçâðàùàåò ïî èíäåêñó Pos - íîìåðó ñèìâîëà - åãî êîîðäèíàòû}
var
  i, iB : integer;
begin
  X := -1; Y := -1; iB := 0;
  if (Length(S) >= Pos) and (Pos >= 0) then begin
    i := 1;
    Y := 0;
    while (i <= Pos) do begin
      if S[i] = #13 then begin inc(Y); iB := i+1 end;
      inc(i);
    end;
    X := Pos - iB;
  end;
end;

constructor EScriptError.Create2(AMessage : string; AErrPos : integer);
begin
  inherited Create(AMessage);
  ErrPos := AErrPos;
end;

procedure TCMSQLScript.ScriptErro(cmd:string; e:Exception; var Action:TScriptErrorAction);
begin
     if Assigned(FOnScriptError) then
        FOnScriptError(cmd, e, Action);
end;

procedure TCMSQLScript.DepoisDoComando(Sender : TCMSQLScript);
begin
     if Assigned(FAfterCommand) then
        FAfterCommand(Sender);
end;
end.
