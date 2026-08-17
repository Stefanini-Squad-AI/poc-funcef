{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 03/06/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlCursoReq;

interface

uses SysUtils, Forms, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbCursoReq;

type
  TCtrlCursoReq = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbCursoReq: TDbCursoReq;
    FCdsCursoReq: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListCursoReq(IdCargo: double = 0): OleVariant;
    function ListMestre(IdCargo: double): OleVariant;
    function ListDetalhe(IdCargo: double): OleVariant;
    function ListCurso: OleVariant;

    function GravarCursoReq: boolean;

    property CdsCursoReq: TCMClientDataSet read FCdsCursoReq write FCdsCursoReq;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlCursoReq }

constructor TCtrlCursoReq.Create;
begin
  inherited;
  FDbCursoReq := TDbCursoReq.Create(Self);
end;

destructor TCtrlCursoReq.Destroy;
begin
  FDbCursoReq.Free;
  if (IsAppServer) then
    FCdsCursoReq.Free;
  inherited;
end;

procedure TCtrlCursoReq.OnCreateAppServer;
begin
  inherited;
  FCdsCursoReq := TCMClientDataSet.Create(nil);
end;

procedure TCtrlCursoReq.DoChangeDataBase;
begin
  inherited;
  FDbCursoReq.DataBaseName := DataBaseName;
end;

function TCtrlCursoReq.ListCursoReq(IdCargo: double): OleVariant;
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
    'SELECT' +CR_LF+
    '  IDCURSO, IDCARGO, FLGIMPRESCIND' +CR_LF+
    'FROM' +CR_LF+
    '  CURSOREQ'+
    sSQL);
end;

function TCtrlCursoReq.ListMestre(IdCargo: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDCARGO, TITULO'+CR_LF+
    'FROM'+CR_LF+
    '  CARGO'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDCARGO  = ' +FloatToStr(IdCargo)+ ')');
end;

function TCtrlCursoReq.ListDetalhe(IdCargo: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  CR.IDCARGO, CR.IDCURSO, CR.FLGIMPRESCIND, CU.DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  CURSOREQ CR, CURSO CU'+CR_LF+
    'WHERE'+CR_LF+
    '  (CR.IDCARGO = ' +FloatToStr(IdCargo)+ ') AND'+CR_LF+
    '  (CR.IDCURSO = CU.IDCURSO)');
end;

function TCtrlCursoReq.ListCurso: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDCURSO, DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  CURSO');
end;

function TCtrlCursoReq.GravarCursoReq: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarCursoReq(FCdsCursoReq.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(FCdsCursoReq, FDbCursoReq, [], []);
      if (Result) then
        Commit
      else
        raise Exception.Create(FDbCursoReq.MessageInfo);
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
