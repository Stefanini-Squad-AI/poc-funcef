{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 11/03/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlPessoaFilialPessoa;

interface
//*{$I VERSAO_PADRAO.INC}

uses SysUtils, CmEventosCadastro, uCMTypes, IvDictio,  uCtrlPessoa,
  uCtrlCustomRH, uCtrlFuncoesRH, uDbFilialPessoa;

type
  TCtrlPessoaFilialPessoa = class(TCtrlCustomPessoaRH)
  protected
    procedure DoChangeDataBase; override;
    procedure AfterInitialize; override;
    function  ProcessaOutros(Operacao: TOperacao; var Mensagem: string): boolean; override;
    function  ExecAppServer(Operacao: TOperacao): boolean; override;
  private
    FDb: TDbFilialPessoa;
    FFU: TCtrlFuncoesRH;
  public
    constructor Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string); reintroduce; 
    destructor  Destroy; override;

    function ListSubTipo(IdPessoa: double): OleVariant;
    function ListPessoaEstab(ListaIdEmpresa: string = ''): OleVariant;
    function ListEstabDaEmpresa(IdEmpresa: integer): OleVariant;
  end;

implementation

//* uses Variants;

{ TCtrlPessoaFilialPessoa }

constructor TCtrlPessoaFilialPessoa.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string);
begin
  inherited Create;
  SetAutorizacoes(UsuXFilial, UsuXCCusto, IdUsuarioGeral);

  FDb := TDbFilialPessoa.Create(Self);
  FFU := TCtrlFuncoesRH.Create;
end;

destructor TCtrlPessoaFilialPessoa.Destroy;
begin
  FDb.Free;
  FFU.Free;
  inherited;
end;

procedure TCtrlPessoaFilialPessoa.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
 //*  FFU.DataBaseName := DataBaseName;
end;

procedure TCtrlPessoaFilialPessoa.AfterInitialize;
begin
  inherited;
  FFU.InitializeAs(Self);
end;

function TCtrlPessoaFilialPessoa.ListSubTipo(IdPessoa: double): OleVariant;
begin
  FDb.IdFilialPessoa.asFloat := Idpessoa;
  Result := GetDataPacket(FDb.sSqlSelect);
end;

function TCtrlPessoaFilialPessoa.ListPessoaEstab(ListaIdEmpresa: string): OleVariant;
var
  sSQL: string;
begin
  // Estabelecimento(s) habilitados para o usuário
  if (FUsuXFilial <> '') then
    sSQL := FFU.MontaLinhaSelSQL('  (PJ.IDPESSOA', FUsuXFilial, 1) +CR_LF
  else
    sSQL := '';

  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  PJ.IDPESSOA, PJ.NOME, NVL(FP.FATORFAIXA,1) AS FATORFAIXA'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA PJ, FILIALPESSOA FP'+CR_LF+
    'WHERE'+CR_LF+
    sSQL+
    FFU.IFF(ListaIdEmpresa = '', '(PJ.IDGRUPO IN (SELECT IDPESSOA FROM EMPRESAPROP)) AND',
      FFU.IFF(Pos(',', ListaIdEmpresa) > 0,
        '  (PJ.IDGRUPO       IN (' +ListaIdEmpresa+ ')) AND',
        '  (PJ.IDGRUPO        = ' +ListaIdEmpresa+ ') AND')+CR_LF)+
    '  (FP.IDFILIALPESSOA = PJ.IDPESSOA)');
end;

function TCtrlPessoaFilialPessoa.ListEstabDaEmpresa(IdEmpresa: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  P.IDPESSOA, P.NOME, NVL(FP.FATORFAIXA,1) AS FATORFAIXA' +CR_LF+
    'FROM' +CR_LF+
    '  PESSOA P, FILIALPESSOA FP' +CR_LF+
    'WHERE' +CR_LF+
    FFU.IFF(FUsuXFilial<>'', FFU.MontaLinhaSelSQL('  (FP.IDFILIALPESSOA', FUsuXFilial, 1) +CR_LF, '')+
    '  (FP.IDFILIALPESSOA = P.IDPESSOA) AND' +CR_LF+
    '  ((P.IDGRUPO  = ' +FloatToStr(IdEmpresa)+ ') OR'+CR_LF+
    '   (P.IDGRUPO IN (SELECT IDPESSOA' +CR_LF+
    '                  FROM   PESSOA' +CR_LF+
    '                  WHERE  (IDGRUPO = ' +FloatToStr(IdEmpresa)+ '))) OR' +CR_LF+
    '   (P.IDGRUPO IN (SELECT IDPESSOA' +CR_LF+
    '                  FROM   PESSOA' +CR_LF+
    '                  WHERE  (IDGRUPO IN (SELECT IDPESSOA' +CR_LF+
    '                                      FROM   PESSOA' +CR_LF+
    '                                      WHERE  (IDGRUPO = ' +FloatToStr(IdEmpresa)+ '))))) OR' +CR_LF+
    '   (P.IDGRUPO IN (SELECT IDPESSOA' +CR_LF+
    '                  FROM   PESSOA' +CR_LF+
    '                  WHERE  (IDGRUPO IN (SELECT IDPESSOA' +CR_LF+
    '                                      FROM   PESSOA' +CR_LF+
    '                                      WHERE  (IDGRUPO IN (SELECT IDPESSOA' +CR_LF+
    '                                                          FROM   PESSOA' +CR_LF+
    '                                                          WHERE  (IDGRUPO = ' +FloatToStr(IdEmpresa)+ '))))))))' +CR_LF+
    'ORDER BY' +CR_LF+
    '  UPPER(NOME)');
end;

function TCtrlPessoaFilialPessoa.ProcessaOutros(Operacao: TOperacao; var Mensagem: string): boolean;
begin
  if (Operacao = opApagar) then
    CdsSubTipo.Delete;

  Result := ApplyCds(CdsSubTipo, FDb, [_DbPessoa.IdPessoa], [FDb.IdFilialPessoa]);

  if not(Result) then
    Mensagem := FDb.MessageInfo;
end;

function TCtrlPessoaFilialPessoa.ExecAppServer(Operacao: TOperacao): boolean;
begin
  Result := Connection.AppServer.ProcessaPessoaFilialPessoa(FUsuXFilial, FUsuXCCusto,
    FIdUsuarioGeral, Integer(Operacao), CdsPessoa.Data, CdsPessoafisica.Data,
    CdsDocpessoa.Data, CdsSubTipo.Data, CdsEndpess.Data, CdsTelendpess.Data,
    CdsContatopess.Data, CdsTelcontato.Data, CdsContaBancaria.Data,
    CdsImagensPessoa.Data, CdsImagensDOC.Data);
    //*{$IFDEF PADRAO_7_08_05}
    //*CdsAtributosPessoa.Data, CdsEventosPessoa.Data);
    //*{$ELSE}
   //* NULL, NULL);
   //* {$ENDIF}
end;

end.
