{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 05/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlNatEmpr;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio,  uCMClientDataSet,
  uCtrlCustomRH, uDbNatEmpresa;

type
  TCtrlNatEmpr = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbNatEmpresa;
    FCds: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListGeral(IdNatEmpre: double = 0): OleVariant;

    function Gravar: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlNatEmpr }

constructor TCtrlNatEmpr.Create;
begin
  inherited;
  FDb := TDbNatEmpresa.Create(Self);
end;

destructor TCtrlNatEmpr.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlNatEmpr.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlNatEmpr.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlNatEmpr.ListGeral(IdNatEmpre: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdNatEmpre=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IDNATEMPRE, DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  NATEMPRESA'+CR_LF+
    IFF(IdNatEmpre=-1, 'WHERE (1 = 2)',
      IFF(IdNatEmpre=0, 'ORDER BY'+CR_LF+'  DESCRICAO', 'WHERE'+CR_LF+
        '  (IDNATEMPRE = ' +FloatToStr(IdNatEmpre)+ ')')));
end;

function TCtrlNatEmpr.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarNaturezaEmpresarial(FCds.Data);
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
