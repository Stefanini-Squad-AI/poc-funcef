{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 14/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlTipSent;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbTipoSentenca;

type
  TCtrlTipSent = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbTipSent: TDbTipoSentenca;
    FCdsTipSent: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListTipSent(CodTipoSent: double = 0): OleVariant;

    function GravarTipSent: boolean;

    property CdsTipSent: TCMClientDataSet read FCdsTipSent write FCdsTipSent;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlTipSent }

constructor TCtrlTipSent.Create;
begin
  inherited;
  FDbTipSent := TDbTipoSentenca.Create(Self);
end;

destructor TCtrlTipSent.Destroy;
begin
  FDbTipSent.Free;
  if (IsAppServer) then
    FCdsTipSent.Free;
  inherited;
end;

procedure TCtrlTipSent.OnCreateAppServer;
begin
  inherited;
  FCdsTipSent := TCMClientDataSet.Create(nil);
end;

procedure TCtrlTipSent.DoChangeDataBase;
begin
  inherited;
  FDbTipSent.DataBaseName := DataBaseName;
end;

function TCtrlTipSent.ListTipSent(CodTipoSent: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(CodTipoSent=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  CodTipoSent, Descricao'+CR_LF+
    'FROM'+CR_LF+
    '  TipoSentenca'+CR_LF+
    IFF(CodTipoSent=-1, 'WHERE (1 = 2)',
      IFF(CodTipoSent=0, 'ORDER BY'+CR_LF+'  DESCRICAO', 'WHERE'+CR_LF+
        '  (CodTipoSent = '+FloatToStr(CodTipoSent)+')')));
end;

function TCtrlTipSent.GravarTipSent: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarTipSent(FCdsTipSent.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(FCdsTipSent, FDbTipSent, [], []);
      if (Result) then
        Commit
      else
        raise Exception.Create(FDbTipSent.MessageInfo);
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
