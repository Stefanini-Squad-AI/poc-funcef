{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 06/02/2003                                 }
{                                                       }
{*******************************************************}

unit uCtrlUltimosEmpregos;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio,  uCMClientDataSet,
  uCtrlCustomRH, uDbUltEmpr;

type
  TCtrlUltimosEmpregos = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbUltEmpr: TDbUltEmpr;
    FCdsUltEmpr: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListUltimosEmpregos(IdPessoa: double; NumSeq: integer = 0): OleVariant;

    function GravarUltimosEmpregos: boolean;

    property CdsUltimosEmpregos: TCMClientDataSet read FCdsUltEmpr write FCdsUltEmpr;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlUltimosEmpregos }

constructor TCtrlUltimosEmpregos.Create;
begin
  inherited;
  FDbUltEmpr := TDbUltEmpr.Create(Self);
end;

destructor TCtrlUltimosEmpregos.Destroy;
begin
  FDbUltEmpr.Free;
  if (IsAppServer) then
    FCdsUltEmpr.Free;
  inherited;
end;

procedure TCtrlUltimosEmpregos.OnCreateAppServer;
begin
  inherited;
  FCdsUltEmpr := TCMClientDataSet.Create(nil);
end;

procedure TCtrlUltimosEmpregos.DoChangeDataBase;
begin
  inherited;
  FDbUltEmpr.DataBaseName := DataBaseName;
end;

function TCtrlUltimosEmpregos.ListUltimosEmpregos(IdPessoa: double; NumSeq: integer): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT';

  if (IdPessoa <= -1) then
    sSQL := sSQL +' /*+ OPTIMIZER_MODE RULE */';

  sSQL := sSQL +CR_LF+
    '  *'+CR_LF+
    'FROM'+CR_LF+
    '  ULTEMPR'+CR_LF;

  if (IdPessoa <= -1) then
    sSQL := sSQL + 'WHERE (1 = 2)'
  else
  begin
    if (IdPessoa > 0) or (NumSeq > 0) then
      sSQL := sSQL + 'WHERE'+CR_LF;

    if (IdPessoa > 0) then
      sSQL := sSQL + '  (IDPESSOA = ' +FloatToStr(IdPessoa)+ ')';

    if (NumSeq > 0) then
      sSQL := sSQL +IFF(IdPessoa>0, ' AND'+CR_LF, '')+ '  (NUMSEQ   = ' +IntToStr(NumSeq)+ ')'
    else
      sSQL := sSQL +CR_LF+ 'ORDER BY' +CR_LF+ '  NUMSEQ';
  end;
  Result := GetDataPacket(sSQL);
end;

function TCtrlUltimosEmpregos.GravarUltimosEmpregos: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarUltimosEmpregos(FCdsUltEmpr.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsUltEmpr, FDbUltEmpr, [], []);
      if not(Result) then
        raise Exception.Create(FDbUltEmpr.MessageInfo);

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
