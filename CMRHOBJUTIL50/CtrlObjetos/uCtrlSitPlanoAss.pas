{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Eugenio Frioli                  }
{ Criado Em: 30/03/2004                                 }
{                                                       }
{*******************************************************}

unit uCtrlSitPlanoAss;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio, uCMTranslate, uCMClientDataSet,
  uCtrlCustomRH, uDbSitPlanoAss;

type
  TCtrlSitPlanoAss = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbSitPlanoAss: TDbSitPlanoAss;
    FCdsSitPlanoAss: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListSitPlanoAss(IdSitPlanoAss: double = 0): OleVariant;

    function GravarSitPlanoAss: boolean;

    property CdsSitPlanoAss: TCMClientDataSet read FCdsSitPlanoAss write FCdsSitPlanoAss;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlSitPlanoAss }

constructor TCtrlSitPlanoAss.Create;
begin
  inherited;
  FDbSitPlanoAss := TDbSitPlanoAss.Create(Self);
end;

destructor TCtrlSitPlanoAss.Destroy;
begin
  FDbSitPlanoAss.Free;
  if (IsAppServer) then
    FCdsSitPlanoAss.Free;
  inherited;
end;

procedure TCtrlSitPlanoAss.OnCreateAppServer;
begin
  inherited;
  FCdsSitPlanoAss := TCMClientDataSet.Create(nil);
end;

procedure TCtrlSitPlanoAss.DoChangeDataBase;
begin
  inherited;
  FDbSitPlanoAss.DataBaseName := DataBaseName;
end;

function TCtrlSitPlanoAss.ListSitPlanoAss(IdSitPlanoAss: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdSitPlanoAss=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IDSITPLANOASS, DESCRICAO, FLGINTERNO'+CR_LF+
    'FROM'+CR_LF+
    '  SITPLANOASS'+CR_LF+
    IFF(IdSitPlanoAss=-1, 'WHERE (1 = 2)',
      IFF(IdSitPlanoAss=0, 'ORDER BY'+CR_LF+'  DESCRICAO', 'WHERE'+CR_LF+
        '  (IDSITPLANOASS = '+FloatToStr(IdSitPlanoAss)+')')));
end;

function TCtrlSitPlanoAss.GravarSitPlanoAss: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarSitPlanoAss(FCdsSitPlanoAss.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsSitPlanoAss, FDbSitPlanoAss, [], []);
      if not(Result) then
        raise Exception.Create(FDbSitPlanoAss.MessageInfo);

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
