{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 31/01/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlVlrRubrica;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbVlrrubrica;

type
  TCtrlVlrRubrica = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbVlrrubrica;
    FCds: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListGeral(IdVlrRubrica: string = ''): OleVariant;
    function CarregaRubricas : OleVariant;

    function Gravar: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlVlrRubrica }

constructor TCtrlVlrRubrica.Create;
begin
  inherited;
  FDb := TDbVlrrubrica.Create(Self);
end;

destructor TCtrlVlrRubrica.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlVlrRubrica.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlVlrRubrica.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlVlrRubrica.ListGeral(IdVlrRubrica: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT VR.IDVLRRUBRICA, VR.ANO, VR.MES, VR.VALOR, PD.DESCRICAO, PD.IDPROVENTO '+CR_LF+
    '  from VlrRubrica VR'+CR_LF+
    'INNER JOIN PROVDESC PD ON (VR.IDPROVENTO = PD.IDPROVENTO)' +CR_LF  +
    IFF(IdVlrRubrica='-1', 'WHERE (1 = 2)',
      IFF(IdVlrRubrica='', '', 'WHERE'+CR_LF+
        '  (IdVlrRubrica = '+IdVlrRubrica+')')));
end;

function TCtrlVlrRubrica.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.Gravar(FCds.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(FCds, FDb, [], []);
      if (Result) then
        Commit
      else
        raise Exception.Create(FDb.MessageInfo);
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

function TCtrlVlrRubrica.CarregaRubricas : OleVariant;
begin
  Result := GetDataPacket('SELECT IDPROVENTO, DESCRICAO FROM PROVDESC order by descricao ');
end;

end.
