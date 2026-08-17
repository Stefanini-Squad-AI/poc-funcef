{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 01/08/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlListTerceirosRH;

interface

uses SysUtils, Controls, uCmDbObject, uCmControlObject, IvDictio,
  uCMClientDataSet, uCtrlCustomRH;

type
  TCtrlListTerceirosRH = class(TCtrlCustomRH)
  public
    constructor Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string); reintroduce;
    destructor  Destroy; override;

    function ListUsuarioSistema: OleVariant;
    function ListPessoa(IdPessoa: double): OleVariant;
    function ListDocPessoa(IdPessoa: double): OleVariant;
    function ListTipoDocumento: OleVariant;
    function ListTipoDocPessoa: OleVariant;
    function ListTipoDocRecPag(RecPag: string): OleVariant;
    function ListTipoDocRecebDesemb(IdEmpresa: double; RecPag: string; Analitico: boolean): OleVariant;
    function ListTipoOperacao: OleVariant;
    function ListCidadeEstadoPais: OleVariant;
    function ListCidadeEstado: OleVariant;
    function ListTipoDependencia: OleVariant; overload;
    function ListSitDepen: OleVariant;
    function ListPaises: OleVariant;
    function ListBancoComMasc: OleVariant;
    function ListCidadeNasc(IdPais: integer; ListaSiglaUF: string = '';
      NomeCidade: string = ''): OleVariant;
    function ListEstado(IdPais: integer = 0; IdCidades: integer = 0): OleVariant;
    function ListMoeda: OleVariant;
    function ListCotacaoMoeda(MoeCodigo: integer; Data: TDate): OleVariant;
    function ListNaturezaEmpresarial: OleVariant;
    function ListRamoFornecedor: OleVariant;
    function ListRamoFornecedorDeEstabelecimento: OleVariant;
    function ListInforme: OleVariant;
    function ListNaturezaOperacao: OleVariant;
    function ListEmpresaProp(IdEmpresa: integer = 0): OleVariant;
    function ListCCusto(ListaIdEmpresa: string; CodCentroCusto: string = '';
      IncluirRegistroGenerico: boolean = false; FiltrarSintetico: boolean = false): OleVariant;
    function ListMarcaraCCustoSintetico(IdEmpresa: double): OleVariant;
    function ListCCustoComFuncionarios(IdEmpresa: double): OleVariant;
    function ListContaContab: OleVariant;
    function ListSubConta(IdEmpresa: integer = 0; CodSubConta: double = 0;
      NomeSubConta: string = ''): OleVariant;
    function ListSubContaXConta(const Conta: string; const Plano, IdEmpresa: integer): OleVariant;
    function ListTipoDocRecebDesembXContabFolha(IdEmpresa: double): OleVariant;      
    function ListContasCCusto(IdEmpresa: double): OleVariant;
    function ListParamGlobal(IdEmpresa: double): OleVariant;
    function ListContabJurid(CodTipoObjeto: double; IndMateria, IndPrincipal: integer): OleVariant;
    function ListPessoaTerceiro(TipoPessoa: string = ''; IdGrupo: double = 0): OleVariant;
    function ListEmpresa_e_PessoaTerceiros: OleVariant;
    function ListFeriados(IdCidades, IdPais: integer; UF: string; DataIni,
      DataFin: TDateTime; ListaTipo: string = ''): OleVariant;
    function ListAgenciaBancaria: OleVariant;
    function ListIdAgencia_e_NumBanco(IdAgencia: double): OleVariant;
    function ListImagemPessoa(IdPessoa: double): OleVariant;
    function ListImagem(IdImagem: double): OleVariant;
    function ListContatoPessoaJuridica(IdPessoa: double): OleVariant;
    function ListFaixaNivel(IdFaixaSalarial: double; IdEmpresa: integer): OleVariant;
    function ListCamposCM(GrupoArquivo: string = ''): OleVariant;
    function ListTabela_Generica_E_Longa(NomeTabela: string = ''): OleVariant;
    function ListRegras: OleVariant;
    function ListGrupoRegra: OleVariant;
    function ListRegraXGrupo(IdRegra: double): OleVariant;
    function ListPessoaPorTipo(Tipo: string): OleVariant;
    function ListEmpresaForn(IdEmpresa: integer; IdFornecedor: double): OleVariant;
    function ListDocumentoEmBranco: OleVariant;
    function ListEndereco(IdPessoa: double): OleVariant;
    function ListTipoDadoTabGener: OleVariant;
    function ListPatrocinadora: OleVariant;
    function ListPlanoPrev: OleVariant;
    function ListCargoEx: OleVariant;
    function ListImovel: OleVariant;
    function ListHistoricoPadrao(IdEmpresa: double; CodHist: string = ''): OleVariant;
    function ListEventoImovelVazio: OleVariant;
    function ListInvestimento: OleVariant;
    function ListAtividadeProjeto(const IdEmpresa: integer): OleVariant;

    function ValorImovel(IdImovel: double = 0): OleVariant;
    function ValorPenhorado(Id: double; Tipo: integer): double;
    procedure ValorContabil(Id: double; IdEmpresa, Tipo: integer;
      var Valor: double; var DataContabil: string);

    function RegraEmUso(IdRegra: double): boolean;

    function  GetMascaraPlano(IdPlano: integer): string;
    function  GetIdPlanoOrcamentario(IdEmpresa: double): double;
    function  GetPlano(IdEmpresa: double): integer;
    function  GetIdPatro(IdEmpresa: double): integer;
    function  GetIdPlanoPrev(IdEmpresa: double): integer;
    function  GetIdContraCheque: integer;
    function  GetNumeroPlanilha(PlnCodigo: double): double;
    function  GetContaBancariaFavorecido(IdFavorecido: double): integer;
    function  GetIdProgramaCCusto(CodCentroCusto: string; IdEmpresa: integer): integer;
    function  GetIdTipoProcesso(IdEmpresa: integer; IdUsuario: double;
      IdReferencia: integer): integer;
    function  GetFlgOk_RAD(IdProcesso: double): string;
    function  GetOpcaoTicket(Matricula: string): string;
    procedure GetPercREB_DataAssoc(Matricula: string; var PercREB, DataAssoc: string);
    function  GetIdAgenciaBancaria(NumAgencia: string): double;
    function  GetNumProprietarios(IdEmpresa: double): integer;
    function  GetPessoa_Documento(NumDocumento: string; IdDocumento: double): double;
    function  GetNumPlanilha(PlnCodigo: double): double;
    function  GetNomePessoa(IdPessoa: double): string;
    function  GetNomeAtividadeProjeto(UnidNegoc: integer): string;
    function  GetSistemaAtivo(IdModulo: integer): boolean;
    function  ObrigaSubConta(const Conta: string; const Plano: integer): boolean;
    function  IsSubContaValida(const Conta: string;
      const Plano, IdEmpresa, SubConta: integer): boolean;
    function  IsCCustoValido(const Conta: string;
      const Plano, IdEmpresa: integer; const CCusto: string): boolean;
    function GetCodInternacionalPais(const IdEmpresa: integer): string;
    function GetExisteParamCap(const IdEmpresa: integer; const RecPag: char): boolean;
  end;

implementation

uses  uCMTypes, uCtrlFuncoesRH;
//*uCMTraduzSql,

{ TCtrlListTerceirosRH }

constructor TCtrlListTerceirosRH.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string);
begin
  inherited Create;
  SetAutorizacoes(UsuXFilial, UsuXCCusto, IdUsuarioGeral);
end;

destructor TCtrlListTerceirosRH.Destroy;
begin
  inherited;
end;

function TCtrlListTerceirosRH.ListUsuarioSistema: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  P.NOME, U.IDUSUARIO'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, USUARIOSISTEMA U'+CR_LF+
    'WHERE'+CR_LF+
    '  (U.IDUSUARIO = P.IDPESSOA)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  P.NOME');
end;

function TCtrlListTerceirosRH.ListPessoa(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDPESSOA, NOME, RAZAOSOCIAL'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDPESSOA = ' +FloatToStr(IdPessoa)+ ')');
end;

function TCtrlListTerceirosRH.ListDocPessoa(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  DO.IDPESSOA, TDO.NOMEDOCUMENTO, DO.NUMDOCUMENTO,'+CR_LF+
    '  TDO.MASCARA, DO.ORGAO, DO.UF, DO.DATAEMISSAO'+CR_LF+
    'FROM'+CR_LF+
    '  DOCPESSOA DO, TIPODOCPESSOA TDO'+CR_LF+
    'WHERE'+CR_LF+
    '  (DO.IDPESSOA    = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (DO.IDDOCUMENTO = TDO.IDDOCUMENTO)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  TDO.NOMEDOCUMENTO');
end;

function TCtrlListTerceirosRH.ListTipoDocumento: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  NOMEDOCUMENTO, IDDOCUMENTO'+CR_LF+
    'FROM'+CR_LF+
    '  TIPODOCPESSOA'+CR_LF+
    'WHERE'+CR_LF+
    '  (FISICAJURIDICA = ''F'')');
end;

function TCtrlListTerceirosRH.ListTipoDocPessoa: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDDOCUMENTO, NOMEDOCUMENTO, FISICAJURIDICA, MASCARA'+CR_LF+
    'FROM'+CR_LF+
    '  TIPODOCPESSOA'+CR_LF+
    'ORDER BY'+CR_LF+
    '  NOMEDOCUMENTO');
end;

function TCtrlListTerceirosRH.ListTipoDocRecPag(RecPag: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  CODTIPDOC, DESCRICAO, DEBCRE,'+
      ' DECODE(RECPAG,''P'',' +QuotedStr(('Pagar'))+ ',' +QuotedStr(('Receber'))+ ') AS RECPAG' +CR_LF+
    'FROM'+CR_LF+
    '  TIPODOCRECPAG'+CR_LF+
    IFF(RecPag='','','WHERE'+CR_LF+'  (RECPAG   = ' +QuotedStr(RecPag)+ ')'+CR_LF)+
    'ORDER BY'+CR_LF+
    '  ' +IFF(RecPag='','RECPAG, ','') + 'DESCRICAO');
end;

function TCtrlListTerceirosRH.ListTipoDocRecebDesemb(IdEmpresa: double; RecPag: string;
  Analitico: boolean): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  CODTIPRECDES, DESCRICAO, PLACONTACREDITO, PLANO, PLACONTA,'+CR_LF+
      ' DECODE(RECPAG,''P'',' +QuotedStr(('Pagar'))+ ',' +QuotedStr(('Receber'))+ ') AS RECPAG' +CR_LF+
    'FROM'+CR_LF+
    '  TIPORECEBDESEMB'+CR_LF+
    'WHERE'+CR_LF+
    '  (NVL(ATIVO,''S'') <> ''N'') AND'+CR_LF+
    IFF(RecPag='', '', '  (RECPAG   = ' +QuotedStr(RecPag)+ ') AND'+CR_LF)+
    '  (ANASINT  = ' +QuotedStr(IFF(Analitico, 'A', 'S'))+ ') AND'+CR_LF+
    '  (IDPESSOA = ' +FloatToStr(IdEmpresa)+ ')'+CR_LF+
    'ORDER BY'+CR_LF+
    '  DESCRICAO');
end;

function TCtrlListTerceirosRH.ListTipoDocRecebDesembXContabFolha(IdEmpresa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT DISTINCT' +CR_LF+
    '  T.CODTIPRECDES, T.DESCRICAO' +CR_LF+
    'FROM' +CR_LF+
    '  TIPORECEBDESEMB T, CONTABFOLHA C' +CR_LF+
    'WHERE' +CR_LF+
    '  (NVL(ATIVO,''S'') <> ''N'') AND' +CR_LF+
    '  (T.RECPAG        = ''P'') AND' +CR_LF+
    '  (T.IDPESSOA      = ' +FloatToStr(IdEmpresa)+ ') AND' +CR_LF+
    '  (C.CODTIPRECDES  = T.CODTIPRECDES) AND' +CR_LF+
    '  (C.IDEMPRESAPROP = T.IDPESSOA)' +CR_LF+
    'ORDER BY'+CR_LF+
    '  T.DESCRICAO');
end;

function TCtrlListTerceirosRH.ListContasCCusto(IdEmpresa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  PLANO, PLACONTA, IDEMPRESA, CODCENTROCUSTO'+CR_LF+
    'FROM'+CR_LF+
    '  CONTASXCC'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDEMPRESA = ' +FloatToStr(IdEmpresa)+ ')');
end;

function TCtrlListTerceirosRH.ListTipoOperacao: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  TIPCODIGO, TIPDESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  TIPOPER'+CR_LF+
    'ORDER BY'+CR_LF+
    '  TIPDESCRICAO');
end;

function TCtrlListTerceirosRH.ListCidadeEstadoPais: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  C.IDCIDADES, LTRIM(RTRIM(C.NOME)) AS CIDADE, E.CODESTADO,'+CR_LF+
    '  LTRIM(RTRIM(E.NOMEESTADO)) AS ESTADO,'+CR_LF+
    '  LTRIM(RTRIM(P.NOMEPAIS)) AS PAIS'+CR_LF+
    'FROM'+CR_LF+
    '  CIDADES C, ESTADO E, PAIS P'+CR_LF+
    'WHERE'+CR_LF+
    '  (C.IDESTADO = E.IDESTADO) AND'+CR_LF+
    '  (E.IDPAIS   = P.IDPAIS)');
end;

function TCtrlListTerceirosRH.ListCidadeEstado: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  CI.IDCIDADES, ES.CODESTADO, CI.NOME AS CIDADE'+CR_LF+
    'FROM'+CR_LF+
    '  ESTADO ES, CIDADES CI'+CR_LF+
    'WHERE'+CR_LF+
    '  (CI.IDESTADO = ES.IDESTADO(+))');
end;

function TCtrlListTerceirosRH.ListTipoDependencia: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDDEPENDENCIA, DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  DEPEN'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDDEPENDENCIA <> ''PRP'')'+CR_LF+
    'ORDER BY'+CR_LF+
    '  DESCRICAO');
end;

function TCtrlListTerceirosRH.ListSitDepen: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDSITDEPENDENTE, DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  SITDEPENDENTE');
end;

function TCtrlListTerceirosRH.ListPaises: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDPAIS, (''  '' || NOMENACIONALIDADE) AS NOMENACIONALIDADE'+CR_LF+
    'FROM'+CR_LF+
    '  PAIS');
end;

function TCtrlListTerceirosRH.ListEstado(IdPais: integer; IdCidades: integer): OleVariant;
var
  sSQL: string;
begin
  sSQL := '';
  if (IdPais = -1) then
    sSQL := 'WHERE' +CR_LF+ '  (1 = 2)'
  else
  if (IdPais > 0) or (IdCidades > 0) then
  begin
    sSQL := 'WHERE' +CR_LF;

    if (IdPais > 0) then
      sSQL := sSQL +
        '  (E.IDPAIS = ' +IntToStr(IdPais)+ ')' +CR_LF;

    if (IdCidades > 0) then
    begin
      if (IdPais > 0) then
        sSQL := sSQL + ' AND' +CR_LF;

      sSQL := sSQL +
        '  (C.IDCIDADES = ' +IntToStr(IdCidades)+ ') AND'+CR_LF+
        '  (C.IDESTADO  = E.IDESTADO)'+CR_LF;
    end;
  end;

  Result := GetDataPacket(
    'SELECT DISTINCT'+IFF(IdPais=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  E.IDESTADO, E.CODESTADO, E.NOMEESTADO'+CR_LF+
    'FROM'+CR_LF+
    '  ESTADO E'+IFF(IdCidades<=0,'',', CIDADES C')+CR_LF+
    sSQL+
    'ORDER BY'+CR_LF+
    '  E.NOMEESTADO');
end;

function TCtrlListTerceirosRH.ListCidadeNasc(IdPais: integer; ListaSiglaUF,
  NomeCidade: string): OleVariant;
var
  sSQL, SiglaUF: string;
begin
  sSQL := '';
  if (IdPais > 0) then
    sSQL := sSQL + '  (E.IDPAIS = ' +IntToStr(IdPais)+ ') AND' +CR_LF;

  if (NomeCidade <> '') then
  begin
   //* if (TTipoBDPadrao(iTipoBD_Padrao) in [tbdSQLServer, tbdSQLServerOdbc]) then
  //*  sSQL := sSQL + '  (UPPER(REPLACE(REPLACE(C.NOME,''Ã'',''A''),''Õ'',''O'')'+
   //*      ') LIKE ' +QuotedStr(NomeCidade +'%')+ ') AND' +CR_LF
  //*  else
   //* if (TTipoBDPadrao(iTipoBD_Padrao) = tbdOracle) then
      sSQL := sSQL + '  (UPPER(CONVERT(REPLACE(REPLACE(C.NOME,''Ã'',''A''),''Õ'',''O''),'+
         '''US7ASCII'')) LIKE ' +QuotedStr(NomeCidade +'%')+ ') AND' +CR_LF;
  end;

  if (ListaSiglaUF <> '') then
  begin
    sSQL := sSQL + '  (' +CR_LF;
    while (ListaSiglaUF <> '') do
    begin
      ExtraiString(ListaSiglaUF, SiglaUF, ',');
      sSQL := sSQL + '    (UPPER(E.CODESTADO) LIKE ' +QuotedStr(SiglaUF +'%')+ ')' +
        IFF(ListaSiglaUF='', '', ' OR') + CR_LF;
    end;
    sSQL := sSQL + '  ) AND' +CR_LF;
  end;

  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  C.IDCIDADES, C.NOME' +CR_LF+
    'FROM' +CR_LF+
    '  CIDADES C, ESTADO E' +CR_LF+
    'WHERE' +CR_LF+
    sSQL+
    '  (E.IDESTADO = C.IDESTADO)' +CR_LF+
    'ORDER BY' +CR_LF+
    '  C.NOME');
end;

function TCtrlListTerceirosRH.ListMoeda: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  MOECODIGO, MOESIGLA, MOEDESC, MOEPERIODICIDADE'+CR_LF+
    'FROM'+CR_LF+
    '  MOEDA'+CR_LF+
    'ORDER BY'+CR_LF+
    '  MOEDESC');
end;

function TCtrlListTerceirosRH.ListCotacaoMoeda(MoeCodigo: integer; Data: TDate): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  DECODE(COTVALOR,NULL,0,COTVALOR) AS VALOR'+CR_LF+
    'FROM'+CR_LF+
    '  COTACAOMOEDA'+CR_LF+
    'WHERE'+CR_LF+
    '  (COTDATA   = TO_DATE('+QuotedStr(DateToStr(Data))+',''DD/MM/YYYY'')) AND'+CR_LF+
    '  (MOECODIGO = '+IntToStr(MoeCodigo)+')');
end;

function TCtrlListTerceirosRH.ListNaturezaEmpresarial: OleVariant;
begin
  Result := GetDataPacket('SELECT IDNATEMPRE, DESCRICAO FROM NATEMPRESA');
end;

function TCtrlListTerceirosRH.ListRamoFornecedor: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDRAMOFORNECEDOR, DESCRAMOFORNECEDOR'+CR_LF+
    'FROM'+CR_LF+
    '  RAMOFORNECEDOR'+CR_LF+
    'ORDER BY'+CR_LF+
    '  DESCRAMOFORNECEDOR');
end;

function TCtrlListTerceirosRH.ListRamoFornecedorDeEstabelecimento: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT DISTINCT'+CR_LF+
    '  R.IDRAMOFORNECEDOR, R.DESCRAMOFORNECEDOR'+CR_LF+
    'FROM'+CR_LF+
    '  RAMOFORNECEDOR R, FILIALPESSOA F'+CR_LF+
    'WHERE'+CR_LF+
    '  (F.IDRAMOFORNECEDOR = R.IDRAMOFORNECEDOR)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  R.DESCRAMOFORNECEDOR');
end;

function TCtrlListTerceirosRH.ListInforme: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDINFORME, RTRIM(NOMEINFORME) AS NOMEINFORME'+CR_LF+
    'FROM'+CR_LF+
    '  INFORME');
end;

function TCtrlListTerceirosRH.ListNaturezaOperacao: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  CODNATUREZA, RTRIM(DESCRICAO) AS DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  NATURENDIMENTO');
end;

function TCtrlListTerceirosRH.ListEmpresaProp(IdEmpresa: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  PJ.IDPESSOA, PJ.NOME, PJ.RAZAOSOCIAL'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA PJ, EMPRESAPROP EP'+CR_LF+
    'WHERE'+CR_LF+
    IFF(IdEmpresa>0, '  (EP.IDPESSOA = ' +IntToStr(IdEmpresa)+ ') AND'+CR_LF, '')+
    '  (EP.IDPESSOA = PJ.IDPESSOA)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  UPPER(PJ.NOME)');
end;

function TCtrlListTerceirosRH.ListCCusto(ListaIdEmpresa: string; CodCentroCusto: string;
  IncluirRegistroGenerico, FiltrarSintetico: boolean): OleVariant;
var
  sSQL: string;
begin
  sSQL :=
    IFF(IncluirRegistroGenerico,
      'SELECT'+CR_LF+
      '  ''**********'' AS CODCENTROCUSTO, ''***'' AS CODREDUZIDO,'+CR_LF+
      '  ''N'' AS GRUPO,'+CR_LF+
      '  ''**********'' AS NOME, 0 AS TIPO'+CR_LF+
      'FROM'+CR_LF+
      '  DUAL'+CR_LF+
      'UNION'+CR_LF, '')+
    'SELECT'+CR_LF+
    '  CODCENTROCUSTO, CODREDUZIDO,'+CR_LF+
    '  STATUSGRUPOCDC AS GRUPO,'+CR_LF+
    '  NOME'+IFF(IncluirRegistroGenerico, ', 1 AS TIPO', '')+CR_LF+
    'FROM'+CR_LF+
    '  CENTCUST'+CR_LF+
    'WHERE'+CR_LF;

  // C. de Custo(s) habilitado(s) para o usuário
  if (FUsuXCCusto <> '') then
    sSQL := sSQL + MontaLinhaSelSQL('  (CODCENTROCUSTO',FUsuXCCusto,1) +CR_LF
  else
  if (CodCentroCusto <> '') then
    sSQL := sSQL +
      MontaLinhaSelSQL('  (CODCENTROCUSTO',QuotedListaString(CodCentroCusto,','),1)+CR_LF;

  Result := GetDataPacket(sSQL +CR_LF+
    IFF(Pos(',', ListaIdEmpresa) > 0,
      '  (IDEMPRESA  IN (' +ListaIdEmpresa+ ')) AND',
      '  (IDEMPRESA   = ' +ListaIdEmpresa+ ') AND')+CR_LF+
    IFF(FiltrarSintetico,
      '  (STATUSGRUPOCDC = ''S'') AND'+CR_LF, '')+
    '  (ATIVO       = ''S'')'+CR_LF+
    'ORDER BY'+CR_LF+
    IFF(IncluirRegistroGenerico, '  3, 2', '  NOME'));
end;

function TCtrlListTerceirosRH.ListMarcaraCCustoSintetico(IdEmpresa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  PR.MASCARACC, RTRIM(CC.CODCENTROCUSTO) AS CODCENTROCUSTO, CC.NOME'+CR_LF+
    'FROM'+CR_LF+
    '  CENTCUST CC, PARAMGLOBAL PR'+CR_LF+
    'WHERE'+CR_LF+
    '  (CC.IDEMPRESA      = ' +FloatToStr(IdEmpresa)+ ') AND'+CR_LF+
    '  (CC.STATUSGRUPOCDC = ''S'') AND'+CR_LF+
    '  (CC.IDEMPRESA      = PR.IDPESSOA)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  TO_NUMBER(CC.CODCENTROCUSTO)');
end;

function TCtrlListTerceirosRH.ListCCustoComFuncionarios(IdEmpresa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT DISTINCT'+CR_LF+
    '  RTRIM(CC.CODCENTROCUSTO) AS CODCENTROCUSTO, CC.NOME'+CR_LF+
    'FROM'+CR_LF+
    '  CENTCUST CC, FUNCIONARIO F'+CR_LF+
    'WHERE'+CR_LF+
    '  (CC.IDEMPRESA      = ' +FloatToStr(IdEmpresa)+ ') AND'+CR_LF+
    '  (CC.CODCENTROCUSTO = F.CODCENTROCUSTO)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  CC.NOME');
end;

function TCtrlListTerceirosRH.ListContaContab: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  PLACONTA, PLANOME'+CR_LF+
    'FROM'+CR_LF+
    '  PLANOCONTA'+CR_LF+
    'ORDER BY'+CR_LF+
    '  PLACONTA');
end;

function TCtrlListTerceirosRH.ListSubConta(IdEmpresa: integer; CodSubConta: double;
  NomeSubConta: string): OleVariant;
var
  sSQL: string;
begin
  if (IdEmpresa = -1) then
    sSQL := '  (1 = 2)'
  else
  begin
    if (IdEmpresa > 0) then
      sSQL := sSQL + '  (IDPESSOA     = ' +IntToStr(IdEmpresa)+ ')';

    if (CodSubConta > 0) then
      sSQL := sSQL + IFF(IdEmpresa>0,' AND'+CR_LF,'')+
        '  (CODSUBCONTA = ' +FloatToStr(CodSubConta)+ ')';

    if (NomeSubConta <> '') then
      sSQL := sSQL + IFF((IdEmpresa>0) or (CodSubConta>0),' AND'+CR_LF,'')+
        '  (NOMESUBCONTA  = ' +QuotedStr(NomeSubConta)+ ')';
  end;

  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  CODSUBCONTA, IDPESSOA, NOMESUBCONTA, CODCORRESP'+CR_LF+ // Alterado em 17/03/05 ECF CODCORRESP
    'FROM'+CR_LF+
    '  SUBCONTA'+
    IFF(sSQL='','',CR_LF+'WHERE'+CR_LF+sSQL)+' ORDER BY NOMESUBCONTA');
end;

function TCtrlListTerceirosRH.ListSubContaXConta(const Conta: string;
  const Plano, IdEmpresa: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  SC.CODSUBCONTA, SC.NOMESUBCONTA, SC.CODCORRESP' +CR_LF+
    'FROM' +CR_LF+
    '  CONTASXSUBC CXSC, SUBCONTA SC' +CR_LF+
    'WHERE' +CR_LF+
    '  (CXSC.PLANO           = ' +IntToStr(Plano)+ ') AND' +CR_LF+
    '  (RTRIM(CXSC.PLACONTA) = ' +QuotedStr(Trim(Conta))+ ') AND' +CR_LF+
    '  (CXSC.IDPESSOA        = ' +IntToStr(IdEmpresa)+ ') AND' +CR_LF+
    '  (CXSC.CODSUBCONTA     = SC.CODSUBCONTA) AND' +CR_LF+
    '  (CXSC.IDPESSOA        = SC.IDPESSOA)');
end;

function TCtrlListTerceirosRH.ListParamGlobal(IdEmpresa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  USACRESPON, USAABC, CODCENTRORESPON, MASCCENTRORESPON, UNIDNEGOC, MASCUNIDNEGOC'+CR_LF+
    'FROM'+CR_LF+
    '  PARAMGLOBAL'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDPESSOA = ' +FloatToStr(IdEmpresa)+ ')');
end;

function TCtrlListTerceirosRH.ListContabJurid(CodTipoObjeto: double;
  IndMateria, IndPrincipal: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  C.IDPLANO1, C.IDPLANO2, C.CONTADEBITO, C.CONTACREDITO, C.INDMATERIA, TP.DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  CONTABJURID C, TIPOOBJPROCTRAB TP'+CR_LF+
    'WHERE'+CR_LF+
    '  (C.CODTIPOOBJETO = ' +FloatToStr(CodTipoObjeto)+ ') AND'+CR_LF+
    '  (C.INDMATERIA    = ' +IntToStr(IndMateria)+ ') AND'+CR_LF+
    '  (C.INDPRINCIPAL  = ' +IntToStr(IndPrincipal)+ ') AND'+CR_LF+
    '  (C.CODTIPOOBJETO = TP.CODTIPOOBJETO)');
end;

function TCtrlListTerceirosRH.ListPessoaTerceiro(TipoPessoa: string; IdGrupo: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  P.NOME, T.IDPESSOA'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, TERCEIRO T'+CR_LF+
    'WHERE'+CR_LF+
    '  (T.IDPESSOA = P.IDPESSOA)'+
    IFF(IdGrupo>0, ' AND' +CR_LF+ '  (P.IDGRUPO  = ' +FloatToStr(IdGrupo)+ ')', '')+
    IFF(TipoPessoa<>'', ' AND' +CR_LF+ '  (P.TIPO     = ' +QuotedStr(TipoPessoa)+ ')', '')+CR_LF+
    'ORDER BY'+CR_LF+
    '  P.NOME');
end;

function TCtrlListTerceirosRH.ListEmpresa_e_PessoaTerceiros: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  P.NOME, T.IDPESSOA'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, TERCEIRO T'+CR_LF+
    'WHERE'+CR_LF+
    '  (T.IDPESSOA = P.IDPESSOA)'+CR_LF+
    'UNION'+CR_LF+
    'SELECT'+CR_LF+
    '  NOMEEMPRESA AS NOME, IDPESSOA'+CR_LF+
    'FROM'+CR_LF+
    '  EMPRESAPROP'+CR_LF+
    'ORDER BY'+CR_LF+
    '  1');
end;

function TCtrlListTerceirosRH.ListBancoComMasc: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  B.IDPESSOA, B.NUMBANCO, P.RAZAOSOCIAL,'+CR_LF+
    '  B.MASCARACC, B.MASCARAAGENCIA, B.FLGVALIDACC'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, BANCO B'+CR_LF+
    'WHERE'+CR_LF+
    '  (B.IDPESSOA = P.IDPESSOA)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  P.RAZAOSOCIAL');
end;

function TCtrlListTerceirosRH.ListFeriados(IdCidades,IdPais: integer; UF: string;
  DataIni, DataFin: TDateTime; ListaTipo: string): OleVariant;
var
  sSQL: string;
begin
  if (ListaTipo <> '') then
    if (Pos(',', ListaTipo) > 0) then
      sSQL := '  (FLGTIPO     IN (' +QuotedListaString(ListaTipo,',')+ ')) AND' +CR_LF
    else
      sSQL := '  (FLGTIPO      = ' +QuotedListaString(ListaTipo,',')+ ') AND' +CR_LF;

  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  DATAFERIADO, FLGTIPO'+CR_LF+
    'FROM'+CR_LF+
    '  FERIADOS'+CR_LF+
    'WHERE'+CR_LF+
    sSQL+
    '  (DATAFERIADO >= TO_DATE('+QuotedStr(DateToStr(DataIni))+',''DD/MM/YYYY'')) AND'+CR_LF+
    '  (DATAFERIADO <= TO_DATE('+QuotedStr(DateToStr(DataFin))+',''DD/MM/YYYY'')) AND'+CR_LF+
    '  (IDPAIS       = '+IntToStr(IdPais)+') AND'+CR_LF+
    '  (((FLGAMBITO  = ''M'') AND (IDCIDADES = '+IntToStr(IdCidades)+')) OR'+CR_LF+
    '   ((FLGAMBITO  = ''E'') AND (CODESTADO = '+QuotedStr(UF)+')) OR'+CR_LF+
    '   (FLGAMBITO   = ''F''))'+CR_LF+
    'ORDER BY'+CR_LF+
    '  DATAFERIADO, FLGTIPO');
end;

function TCtrlListTerceirosRH.ListAgenciaBancaria: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  B.NUMBANCO, PB.NOME, A.NUMAGENCIA, A.IDPESSOA, PA.NOME AS AGENCIA'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA PA, PESSOA PB, AGENCIABANCARIA A, BANCO B'+CR_LF+
    'WHERE'+CR_LF+
    '  (B.NUMBANCO = ''104'') AND'+CR_LF+ // CAIXA ECONOMICA FEDERAL
    '  (B.IDPESSOA = A.IDBANCO) AND'+CR_LF+
    '  (A.IDPESSOA = PA.IDPESSOA) AND'+CR_LF+
    '  (B.IDPESSOA = PB.IDPESSOA)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  B.NUMBANCO, A.NUMAGENCIA');
end;

function TCtrlListTerceirosRH.ListIdAgencia_e_NumBanco(IdAgencia: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDBANCO, NUMAGENCIA'+CR_LF+
    'FROM'+CR_LF+
    '  AGENCIABANCARIA'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDPESSOA = ' +FloatToStr(IdAgencia)+ ')');
end;

function TCtrlListTerceirosRH.ListImagemPessoa(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IMG.IMAGEM'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, IMAGENS IMG'+CR_LF+
    'WHERE'+CR_LF+
    '  (P.IDPESSOA = '+FloatToStr(IdPessoa)+') AND'+CR_LF+
    '  (P.IDIMAGEM = IMG.IDIMAGEM)');
end;

function TCtrlListTerceirosRH.ListImagem(IdImagem: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IMAGEM'+CR_LF+
    'FROM'+CR_LF+
    '  IMAGENS'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDIMAGEM = ' +FloatToStr(IdImagem)+ ')');
end;

function TCtrlListTerceirosRH.ListContatoPessoaJuridica(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  C.IDCONTATO, C.NOME'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA PJ, ENDPESS E, CONTATOPESS C'+CR_LF+
    'WHERE'+CR_LF+
    '  (PJ.IDPESSOA       = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND'+CR_LF+
    '  (PJ.IDPESSOA       = E.IDPESSOA) AND'+CR_LF+
    '  (C.FLGBLOQUEADO    = ''N'') AND'+CR_LF+
    '  (E.IDENDERECO      = C.IDENDERECO)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  C.NOME');
end;

function TCtrlListTerceirosRH.ListFaixaNivel(IdFaixaSalarial: double; IdEmpresa: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  DATAEFETIVACAO, MOD(IDNIVEL,100) AS IDFAIXASALEXT, VALOR'+CR_LF+
    'FROM'+CR_LF+
    '  FAIXANIVEL'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDNIVEL BETWEEN ' +FloatToStr(IdFaixaSalarial)+
    ' * 100 + 1 AND ' +FloatToStr(IdFaixaSalarial)+ ' * 100 + 9) AND'+CR_LF+
    '  (IDPESSJUR = ' +FloatToStr(IdEmpresa)+ ')'+CR_LF+
    'ORDER BY'+CR_LF+
    '  DATAEFETIVACAO DESC, IDNIVEL');
end;

function TCtrlListTerceirosRH.ListCamposCM(GrupoArquivo: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  G.CODGRUPOARQUIVO, C.IDCAMPO, C.NOMEDOCAMPO,'+CR_LF+
    '  C.DESCRICAODOCAMPO, G.DESCGRUPOARQUIVO'+CR_LF+
    'FROM'+CR_LF+
    '  CMPBD C, CMPBDGRP CG, GRPARQUIVO G'+CR_LF+
    'WHERE'+CR_LF+
    IFF(GrupoArquivo <> '',
      '  (G.CODGRUPOARQUIVO = ' +QuotedStr(GrupoArquivo)+ ') AND'+CR_LF,
      '')+
    '  (C.CAMPODOBANCO   >= 1) AND'+CR_LF+
    '  (G.CODGRUPOARQUIVO = CG.CODGRUPOARQUIVO) AND'+CR_LF+
    '  (C.IDCAMPO         = CG.IDCAMPO(+))'+CR_LF+
    'ORDER BY'+CR_LF+
    '  CG.CODGRUPOARQUIVO, C.DESCRICAODOCAMPO');
end;

function TCtrlListTerceirosRH.ListTabela_Generica_E_Longa(NomeTabela: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  C.CODTABELA AS CODGRUPOFORMULA,'+CR_LF+
    '  C.CODCAMPO AS IDFORMULA,'+CR_LF+
    '  C.DESCRICAO AS DESCRICAOFORMULA,'+CR_LF+
    '  ' +QuotedStr(('(Genérica) '))+ ' || RTRIM(T.DESCRICAO) AS DESCGRUPOFORMULA'+CR_LF+
    'FROM'+CR_LF+
    '  TABGENER T, CAMPOTABGENER C'+CR_LF+
    'WHERE'+CR_LF+
    IFF(NomeTabela <> '',
      '  (T.CODTABELA = ' +QuotedStr(NomeTabela)+ ') AND'+CR_LF,
      '')+
    '  (T.CODTABELA = C.CODTABELA) AND'+CR_LF+
    '  ((T.IDMODULO = ' +IntToStr(MODFOL)+ ') OR (T.IDMODULO IS NULL))'+CR_LF+
    'UNION'+CR_LF+
    'SELECT'+CR_LF+
    '  T.DESCRICAO AS CODGRUPOFORMULA,'+CR_LF+
    '  C.DESCRICAO AS IDFORMULA,'+CR_LF+
    '  C.DESCRICAO AS DESCRICAOFORMULA,'+CR_LF+
    '  ' +QuotedStr(('(Longa)    '))+ ' || RTRIM(T.DESCRICAO) AS DESCGRUPOFORMULA'+CR_LF+
    'FROM'+CR_LF+
    '  LONGTABGENER T, LONGCMPTABGENER C'+CR_LF+
    'WHERE'+CR_LF+
    IFF(NomeTabela <> '',
      '  (T.DESCRICAO = ' +QuotedStr(NomeTabela)+ ') AND'+CR_LF,
      '')+
    '  (T.IDTABELA  = C.IDTABELA)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  DESCGRUPOFORMULA, DESCRICAOFORMULA');
end;

function TCtrlListTerceirosRH.ListRegras: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDREGRA, RTRIM(NOMEREGRA) AS NOMEREGRA'+CR_LF+
    'FROM'+CR_LF+
    '  REGRA'+CR_LF+
    'ORDER BY'+CR_LF+
    '  NOMEREGRA');
end;

function TCtrlListTerceirosRH.ListGrupoRegra: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDTIPOREGRA, DESCREGRA'+CR_LF+
    'FROM'+CR_LF+
    '  TIPOREGRA'+CR_LF+
    'ORDER BY'+CR_LF+
    '  DESCREGRA');
end;

function TCtrlListTerceirosRH.ListRegraXGrupo(IdRegra: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  R.IDREGRA, R.NOMEREGRA, R.IDTIPOREGRA, T.SQLREGRA, T.DESCREGRA'+CR_LF+
    'FROM'+CR_LF+
    '  REGRA R, TIPOREGRA T'+CR_LF+
    'WHERE'+CR_LF+
    '  (R.IDREGRA     = ' +FloatToStr(IdRegra)+ ') AND'+CR_LF+
    '  (R.IDTIPOREGRA = T.IDTIPOREGRA)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  T.DESCREGRA');
end;

function TCtrlListTerceirosRH.ListPessoaPorTipo(Tipo: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDPESSOA, NOME'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA'+CR_LF+
    'WHERE'+CR_LF+
    '  (TIPO = ' +QuotedStr(Tipo)+ ')'+CR_LF+
    'ORDER BY'+CR_LF+
    '  NOME');
end;

function TCtrlListTerceirosRH.ListEmpresaForn(IdEmpresa: integer; IdFornecedor: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  CONTACDESPESA, CONTACFORN, PLANO, CODSUBCONTA'+CR_LF+
    'FROM'+CR_LF+
    '  EMPRESAFORN'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDFORCLI = ' +FloatToStr(IdFornecedor)+ ') AND'+CR_LF+
    '  (IDPESSOA = ' +IntToStr(IdEmpresa)+ ')');
end;

function TCtrlListTerceirosRH.ListDocumentoEmBranco: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  0 AS CODDOCUMENTO, 0 AS PLANO, ''123456789012345678'' AS PLACONTA, 0 AS PLNCODIGO,'+CR_LF+
    '  0 AS NUMLANCTO, 0 AS UNIDNEGOC, ''1234567890'' AS CODCENTRORESPON, 0 AS VALOR,'+CR_LF+
    '  ''123456789012345'' AS CODTIPRECDES, 0 AS CODPORTFORMA, ''C'' AS DEBCRE,'+CR_LF+
    '  1 AS PORTFORMAPARTICIP, ''1234567890'' AS CODCENTROCUSTO'+CR_LF+
    'FROM'+CR_LF+
    '  DUAL'+CR_LF+
    'WHERE'+CR_LF+
    '  (1 = 2)');
end;

function TCtrlListTerceirosRH.ListEndereco(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  EP.LOGRADOURO, EP.NUMERO, EP.COMPLEMENTO,'+CR_LF+
    '  EP.BAIRRO, CI.NOME AS CIDADE, EP.CODESTADO, EP.CEP'+CR_LF+
    'FROM'+CR_LF+
    '  ENDPESS EP, CIDADES CI'+CR_LF+
    'WHERE'+CR_LF+
    '  (EP.IDPESSOA  = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (EP.IDCIDADES = CI.IDCIDADES(+))');
end;

function TCtrlListTerceirosRH.ListTipoDadoTabGener: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDTIPODADO, NOMETIPODADO'+CR_LF+
    'FROM'+CR_LF+
    '  TIPODADO');
end;

function TCtrlListTerceirosRH.ListPatrocinadora: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  PA.IDPESSOA, P.NOME' +CR_LF+
    'FROM' +CR_LF+
    '  PESSOA P, PATRO PA' +CR_LF+
    'WHERE' +CR_LF+
    '  (PA.IDPESSOA = P.IDPESSOA)' +CR_LF+
    'ORDER BY' +CR_LF+
    '  P.NOME');
end;

function TCtrlListTerceirosRH.ListPlanoPrev: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  IDPLANOPREV, NOME' +CR_LF+
    'FROM' +CR_LF+
    '  PLANPREV' +CR_LF+
    'ORDER BY' +CR_LF+
    '  NOME');
end;

function TCtrlListTerceirosRH.ListCargoEx: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  IDCARGOEXT, TITULO' +CR_LF+
    'FROM' +CR_LF+
    '  CARGOEXT' +CR_LF+
    'ORDER BY' +CR_LF+
    '  TITULO');
end;

function TCtrlListTerceirosRH.ListImovel: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT *' +CR_LF+
    //'  IDIMOVEL, IMONOME, FLGSTATUS' +CR_LF+
    'FROM' +CR_LF+
    '  IMOVEL' +CR_LF+
    'WHERE FLGATIVO = 1' +CR_LF+
    'ORDER BY' +CR_LF+
    '  UPPER(IMONOME)');
end;

function TCtrlListTerceirosRH.ListHistoricoPadrao(IdEmpresa: double; CodHist: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  HITCODHIST, HITDESCR1' +CR_LF+
    'FROM' +CR_LF+
    '  HISTOPADRAO' +CR_LF+
    'WHERE' +CR_LF+
    IFF(CodHist='', '',
      '  (HITCODHIST = ' +QuotedStr(CodHist)+ ') AND' +CR_LF)+
    '  (IDPESSOA   = ' +FloatToStr(IdEmpresa)+ ')' +CR_LF+
    'ORDER BY' +CR_LF+
    '  HITDESCR1');
end;

function TCtrlListTerceirosRH.ValorImovel(IdImovel: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT SUM(IMOVLRMERCADO) AS VLRMERCADO,' +CR_LF+
    '       MAX(IMODATAMERCADO) AS DATAMERCADO,' +CR_LF+
    '       IDIMOVELMESTRE AS IDIMOVEL' +CR_LF+
    'FROM IMOVEL' +CR_LF+
    'WHERE' +CR_LF+
    IFF(IdImovel = 0, '','       IDIMOVELMESTRE = '+FloatToStr(IdImovel)+' AND'+CR_LF)+
    '       IDIMOVELMESTRE IS NOT NULL' +CR_LF+
    'GROUP BY IDIMOVELMESTRE' +CR_LF+
    'UNION' +CR_LF+
    'SELECT IMOVLRMERCADO AS VLRMERCADO,' +CR_LF+
    '       IMODATAMERCADO AS DATAMERCADO,' +CR_LF+
    '       IDIMOVEL' +CR_LF+
    'FROM IMOVEL' +CR_LF+
    'WHERE' +CR_LF+
    IFF(IdImovel = 0, '','       IDIMOVEL = '+FloatToStr(IdImovel)+' AND'+CR_LF)+
    '       IDIMOVEL NOT IN (SELECT DISTINCT IDIMOVELMESTRE' +CR_LF+
    '                        FROM IMOVEL' +CR_LF+
    '                        WHERE IDIMOVELMESTRE IS NOT NULL)' +CR_LF+
    'ORDER BY 3');
end;

function TCtrlListTerceirosRH.ValorPenhorado(Id: double; Tipo: integer): double;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  _CdsAux.Data := GetDataPacket(
    'SELECT SUM(VALORREC) AS VALORPENHORADO' +CR_LF+
    'FROM ETAPAPROCTRAB' +CR_LF+
    'WHERE' +CR_LF+
    IFF(Tipo = 1, '  IDIMOVEL = ',IFF(Tipo = 2, '  IDBEM = ',IFF(Tipo = 3, '  IDCONJUNTO = ',
    '  IDINVESTIMENTO = ')))+FloatToStr(Id));

  Result := _CdsAux.FieldByName('VALORPENHORADO').asFloat;

  _CdsAux.Free;
end;

procedure TCtrlListTerceirosRH.ValorContabil(Id: double; IdEmpresa, Tipo: integer;
  var Valor: double; var DataContabil: string);
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  if (Tipo = 1) then  // Bem
    _CdsAux.Data := GetDataPacket(
      'SELECT' +CR_LF+
      '  B.DATAULTDEP AS DATACONTABIL,' +CR_LF+
      '  (SB.VALORG + SB.CMBEM - SB.DEPLANC - SB.CMDEP +' +CR_LF+
      '     SB.REAVVALORG + SB.REAVCMBEM - SB.REAVDEPLANC - SB.REAVCMDEP +' +CR_LF+
      '     SB.ULTREAVVALORG + SB.ULTREAVCMBEM - SB.ULTREAVDEPLANC - SB.ULTREAVCMDEP' +CR_LF+
      '   ) AS VALORCONTABIL' +CR_LF+
      'FROM' +CR_LF+
      '  (SELECT' +CR_LF+
      '     SCB.IDBEM, SCB.IDPESSOA, SCB.DATASLDBEM,' +CR_LF+
      '     SCB.VALORG, SCB.REAVVALORG, SCB.ULTREAVVALORG,' +CR_LF+
      '     SCB.CMBEM, SCB.REAVCMBEM, SCB.ULTREAVCMBEM,' +CR_LF+
      '     SCB.DEPLANC, SCB.REAVDEPLANC, SCB.ULTREAVDEPLANC,' +CR_LF+
      '     SCB.CMDEP, SCB.REAVCMDEP, SCB.ULTREAVCMDEP' +CR_LF+
      '   FROM' +CR_LF+
      '     SALDOCONTABBEM SCB,' +CR_LF+
      '     (SELECT IDBEM, IDPESSOA, MAX(DATASLDBEM) AS DATA' +CR_LF+
      '      FROM   SALDOCONTABBEM' +CR_LF+
      '      WHERE  (IDBEM       = '+FloatToStr(Id)+') AND' +CR_LF+
      '             (DATASLDBEM <= SYSDATE+1) AND' +CR_LF+
      '             (IDPESSOA    = ' +IntToStr(IdEmpresa)+ ')' +CR_LF+
      '      GROUP BY IDBEM, IDPESSOA) ULTDTA'+CR_LF+
      '   WHERE' +CR_LF+
      '     (SCB.IDBEM      = ' +FloatToStr(Id)+ ') AND' +CR_LF+
      '     (SCB.IDPESSOA   = ' +IntToStr(IdEmpresa)+ ') AND' +CR_LF+
      '     (SCB.IDBEM      = ULTDTA.IDBEM) AND' +CR_LF+
      '     (SCB.DATASLDBEM = ULTDTA.DATA) AND' +CR_LF+
      '     (SCB.IDPESSOA   = ULTDTA.IDPESSOA)) SB,' +CR_LF+
      '  BEM B' +CR_LF+
      'WHERE' +CR_LF+
      '  (B.IDBEM     = ' +FloatToStr(Id)+ ') AND' +CR_LF+
      '  (B.IDPESSOA  = ' +IntToStr(IdEmpresa)+ ') AND' +CR_LF+
      '  (SB.IDBEM    = B.IDBEM) AND' +CR_LF+
      '  (SB.IDPESSOA = B.IDPESSOA)')
  else  // Conjunto
    _CdsAux.Data := GetDataPacket(
      'SELECT' +CR_LF+
      '  C.IDCONJUNTO, MAX(B.DATAULTDEP) AS DATACONTABIL,' +CR_LF+
      '  ROUND(SUM(SB.VALORG + SB.CMBEM - SB.DEPLANC - SB.CMDEP +' +CR_LF+
      '    SB.REAVVALORG + SB.REAVCMBEM - SB.REAVDEPLANC - SB.REAVCMDEP +' +CR_LF+
      '    SB.ULTREAVVALORG + SB.ULTREAVCMBEM -' +CR_LF+
      '    SB.ULTREAVDEPLANC - SB.ULTREAVCMDEP) ,2) AS VALORCONTABIL' +CR_LF+
      'FROM' +CR_LF+
      '  (SELECT' +CR_LF+
      '     SCB.IDBEM, SCB.IDPESSOA, SCB.DATASLDBEM,' +CR_LF+
      '     SCB.VALORG, SCB.REAVVALORG, SCB.ULTREAVVALORG,' +CR_LF+
      '     SCB.CMBEM, SCB.REAVCMBEM, SCB.ULTREAVCMBEM,'+CR_LF+
      '     SCB.DEPLANC, SCB.REAVDEPLANC, SCB.ULTREAVDEPLANC,' +CR_LF+
      '     SCB.CMDEP, SCB.REAVCMDEP, SCB.ULTREAVCMDEP' +CR_LF+
      '   FROM' +CR_LF+
      '     SALDOCONTABBEM SCB,' +CR_LF+
      '     (SELECT IDBEM, IDPESSOA, MAX(DATASLDBEM) AS DATA' +CR_LF+
      '      FROM   SALDOCONTABBEM' +CR_LF+
      '      WHERE  (DATASLDBEM <= SYSDATE+1) AND' +CR_LF+
      '             (IDPESSOA    = ' +IntToStr(IdEmpresa)+ ')' +CR_LF+
      '      GROUP BY IDBEM, IDPESSOA) ULTDTA'+CR_LF+
      '   WHERE' +CR_LF+
      '     (SCB.IDPESSOA   = ' +IntToStr(IdEmpresa)+ ') AND' +CR_LF+
      '     (SCB.IDBEM      = ULTDTA.IDBEM) AND' +CR_LF+
      '     (SCB.DATASLDBEM = ULTDTA.DATA) AND' +CR_LF+
      '     (SCB.IDPESSOA   = ULTDTA.IDPESSOA)) SB,' +CR_LF+
      '  BEM B, CONJUNTO C' +CR_LF+
      'WHERE' +CR_LF+
      '  (B.IDCONJUNTO = ' +FloatToStr(Id)+ ') AND' +CR_LF+
      '  (B.IDPESSOA   = ' +IntToStr(IdEmpresa)+ ') AND' +CR_LF+
      '  (B.IDCONJUNTO = C.IDCONJUNTO) AND' +CR_LF+
      '  (B.IDPESSOA   = C.IDPESSOA) AND' +CR_LF+
      '  (B.IDBEM      = SB.IDBEM) AND' +CR_LF+
      '  (B.IDPESSOA   = SB.IDPESSOA)' +CR_LF+
      'GROUP BY' +CR_LF+
      '  C.IDCONJUNTO');

  Valor := _CdsAux.FieldByName('VALORCONTABIL').asFloat;
  DataContabil := _CdsAux.FieldByName('DATACONTABIL').asString;

  _CdsAux.Free;
end;

function TCtrlListTerceirosRH.ListEventoImovelVazio: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  IDIMOVEL, IDEVENTOIMOVEL, EVIDATA, EVIDESCRICAO, FLGTIPOEVENTO, EVIPERCENT,' +CR_LF+
    '  EVIVLRAJUSTADO, EVICABECALHO' +CR_LF+
    'FROM' +CR_LF+
    '  EVENTOIMOVEL' +CR_LF+
    'WHERE (2 = 1)');
end;

function TCtrlListTerceirosRH.ListInvestimento: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  IDINVESTIMENTO, DESCINVESTIMENTO' +CR_LF+
    'FROM' +CR_LF+
    '  INVESTIMENTO' +CR_LF+
    'ORDER BY' +CR_LF+
    '  UPPER(DESCINVESTIMENTO)');
end;

function TCtrlListTerceirosRH.ListAtividadeProjeto(const IdEmpresa: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  UNIDNEGOC, NOME, UNETIPO, UNECODIGO' +CR_LF+
    'FROM' +CR_LF+
    '  UNIDNEGOCIO' +CR_LF+
    'WHERE' +CR_LF+
    '  (IDPESSOA = ' +IntToStr(IdEmpresa)+ ')' +CR_LF+
    'ORDER BY' +CR_LF+
    '  UNECODIGO');
end;

function TCtrlListTerceirosRH.RegraEmUso(IdRegra: double): boolean;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  _CdsAux.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  COUNT(*) AS NUM'+CR_LF+
    'FROM'+CR_LF+
    '  PROVDESC'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDREGRA         = ' +FloatToStr(IdRegra)+ ') OR'+CR_LF+
    '  (IDREGRA13       = ' +FloatToStr(IdRegra)+ ') OR'+CR_LF+
    '  (IDREGRAFERIAS   = ' +FloatToStr(IdRegra)+ ') OR'+CR_LF+
    '  (IDREGRARESCISAO = ' +FloatToStr(IdRegra)+ ')');

  Result := (_CdsAux.FieldByName('NUM').asFloat > 0);

  _CdsAux.Free;
end;

function TCtrlListTerceirosRH.GetMascaraPlano(IdPlano: integer): string;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  _CdsAux.Data := GetDataPacket('SELECT MASCARA FROM PLANO WHERE (PLANO = ' +
    IntToStr(IdPlano)+ ')');

  Result := _CdsAux.FieldByName('MASCARA').asString;

  _CdsAux.Free;
end;

function TCtrlListTerceirosRH.GetPlano(IdEmpresa: double): integer;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  _CdsAux.Data := GetDataPacket('SELECT PLANO FROM PARAMCONTAB WHERE (IDPESSOA = ' +
    FloatToStr(IdEmpresa)+ ')');

  Result := _CdsAux.FieldByName('PLANO').asInteger;

  _CdsAux.Free;
end;

function TCtrlListTerceirosRH.GetIdPlanoOrcamentario(IdEmpresa: double): double;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  _CdsAux.Data := GetDataPacket(
    'SELECT'+CR_LF+
    ' IDPLANOORCAMEN'+CR_LF+
    'FROM'+CR_LF+
    '  PARAMORCAMENTO'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDPESSOA = ' +FloatToStr(IdEmpresa)+ ')');

  Result := _CdsAux.FieldByName('IDPLANOORCAMEN').asFloat;

  _CdsAux.Free;
end;

function TCtrlListTerceirosRH.GetIdContraCheque: integer;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  _CdsAux.Data := GetDataPacket('SELECT IDCONTRACHEQUE FROM PARAMAPREV');
  Result := _CdsAux.FieldByName('IDCONTRACHEQUE').asInteger;

  if (Result = 0) then
    Result := 99; // Parãmetro Padrão

  _CdsAux.Free;
end;

function TCtrlListTerceirosRH.GetIdPatro(IdEmpresa: double): integer;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  _CdsAux.Data := GetDataPacket('SELECT IDPATRO FROM PARAMGLOBAL');
  Result := _CdsAux.FieldByName('IDPATRO').asInteger;

  _CdsAux.Free;
end;

function TCtrlListTerceirosRH.GetIdPlanoPrev(IdEmpresa: double): integer;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  _CdsAux.Data := GetDataPacket('SELECT IDPLANOPREV FROM PARAMGLOBAL');
  Result := _CdsAux.FieldByName('IDPLANOPREV').asInteger;

  _CdsAux.Free;
end;

function TCtrlListTerceirosRH.GetNumeroPlanilha(PlnCodigo: double): double;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  _CdsAux.Data := GetDataPacket(
    'SELECT' +CR_LF+
    '  PLNPLANIL' +CR_LF+
    'FROM' +CR_LF+
    '  PLANILHA' +CR_LF+
    'WHERE' +CR_LF+
    '  (PLNCODIGO = ' +FloatToStr(PlnCodigo)+ ')');

  Result := _CdsAux.FieldByName('PLNPLANIL').asFloat;

  _CdsAux.Free;
end;

function TCtrlListTerceirosRH.GetContaBancariaFavorecido(IdFavorecido: double): integer;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  _CdsAux.Data := GetDataPacket(
    'SELECT' +CR_LF+
    '  IDCBANCARIA' +CR_LF+
    'FROM' +CR_LF+
    '  CONTABANCARIA'+CR_LF+
    'WHERE' +CR_LF+
    '  (IDPESSOA     = ' +FloatToStr(IdFavorecido)+ ') AND'+CR_LF+
    '  (FLGCONTAPREF = 1)');
  Result := _CdsAux.FieldByName('IDCBANCARIA').asInteger;

  _CdsAux.Free;
end;

function TCtrlListTerceirosRH.GetIdProgramaCCusto(CodCentroCusto: string;
  IdEmpresa: integer): integer;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  _CdsAux.Data := GetDataPacket(
    'SELECT IDPROGRAMA' +CR_LF+
    'FROM   CENTCUST' +CR_LF+
    'WHERE' +CR_LF+
    '  (CODCENTROCUSTO = ' +QuotedStr(CodCentroCusto)+ ') AND' +CR_LF+
    '  (IDEMPRESA      = ' +IntToStr(IdEmpresa)+ ') AND' +CR_LF+
    '  (IDPROGRAMA    IS NOT NULL) AND' +CR_LF+
    '  (IDPROGRAMA     > 0)');
  Result := _CdsAux.FieldByName('IDPROGRAMA').asInteger;

  _CdsAux.Free;
end;

function TCtrlListTerceirosRH.GetIdTipoProcesso(IdEmpresa: integer; IdUsuario: double;
  IdReferencia: integer): integer;
var
  _CdsAux: TCMClientDataSet;
  bUsaEmpresa: boolean;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  _CdsAux.Data := GetDataPacket(
    'SELECT FLGFILTRAREMPRESA FROM PARAMRAD WHERE (IDPESSOA = ' +IntToStr(IdEmpresa)+ ')');
  bUsaEmpresa := (_CdsAux.FieldByName('FLGFILTRAREMPRESA').asString = 'S');

  _CdsAux.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  TP.IDTIPOPROCESSO'+CR_LF+
    'FROM'+CR_LF+
    '  RADTIPOPROCESSO TP, RADRESPONXGRP GR'+CR_LF+
    'WHERE'+CR_LF+
    IFF(bUsaEmpresa, '  (TP.IDPESSOA          = ' +IntToStr(IdEmpresa)+ ') AND' +CR_LF, '')+
    '  (TP.IDREFERENCIA      = ' +IntToStr(IdReferencia)+ ') AND' +CR_LF+
    '  (GR.IDUSUARIO         = ' +FloatToStr(IdUsuario)+ ') AND' +CR_LF+
    '  (TP.IDGRPCRIAPROCESSO = GR.IDGRPRESPON)');

  Result := _CdsAux.FieldByName('IDTIPOPROCESSO').asInteger;

  _CdsAux.Free;
end;

function TCtrlListTerceirosRH.GetFlgOk_RAD(IdProcesso: double): string;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  _CdsAux.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  FLGOK'+CR_LF+
    'FROM'+CR_LF+
    '  RADINSTPROCESSO'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDPROCESSO = ' +FloatToStr(IdProcesso)+ ')');
  Result := _CdsAux.FieldByName('FLGOK').asString;

  _CdsAux.Free;
end;

function TCtrlListTerceirosRH.GetOpcaoTicket(Matricula: string): string;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  _CdsAux.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  DECODE(VT_OPC.VALOR,''AUXREST'',' +QuotedStr(('Refeição'))+ ',' +QuotedStr(('Alimentação'))+ ') OPCAO_TICKETS'+CR_LF+
    'FROM'+CR_LF+
    '  VALTABGENER VT_OPC, VALTABGENER VT_MAT'+CR_LF+
    'WHERE'+CR_LF+
    '  (VT_MAT.CODTABELA = ''OPCAOALIMENT'') AND'+CR_LF+
    '  (VT_OPC.CODTABELA = ''OPCAOALIMENT'') AND'+CR_LF+
    '  (VT_MAT.CODCAMPO  = ''MATRICULA'') AND'+CR_LF+
    '  (VT_OPC.CODCAMPO  = ''OPCAO'') AND'+CR_LF+
    '  (VT_MAT.VALOR     = ' +QuotedStr(Matricula)+ ') AND'+CR_LF+
    '  (VT_MAT.NUMLINHA  = VT_OPC.NUMLINHA)');

  Result := _CdsAux.FieldByName('OPCAO_TICKETS').asString;

  _CdsAux.Free;
end;

procedure TCtrlListTerceirosRH.GetPercREB_DataAssoc(Matricula: string; var PercREB,
  DataAssoc: string);
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  _CdsAux.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  VT_PERC.VALOR PERCENTUAL,'+CR_LF+
    '  VT_DATA.VALOR DATASSOC'+CR_LF+
    'FROM'+CR_LF+
    '  VALTABGENER VT_PERC, VALTABGENER VT_DATA, VALTABGENER VT_MATR'+CR_LF+
    'WHERE'+CR_LF+
    '  (VT_PERC.CODTABELA = ''PERCEMPREB'') AND'+CR_LF+
    '  (VT_DATA.CODTABELA = ''PERCEMPREB'') AND'+CR_LF+
    '  (VT_MATR.CODTABELA = ''PERCEMPREB'') AND'+CR_LF+
    '  (VT_PERC.CODCAMPO  = ''PERCENTUAL'') AND'+CR_LF+
    '  (VT_DATA.CODCAMPO  = ''DATASSOC'') AND'+CR_LF+
    '  (VT_MATR.CODCAMPO  = ''MATRICULA'') AND'+CR_LF+
    '  (VT_MATR.VALOR     = ' +QuotedStr(Matricula)+ ') AND'+CR_LF+
    '  (VT_MATR.NUMLINHA  = VT_PERC.NUMLINHA) AND'+CR_LF+
    '  (VT_MATR.NUMLINHA  = VT_DATA.NUMLINHA)');

  PercREB := _CdsAux.FieldByName('PERCENTUAL').asString;
  DataAssoc := _CdsAux.FieldByName('DATASSOC').asString;

  _CdsAux.Free;
end;

function TCtrlListTerceirosRH.GetIdAgenciaBancaria(NumAgencia: string): double;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  _CdsAux.Data := GetDataPacket(
    'SELECT IDPESSOA'+CR_LF+
    'FROM   AGENCIABANCARIA'+CR_LF+
    'WHERE  (NUMAGENCIA = ' +QuotedStr(Trim(NumAgencia))+ ')');

  Result := _CdsAux.FieldByName('IDPESSOA').asFloat;

  _CdsAux.Free;
end;

function TCtrlListTerceirosRH.GetNumProprietarios(IdEmpresa: double): integer;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  _CdsAux.Data := GetDataPacket(
    'SELECT NVL(COUNT(IDPESSOA),0) AS NUMPROP'+CR_LF+
    'FROM   FUNCIONARIO'+CR_LF+
    'WHERE (TIPOCONTRATO = ''P'') AND'+CR_LF+
    '      (IDEMPRESA    = ' +FloatToStr(IdEmpresa)+ ')');

  Result := _CdsAux.FieldByName('NUMPROP').asInteger;

  _CdsAux.Free;
end;

function TCtrlListTerceirosRH.GetPessoa_Documento(NumDocumento: string; IdDocumento: double): double;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  _CdsAux.Data := GetDataPacket(
    'SELECT IDPESSOA'+CR_LF+
    'FROM   DOCPESSOA'+CR_LF+
    'WHERE  (NUMDOCUMENTO = ' +QuotedStr(Trim(NumDocumento))+ ') AND'+CR_LF+
    '       (IDDOCUMENTO  = ' +FloatToStr(IdDocumento)+ ')');

  Result := _CdsAux.FieldByName('IDPESSOA').asFloat;

  _CdsAux.Free;
end;

function TCtrlListTerceirosRH.GetNumPlanilha(PlnCodigo: double): double;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  _CdsAux.Data := GetDataPacket(
    'SELECT PLNPLANIL'+CR_LF+
    'FROM   PLANILHA'+CR_LF+
    'WHERE  (PLNCODIGO = ' +FloatToStr(PlnCodigo)+ ')');

  Result := _CdsAux.FieldByName('PLNPLANIL').asFloat;

  _CdsAux.Free;
end;

function TCtrlListTerceirosRH.GetNomePessoa(IdPessoa: double): string;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  _CdsAux.Data := GetDataPacket(
    'SELECT NOME'+CR_LF+
    'FROM   PESSOA'+CR_LF+
    'WHERE (IDPESSOA = ' +FloatToStr(IdPessoa)+ ')');

  Result := _CdsAux.FieldByName('NOME').asString;

  _CdsAux.Free;
end;

function TCtrlListTerceirosRH.GetNomeAtividadeProjeto(UnidNegoc: integer): string;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  _CdsAux.Data := GetDataPacket('SELECT NOME FROM UNIDNEGOCIO WHERE (UNIDNEGOC = ' +
    IntToStr(UnidNegoc)+ ')');

  Result := _CdsAux.FieldByName('NOME').asString;

  _CdsAux.Free;
end;

function TCtrlListTerceirosRH.GetSistemaAtivo(IdModulo: integer): boolean;
begin
  with TCMClientDataSet.Create(nil) do
  try
    Data := GetDataPacket(
      'SELECT' +CR_LF+
      '  NOMEMODULO' +CR_LF+
      'FROM' +CR_LF+
      '  MODULO' +CR_LF+
      'WHERE' +CR_LF+
      '  (IDMODULO = ' +IntToStr(IdModulo)+ ')');
    Result := not(IsEmpty);
  finally
    Free;
  end;
end;

function TCtrlListTerceirosRH.ObrigaSubConta(const Conta: string;
  const Plano: integer): boolean;
var
  _CdsConta: TCMClientDataSet;
begin
  _CdsConta := TCMClientDataSet.Create(nil);
  try
    try
      _CdsConta.Data := GetDataPacket(
        'SELECT' +CR_LF+
        '  PLASUBCONTA' +CR_LF+
        'FROM' +CR_LF+
        '  PLANOCONTA' +CR_LF+
        'WHERE' +CR_LF+
        '  (PLANO           = ' +IntToStr(Plano)+ ') AND' +CR_LF+
        '  (RTRIM(PLACONTA) = ' +QuotedStr(Trim(Conta))+ ')');

      Result := (_CdsConta.FieldByName('PLASUBCONTA').asString = 'S');
    finally
      _CdsConta.Free;
    end;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlListTerceirosRH.IsSubContaValida(const Conta: string;
  const Plano, IdEmpresa, SubConta: integer): boolean;
var
  _CdsSubConta: TCMClientDataSet;
begin
  Result := true;
  _CdsSubConta := TCMClientDataSet.Create(nil);
  try
    if (ObrigaSubConta(Conta, Plano)) then
    begin
      _CdsSubConta.Data := GetDataPacket(
        'SELECT' +CR_LF+
        '  CODSUBCONTA' +CR_LF+
        'FROM' +CR_LF+
        '  CONTASXSUBC' +CR_LF+
        'WHERE' +CR_LF+
        '  (PLANO           = ' +IntToStr(Plano)+ ') AND' +CR_LF+
        '  (RTRIM(PLACONTA) = ' +QuotedStr(Trim(Conta))+ ') AND' +CR_LF+
        '  (CODSUBCONTA     = ' +IntToStr(SubConta)+ ') AND' +CR_LF+
        '  (IDPESSOA        = ' +IntToStr(IdEmpresa)+ ')');

      Result := not(_CdsSubConta.IsEmpty);
    end;
  finally
    _CdsSubConta.Free;
  end;
end;

function TCtrlListTerceirosRH.IsCCustoValido(const Conta: string;
  const Plano, IdEmpresa: integer; const CCusto: string): boolean;
var
  _CdsConta: TCMClientDataSet;
  _CdsCCusto: TCMClientDataSet;
begin
  Result := true;
  _CdsConta := TCMClientDataSet.Create(nil);
  _CdsCCusto := TCMClientDataSet.Create(nil);
  try
    _CdsConta.Data := GetDataPacket(
      'SELECT' +CR_LF+
      '  PLACCUST' +CR_LF+
      'FROM' +CR_LF+
      '  PLANOCONTA' +CR_LF+
      'WHERE' +CR_LF+
      '  (PLANO           = ' +IntToStr(Plano)+ ') AND' +CR_LF+
      '  (RTRIM(PLACONTA) = ' +QuotedStr(Trim(Conta))+ ')');

    if (_CdsConta.FieldByName('PLACCUST').asString = 'S') then
    begin
      _CdsCCusto.Data := GetDataPacket(
        'SELECT' +CR_LF+
        '  CODCENTROCUSTO, IDEMPRESA' +CR_LF+
        'FROM' +CR_LF+
        '  CONTASXCC'+CR_LF+
        'WHERE'+CR_LF+
        '  (PLANO           = ' +IntToStr(Plano)+ ') AND' +CR_LF+
        '  (RTRIM(PLACONTA) = ' +QuotedStr(Trim(Conta))+ ') AND' +CR_LF+
        '  (CODCENTROCUSTO  = ' +QuotedStr(CCusto)+ ') AND' +CR_LF+
        '  (IDEMPRESA       = ' +IntToStr(IdEmpresa)+ ')');

      Result := not(_CdsCCusto.IsEmpty);
    end;
  finally
    _CdsConta.Free;
    _CdsCCusto.Free;
  end;
end;

function TCtrlListTerceirosRH.GetCodInternacionalPais(const IdEmpresa: integer): string;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);
  try
    _CdsAux.Data := GetDataPacket(
      'SELECT' +CR_LF+
      '  RTRIM(PA.CODINTERNACIONAL) AS COD' +CR_LF+
      'FROM' +CR_LF+
      '  PESSOA P, ENDPESS EP, ESTADO ES, CIDADES CI, PAIS PA' +CR_LF+
      'WHERE' +CR_LF+
      '  (P.IDPESSOA       = ' +IntToStr(IdEmpresa)+ ') AND' +CR_LF+
      '  (P.IDENDCOMERCIAL = EP.IDENDERECO) AND' +CR_LF+
      '  (P.IDPESSOA       = EP.IDPESSOA) AND' +CR_LF+
      '  (EP.IDCIDADES     = CI.IDCIDADES) AND' +CR_LF+
      '  (CI.IDESTADO      = ES.IDESTADO) AND' +CR_LF+
      '  (ES.IDPAIS        = PA.IDPAIS)');
    if (_CdsAux.IsEmpty) then
      Result := 'BRASIL'// Indicar o padrão como Brasil
    else
      Result := _CdsAux.FieldByName('COD').asString;
  finally
    _CdsAux.Free;
  end;
end;

function TCtrlListTerceirosRH.GetExisteParamCap(const IdEmpresa: integer; const RecPag: char): boolean;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);
  try
    _CdsAux.Data := GetDataPacket(
      'SELECT IDPESSOA' +CR_LF+
      'FROM   PARAMCAP' +CR_LF+
      'WHERE  (IDPESSOA = ' +IntToStr(IdEmpresa)+ ') AND' +CR_LF+
      '       (RECPAG   = ' +QuotedStr(UpCase(RecPag))+ ')');
    Result := not(_CdsAux.IsEmpty);
  finally
    _CdsAux.Free;
  end;
end;

end.
