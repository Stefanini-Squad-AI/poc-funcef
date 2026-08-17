{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 08/01/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlGrpObjeto;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet, uDbGrpObjProcJur;

type
  TCtrlGrpObjeto = class(TCmControlObject)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbGrpObjProcJur;
    FCds: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function Gravar: boolean;
    function ListGeral(IdGrupoObjeto: real): OleVariant;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uFuncoesUteis;

{ TCtrlGrpObjeto }

constructor TCtrlGrpObjeto.Create;
begin
  inherited;
  FDb := TDbGrpObjProcJur.Create(Self);
end;

destructor TCtrlGrpObjeto.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlGrpObjeto.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlGrpObjeto.DoChangeDataBase;
begin
  inherited;
  FDb.DatabaseName := DataBaseName;
end;

function TCtrlGrpObjeto.ListGeral(IdGrupoObjeto: real): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdGrupoObjeto=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IdGrupoObjeto, Descricao, ClasseObj'+CR_LF+
    'FROM'+CR_LF+
    '  GrpObjProcJur'+CR_LF+
    IFF(IdGrupoObjeto=-1, 'WHERE (1 = 2)',
        IFF(IdGrupoObjeto=0, '', 'WHERE'+CR_LF+
            '  (IdGrupoObjeto = '+FloatToStr(IdGrupoObjeto)+')')));
end;

function TCtrlGrpObjeto.Gravar: boolean;
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
      Result := ApplyCds(FCds, FDb, [], []);
      if not(Result) then
        MessageInfo := FDb.MessageInfo;
    except
      on E: Exception do
      begin
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

end.
