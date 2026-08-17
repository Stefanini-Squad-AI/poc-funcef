{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 14/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlFonte;

interface

uses SysUtils, uCmDbObject, uCMControlObject, IvDictio,  uCMClientDataSet,
  uCtrlCustomRH, uDbFontRecr;

type
  TCtrlFonte = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbFontRecr;
    FCds: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListGeral(IdFontRecr: double = 0): OleVariant;

    function Gravar: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH; 

{ TCtrlFonte }

constructor TCtrlFonte.Create;
begin
  inherited;
  FDb := TDbFontRecr.Create(Self);
end;

destructor TCtrlFonte.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlFonte.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlFonte.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlFonte.ListGeral(IdFontRecr: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdFontRecr=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IDFONTRECR, DESCRICAO, OBSERVACAO'+CR_LF+
    'FROM'+CR_LF+
    '  FONTRECR'+CR_LF+
    IFF(IdFontRecr=-1, 'WHERE (1 = 2)',
      IFF(IdFontRecr=0, '', 'WHERE'+CR_LF+
        '  (IDFONTRECR = ' +FloatToStr(IdFontRecr)+ ')')));
end;

function TCtrlFonte.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarFonteRecr(FCds.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCds, FDb, [], []);
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

end.
