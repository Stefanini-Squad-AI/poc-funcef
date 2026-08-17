{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Eugênio C. Frioli               }
{ Criado Em: 26/12/2003                                 }
{                                                       }
{*******************************************************}

unit uCtrlPessoaAdvogado;

interface

uses SysUtils, uSistema, uCMClientDataSet, CmEventosCadastro, uCMTypes, uCtrlPessoa,
  uCtrlFuncoesRH, uCtrlCustomRH, uDbAdvogado;

type
  TCtrlPessoaAdvogado = class(TCtrlCustomPessoaRH)
  protected
    procedure AfterInitialize; override;
    procedure DoChangeDataBase; override;
    function  ProcessaOutros(Operacao: TOperacao; var Mensagem: string): boolean; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbAdvogado;

    FFU: TCtrlFuncoesRH;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListSubTipo(IdPessoa: double): OleVariant;
    function ListPessoaAdvogado: OleVariant;
  end;

implementation

uses uMidasUtil;

{ TCtrlPessoaAdvogado }

constructor TCtrlPessoaAdvogado.Create;
begin
  inherited;
  FDb := TDbAdvogado.Create(Self);
  FFU := TCtrlFuncoesRH.Create;
end;

procedure TCtrlPessoaAdvogado.OnCreateAppServer;
begin
  inherited;
end;

destructor TCtrlPessoaAdvogado.Destroy;
begin
  FDb.Free;
  FFU.Free;

  inherited;
end;

procedure TCtrlPessoaAdvogado.AfterInitialize;
begin
  inherited;
  FFU.InitializeAs(Self);
end;

procedure TCtrlPessoaAdvogado.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
  FFU.DataBase := DataBase;
end;

function TCtrlPessoaAdvogado.ListSubTipo(IdPessoa: double): OleVariant;
begin
  FDb.IdPessoa.asFloat := IdPessoa;
  Result := GetDataPacket(FDb.sSqlSelect);
end;

function TCtrlPessoaAdvogado.ListPessoaAdvogado: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  P.IDPESSOA, P.NOME, P.RAZAOSOCIAL'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, ADVOGADO A'+CR_LF+
    'WHERE'+CR_LF+
    '  (A.IDPESSOA = P.IDPESSOA)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  UPPER(NOME)');
end;

function TCtrlPessoaAdvogado.ProcessaOutros(Operacao: TOperacao; var Mensagem: string): boolean;
begin
  try
    if (Operacao = opApagar) then
    begin
      EmptyCds([CdsSubTipo]);

      Result := ApplyCds(CdsSubTipo, FDb, [], []);
      if not(Result) then
        raise Exception.Create(FDb.MessageInfo);
    end
    else
    begin
      Result := ApplyCds(CdsSubTipo, FDb, [_DbPessoa.IdPessoa], [FDb.IdPessoa]);
      if not(Result) then
        raise Exception.Create(FDb.MessageInfo);
    end;
  except
    on E:Exception do
    begin
      Result := false;
      Mensagem := E.Message;
    end;
  end;
end;

end.
