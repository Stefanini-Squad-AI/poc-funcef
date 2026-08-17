{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 14/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlExper;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbTabExper;

type
  TCtrlExper = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbTabExper: TDbTabExper;
    FCdsTabExper: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListTabExper(IdExper: double = 0): OleVariant;

    function GravarTabExper: boolean;    

    property CdsTabExper: TCMClientDataSet read FCdsTabExper write FCdsTabExper;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlExper }

constructor TCtrlExper.Create;
begin
  inherited;
  FDbTabExper := TDbTabExper.Create(Self);
end;

destructor TCtrlExper.Destroy;
begin
  FDbTabExper.Free;
  if (IsAppServer) then
    FCdsTabExper.Free;
  inherited;
end;

procedure TCtrlExper.OnCreateAppServer;
begin
  inherited;
  FCdsTabExper := TCMClientDataSet.Create(nil);
end;

procedure TCtrlExper.DoChangeDataBase;
begin
  inherited;
  FDbTabExper.DataBaseName := DataBaseName;
end;

function TCtrlExper.ListTabExper(IdExper: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdExper=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IdExper, Descricao'+CR_LF+
    'FROM'+CR_LF+
    '  TabExper'+CR_LF+
    IFF(IdExper=-1, 'WHERE (1 = 2)',
      IFF(IdExper=0, '', 'WHERE'+CR_LF+
        '  (IdExper = ' +FloatToStr(IdExper)+ ')')));
end;

function TCtrlExper.GravarTabExper: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarTabExper(FCdsTabExper.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(FCdsTabExper, FDbTabExper, [], []);
      if (Result) then
        Commit
      else
        raise Exception.Create(FDbTabExper.MessageInfo);
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
