{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 05/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlTipoBenSal;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio, uCMClientDataSet,
  uCtrlCustomRH, uDbTipoBenSal;

type
  TCtrlTipoBenSal = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbTipoBenSal: TDbTipoBenSal;
    FCdsTipoBenSal: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListTipoBenSal(IdBenefSalar: double = 0): OleVariant;

    function GravarTipoBenSal: boolean;

    property CdsTipoBenSal: TCMClientDataSet read FCdsTipoBenSal write FCdsTipoBenSal;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlTipoBenSal }

constructor TCtrlTipoBenSal.Create;
begin
  inherited;
  FDbTipoBenSal := TDbTipoBenSal.Create(Self);
end;

destructor TCtrlTipoBenSal.Destroy;
begin
  FDbTipoBenSal.Free;
  if (IsAppServer) then
    FCdsTipoBenSal.Free;
  inherited;
end;

procedure TCtrlTipoBenSal.OnCreateAppServer;
begin
  inherited;
  FCdsTipoBenSal := TCMClientDataSet.Create(nil);
end;

procedure TCtrlTipoBenSal.DoChangeDataBase;
begin
  inherited;
  FDbTipoBenSal.DataBaseName := DataBaseName;
end;

function TCtrlTipoBenSal.ListTipoBenSal(IdBenefSalar: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdBenefSalar=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IDBENEFSALAR, DESCRBENEFSALAR'+CR_LF+
    'FROM'+CR_LF+
    '  TIPOBENSAL'+CR_LF+
    IFF(IdBenefSalar=-1, 'WHERE (1 = 2)',
      IFF(IdBenefSalar=0, 'ORDER BY'+CR_LF+'  DESCRBENEFSALAR', 'WHERE'+CR_LF+
        '  (IDBENEFSALAR = '+FloatToStr(IdBenefSalar)+')')));
end;

function TCtrlTipoBenSal.GravarTipoBenSal: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarTipoBenSal(FCdsTipoBenSal.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsTipoBenSal, FDbTipoBenSal, [], []);
      if not(Result) then
        raise Exception.Create(FDbTipoBenSal.MessageInfo);

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
