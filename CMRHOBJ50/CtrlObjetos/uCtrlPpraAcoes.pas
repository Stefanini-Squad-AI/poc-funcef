{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 31/01/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlPpraAcoes;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbPpraAcoes;

type
  TCtrlPpraAcoes = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbPpraAcoes;
    FCds: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListGeral(IdAcoes: double = 0): OleVariant;

    function Gravar: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlPpraAcoes }

constructor TCtrlPpraAcoes.Create;
begin
  inherited;
  FDb := TDbPpraAcoes.Create(Self);
end;

destructor TCtrlPpraAcoes.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlPpraAcoes.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlPpraAcoes.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlPpraAcoes.ListGeral(IdAcoes: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdAcoes=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IDACOES, DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  PPRAACOES'+CR_LF+
    IFF(IdAcoes=-1, 'WHERE (1 = 2)',
      IFF(IdAcoes=0, 'ORDER BY' +CR_LF+ '  DESCRICAO', 'WHERE'+CR_LF+
        '  (IDACOES = ' +FloatToStr(IdAcoes)+ ')')));
end;

function TCtrlPpraAcoes.Gravar: boolean;
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
