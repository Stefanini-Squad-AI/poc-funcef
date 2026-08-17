{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 18/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlLinha;

interface

uses SysUtils, DB, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbLinhaTransp;

type
  TCtrlLinha = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbLinhaTransp;
    FCds: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListLinhaTransporte(IdLinhaTransp: integer = 0): OleVariant;

    function Gravar: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlLinha }

constructor TCtrlLinha.Create;
begin
  inherited;
  FDb := TDbLinhaTransp.Create(Self);
end;

destructor TCtrlLinha.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlLinha.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlLinha.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlLinha.ListLinhaTransporte(IdLinhaTransp: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdLinhaTransp=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IdLinhaTransp, Descricao, IdPessoa, TipoLinhaTransp, NumLinhaTransp, VlrLinhaTransp'+CR_LF+
    'FROM'+CR_LF+
    '  LinhaTransp'+CR_LF+
    IFF(IdLinhaTransp=-1, 'WHERE (1 = 2)',
      IFF(IdLinhaTransp=0, 'ORDER BY'+CR_LF+'  DESCRICAO', 'WHERE'+CR_LF+
        '  (IdLinhaTransp = '+IntToStr(IdLinhaTransp)+')')));
end;

function TCtrlLinha.Gravar: boolean;
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
