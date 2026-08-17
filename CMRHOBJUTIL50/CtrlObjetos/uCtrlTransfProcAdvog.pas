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

uses SysUtils, Forms, Db, uCmDbObject, uCmControlObject, IvDictio, 
  uCMClientDataSet, uCtrlCustomRH, uDbProcessoTrab;

type
  TCtrlTransfProcAdvog = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbProcessoTrab;
    FCdsProcAdv1: TCMClientDataSet;
    FCdsProcAdv2: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function GravarProcAdv1: boolean;
    function GravarProcAdv2: boolean;

    function ListProcAdvogadoCasa(IdPessoa: double): OleVariant;
    function ListProcAdvogado(IdPessoa: double): OleVariant;

    property CdsProcAdv1: TCMClientDataSet read FCdsProcAdv1 write FCdsProcAdv1;
    property CdsProcAdv2: TCMClientDataSet read FCdsProcAdv2 write FCdsProcAdv2;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

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
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlTransfProcAdvog.ListProcAdvogadoCasa(IdPessoa: double): OleVariant;
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

function TCtrlTransfProcAdvog.ListProcAdvogado(IdPessoa: double): OleVariant;
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
    Result := Connection.AppServer.GravarProcAdv1(FCdsProcAdv1.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsProcAdv1, FDb, [], []);
      if not(Result) then
        raise Exception.Create(FDb.MessageInfo);

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

function TCtrlTransfProcAdvog.GravarProcAdv2: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarProcAdv2(FCdsProcAdv2.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(FCdsProcAdv2, FDb, [], []);
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
