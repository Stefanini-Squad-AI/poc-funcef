{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 16/09/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlTurnoSem;

interface

uses SysUtils, uSistema, uCMTypes, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbTurnoSem;

type
  TCtrlTurnoSem = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbTurnoSem: TDbTurnoSem;
    FCdsTurnoSem: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListTurnoSem(IdHorario: integer): OleVariant;
    function ListDiasDaSemana(IdHorario: integer): OleVariant;

    function GravarTurnoSem: boolean;

    property CdsTurnoSem: TCMClientDataSet read FCdsTurnoSem write FCdsTurnoSem;
  end;

implementation

uses uCtrlFuncoesRH;

{ TCtrlTurnoSem }

constructor TCtrlTurnoSem.Create;
begin
  inherited;
  FDbTurnoSem := TDbTurnoSem.Create(Self);
end;

destructor TCtrlTurnoSem.Destroy;
begin
  FDbTurnoSem.Free;
  if (IsAppServer) then
    FCdsTurnoSem.Free;
  inherited;
end;

procedure TCtrlTurnoSem.OnCreateAppServer;
begin
  inherited;
  FCdsTurnoSem := TCMClientDataSet.Create(nil);
end;

procedure TCtrlTurnoSem.DoChangeDataBase;
begin
  inherited;
  FDbTurnoSem.DataBaseName := DataBaseName;
end;

function TCtrlTurnoSem.ListTurnoSem(IdHorario: integer): OleVariant;
begin
  FDbTurnoSem.IdHorario.asFloat := IdHorario;
  FDbTurnoSem.LoadFromDb;
end;

function TCtrlTurnoSem.ListDiasDaSemana(IdHorario: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDHORARIO, IDDIASEMANA, IDTURNODIARIO'+CR_LF+
    'FROM'+CR_LF+
    '  TURNOSEM'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDHORARIO = ' +IntToStr(IdHorario)+ ')');
end;

function TCtrlTurnoSem.GravarTurnoSem: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarTurnoSem(FCdsTurnoSem.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(FCdsTurnoSem, FDbTurnoSem, [], []);
      if (Result) then
        Commit
      else
        raise Exception.Create(FDbTurnoSem.MessageInfo);
    except
      on E: Exception do
      begin
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

end.
