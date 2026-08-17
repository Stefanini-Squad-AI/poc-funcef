{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Andre Mesquita                  }
{ Criado Em: 26/03/2007                                 }
{                                                       }
{*******************************************************}

unit uCtrlDstTrecho;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
     uDbDSTTrecho, uCtrlCustomRH;

type
  TCtrlDSTTrecho = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbDstTrecho  : TDbDstTrecho;
    FCdsDstTrecho : TCMClientDataSet;
    procedure SetCdsDstTrecho(const Value: TCMClientDataSet);
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function GravarDstTrecho: boolean;

    property CdsDstTrecho: TCMClientDataSet read FCdsDstTrecho write SetCdsDstTrecho;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlDSTTrecho }

constructor TCtrlDSTTrecho.Create;
begin
  inherited;
  FDbDstTrecho := TDbDstTrecho.Create(Self);
end;

destructor TCtrlDSTTrecho.Destroy;
begin
  FDbDstTrecho.Free;
  if (IsAppServer) then
    FCdsDstTrecho.Free;
  inherited;
end;

procedure TCtrlDSTTrecho.OnCreateAppServer;
begin
  inherited;
  FCdsDstTrecho := TCMClientDataSet.Create(nil);
end;

procedure TCtrlDSTTrecho.DoChangeDataBase;
begin
  inherited;
  FDbDstTrecho.DataBaseName := DataBaseName;
end;

function TCtrlDSTTrecho.GravarDstTrecho: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarDstTrecho(FCdsDstTrecho.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(FCdsDstTrecho, FDbDstTrecho, [], []);
      if (Result) then
        Commit
      else
        raise Exception.Create(FDbDstTrecho.MessageInfo);
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

procedure TCtrlDSTTrecho.SetCdsDstTrecho(const Value: TCMClientDataSet);
begin
  FCdsDstTrecho := Value;
end;

end.
