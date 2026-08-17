{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 16/09/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlFaltasTrab;

interface

uses SysUtils, uSistema, uCMTypes, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbFaltasTrab;

type
  TCtrlFaltasTrab = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbFaltasTrab: TDbFaltasTrab;
    FCdsFaltasTrab: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListFaltasTrab(IdPessoa: double): OleVariant;
    function ListFaltasNaCompetencia(IdPessoa: double): OleVariant;

    function GravarFaltasTrab: boolean;

    property CdsFaltasTrab: TCMClientDataSet read FCdsFaltasTrab write FCdsFaltasTrab;
  end;

implementation

uses uCtrlFuncoesRH;

{ TCtrlFaltasTrab }

constructor TCtrlFaltasTrab.Create;
begin
  inherited;
  FDbFaltasTrab := TDbFaltasTrab.Create(Self);
end;

destructor TCtrlFaltasTrab.Destroy;
begin
  FDbFaltasTrab.Free;
  if (IsAppServer) then
    FCdsFaltasTrab.Free;
  inherited;
end;

procedure TCtrlFaltasTrab.OnCreateAppServer;
begin
  inherited;
  FCdsFaltasTrab := TCMClientDataSet.Create(nil);
end;

procedure TCtrlFaltasTrab.DoChangeDataBase;
begin
  inherited;
  FDbFaltasTrab.DataBaseName := DataBaseName;
end;

function TCtrlFaltasTrab.ListFaltasTrab(IdPessoa: double): OleVariant;
begin
  FDbFaltasTrab.IdPessoa.asFloat := IdPessoa;
  FDbFaltasTrab.LoadFromDb;
end;

function TCtrlFaltasTrab.ListFaltasNaCompetencia(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  FT.IDPESSOA, FT.DATAFALTA'+CR_LF+
    'FROM'+CR_LF+
    '  FALTASTRAB FT, PARAMRH PH'+CR_LF+
    'WHERE'+CR_LF+
    '  (FT.IDPESSOA = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (FT.DATAFALTA >= PH.NORMALINI) AND'+CR_LF+
    '  (FT.DATAFALTA <= PH.NORMALFIM)');
end;

function TCtrlFaltasTrab.GravarFaltasTrab: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarFaltasTrab(FCdsFaltasTrab.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(FCdsFaltasTrab, FDbFaltasTrab, [], []);
      if (Result) then
        Commit
      else
        raise Exception.Create(FDbFaltasTrab.MessageInfo);
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
