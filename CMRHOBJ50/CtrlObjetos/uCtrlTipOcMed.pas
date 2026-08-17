{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 05/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlTipOcMed;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbTipOcMed;

type
  TCtrlTipOcMed = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbTipOcMed;
    FCds: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListTipoOcorrenciaMed(CodTipoOcMed: double = 0): OleVariant;
    function ListTipoOcorrenciaMedComPeriodicidade: OleVariant;

    function GravarTipoOcorrenciaMed: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlTipOcMed }

constructor TCtrlTipOcMed.Create;
begin
  inherited;
  FDb := TDbTipOcMed.Create(Self);
end;

destructor TCtrlTipOcMed.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlTipOcMed.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlTipOcMed.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlTipOcMed.ListTipoOcorrenciaMed(CodTipoOcMed: double): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT';

  if (CodTipoOcMed = -1) then
    sSQL := sSQL + ' /*+ OPTIMIZER_MODE RULE */';

  sSQL := sSQL +CR_LF+
    '  *'+CR_LF+
    'FROM'+CR_LF+
    '  TIPOCMED'+CR_LF;

  if (CodTipoOcMed = -1) then
    sSQL := sSQL +
      'WHERE'+CR_LF+
      '  (1 = 2)'
  else
  if (CodTipoOcMed > 0) then
    sSQL := sSQL +
      'WHERE'+CR_LF+
      '  (CODTIPOOCMED = '+FloatToStr(CodTipoOcMed)+')'
  else
  sSQL := sSQL +
    'ORDER BY'+CR_LF+
    '  UPPER(DESCRTIPOOCMED)';

  Result := GetDataPacket(sSQL);
end;

function TCtrlTipOcMed.ListTipoOcorrenciaMedComPeriodicidade: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT DISTINCT'+CR_LF+
    '  TM.CODTIPOOCMED, TM.DESCRTIPOOCMED'+CR_LF+
    'FROM'+CR_LF+
    '  TIPOCMED TM, PEREXAME PE'+CR_LF+
    'WHERE'+CR_LF+
    '  (TM.CODTIPOOCMED = PE.CODTIPOOCMED)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  UPPER(DESCRTIPOOCMED)');
end;
    
function TCtrlTipOcMed.GravarTipoOcorrenciaMed: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarTipoOcorrenciaMed(FCds.Data);
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
