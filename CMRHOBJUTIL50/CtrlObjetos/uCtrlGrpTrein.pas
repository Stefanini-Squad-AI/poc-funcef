{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 15/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlGrpTrein;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio, uCMClientDataSet,
  uCtrlCustomRH, uDbGrpTrein;

type
  TCtrlGrpTrein = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbGrpTrein: TDbGrpTrein;
    FCdsGrpTrein: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListGrpTrein(CodGrpTrein: string = ''): OleVariant;
    function ListCargo(CodGrpTrein: string): OleVariant;
    function ListCurso(CodGrpTrein: string): OleVariant;

    function GravarGrpTrein: boolean;

    property CdsGrpTrein: TCMClientDataSet read FCdsGrpTrein write FCdsGrpTrein;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlGrpTrein }

constructor TCtrlGrpTrein.Create;
begin
  inherited;
  FDbGrpTrein := TDbGrpTrein.Create(Self);
end;

destructor TCtrlGrpTrein.Destroy;
begin
  FDbGrpTrein.Free;
  if (IsAppServer) then
    FCdsGrpTrein.Free;
  inherited;
end;

procedure TCtrlGrpTrein.OnCreateAppServer;
begin
  inherited;
  FCdsGrpTrein := TCMClientDataSet.Create(nil);
end;

procedure TCtrlGrpTrein.DoChangeDataBase;
begin
  inherited;
  FDbGrpTrein.DataBaseName := DataBaseName;
end;

function TCtrlGrpTrein.ListGrpTrein(CodGrpTrein: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(CodGrpTrein='-1',' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  CODGRPTREIN, DESCGRPTREIN'+CR_LF+
    'FROM'+CR_LF+
    '  GRPTREIN'+CR_LF+
    IFF(CodGrpTrein='-1', 'WHERE (1 = 2)',
      IFF(CodGrpTrein='', 'ORDER BY'+CR_LF+'  UPPER(DESCGRPTREIN)', 'WHERE'+CR_LF+
        '  (CODGRPTREIN = '+QuotedStr(CodGrpTrein)+')')));
end;

function TCtrlGrpTrein.ListCargo(CodGrpTrein: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDCARGO, TITULO'+CR_LF+
    'FROM'+CR_LF+
    '  CARGO'+CR_LF+
    'WHERE'+CR_LF+
    '  (CODGRPTREIN = '+QuotedStr(CodGrpTrein)+')'+CR_LF+
    'ORDER BY'+CR_LF+
    '  UPPER(TITULO)');
end;

function TCtrlGrpTrein.ListCurso(CodGrpTrein: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDCURSO, DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  CURSO'+CR_LF+
    'WHERE'+CR_LF+
    '  (CODGRPTREIN = '+QuotedStr(CodGrpTrein)+')'+CR_LF+
    'ORDER BY'+CR_LF+
    '  DESCRICAO');
end;

function TCtrlGrpTrein.GravarGrpTrein: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarGrpTrein(FCdsGrpTrein.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsGrpTrein, FDbGrpTrein, [], []);
      if not(Result) then
        raise Exception.Create(FDbGrpTrein.MessageInfo);

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
