{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 05/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlTipAval;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbTipoAval;

type
  TCtrlTipAval = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbTipoAval;
    FCds: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListTipoAval(CodTipoAval: double = 0; ListaFlgTipoAval: string = ''): OleVariant;

    function GravarTipoAval: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlTipAval }

constructor TCtrlTipAval.Create;
begin
  inherited;
  FDb := TDbTipoAval.Create(Self);
end;

destructor TCtrlTipAval.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlTipAval.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlTipAval.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlTipAval.ListTipoAval(CodTipoAval: double; ListaFlgTipoAval: string): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT';

  if (CodTipoAval = -1) then
    sSQL := sSQL + ' /*+ OPTIMIZER_MODE RULE */'+CR_LF;

  sSQL := sSQL +
    '  *'+CR_LF+
    'FROM'+CR_LF+
    '  TIPOAVAL'+CR_LF;

  // Se qualquer um dos parâmetros for igual a (-1), não é para trazer registro algum
  if (CodTipoAval = -1) then
    sSQL := sSQL +
      'WHERE'+CR_LF+
      '  (1 = 2)'
  else // Se não, faz as seleções cabíveis
  begin
    if (CodTipoAval > 0) then
      sSQL := sSQL +
        'WHERE'+CR_LF+
        '  (CODTIPOAVAL = ' +FloatToStr(CodTipoAval)+ ')';

    if (ListaFlgTipoAval <> '') then
    begin
      if (CodTipoAval = 0) then
        sSQL := sSQL +CR_LF+ 'WHERE' +CR_LF
      else
        sSQL := sSQL +' AND' +CR_LF;

      if (Pos(',', ListaFlgTipoAval) > 0) then
        sSQL := sSQL + '  (FLGTIPOAVAL IN (' +ListaFlgTipoAval+ '))'
      else
        sSQL := sSQL + '  (FLGTIPOAVAL = ' +ListaFlgTipoAval+ ')';
    end;

    sSQL := sSQL +CR_LF+
      'ORDER BY'+CR_LF+
      '  UPPER(DESCRTIPOAVAL)';
  end;

  Result := GetDataPacket(sSQL);
end;

function TCtrlTipAval.GravarTipoAval: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarTipoAval(FCds.Data);
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
