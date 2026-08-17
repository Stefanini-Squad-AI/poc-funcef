{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 08/01/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlGrInstr;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbGrInstr;

type
  TCtrlGrInstr = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbGrInstr;
    FCds: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListGrauInstrucao(IdGrInstr: double = 0): OleVariant;

    function GravarGrauInstrucao: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlGrInstr }

constructor TCtrlGrInstr.Create;
begin
  inherited;
  FDb := TDbGrInstr.Create(Self);
end;

destructor TCtrlGrInstr.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlGrInstr.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlGrInstr.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlGrInstr.ListGrauInstrucao(IdGrInstr: double): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT';

  if (IdGrInstr = -1) then
    sSQL := sSQL + ' /*+ OPTIMIZER_MODE RULE */';

  sSQL := sSQL +CR_LF+
    '  *'+CR_LF+
    'FROM'+CR_LF+
    '  GRINSTR'+CR_LF;

  if (IdGrInstr = -1) then
    sSQL := sSQL +
      'WHERE'+CR_LF+
      '  (1 = 2)'
  else
  if (IdGrInstr > 0) then
    sSQL := sSQL +
      'WHERE'+CR_LF+
      '  (IDGRINSTR = '+FloatToStr(IdGrInstr)+')'
  else
    sSQL := sSQL +
      'ORDER BY'+CR_LF+
      '  DESCRICAO';

  Result := GetDataPacket(sSQL);
end;

function TCtrlGrInstr.GravarGrauInstrucao: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarGrauInstrucao(FCds.Data);
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
