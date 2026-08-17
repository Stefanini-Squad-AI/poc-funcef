{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 19/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlTipObjeto;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet, uDbTipoObjProcTrab;

type
  TCtrlTipObjeto = class(TCmControlObject)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbTipoObjProcTrab;
    FCds: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function Gravar: boolean;
    function ListGeral(CodTipoObjeto: real): OleVariant;    
    function ListRubrica(IdEmpresa: integer): OleVariant;
    function ListGrpObjeto: OleVariant;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uFuncoesUteis;

{ TCtrlTipObjeto }

constructor TCtrlTipObjeto.Create;
begin
  inherited;
  FDb := TDbTipoObjProcTrab.Create(Self);
end;

destructor TCtrlTipObjeto.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlTipObjeto.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlTipObjeto.DoChangeDataBase;
begin
  inherited;
  FDb.DatabaseName := DataBaseName;
end;

function TCtrlTipObjeto.ListGeral(CodTipoObjeto: real): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(CodTipoObjeto=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  CodTipoObjeto, Descricao, IdProvento, IdGrupoObjeto, FlgProvDesc, ClasseObj'+CR_LF+
    'FROM'+CR_LF+
    '  TipoObjProcTrab'+CR_LF+
    IFF(CodTipoObjeto=-1, 'WHERE (1 = 2)',
        IFF(CodTipoObjeto=0, '', 'WHERE'+CR_LF+
            '  (CodTipoObjeto = '+FloatToStr(CodTipoObjeto)+')')));
end;

function TCtrlTipObjeto.ListRubrica(IdEmpresa: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  PD.IdProvento, RP.DescrProvDesc'+CR_LF+
    'FROM'+CR_LF+
    '   RubricaXPess RP, ProvDesc PD'+CR_LF+
    'WHERE'+CR_LF+
    '  (PD.FlgTpRubrica LIKE ''%F%'') AND'+CR_LF+
    '  (RP.IdPessoa        = '+IntToStr(IdEmpresa)+ ') AND'+CR_LF+
    '  (RP.IdRubrica       = PD.IdProvento)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  DescrProvDesc');
end;

function TCtrlTipObjeto.ListGrpObjeto: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IdGrupoObjeto, Descricao'+CR_LF+
    'FROM'+CR_LF+
    '  GrpObjProcJur'+CR_LF+
    'ORDER BY'+CR_LF+
    '  Descricao');
end;

function TCtrlTipObjeto.Gravar: boolean;
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
