{-------------------------------------------------------------------------------
--------------------------------- ALTERAÇÕES -----------------------------------
--------------------------------------------------------------------------------

 N. SIG.............: 38475
 Data da Alteração..: 08/01/2021
 Responsável........: Everson Cunha
 Descrição..........: Melhorias/ajustes eSocial versão simplificada 1.0
--------------------------------------------------------------------------------
 N. SIG             : 94537
 Data da Alteração: : 30/12/2019
 Responsável:       : Fábio Sampaio
 Descrição          : Correção para atualizar matricula da DEPENTIT após a
                      atualização da informação na tabela FUNCIONARIO
--------------------------------------------------------------------------------
 N. SIG             : 90602
 Data da Alteração: : 20/08/2019
 Responsável:       : Everson Cunha
 Descrição          : Erro de Access violation at address 0340C322 in
                      module 'CmRHObj50.bpl' ao acessar ModFol >> Transações >>
                      Férias
--------------------------------------------------------------------------------
 N. SIG             : 70569
 Data da Alteração: : 08/08/2019
 Responsável:       : Everson Cunha
 Descrição          : Melhorias no cadastro de processos para adequação a
                      versão 2.4.02 do manual do eSocial
--------------------------------------------------------------------------------
 Rotina             : ProcessaOutros
 N. SIG..........   : SIG 77836 Tibero
 Data da Alteração: : 05/11/2018
 Alteração Form:    : uCtrlPessoaFuncionario
 Responsável:       : Everson Cunha
 Descrição.......   : Verificar se o CdsEstagiario e o CdsDadosCessao estão
                      instanciados antes de verificar se estão vazios.
--------------------------------------------------------------------------------
 Rotina             : ProcessaOutros .
 N. SIG..........   : 74938
 Data da Alteração: : 27/09/2018
 Alteração Form:    : uCtrlPessoaFuncionario
 Responsável:       : Andre Imakawa
 Descrição.......   : Correção para não alterar o IDESTAGIARIO quando o
                      funcionario não for estagiario.
--------------------------------------------------------------------------------
 Rotina             : Create
 N. SIG..........   : 64144
 Data da Alteração: : 05/03/2018
 Alteração Form:    : uCtrlPessoaFuncionario
 Responsável:       : Cássio Florêncio Rovaroto
 Descrição.......   : Inclusão de tratamento para a existência de manipulação
                      de dados de processo.
--------------------------------------------------------------------------------
 Rotina             : GetProxIdProcesso, GetProxIdProcessosXIndicativoSusp
 N. SIG..........   : 62232
 Data da Alteração: : 06/02/2018
 Alteração Form:    : uCtrlPessoaFuncionario
 Responsável:       : Cássio Florêncio Rovaroto e Everson Luiz Pereira da Cunha
 Descrição.......   : Correção nas funcções que retornam o ID para a tabela
                      PROCESSOS e PROCESSOSXINIDCATIVOSUSP
--------------------------------------------------------------------------------
 Rotina             : ListEstagiario
 N. SIG..........   : 62180
 Data da Alteração: : 24/01/2018
 Alteração Form:    : uCtrlPessoaFuncionario
 Responsável:       : Cássio Rovaroto
 Descrição.......   : Adequação da consulta que busca estagiário, para trazer
                      os dados de funcionário no cargo
                      AUXILIAR ADMINISTRATIVO - APRENDIZ, onde somente há o
                      preecnhimento de Agente de Integração.
--------------------------------------------------------------------------------
 Rotina             : Create, ProcessaOutros, ListFuncProcessos,
                      SelProcessosXIndicativoSusp, VerificaProcessoFuncionario,
                      VerificaExistenciaProcessoXIndicativo,
                      VerificaExistenciaProcesso, SelIndicativoSusp,
                      SelProcessosXIndicativoSusp,
                      GetProxIdProcessosXIndicativoSusp, GetProxIdProcessos.
 N. SIG..........   : 38475.59780
 Data da Alteração: : 11/12/2017
 Alteração Form:    : uCtrlPessoaFuncionario
 Responsável:       : Cássio Florêncio Rovaroto
 Descrição.......   : Adaptação da consulta que recupera os processos
                      Administrativos e/ou Judiciais de um funcionário.
--------------------------------------------------------------------------------
 Nº SIG...........: 20695
 Data da Alteração: 14/06/2013
 Alteração Form...: inclusão do filtro Estado Civil na busca
                    ListEmpresaFuncionario
 Responsável......: William Santana
 Descrição........: relatório de Ficha de anotações e atualizações da
                    CTPS - modelo2
--------------------------------------------------------------------------------
 Nº SOL: 250384.17324
 Nº PPM 1070235
 Data da Alteração: 24/02/2016
 Alteração Form: Leiaute e campos novos
 Responsável: Michelle Suellyn Mota
 Descrição: Mudança no leiaute e campos novos para adequar ao eSocial
--------------------------------------------------------------------------------
 Nº SOL......: 207737
 Nº KINTANA..: 2018095
 Data........: 15/08/2014
 Responsável.: Felipe A. Santos
 Descrição...: Criação dos metodos para listagem e modificação do metodo
               processaoutros para gravação referente a contrato temporário.
--------------------------------------------------------------------------------
 Nº SOL......: 211661/15807
 Nº KINTANA..: 2060908
 Data........: 22/09/2014
 Responsavel.: William Santana
 Descrição...: Padronização da nomenclatura quanto as opções de classificação
               de estado civíl.
--------------------------------------------------------------------------------
 Nº SOL............: 244940
 Nº PPM............: 610711
 Data da Alteração.: 15/12/2014
 Responsável.......: Fernando Xavier
 Descrição.........: Erro no cadastro de rescisões.
--------------------------------------------------------------------------------
 Nº SOL............: 211502.16259
 Nº PPM............: 442499
 Data da Alteração.: 28/10/2014
 Alteração Form....: Nova consulta para trazer imagem do documento de recisão
 Responsável.......: William Santana
 Descrição.........: Desenvolvimento do produto referente ao SOL 211502.
--------------------------------------------------------------------------------
 Nº SOL:            229871/16137
 Nº PPM:            407073
 Data da Alteração: 02/10/2014
 Alteração Form:    criado os cadastros de estágiario, dados cessão, Grau a
                    exposição a agentes nocivos, categoria de trabalhadores.
                    alteração nas abas ultimo emprego, endereço, dados pessoais.
 Responsável:       Felipe A. Santos
 Descrição:         criado os cadastros de estágiario, dados cessão, Grau a
                    exposição a agentes nocivos, categoria de trabalhadores.
                    alteração nas abas ultimo emprego, endereço, dados pessoais.
--------------------------------------------------------------------------------
 Nº SOL......: 201365
 Nº KINTANA..: 1965590
 Data........: 23/07/2013
 Responsável.: William Santana
 Descrição...: Inclusão da função ListPercRateio para mostrar campos
               "PERCRATALIMENTACAO" e "PERCRATREFEICAO" na nova aba 'Beneficios'
               Inclusão da função ListTipoBen para mostrar os tipos de
               beneficios;
--------------------------------------------------------------------------------
 Nº SOL......: 188194
 Nº KINTANA..: 1779198
 Data........: 08/04/2013
 Responsável.: Higor Nayde Ferreira
 Descrição...: Incluir novos campos das telas de Registro de Alteração Funcional
               e Cadastro de Pessoal
--------------------------------------------------------------------------------
 Nº SOL......: 188050
 Nº KINTANA..: 1797080
 Data........: 13/09/2012
 Responsável.: Otacilio
 Descrição...: Alteração na consulta Lista Empresa Funcionario
--------------------------------------------------------------------------------
 Nº SOL......: 170594
 Nº KINTANA..: 1521425
 Data........: 06/07/2012
 Responsável.: Douglas.Siqueira
 Descrição...: Descrição...: Relatório Recibo/Aviso de Férias
--------------------------------------------------------------------------------
 Rotina......: -
 Nº SOL......: 172600
 Nº KINTANA..: 1570562
 Data........: 14/02/2012
 Responsável.: Monica Gonzaga
 Descrição...: Ajuste no data de experiencia do fun, pois estava trazendo o
               valor errado.
--------------------------------------------------------------------------------
 Rotina.............: ListFuncAtivo
 N. Sol.............: 129826
 N. Kintana.........: 715518
 Data...............: 26/02/2010
 Responsável........: Bruno Bastos
 Descrição..........: Foi incluído o método ListFuncAtivo.
--------------------------------------------------------------------------------
 Rotina..........: ListSubordinados, ListNotInSubordinados, GravarNovoChefeFunc
 N. Sol..........: 90184
 N. Kintana......: 492704
 Data............: 21/01/2010
 Responsável.....: Marilza Colpani
 Descrição.......: Implementação na folha de pagamento,
                   para que em caso de alteração do gestor da unidade,alterar
                   também os cadastros dos empregados subordinados a este gestor
--------------------------------------------------------------------------------
 Rotina.............: -
 N. Sol.............: 73915
 N. Kintana.........: 524411
 Data...............: 23/10/2009
 Responsável........: Henrique Massao
 Descrição..........: Foram incluidos novos campos no controle de histórico de
                      alterações
--------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 02/08/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlPessoaFuncionario;

interface

uses SysUtils, Classes, Controls, Db, dbclient, IvDictio, uCMClientDataSet,
  CmEventosCadastro, uCMTypes, uCtrlPessoa, uCtrlCustomRH, uCtrlFuncoesRH, uCtrlRad,
  uCtrlMotivo, uCtrlListTerceirosRH, uDbFuncionario, uDbEstrangeiro, uDbUltEmpr,
  uDbEstagiario, uDbDadosCessao, uDbCategTrabaEsocial, uDbGrauExpAgentEsocial {// Felipe A. Santos SOL 229871.16137},
  uDbContratoTemp, uDbContratoTempSubst, uDbContratoTempObs, //Felipe A. Santos
  uDbProcessos, // Michelle Mota - SOL: 250384.17324 - PPM: 1070235
  wwQuery, uDbProcessosXIndicativoSusp;


const
  NUM_DOC_ALT = 3;
  NUM_CAD_ALT = 27;

type
  TDadosHist = record
    DataSit, DataAdmissao, DateFUNCAO: TDateTime;
    CodCentroCusto, TipoPagamento: string;
    SalarioAtual, IdMotivoDesligRAIS, IdMotivoDesligGerencial,
    IdMovContrCAGED, IdEstab,IdVLRSALFUNC,IdVlrFuncao, IdCargo,
     IdSitFunc,IDFUNCAO,NIVELINDIV1,NIVELINDIV2: double; //Higor Nayde Ferreira Sol 188194 - Kintana 1779198


  end;

  THstEndPess = record
    Logradouro, Complemento, Numero, CEP, Bairro: string;
    IdCidades: integer;
  end;

  THstDocumentos = array[1..NUM_DOC_ALT] of record
    IdDocumento: integer;
    Codigo, Numero: string;
  end;

  THstAltCad = array[1..NUM_CAD_ALT] of record
    Codigo, Valor: string;
  end;

  TCtrlPessoaFuncionario = class(TCtrlCustomPessoaRH)
  protected
    procedure OnCreateAppServer; override;
    procedure AfterInitialize; override;
    procedure DoChangeDataBase; override;
    function  ProcessaOutros(Operacao: TOperacao; var Mensagem: string): boolean; override;
  private
    FDbFuncionario: TDbFuncionario;
    FDbEstrangeiro: TDbEstrangeiro;
    FDbUltEmpr: TDbUltEmpr;

    // Felipe A. Santos SOL 229871.16137 - início
    FDbEstagiario : TDbEstagiario;
    FDbDadosCessao : TDbDadosCessao;
    FDbCategTrabaEsocial : TDbCategTrabaEsocial;
    FDbGrauExpTrabaEsocial : TDbGrauExpAgentEsocial;
    // Felipe A. Santos SOL 229871.16137 - Fim
    FDbProcessos : TDbProcessos; // Michelle Mota - SOL: 250384.17324 - PPM: 1070235
    FDbProcessosXIndicativoSusp : TDbProcessosXIndicativoSusp; //Cássio Rovaroto - SIG nº 38475.59780

    FCtrlRad: TCtrlRad;
    FCtrlListTerceirosRH: TCtrlListTerceirosRH;
    FCtrlMotivo: TCtrlMotivo;

    FFU: TCtrlFuncoesRH;

    FCdsEstrangeiro: TCMClientDataSet;
    FCdsUltEmpr: TCMClientDataSet;

    // Felipe A. Santos SOL 207737 KTN 2018095
    FDbContratoTemp : TDbContratoTemp;
    FDbContratoTempSubst : TDbContratoTempSubst;
    FDbContratoTempObs : TDbContratoTempObs;

    FCdsContratoTemp : TCMClientDataSet;
    FCdsContratoTempSubst : TCMClientDataSet;
    FCdsContratoTempObs : TCMClientDataSet;

    FUsaContratoTemp : boolean;
    // Felipe A. Santos SOL 207737 KTN 2018095

    FSQL: TStringList;

    FUsaEstrangeiro: boolean;
    FUsaUltimosEmpregos: boolean;
    FPassouGravacao: boolean;

    FIdPessoa: double;
    FDadosHist: TDadosHist; // Dados complementares
    FHstEndPess: THstEndPess; // Alterações no Endereço Residencial
    FHstDoc_Ant, FHstDoc_Atu: THstDocumentos; // Alterações nos Documentos
    FHstAltCad_Ant, FHstAltCad_Atu: THstAltCad; // Alterações Cadastrais
    FInserindo, FMudouEndResid, FMudouSituacao: boolean;

    FIdEmpresa: integer; // Empresa utilizada na geração do processo no RAD
    FIntegraRAD: boolean; // Indica se integra com o RAD
    FIdUsuario: integer; // Usuário utilizado na geração do processo no RAD
    FIdTipoProcesso: integer; // Tipo de Processo utilizado na geração do processo no RAD

    // Felipe A. Santos SOL 229871.16137 - início
    FCdsEstagiario: TCMClientDataSet;
    FCdsDadosCessao: TCMClientDataSet;
    FCdsCategTrabEsocial: TCMClientDataSet;
    FCdsGrauExpAgentEsocial: TCMClientDataSet;
    // Felipe A. Santos SOL 229871.16137 - fim
    FCdsProcessos: TCMClientDataSet; //Michelle Mota - SOL: 250384.17324 - PPM: 1070235

    FCdsImagemOutro: TCMClientDataSet;
    FcdsProcessosXIndicativoSusp: TCMClientDataSet;
    //Cássio Rovaroto - SIG nº 64144
    FUsaProcesso: boolean;

    procedure InitHstDocumentos;
    procedure InitHstAltCad;

    function GravarHstAltSitFunc: boolean;
    function GravarHstAltEvolFunc(IdEmpresa: double): boolean;


    function GravarHstAltEndereco: boolean;
    function GravarHstDocumentos: boolean;
    function GravarHstAltCadastral: boolean;

    function GerarProcessoRAD: boolean;
  public
    constructor Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string;
      UsaEstrangeiro: boolean = false; UsaUltimosEmpregos: boolean = false;
      IdEmpresa: integer = 0; IntegraRAD: boolean = false; IdUsuario: integer = 0;
      //Cássio Rovaroto - SIG nº 64144
      UsaProcesso: boolean  = false); reintroduce;
    destructor  Destroy; override;

    function ListFuncAtivo: OleVariant; //Bruno Bastos - Sol: 129826 - Kintana: 715518
    function ListFuncionario(ListaIdPessoa: string): OleVariant;
    //Início - Michelle Mota - SOL: 250384.17324 - PPM: 1070235
    function ListFuncProcessos(ListaIdPessoa: string): OleVariant;
    //function ListCondTrabEstr: OleVariant; //Everson Cunha - SIG38475
    function ListProcContrPrev(vIdPessoa: string): OleVariant;
    function ListProcContrIR(vIdPessoa: string): OleVariant;
    //Término - Michelle Mota - SOL: 250384.17324 - PPM: 1070235

   //William Santana SOL - 201365 KIN- 1965590
    function ListTipoBen(IdPessoa: double): OleVariant;
    function GravarTipoBeneficio(IdPessoa: double; idbeneficio: integer): boolean;
    function RemoverTipoBeneficio(idpessoa: double; idbeneficio: integer):boolean;
   //END - William Santana

    function ListImagem(IdPessoa: double): OleVariant; //William Santana - SOL 211502.16259 PPM 442499
    function ListEstCivil: OleVariant;                 //William Santana - SOL 211661/15807 - KIN 2060908
    function MostraEstCivil(EstCivil: string): string; //William Santana - SOL 211661/15807 - KIN 2060908

    // Felipe A. Santos SOL 229871.16137 - início
    function ListEstagiario(IdPessoa : Double) : OleVariant;
    function ListDadosCessao(IdPessoa : Double) : OleVariant;
    function ListCategTrabaEsocial(bIsGroup : boolean; sGrupo : string) : OleVariant;
    function GetGrupoCategTrabaEsocial(IdPessoa : Double) : string;
    function ListGrauExpAgentEsocial : OleVariant;
    // Felipe A. Santos SOL 229871.16137 - fim

    function ListAgenciaSalario(IdPessoa: double): OleVariant;
    function ListPesFisFuncionario(IdPessoa: double; Campos: string = ''): OleVariant;
    function ListEnderecoEmpresaFuncionario(IdPessoa: double; Campos: string = ''): OleVariant;
    function ListEmpresaFuncionario(IdEmpresa: integer; Campos: string = '';
      ListaIdEstab: string = ''; ListaSitFunc: string = ''; ListaTipoContrato: string = '';
      ListaTipoSexo: string = ''; ListaCodCentroCusto: string = '';
      AnoMesAdmissao: string = ''; AnoMesDemissao: string = ''; ListaIdDocumento: string = '';
      PossuiIdDocumento: boolean = false; InicioFerias: TDate = 0; FinalFerias: TDate = 0;
      FeriasOcorridas: integer = -1; TipoHorarioTrab: integer = -1;
      ListaMotivoDesligRAIS: string = ''; DataAdmissaoInicial: TDate = 0;
      DataAdmissaoFinal: TDate = 0; DataDemissaoInicial: TDate = 0;
      DataDemissaoFinal: TDate = 0; ComLinhaTransporte: boolean = false;
      ListaMatricula: string = ''; ListaIdMotivo: string = '';
      DataEvolInicial: TDate = 0; DataEvolFinal: TDate = 0; IdUsuario: double = 0;
      SituacaoAtual: boolean = true; DataRefSituacao: TDate = 0;
      ListaEstadoCivil: string = ''; ListaCargo: string = ''):  OleVariant;
      //William Santana - SIG 20695 - adicionado ListaEstadoCivil e ListaCargo na função

    function ListEmpresaFuncionario_motivo_mes(ListaMotivo:string ='' ; AnoMes:string = '';IdEmpresa: integer =0; Campos: string = '';
      ListaIdEstab: string = ''; ListaSitFunc: string = ''; ListaTipoContrato: string = '';
      ListaTipoSexo: string = ''; ListaCodCentroCusto: string = '';
      AnoMesAdmissao: string = ''; AnoMesDemissao: string = ''; ListaIdDocumento: string = '';
      PossuiIdDocumento: boolean = false; InicioFerias: TDate = 0; FinalFerias: TDate = 0;
      FeriasOcorridas: integer = -1; TipoHorarioTrab: integer = -1;
      ListaMotivoDesligRAIS: string = ''; DataAdmissaoInicial: TDate = 0;
      DataAdmissaoFinal: TDate = 0; DataDemissaoInicial: TDate = 0;
      DataDemissaoFinal: TDate = 0; ComLinhaTransporte: boolean = false;
      ListaMatricula: string = ''; ListaIdMotivo: string = '';
      DataEvolInicial: TDate = 0; DataEvolFinal: TDate = 0; IdUsuario: double = 0;
      SituacaoAtual: boolean = true; DataRefSituacao: TDate = 0 ):  OleVariant;//SOL170594 DOUGLAS.SIQUEIRA

    function ListDadosParticipante(IdPessoa: double):  OleVariant;
//    function ListDadosPessoaTIPO(_query: string):  OleVariant;///douglas.siqueira
    function ListDadosParticipante_ComEndereco(IdPessoa: double): OleVariant;
    function ListDadosParticipante_ComPlano(IdPessoa: double;
      IdPatro: double = -1; IdPlanoPrev: double = -1): OleVariant;
    function ListFuncionario_e_Terceiros: OleVariant;
    function ListChefe(IdEmpresa: integer): OleVariant;
    function ListFuncNaRescisao(IdPessoa: double): OleVariant;

    // Felipe A. Santos SOL 207737 KTN 2018095
    function ListContratoTemp(iIdPessoa : Double = -1) : OleVariant;
    function ListContratoTempSubst(iIdContratoTemp : Double = -1) : OleVariant;
    function ListContratoTempObs(iIdContratoTemp : Double = -1) : OleVariant;

    // Felipe A. Santos - fim

    //Marilza Colpani - SOL 90184/KTN 492704 - Início
    function ListSubordinados(IdPessoa: double): OleVariant;
    function ListNotInSubordinados(IdPessoa: double): OleVariant;
    function GravarNovoChefeFunc(pCDSFunc: TCMClientDataSet; pIdChefe: integer): Boolean;
    //Marilza Colpani - SOL 90184/KTN 492704 - Fim

    function SetDuracaoContrato(DataAdmissao, DataFinalContrato: TDateTime;
      TipoDocuracaoContrato: integer): integer;
    function SetDataFinalContrato(DataAdmissao: TDateTime; DocuracaoContrato,
      TipoDocuracaoContrato: integer): boolean;



    function GetMatriculaJaExiste(Matricula: string; IdEmpresa: double): double;
    function GetProxMatricula(Tamanho: byte): string;
    function GetGodigoGrpFunc(IdPessoa: double): string;
    function GetNumAdmitidos(IdEmpresa: double; CodCentroCusto, AnoBarraMes: string): integer;
    function GetNumDemitidos(IdEmpresa: double; CodCentroCusto, AnoBarraMes: string): integer;
    function GetCodCentroCusto(IdPessoa: double): string;

    function GravarSubTipos(Operacao: TOperacao; var Mensagem: string): boolean;

    function GravaAltEvolFunc(IdEmpresa: integer): Boolean;

    //Cássio Rovaroto - SIG nº 38475.59780 - Início
    function SelProcessosXIndicativoSusp(rIdFuncionario: Integer): OleVariant;
    function SelIndicativoSusp: OleVariant;
    
    function VerificaExistenciaProcesso(pIdProcesso: integer): Boolean;
    function VerificaExistenciaProcessoXIndicativo(pIdProcessoxIndicativoSusp: integer): boolean;
    function VerificaProcessoFuncionario(pNumProcesso: string; pIdFuncionario: integer): Boolean;
    function GetProxIdProcessosXIndicativoSusp: integer;
    function GetProxIdProcesso: Integer;
    //Cássio Rovaroto - SIG nº 38475.59780 - Fim

    // Alterações Cadastrais
    procedure SelDadosEvolFunc;
    procedure SelDadosSitFunc(TipoSit: string);
    procedure SelHstDocumentos(PrimeiraVez: boolean);
    procedure SelHstAltCad(PrimeiraVez: boolean;
                           Matricula,
                           Nome: string;
                           DataNasc,
                           DataAdm: TDate;
                           Horario,
                           Chefe,
                           GrauInstr,
                           EstadoCivil,
                           Sindicato,
                           Profissao: string;
                           NumDepIRRF,
                           NumDepSalFam,
                           NumTelefone: integer;
                           TipoContrato,
                           SituacaoDeRisco,
                           CatEmpregado,
                           NumDDD,
                           NumDDI,
                           Banco: string;
                           TipoConta : Integer;
                           NumAgencia,
                           ContaCorrente,
                           ContaPref,
                           MatCaixa,
                           BancoSalario,
                           AgenciaSalario,
                           ContaSalario : String);



    procedure GuardarAlteracaoEndereco;
    function  GravarHistorico(GravarHstAltCad, Inserindo: boolean; IdEmpresa: double): boolean;

    property IdPessoa: double read FIdPessoa write FIdPessoa;
    property MudouEnderecoResidencial: boolean read FMudouEndResid write FMudouEndResid;
    property MudouSituacao: boolean read FMudouSituacao write FMudouSituacao;
    property CdsEstrangeiro: TCMClientDataSet read FCdsEstrangeiro write FCdsEstrangeiro;
    property CdsUltEmpr: TCMClientDataSet read FCdsUltEmpr write FCdsUltEmpr;
    property UsaEstrangeiro: boolean read FUsaEstrangeiro write FUsaEstrangeiro;
    property UsaUltimosEmpregos: boolean read FUsaUltimosEmpregos write FUsaUltimosEmpregos;
    property PassouGravacao: boolean read FPassouGravacao write FPassouGravacao;

    // Felipe A. Santos SOL 229871.16137 - início
    property CdsEstagiario : TCMClientDataSet read FCdsEstagiario write FCdsEstagiario;
    property CdsDadosCessao : TCMClientDataSet read FCdsDadosCessao write FCdsDadosCessao;
    property CdsCategTrabEsocial : TCMClientDataSet read FCdsCategTrabEsocial write FCdsCategTrabEsocial;
    property CdsGrauExpAgentEsocial : TCMClientDataSet read FCdsGrauExpAgentEsocial write FCdsGrauExpAgentEsocial;
    // Felipe A. Santos SOL 229871.16137 - Fim

    property cdsProcessosXIndicativoSusp: TCMClientDataSet read FcdsProcessosXIndicativoSusp write FcdsProcessosXIndicativoSusp; //Cássio Rovaroto - SIG nº 38475.59780

    property CdsProcessos : TCMClientDataSet read FCdsProcessos write FCdsProcessos;
    property CdsImagemOutro : TCMClientDataSet read FCdsImagemOutro write FCdsImagemOutro; //William Santana - SOL 211502.16259 PPM 442499

	// Felipe A. Santos SOL 207737 KTN 2018095
    property CdsContratoTemp : TCMClientDataSet read FCdsContratoTemp write FCdsContratoTemp;
    property CdsContratoTempObs : TCMClientDataSet read FCdsContratoTempObs write FCdsContratoTempObs;
    property CdsContratoTempSubst : TCMClientDataSet read FCdsContratoTempSubst write FCdsContratoTempSubst;

    property UsaContratoTemp : boolean read FUsaContratoTemp write FUsaContratoTemp;
    // Felipe A. Santos SOL 207737 KTN 2018095

    //Cássio Rovaroto - SIG nº 64144
    property UsaProcesso: boolean read FUsaProcesso write FUsaProcesso;
  end;

implementation

uses uCmCustomCdbObject, uMidasUtil;

{ TCtrlPessoaFuncionario }

constructor TCtrlPessoaFuncionario.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string;
  UsaEstrangeiro, UsaUltimosEmpregos: boolean; IdEmpresa: integer; IntegraRAD: boolean;
  IdUsuario: integer; UsaProcesso: boolean);
begin
  inherited Create;

  // Felipe A. Santos SOL 207737 KTN 2018095
  FDbContratoTemp := TDbContratoTemp.Create(Self);
  FDbContratoTempSubst := TDbContratoTempSubst.Create(Self);
  FDbContratoTempObs := TDbContratoTempObs.Create(Self);
  UsaContratoTemp := False;
  // Felipe A. Santos SOL 207737 KTN 2018095

  SetAutorizacoes(UsuXFilial, UsuXCCusto, IdUsuarioGeral);

  FDbFuncionario := TDbFuncionario.Create(Self);
  FFU := TCtrlFuncoesRH.Create;
  FSQL := TStringList.Create;

  FUsaUltimosEmpregos := UsaUltimosEmpregos;
  if (FUsaUltimosEmpregos) then
    FDbUltEmpr := TDbUltEmpr.Create(Self);

  FUsaEstrangeiro := UsaEstrangeiro;
  if (FUsaEstrangeiro) then
    FDbEstrangeiro := TDbEstrangeiro.Create(Self);

  // Felipe A. Santos SOL 229871.16137 - início
  FDbEstagiario := TDbEstagiario.Create(Self);
  FDbDadosCessao := TDbDadosCessao.Create(Self);
  FDbCategTrabaEsocial := TDbCategTrabaEsocial.Create(Self);
  FDbGrauExpTrabaEsocial := TDbGrauExpAgentEsocial.Create(Self);
  // Felipe A. Santos SOL 229871.16137 - fim

  FUsaProcesso := UsaProcesso; //Everson Cunha - SIG70569
  if (FUsaProcesso) then       //Everson Cunha - SIG70569
  begin
    FDbProcessos := TDbProcessos.Create(Self); // Michelle Mota - SOL: 250384.17324 - PPM: 1070235
    FDbProcessosXIndicativoSusp  := TDbProcessosXIndicativoSusp.Create(Self); //Cássio Rovaroto - SIG nº 38475.59780
  end;

  FIdEmpresa := IdEmpresa;
  FIntegraRAD := IntegraRAD;
  FIdUsuario := IdUsuario;

  // Somente cria o RAD se estiver na Aplicação Servidora ou estiver
  // no modo de execução Cliente Servidor em Duas Camadas
  if (FIntegraRAD) and ((IsAppServer) or (ConnectionSide <> cnsClient)) then
  begin
    FCtrlRad := TCtrlRad.Create;
    FCtrlListTerceirosRH := TCtrlListTerceirosRH.Create('', '', '');
    FCtrlMotivo := TCtrlMotivo.Create;
  end;
end;

destructor TCtrlPessoaFuncionario.Destroy;
begin
  FSQL.Free;
  FFU.Free;
  FDbFuncionario.Free;

  if (FUsaEstrangeiro) then
    FDbEstrangeiro.Free;
  if (FUsaUltimosEmpregos) then
    FDbUltEmpr.Free;

   // Felipe A. Santos SOL 229871.16137 - início
  FDbEstagiario.Free;
  FDbDadosCessao.Free;
  FDbCategTrabaEsocial.Free;
  FDbGrauExpTrabaEsocial.Free;
  // Felipe A. Santos SOL 229871.16137 - Fim
  FDbProcessos.Free; // Michelle Mota - SOL: 250384.17324 - PPM: 1070235

  // Felipe A. Santos SOL 207737 KTN 2018095
  FDbContratoTemp.Free;
  FDbContratoTempSubst.Free;
  FDbContratoTempObs.Free;
  // Felipe A. Santos - fim

  FDbProcessosXIndicativoSusp.Free;//Cásiso Rovaroto - SIG nº 38475.59780

  // Somente destrói o RAD se estiver na Aplicação Servidora ou estiver
  // no modo de execução Cliente Servidor em Duas Camadas
  if (FIntegraRAD) and ((IsAppServer) or (ConnectionSide <> cnsClient)) then
  begin
    FCtrlRad.Free;
    FCtrlListTerceirosRH.Free;
    FCtrlMotivo.Free;
  end;

  if (IsAppServer) then
  begin
    if (FUsaEstrangeiro) then
      FCdsEstrangeiro.Free;
    if (FUsaUltimosEmpregos) then
      FCdsUltEmpr.Free;
  end;
  inherited;
end;

procedure TCtrlPessoaFuncionario.OnCreateAppServer;
begin
  inherited;
  if (FUsaEstrangeiro) then
    FCdsEstrangeiro := TCMClientDataSet.Create(nil);
  if (FUsaUltimosEmpregos) then
    FCdsUltEmpr := TCMClientDataSet.Create(nil);
end;

procedure TCtrlPessoaFuncionario.AfterInitialize;
begin
  inherited;
  FFU.InitializeAs(Self);

  // Somente procura o IdTipoProcesso se estiver na Aplicação Servidora ou estiver
  // no modo de execução Cliente Servidor em Duas Camadas
  if (IsAppServer) or (ConnectionSide <> cnsClient) then
  begin
    if (FIntegraRAD) then
    begin
      FCtrlMotivo.InitializeAs(Self);

      FCtrlRad.InitializeAs(Self);
      FCtrlRad.OpenTransaction := false;
      FIdTipoProcesso := FCtrlListTerceirosRH.GetIdTipoProcesso(FIdUsuario, 19);
    end
    else
      FIdTipoProcesso := -1;
  end;

  // Inicialização das variáveis para a Geração do Histórico de Alterações Cadastrais
  InitHstDocumentos;
  InitHstAltCad;
end;

procedure TCtrlPessoaFuncionario.DoChangeDataBase;
begin
  inherited;
  FDbFuncionario.DataBaseName := DataBaseName;
  FFU.DataBase := DataBase;

  if (FUsaEstrangeiro) then
    FDbEstrangeiro.DataBaseName := DataBaseName;
  if (FUsaUltimosEmpregos) then
    FDbUltEmpr.DataBaseName := DataBaseName;

  // Felipe A. Santos SOL 229871.16137 - início
  FDbEstagiario.DataBaseName := DataBaseName;
  FDbDadosCessao.DataBaseName := DataBaseName;
  FDbCategTrabaEsocial.DataBaseName := DataBaseName;
  FDbGrauExpTrabaEsocial.DataBaseName := DataBaseName;
  // Felipe A. Santos SOL 229871.16137 - fim

  if (FUsaProcesso) then //Everson Cunha - SIG90602
  begin                  //Everson Cunha - SIG90602
    FDbProcessos.DataBaseName := DataBaseName; // Michelle Mota - SOL: 250384.17324 - PPM: 1070235
    FDbProcessosXIndicativoSusp.DataBaseName := DataBaseName; // Cássio Rovaroto - SIG nº 38475.59780
  end;                   //Everson Cunha - SIG90602

  // Somente muda o DataBaseName do RAD se estiver na Aplicação Servidora ou estiver
  // no modo de execução Cliente Servidor em Duas Camadas
  if (FIntegraRAD) and ((IsAppServer) or (ConnectionSide <> cnsClient)) then
  begin
    FCtrlListTerceirosRH.DataBase := DataBase;
    FCtrlRad.DataBase := DataBase;
    FCtrlMotivo.DataBase := DataBase;
  end;

  // Felipe A. Santos SOL 207737 KTN 2018095
  FDbContratoTemp.DataBaseName := DataBaseName;
  FDbContratoTempSubst.DataBaseName := DataBaseName;
  FDbContratoTempObs.DataBaseName := DataBaseName;
  // Felipe A. Santos - fim
end;

function TCtrlPessoaFuncionario.ListFuncionario(ListaIdPessoa: string): OleVariant;
var
  sSQL: string;
begin
  if (ListaIdPessoa = '-1') then
    sSQL := 'WHERE' +CR_LF+ '  (1 = 2)'
  else
  begin
    if (ListaIdPessoa = '') then
      sSQL := 'ORDER BY' +CR_LF+ '  IDPESSOA'
    else
    begin
      if (Pos(',',ListaIdPessoa) > 0) then
        sSQL := 'WHERE' +CR_LF+ '  (IDPESSOA IN (' +ListaIdPessoa+ '))'
      else
        sSQL := 'WHERE' +CR_LF+ '  (IDPESSOA = ' +ListaIdPessoa+ ')'
    end;
  end;

  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  *'+CR_LF+
    'FROM'+CR_LF+
    '  FUNCIONARIO'+CR_LF+
    sSQL);
end;

// Início - Michelle Mota - SOL: 250384.17324 - PPM: 1070235
function TCtrlPessoaFuncionario.ListFuncProcessos(ListaIdPessoa: string): OleVariant;
var
  sSQL: string;
begin
  if (ListaIdPessoa = '-1') then
    sSQL := 'AND' +CR_LF+ '  (1 = 2)'
  else
  begin
    if (ListaIdPessoa = '') then
      sSQL := 'ORDER BY' +CR_LF+ '  P.DATAINICIO'
    else
    begin
      if (Pos(',',ListaIdPessoa) > 0) then
        sSQL := 'AND' +CR_LF+ '  (P.IDFUNCIONARIO IN (' +ListaIdPessoa+ '))'
      else
        sSQL := 'AND' +CR_LF+ '  (P.IDFUNCIONARIO = ' +ListaIdPessoa+ ')'
    end;
  end;

  Result := GetDataPacket(
    'SELECT P.*, IDPROCESSO, '+CR_LF+
  'IDFILIALPESSOA, '+CR_LF+
  'CASE P.TIPO WHEN ''A'' THEN ''Administrativo'' '+CR_LF+
  '          WHEN ''J'' THEN ''Judicial'' '+CR_LF+
  '          WHEN ''F'' THEN ''Processo FAP de exercício anterior a 2019'' ' +CR_LF+
  '          END AS TIPODEPROC, '+CR_LF+
  'P.NUMERO, '+CR_LF+

  //Everson Luiz SIG70569 - Início
  {'CASE P.INDICATDECISAO WHEN 1 THEN ''Definitiva (Transitada em Julgado)'' '+CR_LF+
  '                    WHEN 2 THEN ''Decisão não Transitada em Julgado com Efeito Suspensivo'' '+CR_LF+
  '                    WHEN 3 THEN ''Liminar em Mandado de Segurança'' '+CR_LF+
  '                    WHEN 4 THEN ''Liminar ou tutela antecipada, em outras espécies de ação judicial'' '+CR_LF+
  '                    WHEN 5 THEN ''Contestação Administrativa'' '+CR_LF+
  '                    WHEN 9 THEN ''Outros'' END AS INDICATIVODECISAO, '+CR_LF+}
  //Everson Luiz SIG70569 - Fim

  //'CASE P.INDICATDEPOSITO WHEN 0 THEN ''Não'' '+CR_LF+
  //'                     WHEN 1 THEN ''Sim'' END AS indicativodeposito, '+CR_LF+
  'CODIDENTVARA   , '+CR_LF+
  'CASE P.CONTRIABRANDECISAO WHEN 1 THEN ''IRRF'' '+CR_LF+
  '                        WHEN 2 THEN ''Contribuições sociais do trabalhador'' END AS CONTRIABRANDEC, '+CR_LF+
  'CASE P.EXTENDECISAO WHEN 1 THEN ''Contribuição Previdenciária Patronal'' '+CR_LF+
  '                  WHEN 2 THEN ''Contribuição Previdenciária Patronal + Descontada dos Segurados'' END AS EXTENDEC, '+CR_LF+
  'C.NOME AS NOMECIDADE        , '+CR_LF+
  'C.UF, '+CR_LF+
  'C.CODMUNICIPIO, '+CR_LF+
  'CASE P.PROCADMJUD WHEN 1 THEN ''RAT'' '+CR_LF+
  '                WHEN 2 THEN ''FAP'' end PROCESSOADMJUD, '+CR_LF+
  'CASE P.AUTORACAO WHEN ''N'' THEN ''Não'' '+CR_LF+
  '               WHEN ''S'' THEN ''Sim'' END AS AUTORAC, '+CR_LF+
  //'i.descricao as idindicatsusp , '+CR_LF+

  //Everson Luiz SIG70569 - Início
  //'CASE P.APURFAP WHEN 1 THEN ''FAP atribuído à Empresa'' '+CR_LF+
  //'             WHEN 2 THEN ''FAP atribuído a cada Estabelecimento'' END AS APURACAOFAP, '+CR_LF+
  //Everson Luiz SIG70569 - Fim

  'P.CODMATPROC,     '+CR_LF+
  'CASE P.CODMATPROC '+CR_LF+
  '  WHEN 1  THEN ''Exclusivamente tributária ou tributária e FGTS'' '+CR_LF+
  '  WHEN 7  THEN ''Exclusivamente FGTS e/ou Contribuição Social Rescisória (Lei Complementar 110/2001)'' '+CR_LF+
  'END AS CODMATPROCDESC, '+CR_LF+
  'P.DATAINICIO       , '+CR_LF+
  'P.DATAFIM          , '+CR_LF+
  'P.IDFUNCIONARIO '+CR_LF+
  //Cássio Rovaroto - SIG nº 38475.59780 - Início
  //'from processos p, cidades c, indicativosusp i '+CR_LF+
  ' FROM PROCESSOS P, CIDADES C '+CR_LF+
  'WHERE P.IDCIDADES = C.IDCIDADES '+CR_LF+
  '  AND P.IDFUNCIONARIO IS NOT NULL '+CR_LF+
  //'  and i.idindicativosusp = p.idindicativosusp'+CR_LF+
  //Cássio Rovaroto - SIG nº 38475.59780 - Fim
    sSQL);
end;

function TCtrlPessoaFuncionario.ListProcContrPrev(vIdPessoa: string): OleVariant;
var
  sSQL: string;
begin
  if (vIdPessoa = '-1') then
    sSQL := 'and' +CR_LF+ '  (1 = 2)'
  else
  begin
    if (vIdPessoa = '') then
      sSQL := 'ORDER BY' +CR_LF+ '  NUMERO'
    else
    begin
      if (Pos(',',vIdPessoa) > 0) then
        sSQL := 'and' +CR_LF+ '  (IDFUNCIONARIO IN (' +vIdPessoa+ '))'
      else
        sSQL := 'and' +CR_LF+ '  (IDFUNCIONARIO = ' +vIdPessoa+ ')'
    end;
  end;

  Result := GetDataPacket(
    'SELECT * FROM PROCESSOS where CONTRIABRANDECISAO = 1 ' +CR_LF+
    ' and (DATAFIM = null or DATAFIM = '''')'+CR_LF+
    sSQL);
end;

function TCtrlPessoaFuncionario.ListProcContrIR(vIdPessoa: string): OleVariant;
var
  sSQL: string;
begin
  if (vIdPessoa = '-1') then
    sSQL := 'and' +CR_LF+ '  (1 = 2)'
  else
  begin
    if (vIdPessoa = '') then
      sSQL := 'ORDER BY' +CR_LF+ '  NUMERO'
    else
    begin
      if (Pos(',',vIdPessoa) > 0) then
        sSQL := 'and' +CR_LF+ '  (IDFUNCIONARIO IN (' +vIdPessoa+ '))'
      else
        sSQL := 'and' +CR_LF+ '  (IDFUNCIONARIO = ' +vIdPessoa+ ')'
    end;
  end;

  Result := GetDataPacket(
    'SELECT * FROM PROCESSOS where CONTRIABRANDECISAO = 2' +CR_LF+
    ' and (DATAFIM = null or DATAFIM = '''')'+CR_LF+
    sSQL);
end;

//Everson Cunha - SIG38475 - Ini
{function TCtrlPessoaFuncionario.ListCondTrabEstr: OleVariant;
var
  sSQL: string;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  *'+CR_LF+
    'FROM'+CR_LF+
    '  CONDICAOTRABESTRANGEIRO ORDER BY DESCRICAO');
end;}
//Everson Cunha - SIG38475 - Fim
// Término - Michelle Mota - SOL: 250384.17324 - PPM: 1070235

function TCtrlPessoaFuncionario.ListAgenciaSalario(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  AGB.IDBANCO, BPF.CODPORTFORMA,'+CR_LF+
    '  F.NUMCONTASALARIO AS CONTACORRENTE, AGB.NUMAGENCIA, BAN.NUMBANCO'+CR_LF+
    'FROM'+CR_LF+
    '  FUNCIONARIO F, AGENCIABANCARIA AGB, BANCO BAN, BANCOPORTFOLHA BPF'+CR_LF+
    'WHERE'+CR_LF+
    '  (F.IDPESSOA         = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (F.IDAGENCIASALARIO = AGB.IDPESSOA) AND'+CR_LF+
    '  (AGB.IDBANCO        = BAN.IDPESSOA(+)) AND'+CR_LF+
    '  (AGB.IDBANCO        = BPF.IDBANCO(+))');
end;

function TCtrlPessoaFuncionario.ListPesFisFuncionario(IdPessoa: double; Campos: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    FFU.IFF(Campos = '',
      '  F.IDPESSOA, F.MATRICULA, (''  '' || P.NOME) AS NOME,'+CR_LF+
      '  F.DATAADMISSAO, ST.TIPOSIT, F.IDEMPRESA,'+CR_LF+
      '  TO_CHAR(DECODE(ST.TIPOSIT,NULL,''Indefinida'','+CR_LF+
      '    TO_CHAR(DECODE(ST.TIPOSIT,''A'',''(Ativ'', ''F'',''(Afastad'', ''D'',''(Demitid'')) ||'+CR_LF+
      '    TO_CHAR(DECODE(PF.SEXO,''F'',''a)'',''o)'')))) AS SITUACAO, F.IDCARGO',
      Campos)+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, PESSOAFISICA PF, FUNCIONARIO F, SITFUNC ST'+CR_LF+
    'WHERE'+CR_LF+
    '  (F.IDPESSOA  = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (F.IDSITFUNC = ST.IDSITFUNC) AND'+CR_LF+
    '  (F.IDPESSOA  = PF.IDPESSOA) AND'+CR_LF+
    '  (F.IDPESSOA  = P.IDPESSOA)');
end;

function TCtrlPessoaFuncionario.ListEnderecoEmpresaFuncionario(IdPessoa: double;
  Campos: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    FFU.IFF(Campos = '',
      '  PF.NOME,'+CR_LF+
      '  F.IDPESSOA,'+CR_LF+
      '  F.MATRICULA,'+CR_LF+
      '  F.IDEMPRESA,'+CR_LF+
      '  F.IDESTAB,'+CR_LF+
      '  F.IDHORARIO,'+CR_LF+
      '  F.DATAREFHORARIO,'+CR_LF+
      '  ST.TIPOSIT,'+CR_LF+
      '  TO_CHAR(DECODE(ST.TIPOSIT,'+CR_LF+
      '    NULL,''Indefinida'','+CR_LF+
      '    TO_CHAR(DECODE(ST.TIPOSIT,'+CR_LF+
      '      ''A'',''(Ativ'','+CR_LF+
      '      ''F'',''(Afastad'','+CR_LF+
      '      ''D'',''(Demitid'''+CR_LF+
      '    )) ||'+CR_LF+
      '    TO_CHAR(DECODE(PEFIS.SEXO,'+CR_LF+
      '      ''F'',''a)'','+CR_LF+
      '      ''o)'''+CR_LF+
      '    ))'+CR_LF+
      '  )) AS SITUACAO,'+CR_LF+
      '  TO_NUMBER(DECODE(C.IDPAIS,'+CR_LF+
      '    NULL,E.IDPAIS,'+CR_LF+
      '    C.IDPAIS'+CR_LF+
      '  )) AS IDPAIS,'+CR_LF+
      '  E.IDCIDADES,'+CR_LF+
      '  RTRIM(ES.CODESTADO) AS UF',
      Campos)+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA PJ, PESSOA PF, PESSOAFISICA PEFIS, ENDPESS E, FUNCIONARIO F,'+CR_LF+
    '  SITFUNC ST, CIDADES C, ESTADO ES'+CR_LF+
    'WHERE'+CR_LF+
    '  (F.IDPESSOA        = '+FloatToStr(IdPessoa)+') AND'+CR_LF+
    '  (F.IDSITFUNC       = ST.IDSITFUNC) AND'+CR_LF+
    '  (F.IDPESSOA        = PF.IDPESSOA) AND'+CR_LF+
    '  (F.IDPESSOA        = PEFIS.IDPESSOA) AND'+CR_LF+
    '  (F.IDESTAB         = PJ.IDPESSOA) AND'+CR_LF+
    '  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND'+CR_LF+
    '  (PJ.IDPESSOA       = E.IDPESSOA) AND'+CR_LF+
    '  (E.IDCIDADES       = C.IDCIDADES) AND'+CR_LF+
    '  (C.IDESTADO        = ES.IDESTADO)');
end;

function TCtrlPessoaFuncionario.ListEmpresaFuncionario_motivo_mes( ListaMotivo,AnoMes:string ;IdEmpresa: integer; Campos: string;
  ListaIdEstab, ListaSitFunc, ListaTipoContrato, ListaTipoSexo, ListaCodCentroCusto,
  AnoMesAdmissao, AnoMesDemissao, ListaIdDocumento: string; PossuiIdDocumento: boolean;
  InicioFerias, FinalFerias: TDate; FeriasOcorridas, TipoHorarioTrab: integer;
  ListaMotivoDesligRAIS: string; DataAdmissaoInicial, DataAdmissaoFinal, DataDemissaoInicial,
  DataDemissaoFinal: TDate; ComLinhaTransporte: boolean; ListaMatricula,
  ListaIdMotivo: string; DataEvolInicial, DataEvolFinal: TDate; IdUsuario: double;
  SituacaoAtual: boolean; DataRefSituacao: TDate ): OleVariant;  //SOL170594 DOUGLAS.SIQUEIRA
begin
  with (FSQL) do
  begin
    Clear;
    if not(SituacaoAtual) or (ComLinhaTransporte) or
       (DataEvolInicial > 0) or (InicioFerias > 0) or (FinalFerias > 0) then
      Add('SELECT DISTINCT')
    else  
      Add('SELECT DISTINCT');

    if (Campos <> '') then
      Add('  ' +Campos)
    else
      Add('  F.IDPESSOA, P.NOME');

    Add('FROM');
    Add('  PESSOA P, FUNCIONARIO F');

    if (ListaSitFunc <> '') then
      FSQL[FSQL.Count-1] := FSQL[FSQL.Count-1] + ', SITFUNC ST';

    if (ListaTipoSexo <> '') then
      FSQL[FSQL.Count-1] := FSQL[FSQL.Count-1] + ', PESSOAFISICA PF';

    if (InicioFerias > 0) and (FinalFerias > 0) then
      FSQL[FSQL.Count-1] := FSQL[FSQL.Count-1] + ', FERIAS FE';

    if (TipoHorarioTrab > -1) then
      FSQL[FSQL.Count-1] := FSQL[FSQL.Count-1] + ', HORATRAB HT';

    if (ListaMotivoDesligRAIS <> '') then
      FSQL[FSQL.Count-1] := FSQL[FSQL.Count-1] + ', MOTIVO MO';

    if (ComLinhaTransporte) then
      FSQL[FSQL.Count-1] := FSQL[FSQL.Count-1] + ', LINHATRANSP LT, LINHAXPESS LP';

    if (DataEvolInicial > 0) then
      FSQL[FSQL.Count-1] := FSQL[FSQL.Count-1] + ', EVOLFUNC EF';

    // SOL 188050 KTN 1797080 Otacilio ** Inicio **
    {if (trim(ListaMotivo)<>'') and  (trim(AnoMes)<>'') then
    begin
      Add('  ,(SELECT IDPESSOA ');
      if Processo = 1 then
        Add('    FROM  HISTRUBSAL ')
      else
        Add('    FROM  PREVIAFOLPAG ');

      Add(' WHERE ');
      Add(' IDMOTIVO IN( '+#39+ListaMotivo+#39+')');
      Add(' AND MES ='+#39+AnoMes+#39+')HISTRUBSAL ');
    end;}
    // SOL 188050 KTN 1797080 Otacilio ** Fim **

    if not(SituacaoAtual) then
    begin
      if (ListaSitFunc <> '') then
      begin
        Add('  ,(SELECT H.IDPESSOA, H.IDSITFUNC');
        Add('    FROM   HSTSITFUNC H,');
        Add('           (SELECT MAX(DATASITFUNC) AS DATASITFUNC, IDPESSOA');
        Add('            FROM   HSTSITFUNC');
        Add('            WHERE  (DATASITFUNC <= TO_DATE('+
            QuotedStr(DateToStr(DataRefSituacao))+ ',''DD/MM/YYYY''))');
        Add('            GROUP BY IDPESSOA) HST2,');
        Add('           (SELECT MAX(TRGDTINCLUSAO) AS DATAINCLUSAO, IDPESSOA');
        Add('            FROM   HSTSITFUNC');
        Add('            WHERE  (DATASITFUNC <= TO_DATE('+
            QuotedStr(DateToStr(DataRefSituacao))+ ',''DD/MM/YYYY''))');
        Add('            GROUP BY IDPESSOA) HST3');
        Add('    WHERE  (H.DATASITFUNC   = HST2.DATASITFUNC) AND');
        Add('           (H.IDPESSOA      = HST2.IDPESSOA) AND');
        Add('           (H.TRGDTINCLUSAO = HST3.DATAINCLUSAO) AND');
        Add('           (H.IDPESSOA      = HST3.IDPESSOA)) HST_SIT');
      end;

      if (ListaIdEstab <> '') or (ListaCodCentroCusto <> '') then
      begin
        Add('  ,(SELECT EF.IDPESSOA, EF.IDEMPRESA, EF.IDESTAB, EF.CODCENTROCUSTO');
        Add('    FROM   EVOLFUNC EF,');
        Add('           (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA');
        Add('            FROM   EVOLFUNC');
        Add('            WHERE  (DATAALTERFUNC <= TO_DATE('+
          QuotedStr(DateToStr(DataRefSituacao))+ ',''DD/MM/YYYY''))');
        Add('            GROUP BY IDPESSOA) HST2,');
        Add('           (SELECT MAX(TRGDTINCLUSAO) AS DATAINCLUSAO, IDPESSOA');
        Add('            FROM   EVOLFUNC');
        Add('            WHERE  (DATAALTERFUNC <= TO_DATE('+
          QuotedStr(DateToStr(DataRefSituacao))+ ',''DD/MM/YYYY''))');
        Add('            GROUP BY IDPESSOA) HST3');
        Add('    WHERE  (EF.DATAALTERFUNC = HST2.DATAALTERFUNC) AND');
        Add('           (EF.IDPESSOA      = HST2.IDPESSOA) AND');
        Add('           (EF.TRGDTINCLUSAO = HST3.DATAINCLUSAO) AND');
        Add('           (EF.IDPESSOA      = HST3.IDPESSOA)) HST_EVOL');
      end;
    end;

    Add('WHERE');

    if (ListaSitFunc <> '') then
      Add(FFU.MontaLinhaSelSQL('  (ST.TIPOSIT', FFU.QuotedListaString(ListaSitFunc,','), 7));

    if (FIdUsuarioGeral <> '') then
      Add('  (F.IDPESSOA        = ' +FIdUsuarioGeral+ ') AND');

    //if (trim(ListaMotivo)<>'') then
    //  Add('  (F.IDPESSOA        = HISTRUBSAL.IDPESSOA) AND');


    if (ListaMatricula <> '') then
      Add(FFU.MontaLinhaSelSQL('  (F.MATRICULA', FFU.QuotedListaString(ListaMatricula,','), 7));

    if (Trim(ListaTipoContrato) <> '') then
      Add(FFU.MontaLinhaSelSQL('  (F.TIPOCONTRATO', FFU.QuotedListaString(ListaTipoContrato,','), 3));

    if not(SituacaoAtual) and (ListaSitFunc <> '') then
      Add('  (F.DATAADMISSAO   <= TO_DATE('+
        QuotedStr(DateToStr(DataRefSituacao))+ ',''DD/MM/YYYY'')) AND');
                                            
    // Estabelecimento
    if (ListaIdEstab <> '') then
    begin
      if (SituacaoAtual) then
        Add(FU.MontaLinhaSelSQL('  (F.IDESTAB', ListaIdEstab, 8))
      else
      begin
        Add(FU.MontaLinhaSelSQL(
          '  (CASE'+CR_LF+
          '     WHEN HST_EVOL.IDESTAB IS NULL THEN F.IDESTAB'+CR_LF+
          '     ELSE HST_EVOL.IDESTAB'+CR_LF+
          '   END', ListaIdEstab, 14));
      end;
    end
    else
    if (FUsuXFilial <> '') then // Estabelecimento(s) habilitados para o usuário
    begin
      if (IdUsuario > 0) then
        Add('  ((F.IDPESSOA = ' +FloatToStr(IdUsuario)+ ') OR');

      Add(FFU.MontaLinhaSelSQL('  (F.IDESTAB', FUsuXFilial, 8, false));
      if (IdUsuario > 0) then
        FSQL[FSQL.Count-1] := FSQL[FSQL.Count-1] + ')';
      FSQL[FSQL.Count-1] := FSQL[FSQL.Count-1] + ' AND';
    end;

    // Centro de Custo
    if (ListaCodCentroCusto <> '') then
    begin
      if (SituacaoAtual) then
      begin
        Add(FFU.MontaLinhaSelSQL('  (F.CODCENTROCUSTO', FFU.QuotedListaString(ListaCodCentroCusto,','), 1));
        if (IdEmpresa > 0) then
          Add('  (F.IDEMPRESA       = ' +IntToStr(IdEmpresa)+ ') AND');
      end
      else
      begin
        Add(FFU.MontaLinhaSelSQL(
          '  ((CASE' +CR_LF+
          '      WHEN HST.CODCENTROCUSTO IS NULL THEN F.CODCENTROCUSTO' +CR_LF+
          '      ELSE HST.CODCENTROCUSTO' +CR_LF+
          '    END)', FFU.QuotedListaString(ListaCodCentroCusto,','), 12));
        if (IdEmpresa > 0) then
        begin
          Add('  ((CASE');
          Add('      WHEN HST.IDEMPRESA IS NULL THEN F.IDEMPRESA');
          Add('      ELSE HST.IDEMPRESA');
          Add('    END)             = ' +IntToStr(IdEmpresa)+ ') AND');
        end;
      end;
    end
    else
    if (FUsuXCCusto <> '') then // C. de Custo(s) habilitados para o usuário
    begin
      if (IdUsuario > 0) then
        Add('  ((F.IDPESSOA       = ' +FloatToStr(IdUsuario)+ ') OR');

      Add(FFU.MontaLinhaSelSQL('  (F.CODCENTROCUSTO', FUsuXCCusto, 1, false));
      if (IdUsuario > 0) then
        FSQL[FSQL.Count-1] := FSQL[FSQL.Count-1] + ')';
      FSQL[FSQL.Count-1] := FSQL[FSQL.Count-1] + ' AND';
    end;

    // Situação Funcional
    if (ListaSitFunc <> '') then
    begin
      if (SituacaoAtual) then
        Add('  (ST.IDSITFUNC      = F.IDSITFUNC) AND')
      else
      begin
        Add('  (CASE');
        Add('     WHEN HST_SIT.IDSITFUNC IS NULL THEN F.IDSITFUNC');
        Add('     ELSE HST_SIT.IDSITFUNC');
        Add('   END               = ST.IDSITFUNC) AND');
      end;
    end;

    if (AnoMesAdmissao <> '') then
      Add('  (TO_CHAR(F.DATAADMISSAO,''YYYY/MM'') = '+QuotedStr(AnoMesAdmissao)+') AND');

    if (AnoMesDemissao <> '') then
      Add('  (TO_CHAR(F.DATADESLIGAMENTO,''YYYY/MM'') = '+QuotedStr(AnoMesDemissao)+') AND');

    if (DataAdmissaoInicial > 0) and (DataAdmissaoFinal > 0) then
    begin
      Add('  (F.DATAADMISSAO   >= TO_DATE('+
        QuotedStr(DateToStr(DataAdmissaoInicial))+ ',''DD/MM/YYYY'')) AND');
      Add('  (F.DATAADMISSAO   <= TO_DATE('+
        QuotedStr(DateToStr(DataAdmissaoFinal))+ ',''DD/MM/YYYY'')) AND');
    end;

    if (DataDemissaoInicial > 0) and (DataDemissaoFinal > 0) then
    begin
      Add('  (F.DATADESLIGAMENTO >= TO_DATE('+
        QuotedStr(DateToStr(DataDemissaoInicial))+ ',''DD/MM/YYYY'')) AND');
      Add('  (F.DATADESLIGAMENTO <= TO_DATE('+
        QuotedStr(DateToStr(DataDemissaoFinal))+ ',''DD/MM/YYYY'')) AND');
    end;

    if (ListaTipoSexo <> '') then
    begin
      Add('  (F.IDPESSOA        = PF.IDPESSOA) AND');
      Add(FFU.MontaLinhaSelSQL('  (PF.SEXO', FFU.QuotedListaString(ListaTipoSexo,','), 10));
    end;

    if (ListaIdDocumento <> '') then
    begin
      if (PossuiIdDocumento) then
        Add('  (F.IDPESSOA        IN (SELECT IDPESSOA')
      else
        Add('  (F.IDPESSOA    NOT IN (SELECT IDPESSOA');

      Add('                         FROM   DOCPESSOA');
      
      if (Pos(',', ListaIdDocumento) > 0) then
        Add('                         WHERE  (IDDOCUMENTO IN (' +ListaIdDocumento+ ')))) AND')
      else
        Add('                         WHERE  (IDDOCUMENTO = ' +ListaIdDocumento+ '))) AND');
    end;

    if (InicioFerias > 0) and (FinalFerias > 0) then
    begin
      Add('  (FE.INIGOZOFERIAS >= TO_DATE(' +
        QuotedStr(DateToStr(InicioFerias))+ ',''DD/MM/YYYY'')) AND');
      Add('  (FE.INIGOZOFERIAS <= TO_DATE(' +
        QuotedStr(DateToStr(FinalFerias))+ ',''DD/MM/YYYY'')) AND');

      if (FeriasOcorridas > -1) then
        Add('  (FE.FLGOCORRIDA = ' +IntToStr(FeriasOcorridas)+ ') AND');

      Add('  (FE.IDPESSOA    = F.IDPESSOA) AND');
    end;

    if (ListaMotivoDesligRAIS <> '') then
    begin
      Add(FFU.MontaLinhaSelSQL('  (MO.MOTIVOFGTS', FFU.QuotedListaString(ListaMotivoDesligRAIS,','), 4));
      Add('  (MO.IDMOTIVO       = F.IDMOTIVODESLIGRAIS) AND');
    end;

    if (TipoHorarioTrab > -1) then
    begin
      Add('  (HT.FLGTIPOHORARIO = '+IntToStr(TipoHorarioTrab)+') AND');
      Add('  (HT.IDHORARIO      = F.IDHORARIO) AND');
    end;

    if (ComLinhaTransporte) then
    begin
      Add('  (F.IDPESSOA        = LP.IDPESSOA) AND');
      Add('  (LP.IDLINHATRANSP  = LT.IDLINHATRANSP) AND');
    end;

    if (DataEvolInicial > 0) then
    begin
      if (ListaIdMotivo <> '') then
        Add(FFU.MontaLinhaSelSQL('  (EF.IDMOTIVO', FFU.QuotedListaString(ListaIdMotivo,','), 1));

      Add('  (EF.DATAALTERFUNC >= TO_DATE(' +
        QuotedStr(DateToStr(DataEvolInicial))+ ',''DD/MM/YYYY'')) AND');
      Add('  (EF.DATAALTERFUNC <= TO_DATE(' +
        QuotedStr(DateToStr(DataEvolFinal))+ ',''DD/MM/YYYY'')) AND');
      Add('  (F.IDPESSOA        = EF.IDPESSOA) AND');
    end;

    Add('  (F.IDPESSOA        = P.IDPESSOA)');

    if not(SituacaoAtual) then
    begin
      if (ListaSitFunc <> '') then
        Add('AND (F.IDPESSOA      = HST_SIT.IDPESSOA(+))');

      if (ListaIdEstab <> '') then
        Add('AND (F.IDPESSOA      = HST_EVOL.IDPESSOA(+))');
    end;

    Add('ORDER BY');
    Add('  NOME');
  end;

  Result := GetDataPacket(FSQL);
end;

function TCtrlPessoaFuncionario.ListEmpresaFuncionario(IdEmpresa: integer; Campos: string;
  ListaIdEstab, ListaSitFunc, ListaTipoContrato, ListaTipoSexo, ListaCodCentroCusto,
  AnoMesAdmissao, AnoMesDemissao, ListaIdDocumento: string; PossuiIdDocumento: boolean;
  InicioFerias, FinalFerias: TDate; FeriasOcorridas, TipoHorarioTrab: integer;
  ListaMotivoDesligRAIS: string; DataAdmissaoInicial, DataAdmissaoFinal, DataDemissaoInicial,
  DataDemissaoFinal: TDate; ComLinhaTransporte: boolean; ListaMatricula,
  ListaIdMotivo: string; DataEvolInicial, DataEvolFinal: TDate; IdUsuario: double;
  SituacaoAtual: boolean; DataRefSituacao: TDate; ListaEstadoCivil, ListaCargo : string): OleVariant;
  //William Santana - SIG 20695 - adicionado ListaEstadoCivil e ListaCargo na função
begin
  with (FSQL) do
  begin
    Clear;
    if not(SituacaoAtual) or (ComLinhaTransporte) or
       (DataEvolInicial > 0) or (InicioFerias > 0) or (FinalFerias > 0) then
      Add('SELECT DISTINCT')
    else  
      Add('SELECT');

    if (Campos <> '') then
      Add('  ' +Campos)
    else
      Add('  F.IDPESSOA, P.NOME');
      Add('  ,F.MATRICULA');  //William Santana - SIG 20695

    Add('FROM');
    Add('  PESSOA P, FUNCIONARIO F');

    if (ListaSitFunc <> '') then
      FSQL[FSQL.Count-1] := FSQL[FSQL.Count-1] + ', SITFUNC ST';

    //if (ListaTipoSexo <> '')                                  //William Santana - SIG 20695
    if (ListaTipoSexo <> '') or (ListaEstadoCivil <> '') then   //William Santana - SIG 20695
      FSQL[FSQL.Count-1] := FSQL[FSQL.Count-1] + ', PESSOAFISICA PF';

    if (InicioFerias > 0) and (FinalFerias > 0) then
      FSQL[FSQL.Count-1] := FSQL[FSQL.Count-1] + ', FERIAS FE';

    if (TipoHorarioTrab > -1) then
      FSQL[FSQL.Count-1] := FSQL[FSQL.Count-1] + ', HORATRAB HT';

    if (ListaMotivoDesligRAIS <> '') then
      FSQL[FSQL.Count-1] := FSQL[FSQL.Count-1] + ', MOTIVO MO';

    if (ComLinhaTransporte) then
      FSQL[FSQL.Count-1] := FSQL[FSQL.Count-1] + ', LINHATRANSP LT, LINHAXPESS LP';

    if (DataEvolInicial > 0) then
      FSQL[FSQL.Count-1] := FSQL[FSQL.Count-1] + ', EVOLFUNC EF';

    if not(SituacaoAtual) then
    begin
      if (ListaSitFunc <> '') then
      begin
        Add('  ,(SELECT H.IDPESSOA, H.IDSITFUNC');
        Add('    FROM   HSTSITFUNC H,');
        Add('           (SELECT MAX(DATASITFUNC) AS DATASITFUNC, IDPESSOA');
        Add('            FROM   HSTSITFUNC');
        Add('            WHERE  (DATASITFUNC <= TO_DATE('+
            QuotedStr(DateToStr(DataRefSituacao))+ ',''DD/MM/YYYY''))');
        Add('            GROUP BY IDPESSOA) HST2,');
        Add('           (SELECT MAX(TRGDTINCLUSAO) AS DATAINCLUSAO, IDPESSOA');
        Add('            FROM   HSTSITFUNC');
        Add('            WHERE  (DATASITFUNC <= TO_DATE('+
            QuotedStr(DateToStr(DataRefSituacao))+ ',''DD/MM/YYYY''))');
        Add('            GROUP BY IDPESSOA) HST3');
        Add('    WHERE  (H.DATASITFUNC   = HST2.DATASITFUNC) AND');
        Add('           (H.IDPESSOA      = HST2.IDPESSOA) AND');
        Add('           (H.TRGDTINCLUSAO = HST3.DATAINCLUSAO) AND');
        Add('           (H.IDPESSOA      = HST3.IDPESSOA)) HST_SIT');
      end;

      if (ListaIdEstab <> '') or (ListaCodCentroCusto <> '') then
      begin
        Add('  ,(SELECT EF.IDPESSOA, EF.IDEMPRESA, EF.IDESTAB, EF.CODCENTROCUSTO');
        Add('    FROM   EVOLFUNC EF,');
        Add('           (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA');
        Add('            FROM   EVOLFUNC');
        Add('            WHERE  (DATAALTERFUNC <= TO_DATE('+
          QuotedStr(DateToStr(DataRefSituacao))+ ',''DD/MM/YYYY''))');
        Add('            GROUP BY IDPESSOA) HST2,');
        Add('           (SELECT MAX(TRGDTINCLUSAO) AS DATAINCLUSAO, IDPESSOA');
        Add('            FROM   EVOLFUNC');
        Add('            WHERE  (DATAALTERFUNC <= TO_DATE('+
          QuotedStr(DateToStr(DataRefSituacao))+ ',''DD/MM/YYYY''))');
        Add('            GROUP BY IDPESSOA) HST3');
        Add('    WHERE  (EF.DATAALTERFUNC = HST2.DATAALTERFUNC) AND');
        Add('           (EF.IDPESSOA      = HST2.IDPESSOA) AND');
        Add('           (EF.TRGDTINCLUSAO = HST3.DATAINCLUSAO) AND');
        Add('           (EF.IDPESSOA      = HST3.IDPESSOA)) HST_EVOL');
      end;
    end;

    Add('WHERE');

    if (ListaSitFunc <> '') then
      Add(FFU.MontaLinhaSelSQL('  (ST.TIPOSIT', FFU.QuotedListaString(ListaSitFunc,','), 7));

    if (FIdUsuarioGeral <> '') then
      Add('  (F.IDPESSOA        = ' +FIdUsuarioGeral+ ') AND');

    if (ListaMatricula <> '') then
      Add(FFU.MontaLinhaSelSQL('  (F.MATRICULA', FFU.QuotedListaString(ListaMatricula,','), 7));

    if (Trim(ListaTipoContrato) <> '') then
      Add(FFU.MontaLinhaSelSQL('  (F.TIPOCONTRATO', FFU.QuotedListaString(ListaTipoContrato,','), 3));

    if not(SituacaoAtual) and (ListaSitFunc <> '') then
      Add('  (F.DATAADMISSAO   <= TO_DATE('+
        QuotedStr(DateToStr(DataRefSituacao))+ ',''DD/MM/YYYY'')) AND');
                                            
    // Estabelecimento
    if (ListaIdEstab <> '') then
    begin
      if (SituacaoAtual) then
        Add(FU.MontaLinhaSelSQL('  (F.IDESTAB', ListaIdEstab, 8))
      else
      begin
        Add(FU.MontaLinhaSelSQL(
          '  (CASE'+CR_LF+
          '     WHEN HST_EVOL.IDESTAB IS NULL THEN F.IDESTAB'+CR_LF+
          '     ELSE HST_EVOL.IDESTAB'+CR_LF+
          '   END', ListaIdEstab, 14));
      end;
    end
    else
    if (FUsuXFilial <> '') then // Estabelecimento(s) habilitados para o usuário
    begin
      if (IdUsuario > 0) then
        Add('  ((F.IDPESSOA = ' +FloatToStr(IdUsuario)+ ') OR');

      Add(FFU.MontaLinhaSelSQL('  (F.IDESTAB', FUsuXFilial, 8, false));
      if (IdUsuario > 0) then
        FSQL[FSQL.Count-1] := FSQL[FSQL.Count-1] + ')';
      FSQL[FSQL.Count-1] := FSQL[FSQL.Count-1] + ' AND';
    end;

    // Centro de Custo
    if (ListaCodCentroCusto <> '') then
    begin
      if (SituacaoAtual) then
      begin
        Add(FFU.MontaLinhaSelSQL('  (F.CODCENTROCUSTO', FFU.QuotedListaString(ListaCodCentroCusto,','), 1));
        if (IdEmpresa > 0) then
          Add('  (F.IDEMPRESA       = ' +IntToStr(IdEmpresa)+ ') AND');
      end
      else
      begin
        Add(FFU.MontaLinhaSelSQL(
          '  ((CASE' +CR_LF+
          '      WHEN HST.CODCENTROCUSTO IS NULL THEN F.CODCENTROCUSTO' +CR_LF+
          '      ELSE HST.CODCENTROCUSTO' +CR_LF+
          '    END)', FFU.QuotedListaString(ListaCodCentroCusto,','), 12));
        if (IdEmpresa > 0) then
        begin
          Add('  ((CASE');
          Add('      WHEN HST.IDEMPRESA IS NULL THEN F.IDEMPRESA');
          Add('      ELSE HST.IDEMPRESA');
          Add('    END)             = ' +IntToStr(IdEmpresa)+ ') AND');
        end;
      end;
    end
    else
    if (FUsuXCCusto <> '') then // C. de Custo(s) habilitados para o usuário
    begin
      if (IdUsuario > 0) then
        Add('  ((F.IDPESSOA       = ' +FloatToStr(IdUsuario)+ ') OR');

      Add(FFU.MontaLinhaSelSQL('  (F.CODCENTROCUSTO', FUsuXCCusto, 1, false));
      if (IdUsuario > 0) then
        FSQL[FSQL.Count-1] := FSQL[FSQL.Count-1] + ')';
      FSQL[FSQL.Count-1] := FSQL[FSQL.Count-1] + ' AND';
    end;

    // Situação Funcional
    if (ListaSitFunc <> '') then
    begin
      if (SituacaoAtual) then
        Add('  (ST.IDSITFUNC      = F.IDSITFUNC) AND')
      else
      begin
        Add('  (CASE');
        Add('     WHEN HST_SIT.IDSITFUNC IS NULL THEN F.IDSITFUNC');
        Add('     ELSE HST_SIT.IDSITFUNC');
        Add('   END               = ST.IDSITFUNC) AND');
      end;
    end;

    if (AnoMesAdmissao <> '') then
      Add('  (TO_CHAR(F.DATAADMISSAO,''YYYY/MM'') = '+QuotedStr(AnoMesAdmissao)+') AND');

    if (AnoMesDemissao <> '') then
      Add('  (TO_CHAR(F.DATADESLIGAMENTO,''YYYY/MM'') = '+QuotedStr(AnoMesDemissao)+') AND');

    if (DataAdmissaoInicial > 0) and (DataAdmissaoFinal > 0) then
    begin
      Add('  (F.DATAADMISSAO   >= TO_DATE('+
        QuotedStr(DateToStr(DataAdmissaoInicial))+ ',''DD/MM/YYYY'')) AND');
      Add('  (F.DATAADMISSAO   <= TO_DATE('+
        QuotedStr(DateToStr(DataAdmissaoFinal))+ ',''DD/MM/YYYY'')) AND');
    end;

    if (DataDemissaoInicial > 0) and (DataDemissaoFinal > 0) then
    begin
      Add('  (F.DATADESLIGAMENTO >= TO_DATE('+
        QuotedStr(DateToStr(DataDemissaoInicial))+ ',''DD/MM/YYYY'')) AND');
      Add('  (F.DATADESLIGAMENTO <= TO_DATE('+
        QuotedStr(DateToStr(DataDemissaoFinal))+ ',''DD/MM/YYYY'')) AND');
    end;

    if (ListaTipoSexo <> '') then
    begin
      Add('  (F.IDPESSOA        = PF.IDPESSOA) AND');
      Add(FFU.MontaLinhaSelSQL('  (PF.SEXO', FFU.QuotedListaString(ListaTipoSexo,','), 10));
    end;

    //Início - William Santana - SIG 20695
    if (ListaEstadoCivil <> '') then
    begin
      Add('  (F.IDPESSOA        = PF.IDPESSOA) AND');
      Add(FFU.MontaLinhaSelSQL('  (PF.ESTCIVIL', FFU.QuotedListaString(ListaEstadoCivil,','), 10));
    end;

    if (ListaCargo <> '') then
    begin
      Add(FFU.MontaLinhaSelSQL('  (NVL(F.IDFUNCAO,F.IDCARGO)', FFU.QuotedListaString(ListaCargo,','), 10));
    end;
    //Término - William Santana - SIG 20695

    if (ListaIdDocumento <> '') then
    begin
      if (PossuiIdDocumento) then
        Add('  (F.IDPESSOA        IN (SELECT IDPESSOA')
      else
        Add('  (F.IDPESSOA    NOT IN (SELECT IDPESSOA');

      Add('                         FROM   DOCPESSOA');
      
      if (Pos(',', ListaIdDocumento) > 0) then
        Add('                         WHERE  (IDDOCUMENTO IN (' +ListaIdDocumento+ ')))) AND')
      else
        Add('                         WHERE  (IDDOCUMENTO = ' +ListaIdDocumento+ '))) AND');
    end;

    if (InicioFerias > 0) and (FinalFerias > 0) then
    begin
      Add('  (FE.INIGOZOFERIAS >= TO_DATE(' +
        QuotedStr(DateToStr(InicioFerias))+ ',''DD/MM/YYYY'')) AND');
      Add('  (FE.INIGOZOFERIAS <= TO_DATE(' +
        QuotedStr(DateToStr(FinalFerias))+ ',''DD/MM/YYYY'')) AND');

      if (FeriasOcorridas > -1) then
        Add('  (FE.FLGOCORRIDA = ' +IntToStr(FeriasOcorridas)+ ') AND');

      Add('  (FE.IDPESSOA    = F.IDPESSOA) AND');
    end;

    if (ListaMotivoDesligRAIS <> '') then
    begin
      Add(FFU.MontaLinhaSelSQL('  (MO.MOTIVOFGTS', FFU.QuotedListaString(ListaMotivoDesligRAIS,','), 4));
      Add('  (MO.IDMOTIVO       = F.IDMOTIVODESLIGRAIS) AND');
    end;

    if (TipoHorarioTrab > -1) then
    begin
      Add('  (HT.FLGTIPOHORARIO = '+IntToStr(TipoHorarioTrab)+') AND');
      Add('  (HT.IDHORARIO      = F.IDHORARIO) AND');
    end;

    if (ComLinhaTransporte) then
    begin
      Add('  (F.IDPESSOA        = LP.IDPESSOA) AND');
      Add('  (LP.IDLINHATRANSP  = LT.IDLINHATRANSP) AND');
    end;

    if (DataEvolInicial > 0) then
    begin
      if (ListaIdMotivo <> '') then
        Add(FFU.MontaLinhaSelSQL('  (EF.IDMOTIVO', FFU.QuotedListaString(ListaIdMotivo,','), 1));

      Add('  (EF.DATAALTERFUNC >= TO_DATE(' +
        QuotedStr(DateToStr(DataEvolInicial))+ ',''DD/MM/YYYY'')) AND');
      Add('  (EF.DATAALTERFUNC <= TO_DATE(' +
        QuotedStr(DateToStr(DataEvolFinal))+ ',''DD/MM/YYYY'')) AND');
      Add('  (F.IDPESSOA        = EF.IDPESSOA) AND');
    end;

    Add('  (F.IDPESSOA        = P.IDPESSOA)');

    if not(SituacaoAtual) then
    begin
      if (ListaSitFunc <> '') then
        Add('AND (F.IDPESSOA      = HST_SIT.IDPESSOA(+))');

      if (ListaIdEstab <> '') then
        Add('AND (F.IDPESSOA      = HST_EVOL.IDPESSOA(+))');
    end;

    Add('ORDER BY');
    Add('  NOME');
  end;

  Result := GetDataPacket(FSQL);
end;

{function TCtrlPessoaFuncionario.ListDadosPessoaTIPO(_query: string):  OleVariant;///douglas.siqueira
var
  _CdsAux: TCMClientDataSet;
begin
 _CdsAux := TCmClientDataSet.Create(nil);
  Result:=GetDataPacket(_query);
  FreeAndNil(_CdsAux);
end;}

function TCtrlPessoaFuncionario.ListDadosParticipante(IdPessoa: double): OleVariant;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCmClientDataSet.Create(nil);
  _CdsAux.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  P2.NOME, P.NOME AS ESTAB, C.TITULO, F.SALARIOATUAL, F.TIPOPAGAMENTO, F.CODCENTROCUSTO,'+CR_LF+
    '  F.DATAADMISSAO, F.DATADESLIGAMENTO AS DATADEMISSAO, MO.DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, PESSOA P2, FUNCIONARIO F, CARGO C, MOTIVO MO'+CR_LF+
    'WHERE'+CR_LF+
    '  (F.IDPESSOA           = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (F.IDPESSOA           = P2.IDPESSOA) AND'+CR_LF+
    '  (F.IDESTAB            = P.IDPESSOA(+)) AND'+CR_LF+
    '  (F.IDCARGO            = C.IDCARGO(+)) AND'+CR_LF+
    '  (F.IDMOTIVODESLIGRAIS = MO.IDMOTIVO(+))');

  if not (_CdsAux.IsEmpty) then
    Result := _CdsAux.Data
  else
    Result := GetDataPacket(
      'SELECT'+CR_LF+
      '  NOME, '' '' AS ESTAB, '' '' AS TITULO, 0.00 AS SALARIOATUAL, '' '' AS TIPOPAGAMENTO,'+CR_LF+
      '  '' '' AS DATAADMISSAO, '' '' AS DATADEMISSAO, '' '' AS DESCRICAO'+CR_LF+
      'FROM'+CR_LF+
      '  PESSOA'+CR_LF+
      'WHERE'+CR_LF+
      '  (IDPESSOA = ' +FloatToStr(IdPessoa)+ ')');

  FreeAndNil(_CdsAux);
end;

function TCtrlPessoaFuncionario.ListDadosParticipante_ComEndereco(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  P.IDENDRESIDENCIAL, P.IDENDCOMERCIAL, EP.IDENDERECO, P.NOME, P.TIPO,'+CR_LF+
    '  P.NUMDOCUMENTO, P.RAZAOSOCIAL, P.EMAIL, CI.NOME AS CIDADE, EP.LOGRADOURO,'+CR_LF+
    '  EP.CODESTADO, EP.NUMERO, EP.COMPLEMENTO, EP.BAIRRO, EP.CEP, ES.NOMEESTADO'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, ENDPESS EP, CIDADES CI, ESTADO ES'+CR_LF+
    'WHERE'+CR_LF+
    '  (P.IDPESSOA          = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  ((P.IDENDRESIDENCIAL = EP.IDENDERECO) OR (P.IDENDRESIDENCIAL IS NULL)) AND'+CR_LF+
    '  ((P.IDENDCOMERCIAL   = EP.IDENDERECO) OR (P.IDENDCOMERCIAL   IS NULL)) AND'+CR_LF+
    '  (EP.IDPESSOA(+)      = P.IDPESSOA) AND'+CR_LF+
    '  (EP.IDCIDADES        = CI.IDCIDADES(+)) AND'+CR_LF+
    '  (CI.IDESTADO         = ES.IDESTADO(+))');
end;

function TCtrlPessoaFuncionario.ListDadosParticipante_ComPlano(IdPessoa,
  IdPatro, IdPlanoPrev: double): OleVariant;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCmClientDataSet.Create(nil);
  _CdsAux.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  P.NOME, PP.IDPESSOA, PP.INSCRICAONUMERO, PP.INSCRICAODATA,'+CR_LF+
    '  PP.SALPARTICIPACAO, EL.MATRICULA, EL.DATAADMISSAO,'+CR_LF+
    '  EL.DATADEMISSAO, CE.TITULO, PPR.NOME AS PLANO, PA.NOME AS PATROC'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, PARTPREVPLAN PP, ELEGPATRO EL, CARGOEXT CE,'+CR_LF+
    '  PLANPREV PPR, PESSOA PA'+CR_LF+
    'WHERE'+CR_LF+
    '  (P.IDPESSOA     = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (P.IDPESSOA     = PP.IDPESSOA) AND'+CR_LF+
    '  (P.IDPESSOA     = EL.IDPESSOA) AND'+CR_LF+
    '  (P.IDPESSOA     = EL.IDPESSOA) AND'+CR_LF+
    '  (PP.IDPESSJUR   = EL.IDPESSJUR) AND'+CR_LF+
    '  (PP.IDPESSJUR   = PA.IDPESSOA) AND'+CR_LF+
    '  (PP.IDPLANOPREV = PPR.IDPLANOPREV) AND'+CR_LF+
    FFU.IFF(IdPatro = -1, '', '  (PP.IDPESSJUR     = ' +FloatToStr(IdPatro)+ ') AND'+CR_LF)+
    FFU.IFF(IdPlanoPrev = -1, '', '  (PP.IDPLANOPREV     = ' +FloatToStr(IdPlanoPrev)+ ') AND'+CR_LF)+
    '  (EL.IDCARGOEXT  = CE.IDCARGOEXT(+))');

  if not (_CdsAux.IsEmpty) then
    Result := _CdsAux.Data
  else
    Result := GetDataPacket(
      'SELECT'+CR_LF+
    '  NOME, IDPESSOA, '' '' AS INSCRICAONUMERO, '' '' AS INSCRICAODATA,'+CR_LF+
    '  '' '' AS SALPARTICIPACAO, '' '' AS MATRICULA, '' '' AS DATAADMISSAO,'+CR_LF+
    '  '' '' AS DATADEMISSAO, '' '' AS TITULO, '' '' AS PLANO, '' '' AS PATROC'+CR_LF+
      'FROM'+CR_LF+
      '  PESSOA'+CR_LF+
      'WHERE'+CR_LF+
      '  (IDPESSOA = ' +FloatToStr(IdPessoa)+ ')');

  FreeAndNil(_CdsAux);
end;

function TCtrlPessoaFuncionario.ListFuncionario_e_Terceiros: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  P.IDPESSOA, UPPER(P.NOME) AS NOME'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, FUNCIONARIO F'+CR_LF+
    'WHERE'+CR_LF+
    '  (F.IDPESSOA = P.IDPESSOA)'+CR_LF+
    'UNION'+CR_LF+
    'SELECT'+CR_LF+
    '  P.IDPESSOA, UPPER(P.NOME) AS NOME'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, TERCEIRO T'+CR_LF+
    'WHERE'+CR_LF+
    '  (T.IDPESSOA = P.IDPESSOA)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  2');
end;

function TCtrlPessoaFuncionario.ListChefe(IdEmpresa: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  PF.NOME, PF.IDPESSOA, C.TITULO'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA PF, FUNCIONARIO F, CARGO C'+CR_LF+
    'WHERE'+CR_LF+
    '  (F.IDEMPRESA = ' +IntToStr(IdEmpresa)+ ') AND'+CR_LF+
    '  (F.IDPESSOA  = PF.IDPESSOA) AND'+CR_LF+
    '  (F.IDCARGO   = C.IDCARGO(+))'+CR_LF+
    'ORDER BY'+CR_LF+
    '  PF.NOME');
end;

function TCtrlPessoaFuncionario.ListFuncNaRescisao(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  P.NOME, C.TITULO, F.*, PF.*'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, PESSOAFISICA PF, FUNCIONARIO F, CARGO C'+CR_LF+
    'WHERE'+CR_LF+
    '  (F.IDPESSOA = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (F.IDPESSOA = PF.IDPESSOA) AND'+CR_LF+
    '  (F.IDPESSOA = P.IDPESSOA) AND'+CR_LF+
    '  (F.IDCARGO  = C.IDCARGO(+))');
end;

function TCtrlPessoaFuncionario.SetDuracaoContrato(DataAdmissao, DataFinalContrato: TDateTime;
  TipoDocuracaoContrato: integer): integer;
var
  NumDias, NumMeses, NumAnos: integer;
begin
  try
    if (DataAdmissao > 0) then
      FFU.CalculaDifData(DateToStr(DataAdmissao), DateToStr(DataFinalContrato + 1), NumDias, NumMeses, NumAnos)          //MONICA -  Número da SOL: 172600 ADD + 1 NO DataFinalContrato
    else
      FFU.CalculaDifData(DateToStr(Date), DateToStr(DataFinalContrato + 1), NumDias, NumMeses, NumAnos);  //MONICA -  Número da SOL: 172600 ADD + 1 NO DataFinalContrato

    case (TipoDocuracaoContrato) of
      1 :  Result := NumDias + 1;
      2 :  Result := (NumDias + 1) div 7;
      4 :  Result := NumAnos;
      else Result := NumMeses + 1;
    end;
  except
    Result := 0;
  end;
end;

function TCtrlPessoaFuncionario.SetDataFinalContrato(DataAdmissao: TDateTime;
  DocuracaoContrato, TipoDocuracaoContrato: integer): boolean;
begin
  try
    case (TipoDocuracaoContrato) of
      1 : CdsSubTipo.FieldByName('DATAFIMCONTRATO').asString :=
        FFU.IncData(DateToStr(DataAdmissao), DocuracaoContrato-1, 0, 0);
      2 : CdsSubTipo.FieldByName('DATAFIMCONTRATO').asString :=
        FFU.IncData(DateToStr(DataAdmissao), (DocuracaoContrato*7)-1, 0, 0);
      3 : CdsSubTipo.FieldByName('DATAFIMCONTRATO').asString :=
        FFU.IncData(DateToStr(DataAdmissao), -1, DocuracaoContrato, 0);
      4 : CdsSubTipo.FieldByName('DATAFIMCONTRATO').asString :=
        FFU.IncData(DateToStr(DataAdmissao), -1, 0, DocuracaoContrato);
    end;
    Result := true;
  except
    Result := false;
  end;
end;

procedure TCtrlPessoaFuncionario.GuardarAlteracaoEndereco;
begin
  FMudouEndResid :=
    (CdsPessoa.FieldByName('IDENDRESIDENCIAL').asFloat =
     CdsEndPess.FieldByName('IDENDERECO').asFloat) and
    ((FHstEndPess.Logradouro  <> CdsEndPess.FieldByName('LOGRADOURO').asString) or
     (FHstEndPess.Complemento <> CdsEndPess.FieldByName('COMPLEMENTO').asString) or
     (FHstEndPess.Bairro      <> CdsEndPess.FieldByName('BAIRRO').asString) or
     (FHstEndPess.CEP         <> CdsEndPess.FieldByName('CEP').asString) or
     (FHstEndPess.IdCidades   <> CdsEndPess.FieldByName('IDCIDADES').asInteger) or
     (FHstEndPess.Numero      <> CdsEndPess.FieldByName('NUMERO').asString));

  if (FMudouEndResid) then
  begin
    FHstEndPess.Logradouro := CdsEndPess.FieldByName('LOGRADOURO').asString;
    FHstEndPess.Complemento := CdsEndPess.FieldByName('COMPLEMENTO').asString;
    FHstEndPess.Bairro := CdsEndPess.FieldByName('BAIRRO').asString;
    FHstEndPess.CEP := CdsEndPess.FieldByName('CEP').asString;
    FHstEndPess.IdCidades := CdsEndPess.FieldByName('IDCIDADES').asInteger;
    FHstEndPess.Numero := CdsEndPess.FieldByName('NUMERO').asString;
  end;
end;

function TCtrlPessoaFuncionario.GetMatriculaJaExiste(Matricula: string; IdEmpresa: double): double;
var
  _CdsAux: TCMClientDataSet;
begin
  try
    _CdsAux := TCMClientDataSet.Create(nil);

    _CdsAux.Data := GetDataPacket(
      'SELECT'+CR_LF+
      '  IDPESSOA'+CR_LF+
      'FROM'+CR_LF+
      '  FUNCIONARIO'+CR_LF+
      'WHERE'+CR_LF+
      '  (MATRICULA = ' +QuotedStr(Matricula)+ ') AND'+CR_LF+
      '  (IDEMPRESA = ' +FloatToStr(IdEmpresa)+ ')');

    Result := _CdsAux.FieldByName('IDPESSOA').asFloat;

    _CdsAux.Free;
  except
    Result := 0;
  end;
end;

function TCtrlPessoaFuncionario.GetProxMatricula(Tamanho: byte): string;
var
  sMascara: string;
  _CdsAux: TCMClientDataSet;
begin
  sMascara := QuotedStr(FFU.Replicate('0', Tamanho));
  try
    _CdsAux := TCMClientDataSet.Create(nil);

    _CdsAux.Data := GetDataPacket(
      'SELECT'+CR_LF+
      '  RTRIM(TO_CHAR(MAX(TO_NUMBER(MATRICULA))+1,' +sMascara+ ')) AS PROXIMA'+CR_LF+
      'FROM'+CR_LF+
      '  FUNCIONARIO');

    Result := _CdsAux.FieldByName('PROXIMA').asString;

    _CdsAux.Free;
  except
    Result := '';
  end;
end;

function TCtrlPessoaFuncionario.GetGodigoGrpFunc(IdPessoa: double): string;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  _CdsAux.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  C.CODGRPFUNC'+CR_LF+
    'FROM'+CR_LF+
    '  FUNCIONARIO F, CARGO C'+CR_LF+
    'WHERE'+CR_LF+
    '  (F.IDPESSOA = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (F.IDCARGO  = C.IDCARGO)');

  Result := Trim(_CdsAux.FieldByName('CODGRPFUNC').asString);

  _CdsAux.Free;
end;

function TCtrlPessoaFuncionario.GetNumAdmitidos(IdEmpresa: double; CodCentroCusto,
  AnoBarraMes: string): integer;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  _CdsAux.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  COUNT(*) AS NUM_ADMISSOES'+CR_LF+
    'FROM'+CR_LF+
    '  FUNCIONARIO F, EVOLFUNC E'+CR_LF+
    'WHERE'+CR_LF+
    '  (E.CODCENTROCUSTO = ' +QuotedStr(CodCentroCusto)+ ') AND'+CR_LF+
    '  (E.IDEMPRESA      = ' +FloatToStr(IdEmpresa)+ ') AND'+CR_LF+
    '  (TO_CHAR(E.DATAALTERFUNC,''YYYY/MM'') = ' +QuotedStr(AnoBarraMes)+ ') AND'+CR_LF+
    '  (E.IDPESSOA       = F.IDPESSOA) AND'+CR_LF+
    '  (E.DATAALTERFUNC  = F.DATAADMISSAO)');
  Result := _CdsAux.FieldByName('NUM_ADMISSOES').asInteger;

  _CdsAux.Free;
end;

function TCtrlPessoaFuncionario.GetNumDemitidos(IdEmpresa: double; CodCentroCusto,
  AnoBarraMes: string): integer;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  _CdsAux.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  COUNT(*) AS NUM_DEMISSOES'+CR_LF+
    'FROM'+CR_LF+
    '  FUNCIONARIO F, SITFUNC SF'+CR_LF+
    'WHERE'+CR_LF+
    '  (SF.TIPOSIT       = ''D'') AND'+CR_LF+
    '  (F.CODCENTROCUSTO = ' +QuotedStr(CodCentroCusto)+ ') AND'+CR_LF+
    '  (F.IDEMPRESA      = ' +FloatToStr(IdEmpresa)+ ') AND'+CR_LF+
    '  (TO_CHAR(F.DATADESLIGAMENTO,''YYYY/MM'') = ' +QuotedStr(AnoBarraMes)+ ') AND'+CR_LF+
    '  (SF.IDSITFUNC     = F.IDSITFUNC)');
  Result := _CdsAux.FieldByName('NUM_DEMISSOES').asInteger;

  _CdsAux.Free;
end;

function TCtrlPessoaFuncionario.GetCodCentroCusto(IdPessoa: double): string;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  _CdsAux.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  CODCENTROCUSTO'+CR_LF+
    'FROM'+CR_LF+
    '  FUNCIONARIO'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDPESSOA      = ' +FloatToStr(IdPessoa)+ ')');
  Result := _CdsAux.FieldByName('CODCENTROCUSTO').asString;

  _CdsAux.Free;
end;

function TCtrlPessoaFuncionario.GerarProcessoRAD: boolean;
var
  bOk: boolean;
  sOBS: string;
{-->}function GetMotivoDesligamento: string;
     var
       _CdsAux: TCMClientDataSet;
     begin
       _CdsAux := TCMClientDataSet.Create(nil);

       _CdsAux.Data := FCtrlMotivo.ListGeral(
         CdsSubTipo.FieldByName('IDMOTIVODESLIGRAIS').asInteger);

       Result := _CdsAux.FieldByName('DESCRICAO').asString;

       _CdsAux.Free;
{-->}end;
begin
  MessageInfo := '';
  try
    if (FIdTipoProcesso > 0) then
    begin
      sOBS :=
        'Desligamento de: ' + Trim(CdsSubTipo.FieldByName('NOME').asString) +CR_LF+
        'Data de Desligamento: ' + CdsSubTipo.FieldByName('DATADESLIGAMENTO').asString +CR_LF+
        'Data do Aviso Prévio: ' + CdsSubTipo.FieldByName('DATAAVISO').asString +CR_LF+
        'Aviso Trabalhado: ' +
          FFU.IFF(CdsSubTipo.FieldByName('SALARIOTIPO').asString='S', 'Sim', 'Não') +CR_LF+
        'Motivo do Desligamento: ' + GetMotivoDesligamento;

      if (CdsSubTipo.FieldByName('IDPROCESSODEM').asInteger <= 0) then
      begin
        FCtrlRad.TipoProcesso := FIdTipoProcesso;
        FCtrlRad.IdPessoa := FIdEmpresa;
        FCtrlRad.IdUsuario := FIdUsuario;
        FCtrlRad.IdPessResp := Trunc(CdsSubTipo.FieldByName('IDPESSOA').asFloat);
        FCtrlRad.OBS := sOBS;
        FCtrlRad.IdEmpresa := CdsSubTipo.FieldByName('IDEMPRESA').asInteger;
        FCtrlRad.CodCentroCusto := CdsSubTipo.FieldByName('CODCENTROCUSTO').asString;

        CdsSubTipo.FieldByName('IDPROCESSODEM').asInteger := FCtrlRad.IniciarProcesso;

        if (CdsSubTipo.FieldByName('IDPROCESSODEM').asInteger < 0) then
          raise Exception.Create('Erro ao tentar instanciar o processo no RAD.'+
            CR_LF + FCtrlRad.MessageInfo)
        else
          MessageInfo := 'Nº do Processo RAD Gerado: ' +
            CdsSubTipo.FieldByName('IDPROCESSODEM').asString;
      end
      else
      begin
        bOk := ExecSQL('UPDATE RADINSTPROCESSO SET OBS = ' +QuotedStr(sOBS)+
                       ' WHERE IDPROCESSO = ' +CdsSubTipo.FieldByName('IDPROCESSODEM').asString);
        if not(bOk) then
          raise Exception.Create('Erro ao tentar atualizar o processo no RAD.'+
            CR_LF + MessageInfo);
      end;
    end;
    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlPessoaFuncionario.GravarSubTipos(Operacao: TOperacao; var Mensagem: string): boolean;
var
  sMensagem: WideString; // Necessário para fazer a conversão de WideString da
                         // Aplicação Servidora com o STRING do Delphi
begin
  if (ConnectionSide = cnsClient) then
  begin
    sMensagem := Mensagem;
    Result := Connection.AppServer.GravarPessoaRescisao(Integer(Operacao), sMensagem,
      CdsSubTipo.Data);
    Mensagem := sMensagem;
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      Result := ProcessaOutros(Operacao, Mensagem);
    except
      on E: Exception do
      begin
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlPessoaFuncionario.ProcessaOutros(Operacao: TOperacao; var Mensagem: string): boolean;
begin
  Mensagem := '';
  try
    if (Operacao = opApagar) then
    begin
      if (FUsaUltimosEmpregos) then
        if not(FCdsUltEmpr.IsEmpty) then
        begin
          while not(FCdsUltEmpr.EOF) do
            FCdsUltEmpr.Delete;
          Result := ApplyCds(FCdsUltEmpr, FDbUltEmpr, [], []);
          if not(Result) then
            raise Exception.Create(FDbUltEmpr.MessageInfo);
        end; 

      if (FUsaEstrangeiro) then
        if not(FCdsEstrangeiro.IsEmpty) then
        begin
          FCdsEstrangeiro.Delete;
          Result := ApplyCds(FCdsEstrangeiro, FDbEstrangeiro, [], []);
          if not(Result) then
            raise Exception.Create(FDbEstrangeiro.MessageInfo);
        end;

      CdsSubTipo.Delete;
      Result := ApplyCds(CdsSubTipo, FDbFuncionario, [], []);
      if not(Result) then
        raise Exception.Create(FDbFuncionario.MessageInfo);

      CdsPessoaFisica.Delete;
      Result := ApplyCds(CdsPessoaFisica, _DbPessoaFisica, [], []);
      if not(Result) then
        raise Exception.Create(_DbPessoaFisica.MessageInfo);

       // Felipe A. Santos SOL 229871.16137 - início
      if not(CdsEstagiario.IsEmpty) then
      begin
        CdsEstagiario.Delete;
        Result := ApplyCds(CdsEstagiario, FDbEstagiario, [], []);
        if not(Result) then
          raise Exception.Create(FDbEstagiario.MessageInfo);
      end;

      if not(CdsDadosCessao.IsEmpty) then
      begin
        CdsDadosCessao.Delete;
        Result := ApplyCds(CdsDadosCessao, FDbDadosCessao, [], []);
        if not(Result) then
          raise Exception.Create(FDbDadosCessao.MessageInfo);
      end;
      // Felipe A. Santos SOL 229871.16137 - fim

      //Cássio Rovaroto - SIG nº 38745.59780 - Início
      Result := ApplyCds(CdsProcessosXIndicativoSusp, FDbProcessosXIndicativoSusp, [FDbProcessos.IdProcesso], [] );
        if not Result then Raise Exception.Create(FDbProcessosXIndicativoSusp.MessageInfo);

			Result := ApplyCds(CdsProcessos, FDbProcessos, [], [] );
        if not Result then Raise Exception.Create(FDbProcessos.MessageInfo);
      //Cássio Rovaroto - SIG nº 38745.59780 - Fim

      FIdPessoa := -1;

    end
    else
    begin
      if (FIntegraRAD) then
      begin
        if (GerarProcessoRAD) then
          Mensagem := MessageInfo
        else
          raise Exception.Create(MessageInfo);
      end;

      //Início - William Santana - SOL 211502.16259 PPM 442499
      If Assigned(CdsImagemOutro) Then  // SOL 244940 PPM 610711
      CdsSubTipo.FieldByName('IdImgRecisao').AsFloat := CdsImagemOutro.FieldByName('IDIMAGEM').AsFloat;
      //Término - William Santana - SOL 211502.16259 PPM 442499

      // Felipe A. Santos SOL 229871.16137 - início

      If Assigned(CdsEstagiario) Then //Everson Cunha - SIG 77836 Tibero - 05/11/2018
      // Andre Imakawa - SIG 74938 - Inicio
      if CdsEstagiario.isempty then
        FDbEstagiario.clear;
      // Andre Imakawa - SIG 74938 - Fim  

      If Assigned(CdsEstagiario) Then  // SOL 244940 PPM 610711
      begin
        Result := ApplyCds(CdsEstagiario, FDbEstagiario, [], []);
        if not(Result) then
          raise Exception.Create(FDbEstagiario.MessageInfo);
      end;

      If Assigned(CdsDadosCessao) Then //Everson Cunha - SIG 77836 Tibero - 05/11/2018
      // Andre Imakawa - SIG 74938 - Inicio
      if CdsDadosCessao.isempty then
        FDbDadosCessao.clear;
      // Andre Imakawa - SIG 74938 - Fim

      If Assigned(CdsDadosCessao) Then  // SOL 244940 PPM 610711
      begin
        Result := ApplyCds(CdsDadosCessao, FDbDadosCessao, [], []);
        if not(Result) then
          raise Exception.Create(FDbDadosCessao.MessageInfo);
      end;
      // Felipe A. Santos SOL 229871.16137 - fim


        Result := ApplyCds(CdsSubTipo, FDbFuncionario,
                          [_DbPessoa.IdPessoa,
                          FDbDadosCessao.IdDadosCessao, // Felipe A. Santos SOL 229871.16137
                          FDbEstagiario.IdEstagiario] // Felipe A. Santos SOL 229871.16137
                          [FDbFuncionario.IdPessoa,
                          FDbFuncionario.IdDadosCessao, // Felipe A. Santos SOL 229871.16137
                          FDbFuncionario.IdEstagiario] // Felipe A. Santos SOL 229871.16137
                          True); // Felipe A. Santos SOL 229871.16137

        // Alterado por FHBS - 30/12/2019 - SIG94537
        if Result then
        begin
          Result := ExecSQL('UPDATE DEPENTIT ' +
                            '   SET MATRICULA = ' + QuotedStr(CdsSubTipo.FieldByName('MATRICULA').AsString) +
                            ' WHERE IDPESSOA = ' + CdsSubTipo.FieldByName('IDPESSOA').AsString );
        end;
        // Fim - Alterado por FHBS - 30/12/2019 - SIG94537

        if not(Result) then
          raise Exception.Create(FDbFuncionario.MessageInfo);

      if (FUsaUltimosEmpregos) then
      begin
        Result := ApplyCds(FCdsUltEmpr, FDbUltEmpr,
          [FDbFuncionario.IdPessoa], [FDbUltEmpr.IdPessoa]);
        if not(Result) then
          raise Exception.Create(FDbUltEmpr.MessageInfo);
      end;

      if (FUsaEstrangeiro) then
      begin
        Result := ApplyCds(FCdsEstrangeiro, FDbEstrangeiro,
          [FDbFuncionario.IdPessoa], [FDbEstrangeiro.IdPessoa]);
        if not(Result) then
          raise Exception.Create(FDbEstrangeiro.MessageInfo);
      end;

      // Felipe A. Santos SOL 207737 KTN 2018095
      if (FUsaContratoTemp) then
      begin

        Result := ApplyCds(FCdsContratoTemp, FDbContratoTemp, [FDbFuncionario.IdPessoa], [FDbContratoTemp.IdPessoa]);

        if not Result then
           raise Exception.Create(FDbContratoTemp.MessageInfo);

        cdsContratoTempSubst.First;
        while not cdsContratoTempSubst.Eof do
        begin
           cdsContratoTempSubst.Edit;
           cdsContratoTempSubst.FieldByName('IDCONTRATOTEMP').AsInteger := FDbContratotemp.IdContratoTemp.AsInteger;
           cdsContratoTempSubst.Post;
           cdsContratoTempSubst.Next;
        end;


        Result := ApplyCds(FcdsContratoTempSubst, FDbContratoTempSubst, [], []);

        if not Result then
           raise Exception.Create(FDbContratoTempSubst.MessageInfo);

        FcdsContratoTempObs.First;
        while not cdsContratoTempObs.Eof do
        begin
            FcdsContratoTempObs.Edit;
            FcdsContratoTempObs.FieldByName('IDCONTRATOTEMP').AsInteger := FDbContratotemp.IdContratoTemp.AsInteger;
            FcdsContratoTempObs.Post;
            FcdsContratoTempObs.Next;
        end;

        Result := ApplyCds(FcdsContratoTempObs, FDbContratoTempObs, [], []);

         if not Result then
           raise Exception.Create(FDbContratoTempObs.MessageInfo);
      end;
      // Felipe A. Santos SOL 207737 KTN 2018095

      //Cássio Rovaroto - SIG nº 64144 - Início
      if (FUsaProcesso) then
      begin
        // Início - Michelle Mota - SOL: 250384.17324 - PPM: 1070235
        Result :=  ApplyCds(CdsProcessos, FDbProcessos, [FDbFuncionario.IdPessoa], [FDbProcessos.IdFuncionario] );
        if not Result then Raise Exception.Create(FDbProcessos.MessageInfo);
        // Término - Michelle Mota - SOL: 250384.17324 - PPM: 1070235

        //Cássio Rovaroto - SIG nº 38475.59780 - Início
        Result :=  ApplyCds(CdsProcessosXIndicativoSusp, FDbProcessosXIndicativoSusp, [], [] );
        if not Result then Raise Exception.Create(FDbProcessosXIndicativoSusp.MessageInfo);
        //Cássio Rovaroto - SIG nº 38475.59780 - Fim
      end;
      //Cássio Rovaroto - SIG nº 64114 - Fim

      if FDbFuncionario.IdPessoa.asFloat > 0 then  // SOL 244940 PPM 610711
      FIdPessoa := FDbFuncionario.IdPessoa.asFloat;
   end;
    FPassouGravacao := true;
  except
    on E:Exception do
    begin
      Result := false;
      Mensagem := E.Message;
    end;
  end;
end;

procedure TCtrlPessoaFuncionario.InitHstDocumentos;
begin
  _Cds.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDDOCUMENTO, DECODE(SIGLADOCUMENTO,''CTPS:'',1,''PIS/PASEP:'',2,3) AS CAMPO'+CR_LF+
    'FROM'+CR_LF+
    '  TIPODOCOFICIAL'+CR_LF+
    'WHERE'+CR_LF+
    '  (SIGLADOCUMENTO IN (''PIS/PASEP:'',''CTPS:'',''CPF:''))');

  // Limpo a Variável de Histórico
  FillChar(FHstDoc_Ant, SizeOf(FHstDoc_Ant), 0);
  FillChar(FHstDoc_Atu, SizeOf(FHstDoc_Atu), 0);

  FHstDoc_Ant[1].Codigo := 'CTPS';  // CTPS
  FHstDoc_Ant[2].Codigo := 'PIS';   // PIS
  FHstDoc_Ant[3].Codigo := 'CPF';   // CPF
  //FHstDoc_Ant[4].Codigo := 'MATCA'; // Matrícula Caixa

  // Preencho o IdDocumento correspondente
  if not(_Cds.IsEmpty) then
  begin
    repeat
      FHstDoc_Ant[_Cds.FieldByName('CAMPO').asInteger].IdDocumento :=
        _Cds.FieldByName('IDDOCUMENTO').asInteger;
      FHstDoc_Atu[_Cds.FieldByName('CAMPO').asInteger].IdDocumento :=
        _Cds.FieldByName('IDDOCUMENTO').asInteger;
      _Cds.Next;
    until (_Cds.EOF);
  end;
end;
 //Definir código com 5 caracteres
procedure TCtrlPessoaFuncionario.InitHstAltCad;
begin
  FHstAltCad_Ant[01].Codigo := 'MATRI'; // Matrícula
  FHstAltCad_Ant[02].Codigo := 'NOME';  // Nome do Empregado
  FHstAltCad_Ant[03].Codigo := 'DTNAS'; // Data de Nascimento
  FHstAltCad_Ant[04].Codigo := 'DTADM'; // Data de Admissão
  FHstAltCad_Ant[05].Codigo := 'HORTR'; // Horário de Trabalho
  FHstAltCad_Ant[06].Codigo := 'NOMCH'; // Nome do Chefe
  FHstAltCad_Ant[07].Codigo := 'GRINS'; // Grau de Instrução
  FHstAltCad_Ant[08].Codigo := 'ESTCV'; // Estado Civil
  FHstAltCad_Ant[09].Codigo := 'NOMSI'; // Sindicato
  FHstAltCad_Ant[10].Codigo := 'PROFI'; // Profissão
  FHstAltCad_Ant[11].Codigo := 'NIRRF'; // Número de Dependentes p/ IRFF
  FHstAltCad_Ant[12].Codigo := 'NSALF'; // Número de Dependentes p/ Sal. Fam.
  FHstAltCad_Ant[13].Codigo := 'NTELE'; // Número do Telefone
  FHstAltCad_Ant[14].Codigo := 'TPCTR'; // Tipo do contrato
  FHstAltCad_Ant[15].Codigo := 'SITDR'; // Situação de Risco
  FHstAltCad_Ant[16].Codigo := 'CTGEM'; // Categoria Empregado
  FHstAltCad_Ant[17].Codigo := 'NUDDD'; // Número DDD
  FHstAltCad_Ant[18].Codigo := 'NUDDI'; // Número DDI
  FHstAltCad_Ant[19].Codigo := 'NOBAN'; // Nome do Banco
  FHstAltCad_Ant[20].Codigo := 'TPCON'; // Tipo da Conta
  FHstAltCad_Ant[21].Codigo := 'NUAGE'; // Número da Agência
  FHstAltCad_Ant[22].Codigo := 'NUCON'; // Número da Conta Corrente
  FHstAltCad_Ant[23].Codigo := 'COPRE'; // Conta Preferencial
  FHstAltCad_Ant[24].Codigo := 'MATCX'; // Matrícula Caixa
  FHstAltCad_Ant[25].Codigo := 'BANSA'; // Banco da conta Salário
  FHstAltCad_Ant[26].Codigo := 'AGESA'; // Agência da conta Salário
  FHstAltCad_Ant[27].Codigo := 'CONSA'; // Número da conta Salário








end;

procedure TCtrlPessoaFuncionario.SelDadosEvolFunc;
begin
  FDadosHist.DataAdmissao := FFU.IFF(CdsSubTipo.FieldByName('DATAADMISSAO').asDateTime<=0,
    Date, CdsSubTipo.FieldByName('DATAADMISSAO').asDateTime);
  FDadosHist.CodCentroCusto := CdsSubTipo.FieldByName('CODCENTROCUSTO').asString;
  FDadosHist.SalarioAtual := CdsSubTipo.FieldByName('SALARIOATUAL').asFloat;
  FDadosHist.IdMotivoDesligRAIS := CdsSubTipo.FieldByName('IDMOTIVODESLIGRAIS').asFloat;
  FDadosHist.IdEstab := CdsSubTipo.FieldByName('IDESTAB').asFloat;
  FDadosHist.IdCargo := CdsSubTipo.FieldByName('IDCARGO').asFloat;



  FDadosHist.IDFUNCAO := CdsSubTipo.FieldByName('IDFUNCAO').asFloat;
  FDadosHist.NIVELINDIV1 := CdsSubTipo.FieldByName('NIVELINDIV1').asFloat;
  FDadosHist.NIVELINDIV2 := CdsSubTipo.FieldByName('NIVELINDIV2').asFloat;


  FDadosHist.TipoPagamento := CdsSubTipo.FieldByName('TIPOPAGAMENTO').asString;
//Higor Nayde Ferreira Sol 188194 - Kintana 1779198 INICIO
  FDadosHist.IdVlrFuncao := CdsSubTipo.FieldByName('VLRFUNCAO').asFloat;
  FDadosHist.DateFUNCAO := FFU.IFF(CdsSubTipo.FieldByName('DATAFUNCAO').asDateTime<=0,
   Date, CdsSubTipo.FieldByName('DATAFUNCAO').asDateTime);
  FDadosHist.IdVLRSALFUNC := CdsSubTipo.FieldByName('VLRSALARIOFUNCAO').asFloat;
//Higor Nayde Ferreira Sol 188194 - Kintana 1779198 FIM
end;

procedure TCtrlPessoaFuncionario.SelDadosSitFunc(TipoSit: string);
begin
  FidPessoa :=  IdPessoa; //SOL 244940 PPM 610711
  if (TipoSit <> 'A') and not(CdsSubTipo.FieldByName('DataDesligamento').IsNull) then
    FDadosHist.DataSit := CdsSubTipo.FieldByName('DataDesligamento').asDateTime
  else
  if (TipoSit = 'A') and not(CdsSubTipo.FieldByName('DataRetorno').IsNull) then
    FDadosHist.DataSit := CdsSubTipo.FieldByName('DataRetorno').asDateTime
  else
  if not(CdsSubTipo.FieldByName('DataAdmissao').IsNull) then
    FDadosHist.DataSit := CdsSubTipo.FieldByName('DataAdmissao').asDateTime
  else
    FDadosHist.DataSit := Date;

  FDadosHist.IdSitFunc := CdsSubTipo.FieldByName('IDSITFUNC').asFloat;
  FDadosHist.IdMotivoDesligRAIS := CdsSubTipo.FieldByName('IDMOTIVODESLIGRAIS').asFloat;
  FDadosHist.IdMotivoDesligGerencial := CdsSubTipo.FieldByName('IDMOTIVODESLIGGERENCIAL').asFloat;
  FDadosHist.IdMovContrCAGED := CdsSubTipo.FieldByName('IDMOVCONTRCAGED').asFloat;
end;

procedure TCtrlPessoaFuncionario.SelHstDocumentos(PrimeiraVez: boolean);
var
  c: byte;
  HstDoc: ^THstDocumentos;
  Marca: TBookmark;
begin
  if (PrimeiraVez) then
    HstDoc := @FHstDoc_Ant
  else
    HstDoc := @FHstDoc_Atu;

  CdsDocPessoa.DisableControls;
  Marca := CdsDocPessoa.GetBookmark;

  for c:=1 to NUM_DOC_ALT do
    if (CdsDocPessoa.Locate('IDDOCUMENTO', HstDoc[c].IdDocumento, [])) then
      HstDoc[c].Numero := Trim(CdsDocPessoa.FieldByname('NUMDOCUMENTO').asString)
    else
      HstDoc[c].Numero := '';

  CdsDocPessoa.GotoBookmark(Marca);
  CdsDocPessoa.FreeBookmark(Marca);
  CdsDocPessoa.EnableControls;
end;
// uma variável para cada campo.
procedure TCtrlPessoaFuncionario.SelHstAltCad(PrimeiraVez: boolean;
                                              Matricula,
                                              Nome: string;
                                              DataNasc,
                                              DataAdm: TDate;
                                              Horario,
                                              Chefe,
                                              GrauInstr,
                                              EstadoCivil,
                                              Sindicato,
                                              Profissao: string;
                                              NumDepIRRF,
                                              NumDepSalFam,
                                              NumTelefone:integer;
                                              TipoContrato,
                                              SituacaoDeRisco,
                                              CatEmpregado,
                                              NumDDD,
                                              NumDDI,
                                              Banco : string;
                                              TipoConta: Integer;
                                              NumAgencia,
                                              ContaCorrente,
                                              ContaPref,
                                              MatCaixa,
                                              BancoSalario,
                                              AgenciaSalario,
                                              ContaSalario : String);

var
  HstAltCad: ^THstAltCad;
begin


  if (PrimeiraVez) then
    HstAltCad := @FHstAltCad_Ant
  else
    HstAltCad := @FHstAltCad_Atu;

  HstAltCad[01].Valor := Trim(Matricula);
  HstAltCad[02].Valor := Trim(Nome);
  HstAltCad[03].Valor := DateToStr(DataNasc);
  HstAltCad[04].Valor := DateToStr(DataAdm);
  HstAltCad[05].Valor := Trim(Horario);
  HstAltCad[06].Valor := Trim(Chefe);
  HstAltCad[07].Valor := Trim(GrauInstr);
  HstAltCad[08].Valor := Trim(EstadoCivil);
  HstAltCad[09].Valor := Trim(Sindicato);
  HstAltCad[10].Valor := Trim(Profissao);
  try
    HstAltCad[11].Valor := IntToStr(NumDepIRRF);
  except
    on EConvertError do
      HstAltCad[11].Valor := ''
  end;
  HstAltCad[12].Valor := IntToStr(NumDepSalFam);
  HstAltCad[13].Valor := IntToStr(NumTelefone);
  HstAltCad[14].Valor := Trim(TipoContrato);
  HstAltCad[15].Valor := Trim(SituacaoDeRisco);
  HstAltCad[16].Valor := Trim(CatEmpregado);
  HstAltCad[17].Valor := Trim(NumDDD);
  HstAltCad[18].Valor := Trim(NumDDI);
  HstAltCad[19].Valor := Trim(Banco);
  HstAltCad[20].Valor := IntToStr(TipoConta);
  HstAltCad[21].Valor := Trim(NumAgencia);
  HstAltCad[22].Valor := Trim(ContaCorrente);
  HstAltCad[23].Valor := Trim(ContaPref);
  HstAltCad[24].Valor := Trim(MatCaixa);
  HstAltCad[25].Valor := Trim(BancoSalario);
  HstAltCad[26].Valor := Trim(AgenciaSalario);
  HstAltCad[27].Valor := Trim(ContaSalario);




end;

function TCtrlPessoaFuncionario.GravarHistorico(GravarHstAltCad, Inserindo: boolean;
  IdEmpresa: double): boolean;
var
  iNumErros: integer;
  sMensagem: string;
  OLD_OnMessageInfo: TOnMessageInfo;
begin
  try
    Result := true;

    OLD_OnMessageInfo := OnMessageInfo;
    OnMessageInfo := nil;

    FInserindo := Inserindo;
    iNumErros := 0;
    sMensagem := '';
    MessageInfo := '';

    // Histórico de Alteração da Evolução Funcional apenas na Inclusão do Empregado
    if (FInserindo) then
    begin
      Result := GravarHstAltEvolFunc(IdEmpresa);
      if not(Result) then
      begin
        Inc(iNumErros);
        sMensagem := CR_LF+ MessageInfo;
      end;
    end;

    // Histórico de Alteração da Situação Funcional
    if (FMudouSituacao) then
    begin
      Result := GravarHstAltSitFunc;
      if not(Result) then
      begin
        Inc(iNumErros);
        sMensagem := sMensagem +CR_LF+ MessageInfo;
      end;
    end;

    if (GravarHstAltCad) then
    begin
      // Mudança de Endereço
      if (FMudouEndResid) then
      begin
        Result := GravarHstAltEndereco;
        if not(Result) then
        begin
          Inc(iNumErros);
          sMensagem := sMensagem +CR_LF+ MessageInfo;
        end;
      end;

      // Documentos
      Result := GravarHstDocumentos;
      if not(Result) then
      begin
        Inc(iNumErros);
        sMensagem := sMensagem +CR_LF+ MessageInfo;
      end;

      // Alterações Cadastrais Diversas
      Result := GravarHstAltCadastral;
      if not(Result) then
      begin
        Inc(iNumErros);
        sMensagem := sMensagem +CR_LF+ MessageInfo;
      end;
    end;

    if (sMensagem <> '') then
    begin
      MessageInfo := 'Ocorreu um erro ao tentar gravar:' + sMensagem;
      Result := (iNumErros < 3);
    end;

    OnMessageInfo := OLD_OnMessageInfo;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;  
  end;
end;

function TCtrlPessoaFuncionario.GravarHstAltSitFunc: boolean;
begin
  try
    StartTransaction;
    FIdPessoa := IdPessoa ; //SOL 244940 PPM 610711
    _Cds.Data := GetDataPacket(
      'SELECT IDPESSOA'+CR_LF+
      'FROM   HSTSITFUNC'+CR_LF+
      'WHERE  (IDPESSOA    = ' +FloatToStr(FIdPessoa)+ ') AND'+CR_LF+
      '       (DATASITFUNC = TO_DATE(' +QuotedStr(DateToStr(FDadosHist.DataSit))+ ',''DD/MM/YYYY''))');

    if (_Cds.IsEmpty) then
      Result := ExecSQL(
        'INSERT INTO HSTSITFUNC (IDPESSOA,DATASITFUNC,IDSITFUNC,IDMOTIVOOFIC,'+
        'IDMOTIVOGER,IDMOVCONTRCAGED) VALUES ('+
        FloatToStr(FIdPessoa)+','+
        'TO_DATE(' +QuotedStr(DateToStr(FDadosHist.DataSit))+ ',''DD/MM/YYYY''),'+
        FFU.IFF(FDadosHist.IdSitFunc=0, 'NULL', FloatToStr(FDadosHist.IdSitFunc))+','+
        FFU.IFF(FDadosHist.IdMotivoDesligRAIS=0, 'NULL', FloatToStr(FDadosHist.IdMotivoDesligRAIS))+','+
        FFU.IFF(FDadosHist.IdMotivoDesligGerencial=0, 'NULL', FloatToStr(FDadosHist.IdMotivoDesligGerencial))+','+
        FFU.IFF(FDadosHist.IdMovContrCAGED=0, 'NULL', FloatToStr(FDadosHist.IdMovContrCAGED))+')')
    else
      Result := ExecSQL(
        'UPDATE HSTSITFUNC SET'+CR_LF+
        '  IDSITFUNC       = ' +FFU.IFF(FDadosHist.IdSitFunc=0, 'NULL', FloatToStr(FDadosHist.IdSitFunc)) +','+CR_LF+
        '  IDMOTIVOOFIC    = ' +FFU.IFF(FDadosHist.IdMotivoDesligRAIS=0, 'NULL', FloatToStr(FDadosHist.IdMotivoDesligRAIS)) +','+CR_LF+
        '  IDMOTIVOGER     = ' +FFU.IFF(FDadosHist.IdMotivoDesligGerencial=0, 'NULL', FloatToStr(FDadosHist.IdMotivoDesligGerencial)) +','+CR_LF+
        '  IDMOVCONTRCAGED = ' +FFU.IFF(FDadosHist.IdMovContrCAGED=0, 'NULL', FloatToStr(FDadosHist.IdMovContrCAGED)) +CR_LF+
        'WHERE'+CR_LF+
        '  (IDPESSOA    = ' +FloatToStr(FIdPessoa)+ ') AND'+CR_LF+
        '  (DATASITFUNC = TO_DATE(' +QuotedStr(DateToStr(FDadosHist.DataSit))+ ',''DD/MM/YYYY''))');

    if (Result) then
      Commit
    else
      raise Exception.Create(MessageInfo);
  except
    on E: Exception do
    begin
      Rollback;
      Result := false;
      MessageInfo := CR_LF+
        ' * Histórico da Situação Funcional.' +CR_LF+ 'Erro:' +CR_LF+ E.Message;
    end;
  end;
end;

function TCtrlPessoaFuncionario.GravarHstAltEvolFunc(IdEmpresa: double): boolean;
begin
  try
    StartTransaction;

    _Cds.Data := GetDataPacket(
      'SELECT IDPESSOA'+CR_LF+
      'FROM   EVOLFUNC'+CR_LF+
      'WHERE  (IDPESSOA      = ' +FloatToStr(FIdPessoa)+ ') AND'+CR_LF+
      '       (DATAALTERFUNC = TO_DATE(' +QuotedStr(DateToStr(FDadosHist.DataSit))+ ',''DD/MM/YYYY''))');


//Higor Nayde Ferreira Sol 188194 - Kintana 1779198 INICIO
    if (_Cds.IsEmpty) then
      Result := ExecSQL(
         'INSERT INTO EVOLFUNC (IDPESSOA,DATAALTERFUNC,IDEMPRESA,CODCENTROCUSTO,'+
        'SALARIO,PERC_REAJ,IDMOTIVO,IDESTAB,IDCARGO,TIPOPAGAMENTO,IDFUNCAO,NIVELINDIV1,NIVELINDIV2,VLRFUNCAO,VLRSALARIOFUNCAO) '+
        'VALUES ('+
        FloatToStr(FIdPessoa)+','+
        'TO_DATE(' +QuotedStr(DateToStr(FDadosHist.DataAdmissao))+ ',''DD/MM/YYYY''),'+
        FloatToStr(IdEmpresa)+','+
        FFU.IFF(FDadosHist.CodCentroCusto='', 'NULL', QuotedStr(FDadosHist.CodCentroCusto))+','+
        FFU.Float2String(FDadosHist.SalarioAtual)+','+
        '0,'+
        FFU.IFF(FDadosHist.IdMotivoDesligRAIS=0, 'NULL', FloatToStr(FDadosHist.IdMotivoDesligRAIS))+','+
        FFU.IFF(FDadosHist.IdEstab=0, 'NULL', FloatToStr(FDadosHist.IdEstab))+','+
        FFU.IFF(FDadosHist.IdCargo=0, 'NULL', FloatToStr(FDadosHist.IdCargo))+','+
        FFU.IFF(FDadosHist.TipoPagamento='', 'NULL', QuotedStr(FDadosHist.TipoPagamento))+','+

        FFU.IFF(FDadosHist.IDFUNCAO=0, 'NULL', FloatToStr(FDadosHist.IDFUNCAO))+','+
        FFU.IFF(FDadosHist.NIVELINDIV1=0, 'NULL', FloatToStr(FDadosHist.NIVELINDIV1))+','+
        FFU.IFF(FDadosHist.NIVELINDIV2=0, 'NULL', FloatToStr(FDadosHist.NIVELINDIV2))+','+

        FFU.Float2String(FDadosHist.IdVlrFuncao)+','+
        FFU.Float2String(FDadosHist.IdVLRSALFUNC)+')')


    else
      Result := ExecSQL(
        'UPDATE EVOLFUNC SET'+CR_LF+
        '  IDEMPRESA      = ' +FloatToStr(IdEmpresa) +','+CR_LF+
        '  CODCENTROCUSTO = ' +FFU.IFF(FDadosHist.CodCentroCusto='', 'NULL', QuotedStr(FDadosHist.CodCentroCusto)) +','+CR_LF+
        '  SALARIO        = ' +FFU.Float2String(FDadosHist.SalarioAtual) +','+CR_LF+
        '  PERC_REAJ      = 0,' +CR_LF+
        '  IDMOTIVO       = ' +FFU.IFF(FDadosHist.IdMotivoDesligRAIS=0, 'NULL', FloatToStr(FDadosHist.IdMotivoDesligRAIS)) +','+CR_LF+
        '  IDESTAB        = ' +FFU.IFF(FDadosHist.IdEstab=0, 'NULL', FloatToStr(FDadosHist.IdEstab)) +','+CR_LF+
        '  IDCARGO        = ' +FFU.IFF(FDadosHist.IdCargo=0, 'NULL', FloatToStr(FDadosHist.IdCargo)) +','+CR_LF+
        '  TIPOPAGAMENTO  = ' +FFU.IFF(FDadosHist.TipoPagamento='', 'NULL', QuotedStr(FDadosHist.TipoPagamento))+','+CR_LF+

        '  VLRFUNCAO      = ' +FFU.Float2String(FDadosHist.IdVlrFuncao) +','+CR_LF+
       // '  DATAFUNCAO     = ' +'TO_DATE(' +QuotedStr(DateToStr(FDadosHist.DateFUNCAO))+ ',''DD/MM/YYYY''),'+CR_LF+
        '  VLRSALARIOFUNCAO = ' +FFU.Float2String(FDadosHist.IdVLRSALFUNC) +CR_LF+


        'WHERE'+CR_LF+
        '  (IDPESSOA      = ' +FloatToStr(FIdPessoa)+ ') AND'+CR_LF+
        '  (DATAALTERFUNC = TO_DATE(' +QuotedStr(DateToStr(FDadosHist.DataAdmissao))+ ',''DD/MM/YYYY''))');
    //Higor Nayde Ferreira Sol 188194 - Kintana 1779198 FIM
    if (Result) then
      Commit
    else
      raise Exception.Create(MessageInfo);
  except
    on E: Exception do
    begin
      Rollback;
      Result := false;
      MessageInfo := CR_LF+
        ' * Histórico da Evolução Funcional.' +CR_LF+ 'Erro:' +CR_LF+ E.Message;
    end;
  end;
end;

function TCtrlPessoaFuncionario.GravarHstAltEndereco: boolean;
begin
  try
    StartTransaction;

    _Cds.Data := GetDataPacket(
      'SELECT IDPESSOA, DATAALT'+CR_LF+
      'FROM   HSTENDPESS'+CR_LF+
      'WHERE  (IDPESSOA = ' +FloatToStr(FIdPessoa)+ ') AND'+CR_LF+
      '       (DATAALT  = TO_DATE(' +QuotedStr(DateToStr(Date))+ ',''DD/MM/YYYY''))');

    if (_Cds.IsEmpty) then
      Result := ExecSQL(
        'INSERT INTO HSTENDPESS (IDPESSOA, DATAALT, LOGRADOURO, '+
        'COMPLEMENTO, NUMERO, CEP, BAIRRO, IDCIDADES)'+CR_LF+
        'VALUES ('+
        FloatToStr(FIdPessoa) +', '+
        'TO_DATE('+ QuotedStr(DateToStr(Date)) +',''DD/MM/YYYY''), '+
        QuotedStr(FHstEndPess.Logradouro) +', '+
        QuotedStr(FHstEndPess.Complemento) +', '+
        QuotedStr(FHstEndPess.Numero) +', '+
        QuotedStr(FHstEndPess.CEP) +', '+
        QuotedStr(FHstEndPess.Bairro) +', '+
        IntToStr(FHstEndPess.IdCidades) +')')
    else
      Result := ExecSQL(
        'UPDATE HSTENDPESS SET'+CR_LF+
        '  LOGRADOURO  = ' +QuotedStr(FHstEndPess.Logradouro) +','+CR_LF+
        '  COMPLEMENTO = ' +QuotedStr(FHstEndPess.Complemento) +','+CR_LF+
        '  NUMERO      = ' +QuotedStr(FHstEndPess.Numero) +','+CR_LF+
        '  CEP         = ' +QuotedStr(FHstEndPess.CEP) +','+CR_LF+
        '  BAIRRO      = ' +QuotedStr(FHstEndPess.Bairro) +','+CR_LF+
        '  IDCIDADES   = ' +IntToStr(FHstEndPess.IdCidades) +CR_LF+
        'WHERE'+CR_LF+
        '  (IDPESSOA = ' +FloatToStr(FIdPessoa)+ ') AND'+CR_LF+
        '  (DATAALT  = TO_DATE(' +QuotedStr(DateToStr(Date))+ ',''DD/MM/YYYY''))');

    if (Result) then
      Commit
    else
      raise Exception.Create(MessageInfo);
  except
    on E: Exception do
    begin
      Rollback;
      Result := false;
      MessageInfo := CR_LF+
        ' * Histórico das Alterações no Endereço Residencial.' +CR_LF+ 'Erro:' +CR_LF+ E.Message;
    end;
  end;
end;

function TCtrlPessoaFuncionario.GravarHstDocumentos: boolean;
var
  c: byte;
begin
  Result := true;
  try
    StartTransaction;

    for c:=1 to NUM_DOC_ALT do
    begin
      if ((FHstDoc_Ant[c].Numero <> '') or (FHstDoc_Atu[c].Numero <> '')) and
         ((FHstDoc_Ant[c].Numero <> FHstDoc_Atu[c].Numero) or (FInserindo)) then
      begin
        _Cds.Data := GetDataPacket(
          'SELECT IDPESSOA'+CR_LF+
          'FROM   HSTALTCAD'+CR_LF+
          'WHERE  (IDPESSOA     = ' +FloatToStr(FIdPessoa)+ ') AND'+CR_LF+
          '       (CODALTERACAO = ' +QuotedStr(FHstDoc_Ant[c].Codigo)+ ') AND'+CR_LF+
          '       (DATAALT      = TO_DATE(' +QuotedStr(DateToStr(Date))+ ',''DD/MM/YYYY''))');

        if (_Cds.IsEmpty) then
          Result := ExecSQL(
            'INSERT INTO HSTALTCAD (IDPESSOA, DATAALT, CODALTERACAO, ALTERACAO)'+CR_LF+
            ' VALUES ('+
            FloatToStr(FIdPessoa)+
            ', TO_DATE('+ QuotedStr(DateToStr(Date)) +',''DD/MM/YYYY''), '+
            QuotedStr(FHstDoc_Ant[c].Codigo) +', '+
            QuotedStr(FHstDoc_Atu[c].Numero) +')')
        else
          Result := ExecSQL(
            'UPDATE HSTALTCAD SET'+CR_LF+
            '  ALTERACAO     = '+ QuotedStr(FHstDoc_Atu[c].Numero)+CR_LF+
            'WHERE'+CR_LF+
            '  (IDPESSOA     = ' +FloatToStr(FIdPessoa)+ ') AND'+CR_LF+
            '  (CODALTERACAO = ' +QuotedStr(FHstDoc_Ant[c].Codigo)+ ') AND'+CR_LF+
            '  (DATAALT      = TO_DATE(' +QuotedStr(DateToStr(Date))+ ',''DD/MM/YYYY''))');

        if not(Result) then
          break;
      end;
    end;

    if (Result) then
      Commit
    else
      raise Exception.Create(MessageInfo);
  except
    on E: Exception do
    begin
      Rollback;
      Result := false;
      MessageInfo := CR_LF+
        ' * Histórico das Alterações nos Documentos.' +CR_LF+ 'Erro:' +CR_LF+ E.Message;
    end;
  end;
end;

function TCtrlPessoaFuncionario.GravarHstAltCadastral: boolean;
var
  c: byte;
begin
  Result := true;
  try
    StartTransaction;

    for c:=1 to NUM_CAD_ALT do
    begin
      if ((FHstAltCad_Ant[c].Valor <> '') or (FHstAltCad_Atu[c].Valor <> '')) and
         ((FHstAltCad_Ant[c].Valor <> FHstAltCad_Atu[c].Valor) or (FInserindo)) then
      begin
        _Cds.Data := GetDataPacket(
          'SELECT IDPESSOA'+CR_LF+
          'FROM   HSTALTCAD'+CR_LF+
          'WHERE  (IDPESSOA     = ' +FloatToStr(FIdPessoa)+ ') AND'+CR_LF+
          '       (CODALTERACAO = ' +QuotedStr(FHstAltCad_Ant[c].Codigo)+ ') AND'+CR_LF+
          '       (DATAALT      = TO_DATE(' +QuotedStr(DateToStr(Date))+ ',''DD/MM/YYYY''))');

        if (_Cds.IsEmpty) then
          Result := ExecSQL(
            'INSERT INTO HSTALTCAD (IDPESSOA, DATAALT, CODALTERACAO, ALTERACAO)'+CR_LF+
            ' VALUES ('+
            FloatToStr(FIdPessoa)+
            ', TO_DATE('+ QuotedStr(DateToStr(Date)) +',''DD/MM/YYYY''), '+
            QuotedStr(FHstAltCad_Ant[c].Codigo) +', '+
            QuotedStr(FHstAltCad_Atu[c].Valor) +')')
        else
          Result := ExecSQL(
            'UPDATE HSTALTCAD SET'+CR_LF+
            '  ALTERACAO     = '+ QuotedStr(FHstAltCad_Atu[c].Valor)+CR_LF+
            'WHERE'+CR_LF+
            '  (IDPESSOA     = ' +FloatToStr(FIdPessoa)+ ') AND'+CR_LF+
            '  (CODALTERACAO = ' +QuotedStr(FHstAltCad_Ant[c].Codigo)+ ') AND'+CR_LF+
            '  (DATAALT      = TO_DATE(' +QuotedStr(DateToStr(Date))+ ',''DD/MM/YYYY''))');

        if not(Result) then
          break;
      end;
    end;

    if (Result) then
      Commit
    else
      raise Exception.Create(MessageInfo);
  except
    on E: Exception do
    begin
      Rollback;
      Result := false;
      MessageInfo := CR_LF+
        ' * Histórico de Alterações Cadastrais.' +CR_LF+ 'Erro:' +CR_LF+ E.Message;
    end;
  end;
end;

//Bruno Bastos - Sol: 129826 - Kintana: 715518 - Início
function TCtrlPessoaFuncionario.ListFuncAtivo: OleVariant;
begin
  Result := GetDataPacket(' SELECT '+
                          '  PES.IDPESSOA, '+
                          '  PES.NOME '+

                          ' FROM '+
                          '   PESSOA      PES, '+
                          '   FUNCIONARIO FUN, '+
                          '   SITFUNC     STF  '+

                          ' WHERE FUN.IDSITFUNC = STF.IDSITFUNC '+
                          '   AND STF.TIPOSIT   = ''A'' '+
                          '   AND FUN.IDPESSOA  = PES.IDPESSOA '+

                          ' ORDER BY '+
                          '   PES.NOME ');
end;
//Bruno Bastos - Sol: 129826 - Kintana: 715518 - Fim

function TCtrlPessoaFuncionario.GravarNovoChefeFunc(
  pCDSFunc: TCMClientDataSet; pIdChefe: integer): Boolean;
var
  sSQL : string;
begin
   Result := True;
   StartTransaction;             

   pCDSFunc.First;
   while not (pCdsFunc.EOF) do
   begin
     sSQL :=
       'UPDATE FUNCIONARIO SET'+CR_LF+
       '  IDCHEFE   = ' +FloatToStr(pIdChefe) +CR_LF+
       'WHERE'+CR_LF+
       '  IDPESSOA  = ' + pCdsFunc.FieldByName('IDPESSOA').asstring;
     pCDSFunc.Next;

     if not (ExecSQL(sSQL)) then
     begin
       Result := False;
       raise Exception.Create('Erro ao tentar atualizar subordinação.'+
              CR_LF + MessageInfo);
       Rollback;
     end;
   end;

   if Result then
     Commit;
end;

function TCtrlPessoaFuncionario.ListNotInSubordinados(
  IdPessoa: double): OleVariant;
var
  sParam, sSql : string;
begin

  If IdPessoa = -1 then
    sParam := '  (FU.IDCHEFE = ' +floatToStr(IdPessoa)+ ') AND'+CR_LF
  else
    sParam := '  (FU.IDCHEFE <> ' +floatToStr(IdPessoa)+ ') AND'+CR_LF;

  sSql :=
    'SELECT'+CR_LF+
    '  PF.IDPESSOA, PF.NOME, FU.MATRICULA, FU.IDCHEFE, US.NOMEUSUARIO'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA PF, FUNCIONARIO FU, USUARIOSISTEMA US'+CR_LF+
    'WHERE'+CR_LF+
     sParam +
    '  (FU.IDPESSOA  = PF.IDPESSOA) AND'+CR_LF+
    '  (US.IDUSUARIO(+)   = FU.IDPESSOA)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  PF.NOME';

  Result := GetDataPacket( sSql );
end;

function TCtrlPessoaFuncionario.ListSubordinados(
  IdPessoa: double): OleVariant;
var
  sSql : string;
begin
Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  PF.IDPESSOA, PF.NOME, FU.MATRICULA, FU.IDCHEFE, US.NOMEUSUARIO'+CR_LF+
    //'  PF.IDPESSOA, PF.NOME, FU.MATRICULA, FU.IDCHEFE'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA PF, FUNCIONARIO FU, USUARIOSISTEMA US'+CR_LF+
    'WHERE'+CR_LF+
    '  FU.IDCHEFE      = ' +floatToStr(IdPessoa)+ ' AND'+CR_LF+
    '  FU.IDPESSOA     = PF.IDPESSOA AND'+CR_LF+
    '  US.IDUSUARIO(+) = FU.IDPESSOA'+CR_LF+
    'ORDER BY'+CR_LF+
    '  PF.NOME');
end;

function TCtrlPessoaFuncionario.GravaAltEvolFunc(
  IdEmpresa: integer): Boolean;
var
  _CdsAux: TCMClientDataSet;
begin
 _CdsAux := TCmClientDataSet.Create(nil);
 try
    StartTransaction;

    _Cds.Data := GetDataPacket(
      'SELECT IDPESSOA'+CR_LF+
      'FROM   EVOLFUNC'+CR_LF+
      'WHERE  (IDPESSOA      = ' +FloatToStr(FIdPessoa)+ ') AND'+CR_LF+
      '       (DATAALTERFUNC = TO_DATE(' +QuotedStr(DateToStr(FDadosHist.DataSit))+ ',''DD/MM/YYYY''))');


    //Higor Nayde Ferreira Sol 188194 - Kintana 1779198 INICIO
    if (_Cds.IsEmpty) then begin
      Result := ExecSQL(
        'INSERT INTO EVOLFUNC (IDPESSOA,DATAALTERFUNC,IDEMPRESA,CODCENTROCUSTO,'+
        'SALARIO,PERC_REAJ,IDMOTIVO,IDESTAB,IDCARGO,TIPOPAGAMENTO,IDFUNCAO,NIVELINDIV1,NIVELINDIV2,VLRFUNCAO,VLRSALARIOFUNCAO) '+
        'VALUES ('+
        FloatToStr(FIdPessoa)+','+
        'TO_DATE(' +QuotedStr(DateToStr(FDadosHist.DataAdmissao))+ ',''DD/MM/YYYY''),'+
        IntToStr(IdEmpresa)+','+
        FFU.IFF(FDadosHist.CodCentroCusto='', 'NULL', QuotedStr(FDadosHist.CodCentroCusto))+','+
        FFU.Float2String(FDadosHist.SalarioAtual)+','+
        '0,'+
        FFU.IFF(FDadosHist.IdMotivoDesligRAIS=0, 'NULL', FloatToStr(FDadosHist.IdMotivoDesligRAIS))+','+
        FFU.IFF(FDadosHist.IdEstab=0, 'NULL', FloatToStr(FDadosHist.IdEstab))+','+
        FFU.IFF(FDadosHist.IdCargo=0, 'NULL', FloatToStr(FDadosHist.IdCargo))+','+
        FFU.IFF(FDadosHist.TipoPagamento='', 'NULL', QuotedStr(FDadosHist.TipoPagamento))+','+

        FFU.IFF(FDadosHist.IDFUNCAO=0, 'NULL', FloatToStr(FDadosHist.IDFUNCAO))+','+
        FFU.IFF(FDadosHist.NIVELINDIV1=0, 'NULL', FloatToStr(FDadosHist.NIVELINDIV1))+','+
        FFU.IFF(FDadosHist.NIVELINDIV2=0, 'NULL', FloatToStr(FDadosHist.NIVELINDIV2))+','+

        FFU.Float2String(FDadosHist.IdVlrFuncao)+','+
        FFU.Float2String(FDadosHist.IdVLRSALFUNC)+')');
       end;
    //Higor Nayde Ferreira Sol 188194 - Kintana 1779198 FIM
        if (Result) then
          Commit
        else
          raise Exception.Create(MessageInfo);


 except
    on E: Exception do
    begin
      Rollback;
      Result := false;
      MessageInfo := CR_LF+
        ' * Histórico da Evolução Funcional.' +CR_LF+ 'Erro:' +CR_LF+ E.Message;
    end;
 end;

end;

//William Santana  SOL - 201365 KIN- 1965590

function TCtrlPessoaFuncionario.ListTipoBen(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    ' B.IDPESSOA, B.IDBENEFSALFUNC'+CR_LF+
    ' FROM BENEFSALFUNC B WHERE '+CR_LF+
    ' (B.IDPESSOA         = ' + FloatToStr(IdPessoa) +')');
end;

function TCtrlPessoaFuncionario.GravarTipoBeneficio(idpessoa: Double; idbeneficio: integer):boolean;
begin
  try
    StartTransaction;

    Result := ExecSQL(
    'INSERT INTO '+CR_LF+
    ' BENEFSALFUNC '+CR_LF+
    ' (IDPESSOA, IDBENEFSALFUNC)'+CR_LF+
    ' SELECT '+floatToStr(IdPessoa)+','+IntToStr(idbeneficio)+' FROM DUAL '+CR_LF+
    ' WHERE NOT EXISTS '+CR_LF+
    ' (SELECT B.IDPESSOA, B.IDBENEFSALFUNC '+CR_LF+
    ' FROM BENEFSALFUNC B WHERE '+CR_LF+
    ' (B.IDPESSOA = '+floatToStr(IdPessoa)+' ) AND '+CR_LF+
    ' (B.IDBENEFSALFUNC = '+IntToStr(idbeneficio)+'))');
    
    if (Result) then
      Commit
    else
      raise Exception.Create(MessageInfo);
  except
    on E: Exception do
    begin
      Rollback;
      Result := false;
      MessageInfo := 'Erro:' +CR_LF+ E.Message;
    end;
  end;
end; 

function TCtrlPessoaFuncionario.RemoverTipoBeneficio(idpessoa: double; idbeneficio: integer):boolean;
begin
  try
    StartTransaction;

    Result := ExecSQL(
    ' DELETE'+CR_LF+
    ' FROM BENEFSALFUNC B WHERE '+CR_LF+
    ' (B.IDPESSOA = ' + floatToStr(IdPessoa) +') AND'+CR_LF+
    ' (B.IDBENEFSALFUNC = '+ IntToStr(idbeneficio)+')');
    
    if (Result) then
      Commit
    else
      raise Exception.Create(MessageInfo);
  except
    on E: Exception do
    begin
      Rollback;
      Result := false;
      MessageInfo := 'Erro:' +CR_LF+ E.Message;
    end;
  end;  
end;    
//END - William Santana

// Felipe A. Santos SOL 229871.16137 - início
function TCtrlPessoaFuncionario.ListEstagiario(IdPessoa : Double): OleVariant;
var
   sSQL : string;
begin
   sSQL := 'SELECT E.IDESTAGIARIO, '+
           '       E.NATUREZAESTAGIO, ' +
           '       E.NIVEL, ' +
           '       E.AREAATUACAO, '+
           '       E.NUMAPOLSEGURO, ' +
           '       E.IDINSTITUICAOENSINO, ' +
           '       E.IDAGENTEINT, ' +
           '       E.IDSUPERVISOR, ' +
           '       PSV.NOME AS NOMESV, ' +
           '       PSV.NUMDOCUMENTO  AS CNPJSV, ' +
           '       PIE.NOME AS NOMEIE, ' +
           '       PAI.NOME AS NOMEAI ' +
           '  FROM ESTAGIARIO E, INSTITUICAOENSINO IE, AGENTEINT AI, ' +
           '       PESSOA PSV, PESSOA PIE, PESSOA PAI, FUNCIONARIO F ' +
           ' WHERE F.IDPESSOA = ' + FloatToStr(IdPessoa) +
           '   AND F.IDESTAGIARIO = E.IDESTAGIARIO ' +
           //Cássio Rovaroto - SIG nº 62180 - Início
           //'   AND E.IDINSTITUICAOENSINO = IE.IDINSTITUICAOENSINO ' +
           //'   AND E.IDAGENTEINT = AI.IDAGENTEINT ' +
           //'   AND E.IDSUPERVISOR = PSV.IDPESSOA  ' +
           //'   AND AI.IDPESSOA = PAI.IDPESSOA ' +
           //'   AND IE.IDPESSOA = PIE.IDPESSOA';
           '   AND E.IDINSTITUICAOENSINO = IE.IDINSTITUICAOENSINO(+) ' +
           '   AND E.IDAGENTEINT = AI.IDAGENTEINT(+) ' +
           '   AND E.IDSUPERVISOR = PSV.IDPESSOA(+)  ' +
           '   AND AI.IDPESSOA = PAI.IDPESSOA(+) ' +
           '   AND IE.IDPESSOA = PIE.IDPESSOA(+) ';
           //Cássio Rovaroto - SIG nº 62180 - Fim
   Result := GetDataPacket(sSQL);
end;
// Felipe A. Santos SOL 229871.16137 - fim

// Felipe A. Santos SOL 229871.16137 - início
function TCtrlPessoaFuncionario.ListDadosCessao(
  IdPessoa: Double): OleVariant;
var
   sSQL : string;
begin
   sSQL := 'SELECT D.* ' +
           '  FROM ' +
           ' DADOSCESSAO D, FUNCIONARIO F ' +
           ' WHERE F.IDPESSOA = ' + FloatToStr(IdPessoa) +
           '   AND F.IDDADOSCESSAO = D.IDDADOSCESSAO';
   Result := GetDataPacket(sSQL);
end;
// Felipe A. Santos SOL 229871.16137 - fim

// Felipe A. Santos SOL 229871.16137 - início
function TCtrlPessoaFuncionario.ListCategTrabaEsocial(bIsGroup : boolean; sGrupo : string): OleVariant;
var
   sSQL : string;
begin
   if bIsGroup then
   begin
     sSQL := 'SELECT DISTINCT GRUPO FROM CATEGTRABAESOCIAL ORDER BY GRUPO';
   end
   else 
   begin
     sSQL := 'SELECT IDCATEGTRABAESOCIAL, ' +
             '       CODIGOESOCIAL, ' +
             '       GRUPO, ' +
             '       SUBSTR(DESCRICAO, 1, 255) AS DESCRICAO ' +
             ' FROM CATEGTRABAESOCIAL ' +
             'WHERE GRUPO = ' + QuotedStr(sGrupo) +
             ' ORDER BY DESCRICAO';
   end;

   Result := GetDataPacket(sSQL);
end;
// Felipe A. Santos SOL 229871.16137 - fim

// Felipe A. Santos SOL 229871.16137 - início
function TCtrlPessoaFuncionario.ListGrauExpAgentEsocial: OleVariant;
var
   sSQL : string;
begin
   sSQL := 'SELECT IDGRAUEXPAGENTESOCIAL, ' +
           '       CODIGOESOCIAL, ' +
           '       SUBSTR(DESCRICAO, 1, 255) AS DESCRICAO ' +
           '  FROM GRAUEXPAGENTESOCIAL ' +
           ' ORDER BY DESCRICAO';
   Result := GetDataPacket(sSQL);
end;
// Felipe A. Santos SOL 229871.16137 - fim

// Felipe A. Santos SOL 229871.16137 - início
function TCtrlPessoaFuncionario.GetGrupoCategTrabaEsocial(
  IdPessoa: Double): string;
var
   sSQL : string;
begin
   sSQL := 'SELECT C.GRUPO ' +
           '  FROM CATEGTRABAESOCIAL C, FUNCIONARIO F ' +
           ' WHERE F.IDPESSOA = ' + FloatToStr(IdPessoa) +
           '   AND F.IDCATEGTRABAESOCIAL = C.IDCATEGTRABAESOCIAL';

   _Cds.Data := GetDataPacket(sSQL);

   Result := _Cds.FieldByName('GRUPO').AsString;

   _Cds.EmptyDataSet;
end;
// Felipe A. Santos SOL 229871.16137 - fim

//Início - William Santana - SOL 211502.16259 PPM 442499
function TCtrlPessoaFuncionario.ListImagem(IdPessoa: double): OleVariant;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCmClientDataSet.Create(nil);
  try
     _CdsAux.Data := GetDataPacket('SELECT IDIMGRECISAO FROM FUNCIONARIO '+CR_LF+
                                  ' WHERE IDPESSOA = ' + floatToStr(IdPessoa));

    result := SelImagemOutro(_CdsAux.FieldByName('IDIMGRECISAO').AsFloat);
  finally
   FreeAndNil(_CdsAux);
  end
end;
//Término - William Santana - SOL 211502.16259 PPM 442499

//Início - William Santana - SOL 211661/15807 - KIN 2060908
function TCtrlPessoaFuncionario.ListEstCivil: OleVariant;
begin
  Result := GetDataPacket(
        'SELECT'+CR_LF+
        ' T.ESTCIVIL, T.DESCRICAO'+CR_LF+
        ' FROM ESTADOCIVIL T WHERE FLGATIVO = 1 ');
end;

function TCtrlPessoaFuncionario.MostraEstCivil(EstCivil: string): String;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCmClientDataSet.Create(nil);

  _CdsAux.data := GetDataPacket(
        'SELECT'+CR_LF+
        ' T.ESTCIVIL, T.DESCRICAO'+CR_LF+
        ' FROM ESTADOCIVIL T WHERE ESTCIVIL = '+QuotedStr(EstCivil));

  result := _CdsAux.FieldByName('DESCRICAO').AsString;

  FreeAndNil(_CdsAux);        
end;   
//Término - William Santana - SOL 211661/15807 - KIN 2060908

// Felipe A. Santos SOL 207737 KTN 2018095 - início
function TCtrlPessoaFuncionario.ListContratoTemp(
  iIdPessoa: Double = -1): OleVariant;
var
   sSql : string;
begin
    sSql := 'SELECT * FROM CONTRATOTEMP WHERE IDPESSOA = ' + FloatToStr(iIdPessoa);

    Result := GetDataPacket(sSql);

end;

function TCtrlPessoaFuncionario.ListContratoTempObs(
  iIdContratoTemp: Double = -1): OleVariant;
var
   sSQL : string;
begin
  sSQL := 'SELECT IDCONTRATOTEMPOBS, ' +
          '       DATAOBSERV, ' +
          '       OBSERVACAO, ' + 
          '       substr(OBSERVACAO, 1, 255)  AS OBSERVACAO2, ' +
          '       IDCONTRATOTEMP ' +
          '  FROM CONTRATOTEMPOBS WHERE IDCONTRATOTEMP = ' + FloatToStr(iIdContratoTemp) +
          ' ORDER BY DATAOBSERV';

  Result := GetDataPacket(sSQL);

end;

function TCtrlPessoaFuncionario.ListContratoTempSubst(
  iIdContratoTemp: Double = -1): OleVariant;
var
   sSQL : string;
begin
  sSQL := 'SELECT C.IDCONTRATOTEMPSUBST, ' +
          '       C.MATRICULA, ' +
          '       P.NOME, ' +
          '       CC.NOME AS NOMECENTROCUSTO, ' +
          '       C.IDPESSOA, ' +
          '       DECODE(C.DESCRICAO, ''A'' , ''Auxílio doença'', ' +
          '                           ''D'' , ''Auxílio doença acidentário'', ' +
          '                           ''L'' , ''Licença maternidade'' ) AS MOTIVO, ' +
          '       C.CODCENTROCUSTO, ' +
          '       C.DESCRICAO, ' +
          '       C.DATAINICIO, ' +
          '       C.DATAFIM, ' +
          '       DIR.NOME AS DIRETORIA, ' +
          '       C.IDCONTRATOTEMP, ' +
          '       DIR.CODCENTROCUSTO AS CODDIRETORIA, ' +
          '       C.IDMOTIVO, ' +
          '       C.IDEMPRESA ' +
          ' FROM CONTRATOTEMPSUBST C, PESSOA P, CENTCUST CC, CENTCUST DIR ' +
          'WHERE C.IDCONTRATOTEMP = ' + FloatToStr(iIdContratoTemp) +
          '  AND C.IDPESSOA = P.IDPESSOA ' +
          '  AND C.CODCENTROCUSTO = CC.CODCENTROCUSTO ' +
          '  AND C.CODDIRETORIA = DIR.CODCENTROCUSTO(+)  ' +
          ' ORDER BY C.DATAFIM ';

  Result := GetDataPacket(sSQL);

end;

// Felipe A. Santos SOL 207737 KTN 2018095 - fim

function TCtrlPessoaFuncionario.SelIndicativoSusp: OleVariant;
begin
  Result:= GetDataPacket('SELECT IDINDICATIVOSUSP, TIPO, DESCRICAO, INDSUSP FROM INDICATIVOSUSP');
end;


function TCtrlPessoaFuncionario.VerificaExistenciaProcesso(
  pIdProcesso: integer): Boolean;
var
  cdsAux: TCMClientDataSet;
begin
  cdsAux:= TCMClientDataSet.Create(nil);
  try
		cdsAux.Data:= GetDataPacket('SELECT IDPROCESSO FROM PROCESSOS ' +
                              'WHERE IDPROCESSO = ' + IntToStr(pIdProcesso));
  	Result:= not cdsAux.IsEmpty;
  finally
  	FreeAndNil(cdsAux);
  end;
  
end;

function TCtrlPessoaFuncionario.VerificaExistenciaProcessoXIndicativo(
  pIdProcessoxIndicativoSusp: integer): boolean;
var
  cdsAux: TCMClientDataSet;
begin
  cdsAux:= TCMClientDataSet.Create(nil);
  try
		cdsAux.Data:= GetDataPacket('SELECT IDPROCESSO FROM PROCESSOSXINDICATIVOSUSP ' +
                              'WHERE IDPROCESSOSXINDICATIVOSUSP = ' + IntToStr(pIdProcessoxIndicativoSusp));
  	Result:= not cdsAux.IsEmpty;
  finally
  	FreeAndNil(cdsAux);
  end;

end;

function TCtrlPessoaFuncionario.VerificaProcessoFuncionario(
  pNumProcesso: string; pIdFuncionario: integer): Boolean;
var
	cdsProcessosFuncionario : TCMClientDataSet;
begin
   cdsProcessosFuncionario := TCMClientDataSet.Create(nil);
   try
    cdsProcessosFuncionario.Data := GetDataPacket('SELECT COUNT(IDPROCESSO) AS COUNT_ID FROM PROCESSOS WHERE NUMERO = ' + QuotedStr(pNumProcesso) +
    						  ' AND IDFUNCIONARIO = ' + IntToStr(pIdFuncionario));
    Result := cdsProcessosFuncionario.FieldByName('COUNT_ID').asInteger > 0;
   finally
    FreeAndNil(cdsProcessosFuncionario);
   end;

end;

function TCtrlPessoaFuncionario.SelProcessosXIndicativoSusp(
  rIdFuncionario: Integer): OleVariant;
begin
  Result:= GetDataPacket('SELECT PI.IDPROCESSOSXINDICATIVOSUSP, ' +
    										 '       PI.IDPROCESSO,                 ' +
    										 '		   PI.IDINDICATIVOSUSP, 	   			' +
                         '       IV.DESCRICAO AS INDICATIVO,    ' +
       					   			 '		   PI.DATADECISAO, 			   				' +
       					   			 '		   PI.INDICATDEPOSITO, 		   			' +
                         '	     DECODE(PI.INDICATDEPOSITO, 0, ''Não'', ''Sim'') AS DEPOSITO ' +
  						   				 '  FROM PROCESSOSXINDICATIVOSUSP PI 		'+
                         '  JOIN INDICATIVOSUSP IV ON IV.IDINDICATIVOSUSP = PI.IDINDICATIVOSUSP ' +
                         '  JOIN PROCESSOS PS ON PS.IDPROCESSO = PI.IDPROCESSO AND PS.IDFUNCIONARIO = ' + IntToStr(rIdFuncionario));
end;

function TCtrlPessoaFuncionario.GetProxIdProcesso: Integer;
var
  _cds: TCMClientDataSet;
begin
  _cds := TCMClientDataSet.Create(nil);
  try
		//Cássio Rovaroto - SIG 62232 - Início
		//_cds.Data:= GetDataPacket('SELECT MAX(IDPROCESSO)+1 AS IDPROCESSO FROM PROCESSOS');
    //_cds.Data:= GetDataPacket('SELECT NVL(MAX(IDPROCESSO),0)+1 AS IDPROCESSO FROM PROCESSOS'); //Everson Luiz SIG70569
    _cds.Data:= GetDataPacket('SELECT CM.SEQPROCESSOS.NEXTVAL IDPROCESSO FROM DUAL');            //Everson Luiz SIG70569
    //Cássio Rovaroto - SIG 62232 - Fim
  	Result:= _cds.FieldByName('IDPROCESSO').asInteger;
  finally
  	FreeAndNil(_cds);
  end;
end;

function TCtrlPessoaFuncionario.GetProxIdProcessosXIndicativoSusp: integer;
var
  _Cds: TCMClientDataSet;
begin
  _Cds := TCMClientDataSet.Create(nil);
  try
  	//Cássio Rovaroto - SIG 62232 - Início
		//_Cds.Data := GetDataPacket('SELECT MAX(IDPROCESSOSXINDICATIVOSUSP)+1 AS IDPROCESSOSXINDICATIVOSUSP FROM PROCESSOSXINDICATIVOSUSP');
    //_Cds.Data := GetDataPacket('SELECT NVL(MAX(IDPROCESSOSXINDICATIVOSUSP),0)+1 AS IDPROCESSOSXINDICATIVOSUSP FROM PROCESSOSXINDICATIVOSUSP'); //Everson Luiz SIG70569
    _Cds.Data := GetDataPacket('SELECT CM.SEQPROCESSOSXINDICATIVOSUSP.NEXTVAL IDPROCESSOSXINDICATIVOSUSP FROM DUAL');                            //Everson Luiz SIG70569
    //Cássio Rovaroto - SIG 62232 - Fim
  	Result := _Cds.FieldByName('IDPROCESSOSXINDICATIVOSUSP').asInteger;
  finally
  	FreeAndNil(_Cds);
  end;
end;
end.
