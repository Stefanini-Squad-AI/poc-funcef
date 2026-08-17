{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 14/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlTipRec;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet, uDbTipoRecTrab;

type
  TCtrlTipRec = class(TCmControlObject)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbTipoRecTrab;
    FCds: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function Gravar: boolean;
    function ListGeral(CodTipoRecurso: real): OleVariant;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uFuncoesUteis;

{ TCtrlTipRec }

constructor TCtrlTipRec.Create;
begin
  inherited;
  FDb := TDbTipoRecTrab.Create(Self);
end;

destructor TCtrlTipRec.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlTipRec.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlTipRec.DoChangeDataBase;
begin
  inherited;
  FDb.DatabaseName := DataBaseName;
end;

function TCtrlTipRec.ListGeral(CodTipoRecurso: real): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(CodTipoRecurso=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  CodTipoRecurso, Descricao, ValorHonor'+CR_LF+
    'FROM'+CR_LF+
    '  TipoRecTrab'+CR_LF+
    IFF(CodTipoRecurso=-1, 'WHERE (1 = 2)',
        IFF(CodTipoRecurso=0, '', 'WHERE'+CR_LF+
            '  (CodTipoRecurso = '+FloatToStr(CodTipoRecurso)+')')));
end;

function TCtrlTipRec.Gravar: boolean;
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
