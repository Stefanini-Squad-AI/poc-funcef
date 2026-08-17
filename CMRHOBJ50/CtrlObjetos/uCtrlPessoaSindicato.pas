{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 11/03/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlPessoaSindicato;

interface

uses SysUtils, uSistema, uCMClientDataSet, CmEventosCadastro, uCMTypes, uCtrlPessoa,
  uCtrlFuncoesRH, uCtrlCustomRH, uDbSindicato, uDbAliquotaSind;

type
  TCtrlPessoaSindicato = class(TCtrlCustomPessoaRH)
  protected
    procedure AfterInitialize; override;
    procedure DoChangeDataBase; override;
    function  ProcessaOutros(Operacao: TOperacao; var Mensagem: string): boolean; override;
    procedure OnCreateAppServer; override;
  private
    FCdsAliquotaSind: TCMClientDataSet;
    FDb: TDbSindicato;
    FDbAliquotaSind: TDbAliquotaSind;

    FFU: TCtrlFuncoesRH;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListSubTipo(IdPessoa: double): OleVariant;
    function ListAliquota(IdSindicato: double): OleVariant;
    function ListPessoaSindicato: OleVariant;
    function ListSindicatoComFuncionarios(SelDemitidos: boolean = true): OleVariant;

    property CdsAliquota: TCMClientDataSet read FCdsAliquotaSind write FCdsAliquotaSind;
  end;

implementation

uses uMidasUtil;

{ TCtrlPessoaSindicato }

constructor TCtrlPessoaSindicato.Create;
begin
  inherited;
  FDb := TDbSindicato.Create(Self);
  FDbAliquotaSind := TDbAliquotaSind.Create(Self);
  FFU := TCtrlFuncoesRH.Create;
end;

procedure TCtrlPessoaSindicato.OnCreateAppServer;
begin
  inherited;
  FCdsAliquotaSind := TCMClientDataSet.Create(nil);
end;

destructor TCtrlPessoaSindicato.Destroy;
begin
  FDbAliquotaSind.Free;
  FDb.Free;
  FFU.Free;

  if (IsAppServer) then
    FCdsAliquotaSind.Free;

  inherited;
end;

procedure TCtrlPessoaSindicato.AfterInitialize;
begin
  inherited;
  FFU.InitializeAs(Self);
end;

procedure TCtrlPessoaSindicato.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
  FDbAliquotaSind.DataBaseName := DataBaseName;
  FFU.DataBase := DataBase;
end;

function TCtrlPessoaSindicato.ListSubTipo(IdPessoa: double): OleVariant;
begin
  FDb.IdPessoa.asFloat := IdPessoa;
  Result := GetDataPacket(FDb.sSqlSelect);
end;

function TCtrlPessoaSindicato.ListAliquota(IdSindicato: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDSINDICATO, IDFAIXAALIQSIND, TAXADAFAIXA, VALLIMITEFAIXA'+CR_LF+
    'FROM'+CR_LF+
    '  ALIQUOTASIND'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDSINDICATO = '+FloatToStr(IdSindicato)+')');
end;

function TCtrlPessoaSindicato.ListPessoaSindicato: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  PJ.IDPESSOA, PJ.NOME, PJ.RAZAOSOCIAL'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA PJ, SINDICATO S'+CR_LF+
    'WHERE'+CR_LF+
    '  (S.IDPESSOA = PJ.IDPESSOA)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  NOME');
end;

function TCtrlPessoaSindicato.ListSindicatoComFuncionarios(SelDemitidos: boolean): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT DISTINCT'+CR_LF+
    '  P.IDPESSOA, P.NOME'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, PESSOAFISICA PEFIS, FUNCIONARIO F, SINDICATO S'+CR_LF+
    FFU.IFF(SelDemitidos, '  ,SITFUNC SF, FILIALPESSOA FP'+CR_LF, '')+
    'WHERE'+CR_LF+
    FFU.IFF(SelDemitidos,
      '  (SF.TIPOSIT       <> ''D'') AND'+CR_LF+
      '  (SF.IDSITFUNC      = F.IDSITFUNC) AND'+CR_LF+
      '  (FP.IDFILIALPESSOA = F.IDESTAB) AND'+CR_LF, '')+
    '  (F.IDPESSOA        = PEFIS.IDPESSOA) AND'+CR_LF+
    '  (S.IDPESSOA        = PEFIS.IDSINDICATO) AND'+CR_LF+
    '  (S.IDPESSOA        = P.IDPESSOA)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  NOME');
end;

function TCtrlPessoaSindicato.ProcessaOutros(Operacao: TOperacao; var Mensagem: string): boolean;
begin
  try
    if (Operacao = opApagar) then
    begin
      EmptyCds([CdsSubTipo, FCdsAliquotaSind]);

      Result := ApplyCds(FCdsAliquotaSind, FDbAliquotaSind, [], []);
      if not(Result) then
        raise Exception.Create(FDbAliquotaSind.MessageInfo);

      Result := ApplyCds(CdsSubTipo, FDb, [], []);
      if not(Result) then
        raise Exception.Create(FDb.MessageInfo);
    end
    else
    begin
      Result := ApplyCds(CdsSubTipo, FDb, [_DbPessoa.IdPessoa], [FDb.IdPessoa]);
      if not(Result) then
        raise Exception.Create(FDb.MessageInfo);

      Result := ApplyCds(FCdsAliquotaSind, FDbAliquotaSind, [_DbPessoa.IdPessoa],
        [FDbAliquotaSind.IdSindicato]);
      if not(Result) then
        raise Exception.Create(FDbAliquotaSind.MessageInfo);
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
