{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 04/02/2002                                 }
{                                                       }
{*******************************************************}
{*******************************************************************************
Nº SOL: 250384.17324
Nº PPM 1070235
Data da Alteração: 12/02/2016
Alteração Form: Leiaute e campos novos
Responsável: Michelle Suellyn Mota    
Descrição: Mudança no leiaute e campos novos para adequar ao eSocial
*******************************************************************************}
unit uCtrlSitRisco;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbSitRiscoFGTS;

type
  TCtrlSitRisco = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbSitRiscoFGTS;
    FCds: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListGeral(IdSitRisco: double = 0): OleVariant;

    function Gravar: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlSitRisco }

constructor TCtrlSitRisco.Create;
begin
  inherited;
  FDb := TDbSitRiscoFGTS.Create(Self);
end;

destructor TCtrlSitRisco.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlSitRisco.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlSitRisco.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlSitRisco.ListGeral(IdSitRisco: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdSitRisco=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IdSitRisco, Descricao, FLGMULTVINCULOS '+CR_LF+ //Michelle Mota - SOL: 250384.17324 - PPM: 1070235
    'FROM'+CR_LF+
    '  SitRiscoFGTS'+CR_LF+
    IFF(IdSitRisco=-1, 'WHERE (1 = 2)',
      IFF(IdSitRisco=0, 'ORDER BY'+CR_LF+'  DESCRICAO', 'WHERE'+CR_LF+
        '  (IdSitRisco = '+FloatToStr(IdSitRisco)+')')));
end;

function TCtrlSitRisco.Gravar: boolean;
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

end.
