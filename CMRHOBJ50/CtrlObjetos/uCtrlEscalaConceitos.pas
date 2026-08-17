{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Eugênio                         }
{ Criado Em: 14/08/2003                                 }
{                                                       }
{*******************************************************}

unit uCtrlEscalaConceitos;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbEscalaConceitos;

type
  TCtrlEscalaConceitos = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbEscalaConceitos;
    FCds: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListGeral(IdEscalaConceitos: double = 0): OleVariant;
    function ListFator(IdEscalaConceitos: double): OleVariant;

    function Gravar: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlEscalaConceitos }

constructor TCtrlEscalaConceitos.Create;
begin
  inherited;
  FDb := TDbEscalaConceitos.Create(Self);
end;

destructor TCtrlEscalaConceitos.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlEscalaConceitos.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlEscalaConceitos.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlEscalaConceitos.ListGeral(IdEscalaConceitos: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT E.*, TRIM(CONCEITO1) || '','' || TRIM(CONCEITO2) || '','' || '+CR_LF+
    '            TRIM(CONCEITO3) || '','' || TRIM(CONCEITO4) || '','' || '+CR_LF+
    '            TRIM(CONCEITO5) || '','' || TRIM(CONCEITO6) AS DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  ESCALACONCEITOS E'+CR_LF+
    IFF(IdEscalaConceitos=-1, 'WHERE (1 = 2)',
      IFF(IdEscalaConceitos=0, '', 'WHERE'+CR_LF+
        '  (IDESCALACONCEITOS = ' +FloatToStr(IdEscalaConceitos)+ ')')));
end;

function TCtrlEscalaConceitos.ListFator(IdEscalaConceitos: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDFATORAVAL, DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  FATORAVALCURSO'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDESCALACONCEITOS = '+FloatToStr(IdEscalaConceitos)+')'+CR_LF+
    'ORDER BY'+CR_LF+
    '  DESCRICAO');
end;

function TCtrlEscalaConceitos.Gravar: boolean;
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
