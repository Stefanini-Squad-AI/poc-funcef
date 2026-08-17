{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 27/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlExpReq;

interface

uses SysUtils, Forms, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbExpReqer;

type
  TCtrlExpReq = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbDet: TDbExpReqer;
    FCdsDet: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListExperReqCargo(IdCargo: double = 0): OleVariant;
    function ListMestre(IdCargo: double): OleVariant;
    function ListDetalhe(IdCargo: double): OleVariant;
    function ListTipoExper: OleVariant;

    function Gravar: boolean;

    property CdsDet: TCMClientDataSet read FCdsDet write FCdsDet;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlExpReq }

constructor TCtrlExpReq.Create;
begin
  inherited;
  FDbDet := TDbExpReqer.Create(Self);
end;

destructor TCtrlExpReq.Destroy;
begin
  FDbDet.Free;
  if (IsAppServer) then
    FCdsDet.Free;
  inherited;
end;

procedure TCtrlExpReq.OnCreateAppServer;
begin
  inherited;
  FCdsDet := TCMClientDataSet.Create(nil);
end;

procedure TCtrlExpReq.DoChangeDataBase;
begin
  inherited;
  FDbDet.DataBaseName := DataBaseName;
end;

function TCtrlExpReq.ListMestre(IdCargo: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IdCargo, Titulo'+CR_LF+
    'FROM'+CR_LF+
    '  Cargo'+CR_LF+
    'WHERE'+CR_LF+
    '  (IdCargo  = '+FloatToStr(IdCargo)+')');
end;

function TCtrlExpReq.ListExperReqCargo(IdCargo: double): OleVariant;
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
    '  IDCARGO, IDEXPER, TEMPOEXPER, FLGIMPRESCIND'+CR_LF+
    'FROM'+CR_LF+
    '  EXPREQER'+
    sSQL);
end;

function TCtrlExpReq.ListDetalhe(IdCargo: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  ER.IDCARGO, ER.IDEXPER, ER.TEMPOEXPER, ER.FLGIMPRESCIND, TE.DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  EXPREQER ER, TABEXPER TE'+CR_LF+
    'WHERE'+CR_LF+
    '  (ER.IDCARGO = '+FloatToStr(IdCargo)+') AND'+CR_LF+
    '  (ER.IDEXPER = TE.IDEXPER)');
end;

function TCtrlExpReq.ListTipoExper: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDEXPER, DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  TABEXPER');
end;

function TCtrlExpReq.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.Gravar(FCdsDet.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(FCdsDet, FDbDet, [], []);
      if (Result) then
        Commit
      else
        raise Exception.Create(FDbDet.MessageInfo);
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
