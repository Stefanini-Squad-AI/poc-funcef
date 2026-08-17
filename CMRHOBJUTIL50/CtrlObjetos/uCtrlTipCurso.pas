{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 14/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlTipCurso;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio,  uCMClientDataSet,
  uCtrlCustomRH, uDbTipCurso;

type
  TCtrlTipCurso = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbTipCurso;
    FCds: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListGeral(IdTipoCurso: double): OleVariant;
    function ListCurso(IdTipoCurso: double): OleVariant;

    function Gravar: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlTipCurso }

constructor TCtrlTipCurso.Create;
begin
  inherited;
  FDb := TDbTipCurso.Create(Self);
end;

destructor TCtrlTipCurso.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlTipCurso.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlTipCurso.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlTipCurso.ListGeral(IdTipoCurso: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdTipoCurso=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IDTIPOCURSO, DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  TIPCURSO'+CR_LF+
    IFF(IdTipoCurso=-1, 'WHERE (1 = 2)',
      IFF(IdTipoCurso=0, '', 'WHERE'+CR_LF+
        '  (IDTIPOCURSO = ' +FloatToStr(IdTipoCurso)+ ')')));
end;

function TCtrlTipCurso.ListCurso(IdTipoCurso: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDCURSO, DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  CURSO'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDTIPOCURSO = '+FloatToStr(IdTipoCurso)+')'+CR_LF+
    'ORDER BY'+CR_LF+
    '  DESCRICAO');
end;

function TCtrlTipCurso.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarTipCurso(FCds.Data);
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
