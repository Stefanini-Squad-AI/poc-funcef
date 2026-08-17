{-------------------------------------------------------------------------------
--------------------------------- ALTERAÇÕES -----------------------------------
--------------------------------------------------------------------------------
 Atender............: WO12256
 Data da Alteração..: 30/07/2024
 Responsável........: Luis Ferrari
 Descrição..........: Incluido um flag para verificar o dependente Legal do ESocial trazendo somente o Ativo (FLGATIVO)
 Função.............: ListTipoDependLegal
--------------------------------------------------------------------------------
 N. SIG.............: 123342
 Data da Alteração..: 25/02/2022
 Responsável........: Everson Cunha
 Descrição..........: Ajuste no campo NUMERO do endereço para retornar apenas
                      números, sem letras. Alguns cadastros antigos estavam com
                      letras.
--------------------------------------------------------------------------------
 Rotina.............: ListEnderecoResid
 N. SIG.............: 61776
 Data da Alteração..: 19/03/2018
 Responsável........: Cássio Florêncio Rovaroto
 Descrição..........: Inclusão de função para recuperar o endereço residencial
                      do funcionário
--------------------------------------------------------------------------------
 Nº SOL............: 250384.17324
 Nº PPM............: 1070235
 Data da Alteração.: 24/02/2016
 Alteração Form....: Leiaute e campos novos
 Responsável.......: Michelle Suellyn Mota
 Descrição.........: Mudança no leiaute e campos novos para adequar ao eSocial
--------------------------------------------------------------------------------
 Nº SOL............: 229874/16589
 Nº PPM............: 1235881
 Data da Alteração.: 19/02/2016
 Alteração Form....: ER141 - Alteração na aba de dados pessoais e dados titular
 Responsável.......: Michelle Suellyn Mota
 Descrição.........: Inclusão de novos campos, alteração de leiaute e consultas.
--------------------------------------------------------------------------------
 Nº SOL............: 191668
 Nº KINTANA........: 1820235
 Data da Alteração.: 25/11/2014
 Alteração.........: RegraEmUso (inclusão da View VW_RUBXEVENTO)
 Responsável.......: Edilaine
 Descrição.........: Trocar o tipo de cadastro de radio group para grid na aba
                     "Incidência de Eventos" do cadastro de rubricas salariais
--------------------------------------------------------------------------------
 Rotina:            FormCreate, SelSubTipo, OkDetCLick, ConfirmarClick,
                    VerificaPreenchimento, VerificaPreenchimentoProcesso
 Nº SOL:            229881/16647
 Nº PPM             565997
 Data da Alteração: 27/02/2015
 Alteração Form:    eSocial, Criação do campo estabelecimento e da aba processos
 Responsável:       Higor Nayde Ferreira
 Descrição:         Criação dos campos Clasificação tributaria  e natureza
                    juridica
--------------------------------------------------------------------------------
 Rotina:            GetDirDoCentroCusto()
 Nº SOL:            207737
 Nº KINTANA         2018095
 Data da Alteração: 15/08/2014
 Alteração Form:    Criação do metodo que lista a diretória do centro de custo.
 Responsável:       Felipe A. Santos
 Descrição:         Criação do metodo que lista a diretória do centro de custo.
--------------------------------------------------------------------------------
 Rotina:            listasistemacontrolepontoRAIS()
 Nº SOL:            224461/15703
 Nº KINTANA         2059184
 Data da Alteração: 04/02/2014
 Alteração Form:    Adicionada rotina para pegar informações do tabela
                    SISTEMACONTROLEPONTORAIS
 Responsável:       William Santana
 Descrição:         Solicitados adequação da Folha de Pagamento ao layout da
                    RAIS ano-base 2013.
                    Demanda Legal p atendimento Portaria nº 2072 de 31 de
                    Dezembro de 2013.
--------------------------------------------------------------------------------
 RESPONSÁVEL.: William Santana
 Nº SOL......: 199707
 Nº KINTANA..: 1922320
 Data........: 09/08/2013
 Descrição...: Alteração na forma de Correção das Faixas Salariais.
--------------------------------------------------------------------------------
 N. Sol..........: 196976/13122
 N. Kintana......: 1886065
 Data............: 14/12/2012
 Responsável.....: Paulo Nobre
 Descrição.......: Alteração da QUERY ListPortadorFormaEtapa
--------------------------------------------------------------------------------
 N. Sol..........: 172550
 N. Kintana......: 1555163
 Data............: 06/02/2012
 Responsável.....: Paulo Nobre
 Descrição.......: Novas funções para atender ao Cadastro de Processos Etapas
--------------------------------------------------------------------------------
 Nº SOL......: 172384/9603
 Nº KINTANA..: 1661662
 Data........: 01/10/2012
 Responsável.: Vander Campos
 Descrição...: Integração Orçamento - Inclusão das rotinas
--------------------------------------------------------------------------------
 N. Sol..........: 185455
 N. Kintana......: 1739618
 Data............: 20/07/2012
 Responsável.....: Mosé Cornetta
 Descrição.......: ListCCusto - Apenas trazer analiticos e ativos
--------------------------------------------------------------------------------
 N. Sol..........: 171426
 N. Kintana......: 1537613
 Data............: 03/05/2012
 Responsável.....: Edilaine Ferraresi
 Descrição.......: Inclusão de novas faixas salariais (de 9 para 20)
--------------------------------------------------------------------------------
 Rotina...........: TCtrlListTerceirosRH.ListPaises
 Nº SOL...........: 142865/6501
 Nº KINTANA.......: 1422531
 Data da Alteração: 15/09/2011
 Responsável......: Otacilio Aquino
 Descrição........: Busca inteligente na combo de nacionalidade no cadastro de
                    dependente.
--------------------------------------------------------------------------------
 Rotina......: -
 Nº SOL......: 158234
 Nº KINTANA..: 1284480
 Data........: 30/05/2011
 Responsável.: Thaise Amaral Martins
 Descrição...: Criar função ListCCustoAtivo para trazer somente centro de
               custo ativo
--------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 01/08/2002                                 }
{                                                       }
{*******************************************************}

Unit uCtrlListTerceirosRH;

Interface

Uses SysUtils, Controls, uCmDbObject, uCmControlObject, uCMClientDataSet, uCtrlCustomRH ;


Type
   TCtrlListTerceirosRH = Class(TCtrlCustomRH)
   Public
      Constructor Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: String); Reintroduce;
      Destructor Destroy; Override;

      Function ListUsuarioSistema: OleVariant;
      Function ListDocPessoa(IdPessoa: double): OleVariant;
      Function ListTipoDocumento: OleVariant;
      Function ListTipoDocPessoa: OleVariant;
      Function ListTipoDocRecPag(RecPag: String): OleVariant;
      Function ListTipoDocRecebDesemb(IdEmpresa: double; RecPag: String; Analitico: boolean): OleVariant;
      Function ListTipoAlterador(IdEmpresa: double; RecPag: String): OleVariant;
      Function ListTipoOperacao: OleVariant;
      Function ListCidadeEstadoPais: OleVariant;
      Function ListCidadeEstado: OleVariant;
      Function ListCidadeMunicipio: OleVariant; // Michelle Mota - SOL: 250384.17324 - PPM: 1070235
      Function ListIndicativoSusp(TIPO : string): OleVariant; // Michelle Mota - SOL: 250384.17324 - PPM: 1070235
      Function ListTipoDependencia: OleVariant; Overload;
      Function ListTipoDependLegal(IDDEPEN: string): OleVariant; Overload;//  Michelle Mota - SOL: 229874.16589 PPM: 1235881
      Function ListSitDepen: OleVariant;
      Function ListPaises: OleVariant;
      Function ListBancoComMasc: OleVariant;
      Function ListCidadeNasc(IdPais: integer; ListaSiglaUF: String = '';
         NomeCidade: String = ''): OleVariant;
      Function ListEstado(IdPais: integer = 0; IdCidades: integer = 0): OleVariant;
      Function ListMoeda: OleVariant;
      Function ListCotacaoMoeda(MoeCodigo: integer; Data: TDate): OleVariant;
      Function ListNaturezaEmpresarial: OleVariant;
      Function ListRamoFornecedor: OleVariant;
      Function ListRamoFornecedorDeEstabelecimento: OleVariant;
      Function ListInforme: OleVariant;
      Function ListNaturezaOperacao: OleVariant;
      Function ListEmpresaProp(IdEmpresa: integer = 0): OleVariant;
      Function ListCCusto(ListaIdEmpresa: String; CodCentroCusto: String = '';
         IncluirRegistroGenerico: boolean = false; FiltrarPlano: boolean = false): OleVariant;
      Function ListMarcaraCCustoSintetico(IdEmpresa: double): OleVariant;
      Function ListCCustoComFuncionarios(IdEmpresa: double): OleVariant;
      Function ListSubConta(IdEmpresa: integer = 0; CodSubConta: double = 0;
         NomeSubConta: String = ''): OleVariant;
      Function ListTipoDocRecebDesembXContabFolha(IdEmpresa: double): OleVariant;
      //Flavio Nogueira 17/06/2011
      Function ListTipoCentroRepons(IdEmpresa: double; idUsuario, IdPessoa: String): OleVariant;
      // Alex 11/12 inserido o plano de contas
      Function ListContasCCusto(IdEmpresa: double; Const iIdPlano: integer = 0): OleVariant;
      Function ListParamGlobal(IdEmpresa: double): OleVariant;
      Function ListHistoricoPadrao(IdEmpresa: double; CodHist: String = ''): OleVariant;
      Function ListContabJurid(CodTipoObjeto: double; IndMateria, IndPrincipal,
         Tipo_De, IdEmpresa: integer; CodCentroCusto, TipoAcao, TipCodigo: String): OleVariant; // Tipo_Para,
      Function ListPessoaTerceiro(TipoPessoa: String = ''; IdGrupo: double = 0): OleVariant;
      Function ListEmpresa_e_PessoaTerceiros: OleVariant;
      Function ListBanco: OleVariant;
      Function ListFeriados(IdCidades, IdPais: integer; UF: String; DataIni,
         DataFin: TDateTime; ListaTipo: String = ''): OleVariant;
      Function ListAgenciaBancaria: OleVariant;
      Function ListIdAgencia_e_NumBanco(IdAgencia: double): OleVariant;
      Function ListImagemPessoa(IdPessoa: double): OleVariant;
      Function ListImagem(IdImagem: double): OleVariant;
      Function ListContatoPessoaJuridica(IdPessoa: double): OleVariant;
      Function ListFaixaNivel(IdFaixaSalarial: double; IdEmpresa: integer): OleVariant;
      Function ListCamposCM(GrupoArquivo: String = ''): OleVariant;
      Function ListTabela_Generica_E_Longa(NomeTabela: String = ''): OleVariant;
      Function ListRegras: OleVariant;
      Function ListGrupoRegra: OleVariant;
      Function ListRegraXGrupo(IdRegra: double): OleVariant;
      Function ListPessoaPorTipo(Tipo: String): OleVariant;
      Function ListEmpresaForn(IdEmpresa: integer; IdFornecedor: double): OleVariant;
      Function ListDocumentoEmBranco: OleVariant;
      Function ListEndereco(IdPessoa: double): OleVariant;
      Function ListTipoDadoTabGener: OleVariant;
      Function ListPatrocinadora: OleVariant;
      Function ListPlanoPrev: OleVariant;
      Function ListCargoEx: OleVariant;
      Function ListImovel: OleVariant;
      Function ListContaBancaria(IdPessoa: double = 0): OleVariant;
      Function ListContaBancariaTerceiros(IdPessoa: double = 0; IdConta: double = 0): OleVariant;
      //
      Function ListContaBancariaDepJud(IdPortador: double): OleVariant;
      //
      Function ValorImovel(IdImovel: double = 0): OleVariant;
      Function ValorPenhorado(Id: double; Tipo: integer): double;
      Function ListPortadorForma(Const RecPag: String = ''): OleVariant;
      Function ListPlanoPrevCTB(Const idPatro: Integer = 0): OleVariant;

      Procedure ValorContabil(Id: double; IdEmpresa, Tipo: integer;
         Var Valor: double; Var DataContabil: String);

      Function ListEventoImovelVazio: OleVariant;
      Function ListPlanoPatro(IdPlanPrevPatr: double = 0): OleVariant;
      Function ListTipoInvestimento: OleVariant;
      Function ListClasseRendaFixa: OleVariant;
      Function ListCustodiante: OleVariant;
      Function ListTipoCota: OleVariant;
      Function ListInvestimento(Tipo: double = 0; Classe: double = 0): OleVariant;
      Function ListFundoInvestimento(Tipo: String): OleVariant;
      Function ListAplicacao(IDPLANPREVCTBPATR, IDINVESTIMENTO, IDCUSTODIANTE,
         DATAHISTRENFIX: String): OleVariant;
      Function ListFundoSaldo(IDPLANPREVCTBPATR, IDTIPOINVEST,
         IDTIPOFUNDOINVEST, IDFUNDOINVEST, DATAMOVFUNDO: String): OleVariant;
      Function ListPrograma: OleVariant;
      Function ListFormaRecPag(RecPag: String; IdEmpresa: integer): OleVariant;
      Function ListaCentroResponsabilidade(idUsuario: Integer): OleVariant;

      // SOL 172550 KTN 1555163 - Paulo Nobre
      Function ListTipoOperacaoJUR: OleVariant; // Paulo Nobre
      Function ListTipProcJUR(IdPrograma: Integer): OleVariant;
      Function ListaCentroResponsabilidadeJUR(idUsuario: Integer): OleVariant;
      Function ListaCentroCustoEtapa(CodCentroCusto: String): OleVariant;
      Function ListTipoDocRecPagEtapa(idDoc: Integer; sTipo: String): OleVariant;
      Function ListPortadorFormaEtapa(IdPortForma: Integer; sTipo: String): OleVariant;
      //

      //higor
      Function ListNaturezaJUR: OleVariant; // Paulo Nobre
      Function ListClassTrib: OleVariant; // Paulo Nobre


      Function RegraEmUso(IdRegra: double): boolean;
      Function GetMascaraPlano(IdPlano: integer): String;
      Function GetIdPlanoOrcamentario(IdEmpresa: double): double;
      Function GetPlano(IdEmpresa: double): integer;
      Function GetIdPatro(IdEmpresa: double): integer;
      Function GetIdPlanoPrev(IdEmpresa: double): integer;
      Function GetIdContraCheque: integer;
      Function GetPortadorFormaPadrao: integer;
      Function GetNumeroPlanilha(PlnCodigo: double): double;
      Function GetContaBancariaFavorecido(IdFavorecido: double): integer;
      //Vander Campos - SOL: 172384/9603 - KINTANA: 1661662 | Inclusão de Overload.
      Function GetIdProgramaCCusto(CodCentroCusto: String; IdEmpresa: integer): integer;Overload;
      Function GetIdProgramaCCusto(CodCentroCusto: String; IdEmpresa: integer; Var AIdProgramaOrcamen : Integer): integer;Overload;
      //
      Function GetIdTipoProcesso(IdUsuario: double; IdReferencia: integer): integer;
      Function GetFlgOk_RAD(IdProcesso: double): String;
      Function GetOpcaoTicket(Matricula: String): String;
      Procedure GetPercREB_DataAssoc(Matricula: String; Var PercREB, DataAssoc: String);
      Function GetIdAgenciaBancaria(NumAgencia: String): double;
      Function GetNumProprietarios(IdEmpresa: double): integer;
      Function GetPessoa_Documento(NumDocumento: String; IdDocumento: double): double;
      Function GetNumPlanilha(PlnCodigo: double): double;
      Function GetNomePessoa(IdPessoa: double): String;
      Function GetNomeAtividadeProjeto(UnidNegoc: integer): String;
      Function ListCCustoAtivo(ListaIdEmpresa: String): OleVariant;

      Function listasistemacontrolepontoRAIS(): OleVariant; // William Santana - SOL: 224461/15703 - KIN: 2059184
      Function GetDirDoCentroCusto(CodCentroCusto : Integer) : OleVariant; // Felipe A. Santos SOL 207737 KTN 2018095

      function ListEnderecoResid(IdPessoa: integer): OleVariant; // Cássio Rovaroto - SIG nº 61776
   End;

Implementation

Uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlListTerceirosRH }

Constructor TCtrlListTerceirosRH.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: String);
Begin
   Inherited Create;
   SetAutorizacoes(UsuXFilial, UsuXCCusto, IdUsuarioGeral);
End;

Destructor TCtrlListTerceirosRH.Destroy;
Begin
   Inherited;
End;

Function TCtrlListTerceirosRH.ListUsuarioSistema: OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  P.NOME, U.IDUSUARIO' + CR_LF +
      'FROM' + CR_LF +
      '  PESSOA P, USUARIOSISTEMA U' + CR_LF +
      'WHERE' + CR_LF +
      '  (U.IDUSUARIO = P.IDPESSOA)' + CR_LF +
      'ORDER BY' + CR_LF +
      '  P.NOME');
End;

Function TCtrlListTerceirosRH.ListDocPessoa(IdPessoa: double): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  DO.IDPESSOA, TDO.NOMEDOCUMENTO, DO.NUMDOCUMENTO,' + CR_LF +
      '  TDO.MASCARA, DO.ORGAO, DO.UF, DO.DATAEMISSAO' + CR_LF +
      'FROM' + CR_LF +
      '  DOCPESSOA DO, TIPODOCPESSOA TDO' + CR_LF +
      'WHERE' + CR_LF +
      '  (DO.IDPESSOA    = ' + FloatToStr(IdPessoa) + ') AND' + CR_LF +
      '  (DO.IDDOCUMENTO = TDO.IDDOCUMENTO)' + CR_LF +
      'ORDER BY' + CR_LF +
      '  TDO.NOMEDOCUMENTO');
End;

Function TCtrlListTerceirosRH.ListTipoDocumento: OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  NOMEDOCUMENTO, IDDOCUMENTO' + CR_LF +
      'FROM' + CR_LF +
      '  TIPODOCPESSOA' + CR_LF +
      'WHERE' + CR_LF +
      '  (FISICAJURIDICA = ''F'')');
End;

Function TCtrlListTerceirosRH.ListTipoDocPessoa: OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  IDDOCUMENTO, NOMEDOCUMENTO, FISICAJURIDICA, MASCARA' + CR_LF +
      'FROM' + CR_LF +
      '  TIPODOCPESSOA' + CR_LF +
      'ORDER BY' + CR_LF +
      '  NOMEDOCUMENTO');
End;

Function TCtrlListTerceirosRH.ListTipoDocRecPag(RecPag: String): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  CODTIPDOC, DESCRICAO, DEBCRE,' +
      ' DECODE(RECPAG,''P'',''Pagar'',''Receber'') AS RECPAG' + CR_LF +
      'FROM' + CR_LF +
      '  TIPODOCRECPAG' + CR_LF +
      IFF(RecPag = '', '', 'WHERE' + CR_LF + '  (RECPAG   = ' + QuotedStr(RecPag) + ')' + CR_LF) +
      'ORDER BY' + CR_LF +
      '  ' + IFF(RecPag = '', 'RECPAG, ', '') + 'DESCRICAO');
End;

Function TCtrlListTerceirosRH.ListTipoDocRecebDesemb(IdEmpresa: double; RecPag: String;
   Analitico: boolean): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  CODTIPRECDES, DESCRICAO, PLACONTACREDITO, PLANO, PLACONTA,' + CR_LF +
      '  DECODE(RECPAG,''P'',''Pagar'',''Receber'') AS RECPAG' + CR_LF +
      'FROM' + CR_LF +
      '  TIPORECEBDESEMB' + CR_LF +
      'WHERE' + CR_LF +
      '  (NVL(ATIVO,''S'') <> ''N'') AND' + CR_LF +
      IFF(RecPag = '', '', '  (RECPAG   = ' + QuotedStr(RecPag) + ') AND' + CR_LF) +
      '  (ANASINT  = ' + QuotedStr(IFF(Analitico, 'A', 'S')) + ') AND' + CR_LF +
      '  (IDPESSOA = ' + FloatToStr(IdEmpresa) + ')' + CR_LF +
      'ORDER BY' + CR_LF +
      '  DESCRICAO');
End;

Function TCtrlListTerceirosRH.ListTipoAlterador(IdEmpresa: double; RecPag: String): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  CODALTERADOR, DESCRICAO, PLANO, PLACONTA,' + CR_LF +
      '  DECODE(ACRESDECRES,''C'',''Acréscimo'',''Decréscimo'') AS ACRESDECRES,' + CR_LF +
      '  DECODE(RECPAG,''P'',''Pagar'',''Receber'') AS RECPAG' + CR_LF +
      'FROM' + CR_LF +
      '  TIPOALTERADOR' + CR_LF +
      'WHERE' + CR_LF +
      IFF(RecPag = '', '', '  (RECPAG   = ' + QuotedStr(RecPag) + ') AND' + CR_LF) +
      '  (IDEMPRESA = ' + FloatToStr(IdEmpresa) + ')' + CR_LF +
      'ORDER BY' + CR_LF +
      '  DESCRICAO');
End;

Function TCtrlListTerceirosRH.ListTipoDocRecebDesembXContabFolha(IdEmpresa: double): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT DISTINCT' + CR_LF +
      '  T.CODTIPRECDES, T.DESCRICAO' + CR_LF +
      'FROM' + CR_LF +
      '  TIPORECEBDESEMB T, CONTABFOLHA C' + CR_LF +
      'WHERE' + CR_LF +
      '  (NVL(ATIVO,''S'') <> ''N'') AND' + CR_LF +
      '  (T.IDPESSOA        = ' + FloatToStr(IdEmpresa) + ') AND' + CR_LF +
      '  (C.CODTIPRECDES    = T.CODTIPRECDES)' + CR_LF +
      'ORDER BY' + CR_LF +
      '  T.DESCRICAO');
End;

Function TCtrlListTerceirosRH.ListContasCCusto(IdEmpresa: double; Const iIdPlano: integer): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  PLANO, PLACONTA, IDEMPRESA, CODCENTROCUSTO' + CR_LF +
      'FROM' + CR_LF +
      '  CONTASXCC' + CR_LF +
      'WHERE' + CR_LF +
      '  (IDEMPRESA = ' + FloatToStr(IdEmpresa) + ')' + CR_LF +
      IFF(iIdPlano = 0, '', '  AND (PLANO = ' + IntToStr(iIdPlano) + ') '));
End;

Function TCtrlListTerceirosRH.ListTipoOperacao: OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  TIPCODIGO, TIPDESCRICAO' + CR_LF +
      'FROM' + CR_LF +
      '  TIPOPER' + CR_LF +
      'ORDER BY' + CR_LF +
      '  TIPDESCRICAO');
End;

Function TCtrlListTerceirosRH.ListCidadeEstadoPais: OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  C.IDCIDADES, LTRIM(RTRIM(C.NOME)) AS CIDADE, E.CODESTADO,' + CR_LF +
      '  LTRIM(RTRIM(E.NOMEESTADO)) AS ESTADO,' + CR_LF +
      '  LTRIM(RTRIM(P.NOMEPAIS)) AS PAIS' + CR_LF +
      'FROM' + CR_LF +
      '  CIDADES C, ESTADO E, PAIS P' + CR_LF +
      'WHERE' + CR_LF +
      '  (C.IDESTADO = E.IDESTADO) AND' + CR_LF +
      '  (E.IDPAIS   = P.IDPAIS)');
End;

// Início - Michelle Mota - SOL: 250384.17324 - PPM: 1070235
Function TCtrlListTerceirosRH.ListCidadeMunicipio: OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  C.IDCIDADES, C.CODMUNICIPIO, LTRIM(RTRIM(C.NOME)) AS CIDADE, E.CODESTADO ' + CR_LF +
      'FROM' + CR_LF +
      '  CIDADES C, ESTADO E, PAIS P' + CR_LF +
      'WHERE' + CR_LF +
      '  (C.IDESTADO = E.IDESTADO) AND' + CR_LF +
      '  (E.IDPAIS   = P.IDPAIS)' + CR_LF +
      'ORDER BY 3');
End;

Function TCtrlListTerceirosRH.ListIndicativoSusp(TIPO : string): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  * ' + CR_LF +
      'FROM' + CR_LF +
      '  INDICATIVOSUSP WHERE TIPO = ' + QUOTEDSTR(TIPO) + CR_LF +
      'ORDER BY ' + CR_LF +
      '  DESCRICAO');
End;

// Término - Michelle Mota - SOL: 250384.17324 - PPM: 1070235

Function TCtrlListTerceirosRH.ListCidadeEstado: OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  CI.IDCIDADES, ES.CODESTADO, CI.NOME AS CIDADE' + CR_LF +
      'FROM' + CR_LF +
      '  ESTADO ES, CIDADES CI' + CR_LF +
      'WHERE' + CR_LF +
      '  (CI.IDESTADO = ES.IDESTADO(+))');
End;

Function TCtrlListTerceirosRH.ListTipoDependencia: OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  IDDEPENDENCIA, DESCRICAO' + CR_LF +
      'FROM' + CR_LF +
      '  DEPEN' + CR_LF +
      'WHERE' + CR_LF +
      '  (IDDEPENDENCIA <> ''PRP'')' + CR_LF +
      'ORDER BY' + CR_LF +
      '  DESCRICAO');
End;
// Início - Michelle Mota - SOL: 229874.16589 PPM: 1235881
Function TCtrlListTerceirosRH.ListTipoDependLegal(IDDEPEN: string): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  DP.CODIGO, DX.IDDEPENDENTELEGALESOCIAL, substr(DESCRICAO,0,223) DESCRICAO' + CR_LF +
      'FROM' + CR_LF +
      '  DEPENDENTELEGALESOCIAL DP, DEPENXDEPENLEGALESOCIAL DX' + CR_LF +
      'WHERE DP.IDDEPENDENTELEGALESOCIAL = DX.IDDEPENDENTELEGALESOCIAL' + CR_LF +
      '  AND IDDEPENDENCIA = ' + QuotedStr(IDDEPEN) + CR_LF +
      '  AND DP.FLGATIVO = 1 ' + CR_LF +     // WO12256 Ferrari
      'ORDER BY' + CR_LF +
      '  DESCRICAO');
End;
// Término - Michelle Mota - SOL: 229874.16589 PPM: 1235881

Function TCtrlListTerceirosRH.ListSitDepen: OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  IDSITDEPENDENTE, DESCRICAO' + CR_LF +
      'FROM' + CR_LF +
      '  SITDEPENDENTE');
End;

Function TCtrlListTerceirosRH.ListPaises: OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      // SOL 142865/6501 Kintana 1422531 - Otacilio Aquino INICIO
      // O espaço em branco a esqueda não permite busca no combo com auto complemento
      //'  IDPAIS, (''  '' || NOMENACIONALIDADE) AS NOMENACIONALIDADE' + CR_LF +
      '  IDPAIS, NOMENACIONALIDADE' + CR_LF +
      // SOL 142865/6501 Kintana 1422531 - Otacilio Aquino FIM
      'FROM' + CR_LF +
      '  PAIS');
End;

Function TCtrlListTerceirosRH.ListEstado(IdPais: integer; IdCidades: integer): OleVariant;
Var
   sSQL: String;
Begin
   sSQL := '';
   If (IdPais = -1) Then
      sSQL := 'WHERE' + CR_LF + '  (1 = 2)'
   Else
      If (IdPais > 0) Or (IdCidades > 0) Then
         Begin
            sSQL := 'WHERE' + CR_LF;

            If (IdPais > 0) Then
               sSQL := sSQL +
                  '  (E.IDPAIS = ' + IntToStr(IdPais) + ')' + CR_LF;

            If (IdCidades > 0) Then
               Begin
                  If (IdPais > 0) Then
                     sSQL := sSQL + ' AND' + CR_LF;

                  sSQL := sSQL +
                     '  (C.IDCIDADES = ' + IntToStr(IdCidades) + ') AND' + CR_LF +
                     '  (C.IDESTADO  = E.IDESTADO)' + CR_LF;
               End;
         End;

   Result := GetDataPacket(
      'SELECT DISTINCT' + IFF(IdPais = -1, ' /*+ OPTIMIZER_MODE RULE */', '') + CR_LF +
      '  E.IDESTADO, E.CODESTADO, E.NOMEESTADO' + CR_LF +
      'FROM' + CR_LF +
      '  ESTADO E' + IFF(IdCidades <= 0, '', ', CIDADES C') + CR_LF +
      sSQL +
      'ORDER BY' + CR_LF +
      '  E.NOMEESTADO');
End;

Function TCtrlListTerceirosRH.ListCidadeNasc(IdPais: integer; ListaSiglaUF,
   NomeCidade: String): OleVariant;
Var
   sSQL, SiglaUF: String;
Begin
   sSQL := '';
   If (IdPais > 0) Then
      sSQL := sSQL + '  (E.IDPAIS = ' + IntToStr(IdPais) + ') AND' + CR_LF;

   If (NomeCidade <> '') Then
      sSQL := sSQL + '  (UPPER(CONVERT(REPLACE(REPLACE(C.NOME,''Ã'',''A''),''Õ'',''O''),' +
         '''US7ASCII'')) LIKE ' + QuotedStr(NomeCidade + '%') + ') AND' + CR_LF;

   If (ListaSiglaUF <> '') Then
      Begin
         sSQL := sSQL + '  (' + CR_LF;
         While (ListaSiglaUF <> '') Do
            Begin
               ExtraiString(ListaSiglaUF, SiglaUF, ',');
               sSQL := sSQL + '    (UPPER(E.CODESTADO) LIKE ' + QuotedStr(SiglaUF + '%') + ')' +
                  IFF(ListaSiglaUF = '', '', ' OR') + CR_LF;
            End;
         sSQL := sSQL + '  ) AND' + CR_LF;
      End;

   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  C.IDCIDADES, C.NOME' + CR_LF +
      'FROM' + CR_LF +
      '  CIDADES C, ESTADO E' + CR_LF +
      'WHERE' + CR_LF +
      sSQL +
      '  (E.IDESTADO = C.IDESTADO)' + CR_LF +
      'ORDER BY' + CR_LF +
      '  C.NOME');
End;

Function TCtrlListTerceirosRH.ListMoeda: OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  MOECODIGO, MOESIGLA, MOEDESC, MOEPERIODICIDADE' + CR_LF +
      'FROM' + CR_LF +
      '  MOEDA' + CR_LF +
      'ORDER BY' + CR_LF +
      '  MOEDESC');
End;

Function TCtrlListTerceirosRH.ListCotacaoMoeda(MoeCodigo: integer; Data: TDate): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  DECODE(COTVALOR,NULL,0,COTVALOR) AS VALOR' + CR_LF +
      'FROM' + CR_LF +
      '  COTACAOMOEDA' + CR_LF +
      'WHERE' + CR_LF +
      '  (COTDATA   = TO_DATE(' + QuotedStr(DateToStr(Data)) + ',''DD/MM/YYYY'')) AND' + CR_LF +
      '  (MOECODIGO = ' + IntToStr(MoeCodigo) + ')');
End;

Function TCtrlListTerceirosRH.ListNaturezaEmpresarial: OleVariant;
Begin
   Result := GetDataPacket('SELECT IDNATEMPRE, DESCRICAO FROM NATEMPRESA');
End;

Function TCtrlListTerceirosRH.ListRamoFornecedor: OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  IDRAMOFORNECEDOR, DESCRAMOFORNECEDOR' + CR_LF +
      'FROM' + CR_LF +
      '  RAMOFORNECEDOR' + CR_LF +
      'ORDER BY' + CR_LF +
      '  DESCRAMOFORNECEDOR');
End;

Function TCtrlListTerceirosRH.ListRamoFornecedorDeEstabelecimento: OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT DISTINCT' + CR_LF +
      '  R.IDRAMOFORNECEDOR, R.DESCRAMOFORNECEDOR' + CR_LF +
      'FROM' + CR_LF +
      '  RAMOFORNECEDOR R, FILIALPESSOA F' + CR_LF +
      'WHERE' + CR_LF +
      '  (F.IDRAMOFORNECEDOR = R.IDRAMOFORNECEDOR)' + CR_LF +
      'ORDER BY' + CR_LF +
      '  R.DESCRAMOFORNECEDOR');
End;

Function TCtrlListTerceirosRH.ListInforme: OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  IDINFORME, RTRIM(NOMEINFORME) AS NOMEINFORME' + CR_LF +
      'FROM' + CR_LF +
      '  INFORME');
End;

Function TCtrlListTerceirosRH.ListNaturezaOperacao: OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  CODNATUREZA, RTRIM(DESCRICAO) AS DESCRICAO' + CR_LF +
      'FROM' + CR_LF +
      '  NATURENDIMENTO');
End;

Function TCtrlListTerceirosRH.ListEmpresaProp(IdEmpresa: integer): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  PJ.IDPESSOA, EP.NOMEEMPRESA AS NOME, PJ.RAZAOSOCIAL' + CR_LF +
      'FROM' + CR_LF +
      '  PESSOA PJ, EMPRESAPROP EP' + CR_LF +
      'WHERE' + CR_LF +
      IFF(IdEmpresa > 0, '  (EP.IDPESSOA = ' + IntToStr(IdEmpresa) + ') AND' + CR_LF, '') +
      '  (EP.IDPESSOA = PJ.IDPESSOA)' + CR_LF +
      'ORDER BY' + CR_LF +
      '  EP.NOMEEMPRESA');
End;

Function TCtrlListTerceirosRH.ListCCusto(ListaIdEmpresa: String; CodCentroCusto: String;
   IncluirRegistroGenerico, FiltrarPlano: boolean): OleVariant;
Var
   sSQL: String;
   sSql2: String;
Begin
   sSQL :=
      IFF(IncluirRegistroGenerico,
      'SELECT' + CR_LF +
      '  ''**********'' AS CODCENTROCUSTO, ''***'' AS CODREDUZIDO,' + CR_LF +
      '  ''**********'' AS NOME, 0 AS TIPO,' + CR_LF +
      '  ''***'' AS ATIVO,' + CR_LF +
      //Mose - SOL : 185455 KTN 1739618 Inicio
      'STATUSGRUPOCDC' + CR_LF +
      //Mose - SOL : 185455 KTN 1739618 Fim
      'FROM' + CR_LF +
      '  DUAL' + CR_LF +
      'UNION' + CR_LF, '') +
      'SELECT' + CR_LF +
      '  RTRIM(CODCENTROCUSTO) AS CODCENTROCUSTO, CODREDUZIDO, RTRIM(NOME) || DECODE(ATIVO,''S'','''','' (Inativo)'')AS NOME,' +
      'STATUSGRUPOCDC' +
      IFF(IncluirRegistroGenerico, ', 1 AS TIPO,', ',') + CR_LF +
      '  DECODE(ATIVO,''S'',''Sim'',''Não'') AS ATIVO' + CR_LF +
      'FROM' + CR_LF +
      '  CENTCUST' + IFF(FiltrarPlano, ' C, PARAMGLOBAL P', '') + CR_LF +
      'WHERE' + CR_LF;

   // C. de Custo(s) habilitado(s) para o usuário
   If (FUsuXCCusto <> '') Then
      Begin
         If (Pos(',', FUsuXCCusto) > 0) Then
            sSQL := sSQL + '  (CODCENTROCUSTO IN ' + FUsuXCCusto + ') AND' + CR_LF
         Else
            sSQL := sSQL + '  (CODCENTROCUSTO  = ' + FUsuXCCusto + ') AND' + CR_LF;
      End
   Else
      Begin
         If (CodCentroCusto <> '') Then
            Begin
               If (Pos(',', CodCentroCusto) > 0) Then
                  sSQL := sSQL + '  (CODCENTROCUSTO IN (' + QuotedStr(CodCentroCusto) + ')) AND' + CR_LF
               Else
                  sSQL := sSQL + '  (CODCENTROCUSTO  = ' + QuotedStr(CodCentroCusto) + ') AND' + CR_LF;
            End;
      End;

   If FiltrarPlano Then
      sSQL := sSQL + '  (C.IDPLANCENTCUST  = P.IDPLANCENTCUST) AND' + CR_LF;

   Result := GetDataPacket(sSQL + CR_LF +
      IFF(Pos(',', ListaIdEmpresa) > 0,
      '  (IDEMPRESA  IN (' + ListaIdEmpresa + '))',
      '  (IDEMPRESA   = ' + ListaIdEmpresa + ')') + CR_LF +
      'ORDER BY' + CR_LF +
      IFF(IncluirRegistroGenerico, '  3, 2', '  NOME'));
End;

Function TCtrlListTerceirosRH.ListMarcaraCCustoSintetico(IdEmpresa: double): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  PR.MASCARACC, RTRIM(CC.CODCENTROCUSTO) AS CODCENTROCUSTO, CC.NOME' + CR_LF +
      'FROM' + CR_LF +
      '  CENTCUST CC, PARAMGLOBAL PR' + CR_LF +
      'WHERE' + CR_LF +
      '  (CC.IDEMPRESA      = ' + FloatToStr(IdEmpresa) + ') AND' + CR_LF +
      '  (CC.STATUSGRUPOCDC = ''S'') AND' + CR_LF +
      '  (CC.IDEMPRESA      = PR.IDPESSOA)' + CR_LF +
      'ORDER BY' + CR_LF +
      '  TO_NUMBER(CC.CODCENTROCUSTO)');
End;

Function TCtrlListTerceirosRH.ListCCustoComFuncionarios(IdEmpresa: double): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT DISTINCT' + CR_LF +
      '  RTRIM(CC.CODCENTROCUSTO) AS CODCENTROCUSTO, CC.NOME' + CR_LF +
      'FROM' + CR_LF +
      '  CENTCUST CC, FUNCIONARIO F' + CR_LF +
      'WHERE' + CR_LF +
      '  (CC.IDEMPRESA      = ' + FloatToStr(IdEmpresa) + ') AND' + CR_LF +
      '  (CC.CODCENTROCUSTO = F.CODCENTROCUSTO)' + CR_LF +
      'ORDER BY' + CR_LF +
      '  CC.NOME');
End;

Function TCtrlListTerceirosRH.ListSubConta(IdEmpresa: integer; CodSubConta: double;
   NomeSubConta: String): OleVariant;
Var
   sSQL: String;
Begin
   If (IdEmpresa = -1) Then
      sSQL := '  (1 = 2)'
   Else
      Begin
         If (IdEmpresa > 0) Then
            sSQL := sSQL + '  (IDPESSOA     = ' + IntToStr(IdEmpresa) + ')';

         If (CodSubConta > 0) Then
            sSQL := sSQL + IFF(IdEmpresa > 0, ' AND' + CR_LF, '') +
               '  (CODSUBCONTA = ' + FloatToStr(CodSubConta) + ')';

         If (NomeSubConta <> '') Then
            sSQL := sSQL + IFF((IdEmpresa > 0) Or (CodSubConta > 0), ' AND' + CR_LF, '') +
               '  (NOMESUBCONTA  = ' + QuotedStr(NomeSubConta) + ')';
      End;

   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  CODSUBCONTA, IDPESSOA, NOMESUBCONTA' + CR_LF +
      'FROM' + CR_LF +
      '  SUBCONTA' +
      IFF(sSQL = '', '', CR_LF + 'WHERE' + CR_LF + sSQL));
End;

Function TCtrlListTerceirosRH.ListParamGlobal(IdEmpresa: double): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  USACRESPON, USAABC, CODCENTRORESPON, MASCCENTRORESPON, UNIDNEGOC, MASCUNIDNEGOC' + CR_LF +
      'FROM' + CR_LF +
      '  PARAMGLOBAL' + CR_LF +
      'WHERE' + CR_LF +
      '  (IDPESSOA = ' + FloatToStr(IdEmpresa) + ')');
End;

Function TCtrlListTerceirosRH.ListHistoricoPadrao(IdEmpresa: double; CodHist: String): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  HITCODHIST, HITDESCR1' + CR_LF +
      'FROM' + CR_LF +
      '  HISTOPADRAO' + CR_LF +
      'WHERE' + CR_LF +
      IFF(CodHist = '', '',
      '  (HITCODHIST = ' + QuotedStr(CodHist) + ') AND' + CR_LF) +
      '  (IDPESSOA   = ' + FloatToStr(IdEmpresa) + ')' + CR_LF +
      'ORDER BY' + CR_LF +
      '  HITDESCR1');
End;

Function TCtrlListTerceirosRH.ListContabJurid(CodTipoObjeto: double;
   IndMateria, IndPrincipal, Tipo_De, IdEmpresa: integer; // Tipo_Para,
   CodCentroCusto, TipoAcao, TipCodigo: String): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  C.IDPLANO1, C.IDPLANO2, C.CONTADEBITO, C.CONTACREDITO, C.INDMATERIA, TP.DESCRICAO,' + CR_LF +
      '  C.FLGUSAPADRAO, C.TIPCODIGO' + CR_LF +
      'FROM' + CR_LF +
      '  CONTABJURID C, TIPOOBJPROCTRAB TP' + CR_LF +
      'WHERE' + CR_LF +
      '  (C.CODTIPOOBJETO   = ' + FloatToStr(CodTipoObjeto) + ') AND' + CR_LF +
      '  (C.INDPRINCIPAL    = ' + IntToStr(IndPrincipal) + ') AND' + CR_LF +
      '  (C.INDMATERIA      = ' + IntToStr(IndMateria) + ') AND' + CR_LF +
      '  (C.IDTIPOPROC_DE   = ' + IntToStr(Tipo_De) + ') AND' + CR_LF +
      '  (C.TIPCODIGO       = ' + TipCodigo + ') AND' +
      //      IFF(Tipo_De = 0, '', '  (C.IDTIPOPROC_DE   = ' + IntToStr(Tipo_De) + ') AND' + CR_LF) +
      //      IFF(Tipo_Para = 0, '', '  (C.IDTIPOPROC_PARA = ' + IntToStr(Tipo_Para) + ') AND' + CR_LF) +
      IFF(IdEmpresa = 0, '', '  (C.IDEMPRESA       = ' + IntToStr(IdEmpresa) + ') AND' + CR_LF) +
      IFF(CodCentroCusto = '', '', '  (C.CODCENTROCUSTO  = ' + QuotedStr(CodCentroCusto) + ') AND' + CR_LF) +
      IFF(TipoAcao = '', '', '  (C.INDOPERACAO     = ' + TipoAcao + ') AND' + CR_LF) +
      '  (C.CODTIPOOBJETO   = TP.CODTIPOOBJETO)');
End;

Function TCtrlListTerceirosRH.ListPessoaTerceiro(TipoPessoa: String; IdGrupo: double): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  P.NOME, T.IDPESSOA' + CR_LF +
      'FROM' + CR_LF +
      '  PESSOA P, TERCEIRO T' + CR_LF +
      'WHERE' + CR_LF +
      '  (T.IDPESSOA = P.IDPESSOA)' +
      IFF(IdGrupo > 0, ' AND' + CR_LF + '  (P.IDGRUPO  = ' + FloatToStr(IdGrupo) + ')', '') +
      IFF(TipoPessoa <> '', ' AND' + CR_LF + '  (P.TIPO     = ' + QuotedStr(TipoPessoa) + ')', '') + CR_LF +
      'ORDER BY' + CR_LF +
      '  P.NOME');
End;

Function TCtrlListTerceirosRH.ListEmpresa_e_PessoaTerceiros: OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  P.NOME, T.IDPESSOA' + CR_LF +
      'FROM' + CR_LF +
      '  PESSOA P, TERCEIRO T' + CR_LF +
      'WHERE' + CR_LF +
      '  (T.IDPESSOA = P.IDPESSOA)' + CR_LF +
      'UNION' + CR_LF +
      'SELECT' + CR_LF +
      '  NOMEEMPRESA AS NOME, IDPESSOA' + CR_LF +
      'FROM' + CR_LF +
      '  EMPRESAPROP' + CR_LF +
      'ORDER BY' + CR_LF +
      '  1');
End;

Function TCtrlListTerceirosRH.ListBanco: OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  PB.IDPESSOA, PB.NOME' + CR_LF +
      'FROM' + CR_LF +
      '  PESSOA PB, BANCO B' + CR_LF +
      'WHERE' + CR_LF +
      '  (B.IDPESSOA       = PB.IDPESSOA) AND' + CR_LF +
      '  (PB.IDPESSOA NOT IN (SELECT IDBANCO' + CR_LF +
      '                       FROM   BANCOPORTFOLHA' + CR_LF +
      '                       WHERE  (IDBANCO IS NOT NULL)))');
End;

Function TCtrlListTerceirosRH.ListBancoComMasc: OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  B.IDPESSOA, B.NUMBANCO, P.RAZAOSOCIAL,' + CR_LF +
      '  B.MASCARACC, B.MASCARAAGENCIA, B.FLGVALIDACC' + CR_LF +
      'FROM' + CR_LF +
      '  PESSOA P, BANCO B' + CR_LF +
      'WHERE' + CR_LF +
      '  (B.IDPESSOA = P.IDPESSOA)' + CR_LF +
      'ORDER BY' + CR_LF +
      '  P.RAZAOSOCIAL');
End;

Function TCtrlListTerceirosRH.ListFeriados(IdCidades, IdPais: integer; UF: String;
   DataIni, DataFin: TDateTime; ListaTipo: String): OleVariant;
Var
   sSQL: String;
Begin
   If (ListaTipo <> '') Then
      If (Pos(',', ListaTipo) > 0) Then
         sSQL := '  (FLGTIPO     IN (' + QuotedListaString(ListaTipo, ',') + ')) AND' + CR_LF
      Else
         sSQL := '  (FLGTIPO      = ' + QuotedListaString(ListaTipo, ',') + ') AND' + CR_LF;

   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  DATAFERIADO, FLGTIPO' + CR_LF +
      'FROM' + CR_LF +
      '  FERIADOS' + CR_LF +
      'WHERE' + CR_LF +
      sSQL +
      '  (DATAFERIADO >= TO_DATE(' + QuotedStr(DateToStr(DataIni)) + ',''DD/MM/YYYY'')) AND' + CR_LF +
      '  (DATAFERIADO <= TO_DATE(' + QuotedStr(DateToStr(DataFin)) + ',''DD/MM/YYYY'')) AND' + CR_LF +
      '  (IDPAIS       = ' + IntToStr(IdPais) + ') AND' + CR_LF +
      '  (((FLGAMBITO  = ''M'') AND (IDCIDADES = ' + IntToStr(IdCidades) + ')) OR' + CR_LF +
      '   ((FLGAMBITO  = ''E'') AND (CODESTADO = ' + QuotedStr(UF) + ')) OR' + CR_LF +
      '   (FLGAMBITO   = ''F''))' + CR_LF +
      'ORDER BY' + CR_LF +
      '  DATAFERIADO, FLGTIPO');
End;

Function TCtrlListTerceirosRH.ListAgenciaBancaria: OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  B.NUMBANCO, PB.NOME, A.NUMAGENCIA, A.IDPESSOA, PA.NOME AS AGENCIA' + CR_LF +
      'FROM' + CR_LF +
      '  PESSOA PA, PESSOA PB, AGENCIABANCARIA A, BANCO B' + CR_LF +
      'WHERE' + CR_LF +
      '  (B.NUMBANCO = ''104'') AND' + CR_LF + // CAIXA ECONOMICA FEDERAL
      '  (B.IDPESSOA = A.IDBANCO) AND' + CR_LF +
      '  (A.IDPESSOA = PA.IDPESSOA) AND' + CR_LF +
      '  (B.IDPESSOA = PB.IDPESSOA)' + CR_LF +
      'ORDER BY' + CR_LF +
      '  B.NUMBANCO, A.NUMAGENCIA');
End;

Function TCtrlListTerceirosRH.ListIdAgencia_e_NumBanco(IdAgencia: double): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  IDBANCO, NUMAGENCIA' + CR_LF +
      'FROM' + CR_LF +
      '  AGENCIABANCARIA' + CR_LF +
      'WHERE' + CR_LF +
      '  (IDPESSOA = ' + FloatToStr(IdAgencia) + ')');
End;

Function TCtrlListTerceirosRH.ListImagemPessoa(IdPessoa: double): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  IMG.IMAGEM' + CR_LF +
      'FROM' + CR_LF +
      '  PESSOA P, IMAGENS IMG' + CR_LF +
      'WHERE' + CR_LF +
      '  (P.IDPESSOA = ' + FloatToStr(IdPessoa) + ') AND' + CR_LF +
      '  (P.IDIMAGEM = IMG.IDIMAGEM)');
End;

Function TCtrlListTerceirosRH.ListImagem(IdImagem: double): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  IMAGEM' + CR_LF +
      'FROM' + CR_LF +
      '  IMAGENS' + CR_LF +
      'WHERE' + CR_LF +
      '  (IDIMAGEM = ' + FloatToStr(IdImagem) + ')');
End;

Function TCtrlListTerceirosRH.ListContatoPessoaJuridica(IdPessoa: double): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  C.IDCONTATO, C.NOME' + CR_LF +
      'FROM' + CR_LF +
      '  PESSOA PJ, ENDPESS E, CONTATOPESS C' + CR_LF +
      'WHERE' + CR_LF +
      '  (PJ.IDPESSOA       = ' + FloatToStr(IdPessoa) + ') AND' + CR_LF +
      '  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND' + CR_LF +
      '  (PJ.IDPESSOA       = E.IDPESSOA) AND' + CR_LF +
      '  (E.IDENDERECO      = C.IDENDERECO)' + CR_LF +
      'ORDER BY' + CR_LF +
      '  C.NOME');
End;

Function TCtrlListTerceirosRH.ListFaixaNivel(IdFaixaSalarial: double; IdEmpresa: integer): OleVariant;

Begin  {
   ' SELECT F.IDFAIXASALARIAL AS IDNIVEL, F.DATAEFETIV AS DATAEFETIVACAO, F.STEP1 AS NIVEL1, ' + CR_LF +
   ' F.STEP2 AS NIVEL2, F.STEP3 AS NIVEL3, F.STEP4 AS NIVEL4, F.STEP5 AS NIVEL5,         ' + CR_LF +
   ' F.STEP6 AS NIVEL6, F.STEP7 AS NIVEL7, F.STEP8 AS NIVEL8, F.STEP9 AS NIVEL9 ,        ' + CR_LF +
   ' F.STEP10 AS NIVEL10, F.STEP11 AS NIVEL11, F.STEP12 AS NIVEL12,                        ' + CR_LF +
   ' F.STEP13 AS NIVEL13, F.STEP14 AS NIVEL14, F.STEP15 AS NIVEL15, F.STEP16 AS NIVEL16, ' + CR_LF +
   ' F.STEP17 AS NIVEL17, F.STEP18 AS NIVEL18, F.STEP19 AS NIVEL19, F.STEP20 AS NIVEL20  ' + CR_LF +
   ' FROM                                                                                        ' + CR_LF +
   ' FAIXASAL F WHERE F.IDFAIXASALARIAL ='+ FloatToStr(IdFaixaSalarial) +CR_LF +
   ' UNION }

      //William Santana SOL: 199707 - KINTANA: 1922320
   Result := GetDataPacket(
   ' SELECT                                                 ' + CR_LF +
   ' CODIGO as IDNIVEL,                                     ' + CR_LF +
   ' (T.DATAEFETIVACAO) ,                                   ' + CR_LF +
   ' SUM(DECODE(T.IDFAIXASALEXT, 1, VALOR, 0)) NIVEL1,      ' + CR_LF +
   ' SUM(DECODE(T.IDFAIXASALEXT, 2, VALOR, 0)) NIVEL2,      ' + CR_LF +
   ' SUM(DECODE(T.IDFAIXASALEXT, 3, VALOR, 0)) NIVEL3,      ' + CR_LF +
   ' SUM(DECODE(T.IDFAIXASALEXT, 4, VALOR, 0)) NIVEL4,      ' + CR_LF +
   ' SUM(DECODE(T.IDFAIXASALEXT, 5, VALOR, 0)) NIVEL5,      ' + CR_LF +
   ' SUM(DECODE(T.IDFAIXASALEXT, 6, VALOR, 0)) NIVEL6,      ' + CR_LF +
   ' SUM(DECODE(T.IDFAIXASALEXT, 7, VALOR, 0)) NIVEL7,      ' + CR_LF +
   ' SUM(DECODE(T.IDFAIXASALEXT, 8, VALOR, 0)) NIVEL8,      ' + CR_LF +
   ' SUM(DECODE(T.IDFAIXASALEXT, 9, VALOR, 0)) NIVEL9,       ' + CR_LF +
   ' SUM(DECODE(T.IDFAIXASALEXT, 10, VALOR, 0)) NIVEL10,     ' + CR_LF +
   ' SUM(DECODE(T.IDFAIXASALEXT, 11, VALOR, 0)) NIVEL11,     ' + CR_LF +
   ' SUM(DECODE(T.IDFAIXASALEXT, 12, VALOR, 0)) NIVEL12,     ' + CR_LF +
   ' SUM(DECODE(T.IDFAIXASALEXT, 13, VALOR, 0)) NIVEL13,     ' + CR_LF +
   ' SUM(DECODE(T.IDFAIXASALEXT, 14, VALOR, 0)) NIVEL14,     ' + CR_LF +
   ' SUM(DECODE(T.IDFAIXASALEXT, 15, VALOR, 0)) NIVEL15,     ' + CR_LF +
   ' SUM(DECODE(T.IDFAIXASALEXT, 16, VALOR, 0)) NIVEL16,     ' + CR_LF +
   ' SUM(DECODE(T.IDFAIXASALEXT, 17, VALOR, 0)) NIVEL17,     ' + CR_LF +
   ' SUM(DECODE(T.IDFAIXASALEXT, 18, VALOR, 0)) NIVEL18,      ' + CR_LF +
   ' SUM(DECODE(T.IDFAIXASALEXT, 19, VALOR, 0)) NIVEL19,      ' + CR_LF +
   ' SUM(DECODE(T.IDFAIXASALEXT, 20, VALOR, 0)) NIVEL20       ' + CR_LF +
   ' FROM                                                                                      ' + CR_LF +
   ' (SELECT   S.IDFAIXASALEXT, SUM(S.VALOR) valor, DATAEFETIVACAO,  ROUND(IDNIVEL/100) CODIGO ' + CR_LF +
   '     FROM (SELECT DATAEFETIVACAO, IDNIVEL,                                                 ' + CR_LF +
   '     MOD(IDNIVEL, 100) AS IDFAIXASALEXT,  SUM(VALOR) VALOR                                 ' + CR_LF +
   '     FROM FAIXANIVEL                                                                       ' + CR_LF +
   '     WHERE                                                                                 ' + CR_LF +
   '     (IDNIVEL BETWEEN ' + FloatToStr(IdFaixaSalarial) + ' * 100 + 1                        ' + CR_LF +
   '     AND ' + FloatToStr(IdFaixaSalarial) + ' * 100 + 20)                                   ' + CR_LF +
   '     AND (IDPESSJUR = ' + FloatToStr(IdEmpresa)+ ')                                        ' + CR_LF +
   '     GROUP BY DATAEFETIVACAO, IDNIVEL                                                      ' + CR_LF +
   '     ORDER BY DATAEFETIVACAO DESC, IDNIVEL) S                                              ' + CR_LF +
   '     GROUP BY S.DATAEFETIVACAO, S.IDFAIXASALEXT, (ROUND(S.IDNIVEL/100)) ) T                ' + CR_LF +
   '     GROUP BY T.DATAEFETIVACAO , T.Codigo                                                  ' + CR_LF +
   '     ORDER BY DATAEFETIVACAO DESC ');

     {
      'SELECT' + CR_LF +
      '  DATAEFETIVACAO, MOD(IDNIVEL,100) AS IDFAIXASALEXT, VALOR' + CR_LF +
      'FROM' + CR_LF +
      '  FAIXANIVEL' + CR_LF +
      'WHERE' + CR_LF +
      '  (IDNIVEL BETWEEN ' + FloatToStr(IdFaixaSalarial) +
      ' * 100 + 1 AND ' + FloatToStr(IdFaixaSalarial) + ' * 100 + 20) AND' + CR_LF +   // Edilaine Ferraresi - SOL 171426 / KTN 1537613 - 9 para 20
      '  (IDPESSJUR = ' + FloatToStr(IdEmpresa) + ')' + CR_LF +
      'ORDER BY' + CR_LF +
      '  DATAEFETIVACAO DESC, IDNIVEL');    }

    //END - William Santana SOL: 199707 - KINTANA: 1922320
End;

Function TCtrlListTerceirosRH.ListCamposCM(GrupoArquivo: String): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  G.CODGRUPOARQUIVO, C.IDCAMPO, C.NOMEDOCAMPO,' + CR_LF +
      '  C.DESCRICAODOCAMPO, G.DESCGRUPOARQUIVO' + CR_LF +
      'FROM' + CR_LF +
      '  CMPBD C, CMPBDGRP CG, GRPARQUIVO G' + CR_LF +
      'WHERE' + CR_LF +
      IFF(GrupoArquivo <> '',
      '  (G.CODGRUPOARQUIVO = ' + QuotedStr(GrupoArquivo) + ') AND' + CR_LF,
      '') +
      '  (C.CAMPODOBANCO   >= 1) AND' + CR_LF +
      '  (G.CODGRUPOARQUIVO = CG.CODGRUPOARQUIVO) AND' + CR_LF +
      '  (C.IDCAMPO         = CG.IDCAMPO(+))' + CR_LF +
      'ORDER BY' + CR_LF +
      '  CG.CODGRUPOARQUIVO, C.DESCRICAODOCAMPO');
End;

Function TCtrlListTerceirosRH.ListTabela_Generica_E_Longa(NomeTabela: String): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  C.CODTABELA AS CODGRUPOFORMULA,' + CR_LF +
      '  C.CODCAMPO AS IDFORMULA,' + CR_LF +
      '  C.DESCRICAO AS DESCRICAOFORMULA,' + CR_LF +
      '  ''(Genérica) '' || RTRIM(T.DESCRICAO) AS DESCGRUPOFORMULA' + CR_LF +
      'FROM' + CR_LF +
      '  TABGENER T, CAMPOTABGENER C' + CR_LF +
      'WHERE' + CR_LF +
      IFF(NomeTabela <> '',
      '  (T.CODTABELA = ' + QuotedStr(NomeTabela) + ') AND' + CR_LF,
      '') +
      '  (T.CODTABELA = C.CODTABELA)' + CR_LF +
      'UNION' + CR_LF +
      'SELECT' + CR_LF +
      '  T.DESCRICAO AS CODGRUPOFORMULA,' + CR_LF +
      '  C.DESCRICAO AS IDFORMULA,' + CR_LF +
      '  C.DESCRICAO AS DESCRICAOFORMULA,' + CR_LF +
      '  ''(Longa)    '' || RTRIM(T.DESCRICAO) AS DESCGRUPOFORMULA' + CR_LF +
      'FROM' + CR_LF +
      '  LONGTABGENER T, LONGCMPTABGENER C' + CR_LF +
      'WHERE' + CR_LF +
      IFF(NomeTabela <> '',
      '  (T.DESCRICAO = ' + QuotedStr(NomeTabela) + ') AND' + CR_LF,
      '') +
      '  (T.IDTABELA  = C.IDTABELA)' + CR_LF +
      'ORDER BY' + CR_LF +
      '  DESCGRUPOFORMULA, DESCRICAOFORMULA');
End;

Function TCtrlListTerceirosRH.ListRegras: OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  IDREGRA, RTRIM(NOMEREGRA) AS NOMEREGRA' + CR_LF +
      'FROM' + CR_LF +
      '  REGRA' + CR_LF +
      'ORDER BY' + CR_LF +
      '  NOMEREGRA');
End;

Function TCtrlListTerceirosRH.ListGrupoRegra: OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  IDTIPOREGRA, DESCREGRA' + CR_LF +
      'FROM' + CR_LF +
      '  TIPOREGRA' + CR_LF +
      'ORDER BY' + CR_LF +
      '  DESCREGRA');
End;

Function TCtrlListTerceirosRH.ListRegraXGrupo(IdRegra: double): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  R.IDREGRA, R.NOMEREGRA, R.IDTIPOREGRA, T.SQLREGRA, T.DESCREGRA' + CR_LF +
      'FROM' + CR_LF +
      '  REGRA R, TIPOREGRA T' + CR_LF +
      'WHERE' + CR_LF +
      '  (R.IDREGRA     = ' + FloatToStr(IdRegra) + ') AND' + CR_LF +
      '  (R.IDTIPOREGRA = T.IDTIPOREGRA)' + CR_LF +
      'ORDER BY' + CR_LF +
      '  T.DESCREGRA');
End;

Function TCtrlListTerceirosRH.ListPessoaPorTipo(Tipo: String): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  IDPESSOA, NOME' + CR_LF +
      'FROM' + CR_LF +
      '  PESSOA' + CR_LF +
      'WHERE' + CR_LF +
      '  (TIPO = ' + QuotedStr(Tipo) + ')' + CR_LF +
      'ORDER BY' + CR_LF +
      '  NOME');
End;

Function TCtrlListTerceirosRH.ListEmpresaForn(IdEmpresa: integer; IdFornecedor: double): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  CONTACDESPESA, CONTACFORN, PLANO, CODSUBCONTA' + CR_LF +
      'FROM' + CR_LF +
      '  EMPRESAFORN' + CR_LF +
      'WHERE' + CR_LF +
      '  (IDFORCLI = ' + FloatToStr(IdFornecedor) + ') AND' + CR_LF +
      '  (IDPESSOA = ' + IntToStr(IdEmpresa) + ')');
End;

Function TCtrlListTerceirosRH.ListDocumentoEmBranco: OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  0 AS CODDOCUMENTO, 0 AS PLANO, ''123456789012345678'' AS PLACONTA, 0 AS PLNCODIGO,' + CR_LF +
      '  0 AS NUMLANCTO, 0 AS UNIDNEGOC, ''1234567890'' AS CODCENTRORESPON, 0 AS VALOR,' + CR_LF +
      '  ''123456789012345'' AS CODTIPRECDES, 0 AS CODPORTFORMA, ''C'' AS DEBCRE,' + CR_LF +
      '  1 AS PORTFORMAPARTICIP, ''1234567890'' AS CODCENTROCUSTO' + CR_LF +
      'FROM' + CR_LF +
      '  DUAL' + CR_LF +
      'WHERE' + CR_LF +
      '  (1 = 2)');
End;

Function TCtrlListTerceirosRH.ListEndereco(IdPessoa: double): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      //'  EP.LOGRADOURO, EP.NUMERO, EP.COMPLEMENTO,' + CR_LF +                              //Everson Cunha - SIG123342
      '  EP.LOGRADOURO, regexp_replace(EP.NUMERO, ''\D'')NUMERO, EP.COMPLEMENTO,' + CR_LF +  //Everson Cunha - SIG123342
      '  EP.BAIRRO, CI.NOME AS CIDADE, EP.CODESTADO, EP.CEP' + CR_LF +
      'FROM' + CR_LF +
      '  ENDPESS EP, CIDADES CI' + CR_LF +
      'WHERE' + CR_LF +
      '  (EP.IDPESSOA  = ' + FloatToStr(IdPessoa) + ') AND' + CR_LF +
      '  (EP.IDCIDADES = CI.IDCIDADES(+))');
End;

Function TCtrlListTerceirosRH.ListTipoDadoTabGener: OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  IDTIPODADO, NOMETIPODADO' + CR_LF +
      'FROM' + CR_LF +
      '  TIPODADO');
End;

Function TCtrlListTerceirosRH.ListPatrocinadora: OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  PA.IDPESSOA, P.NOME' + CR_LF +
      'FROM' + CR_LF +
      '  PESSOA P, PATRO PA' + CR_LF +
      'WHERE' + CR_LF +
      '  (PA.IDPESSOA = P.IDPESSOA)' + CR_LF +
      'ORDER BY' + CR_LF +
      '  P.NOME');
End;

Function TCtrlListTerceirosRH.ListPlanoPrev: OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  IDPLANOPREV, NOME' + CR_LF +
      'FROM' + CR_LF +
      '  PLANPREV' + CR_LF +
      'ORDER BY' + CR_LF +
      '  NOME');
End;

Function TCtrlListTerceirosRH.ListCargoEx: OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  IDCARGOEXT, TITULO' + CR_LF +
      'FROM' + CR_LF +
      '  CARGOEXT' + CR_LF +
      'ORDER BY' + CR_LF +
      '  TITULO');
End;

Function TCtrlListTerceirosRH.ListImovel: OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT IM.*, IMM.IMONOME AS IMOVELMESTRE, CI.NOME AS CIDADE, ES.CODESTADO AS UF' + CR_LF +
      'FROM' + CR_LF +
      '  IMOVEL IM, IMOVEL IMM, CIDADES CI, ESTADO ES' + CR_LF +
      'WHERE IM.FLGATIVO = 1' + CR_LF +
      'AND   IM.IDIMOVELMESTRE = IMM.IDIMOVEL(+)' + CR_LF +
      'AND   IM.IDCIDADES      = CI.IDCIDADES(+)' + CR_LF +
      'AND   CI.IDESTADO       = ES.IDESTADO(+)' + CR_LF +
      'ORDER BY' + CR_LF +
      '  UPPER(IM.IMONOME)');
End;

Function TCtrlListTerceirosRH.ListContaBancaria(IdPessoa: double): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT PC.CODPORTADOR, PC.NOCONTACORR, PC.DESCRICAO, PC.FLGSTATUS,' + CR_LF +
      '       P1.NOME AS AGENCIA, AG.NUMAGENCIA, P2.NOME AS BANCO, BC.NUMBANCO' + CR_LF +
      'FROM' + CR_LF +
      '  PORTADORCONTA PC, PESSOA P1, PESSOA P2, AGENCIABANCARIA AG, BANCO BC' + CR_LF +
      'WHERE PC.IDAGENCIA = AG.IDPESSOA' + CR_LF +
      'AND   AG.IDBANCO   = BC.IDPESSOA' + CR_LF +
      'AND   AG.IDPESSOA  = P1.IDPESSOA' + CR_LF +
      'AND   BC.IDPESSOA  = P2.IDPESSOA' + CR_LF +
      'AND   PC.FLGSTATUS = ''A''' + CR_LF +
      IFF(IdPessoa = 0, '', 'AND PC.IDPESSOA  = ' + FloatToStr(IdPessoa) + CR_LF) +
      'ORDER BY' + CR_LF +
      '  UPPER(PC.DESCRICAO)');
End;

Function TCtrlListTerceirosRH.ListContaBancariaTerceiros(IdPessoa, IdConta: double): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT P3.NOME AS TITULAR, CB.IDCBANCARIA, CB.CONTACORRENTE, CB.FLGCONTAPREF,' + CR_LF +
      '       P1.NOME AS AGENCIA, AG.NUMAGENCIA, P2.NOME AS BANCO, BC.NUMBANCO,' + CR_LF +
      '       CB.IDPESSOA, CB.TIPOCONTA, CB.FLGCONTACONJUNTA' + CR_LF +
      'FROM' + CR_LF +
      '  CONTABANCARIA CB, PESSOA P1, PESSOA P2, PESSOA P3, AGENCIABANCARIA AG, BANCO BC' + CR_LF +
      'WHERE (CB.IDAGENCIA = AG.IDPESSOA) AND' + CR_LF +
      '      (AG.IDBANCO   = BC.IDPESSOA) AND' + CR_LF +
      '      (AG.IDPESSOA  = P1.IDPESSOA) AND' + CR_LF +
      '      (BC.IDPESSOA  = P2.IDPESSOA) AND' + CR_LF +
      '      (CB.IDPESSOA  = P3.IDPESSOA)' + CR_LF +
      IFF(IdPessoa = 0, '', 'AND   CB.IDPESSOA  = ' + FloatToStr(IdPessoa) + CR_LF) +
      IFF(IdConta = 0, '', 'AND   CB.IDCBANCARIA  = ' + FloatToStr(IdConta) + CR_LF) +
      'ORDER BY' + CR_LF +
      '  TITULAR, BANCO, AGENCIA, CONTACORRENTE');
End;

Function TCtrlListTerceirosRH.ListContaBancariaDepJud(IdPortador: double): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT PC.CODPORTADOR, PC.NOCONTACORR, PC.DESCRICAO, PC.FLGSTATUS,' + CR_LF +
      '       P1.NOME AS AGENCIA, AG.NUMAGENCIA, P2.NOME AS BANCO, BC.NUMBANCO' + CR_LF +
      'FROM' + CR_LF +
      '  PORTADORCONTA PC, PESSOA P1, PESSOA P2, AGENCIABANCARIA AG, BANCO BC' + CR_LF +
      'WHERE PC.IDAGENCIA = AG.IDPESSOA' + CR_LF +
      'AND   AG.IDBANCO   = BC.IDPESSOA' + CR_LF +
      'AND   AG.IDPESSOA  = P1.IDPESSOA' + CR_LF +
      'AND   BC.IDPESSOA  = P2.IDPESSOA' + CR_LF +
      'AND   PC.FLGSTATUS = ''A''' + CR_LF +
      IFF(IdPortador = 0, '', 'AND PC.CODPORTADOR  = ' + FloatToStr(IdPortador) + CR_LF) +
      'ORDER BY UPPER(PC.DESCRICAO)');
End;

Function TCtrlListTerceirosRH.ValorImovel(IdImovel: double): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT SUM(IMOVLRREAVAL) AS VLRMERCADO,' + CR_LF +
      '       MAX(IMODATAREAVAL) AS DATAMERCADO,' + CR_LF +
      '       IDIMOVELMESTRE AS IDIMOVEL' + CR_LF +
      'FROM IMOVEL' + CR_LF +
      'WHERE' + CR_LF +
      IFF(IdImovel = 0, '', '       IDIMOVELMESTRE = ' + FloatToStr(IdImovel) + ' AND' + CR_LF) +
      '       IDIMOVELMESTRE IS NOT NULL' + CR_LF +
      'GROUP BY IDIMOVELMESTRE' + CR_LF +
      'UNION' + CR_LF +
      'SELECT IMOVLRREAVAL AS VLRMERCADO,' + CR_LF +
      '       IMODATAREAVAL AS DATAMERCADO,' + CR_LF +
      '       IDIMOVEL' + CR_LF +
      'FROM IMOVEL' + CR_LF +
      'WHERE' + CR_LF +
      IFF(IdImovel = 0, '', '       IDIMOVEL = ' + FloatToStr(IdImovel) + ' AND' + CR_LF) +
      '       IDIMOVEL NOT IN (SELECT DISTINCT IDIMOVELMESTRE' + CR_LF +
      '                        FROM IMOVEL' + CR_LF +
      '                        WHERE IDIMOVELMESTRE IS NOT NULL)' + CR_LF +
      'ORDER BY 3');
End;

Function TCtrlListTerceirosRH.ValorPenhorado(Id: double; Tipo: integer): double;
Var
   _CdsAux: TCMClientDataSet;
Begin
   _CdsAux := TCMClientDataSet.Create(Nil);

   _CdsAux.Data := GetDataPacket(
      'SELECT SUM(VALORREC) AS VALORPENHORADO' + CR_LF +
      'FROM ETAPAPROCTRAB' + CR_LF +
      'WHERE' + CR_LF +
      IFF(Tipo = 1, '  IDIMOVEL = ', IFF(Tipo = 2, '  IDBEM = ', IFF(Tipo = 3, '  IDCONJUNTO = ',
      IFF(Tipo = 4, '  IDINVESTIMENTO = ', '  IDFUNDOINVEST = ')))) + FloatToStr(Id));

   Result := _CdsAux.FieldByName('VALORPENHORADO').asFloat;

   _CdsAux.Free;
End;

Procedure TCtrlListTerceirosRH.ValorContabil(Id: double; IdEmpresa, Tipo: integer;
   Var Valor: double; Var DataContabil: String);
Var
   _CdsAux: TCMClientDataSet;
Begin
   _CdsAux := TCMClientDataSet.Create(Nil);

   If (Tipo = 1) Then // Bem
      _CdsAux.Data := GetDataPacket(
         'SELECT B.DATAULTDEP AS DATACONTABIL,' + CR_LF +
         '       (SB.VALORG + SB.CMBEM - SB.DEPLANC - SB.CMDEP +' + CR_LF +
         '        SB.REAVVALORG + SB.REAVCMBEM - SB.REAVDEPLANC - SB.REAVCMDEP +' + CR_LF +
         '        SB.ULTREAVVALORG + SB.ULTREAVCMBEM - SB.ULTREAVDEPLANC - SB.ULTREAVCMDEP)' + CR_LF +
         '       AS VALORCONTABIL' + CR_LF +
         'FROM (SELECT SCB.IDBEM, SCB.IDPESSOA, SCB.DATASLDBEM,' + CR_LF +
         '             SCB.VALORG, SCB.REAVVALORG, SCB.ULTREAVVALORG,' + CR_LF +
         '             SCB.CMBEM, SCB.REAVCMBEM, SCB.ULTREAVCMBEM,' + CR_LF +
         '             SCD.DEPLANC, SCD.REAVDEPLANC, SCD.ULTREAVDEPLANC,' + CR_LF +
         '             SCD.CMDEP, SCD.REAVCMDEP, SCD.ULTREAVCMDEP' + CR_LF +
         '      FROM SALDOCONTABBEM SCB, SLDCTBBEMXDEP SCD, PARAMGLOBAL PG,' + CR_LF +
         '           (SELECT SC.IDBEM, SC.IDPESSOA, MAX(SC.DATASLDBEM) AS DATA' + CR_LF +
         '            FROM SALDOCONTABBEM SC, PARAMGLOBAL PG' + CR_LF +
         '            WHERE (SC.IDBEM = ' + FloatToStr(Id) + ')' + CR_LF +
         '              AND (SC.DATASLDBEM <= SYSDATE+1)' + CR_LF +
         '              AND (SC.MOECODIGO = PG.MOEDACORRENTE)' + CR_LF +
         '              AND (SC.IDPESSOA = ' + IntToStr(IdEmpresa) + ')' + CR_LF +
         '              AND (PG.IDPESSOA = ' + IntToStr(IdEmpresa) + ')' + CR_LF +
         '            GROUP BY SC.IDBEM, SC.IDPESSOA) ULTDTA' + CR_LF +
         '      WHERE (SCB.IDBEM = ' + FloatToStr(Id) + ')' + CR_LF +
         '        AND (SCB.MOECODIGO = PG.MOEDACORRENTE)' + CR_LF +
         '        AND (PG.IDPESSOA = ' + IntToStr(IdEmpresa) + ')' + CR_LF +
         '        AND (SCB.IDPESSOA = ' + IntToStr(IdEmpresa) + ')' + CR_LF +
         '        AND (SCB.IDBEM = ULTDTA.IDBEM)' + CR_LF +
         '        AND (SCB.DATASLDBEM = ULTDTA.DATA)' + CR_LF +
         '        AND (SCB.IDPESSOA = ULTDTA.IDPESSOA)' + CR_LF +
         '        AND (SCD.IDSLDCTBBEMXDEP = 1)' + CR_LF +
         '        AND (SCD.IDBEM = SCB.IDBEM)' + CR_LF +
         '        AND (SCD.DATASLDBEM = SCB.DATASLDBEM)' + CR_LF +
         '        AND (SCD.MOECODIGO = SCB.MOECODIGO)' + CR_LF +
         '        AND (SCD.IDPESSOA = SCB.IDPESSOA) ) SB,' + CR_LF +
         '     BEM B' + CR_LF +
         'WHERE (B.IDBEM = ' + FloatToStr(Id) + ')' + CR_LF +
         '  AND (B.IDPESSOA = ' + IntToStr(IdEmpresa) + ')' + CR_LF +
         '  AND (SB.IDBEM = B.IDBEM)' + CR_LF +
         '  AND (SB.IDPESSOA = B.IDPESSOA)')
   Else // Conjunto
      _CdsAux.Data := GetDataPacket(
         'SELECT SB.IDCONJUNTO, MAX(SB.DATASLDBEM) AS DATACONTABIL,' + CR_LF +
         '       ROUND(SUM(SB.VALORG + SB.CMBEM - SB.DEPLANC - SB.CMDEP + ' + CR_LF +
         '                 SB.REAVVALORG + SB.REAVCMBEM - SB.REAVDEPLANC - SB.REAVCMDEP + ' + CR_LF +
         '                 SB.ULTREAVVALORG + SB.ULTREAVCMBEM - ' + CR_LF +
         '                 SB.ULTREAVDEPLANC - SB.ULTREAVCMDEP) ,2) AS VALORCONTABIL' + CR_LF +
         'FROM (SELECT B.IDCONJUNTO, SCB.IDBEM, SCB.IDPESSOA, SCB.DATASLDBEM,' + CR_LF +
         '             SCB.VALORG, SCB.REAVVALORG, SCB.ULTREAVVALORG,' + CR_LF +
         '             SCB.CMBEM, SCB.REAVCMBEM, SCB.ULTREAVCMBEM,' + CR_LF +
         '             SCD.DEPLANC, SCD.REAVDEPLANC, SCD.ULTREAVDEPLANC,' + CR_LF +
         '             SCD.CMDEP, SCD.REAVCMDEP, SCD.ULTREAVCMDEP' + CR_LF +
         '      FROM SALDOCONTABBEM SCB, SLDCTBBEMXDEP SCD, PARAMGLOBAL PG,' + CR_LF +
         '           BEM B, CONJUNTO C,' + CR_LF +
         '           (SELECT SC.IDBEM, SC.IDPESSOA, MAX(SC.DATASLDBEM) AS DATA' + CR_LF +
         '            FROM SALDOCONTABBEM SC, PARAMGLOBAL PG' + CR_LF +
         '            WHERE (SC.DATASLDBEM <= SYSDATE+1)' + CR_LF +
         '              AND (SC.MOECODIGO = PG.MOEDACORRENTE)' + CR_LF +
         '              AND (SC.IDPESSOA = ' + IntToStr(IdEmpresa) + ')' + CR_LF +
         '              AND (PG.IDPESSOA = ' + IntToStr(IdEmpresa) + ')' + CR_LF +
         '            GROUP BY SC.IDBEM, SC.IDPESSOA) ULTDTA' + CR_LF +
         '      WHERE (B.IDCONJUNTO = ' + FloatToStr(Id) + ')' + CR_LF +
         '        AND (B.IDPESSOA = ' + IntToStr(IdEmpresa) + ')' + CR_LF +
         '        AND (B.IDCONJUNTO = C.IDCONJUNTO)' + CR_LF +
         '        AND (B.IDPESSOA = C.IDPESSOA)' + CR_LF +
         '        AND (B.IDBEM = SCB.IDBEM)' + CR_LF +
         '        AND (B.IDPESSOA = SCB.IDPESSOA)' + CR_LF +
         '        AND (SCB.MOECODIGO = PG.MOEDACORRENTE)' + CR_LF +
         '        AND (PG.IDPESSOA = ' + IntToStr(IdEmpresa) + ')' + CR_LF +
         '        AND (SCB.IDBEM = ULTDTA.IDBEM)' + CR_LF +
         '        AND (SCB.DATASLDBEM = ULTDTA.DATA)' + CR_LF +
         '        AND (SCB.IDPESSOA = ULTDTA.IDPESSOA)' + CR_LF +
         '        AND (SCD.IDSLDCTBBEMXDEP = 1)' + CR_LF +
         '        AND (SCD.IDBEM = SCB.IDBEM)' + CR_LF +
         '        AND (SCD.DATASLDBEM = SCB.DATASLDBEM)' + CR_LF +
         '        AND (SCD.MOECODIGO = SCB.MOECODIGO)' + CR_LF +
         '        AND (SCD.IDPESSOA = SCB.IDPESSOA) ) SB' + CR_LF +
         'GROUP BY SB.IDCONJUNTO');

   Valor := _CdsAux.FieldByName('VALORCONTABIL').asFloat;
   DataContabil := _CdsAux.FieldByName('DATACONTABIL').asString;

   _CdsAux.Free;
End;

Function TCtrlListTerceirosRH.ListEventoImovelVazio: OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  IDIMOVEL, IDEVENTOIMOVEL, EVIDATA, EVIDESCRICAO, FLGTIPOEVENTO, EVIPERCENT,' + CR_LF +
      '  EVIVLRAJUSTADO, EVICABECALHO' + CR_LF +
      'FROM' + CR_LF +
      '  EVENTOIMOVEL' + CR_LF +
      'WHERE (2 = 1)');
End;

// Query para Buscar o Plano e Patrocinadora
// Podendo só gravar o IDPLANPREVCTBPATR, o investimento reconhece pelo ID dessa tabela.

Function TCtrlListTerceirosRH.ListPlanoPatro(IdPlanPrevPatr: double): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '   PA.IDPLANPREVCTBPATR,' + CR_LF +
      '   PA.IDPLANOPREV,' + CR_LF +
      '   PA.IDPATRO,' + CR_LF +
      '   (PL.NOME ||'' - ''|| PE.NOME) AS PLANPRVCONTABPATRO' + CR_LF +
      'FROM' + CR_LF +
      '   PESSOA PE,' + CR_LF +
      '   PLANPREVCONTABPATRO PA,' + CR_LF +
      '   PLANPREVCONTABIL PL' + CR_LF +
      'WHERE' + CR_LF +
      IFF(IdPlanPrevPatr = 0, '', '   (IDPLANPREVCTBPATR = ' + FloatToStr(IdPlanPrevPatr) + ') AND' + CR_LF) +
      '   (PA.IDPATRO = PE.IDPESSOA(+))  AND' + CR_LF +
      '   (PA.IDPLANOPREV = PL.IDPLANOPREV)' + CR_LF +
      'ORDER BY PLANPRVCONTABPATRO');
End;

Function TCtrlListTerceirosRH.ListTipoInvestimento: OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT * FROM TIPOINVEST' + CR_LF +
      'WHERE (IDTIPOINVEST = 1 OR IDTIPOINVEST > 4)' + CR_LF +
      'AND   (IDTIPOINVEST <> 8)' + CR_LF +
      'ORDER BY DESCTIPOINVEST');
End;

Function TCtrlListTerceirosRH.ListClasseRendaFixa: OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT * FROM CLASSETITRENFIX' + CR_LF +
      'ORDER BY DESCCLASSETIT');
End;

Function TCtrlListTerceirosRH.ListCustodiante: OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT * FROM CUSTODIANTE' + CR_LF +
      'ORDER BY SGLCUSTODIANTE');
End;

Function TCtrlListTerceirosRH.ListTipoCota: OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT IDTIPOCOTA, DESCTIPOCOTA' + CR_LF +
      'FROM TIPOCOTA' + CR_LF +
      'ORDER BY DESCTIPOCOTA');
End;

Function TCtrlListTerceirosRH.ListInvestimento(Tipo, Classe: double): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  IDINVESTIMENTO, DESCINVESTIMENTO, IDCLASSETIT' + CR_LF +
      'FROM' + CR_LF +
      '  INVESTIMENTO' + CR_LF +
      IFF(Tipo = 0, '', 'WHERE (IDTIPOINVEST = ' + FloatToStr(Tipo) + ')' + CR_LF) +
      IFF(Classe = 0, '', 'AND   (IDCLASSETIT = ' + FloatToStr(Classe) + ')' + CR_LF) +
      'ORDER BY' + CR_LF +
      '  UPPER(DESCINVESTIMENTO)');
End;

Function TCtrlListTerceirosRH.ListFundoInvestimento(Tipo: String): OleVariant;
Begin
   //-- Renan Cristiano SOL 130680 Kintana 737344 Inicio.
   Result := GetDataPacket(
      'SELECT X.IDFUNDOINVEST, X.DESCFUNDOINVEST AS DESCINVESTIMENTO, X.IDTIPOFUNDOINVEST ' + CR_LF +
      'FROM FUNDOINVEST X, TIPOINVEST W, TIPOFUNDOINVEST Z ' + CR_LF +
      'WHERE W.IDTIPOINVEST = Z.IDTIPOINVEST AND ' + CR_LF +
      '      X.IDTIPOFUNDOINVEST = Z.IDTIPOFUNDOINVEST AND ' + CR_LF +
      '      Z.IDTIPOINVEST IN (' + Tipo + ')' + CR_LF +
      'ORDER BY UPPER(X.DESCFUNDOINVEST)');

   {
    'SELECT' +CR_LF+
    '  IDFUNDOINVEST, DESCFUNDOINVEST AS DESCINVESTIMENTO,' +CR_LF+
    '  IDTIPOFUNDOINVEST' +CR_LF+
    'FROM' +CR_LF+
    '  FUNDOINVEST A' +CR_LF+
    IFF(Tipo='', '', 'WHERE (IDTIPOFUNDOINVEST IN ('+Tipo+'))' +CR_LF)+
    'ORDER BY' +CR_LF+
    '  UPPER(DESCFUNDOINVEST)');   }
    //-- Renan Cristiano SOL 130680 Kintana 737344 Fim.
End;

Function TCtrlListTerceirosRH.ListAplicacao(IDPLANPREVCTBPATR, IDINVESTIMENTO,
   IDCUSTODIANTE, DATAHISTRENFIX: String): OleVariant;
Var
   DATAINI: String; // DIA UTIL ANTERIOR A :DATAHISTRENFIX
Begin
   DATAINI := DateToStr(StrToDate(DATAHISTRENFIX) - 1);
   If DayOfWeek(StrToDate(DATAINI)) = 1 Then
      DATAINI := DateToStr(StrToDate(DATAINI) - 1);
   If DayOfWeek(StrToDate(DATAINI)) = 7 Then
      DATAINI := DateToStr(StrToDate(DATAINI) - 1);

   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '   CL.DESCCLASSETIT,' + CR_LF +
      '   IV.DESCINVESTIMENTO AS INVESTIMENTO,' + CR_LF +
      '   PP.PLANPRVCONTABPATRO AS PLANOPATRO,' + CR_LF +
      '   TO_DATE(' + QuotedStr(DATAHISTRENFIX) + ',''DD/MM/YYYY'') AS DATASALDO, HR.IDOPERRENFIXAPLIC,' + CR_LF +
      '   DECODE(OPERAP.DATAOPERACAO,NULL,OP.DATAOPERACAO,OPERAP.DATAOPERACAO) AS DATAAPLICACAO,' + CR_LF +
      '   HO.DATAVENCTOATU AS DATAVENCIMENTO,' + CR_LF +
      '   TO_NUMBER(DECODE(IV.IDCLASSETIT, PV.IDCLASSETIT, NULL, HR.SALDOQTDHISTRENFI)) AS SALDOQUANTIDADE,' + CR_LF +
      '   HR.SALDOVLRHISTRENFI AS SALDOVALOR' + CR_LF +
      'FROM' + CR_LF +
      '   HISTRENFIX HR, OPERRENFIX OP, INVESTIMENTO IV, EMISSOR EM, PARAMINVEST PV, CARTEIRASPC CS,' + CR_LF +
      '   CLASSRISCORENFIX CR, CLASSETITRENFIX CL, HISTOPERRENFIX HO,' + CR_LF +
      '   (SELECT PA.IDPLANPREVCTBPATR, (''Plano / Patrocinadora: '' || PL.NOME ||'' - ''|| PE.NOME) AS PLANPRVCONTABPATRO' + CR_LF +
      '    FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL' + CR_LF +
      '    WHERE (PA.IDPATRO = PE.IDPESSOA(+))' + CR_LF +
      '      AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PP,' + CR_LF +
      '   (SELECT IDOPERRENFIX, IDOPERRENFIXAPLIC, NVL(QTDCARTHIPO,0) AS QTDCARTHIPO' + CR_LF +
      '    FROM OPERRENFIX' + CR_LF +
      '    WHERE IDOPERRENFIX IN (SELECT MAX(IDOPERRENFIX)' + CR_LF +
      '                       FROM OPERRENFIX' + CR_LF +
      '                       GROUP BY IDOPERRENFIXAPLIC)) OP2,' + CR_LF +
      '   (SELECT OPE.DATAOPERACAO,OPI.IDOPERRENFIX,OPI.BOLETA' + CR_LF +
      '    FROM OPERRENFIX OPI,' + CR_LF +
      '      (SELECT OP.DATAOPERACAO, OP.IDOPERRENFIXAPLIC,OPA.BOLETA, OPA.IDOPERRENFIX' + CR_LF +
      '       FROM OPERRENFIX OP,' + CR_LF +
      '         (SELECT OP1.IDOPERRENFIXAPLIC, OP1.BOLETA, OP1.IDOPERRENFIX' + CR_LF +
      '          FROM OPERRENFIX OP1, INVESTIMENTO IV' + CR_LF +
      '          WHERE (OP1.IDTIPOOPERACAO = -97)' + CR_LF +
      IFF(IDINVESTIMENTO = '', '', '            AND (OP1.IDINVESTIMENTO = ' + IDINVESTIMENTO + ')' + CR_LF) +
      '            AND ((' + IDPLANPREVCTBPATR + ' IS NULL) OR (OP1.IDPLANPREVCTBPATR = ' + IDPLANPREVCTBPATR + '))' + CR_LF +
      '            AND (OP1.DATAOPERACAO BETWEEN TO_DATE(' + QuotedStr(DATAINI) + ',''DD/MM/YYYY'') AND' + CR_LF +
      '                                          TO_DATE(' + QuotedStr(DATAHISTRENFIX) + ',''DD/MM/YYYY''))' + CR_LF +
      '            AND (OP1.IDINVESTIMENTO = IV.IDINVESTIMENTO)) OPA' + CR_LF +
      '       WHERE' + CR_LF +
      '          (OP.IDOPERRENFIX = OPA.IDOPERRENFIXAPLIC) AND' + CR_LF +
      '          (OP.IDOPERRENFIX = OP.IDOPERRENFIXAPLIC)) OPE' + CR_LF +
      '    WHERE' + CR_LF +
      '       (OPI.BOLETA = OPE.BOLETA) AND' + CR_LF +
      '       (OPI.IDOPERRENFIXorig = OPE.IDOPERRENFIXAPLIC) AND' + CR_LF +
      '       (OPI.IDTIPOOPERACAO = -98)) OPERAP,' + CR_LF +
      '   (SELECT NVL(DECODE(NVL(HT.VLRACUITEM,0),0,HT.PUACUITEM,HT.VLRACUITEM),0) AS VLRACUIOF,' + CR_LF +
      '           H.IDHISTRENFIX' + CR_LF +
      '    FROM HISTRENFIXXITENS HT, HISTRENFIX H, INVESTIMENTO IV, HISTOPERRENFIX HO' + CR_LF +
      '    WHERE (H.DATAHISTRENFIX BETWEEN TO_DATE(' + QuotedStr(DATAINI) + ',''DD/MM/YYYY'') AND' + CR_LF +
      '                                    TO_DATE(' + QuotedStr(DATAHISTRENFIX) + ',''DD/MM/YYYY''))' + CR_LF +
      '      AND ((H.DATAHISTRENFIX - HO.DATAVIGENCIA) < 30)' + CR_LF +
      IFF(IDINVESTIMENTO = '', '', '      AND (H.IDINVESTIMENTO = ' + IDINVESTIMENTO + ')' + CR_LF) +
      '      AND ((' + IDPLANPREVCTBPATR + ' IS NULL) OR (H.IDPLANPREVCTBPATR = ' + IDPLANPREVCTBPATR + '))' + CR_LF +
      '      AND (HT.IDITEMRENFIX = -8)' + CR_LF +
      '      AND H.IDINVESTIMENTO = IV.IDINVESTIMENTO' + CR_LF +
      '      AND HT.IDHISTRENFIX = H.IDHISTRENFIX' + CR_LF +
      '      AND H.IDOPERRENFIXAPLIC = HO.IDOPERRENFIX )IOF' + CR_LF +
      'WHERE ((' + IDPLANPREVCTBPATR + ' IS NULL) OR (HR.IDPLANPREVCTBPATR = ' + IDPLANPREVCTBPATR + '))' + CR_LF +
      IFF(IDINVESTIMENTO = '', '', '  AND (HR.IDINVESTIMENTO = ' + IDINVESTIMENTO + ')' + CR_LF) +
      IFF(IDCUSTODIANTE = '', '', '  AND (OP.IDCUSTODIANTE = ' + IDCUSTODIANTE + ')' + CR_LF) +
      '  AND ((OP.VENCOPERACAO >= TO_DATE(' + QuotedStr(DATAINI) + ',''DD/MM/YYYY'')) OR (OP.VENCOPERACAO IS NULL))' + CR_LF +
      '  AND (HR.IDHISTRENFIX IN (SELECT DECODE(2,1,DECODE(H.IDTIPOOPERACAO,-98,NULL,H.IDHISTRENFIX),H.IDHISTRENFIX)' + CR_LF +
      '                           FROM' + CR_LF +
      '                              (SELECT DECODE(2,1,MIN(H1.IDHISTRENFIX), MAX(H1.IDHISTRENFIX)) AS IDHISTRENFIX' + CR_LF +
      '                              FROM HISTRENFIX H1' + CR_LF +
      '                              WHERE (H1.DATAHISTRENFIX BETWEEN TO_DATE(' + QuotedStr(DATAINI) + ',''DD/MM/YYYY'') AND' + CR_LF +
      '                                                               TO_DATE(' + QuotedStr(DATAHISTRENFIX) + ',''DD/MM/YYYY''))' + CR_LF +
      IFF(IDINVESTIMENTO = '', '', '                                AND (H1.IDINVESTIMENTO = ' + IDINVESTIMENTO + ')' + CR_LF) +
      '                                AND ((' + IDPLANPREVCTBPATR + ' IS NULL) OR (H1.IDPLANPREVCTBPATR = ' + IDPLANPREVCTBPATR + '))' + CR_LF +
      '                                AND ((H1.DATAHISTRENFIX || H1.IDINVESTIMENTO || H1.IDOPERRENFIXAPLIC || H1.IDPLANPREVCTBPATR) IN' + CR_LF +
      '                                            (SELECT MAX(H2.DATAHISTRENFIX) || H2.IDINVESTIMENTO || H2.IDOPERRENFIXAPLIC || H2.IDPLANPREVCTBPATR' + CR_LF +
      '                                             FROM HISTRENFIX H2' + CR_LF +
      '                                             WHERE (H2.DATAHISTRENFIX BETWEEN TO_DATE(' + QuotedStr(DATAINI) + ',''DD/MM/YYYY'') AND' + CR_LF +
      '                                                                              TO_DATE(' + QuotedStr(DATAHISTRENFIX) + ',''DD/MM/YYYY''))' + CR_LF +
      '                                               AND ((' + IDPLANPREVCTBPATR + ' IS NULL) OR (H2.IDPLANPREVCTBPATR = ' + IDPLANPREVCTBPATR + '))' + CR_LF +
      '                                             GROUP BY H2.IDINVESTIMENTO, H2.IDOPERRENFIXAPLIC, H2.IDPLANPREVCTBPATR))' + CR_LF +
      '                              GROUP BY H1.DATAHISTRENFIX, H1.IDINVESTIMENTO, H1.IDOPERRENFIXAPLIC, H1.IDPLANPREVCTBPATR)H2,' + CR_LF +
      '                              HISTRENFIX H' + CR_LF +
      '                          WHERE H.IDHISTRENFIX = H2.IDHISTRENFIX))' + CR_LF +
      '  AND (HR.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR)' + CR_LF +
      '  AND (HR.IDINVESTIMENTO = IV.IDINVESTIMENTO)' + CR_LF +
      '  AND (IV.IDEMISSOR = EM.IDEMISSOR)' + CR_LF +
      '  AND (IV.IDCLASSETIT = CL.IDCLASSETIT)' + CR_LF +
      '  AND (HR.IDOPERRENFIXAPLIC = OP.IDOPERRENFIX)' + CR_LF +
      '  AND (HR.IDOPERRENFIXAPLIC = OP2.IDOPERRENFIXAPLIC)' + CR_LF +
      '  AND (OP.IDCLASSRISCORENFIX = CR.IDCLASSRISCORENFIX(+))' + CR_LF +
      '  AND (HR.IDOPERRENFIX = OPERAP.IDOPERRENFIX(+))' + CR_LF +
      '  AND ((HR.SALDOQTDHISTRENFI > 0) OR ((HR.IDTIPOOPERACAO <> -98) AND (2 = 1)))' + CR_LF +
      '  AND (CS.IDCARTEIRASPC(+) = IV.IDCARTEIRASPC)' + CR_LF +
      '  AND (HR.IDHISTRENFIX = IOF.IDHISTRENFIX(+))' + CR_LF +
      '  AND (HO.IDOPERRENFIX = OP.IDOPERRENFIXAPLIC)' + CR_LF +
      '  AND (HO.DATAVIGENCIA = (SELECT MAX(HO1.DATAVIGENCIA)' + CR_LF +
      '                          FROM HISTOPERRENFIX HO1' + CR_LF +
      '                          WHERE HO1.IDOPERRENFIX = OP.IDOPERRENFIXAPLIC' + CR_LF +
      '                            AND TRUNC(DATAVIGENCIA) <= TO_DATE(' + QuotedStr(DATAHISTRENFIX) + ',''DD/MM/YYYY'')))' + CR_LF +
      'ORDER BY PP.PLANPRVCONTABPATRO, DATAHISTRENFIX, CL.DESCCLASSETIT,EM.SIGLAEMISSOR,' + CR_LF +
      '         CR.NIVELCLASSRISCO, IV.DESCINVESTIMENTO, OP.DATAOPERACAO');
End;

Function TCtrlListTerceirosRH.ListFundoSaldo(IDPLANPREVCTBPATR, IDTIPOINVEST, IDTIPOFUNDOINVEST,
   IDFUNDOINVEST, DATAMOVFUNDO: String): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT /*+INDEX (H1.XPKHISTFUNDO)*/' + CR_LF +
      'SUM(H1.SALDOQTDCOTAS) AS SALDOQTDCOTAS , SUM(H1.SALDOVLRFUNDO) AS SALDOVLRFUNDO,' + CR_LF +
      'SUM(H1.SALDOVLRFUNDO)-SUM(NVL(H1.VLRIOFPROV,0)) AS SALDOLIQUIDO,' + CR_LF +
      'SUM(H1.SALDOQTDCOTASBLQ) AS SALDOQTDCOTASBLQ' + CR_LF +
      'FROM HISTFUNDO H1' + CR_LF +
      'WHERE' + CR_LF +
      '(H1.IDHISTFUNDO IN (SELECT /*+INDEX (HF.XIE1HISTFUNDO)*/ MAX(HF.IDHISTFUNDO) AS IDHISTFUNDO' + CR_LF +
      'FROM HISTFUNDO HF,' + CR_LF +
      '    (SELECT HF1.IDFUNDOINVEST, HF1.IDTIPOFUNDOINVEST' + CR_LF +
      '     FROM HISTFUNDOINVEST HF1' + CR_LF +
      '     WHERE (HF1.IDTIPOFUNDOINVEST || HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,''DD/MM/YYYY, HH24:MI:SS'') IN' + CR_LF +
      '           (SELECT HF.IDTIPOFUNDOINVEST || HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENCIA),''DD/MM/YYYY, HH24:MI:SS'')' + CR_LF +
      '            FROM HISTFUNDOINVEST HF,' + CR_LF +
      '                 (SELECT TF.IDTIPOFUNDOINVEST' + CR_LF +
      '                  FROM   TIPOFUNDOINVEST TF' + CR_LF +
      '                  WHERE' + CR_LF +
      '                      (TF.IDTIPOINVEST      = ' + IDTIPOINVEST + ')' + CR_LF +
      '                  AND (TF.IDTIPOFUNDOINVEST = ' + IDTIPOFUNDOINVEST + ')  ) TF' + CR_LF +
      '            WHERE' + CR_LF +
      '                 (HF.IDTIPOFUNDOINVEST = ' + IDTIPOFUNDOINVEST + ')' + CR_LF +
      '            AND  (HF.IDFUNDOINVEST     = ' + IDFUNDOINVEST + ')' + CR_LF +
      '            AND (HF.DTAVIGENCIA        < TO_DATE(' + QuotedStr(DATAMOVFUNDO) + ', ''DD/MM/YYYY'')+1)' + CR_LF +
      '            AND (HF.IDTIPOFUNDOINVEST  = TF.IDTIPOFUNDOINVEST)' + CR_LF +
      '            GROUP BY HF.IDTIPOFUNDOINVEST, HF.IDFUNDOINVEST)) ) FI' + CR_LF +
      'WHERE' + CR_LF +
      '(HF.IDTIPOINVEST      = ' + IDTIPOINVEST + ') AND' + CR_LF +
      '(HF.IDPLANPREVCTBPATR = ' + IDPLANPREVCTBPATR + ') AND' + CR_LF +
      '(HF.IDFUNDOINVEST     = ' + IDFUNDOINVEST + ') AND' + CR_LF +
      '(HF.DATAMOVFUNDO      = TO_DATE(' + QuotedStr(DATAMOVFUNDO) + ', ''DD/MM/YYYY'')) AND' + CR_LF +
      '(HF.TIPMOVFUNDO      <>''PIR'') AND ' + CR_LF +
      '(FI.IDFUNDOINVEST     = HF.IDFUNDOINVEST) ' + CR_LF +
      'GROUP BY HF.IDTIPOINVEST, HF.IDPLANPREVCTBPATR, HF.IDFUNDOINVEST, HF.DATAAPLICACAO, HF.IDTIPOCOTA)) AND' + CR_LF +
      '(H1.SALDOQTDCOTAS > 0) AND' + CR_LF +
      '(H1.IDCOMPOSICAOFUNDO IS NULL) ');
End;

Function TCtrlListTerceirosRH.ListPrograma: OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT IDPROGRAMA, DESCPROGRAMA FROM PROGRAMA');
End;

Function TCtrlListTerceirosRH.ListFormaRecPag(RecPag: String; IdEmpresa: integer): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT CODFORMA, DESCRICAO FROM FORMARECPAG' + CR_LF +
      'WHERE RECPAG = ' + QuotedStr(RecPag) + CR_LF +
      'AND IDPESSOA = ' + IntToStr(IdEmpresa) + CR_LF +
      'ORDER BY DESCRICAO');
End;

Function TCtrlListTerceirosRH.RegraEmUso(IdRegra: double): boolean;
Var
   _CdsAux: TCMClientDataSet;
Begin
   _CdsAux := TCMClientDataSet.Create(Nil);

   _CdsAux.Data := GetDataPacket(
      'SELECT' + CR_LF +
      '  COUNT(*) AS NUM' + CR_LF +
      'FROM' + CR_LF +
      '  PROVDESC PD, VW_RUBXEVENTO RXE ' + CR_LF +  // inicio - edilaine - SOL 191668 / KTN 1820235
      'WHERE' + CR_LF +
      '  (PD.IDPROVENTO   = RXE.IDPROVENTO(+)) AND '+ CR_LF +
      '  ((PD.IDREGRA          = ' + FloatToStr(IdRegra) + ') OR' + CR_LF +
      '   (RXE.IDREGRA13       = ' + FloatToStr(IdRegra) + ') OR' + CR_LF +
      '   (RXE.IDREGRAFERIAS   = ' + FloatToStr(IdRegra) + ') OR' + CR_LF +
      '   (RXE.IDREGRARESCISAO = ' + FloatToStr(IdRegra) + '))');
      // fim - edilaine - SOL 191668 / KTN 1820235
   Result := (_CdsAux.FieldByName('NUM').asFloat > 0);

   _CdsAux.Free;
End;

Function TCtrlListTerceirosRH.GetMascaraPlano(IdPlano: integer): String;
Var
   _CdsAux: TCMClientDataSet;
Begin
   _CdsAux := TCMClientDataSet.Create(Nil);

   _CdsAux.Data := GetDataPacket('SELECT MASCARA FROM PLANO WHERE (PLANO = ' +
      IntToStr(IdPlano) + ')');

   Result := _CdsAux.FieldByName('MASCARA').asString;

   _CdsAux.Free;
End;

Function TCtrlListTerceirosRH.GetPlano(IdEmpresa: double): integer;
Var
   _CdsAux: TCMClientDataSet;
Begin
   _CdsAux := TCMClientDataSet.Create(Nil);

   _CdsAux.Data := GetDataPacket('SELECT PLANO FROM PARAMCONTAB WHERE (IDPESSOA = ' +
      FloatToStr(IdEmpresa) + ')');

   Result := _CdsAux.FieldByName('PLANO').asInteger;

   _CdsAux.Free;
End;

Function TCtrlListTerceirosRH.GetIdPlanoOrcamentario(IdEmpresa: double): double;
Var
   _CdsAux: TCMClientDataSet;
Begin
   _CdsAux := TCMClientDataSet.Create(Nil);

   _CdsAux.Data := GetDataPacket(
      'SELECT' + CR_LF +
      ' IDPLANOORCAMEN' + CR_LF +
      'FROM' + CR_LF +
      '  PARAMORCAMENTO' + CR_LF +
      'WHERE' + CR_LF +
      '  (IDPESSOA = ' + FloatToStr(IdEmpresa) + ')');

   Result := _CdsAux.FieldByName('IDPLANOORCAMEN').asFloat;

   _CdsAux.Free;
End;

Function TCtrlListTerceirosRH.GetIdContraCheque: integer;
Var
   _CdsAux: TCMClientDataSet;
Begin
   _CdsAux := TCMClientDataSet.Create(Nil);

   _CdsAux.Data := GetDataPacket('SELECT IDCONTRACHEQUE FROM PARAMAPREV');
   Result := _CdsAux.FieldByName('IDCONTRACHEQUE').asInteger;

   If (Result = 0) Then
      Result := 99; // Parãmetro Padrão

   _CdsAux.Free;
End;

Function TCtrlListTerceirosRH.GetIdPatro(IdEmpresa: double): integer;
Var
   _CdsAux: TCMClientDataSet;
Begin
   _CdsAux := TCMClientDataSet.Create(Nil);

   _CdsAux.Data := GetDataPacket('SELECT IDPATRO FROM PARAMGLOBAL');
   Result := _CdsAux.FieldByName('IDPATRO').asInteger;

   _CdsAux.Free;
End;

Function TCtrlListTerceirosRH.GetIdPlanoPrev(IdEmpresa: double): integer;
Var
   _CdsAux: TCMClientDataSet;
Begin
   _CdsAux := TCMClientDataSet.Create(Nil);

   _CdsAux.Data := GetDataPacket('SELECT NVL(IDPLANOPREVADM,IDPLANOPREV) AS IDPLANOPREV FROM PARAMGLOBAL');
   Result := _CdsAux.FieldByName('IDPLANOPREV').asInteger;

   _CdsAux.Free;
End;

Function TCtrlListTerceirosRH.GetPortadorFormaPadrao: integer;
Var
   _CdsAux: TCMClientDataSet;
Begin
   _CdsAux := TCMClientDataSet.Create(Nil);

   _CdsAux.Data := GetDataPacket('SELECT CODPORTFORMA FROM BANCOPORTFOLHA WHERE (IDBANCO IS NULL)');
   Result := _CdsAux.FieldByName('CODPORTFORMA').asInteger;

   _CdsAux.Free;
End;

Function TCtrlListTerceirosRH.GetNumeroPlanilha(PlnCodigo: double): double;
Var
   _CdsAux: TCMClientDataSet;
Begin
   _CdsAux := TCMClientDataSet.Create(Nil);

   _CdsAux.Data := GetDataPacket(
      'SELECT' + CR_LF +
      '  PLNPLANIL' + CR_LF +
      'FROM' + CR_LF +
      '  PLANILHA' + CR_LF +
      'WHERE' + CR_LF +
      '  (PLNCODIGO = ' + FloatToStr(PlnCodigo) + ')');

   Result := _CdsAux.FieldByName('PLNPLANIL').asFloat;

   _CdsAux.Free;
End;

Function TCtrlListTerceirosRH.GetContaBancariaFavorecido(IdFavorecido: double): integer;
Var
   _CdsAux: TCMClientDataSet;
Begin
   _CdsAux := TCMClientDataSet.Create(Nil);

   _CdsAux.Data := GetDataPacket('SELECT IDCBANCARIA FROM CONTABANCARIA' + CR_LF +
      'WHERE (IDPESSOA     = ' + FloatToStr(IdFavorecido) + ') AND' + CR_LF +
      '      (FLGCONTAPREF = 1)');
   Result := _CdsAux.FieldByName('IDCBANCARIA').asInteger;

   _CdsAux.Free;
End;

Function TCtrlListTerceirosRH.GetIdProgramaCCusto(CodCentroCusto: String; IdEmpresa: integer): integer;
Var
  _Temp : Integer;
begin
  //Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
  Try
    Result := GetIdProgramaCCusto(CodCentroCusto, IdEmpresa, _Temp);
  Except
    Result := -1;
  End;
End;

Function TCtrlListTerceirosRH.GetIdProgramaCCusto(CodCentroCusto: String; IdEmpresa: integer; Var AIdProgramaOrcamen : Integer): integer;
Var
   _CdsAux: TCMClientDataSet;
Begin
   //Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
   _CdsAux := TCMClientDataSet.Create(Nil);
   Try
     _CdsAux.Data := GetDataPacket('SELECT C.IDPROGRAMA, '                                          + CR_LF +
                                   '       NVL(P.IDPROGRAMAORCAMEN, -1) IDPROGRAMAORCAMEN '         + CR_LF +
                                   '  FROM CENTCUST C,'                                             + CR_LF +
                                   '       PROGRAMA P '                                             + CR_LF +
                                   ' WHERE (C.CODCENTROCUSTO = ' + QuotedStr(CodCentroCusto) + ') ' + CR_LF +
                                   '   AND (C.IDEMPRESA      = ' + IntToStr(IdEmpresa)       + ') ' + CR_LF +
                                   '   AND (C.IDPROGRAMA     = P.IDPROGRAMA)');
     //
     Result             := _CdsAux.FieldByName('IDPROGRAMA'       ).AsInteger;
     AIdProgramaOrcamen := _CdsAux.FieldByName('IDPROGRAMAORCAMEN').AsInteger;

     _CdsAux.Close;
   Finally
     _CdsAux.Free;
   End;
End;

Function TCtrlListTerceirosRH.GetIdTipoProcesso(IdUsuario: double; IdReferencia: integer): integer;
Var
   _CdsAux: TCMClientDataSet;
Begin
   _CdsAux := TCMClientDataSet.Create(Nil);

   _CdsAux.Data := GetDataPacket(
      'SELECT' + CR_LF +
      '  TP.IDTIPOPROCESSO' + CR_LF +
      'FROM' + CR_LF +
      '  RADTIPOPROCESSO TP, RADRESPONXGRP GR' + CR_LF +
      'WHERE' + CR_LF +
      '  (TP.IDREFERENCIA      = ' + IntToStr(IdReferencia) + ') AND' + CR_LF +
      '  (GR.IDUSUARIO         = ' + FloatToStr(IdUsuario) + ') AND' + #13 +
      '  (TP.IDGRPCRIAPROCESSO = GR.IDGRPRESPON)');

   Result := _CdsAux.FieldByName('IDTIPOPROCESSO').asInteger;

   _CdsAux.Free;
End;

Function TCtrlListTerceirosRH.GetFlgOk_RAD(IdProcesso: double): String;
Var
   _CdsAux: TCMClientDataSet;
Begin
   _CdsAux := TCMClientDataSet.Create(Nil);

   _CdsAux.Data := GetDataPacket(
      'SELECT' + CR_LF +
      '  FLGOK' + CR_LF +
      'FROM' + CR_LF +
      '  RADINSTPROCESSO' + CR_LF +
      'WHERE' + CR_LF +
      '  (IDPROCESSO = ' + FloatToStr(IdProcesso) + ')');
   Result := _CdsAux.FieldByName('FLGOK').asString;

   _CdsAux.Free;
End;

Function TCtrlListTerceirosRH.GetOpcaoTicket(Matricula: String): String;
Var
   _CdsAux: TCMClientDataSet;
Begin
   _CdsAux := TCMClientDataSet.Create(Nil);

   _CdsAux.Data := GetDataPacket(
      'SELECT' + CR_LF +
      '  DECODE(VT_OPC.VALOR,''AUXREST'',''Refeição'',''Alimentação'') OPCAO_TICKETS' + CR_LF +
      'FROM' + CR_LF +
      '  VALTABGENER VT_OPC, VALTABGENER VT_MAT' + CR_LF +
      'WHERE' + CR_LF +
      '  (VT_MAT.CODTABELA = ''OPCAOALIMENT'') AND' + CR_LF +
      '  (VT_OPC.CODTABELA = ''OPCAOALIMENT'') AND' + CR_LF +
      '  (VT_MAT.CODCAMPO  = ''MATRICULA'') AND' + CR_LF +
      '  (VT_OPC.CODCAMPO  = ''OPCAO'') AND' + CR_LF +
      '  (VT_MAT.VALOR     = ' + QuotedStr(Matricula) + ') AND' + CR_LF +
      '  (VT_MAT.NUMLINHA  = VT_OPC.NUMLINHA)');

   Result := _CdsAux.FieldByName('OPCAO_TICKETS').asString;

   _CdsAux.Free;
End;

Procedure TCtrlListTerceirosRH.GetPercREB_DataAssoc(Matricula: String; Var PercREB,
   DataAssoc: String);
Var
   _CdsAux: TCMClientDataSet;
Begin
   _CdsAux := TCMClientDataSet.Create(Nil);

   // Plano Atual
   _CdsAux.Data := GetDataPacket(
      'SELECT' + CR_LF +
      '  VT_PERC.VALOR PERCENTUAL,' + CR_LF +
      '  VT_DATA.VALOR DATASSOC' + CR_LF +
      'FROM' + CR_LF +
      '  VALTABGENER VT_PERC, VALTABGENER VT_DATA, VALTABGENER VT_MATR' + CR_LF +
      'WHERE' + CR_LF +
      '  (VT_PERC.CODTABELA = ''PERCNOVPLAN'') AND' + CR_LF +
      '  (VT_DATA.CODTABELA = ''PERCNOVPLAN'') AND' + CR_LF +
      '  (VT_MATR.CODTABELA = ''PERCNOVPLAN'') AND' + CR_LF +
      '  (VT_PERC.CODCAMPO  = ''PERCNOVPLAN'') AND' + CR_LF +
      '  (VT_DATA.CODCAMPO  = ''DATASSOC'') AND' + CR_LF +
      '  (VT_MATR.CODCAMPO  = ''MATRICULA'') AND' + CR_LF +
      '  (VT_MATR.VALOR     = ' + QuotedStr(Matricula) + ') AND' + CR_LF +
      '  (VT_MATR.NUMLINHA  = VT_PERC.NUMLINHA) AND' + CR_LF +
      '  (VT_MATR.NUMLINHA  = VT_DATA.NUMLINHA)');

   // Plano Antigo
   If _CdsAux.IsEmpty Then
      Begin
         _CdsAux.Data := GetDataPacket(
            'SELECT' + CR_LF +
            '  VT_PERC.VALOR PERCENTUAL,' + CR_LF +
            '  VT_DATA.VALOR DATASSOC' + CR_LF +
            'FROM' + CR_LF +
            '  VALTABGENER VT_PERC, VALTABGENER VT_DATA, VALTABGENER VT_MATR' + CR_LF +
            'WHERE' + CR_LF +
            '  (VT_PERC.CODTABELA = ''PERCEMPREB'') AND' + CR_LF +
            '  (VT_DATA.CODTABELA = ''PERCEMPREB'') AND' + CR_LF +
            '  (VT_MATR.CODTABELA = ''PERCEMPREB'') AND' + CR_LF +
            '  (VT_PERC.CODCAMPO  = ''PERCENTUAL'') AND' + CR_LF +
            '  (VT_DATA.CODCAMPO  = ''DATASSOC'') AND' + CR_LF +
            '  (VT_MATR.CODCAMPO  = ''MATRICULA'') AND' + CR_LF +
            '  (VT_MATR.VALOR     = ' + QuotedStr(Matricula) + ') AND' + CR_LF +
            '  (VT_MATR.NUMLINHA  = VT_PERC.NUMLINHA) AND' + CR_LF +
            '  (VT_MATR.NUMLINHA  = VT_DATA.NUMLINHA)');
      End;

   PercREB := _CdsAux.FieldByName('PERCENTUAL').asString;
   DataAssoc := _CdsAux.FieldByName('DATASSOC').asString;

   _CdsAux.Free;
End;

Function TCtrlListTerceirosRH.GetIdAgenciaBancaria(NumAgencia: String): double;
Var
   _CdsAux: TCMClientDataSet;
Begin
   _CdsAux := TCMClientDataSet.Create(Nil);

   _CdsAux.Data := GetDataPacket(
      'SELECT IDPESSOA' + CR_LF +
      'FROM   AGENCIABANCARIA' + CR_LF +
      'WHERE  (NUMAGENCIA = ' + QuotedStr(Trim(NumAgencia)) + ')');

   Result := _CdsAux.FieldByName('IDPESSOA').asFloat;

   _CdsAux.Free;
End;

Function TCtrlListTerceirosRH.GetNumProprietarios(IdEmpresa: double): integer;
Var
   _CdsAux: TCMClientDataSet;
Begin
   _CdsAux := TCMClientDataSet.Create(Nil);

   _CdsAux.Data := GetDataPacket(
      'SELECT NVL(COUNT(IDPESSOA),0) AS NUMPROP' + CR_LF +
      'FROM   FUNCIONARIO' + CR_LF +
      'WHERE (TIPOCONTRATO = ''P'') AND' + CR_LF +
      '      (IDEMPRESA    = ' + FloatToStr(IdEmpresa) + ')');

   Result := _CdsAux.FieldByName('NUMPROP').asInteger;

   _CdsAux.Free;
End;

Function TCtrlListTerceirosRH.GetPessoa_Documento(NumDocumento: String; IdDocumento: double): double;
Var
   _CdsAux: TCMClientDataSet;
Begin
   _CdsAux := TCMClientDataSet.Create(Nil);

   _CdsAux.Data := GetDataPacket(
      'SELECT IDPESSOA' + CR_LF +
      'FROM   DOCPESSOA' + CR_LF +
      'WHERE  (NUMDOCUMENTO = ' + QuotedStr(Trim(NumDocumento)) + ') AND' + CR_LF +
      '       (IDDOCUMENTO  = ' + FloatToStr(IdDocumento) + ')');

   Result := _CdsAux.FieldByName('IDPESSOA').asFloat;

   _CdsAux.Free;
End;

Function TCtrlListTerceirosRH.GetNumPlanilha(PlnCodigo: double): double;
Var
   _CdsAux: TCMClientDataSet;
Begin
   _CdsAux := TCMClientDataSet.Create(Nil);

   _CdsAux.Data := GetDataPacket(
      'SELECT PLNPLANIL' + CR_LF +
      'FROM   PLANILHA' + CR_LF +
      'WHERE  (PLNCODIGO = ' + FloatToStr(PlnCodigo) + ')');

   Result := _CdsAux.FieldByName('PLNPLANIL').asFloat;

   _CdsAux.Free;
End;

Function TCtrlListTerceirosRH.GetNomePessoa(IdPessoa: double): String;
Var
   _CdsAux: TCMClientDataSet;
Begin
   _CdsAux := TCMClientDataSet.Create(Nil);

   _CdsAux.Data := GetDataPacket(
      'SELECT NOME' + CR_LF +
      'FROM   PESSOA' + CR_LF +
      'WHERE (IDPESSOA = ' + FloatToStr(IdPessoa) + ')');

   Result := _CdsAux.FieldByName('NOME').asString;

   _CdsAux.Free;
End;

Function TCtrlListTerceirosRH.GetNomeAtividadeProjeto(UnidNegoc: integer): String;
Var
   _CdsAux: TCMClientDataSet;
Begin
   _CdsAux := TCMClientDataSet.Create(Nil);

   _CdsAux.Data := GetDataPacket('SELECT NOME FROM UNIDNEGOCIO WHERE (UNIDNEGOC = ' +
      IntToStr(UnidNegoc) + ')');

   Result := _CdsAux.FieldByName('NOME').asString;

   _CdsAux.Free;
End;

Function TCtrlListTerceirosRH.ListPortadorForma(Const RecPag: String): OleVariant;
Var
   sSql: String;
Begin
   sSql := ' SELECT ' + CR_LF;
   sSql := sSql + '   CODPORTFORMA, ' + CR_LF;
   sSql := sSql + '   CODPORTADOR, ' + CR_LF;
   sSql := sSql + '   CODFORMA, ' + CR_LF;
   sSql := sSql + '   DESCRICAO ' + CR_LF;
   sSql := sSql + ' FROM ' + CR_LF;
   sSql := sSql + '   PORTADORFORMA ' + CR_LF;
   If RecPag <> '' Then
      Begin
         sSql := sSql + ' WHERE ' + CR_LF;
         sSql := sSql + '   RECPAG = ' + QuotedStr(RecPag);
      End;
   // end if
   sSql := sSql + ' ORDER BY ' + CR_LF;
   sSql := sSql + '   DESCRICAO ' + CR_LF;

   Result := GetDataPacket(sSql);
End;

Function TCtrlListTerceirosRH.ListPlanoPrevCTB(Const idPatro: Integer): OleVariant;
Var
   sSql: String;
Begin
   sSql := ' select ' + CR_LF;
   sSql := sSql + '   ppc.IDPLANOPREV, ppc.NOME, ppcp.IDPATRO ' + CR_LF;
   sSql := sSql + ' from ' + CR_LF;
   sSql := sSql + '   PLANPREVCONTABIL ppc, ' + CR_LF;
   sSql := sSql + '   PLANPREVCONTABPATRO ppcp ' + CR_LF;
   sSql := sSql + ' where ' + CR_LF;
   sSql := sSql + '   ppc.IDPLANOPREV = ppcp.IDPLANOPREV ' + CR_LF;
   sSql := sSql + '   and ppc.ATIVO = ' + QuotedStr('S');
   If (idPatro > 0) Then
      sSql := sSql + '   and ppcp.IDPATRO = 0 ' + CR_LF;
   // end if
   sSql := sSql + ' ORDER BY ' + CR_LF;
   sSql := sSql + '   ppc.NOME ' + CR_LF;

   Result := GetDataPacket(sSql);
End;

Function TCtrlListTerceirosRH.ListCCustoAtivo(ListaIdEmpresa: String): OleVariant;
Begin
   Result := GetDataPacket(' SELECT RTRIM(CODCENTROCUSTO) AS CODCENTROCUSTO,  ' +
      ' RTRIM(NOME) AS NOME, ' +
      ' STATUSGRUPOCDC' +
      ' FROM CENTCUST ' +
      ' WHERE (IDEMPRESA   = ' + ListaIdEmpresa + ')' +
      ' AND ATIVO = ''S'' ' +
      ' ORDER BY NOME ');
End;

Function TCtrlListTerceirosRH.ListTipoCentroRepons(IdEmpresa: double;
   idUsuario, IdPessoa: String): OleVariant;
Var
   sSql: String;
Begin
   sSql := sSql + ' SELECT Distinct TRD.CODTIPRECDES,  TRD.DESCRICAO ' + CR_LF;
   sSql := sSql + ' FROM TIPORECEBDESEMB TRD ' + CR_LF;
   sSql := sSql + ' JOIN TRDXCRESPON TXC ON TRD.CODTIPRECDES = TXC.CODTIPRECDES AND TXC.RECPAG = TRD.RECPAG ' + CR_LF;
   sSql := sSql + ' JOIN PESSOAXCRESP PXC ON TXC.CODCENTRORESPON = PXC.CODCENTRORESPON ' + CR_LF;
   sSql := sSql + ' WHERE PXC.IDPESSOAACESSO = ' + idUsuario;
   sSql := sSql + ' ORDER BY TRD.DESCRICAO' + CR_LF;
   Result := GetDataPacket(sSql);
End;

// Intervalo usado somente pelo Jurídico - Paulo Nobre
// SOL 172550 KTN 1555163 - Paulo Nobre
Function TCtrlListTerceirosRH.ListTipoOperacaoJUR: OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  TIPCODIGO, TIPDESCRICAO' + CR_LF +
      'FROM' + CR_LF +
      '  TIPOPER' + CR_LF +
      'WHERE' + CR_LF +
      '  TO_NUMBER(TIPCODIGO) >= 40 AND TO_NUMBER(TIPCODIGO) <= 50 ' + CR_LF +
      'ORDER BY TIPCODIGO');
End;

// SOL 172550 KTN 1555163 - Paulo Nobre
Function TCtrlListTerceirosRH.ListTipProcJUR(IdPrograma: Integer): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT IdTipoProc, NomeTipoProc ' + CR_LF +
      'FROM TipoProcesso' + CR_LF +
      IFF(IdPrograma = 0, '', ' WHERE IdTipoProc   = ' + IntToStr(IdPrograma)) +
      'ORDER BY NomeTipoProc ');
End;

// SOL 172550 KTN 1555163 - Paulo Nobre
Function TCtrlListTerceirosRH.ListaCentroResponsabilidade(idUsuario: Integer): OleVariant;
Var
   sSql: String;
Begin
   sSql := ' SELECT PES.NOME, P.CODCENTRORESPON    ' + CR_LF;
   sSql := sSql + ' FROM USUARIOSISTEMA U, PESSOAXCRESP P, PESSOA PES ' + CR_LF;
   sSql := sSql + ' WHERE U.IDUSUARIO = P.IDPESSOAACESSO' + CR_LF;
   sSql := sSql + ' And P.IDPESSOA = 1' + CR_LF;
   sSql := sSql + ' And PES.IDPESSOA = U.IDUSUARIO' + CR_LF;
   sSql := sSql + ' And U.IDUSUARIO = ' + inttostr(idUsuario);
   Result := GetDataPacket(sSql);
End;

// SOL 172550 KTN 1555163 - Paulo Nobre
Function TCtrlListTerceirosRH.ListTipoDocRecPagEtapa(idDoc: Integer; sTipo: String): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  CODTIPDOC, DESCRICAO, DEBCRE,' +
      ' DECODE(RECPAG,''P'',''Pagar'',''Receber'') AS RECPAG' + CR_LF +
      'FROM' + CR_LF +
      '  TIPODOCRECPAG' + CR_LF +
      'WHERE CODTIPDOC   = ' + inttostr(idDoc) + CR_LF +
      'AND RECPAG   = ' + quotedstr(sTipo) + CR_LF +
      'ORDER BY DESCRICAO');
End;

// SOL 172550 KTN 1555163 - Paulo Nobre
Function TCtrlListTerceirosRH.ListPortadorFormaEtapa(IdPortForma: Integer; sTipo: String): OleVariant;
Var sSql: String;
Begin
// SOL 196976/13122 KTN 1886065 - Paulo Nobre
   sSql := ' SELECT ' + CR_LF;
   sSql := sSql + '   CODFORMA, ' + CR_LF;
   sSql := sSql + '   DESCRICAO, ' + CR_LF;
   sSql := sSql + '   RECPAG ' + CR_LF;
   sSql := sSql + ' FROM ' + CR_LF;
   sSql := sSql + '   FORMARECPAG ' + CR_LF;
   sSql := sSql + ' WHERE RECPAG = ' + quotedstr(sTipo);
   sSql := sSql + ' ORDER BY DESCRICAO ';
   Result := GetDataPacket(sSql);
// SOL 196976/13122 KTN 1886065 - Paulo Nobre
End;

// SOL 172550 KTN 1555163 - Paulo Nobre
Function TCtrlListTerceirosRH.ListaCentroCustoEtapa(CodCentroCusto: String): OleVariant;
Var sSql: String;
Begin
   sSql := ' SELECT RTRIM(CODCENTROCUSTO) AS CODCENTROCUSTO,  RTRIM(NOME) AS NOME ' + CR_LF;
   sSql := sSql + ' FROM CENTCUST ' + CR_LF;
   If CodCentroCusto = '0' Then
      sSql := sSql + ' WHERE CODCENTROCUSTO = ' + quotedstr(CodCentroCusto) + 'AND ' + CR_LF;
   sSql := sSql + '       IDEMPRESA  = 1 ' + CR_LF;
   sSql := sSql + '       AND STATUSGRUPOCDC = ''A'' ' + CR_LF;
   sSql := sSql + '       AND IDPLANCENTCUST = ''3'' ' + CR_LF;
   sSql := sSql + '       AND ATIVO = ''S''  ' + CR_LF;
   sSql := sSql + ' ORDER BY UPPER(NOME), CODCENTROCUSTO ';
   Result := GetDataPacket(sSql);
End;

// SOL 174225 KTN 1572025 - Paulo Nobre
Function TCtrlListTerceirosRH.ListaCentroResponsabilidadeJUR(idUsuario: Integer): OleVariant;
Var
   sSql: String;
Begin
   sSql := ' SELECT C.NOME, P.CODCENTRORESPON    ' + CR_LF;
   sSql := sSql + ' FROM USUARIOSISTEMA U, PESSOAXCRESP P, CENTRESPON C ' + CR_LF;
   sSql := sSql + ' WHERE U.IDUSUARIO = P.IDPESSOAACESSO' + CR_LF;
   sSql := sSql + ' And P.CODCENTRORESPON = C.CODCENTRORESPON' + CR_LF;
   sSql := sSql + ' And P.IDPESSOA = 1' + CR_LF;
   sSql := sSql + ' And U.IDUSUARIO = ' + inttostr(idUsuario);
   Result := GetDataPacket(sSql);
End;

// Início - William Santana - SOL: 224461/15703 - KIN: 2059184

Function TCtrlListTerceirosRH.listasistemacontrolepontoRAIS(): OleVariant;
Var
   sSql: String;
begin
   sSql := 'SELECT S.IDSISTEMACONTROLEPONTORAIS, S.DESCSISTEMACONTROLEPONTORAIS FROM SISTEMACONTROLEPONTORAIS S';

   Result := GetDataPacket(sSql);
end;

// Fim - William Santana - SOL: 224461/15703 - KIN: 2059184

// Felipe A. Santos SOL 207737 KTN 2018095 - inicio
function TCtrlListTerceirosRH.GetDirDoCentroCusto(
  CodCentroCusto: Integer) : OleVariant;
var
   sSQL : string;
begin
    sSQL := 'SELECT ' +
            ' DIR.NOME AS NOMEDIRETORIA, ' +
            ' DIR.CODCENTROCUSTO AS CODDIRETORIA ' +
            ' FROM ' +
            '(SELECT NOME, ' +
            '        CODCENTROCUSTO ' +
            '   FROM CENTCUST ' +
            '  WHERE SUBSTR(CODEXTERNO, 1, 2) = ' +
            '        (SELECT TRIM(SUBSTR(CODEXTERNO, 1, 2)) '+
            '           FROM CENTCUST ' +
            '          WHERE CODCENTROCUSTO = ' + IntToStr(CodCentroCusto) + ' ) ' +
            '   AND LENGTH(TRIM(CODEXTERNO)) = 2 ' +
            '   AND ATIVO = ''S'')  DIR';

   Result := GetDataPacket(sSQL);
end;
// Felipe A. Santos SOL 207737 KTN 2018095 - fim

function TCtrlListTerceirosRH.ListNaturezaJUR: OleVariant;
Var
   sSql: String;
Begin
   sSql := ' SELECT * FROM NATEMPRESA '; //HIGOR NAYDE FERREIRA SOL 229881/16647
   Result := GetDataPacket(sSql);
end;

function TCtrlListTerceirosRH.ListClassTrib: OleVariant;
Var
   sSql: String;
Begin
   sSql := ' SELECT IDCLASSTRIBUT, SUBSTR(DESCRICAO, 0,150) AS DESCRICAO FROM CLASSTRIBUT ';
   Result := GetDataPacket(sSql); //HIGOR NAYDE FERREIRA SOL 229881/16647
end;

function TCtrlListTerceirosRH.ListEnderecoResid(
  IdPessoa: integer): OleVariant;
var
  sSQL: String;
begin
  sSQL := 'SELECT EP.IDPESSOA, EP.IDENDERECO, REGEXP_REPLACE(EP.LOGRADOURO, ''( *[[:punct:]])'', '''') AS LOGRADOURO, ' +#13#10+
          '       TRIM(REGEXP_REPLACE(EP.NUMERO, ''( *[[:alpha:] [:space:]])'', ''0''))AS NUMERO,    ' +#13#10+
          '       EP.COMPLEMENTO,                                                                ' +#13#10+
          '       EP.BAIRRO, CI.NOME AS CIDADE, EP.CODESTADO, EP.CEP                             ' +#13#10+
          '  FROM ENDPESS EP                                                                     ' +#13#10+
          '  JOIN PESSOA PE ON PE.IDPESSOA = EP.IDPESSOA AND PE.IDENDRESIDENCIAL = EP.IDENDERECO ' +#13#10+
          '  LEFT JOIN CIDADES CI ON EP.IDCIDADES = CI.IDCIDADES                                 ' +#13#10+
          ' WHERE PE.IDPESSOA  = ' + IntToStr(IdPessoa);

  Result := GetDataPacket(sSQL);
end;

End.

