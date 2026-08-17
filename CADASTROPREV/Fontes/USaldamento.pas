// **************************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES *********************************
// **************************************************************************************
//***************************************************************************************
//--------------------------------------------------------------------------------
//Pendência   : SOL 141310/2261 Kintana 905777
//Responsável : Ádler Souza
//Data        : 19/08/2010
//Descrição   : Correção para quando o campo PERCENTUAL for igual a 0, apresenta
//              a mensagem: 'percentual de suspenção igual a zero'.
//--------------------------------------------------------------------------------
//Pendência   : SOL 141175 KINTANA 889656
//Responsável : BRUNO AZEVEDO
//Data        : 04/08/2010
//Descrição   : Desfeito o sol 140528.
//--------------------------------------------------------------------------------
//Pendência   : SOL 141089 Kintana 888196
//Responsável : Gustavo Terra
//Data        : 03/08/2010
//Descrição   : Ajuste na regra de calculo do percentual de BUA, pois quando o
//              percentual é diferente de zero ou 10, retorna-se valores diferentes
//              dos corretos. 
//--------------------------------------------------------------------------------
//Pendência   : SOL 140528 KINTANA 880374
//Responsável : BRUNO AZEVEDO
//Data        : 30/07/2010
//Descrição   : Correção no cálculo das contribuições.
//--------------------------------------------------------------------------------
//Pendência   : SOL 140527 KINTANA 880285
//Responsável : BRUNO AZEVEDO
//Data        : 27/07/2010
//Descrição   : Correção na gravação do campo ValorTotal e ValorAtual na BENEFBFCIARIO.
//--------------------------------------------------------------------------------
//Pendência   : SOL 140390 KINTANA 878061
//Responsável : BRUNO AZEVEDO
//Data        : 23/07/2010
//Descrição   : Inserir na BENEFBFCIARIO apenas o primeiro benefício da query, ordenando
//              pelos ativos primeiro.
//--------------------------------------------------------------------------------
//Pendência   : SOL 139436 KINTANA 856363
//Responsável : BRUNO AZEVEDO
//Data        : 08/07/2010
//Descrição   : Inserir na BENEFBFCIARIO apenas benefícios ativos.
//--------------------------------------------------------------------------------
//Pendência   : SOL 136276 KINTANA 813879
//Responsável : BRUNO AZEVEDO
//Data        : 21/05/2010
//Descrição   : Verificamos o FLGDEVOLUCAO para devolver ou receber a contribuicao.
//--------------------------------------------------------------------------------
//Pendência   : SOL 133751 KINTANA 782370
//Responsável : BRUNO AZEVEDO
//Data        : 14/04/2010
//Descrição   : Verificamos o FLGDEVOLUCAO para devolver ou receber a contribuicao.
//--------------------------------------------------------------------------------
//Pendência   : SOL 131372 KINTANA 747479
//Responsável : BRUNO AZEVEDO
//Data        : 03/03/2010
//Descrição   : Implementado rotina para adicionar incentivos no valor com base
//              na tabela VALTABGENER e subtabela INDICE115120.
//--------------------------------------------------------------------------------
//Rotina: DeflacionaBS
//Nº SOL: 129557
//Nº KINTANA: 711994
//Data da Alteração: 04/02/2010
//Responsável: Ádler Souza \ Gustavo Terra
//Descrição: Implementação para que Indice de reajuste (INPC/IBGE) seja
//           considerado do global.
//**************************************************************************************
//Rotina: AcertaBeneficioSaldado
//Nº SOL: 122017
//Nº KINTANA: 712220
//Data da Alteração: 04/02/2010
//Responsável: Ádler Souza \ Gustavo Terra
//Descrição: Correção na regra de desconto do BUA.
//**************************************************************************************
// Autor(a)    : Daniel Begnami
// Pendencia   : SOL 123800 - KINTANA - 622476
// Alteração   : AJUSTE NA ROTINA DE SALDAMENTO DE PENSIONISTA,
//               Solicitamos ajuste na rotina de saldamento de forma que ela não considere a reserva 114 mais apenas a 113.
//------------------------------------------------------------------------------
// Autor(a)    : Daniel Begnami
// Pendencia   :  SOL 123735 - KINTANA - 620978
// Alteração   :  AJUSTE NA ROTINA DE SALDAMENTO DE PENSIONISTA,
//                POIS NAO ESTÁ GERANDO PAGAMENTO DE BUA E CONTRIBUIÇÃO QUANDO APRESENTA MAIS DE UMA PESSOA
//                NO GRUPO FAMILIAR. EX: 9736205 - MARIA DE FATIMA CARDOSO RIBAS DE OLIVEIRA E GUSTAVO CARDOSO DE OLIVEIRA
//------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Pendencia   :  SOL 123448 - KINTANA - 617202
// Alteração   :  Alteração na Qry que listava o grupo familiar,pois a qry estava
// retornando 2 registros para a matricula 9736582 e ao processar os beneficios
// apresentava o erro "NÃO ENCONTROU DE-PARA PARA O BENEFICIO -> 497"
//------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Pendencia   : SOL 123389 - KINTANA - 616956
// Alteração   : O sistema estava calculando o valor do benefício saldado de
//               pensionista incorreto
//------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 19/05/2009
// Pendencia   : SOL 117336 Kintana 552687
// Alteração   : Na qry da função "ProcessarReservas" o FROM estava junto com um
//               campo da seleção de dados, gerando um erro no oracle 10G.
//------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 03/03/2009
// Pendencia   : SOL 110446 Kintana 504655
// Alteração   : Mudamos a condição (and fSomenteBUA) para (or fSomenteBUA) pois
// o sistema não estava adicionando o Idpessoa na SQL, isso listava todos os beneficiarios
// par ao saldamento,gerando um problema de DE-PARA.
//------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni \ Gustavo Terra
// Data        : 27/02/2009
// Pendencia   : SOL 110135 Kintana 502683
// Alteração   : Alteração de índice de reajuste para o mes de janeiro/2009, conforme
//               a solicitação.
//------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni \ Gustavo Terra
// Data        : 21/01/2009
// Pendencia   : SOL 106242 - KINTANA 476808
// Alteração   : No campo Evolução de Benefício Pago, ao efetivar o Saldamento para
//               Assistidos que Migraram para REB o Sistema não estava evoluindo corretamente
//------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni \ Gustavo Terra
// Data        : 21/01/2009
// Pendencia   : SOL 106399 - KINTANA 476860
// Alteração   : No saldamento de Aposentados o sistema não estava reajustando de 
//               acordo com o indice INPC.
//------------------------------------------------------------------------------
// Autor(a)    : Bruno Bastos
// Data        : 07/01/2009
// Pendencia   : Sol: 105438 Kintana: 471819
// Alteração   : Ajuste na rotina do saldamento para o ano mês 2009/01.
//------------------------------------------------------------------------------
// Autor(a)    : Henrique Massão
// Data        : 28/11/2008
// Pendencia   : Sol: 102601 Kintana: 456378
// Alteração   : NA TRANSIÇÃO DE 2006/09 PARA 2006/08 o sistema estava
//               deflacionando errado.
//------------------------------------------------------------------------------
// Autor(a)    : Bruno Bastos
// Data        : 27/11/2008
// Pendencia   : Sol: 102536 Kintana: 456310
// Alteração   : Alteração do valor do índice para determinado benefício. 
//------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 20/11/2008
// Pendencia   : Sol: 101856 Kintana 451924
// Alteração   : Para os planos 66 o indice foi definido como 0.02 no calculo
//               do valor da contribuição
//------------------------------------------------------------------------------
// Autor(a)    : Daniel Begnami
// Data        : 03/11/2008
// Pendencia   : Sol: 100082 KT: 442398
// Alteração   : Descrição: Esta gravando corretamente o ULTMESPREPARO na tabela BENEFBFCIARIO
//------------------------------------------------------------------------------
// Autor(a)    : Daniel Begnami
// Data        : 03/11/2008
// Pendencia   : Sol: 99975 KT: 441188
// Alteração   : Descrição: O Saldamento não esta gerando o abono.
//------------------------------------------------------------------------------
// Autor(a)    : Daniel Begnami
// Data        : 30/09/2008
// Pendencia   : Sol: 96526, 97976 e 93782
// Alteração   : Correção na rotina de aplicação de reajustes do beneficio saldado REB.
//------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 23/09/2008
// Pendencia   : SOL 95118 / KINTANA 419379
// Alteração   : Coloquei uma condição para quando o Plano for 66, filtrar apenas
//               IDCONTRIBUICAO = 500 na função 'RetornaValorContribuicao'.
//------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 06/08/2008
// Pendencia   : SOL 89728 / Kintana 379380
// Alteração   : O sistema estava saldando apenas o Responsável, deixando os
//               beneficiários no plano antigo
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 07/05/2008
// Pendencia   : 27874
// Alteração   : Atualizar reajuste de 5,35 para apartir de 2008/01
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 05/03/2008
// Pendencia   : 27523
// Alteração   : Ajuste para não atualizar contribuição incluida no saldamento
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 21/02/2008
// Pendencia   : 27372
// Alteração   : Acerto na coluna FLGTIPORESGISTRO da antecipação do Abono
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 09/02/2008
// Pendencia   : 27373
// Alteração   : Não incluir diferença de adiantamento de abono independente de plano
// Pendencia   : 27376
// Alteração   : Ajuste no SITRECEBIMENTO da contribuição adiantamento de abono
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 07/02/2008
// Pendencia   : 27208
// Alteração   : Ajustes na migração do adiantamento de abono
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 19/01/2008
// Pendencia   : 27209
// Alteração   : Ajustes no calculo da antecipação de abono
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 27/11/2007
// Pendencia   : 26804
// Alteração   : Acerto na migração do adiantamento de abono e do abono do ano atual 
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 15/08/2007
// Pendencia   : 26042
// Alteração   : Inclusao do incentivo de 3,54 apartir de 2007/01
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 29/03/2007
// Pendencia   : 24952
// Alteração   : 1) No caso de REB puro de pensionista atualizar partprevplan pelo IDTITULAR
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 20/03/2007
// Pendencia   : 24811
// Alteração   : 1) No caso de acertos financeiros nos pensionistas já saldados
//                  não reprocessar o Pecúlio e no demonstrativo exibir somente
//                  os pecúlios do Lote
//               2) Voltar a deflacionar 2006
// Pendencia   : 24806
// Alteração   : 1) Pesquisar o valor do beneficio pago no mês final do processo. 
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 15/03/2007
// Alteração   : Inclusao do desconto de 2.8 em 2007
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Pendencia   : 24242
// Data        : 18/01/2007
// Alteração   : No caso de DIBs em 2006, não deflacionar o ano de 2006
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Pendencia   : 24161
// Data        : 10/01/2007
// Alteração   : Acerto no preencimento da DATAINICIO da contribuição da CONTRIBPREVPARTP
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Pendencia   : 24152
// Data        : 08/01/2007
// Alteração   : Fazer acerto financeiro para pensionistas
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Pendencia   : 24127
// Data        : 08/01/2007
// Alteração   : Volta do incentivo de 4%
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Pendencia   : 24139
// Data        : 05/01/2007
// Alteração   : Acerto no tratamento de abono para 2007 
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 27/12/2006
// Pendencia   : 24052
// Alteração   : Caso somente financeiro acertar somente com contribuição 633
// Data        : 19/12/2006
// Pendencia   : 23826
// Alteração   : Acerto no prenchimento do FLGCOBRA
// Pendencia   : 23981
// Alteração   : Novas implementações para saldamento de REBs puros
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 28/11/2006
// Alteração   : 1) Trocar pesquisa do emprestimo, de IDPESSOA para IDBENEF
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 06/11/2006
// Alteração   : 1) 23680 - Tratamento do PLANOCONTABIL para ativos
//               2) 23678 - Tratamento do abono
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 24/10/2006
// Alteração   : 1) Verificar se no saldamento de Ativo, individuo possui beneficio ativo
//               2) 23604 - Verificar se individuo possui registros na TMPDESC e bloquear
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 16/10/2006
// Pendencia   : 23583
// Alteração   : Incluir rotina para calcular acerto para diferença de Tábuas
//------------------------------------------------------------------------------
unit USaldamento;

interface

Uses
  Messages, SysUtils, Classes, Graphics, Controls, Dialogs, Windows,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, dBaseDados,
  ExtCtrls, Db, DBClient, uCMClientDataSet, uCmControlObject, uSistema,
  FAguarde, FileCtrl, uFuncoesUteis,
  DBTables, Wwquery, uMensErro, Math, fSelecionaLoteFuncef;

Type

  { Nesta UNIT estão as classes                                                                            }

  {  TSaldamentoAssociado   => Possui os métodos e propriedades comuns a todo o processo de saldamento.    }

  {  TSaldamentoAtivo       => Possui os métodos e propriedades especificos do saldamento de Ativo.        }

  {  TSaldamentoAssistido   => Possui os métodos e propriedades comuns ao saldamento de Assitidos.         }
  {  TSaldamentoAposentado  => Possui os métodos e propriedades especificos do saldamento de Aposentados.  }
  {  TSaldamentoPensionista => Possui os métodos e propriedades especificos do saldamento de Pensionistas. }

  TTipoArquivo      = ( taAtivo, taAposentado, taPensionista );
  TTipoProcesso     = ( tpLote, tpIndividual );
  TTipoParticipante = ( tpNone, tpReplan, tpREB, tpReplanPre78, tpREBPre78 );
  TTipoBeneficio    = ( tbSuplementacao, tbRA, tbINSS );

  RDadosBeneficioMinimo = Record
                            DataReferencia : TDateTime;
                            Valor : Double;
                          End;

  { Declaração dos eventos }
  TOnProcessouRegistro = Procedure( Sender: TObject ) Of Object;

  { Declarado aqui para poder ser utilizado pela classe pai }
  TSaldamentoAtivo       = Class;
  TSaldamentoAssistido   = Class;
  TSaldamentoAposentado  = Class;
  TSaldamentoPensionista = Class;


  {----------------------------------------------------------------------------}
  { Inicio da classe TSaldamentoAssociado                                      }
  TSaldamentoAssociado = Class( TCmControlObject )
  Private

    FTipoArquivo             : TTipoArquivo;
    FTipoProcesso            : TTipoProcesso;
    FTipoParticipante        : TTipoParticipante;

    FNomeArquivoDeMatriculas : String;
    FMatriculaIndividuo      : String;
    FAnoMesRefProcesso       : String;
    FAnoMesInicioAcerto      : String;

    FPercentual              : Double;
    FValorBSExterno          : Double;
    FNumeroDeParcelas        : Integer;
    FRegistrosProcessados    : Integer;


    FGravaProcesso           : Boolean;
    FExibeDemonstrativo      : Boolean;
    FGravaDemonstrativo      : Boolean;
    FErroProcesso            : Boolean;
    FSomenteFinanceiro       : Boolean;
    FSomenteDiferencaRA      : Boolean;
    FSomenteBUA              : Boolean;

    FExibeDemonstrativoTecnico : Boolean;

    FOnProcessouRegistro : TOnProcessouRegistro;

    ArquivoDemonstrativo, ArquivoResultado : TextFile;

    sPathArquivos, sNomeArquivoDemonstrativo,
    sNomeArquivoResultado,
    sMensagemDeErro, sDataEvento : String;

    iIdNovoPlano,   iIdPlanoContabil,   iIdSitPlanoSaldado, iIdResponsavelProcessando,
    iIdEventoDeSaldamento, iIdEventoDeInscricao : Integer;
    iIdFundacao : Integer;

    // Daniel Begnami Sol: 96526, 97976 e 93782
    flgPessoaParam : String;
    // Fim

    iFiller, iIdBenefFiller : Integer;
    sFiller : String;
    dFiller : Double;

    iIdLoteProcesso     : Integer;
    sAnoMesLoteProcesso : String;
    sDataLoteProcesso   : String;
    iIdMotivoBAcerto, iIdMotivoBNormal, iIdMotivoBAbono : Integer;
    iIdMotivoCAcerto, iIdMotivoCNormal, iIdMotivoCAbono : Integer;
    iIdTipoReservaBS, iIdTipoReservaRM : Integer;
    iIncentivoDoPlano, iIdUltMovBenef, iIdEventosSaldamento : Integer;
    dIncentivo354 : Double;
    dIncentivo535 : Double;

    sSQL : String;


    dValorBSOriginal, dValorRAOriginal, dValorRMOriginal,
    dValorRAParcelada : Double;

    Function AbreArquivoDeMatriculas: Boolean;

    Procedure LeLinhaArquivoMatricula;

    { Outras funções úteis }
    Function PreparaStr( Str: String; Tamanho: Integer): String;
    Function AlinhaDireita( psCampo : String; piCasas: Integer ) : String;
    Function AnoMesAnterior( psAnoMesRef : String ) : String;
    Function Trunca( pdValor: Double; piDecimais: Integer ): Double;
    Function EvoluiMes( pdDataRef : TDate; piNumeroMeses : Integer ): String;

    Function GetSequenceLocal( psNomeTabela : String ): Integer;

    Function OraNumero( sNumero : String ): String;

    procedure SetNumeroDeParcelas(const Value: Integer);

  Protected

    FArquivoDeMatriculas : TextFile;

    CdsDadosGrupoFamiliar,
    CdsSaldamento,         CdsDadosIndividuo,
    CdsHistoricoBeneficio, CdsSaldamentoAux : TCMClientDataSet;

    QrySaldamentoAux : TwwQuery;


    Function IniciarProcessoIndividuo: Boolean;

    Function ProcessarIndividuo: Boolean; Virtual;

    Function ProcessarInscricoes: Boolean; Virtual;
    Function ProcessarEventos: Boolean; Virtual;
    Function ProcessarEmprestimos( piIdPessoa : Integer ) : Boolean;
    Function ProcessarContribuicoes: Boolean;
    Function ProcessarReservas: Boolean;

    Function AcertaBeneficioSaldado( CdsDadosBeneficio : TCMClientDataSet;
                                     piNumeroProcesso, piIdBeneficioOrigem, piIdBeneficioDestino : Integer;
                                     pbEhDiferencaRA : Boolean;
                                     ptbBeneficio : TTipoBeneficio ) : Boolean; Virtual; Abstract;

    Procedure SetaTipoParticipante;

    Function RetornaDadosReplan( piIdPessoa : Integer;
                                 Var psDataInicio     : String;
                                 Var psDataInicioRef  : String;
                                 Var psDataCancelamento : String;
                                 Var piIdBeneficio    : Integer;
                                 Var piIdSitBeneficio : Integer;
                                 Var piIdSitPart      : Integer;
                                 Var dValorAtual      : Double;
                                 pbEhRA : Boolean ) : Boolean; Virtual; Abstract;

    Function RetornaTipoParticipanteString: String;
    Function RetornaDadosLote: String;

    Function Terminar: Boolean;

    Procedure GravaNoDemonstrativo( psMensagem: String );
    Procedure MontarDemonstrativo;
    Procedure MontarDemonstrativoUsuario;

  Public

    Constructor Create;  override;
    Destructor  Destroy; override;

    Property OnProcessouRegistro : TOnProcessouRegistro Read FOnProcessouRegistro Write FOnProcessouRegistro;

    Property NomeArquivoDeMatriculas : String Read FNomeArquivoDeMatriculas Write FNomeArquivoDeMatriculas;

    Property TipoProcesso         : TTipoProcesso  Read FTipoProcesso          Write FTipoProcesso;
    Property TipoArquivo          : TTipoArquivo   Read FTipoArquivo           Write FTipoArquivo;

    Property AnoMesRefProcesso    : String         Read FAnoMesRefProcesso     Write FAnoMesRefProcesso;
    Property AnoMesInicioAcerto   : String         Read FAnoMesInicioAcerto    Write FAnoMesInicioAcerto;

    Property GravaProcesso        : Boolean        Read FGravaProcesso         Write FGravaProcesso;
    Property ExibeDemonstrativo   : Boolean        Read FExibeDemonstrativo    Write FExibeDemonstrativo;
    Property GravaDemonstrativo   : Boolean        Read FGravaDemonstrativo    Write FGravaDemonstrativo;
    Property ErroProcesso         : Boolean        Read FErroProcesso;
    Property SomenteFinanceiro    : Boolean        Read FSomenteFinanceiro     Write FSomenteFinanceiro;
    Property SomenteDiferencaRA   : Boolean        Read FSomenteDiferencaRA    Write FSomenteDiferencaRA;
    Property SomenteBUA           : Boolean        Read FSomenteBUA            Write FSomenteBUA;         
    Property ExibeDemonstrativoTecnico : Boolean   Read FExibeDemonstrativoTecnico Write FExibeDemonstrativoTecnico;



    Property MatriculaIndividuo   : String         Read FMatriculaIndividuo    Write FMatriculaIndividuo;
    Property Percentual           : Double         Read FPercentual            Write FPercentual;
    Property ValorBSExterno       : Double         Read FValorBSExterno        Write FValorBSExterno;
    Property NumeroDeParcelas     : Integer        Read FNumeroDeParcelas      Write SetNumeroDeParcelas;
    Property RegistrosProcessados : Integer        Read FRegistrosProcessados  Write FRegistrosProcessados;

    Function Processar: Boolean; Virtual;

  End;
  { Fim da classe TSaldamentoAssociado                                         }
  {----------------------------------------------------------------------------}

  {----------------------------------------------------------------------------}
  { Inicio da classe TSALDAMENTOATIVO                                          }
  TSaldamentoAtivo = Class( TSaldamentoAssociado )
  Private

    Function PassouElegibilidade: Boolean;
    Function VerificaDividaPrevidenciaria: Boolean;

    Function BuscaDadosIndividuo: Boolean;

    Function ProcessarIndividuo: Boolean; OverRide;

    Function ProcessarInscricoes: Boolean; OverRide;
    Function ProcessarEventos: Boolean; OverRide;

    Function InsereEvento( iIdEventoGerador : Integer ) : Boolean;
    Function ReplicaEvento : Boolean;

  Public

    Constructor Create;  override;
    Destructor  Destroy; override;

    Function Processar: Boolean; OverRide;

  End;
  { Fim da classe TSALDAMENTOATIVO                                             }
  {----------------------------------------------------------------------------}

  {----------------------------------------------------------------------------}
  { Inicio da classe TSaldamentoAssistido                                      }
  TSaldamentoAssistido = Class( TSaldamentoAssociado )
  Private

    //BRUNO AZEVEDO SOL 131372 KINTANA 747479
    xQryIndices: TwwQuery;
    //BRUNO AZEVEDO SOL 131372 KINTANA 747479

    VetBeneficioMinimo  : Array [0..5] Of RDadosBeneficioMinimo;

    // Daniel Begnami Sol: 96526, 97976 e 93782
    Procedure SetaPessoaParam(pidPessoa : String);
    // Fim

    Function BuscaDadosIndividuo: Boolean;

    Procedure GravaParamPessoa( piIdPessoa, piParameto : Integer );

    Function PassouElegibilidade: Boolean; Virtual; Abstract;

    Function ProcessarIndividuo: Boolean; OverRide;

    Function ProcessarInscricoes: Boolean; OverRide;
    Function ProcessarEventos: Boolean; OverRide;
    Function ProcessarRubricaPeculio( piIdPessoa : Integer ) : Boolean;

    Function ProcessarBeneficios( piIdPessoa : Integer ): Boolean;

    //BRUNO AZEVEDO SOL 131372 KINTANA 747479
    procedure AplicaIncentivo(var pValor: double);
    //BRUNO AZEVEDO SOL 131372 KINTANA 747479

    Function AcertaBeneficioSaldado( CdsDadosBeneficio : TCMClientDataSet;
                                     piNumeroProcesso, piIdBeneficioOrigem, piIdBeneficioDestino : Integer;
                                     pbEhDiferencaRA : Boolean;
                                     ptbBeneficio : TTipoBeneficio ) : Boolean; OverRide;

    Function InsereBeneficio( CdsDadosBeneficio : TCMClientDataSet;
                              piIdBeneficiario, piIdBeneficioOrigem,
                              piIdBeneficioDestino: Integer;
                              pbEhRA, pbEhDiferencaRA : Boolean;
                              Var piNumeroProcesso : Integer;
                              ptbBeneficio : TTipoBeneficio ): Boolean;

    Function IncluiMovBenef( piNumeroProcesso, piIdBeneficio,
                             piIdBeneficiario, piIdPlanoPrev,
                             piTipoMov,        piIdMotivo : Integer;
                             sDataInicio, sDataFinal  : String;
                             dValorAtual, dValorTotal : Double ): Integer;

    Function InsereHistoricoBeneficio( CdsDadosBeneficio : TCMClientDataSet;
                                       psAnoMesReferencia, psAnoMesAtual : String;
                                       piNumeroProcesso, piIdBeneficiario, piIdBeneficio,
                                       piIdMotivo,       piFlgEnviado,     piFlgDevolucao,
                                       piIdMovBenef : Integer;
                                       pdValor, pdValorIntegral : Double ) : Integer;

    Function MigraHistorico( CdsDadosBeneficio : TCMClientDataSet;
                             psAnoMesInicio : String;
                             piNumeroProcesso,    piIdBeneficiario,
                             piIdBeneficioOrigem, piIdBeneficioDestino,
                             piIdMovBenef  : Integer ) : Boolean;

    Function InsereHistoricoContribuicao( CdsDadosBeneficio : TCMClientDataSet;
                                          psAnoMesReferencia : String;
                                          piIdMotivo,       piFlgDevolucao,
                                          piSitRecebimento, piIdContribuicao, piIdMovBenef : Integer;
                                          dValor : Double ) : Integer;
    Function InsereHstContribPREV( qryAux                              : TwwQuery;
                                   piIdPessoa,       piSeqProposta,
                                   piIdPessJur,      piIdPlanoPrev,
                                   piIdContribuicao, piIdMotivo        : longint;
                                   psMesReferencia,  psMesCobranca     : string;
                                   piCodPortForma                      : longint;
                                   psDataCobranca,   psDataRecebimento : string;
                                   pdValorEsperado,  pdValorCalculado,
                                   pdValorRecebido                     : double;
                                   piIdRegraCalculo                    : longint;
                                   piFlgDescFolha                      : integer;
                                   pdValorBase1,     pdValorBase2,
                                   pdValorBase3                        : double;
                                   psDataInicio,     psDataFinal,
                                   psFlgIntSitPart                     : string;
                                   piSitRecebimento,
                                   piParcela,
                                   piIdLote                            : longint;
                                   pcTipoPrevidencia                   : char;
                                   piFlgCalcReserva,
                                   piFlgDevolucao,   piFlgConcessao,
                                   piFlgEvento                         : integer;
                                   psFolhaOrigem                       : string = '';
                                   piIdMovBenef : Integer = -1 ) : Longint;

                                   //BRUNO AZEVEDO SOL 133751 KINTANA 782370 SOL 136276 KINTANA 813879
                                   //ADICIONADO IFLGDEVOLUCAO
    Function InsereCorrecaoMonetaria(pcTipoCorracao : Char;
                                     psAnoMesRef    : String;
                                     pdValor        : Double;
                                     piNumeroProcesso, piIdBeneficio, piIdBeneficiario,
                                     piIdMotivo,       piIdentificadorHistorico : LongInt;
                                     piFlgDevolucao : Integer ) : Boolean;

    Function InsereRubricaIndiv( piIdPessoa, piIdRubrica, piIdRegra,
                                 piNumeroDeParcelas, piIdUltMovBenef : Integer;
                                 dValor : Double ): Boolean;

    Function RetornaValorContribuicao( piNumeroProcesso, piIdBeneficio, piIdPessoa : Integer;
                                       psAnoMesReferencia : String ): Double;

    Function CorrigeValorBS( dDataRef: TDateTime; dValorBS : Double  ): Double;
    Function CorrigeValor( dValorReferencia : Double; sAnoMesRef : String ): Double;

    Function RetornaValorSUPL( CdsDadosBeneficio : TCMClientDataSet;
                               dDataRef: TDateTime;
                               piIdPlanoPrev : Integer;
                               Var piNumeroProcesso, piIdBeneficio, piPercentual : Integer ): Double;

    Function RetornaDadosReplan( piIdPessoa : Integer;
                                 Var psDataInicio       : String;
                                 Var psDataInicioRef    : String;
                                 Var psDataCancelamento : String;
                                 Var piIdBeneficio      : Integer;
                                 Var piIdSitBeneficio   : Integer;
                                 Var piIdSitPart        : Integer;
                                 Var dValorAtual        : Double;
                                 pbEhRA : Boolean ) : Boolean; OverRide;

    Function RetornaBeneficioMinimo( pdDataRef: TDateTime ): Double;

    Function RetornaValorReserva( piIdBeneficiario, piIdTipoReserva : Integer ): Double;

  Public

    Property TipoParticipante   : TTipoParticipante Read FTipoParticipante    Write FTipoParticipante;

    Constructor Create;  override;
    Destructor  Destroy; override;

    Function Processar: Boolean; OverRide;

  End;
  { Fim da classe TSaldamentoAssistido                                         }
  {----------------------------------------------------------------------------}

  {----------------------------------------------------------------------------}
  { Inicio da classe TSaldamentoAposentado                                     }
  TSaldamentoAposentado = Class( TSaldamentoAssistido )
  Private

    Function PassouElegibilidade: Boolean; OverRide;

    Function ProcessarIndividuo: Boolean; OverRide;

  Public

    Constructor Create;  override;
    Destructor  Destroy; override;

    Function Processar: Boolean; OverRide;

  End;
  { Fim da classe TSaldamentoAposentado                                        }
  {----------------------------------------------------------------------------}

  {----------------------------------------------------------------------------}
  { Inicio da classe TSaldamentoPensionista                                    }
  TSaldamentoPensionista = Class( TSaldamentoAssistido )
  Private

    Function PassouElegibilidade: Boolean; OverRide;
    Function PassouElegibilidadeBeneficiario: Boolean;

    Function ProcessarIndividuo: Boolean; OverRide;

    Function BuscaDadosDoGruposFamiliar: Boolean;

    Function ProcessarContribuicoes: Boolean;

  Public

    Constructor Create;  override;
    Destructor  Destroy; override;

    Function Processar: Boolean; OverRide;

  End;
  { Fim da classe TSaldamentoPensionista                                       }
  {----------------------------------------------------------------------------}

Implementation

{******************************************************************************}
{ Inicio da implementação da classe TSaldamentoAssociado                       }
{ TSaldamentoAtivo }

{------------------------------------------------------------------------------}
{ Abrir arquivo de matriculas                                                  }
Function TSaldamentoAssociado.AbreArquivoDeMatriculas: Boolean;
Begin

  Result := True;

  Try

    If FNomeArquivoDeMatriculas = '' Then Abort;

    AssignFile( FArquivoDeMatriculas,  PChar( FNomeArquivoDeMatriculas ) );
    Reset( FArquivoDeMatriculas );

  Except

    MsgDlg('Erro ao abrir arquivo de matriculas. ', 'Erro', mtError, [mbOk], 0);
    Result := False;

  End;

End;

{------------------------------------------------------------------------------}
{ Ler linha do arquivo de matriculas e preenche dados da matricula processada  }
procedure TSaldamentoAssociado.LeLinhaArquivoMatricula;
Var
  sLinha : String;
begin

  ReadLn( FArquivoDeMatriculas, sLinha );

  FMatriculaIndividuo := Copy( sLinha, 2, 7);
  FPercentual         := StrToFloat( Copy( sLinha, 9, 6) );

  If ( TipoArquivo <> taAtivo ) Then Begin

    FNumeroDeParcelas   := StrToInt( Copy( sLinha, 15, 2) );

    If ( FNumeroDeParcelas = 0 ) Then FNumeroDeParcelas := 1;
    
  End;

end;

Constructor TSaldamentoAssociado.Create;
Begin
  Inherited;

  FGravaDemonstrativo := True;
  FExibeDemonstrativo := True;

  iIdFundacao          := 1;
  iIncentivoDoPlano    := 4;
  dIncentivo354        := 3.54;
  dIncentivo535        := 5.35;
  iIdEventoDeInscricao := 1;
  iIdSitPlanoSaldado   := 25;
  iIdPlanoContabil     := 28;
  sDataEvento          := '01/09/2006';

  FSomenteFinanceiro   := False;
  FSomenteDiferencaRA  := False;
  FSomenteBUA          := False;

  { Ativos vão para o NOVO PLANO, assistidos voltam para o REPLAN }
  If ( FTipoArquivo = taAtivo ) Then Begin
    iIdNovoPlano          := 74;
    iIdEventoDeSaldamento := 338;
  End Else Begin
    iIdNovoPlano          := 2;
    iIdEventoDeSaldamento := 339;
  End;

  FValorBSExterno      := -1;
  iIdBenefFiller       := -1;


  CdsDadosIndividuo     := TCMClientDataSet.Create( Nil );
  CdsSaldamento         := TCMClientDataSet.Create( Nil );
  CdsSaldamentoAux      := TCMClientDataSet.Create( Nil );
  CdsHistoricoBeneficio := TCMClientDataSet.Create( Nil );
  CdsDadosGrupoFamiliar := TCMClientDataSet.Create( Nil );

  { Buscar dados do Lote }
  QrySaldamentoAux := TwwQuery.Create( Nil );
  QrySaldamentoAux.DataBaseName := 'BaseDados';

  iIdLoteProcesso     := 19165;
  sAnoMesLoteProcesso := '2006/06';

  { Motivos }
  iIdMotivoBAcerto := 3046;
  iIdMotivoBNormal := 3007;
  iIdMotivoBAbono  := 3008;

  iIdMotivoCAcerto := 3046;
  iIdMotivoCNormal := 3003;
  iIdMotivoCAbono  := 3034;

  { Reservas }
  iIdTipoReservaBS := 114;
  iIdTipoReservaRM := 113;

End;

Destructor TSaldamentoAssociado.Destroy;
Begin

  FreeAndNil( CdsDadosIndividuo );
  FreeAndNil( CdsSaldamento     );
  FreeAndNil( CdsSaldamentoAux  );
  FreeAndNil( CdsHistoricoBeneficio );
  FreeAndNil( CdsDadosGrupoFamiliar );

  Inherited;

End;


Procedure TSaldamentoAssociado.SetNumeroDeParcelas( Const Value: Integer );
Begin

  FNumeroDeParcelas := Value;

  If ( FNumeroDeParcelas = 0 ) Then FNumeroDeParcelas := 1;

End;


{------------------------------------------------------------------------------}
{ Executa proceso de saldamento principal                                      }
Function TSaldamentoAssociado.Processar: Boolean;
Var
  iNumPessoasProcessadas : Integer;
  Begin

  Result := False;

  Try

    { Cria diretorio para arquivos de saldamento }
//  sPathArquivos := 'C:\SALDAMENTO';
    sPathArquivos := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\SALDAMENTO';
    If ( Not DirectoryExists( sPathArquivos ) ) Then Begin

      Try
        MkDir( sPathArquivos );
      Except
//        sPathArquivos := 'C:\TEMP'
          sPathArquivos := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\'
      End;

    End;


    If dtmBaseDados.dbBaseDados.InTransaction Then dtmBaseDados.dbBaseDados.RollBack;
    dtmBaseDados.dbBaseDados.StartTransaction;

    { Abrir arquivo de matriculas }
    If ( FTipoProcesso = TpLote ) Then Begin

      If Not AbreArquivoDeMatriculas Then Exit;

      { Arquivo de Demonstrativo }
      DateSeparator := '-';
      TimeSeparator := '-';

      sNomeArquivoResultado     := sPathArquivos + '\RESULTADO FINAL DO PROCESSAMENTO '+ FormatDateTime( 'DD/MM/YYYY  HH:MM', Now ) + '.TXT';

      DateSeparator := '/';
      TimeSeparator := ':';

      AssignFile( ArquivoResultado,  PChar( sNomeArquivoResultado ) );
      Rewrite( ArquivoResultado );

    End;

    { Caso seja diferença de RA então não processa outras partes do saldamento }
    If ( FSomenteDiferencaRA = True ) Then FSomenteFinanceiro := True;
    If ( FSomenteBUA = True )         Then FSomenteFinanceiro := True;

    FRegistrosProcessados := 0;

    If FTipoProcesso = TpIndividual Then Begin

      FErroProcesso       := False;

      If ( Not ProcessarIndividuo ) Then Begin

          FErroProcesso := True

      End;

      Inc( FRegistrosProcessados );

      If ( FExibeDemonstrativoTecnico = True ) Or ( FTipoArquivo = taAtivo )
      Then Try MontarDemonstrativo Except End
      Else Try MontarDemonstrativoUsuario Except End;

      If Assigned( FOnProcessouRegistro  ) Then FOnProcessouRegistro( Self );


    End Else Begin ;

      iNumPessoasProcessadas := 0;

      While ( Not Eof( FArquivoDeMatriculas ) ) Do Begin

        FErroProcesso := False;

        LeLinhaArquivoMatricula;

        If ( Not ProcessarIndividuo ) Then Begin

            FErroProcesso := True;

            WriteLn( ArquivoResultado, FMatriculaIndividuo + '   ERRO: ' + sMensagemDeErro );

        End;

        Inc( FRegistrosProcessados );

        If ( FExibeDemonstrativoTecnico = True ) Or ( FTipoArquivo = taAtivo )
        Then Try MontarDemonstrativo Except End
        Else Try MontarDemonstrativoUsuario Except End;

        If ( FGravaDemonstrativo = True ) Then Begin

          Flush( ArquivoDemonstrativo );
          CloseFile( ArquivoDemonstrativo );
          
        End;

        If Assigned( FOnProcessouRegistro  ) Then FOnProcessouRegistro( Self );

        If dtmBaseDados.dbBaseDados.InTransaction Then Begin

          If ( FErroProcesso = True ) Then Begin

            dtmBaseDados.dbBaseDados.Rollback

          End Else Begin

            If ( FGravaProcesso = True )
            Then dtmBaseDados.dbBaseDados.Commit
            Else dtmBaseDados.dbBaseDados.Rollback;

          End;

          dtmBaseDados.dbBaseDados.StartTransaction;

        End;

      End; { While ( Not Eof( FArquivoDeMatriculas ) ) Do Begin }

      Flush( ArquivoResultado );

    End; { If FTipoProcesso = TpIndividual Then Begin }

  Finally

    If dtmBaseDados.dbBaseDados.InTransaction Then Begin

      If ( FErroProcesso = True ) Then Begin

        dtmBaseDados.dbBaseDados.Rollback

      End Else Begin

        If ( FGravaProcesso = True )
        Then dtmBaseDados.dbBaseDados.Commit
        Else dtmBaseDados.dbBaseDados.Rollback;

      End;

    End;

    Terminar;

  End;

  Result := True;

End;

{------------------------------------------------------------------------------}
{ Verifica regras de elegiilidade para saldamento                              }
Function TSaldamentoAtivo.PassouElegibilidade: Boolean;
Var
  sSQL : String;
Begin

  sSQL := 'SELECT '+
          '  1 '+
          'FROM   '+
          '  BENEFBFCIARIO BFB '+
          'WHERE  '+
          '      BFB.IDPESSJUR      = '+ CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString     +
          '  AND BFB.IDPLANOPREV    = '+ CdsDadosIndividuo.FieldByName('IDPLANOPREV').AsString   +
          '  AND BFB.IDTITULAR      = '+ CdsDadosIndividuo.FieldByName('IDTITULAR').AsString     +
          '  AND BFB.IDPESSOA       = '+ CdsDadosIndividuo.FieldByName('IDTITULAR').AsString     +
          '  AND BFB.FONTEPAGADORA  = 1    '+
          '  AND BFB.IDSITBENEFICIO IN (1,3) ';

  CdsSaldamento.Data := GetDataPacket( sSQL );

  If ( CdsSaldamento.IsEmpty = False ) Then Begin
    Result := False;;
    sMensagemDeErro := 'POSSUI BENEFICIO DE SUPLEMENTAÇÂO ATIVA.';
    Exit;
  End;

  If ( CdsDadosIndividuo.FieldByName('IDPLANOPREV').AsInteger = 74 ) Then Begin
    Result := False;;
    sMensagemDeErro := 'SALDAMENTO JÁ PROCESSADO PARA ESSA MATRICULA.';
    Exit;
  End Else Result := True;


End; { TSaldamentoAtivo.PassouElegibilidade: Boolean; }

{------------------------------------------------------------------------------}
{ Verifica divida previdenciária                                               }
Function TSaldamentoAtivo.VerificaDividaPrevidenciaria: Boolean;
Var
  sSQL : String;
Begin

  Result := False;

  sSQL := 'SELECT  '+
          '  1 '+
          'FROM   '+
          '  HSTCONTRIBPREV HST  '+
          'WHERE  '+
          '      HST.IDPESSJUR      = '+ CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString      +
          '  AND HST.IDPLANOPREV    = '+ CdsDadosIndividuo.FieldByName('IDPLANOPREV').AsString    +
          '  AND HST.IDPESSOA       = '+ CdsDadosIndividuo.FieldByName('IDTITULAR').AsString      +
          '  AND HST.IDCONTRIBUICAO NOT IN ( 259,500 ) '+
          '  AND NVL(VALORESPERADO, 0) > 0 '+
          '  AND NVL(VALORRECEBIDO, 0) = 0 ';

  CdsSaldamento.Data := GetDataPacket( sSQL );

  If ( Not CdsSaldamento.IsEmpty = True ) Then Begin
    sMensagemDeErro := 'POSSUI DIVIDA PREVIDENCIÁRIA.';
    Exit;
  End Else Result := True;

  sSQL := 'SELECT  '+
          '  1 '+
          'FROM   '+
          '  PARCELAMENTO PAR  '+
          'WHERE  '+
          '  PAR.IDPESSOA  = '+ CdsDadosIndividuo.FieldByName('IDPESSOA').AsString;

  CdsSaldamento.Data := GetDataPacket( sSQL );

  If ( Not CdsSaldamento.IsEmpty = True ) Then Begin
    Result := False;;
    sMensagemDeErro := 'POSSUI DIVIDA PREVIDENCIÁRIA.';
    Exit;
  End Else Result := True;

End;

{------------------------------------------------------------------------------}
{ Buscar dados do individuo sendo processado                                   }
Function TSaldamentoAtivo.BuscaDadosIndividuo: Boolean;
Var
  sSQL, sLinhaMatriculas : String;
Begin

  Try

    Try

      sSQL := 'SELECT '+
              '  ELG.IDPESSOA,        ELG.IDPESSJUR,     ELG.IDPESSOA AS IDTITULAR, '+
              '  ELG.MATRICULA,       ELG.DATAADMISSAO,  ELG.IDSITFUNC,   '+

              '  PEST.NOME,       '+

              '  PPP.IDPLANOPREV,     PPP.DATACANCELAMENTO, '+
              '  PPP.INSCRICAODATA,   PPP.DTINICIOINSC,  PPP.SEQPROPOSTA,    '+
              '  PPP.INSCRICAONUMERO, PPP.IDSITPART,     PPP.IDSITPLANOPREV, '+

              '  0 AS VALORBS '+
              'FROM   '+
              '  PESSOA PEST,   PESSOAFISICA PEFT, '+
              '  ELEGPATRO ELG, PARTPREVPLAN PPP   '+
              'WHERE  '+
              '  ( ELG.MATRICULA     = '+ QuotedStr( FMatriculaIndividuo )  +' ) AND '+
              '  ( PPP.FLGDESATIVADO = 0 ) AND '+
              '  ( ELG.IDPESSOA      = PEST.IDPESSOA )    AND '+
              '  ( ELG.IDPESSOA      = PEFT.IDPESSOA )    AND '+

              '  ( ELG.IDPESSJUR     = PPP.IDPESSJUR )    AND '+
              '  ( ELG.IDPESSOA      = PPP.IDPESSOA  )        ';

      CdsDadosIndividuo.Data := GetDataPacket( sSQL );

      If ( CdsDadosIndividuo.IsEmpty = True ) Then Abort;

      Result := True;

    Except

      On E:Exception Do Begin

        sMensagemDeErro := E.Message;

        If ( sMensagemDeErro = 'Operation aborted' ) Then sMensagemDeErro := 'Dados da matricula não encontrada.';

        Result := False;
      End;

    End;

  Finally

  End;

End; { TSaldamentoAtivo.BuscaDadosIndividuo }

{------------------------------------------------------------------------------}
{ Executa inicio do proceso de saldamento para cada individuo                  }
Function TSaldamentoAssociado.IniciarProcessoIndividuo: Boolean;
Begin

  Try

    Result := False;

    If ( FGravaDemonstrativo = True ) Then Begin

      { Arquivo de Demonstrativo }
      DateSeparator := '-';
      TimeSeparator := '-';

      sNomeArquivoDemonstrativo := sPathArquivos + '\DEMONSTRATIVO DE SALDAMENTO DA MATRICULA '+ FMatriculaIndividuo + '.TXT';

      DateSeparator := '/';
      TimeSeparator := ':';

      AssignFile( ArquivoDemonstrativo,  PChar( sNomeArquivoDemonstrativo ) );
      Rewrite( ArquivoDemonstrativo );

    End;

    Result := True;

  Except


  End;

End;

{------------------------------------------------------------------------------}
{ Executa proceso de saldamento para cada individuo                            }
Function TSaldamentoAssociado.ProcessarIndividuo: Boolean;
Begin

  Result := True;

End;

{------------------------------------------------------------------------------}
{ Executa alterações nas tabelas da inscrição (PARTPREVPLAN)                   }
Function TSaldamentoAssociado.ProcessarInscricoes: Boolean;
Begin

  Result := True;

End;

{------------------------------------------------------------------------------}
{ Executa alterações nas tabelas de evento  (EVENTOSPREV)                      }
Function TSaldamentoAssociado.ProcessarEventos: Boolean;
Var
  sSQL, sDataCancelamento : String;
  iIdSitPart, iIdPlanoSaldamento : Integer;
  bAchouReplan : Boolean;
Begin

  Result := False;

  If ( TipoArquivo = taAtivo )
  Then iIdPlanoSaldamento := CdsDadosIndividuo.FieldByName('IDPLANOPREV').AsInteger
  Else iIdPlanoSaldamento := 2;


  iIdSitPart        := CdsDadosIndividuo.FieldByName('IDSITPART').AsInteger;
  sDataCancelamento := CdsDadosIndividuo.FieldByName('DATACANCELAMENTO').AsString;

  If ( FTipoArquivo = taAposentado ) And ( CdsDadosIndividuo.FieldByName('IDPLANOPREV').AsInteger = 66 )
  Then bAchouReplan := RetornaDadosReplan( CdsDadosIndividuo.FieldByName('IDTITULAR').AsInteger , sFiller, sFiller, sDataCancelamento,
                                           iIdBenefFiller, iFiller, iIdSitPart, dFiller, False );

  Try

    {--------------------------------------------------------------------------}
    { Evento de saldamento                                                     }

    iIdEventosSaldamento := GetSequenceLocal( 'EVENTOSPREV' );

    sSQL := ' INSERT INTO EVENTOSPREV (IDEVENTOSPREV,   DATAREGISTRO,    DATAEVENTO,      DATAVOLTA,   ' +
            '                          IDPESSOA,        IDPESSJUR,       IDPLANOPREV,     SEQPROPOSTA, ' +
            '                          IDSITFUNCATUAL,  IDSITPARTATUAL,  IDSITPLANOATUAL, ' +
            '                          IDSITFUNCNOVO,   IDSITPARTNOVO,   IDSITPLANONOVO,  ' +
            '                          IDEVENTOGERADOR, FLGSITFUNCIMED,  FLGSITPARTIMED,  ' +
            '                          FLGSITPLANOIMED, DATAEFETIVADO,   FLGEFETIVADO,   ' +
            '                          INSCRICAONUMERO)                 ' +
            ' VALUES(' + IntToStr( iIdEventosSaldamento )               + ',' +
            ' TO_DATE(''' + DateToStr(Date)     + ''',''DD/MM/YYYY'') ,' +
            ' TO_DATE(''' + DateToStr( StrToDate( sDataEvento )- 1) + ''',''DD/MM/YYYY'') ,' +

            ' TO_DATE(''' + sDataCancelamento + ''',''DD/MM/YYYY'') ,' + { DATAVOLTA }

            CdsDadosIndividuo.FieldByName('IDTITULAR').AsString       + ',' +
            CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString       + ',' +

            IntToStr( iIdPlanoSaldamento )                            + ',' + { IDPLANOPREV       }

            CdsDadosIndividuo.FieldByName('SEQPROPOSTA').AsString     + ',' +

            CdsDadosIndividuo.FieldByName('IDSITFUNC').AsString       + ',' +
            CdsDadosIndividuo.FieldByName('IDSITPART').AsString       + ',' +
            CdsDadosIndividuo.FieldByName('IDSITPLANOPREV').AsString  + ',' +
            CdsDadosIndividuo.FieldByName('IDSITFUNC').AsString + ',' +

            IntToStr( iIdSitPart )                                    + ',' +   { IDSITPARTNOVO  }

            '25 ,' +                                                            { IDSITPLANONOVO }
            IntToStr( iIdEventoDeSaldamento )                         + ',' +   { EVENTOGERADOR  }
            '''1'',''1'',''1'',' +
            ' TO_DATE('''+DateToStr(Date)+''',''DD/MM/YYYY''),''1'''+','+

            QuotedStr( CdsDadosIndividuo.FieldByName('INSCRICAONUMERO').AsString ) +')';

    If Not ExecSQL( sSQL ) Then Abort;

  Except

    sMensagemDeErro := MessageInfo;

    Result := False;
    Exit;

  End;

  Result := True;

End; { TSaldamentoAssociado.ProcessarEventos }

{------------------------------------------------------------------------------}
{ Migrar contratos de emprestimo                                               }
Function TSaldamentoAssociado.ProcessarEmprestimos( piIdPessoa : Integer ) : Boolean;
Var
  sSQL, sFlgTipoRegistro : String;
Begin

  Try

    Result := False;

    sSQL :=' SELECT IDCONTRATOEMPTMO FROM CONTRATOEMPTMO     '+
           ' WHERE  IDPATRO     = '+ CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString   +
           ' AND    IDPLANOPREV = '+ CdsDadosIndividuo.FieldByName('IDPLANOPREV').AsString +
           ' AND    IDBENEF     = '+ IntToStr( piIdPessoa )    +' '+
           ' AND    FLGSITUACAO <> ''Q'' ';

    CdsSaldamentoAux.Data := GetDataPacket( sSQL );

    If ( Not CdsSaldamentoAux.IsEmpty ) Then Begin

      sSQL := 'UPDATE CONTRATOEMPTMO SET IDPLANOPREV = '+ IntToStr( iIdNovoPlano )  +
              ' WHERE  IDPATRO     = '+ CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString   +
              ' AND    IDPLANOPREV = '+ CdsDadosIndividuo.FieldByName('IDPLANOPREV').AsString +
              ' AND    IDBENEF     = '+ IntToStr( piIdPessoa )    +' '+
              ' AND    FLGSITUACAO <> ''Q'' ';

      If Not ExecSQL( sSQL ) Then Abort;

    End; { If ( Not CdsSaldamentoAux.IsEmpty ) Then Begin }

    Result := True;

  Except

    sMensagemDeErro := MessageInfo;

    Result := False;
    Exit;

  End;

End;

{------------------------------------------------------------------------------}
{ Executa alterações nas tabelas de contribuição (CONTRIBPREVPARTP)            }
Function TSaldamentoAssociado.ProcessarContribuicoes: Boolean;


  Function BuscaDataInicioContrib: String; 
  Var
    sSQL : String;
  Begin
    Result := '';

    sSQL := 'SELECT '+
            ' MIN( CP.DATAINICIO ) AS DATAINICIO '+
            'FROM   '+
            '  CONTRIBPREVPARTP CP '+
            'WHERE   IDPESSJUR   = '+ CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString   +
            '  AND   IDPLANOPREV = '+ CdsDadosIndividuo.FieldByName('IDPLANOPREV').AsString +
            '  AND   IDPESSOA    = '+ CdsDadosIndividuo.FieldByName('IDPESSOA').AsString    +
            '  AND   SEQPROPOSTA = '+ CdsDadosIndividuo.FieldByName('SEQPROPOSTA').AsString +
            '  AND   FLGCOBRA    = 1';

    CdsSaldamentoAux.Data := GetDataPacket( sSQL );

    If ( CdsSaldamentoAux.IsEmpty = False ) Then Begin

      Result := CdsSaldamentoAux.FieldByName('DATAINICIO').AsString;

    End;


  End; { Function BuscaDataInicioContrib:String }


  Function BuscaPlanoContabil( iIdPessoa : Integer ) : Integer;
  Var
    sSQL : String;
  Begin

    Result := 75;

    sSQL := 'SELECT 1 FROM PESSOAPARAM '+
            'WHERE IDPESSOA = '+ IntToStr( iIdPessoa ) +
            '  AND IDPARAM  = 77'+
            '  AND VALOR    = '+ QuotedStr('S');

    CdsSaldamentoAux.Data := GetDataPacket( sSQL );

    If ( CdsSaldamentoAux.IsEmpty = True ) Then Begin

      Result := 74;

    End;

  End; { Function BuscaPlanoContabil( iIdPessoa : Integer ) : Integer; }

Var
  sSQL, sFlgDescFolha, sDataInicio, sCodPortForma, sFlgCobra : String;
  dPercentualLocal : Double;
  iIdPlanoContabilLocal, iIdSitBeneficio, iIdBeneficioReplan : Integer;

Begin

  Result := False;

  Try

    iIdPlanoContabilLocal := iIdPlanoContabil;

    iIdBeneficioReplan := -1;
    If ( FTipoArquivo = taAposentado )
    Then  Begin
      RetornaDadosReplan( CdsDadosIndividuo.FieldByName('IDPESSOA').AsInteger, sDataInicio, sFiller, sFiller,
                          iIdBeneficioReplan, iIdSitBeneficio, iFiller, dFiller, False )
    End Else Begin
      sDataInicio := sDataEvento;
      iIdPlanoContabilLocal := BuscaPlanoContabil( CdsDadosIndividuo.FieldByName('IDPESSOA').AsInteger );
    End;

    {--------------------------------------------------------------------------}
    { Incluir histórico de contribuições desassociadas no evento               }
    sSQL := 'INSERT INTO HSTCONTEVENTOSPR '+
            '  (IDEVENTOSPREV, IDASSOCIACAO, IDEVENTOGERADORF, IDPLANOPREVF, IDCONTRIBUICAOF, '+
            '   TIPO,          FLGASSOCIADA, DATAINICIO,       DATAFINAL )  '+
            'SELECT '+
            IntToStr( iIdEventosSaldamento )+ ', ' +
            '  ROWNUM, 339,'+
            '  CP.IDPLANOPREV, '+
            '  CP.IDCONTRIBUICAO, ''F'', 0, '+
            '  CP.DATAINICIO,     CP.DATAFINAL '+
            'FROM   '+
            '  CONTRIBPREVPARTP CP '+
            'WHERE   IDPESSJUR   = '+ CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString   +
            '  AND   IDPLANOPREV = '+ CdsDadosIndividuo.FieldByName('IDPLANOPREV').AsString +
            '  AND   IDPESSOA    = '+ CdsDadosIndividuo.FieldByName('IDPESSOA').AsString    +
            '  AND   SEQPROPOSTA = '+ CdsDadosIndividuo.FieldByName('SEQPROPOSTA').AsString +
            '  AND   FLGCOBRA    = 1';

    If Not ExecSQL( sSQL ) Then Abort;

    {--------------------------------------------------------------------------}
    { Associar as contribuições do NOVO PLANO                                  }
    sSQL := 'SELECT '+
            '  CP.CODPORTFORMA,   CP.FLGPAGADOR,   '+
            '  CP.IDCONTRIBUICAO, NVL( CP.FLGDESCFOLHA, 0 ) AS FLGDESCFOLHA '+
            'FROM   '+
            '  CONTPREVEVENTO CE, CONTPREV CP '+
            'WHERE  '+
            '  CE.IDPLANOPREV     = '+ IntToStr( iIdNovoPlano ) +' AND '+
            '  CE.IDEVENTOGERADOR IN ( SELECT EP.IDEVENTOGERADOR '+
            '                          FROM EVENTOSPREV EP       '+
            '                          WHERE ( EP.IDPESSOA = ' + CdsDadosIndividuo.FieldByName('IDPESSOA').AsString + ' ) AND '+
            '                                ( EP.IDPLANOPREV = '+ IntToStr( iIdNovoPlano ) +' ) AND '+
            '                                ( TO_CHAR(EP.TRGDTINCLUSAO, ''DD/MM/YYYY'') = '+ QuotedStr( DateToStr( Date ) ) +') ) AND '+
            '  CE.IDPLANOPREV     = CP.IDPLANOPREV    AND ' +
            '  CE.IDCONTRIBUICAO  = CP.IDCONTRIBUICAO';

    CdsSaldamento.Data := GetDataPacket( sSQL );

    If ( sDataInicio = '' ) Then  sDataInicio := BuscaDataInicioContrib; 

    While Not CdsSaldamento.Eof Do Begin

      dPercentualLocal := 2;

      If FTipoArquivo = taAtivo Then Begin

        If ( CdsSaldamento.FieldByName('IDCONTRIBUICAO').AsInteger = 21 )
        Then dPercentualLocal := 12
        Else dPercentualLocal := FPercentual;

      End;

      { Percentual de contribuição de assistido final, sempre 1%}
      If ( FTipoArquivo = taAposentado ) Then dPercentualLocal := 1;

      sFlgDescFolha := CdsSaldamento.FieldByName('FLGDESCFOLHA').AsString;

      sSQL :=  'SELECT '+
               '  1 '+
               'FROM   '+
               '  CONTRIBPREVPARTP CP '+
               'WHERE   IDPESSJUR   = '+ CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString   +
               '  AND   IDPLANOPREV = '+ IntToStr( iIdNovoPlano ) +
               '  AND   IDPESSOA    = '+ CdsDadosIndividuo.FieldByName('IDPESSOA').AsString    +
               '  AND   SEQPROPOSTA = '+ CdsDadosIndividuo.FieldByName('SEQPROPOSTA').AsString +
               '  AND   IDCONTRIBUICAO = '+ CdsSaldamento.FieldByName('IDCONTRIBUICAO').AsString;

      CdsSaldamentoAux.Data := GetDataPacket( sSQL );

      If ( CdsSaldamentoAux.IsEmpty = True ) Then Begin

        sSQL :=  'SELECT '+
                 '  CP.CODPORTFORMA, NVL(CP.FLGCOBRA,0) AS FLGCOBRA '+
                 'FROM   '+
                 '  CONTRIBPREVPARTP CP '+
                 'WHERE   IDPESSJUR   = '+ CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString   +
                 '  AND   IDPLANOPREV = '+ CdsDadosIndividuo.FieldByName('IDPLANOPREV').AsString +
                 '  AND   IDPESSOA    = '+ CdsDadosIndividuo.FieldByName('IDPESSOA').AsString    +
                 '  AND   SEQPROPOSTA = '+ CdsDadosIndividuo.FieldByName('SEQPROPOSTA').AsString +
                 '  AND   IDCONTRIBUICAO = '+ CdsSaldamento.FieldByName('IDCONTRIBUICAO').AsString;

        CdsSaldamentoAux.Data := GetDataPacket( sSQL );

        If ( Not CdsSaldamentoAux.IsEmpty = True ) Then Begin

          sCodPortForma := CdsSaldamentoAux.FieldByName('CODPORTFORMA').AsString;
          sFlgCobra     := CdsSaldamentoAux.FieldByName('FLGCOBRA').AsString;

        End Else Begin

          sCodPortForma := CdsSaldamento.FieldByName('CODPORTFORMA').AsString;
          sFlgCobra     := '1'; 

        End;

        sSQL := 'INSERT INTO CONTRIBPREVPARTP ( ' +
                '  IDPESSJUR,        IDPESSOA,     IDPLANOPREV, IDCONTRIBUICAO, SEQPROPOSTA,       ' +
                '  FLGRETROATIVO,    FLGCOBRA,     DATAINICIO,  DATAFINAL,      IDTPPERIODICIDADE, ' +
                '  IDPLANPREVCONTAB, FLGDESCFOLHA,  CODPORTFORMA, VALORBASE1 ) '                                    +
                'VALUES ( '+

                CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString       + ',' +
                CdsDadosIndividuo.FieldByName('IDPESSOA').AsString        + ',' +

                IntToStr( iIdNovoPlano )                                  + ',' +          { IDPLANOPREV       }

                CdsSaldamento.FieldByName('IDCONTRIBUICAO').AsString      + ',' +
                CdsDadosIndividuo.FieldByName('SEQPROPOSTA').AsString     + ',' +

                '0 ,'+                                                                     { FLGRETROATIVO     }

                sFlgCobra                                                 + ',' +          { FLGCOBRA          }

                'TO_DATE('''+ sDataInicio +''',''DD/MM/YYYY''), '+                         { DATAINICIO        }
                'NULL, '+                                                                  { DATAFINAL         }
                '1 ,'+                                                                     { IDTPPERIODICIDADE }

                IntToStr( iIdPlanoContabilLocal )                         + ',' +          { IDPLANPREVCONTAB  }

                sFlgDescFolha                                             + ',' +          { FLGDESCFOLHA      }

                QuotedStr( sCodPortForma )                                + ',' +          { CODPORTFORMA      }

                OraNumero( FloatToStr( dPercentualLocal )  ) +  ') ';                      { VALORBASE1        }

      End Else Begin

      End; { If ( CdsSaldamentoAux.IsEmpty = True ) }

      If Not ExecSQL( sSQL ) Then Abort;

      CdsSaldamento.Next;

    End; { While Not CdsSaldamento.Eof Do Begin }

    {--------------------------------------------------------------------------}
    { Incluir histórico de contribuições associadas no evento                  }
    sSQL := 'INSERT INTO HSTCONTEVENTOSPR '+
            '  (IDEVENTOSPREV, IDASSOCIACAO, IDEVENTOGERADORF, IDPLANOPREVF, IDCONTRIBUICAOF, '+
            '   TIPO,          FLGASSOCIADA, DATAINICIO,       DATAFINAL )  '+

            'SELECT '+
            '  EP.IDEVENTOSPREV, ROWNUM+10, 339,'+
            '  CP.IDPLANOPREV,    CP.IDCONTRIBUICAO, ''F'',1, '+
            '  CP.DATAINICIO,     CP.DATAFINAL '+
            'FROM   '+
            '  EVENTOSPREV EP, CONTPREVEVENTO CE, CONTRIBPREVPARTP CP '+
            ' WHERE ';

    If ( FTipoArquivo = taAposentado )
    Then sSQL := sSQL + '  ( EP.IDEVENTOGERADOR = 339 ) ' + '   AND ';

    sSQL := sSQL +
            '  ( EP.IDPESSOA        = '+ CdsDadosIndividuo.FieldByName('IDPESSOA').AsString + ' ) AND '+
            '  ( EP.IDPLANOPREV     = '+ IntToStr( iIdNovoPlano ) +' ) AND '+

            '  ( EP.IDPLANOPREV     = CE.IDPLANOPREV )     AND '+
            '  ( EP.IDEVENTOGERADOR = CE.IDEVENTOGERADOR ) AND '+
            '  ( EP.IDPESSJUR       = CP.IDPESSJUR )       AND '+
            '  ( EP.IDPLANOPREV     = CP.IDPLANOPREV )     AND '+
            '  ( EP.IDPESSOA        = CP.IDPESSOA )        AND '+
            '  ( EP.SEQPROPOSTA     = CP.SEQPROPOSTA )     AND '+
            '  ( CE.IDCONTRIBUICAO  = CP.IDCONTRIBUICAO )      ';

    If Not ExecSQL( sSQL ) Then Result := False;


    {--------------------------------------------------------------------------}
    { Suspender as contribuições do REPLAN                                     }
    sSQL := 'UPDATE  CONTRIBPREVPARTP SET FLGCOBRA         = 0, '+
            '                         DATAFINAL = TO_DATE('''+ DateToStr( StrToDate( sDataEvento ) -1  )+''',''DD/MM/YYYY'') '+
            'WHERE   IDPESSJUR   = '+ CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString   +
            '  AND   IDPLANOPREV = '+ CdsDadosIndividuo.FieldByName('IDPLANOPREV').AsString +
            '  AND   IDPESSOA    = '+ CdsDadosIndividuo.FieldByName('IDPESSOA').AsString    +
            '  AND   SEQPROPOSTA = '+ CdsDadosIndividuo.FieldByName('SEQPROPOSTA').AsString +
            '  AND   FLGCOBRA    = 1 '+
            { Augusto 05/03/2008 - Ajuste para não atualizar contribuição incluida no saldamento }
            '  AND   IDCONTRIBUICAO NOT IN ( SELECT DISTINCT IDCONTRIBUICAO '+
            '                                FROM CONTPREVEVENTO '+
            '                                WHERE IDEVENTOGERADOR = ' + IntToStr( iIdEventoDeSaldamento ) + ' AND ROWNUM = 1 ) ';


    If Not ExecSQL( sSQL ) Then Abort;

    Result := True;

  Except

    sMensagemDeErro := MessageInfo;

    Result := False;
    Exit;

  End;

  Result := True;

End; { TSaldamentoAssociado.ProcessarContribuicoes }

{------------------------------------------------------------------------------}
{ Executa alterações nas tabelas de reserva (RESERVAPART)                      }
Function TSaldamentoAssociado.ProcessarReservas: Boolean;
Var
  sSQL : String;
Begin

  Result := False;

  Try

    {--------------------------------------------------------------------------}
    { Evento de saldamento                                                     }
    sSQL :=  'INSERT INTO RESERVAPART RES ( '+
             '  RES.IDTIPORESERVA,    RES.IDPLANOPREV,       RES.IDPESSOA,         RES.IDPESSJUR,           '+
             '  RES.DATAREFERENCIASA, RES.SEQPROPOSTA,       RES.CODDOCUMENTOPREV, RES.VALORRESERVA,        '+
             '  RES.PLNCODIGOPREV,    RES.PERCENTUALSAQUE,   RES.CODPORTFORMA,     RES.CODCENTRORESPON,     '+
             '  RES.IDEMPRESAPROP,    RES.CODSUBCONTA,       RES.UNIDNEGOC,        RES.CODCENTROCUSTOD,     '+
             '  RES.IDEMPRESA,        RES.CODCENTROCUSTOC,   RES.PLACONTAD,        RES.PLANO,               '+
             '  RES.PLACONTAC,        RES.PLNCODIGOEFET,     RES.CODDOCUMENTOEFET, RES.FLGATIVO,            '+
             '  RES.DATADESATIV,      RES.FLGINCONSISTENCIA, RES.DATAULTALIM,      RES.DATAULTATUALIZA,     '+
             '  RES.IDPARTICIPANTE  )                          '+
             'SELECT                                                                                        '+
             '  RXP.IDTIPORESERVA,    RXP.IDPLANOPREV,       '+
             CdsDadosIndividuo.FieldByName('IDPESSOA').AsString         + ',' +
             CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString        + ',' +
             '  NULL, '+                                                        { DATAREFERENCIASA  }
             CdsDadosIndividuo.FieldByName('SEQPROPOSTA').AsString      + ',' +

             '  NULL, '+                                                        { CODDOCUMENTOPREV  }
             '  0,    '+                                                        { DATAREFERENCIASA  }
             '  NULL, '+                                                        { PLNCODIGOPREV     }
             '  NULL, '+                                                        { PERCENTUALSAQUE   }
             '  NULL, '+                                                        { CODPORTFORMA      }
             '  NULL, '+                                                        { CODCENTRORESPON   }
             '  NULL, '+                                                        { IDEMPRESAPROP     }
             '  NULL, '+                                                        { CODSUBCONTA       }
             '  NULL, '+                                                        { UNIDNEGOC         }
             '  NULL, '+                                                        { CODCENTROCUSTOD   }
             '  NULL, '+                                                        { IDEMPRESA         }
             '  NULL, '+                                                        { CODCENTROCUSTOC   }
             '  NULL, '+                                                        { PLACONTAD         }
             '  NULL, '+                                                        { PLANO             }
             '  NULL, '+                                                        { PLACONTAC         }
             '  NULL, '+                                                        { PLNCODIGOEFET     }
             '  NULL, '+                                                        { CODDOCUMENTOEFET  }
             '  1, '+                                                           { FLGATIVO          }
             '  NULL, '+                                                        { DATADESATIV       }
             '  NULL, '+                                                        { FLGINCONSISTENCIA }
             '  NULL, '+                                                        { DATAULTALIM       }
             '  NULL, '+                                                        { DATAULTATUALIZA   }
             CdsDadosIndividuo.FieldByName('IDTITULAR').AsString +              { IDPARTICIPANTE    }
             '  FROM                '+   //Renato Visoni 117336_552687
             '  RESERVAXPLANO  RXP  '+
             'WHERE               '+
             '  RXP.IDPLANOPREV     = ' + IntToStr( iIdNovoPlano )  + '     '+ 
             '  AND RXP.IDTIPORESERVA IN (100,101,110,111) ' ;

    If Not ExecSQL( sSQL ) Then Abort;

  Except

    sMensagemDeErro := MessageInfo;

    Result := False;
    Exit;

  End;

  Result := True;

End; { TSaldamentoAssociado.ProcessarReservas }

{------------------------------------------------------------------------------}
{ Terminar processo de saldamento principal                                    }
Function TSaldamentoAssociado.Terminar: Boolean;
Begin


  If dtmBaseDados.dbBaseDados.InTransaction Then dtmBaseDados.dbBaseDados.Rollback;


  If ( FTipoProcesso = TpIndividual ) Then Begin

  If ( FGravaDemonstrativo = True ) Then Begin
  Flush( ArquivoDemonstrativo );
  CloseFile( ArquivoDemonstrativo );
  End;

  End Else Begin

  Flush( ArquivoResultado );
  CloseFile( ArquivoResultado );

    If ( FGravaDemonstrativo = True ) Then Begin

      Flush( FArquivoDeMatriculas );
      CloseFile( FArquivoDeMatriculas );

    End;

  End;

  If ( FTipoProcesso = TpIndividual ) And ( FGravaDemonstrativo = True ) Then Begin

    WinExec( PChar( 'NOTEPAD.EXE '+sNomeArquivoDemonstrativo ) , SW_SHOW );

  End;


End;

{------------------------------------------------------------------------------}
{ Grava mensagem no arquivo de demonstrativo                                   }
Procedure TSaldamentoAssociado.GravaNoDemonstrativo(psMensagem: String);
Begin

  If ( FGravaDemonstrativo = True )
  Then WriteLn( ArquivoDemonstrativo, psMensagem );

End;

{------------------------------------------------------------------------------}
{ Montar os dados que vão ser exibidos no demonstrativo                        }
Procedure TSaldamentoAssociado.MontarDemonstrativo;
Var
  sSQL, sTipoParticipante, sAnoMesRef, sListaIdPessoa : String;
  iIdPlanoPrev, iFlgReferencia, iNumeroProcesso, iIdPessoa : Integer;
  dTotalAcertoB, dTotalAcertoC : Double;
Begin

  If ( FGravaDemonstrativo = False ) Then Begin

     Exit;

  End;

  If ( FErroProcesso = True ) Then Begin

    GravaNoDemonstrativo( '  ');
    GravaNoDemonstrativo( '===============================================================================================================');
    GravaNoDemonstrativo( '  ');

    If Pos( 'matricula não encontrada.', sMensagemDeErro ) > 0 Then Exit;
    If Pos( 'Não possui beneficio ativo.', sMensagemDeErro ) > 0 Then Exit;

    Exit;

  End;

  { DADOS CADASTRAIS }
  sSQL := 'SELECT '+
          '  ELG.IDPESSOA,        ELG.IDPESSJUR,                      '+
          '  ELG.MATRICULA,       ELG.DATAADMISSAO,  ELG.IDSITFUNC,   '+

          '  PEST.NOME,       '+

          '  PPP.IDPLANOPREV,     PPP.DATACANCELAMENTO,  FLGDESATIVADO,      '+
          '  PPP.INSCRICAODATA,   PPP.DTINICIOINSC,      PPP.SEQPROPOSTA,    '+
          '  PPP.INSCRICAONUMERO, PPP.IDSITPART,         PPP.IDSITPLANOPREV, '+

          '  STP.DESCRICAO AS DESCSITPART, '+
          '  STF.DESCRICAO AS DESCSITFUNC, '+
          '  SPN.DESCRICAO AS DESCSITPLANOPREV, '+
          '  PPV.NOME AS NOMEPLANO, '+

          '  0 AS VALORBS '+
          'FROM   '+
          '  DEPENTIT DPT, '+
          '  PESSOA PEST,   PESSOAFISICA PEFT, PLANPREV PPV, SITPLANOPREV SPN, '+
          '  ELEGPATRO ELG, PARTPREVPLAN PPP,  SITPART  STP, SITFUNC STF       '+
          'WHERE  '+
          '  ( DPT.MATRICULA      = '+ QuotedStr( FMatriculaIndividuo )  +' ) AND '+
          '  ( ELG.IDPESSJUR      = 91008)             AND '+
          '  ( DPT.IDTITULAR      = ELG.IDPESSOA )     AND '+
          '  ( DPT.IDTITULAR      = PEST.IDPESSOA )    AND '+
          '  ( DPT.IDPESSOA       = PEFT.IDPESSOA )    AND '+

          '  ( ELG.IDPESSJUR      = PPP.IDPESSJUR )    AND '+
          '  ( ELG.IDPESSOA       = PPP.IDPESSOA  )    AND '+

          '  ( ELG.IDSITFUNC      = STF.IDSITFUNC  )   AND '+
          '  ( PPP.IDSITPART      = STP.IDSITPART  )   AND '+
          '  ( PPP.IDSITPLANOPREV = SPN.IDSITPLANOPREV  )   AND '+

          '  ( PPP.IDPLANOPREV    = PPV.IDPLANOPREV )      ';

  CdsSaldamentoAux.Data := GetDataPacket( sSQL );
  iIdPessoa := CdsSaldamentoAux.FieldByName('IDPESSOA').AsInteger;

  GravaNoDemonstrativo( '-- DADOS FUNCIONAIS DO PARTICIPANTE (ELEGPATRO) -------------------------------------------------' );
  GravaNoDemonstrativo( 'TIPO         MATRICULA  NOME                                   IDSITFUNC                          ' );
  GravaNoDemonstrativo( '-----------  ---------  -------------------------------------  -----------------------------------' );

  sTipoParticipante := RetornaTipoParticipanteString;
  GravaNoDemonstrativo( PreparaStr( sTipoParticipante, 11 )                     + '  ' +
                        PreparaStr( CdsSaldamentoAux.FieldByName('MATRICULA').AsString, 10 )+ ' ' +
                        PreparaStr( CdsSaldamentoAux.FieldByName('NOME').AsString, 36 )     + '   ' +
                        PreparaStr( CdsSaldamentoAux.FieldByName('IDSITFUNC').AsString +' - '+
                                    CdsSaldamentoAux.FieldByName('DESCSITFUNC').AsString, 30 ) );

  GravaNoDemonstrativo( '  ' ); GravaNoDemonstrativo( '  ' );
  GravaNoDemonstrativo( '-- DADOS PREVIDENCIÁRIOS DO PARTICIPANTE (PARTPREVPLAN) ---------------------------------------------------------------------------' );
  GravaNoDemonstrativo( 'PLANO                                DTINSCRICAO  DTCANCELAM  FLGDES  SITPART                            SITPLANO                                   ');
  GravaNoDemonstrativo( '-----------------------------------  -----------  ----------  ------  ---------------------------------  --------------------------' );
  While Not CdsSaldamentoAux.Eof Do Begin

    GravaNoDemonstrativo( AlinhaDireita( CdsSaldamentoAux.FieldByName('IDPLANOPREV').AsString, 2 )    + ' - ' +
                          PreparaStr(CdsSaldamentoAux.FieldByName('NOMEPLANO').AsString, 30 )         + '  ' +
                          PreparaStr( CdsSaldamentoAux.FieldByName('INSCRICAODATA').AsString, 10 )    + '   ' +
                          PreparaStr( CdsSaldamentoAux.FieldByName('DATACANCELAMENTO').AsString, 10 ) + '   ' +
                          AlinhaDireita( CdsSaldamentoAux.FieldByName('FLGDESATIVADO').AsString, 05 ) + ' ' +
                          AlinhaDireita( CdsSaldamentoAux.FieldByName('IDSITPART').AsString, 2 )      + ' - ' +
                          PreparaStr( CdsSaldamentoAux.FieldByName('DESCSITPART').AsString, 28 )      + '   ' +
                          AlinhaDireita( CdsSaldamentoAux.FieldByName('IDSITPLANOPREV').AsString, 2 ) + ' - ' +
                          PreparaStr( CdsSaldamentoAux.FieldByName('DESCSITPLANOPREV').AsString, 28 ) );
    CdsSaldamentoAux.Next;

  End; { While Not CdsSaldamentoAux.Eof Do Begin }

  { EVENTOS }
   sSQL := 'SELECT   '+
          '  *  '+
          'FROM     '+
          '  EVENTOSPREV EVP, EVENTOGERADOR EVG  '+
          'WHERE    '+
          '  ( EVP.IDPESSOA = '+ IntToStr( iIdPessoa ) +' ) AND '+
          '  ( EVP.IDEVENTOGERADOR = EVG.IDEVENTOGERADOR )'+
          'ORDER BY '+
          '  EVP.DATAEVENTO ';

  CdsSaldamentoAux.Data := GetDataPacket( sSQL );

  GravaNoDemonstrativo( '  ' ); GravaNoDemonstrativo( '  ' );
  GravaNoDemonstrativo( '-- HISTÓRICO DE EVENTOS REGISTRADOS (EVENTOSPREV) E CONTRIBUIÇÕES ASSOCIADAS --------------------------------------------------------  ' );
  GravaNoDemonstrativo( 'PLANO  EVENTO                                DTEFETIVAD  DTREGISTRO  DATAEVENTO  STPAATU  STPLATU  STFUATU  STPANOV  STPLNOV  STFUNOV  ' );
  GravaNoDemonstrativo( '-----  ------------------------------------  ----------  ----------  ----------  -------  -------  -------  -------  -------  -------  ' );
  While Not CdsSaldamentoAux.Eof Do Begin

    GravaNoDemonstrativo( AlinhaDireita( CdsSaldamentoAux.FieldByName('IDPLANOPREV').AsString, 5 )        + '  ' +
                          AlinhaDireita( CdsSaldamentoAux.FieldByName('IDEVENTOGERADOR').AsString, 3 )    + ' - ' +
                          PreparaStr( CdsSaldamentoAux.FieldByName('NOME').AsString, 30 )                 + '  ' +

                          PreparaStr( CdsSaldamentoAux.FieldByName('DATAEFETIVADO').AsString, 10 )        + '  ' +
                          PreparaStr( CdsSaldamentoAux.FieldByName('DATAREGISTRO').AsString, 10 )         + '  ' +
                          PreparaStr( CdsSaldamentoAux.FieldByName('DATAEVENTO').AsString, 10 )           + '  ' +

                          AlinhaDireita( CdsSaldamentoAux.FieldByName('IDSITPARTATUAL').AsString, 07 )    + '  ' +
                          AlinhaDireita( CdsSaldamentoAux.FieldByName('IDSITPLANOATUAL').AsString, 07 )   + '  ' +
                          AlinhaDireita( CdsSaldamentoAux.FieldByName('IDSITFUNCATUAL').AsString, 07 )    + '  ' +
                          AlinhaDireita( CdsSaldamentoAux.FieldByName('IDSITPARTNOVO').AsString, 07 )     + '  ' +
                          AlinhaDireita( CdsSaldamentoAux.FieldByName('IDSITPLANONOVO').AsString, 07 )    + '  ' +
                          AlinhaDireita( CdsSaldamentoAux.FieldByName('IDSITFUNCNOVO').AsString, 07 )
                          );

    { HSTCONTEVENTOSPR }
    sSQL := 'SELECT '+
            '  H.IDCONTRIBUICAOF, C.NOME, DECODE( H.FLGASSOCIADA, 0, ''0 - DESASSOCIADA'', ''1 - ASSOCIADA'') AS FLGASSOCIADA '+
            'FROM  '+
            '  HSTCONTEVENTOSPR H, CONTRIBUICAO C '+
            'WHERE '+
            '  ( H.IDEVENTOSPREV = '+ CdsSaldamentoAux.FieldByName('IDEVENTOSPREV').AsString +' ) AND '+
            '  ( H.IDCONTRIBUICAOF = C.IDCONTRIBUICAO ) '+
            'ORDER BY '+
            '  C.NOME ';

    CdsSaldamento.Data := GetDataPacket( sSQL );
    While Not CdsSaldamento.Eof Do Begin

      GravaNoDemonstrativo( '                '+
                            PreparaStr(CdsSaldamento.FieldByName('IDCONTRIBUICAOF').AsString, 3 )+ ' - ' +
                            PreparaStr(CdsSaldamento.FieldByName('NOME').AsString, 35 )+ '  ' +
                            PreparaStr(CdsSaldamento.FieldByName('FLGASSOCIADA').AsString, 17 )
                            );

      CdsSaldamento.Next;
    End;
    CdsSaldamentoAux.Next;

  End; { While Not CdsSaldamentoAux.Eof Do Begin }

  { CONTRIBUICOES }

  If FTipoArquivo = taPensionista Then Begin

    sSQL := 'SELECT DISTINCT  '+
            '  BFT.IDPLANOPREV,  CPN.IDCONTRIBUICAO, 1 AS VALORBASE1, CPN.DATAINICIO, CPN.DATAFINAL, CPN.FLGCOBRA,  '+
            '  CPN.CODPORTFORMA, CPN.IDPLANPREVCONTAB, CON.NOME '+
            'FROM     '+
            '  BFCIARIOTITPLAN BFT, CONTRIBPREVNUCLEO  CPN, CONTRIBUICAO CON  '+
            'WHERE    '+
            '  ( BFT.IDRESPONSAVEL  = '+ IntToStr( iIdResponsavelProcessando ) +' ) AND '+
            '  ( BFT.IDPLANOPREV    = '+ CdsDadosGrupoFamiliar.FieldByName('IDPLANOPREV').AsString +' ) AND '+

            '  ( BFT.IDNUCLEOFAMILIAR = CPN.IDNUCLEOFAMILIAR ) AND  '+
            '  ( CPN.IDCONTRIBUICAO = CON.IDCONTRIBUICAO )'+
            'ORDER BY '+
            '  CPN.IDCONTRIBUICAO ';
  End Else Begin

    sSQL := 'SELECT   '+
            '  CPP.IDPLANOPREV, CPP.IDCONTRIBUICAO, CPP.VALORBASE1, CPP.DATAINICIO, CPP.DATAFINAL, CPP.FLGCOBRA,  '+
            '  CON.NOME,        CPP.CODPORTFORMA,   CPP.IDPLANPREVCONTAB '+
            'FROM     '+
            '  CONTRIBPREVPARTP CPP, CONTRIBUICAO CON  '+
            'WHERE    '+
            '  ( CPP.IDPESSOA = '+ IntToStr( iIdPessoa ) +' ) AND '+
            '  ( CPP.IDCONTRIBUICAO = CON.IDCONTRIBUICAO )'+
            'ORDER BY '+
            '  CPP.IDPLANOPREV, CPP.IDCONTRIBUICAO ';

  End;

  CdsSaldamentoAux.Data := GetDataPacket( sSQL );

  GravaNoDemonstrativo( '  ' ); GravaNoDemonstrativo( '  ' );
  GravaNoDemonstrativo( '-- DADOS DAS CONTRIBUIÇÕES (CONTRIBPREVPARTP) ------------------------------------------------------------------------' );
  GravaNoDemonstrativo( 'PLANO  CONTRIBUIACO                                       PERC%   DATAINICIO  DATAFINAL   CODPORTF  FLGCOBRA  CONTABIL' );
  GravaNoDemonstrativo( '-----  -------------------------------------------------  ------  ----------  ----------  --------  --------  --------' );
  While Not CdsSaldamentoAux.Eof Do Begin

      GravaNoDemonstrativo( AlinhaDireita( CdsSaldamentoAux.FieldByName('IDPLANOPREV').AsString, 05 )  + '  ' +
                            PreparaStr(CdsSaldamentoAux.FieldByName('IDCONTRIBUICAO').AsString, 03 )   + ' - ' +
                                       PreparaStr(CdsSaldamentoAux.FieldByName('NOME').AsString, 42 )  + '   ' +
                            PreparaStr( CdsSaldamentoAux.FieldByName('VALORBASE1').AsString,  05 )     + '   ' +
                            PreparaStr( CdsSaldamentoAux.FieldByName('DATAINICIO').AsString, 10 )      + '  ' +
                            PreparaStr( CdsSaldamentoAux.FieldByName('DATAFINAL').AsString, 10 )       + '  ' +
                            AlinhaDireita( CdsSaldamentoAux.FieldByName('CODPORTFORMA').AsString, 08 ) + '  ' +
                            AlinhaDireita( CdsSaldamentoAux.FieldByName('FLGCOBRA').AsString, 08 )     + '  ' +
                            AlinhaDireita( CdsSaldamentoAux.FieldByName('IDPLANPREVCONTAB').AsString, 08 )
                            );

    CdsSaldamentoAux.Next;

  End; { While Not CdsSaldamentoAux.Eof Do Begin }

  { ATIVOS }
  If FTipoArquivo = taAtivo Then Begin

    { RESERVAS }
    sSQL := 'SELECT   '+
            '  *  '+
            'FROM     '+
            '  RESERVAPART RP, RESERVAXPLANO RX '+
            'WHERE    '+
            '  ( RP.IDPESSOA = '+ IntToStr( iIdPessoa ) +' ) AND '+
            '  ( RP.IDTIPORESERVA = RX.IDTIPORESERVA )'+
            'ORDER BY '+
            '  RP.IDPLANOPREV, RX.NOME ';

    CdsSaldamentoAux.Data := GetDataPacket( sSQL );

    GravaNoDemonstrativo( '  ' ); GravaNoDemonstrativo( '  ' );
    GravaNoDemonstrativo( '-- DADOS DAS RESERVAS (RESREVAPART) -----------------------------------------------' );
    GravaNoDemonstrativo( 'PLANO  RESERVA                                            FLGATIVO     VALORRESERVA' );
    GravaNoDemonstrativo( '-----  -------------------------------------------------  --------  ---------------' );
    While Not CdsSaldamentoAux.Eof Do Begin

      GravaNoDemonstrativo( AlinhaDireita( CdsSaldamentoAux.FieldByName('IDPLANOPREV').AsString, 05 )     + '  ' +
                            PreparaStr(CdsSaldamentoAux.FieldByName('IDTIPORESERVA').AsString, 3 )       + ' - ' +
                                          PreparaStr(CdsSaldamentoAux.FieldByName('NOME').AsString, 48 ) + '  ' +
                            AlinhaDireita( CdsSaldamentoAux.FieldByName('FLGATIVO').AsString, 03 )          + '  '+
                            AlinhaDireita( FloatToStrF( CdsSaldamentoAux.FieldByName('VALORRESERVA').AsFloat, ffNumber, 15,2 ) , 15)
                            );

      CdsSaldamentoAux.Next;

    End; { While Not CdsSaldamentoAux.Eof Do Begin }

    { EMPRESTIMOS }
    sSQL := 'SELECT   '+
            '  IDPLANOPREV, IDCONTRATOEMPTMO, FLGSITUACAO  '+
            'FROM     '+
            '  CONTRATOEMPTMO '+
            'WHERE    '+
            '  ( IDBENEF = '+ IntToStr( iIdPessoa ) +' ) '+
            'ORDER BY '+
            '  IDPLANOPREV, IDCONTRATOEMPTMO ';

    CdsSaldamentoAux.Data := GetDataPacket( sSQL );

    GravaNoDemonstrativo( '  ' ); GravaNoDemonstrativo( '  ' );
    GravaNoDemonstrativo( '-- EMPRESTIMOS (CONTRATOEMPTMO) --------' );
    GravaNoDemonstrativo( 'PLANO  CONTRATO                 SITUACAO' );
    GravaNoDemonstrativo( '-----  ------------------------ --------' );
    While Not CdsSaldamentoAux.Eof Do Begin

      GravaNoDemonstrativo( AlinhaDireita( CdsSaldamentoAux.FieldByName('IDPLANOPREV').AsString,  05 )    + '  ' +
                            PreparaStr(CdsSaldamentoAux.FieldByName('IDCONTRATOEMPTMO').AsString, 28 )    + '  ' +
                            AlinhaDireita( CdsSaldamentoAux.FieldByName('FLGSITUACAO').AsString,  03 )
                            );

      CdsSaldamentoAux.Next;

    End; { While Not CdsSaldamentoAux.Eof Do Begin }

  { ASSISTIDOS }
  End Else Begin

    sAnoMesRef := '2001/09';

    { BENEFICIOS }
    sSQL := 'SELECT '+
            '  BFT.IDRESPONSAVEL, BFT.PERCENTUAL,     BFB.ULTMESPREPARO, '+

            '  BFB.IDPESSOA,      BFB.DATAFINAL,      BFB.IDSITBENEFICIO, '+
            '  BFB.DATAINICIO,    BFB.DATAINICIOFUND, BFB.VALORATUAL,     '+
            '  BFB.IDPLANOPREV,   BFB.IDBENEFICIO,    BFB.FONTEPAGADORA,  '+
            '  B.NOME,            BFB.IDPLANPREVCONTAB,  '+
            '  P.NUMEROPROCESSO, P.IDSITPROCESSO, '+
            '  PESSOA.NOME AS NOMEPESSOA, '+

            '  DPT.MATRICULA, '+

            '  NVL( BFP.VALORBASE1,  BFB.VALORBASE1 ) AS VALORBASE1, '+
            '  NVL( BFP.VALORBASE2,  BFB.VALORBASE2 ) AS VALORBASE2, '+
            '  NVL( BFP.VALORBASE3,  BFB.VALORBASE3 ) AS VALORBASE3  '+
            'FROM   '+
            '  BFCIARIOTITPLAN BFT, BENEFBFCIARIO BFB, BENEFPLANOPART BFP, BENEFICIO B, PROCESSOBENEF P, PESSOA, '+
            '  DEPENTIT DPT '+
            'WHERE  '+
            '      ( BFT.IDPESSJUR      = '+ CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString   +' ) '+
            '  AND ( BFT.IDTITULAR      = '+ CdsDadosIndividuo.FieldByName('IDTITULAR').AsString   +' ) '+
            '  AND ( BFT.IDRESPONSAVEL  = '+ CdsDadosIndividuo.FieldByName('IDPESSOA').AsString    +' ) '+
            '  AND ( BFT.SEQPROPOSTA    = '+ CdsDadosIndividuo.FieldByName('SEQPROPOSTA').AsString +' ) '+
            '  AND ( BFT.IDBENEFICIO    = B.IDBENEFICIO  )     '+

            '  AND ( BFT.IDPESSJUR      = BFB.IDPESSJUR )      '+
            '  AND ( BFT.IDPLANOPREV    = BFB.IDPLANOPREV )    '+
            '  AND ( BFT.IDPLANOORIGEM  = BFB.IDPLANOORIGEM )  '+
            '  AND ( BFT.IDTITULAR      = BFB.IDTITULAR )      '+
            '  AND ( BFT.IDPESSOA       = BFB.IDPESSOA )       '+

            '  AND ( BFT.IDTITULAR      = DPT.IDTITULAR )      '+
            '  AND ( BFT.IDPESSOA       = DPT.IDPESSOA )       '+

            '  AND ( BFT.IDPESSOA       = PESSOA.IDPESSOA )    '+
            '  AND ( BFT.IDBENEFICIO    = BFB.IDBENEFICIO )    '+
            '  AND ( BFT.SEQPROPOSTA    = BFB.SEQPROPOSTA )    '+
            '  AND ( BFB.NUMEROPROCESSO = P.NUMEROPROCESSO )   '+

            '  AND ( BFB.IDPESSJUR      = BFP.IDPESSJUR(+) )   '+
            '  AND ( BFB.IDPLANOPREV    = BFP.IDPLANOPREV(+) ) '+
            '  AND ( BFB.IDPESSOA       = BFP.IDPESSOA(+) )    '+
            '  AND ( BFB.SEQPROPOSTA    = BFP.SEQPROPOSTA(+) ) '+
            '  AND ( BFB.IDBENEFICIO    = BFP.IDBENEFICIO(+) ) '+

            'ORDER BY '+
            '  BFB.IDPESSOA, BFB.IDPLANOPREV DESC, BFB.FONTEPAGADORA DESC, P.NUMEROPROCESSO, BFB.IDBENEFICIO  ';

    CdsSaldamento.Data := GetDataPacket( sSQL );

    GravaNoDemonstrativo( '  ' ); GravaNoDemonstrativo( '  ' );
    GravaNoDemonstrativo( '-- DADOS DOS BENEFICIOS (BENEFBFCIARIO) ---------------------------------------------------------------------------------------------------------- ' );

    GravaNoDemonstrativo( 'PL  NPROCESSO  SP  BENEFICIO                             DIB         DIP         DATAFINAL   STBN   VALORATUAL  VLRBSE1  VLRBSE2  PERCENT  ULTMESP ' );
    GravaNoDemonstrativo( '--  ---------  --  ------------------------------------  ----------  ----------  ----------  ----  -----------  -------  -------  -------  ------- ' );

    iNumeroProcesso := -1;
    iIdPessoa       := -1;

    sListaIdPessoa  := '';

    While Not CdsSaldamento.Eof Do Begin

      If ( iIdPessoa <> CdsSaldamento.FieldByName('IDPESSOA').AsInteger ) Then Begin

        If ( sListaIdPessoa = '' )
        Then sListaIdPessoa := CdsSaldamento.FieldByName('IDPESSOA').AsString
        Else sListaIdPessoa := sListaIdPessoa + ', ' + CdsSaldamento.FieldByName('IDPESSOA').AsString;

        iIdPessoa := CdsSaldamento.FieldByName('IDPESSOA').AsInteger;

        sFiller := ' ';
        If ( FMatriculaIndividuo = CdsSaldamento.FieldByName('MATRICULA').AsString )
        Then sFiller := '  ( RESPONSÁVEL )';

        GravaNoDemonstrativo( CdsSaldamento.FieldByName('MATRICULA').AsString  + ' - ' +
                              CdsSaldamento.FieldByName('NOMEPESSOA').AsString +
                              sFiller );

      End;

      If ( iNumeroProcesso <> CdsSaldamento.FieldByName('NUMEROPROCESSO').AsInteger ) Then Begin
        iNumeroProcesso := CdsSaldamento.FieldByName('NUMEROPROCESSO').AsInteger;
      End;


      GravaNoDemonstrativo( AlinhaDireita( CdsSaldamento.FieldByName('IDPLANOPREV').AsString, 02 )          + '  ' +
                            PreparaStr( CdsSaldamento.FieldByName('NUMEROPROCESSO').AsString,  10 )         + '  ' +
                            AlinhaDireita( CdsSaldamento.FieldByName('IDSITPROCESSO').AsString, 01 )        + '  ' +
                            PreparaStr(CdsSaldamento.FieldByName('IDBENEFICIO').AsString, 3 )               + ' - ' +
                            PreparaStr(CdsSaldamento.FieldByName('NOME').AsString, 30 )+ '  ' +
                            PreparaStr( CdsSaldamento.FieldByName('DATAINICIOFUND').AsString,  10 )         + '  ' +
                            PreparaStr( CdsSaldamento.FieldByName('DATAINICIO').AsString,  10 )             + '  ' +
                            PreparaStr( CdsSaldamento.FieldByName('DATAFINAL').AsString,  10 )              + '  ' +
                            AlinhaDireita( CdsSaldamento.FieldByName('IDSITBENEFICIO').AsString, 04 )       + '  ' +
                            AlinhaDireita( FloatToStrF( CdsSaldamento.FieldByName('VALORATUAL').AsFloat, ffNumber, 10,2 ) , 11)   + '  ' +
                            AlinhaDireita( CdsSaldamento.FieldByName('VALORBASE1').AsString  , 07)          + '  ' +
                            AlinhaDireita( CdsSaldamento.FieldByName('VALORBASE2').AsString  , 07)          + '  ' +
                            AlinhaDireita( CdsSaldamento.FieldByName('PERCENTUAL').AsString  , 07)          + '  ' +
                            AlinhaDireita( CdsSaldamento.FieldByName('ULTMESPREPARO').AsString  , 07)       + '  ' +
                            AlinhaDireita( CdsSaldamento.FieldByName('IDPLANPREVCONTAB').AsString  , 07)

                          );

      CdsSaldamento.Next;

    End; { While Not CdsSaldamento.Eof Do Begin }

    { HISTORICO DE BENEFICIO  }
    sSQL := 'SELECT   '+
            '  HST.IDPLANOPREV,  HST.IDBENEFICIO, HST.MESREFERENCIA, HST.VALORPREV,  HST.FLGENVIADO, '+
            '  HST.FLGDEVOLUCAO, HST.IDMOVBENEF,  HST.VALORINTEGRAL, HST.VALORTOTAL, HST.FLGTIPOREGISTRO, '+
            '  HSTA.VALOR AS VALORCORRECAO, '+
            '  BPP.FLGREFERENCIA, '+
            '  HST.IDMOTIVO, MOT.DESCRICAO, '+
            '  PES.IDPESSOA, PES.NOME AS NOMEPESSOA '+
            'FROM     '+
            '  HSTBENEFBFCIARIO HST, BENEFICIO BEN, MOTIVO MOT, BENEFPLANPREV BPP, HSTATRASOBENEF HSTA, PESSOA PES '+
            'WHERE    ';

    If Pos( ',', sListaIdPessoa ) > 0
    Then sSQL := sSQL + '  ( HST.IDPESSOA IN ( '+ sListaIdPessoa +' ) ) AND '
    Else sSQL := sSQL + '  ( HST.IDPESSOA    = '+ sListaIdPessoa +' ) AND ';

    sSQL := sSQL + '  ( HST.IDPLANOPREV = '+ IntToStr( 2 )             +' ) AND '+
                   '  ( HST.MESREFERENCIA >= '+ QuotedStr( sAnoMesRef ) +' ) AND ';

    sSQL := sSQL + '  ( HST.IDLOTE      = '+ IntToStr( iIdLoteProcesso ) +' ) AND ';

    If FTipoArquivo = taPensionista
    Then iIdPlanoPrev := CdsDadosGrupoFamiliar.FieldByName('IDPLANOPREV').AsInteger
    Else iIdPlanoPrev := CdsDadosIndividuo.FieldByName('IDPLANOPREV').AsInteger;

    If ( iIdPlanoPrev = 66 )
    Then sSQL := sSQL + '  ( HST.IDLOTE      = '+ IntToStr( iIdLoteProcesso ) +' ) AND '
    Else Begin
      sSQL := sSQL + '  ( BPP.FLGREFERENCIA = 0 ) AND ';
    End;

    sSQL := sSQL +
            '  ( HST.IDBENEFICIO = BEN.IDBENEFICIO ) AND '+
            '  ( HST.IDMOTIVO    = MOT.IDMOTIVO ) '+

            '  AND ( HST.IDPLANOPREV    = BPP.IDPLANOPREV )   '+
            '  AND ( HST.IDBENEFICIO    = BPP.IDBENEFICIO )    '+

            '  AND ( HST.IDPESSOA       = PES.IDPESSOA    )    '+

            '  AND ( HST.IDPESSJUR      = HSTA.IDPESSJUR(+) )     '+
            '  AND ( HST.IDTITULAR      = HSTA.IDTITULAR(+) )     '+
            '  AND ( HST.IDPLANOPREV    = HSTA.IDPLANOPREV(+) )   '+
            '  AND ( HST.IDBENEFICIO    = HSTA.IDBENEFICIO(+)  )    '+
            '  AND ( HST.NUMEROPROCESSO = HSTA.NUMEROPROCESSO(+) ) '+
            '  AND ( HST.SEQBENEFICIO   = HSTA.SEQBENEFICIO(+))   '+
            '  AND ( HST.SEQPROPOSTA    = HSTA.SEQPROPOSTA(+) )   '+
            '  AND ( HST.MESREFERENCIA  = HSTA.MESREFERENCIA(+))  '+
            '  AND ( HST.IDMOTIVO       = HSTA.IDMOTIVO(+))   '+

            'ORDER BY '+
            '  HST.IDPESSOA, BPP.FLGREFERENCIA, HST.IDPLANOPREV, HST.MESREFERENCIA DESC, HST.IDBENEFICIO, HST.IDMOTIVO ';

    CdsSaldamentoAux.Data := GetDataPacket( sSQL );

    GravaNoDemonstrativo( '  ' ); GravaNoDemonstrativo( '  ' );
    GravaNoDemonstrativo( '-- ACERTOS DO BENEFICIO (HSTBENEFBFCIARIO) -------------------------------------------------------------------------------------------------' );
    GravaNoDemonstrativo( 'PLANO  BENEF  MESREF   VALORPREV      VALORINTEGRAL    VALORTOTAL    CORREÇÃO  ENVIA  DEVOL  TIPO  IDMOVIMENTO  MOTIVO ' );
    GravaNoDemonstrativo( '-----  -----  -------  -------------  -------------  ------------  ----------  -----  -----  ----  -----------  ---------------------------------' );

    dTotalAcertoB  := 0;
    iFlgReferencia := CdsSaldamentoAux.FieldByName('FLGREFERENCIA').AsInteger;

    iIdPessoa      := -1;

    While Not CdsSaldamentoAux.Eof Do Begin

      If ( iIdPessoa <> CdsSaldamentoAux.FieldByName('IDPESSOA').AsInteger ) Then Begin

        iIdPessoa := CdsSaldamentoAux.FieldByName('IDPESSOA').AsInteger;
        GravaNoDemonstrativo( CdsSaldamentoAux.FieldByName('NOMEPESSOA').AsString );

      End;

      GravaNoDemonstrativo( PreparaStr( CdsSaldamentoAux.FieldByName('IDPLANOPREV').AsString, 07 )     +
                            PreparaStr(CdsSaldamentoAux.FieldByName('IDBENEFICIO').AsString, 07 )   +
                            PreparaStr( CdsSaldamentoAux.FieldByName('MESREFERENCIA').AsString,  07 )  +
                            AlinhaDireita( FloatToStrF( CdsSaldamentoAux.FieldByName('VALORPREV').AsFloat, ffNumber, 15,2 ) , 16 )    + '  '+
                            AlinhaDireita( FloatToStrF( CdsSaldamentoAux.FieldByName('VALORINTEGRAL').AsFloat, ffNumber, 15,2 ) , 12) + '  '+
                            AlinhaDireita( FloatToStrF( CdsSaldamentoAux.FieldByName('VALORTOTAL').AsFloat, ffNumber, 15,2 ) , 12) + '  '+
                            AlinhaDireita( FloatToStrF( CdsSaldamentoAux.FieldByName('VALORCORRECAO').AsFloat, ffNumber, 10,2 ) , 10) + '  '+
                            PreparaStr(CdsSaldamentoAux.FieldByName('FLGENVIADO').AsString, 05 )                                  + '  '+
                            PreparaStr(CdsSaldamentoAux.FieldByName('FLGDEVOLUCAO').AsString, 05 )                                + '  '+
                            PreparaStr(CdsSaldamentoAux.FieldByName('FLGTIPOREGISTRO').AsString, 04 )                             + '  '+
                            PreparaStr(CdsSaldamentoAux.FieldByName('IDMOVBENEF').AsString, 11 )                                  + '  '+
                            PreparaStr( CdsSaldamentoAux.FieldByName('DESCRICAO').AsString,  30 )
                            );

      If ( CdsSaldamentoAux.FieldByName('FLGENVIADO').AsString = '0' )
      Then dTotalAcertoB := dTotalAcertoB + CdsSaldamento.FieldByName('VALORATUAL').AsFloat;

      CdsSaldamentoAux.Next;

      If ( iFlgReferencia <> CdsSaldamentoAux.FieldByName('FLGREFERENCIA').AsInteger ) Then Begin

        GravaNoDemonstrativo( ' ' );

        If ( CdsSaldamentoAux.FieldByName('FLGREFERENCIA').AsInteger = 1 )
        Then GravaNoDemonstrativo( '- INSS ------------------------------------------------------------------------------------------' );

        iFlgReferencia := CdsSaldamentoAux.FieldByName('FLGREFERENCIA').AsInteger;

      End;

    End; { While Not CdsSaldamentoAux.Eof Do Begin }

    { HISTORICO DE CONTRIBUIÇÕES }

    sSQL := 'SELECT   '+
            '  HST.IDPLANOPREV,    HST.IDCONTRIBUICAO, HST.MESREFERENCIA, HST.VALORESPERADO, '+
            '  HST.SITRECEBIMENTO, HST.FLGDEVOLUCAO,   HST.IDMOVBENEF,  '+
            '  HSTA.VALOR AS VALORCORRECAO, '+
            '  HST.IDMOTIVO, MOT.DESCRICAO, '+
            '  PES.IDPESSOA, PES.NOME AS NOMEPESSOA '+
            'FROM     '+
            '  HSTCONTRIBPREV  HST, CONTRIBUICAO CON, MOTIVO MOT, HSTATRASOCONTRIB HSTA, PESSOA PES  '+
            'WHERE    '+
            //'  ( HST.IDPESSOA      = '+ IntToStr( iIdResponsavelProcessando )  +' ) AND '+
            '  ( HST.IDPLANOPREV   = '+ IntToStr( 2 )            +' ) AND '+
            '  ( HST.MESREFERENCIA >= '+ QuotedStr( sAnoMesRef ) +' ) AND '+
            '  ( HST.IDCONTRIBUICAO IN ( 259, 633 )                 ) AND ';
            
            //Inicio - Renato Visoni Sol 89728/Kintana 379380
            if FTipoArquivo <> taPensionista then begin
              sSQL := sSQL + '  ( HST.IDPESSOA      = '+ IntToStr( iIdResponsavelProcessando )  +' ) AND ';
            end else begin
              If Pos( ',', sListaIdPessoa ) > 0
              Then sSQL := sSQL + '  ( HST.IDPESSOA IN ( '+ sListaIdPessoa +' ) ) AND '
              Else sSQL := sSQL + '  ( HST.IDPESSOA    = '+ sListaIdPessoa +' ) AND ';
            end;
            //Fim - Renato Visoni




    sSQL := sSQL + '  ( HST.IDLOTE      = '+ IntToStr( iIdLoteProcesso ) +' ) AND ';

    sSQL := sSQL +
            '  ( HST.IDPESSOA           = PES.IDPESSOA  )       AND '+
            '  ( HST.IDCONTRIBUICAO     = CON.IDCONTRIBUICAO )  AND '+
            '  ( HST.IDMOTIVO           = MOT.IDMOTIVO ) '+
            '  AND ( HST.NUMRECEBIMENTO = HSTA.NUMRECEBIMENTO(+) )     '+
            '  AND ( HST.MESREFERENCIA  = HSTA.MESREFERENCIA(+))   '+
            'ORDER BY '+
            '  HST.IDPLANOPREV, HST.MESREFERENCIA DESC, HST.IDCONTRIBUICAO, HST.IDMOTIVO';

    CdsSaldamentoAux.Data := GetDataPacket( sSQL );

    GravaNoDemonstrativo( '  ' ); GravaNoDemonstrativo( '  ' );
    GravaNoDemonstrativo( '-- ACERTOS DA CONTRIBUIÇÃO (HSTCONTRIBPREV) -----------------------------------------------------' );

    GravaNoDemonstrativo( 'PLANO  CNTRB  MESREF   VALORESPERADO  CORREÇÃO    STREC  DEVOL  IDMOVIMENTO  MOTIVO' );
    GravaNoDemonstrativo( '-----  -----  -------  -------------  ----------  -----  -----  -----------  ---------------------------------' );

    iIdPessoa      := -1;

    While Not CdsSaldamentoAux.Eof Do Begin

      If ( iIdPessoa <> CdsSaldamentoAux.FieldByName('IDPESSOA').AsInteger ) Then Begin

        iIdPessoa := CdsSaldamentoAux.FieldByName('IDPESSOA').AsInteger;
        GravaNoDemonstrativo( CdsSaldamentoAux.FieldByName('NOMEPESSOA').AsString );

      End;

      GravaNoDemonstrativo( PreparaStr( CdsSaldamentoAux.FieldByName('IDPLANOPREV').AsString, 07 )     +
                            PreparaStr(CdsSaldamentoAux.FieldByName('IDCONTRIBUICAO').AsString, 07 )   +
                            PreparaStr( CdsSaldamentoAux.FieldByName('MESREFERENCIA').AsString,  07 )  +
                            AlinhaDireita( FloatToStrF( CdsSaldamentoAux.FieldByName('VALORESPERADO').AsFloat, ffNumber, 15,2 ) , 15) + '  '+
                            AlinhaDireita( FloatToStrF( CdsSaldamentoAux.FieldByName('VALORCORRECAO').AsFloat, ffNumber, 10,2 ) , 10) + '  '+
                            PreparaStr(CdsSaldamentoAux.FieldByName('SITRECEBIMENTO').AsString, 05 )                                  + '  '+
                            PreparaStr(CdsSaldamentoAux.FieldByName('FLGDEVOLUCAO').AsString, 05 )                                    + '  '+
                            PreparaStr(CdsSaldamentoAux.FieldByName('IDMOVBENEF').AsString, 11 )                                  + '  '+
                            PreparaStr( CdsSaldamentoAux.FieldByName('DESCRICAO').AsString,  30 ) );

      CdsSaldamentoAux.Next;
    End; { While Not CdsSaldamentoAux.Eof Do Begin }

    { RUBRICAS INDIVIDUAIS }
    sSQL := 'SELECT   '+
            '  RUB.IDRUBRICA, RUB.VALORRUBRICA, RUB.PARCELAS, RUB.IDREGRACALCULO, '+
            '  PRO.DESCRICAO, RUB.TRGDTINCLUSAO, RUB.DATAFINAL, '+
            '  PES.IDPESSOA, PES.NOME AS NOMEPESSOA '+
            'FROM     '+
            '  RUBRICAINDIV RUB, PROVDESC PRO, PESSOA PES '+
            'WHERE    '+
            '  ( RUB.IDPESSOA = PES.IDPESSOA ) AND ';

    If Pos( ',', sListaIdPessoa ) > 0
    Then sSQL := sSQL + '  ( RUB.IDPESSOA IN ( '+ sListaIdPessoa +' ) ) AND '
    Else sSQL := sSQL + '  ( RUB.IDPESSOA    = '+ sListaIdPessoa +' ) AND ';

    sSQL := sSQL + '  ( RUB.IDRUBRICA     = PRO.IDPROVENTO ) AND '+
                   '  ( RUB.IDRUBRICA IN ( 38805,38599,38645,38779,38788,38797 ) ) '+
                   'ORDER BY '+
                   '  RUB.IDPESSOA, RUB.IDRUBRICA';

    CdsSaldamentoAux.Data := GetDataPacket( sSQL );

    GravaNoDemonstrativo( '  ' ); GravaNoDemonstrativo( '  ' );
    GravaNoDemonstrativo( '-- RUBRICAS INDIVIDUAIS (RUBRICAINDIV) --------------------------------------------------------' );

    GravaNoDemonstrativo( 'IDRUBRICA  DESCRIÇÃO                                    VALOR   PARCELAS      REGRA   DATAFINAL' );
    GravaNoDemonstrativo( '---------  -----------------------------------  -------------  ---------  ---------  ----------' );

    iIdPessoa      := -1;

    While Not CdsSaldamentoAux.Eof Do Begin

      If ( iIdPessoa <> CdsSaldamentoAux.FieldByName('IDPESSOA').AsInteger ) Then Begin

        iIdPessoa := CdsSaldamentoAux.FieldByName('IDPESSOA').AsInteger;
        GravaNoDemonstrativo( CdsSaldamentoAux.FieldByName('NOMEPESSOA').AsString );

      End;

      GravaNoDemonstrativo( PreparaStr( CdsSaldamentoAux.FieldByName('IDRUBRICA').AsString, 11 )     +
                            PreparaStr( CdsSaldamentoAux.FieldByName('DESCRICAO').AsString, 35 )     +
                            AlinhaDireita( FloatToStrF( CdsSaldamentoAux.FieldByName('VALORRUBRICA').AsFloat, ffNumber, 15,2 ) , 15) +
                            AlinhaDireita( CdsSaldamentoAux.FieldByName('PARCELAS').AsString , 11) +
                            AlinhaDireita( CdsSaldamentoAux.FieldByName('IDREGRACALCULO').AsString , 11)+ '  ' +
                            AlinhaDireita( CdsSaldamentoAux.FieldByName('DATAFINAL').AsString , 10)
                          );

      CdsSaldamentoAux.Next;
    End; { While Not CdsSaldamentoAux.Eof Do Begin }


    { RESERVAS }
    sSQL := 'SELECT   '+
            '  RP.IDPLANOPREV, RP.IDTIPORESERVA, RP.FLGATIVO, RP.VALORRESERVA, '+
            '  RX.NOME, '+
            '  PES.IDPESSOA, PES.NOME AS NOMEPESSOA '+
            'FROM     '+
            '  RESERVAPART RP, RESERVAXPLANO RX, PESSOA PES  '+
            'WHERE    '+
            '  ( RP.IDTIPORESERVA IN ( 76, 113, 114, 126, 125 )        ) AND ';

    If Pos( ',', sListaIdPessoa ) > 0
    Then sSQL := sSQL + '  ( RP.IDPESSOA IN ( '+ sListaIdPessoa +' ) ) AND '
    Else sSQL := sSQL + '  ( RP.IDPESSOA    = '+ sListaIdPessoa +' ) AND ';

    sSQL := sSQL + '  ( RP.IDPESSOA = PES.IDPESSOA '            +' ) AND '+
                   '  ( RP.IDPLANOPREV   = RX.IDPLANOPREV  ) AND '+
                   '  ( RP.IDTIPORESERVA = RX.IDTIPORESERVA )    '+
                   'ORDER BY '+
                   '  RP.IDPESSOA, RP.IDPLANOPREV, RX.NOME ';

    CdsSaldamentoAux.Data := GetDataPacket( sSQL );

    GravaNoDemonstrativo( '  ' ); GravaNoDemonstrativo( '  ' );
    GravaNoDemonstrativo( '-- DADOS DAS RESERVAS (RESREVAPART) -----------------------------------------------' );
    GravaNoDemonstrativo( 'PLANO  RESERVA                                            FLGATIVO     VALORRESERVA' );
    GravaNoDemonstrativo( '-----  -------------------------------------------------  --------  ---------------' );
    iIdPessoa      := -1;

    While Not CdsSaldamentoAux.Eof Do Begin

      If ( iIdPessoa <> CdsSaldamentoAux.FieldByName('IDPESSOA').AsInteger ) Then Begin

        iIdPessoa := CdsSaldamentoAux.FieldByName('IDPESSOA').AsInteger;
        GravaNoDemonstrativo( CdsSaldamentoAux.FieldByName('NOMEPESSOA').AsString );

      End;

      GravaNoDemonstrativo( AlinhaDireita( CdsSaldamentoAux.FieldByName('IDPLANOPREV').AsString, 05 )     + '  ' +
                            PreparaStr(CdsSaldamentoAux.FieldByName('IDTIPORESERVA').AsString, 3 )       + ' - ' +
                                          PreparaStr(CdsSaldamentoAux.FieldByName('NOME').AsString, 48 ) + '  ' +
                            AlinhaDireita( CdsSaldamentoAux.FieldByName('FLGATIVO').AsString, 03 )          + '  '+
                            AlinhaDireita( FloatToStrF( CdsSaldamentoAux.FieldByName('VALORRESERVA').AsFloat, ffNumber, 15,2 ) , 15)
                            );

      CdsSaldamentoAux.Next;

    End; { While Not CdsSaldamentoAux.Eof Do Begin }

    { HISTORICO DE RESERVAS }
    sSQL := 'SELECT   '+
            '  HST.IDPLANOPREV, HST.IDTIPORESERVA, HST.MESREFERENCIA, HST.VLRREAL, '+
            '  HST.SALDOREAL,   HST.DATAMOV, ' +
            '  RXP.NOME, '+
            '  PES.IDPESSOA, PES.NOME AS NOMEPESSOA '+
            'FROM     '+
            '  HISTMOVRESERVA HST, RESERVAXPLANO RXP, PESSOA PES  '+
            'WHERE    ';

    If Pos( ',', sListaIdPessoa ) > 0
    Then sSQL := sSQL + '  ( HST.IDPESSOA IN ( '+ sListaIdPessoa +' ) ) AND '
    Else sSQL := sSQL + '  ( HST.IDPESSOA    = '+ sListaIdPessoa +' ) AND ';

    sSQL := sSQL + '  ( HST.IDPLANOPREV   = '+ IntToStr( 2 )            +' ) AND '+
                   '  ( HST.MESREFERENCIA >= '+ QuotedStr( sAnoMesRef ) +' ) AND '+
                   '  ( HST.IDTIPORESERVA IN ( 76, 113, 114, 125, 126 )    ) AND '+
                   '  ( HST.IDPESSOA       = PES.IDPESSOA '             +' ) AND '+
                   '  ( HST.IDPLANOPREV    = RXP.IDPLANOPREV )       AND '+
                   '  ( HST.IDTIPORESERVA  = RXP.IDTIPORESERVA ) '+
                   'ORDER BY '+
                   '  HST.IDPESSOA, RXP.NOME ';

    CdsSaldamentoAux.Data := GetDataPacket( sSQL );

    GravaNoDemonstrativo( '  ' ); GravaNoDemonstrativo( '  ' );
    GravaNoDemonstrativo( '-- HISTORICO DE MOVIMENTAÇÃO DAS RESERVAS (HISTMOVRESERVA) ---------------' );

    GravaNoDemonstrativo( 'PLANO  IDTIPORESRERVA  MESREF           VALOR        SALDOREAL  DATAMOV   ' );
    GravaNoDemonstrativo( '-----  --------------  -------  -------------  ---------------  ----------' );

    iIdPessoa      := -1;

    While Not CdsSaldamentoAux.Eof Do Begin

      If ( iIdPessoa <> CdsSaldamentoAux.FieldByName('IDPESSOA').AsInteger ) Then Begin

        iIdPessoa := CdsSaldamentoAux.FieldByName('IDPESSOA').AsInteger;
        GravaNoDemonstrativo( CdsSaldamentoAux.FieldByName('NOMEPESSOA').AsString );

      End;

      GravaNoDemonstrativo( PreparaStr( CdsSaldamentoAux.FieldByName('IDPLANOPREV').AsString, 07 )     +
                            PreparaStr(CdsSaldamentoAux.FieldByName('IDTIPORESERVA').AsString, 16 )    +
                            PreparaStr( CdsSaldamentoAux.FieldByName('MESREFERENCIA').AsString,  07 )  +
                            AlinhaDireita( FloatToStrF( CdsSaldamentoAux.FieldByName('VLRREAL').AsFloat, ffNumber, 15,2 ) , 15) + '  '+
                            AlinhaDireita( FloatToStrF( CdsSaldamentoAux.FieldByName('SALDOREAL').AsFloat, ffNumber, 15,2 ) , 15) + '  '+
                            PreparaStr( CdsSaldamentoAux.FieldByName('DATAMOV').AsString,  10 )
                          );

      CdsSaldamentoAux.Next;
    End; { While Not CdsSaldamentoAux.Eof Do Begin }

    { EMPRESTIMOS }
    sSQL := 'SELECT   '+
            '  C.IDBENEF, C.IDPLANOPREV, C.IDCONTRATOEMPTMO, C.FLGSITUACAO, P.NOME AS NOMEPESSOA '+
            'FROM     '+
            '  CONTRATOEMPTMO C, PESSOA P '+
            'WHERE    '+
            '  ( C.IDBENEF = P.IDPESSOA ) AND ';

    If Pos( ',', sListaIdPessoa ) > 0
    Then sSQL := sSQL + '  ( C.IDBENEF IN ( '+ sListaIdPessoa +' ) )  '
    Else sSQL := sSQL + '  ( C.IDBENEF    = '+ sListaIdPessoa +' )    ';

    sSQL := sSQL + 'ORDER BY '+
                   '  C.IDPLANOPREV, C.IDCONTRATOEMPTMO ';

    CdsSaldamentoAux.Data := GetDataPacket( sSQL );

    GravaNoDemonstrativo( '  ' ); GravaNoDemonstrativo( '  ' );
    GravaNoDemonstrativo( '-- EMPRESTIMOS (CONTRATOEMPTMO) --------' );
    GravaNoDemonstrativo( 'PLANO  CONTRATO                 SITUACAO' );
    GravaNoDemonstrativo( '-----  ------------------------ --------' );

    iIdPessoa      := -1;

    While Not CdsSaldamentoAux.Eof Do Begin

      If ( iIdPessoa <> CdsSaldamentoAux.FieldByName('IDBENEF').AsInteger ) Then Begin

        iIdPessoa := CdsSaldamentoAux.FieldByName('IDBENEF').AsInteger;
        GravaNoDemonstrativo( CdsSaldamentoAux.FieldByName('NOMEPESSOA').AsString );

      End;

      GravaNoDemonstrativo( AlinhaDireita( CdsSaldamentoAux.FieldByName('IDPLANOPREV').AsString,  05 )    + '  ' +
                            PreparaStr(CdsSaldamentoAux.FieldByName('IDCONTRATOEMPTMO').AsString, 28 )    + '  ' +
                            AlinhaDireita( CdsSaldamentoAux.FieldByName('FLGSITUACAO').AsString,  03 )
                            );

      CdsSaldamentoAux.Next;

    End; { While Not CdsSaldamentoAux.Eof Do Begin }

  End;

End;

{------------------------------------------------------------------------------}
{ Montar os dados que vão ser exibidos no demonstrativo                        }
Procedure TSaldamentoAssociado.MontarDemonstrativoUsuario;
Var
  sSQL, sTipoParticipante, sAnoMesRef, sListaIdPessoa : String;

  iFlgReferencia, iNumeroProcesso, iIdPessoa, iIdPlanoPrev : Integer;

  dTotalPrev,     dTotalBenefPgto, dTotalDifB, dTotalCorrB,
  dTotalEsperado, dTotalRecebido,  dTotalDifC, dTotalCorrC : Double;

  sLinhaBeneficio, sLinhaContribuicao : String;
Begin

  If ( FGravaDemonstrativo = False ) Then Begin

     Exit;

  End;

  If ( FErroProcesso = True ) Then Begin

    GravaNoDemonstrativo( '  ');
    GravaNoDemonstrativo( '===============================================================================================================');
    GravaNoDemonstrativo( '  ');

    If Pos( 'matricula não encontrada.', sMensagemDeErro ) > 0 Then Exit;
    If Pos( 'Não possui beneficio ativo.', sMensagemDeErro ) > 0 Then Exit;

    Exit;

  End;

  { DADOS CADASTRAIS }
  sSQL := 'SELECT '+
          '  ELG.IDPESSOA,        ELG.IDPESSJUR,                      '+
          '  ELG.MATRICULA,       ELG.DATAADMISSAO,  ELG.IDSITFUNC,   '+

          '  PEST.NOME,       '+

          '  PPP.IDPLANOPREV,     PPP.DATACANCELAMENTO,  FLGDESATIVADO,      '+
          '  PPP.INSCRICAODATA,   PPP.DTINICIOINSC,      PPP.SEQPROPOSTA,    '+
          '  PPP.INSCRICAONUMERO, PPP.IDSITPART,         PPP.IDSITPLANOPREV, '+

          '  STP.DESCRICAO AS DESCSITPART, '+
          '  STF.DESCRICAO AS DESCSITFUNC, '+
          '  SPN.DESCRICAO AS DESCSITPLANOPREV, '+
          '  PPV.NOME AS NOMEPLANO, '+

          '  0 AS VALORBS '+
          'FROM   '+
          '  DEPENTIT DPT, '+
          '  PESSOA PEST,   PESSOAFISICA PEFT, PLANPREV PPV, SITPLANOPREV SPN, '+
          '  ELEGPATRO ELG, PARTPREVPLAN PPP,  SITPART  STP, SITFUNC STF       '+
          'WHERE  '+
          '  ( DPT.MATRICULA      = '+ QuotedStr( FMatriculaIndividuo )  +' ) AND '+
          '  ( ELG.IDPESSJUR      = 91008)             AND '+
          '  ( DPT.IDTITULAR      = ELG.IDPESSOA )     AND '+
          '  ( DPT.IDTITULAR      = PEST.IDPESSOA )    AND '+
          '  ( DPT.IDPESSOA       = PEFT.IDPESSOA )    AND '+

          '  ( ELG.IDPESSJUR      = PPP.IDPESSJUR )    AND '+
          '  ( ELG.IDPESSOA       = PPP.IDPESSOA  )    AND '+

          '  ( ELG.IDSITFUNC      = STF.IDSITFUNC  )   AND '+
          '  ( PPP.IDSITPART      = STP.IDSITPART  )   AND '+
          '  ( PPP.IDSITPLANOPREV = SPN.IDSITPLANOPREV  )   AND '+

          '  ( PPP.IDPLANOPREV    = PPV.IDPLANOPREV )      ';

  CdsSaldamentoAux.Data := GetDataPacket( sSQL );
  iIdPessoa := CdsSaldamentoAux.FieldByName('IDPESSOA').AsInteger;

  GravaNoDemonstrativo( 'TIPO         MATRICULA  NOME                                   SITUAÇÃO NA PATROCINADORA          ' );
  GravaNoDemonstrativo( '-----------  ---------  -------------------------------------  -----------------------------------' );

  sTipoParticipante := RetornaTipoParticipanteString;
  GravaNoDemonstrativo( PreparaStr( sTipoParticipante, 11 )                     + '  ' +
                        PreparaStr( CdsSaldamentoAux.FieldByName('MATRICULA').AsString, 10 )+ ' ' +
                        PreparaStr( CdsSaldamentoAux.FieldByName('NOME').AsString, 36 )     + '   ' +
                        PreparaStr( CdsSaldamentoAux.FieldByName('DESCSITFUNC').AsString, 30 ) );

  GravaNoDemonstrativo( '  ' ); GravaNoDemonstrativo( '  ' );
  GravaNoDemonstrativo( 'PLANO                           INSCRIÇÃO    CANCELAMENTO  SITUAÇÃO NA FUNDAÇÃO               SITUAÇÃO NO PLANO         ' );
  GravaNoDemonstrativo( '------------------------------  -----------  ------------  ---------------------------------  --------------------------' );
  While Not CdsSaldamentoAux.Eof Do Begin

    GravaNoDemonstrativo( PreparaStr(CdsSaldamentoAux.FieldByName('NOMEPLANO').AsString, 30 )         + '  ' +
                          PreparaStr( CdsSaldamentoAux.FieldByName('INSCRICAODATA').AsString, 10 )    + '   ' +
                          PreparaStr( CdsSaldamentoAux.FieldByName('DATACANCELAMENTO').AsString, 11 ) + '   ' +
                          PreparaStr( CdsSaldamentoAux.FieldByName('DESCSITPART').AsString, 32 )      + '   ' +
                          PreparaStr( CdsSaldamentoAux.FieldByName('DESCSITPLANOPREV').AsString, 28 ) );
    CdsSaldamentoAux.Next;

  End; { While Not CdsSaldamentoAux.Eof Do Begin }



  { ATIVOS }
  If FTipoArquivo = taAtivo Then Begin

    { RESERVAS }
    sSQL := 'SELECT   '+
            '  *  '+
            'FROM     '+
            '  RESERVAPART RP, RESERVAXPLANO RX '+
            'WHERE    '+
            '  ( RP.IDPESSOA = '+ IntToStr( iIdPessoa ) +' ) AND '+
            '  ( RP.IDTIPORESERVA = RX.IDTIPORESERVA )'+
            'ORDER BY '+
            '  RP.IDPLANOPREV, RX.NOME ';

    CdsSaldamentoAux.Data := GetDataPacket( sSQL );

    GravaNoDemonstrativo( '  ' ); GravaNoDemonstrativo( '  ' );
    GravaNoDemonstrativo( '-- DADOS DAS RESERVAS (RESREVAPART) -----------------------------------------------' );
    GravaNoDemonstrativo( 'PLANO  RESERVA                                            FLGATIVO     VALORRESERVA' );
    GravaNoDemonstrativo( '-----  -------------------------------------------------  --------  ---------------' );
    While Not CdsSaldamentoAux.Eof Do Begin

      GravaNoDemonstrativo( AlinhaDireita( CdsSaldamentoAux.FieldByName('IDPLANOPREV').AsString, 05 )     + '  ' +
                            PreparaStr(CdsSaldamentoAux.FieldByName('IDTIPORESERVA').AsString, 3 )       + ' - ' +
                                          PreparaStr(CdsSaldamentoAux.FieldByName('NOME').AsString, 48 ) + '  ' +
                            AlinhaDireita( CdsSaldamentoAux.FieldByName('FLGATIVO').AsString, 03 )          + '  '+
                            AlinhaDireita( FloatToStrF( CdsSaldamentoAux.FieldByName('VALORRESERVA').AsFloat, ffNumber, 15,2 ) , 15)
                            );

      CdsSaldamentoAux.Next;

    End; { While Not CdsSaldamentoAux.Eof Do Begin }

  { ASSISTIDOS }
  End Else Begin

    sAnoMesRef := '2001/09';

    { BENEFICIOS }
    sSQL := 'SELECT '+
            '  DPT.MATRICULA, '+
            '  BFT.IDRESPONSAVEL, '+
            '  BFB.IDPESSOA,     BFB.DATAFINAL,      BFB.IDSITBENEFICIO, '+
            '  BFB.DATAINICIO,   BFB.DATAINICIOFUND, BFB.VALORATUAL,     '+
            '  BFB.IDPLANOPREV,  BFB.IDBENEFICIO,    BFB.FONTEPAGADORA,  '+
            '  DECODE (BFB.IDSITBENEFICIO, 1, ''ATIVO'',2, ''RETIDO'', 3, ''ENCERRADO'', 4, ''PENDENTE'') AS DESCSITBENEFICIO, '+
            '  B.NOME, '+
            '  P.NUMEROPROCESSO, P.IDSITPROCESSO, '+
            '  PESSOA.NOME AS NOMEPESSOA, '+
            '  NVL( BFP.VALORBASE1,  BFB.VALORBASE1 ) AS VALORBASE1, '+
            '  NVL( BFP.VALORBASE2,  BFB.VALORBASE2 ) AS VALORBASE2, '+
            '  NVL( BFP.VALORBASE3,  BFB.VALORBASE3 ) AS VALORBASE3  '+
            'FROM   '+
            '  BFCIARIOTITPLAN BFT, BENEFBFCIARIO BFB, BENEFPLANOPART BFP, BENEFICIO B, PROCESSOBENEF P, PESSOA ,'+
            '  DEPENTIT DPT '+
            'WHERE  '+
            '      ( BFT.IDPESSJUR      = '+ CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString   +' ) '+
            '  AND ( BFT.IDTITULAR      = '+ CdsDadosIndividuo.FieldByName('IDTITULAR').AsString   +' ) '+
            '  AND ( BFT.IDRESPONSAVEL  = '+ CdsDadosIndividuo.FieldByName('IDPESSOA').AsString    +' ) '+
            '  AND ( BFT.SEQPROPOSTA    = '+ CdsDadosIndividuo.FieldByName('SEQPROPOSTA').AsString +' ) '+
            '  AND ( BFT.IDBENEFICIO    = B.IDBENEFICIO  )     '+

            '  AND ( BFT.IDPESSJUR      = BFB.IDPESSJUR )      '+
            '  AND ( BFT.IDPLANOPREV    = BFB.IDPLANOPREV )    '+
            '  AND ( BFT.IDPLANOORIGEM  = BFB.IDPLANOORIGEM )  '+
            '  AND ( BFT.IDTITULAR      = BFB.IDTITULAR )      '+
            '  AND ( BFT.IDPESSOA       = BFB.IDPESSOA )       '+

            '  AND ( BFT.IDPESSOA       = PESSOA.IDPESSOA )    '+
            '  AND ( BFT.IDBENEFICIO    = BFB.IDBENEFICIO )    '+
            '  AND ( BFT.SEQPROPOSTA    = BFB.SEQPROPOSTA )    '+
            '  AND ( BFB.NUMEROPROCESSO = P.NUMEROPROCESSO )   '+

            '  AND ( BFT.IDTITULAR      = DPT.IDTITULAR )      '+
            '  AND ( BFT.IDPESSOA       = DPT.IDPESSOA )       '+

            '  AND ( BFB.IDPESSJUR      = BFP.IDPESSJUR(+) )   '+
            '  AND ( BFB.IDPLANOPREV    = BFP.IDPLANOPREV(+) ) '+
            '  AND ( BFB.IDPESSOA       = BFP.IDPESSOA(+) )    '+
            '  AND ( BFB.SEQPROPOSTA    = BFP.SEQPROPOSTA(+) ) '+
            '  AND ( BFB.IDBENEFICIO    = BFP.IDBENEFICIO(+) ) '+

            'ORDER BY '+
            '  BFB.IDPESSOA, BFB.IDPLANOPREV DESC, BFB.FONTEPAGADORA DESC, P.NUMEROPROCESSO, BFB.IDBENEFICIO DESC ';

    CdsSaldamento.Data := GetDataPacket( sSQL );

    GravaNoDemonstrativo( '  ' ); GravaNoDemonstrativo( '  ' );
    GravaNoDemonstrativo( 'BENEFICIO                                      DIB         DIP         DATAFINAL   SITUAÇÃO     VALOR ATUAL  % RA' );
    GravaNoDemonstrativo( '---------------------------------------------  ----------  ----------  ----------  ----------  ------------  ----' );

    iNumeroProcesso := -1;
    iIdPessoa       := -1;

    sListaIdPessoa  := '';

    iIdPlanoPrev := CdsSaldamento.FieldByName('IDPLANOPREV').AsInteger;

    While Not CdsSaldamento.Eof Do Begin

      If ( iIdPessoa <> CdsSaldamento.FieldByName('IDPESSOA').AsInteger ) Then Begin

        If ( sListaIdPessoa = '' )
        Then sListaIdPessoa := CdsSaldamento.FieldByName('IDPESSOA').AsString
        Else sListaIdPessoa := sListaIdPessoa + ', ' + CdsSaldamento.FieldByName('IDPESSOA').AsString;

        iIdPessoa := CdsSaldamento.FieldByName('IDPESSOA').AsInteger;

        sFiller := ' ';
        If ( FMatriculaIndividuo = CdsSaldamento.FieldByName('MATRICULA').AsString )
        Then sFiller := '  ( RESPONSÁVEL )';

        If (FTipoArquivo = taPensionista ) Then Begin
          GravaNoDemonstrativo( '  ' );
          GravaNoDemonstrativo( CdsSaldamento.FieldByName('MATRICULA').AsString + ' - ' +
                                CdsSaldamento.FieldByName('NOMEPESSOA').AsString + sFiller);
          GravaNoDemonstrativo( '  ' );
        End;

      End;

      If ( iNumeroProcesso <> CdsSaldamento.FieldByName('NUMEROPROCESSO').AsInteger ) Then Begin

        iNumeroProcesso := CdsSaldamento.FieldByName('NUMEROPROCESSO').AsInteger;

      End;

      Case CdsSaldamento.FieldByName('IDBENEFICIO').AsInteger Of
        506, 507, 508, 509, 515 : sFiller := AlinhaDireita( CdsSaldamento.FieldByName('VALORBASE1').AsString, 5);
      Else
        sFiller := '';
      End;

      GravaNoDemonstrativo( PreparaStr( CdsSaldamento.FieldByName('NOME').AsString, 45 )              + '  ' +
                            PreparaStr( CdsSaldamento.FieldByName('DATAINICIOFUND').AsString,  10 )  + '  ' +
                            PreparaStr( CdsSaldamento.FieldByName('DATAINICIO').AsString,  10 )      + '  ' +
                            PreparaStr( CdsSaldamento.FieldByName('DATAFINAL').AsString,  10 )       + '  ' +
                            PreparaStr( CdsSaldamento.FieldByName('DESCSITBENEFICIO').AsString, 10 ) + '  ' +
                            AlinhaDireita( FloatToStrF( CdsSaldamento.FieldByName('VALORATUAL').AsFloat, ffNumber, 11,2 ) , 11)+ '  '+
                            sFiller
                          );

      CdsSaldamento.Next;

    End; { While Not CdsSaldamento.Eof Do Begin }

    { RUBRICAS INDIVIDUAIS }
    sSQL := 'SELECT   '+
            '  RUB.IDRUBRICA, RUB.VALORRUBRICA, RUB.PARCELAS, RUB.IDREGRACALCULO, '+
            '  PRO.DESCRICAO, RUB.TRGDTINCLUSAO, RUB.DATAFINAL, '+
            '  PES.IDPESSOA, PES.NOME AS NOMEPESSOA '+
            'FROM     '+
            '  RUBRICAINDIV RUB, PROVDESC PRO, PESSOA PES '+
            'WHERE    '+
            '  ( RUB.IDPESSOA = PES.IDPESSOA ) AND '+
            '  ( RUB.IDRUBRICA IN ( 38599, 38645, 38779, 38788, 38797 ,38805 ) ) AND ';

    If Pos( ',', sListaIdPessoa ) > 0
    Then sSQL := sSQL + '  ( RUB.IDPESSOA IN ( '+ sListaIdPessoa +' ) ) AND '
    Else sSQL := sSQL + '  ( RUB.IDPESSOA    = '+ sListaIdPessoa +' ) AND ';

    sSQL := sSQL + '  ( RUB.IDLOTEREVISAO = '+ IntToStr( iIdLoteProcesso ) + ' ) AND '+
                   '  ( RUB.IDRUBRICA     = PRO.IDPROVENTO )       '+
                   'ORDER BY '+
                   '  RUB.IDPESSOA, RUB.IDRUBRICA';

    CdsSaldamentoAux.Data := GetDataPacket( sSQL );

    GravaNoDemonstrativo( '  ' ); GravaNoDemonstrativo( '  ' );
    GravaNoDemonstrativo( 'IDRUBRICA  DESCRIÇÃO                                    VALOR   PARCELAS      REGRA ' );
    GravaNoDemonstrativo( '---------  -----------------------------------  -------------  ---------  --------- ' );

    iIdPessoa      := -1;

    While Not CdsSaldamentoAux.Eof Do Begin

      If ( iIdPessoa <> CdsSaldamentoAux.FieldByName('IDPESSOA').AsInteger ) Then Begin

        iIdPessoa := CdsSaldamentoAux.FieldByName('IDPESSOA').AsInteger;

        If (FTipoArquivo = taPensionista )
        Then GravaNoDemonstrativo( CdsSaldamentoAux.FieldByName('NOMEPESSOA').AsString );

      End;

      GravaNoDemonstrativo( PreparaStr( CdsSaldamentoAux.FieldByName('IDRUBRICA').AsString, 11 )     +
                            PreparaStr( CdsSaldamentoAux.FieldByName('DESCRICAO').AsString, 35 )     +
                            AlinhaDireita( FloatToStrF( CdsSaldamentoAux.FieldByName('VALORRUBRICA').AsFloat, ffNumber, 15,2 ) , 15) +
                            AlinhaDireita( CdsSaldamentoAux.FieldByName('PARCELAS').AsString , 11) +
                            AlinhaDireita( CdsSaldamentoAux.FieldByName('IDREGRACALCULO').AsString , 11)
                          );

      CdsSaldamentoAux.Next;
    End; { While Not CdsSaldamentoAux.Eof Do Begin }


    { RESERVAS }
    sSQL := 'SELECT   '+
            '  RP.IDPLANOPREV, RP.IDTIPORESERVA, DECODE( RP.FLGATIVO, 1, ''S'',''N'' ) AS FLGATIVO, '+
            '  RP.VALORRESERVA, '+
            '  RX.NOME, '+
            '  PES.IDPESSOA, PES.NOME AS NOMEPESSOA '+
            'FROM     '+
            '  RESERVAPART RP, RESERVAXPLANO RX, PESSOA PES  '+
            'WHERE    ';

    If ( iIdPlanoPrev = 66 )
    Then sSQL := sSQL + '  ( RP.IDTIPORESERVA IN ( 76, 113, 114, 125, 126 ) ) AND '
    Else sSQL := sSQL + '  ( RP.IDTIPORESERVA IN ( 76, 113, 114 ) ) AND ';


    If Pos( ',', sListaIdPessoa ) > 0
    Then sSQL := sSQL + '  ( RP.IDPESSOA IN ( '+ sListaIdPessoa +' ) ) AND '
    Else sSQL := sSQL + '  ( RP.IDPESSOA    = '+ sListaIdPessoa +' ) AND ';

    sSQL := sSQL + '  ( RP.IDPESSOA = PES.IDPESSOA '           +' ) AND '+
                   '  ( RP.IDPLANOPREV   = RX.IDPLANOPREV  ) AND '+
                   '  ( RP.IDTIPORESERVA = RX.IDTIPORESERVA )'+
                   'ORDER BY '+
                   '  RP.IDPESSOA, RP.IDPLANOPREV, RX.NOME ';

    CdsSaldamentoAux.Data := GetDataPacket( sSQL );

    GravaNoDemonstrativo( '  ' ); GravaNoDemonstrativo( '  ' );
    GravaNoDemonstrativo( 'RESERVA                                                   VALOR ' );
    GravaNoDemonstrativo( '-----------------------------------------------  ---------------' );
    iIdPessoa      := -1;

    While Not CdsSaldamentoAux.Eof Do Begin

      If ( iIdPessoa <> CdsSaldamentoAux.FieldByName('IDPESSOA').AsInteger ) Then Begin

        iIdPessoa := CdsSaldamentoAux.FieldByName('IDPESSOA').AsInteger;

        If (FTipoArquivo = taPensionista )
        Then GravaNoDemonstrativo( CdsSaldamentoAux.FieldByName('NOMEPESSOA').AsString );

      End;

      GravaNoDemonstrativo( PreparaStr(CdsSaldamentoAux.FieldByName('NOME').AsString, 49 ) + '' +
                            AlinhaDireita( FloatToStrF( CdsSaldamentoAux.FieldByName('VALORRESERVA').AsFloat, ffNumber, 15,2 ) , 15)
                          );

      CdsSaldamentoAux.Next;

    End; { While Not CdsSaldamentoAux.Eof Do Begin }

    { HISTORICO DE BENEFICIO  }
    sSQL := 'SELECT   '+

            '  HST.MESREFERENCIA, HST.IDPESSOA,    '+
            '  HST.IDPLANOPREV,    '+
            '  HST.IDBENEFICIO,   '+
            '  BPP.FLGREFERENCIA, '+
            '  BEN.FLGRESGATE,    '+

            '  PES.IDPESSOA, PES.NOME AS NOMEPESSOA, '+

            '  SUM( DECODE( FLGDEVOLUCAO, 1, -HST.VALORPREV , HST.VALORPREV ) ) AS VALORPREV,       '+
            '  SUM( DECODE( FLGDEVOLUCAO, 1, -HST.VLBENEFPGTO , HST.VLBENEFPGTO ) ) AS VLBENEFPGTO, '+

            '  SUM( DECODE( FLGDEVOLUCAO, 1, -HSTA.VALOR, HSTA.VALOR) ) AS VALORCORRECAO            '+

            'FROM     '+
            '  HSTBENEFBFCIARIO HST, BENEFICIO BEN, MOTIVO MOT, BENEFPLANPREV BPP, HSTATRASOBENEF HSTA, PESSOA PES '+
            'WHERE    ';

    If Pos( ',', sListaIdPessoa ) > 0
    Then sSQL := sSQL + '  ( HST.IDPESSOA IN ( '+ sListaIdPessoa +' ) ) AND '
    Else sSQL := sSQL + '  ( HST.IDPESSOA    = '+ sListaIdPessoa +' ) AND ';

    sSQL := sSQL + '  ( HST.IDPLANOPREV = '+ IntToStr( 2 )             +' ) AND '+
                   '  ( HST.MESREFERENCIA >= '+ QuotedStr( sAnoMesRef ) +' ) AND ';

    sSQL := sSQL + '  ( HST.IDLOTE      = '+ IntToStr( iIdLoteProcesso ) +' ) AND ';

    sSQL := sSQL + '  ( BPP.FLGREFERENCIA = 0 ) AND ';

    sSQL := sSQL +
            '  ( HST.IDBENEFICIO = BEN.IDBENEFICIO ) AND '+
            '  ( HST.IDMOTIVO    = MOT.IDMOTIVO ) '+

            '  AND ( HST.IDPLANOPREV    = BPP.IDPLANOPREV )   '+
            '  AND ( HST.IDBENEFICIO    = BPP.IDBENEFICIO )    '+

            '  AND ( HST.IDPESSOA       = PES.IDPESSOA    )    '+

            '  AND ( HST.IDPESSJUR      = HSTA.IDPESSJUR(+) )     '+
            '  AND ( HST.IDTITULAR      = HSTA.IDTITULAR(+) )     '+
            '  AND ( HST.IDPLANOPREV    = HSTA.IDPLANOPREV(+) )   '+
            '  AND ( HST.IDBENEFICIO    = HSTA.IDBENEFICIO(+)  )    '+
            '  AND ( HST.NUMEROPROCESSO = HSTA.NUMEROPROCESSO(+) ) '+
            '  AND ( HST.SEQBENEFICIO   = HSTA.SEQBENEFICIO(+))   '+
            '  AND ( HST.SEQPROPOSTA    = HSTA.SEQPROPOSTA(+) )   '+
            '  AND ( HST.MESREFERENCIA  = HSTA.MESREFERENCIA(+))  '+
            '  AND ( HST.IDMOTIVO       = HSTA.IDMOTIVO(+))   '+

            'GROUP BY '+
            '  HST.IDPESSOA, BPP.FLGREFERENCIA, BEN.FLGRESGATE, HST.IDPLANOPREV, HST.MESREFERENCIA, HST.IDBENEFICIO, PES.IDPESSOA, PES.NOME '+
            'ORDER BY '+
             ' HST.IDPESSOA, BPP.FLGREFERENCIA, HST.IDPLANOPREV, HST.MESREFERENCIA DESC, HST.IDBENEFICIO DESC ';

    CdsSaldamento.Data := GetDataPacket( sSQL );

    { HISTORICO DE CONTRIBUIÇÕES }
    sSQL := 'SELECT   '+

            '  HST.IDPLANOPREV, HST.MESREFERENCIA, '+
            '  HST.IDPESSOA,                       '+

            '  SUM( DECODE( FLGDEVOLUCAO, 1, -HST.VALORESPERADO,  HST.VALORESPERADO) ) AS VALORESPERADO,  '+
            '  SUM( DECODE( FLGDEVOLUCAO, 1, -HST.VALORRECEBIDO , HST.VALORRECEBIDO) ) AS VALORRECEBIDO, '+
            '  SUM( DECODE( FLGDEVOLUCAO, 1, -HSTA.VALOR, HSTA.VALOR) ) AS VALORCORRECAO '+

            'FROM     '+
            '  HSTCONTRIBPREV  HST, MOTIVO MOT, HSTATRASOCONTRIB HSTA '+
            'WHERE    ';

            // INICIO SOL:123735 - Daniel Begnami
            //            '  ( HST.IDPESSOA      = '+ IntToStr( iIdResponsavelProcessando )  +' ) AND '+
            If Pos( ',', sListaIdPessoa ) > 0
            Then sSQL := sSQL + '  ( HST.IDPESSOA IN ( '+ sListaIdPessoa +' ) ) AND '
            Else sSQL := sSQL + '  ( HST.IDPESSOA    = '+ sListaIdPessoa +' ) AND ';
            // FIM

       sSQL := sSQL +  '  ( HST.IDPLANOPREV   = '+ IntToStr( 2 )            +' ) AND '+
            '  ( HST.MESREFERENCIA >= '+ QuotedStr( sAnoMesRef ) +' ) AND '+
            '  ( HST.IDCONTRIBUICAO IN ( 259, 633 )                 ) AND ';

    sSQL := sSQL + '  ( HST.IDLOTE      = '+ IntToStr( iIdLoteProcesso ) +' ) AND ';

    sSQL := sSQL +
            '  ( HST.IDMOTIVO           = MOT.IDMOTIVO ) '+
            '  AND ( HST.NUMRECEBIMENTO = HSTA.NUMRECEBIMENTO(+) )     '+
            '  AND ( HST.MESREFERENCIA  = HSTA.MESREFERENCIA(+))   '+
            'GROUP BY '+
            '  HST.IDPLANOPREV, HST.IDPESSOA, HST.MESREFERENCIA ';

    CdsSaldamentoAux.Data := GetDataPacket( sSQL );

    GravaNoDemonstrativo( '  ' ); GravaNoDemonstrativo( '  ' );
    GravaNoDemonstrativo( 'MESREF   BENEF. DEVIDO    BENEF. PAGO      DIFERENÇA    CORREÇÃO  CONTR. DEVIDA    CONTR. PAGA      DIFERENÇA    CORREÇÃO  ' );
    GravaNoDemonstrativo( '-------  -------------  -------------  -------------  ----------  -------------  -------------  -------------  ----------  ' );

    iFlgReferencia := CdsSaldamento.FieldByName('FLGREFERENCIA').AsInteger;

    iIdPessoa      := -1;

    While Not CdsSaldamento.Eof Do Begin

      sLInhaBeneficio := ''; sLinhaContribuicao := '';

      dTotalPrev     := 0; dTotalBenefPgto := 0; dTotalDifB := 0; dTotalCorrB := 0;
      dTotalEsperado := 0; dTotalRecebido  := 0; dTotalDifC := 0; dTotalCorrC := 0;

      iIdPessoa := CdsSaldamento.FieldByName('IDPESSOA').AsInteger;

      If (FTipoArquivo = taPensionista ) Then Begin
        GravaNoDemonstrativo( '  ' );
        GravaNoDemonstrativo( CdsSaldamento.FieldByName('NOMEPESSOA').AsString );
        GravaNoDemonstrativo( '  ' );
      End;

      While ( iIdPessoa = CdsSaldamento.FieldByName('IDPESSOA').AsInteger ) And ( Not CdsSaldamento.Eof ) Do Begin

        { Monta linha do Beneficio }
        sLinhaBeneficio := PreparaStr( CdsSaldamento.FieldByName('MESREFERENCIA').AsString,  09 )  +
                           AlinhaDireita( FloatToStrF( CdsSaldamento.FieldByName('VALORPREV').AsFloat, ffNumber, 15,2 ) , 13)   + '  '+
                           AlinhaDireita( FloatToStrF( CdsSaldamento.FieldByName('VLBENEFPGTO').AsFloat, ffNumber, 15,2 ) , 13) + '  ';

        If ( CdsSaldamento.FieldByName('FLGRESGATE').AsInteger = 0 ) or
           ( ( CdsSaldamento.FieldByName('FLGRESGATE').AsInteger = 1 ) And
             ( CdsSaldamento.FieldByName('MESREFERENCIA').AsString <> sAnoMesLoteProcesso ) )
        Then Begin
          sLinhaBeneficio := sLinhaBeneficio +
                             AlinhaDireita( FloatToStrF( ( CdsSaldamento.FieldByName('VALORPREV').AsFloat -
                                                           CdsSaldamento.FieldByName('VLBENEFPGTO').AsFloat ),
                                                        ffNumber, 15,2 ) , 13) + '  ';
        End Else Begin
          sLinhaBeneficio := sLinhaBeneficio +
                             AlinhaDireita( FloatToStrF( ( CdsSaldamento.FieldByName('VALORPREV').AsFloat ), ffNumber, 15,2 ) , 13) + '  ';
        End;

        sLinhaBeneficio := sLinhaBeneficio +
                           AlinhaDireita( FloatToStrF( CdsSaldamento.FieldByName('VALORCORRECAO').AsFloat, ffNumber, 10,2 ) , 10);

        dTotalPrev      := ( dTotalPrev      + CdsSaldamento.FieldByName('VALORPREV').AsFloat );;
        dTotalBenefPgto := ( dTotalBenefPgto + CdsSaldamento.FieldByName('VLBENEFPGTO').AsFloat );

        If ( CdsSaldamento.FieldByName('FLGRESGATE').AsInteger = 0 ) or
           ( ( CdsSaldamento.FieldByName('FLGRESGATE').AsInteger = 1 ) And
             ( CdsSaldamento.FieldByName('MESREFERENCIA').AsString <> sAnoMesLoteProcesso ) )
        Then dTotalDifB      := ( dTotalDifB      + ( CdsSaldamento.FieldByName('VALORPREV').AsFloat - CdsSaldamento.FieldByName('VLBENEFPGTO').AsFloat ) )
        Else dTotalDifB      := ( dTotalDifB      + ( CdsSaldamento.FieldByName('VALORPREV').AsFloat ) );

        dTotalCorrB     := ( dTotalCorrB     + ( CdsSaldamento.FieldByName('VALORCORRECAO').AsFloat ) );

        { Monta linha da Contribuição }
        If ( CdsSaldamentoAux.Locate( 'IDPESSOA;MESREFERENCIA',
                                      VarArrayOf( [CdsSaldamento.FieldByName('IDPESSOA').AsString,
                                                  CdsSaldamento.FieldByName('MESREFERENCIA').AsString] ),
                                      [] ) ) Then Begin

          { Pular a Renda Antecipada }
          dTotalEsperado  := ( dTotalEsperado + CdsSaldamentoAux.FieldByName('VALORESPERADO').AsFloat );
          dTotalRecebido  := ( dTotalRecebido + CdsSaldamentoAux.FieldByName('VALORRECEBIDO').AsFloat );

          If ( CdsSaldamento.FieldByName('FLGRESGATE').AsInteger = 0 ) or
             ( ( CdsSaldamento.FieldByName('FLGRESGATE').AsInteger = 1 ) And
             ( CdsSaldamento.FieldByName('MESREFERENCIA').AsString <> sAnoMesLoteProcesso ) )
          Then dTotalDifC := ( dTotalDifC     + ( CdsSaldamentoAux.FieldByName('VALORESPERADO').AsFloat - CdsSaldamentoAux.FieldByName('VALORRECEBIDO').AsFloat ) )
          Else dTotalDifC := ( dTotalDifC     + ( CdsSaldamentoAux.FieldByName('VALORESPERADO').AsFloat ) );

          dTotalCorrC     := ( dTotalCorrC    + ( CdsSaldamentoAux.FieldByName('VALORCORRECAO').AsFloat ) );

          sLinhaContribuicao := AlinhaDireita( FloatToStrF( CdsSaldamentoAux.FieldByName('VALORESPERADO').AsFloat, ffNumber, 15,2 ) , 13) + '  '+
                                AlinhaDireita( FloatToStrF( CdsSaldamentoAux.FieldByName('VALORRECEBIDO').AsFloat, ffNumber, 15,2 ) , 13) + '  ';

          If ( CdsSaldamento.FieldByName('FLGRESGATE').AsInteger = 0 ) or
             ( ( CdsSaldamento.FieldByName('FLGRESGATE').AsInteger = 1 ) And
               ( CdsSaldamento.FieldByName('MESREFERENCIA').AsString <> sAnoMesLoteProcesso ) )
          Then Begin
            sLinhaContribuicao := sLinhaContribuicao +
                                  AlinhaDireita( FloatToStrF( -( CdsSaldamentoAux.FieldByName('VALORESPERADO').AsFloat -
                                                                 CdsSaldamentoAux.FieldByName('VALORRECEBIDO').AsFloat )  ,
                                                              ffNumber, 15,2 ) , 13) + '  ';
          End Else Begin
            sLinhaContribuicao := sLinhaContribuicao +
                                  AlinhaDireita( FloatToStrF( -( CdsSaldamentoAux.FieldByName('VALORESPERADO').AsFloat )  ,
                                                              ffNumber, 15,2 ) , 13) + '  ';
          End;

          sLinhaContribuicao := sLinhaContribuicao +
                                AlinhaDireita( FloatToStrF( -CdsSaldamentoAux.FieldByName('VALORCORRECAO').AsFloat, ffNumber, 10,2 ) , 10);

        End;

        GravaNoDemonstrativo( sLinhaBeneficio + '  ' + sLinhaContribuicao );

        CdsSaldamento.Next;

        If ( iFlgReferencia <> CdsSaldamento.FieldByName('FLGREFERENCIA').AsInteger ) Then Begin

          GravaNoDemonstrativo( ' ' );
          GravaNoDemonstrativo( '- INSS ------------------------------------------------------------------------------------------' );
          iFlgReferencia := CdsSaldamento.FieldByName('FLGREFERENCIA').AsInteger;

          dTotalPrev     := 0; dTotalBenefPgto := 0; dTotalDifB := 0; dTotalCorrB := 0;
          dTotalEsperado := 0; dTotalRecebido  := 0; dTotalDifC := 0; dTotalCorrC := 0;

        End;


      End; { While ( iIdPessoa = CdsSaldamento.FieldByName('IDPESSOA').AsInteger ) Then Begin }


      sLinhaBeneficio := StringOfChar(' ', 09)  +
                         AlinhaDireita( FloatToStrF( dTotalPrev,      ffNumber, 15,2 ) , 13) + '  '+
                         AlinhaDireita( FloatToStrF( dTotalBenefPgto, ffNumber, 15,2 ) , 13) + '  '+
                         AlinhaDireita( FloatToStrF( dTotalDifB,      ffNumber, 15,2 ) , 13) + '  '+
                         AlinhaDireita( FloatToStrF( dTotalCorrB,     ffNumber, 10,2 ) , 10);


      sLinhaContribuicao := AlinhaDireita( FloatToStrF( dTotalEsperado, ffNumber, 15,2 ) , 13) + '  '+
                            AlinhaDireita( FloatToStrF( dTotalRecebido, ffNumber, 15,2 ) , 13) + '  '+
                            AlinhaDireita( FloatToStrF( -dTotalDifC,     ffNumber, 15,2 ) , 13) + '  '+
                            AlinhaDireita( FloatToStrF( -dTotalCorrC,    ffNumber, 10,2 ) , 10);

      GravaNoDemonstrativo( '  ' );
      GravaNoDemonstrativo( sLinhaBeneficio + '  ' + sLinhaContribuicao );
      GravaNoDemonstrativo( '-------  -------------  -------------  -------------  ----------  -------------  -------------  -------------  ----------  ' );


    End; { While Not CdsSaldamento.Eof Do Begin }


  End;

End;

{------------------------------------------------------------------------------}
{ Retorna o tipo de participoante que será processado                          }
Procedure TSaldamentoAssociado.SetaTipoParticipante;
Begin

  FTipoParticipante := tpNone;

  If ( CdsDadosIndividuo.FieldByName('IDPLANOPREV').AsInteger = 2 )
  Then FTipoParticipante := tpReplan
  Else FTipoParticipante := tpREB;

  If ( CdsDadosIndividuo.FieldByName('IDPLANOPREV').AsInteger = 2 ) And
     ( CdsDadosIndividuo.FieldByName('DTINICIOINSC').AsDateTime < StrToDate('23/01/1978') )Then Begin

    FTipoParticipante := tpReplanPre78;

  End;

  If ( CdsDadosIndividuo.FieldByName('IDPLANOPREV').AsInteger = 66 ) And
     ( CdsDadosIndividuo.FieldByName('DTINICIOINSC').AsDateTime < StrToDate('23/01/1978') )Then Begin

    FTipoParticipante := tpREBPre78;

  End;

End;

{------------------------------------------------------------------------------}
{ Retorna o tipo de participoante em string                                    }
Function TSaldamentoAssociado.RetornaTipoParticipanteString: String;
Begin

  Result := 'ERRO';
  If FTipoParticipante      = tpReplan      Then Result := 'REPLANPÓS78'
  Else If FTipoParticipante = tpREB         Then Result := 'REBPÓS78'
  Else If FTipoParticipante = tpReplanPre78 Then Result := 'REPLANPRÉ78'
  Else If FTipoParticipante = tpREBPre78    Then Result := 'REBPRÉ78';

End;

{------------------------------------------------------------------------------}
{ Retorna dados do lote                                                        }
Function TSaldamentoAssociado.RetornaDadosLote: String;
Begin

  sSQL := 'SELECT  '+
          '  TO_CHAR(CD.DATAPAGBENEF,''DD/MM/YYYY'') DATAPAGBENEF, '+
          '  TO_CHAR(CD.DATAPAGABONO,''DD/MM/YYYY'') DATAPAGABONO  '+
          'FROM    '+
          '  CALENDDATAS CD, FUNDACAO T '+
          'WHERE   '+
          '  (CD.FLGINTERNO  = ''AS'') AND     '+
          '  (CD.ANOMESREF   = '+ QuotedStr( sAnoMesLoteProcesso )  +') AND     '+
          '  (T.IDPESSOA     = 1)      AND     '+
          '  (T.IDCALENDARIO = CD.IDCALENDARIO) ';

  CdsSaldamentoAux.Data := GetDataPacket( sSQL );

  If ( Not CdsSaldamentoAux.IsEmpty = True )
  Then Result := CdsSaldamentoAux.FieldByName('DATAPAGBENEF').AsString;


End;

{------------------------------------------------------------------------------}
{ Funções genéricas utéis                                                      }
Function TSaldamentoAssociado.PreparaStr(Str: String; Tamanho: Integer): String;
Var
  I: Byte;
Begin
  If Length( Str ) <> Tamanho Then Begin

    Str := Trim( Str );

    If Length( Str ) > Tamanho
    Then Str := Copy( Str , 1, Tamanho )
    Else For I := Length( Str ) To ( Tamanho-1 ) Do Str := Str + ' ';
  End;

  Result := Str;

End;

Function TSaldamentoAssociado.AlinhaDireita(psCampo: String; piCasas: Integer): String;
Var
  I : Integer;
Begin

  If Length( Trim( psCampo ) ) > piCasas Then Result := psCampo;

  I := piCasas - Length( Trim( psCampo ) );

  Result := StringOfChar(' ',I) + psCampo;

End;


Function TSaldamentoAssociado.AnoMesAnterior(psAnoMesRef: String): String;
Var
  iAno, iMes : Integer;
  sAnoMes : String;
Begin

  Result := '';

  iAno := StrToInt( Copy( psAnoMesRef, 1, 4 ) );
  iMes := StrToInt( Copy( psAnoMesRef, 6, 2 ) );

  If iMes = 1 Then Begin

     sAnoMes := IntToStr( iAno-1 ) + '/';
     sAnoMes := sAnoMes + '13';

  End Else Begin

    sAnoMes := IntToStr( iAno ) + '/';
    iMes := iMes - 1;

    If iMes <= 9
    Then sAnoMes := sAnoMes + '0' + IntToStr( iMes )
    Else sAnoMes := sAnoMes + IntToStr( iMes );

  End;

  Result := sAnoMes;

End;

Function TSaldamentoAssociado.Trunca(pdValor: Double; piDecimais: Integer): Double;
Begin
   Result := (Trunc( pdValor * Power (10, piDecimais))) / Power(10, piDecimais);
End;

Function TSaldamentoAssociado.EvoluiMes( pdDataRef : TDate; piNumeroMeses : Integer ): String;
Var
  sMes, sDia, sAno : String;
  iMes, iDia, iAno : Integer;
Begin

  sDia  := FormatDateTime( 'DD', pdDataRef );
  sMes  := FormatDateTime( 'MM', pdDataRef );
  sAno  := FormatDateTime( 'YYYY', pdDataRef );

  iDia  := StrToInt( sDia );
  iMes  := StrToInt( sMes );
  iAno  := StrToInt( sAno );

  While ( piNumeroMeses > 0 ) Do Begin

    If ( iMes = 12 )Then Begin

      iMes := 1;
      Inc( iAno );

    End Else Begin

      Inc( iMes );

    End;

    Dec( piNumeroMeses );

  End;

  If (iMes = 2) And (iDia > 28) Then sDia := '28';

  If ((iMes = 4) Or (iMes = 6) Or (iMes = 9) Or (iMes = 11)) And (iDia > 30) Then sDia := '30';

  sDia  := IntToStr( iDia );
  sMes  := IntToStr( iMes );
  sAno  := IntToStr( iAno );

  If ( iDia < 10 ) Then sDia := '0'+sDia;
  If ( iMes < 10 ) Then sMes := '0'+sMes;


  Result := sDia + '/' + sMes + '/' + sAno;

End; { EvoluiMes }

Function TSaldamentoAssociado.GetSequenceLocal( psNomeTabela: String ): Integer;
Var
  sSQL : String;
Begin

  Result := -1;

  sSQL := 'SELECT CM.SEQ'+ psNomeTabela +'.NEXTVAL AS PROXSEQ FROM DUAL ';

  CdsSaldamentoAux.Data := GetDataPacket( sSQL );
  If ( Not CdsSaldamentoAux.IsEmpty = True )
  Then Result := CdsSaldamentoAux.FieldByName('PROXSEQ').AsInteger;

End;

Function TSaldamentoAssociado.OraNumero(sNumero : string):string;
Var
  I : integer;
  sResult,
  sOra : string;
  bPrimPonto : boolean;
Begin
   if Trim(sNumero)  = ''
   then begin
      Result := '0';
      exit;
   end;
   sOra := '';
   bPrimPonto := False;
   for i := length(Trim(sNumero)) downto 1
   do begin
     if (sNumero[i] = ',') or (sNumero[i] = '@')
     then begin
        if sNumero[i] = '@'
        then DecimalSeparator := ',';
        
        if not bPrimPonto
        then begin
           sOra := sOra + '.';
           bPrimPonto := True;
        end
        else sOra := sOra;
     end
     else begin
        if sNumero[i] <> '.'
        then sOra := sOra + sNumero[i]
        else begin
           if not bPrimPonto
           then begin
              sOra := sOra+'.';
              bPrimPonto := True;
           end
           else sOra := sOra;
        end;
     end;
   end;
   sResult := '';
   for i := length(sOra) downto 1 do begin
      sResult := sResult + sOra[i];
   end;
   Result := sResult;
End;


{******************************************************************************}
{ Inicio da implementação da classe TSALDAMENTOATIVO                           }
{ TSaldamentoAtivo }

Constructor TSaldamentoAtivo.Create;
Begin

  FTipoArquivo  := taAtivo;

  Inherited;

End;

Destructor TSaldamentoAtivo.Destroy;
Begin
  Inherited;

End;

{------------------------------------------------------------------------------}
{ Executa processo de saldamento de ativo                                      }
Function TSaldamentoAtivo.Processar: Boolean;
Begin

  Inherited Processar;

End;

{------------------------------------------------------------------------------}
{ Executa processo de saldamento de ativo para um individuo                    }
Function TSaldamentoAtivo.ProcessarIndividuo: Boolean;
Begin

  Try

    Result := False;

    If ( Not Inherited ProcessarIndividuo ) Then Begin

      Exit;

    End;

    IniciarProcessoIndividuo;

    If Not BuscaDadosIndividuo Then Begin

      sMensagemDeErro := 'Erro na matricula '+ FMatriculaIndividuo +'. Mensagem: '+ sMensagemDeErro;

      GravaNoDemonstrativo( sMensagemDeErro );
      GravaNoDemonstrativo( ' ' );

      If ( FTipoProcesso = TpLote ) Then Begin
        GravaNoDemonstrativo( FMatriculaIndividuo + '   ERRO: '+ sMensagemDeErro );
      End Else Begin
        MsgDlg(sMensagemDeErro , 'Erro', mtError, [mbOk], 0);
        Exit;
      End;

    End;

    If ( Not PassouElegibilidade ) Then Begin

      sMensagemDeErro := 'Matricula '+ FMatriculaIndividuo +' não passou na elegibilidade. Mensagem: '+ sMensagemDeErro;

      GravaNoDemonstrativo( sMensagemDeErro );
      GravaNoDemonstrativo( ' ' );

      If ( FTipoProcesso = TpLote ) Then Begin
        GravaNoDemonstrativo( FMatriculaIndividuo + '   ERRO: '+ sMensagemDeErro );
      End Else Begin
        MsgDlg(sMensagemDeErro , 'Erro', mtError, [mbOk], 0);
        Exit;
      End;

    End;

    { Identifica o tipo de participante }
    SetaTipoParticipante;

    { Processar inscrições }
    If Not ProcessarInscricoes Then Begin

      GravaNoDemonstrativo( 'ERRO AO GRAVAR DADOS DA INSCRICAO NO PLANO DA MATRICULA -> '+ FMatriculaIndividuo +' COM A MENSAGEM: '+ sMensagemDeErro );
      GravaNoDemonstrativo( ' ' );
      Exit;

    End;

    { Processar eventos }
    If Not ProcessarEventos Then Begin

      GravaNoDemonstrativo( 'ERRO AO GRAVAR DADOS DOS EVENTOS DA MATRICULA -> '+ FMatriculaIndividuo +' COM A MENSAGEM: '+ sMensagemDeErro );
      GravaNoDemonstrativo( ' ' );
      Exit;

    End;

    { Processar emprestimos }
    If ( Not ProcessarEmprestimos( CdsDadosIndividuo.FieldByName('IDPESSOA').AsInteger ) ) Then Begin

      GravaNoDemonstrativo( 'ERRO AO GRAVAR DADOS DOS EMPRÉSTIMOS DA MATRICULA -> '+ FMatriculaIndividuo +' COM A MENSAGEM: '+ sMensagemDeErro );
      GravaNoDemonstrativo( ' ' );
      Exit;

    End;

    { Processar contribuições }
    If Not ProcessarContribuicoes Then Begin

      GravaNoDemonstrativo( 'ERRO AO GRAVAR DADOS DOS CONTRIBUIÇÕES DA MATRICULA -> '+ FMatriculaIndividuo +' COM A MENSAGEM: '+ sMensagemDeErro );
      GravaNoDemonstrativo( ' ' );
      Exit;

    End;

    { Processar reservas }
    If Not ProcessarReservas Then Begin

      GravaNoDemonstrativo( 'ERRO AO GRAVAR DADOS DAS RESERVAS DA MATRICULA -> '+ FMatriculaIndividuo +' COM A MENSAGEM: '+ sMensagemDeErro );
      GravaNoDemonstrativo( ' ' );
      Exit;

    End;

    Result := True;

  Except


  End;

End; { TSaldamentoAtivo.ProcessarIndividuo }

{------------------------------------------------------------------------------}
{ Executa alterações na inscrição do Ativo (PARTPREVPLAN)                      }
Function TSaldamentoAtivo.ProcessarInscricoes: Boolean;
Var
  sSQL : String;

Begin

  Result := False;

  Try

    Inherited ProcessarInscricoes;

    {--------------------------------------------------------------------------}
    { Cancelamento do REPLAN                                                   }

    sSQL := 'UPDATE  PARTPREVPLAN SET FLGDESATIVADO    = 1, '+
            '                         IDSITPLANOPREV   = '+ IntToStr( iIdSitPlanoSaldado ) +', '+
            '                         DATACANCELAMENTO = TO_DATE('''+ DateToStr( StrToDate( sDataEvento )- 1)+''',''DD/MM/YYYY'') '+
            'WHERE   IDPESSJUR   = '+ CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString   +
            '  AND   IDPLANOPREV = '+ CdsDadosIndividuo.FieldByName('IDPLANOPREV').AsString +
            '  AND   IDPESSOA    = '+ CdsDadosIndividuo.FieldByName('IDTITULAR').AsString   +
            '  AND   SEQPROPOSTA = '+ CdsDadosIndividuo.FieldByName('SEQPROPOSTA').AsString ;

    If Not ExecSQL( sSQL ) Then Abort;

    {--------------------------------------------------------------------------}
    { Inscrição no NOVOPLANO                                                   }

    sSQL := '  INSERT INTO PARTPREVPLAN( '+
            '         IDPESSJUR,         IDPLANOPREV,    IDPESSOA,          SEQPROPOSTA,        '+
            '         IDSITPART ,        IDSITPLANOPREV, INSCRICAONUMERO,   INSCRICAODATA,      '+
            '         INSCRICAOTIPO,     SALINSCRICAO,   SALPARTICIPACAO,   SALMANTIDO,         '+
            '         SALVINCULADO,      VALORCALCINSS,  FLGDEVEEMPRESTIMO, FLGDEVEASSISTENC,   '+
            '         FLGDEVEPREVIDENC,  VALORINFINSS,   SALAUXDOENCA,                          '+
            '         DATAINICIOSITTEMP, DATAFIMSITTEMP, DATAINICIOMANUT,   REQUERIMENTODATA,   '+
            '         DTINICIOINSC, FLGFITESPECIAL                              ) '+
            ' SELECT                                                                            '+
            '         IDPESSJUR,         '+IntToStr( iIdNovoPlano )+',   IDPESSOA,          SEQPROPOSTA,        '+
            '         IDSITPART ,        '+CdsDadosIndividuo.FieldByName('IDSITPLANOPREV').AsString+','+
            CdsDadosIndividuo.FieldByName('INSCRICAONUMERO').AsString +','+
            '         TO_DATE('''+ sDataEvento +''',''DD/MM/YYYY''),                       '+
            '         INSCRICAOTIPO,     SALINSCRICAO,   SALPARTICIPACAO,   SALMANTIDO,         '+
            '         SALVINCULADO,      VALORCALCINSS,  FLGDEVEEMPRESTIMO, FLGDEVEASSISTENC,   '+
            '         FLGDEVEPREVIDENC,  VALORINFINSS,   SALAUXDOENCA,                          '+
            '         DECODE(DATAINICIOSITTEMP, NULL, NULL, TO_DATE('''+ sDataEvento +''',''DD/MM/YYYY'') ), '+
            '         DECODE(DATAFIMSITTEMP,    NULL, NULL, TO_DATE('''+ sDataEvento +''',''DD/MM/YYYY'') ), '+
            '         DECODE(DATAINICIOMANUT,   NULL, NULL, TO_DATE('''+ sDataEvento +''',''DD/MM/YYYY'') ), '+
            '         SYSDATE,                     '+
            '         DTINICIOINSC, FLGFITESPECIAL '+
            ' FROM    PARTPREVPLAN                                                              '+
            ' WHERE   IDPESSJUR   = '+ CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString    +
            ' AND     IDPLANOPREV = '+ CdsDadosIndividuo.FieldByName('IDPLANOPREV').AsString  +
            ' AND     IDPESSOA    = '+ CdsDadosIndividuo.FieldByName('IDPESSOA').AsString     +
            ' AND     SEQPROPOSTA = '+ CdsDadosIndividuo.FieldByName('SEQPROPOSTA').AsString ;


    If Not ExecSQL( sSQL ) Then Abort;


    Result := True;

  Except

    sMensagemDeErro := MessageInfo;

    Result := False;
    Exit;

  End;

  Result := True;

End; { TSaldamentoAtivo.ProcessarInscricoes }

{------------------------------------------------------------------------------}
{ Executa alterações nas tabelas de evento para ativos (EVENTOSPREV)           }
Function TSaldamentoAtivo.ProcessarEventos: Boolean;
Begin

  Result := False;

  Try

    If ( Not Inherited ProcessarEventos ) Then Begin

      Exit;

    End;

    {--------------------------------------------------------------------------}
    { Evento de inscricao inscrição                                            }

    If ( Not InsereEvento( iIdEventoDeInscricao ) ) Then Abort; { Facultativos }

    {--------------------------------------------------------------------------}
    { Verfica se precisa de outros eventos                                     }

    If ( CdsDadosIndividuo.FieldByName('IDSITPART').AsInteger <> 1 ) Then Begin

        If ( Not ReplicaEvento ) Then Exit; { Facultativos }

    End;

    Result := True;

  Except


  End;

End; { TSaldamentoAtivo.ProcessarEventos }


{------------------------------------------------------------------------------}
{ Inserir um evento na tabela de eventos (EVENTOSPREV)                         }
Function TSaldamentoAtivo.InsereEvento( iIdEventoGerador : Integer ) : Boolean;
Var
   iIdEventosPrev : Integer;
   sSQL : String;
Begin

  Result := True;

  iIdEventosPrev := GetSequenceLocal( 'EVENTOSPREV' );

  sSQL := ' INSERT INTO EVENTOSPREV(IDEVENTOSPREV,   DATAREGISTRO,   DATAEVENTO,      ' +
          '                         IDPESSOA,        IDPESSJUR,      IDPLANOPREV,     SEQPROPOSTA, ' +
          '                         IDSITFUNCATUAL,  IDSITPARTATUAL, IDSITPLANOATUAL, ' +
          '                         IDSITFUNCNOVO,   IDSITPARTNOVO,  IDSITPLANONOVO,  ' +
          '                         IDEVENTOGERADOR, FLGSITFUNCIMED, FLGSITPARTIMED,  ' +
          '                         FLGSITPLANOIMED, DATAEFETIVADO,   FLGEFETIVADO,   ' +
          '                         INSCRICAONUMERO)                 ' +
          ' VALUES(' + IntToStr( iIdEventosPrev )               + ',' +
          ' TO_DATE(''' + DateToStr(Date)     + ''',''DD/MM/YYYY'') ,' +
          ' TO_DATE(''' + Trim( sDataEvento ) + ''',''DD/MM/YYYY'') ,' +

          CdsDadosIndividuo.FieldByName('IDPESSOA').AsString        + ',' +
          CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString       + ',' +
          IntToStr( iIdNovoPlano )                                  + ',' +
          CdsDadosIndividuo.FieldByName('SEQPROPOSTA').AsString     + ',' +

          CdsDadosIndividuo.FieldByName('IDSITFUNC').AsString       + ',' +
          CdsDadosIndividuo.FieldByName('IDSITPART').AsString       + ',' +
          CdsDadosIndividuo.FieldByName('IDSITPLANOPREV').AsString  + ',' +
          CdsDadosIndividuo.FieldByName('IDSITFUNC').AsString + ',' +
          '1,' +                                                              { IDSITPARTNOVO  }
          '1,' +                                                              { IDSITPLANONOVO }
          IntToStr( iIdEventoGerador )                              +',' +    { EVENTOGERADOR  }
          '''1'',''1'',''1'',' +
          ' TO_DATE('''+DateToStr(Date)+''',''DD/MM/YYYY''),''1'''+','+
           CdsDadosIndividuo.FieldByName('INSCRICAONUMERO').AsString +')';

  If Not ExecSQL( sSQL ) Then Abort;

End; { TSaldamentoAtivo.InsereEvento }


{------------------------------------------------------------------------------}
{ Inserir um evento na tabela de eventos com dados de outro evento             }
Function TSaldamentoAtivo.ReplicaEvento : Boolean;
Var
   iIdEventosPrev : Integer;
   sSQL, sSQLIdEvento : String;
Begin

  //iIdEventosPrev := GetSequenceLocal( 'EVENTOSPREV' );

  Result := True;

  sSQLIdEvento := '( CM.SEQEVENTOSPREV.NEXTVAL )';

  sSQL := 'INSERT INTO EVENTOSPREV(IDEVENTOSPREV,   DATAREGISTRO,   DATAEVENTO,      ' +
          '                        IDPESSOA,        IDPESSJUR,      IDPLANOPREV,     SEQPROPOSTA, ' +
          '                        IDSITFUNCATUAL,  IDSITPARTATUAL, IDSITPLANOATUAL, ' +
          '                        IDSITFUNCNOVO,   IDSITPARTNOVO,  IDSITPLANONOVO,  ' +
          '                        IDEVENTOGERADOR, FLGSITFUNCIMED, FLGSITPARTIMED,  ' +
          '                        FLGSITPLANOIMED, DATAEFETIVADO,   FLGEFETIVADO,   ' +
          '                        INSCRICAONUMERO)                 ' +
          //'SELECT  '+ IntToStr( iIdEventosPrev ) +', '+
          'SELECT  '+ sSQLIdEvento +', '+
          '  TO_DATE(''' + DateToStr(Date)     + ''',''DD/MM/YYYY''), ' +
          '  TO_DATE(''' + Trim( sDataEvento ) + ''',''DD/MM/YYYY''),  ' +

          '  IDPESSOA,        IDPESSJUR,    '+ IntToStr( iIdNovoPlano )+ ',   SEQPROPOSTA, ' +
          '  IDSITFUNCATUAL,  IDSITPARTATUAL, IDSITPLANOATUAL, ' +

          CdsDadosIndividuo.FieldByName('IDSITFUNC').AsString   +' , '+
          CdsDadosIndividuo.FieldByName('IDSITPART').AsString   +' , '+
          CdsDadosIndividuo.FieldByName('IDSITPLANOPREV').AsString  +' , '+

          '  IDEVENTOGERADOR, FLGSITFUNCIMED, FLGSITPARTIMED,  ' +
          '  FLGSITPLANOIMED, '+
          '  TO_DATE(''' + DateToStr(Date)     + ''',''DD/MM/YYYY''), ' +
          '  FLGEFETIVADO,   ' +

          CdsDadosIndividuo.FieldByName('INSCRICAONUMERO').AsString +'  '+

          'FROM EVENTOSPREV EVP '+
          'WHERE  '+
          '  ( EVP.IDPESSOA    = '+ CdsDadosIndividuo.FieldByName('IDPESSOA').AsString    +' ) AND '+
          '  ( EVP.IDPLANOPREV = '+ CdsDadosIndividuo.FieldByName('IDPLANOPREV').AsString +' ) AND '+
          '  ( EVP.DATAEVENTO  = (SELECT MAX(DATAEVENTO ) FROM EVENTOSPREV EVP2 '+
          '                       WHERE ( EVP2.IDEVENTOGERADOR <> '+ IntToStr( iIdEventoDeSaldamento ) +' ) AND '+
          '                             ( EVP2.IDPESSOA    = '+ CdsDadosIndividuo.FieldByName('IDPESSOA').AsString +') AND '+
          '                             ( EVP2.IDPLANOPREV = '+ CdsDadosIndividuo.FieldByName('IDPLANOPREV').AsString +' ) ) ) ';

  If Not ExecSQL( sSQL ) Then Result := False;

End; { TSaldamentoAtivo.ReplicaEvento }


{******************************************************************************}
{ Inicio da implementação da classe TSaldamentoAssistido                       }
{ TSaldamentoAssistido }

Constructor TSaldamentoAssistido.Create;
Begin

  Inherited;

  {----------------------------------------------------------------------------}
  { Iniciar tabela de benficios minimos                                        }
  VetBeneficioMinimo[0].DataReferencia := StrToDate('31/12/2001');
  VetBeneficioMinimo[0].Valor          := 136.26;

  VetBeneficioMinimo[1].DataReferencia := StrToDate('31/12/2002');
  VetBeneficioMinimo[1].Valor          := 140.95;

  VetBeneficioMinimo[2].DataReferencia := StrToDate('31/12/2003');
  VetBeneficioMinimo[2].Valor          := 161.72;

  VetBeneficioMinimo[3].DataReferencia := StrToDate('31/12/2004');
  VetBeneficioMinimo[3].Valor          := 178.52;

  VetBeneficioMinimo[4].DataReferencia := StrToDate('31/12/2005');
  VetBeneficioMinimo[4].Valor          := 189.47;

  VetBeneficioMinimo[5].DataReferencia := StrToDate('31/12/2006');
  VetBeneficioMinimo[5].Valor          := 199.04;

End;

Destructor TSaldamentoAssistido.Destroy;
Begin
  Inherited;

End;

{------------------------------------------------------------------------------}
{ Gravar valores na tabela de parametros por pessoa                            }
Procedure TSaldamentoAssistido.GravaParamPessoa( piIdPessoa, piParameto: Integer );
Var
  sSQL : String;
Begin

  sSQL := 'INSERT INTO PESSOAPARAM '+
          '  ( IDPESSOA, IDPARAM, VALOR, DATAINICIO ) '+
          'VALUES ( '+ IntToStr( piIdPessoa )                                           +', '+
                       IntToStr( piParameto )                                           +', '+
                       QuotedStr( 'S' )                                                 +', '+
                       'TO_DATE( '+ QuotedStr( DateToStr( Date ) ) +', ''DD/MM/YYYY'')' +' ) ';
  ExecSQL( sSQL );

End;

{------------------------------------------------------------------------------}
{ Buscar dados do individuo sendo processado                                   }
Function TSaldamentoAssistido.BuscaDadosIndividuo: Boolean;
Var
  sSQL, sLinhaMatriculas : String;
Begin

  Try

    Try

      sSQL := 'SELECT '+
               '  DEP.IDTITULAR,  DEP.IDPESSOA,  DEP.MATRICULA,     '+

               '  PESB.NOME AS NOMEBENEFICIARIO, '+
               '  PEST.NOME AS NOMETITULAR,      '+

               '  ELG.DATAADMISSAO,      ELG.IDSITFUNC,                 '+

               '  PPP.IDPESSJUR,        PPP.SEQPROPOSTA,     PPP.IDPLANOPREV,     '+
               '  PPP.INSCRICAONUMERO,  PPP.INSCRICAODATA,   PPP.IDPLANOPREV AS IDPLANOORIGEM,    '+
               '  PPP.DTINICIOINSC,     PPP.IDSITPLANOPREV,  PPP.IDSITPART,       '+
               '  PPP.DATACANCELAMENTO, '+

               '  RES.VALORRESERVA AS VALORBS '+

               'FROM   '+
               '  DEPENTIT DEP,                         '+
               '  RESERVAPART RES,                      '+

               '  PESSOA PEST,       PESSOA PESB,       '+
               '  PESSOAFISICA PEFT, PESSOAFISICA PEFB, '+

               '  ELEGPATRO ELG,     PARTPREVPLAN PPP   '+

               'WHERE  '+
               '  ( DEP.MATRICULA   = '+ QuotedStr( FMatriculaIndividuo )  +' ) AND '+

               '  ( RES.IDPLANOPREV   = '+ IntToStr( iIdNovoPlano )        +' ) AND ';

              // SOL:123800 - 622476 - Daniel Begnami
              If FTipoArquivo = taPensionista Then
              Begin
                sSQL := sSQL + '  ( RES.IDTIPORESERVA  = '+ IntToStr( iIdTipoReservaRM )    +' ) AND '; // SOL:123735 - Daniel Begnami
              end
              else
              begin
                sSQL := sSQL +  '  ( RES.IDTIPORESERVA  = '+ IntToStr( iIdTipoReservaBS )    +' ) AND ';
              end;
              // FIM

              sSQL := sSQL +
               '  ( FLGDESATIVADO     = 0 ) AND  '+


               '  ( DEP.IDTITULAR     = PEST.IDPESSOA )    AND '+
               '  ( DEP.IDPESSOA      = PESB.IDPESSOA )    AND '+

               '  ( DEP.IDTITULAR     = PEFT.IDPESSOA )    AND '+
               '  ( DEP.IDPESSOA      = PEFB.IDPESSOA )    AND '+

               '  ( ELG.IDPESSJUR     = 91008         )    AND '+
               '  ( DEP.IDTITULAR     = ELG.IDPESSOA  )    AND  '+

               '  ( ELG.IDPESSJUR     = PPP.IDPESSJUR )    AND '+
               '  ( DEP.IDTITULAR     = PPP.IDPESSOA  )    AND '+

                ' ( PPP.IDPESSJUR     = RES.IDPESSJUR      ) AND '+
               '  ( DEP.IDPESSOA      = RES.IDPESSOA       ) AND '+
               '  ( PPP.SEQPROPOSTA   = RES.SEQPROPOSTA    ) AND '+
               '  ( PPP.IDPESSOA      = RES.IDPARTICIPANTE )     '+

               'ORDER BY '+
               '  DEP.IDTITULAR, DEP.IDPESSOA ';

      CdsDadosIndividuo.Data := GetDataPacket( sSQL );

      If ( CdsDadosIndividuo.IsEmpty = True ) Then Abort;

      Result := True;

    Except

      On E:Exception Do Begin

        sMensagemDeErro := E.Message;

        If ( sMensagemDeErro = 'Operation aborted' ) Then sMensagemDeErro := 'Dados da matricula não encontrada.';

        Result := False;
      End;

    End;

  Finally

  End;

End; { TSaldamentoAssistido.BuscaDadosIndividuo }

{------------------------------------------------------------------------------}
{ Executa processo de saldamento de assistido                                  }
Function TSaldamentoAssistido.Processar: Boolean;
Begin

  iFiller := 1;
  sAnoMesLoteProcesso := FormatDateTime( 'YYYY/MM', Date );

  iIdLoteProcesso     := SelecionaLoteBeneficioAbertoFuncef( sAnoMesLoteProcesso, iFiller, iIdFundacao );

  sDataLoteProcesso := RetornaDadosLote;

  If ( iIdLoteProcesso = -1 ) Or ( Trim( sDataLoteProcesso ) = '' ) Then Exit;

  Inherited Processar;

End;


{------------------------------------------------------------------------------}
{ Executa processo de saldamento de assistido para um individuo                }
Function TSaldamentoAssistido.ProcessarIndividuo: Boolean;
Begin

  Try

    Result := False;

    If ( Not Inherited ProcessarIndividuo ) Then Begin

      Exit;

    End;

    { Busca dos dados para usar no processo }

    IniciarProcessoIndividuo;

    If Not BuscaDadosIndividuo Then Begin

      sMensagemDeErro := 'Erro na matricula '+ FMatriculaIndividuo +'. Mensagem: '+ sMensagemDeErro;

      GravaNoDemonstrativo( sMensagemDeErro );
      GravaNoDemonstrativo( ' ' );

      If ( FTipoProcesso = TpLote ) Then Begin
        GravaNoDemonstrativo( FMatriculaIndividuo + '   ERRO: '+ sMensagemDeErro );
      End Else Begin
        MsgDlg(sMensagemDeErro , 'Erro', mtError, [mbOk], 0);
      End;

      Exit;

    End;

    // Daniel Begnami Sol: 96526, 97976 e 93782
    SetaPessoaParam(CdsDadosIndividuo.FieldByName('IDPESSOA').AsString);
    // Fim

    If ( Not PassouElegibilidade ) Then Begin

      sMensagemDeErro := 'Matricula '+ FMatriculaIndividuo +' não passou na elegibilidade. Mensagem: '+ sMensagemDeErro;

      GravaNoDemonstrativo( sMensagemDeErro );
      GravaNoDemonstrativo( ' ' );

      If ( FTipoProcesso = TpLote ) Then Begin
        GravaNoDemonstrativo( FMatriculaIndividuo + '   ERRO: '+ sMensagemDeErro );
      End Else Begin
        MsgDlg(sMensagemDeErro , 'Erro', mtError, [mbOk], 0);
      End;

      Exit;

    End;

    { Identifica o tipo de participante }
    SetaTipoParticipante;

    { Processar inscrições }
    If ( FSomenteFinanceiro = False ) And ( Not ProcessarInscricoes ) Then Begin

      GravaNoDemonstrativo( 'ERRO AO GRAVAR DADOS DOS PLANOS DA MATRICULA -> '+ FMatriculaIndividuo +' COM A MENSAGEM: '+ sMensagemDeErro );
      GravaNoDemonstrativo( ' ' );
      Exit;

    End;

    { Processar eventos }
    If ( FSomenteFinanceiro = False ) And ( Not ProcessarEventos ) Then Begin

      GravaNoDemonstrativo( 'ERRO AO GRAVAR DADOS DOS EVENTOS DA MATRICULA -> '+ FMatriculaIndividuo +' COM A MENSAGEM: '+ sMensagemDeErro );
      GravaNoDemonstrativo( ' ' );
      Exit;

    End;

    Result := True;

  Except


  End;

End;

{------------------------------------------------------------------------------}
{ Executa alterações na inscrição do Assistido (PARTPREVPLAN)                  }
Function TSaldamentoAssistido.ProcessarInscricoes: Boolean;

  {----------------------------------------------------------------------------}
  { Verifica se associado é REB puro ou seja não possui REPLAN                 }
  Function EhREBPuro( piIdBeneficiario : Integer ): Boolean;
  Var
    sSQL : String;
  Begin

    Try

      Result := False;

      sSQL := 'SELECT '+
              '  1 '+
              'FROM   '+
              '  PARTPREVPLAN PPP '+
              'WHERE  '+
              '      PPP.IDPESSJUR     = '+ CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString    +
              '  AND PPP.IDPLANOPREV   = '+ '2' +
              '  AND PPP.IDPESSOA      = '+ IntToStr( piIdBeneficiario )                           +
              '  AND PPP.SEQPROPOSTA   = '+ CdsDadosIndividuo.FieldByName('SEQPROPOSTA').AsString    ;

      CdsSaldamentoAux.Data := GetDataPacket( sSQL );

      If ( Not CdsSaldamentoAux.IsEmpty ) Then Exit;

      Result := True;

    Except

      sMensagemDeErro := MessageInfo;
      Result := False;

    End;

  End; { Function EhREBPuro( }
  {----------------------------------------------------------------------------}

Var
  sSQL : String;
  iIdSitpart : Integer;
  bAchouReplan : Boolean;
Begin

  Result := False;

  Try

    Inherited ProcessarInscricoes;

    { Caso participante seja REPLAN, atualizar situação no plano ()  para saldado.           }
    If ( CdsDadosIndividuo.FieldByName('IDPLANOPREV').AsInteger = 2 ) Then Begin

      sSQL := 'UPDATE  PARTPREVPLAN SET IDSITPLANOPREV = '+ IntToStr( iIdSitPlanoSaldado )       +' ' +
              'WHERE   IDPESSJUR   = '+ CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString      +
              '  AND   IDPLANOPREV = '+ CdsDadosIndividuo.FieldByName('IDPLANOPREV').AsString    +
              '  AND   IDPESSOA    = '+ CdsDadosIndividuo.FieldByName('IDTITULAR').AsString +
              '  AND   SEQPROPOSTA = '+ CdsDadosIndividuo.FieldByName('SEQPROPOSTA').AsString ;

      If Not ExecSQL( sSQL ) Then Abort;


    End Else Begin
      { Caso participante seja REB;                                              }
      {   Cancelar REB                                                           }
      {   Reativar REPLAN                                                        }

      {--------------------------------------------------------------------------}
      { Cancelamento do REB                                                      }

      sSQL := 'UPDATE  PARTPREVPLAN SET FLGDESATIVADO    = 1, '+
              '                         IDSITPLANOPREV   = 3, '+
              '                         DATACANCELAMENTO = TO_DATE('''+ DateToStr( StrToDate( sDataEvento )- 1)+''',''DD/MM/YYYY'') '+ 
              'WHERE   IDPESSJUR   = '+ CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString       +
              '  AND   IDPLANOPREV = '+ CdsDadosIndividuo.FieldByName('IDPLANOPREV').AsString     +
              '  AND   IDPESSOA    = '+ CdsDadosIndividuo.FieldByName('IDTITULAR').AsString       +
              '  AND   SEQPROPOSTA = '+ CdsDadosIndividuo.FieldByName('SEQPROPOSTA').AsString ;

      If Not ExecSQL( sSQL ) Then Abort;

      {------------------------------------------------------------------------}
      { Ativação ou Reativação do REPLAN                                       }

      { Caso participante seja "REB puro". Inscrever  no REPLAN                }
      If ( EhRebPuro( CdsDadosIndividuo.FieldByName('IDTITULAR').AsInteger ) ) Then Begin  

        sSQL := '  INSERT INTO PARTPREVPLAN( '+
                '         IDPESSJUR,         IDPLANOPREV,    IDPESSOA,          SEQPROPOSTA,        '+
                '         IDSITPART ,        IDSITPLANOPREV, INSCRICAONUMERO,   INSCRICAODATA,      '+
                '         INSCRICAOTIPO,     SALINSCRICAO,   SALPARTICIPACAO,   SALMANTIDO,         '+
                '         SALVINCULADO,      VALORCALCINSS,  FLGDEVEEMPRESTIMO, FLGDEVEASSISTENC,   '+
                '         FLGDEVEPREVIDENC,  VALORINFINSS,   SALAUXDOENCA,                          '+
                '         DATAINICIOSITTEMP, DATAFIMSITTEMP, DATAINICIOMANUT,   REQUERIMENTODATA,   '+
                '         DTINICIOINSC, FLGFITESPECIAL                              ) '+
                ' SELECT                                                                            '+
                '         IDPESSJUR,         '+IntToStr( iIdNovoPlano )+',   IDPESSOA,          SEQPROPOSTA,        '+
                '         IDSITPART ,        '+CdsDadosIndividuo.FieldByName('IDSITPLANOPREV').AsString+','+
                CdsDadosIndividuo.FieldByName('INSCRICAONUMERO').AsString +','+
                '         TO_DATE('''+ sDataEvento +''',''DD/MM/YYYY''),                       '+
                '         INSCRICAOTIPO,     SALINSCRICAO,   SALPARTICIPACAO,   SALMANTIDO,         '+
                '         SALVINCULADO,      VALORCALCINSS,  FLGDEVEEMPRESTIMO, FLGDEVEASSISTENC,   '+
                '         FLGDEVEPREVIDENC,  VALORINFINSS,   SALAUXDOENCA,                          '+
                '         DECODE(DATAINICIOSITTEMP, NULL, NULL, TO_DATE('''+ sDataEvento +''',''DD/MM/YYYY'') ), '+
                '         DECODE(DATAFIMSITTEMP,    NULL, NULL, TO_DATE('''+ sDataEvento +''',''DD/MM/YYYY'') ), '+
                '         DECODE(DATAINICIOMANUT,   NULL, NULL, TO_DATE('''+ sDataEvento +''',''DD/MM/YYYY'') ), '+
                '         SYSDATE,                     '+
                '         DTINICIOINSC, FLGFITESPECIAL '+
                ' FROM    PARTPREVPLAN                                                           '+
                ' WHERE   IDPESSJUR   = '+ CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString    +
                ' AND     IDPLANOPREV = '+ CdsDadosIndividuo.FieldByName('IDPLANOPREV').AsString  +
                ' AND     IDPESSOA    = '+ CdsDadosIndividuo.FieldByName('IDTITULAR').AsString    + 
                ' AND     SEQPROPOSTA = '+ CdsDadosIndividuo.FieldByName('SEQPROPOSTA').AsString ;


        If Not ExecSQL( sSQL ) Then Abort;

      End;

      { Atualização do REPLAN                                                  }
      sSQL := 'UPDATE  PARTPREVPLAN SET FLGDESATIVADO    = 0, '+
              '                         IDSITPLANOPREV   = '+ IntToStr( iIdSitPlanoSaldado )+', ' +
              '                         DATACANCELAMENTO = NULL '+
              'WHERE   IDPESSJUR   = '+ CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString      +
              '  AND   IDPLANOPREV = 2 '+
              '  AND   IDPESSOA    = '+ CdsDadosIndividuo.FieldByName('IDTITULAR').AsString      +
              '  AND   SEQPROPOSTA = '+ CdsDadosIndividuo.FieldByName('SEQPROPOSTA').AsString ;

      If Not ExecSQL( sSQL ) Then Abort;

      Result := True;

    End; { If ( CdsDadosIndividuo.FieldByName('IDPLANOPREV').AsInteger = 2 ) Then Begin }

  Except

    sMensagemDeErro := MessageInfo;

    Result := False;
    Exit;

  End;

  Result := True;

End; { PROCESSARINSCRICOES }

{------------------------------------------------------------------------------}
{ Executa alterações nas tabelas de evento para assistidos (EVENTOSPREV)       }
Function TSaldamentoAssistido.ProcessarEventos: Boolean;
Begin

  Result := False;

  If ( Not Inherited ProcessarEventos ) Then Begin

    Exit;

  End;

  Result := True;

End; { PROCESSAREVENTOS }

{------------------------------------------------------------------------------}
{ Executa alterações nas tabelas de evento para assistidos (EVENTOSPREV)       }
Function TSaldamentoAssistido.ProcessarRubricaPeculio( piIdPessoa : Integer ) : Boolean;
Var
  dValor : Double;
Begin

  Result := False;

  dValor := RetornaValorReserva( piIdPessoa, 122 );
  If ( dValor > 0 )
  Then InsereRubricaIndiv( piIdPessoa, 38797, -1, 1, -1, dValor );                       { Pecúlio Saldamento     }

  dValor := RetornaValorReserva( piIdPessoa, 123 );
  If ( dValor > 0 )
  Then InsereRubricaIndiv( piIdPessoa, 38805, -1, 1, -1, dValor );                       { Pecúlio REB            }

  Result := True;

End; { TSaldamentoAssistido.ProcessarRubricaPeculio }

{------------------------------------------------------------------------------}
{ Executa alterações nas tabelas de beneficio (BENEFBFCIARIO)                  }
Function TSaldamentoAssistido.ProcessarBeneficios( piIdPessoa : Integer ): Boolean;

  {----------------------------------------------------------------------------}
  { Retorna i identificador do beneficio referento no Saldamento               }
  Function DeParaBeneficio( piIdBeneficio : Integer; bEhRA : Boolean; Var piIdBeneficioReplan, piIdNumeroProcesso  : Integer ) : Integer;
  Var
    sSQL, sDataInicio : String;
    iIdSitBeneficio : Integer;
  Begin

    Result := -1;

    piIdBeneficioReplan := piIdBeneficio;

    { Renda Antecipada }
    If ( bEhRA = True ) Then Begin

      Case piIdBeneficio Of
        495 : Result := 506;
        503 : Result := 508;
        504 : Result := 509;
        505 : Result := 507;
      End;

      If ( FTipoArquivo = taPensionista ) Then Result := 515;

      { RA REB 319 }
      If ( piIdBeneficio = 319 ) Then Begin

        piIdBeneficioReplan := -1;
        RetornaDadosReplan( CdsDadosIndividuo.FieldByName('IDPESSOA').AsInteger, sDataInicio, sFiller, sFiller,
                            piIdBeneficioReplan, iIdSitBeneficio, iFiller, dFiller, bEhRA  );

        Case piIdBeneficioReplan Of
           -1 : Result := 506;
          149 : Result := 506;
          154 : Result := 507;
          156 : Result := 508;
        End;

      End;

      { RA REB 320 }
      If ( piIdBeneficio = 327 ) Then Begin

        Result := 509;

      End;

      Exit;

    End Else Begin

      Case piIdBeneficio Of
        149 : Result := 495;
        154 : Result := 505;
        159 : Result := 504;
        156 : Result := 503;
        164 : Result := 496;
        338 : Result := 497;

        { REB }
        324: Result := 496;
        325: Result := 497;
        328: Result := 504;
        329: Result := 504;
      End;

      Case piIdBeneficio Of
        328: piIdBeneficioReplan := 159;
      End;


      { Caso REB partilhados }
      If ( piIdBeneficio = 320 ) Then Begin

        piIdBeneficioReplan := -1;
        RetornaDadosReplan( CdsDadosIndividuo.FieldByName('IDPESSOA').AsInteger, sDataInicio, sFiller, sFiller,
                            piIdBeneficioReplan, iIdSitBeneficio, iFiller, dFiller, False  );

        Case piIdBeneficioReplan Of
           -1 : Result := 495;
          156 : Result := 503;
          154 : Result := 505;
          149 : Result := 495;
        End;

      End;

      Exit;

    End;


    sSQL := 'SELECT '+
            '  BEN.IDBENEFDEST '+
            'FROM   '+
            '  BENEFTRANSFPLANO BEN '+
            'WHERE  '+
            '  BEN.IDEVENTOGERADOR = '+ IntToStr( iIdEventoDeSaldamento )                     +' AND '+
            '  BEN.IDPLANOORIGEM   = '+ CdsDadosIndividuo.FieldByName('IDPLANOPREV').AsString +' AND '+
            '  BEN.IDBENEFORIGEM   = '+ IntToStr( piIdBeneficio )                             +' AND '+
            '  BEN.IDPLANODEST     = '+ IntToStr( iIdNovoPlano );

    CdsSaldamentoAux.Data := GetDataPacket( sSQL );

    If ( Not CdsSaldamentoAux.IsEmpty ) Then Begin

      Result := CdsSaldamentoAux.FieldByName('IDBENEFDEST').AsInteger;

    End;

  End; { Function DeParabeneficio(  }
  {----------------------------------------------------------------------------}

  {----------------------------------------------------------------------------}
  { Encerrar os beneficios atuais                                              }
  Function EncerraBeneficio( CdsInterno : TCMClientDataSet;
                             piNumeroProcesso, piIdBeneficiario, piIdBeneficio : Integer ): Boolean;
  Var
    sAnoMesInicioExclusao, sSQL : String;

  Begin

    Try

      Result := True;

      sSQL := 'UPDATE BENEFBFCIARIO SET '+
              '  IDSITBENEFICIO = 3,   '+
              '  DATAFINAL      = TO_DATE(''' + DateToStr( StrToDate( sDataEvento )- 1) + ''',''DD/MM/YYYY'') ' +
              'WHERE  '+
              '      IDPESSJUR     = '+ CdsInterno.FieldByName('IDPESSJUR').AsString      +
              '  AND IDPLANOPREV   = '+ CdsInterno.FieldByName('IDPLANOPREV').AsString    +
              '  AND IDTITULAR     = '+ CdsInterno.FieldByName('IDTITULAR').AsString      +
              '  AND IDPESSOA      = '+ IntToStr( piIdBeneficiario )                      +
              '  AND SEQPROPOSTA   = '+ CdsInterno.FieldByName('SEQPROPOSTA').AsString    +
              '  AND IDBENEFICIO   = '+ IntToStr( piIdBeneficio ) +
              '  AND IDSITBENEFICIO = 1';

      If ( Not ExecSQL( sSQL ) ) Then Abort;

      If ( CdsInterno.FieldByName('DATAINICIO').AsDateTime < StrToDate( '01/09/2001' ) )
      Then sAnoMesInicioExclusao := FormatDateTime( 'YYYY/MM', StrToDate( '01/09/2001' ) )
      Else sAnoMesInicioExclusao := FormatDateTime( 'YYYY/MM', CdsInterno.FieldByName('DATAINICIO').AsDateTime );


      sSQL := 'DELETE HSTBENEFBFCIARIO '+
              'WHERE  '+
              '      IDPESSJUR      = '+ CdsInterno.FieldByName('IDPESSJUR').AsString      +
              '  AND IDPLANOPREV    = '+ CdsInterno.FieldByName('IDPLANOPREV').AsString    +
              '  AND IDTITULAR      = '+ CdsInterno.FieldByName('IDTITULAR').AsString      +
              '  AND IDPESSOA       = '+ IntToStr( piIdBeneficiario )                             +
              '  AND SEQPROPOSTA    = '+ CdsInterno.FieldByName('SEQPROPOSTA').AsString    +
              '  AND IDBENEFICIO    = '+ IntToStr( piIdBeneficio )          +
              '  AND MESREFERENCIA >= '+ QuotedStr( sAnoMesInicioExclusao ) +
              '  AND FLGENVIADO     = 0'+
              '  AND NVL(VLBENEFPGTO,0) = 0';

      If ( Not ExecSQL( sSQL ) ) Then Abort;

      sSQL := 'DELETE HSTATRASOCONTRIB WHERE NUMRECEBIMENTO IN '+
              ' ( SELECT NUMRECEBIMENTO FROM HSTCONTRIBPREV  '+
              '   WHERE  '+
              '        IDPESSJUR      = '+ CdsInterno.FieldByName('IDPESSJUR').AsString      +
              '    AND IDPLANOPREV    = '+ CdsInterno.FieldByName('IDPLANOPREV').AsString    +
              '    AND IDPESSOA       = '+ IntToStr( piIdBeneficiario )                             +
              '    AND MESREFERENCIA >= '+ QuotedStr( sAnoMesInicioExclusao ) +
              '    AND IDLOTE        <> '+ IntToStr( iIdLoteProcesso )                              +
              '    AND SITRECEBIMENTO = 0'+
              '    AND NVL(VALORRECEBIDO,0) = 0 ) ';

      If ( Not ExecSQL( sSQL ) ) Then Abort;


      sSQL := 'SELECT 1 FROM HSTCONTRIBPREV  '+
              'WHERE  '+
              '      IDPESSJUR      = '+ CdsInterno.FieldByName('IDPESSJUR').AsString      +
              '  AND IDPLANOPREV    = '+ CdsInterno.FieldByName('IDPLANOPREV').AsString    +
              '  AND IDPESSOA       = '+ IntToStr( piIdBeneficiario )                      +
              '  AND MESREFERENCIA >= '+ QuotedStr( sAnoMesInicioExclusao ) +
              '  AND IDLOTE        <> '+ IntToStr( iIdLoteProcesso )                       +
              '  AND SITRECEBIMENTO = 0'+
              '  AND NVL(VALORRECEBIDO,0) = 0';

      CdsSaldamentoAux.Data := GetDataPacket( sSQL );

      If ( Not CdsSaldamentoAux.IsEmpty ) Then Begin

        sSQL := 'DELETE HSTCONTRIBPREV  '+
                'WHERE  '+
                '      IDPESSJUR      = '+ CdsInterno.FieldByName('IDPESSJUR').AsString      +
                '  AND IDPLANOPREV    = '+ CdsInterno.FieldByName('IDPLANOPREV').AsString    +
                '  AND IDPESSOA       = '+ IntToStr( piIdBeneficiario )                      +
                '  AND MESREFERENCIA >= '+ QuotedStr( sAnoMesInicioExclusao ) +
                '  AND IDLOTE        <> '+ IntToStr( iIdLoteProcesso )                       +
                '  AND SITRECEBIMENTO = 0'+
                '  AND NVL(VALORRECEBIDO,0) = 0';

        If ( Not ExecSQL( sSQL ) ) Then Abort;

      End;

      sSQL := 'SELECT '+
              '  BFB.NUMEROPROCESSO '+
              'FROM   '+
              '  BENEFBFCIARIO BFB '+
              'WHERE  '+
              '  BFB.NUMEROPROCESSO = '+  IntToStr( piNumeroProcesso ) +' AND '+
              '  BFB.IDSITBENEFICIO <> 3 ';

      CdsSaldamentoAux.Data := GetDataPacket( sSQL );

      { Cancelar processo antigo }
      If ( CdsSaldamentoAux.IsEmpty ) Then Begin

        sSQL := 'UPDATE PROCESSOBENEF SET IDSITPROCESSO = 3 '+
                'WHERE NUMEROPROCESSO = '+ IntToStr( piNumeroProcesso ) +' ';

      If Not ExecSQL( sSQL ) Then Abort;

    End;

      Result := True;

    Except

      sMensagemDeErro := MessageInfo;
      Result := False;

    End;

  End; { Function EncerraBeneficio( }
  {----------------------------------------------------------------------------}

  {----------------------------------------------------------------------------}
  { Reativar os beneficios antigos                                             }
  Function ReativaBeneficio( CdsInterno : TCMClientDataSet;
                             piIdBeneficiario, piIdBeneficio, piIdSitBeneficio : Integer;
                             psDataFinal : String): Integer;

    Function DeParaValorBase( CdsInterno : TCMClientDataSet;
                              piTipoBase, piIdBeneficio : Integer ) : Double;
    Begin

      If ( piTipoBase = 1 ) Then Begin

        If ( piIdBeneficio in [ 191, 192, 193, 195, 157, 148, 163, 168, 166, 169 ] )
        Then Result := CdsInterno.FieldByName('VALORBASE2').AsFloat
        Else Result := CdsInterno.FieldByName('VALORBASE1').AsFloat;

      End Else Begin

        If ( piIdBeneficio in [ 191, 192, 193, 195, 157, 148, 163, 168, 166, 169 ] )
        Then Result := CdsInterno.FieldByName('VALORBASE1').AsFloat
        Else Result := CdsInterno.FieldByName('VALORBASE2').AsFloat;


      End;

    End;

  Var
    sSQL : String;
    iNumeroProcesso : Integer;
    dValorBase1, dValorBase2 : Double;
  Begin

    Try

      Result := -1;
      iNumeroProcesso := -1;

      //dValorBase1 := DeParaValorBase( CdsInterno, 1, piIdBeneficio );
      //dValorBase2 := DeParaValorBase( CdsInterno, 2, piIdBeneficio );


      If ( FTipoArquivo = taPensionista ) And
         ( CdsInterno.FieldByName('IDRESPONSAVEL').AsInteger <> CdsInterno.FieldByName('IDPESSOA').AsInteger) 
      Then Begin

        { BFCIARIOTITPLAN }
        sSQL := 'UPDATE BFCIARIOTITPLAN SET '+
                '  IDRESPONSAVEL =  '+ CdsInterno.FieldByName('IDRESPONSAVEL').AsString +' '+
                'WHERE  '+
                '      IDPESSJUR     = '+ CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString      +
                '  AND IDPLANOPREV   = '+ IntToStr( iIdNovoPlano ) +
                '  AND IDTITULAR     = '+ CdsDadosIndividuo.FieldByName('IDTITULAR').AsString      +
                '  AND IDPESSOA      = '+ IntToStr( piIdBeneficiario )                             +
                '  AND SEQPROPOSTA   = '+ CdsDadosIndividuo.FieldByName('SEQPROPOSTA').AsString    +
                '  AND IDBENEFICIO   = '+ IntToStr( piIdBeneficio );

        If Not ExecSQL( sSQL ) Then Abort;

      End; { If ( FTipoArquivo = taPensionista ) }

      { BENEFBFCIARIO }
      sSQL := 'UPDATE BENEFBFCIARIO SET '+
              '  IDPLANPREVCONTAB =  '+ IntToStr( iIdPlanoContabil ) +' , '+
              '  IDSITBENEFICIO =  '+ IntToStr( piIdSitBeneficio )   +' , '+
              '  DATAFINAL      =  TO_DATE(' + QuotedStr(  psDataFinal  ) + ',''DD/MM/YYYY''), ' +
              '  DATAINICIOFUND = NVL( DATAINICIOFUND, NVL( DATAINICIO, DATAREQUERIMENTO ) ), '+
              '  VLRINFINSS     = '+ OraNumero( CdsInterno.FieldByName('VLRINFINSS').AsString )     +', '+
              '  DIBBENEFANT    =  TO_DATE(' + QuotedStr( CdsInterno.FieldByName('DIBBENEFANT').AsString ) + ',''DD/MM/YYYY''), ' +
              '  ULTMESPREPARO  = '+ QuotedStr( CdsInterno.FieldByName('ULTMESPREPARO').AsString )  +', '+
              '  ULTMESREAJUSTE = '+ QuotedStr( CdsInterno.FieldByName('ULTMESREAJUSTE').AsString ) +', '+
              '  VALORATUAL     = '+ OraNumero( CdsInterno.FieldByName('VALORATUAL').AsString )     +', '+
              '  VALORBENEFANT  = '+ OraNumero( CdsInterno.FieldByName('VALORBENEFANT').AsString )  +', '+
              '  VALORTOTAL     = '+ OraNumero( CdsInterno.FieldByName('VALORTOTAL').AsString )     +', '+
              '  VALORCALCULADO = '+ OraNumero( CdsInterno.FieldByName('VALORCALCULADO').AsString ) +', '+
              '  DATAINICIOINSS = TO_DATE(' + QuotedStr( CdsInterno.FieldByName('DATAINICIOINSS').AsString ) + ',''DD/MM/YYYY'') ' +
              'WHERE  '+
              '      IDPESSJUR     = '+ CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString      +
              '  AND IDPLANOPREV   = '+ IntToStr( iIdNovoPlano ) +
              '  AND IDTITULAR     = '+ CdsDadosIndividuo.FieldByName('IDTITULAR').AsString      +
              '  AND IDPESSOA      = '+ IntToStr( piIdBeneficiario )                             +
              '  AND SEQPROPOSTA   = '+ CdsDadosIndividuo.FieldByName('SEQPROPOSTA').AsString    +
              '  AND IDBENEFICIO   = '+ IntToStr( piIdBeneficio );

      If Not ExecSQL( sSQL ) Then Abort;

      sSQL := 'SELECT NUMEROPROCESSO, IDBENEFICIO, DATAINICIO, DATAFINAL, VALORATUAL, VALORTOTAL '+
              'FROM BENEFBFCIARIO '+
              'WHERE  '+
              '      IDPESSJUR     = '+ CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString      +
              '  AND IDPLANOPREV   = '+ IntToStr( iIdNovoPlano ) +
              '  AND IDTITULAR     = '+ CdsDadosIndividuo.FieldByName('IDTITULAR').AsString      +
              '  AND IDPESSOA      = '+ IntToStr( piIdBeneficiario )                             +
              '  AND SEQPROPOSTA   = '+ CdsDadosIndividuo.FieldByName('SEQPROPOSTA').AsString    +
              '  AND IDBENEFICIO   = '+ IntToStr( piIdBeneficio ) +' ';

      CdsSaldamentoAux .Data := GetDataPacket( sSQL );

      If ( Not CdsSaldamentoAux.IsEmpty ) Then Begin

        iNumeroProcesso := CdsSaldamentoAux.FieldByName('NUMEROPROCESSO').AsInteger;

        sSQL := 'UPDATE PROCESSOBENEF SET IDSITPROCESSO = 1 '+
                'WHERE NUMEROPROCESSO = ' + IntToStr( iNumeroProcesso );

        If Not ExecSQL( sSQL ) Then Abort;

        { Movimento de reativação }
        iIdUltMovBenef := IncluiMovBenef( CdsSaldamentoAux.FieldByName('NUMEROPROCESSO').AsInteger,
                                          CdsSaldamentoAux.FieldByName('IDBENEFICIO').AsInteger,
                                          piIdBeneficiario,
                                          iIdNovoPlano,
                                          1, 7,
                                          CdsSaldamentoAux.FieldByName('DATAINICIO').AsString,
                                          CdsSaldamentoAux.FieldByName('DATAFINAL').AsString,
                                          CdsSaldamentoAux.FieldByName('VALORATUAL').AsFloat,
                                          CdsSaldamentoAux.FieldByName('VALORTOTAL').AsFloat );

      End Else Begin

        InsereBeneficio( CdsInterno,
                         piIdBeneficiario,
                         piIdBeneficio,
                         piIdBeneficio,
                         False, False,
                         iNumeroProcesso,
                         tbINSS );

      End;

      Result := iNumeroProcesso;

    Except

      sMensagemDeErro := MessageInfo;

      Result := -1;

    End;

  End; { Function ReativaBeneficio( }
  {----------------------------------------------------------------------------}

  {----------------------------------------------------------------------------}
  { Encerrar os beneficios atuais                                              }
  Function JahPossuiRA( piIdBeneficiario : Integer ): Boolean;
  Var
    sSQL : String;
  Begin

    Try

      Result := False;

      sSQL := 'SELECT '+
              '  1 '+
              'FROM   '+
              '  BENEFBFCIARIO BEN '+
              'WHERE  '+
              '    BEN.IDPESSJUR       = '+ CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString      +
              '  AND BEN.IDPLANOPREV   = '+ CdsDadosIndividuo.FieldByName('IDPLANOPREV').AsString    +
              '  AND BEN.IDTITULAR     = '+ CdsDadosIndividuo.FieldByName('IDTITULAR').AsString      +
              '  AND BEN.IDPESSOA      = '+ IntToStr( piIdBeneficiario )                             +
              '  AND BEN.SEQPROPOSTA   = '+ CdsDadosIndividuo.FieldByName('SEQPROPOSTA').AsString    +
              '  AND BEN.IDBENEFICIO IN ( 319, 327 )';

      CdsSaldamentoAux.Data := GetDataPacket( sSQL );

      If ( CdsSaldamentoAux.IsEmpty ) Then Exit;

      Result := True;

    Except

      sMensagemDeErro := MessageInfo;
      Result := False;

    End;

  End; { Function JahPossuiRA( }
  {----------------------------------------------------------------------------}

Var
  sSQL, sFlgTipoRegistro : String;

  sUltMesPreparo  : String;

  iIdBeneficioOrigem, iIdBeneficioDestino,
  iIdentificadorHistorico,
  iPercentual, iIdBeneficioReplan, iIdSitPart, iIdSitBeneficio, iNumeroProcesso : Integer;
  bEhDiferencaRA : Boolean;

  tbTipoBeneficio : TTipoBeneficio;

  dValorReservaAT49, dValorReservaAT83, dValorDiferencaTabuas, dValorContribuicao,
  dValorPago, dValorAtualizaBeneficio : Double;

Begin

  Try

    Result := False;

    sSQL := 'SELECT '+

            '  BFT.IDBENEFICIO,    BFT.IDRESPONSAVEL, BFT.PERCENTUAL, '+
            '  BPP.FLGREFERENCIA, '+
            '  DPT.IDDEPENDENCIA, '+
            '  B.FLGRESGATE,      '+

            '  BFB.IDPESSOA,       BFB.IDPESSJUR,      BFB.SEQPROPOSTA,   BFB.IDPLANOORIGEM,  '+
            '  BFB.NUMEROPROCESSO, BFB.DATAFINAL,      BFB.NUMEROPROCESSO, '+
            '  BFB.IDPLANOPREV,    BFB.FONTEPAGADORA,  BFB.IDSITBENEFICIO, '+
            '  BFB.ULTMESPREPARO,  BFB.ULTMESREAJUSTE, BFB.VALORATUAL,    BFB.VALORTOTAL,     '+
            '  BFB.DATAINICIOFUND, BFB.DATAINICIO,     BFB.CODPORTFORMA,  BFB.FLGPROVISORIO,  '+
            //  BFB.PERCENTUAL, // Ádler Souza - Sol 141310/2261 - KTN 905777
            '  BFB.FONTEPAGADORA,  BFB.VLRINFINSS,    BFB.DIBBENEFANT,    '+
            '  BFB.VALORCALCULADO, BFB.DATAINICIOINSS, BFB.VALORBENEFANT, BFB.IDTITULAR,      '+

            '  NVL( BFP.VALORBASE1,  BFB.VALORBASE1 ) AS VALORBASE1, '+
            '  NVL( BFP.VALORBASE2,  BFB.VALORBASE2 ) AS VALORBASE2, '+
            '  NVL( BFP.VALORBASE3,  BFB.VALORBASE3 ) AS VALORBASE3  '+

            'FROM   '+
            '  BFCIARIOTITPLAN BFT, BENEFBFCIARIO BFB, BENEFPLANOPART BFP, BENEFPLANPREV BPP, BENEFICIO B, '+
            '  PESSOAFISICA PSF,    DEPENTIT DPT '+
            'WHERE  '+
            '      ( BFT.IDPESSJUR     = '+ CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString + ' ) '+
            '  AND ( B.FLGPECULIO    = 0 ) ';
            //'  AND ( B.FLGRESGATE    = 0 ) ';

    If ( FSomenteFinanceiro = True ) Or ( FSomenteBUA = True ) Then Begin

      sSQL := sSQL + '  AND ( BPP.FLGREFERENCIA = 0 ) ';

    End;

    If ( FSomenteFinanceiro = True ) And ( FSomenteDiferencaRA = False ) Then Begin

      sSQL := sSQL + '  AND ( B.FLGRESGATE    = 0 ) ';

    End;

    { Quando somente diferenca de RA não filtrar opr plano pois RA esta no REB e estamos }
    { processando com os dados do REPLAN.                                                }

    If ( FSomenteDiferencaRA = True ) Then Begin

      sSQL := sSQL + '  AND ( B.FLGRESGATE    = 1 ) '+
                     '  AND BFT.IDPLANOPREV   <> '+ CdsDadosIndividuo.FieldByName('IDPLANOPREV').AsString;    

    End Else Begin

      If ( FTipoArquivo = taAposentado )
      Then sSQL := sSQL +
              '  AND BFT.IDPLANOPREV   = '+ CdsDadosIndividuo.FieldByName('IDPLANOPREV').AsString    +
              '  AND BFT.IDPLANOORIGEM = '+ CdsDadosIndividuo.FieldByName('IDPLANOORIGEM').AsString
      Else sSQL := sSQL +
              '  AND BFB.IDSITBENEFICIO = 1 '+
              '  AND BFT.IDPLANOPREV    = '+ CdsDadosGrupoFamiliar.FieldByName('IDPLANOPREV').AsString    +
              '  AND BFT.IDPLANOORIGEM  = '+ CdsDadosGrupoFamiliar.FieldByName('IDPLANOORIGEM').AsString;

    End;

    //Inicio Renato visoni / SOL 89728 / Kintana 379380
    if (
        (FTipoArquivo <> taPensionista) or
         ((FTipoArquivo = taPensionista) and (CdsDadosGrupoFamiliar.Recordcount > 1)) or
         (fSomenteBUA) // Renato Visoni SOL 110446 Kintana  504655
       ) then
    begin
      sSQL := sSQL + '  AND BFT.IDPESSOA      = '+ IntToStr( piIdPessoa );
    end;
    //Fim Renato visoni

    sSQL := sSQL +
            '  AND BFT.IDTITULAR     = '+ CdsDadosIndividuo.FieldByName('IDTITULAR').AsString      +
            '  AND BFT.IDRESPONSAVEL = '+ IntToStr( iIdResponsavelProcessando )                    +
            //'  AND BFT.IDPESSOA      = '+ IntToStr( piIdPessoa )                                   +
            '  AND BFT.SEQPROPOSTA   = '+ CdsDadosIndividuo.FieldByName('SEQPROPOSTA').AsString    +

            '  AND ( BFT.IDPLANOPREV = BPP.IDPLANOPREV )  '+
            '  AND ( BFT.IDBENEFICIO = BPP.IDBENEFICIO  ) '+

            '  AND ( BFT.IDPESSOA    = PSF.IDPESSOA )     '+

            '  AND ( BFT.IDTITULAR   = DPT.IDTITULAR )    '+
            '  AND ( BFT.IDPESSOA    = DPT.IDPESSOA )     '+

            '  AND ( BPP.IDBENEFICIO = B.IDBENEFICIO  )   '+

            '  AND ( BFT.IDPESSJUR     = BFB.IDPESSJUR )     '+
            '  AND ( BFT.IDPLANOPREV   = BFB.IDPLANOPREV )   '+
            '  AND ( BFT.IDPLANOORIGEM = BFB.IDPLANOORIGEM ) '+
            '  AND ( BFT.IDTITULAR     = BFB.IDTITULAR )     '+
            '  AND ( BFT.IDPESSOA      = BFB.IDPESSOA )      '+
            '  AND ( BFT.SEQPROPOSTA   = BFB.SEQPROPOSTA )   '+
            '  AND ( BFT.IDBENEFICIO   = BFB.IDBENEFICIO )   '+

            '  AND ( BFB.IDPESSJUR      = BFP.IDPESSJUR(+) )   '+
            '  AND ( BFB.IDPLANOPREV    = BFP.IDPLANOPREV(+) ) '+
            '  AND ( BFB.IDPESSOA       = BFP.IDPESSOA(+) )    '+
            '  AND ( BFB.SEQPROPOSTA    = BFP.SEQPROPOSTA(+) ) '+
            '  AND ( BFB.IDBENEFICIO    = BFP.IDBENEFICIO(+) ) '+

            '  AND ( '+
            '       ( BFB.IDTITULAR = BFB.IDPESSOA AND IDSITBENEFICIO IN (1,2) ) OR '+
            '       ( BFB.IDTITULAR = BFB.IDPESSOA AND IDSITBENEFICIO = 3 AND ( BPP.FLGREFERENCIA = 1 OR B.FLGRESGATE = 1 ) ) OR '+
            '       ( BFB.IDTITULAR <> BFB.IDPESSOA ) '+
                        '      ) '+
            'ORDER BY '+
            '  BFB.FONTEPAGADORA DESC, B.FLGRESGATE DESC ';

    CdsSaldamento.Data := GetDataPacket( sSQL );

    iNumeroProcesso := -1;
    If ( FSomenteBUA = False ) And ( Not CdsSaldamento.IsEmpty ) Then Begin

      If ( FPercentual > 0 ) And ( FTipoArquivo <> taPensionista ) And
         ( JahPossuiRA( CdsSaldamento.FieldByName('IDPESSOA').AsInteger ) ) Then Begin

        FPercentual := 0;

      End;

      iIdBeneficioOrigem  := -1;
      While ( Not CdsSaldamento.Eof ) Do Begin

        {-----------------------------------------------------------------------}
        { INSS                                                                  }
        If ( CdsSaldamento.FieldByName('FONTEPAGADORA').AsInteger = 2 ) Then Begin

          iIdBeneficioOrigem  := CdsSaldamento.FieldByName('IDBENEFICIO').AsInteger;
          iIdBeneficioDestino := -1;

          { REPLAN, atualizar deixar como esta }
          If ( CdsSaldamento.FieldByName('IDPLANOPREV').AsInteger = 2 ) Then Begin

            sSQL := 'UPDATE BENEFBFCIARIO SET '+
                    '  IDPLANPREVCONTAB =  '+ IntToStr( iIdPlanoContabil ) +'  '+
                    'WHERE  '+
                    '      IDPESSJUR     = '+ CdsSaldamento.FieldByName('IDPESSJUR').AsString      +
                    '  AND IDPLANOPREV   = '+ CdsSaldamento.FieldByName('IDPLANOPREV').AsString    +
                    '  AND IDTITULAR     = '+ CdsSaldamento.FieldByName('IDTITULAR').AsString      +
                    '  AND IDPESSOA      = '+ CdsSaldamento.FieldByName('IDPESSOA').AsString       +
                    '  AND SEQPROPOSTA   = '+ CdsSaldamento.FieldByName('SEQPROPOSTA').AsString    +
                    '  AND IDBENEFICIO   = '+ CdsSaldamento.FieldByName('IDBENEFICIO').AsString    +
                    '  AND IDSITBENEFICIO = 1';

            If ( Not ExecSQL( sSQL ) ) Then Abort;

            CdsSaldamento.Next;
            Continue;

          End; { If ( CdsSaldamento.FieldByName('IDPLANOPREV').AsInteger = 2 ) }

          { Encerrar os beneficios atuais }
          EncerraBeneficio( CdsSaldamento,
                            CdsSaldamento.FieldByName('NUMEROPROCESSO').AsInteger,
                            CdsSaldamento.FieldByName('IDPESSOA').AsInteger,
                            CdsSaldamento.FieldByName('IDBENEFICIO').AsInteger );

          iIdUltMovBenef := IncluiMovBenef( CdsSaldamento.FieldByName('NUMEROPROCESSO').AsInteger,
                                            CdsSaldamento.FieldByName('IDBENEFICIO').AsInteger,
                                            CdsSaldamento.FieldByName('IDPESSOA').AsInteger,
                                            CdsSaldamento.FieldByName('IDPLANOPREV').AsInteger,
                                            4, 7,
                                            CdsSaldamento.FieldByName('DATAINICIO').AsString,
                                            CdsSaldamento.FieldByName('DATAFINAL').AsString,
                                            CdsSaldamento.FieldByName('VALORATUAL').AsFloat,
                                            CdsSaldamento.FieldByName('VALORTOTAL').AsFloat );

          { Não muda benficio}
          iIdBeneficioDestino := iIdBeneficioOrigem;

          { INSS REB, Reativar beneficio antigo }
          iNumeroProcesso := ReativaBeneficio( CdsSaldamento,
                                               CdsSaldamento.FieldByName('IDPESSOA').AsInteger,
                                               CdsSaldamento.FieldByName('IDBENEFICIO').AsInteger,
                                               CdsSaldamento.FieldByName('IDSITBENEFICIO').AsInteger,
                                               CdsSaldamento.FieldByName('DATAFINAL').AsString );


          If ( iNumeroProcesso = -1 ) Then Begin

            GravaNoDemonstrativo( 'NÃO ENCONTROU INSS PARA REATIVAR ' );
            GravaNoDemonstrativo( ' ' );
            Exit;

          End;
          
          { Processar acertos financeiros }
          If ( Not AcertaBeneficioSaldado( CdsSaldamento,
                                           iNumeroProcesso,
                                           CdsSaldamento.FieldByName('IDBENEFICIO').AsInteger,
                                           iIdBeneficioDestino,
                                           False,
                                           tbINSS ) )
          Then Begin

            GravaNoDemonstrativo( 'ERRO AO FAZER ACERTO FINANCEIRO DA MATRICULA  -> '+ FMatriculaIndividuo +' COM A MENSAGEM: '+ sMensagemDeErro );
            GravaNoDemonstrativo( ' ' );
            Exit;

          End;

        End Else Begin

          {--------------------------------------------------------------------}
          { SUPLEMENTAÇÃO                                                      }

          { Caso não seja acerto financeiro ou seja somente diferença de RA ,           }
          { processa todos os dados do beneficio. Caso contrario, somente o financeiro  }
          If ( FSomenteFinanceiro = False ) Or ( FSomenteDiferencaRA = True ) Then Begin

            bEhDiferencaRA := ( CdsSaldamento.FieldByName('FLGRESGATE').AsInteger = 1 );
            //bEhDiferencaRA := False;

            { DE-PARA de beneficios }
            If ( CdsSaldamento.FieldByName('IDBENEFICIO').AsInteger <> iIdBeneficioOrigem ) Then Begin

              iIdBeneficioOrigem  := CdsSaldamento.FieldByName('IDBENEFICIO').AsInteger;
              iIdBeneficioDestino := DeParaBeneficio( iIdBeneficioOrigem, bEhDiferencaRA, iIdBeneficioReplan, iFiller );

              { Tratar acerto de diferença de tábuas }
              If ( FSomenteDiferencaRA = True ) And
                 ( ( iIdBeneficioReplan = 506 ) Or ( iIdBeneficioReplan = 509 ) )
              Then Begin

                iIdBeneficioDestino   := iIdBeneficioReplan;

                iPercentual           := CdsSaldamento.FieldByName('VALORBASE1').AsInteger;

                dValorReservaAT49     := RetornaValorReserva( CdsSaldamento.FieldByName('IDPESSOA').AsInteger, 125 );
                dValorReservaAT83     := RetornaValorReserva( CdsSaldamento.FieldByName('IDPESSOA').AsInteger, 126 );

                dValorDiferencaTabuas := ( dValorReservaAT83 - dValorReservaAT49 );

                If ( FSomenteDiferencaRA = True ) And ( dValorDiferencaTabuas <= 0 ) Then Begin

                  sMensagemDeErro := 'DIFERENÇA ENTRE TÁBUAS É NEGATIVA.';
                  Result := False;
                  Exit;

                End;

                sSQL := 'SELECT NUMEROPROCESSO, ULTMESPREPARO '+
                        'FROM BENEFBFCIARIO '+
                        'WHERE  '+
                        '      IDPESSJUR     = '+ CdsSaldamento.FieldByName('IDPESSJUR').AsString      +
                        '  AND IDPLANOPREV   = '+ '2'                                                  +
                        '  AND IDTITULAR     = '+ CdsSaldamento.FieldByName('IDTITULAR').AsString      +
                        '  AND IDPESSOA      = '+ CdsSaldamento.FieldByName('IDPESSOA').AsString       +
                        '  AND SEQPROPOSTA   = '+ CdsSaldamento.FieldByName('SEQPROPOSTA').AsString    +
                        '  AND IDBENEFICIO   = '+ IntToStr( iIdBeneficioDestino );

                CdsSaldamentoAux.Data := GetDataPacket( sSQL );

                iNumeroProcesso := CdsSaldamentoAux.FieldByName('NUMEROPROCESSO').AsInteger;


                dValorRAOriginal := ( dValorDiferencaTabuas * ( iPercentual / 100 ) );
                dValorPago       := RetornaValorSUPL( CdsSaldamento, StrToDate('01/' + Copy( CdsSaldamentoAux.FieldByName('ULTMESPREPARO').AsString, 6, 2 ) +'/'+
                                                                                       Copy( CdsSaldamentoAux.FieldByName('ULTMESPREPARO').AsString, 1, 4 ) ),
                                                      2, iNumeroProcesso, iIdBeneficioDestino, iFiller );

                dValorRAOriginal := ( dValorRAOriginal - dValorPago );
                dValorRAOriginal := StrToFloat( FormatFloat('#0.00',  dValorRAOriginal ) );

                dValorContribuicao := ( dValorRAOriginal * 0.01 );
                dValorContribuicao := StrToFloat( FormatFloat('#0.00',  dValorContribuicao ) );

                iIdentificadorHistorico := InsereHistoricoBeneficio( CdsSaldamento,
                                                                     sAnoMesLoteProcesso, sAnoMesLoteProcesso,
                                                                     iNumeroProcesso,
                                                                     CdsSaldamento.FieldByName('IDPESSOA').AsInteger,
                                                                     iIdBeneficioDestino,
                                                                     -1, 0, 0, iIdUltMovBenef,
                                                                     dValorRAOriginal, dValorRAOriginal );
                If ( iIdentificadorHistorico < 0 ) Then Begin
                  GravaNoDemonstrativo( 'ERRO AO GRAVAR BENEFICIO DE R.A. NO HISTÓRICO -> '+ FMatriculaIndividuo +' COM A MENSAGEM: '+ sMensagemDeErro );
                  GravaNoDemonstrativo( ' ' );
                  Exit;
                End;


                iIdentificadorHistorico := InsereHistoricoContribuicao( CdsSaldamento, sAnoMesLoteProcesso,
                                                                        -1, 0, 0, 633, iIdUltMovBenef,
                                                                        dValorContribuicao );

                sUltMesPreparo := sAnoMesLoteProcesso;

                { Caso seja mês de abono, deixar Folha preparar abono }
                // Daniel Begnami SOL:100082
                // If ( Pos( '/11', sAnoMesLoteProcesso ) > 0 ) Then sUltMesPreparo := AnoMesAnterior( sUltMesPreparo );
                // Fim

                sSQL := 'UPDATE BENEFBFCIARIO SET '+
                        '  ULTMESPREPARO  = '+ QuotedStr( sUltMesPreparo )  +', '+
                        '  VALORATUAL     = '+ OraNumero( FloatToStr( dValorAtualizaBeneficio ) )    +', '+
                        '  VALORTOTAL     = '+ OraNumero( FloatToStr( dValorAtualizaBeneficio ) )    +'  '+
                        'WHERE  '+
                        '      IDPESSJUR     = '+ CdsSaldamento.FieldByName('IDPESSJUR').AsString      +
                        '  AND IDPLANOPREV   = '+ CdsSaldamento.FieldByName('IDPLANOPREV').AsString    +
                        '  AND IDTITULAR     = '+ CdsSaldamento.FieldByName('IDTITULAR').AsString      +
                        '  AND IDPESSOA      = '+ CdsSaldamento.FieldByName('IDPESSOA').AsString       +
                        '  AND SEQPROPOSTA   = '+ CdsSaldamento.FieldByName('SEQPROPOSTA').AsString    +
                        '  AND IDBENEFICIO   = '+ CdsSaldamento.FieldByName('IDBENEFICIO').AsString;

                If ( Not ExecSQL( sSQL ) ) Then Abort;

                Result := True;

                Exit;

              End;

            End;

            If ( iIdBeneficioDestino = -1 ) Then Begin

              GravaNoDemonstrativo( 'NÃO ENCONTROU DE-PARA PARA O BENEFICIO -> ' + IntToStr( iIdBeneficioOrigem) );
              GravaNoDemonstrativo( ' ' );
              Exit;

            End;

            { Somente encerrar caso não seja R.A. (RA já esta encerrada ) }
            If ( bEhDiferencaRA = False ) Then Begin

              //BRUNO AZEVEDO SOL 139436 KINTANA 856363
            { Encerrar os beneficios atuais }
            //EncerraBeneficio( CdsSaldamento,
            //                  CdsSaldamento.FieldByName('NUMEROPROCESSO').AsInteger,
            //                  CdsSaldamento.FieldByName('IDPESSOA').AsInteger,
            //                  CdsSaldamento.FieldByName('IDBENEFICIO').AsInteger );

              iIdUltMovBenef := IncluiMovBenef( CdsSaldamento.FieldByName('NUMEROPROCESSO').AsInteger,
                                                CdsSaldamento.FieldByName('IDBENEFICIO').AsInteger,
                                                CdsSaldamento.FieldByName('IDPESSOA').AsInteger,
                                                CdsSaldamento.FieldByName('IDPLANOPREV').AsInteger,
                                                4, 7,
                                                CdsSaldamento.FieldByName('DATAINICIO').AsString,
                                                CdsSaldamento.FieldByName('DATAFINAL').AsString,
                                                CdsSaldamento.FieldByName('VALORATUAL').AsFloat,
                                                CdsSaldamento.FieldByName('VALORTOTAL').AsFloat );

              tbTipoBeneficio := tbSuplementacao;

              { Atualiza situação do partcipante REPLAN de acordo com beneficio }
              If ( CdsSaldamento.FieldByName('IDPLANOPREV').AsInteger = 66 ) Then Begin

                iIdSitPart := CdsDadosIndividuo.FieldByName('IDSITPART').AsInteger;

                Case iIdBeneficioReplan Of
                  156      : iIdSitPart := 11;
                  149, 154 : iIdSitPart := 4;
                  159      : iIdSitPart := 12;
                  -1       : Begin
                               Case iIdBeneficioOrigem Of
                                 251, 160, 161, 328, 329  : iIdSitPart := 12;
                                 252, 152, 320            : iIdSitPart := 4
                               End;
                             End;
                End;

                sSQL := 'UPDATE  PARTPREVPLAN SET IDSITPART        = '+ IntToStr( iIdSitPart )+' ' +
                        'WHERE   IDPESSJUR   = '+ CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString      +
                        '  AND   IDPLANOPREV = 2 '+
                        '  AND   IDPESSOA    = '+ CdsDadosIndividuo.FieldByName('IDTITULAR').AsString      +
                        '  AND   SEQPROPOSTA = '+ CdsDadosIndividuo.FieldByName('SEQPROPOSTA').AsString ;

                If Not ExecSQL( sSQL ) Then Abort;

              End; { If ( CdsSaldamento.FieldByName('IDPLANOPREV').AsInteger = 66 ) Then Begin }

            End Else Begin

              tbTipoBeneficio := tbRA;

            End;

            { REB, inserir novo beneficio usando o DE-PARA }
            iNumeroProcesso := -1;

            If Not InsereBeneficio( CdsSaldamento,
                                    CdsSaldamento.FieldByName('IDPESSOA').AsInteger,
                                    CdsSaldamento.FieldByName('IDBENEFICIO').AsInteger,
                                    iIdBeneficioDestino,
                                    False, bEhDiferencaRA,
                                    iNumeroProcesso,
                                    tbTipoBeneficio )
            Then Begin
              Exit;
            End;

            //BRUNO AZEVEDO SOL 139436 KINTANA 856363
            { Encerrar os beneficios atuais }
            EncerraBeneficio( CdsSaldamento,
                              CdsSaldamento.FieldByName('NUMEROPROCESSO').AsInteger,
                              CdsSaldamento.FieldByName('IDPESSOA').AsInteger,
                              CdsSaldamento.FieldByName('IDBENEFICIO').AsInteger );

          End Else Begin { If ( FSomenteFinanceiro = False ) Then Begin }

            bEhDiferencaRA := ( CdsSaldamento.FieldByName('FLGRESGATE').AsInteger = 1 );

            { Somente encerrar caso não seja R.A. (RA já esta encerrada ) }
            If ( bEhDiferencaRA = False )
            Then tbTipoBeneficio := tbSuplementacao
            Else tbTipoBeneficio := tbRA;

            iNumeroProcesso     := CdsSaldamento.FieldByName('NUMEROPROCESSO').AsInteger;

            iIdBeneficioOrigem  := CdsSaldamento.FieldByName('IDBENEFICIO').AsInteger;
            iIdBeneficioDestino := iIdBeneficioOrigem;

          End; { If ( FSomenteFinanceiro = False ) Then Begin }


          { Processar acertos financeiros }
          If ( Not AcertaBeneficioSaldado( CdsSaldamento,
                                           iNumeroProcesso,
                                           CdsSaldamento.FieldByName('IDBENEFICIO').AsInteger,
                                           iIdBeneficioDestino,
                                           bEhDiferencaRA,
                                           tbTipoBeneficio ) )
          Then Begin

            GravaNoDemonstrativo( 'ERRO AO FAZER ACERTO FINANCEIRO DA MATRICULA  -> '+ FMatriculaIndividuo +' COM A MENSAGEM: '+ sMensagemDeErro );
            GravaNoDemonstrativo( ' ' );
            Exit;

          End;

          If ( tbTipoBeneficio = tbSuplementacao )
          Then dValorAtualizaBeneficio := ( dValorBSOriginal - ( dValorBSOriginal * ( Fpercentual / 100 ) ) )
          Else dValorAtualizaBeneficio := ( dValorRMOriginal * ( Fpercentual / 100 ) );

          { Caso seja acerto financeiro, atualizar VALOR ATUAL do beneficio }
          If ( FSomenteFinanceiro = True ) And ( FSomenteDiferencaRA = False ) Then Begin

            sUltMesPreparo := sAnoMesLoteProcesso;

            { Caso seja mês de abono, deixar Folha preparar abono }
            // Daniel Begnami SOL:100082
            // If ( Pos( '/11', sAnoMesLoteProcesso ) > 0 ) Then sUltMesPreparo := AnoMesAnterior( sUltMesPreparo );
            // Fim

            sSQL := 'UPDATE BENEFBFCIARIO SET '+
                    '  ULTMESPREPARO  = '+ QuotedStr( sUltMesPreparo )  +', '+
                    '  VALORATUAL     = '+ OraNumero( FloatToStr( dValorAtualizaBeneficio ) )    +', '+
                    '  VALORTOTAL     = '+ OraNumero( FloatToStr( dValorAtualizaBeneficio ) )    +'  '+
                    'WHERE  '+
                    '      IDPESSJUR     = '+ CdsSaldamento.FieldByName('IDPESSJUR').AsString      +
                    '  AND IDPLANOPREV   = '+ CdsSaldamento.FieldByName('IDPLANOPREV').AsString    +
                    '  AND IDTITULAR     = '+ CdsSaldamento.FieldByName('IDTITULAR').AsString      +
                    '  AND IDPESSOA      = '+ CdsSaldamento.FieldByName('IDPESSOA').AsString       +
                    '  AND SEQPROPOSTA   = '+ CdsSaldamento.FieldByName('SEQPROPOSTA').AsString    +
                    '  AND IDBENEFICIO   = '+ CdsSaldamento.FieldByName('IDBENEFICIO').AsString;

            If ( Not ExecSQL( sSQL ) ) Then Abort;

          End;

        End; { If ( CdsSaldamento.FieldByName('FONTEPAGADORA').AsInteger = 2 ) }

        CdsSaldamento.Next;

      End; { While ( Not Saldamento.Eof ) Do Begin }

    End; { If ( Not CdsSaldamento.IsEmpty ) Then Begin }


    {--------------------------------------------------------------------------}
    { Tratar Renda Antecipada                                                  }

    If ( ( FSomenteBUA = True ) Or ( FSomenteFinanceiro = False )  ) And ( FPercentual > 0 ) Then Begin

      iIdBeneficioOrigem  := iIdBeneficioDestino;

      If ( FSomenteBUA = True ) Then iIdBeneficioOrigem  := CdsSaldamento.FieldByName('IDBENEFICIO').AsInteger;

      iIdBeneficioDestino := DeParaBeneficio( iIdBeneficioOrigem, True, iIdBeneficioReplan, iFiller );

      If ( iIdBeneficioDestino > 0 ) Then Begin

        If Not InsereBeneficio( CdsSaldamento,
                                CdsSaldamento.FieldByName('IDPESSOA').AsInteger,
                                iIdBeneficioOrigem,
                                iIdBeneficioDestino,
                                True, False,
                                iNumeroProcesso,
                                tbRA )
        Then Begin

          GravaNoDemonstrativo( 'ERRO A GRAVAR R.A. DA MATRICULA -> '+ FMatriculaIndividuo +' COM A MENSAGEM: '+ sMensagemDeErro );
          GravaNoDemonstrativo( ' ' );
          Exit;

        End;

        { Processar acertos financeiros }
        If ( Not AcertaBeneficioSaldado( CdsSaldamento,
                                         iNumeroProcesso,
                                         iIdBeneficioOrigem,
                                         iIdBeneficioDestino,
                                         False,
                                         tbRA ) )
        Then Begin

          GravaNoDemonstrativo( 'ERRO AO FAZER ACERTO FINANCEIRO DA R.A., MATRICULA  -> '+ FMatriculaIndividuo +' COM A MENSAGEM: '+ sMensagemDeErro );
          GravaNoDemonstrativo( ' ' );
          Exit;

        End;

      End; { If ( iIdBeneficioDestino > 0 ) Then Begin }

    End;
    {--------------------------------------------------------------------------}

    Result := True;

  Except

    sMensagemDeErro := MessageInfo;

    Result := False;
    Exit;

  End;

end;

//BRUNO AZEVEDO SOL 131372 KINTANA 747479
procedure TSaldamentoAssistido.AplicaIncentivo(var pValor: double);
begin
  xQryIndices := TwwQuery.Create(Nil);
  with xQryIndices do begin
    DataBaseName := 'BaseDados';

    Close;
    Sql.Clear;
    Sql.Add('SELECT * FROM VALTABGENER VAL');
    Sql.Add(' WHERE VAL.CODTABELA = ''INDICE115120''');
    Sql.Add(' ORDER BY NUMLINHA');
    Open;

    if (Recordcount > 0) then begin
      while not Eof do begin
        if (AnsiUpperCase(xQryIndices.FieldByName('CodCampo').AsString) = 'INDICE') then begin
          pValor  := pValor + ( pValor * ( StrToFloat(StringReplace(xQryIndices.FieldByName('Valor').AsString,'.',',',[])) / 100 ) );
        end;

        Next;
      end;
    end;
  end;
end;
//BRUNO AZEVEDO SOL 131372 KINTANA 747479

{------------------------------------------------------------------------------}
{ Executa os acertos entre o novo valor do BD e o historico antigo             }
Function TSaldamentoAssistido.AcertaBeneficioSaldado( CdsDadosBeneficio : TCMClientDataSet;
                                                      piNumeroProcesso, piIdBeneficioOrigem, piIdBeneficioDestino : Integer;
                                                      pbEhDiferencaRA : Boolean;
                                                      ptbBeneficio : TTipoBeneficio ) : Boolean;

  {----------------------------------------------------------------------------}
  { Deflaciona o valor do beneficio saldado anualmente                         }
  Function DeflacionaBS( pdValorBSReferencia : Double; psAnoMesRef, psAnoMesDIB : String; piTipoValor: integer = 0 {0 - valor devido; 1 - valor pago} ): Double;
  Var
    sSQL, sMoedaIndice : String;
    iAnoRef, iAnoDIB: Integer;
    dValorIndice : Double;

  Begin

    Result := pdValorBSReferencia;

    sMoedaIndice := '7';

    iAnoRef := StrToInt( Copy( psAnoMesRef, 1, 4) );
    iAnoDIB := StrToInt( Copy( psAnoMesDIB, 1, 4) );

   // Daniel Begnami Sol: 96526, 97976 e 93782
    if (copy(psAnoMesRef,6,2)='01') then
    begin
      iAnoDIB := iAnoDIB + 1;
   // Fim


    //Ádler Souza - SOL: 129557 - KINTANA: 711994

     //BRUNO AZEVEDO SOL 133602 KINTANA 780268
    sSql := 'SELECT ANO, COTACAO                                                        ' + #13#10 +
            '  FROM (SELECT SUBSTR(CM.COTMESREF, 3, 4) + 1 ANO,                         ' + #13#10 +
            '               (EXP(SUM(LN(((CM.COTVALOR / 100) + 1)))) - 1) * 100 COTACAO ' + #13#10 +
            '          FROM COTACAOMOEDA CM                                             ' + #13#10 +
            '         WHERE CM.MOECODIGO = 7                                            ' + #13#10 +
            '           AND CM.COTDATA >= ''01/09/2001''                                ' + #13#10 +
            '           AND SUBSTR(CM.COTMESREF, 3, 4) BETWEEN ''2001'' AND             ' + #13#10 +
            '               TO_CHAR(SYSDATE, ''yyyy'')                                  ' + #13#10 +
            '           AND EXISTS (SELECT 1                                            ' + #13#10 +
            '                  FROM COTACAOMOEDA CM1                                    ' + #13#10 +
            '                 WHERE CM.MOECODIGO = CM1.MOECODIGO                        ' + #13#10 +
            '                   AND SUBSTR(CM.COTMESREF, 3, 4) =                        ' + #13#10 +
            '                       SUBSTR(CM1.COTMESREF, 3, 4) HAVING                  ' + #13#10 +
            '                 COUNT(*) >= 11)                                           ' + #13#10 +
            '         GROUP BY SUBSTR(CM.COTMESREF, 3, 4))                              ' + #13#10 +
            ' WHERE (ANO <= '+ inttostr(iAnoRef) + ') AND (ANO >=2001)                  ' + #13#10 +
            ' ORDER BY ANO DESC';

    CdsSaldamentoAux.Data := GetDataPacket( sSQL );

    dValorIndice := CdsSaldamentoAux.FieldByName('COTACAO').AsFloat;

    //Fim - SOL129557 - Ádler Souza
    end;



    // Daniel Begnami Sol: 96526, 97976 e 93782
    if ((psAnoMesRef = '2007/01') and (psAnoMesDIB < '2006/09')) then
    begin
      if (CdsDadosBeneficio.FieldByName('IDPLANOPREV').AsInteger = 2) then
        dValorIndice := 1.619123
      else if ((CdsDadosBeneficio.FieldByName('IDPLANOPREV').AsInteger = 66) and (flgPessoaParam = 'S')) then
        //dValorIndice := 1.619123 //Bruno Bastos - SOL: 102536 Kintana: 456310
        //Bruno Bastos - SOL: 102536 Kintana: 456310 - Início
        if piTipoValor = 0 then
          dValorIndice := 1.619123
        else
          dValorIndice := 2.8134
        //Bruno Bastos - SOL: 102536 Kintana: 456310 - Fim
    end;
    // Fim

    { No caso da DIB, compõe Indice }
    if FTipoArquivo = taPensionista then iAnoDIB := strtoint (copy(psAnoMesDIB,6,2)); // Teste Renato Visoni - Gustavo Terra - SOL 123389 - kINTANA - 616956

    If ( iAnoRef = iAnoDIB ) Then Begin

      sSQL := 'SELECT   '+
              '  COT.COTDATA, SUBSTR( COT.COTMESREF, 3,4 ) ||''/''||SUBSTR( COT.COTMESREF, 1,2 ) AS COTMESREF, '+
              '  COT.COTVALOR    '+
              'FROM     '+
              '  COTACAOMOEDA COT '+
              'WHERE    '+
              '  ( COT.MOECODIGO = '+ sMoedaIndice +' ) AND '+
              '  ( TO_CHAR(COT.COTDATA, ''YYYY/MM'') >= '+ QuotedStr( psAnoMesDIB ) +' ) AND '+
              '  ( TO_CHAR(COT.COTDATA, ''YYYY/MM'') <= '+ QuotedStr( Copy( psAnoMesDIB,1,5 )+ '12' ) +' ) '+
              'ORDER BY '+
              '  COT.COTDATA   ';

      CdsSaldamentoAux.Data := GetDataPacket( sSQL );

      dValorIndice := 1;;
      While ( Not CdsSaldamentoAux.Eof ) Do Begin

        dValorIndice := dValorIndice * ( 1 + (CdsSaldamentoAux.FieldByName('COTVALOR').AsFloat / 100 ) );
        CdsSaldamentoAux.Next;

      End;

      If ( dValorIndice = 0 ) Then dValorIndice := 1;

    End Else Begin

      dValorIndice := ( 1 + ( dValorIndice / 100 ) );

    End;

    dValorIndice := Trunca(  dValorIndice, 6 ) ;

    Result := ( pdValorBSReferencia / dValorIndice );

  End; { DeflacionaBS }
  {----------------------------------------------------------------------------}


  {----------------------------------------------------------------------------}
  { Verificar se a associado já teve REB                                       }
  Function JaTeveREB( piIdPessoa : Integer ): Boolean;
  Var
    sSQL : String;
  Begin
    Result := False;

    sSQL := 'SELECT '+
            '  BFB.NUMEROPROCESSO '+
            'FROM   '+
            '  BENEFBFCIARIO BFB '+
            'WHERE  '+
            '  BFB.IDPESSOA    = '+  IntToStr( piIdPessoa ) +' AND '+
            '  BFB.IDPLANOPREV = 66 ';
    CdsSaldamentoAux.Data := GetDataPacket( sSQL );

    If ( Not CdsSaldamentoAux.IsEmpty )
    Then Result := True;

  End; { DeflacionaBS }
  {----------------------------------------------------------------------------}


Var
  dValorPago, dValorPagoInteiro, dValorCobrado, dValorACobrar, dValorRA, dValorPagoIntegral,
  dIndice, dDiferencaB, dDiferencaC, dDiferencaBCorrigida, dDiferencaCCorrigida   : Double;

  iFlgDevolucao    : Word;

  sMesAbono,   sMesAntecipacaoAbono,
  sDataRefInd, sIndiceCorrecao, sSQL, sMsgErro, sLinhaMatriculas,
  sDataInicio, sDataInicioRef, sAnoMesDIP, sAnoMesAbono, sAnoMesAtualTemp,
  sAnoMesDIB,  sAnoMesDIBRefCalc,  sAnoMesAtual, sAnoMesInicio : String;

  dDataDIBRefCalc, dDataDIPBenef, dDataDIPRefCalc : TDateTime;

  iIdentificadorHistorico, iNumeroProcessoSUPL, iDiasProRata, iMesesProRata, iIdContribHst,
  iIdBeneficiario, iFlgEnviado, iSitRecebimento, iIdBeneficioDestino : Integer;

  dValorBSInteiro, dValorBSReferencia, dValorBSSemNovePorCento, d10pcBS,
  dValorContribuicaoBS, dValorContribuicaoHST, dIndiceAbatimento, dValorPercDevBUA : Double;

  bToPagandoAbono2008, bJahPagouAbono2008,
  bAbaterCorrecao, bAplicaIncentivo, bAplicaIncentivo354, bAplicaIncentivo535, bVolteiPercentualRA : Boolean;

  sDebug, sMesAnoDIB, sMesDeflaciona, sAnoDeflaciona : String;

  //BRUNO AZEVEDO SOL 131372 KINTANA 747479
  sAno, sMes: String;
  //BRUNO AZEVEDO SOL 131372 KINTANA 747479
Begin

  Result        := False;

  Try

    iIdBeneficiario := CdsDadosBeneficio.FieldByName('IDPESSOA').AsInteger;

    If ( CdsDadosBeneficio.FieldByName('DATAINICIOFUND').AsDateTime < StrToDate( '01/09/2001' ) )
    Then dDataDIBRefCalc := StrToDate( '01/09/2001' )
    Else dDataDIBRefCalc := CdsDadosBeneficio.FieldByName('DATAINICIOFUND').AsDateTime;


    dDataDIPBenef   := CdsDadosBeneficio.FieldByName('DATAINICIO').AsDateTime;
    dDataDIPRefCalc := dDataDIPBenef;

    If ( CdsDadosBeneficio.FieldByName('IDPLANOPREV').AsInteger = 66 ) Then Begin

      If ( ptbBeneficio = tbINSS ) Then Begin
        iIdBeneficioDestino := piIdBeneficioDestino;
      End Else Begin
        iIdBeneficioDestino := -1;
      End;

      RetornaDadosReplan( CdsDadosBeneficio.FieldByName('IDPESSOA').AsInteger, sDataInicio, sDataInicioRef, sFiller,
                          iIdBeneficioDestino, iFiller, iFiller, dFiller, False );

      If ( Trim( sDataInicio )    <> '' ) Then dDataDIPBenef   := StrToDate( sDataInicio );
      If ( Trim( sDataInicioRef ) <> '' ) Then dDataDIPRefCalc := StrToDate( sDataInicioRef );

    End;

    If ( dDataDIPRefCalc < StrToDate( '01/09/2001' ) )
    Then dDataDIPRefCalc := StrToDate( '01/09/2001' )
    Else dDataDIPRefCalc := dDataDIPRefCalc;


    sAnoMesDIBRefCalc := FormatDateTime( 'YYYY/MM', dDataDIBRefCalc );
    sAnoMesDIB        := FormatDateTime( 'YYYY/MM', CdsDadosBeneficio.FieldByName('DATAINICIOFUND').AsDateTime );

    sAnoMesDIP        := FormatDateTime( 'YYYY/MM', dDataDIPBenef );

    sAnoMesInicio     := FormatDateTime( 'YYYY/MM', dDataDIPRefCalc );

    {--------------------------------------------------------------------------}
    { Tratamento do INSS REB                                                   }
    If ( ptbBeneficio = tbINSS ) Then Begin

      { Usar data de inicio da tela caso informada }
      If ( Trim( FAnoMesInicioAcerto ) <> '' ) And ( FAnoMesInicioAcerto > sAnoMesInicio ) Then  sAnoMesInicio := FAnoMesInicioAcerto;

      If ( Not MigraHistorico( CdsDadosBeneficio,
                               sAnoMesInicio ,
                               piNumeroProcesso,    iIdBeneficiario,
                               piIdBeneficioOrigem, piIdBeneficioDestino, iIdUltMovBenef ) )
      Then Begin

        GravaNoDemonstrativo( 'ERRO AO MIGRAR HISTÓRICO DO INSS -> '+ FMatriculaIndividuo +' COM A MENSAGEM: '+ sMensagemDeErro );
        GravaNoDemonstrativo( ' ' );
        Exit;

      End;

      Result := True;

      Exit;

    End;
    {--------------------------------------------------------------------------}

    {--------------------------------------------------------------------------}
    { Tratamento da R.A.                                                       }
    If ( ptbBeneficio = tbRA ) Then Begin

      If ( pbEhDiferencaRA = False ) Then Begin

        iFlgEnviado     := 1;
        iSitRecebimento := 2;

        dValorRA := dValorRAOriginal;
        
      End Else Begin

        iFlgEnviado     := 0;
        iSitRecebimento := 0;

        { Caso acerto financeiro, não migra histórico }
        If ( FSomenteFinanceiro = False ) or ( FSomenteDiferencaRA = True ) Then Begin

          If ( Not MigraHistorico( CdsDadosBeneficio,
                                   sAnoMesInicio ,
                                   piNumeroProcesso, iIdBeneficiario,
                                   piIdBeneficioOrigem, piIdBeneficioDestino, iIdUltMovBenef ) )
          Then Begin

            GravaNoDemonstrativo( 'ERRO AO MIGRAR HISTÓRICO DA R.A. -> '+ FMatriculaIndividuo +' COM A MENSAGEM: '+ sMensagemDeErro );
            GravaNoDemonstrativo( ' ' );
            Exit;

          End;

          dValorRA := dValorRAOriginal;

        End Else Begin

          RetornaDadosReplan( iIdBeneficiario, sDataInicio, sDataInicioRef, sFiller,
                              piIdBeneficioDestino, iFiller, iFiller, dValorPago, True );

          dValorRMOriginal  := RetornaValorReserva( iIdBeneficiario, 113 );

          dValorRAOriginal  := ( dValorRMOriginal * ( Fpercentual / 100 ) );
          dValorRAParcelada := ( dValorRAOriginal / FNumeroDeParcelas );

          dValorRA := ( dValorRAOriginal - dValorPago );

        End;

      End;

      { Inserir dados no BD }
      iIdentificadorHistorico := InsereHistoricoBeneficio( CdsDadosBeneficio,
                                                           sAnoMesLoteProcesso, sAnoMesLoteProcesso,
                                                           piNumeroProcesso, iIdBeneficiario, piIdBeneficioDestino,
                                                           -1, iFlgEnviado, 0, iIdUltMovBenef,
                                                           dValorRA, dValorRA );
      If ( iIdentificadorHistorico < 0 ) Then Begin
        GravaNoDemonstrativo( 'ERRO AO GRAVAR BENEFICIO DE R.A. NO HISTÓRICO -> '+ FMatriculaIndividuo +' COM A MENSAGEM: '+ sMensagemDeErro );
        GravaNoDemonstrativo( ' ' );
        Exit;
      End;

      { Contribuição na HSTCONTRIBPREV é cheia }
      dValorContribuicaoHST := ( dValorRA * 0.01 );
      dValorContribuicaoHST := StrToFloat( FormatFloat('#0.00',  dValorContribuicaoHST ) );


      iIdentificadorHistorico := InsereHistoricoContribuicao( CdsDadosBeneficio, sAnoMesLoteProcesso,
                                                              -1, 0, iSitRecebimento, 633, iIdUltMovBenef,
                                                              dValorContribuicaoHST );

      If ( iIdentificadorHistorico < 0 ) Then Begin

        GravaNoDemonstrativo( 'ERRO AO GRAVAR CONTRIBUIÇÃO DE R.A. NO HISTÓRICO -> '+ FMatriculaIndividuo +' COM A MENSAGEM: '+ sMensagemDeErro );
        GravaNoDemonstrativo( ' ' );
        Exit;

      End;

      { Contribuição na RUBRICAINDIV é parcelada }
      dValorContribuicaoHST := ( dValorRAParcelada * 0.01 );
      dValorContribuicaoHST := StrToFloat( FormatFloat('#0.00',  dValorContribuicaoHST ) );

      { Rubricas individuais para o parcelamento }
      If ( pbEhDiferencaRA = False ) Then Begin

        InsereRubricaIndiv( iIdBeneficiario, 38599, -1,    FNumeroDeParcelas, iIdUltMovBenef, dValorRAParcelada );      { R.A.                   }
        InsereRubricaIndiv( iIdBeneficiario, 38779, 22423, FNumeroDeParcelas, iIdUltMovBenef, dValorRAParcelada );      { Correção R.A.          }
        InsereRubricaIndiv( iIdBeneficiario, 38645, -1,    FNumeroDeParcelas, iIdUltMovBenef, dValorContribuicaoHST );  { Contribuiçao           }
        InsereRubricaIndiv( iIdBeneficiario, 38788, 22423, FNumeroDeParcelas, iIdUltMovBenef, dValorContribuicaoHST );  { Correção Contribuiçao  }

      End;

      Result := True;

      Exit;

    End; { If ( ptbBeneficio = tbRA ) Then Begin }
    {--------------------------------------------------------------------------}

    { Tratamento da correção de 2006. As pessoas que já tiveram devem ser deflacionadas    }
    { as outras não serão deflacionadas e receberam uma marcação na PARAMAPREV.            }
    { Para identificar essas pessoas, retiramos o incentivo de 9% e comparamos com o valor }
    { atual da suplementação. Sendo esse menor, indica que ele não recebeu correção.       }

    { dValorBSOriginal já vem preenchido da rotina InsereBeneficio, pois a RESERVAPART já  }
    { descontada da R.A.                                                                   }

    dValorPago := RetornaValorSUPL( CdsDadosBeneficio, StrToDate( '01/' + Copy( AnoMesRefProcesso, 6, 2 ) +'/'+
                                    Copy( AnoMesRefProcesso, 1, 4 ) ), -1, iNumeroProcessoSUPL, piIdBeneficioOrigem,
                                    iFiller );
    dValorPagoInteiro := dValorPago;

    dValorBSOriginal := StrToFloat( FormatFloat('#0.00',  dValorBSOriginal ) );
    dValorPago       := StrToFloat( FormatFloat('#0.00',  dValorPago ) );

    dValorBSSemNovePorCento := StrToFloat( FormatFloat('#0.00', ( dValorBSOriginal / 1.09 ) ) );

    bAbaterCorrecao     := False;
    bAplicaIncentivo    := True;
    bAplicaIncentivo354 := True;
    bAplicaIncentivo535 := True;
    dIndiceAbatimento   := 1.011753;

    If (  ( dValorBSOriginal >= 201.30 ) and ( dValorBSOriginal <= 201.39 ) ) or
       ( dValorBSSemNovePorCento > dValorPago ) Then Begin

      bAbaterCorrecao := True;

    End Else Begin

      GravaParamPessoa( iIdBeneficiario, 75 );

    End;

    { Resumo do Processamento:                                                            }
    { Caso participante esteja no REB2002;                                                }
    {      Deflacionar o valor do BS e da Suplementação atual, fazendo os devidos acertos }
    { Caso participante esteja no REPLAN;                                                 }
    {      Deflacionar o valor do BS e fazer os devidos acertos no histórico de beneficio }
    If ( CdsDadosBeneficio.FieldByName('IDPLANOPREV').AsInteger = 66 ) Then Begin

    End Else Begin

      { Busca no histórico os dados do histórico caso REPLAN }
      sSQL := 'SELECT   '+
              '  GREATEST ( B.DATAINICIOFUND, TO_DATE('+ QuotedStr('01/09/2001')+') ) AS DATAINICIOFUND,  '+
              '  GREATEST ( B.DATAINICIO,     TO_DATE('+ QuotedStr('01/09/2001')+') ) AS DATAINICIO,      '+
              '  H.MESREFERENCIA, H.IDMOVBENEF, '+
              '  SUM( DECODE( H.FLGDEVOLUCAO, 1, -H.VALORPREV,     H.VALORPREV ) )     AS VALORPREV,    '+
              '  SUM( DECODE( H.FLGDEVOLUCAO, 1, -H.VLBENEFPGTO,   H.VLBENEFPGTO ) )   AS VLBENEFPGTO,  '+
              '  SUM( DECODE( H.FLGDEVOLUCAO, 1, -H.VALORINTEGRAL, H.VALORINTEGRAL ) ) AS VALORINTEGRAL '+
              'FROM     '+
              '  HSTBENEFBFCIARIO H, BENEFBFCIARIO B '+
              'WHERE    '+
              '  ( H.IDTITULAR   = '+ CdsDadosIndividuo.FieldByName('IDTITULAR').AsString        + ' ) AND '+
              '  ( H.IDPESSOA    = '+ IntToStr( iIdBeneficiario )                                + ' ) AND '+
              '  ( H.IDPLANOPREV = '+ CdsDadosIndividuo.FieldByName('IDPLANOPREV').AsString      + ' ) AND '+
              '  ( H.IDBENEFICIO = '+ CdsDadosBeneficio.FieldByName('IDBENEFICIO').AsString      + ' ) AND '+

              '  ( H.MESREFERENCIA >= TO_CHAR( GREATEST ( B.DATAINICIOFUND, TO_DATE('+ QuotedStr('01/09/2001')+') ), ''YYYY/MM'' ) ) AND ';

      If ( FSomenteFinanceiro = False )
      Then sSQL := sSQL +
              '  ( TO_CHAR( B.DATAFINAL, ''DD/MM/YYYY'') = '+ QuotedStr( DateToStr( StrToDate( sDataEvento ) -1  ) ) +' ) AND '+
              '  ( B.IDSITBENEFICIO = 3 ) AND ';

      sSQL := sSQL +
              '  ( B.FONTEPAGADORA  = 1 ) AND '+

              '  ( B.IDPESSJUR      = H.IDPESSJUR     )  AND '+
              '  ( B.IDPLANOORIGEM  = H.IDPLANOORIGEM )  AND '+
              '  ( B.IDPLANOPREV    = H.IDPLANOPREV   )  AND '+
              '  ( B.IDTITULAR      = H.IDTITULAR     )  AND '+
              '  ( B.IDPESSOA       = H.IDPESSOA      )  AND '+
              '  ( B.IDBENEFICIO    = H.IDBENEFICIO   )  AND '+
              '  ( B.SEQPROPOSTA    = H.SEQPROPOSTA   )      '+

              'GROUP BY '+
              '  H.NUMEROPROCESSO, H.IDPESSJUR, H.IDPLANOPREV, H.IDTITULAR, H.IDPESSOA, '+
              '  H.IDBENEFICIO, H.MESREFERENCIA, H.IDMOVBENEF, B.DATAINICIOFUND, B.DATAINICIO '+
              'ORDER BY '+
              '  H.MESREFERENCIA DESC ';

      CdsHistoricoBeneficio.Data := GetDataPacket( sSQL );

      dDataDIBRefCalc := CdsHistoricoBeneficio.FieldByName('DATAINICIOFUND').AsDateTime;
      //dDataDIPBenef   := CdsHistoricoBeneficio.FieldByName('DATAINICIO').AsDateTime;
      dDataDIPRefCalc := dDataDIPBenef;
      dValorPago      := 0;

      { Caso acerto financeiro }
      If ( FSomenteFinanceiro = True ) Then Begin

        iIdUltMovBenef := CdsHistoricoBeneficio.FieldByName('IDMOVBENEF').AsInteger;

        If ( ptbBeneficio = tbSuplementacao ) And ( FValorBSExterno <= 0 )
        Then dValorBSOriginal  := RetornaValorReserva( iIdBeneficiario, 114 )
        Else dValorBSOriginal  := FValorBSExterno;

      End;

    End; { If ( CdsDadosIndividuo.FieldByName('IDPLANOPREV').AsInteger = 66 ) Then }

    sAnoMesDIBRefCalc := FormatDateTime( 'YYYY/MM', dDataDIBRefCalc );
    sAnoMesDIB        := FormatDateTime( 'YYYY/MM', CdsDadosBeneficio.FieldByName('DATAINICIOFUND').AsDateTime );

    sAnoMesInicio     := FormatDateTime( 'YYYY/MM', dDataDIPRefCalc );
    sAnoMesAtual      := FAnoMesRefProcesso;

    bVolteiPercentualRA := False;

    If ( Fpercentual > 0 )
    Then dValorBSInteiro := ( dValorBSOriginal - ( dValorBSOriginal * ( Fpercentual / 100 ) ) )
    Else dValorBSInteiro := dValorBSOriginal;


    //BRUNO AZEVEDO SOL 131372 KINTANA 747479
    AplicaIncentivo(dValorBSInteiro);
    //BRUNO AZEVEDO SOL 131372 KINTANA 747479

    d10pcBS := ( dValorBSOriginal * ( Fpercentual / 100 ) );

    { Usar data de inicio da tela caso informada }
    If ( Trim( FAnoMesInicioAcerto ) <> '' ) And ( FAnoMesInicioAcerto > sAnoMesInicio ) Then  sAnoMesInicio := FAnoMesInicioAcerto;


    sMesAbono            := '11';
    sMesAntecipacaoAbono := '02';

    sAnoMesAbono     := FormatDateTime( 'YYYY', Date )+'/13';
    sAnoMesAtualTemp := sAnoMesAtual;

    bJahPagouAbono2008  := False;
    bToPagandoAbono2008 := False;

    { Involui meses até a DIB de referencia }
    While ( sAnoMesAtual >= sAnoMesInicio ) Do
    Begin

      // DANIEL Somente para efeito de DEBUG
      // DEXAR SEMPRE COMENTADO
      if sAnoMesAtual = '2008/13' then  // Renato Visoni \ Gustavo Terra SOL 106399 - KINTANA 476860 \ SOL 106242 - KINTANA 476808  if sAnoMesAtual = '2006/10
        sDebug := 'Parar aqui !';

        { para o REB apartir de setembro de  2006, retirar o percentual de RA }
      If (
           (
             ( FSomenteFinanceiro = True ) And
             ( JaTeveREB( iIdBeneficiario ) )
           )
           or ( CdsDadosBeneficio.FieldByName('IDPLANOPREV').AsInteger = 66  )
         )
         And ( sAnoMesAtual < '2006/09' )
         And ( bVolteiPercentualRA = False )
      Then Begin

        If ( Fpercentual > 0 ) Then
          dValorBSInteiro := (dValorBSInteiro + d10pcBS )
        Else
          dValorBSInteiro := dValorBSInteiro;

        bVolteiPercentualRA := True;
      End;

      //  Daniel Begnami Sol: 96526, 97976 e 93782
     //  Henrique Massão Sol 102601 Kintana 456378
     if (sAnoMesAtual = '2006/07') then
      begin
        if (CdsDadosBeneficio.FieldByName('IDPLANOPREV').AsInteger = 2) then
          dValorBSInteiro  := dValorBSInteiro / ( 1 + ( 1.175263 / 100 ));
      end;
        if (sAnoMesAtual = '2006/08') then
      begin
         if ((CdsDadosBeneficio.FieldByName('IDPLANOPREV').AsInteger = 66) and (flgPessoaParam = 'S')) then
          dValorBSInteiro  := dValorBSInteiro / ( 1 + ( 1.175263 / 100 ));
      end;
      // Fim

        //sMesDeflaciona := Copy (sAnoMesAtual, 6,2);
        //sMesDeflaciona := Copy (sAnoMesAtual, 1,4);

        { Retirar apartir de 2006/09 o incentivo aplicado }
      If ( bAplicaIncentivo = True ) And ( sAnoMesAtual < '2006/09' ) Then
      Begin
        // Daniel Begnami Sol: 96526, 97976 e 93782
        if (sAnoMesAtual = '2006/08') then
        begin
          if ((CdsDadosBeneficio.FieldByName('IDPLANOPREV').AsInteger = 66) and ( Fpercentual > 0 )) then
          begin
            dValorBsInteiro := dValorBsInteiro - d10pcBS;
            dValorBSInteiro := dValorBSInteiro / ((100-Fpercentual)/100);
          end;
        end;
        // Fim
        bAplicaIncentivo := False;
      End;

      // Daniel Begnami Sol: 96526, 97976 e 93782
      {if (sAnoMesAtual = '2006/08') then
      begin
        // Gustavo Terra inicio
        if (
           (CdsDadosBeneficio.FieldByName('IDPLANOPREV').AsInteger = 66) or
           (CdsDadosBeneficio.FieldByName('IDPLANOPREV').AsInteger = 2)  or
           ((CdsDadosBeneficio.FieldByName('IDPLANOPREV').AsInteger = 66) and (flgPessoaParam = 'S'))
           ) then
           dValorBSInteiro  := dValorBSInteiro / ( 1 + ( iIncentivoDoPlano / 100 ));
      end;      }

      // Fim

      {//Ádler Souza - SOL: 122017 - KINTANA: 712220
      if (((FTipoArquivo = taAposentado ) or ( FTipoArquivo = taPensionista )) and
         ( sAnoMesAtual = '2006/08') and
         (CdsDadosBeneficio.FieldByName('IDPLANOPREV').AsInteger = 2) and
         (FPercentual > 0) and
         (FormatDateTime('yyyy/mm',(CdsDadosBeneficio.FieldByName('DATAINICIOFUND').asDateTime)) > formatdatetime ('yyyy/mm',strtodate('01/08/2001')))) //or
         //((CdsDadosBeneficio.FieldByName('IDPLANOPREV').AsInteger = 66) and ( sAnoMesAtual = '2006/08') and (FPercentual > 0))
      then begin
        if FPercentual = 10 then
          dValorPercDevBUA := 0.90
        else
          dValorPercDevBUA := (((FPercentual * 0.90) / 10) + 0.1);

        dValorBSInteiro := dValorBSInteiro / dValorPercDevBUA ;
      end;
     //Ádler Souza - SOL: 122017 - KINTANA: 712220
      }

      //Gustavo Terra SOL 141089 Kintana 888196
      if (((FTipoArquivo = taAposentado ) or ( FTipoArquivo = taPensionista )) and
         ( sAnoMesAtual = '2006/08') and
         (CdsDadosBeneficio.FieldByName('IDPLANOPREV').AsInteger = 2) and
         (FPercentual > 0) and
         (FormatDateTime('yyyy/mm',(CdsDadosBeneficio.FieldByName('DATAINICIOFUND').asDateTime)) > formatdatetime ('yyyy/mm',strtodate('01/08/2001')))) //or
         //((CdsDadosBeneficio.FieldByName('IDPLANOPREV').AsInteger = 66) and ( sAnoMesAtual = '2006/08') and (FPercentual > 0))
      then begin
          dValorPercDevBUA := ((10-FPercentual)/100)+0.90;
          dValorBSInteiro := dValorBSInteiro / dValorPercDevBUA ;
      end;
     //Gustavo Terra SOL 141089 Kintana 888196


      //BRUNO AZEVEDO SOL 131372 KINTANA 747479
      sAno := Copy(sAnoMesAtual,1,4);
      sMes := Copy(sAnoMesAtual,6,2);
      sMes := IntToStr(StrToInt(sMes)+1);
      if (Length(sMes) = 1) then begin
        sMes := '0'+sMes;
      end;
      if (sMes = '14') then begin
        sMes := '01';
        sAno := IntToStr(StrToInt(sAno)+1);
      end;
      
      if (xQryIndices.Locate('CODCAMPO;VALOR',VarArrayOf(['MESANO',sAno+'/'+sMes]),[])) then begin
        if (xQryIndices.Locate('CODCAMPO;NUMLINHA',VarArrayOf(['INDICE',xQryIndices.FieldByName('NumLinha').AsInteger]),[])) then begin
          dValorBSInteiro  := dValorBSInteiro / ( 1 + ( StrToFloat(StringReplace(xQryIndices.FieldByName('Valor').AsString,'.',',',[])) / 100 ) );
        end;
      end;
      //BRUNO AZEVEDO SOL 131372 KINTANA 747479

      If ( bAbaterCorrecao = True ) And ( sAnoMesAtual <= '2006/07' ) Then
      Begin
        // Daniel Begnami Sol: 96526, 97976 e 93782
        if ((sAnoMesAtual = '2006/08') or
            (sAnoMesAtual = '2006/07') or
            (sAnoMesAtual = '2006/06') or
            (sAnoMesAtual = '2006/05') or
            (sAnoMesAtual = '2006/04') or
            (sAnoMesAtual = '2006/03') or
            (sAnoMesAtual = '2006/02') or
            (sAnoMesAtual = '2006/01')) then
        else
        begin
          if (CdsDadosBeneficio.FieldByName('IDPLANOPREV').AsInteger = 2) then
            dValorBSInteiro := ( dValorBSInteiro / dIndiceAbatimento )
          else if (CdsDadosBeneficio.FieldByName('IDPLANOPREV').AsInteger = 66) then
            if flgPessoaParam = 'S' then
              dValorBSInteiro := ( dValorBSInteiro / dIndiceAbatimento );
        end;
        // Fim
        bAbaterCorrecao := False;
      End;

      {------------------------------------------------------------------------}
      { Calculo do Beneficio                                                   }
      dValorBSReferencia := dValorBSInteiro;
      dValorPago         := dValorPagoInteiro;

      If ( CdsDadosBeneficio.FieldByName('IDPLANOPREV').AsInteger = 2 ) Then
      Begin
        If ( CdsHistoricoBeneficio.Locate('MESREFERENCIA', sAnoMesAtual, [] ) ) Then
          dValorPago := CdsHistoricoBeneficio.FieldByName('VALORPREV').AsFloat
        Else
          dValorPago := 0;
      End;

      { Pro-Rata de dias }
      If ( sAnoMesAtual = sAnoMesDIP ) Then
      Begin

        iDiasProRata := ( ( 30 - StrToInt( Copy( DateToStr( dDataDIPBenef ), 1, 2) ) + 1 ) );
        If ( iDiasProRata <= 0 ) Then
          iDiasProRata := 1;

        If ( CdsDadosBeneficio.FieldByName('IDPLANOPREV').AsInteger = 66 ) Then
          dValorPago         := ( dValorPago /30 )         * iDiasProRata;

        dValorBSReferencia := ( dValorBSReferencia /30 ) * iDiasProRata;
      End;

      { Pro-Rata de meses, incluindo logica para tratar DIA da DIP }

      If ( Pos( '/13', sAnoMesAtual ) > 0 ) And
         ( Copy ( sAnoMesAtual, 1,4 ) = Copy( DatetoStr( dDataDIPBenef ) , 7, 4) )
      Then
      Begin

        iMesesProRata := ( 12 - StrToInt( Copy( Datetostr( dDataDIPBenef ), 4, 2) ) );
        If ( iMesesProRata <= 0 ) Then iMesesProRata := 1;

        If ( StrToInt( FormatDateTime( 'DD', dDataDIPBenef ) ) <= 15 )
        Then iMesesProRata := iMesesProRata + 1;

        If ( CdsDadosBeneficio.FieldByName('IDPLANOPREV').AsInteger = 66 )
        Then dValorPago := ( dValorPago /12 ) * iMesesProRata;

        dValorBSReferencia := ( dValorBSReferencia /12 ) * iMesesProRata;

      End;

      { Inicio Augusto 24/11/2007 - Tratamento dos abonos no ano corrente }
      If ( Copy ( sAnoMesAtual, 1,4 ) = Copy( DatetoStr( Date ), 7, 4) ) Then
      Begin

        dValorPagoIntegral := dValorBSReferencia;

        If ( Copy ( sAnoMesAtual, 6,2 ) = sMesAntecipacaoAbono ) And
        // Daniel Begnami SOL:99975
        //   ( bJahPagouAbono2008         = False ) Then
           ( bJahPagouAbono2008         = True ) Then
        // Fim
        Begin

          sAnoMesAtualTemp   := sAnoMesAtual;

          sAnoMesAtual       := Copy( sAnoMesAtual, 1,4 )+ '/13';

          dValorPago         := ( dValorPago / 2 );
          dValorBSReferencia := ( dValorBSReferencia / 2 );

          bJahPagouAbono2008  := True;
          bToPagandoAbono2008 := True;

        End;

        If ( Copy ( sAnoMesAtual, 6,2 ) = sMesAbono ) And
        // Daniel Begnami SOL:99975
        //   ( bJahPagouAbono2008         = False )
           ( bJahPagouAbono2008         = True )
        // Fim
        Then Begin

          sAnoMesAtualTemp   := sAnoMesAtual;

          sAnoMesAtual       := Copy( sAnoMesAtual, 1,4 )+ '/13';

          bJahPagouAbono2008  := True;
          bToPagandoAbono2008 := True;

        End;

      End;

      { Fim Augusto 24/11/2007 - Tratamento dos abonos no ano corrente    }

      { Calcular acerto }
      If ( dValorPago > dValorBSReferencia ) Then Begin

         iFlgDevolucao := 1;
         dDiferencaB   := ( dValorPago - dValorBSReferencia );

         If ( bToPagandoAbono2008 = False ) Then dValorPagoIntegral := ( dValorPago - dDiferencaB );

         If ( sAnoMesAtual = sAnoMesLoteProcesso ) Then dValorPago  := ( dValorPago - dDiferencaB );

      End Else Begin

         iFlgDevolucao := 0;
         dDiferencaB   := ( dValorBSReferencia - dValorPago );

         If ( bToPagandoAbono2008 = False ) Then dValorPagoIntegral := ( dValorPago + dDiferencaB );

         { Inicio Augusto 29/01/2008 - Tratar também abonos no ano atual       }

         //If ( sAnoMesAtual = sAnoMesLoteProcesso ) Then dValorPago  := ( dValorPago + dDiferencaB );

         If (
              ( sAnoMesAtual = sAnoMesLoteProcesso ) Or
              ( ( Pos( '/13', sAnoMesAtual ) > 0 ) And ( sAnoMesAtualTemp = sAnoMesLoteProcesso ) And  ( Copy ( sAnoMesAtual, 1,4 ) = Copy( DatetoStr( Date ), 7, 4) ) )
            )
         Then dValorPago  := ( dValorPago + dDiferencaB );

         { Fim Augusto 29/01/2008                                              }

      End;

      If (
           ( sAnoMesAtual = sAnoMesLoteProcesso ) Or
           ( ( Pos( '/13', sAnoMesAtual ) > 0 ) And ( sAnoMesAtualTemp = sAnoMesLoteProcesso ) And  ( Copy ( sAnoMesAtual, 1,4 ) = Copy( DatetoStr( Date ), 7, 4) ) )
         )
      Then Begin
        iFlgEnviado     := 0;
      End Else Begin
        iFlgEnviado     := 1;
      End;

      { Caso acerto financeiro }
      If ( FSomenteFinanceiro = False ) Then Begin

        { Inserir dados no BD. Inserir tbm o valor apurado como pago }
        iIdentificadorHistorico := InsereHistoricoBeneficio( CdsDadosBeneficio,
                                                             sAnoMesAtual, sAnoMesAtualTemp,
                                                             piNumeroProcesso, iIdBeneficiario, piIdBeneficioDestino,
                                                             -1, iFlgEnviado, 0, iIdUltMovBenef,
                                                             dValorPago, dValorPagoIntegral );
        If ( iIdentificadorHistorico < 0 ) Then Begin

          GravaNoDemonstrativo( 'ERRO AO GRAVAR BENEFICIO REB NO HISTÓRICO -> '+ FMatriculaIndividuo +' COM A MENSAGEM: '+ sMensagemDeErro );
          GravaNoDemonstrativo( ' ' );
          Exit;

        End;

      End;

      { Ignorar diferenças de menos que 1 centavo }
      If ( dDiferencaB > 0.01 ) And
         ( ( FSomenteFinanceiro = True ) or ( sAnoMesAtual <> sAnoMesLoteProcesso ) )
      Then Begin

        If (
           //( CdsDadosBeneficio.FieldByName('IDPLANOPREV').AsInteger = 2 ) And { Augusto 09/02/2008 - Não incluir independente de plano }
           ( ( Pos( '/13', sAnoMesAtual ) > 0 ) And ( sAnoMesAtualTemp = sAnoMesLoteProcesso ) And  ( Copy ( sAnoMesAtual, 1,4 ) = Copy( DatetoStr( Date ), 7, 4) ) )
           )
        Then Begin

          //

        End Else Begin

          dDiferencaB := StrToFloat( FormatFloat('#0.00',  dDiferencaB ) );

          dDiferencaBCorrigida := CorrigeValor( dDiferencaB, sAnoMesAtual );
          dDiferencaBCorrigida := StrToFloat( FormatFloat('#0.00',  dDiferencaBCorrigida ) );

          { Inserir dados no BD }
          iIdentificadorHistorico := InsereHistoricoBeneficio( CdsDadosBeneficio,
                                                               sAnoMesAtual, sAnoMesAtualTemp,
                                                               piNumeroProcesso, iIdBeneficiario, piIdBeneficioDestino,
                                                               iIdMotivoBAcerto, 0, iFlgDevolucao, iIdUltMovBenef,
                                                               dDiferencaB, dValorPagoIntegral );
          If ( iIdentificadorHistorico < 0 ) Then Begin
            GravaNoDemonstrativo( 'ERRO AO GRAVAR DIFERNÇA DE BENEFICIO NO HISTÓRICO -> '+ FMatriculaIndividuo +' COM A MENSAGEM: '+ sMensagemDeErro );
            GravaNoDemonstrativo( ' ' );
            Exit;

          End;

          If ( dDiferencaBCorrigida - dDiferencaB ) > 0.01 Then Begin

             //BRUNO AZEVEDO SOL 133751 KINTANA 782370 SOL 136276 KINTANA 813879
             //ADICIONADO IFLGDEVOLUCAO
            InsereCorrecaoMonetaria( 'B', sAnoMesAtual, ( dDiferencaBCorrigida - dDiferencaB ),
                                     piNumeroProcesso, piIdBeneficioDestino, iIdBeneficiario,
                                     iIdMotivoBAcerto, iIdentificadorHistorico, iFlgDevolucao )
          End;

        End;

      End;

      {------------------------------------------------------------------------}
      { Calculo da Contribuição                                                }
      {   Até  08/2006 => 2%                                                   }
      {   Após 08/2006 => 1%                                                   }
      {   REB    - Calcular a contribuição em cima do historico calculado.     }
      {   REPLAN - Buscar a contribuição no histórico.                         }
      dIndice := 0.02;
      If ( sAnoMesAtual > '2006/08' ) Then dIndice := 0.01;

      dValorContribuicaoBS := ( dValorBSReferencia * dIndice );
      dValorContribuicaoBS := StrToFloat( FormatFloat('#0.00',  dValorContribuicaoBS ) );

      //BRUNO AZEVEDO SOL 141175 KINTANA 889656
      //BRUNO AZEVEDO SOL 140528 KINTANA 880374
      // Renato Visoni SOL 95118 / KINTANA 419379
      If ( CdsDadosBeneficio.FieldByName('IDPLANOPREV').AsInteger = 66 ) Then Begin
        dIndice := 0.02; // Renato Visoni SOL 101856 / KINTANA 451924
        dValorContribuicaoHST := ( dValorPago * dIndice );
      End Else Begin
      // Inicio Renato Visoni - SOL 89728 / Kintana 379380
      //BRUNO AZEVEDO SOL 140528 KINTANA 880374
      //BRUNO AZEVEDO SOL 141175 KINTANA 889656
        if TipoArquivo = taPensionista then begin
          dValorContribuicaoHST := RetornaValorContribuicao( CdsDadosBeneficio.FieldByName('NUMEROPROCESSO').AsInteger,
                                                             piIdBeneficioOrigem,
                                                             CdsDadosBeneficio.FieldByName('IDPESSOA').AsInteger, //IDRESPONSAVEL
                                                             sAnoMesAtual );
        end else begin
          dValorContribuicaoHST := RetornaValorContribuicao( CdsDadosBeneficio.FieldByName('NUMEROPROCESSO').AsInteger,
                                                             piIdBeneficioOrigem,
                                                             CdsDadosBeneficio.FieldByName('IDRESPONSAVEL').AsInteger,
                                                             sAnoMesAtual );
        // Inicio Renato Visoni - SOL 89728 / Kintana 379380
        end;
        // Fim Renato Visoni
      End;  //BRUNO AZEVEDO SOL 140528 KINTANA 880374
      // Fim Renato Visoni SOL 95118 / KINTANA 419379
      //BRUNO AZEVEDO SOL 141175 KINTANA 889656
      
      dValorContribuicaoHST := StrToFloat( FormatFloat('#0.00',  dValorContribuicaoHST ) );

      { Calcular acerto }
      If ( dValorContribuicaoHST > dValorContribuicaoBS ) Then Begin
         iFlgDevolucao := 1;
         dDiferencaC    := ( dValorContribuicaoHST - dValorContribuicaoBS );
      End Else Begin
         iFlgDevolucao := 0;
         dDiferencaC    := ( dValorContribuicaoBS - dValorContribuicaoHST );
      End;

      dDiferencaC := StrToFloat( FormatFloat('#0.00',  dDiferencaC ) );

      dDiferencaCCorrigida := CorrigeValor( dDiferencaC, sAnoMesAtual );
      dDiferencaCCorrigida := StrToFloat( FormatFloat('#0.00',  dDiferencaCCorrigida ) );

      { Inserir dados no BD. Inserir tbm o valor apurado como pago }

      { Caso acerto financeiro }
      If ( FSomenteFinanceiro = False ) Then Begin

        If ( dValorContribuicaoHST > 0 ) Then Begin

         { CPrev 08/02/2008 - Ajuste no SITRECEBIMENTO de adiantamento }
         // If ( sAnoMesAtual = sAnoMesLoteProcesso )
         If (
              ( sAnoMesAtual = sAnoMesLoteProcesso ) Or
              ( ( Pos( '/13', sAnoMesAtual ) > 0 ) And ( sAnoMesAtualTemp = sAnoMesLoteProcesso ) And  ( Copy ( sAnoMesAtual, 1,4 ) = Copy( DatetoStr( Date ), 7, 4) ) )
            )
         Then Begin
            iSitRecebimento := 0;
            iIdContribHst   := 633;
          End Else Begin
            iSitRecebimento := 2;
            iIdContribHst   := 633; { Alterado de 259 em 16/10/2006 pedido Lucimar }
          End;

          iIdentificadorHistorico := InsereHistoricoContribuicao( CdsDadosBeneficio, sAnoMesAtual,
                                                                -1, 0, iSitRecebimento, iIdContribHst,  iIdUltMovBenef,
                                                                dValorContribuicaoHST );
          If ( iIdentificadorHistorico < 0 ) Then Begin
            GravaNoDemonstrativo( 'ERRO AO GRAVAR CONTRIBUIÇÃO REB NO HISTÓRICO -> '+ FMatriculaIndividuo +' COM A MENSAGEM: '+ sMensagemDeErro );
            GravaNoDemonstrativo( ' ' );
            Exit;

          End;

        End;

      End;

      { Ignorar diferenças de menos que 1 centavo }
      If ( dDiferencaC > 0.01 ) Then Begin

        { Inserir dados no BD }
        iIdentificadorHistorico := InsereHistoricoContribuicao( CdsDadosBeneficio, sAnoMesAtual,
                                                                iIdMotivoCAcerto, iFlgDevolucao, 0, 633, iIdUltMovBenef,
                                                                dDiferencaC );

        If ( iIdentificadorHistorico < 0 ) Then Begin
          GravaNoDemonstrativo( 'ERRO AO GRAVAR DIFERNÇA DE CONTRIBUIÇÃO NO HISTÓRICO -> '+ FMatriculaIndividuo +' COM A MENSAGEM: '+ sMensagemDeErro );
          GravaNoDemonstrativo( ' ' );
          Exit;

        End;

        If ( dDiferencaCCorrigida - dDiferencaC ) > 0.01 Then Begin

          //BRUNO AZEVEDO SOL 133751 KINTANA 782370 SOL 136276 KINTANA 813879
          //ADICIONADO IFLGDEVOLUCAO
          InsereCorrecaoMonetaria( 'C', sAnoMesAtual, ( dDiferencaCCorrigida - dDiferencaC ),
                                   piNumeroProcesso, piIdBeneficioDestino, iIdBeneficiario,
                                   iIdMotivoCAcerto, iIdentificadorHistorico, iFlgDevolucao )
        End;

      End;

      { Deflaciona valor do BS. Caso REB, tbm deflaciona a suplementação }

      // Daniel Begnami Sol: 96526, 97976 e 93782
      // Gustavo Eduardo Terra
     If  ((Pos( '/01', sAnoMesAtual ) > 0 ) Or ( sAnoMesAtual = sAnoMesDIB ) or
          ((sAnoMesAtual = '2006/08') and (CdsDadosBeneficio.FieldByName('IDPLANOPREV').AsInteger = 2)) or
          ((sAnoMesAtual = '2006/08') and (CdsDadosBeneficio.FieldByName('IDPLANOPREV').AsInteger = 66) and (flgPessoaParam = 'S'))) Then
      Begin
        dValorBSInteiro := DeflacionaBS( dValorBSInteiro, sAnoMesAtual, sAnoMesDIBRefCalc );
      End;

      If  ((Pos( '/01', sAnoMesAtual ) > 0 ) Or ( sAnoMesAtual = sAnoMesDIB )) Then
      Begin
       // dValorPagoInteiro := DeflacionaBS( dValorPago, sAnoMesAtual, sAnoMesDIBRefCalc );//Bruno Bastos - SOL: 102536 Kintana: 456310

      If ( CdsDadosBeneficio.FieldByName('IDPLANOPREV').AsInteger = 66 ) Then
        begin
          //dValorPagoInteiro := DeflacionaBS( dValorPago, sAnoMesAtual, sAnoMesDIBRefCalc );//Bruno Bastos - SOL: 102536 Kintana: 456310

          //Bruno Bastos - SOL: 105438 Kintana: 471819 - Início
         // if (sAnoMesAtual = '2009/01') then
           // dValorPago := dValorPago - dDiferencaB;
          //Bruno Bastos - SOL: 105438 Kintana: 471819 - Fim

          // Renato Visoni \ Gustavo Terra SOL 106399 - KINTANA 476860 \ SOL 106242 - KINTANA 476808
          if (sAnoMesAtual = '2009/01') then
          begin
                dIndice := 1.064814;  // 1.061735 Renato Visoni SOL 110135 Kintana 502683
                dValorPagoInteiro := dValorPago/dIndice;
          end
          else
          begin
                dValorPagoInteiro := DeflacionaBS( dValorPago, sAnoMesAtual, sAnoMesDIBRefCalc, 1 );//Bruno Bastos - SOL: 102536 Kintana: 456310
          end;
         // FIM Renato Visoni \ Gustavo Terra SOL 106399 - KINTANA 476860 \ SOL 106242 - KINTANA 476808
        end;
      End;
      // Fim


      sAnoMesAtual := AnoMesAnterior( sAnoMesAtual );

      If ( bToPagandoAbono2008 = True ) Then Begin

        sAnoMesAtual := sAnoMesAtualTemp;
        bToPagandoAbono2008 := False;

      End;

    End; { While ( Not CdsHistoricoBeneficio.Eof ) Do Begin }

  Finally
    //BRUNO AZEVEDO SOL 131372 KINTANA 747479
    if (Assigned(xQryIndices)) then begin
      FreeAndNil(xQryIndices);
    end;
    //BRUNO AZEVEDO SOL 131372 KINTANA 747479
  End;

   Result   := True;

End; { AcertaBeneficioTransfPlano }


{------------------------------------------------------------------------------}
{ Inserir registro no histórico de beneficios                                  }
Function TSaldamentoAssistido.InsereHistoricoBeneficio( CdsDadosBeneficio : TCMClientDataSet;
                                                        psAnoMesReferencia, psAnoMesAtual : String;
                                                        piNumeroProcesso, piIdBeneficiario, piIdBeneficio,
                                                        piIdMotivo,       piFlgEnviado,     piFlgDevolucao,
                                                        piIdMovBenef : Integer;
                                                        pdValor, pdValorIntegral : Double ): Integer;


  Function RetornaProxSequencia( piIdPessoa, piNumeroProcesso, piIdMotivo : Integer;
                                 psAnoMesReferencia : String ): Integer;
  Var
    sSQL : String;
  Begin

    Try

      Result := 0;

      sSQL := 'SELECT '+
              '  ( MAX( H.SEQBENEFICIO ) + 1 ) AS PROXSEQBENEFICIO '+
              'FROM   '+
              '  HSTBENEFBFCIARIO H '+
              'WHERE  '+
              '  ( H.NUMEROPROCESSO = '+ IntToStr( piNumeroProcesso )    +' ) AND '+
              '  ( H.IDPESSOA       = '+ IntToStr( piIdPessoa )          +' ) AND '+
              '  ( H.MESREFERENCIA  = '+ QuotedStr( psAnoMesReferencia ) +' ) ';

      If ( piIdMotivo > 0 ) Then sSQL := sSQL + ' AND ( H.IDMOTIVO = '+ IntToStr( piIdMotivo ) +' ) ';

      _Cds.Data := GetDataPacket( sSQL );

      If ( Not _Cds.IsEmpty ) And ( _Cds.FieldByName('PROXSEQBENEFICIO').AsInteger > 0 )
      Then Result := _Cds.FieldByName('PROXSEQBENEFICIO').AsInteger
      Else Result := 1;

    Except

    End;

  End; { Function RetornaProxSequencia }
  {----------------------------------------------------------------------------}


  Function RetornaTipoRegistro( psAnoMesAtual, psAnoMesReferencia : String;
                                piIdBeneficio : Integer ): String;
  Var
    sSQL : String;
  Begin

    Result := '0'; { Normal }

    If ( psAnoMesAtual <> '' ) Then Begin

      If ( Pos( '/13', psAnoMesReferencia ) > 0 ) Then Begin

        Result := '1'; { Abono }

        { CPrev Augusto 21/02/2008 - Caso abono seja do ano atual, verifcar se é antecipação }
        If ( Copy( psAnoMesReferencia, 1, 4 ) = Copy( DateToStr( Date ), 7, 4) ) Then Begin

          sSQL := 'SELECT PA.MES '+
                  'FROM PARAMANTECIPABONO PA '+
                  'WHERE PA.MES     = '+ QuotedStr( psAnoMesAtual )                             + ' AND '+
                  '  PA.IDPESSJUR   = '+ CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString    + ' AND '+
                  '  PA.IDPLANOPREV = '+ IntToStr( 2 )                                          + ' AND '+
                  '  PA.IDBENEFICIO = '+ IntToStr ( piIdBeneficio );

           _Cds.Data := GetDataPacket( sSQL );

          If ( Not _Cds.IsEmpty ) Then Begin

            Result := '2'; { Antecipação de abono }

          End;

        End;

      End;

    End;

  End; { Function RetornaTipoRegistro( psAnoMesAtual }

  {----------------------------------------------------------------------------}


Var
  sSQL, sSQLSeqBeneficio, sDataPagamento, sFlgTipoRegistro, sMesReferencia : String;
  sValorPago, sIdMovBenef : String;

  iNumBeneficiarios, iSeqBeneficio : Integer;
  dValorTotal : Double;

Begin

  Result := -1;

  sMesReferencia := Copy( psAnoMesReferencia, 6, 2 );

  If ( piIdMotivo = -1 ) Then Begin

    piIdMotivo := iIdMotivoBNormal;
    If ( Pos( '/13', psAnoMesReferencia ) > 0 ) Then begin

      piIdMotivo     := iIdMotivoBAbono;
      sMesReferencia := '12';

    End;

  End;

  sSQLSeqBeneficio := '( SELECT '+
                      '    NVL( ( MAX( H.SEQBENEFICIO ) + 1 ), 0 ) AS PROXSEQBENEFICIO '+
                      '  FROM   '+
                      '    HSTBENEFBFCIARIO H '+
                      '  WHERE  '+
                      '    ( H.NUMEROPROCESSO = '+ IntToStr( piNumeroProcesso )    +' ) AND '+
                      '    ( H.IDPESSOA       = '+ IntToStr( piIdBeneficiario )    +' ) AND '+
                      '    ( H.MESREFERENCIA  = '+ QuotedStr( psAnoMesReferencia ) +' ) ';
  If ( piIdMotivo > 0 )
  Then sSQLSeqBeneficio := sSQLSeqBeneficio + ' AND ( H.IDMOTIVO = '+ IntToStr( piIdMotivo ) +' ) ) '
  Else sSQLSeqBeneficio := sSQLSeqBeneficio + ' ) ';

  sFlgTipoRegistro := RetornaTipoRegistro( psAnoMesAtual, psAnoMesReferencia,
                                           piIdBeneficio );

  sValorPago     := 'NULL';
  sDataPagamento := '';

  If ( piFlgEnviado = 1 ) Then Begin

    sValorPago     := OraNumero( FormatFloat('#0.00',  pdValor ) );
    sDataPagamento := '20/'+ sMesReferencia +'/'+ Copy( psAnoMesReferencia, 1, 4 );

  End;

  If ( piIdMovBenef <= 0 )
  Then sIdMovBenef := 'NULL'
  Else sIdMovBenef := IntToStr( piIdMovBenef );

  dValorTotal := pdValorIntegral;

  If ( CdsDadosIndividuo.FieldByName('IDTITULAR').AsInteger = piIdBeneficiario )
  Then dValorTotal := pdValorIntegral;

  If ( FTipoArquivo = taPensionista ) Then Begin
  //Ádler Souza - Sol 141310/2261 - KTN 905777
  //  dValorTotal := StrToFloat( FormatFloat('#0.00',  ( pdValorIntegral / ( CdsDadosBeneficio.FieldByName('PERCENTUAL').AsFloat / 100 ) ) ) );
    if CdsDadosBeneficio.FieldByName('PERCENTUAL').AsFloat > 0 then
    begin
      dValorTotal := (pdValorIntegral/(CdsDadosBeneficio.FieldByName('PERCENTUAL').AsFloat/100));
    end
    else
    begin
      MsgDlg('Percentual de suspensão é igual a zero!' , 'Erro', mtError, [mbOk], 0);
      MessageInfo := 'PERCENTUAL DE SUSENSÃO É IGUAL A ZERO';
      Abort;
    end;
   //Fim - Ádler Souza - Sol 141310/2261 - KTN 905777
  End;


  sSQL := 'INSERT INTO HSTBENEFBFCIARIO ' +
          '  ( IDPESSJUR,      IDTITULAR,      IDPESSOA,                         '+
          '    IDPLANOPREV,    IDPLANOORIGEM,  SEQPROPOSTA,    IDMOTIVO,         '+
          '    NUMEROPROCESSO, IDBENEFICIO,    MES,            MESREFERENCIA,    '+
          '    SEQBENEFICIO,   VALORPREV,      VALORSRB,       VALORCALCULADO,   '+
          '    VALORINTEGRAL,  VALORTOTAL,     IDREGRACALCULO, IDLOTE,           '+
          '    FLGENVIADO,     FLGCONCESSAO,   FLGDEVOLUCAO,   CODPORTFORMA,     '+
          '    VLBENEFPGTO,    DATAPAGAMENTO,  FLGPROVISORIO,  VALORACERTO,      '+
          '    PERCENTUAL,     VALORPREVMIN,   VALOROP1,       VALOROP2,         '+
          '    VALOROP3,       IDTITBENEF,     FONTEPAGADORA,  FLGTIPOREGISTRO,  '+
          '    DTEFETPGTO,     IDMOVBENEF ) '+

          'VALUES(' +CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString                 + ',' +
                     CdsDadosIndividuo.FieldByName('IDTITULAR').AsString                 + ',' +
                     IntToStr( piIdBeneficiario )                                        + ',' + { IDPESSOA       }
                     IntToStr( 2 )                                                       + ',' + { IDPLANOPREV    }
                     IntToStr( 2 )                                                       + ',' + { IDPLANOORIGEM  }
                     CdsDadosIndividuo.FieldByName('SEQPROPOSTA').AsString               + ',' +

                     IntToStr( piIdMotivo )                                              + ',' + { IDMOTIVO       }

                     IntToSTr( piNumeroProcesso )                                        + ',' + { NUMEROPROCESSO }

                     IntToSTr( piIdBeneficio )                                           + ',' +

                     QuotedStr( sAnoMesLoteProcesso )                                    + ',' + { MES            }
                     QuotedStr( psAnoMesReferencia )                                     + ',' +

                     sSQLSeqBeneficio                                                    + ',' + { SEQBENEFICIO    }

                     //IntToStr( iSeqBeneficio )                                           + ',' +

                     OraNumero( FormatFloat('#0.00', pdValor ) )                         + ',' + { VALORPREV       }
                     OraNumero( FloatToStr( 0 ) )                                        + ',' + { VALORSRB        }

                     OraNumero( FormatFloat('#0.00', pdValor ) )                         + ',' + { VALORCALCULADO  }
                     OraNumero( FormatFloat('#0.00', pdValorIntegral ) )                 + ',' + { VALORINTEGRAL   }
                     OraNumero( FormatFloat('#0.00', dValorTotal ) )                     + ',' + { VALORTOTAL      }

                     'NULL '                                                             + ',' + { IDREGRACALCULO  }
                     IntToStr( iIdLoteProcesso )                                         + ',' + { IDLOTE          }
                     IntToStr( piFlgEnviado )                                            + ',' + { FLGENVIADO      }
                     '1 '                                                                + ',' + { FLGCONCESSAO    }
                     IntToStr( piFlgDevolucao )                                          + ',' + { FLGDEVOLUCAO    }

                     QuotedStr( CdsDadosBeneficio.FieldByName('CODPORTFORMA').AsString ) + ',' + { CODPORTFORMA    }

                     sValorPago                                                          + ',' + { VLBENEFPGTO     }

                     'TO_DATE('''+ sDataLoteProcesso +''',''DD/MM/YYYY''), '+                    { DATAPAGAMENTO   }

                     QuotedStr( CdsDadosBeneficio.FieldByName('FLGPROVISORIO').AsString )+ ',' + { FLGPROVISORIO   }

                     OraNumero( FormatFloat('#0.00',  pdValor ) )                        + ',' + { VALORACERTO     }

                     OraNumero( CdsDadosBeneficio.FieldByName('PERCENTUAL').AsString )   + ',' +

                     OraNumero( FormatFloat('#0.00',  pdValor ) )                        + ',' + { VALORPREVANTMIN }

                     OraNumero( CdsDadosBeneficio.FieldByName('VALORBASE1').AsString )   + ',' +
                     OraNumero( CdsDadosBeneficio.FieldByName('VALORBASE2').AsString )   + ',' +
                     OraNumero( CdsDadosBeneficio.FieldByName('VALORBASE3').AsString )   + ',' +

                     CdsDadosIndividuo.FieldByName('IDTITULAR').AsString                 + ',' +
                     CdsDadosBeneficio.FieldByName('FONTEPAGADORA').AsString             + ',' +

                     sFlgTipoRegistro                                                    + ',' +

                     'TO_DATE('''+ sDataPagamento +''',''DD/MM/YYYY'') '                 + ',' + { DTEFETPGTO      }

                     sIdMovBenef                                                                 { IDMOVBEENF      }

                     +')';

  Try

    If Not ExecSQL( sSQL ) Then Abort;

    Result := iSeqBeneficio;

  Except

    On E:Exception Do Begin

      sMensagemDeErro := E.Message;

      If ( sMensagemDeErro = 'Operation aborted' ) Then sMensagemDeErro := MessageInfo;

      Result := -5005; { Erro }

    End;

  End;

End;

{------------------------------------------------------------------------------}
{ Migrar registro do histórico do INSS                                         }
Function TSaldamentoAssistido.MigraHistorico( CdsDadosBeneficio : TCMClientDataSet;
                                              psAnoMesInicio : String;
                                              piNumeroProcesso,    piIdBeneficiario,
                                              piIdBeneficioOrigem, piIdBeneficioDestino,
                                              piIdMovBenef  : Integer ) : Boolean;
Var
  sSQL, sSQLSeq, sSQLExist : String;
Begin

  Result := False;

  sSQLSeq := ' NVL( (SELECT ( MAX( SEQBENEFICIO ) + 1 ) '+
             '       FROM HSTBENEFBFCIARIO H1 '+
             '       WHERE '+
             '         H1.IDPLANOPREV      = '+ CdsDadosBeneficio.FieldByName('IDPLANOPREV').AsString +
             '        AND H1.IDTITULAR     = '+ CdsDadosBeneficio.FieldByName('IDTITULAR').AsString   +
             '        AND H1.IDBENEFICIO   = '+ IntToStr( piIdBeneficioOrigem )     +
             '        AND H1.IDPESSOA      = '+ IntToStr( piIdBeneficiario )  +
             '        AND H1.IDMOTIVO      = H.IDMOTIVO '+
             '        AND H1.SEQBENEFICIO  = H.SEQBENEFICIO '+
             '        AND H1.MESREFERENCIA = H.MESREFERENCIA ), 0 ) AS SEQBENEFICIO ';

  sSQLExist := 'AND NOT EXISTS ( SELECT 1 FROM   HSTBENEFBFCIARIO H2           '+
               '                 WHERE  H2.IDPLANOPREV   = ' + IntToStr( iIdNovoPlano ) + ' AND '+
               '                   H.IDTITULAR      =  H2.IDTITULAR       AND  '+
               '                   H.IDPESSOA       =  H2.IDPESSOA        AND  '+
               '                   H.IDBENEFICIO    =  H2.IDBENEFICIO     AND  '+
               '                   H.MESREFERENCIA  =  H2.MESREFERENCIA   AND  '+
               '                   H.IDMOTIVO       =  H2.IDMOTIVO )           ';

  sSQL := 'INSERT INTO HSTBENEFBFCIARIO ' +
          '  ( IDPESSJUR,      IDTITULAR,      IDPESSOA,                         '+
          '    IDPLANOPREV,    IDPLANOORIGEM,  SEQPROPOSTA,    IDMOTIVO,         '+
          '    NUMEROPROCESSO, IDBENEFICIO,    MES,            MESREFERENCIA,    '+
          '    SEQBENEFICIO,   VALORPREV,      VALORSRB,       VALORCALCULADO,   '+
          '    VALORINTEGRAL,  VALORTOTAL,     IDREGRACALCULO, IDLOTE,           '+
          '    FLGENVIADO,     FLGCONCESSAO,   FLGDEVOLUCAO,   CODPORTFORMA,     '+
          '    VLBENEFPGTO,    DATAPAGAMENTO,  FLGPROVISORIO,  VALORACERTO,      '+
          '    PERCENTUAL,     VALORPREVMIN,   VALOROP1,       VALOROP2,         '+
          '    VALOROP3,       IDTITBENEF,     FONTEPAGADORA,  FLGTIPOREGISTRO,  '+
          '    DTEFETPGTO,     IDMOVBENEF ) '+
          'SELECT  DISTINCT '+
          '    IDPESSJUR,      IDTITULAR,      IDPESSOA,                         '+
          IntToStr( iIdNovoPlano )             + ' , ' +
          IntToStr( iIdNovoPlano )             + ' , ' +
          '    SEQPROPOSTA,    IDMOTIVO, '+
          IntToStr( piNumeroProcesso )         + ' , ' +
          IntToStr( piIdBeneficioDestino )     + ' , ' +
          '    MES,            MESREFERENCIA,    '+

          sSQLSeq + ' , ' + { PEDAÇO DO SEQBENEFICIO }

          '    VALORPREV,      VALORSRB,       VALORCALCULADO,   '+
          '    VALORINTEGRAL,  VALORTOTAL,     IDREGRACALCULO,                   '+
          IntToStr( iIdLoteProcesso )  + ' , ' +
          '    FLGENVIADO,     FLGCONCESSAO,   FLGDEVOLUCAO,   CODPORTFORMA,     '+
          '    VLBENEFPGTO,    DATAPAGAMENTO,  FLGPROVISORIO,  VALORACERTO,      '+
          '    PERCENTUAL,     VALORPREVMIN,   VALOROP1,       VALOROP2,         '+
          '    VALOROP3,       IDTITBENEF,     FONTEPAGADORA,  FLGTIPOREGISTRO,  '+
          '    DTEFETPGTO, '+ IntToStr( piIdMovBenef )  + ' ' +
          'FROM '+
          '  HSTBENEFBFCIARIO H '+
          'WHERE    '+
          '  H.IDPLANOPREV    = '+ CdsDadosBeneficio.FieldByName('IDPLANOPREV').AsString + ' AND '+
          '  H.IDTITULAR      = '+ CdsDadosBeneficio.FieldByName('IDTITULAR').AsString   + ' AND '+
          '  H.IDBENEFICIO    = '+ IntToStr( piIdBeneficioOrigem )  + ' AND '+
          '  H.IDPESSOA       = '+ IntToStr( piIdBeneficiario )     + ' AND '+
          '  H.MESREFERENCIA >= '+ QuotedStr( psAnoMesInicio )      +
    sSQLExist;

  Try

    If Not ExecSQL( sSQL ) Then Abort;

    Result := True;

  Except

    On E:Exception Do Begin

      sMensagemDeErro := E.Message;

      If ( sMensagemDeErro = 'Operation aborted' ) Then sMensagemDeErro := MessageInfo;

      Result := False; { Erro }

    End;

  End;

End; { MigraHistorico }


{------------------------------------------------------------------------------}
{ Inserir registro no histórico de contribuições                               }
Function TSaldamentoAssistido.InsereHistoricoContribuicao( CdsDadosBeneficio : TCMClientDataSet;
                                                           psAnoMesReferencia : String;
                                                           piIdMotivo,       piFlgDevolucao,
                                                           piSitRecebimento, piIdContribuicao, piIdMovBenef  : Integer;
                                                           dValor : Double ) : Integer;
Var
  sSQL, sDataRecebimento, sFlgTipoRegistro, sMesReferencia : String;

  iNumRecebimento : Integer;
  dValorRecebido  : Double;

Begin

  Result := -1;

  sMesReferencia := Copy( psAnoMesReferencia, 6, 2 );

  If ( piIdMotivo = -1 ) Then Begin

    piIdMotivo := iIdMotivoCNormal;

    If ( Pos( '/13', psAnoMesReferencia ) > 0 ) Then begin

      piIdMotivo     := iIdMotivoCAbono;
      sMesReferencia := '12';

    End;

  End;

  dValorRecebido   := 0;
  sDataRecebimento := '';
  If ( piSitRecebimento = 2 ) Then Begin

    dValorRecebido   := dValor;
    sDataRecebimento := '20/'+ sMesReferencia +'/'+ Copy( psAnoMesReferencia, 1, 4 );

  End;

  Try

    If ( FTipoArquivo = taPensionista ) Then Begin

      sSQL := 'SELECT  '+
              '  NUMRECEBIMENTO '+
              'FROM   '+
              '  HSTCONTRIBPREV HST  '+
              'WHERE  '+
              '      ( HST.IDPESSJUR      = '+ CdsDadosBeneficio.FieldByName('IDPESSJUR').AsString      + ' ) '+
              '  AND ( HST.IDPLANOPREV    = '+ IntToStr( iIdNovoPlano )                                 + ' ) '+

              //Inicio Renato Visoni - SOL 89728 / Kintana 379380
              //'  AND ( HST.IDPESSOA       = '+ CdsDadosBeneficio.FieldByName('IDRESPONSAVEL').AsString  + ' ) '+
              '  AND ( HST.IDPESSOA       = '+ CdsDadosBeneficio.FieldByName('IDPESSOA').AsString  + ' ) '     +    //IDRESPONSAVEL
              // Fim Renato Visoni

              '  AND ( HST.MESREFERENCIA  = '+ QuotedStr( psAnoMesReferencia )                          + ' ) '+

              '  AND ( HST.IDCONTRIBUICAO = '+ IntToStr( piIdContribuicao )                             + ' ) '+
              '  AND ( HST.IDLOTE         = '+ IntToStr( iIdLoteProcesso  )                             + ' ) '+
              '  AND ( HST.IDMOTIVO       = '+ IntToStr( piIdMotivo )                                   + ' ) ';

      CdsSaldamentoAux.Data := GetDataPacket( sSQL );

    End; { If ( FTipoArquivo = taPensionista ) Then Begin }

    If ( CdsSaldamentoAux.IsEmpty ) Or ( FTipoArquivo = taAposentado ) Then Begin
      iNumRecebimento := InsereHstContribPREV( QrySaldamentoAux,
                                                 CdsDadosBeneficio.FieldByName('IDRESPONSAVEL').AsInteger,
                                                 CdsDadosBeneficio.FieldByName('SEQPROPOSTA').AsInteger,
                                                 CdsDadosBeneficio.FieldByName('IDPESSJUR').AsInteger,
                                                 iIdNovoPlano,                            { IDPLANOPREV      }
                                                 piIdContribuicao,                        { IDCONTRIBUICAO   }
                                                 piIdMotivo,                              { IDMOTIVO         }
                                                 psAnoMesReferencia,                      { MESREFERENCIA    }
                                                 sAnoMesLoteProcesso,                     { MESCOBRANCA      }
                                                 -1,                                      { CODPORTFORMA     }
                                                 sDataLoteProcesso,                       { DATACOBRANCA     }
                                                 sDataRecebimento,                        { DATARECEBIMENTO  }
                                                 dValor,                                  { VALORESPERADO    }
                                                 dValor,                                  { VALORCALCULADO   }
                                                 dValorRecebido,                          { VALORRECEBIDO    }
                                                 -1,                                      { IDREGRACALCULO   }
                                                 1,                                       { FLGDESCFOLHA     }
                                                 0,                                       { VALORBASE1       }
                                                 0,                                       { VALORBASE2       }
                                                 0,                                       { VALORBASE3       }

                                                 sDataEvento,                             { DATAINICIO       }

                                                 '',                                      { DATAFINAL        }

                                                 'AS',                                    { FLGINTSITPART    }
                                                 piSitRecebimento,                        { IDSITRECEBIMENTO }
                                                 0,                                       { PARCELA          }
                                                 iIdLoteProcesso,                         { IDLOTE           }
                                                 'F',                                     { TIPO             }
                                                 0,                                       { FLGCALCRESERAV   }
                                                 piFlgDevolucao,                          { FLGDEVOLUCAO     }
                                                 0,                                       { FLGCONCESSAO     }
                                                 0,                                       { FLGINTEVENTO     }

                                                 'B',                                     { FOLHAORIGEM      }

                                                 iIdUltMovBenef                           { IDMOVBEENF       }

                                                 );

      If ( iNumRecebimento = -1 ) Then Abort;


      Result := iNumRecebimento;

    End Else Begin

      Result := CdsSaldamentoAux.FieldByName('NUMRECEBIMENTO').AsInteger;

      sSQL := 'UPDATE HSTCONTRIBPREV HST SET '+
              '  HST.VALORESPERADO  = ( HST.VALORESPERADO  + '+ OraNumero( FloatToStr( dValor ) ) +' ), ';

      If ( dValorRecebido <> 0 )
      Then sSQL := sSQL +
              '  HST.VALORRECEBIDO = ( HST.VALORRECEBIDO  + '+ OraNumero( FloatToStr( dValorRecebido ) ) +' ),  ';

      sSQL := sSQL +
              '  HST.VALORCALCULADO = ( HST.VALORCALCULADO + '+ OraNumero( FloatToStr( dValor ) ) +' ) '+
              'WHERE  '+
              '  ( HST.NUMRECEBIMENTO = '+ CdsSaldamentoAux.FieldByName('NUMRECEBIMENTO').AsString +' ) ';

      If Not ExecSQL( sSQL ) Then Abort;

    End; { If ( CdsSaldamentoAux.IsEmpty ) Then Begin }

  Except

    On E:Exception Do Begin

      sMensagemDeErro := E.Message;

      If ( sMensagemDeErro = 'Operation aborted' ) Then sMensagemDeErro := MessageInfo;

      Result := -5005; { Erro }

    End;

  End;

End;

Function TSaldamentoAssistido.InsereHstContribPREV( qryAux                              : TwwQuery;
                                                    piIdPessoa,       piSeqProposta,
                                                    piIdPessJur,      piIdPlanoPrev,
                                                    piIdContribuicao, piIdMotivo        : longint;
                                                    psMesReferencia,  psMesCobranca     : string;
                                                    piCodPortForma                      : longint;
                                                    psDataCobranca,   psDataRecebimento : string;
                                                    pdValorEsperado,  pdValorCalculado,
                                                    pdValorRecebido                     : double;
                                                    piIdRegraCalculo                    : longint;
                                                    piFlgDescFolha                      : integer;
                                                    pdValorBase1,     pdValorBase2,
                                                    pdValorBase3                        : double;
                                                    psDataInicio,     psDataFinal,
                                                    psFlgIntSitPart                     : string;
                                                    piSitRecebimento,
                                                    piParcela,
                                                    piIdLote                            : longint;
                                                    pcTipoPrevidencia                   : char;
                                                    piFlgCalcReserva,
                                                    piFlgDevolucao,   piFlgConcessao,
                                                    piFlgEvento                         : integer;
                                                    psFolhaOrigem                       : string = '';
                                                    piIdMovBenef : Integer = -1 ) : longint;
var sSQLValues      : string;
    iNumRecebimento : longint;
begin
   Result := -1;

   // Inserir valor final na HSTCONTRIBPREV
   iNumRecebimento := GetSequence( 'HSTCONTRIBPREV' );

   sSQLValues := ''''+psMesReferencia+'''';
   sSQLValues := sSQLValues+','''+psMesCobranca+'''';
   sSQLValues := sSQLValues+',' +IntToStr(iNumRecebimento);
   sSQLValues := sSQLValues+',' +IntToStr(piIdMotivo);

   if piCodPortForma > 0
   then sSQLValues := sSQLValues+', '+IntToStr(piCodPortForma)
   else sSQLValues := sSQLValues+', NULL ';

   if Trim(psDataCobranca) <> ''
   then sSQLValues := sSQLValues+', TO_DATE('''+Trim(psDataCobranca)+''',''DD/MM/YYYY'') '
   else sSQLValues := sSQLValues+', NULL ';

   if Trim(psDataRecebimento) <> ''
   then sSQLValues := sSQLValues+', TO_DATE('''+Trim(psDataRecebimento)+''',''DD/MM/YYYY'') '
   else sSQLValues := sSQLValues+', NULL ';

   sSQLValues := sSQLValues+', '+OraNumero(FloatToStr(pdValorEsperado));  // ValorEsperado
   sSQLValues := sSQLValues+', '+OraNumero(FloatToStr(pdValorCalculado)); // ValorCalculado

   { CPrev Augusto 21/02/2008 }
   If ( pdValorRecebido = 0 ) // ValorRecebido
   Then sSQLValues := sSQLValues+', NULL '
   Else sSQLValues := sSQLValues+', '+OraNumero(FloatToStr(pdValorRecebido));

   if piIdRegraCalculo > 0
   then sSQLValues := sSQLValues+', '+IntToStr(piIdRegraCalculo)
   else sSQLValues := sSQLValues+', NULL ';

   sSQLValues := sSQLValues+', '+IntToStr(piFlgDescFolha);

   sSQLValues := sSQLValues+', '+IntToStr(piIdPessoa);
   sSQLValues := sSQLValues+', '+IntToStr(piSeqProposta);
   sSQLValues := sSQLValues+', '+IntToStr(piIdPessJur);
   sSQLValues := sSQLValues+', '+IntToStr(piIdPlanoPrev);
   sSQLValues := sSQLValues+', '+IntToStr(piIdContribuicao);

   sSQLValues := sSQLValues+', '+IntToStr(piFlgCalcReserva);

   sSQLValues := sSQLValues+', '+OraNumero(FloatToStr(pdValorBase1));
   sSQLValues := sSQLValues+', '+OraNumero(FloatToStr(pdValorBase2));
   sSQLValues := sSQLValues+', '+OraNumero(FloatToStr(pdValorBase3));

   if Trim(psDataInicio) <> ''
   then sSQLValues := sSQLValues+', TO_DATE('''+Trim(psDataInicio)+''',''DD/MM/YYYY'') '
   else sSQLValues := sSQLValues+', NULL ';

   if Trim(psDataFinal) <> ''
   then sSQLValues := sSQLValues+', TO_DATE('''+Trim(psDataFinal)+''',''DD/MM/YYYY'') '
   else sSQLValues := sSQLValues+', NULL ';

   if Trim(psFlgIntSitPart) <> ''
   then sSQLValues := sSQLValues+', '''+psFlgIntSitPart+''''
   else sSQLValues := sSQLValues+', NULL ';

   sSQLValues := sSQLValues+', '+IntToStr(piSitRecebimento);

   sSQLValues := sSQLValues+', '''+pcTipoPrevidencia+'''';     // TIPO

   if piIdLote > 0
   then sSQLValues := sSQLValues+', '+IntToStr(piIdLote)       // IDLOTE
   else sSQLValues := sSQLValues+', NULL ';

   sSQLValues := sSQLValues+', '+IntToStr(piParcela);          // PARCELA
   sSQLValues := sSQLValues+', '+IntToStr(piFlgDevolucao);     // FLGDEVOLUICAO
   sSQLValues := sSQLValues+', '+IntToStr(piFlgConcessao);     // FLGCONCESSAO
   sSQLValues := sSQLValues+', '+IntToStr(piFlgEvento);        // FLGEVENTO

   if (psFolhaOrigem = '') or ( (psFolhaOrigem <> 'P') and (psFolhaOrigem <> 'C') and (psFolhaOrigem <> 'B'))
   then begin
      if psFlgIntSitPart = 'AS'      // FOLHAORIGEM
      then sSQLValues := sSQLValues +', ''B'' '
      else
      begin
         if piFlgDescFolha = 0 then
            sSQLValues := sSQLValues +', ''C'' '
         else  sSQLValues := sSQLValues +', ''P'' ';

      end;
   end
   else 
     sSQLValues := sSQLValues +', '''+psFolhaOrigem+'''';


   if ( piIdMovBenef > 0 )
   then sSQLValues := sSQLValues+', '+IntToStr( piIdMovBenef ) // IDMOVBENEF
   else sSQLValues := sSQLValues+', NULL ';

   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' INSERT INTO HSTCONTRIBPREV (MESREFERENCIA,MESCOBRANCA,NUMRECEBIMENTO,IDMOTIVO,'+
              '                             CODPORTFORMA,DATAPREVISAORECE,DATARECEBIMENTO, '+
              '                             VALORESPERADO,VALORCALCULADO,VALORRECEBIDO,IDREGRACALCULO, '+
              '                             FLGDESCFOLHA,IDPESSOA,SEQPROPOSTA,IDPESSJUR,IDPLANOPREV,IDCONTRIBUICAO, '+
              '                             FLGCALCRESERVA,VALOROP1,VALOROP2,VALOROP3,DATAINICIO,DATAFINAL,         '+
              '                             FLGSITFUNDACAO,SITRECEBIMENTO,TIPO,IDLOTE,PARCELA,FLGDEVOLUCAO,FLGCONCESSAO, '+
              '                             FLGEVENTO, FOLHAORIGEM, IDMOVBENEF ) '+ 
              ' VALUES('+sSQLValues+')');
      try
         Execsql;
      except
         Exit;
      end;
   end;

   Result := iNumRecebimento;
End;


{------------------------------------------------------------------------------}
{ Inserir correções monetária                    }
//BRUNO AZEVEDO SOL 133751 KINTANA 782370 
//ADICIONADO IFLGDEVOLUCAO
Function TSaldamentoAssistido.InsereCorrecaoMonetaria( pcTipoCorracao : Char;
                                                       psAnoMesRef    : String;
                                                       pdValor        : Double;
                                                       piNumeroProcesso, piIdBeneficio, piIdBeneficiario, piIdMotivo : Integer;
                                                       piIdentificadorHistorico : LongInt;
                                                       piFlgDevolucao : Integer ): Boolean;
Var
  iIdRubrica : Integer;
  bBenefProprio : Boolean;
  sSQL, sSQLUPD, sFlgTipo, sDataInicio, sDataFinal, sSQLSeqBeneficio : String;
  iCodAlteradorB, iCodAlteradorC : Integer;

begin

  pdValor := StrToFloat( FormatFloat('#0.00', pdValor));
  if StrToFloat( FormatFloat('#0.00', pdValor)) = 0 then  Exit;


  If pcTipoCorracao = 'B' Then Begin

    { BENEFICIO }

    iCodAlteradorB := 17;

    sFlgTipo := 'A'; { Atraso, pagar para o associado }

    if pdValor < 0 then begin

      sFlgTipo := 'D'; { Devolução, cobrar do associado }
      iCodAlteradorB := 262;

    end;

    pdValor := Abs(pdValor);


    sSQLSeqBeneficio := '( SELECT '+
                        '    NVL( ( MAX( H.SEQBENEFICIO ) ), 0 ) AS PROXSEQBENEFICIO '+
                        '  FROM   '+
                        '    HSTBENEFBFCIARIO H '+
                        '  WHERE  '+
                        '    ( H.NUMEROPROCESSO = '+ IntToStr( piNumeroProcesso )    +' ) AND '+
                        '    ( H.IDPESSOA       = '+ IntToStr( piIdBeneficiario )    +' ) AND '+
                        '    ( H.MESREFERENCIA  = '+ QuotedStr( psAnoMesRef ) +' ) ';
    If ( piIdMotivo > 0 )
    Then sSQLSeqBeneficio := sSQLSeqBeneficio + ' AND ( H.IDMOTIVO = '+ IntToStr( piIdMotivo ) +' ) ) '
    Else sSQLSeqBeneficio := sSQLSeqBeneficio + ' ) ';
    {-}

    sSQL :='INSERT INTO HSTATRASOBENEF '+
           ' (IDPESSJUR, IDTITULAR, IDPLANOPREV, MES, IDMOTIVO, NUMEROPROCESSO,  '+
           '  IDBENEFICIO, IDPESSOA, MESREFERENCIA, SEQPROPOSTA, SEQBENEFICIO,   '+
           '  CODALTERADOR, VALOR, FLGTIPO, FLGRETROATIVO)                       '+
           'VALUES ( '+
             CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString               +', '+
             CdsDadosIndividuo.FieldByName('IDTITULAR').AsString               +', '+
             IntToStr( iIdNovoPlano )                                          +', '+
             QuotedStr( sAnoMesLoteProcesso )                                  +', '+
             IntToStr( piIdMotivo )                                            +', '+
             IntToStr( piNumeroProcesso )                                      +', '+
             IntToStr( piIdBeneficio )                                         +', '+
             IntToStr( piIdBeneficiario )                                      +', '+
             QuotedStr(psAnoMesRef)                                            +', '+
             CdsDadosIndividuo.FieldByName('SEQPROPOSTA').AsString             +', '+

             sSQLSeqBeneficio                                                  + ',' + { SEQBENEFICIO    }
             IntToStr( iCodAlteradorB )                                        +', '+
             OraNumero(FloattoStr(Abs(pdValor)))                      +', '+
             QuotedStr(sFlgTipo)                                      +', '+
             '1'                                                      +') ';

  End Else If pcTipoCorracao = 'C' Then Begin

    { CONTRIBUIÇÃO }

    //BRUNO AZEVEDO SOL 133751 KINTANA 782370 SOL 136276 KINTANA 813879

{    iCodAlteradorC := 262;
    sFlgTipo := 'A';

    if pdValor < 0 then begin
      iCodAlteradorC := 323;
      sFlgTipo := 'D';
    end;
 }  
    //BRUNO AZEVEDO SOL 133751 KINTANA 782370
    iCodAlteradorC := 323;
    sFlgTipo := 'A'; { Atraso, pagar para o associado }

    if (piFlgDevolucao = 0) then begin
      iCodAlteradorC := 262;
      sFlgTipo := 'D'; { Devolução, cobrar do associado }
    end;

    pdValor := Abs(pdValor);

    If ( FTipoArquivo = taPensionista ) Then Begin

      sSQLUPD := 'SELECT  '+
                 '  NUMRECEBIMENTO '+
                 'FROM   '+
                 '  HSTATRASOCONTRIB HST  '+
                 'WHERE  '+
                 '  ( HST.NUMRECEBIMENTO      = '+ IntToStr( piIdentificadorHistorico ) +' ) ';

      CdsSaldamentoAux.Data := GetDataPacket( sSQLUPD );

    End;

    If ( CdsSaldamentoAux.IsEmpty ) Or ( FTipoArquivo = taAposentado ) Then Begin

      sSQL :='INSERT INTO HSTATRASOCONTRIB '+
             '  (NUMRECEBIMENTO, MESREFERENCIA, MESCOBRANCA, IDMOTIVO, FLGTIPO, '+
             '   VALOR, CODALTERADOR, FLGEVENTO)                                '+
             'VALUES( '+
             IntToStr( piIdentificadorHistorico )                         +', '+
             QuotedStr( psAnoMesRef )                                     +', '+
             QuotedStr( sAnoMesLoteProcesso )                             +', '+
             IntToStr( piIdMotivo )                                       +', '+
             QuotedStr( sFlgTipo )                                        +', '+
             OraNumero(FloattoStr(Abs(pdValor)))                          +', '+
             IntToStr( iCodAlteradorC )                                   +', '+
             QuotedStr('0')                                               +') ';

    End Else Begin

      sSQL := 'UPDATE HSTATRASOCONTRIB HST SET '+
              '  HST.VALOR = ( HST.VALOR + '+ OraNumero( FloatToStr( pdValor ) ) +' )  '+
              'WHERE  '+
              '  ( HST.NUMRECEBIMENTO = '+ IntToStr( piIdentificadorHistorico ) +' ) ';
    End;


  End; { If }

  Try

    If Not ExecSQL( sSQL ) Then Abort;

    Result := True;

  Except

    On E:Exception Do Begin

      sMensagemDeErro := E.Message;

      If ( sMensagemDeErro = 'Operation aborted' ) Then sMensagemDeErro := MessageInfo;

      Result := False;
    End;

  End;

end;

{----------------------------------------------------------------------------}
{ Insere na RUBRICAINDIV                                                     }
Function TSaldamentoAssistido.InsereRubricaIndiv( piIdPessoa, piIdRubrica, piIdRegra,
                                                  piNumeroDeParcelas, piIdUltMovBenef : Integer;
                                                  dValor : Double ): Boolean;
Var
  sIdUltMovBenef, sSQL, sDataFinal, sIdRegra : String;

Begin

  If ( piIdUltMovBenef = -1 )
  Then sIdUltMovBenef := 'NULL'
  Else sIdUltMovBenef := IntToStr( piIdUltMovBenef );

  If ( piIdRegra <= 0 )
  Then sIdRegra := 'NULL'
  Else sIdRegra := IntToStr( piIdRegra );

  Result := False;

  sDataFinal  := EvoluiMes( StrToDate( sDataLoteProcesso ), (piNumeroDeParcelas - 1 ) ) ;
  sDataFinal  := DateToStr( TrazUltDiaData( StrToDate( sDataFinal ) ) );

  sSQL := ' INSERT INTO RUBRICAINDIV ( '+
          ' ANOMESREF,      DATAINICIO,        DATAFINAL,                       '+
          ' FLGPENSAOALIM,  FLGPERMANENTE,     FLGTPRUBMANUT,   FLGUSAABONO,    '+
          ' IDEMPRESA,      IDPESSOA,          IDRUBRICA,       IDTITULAR,      '+
          ' NUMOCORRENCIAS, PARCELAS,          SEQRUBRICAINDIV, ULTMESPREPARO,  '+
          ' VALORANTERIOR,  VALORRUBRICA,      IDLOTEREVISAO,   IDMOVBENEF,     '+
          ' IDREGRACALCULO )           '+
          ' VALUES (                                                            '+
          QuotedStr( sAnoMesLoteProcesso )                                       + ', ' +
          ' TO_DATE('''+ sDataLoteProcesso +''',''DD/MM/YYYY'') ,               '+
          ' TO_DATE('''+ sDataFinal  +''',''DD/MM/YYYY'') ,                     '+

          ' 0,                                                                  '+  // FLGPENSAOALIM {0}
          ' 0,                                                                  '+  // FLGPERMANENTE {0}
          ' ''1'',                                                              '+  // FLGTPRUBMANUT {"1"}
          ' 0,                                                                  '+  // FLGUSAABONO   {0}
          IntToStr( Sistema.IdEmpresa )                                         +', '+
          IntToStr( piIdPessoa )                                                +' , '+
          IntToStr( piIdRubrica )                                               +', '+
          CdsDadosIndividuo.FieldByName('IDTITULAR').AsString+',                '+
          ' 0,                                                                  '+  // NUMOCORRENCIAS {0}
          IntToStr( piNumeroDeParcelas )+',                                      '+
          '(SELECT (NVL(MAX(SEQRUBRICAINDIV),0)+1) FROM RUBRICAINDIV WHERE '+
          ' IDPESSOA = '+CdsDadosIndividuo.FieldByName('IDPESSOA').AsString+
          ' AND IDRUBRICA = '+IntToStr( piIdRubrica )+'), '+
          ' ''0000/00'',                                                        '+
          ' 0,                                                                  '+  // VALORANTERIOR {0}
          OraNumero(FormatFloat('#0.00',Abs( dValor )))+', '+                       // VALORRUBRICA
          IntToStr( iIdLoteProcesso ) +', '+                                        // IDLOTEREVISAO
          sIdUltMovBenef            +', '+                                          // IDMOVBENNF
          sIdRegra +') ';                                                           // IDREGRACALCULO

  Try

    If Not ExecSQL( sSQL ) Then Abort;

    Result := True;

  Except

    On E:Exception Do Begin

      sMensagemDeErro := E.Message;

      If ( sMensagemDeErro = 'Operation aborted' ) Then sMensagemDeErro := MessageInfo;

      Result := False; { Erro }

    End;

  End;


End;
{----------------------------------------------------------------------------}

{----------------------------------------------------------------------------}
{ Busca dados das reservas matemáticas                                       }
Function TSaldamentoAssistido.RetornaValorReserva( piIdBeneficiario, piIdTipoReserva : Integer ): Double;
Var
  sSQL : String;
  iIdHisMovReserva : Integer;
Begin

  sSQL := 'SELECT RES.VALORRESERVA '+
          'FROM RESERVAPART RES '+
          'WHERE '+
          '      RES.IDPESSJUR      = '+ CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString    +
          '  AND RES.IDPESSOA       = '+ IntToStr( piIdBeneficiario )                           +
          '  AND RES.IDPLANOPREV    = '+ IntToStr( iIdNovoPlano )                               +
          '  AND RES.IDTIPORESERVA  = '+ IntToStr( piIdTipoReserva )                            +
          '  AND RES.SEQPROPOSTA    = '+ CdsDadosIndividuo.FieldByName('SEQPROPOSTA').AsString  +
          '  AND RES.IDPARTICIPANTE = '+ CdsDadosIndividuo.FieldByName('IDTITULAR').AsString;

  CdsSaldamentoAux.Data := GetDataPacket( sSQL );

  If ( Not CdsSaldamentoAux.IsEmpty ) Then Begin

    Result := CdsSaldamentoAux.FieldByName('VALORRESERVA').AsFloat;

    If ( FPercentual > 0 ) And ( Not ( piIdTipoReserva  In [ 122, 123 ] ) ) Then Begin

      sSQL := 'UPDATE RESERVAPART RES  SET  RES.VALORRESERVA = RES.VALORRESERVA - ( RES.VALORRESERVA * '+ OraNumero( FloatToStr( FPercentual/100 ) )  + ' ) '+
              'WHERE '+
              '      RES.IDPESSJUR      = '+ CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString    +
              '  AND RES.IDPESSOA       = '+ IntToStr( piIdBeneficiario ) +
              '  AND RES.IDPLANOPREV    = '+ IntToStr( iIdNovoPlano ) +
              '  AND RES.IDTIPORESERVA  = '+ IntToStr( piIdTipoReserva ) +
              '  AND RES.SEQPROPOSTA    = '+ CdsDadosIndividuo.FieldByName('SEQPROPOSTA').AsString  +
              '  AND RES.IDPARTICIPANTE = '+ CdsDadosIndividuo.FieldByName('IDTITULAR').AsString;

      If Not ExecSQL( sSQL ) Then Abort;

      iIdHisMovReserva := GetSequenceLocal( 'HISTMOVRESERVA' );

      sSQL := 'INSERT INTO HISTMOVRESERVA (                                                                       '+
              '  IDHISTRESERVA,  IDREGRACALCULO,  IDPLANOPREV,     IDTIPORESERVA, IDPESSJUR,      IDPESSOA,       '+
              '  SEQPROPOSTA,    IDEVENTOGERADOR, IDCONTRIBUICAO,  IDBENEFICIO,   DATAMOV,        VLRREAL,        '+
              '  VLRCOTAS,       SALDOREAL,       SALDOCOTAS,      FLGENTRADA,    PERCENTUAL,     IDPARTICIPANTE, '+
              '  SALDOREALCONT,  VALORINDICE,     DATAALIMENTACAO, MESREFERENCIA, FLGPROCEDENCIA, PLNCODIGO,      '+
              '  SALDOCORRIGIDO, INDICECORRECAO,  NUMRECEBIMENTO,  DATAINDICE )                                   '+
              'VALUES ( '+
              IntToStr( iIdHisMovReserva )                                    + ', ' +
              'NULL,  '                                                       +
              IntToStr( iIdNovoPlano )                                        + ', ' +
              IntToStr( piIdTipoReserva )                                     + ', ' +
              CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString             + ', ' +
              IntToStr( piIdBeneficiario )                                    + ', ' +
              CdsDadosIndividuo.FieldByName('SEQPROPOSTA').AsString           + ', ' +
              IntToStr( iIdEventoDeSaldamento )                               + ', ' +
              'NULL,  '                                                       +
              'NULL,  '                                                       +
              ' TO_DATE('''+ DateToStr( Date ) +''',''DD/MM/YYYY''), '        +
              OraNumero( FormatFloat('#0.00',  ( Result * FPercentual/100 ) ) )+ ', ' +
              OraNumero( FormatFloat('#0.00',  ( Result * FPercentual/100 ) ) )+ ', ' +
              OraNumero( FormatFloat('#0.00',  Result - ( Result * FPercentual/100 ) ) )+ ', ' +
              OraNumero( FormatFloat('#0.00',  Result - ( Result * FPercentual/100 ) ) )+ ', ' +
              '1, '                                                           +
              '0, '                                                           +
              CdsDadosIndividuo.FieldByName('IDTITULAR').AsString             + ', ' +
              '0, '                                                           +
              '0, '                                                           +
              ' TO_DATE('''+ DateToStr( Date ) +''',''DD/MM/YYYY''), '        +
              QuotedStr( FormatDateTime( 'YYYY/MM', Date  ) )                 + ', '+
              'NULL,  '                                                       +
              'NULL,  '                                                       +
              'NULL,  '                                                       +
              'NULL,  '                                                       +
              'NULL,  '                                                       +
              'NULL   '                                                       +
              ')';

      If Not ExecSQL( sSQL ) Then Abort;

    End;

  End;

End;
{----------------------------------------------------------------------------}

{------------------------------------------------------------------------------}
{ Inserir dados dos beneficios                                                 }
Function TSaldamentoAssistido.InsereBeneficio( CdsDadosBeneficio : TCMClientDataSet;
                                               piIdBeneficiario, piIdBeneficioOrigem,
                                               piIdBeneficioDestino: Integer;
                                               pbEhRA, pbEhDiferencaRA : Boolean;
                                               Var piNumeroProcesso : Integer;
                                               ptbBeneficio : TTipoBeneficio ): Boolean;
Var
  sSQL, sDataFinal, sDataInicio, sPlaContaC, sPlaContaD,
  sUltMesPreparo  : String;

  dValorReservaAT49, dValorReservaAT83, dValorDiferencaTabuas,
  dPercentual, dValorAtual, dValorTotal : Double;

  sValorAtual, sValorTotal : String;
  iNumeroProcessoSUPL, iIdBeneficioReplan, iIdSitBeneficio, iAnoDataFinal,
  iPercentual : Integer;

Begin
  
  Try

    {--------------------------------------------------------------------------}
    { BFCIARIOTITPLAN                                                          }
    If ( pbEhRA = True ) Then Begin

      If ( FTipoArquivo = taAposentado )
      Then dPercentual := 100
      Else dPercentual := CdsDadosBeneficio.FieldByName('PERCENTUAL').AsFloat;

      sSQL := 'INSERT INTO BFCIARIOTITPLAN (                                              '+
              '  IDTITULAR,          IDPESSJUR,       IDPLANOPREV,      IDPLANOORIGEM,    '+
              '  IDPESSOA,           IDRESPONSAVEL,   IDBENEFICIO,      SEQPROPOSTA,      '+
              '  IDDEPENRESPON,      PRIORIDADE,      PERCENTUAL,       IDNUCLEOFAMILIAR, '+
              '  CODTIPORECEBEDOR,   DATAFIMRECEB,    IDRESPONNAOREC )                    '+
              'VALUES ('+
                CdsDadosIndividuo.FieldByName('IDTITULAR').AsString     + ', ' +
                CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString     + ', ' +
                IntToStr( iIdNovoPlano )                                + ', ' +
                IntToStr( iIdNovoPlano )                                + ', ' +
                IntToStr( piIdBeneficiario )                            + ', ' + { IDPESSOA           }
                CdsDadosBeneficio.FieldByName('IDRESPONSAVEL').AsString + ', ' +
                IntToStr( piIdBeneficioDestino )                        + ', ' +
                CdsDadosBeneficio.FieldByName('SEQPROPOSTA').AsString   + ', ' +
                'NULL, 0, '+
                OraNumero( FloatToStr( dPercentual )  )                 + ', ' +
                'NULL, NULL, NULL, NULL )';

    End Else Begin

      sSQL := 'INSERT INTO BFCIARIOTITPLAN (                                              '+
              '  IDTITULAR,          IDPESSJUR,       IDPLANOPREV,      IDPLANOORIGEM,    '+
              '  IDPESSOA,           IDRESPONSAVEL,   IDBENEFICIO,      SEQPROPOSTA,      '+
              '  IDDEPENRESPON,      PRIORIDADE,      PERCENTUAL,       IDNUCLEOFAMILIAR, '+
              '  CODTIPORECEBEDOR,   DATAFIMRECEB,    IDRESPONNAOREC )                    '+
              'SELECT '+
              '  B.IDTITULAR,        B.IDPESSJUR,     '+IntToStr( iIdNovoPlano )+', '+
              IntToStr( iIdNovoPlano )+', '+
              '  B.IDPESSOA,         B.IDRESPONSAVEL, '+ IntToStr( piIdBeneficioDestino ) +', B.SEQPROPOSTA,     '+
              '  B.IDDEPENRESPON,    B.PRIORIDADE,    B.PERCENTUAL,     B.IDNUCLEOFAMILIAR,'+
              '  B.CODTIPORECEBEDOR, B.DATAFIMRECEB,  B.IDRESPONNAOREC                     '+
              'FROM  BFCIARIOTITPLAN B '+
              'WHERE  '+
              '      B.IDPESSJUR     = '+ CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString      +

              '  AND B.IDPLANOPREV   = '+ CdsDadosBeneficio.FieldByName('IDPLANOPREV').AsString    +
              '  AND B.IDPLANOORIGEM = '+ CdsDadosBeneficio.FieldByName('IDPLANOORIGEM').AsString  +
              '  AND B.IDTITULAR     = '+ CdsDadosIndividuo.FieldByName('IDTITULAR').AsString      +
              '  AND B.IDPESSOA      = '+ IntToStr( piIdBeneficiario )                             +
              '  AND B.SEQPROPOSTA   = '+ CdsDadosIndividuo.FieldByName('SEQPROPOSTA').AsString    +
              '  AND B.IDBENEFICIO   = '+ IntToStr( piIdBeneficioOrigem );

    End;

    If Not ExecSQL( sSQL ) Then Abort;

    {--------------------------------------------------------------------------}
    { PROCESSOBENEF                                                            }

    { Incluir novo processo }

    If ( piNumeroProcesso < 0 ) Then Begin

      If ( piNumeroProcesso = -1 ) Then piNumeroProcesso := GetSequenceLocal('PROCESSOBENEF');

      sSQL := 'INSERT INTO PROCESSOBENEF ( '+
              '  NUMEROPROCESSO, IDEVENTOGERADOR, DTEVENTO, DTDIREITO, '+
              '  DTREGISTRO,     IDSITPROCESSO ) '+
              'VALUES ('+ IntToStr( piNumeroProcesso )      +', '+
                          IntToStr( iIdEventoDeSaldamento ) +', '+
              '          TO_DATE('''+ sDataEvento +''',''DD/MM/YYYY''), '+
              '          TO_DATE('''+ sDataEvento +''',''DD/MM/YYYY''), '+
              '          TO_DATE('''+ sDataEvento +''',''DD/MM/YYYY''), '+
              '          1 ) ';

      If Not ExecSQL( sSQL ) Then Abort;

    End;

    {--------------------------------------------------------------------------}
    { BENEFBFCIARIO                                                            }

    If ( pbEhRA = True ) Then Begin

      sDataInicio := sDataEvento;
      sDataFinal  := sDataInicio;

      dValorRMOriginal  := RetornaValorReserva( piIdBeneficiario, 113 );

      dValorAtual       := ( dValorRMOriginal * ( Fpercentual / 100 ) );
      dValorRAParcelada := ( dValorAtual / FNumeroDeParcelas );

      dValorTotal      := dValorRMOriginal;
      dValorRAOriginal := dValorAtual;

      sUltMesPreparo := sAnoMesLoteProcesso;

      sSQL := ' INSERT INTO BENEFBFCIARIO ('+
              '   NUMEROPROCESSO,        IDPLANOPREV,          IDPLANOORIGEM,       IDTITULAR,           '+
              '   IDPESSJUR,             IDBENEFICIO,          IDPESSOA,            PLANO,               '+
              '   SEQPROPOSTA,           IDDEPENDENCIA,        IDSITBENEFICIO,      IDTPPAGTOBENEFIC,    '+
              '   DATAFINAL,             VALORATUAL,           CODPORTFORMA,        DATAREQUERIMENTO,    '+
              '   DATAINICIO,            TMPPAGTOBENEFICIO,    FLGFORMAPAGTO,       VALORCALCULADO,      '+
              '   DATAULTREAJUSTE,       ULTMESPREPARO,        VLRCALCINSS,         VLRINFINSS,          '+
              '   DATAINICIOINSS,        NUMPROCINSS,          DATAINICIOFUND,      FLGBENEFMIN,         '+
              '   VALORCOTAS,            VALORTOTAL,           DATACONCESSAO,       DATAENCERRAMENTO,    '+
              '   FLGPROVISORIO,         PERCPROVISORIO,       PRAZOPROVISORIO,     NUMCARTARECAD,       '+
              '   DATAEMISSAORECAD,      DATALIMITERECAD,      DATARECEBRECAD,      FLGSTATUS,           '+
              '   BANCOINSS,             MESRECIBOINSS,        ANORECIBOINSS,       FONTEPAGADORA,       '+
              '   IDAGENCIARESGATE,      ULTMESREAJUSTE,       ULTVALORATUALREAJ,   ULTVALORBRUTO,       '+
              '   VALORABONO13,          FLGDATAPREVISTA,      DATAFINALPREVISTA,   DIBBENEFANT,         '+
              '   VALORBENEFANT,         DFLOATPAGTO,          FLGTIPOINSS,         FLGENCERRAPORFALE,   '+
              '   DATAULTREVISAO,        FLGDESCIRMES,         PERCENTUAL,          VALORNADIB,          '+
              '   FLGPOSSUIACOMPINSS,    VALORSRB,             IDBENEFREFEREN,      DATALIBERACAO,       '+
              '   MESPAGLIBERACAO,       IDTITBENEF,           FLGACERTOCBP,        VALORBASE1,          '+
              '   VALORBASE2,            VALORBASE3,           IDPLANPREVCONTAB,    PLACONTAD,           '+
              '   PLACONTAC   )  '+
              ' VALUES ('+
                IntToStr( piNumeroProcesso ) + ', ' +                            { NUMEROPROCESSO     }
                IntToStr( iIdNovoPlano )     + ', ' +                            { IDPLANOPREV        }
                IntToStr( iIdNovoPlano )     + ', ' +                            { IDPLANOORIGEM      }
                CdsDadosIndividuo.FieldByName('IDTITULAR').AsString     + ', ' +
                CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString     + ', ' +
                IntToStr( piIdBeneficioDestino )                        + ', ' + { IDBENEFICIO        }

                IntToStr( piIdBeneficiario )                            + ', ' + { IDPESSOA           }

                'NULL, ' +                                                       { PLANO              }
                CdsDadosIndividuo.FieldByName('SEQPROPOSTA').AsString   + ', ' +
                'NULL, ' +                                                       { IDDEPENDENCIA      }
                '3, ' +                                                          { IDSITBENEFICIO     }
                '2, ' +                                                          { IDTPPAGTOBENEFIC   }
                ' TO_DATE('''+ sDataFinal +''',''DD/MM/YYYY''), '+               { DATAFINAL          }

                OraNumero( FormatFloat('#0.00', dValorAtual )  ) +  ', '+        { VALORATUAL         }

                'NULL, ' +                                                       { CODPORTFORMA       }
                'TO_DATE('''+ sDataEvento +''',''DD/MM/YYYY''), '+               { DATAREQUERIMENTO   }
                'TO_DATE('''+ sDataInicio +''',''DD/MM/YYYY''), '+               { DATAINICIO         }
                'NULL, ' +                                                       { TMPPAGTOBENEFICIO  }
                '''F'', ' +                                                      { FLGFORMAPAGTO      }

                OraNumero( FormatFloat('#0.00', dValorAtual )  ) +  ', '+        { VALORCALCULADO     }

                'NULL, ' +                                                       { DATAULTREAJUSTE    }

                QuotedStr( sUltMesPreparo ) +', '+                               { ULTMESPREPARO      }

                '0, ' +                                                          { VLRCALCINSS        }
                '0, ' +                                                          { VLRINFINSS         }
                'NULL, ' +                                                       { DATAINICIOINSS     }
                'NULL, ' +                                                       { NUMPROCINSS        }
                'TO_DATE('''+ sDataInicio +''',''DD/MM/YYYY''), '+               { DATAINICIOFUND     }
                'NULL, ' +                                                       { FLGBENEFMIN        }
                '0, ' +                                                          { VALORCOTAS         }

                OraNumero( FormatFloat('#0.00', dValorTotal )  ) +  ', '+        { VALORTOTAL         }

                'TO_DATE('''+ sDataInicio +''',''DD/MM/YYYY''), '+               { DATACONCESSAO      }
                'TO_DATE('''+ sDataInicio +''',''DD/MM/YYYY''), '+               { DATAENCERRAMENTO   }
                '0, ' +                                                          { FLGPROVISORIO      }
                '0, ' +                                                          { PERCPROVISORIO     }
                '0, ' +                                                          { PRAZOPROVISORIO    }
                'NULL, ' +                                                       { NUMCARTARECAD      }
                'NULL, ' +                                                       { DATAEMISSAORECAD   }
                'NULL, ' +                                                       { DATALIMITERECAD    }
                'NULL, ' +                                                       { DATARECEBRECAD     }
                'NULL, ' +                                                       { FLGSTATUS          }
                'NULL, ' +                                                       { BANCOINSS          }
                'NULL, ' +                                                       { MESRECIBOINSS      }
                'NULL, ' +                                                       { ANORECIBOINSS      }
                '1, ' +                                                          { FONTEPAGADORA      }
                'NULL, ' +                                                       { IDAGENCIARESGATE   }
                'NULL, ' +                                                       { ULTMESREAJUSTE     }
                'NULL, ' +                                                       { ULTVALORATUALREAJ  }
                'NULL, ' +                                                       { ULTVALORBRUTO      }
                'NULL, ' +                                                       { VALORABONO13       }
                'NULL, ' +                                                       { FLGDATAPREVISTA    }
                'NULL, ' +                                                       { DATAFINALPREVISTA  }
                'NULL, ' +                                                       { DIBBENEFANT        }
                'NULL, ' +                                                       { VALORBENEFANT      }
                'NULL, ' +                                                       { DFLOATPAGTO        }
                'NULL, ' +                                                       { FLGTIPOINSS        }
                'NULL, ' +                                                       { FLGENCERRAPORFALE  }
                'NULL, ' +                                                       { DATAULTREVISAO     }
                'NULL, ' +                                                       { FLGDESCIRMES       }
                'NULL, ' +                                                       { PERCENTUAL         }
                '0, ' +                                                          { VALORNADIB         }
                'NULL, ' +                                                       { FLGPOSSUIACOMPINSS }
                '0, ' +                                                          { VALORSRB           }
                'NULL, ' +                                                       { IDBENEFREFEREN     }
                'NULL, ' +                                                       { DATALIBERACAO      }
                'NULL, ' +                                                       { MESPAGLIBERACAO    }
                CdsDadosIndividuo.FieldByName('IDTITULAR').AsString     + ', ' + { IDTITBENEF         }
                'NULL, ' +                                                       { FLGACERTOCBP       }
                OraNumero( FloatToStr( FPercentual )  ) +  ', '+                 { VALORBASE1         }
                OraNumero( FloatToStr( FNumeroDeParcelas )  ) +  ', '+           { VALORBASE2         }
                '0, ' +                                                          { VALORBASE3         }
                IntToStr( iIdPlanoContabil )+', '+                               { IDPLANPREVCONTAB   }
                QuotedStr( sPlaContaD ) +', '+                                   { PLACONTAD          }
                QuotedStr( sPlaContaC ) +') ';                                   { PLACONTAC          }

      If Not ExecSQL( sSQL ) Then Abort;

      { Somente para aposentados migrar a BENEFPLANOPART }
      If ( FTipoArquivo = taAposentado ) Then Begin

        sSQL := ' INSERT INTO BENEFPLANOPART BEN'+
                '  ( BEN.IDPESSJUR,         BEN.SEQPROPOSTA,      BEN.IDPLANOPREV,      BEN.IDPESSOA,             '+
                '    BEN.IDBENEFICIO,       BEN.IDEMPRESAPROPABN, BEN.IDEMPRESAPROP,    BEN.RECPAGDEVOL,          '+
                '    BEN.VLBENEFDIGITADO,   BEN.CODTIPRECEBCAP,   BEN.CODCENTRORESPON,  BEN.CODCENTROCUSTODA,     '+
                '    BEN.CODRECEBCAPABN,    BEN.CODTIPRECDES,     BEN.CODCENTROCUSTOCA, BEN.RECPAG,               '+
                '    BEN.PLACONTADABN,      BEN.PLACONTACABN,     BEN.VLBENEFCALCULADO, BEN.RECPAGABN,            '+
                '    BEN.CODPORTFORMA,      BEN.VALORBASE1,       BEN.CODTIPDOC,        BEN.CODSUBCONTA,          '+
                '    BEN.CODALTERADORCORR,  BEN.VALORBASE2,       BEN.TIPCODIGO,        BEN.UNIDNEGOC,            '+
                '    BEN.VALORBASE3,        BEN.CODCENTROCUSTOD,  BEN.IDEMPRESA,        BEN.CODCENTROCUSTOC,      '+
                '    BEN.PLACONTAD,         BEN.IDEMPRESAABN,     BEN.PLANO,            BEN.PLACONTAC,            '+
                '    BEN.CODPORTFORMAABN,   BEN.CODTIPDOCABN,     BEN.TIPCODIGOABN,     BEN.CODTIPRECDESABN,      '+
                '    BEN.CODALTERAJUROSABN, BEN.CODALTERACORRABN, BEN.PLANOABN,         BEN.UNIDNEGOCABN,        '+
                '    BEN.CODCENTRORESPONA,  BEN.CODSUBCONTAABN,   BEN.CODTIPRECEBDEVOL, BEN.FLGBENEFMIN,          '+
                '    BEN.CODCCUSTODEVOL,    BEN.PLACONTADEVOL,        '+
                '    BEN.CODCCUSTODEVPATA,  BEN.PLACONTADEVPATA,  BEN.CODCCUSTODEVOLA,  BEN.PLACONTADEVOLA,       '+
                '    BEN.CODCCUSTODEVOLPAT, BEN.PLACONTADEVOLPAT, BEN.CODCCUSTOCPROVIS, BEN.CODCCUSTODPROVIS,    '+
                '    BEN.PLACONTACPROVIS,   BEN.PLACONTADPROVIS,  BEN.IDPLANPREVCONTAB )                           '+
                ' VALUES ('+
                  CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString     + ', ' +
                  CdsDadosIndividuo.FieldByName('SEQPROPOSTA').AsString   + ', ' +
                  IntToStr( iIdNovoPlano )     + ', ' +                            { IDPLANOPREV        }
                  CdsDadosIndividuo.FieldByName('IDTITULAR').AsString     + ', ' +
                  IntToStr( piIdBeneficioDestino )                        + ', ' + { IDBENEFICIO        }

                  'NULL, ' +                                                       { IDEMPRESAPROPABN   }
                  'NULL, ' +                                                       { IDEMPRESAPROP      }
                  'NULL, ' +                                                       { RECPAGDEVOL        }
                  OraNumero( FloatToStr( dValorAtual )  ) +  ', '+                 { VLBENEFDIGITADO    }
                  'NULL, ' +                                                       { CODTIPRECEBCAP     }
                  'NULL, ' +                                                       { CODCENTRORESPON    }
                  'NULL, ' +                                                       { CODCENTROCUSTODA   }
                  'NULL, ' +                                                       { CODRECEBCAPABN     }
                  'NULL, ' +                                                       { CODTIPRECDES       }
                  'NULL, ' +                                                       { CODCENTROCUSTOCA   }
                  'NULL, ' +                                                       { RECPAG             }
                  'NULL, ' +                                                       { PLACONTADABN       }
                  'NULL, ' +                                                       { PLACONTACABN       }
                  OraNumero( FloatToStr( dValorAtual )  ) +  ', '+                 { VLBENEFCALCULADO   }
                  'NULL, ' +                                                       { RECPAGABN          }
                  'NULL, ' +                                                       { CODPORTFORMA       }
                  OraNumero( FloatToStr( FPercentual )  ) +  ', '+                 { VALORBASE1         }
                  'NULL, ' +                                                       { CODTIPDOC          }
                  'NULL, ' +                                                       { CODSUBCONTA        }
                  'NULL, ' +                                                       { CODALTERADORCORR   }
                  'NULL, ' +                                                       { VALORBASE2         }
                  'NULL, ' +                                                       { TIPCODIGO          }
                  'NULL, ' +                                                       { UNIDNEGOC          }
                  'NULL, ' +                                                       { VALORBASE3         }
                  'NULL, ' +                                                       { CODCENTROCUSTOD    }
                  'NULL, ' +                                                       { IDEMPRESA          }
                  'NULL, ' +                                                       { CODCENTROCUSTOC    }
                  'NULL, ' +                                                       { PLACONTAD          }
                  'NULL, ' +                                                       { IDEMPRESAABN       }
                  'NULL, ' +                                                       { PLANO              }
                  'NULL, ' +                                                       { PLACONTAC          }
                  'NULL, ' +                                                       { CODPORTFORMAABN    }
                  'NULL, ' +                                                       { CODTIPDOCABN       }
                  'NULL, ' +                                                       { TIPCODIGOABN       }
                  'NULL, ' +                                                       { CODTIPRECDESABN    }
                  'NULL, ' +                                                       { CODALTERAJUROSABN  }
                  'NULL, ' +                                                       { CODALTERACORRABN   }
                  'NULL, ' +                                                       { PLANOABN           }
                  'NULL, ' +                                                       { UNIDNEGOCABN       }
                  'NULL, ' +                                                       { CODCENTRORESPONA   }
                  'NULL, ' +                                                       { CODSUBCONTAABN     }
                  'NULL, ' +                                                       { CODTIPRECEBDEVOL   }
                  'NULL, ' +                                                       { FLGBENEFMIN        }
                  'NULL, ' +                                                       { CODCCUSTODEVO      }
                  'NULL, ' +                                                       { PLACONTADEVOL      }
                  'NULL, ' +                                                       { CODCCUSTODEVPATA   }
                  'NULL, ' +                                                       { PLACONTADEVPATA    }
                  'NULL, ' +                                                       { CODCCUSTODEVOLA    }
                  'NULL, ' +                                                       { PLACONTADEVOLA     }
                  'NULL, ' +                                                       { CODCCUSTODEVOLPAT  }
                  'NULL, ' +                                                       { PLACONTADEVOLPAT   }
                  'NULL, ' +                                                       { CODCCUSTOCPROVIS   }
                  'NULL, ' +                                                       { CODCCUSTODPROVIS   }
                  'NULL, ' +                                                       { PLACONTACPROVIS    }
                  'NULL, ' +                                                       { PLACONTADPROVIS    }
                  IntToStr( iIdPlanoContabil ) + ') ';                             { IDPLANPREVCONTAB   }

        If Not ExecSQL( sSQL ) Then Abort;

      End; { If ( FTipoArquivo = taAposentado ) Then Begin }

    End Else Begin

      sUltMesPreparo := sAnoMesLoteProcesso;

      sDataFinal := CdsDadosBeneficio.FieldByName('DATAFINAL').AsString;

      If ( CdsDadosBeneficio.FieldByName('DATAINICIO').AsDateTime < StrToDate( '01/09/2001' ) )
      Then sDataInicio := '01/09/2001'
      Else sDataInicio := CdsDadosBeneficio.FieldByName('DATAINICIO').AsString;

      If ( pbEhDiferencaRA = True ) Then Begin

        iNumeroProcessoSUPL := CdsDadosBeneficio.FieldByName('NUMEROPROCESSO').AsInteger;
        iPercentual        := CdsDadosBeneficio.FieldByName('VALORBASE1').AsInteger;

        dValorReservaAT49     := RetornaValorReserva( piIdBeneficiario, 125 );
        dValorReservaAT83     := RetornaValorReserva( piIdBeneficiario, 126 );

        dValorDiferencaTabuas := ( dValorReservaAT83 - dValorReservaAT49 );

        If ( FSomenteDiferencaRA = True ) And ( dValorDiferencaTabuas <= 0 ) Then Begin

          sMensagemDeErro := 'DIFERENÇA ENTRE TÁBUAS É NEGATIVA.';
          Result := False;
          Exit;

        End;

        dValorRAOriginal      := ( dValorDiferencaTabuas * ( iPercentual / 100 ) );

        dValorAtual := ( CdsDadosBeneficio.FieldByName('VALORATUAL').AsFloat + dValorRAOriginal );
        dValorTotal := dValorAtual;

        sDataInicio     := CdsDadosBeneficio.FieldByName('DATAINICIO').AsString;
        sDataFinal      := CdsDadosBeneficio.FieldByName('DATAFINAL').AsString;

        iIdSitBeneficio := 3;

        sDataFinal      := sDataLoteProcesso;

      End Else Begin { If ( pbEhDiferencaRA = True ) Then Begin }

        { Caso seja mês de abono, deixar Folha preparar abono }
        // Daniel Begnami SOL:100082        
        // If ( Pos( '/11', sAnoMesLoteProcesso ) > 0 ) Then sUltMesPreparo := AnoMesAnterior( sAnoMesLoteProcesso );
        // Fim

        If ( ptbBeneficio = tbSuplementacao ) And ( FValorBSExterno <= 0 )
        Then dValorBSOriginal  := RetornaValorReserva( piIdBeneficiario, 114 )
        Else dValorBSOriginal  := FValorBSExterno;

        dValorAtual := dValorBSOriginal;
        dValorTotal := dValorAtual;

        If ( Fpercentual > 0 ) Then Begin

          dValorAtual := dValorAtual - ( dValorAtual * ( Fpercentual / 100 ) );
          dValorTotal := dValorTotal - ( dValorTotal * ( Fpercentual / 100 ) );

        End;


        //BRUNO AZEVEDO SOL 131372 KINTANA 747479
        AplicaIncentivo(dValorAtual);
        AplicaIncentivo(dValorTotal);

        if (Assigned(xQryIndices)) then begin
          FreeAndNil(xQryIndices);
        end;
        //BRUNO AZEVEDO SOL 131372 KINTANA 747479
        
        iIdSitBeneficio := 1;

        If ( ptbBeneficio = tbINSS ) Then Begin
          iIdBeneficioReplan := piIdBeneficioDestino;
        End Else Begin
          iIdBeneficioReplan := -1;
        End;

        RetornaDadosReplan( piIdBeneficiario, sDataInicio, sFiller, sFiller,
                            iIdBeneficioReplan, iIdSitBeneficio, iFiller, dFiller, pbEhRA );

        If ( StrToDate( sDataInicio ) < StrToDate( '01/09/2001' ) )
        Then sDataInicio := '01/09/2001';

        If ( FTipoArquivo = taPensionista ) And ( CdsDadosBeneficio.FieldByName('IDPLANOPREV').AsInteger = 2 ) Then Begin

          { Para pensões REB, somar e anos a datafinal }
          If ( Pos( CdsDadosBeneficio.FieldByName('IDDEPENDENCIA').AsString, 'COMCOP' ) = 0 ) And
             ( Not CdsDadosBeneficio.FieldByName('DATAFINAL').IsNull ) Then Begin

            iAnoDataFinal := StrToInt( FormatDateTime( 'YYYY', CdsDadosBeneficio.FieldByName('DATAFINAL').AsDateTime ) );
            iAnoDataFinal := ( iAnoDataFinal + 3 );

            sDataFinal    := Copy ( CdsDadosBeneficio.FieldByName('DATAFINAL').AsString, 1, 6) + IntToStr( iAnoDataFinal );

          End;


        End;


        If ( CdsDadosBeneficio.FieldByName('FLGREFERENCIA').AsInteger = 1 ) Then Begin

          dValorAtual     := CdsDadosBeneficio.FieldByName('VALORATUAL').AsFloat;
          dValorTotal     := CdsDadosBeneficio.FieldByName('VALORTOTAL').AsFloat;
          sDataInicio     := CdsDadosBeneficio.FieldByName('DATAINICIO').AsString;
          iIdSitBeneficio := CdsDadosBeneficio.FieldByName('IDSITBENEFICIO').AsInteger;
          sUltMesPreparo  := CdsDadosBeneficio.FieldByName('ULTMESPREPARO').AsString;

        End;

      End; { If ( pbEhDiferencaRA = True ) Then Begin }

      sSQL := ' INSERT INTO BENEFBFCIARIO ('+
              '   NUMEROPROCESSO,        IDPLANOPREV,          IDPLANOORIGEM,       IDTITULAR,           '+
              '   IDPESSJUR,             IDBENEFICIO,          IDPESSOA,            PLANO,               '+
              '   SEQPROPOSTA,           IDDEPENDENCIA,        IDSITBENEFICIO,      IDTPPAGTOBENEFIC,    '+
              '   DATAFINAL,             VALORATUAL,           CODPORTFORMA,        DATAREQUERIMENTO,    '+
              '   DATAINICIO,            TMPPAGTOBENEFICIO,    FLGFORMAPAGTO,       VALORCALCULADO,      '+
              '   DATAULTREAJUSTE,       ULTMESPREPARO,        VLRCALCINSS,         VLRINFINSS,          '+
              '   DATAINICIOINSS,        NUMPROCINSS,          DATAINICIOFUND,      FLGBENEFMIN,         '+
              '   VALORCOTAS,            VALORTOTAL,           DATACONCESSAO,       DATAENCERRAMENTO,    '+
              '   FLGPROVISORIO,         PERCPROVISORIO,       PRAZOPROVISORIO,     NUMCARTARECAD,       '+
              '   DATAEMISSAORECAD,      DATALIMITERECAD,      DATARECEBRECAD,      FLGSTATUS,           '+
              '   BANCOINSS,             MESRECIBOINSS,        ANORECIBOINSS,       FONTEPAGADORA,       '+
              '   IDAGENCIARESGATE,      ULTMESREAJUSTE,       ULTVALORATUALREAJ,   ULTVALORBRUTO,       '+
              '   VALORABONO13,          FLGDATAPREVISTA,      DATAFINALPREVISTA,   DIBBENEFANT,         '+
              '   VALORBENEFANT,         DFLOATPAGTO,          FLGTIPOINSS,         FLGENCERRAPORFALE,   '+
              '   DATAULTREVISAO,        FLGDESCIRMES,         PERCENTUAL,          VALORNADIB,          '+
              '   FLGPOSSUIACOMPINSS,    VALORSRB,             IDBENEFREFEREN,      DATALIBERACAO,       '+
              '   MESPAGLIBERACAO,       IDTITBENEF,           FLGACERTOCBP,        VALORBASE1,          '+
              '   VALORBASE2,            VALORBASE3,           IDPLANPREVCONTAB,    PLACONTAD,           '+
              '   PLACONTAC   )  '+

              ' SELECT                                                                                   '+
              IntToStr( piNumeroProcesso ) +', '+ IntToStr( iIdNovoPlano )+', '+
              IntToStr( iIdNovoPlano )+', '+
              ' B.IDTITULAR,           B.IDPESSJUR,         '+ IntToStr( piIdBeneficioDestino )+', '+
              ' B.IDPESSOA,            B.PLANO,             '+
              ' B.SEQPROPOSTA,         B.IDDEPENDENCIA,  '+IntToStr( iIdSitBeneficio ) + ', '+
              ' B.IDTPPAGTOBENEFIC,  '+
              ' TO_DATE('''+ sDataFinal +''',''DD/MM/YYYY''),                                           '+

              //BRUNO AZEVEDO SOL 140527 KINTANA 880285
              OraNumero( FormatFloat('#0.00', dValorAtual )  ) +  ', '+                                             { VALORATUAL         }

              ' B.CODPORTFORMA,        B.DATAREQUERIMENTO,                       '+

              ' TO_DATE('+ QuotedStr( sDataInicio ) +',''DD/MM/YYYY'') ,                                '+ { DATAINICIO         }

              ' B.TMPPAGTOBENEFICIO,   B.FLGFORMAPAGTO,                                                 '+

              //BRUNO AZEVEDO SOL 140527 KINTANA 880285
              OraNumero( FormatFloat('#0.00', dValorTotal )  ) +  ', '+                                             { VALORCALCULADO     }

              ' B.DATAULTREAJUSTE,     '+

              QuotedStr( sUltMesPreparo ) +', '+                                                           { ULTMESPREPARO      }

              ' B.VLRCALCINSS,       B.VLRINFINSS,        '+
              ' B.DATAINICIOINSS,      B.NUMPROCINSS,         '+
              ' NVL( B.DATAINICIOFUND, NVL( B.DATAINICIO, DATAREQUERIMENTO ) ) AS DATAINICIOFUND,       '+
              ' B.FLGBENEFMIN,         B.VALORCOTAS, '+

              //BRUNO AZEVEDO SOL 140527 KINTANA 880285
              OraNumero( FormatFloat('#0.00', dValorTotal )  ) +  ', '+                                             { VALORTOTAL         }

              ' SYSDATE,                                  '+
              ' B.DATAENCERRAMENTO,                                                                     '+
              ' B.FLGPROVISORIO,       B.PERCPROVISORIO,      B.PRAZOPROVISORIO,   B.NUMCARTARECAD,     '+
              ' B.DATAEMISSAORECAD,    B.DATALIMITERECAD,     B.DATARECEBRECAD,    B.FLGSTATUS,         '+
              ' B.BANCOINSS,           B.MESRECIBOINSS,       B.ANORECIBOINSS,     B.FONTEPAGADORA,     '+
              ' B.IDAGENCIARESGATE,    B.ULTMESREAJUSTE,      B.ULTVALORATUALREAJ, B.ULTVALORBRUTO,     '+
              ' B.VALORABONO13,        B.FLGDATAPREVISTA,     B.DATAFINALPREVISTA,                      '+
              ' B.DIBBENEFANT,         B.VALORBENEFANT,       B.DFLOATPAGTO,       B.FLGTIPOINSS,       '+
              ' B.FLGENCERRAPORFALE,   B.DATAULTREVISAO,      B.FLGDESCIRMES,      B.PERCENTUAL,        '+
              ' B.VALORNADIB,          B.FLGPOSSUIACOMPINSS,  B.VALORSRB,          B.IDBENEFREFEREN,    '+
              ' B.DATALIBERACAO,       B.MESPAGLIBERACAO,     B.IDTITBENEF,        B.FLGACERTOCBP,      '+
              ' B.VALORBASE1,          B.VALORBASE2,          B.VALORBASE3, '+

              IntToStr( iIdPlanoContabil )+', '+ QuotedStr( sPlaContaD ) +', '+ QuotedStr( sPlaContaC ) +'  '+

              'FROM BENEFBFCIARIO B                   '+

              'WHERE B.IDPESSJUR     = '+ CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString      +

              '  AND B.IDPLANOPREV   = '+ CdsDadosBeneficio.FieldByName('IDPLANOPREV').AsString    +
              '  AND B.IDPLANOORIGEM = '+ CdsDadosBeneficio.FieldByName('IDPLANOORIGEM').AsString  +

              '  AND B.IDTITULAR     = '+ CdsDadosIndividuo.FieldByName('IDTITULAR').AsString      +
              '  AND B.IDPESSOA      = '+ IntToStr( piIdBeneficiario )                             +
              '  AND B.SEQPROPOSTA   = '+ CdsDadosIndividuo.FieldByName('SEQPROPOSTA').AsString    +
              //BRUNO AZEVEDO SOL 139436 KINTANA 856363
              //'  AND B.IDSITBENEFICIO = 1 ' +
              //BRUNO AZEVEDO SOL 139436 KINTANA 856363
              '  AND B.IDBENEFICIO   = '+ IntToStr( piIdBeneficioOrigem ) +
              //BRUNO AZEVEDO SOL 140390 KINTANA 878061
              '  AND ROWNUM = 1        ' +
              'ORDER BY B.IDSITBENEFICIO ';
              //BRUNO AZEVEDO SOL 140390 KINTANA 878061

      If Not ExecSQL( sSQL ) Then Abort;

      { Somente para aposentados migrar a BENEFPLANOPART }
      If ( FTipoArquivo = taAposentado ) Then Begin

        sSQL := ' INSERT INTO BENEFPLANOPART BEN'+
                '  ( BEN.IDPESSJUR,         BEN.SEQPROPOSTA,      BEN.IDPLANOPREV,      BEN.IDPESSOA,             '+
                '    BEN.IDBENEFICIO,       BEN.IDEMPRESAPROPABN, BEN.IDEMPRESAPROP,    BEN.RECPAGDEVOL,          '+
                '    BEN.VLBENEFDIGITADO,   BEN.CODTIPRECEBCAP,   BEN.CODCENTRORESPON,  BEN.CODCENTROCUSTODA,     '+
                '    BEN.CODRECEBCAPABN,    BEN.CODTIPRECDES,     BEN.CODCENTROCUSTOCA, BEN.RECPAG,               '+
                '    BEN.PLACONTADABN,      BEN.PLACONTACABN,     BEN.VLBENEFCALCULADO, BEN.RECPAGABN,            '+
                '    BEN.CODPORTFORMA,      BEN.VALORBASE1,       BEN.CODTIPDOC,        BEN.CODSUBCONTA,          '+
                '    BEN.CODALTERADORCORR,  BEN.VALORBASE2,       BEN.TIPCODIGO,        BEN.UNIDNEGOC,            '+
                '    BEN.VALORBASE3,        BEN.CODCENTROCUSTOD,  BEN.IDEMPRESA,        BEN.CODCENTROCUSTOC,      '+
                '    BEN.PLACONTAD,         BEN.IDEMPRESAABN,     BEN.PLANO,            BEN.PLACONTAC,            '+
                '    BEN.CODPORTFORMAABN,   BEN.CODTIPDOCABN,     BEN.TIPCODIGOABN,     BEN.CODTIPRECDESABN,      '+
                '    BEN.CODALTERAJUROSABN, BEN.CODALTERACORRABN, BEN.PLANOABN,         BEN.UNIDNEGOCABN,        '+
                '    BEN.CODCENTRORESPONA,  BEN.CODSUBCONTAABN,   BEN.CODTIPRECEBDEVOL, BEN.FLGBENEFMIN,          '+
                '    BEN.TRGDTINCLUSAO,     BEN.TRGUSERINCLUSAO,  BEN.CODCCUSTODEVOL,   BEN.PLACONTADEVOL,        '+
                '    BEN.CODCCUSTODEVPATA,  BEN.PLACONTADEVPATA,  BEN.CODCCUSTODEVOLA,  BEN.PLACONTADEVOLA,       '+
                '    BEN.CODCCUSTODEVOLPAT, BEN.PLACONTADEVOLPAT, BEN.CODCCUSTOCPROVIS, BEN.CODCCUSTODPROVIS,    '+
                '    BEN.PLACONTACPROVIS,   BEN.PLACONTADPROVIS,  BEN.IDPLANPREVCONTAB )                           '+
                ' SELECT '+
                '    BEN.IDPESSJUR,         BEN.SEQPROPOSTA, '+ IntToStr( iIdNovoPlano )+', '+
                '    BEN.IDPESSOA,  '+
                IntToStr( piIdBeneficioDestino )+', '+
                '    BEN.IDEMPRESAPROPABN,  BEN.IDEMPRESAPROP,    BEN.RECPAGDEVOL,          '+
                '    BEN.VLBENEFDIGITADO,   BEN.CODTIPRECEBCAP,   BEN.CODCENTRORESPON,  BEN.CODCENTROCUSTODA,     '+
                '    BEN.CODRECEBCAPABN,    BEN.CODTIPRECDES,     BEN.CODCENTROCUSTOCA, BEN.RECPAG,               '+
                '    BEN.PLACONTADABN,      BEN.PLACONTACABN,     BEN.VLBENEFCALCULADO, BEN.RECPAGABN,            '+
                '    BEN.CODPORTFORMA,      BEN.VALORBASE1,       BEN.CODTIPDOC,        BEN.CODSUBCONTA,          '+
                '    BEN.CODALTERADORCORR,  BEN.VALORBASE2,       BEN.TIPCODIGO,        BEN.UNIDNEGOC,            '+
                '    BEN.VALORBASE3,        BEN.CODCENTROCUSTOD,  BEN.IDEMPRESA,        BEN.CODCENTROCUSTOC,      '+
                '    BEN.PLACONTAD,         BEN.IDEMPRESAABN,     BEN.PLANO,            BEN.PLACONTAC,            '+
                '    BEN.CODPORTFORMAABN,   BEN.CODTIPDOCABN,     BEN.TIPCODIGOABN,     BEN.CODTIPRECDESABN,      '+
                '    BEN.CODALTERAJUROSABN, BEN.CODALTERACORRABN, BEN.PLANOABN,         BEN.UNIDNEGOCABN,         '+
                '    BEN.CODCENTRORESPONA,  BEN.CODSUBCONTAABN,   BEN.CODTIPRECEBDEVOL, BEN.FLGBENEFMIN,          '+
                '    BEN.TRGDTINCLUSAO,     BEN.TRGUSERINCLUSAO,  BEN.CODCCUSTODEVOL,   BEN.PLACONTADEVOL,        '+
                '    BEN.CODCCUSTODEVPATA,  BEN.PLACONTADEVPATA,  BEN.CODCCUSTODEVOLA,  BEN.PLACONTADEVOLA,       '+
                '    BEN.CODCCUSTODEVOLPAT, BEN.PLACONTADEVOLPAT, BEN.CODCCUSTOCPROVIS, BEN.CODCCUSTODPROVIS,     '+
                '    BEN.PLACONTACPROVIS,   BEN.PLACONTADPROVIS,  '+ IntToStr( iIdPlanoContabil )+' '+
                'FROM '+
                '  BENEFPLANOPART BEN '+

                'WHERE BEN.IDPESSJUR    = '+ CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString      +

                '  AND BEN.IDPLANOPREV  = '+ CdsDadosBeneficio.FieldByName('IDPLANOPREV').AsString    +
                '  AND BEN.IDPESSOA     = '+ CdsDadosIndividuo.FieldByName('IDTITULAR').AsString      +

                '  AND BEN.SEQPROPOSTA  = '+ CdsDadosIndividuo.FieldByName('SEQPROPOSTA').AsString    +
                '  AND BEN.IDBENEFICIO  = '+ IntToStr( piIdBeneficioOrigem );

        If Not ExecSQL( sSQL ) Then Abort;

      End; { If ( FTipoArquivo = taAposentado ) Then Begin }

    End; { If ( pbEhRA = True ) Then Begin }


    iIdUltMovBenef := IncluiMovBenef( piNumeroProcesso, piIdBeneficioDestino, piIdBeneficiario,
                                      iIdNovoPlano, 7, 7, sDataInicio, sDataFinal, dValorAtual, dValorTotal );

    Result := True;

  Except

    sMensagemDeErro := MessageInfo;
    Result := False;

  End;

End;


{----------------------------------------------------------------------------}
{ Incluir registro na MOVBENEF                                               }
Function TSaldamentoAssistido.IncluiMovBenef( piNumeroProcesso, piIdBeneficio,
                                              piIdBeneficiario, piIdPlanoPrev,
                                              piTipoMov,        piIdMotivo : Integer;
                                              sDataInicio, sDataFinal  : String;
                                              dValorAtual, dValorTotal : Double ): Integer;
Var
  sSQL : String;
  iIdMovBenef : Integer;
Begin

  Result := -5005;

  {--------------------------------------------------------------------------}
  { MOVBENEF                                                                 }
  iIdMovBenef := GetSequenceLocal( 'MOVBENEF' );

  sSQL := 'INSERT INTO MOVBENEF ( '+
          '  IDMOVBENEF,   IDPLANOPREV,    IDPLANOORIGEM,    IDPESSJUR,  IDTITULAR,     '+
          '  IDBENEFICIO,  NUMEROPROCESSO, IDPESSOA,         SEQPROPOSTA,               '+
          '  TIPOMOV,      DATAMOV,        VALORATUAL,       VALORTOTAL,                '+
          '  VALORCOTAS,   DATAINICIO,     DATAFINAL,        DATAINICIOANT,             '+
          '  DATAFINALANT, VALORATUALANT,  IDSITANTERIOR,    FLGDATAPREVANT, MOTRETENC, '+
          '  IDLOTEMOV,    FLGVOLTAPATRO,  USUARIOALT)                                  '+
          'VALUES ('+
            IntToStr( iIdMovBenef )+', '+                                     { IDMOVBENEF         }
            IntToStr( piIdPlanoPrev )                               + ', ' +  { IDPLANOPREV        }
            IntToStr( piIdPlanoPrev  )                              + ', ' +  { IDPLANOORIGEM      }
            CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString     + ', ' +
            CdsDadosIndividuo.FieldByName('IDTITULAR').AsString     + ', ' +
            IntToStr( piIdBeneficio )                               + ', ' +  { IDBENEFICIO        }
            IntToStr( piNumeroProcesso )                            + ', ' +
            IntToStr( piIdBeneficiario )                            + ', ' +
            CdsDadosIndividuo.FieldByName('SEQPROPOSTA').AsString   + ', ' +
            IntToStr( piTipoMov )                                   + ', ' +  { TIPOMOV            }
            ' TO_DATE('''+ DateToStr( Date ) +''',''DD/MM/YYYY'') ,        '+ { DATAMOV            }
            OraNumero( FloatToStr( dValorAtual )  ) +  ', '+                  { VALORATUAL         }
            OraNumero( FloatToStr( dValorTotal )  ) +  ', '+                  { VALORTOTAL         }
            OraNumero( FloatToStr( dValorAtual )  ) +  ', '+                  { VALORCOTAS         }
            ' TO_DATE('''+ sDataInicio +''',''DD/MM/YYYY'') ,              '+ { DATAINICIO         }
            ' TO_DATE('''+ sDataFinal +''',''DD/MM/YYYY'') ,               '+ { DATAFINAL          }
            ' TO_DATE('''+ sDataInicio +''',''DD/MM/YYYY'') ,              '+ { DATAINICIOANT      }
            ' TO_DATE('''+ sDataFinal +''',''DD/MM/YYYY'') ,               '+ { DATAFINALANT       }
            OraNumero( FloatToStr( dValorAtual )  )                 + ', ' +  { VALORATUALANT      }
            'NULL, '+                                                         { IDSITANTERIOR      }
            'NULL, '+                                                         { FLGDATAPREVANT     }
            'NULL, '+                                                         { MOTRETENC          }
            IntToStr( iIdLoteProcesso )                             + ', ' +  { IDLOTEMOV          }
            'NULL, '+                                                         { FLGVOLTAPATRO      }
            'NULL ) ';                                                        { USUARIOALT         }

  If Not ExecSQL( sSQL ) Then Abort;

  Result := iIdMovBenef;


End;

{------------------------------------------------------------------------------}
{ Retorna o valor da contribuição                                              }
Function  TSaldamentoAssistido.RetornaValorContribuicao( piNumeroProcesso, piIdBeneficio, piIdPessoa : Integer;
                                                         psAnoMesReferencia : String ): Double;

  Function BuscaQtdBeneficiariosAtivos( piNumeroProcesso, piIdBeneficio : Integer;
                                        psAnoMesIni,      psAnoMesFim   : String ): Integer;
  Var
    sSQL : String;
  Begin

    Result := 0;

    { Busca total de beneficiários ativos no processo no mes de referencia }
    sSQL := 'SELECT '+
            ' COUNT(DISTINCT BB.IDPESSOA) AS TOTBENEFICIARIOS '+
            'FROM   '+
            '  BENEFBFCIARIO BB '+
            'WHERE  '+
            '  BB.NUMEROPROCESSO = '+ IntToStr( piNumeroProcesso ) +' AND '+
            '  BB.IDBENEFICIO    = '+ IntToStr( piIdBeneficio )    +' AND '+
            '  TO_CHAR(BB.DATAINICIO,''YYYY/MM'') <= ' + QuotedStr( psAnoMesIni );

    If Trim( psAnoMesFim ) <> '' Then begin

      sSQL := sSQL + ' AND ( (TO_CHAR(BB.DATAFINAL,''YYYY/MM'') >= '+ QuotedStr( psAnoMesIni ) +') OR '+
                             '(BB.DATAFINAL IS NULL) ) ';

    End;

    CdsSaldamentoAux.Data := GetDataPacket( sSQL );

    Result := CdsSaldamentoAux.FieldByName('TOTBENEFICIARIOS').AsInteger;

  End; { BuscaNumeroBeneficiariosAtivos }

Var
  sSQL : String;
  iNumBeneficiarios : Integer;
  dValorRecebido : Double;
Begin

  Result := 0;

  Try

    { Pesquisa no histórico }

    sSQL := 'SELECT '+
            '  SUM( DECODE( HCT.FLGDEVOLUCAO, 1, ( HCT.VALORRECEBIDO * -1 ), HCT.VALORRECEBIDO ) ) AS VALORRECEBIDO '+

            'FROM   '+
            '  HSTCONTRIBPREV HCT '+

            'WHERE  '+
            '  ( HCT.IDPESSJUR      = '+ CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString      + ' ) AND '+
            '  ( HCT.IDPLANOPREV    = '+ CdsDadosIndividuo.FieldByName('IDPLANOPREV').AsString    + ' ) AND '+
            '  ( HCT.IDPESSOA       = '+ IntToStr( piIdPessoa )                                   + ' ) AND '+
            '  ( NVL( HCT.IDLOTE, 0 ) <> '+ IntToStr( iIdLoteProcesso )                           + ' ) AND ';

                         
    // Renato Visoni SOL 95118 / KINTANA 419379
    If ( CdsDadosIndividuo.FieldByName('IDPLANOPREV').AsInteger = 66 ) Then Begin
      sSQL := sSQL + '  ( HCT.IDCONTRIBUICAO IN (500)) AND ';
    // Fim Renato Visoni SOL 95118 / KINTANA 419379
    end else begin
      { Caso somente financeiro acertar somente com a cotribuição 633 }
      If ( FSomenteFinanceiro = True ) And ( CdsDadosIndividuo.FieldByName('IDPLANOPREV').AsInteger = 2 ) Then Begin
        sSQL := sSQL +'  ( HCT.IDCONTRIBUICAO IN ( 633 ) ) AND ';
      end else Begin
            sSQL := sSQL + '  ( HCT.IDCONTRIBUICAO IN (633,259)) AND ';
      end;
    end;


    sSQL := sSQL +
            '  ( HCT.MESREFERENCIA  = '+ QuotedStr( psAnoMesReferencia ) +' )     ';

    CdsSaldamentoAux.Data := GetDataPacket( sSQL );

    If ( Not CdsSaldamentoAux.IsEmpty ) Then Begin

      dValorRecebido := CdsSaldamentoAux.FieldByName('VALORRECEBIDO').AsFloat;

      iNumBeneficiarios := BuscaQtdBeneficiariosAtivos( piNumeroProcesso, piIdBeneficio,
                                                        psAnoMesReferencia, sAnoMesLoteProcesso );

      If ( iNumBeneficiarios = 0 ) Then iNumBeneficiarios := 1;

      Result := ( dValorRecebido / iNumBeneficiarios );

      Exit;

    End;

  Except

    Result := -5005; { Erro }

  End;

End;

{------------------------------------------------------------------------------}
{ Retorna o valor da suplementação na referencia                               }
Function TSaldamentoAssistido.RetornaValorSUPL( CdsDadosBeneficio : TCMClientDataSet;
                                                dDataRef: TDateTime;
                                                piIdPlanoPrev : Integer;
                                                Var piNumeroProcesso, piIdBeneficio, piPercentual : Integer ): Double;
Var
  sSQL : String;
Begin

  Result := 0;

  Try

    { Pesquisa no histórico }

    sSQL := 'SELECT '+
            '  HFB.MESREFERENCIA, HFB.VALORINTEGRAL, HFB.VALORTOTAL, HFB.NUMEROPROCESSO, HFB.SEQBENEFICIO '+

            'FROM   '+
            '  HSTBENEFBFCIARIO HFB '+

            'WHERE  '+
            '  ( HFB.IDPESSJUR   = '+ CdsDadosBeneficio.FieldByName('IDPESSJUR').AsString    + ' ) AND '+
            '  ( HFB.IDTITULAR   = '+ CdsDadosBeneficio.FieldByName('IDTITULAR').AsString    + ' ) AND '+
            '  ( HFB.IDPESSOA    = '+ CdsDadosBeneficio.FieldByName('IDPESSOA').AsString     + ' ) AND '+
            '  ( HFB.SEQPROPOSTA = '+ CdsDadosBeneficio.FieldByName('SEQPROPOSTA').AsString  + ' ) AND '+
            '  ( HFB.IDBENEFICIO = '+ IntToStr( piIdBeneficio )                              + ' ) AND '+
            '  ( HFB.MESREFERENCIA = TO_CHAR( TO_DATE( '+ QuotedStr( DateToStr( dDataRef ) ) +', ''DD/MM/YYYY''), ''YYYY/MM'')' +' )  ';

    If ( piIdPlanoPrev = -1 )
    Then sSQL := sSQL + ' AND ( HFB.IDPLANOPREV = '+ CdsDadosBeneficio.FieldByName('IDPLANOPREV').AsString  + ' )  '
    Else sSQL := sSQL + ' AND ( HFB.IDPLANOPREV = '+ IntToStr( piIdPlanoPrev ) + ' ) ';

    sSQL := sSQL +
            'ORDER BY '+
            '  HFB.MESREFERENCIA, HFB.SEQBENEFICIO DESC  ';

    CdsSaldamentoAux.Data := GetDataPacket( sSQL );

    If ( Not CdsSaldamentoAux.IsEmpty ) Then Begin

      Result           := CdsSaldamentoAux.FieldByName('VALORINTEGRAL').AsFloat;
      piNumeroProcesso := CdsSaldamentoAux.FieldByName('NUMEROPROCESSO').AsInteger;

    End Else Begin

      sSQL := 'SELECT '+
              '  BFB.NUMEROPROCESSO, BFB.VALORATUAL, '+
              '  NVL( BFP.VALORBASE1,  BFB.VALORBASE1 ) AS VALORBASE1, '+
              '  NVL( BFP.VALORBASE2,  BFB.VALORBASE2 ) AS VALORBASE2, '+
              '  NVL( BFP.VALORBASE3,  BFB.VALORBASE3 ) AS VALORBASE3  '+

              'FROM   '+
              '  BENEFBFCIARIO BFB, BENEFPLANOPART BFP '+

              'WHERE  '+
              '  ( BFB.IDPESSJUR   = '+ CdsDadosBeneficio.FieldByName('IDPESSJUR').AsString    + ' ) AND '+
              '  ( BFB.IDPLANOPREV = '+ CdsDadosBeneficio.FieldByName('IDPLANOPREV').AsString  + ' ) AND '+
              '  ( BFB.IDTITULAR   = '+ CdsDadosBeneficio.FieldByName('IDTITULAR').AsString    + ' ) AND '+
              '  ( BFB.IDPESSOA    = '+ CdsDadosBeneficio.FieldByName('IDPESSOA').AsString     + ' ) AND '+
              '  ( BFB.SEQPROPOSTA = '+ CdsDadosBeneficio.FieldByName('SEQPROPOSTA').AsString  + ' ) AND '+
              '  ( BFB.IDBENEFICIO = '+ IntToStr( piIdBeneficio )                              + ' ) AND '+
              '  ( BFB.IDPESSJUR      = BFP.IDPESSJUR(+)    '                                  + ' ) AND '+
              '  ( BFB.IDPLANOPREV    = BFP.IDPLANOPREV(+)  '                                  + ' ) AND '+
              '  ( BFB.IDPESSOA       = BFP.IDPESSOA(+)     '                                  + ' ) AND '+
              '  ( BFB.SEQPROPOSTA    = BFP.SEQPROPOSTA(+)  '                                  + ' ) AND '+
              '  ( BFB.IDBENEFICIO    = BFP.IDBENEFICIO(+)  '                                  + ' )     ';

      CdsSaldamentoAux.Data := GetDataPacket( sSQL );

      If ( Not CdsSaldamentoAux.IsEmpty ) Then Begin

        Result           := CdsSaldamentoAux.FieldByName('VALORATUAL').AsFloat;
        piNumeroProcesso := CdsSaldamentoAux.FieldByName('NUMEROPROCESSO').AsInteger;
        piPercentual     := CdsSaldamentoAux.FieldByName('VALORBASE1').AsInteger;

      End;

    End;

    Exit;

  Except

    Result := -5005; { Erro }

  End;

End;

{----------------------------------------------------------------------------}
{ Retorna os dados da suplementação REPLAN                                   }
Function TSaldamentoAssistido.RetornaDadosReplan( piIdPessoa : Integer;
                                                  Var psDataInicio       : String;
                                                  Var psDataInicioRef    : String;
                                                  Var psDataCancelamento : String;
                                                  Var piIdBeneficio      : Integer;
                                                  Var piIdSitBeneficio   : Integer;
                                                  Var piIdSitPart        : Integer;
                                                  Var dValorAtual        : Double;
                                                  pbEhRA : Boolean )     : Boolean;
Var
  sSQL : String;
Begin

  Result := False;

  sSQL := 'SELECT '+
          '  BFB.IDBENEFICIO, BFB.IDSITBENEFICIO,  '+
          '  BFB.DATAINICIO,  BFB.VALORATUAL,      '+
          '  GREATEST ( BFB.DATAINICIO, TO_DATE('+ QuotedStr('01/09/2001')+',''DD/MM/YYYY'') ) AS DATAINICIOREF, '+
          '  PPP.IDSITPART, PPP.DATACANCELAMENTO '+
          'FROM   '+
          '  BENEFBFCIARIO BFB, PARTPREVPLAN PPP, BENEFICIO BEN   '+
          'WHERE  '+
          '  BFB.IDPESSJUR     = '+ IntToStr( 91008 )        +' AND '+
          '  BFB.IDPLANOPREV   = '+ IntToStr( iIdNovoPlano ) +' AND '+
          '  BFB.IDPESSOA      = '+ IntToStr( piIdPessoa )   +' AND ';

  If ( pbEhRA = True )
  Then sSQL := sSQL + '  BEN.FLGRESGATE = 1 AND '
  Else sSQL := sSQL + '  BEN.FLGRESGATE = 0 AND ';

  If ( piIdBeneficio <= 0 ) Then Begin
    sSQL := sSQL + '  BFB.FONTEPAGADORA = 1 AND '
  End Else Begin
    sSQL := sSQL + '  BFB.IDBENEFICIO = '+ IntToStr( piIdBeneficio ) + ' AND ';
  End;

  sSQL := sSQL +
          '  BFB.IDBENEFICIO   = BEN.IDBENEFICIO AND '+

          '  BFB.IDPESSJUR     = PPP.IDPESSJUR   AND '+
          '  BFB.IDTITULAR     = PPP.IDPESSOA    AND '+
          '  BFB.IDPLANOPREV   = PPP.IDPLANOPREV AND '+
          '  BFB.SEQPROPOSTA   = PPP.SEQPROPOSTA ';

  CdsSaldamentoAux.Data := GetDataPacket( sSQL );

  dValorAtual := 0;

  If ( Not CdsSaldamentoAux.IsEmpty ) Then Begin

    psDataInicio       := CdsSaldamentoAux.FieldByName('DATAINICIO').AsString;
    psDataInicioRef    := CdsSaldamentoAux.FieldByName('DATAINICIOREF').AsString;
    psDataCancelamento := CdsSaldamentoAux.FieldByName('DATACANCELAMENTO').AsString;
    piIdBeneficio      := CdsSaldamentoAux.FieldByName('IDBENEFICIO').AsInteger;
    piIdSitPart        := CdsSaldamentoAux.FieldByName('IDSITPART').AsInteger;
    dValorAtual        := CdsSaldamentoAux.FieldByName('VALORATUAL').AsFloat;

    Result := True;

  End;

End; { Function RetornaDadosReplan  }
{----------------------------------------------------------------------------}

{------------------------------------------------------------------------------}
{ Retorna o valor do beneficio minimo                                          }
Function TSaldamentoAssistido.RetornaBeneficioMinimo( pdDataRef: TDateTime ): Double;
Var
  I : Integer;
Begin

  Result := 0;

  For I := 0 To 5 Do Begin

    If pdDataRef < VetBeneficioMinimo[I].DataReferencia Then Result := VetBeneficioMinimo[I].Valor;

  End;

End;


{------------------------------------------------------------------------------}
{ Corrige o valor do beneficio saldado                                         }
Function TSaldamentoAssistido.CorrigeValorBS( dDataRef: TDateTime; dValorBS: Double ): Double;
Var
  sSQL, sMoedaIndice, sAnoMesRef : String;
  dValorBSCorrigidoAntes, dValorBSCorrigido : Double;

Begin

  Result := dValorBS;

  sMoedaIndice := '7';

  Try

    sAnoMesRef := FormatDateTime( 'YYYY/MM', dDataRef );
    sSQL := 'SELECT   '+
            '  COT.COTDATA, SUBSTR( COT.COTMESREF, 3,4 ) ||''/''||SUBSTR( COT.COTMESREF, 1,2 ) AS COTMESREF, '+
            '  COT.COTVALOR    '+

            'FROM     '+
            '  COTACAOMOEDA COT '+

            'WHERE    '+
            '  ( COT.MOECODIGO = '+ sMoedaIndice +' ) AND '+
            '  ( TO_CHAR(COT.COTDATA, ''YYYY/MM'') >= '+ QuotedStr( sAnoMesRef ) +' ) '+
            'ORDER BY '+
            '  COT.COTDATA   ';

    CdsSaldamentoAux .Data := GetDataPacket( sSQL );

    If ( Not CdsSaldamentoAux.IsEmpty ) Then Begin

      { Aplicar correção no BS }
      dValorBSCorrigido := dValorBS;
      sAnoMesRef        := FormatDateTime( 'YYYY/MM', dDataRef );

      While ( Not CdsSaldamentoAux.Eof ) And ( sAnoMesRef <= FAnoMesRefProcesso ) Do Begin

        If ( sAnoMesRef <= CdsSaldamentoAux.FieldByName('COTMESREF').AsString ) Then Begin

          dValorBSCorrigidoAntes := dValorBSCorrigido;

          dValorBSCorrigido := ( dValorBSCorrigido + ( ( dValorBSCorrigido * CdsSaldamentoAux.FieldByName('COTVALOR').AsFloat ) / 100 ) );

          sAnoMesRef := CdsSaldamentoAux.FieldByName('COTMESREF').AsString;

        End;

        CdsSaldamentoAux.Next;

      End;

      Result := dValorBSCorrigido;

    End;

  Except

    Result := -5005; { Erro }

  End;

End;


{----------------------------------------------------------------------------}
{ Corrige o valor da diferenca                                               }
Function TSaldamentoAssistido.CorrigeValor( dValorReferencia : Double; sAnoMesRef : String ): Double;
Var
  sSQL, sMoedaIndice : String;
  dValorIndice : Double;

Begin

  Result := dValorReferencia;

  sMoedaIndice := '7';

  Try

    sSQL := 'SELECT   '+
            '  COT.COTDATA, SUBSTR( COT.COTMESREF, 3,4 ) ||''/''||SUBSTR( COT.COTMESREF, 1,2 ) AS COTMESREF, '+
            '  COT.COTVALOR    '+
            'FROM     '+
            '  COTACAOMOEDA COT '+
            'WHERE    '+
            '  ( COT.MOECODIGO = '+ sMoedaIndice +' ) AND '+
            '  ( TO_CHAR(COT.COTDATA, ''YYYY/MM'') >= '+ QuotedStr( sAnoMesRef ) +' ) '+
            'ORDER BY '+
            '  COT.COTDATA DESC ';

    CdsSaldamentoAux.Data := GetDataPacket( sSQL );

    dValorIndice := 1;;
    While ( Not CdsSaldamentoAux.Eof ) Do Begin

      dValorIndice := dValorIndice * ( 1 + (CdsSaldamentoAux.FieldByName('COTVALOR').AsFloat / 100 ) );
      CdsSaldamentoAux.Next;

    End;

    If ( dValorIndice = 0 ) Then dValorIndice := 1;

    dValorIndice := Trunca( dValorIndice, 6 ) ;

    If ( Not CdsSaldamentoAux.IsEmpty ) Then Begin

      dValorReferencia := ( dValorReferencia * dValorIndice );

      Result := dValorReferencia;

    End;

  Except

    Result := -5005; { Erro }

  End;

End; { CorrigeValor }

{******************************************************************************}
{ Inicio da implementação da classe TSaldamentoAposentado                      }
{ TSaldamentoAposentado }

// Daniel Begnami Sol: 96526, 97976 e 93782
procedure TSaldamentoAssistido.SetaPessoaParam(pidPessoa: String);
var
  sSQL : String;
begin
  sSQL := 'select UPPER(NVL(pp.valor,''N'')) AS VALOR '+
          ' from pessoaparam pp '+
          ' where pp.idpessoa = '+CdsDadosIndividuo.FieldByName('IDPESSOA').AsString+
          '   and pp.idparam  = 9';

  CdsSaldamentoAux.Data := GetDataPacket( sSQL );

  If ( CdsSaldamentoAux.IsEmpty ) Then
    flgPessoaParam := 'N'
  else
    flgPessoaParam := CdsSaldamentoAux.FieldByName('VALOR').AsString;

  CdsSaldamentoAux.Close;
end;
// Fim

Constructor TSaldamentoAposentado.Create;
Begin

  FTipoArquivo := taAposentado;

  Inherited;

  {----------------------------------------------------------------------------}
  { Iniciar tabela de benficios minimos                                        }
  VetBeneficioMinimo[0].DataReferencia := StrToDate('31/12/2001');
  VetBeneficioMinimo[0].Valor          := 136.26;

  VetBeneficioMinimo[1].DataReferencia := StrToDate('31/12/2002');
  VetBeneficioMinimo[1].Valor          := 140.95;

  VetBeneficioMinimo[2].DataReferencia := StrToDate('31/12/2003');
  VetBeneficioMinimo[2].Valor          := 161.72;

  VetBeneficioMinimo[3].DataReferencia := StrToDate('31/12/2004');
  VetBeneficioMinimo[3].Valor          := 178.52;

  VetBeneficioMinimo[4].DataReferencia := StrToDate('31/12/2005');
  VetBeneficioMinimo[4].Valor          := 189.47;

  VetBeneficioMinimo[5].DataReferencia := StrToDate('31/12/2006');
  VetBeneficioMinimo[5].Valor          := 199.04;

End;

Destructor TSaldamentoAposentado.Destroy;
Begin
  Inherited;

End;

{------------------------------------------------------------------------------}
{ Executa processo de saldamento de assistido                                  }
Function TSaldamentoAposentado.Processar: Boolean;
Begin

  Inherited Processar;

End;

{------------------------------------------------------------------------------}
{ Verifica regras de elegiilidade para saldamento                              }
Function TSaldamentoAposentado.PassouElegibilidade: Boolean;
Var
  sSQL : String;
Begin

  Result := False;

  sSQL := 'SELECT DISTINCT '+
          '  PPP.IDSITPLANOPREV '+
          'FROM   '+
          '  BENEFBFCIARIO BFB, PARTPREVPLAN PPP  '+
          'WHERE  '+
          '      BFB.IDPESSJUR      = '+ CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString      +
          '  AND BFB.IDPLANOPREV    = '+ CdsDadosIndividuo.FieldByName('IDPLANOPREV').AsString    +
          '  AND BFB.IDPLANOORIGEM  = '+ CdsDadosIndividuo.FieldByName('IDPLANOORIGEM').AsString  +
          '  AND BFB.IDTITULAR      = '+ CdsDadosIndividuo.FieldByName('IDTITULAR').AsString      +
          '  AND BFB.IDPESSOA       = '+ CdsDadosIndividuo.FieldByName('IDTITULAR').AsString      +

          '  AND BFB.IDPESSJUR      = PPP.IDPESSJUR   '+
          '  AND BFB.IDPLANOPREV    = PPP.IDPLANOPREV '+
          '  AND BFB.IDTITULAR      = PPP.IDPESSOA   '+
          '  AND BFB.SEQPROPOSTA    = PPP.SEQPROPOSTA '+

          '  AND BFB.IDSITBENEFICIO = 1 ';

  CdsSaldamento.Data := GetDataPacket( sSQL );

  If ( CdsSaldamento.IsEmpty = True ) Then Begin
    sMensagemDeErro := 'NÃO POSSUI BENEFICIO ATIVO.';
    Exit;
  End Else Result := True;

  If ( FTipoArquivo = taAposentado ) And ( CdsSaldamento.FieldByName('IDSITPLANOPREV').AsInteger = 25 ) And
     ( FSomenteFinanceiro = False )
  Then Begin
    Result := False;;
    sMensagemDeErro := 'SALDAMENTO JÁ PROCESSADO PARA ESSA MATRICULA.';
    Exit;
  End Else Result := True;

  If ( CdsDadosIndividuo.FieldByName('IDPLANOPREV').AsInteger = 66 ) Then Begin

    sSQL := 'SELECT '+
            '  IDTMPDESC                                       '+
            'FROM   '+
            '  TMPDESC '+
            'WHERE  '+
            '      IDPESSJUR    = '+ CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString      +
            '  AND IDPLANOPREV  = '+ CdsDadosIndividuo.FieldByName('IDPLANOPREV').AsString    +
            '  AND IDTITULAR    = '+ CdsDadosIndividuo.FieldByName('IDTITULAR').AsString      +
            '  AND IDPESSOA     = '+ CdsDadosIndividuo.FieldByName('IDTITULAR').AsString      +
            '  AND SITENVIO     = ''0'' '+
            '  AND FLGDESCFOLHA = ''B''';

    CdsSaldamento.Data := GetDataPacket( sSQL );

    If ( CdsSaldamento.IsEmpty = False ) Then Begin
      Result := False;
      sMensagemDeErro := 'POSSUI ENVIO NA TMPDESC .';
      Exit;
    End Else Result := True;

  End;

End; { TSaldamentoAposentado.PassouElegibilidade: Boolean; }

{------------------------------------------------------------------------------}
{ Executa processo de saldamento de assistido para um individuo                }
Function TSaldamentoAposentado.ProcessarIndividuo: Boolean;
Begin

  Try

    Result := False;

    If ( Not Inherited ProcessarIndividuo ) Then Begin

      Exit;

    End;

    iIdResponsavelProcessando := CdsDadosIndividuo.FieldByName('IDPESSOA').AsInteger;

    { Processar emprestimos }
    If ( FSomenteFinanceiro = False ) And ( Not ProcessarEmprestimos( CdsDadosIndividuo.FieldByName('IDPESSOA').AsInteger ) ) Then Begin

      GravaNoDemonstrativo( 'ERRO AO GRAVAR DADOS DOS EMPRÉSTIMOS DA MATRICULA -> '+ FMatriculaIndividuo +' COM A MENSAGEM: '+ sMensagemDeErro );
      GravaNoDemonstrativo( ' ' );
      Exit;

    End;

    { Processar contribuições }
    If ( FSomenteFinanceiro = False ) And ( Not ProcessarContribuicoes ) Then Begin

      GravaNoDemonstrativo( 'ERRO AO GRAVAR DADOS DOS CONTRIBUIÇÕES DA MATRICULA -> '+ FMatriculaIndividuo +' COM A MENSAGEM: '+ sMensagemDeErro );
      GravaNoDemonstrativo( ' ' );
      Exit;

    End;

    { Processar Rubricas de peculio  }
    If ( FSomenteFinanceiro = False ) And ( Not ProcessarRubricaPeculio( CdsDadosIndividuo.FieldByName('IDPESSOA').AsInteger ) ) Then Begin

      GravaNoDemonstrativo( 'ERRO AO GRAVAR RUBRICAS DE PECÚLIO DA MATRICULA -> '+ FMatriculaIndividuo +' COM A MENSAGEM: '+ sMensagemDeErro );
      GravaNoDemonstrativo( ' ' );
      Exit;

    End;

    { Processar beneficios }
    If ( Not ProcessarBeneficios( CdsDadosIndividuo.FieldByName('IDPESSOA').AsInteger ) ) Then Begin

      GravaNoDemonstrativo( 'ERRO AO PROCESSAR BENEFICIOS DA MATRICULA -> '+ FMatriculaIndividuo +' COM A MENSAGEM: '+ sMensagemDeErro );
      GravaNoDemonstrativo( ' ' );
      Exit;

    End;

    Result := True;

  Except


  End;

End;

{******************************************************************************}
{ Inicio da implementação da classe TSALDAMENTOPENSIONISTA                     }

{ TSaldamentoPensionista }
Constructor TSaldamentoPensionista.Create;
Begin

  FTipoArquivo  := taPensionista;

  Inherited;

End;

Destructor TSaldamentoPensionista.Destroy;
Begin

  Inherited;

End;

{------------------------------------------------------------------------------}
{ Executa processo de saldamento de pensionista                                }
Function TSaldamentoPensionista.Processar: Boolean;
Begin

  Inherited Processar;

End;

{------------------------------------------------------------------------------}
{ Verifica regras de elegiilidade para saldamento                              }
Function TSaldamentoPensionista.PassouElegibilidade: Boolean;
Var
  sSQL : String;
Begin

  Result := False;

  If ( CdsDadosIndividuo.FieldByName('IDPLANOPREV').AsInteger = 66 ) Then Begin

    sSQL := 'SELECT DISTINCT '+
            '  1 '+
            'FROM   '+
            '  TMPDESC '+
            'WHERE  '+
            '      IDPESSJUR    = '+ CdsDadosIndividuo.FieldByName('IDPESSJUR').AsString      +
            '  AND IDPLANOPREV  = '+ CdsDadosIndividuo.FieldByName('IDPLANOPREV').AsString    +
            '  AND IDTITULAR    = '+ CdsDadosIndividuo.FieldByName('IDTITULAR').AsString      +
            '  AND IDPESSOA     = '+ CdsDadosIndividuo.FieldByName('IDPESSOA').AsString       +
            '  AND SITENVIO     = ''0'' '+
            '  AND FLGDESCFOLHA = ''B''';

    CdsSaldamento.Data := GetDataPacket( sSQL );

    If ( CdsSaldamento.IsEmpty = False ) Then Begin
      Result := False;
      sMensagemDeErro := 'POSSUI ENVIO NA TMPDESC .';
      Exit;
    End Else Result := True;

  End;

  sSQL := 'SELECT   '+
          '  1 '+
          'FROM     '+
          '  NUCLEOFAMILIAR NFL, CONTRIBPREVNUCLEO CPN '+
          'WHERE    '+
          '  ( NFL.IDTITULAR        = '+ CdsDadosIndividuo.FieldByName('IDTITULAR').AsString +' ) AND '+
          '  ( NFL.IDRESPNUCLEO     = '+ CdsDadosIndividuo.FieldByName('IDPESSOA').AsString +' ) AND '+
          '  ( NFL.IDNUCLEOFAMILIAR = CPN.IDNUCLEOFAMILIAR ) AND '+
          '  ( CPN.IDCONTRIBUICAO   = 633 ) ';

  CdsSaldamentoAux.Data := GetDataPacket( sSQL );

  If ( Not CdsSaldamentoAux.IsEmpty ) And
     ( FSomenteFinanceiro = False )
  Then Begin
    sMensagemDeErro := 'SALDAMENTO JÁ PROCESSADO PARA ESSA MATRICULA.';
    Exit;
  End Else Result := True;

End; { TSaldamentoPensionista.PassouElegibilidade: Boolean; }

{------------------------------------------------------------------------------}
{ Verifica regras de elegiilidade para saldamento                              }
Function TSaldamentoPensionista.PassouElegibilidadeBeneficiario: Boolean;
Var
  sSQL : String;
Begin

  Result := False;

  sSQL := 'SELECT DISTINCT '+
          '  BFB.IDSITBENEFICIO '+
          'FROM   '+
          '  BENEFBFCIARIO BFB '+
          'WHERE  '+
          '      BFB.IDPESSJUR      = '+ CdsDadosGrupoFamiliar.FieldByName('IDPESSJUR').AsString      +
          '  AND BFB.IDPLANOPREV    = '+ CdsDadosGrupoFamiliar.FieldByName('IDPLANOPREV').AsString    +
          '  AND BFB.IDPLANOORIGEM  = '+ CdsDadosGrupoFamiliar.FieldByName('IDPLANOORIGEM').AsString  +
          '  AND BFB.IDTITULAR      = '+ CdsDadosGrupoFamiliar.FieldByName('IDTITULAR').AsString      +
          '  AND BFB.IDPESSOA       = '+ CdsDadosGrupoFamiliar.FieldByName('IDPESSOA').AsString      +
          '  AND BFB.IDSITBENEFICIO = 1 ';

  CdsSaldamento.Data := GetDataPacket( sSQL );

  If ( CdsSaldamento.IsEmpty ) Then Begin
    sMensagemDeErro := 'NÃO POSSUI BENEFICIO ATIVO.';
    Exit;
  End Else Result := True;

End; { TSaldamentoPensionista.PassouElegibilidade: Boolean; }

{------------------------------------------------------------------------------}
{ Executa processo de saldamento de pensionista para um individuo              }
Function TSaldamentoPensionista.ProcessarIndividuo: Boolean;
Begin

  Try

    Result := False;

    { Busca e processa dados do Titular (INSCRICOES, EVENTOS ) }
    If ( Not Inherited ProcessarIndividuo ) Then Begin

      Exit;

    End;

    iIdResponsavelProcessando := CdsDadosIndividuo.FieldByName('IDPESSOA').AsInteger;

    { Processar emprestimos }
    If ( Not BuscaDadosDoGruposFamiliar ) Then Begin

      GravaNoDemonstrativo( 'ERRO AO BUSCAR DADOS DO GRUPO FAMILIAR DA MATRICULA -> '+ FMatriculaIndividuo +' COM A MENSAGEM: '+ sMensagemDeErro );
      GravaNoDemonstrativo( ' ' );
      Exit;

    End;

    { Processar contribuições }
    If Not ProcessarContribuicoes Then Begin

      GravaNoDemonstrativo( 'ERRO AO GRAVAR DADOS DOS CONTRIBUIÇÕES DA MATRICULA -> '+ FMatriculaIndividuo +' COM A MENSAGEM: '+ sMensagemDeErro );
      GravaNoDemonstrativo( ' ' );
      Exit;

    End;

    { Executar para todas as pessoas do Grupo deste Responsável }
    While ( Not  CdsDadosGrupoFamiliar.Eof ) Do Begin

      { Elegibilidade  }
      If ( Not PassouElegibilidadeBeneficiario ) Then Begin

        sMensagemDeErro := 'Matricula '+ FMatriculaIndividuo + ', beneficiário ' + CdsDadosGrupoFamiliar.FieldByName('NOMEBENEFICIARIO').AsString + '  '+
                           'não passou na elegibilidade. Mensagem: '+ sMensagemDeErro;

        GravaNoDemonstrativo( sMensagemDeErro );
        GravaNoDemonstrativo( ' ' );

        If ( FTipoProcesso = TpLote ) Then Begin
          GravaNoDemonstrativo( FMatriculaIndividuo + '   ERRO: '+ sMensagemDeErro );
        End Else Begin

          MsgDlg(sMensagemDeErro , 'Erro', mtError, [mbOk], 0);
        End;

        CdsDadosGrupoFamiliar.Next;
        Continue;

      End;

      { Processar Rubricas de peculio  }
      If ( FSomenteFinanceiro = False ) And ( FSomenteBUA = False ) Then Begin

        If Not ProcessarRubricaPeculio( CdsDadosGrupoFamiliar.FieldByName('IDPESSOA').AsInteger ) Then Begin

          GravaNoDemonstrativo( 'ERRO AO GRAVAR RUBRICAS DE PECÚLIO DA MATRICULA -> '+ FMatriculaIndividuo +' COM A MENSAGEM: '+ sMensagemDeErro );
          GravaNoDemonstrativo( ' ' );
          Exit;

        End;

      End;

      { Processar emprestimos }
      If ( Not ProcessarEmprestimos( CdsDadosGrupoFamiliar.FieldByName('IDPESSOA').AsInteger ) ) Then Begin

        GravaNoDemonstrativo( 'ERRO AO GRAVAR DADOS DOS EMPRÉSTIMOS DA MATRICULA -> '+ FMatriculaIndividuo +' COM A MENSAGEM: '+ sMensagemDeErro );
        GravaNoDemonstrativo( ' ' );
        Exit;

      End;

      { Processar beneficios }
      If ( Not ProcessarBeneficios( CdsDadosGrupoFamiliar.FieldByName('IDPESSOA').AsInteger ) ) Then Begin

        GravaNoDemonstrativo( 'ERRO AO PROCESSAR BENEFICIOS DA MATRICULA -> '+ FMatriculaIndividuo +' COM A MENSAGEM: '+ sMensagemDeErro );
        GravaNoDemonstrativo( ' ' );
        Exit;

      End;

      CdsDadosGrupoFamiliar.Next;

    End;  { While ( Not CdsDadosGrupoFamiliar.Eof ) Do Begin }

    Result := True;

  Except


  End;

End;

{------------------------------------------------------------------------------}
{ Busca dados do grupo familiar deste responsavel                              }
Function TSaldamentoPensionista.BuscaDadosDoGruposFamiliar: Boolean;
Var
  sSQL : String;
Begin

  Try

    Try

      sSQL := 'SELECT DISTINCT '+
              '  BFT.IDPESSJUR,  BFT.IDPLANOPREV, BFT.IDPLANOORIGEM,    '+
              '  BFT.IDTITULAR,  BFT.IDPESSOA,    BFT.IDRESPONSAVEL,  BFT.IDNUCLEOFAMILIAR,   '+
              '  PESB.NOME AS NOMEBENEFICIARIO, '+
              '  RES.VALORRESERVA AS VALORBS,   '+
              '  TRUNC( ( SYSDATE - DATANASC )/365.5) '+
              'FROM   '+
              '  BFCIARIOTITPLAN BFT,  '+
              '  BENEFBFCIARIO BFB,   '+
              '  RESERVAPART RES,      '+
              '  PESSOA PESB,          '+
              '  PESSOAFISICA PEFB,    '+
              '  NUCLEOFAMILIAR NU     '+ // Renato Visoni SOL 123448 - kINTANA - 617202
              'WHERE  '+
              '  ( BFT.IDRESPONSAVEL  = '+ IntToStr( iIdResponsavelProcessando ) +' ) AND '+
              '  (NU.IDRESPNUCLEO = '+ IntToStr( iIdResponsavelProcessando ) +' ) AND '+ //Renato Visoni SOL 123448 - kINTANA - 617202
              '  ( BFT.IDPESSJUR      = 91008 )                                 AND '+
              '  ( BFB.IDSITBENEFICIO = 1 )                                      AND '+
              '  ( RES.IDPLANOPREV    = '+ IntToStr( iIdNovoPlano )        +' ) AND ';

              If FTipoArquivo = taPensionista Then Begin
              sSQL := sSQL + '  ( RES.IDTIPORESERVA  = '+ IntToStr( iIdTipoReservaRM )    +' ) AND '; // SOL:123735 - Daniel Begnami
              end else begin
              sSQL := sSQL +  '  ( RES.IDTIPORESERVA  = '+ IntToStr( iIdTipoReservaBS )    +' ) AND ';
              end;

              sSQL := sSQL + '  ( BFT.IDNUCLEOFAMILIAR IS NOT NULL ) AND '+

              '  ( BFT.IDTITULAR    <> BFT.IDPESSOA       ) AND '+

              '  ( BFT.IDPESSOA      = PESB.IDPESSOA      ) AND '+
              '  ( BFT.IDPESSOA      = PEFB.IDPESSOA      ) AND '+

              '  ( BFT.IDPESSJUR     = BFB.IDPESSJUR      ) AND '+    
              '  ( BFT.IDPLANOORIGEM = BFB.IDPLANOORIGEM  ) AND '+
              '  ( BFT.IDPLANOPREV   = BFB.IDPLANOPREV    ) AND '+
              '  ( BFT.IDTITULAR     = BFB.IDTITULAR      ) AND '+
              '  ( BFT.IDPESSOA      = BFB.IDPESSOA       ) AND '+
              '  ( BFT.IDBENEFICIO   = BFB.IDBENEFICIO    ) AND '+
              '  ( BFT.SEQPROPOSTA   = BFB.SEQPROPOSTA    ) AND '+

              '  ( BFT.IDPESSJUR     = RES.IDPESSJUR      ) AND '+
              '  ( BFT.IDPESSOA      = RES.IDPESSOA       ) AND '+
              '  ( BFT.SEQPROPOSTA   = RES.SEQPROPOSTA    ) AND '+
              '  ( BFT.IDTITULAR     = RES.IDPARTICIPANTE ) AND '+
              '  (BFT.IDNUCLEOFAMILIAR = NU.IDNUCLEOFAMILIAR)   '+ // Renato Visoni SOL 123448 - kINTANA - 617202
              'ORDER BY '+
              '  BFT.IDTITULAR, BFT.IDPESSOA ';

      CdsDadosGrupoFamiliar.Data := GetDataPacket( sSQL );

      If ( CdsDadosGrupoFamiliar.IsEmpty = True ) Then Abort;

      Result := True;

    Except

      On E:Exception Do Begin

        sMensagemDeErro := E.Message;

        If ( sMensagemDeErro = 'Operation aborted' ) Then sMensagemDeErro := 'Dados do Grupo Familiar da matricula não encontrada.';

        Result := False;
      End;

    End;

  Finally

  End;

End; { TSaldamentoPensionista.BuscaDadosDoGruposFamiliar }

{------------------------------------------------------------------------------}
{ Executa alterações nas tabelas de contribuição (CONTRIBPREVNUCLEO)           }
Function TSaldamentoPensionista.ProcessarContribuicoes: Boolean;
Var
  sSQL, sFlgDescFolha, sDataInicio : String;
  dPercentualLocal : Double;
  iIdSitBeneficio, iIdBeneficioReplan : Integer;
Begin

  Result := False;

  Try

    iIdBeneficioReplan := -1;
    If ( FTipoArquivo = taAposentado )
    Then  RetornaDadosReplan( CdsDadosGrupoFamiliar.FieldByName('IDPESSOA').AsInteger, sDataInicio, sFiller, sFiller,
                              iIdBeneficioReplan, iIdSitBeneficio, iFiller, dFiller, False  )
    Else  sDataInicio := sDataEvento;

    {--------------------------------------------------------------------------}
    { Suspender as contribuições do antigas                                    }
    sSQL := 'UPDATE  CONTRIBPREVNUCLEO SET FLGCOBRA  = 0, '+
            '                              DATAFINAL = TO_DATE('''+ DateToStr( StrToDate( sDataEvento ) -1  )+''',''DD/MM/YYYY'') '+
            'WHERE   IDNUCLEOFAMILIAR   = '+ CdsDadosGrupoFamiliar.FieldByName('IDNUCLEOFAMILIAR').AsString;

    If Not ExecSQL( sSQL ) Then Abort;

    {--------------------------------------------------------------------------}
    { Associar as contribuições do NOVO PLANO                                  }

    sSQL := 'SELECT '+
            '  CP.CODPORTFORMA,   CP.FLGPAGADOR,   '+
            '  CP.IDCONTRIBUICAO, NVL( CP.FLGDESCFOLHA, 0 ) AS FLGDESCFOLHA '+
            'FROM   '+
            '  CONTPREVEVENTO CE, CONTPREV CP '+
            'WHERE  '+
            '  CE.IDPLANOPREV     = '+ IntToStr( iIdNovoPlano ) +' AND '+
            '  CE.IDEVENTOGERADOR IN ( SELECT EP.IDEVENTOGERADOR '+
            '                          FROM EVENTOSPREV EP       '+
            '                          WHERE ( EP.IDPESSOA = ' + CdsDadosIndividuo.FieldByName('IDTITULAR').AsString + ' ) AND '+
            '                                ( EP.IDPLANOPREV = '+ IntToStr( iIdNovoPlano ) +' ) AND '+
            '                                ( TO_CHAR(EP.TRGDTINCLUSAO, ''DD/MM/YYYY'') = '+ QuotedStr( DateToStr( Date ) ) +') ) AND '+
            '  CE.IDPLANOPREV     = CP.IDPLANOPREV    AND ' +
            '  CE.IDCONTRIBUICAO  = CP.IDCONTRIBUICAO';

    CdsSaldamentoAux.Data := GetDataPacket( sSQL );

    While Not CdsSaldamentoAux.Eof Do Begin

      dPercentualLocal := 1;

      sFlgDescFolha := CdsSaldamentoAux.FieldByName('FLGDESCFOLHA').AsString;

      sSQL := 'INSERT INTO CONTRIBPREVNUCLEO ( ' +
              '  IDCONTRIBUICAO,  IDNUCLEOFAMILIAR,  DATAINICIO,   DATAFINAL, '+
              '  FLGCOBRA,        ULTMESPREPARO ) '                             +
              'VALUES ( '+
              CdsSaldamentoAux.FieldByName('IDCONTRIBUICAO').AsString           + ' , ' +
              CdsDadosGrupoFamiliar.FieldByName('IDNUCLEOFAMILIAR').AsString    + ' , ' +

              'TO_DATE('''+ sDataInicio +''',''DD/MM/YYYY''), '+                         { DATAINICIO        }
              'NULL, '+                                                                  { DATAFINAL         }

              '1 ,'+                                                                     { FLGCOBRA          }

              QuotedStr( '0000/00')   + ') ';                                            { ULTMESPREPARO     }

      Try ExecSQL( sSQL ) Except End;
//      If Not ExecSQL( sSQL ) Then Abort;

      CdsSaldamentoAux.Next;

    End; { While Not CdsSaldamentoAux.Eof Do Begin }

    Result := True;

  Except

    sMensagemDeErro := MessageInfo;

    Result := False;
    Exit;

  End;

  Result := True;

End; { TSaldamentoPensionista.ProcessarContribuicoes }


End.


{ 

ROTINA DE DESFAZER ATIVO

-- APAGAR
DELETE FROM CONTRIBPREVPARTP WHERE IDPESSOA = 443569 AND IDPLANOPREV = 74
DELETE FROM RESERVAPART WHERE IDPESSOA = 443569 AND IDPLANOPREV = 74
DELETE FROM HSTCONTEVENTOSPR WHERE IDEVENTOSPREV IN (SELECT IDEVENTOSPREV FROM EVENTOSPREV   WHERE IDPESSOA = 443569 AND  ( IDPLANOPREV = 74 OR IDEVENTOGERADOR = 338 ))
DELETE FROM EVENTOSPREV WHERE IDPESSOA = 443569 AND  ( IDPLANOPREV = 74 OR IDEVENTOGERADOR = 338 )
DELETE FROM PARTPREVPLAN WHERE IDPESSOA = 443569 AND IDPLANOPREV = 74
-- VOLTAR
UPDATE PARTPREVPLAN  SET DATACANCELAMENTO = NULL, FLGDESATIVADO = 0 WHERE IDPESSOA = 443569 AND IDPLANOPREV = 2
UPDATE CONTRIBPREVPARTP  SET FLGCOBRA = 1, DATAFINAL = NULL  WHERE IDPESSOA = 443569 AND IDPLANOPREV = 2

    //5076 - Ádler Souza - SOL: 129557 - KINTANA: 711994
    {Case iAnoRef Of
      2002 : dValorIndice := 9.4418;
      2003 : dValorIndice := 14.7400;
      2004 : dValorIndice := 10.3839;
      2005 : dValorIndice := 6.1332;
      2006 : dValorIndice := 5.0474;
      2007 : dValorIndice := 2.8134;
      2008 : dValorIndice := 5.1557;
      2009 : dValorIndice := 6.4814;    // Renato Visoni \ Gustavo Terra SOL 106399 - KINTANA 476860 \ SOL 106242 - KINTANA 476808

    end;}

   // dValorBSInteiro  := dValorBSInteiro + ( dValorBSInteiro * ( iIncentivoDoPlano / 100 ) );
    { Aplicar novo incentivo  3,54 }
    //dValorBSInteiro  := dValorBSInteiro + ( dValorBSInteiro * ( dIncentivo354 / 100 ) );
    { Aplicar novo incentivo  5,35 }
    //dValorBSInteiro  := dValorBSInteiro + ( dValorBSInteiro * ( dIncentivo535 / 100 ) );


      { para o REB apartir de setembro de  2006, retirar o percentual de RA }
      {If (
           (
             ( FSomenteFinanceiro = True ) And
             ( JaTeveREB( iIdBeneficiario ) )
           )
           or ( CdsDadosBeneficio.FieldByName('IDPLANOPREV').AsInteger = 66  )
         )
         And ( sAnoMesAtual < '2006/09' )
         And ( bVolteiPercentualRA = False )
      Then Begin

        If ( Fpercentual > 0 ) Then
          dValorBSInteiro := (dValorBSInteiro + d10pcBS )
        Else
          dValorBSInteiro := dValorBSInteiro;

        bVolteiPercentualRA := True;
      End;        }

 { Retirar apartir de 2006/09 o incentivo aplicado }
      {If ( bAplicaIncentivo = True ) And ( sAnoMesAtual < '2006/09' ) Then
      Begin
        // Daniel Begnami Sol: 96526, 97976 e 93782
        if (sAnoMesAtual = '2006/08') then
        begin
          if ((CdsDadosBeneficio.FieldByName('IDPLANOPREV').AsInteger = 66) and ( Fpercentual > 0 )) then
          begin
            dValorBsInteiro := dValorBsInteiro - d10pcBS;
            dValorBSInteiro := dValorBSInteiro / ((100-Fpercentual)/100);
          end;
        end;
        // Fim
        bAplicaIncentivo := False;
      End;}

      // Daniel Begnami Sol: 96526, 97976 e 93782
    {  if (sAnoMesAtual = '2006/08') then
      begin
        // Gustavo Terra inicio
        if (
           (CdsDadosBeneficio.FieldByName('IDPLANOPREV').AsInteger = 66) or
           (CdsDadosBeneficio.FieldByName('IDPLANOPREV').AsInteger = 2)  or
           ((CdsDadosBeneficio.FieldByName('IDPLANOPREV').AsInteger = 66) and (flgPessoaParam = 'S'))
           ) then
           dValorBSInteiro  := dValorBSInteiro / ( 1 + ( iIncentivoDoPlano / 100 ));
      end;      }


     { Retirar apartir de 2007/01 o incentivo ds 3.54 }
{      If ( bAplicaIncentivo354 = True ) And ( sAnoMesAtual < '2007/01' ) Then Begin
        // Augusto 02/01/2008 - Nova formula de calculo dos descontos para acertar erro de arredondamento
        //dValorBSInteiro  := dValorBSInteiro - ( dValorBSInteiro * ( dIncentivo354 / 100 ) );
        dValorBSInteiro  := dValorBSInteiro / ( 1 + ( dIncentivo354 / 100 ) );
        bAplicaIncentivo354 := False;
      End;}

      { Retirar apartir de 2008/01 o incentivo ds 5.35 }
    {  If ( bAplicaIncentivo535 = True ) And ( sAnoMesAtual < '2008/01' ) Then
      Begin
        dValorBSInteiro  := dValorBSInteiro / ( 1 + ( dIncentivo535 / 100 ) );
        bAplicaIncentivo535 := False;
      End;}

   {    If ( CdsDadosBeneficio.FieldByName('IDPLANOPREV').AsInteger = 66 ) Then
        begin
          //dValorPagoInteiro := DeflacionaBS( dValorPago, sAnoMesAtual, sAnoMesDIBRefCalc );//Bruno Bastos - SOL: 102536 Kintana: 456310

          //Bruno Bastos - SOL: 105438 Kintana: 471819 - Início
         // if (sAnoMesAtual = '2009/01') then
           // dValorPago := dValorPago - dDiferencaB;
          //Bruno Bastos - SOL: 105438 Kintana: 471819 - Fim

          // Renato Visoni \ Gustavo Terra SOL 106399 - KINTANA 476860 \ SOL 106242 - KINTANA 476808
          if (sAnoMesAtual = '2009/01') then
          begin
                dIndice := 1.06481448;  // 1.061735 Renato Visoni SOL 110135 Kintana 502683
                dValorPagoInteiro := dValorPago/dIndice;
                dValorPagoInteiro := DeflacionaBS( dValorPago, sAnoMesAtual, sAnoMesDIBRefCalc, 1 );// get
          end
          else
          begin }

   //  end;
         // FIM Renato Visoni \ Gustavo Terra SOL 106399 - KINTANA 476860 \ SOL 106242 - KINTANA 476808
       // end;


    { dValorAtual := dValorAtual + ( dValorAtual * ( iIncentivoDoPlano / 100 ) );
        dValorTotal := dValorTotal + ( dValorTotal * ( iIncentivoDoPlano / 100 ) );

        { Aplicar novo incentivo 5.54 }
        {dValorAtual := dValorAtual + ( dValorAtual * ( dIncentivo354 / 100 ) );
        dValorTotal := dValorTotal + ( dValorTotal * ( dIncentivo354 / 100 ) );

        { Aplicar novo incentivo 5.35 }
        {dValorAtual := dValorAtual + ( dValorAtual * ( dIncentivo535 / 100 ) );
        dValorTotal := dValorTotal + ( dValorTotal * ( dIncentivo535 / 100 ) );}
}