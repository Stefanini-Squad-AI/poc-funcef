{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 31/01/2002                                 }
{                                                       }
{*******************************************************}
{******************************************************************************
Nº SOL: 259921/18014 - ER159
Nº PPM: 1217940
Data da Alteração: 10/03/2016
Alteração Form: Alterações de leiaute e campos de tabela para atender ao eSocial.
Responsável: Michelle Suellyn Mota
Descrição: Criação da function ListCodExists para consistir campo código .
********************************************************************************}

unit uCtrlTurnoDia;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbTurnoDia;

type
  TCtrlTurnoDia = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbTurnoDia;
    FCds: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListTurnoDiario(IdTurnoDiario: integer = 0): OleVariant;
    function ListCodExists(IdTurnoDiario: String): OleVariant;// Michelle Mota - SOL: 259921.18014 - PPM: 1217940
    function Gravar: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlTurnoDia }

constructor TCtrlTurnoDia.Create;
begin
  inherited;
  FDb := TDbTurnoDia.Create(Self);
end;

destructor TCtrlTurnoDia.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlTurnoDia.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlTurnoDia.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlTurnoDia.ListTurnoDiario(IdTurnoDiario: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdTurnoDiario=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  *'+CR_LF+
    'FROM'+CR_LF+
    '  TurnoDia'+CR_LF+
    IFF(IdTurnoDiario=-1, 'WHERE (1 = 2)',
      IFF(IdTurnoDiario=0, 'ORDER BY'+CR_LF+'  IdTurnoDiario', 'WHERE'+CR_LF+
        '  (IdTurnoDiario = '+FloatToStr(IdTurnoDiario)+')')));
end;
// Início - Michelle Mota - SOL: 259921.18014 - PPM: 1217940
function TCtrlTurnoDia.ListCodExists(IdTurnoDiario: String): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT IDTURNODIARIO FROM'+CR_LF+
    '  TurnoDia where idturnodiario = ' + (IdTurnoDiario) );
end;
// Término - Michelle Mota - SOL: 259921.18014 - PPM: 1217940

function TCtrlTurnoDia.Gravar: boolean;
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
      StartTransaction;
      Result := ApplyCds(FCds, FDb, [], []);
      if (Result) then
        Commit
      else
        raise Exception.Create(FDb.MessageInfo);
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
