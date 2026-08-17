{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 29/10/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlInstrutorInterno;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio,  uCMClientDataSet,
  uCtrlCustomRH, uDbInstrutorInterno;

type
  TCtrlInstrutorInterno = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbInstrutorInterno: TDbInstrutorInterno;
    FCdsInstrutorInterno: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListInstrutorInterno(IdCurso: double): OleVariant;

    function GravarInstrutorInterno: boolean;

    property CdsInstrutorInterno: TCMClientDataSet read FCdsInstrutorInterno write FCdsInstrutorInterno;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlInstrutorInterno }

constructor TCtrlInstrutorInterno.Create;
begin
  inherited;
  FDbInstrutorInterno := TDbInstrutorInterno.Create(Self);
end;

destructor TCtrlInstrutorInterno.Destroy;
begin
  FDbInstrutorInterno.Free;
  if (IsAppServer) then
    FCdsInstrutorInterno.Free;
  inherited;
end;

procedure TCtrlInstrutorInterno.OnCreateAppServer;
begin
  inherited;
  FCdsInstrutorInterno := TCMClientDataSet.Create(nil);
end;

procedure TCtrlInstrutorInterno.DoChangeDataBase;
begin
  inherited;
  FDbInstrutorInterno.DataBaseName := DataBaseName;
end;

function TCtrlInstrutorInterno.ListInstrutorInterno(IdCurso: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IE.IDCURSO, IE.IDPESSOA, P.NOME'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, INSTRUTORINTERNO IE'+CR_LF+
    'WHERE'+CR_LF+
    '  (IE.IDCURSO  = '+FloatToStr(IdCurso)+') AND'+CR_LF+
    '  (IE.IDPESSOA = P.IDPESSOA)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  UPPER(P.NOME)');
end;

function TCtrlInstrutorInterno.GravarInstrutorInterno: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarInstrutorInterno(FCdsInstrutorInterno.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsInstrutorInterno, FDbInstrutorInterno, [], []);
      if not(Result) then
        raise Exception.Create(FDbInstrutorInterno.MessageInfo);

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
