{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 05/02/2002                                 }
{                                                       }
{*******************************************************}
{ ATUALIZAÇÕES }
{------------------------------------------------------------------------------
Nº SOL......: 201365
Nº KINTANA..: 1965590
Data........: 25/07/2013
Responsável.: William Santana
Descrição...: Inclusão da função PopulaCheckListbox() para popular a Checklistbox;
------------------------------------------------------------------------------  }

unit uCtrlTipoBenSal;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
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
    constructor Create;  override;
    destructor  Destroy; override;

    function ListTipoBenSal(IdBenefSalar: double = 0): OleVariant;

    function GravarTipoBenSal: boolean;

    function PopulaCheckListbox: OleVariant; //William Santana SOL:201365 - KIN: 1965590

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
    '  IdBenefSalar, DescrBenefSalar'+CR_LF+
    'FROM'+CR_LF+
    '  TipoBenSal'+CR_LF+
    IFF(IdBenefSalar=-1, 'WHERE (1 = 2)',
      IFF(IdBenefSalar=0, 'ORDER BY'+CR_LF+'  DESCRBENEFSALAR', 'WHERE'+CR_LF+
        '  (IdBenefSalar = '+FloatToStr(IdBenefSalar)+')')));
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
      if (Result) then
        Commit
      else
        raise Exception.Create(FDbTipoBenSal.MessageInfo);
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

//William Santana SOL:201365 - KIN: 1965590
function TCtrlTipoBenSal.PopulaCheckListbox: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IdBenefSalar, DescrBenefSalar'+CR_LF+
    'FROM'+CR_LF+
    '  TipoBenSal' );
end;
//William Santana

end.
