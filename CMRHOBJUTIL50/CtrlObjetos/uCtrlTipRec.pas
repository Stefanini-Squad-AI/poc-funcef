{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 14/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlTipRec;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio,  uCMClientDataSet,
  uCtrlCustomRH, uDbTipoRecTrab;

type
  TCtrlTipRec = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbTipRec: TDbTipoRecTrab;
    FCdsTipRec: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListTipRec(CodTipoRecurso: double = 0): OleVariant;

    function GravarTipRec: boolean;

    property CdsTipRec: TCMClientDataSet read FCdsTipRec write FCdsTipRec;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlTipRec }

constructor TCtrlTipRec.Create;
begin
  inherited;
  FDbTipRec := TDbTipoRecTrab.Create(Self);
end;

destructor TCtrlTipRec.Destroy;
begin
  FDbTipRec.Free;
  if (IsAppServer) then
    FCdsTipRec.Free;
  inherited;
end;

procedure TCtrlTipRec.OnCreateAppServer;
begin
  inherited;
  FCdsTipRec := TCMClientDataSet.Create(nil);
end;

procedure TCtrlTipRec.DoChangeDataBase;
begin
  inherited;
  FDbTipRec.DataBaseName := DataBaseName;
end;

function TCtrlTipRec.ListTipRec(CodTipoRecurso: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(CodTipoRecurso=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  CODTIPORECURSO, DESCRICAO, VALORHONOR, FLGPENHORA, FLGENCERRAMENTO'+CR_LF+
    'FROM'+CR_LF+
    '  TIPORECTRAB'+CR_LF+
    IFF(CodTipoRecurso=-1, 'WHERE (1 = 2)',
      IFF(CodTipoRecurso=0, 'ORDER BY'+CR_LF+'  DESCRICAO', 'WHERE'+CR_LF+
        '  (CODTIPORECURSO = ' +FloatToStr(CodTipoRecurso)+ ')')));
end;

function TCtrlTipRec.GravarTipRec: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarTipRec(FCdsTipRec.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsTipRec, FDbTipRec, [], []);
      if not(Result) then
        Exception.Create(FDbTipRec.MessageInfo);

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
