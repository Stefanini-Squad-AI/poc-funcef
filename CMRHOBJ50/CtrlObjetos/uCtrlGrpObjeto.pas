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

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbGrpObjProcJur;

type
  TCtrlGrpObjeto = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbGrpObjeto: TDbGrpObjProcJur;
    FCdsGrpObjeto: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function GravarGrpObjeto: boolean;
    function ListGrpObjeto(IdGrupoObjeto: double = 0): OleVariant;

    property CdsGrpObjeto: TCMClientDataSet read FCdsGrpObjeto write FCdsGrpObjeto;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlGrpObjeto }

constructor TCtrlGrpObjeto.Create;
begin
  inherited;
  FDbGrpObjeto := TDbGrpObjProcJur.Create(Self);
end;

destructor TCtrlGrpObjeto.Destroy;
begin
  FDbGrpObjeto.Free;
  if (IsAppServer) then
    FCdsGrpObjeto.Free;
  inherited;
end;

procedure TCtrlGrpObjeto.OnCreateAppServer;
begin
  inherited;
  FCdsGrpObjeto := TCMClientDataSet.Create(nil);
end;

procedure TCtrlGrpObjeto.DoChangeDataBase;
begin
  inherited;
  FDbGrpObjeto.DataBaseName := DataBaseName;
end;

function TCtrlGrpObjeto.ListGrpObjeto(IdGrupoObjeto: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdGrupoObjeto=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IDGRUPOOBJETO, DESCRICAO, CLASSEOBJ'+CR_LF+
    'FROM'+CR_LF+
    '  GRPOBJPROCJUR'+CR_LF+
    IFF(IdGrupoObjeto=-1, 'WHERE (1 = 2)',
      IFF(IdGrupoObjeto=0, 'ORDER BY'+CR_LF+'  DESCRICAO', 'WHERE'+CR_LF+
        '  (IDGRUPOOBJETO = ' +FloatToStr(IdGrupoObjeto)+ ')')));
end;

function TCtrlGrpObjeto.GravarGrpObjeto: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarGrpObjeto(FCdsGrpObjeto.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(FCdsGrpObjeto, FDbGrpObjeto, [], []);
      if (Result) then
        Commit
      else
        raise Exception.Create(FDbGrpObjeto.MessageInfo);
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
