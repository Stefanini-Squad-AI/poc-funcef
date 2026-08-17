{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 15/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlPacote;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio,  uCMClientDataSet,
  uCtrlCustomRH, uDbPacote;

type
  TCtrlPacote = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbPacote;
    FCds: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function Gravar: boolean;
    function ListGeral(IdPacote: double): OleVariant;
    function ListCurso(IdPacote: double): OleVariant;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlPacote }

constructor TCtrlPacote.Create;
begin
  inherited;
  FDb := TDbPacote.Create(Self);
end;

destructor TCtrlPacote.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlPacote.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlPacote.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlPacote.ListGeral(IdPacote: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdPacote=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IDPACOTE, DESCRICAO, TIPO'+CR_LF+
    'FROM'+CR_LF+
    '  PACOTE'+CR_LF+
    IFF(IdPacote=-1, 'WHERE (1 = 2)',
      IFF(IdPacote=0, '', 'WHERE'+CR_LF+
        '  (IDPACOTE = ' +FloatToStr(IdPacote)+ ')')));
end;

function TCtrlPacote.ListCurso(IdPacote: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDCURSO, DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  CURSO'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDPACOTE = '+FloatToStr(IdPacote)+')'+CR_LF+
    'ORDER BY'+CR_LF+
    '  DESCRICAO');
end;

function TCtrlPacote.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarPacote(FCds.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCds, FDb, [], []);
      if not(Result) then
        raise Exception.Create(FDb.MessageInfo);

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
