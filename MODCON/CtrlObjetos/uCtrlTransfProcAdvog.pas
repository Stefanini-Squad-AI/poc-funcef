{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 20/06/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlTransfProcAdvog;

interface

uses SysUtils, Forms, Db, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uDbProcessoTrab;

type
  TCtrlTransfProcAdvog = class(TCmControlObject)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbProcessoTrab;
    FCdsProcAdv1: TCMClientDataSet;
    FCdsProcAdv2: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function GravarProcAdv1: boolean;
    function GravarProcAdv2: boolean;

    function ListProcAdvogadoCasa(IdPessoa: real): OleVariant;    
    function ListProcAdvogado(IdPessoa: real): OleVariant;

    property CdsProcAdv1: TCMClientDataSet read FCdsProcAdv1 write FCdsProcAdv1;
    property CdsProcAdv2: TCMClientDataSet read FCdsProcAdv2 write FCdsProcAdv2;
  end;

implementation

uses uCMTypes, uFuncoesUteis;

{ TCtrlTransfProcAdvog }

constructor TCtrlTransfProcAdvog.Create;
begin
  inherited;
  FDb := TDbProcessoTrab.Create(Self);
end;

destructor TCtrlTransfProcAdvog.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
  begin
    FCdsProcAdv2.Free;
    FCdsProcAdv1.Free;
  end;
  inherited;
end;

procedure TCtrlTransfProcAdvog.OnCreateAppServer;
begin
  inherited;
  FCdsProcAdv1 := TCMClientDataSet.Create(nil);
  FCdsProcAdv2 := TCMClientDataSet.Create(nil);
end;

procedure TCtrlTransfProcAdvog.DoChangeDataBase;
begin
  inherited;
  FDb.DatabaseName := DataBaseName;
end;

function TCtrlTransfProcAdvog.ListProcAdvogadoCasa(IdPessoa: real): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  PT.*, P.NOME'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, PROCESSOTRAB PT'+CR_LF+
    'WHERE'+CR_LF+
    '  (PT.IDADVOGCASA  = '+FloatToStr(IdPessoa)+') AND'+CR_LF+
    '  (PT.IDRECLAMANTE = P.IDPESSOA)');
end;

function TCtrlTransfProcAdvog.ListProcAdvogado(IdPessoa: real): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  PT.*, P.NOME'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, PROCESSOTRAB PT'+CR_LF+
    'WHERE'+CR_LF+
    '  (PT.IDADVOGRECDA = '+FloatToStr(IdPessoa)+') AND'+CR_LF+
    '  (PT.IDRECLAMANTE = P.IDPESSOA)');
end;

function TCtrlTransfProcAdvog.GravarProcAdv1: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.Gravar(FCdsProcAdv1.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      Result := ApplyCds(FCdsProcAdv1, FDb, [], []);
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

function TCtrlTransfProcAdvog.GravarProcAdv2: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.Gravar(FCdsProcAdv2.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      Result := ApplyCds(FCdsProcAdv2, FDb, [], []);
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
