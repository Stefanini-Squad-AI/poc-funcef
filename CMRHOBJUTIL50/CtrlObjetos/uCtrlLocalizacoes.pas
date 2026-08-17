unit uCtrlLocalizacoes;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio, uCMClientDataSet,
  uCtrlCustomRH, uDbLocalizacao;

type
  TCtrlLocalizacoes = class(TCtrlCustomRH)
  protected
    procedure AfterInitialize; override;
    procedure OnCreateAppServer; override;
    procedure DoChangeDataBase; override;
  private
    FDbLocalizacao: TDbLocalizacao;  
    FCds: TCMClientDataSet;

    FExisteTipoAreaPadrao: boolean;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function Procurar(IdLocalizacao, IdPessoa: double): OleVariant;
    function ListaLocalizacao(IdPessoa: double; IdLocalizacao: double = -1): OleVariant;
    function ListaNomeLocalizacao(IdPessoa: double; IdLocalizacao: double = -1): OleVariant;

    function GetExisteTipoAreaPadrao: boolean;

    function AplicaOperacao: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlLocalizacoes }

constructor TCtrlLocalizacoes.Create;
begin
  inherited;
  FDbLocalizacao := TDbLocalizacao.Create(Self);
end;

destructor TCtrlLocalizacoes.Destroy;
begin
  FDbLocalizacao.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlLocalizacoes.AfterInitialize;
begin
  inherited;
  if (ConnectionSide = cnsServer) then
    FExisteTipoAreaPadrao := GetExisteTipoAreaPadrao;
end;

procedure TCtrlLocalizacoes.OnCreateAppServer;
begin
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlLocalizacoes.DoChangeDataBase;
begin
  inherited;
  FDbLocalizacao.DataBaseName := DataBaseName;
end;

function TCtrlLocalizacoes.Procurar(IdLocalizacao, IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDLOCALIZACAO, IDPESSOA, IDTIPOAREA, IDRESPONSAVEL,'+CR_LF+
    '  IDEMPRESA, NOME, CODCENTROCUSTO, ENDERECO, FLGLOCSAITEMP'+CR_LF+
    'FROM'+CR_LF+
    '  LOCALIZACAO'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDLOCALIZACAO = ' +FloatToStr(IdLocalizacao)+ ') AND'+CR_LF+
    '  (IDPESSOA      = ' +FloatToStr(IdPessoa)+ ')');
end;

function TCtrlLocalizacoes.ListaLocalizacao(IdPessoa, IdLocalizacao: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  L.IDLOCALIZACAO, L.IDPESSOA, L.IDRESPONSAVEL, L.IDEMPRESA,'+CR_LF+
    '  L.CODCENTROCUSTO, L.IDTIPOAREA, L.NOME, L.ENDERECO, L.FLGLOCSAITEMP,'+CR_LF+
    '  P.NOME AS NOMERESP, CC.NOME AS DESCCCUSTO'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, LOCALIZACAO L, CENTCUST CC'+CR_LF+
    'WHERE'+CR_LF+
    IFF(IdLocalizacao <> -1,
      '  (L.IDLOCALIZACAO  = ' +FloatToStr(IdLocalizacao)+ ') AND'+CR_LF, '')+
    '  (L.IDPESSOA       = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (L.IDRESPONSAVEL  = P.IDPESSOA) AND'+CR_LF+
    '  (L.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND'+CR_LF+
    '  (L.IDEMPRESA      = CC.IDEMPRESA)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  L.NOME');
end;

function TCtrlLocalizacoes.ListaNomeLocalizacao(IdPessoa, IdLocalizacao: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDLOCALIZACAO, NOME'+CR_LF+
    'FROM'+CR_LF+
    '  LOCALIZACAO'+CR_LF+
    'WHERE'+CR_LF+
    IFF(IdLocalizacao <> -1,
      '  (IDLOCALIZACAO = ' +FloatToStr(IdLocalizacao)+ ') AND'+CR_LF, '')+
    '  (IDPESSOA      = ' +FloatToStr(IdPessoa)+ ')'+CR_LF+
    'ORDER BY'+CR_LF+
    '  UPPER(NOME)');
end;

function TCtrlLocalizacoes.GetExisteTipoAreaPadrao: boolean;
begin
  _Cds.Data := GetDataPacket('SELECT IDTIPOAREA FROM TIPOAREA WHERE (IDTIPOAREA = 1)');
  Result := not(_Cds.IsEmpty);
end;

function TCtrlLocalizacoes.AplicaOperacao: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarLocalizacao(FCds.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      if not(FExisteTipoAreaPadrao) then
      begin
        Result := ExecSQL(
          'INSERT INTO TIPOAREA (IDTIPOAREA, DESCTIPOAREA) VALUES (1,' +
          QuotedStr(CMTranslate('Geral'))+ ')');
        if not(Result) then
          raise Exception.Create(MessageInfo);
      end;

      Result := ApplyCds(FCds,FDbLocalizacao,[],[]);
      if not(Result) then
        raise Exception.Create(FDbLocalizacao.MessageInfo);

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
