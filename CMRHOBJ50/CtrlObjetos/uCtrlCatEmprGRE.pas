{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 04/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlCatEmprGRE;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbCatEmprGRE;

type
  TCtrlCatEmprGRE = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbCatEmprGRE;
    FCds: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListGeral(IdCatEmprGRE: double = 0): OleVariant;

    function Gravar: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlCatEmprGRE }

constructor TCtrlCatEmprGRE.Create;
begin
  inherited;
  FDb := TDbCatEmprGRE.Create(Self);
end;

destructor TCtrlCatEmprGRE.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlCatEmprGRE.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlCatEmprGRE.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlCatEmprGRE.ListGeral(IdCatEmprGRE: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdCatEmprGRE=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IdCatEmprGRE, Descricao'+CR_LF+
    'FROM'+CR_LF+
    '  CatEmprGRE'+CR_LF+
    IFF(IdCatEmprGRE=-1, 'WHERE (1 = 2)',
      IFF(IdCatEmprGRE=0, 'ORDER BY'+CR_LF+'  DESCRICAO', 'WHERE'+CR_LF+
        '  (IdCatEmprGRE = ' +FloatToStr(IdCatEmprGRE)+ ')')));
end;

function TCtrlCatEmprGRE.Gravar: boolean;
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
