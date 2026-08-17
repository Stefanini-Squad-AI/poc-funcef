{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 08/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlTipProc;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbTipoProcesso;

type
  TCtrlTipProc = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbTipProc: TDbTipoProcesso;
    FCdsTipProc: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListTipProc(IdTipoProc: double = 0): OleVariant;

    function GravarTipProc: boolean;

    property CdsTipProc: TCMClientDataSet read FCdsTipProc write FCdsTipProc;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlTipProc }

constructor TCtrlTipProc.Create;
begin
  inherited;
  FDbTipProc := TDbTipoProcesso.Create(Self);
end;

destructor TCtrlTipProc.Destroy;
begin
  FDbTipProc.Free;
  if (IsAppServer) then
    FCdsTipProc.Free;
  inherited;
end;

procedure TCtrlTipProc.OnCreateAppServer;
begin
  inherited;
  FCdsTipProc := TCMClientDataSet.Create(nil);
end;

procedure TCtrlTipProc.DoChangeDataBase;
begin
  inherited;
  FDbTipProc.DataBaseName := DataBaseName;
end;

function TCtrlTipProc.ListTipProc(IdTipoProc: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdTipoProc=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IdTipoProc, NomeTipoProc, ProcFixo, FlgExigeCcusto'+CR_LF+
    'FROM'+CR_LF+
    '  TipoProcesso'+CR_LF+
    IFF(IdTipoProc=-1, 'WHERE (1 = 2)',
      IFF(IdTipoProc=0, 'ORDER BY'+CR_LF+'  NomeTipoProc', 'WHERE'+CR_LF+
        '  (IdTipoProc = '+FloatToStr(IdTipoProc)+')')));
end;

function TCtrlTipProc.GravarTipProc: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarTipProc(FCdsTipProc.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(FCdsTipProc, FDbTipProc, [], []);
      if (Result) then
        Commit
      else
        raise Exception.Create(FDbTipProc.MessageInfo);
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
