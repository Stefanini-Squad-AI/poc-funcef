{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 08/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlTipAcao;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio, uCMClientDataSet,
  uCtrlCustomRH, uDbTipoAcaoProcJur;

type
  TCtrlTipAcao = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbTipAcao: TDbTipoAcaoProcJur;
    FCdsTipAcao: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListTipAcao(IdTipoAcao: double = 0): OleVariant;

    function GravarTipAcao: boolean;

    property CdsTipAcao: TCMClientDataSet read FCdsTipAcao write FCdsTipAcao;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlTipAcao }

constructor TCtrlTipAcao.Create;
begin
  inherited;
  FDbTipAcao := TDbTipoAcaoProcJur.Create(Self);
end;

destructor TCtrlTipAcao.Destroy;
begin
  FDbTipAcao.Free;
  if (IsAppServer) then
    FCdsTipAcao.Free;
  inherited;
end;

procedure TCtrlTipAcao.OnCreateAppServer;
begin
  inherited;
  FCdsTipAcao := TCMClientDataSet.Create(nil);
end;

procedure TCtrlTipAcao.DoChangeDataBase;
begin
  inherited;
  FDbTipAcao.DataBaseName := DataBaseName;
end;

function TCtrlTipAcao.ListTipAcao(IdTipoAcao: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdTipoAcao=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IDTIPOACAO, DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  TIPOACAOPROCJUR'+CR_LF+
    IFF(IdTipoAcao=-1, 'WHERE (1 = 2)',
      IFF(IdTipoAcao=0, 'ORDER BY'+CR_LF+'  DESCRICAO', 'WHERE'+CR_LF+
        '  (IDTIPOACAO = '+FloatToStr(IdTipoAcao)+')')));
end;

function TCtrlTipAcao.GravarTipAcao: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarTipAcao(FCdsTipAcao.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsTipAcao, FDbTipAcao, [], []);
      if not(Result) then
        raise Exception.Create(FDbTipAcao.MessageInfo);

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
