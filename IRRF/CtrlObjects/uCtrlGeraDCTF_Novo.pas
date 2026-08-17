//*****************************************************************************************************
//Rotina             : InserirDCTF_DadosAdicionais_O
//N. WO...........   : 13558
//Data da Alteração: : 19/08/2024
//Responsável:       : Arnaldo V. Scarin
//Descrição.......   : Correção para que sejam considerados valores de IOF que foram buscados no Módulo
//                     de Impostos, para situações que as Contribuições não estejam Baixadas
//*****************************************************************************************************
//Rotina             : InserirDCTF_DadosAdicionais_O
//N. WO...........   : 10452
//Data da Alteração: : 07/05/2024
//Responsável:       : Luis Ferrari
//Descrição.......   : Corrigindo para trazer um unico responsavel do CCusto correto
//*****************************************************************************************************
//Rotina             : InserirDCTF_DBDetalhes_O, InserirDCTF_CR_DARF_O, InserirDetalheDARF_O
//N. WO...........   : 8773
//Data da Alteração: : 07/03/2024
//Responsável:       : Paulo Nobre
//Descrição.......   : Implementado nas funções acima a regra de NÃO trazer os tributos:
//                     0473, 1708, 1889, 3223, 3533, 3540, 3556,
//                     3579, 5565, 8045, 9466, 7416, 7431, 5952
//*****************************************************************************************************
//Rotina             : InserirDCTF_DBDetalhes_O, InserirDCTF_CR_DARF_O, InserirDetalheDARF_O
//N. WO...........   : 2061
//Data da Alteração: : 17/08/2023
//Responsável:       : Paulo Nobre
//Descrição.......   : 1.Refazendo a lógica de validação dos períodos em relação a vigência definida
//                       pelo SIG 136949, pois quando virasse o ano, logo nos primeiros meses, não iria
//                       funcionar.
//                     2.Implementado nas funções acima a regra de NÃO trazer os tributos "0561" e "0588"
//                       quando a data de inicio da apuração for maior igual a data da vigencia (01/05/2023).
//*****************************************************************************************************
//Rotina             : CarregaMovimentoDCTF
//N. SIG..........   : 136949
//Data da Alteração: : 26/06/2023
//Responsável:       : Marcos Lima
//Descrição.......   : Removendo os codigos 0588 e 0561 para vigencia superior a maio de 2023
//*****************************************************************************************************
//Rotina             : InserirDCTF_DadosAdicionais_O
//N. SIG..........   : 131234
//Data da Alteração: : 19/12/2022
//Responsável:       : Cássio Florencio Rovaroto
//Descrição.......   : Alteração na forma de recuperação de dados dos responsáveis pela DCTF.
//*****************************************************************************************************
//Rotina             : ExportaResultQuery
//N. SIG..........   : 121825
//Data da Alteração: : 22/12/2021
//Responsável:       : Cássio Florencio Rovaroto
//Descrição.......   : Correção na geração de DCTF retificadora, que apresnetava erros ao carregar guias
//                     DJE com dados do detalhe da guia diferentes do crédito.
//*****************************************************************************************************
//Rotina             : InserirDCTF_DBDetalhes_O
//N. SIG..........   : 121691
//Data da Alteração: : 15/11/2021
//Responsável:       : Cássio Florencio Rovaroto
//Descrição.......   : Correção na apuração de IOF.
//*****************************************************************************************************
//Rotina             : InserirDCTF_DBDetalhes_O
//N. SIG..........   : 118516
//Data da Alteração: : 04/11/2021
//Responsável:       : Edilaine
//Descrição.......   : alteração para considerar lançamentos suspensos de empréstimo
//*****************************************************************************************************
//N. SIG..........   : 113751
//Data da Alteração: : 03/03/2021
//Responsável:       : Edilaine
//Descrição.......   : Alteração das constantes para conta contábil de PIS e Cofins
//*****************************************************************************************************
//Rotina             : InserirDCTF_DBDetalhes_O
//N. SIG..........   : 90708
//Data da Alteração: : 16/01/2020
//Responsável:       : Cássio Florencio Rovaroto
//Descrição.......   : Alteração na forma de recuperação do lançamentos para composição
//                     do débito para as naturezas de rendimento 1708, 5952 e 8045.
//*****************************************************************************************************
//Rotina             : InserirDetalheDJE_R
//N. SIG..........   : 74073
//Data da Alteração: : 11/09/2018
//Alteração Form:    :
//Responsável:       : Andre Imakawa
//Descrição.......   : Verificação por CPF e Valor apenas quando não estiver preenchido IDLANCIRRF e
//                     IDLANCIRRFFOLHABENEF.
//*****************************************************************************************************
//Rotina             : Exporta
//N. SIG..........   : 72056
//Data da Alteração: : 23/07/2018
//Alteração Form:    :
//Responsável:       : Taffarel Sevaybriker
//Descrição.......   : Inclusão da natureza 9466 para geração da R14.
//*****************************************************************************************************
//Rotina             : MontaTabelaData
//N. SIG..........   : 71560
//Data da Alteração: : 12/07/2018
//Alteração Form:    : N/A
//Responsável:       : Taffarel Sevaybriker
//Descrição.......   : Não efetuar a validação de DATAAPURACAO para as naturezas 9466 e 0473.
//*****************************************************************************************************
//Rotina             : InserirDetalheDARF_R
//N. SIG..........   : 68125
//Data da Alteração: : 22/05/2018
//Alteração Form:    : N/A
//Responsável:       : Andre Imakawa
//Descrição.......   : Apenas incluir registro na tabela DCTF_DARFDETALHE quando o campo IDDARF da tabela
//                     DCTF_DARFDETALHE para a DCTF de origem estiver preenchido.
//*****************************************************************************************************
//Rotina             : Exporta
//N. SIG..........   : 67118
//Data da Alteração: : 18/04/2018
//Alteração Form:    : N/A
//Responsável:       : Andre Imakawa
//Descrição.......   : Apenas chamar a rotina que insere a R10 se valor diferente de zero.
//                     Alterado o local onde a variavel iQuantidadeRegistro. Só incrementar caso
//                     inserir registro.
//*****************************************************************************************************
//Rotina             : MontaTabelaData, RetornaPeriodo
//N. SIG..........   : 66440
//Data da Alteração: : 10/04/2018
//Alteração Form:    :
//Responsável:       : Luiz Carlos
//Descrição.......   : Ajuste do arquivo gerado
//*****************************************************************************************************
//Rotina             : InserirDetalheDJE_R
//N. SIG..........   : 64484
//Data da Alteração: : 12/03/2018
//Alteração Form:    : Não teve
//Responsável:       : Darivaldo Alencar
//Descrição.......   : Sub Query retornando mais de uma linha por coluna/Linha
//*****************************************************************************************************
//Rotina             : Exporta
//N. SIG..........   : 63464
//Data da Alteração: : 08/03/2018
//Alteração Form:    :
//Responsável:       : Darivaldo Alencar
//Descrição.......   : Tratamento para campo com valor IRRF zerado não gravar no txt
//*****************************************************************************************************
//Rotina             : InserirDetalheDARF_O
//N. SIG..........   : 61993
//Data da Alteração: : 19/01/2018
//Alteração Form:    :
//Responsável:       : Andre Imakawa
//Descrição.......   : Apenas inserir quando IDDARF  não for NULO
//*****************************************************************************************************
//Rotina             : InserirDCTF_CR_DARF_O
//N. SIG..........   : 61980
//Data da Alteração: : 19/01/2018
//Alteração Form:    :
//Responsável:       : Andre Imakawa
//Descrição.......   : Apenas inserir quando IDDARF  não for NULO
//*****************************************************************************************************
//Rotina             : Exporta
//N. SIG..........   : 56456
//Data da Alteração: : 12/12/2017
//Alteração Form:    :
//Responsável:       : Andre Imakawa
//Descrição.......   : Verificar se o FLGMARCADO = 'S' para entrar na geração do DCTF.
//*****************************************************************************************************
//Rotina             : MontaTabelaData, GerarDCTF, InserirDCTF_DadosAdicionais_O, InserirDCTF_DadosAdicionais_R,
//										 GetVersaoLayoutDCTF, RecuperaDataApuracaoNatureza,
//N. SIG..........   : 48772
//Data da Alteração: : 28/07/2017
//Alteração Form:    :
//Responsável:       : Cássio Rovaroto
//Descrição.......   : Adequações na geração da DCTF que atendam a nova versão 3.4
//*****************************************************************************************************
//Rotina             : InserirDCTF_DBDetalhes_O
//N. SIG..........   : 36178
//Data da Alteração: : 15/05/2017
//Alteração Form:    :
//Responsável:       : Paulo Nobre
//Descrição.......   : Substituição das Rubricas fixas no código pelo respectivo tipo de folha e rubrica
//                     cadastrada na tabela DCTFRUBRICAS
//*****************************************************************************************************
//Rotina             : InserirDCTF_CR_DARF_O, InserirDetalheDARF_O, InserirDetalheDJE_O,
//                     InserirDCTF_CR_DARF_R, InserirDetalheDARF_R, InserirDetalheDJE_R, MontaTabelaData
//N. SIG..........   : 41744_43545
//Data da Alteração: : 05/04/2017
//Alteração Form:    :
//Responsável:       : Paulo Nobre
//Descrição.......   : 1) Inclusão de novos UNION´s contendo seleção para trazer o movimento de DARF´s gravados
//                        na nova tabela IRRFFOLHABENEF, que a principio somente será usada pela GEPAB;
//                     2) Inclusão do campo IDLANCIRRFFOLHABENEF nas tabelas: DCTF_CREDITODETALHE_DARF e
//                        DCTF_DARFDETALHE. Em consequencia disto, este novo campo deverá ser incluido na
//                        lista dos campos dos selects;
//                     3) Inclusão de Rubrica faltante na obtenção do movimento da folha de beneficios
//                     4) Alteração na periodicidade da avaliação de vencimento dos DARF´s (MontaTabelaData)
//*****************************************************************************************************
//Rotina             : InserirDCTF_DBDetalhes_O
//N. SIG..........   : 36032
//Data da Alteração: : 20/12/2016
//Alteração Form:    :
//Responsável:       : Paulo Nobre
//Descrição.......   : Inclusão de Rubricas faltantes na obtenção do movimento da folha de beneficios
//*****************************************************************************************************
//Rotina             : LocalizaDCTF_DetalhamentoDebitos
//N. SIG..........   : 26256
//Data da Alteração: : 08/08/2016
//Alteração Form:    :
//Responsável:       : Darivaldo Alencar/Paulo Nobre
//Descrição.......   : Incluso um novo campo DATAAPURACAO na tabela DCTF_DEBITODETALHE
//                     com isso foi refeito todo o conceito de apuração do valor dos DÉBITOS
//                     Agora eles são rateados de acordo com a pariodicidade do Tributo
//                     e passará a ficar igual ao rateio dos CRÉDITOS.
//*****************************************************************************************************
//Rotina             : GRegDadosPrincipais
//N. SOL..........   : 269633
//N. PPM..........   : 1337929
//Data da Alteração: : 24/02/2016
//Alteração Form:    :
//Responsável:       : Paulo Nobre
//Descrição          : Alterações por conta dos acertos na BUSCA 2015
//*****************************************************************************************************
//Rotina            : InserirDCTF_CR_DARF_O
//N. SOL.........   : 263331
//N. PPM.........   : 1115142
//Data da Alteração : 09/10/2015
//Alteração Form    :
//Responsável       : Paulo Nobre
//Descrição         : Acerto na soma dos alteradores com o valor do DARF
//***************************************************************************************
//Rotina                : InserirDCTF_DBDetalhes_O
//N. Sol..........      : 262362
//N. PPM..........      : 1084801
//Data da Alteração:    : 18/09/2015
//Alteração Form:       :
//Responsável:          : Paulo Nobre
//Descrição.......      : Retirada de Rubricas lançadas de forma equivocada
//***************************************************************************************
//Rotina                : InserirDetalheDARF_R, InserirDetalheDJE_R, Exporta
//N. Sol..........      : 256772
//N. PPM..........      : 964770
//Data da Alteração:    : 01/06/2015
//Alteração Form:       :
//Responsável:          : Paulo Nobre
//Descrição.......      : 1) Inclusa condições para que possa ser gerado registros de detalhes
//                           de DARF e DJE com valores nulos no IDDARF e IDLANCIRRF;
//                        2) Na geração do arquivo foi inclusa condição de não gerar os
//                           lançamentos desmarcados (FLGMARCADO = 'N');
//***************************************************************************************
//Rotina                : InserirDetalheDARF_R, InserirDetalheDJE_R
//N. Sol..........      : 254607
//N. PPM..........      : 801620
//Data da Alteração:    : 21/05/2015
//Alteração Form:       :
//Responsável:          : Paulo Nobre
//Descrição.......      : Inclusa a condição do "IDDARF IS NOT NULL"
//***************************************************************************************
//Rotina                : Exporta
//N. Sol..........      : 252107
//N. PPM..........      : 780490
//Data da Alteração:    : 14/04/2015
//Alteração Form:       :
//Responsável:          : Paulo Nobre
//Descrição.......      : Permitir que somente seja igualado o valor do DB = CR quando for
//                        a Natureza '7893' - IOF - SOBRE EMPRÉSTIMOS A PARTICIPANTES
//***************************************************************************************
//Rotina                : InserirDCTF_DBDetalhes_O
//N. Sol..........      : 250991
//N. PPM..........      : 725121
//Data da Alteração:    : 17/03/2015
//Alteração Form:       :
//Responsável:          : Paulo Nobre
//Descrição.......      : Melhorando performance:
//                         1) Unificação dos selects individuais num só para todos os impostos.
//                         2) Retirada de subselects juridicos desnecessários.
//*******************************************************************************************************
//Rotina                : MontaTabelaData
//N. Sol..........      : 249454
//N. PPM..........      : 703267
//Data da Alteração:    : 26/02/2015
//Alteração Form:       :
//Responsável:          : Paulo Nobre
//Descrição.......      : Na periodicidade Diária, considerar sempre o dia 20 para inicio e fim
//*******************************************************************************************************
//Rotina                : GRegDadosPrincipais
//N. Sol..........      : 246475
//N. PPM..........      : 636290
//Data da Alteração:    : 14/01/2015
//Alteração Form:       :
//Responsável:          : Paulo Nobre
//Descrição.......      : Acertando os anos de referência e competência na geração do Arquivo
//*******************************************************************************************************
//Rotina            : InserirDCTF_CR_DARF_O
//N. SOL.........   : 243671
//N. PPM.........   : 595596
//Data da Alteração : 25/11/2014
//Alteração Form    :
//Responsável       : Paulo Nobre
//Descrição         : Acerto na geração do lançamento dos DARF´s (Alterador)
//*******************************************************************************************************
//Rotina            : GeraCreditoDJE
//N. SOL.........   : 241790
//N. PPM.........   : 558107
//Data da Alteração : 22/10/2014
//Alteração Form    :
//Responsável       : Paulo Nobre
//Descrição         : Acerto na geração do registro tipo R14 - DJE´s
//*******************************************************************************************************
//Rotina            : InserirDCTF_CR_DARF_O, InserirDetalheDJE_O, InserirDCTF_CR_DARF_Avulsa
//N. SOL.........   : 241634
//N. PPM.........   : 556541
//Data da Alteração : 20/10/2014
//Alteração Form    :
//Responsável       : Paulo Nobre
//Descrição         : Acerto no SQL que monta as DJE´s, pois faltou o JOIN pelo campo IDPROCJUD entre as
//                    tabelas LANCIRRF e PROCJUD;
//                    Acerto na formação do campo virtual REFERENCIA (Identificador do depósito)
//*******************************************************************************************************
//Rotina            : Diversas funções
//N. SOL.........   : 235337_16319
//N. PPM.........   : 457199
//Data da Alteração : 15/07/2014
//Alteração Form    :
//Responsável       : Paulo Nobre
//Descrição         : Adaptações na funcionalidade para atender legislação da RF sobre mudanças no layout
//                    da DCTF da versão 2.5 p/ a versão 3.1 conforme detalhamentos constante na EF.
//                    Refeito todo o SQL da função: InserirDCTF_DadosAdicionais_O
//*******************************************************************************************************
//Rotina            : LocalizaDCTF_ConciliacaoIndividualCPF, InserirDCTF_DBDetalhes_O
//N. SOL.........   : 239704
//N. PPM.........   : 523138
//Data da Alteração : 19/09/2014
//Alteração Form    : FGeraDCTF_Novo
//Responsável       : Paulo Nobre
//Descrição         : InserirDCTF_DBDetalhes_O - No select do IOF, foi colocado um NVL para proteger do
//                    NULL em HME.FLGBAIXADO IS NULL
//*******************************************************************************************************
//Rotina            : InserirDetalheDJE_O
//N. SOL.........   : 238778
//N. PPM.........   : 512818
//Data da Alteração : 04/09/2014
//Alteração Form    : FGeraDCTF_Novo
//Responsável       : Paulo Nobre
//Descrição         : 1) A pedido do Gestores a view de acesso ao PROJURID não será mais usada, voltando
//                       a ser usada a tabela PROCJUD.
//                    2) Trocado o default do IDPESSOA do Representante Legal (dados adicionais) para o novo Diretor.
//                    3) Trocado o default da Forma de Tributação do Lucro (dados adicionais) p/ = "5" - Isenta de IRRJ.
//                    4) Acerto na apuração dos lançamentos gerados no arquivo de envio, referente a periodicidade
//                       de cada Tributo.
//*******************************************************************************************************
//Rotina            : InserirDetalheDJE_O
//N. SOL.........   : 235562
//N. PPM.........   : 461564
//Data da Alteração : 23/07/2014
//Alteração Form    : FGeraDCTF_Novo
//Responsável       : Paulo Nobre
//Descrição         : Acerto no join de relação entre as tabelas LANCIRRF e PESSOA
//                    Acerto no campo NOMEVARA para ter 30 caracteres
//*******************************************************************************************************
//Rotina             : AcertarProcessosDJE, InserirDetalheDJE_O
//N. Sol..........   : 232145
//N. Kintana......   : 385264
//Data da Alteração: : 19/05/2014
//Alteração Form:    : FGeraDCTF_Novo
//Responsável:       : Paulo Nobre
//Descrição          : Retirada da Procedure "AcertarProcessosDJE(pIdDCTF: String);"
//                     por ser totalmente desnecessária.
//                     Alterada a função InserirDetalheDJE_O:
//                   :  - Substituída a tabela PROCJUD, pois o módulo SISTJURCONS vai ser desativado,
//                   :    pela view VW_RELPROCJUDTOTAL do sistema PROJURID p/ obter os dados do processo
//                        judicial mais correto e atual.
//*******************************************************************************************************
//Rotina             : InserirDCTF_DBDetalhes_O
//N. Sol..........   : 230353
//N. Kintana......   : 352271
//Data da Alteração: : 10/04/2014
//Alteração Form:    : FGeraDCTF_Novo
//Responsável:       : Paulo Nobre
//Descrição.......   : Acerto na função "InserirDCTF_DBDetalhes_O" para corrigir condições equivocadas:
//                     1) Rubricas indevidas - Folha de Pagamento Empregados - tributo 0561
//                     2) Contas contábeis - tributos 4574 e 7987
//*****************************************************************************************************
//N. Sol..........: 126088_1342
//N. Kintana......: 784469
//Data............: 25/03/2013
//Responsável.....: Paulo Nobre
//Descrição.......: Inclusão de novas funções para uso no novo gerador da DCTF
//*****************************************************************************************************
Unit uCtrlGeraDCTF_Novo;

Interface

Uses Sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient, Classes,
  ucmFileUtils, wwQuery, Dialogs, Mask, Controls, uMensErro, uDiasUteis, uFuncoesUteisIR,
  DBaseDados, FProgresso, forms, uCMClientDataSet;

Const
  sTerminador = '';                               // EOL - HEXADECIMAL '0D0A'
  // SOL 235337/16319 PPM 457199 - Paulo Nobre
  //   sNumVersaoLayout = '240'; // Versão do layout da RF
  //   sNumVersaoSoftware := '2.5'; // Versão do software da RF

  // Sugestão: Estas variáveis abaixo, no futuro, poderão ser parametrizadas
  // na funcionalidade de Parametros Gerais do Módulo de Impostos.
  //SIG48772 - Início
  //sNumVersaoLayout = '310'; // Versão do layout da RF
  sNumVersaoSoftware = '3.4';                     // Versão do software da RF
  //SIG48772 - Fim

  //edilaine SIG113751 : inicio
  //sContaContabilPIS = '2124030101'; // Conta Contábil do PIS
  //sContaContabilCOFINS = '2124030201'; // Conta Contábil do COFINS

  sContaContabilPIS = '20102040101';              // Conta Contábil do PIS
  sContaContabilCOFINS = '20102040201';           // Conta Contábil do COFINS
  //edilaine SIG113751 : fim

  // Paulo Nobre WO2061 - Inicio
  sDataInicioVigencia = '01/05/2023';             // Fixado como ponto de corte
  // Paulo Nobre WO2061 - Fim

Type

  TOutrosDados = Record
    sODAnoMesApuracao: String;
    sODAnoApuracao: String;
    sODMesApuracao: String;
    sODDataInicioApuracao: String;
    sODDataFimApuracao: String;
    sODSituacao: String;
    sODInicioPeriodo: String;
    sODFinalPeriodo: String;
    sODDataOcorrencia: String;
    sODNaturezaJuridica: String;
    sODQualificacao: String;
    sODTribLucro: String;
    sODTipoDeclaracao: String;
    sODBalancoReducao: String;
    sODLevantouBalanco: String;
    sODComDebitoSCP: String;
    sODDBSCPINC: String;
    sODCritRecon: String;
    sODRegimeApuContrib: String;
    sODSituacaoPJ: String;
    sODOpcaoLEI: String;
    sVersaoLayout: String;
    //SIG 48772 - Início
    sODOptSimples: String;
    sODOptCPRB: String;
    sODInativa: String;
    //SIG 48772 - Fim
  End;

  TCtrlGeraDCTF_Novo = Class(TCmControlObject)

  Private
    ArquivoEnvioRFB: TextFile;
    cdsTabelaComPeriodicidades: TClientDataSet;
    rOutrosDados: TOutrosDados;

    // Carrega Cidade, Estado e Pais da Fundacao
    Procedure CarregarCidadeEstadoPaisSistema;

  Protected
    Procedure DoChangeDataBase; Override;

  Public
    sNumVersaoSoft: String;
    Constructor Create; Override;
    Destructor Destroy; Override;

    Procedure MontaTabelaData(psPeriodicidade, psMesAno, psNatureza: String; piIDDCTF: integer);

    Function TiraMascara(wTexto: String): String;
    Function PadLeft(aStr: String; aSize: Integer; aCh: char = ' '): String;
    Function PadRight(aStr: String; aSize: Integer; aCh: char = ' '): String;
    Function ValidaNumeroRecibo(pNumero: String): Boolean;
    Function AcharTexto(sTag, sString: String): boolean;
    Function PrepararFloat(sString: String): String;
    Function PegaValorDoCampo(sTag, sLinha: String): String;
    Function TrocaTexto(sString: String; sOld: String; sNew: String; bInsensitive: boolean = true): String;
    Function ChecaSeNumero(Const pCampo: String): Boolean;
    Function CompletaEspaco(sNome: String; iTam: integer): String;
    Function CompletaZero(sNome: String; iTam: integer): String;
    Function GetVersaoLayoutDCTF: String;
    Function RecuperaDataApuracaoNatureza(psNatureza: String; piIDDCTF: Integer): OLEVariant;
    //
    // ********************************************* DCTF ******************************************************
    //
    Function GerarDCTF(Const pAno, pMes, pTipoDCTF: String; pDtInicioApu, pDtFimApu: TDateTime; pVersao, pIdFormTribLucro, pIdQualifPj, pIdCritRecon,
      pIdRegimeApur, pIdSituacaoPj, pIdOpcaoLei, pFlgBalanSusp, pFlgDebScp, pOptSimples,
      pOptCprb, pFlgInativa: Integer): Boolean;
    //
    // ******** Inserções da Original
    //
    Function InserirDCTF_DBDetalhes_O(Const pIdDCTF: Integer; pAno, pMes: String; pDtInicioApu, pDtFimApu: TDateTime): Boolean;
    // Paulo Nobre - SIG 41744_43545 - Inicio
    Function InserirDCTF_CR_DARF_O(Const pIdDCTF, pIdChave {, pTipoChave}: Integer; pDtInicioApu, pDtFimApu: TDateTime): Boolean;
    Function InserirDetalheDARF_O(Const pIdDCTF, pIdChave {, pTipoChave}: Integer; pDtInicioApu, pDtFimApu: TDateTime): Boolean;
    Function InserirDetalheDJE_O(Const pIdDCTF, pIdChave {, pTipoChave}: Integer; pDtInicioApu, pDtFimApu: TDateTime): Boolean;
    // Paulo Nobre - SIG 41744_43545 - Fim

    Function InserirDCTF_DadosAdicionais_O(Const pIdDCTF: Integer; pMes: String; pVersao, pIdFormTribLucro, pIdQualifPj, pIdCritRecon,
      pIdRegimeApur, pIdSituacaoPj, pIdOpcaoLei, pFlgBalanSusp, pFlgDebScp, pOptSimples,
      pOptCprb, pFlgInativa: Integer): Boolean;
    //
    // ******** Inserções da Retificadora
    //
    Function InserirDCTF_DBDetalhes_R(Const pIdDCTF, pIdDCTF2: Integer): Boolean;
    // Paulo Nobre - SIG 41744_43545 - Inicio
    Function InserirDCTF_CR_DARF_R(Const pIdDCTF, pIdDCTF2: Integer): Boolean;
    Function InserirDetalheDARF_R(Const pIdDCTF, pIdDCTF2: Integer): Boolean;
    Function InserirDetalheDJE_R(Const pIdDCTF, pIdDCTF2: Integer): Boolean;
    // Paulo Nobre - SIG 41744_43545 - Fim
    Function InserirDCTF_CR_DCOMP_R(Const pIdDCTF, pIdDCTF2: Integer): Boolean;
    Function InserirDCTF_DadosAdicionais_R(Const pIdDCTF, pIdDCTF2: Integer): Boolean;
    //
    // ******** Localizadores dos Movimento da DCTF Gerada
    //
    Function LocalizaDCTF_MovSintetico: String;
    Function LocalizaDCTF_DetalhamentoDebitos: String;
    Function LocalizaDCTF_DetalhamentoCreditos: String;
    Function LocalizaDCTF_TotalDetalhamentoCreditos: String;
    Function LocalizaDCTF_ConciliacaoIndividualCPF: String;
    Function LocalizaDCTF_DadosAdicionais: String;

    Function ExportaResultQuery(sCaminho: String; pIdDCTF, pIdDCTF2: Integer): Boolean;
    //
    // *********************** FUNÇÕES DE GERAÇÃO DO ARQUIVO DE ENVIO A RFB **************************
    //
    Function RetornaPeriodo(psPeriodicidade, psPeriodoApuracao: String): String;
    Function CriaArquivo(sArquivo: String): Boolean;
    Procedure GravaLinha(sArquivo, sLinha: String);

    Function Exporta(
      sArquivo: String;
      pQryDCTFGeradas,
      pQryDCTFMovSintetico,
      pQryDCTFDetDebitos,
      pQryDCTFDetCreditos,
      pQryDadosAdicionais: TwwQuery): Boolean;

    Function GeraHeader(
      psAnoDeclaracao,
      psMesDeclaracao,
      psTipoDeclaracao,
      psCNPJ,
      psNomeEmpresarial,
      psUF,
      psSituacao,
      psPeriodoInicial,
      psPeriodoFinal,
      psDataOcorrencia,
      psNumVersaoLayout: String): String;

    // SOL 235337/16319 PPM 457199 - Paulo Nobre
    Function GeraDadosIniciais(
      psCNPJ,
      psAnoMesApuracao,
      psSituacao,
      psDataEvento,
      psDiaMesInicial,
      psDiaMesFinal,
      psRetificadora,
      psNumRecibo,
      psFormaTributacao,
      psQualificacaoPJ,
      psLevantouBalanco,
      psComDebitoSCP,
      psCritRecon,
      psRegimeApuContrib,
      psSituacaoPJ,
      psOpcaoLEI,
      psOptanteSimples,
      psOptanteCPRB,
      psInativa: String): String;
    //
    Function GeraDadosCadastraisEstabelecimento(
      psCNPJ,
      psAnoMesApuracao,
      psSituacao,
      psDataEvento,
      psNomeEmpresarial,
      psCodNaturezaJuridica,
      psLogradouro,
      psNumero,
      psComplemento,
      psBairro,
      psMunicipio,
      psUF,
      psCEP,
      psDDDTelefone,
      psTelefone,
      psDDDFax,
      psFax,
      psCaixaPostal,
      psUFCaixaPostal,
      psCEPCaixaPostal,
      psEMail: String): String;

    Function GeraDadosResponsavelxRepresentante(
      psCNPJ,
      psAnoMesApuracao,
      psSituacao,
      psDataEvento,
      psNomeRepresentante,
      psCPFRepresentante,
      psDDDTelRepresentante,
      psTelRepresentante,
      psRamalTelRepresentante,
      psDDDFaxRepresentante,
      psFaxRepresentante,
      psEMailFaxRepresentante,
      psNomeResponsavel,
      psCPFResponsavel,
      psCRCResponsavel,
      psUFResponsavel,
      psDDDTelResponsavel,
      psTelResponsavel,
      psRamalTelResponsavel,
      psDDDFaxResponsavel,
      psFaxResponsavel,
      psEMailFaxResponsavel: String): String;

    Function GeraDebitoApurado(
      psCNPJ,
      psAnoMesApuracao,
      psSituacao,
      psDataEvento,
      psGrupoTributo,
      psCodigoReceita,
      psPeriodicidade,
      psAnoPeriodoApuracao,
      psMBQSPeriodo,
      psDSQDPeriodo,
      psOrdemEstabelecimento,
      psCNPJIncorporacao,
      psValorDebito,
      psBalancoReducao,
      psDivideQuotas,
      psODDBSCPINC: String): String;

    Function GeraCreditoDARF(
      psCNPJ,
      psAnoMesApuracao,
      psSituacao,
      psDataEvento,
      psGrupoTributo,
      psCodigoReceita,
      psPeriodicidade,
      psAnoPeriodoApuracao,
      psMBQSPeriodo,
      psDSQDPeriodo,
      psOrdemEstabelecimento,
      psCNPJIncorporacao,
      psPeriodoApuracao,
      psCNPJdoDARF,
      psCodigoReceitaDARF,
      psDataVencimento,
      psNumReferencia,
      psValorPrincipal,
      psValorMulta,
      psValorJuros,
      psValorPagoDebito: String): String;

    Function GeraCreditoDJE(
      psCNPJ,
      psAnoMesApuracao,
      psSituacao,
      psDataEvento,
      psGrupoTributo,
      psCodigoReceita1,
      psPeriodicidade,
      psAnoPeriodoApuracao,
      psMBQSPeriodo,
      psDSQDPeriodo,
      psOrdemEstabelecimento,
      psCNPJIncorporacao,
      psValorSuspensoDebito,
      psMotivoSuspensao,
      psDeposito,
      psNumeroProcesso,
      psVara,
      psMunicipio,
      psUF,
      psIdentificaDebito,
      psPEriodoApuracao,
      psCPF_CNPJ,
      psCodigoReceita2,
      psDataVencimento,
      psValorPrincipal,
      psValorMulta,
      psValorJuros: String): String;

    Function GeraCompensacaoPagamentoIndevido(
      psCNPJ,
      psAnoMesApuracao,
      psSituacao,
      psDataEvento,
      psGrupoTributo,
      psCodigoReceita,
      psPeriodicidade,
      psAnoPeriodoApuracao,
      psMBQSPeriodo,
      psDSQDPeriodo,
      psOrdemEstabelecimento,
      psCNPJIncorporacao,
      psValorCompensadoDebito,
      psFormalizaPedido,
      psPERDCOMP: String): String;

    Function GeraTrailler(
      psCNPJ,
      psAnoMesApuracao,
      psSituacao,
      psDataEvento,
      psQuantidadeRegistro: String): String;
  Protected

  End;

Implementation

{ TCtrlGeraDCTF_Novo }

Var FundacaoCidade: Integer;
  FundacaoEstado: String;
  FundacaoPais: Integer;

  // Paulo Nobre WO2061 - Inicio
  sAnoMesVigencia, sAnoMesRefer: String;
  // Paulo Nobre WO2061 - Fim

Constructor TCtrlGeraDCTF_Novo.Create;
Begin
  Inherited;
  cdsTabelaComPeriodicidades := TClientDataSet.Create(Nil);

  //SIG 48772 - Início
  //sNumVersaoSoft := sNumVersaoSoft; // Versão do software da RF
  //SIG 48772 - Fim
End;

Destructor TCtrlGeraDCTF_Novo.Destroy;
Begin
  Inherited;
  cdsTabelaComPeriodicidades.free;
End;

Procedure TCtrlGeraDCTF_Novo.DoChangeDataBase;
Begin
  Inherited;
End;

//
//******************** FUNÇÕES BÁSICAS ***********************************************************
//

Function TCtrlGeraDCTF_Novo.CompletaEspaco(sNome: String; iTam: integer): String;
Var
  i, k: integer;
  Espacos: String;
Begin
  If Length(sNome) > iTam Then
    sNome := Copy(sNome, 1, iTam);

  sNome := trim(sNome);
  i := length(sNome);
  Espacos := '';
  For k := 1 To (iTam - i) Do
    Espacos := Espacos + ' ';

  Result := sNome + Espacos;
End;

Function TCtrlGeraDCTF_Novo.CompletaZero(sNome: String; iTam: integer): String;
Var i, k: integer;
Begin
  If Length(sNome) > iTam Then
    sNome := Copy(sNome, 1, iTam);

  sNome := trim(sNome);
  i := length(sNome);
  Result := '';
  For k := 1 To (iTam - i) Do
    Result := Result + '0';
  Result := Result + sNome;
End;

Function TCtrlGeraDCTF_Novo.PadLeft(aStr: String; aSize: Integer; aCh: char = ' '): String;
Begin
  While Length(aStr) < aSize Do
    aStr := aCh + aStr;

  Result := aStr;
End;

Function TCtrlGeraDCTF_Novo.TiraMascara(wTexto: String): String;
Var
  wCon, wCC: Integer;
  wRet, wParte: String;
Begin
  wRet := '';
  wCC := Length(wTexto);
  For wCon := 1 To wCC Do
  Begin
    wParte := copy(wTexto, wCon, 1);
    If (wParte <> '.') And (wParte <> '-') And
      (wParte <> '/') And (wParte <> ' ') And
      (wParte <> ',') And (wParte <> '*') Then
      wRet := wRet + wParte;
  End;
  TiraMascara := wRet;
End;

Function TCtrlGeraDCTF_Novo.PadRight(aStr: String; aSize: Integer; aCh: char): String;
Begin
  While Length(aStr) < aSize Do
    aStr := aStr + aCh;

  Result := aStr;
End;

Function TCtrlGeraDCTF_Novo.AcharTexto(sTag, sString: String): boolean;
Begin
  Result := Pos(UpperCase(sTag), UpperCase(sString)) > 0;
End;

Function TCtrlGeraDCTF_Novo.PrepararFloat(sString: String): String;
Begin
  Result := sString;
  Result := TrocaTexto(Result, '.', DecimalSeparator);
  Result := TrocaTexto(Result, ',', DecimalSeparator);
End;

Function TCtrlGeraDCTF_Novo.PegaValorDoCampo(sTag, sLinha: String): String;
Var iTamTag, iInicioTag: integer;
Begin
  Result := '';
  sLinha := Trim(sLinha);
  If AcharTexto('>', sLinha) Then
  Begin
    iTamTag := Length(sTag) + 1;
    iInicioTag := Pos('</', sLinha);
    Result := copy(sLinha, iTamTag, iInicioTag - iTamTag);
  End;
End;

Function TCtrlGeraDCTF_Novo.TrocaTexto(sString: String; sOld: String; sNew: String; bInsensitive: boolean = true): String;
Var
  iPosition: integer;
  sTemp: String;
Begin
  iPosition := 1;
  sTemp := '';
  While (iPosition > 0) Do
  Begin
    If bInsensitive Then
      iPosition := AnsiPos(UpperCase(sOld), UpperCase(sString))
    Else
      iPosition := AnsiPos(sOld, sString);
    If (iPosition > 0) Then
    Begin
      sTemp := sTemp + copy(sString, 1, iPosition - 1) + sNew;
      sString := copy(sString, iPosition + Length(sOld), Length(sString));
    End;
  End;
  sTemp := sTemp + sString;
  Result := (sTemp);
End;

Function TCtrlGeraDCTF_Novo.ChecaSeNumero(Const pCampo: String): Boolean;
Var
  ch, i: byte;
Begin
  Result := True;
  For i := 1 To Length(pCampo) Do
  Begin
    ch := ord(pCampo[i]);
    If Not (ch In [48..57]) Then
    Begin
      Result := False;
      Break;
    End;
  End;
End;

/////////////////////////////////////////////////////////////////////////////
//Função de validação do Numero do Recibo de envio das Declarações do IRRF
/////////////////////////////////////////////////////////////////////////////

Function TCtrlGeraDCTF_Novo.ValidaNumeroRecibo(pNumero: String): Boolean;
Var
  Recibo: Array[1..12] Of integer;
  apoio: Array[0..12] Of integer;
  f: integer;
  total: integer;
  D1: integer;                                    //primeiro dígito calculado
  D2: integer;                                    //segundo dígito calculado
Begin
  If pNumero = '' Then
  Begin
    result := True;                               // Para permitir estornar um numero de recibo informado
    exit;
  End;

  If pNumero = '000000000000' Then
  Begin
    result := false;
    exit;
  End;

  //Primeiro teste: o número de algarismos
  If (Length(pNumero) <> 12) Then
    result := false
  Else
  Begin
    //Antes do teste propriamente dito temos que montar a matriz com os
    //os algarismos do número e depois uma matriz apoio que terá os números
    //que ajudarão a verificar so dígitos verificadores
    //
    //Monta matriz Recibo
    For f := 1 To 12 Do
      Recibo[f] := strtoint(pNumero[f]);
  End;
  // Monta matriz de apoio - Módulo 11 com pesos de 2 a 9 da direita p/ esquerda
  apoio[0] := 4;                                  //só será usada no cálculo do segundo dígito verificador
  apoio[1] := 3;
  apoio[2] := 2;
  apoio[3] := 9;
  apoio[4] := 8;
  apoio[5] := 7;
  apoio[6] := 6;
  apoio[7] := 5;
  apoio[8] := 4;
  apoio[9] := 3;
  apoio[10] := 2;
  // Começa cálculo do primeiro dígito verificador
  total := 0;                                     // variável que conterá a soma da operação com os números
  For f := 1 To 10 Do
    total := total + (Recibo[f] * apoio[f]);

  D1 := total Mod 11;
  If (D1 < 2) Then
    D1 := 0
  Else
    D1 := 11 - D1;
  If (D1 <> Recibo[11]) Then
  Begin
    // Primeiro dígito verificador não confere
    Result := false;
  End
  Else
  Begin
    // Entrou aqui, então o primeiro dígito confere!
    total := 0;
    For f := 0 To 10 Do
    Begin
      total := total + (Recibo[f + 1] * apoio[f]);
    End;
    D2 := total Mod 11;
    If (D2 < 2) Then
      D2 := 0
    Else
      D2 := 11 - D2;
    If (D2 <> Recibo[12]) Then
    Begin
      // Segundo digito verificador não confere
      Result := false;
    End
    Else
      Result := true;
  End;
End;

// ***************************************************************************************************************
// Funções usadas no Form de Geração da DCTF
// ***************************************************************************************************************

Function TCtrlGeraDCTF_Novo.GerarDCTF(Const pAno, pMes, pTipoDCTF: String; pDtInicioApu, pDtFimApu: TDateTime; pVersao, pIdFormTribLucro, pIdQualifPj, pIdCritRecon,
  pIdRegimeApur, pIdSituacaoPj, pIdOpcaoLei, pFlgBalanSusp, pFlgDebScp, pOptSimples,
  pOptCprb, pFlgInativa: Integer): Boolean;
Var sNumRecAnt, sNumVersaoSoftware, sNumVersaoLayout: String;
  _qryAux, _qryAux2, _qryInserirDCTF, _InserirDCTF_DBDetalhes: TwwQuery;
Begin
  Result := True;
  MessageInfo := '';
  sNumRecAnt := '000000000000';
  _qryAux := TwwQuery.Create(Nil);
  _qryAux2 := TwwQuery.Create(Nil);
  _qryInserirDCTF := TwwQuery.Create(Nil);
  _InserirDCTF_DBDetalhes := TwwQuery.Create(Nil);

  _qryAux.DatabaseName := DataBaseName;
  _qryAux2.DatabaseName := DataBaseName;
  _qryInserirDCTF.DatabaseName := DataBaseName;
  _InserirDCTF_DBDetalhes.DatabaseName := DataBaseName;

  sNumVersaoSoftware := IntToStr(pVersao);
  sNumVersaoLayout := IntToStr(pVersao);

  // Paulo Nobre WO2061 - Inicio
  sAnoMesVigencia := '202305';                    // Fixado como ponto de corte: Ano = 20233  Mês = 05
  sAnoMesRefer := pAno + pMes;
  // Paulo Nobre WO2061 - Fim

  If pTipoDCTF = 'R' Then
  Begin
    // Retificadora, deve ser recuperado os dados da ultima declaração (O ou R) (MAX) dentro do ano + mes !!!
    _qryAux2.Close;
    _qryAux2.SQL.Clear;
    _qryAux2.SQL.add('SELECT D.IDDCTF, D.NUMRECIBO, D.NUMRECIBOANT   ');
    _qryAux2.SQL.add('FROM DCTF D      ');
    _qryAux2.SQL.add('WHERE D.IDDCTF = (SELECT MAX(D1.IDDCTF)  ');
    _qryAux2.SQL.add('      FROM DCTF D1                 ');
    _qryAux2.SQL.add('      WHERE D1.EXERCICIODCTF = ' + quotedstr(pAno));
    _qryAux2.SQL.add('      AND D1.MESDCTF = ' + quotedstr(pMes) + ' )');
    _qryAux2.Open;
    Result := (Not _qryAux2.EOF);
    sNumRecAnt := _qryAux2.fieldByname('NUMRECIBO').asString;
  End;

  _qryAux.Close;
  _qryAux.SQL.Clear;
  _qryAux.SQL.add('SELECT SEQDCTF.NEXTVAL SEQ FROM DUAL    ');
  _qryAux.Open;

  // Inserindo DCTF
  _qryInserirDCTF.Close;
  _qryInserirDCTF.SQL.Clear;
  _qryInserirDCTF.SQL.add('INSERT INTO DCTF     ');
  _qryInserirDCTF.SQL.add('(IDDCTF, EXERCICIODCTF, MESDCTF, NUMRECIBOANT, DATAINICIOAPURACAO, DATAFIMAPURACAO, TIPODCTF,   ');
  _qryInserirDCTF.SQL.add(' NUMVERSAOSOFT, NUMVERSAOLAYOUT, FLGARQUIVOGERADO, FLGREGEXCLUIDO, TRGDTEXCLUSAO, TRGUSEREXCLUSAO) ');
  _qryInserirDCTF.SQL.add('VALUES (:p1, :p2, :p3, :p4, :p5, :p6, :p7, :p8, :p9, :p10, :p11, NULL, NULL  )   ');
  _qryInserirDCTF.ParamByName('p1').asInteger := _qryAux.fieldByname('SEQ').asInteger;
  _qryInserirDCTF.ParamByName('p2').asString := pAno;
  _qryInserirDCTF.ParamByName('p3').asString := pMes;
  _qryInserirDCTF.ParamByName('p4').asString := sNumRecAnt;
  _qryInserirDCTF.ParamByName('p5').asDateTime := pDtInicioApu;
  _qryInserirDCTF.ParamByName('p6').asDateTime := pDtFimApu;
  _qryInserirDCTF.ParamByName('p7').asString := pTipoDCTF;
  _qryInserirDCTF.ParamByName('p8').asString := sNumVersaoSoftware; // Versão do software da RF
  _qryInserirDCTF.ParamByName('p9').asString := sNumVersaoLayout; // Versão do layout da RF
  _qryInserirDCTF.ParamByName('p10').asString := 'N'; // Arquivo não gerado;
  _qryInserirDCTF.ParamByName('p11').asString := 'N'; // Reg. não excluido
  If Not _qryInserirDCTF.Prepared Then
    _qryInserirDCTF.Prepare;
  _qryInserirDCTF.ExecSQL;
  If _qryInserirDCTF.RowsAffected > 0 Then
  Begin
    If pTipoDCTF = 'O' Then                       // Original
    Begin
      // **** Inserir Detalhamento dos Débitos
      If Not InserirDCTF_DBDetalhes_O(_qryAux.fieldByname('SEQ').asInteger, pAno, pMes, pDtInicioApu, pDtFimApu) Then
        Result := False;
      //
      // **** Inserir Detalhamento dos Créditos
      //
      // *************** Inserir DARF´s
      // Paulo Nobre - SIG 41744_43545 - Inicio
      If Not InserirDCTF_CR_DARF_O(_qryAux.fieldByname('SEQ').asInteger, -1, {0,} pDtInicioApu, pDtFimApu) Then
        Result := False;
      //
      // *************** Inserir Detalhamento dos DARF´s
      If Not InserirDetalheDARF_O(_qryAux.fieldByname('SEQ').asInteger, -1, {0,} pDtInicioApu, pDtFimApu) Then
        Result := False;
      //
      // *************** Inserir Detalhamento dos DJE´s
      If Not InserirDetalheDJE_O(_qryAux.fieldByname('SEQ').asInteger, -1, {0,} pDtInicioApu, pDtFimApu) Then
        Result := False;
      // Paulo Nobre - SIG 41744_43545 - Fim
      //
      // *************** Inserir Dados Adicionais
      //SIG48772 - Início
      //Inclusão dos parâmetros pFlgBalanSusp, pFlgDebScp, pOptSimples, pOptCprb, pFlgInativa
      If Not InserirDCTF_DadosAdicionais_O(_qryAux.fieldByname('SEQ').asInteger, pMes, pVersao, pIdFormTribLucro, pIdQualifPj,
        pIdCritRecon, pIdRegimeApur, pIdSituacaoPj, pIdOpcaoLei, pFlgBalanSusp, pFlgDebScp, pOptSimples, pOptCprb, pFlgInativa) Then
        Result := False;
      //SIG48772 - Fim
      //
    End
    Else
    Begin
      // **** Inserir Detalhamento dos Débitos
      If Not InserirDCTF_DBDetalhes_R(_qryAux.fieldByname('SEQ').asInteger, _qryAux2.fieldByname('IDDCTF').asInteger) Then
        Result := False;
      //
      // **** Inserir Detalhamento dos Créditos
      //
      // *************** Inserir DARF´S
      If Not InserirDCTF_CR_DARF_R(_qryAux.fieldByname('SEQ').asInteger, _qryAux2.fieldByname('IDDCTF').asInteger) Then
        Result := False;

      If Not ExportaResultQuery('C:\Planus\Temp\resultQuery.csv', _qryAux.fieldByname('SEQ').asInteger, _qryAux2.fieldByname('IDDCTF').asInteger) Then
        Result := False;

      //
      // *************** Inserir Detalhamento dos DARF´s
      If Not InserirDetalheDARF_R(_qryAux.fieldByname('SEQ').asInteger, _qryAux2.fieldByname('IDDCTF').asInteger) Then
        Result := False;
      //
      // *************** Inserir Detalhamento dos DJE´s
      If Not InserirDetalheDJE_R(_qryAux.fieldByname('SEQ').asInteger, _qryAux2.fieldByname('IDDCTF').asInteger) Then
        Result := False;
      //
      // *************** Inserir DCOMP´S
      If Not InserirDCTF_CR_DCOMP_R(_qryAux.fieldByname('SEQ').asInteger, _qryAux2.fieldByname('IDDCTF').asInteger) Then
        Result := False;
      //
      // *************** Inserir Dados Adicionais
      If Not InserirDCTF_DadosAdicionais_R(_qryAux.fieldByname('SEQ').asInteger, _qryAux2.fieldByname('IDDCTF').asInteger) Then
        Result := False;
      //
    End;
  End
  Else
    Result := False;

  _qryAux.Close;
  _qryAux2.Close;
  _qryAux.free;
  _qryAux2.free;
  _qryInserirDCTF.free;
  _InserirDCTF_DBDetalhes.Free;
End;

// ---------------------------------- DÉBITOS -----------------------------------------------------------------------

Function TCtrlGeraDCTF_Novo.InserirDCTF_DBDetalhes_O(Const pIdDCTF: Integer; pAno, pMes: String; pDtInicioApu, pDtFimApu: TDateTime): Boolean;
Var sSql : String;
  sqlText: TStringList;
  iAno, iMes, iMesVigencia: Integer;
Begin
  Result := True;

  iAno := 0;
  iMes := 0;
  sqlText := tStringList.create;

  sSql := 'INSERT INTO DCTF_DEBITODETALHE              ';
  sSql := sSql + 'SELECT ' + inttostr(pIdDCTF) + ',';
  sSql := sSql + '      SEQDCTF_DEBITODETALHE.NEXTVAL, '; // IDDCTFDEBITODETALHE
  sSql := sSql + '      TBDB.*                         ';
  //
  // Valor do Débito - Folha de Pagamento de Funcionários
  //
  sSql := sSql + 'FROM (                                         ';
  sSql := sSql + '(SELECT 0 TIPOMOV,              '; // Folha Funcionarios
  sSql := sSql + '        HS.CODIRRFDARF,         '; // Código do Tributo
  sSql := sSql + '        NULL CODNATURASSOCIADA, ';
  sSql := sSql + '        HS.CODPROVDESC,         ';
  sSql := sSql + '        HS.IDRUBRICA,           ';
  sSql := sSql + '        NULL IDCONTRATOEMPTMO,  ';
  sSql := sSql + '        NULL CODALTERADOR,      ';
  sSql := sSql + '        NULL IDHSTFOLHABENEF ,  ';
  sSql := sSql + '        P.IDPESSOA,             ';
  sSql := sSql + '        E.MATRICULA,            ';
  sSql := sSql + '        P.NUMDOCUMENTO,         ';
  sSql := sSql + '        P.NOME,                 ';
  sSql := sSql + '        DECODE(PV.FLGDESCONTO, ''0'', -HS.VALORPROVENTO, HS.VALORPROVENTO) VALORPROVENTO,'; // 0 - Provento, 1 - Desconto
  sSql := sSql + '        ''S'',  ';              // FLGMARCADO
  //Darivaldo Alencar/Paulo Nobre SIG 26256
  sSql := sSql + '        HS.DATAPAGAMENTO                                 ';
  sSql := sSql + ' FROM PESSOA P,                                          ';
  sSql := sSql + '      ELEGPATRO E,                                       ';
  sSql := sSql + '      HISTRUBSAL HS,                                     ';
  sSql := sSql + '      PROVDESC PV,                                       ';
  sSql := sSql + '      NATURENDIMENTO N                                   ';
  sSql := sSql + ' WHERE P.IDPESSOA = E.IDPESSOA                           ';
  sSql := sSql + '       AND HS.IDRUBRICA = PV.IDPROVENTO                  ';
  sSql := sSql + '       AND HS.CODIRRFDARF = N.CODNATUREZA                ';
  sSql := sSql + '       AND HS.IDPESSOA = E.IDPESSOA                      ';
  sSql := sSql + '       AND E.IDPESSJUR = 1                               ';
  sSql := sSql + '       AND HS.MESCOBRANCA = ' + quotedstr(pAno + '/' + pMes);

  // Paulo Nobre WO2061 - Inicio
  // Só validar se for gerar DCTF a partir da vigência
  If sAnoMesRefer >= sAnoMesVigencia Then
  Begin
    // Marcos Lima SIG136949 - Inicio
    // iAno := StrToInt(pAno);
    // iMes := StrToInt(pMes);
    // iMesVigencia := 05;
   //  if (iAno >= 2023) and (iMes >= iMesVigencia) then

    sSql := sSql + '       AND HS.CODIRRFDARF NOT IN (''0561'', ''0588'')   ';

  // Marcos Lima SIG136949 - Fim
  // Paulo Nobre WO2061 - Fim

    // Paulo Nobre WO8773 - Inicio
    sSql := sSql + '       AND HS.CODIRRFDARF NOT IN (''0473'',''1708'',''1889'',''3223'',''3533'',''3540'',''3556'',''3579'',''5565'',''8045'',''9466'',''7416'',''7431'',''5952'')   ';
    // Paulo Nobre WO8773 - Fim
  end;

  // SOL 230353 - Kintana 352271 - Paulo Nobre
  //   sSql := sSql + '       AND HS.IDRUBRICA IN (7030, 7060, 8000, 8010, 32994, 39009)    ';

    // Paulo Nobre - SIG 36178 - Inicio

//  sSql := sSql + '       AND HS.CODPROVDESC IN ( ''07053'', ''07052'', ''07030'', ''07040'', ''07041'',  ';
//  sSql := sSql + '                               ''07050'', ''08010'', ''08000'', ''90005'', ''C0130'',  ';
// Paulo Nobre - SIG 41744_43545 - Inicio
//  sSql := sSql + '                               ''Q0120'' ) ';
  // Paulo Nobre - SIG 41744_43545 - Fim

  sSql := sSql + '       AND HS.CODPROVDESC IN (SELECT D.CODPROVDESC FROM DCTFRUBRICAS D WHERE D.FLGTIPOFOLHA = 1 AND D.FLGATIVO = ''S'') '; // Folha de Empregados

  // Paulo Nobre - SIG 36178 - Fim

  sSql := sSql + '       AND NVL(N.FLGUSADONADCTF, ''S'') = ''S''  ) ';
  sSql := sSql + '                                                   ';

  sSql := sSql + ' UNION ALL                                         ';
  //
  // Valor do Débito - Folha de Pagamento de Beneficios - Todos as Naturezas (Tributos)
  //
  // SOL 250991  PPM 725121 - Paulo Nobre - 17/03/2015
  sSql := sSql + '                                                   ';
  sSql := sSql + '(SELECT 1 TIPOMOV,                   '; // Folha Beneficio
  sSql := sSql + '      HS.CODIRRFDARF,                '; // Código do Tributo
  sSql := sSql + '      NULL CODNATURASSOCIADA,        ';
  sSql := sSql + '      HS.CODPROVDESC,                ';
  sSql := sSql + '      HS.IDRUBRICA,                  ';
  sSql := sSql + '      NULL IDCONTRATOEMPTMO,         ';
  sSql := sSql + '      NULL CODALTERADOR,             ';
  sSql := sSql + '      HS.IDHSTFOLHABENEF ,           ';
  sSql := sSql + '      P.IDPESSOA,                    ';
  sSql := sSql + '      D.MATRICULA,                   ';
  sSql := sSql + '      P.NUMDOCUMENTO,                ';
  sSql := sSql + '      P.NOME,                        ';
  sSql := sSql + '      DECODE(SUBSTR(HS.CODPROVDESC, 1, 1), ''1'', -HS.VALORPROVENTO, HS.VALORPROVENTO) VALORPROVENTO,'; // Tipo 3 e 4 (soma), 1 (diminui)
  sSql := sSql + '      ''S'',                         '; // FLGMARCADO
  //Darivaldo Alencar/Paulo Nobre SIG 26256
  sSql := sSql + '      HS.DATAPAGAMENTO               ';
  sSql := sSql + ' FROM HISTRUBSAL HS,                 ';
  sSql := sSql + '      PESSOA P,                      ';
  sSql := sSql + '      DEPENTIT D,                    ';
  sSql := sSql + '      NATURENDIMENTO NAT             ';
  sSql := sSql + ' WHERE HS.MESCOBRANCA = ' + quotedstr(pAno + '/' + pMes);

  // Paulo Nobre WO2061 - Inicio
  // Só validar se for gerar DCTF a partir da vigência
  If sAnoMesRefer >= sAnoMesVigencia Then
  Begin
    // Marcos Lima SIG136949 - Inicio
 //   If (iAno >= 2023) And (iMes >= iMesVigencia) Then

    sSql := sSql + '       AND HS.CODIRRFDARF NOT IN (''0561'', ''0588'')   ';
  // Marcos Lima SIG136949 - Fim
  // Paulo Nobre WO2061 - Fim

    // Paulo Nobre WO8773 - Inicio
    sSql := sSql + '       AND HS.CODIRRFDARF NOT IN (''0473'',''1708'',''1889'',''3223'',''3533'',''3540'',''3556'',''3579'',''5565'',''8045'',''9466'',''7416'',''7431'',''5952'')   ';
    // Paulo Nobre WO8773 - Fim
  End;

  // Paulo Nobre - SIG 36178 - Inicio

{  sSql := sSql + '       AND HS.CODPROVDESC IN ( ''132504'', ''332504'', ''432504'', ''142704'', ''342704'',           '; // rubricas essenciais
sSql := sSql + '                     ''442704'', ''142804'', ''342804'', ''442804'', ''337604'', ''340404'',         ';
sSql := sSql + '                     ''140404'', ''140504'', ''340504'', ''432804'', ''432704'', ''139904'',         ';
sSql := sSql + '                     ''339904'', ''439904'', ''490204'', ''190204'', ''390204'', ''391904'',         ';
sSql := sSql + '                     ''491904'', ''392004'', ''491804'', ''191804'', ''391804'', ''140004'',         ';
sSql := sSql + '                     ''340004'', ''447304'', ''147304'', ''347304'', ''392404'', ''437304'',         ';
sSql := sSql + '                     ''137304'', ''337304'', ''142604'', ''342604'', ''442604'', ''342404'',         ';
sSql := sSql + '                     ''442404'', ''132404'', ''332404'', ''142404'', ''432404'', ''432604'',         ';

// SOL 262362 - Kintana 1084801 - Paulo Nobre
//  sSql := sSql + '                     ''332704'', ''132704'', ''332804'', ''132604'', ''132804'' )                    ';
sSql := sSql + '                     ''332704'', ''332804'', ''132604'',                                 ';

// Paulo Nobre SOL 269633 PPM 1337929
sSql := sSql + '                     ''145504'', ''345504'', ''445504'',    ';

// Paulo Nobre - SIG 36032
sSql := sSql + '                     ''132804'', ''332604''  )                ';
}

  sSql := sSql + '       AND HS.CODPROVDESC IN (SELECT D.CODPROVDESC FROM DCTFRUBRICAS D WHERE D.FLGTIPOFOLHA = 0 AND D.FLGATIVO = ''S'') '; // Folha de Aposentados

  // Paulo Nobre - SIG 36178 - Fim

  sSql := sSql + '      AND HS.CODIRRFDARF = NAT.CODNATUREZA                   ';
  sSql := sSql + '      AND (HS.FLGESTORNO = 0 OR HS.FLGESTORNO IS NULL)       ';
  sSql := sSql + '      AND D.IDTITULAR(+) = HS.IDTITULAR                      ';
  sSql := sSql + '      AND D.IDPESSOA(+) = HS.IDPESSOA                        ';
  sSql := sSql + '      AND P.IDPESSOA = HS.IDRESPONSAVEL                      ';
  sSql := sSql + '      AND (NVL(NAT.FLGUSADONADCTF, ''S'') = ''S'')           ';
  sSql := sSql + '      AND (NVL(NAT.FLGDEPOSITOJUDIC, ''N'') <> ''S''))       '; // Fora os Tributos de Processos Judiciais - 7431, 7416, ...
  sSql := sSql + '                                                             ';
  //
  sSql := sSql + ' UNION ALL                               ';
  //
  // Valor do Débito - Folha de Pagamento de Beneficios  - Tributos Judiciais - ('3540')
  //
  // Paulo Nobre WO8773 - Inicio
  // Só trazer esse movimento se for gerar DCTF antes da vigência  
  If sAnoMesRefer < sAnoMesVigencia Then
  Begin
    sSql := sSql + '                                     ';
    sSql := sSql + '(SELECT 1 TIPOMOV,                   '; // Folha Beneficio
    sSql := sSql + '        ''3540'',                    '; // CODNATUREZA
    sSql := sSql + '      HS.CODIRRFDARF,                '; // Código do Tributo - Natureza  - CODNATUASSOCIADA
    sSql := sSql + '      HS.CODPROVDESC,                ';
    sSql := sSql + '      HS.IDRUBRICA,                  ';
    sSql := sSql + '      NULL IDCONTRATOEMPTMO,         ';
    sSql := sSql + '      NULL CODALTERADOR,             ';
    sSql := sSql + '      NULL IDHSTFOLHABENEF,          ';
    sSql := sSql + '      P.IDPESSOA,                    ';
    sSql := sSql + '      D.MATRICULA,                   ';
    sSql := sSql + '      P.NUMDOCUMENTO,                ';
    sSql := sSql + '      P.NOME,                        ';
    sSql := sSql + '      DECODE(SUBSTR(HS.CODPROVDESC, 1, 1), ''1'', -HS.VALORPROVENTO, HS.VALORPROVENTO) VALORPROVENTO,'; // Tipo 3 e 4 (soma), 1 (diminui)
    sSql := sSql + '      ''S'',                         '; // FLGMARCADO
    //Darivaldo Alencar/Paulo Nobre SIG 26256
    sSql := sSql + '      HS.DATAPAGAMENTO               ';
    sSql := sSql + ' FROM HISTRUBSAL HS,                 ';
    sSql := sSql + '      PESSOA P,                      ';
    sSql := sSql + '      DEPENTIT D,                    ';
    sSql := sSql + '      NATURENDIMENTO NAT             ';
    sSql := sSql + ' WHERE HS.MESCOBRANCA = ' + quotedstr(pAno + '/' + pMes);

  // Paulo Nobre WO2061 - Inicio
  // Só validar se for gerar DCTF a partir da vigência  
  // If sAnoMesRefer >= sAnoMesVigencia Then
 //  Begin
    // Marcos Lima SIG136949 - Inicio
 //   If (iAno >= 2023) And (iMes >= iMesVigencia) Then
 //   sSql := sSql + '       AND HS.CODIRRFDARF NOT IN (''0561'', ''0588'')   ';
  // Marcos Lima SIG136949 - Fim
  // Paulo Nobre WO2061 - Fim

  // Paulo Nobre - SIG 36178 - Inicio
  //
{  sSql := sSql + '      AND HS.CODPROVDESC IN (''132504'', ''332504'', ''432504'', ''142704'', ''342704'',             ';
  sSql := sSql + '                     ''142804'', ''342804'', ''442804'', ''442704'', ''340404'',         ';
  sSql := sSql + '                     ''140404'', ''140504'', ''340504'', ''432804'', ''432704'', ''139904'',         ';
  sSql := sSql + '                     ''339904'', ''439904'', ''490204'', ''190204'', ''390204'', ''391904'',         ';
  sSql := sSql + '                     ''491904'', ''392004'', ''491804'', ''191804'', ''391804'', ''140004'',         ';
  sSql := sSql + '                     ''340004'', ''447304'', ''147304'', ''347304'', ''392404'', ''437304'',         ';
  sSql := sSql + '                     ''137304'', ''337304'', ''142604'', ''342604'', ''442604'', ''342404'',         ';
  sSql := sSql + '                     ''442404'', ''132404'', ''332404'', ''142404'', ''432404'', ''432604'',         ';

  // Paulo Nobre - SIG 36032
  sSql := sSql + '                     ''132804'', ''332604''  )                ';
}             
    sSql := sSql + '       AND HS.CODPROVDESC IN (SELECT D.CODPROVDESC FROM DCTFRUBRICAS D WHERE D.FLGTIPOFOLHA = 0 AND D.FLGATIVO = ''S'') '; // Folha de Aposentados

    // Paulo Nobre - SIG 36178 - Fim
    //
    sSql := sSql + '      AND (HS.CODIRRFDARF = NAT.CODNATUREZA)                 ';
    sSql := sSql + '      AND (HS.FLGESTORNO = 0 OR HS.FLGESTORNO IS NULL)       ';
    sSql := sSql + '      AND D.IDTITULAR(+) = HS.IDTITULAR                      ';
    sSql := sSql + '      AND D.IDPESSOA(+) = HS.IDPESSOA                        ';
    sSql := sSql + '      AND P.IDPESSOA = HS.IDRESPONSAVEL                      ';
    sSql := sSql + '      AND (NVL(NAT.FLGUSADONADCTF, ''S'') = ''S'')           ';
    sSql := sSql + '      AND (NVL(NAT.FLGDEPOSITOJUDIC, ''N'') = ''S'') )       '; // Tributos de Depositos Judiciais - 7431, 7416, ...

    //
    sSql := sSql + ' UNION ALL                                                   ';
    //
  End;
  // Paulo Nobre WO8773 - Fim

  // Valor do Débito - Empréstimos - IOF - ('7893')   (Select de recuperação do IOF foi suportado pelo SAULO)
  //
  sSql := sSql + '(SELECT TIPOMOV,                        '; // Empréstimos
  sSql := sSql + '       CODNATUREZA,                     ';
  sSql := sSql + '       CODNATURASSOCIADA,               ';
  sSql := sSql + '       CODPROVDESC,                     ';
  sSql := sSql + '       NULL,                            ';
  sSql := sSql + '       IDCONTRATOEMPTMO,                ';
  sSql := sSql + '       NULL,                            ';
  sSql := sSql + '       NULL,                            ';
  sSql := sSql + '       IDPESSOA,                        ';
  sSql := sSql + '       MATRICULA,                       ';
  sSql := sSql + '       NUMDOCUMENTO,                    ';
  sSql := sSql + '       NOME,                            ';
  sSql := sSql + '       VLR_IOF,                         ';
  sSql := sSql + '       FLGMARCADO,                      ';
  //Darivaldo Alencar/Paulo Nobre SIG 26256
  sSql := sSql + '       DATAAPURACAO                     ';
  sSql := sSql + 'FROM (SELECT 2 AS TIPOMOV,              '; // Empréstimos - Concessões e Quitações
  sSql := sSql + '             ''7893'' AS CODNATUREZA,   '; // IOF
  sSql := sSql + '             NULL CODNATURASSOCIADA,    ';
  sSql := sSql + '             NULL CODPROVDESC,          ';
  sSql := sSql + '             NULL IDRUBRICA,            ';
  sSql := sSql + '             CON.IDCONTRATOEMPTMO,      ';
  sSql := sSql + '             NULL CODALTERADOR,         ';
  sSql := sSql + '             NULL IDHSTFOLHABENEF,      ';
  sSql := sSql + '             MUT.IDPESSOA,              ';
  sSql := sSql + '             DEP.MATRICULA,             ';
  sSql := sSql + '             MUT.NUMDOCUMENTO,          ';
  sSql := sSql + '             MUT.NOME,                  ';
  sSql := sSql + '             DECODE(CRE.FLGBAIXADO, 0, 0, IOF.HMEVLRPREVISTO) AS VLR_IOF,  ';
  sSql := sSql + '             ''S'' FLGMARCADO,                     '; // FLGMARCADO
  //Darivaldo Alencar/Paulo Nobre SIG 26256
  sSql := sSql + '             IOF.HMEDATAPREVISTA AS DATAAPURACAO       ';
  sSql := sSql + '      FROM CONTRATOEMPTMO CON                          ';
  sSql := sSql + '      JOIN PESSOA MUT ON CON.IDBENEF = MUT.IDPESSOA    ';
  sSql := sSql + '      JOIN DEPENTIT DEP ON CON.IDBENEF = DEP.IDPESSOA AND CON.IDPESSOA = DEP.IDTITULAR  ';
  sSql := sSql + '      JOIN HISTMOVEMPTMO IOF ON IOF.IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO ';
  sSql := sSql + '      JOIN (SELECT HME.IDCONTRATOEMPTMO,                                    ';
  sSql := sSql + '                  HME.HMEDATAPREVISTA,                                      ';
  sSql := sSql + '                   HME.HMEDATAEFETIVA,                                      ';
  sSql := sSql + '                   HME.HMETIPOMOV,                                          ';
  sSql := sSql + '                   HME.HMEORIGEM,                                           ';
  sSql := sSql + '                   HME.IDITEMEMPTMO,                                        ';
  sSql := sSql + '                   NVL(HME.FLGBAIXADO, 1) AS FLGBAIXADO                     ';
  sSql := sSql + '            FROM HISTMOVEMPTMO HME                                          ';
  sSql := sSql + '            WHERE HME.HMECENTRALIZA = 1                                     ';
  sSql := sSql + '                   AND HME.HMETIPOMOV IN (0,3)                              ';
  sSql := sSql + '                   AND HME.IDITEMEMPTMO IN (6,17)                           ';
  sSql := sSql + '                   AND NVL(HME.FLGESTORNADO,0) = 0                          ';
  sSql := sSql + '                   AND HME.HMEMESCOBRANCA = ' + quotedstr(inttostr(strtoint(pMes)));
  sSql := sSql + '                   AND HME.HMEANOCOBRANCA = ' + quotedstr(inttostr(strtoint(pAno)));
  // SOL 239704 PPM 523138 - Paulo Nobre
  //   sSql := sSql + '                    AND HME.FLGBAIXADO IS NULL ) CRE ON IOF.IDCONTRATOEMPTMO = CRE.IDCONTRATOEMPTMO  ';
  sSql := sSql + '                    AND NVL(HME.FLGBAIXADO,1) = 1) CRE ON IOF.IDCONTRATOEMPTMO = CRE.IDCONTRATOEMPTMO  ';
  sSql := sSql + '                    AND IOF.HMETIPOMOV = CRE.HMETIPOMOV                                              ';
  sSql := sSql + '                    AND IOF.HMEDATAPREVISTA = CRE.HMEDATAPREVISTA                                    ';
  sSql := sSql + '                    AND IOF.HMEORIGEM = CRE.HMEORIGEM                                                ';
  sSql := sSql + '                    AND IOF.IDITEMCENTRALIZA = CRE.IDITEMEMPTMO                                      ';
  sSql := sSql + '      WHERE CON.FLGSITUACAO <> ''C''                                                                 ';
  sSql := sSql + '            AND IOF.HMECENTRALIZA + IOF.HMEDESTACADO = 0                                             ';
  sSql := sSql + '            AND NVL(IOF.FLGESTORNADO,0) = 0                                                          ';
  sSql := sSql + '            AND IOF.HMEVLRPREVISTO <> 0                                                              ';
  sSql := sSql + '            AND IOF.IDLANCIRRF IS NOT NULL                                                           ';
  //Darivaldo Alencar/Paulo Nobre SIG 26256
  sSql := sSql + '            AND IOF.IDITEMEMPTMO IN (9, 41, 122, 123)                                                ';
  //
  sSql := sSql + '     UNION ALL                                                                                       ';
  //
  sSql := sSql + '     SELECT 2 AS TIPOMOV,               '; // Empréstimos - Avulsos
  sSql := sSql + '             ''7893'' AS CODNATUREZA,   '; // IOF
  sSql := sSql + '             NULL CODNATURASSOCIADA,    ';
  sSql := sSql + '             NULL CODPROVDESC,          ';
  sSql := sSql + '             NULL IDRUBRICA,            ';
  sSql := sSql + '             CON.IDCONTRATOEMPTMO,      ';
  sSql := sSql + '             NULL CODALTERADOR,         ';
  sSql := sSql + '             NULL IDHSTFOLHABENEF,      ';
  sSql := sSql + '             MUT.IDPESSOA,              ';
  sSql := sSql + '             DEP.MATRICULA,             ';
  sSql := sSql + '             MUT.NUMDOCUMENTO,          ';
  sSql := sSql + '             MUT.NOME,                  ';

  // WO13558 - Impostos - Gerar DCTF
  // Alterado por Arnaldo V. Scarin - 19/08/2024
  // sSql := sSql + '             DECODE(HME.FLGBAIXADO, 0, 0, HME.HMEVLRefetivo) AS VLR_IOF, ';
  sSql := sSql + '             DECODE(HME.FLGBAIXADO, 0, CASE NVL(HME.IDLANCIRRF,0) WHEN 0 THEN 0 ELSE HME.HMEVLRPREVISTO END, HME.HMEVLRefetivo) AS VLR_IOF, ';
  // WO13558 - END

  sSql := sSql + '             ''S'' FLGMARCADO,                                                ';
  //Darivaldo Alencar/Paulo Nobre SIG 26256
  sSql := sSql + '             HME.HMEDATAEFETIVA AS DATAAPURACAO  ';
  sSql := sSql + '      FROM CONTRATOEMPTMO CON                                                 ';
  sSql := sSql + '      JOIN PESSOA MUT ON CON.IDBENEF = MUT.IDPESSOA                           ';
  sSql := sSql + '      JOIN DEPENTIT DEP ON  CON.IDBENEF = DEP.IDPESSOA  AND CON.IDPESSOA = DEP.IDTITULAR  ';
  sSql := sSql + '      JOIN HISTMOVEMPTMO HME ON HME.IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO               ';
  sSql := sSql + '      WHERE CON.FLGSITUACAO <> ''C''                  ';
  //edilaine SIG118516 : inicio
  sSql := sSql + '            AND (HME.HMEDESTACADO = 1  OR             ';
  // WO13558 - Impostos - Gerar DCTF
  // Alterado por Arnaldo V. Scarin - 19/08/2024
  // sSql := sSql + '                (CON.IDTIPOSUSPEMPTMO = 12 AND        ';
  sSql := sSql + '                (CON.IDTIPOSUSPEMPTMO IN (12, 13) AND        ';
  // WO13558 - END

  sSql := sSql + '                 CON.DATAINICIOSUSP <= SYSDATE AND    ';
  sSql := sSql + '                 TO_CHAR(CON.DATAFIMSUSP, ''YYYY/MM'') >= ' + QuotedStr(pAno + '/' + pMes) + ') ) ';
  //edilaine SIG118516 : fim
  sSql := sSql + '            AND NVL(HME.FLGESTORNADO,0) = 0           ';
  sSql := sSql + '            AND HME.HMEVLRPREVISTO <> 0               ';
  sSql := sSql + '            AND HME.HMEMESCOBRANCA = ' + quotedstr(inttostr(strtoint(pMes)));
  sSql := sSql + '            AND HME.HMEANOCOBRANCA = ' + quotedstr(inttostr(strtoint(pAno)));
  sSql := sSql + '            AND HME.IDITEMEMPTMO IN (30, 41, 121, 82, 109, 110) ) ';
  //Darivaldo Alencar/Paulo Nobre SIG 26256
  sSql := sSql + 'WHERE VLR_IOF <> 0  )           ';
  //
  sSql := sSql + ' UNION ALL                      ';
  //
  // Valor do Débito - IRRF Pessoa Jurídica - ('1708') e PIS / COFINS / CSL ('5952') e Comissões/Corretagens Pagas à Pessoa Jurídica ('8045')
  //
  // Paulo Nobre WO8773 - Inicio
  // Só trazer esse movimento se for gerar DCTF antes da vigência  
  If sAnoMesRefer < sAnoMesVigencia Then
  Begin
    sSql := sSql + '(SELECT 3 TIPOMOV,              '; // Impostos
    sSql := sSql + '      L.CODNATUREZA,            ';
    sSql := sSql + '      NULL CODNATURASSOCIADA,   ';
    sSql := sSql + '      NULL CODPROVDESC,         ';
    sSql := sSql + '      NULL IDRUBRICA,           ';
    sSql := sSql + '      NULL IDCONTRATOEMPTMO,    ';
    sSql := sSql + '      NULL CODALTERADOR,        ';
    sSql := sSql + '      NULL IDHSTFOLHABENEF,     ';
    sSql := sSql + '      P.IDPESSOA,               ';
    sSql := sSql + '      NULL  MATRICULA,          ';
    sSql := sSql + '      P.NUMDOCUMENTO,           ';
    sSql := sSql + '      P.RAZAOSOCIAL NOME,       ';
    sSql := sSql + '      DECODE(L.CODNATUREZA, ''5952'', L.VLRPIS + L.VLRCSCOFPIS, L.VLRIRRF) VALOR,  '; // VLR IMPOSTO
    sSql := sSql + '      ''S'',                    '; // FLGMARCADO
    //Darivaldo Alencar/Paulo Nobre SIG 26256
    sSql := sSql + '      L.DATAPAGAMENTO          ';
    sSql := sSql + 'FROM LANCIRRF L,                ';
    sSql := sSql + '     DOCUMENTO DOC,             ';
    sSql := sSql + '     NATURENDIMENTO NAT,        ';
    sSql := sSql + '     PESSOA P                   ';
    sSql := sSql + 'WHERE DOC.CODDOCUMENTO = L.CODDOCUMENTO       ';
    sSql := sSql + '      AND NAT.CODNATUREZA = L.CODNATUREZA     ';
    sSql := sSql + '      AND L.IDPESSOA = P.IDPESSOA          ';
    //Cássio Rovaroto - SIG nº 90708 - Início
    //sSql := sSql + '      AND TO_CHAR(L.DATAPAGAMENTO, ''YYYY'') = ' + quotedstr(pAno);
    //sSql := sSql + '      AND TO_CHAR(L.DATAPAGAMENTO, ''MM'') = ' + quotedstr(pMes);
    sSql := sSql + '      AND TO_CHAR(L.DATALANCAMENTO, ''YYYY'') = ' + quotedstr(pAno);
    sSql := sSql + '      AND TO_CHAR(L.DATALANCAMENTO, ''MM'') = ' + quotedstr(pMes);
    //Cássio Rovaroto - SIG nº 90708 - Fim
    sSql := sSql + '      AND L.CODNATUREZA IN (''1708'', ''5952'', ''8045'') ';
    sSql := sSql + '      AND (DECODE(L.CODNATUREZA, ''5952'', L.VLRPIS + L.VLRCSCOFPIS, L.VLRIRRF) <> 0)    ';
    sSql := sSql + '      AND (DOC.STATUS = ''2'' )     '; // Baixado/pago
    sSql := sSql + '      AND (NVL(NAT.FLGUSADONADCTF, ''S'') = ''S'')) ';
  //
  // Paulo Nobre WO2061 - Inicio
  // Só validar se for gerar DCTF antes da vigência  
//  If sAnoMesRefer < sAnoMesVigencia Then              Paulo Nobre WO8773
    // Marcos Lima SIG136949 - Inicio
 //   If (iAno < 2023) And (iMes < iMesVigencia) Then
//  Begin                                               Paulo Nobre WO8773 
    sSql := sSql + ' UNION ALL                       ';
    //
    // Valor do Débito - IRRF Pessoa Física - ('0588')
    //
    sSql := sSql + '(SELECT 3 TIPOMOV,               '; // Impostos
    sSql := sSql + '       ''0588'' CODNATUREZA,     '; // IRRF Pessoa Física - Prestador de Serviços
    sSql := sSql + '       NULL CODNATURASSOCIADA,   ';
    sSql := sSql + '       NULL CODPROVDESC,         ';
    sSql := sSql + '       NULL IDRUBRICA,           ';
    sSql := sSql + '       NULL IDCONTRATOEMPTMO,    ';
    sSql := sSql + '       L.CODALTERADOR,           ';
    sSql := sSql + '       NULL IDHSTFOLHABENEF,     ';
    sSql := sSql + '       P.IDPESSOA,               ';
    sSql := sSql + '       NULL MATRICULA,           ';
    sSql := sSql + '       P.NUMDOCUMENTO,           ';
    sSql := sSql + '       P.NOME,                   ';
    sSql := sSql + '       DECODE(L.DEBCRE, ''C'', L.VALOR, -L.VALOR) VALOR,             ';
    sSql := sSql + '       ''S'' ,                    '; // FLGMARCADO
    //Darivaldo Alencar/Paulo Nobre SIG 26256
    sSql := sSql + '       D.DATAVENCTO          ';
    sSql := sSql + 'FROM LANCTODOCUM L,           ';
    sSql := sSql + '     DOCUMENTO D,             ';
    sSql := sSql + '     PESSOA P,                ';
    sSql := sSql + '     TIPOALTERADOR T          ';
    sSql := sSql + 'WHERE L.CODDOCUMENTO = D.CODDOCUMENTO      ';
    sSql := sSql + '      AND D.IDFORCLI = P.IDPESSOA          ';
    sSql := sSql + '      AND T.CODALTERADOR = L.CODALTERADOR  ';
    sSql := sSql + '      AND L.CODALTERADOR IN (124, 126) '; // IRRF S/ SERVICOS TERCEIROS - PF e IRRF S/ IMOVEIS - PF
    sSql := sSql + '      AND D.DATAVENCTO BETWEEN TO_DATE(' + quotedstr(datetostr(pDtInicioApu)) + ', ''dd/mm/yyyy'') AND  ';
    sSql := sSql + '                               TO_DATE(' + quotedstr(datetostr(pDtFimApu)) + ', ''dd/mm/yyyy'')  ';
    sSql := sSql + '      AND D.STATUS = ''2'' )         '; // Pago

    // Marcos Lima SIG136949 - Fim
    // Paulo Nobre WO2061 - Fim
    //
    sSql := sSql + ' UNION ALL                           ';
  End;
  // Paulo Nobre WO8773 - Fim

  //
  // Valor do Débito - PIS FUNCEF - ('4574')
  //
  sSql := sSql + '(SELECT 3 TIPOMOV,                  '; // Impostos
  sSql := sSql + '        ''4574'' CODNATUREZA,       '; // PIS
  sSql := sSql + '        ''7460'' CODNATURASSOCIADA, '; // Tributo especifico Deposito Judicial
  sSql := sSql + '        NULL CODPROVDESC,           ';
  sSql := sSql + '        ' + sContaContabilPIS + ' IDRUBRICA, '; // Campo foi usado para guardar a conta contabil do PIS
  sSql := sSql + '        NULL IDCONTRATOEMPTMO,      ';
  sSql := sSql + '        NULL CODALTERADOR,          ';
  sSql := sSql + '        (SELECT PLANO FROM PARAMCONTAB) IDHSTFOLHABENEF, '; // Campo foi usado para guardar o plano vigente
  sSql := sSql + '        P.IDPESSOA,                 ';
  sSql := sSql + '        NULL MATRICULA,             ';
  sSql := sSql + '        P.NUMDOCUMENTO,             ';
  sSql := sSql + '        P.RAZAOSOCIAL,              ';
  sSql := sSql + '        PLSCREDITOCOR VALOR,        ';
  sSql := sSql + '        ''S'',                    '; // FLGMARCADO
  //Darivaldo Alencar/Paulo Nobre SIG 26256
  sSql := sSql + '        NULL          ';
  sSql := sSql + 'FROM PLANOSALDO S,    ';
  sSql := sSql + '     PESSOA P         ';
  sSql := sSql + 'WHERE S.IDPESSOA = P.IDPESSOA       ';
  sSql := sSql + '      AND S.PLANO = (SELECT PLANO FROM PARAMCONTAB)   ';
  sSql := sSql + '      AND S.PERNUMERO = ' + quotedstr(inttostr(strtoint(pMes)));
  sSql := sSql + '      AND S.PEREXERCICIO = ' + quotedstr(inttostr(strtoint(pAno)));
  // SOL 230353 - Kintana 352271 - Paulo Nobre
//   sSql := sSql + '      AND S.PLACONTA = ''2122010501'' )  '; // CONTA CONTABIL DO PIS FUNCEF
  sSql := sSql + '      AND S.PLACONTA = ' + quotedstr(sContaContabilPIS) + ' )'; // CONTA CONTABIL DO PIS FUNCEF
  //
  sSql := sSql + ' UNION ALL                          ';
  //
  // Valor do Débito - COFINS FUNCEF - ('7987')
  //
  sSql := sSql + '(SELECT 3 TIPOMOV,                  '; // Impostos
  sSql := sSql + '        ''7987'' CODNATUREZA,       '; // COFINS
  sSql := sSql + '        ''7498'' CODNATURASSOCIADA, '; // Tributo especifico Deposito Judicial
  sSql := sSql + '        NULL CODPROVDESC,           ';
  sSql := sSql + '        ' + sContaContabilCOFINS + ' IDRUBRICA, '; // Campo foi usado para guardar a conta contabil do COFINS
  sSql := sSql + '        NULL IDCONTRATOEMPTMO,      ';
  sSql := sSql + '        NULL CODALTERADOR,          ';
  sSql := sSql + '        (SELECT PLANO FROM PARAMCONTAB) IDHSTFOLHABENEF,'; // Campo foi usado para guardar o plano vigente
  sSql := sSql + '        P.IDPESSOA,                 ';
  sSql := sSql + '        NULL MATRICULA,             ';
  sSql := sSql + '        P.NUMDOCUMENTO,             ';
  sSql := sSql + '        P.RAZAOSOCIAL,              ';
  sSql := sSql + '        PLSCREDITOCOR VALOR,        ';
  sSql := sSql + '        ''S'',                    '; // FLGMARCADO
  //Darivaldo Alencar/Paulo Nobre SIG 26256
  sSql := sSql + '        NULL          ';
  sSql := sSql + 'FROM PLANOSALDO S,    ';
  sSql := sSql + '     PESSOA P         ';
  sSql := sSql + 'WHERE S.IDPESSOA = P.IDPESSOA       ';
  sSql := sSql + '      AND S.PLANO = (SELECT PLANO FROM PARAMCONTAB)  ';
  sSql := sSql + '      AND S.PERNUMERO = ' + quotedstr(inttostr(strtoint(pMes)));
  sSql := sSql + '      AND S.PEREXERCICIO = ' + quotedstr(inttostr(strtoint(pAno)));
  // SOL 230353 - Kintana 352271 - Paulo Nobre
//   sSql := sSql + '      AND S.PLACONTA = ''2122010601'' )  '; // CONTA CONTABIL DO CONFINS FUNCEF
  sSql := sSql + '      AND S.PLACONTA = ' + quotedstr(sContaContabilCOFINS) + ' )'; // CONTA CONTABIL DO CONFINS FUNCEF
  //
  sSql := sSql + ' ) TBDB ';
  CMDebugToFile(#13#10 + sSQL + #13#10);
  sqlText.Clear;
  sqlText.add(sSql);
  sqlText.SaveToFile('C:\Planus\Temp\DCTF\InserirDCTF_DBDetalhes_O.txt');

  If Not ExecSQL(sSQL) Then
  Begin
    Result := False;
    Exception.Create(Messageinfo);
  End;

  FreeAndNil(sqlText);
End;

//---------------------------- CRÉDITOS (DARF E DJE) --------------------------------------------------------------

Function TCtrlGeraDCTF_Novo.InserirDCTF_CR_DARF_O(Const pIdDCTF, pIdChave {,pTipoChave}: Integer; pDtInicioApu, pDtFimApu: TDateTime): Boolean;
Var sSql: String;
  // Paulo Nobre WO2061 - Inicio
  sqlText: TStringList;
  // Paulo Nobre WO2061 - Fim
Begin
  // Paulo Nobre WO2061 - Inicio
  sqlText := tStringList.create;
  // Paulo Nobre WO2061 - Fim

  Result := True;

  sSql := 'INSERT INTO DCTF_CREDITODETALHE_DARF    ';
  // DARF´S normais
  // SOL 243671 PPM 595596 - Paulo Nobre
  sSql := sSql + 'SELECT ' + inttostr(pIdDCTF) + ',';
  sSql := sSql + '       SEQDCTF_CREDITODETALHE_DARF.NEXTVAL, '; // IDDCTFCRDETALHE_DARF
  sSql := sSql + '       TBCR.*                    ';
  sSql := sSql + 'FROM (                           ';
  sSql := sSql + '(SELECT DARF.TIPODOCTO,          ';
  sSql := sSql + '       DARF.CODNATUREZA,         ';
  sSql := sSql + '       DARF.CODNATURASSOCIADA,   ';
  sSql := sSql + '       DARF.IDDARF,              ';
  sSql := sSql + '       DARF.IDLANCIRRF,          ';
  sSql := sSql + '       DARF.NUMDOCUMENTO,        ';
  sSql := sSql + '       DARF.REFERENCIA,          ';
  sSql := sSql + '       DARF.PROCESSO,            ';
  sSql := sSql + '       DARF.DATAINIAPURACAO,     ';
  sSql := sSql + '       DARF.DATAFINALAPURACAO,   ';
  sSql := sSql + '       DARF.DATAVENCDARF,        ';
  // SOL 263331 - PPM 1115142 - Paulo Nobre
//  sSql := sSql + '       DECODE(DARF.CODNATUREZA, ''3540'', (DARF.VLRIRRF + NVL(ALTERADOR.VLRTOTALALTERADOR,0)), DARF.VLRIRRF) VLRIRRF,   ';
  sSql := sSql + '       (DARF.VLRIRRF + NVL(ALTERADOR.VLRTOTALALTERADOR,0)) VLRIRRF,   ';
  sSql := sSql + '       DARF.VLRMULTA,            ';
  sSql := sSql + '       DARF.VLRJUROS,            ';
  // SOL 263331 - PPM 1115142 - Paulo Nobre
//  sSql := sSql + '       DECODE(DARF.CODNATUREZA, ''3540'', (DARF.VLRIRRF + NVL(ALTERADOR.VLRTOTALALTERADOR,0)), DARF.VLRIRRF) VLRTOTAL,   ';
  sSql := sSql + '       (DARF.VLRIRRF + NVL(ALTERADOR.VLRTOTALALTERADOR,0)) VLRTOTAL,   ';
  sSql := sSql + '       ''N'',                    ';
  sSql := sSql + '       ''S'',                    ';
  sSql := sSql + '       SYSDATE,                  ';
  sSql := sSql + '       USER,                     ';
  sSql := sSql + '       NULL TRGDTEXC,            ';
  sSql := sSql + '       NULL TRGUSEREXC,          ';
  // Paulo Nobre - SIG 41744_43545 - Inicio
  sSql := sSql + '       NULL                      '; // IDLANCIRRFFOLHABENEF
  // Paulo Nobre - SIG 41744_43545 - Fim
  sSql := sSql + 'FROM (SELECT D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE, ''C'', L.VALOR, -L.VALOR)) VLRTOTALALTERADOR  ';
  sSql := sSql + '      FROM DARF D, LANCTODOCUM L, TIPOALTERADOR T                             ';
  sSql := sSql + '      WHERE D.CODDOCUMENTO = L.CODDOCUMENTO                                   ';
  sSql := sSql + '            AND L.CODALTERADOR = T.CODALTERADOR                               ';
  sSql := sSql + '            AND L.CODALTERADOR IN (371, 961)       '; // (IRRF Recolhido - AP separada) e (IRRF FOLHA - ACRÉSCIMO)
  If (pDtInicioApu <> 0) And (pDtFimApu <> 0) Then
  Begin
    sSql := sSql + '      AND (D.DATAINIAPURACAO >= ' + quotedstr(datetostr(pDtInicioApu));
    sSql := sSql + '      AND  D.DATAFINALAPURACAO <= ' + quotedstr(datetostr(pDtFimApu)) + ')';
  End;
  sSql := sSql + '            AND D.VLRIRRF <> 0             ';
  sSql := sSql + '      GROUP BY D.CODDOCUMENTO ) ALTERADOR, ';
  sSql := sSql + '     (SELECT ''DARF'' TIPODOCTO,         ';
  sSql := sSql + '             D.CODDOCUMENTO,             ';
  sSql := sSql + '             D.CODNATUREZA,              ';
  sSql := sSql + '             NULL CODNATURASSOCIADA,     ';
  sSql := sSql + '             D.IDDARF,                   ';
  sSql := sSql + '             NULL IDLANCIRRF,            ';
  sSql := sSql + '             D.NUMDOCUMENTO,             ';
  sSql := sSql + '             TO_CHAR(D.CODDOCUMENTO) REFERENCIA, ';
  sSql := sSql + '             D.PROCESSO,                 ';
  sSql := sSql + '             D.DATAINIAPURACAO,          ';
  sSql := sSql + '             D.DATAFINALAPURACAO,        ';
  sSql := sSql + '             D.DATAVENCDARF,             ';
  sSql := sSql + '             D.VLRIRRF,                  ';
  sSql := sSql + '             D.VLRMULTA,                 ';
  sSql := sSql + '             D.VLRJUROS,                 ';
  sSql := sSql + '             D.VLRTOTAL                  ';
  sSql := sSql + '        FROM DARF D,                     ';
  sSql := sSql + '             DOCUMENTO DOC,              ';
  sSql := sSql + '             NATURENDIMENTO NAT          ';
  sSql := sSql + '        WHERE (DOC.CODDOCUMENTO = D.CODDOCUMENTO)  ';
  sSql := sSql + '             AND (NAT.CODNATUREZA = D.CODNATUREZA) ';
  sSql := sSql + '             AND (D.IDPESSOA = 1)           '; // FUNCEF
  If (pDtInicioApu <> 0) And (pDtFimApu <> 0) Then
  Begin
    sSql := sSql + '         AND (D.DATAINIAPURACAO >= ' + quotedstr(datetostr(pDtInicioApu));
    sSql := sSql + '         AND  D.DATAFINALAPURACAO <= ' + quotedstr(datetostr(pDtFimApu)) + ')';

    // Paulo Nobre WO2061 - Inicio
    // Só validar se for gerar DCTF a partir da vigência    
    If sAnoMesRefer >= sAnoMesVigencia Then
    Begin
      sSql := sSql + '       AND D.CODNATUREZA NOT IN (''0561'', ''0588'')   ';
    // Paulo Nobre WO2061 - Fim

      // Paulo Nobre WO8773 - Inicio
      sSql := sSql + '       AND D.CODNATUREZA NOT IN (''0473'',''1708'',''1889'',''3223'',''3533'',''3540'',''3556'',''3579'',''5565'',''8045'',''9466'',''7416'',''7431'',''5952'')   ';
      // Paulo Nobre WO8773 - Fim
    End;

  End;
  sSql := sSql + '             AND (D.VLRIRRF <> 0)         ';
  sSql := sSql + '             AND (DOC.STATUS = ''2'')     '; // Baixado/pago
  sSql := sSql + '             AND (NVL(NAT.FLGUSADONADCTF, ''S'') = ''S'' )     ';
  sSql := sSql + '             AND (NVL(NAT.FLGDEPOSITOJUDIC, ''N'') <> ''S'') ) DARF'; // Sem os Tributos de Depositos Judiciais - 7431, 7416, ...
  sSql := sSql + ' WHERE DARF.CODDOCUMENTO = ALTERADOR.CODDOCUMENTO(+) )';
  //
  //
  // Tributos de Processos Judiciais que serão "cravados" com o tributo 3540 (Benef. Prev. Complem.-Não Optante Tribut. Exclusiva)
  //
  // Paulo Nobre WO8773 - Inicio
  // Só trazer esse movimento se for gerar DCTF antes da vigência  
  If sAnoMesRefer < sAnoMesVigencia Then
  Begin
    sSql := sSql + 'UNION                         ';

    sSql := sSql + '   (SELECT                       ';
    sSql := sSql + '        ''DJE'',                 '; // TIPODOCTO,
    sSql := sSql + '        ''3540'',                '; // CODNATUREZA
    sSql := sSql + '         LIR.CODNATUREZA,        '; // CODNATURASSOCIADA
    sSql := sSql + '         D.IDDARF,               ';
    sSql := sSql + '         LIR.IDLANCIRRF,         ';
    sSql := sSql + '         P.NUMDOCUMENTO,         ';
    // SOL 241634 PPM 556541 - Paulo Nobre
    sSql := sSql + '        (TRIM(SUBSTR(A.NUMAGENCIA, 1, 4)) || TRIM(C.CONTACORRENTE)) AS REFERENCIA,                     ';
    sSql := sSql + '         NULL,                   '; // PROCESSO,
    sSql := sSql + '         DECODE(D.DATAINIAPURACAO, NULL, LIR.DATALANCAMENTO, D.DATAINIAPURACAO) DATAINIAPURACAO,       ';
    sSql := sSql + '         DECODE(D.DATAFINALAPURACAO, NULL, LIR.DATALANCAMENTO, D.DATAFINALAPURACAO) DATAFINALAPURACAO, ';
    sSql := sSql + '         DECODE(D.DATAVENCDARF, NULL, LIR.DATALANCAMENTO, D.DATAVENCDARF) DATAVENCDARF,                ';
    sSql := sSql + '         NVL(LIR.VLRIRRF,0) VLRIRRF,        ';
    sSql := sSql + '         NVL(D.VLRMULTA,0) VLRMULTA,      ';
    sSql := sSql + '         NVL(D.VLRJUROS,0) VLRJUROS,      ';
    sSql := sSql + '         NVL(D.VLRTOTAL,0) VLRTOTAL,      ';
    sSql := sSql + '         ''N'',                           '; // FLGREGEXCLUIDO
    sSql := sSql + '         ''S'',                           '; // FLGMARCADO
    sSql := sSql + '         SYSDATE,                         ';
    sSql := sSql + '         USER,                            ';
    sSql := sSql + '         NULL TRGDTEXC,                   ';
    sSql := sSql + '         NULL TRGUSEREXC,                 ';
    // Paulo Nobre - SIG 41744_43545 - Inicio
    sSql := sSql + '         NULL                             '; // IDLANCIRRFFOLHABENEF
    // Paulo Nobre - SIG 41744_43545 - Fim
    sSql := sSql + 'FROM DARF           D,                    ';
    sSql := sSql + '     LANCIRRF       LIR,                  ';
    sSql := sSql + '     NATURENDIMENTO NAT,                  ';
    sSql := sSql + '     PESSOA P,                            ';
    sSql := sSql + '     PROCJUD PRJ,                         ';
    sSql := sSql + '     AGENCIABANCARIA A,                   ';
    sSql := sSql + '     CONTABANCARIA C                      ';
    sSql := sSql + 'WHERE (LIR.IDDARF  = D.IDDARF (+))    ';
    sSql := sSql + '      AND (NAT.CODNATUREZA = LIR.CODNATUREZA)    ';
    sSql := sSql + '      AND (LIR.IDBENEFIRRF = P.IDPESSOA)         ';
    sSql := sSql + '      AND (LIR.IDDARF IS NOT NULL)               '; // Andre Imakawa - SIG 61980
    // SOL 241634 PPM 556541 - Paulo Nobre
    sSql := sSql + '      AND (LIR.IDPROCJUD = PRJ.IDPROCJUD)        ';
    sSql := sSql + '      AND (LIR.IDBENEFIRRF = PRJ.IDPESSOA (+))   ';
    sSql := sSql + '      AND (PRJ.IDAGENCIABANCARIA = A.IDPESSOA (+)) ';
    sSql := sSql + '      AND (PRJ.IDCBANCARIA = C.IDCBANCARIA (+))    ';
    sSql := sSql + '      AND (LIR.VLRIRRF <> 0)                       ';
    If (pDtInicioApu <> 0) And (pDtFimApu <> 0) Then
    Begin
      sSql := sSql + 'AND (LIR.DATALANCAMENTO >= ' + quotedstr(datetostr(pDtInicioApu));
      sSql := sSql + '     AND LIR.DATALANCAMENTO <= ' + quotedstr(datetostr(pDtFimApu)) + ' )';

      // SOL 250991  PPM 725121 - Paulo Nobre - 17/03/2015
          {
                sSql := sSql + 'AND (PRJ.DATAINICIO <= ' + quotedstr(datetostr(pDtFimApu)) + ' )';
                sSql := sSql + 'AND (PRJ.FLGFAZDEPOSITO = 1)       '; // Depósito judicial foi realizado
                sSql := sSql + 'AND ((PRJ.SITPROCESSO = 0) OR      '; // Processo Aberto
                sSql := sSql + '     (PRJ.DATAFINAL >= (SELECT DISTINCT L.DATALANCAMENTO    ';
                sSql := sSql + '                        FROM LANCIRRF L, NATURENDIMENTO N                    ';
                sSql := sSql + '                        WHERE N.CODNATUREZA = L.CODNATUREZA   ';
                sSql := sSql + '                              AND (L.DATALANCAMENTO >= ' + quotedstr(datetostr(pDtInicioApu));
                sSql := sSql + '                              AND L.DATALANCAMENTO <= ' + quotedstr(datetostr(pDtFimApu)) + ' )';
                sSql := sSql + '                              AND L.IDMODULO = 18     '; // Folha de Beneficios
                sSql := sSql + '                              AND NVL(N.FLGDEPOSITOJUDIC, ''N'') = ''S'' )))  '; // Tributos de Depositos Judiciais - 7431, 7416, ...
          }
    End;
    sSql := sSql + '      AND (NVL(NAT.FLGUSADONADCTF, ''S'') = ''S'')  ';
    sSql := sSql + '      AND (NVL(NAT.FLGDEPOSITOJUDIC, ''N'') = ''S'') )  '; // Tributos de Depositos Judiciais - 7431, 7416, ...

    sSql := sSql + 'UNION                         ';

    // Paulo Nobre - SIG 41744_43545 - Inicio  - NOVA TABELA - IRRFFOLHABENEF
    //
    sSql := sSql + '   (SELECT                       ';
    sSql := sSql + '        ''DJE'',                 '; // TIPODOCTO,
    sSql := sSql + '        ''3540'',                '; // CODNATUREZA
    sSql := sSql + '         I.CODNATUREZA,        '; // CODNATURASSOCIADA
    sSql := sSql + '         D.IDDARF,               ';
    sSql := sSql + '         NULL,                   '; // IDLANCIRRF
    sSql := sSql + '         P.NUMDOCUMENTO,         ';
    sSql := sSql + '        (TRIM(SUBSTR(A.NUMAGENCIA, 1, 4)) || TRIM(C.CONTACORRENTE)) AS REFERENCIA,                     ';
    sSql := sSql + '         NULL,                   '; // PROCESSO,
    sSql := sSql + '         DECODE(D.DATAINIAPURACAO, NULL, I.DATAPAGAMENTO, D.DATAINIAPURACAO) DATAINIAPURACAO,       ';
    sSql := sSql + '         DECODE(D.DATAFINALAPURACAO, NULL, I.DATAPAGAMENTO, D.DATAFINALAPURACAO) DATAFINALAPURACAO, ';
    sSql := sSql + '         DECODE(D.DATAVENCDARF, NULL, I.DATAVENCIMENTO, D.DATAVENCDARF) DATAVENCDARF,                ';
    sSql := sSql + '         NVL(I.VLRIMPOSTO,0) VLRIRRF,        ';
    sSql := sSql + '         NVL(D.VLRMULTA,0) VLRMULTA,      ';
    sSql := sSql + '         NVL(D.VLRJUROS,0) VLRJUROS,      ';
    sSql := sSql + '         NVL(D.VLRTOTAL,0) VLRTOTAL,      ';
    sSql := sSql + '         ''N'',                           '; // FLGREGEXCLUIDO
    sSql := sSql + '         ''S'',                           '; // FLGMARCADO
    sSql := sSql + '         SYSDATE,                         ';
    sSql := sSql + '         USER,                            ';
    sSql := sSql + '         NULL TRGDTEXC,                   ';
    sSql := sSql + '         NULL TRGUSEREXC,                 ';
    sSql := sSql + '         I.IDLANCIRRFFOLHABENEF         ';
    sSql := sSql + 'FROM DARF           D,                    ';
    sSql := sSql + '     IRRFFOLHABENEF I,                  ';
    sSql := sSql + '     NATURENDIMENTO NAT,                  ';
    sSql := sSql + '     PESSOA P,                            ';
    sSql := sSql + '     PROCJUD PRJ,                         ';
    sSql := sSql + '     AGENCIABANCARIA A,                   ';
    sSql := sSql + '     CONTABANCARIA C                      ';
    sSql := sSql + 'WHERE (I.IDDARF  = D.IDDARF (+))    ';
    sSql := sSql + '      AND (NAT.CODNATUREZA = I.CODNATUREZA)    ';
    sSql := sSql + '      AND (I.IDPESSOA = P.IDPESSOA)         ';
    sSql := sSql + '      AND (I.IDPROCJUD = PRJ.IDPROCJUD)        ';
    sSql := sSql + '      AND (I.IDPESSOA = PRJ.IDPESSOA (+))   ';
    sSql := sSql + '      AND (PRJ.IDAGENCIABANCARIA = A.IDPESSOA (+)) ';
    sSql := sSql + '      AND (PRJ.IDCBANCARIA = C.IDCBANCARIA (+))    ';
    sSql := sSql + '      AND (I.VLRIMPOSTO <> 0)                       ';
    sSql := sSql + '      AND (I.IDDARF IS NOT NULL)                    '; // Andre Imakawa - SIG 61980
    If (pDtInicioApu <> 0) And (pDtFimApu <> 0) Then
    Begin
      sSql := sSql + 'AND (I.DATAPAGAMENTO >= ' + quotedstr(datetostr(pDtInicioApu));
      sSql := sSql + '     AND I.DATAPAGAMENTO <= ' + quotedstr(datetostr(pDtFimApu)) + ' )';
    End;
    sSql := sSql + '      AND (NVL(NAT.FLGUSADONADCTF, ''S'') = ''S'')  ';
    sSql := sSql + '      AND (NVL(NAT.FLGDEPOSITOJUDIC, ''N'') = ''S'') )  '; // Tributos de Depositos Judiciais - 7431, 7416, ...
  End;
  // Paulo Nobre WO8773 - Fim

  sSql := sSql + '  ) TBCR ';

  If pIdChave <> -1 Then                          // Esta variável é para indicar se houve ou não chave passada para pesquisa
    //    If pTipoChave = 0 Then // Esta variável é para indicar qual a chave passada para pesquisa
    //      sSql := sSql + '   WHERE TBCR.IDLANCIRRF = ' + inttostr(pIdChave)
    //    Else
    sSql := sSql + 'WHERE TBCR.IDDARF = ' + inttostr(pIdChave);

  // Paulo Nobre - SIG 41744_43545 - Fim

  CMDebugToFile(#13#10 + sSQL + #13#10);
  // Paulo Nobre WO2061 - Inicio
  sqlText.Clear;
  sqlText.add(sSql);
  sqlText.SaveToFile('C:\Planus\Temp\DCTF\InserirDCTF_CR_DARF_O.txt');
  // Paulo Nobre WO2061 - Fim
  If Not ExecSQL(sSQL) Then
  Begin
    Result := False;
    Exception.Create(Messageinfo);
  End;
End;

// INSERINDO OS DETALHAMENTOS DOS DARFS E DJES

Function TCtrlGeraDCTF_Novo.InserirDetalheDARF_O(Const pIdDCTF, pIdChave {, pTipoChave}: Integer; pDtInicioApu, pDtFimApu: TDateTime): Boolean;
Var sSql: String;
  // Paulo Nobre WO8773 - Inicio
  sqlText: TStringList;
  // Paulo Nobre WO8773 - Fim
Begin
  // Paulo Nobre WO8773 - Inicio
  sqlText := tStringList.create;
  // Paulo Nobre WO8773 - Fim

  // DARF´S
  Result := True;

  sSql := 'INSERT INTO DCTF_DARFDETALHE            ';
  sSql := sSql + 'SELECT ' + inttostr(pIdDCTF) + ',';
  sSql := sSql + '     (SELECT DCD.IDDCTFCRDETALHE_DARF    '; // IDDCTFCRDETALHE_DARF
  sSql := sSql + '      FROM DCTF_CREDITODETALHE_DARF DCD  ';
  sSql := sSql + '      WHERE DCD.IDDCTF = ' + inttostr(pIdDCTF);
  sSql := sSql + '            AND DCD.IDDARF = D.IDDARF    ';
  sSql := sSql + '            AND DCD.TIPODOCTO = ''DARF''), ';
  sSql := sSql + '      SEQDCTF_DARFDETALHE.NEXTVAL,      '; // IDDARFDETALHE
  sSql := sSql + '      D.IDDARF,              ';
  sSql := sSql + '      L.IDLANCIRRF,          ';
  sSql := sSql + '      P.IDPESSOA,            ';
  sSql := sSql + '      P.NUMDOCUMENTO,        ';
  sSql := sSql + '      P.RAZAOSOCIAL NOME,    ';
  sSql := sSql + '      NULL NUMEROPROCESSO,   ';
  sSql := sSql + '      NULL NUMEROPROCJUDICIAL,';
  sSql := sSql + '      NULL CODVARA,          ';
  sSql := sSql + '      NULL NOMEVARA,         ';
  sSql := sSql + '      NULL UFSECAO,          ';
  sSql := sSql + '      NULL IDMUNICIPIO,      ';
  sSql := sSql + '      NULL FLGFAZDEPOSITO,   ';
  sSql := sSql + '      NULL IDMOTIVOSUSPENSAO,';
  sSql := sSql + '      DECODE(L.CODNATUREZA, ''7893'', L.VLRIOF, DECODE(L.CODNATUREZA, ''5952'', L.VLRPIS + L.VLRCSCOFPIS, L.VLRIRRF)) VLRIRRF,  ';
  sSql := sSql + '      ''N'' FLGREGEXCLUIDO,  ';
  sSql := sSql + '      ''S'' FLGMARCADO,      ';
  sSql := sSql + '      SYSDATE,               ';
  sSql := sSql + '      USER,                  ';
  sSql := sSql + '      NULL,                  ';
  sSql := sSql + '      NULL,                  ';
  // Paulo Nobre - SIG 41744_43545 - Inicio
  sSql := sSql + '      NULL                   ';
  // Paulo Nobre - SIG 41744_43545 - Fim
  sSql := sSql + 'FROM DARF D,                 ';
  sSql := sSql + '     LANCIRRF L,             ';
  sSql := sSql + '     DOCUMENTO DOC,          ';
  sSql := sSql + '     NATURENDIMENTO NAT,     ';
  sSql := sSql + '     PESSOA P                ';
  sSql := sSql + 'WHERE L.IDDARF = D.IDDARF    ';
  sSql := sSql + '      AND DOC.CODDOCUMENTO = D.CODDOCUMENTO   ';
  sSql := sSql + '      AND NAT.CODNATUREZA  = L.CODNATUREZA    ';
  sSql := sSql + '      AND L.IDBENEFIRRF    = P.IDPESSOA       ';
  If (pDtInicioApu <> 0) And (pDtFimApu <> 0) Then
  Begin
    sSql := sSql + '      AND (D.DATAINIAPURACAO >= ' + quotedstr(datetostr(pDtInicioApu));
    sSql := sSql + '      AND D.DATAFINALAPURACAO <= ' + quotedstr(datetostr(pDtFimApu)) + ')';

    // Paulo Nobre WO2061 - Inicio
    // Só validar se for gerar DCTF a partir da vigência    
    If sAnoMesRefer >= sAnoMesVigencia Then
    Begin
      sSql := sSql + '       AND L.CODNATUREZA NOT IN (''0561'', ''0588'')   ';
    // Paulo Nobre WO2061 - Fim

      // Paulo Nobre WO8773 - Inicio
      sSql := sSql + '       AND L.CODNATUREZA NOT IN (''0473'',''1708'',''1889'',''3223'',''3533'',''3540'',''3556'',''3579'',''5565'',''8045'',''9466'',''7416'',''7431'',''5952'')   ';
      // Paulo Nobre WO8773 - Fim
    End;

  End;
  sSql := sSql + '      AND (DECODE(L.CODNATUREZA, ''7893'', L.VLRIOF, DECODE(L.CODNATUREZA, ''5952'', L.VLRPIS + L.VLRCSCOFPIS, L.VLRIRRF)) <> 0)    ';
  sSql := sSql + '      AND (DOC.STATUS = ''2'' )                        '; // Baixado/pago
  sSql := sSql + '      AND (NVL(NAT.FLGUSADONADCTF, ''S'') = ''S'')     ';
  sSql := sSql + '      AND (NVL(NAT.FLGDEPOSITOJUDIC, ''N'') <> ''S'')  '; // Sem os Tributos de Depositos Judiciais - 7431, 7416, ...
  sSql := sSql + '      AND (L.IDDARF IS NOT NULL)                       '; // Andre Imakawa - SIG 61993
  // Paulo Nobre - SIG 41744_43545 - Inicio  - NOVA TABELA - IRRFFOLHABENEF

  If pIdChave <> -1 Then                          // Esta variável é para indicar se houve ou não chave passada para pesquisa
    //    If pTipoChave = 0 Then // Esta variável é para indicar qual a chave passada para pesquisa
    //      sSql := sSql + '   AND LIR.IDLANCIRRF = ' + inttostr(pIdChave)
    //    Else
    sSql := sSql + '   AND D.IDDARF = ' + inttostr(pIdChave);

  CMDebugToFile(#13#10 + sSQL + #13#10);
  If Not ExecSQL(sSQL) Then
  Begin
    Result := False;
    Exception.Create(Messageinfo);
  End;
  //
  sSql := 'INSERT INTO DCTF_DARFDETALHE            ';
  sSql := sSql + 'SELECT ' + inttostr(pIdDCTF) + ',';
  sSql := sSql + '     (SELECT DCD.IDDCTFCRDETALHE_DARF AS IDCRDARF   '; // IDDCTFCRDETALHE_DARF
  sSql := sSql + '      FROM DCTF_CREDITODETALHE_DARF DCD  ';
  sSql := sSql + '      WHERE DCD.IDDCTF = ' + inttostr(pIdDCTF);
  sSql := sSql + '            AND DCD.IDDARF = D.IDDARF    ';
  sSql := sSql + '            AND DCD.TIPODOCTO = ''DARF''), ';
  sSql := sSql + '      SEQDCTF_DARFDETALHE.NEXTVAL,      '; // IDDARFDETALHE
  sSql := sSql + '      D.IDDARF,            ';
  sSql := sSql + '      NULL,                  '; // IDLANCIRRF
  sSql := sSql + '      P.IDPESSOA,            ';
  sSql := sSql + '      P.NUMDOCUMENTO,        ';
  sSql := sSql + '      P.RAZAOSOCIAL NOME,    ';
  sSql := sSql + '      NULL NUMEROPROCESSO,   ';
  sSql := sSql + '      NULL NUMEROPROCJUDICIAL,';
  sSql := sSql + '      NULL CODVARA,          ';
  sSql := sSql + '      NULL NOMEVARA,         ';
  sSql := sSql + '      NULL UFSECAO,          ';
  sSql := sSql + '      NULL IDMUNICIPIO,      ';
  sSql := sSql + '      NULL FLGFAZDEPOSITO,   ';
  sSql := sSql + '      NULL IDMOTIVOSUSPENSAO,';
  sSql := sSql + '      I.VLRIMPOSTO,          ';
  sSql := sSql + '      ''N'' FLGREGEXCLUIDO,  ';
  sSql := sSql + '      ''S'' FLGMARCADO,      ';
  sSql := sSql + '      SYSDATE,               ';
  sSql := sSql + '      USER,                  ';
  sSql := sSql + '      NULL,                  ';
  sSql := sSql + '      NULL,                  ';
  sSql := sSql + '      I.IDLANCIRRFFOLHABENEF ';
  sSql := sSql + 'FROM DARF D,                 ';
  sSql := sSql + '     IRRFFOLHABENEF I,       ';
  sSql := sSql + '     DOCUMENTO DOC,          ';
  sSql := sSql + '     NATURENDIMENTO NAT,     ';
  sSql := sSql + '     PESSOA P                ';
  sSql := sSql + 'WHERE I.IDDARF = D.IDDARF    ';
  sSql := sSql + '      AND DOC.CODDOCUMENTO = D.CODDOCUMENTO   ';
  sSql := sSql + '      AND NAT.CODNATUREZA  = I.CODNATUREZA    ';
  sSql := sSql + '      AND I.IDPESSOA    = P.IDPESSOA       ';
  If (pDtInicioApu <> 0) And (pDtFimApu <> 0) Then
  Begin
    sSql := sSql + '    AND (D.DATAINIAPURACAO >= ' + quotedstr(datetostr(pDtInicioApu));
    sSql := sSql + '    AND D.DATAFINALAPURACAO <= ' + quotedstr(datetostr(pDtFimApu)) + ')';

    // Paulo Nobre WO2061 - Inicio
    // Só validar se for gerar DCTF a partir da vigência    
    If sAnoMesRefer >= sAnoMesVigencia Then
    Begin
      sSql := sSql + '       AND I.CODNATUREZA NOT IN (''0561'', ''0588'')   ';
    // Paulo Nobre WO2061 - Fim

      // Paulo Nobre WO8773 - Inicio
      sSql := sSql + '       AND I.CODNATUREZA NOT IN (''0473'',''1708'',''1889'',''3223'',''3533'',''3540'',''3556'',''3579'',''5565'',''8045'',''9466'',''7416'',''7431'',''5952'')   ';
      // Paulo Nobre WO8773 - Fim
    End;

  End;
  sSql := sSql + '      AND (I.VLRIMPOSTO <> 0)                          ';
  sSql := sSql + '      AND (DOC.STATUS = ''2'' )                        '; // Baixado/pago
  sSql := sSql + '      AND (NVL(NAT.FLGUSADONADCTF, ''S'') = ''S'')     ';
  sSql := sSql + '      AND (NVL(NAT.FLGDEPOSITOJUDIC, ''N'') <> ''S'')   '; // Sem os Tributos de Depositos Judiciais - 7431, 7416, ...
  sSql := sSql + '      AND (I.IDDARF IS NOT NULL)                        '; // Andre Imakawa - SIG 61993
  If pIdChave <> -1 Then                          // Esta variável é para indicar se houve ou não chave passada para pesquisa
    sSql := sSql + '   AND D.IDDARF = ' + inttostr(pIdChave);

  CMDebugToFile(#13#10 + sSQL + #13#10);
  // Paulo Nobre WO8773 - Inicio
  sqlText.Clear;
  sqlText.add(sSql);
  sqlText.SaveToFile('C:\Planus\Temp\DCTF\InserirDetalheDARF_O.txt');
  // Paulo Nobre WO8773 - Fim
  If Not ExecSQL(sSQL) Then
  Begin
    Result := False;
    Exception.Create(Messageinfo);
  End;

  // Paulo Nobre - SIG 41744_43545 - Fim
End;

Function TCtrlGeraDCTF_Novo.InserirDetalheDJE_O(Const pIdDCTF, pIdChave {, pTipoChave}: Integer; pDtInicioApu, pDtFimApu: TDateTime): Boolean;
Var sSql: String;
  // Paulo Nobre WO8773 - Inicio
  sqlText: TStringList;
  // Paulo Nobre WO8773 - Fim
Begin
  // Paulo Nobre WO8773 - Inicio
  sqlText := tStringList.create;
  // Paulo Nobre WO8773 - Fim

  Result := True;

  // DJE´S

  // Paulo Nobre WO8773 - Inicio
  // Só trazer esse movimento se for gerar DCTF antes da vigência  
  If sAnoMesRefer < sAnoMesVigencia Then
  Begin
    sSql := 'INSERT INTO DCTF_DARFDETALHE        ';
    sSql := sSql + 'SELECT ' + inttostr(pIdDCTF) + ',';
    sSql := sSql + '     (SELECT DCD.IDDCTFCRDETALHE_DARF    '; // IDDCTFCRDETALHE_DARF
    sSql := sSql + '      FROM DCTF_CREDITODETALHE_DARF DCD  ';
    sSql := sSql + '      WHERE DCD.IDDCTF = ' + inttostr(pIdDCTF);
    sSql := sSql + '            AND DCD.IDLANCIRRF = LIR.IDLANCIRRF '; // Nos Tributos de Processos Judiciais usa o join pelo IDLANCIRRF
    sSql := sSql + '            AND DCD.TIPODOCTO = ''DJE''), ';
    sSql := sSql + '      SEQDCTF_DARFDETALHE.NEXTVAL, '; // IDDARFDETALHE
    sSql := sSql + '      D.IDDARF,              ';
    sSql := sSql + '      LIR.IDLANCIRRF,        ';
    sSql := sSql + '      P.IDPESSOA,            ';
    sSql := sSql + '      P.NUMDOCUMENTO,        ';
    sSql := sSql + '      P.NOME,                ';

    // SOL 238778 PPM 512818 - Paulo Nobre
    sSql := sSql + '      REPLACE(Translate(PRJ.NUMEROPROCESSO, ''.-,'', ''  ''),'' ''), '; // NUMEROPROCESSO - Usado uma função especifica para retirar mascaras
    sSql := sSql + '      REPLACE(Translate(PRJ.NUMEROPROCESSO, ''.-,'', ''  ''),'' ''), '; // NUMPROCJUDICIAL - Usado uma função especifica para retirar mascaras
    sSql := sSql + '      PRJ.CODVARA,           ';
    sSql := sSql + '      SUBSTR(translate(PRJ.NOMEVARA, ''ÁÇÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕËÜáçéíóúàèìòùâêîôûãõëü'',''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu''),1,30),  ';
    sSql := sSql + '      PRJ.UFSECAO,           ';

    // SOL 232145 Kintana 385264 - Paulo Nobre
  {   sSql := sSql + '      REPLACE(Translate(RPJ.NUMEROPROCJUDICIAL, ''.-,'', ''  ''),'' ''), '; // NUMEROPROCESSO  - Usado uma função especifica para retirar mascaras
    sSql := sSql + '      REPLACE(Translate(RPJ.NUMEROPROCJUDICIAL, ''.-,'', ''  ''),'' ''), '; // NUMEROPROCJUDICIAL  - Usado uma função especifica para retirar mascaras
    sSql := sSql + '      RPJ.CODVARA,           ';   // PJ.CODVARA
    // SOL 235562  PPM 461564 - Paulo Nobre
    sSql := sSql + '      SUBSTR(RPJ.NOMEVARA,1,30),  ';  // PJ.NOMEVARA
    sSql := sSql + '      RPJ.UFSECAO,           ';   // PF.SECAO}
    //
    sSql := sSql + '      NULL,                  '; // IDMUNICIPIO
    sSql := sSql + '      PRJ.FLGFAZDEPOSITO,    '; // 0 = Depósito não realizado / 1 = Depósito realizado
    sSql := sSql + '      7,                     '; // IDMOTIVOSUSPENSAO - Default - 7 = "Medida Judicial em que o declarante não é o autor"
    sSql := sSql + '      LIR.VLRIRRF,           '; // VLRSUSPENSO
    sSql := sSql + '      ''N'',                 '; // FLGREGEXCLUIDO
    sSql := sSql + '      ''S'',                 '; // FLGMARCADO
    sSql := sSql + '      SYSDATE,               ';
    sSql := sSql + '      USER,                  ';
    sSql := sSql + '      NULL,                  ';
    sSql := sSql + '      NULL,                  ';
    // Paulo Nobre - SIG 41744_43545 - Inicio
    sSql := sSql + '      NULL                   ';
    // Paulo Nobre - SIG 41744_43545 - Fim
    sSql := sSql + 'FROM DARF        D,          ';
    sSql := sSql + '     LANCIRRF    LIR,        ';
    sSql := sSql + '     NATURENDIMENTO NAT,     ';
    sSql := sSql + '     PESSOA P,               ';
    // SOL 238778 PPM 512818 - Paulo Nobre
    sSql := sSql + '     PROCJUD PRJ  ';
    // SOL 232145 Kintana 385264 - Paulo Nobre
  //   sSql := sSql + '     VW_RELPROCJUDTOTAL RPJ  ';
       //
    sSql := sSql + 'WHERE (LIR.IDDARF  = D.IDDARF (+))                ';
    sSql := sSql + '       AND (LIR.CODNATUREZA = NAT.CODNATUREZA)    ';
    // SOL 235562  PPM 461564 - Paulo Nobre
    sSql := sSql + '       AND (LIR.IDBENEFIRRF = P.IDPESSOA)         ';
    // SOL 241634 PPM 556541 - Paulo Nobre
    sSql := sSql + '       AND (LIR.IDPROCJUD = PRJ.IDPROCJUD)        ';
    //
    // SOL 232145 Kintana 385264 - Paulo Nobre
  //   sSql := sSql + '       AND (LIR.IDBENEFIRRF = RPJ.IDPESSOA (+))   ';
    // SOL 238778 PPM 512818 - Paulo Nobre
    sSql := sSql + '       AND (LIR.IDBENEFIRRF = PRJ.IDPESSOA (+))   ';
    //
    sSql := sSql + '       AND (LIR.VLRIRRF <> 0)                     ';
    If (pDtInicioApu <> 0) And (pDtFimApu <> 0) Then
    Begin
      sSql := sSql + ' AND (LIR.DATALANCAMENTO >= ' + quotedstr(datetostr(pDtInicioApu));
      sSql := sSql + '      AND LIR.DATALANCAMENTO <= ' + quotedstr(datetostr(pDtFimApu)) + ')';
      // SOL 250991  PPM 725121 - Paulo Nobre - 17/03/2015
          {
                      sSql := sSql + ' AND (PRJ.DATAINICIO <= ' + quotedstr(datetostr(pDtFimApu)) + ' )';
                      sSql := sSql + ' AND (PRJ.FLGFAZDEPOSITO = 1)       '; // Depósito judicial foi realizado
                      sSql := sSql + ' AND ((PRJ.SITPROCESSO = 0) OR      '; // Processo Aberto
                      sSql := sSql + '      (PRJ.DATAFINAL >= (SELECT DISTINCT L.DATALANCAMENTO    ';
                      sSql := sSql + '                         FROM LANCIRRF L, NATURENDIMENTO N                    ';
                      sSql := sSql + '                         WHERE N.CODNATUREZA = L.CODNATUREZA   ';
                      sSql := sSql + '                               AND (L.DATALANCAMENTO >= ' + quotedstr(datetostr(pDtInicioApu));
                      sSql := sSql + '                               AND L.DATALANCAMENTO <= ' + quotedstr(datetostr(pDtFimApu)) + ' )';
                      sSql := sSql + '                               AND L.IDMODULO = 18     '; // Folha de Beneficios
                      sSql := sSql + '                               AND NVL(N.FLGDEPOSITOJUDIC, ''N'') = ''S'' )))  '; // Tributos de Depositos Judiciais - 7431, 7416, ...
          }
    End;
    sSql := sSql + '      AND (NVL(NAT.FLGUSADONADCTF, ''S'') = ''S'')    ';
    sSql := sSql + '      AND (NVL(NAT.FLGDEPOSITOJUDIC, ''N'') = ''S'')  '; // Tributos de Depositos Judiciais - 7431, 7416, ...
    sSql := sSql + '      AND (LIR.IDDARF IS NOT NULL)                    '; // Andre Imakawa - SIG 61993
    If pIdChave <> -1 Then                          // Esta variável é para indicar se houve ou não chave passada para pesquisa
      //    If pTipoChave = 0 Then // Esta variável é para indicar qual a chave passada para pesquisa
      //      sSql := sSql + '   AND LIR.IDLANCIRRF = ' + inttostr(pIdChave)
      //    Else
      sSql := sSql + '   AND D.IDDARF = ' + inttostr(pIdChave);

    CMDebugToFile(#13#10 + sSQL + #13#10);
    // Paulo Nobre WO8773 - Inicio
    sqlText.Clear;
    sqlText.add(sSql);
    sqlText.SaveToFile('C:\Planus\Temp\DCTF\InserirDetalheDJE1_O.txt');
    // Paulo Nobre WO8773 - Fim
    If Not ExecSQL(sSQL) Then
    Begin
      Result := False;
      Exception.Create(Messageinfo);
    End;

    // Paulo Nobre - SIG 41744_43545 - Inicio  - NOVA TABELA - IRRFFOLHABENEF
    //
    sSql := 'INSERT INTO DCTF_DARFDETALHE        ';
    sSql := sSql + 'SELECT ' + inttostr(pIdDCTF) + ',';
    sSql := sSql + '     (SELECT DCD.IDDCTFCRDETALHE_DARF AS IDCRDARF   '; // IDDCTFCRDETALHE_DARF
    sSql := sSql + '      FROM DCTF_CREDITODETALHE_DARF DCD  ';
    sSql := sSql + '      WHERE DCD.IDDCTF = ' + inttostr(pIdDCTF);
    sSql := sSql + '            AND DCD.IDLANCIRRFFOLHABENEF = I.IDLANCIRRFFOLHABENEF '; // Nos Tributos de Processos Judiciais usa o join pelo IDLANCIRRFFOLHABENEF
    sSql := sSql + '            AND DCD.TIPODOCTO = ''DJE''), ';
    sSql := sSql + '      SEQDCTF_DARFDETALHE.NEXTVAL, '; // IDDARFDETALHE
    sSql := sSql + '      D.IDDARF,              ';
    sSql := sSql + '      NULL,                  '; // IDLANCIRRF
    sSql := sSql + '      P.IDPESSOA,            ';
    sSql := sSql + '      P.NUMDOCUMENTO,        ';
    sSql := sSql + '      P.NOME,                ';
    sSql := sSql + '      REPLACE(Translate(PRJ.NUMEROPROCESSO, ''.-,'', ''  ''),'' ''), '; // NUMEROPROCESSO - Usado uma função especifica para retirar mascaras
    sSql := sSql + '      REPLACE(Translate(PRJ.NUMEROPROCESSO, ''.-,'', ''  ''),'' ''), '; // NUMPROCJUDICIAL - Usado uma função especifica para retirar mascaras
    sSql := sSql + '      PRJ.CODVARA,           ';
    sSql := sSql + '      SUBSTR(translate(PRJ.NOMEVARA, ''ÁÇÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕËÜáçéíóúàèìòùâêîôûãõëü'',''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu''),1,30),  ';
    sSql := sSql + '      PRJ.UFSECAO,           ';
    sSql := sSql + '      NULL,                  '; // IDMUNICIPIO
    sSql := sSql + '      PRJ.FLGFAZDEPOSITO,    '; // 0 = Depósito não realizado / 1 = Depósito realizado
    sSql := sSql + '      7,                     '; // IDMOTIVOSUSPENSAO - Default - 7 = "Medida Judicial em que o declarante não é o autor"
    sSql := sSql + '      I.VLRIMPOSTO,          '; // VLRSUSPENSO
    sSql := sSql + '      ''N'',                 '; // FLGREGEXCLUIDO
    sSql := sSql + '      ''S'',                 '; // FLGMARCADO
    sSql := sSql + '      SYSDATE,               ';
    sSql := sSql + '      USER,                  ';
    sSql := sSql + '      NULL,                  ';
    sSql := sSql + '      NULL,                  ';
    sSql := sSql + '      I.IDLANCIRRFFOLHABENEF ';
    sSql := sSql + 'FROM DARF D,                 ';
    sSql := sSql + '     IRRFFOLHABENEF I,       ';
    sSql := sSql + '     NATURENDIMENTO NAT,     ';
    sSql := sSql + '     PESSOA P,               ';
    sSql := sSql + '     PROCJUD PRJ  ';
    sSql := sSql + 'WHERE (I.IDDARF  = D.IDDARF (+))                ';
    sSql := sSql + '       AND (I.CODNATUREZA = NAT.CODNATUREZA)    ';
    sSql := sSql + '       AND (I.IDPESSOA = P.IDPESSOA)         ';
    sSql := sSql + '       AND (I.IDPROCJUD = PRJ.IDPROCJUD)        ';
    sSql := sSql + '       AND (I.IDPESSOA = PRJ.IDPESSOA (+))   ';
    //
    If (pDtInicioApu <> 0) And (pDtFimApu <> 0) Then
    Begin
      sSql := sSql + 'AND (I.DATAPAGAMENTO >= ' + quotedstr(datetostr(pDtInicioApu));
      sSql := sSql + '     AND I.DATAPAGAMENTO <= ' + quotedstr(datetostr(pDtFimApu)) + ' )';
    End;
    sSql := sSql + '      AND (I.VLRIMPOSTO <> 0)                     ';
    sSql := sSql + '      AND (NVL(NAT.FLGUSADONADCTF, ''S'') = ''S'')    ';
    sSql := sSql + '      AND (NVL(NAT.FLGDEPOSITOJUDIC, ''N'') = ''S'')  '; // Tributos de Depositos Judiciais - 7431, 7416, ...
    sSql := sSql + '      AND (I.IDDARF IS NOT NULL)                    '; // Andre Imakawa - SIG 61993
    If pIdChave <> -1 Then                          // Esta variável é para indicar se houve ou não chave passada para pesquisa
      //    If pTipoChave = 0 Then // Esta variável é para indicar qual a chave passada para pesquisa
      //      sSql := sSql + '   AND I.IDLANCIRRFFOLHABENEF = ' + inttostr(pIdChave)
      //    Else
      sSql := sSql + '   AND D.IDDARF = ' + inttostr(pIdChave);

    CMDebugToFile(#13#10 + sSQL + #13#10);
    // Paulo Nobre WO8773 - Inicio
    sqlText.Clear;
    sqlText.add(sSql);
    sqlText.SaveToFile('C:\Planus\Temp\DCTF\InserirDetalheDJE2_O.txt');
    // Paulo Nobre WO8773 - Fim
    If Not ExecSQL(sSQL) Then
    Begin
      Result := False;
      Exception.Create(Messageinfo);
    End;

    // Paulo Nobre - SIG 41744_43545 - Fim

  End;
  // Paulo Nobre WO8773 - Fim
End;

// SOL 235337/16319 PPM 457199 - Paulo Nobre

Function TCtrlGeraDCTF_Novo.InserirDCTF_DadosAdicionais_O(Const pIdDCTF: Integer; pMes: String; pVersao, pIdFormTribLucro, pIdQualifPj, pIdCritRecon,
  pIdRegimeApur, pIdSituacaoPj, pIdOpcaoLei, pFlgBalanSusp, pFlgDebScp, pOptSimples,
  pOptCprb, pFlgInativa: Integer): Boolean;
Var sSql: String;
  // Paulo Nobre WO8773 - Inicio
  sqlText: TStringList;
  // Paulo Nobre WO8773 - Fim
Begin
  // Paulo Nobre WO8773 - Inicio
  sqlText := tStringList.create;
  // Paulo Nobre WO8773 - Fim

  Result := True;

  sSql := 'INSERT INTO DCTF_DADOSADICIONAIS           ';
  sSql := sSql + 'SELECT ' + inttostr(pIdDCTF) + ',';
  sSql := sSql + '               EMP.NUMDOCUMENTO,    ';
  sSql := sSql + '               EMP.RAZAOSOCIAL,     ';
  sSql := sSql + '               EMP.EMAIL,           ';
  sSql := sSql + '               EMP.CODFUNDSPC,      ';
  sSql := sSql + '               EMP.LOGRADOURO,      ';
  sSql := sSql + '               EMP.NUMERO,          ';
  sSql := sSql + '               EMP.COMPLEMENTO,     ';
  sSql := sSql + '               EMP.BAIRRO,          ';
  sSql := sSql + '               EMP.CEP,             ';
  sSql := sSql + '               EMP.MUNICIPIO,       ';
  sSql := sSql + '               EMP.UF,              ';
  sSql := sSql + '               EMP.DDD,             ';
  sSql := sSql + '               EMP.NUMEROTEL,       ';
  sSql := sSql + '               EMP.DDDFAX,          ';
  sSql := sSql + '               EMP.NUMEROFAX,       ';
  sSql := sSql + '               EMP.IDFORMTRIBLUCRO, ';
  sSql := sSql + '               EMP.IDQUALIFPJ,      ';
  sSql := sSql + '               EMP.IDCRITRECON,     ';
  sSql := sSql + '               REPR.*,              ';
  sSql := sSql + '               RESP.*,              ';
  sSql := sSql + '               SYSDATE,             ';
  sSql := sSql + '               USER,                ';
  sSql := sSql + '               EMP.IDREGIMEAPUR,    ';
  sSql := sSql + '               EMP.IDSITUACAOPJ,    ';
  sSql := sSql + '               EMP.IDOPCAOLEI,      ';
  //SIG48772 - Início
  sSql := sSql + '               EMP.VERSAO,          ';
  sSql := sSql + '               EMP.FLGBALANSUSP,    ';
  sSql := sSql + '               EMP.FLGDEBSCP,       ';
  sSql := sSql + '               EMP.OPTSIMPLES,      ';
  sSql := sSql + '               EMP.OPTCPRB,         ';
  sSql := sSql + '               EMP.FLGINATIVA       ';
  //SIG48772 - Fim
  sSql := sSql + 'FROM (SELECT P.NUMDOCUMENTO,        ';
  sSql := sSql + '               P.RAZAOSOCIAL,       ';
  sSql := sSql + '               P.EMAIL,             ';
  sSql := sSql + '               F.CODFUNDSPC,        ';
  sSql := sSql + '               E.LOGRADOURO,        ';
  sSql := sSql + '               E.NUMERO,            ';
  sSql := sSql + '               E.COMPLEMENTO,       ';
  sSql := sSql + '               E.BAIRRO,            ';
  sSql := sSql + '               E.CEP,               ';
  sSql := sSql + '               C.NOME AS MUNICIPIO,    ';
  sSql := sSql + '               C.UF,                   ';
  sSql := sSql + '               TD.DDD,                 ';
  sSql := sSql + '               TD.NUMERO AS NUMEROTEL, ';
  sSql := sSql + '               TF.DDD AS DDDFAX,       ';
  sSql := sSql + '               TF.NUMERO AS NUMEROFAX, ';
  //SIG 48772 - Início
  {
  // SOL 238778 PPM 512818 - Paulo Nobre  (este defaults abaixo, podem ser parametrizáveis)
  sSql := sSql + '               5 IDFORMTRIBLUCRO,      '; // Isenta de IRRJ
  sSql := sSql + '               5 IDQUALIFPJ,           '; // Entidades de Previdencia Privada...
  If pMes = '01' Then // Janeiro
    sSql := sSql + '               4 IDCRITRECON,          ' // Não se Aplica
  Else
    sSql := sSql + '               5 IDCRITRECON,          '; // Sem alteração do regime
  sSql := sSql + '               2 IDREGIMEAPUR,         '; // Cumulativo
  sSql := sSql + '               4 IDSITUACAOPJ,         '; // Não se enquadra em nenhuma das.....
  sSql := sSql + '               0 IDOPCAOLEI            '; // Não preenchido}

  sSql := sSql + '               ' + IntToStr(pIdFormTribLucro) + ' IDFORMTRIBLUCRO, ';
  sSql := sSql + '               ' + IntToStr(pIdQualifPj) + ' IDQUALIFPJ, ';
  If pMes = '01' Then                             // Janeiro
    sSql := sSql + '               4 IDCRITRECON,          ' // Não se Aplica
  Else
    sSql := sSql + '             ' + IntToStr(pIdCritRecon) + ' IDCRITRECON, '; // Sem alteração do regime
  sSql := sSql + '               ' + IntToStr(pIdRegimeApur) + ' IDREGIMEAPUR, ';
  sSql := sSql + '               ' + IntToStr(pIdSituacaoPj) + ' IDSITUACAOPJ, ';
  sSql := sSql + '               ' + IntToStr(pIdOpcaoLei) + ' IDOPCAOLEI, ';
  sSql := sSql + '               ' + IntToStr(pFlgBalanSusp) + ' FLGBALANSUSP, ';
  sSql := sSql + '               ' + IntToStr(pFlgDebScp) + ' FLGDEBSCP, ';
  sSql := sSql + '               ' + IntToStr(pOptSimples) + ' OPTSIMPLES, ';
  sSql := sSql + '               ' + IntToStr(pOptCprb) + ' OPTCPRB, ';
  sSql := sSql + '               ' + IntToStr(pFlgInativa) + ' FLGINATIVA, ';
  sSql := sSql + '               ' + IntToStr(pVersao) + ' VERSAO ';
  //SIG 48772 - Fim
  sSql := sSql + '          FROM FUNDACAO F,             ';
  sSql := sSql + '               PESSOA P,               ';
  sSql := sSql + '               ENDPESS E,              ';
  sSql := sSql + '               CIDADES C,              ';
  sSql := sSql + '               (SELECT IDENDERECO, NUMERO, DDD  ';
  sSql := sSql + '                  FROM TELENDPESS               ';
  sSql := sSql + '                 WHERE TIPO LIKE ''%C%'') TD,   '; // TELEFONE COMERCIAL
  sSql := sSql + '               (SELECT IDENDERECO, NUMERO, DDD  ';
  sSql := sSql + '                  FROM TELENDPESS               ';
  sSql := sSql + '                 WHERE TIPO LIKE ''%F%'') TF    '; // FAX
  sSql := sSql + '         WHERE (F.IDPESSOA = P.IDPESSOA)        ';
  sSql := sSql + '           AND (P.IDPESSOA = E.IDPESSOA)        ';
  sSql := sSql + '           AND (P.IDENDCOMERCIAL = E.IDENDERECO)';
  sSql := sSql + '           AND (E.IDCIDADES = C.IDCIDADES)      ';
  sSql := sSql + '           AND (E.IDENDERECO = TD.IDENDERECO(+))';
  sSql := sSql + '           AND (E.IDENDERECO = TF.IDENDERECO(+))) EMP   ';
  sSql := sSql + ' LEFT JOIN (SELECT P.IDPESSOA,                          ';
  sSql := sSql + '   TRIM(P.NUMDOCUMENTO) CPF,                            ';
  sSql := sSql + '   P.NOME,                                              ';
  sSql := sSql + '   T.DDD,                                               ';
  sSql := sSql + '   T.NUMERO,                                            ';
  sSql := sSql + '   UPPER(P.EMAIL)                                       ';
  sSql := sSql + '   FROM PESSOA P, ENDPESS E, TELENDPESS T               ';
  // SOL 238778 PPM 512818 - Paulo Nobre
  sSql := sSql + '   WHERE P.IDPESSOA = (SELECT IDPESSOA                                        ';
  sSql := sSql + '    										 FROM (SELECT RANK () OVER (ORDER BY R.ORDEM) AS ORD, ';
  sSql := sSql + '   											     	 				R.IDPESSOA                              ';
  sSql := sSql + '   												    	 FROM RESPCENTCUST R                          ';
  sSql := sSql + '                                 JOIN CENTCUST C                              ';
  sSql := sSql + '                                   ON C.CODCENTROCUSTO = R.CODCENTROCUSTO     ';
  sSql := sSql + '                                  AND C.STATUSGRUPOCDC = ''A''                ';
  sSql := sSql + '                                  AND C.NOME = ''DIACO''                      ';
  sSql := sSql + '   														   JOIN PESSOA P ON P.IDPESSOA = R.IDPESSOA     ';
//  sSql := sSql + '   														  WHERE (R.DTFIMVIG IS NULL                     ';    WO10452 Ferrari
//  sSql := sSql + '   																	  	 OR R.DTFIMVIG <= LAST_DAY(SYSDATE))) ';    WO10452 Ferrari
  sSql := sSql + '   														  WHERE R.DTFIMVIG IS NULL   )                  ';    // WO10452 Ferrari
  sSql := sSql + '   												WHERE ORD = 1)                                      ';
  sSql := sSql + '   AND P.IDPESSOA = E.IDPESSOA                          ';
  sSql := sSql + '   AND E.IDENDERECO = T.IDENDERECO                      ';
  sSql := sSql + '   AND T.IDTELEFONE = (SELECT MAX(T1.IDTELEFONE) FROM TELENDPESS T1 WHERE T.IDENDERECO = T1.IDENDERECO)) REPR ON 1=1 ';
  sSql := sSql + ' LEFT JOIN (SELECT P.IDPESSOA,       ';
  sSql := sSql + '   TRIM(P.NUMDOCUMENTO) CPF,         ';
  sSql := sSql + '   P.NOME,                           ';
  sSql := sSql + '   D.NUMDOCUMENTO NUMCRC,            ';
  sSql := sSql + '   O.CODESTADO UFCRC,                ';
  sSql := sSql + '   T.DDD,                            ';
  sSql := sSql + '   T.NUMERO,                         ';
  sSql := sSql + '   UPPER(P.EMAIL)                    ';
  sSql := sSql + '   FROM PESSOA P, ENDPESS E, TELENDPESS T, DOCPESSOA D, TIPODOCPESSOA C, ESTADO O  ';
  sSql := sSql + '   WHERE P.IDPESSOA =  (SELECT PE.IDPESSOA                                         ';
  sSql := sSql + '   											  FROM CM.PESSOA PE                                        ';
  sSql := sSql + '   											  JOIN CM.CENTCUST CEN                                     ';
  sSql := sSql + '   											    ON CEN.STATUSGRUPOCDC = ''A'' AND CEN.ATIVO = ''S''    ';
  sSql := sSql + '   											   AND CEN.NOME = ''CONTAB''                               ';
  sSql := sSql + '   											  JOIN CM.FUNCIONARIO FU                                   ';
  sSql := sSql + '   											    ON FU.IDPESSOA = PE.IDPESSOA                           ';
  sSql := sSql + '   											   AND FU.CODCENTROCUSTO = CEN.CODCENTROCUSTO              ';
  sSql := sSql + '   											   AND FU.IDSITFUNC = 1                                    ';
  sSql := sSql + '   											  JOIN CM.CARGO CAR                                        ';
  sSql := sSql + '   											    ON CAR.IDCARGO = FU.IDFUNCAO                           ';
  sSql := sSql + '   											   AND CAR.IDCARGO = 200123 )                              ';
  sSql := sSql + '   AND P.IDPESSOA = E.IDPESSOA                         ';
  sSql := sSql + '   AND E.IDENDERECO = T.IDENDERECO                     ';
  sSql := sSql + '   AND T.IDTELEFONE = (SELECT MAX(T1.IDTELEFONE) FROM TELENDPESS T1 WHERE T1.IDENDERECO = T.IDENDERECO )  ';
  sSql := sSql + '   AND p.idpessoa = d.idpessoa                         ';
  sSql := sSql + '   AND c.iddocumento = d.iddocumento                   ';
  sSql := sSql + '   AND o.idestado = d.idestado                         ';
  sSql := sSql + '   AND c.iddocumento = 41 ) RESP ON 1=1                '; // Num CRC do Contador

  CMDebugToFile(#13#10 + sSQL + #13#10);
  // Paulo Nobre WO8773 - Inicio
  sqlText.Clear;
  sqlText.add(sSql);
  sqlText.SaveToFile('C:\Planus\Temp\DCTF\InserirDCTF_DadosAdicionais_O.txt');
  // Paulo Nobre WO8773 - Fim
  If Not ExecSQL(sSQL) Then
  Begin
    Result := False;
    Exception.Create(Messageinfo);
  End;

End;

// ****************************** RETIFICADORA *********************************************************************

Function TCtrlGeraDCTF_Novo.InserirDCTF_DBDetalhes_R(Const pIdDCTF, pIdDCTF2: Integer): Boolean;
Var sSql: String;
Begin
  Result := True;
  sSql := 'INSERT INTO DCTF_DEBITODETALHE              ';
  sSql := sSql + 'SELECT ' + inttostr(pIdDCTF) + ',';
  sSql := sSql + '      SEQDCTF_DEBITODETALHE.NEXTVAL, '; // IDDCTFDEBITODETALHE
  sSql := sSql + '      TIPOMOV,                       ';
  sSql := sSql + '      CODNATUREZA,                   ';
  sSql := sSql + '      CODNATURASSOCIADA,             ';
  sSql := sSql + '      CODPROVDESC,                   ';
  sSql := sSql + '      IDRUBRICA,                     ';
  sSql := sSql + '      IDCONTRATOEMPTMO,              ';
  sSql := sSql + '      CODALTERADOR,                  ';
  sSql := sSql + '      IDHSTFOLHABENEF,               ';
  sSql := sSql + '      IDPESSOA,                      ';
  sSql := sSql + '      MATRICULA,                     ';
  sSql := sSql + '      NUMDOCUMENTO,                  ';
  sSql := sSql + '      NOME,                          ';
  sSql := sSql + '      VLRIRRF,                       ';
  sSql := sSql + '      FLGMARCADO,                    ';
  sSql := sSql + '      DATAAPURACAO                   ';
  sSql := sSql + 'FROM DCTF_DEBITODETALHE DD           ';
  sSql := sSql + 'WHERE DD.IDDCTF = ' + inttostr(pIdDCTF2);
  If Not ExecSQL(sSQL) Then
  Begin
    Result := False;
    Exception.Create(Messageinfo);
  End;
End;

Function TCtrlGeraDCTF_Novo.InserirDCTF_CR_DARF_R(Const pIdDCTF, pIdDCTF2: Integer): Boolean;
Var sSql: String;
Begin
  Result := True;
  sSql := 'INSERT INTO DCTF_CREDITODETALHE_DARF  ';
  sSql := sSql + 'SELECT ' + inttostr(pIdDCTF) + ',';
  sSql := sSql + '         SEQDCTF_CREDITODETALHE_DARF.NEXTVAL, '; // IDDCTFCRDETALHE_DARF
  sSql := sSql + '         TIPODOCTO,            ';
  sSql := sSql + '         CODNATUREZA,          ';
  sSql := sSql + '         CODNATURASSOCIADA,    ';
  sSql := sSql + '         IDDARF,               ';
  sSql := sSql + '         IDLANCIRRF,           ';
  sSql := sSql + '         NUMDOCUMENTO,         ';
  sSql := sSql + '         REFERENCIA,           ';
  sSql := sSql + '         PROCESSO,             ';
  sSql := sSql + '         DATAINICIOAPURACAO,   ';
  sSql := sSql + '         DATAFIMAPURACAO,      ';
  sSql := sSql + '         DATAVENCDARF,         ';
  sSql := sSql + '         VLRIRRF,              ';
  sSql := sSql + '         VLRMULTA,             ';
  sSql := sSql + '         VLRJUROS,             ';
  sSql := sSql + '         VLRTOTAL,             ';
  sSql := sSql + '         FLGREGEXCLUIDO,       ';
  sSql := sSql + '         FLGMARCADO,           ';
  sSql := sSql + '         SYSDATE,              '; // TRGDTINCLUSAO
  sSql := sSql + '         USER,                 '; // TRGUSERINCLUSAO
  sSql := sSql + '         NULL,                 '; // TRGDTEXCLUSAO
  sSql := sSql + '         NULL,                 '; // TRGUSEREXCLUSAO
  // Paulo Nobre - SIG 41744_43545 - Inicio
  sSql := sSql + '         IDLANCIRRFFOLHABENEF      ';
  // Paulo Nobre - SIG 41744_43545 - Fim
  sSql := sSql + 'FROM DCTF_CREDITODETALHE_DARF DCD ';
  sSql := sSql + 'WHERE DCD.IDDCTF = ' + inttostr(pIdDCTF2);
  If Not ExecSQL(sSQL) Then
  Begin
    Result := False;
    Exception.Create(Messageinfo);
  End;
End;

Function TCtrlGeraDCTF_Novo.InserirDetalheDARF_R(Const pIdDCTF, pIdDCTF2: Integer): Boolean;
Var sSql: String;
Begin
  Result := True;
  sSql := 'INSERT INTO DCTF_DARFDETALHE                    ';
  sSql := sSql + 'SELECT ' + inttostr(pIdDCTF) + ',';
  sSql := sSql + '     (SELECT DCD.IDDCTFCRDETALHE_DARF    '; // IDDCTFCRDETALHE_DARF
  sSql := sSql + '      FROM DCTF_CREDITODETALHE_DARF DCD  ';
  sSql := sSql + '      WHERE DCD.IDDCTF = ' + inttostr(pIdDCTF);
  sSql := sSql + '            AND DCD.IDDARF = DD.IDDARF ';
  sSql := sSql + '            AND DCD.TIPODOCTO = ''DARF''), ';
  sSql := sSql + '      SEQDCTF_DARFDETALHE.NEXTVAL,       '; // IDDARFDETALHE
  sSql := sSql + '      DD.IDDARF,                ';
  sSql := sSql + '      DD.IDLANCIRRF,            ';
  sSql := sSql + '      DD.IDPESSOA,              ';
  sSql := sSql + '      DD.NUMDOCUMENTO,          ';
  sSql := sSql + '      DD.NOME,                  ';
  sSql := sSql + '      DD.NUMEROPROCESSO,        ';
  sSql := sSql + '      DD.NUMEROPROCJUDICIAL,    ';
  sSql := sSql + '      DD.CODVARA,               ';
  sSql := sSql + '      DD.NOMEVARA,              ';
  sSql := sSql + '      DD.UFVARA,                ';
  sSql := sSql + '      DD.IDMUNICIPIO,           ';
  sSql := sSql + '      DD.FLGFAZDEPOSITO,        ';
  sSql := sSql + '      DD.IDMOTIVOSUSPENSAO,     ';
  sSql := sSql + '      DD.VLRIRRF,               ';
  sSql := sSql + '      DD.FLGREGEXCLUIDO,        ';
  sSql := sSql + '      DD.FLGMARCADO,            ';
  sSql := sSql + '      SYSDATE,                  '; // TRGDTINCLUSAO
  sSql := sSql + '      USER,                     '; // TRGUSERINCLUSAO
  sSql := sSql + '      NULL,                     '; // TRGDTEXCLUSAO
  sSql := sSql + '      NULL,                     '; // TRGUSEREXCLUSAO
  // Paulo Nobre - SIG 41744_43545 - Inicio
  sSql := sSql + '      DD.IDLANCIRRFFOLHABENEF   ';
  // Paulo Nobre - SIG 41744_43545 - Fim
  sSql := sSql + 'FROM DCTF_CREDITODETALHE_DARF CD, DCTF_DARFDETALHE DD        ';
  sSql := sSql + 'WHERE CD.IDDCTF = DD.IDDCTF                                  ';
  sSql := sSql + '      AND CD.IDDCTFCRDETALHE_DARF = DD.IDDCTFCRDETALHE_DARF  ';
  sSql := sSql + '      AND CD.IDDCTF = ' + inttostr(pIdDCTF2);
  sSql := sSql + '      AND CD.IDLANCIRRF IS NULL                              ';
  sSql := sSql + '      AND CD.IDLANCIRRFFOLHABENEF IS NULL                              ';
  // SOL 254607 PPM 801620 - Paulo Nobre   21/05/2015
  //sSql := sSql + '      AND CD.IDDARF IS NOT NULL                              ';  // Andre Imakawa - SIG 68125
  sSql := sSql + '      AND DD.IDDARF IS NOT NULL                              '; // Andre Imakawa - SIG 68125
  sSql := sSql + '      AND TRIM(CD.TIPODOCTO) = ''DARF''                        ';
  If Not ExecSQL(sSQL) Then
  Begin
    Result := False;
    Exception.Create(Messageinfo);
  End;
End;

Function TCtrlGeraDCTF_Novo.InserirDetalheDJE_R(Const pIdDCTF, pIdDCTF2: Integer): Boolean;
Var sSql: String;
Begin
  Result := True;
  sSql := 'INSERT INTO DCTF_DARFDETALHE                    ';
  sSql := sSql + 'SELECT ' + inttostr(pIdDCTF) + ',';
  sSql := sSql + '     (SELECT DCD.IDDCTFCRDETALHE_DARF    '; // IDDCTFCRDETALHE_DARF
  sSql := sSql + '      FROM DCTF_CREDITODETALHE_DARF DCD  ';
  sSql := sSql + '      WHERE DCD.IDDCTF = ' + inttostr(pIdDCTF);
  // SOL 256772 PPM 964770 - Paulo Nobre - 01/06/2015
  //  sSql := sSql + '            AND DCD.IDLANCIRRF = DD.IDLANCIRRF ';
  // Paulo Nobre - SIG 41744_43545 - Inicio
  sSql := sSql + '            AND (((DCD.IDLANCIRRF = DD.IDLANCIRRF) OR ';
  sSql := sSql + '                 (DCD.IDLANCIRRF IS NULL AND DD.IDLANCIRRFFOLHABENEF IS NULL AND  DCD.NUMDOCUMENTO = DD.NUMDOCUMENTO AND DCD.VLRIRRF = DD.VLRIRRF)) '; // Andre Imakawa - SIG 74073

  //Darivaldo Alencar SIG64484 -inicio
  sSql := sSql + '      OR  (DCD.IDLANCIRRFFOLHABENEF = DD.IDLANCIRRFFOLHABENEF)) ';
  //sSql := sSql + '            OR ((DCD.IDLANCIRRFFOLHABENEF = DD.IDLANCIRRFFOLHABENEF) OR ';
  //sSql := sSql + '                 (DCD.IDLANCIRRFFOLHABENEF IS NULL AND DCD.NUMDOCUMENTO = DD.NUMDOCUMENTO AND DCD.VLRIRRF = DD.VLRIRRF))) ';
  //Darivaldo Alencar SIG64484 -fim

  sSql := sSql + '            AND DCD.TIPODOCTO = ''DJE''), ';
  sSql := sSql + '      SEQDCTF_DARFDETALHE.NEXTVAL,       '; // IDDARFDETALHE
  sSql := sSql + '      DD.IDDARF,                ';
  sSql := sSql + '      DD.IDLANCIRRF,            ';
  sSql := sSql + '      DD.IDPESSOA,              ';
  sSql := sSql + '      DD.NUMDOCUMENTO,          ';
  sSql := sSql + '      DD.NOME,                  ';
  sSql := sSql + '      DD.NUMEROPROCESSO,        ';
  sSql := sSql + '      DD.NUMEROPROCJUDICIAL,    ';
  sSql := sSql + '      DD.CODVARA,               ';
  sSql := sSql + '      DD.NOMEVARA,              ';
  sSql := sSql + '      DD.UFVARA,                ';
  sSql := sSql + '      DD.IDMUNICIPIO,           ';
  sSql := sSql + '      DD.FLGFAZDEPOSITO,        ';
  sSql := sSql + '      DD.IDMOTIVOSUSPENSAO,     ';
  sSql := sSql + '      DD.VLRIRRF,               ';
  sSql := sSql + '      DD.FLGREGEXCLUIDO,        ';
  sSql := sSql + '      DD.FLGMARCADO,            ';
  sSql := sSql + '      SYSDATE,                  ';
  sSql := sSql + '      USER,                     ';
  sSql := sSql + '      NULL,                     ';
  sSql := sSql + '      NULL,                     ';
  sSql := sSql + '      DD.IDLANCIRRFFOLHABENEF   ';
  // Paulo Nobre - SIG 41744_43545 - Fim
  sSql := sSql + 'FROM DCTF_CREDITODETALHE_DARF CD, DCTF_DARFDETALHE DD        ';
  sSql := sSql + 'WHERE CD.IDDCTF = DD.IDDCTF                                  ';
  sSql := sSql + '      AND CD.IDDCTFCRDETALHE_DARF = DD.IDDCTFCRDETALHE_DARF  ';
  sSql := sSql + '      AND CD.IDDCTF = ' + inttostr(pIdDCTF2);
  // SOL 256772 PPM 964770 - Paulo Nobre - 01/06/2015
//  sSql := sSql + '      AND CD.IDLANCIRRF IS NOT NULL                          ';
//  sSql := sSql + '      AND CD.IDDARF IS NOT NULL                              ';
  sSql := sSql + '      AND TRIM(CD.TIPODOCTO) = ''DJE''                        ';
  If Not ExecSQL(sSQL) Then
  Begin
    Result := False;
    Exception.Create(Messageinfo);
  End;
End;

Function TCtrlGeraDCTF_Novo.InserirDCTF_CR_DCOMP_R(Const pIdDCTF, pIdDCTF2: Integer): Boolean;
Var sSql: String;
Begin
  Result := True;
  sSql := 'INSERT INTO DCTF_CREDITODETALHE_DCOMP    ';
  sSql := sSql + 'SELECT ' + inttostr(pIdDCTF) + ',';
  sSql := sSql + '         SEQDCTF_CREDITODETALHE_DCOMP.NEXTVAL, '; // IDDCTFCRDETALHE_DCOMP
  sSql := sSql + '         TIPODOCTO,                  ';
  sSql := sSql + '         CODNATUREZA,                ';
  sSql := sSql + '         NUMDOCUMENTO,               ';
  sSql := sSql + '         REFERENCIA,                 ';
  sSql := sSql + '         PROCESSO,                   ';
  sSql := sSql + '         DATAINICIOAPURACAO,         ';
  sSql := sSql + '         DATAFIMAPURACAO,            ';
  sSql := sSql + '         DATAVENCTO,                 ';
  sSql := sSql + '         DATACREDITO,                ';
  sSql := sSql + '         VALORCR_ORIGINAL,           ';
  sSql := sSql + '         MOECODIGO,                  ';
  sSql := sSql + '         COTVALOR,                   ';
  sSql := sSql + '         VALORCR_ATUALIZADO,         ';
  sSql := sSql + '         VALORCR_ORIGINAL_UTILIZADO, ';
  sSql := sSql + '         VALORCR_SALDO_ORIGINAL,     ';
  sSql := sSql + '         IDFORMAPEDIDO,              ';
  sSql := sSql + '         NUMPERDCOMP,                ';
  sSql := sSql + '         NUMPERDCOMPREF,             ';
  sSql := sSql + '         FLGREGEXCLUIDO,             ';
  sSql := sSql + '         FLGMARCADO,                 ';
  sSql := sSql + '         SYSDATE,                    ';
  sSql := sSql + '         USER,                       ';
  sSql := sSql + '         NULL,                       ';
  sSql := sSql + '         NULL                        ';
  sSql := sSql + 'FROM DCTF_CREDITODETALHE_DCOMP       ';
  sSql := sSql + 'WHERE IDDCTF = ' + inttostr(pIdDCTF2);
  If Not ExecSQL(sSQL) Then
  Begin
    Result := False;
    Exception.Create(Messageinfo);
  End;
End;

Function TCtrlGeraDCTF_Novo.InserirDCTF_DadosAdicionais_R(Const pIdDCTF, pIdDCTF2: Integer): Boolean;
Var sSql: String;
Begin
  Result := True;
  sSql := 'INSERT INTO DCTF_DADOSADICIONAIS  ';
  sSql := sSql + 'SELECT ' + inttostr(pIdDCTF) + ',';
  sSql := sSql + '     CNPJFUNDACAO,     ';
  sSql := sSql + '     NOMEFUNDACAO,     ';
  sSql := sSql + '     EMAILFUND,        ';
  sSql := sSql + '     CODFUNDSPC,       ';
  sSql := sSql + '     LOGRADFUND,       ';
  sSql := sSql + '     NUMFUND,          ';
  sSql := sSql + '     COMPLFUND,        ';
  sSql := sSql + '     BAIRROFUND,       ';
  sSql := sSql + '     CEPFUND,          ';
  sSql := sSql + '     MUNFUND,          ';
  sSql := sSql + '     UFFUND,           ';
  sSql := sSql + '     DDDFUND,          ';
  sSql := sSql + '     TELFUND,          ';
  sSql := sSql + '     DDDFAXFUND,       ';
  sSql := sSql + '     FAXFUND,          ';
  sSql := sSql + '     IDFORMTRIBLUCRO,  ';
  sSql := sSql + '     IDQUALIFPJ ,      ';
  sSql := sSql + '     IDCRITRECON,      ';
  sSql := sSql + '     IDREPRES,         ';
  sSql := sSql + '     CPFREPRES,        ';
  sSql := sSql + '     NOMEREPRES,       ';
  sSql := sSql + '     DDDREPRES,        ';
  sSql := sSql + '     FONEREPRES,       ';
  sSql := sSql + '     EMAILREPRES,      ';
  sSql := sSql + '     IDRESP,           ';
  sSql := sSql + '     CPFRESP,          ';
  sSql := sSql + '     NOMERESP,         ';
  sSql := sSql + '     CRCRESP,          ';
  sSql := sSql + '     UFCRCRESP,        ';
  sSql := sSql + '     DDDRESP,          ';
  sSql := sSql + '     FONERESP,         ';
  sSql := sSql + '     EMAILRESP,        ';
  sSql := sSql + '     SYSDATE,          ';
  sSql := sSql + '     USER,             ';
  sSql := sSql + '     IDREGIMEAPUR,     ';
  sSql := sSql + '     IDSITUACAOPJ,     ';
  sSql := sSql + '     IDOPCAOLEI,       ';
  //SIG48772 - Início
  //Inclusão dos campos no SQL
  sSql := sSql + '     VERSAO,           ';
  sSql := sSql + '     FLGBALANSUSP,     ';
  sSql := sSql + '     FLGDEBSCP,        ';
  sSql := sSql + '     OPTSIMPLES,       ';
  sSql := sSql + '     OPTCPRB,          ';
  sSql := sSql + '     FLGINATIVA        ';
  //SIG48772 - Fim
  sSql := sSql + 'FROM DCTF_DADOSADICIONAIS           ';
  sSql := sSql + 'WHERE IDDCTF = ' + inttostr(pIdDCTF2);
  If Not ExecSQL(sSQL) Then
  Begin
    Result := False;
    Exception.Create(Messageinfo);
  End;
End;

// ----------------------------------- LOCALIZAR ---------------------------------------------------------------------------

Function TCtrlGeraDCTF_Novo.LocalizaDCTF_MovSintetico: String;
Var sSql: String;
Begin
  sSql := 'SELECT TG.IDDCTF,                  ';
  sSql := sSql + '       NAT.GRUPOTRIBUTO,    ';
  sSql := sSql + '       NAT.CODNATUREZA,     ';
  sSql := sSql + '       NAT.PERIODICIDADE,   ';
  sSql := sSql + '       DECODE(NAT.PERIODICIDADE, ''D'', ''Diário'', DECODE(NAT.PERIODICIDADE, ''S'', ''Semanal'',               ';
  sSql := sSql + '              DECODE(NAT.PERIODICIDADE, ''X'', ''Decendial'', DECODE(NAT.PERIODICIDADE, ''Q'', ''Quinzenal'',   ';
  sSql := sSql + '              DECODE(NAT.PERIODICIDADE, ''M'', ''Mensal'', ''''))))) AS DSCPERIODICIDADE,                       ';
  sSql := sSql + '       NAT.VARIACAO,        ';
  sSql := sSql + '       NAT.DESCRICAO DESCGRUPOTRIB,   ';
  sSql := sSql + '       NAT.FLGDEPOSITOJUDIC,   ';
  sSql := sSql + '       TG.VLRDEBITO,      ';
  sSql := sSql + '       TG.VLRCREDITO,     ';
  sSql := sSql + '       TG.VLRSALDO,       ';
  sSql := sSql + '       TG.SITSALDO        ';
  sSql := sSql + 'FROM (SELECT TU.IDDCTF,   ';
  sSql := sSql + '             TU.CODNATUREZA,       ';
  sSql := sSql + '             NVL(TOTDB.VLRDEBITO, 0) VLRDEBITO,   ';
  sSql := sSql + '             (NVL(TOTCRDARF.VLRCREDITODARF, 0) + NVL(TOTCRDCOMP.VLRCREDITODCOMP, 0) ) VLRCREDITO,    ';
  sSql := sSql + '             ABS(NVL(TOTDB.VLRDEBITO, 0) - (NVL(TOTCRDARF.VLRCREDITODARF, 0) + NVL(TOTCRDCOMP.VLRCREDITODCOMP, 0) ) ) VLRSALDO,  ';
  sSql := sSql + '             DECODE(SIGN(NVL(TOTDB.VLRDEBITO, 0) - (NVL(TOTCRDARF.VLRCREDITODARF, 0) + NVL(TOTCRDCOMP.VLRCREDITODCOMP, 0))), 0, '''',  ';
  sSql := sSql + '             DECODE(SIGN(NVL(TOTDB.VLRDEBITO, 0) - (NVL(TOTCRDARF.VLRCREDITODARF, 0) + NVL(TOTCRDCOMP.VLRCREDITODCOMP, 0))), -1, ''A Receber'', ''A Pagar'')) AS SITSALDO ';
  sSql := sSql + '      FROM (SELECT IDDCTF, CODNATUREZA    ';
  sSql := sSql + '            FROM (SELECT DD.IDDCTF,       ';
  sSql := sSql + '                         DD.CODNATUREZA,  ';
  sSql := sSql + '                         SUM(NVL(DD.VLRIRRF,0)) VLRDEBITO   ';
  sSql := sSql + '                  FROM DCTF D, DCTF_DEBITODETALHE DD        ';
  sSql := sSql + '                  WHERE DD.IDDCTF = D.IDDCTF                ';
  sSql := sSql + '                        AND DD.FLGMARCADO = ''S''           ';
  sSql := sSql + '                  GROUP BY DD.IDDCTF, DD.CODNATUREZA)       ';
  sSql := sSql + '            UNION                                           ';
  sSql := sSql + '            SELECT IDDCTF, CODNATUREZA                      ';
  sSql := sSql + '            FROM (SELECT DCD.IDDCTF,                        ';
  sSql := sSql + '                         DCD.CODNATUREZA,                   ';
  sSql := sSql + '                         SUM(NVL(DCD.VLRIRRF, 0)) VLRCREDITO   ';
  sSql := sSql + '                  FROM DCTF D, DCTF_CREDITODETALHE_DARF DCD    ';
  sSql := sSql + '                  WHERE DCD.IDDCTF = D.IDDCTF                  ';
  sSql := sSql + '                        AND DCD.FLGMARCADO = ''S''             ';
  sSql := sSql + '                  GROUP BY DCD.IDDCTF, DCD.CODNATUREZA         ';
  sSql := sSql + '                  UNION                                        ';
  sSql := sSql + '                  SELECT DCP.IDDCTF,                           ';
  sSql := sSql + '                         DCP.CODNATUREZA,                       ';
  sSql := sSql + '                         SUM(NVL(DCP.VALORCR_ORIGINAL_UTILIZADO, 0)) VLRCREDITO   ';
  sSql := sSql + '                  FROM DCTF D, DCTF_CREDITODETALHE_DCOMP DCP    ';
  sSql := sSql + '                  WHERE DCP.IDDCTF = D.IDDCTF                   ';
  sSql := sSql + '                        AND DCP.FLGMARCADO = ''S''              ';
  sSql := sSql + '                  GROUP BY DCP.IDDCTF, DCP.CODNATUREZA )) TU,   '; // tabela virtual com tudo / servirá como referencia logo abaixo
  //
  sSql := sSql + '           (SELECT DD.IDDCTF,                                   ';
  sSql := sSql + '                   DD.CODNATUREZA,                              ';
  sSql := sSql + '                   SUM(NVL(DD.VLRIRRF,0)) VLRDEBITO             ';
  sSql := sSql + '            FROM DCTF D, DCTF_DEBITODETALHE DD                  ';
  sSql := sSql + '            WHERE DD.IDDCTF = D.IDDCTF                          ';
  sSql := sSql + '                  AND DD.FLGMARCADO = ''S''                     ';
  sSql := sSql + '            GROUP BY DD.IDDCTF, DD.CODNATUREZA) TOTDB,          ';
  //
  sSql := sSql + '           (SELECT DCD.IDDCTF,                                  ';
  sSql := sSql + '                   DCD.CODNATUREZA,                             ';
  sSql := sSql + '                   SUM(NVL(DCD.VLRIRRF, 0)) VLRCREDITODARF      ';
  sSql := sSql + '            FROM DCTF D, DCTF_CREDITODETALHE_DARF DCD           ';
  sSql := sSql + '            WHERE DCD.IDDCTF = D.IDDCTF                         ';
  sSql := sSql + '                  AND DCD.FLGMARCADO = ''S''                    ';
  sSql := sSql + '            GROUP BY DCD.IDDCTF, DCD.CODNATUREZA) TOTCRDARF,    ';
  //
  sSql := sSql + '           (SELECT DCD.IDDCTF,                                  ';
  sSql := sSql + '                   DCD.CODNATUREZA,                             ';
  sSql := sSql + '                   SUM(NVL(DCD.VALORCR_ORIGINAL_UTILIZADO, 0)) VLRCREDITODCOMP     ';
  sSql := sSql + '            FROM DCTF D, DCTF_CREDITODETALHE_DCOMP DCD         ';
  sSql := sSql + '            WHERE DCD.IDDCTF = D.IDDCTF                        ';
  sSql := sSql + '                  AND DCD.FLGMARCADO = ''S''                   ';
  sSql := sSql + '            GROUP BY DCD.IDDCTF, DCD.CODNATUREZA) TOTCRDCOMP   ';
  //
  sSql := sSql + '      WHERE TU.IDDCTF = TOTDB.IDDCTF(+)                        ';
  sSql := sSql + '            AND TU.CODNATUREZA = TOTDB.CODNATUREZA(+)                ';
  sSql := sSql + '            AND TU.IDDCTF = TOTCRDARF.IDDCTF(+)                      ';
  sSql := sSql + '            AND TU.CODNATUREZA = TOTCRDARF.CODNATUREZA(+)            ';
  sSql := sSql + '            AND TU.IDDCTF = TOTCRDCOMP.IDDCTF(+)                     ';
  sSql := sSql + '            AND TU.CODNATUREZA = TOTCRDCOMP.CODNATUREZA(+)) TG,      ';
  sSql := sSql + '      NATURENDIMENTO NAT                                             ';
  sSql := sSql + ' WHERE TG.IDDCTF =:IDDCTF                                            ';
  sSql := sSql + '       AND TG.CODNATUREZA = NAT.CODNATUREZA                          ';
  sSql := sSql + '       AND NVL(NAT.FLGUSADONADCTF, ''S'') = ''S''                    ';
  sSql := sSql + '       /*FILTRO_0588_0561*/                                          '; // Marcos Lima SIG136949
  sSql := sSql + 'ORDER BY TG.IDDCTF, NAT.CODNATUREZA                                  ';
  Result := sSql;
End;

Function TCtrlGeraDCTF_Novo.LocalizaDCTF_DetalhamentoDebitos: String;
Var sSql: String;
Begin
  sSql := 'SELECT DDD.*,  ';
  sSql := sSql + 'CASE    ';
  sSql := sSql + '   WHEN DDD.TIPOMOV = 0 THEN ''Fol.Empregado''       ';
  sSql := sSql + '   WHEN DDD.TIPOMOV = 1 THEN ''Fol.Benefícios''      ';
  sSql := sSql + '   WHEN DDD.TIPOMOV = 2 THEN ''Empréstimo''          ';
  sSql := sSql + '   WHEN DDD.TIPOMOV = 3 THEN ''Impostos''            ';
  sSql := sSql + '   WHEN DDD.TIPOMOV = 9 THEN ''Ajustes de Mov.''     ';
  sSql := sSql + 'END DSCTIPOMOV                                       ';
  sSql := sSql + 'FROM DCTF_DEBITODETALHE DDD                                              ';
  sSql := sSql + 'WHERE DDD.IDDCTF =:IDDCTF AND DDD.CODNATUREZA =:CODNATUREZA              ';
  //Darivaldo Alencar/Paulo Nobre SIG 26256 -inicio
  //sSql := sSql + 'ORDER BY DDD.IDDCTF, DDD.TIPOMOV DESC, DDD.CODNATUREZA, DDD.CODNATURASSOCIADA DESC, DDD.TIPOMOV, DDD.NUMDOCUMENTO ASC  ';
  sSql := sSql + 'ORDER BY DDD.IDDCTF, DDD.TIPOMOV DESC, DDD.DATAAPURACAO, DDD.NUMDOCUMENTO ASC  ';
  //Darivaldo Alencar SIG/Paulo Nobre 26256 -fim
  Result := sSql;
End;

Function TCtrlGeraDCTF_Novo.LocalizaDCTF_DetalhamentoCreditos: String;
Var sSql: String;
Begin
  // DARF´S
  sSql := 'SELECT *                                  ';
  sSql := sSql + '  FROM ((SELECT ''A'' ORDEM, D.FLGMARCADO, D.IDDCTF, D.IDDCTFCRDETALHE_DARF IDDCTFCRDETALHE, ';
  sSql := sSql + '                D.TIPODOCTO, D.CODNATUREZA, D.CODNATURASSOCIADA, NULL IDFORMAPEDIDO, NULL NUMPERDCOMP,      ';
  sSql := sSql + '                D.IDDARF, D.NUMDOCUMENTO, D.REFERENCIA, D.PROCESSO, D.DATAINICIOAPURACAO, ';
  sSql := sSql + '                D.DATAFIMAPURACAO, D.DATAVENCDARF, D.VLRIRRF, D.VLRMULTA, D.VLRJUROS, D.VLRTOTAL, D.TRGDTINCLUSAO ';
  sSql := sSql + '         FROM DCTF_CREDITODETALHE_DARF D          ';
  sSql := sSql + '         WHERE D.IDDCTF =:IDDCTF AND D.CODNATUREZA =:CODNATUREZA  ';
  sSql := sSql + '               AND D.TIPODOCTO = ''DARF''  ) ';
  //
  sSql := sSql + '         UNION                  ';
  // DCOMP´S
  sSql := sSql + '        (SELECT ''B'' ORDEM, D.FLGMARCADO, D.IDDCTF, D.IDDCTFCRDETALHE_DCOMP IDDCTFCRDETALHE,  ';
  sSql := sSql + '                D.TIPODOCTO, D.CODNATUREZA, NULL CODNATURCOMPENSADA, D.IDFORMAPEDIDO, D.NUMPERDCOMP,    ';
  sSql := sSql + '                NULL IDDARF, D.NUMDOCUMENTO, D.REFERENCIA, D.PROCESSO, D.DATAINICIOAPURACAO, ';
  sSql := sSql + '                D.DATAFIMAPURACAO, D.DATAVENCTO DATAVENCDARF, D.VALORCR_ORIGINAL_UTILIZADO VLRIRRF, 0, 0,  ';
  sSql := sSql + '                D.VALORCR_ORIGINAL_UTILIZADO VLRTOTAL, D.TRGDTINCLUSAO  ';
  sSql := sSql + '         FROM DCTF_CREDITODETALHE_DCOMP D              ';
  sSql := sSql + '         WHERE D.IDDCTF =:IDDCTF AND D.CODNATUREZA =:CODNATUREZA  ) ';
  //
  sSql := sSql + '         UNION                  ';
  // DJE´S
  sSql := sSql + '        (SELECT ''C'' ORDEM, D.FLGMARCADO, D.IDDCTF, D.IDDCTFCRDETALHE_DARF IDDCTFCRDETALHE, ';
  sSql := sSql + '                D.TIPODOCTO, D.CODNATUREZA, D.CODNATURASSOCIADA, NULL IDFORMAPEDIDO, NULL NUMPERDCOMP,      ';
  sSql := sSql + '                D.IDDARF, D.NUMDOCUMENTO, D.REFERENCIA, DD.NUMEROPROCJUDICIAL PROCESSO, D.DATAINICIOAPURACAO, ';
  sSql := sSql + '                D.DATAFIMAPURACAO, D.DATAVENCDARF, D.VLRIRRF, D.VLRMULTA, D.VLRJUROS, D.VLRTOTAL, D.TRGDTINCLUSAO ';
  sSql := sSql + '         FROM   DCTF_CREDITODETALHE_DARF D, DCTF_DARFDETALHE DD       ';
  sSql := sSql + '         WHERE D.IDDCTF =:IDDCTF AND D.CODNATUREZA =:CODNATUREZA   ';
  sSql := sSql + '               AND D.TIPODOCTO = ''DJE''    ';
  sSql := sSql + '               AND D.IDDCTF = DD.IDDCTF (+)                                ';
  sSql := sSql + '               AND D.IDDCTFCRDETALHE_DARF = DD.IDDCTFCRDETALHE_DARF (+) )  ';
  sSql := sSql + '    )  ';
  sSql := sSql + ' ORDER BY IDDCTF, ORDEM, DATAFIMAPURACAO, IDDCTFCRDETALHE ';
  Result := sSql;
End;

Function TCtrlGeraDCTF_Novo.LocalizaDCTF_TotalDetalhamentoCreditos: String;
Var sSql: String;
Begin
  sSql := 'SELECT IDDCTF, CODNATUREZA, NVL(SUM(VLRTOTAL), 0.00) VLRTOTAL                ';
  sSql := sSql + '  FROM (SELECT D.IDDCTF,                                              ';
  sSql := sSql + '               D.CODNATUREZA,                                         ';
  sSql := sSql + '               SUM(NVL(D.VLRIRRF, 0.00)) VLRTOTAL                     ';
  sSql := sSql + '        FROM DCTF_CREDITODETALHE_DARF D                               ';
  sSql := sSql + '        WHERE D.IDDCTF =:IDDCTF                                       ';
  sSql := sSql + '              AND D.CODNATUREZA =:CODNATUREZA                         ';
  sSql := sSql + '              AND D.FLGMARCADO = ''S''                                ';
  sSql := sSql + '        GROUP BY D.IDDCTF, D.CODNATUREZA                              ';
  //
  sSql := sSql + '        UNION                                                         ';
  //
  sSql := sSql + '        SELECT D.IDDCTF,                                              ';
  sSql := sSql + '               D.CODNATUREZA,                                         ';
  sSql := sSql + '               SUM(NVL(D.VALORCR_ORIGINAL_UTILIZADO, 0.00)) VLRTOTAL  ';
  sSql := sSql + '        FROM DCTF_CREDITODETALHE_DCOMP D                              ';
  sSql := sSql + '        WHERE D.IDDCTF =:IDDCTF                                       ';
  sSql := sSql + '              AND D.CODNATUREZA =:CODNATUREZA                         ';
  sSql := sSql + '              AND D.FLGMARCADO = ''S''                                ';
  sSql := sSql + '        GROUP BY D.IDDCTF, D.CODNATUREZA)                             ';
  sSql := sSql + 'GROUP BY IDDCTF, CODNATUREZA                                          ';
  Result := sSql;
End;

Function TCtrlGeraDCTF_Novo.LocalizaDCTF_ConciliacaoIndividualCPF: String;
Var sSql: String;
Begin
  sSql := '       SELECT *                                                                  ';
  sSql := sSql + 'FROM (SELECT IDDCTF,                                                      ';
  sSql := sSql + '             CODNATUREZA,                                                 ';
  sSql := sSql + '             TRIM(NUMDOCUMENTO) NUMDOCUMENTO,                             ';
  sSql := sSql + '             TRIM(NOME) NOME,                                             ';
  sSql := sSql + '             SUM(VALORDB) VALORDB,                                        ';
  sSql := sSql + '             SUM(VALORCR) VALORCR,                                        ';
  sSql := sSql + '             (SUM(VALORDB) + SUM(VALORCR)) VLRDIF                         ';
  sSql := sSql + '      FROM ((SELECT DD.IDDCTF,                                            '; // DEBITO
  sSql := sSql + '                      DD.CODNATUREZA,                                     ';
  sSql := sSql + '                      TRIM(DD.NUMDOCUMENTO) NUMDOCUMENTO,                 ';
  sSql := sSql + '                      TRIM(DD.NOME) NOME,                                 ';
  sSql := sSql + '                      SUM(DD.VLRIRRF*-1) VALORDB,                         ';
  sSql := sSql + '                      0 VALORCR                                           ';
  sSql := sSql + '                FROM DCTF_DEBITODETALHE DD                                ';
  sSql := sSql + '                WHERE DD.IDDCTF =:IDDCTF                                  ';
  sSql := sSql + '                      AND DD.CODNATUREZA =:CODNATUREZA                    ';
  sSql := sSql + '                      AND DD.FLGMARCADO = ''S''                           ';
  sSql := sSql + '                GROUP BY DD.IDDCTF, DD.CODNATUREZA, TRIM(DD.NUMDOCUMENTO), TRIM(DD.NOME)) ';

  sSql := sSql + '                UNION ALL                                                   ';

  sSql := sSql + '                (SELECT DCD.IDDCTF,                                         '; // CREDITO
  sSql := sSql + '                        DCD.CODNATUREZA,                                    ';
  sSql := sSql + '                        TRIM(DD1.NUMDOCUMENTO) NUMDOCUMENTO,                ';
  sSql := sSql + '                        TRIM(DD1.NOME) NOME,                                ';
  sSql := sSql + '                        0 VALORDB,                                          ';
  sSql := sSql + '                        SUM(DD1.VLRIRRF) VALORCR                            ';
  sSql := sSql + '                 FROM DCTF_CREDITODETALHE_DARF DCD, DCTF_DARFDETALHE DD1    ';
  sSql := sSql + '                 WHERE DCD.IDDCTF =:IDDCTF                                       ';
  sSql := sSql + '                       AND DCD.CODNATUREZA =:CODNATUREZA                             ';
  sSql := sSql + '                       AND DCD.IDDCTF = DD1.IDDCTF                              ';
  sSql := sSql + '                       AND DCD.IDDCTFCRDETALHE_DARF = DD1.IDDCTFCRDETALHE_DARF       ';
  sSql := sSql + '                       AND DCD.FLGMARCADO = ''S''                                    ';
  sSql := sSql + '                 GROUP BY DCD.IDDCTF, DCD.CODNATUREZA, TRIM(DD1.NUMDOCUMENTO), TRIM(DD1.NOME)))  ';
  sSql := sSql + '      GROUP BY IDDCTF, CODNATUREZA, TRIM(NUMDOCUMENTO), TRIM(NOME))                        ';
  sSql := sSql + '      WHERE VLRDIF <> 0                                                              ';
  sSql := sSql + 'ORDER BY NUMDOCUMENTO                                                                ';
  Result := sSql;
End;

Function TCtrlGeraDCTF_Novo.LocalizaDCTF_DadosAdicionais: String;
Var sSql: String;
Begin
  sSql := 'SELECT *                          ';
  sSql := sSql + 'FROM DCTF_DADOSADICIONAIS  ';
  sSql := sSql + 'WHERE IDDCTF =:IDDCTF      ';
  Result := sSql;
End;

//
// ****************** FUNÇÕES PARA A GERAÇÃO DO ARQUIVO DE ENVIO A RFB  **************************************
//

Procedure TCtrlGeraDCTF_Novo.MontaTabelaData(psPeriodicidade, psMesAno, psNatureza: String; piIDDCTF: integer);
Var iDia, iMes, iAno, iUltDia: Integer;
  dtInicio, dtFim: TDateTime;
  cdsAux: TCMClientDataSet;

  Procedure GravaTabela(psDtInicio, psDtFim: String);
  Begin
    cdsTabelaComPeriodicidades.Append;
    cdsTabelaComPeriodicidades.FieldByName('DATAINICIO').AsString := psDtInicio;
    cdsTabelaComPeriodicidades.FieldByName('DATAFIM').AsString := psDtFim;
    cdsTabelaComPeriodicidades.Post;
  End;

Begin
  cdsTabelaComPeriodicidades.Close;
  cdsTabelaComPeriodicidades.Data := GetDataPacket('SELECT ''          '' DATAINICIO, ''          '' DATAFIM FROM DUAL WHERE 1 = 2');

  cdsAux := TCMClientDataSet.Create(Nil);

  dtInicio := StrToDate('01/' + psMesAno);
  iMes := DiasUteis.ExtraiMes(dtInicio);
  iAno := DiasUteis.ExtraiAno(dtInicio);
  dtFim := DiasUteis.UltDiaMes(iAno, iMes);
  iUltDia := DiasUteis.ExtraiDia(dtFim);

  Try
    // Diario
    If psPeriodicidade = 'D' Then
    Begin
      // Paulo Nobre - SOL 249454 PPM 703267 26/01/2015
      carregarCidadeEstadoPaisSistema;
      //SIG 48772 - Início
      //Para as naturezas de rendimento com periodicidade 'Diária' deve-se recuperar todas as apuraçes realizadas no período e
      //determinar o intervalo para cada apuração.
      cdsAux.Data := RecuperaDataApuracaoNatureza(psNatureza, piIDDCTF);

      // Paulo Nobre - SIG 41744_43545 - Inicio
      //
      // O dia de inicio na periodicidade diária, será sempre o dia 20 de cada mês
      // dtInicio := StrToDate('20/' + psMesAno);

      // Para atender caso excepcionais nos quais a FUNCEF pode lançar o vencimento fora do dia padrão
      // que é todo dia 20, por exemplo, teve mês que lançou no dia 16, o Gestor Leo Wagner sugeriu
      // que fosse incluído um pequeno período para cobrir estas possíveis distorções, que será entre o
      // dia 12 e 25 de cada mês.

      While Not cdsAux.Eof Do
      Begin
        // Novo dia inicial de avaliação
        //dtInicio := StrToDate('12/' + psMesAno);
        // Localizando o dia útil (contando com feriados) anterior a data de inicio

        //Luiz Carlos - SIG66440 - Inicio
        If cdsAux.FieldByName('DATAAPURACAO').AsDateTime <> 0 Then
          dtInicio := cdsAux.FieldByName('DATAAPURACAO').AsDateTime;

        //if Copy(cdsAux.FieldByName('DATAAPURACAO').AsString,1,2) < '25' then //Taffarel - SIG71560
        If (Copy(cdsAux.FieldByName('DATAAPURACAO').AsString, 1, 2) < '25') And (psNatureza <> '9466') And (psNatureza <> '0473') Then //Taffarel - SIG71560
          dtFim := StrToDate('25/' + psMesAno)
        Else
          dtFim := cdsAux.FieldByName('DATAAPURACAO').AsDateTime;
        //Luiz Carlos - SIG66440 - Fim

        While Not DiasUteis.DiaUtil(dtInicio, fundacaoCidade, fundacaoPais, fundacaoEstado, True, True, False) Do
          dtInicio := dtInicio - 1;               // Achar o dia útil anterior
        iDia := ExtraiDia(dtInicio);

        // Novo dia final de avaliação
        //dtFim := StrToDate('25/' + psMesAno);
        // Localizando o dia útil (contando com feriados) posterior a data final
        While Not DiasUteis.DiaUtil(dtFim, fundacaoCidade, fundacaoPais, fundacaoEstado, True, True, False) Do
          dtFim := dtFim + 1;                     // Achar o dia útil posterior
        iUltDia := ExtraiDia(dtFim);

        // GravaTabela(IntToStr(iDia) + '/' + psMesAno, IntToStr(iDia) + '/' + psMesAno);
        GravaTabela(IntToStr(iDia) + '/' + psMesAno, IntToStr(iUltDia) + '/' + psMesAno);

        cdsAux.Next;
      End;
      //SIG48772 - Fim
    End;

    // Semanal
    If psPeriodicidade = 'S' Then
    Begin
      For iDia := 1 To iUltDia Do
      Begin
        If (DayOfWeek(StrToDate(IntToStr(iDia) + '/' + psMesAno)) = 7) Or (iDia = iUltDia) Then
        Begin
          If Length(IntToStr(iDia)) = 1 Then
            GravaTabela(FormatDateTime('dd/mm/yyyy', dtInicio), '0' + IntToStr(iDia) + '/' + psMesAno)
          Else
            GravaTabela(FormatDateTime('dd/mm/yyyy', dtInicio), IntToStr(iDia) + '/' + psMesAno);

          If (iDia <> iUltDia) Then
            dtInicio := StrToDate(IntToStr(iDia + 1) + '/' + psMesAno);
        End;
      End;
    End;

    // Decendial
    If psPeriodicidade = 'X' Then
    Begin
      GravaTabela('01/' + psMesAno, '10/' + psMesAno);

      If iMes = 2 Then
        GravaTabela('11/' + psMesAno, IntToStr(iUltDia) + '/' + psMesAno)
      Else
      Begin
        GravaTabela('11/' + psMesAno, '20/' + psMesAno);
        GravaTabela('21/' + psMesAno, IntToStr(iUltDia) + '/' + psMesAno);
      End;
    End;

    // Quinzenal
    If psPeriodicidade = 'Q' Then
    Begin
      GravaTabela('01/' + psMesAno, '15/' + psMesAno);
      GravaTabela('16/' + psMesAno, IntToStr(iUltDia) + '/' + psMesAno);
    End;

    // Mensal
    If psPeriodicidade = 'M' Then
      GravaTabela('01/' + psMesAno, IntToStr(iUltDia) + '/' + psMesAno);

  Finally
    cdsAux.Free;
  End;
End;

Function TCtrlGeraDCTF_Novo.RetornaPeriodo(psPeriodicidade, psPeriodoApuracao: String): String;
Var sDia: String;
Begin
  sDia := Copy(psPeriodoApuracao, 1, 2);

  //Luiz Carlos - SIG66440 - Inicio
  If Copy(sDia, 2, 1) = '/' Then
    sDia := '0' + Copy(sDia, 1, 1);
  //Luiz Carlos - SIG66440 - Fim

  If Pos(psPeriodoApuracao, '/') < 1 Then
    psPeriodoApuracao := FormatMaskText('99/99/9999;0; ', psPeriodoApuracao);

  If psPeriodicidade = 'D' Then
    Result := sDia;

  If psPeriodicidade = 'S' Then
    Result := '0' + IntToStr(NumWeekMonth(StrToDateTime(psPeriodoApuracao)));

  If psPeriodicidade = 'M' Then
    Result := '00';

  If psPeriodicidade = 'Q' Then
  Begin
    If StrToInt(sDia) <= 15 Then
      Result := '01'
    Else
      Result := '02';
  End;

  If psPeriodicidade = 'X' Then                   // decendio
  Begin
    If StrToInt(sDia) <= 10 Then
      Result := '01';

    If (StrToInt(sDia) >= 11) And (StrToInt(sDia) <= 29) Then
      Result := '02';

    If StrToInt(sDia) >= 30 Then
      Result := '03';
  End;

  Result := Result
End;

Procedure TCtrlGeraDCTF_Novo.CarregarCidadeEstadoPaisSistema;
Var _CdsAux: TCMClientDataSet;
  sSql: String;
Begin
  sSql := ' SELECT ' + CR_LF;
  sSql := sSql + '   c.IDCIDADES, p.IDPAIS, e.CODESTADO ' + CR_LF;
  sSql := sSql + ' FROM ' + CR_LF;
  sSql := sSql + '   CIDADES c, ' + CR_LF;
  sSql := sSql + '   ESTADO e, ' + CR_LF;
  sSql := sSql + '   PAIS p, ' + CR_LF;
  sSql := sSql + '   ENDPESS ep ' + CR_LF;
  sSql := sSql + ' WHERE ' + CR_LF;
  sSql := sSql + '   c.IDESTADO = e.IDESTADO ' + CR_LF;
  sSql := sSql + '   AND e.IDPAIS = p.IDPAIS ' + CR_LF;
  sSql := sSql + '   AND ep.IDCIDADES = c.IDCIDADES ' + CR_LF;
  sSql := sSql + '   AND ep.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa);

  _CdsAux := TCMClientDataSet.Create(Nil);
  _CdsAux.Data := GetDataPacket(sSql);

  FundacaoCidade := _CdsAux.Fields[0].AsInteger;
  FundacaoPais := _CdsAux.Fields[1].AsInteger;
  FundacaoEstado := _CdsAux.Fields[2].AsString;

  _CdsAux.Free;
End;

// ****************************************************
// FUNÇÃO PARA GERAÇÃO DO ARQUIVO DE EXPORTAÇÃO DA RFB
// ****************************************************

Function TCtrlGeraDCTF_Novo.Exporta(
  sArquivo: String;
  pQryDCTFGeradas,
  pQryDCTFMovSintetico,
  pQryDCTFDetDebitos,
  pQryDCTFDetCreditos,
  pQryDadosAdicionais: TwwQuery): Boolean;

Var sPeriodoInicial, sPeriodoFinal, sCNPJIncorporacao, sCodNaturezaCompleto: String;
  iQuantidadeRegistro: Integer;
  _qryAux: TwwQuery;
  dVlrDBPeriodo, dVlrCRPeriodo: Double;
Begin
  // Inicializar Variáveis
  result := False;
  iQuantidadeRegistro := 0;

  _qryAux := TwwQuery.Create(Nil);
  _qryAux.DatabaseName := DataBaseName;

  // Inicia a gravação do Arquivo
  If CriaArquivo(sArquivo) Then
  Begin
    // Carregando outros dados necessários à geração do Arquivo
    //
    rOutrosDados.sODSituacao := '00';
    rOutrosDados.sODDataOcorrencia := '';

    If pqryDCTFGeradas.fieldByname('TIPODCTF').asString = 'O' Then
      rOutrosDados.sODTipoDeclaracao := '0';      // original
    If pqryDCTFGeradas.fieldByname('TIPODCTF').asString = 'R' Then
      rOutrosDados.sODTipoDeclaracao := '1';      // retificadora

    // SOL 246475  PPM 636290 - Paulo Nobre
    rOutrosDados.sODDataInicioApuracao := StringReplace(pqryDCTFGeradas.fieldByname('DATAINICIOAPURACAO').asString, '/', '', [rfReplaceAll]);
    rOutrosDados.sODDataFimApuracao := StringReplace(pqryDCTFGeradas.fieldByname('DATAFIMAPURACAO').asString, '/', '', [rfReplaceAll]);
    //
    rOutrosDados.sVersaoLayout := pQryDadosAdicionais.FieldByName('VERSAO').asString; //pqryDCTFGeradas.fieldByname('NUMVERSAOLAYOUT').asString;
    rOutrosDados.sODAnoMesApuracao := Copy(rOutrosDados.sODDataInicioApuracao, 5, 4) + Copy(rOutrosDados.sODDataInicioApuracao, 3, 2);
    rOutrosDados.sODAnoApuracao := Copy(rOutrosDados.sODDataInicioApuracao, 5, 4);
    rOutrosDados.sODMesApuracao := Copy(rOutrosDados.sODDataInicioApuracao, 3, 2);
    rOutrosDados.sODInicioPeriodo := Copy(rOutrosDados.sODDataInicioApuracao, 1, 4);
    rOutrosDados.sODFinalPeriodo := Copy(rOutrosDados.sODDataFimApuracao, 1, 4);
    rOutrosDados.sODNaturezaJuridica := '';
    rOutrosDados.sODBalancoReducao := '0';        // Não
    rOutrosDados.sODDBSCPINC := '0';              // Não é SCP e nem INC
    rOutrosDados.sODLevantouBalanco := '0';       // Não
    rOutrosDados.sODComDebitoSCP := '0';          // Não
    rOutrosDados.sODQualificacao := copy(inttostr(100 + pqryDadosAdicionais.fieldByname('IDQUALIFPJ').asInteger), 2, 2);
    rOutrosDados.sODTribLucro := pqryDadosAdicionais.fieldByname('IDFORMTRIBLUCRO').asString;
    rOutrosDados.sODCritRecon := pqryDadosAdicionais.fieldByname('IDCRITRECON').asString;
    // SOL 235337/16319 PPM 457199 - Paulo Nobre
    rOutrosDados.sODRegimeApuContrib := pqryDadosAdicionais.fieldByname('IDREGIMEAPUR').asString;
    rOutrosDados.sODSituacaoPJ := pqryDadosAdicionais.fieldByname('IDSITUACAOPJ').asString;
    rOutrosDados.sODOpcaoLEI := pqryDadosAdicionais.fieldByname('IDOPCAOLEI').asString;
    //SIG 48772 - Início
    rOutrosDados.sODOptSimples := pqryDadosAdicionais.fieldByname('OPTSIMPLES').asString;
    rOutrosDados.sODOptCPRB := pqryDadosAdicionais.fieldByname('OPTCPRB').asString;
    rOutrosDados.sODInativa := pqryDadosAdicionais.fieldByname('FLGINATIVA').asString;
    //SIG 48772 - Fim
    //
    //------------- Inicio da montagem dos layouts -------------------
    //
    GravaLinha(sArquivo, GeraHeader(
      rOutrosDados.sODAnoApuracao,
      rOutrosDados.sODMesApuracao,
      rOutrosDados.sODTipoDeclaracao,
      trim(pQryDadosAdicionais.FieldByName('CNPJFUNDACAO').AsString),
      trim(pQryDadosAdicionais.FieldByName('NOMEFUNDACAO').AsString),
      pQryDadosAdicionais.FieldByName('UFFUND').AsString,
      rOutrosDados.sODSituacao,
      rOutrosDados.sODDataInicioApuracao,
      rOutrosDados.sODDataFimApuracao,
      rOutrosDados.sODDataOcorrencia,
      rOutrosDados.sVersaoLayout));

    GravaLinha(sArquivo, GeraDadosIniciais(
      trim(pQryDadosAdicionais.FieldByName('CNPJFUNDACAO').AsString),
      rOutrosDados.sODAnoMesApuracao,
      rOutrosDados.sODSituacao,
      rOutrosDados.sODDataOcorrencia,
      rOutrosDados.sODInicioPeriodo,
      rOutrosDados.sODFinalPeriodo,
      rOutrosDados.sODTipoDeclaracao,
      pQryDCTFGeradas.FieldByName('NUMRECIBOANT').AsString,
      rOutrosDados.sODTribLucro,
      rOutrosDados.sODQualificacao,
      rOutrosDados.sODLevantouBalanco,
      rOutrosDados.sODComDebitoSCP,
      rOutrosDados.sODCritRecon,
      rOutrosDados.sODRegimeApuContrib,
      rOutrosDados.sODSituacaoPJ,
      rOutrosDados.sODOpcaoLEI,
      rOutrosDados.sODOptSimples,
      rOutrosDados.sODOptCPRB,
      rOutrosDados.sODInativa));

    GravaLinha(sArquivo, GeraDadosCadastraisEstabelecimento(
      trim(pQryDadosAdicionais.FieldByName('CNPJFUNDACAO').AsString),
      rOutrosDados.sODAnoMesApuracao,
      rOutrosDados.sODSituacao,
      rOutrosDados.sODDataOcorrencia,
      trim(pQryDadosAdicionais.FieldByName('NOMEFUNDACAO').AsString),
      rOutrosDados.sODNaturezaJuridica,
      pQryDadosAdicionais.FieldByName('LOGRADFUND').AsString,
      pQryDadosAdicionais.FieldByName('NUMFUND').AsString,
      pQryDadosAdicionais.FieldByName('COMPLFUND').AsString,
      pQryDadosAdicionais.FieldByName('BAIRROFUND').AsString,
      pQryDadosAdicionais.FieldByName('MUNFUND').AsString,
      pQryDadosAdicionais.FieldByName('UFFUND').AsString,
      pQryDadosAdicionais.FieldByName('CEPFUND').AsString,
      pQryDadosAdicionais.FieldByName('DDDFUND').AsString,
      pQryDadosAdicionais.FieldByName('TELFUND').AsString,
      pQryDadosAdicionais.FieldByName('DDDFAXFUND').AsString,
      pQryDadosAdicionais.FieldByName('FAXFUND').AsString,
      '',
      '',
      '',
      pQryDadosAdicionais.FieldByName('EMAILFUND').AsString));

    GravaLinha(SArquivo, GeraDadosResponsavelxRepresentante(
      trim(pQryDadosAdicionais.FieldByName('CNPJFUNDACAO').AsString),
      rOutrosDados.sODAnoMesApuracao,
      rOutrosDados.sODSituacao,
      rOutrosDados.sODDataOcorrencia,
      trim(pQryDadosAdicionais.FieldByName('NOMEREPRES').AsString),
      pQryDadosAdicionais.FieldByName('CPFREPRES').AsString,
      pQryDadosAdicionais.FieldByName('DDDREPRES').AsString,
      pQryDadosAdicionais.FieldByName('FONEREPRES').AsString,
      '',
      '',
      '',
      pQryDadosAdicionais.FieldByName('EMAILREPRES').AsString,
      pQryDadosAdicionais.FieldByName('NOMERESP').AsString,
      pQryDadosAdicionais.FieldByName('CPFRESP').AsString,
      pQryDadosAdicionais.FieldByName('CRCRESP').AsString,
      pQryDadosAdicionais.FieldByName('UFCRCRESP').AsString,
      pQryDadosAdicionais.FieldByName('DDDRESP').AsString,
      pQryDadosAdicionais.FieldByName('FONERESP').AsString,
      '',
      '',
      '',
      pQryDadosAdicionais.FieldByName('EMAILRESP').AsString));

    ///////////////////////////////////////////////////////
    //    Gerando Linhas com os lançamentos Normais      //
    //////////////////////////////////////////////////////

    pQryDCTFMovSintetico.First;
    While Not pQryDCTFMovSintetico.EOF Do
    Begin
      // Só entra para gravar o tributo se houver pelo menos valor no Débito
      If (pQryDCTFMovSintetico.FieldByName('VLRDEBITO').AsFloat <> 0.00) Then
      Begin

        dVlrDBPeriodo := 0.00;
        dVlrCRPeriodo := 0.00;

        // Montando uma tabela virtual com as datas baseada na periodicidade do Tributo
        // (diário ou decendial ou quinzenal ou mensal ou anual)
        MontaTabelaData(pQryDCTFMovSintetico.FieldByName('PERIODICIDADE').AsString,
          Copy(rOutrosDados.sODAnoMesApuracao, 5, 2) + '/' + Copy(rOutrosDados.sODAnoMesApuracao, 1, 4),
          pQryDCTFMovSintetico.FieldByName('CODNATUREZA').AsString,
          pQryDCTFMovSintetico.FieldByName('IDDCTF').asInteger);

        // Processando para cada periodo montado
        cdsTabelaComPeriodicidades.First;
        While Not cdsTabelaComPeriodicidades.EOF Do
        Begin
          //Inc(iQuantidadeRegistro);   // Andre Imakawa - SIG 67118 - Removido desse trecho e implementado antes da chamada da GravaLinha

          sCNPJIncorporacao := '';
          If pQryDCTFMovSintetico.FieldByName('GRUPOTRIBUTO').AsString = '10' Then // RET/Pagamento Unificado de Tributos
            sCNPJIncorporacao := pQryDadosAdicionais.FieldByName('NUMDOCUMENTO').AsString;

          sPeriodoInicial := cdsTabelaComPeriodicidades.FieldByName('DATAINICIO').AsString;
          sPeriodoFinal := cdsTabelaComPeriodicidades.FieldByName('DATAFIM').AsString;

          sCodNaturezaCompleto := pQryDCTFMovSintetico.FieldByName('CODNATUREZA').AsString +
            pQryDCTFMovSintetico.FieldByName('VARIACAO').AsString;

          // Se o Tributo não é Judicial
          If (pQryDCTFMovSintetico.fieldbyname('FLGDEPOSITOJUDIC').asString <> 'S') Then
          Begin

            dVlrDBPeriodo := pQryDCTFMovSintetico.FieldByName('VLRDEBITO').AsFloat;

            // Se existe valor de Crédito, então apura o valor individualizado da periodicidade
            If (pQryDCTFMovSintetico.FieldByName('VLRCREDITO').AsFloat <> 0.00) Then
            Begin
              // SOL 238778 PPM 512818 - Paulo Nobre
              // Rotina para tratar a apuração do Imposto de acordo com sua Periodicidade, baseado nos Créditos
              If pQryDCTFMovSintetico.FieldByName('PERIODICIDADE').AsString <> 'M' Then // Diferente de Mensal
              Begin
                pQryDCTFDetCreditos.Filtered := False;
                pQryDCTFDetCreditos.Filter := 'DATAINICIOAPURACAO >= ' + QuotedStr(sPeriodoInicial) + ' AND DATAFIMAPURACAO <= ' + QuotedStr(sPeriodoFinal) +
                  // SOL 256772 PPM 964770 - Paulo Nobre - 01/06/2015
                'AND FLGMARCADO = ''S'' ';
                pQryDCTFDetCreditos.Filtered := True;

                //  Apropriando o valor total de cada periodicidade dos CRÉDITOS
                dVlrCRPeriodo := 0.00;
                pQryDCTFDetCreditos.First;
                While Not pQryDCTFDetCreditos.Eof Do
                Begin
                  dVlrCRPeriodo := dVlrCRPeriodo + pQryDCTFDetCreditos.FieldByName('VLRIRRF').AsFloat;

                  pQryDCTFDetCreditos.Next;
                End;

                //*** Darivaldo Alencar/Paulo Nobre SIG 26256 -inicio
                // SOL 252107 PPM 780490 - Paulo Nobre
                // If (pQryDCTFMovSintetico.FieldByName('CODNATUREZA').AsString = '5952') Or // PIS/COFINS/CSLL - Serviços de Terceiros
                // (pQryDCTFMovSintetico.FieldByName('CODNATUREZA').AsString = '7893') Then // IOF - SOBRE EMPRÉSTIMOS A PARTICIPANTES
                //   Begin
                //     // O valor do R10 (DB) vai ser igual ao do total da periodicidade avaliada
                //     If dVlrCRPeriodo <> 0.00 Then
                //       dVlrDBPeriodo := dVlrCRPeriodo;
                //   End;

              End;
            End;

            // Se existe valor de Débito, então apura o valor individualizado da periodicidade do tributo
            If (pQryDCTFMovSintetico.FieldByName('VLRDEBITO').AsFloat <> 0.00) Then
            Begin
              dVlrDBPeriodo := pQryDCTFMovSintetico.FieldByName('VLRDEBITO').AsFloat;
              If pQryDCTFMovSintetico.FieldByName('PERIODICIDADE').AsString <> 'M' Then // Diferente de Mensal
              Begin
                pQryDCTFDetDebitos.Filtered := False;
                pQryDCTFDetDebitos.Filter := 'DATAAPURACAO >= ' + QuotedStr(sPeriodoInicial) + ' AND DATAAPURACAO <= ' + QuotedStr(sPeriodoFinal) +
                  'AND FLGMARCADO = ''S'' ';      // Andre Imakawa - SIG 56456
                pQryDCTFDetDebitos.Filtered := True;
                // Apropriando o valor total de cada periodicidade dos DÉBITOS
                dVlrDBPeriodo := 0.00;
                pQryDCTFDetDebitos.First;
                While Not pQryDCTFDetDebitos.Eof Do
                Begin
                  dVlrDBPeriodo := dVlrDBPeriodo + pQryDCTFDetDebitos.FieldByName('VLRIRRF').AsFloat;
                  pQryDCTFDetDebitos.Next;
                End;
              End;
            End;
            //*** Darivaldo Alencar/Paulo Nobre SIG 26256 -fim

            // Andre Imakawa - SIG 67118 - Inicio
            If dVlrDBPeriodo <> 0 Then
            Begin
              Inc(iQuantidadeRegistro);

              // Gravando o Débito apurado
              GravaLinha(sArquivo, GeraDebitoApurado(// R10
                trim(pQryDadosAdicionais.FieldByName('CNPJFUNDACAO').AsString),
                rOutrosDados.sODAnoMesApuracao,
                rOutrosDados.sODSituacao,
                rOutrosDados.sODDataOcorrencia,
                pQryDCTFMovSintetico.FieldByName('GRUPOTRIBUTO').AsString,
                sCodNaturezaCompleto,
                pQryDCTFMovSintetico.FieldByName('PERIODICIDADE').AsString,
                rOutrosDados.sODAnoApuracao,
                rOutrosDados.sODMesApuracao,
                RetornaPeriodo(pQryDCTFMovSintetico.FieldByName('PERIODICIDADE').AsString, sPeriodoFinal),
                '',
                sCNPJIncorporacao,
                FormataValor(2, floattostr(dVlrDBPeriodo)),
                rOutrosDados.sODBalancoReducao,
                '0',
                rOutrosDados.sODDBSCPINC));

            End;
            // Andre Imakawa - SIG 67118 - Fim

            // Gravando os Créditos apurados
            pQryDCTFDetCreditos.First;
            While Not pQryDCTFDetCreditos.Eof Do
            Begin
              // SOL 256772 PPM 964770 - Paulo Nobre - 01/06/2015
              // Gera somente para os marcados
              If pQryDCTFDetCreditos.fieldbyname('FLGMARCADO').asString = 'S' Then
              Begin
                // Gravando somente os DARF´s e DCOMP´s sem as DJE´S
                If TRIM(pQryDCTFDetCreditos.fieldbyname('TIPODOCTO').asString) <> 'DJE' Then
                Begin

                  Inc(iQuantidadeRegistro);

                  If TRIM(pQryDCTFDetCreditos.fieldbyname('TIPODOCTO').asString) = 'DARF' Then
                  Begin
                    GravaLinha(sArquivo, GeraCreditoDARF(// R11
                      trim(pQryDadosAdicionais.FieldByName('CNPJFUNDACAO').AsString),
                      rOutrosDados.sODAnoMesApuracao,
                      rOutrosDados.sODSituacao,
                      rOutrosDados.sODDataOcorrencia,
                      pQryDCTFMovSintetico.FieldByName('GRUPOTRIBUTO').AsString,
                      sCodNaturezaCompleto,
                      pQryDCTFMovSintetico.FieldByName('PERIODICIDADE').AsString,
                      rOutrosDados.sODAnoApuracao,
                      rOutrosDados.sODMesApuracao,
                      RetornaPeriodo(pQryDCTFMovSintetico.FieldByName('PERIODICIDADE').AsString, sPeriodoFinal),
                      '',
                      sCNPJIncorporacao,
                      StringReplace(pQryDCTFDetCreditos.FieldByName('DATAFIMAPURACAO').AsString, '/', '', [rfReplaceAll]),
                      trim(pQryDadosAdicionais.FieldByName('CNPJFUNDACAO').AsString),
                      pQryDCTFDetCreditos.FieldByName('CODNATUREZA').AsString,
                      StringReplace(pQryDCTFDetCreditos.FieldByName('DATAVENCDARF').AsString, '/', '', [rfReplaceAll]),
                      // SOL 238778 PPM 512818 - Paulo Nobre
                      // pQryDCTFDetCreditos.FieldByName('REFERENCIA').AsString,
                      '',                         // não terá referencia
                      FormataValor(2, pQryDCTFDetCreditos.FieldByName('VLRIRRF').AsString),
                      FormataValor(2, pQryDCTFDetCreditos.FieldByName('VLRMULTA').AsString),
                      FormataValor(2, pQryDCTFDetCreditos.FieldByName('VLRJUROS').AsString),
                      FormataValor(2, pQryDCTFDetCreditos.FieldByName('VLRIRRF').AsString)));
                  End;

                  If TRIM(pQryDCTFDetCreditos.fieldbyname('TIPODOCTO').asString) = 'DCOMP' Then
                  Begin
                    GravaLinha(sArquivo, GeraCompensacaoPagamentoIndevido(// R12
                      trim(pQryDadosAdicionais.FieldByName('CNPJFUNDACAO').AsString),
                      rOutrosDados.sODAnoMesApuracao,
                      rOutrosDados.sODSituacao,
                      rOutrosDados.sODDataOcorrencia,
                      pQryDCTFMovSintetico.FieldByName('GRUPOTRIBUTO').AsString,
                      sCodNaturezaCompleto,
                      pQryDCTFMovSintetico.FieldByName('PERIODICIDADE').AsString,
                      rOutrosDados.sODAnoApuracao,
                      rOutrosDados.sODMesApuracao,
                      RetornaPeriodo(pQryDCTFMovSintetico.FieldByName('PERIODICIDADE').AsString, sPeriodoFinal),
                      '',                         // Ordem Estabelecimento
                      sCNPJIncorporacao,
                      FormataValor(2, pQryDCTFDetCreditos.FieldByName('VLRIRRF').AsString), // VALOR CR_ORIGINAL_UTILIZADO
                      pQryDCTFDetCreditos.FieldByName('IDFORMAPEDIDO').AsString,
                      pQryDCTFDetCreditos.FieldByName('NUMPERDCOMP').AsString));
                  End;
                End;
              End;

              pQryDCTFDetCreditos.Next;

            End;
          End;

          // Se forem estas Naturezas específicas, então trazer as DJE´S que serão gravadas com a Natureza associada
          If (pQryDCTFMovSintetico.fieldbyname('CODNATUREZA').asString = '0561') Or // 7416, 7431
          (pQryDCTFMovSintetico.fieldbyname('CODNATUREZA').asString = '3540') Or // 7416, 7431
          (pQryDCTFMovSintetico.fieldbyname('CODNATUREZA').asString = '4574') Or // 7460
          (pQryDCTFMovSintetico.fieldbyname('CODNATUREZA').asString = '9466') Or //Taffarel - SIG72056
          (pQryDCTFMovSintetico.fieldbyname('CODNATUREZA').asString = '7987') Then // 7498
          Begin
            _qryAux.Close;
            _qryAux.SQL.Clear;
            _qryAux.SQL.ADD('SELECT DCD.IDDCTF,                            ');
            _qryAux.SQL.ADD('       DCD.CODNATUREZA,                       ');
            _qryAux.SQL.ADD('       DD.NUMDOCUMENTO,                       ');
            _qryAux.SQL.ADD('       DCD.CODNATURASSOCIADA,                 ');
            //                      _qryAux.SQL.ADD('       DCD.IDLANCIRRF,                        ');
            _qryAux.SQL.ADD('       DD.NUMEROPROCESSO,                     ');
            _qryAux.SQL.ADD('       DD.NUMEROPROCJUDICIAL,                 ');
            _qryAux.SQL.ADD('       DCD.DATAFIMAPURACAO,                   ');
            _qryAux.SQL.ADD('       DCD.REFERENCIA,                        ');
            _qryAux.SQL.ADD('       DCD.DATAVENCDARF,                      ');
            _qryAux.SQL.ADD('       DD.FLGFAZDEPOSITO,                     ');
            _qryAux.SQL.ADD('       DD.CODVARA,                            ');
            _qryAux.SQL.ADD('       DD.NOMEVARA,                           ');
            _qryAux.SQL.ADD('       DD.UFVARA,                             ');
            _qryAux.SQL.ADD('       DD.IDMOTIVOSUSPENSAO,                  ');
            _qryAux.SQL.ADD('       ABS(SUM(DCD.VLRIRRF)) VLRIRRF,         ');
            _qryAux.SQL.ADD('       ABS(SUM(DCD.VLRMULTA)) VLRMULTA,       ');
            _qryAux.SQL.ADD('       ABS(SUM(DCD.VLRJUROS)) VLRJUROS        ');
            _qryAux.SQL.ADD('FROM DCTF_CREDITODETALHE_DARF DCD, DCTF_DARFDETALHE DD        ');
            _qryAux.SQL.ADD('WHERE DCD.IDDCTF =  ' + pQryDCTFMovSintetico.FieldByName('IDDCTF').AsString);
            _qryAux.SQL.ADD('      AND DCD.CODNATUREZA = ' + pQryDCTFMovSintetico.fieldbyname('CODNATUREZA').asString);
            _qryAux.SQL.ADD('      AND DCD.TIPODOCTO = ''DJE''              ');
            _qryAux.SQL.ADD('      AND DCD.IDDCTF = DD.IDDCTF                              ');
            _qryAux.SQL.ADD('      AND DCD.IDDCTFCRDETALHE_DARF = DD.IDDCTFCRDETALHE_DARF  ');
            _qryAux.SQL.ADD('      AND DCD.FLGMARCADO = ''S''               ');
            _qryAux.SQL.ADD('GROUP BY DCD.IDDCTF,                           ');
            _qryAux.SQL.ADD('       DCD.CODNATUREZA,                        ');
            _qryAux.SQL.ADD('       DD.NUMDOCUMENTO,                        ');
            _qryAux.SQL.ADD('       DCD.CODNATURASSOCIADA,                  ');
            //                      _qryAux.SQL.ADD('       DCD.IDLANCIRRF,                         ');
            _qryAux.SQL.ADD('       DD.NUMEROPROCESSO,                      ');
            _qryAux.SQL.ADD('       DD.NUMEROPROCJUDICIAL,                  ');
            _qryAux.SQL.ADD('       DCD.DATAFIMAPURACAO,                    ');
            _qryAux.SQL.ADD('       DCD.REFERENCIA,                         ');
            _qryAux.SQL.ADD('       DCD.DATAVENCDARF,                       ');
            _qryAux.SQL.ADD('       DD.FLGFAZDEPOSITO,                      ');
            _qryAux.SQL.ADD('       DD.CODVARA,                             ');
            _qryAux.SQL.ADD('       DD.NOMEVARA,                            ');
            _qryAux.SQL.ADD('       DD.UFVARA,                              ');
            _qryAux.SQL.ADD('       DD.IDMOTIVOSUSPENSAO                    ');
            _qryAux.SQL.ADD('ORDER BY DD.UFVARA, DD.NUMEROPROCJUDICIAL      ');
            _qryAux.Open;
            While Not _qryAux.EOF Do
            Begin

              Inc(iQuantidadeRegistro);

              If (_qryAux.FieldByName('VLRIRRF').asCurrency > 0) Then
              Begin                               //Darivaldo Alencar SIG63464
                GravaLinha(sArquivo, GeraCreditoDJE(// R14
                  trim(pQryDadosAdicionais.FieldByName('CNPJFUNDACAO').AsString),
                  rOutrosDados.sODAnoMesApuracao,
                  rOutrosDados.sODSituacao,
                  rOutrosDados.sODDataOcorrencia,
                  pQryDCTFMovSintetico.FieldByName('GRUPOTRIBUTO').AsString,
                  sCodNaturezaCompleto,           //
                  pQryDCTFMovSintetico.FieldByName('PERIODICIDADE').AsString,
                  rOutrosDados.sODAnoApuracao,
                  rOutrosDados.sODMesApuracao,
                  RetornaPeriodo(pQryDCTFMovSintetico.FieldByName('PERIODICIDADE').AsString, sPeriodoFinal),
                  '',
                  sCNPJIncorporacao,
                  FormataValor(2, _qryAux.FieldByName('VLRIRRF').AsString), // Valor do Depósito Judicial
                  _qryAux.FieldByName('IDMOTIVOSUSPENSAO').AsString,
                  _qryAux.FieldByName('FLGFAZDEPOSITO').AsString,
                  TiraMascara(Trim(_qryAux.FieldByName('NUMEROPROCJUDICIAL').AsString)), // Processo usado pela Justica e RF
                  _qryAux.FieldByName('CODVARA').AsString,
                  _qryAux.FieldByName('NOMEVARA').AsString,
                  _qryAux.FieldByName('UFVARA').AsString,
                  _qryAux.FieldByName('REFERENCIA').AsString, // Identificador do depósito
                  StringReplace(_qryAux.FieldByName('DATAFIMAPURACAO').AsString, '/', '', [rfReplaceAll]),
                  _qryAux.FieldByName('NUMDOCUMENTO').AsString, // CPF
                  _qryAux.FieldByName('CODNATURASSOCIADA').AsString, // Depósitos Judiciais
                  StringReplace(_qryAux.FieldByName('DATAVENCDARF').AsString, '/', '', [rfReplaceAll]),
                  FormataValor(2, _qryAux.FieldByName('VLRIRRF').AsString), // Valor do Principal
                  FormataValor(2, _qryAux.FieldByName('VLRMULTA').AsString),
                  FormataValor(2, _qryAux.FieldByName('VLRJUROS').AsString)));
              End;
              _qryAux.Next;
            End;
          End;

          // Pula para a próxima periodicidade do Tributo
          cdsTabelaComPeriodicidades.Next;

          pQryDCTFDetCreditos.Filtered := False;

        End;
      End;

      // Pula para a próxima Natureza
      pQryDCTFMovSintetico.Next;

    End;

    // Gravando o registro final - Trailler - Rodapé
    GravaLinha(sArquivo, GeraTrailler(
      trim(pQryDadosAdicionais.FieldByName('CNPJFUNDACAO').AsString),
      rOutrosDados.sODMesApuracao,
      rOutrosDados.sODSituacao,
      rOutrosDados.sODDataOcorrencia,
      IntToStr(iQuantidadeRegistro)));

    pQryDCTFMovSintetico.First;
    result := True;
  End;
End;

Function TCtrlGeraDCTF_Novo.CriaArquivo(sArquivo: String): Boolean;
Begin
  Result := False;
  Try
    AssignFile(ArquivoEnvioRFB, sArquivo);
    Rewrite(ArquivoEnvioRFB);
    CloseFile(ArquivoEnvioRFB);

    Result := True;
  Except
    Result := False;
  End;
End;

Procedure TCtrlGeraDCTF_Novo.GravaLinha(sArquivo, sLinha: String);
Begin
  If sLinha <> '' Then
  Begin
    AssignFile(ArquivoEnvioRFB, sArquivo);
    Append(ArquivoEnvioRFB);
    Write(ArquivoEnvioRFB, sLinha);
    WriteLn(ArquivoEnvioRFB);
    CloseFile(ArquivoEnvioRFB);
  End;
End;

Function TCtrlGeraDCTF_Novo.GeraHeader(
  psAnoDeclaracao,
  psMesDeclaracao,
  psTipoDeclaracao,
  psCNPJ,
  psNomeEmpresarial,
  psUF,
  psSituacao,
  psPeriodoInicial,
  psPeriodoFinal,
  psDataOcorrencia,
  psNumVersaoLayout: String): String;
Var sLinha: String;
Begin
  { Gerando Linhas }

  sLinha := CompletaEspaco('DCTFM', 5);           // Sistema                                             1
  sLinha := sLinha + CompletaEspaco('', 3);       // Reservado                                       2
  sLinha := sLinha + CompletaEspaco('', 4);       // Reservado                                       3
  sLinha := sLinha + CompletaEspaco(psAnoDeclaracao, 4); // Ano de Competência da Declaração   4
  // SIG 48772 - Início
  sLinha := sLinha + CompletaZero('1930', 4);     // Reservado                                     5
  // SIG 48772 - Fim
  sLinha := sLinha + CompletaEspaco(psTipoDeclaracao, 1); // Tipo de Declaração                6
  sLinha := sLinha + CompletaEspaco(psCNPJ, 14);  // CNPJ do Contribuinte                       7
  sLinha := sLinha + CompletaZero('', 1);         // Reservado                                         8
  sLinha := sLinha + CompletaEspaco(psNumVersaoLayout, 3); // Versão do layout                 9
  sLinha := sLinha + CompletaEspaco(psNomeEmpresarial, 60); // Nome Empresárial                10
  sLinha := sLinha + CompletaEspaco(psUF, 2);     // UF Domicílio                                  11
  sLinha := sLinha + CompletaZero('', 10);        // Reservado                                        12
  sLinha := sLinha + CompletaZero('', 1);         // Reservado                                         13
  sLinha := sLinha + CompletaEspaco(psSituacao, 2); // Situação                                14
  sLinha := sLinha + CompletaZero(psAnoDeclaracao, 4); // Ano de Competência                   15
  sLinha := sLinha + CompletaZero(psMesDeclaracao, 2); // Mês de Competência                   16
  sLinha := sLinha + CompletaZero('', 11);        // Reservado                                        17
  sLinha := sLinha + CompletaEspaco(psPeriodoInicial, 8); // Período Base Inicial              18
  sLinha := sLinha + CompletaEspaco(psPeriodoFinal, 8); // Pedíodo Base Final                  19
  sLinha := sLinha + CompletaZero(psDataOcorrencia, 8); // Data de Ocorrência do Evento        20
  sLinha := sLinha + CompletaZero('', 1);         // Reservado                                         21
  sLinha := sLinha + CompletaZero('', 1);         // Reservado                                         22
  sLinha := sLinha + CompletaEspaco('', 207);     // Reservado                                     23
  sLinha := sLinha + CompletaZero('', 10);        // Reservado                                        24

  Result := sLinha;
End;

// SOL 235337/16319 PPM 457199 - Paulo Nobre

Function TCtrlGeraDCTF_Novo.GeraDadosIniciais(
  psCNPJ,
  psAnoMesApuracao,
  psSituacao,
  psDataEvento,
  psDiaMesInicial,
  psDiaMesFinal,
  psRetificadora,
  psNumRecibo,
  psFormaTributacao,
  psQualificacaoPJ,
  psLevantouBalanco,
  psComDebitoSCP,
  psCritRecon,
  psRegimeApuContrib,
  psSituacaoPJ,
  psOpcaoLEI,
  psOptanteSimples,
  psOptanteCPRB,
  psInativa: String): String;
Var sLinha: String;
Begin

  { Gerando Linhas }

  sLinha := CompletaEspaco('R01', 3);             // Tipo                                                                                  1
  sLinha := sLinha + CompletaEspaco(psCNPJ, 14);  // CNPJ do Contribuinte                                                       2
  sLinha := sLinha + CompletaZero(psAnoMesApuracao, 6); // Mês de Ocorrência do Fator Gerador                                  3
  sLinha := sLinha + CompletaZero(psSituacao, 1); // Situação                                                                  4
  sLinha := sLinha + CompletaZero(psDataEvento, 8); // Data do Evento                                                          5
  sLinha := sLinha + CompletaZero(psDiaMesInicial, 4); // Inicio do Periodo                                                    6
  sLinha := sLinha + CompletaZero(psDiaMesFinal, 4); // Final do Periodo                                                       7
  sLinha := sLinha + CompletaZero(psRetificadora, 1); // Declaração Retificadora                                               8
  sLinha := sLinha + CompletaZero(psNumRecibo, 12); // Número do Recibo de Entrega a ser Retificada                            9
  sLinha := sLinha + CompletaZero(psFormaTributacao, 1); // Forma da Tributação do Lucro                                       10
  sLinha := sLinha + CompletaZero(psQualificacaoPJ, 2); // Qualificação da Pessoa Juridica                                     11
  sLinha := sLinha + CompletaZero(psLevantouBalanco, 1); // PJ Levantou balanço de suspensão no mês                            12
  sLinha := sLinha + CompletaZero(psComDebitoSCP, 1); // PJ Com débitos de SCP a serem declarados                              13
  //SIG 48772 - Início
  sLinha := sLinha + CompletaZero(psOptanteSimples, 1); //PJ optante pelo Simples Nacional                                      14
  sLinha := sLinha + CompletaZero(psOptanteCPRB, 1); // PJ optante pela CPRB                                                   15
  sLinha := sLinha + CompletaZero(psInativa, 1);  //PJ inativa no mês da declaração                                          16
  sLinha := sLinha + CompletaZero(psCritRecon, 1); // Critério de Reconhecimento das Variações Monetárias...                   17
  sLinha := sLinha + CompletaZero('', 11);        // Reservado                                                                        18
  sLinha := sLinha + CompletaZero(psRegimeApuContrib, 1); //  Regime de Apuração da Contribuição para o PIS/Pasep e da Cofins  19
  sLinha := sLinha + CompletaZero(psSituacaoPJ, 1); //  Situação do PJ                                                         20
  sLinha := sLinha + CompletaZero(psOpcaoLEI, 1); //  Opção da LEI...                                                          21
  sLinha := sLinha + CompletaEspaco('', 10);      // Reservado                                                                      22
  sLinha := sLinha + sTerminador;                 // Delimitador de Registro                                                                   23
  //SIG 48772 - Fim
  Result := sLinha;
End;

// SOL 235337/16319 PPM 457199 - Paulo Nobre

Function TCtrlGeraDCTF_Novo.GeraDadosCadastraisEstabelecimento(
  psCNPJ,
  psAnoMesApuracao,
  psSituacao,
  psDataEvento,
  psNomeEmpresarial,
  psCodNaturezaJuridica,
  psLogradouro,
  psNumero,
  psComplemento,
  psBairro,
  psMunicipio,
  psUF,
  psCEP,
  psDDDTelefone,
  psTelefone,
  psDDDFax,
  psFax,
  psCaixaPostal,
  psUFCaixaPostal,
  psCEPCaixaPostal,
  psEMail: String): String;
Var sLinha: String;
Begin
  { Gerando Linhas }

  sLinha := CompletaEspaco('R02', 3);             // Tipo                                                        1
  sLinha := sLinha + CompletaEspaco(psCNPJ, 14);  // CNPJ do Contribuinte                             2
  sLinha := sLinha + CompletaZero(psAnoMesApuracao, 6); // Mês de Ocorrência do Fator Gerador        3
  sLinha := sLinha + CompletaZero(psSituacao, 1); // Situação                                        4
  sLinha := sLinha + CompletaZero(psDataEvento, 8); // Data do Evento                                5
  sLinha := sLinha + CompletaEspaco(psNomeEmpresarial, 115); // Nome Empresarial                     6
  sLinha := sLinha + CompletaZero(psCodNaturezaJuridica, 4); // Código da Natureza Juríica           7
  sLinha := sLinha + CompletaEspaco(psLogradouro, 40); // Logradouro                                 8
  sLinha := sLinha + CompletaEspaco(psNumero, 6); // Número                                          9
  sLinha := sLinha + CompletaEspaco(psComplemento, 21); // Complemento                               10
  sLinha := sLinha + CompletaEspaco(psBairro, 20); // Bairro                                         11
  sLinha := sLinha + CompletaEspaco(psMunicipio, 50); // Município                                   12
  sLinha := sLinha + CompletaEspaco(psUF, 2);     // UF                                                  13
  sLinha := sLinha + CompletaEspaco(psCEP, 8);    // CEP                                                14
  sLinha := sLinha + CompletaEspaco(psDDDTelefone, 4); // DDD do Telefone                            15
  sLinha := sLinha + CompletaEspaco(psTelefone, 9); // Telefone                                      16
  sLinha := sLinha + CompletaEspaco(psDDDFax, 4); // DDD do FAX                                      17
  sLinha := sLinha + CompletaEspaco(psFax, 9);    // Fax                                                18
  sLinha := sLinha + CompletaEspaco(psCaixaPostal, 6); // Caixa Postal                               19
  sLinha := sLinha + CompletaEspaco(psUFCaixaPostal, 2); // UF da Caixa Postal                       20
  sLinha := sLinha + CompletaEspaco(psCEPCaixaPostal, 8); // CEP Caixa Postal                        21
  sLinha := sLinha + CompletaEspaco(psEMail, 40); // Correio Eletronico                              22
  sLinha := sLinha + CompletaEspaco('', 10);      // Reservado                                            23
  sLinha := sLinha + sTerminador;                 // Delimitador de Registro                                         24

  Result := sLinha;
End;

// SOL 235337/16319 PPM 457199 - Paulo Nobre

Function TCtrlGeraDCTF_Novo.GeraDadosResponsavelxRepresentante(
  psCNPJ,
  psAnoMesApuracao,
  psSituacao,
  psDataEvento,
  psNomeRepresentante,
  psCPFRepresentante,
  psDDDTelRepresentante,
  psTelRepresentante,
  psRamalTelRepresentante,
  psDDDFaxRepresentante,
  psFaxRepresentante,
  psEMailFaxRepresentante,
  psNomeResponsavel,
  psCPFResponsavel,
  psCRCResponsavel,
  psUFResponsavel,
  psDDDTelResponsavel,
  psTelResponsavel,
  psRamalTelResponsavel,
  psDDDFaxResponsavel,
  psFaxResponsavel,
  psEMailFaxResponsavel: String): String;
Var sLinha: String;
Begin
  { Gerando Linhas }

  sLinha := CompletaEspaco('R03', 3);             // Tipo                                                                    1
  sLinha := sLinha + CompletaEspaco(psCNPJ, 14);  // CNPJ do Contribuinte                                         2
  sLinha := sLinha + CompletaZero(psAnoMesApuracao, 6); // Mês de Ocorrência do Fator Gerador                    3
  sLinha := sLinha + CompletaZero(psSituacao, 1); // Situação                                                    4
  sLinha := sLinha + CompletaZero(psDataEvento, 8); // Data do Evento                                            5
  sLinha := sLinha + CompletaEspaco(psNomeRepresentante, 60); // Nome - Representante                            6
  sLinha := sLinha + CompletaZero(psCPFRepresentante, 11); // CPF - Representante                                7
  sLinha := sLinha + CompletaEspaco(psDDDTelRepresentante, 4); // DDD Telefone - Representante                   8
  sLinha := sLinha + CompletaEspaco(psTelRepresentante, 9); // Telefone - Representante                          9
  sLinha := sLinha + CompletaEspaco(psRamaltELRepresentante, 5); // Ramal Telefone - Representante               10
  sLinha := sLinha + CompletaEspaco(psDDDFaxRepresentante, 4); // DDD Fax- Representante                         11
  sLinha := sLinha + CompletaEspaco(psFaxRepresentante, 9); // Fax- Representante                                12
  sLinha := sLinha + CompletaEspaco(psEMailFaxRepresentante, 40); // Correio Eletronico - Representante          13
  sLinha := sLinha + CompletaEspaco(psNomeResponsavel, 60); // Nome - Responsavel                                14
  sLinha := sLinha + CompletaZero(psCPFResponsavel, 11); // CPF - Responsavel                                    15
  sLinha := sLinha + CompletaEspaco(psCRCResponsavel, 15); // CRC - Responsavel                                  16
  sLinha := sLinha + CompletaEspaco(psUFResponsavel, 2); // UF - Responsavel                                     17
  sLinha := sLinha + CompletaEspaco(psDDDTelResponsavel, 4); // DDD - Responsavel                                18
  sLinha := sLinha + CompletaEspaco(psTelResponsavel, 9); // Telefone - Responsavel                              19
  sLinha := sLinha + CompletaEspaco(psRamalTelResponsavel, 5); // Ramal Telefone - Responsavel                   20
  sLinha := sLinha + CompletaEspaco(psDDDFaxResponsavel, 4); // DDD Fax- Responsavel                             21
  sLinha := sLinha + CompletaEspaco(psFaxResponsavel, 9); // Fax- Responsavel                                    22
  sLinha := sLinha + CompletaEspaco(psEMailFaxResponsavel, 40); // Correio Eletronico - Responsavel              23
  sLinha := sLinha + CompletaEspaco('', 10);      // Reservado                                                        24
  sLinha := sLinha + sTerminador;                 // Delimitador de Registro                                                     25

  Result := sLinha
End;

// SOL 235337/16319 PPM 457199 - Paulo Nobre

Function TCtrlGeraDCTF_Novo.GeraDebitoApurado(
  psCNPJ,
  psAnoMesApuracao,
  psSituacao,
  psDataEvento,
  psGrupoTributo,
  psCodigoReceita,
  psPeriodicidade,
  psAnoPeriodoApuracao,
  psMBQSPeriodo,
  psDSQDPeriodo,
  psOrdemEstabelecimento,
  psCNPJIncorporacao,
  psValorDebito,
  psBalancoReducao,
  psDivideQuotas,
  psODDBSCPINC: String): String;
Var sLinha: String;
Begin
  { Gerando Linhas }

  sLinha := CompletaEspaco('R10', 3);             // Tipo                                                                     1
  sLinha := sLinha + CompletaEspaco(psCNPJ, 14);  // CNPJ do Contribuinte                                          2
  sLinha := sLinha + CompletaZero(psAnoMesApuracao, 6); // Mês de Ocorrência do Fator Gerador                     3
  sLinha := sLinha + CompletaZero(psSituacao, 1); // Situação                                                     4
  sLinha := sLinha + CompletaZero(psDataEvento, 8); // Data do Evento                                             5
  sLinha := sLinha + CompletaZero(psGrupoTributo, 2); // Grupo de Tributo                                         6
  sLinha := sLinha + CompletaZero(psCodigoReceita, 6); // Código da Receita                                       7
  sLinha := sLinha + CompletaEspaco(psPeriodicidade, 1); // Periodicidade                                         8
  sLinha := sLinha + CompletaZero(psAnoPeriodoApuracao, 4); // Ano do Período de Apuração                         9
  sLinha := sLinha + CompletaZero(psMBQSPeriodo, 2); // Mês/Bimestre/Trimestre/Quadrimestre/Semestre do Período   10
  sLinha := sLinha + CompletaZero(psDSQDPeriodo, 2); // Dia/Semana/Quinzena/Decêndio do Período                   11
  sLinha := sLinha + CompletaZero(psOrdemEstabelecimento, 6); // Ordem do Estabelecimento                         12
  sLinha := sLinha + CompletaZero(psCNPJIncorporacao, 14); // CNPJ da Incorporação                                13
  sLinha := sLinha + CompletaZero('', 1);         // Reservado                                                            14
  sLinha := sLinha + CompletaZero(psValorDebito, 14); // Valor do Débito                                          15
  sLinha := sLinha + CompletaZero(psBalancoReducao, 1); // Balanço de Redução                                     16
  sLinha := sLinha + CompletaZero(psDivideQuotas, 1); // O Saldo será dividido em quotas                          17
  sLinha := sLinha + CompletaZero('', 1);         // Reservado                                                            18
  sLinha := sLinha + CompletaZero(psODDBSCPINC, 1); // Débito de SCP/INC                                          19
  sLinha := sLinha + CompletaEspaco('', 10);      // Reservado                                                         20
  sLinha := sLinha + sTerminador;                 // Delimitador de Registro                                                      21

  Result := sLinha
End;

Function TCtrlGeraDCTF_Novo.GeraCreditoDARF(
  psCNPJ,
  psAnoMesApuracao,
  psSituacao,
  psDataEvento,
  psGrupoTributo,
  psCodigoReceita,
  psPeriodicidade,
  psAnoPeriodoApuracao,
  psMBQSPeriodo,
  psDSQDPeriodo,
  psOrdemEstabelecimento,
  psCNPJIncorporacao,
  psPeriodoApuracao,
  psCNPJdoDARF,
  psCodigoReceitaDARF,
  psDataVencimento,
  psNumReferencia,
  psValorPrincipal,
  psValorMulta,
  psValorJuros,
  psValorPagoDebito: String): String;
Var sLinha: String;
Begin
  { Gerando Linhas }

  sLinha := CompletaEspaco('R11', 3);             // Tipo                                                                      1
  sLinha := sLinha + CompletaEspaco(psCNPJ, 14);  // CNPJ do Contribuinte                                           2
  sLinha := sLinha + CompletaZero(psAnoMesApuracao, 6); // Mês de Ocorrência do Fator Gerador                      3
  sLinha := sLinha + CompletaZero(psSituacao, 1); // Situação                                                      4
  sLinha := sLinha + CompletaZero(psDataEvento, 8); // Data do Evento                                              5
  sLinha := sLinha + CompletaZero(psGrupoTributo, 2); // Grupo de Tributo                                          6
  sLinha := sLinha + CompletaZero(psCodigoReceita, 6); // Código da Receita                                        7
  sLinha := sLinha + CompletaEspaco(psPeriodicidade, 1); // Periodicidade                                          8
  sLinha := sLinha + CompletaZero(psAnoPeriodoApuracao, 4); // Ano do Período de Apuração                          9
  sLinha := sLinha + CompletaZero(psMBQSPeriodo, 2); // Mês/Bimestre/Trimestre/Quadrimestre/Semestre do Período    10
  sLinha := sLinha + CompletaZero(psDSQDPeriodo, 2); // Dia/Semana/Quinzena/Decêndio do Período                    11
  sLinha := sLinha + CompletaZero(psOrdemEstabelecimento, 6); // Ordem do Estabelecimento                          12
  sLinha := sLinha + CompletaZero(psCNPJIncorporacao, 14); // CNPJ da Incorporação                                 13
  sLinha := sLinha + CompletaZero('', 1);         // Reservado                                                             14
  sLinha := sLinha + CompletaEspaco(psPeriodoApuracao, 8); // Periodo de Apuração                                  15
  sLinha := sLinha + CompletaZero(psCNPJdoDARF, 14); // CNPJ do DARF                                               16
  sLinha := sLinha + CompletaZero(psCodigoReceitaDARF, 4); // Código da Receita do DARF                            17
  sLinha := sLinha + CompletaEspaco(psDataVencimento, 8); // Data do Vencimento                                    18
  sLinha := sLinha + CompletaEspaco(psNumReferencia, 17); // Numero de Referencia                                  19
  sLinha := sLinha + CompletaZero(psValorPrincipal, 14); // Valor do Principal                                     20
  sLinha := sLinha + CompletaZero(psValorMulta, 14); // Valor da Multa                                             21
  sLinha := sLinha + CompletaZero(psValorJuros, 14); // Valor dos Juros                                            22
  sLinha := sLinha + CompletaZero(psValorPagoDebito, 14); // Valor pago do Débito                                  23
  sLinha := sLinha + CompletaEspaco('', 10);      // Reservado                                                          24
  sLinha := sLinha + sTerminador;                 // Delimitador de Registro                                                       25

  Result := sLinha;
End;

Function TCtrlGeraDCTF_Novo.GeraCompensacaoPagamentoIndevido(
  psCNPJ,
  psAnoMesApuracao,
  psSituacao,
  psDataEvento,
  psGrupoTributo,
  psCodigoReceita,
  psPeriodicidade,
  psAnoPeriodoApuracao,
  psMBQSPeriodo,
  psDSQDPeriodo,
  psOrdemEstabelecimento,
  psCNPJIncorporacao,
  psValorCompensadoDebito,
  psFormalizaPedido,
  psPERDCOMP: String): String;
Var sLinha: String;
Begin
  // se psFormalizaPedido = 3 obrigatório o psCNPJ e psCodigoReceita
  // se psCodigoReceitaDARF = 4028,  psNumReferencia = Codigo do Municipio
  // se psCodigoReceitaDARF = 1070,  psNumReferencia = Codigo do Imóvel Rural

  { Gerando Linhas }
  sLinha := CompletaEspaco('R12', 3);             // Tipo                                                                     1
  sLinha := sLinha + CompletaEspaco(psCNPJ, 14);  // CNPJ do Contribuinte                                          2
  sLinha := sLinha + CompletaZero(psAnoMesApuracao, 6); // Mês de Ocorrência do Fator Gerador                     3
  sLinha := sLinha + CompletaZero(psSituacao, 1); // Situação                                                     4
  sLinha := sLinha + CompletaZero(psDataEvento, 8); // Data do Evento                                             5
  sLinha := sLinha + CompletaZero(psGrupoTributo, 2); // Grupo de Tributo                                         6
  sLinha := sLinha + CompletaZero(psCodigoReceita, 6); // Código da Receita                                       7
  sLinha := sLinha + CompletaEspaco(psPeriodicidade, 1); // Periodicidade                                         8
  sLinha := sLinha + CompletaZero(psAnoPeriodoApuracao, 4); // Ano do Período de Apuração                         9
  sLinha := sLinha + CompletaZero(psMBQSPeriodo, 2); // Mês/Bimestre/Trimestre/Quadrimestre/Semestre do Período   10
  sLinha := sLinha + CompletaZero(psDSQDPeriodo, 2); // Dia/Semana/Quinzena/Decêndio do Período                   11
  sLinha := sLinha + CompletaZero(psOrdemEstabelecimento, 6); // Ordem do Estabelecimento                         12
  sLinha := sLinha + CompletaZero(psCNPJIncorporacao, 14); // CNPJ da Incorporação                                13
  sLinha := sLinha + CompletaZero('', 1);         // Reservado                                                            14
  sLinha := sLinha + CompletaZero(psValorCompensadoDebito, 14); // Valor Compensado do Débito                     15
  sLinha := sLinha + CompletaZero(psFormalizaPedido, 1); // Formalização do Pedido                                16
  sLinha := sLinha + CompletaEspaco(psPERDCOMP, 24); // Número do PERDCOMP ou Processo                            17
  sLinha := sLinha + CompletaEspaco('', 10);      // Reservado                                                         18
  sLinha := sLinha + sTerminador;                 // Delimitador de Registro                                                      19

  Result := sLinha;
End;

Function TCtrlGeraDCTF_Novo.GeraCreditoDJE(
  psCNPJ,
  psAnoMesApuracao,
  psSituacao,
  psDataEvento,
  psGrupoTributo,
  psCodigoReceita1,
  psPeriodicidade,
  psAnoPeriodoApuracao,
  psMBQSPeriodo,
  psDSQDPeriodo,
  psOrdemEstabelecimento,
  psCNPJIncorporacao,
  psValorSuspensoDebito,
  psMotivoSuspensao,
  psDeposito,
  psNumeroProcesso,
  psVara,
  psMunicipio,
  psUF,
  psIdentificaDebito,
  psPEriodoApuracao,
  psCPF_CNPJ,
  psCodigoReceita2,
  psDataVencimento,
  psValorPrincipal,
  psValorMulta,
  psValorJuros: String): String;
Var sLinha: String;
Begin
  { Limpa Linha }

  psNumeroProcesso := StringReplace(psNumeroProcesso, '.', '', [rfReplaceAll]);
  psNumeroProcesso := StringReplace(psNumeroProcesso, '-', '', [rfReplaceAll]);
  psNumeroProcesso := StringReplace(psNumeroProcesso, ',', '', [rfReplaceAll]);
  psNumeroProcesso := StringReplace(psNumeroProcesso, '/', '', [rfReplaceAll]);

  psIdentificaDebito := StringReplace(psIdentificaDebito, '.', '', [rfReplaceAll]);
  psIdentificaDebito := StringReplace(psIdentificaDebito, '-', '', [rfReplaceAll]);
  psIdentificaDebito := StringReplace(psIdentificaDebito, ',', '', [rfReplaceAll]);
  psIdentificaDebito := StringReplace(psIdentificaDebito, '/', '', [rfReplaceAll]);

  psVara := StringReplace(psVara, 'º', '', [rfReplaceAll]);
  psVara := StringReplace(psVara, 'ª', '', [rfReplaceAll]);

  psMunicipio := StringReplace(psMunicipio, 'º', '', [rfReplaceAll]);
  psMunicipio := StringReplace(psMunicipio, 'ª', '', [rfReplaceAll]);

  { Criticas }

  If StrToFloat(psValorSuspensoDebito) <= 0 Then
    Exit;

  If psMotivoSuspensao = '2' Then                 // Depósito Judicial do Montante Integral
    psDeposito := '1'                             // Depósito foi efetuado
  Else If psMotivoSuspensao = '7' Then            // Medida Judicial em que o declarante não é o autor
  Begin
    // SOL 241790 PPM 558107 - Paulo Nobre
    psDeposito := '0';
    psNumeroProcesso := '';
    psVara := '';
    psMunicipio := '';
    psUF := '';
    psIdentificaDebito := '';
    psPEriodoApuracao := '';
    psCPF_CNPJ := '';
    psCodigoReceita2 := '';
    psDataVencimento := '';
    psValorPrincipal := '';
    psValorMulta := '';
    psValorJuros := '';
  End;

  // Se psDeposito = 1 será obrigatorio os campos
  // psIdentificaDebito, psPEriodoApuracao, psCPF_CNPJ, psCodigoReceita,
  // psDataVencimento, psValorPrincipal, psValorMulta, psValorJuros

  { Gerando Linhas }

  sLinha := CompletaEspaco('R14', 3);             // Tipo                                                                       1
  sLinha := sLinha + CompletaEspaco(psCNPJ, 14);  // CNPJ do Contribuinte                                            2
  sLinha := sLinha + CompletaZero(psAnoMesApuracao, 6); // Mês de Ocorrência do Fator Gerador                       3
  sLinha := sLinha + CompletaZero(psSituacao, 1); // Situação                                                       4
  sLinha := sLinha + CompletaZero(psDataEvento, 8); // Data do Evento                                               5
  sLinha := sLinha + CompletaZero(psGrupoTributo, 2); // Grupo de Tributo                                           6
  sLinha := sLinha + CompletaZero(psCodigoReceita1, 6); // Código da Receita                                        7
  sLinha := sLinha + CompletaEspaco(psPeriodicidade, 1); // Periodicidade                                           8
  sLinha := sLinha + CompletaZero(psAnoPeriodoApuracao, 4); // Ano do Período de Apuração                           9
  sLinha := sLinha + CompletaZero(psMBQSPeriodo, 2); // Mês/Bimestre/Trimestre/Quadrimestre/Semestre do Período     10
  sLinha := sLinha + CompletaZero(psDSQDPeriodo, 2); // Dia/Semana/Quinzena/Decêndio do Período                     11
  sLinha := sLinha + CompletaZero(psOrdemEstabelecimento, 6); // Ordem do Estabelecimento                           12
  sLinha := sLinha + CompletaZero(psCNPJIncorporacao, 14); // CNPJ da Incorporação                                  13
  sLinha := sLinha + CompletaZero('', 1);         // Reservado                                                              14
  sLinha := sLinha + CompletaZero(psValorSuspensoDebito, 14); // Valor Suspenso do Débito                           15
  sLinha := sLinha + CompletaZero(psMotivoSuspensao, 2); // Motivo da Suspensão                                     16
  sLinha := sLinha + CompletaEspaco(psDeposito, 1); // Deposito                                                     17
  sLinha := sLinha + CompletaZero('', 1);         // Reservado                                                              18
  sLinha := sLinha + CompletaEspaco(psNumeroProcesso, 24); // Numero do Processo                                    19
  sLinha := sLinha + CompletaEspaco(psVara, 2);   // Vara                                                             20
  sLinha := sLinha + CompletaEspaco(psMunicipio, 50); // Municipio                                                  21
  sLinha := sLinha + CompletaEspaco(psUF, 2);     // UF                                                                 22
  sLinha := sLinha + CompletaEspaco(psIdentificaDebito, 20); // Identificacao do Debito                             23
  sLinha := sLinha + CompletaZero(psPEriodoApuracao, 8); // Periodo de Apuracao                                     24
  sLinha := sLinha + CompletaEspaco(psCPF_CNPJ, 14); // CPF/CNPJ                                                    25
  sLinha := sLinha + CompletaZero(psCodigoReceita2, 4); // Código da Receita                                        26
  sLinha := sLinha + CompletaZero(psDataVencimento, 8); // Data do Vencimento                                       27
  sLinha := sLinha + CompletaZero(psValorPrincipal, 14); // Valor do Principal                                      28
  sLinha := sLinha + CompletaZero(psValorMulta, 14); // Valor da Multa                                              29
  sLinha := sLinha + CompletaZero(psValorJuros, 14); // Valor dos Juros                                             30
  sLinha := sLinha + CompletaEspaco('', 10);      // Reservado                                                           31
  sLinha := sLinha + sTerminador;                 // Delimitador de Registro                                                        32

  Result := sLinha;
End;

Function TCtrlGeraDCTF_Novo.GeraTrailler(
  psCNPJ,
  psAnoMesApuracao,
  psSituacao,
  psDataEvento,
  psQuantidadeRegistro: String): String;
Var sLinha: String;
Begin
  { Gerando Linhas }

  sLinha := CompletaEspaco('T9', 2);              // Tipo                                                                      1
  sLinha := sLinha + CompletaEspaco(psCNPJ, 14);  // CNPJ do Contribuinte                                          2
  sLinha := sLinha + CompletaZero(psAnoMesApuracao, 6); // Mês de Ocorrência do Fator Gerador                     3
  sLinha := sLinha + CompletaZero(psSituacao, 1); // Situação                                                     4
  sLinha := sLinha + CompletaZero(psDataEvento, 8); // Data do Evento                                             5
  sLinha := sLinha + CompletaZero(psQuantidadeRegistro, 5); // Quantidade de Registro                             6
  sLinha := sLinha + CompletaEspaco('', 56);      // Reservado                                                         7
  sLinha := sLinha + CompletaEspaco('', 10);      // HashCode                                                          8
  sLinha := sLinha + sTerminador;                 // Delimitador de Registro                                                      9

  Result := sLinha;
End;

Function TCtrlGeraDCTF_Novo.GetVersaoLayoutDCTF: String;
Var
  _qryAux: TwwQuery;
Begin
  //SIG 48772 - Início
  _qryAux := TwwQuery.Create(Nil);
  _qryAux.DatabaseName := DataBaseName;

  Try
    _qryAux.SQL.Add('SELECT MAX(IDDCTF) AS IDDCTF, VERSAO FROM DCTF_DADOSADICIONAIS GROUP BY VERSAO');
    _qryAux.Open;

    Result := _qryAux.FieldByName('VERSAO').asString;
  Finally
    _qryAux.Free;
  End;
  //SIG 48772 - Fim
End;

Function TCtrlGeraDCTF_Novo.RecuperaDataApuracaoNatureza(
  psNatureza: String; piIDDCTF: Integer): OLEVariant;
Var
  sSQL: String;
Begin
  sSQL := 'SELECT DATAAPURACAO ' + #10#13 +
    '  FROM DCTF_DEBITODETALHE ' + #10#13 +
    ' WHERE IDDCTF = ' + IntToStr(piIDDCTF) + #10#13 +
    '   AND CODNATUREZA =  ' + QuotedStr(psNatureza) + #10#13 +
    ' GROUP BY DATAAPURACAO ';
  Result := GetDataPacket(sSQL);
End;

Function TCtrlGeraDCTF_Novo.ExportaResultQuery(sCaminho: String; pIdDCTF, pIdDCTF2: Integer): Boolean;
Var
  i: Integer;
  OutLine: String;
  sTemp: String;
  cds: TCMClientDataSet;
  sSQL: String;
  Arquivo: TextFile;
Begin
  cds := TCMClientDataSet.Create(Nil);
  Result := True;
  Try
    Try
      sSql := sSql + 'SELECT ' + inttostr(pIdDCTF) + ',';
      sSql := sSql + '     (SELECT DCD.IDDCTFCRDETALHE_DARF    '; // IDDCTFCRDETALHE_DARF
      sSql := sSql + '      FROM DCTF_CREDITODETALHE_DARF DCD  ';
      sSql := sSql + '      WHERE DCD.IDDCTF = ' + inttostr(pIdDCTF);
      sSql := sSql + '            AND (((DCD.IDLANCIRRF = DD.IDLANCIRRF) OR ';
      sSql := sSql + '                 (DCD.IDLANCIRRF IS NULL AND DD.IDLANCIRRFFOLHABENEF IS NULL AND  DCD.NUMDOCUMENTO = DD.NUMDOCUMENTO AND DCD.VLRIRRF = DD.VLRIRRF)) '; // Andre Imakawa - SIG 74073

      sSql := sSql + '      OR  (DCD.IDLANCIRRFFOLHABENEF = DD.IDLANCIRRFFOLHABENEF)) ';

      sSql := sSql + '            AND DCD.TIPODOCTO = ''DJE''), ';
      sSql := sSql + '      DD.IDDARF,                ';
      sSql := sSql + '      DD.IDLANCIRRF,            ';
      sSql := sSql + '      DD.IDPESSOA,              ';
      sSql := sSql + '      DD.NUMDOCUMENTO,          ';
      sSql := sSql + '      DD.NOME,                  ';
      sSql := sSql + '      DD.NUMEROPROCESSO,        ';
      sSql := sSql + '      DD.NUMEROPROCJUDICIAL,    ';
      sSql := sSql + '      DD.CODVARA,               ';
      sSql := sSql + '      DD.NOMEVARA,              ';
      sSql := sSql + '      DD.UFVARA,                ';
      sSql := sSql + '      DD.IDMUNICIPIO,           ';
      sSql := sSql + '      DD.FLGFAZDEPOSITO,        ';
      sSql := sSql + '      DD.IDMOTIVOSUSPENSAO,     ';
      sSql := sSql + '      DD.VLRIRRF,               ';
      sSql := sSql + '      DD.FLGREGEXCLUIDO,        ';
      sSql := sSql + '      DD.FLGMARCADO,            ';
      sSql := sSql + '      SYSDATE,                  ';
      sSql := sSql + '      USER,                     ';
      sSql := sSql + '      NULL,                     ';
      sSql := sSql + '      NULL,                     ';
      sSql := sSql + '      DD.IDLANCIRRFFOLHABENEF   ';
      sSql := sSql + 'FROM DCTF_CREDITODETALHE_DARF CD, DCTF_DARFDETALHE DD        ';
      sSql := sSql + 'WHERE CD.IDDCTF = DD.IDDCTF                                  ';
      sSql := sSql + '      AND CD.IDDCTFCRDETALHE_DARF = DD.IDDCTFCRDETALHE_DARF  ';
      sSql := sSql + '      AND CD.IDDCTF = ' + inttostr(pIdDCTF2);
      sSql := sSql + '      AND TRIM(CD.TIPODOCTO) = ''DJE''                        ';

      cds.Data := GetDataPacket(sSQL);
      AssignFile(Arquivo, sCaminho);
      Rewrite(Arquivo);
      While Not cds.Eof Do
      Begin
        OutLine := '';
        For i := 0 To cds.FieldCount - 1 Do
        Begin
          sTemp := cds.Fields[i].AsString;
          OutLine := OutLine + sTemp + ';';
        End;
        Append(Arquivo);
        Write(Arquivo, OutLine);
        WriteLn(Arquivo);
        cds.Next;
      End;
    Except
      On e: Exception Do
        result := False;
    End;
  Finally
    FreeAndNil(cds);
    CloseFile(Arquivo);
  End;
End;

End.

