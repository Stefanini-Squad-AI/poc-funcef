{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 31/01/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlPpraCipaFuncao;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio, uCMTranslate, uCMClientDataSet,
  uCtrlCustomRH, uDbPpraCipaFuncao;

type
  TCtrlPpraCipaFuncao = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbPpraCipaFuncao;
    FCds: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListGeral(IdCipaFuncao: double = 0): OleVariant;

    function Gravar: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlPpraCipaFuncao }

constructor TCtrlPpraCipaFuncao.Create;
begin
  inherited;
  FDb := TDbPpraCipaFuncao.Create(Self);
end;

destructor TCtrlPpraCipaFuncao.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlPpraCipaFuncao.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlPpraCipaFuncao.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlPpraCipaFuncao.ListGeral(IdCipaFuncao: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdCipaFuncao=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IDCIPAFUNCAO, DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  PPRACIPAFUNCAO'+CR_LF+
    IFF(IdCipaFuncao=-1, 'WHERE (1 = 2)',
      IFF(IdCipaFuncao=0, '', 'WHERE'+CR_LF+
        '  (IDCIPAFUNCAO = ' +FloatToStr(IdCipaFuncao)+ ')')));
end;

function TCtrlPpraCipaFuncao.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarPpraCipaFuncao(FCds.Data);
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
