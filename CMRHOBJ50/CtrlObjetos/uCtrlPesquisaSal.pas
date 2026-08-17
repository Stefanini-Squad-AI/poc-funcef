{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 07/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlPesquisaSal;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbPesqiSal;

type
  TCtrlPesquisaSal = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbPesquisaSal: TDbPesqiSal;
    FCdsPesquisaSal: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListPesquisaSal(IdPesqSalar: double = 0): OleVariant;

    function GravarPesquisaSal: boolean;

    property CdsPesquisaSal: TCMClientDataSet read FCdsPesquisaSal write FCdsPesquisaSal;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlPesquisaSal }

constructor TCtrlPesquisaSal.Create;
begin
  inherited;
  FDbPesquisaSal := TDbPesqiSal.Create(Self);
end;

destructor TCtrlPesquisaSal.Destroy;
begin
  FDbPesquisaSal.Free;
  if (IsAppServer) then
    FCdsPesquisaSal.Free;
  inherited;
end;

procedure TCtrlPesquisaSal.OnCreateAppServer;
begin
  inherited;
  FCdsPesquisaSal := TCMClientDataSet.Create(nil);
end;

procedure TCtrlPesquisaSal.DoChangeDataBase;
begin
  inherited;
  FDbPesquisaSal.DataBaseName := DataBaseName;
end;

function TCtrlPesquisaSal.ListPesquisaSal(IdPesqSalar: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +IFF(IdPesqSalar=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  *'+CR_LF+
    'FROM'+CR_LF+
    '  PESQISAL'+CR_LF+
    IFF(IdPesqSalar=-1, 'WHERE (1 = 2)',
      IFF(IdPesqSalar=0, 'ORDER BY' +CR_LF+ '  UPPER(NOMEPESQSALAR)', 'WHERE'+CR_LF+
        '  (IDPESQSALAR = ' +FloatToStr(IdPesqSalar)+ ')')));
end;

function TCtrlPesquisaSal.GravarPesquisaSal: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarPesquisaSal(FCdsPesquisaSal.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(FCdsPesquisaSal, FDbPesquisaSal, [], []);
      if (Result) then
        Commit
      else
        raise Exception.Create(FDbPesquisaSal.MessageInfo);
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
