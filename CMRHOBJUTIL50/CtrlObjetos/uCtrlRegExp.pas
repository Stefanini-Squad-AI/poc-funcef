{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 15/10/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlRegExp;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio,  uCMClientDataSet,
  uCtrlCustomRH, uDbHstExper;

type
  TCtrlRegExp = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbHstExper: TDbHstExper;
    FCdsHstExper: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListHistorico(IdPessoa: double = 0; IdExper: double = 0): OleVariant;
    function ListHstExper(IdPessoa: double = 0; IdExper: double = 0): OleVariant;
    function ListHstExperSimples(IdPessoa: double = 0): OleVariant;

    function GravarHstExper: boolean;

    property CdsHstExper: TCMClientDataSet read FCdsHstExper write FCdsHstExper;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlRegExp }

constructor TCtrlRegExp.Create;
begin
  inherited;
  FDbHstExper := TDbHstExper.Create(Self);
end;

destructor TCtrlRegExp.Destroy;
begin
  FDbHstExper.Free;
  if (IsAppServer) then
    FCdsHstExper.Free;
  inherited;
end;

procedure TCtrlRegExp.OnCreateAppServer;
begin
  inherited;
  FCdsHstExper := TCMClientDataSet.Create(nil);
end;

procedure TCtrlRegExp.DoChangeDataBase;
begin
  inherited;
  FDbHstExper.DataBaseName := DataBaseName;
end;

function TCtrlRegExp.ListHistorico(IdPessoa, IdExper: double): OleVariant;
var
  sSQL: string;
begin
  sSQL := '';
  if (IdPessoa = -1) then
    sSQL := 'WHERE' +CR_LF+ '(1 = 2)' +CR_LF
  else
  if (IdPessoa > 0) or (IdExper > 0) then
  begin
    sSQL := 'WHERE' +CR_LF;

    if (IdPessoa > 0) then
      sSQL := sSQL + '  (IDPESSOA = ' +FloatToStr(IdPessoa)+ ')'+
        IFF(IdExper>0, ' AND', '')+ CR_LF;

    if (IdExper > 0) then
      sSQL := sSQL + '  (IDEXPER  = ' +FloatToStr(IdExper)+ ')' +CR_LF;
  end;    

  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDPESSOA, IDEXPER, DAT_INI, DAT_FIM'+CR_LF+
    'FROM'+CR_LF+
    '  HSTEXPER'+CR_LF+
    sSQL+
    'ORDER BY'+CR_LF+
    '  DAT_INI, DAT_FIM');
end;

function TCtrlRegExp.ListHstExper(IdPessoa, IdExper: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  HST.IDPESSOA, HST.IDEXPER, HST.DAT_INI, HST.DAT_FIM, EXP.DESCRICAO,'+CR_LF+
    '  ROUND(TO_NUMBER(NVL(HST.DAT_FIM,SYSDATE) - HST.DAT_INI) * 12 / 365.25, 0) AS MESES'+CR_LF+
    'FROM'+CR_LF+
    '  HSTEXPER HST, TABEXPER EXP'+CR_LF+
    'WHERE'+CR_LF+
    IFF(IdPessoa=0, '', '  (HST.IDPESSOA = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF)+
    IFF(IdExper=0 , '', '  (HST.IDEXPER  = ' +FloatToStr(IdExper)+ ') AND'+CR_LF)+
    '  (HST.IDEXPER  = EXP.IDEXPER)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  DAT_INI, DAT_FIM');
end;

function TCtrlRegExp.ListHstExperSimples(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  HST.IDPESSOA, HST.DAT_INI, HST.DAT_FIM, EXP.DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  HSTEXPER HST, TABEXPER EXP'+CR_LF+
    'WHERE'+CR_LF+
    '  (HST.IDPESSOA = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (HST.IDEXPER  = EXP.IDEXPER)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  DAT_INI DESC');
end;

function TCtrlRegExp.GravarHstExper: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarHstExper(FCdsHstExper.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsHstExper, FDbHstExper, [], []);
      if not(Result) then
        raise Exception.Create(FDbHstExper.MessageInfo);

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
