{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Eugênio C. Frioli               }
{ Criado Em: 26/12/2003                                 }
{                                                       }
{*******************************************************}

unit uCtrlHonorAdvog;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio, uCMTranslate, uCMClientDataSet,
  uCtrlCustomRH, uDbHonorAdvog;

type
  TCtrlHonorAdvog = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbHonorAdvog: TDbHonorAdvog;
    FCdsHonorAdvog: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListHonorAdvog(IdHonorAdvog: double = 0): OleVariant;

    function GravarHonorAdvog: boolean;

    property CdsHonorAdvog: TCMClientDataSet read FCdsHonorAdvog write FCdsHonorAdvog;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlHonorAdvog }

constructor TCtrlHonorAdvog.Create;
begin
  inherited;
  FDbHonorAdvog := TDbHonorAdvog.Create(Self);
end;

destructor TCtrlHonorAdvog.Destroy;
begin
  FDbHonorAdvog.Free;
  if (IsAppServer) then
    FCdsHonorAdvog.Free;
  inherited;
end;

procedure TCtrlHonorAdvog.OnCreateAppServer;
begin
  inherited;
  FCdsHonorAdvog := TCMClientDataSet.Create(nil);
end;

procedure TCtrlHonorAdvog.DoChangeDataBase;
begin
  inherited;
  FDbHonorAdvog.DataBaseName := DataBaseName;
end;

function TCtrlHonorAdvog.ListHonorAdvog(IdHonorAdvog: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDHONORADVOG, LIMITEQTDE, DATAVIGENCIA, VALOR'+CR_LF+
    'FROM'+CR_LF+
    '  HONORADVOG'+CR_LF+
    IFF(IdHonorAdvog=-1, 'WHERE (1 = 2)',
      IFF(IdHonorAdvog=0, 'ORDER BY'+CR_LF+'  DATAVIGENCIA, LIMITEQTDE', 'WHERE'+CR_LF+
        '  (IDHONORADVOG = ' +FloatToStr(IdHonorAdvog)+ ')')));
end;

function TCtrlHonorAdvog.GravarHonorAdvog: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarHonorAdvog(FCdsHonorAdvog.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsHonorAdvog, FDbHonorAdvog, [], []);
      if not(Result) then
        Exception.Create(FDbHonorAdvog.MessageInfo);

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
