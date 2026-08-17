// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Bruno Bastos
// Data        : 19/06/2007
// Pendência   : 25630
// Rotina      : AtualizaDataInicial, ProcessaCritica
// Alteração   : AtualizaDataInicial: utilizar o modofunção que agora é recebido também como parâme_
//               tro;
//               ProcessaCritica: passar o novo parâmetro para a AtualizaDataInicial.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 23/02/2007
// Pendência   : 24561
// Rotina      : AtualizaDataInicial
// Alteração   : Criação de função para atualizar o campo DATAINICIAL da tabela
//               EVOLFUNCPREV.
//------------------------------------------------------------------------------
// Autor(a)    : Bruno Bastos
// Data        : 18/07/2006
// Pendência   : 22832
// Rotina      : InsereEvolFuncPrev
// Alteração   : Para deletar o registro da evolfuncprev, filtrar pelo idfuncao
//               e pelo modofuncao se os mesmos estiverem preenchidos.
//------------------------------------------------------------------------------
// Autor(a)    : leo
// Data        : 10/03/2006
// Pendência   : 21713
// Rotina      : 
// Alteração   : acrescentei tratamento para DDD , ceDDDTelAlterado
//------------------------------------------------------------------------------
// Autor(a)    : leo
// Data        : 17/11/2005
// Pendência   : 20665, 20676
// Rotina      : Insereevolfuncprev
// Alteração   : deleção para garantir a não duplicação
//------------------------------------------------------------------------------
// Autor(a)    : leo
// Data        : 17/11/2005
// Pendência   : 20765
// Rotina      : TTabCriticasCcp.Insere
// Alteração   : correção no insert na tabcriticasccp, too many values
//------------------------------------------------------------------------------
// Autor(a)    : leo
// Data        : 19/10/2005
// Pendência   : 20449
// Rotina      :
// Alteração   : tratamento para data final da filial (FLGATIVO) - ceLocalAtivAlterado
//------------------------------------------------------------------------------
// Autor(a)    : leo
// Data        : 01/08/2005
// Pendência   : 19809
// Rotina      : Insere
// Alteração   : inclusão do parâmetro IDSITFUNC
//------------------------------------------------------------------------------
// Autor(a)    : leo
// Data        : 13/07/2005
// Pendência   : 19809
// Rotina      : Insere
// Alteração   : inclusão do parâmetro FLGINTERNO
//------------------------------------------------------------------------------

{

Unit com a implementação da classe TTabCriticasCcp,
espelho da entidade TABCRITICASCCP.
Nesta tabela serão guardadas as alterações feitas
nos dados cadastrais importados pelo interface
bem como os erros e divergências encontrados,
possibilitando tanto um backup dos dados anteriores a importação,
como um log de erros...


Estrutura: TABCRITICASCCP
 MESCOBRANCA                     NOT NULL CHAR(6)       PK
 IDPESSJUR                       NOT NULL NUMBER        PK
 SEQCRITICA                      NOT NULL NUMBER        PK
 IDPESSOA                                 NUMBER
 CHAVE                                    CHAR(1)
 VALORCHARVE                              VARCHAR2(15)
 CODERRO                         NOT NULL NUMBER(3)
 VALORNAFUNDACAO                          VARCHAR2(100)
 VALORNOINTERFACE                         VARCHAR2(100)
 TIPODADO                                 CHAR(1)
 FLGPROCESSADO                            CHAR(1)
 DTPROCESSADO                             DATE


Domínio:

PROCESSO = [ (0)Não processado, (1)Aceito, (2)Rejeitado ]
GRUPO = [ (C)Cadastral,   (E)Endereçco, (D)Dependentes, (V)Evolução Funcional,
          (O) Documentos, (N)Evento,    (L)Lotacao,     (T)Contato,
          (R) Interface com RH, (R) - Rubricas,  (F) -  Filiais , (A) - Agências ]
CHAVE = [ (M)Matricula, (I)Inscrição, (A)Num. Agência, (F)Num. Filial, (R)Cod. Rubrica ]
TIPODADO = [ (N)Numérico , (C)Caracter ,  (D)Data ]
CODERRO = [ (0)Part. não encontrado,
            (1)Agência não encontrada,
            (2)Banco não encontrado,
            (3)Nome alterado,
            (4)Data de admissão alterada,
            (5)Data de Nascimento alterada,
            (6)Numero do documento alterado,
            (7)Numero de dpd. Irrf alterado,
            (8)Cargo não encontrado,
            (9)Cargo alterado,
            (10)Nivel não encontrado,
            (11)Nivel alterado,
            (12)Sexo alterado,
            (13)Conta corrente alterada,
            (14)Erro alterando conta,
            (15)Erro alterando nome,
            (16)Erro alterando número documento,
            (17)Erro alterando sexo,
            (18)Erro alterando dt. nascimento,
            (19)Erro alterando dt. admissão,
            (20)Erro alterando n. dpd. irrf,
            (21)Erro alterando cargo,
            (22)Erro alterando nivel,
            (23)Participante Assistido,
            (24)Participante Mantido,
            (25)Endereço Inserido,
            (26)Logradouro Alterado,
            (27)Bairro Alterado,
            (28)CEP Alterado,
            (29)UF Alterado,
            (30)Número do Telefone Alterado,
            (31)Cidade Alterada,
            (32)Telefone Inserido,
            (33)Número da Carteira de Identidade Alterado,
            (34)UF da Carteira de Identidade Alterada,
            (35)Dt. de Expedição da Carteira de Identidade Alterada,
            (36)Nome do Pai Alterado,
            (37)Nome da Mãe Alterado,
            (38)Código do Municipio de Naturalidade Alterado,
            (39)Matrícula do Conjuge Alterada,
            (40)Tempo de Serviço Total Alterado,
            (41)Tempo de Serviço Não Creditado Alterado,
            (42)Documento de Identidade Inserido,
            (43)Dependente Inserido,
            (44)Estado Civil Alterado,
            (45)Indicador para Salário de IR alterado,
            (46)Indicador para Salário Família Alterado,
            (47)Indicador de Invalidez Alterado,
            (48)Data de inicio do Dependente Alterada,
            (49)Grau de Dependencia Alterado,
            (50)Indicador de Cargo de Diretor Alterado      ]

            (51)Tempo de Serviço Anterior Alterado         - ceTempoServAnteriorAlterado
            (52)Tempo de Serviço Publico Anterior Alterado - ceTempoServPublAlterado
            (53)Tempo de Serviço Privado Anterior Alterado - ceTempoServPrivAlterado
            (54)Tempo de Serviço Anterior Real Alterado    - ceTempoServRealAlterado,
            (55)Filial do Empregado Alterada               - ceFilialAlterada,
            (56)Filial do Empregado Não Encontrada         - ceFilialNEncontrada,
            (57)Situação do Empregado Alterada             - ceSitFuncAlterado,
            (58)Vinculação Funcional do Empregado Alterada - ceVinculaFuncAlterada,
            (59)Função Não Encontrada                      - ceFuncaoNEncontrada,
            (60)Função Alterada                            - ceFuncaoAlterada,
            (61)Data de Demissão Alterada                  - ceDtDemissaoAlterada,
            (62)Data de Readmissão Alterada                - ceDtReadmissaoAlterada,
            (63)Data do Falecimento Alterada               - ceDataMorteAlterada,
            (64)Participante Cancelado                     - cePartCancelado
            (65)Cidade Não Encontrada                      - ceCidadeNaoEncontrada
            (66)Agencia Em Branco                          - ceAgenciaZerada
            (67)UF não encontrada na tabela de Estado      - ceUFNEncontrada
            (68)Erro ao inserir novo dependente            - ceErroInsDep
            (69)Novo Funcionario Cadastrado                - ceEmprNovo
            (70)Centro de Custo do Empregado Alterado      - ceCCustoAlterado
            (71)Salário Total na Empresa Alterado          - ceSalarioAlterado
            (72)Matricula Alterada                         - ceMatriculaAlterada
            (73)Email do Contato Alterado                  - ceEMailContatoAlterado
            (74)Cargo do Contato Alterado                  - ceCargoContatoAlterado
            (75)Setor do Contato Alterado                  - ceSetorContatoAlterado
            (76)Data Nascimento do Contato Alterado        - ceNascimentoContatoAlterado
            (77)Obs do Contato Alterado                    - ceObsContatoAlterado
            (78)Novo cargo inserido na evolução funcional  - ceEfCargoInserido
            (79)Nova função inserida na evolução funcional - ceEfFuncaoInserido
            (80)Inserido Adicional compensatório           - ceEfACInserido
            (81)Inserido adicional por tempo de serviço    - ceEfATSInserido
            (82)Inserido adicional noturno                 - ceEfADNOTInserido  -- CANCELADO
            (83)Inserido percentual por periculosidade     - ceEfPericulInserido
            (84)Inserido percentual de insalubridade       - ceEfInsalubInserido
            (85)Data final do cargo atual alterada         - eEfDtFimCargoAlterado
            (86)Data final da função atual alterada        - ceEfDtFimFuncaoAlterado
            (87)Data final do percentual por insalubridade alterado - ceEfDtFimInsalubAlterado
            (88)Percentual de insalubridade alterado       - ceEfPercInsalubAlterado
            (89)Percentual por periculosidade alterado     - ceEfDtFimPericulAlterado
            (90)Data final do adicional noturno alterada   - ceEfDtFimAdNoturnoAlterado
            (91)Percentual do aicional noturno alterado    - ceEfPercAdNoturnoAlterado
            (92)Inserido pecentual de adicional noturno    - ceEfAdNoturnoInserido
            (93)Data final d adicional por tempo de serviço alterada - ceEfDtFimAtsAlterado
            (94)Percentual por tempo de serviço alterado   - ceEfPercAtsAlterado
            (95)Data final do adicional compensatório alterada - ceEfDtFimACAlterado
            (96)Percental de adicional compensatório alterado - ceEfPercACAlterado
            (97)Situação do funcionário alterada         - ceEvSituacaoAlterado
            (98) Valor da opção 1 da patrocinadora alterado -  ceValorBase1Alterado
            (99) Valor da opção 2 da patrocinadora alterado -  ceValorBase2Alterado
            (100) Valor da opção 3 da patrocinadora alterado - ceValorBase3Alterado
            (101) Valor da opção 4 da patrocinadora alterado - ceValorBase4Alterado
            (102) Valor da opção 5 da patrocinadora alterado - ceValorBase5Alterado
            (103) Valor da opção 6 da patrocinadora alterado - ceValorBase6Alterado
            (104) Evento inserido - ceEvEventoInserido
            (105) Descrição da rubrica alterada -  ceRubDescAlterado
            (106) Indicador (Provento/Desconto) da rubrica alterado - ceRubTipoAlterado
            (107) Indicador (Atraso/Devolução/Normal) da rubrica alterado -  ceRubFlgAtrasoAlterado
            (108) Rubrica inserida -  ceRubInserido
            (109) Nome da filial alterado -  ceLocalNomeAlterado
            (110) Tipo da filial (Capital/Interior) alterado -  ceLocalTipoAlterado
            (111) CGC da filial alterado -  ceLocalCGCAlterado
            (112) Sigla da filial alterada -  ceLocalSiglaAlterado
            (113) Filial inserida -  ceLocalInserido
            (114) Noma da agência alterado -  ceAgNomeAlterado
            (115) Agência inserida -  ceAgInserido
            (116) Elegível Inserido - ceElegivelInserido
            (117) Erro ao inserir elegível - ceErroElegivelInserido
            (118) e-mail alterado - ceEmailAlterado
            (119) Data inicio do cargo informado menor que a data de início do cargo atual  - ceDtInicioCargo
            (120) Data inicio da função informada menor que a data de início da função atual  - ceDtInicioFuncao
            (121) Data final da filial -  ceLocalAtivAlterado
            (122) DDD Alterado -  ceDDDTelAlterado            



FLGPROCESSADO = [(0)- Não processado , (1)- Aceito , (2)-Descartado ]

}


unit UTabCriticasCcp;

interface

uses Classes, Forms, Menus, Controls, windows,
   Dialogs, UDatabase, DBTables, UMensErro,  dBaseDados,Wwquery, SysUtils;

type

   TProcesso = (pNProcessado , pAceito, pRejeitado);
   TGrupo    = (gCadastro, gEndereco, gDependentes, gEvolFunc, gDocumentos, gEvento,
                gLotacao, gContato, gRH, gRubrica, gFilial, gAgencia);
   TTipoDado = (tdNumerico, tdCaracter, tdData);
   TChave = (cMatricula, cInscricao, cNumAgencia, cNumFilial, cCodRubrica );
   TCodErro = (cePartNEncontrado, ceAgenciaNEcontrada, ceBancoNEncontrado,
   ceNomeAlterado, ceDataAdmAlterada, ceDataNascAlterada, ceNumDocumentoAlterado,
   ceNDpdIrrfAlterado, ceCargoNEncontrado, ceCargoAlterado, ceNivelNEncontrado,
   ceNivelAlterado, ceSexoAlterado, ceContaAlterada,
   ceErroAltConta, ceErroAltNome, ceErroAltNumDocumento, ceErroAltSexo,
   ceErroAltDtNasc, ceErroAltDtAdm, ceErroAltNDepIrrf,
   ceErroAltCargo, ceErroAltNivel, cePartAssistido, cePartMantido,
   ceEnderecoInserido, ceLogradouroAlterado, ceBairroAlterado, ceCepAlterado,
   ceUfAlterada, ceNumeroTelAlterado, ceDDDTelAlterado,
   ceCidadeAlterada, ceTelInserido,
   ceNumIdentlterada, ceUfIdentAltarada, ceDtExpedIdentAlterada,
   ceNmPaiAltarado, ceNmMaeAltarado, ceNumNatAlterado,
   ceNrMatConjAlterada, ceQtTpServTotAlterado, ceQtTpServNaoCredAlterado,
   ceNumIdentInserido, ceDependenteInserido,
   ceEstCivilAlterado,
   ceIndSalIrAlterado,
   ceIndSalFamAlterado,
   ceIndInvalidezAlterado,
   ceDtInicioDpdAlterada,
   ceGrauDepenAlterado,
   ceIndDiretorAlterado,
   ceTempoServAnteriorAlterado,
   ceTempoServPublAlterado,
   ceTempoServPrivAlterado,
   ceTempoServRealAlterado,
   ceFilialAlterada,
   ceFilialNEncontrada,
   ceSitFuncAlterado,
   ceVinculaFuncAlterada,
   ceFuncaoNEncontrada,
   ceFuncaoAlterada,
   ceDtDemissaoAlterada,
   ceDtReadmissaoAlterada,
   ceDataMorteAlterada,
   cePartCancelado,
   ceCidadeNaoEncontrada,
   ceAgenciaZerada,
   ceUFNEncontrada,
   ceErroInsDep,
   ceEmprNovo,
   ceCCustoAlterado,
   ceSalarioAlterado,
   ceMatriculaAlterada,
   ceEMailContatoAlterado,
   ceCargoContatoAlterado,
   ceSetorContatoAlterado,
   ceNascimentoContatoAlterado,
   ceObsContatoAlterado,

   //evolução funcional
   ceEfCargoInserido, ceEfFuncaoInserido, ceEfACInserido, ceEfATSInserido,
   ceEfADNOTInserido, ceEfPericulInserido, ceEfInsalubInserido, ceEfDtFimCargoAlterado,
   ceEfDtFimFuncaoAlterado, ceEfDtFimInsalubAlterado, ceEfPercInsalubAlterado,
   ceEfDtFimPericulAlterado, ceEfDtFimAdNoturnoAlterado, ceEfPercAdNoturnoAlterado,
   ceEfAdNoturnoInserido, ceEfDtFimAtsAlterado, ceEfPercAtsAlterado, ceEfDtFimACAlterado,
   ceEfPercACAlterado,
   ceEfDtIniCargoAlterado,   

   //opções da patrocinadora
   ceValorBase1Alterado,ceValorBase2Alterado,ceValorBase3Alterado,ceValorBase4Alterado,
   ceValorBase5Alterado,ceValorBase6Alterado,

   //eventos --> ocorrências funcionais
   ceEvSituacaoAlterado, ceEvEventoInserido,

   //Rubricas
   ceRubDescAlterado, ceRubTipoAlterado, ceRubFlgAtrasoAlterado,
   ceRubInserido,

   //filial
   ceLocalNomeAlterado, ceLocalTipoAlterado, ceLocalCGCAlterado, ceLocalSiglaAlterado,
   ceLocalInserido, ceLocalAtivAlterado, 

   //agencia
   ceAgNomeAlterado, ceAgInserido,


   ceElegivelInserido, ceErroElegivelInserido ,
   ceEmailAlterado, ceDtInicioCargo, ceDtInicioFuncao);

   TTabCriticasCcp = class(TObject)
   private
    sTipoDadoInsere , sChaveInsere, sGrupo, sProcesso : String;

    dCodErroInsere : Double;

    FMesCobranca,
    FValorChave,
    FValorNaFundacao,
    FValorNoInterface,
    FAuxiliar1,
    FAuxiliar2,
    FAuxiliar3,
    FAuxiliar4,
    FAuxiliar5     :string;

    FIdPessjur,
    FSeqCritica,
    FIdPessoa : Double;

    FChave : TChave;
    FCodErro : TCodErro;
    FTipoDado : TTipoDado;
    FGrupo : TGrupo;
    FProcesso : TProcesso;

    procedure SetMesCobranca(sMesCobranca : String);
    procedure SetValorChave(sValorChave : String);
    procedure SetValorNaFundacao(sValorNaFundacao : String);
    procedure SetValorNoInterface(sValorNoInterface : String);
    procedure SetIdPessjur(dIdPessjur : Double);
    procedure SetSeqCritica(dSeqCritica : Double);
    procedure SetIdPessoa(dIdPessoa : Double);
    procedure SetChave(cChave : TChave);
    procedure SetTipoDado(tdTipoDado : TTipoDado);
    procedure SetCodErro(ceCodErro : TCodErro);
    procedure SetGrupo( gGrupo : TGrupo);
    procedure SetProcesso( pProcesso : TProcesso);
    procedure SetAuxiliar1(sAuxiliar1 : String);
    procedure SetAuxiliar2(sAuxiliar2 : String);
    procedure SetAuxiliar3(sAuxiliar3 : String);
    procedure SetAuxiliar4(sAuxiliar4 : String);
    procedure SetAuxiliar5(sAuxiliar5 : String);

    function  TrazProcesso( pProcesso : TProcesso ) : string;
    function  TrazGrupo( gGrupo : TGrupo ) : string;
    function  TrazTipoDado( tdDado : TTipoDado) : string;
    function  TrazChave( cChave : TChave) : string;
    function  TrazCodErro( ceCodErro : TCodErro) : Double;


   protected

   public

      constructor Create;
      destructor Destroy;

   published
      property MesCobranca      : String    read FMesCobranca      write SetMesCobranca;
      property IdPessjur        : Double    read FIdPessjur        write SetIdPessjur;
      property IdPessoa         : Double    read FIdPessoa         write SetIdPessoa;
      property SeqCritica       : Double    read FSeqCritica       write SetSeqCritica;
      property Chave            : TChave    read FChave            write SetChave;
      property ValorChave       : String    read FValorChave       write SetValorChave;
      property CodErro          : TCodErro  read FCodErro          write SetCodErro;
      property TipoDado         : TTipoDado read FTipoDado         write SetTipoDado;
      property Grupo            : TGrupo    read FGrupo            write SetGrupo;
      property FlgProcessado    : TProcesso read FProcesso         write SetProcesso;
      property ValorNaFundacao  : String    read FValorNaFundacao  write SetValorNaFundacao;
      property ValorNoInterface : String    read FValorNoInterface write SetValorNoInterface;
      property Auxiliar1        : String    read FAuxiliar1        write SetAuxiliar1;
      property Auxiliar2        : String    read FAuxiliar2        write SetAuxiliar2;
      property Auxiliar3        : String    read FAuxiliar3        write SetAuxiliar3;
      property Auxiliar4        : String    read FAuxiliar4        write SetAuxiliar4;
      property Auxiliar5        : String    read FAuxiliar5        write SetAuxiliar5;


      function Insere(     qryaux            : TwwQuery;
                           dIdPessjur,
                           dIdPessoa         : Double ;
                       var dSeqCritica       : Double ;
                           sMesCobranca,
                           sValorChave,
                           sValorNaFundacao,
                           sValorNoInterface : string;
                           cChave            : TChave ;
                           ceCodErro         : TCodErro;
                           tdTipoDado        : TTipoDado;
                           sFormato          : string ;
                           gGrupo            : TGrupo;
                           pProcesso         : TProcesso;
                           psValorChaveAux   : string {opcional};
                           sAuxiliar1, sAuxiliar2, sAuxiliar3, sAuxiliar4, sAuxiliar5 : String;
                           sFlgInterno, sIdSitFunc : String      ) : boolean  ;

      function  Apaga(qryaux : TwwQuery;
                 dIdPessjur : Double ;
                 sMesCobranca  : string ;
                 gGrupo : TGrupo     ) : Boolean;

      procedure InicializaSeq(qryaux : TwwQuery;
                 var  dSeqCritica : Double);

      function  PegaUltMes(qryaux : TwwQuery;
                dIdPessjur : Double; sGrupo : String ) : String;

      function   Rejeita(qryaux : TwwQuery;
                         dIdPessjur, dSeqCritica ,dIdPessoa : Double ;
                         sMesCobranca  : string ) : Boolean;

      function   AceitaTodos(qryaux : TwwQuery;
                       dIdPessjur  : Double ;
                       sMesCobranca  : string ) : Boolean;

      function   AtualizaAuxiliar1(qryaux : TwwQuery;
                       dIdPessjur, dSeqCritica, dIdPessoa : Double ;
                       sMesCobranca , sAuxiliar1 : string ) : Boolean;

      function   Aceita(qryaux : TwwQuery;
                       dIdPessjur, dSeqCritica, dIdPessoa : Double ;
                       sMesCobranca  : string ) : Boolean;

      function   RejeitaTodos(qryaux : TwwQuery;
                       dIdPessjur  : Double ;
                       sMesCobranca  : string ) : Boolean;

      function   ProcessaCritica( qryaux, QryUpDate           : TwwQuery;
                                  dIdPessjur,
                                  dIdPessoa           : Double;
                                  dSeqCritica         : Double ;
                                  sMesCobranca,
                                  sValorNaFundacao,
                                  sValorNoInterface,
                                  sFormato            : string;
                                  ceCodErro           : TCodErro;
                                  bAceita,
                                  bDesfaz             : Boolean;
                                  pProcesso           : TProcesso;
                                  psValorChaveAux,
                                  psAuxiliar1, psAuxiliar2, psAuxiliar3, psAuxiliar4, psAuxiliar5 : string ) : Boolean;

      function   Desfaz(qryaux : TwwQuery;
                 dIdPessjur, dSeqCritica, dIdPessoa : Double ;
                 sMesCobranca  : string ) : Boolean;

      function   TrazTipoCodErro( iCodErro : Integer) : TCodErro;

      function   TrazTipoProcesso( sNProcesso : String) : TProcesso;
   end;



var
   TabCriticasCcp : TTabCriticasCcp;

   function Insereevolfuncprev(qryaux, qryupdate : Twwquery ; sIdpessoa, sIdPessjur, sIdCargoExt,
                            sIdFuncao, sPerc1ac, sPerc2ac, sPercats, sPercinsalub,
                            sPercPericul, sPercFuncao, sModoFuncao, sDataInicio, sDataFinal,
                            sOrigem , sPercAdnot, sQtdeMinutos, sFormato : String;
                            var sSeqHistFunc : String) : Boolean;

   function AtualizaDataFinal(qryupdate : Twwquery; sIdPessoa, sIdPessjur, sSeqHistFunc,
                              sData, sFormato : String;
                              bMenosUmDia : Boolean) : Boolean;

  function AtualizaDataInicial(qryupdate : Twwquery ;
                               sIdPessoa, sIdPessjur, sSeqHistFunc,
                               sData, sFormato : String;
                               bMenosUmDia : Boolean;
                               sModoFunc : String) : Boolean;


   function InsereDependente(qryupdate : Twwquery ;
                          sIdPessoa, sMatricula, sNome, sFlgInvalid,
                          sDatanasc, sSexo, sEstCivil, sTpRelDpd,
                          sSeqDep, sFlgContaIr, sFlgContaSf, sDataInicio : String;
                          var sIdPessoaDepen : String ) : boolean;

implementation


constructor TTabCriticasCcp.Create;
begin
   inherited Create;
end;

destructor TTabCriticasCcp.Destroy;
begin
   inherited Destroy;
end;


procedure TTabCriticasCcp.SetMesCobranca(sMesCobranca : String);
begin
   FMesCobranca := sMesCobranca;
end;

procedure TTabCriticasCcp.SetValorChave(sValorChave : String);
begin
   FValorChave := sValorChave;
end;

procedure TTabCriticasCcp.SetValorNaFundacao(sValorNaFundacao : String);
begin
   FValorNaFundacao := sValorNaFundacao;
end;

procedure TTabCriticasCcp.SetValorNoInterface(sValorNoInterface : String);
begin
   FValorNoInterface := sValorNoInterface;
end;

procedure TTabCriticasCcp.SetAuxiliar1(sAuxiliar1 : String);
begin
   FAuxiliar1 := sAuxiliar1;
end;

procedure TTabCriticasCcp.SetAuxiliar2(sAuxiliar2 : String);
begin
   FAuxiliar2 := sAuxiliar2;
end;

procedure TTabCriticasCcp.SetAuxiliar3(sAuxiliar3 : String);
begin
   FAuxiliar3 := sAuxiliar3;
end;

procedure TTabCriticasCcp.SetAuxiliar4(sAuxiliar4 : String);
begin
   FAuxiliar4 := sAuxiliar4;
end;

procedure TTabCriticasCcp.SetAuxiliar5(sAuxiliar5 : String);
begin
   FAuxiliar5 := sAuxiliar5;
end;

procedure TTabCriticasCcp.SetIdPessjur(dIdPessjur : Double);
begin
   FIdPessjur := dIdPessjur;
end;

procedure TTabCriticasCcp.SetSeqCritica(dSeqCritica : Double);
begin
   FSeqCritica := dSeqCritica;
end;

procedure TTabCriticasCcp.SetIdPessoa(dIdPessoa : Double);
begin
   FIdPessoa := dIdPessoa;
end;

procedure TTabCriticasCcp.SetChave(cChave : TChave);
begin
   FChave := cChave;
   sChaveInsere :=  TrazChave(cChave);
end;

procedure TTabCriticasCcp.SetTipoDado(tdTipoDado : TTipoDado);
begin
   FTipoDado := tdTipoDado;
   sTipoDadoInsere :=  TrazTipoDado(tdTipoDado);
end;


procedure TTabCriticasCcp.SetGrupo( gGrupo : TGrupo);
begin
   FGrupo := gGrupo;
   sGrupo :=  TrazGrupo(gGrupo);
end;


procedure TTabCriticasCcp.SetProcesso( pProcesso : TProcesso);
begin
   FProcesso := pProcesso;
   sProcesso :=  TrazProcesso(pProcesso);
end;

procedure TTabCriticasCcp.SetCodErro(ceCodErro : TCodErro);
begin
   FCodErro  := ceCodErro;
   dCodErroInsere :=    TrazCodErro(ceCodErro);
end;


function  TTabCriticasCcp.TrazTipoDado( tdDado : TTipoDado) : string;
begin

   if (tdDado = tdNumerico) then
   Result := 'N'
   else if (tdDado = tdCaracter) then
   Result := 'C'
   else if (tdDado = tdData) then
   Result := 'D';
end;



function  TTabCriticasCcp.TrazGrupo( gGrupo : TGrupo) : string;
begin

   if      (gGrupo = gCadastro)    then   Result := 'C'
   else if (gGrupo = gEndereco)    then   Result := 'E'
   else if (gGrupo = gDependentes) then   Result := 'D'
   else if (gGrupo = gDocumentos)  then   Result := 'O'
   else if (gGrupo = gEvolFunc)    then   Result := 'V'
   else if (gGrupo = gEvento)      then   Result := 'N'
   else if (gGrupo = gLotacao)     then   Result := 'L'
   else if (gGrupo = gContato)     then   Result := 'T'
   else if (gGrupo = gRH )         then   Result := 'H'
   else if (gGrupo = gRubrica )    then   Result := 'R'
   else if (gGrupo = gFilial )     then   Result := 'F'
   else if (gGrupo = gAgencia )    then   Result := 'A';
end;


function  TTabCriticasCcp.TrazProcesso( pProcesso : TProcesso) : string;
begin

   if (pProcesso = pNProcessado) then
   Result := '0'
   else if (pProcesso = pAceito) then
   Result := '1'
   else if (pProcesso = pRejeitado) then
   Result := '2';
end;

function  TTabCriticasCcp.TrazTipoProcesso( sNProcesso : String) : TProcesso;
begin

   if sNProcesso = '0' then
      Result :=  pNProcessado
   else if sNProcesso = '1' then
      Result :=  pAceito
   else if sNProcesso = '2' then
      Result :=  pRejeitado;
end;


function  TTabCriticasCcp.TrazChave( cChave : TChave) : string;
begin

   if cChave = (cMatricula) then
   Result := 'M'
   else if (cChave = cInscricao) then
   Result := 'I'
   else if (cChave = cNumAgencia) then
   Result := 'A'
   else if (cChave = cNumFilial) then
   Result := 'F'
   else if (cChave = cCodRubrica) then
   Result := 'R';
end;

function  TTabCriticasCcp.TrazCodErro( ceCodErro : TCodErro) : Double;
begin

   if (ceCodErro = cePartNEncontrado)                then   Result := 0
   else if (ceCodErro = ceAgenciaNEcontrada)         then   Result := 1
   else if (ceCodErro = ceBancoNEncontrado)          then   Result := 2
   else if (ceCodErro = ceNomeAlterado)              then   Result := 3
   else if (ceCodErro = ceDataAdmAlterada)           then   Result := 4
   else if (ceCodErro = ceDataNascAlterada)          then   Result := 5
   else if (ceCodErro = ceNumDocumentoAlterado)      then   Result := 6
   else if (ceCodErro = ceNDpdIrrfAlterado)          then   Result := 7
   else if (ceCodErro = ceCargoNEncontrado)          then   Result := 8
   else if (ceCodErro = ceCargoAlterado)             then   Result := 9
   else if (ceCodErro = ceNivelNEncontrado)          then   Result := 10
   else if (ceCodErro = ceNivelAlterado)             then   Result := 11
   else if (ceCodErro = ceSexoAlterado)              then   Result := 12
   else if (ceCodErro = ceContaAlterada)             then   Result := 13
   else if (ceCodErro = ceErroAltConta)              then   Result := 14
   else if (ceCodErro = ceErroAltNome)               then   Result := 15
   else if (ceCodErro = ceErroAltNumDocumento)       then   Result := 16
   else if (ceCodErro = ceErroAltSexo)               then   Result := 17
   else if (ceCodErro = ceErroAltDtNasc)             then   Result := 18
   else if (ceCodErro = ceErroAltDtAdm)              then   Result := 19
   else if (ceCodErro = ceErroAltNDepIrrf)           then   Result := 20
   else if (ceCodErro = ceErroAltCargo)              then   Result := 21
   else if (ceCodErro = ceErroAltNivel)              then   Result := 22
   else if (ceCodErro = cePartAssistido)             then   Result := 23
   else if (ceCodErro = cePartMantido)               then   Result := 24
   else if (ceCodErro = ceEnderecoInserido)          then   Result := 25
   else if (ceCodErro = ceLogradouroAlterado)        then   Result := 26
   else if (ceCodErro = ceBairroAlterado)            then   Result := 27
   else if (ceCodErro = ceCepAlterado)               then   Result := 28
   else if (ceCodErro = ceUfAlterada)                then   Result := 29
   else if (ceCodErro = ceNumeroTelAlterado)         then   Result := 30
   else if (ceCodErro = ceCidadeAlterada)            then   Result := 31
   else if (ceCodErro = ceTelInserido)               then   Result := 32
   else if (ceCodErro = ceNumIdentlterada)           then   Result := 33
   else if (ceCodErro = ceUfIdentAltarada)           then   Result := 34
   else if (ceCodErro = ceDtExpedIdentAlterada)      then   Result := 35
   else if (ceCodErro = ceNmPaiAltarado)             then   Result := 36
   else if (ceCodErro = ceNmMaeAltarado)             then   Result := 37
   else if (ceCodErro = ceNumNatAlterado)            then   Result := 38
   else if (ceCodErro = ceNrMatConjAlterada)         then   Result := 39
   else if (ceCodErro = ceQtTpServTotAlterado)       then   Result := 40
   else if (ceCodErro = ceQtTpServNaoCredAlterado)   then   Result := 41
   else if (ceCodErro = ceNumIdentInserido)          then   Result := 42
   else if (ceCodErro = ceDependenteInserido)        then   Result := 43
   else if (ceCodErro = ceEstCivilAlterado)          then   Result := 44
   else if (ceCodErro = ceIndSalIrAlterado)          then   Result := 45
   else if (ceCodErro = ceIndSalFamAlterado)         then   Result := 46
   else if (ceCodErro = ceIndInvalidezAlterado)      then   Result := 47
   else if (ceCodErro = ceDtInicioDpdAlterada)       then   Result := 48
   else if (ceCodErro = ceGrauDepenAlterado)         then   Result := 49
   else if (ceCodErro = ceIndDiretorAlterado)        then   Result := 50
   else if (ceCodErro = ceTempoServAnteriorAlterado) then   Result := 51
   else if (ceCodErro = ceTempoServPublAlterado)     then   Result := 52
   else if (ceCodErro = ceTempoServPrivAlterado)     then   Result := 53
   else if (ceCodErro = ceTempoServRealAlterado)     then   Result := 54
   else if (ceCodErro = ceFilialAlterada)            then   Result := 55
   else if (ceCodErro = ceFilialNEncontrada)         then   Result := 56
   else if (ceCodErro = ceSitFuncAlterado)           then   Result := 57
   else if (ceCodErro = ceVinculaFuncAlterada)       then   Result := 58
   else if (ceCodErro = ceFuncaoNEncontrada)         then   Result := 59
   else if (ceCodErro = ceFuncaoAlterada)            then   Result := 60
   else if (ceCodErro = ceDtDemissaoAlterada)        then   Result := 61
   else if (ceCodErro = ceDtReadmissaoAlterada)      then   Result := 62
   else if (ceCodErro = ceDataMorteAlterada)         then   Result := 63
   else if (ceCodErro = cePartCancelado)             then   Result := 64
   else if (ceCodErro = ceCidadeNaoEncontrada)       then   Result := 65
   else if (ceCodErro = ceAgenciaZerada)             then   Result := 66
   else if (ceCodErro = ceUFNEncontrada)             then   Result := 67
   else if (ceCodErro = ceErroInsDep)                then   Result := 68
   else if (ceCodErro = ceEmprNovo)                  then   Result := 69
   else if (ceCodErro = ceCCustoAlterado)            then   Result := 70
   else if (ceCodErro = ceSalarioAlterado)           then   Result := 71
   else if (ceCodErro = ceMatriculaAlterada)         then   Result := 72
   else if (ceCodErro = ceEMailContatoAlterado)      then   Result := 73
   else if (ceCodErro = ceCargoContatoAlterado)      then   Result := 74
   else if (ceCodErro = ceSetorContatoAlterado)      then   Result := 75
   else if (ceCodErro = ceNascimentoContatoAlterado) then   Result := 76
   else if (ceCodErro = ceObsContatoAlterado)        then   Result := 77
   else if (ceCodErro = ceEfCargoInserido)           then   Result := 78
   else if (ceCodErro = ceEfFuncaoInserido)          then   Result := 79
   else if (ceCodErro = ceEfACInserido)              then   Result := 80
   else if (ceCodErro = ceEfATSInserido)             then   Result := 81
   else if (ceCodErro = ceEfADNOTInserido)           then   Result := 82
   else if (ceCodErro = ceEfPericulInserido)         then   Result := 83
   else if (ceCodErro = ceEfInsalubInserido )        then   Result := 84
   else if (ceCodErro = ceEfDtFimCargoAlterado)      then   Result := 85
   else if (ceCodErro = ceEfDtFimFuncaoAlterado)     then   Result := 86
   else if (ceCodErro = ceEfDtFimInsalubAlterado)    then   Result := 87
   else if (ceCodErro = ceEfPercInsalubAlterado )    then   Result := 88
   else if (ceCodErro = ceEfDtFimPericulAlterado)    then   Result := 89
   else if (ceCodErro = ceEfDtFimAdNoturnoAlterado)  then   Result := 90
   else if (ceCodErro = ceEfPercAdNoturnoAlterado  ) then   Result := 91
   else if (ceCodErro = ceEfAdNoturnoInserido  )     then   Result := 92
   else if (ceCodErro = ceEfDtFimAtsAlterado   )     then   Result := 93
   else if (ceCodErro = ceEfPercAtsAlterado    )     then   Result := 94
   else if (ceCodErro = ceEfDtFimACAlterado    )     then   Result := 95
   else if (ceCodErro = ceEfPercACAlterado     )     then   Result := 96
   else if (ceCodErro = ceEvSituacaoAlterado   )     then   Result := 97
   else if (ceCodErro = ceValorBase1Alterado   )     then   Result := 98
   else if (ceCodErro = ceValorBase2Alterado   )     then   Result := 99
   else if (ceCodErro = ceValorBase3Alterado   )     then   Result := 100
   else if (ceCodErro = ceValorBase4Alterado   )     then   Result := 101
   else if (ceCodErro = ceValorBase5Alterado   )     then   Result := 102
   else if (ceCodErro = ceValorBase6Alterado   )     then   Result := 103
   else if (ceCodErro = ceEvEventoInserido   )       then   Result := 104
   else if (ceCodErro = ceRubDescAlterado   )        then   Result := 105
   else if (ceCodErro = ceRubTipoAlterado   )        then   Result := 106
   else if (ceCodErro = ceRubFlgAtrasoAlterado   ) then   Result := 107
   else if (ceCodErro = ceRubInserido   )            then   Result := 108
   else if (ceCodErro = ceLocalNomeAlterado   )      then   Result := 109
   else if (ceCodErro = ceLocalTipoAlterado   )      then   Result := 110
   else if (ceCodErro = ceLocalCGCAlterado   )       then   Result := 111
   else if (ceCodErro = ceLocalSiglaAlterado   )     then   Result := 112
   else if (ceCodErro = ceLocalInserido   )          then   Result := 113
   else if (ceCodErro = ceAgNomeAlterado   )         then   Result := 114
   else if (ceCodErro = ceAgInserido   )             then   Result := 115
   else if (ceCodErro = ceElegivelInserido   )       then   Result := 116
   else if (ceCodErro = ceErroElegivelInserido   )   then   Result := 117
   else if (ceCodErro = ceEmailAlterado   )          then   Result := 118
   else if (ceCodErro = ceDtInicioCargo   )          then   Result := 119
   else if (ceCodErro = ceDtInicioFuncao   )         then   Result := 120
   else if (ceCodErro = ceLocalAtivAlterado)         then   Result := 121
   else if (ceCodErro = ceDDDTelAlterado)            then   Result := 122
   else if (ceCodErro = ceEfDtIniCargoAlterado)      then   Result := 123 ; 
end;

function  TTabCriticasCcp.TrazTipoCodErro( iCodErro : Integer) : TCodErro;
begin

   case iCodErro of
      0: Result := cePartNEncontrado;
      1: Result := ceAgenciaNEcontrada;
      2: Result := ceBancoNEncontrado;
      3: Result := ceNomeAlterado;
      4: Result := ceDataAdmAlterada;
      5: Result := ceDataNascAlterada;
      6: Result := ceNumDocumentoAlterado;
      7: Result := ceNDpdIrrfAlterado;
      8: Result := ceCargoNEncontrado;
      9: Result := ceCargoAlterado;
      10: Result := ceNivelNEncontrado;
      11: Result := ceNivelAlterado;
      12: Result := ceSexoAlterado;
      13: Result := ceContaAlterada;
      14: Result := ceErroAltConta;
      15: Result := ceErroAltNome;
      16: Result := ceErroAltNumDocumento;
      17: Result := ceErroAltSexo;
      18: Result := ceErroAltDtNasc;
      19: Result := ceErroAltDtAdm;
      20: Result := ceErroAltNDepIrrf;
      21: Result := ceErroAltCargo;
      22: Result := ceErroAltNivel;
      23: Result := cePartAssistido;
      24: Result := cePartMantido;
      25: Result := ceEnderecoInserido;
      26: Result := ceLogradouroAlterado;
      27: Result := ceBairroAlterado;
      28: Result := ceCepAlterado;
      29: Result := ceUfAlterada;
      30: Result := ceNumeroTelAlterado;
      31: Result := ceCidadeAlterada;
      32: Result := ceTelInserido;
      33: Result := ceNumIdentlterada;
      34: Result := ceUfIdentAltarada;
      35: Result := ceDtExpedIdentAlterada;
      36: Result := ceNmPaiAltarado;
      37: Result := ceNmMaeAltarado;
      38: Result := ceNumNatAlterado;
      39: Result := ceNrMatConjAlterada;
      40: Result := ceQtTpServTotAlterado;
      41: Result := ceQtTpServNaoCredAlterado;
      42: Result := ceNumIdentInserido;
      43: Result := ceDependenteInserido;
      44: Result := ceEstCivilAlterado;
      45: Result := ceIndSalIrAlterado;
      46: Result := ceIndSalFamAlterado;
      47: Result := ceIndInvalidezAlterado;
      48: Result := ceDtInicioDpdAlterada;
      49: Result := ceGrauDepenAlterado;
      50: Result := ceIndDiretorAlterado;
      51: Result := ceTempoServAnteriorAlterado; 
      52: Result := ceTempoServPublAlterado;
      53: Result := ceTempoServPrivAlterado;
      54: Result := ceTempoServRealAlterado;
      55: Result := ceFilialAlterada;
      56: Result := ceFilialNEncontrada;
      57: Result := ceSitFuncAlterado;
      58: Result := ceVinculaFuncAlterada;
      59: Result := ceFuncaoNEncontrada;
      60: Result := ceFuncaoAlterada;
      61: Result := ceDtDemissaoAlterada;
      62: Result := ceDtReadmissaoAlterada;
      63: Result := ceDataMorteAlterada;
      64: Result := cePartCancelado;
      65: Result := ceCidadeNaoEncontrada;
      66: Result := ceAgenciaZerada;
      67: Result := ceUFNEncontrada;
      68: Result := ceErroInsDep;
      69: Result := ceEmprNovo;
      70: Result := ceCCustoAlterado;
      71: Result := ceSalarioAlterado;
      72: Result := ceMatriculaAlterada;
      73: Result := ceEMailContatoAlterado;
      74: Result := ceCargoContatoAlterado;
      75: Result := ceSetorContatoAlterado;
      76: Result := ceNascimentoContatoAlterado;
      77: Result := ceObsContatoAlterado;
      78: Result := ceEfCargoInserido;
      79: Result := ceEfFuncaoInserido;
      80: Result := ceEfACInserido;
      81: Result := ceEfATSInserido;
      82: Result := ceEfADNOTInserido;
      83: Result := ceEfPericulInserido;
      84: Result := ceEfInsalubInserido;
      85: Result := ceEfDtFimCargoAlterado;
      86: Result := ceEfDtFimFuncaoAlterado;
      87: Result := ceEfDtFimInsalubAlterado;
      88: Result := ceEfPercInsalubAlterado;
      89: Result := ceEfDtFimPericulAlterado;
      90: Result := ceEfDtFimAdNoturnoAlterado;
      91: Result := ceEfPercAdNoturnoAlterado;
      92: Result := ceEfAdNoturnoInserido;
      93: Result := ceEfDtFimAtsAlterado;
      94: Result := ceEfPercAtsAlterado;
      95: Result := ceEfDtFimACAlterado;
      96: Result := ceEfPercACAlterado;
      97: Result := ceEvSituacaoAlterado;
      98: Result := ceValorBase1Alterado;
      99: Result := ceValorBase2Alterado;
      100: Result := ceValorBase3Alterado;
      101: Result := ceValorBase4Alterado;
      102: Result := ceValorBase5Alterado;
      103: Result := ceValorBase6Alterado;
      104: Result := ceEvEventoInserido;
      105: Result := ceRubDescAlterado;
      106: Result := ceRubTipoAlterado;
      107: Result := ceRubFlgAtrasoAlterado;
      108: Result := ceRubInserido;
      109: Result := ceLocalNomeAlterado;
      110: Result := ceLocalTipoAlterado;
      111: Result := ceLocalCGCAlterado;
      112: Result := ceLocalSiglaAlterado;
      113: Result := ceLocalInserido;
      114: Result := ceAgNomeAlterado;
      115: Result := ceAgInserido;
      116: Result := ceElegivelInserido;
      117: Result := ceErroElegivelInserido;
      118: Result := ceEmailAlterado;
      119: Result := ceDtInicioCargo;
      120: Result := ceDtInicioFuncao;
      121: Result := ceLocalAtivAlterado;
      122: Result := ceDDDTelAlterado;
      123: Result := ceEfDtIniCargoAlterado; 
   end;
end;

function   TTabCriticasCcp.Insere(     qryaux            : TwwQuery;
                                       dIdPessjur,
                                       dIdPessoa         : Double ;
                                   var dSeqCritica       : Double ;
                                       sMesCobranca,
                                       sValorChave,
                                       sValorNaFundacao,
                                       sValorNoInterface : string;
                                       cChave            : TChave ;
                                       ceCodErro         : TCodErro;
                                       tdTipoDado        : TTipoDado;
                                       sFormato          : string ;
                                       gGrupo            : TGrupo;
                                       pProcesso         : TProcesso;
                                       psValorChaveAux   : string {opcional};
                                       sAuxiliar1, sAuxiliar2, sAuxiliar3, sAuxiliar4, sAuxiliar5 : String;
                                       sFlgInterno, sIdSitFunc : String  ) : boolean  ;
var sSQL : string;
begin
   Result := False;

   SetIdPessjur(dIdpessjur);
   SetIdPessoa(dIdPessoa);
   SetSeqCritica(dSeqCritica);
   SetMesCobranca(sMesCobranca);
   SetValorChave(sValorChave);
   SetValorNaFundacao(sValorNaFundacao);
   SetValorNoInterface(sValorNoInterface);
   SetChave(cChave);
   SetCodErro(ceCodErro);
   SetTipoDado(tdTipoDado);
   SetGrupo(gGrupo);
   SetProcesso(pProcesso);
   SetAuxiliar1(sAuxiliar1);
   SetAuxiliar2(sAuxiliar2);
   SetAuxiliar3(sAuxiliar3);
   SetAuxiliar4(sAuxiliar4);
   SetAuxiliar5(sAuxiliar5);



   //caso os valores a serem guardados sejam
   //datas, formatálos antes
   if tdTipoDado = tdData then
   begin
      if (trim(FValorNaFundacao) <> '') and (trim(sFormato) <> '') then
      begin
         FValorNaFundacao := ' TO_CHAR(TO_DATE('''+FValorNaFundacao+''','''+sFormato+'''), ''DD/MM/YYYY'') ';
      end
      else if (trim(FValorNaFundacao) <> '') and (trim(sFormato) = '') then
      begin
         FValorNaFundacao := ' TO_CHAR(TO_DATE('''+FValorNaFundacao+''',''DD/MM/YYYY''), ''DD/MM/YYYY'') ';
      end;



      if (trim(FValorNoInterface) <> '') and (trim(sFormato) <> '') then
      begin
         FValorNoInterface := ' TO_CHAR(TO_DATE('''+FValorNoInterface+''','''+sFormato+'''), ''DD/MM/YYYY'') ';
      end
      else if (trim(FValorNoInterface) <> '') and (trim(sFormato) = '') then
      begin
         FValorNoInterface := ' TO_CHAR(TO_DATE('''+FValorNoInterface+''',''DD/MM/YYYY''), ''DD/MM/YYYY'') ';
      end;

   end;


   sSQL := ' INSERT INTO TABCRITICASCCP (IDPESSJUR , IDPESSOA , SEQCRITICA, MESCOBRANCA, '+
           ' VALORCHAVE , VALORNAFUNDACAO , VALORNOINTERFACE, CHAVE, CODERRO, TIPODADO, GRUPO, '+
           ' FLGPROCESSADO, DTPROCESSADO,  AUXILIAR1 , AUXILIAR2 , '+
           ' AUXILIAR3 , AUXILIAR4, AUXILIAR5, VALORCHAVEAUX , FLGSITPART, IDSITFUNC  ) '+
           ' VALUES ('''+FloatToStr(FIdPessjur)+''','''+FloatToStr(FIdPessoa)+''','''+FloatToStr(FSeqCritica)+''', '+
           ' '''+FMesCobranca+''','''+FValorChave+''', ';
   if tdTipoDado = tdData then
   sSQL := sSql +  ''+trim(FValorNaFundacao)+','+trim(FValorNoInterface)+', '
   else sSQL := sSql +  ''+quotedstr(trim(FValorNaFundacao))+','+quotedstr(trim(FValorNoInterface))+', ';

   sSQL := sSql + ' '''+trim(sChaveInsere)+''','''+FloatToStr(dCodErroInsere)+''','''+sTipoDadoInsere+''', '''+sGrupo+''', '+
           ' '''+sProcesso+''', SYSDATE,'+quotedstr(trim(sAuxiliar1))+','+quotedstr(trim(sAuxiliar2))+', '+
           ' '+quotedstr(trim(sAuxiliar3))+','+quotedstr(trim(sAuxiliar4))+','+quotedstr(trim(sAuxiliar5))+', ';

   if Trim(psValorChaveAux) <> ''
   then sSQL := sSQL + ''''+psValorChaveAux+''' , '
   else sSQL := sSQL + ' NULL ,  ';


   sSQL := sSQL + ''''+sFlgInterno+''', '''+sIdSitFunc+''' ) ';


   qryaux.Close;
   qryaux.sql.Clear;
   qryaux.sql.Add(sSQL);

   try
      qryaux.ExecSQL;
      dSeqCritica := dSeqCritica + 1;
   except
      dSeqCritica := dSeqCritica + 1;
      Exit;
   end;


   Result := True;

end;



function   TTabCriticasCcp.Apaga(qryaux : TwwQuery;
                 dIdPessjur : Double ;
                 sMesCobranca  : string ;
                 gGrupo : TGrupo    ) : Boolean;
begin

   Result := False;

   SetIdPessjur(dIdpessjur);
   SetMesCobranca(sMesCobranca);

   qryaux.Close;
   qryaux.sql.Clear;
   qryaux.sql.Add(' DELETE TABCRITICASCCP '+
                  ' WHERE  MESCOBRANCA = '''+FMesCobranca+'''  '+
                  ' AND    IDPESSJUR   = '+FloatToStr(FIdPessjur)+
                  ' AND    GRUPO       = '''+TrazGrupo(gGrupo)+''' ');
   try
      qryaux.ExecSQL;
   except
      Exit;
   end;
   Result := True;
end;

procedure TTabCriticasCcp.InicializaSeq(qryAux : TwwQuery; var  dSeqCritica : Double);
begin
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT MAX(SEQCRITICA) SEQCRITICA FROM TABCRITICASCCP ');

   try
      qryAux.Open;

      if not qryaux.isempty
      then dSeqCritica := qryaux.FieldByName('SEQCRITICA').Value + 1
      else dSeqcritica := 1;
   except
      dSeqCritica := 0;
      Exit;
   end;
end;

function TTabCriticasCcp.PegaUltMes(qryaux : TwwQuery; dIdPessjur : Double; sGrupo :String ) : String;
begin

   Result := '000000';

   SetIdPessjur(dIdpessjur);


   qryaux.Close;
   qryaux.sql.Clear;
   qryaux.sql.Add(' SELECT  MAX(MESCOBRANCA) MESCOBRANCA FROM TABCRITICASCCP '+
                  ' WHERE IDPESSJUR = '''+FloatToStr(FIdPessjur)+''' ');

   if trim(sGrupo) <> '' then
   qryaux.sql.Add(' AND  GRUPO = '''+sGrupo+'''');
   
   try
      qryaux.Open;
   except
      Exit;
   end;

   if not qryaux.IsEmpty then
   Result := qryaux.fieldbyname('MESCOBRANCA').AsString ;

end;




function   TTabCriticasCcp.Aceita(qryaux : TwwQuery;
                 dIdPessjur, dSeqCritica, dIdPessoa : Double ;
                 sMesCobranca  : string ) : Boolean;
begin

   Result := False;

   SetIdPessjur(dIdpessjur);
   SetSeqCritica(dSeqCritica);
   SetMesCobranca(sMesCobranca);
   SetIdPessoa(dIdPessoa);


   qryaux.Close;
   qryaux.sql.Clear;
   qryaux.sql.Add(' UPDATE TABCRITICASCCP SET FLGPROCESSADO = 1 , DTPROCESSADO = SYSDATE '+
                  ' WHERE MESCOBRANCA = '''+FMesCobranca+''' '+
                  ' AND IDPESSJUR = '''+FloatToStr(FIdPessjur)+'''   '+
                  ' AND SEQCRITICA =  '''+FloatToStr(FSeqCritica)+''' '+
                  ' AND IDPESSOA = '''+FloatToStr(FIdPessoa)+'''  '+
                  ' AND NVL(FLGPROCESSADO,0) = 0 ');

   try
      qryaux.ExecSQL;
   except
      Exit;
   end;


   Result := True;

end;



function   TTabCriticasCcp.AtualizaAuxiliar1(qryaux : TwwQuery;
                 dIdPessjur, dSeqCritica, dIdPessoa : Double ;
                 sMesCobranca , sAuxiliar1 : string ) : Boolean;
begin

   Result := False;

   SetIdPessjur(dIdpessjur);
   SetSeqCritica(dSeqCritica);
   SetMesCobranca(sMesCobranca);
   SetIdPessoa(dIdPessoa);


   qryaux.Close;
   qryaux.sql.Clear;
   qryaux.sql.Add(' UPDATE TABCRITICASCCP SET AUXILIAR1 = '''+sAuxiliar1+''' '+
                  ' WHERE MESCOBRANCA = '''+FMesCobranca+''' '+
                  ' AND IDPESSJUR = '''+FloatToStr(FIdPessjur)+'''   '+
                  ' AND SEQCRITICA =  '''+FloatToStr(FSeqCritica)+''' '+
                  ' AND IDPESSOA = '''+FloatToStr(FIdPessoa)+'''  ');
   try
      qryaux.ExecSQL;
   except
      Exit;
   end;


   Result := True;

end;




function   TTabCriticasCcp.AceitaTodos(qryaux : TwwQuery;
                 dIdPessjur  : Double ;
                 sMesCobranca  : string ) : Boolean;
begin

   Result := False;

   SetIdPessjur(dIdpessjur);
   SetMesCobranca(sMesCobranca);


   qryaux.Close;
   qryaux.sql.Clear;
   qryaux.sql.Add(' UPDATE TABCRITICASCCP SET FLGPROCESSADO = 1 , DTPROCESSADO = SYSDATE '+
                  ' WHERE MESCOBRANCA = '''+FMesCobranca+''' '+
                  ' AND IDPESSJUR = '''+FloatToStr(FIdPessjur)+'''   '+
                  ' AND NVL(FLGPROCESSADO,0) = 0 ');

   try
      qryaux.ExecSQL;
   except
      Exit;
   end;


   Result := True;

end;



function   TTabCriticasCcp.RejeitaTodos(qryaux : TwwQuery;
                 dIdPessjur  : Double ;
                 sMesCobranca  : string ) : Boolean;
begin

   Result := False;

   SetIdPessjur(dIdpessjur);
   SetMesCobranca(sMesCobranca);


   qryaux.Close;
   qryaux.sql.Clear;
   qryaux.sql.Add(' UPDATE TABCRITICASCCP SET FLGPROCESSADO = 2 , DTPROCESSADO = SYSDATE '+
                  ' WHERE MESCOBRANCA = '''+FMesCobranca+''' '+
                  ' AND IDPESSJUR = '''+FloatToStr(FIdPessjur)+'''   '+
                  ' AND NVL(FLGPROCESSADO,0) = 0 ');

   try
      qryaux.ExecSQL;
   except
      Exit;
   end;


   Result := True;

end;



function   TTabCriticasCcp.Rejeita(qryaux : TwwQuery;
                 dIdPessjur, dSeqCritica, dIdPessoa : Double ;
                 sMesCobranca  : string ) : Boolean;
begin

   Result := False;

   SetIdPessjur(dIdpessjur);
   SetSeqCritica(dSeqCritica);
   SetMesCobranca(sMesCobranca);
   SetIdPessoa(dIdPessoa);


   qryaux.Close;
   qryaux.sql.Clear;
   qryaux.sql.Add(' UPDATE TABCRITICASCCP SET FLGPROCESSADO = 2 , DTPROCESSADO = SYSDATE '+
                  ' WHERE MESCOBRANCA = '''+FMesCobranca+''' '+
                  ' AND IDPESSJUR = '''+FloatToStr(FIdPessjur)+'''   '+
                  ' AND SEQCRITICA =  '''+FloatToStr(FSeqCritica)+''' '+
                  ' AND IDPESSOA = '''+FloatToStr(FIdPessoa)+'''  '+
                  ' AND NVL(FLGPROCESSADO,0) = 0 ');

   try
      qryaux.ExecSQL;
   except
      Exit;
   end;


   Result := True;

end;


function   TTabCriticasCcp.Desfaz(qryaux : TwwQuery;
                 dIdPessjur, dSeqCritica, dIdPessoa : Double ;
                 sMesCobranca  : string ) : Boolean;
begin

   Result := False;

   SetIdPessjur(dIdpessjur);
   SetSeqCritica(dSeqCritica);
   SetMesCobranca(sMesCobranca);
   SetIdPessoa(dIdPessoa);


   qryaux.Close;
   qryaux.sql.Clear;
   qryaux.sql.Add(' UPDATE TABCRITICASCCP SET FLGPROCESSADO = 0 , DTPROCESSADO = SYSDATE '+
                  ' WHERE MESCOBRANCA = '''+FMesCobranca+''' '+
                  ' AND IDPESSJUR = '''+FloatToStr(FIdPessjur)+'''   '+
                  ' AND SEQCRITICA =  '''+FloatToStr(FSeqCritica)+''' '+
                  ' AND IDPESSOA = '''+FloatToStr(FIdPessoa)+'''  '+
                  ' AND NVL(FLGPROCESSADO,0) <> 0 ');

   try
      qryaux.ExecSQL;
   except
      Exit;
   end;


   Result := True;

end;


function   TTabCriticasCcp.ProcessaCritica( qryaux, QryUpDate : TwwQuery;
                                            dIdPessjur, dIdPessoa : Double;
                                            dSeqCritica : Double ;
                                            sMesCobranca ,
                                            sValorNaFundacao, sValorNoInterface, sFormato : string;
                                            ceCodErro : TCodErro;
                                            bAceita, bDesfaz : Boolean;
                                            pProcesso :  TProcesso;
                                            psValorChaveAux,
                                            psAuxiliar1, psAuxiliar2, psAuxiliar3, psAuxiliar4, psAuxiliar5 : string ) : Boolean;
var sSqlUpdate, sIdCidade, sIdIdent, sAux, sIdPessoa : String;
    iIdEndereco, iIdTelefone, idprovento, idagencia : integer;

begin

   Result := False;

   //críticas pelo status do registro
   if (pProcesso = pNProcessado) and (bDesfaz) then exit;
   if (pProcesso = pAceito) and (not bdesfaz) then exit;
   if (pProcesso = pRejeitado) and (not bdesfaz) then exit;


   SetIdPessjur(dIdpessjur);
   SetIdPessoa(dIdPessoa);
   SetSeqCritica(dSeqCritica);
   SetMesCobranca(sMesCobranca);
   SetValorNaFundacao(sValorNaFundacao);
   SetValorNoInterface(sValorNoInterface);
   SetCodErro(ceCodErro);
   SetAuxiliar1(psAuxiliar1);
   SetAuxiliar2(psAuxiliar2);
   SetAuxiliar3(psAuxiliar3);
   SetAuxiliar4(psAuxiliar4);
   SetAuxiliar5(psAuxiliar5);


   //pega o identificador do endereço residencial
   if FAuxiliar1 = 'C' then
   sAux := 'IDENDCOMERCIAL'
   else sAux := 'IDENDRESIDENCIAL';

   sSqlUpdate := 'SELECT '+sAux+' IDEND FROM PESSOA  '+
              ' WHERE IDPESSOA = ' + floattostr(FIdPessoa);
   QryUpDate.close;
   QryUpDate.SQL.Text := sSqlUpdate;
   QryUpDate.Open;

   iIdEndereco := 0;
   if not qryupdate.isempty
   then iIdEndereco := qryupdate.fieldbyname('IDEND').AsInteger ;
   QryUpdate.Close;

   try
      if (not bAceita) and (not bdesfaz)
      then begin
         Rejeita(QryUpDate, FIdPessjur, FSeqCritica, FIdPessoa,
                 FMesCobranca  );
         result := true;
         exit;
      end
      else if not bDesfaz
           then begin
              Aceita(QryUpDate, FIdPessjur, FSeqCritica, FIdPessoa,
                      FMesCobranca  );
           end
           else if bDesfaz
                then begin
                    Desfaz(QryUpDate, FIdPessjur, FSeqCritica, FIdPessoa,
                           FMesCobranca  );
                end;


      if (ceCodErro = cePartNEncontrado) then
      begin {testar parametro para ver se inclui participante}  end
      else if (ceCodErro = ceAgenciaNEcontrada) then
      begin {sem tratamento}  end
      else if (ceCodErro = ceBancoNEncontrado) then
      begin {sem tratamento}  end
      else if (ceCodErro = ceNomeAlterado) and
              (FValorNoInterface <> '')  then
      begin {alterar nome}
         if bDesfaz
         then sSqlUpDate := 'UPDATE PESSOA SET NOME = '''+Trim(FValorNaFundacao)+''' '
         else sSqlUpDate := 'UPDATE PESSOA SET NOME = '''+Trim(FValorNoInterface)+''' ';

         sSqlUpDate := sSqlUpDate + ' WHERE IDPESSOA = '+floattostr(Fidpessoa);
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceDataAdmAlterada) then
      begin {alterar data admissão}
         sSqlUpDate := 'UpDate ElegPatro set dataadmissao = ';

         if bDesfaz then
         begin
            //se o valor anterior era nulo, não tenta transformar
            if Trim(FValorNaFundacao) = ''
            then sSqlUpDate := sSqlUpDate +' NULL '
            else sSqlUpDate := sSqlUpDate +' to_date('''+Trim(FValorNaFundacao) +''','''+sFormato+''') ';
         end
         else sSqlUpDate := sSqlUpDate +' to_date('''+Trim(FValorNoInterface) +''','''+sFormato+''') ';

         sSqlUpdate := sSqlUpDate + ' where idpessoa = '+floattostr(Fidpessoa);
         sSqlUpDate := sSqlUpDate + ' and idpessjur = '+floattostr(FIdPessjur);
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceDataNascAlterada) then
      begin {alterar datanasc}
         sSqlUpDate := 'UpDate PessoaFisica set datanasc = ';

         if bDesfaz then
         begin
            //se o valor anterior era nulo, não tenta transformar
            if Trim(FValorNaFundacao) = '' then
               sSqlUpDate := sSqlUpDate +' NULL '
            else
               sSqlUpDate := sSqlUpDate +' to_date('''+Trim(FValorNaFundacao) +''','''+sFormato+''') ';
         end
         else
            sSqlUpDate := sSqlUpDate +' to_date('''+Trim(FValorNoInterface) +''','''+sFormato+''') ';

         sSqlUpdate := sSqlUpDate + ' where idpessoa = '+floattostr(FIdPessoa);
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceNumDocumentoAlterado) then
      begin {alterar cpf}

         if bDesfaz then
         begin
           sSqlUpDate := 'UpDate Pessoa set numdocumento = '''+Trim(FValorNaFundacao)+'''';

           try
              qryUpdate.Close;
              qryUpdate.SQL.Clear;
              qryUpdate.SQL.Add(' UPDATE DOCPESSOA SET NUMDOCUMENTO = '''+Trim(FValorNaFundacao)+''' '+
                                ' WHERE  IDPESSOA = '+floattostr(FIdPessoa)+
                                ' AND  IDDOCUMENTO = (SELECT IDDOCUMENTO FROM TIPODOCPESSOA WHERE UPPER(NOMEDOCUMENTO ) LIKE ''%CPF%'')  ');
              qryUpdate.ExecSQL;
           except   end;
         end
         else
         begin
           sSqlUpDate := 'UpDate Pessoa set numdocumento = '''+Trim(FValorNoInterface)+'''';

           try
              qryUpdate.Close;
              qryUpdate.SQL.Clear;
              qryUpdate.SQL.Add(' UPDATE DOCPESSOA SET NUMDOCUMENTO = '''+Trim(FValorNoInterface)+''' '+
                                ' WHERE  IDPESSOA = '+floattostr(FIdPessoa)+
                                ' AND  IDDOCUMENTO = (SELECT IDDOCUMENTO FROM TIPODOCPESSOA WHERE UPPER(NOMEDOCUMENTO ) LIKE ''%CPF%'')  ');
              qryUpdate.ExecSQL;
           except   end;
         end;

         sSqlUpdate := sSqlUpDate + ' where idpessoa = '+floattostr(FIdPessoa);
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;

      end
      else if (ceCodErro = ceNDpdIrrfAlterado) then
      begin {alterar número de dep para irrf}
         if bDesfaz then
            sSqlUpDate := 'UpDate PessoaFisica set numdepirrf = '+Trim(FValorNaFundacao)
         else
            sSqlUpDate := 'UpDate PessoaFisica set numdepirrf = '+Trim(FValorNoInterface);

         sSqlUpdate := sSqlUpDate + ' where idpessoa = '+floattostr(Fidpessoa);
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceCargoNEncontrado) then
      begin {sem tratamento}   end
      else if (ceCodErro = ceCargoAlterado) then
      begin {alterar cargo}
         if bDesfaz then
            sSqlUpDate := 'UPDATE ELEGPATRO SET IDCARGOEXT = '+Trim(FValorNaFundacao)+
                          ' WHERE IDPESSOA = '+floattostr(FIdPessoa)+
                          ' AND IDPESSJUR = '+floattostr(FIdPessjur)
         else
            sSqlUpDate := 'UPDATE ELEGPATRO SET IDCARGOEXT = '+Trim(FValorNoInterface)+
                          ' WHERE IDPESSOA = '+floattostr(FIdPessoa)+
                          ' AND IDPESSJUR = '+floattostr(FIdPessjur);

         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceNivelNEncontrado) then
      begin {sem tratamento}  end
      else if (ceCodErro = ceNivelAlterado) then
      begin {alterar nivel}
         if bDesfaz then
            sSqlUpDate := 'UPDATE ELEGPATRO SET NIVEL = '+Trim(FValorNaFundacao)+
                          ' WHERE IDPESSOA = ' + floattostr(FIdPessoa) +
                          ' AND IDPESSJUR = ' + floattostr(FIdPessjur)
         else
            sSqlUpDate := 'UPDATE ELEGPATRO SET NIVEL = '+Trim(FValorNoInterface)+
                          ' WHERE IDPESSOA = ' + floattostr(FIdPessoa) +
                          ' AND IDPESSJUR = ' + floattostr(FIdPessjur);

         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceSexoAlterado) then
      begin {alterar sexo}
         sSqlUpDate := 'UpDate PessoaFisica set sexo = ''';

         if bDesfaz then
            sSqlUpDate := sSqlUpDate + Trim(FValorNaFundacao)+''''
         else
            sSqlUpDate := sSqlUpDate + Trim(FValorNoInterface)+'''';

         sSqlUpdate := sSqlUpDate + ' where idpessoa = '+floattostr(FIdPessoa);
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceContaAlterada) then
      begin {alterar conta corrente}
         if bDesfaz
         then sSqlUpdate := 'UPDATE CONTABANCARIA SET CONTACORRENTE = '''+Trim(FValorNaFundacao)+''' '
         else sSqlUpdate := 'UPDATE CONTABANCARIA SET CONTACORRENTE = '''+Trim(FValorNoInterface)+''' ';

         if  Trim(FValorNaFundacao) <> ''
         then sSqlUpDate := sSqlUpDate + ' WHERE IDPESSOA     = ' + floattostr(FIdPessoa)+
                                         ' AND  CONTACORRENTE = '+Trim(FValorNaFundacao)
         else sSqlUpDate := sSqlUpDate + ' WHERE IDPESSOA     = ' + floattostr(FIdPessoa)+
                                         ' AND  CONTACORRENTE IS NULL ';
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      
      else if (ceCodErro = ceTempoServAnteriorAlterado) then
      begin
         if bDesfaz
         then sSqlUpdate := 'UPDATE ELEGPATRO SET TEMPOSERVANTERIOR = '+Trim(FValorNaFundacao)
         else sSqlUpdate := 'UPDATE ELEGPATRO SET TEMPOSERVANTERIOR = '+Trim(FValorNoInterface);

         if  Trim(FValorNaFundacao) <> ''
         then sSqlUpDate := sSqlUpDate + ' WHERE IDPESSOA     = ' + floattostr(FIdPessoa)+' AND IDPESSJUR = '+FloatToStr(FIdPessJur)
         else sSqlUpDate := sSqlUpDate + ' WHERE IDPESSOA     = ' + floattostr(FIdPessoa)+' AND IDPESSJUR = '+FloatToStr(FIdPessJur);
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceTempoServPublAlterado) then
      begin
         if bDesfaz
         then sSqlUpdate := 'UPDATE ELEGPATRO SET TEMPOSERVPUBLANT = '+Trim(FValorNaFundacao)
         else sSqlUpdate := 'UPDATE ELEGPATRO SET TEMPOSERVPUBLANT = '+Trim(FValorNoInterface);

         if  Trim(FValorNaFundacao) <> ''
         then sSqlUpDate := sSqlUpDate + ' WHERE IDPESSOA     = ' + floattostr(FIdPessoa)+' AND IDPESSJUR = '+FloatToStr(FIdPessJur)
         else sSqlUpDate := sSqlUpDate + ' WHERE IDPESSOA     = ' + floattostr(FIdPessoa)+' AND IDPESSJUR = '+FloatToStr(FIdPessJur);
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceTempoServPrivAlterado) then
      begin
         if bDesfaz
         then sSqlUpdate := 'UPDATE ELEGPATRO SET TEMPOSERVPRIVANT = '+Trim(FValorNaFundacao)
         else sSqlUpdate := 'UPDATE ELEGPATRO SET TEMPOSERVPRIVANT = '+Trim(FValorNoInterface);

         if  Trim(FValorNaFundacao) <> ''
         then sSqlUpDate := sSqlUpDate + ' WHERE IDPESSOA     = ' + floattostr(FIdPessoa)+' AND IDPESSJUR = '+FloatToStr(FIdPessJur)
         else sSqlUpDate := sSqlUpDate + ' WHERE IDPESSOA     = ' + floattostr(FIdPessoa)+' AND IDPESSJUR = '+FloatToStr(FIdPessJur);
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceTempoServRealAlterado) then
      begin
         if bDesfaz
         then sSqlUpdate := 'UPDATE ELEGPATRO SET TEMPOSERVANTREAL = '+Trim(FValorNaFundacao)
         else sSqlUpdate := 'UPDATE ELEGPATRO SET TEMPOSERVANTREAL = '+Trim(FValorNoInterface);

         if  Trim(FValorNaFundacao) <> ''
         then sSqlUpDate := sSqlUpDate + ' WHERE IDPESSOA     = ' + floattostr(FIdPessoa)+' AND IDPESSJUR = '+FloatToStr(FIdPessJur)
         else sSqlUpDate := sSqlUpDate + ' WHERE IDPESSOA     = ' + floattostr(FIdPessoa)+' AND IDPESSJUR = '+FloatToStr(FIdPessJur);
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceFilialAlterada) then
      begin
         if bDesfaz
         then sSqlUpdate := 'UPDATE ELEGPATRO SET IDESTAB = '+Trim(FValorNaFundacao)
         else sSqlUpdate := 'UPDATE ELEGPATRO SET IDESTAB = '+Trim(FValorNoInterface);

         if  Trim(FValorNaFundacao) <> ''
         then sSqlUpDate := sSqlUpDate + ' WHERE IDPESSOA     = ' + floattostr(FIdPessoa)+' AND IDPESSJUR = '+FloatToStr(FIdPessJur)
         else sSqlUpDate := sSqlUpDate + ' WHERE IDPESSOA     = ' + floattostr(FIdPessoa)+' AND IDPESSJUR = '+FloatToStr(FIdPessJur);
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceFilialNEncontrada) then
      begin { sem tratamento }
      end
      else if (ceCodErro = ceSitFuncAlterado) then
      begin
         if bDesfaz
         then sSqlUpdate := 'UPDATE ELEGPATRO SET IDSITFUNC = '+Trim(FValorNaFundacao)
         else sSqlUpdate := 'UPDATE ELEGPATRO SET IDSITFUNC = '+Trim(FValorNoInterface);

         if  Trim(FValorNaFundacao) <> ''
         then sSqlUpDate := sSqlUpDate + ' WHERE IDPESSOA     = ' + floattostr(FIdPessoa)+' AND IDPESSJUR = '+FloatToStr(FIdPessJur)
         else sSqlUpDate := sSqlUpDate + ' WHERE IDPESSOA     = ' + floattostr(FIdPessoa)+' AND IDPESSJUR = '+FloatToStr(FIdPessJur);
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceVinculaFuncAlterada) then
      begin
         if bDesfaz
         then sSqlUpdate := 'UPDATE ELEGPATRO SET CODVINCULAFUNC = '''+Trim(FValorNaFundacao)+''''
         else sSqlUpdate := 'UPDATE ELEGPATRO SET CODVINCULAFUNC = '''+Trim(FValorNoInterface)+'''';

         if  Trim(FValorNaFundacao) <> ''
         then sSqlUpDate := sSqlUpDate + ' WHERE IDPESSOA     = ' + floattostr(FIdPessoa)+' AND IDPESSJUR = '+FloatToStr(FIdPessJur)
         else sSqlUpDate := sSqlUpDate + ' WHERE IDPESSOA     = ' + floattostr(FIdPessoa)+' AND IDPESSJUR = '+FloatToStr(FIdPessJur);
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceFuncaoNEncontrada) then
      begin { sem tratamento }
      end
      else if (ceCodErro = ceFuncaoAlterada) then
      begin
         if bDesfaz
         then sSqlUpdate := 'UPDATE ELEGPATRO SET IDFUNCAOEXT = '+Trim(FValorNaFundacao)
         else sSqlUpdate := 'UPDATE ELEGPATRO SET IDDFUNCAOEXT = '+Trim(FValorNoInterface);

         if  Trim(FValorNaFundacao) <> ''
         then sSqlUpDate := sSqlUpDate + ' WHERE IDPESSOA     = ' + floattostr(FIdPessoa)+' AND IDPESSJUR = '+FloatToStr(FIdPessJur)
         else sSqlUpDate := sSqlUpDate + ' WHERE IDPESSOA     = ' + floattostr(FIdPessoa)+' AND IDPESSJUR = '+FloatToStr(FIdPessJur);
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceDtDemissaoAlterada) then
      begin
         if bDesfaz
         then begin
            if Trim(FValorNaFundacao) = ''
            then sSqlUpdate := 'UPDATE ELEGPATRO SET DATADEMISSAO = NULL '
            else sSqlUpdate := 'UPDATE ELEGPATRO SET DATADEMISSAO = TO_DATE('''+Trim(FValorNaFundacao)+''',''DD/MM/YYYY'') '
         end
         else sSqlUpdate := 'UPDATE ELEGPATRO SET DATADEMISSAO = TO_DATE('''+Trim(FValorNoInterface)+''',''DD/MM/YYYY'') ';

         if  Trim(FValorNaFundacao) <> ''
         then sSqlUpDate := sSqlUpDate + ' WHERE IDPESSOA     = ' + floattostr(FIdPessoa)+' AND IDPESSJUR = '+FloatToStr(FIdPessJur)
         else sSqlUpDate := sSqlUpDate + ' WHERE IDPESSOA     = ' + floattostr(FIdPessoa)+' AND IDPESSJUR = '+FloatToStr(FIdPessJur);
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceDtReadmissaoAlterada) then
      begin
         if bDesfaz
         then begin
            if Trim(FValorNaFundacao) = ''
            then sSqlUpdate := 'UPDATE ELEGPATRO SET DATAREADMISSAO = NULL '
            else sSqlUpdate := 'UPDATE ELEGPATRO SET DATAREADMISSAO = TO_DATE('''+Trim(FValorNaFundacao)+''',''DD/MM/YYYY'') '
         end
         else sSqlUpdate := 'UPDATE ELEGPATRO SET DATAREADMISSAO = TO_DATE('''+Trim(FValorNoInterface)+''',''DD/MM/YYYY'') ';

         if  Trim(FValorNaFundacao) <> ''
         then sSqlUpDate := sSqlUpDate + ' WHERE IDPESSOA     = ' + floattostr(FIdPessoa)+' AND IDPESSJUR = '+FloatToStr(FIdPessJur)
         else sSqlUpDate := sSqlUpDate + ' WHERE IDPESSOA     = ' + floattostr(FIdPessoa)+' AND IDPESSJUR = '+FloatToStr(FIdPessJur);
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceDataMorteAlterada) then
      begin
         if bDesfaz
         then begin
            if Trim(FValorNaFundacao) = ''
            then sSqlUpdate := 'UPDATE PESSOAFISICA SET DATAMORTE = NULL '
            else sSqlUpdate := 'UPDATE PESSOAFISICA SET DATAMORTE = TO_DATE('''+Trim(FValorNaFundacao)+''',''DD/MM/YYYY'') '
         end
         else sSqlUpdate := 'UPDATE PESSOAFISICA SET DATAMORTE = TO_DATE('''+Trim(FValorNoInterface)+''',''DD/MM/YYYY'') ';

         if  Trim(FValorNaFundacao) <> ''
         then sSqlUpDate := sSqlUpDate + ' WHERE IDPESSOA     = ' + floattostr(FIdPessoa)
         else sSqlUpDate := sSqlUpDate + ' WHERE IDPESSOA     = ' + floattostr(FIdPessoa);
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      
      else if (ceCodErro = ceErroAltConta) then
      begin {sem tratamento}  end
      else if (ceCodErro = ceErroAltNome) then
      begin {sem tratamento}  end
      else if (ceCodErro = ceErroAltNumDocumento) then
      begin {sem tratamento}  end
      else if (ceCodErro = ceErroAltSexo) then
      begin {sem tratamento}  end
      else if (ceCodErro = ceErroAltDtNasc) then
      begin {sem tratamento}  end
      else if (ceCodErro = ceErroAltDtAdm) then
      begin {sem tratamento}  end
      else if (ceCodErro = ceErroAltNDepIrrf) then
      begin {sem tratamento}  end
      else if (ceCodErro = ceErroAltCargo) then
      begin {sem tratamento}  end
      else if (ceCodErro = ceErroAltNivel) then
      begin {sem tratamento}  end
      else if (ceCodErro = cePartAssistido) then
      begin {sem tratamento}  end
      else if (ceCodErro = cePartMantido) then
      begin {sem tratamento}  end
      else if (ceCodErro = cePartCancelado) then
      begin {sem tratamento}  end
      else if (ceCodErro = ceCidadeNaoEncontrada) then
      begin {sem tratamento}  end
      else if (ceCodErro = ceAgenciaZerada) then
      begin {sem tratamento}  end
      else if (ceCodErro = ceUFNEncontrada) then
      begin { sem tratamento } end
      else if (ceCodErro = ceErroInsDep) then
      begin { sem tratamento } end
      else if (ceCodErro = ceEmprNovo) then
      begin { sem tratamento } end
      else if (ceCodErro = ceEMailContatoAlterado) then
      begin

         if bDesfaz
         then sSqlUpdate := 'UPDATE CONTATOPESS SET EMAIL = '''+Trim(FValorNaFundacao)+''''
         else sSqlUpdate := 'UPDATE CONTATOPESS SET EMAIL = '''+Trim(FValorNoInterface)+'''';

         sSqlUpDate := sSqlUpDate + ' WHERE IDENDERECO = '+IntToStr(iIdEndereco);
         if Trim(psValorChaveAux) <> '' then sSqlUpDate := sSqlUpDate + ' AND NOME = '''+psValorChaveAux+'''';
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceCargoContatoAlterado) then
      begin

         if bDesfaz
         then sSqlUpdate := 'UPDATE CONTATOPESS SET CARGO = '''+Trim(FValorNaFundacao)+''''
         else sSqlUpdate := 'UPDATE CONTATOPESS SET CARGO = '''+Trim(FValorNoInterface)+'''';

         sSqlUpDate := sSqlUpDate + ' WHERE IDENDERECO = '+IntToStr(iIdEndereco);
         if Trim(psValorChaveAux) <> '' then sSqlUpDate := sSqlUpDate + ' AND NOME = '''+psValorChaveAux+'''';
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceSetorContatoAlterado) then
      begin

         if bDesfaz
         then sSqlUpdate := 'UPDATE CONTATOPESS SET SETOR = '''+Trim(FValorNaFundacao)+''''
         else sSqlUpdate := 'UPDATE CONTATOPESS SET SETOR = '''+Trim(FValorNoInterface)+'''';

         sSqlUpDate := sSqlUpDate + ' WHERE IDENDERECO = '+IntToStr(iIdEndereco);
         if Trim(psValorChaveAux) <> '' then sSqlUpDate := sSqlUpDate + ' AND NOME = '''+psValorChaveAux+'''';
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceNascimentoContatoAlterado) then
      begin

         if bDesfaz
         then begin
            if Trim(FValorNaFundacao) = ''
            then sSqlUpdate := 'UPDATE CONTATOPESS SET NASCIMENTO = NULL '
            else sSqlUpdate := 'UPDATE CONTATOPESS SET NASCIMENTO = TO_DATE('''+Trim(FValorNaFundacao)+''','''+sFormato+''') ';
         end
         else begin
            if Trim(FValorNoInterface) = ''
            then sSqlUpdate := 'UPDATE CONTATOPESS SET NASCIMENTO = NULL '
            else sSqlUpdate := 'UPDATE CONTATOPESS SET NASCIMENTO = TO_DATE('''+Trim(FValorNoInterface)+''','''+sFormato+''') ';
         end;

         sSqlUpDate := sSqlUpDate + ' WHERE IDENDERECO = '+IntToStr(iIdEndereco);
         if Trim(psValorChaveAux) <> '' then sSqlUpDate := sSqlUpDate + ' AND NOME = '''+psValorChaveAux+'''';
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceObsContatoAlterado) then
      begin

         if bDesfaz
         then sSqlUpdate := 'UPDATE CONTATOPESS SET OBS = '''+Trim(FValorNaFundacao)+''''
         else sSqlUpdate := 'UPDATE CONTATOPESS SET OBS = '''+Trim(FValorNoInterface)+'''';

         sSqlUpDate := sSqlUpDate + ' WHERE IDENDERECO = '+IntToStr(iIdEndereco);
         if Trim(psValorChaveAux) <> '' then sSqlUpDate := sSqlUpDate + ' AND NOME = '''+psValorChaveAux+'''';
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;

      end
      else if (ceCodErro = ceEnderecoInserido) then
      begin
         if bDesfaz then
         begin

             sSqlUpdate := ' DELETE TELENDPESS WHERE IDENDERECO = '+ inttostr(iidEndereco);
             QryUpDate.SQL.Text := sSqlUpdate;
             QryUpdate.ExecSQL;

             sSqlUpdate := ' DELETE ENDPESS WHERE IDENDERECO = '+ inttostr(iidEndereco);
             QryUpDate.SQL.Text := sSqlUpdate;
             QryUpdate.ExecSQL;

             sSqlUpdate := ' UPDATE PESSOA SET IDENDRESIDENCIAL = NULL, IDENDCOMERCIAL = NULL '+
                           ' WHERE IDPESSOA = '+floattostr(FIdPessoa) +' ';
             QryUpDate.SQL.Text := sSqlUpdate;
             QryUpdate.ExecSQL;
         end
         else
         begin

             //procura idcidades
             if bDesfaz then
                sSqlUpdate := ' SELECT IDCIDADES FROM CIDADES WHERE UPPER(LTRIM(RTRIM(NOME))) LIKE '''+FValorNaFundacao+''''
             else
                sSqlUpdate := ' SELECT IDCIDADES FROM CIDADES WHERE UPPER(LTRIM(RTRIM(NOME))) LIKE '''+copy(FValorNoInterface,90,20)+'''';
             QryUpDate.SQL.Text := sSqlUpdate;
             QryUpdate.Open;
             if not QryUpdate.IsEmpty then
                sIdCidade := qryUpdate.fieldbyname('IDCIDADES').AsString
             else
                sIdCidade := ' NULL ';
             QryUpdate.Close;


             iidEndereco := LeUltRegistro(Nil,'ENDPESS');

             sSqlUpdate := ' INSERT INTO ENDPESS (IDPESSOA, IDENDERECO , LOGRADOURO, '+
                           ' BAIRRO, CEP, CODESTADO,  '+
                           ' CIDADE, NUMERO, TIPOENDERECO , IDCIDADES, '+
                           ' IDPAIS,   NOME ) ';
             sSqlUpdate := sSqlUpdate + 'VALUES (' + floattostr(FIdPessoa) +', '+ inttostr(iidEndereco);
             sSqlUpDate := sSqlUpDate + ', '+ quotedstr(copy(FValorNoInterface,1,60))+' ';
             sSqlUpDate := sSqlUpDate + ', '+ quotedstr(copy(FAuxiliar2,1,20))+' ';
             sSqlUpDate := sSqlUpDate + ', '+ quotedstr(copy(FAuxiliar3,1,8))+' ';
             sSqlUpDate := sSqlUpDate + ', '+ quotedstr(copy(FAuxiliar4,1,2))+' ';
             sSqlUpDate := sSqlUpDate + ', '+ quotedstr(copy(FAuxiliar5,1,20))+' ';
             sSqlUpDate := sSqlUpDate + ', NULL , '''+FAuxiliar1+''', '+sIdCidade+'';
             sSqlUpDate := sSqlUpDate + ', 1 , ''RESIDENCIAL'' )';
             QryUpDate.SQL.Text := sSqlUpdate;
             QryUpdate.ExecSQL;


             if FAuxiliar1 = 'R' then
             sAux := 'IDENDRESIDENCIAL'
             else sAux := 'IDENDCOMERCIAL';

             //atualiza a indicação do endereço residencial do participante
             sSqlUpdate := ' UPDATE PESSOA SET '+sAux+' = '+inttostr(iidEndereco)+' '+
                           ' WHERE IDPESSOA = '+floattostr(FIdPessoa) +' ';
             QryUpDate.SQL.Text := sSqlUpdate;
             QryUpdate.ExecSQL;
         end;

      end
      else if (ceCodErro = ceLogradouroAlterado) then
      begin

         if bDesfaz then
            sSqlUpDate := 'UpDate endpess set logradouro = '''+FValorNaFundacao+''''
         else
            sSqlUpDate := 'UpDate endpess set logradouro = '''+FValorNoInterface+'''';
         sSqlUpdate := sSqlUpDate + ' where idpessoa = '+floattostr(FIdPessoa);
         sSqlUpdate := sSqlUpdate + ' and idendereco = '+inttostr(iIdEndereco);
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceBairroAlterado) then
      begin
         if bDesfaz then
            sSqlUpDate := 'UpDate endpess set bairro = '''+FValorNaFundacao+''''
         else
            sSqlUpDate := 'UpDate endpess set bairro = '''+FValorNoInterface+'''';

         sSqlUpdate := sSqlUpDate + ' where idpessoa = '+floattostr(FIdPessoa);
         sSqlUpdate := sSqlUpdate + ' and idendereco = '+inttostr(iIdEndereco);
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceCepAlterado) then
      begin

         if bDesfaz then
            sSqlUpDate := 'UpDate endpess set cep = '''+FValorNaFundacao+''''
         else
            sSqlUpDate := 'UpDate endpess set cep = '''+FValorNoInterface+'''';
         sSqlUpdate := sSqlUpDate + ' where idpessoa = '+floattostr(FIdPessoa);
         sSqlUpdate := sSqlUpdate + ' and idendereco = '+inttostr(iIdEndereco);
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceUfAlterada) then
      begin
         if bDesfaz then
            sSqlUpDate := 'UpDate endpess set CODESTADO = '''+FValorNaFundacao+''''
         else
            sSqlUpDate := 'UpDate endpess set CODESTADO = '''+FValorNoInterface+'''';
         sSqlUpdate := sSqlUpDate + ' where idpessoa = '+floattostr(FIdPessoa);
         sSqlUpdate := sSqlUpdate + ' and idendereco = '+inttostr(iIdEndereco);
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceNumeroTelAlterado) then
      begin

         if bDesfaz then
            sSqlUpDate := 'UpDate TELENDPESS set NUMERO = '''+FValorNaFundacao+''''
         else
            sSqlUpDate := 'UpDate TELENDPESS set NUMERO = '''+FValorNoInterface+'''';
         sSqlUpDate := sSqlUpDate + ' where idendereco = '+inttostr(iIdEndereco);
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceDDDTelAlterado) then
      begin

         if bDesfaz then
            sSqlUpDate := 'UpDate TELENDPESS set DDD = '''+FValorNaFundacao+''''
         else
            sSqlUpDate := 'UpDate TELENDPESS set DDD = '''+FValorNoInterface+'''';
         sSqlUpDate := sSqlUpDate + ' where idendereco = '+inttostr(iIdEndereco);
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceCidadeAlterada) then
      begin

         //procura idcidades
         if bDesfaz then
            sSqlUpdate := ' SELECT IDCIDADES FROM CIDADES WHERE UPPER(LTRIM(RTRIM(NOME))) LIKE '''+FValorNaFundacao+''''
         else
            sSqlUpdate := ' SELECT IDCIDADES FROM CIDADES WHERE UPPER(LTRIM(RTRIM(NOME))) LIKE '''+FValorNoInterface+'''';
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.Open;
         if not QryUpdate.IsEmpty then
            sIdCidade := qryUpdate.fieldbyname('IDCIDADES').AsString
         else
            sIdCidade := ' NULL ';
         QryUpdate.Close;


         if bDesfaz then
            sSqlUpDate := 'UpDate endpess set cidade = '''+FValorNaFundacao+''', '+
                          ' IDCIDADES = '+sIdCidade+''
         else
            sSqlUpDate := 'UpDate endpess set cidade = '''+FValorNoInterface+''', '+
                          ' IDCIDADES = '+sIdCidade+'';



         sSqlUpdate := sSqlUpDate + ' where idpessoa = '+floattostr(FIdPessoa);
         sSqlUpdate := sSqlUpdate + ' and idendereco = '+inttostr(iIdEndereco);
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;


      end
      else if (ceCodErro = ceTelInserido) then
      begin
         if bDesFaz then
         begin

            sSqlUpdate := ' DELETE TELENDPESS WHERE IDENDERECO = '+inttostr(iIdEndereco)+'  '+
                          ' AND LTRIM(RTRIM(NUMERO)) = '''+FValorNoInterface+'''  ';
            QryUpDate.SQL.Text := sSqlUpdate;
            QryUpdate.ExecSQL;
         end
         else
         begin
            iIdTelefone := LeUltRegistro(Nil,'TELENDPESS');

            sSqlUpDate := 'insert into telendpess(idendereco , idtelefone , numero, tipo ) '+
                          ' values ('+inttostr(iIdEndereco)+','+inttostr(iIdTelefone)+','+
                          ' '+trim(FValorNoInterface)+',''P'') ';
            QryUpDate.SQL.Text := sSqlUpdate;
            QryUpdate.ExecSQL;
         end;
      end
      else if (ceCodErro = ceNumIdentlterada) then
      begin {alterar número da carteira de identidade}

             sSqlUpdate := ' SELECT DCIDDOCIDENT  FROM PARAMINTERF WHERE  '+
                           ' IDPESSJUR = '+floattostr(FIdPessjur)+' ';
             QryUpDate.SQL.Text := sSqlUpdate;
             QryUpdate.Open;


             //crítica dupliacada , por isso está sem tratamento
             if not QryUpdate.IsEmpty then
             begin
                sIdIdent := qryUpdate.fieldbyname('DCIDDOCIDENT').AsString;
                QryUpdate.Close;

                sSqlUpDate := 'UpDate docpessoa set NUMDOCUMENTO = ''';

                if bDesfaz then
                   sSqlUpDate := sSqlUpDate + Trim(FValorNaFundacao)+''''
                else
                   sSqlUpDate := sSqlUpDate + Trim(FValorNoInterface)+'''';

                sSqlUpdate := sSqlUpDate + ' where idpessoa = '+floattostr(FIdPessoa)+
                                           ' and iddocumento = '''+sIdIdent+''' ';

                QryUpDate.SQL.Text := sSqlUpdate;
                QryUpdate.ExecSQL;

             end;
      end
      else if (ceCodErro = ceUfIdentAltarada) then
      begin   {alterar uf da carteira de identidade}
             sSqlUpdate := ' SELECT DCIDDOCIDENT  FROM PARAMINTERF WHERE  '+
                           ' IDPESSJUR = '+floattostr(FIdPessjur)+' ';
             QryUpDate.SQL.Text := sSqlUpdate;
             QryUpdate.Open;


             //crítica dupliacada , por isso está sem tratamento
             if not QryUpdate.IsEmpty then
             begin
                sIdIdent := qryUpdate.fieldbyname('DCIDDOCIDENT').AsString;
                QryUpdate.Close;

                sSqlUpDate := 'UpDate docpessoa set UF = ''';

                if bDesfaz then
                   sSqlUpDate := sSqlUpDate + Trim(FValorNaFundacao)+''''
                else
                   sSqlUpDate := sSqlUpDate + Trim(FValorNoInterface)+'''';

                sSqlUpdate := sSqlUpDate + ' where idpessoa = '+floattostr(FIdPessoa)+
                                           ' and iddocumento = '''+sIdIdent+''' ';
                QryUpDate.SQL.Text := sSqlUpdate;
                QryUpdate.ExecSQL;

             end;
      end
      else if (ceCodErro = ceDtExpedIdentAlterada) then
      begin  {alterar data de expedição da carteira de identidade }
             sSqlUpdate := ' SELECT DCIDDOCIDENT  FROM PARAMINTERF WHERE  '+
                           ' IDPESSJUR = '+floattostr(FIdPessjur)+' ';
             QryUpDate.SQL.Text := sSqlUpdate;
             QryUpdate.Open;


             //crítica dupliacada , por isso está sem tratamento
             if not QryUpdate.IsEmpty then
             begin
                sIdIdent := qryUpdate.fieldbyname('DCIDDOCIDENT').AsString;
                QryUpdate.Close;

                if bDesfaz
                then begin
                   if Trim(FValorNaFundacao) = ''
                   then sSqlUpdate := 'UPDATE DOCPESSOA SET DATAEMISSAO = NULL '
                   else sSqlUpDate := 'UPDATE DOCPESSOA SET DATAEMISSAO = TO_DATE('''+ Trim(FValorNaFundacao)+''','''+sFormato+''') ';
                end
                else sSqlUpDate := 'UPDATE DOCPESSOA SET DATAEMISSAO = TO_DATE('''+Trim(FValorNoInterface)+''','''+sFormato+''') ';

                sSqlUpdate := sSqlUpDate + ' WHERE IDPESSOA = '+floattostr(FIdPessoa)+
                                           ' AND IDDOCUMENTO = '''+sIdIdent+''' ';
                QryUpDate.SQL.Text := sSqlUpdate;
                QryUpdate.ExecSQL;

             end;
      end
      else if (ceCodErro = ceNmPaiAltarado) then
      begin  {alterar nome do pai}

         sSqlUpDate := 'UpDate PessoaFisica set NOMEPAI = ''';

         if bDesfaz then
            sSqlUpDate := sSqlUpDate + Trim(FValorNaFundacao)+''''
         else
            sSqlUpDate := sSqlUpDate + Trim(FValorNoInterface)+'''';

         sSqlUpdate := sSqlUpDate + ' where idpessoa = '+floattostr(FIdPessoa);
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;

      end
      else if (ceCodErro = ceNmMaeAltarado) then
      begin  {alterar nome da mãe}
         sSqlUpDate := 'UPDATE PESSOAFISICA SET NOMEMAE = ''';

         if bDesfaz then
            sSqlUpDate := sSqlUpDate + Trim(FValorNaFundacao)+''''
         else
            sSqlUpDate := sSqlUpDate + Trim(FValorNoInterface)+'''';

         sSqlUpdate := sSqlUpDate + ' where idpessoa = '+floattostr(FIdPessoa);
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;

      end
      else if (ceCodErro = ceNumNatAlterado) then
      begin {alterar  município de naturaliddae}
         sSqlUpDate := 'UpDate PessoaFisica set IDCIDADES = ''';

         if bDesfaz then
            sSqlUpDate := sSqlUpDate + Trim(FValorNaFundacao)+''''
         else
            sSqlUpDate := sSqlUpDate + Trim(FValorNoInterface)+'''';

         sSqlUpdate := sSqlUpDate + ' where idpessoa = '+floattostr(FIdPessoa);
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceNrMatConjAlterada) then
      begin {alterar matrícula do conjuge}
         if bDesfaz then
            sSqlUpDate := ' UPDATE DEPENTIT SET MATRICULA = '''+Trim(FValorNaFundacao)+''' '+
                                   ' WHERE IDPESSJUR = '+floattostr(FIdPessjur)+' '+
                                   ' AND IDTITULAR = '+floattostr(FIdPessoa)+' '+
                                   ' AND IDDEPENDENCIA = ''COM'' '
         else
            sSqlUpDate := ' UPDATE DEPENTIT SET MATRICULA = '''+Trim(FValorNoInterface)+''' '+
                                   ' WHERE IDPESSJUR = '+floattostr(FIdPessjur)+' '+
                                   ' AND IDTITULAR = '+floattostr(FIdPessoa)+' '+
                                   ' AND IDDEPENDENCIA = ''COM'' ';

         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;

      end
      else if (ceCodErro = ceQtTpServTotAlterado) then
      begin {alterar tempo de serviço total}
         if bDesfaz then
            sSqlUpDate := 'UPDATE ELEGPATRO SET TEMPOSERVTOTAL = '+Trim(FValorNaFundacao)+
                          ' WHERE IDPESSOA = ' + floattostr(FIdPessoa) +
                          ' AND IDPESSJUR = ' + floattostr(FIdPessjur)
         else
            sSqlUpDate := 'UPDATE ELEGPATRO SET TEMPOSERVTOTAL = '+Trim(FValorNoInterface)+
                          ' WHERE IDPESSOA = ' + floattostr(FIdPessoa) +
                          ' AND IDPESSJUR = ' + floattostr(FIdPessjur);

         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceQtTpServNaoCredAlterado) then
      begin {alterar tempo de serviço não creditado}
         if bDesfaz then
            sSqlUpDate := 'UPDATE ELEGPATRO SET TEMPONAOCREDITADO = '+Trim(FValorNaFundacao)+
                          ' WHERE IDPESSOA = ' + floattostr(FIdPessoa) +
                          ' AND IDPESSJUR = ' + floattostr(FIdPessjur)
         else
            sSqlUpDate := 'UPDATE ELEGPATRO SET TEMPONAOCREDITADO = '+Trim(FValorNoInterface)+
                          ' WHERE IDPESSOA = ' + floattostr(FIdPessoa) +
                          ' AND IDPESSJUR = ' + floattostr(FIdPessjur);

         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceNumIdentInserido) then
      begin {inserido documento de identidade}
         if bDesfaz then
         begin
             sSqlUpdate := ' DELETE DOCPESSOA WHERE  IDPESSOA = '+floattostr(FIdPessoa)+' '+
                           ' AND RTRIM(LTRIM(NUMDOCUMENTO)) = '+trim(FValorNoInterface);
             QryUpDate.SQL.Text := sSqlUpdate;
             QryUpdate.ExecSQL;
         end
         else
         begin

             //procura idcidades
             sSqlUpdate := ' SELECT DCIDDOCIDENT  FROM PARAMINTERF WHERE  '+
                           ' IDPESSJUR = '+floattostr(FIdPessjur)+' ';
             QryUpDate.SQL.Text := sSqlUpdate;
             QryUpdate.Open;


             //crítica dupliacada , por isso está sem tratamento
             if not QryUpdate.IsEmpty then
             begin
                sIdIdent := qryUpdate.fieldbyname('DCIDDOCIDENT').AsString;
                QryUpdate.close;

                sSqlUpDate := ' INSERT INTO DOCPESSOA(IDPESSOA, IDDOCUMENTO, '+
                           ' NUMDOCUMENTO, UF, DATAEMISSAO) '+
                           ' VALUES ('+floattostr(FIdPessoa)+', '+
                           ' '''+sIdIdent+''' ,'+
                           ' '''+copy(FValorNoInterface,1,18)+''' ,'+
                           ' '''+copy(FValorNoInterface,20,2)+'''  ,'+
                           ' TO_DATE('''+trim(copy(FValorNoInterface,24,10))+''', '+
                           '         '''+sFormato+''') ) ';
                QryUpDate.SQL.Text := sSqlUpdate;
                QryUpdate.ExecSQL;
             end;

         end;

      end
      else if (ceCodErro = ceDependenteInserido) then
      begin  {inserir dependente}

         if bDesfaz then
         begin
             sSqlUpdate := ' DELETE DEPENTIT WHERE  IDPESSOA = '''+FAuxiliar1+''' ';
             QryUpDate.SQL.Text := sSqlUpdate;
             QryUpdate.ExecSQL;

             sSqlUpdate := ' DELETE DEPENDENTE WHERE  IDPESSOA = '''+FAuxiliar1+''' ';
             QryUpDate.SQL.Text := sSqlUpdate;
             QryUpdate.ExecSQL;

             sSqlUpdate := ' DELETE PESSOAFISICA WHERE  IDPESSOA = '''+FAuxiliar1+''' ';
             QryUpDate.SQL.Text := sSqlUpdate;
             QryUpdate.ExecSQL;

             sSqlUpdate := ' DELETE PESSOA WHERE  IDPESSOA = '''+FAuxiliar1+''' ';
             QryUpDate.SQL.Text := sSqlUpdate;
             QryUpdate.ExecSQL;
         end
         else
         begin

            if InsereDependente(qryupdate, '',
                             copy(psValorChaveAux,1, length(psValorChaveAux) -2),
                             QuotedStr(FValorNoInterface),
                             copy(FAuxiliar2,1,1),
                             FAuxiliar4,
                             FAuxiliar3,
                             copy(FAuxiliar2,7,1),
                             copy(FAuxiliar2,2,3),
                             copy(psValorChaveAux, length(psValorChaveAux) -1,2),
                             copy(FAuxiliar2,5,1),
                             copy(FAuxiliar2,6,1),
                             FAuxiliar5,
                             sAux) 
            then AtualizaAuxiliar1(QryUpDate, FIdPessjur, FSeqCritica,
                                   FIdPessoa, FMesCobranca , sAux );



         end;

      end
      else if (ceCodErro = ceEstCivilAlterado) then
      begin {alterar estado civil}
         sSqlUpDate := 'UpDate PessoaFisica set estcivil = ''';

         if bDesfaz then
            sSqlUpDate := sSqlUpDate + Trim(FValorNaFundacao)+''''
         else
            sSqlUpDate := sSqlUpDate + Trim(FValorNoInterface)+'''';

         sSqlUpdate := sSqlUpDate + ' where idpessoa = '+floattostr(FIdPessoa);
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceIndSalIrAlterado) then
      begin  {alterar indicador para salário de IR}
         sSqlUpDate := 'UpDate depentit set flgcontaimpostor = ''';

         if bDesfaz then
            sSqlUpDate := sSqlUpDate + Trim(FValorNaFundacao)+''''
         else
            sSqlUpDate := sSqlUpDate + Trim(FValorNoInterface)+'''';

         sSqlUpdate := sSqlUpDate + ' where idpessoa = '+floattostr(FIdPessoa);
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceIndSalFamAlterado) then
      begin  {alterar indicador para salário família}
         sSqlUpDate := 'UpDate depentit set flgcontasalariof = ''';

         if bDesfaz then
            sSqlUpDate := sSqlUpDate + Trim(FValorNaFundacao)+''''
         else
            sSqlUpDate := sSqlUpDate + Trim(FValorNoInterface)+'''';

         sSqlUpdate := sSqlUpDate + ' where idpessoa = '+floattostr(FIdPessoa);
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceIndInvalidezAlterado) then
      begin {alterar Indicador de invalidez}
         sSqlUpDate := 'UpDate PessoaFisica set flginvalido = ''';

         if bDesfaz then
            sSqlUpDate := sSqlUpDate + Trim(FValorNaFundacao)+''''
         else
            sSqlUpDate := sSqlUpDate + Trim(FValorNoInterface)+'''';

         sSqlUpdate := sSqlUpDate + ' where idpessoa = '+floattostr(FIdPessoa);
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceDtInicioDpdAlterada) then
      begin {alterar data e inicio dependente}
         if bDesfaz
         then begin
            if Trim(FValorNaFundacao) = ''
            then sSqlUpdate := 'UPDATE DEPENTIT SET DATACADASTRO = NULL '
            else sSqlUpDate := 'UPDATE DEPENTIT SET DATACADASTRO = TO_DATE('''+Trim(FValorNaFundacao)+''','''+sFormato+''') ';
         end
         else sSqlUpDate := 'UPDATE DEPENTIT SET DATACADASTRO = TO_DATE('''+Trim(FValorNoInterface)+''','''+sFormato+''') ';

         sSqlUpdate := sSqlUpDate + ' WHERE IDPESSOA = '+FloatToStr(FIdPessoa);
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceGrauDepenAlterado) then
      begin {alterar grau de dependencia}
         sSqlUpDate := 'UpDate depentit set iddependencia = ''';

         if bDesfaz then
            sSqlUpDate := sSqlUpDate + Trim(FValorNaFundacao)+''''
         else
            sSqlUpDate := sSqlUpDate + Trim(FValorNoInterface)+'''';

         sSqlUpdate := sSqlUpDate + ' where idpessoa = '+floattostr(FIdPessoa);
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceIndDiretorAlterado) then
      begin  {alterar indicador de diretor}
         if bDesfaz
         then sSqlUpdate := 'UPDATE ELEGPATRO SET FLGDIRETOR = '+Trim(FValorNaFundacao)
         else sSqlUpdate := 'UPDATE ELEGPATRO SET FLGDIRETOR = '+Trim(FValorNoInterface);

         if  Trim(FValorNaFundacao) <> ''
         then sSqlUpDate := sSqlUpDate + ' WHERE IDPESSOA     = ' + floattostr(FIdPessoa)+' AND IDPESSJUR = '+FloatToStr(FIdPessJur)
         else sSqlUpDate := sSqlUpDate + ' WHERE IDPESSOA     = ' + floattostr(FIdPessoa)+' AND IDPESSJUR = '+FloatToStr(FIdPessJur);
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceEfCargoInserido) then
      begin  {apagar cargo inserido e retirar data final do cargo anterior}
         if bDesfaz then
         begin
            QryUpDate.close;
            QryUpDate.SQL.Text := ' DELETE evolfuncprev '+
                                  ' WHERE IDPESSOA     = ' + floattostr(FIdPessoa)+' AND '+
                                  ' IDPESSJUR = '+FloatToStr(FIdPessJur)+' AND '+
                                  ' IDCARGOEXT = '+Trim(FValorNoInterface)+' ';
            QryUpdate.ExecSQL;

            QryUpDate.close;
            QryUpDate.SQL.Text := ' UPDATE evolfuncprev  SET DATAFINAL = NULL'+
                                  ' WHERE IDPESSOA     = ' + floattostr(FIdPessoa)+' AND '+
                                  ' IDPESSJUR = '+FloatToStr(FIdPessJur)+' AND '+
                                  ' IDCARGOEXT = '+Trim(FValorNaFundacao)+' ';
            QryUpdate.ExecSQL;
         end
         else
         begin
            //insere novo cargo
            Insereevolfuncprev(qryaux, qryupdate,
                  floattostr(FIdPessoa),
                  floattostr(FIdPessjur),
                  Trim(FValorNoInterface),
                  'NULL', 'NULL', 'NULL', 'NULL',
                  'NULL', 'NULL','NULL',
                  FAuxiliar1,//modo
                  FAuxiliar2,//datainicio
                  'NULL',
                  'NULL' , 'NULL', 'NULL',
                  sFormato//formato
                  ,sAux );

            //atualiza data fnal do cargo anterior
            QryUpDate.close;
            QryUpDate.SQL.Text := ' UPDATE evolfuncprev  SET DATAFINAL = TO_DATE('''+FAuxiliar3+''','''+sFormato+''') '+
                                  ' WHERE IDPESSOA     = ' + floattostr(FIdPessoa)+' AND '+
                                  ' IDPESSJUR = '+FloatToStr(FIdPessJur)+' AND '+
                                  ' IDCARGOEXT = '+Trim(FValorNaFundacao)+' ';
            QryUpdate.ExecSQL;
         end;

      end
      else if (ceCodErro = ceEfFuncaoInserido) then
      begin
         if bDesfaz then
         begin
            QryUpDate.close;
            QryUpDate.SQL.Text := ' DELETE evolfuncprev '+
                                  ' WHERE IDPESSOA     = ' + floattostr(FIdPessoa)+' AND '+
                                  ' IDPESSJUR = '+FloatToStr(FIdPessJur)+' AND '+
                                  ' IDFUNCAO = '+Trim(FValorNoInterface)+' ';
            QryUpdate.ExecSQL;

            QryUpDate.close;
            QryUpDate.SQL.Text := ' UPDATE evolfuncprev  SET DATAFINAL = NULL'+
                                  ' WHERE IDPESSOA     = ' + floattostr(FIdPessoa)+' AND '+
                                  ' IDPESSJUR = '+FloatToStr(FIdPessJur)+' AND '+
                                  ' IDFUNCAO = '+Trim(FValorNaFundacao)+' ';
            QryUpdate.ExecSQL;
         end
         else
         begin
            //insere nova função
            Insereevolfuncprev(qryaux, qryupdate,
                  floattostr(FIdPessoa),
                  floattostr(FIdPessjur),
                  'NULL',
                  Trim(FValorNoInterface),
                  'NULL', 'NULL', 'NULL',
                  'NULL', 'NULL',
                  FAuxiliar5, //percentual
                  FAuxiliar1,//modo
                  FAuxiliar2,//datainicio
                  'NULL',
                  'NULL' , 'NULL', 'NULL',
                  sFormato //formato
                  ,sAux );

            //atualiza data final da função anterior
            QryUpDate.close;
            QryUpDate.SQL.Text := ' UPDATE evolfuncprev  SET DATAFINAL = TO_DATE('''+FAuxiliar3+''','''+sFormato+''') '+
                                  ' WHERE IDPESSOA     = ' + floattostr(FIdPessoa)+' AND '+
                                  ' IDPESSJUR = '+FloatToStr(FIdPessJur)+' AND '+
                                  ' IDFUNCAO = '+Trim(FValorNaFundacao)+' ';
            QryUpdate.ExecSQL;
         end;
      end
      else if (ceCodErro = ceEfACInserido) then
      begin
         if bDesfaz then
         begin
            QryUpDate.close;
            QryUpDate.SQL.Text := ' DELETE evolfuncprev '+
                                  ' WHERE IDPESSOA     = ' + floattostr(FIdPessoa)+' AND '+
                                  ' IDPESSJUR = '+FloatToStr(FIdPessJur)+' AND '+
                                  ' SEQHISTFUNC = '+Trim(FValorNaFundacao)+' ';
            QryUpdate.ExecSQL;
         end
         else
         begin
            Insereevolfuncprev(qryaux, qryupdate,
                  floattostr(FIdPessoa),
                  floattostr(FIdPessjur),
                  'NULL',
                  'NULL', Trim(FValorNoInterface),
                  'NULL', 'NULL',
                  'NULL', 'NULL',
                  'NULL', //percentual
                  FAuxiliar1,//modo
                  FAuxiliar2,//datainicio
                  'NULL',
                  'NULL' , 'NULL', 'NULL',
                  sFormato//formato
                  ,sAux );
         end;
      end
      else if (ceCodErro = ceEfATSInserido) then
      begin
         if bDesfaz then
         begin
            QryUpDate.close;
            QryUpDate.SQL.Text := ' DELETE evolfuncprev '+
                                  ' WHERE IDPESSOA     = ' + floattostr(FIdPessoa)+' AND '+
                                  ' IDPESSJUR = '+FloatToStr(FIdPessJur)+' AND '+
                                  ' SEQHISTFUNC = '+Trim(FValorNaFundacao)+' ';
            QryUpdate.ExecSQL;
         end
         else
         begin
            Insereevolfuncprev(qryaux, qryupdate,
                  floattostr(FIdPessoa),
                  floattostr(FIdPessjur),
                  'NULL',
                  'NULL', 'NULL',
                  'NULL', Trim(FValorNoInterface),
                  'NULL', 'NULL',
                  'NULL', //percentual
                  FAuxiliar1,//modo
                  FAuxiliar2,//datainicio
                  'NULL',
                  'NULL' , 'NULL', 'NULL',
                  sFormato//formato
                  ,sAux );
         end;
      end
      else if (ceCodErro = ceEfADNOTInserido) then
      begin
        //REPETIDO
      end
      else if (ceCodErro = ceEfPericulInserido) then
      begin
         if bDesfaz then
         begin
            QryUpDate.close;
            QryUpDate.SQL.Text := ' DELETE evolfuncprev '+
                                  ' WHERE IDPESSOA     = ' + floattostr(FIdPessoa)+' AND '+
                                  ' IDPESSJUR = '+FloatToStr(FIdPessJur)+' AND '+
                                  ' SEQHISTFUNC = '+Trim(FValorNaFundacao)+' ';
            QryUpdate.ExecSQL;
         end
         else
         begin
            Insereevolfuncprev(qryaux, qryupdate,
                  floattostr(FIdPessoa),
                  floattostr(FIdPessjur),
                  'NULL',
                  'NULL', 'NULL',
                  'NULL', 'NULL',
                  'NULL', Trim(FValorNoInterface),
                  'NULL', //percentual
                  FAuxiliar1,//modo
                  FAuxiliar2,//datainicio
                  'NULL',
                  'NULL' , 'NULL',
                  'NULL',//qtdeminutos
                  sFormato//formato
                  ,sAux );
         end;
      end
      else if (ceCodErro = ceEfInsalubInserido) then
      begin
         if bDesfaz then
         begin
            QryUpDate.close;
            QryUpDate.SQL.Text := ' DELETE evolfuncprev '+
                                  ' WHERE IDPESSOA     = ' + floattostr(FIdPessoa)+' AND '+
                                  ' IDPESSJUR = '+FloatToStr(FIdPessJur)+' AND '+
                                  ' SEQHISTFUNC = '+Trim(FValorNaFundacao)+' ';
            QryUpdate.ExecSQL;
         end
         else
         begin
            Insereevolfuncprev(qryaux, qryupdate,
                  floattostr(FIdPessoa),
                  floattostr(FIdPessjur),
                  'NULL',
                  'NULL', 'NULL',
                  'NULL', 'NULL',
                  Trim(FValorNoInterface), 'NULL',
                  'NULL', //percentual
                  FAuxiliar1,//modo
                  FAuxiliar2,//datainicio
                  'NULL',
                  'NULL' , 'NULL',
                  'NULL',//qtdeminutos
                  sFormato//formato
                  ,sAux );
         end;
      end
      else if(ceCodErro = ceEfDtFimCargoAlterado) then
      begin
         if bDesfaz then
            AtualizaDataFinal(qryupdate, FloatToStr(FIdPessoa), FloatToStr(FIdPessjur), FAuxiliar1{seqhistfunc},
                              Trim(FValorNaFundacao), FAuxiliar2{formato da data}, false)
         else
            AtualizaDataFinal(qryupdate, FloatToStr(FIdPessjur), FloatToStr(FIdPessjur), FAuxiliar1{seqhistfunc},
                              Trim(FValorNoInterface), FAuxiliar2{formato da data}, false);

      end
      else if(ceCodErro = ceEfDtIniCargoAlterado) then
      begin
         if bDesfaz then
            AtualizaDataInicial(qryupdate, FloatToStr(FIdPessoa), FloatToStr(FIdPessjur), FAuxiliar1{seqhistfunc},
                                Trim(FValorNaFundacao), FAuxiliar2{formato da data}, false, '') 
         else
            AtualizaDataInicial(qryupdate, FloatToStr(FIdPessjur), FloatToStr(FIdPessjur), FAuxiliar1{seqhistfunc},
                                Trim(FValorNoInterface), FAuxiliar2{formato da data}, false, ''); 

      end
      else if (ceCodErro = ceEfDtFimFuncaoAlterado) then
      begin
         if bDesfaz then
            AtualizaDataFinal(qryupdate, FloatToStr(FIdPessjur), FloatToStr(FIdPessjur), FAuxiliar1{seqhistfunc},
                              Trim(FValorNaFundacao), FAuxiliar2{formato da data}, false)
         else
            AtualizaDataFinal(qryupdate, FloatToStr(FIdPessjur), FloatToStr(FIdPessjur), FAuxiliar1{seqhistfunc},
                              Trim(FValorNoInterface), FAuxiliar2{formato da data}, false);
      end
      else if (ceCodErro = ceEfDtFimInsalubAlterado) then
      begin
         if bDesfaz then
            AtualizaDataFinal(qryupdate, FloatToStr(FIdPessjur), FloatToStr(FIdPessjur), FAuxiliar1{seqhistfunc},
                              Trim(FValorNaFundacao), FAuxiliar2{formato da data}, false)
         else
            AtualizaDataFinal(qryupdate, FloatToStr(FIdPessjur), FloatToStr(FIdPessjur), FAuxiliar1{seqhistfunc},
                              Trim(FValorNoInterface), FAuxiliar2{formato da data}, false);
      end
      else if (ceCodErro = ceEfPercInsalubAlterado) then
      begin
         if bDesfaz then
         begin
            qryUpdate.Close;
            qryUpdate.SQL.Clear;
            qryUpdate.SQL.Add(' UPDATE evolfuncprev SET PERCINSALUB = '+Trim(FValorNaFundacao)+' '+
                              ' WHERE  SEQHISTFUNC   = '''+FAuxiliar1+''' '+
                              ' AND    IDPESSOA  =  '''+FloatToStr(FIdPessoa)+''' '+
                              ' AND    IDPESSJUR =  '''+FloatToStr(FIdPessjur)+''' ');
            qryUpdate.ExecSQL;
         end
         else
         begin
            qryUpdate.Close;
            qryUpdate.SQL.Clear;
            qryUpdate.SQL.Add(' UPDATE evolfuncprev SET PERCINSALUB = '+Trim(FValorNoInterface)+' '+
                              ' WHERE  SEQHISTFUNC   = '''+FAuxiliar1+''' '+
                              ' AND    IDPESSOA  =  '''+FloatToStr(FIdPessoa)+''' '+
                              ' AND    IDPESSJUR =  '''+FloatToStr(FIdPessjur)+''' ');
            qryUpdate.ExecSQL;
         end;
      end
      else if (ceCodErro = ceEfDtFimPericulAlterado) then
      begin
         if bDesfaz then
            AtualizaDataFinal(qryupdate, FloatToStr(FIdPessjur), FloatToStr(FIdPessjur), FAuxiliar1{seqhistfunc},
                              Trim(FValorNaFundacao), FAuxiliar2{formato da data}, false)
         else
            AtualizaDataFinal(qryupdate, FloatToStr(FIdPessjur), FloatToStr(FIdPessjur), FAuxiliar1{seqhistfunc},
                              Trim(FValorNoInterface), FAuxiliar2{formato da data}, false);
      end
      else if (ceCodErro = ceEfDtFimAdNoturnoAlterado) then
      begin
         if bDesfaz then
            AtualizaDataFinal(qryupdate, FloatToStr(FIdPessjur), FloatToStr(FIdPessjur), FAuxiliar1{seqhistfunc},
                              Trim(FValorNaFundacao), FAuxiliar2{formato da data}, false)
         else
            AtualizaDataFinal(qryupdate, FloatToStr(FIdPessjur), FloatToStr(FIdPessjur), FAuxiliar1{seqhistfunc},
                              Trim(FValorNoInterface), FAuxiliar2{formato da data}, false);
      end
      else if (ceCodErro = ceEfPercAdNoturnoAlterado) then
      begin
         if bDesfaz then
         begin
            qryUpdate.Close;
            qryUpdate.SQL.Clear;
            qryUpdate.SQL.Add(' UPDATE evolfuncprev SET PERCADNOT = '+Trim(FValorNaFundacao)+', '+
                              ' QTDEMINUTOS = '+FAuxiliar2+' '+
                              ' WHERE  SEQHISTFUNC   = '''+FAuxiliar1+''' '+
                              ' AND    IDPESSOA  =  '''+FloatToStr(FIdPessoa)+''' '+
                              ' AND    IDPESSJUR =  '''+FloatToStr(FIdPessjur)+''' ');
            qryUpdate.ExecSQL;
         end
         else
         begin
            qryUpdate.Close;
            qryUpdate.SQL.Clear;
            qryUpdate.SQL.Add(' UPDATE evolfuncprev SET PERCADNOT = '+Trim(FValorNoInterface)+', '+
                              ' QTDEMINUTOS = '+FAuxiliar2+' '+
                              ' WHERE  SEQHISTFUNC   = '''+FAuxiliar1+''' '+
                              ' AND    IDPESSOA  =  '''+FloatToStr(FIdPessoa)+''' '+
                              ' AND    IDPESSJUR =  '''+FloatToStr(FIdPessjur)+''' ');
            qryUpdate.ExecSQL;
         end;
      end
      else if (ceCodErro = ceEfAdNoturnoInserido) then
      begin
         if bDesfaz then
         begin
            QryUpDate.close;
            QryUpDate.SQL.Text := ' DELETE evolfuncprev '+
                                  ' WHERE IDPESSOA     = ' + floattostr(FIdPessoa)+' AND '+
                                  ' IDPESSJUR = '+FloatToStr(FIdPessJur)+' AND '+
                                  ' SEQHISTFUNC = '+Trim(FValorNaFundacao)+' ';
            QryUpdate.ExecSQL;
         end
         else
         begin
            Insereevolfuncprev(qryaux, qryupdate,
                  floattostr(FIdPessoa),
                  floattostr(FIdPessjur),
                  'NULL',
                  'NULL', 'NULL',
                  'NULL', 'NULL',
                  'NULL', 'NULL',
                  'NULL', //percentual
                  FAuxiliar1,//modo
                  FAuxiliar2,//datainicio
                  'NULL',
                  'NULL' , Trim(FValorNoInterface),
                  FAuxiliar5,//qtdeminutos
                  sFormato//formato
                  ,sAux );
         end;
      end
      else if (ceCodErro = ceEfDtFimAtsAlterado) then
      begin
         if bDesfaz then
            AtualizaDataFinal(qryupdate, FloatToStr(FIdPessjur), FloatToStr(FIdPessjur), FAuxiliar1{seqhistfunc},
                              Trim(FValorNaFundacao), FAuxiliar2{formato da data}, false)
         else
            AtualizaDataFinal(qryupdate, FloatToStr(FIdPessjur), FloatToStr(FIdPessjur), FAuxiliar1{seqhistfunc},
                              Trim(FValorNoInterface), FAuxiliar2{formato da data}, false);
      end
      else if (ceCodErro = ceEfPercAtsAlterado) then
      begin
         if bDesfaz then
         begin
            qryUpdate.Close;
            qryUpdate.SQL.Clear;
            qryUpdate.SQL.Add(' UPDATE evolfuncprev SET PERCATS = '+Trim(FValorNaFundacao)+' '+
                              ' WHERE  SEQHISTFUNC   = '''+FAuxiliar1+''' '+
                              ' AND    IDPESSOA  =  '''+FloatToStr(FIdPessoa)+''' '+
                              ' AND    IDPESSJUR =  '''+FloatToStr(FIdPessjur)+''' ');
            qryUpdate.ExecSQL;
         end
         else
         begin
            qryUpdate.Close;
            qryUpdate.SQL.Clear;
            qryUpdate.SQL.Add(' UPDATE evolfuncprev SET PERCATS = '+Trim(FValorNoInterface)+' '+
                              ' WHERE  SEQHISTFUNC   = '''+FAuxiliar1+''' '+
                              ' AND    IDPESSOA  =  '''+FloatToStr(FIdPessoa)+''' '+
                              ' AND    IDPESSJUR =  '''+FloatToStr(FIdPessjur)+''' ');
            qryUpdate.ExecSQL;
         end;
      end
      else if (ceCodErro = ceEfDtFimACAlterado) then
      begin
         if bDesfaz then
            AtualizaDataFinal(qryupdate, FloatToStr(FIdPessjur), FloatToStr(FIdPessjur), FAuxiliar1{seqhistfunc},
                              Trim(FValorNaFundacao), FAuxiliar2{formato da data}, false)
         else
            AtualizaDataFinal(qryupdate,FloatToStr(FIdPessjur), FloatToStr(FIdPessjur), FAuxiliar1{seqhistfunc},
                              Trim(FValorNoInterface), FAuxiliar2{formato da data}, false);
      end
      else if (ceCodErro = ceEfPercACAlterado) then
      begin
         if bDesfaz then
         begin
            qryUpdate.Close;
            qryUpdate.SQL.Clear;
            qryUpdate.SQL.Add(' UPDATE evolfuncprev SET PERC1AC = '+Trim(FValorNaFundacao)+' '+
                              ' WHERE  SEQHISTFUNC   = '''+FAuxiliar1+''' '+
                              ' AND    IDPESSOA  =  '''+FloatToStr(FIdPessoa)+''' '+
                              ' AND    IDPESSJUR =  '''+FloatToStr(FIdPessjur)+''' ');
            qryUpdate.ExecSQL;
         end
         else
         begin
            qryUpdate.Close;
            qryUpdate.SQL.Clear;
            qryUpdate.SQL.Add(' UPDATE evolfuncprev SET PERC1AC = '+Trim(FValorNoInterface)+' '+
                              ' WHERE  SEQHISTFUNC   = '''+FAuxiliar1+''' '+
                              ' AND    IDPESSOA  =  '''+FloatToStr(FIdPessoa)+''' '+
                              ' AND    IDPESSJUR =  '''+FloatToStr(FIdPessjur)+''' ');
            qryUpdate.ExecSQL;
         end;
      end
      else if (ceCodErro = ceEvSituacaoAlterado) then
      begin

         if bDesfaz then
         begin
            QryUpdate.close;
            QryUpdate.sql.text := ' UPDATE PARTPREVPLAN SET IDSITPART = '''+Trim(FValorNaFundacao)+''' '+
                               ' WHERE IDPESSJUR = '''+FloatToStr(FIdPessjur)+''' AND '+
                               ' IDPESSOA = '''+FloatToStr(FIdPessoa)+''' AND '+
                               ' IDSITPART = '''+Trim(FValorNoInterface)+''' ';
            QryUpdate.ExecSQL;
         end
         else
         begin
            QryUpdate.close;
            QryUpdate.sql.text := ' UPDATE PARTPREVPLAN SET IDSITPART = '''+Trim(FValorNoInterface)+''' '+
                               ' WHERE IDPESSJUR = '''+FloatToStr(FIdPessjur)+''' AND '+
                               ' IDPESSOA = '''+FloatToStr(FIdPessoa)+''' AND '+
                               ' IDSITPART = '''+Trim(FValorNaFundacao)+''' ';
            QryUpdate.ExecSQL;
         end;
      end
      else if (ceCodErro = ceEvEventoInserido) then
      begin
        //o desfazer e fazer dos eventos ficará a cargo das próprias telas de evento
        //, caso este não tenha sido registrado pela importação
      end
      else if (ceCodErro = ceValorBase1Alterado) then
      begin {alterar valorbase1}
         sSqlUpDate := 'UpDate ElegPatro set valorbase1 = ';

         if bDesfaz then
         begin
            //se o valor anterior era nulo, não tenta transformar
            if Trim(FValorNaFundacao) = ''
            then sSqlUpDate := sSqlUpDate +' NULL '
            else sSqlUpDate := sSqlUpDate +' '''+Trim(FValorNaFundacao)+'''  ';
         end
         else sSqlUpDate := sSqlUpDate +'  '''+Trim(FValorNoInterface)+''' ';

         sSqlUpdate := sSqlUpDate + ' where idpessoa = '+floattostr(Fidpessoa);
         sSqlUpDate := sSqlUpDate + ' and idpessjur = '+floattostr(FIdPessjur);
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceValorBase2Alterado) then
      begin {alterar valorbase2}
         sSqlUpDate := 'UpDate ElegPatro set valorbase2 = ';

         if bDesfaz then
         begin
            //se o valor anterior era nulo, não tenta transformar
            if Trim(FValorNaFundacao) = ''
            then sSqlUpDate := sSqlUpDate +' NULL '
            else sSqlUpDate := sSqlUpDate +' '''+Trim(FValorNaFundacao)+'''  ';
         end
         else sSqlUpDate := sSqlUpDate +'  '''+Trim(FValorNoInterface)+''' ';

         sSqlUpdate := sSqlUpDate + ' where idpessoa = '+floattostr(Fidpessoa);
         sSqlUpDate := sSqlUpDate + ' and idpessjur = '+floattostr(FIdPessjur);
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceValorBase3Alterado) then
      begin {alterar valorbase3}
         sSqlUpDate := 'UpDate ElegPatro set valorbase3 = ';

         if bDesfaz then
         begin
            //se o valor anterior era nulo, não tenta transformar
            if Trim(FValorNaFundacao) = ''
            then sSqlUpDate := sSqlUpDate +' NULL '
            else sSqlUpDate := sSqlUpDate +' '''+Trim(FValorNaFundacao)+'''  ';
         end
         else sSqlUpDate := sSqlUpDate +'  '''+Trim(FValorNoInterface)+''' ';

         sSqlUpdate := sSqlUpDate + ' where idpessoa = '+floattostr(Fidpessoa);
         sSqlUpDate := sSqlUpDate + ' and idpessjur = '+floattostr(FIdPessjur);
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceValorBase4Alterado) then
      begin {alterar vaorbase4}
         sSqlUpDate := 'UpDate ElegPatro set valorbase4 = ';

         if bDesfaz then
         begin
            //se o valor anterior era nulo, não tenta transformar
            if Trim(FValorNaFundacao) = ''
            then sSqlUpDate := sSqlUpDate +' NULL '
            else sSqlUpDate := sSqlUpDate +' '''+Trim(FValorNaFundacao)+'''  ';
         end
         else sSqlUpDate := sSqlUpDate +'  '''+Trim(FValorNoInterface)+''' ';

         sSqlUpdate := sSqlUpDate + ' where idpessoa = '+floattostr(Fidpessoa);
         sSqlUpDate := sSqlUpDate + ' and idpessjur = '+floattostr(FIdPessjur);
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceValorBase5Alterado) then
      begin {alterar vaorbase5}
         sSqlUpDate := 'UpDate ElegPatro set valorbase5 = ';

         if bDesfaz then
         begin
            //se o valor anterior era nulo, não tenta transformar
            if Trim(FValorNaFundacao) = ''
            then sSqlUpDate := sSqlUpDate +' NULL '
            else sSqlUpDate := sSqlUpDate +' '''+Trim(FValorNaFundacao)+'''  ';
         end
         else sSqlUpDate := sSqlUpDate +'  '''+Trim(FValorNoInterface)+''' ';

         sSqlUpdate := sSqlUpDate + ' where idpessoa = '+floattostr(Fidpessoa);
         sSqlUpDate := sSqlUpDate + ' and idpessjur = '+floattostr(FIdPessjur);
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceValorBase6Alterado) then
      begin {alterar vaorbase6}
         sSqlUpDate := 'UpDate ElegPatro set valorbase6 = ';

         if bDesfaz then
         begin
            //se o valor anterior era nulo, não tenta transformar
            if Trim(FValorNaFundacao) = ''
            then sSqlUpDate := sSqlUpDate +' NULL '
            else sSqlUpDate := sSqlUpDate +' '''+Trim(FValorNaFundacao)+'''  ';
         end
         else sSqlUpDate := sSqlUpDate +'  '''+Trim(FValorNoInterface)+''' ';

         sSqlUpdate := sSqlUpDate + ' where idpessoa = '+floattostr(Fidpessoa);
         sSqlUpDate := sSqlUpDate + ' and idpessjur = '+floattostr(FIdPessjur);
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceRubDescAlterado) then
      begin

          if bDesfaz then
          sAux := Trim(FValorNaFundacao)
          else sAux := Trim(FValorNoInterface);

          sSqlUpdate := '';
          sSqlUpDate := 'UpDate RUBRICAXPESS set DESCRPROVDESC = '''+sAux+'''';
          sSqlUpdate := sSqlUpDate + ' where IDRUBRICA = '+''''+FAuxiliar1+'''';
          sSqlUpDate := sSqlUpDate + ' and idpessoa = '+floattostr(FIdPessjur);
          QryUpDate.SQL.Text := sSqlUpdate;
          QryUpdate.ExecSQL;


          sSqlUpdate := '';
          sSqlUpDate := 'UpDate PROVDESC set DESCRICAO = '''+sAux+''' ';
          sSqlUpdate := sSqlUpDate + ' where IDPROVENTO = '''+FAuxiliar1+''' ';
          QryUpDate.SQL.Text := sSqlUpdate;
          QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceRubTipoAlterado) then
      begin
          if bDesfaz then
          sAux := Trim(FValorNaFundacao)
          else sAux := Trim(FValorNoInterface);

          sSqlUpdate := '';
          sSqlUpDate := 'UpDate PROVDESC set FLGDESCONTO = '''+sAux+''' ';
          sSqlUpdate := sSqlUpDate + ' where IDPROVENTO = '''+FAuxiliar1+''' ';
          QryUpDate.SQL.Text := sSqlUpdate;
          QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceRubFlgAtrasoAlterado) then
      begin
          if bDesfaz then
          sAux := Trim(FValorNaFundacao)
          else sAux := Trim(FValorNoInterface);

          sSqlUpdate := '';
          sSqlUpDate := 'UpDate PROVDESC set FLGATRASODEVOL = '''+sAux+''' ';
          sSqlUpdate := sSqlUpDate + ' where IDPROVENTO = '''+FAuxiliar1+''' ';
          QryUpDate.SQL.Text := sSqlUpdate;
          QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceRubInserido) then
      begin

         if bDesfaz then
         begin
            sSqlUpdate := '';
            sSqlUpDate := 'delete RUBRICAXPESS  where IDRUBRICA = '+''''+FAuxiliar1+'''';
            sSqlUpDate := sSqlUpDate + ' and idpessoa = '+floattostr(FIdPessjur);
            QryUpDate.SQL.Text := sSqlUpdate;
            QryUpdate.ExecSQL;


            sSqlUpdate := '';
            sSqlUpDate := 'delete PROVDESC  where IDPROVENTO = '''+FAuxiliar1+''' ';
            QryUpDate.SQL.Text := sSqlUpdate;
            QryUpdate.ExecSQL;
         end
         else
         begin
            sSqlUpdate := '';
            idprovento := LeUltRegistro(nil,'PROVDESC ');
            sSqlUpdate := sSqlUpDate + 'INSERT INTO PROVDESC (IDPROVENTO,FLGDESCONTO,DESCRICAO, FLGATRASODEVOL ,FLGTPRUBRICA) VALUES (';
            sSqlUpdate := sSqlUpdate + inttostr(idprovento) + ', '''+FAuxiliar2+''' ,';
            sSqlUpdate := sSqlUpdate + ''''+FValorNoInterface+''','''+FAuxiliar3+''', ''P'')';
            QryUpDate.SQL.Text := sSqlUpdate;
            QryUpdate.ExecSQL;

            sSqlUpdate := '';
            sSqlUpdate := sSqlUpDate + 'INSERT INTO RUBRICAXPESS (IDPESSOA,IDRUBRICA,CODPROVDESC,DESCRPROVDESC) VALUES (';
            sSqlUpdate := sSqlUpdate + floattostr(FIdPessjur) + ',' + inttostr(idprovento) + ','+ ''''+FAuxiliar4+',' ;
            sSqlUpdate := sSqlUpdate + ''''+FValorNoInterface+ '''' +')';
            QryUpDate.SQL.Text := sSqlUpdate;
            QryUpdate.ExecSQL;

            AtualizaAuxiliar1(QryUpDate, FIdPessjur, FSeqCritica,
                              FIdPessoa, FMesCobranca , inttostr(idprovento) );

         end;
      end
      else if (ceCodErro = ceLocalInserido) then
      begin

         if bDesfaz then
         begin
            QryUpdate.close;
            QryUpdate.SQL.text := ' DELETE FILIALPESSOA WHERE IDFILIALPESSOA = '''+FAuxiliar1+''' ';
            QryUpdate.execsql;

            QryUpdate.close;
            QryUpdate.SQL.text := ' DELETE DOCPESSOA WHERE IDPESSOA = '''+FAuxiliar1+''' ';
            QryUpdate.execsql;

            QryUpdate.close;
            QryUpdate.SQL.text := ' DELETE PESSOA WHERE IDPESSOA = '''+FAuxiliar1+''' ';
            QryUpdate.execsql;
         end
         else
         begin
            QryUpdate.close;
            QryUpdate.sql.text := ' SELECT SEQPESSOA.NEXTVAL ID FROM DUAL';
            QryUpdate.Open;
            sIdPessoa := QryUpdate.fieldbyname('ID').AsString;

            //INSERE PESSOA
            QryUpdate.close;
            QryUpdate.SQL.text := ' INSERT INTO PESSOA(IDPESSOA , NOME ,TIPO, RAZAOSOCIAL, NUMDOCUMENTO) '+
                               ' SELECT '+sIdpessoa+','+QuotedStr(FValorNoInterface)+', ''J'', '+
                               ' '+QuotedStr(FAuxiliar5)+', '+
                               ' '''+FAuxiliar4+''' '+
                               ' FROM DUAL';
            try QryUpdate.execsql; except end;

            //INSERE DOCPESSOA
            QryUpdate.close;
            QryUpdate.SQL.text := ' INSERT INTO DOCPESSOA(IDDOCUMENTO, IDPESSOA , NUMDOCUMENTO) '+
                               ' SELECT  1, '+sIdpessoa+', '''+FAuxiliar4+''' '+
                               ' FROM DUAL';

            QryUpdate.execsql;


            //INSERE FILIAL
            QryUpdate.close;
            QryUpdate.SQL.text := ' INSERT INTO FILIALPESSOA(IDFILIALPESSOA , NUMFILIAL,  FLGTIPO,  SIGLA, FLGATIVO ) '+
                               ' SELECT '+sIdpessoa+','''+FAuxiliar5+''', '+
                               ' '''+FAuxiliar2+''', '+
                               ' '''+FAuxiliar3+''', ''S'' '+
                               ' FROM DUAL';
            QryUpdate.execsql;


            AtualizaAuxiliar1(QryUpDate, FIdPessjur, FSeqCritica,
                              FIdPessoa, FMesCobranca , sIdpessoa );

         end;

      end
      else if (ceCodErro = ceLocalCGCAlterado) then
      begin

          if bDesfaz then
          sAux := Trim(FValorNaFundacao)
          else sAux := Trim(FValorNoInterface);

          sSqlUpDate := 'UPDATE DOCPESSOA SET NUMDOCUMENTO =  '''+sAux+''' ';
          sSqlUpdate := sSqlUpDate + 'WHERE IDDOCUMENTO = 1 AND IDPESSOA = '''+FAuxiliar1+''' ';
          QryUpDate.SQL.Text := sSqlUpdate;
          QryUpdate.ExecSQL;

      end
      else if (ceCodErro = ceLocalNomeAlterado) then
      begin
          if bDesfaz then
          sAux := Trim(FValorNaFundacao)
          else sAux := Trim(FValorNoInterface);

          sSqlUpDate := 'UPDATE PESSOA SET NOME =  '''+sAux+''' ';
          sSqlUpdate := sSqlUpDate + 'WHERE  IDPESSOA = '''+FAuxiliar1+''' ';
          QryUpDate.SQL.Text := sSqlUpdate;
          QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceEmailAlterado) then
      begin
          if bDesfaz then
          sAux := Trim(FValorNaFundacao)
          else sAux := Trim(FValorNoInterface);

          sSqlUpDate := 'UPDATE PESSOA SET EMAIL =  '''+sAux+''' ';
          sSqlUpdate := sSqlUpDate + 'WHERE  IDPESSOA = '''+FAuxiliar1+''' ';
          QryUpDate.SQL.Text := sSqlUpdate;
          QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceLocalTipoAlterado) then
      begin
          if bDesfaz then
          sAux := Trim(FValorNaFundacao)
          else sAux := Trim(FValorNoInterface);

          sSqlUpDate := 'UPDATE FILIALPESSOA SET FLGTIPO =  '''+sAux+''' ';
          sSqlUpdate := sSqlUpDate + 'WHERE  IDFILIALPESSOA = '''+FAuxiliar1+''' ';
          QryUpDate.SQL.Text := sSqlUpdate;
          QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceLocalAtivAlterado) then
      begin
          if bDesfaz then
          sAux := Trim(FValorNaFundacao)
          else sAux := Trim(FValorNoInterface);

          sSqlUpDate := 'UPDATE FILIALPESSOA SET FLGATIVO =  '''+sAux+''' ';
          sSqlUpdate := sSqlUpDate + 'WHERE  IDFILIALPESSOA = '''+FAuxiliar1+''' ';
          QryUpDate.SQL.Text := sSqlUpdate;
          QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceLocalSiglaAlterado) then
      begin
          if bDesfaz then
          sAux := Trim(FValorNaFundacao)
          else sAux := Trim(FValorNoInterface);

          sSqlUpDate := 'UPDATE FILIALPESSOA SET SIGLA =  '''+sAux+''' ';
          sSqlUpdate := sSqlUpDate + 'WHERE  IDFILIALPESSOA = '''+FAuxiliar1+''' ';
          QryUpDate.SQL.Text := sSqlUpdate;
          QryUpdate.ExecSQL;
      end
      else if (ceCodErro = ceAgNomeAlterado) then
      begin

         if bDesfaz then
         sAux := Trim(FValorNaFundacao)
         else sAux := Trim(FValorNoInterface);

         sSqlUpDate := 'UpDate PESSOA set NOME  = '''+sAux+'''';
         sSqlUpdate := sSqlUpDate + ' where IDPESSOA = '''+FAuxiliar1+''' ';
         sSqlUpdate := sSqlUpDate + ' and FLGAGENCIA = 1';
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;

      end
      else if (ceCodErro = ceAgInserido) then
      begin
         if bDesfaz then
         begin
             sSqlUpDate := ' DELETE AGENCIABANCARIA WHERE IDPESSOA = '''+FAuxiliar1+''' ';
             QryUpDate.SQL.Text := sSqlUpdate;
             QryUpdate.ExecSQL;

             sSqlUpDate := ' DELETE PESSOA WHERE IDPESSOA = '''+FAuxiliar1+''' ';
             QryUpDate.SQL.Text := sSqlUpdate;
             QryUpdate.ExecSQL;
         end
         else
         begin
             idagencia := LeUltRegistro(nil,'PESSOA ');

             sSqlUpDate := 'INSERT INTO PESSOA (IDPESSOA,NOME,FLGAGENCIA) VALUES (';
             sSqlUpdate := sSqlUpDate + INTTOSTR(idagencia) + ',';
             sSqlUpdate := sSqlUpDate + ''+QuotedStr(FValorNoInterface)+' '+',';
             sSqlUpdate := sSqlUpDate + inttostr(1) + ')';
             QryUpDate.SQL.Text := sSqlUpdate;
             try QryUpdate.ExecSQL; except end;

             //
             sSqlUpDate := 'INSERT INTO AGENCIABANCARIA (IDPESSOA,IDBANCO,NUMAGENCIA) VALUES (';
             sSqlUpDate := sSqlUpDate + INTTOSTR(idagencia) + ',';
             sSqlUpDate := sSqlUpDate + ' '''+FAuxiliar2+''',';
             sSqlUpDate := sSqlUpDate + ' '''+FAuxiliar3+''' ' +')';
             QryUpDate.SQL.Text := sSqlUpdate;
             QryUpdate.ExecSQL;

             AtualizaAuxiliar1(QryUpDate, FIdPessjur, FSeqCritica,
                               FIdPessoa, FMesCobranca , inttostr(idagencia) );

         end;
      end
      else if (ceCodErro = ceElegivelInserido) then
      begin
         if bDesfaz     then
         begin

            sSqlUpdate := sSqlUpDate + ' delete elegpatro ';
            sSqlUpdate := sSqlUpDate + ' where idpessoa = '+floattostr(Fidpessoa);
            sSqlUpDate := sSqlUpDate + ' and idpessjur = '+floattostr(FIdPessjur);
            QryUpDate.SQL.Text := sSqlUpdate;
            QryUpdate.ExecSQL;

            sSqlUpdate := sSqlUpDate + ' delete pessoafisica ';
            sSqlUpdate := sSqlUpDate + ' where idpessoa = '+floattostr(Fidpessoa);
            QryUpDate.SQL.Text := sSqlUpdate;
            QryUpdate.ExecSQL;

            sSqlUpdate := sSqlUpDate + ' delete docpessoa ';
            sSqlUpdate := sSqlUpDate + ' where idpessoa = '+floattostr(Fidpessoa);
            QryUpDate.SQL.Text := sSqlUpdate;
            QryUpdate.ExecSQL;

            sSqlUpdate := sSqlUpDate + ' delete pessoa ';
            sSqlUpdate := sSqlUpDate + ' where idpessoa = '+floattostr(Fidpessoa);
            QryUpDate.SQL.Text := sSqlUpdate;
            QryUpdate.ExecSQL;
         end;
      end
      else if (ceCodErro = ceDtInicioCargo) then
      begin { sem tratamento } end
      else if (ceCodErro = ceDtInicioFuncao) then
      begin { sem tratamento } end;

   except
      Exit;
   end;

   Result := True;

end;



function Insereevolfuncprev(qryaux, qryupdate : Twwquery ;
                            sIdpessoa, sIdPessjur, sIdCargoExt,
                            sIdFuncao, sPerc1ac, sPerc2ac, sPercats, sPercinsalub,
                            sPercPericul, sPercFuncao, sModoFuncao, sDataInicio, sDataFinal,
                            sOrigem , sPercAdnot, sQtdeMinutos, sFormato : String;
                            var sSeqHistFunc : String) : Boolean;
begin
   result := false;

   qryaux.close;
   qryaux.sql.Text := ' SELECT NVL(MAX(SEQHISTFUNC),0) + 1 AS NUM '+
                      ' FROM evolfuncprev '+
                      ' WHERE IDPESSJUR = '''+sIdPessjur+''' AND '+
                      ' IDPESSOA = '''+sIdpessoa+''' ';
   qryaux.open;

   sSeqHistFunc := qryaux.fieldbyname('NUM').AsString;

   if trim(sQtdeminutos) = '' then sQtdeminutos := 'NULL';
   if trim(sPerc1ac) = '' then sPerc1ac := 'NULL';
   if trim(sPerc2ac) = '' then sPerc2ac := 'NULL';
   if trim(sPercats) = '' then sPercats := 'NULL';
   if trim(sPercinsalub) = '' then sPercinsalub := 'NULL';
   if trim(sPercpericul) = '' then sPercpericul := 'NULL';
   if trim(sPercfuncao) = '' then sPercfuncao := 'NULL';
   if trim(sPercadnot) = '' then sPercadnot := 'NULL';


   try
      qryUpdate.Close;
      qryUpdate.SQL.Clear;
      qryUpdate.SQL.Add('  DELETE EVOLFUNCPREV '+
                        '  WHERE IDPESSOA = '''+trim(sIdPessoa)+''' '+
                        '  AND IDPESSJUR = '''+sIdPessjur+''' ');

                        if trim(sIdCargoExt) <> 'NULL' then
                          qryUpdate.SQL.Add(' AND IDCARGOEXT = '+sIdCargoExt)
                        else
                          qryUpdate.SQL.Add(' AND DATAINICIO = TO_DATE('''+sDataInicio+''','''+sFormato+''') ');

                        if (trim(sIdFuncao) <> 'NULL') and (sPercfuncao <> 'NULL') and (sPercfuncao <> '0') then
                          qryUpdate.SQL.Add(' AND IDFUNCAO = '+sIdFuncao+'  AND NVL(PERCFUNCAO,0) > 0 ');

                        if (trim(sIdFuncao) <> 'NULL') and (sPerc1ac <> 'NULL') and (sPerc1ac <> '0') then
                          qryUpdate.SQL.Add(' AND IDFUNCAO = '+sIdFuncao+'  AND NVL(PERC1AC,0) > 0 ');

                        if (trim(sIdFuncao) <> 'NULL') and (sPerc2ac <> 'NULL') and (sPerc2ac <> '0') then
                          qryUpdate.SQL.Add(' AND IDFUNCAO = '+sIdFuncao+'  AND NVL(PERC2AC,0) > 0 ');

                        If Trim(sModoFuncao) <> '' Then
                          qryUpdate.SQL.Add(' AND MODOFUNCAO = '+QuotedStr(sModoFuncao));

                        if (trim(sPercats) <> 'NULL') and (sPercats <> '0') then
                        qryUpdate.SQL.Add(' AND NVL(PERCATS,0) > 0 ');

                        if (trim(sPercpericul) <> 'NULL') and (sPercpericul <> '0') then
                        qryUpdate.SQL.Add(' AND NVL(PERCPERICUL,0) > 0 ');

                        if (trim(sPercadnot) <> 'NULL') and (sPercadnot <> '0') then
                        qryUpdate.SQL.Add(' AND NVL(PERCADNOT,0) > 0 ');

      qryUpdate.ExecSQL;
   except
      exit;
   end;



   try
      qryUpdate.Close;
      qryUpdate.SQL.Clear;
      qryUpdate.SQL.Add(' INSERT INTO evolfuncprev(IDPESSOA,IDPESSJUR, SEQHISTFUNC, '+
                        '  IDCARGOEXT, IDFUNCAO, PERC1AC, PERC2AC, '+
                        '  PERCATS, PERCINSALUB, PERCPERICUL, PERCFUNCAO, '+
                        '  MODOFUNCAO, DATAINICIO, DATAFINAL,  '+
                        '  PERCADNOT, QTDEMINUTOS, IDPESSJURFG, IDPESSJURCG, FLGSITPART, ORIGEM) '+
                        '  VALUES '+
                        '  ('''+trim(sIdPessoa)+''', '+ //IDPESSOA
                        '  '''+sIdPessjur+''', '+ //IDPESSJUR
                        '  '''+qryaux.fieldbyname('NUM').AsString+''', '+ //SEQHISTFUNC
                        '  '+sIdCargoExt+', '+ //CARGOEXT
                        '  '+sIdFuncao+', '+ //FUNCAO
                        '  '+sPerc1ac+', '+ //PERC1AC
                        '  '+sPerc2ac+', '+ //PERC2AC
                        '  '+sPercats+', '+ //PERCATS
                        '  '+sPercinsalub+', '+ //PERCINSALUB
                        '  '+sPercpericul+', '+ //PERCPERICUL
                        '  '+sPercfuncao+', '+ //PERCFUNCAO
                        '  '''+sModoFuncao+''', '+ //MODOFUNCAO
                        '  TO_DATE('''+sDataInicio+''','''+sFormato+'''), '+ //DATAINICIO
                        '  TO_DATE('''+sDataFinal+''','''+sFormato+'''), '+ //DATAFINAL
                        '  '+sPercadnot+', '+ //PERCADNOT
                        '  '+sQtdeminutos+', '''+sIdPessjur+''', '''+sIdPessjur+''', ''AT'', ''I'' )'); //QTDEMINUTOS
      qryUpdate.ExecSQL;
   except
      exit;
   end;



   result := true;
end;

function AtualizaDataFinal(qryupdate : Twwquery ;
                           sIdPessoa, sIdPessjur, sSeqHistFunc,
                           sData, sFormato : String;
                           bMenosUmDia : Boolean) : Boolean;
var sAux : String;
begin
   sAux := '';
   if bMenosUmDia then sAux := '-1';

   try
      qryUpdate.Close;
      qryUpdate.SQL.Clear;
      qryUpdate.SQL.Add(' UPDATE evolfuncprev SET DATAFINAL = TO_DATE('''+sData+''','''+sFormato+''') '+sAux+' '+
                        ' WHERE  SEQHISTFUNC   = '''+sSeqHistFunc+''' '+
                        ' AND    IDPESSOA  =  '''+sIdPessoa+''' '+
                        ' AND    IDPESSJUR =  '''+sIdPessjur+''' ');
      qryUpdate.ExecSQL;

   except
      result := false;
      exit;
   end;

   result := true;
end;

function AtualizaDataInicial(qryupdate : Twwquery ;
                             sIdPessoa, sIdPessjur, sSeqHistFunc,
                             sData, sFormato : String;
                             bMenosUmDia : Boolean;
                             sModoFunc : String) : Boolean;
var sAux : String;
begin
   sAux := '';

   If bMenosUmDia
    Then sAux := '-1';

   Try
      qryUpdate.Close;
      qryUpdate.SQL.Clear;
      qryUpdate.SQL.Add(' UPDATE EVOLFUNCPREV '+#13+
                        ' SET DATAINICIO = TO_DATE('''+sData+''','''+sFormato+''') '+sAux+' '+#13+
                        ' WHERE  SEQHISTFUNC   = '''+sSeqHistFunc+''' '+#13+
                        ' AND    IDPESSOA  =  '''+sIdPessoa+''' '+#13+
                        ' AND    IDPESSJUR =  '''+sIdPessjur+''' ');

      if sModoFunc <> '' Then
        qryUpdate.SQL.Add(' AND MODOFUNCAO = '''+sModoFunc+''' ');

      qryUpdate.ExecSQL;
   Except
      result := false;
      exit;
   End;

   result := true;
end;

function InsereDependente(qryupdate : Twwquery ;
                          sIdPessoa, sMatricula, sNome, sFlgInvalid,
                          sDatanasc, sSexo, sEstCivil, sTpRelDpd,
                          sSeqDep, sFlgContaIr, sFlgContaSf, sDataInicio : String;
                          var sIdPessoaDepen : String ) : boolean;
var sSQL : string;
    iIdPessoa, iIdTitular : longint;
begin
   Result := False;

   iIdPessoa := LeUltRegistro(nil, 'PESSOA');
   sIdPessoaDepen := IntToStr(iIdPessoa);

   if trim(sIdPessoa) = '' then
   begin
      with qryUpdate do
      begin
         Close;
         SQL.Clear;
         SQL.Add('SELECT IDPESSOA FROM ELEGPATRO WHERE MATRICULA LIKE ''%'+sMatricula+'%''');
         try
            Open;
         except
            Exit;
         end;

         if IsEmpty then Exit;

         iIdTitular := FieldByName('IDPESSOA').AsInteger;
      end;
   end
   else  iIdTitular := StrToInt(sIdPessoa);


   // Inserir PESSOA
   sSQL := ' INSERT INTO PESSOA (IDPESSOA, FLGINVALIDO, NOME) '+
           ' VALUES ('+IntToStr(iIdPessoa)+','''+sFlgInvalid+''', '+QuotedStr(sNome)+' ) ';
   with qryUpdate do
   begin
      Close;
      SQL.Clear;
      SQL.Add(sSQL);
      try
         ExecSQL;
      except
         Exit;
      end;
   end;


   if (Trim(sDataNasc) = '') or
      (Trim(sSexo) = '')
   then Exit;


   sSQL := ' INSERT INTO PESSOAFISICA (IDPESSOA, DATANASC, SEXO, ESTCIVIL) '+
           ' VALUES ('+IntToStr(iIdPessoa)+',';

   sSQL := sSQL + ' TO_DATE('''+sDataNasc+''', ''DD/MM/YYYY''), ';
   sSQL := sSQL + ''''+sSexo+''', ';

   if Trim(sEstCivil) = ''
   then sSQL := sSQL +' NULL '
   else sSQL := sSQL +''''+sEstCivil+'''';

   sSQL := sSQL +')';

   with qryUpdate do
   begin
      Close;
      SQL.Clear;
      SQL.Add(sSQL);
      try
         ExecSQL;
      except
         Exit;
      end;
   end;



   // INSERIR DEPENDENTE
   sSQL := ' INSERT INTO DEPENDENTE (IDPESSOA) '+
           ' VALUES ( '+IntToStr(iIdPessoa)+')';

   with qryUpdate do
   begin
      Close;
      SQL.Clear;
      SQL.Add(sSQL);
      try
         ExecSQL;
      except
         Exit;
      end;
   end;



   // INSERIR DEPENTIT
   sSQL := ' INSERT INTO DEPENTIT                                                 '+
           ' (IDTITULAR,        IDPESSOA,         IDDEPENDENCIA,  NUMSEQUENCIA,   '+
           '  FLGCONTAIMPOSTOR, FLGCONTASALARIOF, FLGBENEFICIARIO,                '+
           '  DATACADASTRO,    FLGDESIGNADO,                                     '+
           '  FLGDEPLEGAL,      MATRICULA,                      '+
           '  INICIOIMPOSTOR,   FIMIMPOSTOR,      INICIOSALARIOF, FIMSALARIOF)    '+
           ' VALUES ( '+IntToStr(iIdTitular)+','+
                        IntToStr(iIdPessoa)+',';
   if Trim(sTpRelDpd) = ''
   then sSQL := sSQL + '''OUT'', '
   else sSQL := sSQL + ''''+sTpRelDpd+''', ';

   sSQL := sSQL + sSeqDep+', ';
   sSQL := sSQL +sFlgContaIr+', ';
   sSQL := sSQL +sFlgContaSf+', ';
   sSQL := sSQL + '0, ';

   if Trim(sDataInicio) = ''
   then sSQL := sSQL + ' NULL, '
   else sSQL := sSQL + ' TO_DATE('''+sDataInicio+''', ''DD/MM/YYYY''), ';;

   sSQL := sSQL + '0, ';
   sSQL := sSQL + '1, ';

   //sSQL := sSQL + ''''+sMatricula+''', '; //leoprovisorio
   sSQL := sSQL + ' NULL, ';

   sSQL := sSQL + ' NULL, ';
   sSQL := sSQL + ' NULL, ';
   sSQL := sSQL + ' NULL, ';
   sSQL := sSQL + ' NULL  ';

   sSQL := sSQL + ' ) ';

   with qryUpdate do
   begin
      Close;
      SQL.Clear;
      SQL.Add(sSQL);
      try
         ExecSQL;
      except
         Exit;
      end;
   end;

   Result := True;
end;



end.

