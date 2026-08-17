{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 08/04/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlRateioProcTrab;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet, uDbRateioProcTrab;

type
  TCtrlRateioProcTrab = class(TCmControlObject)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbRateioProcTrab;
    FCds: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function Gravar: boolean;
    function ListGeral(IdFilialPessoa: real): OleVariant;
    function ListEstab(IdPessoa: real): OleVariant;
    function ListEntid: OleVariant;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uFuncoesUteis;

{ TCtrlRateioProcTrab }

constructor TCtrlRateioProcTrab.Create;
begin
  inherited;
  FDb := TDbRateioProcTrab.Create(Self);
end;

destructor TCtrlRateioProcTrab.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlRateioProcTrab.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlRateioProcTrab.DoChangeDataBase;
begin
  inherited;
  FDb.DatabaseName := DataBaseName;
end;

function TCtrlRateioProcTrab.ListGeral(IdFilialPessoa: real): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IdFilialPessoa, IdPessoa, TipoRateio, DataBase, Periodo,'+CR_LF+
    '  ValorBase1, ValorBase2, ValorBase3, ValorBase4, ValorBase5,'+CR_LF+
    '  Percent1, Percent2, Percent3, Percent4, Percent5'+CR_LF+
    'FROM'+CR_LF+
    '  RateioProcTrab'+CR_LF+
    'WHERE'+CR_LF+
    '  (IdFilialPessoa = '+FloatToStr(IdFilialPessoa)+')');
end;

function TCtrlRateioProcTrab.ListEstab(IdPessoa: real): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDPESSOA, NOME'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDPESSOA = '+FloatToStr(IdPessoa)+')');
end;

function TCtrlRateioProcTrab.ListEntid: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  P.IDPESSOA, P.NOME'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, FORNSERV F'+CR_LF+
    'WHERE'+CR_LF+
    '  (F.IDPESSOA = P.IDPESSOA)');
end;

function TCtrlRateioProcTrab.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.Gravar(FCds.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      Result := ApplyCds(FCds, FDb, [], []);
      if not(Result) then
        MessageInfo := FDb.MessageInfo;
    except
      on E: Exception do
      begin
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

end.
