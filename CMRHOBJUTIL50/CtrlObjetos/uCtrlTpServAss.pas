{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Eugenio Frioli                  }
{ Criado Em: 29/03/2004                                 }
{                                                       }
{*******************************************************}

unit uCtrlTpServAss;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio, uCMTranslate, uCMClientDataSet,
  uCtrlCustomRH, uDbTpServAss;

type
  TCtrlTpServAss = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbTpServAss: TDbTpServAss;
    FCdsTpServAss: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListTpServAss(IdServAss: double = 0): OleVariant;

    function GravarTpServAss: boolean;

    property CdsTpServAss: TCMClientDataSet read FCdsTpServAss write FCdsTpServAss;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlTpServAss }

constructor TCtrlTpServAss.Create;
begin
  inherited;
  FDbTpServAss := TDbTpServAss.Create(Self);
end;

destructor TCtrlTpServAss.Destroy;
begin
  FDbTpServAss.Free;
  if (IsAppServer) then
    FCdsTpServAss.Free;
  inherited;
end;

procedure TCtrlTpServAss.OnCreateAppServer;
begin
  inherited;
  FCdsTpServAss := TCMClientDataSet.Create(nil);
end;

procedure TCtrlTpServAss.DoChangeDataBase;
begin
  inherited;
  FDbTpServAss.DataBaseName := DataBaseName;
end;

function TCtrlTpServAss.ListTpServAss(IdServAss: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdServAss=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IDSERVASS, NOME'+CR_LF+
    'FROM'+CR_LF+
    '  TPSERVASS'+CR_LF+
    IFF(IdServAss=-1, 'WHERE (1 = 2)',
      IFF(IdServAss=0, 'ORDER BY'+CR_LF+'  NOME', 'WHERE'+CR_LF+
        '  (IDSERVASS = '+FloatToStr(IdServAss)+')')));
end;

function TCtrlTpServAss.GravarTpServAss: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarTpServAss(FCdsTpServAss.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsTpServAss, FDbTpServAss, [], []);
      if not(Result) then
        raise Exception.Create(FDbTpServAss.MessageInfo);

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
