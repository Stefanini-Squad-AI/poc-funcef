{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Eugênio                         }
{ Criado Em: 16/04/2003                                 }
{                                                       }
{*******************************************************}

unit uCtrlServicoManut;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet, uCtrlCustomRH,
  uDbServicoManut;

type
  TCtrlServicoManut = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbServicoManut: TDbServicoManut;
    FCdsServicoManut: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListServicoManut(IdServicoManut: double = 0): OleVariant;

    function GravarServicoManut: boolean;

    property CdsServicoManut: TCMClientDataSet read FCdsServicoManut write FCdsServicoManut;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlServicoManut }

constructor TCtrlServicoManut.Create;
begin
  inherited;
  FDbServicoManut := TDbServicoManut.Create(Self);
end;

destructor TCtrlServicoManut.Destroy;
begin
  FDbServicoManut.Free;
  if (IsAppServer) then
    FCdsServicoManut.Free;
  inherited;
end;

procedure TCtrlServicoManut.OnCreateAppServer;
begin
  inherited;
  FCdsServicoManut := TCMClientDataSet.Create(nil);
end;

procedure TCtrlServicoManut.DoChangeDataBase;
begin
  inherited;
  FDbServicoManut.DataBaseName := DataBaseName;
end;

function TCtrlServicoManut.ListServicoManut(IdServicoManut: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdServicoManut=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IDSERVICOMANUT, DESCSERVICO'+CR_LF+
    'FROM'+CR_LF+
    '  ServicoManut'+CR_LF+
    IFF(IdServicoManut=-1, 'WHERE (1 = 2)',
      IFF(IdServicoManut=0, 'ORDER BY'+CR_LF+'UPPER(DESCSERVICO)', 'WHERE'+CR_LF+
        '  (IdServicoManut = '+FloatToStr(IdServicoManut)+')')));
end;

function TCtrlServicoManut.GravarServicoManut: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarServicoManut(FCdsServicoManut.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      Result := ApplyCds(FCdsServicoManut, FDbServicoManut, [], []);
      if not(Result) then
        MessageInfo := FDbServicoManut.MessageInfo;
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
