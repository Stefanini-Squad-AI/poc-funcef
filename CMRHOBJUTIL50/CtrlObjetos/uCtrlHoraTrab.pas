{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 31/01/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlHoraTrab;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio,  uCMClientDataSet,
  uCtrlCustomRH, uDbHoraTrab;

type
  TCtrlHoraTrab = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbHoraTrab: TDbHoraTrab;
    FCdsHoraTrab: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListHoraTrab(IdHorario: integer = 0; FlgTipoHorario: integer = -1): OleVariant;
    function ListHoraFunc(IdPessoa: double): integer;

    function GravarHoraTrab: boolean;

    property CdsHoraTrab: TCMClientDataSet read FCdsHoraTrab write FCdsHoraTrab;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlHoraTrab }

constructor TCtrlHoraTrab.Create;
begin
  inherited;
  FDbHoraTrab := TDbHoraTrab.Create(Self);
end;

destructor TCtrlHoraTrab.Destroy;
begin
  FDbHoraTrab.Free;
  if (IsAppServer) then
    FCdsHoraTrab.Free;
  inherited;
end;

procedure TCtrlHoraTrab.OnCreateAppServer;
begin
  inherited;
  FCdsHoraTrab := TCMClientDataSet.Create(nil);
end;

procedure TCtrlHoraTrab.DoChangeDataBase;
begin
  inherited;
  FDbHoraTrab.DataBaseName := DataBaseName;
end;

function TCtrlHoraTrab.ListHoraTrab(IdHorario, FlgTipoHorario: integer): OleVariant;
var
  sSQL: string;
begin
  sSQL := '';

  if (FlgTipoHorario > -1) and (IdHorario <> -1) then
    sSQL := 'WHERE' +CR_LF+ '  (FLGTIPOHORARIO = '+IntToStr(FlgTipoHorario)+')'+CR_LF;

  if (IdHorario = -1) then
    sSQL := sSQL + 'WHERE (1 = 2)'
  else
  if (IdHorario = 0) then
    sSQL := sSQL + 'ORDER BY' +CR_LF+ '  NOMEHORARIO'
  else
    sSQL := sSQL + IFF(sSQL='','WHERE' +CR_LF+ '  ',' AND ') +
      '(IDHORARIO = '+FloatToStr(IdHorario)+')'+CR_LF;

  Result := GetDataPacket(
    'SELECT'+IFF(IdHorario=-1, ' /*+ OPTIMIZER_MODE RULE */', '')+CR_LF+
    '  *'+CR_LF+
    'FROM'+CR_LF+
    '  HORATRAB'+CR_LF+
    sSQL);
end;

function TCtrlHoraTrab.ListHoraFunc(IdPessoa: double): integer;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);
  try
    _CdsAux.Data := GetDataPacket(
      'SELECT' +CR_LF+
      '  IDHORARIO' +CR_LF+
      'FROM' +CR_LF+
      '  FUNCIONARIO' +CR_LF+
      'WHERE' +CR_LF+
      '  (IDPESSOA       = ' +FloatToStr(IdPessoa)+ ')');

    Result := _CdsAux.FieldByName('IDHORARIO').asInteger;
  finally
    _CdsAux.Free;
  end;
end;

function TCtrlHoraTrab.GravarHoraTrab: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarHoraTrab(FCdsHoraTrab.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsHoraTrab, FDbHoraTrab, [], []);
      if not(Result) then
        raise Exception.Create(FDbHoraTrab.MessageInfo);

      Commit;
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
