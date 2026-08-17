{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 15/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlGrupFunc;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio, uCMClientDataSet,
  uCtrlCustomRH, uDbGrupFunc;

type
  TCtrlGrupFunc = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbGrupFunc;
    FCds: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListGrupoFunc(CodGrpFunc: string = ''): OleVariant;

    function GravarGrupoFunc: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlGrupFunc }

constructor TCtrlGrupFunc.Create;
begin
  inherited;
  FDb := TDbGrupFunc.Create(Self);
end;

destructor TCtrlGrupFunc.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlGrupFunc.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlGrupFunc.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlGrupFunc.ListGrupoFunc(CodGrpFunc: string): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT';

  if (CodGrpFunc = '-1') then
    sSQL := sSQL + ' /*+ OPTIMIZER_MODE RULE */';

  sSQL := sSQL +CR_LF+
    '  *'+CR_LF+
    'FROM'+CR_LF+
    '  GRUPFUNC'+CR_LF;

  if (CodGrpFunc = '-1') then
    sSQL := sSQL +
      'WHERE'+CR_LF+
      '  (1 = 2)'
  else
  if (CodGrpFunc <> '') then
    sSQL := sSQL +
      'WHERE'+CR_LF+
      '  (CODGRPFUNC = '+QuotedStr(CodGrpFunc)+')'
  else
    sSQL := sSQL +
      'ORDER BY'+CR_LF+
      '  UPPER(DESCGRPFUNC)';

  Result := GetDataPacket(sSQL);
end;

function TCtrlGrupFunc.GravarGrupoFunc: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarGrupoFunc(FCds.Data);
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
