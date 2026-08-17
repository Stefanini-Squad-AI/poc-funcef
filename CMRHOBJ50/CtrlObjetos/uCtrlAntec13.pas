{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 12/06/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlAntec13;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet, uCtrlCustomRH,
  uDbAntecip13;

type
  TCtrlAntec13 = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbAntecip13: TDbAntecip13;
    FCdsAntecip13: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListAntecipacao13(IdPessoa: double; Mes: integer=0; Ano: integer=0): OleVariant;

    function Gravar: boolean;

    property CdsAntecip13: TCMClientDataSet read FCdsAntecip13 write FCdsAntecip13;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlAntec13 }

constructor TCtrlAntec13.Create;
begin
  inherited;
  FDbAntecip13 := TDbAntecip13.Create(Self);
end;

destructor TCtrlAntec13.Destroy;
begin
  FDbAntecip13.Free;
  if (IsAppServer) then
    FCdsAntecip13.Free;
  inherited;
end;

procedure TCtrlAntec13.OnCreateAppServer;
begin
  inherited;
  FCdsAntecip13 := TCMClientDataSet.Create(nil);
end;

procedure TCtrlAntec13.DoChangeDataBase;
begin
  inherited;
  FDbAntecip13.DataBaseName := DataBaseName;
end;

function TCtrlAntec13.ListAntecipacao13(IdPessoa: double; Mes, Ano: integer): OleVariant;
var
  sSQL: string;
begin
  sSQL := '';
  if (IdPessoa = -1) then
    sSQL := sSQL + 'WHERE' +CR_LF+ '  (1 = 2)'
  else
  begin
    if (IdPessoa > 0) then
      sSQL := sSQL + '  (IDPESSOA = ' +FloatToStr(IdPessoa)+ ')';

    if (Mes > 0) then
      sSQL := sSQL +IFF(sSQL<>'', ' AND'+CR_LF, '')+ '  (MES = ' +IntToStr(Mes)+ ')';

    if (Ano > 0) then
      sSQL := sSQL +IFF(sSQL<>'', ' AND'+CR_LF, '')+ '  (ANO = ' +IntToStr(Ano)+ ')';

    if (sSQL <> '') then
      sSQL := 'WHERE' +CR_LF+ sSQL;
  end;

  Result := GetDataPacket(
    'SELECT' +IFF(IdPessoa=-1,' /*+ OPTIMIZER_MODE RULE */','') +CR_LF+
    '  IDPESSOA, ANO, MES, FLGOCORRIDA' +CR_LF+
    'FROM' +CR_LF+
    '  ANTECIP13' +CR_LF+
    sSQL);
end;

function TCtrlAntec13.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.Gravar(FCdsAntecip13.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(FCdsAntecip13, FDbAntecip13, [], []);
      if (Result) then
        Commit
      else
        raise Exception.Create(FDbAntecip13.MessageInfo);
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
