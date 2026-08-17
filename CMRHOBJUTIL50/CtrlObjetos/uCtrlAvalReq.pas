{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 27/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlAvalReq;

interface

uses SysUtils, Forms, uCmDbObject, uCmControlObject, IvDictio,  uCMClientDataSet,
  uCtrlCustomRH, uDbAvalCargo;

type
  TCtrlAvalReq = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbDet: TDbAvalCargo;
    FCdsDet: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListMestre(IdCargo: double): OleVariant;
    function ListAvalCargo(IdCargo: double = 0): OleVariant;
    function ListDetalhe(IdCargo: double): OleVariant;
    function ListTipoAval: OleVariant;

    function Gravar: boolean;

    property CdsDet: TCMClientDataSet read FCdsDet write FCdsDet;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlAvalReq }

constructor TCtrlAvalReq.Create;
begin
  inherited;
  FDbDet := TDbAvalCargo.Create(Self);
end;

destructor TCtrlAvalReq.Destroy;
begin
  FDbDet.Free;
  if (IsAppServer) then
    FCdsDet.Free;
  inherited;
end;

procedure TCtrlAvalReq.OnCreateAppServer;
begin
  inherited;
  FCdsDet := TCMClientDataSet.Create(nil);
end;

procedure TCtrlAvalReq.DoChangeDataBase;
begin
  inherited;
  FDbDet.DataBaseName := DataBaseName;
end;

function TCtrlAvalReq.ListMestre(IdCargo: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDCARGO, TITULO'+CR_LF+
    'FROM'+CR_LF+
    '  CARGO'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDCARGO  = ' +FloatToStr(IdCargo)+ ')');
end;

function TCtrlAvalReq.ListAvalCargo(IdCargo: double): OleVariant;
var
  sSQL: string;
begin
  sSQL := '';
  if (IdCargo = -1) then
    sSQL := CR_LF+ 'WHERE' +CR_LF+ '  (1 = 2)'
  else
  if (IdCargo > 0) then
    sSQL := CR_LF+ 'WHERE' +CR_LF+ '  (IDCARGO = ' +FloatToStr(IdCargo)+ ')';

  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDCARGO, CODTIPOAVAL, AVALIACAO, PRAZO'+CR_LF+
    'FROM'+CR_LF+
    '  AVALCARGO'+
    sSQL);
end;

function TCtrlAvalReq.ListDetalhe(IdCargo: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  AC.IDCARGO, AC.CODTIPOAVAL, AC.AVALIACAO, TA.DESCRTIPOAVAL'+CR_LF+
    'FROM'+CR_LF+
    '  AVALCARGO AC, TIPOAVAL TA'+CR_LF+
    'WHERE'+CR_LF+
    '  (AC.IDCARGO     = '+FloatToStr(IdCargo)+') AND'+CR_LF+
    '  (AC.CODTIPOAVAL = TA.CODTIPOAVAL)');
end;

function TCtrlAvalReq.ListTipoAval: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  CODTIPOAVAL, DESCRTIPOAVAL'+CR_LF+
    'FROM'+CR_LF+
    '  TIPOAVAL');
end;

function TCtrlAvalReq.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarAvalReq(FCdsDet.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsDet, FDbDet, [], []); 
      if not(Result) then
        raise Exception.Create(FDbDet.MessageInfo);

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
