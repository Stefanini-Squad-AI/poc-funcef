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

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
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
    constructor Create;  override;
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
    '  IE.IdCurso, IE.IdPessoa, P.Nome'+CR_LF+
    'FROM'+CR_LF+
    '  Pessoa P, InstrutorInterno IE'+CR_LF+
    'WHERE'+CR_LF+
    '  (IE.IdCurso  = '+FloatToStr(IdCurso)+') AND'+CR_LF+
    '  (IE.IdPessoa = P.IdPessoa)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  Upper(P.Nome)');
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
      if (Result) then
        Commit
      else
        raise Exception.Create(FDbInstrutorInterno.MessageInfo);
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
