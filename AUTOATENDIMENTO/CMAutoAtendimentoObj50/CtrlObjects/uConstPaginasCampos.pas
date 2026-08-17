{
--------------------------------------------------------------------------------
Pendência   : SOL 150881 KINTANA 1099543
Responsável : BRUNO AZEVEDO
Data        : 17/01/2011
Descrição   : Trazer a funcionalidade de publicações para a tela de consulta.
--------------------------------------------------------------------------------
Pendência   : SOL 140492 KINTANA 881593
Responsável : Ádler Souza
Data        : 31/08/2010
Descrição   : Inserir o valor do fundo garantidor abaixo da prestação.
--------------------------------------------------------------------------------
Pendência   : SOL 141367 KINTANA 894033
Responsável : BRUNO AZEVEDO
Data        : 31/08/2010
Descrição   : Implementação da verificação de dependentes válidos.
--------------------------------------------------------------------------------
Pendência   : SOL 91655 KINTANA 394002
Responsável : BRUNO AZEVEDO
Data        : 06/07/2010
Descrição   : Criação da manutenção dos dados cadastrais (E-mail, telefone e endereço).
--------------------------------------------------------------------------------
}
unit uConstPaginasCampos;

interface

uses uCmClientDataSet;

const

//Tipos de Usuários
  QtdeTiposUsuarios  = 4;
  
  uParticipante      = 1;
  uDependente        = 2;
  uBeneficiario      = 3;
  uElegivel          = 4;
  

  //----- Códigos das Páginas -----
  //Último utilizado: 95 - 21/09/2006

  //Seleção de Tipo de Contrato
  pEmpSelecaoTpContrato         =  01;

  //Parâmetros de Simulação de Empréstimos
  pEmpParamSimulacao            =  02;

  //Resultados da Simulação de Empréstimos
  pEmpParcelas                  =  03;

  //Consulta Contrato de Empréstimo (detalhes)
  pEmpDadosContrato             =  04;

  //Aviso de Simulação de Transferência de Plano Desabilitada
  pTrPlAvisoSimDes              =  05;

  //Confirmação de Inclusão de Endereço
  pEndConfInclusao              =  06;

  //Confirmação de Alteração de Endereço
  pEndConfAlteracao             =  07;

  //Confirmação de Exclusão de Endereço
  pEndConfExclusao              =  08;

  //Confirmação de Inclusão de Dependente
  pDepConfInclusao              =  09;

  //Confirmação de Alteração de Dependente
  pDepConfAlteracao             =  10;

  //Confirmação de Exclusão de Dependente
  pDepConfExclusao              =  11;

  //Inclusão de Endereço
  pEndInclusao                  =  12;

  //Alteração de Endereço
  pEndAlteracao                 =  13;

  //Exclusão de Endereço
  pEndExclusao                  =  14;

  //Inclusão de Dependente
  pDepInclusao                  =  15;

  //Alteração de Dependente
  pDepAlteracao                 =  16;

  //Exclusão de Dependente
  pDepExclusao                  =  17;

  //Confirmação de Alteração de Senha
  pConfSenha                    =  18;

  //Logout
  pLogout                       =  19;

  //Home
  pHome                         =  20;

  //Opção de Transferência de Plano Selecionada
  pTpOpcaoSelecionada           =  21;

  //Confirmação de Opção de Transferência de Plano
  pTpConfirmacaoOpcao           =  22;

  //Estimativas de Opção de Transferência de Plano
  pTpEstimativasTransacao       =  23;

  //Dados para Cálculo de Estimativas de Opção de Transferência de Plano
  pTpDadosEstimativas           =  24;

  //Opções de Transferência de Plano
  pTpOpcoesTransacao            =  25;

  //Dados para Cálculo de Opções de Transferência de Plano
  pTpDadosOpcoesTransacao       =  26;

  //Seleção de Plano para Transferência de Plano
  pTpSelecaoPlano               =  27;

  //Simulação de Benefícios
  pBenefSimulacao               =  28;

  //Transferência de Plano (menu)
  pTransfPlano                  =  29;

  //Simulação de Empréstimos (menu)
  pEmpSimulacao                 =  30;

  //Consulta Contrato de Empréstimos (menu)
  pEmpConsultaContrato          =  31;

  //Extrato de Empréstimos (Expandido)
  pEmpExtratoExpEmprestimos     =  32;

  //Alteração de Senha
  pAlteraSenha                  =  34;

  //Manutenção de Endereços
  pManutEnderecos               =  35;

  //Manutenção de Dependentes
  pManutDependentes             =  36;

  //Detalhes de Consignação Judicial
  pDadosConsignacaoJudicial     =  37;

  //Condignação Judicial
  pConsignacaoJudicial          =  38;

  //Dados do Participante
  pDadosDoParticipante          =  39;

  //Tempo de Serviço
  pTempoDeServico               =  40;

  //Histórico de Contribuições
  pHistoricoDeContribuicoes     =  41;

  //Saldo de Reserva
  pSaldoDeReserva               =  42;

  //Extrato de Reserva
  pExtratoDeReserva             =  43;

  //Dados do Participante na Patrocinadora
  pParticipanteNaPatrocinadora  =  44;

  //Dados do Participante nos Planos
  pParticipanteNosPlanos        =  45;

  //Eventos Previdenciários
  pEventosPrevidenciarios       =  46;

  //Detalhes de Eventos Previdenciários
  pDadosEventosPrevidenciarios  =  47;

  //Quadro Salarial
  pQuadroSalarial               =  48;

  //Contra-Cheque
  pContraCheque                 =  49;

  //Histórico de Benefícios
  pHistoricoDeBeneficios        =  50;

  //Parâmetros do Empréstimo
  pEmpParamEmptmo               =  51;

  //Consulta Inscrição em Empréstimos (menu)
  pEmpConsultaInscricao         =  53;

  //Extrato de Empréstimos (Agrupado)
  pEmpExtratoAgrEmprestimos     =  54;

  //Parâmetros de Consulta a Contratos de Empréstimos
  pEmpParConsContrato           =  55;

  //Consulta a Contratos de Empréstimos (tabela)
  pEmpConsContratos             =  56;

  //Parâmetros de Consulta a Inscrições em Empréstimos
  pEmpParConsInscricao          =  57;

  //Consulta a Inscrições em Empréstimos (tabela)
  pEmpConsInscricoes            =  58;

  //Consulta a Inscrições em Empréstimos (detalhes)
  pEmpDadosInscricao            =  59;

  //Exclusão de Inscrição em Empréstimo
  pEmpExclusaoInscricao         =  60;

  //Impressão de Inscrição no Empréstimo
  pEmpContrInscEmptmo           =  61;

  //Informe de Rendimentos
  pInformeRendimentos           =  62;

  //Seleção do Benefício a Simular
  pBenefSelecao                 =  63;

  //Campos da Simulação de Benefício
  pBenefCampos                  =  64;

  //Resultados da Simulação de Benefício
  pBenefResultados              =  65;

  //Extrato de Reserva por Período
  pExtResPer                    =  66;

  //Eventos Previdenciários de Planos Ativos
  pEventosPrevAtivos            = 67;

  //Contra-Cheque não encontrado
  pContraChequeNaoEncontrado    = 68;

  //Sub-Menu Dados Cadastrais
  pSubMenuDadosCadastrais       = 69;

  //Sub-Menu Reserva de Poupança
  pSubMenuReservaPoupanca       = 70;

  //Sub-Menu Extrato de Empréstimos
  pSubMenuExtratoEmprestimos    = 71;

  //Contratação de Empréstimos
  pEmpContratacao               = 72;

  //Inscrição em Empréstimos
  pEmpInscricao                 = 73;

  //Reimpressão de Inscrição no Empréstimo
  pEmpContrInscEmptmoReimp      =  74;

  //Exclusão de Inscrição em Empréstimo na Consulta
  pEmpExclusaoInscricaoCons     =  75;

  //Parâmetros de Extrato de Empréstimos
  pEmpParExtratoEmptmo          =  76;

  //Contrato não encontrado (Consulta a Contratos)
  pEmpConsContratoNEncontr      =  77;

  //Contrato não encontrado (Extrato de Empréstimos)
  pEmpExtratoNEncontr           =  78;

  //Contrato não encontrado (Extrato de Empréstimos)
  pEmpConsInscricaoNEncontr     =  79;

  //Confirmação de Exclusão de Inscrição em Empréstimo na Consulta
  pEmpExclusaoInscricaoConsConf =  80;

  //Impressão de Contrato no Empréstimo
  pEmpContrConcEmptmo           =  81;

  //Reimpressão de Contrato no Empréstimo
  pEmpContrConcEmptmoReimp      =  82;

  //Manutenção de Telefones
  pManutTelefones               =  83;

  //Inclusão de Endereço
  pTelInclusao                  =  84;

  //Alteração de Endereço
  pTelAlteracao                 =  85;

  //Exclusão de Endereço
  pTelExclusao                  =  86;

  //Confirmação de Inclusão de Telefone
  pTelConfInclusao              =  87;

  //Confirmação de Alteração de Telefone
  pTelConfAlteracao             =  88;

  //Confirmação de Exclusão de Telefone
  pTelConfExclusao              =  89;

  //Consulta à Situação atual dos Benefícios
  pSitAtualBenef                =  90;

  //Parâmetros de Consulta a Situação atual dos Benefícios
  pSitAtualBenefPar             =  91;

  //Tabela de Consulta a Situação atual dos Benefícios
  pSitAtualBenefTabela          =  92;

  //Tabela de Consulta a Situação atual dos Benefícios
  pSitAtualBenefDetalhes        =  93;

  //Cancelamento de Dependente
  pDepCancelamento              =  94;

  //Confirmação de Cancelamento de Dependente
  pDepConfCancelamento          =  95;

  //BRUNO AZEVEDO SOL 124251 KINTANA 651677
  pTempoServicoConsulta         =  96;

  pTempoServicoInclusao         =  97;

  pTempoServicoAlteracao        =  98;

  pTempoServicoExclusao         =  99;

  pTempoServicoConfInclusao     =  100;

  pTempoServicoConfAlteracao    =  101;

  pTempoServicoConfExclusao     =  102;
  //BRUNO AZEVEDO SOL 124251 KINTANA 651677

  //BRUNO AZEVEDO SOL 91655 KINTANA 394002
  pManutDadosCadastrais         =  103;
  //BRUNO AZEVEDO SOL 91655 KINTANA 394002

  //ULTIMO CAMPO 486

  //----- Códigos dos Campos -----
  //Último utilizado: 474 - 31/08/2006
  //Último utilizado: 476 - 23/05/2006
  //Último utilizado: 478 - 28/12/2007
  //Último utilizado: 489 - 18/01/2011

  //BRUNO AZEVEDO SOL 150881 KINTANA 1099543
  //Manutenção de Dados Cadastrais
  cAltEmail                     = 488;
  cAltNaoRecebPeriodico         = 489;
  //BRUNO AZEVEDO SOL 150881 KINTANA 1099543
  
  //Manutenção de Dependentes
  cAltDepNome                   =  01;
  cAltDepNomePai                =  02;
  cAltDepNomeMae                =  03;
  cAltDepParentesco             =  04;
  cAltDepSexo                   =  05;
  cAltDepGrauInstr              =  06;
  cAltDepEstadoCivil            =  07;
  cAltDepDataNasc               =  08;
  cAltDepIsentoIRRF             =  09;
  cAltDepSalarioFamilia         =  10;
  cAltDepDependenteLegal        =  11;
  cAltDepPossuiMolestiaGrave    =  12;
  cAltDepDesignado              =  13;
  cAltDepIRRF                   = 200;
  cAltDepDataMorte              = 477; //Pendência 23274 - 28/12/2007
  cAltDepNumDocumento           = 478; //Pendência 23274 - 28/12/2007
  cAltDepIR                     = 483; //BRUNO AZEVEDO SOL 124179 KINTANA 651468
  cAltDepInvalido               = 484; //BRUNO AZEVEDO SOL 124179 KINTANA 651468
  cVerificaIdade                = 486; //BRUNO AZEVEDO SOL 141367 KINTANA 894033
  
  //Dados do Participante
  cDependentes                  =  69;
  cDepGrauInstr                 =  14;
  cDepNomePai                   =  15;
  cDepNomeMae                   =  16;
  cDepIsentoIRRF                =  17;
  cDepSalarioFamilia            =  18;
  cDepDependenteLegal           =  19;
  cDepPossuiMolestiaGrave       =  20;
  cDepDesignado                 =  21;
  cDepIRRF                      = 201;


  //Manutenção de Endereços
  cAltEndTipo                   =  22;
  cAltEndDescricao              =  23;
  cAltEndLogradouro             =  24;
  cAltEndComplemento            =  25;
  cAltEndNumero                 =  26;
  cAltEndCEP                    =  27;
  cAltEndCidade                 =  28;
  cAltEndEstado                 =  29;
  cAltEndBairro                 =  30;
  cAltEndPais                   =  359;


  //Consulta a Contratos de Empréstimos (tabela)
  cEmpConsContrNumContrato      =  31;
  cEmpConsContrSituacao         =  32;
  cEmpConsContrTipoContrato     =  33;
  cEmpConsContrTipoEmprestimo   = 199;
  cEmpConsContrTotalParcelas    = 239;
  cEmpConsContrDtAssinatura     = 240;
  cEmpConsContrDtInscricao      = 306;
  cEmpConsContrDtCredito        = 307;
  cEmpConsContrDt1aParcela      = 308;
  cEmpConsContrDtCancelamento   = 309;
  cEmpConsContrValorContratado  = 310;
  cEmpConsContrTaxaJuros        = 311;
  cEmpConsContrValorParcela     = 312;
  cEmpConsContrInscricao        = 313;


  //Detalhes de Consignação Judicial
  cDetalhesConsigJudicial       =  34;
  cDtInicialDetConsigJudicial   =  35;
  cDtFinalDetConsigJudicial     =  36;
  cFavorecidoDetConsigJudicial  =  37;
  cParcelasDetConsigJudicial    =  38;
  cProcessadasDetConsigJudicial =  39;
  cAlimentadoDetConsigJudicial  =  40;
  cAbonoAnualDetConsigJudicial  =  41;
  cPermanenteDetConsigJudicial  =  42;
  cTabelaPagamentos             =  43;
  cMesRefDetConsigJudicial      =  44;
  cDataPagtoDetConsigJudicial   =  45;
  cValorDetConsigJudicial       =  46;


  //Condignação Judicial
  cTabelaConsigJudicial         =  47;
  cDtInicialConsigJudicial      =  48;
  cDtFinalConsigJudicial        =  49;
  cFavorecidoConsigJudicial     =  50;
  cParcelasConsigJudicial       =  51;
  cProcessadasConsigJudicial    =  52;
  cAlimentadoConsigJudicial     =  53;
  cAbonoConsigJudicial          =  54;
  cPermanenteConsigJudicial     =  55;


  //Dados do Participante
  cDocumentos                   =  67;
  cContasBancarias              =  68;
  cEnderecos                    =  70;
  cTelefones                    =  71;
  cNome                         =  56;
  cNomeDoPai                    =  57;
  cNomeDaMae                    =  58;
  cEstadoCivil                  =  59;
  cSexo                         =  60;
  cNacionalidade                =  61;
  cNaturalidade                 =  62;
  cDataNascimento               =  63;
  cPossuiMolestiaGrave          =  64;
  cIsentoDeIRRF                 =  65;
  cDadosPessoais                =  66;
  cDDD                          =  72;
  cDDI                          =  73;
  cNumero                       =  74;
  cLogradouroTelefone           =  75;
  cDescricaoEndereco            =  76;
  cLogradouro                   =  77;
  cComplemento                  =  78;
  cNumeroEndereco               =  79;
  cCEP                          =  80;
  cCidade                       =  81;
  cEstado                       =  82;
  cBairro                       =  83;
  //BRUNO AZEVEDO SOL 91655 KINTANA 394002
  cTipoEndereco                 = 485;
  //BRUNO AZEVEDO SOL 91655 KINTANA 394002
  cDataFalecimento              =  84;
  cFimInvalidez                 =  85;
  cInicioInvalidez              =  86;
  cEMail                        =  87;
  cFoto                         = 189;
  cTelCom                       = 353;
  cTelPar                       = 354;
  cTelFax                       = 355;
  cTelCel                       = 356;
  cTelRec                       = 357;
  cPais                         = 358;  


  //Dados do Participante na Patrocinadora
  cNomeDaFundacao               =  88;
  cCargo                        =  89;
  cCentroDeCusto                =  90;
  cFilial                       =  91;
  cMatricula                    =  92;
  cSituacaoDoPartNaPatro        =  93;
  cVinculacao                   =  94;
  cDataAdmissao                 =  95;
  cDataDemissao                 =  96;
  cDataReadmissao               =  97;
  cSalario                      =  98;
  cOrgaoSetor                   =  99;
  cTempoTotalDeServAnterior     = 100;
  cTempoTotalNaoCreditado       = 101;


  //Dados do Participante nos Planos
  cNomeDoPlano                  = 102;
  cSituacaoDoPartNoPlano        = 103;
  cSituacaoNoPlano              = 104;
  cDataCancelamento             = 105;
  cDataInscricao                = 106;
  cDataRequerimento             = 107;
  cInscricao                    = 108;
  cSalarioNaInscricao           = 109;
  cSituacaoEspecial             = 110;
  cTipoDeInscricao              = 111;
  cDtInicioDeManutencao         = 112;


  //Tempo de Serviço
  cTmpSrvTabela                 = 113;
  cTmpSrvCConversaoExtenso      = 114;
  cTmpSrvSConversaoExtenso      = 115;
  cTmpSrvContaTempoDeServico    = 116;
  cTmpSrvTransfConcomitante     = 117;
  cTmpSrvDtFinal                = 118;
  cTmpSrvDtInicial              = 119;
  cTmpSrvEmpresa                = 120;
  cTmpSrvInsalubridade          = 121;
  cTmpSrvCargo                  = 122;
  cTmpSrvFuncao                 = 123;
  cTmpSrvTempoExtenso           = 159;
  cTmpSrvCConversaoDias         = 197;
  cTmpSrvSConversaoDias         = 198;
  cTmpSrvFator                  = 255;


  //Histórico de Contribuições
  cTabelaContribuicoes          = 124;
  cContribuicaoHistorico        = 125;
  cDevolucao                    = 126;
  cMesRef                       = 127;
  cRecebimento                  = 128;
  cReserva                      = 129;
  cSituacao                     = 130;
  cTotalMes                     = 131;
  cValorContribuicao            = 132;


  //Saldo de Reserva
  cTabelaSaldoDeReserva         = 136;
  cDataUltAlim                  = 133;
  cNomeDaReservaSaldo           = 134;
  cReservaEmCotas               = 135;
  cSituacaoDaReserva            = 137;
  cValorDoSaldoDeReserva        = 138;
  cValorDaCota                  = 139;
  cSaldoDataRef                 = 363;
  cSaldoReserva                 = 365;


  //Extrato de Reserva
  cTabelaExtratoDeReserva       = 141;
  cES                           = 140;
  cMesRefExtratoDeReserva       = 142;
  cBeneficio                    = 143;
  cContribuicaoExtrato          = 144;
  cNomeDaReservaExtrato         = 145;
  cSaldo                        = 146;
  cValorDaReserva               = 147;
  //Pendência 22930 - 31/08/2006
  cDataMovimentacao             = 474;
  //Fim Pendência 22930


  //Dados do Participante
  cAgencia                      = 148;
  cBanco                        = 149;
  cContaCorrente                = 150;
  cContaPreferencial            = 151;
  cNumAgencia                   = 152;
  cNumBanco                     = 153;
  cDataNascDependente           = 154;
  cEstadoCivilDependente        = 155;
  cNomeDependente               = 156;
  cParentesco                   = 157;
  cSexoDependente               = 158;



  //Eventos Previdenciários
  cTabelaEventosPrev            = 160;
  cEventoGerador                = 161;
  cDtEvento                     = 162;
  cInscricaoEvento              = 163;
  cDtRegistro                   = 164;
  cDtEfetivacao                 = 165;
  cDtEncerramento               = 166;


  //Detalhes de Eventos Previdenciários
  cDetalhesEvento               = 167;
  cDetEventoGerador             = 168;
  cDetDtEvento                  = 169;
  cDetInscricaoEvento           = 170;
  cDetDtRegistro                = 171;
  cDetDtEfetivacao              = 172;
  cDetDtEncerramento            = 173;
  cDetSitAntFund                = 174;
  cDetSitNovaFund               = 175;
  cDetSitAntPatro               = 176;
  cDetSitNovaPatro              = 177;
  cDetSitAntPlano               = 178;
  cDetSitNovaPlano              = 179;
  cTabelaContribEventos         = 180;
  cContribEvento                = 181;
  cDetPlano                     = 360;



  //Quadro Salarial
  cTabelaQuadroSalarial         = 182;
  cMesRefRub                    = 183;
  cMesCobrancarRub              = 184;
  cIdRubrica                    = 185;
  cDescRUbrica                  = 186;
  cTipoRubrica                  = 187;
  cValorRubrica                 = 188;


  //Histórico de Benefícios
  cTabelaHistBenef              = 190;
  cMesRefHistBenef              = 191;
  cBeneficioHistBenef           = 192;
  cBeneficiarioHistBenef        = 193;
  cValorHistBenef               = 194;
  cDataPgtoHistBenef            = 195;
  cMesProcessoHistBenef         = 196;


  //Extrato de Empréstimos (Expandido)
  cEmpExtExpTabela              = 211;
  cEmpExtExpNumContrato         = 212;
  cEmpExtExpEvento              = 213;
  cEmpExtExpItem                = 214;
  cEmpExtExpParcela             = 215;
  cEmpExtExpSitParcela          = 424;
  cEmpExtExpSequencial          = 216;
  cEmpExtExpMesRef              = 217;
  cEmpExtExpMesCobranca         = 218;
  cEmpExtExpDtVenc              = 219;
  cEmpExtExpDtPagto             = 220;
  cEmpExtExpValorCalculado      = 221;
  cEmpExtExpValorEfetivo        = 222;
  cEmpExtExpSaldoDevedor        = 223;
  cEmpExtExpTxJuros             = 291;
  cEmpExtExpSituacao            = 361;


  //Consulta Contrato de Empréstimo (detalhes)
  cEmpConsNumContrato           = 224;
  cEmpConsSituacao              = 225;
  cEmpConsPlano                 = 226;
  cEmpConsPatrocinadora         = 227;
  cEmpConsTipoContrato          = 228;
  cEmpConsTipoEmprestimo        = 229;
  cEmpConsQtdeParcCont          = 230;
  cEmpConsDtAssinatura          = 231;
  cEmpConsDtInscricao           = 232;
  cEmpConsDtCredito             = 233;
  cEmpConsDt1Parcela            = 234;
  cEmpConsDtCancelamento        = 235;
  cEmpConsVlContratado          = 236;
  cEmpConsTaxaJuros             = 237;
  cEmpConsVlParcela             = 238;
  cEmpConsVlFGQC                = 487;
  cEmpConsInscEmp               = 241;
  cEmpConsSaldoContrato         = 202;
  cEmpConsDataQuitacao          = 203;
  cEmpConsValorEmAberto         = 204;
  cEmpConsSaldoAtual            = 205;



  //Seleção de Plano para Transferência de Plano
  cTrPlDadosPlanoAtual          = 242;
  cTrPlMatricula                = 243;
  cTrPlPatrocinadora            = 244;
  cTrPlPlanoOrigem              = 245;
  cTrPlDtInscricao              = 246;
  cTrPlDtBase                   = 247;
  cTrPlSitFundacao              = 248;
  cTrPlDtTransacao              = 249;
  cTrPlRecebBenef               = 250;
  cTrPlDtSimulacao              = 251;
  cTrPlDtFalecimento            = 252;
  cTrPlNomeBenef                = 253;
  cTrPlSitBenef                 = 254;



  //Parâmetros de Simulação de Empréstimos
  cEmpSimParDtCredito           = 256;
  cEmpSimParDt1aParcela         = 257;
  cEmpSimParTipoContrato        = 258;
  cEmpSimParTipoEmprestimo      = 259;
  cEmpSimParCarencia            = 260;
  cEmpSimParSaldoAQuitar        = 261;
  cEmpSimParMinimoParcelas      = 262;
  cEmpSimParMaximoParcelas      = 263;
  cEmpSimParSalarioBase         = 264;
  cEmpSimParMargemConsignavel   = 265;
  cEmpSimParReservaPoupanca     = 266;
  cEmpSimParTaxaJuros           = 267;
  cEmpSimParValorMaximo         = 268;
  cEmpSimParValorSolicitado     = 269;
  cEmpSimNumParcSimulaveis      = 366;
  cEmpSimSelecTodasParc         = 367;
  cEmpSimCPF                    = 368;

  //Pendência 24902 - 24/05/2007
  //Simulação de Empréstimos
  cEmpValorMaximo               = 475;
  cEmpValorSolicitado           = 476;
  //Fim Pendência 24902

  //Inscrição em Empréstimos
  cEmpInscPatro                 = 270;
  cEmpInscPlano                 = 271;
  cEmpInscTpContrato            = 272;
  cEmpInscTpEmprestimo          = 273;
  cEmpInscDtCredito             = 274;
  cEmpInscDtInscricao           = 275;
  cEmpInscContaBancariaPag      = 276;
  cEmpInscFormaRecto            = 277;
  cEmpInscFormaPagto            = 278;
  cEmpInscContaBancariaRec      = 279;
  cEmpInscNumeroInscricao       = 336;
  cEmpInscValorSolicitado       = 337;
  cEmpInscNumParcelas           = 338;
  cEmpInscMoeda                 = 339;
  cEmpInscTxJuros               = 348;
  cEmpInscBeneficiarioContrato  = 369;
  cEmpInscAvalistaContrato      = 370;


  //Extrato de Empréstimos (Agrupado)
  cEmpExtAgrTabela              = 292;
  cEmpExtAgrNumContrato         = 293;
  cEmpExtAgrEvento              = 294;
  cEmpExtAgrItem                = 295;
  cEmpExtAgrParcela             = 296;
  cEmpExtAgrSitParcela          = 347;
  cEmpExtAgrSequencial          = 297;
  cEmpExtAgrMesRef              = 298;
  cEmpExtAgrMesCobranca         = 299;
  cEmpExtAgrDtVenc              = 300;
  cEmpExtAgrDtPagto             = 301;
  cEmpExtAgrValorCalculado      = 302;
  cEmpExtAgrValorEfetivo        = 303;
  cEmpExtAgrSaldoDevedor        = 304;
  cEmpExtAgrTxJuros             = 305;
  cEmpExtAgrSituacao            = 362;


  //Consulta a Inscrições em Empréstimos (detalhes)
  cEmpConsInscDetTpEmprestimo   = 314;
  cEmpConsInscDetTpContrato     = 315;
  cEmpConsInscDetPatro          = 316;
  cEmpConsInscDetPlano          = 317;
  cEmpConsInscDetFormaPagto     = 318;
  cEmpConsInscDetFormaRecto     = 319;
  cEmpConsInscDetContaBancariaP = 320;
  cEmpConsInscDetNumParcelas    = 321;
  cEmpConsInscDetMoeda          = 322;
  cEmpConsInscDetDataCredito    = 323;
  cEmpConsInscDetVlSolicitado   = 324;
  cEmpConsInscDetNumInscricao   = 325;
  cEmpConsInscDetDtInscricao    = 341;
  cEmpConsInscDetSit            = 344;
  cEmpConsInscDetViaWeb         = 345;
  cEmpConsInscDetDadosItens     = 346;
  cEmpConsInscDetTxJuros        = 349;
  cEmpConsInscDetContaBancariaR = 352;


  //Consulta a Inscrições em Empréstimos (tabela)
  cEmpConsInscTpEmprestimo      = 326;
  cEmpConsInscTpContrato        = 327;
  cEmpConsInscFormaPagto        = 328;
  cEmpConsInscFormaRecto        = 329;
  cEmpConsInscContaBancariaPag  = 330;
  cEmpConsInscNumeroParcelas    = 331;
  cEmpConsInscMoeda             = 332;
  cEmpConsInscDataCredito       = 333;
  cEmpConsInscVlSolicitado      = 334;
  cEmpConsInscNumInscricao      = 335;
  cEmpConsInscDtInscricao       = 340;
  cEmpConsInscSit               = 342;
  cEmpConsInscViaWeb            = 343;
  cEmpConsInscTxJuros           = 348;
  cEmpConsInscContaBancariaRec  = 351;


  //Confirmação da Inscrição em Empréstimos
  cEmpInscConfTpEmprestimo      = 371;
  cEmpInscConfTpContrato        = 372;
  cEmpInscConfPatro             = 373;
  cEmpInscConfPlano             = 374;
  cEmpInscConfFormaPagto        = 375;
  cEmpInscConfFormaRecto        = 376;
  cEmpInscConfContaBancariaP    = 377;
  cEmpInscConfNumParcelas       = 378;
  cEmpInscConfMoeda             = 379;
  cEmpInscConfDataCredito       = 380;
  cEmpInscConfVlSolicitado      = 381;
  cEmpInscConfNumInscricao      = 382;
  cEmpInscConfDtInscricao       = 383;
  cEmpInscConfSit               = 384;
  cEmpInscConfViaWeb            = 385;
  cEmpInscConfDadosItens        = 386;
  cEmpInscConfTxJuros           = 387;
  cEmpInscConfContaBancariaR    = 388;
  cEmpInscConfAvalista          = 389;
  cEmpInscConfBeneficiarios     = 390;

  //Confirmação da Contratação de Empréstimos
  cEmpContrConfTpEmprestimo     = 391;
  cEmpContrConfTpContrato       = 392;
  cEmpContrConfPatro            = 393;
  cEmpContrConfPlano            = 394;
  cEmpContrConfFormaPagto       = 395;
  cEmpContrConfFormaRecto       = 396;
  cEmpContrConfContaBancariaP   = 397;
  cEmpContrConfNumParcelas      = 398;
  cEmpContrConfMoeda            = 399;
  cEmpContrConfDataCredito      = 400;
  cEmpContrConfVlSolicitado     = 401;
  cEmpContrConfNumContrato      = 402;
  cEmpContrConfNumInscricao     = 403;
  cEmpContrConfDtInscricao      = 404;
  cEmpContrConfSit              = 405;
  cEmpContrConfViaWeb           = 406;
  cEmpContrConfDadosItens       = 407;
  cEmpContrConfTxJuros          = 408;
  cEmpContrConfContaBancariaR   = 409;
  cEmpContrConfAvalista         = 410;
  cEmpContrConfBeneficiarios    = 411;

  //Parâmetros de Consulta ao Contrato de Empréstimo
  cEmpContrParamConsNumero        = 412;
  cEmpContrParamConsSituacao      = 413;
  cEmpContrParamConsTpEmpto       = 414;
  cEmpContrParamConsTpContrEmptmo = 415;

  //Parâmetros de Extrato de Empréstimos
  cEmpExtratoParamNumero          = 416;
  cEmpExtratoParamSituacao        = 417;
  cEmpExtratoParamTpEmpto         = 418;
  cEmpExtratoParamTpContrEmptmo   = 419;

  //Parâmetros de Consulta a Inscrições em Empréstimos
  cEmpInscrParamConsNumero        = 420;
  cEmpInscrParamConsSituacao      = 421;
  cEmpInscrParamConsTpEmpto       = 422;
  cEmpInscrParamConsTpContrEmptmo = 423;


  //Manutenção de Telefones
  cAltTelLogradouro             =  425;
  cAltTelDDI                    =  426;
  cAltTelDDD                    =  427;
  cAltTelNumero                 =  428;
  cAltTelComercial              =  429;
  cAltTelParticular             =  430;
  cAltTelFax                    =  431;
  cAltTelCelular                =  432;
  cAltTelRecado                 =  433;


  //Tabela de Consulta a Situação atual dos Benefícios
  cSitAtuBenefTblNumProcCM        = 434;
  cSitAtuBenefTblNumProcINSS      = 435;
  cSitAtuBenefTblNome             = 436;
  cSitAtuBenefTblSitBenef         = 437;
  cSitAtuBenefTblTipoPagto        = 438;
  cSitAtuBenefTblFormaPagto       = 439;
  cSitAtuBenefTblDtInicioPgto     = 440;
  cSitAtuBenefTblDtFinalPgtoEfet  = 441;
  cSitAtuBenefTblDtRequerimento   = 442;


  //Detalhes de Consulta a Situação atual dos Benefícios
  cSitAtuBenefDetNumProcCM        = 443;
  cSitAtuBenefDetNumProcINSS      = 444;
  cSitAtuBenefDetNome             = 445;
  cSitAtuBenefDetSitBenef         = 446;
  cSitAtuBenefDetNumPrcINSSBenAnt = 447;
  cSitAtuBenefDetPercGrFamBenAnt  = 448;
  cSitAtuBenefDetVlBenefInicial   = 449;
  cSitAtuBenefDetPercGrpFamiliar  = 450;
  cSitAtuBenefDetTipoPagto        = 451;
  cSitAtuBenefDetFormaPagto       = 452;
  cSitAtuBenefDetDtInicioPgto     = 453;
  cSitAtuBenefDetDtFinalPgtoEfet  = 454;
  cSitAtuBenefDetDtFinalPgtoPrev  = 455;
  cSitAtuBenefDetDtRequerimento   = 456;
  cSitAtuBenefDetDtConcessao      = 457;
  cSitAtuBenefDetInicioFund       = 458;
  cSitAtuBenefDetVlAtual          = 459;
  cSitAtuBenefDetVlCalculado      = 460;
  cSitAtuBenefDetVlSRB            = 461;
  cSitAtuBenefDetPreparadoAte     = 462;
  cSitAtuBenefDetReajustadoAte    = 463;
  cSitAtuBenefDetVlOpcao1         = 464;
  cSitAtuBenefDetVlOpcao2         = 465;
  cSitAtuBenefDetVlOpcao3         = 466;
  cSitAtuBenefDetVlCalcINSS       = 467;
  cSitAtuBenefDetInicioINSS       = 468;
  cSitAtuBenefDetVlInfINSS        = 469;
  cSitAtuBenefDetIniBenefAnt      = 470;
  cSitAtuBenefDetValBenefAnt      = 471;
  cSitAtuBenefDetBenefProvisorio  = 472;
  cSitAtuBenefDetPossuiAcompINSS  = 473;

  //BRUNO AZEVEDO SOL 124251 KINTANA 651677
  cTabelaTempoServico             = 479;
  cEmpresa                        = 480;
  cDataInicial                    = 481;
  cDataFinal                      = 482;
  //BRUNO AZEVEDO SOL 124251 KINTANA 651677

//Relatórios
  rInscricaoEmprestimo   = 1;    //Inscrição em Empréstimo
  rInformeRendimentos    = 2;    //Informe de Rendimentos
  rContaCheque           = 3;    //Contra-Cheque
  rContratacaoEmprestimo = 4;    //Contra-Cheque

type

  TTpUsuPaginaCampo = class(TObject)
  private

    //BRUNO AZEVEDO SOL 124251 KINTANA 651677
    aTpUsuPagina : array[ 1..103, 0..1 ] of string;
    aTpUsuCampo  : array[ 1..500 ] of string;

  public

    constructor Create;

    destructor Destroy; override;

    procedure Reset;

    procedure PreencheTudo( cdsTpUsuPagina, cdsTpUsuCampo: TCMClientDataSet; iIDTIPOUSUARIO, iIDWEBINTERFACE : integer );

    procedure AtualizaCaminhoPagina( sPath : string );

    procedure InserePagina( cdsTpUsuPagina : TCMClientDataSet; iIDPAGINA, iIDTIPOUSUARIO, iIDWEBINTERFACE : integer );

    procedure InsereCampo( cdsTpUsuCampo : TCMClientDataSet; iIDCAMPO, iIDTIPOUSUARIO, iIDWEBINTERFACE : integer );

  end;

implementation



{ TTpUsuPaginaCampo }

procedure TTpUsuPaginaCampo.AtualizaCaminhoPagina(sPath: string);
var
  i : integer;
begin
  if sPath[Length(sPath)] <> '\' then sPath := sPath + '\';
  for i := 1 to High( aTpUsuPagina ) do
  begin
    if aTpUsuPagina[i, 1] <> '' then
      aTpUsuPagina[i, 1] := sPath + aTpUsuPagina[i, 1];
  end;
end;

constructor TTpUsuPaginaCampo.Create;
begin
  inherited;
  Reset;
end;

destructor TTpUsuPaginaCampo.Destroy;
begin
  inherited;
end;

procedure TTpUsuPaginaCampo.InsereCampo(cdsTpUsuCampo: TCMClientDataSet;
  iIDCAMPO, iIDTIPOUSUARIO, iIDWEBINTERFACE: integer);
begin
  cdsTpUsuCampo.Append;
  cdsTpUsuCampo.FieldByName('IDCAMPO').AsInteger         := iIDCAMPO;
  cdsTpUsuCampo.FieldByName('IDTIPOUSUARIO').AsInteger   := iIDTIPOUSUARIO;
  cdsTpUsuCampo.FieldByName('IDWEBINTERFACE').AsInteger  := iIDWEBINTERFACE;
  cdsTpUsuCampo.FieldByName('TITULOCAMPO').AsString      := aTpUsuCampo[iIDCAMPO];
  cdsTpUsuCampo.FieldByName('FLGDISPONIVEL').AsString    := 'N';
  cdsTpUsuCampo.Post;
end;

procedure TTpUsuPaginaCampo.InserePagina(cdsTpUsuPagina: TCMClientDataSet;
  iIDPAGINA, iIDTIPOUSUARIO, iIDWEBINTERFACE: integer);
begin
  cdsTpUsuPagina.Append;
  cdsTpUsuPagina.FieldByName('IDPAGINA').AsInteger       := iIDPAGINA;
  cdsTpUsuPagina.FieldByName('IDTIPOUSUARIO').AsInteger  := iIDTIPOUSUARIO;
  cdsTpUsuPagina.FieldByName('IDWEBINTERFACE').AsInteger := iIDWEBINTERFACE;
  cdsTpUsuPagina.FieldByName('TITULOPAGINA').AsString    := aTpUsuPagina[iIDPAGINA, 0];
  cdsTpUsuPagina.FieldByName('FLGDISPONIVEL').AsString   := 'N';
  cdsTpUsuPagina.FieldByName('FLGUSAPADRAO').AsString    := 'S';
  cdsTpUsuPagina.FieldByName('LAYERACESSO').AsString     := '';
  cdsTpUsuPagina.FieldByName('PAGCONTEUDO').AsString     := aTpUsuPagina[iIDPAGINA, 1];
  cdsTpUsuPagina.Post;
end;

procedure TTpUsuPaginaCampo.PreencheTudo(cdsTpUsuPagina, cdsTpUsuCampo: TCMClientDataSet; iIDTIPOUSUARIO, iIDWEBINTERFACE : integer);
var
  i : integer;
begin
  cdsTpUsuPagina.Close;
  cdsTpUsuCampo.Close;

  cdsTpUsuPagina.CreateDataSet;
  for i := 1 to High( aTpUsuPagina ) do
  begin
    if aTpUsuPagina[i, 0] <> '' then
      InserePagina( cdsTpUsuPagina, i, iIDTIPOUSUARIO, iIDWEBINTERFACE );
  end;

  cdsTpUsuCampo.CreateDataSet;
  for i := 1 to High( aTpUsuCampo ) do
  begin
    if aTpUsuCampo[i] <> '' then
      InsereCampo( cdsTpUsuCampo, i, iIDTIPOUSUARIO, iIDWEBINTERFACE );
  end;

end;

procedure TTpUsuPaginaCampo.Reset;
var
  i : integer;

  procedure P( iPos : integer; sTitulo, sPagina : string );
  begin
    aTpUsuPagina[iPos, 0] := sTitulo;
    aTpUsuPagina[iPos, 1] := sPagina;
  end;

  procedure C( iPos : integer; sTitulo : string );
  begin
    aTpUsuCampo[iPos] := sTitulo;
  end;

begin

  for i := 1 to High( aTpUsuPagina ) do
  begin
    aTpUsuPagina[i, 0] := '';
    aTpUsuPagina[i, 1] := '';
  end;

  for i := 1 to High( aTpUsuCampo ) do
  begin
    aTpUsuCampo[i] := '';
  end;                  

  //Páginas
  P( pEmpSimulacao                   , 'Simulação de Empréstimos'                                , ''                        );
  P( pEmpSelecaoTpContrato           , 'Seleção de Tipo de Contrato'                             , 'empsimula.htm'           );
  P( pEmpParamSimulacao              , 'Parâmetros da Simulação'                                 , 'empsimula.htm'           );
  P( pEmpParcelas                    , 'Parcelas Simuladas'                                      , 'empsimula.htm'           );
  P( pEmpConsultaContrato            , 'Consulta Contrato'                                       , ''                        );
  P( pEmpDadosContrato               , 'Dados do Contrato de Empréstimo'                         , 'conteudo.htm'            );
  P( pEndConfInclusao                , 'Confirmação de Inclusão de Endereço'                     , 'endconfinclusao.htm'     );
  P( pEndConfAlteracao               , 'Confirmação de Alteração de Endereço'                    , 'endconfalteracao.htm'    );
  P( pEndConfExclusao                , 'Confirmação de Exclusão de Endereço'                     , 'endconfexclusao.htm'     );
  P( pDepConfInclusao                , 'Confirmação de Inclusão de Dependente'                   , 'depconfinclusao.htm'     );
  P( pDepConfAlteracao               , 'Confirmação de Alteração de Dependente'                  , 'depconfalteracao.htm'    );
  P( pDepConfExclusao                , 'Confirmação de Exclusão de Dependente'                   , 'depconfexclusao.htm'     );
  P( pEndInclusao                    , 'Inclusão de Endereço'                                    , 'conteudo.htm'            );
  P( pEndAlteracao                   , 'Alteração de Endereço'                                   , 'conteudo.htm'            );
  P( pEndExclusao                    , 'Exclusão de Endereço'                                    , 'conteudo.htm'            );
  P( pDepInclusao                    , 'Inclusão de Dependente'                                  , 'conteudo.htm'            );
  P( pDepAlteracao                   , 'Alteração de Dependente'                                 , 'conteudo.htm'            );
  P( pDepExclusao                    , 'Exclusão de Dependente'                                  , 'conteudo.htm'            );
  P( pConfSenha                      , 'Confirmação de Alteração de Senha'                       , 'senhagravada.htm'        );
  P( pLogout                         , 'Logout'                                                  , 'conflogout.htm'          );
  P( pHome                           , 'Home'                                                    , ''                        );
  P( pTransfPlano                    , 'Transferência de Plano'                                  , ''                        );
  P( pTpOpcaoSelecionada             , 'Opção Selecionada'                                       , 'trplopsel.htm'           );
  P( pTpConfirmacaoOpcao             , 'Confirmação de Opção'                                    , ''                        );
  P( pTpEstimativasTransacao         , 'Estimativas de Transferência da Opção <1>'               , 'trplano.htm'             );
  P( pTpDadosEstimativas             , 'Dados para Estimativas de Transferência para a Opção <1>', 'trpldadosest.htm'        );
  P( pTpOpcoesTransacao              , 'Opções de Transferência'                                 , 'trplano.htm'             );
  P( pTpDadosOpcoesTransacao         , 'Dados para Cálculo de Opções de Transferência'           , 'trplano.htm'             );
  P( pTpSelecaoPlano                 , 'Seleção de Plano'                                        , 'trplano.htm'             );
  P( pTrPlAvisoSimDes                , 'Aviso de Simulação Desabilitada'                         , 'trplavisodes.htm'        );
  P( pBenefSimulacao                 , 'Simulação de Benefício'                                  , ''                        );
  P( pEmpExtratoExpEmprestimos       , 'Extrato Expandido'                                       , 'empextrato.htm'          );
  P( pAlteraSenha                    , 'Alteração de Senha'                                      , 'conteudo.htm'            );
  P( pManutEnderecos                 , 'Manutenção de Endereços'                                 , 'conteudo.htm'            );
  P( pManutDependentes               , 'Manutenção de Dependentes'                               , 'conteudo.htm'            );
  P( pConsignacaoJudicial            , 'Consignação Judicial'                                    , 'conteudo.htm'            );
  P( pDadosConsignacaoJudicial       , 'Dados de Consignação Judicial'                           , 'conteudo.htm'            );
  P( pDadosDoParticipante            , 'Dados Pessoais'                                          , 'dadosparticipante.htm'   );
  P( pTempoDeServico                 , 'Tempo de Serviço'                                        , 'conteudo.htm'            );
  P( pHistoricoDeContribuicoes       , 'Histórico de Contribuições'                              , 'conteudo.htm'            );

  //BRUNO AZEVEDO SOL 124251 KINTANA 651677
  P( pTempoServicoConsulta           , 'Consulta de Tempo de Serviço'                            , 'conteudo.htm'            );
  P( pTempoServicoInclusao           , 'Inclusão de Tempo de Serviço'                            , 'conteudo.htm'            );
  P( pTempoServicoAlteracao          , 'Alteração de Tempo de Serviço'                           , 'conteudo.htm'            );
  P( pTempoServicoExclusao           , 'Exclusão de Tempo de Serviço'                            , 'conteudo.htm'            );
  P( pTempoServicoConfInclusao       , 'Confirmação de Inclusão de Tempo de Serviço'             , 'conteudo.htm'            );
  P( pTempoServicoConfAlteracao      , 'Confirmação de Alteração de Tempo de Serviço'            , 'conteudo.htm'            );
  P( pTempoServicoConfExclusao       , 'Confirmação de Exclusão de Tempo de Serviço'             , 'conteudo.htm'            );

  //BRUNO AZEVEDO SOL 124251 KINTANA 651677

  //BRUNO AZEVEDO
  P( pManutDadosCadastrais           , 'Manutenção de Dados Cadastrais'                          , 'conteudo.htm'            );

  P( pSaldoDeReserva                 , 'Saldo de Reserva'                                        , 'conteudo.htm'            );
  P( pExtratoDeReserva               , 'Extrato de Reserva'                                      , 'conteudo.htm'            );
  P( pParticipanteNaPatrocinadora    , 'Participante na Patrocinadora'                           , 'conteudo.htm'            );
  P( pParticipanteNosPlanos          , 'Participante nos Planos'                                 , 'conteudo.htm'            );
  P( pEventosPrevidenciarios         , 'Eventos Previdenciários'                                 , 'conteudo.htm'            );
  P( pDadosEventosPrevidenciarios    , 'Dados de Eventos Previdenciários'                        , 'conteudo.htm'            );
  P( pQuadroSalarial                 , 'Quadro Salarial'                                         , 'conteudo.htm'            );
  P( pContraCheque                   , 'Contra-Cheque'                                           , 'conteudo.htm'            );
  P( pHistoricoDeBeneficios          , 'Histórico de Benefícios'                                 , 'conteudo.htm'            );
  P( pEmpParamEmptmo                 , 'Parâmetros do Empréstimo'                                , 'empsimula.htm'           );
  P( pEmpConsultaInscricao           , 'Consulta Inscrição'                                      , 'conteudo.htm'            );
  P( pEmpExtratoAgrEmprestimos       , 'Extrato Agrupado'                                        , 'empextrato.htm'          );
  P( pEmpParConsContrato             , 'Parâmetros de Consulta a Empréstimos'                    , 'empparcons.htm'          );
  P( pEmpConsContratos               , 'Contratos de Empréstimos'                                , 'conteudo.htm'            );
  P( pEmpParConsInscricao            , 'Parâmetros de Consulta a Inscrições'                     , 'conteudo.htm'            );
  P( pEmpConsInscricoes              , 'Inscrições em Empréstimos'                               , 'conteudo.htm'            );
  P( pEmpDadosInscricao              , 'Dados da Inscrição'                                      , 'conteudo.htm'            );
  P( pEmpExclusaoInscricao           , 'Exclusão de Inscrição'                                   , ''                        );
  P( pEmpContrInscEmptmo             , 'Contrato de Inscrição em Empréstimo'                     , ''                        );
  P( pInformeRendimentos             , 'Informe de Rendimentos'                                  , 'infrendpar.htm'          );
  P( pBenefSelecao                   , 'Seleção do Benefício a Simular'                          , 'bensimsel.htm'           );
  P( pBenefCampos                    , 'Campos da Simulação de Benefício'                        , 'bensimcam.htm'           );
  P( pBenefResultados                , 'Resultados da Simulação de Benefício'                    , 'bensimres.htm'           );
  P( pExtResPer                      , 'Extrato de Reserva por período'                          , 'extresper.htm'           );
  P( pEventosPrevAtivos              , 'Eventos Previdenciários de Planos Ativos'                , 'conteudo.htm'            );
  P( pContraChequeNaoEncontrado      , 'Contra-cheque não encontrado'                            , 'contchqne.htm'           );
  P( pSubMenuDadosCadastrais         , 'Dados Cadastrais'                                        , ''                        );
  P( pSubMenuReservaPoupanca         , 'Reserva de Poupança'                                     , ''                        );
  P( pSubMenuExtratoEmprestimos      , 'Extrato de Empréstimos'                                  , ''                        );
  P( pEmpContratacao                 , 'Contratação de Empréstimo'                               , 'empconfcontratacao.htm'  );
  P( pEmpInscricao                   , 'Inscrição em Empréstimo'                                 , 'empconfinscricao.htm'    );
  P( pEmpContrInscEmptmoReimp        , 'Reimpressão de Contrato de Inscrição em Empréstimo'      , ''                        );
  P( pEmpExclusaoInscricaoCons       , 'Exclusão de Inscrição'                                   , ''                        );
  P( pEmpParExtratoEmptmo            , 'Parâmetros de Extratos de Empréstimos'                   , 'conteudo.htm'            );
  P( pEmpConsContratoNEncontr        , 'Contrato(s) não econtrado(s)'                            , 'empcontnencontr.htm'     );
  P( pEmpExtratoNEncontr             , 'Extrato(s) não econtrado(s)'                             , 'empextrnencontr.htm'     );
  P( pEmpConsInscricaoNEncontr       , 'Inscrição(ões) não econtrada(s)'                         , 'empinscrnencontr.htm'    );
  P( pEmpExclusaoInscricaoConsConf   , 'Confirmação de Exclusão de Inscrição'                    , 'empconfexcinscr.htm'     );
  P( pEmpContrConcEmptmo             , 'Contrato de Concessão de Empréstimo'                     , ''                        );
  P( pEmpContrConcEmptmoReimp        , 'Reimpressão de Contrato de Concessão de Empréstimo'      , ''                        );
  P( pManutTelefones                 , 'Manutenção de Telefones'                                 , 'conteudo.htm'            );
  P( pTelInclusao                    , 'Inclusão de Telefone'                                    , 'conteudo.htm'            );
  P( pTelAlteracao                   , 'Alteração de Telefone'                                   , 'conteudo.htm'            );
  P( pTelExclusao                    , 'Exclusão de Telefone'                                    , 'conteudo.htm'            );
  P( pTelConfInclusao                , 'Confirmação de Inclusão de Telefone'                     , 'telconfinclusao.htm'     );
  P( pTelConfAlteracao               , 'Confirmação de Alteração de Telefone'                    , 'telconfalteracao.htm'    );
  P( pTelConfExclusao                , 'Confirmação de Exclusão de Telefone'                     , 'telconfexclusao.htm'     );
  P( pSitAtualBenef                  , 'Situação Atual de Benefícios'                            , ''                        );
  P( pSitAtualBenefPar               , 'Parâmetros da Consulta à Situação Atual de Benefícios'   , 'conteudo.htm'            );
  P( pSitAtualBenefTabela            , 'Resultados da Consulta à Situação Atual de Benefícios'   , 'conteudo.htm'            );
  P( pSitAtualBenefDetalhes          , 'Detalhes da Consulta à Situação Atual de Benefícios'     , 'conteudo.htm'            );
  P( pDepCancelamento                , 'Cancelamento de Dependente'                              , 'conteudo.htm'            );
  P( pDepConfCancelamento            , 'Confirmação de Cancelamento de Dependente'               , 'depconfexclusao.htm'     );


  //Campos
  //BRUNO AZEVEDO SOL 141367 KINTANA 894033
  C( cVerificaIdade                  , 'Verifica Dependentes Válidos'                   );
  //BRUNO AZEVEDO SOL 141367 KINTANA 894033

  //BRUNO AZEVEDO SOL 150881 KINTANA 1099543
  C( cAltEmail                       , 'E-Mail'                                         );
  C( cAltNaoRecebPeriodico           , 'Não Receber Periódicos'                         );
  //BRUNO AZEVEDO SOL 150881 KINTANA 1099543
  
  C( cAltDepNome                     , 'Nome'                                           );
  C( cAltDepNomePai                  , 'Nome do Pai'                                    );
  C( cAltDepNomeMae                  , 'Nome da Mãe'                                    );
  C( cAltDepParentesco               , 'Grau de dependência'                            );
  C( cAltDepSexo                     , 'Sexo'                                           );
  C( cAltDepGrauInstr                , 'Grau de Instr.'                                 );
  C( cAltDepEstadoCivil              , 'Estado Civil'                                   );
  C( cAltDepDataNasc                 , 'Data Nasc.'                                     );
  C( cAltDepIsentoIRRF               , 'Isento de IRRF?'                                );
  C( cAltDepSalarioFamilia           , 'Conta para Sal. Família?'                       );
  C( cAltDepDependenteLegal          , 'Dependente legal?'                              );
  C( cAltDepPossuiMolestiaGrave      , 'Possui moléstia grave?'                         );
  C( cAltDepDesignado                , 'Designado?'                                     );
  //Pendência 23274 - 28/12/2007
  C( cAltDepDataMorte                , 'Data de Falecimento'                            );
  C( cAltDepNumDocumento             , 'CPF'                                            );
  //Fim Pendência 23274
  //BRUNO AZEVEDO SOL 124179 KINTANA 651468
  C( cAltDepIR                       , 'Dependente para imposto de renda'               );
  C( cAltDepInvalido                 , 'Dependente inválido'                            );
  //BRUNO AZEVEDO SOL 124179 KINTANA 651468
  C( cDependentes                    , 'Dependentes'                                    );
  C( cDepGrauInstr                   , 'Grau de Instr.'                                 );
  C( cDepNomePai                     , 'Nome do Pai'                                    );
  C( cDepNomeMae                     , 'Nome da Mãe'                                    );
  C( cDepIsentoIRRF                  , 'Isento de IRRF?'                                );
  C( cDepSalarioFamilia              , 'Conta para Sal. Família?'                       );
  C( cDepDependenteLegal             , 'Dependente legal?'                              );
  C( cDepPossuiMolestiaGrave         , 'Possui moléstia grave?'                         );
  C( cDepDesignado                   , 'Designado?'                                     );
  C( cAltEndTipo                     , 'Tipo'                                           );
  C( cAltEndDescricao                , 'Descrição'                                      );
  C( cAltEndLogradouro               , 'Logradouro'                                     );
  C( cAltEndComplemento              , 'Complemento'                                    );
  C( cAltEndNumero                   , 'Número'                                         );
  C( cAltEndCEP                      , 'CEP'                                            );
  C( cAltEndCidade                   , 'Cidade'                                         );
  C( cAltEndEstado                   , 'Estado'                                         );
  C( cAltEndBairro                   , 'Bairro'                                         );
  C( cEmpConsContrNumContrato        , 'Número do Contrato'                             );
  C( cEmpConsContrSituacao           , 'Situação'                                       );
  C( cEmpConsContrTipoContrato       , 'Tipo de Contrato'                               );
  C( cDetalhesConsigJudicial         , 'Detalhes da Consignação Judicial'               );
  C( cDtInicialDetConsigJudicial     , 'Dt. Inicial'                                    );
  C( cDtFinalDetConsigJudicial       , 'Dt. Final'                                      );
  C( cFavorecidoDetConsigJudicial    , 'Favorecido'                                     );
  C( cParcelasDetConsigJudicial      , 'Parcelas'                                       );
  C( cProcessadasDetConsigJudicial   , 'Processadas'                                    );
  C( cAlimentadoDetConsigJudicial    , 'Alimentado'                                     );
  C( cAbonoAnualDetConsigJudicial    , 'Incide sobre Abono Anual?'                      );
  C( cPermanenteDetConsigJudicial    , 'Permanente?'                                    );
  C( cTabelaPagamentos               , 'Pagamentos'                                     );
  C( cMesRefDetConsigJudicial        , 'Mês de Referência'                              );
  C( cDataPagtoDetConsigJudicial     , 'Data de Pagamento'                              );
  C( cValorDetConsigJudicial         , 'Valor'                                          );
  C( cTabelaConsigJudicial           , 'Tabela de Consignação Judicial'                 );
  C( cDtInicialConsigJudicial        , 'Dt. Inicial'                                    );
  C( cDtFinalConsigJudicial          , 'Dt. Final'                                      );
  C( cFavorecidoConsigJudicial       , 'Favorecido'                                     );
  C( cParcelasConsigJudicial         , 'Parcelas'                                       );
  C( cProcessadasConsigJudicial      , 'Processadas'                                    );
  C( cAlimentadoConsigJudicial       , 'Alimentado'                                     );
  C( cAbonoConsigJudicial            , 'Incide sobre Abono Anual?'                      );
  C( cPermanenteConsigJudicial       , 'Permanente?'                                    );
  C( cDadosPessoais                  , 'Dados Pessoais'                                 );
  C( cDocumentos                     , 'Documentos'                                     );
  C( cContasBancarias                , 'Contas Bancárias'                               );
  C( cEnderecos                      , 'Endereços'                                      );
  C( cTelefones                      , 'Telefones'                                      );
  C( cNome                           , 'Nome'                                           );
  C( cNomeDoPai                      , 'Nome do Pai'                                    );
  C( cNomeDaMae                      , 'Nome da Mãe'                                    );
  C( cEstadoCivil                    , 'Estado Civil'                                   );
  C( cSexo                           , 'Sexo'                                           );
  C( cNacionalidade                  , 'Nacionalidade'                                  );
  C( cNaturalidade                   , 'Naturalidade'                                   );
  C( cDataNascimento                 , 'Dt. de Nascimento'                              );
  C( cPossuiMolestiaGrave            , 'Possui moléstia grave?'                         );
  C( cIsentoDeIRRF                   , 'Isento de IRRF?'                                );
  C( cDDD                            , 'DDD'                                            );
  C( cDDI                            , 'DDI'                                            );
  C( cNumero                         , 'Número'                                         );
  C( cLogradouroTelefone             , 'Logradouro'                                     );
  C( cDescricaoEndereco              , 'Descrição'                                      );
  //BRUNO AZEVEDO SOL 91655 KINTANA 394002
  C( cTipoEndereco                   , 'Tipo de Endereço'                               );
  //BRUNO AZEVEDO SOL 91655 KINTANA 394002
  C( cLogradouro                     , 'Logradouro'                                     );
  C( cComplemento                    , 'Complemento'                                    );
  C( cNumeroEndereco                 , 'Número'                                         );
  C( cCEP                            , 'CEP'                                            );
  C( cCidade                         , 'Cidade'                                         );
  C( cEstado                         , 'Estado'                                         );
  C( cBairro                         , 'Bairro'                                         );
  C( cDataFalecimento                , 'Dt. de Falecimento'                             );
  C( cFimInvalidez                   , 'Fim da Invalidez'                               );
  C( cInicioInvalidez                , 'Início da Invalidez'                            );
  C( cEMail                          , 'E-Mail'                                         );
  C( cNomeDaFundacao                 , 'Nome da Fundação'                               );
  C( cCargo                          , 'Cargo'                                          );
  C( cCentroDeCusto                  , 'Centro de Custo'                                );
  C( cFilial                         , 'Filial'                                         );
  C( cMatricula                      , 'Matrícula'                                      );
  C( cSituacaoDoPartNaPatro          , 'Situação do Participante'                       );
  C( cVinculacao                     , 'Vinculação'                                     );
  C( cDataAdmissao                   , 'Data de Admissão'                               );
  C( cDataDemissao                   , 'Data de Demissão'                               );
  C( cDataReadmissao                 , 'Data de Re-admissão'                            );
  C( cSalario                        , 'Salário'                                        );
  C( cOrgaoSetor                     , 'Órgão/Setor'                                    );
  C( cTempoTotalDeServAnterior       , 'Tempo de Serv. Anterior'                        );
  C( cTempoTotalNaoCreditado         , 'Tempo não creditado'                            );
  C( cNomeDoPlano                    , 'Nome do Plano'                                  );
  C( cSituacaoDoPartNoPlano          , 'Situação do Participante'                       );
  C( cSituacaoNoPlano                , 'Situação no Plano'                              );
  C( cDataCancelamento               , 'Data de Cancelamento'                           );
  C( cDataInscricao                  , 'Data de Inscrição'                              );
  C( cDataRequerimento               , 'Data de Requerimento'                           );
  C( cInscricao                      , 'Inscrição'                                      );
  C( cSalarioNaInscricao             , 'Salário na Inscrição'                           );
  C( cSituacaoEspecial               , 'Situação Especial?'                             );
  C( cTipoDeInscricao                , 'Tipo de Inscrição'                              );
  C( cDtInicioDeManutencao           , 'Dt. Início de Manutenção'                       );
  C( cTmpSrvTabela                   , 'Tempo de Serviço (tabela)'                      );
  C( cTmpSrvCConversaoExtenso        , 'Tempo de Serviço Total (com conversão)'         );
  C( cTmpSrvSConversaoExtenso        , 'Tempo de Serviço Total (sem conversão)'         );
  C( cTmpSrvContaTempoDeServico      , 'Conta como tempo de serviço?'                   );
  C( cTmpSrvTransfConcomitante       , 'Transferência Concomitante'                     );
  C( cTmpSrvDtFinal                  , 'Dt. Final'                                      );
  C( cTmpSrvDtInicial                , 'Dt. Inicial'                                    );
  C( cTmpSrvEmpresa                  , 'Empresa'                                        );
  C( cTmpSrvInsalubridade            , 'Insalubridade'                                  );
  C( cTmpSrvCargo                    , 'Cargo'                                          );
  C( cTmpSrvFuncao                   , 'Função'                                         );

  //BRUNO AZEVEDO SOL 124251 KINTANA 651677
  C( cTabelaTempoServico             , 'Tempo de serviço (tabela)'                      );
  C( cEmpresa                        , 'Empresa'                                        );
  C( cDataInicial                    , 'Data Inicial'                                   );
  C( cDataFinal                      , 'Data Final'                                     );
  //BRUNO AZEVEDO SOL 124251 KINTANA 651677
  
  C( cTabelaContribuicoes            , 'Contribuições (tabela)'                         );
  C( cContribuicaoHistorico          , 'Contribuição'                                   );
  C( cDevolucao                      , 'Devolução?'                                     );
  C( cMesRef                         , 'Mês Ref.'                                       );
  C( cRecebimento                    , 'Recebimento'                                    );
  C( cReserva                        , 'Reserva?'                                       );
  C( cSituacao                       , 'Situação'                                       );
  C( cTotalMes                       , 'Total Mês'                                      );
  C( cValorContribuicao              , 'Valor'                                          );
  C( cTabelaSaldoDeReserva           , 'Saldo de Reserva (tabela)'                      );
  C( cDataUltAlim                    , 'Data Ult. Alim.'                                );
  C( cNomeDaReservaSaldo             , 'Nome da Reserva'                                );
  C( cReservaEmCotas                 , 'Reserva em Cotas'                               );
  C( cSituacaoDaReserva              , 'Situação'                                       );
  C( cValorDoSaldoDeReserva          , 'Valor'                                          );
  C( cValorDaCota                    , 'Valor da Cota'                                  );
  C( cTabelaExtratoDeReserva         , 'Extrato de Reserva (tabela)'                    );
  C( cES                             , 'E/S'                                            );
  C( cMesRefExtratoDeReserva         , 'Mês Ref.'                                       );
  //Pendência 22930 - 31/08/2006
  C( cDataMovimentacao               , 'Data Mov.'                                      );
  //Fim Pendência 22930
  C( cBeneficio                      , 'Benefício'                                      );
  C( cContribuicaoExtrato            , 'Contribuição'                                   );
  C( cNomeDaReservaExtrato           , 'Nome da Reserva'                                );
  C( cSaldo                          , 'Saldo'                                          );
  C( cValorDaReserva                 , 'Valor'                                          );
  C( cAgencia                        , 'Agência'                                        );
  C( cBanco                          , 'Banco'                                          );
  C( cContaCorrente                  , 'Conta Corrente'                                 );
  C( cContaPreferencial              , 'Conta Preferencial?'                            );
  C( cNumAgencia                     , 'Num. Agência'                                   );
  C( cNumBanco                       , 'Num. Banco'                                     );
  C( cDataNascDependente             , 'Data Nasc.'                                     );
  C( cEstadoCivilDependente          , 'Estado Civil'                                   );
  C( cNomeDependente                 , 'Nome'                                           );
  C( cParentesco                     , 'Parentesco'                                     );
  C( cSexoDependente                 , 'Sexo'                                           );
  C( cTmpSrvTempoExtenso             , 'Tempo por Extenso'                              );
  C( cTabelaEventosPrev              , 'Tabela de Eventos Previdenciários'              );
  C( cEventoGerador                  , 'Evento Gerador'                                 );
  C( cDtEvento                       , 'Dt. Evento'                                     );
  C( cInscricaoEvento                , 'Inscrição'                                      );
  C( cDtRegistro                     , 'Dt. Registro'                                   );
  C( cDtEfetivacao                   , 'Dt. Efetivação'                                 );
  C( cDtEncerramento                 , 'Dt. Encerra.'                                   );
  C( cDetalhesEvento                 , 'Detalhes do Evento'                             );
  C( cDetEventoGerador               , 'Evento Gerador'                                 );
  C( cDetDtEvento                    , 'Dt. Evento'                                     );
  C( cDetInscricaoEvento             , 'Inscrição'                                      );
  C( cDetDtRegistro                  , 'Dt. Registro'                                   );
  C( cDetDtEfetivacao                , 'Dt. Efetivação'                                 );
  C( cDetDtEncerramento              , 'Dt. Encerra.'                                   );
  C( cDetSitAntFund                  , 'Sit. anterior na Fundação'                      );
  C( cDetSitNovaFund                 , 'Sit. nova na Fundação'                          );
  C( cDetSitAntPatro                 , 'Sit. anterior na Patro.'                        );
  C( cDetSitNovaPatro                , 'Sit. nova na Patro.'                            );
  C( cDetSitAntPlano                 , 'Sit. anterior no Plano'                         );
  C( cDetSitNovaPlano                , 'Sit. nova no Plano'                             );
  C( cTabelaContribEventos           , 'Contribuições do Evento'                        );
  C( cContribEvento                  , 'Contribuição'                                   );
  C( cTabelaQuadroSalarial           , 'Tabela de Quadro Salarial'                      );
  C( cMesRefRub                      , 'Mês Ref.'                                       );
  C( cMesCobrancarRub                , 'Cobrança'                                       );
  C( cIdRubrica                      , 'Rubrica'                                        );
  C( cDescRUbrica                    , 'Descrição'                                      );
  C( cTipoRubrica                    , 'Motivo'                                         );
  C( cValorRubrica                   , 'Valor'                                          );
  C( cFoto                           , 'Foto'                                           );
  C( cTabelaHistBenef                , 'Tabela de Histórico de Benefícios'              );
  C( cMesRefHistBenef                , 'Mês Ref.'                                       );
  C( cBeneficioHistBenef             , 'Benefício'                                      );
  C( cBeneficiarioHistBenef          , 'Beneficiário'                                   );
  C( cValorHistBenef                 , 'Valor'                                          );
  C( cDataPgtoHistBenef              , 'Data Pgto.'                                     );
  C( cMesProcessoHistBenef           , 'Mês Processo'                                   );
  C( cTmpSrvCConversaoDias           , 'Tempo de Serviço Total em dias (com conversão)' );
  C( cTmpSrvSConversaoDias           , 'Tempo de Serviço Total em dias (sem conversão)' );
  C( cEmpConsContrTipoEmprestimo     , 'Tipo de Empréstimo'                             );
  C( cAltDepIRRF                     , 'Conta para IRRF?'                               );
  C( cDepIRRF                        , 'Conta para IRRF?'                               );
  C( cEmpConsSaldoContrato           , 'Saldo do Contrato'                              );
  C( cEmpConsDataQuitacao            , 'Atualizar saldo devedor até'                    );
  C( cEmpConsValorEmAberto           , 'Valor em Aberto'                                );
  C( cEmpConsSaldoAtual              , 'Saldo Atualizado**'                               );
  C( cEmpExtExpTabela                , 'Tabela de Extrato de Empréstimos'               );
  C( cEmpExtExpNumContrato           , 'Número do Contrato'                             );
  C( cEmpExtExpEvento                , 'Evento'                                         );
  C( cEmpExtExpItem                  , 'Item'                                           );
  C( cEmpExtExpParcela               , 'Parcela'                                        );
  C( cEmpExtExpSequencial            , 'Seqüencial'                                     );
  C( cEmpExtExpMesRef                , 'Mês de Referência'                              );
  C( cEmpExtExpMesCobranca           , 'Mês de Cobrança'                                );
  C( cEmpExtExpDtVenc                , 'Data de Vencimento'                             );
  C( cEmpExtExpDtPagto               , 'Data de Pagamento'                              );
  C( cEmpExtExpValorCalculado        , 'Valor Calculado'                                );
  C( cEmpExtExpValorEfetivo          , 'Valor Efetivo'                                  );
  C( cEmpExtExpSaldoDevedor          , 'Saldo Devedor'                                  );
  C( cEmpConsNumContrato             , 'Número do Contrato'                             );
  C( cEmpConsSituacao                , 'Situação'                                       );
  C( cEmpConsPlano                   , 'Plano'                                          );
  C( cEmpConsPatrocinadora           , 'Patrocinadora'                                  );
  C( cEmpConsTipoContrato            , 'Tipo de Contrato'                               );
  C( cEmpConsTipoEmprestimo          , 'Tipo de Empréstimo'                             );
  C( cEmpConsQtdeParcCont            , 'Total de Parcelas'                              );
  C( cEmpConsDtAssinatura            , 'Data de Assinatura'                             );
  C( cEmpConsDtInscricao             , 'Data de Inscrição'                              );
  C( cEmpConsDtCredito               , 'Data de Crédito'                                );
  C( cEmpConsDt1Parcela              , 'Data da 1a. Parcela'                            );
  C( cEmpConsDtCancelamento          , 'Data de Cancelamento'                           );
  C( cEmpConsVlContratado            , 'Valor Contratado'                               );
  C( cEmpConsTaxaJuros               , 'Taxa de Juros'                                  );
  C( cEmpConsVlParcela               , 'Valor da Parcela Base'                          );
  C( cEmpConsVlFGQC                  , 'Valor de FGQC*'                                  );
  C( cEmpConsContrTotalParcelas      , 'Total de Parcelas'                              );
  C( cEmpConsContrDtAssinatura       , 'Data de Assinatura'                             );
  C( cEmpConsInscEmp                 , 'Inscrição no Empréstimo'                        );
  C( cTrPlDadosPlanoAtual            , 'Dados do plano atual'                           );
  C( cTrPlMatricula                  , 'Matrícula'                                      );
  C( cTrPlPatrocinadora              , 'Patrocinadora'                                  );
  C( cTrPlPlanoOrigem                , 'Plano de Origem'                                );
  C( cTrPlDtInscricao                , 'Data de Inscrição'                              );
  C( cTrPlDtBase                     , 'Data Base para Dados'                           );
  C( cTrPlSitFundacao                , 'Situação na Fundação'                           );
  C( cTrPlDtTransacao                , 'Data da Transação'                              );
  C( cTrPlRecebBenef                 , 'Recebendo benefício?'                           );
  C( cTrPlDtSimulacao                , 'Data de Simulação'                              );
  C( cTrPlDtFalecimento              , 'Data de Falecimento'                            );
  C( cTrPlNomeBenef                  , 'Nome do Benefício'                              );
  C( cTrPlSitBenef                   , 'Situação do Benefício'                          );
  C( cTmpSrvFator                    , 'Fator'                                          );
  C( cEmpSimParDtCredito             , 'Data de Crédito'                                );
  C( cEmpSimParDt1aParcela           , 'Data da 1a. Parcela'                            );
  C( cEmpSimParTipoContrato          , 'Tipo de Contrato'                               );
  C( cEmpSimParTipoEmprestimo        , 'Tipo de Empréstimo'                             );
  C( cEmpSimParCarencia              , 'Carência'                                       );
  C( cEmpSimParSaldoAQuitar          , 'Saldo a Quitar'                                 );
  C( cEmpSimParMinimoParcelas        , 'Mínimo de Parcelas'                             );
  C( cEmpSimParMaximoParcelas        , 'Máximo de Parcelas'                             );
  C( cEmpSimParSalarioBase           , 'Salário Base'                                   );
  C( cEmpSimParMargemConsignavel     , 'Margem Consignável'                             );
  C( cEmpSimParReservaPoupanca       , 'Reserva de Poupança'                            );
  C( cEmpSimParTaxaJuros             , 'Taxa de Juros'                                  );
  C( cEmpSimParValorMaximo           , 'Valor Máximo Permitido'                         );
  C( cEmpSimParValorSolicitado       , 'Valor Solicitado'                               );
  //Pendência 24902 - 24/05/2007
  C( cEmpValorMaximo                 , 'Valor Máximo Permitido'                         );
  C( cEmpValorSolicitado             , 'Valor Solicitado'                               );
  //Fim Pendência 24902
  C( cEmpInscPatro                   , 'Patrocinadora'                                  );
  C( cEmpInscPlano                   , 'Plano'                                          );
  C( cEmpInscTpContrato              , 'Tipo de Contrato'                               );
  C( cEmpInscTpEmprestimo            , 'Tipo de Empréstimo'                             );
  C( cEmpInscDtCredito               , 'Data de Crédito'                                );
  C( cEmpInscDtInscricao             , 'Data de Inscrição'                              );
  C( cEmpInscContaBancariaPag        , 'Conta Bancária de Recebimento da Concessão'     );
  C( cEmpInscFormaRecto              , 'Forma de Pagamento das Prestações'              );
  C( cEmpInscFormaPagto              , 'Forma de Recebimento da Concessão'              );
  C( cEmpInscContaBancariaRec        , 'Conta Bancária de Pagamento das Prestações'     );
  C( cEmpExtExpTxJuros               , 'Taxa de Juros'                                  );
  C( cEmpExtAgrTabela                , 'Tabela de Extrato de Empréstimos'               );
  C( cEmpExtAgrNumContrato           , 'Número do Contrato'                             );
  C( cEmpExtAgrEvento                , 'Evento'                                         );
  C( cEmpExtAgrItem                  , 'Item'                                           );
  C( cEmpExtAgrParcela               , 'Parcela'                                        );
  C( cEmpExtAgrSequencial            , 'Seqüencial'                                     );
  C( cEmpExtAgrMesRef                , 'Mês de Referência'                              );
  C( cEmpExtAgrMesCobranca           , 'Mês de Cobrança'                                );
  C( cEmpExtAgrDtVenc                , 'Data de Vencimento'                             );
  C( cEmpExtAgrDtPagto               , 'Data de Pagamento'                              );
  C( cEmpExtAgrValorCalculado        , 'Valor Calculado'                                );
  C( cEmpExtAgrValorEfetivo          , 'Valor Efetivo'                                  );
  C( cEmpExtAgrSaldoDevedor          , 'Saldo Devedor'                                  );
  C( cEmpExtAgrTxJuros               , 'Taxa de Juros'                                  );
  C( cEmpConsContrDtInscricao        , 'Data de Inscrição'                              );
  C( cEmpConsContrDtCredito          , 'Data de Crédito'                                );
  C( cEmpConsContrDt1aParcela        , 'Data da 1a. Parcela'                            );
  C( cEmpConsContrDtCancelamento     , 'Data de Cancelamento'                           );
  C( cEmpConsContrValorContratado    , 'Valor Contratado'                               );
  C( cEmpConsContrTaxaJuros          , 'Taxa de Juros'                                  );
  C( cEmpConsContrValorParcela       , 'Valor da Parcela Base'                          );
  C( cEmpConsContrInscricao          , 'Inscrição no Empréstimo'                        );
  C( cEmpConsInscDetTpEmprestimo     , 'Tipo de Empréstimo'                             );
  C( cEmpConsInscDetTpContrato       , 'Tipo de Contrato'                               );
  C( cEmpConsInscDetPatro            , 'Patrocinadora'                                  );
  C( cEmpConsInscDetPlano            , 'Plano'                                          );
  C( cEmpConsInscDetFormaPagto       , 'Forma de Recebimento da Concessão'              );
  C( cEmpConsInscDetFormaRecto       , 'Forma de Pagamento das Prestações'              );
  C( cEmpConsInscDetContaBancariaP   , 'Conta de Recebimento da Concessão'              );
  C( cEmpConsInscDetNumParcelas      , 'Número de Parcelas'                             );
  C( cEmpConsInscDetMoeda            , 'Moeda'                                          );
  C( cEmpConsInscDetDataCredito      , 'Data de Crédito'                                );
  C( cEmpConsInscDetVlSolicitado     , 'Valor Solicitado'                               );
  C( cEmpConsInscDetNumInscricao     , 'Número da Inscrição'                            );
  C( cEmpConsInscTpEmprestimo        , 'Tipo de Empréstimo'                             );
  C( cEmpConsInscTpContrato          , 'Tipo de Contrato'                               );
  C( cEmpConsInscFormaPagto          , 'Forma de Recebimento da Concessão'              );
  C( cEmpConsInscFormaRecto          , 'Forma de Pagamento das Prestações'              );
  C( cEmpConsInscContaBancariaPag    , 'Conta de Recebimento da Concessão'              );
  C( cEmpConsInscNumeroParcelas      , 'Número de Parcelas'                             );
  C( cEmpConsInscMoeda               , 'Moeda'                                          );
  C( cEmpConsInscDataCredito         , 'Data de Crédito'                                );
  C( cEmpConsInscVlSolicitado        , 'Valor Solicitado'                               );
  C( cEmpConsInscNumInscricao        , 'Número da Inscrição'                            );
  C( cEmpInscNumeroInscricao         , 'Número da Inscrição'                            );
  C( cEmpInscValorSolicitado         , 'Valor Solicitado'                               );
  C( cEmpInscNumParcelas             , 'Número de Parcelas'                             );
  C( cEmpInscMoeda                   , 'Moeda'                                          );
  C( cEmpConsInscDtInscricao         , 'Data da Inscrição'                              );
  C( cEmpConsInscDetDtInscricao      , 'Data da Inscrição'                              );
  C( cEmpConsInscSit                 , 'Situação'                                       );
  C( cEmpConsInscViaWeb              , 'Inscrito via Internet?'                         );
  C( cEmpConsInscDetSit              , 'Situação'                                       );
  C( cEmpConsInscDetViaWeb           , 'Inscrito via Internet?'                         );
  C( cEmpConsInscDetDadosItens       , 'Itens da inscrição'                             );
  C( cEmpInscTxJuros                 , 'Taxa de Juros'                                  );
  C( cEmpConsInscDetTxJuros          , 'Taxa de Juros'                                  );
  C( cEmpConsInscContaBancariaRec    , 'Conta de Pagamento das Prestações'              );
  C( cEmpConsInscDetContaBancariaR   , 'Conta de Pagamento das Prestações'              );
  C( cTelCom                         , 'Comercial'                                      );
  C( cTelPar                         , 'Particular'                                     );
  C( cTelFax                         , 'Fax'                                            );
  C( cTelCel                         , 'Celular'                                        );
  C( cTelRec                         , 'Recado'                                         );
  C( cPais                           , 'País'                                           );
  C( cAltEndPais                     , 'País'                                           );
  C( cDetPlano                       , 'Plano'                                          );
  C( cEmpExtExpSituacao              , 'Situação'                                       );
  C( cEmpExtAgrSituacao              , 'Situação'                                       );
  C( cSaldoDataRef                   , 'Data de Referência'                             );
  C( cSaldoReserva                   , 'Saldo das Reservas'                             );
  C( cEmpSimNumParcSimulaveis        , 'Parcelas a Simular'                             );
  C( cEmpSimSelecTodasParc           , 'Selecionar todas'                               );
  C( cEmpSimCPF                      , 'CPF'                                            );
  C( cEmpInscBeneficiarioContrato    , 'Beneficiários e percentuais do benefício'       );
  C( cEmpInscAvalistaContrato        , 'Avalista'                                       );
  C( cEmpInscConfTpEmprestimo        , 'Tipo de Empréstimo'                             );
  C( cEmpInscConfTpContrato          , 'Tipo de Contrato'                               );
  C( cEmpInscConfPatro               , 'Patrocinadora'                                  );
  C( cEmpInscConfPlano               , 'Plano'                                          );
  C( cEmpInscConfFormaPagto          , 'Forma de Recebimento da Concessão'              );
  C( cEmpInscConfFormaRecto          , 'Forma de Pagamento das Prestações'              );
  C( cEmpInscConfContaBancariaP      , 'Conta de Recebimento da Concessão'              );
  C( cEmpInscConfNumParcelas         , 'Número de Parcelas'                             );
  C( cEmpInscConfMoeda               , 'Moeda'                                          );
  C( cEmpInscConfDataCredito         , 'Data de Crédito'                                );
  C( cEmpInscConfVlSolicitado        , 'Valor Solicitado'                               );
  C( cEmpInscConfNumInscricao        , 'Número da Inscrição'                            );
  C( cEmpInscConfDtInscricao         , 'Data da Inscrição'                              );
  C( cEmpInscConfSit                 , 'Situação'                                       );
  C( cEmpInscConfViaWeb              , 'Inscrito via Internet?'                         );
  C( cEmpInscConfDadosItens          , 'Itens da Inscrição'                             );
  C( cEmpInscConfTxJuros             , 'Taxa de Juros'                                  );
  C( cEmpInscConfContaBancariaR      , 'Conta de Pagamento das Prestações'              );
  C( cEmpInscConfAvalista            , 'Avalista'                                       );
  C( cEmpInscConfBeneficiarios       , 'Beneficiários'                                  );
  C( cEmpContrConfTpEmprestimo       , 'Tipo de Empréstimo'                             );
  C( cEmpContrConfTpContrato         , 'Tipo de Contrato'                               );
  C( cEmpContrConfPatro              , 'Patrocinadora'                                  );
  C( cEmpContrConfPlano              , 'Plano'                                          );
  C( cEmpContrConfFormaPagto         , 'Forma de Recebimento da Concessão'              );
  C( cEmpContrConfFormaRecto         , 'Forma de Pagamento das Prestações'              );
  C( cEmpContrConfContaBancariaP     , 'Conta de Recebimento da Concessão'              );
  C( cEmpContrConfNumParcelas        , 'Número de Parcelas'                             );
  C( cEmpContrConfMoeda              , 'Moeda'                                          );
  C( cEmpContrConfDataCredito        , 'Data de Crédito'                                );
  C( cEmpContrConfVlSolicitado       , 'Valor Solicitado'                               );
  C( cEmpContrConfNumInscricao       , 'Número da Inscrição'                            );
  C( cEmpContrConfNumContrato        , 'Número do Contrato'                             );
  C( cEmpContrConfDtInscricao        , 'Data da Inscrição'                              );
  C( cEmpContrConfSit                , 'Situação'                                       );
  C( cEmpContrConfViaWeb             , 'Inscrito via Internet?'                         );
  C( cEmpContrConfDadosItens         , 'Itens da Contratação'                           );
  C( cEmpContrConfTxJuros            , 'Taxa de Juros'                                  );
  C( cEmpContrConfContaBancariaR     , 'Conta de Pagamento das Prestações'              );
  C( cEmpContrConfAvalista           , 'Avalista'                                       );
  C( cEmpContrConfBeneficiarios      , 'Beneficiários'                                  );
  C( cEmpContrParamConsNumero        , 'Número do contrato'                             );
  C( cEmpContrParamConsSituacao      , 'Situação'                                       );
  C( cEmpContrParamConsTpEmpto       , 'Tipo de Empréstimo'                             );
  C( cEmpContrParamConsTpContrEmptmo , 'Tipo de Contrato'                               );
  C( cEmpExtratoParamNumero          , 'Número do contrato'                             );
  C( cEmpExtratoParamSituacao        , 'Situação'                                       );
  C( cEmpExtratoParamTpEmpto         , 'Tipo de Empréstimo'                             );
  C( cEmpExtratoParamTpContrEmptmo   , 'Tipo de Contrato'                               );
  C( cEmpInscrParamConsNumero        , 'Número do contrato'                             );
  C( cEmpInscrParamConsSituacao      , 'Situação'                                       );
  C( cEmpInscrParamConsTpEmpto       , 'Tipo de Empréstimo'                             );
  C( cEmpInscrParamConsTpContrEmptmo , 'Tipo de Contrato'                               );
  C( cEmpExtAgrSitParcela            , 'Situação da Parcela'                            );
  C( cEmpExtExpSitParcela            , 'Situação da Parcela'                            );
  C( cAltTelLogradouro               , 'Logradouro'                                     );
  C( cAltTelDDI                      , 'DDI'                                            );
  C( cAltTelDDD                      , 'DDD'                                            );
  C( cAltTelNumero                   , 'Número'                                         );
  C( cAltTelComercial                , 'Comercial'                                      );
  C( cAltTelParticular               , 'Particular'                                     );
  C( cAltTelFax                      , 'Fax'                                            );
  C( cAltTelCelular                  , 'Celular'                                        );
  C( cAltTelRecado                   , 'Recado'                                         );
  C( cSitAtuBenefTblNumProcCM        , 'Num. Proc. CM'                                  );
  C( cSitAtuBenefTblNumProcINSS      , 'Num. Proc. INSS'                                );
  C( cSitAtuBenefTblNome             , 'Benefício'                                      );
  C( cSitAtuBenefTblSitBenef         , 'Situação'                                       );
  C( cSitAtuBenefTblTipoPagto        , 'Tipo de Pagamento'                              );
  C( cSitAtuBenefTblFormaPagto       , 'Forma de Pagamento'                             );
  C( cSitAtuBenefTblDtInicioPgto     , 'Dt. Inicio Pgto.'                               );
  C( cSitAtuBenefTblDtFinalPgtoEfet  , 'Dt. Final Pgto.'                                );
  C( cSitAtuBenefTblDtRequerimento   , 'Dt. Requerimento'                               );
  C( cSitAtuBenefDetNumProcCM        , 'Número do Proc. CM'                             );
  C( cSitAtuBenefDetNumProcINSS      , 'Número do Proc. no INSS'                        );
  C( cSitAtuBenefDetNome             , 'Benefício'                                      );
  C( cSitAtuBenefDetSitBenef         , 'Situação'                                       );
  C( cSitAtuBenefDetNumPrcINSSBenAnt , 'Proc. INSS Benef. Ant.'                         );
  C( cSitAtuBenefDetPercGrFamBenAnt  , 'Perc. Gr. Fam. Benef. Ant.'                     );
  C( cSitAtuBenefDetVlBenefInicial   , 'Valor Benef. Inicial'                           );
  C( cSitAtuBenefDetPercGrpFamiliar  , 'Perc. Grupo Familiar'                           );
  C( cSitAtuBenefDetTipoPagto        , 'Tipo de Pagamento'                              );
  C( cSitAtuBenefDetFormaPagto       , 'Forma de Pagamento'                             );
  C( cSitAtuBenefDetDtInicioPgto     , 'Dt. Inicio Pgto.'                               );
  C( cSitAtuBenefDetDtFinalPgtoEfet  , 'Dt. Final Pgto. Efetivo'                        );
  C( cSitAtuBenefDetDtFinalPgtoPrev  , 'Dt. Final Pgto. Previsto'                       );
  C( cSitAtuBenefDetDtRequerimento   , 'Dt. Requerimento'                               );
  C( cSitAtuBenefDetDtConcessao      , 'Dt. Concessão'                                  );
  C( cSitAtuBenefDetInicioFund       , 'Início na Fundação'                             );
  C( cSitAtuBenefDetVlAtual          , 'Valor Atual'                                    );
  C( cSitAtuBenefDetVlCalculado      , 'Valor Calculado'                                );
  C( cSitAtuBenefDetVlSRB            , 'Valor SRB'                                      );
  C( cSitAtuBenefDetPreparadoAte     , 'Preparado até'                                  );
  C( cSitAtuBenefDetReajustadoAte    , 'Reajustado até'                                 );
  C( cSitAtuBenefDetVlOpcao1         , 'Valor opção 1'                                  );
  C( cSitAtuBenefDetVlOpcao2         , 'Valor opção 2'                                  );
  C( cSitAtuBenefDetVlOpcao3         , 'Valor opção 3'                                  );
  C( cSitAtuBenefDetVlCalcINSS       , 'Valor Calculado do INSS'                        );
  C( cSitAtuBenefDetInicioINSS       , 'Início no INSS'                                 );
  C( cSitAtuBenefDetVlInfINSS        , 'Valor Inf. INSS Ant.'                           );
  C( cSitAtuBenefDetIniBenefAnt      , 'Início Benef. Anterior'                         );
  C( cSitAtuBenefDetValBenefAnt      , 'Valor Benef. Anterior'                          );
  C( cSitAtuBenefDetBenefProvisorio  , 'Benefício Provisório'                           );
  C( cSitAtuBenefDetPossuiAcompINSS  , 'Possui Acomp. INSS'                             );

end;

end.
