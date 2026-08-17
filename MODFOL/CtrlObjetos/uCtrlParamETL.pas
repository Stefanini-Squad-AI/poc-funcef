{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Leandro Pocebon                 }
{ Criado Em: 24/06/2024                                 }
{                                                       }
{*******************************************************}

unit uCtrlParamETL;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbParamETL;

type
  TCtrlParamETL = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbParamETL;
    FCds: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListGeral(Id: double = 0): OleVariant;


    function Gravar: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlParamETL }

constructor TCtrlParamETL.Create;
begin
  inherited;
  FDb := TDbParamETL.Create(Self);
end;

destructor TCtrlParamETL.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlParamETL.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlParamETL.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlParamETL.ListGeral(Id: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(Id=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  ID, CODIGO, DESCRICAO, VALOR, DT_INICIO, DT_FIM'+CR_LF+
    'FROM'+CR_LF+
    '  PARAMFP'+CR_LF+
    IFF(Id=-1, 'WHERE (1 = 2)',
      IFF(Id=0, '', 'WHERE'+CR_LF+
        '  (Id = ' +FloatToStr(Id)+ ')')));
end;



function TCtrlParamETL.Gravar: boolean;
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
