// Alterações
//***************************************************************************************
//N.Atender..........: WO13395
//Data da Alteração..: 02/10/2024
//Responsável........: Arnaldo V. Scarin
//Descrição..........: Ajustes diversos para inclusão das Linhas de Registros RTDS e ESDS
//***************************************************************************************
//Rotina.............: GetVersaoLeiaute, GRegDadosPrincipais
//N. SIG.............: 134189
//Data da Alteração..: 03/01/2023
//Responsável........: Edilaine
//Descrição..........: Ações de equacionamento Transitado em Julgado- Implementação DIRF
//*****************************************************************************************************
//Rotina.............:
//N. SIG.............: 97214
//Data da Alteração..: 06/02/2020
//Responsável........: Edilaine
//Descrição..........: correção arquivo DIRF gerando linha de identificação do beneficiário mesmo sem
//                     outras linhas abaixo
//*****************************************************************************************************
//Rotina.............: InfoPcPA
//N. SIG.............: 85183.92415
//Data da Alteração..: 23/10/2019
//Responsável........: Taffarel/Darivaldo
//Descrição..........: Ajuste para a geração do Informe de Rendimentos no layout 2019
//*****************************************************************************************************
//Rotina.............: Principal
//N. SIG.............: 82682
//Data da Alteração..: 14/03/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Correção na criação do arquivo da DIRF, permitindo a geração das
//                     linhas de processos mesmo não havendo valor de rendimento.
//***************************************************************************************
//Rotina.............: InfoPcPA, Principal
//N. SIG.............: 82239
//Data da Alteração..: 14/02/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Correção na montagem da linha INFPA, conforme leiaute da DIRF mais
//                     atual.
//***************************************************************************************
//Rotina.............: ListGeraDirfJudicial_Suspensa, Principal, ListGeraDirfFUNCEFEst
//N. SIG.............: 78096
//Data da Alteração..: 11/02/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Correção na verificação de incidência de processos de equacionamento
//                     quando não houve filtro por CPF's.                     
//***************************************************************************************
//Rotina.............: ListGeraDirfFUNCEF
//N. SIG.............: 81206
//Data da Alteração..: 02/02/2019
//Responsável........: Andre Imakawa
//Descrição..........: Alteração no select para considerar valores negativos no TipoReg = 2
//                     e agrupamento para problemas de valores repetidos com datapagamento diferente
//***************************************************************************************
//Rotina.............: dadosIN1343, Principal, ListGeraDirfFUNCEF
//N. SIG.............: 81238
//Data da Alteração..: 29/01/2019
//Responsável........: edilaine
//Descrição..........: adequação das rotinas para gerar linha de contribuição para codnatureza 5565
//***************************************************************************************
//Rotina.............: Principal
//N. SIG.............: 80938
//Data da Alteração..: 22/01/2019
//Responsável........: Darivaldo Alencar
//Descrição..........: rotina não deve imprimir no arquivo participantes que não possuem
//                       valores de rendimentos
//***************************************************************************************
//Rotina.............: ListGeraDirfJudicial_Suspensa
//N. SIG.............: 74355
//Data da Alteração..: 15/01/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Adequação a consulta de processos judiciais para carregar lançamentos
//                     realizados para ações judiciais de Equacionamento.
//***************************************************************************************
//Rotina.............: Principal
//N. SIG.............: 76691
//Data da Alteração..: 15/01/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Definição do Identificador de Estrutura do Leiaute para arquivo DIRF a
//                     partir de 2018.   
//***************************************************************************************
//Rotina             : Principal
//N. SIG..........   : 73497
//Data da Alteração: : 21/08/2018
//Alteração Form:    :
//Responsável:       : Denis Horongoso
//Descrição          : Ajuste na geração do campo RIO, pois estava gerando
//                     na DIRF para pessoas que não possuem esse registro
//*******************************************************************************
//Rotina             : Principal
//N. SIG..........   : 63948
//Data da Alteração: : 05/03/2018
//Alteração Form:    :
//Responsável:       : Luiz Carlos
//Descrição          : Ajuste para emitir peculio por morte
//*******************************************************************************
//Rotina             : ListGeraDirfFUNCEFEst
//N. SIG..........   : 64008
//Data da Alteração: : 08/03/2018
//Alteração Form:    :
//Responsável:       : Taffarel
//Descrição          : Alterar query de geração da DIRF.
//*******************************************************************************
//Rotina             : Principal
//N. SIG..........   : 63867
//Data da Alteração: : 26/02/2018
//Alteração Form:    :
//Responsável:       : Andre Imakawa
//Descrição          : Entrar na rotina GRegIR1343 tambem quando for Natureza
//                     3556.
//*******************************************************************************
//Rotina             : InfoPcPA
//N. SIG..........   : 63547
//Data da Alteração: : 19/02/2018
//Alteração Form:    :
//Responsável:       : Andre Imakawa
//Descrição          : Remover o SIG 62962 - Caso necessario verificar o ShowLog
  //                   no GIT.
//*******************************************************************************
//Rotina             : GRegDadosPrincipais, GRegBeneficiario, PossuiValorCds e
//                     IncluiDadosRRA
//N. SIG..........   : 61321
//Data da Alteração: : 31/01/2018
//Alteração Form:    :
//Responsável:       : Andre Imakawa
//Descrição          : Melhoria DIRF 2018/2017
//*******************************************************************************
//Rotina             : GRegBeneficiario e Principal
//N. SIG..........   : 62774
//Data da Alteração: : 08/02/2018
//Alteração Form:    :
//Responsável:       : Andre Imakawa
//Descrição          : Criado variavel bLancaLinhaRIO para verificar se houve
//                     lancamento na rotina GRegBeneficiario.
//*******************************************************************************
//Rotina             : InfoPcPA
//N. SIG..........   : 62962
//Data da Alteração: : 09/02/2018
//Alteração Form:    :
//Responsável:       : Andre Imakawa
//Descrição          : Correção do reembolso de PA, criado Consulta d e
//                     corrigidos alguns trechos das outras.
//*******************************************************************************
//Rotina             : Principal
//N. SIG..........   : 63027
//Data da Alteração: : 09/02/2018
//Alteração Form:    :
//Responsável:       : Andre Imakawa
//Descrição          : Verificar o Decimo Terceiro nas variaveis dRendimentoBruto
//                     e dImpostoRetido quando TIPOREG = 0.
//*******************************************************************************
//Rotina             : GReg_RRA_QtdMeses
//N. SIG..........   : 60776
//Data da Alteração: : 27/12/2017
//Alteração Form:    :
//Responsável:       : Andre Imakawa
//Descrição          : Verifica se existe valor, antes de lançar o mes de RRA.
//*******************************************************************************
//Rotina             : possui_IN1343
//N. SIG..........   : 57460
//Data da Alteração: : 07/11/2017
//Alteração Form:    : Alteração da function possui_IN1343
//Responsável:       : Edilaine
//Descrição          : Geração da DIRF, estava gerando linha zerada na nat 3533
//*******************************************************************************
//Rotina             : GRegDadosPrincipais
//N. SIG             : 52685
//Data da Alteração: : 23/08/2017
//Responsável:       : Andre Imakawa
//Descrição          : Preencher DDD e Telefone com os dados da FUNCEF
{*******************************************************************************
//Rotina             : InfoPcPA
//N. SIG             : 40287
//Data da Alteração: : 17/02/2017
//Responsável:       : Andre Imakawa
//Descrição          : Correção na query da rotina InfoPcPA
{*******************************************************************************
//Rotina             : ListGeraDirfFUNCEF
//N. SIG             : 41009
//Data da Alteração: : 09/03/2017
//Alteração Form:    : Zerando variavel
//Responsável:       : William Moreira da Silva
//Descrição          : Problema na geração do arquivo da DIRF, gerando arquivo para pessoas com rendimentos zerados
{*******************************************************************************
//Rotina             : InfoPcPA
//N. SIG             : 41234
//Data da Alteração: : 02/03/2017
//Alteração Form:    : Alteração da query
//Responsável:       : Edilaine
//Descrição          : problema na geração do arquivo da DIRF para valores de PA
//                     quando o alimentado não possui CPF
{*******************************************************************************
//Rotina             : InfoPcPA
//N. SIG             : 40992
//Data da Alteração: : 02/03/2017
//Alteração Form:    : Alteração da query
//Responsável:       : Edilaine
//Descrição          : problema na geração do arquivo da DIRF para valores de PA
{*******************************************************************************
//Rotina             : ListGeraDirfJudicial_Suspensa
//N. SIG             : 40171
//Data da Alteração: : 15/02/2017
//Alteração Form:    : Alteração da query
//Responsável:       : William Santana
//Descrição          : problema na geração do arquivo da DIRF para as pessoas
                       que possuem dois ids e tiveram compensação
{*******************************************************************************
//Rotina             : ListGeraDirfFUNCEF
//N. SOL..........   : 40102
//Data da Alteração: : 14/02/2017
//Alteração Form:    :
//Responsável:       : Andre Imakawa
//Descrição          : Modificado Decode para passar a processar registros com
//                     codnatureza 5565 como 3540 quando tiporeg = 2                     
{*******************************************************************************
//Rotina             : Principal
//N. SIG..........   : 34429
//Data da Alteração: : 04/01/2016
//Alteração Form:    :
//Responsável:       : Darivaldo Alencar
//Descrição          : Solicito alteração do leiaute da DIRF 2017, conforme Ato
//                     Declaratório Executivo Cofis nº 90/2016, incluindo
//                     INFOPC, INFOPA
{*******************************************************************************
//Rotina             :
//N. SOL..........   : 28411
//Data da Alteração: : 09/12/2016
//Alteração Form:    :
//Responsável:       : Darivaldo Alencar
//Descrição          : Solicitamos incluir na geração do arquivo da DIRF, os
                       beneficiários residentes no exterior (códigos 0473 e 9466)
                       onde deverá seguir o layout do Ato Declaratório
                       Executivo COFIS n.º 81
{*******************************************************************************
//Rotina             : Principal
//N. SIG..........   : 28407
//Data da Alteração: : 20/12/2016
//Alteração Form:    :
//Responsável:       : Darivaldo Alencar
//Descrição          : Solicitamos criação de linha para envio de informações para
                       DIRF, referente à Rendimentos Isentos Ação Judicial/ Pecúlio.
{*******************************************************************************					   
//Rotina             : possui_IN1343
//N. SOL..........   : 36758
//Data da Alteração: : 03/01/2017
//Alteração Form:    : Alteração da function possui_IN1343
//Responsável:       : William Moreira da Silva
//Descrição          : Geração da DIRF, estava gerando mesmo com o valor minimo menor que o informado pelo usuario					   
{*******************************************************************************
//Rotina             : GReg_RRA_QtdMeses
//N. SOL..........   : 271393
//N. PPM..........   : 1371672
//Data da Alteração: : 11/04/2016
//Alteração Form:    : adição dos campos de RRA
//Responsável:       : William Santana
//Descrição          : Geração da DIRF Solicitamos verificar porque quem possui
                       moléstia grave e RRA não está gravando na DIRF a quantidade de meses
{*******************************************************************************
Analista.: Darivaldo Alencar
Pendencia: SOL 269619 ppm 1314059
Data.....: 04/03/2016
Descrição: Corrigido regra na IN1343
{*******************************************************************************
//Rotina             : GRegDadosPrincipais
//N. SOL..........   : 269300
//N. PPM..........   : 1293033
//Data da Alteração: : 15/02/2016
//Alteração Form:    :
//Responsável:       : Paulo Nobre
//Descrição          : Alteração do leiaute do arquivo DIRF. do ano de 2016
{*******************************************************************************
//Rotina             : IncluiDadosRRA
//N. SOL..........   : 269130
//N. PPM..........   : 1284502
//Data da Alteração: : 04/02/2016
//Alteração Form:    :
//Responsável:       : Paulo Nobre
//Descrição          : Alteração para permitir que o somatório de comparação
//                     seja > 0 entre os meses
{*******************************************************************************
Analista.: Fernando Xavier - SOL 267779 PPM 1243444
Data.....: 20/01/2016
Sol......: 267779
PPM......: 1243444
Descrição: Alteração do leiaute do arquivo DIRF. do ano de 2016
*******************************************************************************
Analista.: Wylliam Leite da Silva - SOL:248806 PPM:1020290
Data.....: 13/08/2015
Sol......: 248806
PPM......: 1020290
Descrição: Arredondamento com precisão de 2 casas decimais para resolver o
problema dos 12 centavos do arquivo txt da Dirf
*******************************************************************************
Analista.: Marcio Sanches - SOL 248634 PPM 735735
Data.....: 02/04/2015
Sol......: 248634
PPM......: 735735
Descrição: Duplicação na geração do Arquivo TXT dos comprovantes.
*******************************************************************************
Analista.: Edilaine Ferraresi
Data.....: 20/02/2014
Sol......: 248651
PPM......: 672554
Descrição: Ajuste para duplicação da linha de dependentes
-------------------------------------------------------------------------------
Analista.: Paulo Nobre
Data.....: 19/02/2015
Sol......: 248824/16980
PPM......: 680604 
Descrição: Implementar nova linha de informe (44) para o 13º do IN 1343
-------------------------------------------------------------------------------
Analista.: Marcio Sanches Spinosa SOL 245373 PPM 620985
Data.....: 26/12/2014
Sol......: 245373
PPM......: 620985
Descrição: Ajuste para validação do Dependente sem rendimento mas tributado.
-------------------------------------------------------------------------------
Analista.: Paulo Nobre e Felipe A. Santos
Data.....: 09/01/2015
Sol......: 243508/16869
PPM......: 630406
Descrição: Geração do arquivo de envio da DIRF 2014
-------------------------------------------------------------------------------
Analista.: Marcio Sanches Spinosa SOL 239224 e 239239 PPM 515112 e 515109
Data.....: 29/08/2014
Sol......: 239224 e 239239
PPM......: 515112 e 515109
Descrição: Ajuste na criação do arquivo selecionado pelo cliente.
-------------------------------------------------------------------------------
Analista.: Marcio Sanches Spinosa SOL 238101, 235991 e 236972 PPM 497515, 497580 e 499001
Data.....: 29/08/2014
Sol......: 238101, 235991 e 236972
PPM......: 497515, 497580 e 499001
Descrição: Ajuste na criação do arquivo selecionado pelo cliente.
-------------------------------------------------------------------------------
Analista.: Marcio Sanches Spinosa SOL 236783 KINTANA 497770
Data.....: 28/08/2014
Sol......: 236783
PPM......: 497770
Descrição: Ajuste para não ser impresso o 0561
-------------------------------------------------------------------------------
Analista.: Marcio Sanches Spinosa SOL 236012, 236013 PPM 499021, 499859
Data.....: 27/08/2014
Sol......: 236012, 236013
PPM......: 499021, 499859
Descrição: Ajuste no RRA
-------------------------------------------------------------------------------
Analista.: Fernando Xavier/Edilaine Ferraresi/Marcio Spinosa SOL 226715 KINTANA 2061081
Data.....: 21/02/2014
Sol......: 226715
Kintana..: 2061081
Descrição: Ajustado solicitados em plantao
-------------------------------------------------------------------------------
Analista.: Marcio Sanches Spinosa SOL 226003 KINTANA 2060052
Data.....: 28/01/2014
Sol......: 226003
Kintana..: 2060052
Rotina...: Ajuste no sql e no ajusta13salario
Descrição: Ajustado o sql para enviar para a dirf o 13 salario
-------------------------------------------------------------------------------
Analista.: Marcio Sanches Spinosa SOL 223465 KINTANA 2058652
Data.....: 28/01/2014
Sol......: 223465
Kintana..: 2058652
Rotina...: BuscaInformeGeral
Descrição: Adicionado os seguintes códigos naturezas (3556, 3579 )amarrados aos
(3223, 5565) respectivamentes e ajuste no layout
-------------------------------------------------------------------------------
Analista.: Felipe A. Santos
SOL......: 223584
Kintana..: 2057497
Data.....: 16/01/2014
Rotina...: Principal, ListGeraDirfJudicial_Suspensa
Descrição: foi ajustado a natureza de rendimento de 0561 para 3540 depois do mês
           de janeiro/2013, os itens de ação judicial
{********************************************************************************
Analista.: Marcio Sanches Spinosa SOL 219636/15413 KINTANA 2053647
SOL......: 219636/15413
Kintana..: 2053647
Data.....: 21/11/2013
Rotina...: ListGeraDirfFUNCEF
Descrição: Desfazer ajuste no 3533 e 3540 e mudar codigo cabeçalho
{********************************************************************************
Analista.: Thiago Melo
SOL......: 217776
Kintana..: 2047946
Data.....: 07/10/2013
Rotina...: ListGeraDirfCAP
Descrição: Ajuste select ListGeraDirfCAP
********************************************************************************
Analista.: Marcio Sanches Spinosa SOL 216222 KINTANA 2045931
SOL......: 216222
Kintana..: 2045931
Data.....: 16/09/2013
Rotina...: ListGeraDirfCAP
Descrição: Criação da nova funcionalidade para criar o arquivo de contas a Pagar
{********************************************************************************
Analista.: Edilaine Ferraresi
SOL......: 211939
Kintana..: 2044010
Data.....: 27/08/2013
Rotina...: ListGeraDirfFUNCEF
Descrição: tratar natureza 3533 e 3540
{********************************************************************************
Analista.: Otacilio aquino
SOL......: 206552
Kintana..: 2000044
Data.....: 10/05/2013
Rotina...: IncluiDadosRRA
Descrição: Ajuste na geração da DIRF referente a registros do RRA incluir todos
           os codigo natureza e seus respectivos arquivos.
{********************************************************************************
Analista.: Edilaine Ferraresi
SOL......: 200079
Kintana..: 1927638
Data.....: 01/02/2013
Rotina...: GravaLinhasDependentes, GravaLinhasDependentesOdonto
Descrição: não incluir como dependente de plano de saúde e odontológico quando o
           for o próprio titular
{********************************************************************************
Analista.: William Moreira da Silva
SOL......: 199072
Kintana..: 1915767
Data.....: 23/01/2013
Rotina...: Principal
Descrição: Alteração do leiaute do arquivo DIRF. do ano de 2013
{********************************************************************************
Analista.: Edilaine Ferraresi
SOL......: 198116
Kintana..: 1914302
Data.....: 17/01/2013
Rotina...: Principal
Descrição: validar todos os CODNATUREZA trazidos para gerar a DIRF
{********************************************************************************
Analista.: Edilaine Ferraresi
SOL......: 197745
Kintana..: 1895223
Data.....: 28/12/2012
Rotina...: Principal
Descrição: descontar valor de RRA da somatorio FUNCEF/INSS apenas quando ano for 2011
{********************************************************************************
Analista.: Edilaine Ferraresi
SOL......: 197682
Kintana..: 1894005
Data.....: 27/12/2012
Rotina...: ListGeraDirfFUNCEF
Descrição: Acrescentar natureza 7431 no decode que traz dados para DIRF
********************************************************************************
Analista.: Vinicius Eduardo Nascimento Maciel
SOL......: 173822
Kintana..: 1568567
Data.....: 08/02/2012
Rotina...: GReg_RRA_RendimentoTributavel, GReg_RRA_Molestia, GReg_RRA_IRRF,
           GReg_RRA_PensaoAlimenticia e GravaLinhaValores
Descrição: Retirada a impresão do 13º das linhas de RRA.
********************************************************************************
Analista.: Vinicius Eduardo Nascimento Maciel
SOL......: 170987
Kintana..: 1528710
Data.....: 20/01/2012
Rotina...: GeraDirf, Principal, GravaLinhaPlanoOdontologico,
           ListGeraDirfJudicial_Suspensa
Descrição: Foi acrescentado o Plano Odontológico para o novo layout de 2011,
           foram adicionados quatros novos CODDIRF por isso a geração foi
           adapatada para incluir estes  códigos.
           Foi adicionada a impressão dos itens de RRA para a folha de
           beneficios e a debitação desses itens.
********************************************************************************
Analista.: Vinicius Eduardo Nascimento Maciel
SOL......: 168331
Kintana..: 1482898
Data.....: 05/01/2012
Rotina...: ListGeraDirfFUNCEF
Descrição: Foi adicionado o filtro por ano Vigência na query para que as
           alterações na tabela informe tenham sentido.
********************************************************************************
N. Sol............: 159558
N. Kintana........: 1395659
Data..............: 19/08/2011
Responsável.......: Vinicius Eduardo Nascimento Maciel
Descrição.........: Foi alterado a geração do arquivo .txt para que quando este
                    seja gerado a data de molestia grave seja gerada em branco.
********************************************************************************
N. Sol............: 144716
N. Kintana........: 960138
Data..............: 10/01/2011
Responsável.......: Arnaldo V. Scarin
Descrição.........: Criação do Layout Novo da Dirf, Exercicio 2011, Ano Base 2010
********************************************************************************}
Unit uCtrlGeraDirf2011;

Interface

Uses Windows, sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
  classes, Forms, dbtables, mconnect, ucmFileUtils, uCmCustomCdbObject, ADODb,
  provider, {$IFDEF VERSAO0505}uComum{$ELSE}uCMTypes{$ENDIF},
  uCripto, wwQuery, FProgresso, uFuncoesUteisIR; // Andre Imakawa - SIG 60776

Type
  TCtrlGeraDirfNova = Class(TCmControlObject)

  Private
    bInfPC, bInfPA: Boolean;//Darivaldo Alencar SIG 34429
    sDataIni,sDataFim: String;//Darivaldo Alencar SIG 34429
    cdsInfoPcPA: TClientDataSet;//Darivaldo Alencar SIG 34429
    FMaxProgresso: Integer;
    FProgresso: Integer;
    Cds: TclientDataSet;
    CdsEst: TClientDataSet;//Darivaldo Alencar SIG 28411
	CdsRIO: TclientDataSet;//Darivaldo Alencar SIG 28407
    cds21Normal: TclientDataSet;
    cdsDif21Normal: TclientDataSet;
    cds21Judicial: TclientDataSet;
    cdsDif21Judicial: TclientDataSet;
    CdsJudicial: TclientDataSet;
    CdsResponsavel: TclientDataSet;
    CdsEmpresa: TclientDataSet;
    CdsResponsavelPlano: TClientDataSet;
    //Vinicius Maciel SOL 170987 KTN 1528710
    CdsResponsavelOdonto: TClientDataSet;
    CdsRra: TClientDataSet;

    sLinhaRTPA: string; // Andre Imakawa - SIG 61321                    //edilaine SIG97214
    lstInsNatureza : TStringList;                                       //edilaine SIG97214

    // Paulo SOL243508/16869 PPM 630406
    CdsIN1343: TClientDataSet;

    CdsPlanoOdonto: TClientDataSet;
    CdsDependentePlanoOdonto: TClientDataSet;
    //Vinicius Maciel SOL 170987 KTN 1528710 - FIM
    CdsPlanoSaude: TClientDataSet;
    CdsDependentePlanoSaude: TClientDataSet;
    Function LocalizaNome(Const pCPF: String): String;
    Procedure AtualizaFrmProgresso(Var iContador: integer);
    Function BuscaNome(Const pCPFBenef: String): String;
    //Vinicius Maciel SOL 170987 KTN 1528710
    Function ajustaCaracteresNome(sNome: String): String;
    Function ajustaValor(fValor: double): double;
    //Vinicius Maciel SOL 170987 KTN 1528710 - FIM
    Function ExisteNaLista(Const pLista: TStringList;
      Const pCPF: String): Integer;
    Function ListDadosDependentesPlanoSaude(Const IdPessoa,
      iSistema: Integer;
      Const sAno,
      edPessoanotin: String;
      iFlgPlano: integer; //Vinicius Maciel SOL 170987 KTN 1528710
      sCPFFiltro: String): OleVariant;
    Procedure GravaLinhasDependentes(Const pArquivo: TextFile;
      Const pLista: TStringList;
      Const pNumDocumento: String);
    //Vinicius Maciel SOL 170987 KTN 1528710
    Procedure GravaLinhasDependentesOdonto(Const pArquivo: TextFile;
      Const pLista: TStringList;
      Const pNumDocumento: String);
    //Vinicius Maciel SOL 170987 KTN 1528710 - FIM

    Function AjustaNome(Const pNome: String;
      Const pTamanho: Integer): String;
    Function dadosRRA(IdPessoa,
      iSistema: Integer;
      DataIni,
      DataFim,
      NumDocumento: String;
      rValorMinimo,
      rValorIndenizacao: Real;
      sCPFFiltro: String): Olevariant; //Vinicius Maciel SOL 170987 KTN 1528710

    // Paulo SOL243508/16869 PPM 630406
    Function dadosIN1343(IdPessoa,
      iSistema: Integer;
      DataIni,
      DataFim,
      NumDocumento: String;
      sCPF: String;
      const sCodNatureza : string = ''      //edilaine - SIG81238
      ): Olevariant;

    Procedure CompensaValoresDasLinhas(Const pArquivo: TextFile;
      Const pIdentificador, pColuna, pCodNatureza: String;
      Const oCds: TClientDataSet);

    function PossuiValorCds(Const oCds: TClientDataSet; Const pColuna, pTipoReg, pNatureza: String; pUsaLocate: Boolean): Boolean; // Andre Imakawa - SIG 61321
    Procedure PossuiValorRTPA(Const oCds: TClientDataSet; Const pColuna, pCodNatureza: String; var sLinhaRTPA: string; pUsaLocate: Boolean); // Andre Imakawa - SIG 61321

  Protected
    Procedure DoChangeDataBase; Override;
    Function ListValoresModuloDif21Normal(Const iIDBenefIrrf: Extended; sCodNatureza, DataIni, DataFim: String): OleVariant;
    Function ListValoresModulo21Normal(Const iIDBenefIrrf: Extended; sCodNatureza, DataIni, DataFim: String): OleVariant;
    Function ListValoresModuloDif21Judicial(Const iIDBenefIrrf: Extended; sCodNatureza, DataIni, DataFim: String): OleVariant;
    Function ListValoresModulo21Judicial(Const iIDBenefIrrf: Extended; sCodNatureza, DataIni, DataFim: String): OleVariant;
    Function DataUltimoBeneficioRecebido5565(Const pCpf: String): String;
    Function DataMolestiaGrave(Const pCpf, pAno: String): String;
    Procedure GRegDadosPrincipais(Const pArquivo: TextFile;
      Const pAno,
      pAnoRef,
      pSEI,
      pNumeroRecibo: String;
      Const pNaturDeclar: Integer;
      meuCDS: Integer = 1 {1 = Cds, 2=CdsEst - Darivaldo Alencar SIG 28411}
      );
    Procedure GRegNatureza(Var pGeraNovaNatureza: Boolean;
      Const pArquivo: TextFile;
      Const sNatureza: String);   overload;  // Edilaine - SOL 198116 / KTN 1914302                   //edilaine 97214
    Function GRegBeneficiario(Const pCPFBeneficiario,
      pAno: String;
      Var pGravaDadosBeneficiario: Boolean;
      Const pArquivo: TextFile;
      Const sCodNatureza: String): String;  overload; // Andre Imakawa - SIG 61321

    procedure GRegBeneficiario(sLinha : string;
      Const pCPFBeneficiario,
      pAno: String;
      Var pGravaDadosBeneficiario: Boolean;
      Const pArquivo: TextFile;
      Const sCodNatureza: String);  overload;  //edilaine SIG97214

    Procedure GRegCompensacaoImpostoAnoAtual(Const pArquivo: TextFile;
      Const pCodNatureza: String;
      Const sCGCBenef,
      sAno: String;
      Var bGravaDadosBeneficiario: Boolean);
    Procedure GRegCompensacaoImpostoAnoAnterior(Const pArquivo: TextFile;
      Const pCodNatureza: String;
      Const sCGCBenef,
      sAno: String;
      Var bGravaDadosBeneficiario: Boolean);
    Procedure GRegExigibilidadeSuspensa(Const pArquivo: TextFile;
      Const pCodNatureza: String;
      Const sCGCBenef,
      sAno: String;
      Var bGravaDadosBeneficiario: Boolean);
    Procedure GRegDeducoesPrevidenciaOficial(Const pArquivo: TextFile;
      Const pCodNatureza: String;
      Const sCGCBenef,
      sAno: String;
      Var bGravaDadosBeneficiario: Boolean);
    Procedure GRegDeducoesPrevidenciaPrivada(Const pArquivo: TextFile;
      Const pCodNatureza: String;
      Const sCGCBenef,
      sAno: String;
      Var bGravaDadosBeneficiario: Boolean);
    Procedure GRegDeducoesDependentes(Const pArquivo: TextFile;
      Const pCodNatureza: String;
      Const sCGCBenef,
      sAno: String;
      Var bGravaDadosBeneficiario: Boolean);
    Procedure GRegDeducoesPensaoAlimenticia(Const pArquivo: TextFile;
      Const pCodNatureza: String;
      Const sCGCBenef,
      sAno: String;
      Var bGravaDadosBeneficiario: Boolean);
    Procedure GRegDepositoJudicial(Const pArquivo: TextFile;
      Const pCodNatureza: String;
      Const sCGCBenef,
      sAno: String;
      Var bGravaDadosBeneficiario: Boolean);
    Procedure GRegDeducoesImpostoRenda(Const pArquivo: TextFile;
      Const pCodNatureza: String;
      Const sCGCBenef,
      sAno: String;
      Var bGravaDadosBeneficiario: Boolean);
    Procedure GReg65Anos(Const pArquivo: TextFile;
      Const pCodNatureza: String;
      Const sCGCBenef,
      sAno: String;
      Var bGravaDadosBeneficiario: Boolean);
    Procedure GRegMolestiaGrave(Const pArquivo: TextFile;
      Const pCodNatureza: String;
      Const sCGCBenef,
      sAno: String;
      Var bGravaDadosBeneficiario: Boolean);
    Procedure GRegAjudaCusto(Const pArquivo: TextFile;
      Const pCodNatureza: String;
      Const pValorIndenizacao: Real;
      Const sCGCBenef,
      sAno: String;
      Var bGravaDadosBeneficiario: Boolean);
    Procedure GRegIndenizacao(Const pArquivo: TextFile;
      Const pCodNatureza: String;
      Const pValorIndenizacao: Real;
      Const sCGCBenef,
      sAno: String;
      Var bGravaDadosBeneficiario: Boolean);
    Procedure GRegAbono(Const pArquivo: TextFile;
      Const pCodNatureza: String;
      Const sCGCBenef,
      sAno: String;
      Var bGravaDadosBeneficiario: Boolean);

    // Paulo SOL243508/16869 PPM 630406 - início
    Procedure GRegIR1343(Const pArquivo: TextFile;
      Const pCodNatureza: String;
      Const sCGCBenef,
      sAno: String;
      Var bGravaDadosBeneficiario: Boolean);
    //Paulo SOL243508/16869 PPM 630406 - fim

    function GetVersaoLeiaute(pAno : string) : string;   //edilaine SIG134189

    function GravaLinhaValores(Const pArquivo: TextFile;
      Const pIdentificador,
      pColuna,
      pCodNatureza: String;
      Const oCds: TClientDataSet;
      //Vinicius Maciel SOL 170987 KTN 1528710
      Const bValidaSeVazio: Boolean = False //);
      ; bRRA: boolean = false //);//FLAG PARA DEBITAÇÃO DO RRA OU NÃO
      //Vinicius Maciel SOL 170987 KTN 1528710 - FIM
      ; bGrava13: boolean = true //Vinicius Maciel SOL 173822 KTN 1568567
      ; pLinha: string = ''     // Andre Imakawa - SIG 61321
      ; bGravaLinha : boolean = true) : string;     //edilaine SIG97214

    Procedure GravaeCompensaLinhaValores(Const pArquivo: TextFile;
      Const pIdentificador,
      pColuna,
      pCodNatureza: String;
      Const oCds: TClientDataSet;
      Const bValidaSeVazio: Boolean = False);
    Procedure AjustaNaturezas(Const pCodNatureza: String);
    Function Ajusta13oSalario(Const sCodNatureza: String;
      Const fValor: Double): String;
    Procedure IncluiDadosPlanoSaude(Const pArquivo: TextFile; Const pLista: tStringList);
    Procedure GravaLinhaPessoa(Const pArquivo: TextFile; Const pLista: TStringList);
    Procedure GravaLinhaPlanoSaude(Const pArquivo: TextFile);
    //Vinicius Maciel SOL 170987 KTN 1528710
    Procedure GReg_RRA_RendimentoTributavel(Const pArquivo: TextFile; CdsRra: TClientDataSet);
    Procedure GReg_RRA_QtdMeses(Const pArquivo: TextFile; CdsRra: TClientDataSet);
    Procedure GReg_RRA_PensaoAlimenticia(Const pArquivo: TextFile; CdsRra: TClientDataSet; pLinha: String = ''); // Andre Imakawa - SIG 61321
    Procedure GReg_RRA_IRRF(Const pArquivo: TextFile; CdsRra: TClientDataSet);
    Procedure GReg_RRA_Molestia(Const pArquivo: TextFile; CdsRra: TClientDataSet);
    Procedure IncluiDadosRRA(Const pArquivo: TextFile; Const pLista: tStringList; Const pAno: String); // Andre Imakawa - SIG 61321
    Procedure GravaLinhaPlanoOdontologico(Const pArquivo: TextFile);
    Procedure GravaLinhaPessoaOdonto(Const pArquivo: TextFile; Const pLista: TStringList);
    //Vinicius Maciel SOL 170987 KTN 1528710 - FIM
    Procedure SomaValores65Anos(Const pCodNatureza, pCPF: String);
    Function InfoPcPA(sCpf,sIdentificador,sNatureza: String) : String;//Darivaldo Alencar SIG 34429

    //edilaine SIG97214 : inicio
    procedure GeraRTPA(pAno, sCodNatureza : String; var sLinha : string);
    Function  ValidaListaNatureza(sCodNatureza : string) : boolean;
    Procedure GRegNatureza(const pArquivo: TextFile; sNatureza: String);   overload;
    //edilaine SIG97214 : fim

  Public
    btIN1343: boolean;
    pAno: string;
    function possui_IN1343(pCpf,
                           pNatureza :string;    //edilaine - SIG57460
                           rValorMinimo:Real):boolean;//Darivaldo Alencar SOL 269619 ppm 1314059
    Property Progresso: Integer Read FProgresso;
    Property MaxProgresso: Integer Read FMaxProgresso;

    Constructor Create; Override;

    Destructor Destroy; Override;

    //Lista Valores principais da Dirf
    Function ListGeraDirf(IdPessoa,
      iSistema: Integer;
      DataIni,
      DataFim,
      NumDocumento: String;
      bRetencao: Boolean;
      rValorMinimo: Real;
      chkParticipMantido: Boolean;
      edPessoanotin: String;
      sCPFFiltro: String): OleVariant;
    //Lista valores de decisão judicial e exigibilidade suspensa da dirf

    //Marcio Sanches Spinosa SOL 216222 KINTANA 2045931 - Inicio
    //Lista Valores principais da Dirf
    Function ListGeraDirfCAP(IdPessoa,
      iSistema: Integer;
      DataIni,
      DataFim,
      NumDocumento: String;
      bRetencao: Boolean;
      rValorMinimo: Real;
      chkParticipMantido: Boolean;
      edPessoanotin: String;
      sCPFFiltro: String): OleVariant;
    //Lista valores de decisão judicial e exigibilidade suspensa da dirf
    //Marcio Sanches Spinosa SOL 216222 KINTANA 2045931 - Fim

    Function ListGeraDirfFUNCEF(IdPessoa,
      iSistema: Integer;
      DataIni,
      DataFim,
      NumDocumento: String;
      bRetencao: Boolean;
      rValorMinimo: Real;
      chkParticipMantido: Boolean;
      edPessoanotin: String;
      sCPFFiltro: String): OleVariant;

    function ListGeraDirfFUNCEFEst(DataIni, DataFim, sCPFFiltro: String): OleVariant; //Darivaldo Alencar SIG 28411

    Function ListGeraDirfJudicial_Suspensa(IdPessoa,
      iSistema: Integer;
      DataIni,
      DataFim,
      NumDocumento: String;
      rValorMinimo,
      rValorIndenizacao: Real;
      sCPFFiltro: String): OleVariant;

    Function ListResponsavel(IdPessoa: LongInt): OleVariant;
    Function ListResponsavelPlano(IdPessoa: LongInt): OleVariant;
    Function ListEmpresa(IdPessoa: LongInt): OleVariant;
    Function ListDadosPlanoSaude(IdPessoa,
      iSistema: Integer;
      DataIni,
      DataFim: String;
      edPessoanotin: String;
      iFlgPlano: integer; //Vinicius Maciel SOL 170987 KTN 1528710
      sCPFFiltro: String): OleVariant;

    Function GeraDirf(IdPessoa,
      IdResponsavel,
      TipoArquivo,
      iSistema,
      NaturDeclar: Integer;
      DataIni,
      DataFim,
      TextImport,
      sNomeArquivo,
      sCamImporta,
      sAno,
      sAnoref: String;
      bRetencao,
      bImporta,
      PesExi: Boolean;
      rValorMinimo: Real;
      chkParticipMantido: Boolean;
      edPessoanotin: String;
      sNumeroRecibo: String;
      rValorIndenizacao: Real;
      idPlanoSaude: Integer;
      idPlanoOdonto: Integer; //Vinicius Maciel SOL 170987 KTN 1528710
      sCPFFiltro: String): Boolean;

    Procedure Principal(IdResponsavel,
      TipoArquivo,
      NaturDeclar: LongInt;
      Retencao,
      PesExi: Boolean;
      rValorMinimo: Real;
      sNomeArquivo,
      sAno,
      sAnoref: String;
      IdPessoa,
      iSistema: Longint;
      DataIni,
      DataFim,
      Numdocumento,
      sNumeroRecibo: String;
      rValorIndenizacao: Real;
      idPlanoSaude: Integer;
      idPlanoOdonto: Integer; //Vinicius Maciel SOL 170987 KTN 1528710
      sCPFFiltro: String);

    procedure PrincipalEst(sNumeroRecibo, sAno, sAnoref,sNomeArquivo: string;   IdResponsavel,TipoArquivo,NaturDeclar: Integer);//Darivaldo Alencar SIG 28411

    Procedure Importa(arquivo: String);
    Procedure GravaTexto(sNomeArquivo: String);
    Procedure ListToText(lista: tstringlist; sNomeArquivo: String);

    Procedure Junta;
    Procedure Rodape(contador_: integer);
    Function Completa(sNome: String; iTam: integer): String;
    Function CompletaZero(sNome: String; iTam: integer): String;

    Function CompletaZeroDireita(sNome: String; iTam: integer): String; // Andre Imakawa - SIG 52685


    Function GetDataPacketTeste(Sql: TstringList): OleVariant;

    Function SubstCarEspeciais(Const pString: String): String; //Marilza Colpani-SOL 125645/KTN 649749

    Function CaracteresEspeciais(Const sTexto: String;
      Const bDesconsideraEmail: Boolean = false): String; //Marilza Colpani-SOL 125645/KTN 649749
    function VerificaAcaoJudEqua(pNumDocumento, pDataIni, pDataFim: string): Boolean;  //Cássio Rovaroto - SIG nº 74355
  End;



Implementation

Var
  sMens: String;
  listaDirf: tstringlist;
  listaImport: tstringlist;
  listatemp: tstringlist;
  bTxtImportado: boolean;
  sAno2011: String; //Vinicius Maciel SOL 170987 KTN 1528710
  iSistema2: integer; //Vinicius Maciel SOL 170987 KTN 1528710
  { TCtrlGeraDirf }

  bLancaLinhaRIO: Boolean = False; // Andre Imakawa - SIG 62774

// Darivaldo Alencar SOL 269619 ppm 1314059  - inicio
function TCtrlGeraDirfNova.possui_IN1343(pCpf,
                                         pNatureza :string;    //edilaine - SIG57460
                                         rValorMinimo:Real):boolean;
var
   qryIN1343: TwwQuery;
   ssql: string;
begin
 //William Moreira da Silva - SIG 36758
 //ssql:= ' SELECT  DISTINCT 1 FROM    LANCIRRF L, LANCXINFORME LL'+
 //       ' WHERE   L.IDLANCIRRF = LL.IDLANCIRRF AND     L.IDBENEFIRRF IN (SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO in('+trim(QuotedStr(pCpf))+'))'+
 //       ' AND     TO_CHAR(L.DATAPAGAMENTO,''YYYY'') = '+ trim(QuotedStr(pAno));

 ssql := ' SELECT NVL(SUM(ll.vlrlanc),0) SOMA                '+
         '  FROM LANCIRRF L, LANCXINFORME LL          '+
         ' WHERE L.IDLANCIRRF = LL.IDLANCIRRF         '+
         '  AND L.IDBENEFIRRF IN                      '+
         '      (SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO in('+trim(QuotedStr(pCpf))+'))'+
         '  AND TO_CHAR(L.DATAPAGAMENTO, ''YYYY'') = '+ trim(QuotedStr(pAno)) +
         '  AND L.CODNATUREZA = '+ pNatureza +    //edilaine - SIG57460
         '  AND LL.IDINFORME IN (SELECT IDINFORME FROM INFORME WHERE NOMEINFORME LIKE ''%IN 1343%'') ';
 //William Moreira da Silva - SIG 36758

 qryIN1343 := TwwQuery.Create(nil);
 qryIN1343.DatabaseName:= 'BaseDados';
 qryIN1343.close;
 qryIN1343.sql.clear;
 qryIN1343.sql.add(ssql);
 qryIN1343.open;

 //William Moreira da Silva - SIG 36758
 //if qryIN1343.fields[0].asinteger = 1 then
 if qryIN1343.fields[0].asinteger > rValorMinimo then
 //William Moreira da Silva - SIG 36758
    result:= true
 else
    result:= false;
 FreeAndNil(qryIN1343);
end;
//Darivaldo Alencar SOL 269619 ppm 1314059 --fim


Function TCtrlGeraDirfNova.Completa(sNome: String; iTam: integer): String;
Var
  i, k: integer;
  Espacos: String;
Begin
  sNome := trim(sNome);
  i := length(sNome);
  Espacos := '';
  For k := 1 To (iTam - i) Do
    Espacos := Espacos + ' ';

  Result := sNome + Espacos;
End;

Function TCtrlGeraDirfNova.CompletaZero(sNome: String; iTam: integer): String;
Var i, k: integer;
Begin
  sNome := trim(sNome);
  i := length(sNome);
  Result := '';
  For k := 1 To (iTam - i) Do
    Result := Result + '0';
  Result := Result + sNome;
End;

// Andre Imakawa - SIG 52685 - Inicio
Function TCtrlGeraDirfNova.CompletaZeroDireita(sNome: String; iTam: integer): String;
Var i, k: integer;
Begin
  sNome := trim(sNome);
  i := length(sNome);
  Result := '';
  For k := 1 To (iTam - i) Do
    Result := '0' + Result ;
  Result := sNome + Result;
End;
// Andre Imakawa - SIG 52685 - Fim

Constructor TCtrlGeraDirfNova.Create;
Begin
  Inherited;
  Cds := TClientDataSet.Create(Nil);
  CdsEst := TClientDataSet.Create(Nil);//Darivaldo Alencar SIG 28411
  CdsRIO := TClientDataSet.Create(Nil);//Darivaldo Alencar SIG 28407
  CdsResponsavel := TClientDataSet.Create(Nil);
  CdsEmpresa := TClientDataSet.Create(Nil);
  CdsJudicial := TClientDataSet.create(Nil);
  cds21Normal := TClientDataSet.create(Nil);
  cdsDif21Normal := TClientDataSet.create(Nil);
  cds21Judicial := TClientDataSet.create(Nil);
  cdsDif21Judicial := TClientDataSet.create(Nil);
  CdsResponsavelPlano := TClientDataSet.create(Nil);
  //Vinicius Maciel SOL 170987 KTN 1528710
  CdsResponsavelOdonto := TClientDataSet.create(Nil);
  CdsRra := TClientDataSet.create(Nil);

  // Paulo SOL243508/16869 PPM 630406
  CdsIN1343 := TClientDataSet.create(Nil);

  CdsPlanoOdonto := TClientDataSet.create(Nil);
  CdsDependentePlanoOdonto := TClientDataSet.create(Nil);
  //Vinicius Maciel SOL 170987 KTN 1528710 - RRA
  CdsPlanoSaude := TClientDataSet.create(Nil);
  CdsDependentePlanoSaude := TClientDataSet.create(Nil);
  cdsInfoPcPA := TClientDataSet.Create(nil);//Darivaldo Alencar SIG 34429
End;

Destructor TCtrlGeraDirfNova.Destroy;
Begin
  Inherited;
  FreeAndNil(cds);
  FreeAndNil(CdsEst);//Darivaldo Alencar SIG 28411
  FreeAndNil(CdsRIO);//Darivaldo Alencar SIG 28407
  FreeAndNil(cds21Normal);
  FreeAndNil(cdsDif21Normal);
  FreeAndNil(cds21Judicial);
  FreeAndNil(cdsDif21Judicial);
  FreeAndNil(CdsResponsavel);
  FreeAndNil(CdsEmpresa);
  FreeAndNil(CdsJudicial);
  FreeAndNil(CdsResponsavelPlano);
  //Vinicius Maciel SOL 170987 KTN 1528710
  FreeAndNil(CdsResponsavelOdonto);
  FreeAndNil(CdsRra);

  // Paulo SOL243508/16869 PPM 630406
  FreeAndNil(CdsIN1343);

  FreeAndNil(CdsPlanoOdonto);
  FreeAndNil(CdsDependentePlanoOdonto);
  //Vinicius Maciel SOL 170987 KTN 1528710 - FIM
  FreeAndNil(CdsPlanoSaude);
  FreeAndNil(CdsDependentePlanoSaude);
  FreeAndNil(listaDirf);
  FreeAndNil(listaImport);
  FreeAndNil(listatemp);
  FreeAndNil(CdsinfoPcPA); //Darivaldo Alencar SIG 34429
End;

Procedure TCtrlGeraDirfNova.DoChangeDataBase;
Begin
  Inherited;
End;

Function TCtrlGeraDirfNova.GeraDirf(IdPessoa,
  IdResponsavel,
  TipoArquivo,
  iSistema,
  NaturDeclar: Integer;
  DataIni,
  DataFim,
  TextImport,
  sNomeArquivo,
  sCamImporta,
  sAno,
  sAnoref: String;
  bRetencao,
  bImporta,
  PesExi: Boolean;
  rValorMinimo: Real;
  chkParticipMantido: Boolean;
  edPessoanotin: String;
  sNumeroRecibo: String;
  rValorIndenizacao: Real;
  idPlanoSaude: Integer;
  idPlanoOdonto: Integer; //Vinicius Maciel SOL 170987 KTN 1528710
  sCPFFiltro: String): Boolean;

Begin
  Result := True;
  Try

    CdsEmpresa.data := ListEmpresa(IdPessoa);

    cds21Normal.Data := GetDataPacket('SELECT NVL(FLGEXCEPCIONAL,0) AS FLGEXCEPCIONAL FROM PARAMEMPTMO');


    If cds21Normal.FieldByName('FLGEXCEPCIONAL').AsInteger = 1 Then
      Begin
        //Marcio Sanches Spinosa SOL 216222 KINTANA 2045931 - Inicio
        If (iSistema <> 2) Then
          Begin
            cds.data := ListGeraDirfFUNCEF(IdPessoa,
              iSistema,
              DataIni,
              DataFim,
              Copy(cdsEmpresa.FieldByName('NUMDOCUMENTO').AsString, 1, 8),
              bRetencao,
              rValorMinimo,
              chkParticipMantido,
              edPessoanotin,
              sCPFFiltro);

              CdsEst.data:= ListGeraDirfFUNCEFEst(DataIni, DataFim, sCPFFiltro);//Darivaldo Alencar SIG 28411 -inicio
          End
        Else
          Cds.Data := ListGeraDirfCAP(IdPessoa,
            iSistema,
            DataIni,
            DataFim,
            Copy(cdsEmpresa.FieldByName('NUMDOCUMENTO').AsString, 1, 8),
            bRetencao,
            rValorMinimo,
            chkParticipMantido,
            edPessoanotin,
            sCPFFiltro);
        //Marcio Sanches Spinosa SOL 216222 KINTANA 2045931 - Fim
      End
    Else
      //Marcio Sanches Spinosa SOL 216222 KINTANA 2045931 - Inicio
      If (iSistema <> 2) Then
        Begin
          cds.data := ListGeraDirf(IdPessoa,
            iSistema,
            DataIni,
            DataFim,
            Copy(cdsEmpresa.FieldByName('NUMDOCUMENTO').AsString, 1, 8),
            bRetencao,
            rValorMinimo,
            chkParticipMantido,
            edPessoanotin,
            sCPFFiltro);
        End
      Else
        Begin
          Cds.Data := ListGeraDirfCAP(IdPessoa,
            iSistema,
            DataIni,
            DataFim,
            Copy(cdsEmpresa.FieldByName('NUMDOCUMENTO').AsString, 1, 8),
            bRetencao,
            rValorMinimo,
            chkParticipMantido,
            edPessoanotin,
            sCPFFiltro);
          //Marcio Sanches Spinosa SOL 216222 KINTANA 2045931 - Fim
        End;
    sAno2011 := sAno; //Vinicius Maciel SOL 170987 KTN 1528710
    iSistema2 := iSistema;
    //Transforma em uma variavel publica para identifica o ano de geração da Dirf.

    if not(Cds.IsEmpty) then
    begin  //Darivaldo Alencar SIG 28411
        Principal(IdResponsavel,
                TipoArquivo,
                NaturDeclar,
                bRetencao,
                PesExi,
                rValorMinimo,
                sNomeArquivo,
                sAno,
                sAnoref,
                IdPessoa,
                iSistema,
                DataIni,
                DataFim,
                Copy(cdsEmpresa.FieldByName('NUMDOCUMENTO').AsString, 1, 8),
                sNumeroRecibo,
                rValorIndenizacao,
                idPlanoSaude,
                idPlanoOdonto, //Vinicius Maciel SOL 170987 KTN 1528710
                sCPFFiltro);

    If (bImporta) And (trim(TextImport) <> '') Then
      Begin
        listaDirf := TStringList.Create;
        listaDirf.LoadFromFile(sNomeArquivo);
        Importa(sCamImporta);
        Junta;
        GravaTexto(sNomeArquivo);
        FreeAndNil(listaDirf);
      End;
    //Darivaldo Alencar SIG 28411-inicio
    end;
    if not(CdsEst.IsEmpty) then
       PrincipalEst(sNumeroRecibo,
                    sAno,
                    sAnoref,
                    sNomeArquivo,
                    IdResponsavel,
                    TipoArquivo,
                    NaturDeclar);
    //Darivaldo Alencar SIG 28411-fim

    //Andre Imakawa - SIG 40287 - Inicio
    repeat
      sleep(3000);
    until FileExists(sNomeArquivo);
    //Andre Imakawa - SIG 40287 - Fim

    //Início - William Santana - 34429 - merge
    listaDirf := TStringList.Create;
    listaDirf.LoadFromFile(sNomeArquivo);
    listaDirf.Add('FIMDIRF|');
    listaDirf.SaveToFile(sNomeArquivo);
    FreeAndNil(listaDirf);
    //Término - William Santana - 34429 - merge

    MessageInfo := 'Geração efetuada com sucesso!';
  Except
    On E: Exception Do
      Begin
        Result := False;
        CMDebugToFile(E.Message);
        MessageInfo := E.Message;
      End;
  End;
End;

Function TCtrlGeraDirfNova.GetDataPacketTeste(Sql: TstringList): OleVariant;
Var
  lQry: TwwQuery;
  lDsp: TDatasetProvider;
  lCds: TClientDataSet;
Begin
  Begin
    Result := null;

    lQry := TwwQuery.Create(Nil);
    lDsp := TDatasetProvider.Create(Nil);
    lCds := TClientDataSet.Create(Nil);
    Try
      lQry.DatabaseName := DataBaseName;
      lQry.Sql := Sql;

      lDsp.DataSet := lQry;

      lCds.SetProvider(lDsp);

      lCds.Open;
      Result := lCds.Data;
      lCds.Close;
    Finally
      lCds.ProviderName := '';
      lCds.free;

      lDsp.DataSet := Nil;
      lDsp.free;

      lQry.free;
    End;
  End;
End;

Procedure TCtrlGeraDirfNova.GravaTexto(sNomeArquivo: String);
Begin
  If bTxtImportado Then
    Begin
      //grava a partir de listatemp
      ListToText(listatemp, sNomeArquivo);
    End
  Else
    Begin
      //grava a partir de  listaDirf
      ListToText(listaDirf, sNomeArquivo);
    End;
End;

Procedure TCtrlGeraDirfNova.Importa(arquivo: String);
Var
  FromF: File;
  i, NumRead: Integer;
  Buf: Array[1..732] Of Char;
  temp: String;
Begin
  temp := '';
  listaImport := tstringlist.Create;
  If arquivo <> '' Then
    Begin
      AssignFile(FromF, arquivo);
      Reset(FromF, 1);
      Repeat
        BlockRead(FromF, Buf, SizeOf(Buf), NumRead);
        If Numread > 0 Then
          Begin
            temp := '';
            For i := 1 To numread - 2 Do temp := temp + buf[i];
            listaImport.add(temp);
          End;
      Until (NumRead = 0);
      CloseFile(FromF);
    End;
  bTxtImportado := true;
End;

Procedure TCtrlGeraDirfNova.Junta;
Var
  i, j, k, temp, temp2, contador: integer;
  bdirf: BOOLEAN;
  temp3, scontador: String;
Begin
  bdirf := false;
  contador := 2;
  listaTemp := tstringlist.create;
  temp := cds.fieldbyname('CODNATUREZA').asinteger;
  temp2 := StrToInt(listaImport[1][24] +
    listaImport[1][25] +
    listaImport[1][26] +
    listaImport[1][27]);
  listatemp.add(listaDirf[0]);
  If temp <= temp2 Then
    Begin
      For i := 1 To listaDirf.count - 2 Do
        Begin
          scontador := completazero(inttostr(contador), 8);
          temp3 := listaDirf[i];
          For k := 1 To 8 Do
            temp3[k] := scontador[k];
          listatemp.add(temp3);
          inc(contador);
        End;
      For i := 1 To listaImport.count - 2 Do
        Begin
          scontador := completazero(inttostr(contador), 8);
          temp3 := listaImport[i];
          For k := 1 To 8 Do
            temp3[k] := scontador[k];
          listatemp.add(temp3);
          inc(contador);
        End;
    End
  Else
    Begin
      scontador := completazero(inttostr(contador), 8);
      temp3 := listaImport[1];
      For k := 1 To 8 Do
        temp3[k] := scontador[k];
      listatemp.add(temp3);
      inc(contador);
      For i := 2 To listaImport.count - 2 Do
        Begin
          If temp <= temp2 Then
            Begin
              For j := 1 To listaDirf.count - 2 Do
                Begin
                  scontador := completazero(inttostr(contador), 8);
                  temp3 := listaDirf[j];
                  For k := 1 To 8 Do temp3[k] := scontador[k];
                  listatemp.add(temp3);
                  inc(contador);
                End;
              bdirf := true;
            End
          Else
            Begin
              scontador := completazero(inttostr(contador), 8);
              temp3 := listaImport[i];
              For k := 1 To 8 Do temp3[k] := scontador[k];
              listatemp.add(temp3);
              inc(contador);
            End;
        End;
      If Not (bdirf) Then
        For j := 1 To listaDirf.count - 2 Do
          Begin
            scontador := completazero(inttostr(contador), 8);
            temp3 := listaDirf[j];
            For k := 1 To 8 Do temp3[k] := scontador[k];
            listatemp.add(temp3);
            inc(contador);
          End;
    End;
  rodape(contador);
End;

Function TCtrlGeraDirfNova.ListEmpresa(IdPessoa: Integer): OleVariant;
Var
  Ssql: String;
Begin
  Ssql := 'SELECT RAZAOSOCIAL, NUMDOCUMENTO ' +
    '  FROM PESSOA ' +
    ' WHERE IDPESSOA = ' + IntToStr(IdPessoa);
  Result := GetDataPacket(SSql);
End;

Function TCtrlGeraDirfNova.ListGeraDirf(IdPessoa,
  iSistema: Integer;
  DataIni,
  DataFim,
  NumDocumento: String;
  bRetencao: Boolean;
  rValorMinimo: Real;
  chkParticipMantido: Boolean;
  edPessoanotin: String;
  sCPFFiltro: String): OleVariant;
Var

  Ssql: TstringList;
  iAno, iMes, iDia: word;
Begin

  DecodeDate(StrToDate(DataIni), iAno, iMes, iDia);

  Ssql := TStringList.Create;
  With Ssql Do
    Begin
      Append('SELECT  XB.IDBENEFIRRF, P.TIPO, P.RAZAOSOCIAL AS NOMEBENEF, RTRIM(P.NUMDOCUMENTO) AS CGCBENEF,                         ');
      Append(' XB.TIPOREG, '); //CPREV - Pend. 27026
      Append('        E.NUMDOCUMENTO AS CGCEMPRE, RTRIM(LTRIM(E.RAZAOSOCIAL)) AS NOMEEMPRE, RTRIM(XB.CODNATUREZA) AS CODNATUREZA,  ');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.JAN1),-1,0,XB.JAN1*100)),0) AS JAN1,NVL(TRUNC(XB.JAN2*100),0) AS JAN2,NVL(TRUNC(DECODE(SIGN(XB.JAN3),-1,0,XB.JAN3*100)),0) AS JAN3,              ');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.FEV1),-1,0,XB.FEV1*100)),0) AS FEV1,NVL(TRUNC(XB.FEV2*100),0) AS FEV2,NVL(TRUNC(DECODE(SIGN(XB.FEV3),-1,0,XB.FEV3*100)),0) AS FEV3,              ');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.MAR1),-1,0,XB.MAR1*100)),0) AS MAR1,NVL(TRUNC(XB.MAR2*100),0) AS MAR2,NVL(TRUNC(DECODE(SIGN(XB.MAR3),-1,0,XB.MAR3*100)),0) AS MAR3,              ');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.ABR1),-1,0,XB.ABR1*100)),0) AS ABR1,NVL(TRUNC(XB.ABR2*100),0) AS ABR2,NVL(TRUNC(DECODE(SIGN(XB.ABR3),-1,0,XB.ABR3*100)),0) AS ABR3,              ');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.MAI1),-1,0,XB.MAI1*100)),0) AS MAI1,NVL(TRUNC(XB.MAI2*100),0) AS MAI2,NVL(TRUNC(DECODE(SIGN(XB.MAI3),-1,0,XB.MAI3*100)),0) AS MAI3,              ');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.JUN1),-1,0,XB.JUN1*100)),0) AS JUN1,NVL(TRUNC(XB.JUN2*100),0) AS JUN2,NVL(TRUNC(DECODE(SIGN(XB.JUN3),-1,0,XB.JUN3*100)),0) AS JUN3,              ');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.JUL1),-1,0,XB.JUL1*100)),0) AS JUL1,NVL(TRUNC(XB.JUL2*100),0) AS JUL2,NVL(TRUNC(DECODE(SIGN(XB.JUL3),-1,0,XB.JUL3*100)),0) AS JUL3,              ');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.AGO1),-1,0,XB.AGO1*100)),0) AS AGO1,NVL(TRUNC(XB.AGO2*100),0) AS AGO2,NVL(TRUNC(DECODE(SIGN(XB.AGO3),-1,0,XB.AGO3*100)),0) AS AGO3,              ');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.SET1),-1,0,XB.SET1*100)),0) AS SET1,NVL(TRUNC(XB.SET2*100),0) AS SET2,NVL(TRUNC(DECODE(SIGN(XB.SET3),-1,0,XB.SET3*100)),0) AS SET3,              ');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.OUT1),-1,0,XB.OUT1*100)),0) AS OUT1,NVL(TRUNC(XB.OUT2*100),0) AS OUT2,NVL(TRUNC(DECODE(SIGN(XB.OUT3),-1,0,XB.OUT3*100)),0) AS OUT3,              ');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.NOV1),-1,0,XB.NOV1*100)),0) AS NOV1,NVL(TRUNC(XB.NOV2*100),0) AS NOV2,NVL(TRUNC(DECODE(SIGN(XB.NOV3),-1,0,XB.NOV3*100)),0) AS NOV3,              ');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.DEZ1),-1,0,XB.DEZ1*100)),0) AS DEZ1,NVL(TRUNC(XB.DEZ2*100),0) AS DEZ2,NVL(TRUNC(DECODE(SIGN(XB.DEZ3),-1,0,XB.DEZ3*100)),0) AS DEZ3,              ');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.VLR131),-1,0,XB.VLR131*100)),0) AS VLR131,                                   ');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.VLR132),-1,0,XB.VLR132*100)),0) AS VLR132,                                   ');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.VLR133),-1,0,XB.VLR133*100)),0) AS VLR133                                    ');
      Append('  FROM  PESSOA P,PESSOA E,  (SELECT U.IDBENEFIRRF, U.CODNATUREZA,                                      ');
      Append('                                    U.TIPOREG, '); //CPREV - Pend. 27026
      Append('                                    SUM(U.JAN1) AS JAN1,  SUM(U.FEV1) AS FEV1,                         ');
      Append('                                    SUM(U.MAR1) AS MAR1,  SUM(U.ABR1) AS ABR1,                         ');
      Append('                                    SUM(U.MAI1) AS MAI1,  SUM(U.JUN1) AS JUN1,                         ');
      Append('                                    SUM(U.JUL1) AS JUL1,  SUM(U.AGO1) AS AGO1,                         ');
      Append('                                    SUM(U.SET1) AS SET1,  SUM(U.OUT1) AS OUT1,                         ');
      Append('                                    SUM(U.NOV1) AS NOV1,  SUM(U.DEZ1) AS DEZ1,                         ');
      Append('                                    SUM(U.JAN2) AS JAN2,  SUM(U.FEV2) AS FEV2,                         ');
      Append('                                    SUM(U.MAR2) AS MAR2,  SUM(U.ABR2) AS ABR2,                         ');
      Append('                                    SUM(U.MAI2) AS MAI2,  SUM(U.JUN2) AS JUN2,                         ');
      Append('                                    SUM(U.JUL2) AS JUL2,  SUM(U.AGO2) AS AGO2,                         ');
      Append('                                    SUM(U.SET2) AS SET2,  SUM(U.OUT2) AS OUT2,                         ');
      Append('                                    SUM(U.NOV2) AS NOV2,  SUM(U.DEZ2) AS DEZ2,                         ');
      Append('                                    SUM(U.JAN3) AS JAN3,  SUM(U.FEV3) AS FEV3,                         ');
      Append('                                    SUM(U.MAR3) AS MAR3,  SUM(U.ABR3) AS ABR3,                         ');
      Append('                                    SUM(U.MAI3) AS MAI3,  SUM(U.JUN3) AS JUN3,                         ');
      Append('                                    SUM(U.JUL3) AS JUL3,  SUM(U.AGO3) AS AGO3,                         ');
      Append('                                    SUM(U.SET3) AS SET3,  SUM(U.OUT3) AS OUT3,                         ');
      Append('                                    SUM(U.NOV3) AS NOV3,  SUM(U.DEZ3) AS DEZ3,                         ');
      Append('                                    SUM(U.VLR131) AS VLR131, SUM(U.VLR132) AS VLR132,                  ');
      Append('                                    SUM(U.VLR133) AS VLR133                                            ');
      Append('                              FROM ((SELECT L.IDBENEFIRRF, L.CODNATUREZA,                                             ');
      Append('                                            ''0'' AS TIPOREG, '); //CPREV - Pend. 27026
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0)) AS JAN1,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0)) AS FEV1,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0)) AS MAR1,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0)) AS ABR1,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0)) AS MAI1,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0)) AS JUN1,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0)) AS JUL1,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0)) AS AGO1,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0)) AS SET1,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0)) AS OUT1,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0)) AS NOV1,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0)) AS DEZ1,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS JAN2,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS FEV2,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS MAR2,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS ABR2,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS MAI2,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS JUN2,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS JUL2,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS AGO2,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS SET2,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS OUT2,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS NOV2,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS DEZ2,   ');
      Append('                                            0 AS JAN3, 0 AS FEV3, 0 AS MAR3, 0 AS ABR3, 0 AS MAI3, 0 AS JUN3, 0 AS JUL3, 0 AS AGO3, 0 AS SET3, 0 AS OUT3, 0 AS NOV3, 0 AS DEZ3, ');
      Append('                                            SUM(DECODE(I.CODDIRF,''5'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0)) AS VLR131,                                                   ');
      Append('                                            0 AS VLR132, ');
      //Marcio Sanches Spinosa SOL 226003 KINTANA 2060052 - Inicio
//      Append('                                            SUM(DECODE(I.CODDIRF,''7'',DECODE(L.CODNATUREZA,''5565'',0,''3223'',0, ''3556'',0, ''3579'',0, LI.VLRLANC),0)) AS VLR133'); //Marcio Sanches Spinosa SOL 223465 KINTANA 2058652
      Append('                                            SUM(DECODE(I.CODDIRF,''7'',DECODE(L.CODNATUREZA,''5565'',LI.VLRLANC,''3223'',0, ''3556'',0, ''3579'',LI.VLRLANC, LI.VLRLANC),0)) AS VLR133'); //Marcio Sanches Spinosa SOL 223465 KINTANA 2058652
      //Marcio Sanches Spinosa SOL 226003 KINTANA 2060052 - Fim
      Append('                                       FROM INFORME I, LANCXINFORME LI, LANCIRRF L, NATURENDIMENTO N                                               ');
      Append('                                      WHERE (I.IDINFORME = LI.IDINFORME)                                                                           ');
      Append('                                        AND (LI.IDLANCIRRF = L.IDLANCIRRF)                                                                         ');
      Append('                                        AND (L.CODNATUREZA = N.CODNATUREZA)                                                                        ');
      Append('                                        AND (N.FLGUSADONADIRF = ' + QuotedStr('S') + ')');
      Append('                                        AND (I.CODDIRF <> 1)');

      If edPessoanotin <> '' Then
        Append('                                     AND (L.IDBENEFIRRF NOT IN (' + edPessoanotin + '))');

      If (iSistema = 0) Then
        Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 21) ')
      Else If (iSistema = 1) Then
        Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 18) ')
      Else If (iSistema = 2) Then
        Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 03) ');

      Append('AND           (L.datapagamento BETWEEN TO_DATE(' + quotedStr(DataIni) + ',''DD/MM/YYYY'') AND TO_DATE(' + quotedStr(DataFim) + ',''DD/MM/YYYY''))          ');

      If (iSistema = 2) Then
        Append(' AND (L.CODNATUREZA NOT IN (''5952'', ''5960'', ''5979'', ''5987'')) ');

      Append(' GROUP BY L.IDBENEFIRRF, L.CODNATUREZA, ''0'') '); //CPREV - Pend. 27026

      Append('UNION ALL                                                                                                                   ');
      Append('(SELECT  L.IDBENEFIRRF, L.CODNATUREZA,                                                                                      ');
      Append(' ''0'' AS TIPOREG, ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',L.VLRBASE,0)) AS JAN1,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',L.VLRBASE,0)) AS FEV1,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',L.VLRBASE,0)) AS MAR1,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',L.VLRBASE,0)) AS ABR1,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',L.VLRBASE,0)) AS MAI1,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',L.VLRBASE,0)) AS JUN1,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',L.VLRBASE,0)) AS JUL1,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',L.VLRBASE,0)) AS AGO1,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',L.VLRBASE,0)) AS SET1,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',L.VLRBASE,0)) AS OUT1,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',L.VLRBASE,0)) AS NOV1,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',L.VLRBASE,0)) AS DEZ1,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',L.VLRIRRF,0)) AS JAN2,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',L.VLRIRRF,0)) AS FEV2,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',L.VLRIRRF,0)) AS MAR2,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',L.VLRIRRF,0)) AS ABR2,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',L.VLRIRRF,0)) AS MAI2,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',L.VLRIRRF,0)) AS JUN2,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',L.VLRIRRF,0)) AS JUL2,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',L.VLRIRRF,0)) AS AGO2,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',L.VLRIRRF,0)) AS SET2,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',L.VLRIRRF,0)) AS OUT2,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',L.VLRIRRF,0)) AS NOV2,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',L.VLRIRRF,0)) AS DEZ2,                                              ');

      Append(' 0 AS JAN3, 0 AS FEV3, 0 AS MAR3, 0 AS ABR3, 0 AS MAI3, 0 AS JUN3, 0 AS JUL3, 0 AS AGO3, 0 AS SET3, 0 AS OUT3, 0 AS NOV3, 0 AS DEZ3, '); //CPrev - Pend. 27026

      Append('         0 AS VLR131, 0 AS VLR132, 0 AS VLR133                                                                              ');
      Append('    FROM LANCIRRF L                                                                                                         ');
      Append('   WHERE (NOT EXISTS (SELECT I.IDLANCIRRF FROM LANCXINFORME I WHERE L.IDLANCIRRF = I.IDLANCIRRF))                           ');
      Append(' AND (NVL(L.IDMODULORESPON, L.IDMODULO) <> 18) ');

      If edPessoanotin <> '' Then
        Append('                                     AND (L.IDBENEFIRRF NOT IN (' + edPessoanotin + '))');

      If (iSistema = 0) Then
        Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 21) ')
      Else If (iSistema = 1) Then
        Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 18) ')
      Else If (iSistema = 2) Then
        Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 3) ');

      If (iSistema = 2) Then
        Append(' AND (L.CODNATUREZA NOT IN (''5952'', ''5960'', ''5979'', ''5987'')) ');

      Append('AND (L.datapagamento BETWEEN TO_DATE(' + quotedStr(DataIni) + ',''DD/MM/YYYY'') AND TO_DATE(' + quotedStr(DataFim) + ',''DD/MM/YYYY''))                   ');
      Append(' GROUP BY L.IDMODULO, L.IDBENEFIRRF, L.CODNATUREZA, ''0'') '); //CPREV - Pend. 27026

      // O select abaixo vai verificar se o participante possui contribuição como Mantido
      // para que seja adicionado na DIRF, visto que existe um relatório de informe de
      // rendimentos para mantidos que pagam contribuicão

      // somente se o usuário indicar na tela
      If chkParticipMantido Then Begin
          Append('UNION ALL                                                                                                                                          ');
          Append('SELECT ');
          Append('       P.IDPESSOA AS IDBENEFIRRF,');
          Append('       ''9999'' AS CODNATUREZA,');
          Append('       ''0'' AS TIPOREG, '); //CPREV - Pend. 27026
          Append('       0 AS JAN1, 0 AS FEV1, 0 AS MAR1, 0 AS ABR1, 0 AS MAI1, 0 AS JUN1,');
          Append('       0 AS JUL1, 0 AS AGO1, 0 AS SET1, 0 AS OUT1, 0 AS NOV1, 0 AS DEZ1,');
          Append('       0 AS JAN2, 0 AS FEV2, 0 AS MAR2, 0 AS ABR2, 0 AS MAI2, 0 AS JUN2,');
          Append('       0 AS JUL2, 0 AS AGO2, 0 AS SET2, 0 AS OUT2, 0 AS NOV2, 0 AS DEZ2,');

          Append('       0 AS JAN3, 0 AS FEV3, 0 AS MAR3, 0 AS ABR3, 0 AS MAI3, 0 AS JUN3, 0 AS JUL3, 0 AS AGO3, 0 AS SET3, 0 AS OUT3, 0 AS NOV3, 0 AS DEZ3, '); //CPrev - Pend. 27026

          Append('       0 AS VLR131, 0 AS VLR132,');
          Append('       SUM(DECODE(SUBSTR(H.MESCOBRANCA,6,2),''13'',DECODE(NVL(H.FLGDEVOLUCAO,0),0,H.VALORRECEBIDO,-H.VALORRECEBIDO),0)) AS VLR133');
          Append('FROM   PESSOA P,');
          Append('       ELEGPATRO EL,');
          Append('       HSTCONTRIBPREV H,');
          Append('       CONTPREV CP,');
          Append('       PROVDESC PD,');
          Append('       INFORME I');
          Append('WHERE  CP.FLGPAGADOR IN (''C'',''P'')');

          Append('AND    CP.IDCONTRIBUICAO IN (19,26,215,358,560,580,600,601,621)');
          Append('AND    NVL(H.FLGDESCFOLHA,0) = 0 ');
          Append('AND    NVL(H.SITRECEBIMENTO,0) IN (2,3,5) ');
          Append('AND    CP.FLGINTERNO IN (''MA'',''MP'')');
          Append('AND    H.MESCOBRANCA >= ' + QuotedStr(FloatToStr(iAno) + '/01'));
          Append('AND    H.MESCOBRANCA <= ' + QuotedStr(FloatToStr(iAno) + '/13'));
          Append('AND    CP.IDPLANOPREV    = H.IDPLANOPREV');
          Append('AND    CP.IDCONTRIBUICAO = H.IDCONTRIBUICAO');
          Append('AND    EL.IDPESSJUR = H.IDPESSJUR');
          Append('AND    EL.IDPESSOA = H.IDPESSOA');
          Append('AND    P.IDPESSOA = EL.IDPESSOA');
          Append('AND    PD.IDPROVENTO = CP.IDRUBRICA');
          Append('AND    I.IDINFORME   = PD.IDINFORME');
          Append('GROUP BY');
          Append('       P.IDPESSOA');
        End;

      If (iSistema = 2) Then
        Append(' UNION ALL (SELECT ' +
          ' T.IDBENEFIRRF, T.CODNATUREZA, ' +
          ' ''0'' AS TIPOREG, ' + //CPREV - Pend. 27026
          ' SUM(T.JAN1) AS JAN1, SUM(T.FEV1) AS FEV1, SUM(T.MAR1) AS MAR1, ' +
          ' SUM(T.ABR1) AS ABR1, SUM(T.MAI1) AS MAI1, SUM(T.JUN1) AS JUN1, ' +
          ' SUM(T.JUL1) AS JUL1, SUM(T.AGO1) AS AGO1, SUM(T.SET1) AS SET1, ' +
          ' SUM(T.OUT1) AS OUT1, SUM(T.NOV1) AS NOV1, SUM(T.DEZ1) AS DEZ1, ' +
          ' 0 AS JAN2, 0 AS FEV2, 0 AS MAR2, 0 AS ABR2, 0 AS MAI2, 0 AS JUN2, ' +
          ' 0 AS JUL2, 0 AS AGO2, 0 AS SET2, 0 AS OUT2, 0 AS NOV2, 0 AS DEZ2, ' +
          ' 0 AS JAN3, 0 AS FEV3, 0 AS MAR3, 0 AS ABR3, 0 AS MAI3, 0 AS JUN3, ' +
          ' 0 AS JUL3, 0 AS AGO3, 0 AS SET3, 0 AS OUT3, 0 AS NOV3, 0 AS DEZ3, ' +
          ' 0 AS VLR131, 0 AS VLR132, 0 AS VLR133 ' +
          ' FROM (SELECT DISTINCT L.CODDOCUMENTO, L.IDBENEFIRRF, L.CODNATUREZA, ' +
          ' MIN(L.IDLANCIRRF) AS IDLANCIRRF, ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS JAN1, ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS FEV1, ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS MAR1, ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS ABR1, ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS MAI1, ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS JUN1, ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS JUL1, ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS AGO1, ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS SET1, ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS OUT1, ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS NOV1, ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS DEZ1  ' +
          ' FROM LANCXINFORME LI, LANCIRRF L, INFORME I ' +
          ' WHERE ' +
          '  (LI.IDLANCIRRF              = L.IDLANCIRRF) ' +
          ' AND (L.datapagamento BETWEEN TO_DATE(' + quotedStr(DataIni) + ',''DD/MM/YYYY'') AND TO_DATE(' + quotedStr(DataFim) + ',''DD/MM/YYYY'')) ' +
          ' AND (I.IDINFORME                = LI.IDINFORME) ' +
          ' AND (I.CODDIRF                 <> 1) ' +
          ' AND (L.CODNATUREZA IN (''5952'', ''5960'', ''5979'', ''5987'')) ' +
          ' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 3) ' +
          ' GROUP BY ' +
          ' L.CODDOCUMENTO, L.IDBENEFIRRF, L.CODNATUREZA, ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) ) T ' +
          ' GROUP BY T.IDBENEFIRRF, T.CODNATUREZA) ' +
          ' UNION ALL ' +
          ' (SELECT  L.IDBENEFIRRF, L.CODNATUREZA, ' +
          ' ''0'' AS TIPOREG, ' + //CPREV - Pend. 27026

          ' 0 AS JAN1, 0 AS FEV1, 0 AS MAR1, ' +
          ' 0 AS ABR1, 0 AS MAI1, 0 AS JUN1, ' +
          ' 0 AS JUL1, 0 AS AGO1, 0 AS SET1, ' +
          ' 0 AS OUT1, 0 AS NOV1, 0 AS DEZ1, ' +
          ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS JAN2, ' +
          ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS FEV2, ' +
          ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS MAR2, ' +
          ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS ABR2, ' +
          ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS MAI2, ' +
          ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS JUN2, ' +
          ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS JUL2, ' +
          ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS AGO2, ' +
          ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS SET2, ' +
          ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS OUT2, ' +
          ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS NOV2, ' +
          ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS DEZ2, ' +
          ' 0 AS JAN3, ' +
          ' 0 AS FEV3, ' +
          ' 0 AS MAR3, ' +
          ' 0 AS ABR3, ' +
          ' 0 AS MAI3, ' +
          ' 0 AS JUN3, ' +
          ' 0 AS JUL3, ' +
          ' 0 AS AGO3, ' +
          ' 0 AS SET3, ' +
          ' 0 AS OUT3, ' +
          ' 0 AS NOV3, ' +
          ' 0 AS DEZ3, ' +
          ' 0 AS VLR131, 0 AS VLR132, 0 AS VLR133 ' +
          ' FROM LANCIRRF L ' +
          ' WHERE (L.datapagamento BETWEEN TO_DATE(' + quotedStr(DataIni) + ',''DD/MM/YYYY'') AND TO_DATE(' + quotedStr(DataFim) + ',''DD/MM/YYYY'')) ' +
          ' AND (L.CODNATUREZA IN (''5952'', ''5960'', ''5979'', ''5987'')) ' +
          ' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 3) ' +
          ' GROUP BY L.IDBENEFIRRF, L.CODNATUREZA) ');

      Append(') U');
      Append('GROUP BY U.IDBENEFIRRF, U.CODNATUREZA');
      Append(' , U.TIPOREG  ');

      If (iSistema <> 2) Then
        Begin
          Append(' ,U.TIPOREG ');
          Append(' UNION ALL ');
          Append(' SELECT ');
          Append('   P.IDPESSOA AS IDBENEFIRRF,  ');
          //Felipe A. Santos SOL 223584 KTN 2057497
          //Append('   DECODE(L.CODNATUREZA,''7416'',''0561'',L.CODNATUREZA) AS CODNATUREZA, ''1'' AS TIPOREG, ');

          // Felipe A. Santos SOL 223584 KTN 2057497
          Append('   case ');
          Append('    when TO_CHAR(L.datapagamento,''YYYYMM'') <= ''201301'' then ');
          Append('         DECODE(L.CODNATUREZA,''7416'',''0561'', L.CODNATUREZA) ');
          Append('    else ');
          Append('          DECODE(L.CODNATUREZA,''7416'',''3540'', L.CODNATUREZA) ');
          Append('   end  CODNATUREZA, ');
          // Felipe A. Santos SOL 223584 KTN 2057497

          Append('   ''1'' AS TIPOREG, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''18'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS JAN1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''18'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS FEV1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''18'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS MAR1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''18'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS ABR1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''18'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS MAI1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''18'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS JUN1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''18'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS JUL1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''18'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS AGO1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''18'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS SET1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''18'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS OUT1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''18'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS NOV1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''18'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS DEZ1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS JAN2, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS FEV2, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS MAR2, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS ABR2, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS MAI2, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS JUN2, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS JUL2, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS AGO2, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS SET2, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS OUT2, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS NOV2, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS DEZ2, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS JAN3, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS FEV3, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS MAR3, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS ABR3, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS MAI3, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS JUN3, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS JUL3, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS AGO3, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS SET3, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS OUT3, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS NOV3, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS DEZ3, ');
          Append('   SUM(DECODE(I.CODDIRF,''22'',LI.VLRLANC,0)) AS VLR131, ');
          Append('   SUM(DECODE(I.CODDIRF,''24'',LI.VLRLANC,0)) AS VLR132, ');
          Append('   SUM(DECODE(I.CODDIRF,''23'',LI.VLRLANC,0)) AS VLR133 ');
          Append(' FROM INFORME I, LANCXINFORME LI, LANCIRRF L, NATURENDIMENTO N, PESSOA P ');
          Append(' WHERE (I.IDINFORME                      = LI.IDINFORME) ');
          Append('   AND (LI.IDLANCIRRF                    = L.IDLANCIRRF) ');
          Append('   AND (L.CODNATUREZA                    = N.CODNATUREZA) ');
          Append('   AND (N.FLGUSADONADIRF                 = ''S'') ');
          Append('   AND (I.CODDIRF                       <> 1) ');
          Append('   AND (P.IDPESSOA                       = L.IDBENEFIRRF) ');

          If (iSistema = 0) Then
            Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 21) ')
          Else If (iSistema = 1) Then
            Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 18) ');

          Append('   AND (L.datapagamento            BETWEEN TO_DATE(' + quotedStr(DataIni) + ', ''DD/MM/YYYY'') AND TO_DATE(' + quotedStr(DataFim) + ',''DD/MM/YYYY'')) ');
          Append(' GROUP BY P.IDPESSOA, DECODE(L.CODNATUREZA,''7416'',''0561'',L.CODNATUREZA), ''1'' ');
          Append(' UNION ALL');
          Append(' SELECT ');
          Append('   P.IDPESSOA AS IDBENEFIRRF, ');
          Append('   DECODE(L.CODNATUREZA,''7416'',''0561'',L.CODNATUREZA) AS CODNATUREZA, ''2'' AS TIPOREG, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS JAN1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS FEV1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS MAR1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS ABR1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS MAI1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS JUN1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS JUL1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS AGO1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS SET1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS OUT1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS NOV1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS DEZ1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS JAN2, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS FEV2, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS MAR2, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS ABR2, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS MAI2, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS JUN2, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS JUL2, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS AGO2, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS SET2, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS OUT2, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS NOV2, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS DEZ2, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS JAN3, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS FEV3, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS MAR3, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS ABR3, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS MAI3, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS JUN3, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS JUL3, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS AGO3, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS SET3, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS OUT3, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS NOV3, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS DEZ3, ');
          Append('   SUM(DECODE(I.CODDIRF,''25'',LI.VLRLANC,0)) AS VLR131, ');
          Append('   SUM(DECODE(I.CODDIRF,''0'' ,LI.VLRLANC,0)) AS VLR132, ');
          Append('   SUM(DECODE(I.CODDIRF,''0'' ,LI.VLRLANC,0)) AS VLR133 ');
          Append(' FROM INFORME I, LANCXINFORME LI, LANCIRRF L, NATURENDIMENTO N, PESSOA P ');
          Append(' WHERE (I.IDINFORME                      = LI.IDINFORME) ');
          Append('   AND (LI.IDLANCIRRF                    = L.IDLANCIRRF) ');
          Append('   AND (L.CODNATUREZA                    = N.CODNATUREZA) ');
          Append('   AND (N.FLGUSADONADIRF                 = ''S'') ');
          Append('   AND (I.CODDIRF                       <> 1) ');
          Append('   AND (P.IDPESSOA                        = L.IDBENEFIRRF) ');

          If (iSistema = 0) Then
            Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 21) ')
          Else If (iSistema = 1) Then
            Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 18) ');

          Append('   AND (L.datapagamento            BETWEEN TO_DATE(' + quotedStr(DataIni) + ', ''DD/MM/YYYY'') AND TO_DATE(' + quotedStr(DataFim) + ',''DD/MM/YYYY'')) ');

          // Felipe A. Santos SOL 223584 KTN 2057497
          //Append(' GROUP BY P.IDPESSOA, DECODE(L.CODNATUREZA,''7416'',''0561'',L.CODNATUREZA), ''2'' ');
          Append(' GROUP BY P.IDPESSOA, L.DATAPAGAMENTO, L.CODNATUREZA, ''2'' ');
          // Felipe A. Santos SOL 223584 KTN 2057497 - fim
        End;
      //CPREV - Pend. 27026 - Fim

      Append(' ) XB                                                                                                                      ');
      Append(' WHERE  (XB.IDBENEFIRRF = P.IDPESSOA)  ');
      //      append( ' AND XB.NUMDOCUMENTO = 05743380004156 ');

      Append(' AND  (E.IDPESSOA = ' + IntToStr(IdPessoa) + ') ');

      Append('ORDER BY CODNATUREZA, P.TIPO, CGCBENEF, NOMEBENEF, XB.TIPOREG ');

    End;
  sSql.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\QueryDirf2011.txt');
  Result := GetDataPacket(Ssql);
End;

Function TCtrlGeraDirfNova.ListGeraDirfJudicial_Suspensa(IdPessoa,
  iSistema: Integer;
  DataIni,
  DataFim,
  NumDocumento: String;
  rValorMinimo,
  rValorIndenizacao: Real;
  sCPFFiltro: String): OleVariant;
Var
  sSql: TstringList;
  bAcaoJudEqua: Boolean; //Cássio Rovaroto - SIG nº 74355
  sSqlHeader : String;   //Arnaldo - WO13395
Begin
  sSql := TStringList.Create;
  sSql.Clear;                       //Arnaldo - WO13395

  //Cássio Rovaroto - SIG nº 74355 - Início
  //Identifica se participante possui ação judicial de equacionamento
  //Cássio Rovaroto - SIG nº 78096 - Início
  if sCPFFiltro = EmptyStr then
    bAcaoJudEqua := True
  else
    bAcaoJudEqua := VerificaAcaoJudEqua(sCPFFiltro, DataIni, DataFim);
  //Cássio Rovaroto - SIG nº 74355 - Fim
  //Cássio Rovaroto - SIG nº 78096 - Fim

  cds21Normal.Data := GetDataPacket('SELECT NVL(FLGEXCEPCIONAL,0) AS FLGEXCEPCIONAL FROM PARAMEMPTMO');

  With sSql Do
    Begin
      Append('SELECT  XB.IDBENEFIRRF, P.TIPO, P.RAZAOSOCIAL AS NOMEBENEF, RTRIM(P.NUMDOCUMENTO) AS CGCBENEF,                    ');
      Append('        E.NUMDOCUMENTO AS CGCEMPRE, E.RAZAOSOCIAL AS NOMEEMPRE, ');
      Append('        XB.CODNATUREZA,   ');

      //Início - William Santana - SIG 40171
      //Append('        NVL(TRUNC(DECODE(SIGN(XB.JAN4),-1,0,XB.JAN4*100)),0) AS JAN4,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.FEV4),-1,0,XB.FEV4*100)),0) AS FEV4,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.MAR4),-1,0,XB.MAR4*100)),0) AS MAR4,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.ABR4),-1,0,XB.ABR4*100)),0) AS ABR4,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.MAI4),-1,0,XB.MAI4*100)),0) AS MAI4,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.JUN4),-1,0,XB.JUN4*100)),0) AS JUN4,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.JUL4),-1,0,XB.JUL4*100)),0) AS JUL4,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.AGO4),-1,0,XB.AGO4*100)),0) AS AGO4,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.SET4),-1,0,XB.SET4*100)),0) AS SET4,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.OUT4),-1,0,XB.OUT4*100)),0) AS OUT4,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.NOV4),-1,0,XB.NOV4*100)),0) AS NOV4,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.DEZ4),-1,0,XB.DEZ4*100)),0) AS DEZ4,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.JAN5),-1,0,XB.JAN5*100)),0) AS JAN5,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.FEV5),-1,0,XB.FEV5*100)),0) AS FEV5,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.MAR5),-1,0,XB.MAR5*100)),0) AS MAR5,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.ABR5),-1,0,XB.ABR5*100)),0) AS ABR5,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.MAI5),-1,0,XB.MAI5*100)),0) AS MAI5,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.JUN5),-1,0,XB.JUN5*100)),0) AS JUN5,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.JUL5),-1,0,XB.JUL5*100)),0) AS JUL5,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.AGO5),-1,0,XB.AGO5*100)),0) AS AGO5,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.SET5),-1,0,XB.SET5*100)),0) AS SET5,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.OUT5),-1,0,XB.OUT5*100)),0) AS OUT5,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.NOV5),-1,0,XB.NOV5*100)),0) AS NOV5,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.DEZ5),-1,0,XB.DEZ5*100)),0) AS DEZ5,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.JAN6),-1,0,XB.JAN6*100)),0) AS JAN6,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.FEV6),-1,0,XB.FEV6*100)),0) AS FEV6,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.MAR6),-1,0,XB.MAR6*100)),0) AS MAR6,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.ABR6),-1,0,XB.ABR6*100)),0) AS ABR6,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.MAI6),-1,0,XB.MAI6*100)),0) AS MAI6,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.JUN6),-1,0,XB.JUN6*100)),0) AS JUN6,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.JUL6),-1,0,XB.JUL6*100)),0) AS JUL6,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.AGO6),-1,0,XB.AGO6*100)),0) AS AGO6,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.SET6),-1,0,XB.SET6*100)),0) AS SET6,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.OUT6),-1,0,XB.OUT6*100)),0) AS OUT6,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.NOV6),-1,0,XB.NOV6*100)),0) AS NOV6,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.DEZ6),-1,0,XB.DEZ6*100)),0) AS DEZ6,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.JAN7),-1,0,XB.JAN7*100)),0) AS JAN7,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.FEV7),-1,0,XB.FEV7*100)),0) AS FEV7,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.MAR7),-1,0,XB.MAR7*100)),0) AS MAR7,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.ABR7),-1,0,XB.ABR7*100)),0) AS ABR7,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.MAI7),-1,0,XB.MAI7*100)),0) AS MAI7,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.JUN7),-1,0,XB.JUN7*100)),0) AS JUN7,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.JUL7),-1,0,XB.JUL7*100)),0) AS JUL7,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.AGO7),-1,0,XB.AGO7*100)),0) AS AGO7,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.SET7),-1,0,XB.SET7*100)),0) AS SET7,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.OUT7),-1,0,XB.OUT7*100)),0) AS OUT7,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.NOV7),-1,0,XB.NOV7*100)),0) AS NOV7,');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.DEZ7),-1,0,XB.DEZ7*100)),0) AS DEZ7,');
//      Append('        NVL(TRUNC(XB.JAN8*100),0) AS JAN8,');
//      Append('        NVL(TRUNC(XB.FEV8*100),0) AS FEV8,');
//      Append('        NVL(TRUNC(XB.MAR8*100),0) AS MAR8,');
//      Append('        NVL(TRUNC(XB.ABR8*100),0) AS ABR8,');
//      Append('        NVL(TRUNC(XB.MAI8*100),0) AS MAI8,');
//      Append('        NVL(TRUNC(XB.JUN8*100),0) AS JUN8,');
//      Append('        NVL(TRUNC(XB.JUL8*100),0) AS JUL8,');
//      Append('        NVL(TRUNC(XB.AGO8*100),0) AS AGO8,');
//      Append('        NVL(TRUNC(XB.SET8*100),0) AS SET8,');
//      Append('        NVL(TRUNC(XB.OUT8*100),0) AS OUT8,');
//      Append('        NVL(TRUNC(XB.NOV8*100),0) AS NOV8,');
//      Append('        NVL(TRUNC(XB.DEZ8*100),0) AS DEZ8,');
//
//      //CPrev - Pend. 27026 - Início
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.JAN9),-1,0,XB.JAN9*100)),0) AS JAN9, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.FEV9),-1,0,XB.FEV9*100)),0) AS FEV9, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.MAR9),-1,0,XB.MAR9*100)),0) AS MAR9, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.ABR9),-1,0,XB.ABR9*100)),0) AS ABR9, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.MAI9),-1,0,XB.MAI9*100)),0) AS MAI9, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.JUN9),-1,0,XB.JUN9*100)),0) AS JUN9, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.JUL9),-1,0,XB.JUL9*100)),0) AS JUL9, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.AGO9),-1,0,XB.AGO9*100)),0) AS AGO9, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.SET9),-1,0,XB.SET9*100)),0) AS SET9, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.OUT9),-1,0,XB.OUT9*100)),0) AS OUT9, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.NOV9),-1,0,XB.NOV9*100)),0) AS NOV9, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.DEZ9),-1,0,XB.DEZ9*100)),0) AS DEZ9, ');
//
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.JAN10),-1,0,XB.JAN10*100)),0) AS JAN10, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.FEV10),-1,0,XB.FEV10*100)),0) AS FEV10, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.MAR10),-1,0,XB.MAR10*100)),0) AS MAR10, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.ABR10),-1,0,XB.ABR10*100)),0) AS ABR10, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.MAI10),-1,0,XB.MAI10*100)),0) AS MAI10, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.JUN10),-1,0,XB.JUN10*100)),0) AS JUN10, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.JUL10),-1,0,XB.JUL10*100)),0) AS JUL10, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.AGO10),-1,0,XB.AGO10*100)),0) AS AGO10, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.SET10),-1,0,XB.SET10*100)),0) AS SET10, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.OUT10),-1,0,XB.OUT10*100)),0) AS OUT10, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.NOV10),-1,0,XB.NOV10*100)),0) AS NOV10, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.DEZ10),-1,0,XB.DEZ10*100)),0) AS DEZ10, ');
//
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.JAN11),-1,0,XB.JAN11*100)),0) AS JAN11, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.FEV11),-1,0,XB.FEV11*100)),0) AS FEV11, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.MAR11),-1,0,XB.MAR11*100)),0) AS MAR11, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.ABR11),-1,0,XB.ABR11*100)),0) AS ABR11, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.MAI11),-1,0,XB.MAI11*100)),0) AS MAI11, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.JUN11),-1,0,XB.JUN11*100)),0) AS JUN11, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.JUL11),-1,0,XB.JUL11*100)),0) AS JUL11, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.AGO11),-1,0,XB.AGO11*100)),0) AS AGO11, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.SET11),-1,0,XB.SET11*100)),0) AS SET11, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.OUT11),-1,0,XB.OUT11*100)),0) AS OUT11, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.NOV11),-1,0,XB.NOV11*100)),0) AS NOV11, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.DEZ11),-1,0,XB.DEZ11*100)),0) AS DEZ11, ');
//
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.JAN12),-1,0,XB.JAN12*100)),0) AS JAN12, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.FEV12),-1,0,XB.FEV12*100)),0) AS FEV12, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.MAR12),-1,0,XB.MAR12*100)),0) AS MAR12, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.ABR12),-1,0,XB.ABR12*100)),0) AS ABR12, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.MAI12),-1,0,XB.MAI12*100)),0) AS MAI12, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.JUN12),-1,0,XB.JUN12*100)),0) AS JUN12, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.JUL12),-1,0,XB.JUL12*100)),0) AS JUL12, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.AGO12),-1,0,XB.AGO12*100)),0) AS AGO12, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.SET12),-1,0,XB.SET12*100)),0) AS SET12, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.OUT12),-1,0,XB.OUT12*100)),0) AS OUT12, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.NOV12),-1,0,XB.NOV12*100)),0) AS NOV12, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.DEZ12),-1,0,XB.DEZ12*100)),0) AS DEZ12, ');
//
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.JAN13),-1,0,XB.JAN13*100)),0) AS JAN13, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.FEV13),-1,0,XB.FEV13*100)),0) AS FEV13, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.MAR13),-1,0,XB.MAR13*100)),0) AS MAR13, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.ABR13),-1,0,XB.ABR13*100)),0) AS ABR13, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.MAI13),-1,0,XB.MAI13*100)),0) AS MAI13, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.JUN13),-1,0,XB.JUN13*100)),0) AS JUN13, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.JUL13),-1,0,XB.JUL13*100)),0) AS JUL13, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.AGO13),-1,0,XB.AGO13*100)),0) AS AGO13, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.SET13),-1,0,XB.SET13*100)),0) AS SET13, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.OUT13),-1,0,XB.OUT13*100)),0) AS OUT13, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.NOV13),-1,0,XB.NOV13*100)),0) AS NOV13, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.DEZ13),-1,0,XB.DEZ13*100)),0) AS DEZ13, ');
//
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.JAN14),-1,0,XB.JAN14*100)),0) AS JAN14, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.FEV14),-1,0,XB.FEV14*100)),0) AS FEV14, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.MAR14),-1,0,XB.MAR14*100)),0) AS MAR14, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.ABR14),-1,0,XB.ABR14*100)),0) AS ABR14, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.MAI14),-1,0,XB.MAI14*100)),0) AS MAI14, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.JUN14),-1,0,XB.JUN14*100)),0) AS JUN14, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.JUL14),-1,0,XB.JUL14*100)),0) AS JUL14, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.AGO14),-1,0,XB.AGO14*100)),0) AS AGO14, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.SET14),-1,0,XB.SET14*100)),0) AS SET14, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.OUT14),-1,0,XB.OUT14*100)),0) AS OUT14, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.NOV14),-1,0,XB.NOV14*100)),0) AS NOV14, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.DEZ14),-1,0,XB.DEZ14*100)),0) AS DEZ14, ');
//
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.JAN15),-1,0,XB.JAN15*100)),0) AS JAN15, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.FEV15),-1,0,XB.FEV15*100)),0) AS FEV15, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.MAR15),-1,0,XB.MAR15*100)),0) AS MAR15, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.ABR15),-1,0,XB.ABR15*100)),0) AS ABR15, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.MAI15),-1,0,XB.MAI15*100)),0) AS MAI15, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.JUN15),-1,0,XB.JUN15*100)),0) AS JUN15, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.JUL15),-1,0,XB.JUL15*100)),0) AS JUL15, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.AGO15),-1,0,XB.AGO15*100)),0) AS AGO15, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.SET15),-1,0,XB.SET15*100)),0) AS SET15, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.OUT15),-1,0,XB.OUT15*100)),0) AS OUT15, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.NOV15),-1,0,XB.NOV15*100)),0) AS NOV15, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.DEZ15),-1,0,XB.DEZ15*100)),0) AS DEZ15, ');
//
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.VLR139), -1,0,XB.VLR139*100)), 0) AS VLR139,  ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.VLR1310),-1,0,XB.VLR1310*100)),0) AS VLR1310, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.VLR1311),-1,0,XB.VLR1311*100)),0) AS VLR1311, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.VLR1311),-1,0,XB.VLR1311*100)),0) AS VLR1311, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.VLR1312),-1,0,XB.VLR1312*100)),0) AS VLR1312, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.VLR1313),-1,0,XB.VLR1313*100)),0) AS VLR1313, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.VLR1314),-1,0,XB.VLR1314*100)),0) AS VLR1314, ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.VLR1315),-1,0,XB.VLR1315*100)),0) AS VLR1315, ');
//      //CPrev - Pend. 27026 - Fim
//
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.VLR134),-1,0,XB.VLR134*100)),0) AS VLR134,                                           ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.VLR135),-1,0,XB.VLR135*100)),0) AS VLR135,                                           ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.VLR136),-1,0,XB.VLR136*100)),0) AS VLR136,                                           ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.VLR137),-1,0,XB.VLR137*100)),0) AS VLR137,                                           ');
//      Append('        NVL(TRUNC(DECODE(SIGN(XB.VLR138),-1,0,XB.VLR138*100)),0) AS VLR138                                            ');

      Append('        NVL(TRUNC(XB.JAN4*100),0) AS JAN4,');
      Append('        NVL(TRUNC(XB.FEV4*100),0) AS FEV4,');
      Append('        NVL(TRUNC(XB.MAR4*100),0) AS MAR4,');
      Append('        NVL(TRUNC(XB.ABR4*100),0) AS ABR4,');
      Append('        NVL(TRUNC(XB.MAI4*100),0) AS MAI4,');
      Append('        NVL(TRUNC(XB.JUN4*100),0) AS JUN4,');
      Append('        NVL(TRUNC(XB.JUL4*100),0) AS JUL4,');
      Append('        NVL(TRUNC(XB.AGO4*100),0) AS AGO4,');
      Append('        NVL(TRUNC(XB.SET4*100),0) AS SET4,');
      Append('        NVL(TRUNC(XB.OUT4*100),0) AS OUT4,');
      Append('        NVL(TRUNC(XB.NOV4*100),0) AS NOV4,');
      Append('        NVL(TRUNC(XB.DEZ4*100),0) AS DEZ4,');
	  
      Append('        NVL(TRUNC(XB.JAN5*100),0) AS JAN5,');
      Append('        NVL(TRUNC(XB.FEV5*100),0) AS FEV5,');
      Append('        NVL(TRUNC(XB.MAR5*100),0) AS MAR5,');
      Append('        NVL(TRUNC(XB.ABR5*100),0) AS ABR5,');
      Append('        NVL(TRUNC(XB.MAI5*100),0) AS MAI5,');
      Append('        NVL(TRUNC(XB.JUN5*100),0) AS JUN5,');
      Append('        NVL(TRUNC(XB.JUL5*100),0) AS JUL5,');
      Append('        NVL(TRUNC(XB.AGO5*100),0) AS AGO5,');
      Append('        NVL(TRUNC(XB.SET5*100),0) AS SET5,');
      Append('        NVL(TRUNC(XB.OUT5*100),0) AS OUT5,');
      Append('        NVL(TRUNC(XB.NOV5*100),0) AS NOV5,');
      Append('        NVL(TRUNC(XB.DEZ5*100),0) AS DEZ5,');
	  
      Append('        NVL(TRUNC(XB.JAN6*100),0) AS JAN6,');
      Append('        NVL(TRUNC(XB.FEV6*100),0) AS FEV6,');
      Append('        NVL(TRUNC(XB.MAR6*100),0) AS MAR6,');
      Append('        NVL(TRUNC(XB.ABR6*100),0) AS ABR6,');
      Append('        NVL(TRUNC(XB.MAI6*100),0) AS MAI6,');
      Append('        NVL(TRUNC(XB.JUN6*100),0) AS JUN6,');
      Append('        NVL(TRUNC(XB.JUL6*100),0) AS JUL6,');
      Append('        NVL(TRUNC(XB.AGO6*100),0) AS AGO6,');
      Append('        NVL(TRUNC(XB.SET6*100),0) AS SET6,');
      Append('        NVL(TRUNC(XB.OUT6*100),0) AS OUT6,');
      Append('        NVL(TRUNC(XB.NOV6*100),0) AS NOV6,');
      Append('        NVL(TRUNC(XB.DEZ6*100),0) AS DEZ6,');
	  
      Append('        NVL(TRUNC(XB.JAN7*100),0) AS JAN7,');
      Append('        NVL(TRUNC(XB.FEV7*100),0) AS FEV7,');
      Append('        NVL(TRUNC(XB.MAR7*100),0) AS MAR7,');
      Append('        NVL(TRUNC(XB.ABR7*100),0) AS ABR7,');
      Append('        NVL(TRUNC(XB.MAI7*100),0) AS MAI7,');
      Append('        NVL(TRUNC(XB.JUN7*100),0) AS JUN7,');
      Append('        NVL(TRUNC(XB.JUL7*100),0) AS JUL7,');
      Append('        NVL(TRUNC(XB.AGO7*100),0) AS AGO7,');
      Append('        NVL(TRUNC(XB.SET7*100),0) AS SET7,');
      Append('        NVL(TRUNC(XB.OUT7*100),0) AS OUT7,');
      Append('        NVL(TRUNC(XB.NOV7*100),0) AS NOV7,');
      Append('        NVL(TRUNC(XB.DEZ7*100),0) AS DEZ7,');
      
      Append('        NVL(TRUNC(XB.JAN8*100),0) AS JAN8,');
      Append('        NVL(TRUNC(XB.FEV8*100),0) AS FEV8,');
      Append('        NVL(TRUNC(XB.MAR8*100),0) AS MAR8,');
      Append('        NVL(TRUNC(XB.ABR8*100),0) AS ABR8,');
      Append('        NVL(TRUNC(XB.MAI8*100),0) AS MAI8,');
      Append('        NVL(TRUNC(XB.JUN8*100),0) AS JUN8,');
      Append('        NVL(TRUNC(XB.JUL8*100),0) AS JUL8,');
      Append('        NVL(TRUNC(XB.AGO8*100),0) AS AGO8,');
      Append('        NVL(TRUNC(XB.SET8*100),0) AS SET8,');
      Append('        NVL(TRUNC(XB.OUT8*100),0) AS OUT8,');
      Append('        NVL(TRUNC(XB.NOV8*100),0) AS NOV8,');
      Append('        NVL(TRUNC(XB.DEZ8*100),0) AS DEZ8,');

      Append('        NVL(TRUNC(XB.JAN9*100),0) AS JAN9, ');
      Append('        NVL(TRUNC(XB.FEV9*100),0) AS FEV9, ');
      Append('        NVL(TRUNC(XB.MAR9*100),0) AS MAR9, ');
      Append('        NVL(TRUNC(XB.ABR9*100),0) AS ABR9, ');
      Append('        NVL(TRUNC(XB.MAI9*100),0) AS MAI9, ');
      Append('        NVL(TRUNC(XB.JUN9*100),0) AS JUN9, ');
      Append('        NVL(TRUNC(XB.JUL9*100),0) AS JUL9, ');
      Append('        NVL(TRUNC(XB.AGO9*100),0) AS AGO9, ');
      Append('        NVL(TRUNC(XB.SET9*100),0) AS SET9, ');
      Append('        NVL(TRUNC(XB.OUT9*100),0) AS OUT9, ');
      Append('        NVL(TRUNC(XB.NOV9*100),0) AS NOV9, ');
      Append('        NVL(TRUNC(XB.DEZ9*100),0) AS DEZ9, ');

      Append('        NVL(TRUNC(XB.JAN10*100),0) AS JAN10, ');
      Append('        NVL(TRUNC(XB.FEV10*100),0) AS FEV10, ');
      Append('        NVL(TRUNC(XB.MAR10*100),0) AS MAR10, ');
      Append('        NVL(TRUNC(XB.ABR10*100),0) AS ABR10, ');
      Append('        NVL(TRUNC(XB.MAI10*100),0) AS MAI10, ');
      Append('        NVL(TRUNC(XB.JUN10*100),0) AS JUN10, ');
      Append('        NVL(TRUNC(XB.JUL10*100),0) AS JUL10, ');
      Append('        NVL(TRUNC(XB.AGO10*100),0) AS AGO10, ');
      Append('        NVL(TRUNC(XB.SET10*100),0) AS SET10, ');
      Append('        NVL(TRUNC(XB.OUT10*100),0) AS OUT10, ');
      Append('        NVL(TRUNC(XB.NOV10*100),0) AS NOV10, ');
      Append('        NVL(TRUNC(XB.DEZ10*100),0) AS DEZ10, ');

      Append('        NVL(TRUNC(XB.JAN11*100),0) AS JAN11, ');
      Append('        NVL(TRUNC(XB.FEV11*100),0) AS FEV11, ');
      Append('        NVL(TRUNC(XB.MAR11*100),0) AS MAR11, ');
      Append('        NVL(TRUNC(XB.ABR11*100),0) AS ABR11, ');
      Append('        NVL(TRUNC(XB.MAI11*100),0) AS MAI11, ');
      Append('        NVL(TRUNC(XB.JUN11*100),0) AS JUN11, ');
      Append('        NVL(TRUNC(XB.JUL11*100),0) AS JUL11, ');
      Append('        NVL(TRUNC(XB.AGO11*100),0) AS AGO11, ');
      Append('        NVL(TRUNC(XB.SET11*100),0) AS SET11, ');
      Append('        NVL(TRUNC(XB.OUT11*100),0) AS OUT11, ');
      Append('        NVL(TRUNC(XB.NOV11*100),0) AS NOV11, ');
      Append('        NVL(TRUNC(XB.DEZ11*100),0) AS DEZ11, ');

      Append('        NVL(TRUNC(XB.JAN12*100),0) AS JAN12, ');
      Append('        NVL(TRUNC(XB.FEV12*100),0) AS FEV12, ');
      Append('        NVL(TRUNC(XB.MAR12*100),0) AS MAR12, ');
      Append('        NVL(TRUNC(XB.ABR12*100),0) AS ABR12, ');
      Append('        NVL(TRUNC(XB.MAI12*100),0) AS MAI12, ');
      Append('        NVL(TRUNC(XB.JUN12*100),0) AS JUN12, ');
      Append('        NVL(TRUNC(XB.JUL12*100),0) AS JUL12, ');
      Append('        NVL(TRUNC(XB.AGO12*100),0) AS AGO12, ');
      Append('        NVL(TRUNC(XB.SET12*100),0) AS SET12, ');
      Append('        NVL(TRUNC(XB.OUT12*100),0) AS OUT12, ');
      Append('        NVL(TRUNC(XB.NOV12*100),0) AS NOV12, ');
      Append('        NVL(TRUNC(XB.DEZ12*100),0) AS DEZ12, ');

      Append('        NVL(TRUNC(XB.JAN13*100),0) AS JAN13, ');
      Append('        NVL(TRUNC(XB.FEV13*100),0) AS FEV13, ');
      Append('        NVL(TRUNC(XB.MAR13*100),0) AS MAR13, ');
      Append('        NVL(TRUNC(XB.ABR13*100),0) AS ABR13, ');
      Append('        NVL(TRUNC(XB.MAI13*100),0) AS MAI13, ');
      Append('        NVL(TRUNC(XB.JUN13*100),0) AS JUN13, ');
      Append('        NVL(TRUNC(XB.JUL13*100),0) AS JUL13, ');
      Append('        NVL(TRUNC(XB.AGO13*100),0) AS AGO13, ');
      Append('        NVL(TRUNC(XB.SET13*100),0) AS SET13, ');
      Append('        NVL(TRUNC(XB.OUT13*100),0) AS OUT13, ');
      Append('        NVL(TRUNC(XB.NOV13*100),0) AS NOV13, ');
      Append('        NVL(TRUNC(XB.DEZ13*100),0) AS DEZ13, ');

      Append('        NVL(TRUNC(XB.JAN14*100),0) AS JAN14, ');
      Append('        NVL(TRUNC(XB.FEV14*100),0) AS FEV14, ');
      Append('        NVL(TRUNC(XB.MAR14*100),0) AS MAR14, ');
      Append('        NVL(TRUNC(XB.ABR14*100),0) AS ABR14, ');
      Append('        NVL(TRUNC(XB.MAI14*100),0) AS MAI14, ');
      Append('        NVL(TRUNC(XB.JUN14*100),0) AS JUN14, ');
      Append('        NVL(TRUNC(XB.JUL14*100),0) AS JUL14, ');
      Append('        NVL(TRUNC(XB.AGO14*100),0) AS AGO14, ');
      Append('        NVL(TRUNC(XB.SET14*100),0) AS SET14, ');
      Append('        NVL(TRUNC(XB.OUT14*100),0) AS OUT14, ');
      Append('        NVL(TRUNC(XB.NOV14*100),0) AS NOV14, ');
      Append('        NVL(TRUNC(XB.DEZ14*100),0) AS DEZ14, ');

      Append('        NVL(TRUNC(XB.JAN15*100),0) AS JAN15, ');
      Append('        NVL(TRUNC(XB.FEV15*100),0) AS FEV15, ');
      Append('        NVL(TRUNC(XB.MAR15*100),0) AS MAR15, ');
      Append('        NVL(TRUNC(XB.ABR15*100),0) AS ABR15, ');
      Append('        NVL(TRUNC(XB.MAI15*100),0) AS MAI15, ');
      Append('        NVL(TRUNC(XB.JUN15*100),0) AS JUN15, ');
      Append('        NVL(TRUNC(XB.JUL15*100),0) AS JUL15, ');
      Append('        NVL(TRUNC(XB.AGO15*100),0) AS AGO15, ');
      Append('        NVL(TRUNC(XB.SET15*100),0) AS SET15, ');
      Append('        NVL(TRUNC(XB.OUT15*100),0) AS OUT15, ');
      Append('        NVL(TRUNC(XB.NOV15*100),0) AS NOV15, ');
      Append('        NVL(TRUNC(XB.DEZ15*100),0) AS DEZ15, ');

      Append('        NVL(TRUNC(XB.VLR139*100), 0) AS VLR139,  ');
      Append('        NVL(TRUNC(XB.VLR1310*100),0) AS VLR1310, ');
      Append('        NVL(TRUNC(XB.VLR1311*100),0) AS VLR1311, ');
      Append('        NVL(TRUNC(XB.VLR1312*100),0) AS VLR1312, ');
      Append('        NVL(TRUNC(XB.VLR1313*100),0) AS VLR1313, ');
      Append('        NVL(TRUNC(XB.VLR1314*100),0) AS VLR1314, ');
      Append('        NVL(TRUNC(XB.VLR1315*100),0) AS VLR1315, ');
 
      Append('        NVL(TRUNC(XB.VLR134*100),0) AS VLR134,   ');
      Append('        NVL(TRUNC(XB.VLR135*100),0) AS VLR135,   ');
      Append('        NVL(TRUNC(XB.VLR136*100),0) AS VLR136,   ');
      Append('        NVL(TRUNC(XB.VLR137*100),0) AS VLR137,   ');
      Append('        NVL(TRUNC(XB.VLR138*100),0) AS VLR138    ');
      //Término - William Santana - SIG 40171

      Append('FROM PESSOA P,PESSOA E,  (SELECT U.IDBENEFIRRF, U.CODNATUREZA,');
      Append('                                 SUM(U.JAN4) AS JAN4,  SUM(U.FEV4) AS FEV4,');
      Append('                                 SUM(U.MAR4) AS MAR4,  SUM(U.ABR4) AS ABR4,');
      Append('                                 SUM(U.MAI4) AS MAI4,  SUM(U.JUN4) AS JUN4,');
      Append('                                 SUM(U.JUL4) AS JUL4,  SUM(U.AGO4) AS AGO4,');
      Append('                                 SUM(U.SET4) AS SET4,  SUM(U.OUT4) AS OUT4,');
      Append('                                 SUM(U.NOV4) AS NOV4,  SUM(U.DEZ4) AS DEZ4,');
      Append('                                 SUM(U.JAN5) AS JAN5,  SUM(U.FEV5) AS FEV5,');
      Append('                                 SUM(U.MAR5) AS MAR5,  SUM(U.ABR5) AS ABR5,');
      Append('                                 SUM(U.MAI5) AS MAI5,  SUM(U.JUN5) AS JUN5,');
      Append('                                 SUM(U.JUL5) AS JUL5,  SUM(U.AGO5) AS AGO5,');
      Append('                                 SUM(U.SET5) AS SET5,  SUM(U.OUT5) AS OUT5,');
      Append('                                 SUM(U.NOV5) AS NOV5,  SUM(U.DEZ5) AS DEZ5,');
      Append('                                 SUM(U.JAN6) AS JAN6,  SUM(U.FEV6) AS FEV6,');
      Append('                                 SUM(U.MAR6) AS MAR6,  SUM(U.ABR6) AS ABR6,');
      Append('                                 SUM(U.MAI6) AS MAI6,  SUM(U.JUN6) AS JUN6,');
      Append('                                 SUM(U.JUL6) AS JUL6,  SUM(U.AGO6) AS AGO6,');
      Append('                                 SUM(U.SET6) AS SET6,  SUM(U.OUT6) AS OUT6,');
      Append('                                 SUM(U.NOV6) AS NOV6,  SUM(U.DEZ6) AS DEZ6,');
      Append('                                 SUM(U.JAN7) AS JAN7,  SUM(U.FEV7) AS FEV7,');
      Append('                                 SUM(U.MAR7) AS MAR7,  SUM(U.ABR7) AS ABR7,');
      Append('                                 SUM(U.MAI7) AS MAI7,  SUM(U.JUN7) AS JUN7,');
      Append('                                 SUM(U.JUL7) AS JUL7,  SUM(U.AGO7) AS AGO7,');
      Append('                                 SUM(U.SET7) AS SET7,  SUM(U.OUT7) AS OUT7,');
      Append('                                 SUM(U.NOV7) AS NOV7,  SUM(U.DEZ7) AS DEZ7,');
      Append('                                 SUM(U.JAN8) AS JAN8,  SUM(U.FEV8) AS FEV8,');
      Append('                                 SUM(U.MAR8) AS MAR8,  SUM(U.ABR8) AS ABR8,');
      Append('                                 SUM(U.MAI8) AS MAI8,  SUM(U.JUN8) AS JUN8,');
      Append('                                 SUM(U.JUL8) AS JUL8,  SUM(U.AGO8) AS AGO8,');
      Append('                                 SUM(U.SET8) AS SET8,  SUM(U.OUT8) AS OUT8,');
      Append('                                 SUM(U.NOV8) AS NOV8,  SUM(U.DEZ8) AS DEZ8,');
      Append('                                 SUM(U.JAN9) AS JAN9,  SUM(U.FEV9) AS FEV9,');
      Append('                                 SUM(U.MAR9) AS MAR9,  SUM(U.ABR9) AS ABR9,');
      Append('                                 SUM(U.MAI9) AS MAI9,  SUM(U.JUN9) AS JUN9,');
      Append('                                 SUM(U.JUL9) AS JUL9,  SUM(U.AGO9) AS AGO9,');
      Append('                                 SUM(U.SET9) AS SET9,  SUM(U.OUT9) AS OUT9,');
      Append('                                 SUM(U.NOV9) AS NOV9,  SUM(U.DEZ9) AS DEZ9,');
      Append('                                 SUM(U.JAN10) AS JAN10,  SUM(U.FEV10) AS FEV10,');
      Append('                                 SUM(U.MAR10) AS MAR10,  SUM(U.ABR10) AS ABR10,');
      Append('                                 SUM(U.MAI10) AS MAI10,  SUM(U.JUN10) AS JUN10,');
      Append('                                 SUM(U.JUL10) AS JUL10,  SUM(U.AGO10) AS AGO10,');
      Append('                                 SUM(U.SET10) AS SET10,  SUM(U.OUT10) AS OUT10,');
      Append('                                 SUM(U.NOV10) AS NOV10,  SUM(U.DEZ10) AS DEZ10,');
      Append('                                 SUM(U.JAN11) AS JAN11,  SUM(U.FEV11) AS FEV11,');
      Append('                                 SUM(U.MAR11) AS MAR11,  SUM(U.ABR11) AS ABR11,');
      Append('                                 SUM(U.MAI11) AS MAI11,  SUM(U.JUN11) AS JUN11,');
      Append('                                 SUM(U.JUL11) AS JUL11,  SUM(U.AGO11) AS AGO11,');
      Append('                                 SUM(U.SET11) AS SET11,  SUM(U.OUT11) AS OUT11,');
      Append('                                 SUM(U.NOV11) AS NOV11,  SUM(U.DEZ11) AS DEZ11,');
      Append('                                 SUM(U.JAN12) AS JAN12,  SUM(U.FEV12) AS FEV12,');
      Append('                                 SUM(U.MAR12) AS MAR12,  SUM(U.ABR12) AS ABR12,');
      Append('                                 SUM(U.MAI12) AS MAI12,  SUM(U.JUN12) AS JUN12,');
      Append('                                 SUM(U.JUL12) AS JUL12,  SUM(U.AGO12) AS AGO12,');
      Append('                                 SUM(U.SET12) AS SET12,  SUM(U.OUT12) AS OUT12,');
      Append('                                 SUM(U.NOV12) AS NOV12,  SUM(U.DEZ12) AS DEZ12,');
      Append('                                 SUM(U.JAN13) AS JAN13,  SUM(U.FEV13) AS FEV13,');
      Append('                                 SUM(U.MAR13) AS MAR13,  SUM(U.ABR13) AS ABR13,');
      Append('                                 SUM(U.MAI13) AS MAI13,  SUM(U.JUN13) AS JUN13,');
      Append('                                 SUM(U.JUL13) AS JUL13,  SUM(U.AGO13) AS AGO13,');
      Append('                                 SUM(U.SET13) AS SET13,  SUM(U.OUT13) AS OUT13,');
      Append('                                 SUM(U.NOV13) AS NOV13,  SUM(U.DEZ13) AS DEZ13,');
      Append('                                 SUM(U.JAN14) AS JAN14,  SUM(U.FEV14) AS FEV14,');
      Append('                                 SUM(U.MAR14) AS MAR14,  SUM(U.ABR14) AS ABR14,');
      Append('                                 SUM(U.MAI14) AS MAI14,  SUM(U.JUN14) AS JUN14,');
      Append('                                 SUM(U.JUL14) AS JUL14,  SUM(U.AGO14) AS AGO14,');
      Append('                                 SUM(U.SET14) AS SET14,  SUM(U.OUT14) AS OUT14,');
      Append('                                 SUM(U.NOV14) AS NOV14,  SUM(U.DEZ14) AS DEZ14,');

      Append('                                 SUM(U.JAN15) AS JAN15,  SUM(U.FEV15) AS FEV15,');
      Append('                                 SUM(U.MAR15) AS MAR15,  SUM(U.ABR15) AS ABR15,');
      Append('                                 SUM(U.MAI15) AS MAI15,  SUM(U.JUN15) AS JUN15,');
      Append('                                 SUM(U.JUL15) AS JUL15,  SUM(U.AGO15) AS AGO15,');
      Append('                                 SUM(U.SET15) AS SET15,  SUM(U.OUT15) AS OUT15,');
      Append('                                 SUM(U.NOV15) AS NOV15,  SUM(U.DEZ15) AS DEZ15,');

      Append('                                 SUM(U.VLR139)  AS VLR139,');
      Append('                                 SUM(U.VLR1310) AS VLR1310,');
      Append('                                 SUM(U.VLR1311) AS VLR1311,');
      Append('                                 SUM(U.VLR1312) AS VLR1312,');
      Append('                                 SUM(U.VLR1313) AS VLR1313,');
      Append('                                 SUM(U.VLR1314) AS VLR1314,');
      Append('                                 SUM(U.VLR1315) AS VLR1315,');
      Append('                                 SUM(U.VLR134)  AS VLR134,');
      Append('                                 SUM(U.VLR135)  AS VLR135,');
      Append('                                 SUM(U.VLR136)  AS VLR136,');
      Append('                                 SUM(U.VLR137)  AS VLR137,');
      Append('                                 SUM(U.VLR138)  AS VLR138 ');

      //Marcio Sanches Spinosa SOL 219636/15413 KINTANA 2053647 inicio
  //    Append('                         FROM ((SELECT L.IDBENEFIRRF, DECODE(L.CODNATUREZA,''7416'',''0561'', ''7431'',''0561'', ''3533'', ''0561'', ''3540'', ''0561'', L.CODNATUREZA) AS CODNATUREZA, '); //XXX
      //Felipe A. Santos SOL 223584 KTN 2057497
      Append('                         FROM ((SELECT L.IDBENEFIRRF, '); // DECODE(L.CODNATUREZA,''7416'',''0561'', ''7431'',''0561'', L.CODNATUREZA) AS CODNATUREZA, '); //Marcio Sanches Spinosa SOL 219636/15413 KINTANA 2053647
      //Felipe A. Santos SOL 223584 KTN 2057497
      //Marcio Sanches Spinosa SOL 219636/15413 KINTANA 2053647 - Fim

      // Felipe A. Santos SOL 223584 KTN 2057497
      Append('                                       case ');
      Append('                                        when TO_CHAR(L.datapagamento,''YYYYMM'') <= ''201301'' then ');
      Append('                                             DECODE(L.CODNATUREZA,''7416'',''0561'', ''7431'',''0561'', L.CODNATUREZA) ');
      Append('                                        else ');
      Append('                                              DECODE(L.CODNATUREZA,''7416'',''3540'', ''7431'',''3540'', L.CODNATUREZA) ');
      Append('                                       end  CODNATUREZA, ');
      // Felipe A. Santos SOL 223584 KTN 2057497
      //Wylliam Leite da Silva - SOL:248806 PPM:1020290 - Início
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''8'',LI.VLRLANC,0),0)), 2) AS JAN4,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''8'',LI.VLRLANC,0),0)), 2) AS FEV4,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''8'',LI.VLRLANC,0),0)), 2) AS MAR4,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''8'',LI.VLRLANC,0),0)), 2) AS ABR4,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''8'',LI.VLRLANC,0),0)), 2) AS MAI4,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''8'',LI.VLRLANC,0),0)), 2) AS JUN4,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''8'',LI.VLRLANC,0),0)), 2) AS JUL4,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''8'',LI.VLRLANC,0),0)), 2) AS AGO4,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''8'',LI.VLRLANC,0),0)), 2) AS SET4,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''8'',LI.VLRLANC,0),0)), 2) AS OUT4,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''8'',LI.VLRLANC,0),0)), 2) AS NOV4,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''8'',LI.VLRLANC,0),0)), 2) AS DEZ4,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''9'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)), 2) AS JAN5,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''9'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)), 2) AS FEV5,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''9'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)), 2) AS MAR5,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''9'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)), 2) AS ABR5,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''9'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)), 2) AS MAI5,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''9'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)), 2) AS JUN5,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''9'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)), 2) AS JUL5,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''9'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)), 2) AS AGO5,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''9'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)), 2) AS SET5,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''9'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)), 2) AS OUT5,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''9'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)), 2) AS NOV5,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''9'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)), 2) AS DEZ5,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''12'',LI.VLRLANC,0),0)), 2) AS JAN6,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''12'',LI.VLRLANC,0),0)), 2) AS FEV6,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''12'',LI.VLRLANC,0),0)), 2) AS MAR6,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''12'',LI.VLRLANC,0),0)), 2) AS ABR6,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''12'',LI.VLRLANC,0),0)), 2) AS MAI6,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''12'',LI.VLRLANC,0),0)), 2) AS JUN6,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''12'',LI.VLRLANC,0),0)), 2) AS JUL6,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''12'',LI.VLRLANC,0),0)), 2) AS AGO6,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''12'',LI.VLRLANC,0),0)), 2) AS SET6,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''12'',LI.VLRLANC,0),0)), 2) AS OUT6,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''12'',LI.VLRLANC,0),0)), 2) AS NOV6,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''12'',LI.VLRLANC,0),0)), 2) AS DEZ6,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0)), 2) AS JAN7,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0)), 2) AS FEV7,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0)), 2) AS MAR7,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0)), 2) AS ABR7,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0)), 2) AS MAI7,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0)), 2) AS JUN7,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0)), 2) AS JUL7,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0)), 2) AS AGO7,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0)), 2) AS SET7,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0)), 2) AS OUT7,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0)), 2) AS NOV7,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0)), 2) AS DEZ7,');
       //Cássio Rovaroto - SIG nº 74355 - Início
      if bAcaoJudEqua then
      begin
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''14'',LI.VLRLANC,''49'', (CASE WHEN TO_CHAR(L.datapagamento,''YYYYMM'') >= ''201801'' THEN  LI.VLRLANC ELSE 0 END),0),0)), 2) AS JAN8,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''14'',LI.VLRLANC,''49'', (CASE WHEN TO_CHAR(L.datapagamento,''YYYYMM'') >= ''201801'' THEN  LI.VLRLANC ELSE 0 END),0),0)), 2) AS FEV8,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''14'',LI.VLRLANC,''49'', (CASE WHEN TO_CHAR(L.datapagamento,''YYYYMM'') >= ''201801'' THEN  LI.VLRLANC ELSE 0 END),0),0)), 2) AS MAR8,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''14'',LI.VLRLANC,''49'', (CASE WHEN TO_CHAR(L.datapagamento,''YYYYMM'') >= ''201801'' THEN  LI.VLRLANC ELSE 0 END),0),0)), 2) AS ABR8,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''14'',LI.VLRLANC,''49'', (CASE WHEN TO_CHAR(L.datapagamento,''YYYYMM'') >= ''201801'' THEN  LI.VLRLANC ELSE 0 END),0),0)), 2) AS MAI8,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''14'',LI.VLRLANC,''49'', (CASE WHEN TO_CHAR(L.datapagamento,''YYYYMM'') >= ''201801'' THEN  LI.VLRLANC ELSE 0 END),0),0)), 2) AS JUN8,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''14'',LI.VLRLANC,''49'', (CASE WHEN TO_CHAR(L.datapagamento,''YYYYMM'') >= ''201801'' THEN  LI.VLRLANC ELSE 0 END),0),0)), 2) AS JUL8,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''14'',LI.VLRLANC,''49'', (CASE WHEN TO_CHAR(L.datapagamento,''YYYYMM'') >= ''201801'' THEN  LI.VLRLANC ELSE 0 END),0),0)), 2) AS AGO8,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''14'',LI.VLRLANC,''49'', (CASE WHEN TO_CHAR(L.datapagamento,''YYYYMM'') >= ''201801'' THEN  LI.VLRLANC ELSE 0 END),0),0)), 2) AS SET8,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''14'',LI.VLRLANC,''49'', (CASE WHEN TO_CHAR(L.datapagamento,''YYYYMM'') >= ''201801'' THEN  LI.VLRLANC ELSE 0 END),0),0)), 2) AS OUT8,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''14'',LI.VLRLANC,''49'', (CASE WHEN TO_CHAR(L.datapagamento,''YYYYMM'') >= ''201801'' THEN  LI.VLRLANC ELSE 0 END),0),0)), 2) AS NOV8,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''14'',LI.VLRLANC,''49'', (CASE WHEN TO_CHAR(L.datapagamento,''YYYYMM'') >= ''201801'' THEN  LI.VLRLANC ELSE 0 END),0),0)), 2) AS DEZ8,');
      end
      else
      begin
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''14'',LI.VLRLANC,0),0)), 2) AS JAN8,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''14'',LI.VLRLANC,0),0)), 2) AS FEV8,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''14'',LI.VLRLANC,0),0)), 2) AS MAR8,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''14'',LI.VLRLANC,0),0)), 2) AS ABR8,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''14'',LI.VLRLANC,0),0)), 2) AS MAI8,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''14'',LI.VLRLANC,0),0)), 2) AS JUN8,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''14'',LI.VLRLANC,0),0)), 2) AS JUL8,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''14'',LI.VLRLANC,0),0)), 2) AS AGO8,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''14'',LI.VLRLANC,0),0)), 2) AS SET8,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''14'',LI.VLRLANC,0),0)), 2) AS OUT8,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''14'',LI.VLRLANC,0),0)), 2) AS NOV8,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''14'',LI.VLRLANC,0),0)), 2) AS DEZ8,');
      end;
      //Cássio Rovaroto - SIG nº 74355 - Fim
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''26'',LI.VLRLANC,0),0)), 2) AS JAN9,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''26'',LI.VLRLANC,0),0)), 2) AS FEV9,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''26'',LI.VLRLANC,0),0)), 2) AS MAR9,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''26'',LI.VLRLANC,0),0)), 2) AS ABR9,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''26'',LI.VLRLANC,0),0)), 2) AS MAI9,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''26'',LI.VLRLANC,0),0)), 2) AS JUN9,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''26'',LI.VLRLANC,0),0)), 2) AS JUL9,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''26'',LI.VLRLANC,0),0)), 2) AS AGO9,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''26'',LI.VLRLANC,0),0)), 2) AS SET9,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''26'',LI.VLRLANC,0),0)), 2) AS OUT9,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''26'',LI.VLRLANC,0),0)), 2) AS NOV9,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''26'',LI.VLRLANC,0),0)), 2) AS DEZ9,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''27'',LI.VLRLANC,0),0)), 2) AS JAN10,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''27'',LI.VLRLANC,0),0)), 2) AS FEV10,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''27'',LI.VLRLANC,0),0)), 2) AS MAR10,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''27'',LI.VLRLANC,0),0)), 2) AS ABR10,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''27'',LI.VLRLANC,0),0)), 2) AS MAI10,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''27'',LI.VLRLANC,0),0)), 2) AS JUN10,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''27'',LI.VLRLANC,0),0)), 2) AS JUL10,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''27'',LI.VLRLANC,0),0)), 2) AS AGO10,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''27'',LI.VLRLANC,0),0)), 2) AS SET10,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''27'',LI.VLRLANC,0),0)), 2) AS OUT10,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''27'',LI.VLRLANC,0),0)), 2) AS NOV10,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''27'',LI.VLRLANC,0),0)), 2) AS DEZ10,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''28'',LI.VLRLANC,0),0)), 2) AS JAN11,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''28'',LI.VLRLANC,0),0)), 2) AS FEV11,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''28'',LI.VLRLANC,0),0)), 2) AS MAR11,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''28'',LI.VLRLANC,0),0)), 2) AS ABR11,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''28'',LI.VLRLANC,0),0)), 2) AS MAI11,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''28'',LI.VLRLANC,0),0)), 2) AS JUN11,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''28'',LI.VLRLANC,0),0)), 2) AS JUL11,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''28'',LI.VLRLANC,0),0)), 2) AS AGO11,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''28'',LI.VLRLANC,0),0)), 2) AS SET11,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''28'',LI.VLRLANC,0),0)), 2) AS OUT11,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''28'',LI.VLRLANC,0),0)), 2) AS NOV11,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''28'',LI.VLRLANC,0),0)), 2) AS DEZ11,');
    //Cássio Rovaroto - SIG nº 74355 - Início
      if bAcaoJudEqua then
      begin
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''29'',LI.VLRLANC,''48'', (CASE WHEN TO_CHAR(L.datapagamento,''YYYYMM'') >= ''201801'' THEN  LI.VLRLANC ELSE 0 END),0),0)), 2) AS JAN12,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''29'',LI.VLRLANC,''48'', (CASE WHEN TO_CHAR(L.datapagamento,''YYYYMM'') >= ''201801'' THEN  LI.VLRLANC ELSE 0 END),0),0)), 2) AS FEV12,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''29'',LI.VLRLANC,''48'', (CASE WHEN TO_CHAR(L.datapagamento,''YYYYMM'') >= ''201801'' THEN  LI.VLRLANC ELSE 0 END),0),0)), 2) AS MAR12,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''29'',LI.VLRLANC,''48'', (CASE WHEN TO_CHAR(L.datapagamento,''YYYYMM'') >= ''201801'' THEN  LI.VLRLANC ELSE 0 END),0),0)), 2) AS ABR12,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''29'',LI.VLRLANC,''48'', (CASE WHEN TO_CHAR(L.datapagamento,''YYYYMM'') >= ''201801'' THEN  LI.VLRLANC ELSE 0 END),0),0)), 2) AS MAI12,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''29'',LI.VLRLANC,''48'', (CASE WHEN TO_CHAR(L.datapagamento,''YYYYMM'') >= ''201801'' THEN  LI.VLRLANC ELSE 0 END),0),0)), 2) AS JUN12,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''29'',LI.VLRLANC,''48'', (CASE WHEN TO_CHAR(L.datapagamento,''YYYYMM'') >= ''201801'' THEN  LI.VLRLANC ELSE 0 END),0),0)), 2) AS JUL12,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''29'',LI.VLRLANC,''48'', (CASE WHEN TO_CHAR(L.datapagamento,''YYYYMM'') >= ''201801'' THEN  LI.VLRLANC ELSE 0 END),0),0)), 2) AS AGO12,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''29'',LI.VLRLANC,''48'', (CASE WHEN TO_CHAR(L.datapagamento,''YYYYMM'') >= ''201801'' THEN  LI.VLRLANC ELSE 0 END),0),0)), 2) AS SET12,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''29'',LI.VLRLANC,''48'', (CASE WHEN TO_CHAR(L.datapagamento,''YYYYMM'') >= ''201801'' THEN  LI.VLRLANC ELSE 0 END),0),0)), 2) AS OUT12,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''29'',LI.VLRLANC,''48'', (CASE WHEN TO_CHAR(L.datapagamento,''YYYYMM'') >= ''201801'' THEN  LI.VLRLANC ELSE 0 END),0),0)), 2) AS NOV12,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''29'',LI.VLRLANC,''48'', (CASE WHEN TO_CHAR(L.datapagamento,''YYYYMM'') >= ''201801'' THEN  LI.VLRLANC ELSE 0 END),0),0)), 2) AS DEZ12,');
      end
      else
      begin
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''29'',LI.VLRLANC,0),0)), 2) AS JAN12,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''29'',LI.VLRLANC,0),0)), 2) AS FEV12,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''29'',LI.VLRLANC,0),0)), 2) AS MAR12,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''29'',LI.VLRLANC,0),0)), 2) AS ABR12,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''29'',LI.VLRLANC,0),0)), 2) AS MAI12,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''29'',LI.VLRLANC,0),0)), 2) AS JUN12,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''29'',LI.VLRLANC,0),0)), 2) AS JUL12,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''29'',LI.VLRLANC,0),0)), 2) AS AGO12,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''29'',LI.VLRLANC,0),0)), 2) AS SET12,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''29'',LI.VLRLANC,0),0)), 2) AS OUT12,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''29'',LI.VLRLANC,0),0)), 2) AS NOV12,');
        Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''29'',LI.VLRLANC,0),0)), 2) AS DEZ12,');
      end;
      //Cássio Rovaroto - SIG nº 74355 - Fim
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''34'',LI.VLRLANC,0),0)), 2) AS JAN13,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''34'',LI.VLRLANC,0),0)), 2) AS FEV13,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''34'',LI.VLRLANC,0),0)), 2) AS MAR13,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''34'',LI.VLRLANC,0),0)), 2) AS ABR13,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''34'',LI.VLRLANC,0),0)), 2) AS MAI13,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''34'',LI.VLRLANC,0),0)), 2) AS JUN13,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''34'',LI.VLRLANC,0),0)), 2) AS JUL13,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''34'',LI.VLRLANC,0),0)), 2) AS AGO13,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''34'',LI.VLRLANC,0),0)), 2) AS SET13,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''34'',LI.VLRLANC,0),0)), 2) AS OUT13,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''34'',LI.VLRLANC,0),0)), 2) AS NOV13,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''34'',LI.VLRLANC,0),0)), 2) AS DEZ13,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''35'',LI.VLRLANC,0),0)), 2) AS JAN14,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''35'',LI.VLRLANC,0),0)), 2) AS FEV14,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''35'',LI.VLRLANC,0),0)), 2) AS MAR14,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''35'',LI.VLRLANC,0),0)), 2) AS ABR14,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''35'',LI.VLRLANC,0),0)), 2) AS MAI14,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''35'',LI.VLRLANC,0),0)), 2) AS JUN14,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''35'',LI.VLRLANC,0),0)), 2) AS JUL14,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''35'',LI.VLRLANC,0),0)), 2) AS AGO14,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''35'',LI.VLRLANC,0),0)), 2) AS SET14,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''35'',LI.VLRLANC,0),0)), 2) AS OUT14,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''35'',LI.VLRLANC,0),0)), 2) AS NOV14,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''35'',LI.VLRLANC,0),0)), 2) AS DEZ14,');

      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''36'',LI.VLRLANC,0),0)), 2) AS JAN15,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''36'',LI.VLRLANC,0),0)), 2) AS FEV15,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''36'',LI.VLRLANC,0),0)), 2) AS MAR15,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''36'',LI.VLRLANC,0),0)), 2) AS ABR15,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''36'',LI.VLRLANC,0),0)), 2) AS MAI15,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''36'',LI.VLRLANC,0),0)), 2) AS JUN15,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''36'',LI.VLRLANC,0),0)), 2) AS JUL15,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''36'',LI.VLRLANC,0),0)), 2) AS AGO15,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''36'',LI.VLRLANC,0),0)), 2) AS SET15,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''36'',LI.VLRLANC,0),0)), 2) AS OUT15,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''36'',LI.VLRLANC,0),0)), 2) AS NOV15,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''36'',LI.VLRLANC,0),0)), 2) AS DEZ15,');
      //Wylliam Leite da Silva - SOL:248806 PPM:1020290 - Fim
      Append('                                       SUM(DECODE(I.CODDIRF,''10'',LI.VLRLANC,0)) AS VLR134,');
      Append('                                       SUM(DECODE(I.CODDIRF,''11'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0)) AS VLR135,');
      Append('                                       SUM(DECODE(I.CODDIRF,''15'',LI.VLRLANC,0)) AS VLR136,');
      Append('                                       SUM(DECODE(I.CODDIRF,''16'',LI.VLRLANC,0)) AS VLR137,');
      //Cássio Rovaroto - SIG nº 74355 - Início
      if bAcaoJudEqua then
        Append('                                       SUM(DECODE(I.CODDIRF,''17'',LI.VLRLANC, ''51'',(CASE WHEN TO_CHAR(L.datapagamento,''YYYYMM'') >= ''201801'' THEN  LI.VLRLANC ELSE 0 END),0)) AS VLR138,')
      else
        Append('                                       SUM(DECODE(I.CODDIRF,''17'',LI.VLRLANC,0)) AS VLR138,');
      //Cássio Rovaroto - SIG nº 74355 - Fim

      Append('                                       SUM(DECODE(I.CODDIRF,''30'',LI.VLRLANC,0)) AS VLR139,');

      Append('                                       SUM(DECODE(I.CODDIRF,''31'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0)) AS VLR1310,');
      Append('                                       SUM(DECODE(I.CODDIRF,''32'',LI.VLRLANC,0)) AS VLR1311,');
      //Cássio Rovaroto - SIG nº 74355 - Início
      if bAcaoJudEqua then
        Append('                                       SUM(DECODE(I.CODDIRF,''33'',LI.VLRLANC, ''50'',(CASE WHEN TO_CHAR(L.datapagamento,''YYYYMM'') >= ''201801'' THEN  LI.VLRLANC ELSE 0 END),0)) AS VLR1312,')
      else
        Append('                                       SUM(DECODE(I.CODDIRF,''33'',LI.VLRLANC,0)) AS VLR1312,');
      //Cássio Rovaroto - SIG nº 74355 - Fim
      Append('                                       0 as VLR1313,');
      Append('                                       0 as VLR1314,');
      Append('                                       0 as VLR1315');

      Append('                                   FROM INFORME I, LANCXINFORME LI, LANCIRRF L, NATURENDIMENTO N                                                ');
      Append('                                  WHERE (L.datapagamento BETWEEN TO_DATE(' + quotedStr(DataIni) + ',''DD/MM/YYYY'') AND TO_DATE(' + quotedStr(DataFim) + ',''DD/MM/YYYY''))  ');
      Append('                                    AND (L.IDLANCIRRF = LI.IDLANCIRRF)                                                                          ');
      Append('                                    AND (L.CODNATUREZA = N.CODNATUREZA)                                                                         ');
      Append('                                    AND (LI.IDINFORME = I.IDINFORME)                                                                            ');

      If (iSistema = 0) Then
        Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 21) ')
      Else If (iSistema = 1) Then
        Begin
          Append(' AND (L.IDMODULO = 18) ');
          //      Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 18) ')
          If sCPFFIltro <> '' Then
            Append(' AND (L.IDBENEFIRRF  IN ( SELECT IDPESSOA FROM PESSOA P WHERE P.NUMDOCUMENTO IN (' + sCPFFiltro + ')))');

        End
      Else If (iSistema = 2) Then
        Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 3) ');

      Append('                                    AND (N.FLGUSADONADIRF = ' + QuotedStr('S') + ')');
      Append('                                    AND (I.CODDIRF <> 1)');

      ////Marcio Sanches Spinosa SOL 219636/15413 KINTANA 2053647 - Inicio
  //    Append('GROUP BY L.IDBENEFIRRF, DECODE(L.CODNATUREZA,''7416'',''0561'', ''7431'',''0561'', ''3533'', ''0561'', ''3540'', ''0561'',  L.CODNATUREZA)) '); //XXX
      //Append('GROUP BY L.IDBENEFIRRF, DECODE(L.CODNATUREZA,''7416'',''0561'', ''7431'',''0561'',  L.CODNATUREZA)) '); // Felipe A. Santos SOL 223584 KTN 2057497
      Append('GROUP BY L.IDBENEFIRRF, L.DATAPAGAMENTO, L.CODNATUREZA)'); // Felipe A. Santos SOL 223584 KTN 2057497
      ////Marcio Sanches Spinosa SOL 219636/15413 KINTANA 2053647 - Fim
      Append(') U                         ');
      Append('GROUP BY U.IDBENEFIRRF, U.CODNATUREZA');
      Append(' ) XB');
      Append('WHERE  (XB.IDBENEFIRRF = P.IDPESSOA)');
      Append(' AND  (E.IDPESSOA = ' + IntToStr(IdPessoa) + ') ');
      Append('AND  ( ((XB.JAN4 + XB.FEV4 + XB.MAR4 + XB.ABR4 + XB.MAI4 +');
      Append('        XB.JUN4 + XB.JUL4 + XB.AGO4 + XB.SET4 + XB.OUT4 +');
      Append('        XB.NOV4 + XB.DEZ4 + XB.VLR134) <> 0 )');
      Append('   OR ((XB.JAN5 + XB.FEV5 + XB.MAR5 + XB.ABR5 + XB.MAI5 +');
      Append('        XB.JUN5 + XB.JUL5 + XB.AGO5 + XB.SET5 + XB.OUT5 +');
      Append('        XB.NOV5 + XB.DEZ5 + XB.VLR135) <> 0 )');
      Append('   OR ((XB.JAN6 + XB.FEV6 + XB.MAR6 + XB.ABR6 + XB.MAI6 +');
      Append('        XB.JUN6 + XB.JUL6 + XB.AGO6 + XB.SET6 + XB.OUT6 +');
      Append('        XB.NOV6 + XB.DEZ6 + XB.VLR136) <> 0 )');
      Append('   OR ((XB.JAN7 + XB.FEV7 + XB.MAR7 + XB.ABR7 + XB.MAI7 +');
      Append('        XB.JUN7 + XB.JUL7 + XB.AGO7 + XB.SET7 + XB.OUT7 +');
      Append('        XB.NOV7 + XB.DEZ7 + XB.VLR137) <> 0 )');
      Append('   OR ((XB.JAN8 + XB.FEV8 + XB.MAR8 + XB.ABR8 + XB.MAI8 +');
      Append('        XB.JUN8 + XB.JUL8 + XB.AGO8 + XB.SET8 + XB.OUT8 +');
      Append('        XB.NOV8 + XB.DEZ8 + XB.VLR138) <> 0 )');

      //CPrev - Pend. 27026 - Início
      Append('   OR ((XB.JAN9 + XB.FEV9 + XB.MAR9 + XB.ABR9 + XB.MAI9 + ');
      Append('        XB.JUN9 + XB.JUL9 + XB.AGO9 + XB.SET9 + XB.OUT9 + ');
      Append('        XB.NOV9 + XB.DEZ9 + XB.VLR139) <> 0 ) ');
      Append('   OR ((XB.JAN10 + XB.FEV10 + XB.MAR10 + XB.ABR10 + XB.MAI10 + ');
      Append('        XB.JUN10 + XB.JUL10 + XB.AGO10 + XB.SET10 + XB.OUT10 + ');
      Append('        XB.NOV10 + XB.DEZ10 + XB.VLR1310) <> 0 ) ');
      Append('   OR ((XB.JAN11 + XB.FEV11 + XB.MAR11 + XB.ABR11 + XB.MAI11 + ');
      Append('        XB.JUN11 + XB.JUL11 + XB.AGO11 + XB.SET11 + XB.OUT11 + ');
      Append('        XB.NOV11 + XB.DEZ11 + XB.VLR1311) <> 0 ) ');
      Append('   OR ((XB.JAN12 + XB.FEV12 + XB.MAR12 + XB.ABR12 + XB.MAI12 + ');
      Append('        XB.JUN12 + XB.JUL12 + XB.AGO12 + XB.SET12 + XB.OUT12 + ');
      Append('        XB.NOV12 + XB.DEZ12 + XB.VLR1312) <> 0 ) ');
      Append('   OR ((XB.JAN13 + XB.FEV13 + XB.MAR13 + XB.ABR13 + XB.MAI13 + ');
      Append('        XB.JUN13 + XB.JUL13 + XB.AGO13 + XB.SET13 + XB.OUT13 + ');
      Append('        XB.NOV13 + XB.DEZ13 + XB.VLR1313) <> 0 ) ');
      Append('   OR ((XB.JAN14 + XB.FEV14 + XB.MAR14 + XB.ABR14 + XB.MAI14 + ');
      Append('        XB.JUN14 + XB.JUL14 + XB.AGO14 + XB.SET14 + XB.OUT14 + ');
      Append('        XB.NOV14 + XB.DEZ14 + XB.VLR1314) <> 0 ) ');
      Append('   OR ((XB.JAN15 + XB.FEV15 + XB.MAR15 + XB.ABR15 + XB.MAI15 + ');
      Append('        XB.JUN15 + XB.JUL15 + XB.AGO15 + XB.SET15 + XB.OUT15 + ');
      Append('        XB.NOV15 + XB.DEZ15 + XB.VLR1315) <> 0 )) ');
      //CPrev - Pend. 27026 - Fim
      If sCPFFIltro <> '' Then
        Append(' AND (P.NUMDOCUMENTO IN (' + sCPFFiltro + '))');

      Append('ORDER BY CODNATUREZA, NOMEBENEF, P.TIPO, CGCBENEF');
    End;

  //sSql.Text := 'SELECT TIPO, CGCBENEF,CGCEMPRE,NOMEEMPRE,CODNATUREZA,' + #13#10 +                  //Arnaldo - WO13395
  sSqlHeader := 'SELECT TIPO, CGCBENEF,CGCEMPRE,NOMEEMPRE,CODNATUREZA,' + #13#10 +                   //Arnaldo - WO13395
                '       SUM(JAN4) AS JAN4, SUM(FEV4) AS FEV4, SUM(MAR4) AS MAR4,' + #13#10 +
                '       SUM(ABR4) AS ABR4, SUM(MAI4) AS MAI4, SUM(JUN4) AS JUN4,' + #13#10 +
                '       SUM(JUL4) AS JUL4, SUM(AGO4) AS AGO4, SUM(SET4) AS SET4,' + #13#10 +
                '       SUM(OUT4) AS OUT4, SUM(NOV4) AS NOV4, SUM(DEZ4) AS DEZ4,' + #13#10 +
                '       SUM(JAN5) AS JAN5, SUM(FEV5) AS FEV5, SUM(MAR5) AS MAR5,' + #13#10 +
                '       SUM(ABR5) AS ABR5, SUM(MAI5) AS MAI5, SUM(JUN5) AS JUN5,' + #13#10 +
                '       SUM(JUL5) AS JUL5, SUM(AGO5) AS AGO5, SUM(SET5) AS SET5,' + #13#10 +
                '       SUM(OUT5) AS OUT5, SUM(NOV5) AS NOV5, SUM(DEZ5) AS DEZ5,' + #13#10 +
                '       SUM(JAN6) AS JAN6, SUM(FEV6) AS FEV6, SUM(MAR6) AS MAR6,' + #13#10 +
                '       SUM(ABR6) AS ABR6, SUM(MAI6) AS MAI6, SUM(JUN6) AS JUN6,' + #13#10 +
                '       SUM(JUL6) AS JUL6, SUM(AGO6) AS AGO6, SUM(SET6) AS SET6,' + #13#10 +
                '       SUM(OUT6) AS OUT6, SUM(NOV6) AS NOV6, SUM(DEZ6) AS DEZ6,' + #13#10 +
                '       SUM(JAN7) AS JAN7, SUM(FEV7) AS FEV7, SUM(MAR7) AS MAR7,' + #13#10 +
                '       SUM(ABR7) AS ABR7, SUM(MAI7) AS MAI7, SUM(JUN7) AS JUN7,' + #13#10 +
                '       SUM(JUL7) AS JUL7, SUM(AGO7) AS AGO7, SUM(SET7) AS SET7,' + #13#10 +
                '       SUM(OUT7) AS OUT7, SUM(NOV7) AS NOV7, SUM(DEZ7) AS DEZ7,' + #13#10 +
                '       SUM(JAN8) AS JAN8, SUM(FEV8) AS FEV8, SUM(MAR8) AS MAR8,' + #13#10 +
                '       SUM(ABR8) AS ABR8, SUM(MAI8) AS MAI8, SUM(JUN8) AS JUN8,' + #13#10 +
                '       SUM(JUL8) AS JUL8, SUM(AGO8) AS AGO8, SUM(SET8) AS SET8,' + #13#10 +
                '       SUM(OUT8) AS OUT8, SUM(NOV8) AS NOV8, SUM(DEZ8) AS DEZ8,' + #13#10 +
                '       SUM(JAN9) AS JAN9, SUM(FEV9) AS FEV9, SUM(MAR9) AS MAR9,' + #13#10 +
                '       SUM(ABR9) AS ABR9, SUM(MAI9) AS MAI9, SUM(JUN9) AS JUN9,' + #13#10 +
                '       SUM(JUL9) AS JUL9, SUM(AGO9) AS AGO9, SUM(SET9) AS SET9,' + #13#10 +
                '       SUM(OUT9) AS OUT9, SUM(NOV9) AS NOV9, SUM(DEZ9) AS DEZ9,' + #13#10 +
                '       SUM(JAN10) AS JAN10, SUM(FEV10) AS FEV10, SUM(MAR10) AS MAR10,' + #13#10 +
                '       SUM(ABR10) AS ABR10, SUM(MAI10) AS MAI10, SUM(JUN10) AS JUN10,' + #13#10 +
                '       SUM(JUL10) AS JUL10, SUM(AGO10) AS AGO10, SUM(SET10) AS SET10,' + #13#10 +
                '       SUM(OUT10) AS OUT10, SUM(NOV10) AS NOV10, SUM(DEZ10) AS DEZ10,' + #13#10 +
                '       SUM(JAN11) AS JAN11, SUM(FEV11) AS FEV11, SUM(MAR11) AS MAR11,' + #13#10 +
                '       SUM(ABR11) AS ABR11, SUM(MAI11) AS MAI11, SUM(JUN11) AS JUN11,' + #13#10 +
                '       SUM(JUL11) AS JUL11, SUM(AGO11) AS AGO11, SUM(SET11) AS SET11,' + #13#10 +
                '       SUM(OUT11) AS OUT11, SUM(NOV11) AS NOV11, SUM(DEZ11) AS DEZ11,' + #13#10 +
                '       SUM(JAN12) AS JAN12, SUM(FEV12) AS FEV12, SUM(MAR12) AS MAR12,' + #13#10 +
                '       SUM(ABR12) AS ABR12, SUM(MAI12) AS MAI12, SUM(JUN12) AS JUN12,' + #13#10 +
                '       SUM(JUL12) AS JUL12, SUM(AGO12) AS AGO12, SUM(SET12) AS SET12,' + #13#10 +
                '       SUM(OUT12) AS OUT12, SUM(NOV12) AS NOV12, SUM(DEZ12) AS DEZ12,' + #13#10 +
                '       SUM(JAN13) AS JAN13, SUM(FEV13) AS FEV13, SUM(MAR13) AS MAR13,' + #13#10 +
                '       SUM(ABR13) AS ABR13, SUM(MAI13) AS MAI13, SUM(JUN13) AS JUN13,' + #13#10 +
                '       SUM(JUL13) AS JUL13, SUM(AGO13) AS AGO13, SUM(SET13) AS SET13,' + #13#10 +
                '       SUM(OUT13) AS OUT13, SUM(NOV13) AS NOV13, SUM(DEZ13) AS DEZ13,' + #13#10 +
                '       SUM(JAN14) AS JAN14, SUM(FEV14) AS FEV14, SUM(MAR14) AS MAR14,' + #13#10 +
                '       SUM(ABR14) AS ABR14, SUM(MAI14) AS MAI14, SUM(JUN14) AS JUN14,' + #13#10 +
                '       SUM(JUL14) AS JUL14, SUM(AGO14) AS AGO14, SUM(SET14) AS SET14,' + #13#10 +
                '       SUM(OUT14) AS OUT14, SUM(NOV14) AS NOV14, SUM(DEZ14) AS DEZ14,' + #13#10 +
                '       SUM(JAN15) AS JAN15, SUM(FEV15) AS FEV15, SUM(MAR15) AS MAR15,' + #13#10 +
                '       SUM(ABR15) AS ABR15, SUM(MAI15) AS MAI15, SUM(JUN15) AS JUN15,' + #13#10 +
                '       SUM(JUL15) AS JUL15, SUM(AGO15) AS AGO15, SUM(SET15) AS SET15,' + #13#10 +
                '       SUM(OUT15) AS OUT15, SUM(NOV15) AS NOV15, SUM(DEZ15) AS DEZ15,' + #13#10 +
                '       SUM(VLR134)  AS VLR134,  SUM(VLR135)  AS VLR135,  SUM(VLR136)  AS VLR136,' + #13#10 +
                '       SUM(VLR137)  AS VLR137,  SUM(VLR138)  AS VLR138,  SUM(VLR139)  AS VLR139,' + #13#10 +
                '       SUM(VLR1310) AS VLR1310, SUM(VLR1311) AS VLR1311, SUM(VLR1312) AS VLR1312,' + #13#10 +
                '       SUM(VLR1313) AS VLR1313, SUM(VLR1314) AS VLR1314, SUM(VLR1315) AS VLR1315' + #13#10 +
                //'FROM (' + sSql.Text + ') P' + #13#10 +                                           //Arnaldo - WO13395
                'FROM (';                                                                           //Arnaldo - WO13395
    sSql.Text := sSqlHeader + sSql.Text + ') P' + #13#10 +                                          //Arnaldo - WO13395
                 'GROUP BY TIPO, CGCBENEF,CGCEMPRE,NOMEEMPRE, CODNATUREZA' + #13#10 +
                 'Order By tipo,codnatureza,cgcbenef';

   //Início - William Santana - SIG 40171
   //sSql.Text := ' SELECT TIPO, CGCBENEF,CGCEMPRE,NOMEEMPRE,CODNATUREZA, '+ #13#10 +               //Arnaldo - WO13395
   sSqlHeader := ' SELECT TIPO, CGCBENEF,CGCEMPRE,NOMEEMPRE,CODNATUREZA, '+ #13#10 +                //Arnaldo - WO13395
                 '        DECODE(SIGN(JAN4),-1,0,JAN4) AS JAN4, DECODE(SIGN(FEV4),-1,0,FEV4) AS FEV4, DECODE(SIGN(MAR4),-1,0,MAR4) AS MAR4,' + #13#10 +
                 '        DECODE(SIGN(ABR4),-1,0,ABR4) AS ABR4, DECODE(SIGN(MAI4),-1,0,MAI4) AS MAI4, DECODE(SIGN(JUN4),-1,0,JUN4) AS JUN4,' + #13#10 +
                 '        DECODE(SIGN(JUL4),-1,0,JUL4) AS JUL4, DECODE(SIGN(AGO4),-1,0,AGO4) AS AGO4, DECODE(SIGN(SET4),-1,0,SET4) AS SET4,' + #13#10 +
                 '        DECODE(SIGN(OUT4),-1,0,OUT4) AS OUT4, DECODE(SIGN(NOV4),-1,0,NOV4) AS NOV4, DECODE(SIGN(DEZ4),-1,0,DEZ4) AS DEZ4,' + #13#10 +
                 '        DECODE(SIGN(JAN5),-1,0,JAN5) AS JAN5, DECODE(SIGN(FEV5),-1,0,FEV5) AS FEV5, DECODE(SIGN(MAR5),-1,0,MAR5) AS MAR5,' + #13#10 +
                 '        DECODE(SIGN(ABR5),-1,0,ABR5) AS ABR5, DECODE(SIGN(MAI5),-1,0,MAI5) AS MAI5, DECODE(SIGN(JUN5),-1,0,JUN5) AS JUN5,' + #13#10 +
                 '        DECODE(SIGN(JUL5),-1,0,JUL5) AS JUL5, DECODE(SIGN(AGO5),-1,0,AGO5) AS AGO5, DECODE(SIGN(SET5),-1,0,SET5) AS SET5,' + #13#10 +
                 '        DECODE(SIGN(OUT5),-1,0,OUT5) AS OUT5, DECODE(SIGN(NOV5),-1,0,NOV5) AS NOV5, DECODE(SIGN(DEZ5),-1,0,DEZ5) AS DEZ5,' + #13#10 +
                 '        DECODE(SIGN(JAN6),-1,0,JAN6) AS JAN6, DECODE(SIGN(FEV6),-1,0,FEV6) AS FEV6, DECODE(SIGN(MAR6),-1,0,MAR6) AS MAR6,' + #13#10 +
                 '        DECODE(SIGN(ABR6),-1,0,ABR6) AS ABR6, DECODE(SIGN(MAI6),-1,0,MAI6) AS MAI6, DECODE(SIGN(JUN6),-1,0,JUN6) AS JUN6,' + #13#10 +
                 '        DECODE(SIGN(JUL6),-1,0,JUL6) AS JUL6, DECODE(SIGN(AGO6),-1,0,AGO6) AS AGO6, DECODE(SIGN(SET6),-1,0,SET6) AS SET6,' + #13#10 +
                 '        DECODE(SIGN(OUT6),-1,0,OUT6) AS OUT6, DECODE(SIGN(NOV6),-1,0,NOV6) AS NOV6, DECODE(SIGN(DEZ6),-1,0,DEZ6) AS DEZ6,' + #13#10 +
                 '        DECODE(SIGN(JAN7),-1,0,JAN7) AS JAN7, DECODE(SIGN(FEV7),-1,0,FEV7) AS FEV7, DECODE(SIGN(MAR7),-1,0,MAR7) AS MAR7,' + #13#10 +
                 '        DECODE(SIGN(ABR7),-1,0,ABR7) AS ABR7, DECODE(SIGN(MAI7),-1,0,MAI7) AS MAI7, DECODE(SIGN(JUN7),-1,0,JUN7) AS JUN7,' + #13#10 +
                 '        DECODE(SIGN(JUL7),-1,0,JUL7) AS JUL7, DECODE(SIGN(AGO7),-1,0,AGO7) AS AGO7, DECODE(SIGN(SET7),-1,0,SET7) AS SET7,' + #13#10 +
                 '        DECODE(SIGN(OUT7),-1,0,OUT7) AS OUT7, DECODE(SIGN(NOV7),-1,0,NOV7) AS NOV7, DECODE(SIGN(DEZ7),-1,0,DEZ7) AS DEZ7,' + #13#10 +
                 '        DECODE(SIGN(JAN8),-1,0,JAN8) AS JAN8, DECODE(SIGN(FEV8),-1,0,FEV8) AS FEV8, DECODE(SIGN(MAR8),-1,0,MAR8) AS MAR8,' + #13#10 +
                 '        DECODE(SIGN(ABR8),-1,0,ABR8) AS ABR8, DECODE(SIGN(MAI8),-1,0,MAI8) AS MAI8, DECODE(SIGN(JUN8),-1,0,JUN8) AS JUN8,' + #13#10 +
                 '        DECODE(SIGN(JUL8),-1,0,JUL8) AS JUL8, DECODE(SIGN(AGO8),-1,0,AGO8) AS AGO8, DECODE(SIGN(SET8),-1,0,SET8) AS SET8,' + #13#10 +
                 '        DECODE(SIGN(OUT8),-1,0,OUT8) AS OUT8, DECODE(SIGN(NOV8),-1,0,NOV8) AS NOV8, DECODE(SIGN(DEZ8),-1,0,DEZ8) AS DEZ8,' + #13#10 +
                 '        DECODE(SIGN(JAN9),-1,0,JAN9) AS JAN9, DECODE(SIGN(FEV9),-1,0,FEV9) AS FEV9, DECODE(SIGN(MAR9),-1,0,MAR9) AS MAR9,' + #13#10 +
                 '        DECODE(SIGN(ABR9),-1,0,ABR9) AS ABR9, DECODE(SIGN(MAI9),-1,0,MAI9) AS MAI9, DECODE(SIGN(JUN9),-1,0,JUN9) AS JUN9,' + #13#10 +
                 '        DECODE(SIGN(JUL9),-1,0,JUL9) AS JUL9, DECODE(SIGN(AGO9),-1,0,AGO9) AS AGO9, DECODE(SIGN(SET9),-1,0,SET9) AS SET9,' + #13#10 +
                 '        DECODE(SIGN(OUT9),-1,0,OUT9) AS OUT9, DECODE(SIGN(NOV9),-1,0,NOV9) AS NOV9, DECODE(SIGN(DEZ9),-1,0,DEZ9) AS DEZ9,' + #13#10 +
                 '        DECODE(SIGN(JAN10),-1,0,JAN10) AS JAN10, DECODE(SIGN(FEV10),-1,0,FEV10) AS FEV10, DECODE(SIGN(MAR10),-1,0,MAR10) AS MAR10,' + #13#10 +
                 '        DECODE(SIGN(ABR10),-1,0,ABR10) AS ABR10, DECODE(SIGN(MAI10),-1,0,MAI10) AS MAI10, DECODE(SIGN(JUN10),-1,0,JUN10) AS JUN10,' + #13#10 +
                 '        DECODE(SIGN(JUL10),-1,0,JUL10) AS JUL10, DECODE(SIGN(AGO10),-1,0,AGO10) AS AGO10, DECODE(SIGN(SET10),-1,0,SET10) AS SET10,' + #13#10 +
                 '        DECODE(SIGN(OUT10),-1,0,OUT10) AS OUT10, DECODE(SIGN(NOV10),-1,0,NOV10) AS NOV10, DECODE(SIGN(DEZ10),-1,0,DEZ10) AS DEZ10,' + #13#10 +
                 '        DECODE(SIGN(JAN11),-1,0,JAN11) AS JAN11, DECODE(SIGN(FEV11),-1,0,FEV11) AS FEV11, DECODE(SIGN(MAR11),-1,0,MAR11) AS MAR11,' + #13#10 +
                 '        DECODE(SIGN(ABR11),-1,0,ABR11) AS ABR11, DECODE(SIGN(MAI11),-1,0,MAI11) AS MAI11, DECODE(SIGN(JUN11),-1,0,JUN11) AS JUN11,' + #13#10 +
                 '        DECODE(SIGN (JUL11),-1,0,JUL11) AS JUL11, DECODE(SIGN(AGO11),-1,0,AGO11) AS AGO11, DECODE(SIGN(SET11),-1,0,SET11) AS SET11,' + #13#10 +
                 '        DECODE(SIGN (OUT11),-1,0,OUT11) AS OUT11, DECODE(SIGN(NOV11),-1,0,NOV11) AS NOV11, DECODE(SIGN(DEZ11),-1,0,DEZ11) AS DEZ11,' + #13#10 +
                 '        DECODE(SIGN (JAN12),-1,0,JAN12) AS JAN12, DECODE(SIGN(FEV12),-1,0,FEV12) AS FEV12, DECODE(SIGN(MAR12),-1,0,MAR12) AS MAR12,' + #13#10 +
                 '        DECODE(SIGN (ABR12),-1,0,ABR12) AS ABR12, DECODE(SIGN(MAI12),-1,0,MAI12) AS MAI12, DECODE(SIGN(JUN12),-1,0,JUN12) AS JUN12,' + #13#10 +
                 '        DECODE(SIGN (JUL12),-1,0,JUL12) AS JUL12, DECODE(SIGN(AGO12),-1,0,AGO12) AS AGO12, DECODE(SIGN(SET12),-1,0,SET12) AS SET12,' + #13#10 +
                 '        DECODE(SIGN (OUT12),-1,0,OUT12) AS OUT12, DECODE(SIGN(NOV12),-1,0,NOV12) AS NOV12, DECODE(SIGN(DEZ12),-1,0,DEZ12) AS DEZ12,' + #13#10 +
                 '        DECODE(SIGN (JAN13),-1,0,JAN13) AS JAN13, DECODE(SIGN(FEV13),-1,0,FEV13) AS FEV13, DECODE(SIGN(MAR13),-1,0,MAR13) AS MAR13,' + #13#10 +
                 '        DECODE(SIGN (ABR13),-1,0,ABR13) AS ABR13, DECODE(SIGN(MAI13),-1,0,MAI13) AS MAI13, DECODE(SIGN(JUN13),-1,0,JUN13) AS JUN13,' + #13#10 +
                 '        DECODE(SIGN (JUL13),-1,0,JUL13) AS JUL13, DECODE(SIGN(AGO13),-1,0,AGO13) AS AGO13, DECODE(SIGN(SET13),-1,0,SET13) AS SET13,' + #13#10 +
                 '        DECODE(SIGN (OUT13),-1,0,OUT13) AS OUT13, DECODE(SIGN(NOV13),-1,0,NOV13) AS NOV13, DECODE(SIGN(DEZ13),-1,0,DEZ13) AS DEZ13,' + #13#10 +
                 '        DECODE(SIGN (JAN14),-1,0,JAN14) AS JAN14, DECODE(SIGN(FEV14),-1,0,FEV14) AS FEV14, DECODE(SIGN(MAR14),-1,0,MAR14) AS MAR14,' + #13#10 +
                 '        DECODE(SIGN (ABR14),-1,0,ABR14) AS ABR14, DECODE(SIGN(MAI14),-1,0,MAI14) AS MAI14, DECODE(SIGN(JUN14),-1,0,JUN14) AS JUN14,' + #13#10 +
                 '        DECODE(SIGN (JUL14),-1,0,JUL14) AS JUL14, DECODE(SIGN(AGO14),-1,0,AGO14) AS AGO14, DECODE(SIGN(SET14),-1,0,SET14) AS SET14,' + #13#10 +
                 '        DECODE(SIGN (OUT14),-1,0,OUT14) AS OUT14, DECODE(SIGN(NOV14),-1,0,NOV14) AS NOV14, DECODE(SIGN(DEZ14),-1,0,DEZ14) AS DEZ14,' + #13#10 +
                 '        DECODE(SIGN (JAN15),-1,0,JAN15) AS JAN15, DECODE(SIGN(FEV15),-1,0,FEV15) AS FEV15, DECODE(SIGN(MAR15),-1,0,MAR15) AS MAR15,' + #13#10 +
                 '        DECODE(SIGN (ABR15),-1,0,ABR15) AS ABR15, DECODE(SIGN(MAI15),-1,0,MAI15) AS MAI15, DECODE(SIGN(JUN15),-1,0,JUN15) AS JUN15,' + #13#10 +
                 '        DECODE(SIGN (JUL15),-1,0,JUL15) AS JUL15, DECODE(SIGN(AGO15),-1,0,AGO15) AS AGO15, DECODE(SIGN(SET15),-1,0,SET15) AS SET15,' + #13#10 +
                 '        DECODE(SIGN (OUT15),-1,0,OUT15) AS OUT15, DECODE(SIGN(NOV15),-1,0,NOV15) AS NOV15, DECODE(SIGN(DEZ15),-1,0,DEZ15) AS DEZ15,' + #13#10 +
                 '        DECODE(SIGN (VLR134),-1,0,VLR134)  AS VLR134,  DECODE(SIGN(VLR135),-1,0,VLR135)  AS VLR135,  DECODE(SIGN(VLR136),-1,0,VLR136)  AS VLR136,' + #13#10 +
                 '        DECODE(SIGN (VLR137),-1,0,VLR137)  AS VLR137,  DECODE(SIGN(VLR138),-1,0,VLR138)  AS VLR138,  DECODE(SIGN(VLR139),-1,0,VLR139)  AS VLR139,' + #13#10 +
                 '        DECODE(SIGN (VLR1310),-1,0,VLR1310) AS VLR1310, DECODE(SIGN(VLR1311),-1,0,VLR1311) AS VLR1311, DECODE(SIGN(VLR1312),-1,0,VLR1312) AS VLR1312,' + #13#10 +
                 '        DECODE(SIGN (VLR1313),-1,0,VLR1313) AS VLR1313, DECODE(SIGN(VLR1314),-1,0,VLR1314) AS VLR1314, DECODE(SIGN(VLR1315),-1,0,VLR1315) AS VLR1315' + #13#10 +
                 //'FROM (' + sSql.Text + ') T';                                                       //Arnaldo - WO13395
                 'FROM (';                                                                             //Arnaldo - WO13395

  sSql.Text := sSqlHeader + sSql.Text + ') T';                                                         //Arnaldo - WO13395
    //Término - Wi lliam Santana - SIG 40171

  sSql.SaveToFile( Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\QueryDirfSuspensa2011.txt');

  Result := GetDataPacket(sSql);
  sSql.Clear;                                                                                          //Arnaldo - WO13395
  FreeAndNil(sSql);                                                                                    //Arnaldo - WO13395
End;

Function TCtrlGeraDirfNova.ListResponsavel(IdPessoa: Integer): OleVariant;
Var
  Ssql: String;
Begin
  Ssql := 'SELECT   P.RAZAOSOCIAL, P.NUMDOCUMENTO, EN.LOGRADOURO AS ENDEREO,  P.TIPO, P.EMAIL, ' +
    '         EN.NUMERO,  EN.COMPLEMENTO,  EN.BAIRRO,  C.NOME AS CIDADE,  EN.CEP, ' +
    '         REPLACE(REPLACE(REPLACE(TF.NUMERO, ''-''), ''(''), '')'') AS FAX, ' +
    '         ES.CODESTADO AS UF, REPLACE(REPLACE(REPLACE(T.NUMERO, ''-''), ''(''), '')'') AS TELEFONE, T.DDD ' +
    '  FROM  PESSOA P, ENDPESS EN, CIDADES C, ESTADO ES, (SELECT DISTINCT IDENDERECO, TIPO, NUMERO, DDD FROM TELENDPESS) T, ' +
    '        (SELECT IDENDERECO, Numero, Tipo, MAX(IDTELEFONE) AS IDTELEFONE ' +
    '           FROM TELENDPESS GROUP BY IDENDERECO, NUMERO, TIPO) TF ' +
    ' WHERE (P.IDPESSOA = ' + IntToStr(IdPessoa) + ') AND ' +
    '       (EN.IDENDERECO(+) = P.IDENDCOMERCIAL) AND ' +
    '       (EN.IDCIDADES     = C.IDCIDADES(+)) AND ' +
    '       (ES.IDESTADO(+)    = C.IDESTADO) AND ' +
    '       (EN.IDPESSOA(+)   = P.IDPESSOA) AND ' +
    '       (EN.IDENDERECO = T.IDENDERECO(+)) AND' +
    '       (EN.IDENDERECO = TF.IDENDERECO(+))';
  Result := GetDataPacket(Ssql);
End;

Procedure TCtrlGeraDirfNova.ListToText(lista: tstringlist; sNomeArquivo: String);
Var
  ToF: File;
  indice, i, J: Integer;
  sLinha: String; //Marilza Colpani-SOL 125645/KTN 649749
  Buf: Array[1..732] Of Char;
Begin
  indice := 0;
  AssignFile(ToF, sNomeArquivo);
  Rewrite(ToF, 1);
  For J := 0 To lista.count - 1 Do
    Begin
      If lista <> Nil Then
        Begin
          sLinha := CaracteresEspeciais(lista[J]); //Marilza Colpani-SOL 125645/KTN 649749
          For i := 1 To 730 Do
            buf[i] := sLinha[i];
          buf[731] := #13;
          buf[732] := #10;
          BlockWrite(ToF, Buf, sizeof(buf));
          inc(indice)
        End;
    End;
  CloseFile(ToF);
End;

Function TCtrlGeraDirfNova.DataUltimoBeneficioRecebido5565(Const pCpf: String): String;
Begin
  Result := 'NOV';
End;

Function TCtrlGeraDirfNova.DataMolestiaGrave(Const pCpf, pAno: String): String;
Var sSql: String;
  oSql: TClientDataSet;
Begin
  Result := '';
  sSql := 'Select PF.DATAMOLESTIAGRAVE,' + #13#10 +
    '       PF.DATAFIMMOLESTIA' + #13#10 +
    '  FROM PESSOA P, PESSOAFISICA PF' + #13#10 +
    ' WHERE P.IDPESSOA = PF.IDPESSOA' + #13#10 +
    '   AND P.NUMDOCUMENTO = ' + QuotedStr(pCPF);
  oSql := TClientDataSet.Create(Nil);
  Try
    oSql.Data := GetDataPacket(sSql);
    If oSql.FieldByName('DATAMOLESTIAGRAVE').asString <> '' Then
      Result := FormatDateTime('YYYYMMDD', oSql.FieldByName('DATAMOLESTIAGRAVE').asDateTime);

    If Result = '' Then
      Begin
        oSql.Close;
        sSql := 'Select HST.DTInicio,' + #13#10 +
          '       HST.DTFinal' + #13#10 +
          '  FROM PESSOA P, HSTMOLESTIAGRAVE HST' + #13#10 +
          ' WHERE P.IDPESSOA = HST.IDPESSOA' + #13#10 +
          '   AND P.NUMDOCUMENTO = ' + QuotedStr(pCPF);
        oSql.Data := GetDataPacket(sSql);
        oSql.First;
        While Not oSql.Eof Do
          Begin
            // Periodo -> 01/05/2010 à 31/05/2010
            // Molestia Grave 1o. Caso -> 01/03/2010 ate 31/12/2010
            //                2o. Caso -> 15/05/2010 ate 31/12/2010
            //                3o. Caso -> 01/03/2010 até Agora (null)
            //                4o. Caso -> 15/05/2010 até Agora (null)
            //                5o. Caso -> 01/04/2010 ate 15/05/2010
            //                6o. Caso -> 15/05/2010 até 25/05/2010
            If ((oSql.FieldByName('DTInicio').asDateTime <= StrToDate('31/12/' + pAno)) And
              ((oSql.FieldByName('DTFinal').asDateTime >= StrToDate('01/01/' + pAno)) Or
              oSql.FieldByName('DTFinal').isNull)) Then
              Begin
                Result := FormatDateTime('YYYYMMDD', oSql.FieldByName('DTINICIO').asDateTime); ;
                break;
              End;
            oSql.Next;
          End;
      End;
  Finally
    oSql.Close;
    FreeAndNil(oSql);
  End;
End;

Procedure TCtrlGeraDirfNova.GRegDadosPrincipais(Const pArquivo: TextFile;
  Const pAno,
  pAnoRef,
  pSEI,
  pNumeroRecibo: String;
  Const pNaturDeclar: Integer;
  meuCDS: Integer = 1 {1 = Cds, 2=CdsEst - Darivaldo Alencar SIG 28411}
  );
Var sLinha: String;
    qryAux: Twwquery;   // Andre Imakawa - SIG 52685
    sDDD, sTEL: String; // Andre Imakawa - SIG 52685
    sLayout : string;   //edilaine SIG134189
Begin
  // Linha de cabeçalho da Dirf
  sLinha := 'DIRF|' +
    pAnoRef + '|' +
    pAno + '|' +
    pSEI + '|' +
    pNumeroRecibo + '|';

  sLayout := GetVersaoLeiaute(pAno);

  // edilaine SIG134189 : inicio
  if sLayout = '' then
  begin
   //Cássio Rovaroto - SIGº 76691 - Início
   if StrToInt(pAno) >= StrToInt('2018') then
     sLinha := sLinha + 'T17BS45|'
   else
   //Cássio Rovaroto - SIGº 76691 - Início

     //Andre Imakawa - SIG 61321 - Inicio
     If strToInt(pAno) >= strToInt('2017') Then
       sLinha := sLinha + 'Q84FV63|'
     else
     //Andre Imakawa - SIG 61321 - Fim

       //Darivaldo Alencar SIG 34429 -inicio
       If strToInt(pAno) >= strToInt('2016') Then
          sLinha := sLinha + 'P49VS72|'
       else
       //Darivaldo Alencar SIG 34429 -fim
          // Paulo Nobre - SOL 269300 PPM 1293033
          If strToInt(pAno) >= strToInt('2015') Then //Fernando Xavier - SOL 267779 PPM 1243444
             sLinha := sLinha + 'L35QJS2|'
          Else //Fernando Xavier - SOL 267779 PPM 1243444
             //William Moreira da Silva - SOL 199072 Kintana 1915767
             If strToInt(pAno) >= strToInt('2012') Then
                sLinha := sLinha + 'M1LB5V2|'        // Paulo SOL243508/16869 PPM 630406
             Else
                sLinha := sLinha + '1A4MA1R|'; //MUDANÇA DA STRING PARA INDICAR QUE O ARQUIVO É REFERENTE AO LAYOUT NOVO
  end
  else
    sLinha := sLinha + sLayout + '|';
  // edilaine SIG134189 : fim

  WriteLn(pArquivo, sLinha);

  // Linha do Responsavel

  // Andre Imakawa - SIG 52685 - Inicio
  qryAux := Twwquery.Create(Nil);
  qryAux.DataBaseName := 'BaseDados';
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Clear;
  qryAux.SQL.add('SELECT P.IDPESSOA,                                      ');
  qryAux.SQL.add('   P.NUMDOCUMENTO CPF,                                  ');
  qryAux.SQL.add('   P.NOME,                                              ');
  qryAux.SQL.add('   T.DDD,                                               ');
  qryAux.SQL.add('   T.NUMERO,                                            ');
  qryAux.SQL.add('   P.EMAIL                                              ');
  qryAux.SQL.add('   FROM PESSOA P, ENDPESS E, TELENDPESS T               ');
  qryAux.SQL.add('   WHERE P.IDPESSOA = 1                                 ');
  qryAux.SQL.add('   And P.IDPESSOA = E.IDPESSOA (+)                      ');
  qryAux.SQL.add('   And E.IDENDERECO = T.IDENDERECO (+)                  ');
  qryAux.SQL.add('   And T.IDTELEFONE = (SELECT MAX(T1.IDTELEFONE)FROM TELENDPESS T1 WHERE T.IDENDERECO = T1.IDENDERECO)');
  qryAux.Open;
  If Not (qryAux.isempty) Then
    Begin
      sDDD := qryAux.fieldbyname('DDD').asString;
      sTEL := qryAux.fieldbyname('NUMERO').asString;
    End
  Else
    Begin
      sDDD := CdsResponsavel.fieldByname('DDD').AsString;
      sTEL := CdsResponsavel.fieldByname('TELEFONE').AsString;
    end;
  FreeAndNil(qryAux);
  // Andre Imakawa - SIG 52685 - Fim

  //Marcio Sanches Spinosa SOL 223465 KINTANA 2058652 - Inicio
  If (strToInt(pAno) <= strToInt('2012')) Then
    sLinha := 'RESPO|' +
      CompletaZero(Copy(CdsResponsavel.fieldByname('NUMDOCUMENTO').AsString, 1, 11), 11) + '|' + // CPF
    Completa(CdsResponsavel.fieldByname('RAZAOSOCIAL').AsString, 60) + '|' + // Nome
    CompletaZero(Copy(sDDD, 1, 4), 2) + '|' + // DDD                            // Andre Imakawa - SIG 52685
    CompletaZeroDireita(Copy(sTEL, 1, 8), 8) + '|' + // Telefone                       // Andre Imakawa - SIG 52685
    '|' + // Ramal
    CompletaZeroDireita(Copy(sTEL, 1, 8), 8) + '|' // Fax                              // Andre Imakawa - SIG 52685
  Else
    sLinha := 'RESPO|' +
      CompletaZero(Copy(CdsResponsavel.fieldByname('NUMDOCUMENTO').AsString, 1, 11), 11) + '|' + // CPF
    Completa(CdsResponsavel.fieldByname('RAZAOSOCIAL').AsString, 60) + '|' + // Nome
    CompletaZero(Copy(sDDD, 1, 4), 2) + '|' + // DDD                            // Andre Imakawa - SIG 52685
    CompletaZeroDireita(Copy(sTEL, 1, 9), 9) + '|' + // Telefone                       // Andre Imakawa - SIG 52685
    '|' + // Ramal
    CompletaZeroDireita(Copy(sTEL, 1, 9), 9) + '|'; // Fax                             // Andre Imakawa - SIG 52685
  //Marcio Sanches Spinosa SOL 223465 KINTANA 2058652 - fim
    // Tratamento de Erro - Retirar Caracteres Especiais
  sLinha := CaracteresEspeciais(sLinha);
  sLinha := sLinha + Completa(Copy(CdsResponsavel.fieldByname('EMAIL').AsString, 1, 50), 50) + '|'; // eMail / Marcio Sanches Spinosa SOL 223465 KINTANA 2058652
  WriteLn(pArquivo, sLinha);


  // Linha da Empresa
  //Darivaldo Alencar SIG 28411 -inicio
  //sLinha := 'DECPJ|' + // Decl.PJ
  //CompletaZero(Cds.fieldByname('CGCEMPRE').AsString, 14) + '|' + // CNPJ
  //Completa(Cds.fieldByname('NOMEEMPRE').AsString, 150) + '|' +
  sLinha := 'DECPJ|'; // Decl.PJ
  if (meuCDS = 1) then begin
  //Darivaldo Alencar SIG 28411 -fim
      sLinha:= sLinha + CompletaZero(Cds.fieldByname('CGCEMPRE').AsString, 14) + '|'+ // CNPJ
                        Completa(Cds.fieldByname('NOMEEMPRE').AsString, 150) + '|'; // Nome
  //Darivaldo Alencar SIG 28411 -inicio
    end
  else begin
     sLinha:= sLinha + CompletaZero(CdsEst.fieldByname('CGCEMPRE').AsString, 14) + '|'+ // CNPJ
                       Completa(CdsEst.fieldByname('NOMEEMPRE').AsString, 150) + '|'; // Nome
  end;
  sLinha := sLinha +
  //Darivaldo Alencar SIG 28411-fim

  IntToStr(pNaturDeclar) + '|' + // Natureza
  CompletaZero(Copy(CdsResponsavel.fieldByname('NUMDOCUMENTO').AsString, 1, 11), 11) + '|'; // CPF Resp.
  //Andre Imakawa - SIG 61321 - Inicio
  If strToInt(pAno) >= strToInt('2017') Then
     sLinha := sLinha + 'N|S|N|S|S|N|N|N||'
  else
  //Andre Imakawa - SIG 61321 - Fim

  //Darivaldo Alencar SIG 34429 -inicio
  If strToInt(pAno) >= strToInt('2016') Then
     sLinha := sLinha + 'N|S|N|S|S|N|N||'
  else
  //Darivaldo Alencar SIG 34429 -fim

  // Fernando Xavier
  If strToInt(pAno) >= strToInt('2015') Then //Fernando Xavier - SOL 267779 PPM 1243444
     sLinha := sLinha + 'N|S|N|N|S|N|N|N||'
  else //Fernando Xavier - SOL 267779 PPM 1243444
  //William Moreira da Silva - SOL 199072 Kintana 1915767
  If strToInt(pAno) >= strToInt('2012') Then
    sLinha := sLinha + 'N|S|N|N|S|N|N||'
  Else
    sLinha := sLinha + 'N|S|N|N|S|N||';
  //William Moreira da Silva - SOL 199072 Kintana 1915767

// Tratamento de Erro - Retirar Caracteres Especiais
  sLinha := CaracteresEspeciais(sLinha);
  WriteLn(pArquivo, sLinha);
End;

Procedure TCtrlGeraDirfNova.GRegNatureza(Var pGeraNovaNatureza: Boolean;
  Const pArquivo: TextFile;
  Const sNatureza: String); // Edilaine - SOL 198116 / KTN 1914302
Begin
  If (pGeraNovaNatureza) then     
    Begin
      pGeraNovaNatureza := False;
      WriteLn(pArquivo, 'IDREC|' +
        //CompletaZero(Cds.fieldByname('CODNATUREZA').AsString,4)+'|');   // Edilaine - SOL 198116 / KTN 1914302 - comentado
        CompletaZero(sNatureza, 4) + '|'); // Edilaine - SOL 198116 / KTN 1914302
    End;
End;

Function TCtrlGeraDirfNova.BuscaNome(Const pCPFBenef: String): String;
Var oSql: TClientDataSet;
  sNome: String; //Vinicius Maciel SOL 170987 KTN 1528710
Begin
  oSql := TCLientDataSet.Create(Nil);
  Try
    //Vinicius Maciel SOL 170987 KTN 1528710
    //ROTINA ALTERADA PARA QUE NÃO VENHA EM BRANCO UM BENEFICIÁRIO COM * NO FINAL DO NOME
    oSql.Data := GetDataPacket('Select Nome from pessoa where numdocumento = ' + QuotedStr(pCPFBenef) + #13#10 +
      ' and Nome not like ''%*%''');
    sNome := oSql.FieldByName('Nome').asString;
    If ((sNome = '') And ((pCPFBenef <> ''))) Then
      Begin
        oSql.Data := GetDataPacket('Select Nome from pessoa where numdocumento = ' + QuotedStr(pCPFBenef));
        sNome := ajustaCaracteresNome(oSql.FieldByName('Nome').asString);
      End;
    //Result := oSql.FieldByName('Nome').asString;
    Result := sNome;
    //Vinicius Maciel SOL 170987 KTN 1528710 - FIM
  Finally
    oSql.Close;
    FreeAndNil(oSql);
  End;

End;


//edilaine SIG97214 : inicio
procedure TCtrlGeraDirfNova.GeraRTPA(pAno, sCodNatureza : String; var sLinha : string);
begin
  sLinha := '';
  if (pAno >= '2017') then
  Begin
    if not (Cds.IsEmpty) then
       PossuiValorRTPA(Cds, '2', sCodNatureza, sLinha, True);
  end;
end;

procedure TCtrlGeraDirfNova.GRegBeneficiario(sLinha : string;
  Const pCPFBeneficiario,
  pAno: String;
  Var pGravaDadosBeneficiario: Boolean;
  Const pArquivo: TextFile;
  Const sCodNatureza: String);
begin
  if sLinha <> '' then
  begin
    GRegBeneficiario(pCPFBeneficiario, pAno, pGravaDadosBeneficiario, pArquivo, sCodNatureza);
    WriteLn(pArquivo, sLinha);
  end;
end;


Function TCtrlGeraDirfNova.ValidaListaNatureza(sCodNatureza : string) : boolean;
begin
  result := lstInsNatureza.IndexOf(sCodNatureza) <> -1;

  if (not Result) then
     lstInsNatureza.Add(sCodNatureza);
end;


Procedure TCtrlGeraDirfNova.GRegNatureza(const pArquivo: TextFile; sNatureza: String);
Begin
  If (not ValidaListaNatureza(sNatureza)) then
     WriteLn(pArquivo, 'IDREC|' + CompletaZero(sNatureza, 4) + '|');
End;
//edilaine SIG97214 : fim


Function TCtrlGeraDirfNova.GRegBeneficiario(Const pCPFBeneficiario,
  pAno: String;
  Var pGravaDadosBeneficiario: Boolean;
  Const pArquivo: TextFile;
  Const sCodNatureza: String): String;  // Andre Imakawa - SIG 61321
Var sLinha: String;
  vNomeBeneficiario: String;
  strTesteLinha: String;
  bRTPP: Boolean;       // Andre Imakawa - SIG 61321
  //sLinhaRTPA: string;   // Andre Imakawa - SIG 61321          //edilaine SIG97214
Begin
  GRegNatureza(pArquivo, sCodNatureza);     //edilaine - SIG97214

  If pGravaDadosBeneficiario Then
    Begin
      vNomeBeneficiario := BuscaNome(pCPFBeneficiario);
      pGravaDadosBeneficiario := False;
      bLancaLinhaRIO := True;  // Andre Imakawa - SIG 62774
      If Cds.fieldByname('TIPO').AsString = 'J' Then
        sLinha := 'BPJDEC|' +
          CompletaZero(pCPFBeneficiario, 14) + '|' +
          vNomeBeneficiario + '|'
      Else
        sLinha := 'BPFDEC|' +
          CompletaZero(pCPFBeneficiario, 11) + '|' +
          Completa(vNomeBeneficiario, 60) + '|';
      If (sCodNatureza <> '3223') And (sCodNatureza <> '5565') And (sCodNatureza <> '0588')
        And (sCodNatureza <> '3556') And (sCodNatureza <> '3579') Then //Marcio Sanches Spinosa SOL 223465 KINTANA 2058652
        Begin
          strTesteLinha := copy(sLinha, length(sLinha), 1);
          If (strTesteLinha <> '|') Then
            sLinha := sLinha {+ DataMolestiaGrave(pCPFBeneficiario,pAno)} + '|' //Vinicius Maciel SOL 159558 Kintana 1395659
            //Marcio Sanches Spinosa SOL 223465 KINTANA 2058652 - Inicio
            //Marcio Sanches Spinosa SOL 216222 KINTANA 2045931 - Inicio
          Else
            sLinha := sLinha + '|';
          //Marcio Sanches Spinosa SOL 216222 KINTANA 2045931 - Fim
          //Marcio Sanches Spinosa SOL 223465 KINTANA 2058652 - Fim
      // Tratamento de Erro - Retirar Caracteres Especiais
        End
      Else
        Begin
          sLinha := sLinha {+ DataMolestiaGrave(pCPFBeneficiario,pAno)} + '|'; //Marcio Sanches Spinosa SOL 216222 KINTANA 2045931
        End;
      // Andre Imakawa - SIG 61321 - Inicio
      if (pAno >= '2017') then
      Begin
        if not (Cds.IsEmpty) then
        begin

          //PossuiValorRTPA(Cds, '2', sCodNatureza, sLinhaRTPA, True);             //edilaine SIG97214
          if sLinhaRTPA <> EmptyStr then
            sLinha := sLinha + 'S|'
          else
           sLinha := sLinha + 'N|';

          bRTPP :=  PossuiValorCds(Cds,'1', '2', sCodNatureza, True);
          if bRTPP then
            sLinha := sLinha + 'S|'
          else
            sLinha := sLinha + 'N|';
        end;
      end;
      // Andre Imakawa - SIG 61321 - Fim
      sLinha := CaracteresEspeciais(sLinha);
      WriteLn(pArquivo, sLinha);

      //edilaine SIG97214 : inicio
      {// Andre Imakawa - SIG 61321 - Inicio
      if (pAno >= '2017') then
        Result := sLinhaRTPA
      else
        Result := '';
      // Andre Imakawa - SIG 61321 - Fim
      }//edilaine SIG97214 : fim

    End;            
End;

Procedure TCtrlGeraDirfNova.GRegCompensacaoImpostoAnoAnterior(Const pArquivo: TextFile;
  Const pCodNatureza: String;
  Const sCGCBenef,
  sAno: String;
  Var bGravaDadosBeneficiario: Boolean);
Begin
  // Verifica se tem compensação judicial para ser gerado o arquivo
  If (CdsJudicial.FieldByName('JAN6').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('FEV6').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('MAR6').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('ABR6').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('MAI6').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('JUN6').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('JUL6').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('AGO6').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('SET6').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('OUT6').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('NOV6').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('DEZ6').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('VLR136').AsFloat <> 0) Then
    Begin
      GRegBeneficiario(sCGCBenef, sAno, bGravaDadosBeneficiario, pArquivo, pCodNatureza);
      GravaLinhaValores(pArquivo, 'CJAA', '6', pCodNatureza, CdsJudicial);
    End;
End;

Procedure TCtrlGeraDirfNova.GRegCompensacaoImpostoAnoAtual(Const pArquivo: TextFile;
  Const pCodNatureza: String;
  Const sCGCBenef,
  sAno: String;
  Var bGravaDadosBeneficiario: Boolean);
Begin
  // Verifica se tem compensação judicial para ser gerado o arquivo
  If (CdsJudicial.FieldByName('JAN4').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('FEV4').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('MAR4').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('ABR4').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('MAI4').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('JUN4').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('JUL4').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('AGO4').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('SET4').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('OUT4').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('NOV4').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('DEZ4').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('VLR134').AsFloat <> 0) Then
    Begin
      GRegBeneficiario(sCGCBenef, sAno, bGravaDadosBeneficiario, pArquivo, pCodNatureza);
      GravaLinhaValores(pArquivo, 'CJAC', '4', pCodNatureza, CdsJudicial);
    End;
End;

Procedure TCtrlGeraDirfNova.GRegDeducoesDependentes(Const pArquivo: TextFile;
  Const pCodNatureza: String;
  Const sCGCBenef,
  sAno: String;
  Var bGravaDadosBeneficiario: Boolean);
Begin
  { if (CdsJudicial.FieldByName('JAN10').AsFloat   <> 0) or
       (CdsJudicial.FieldByName('FEV10').AsFloat   <> 0) or
       (CdsJudicial.FieldByName('MAR10').AsFloat   <> 0) or
       (CdsJudicial.FieldByName('ABR10').AsFloat   <> 0) or
       (CdsJudicial.FieldByName('MAI10').AsFloat   <> 0) or
       (CdsJudicial.FieldByName('JUN10').AsFloat   <> 0) or
       (CdsJudicial.FieldByName('JUL10').AsFloat   <> 0) or
       (CdsJudicial.FieldByName('AGO10').AsFloat   <> 0) or
       (CdsJudicial.FieldByName('SET10').AsFloat   <> 0) or
       (CdsJudicial.FieldByName('OUT10').AsFloat   <> 0) or
       (CdsJudicial.FieldByName('NOV10').AsFloat   <> 0) or
       (CdsJudicial.FieldByName('DEZ10').AsFloat   <> 0) or
       (CdsJudicial.FieldByName('VLR1310').AsFloat <> 0) then
    Begin
      GRegBeneficiario(sCGCBenef,sAno,bGravaDadosBeneficiario,pArquivo,pCodNatureza);
      GravaLinhaValores(pArquivo,'ESDP','10','0561',CdsJudicial);
    end; }
End;

Procedure TCtrlGeraDirfNova.GRegDeducoesPensaoAlimenticia(Const pArquivo: TextFile;
  Const pCodNatureza: String;
  Const sCGCBenef,
  sAno: String;
  Var bGravaDadosBeneficiario: Boolean);
Begin
    //Marcio Sanches - SOL 248634 PPM 735735 - Inicio
 {   if (CdsJudicial.FieldByName('JAN11').AsFloat   <> 0) or
       (CdsJudicial.FieldByName('FEV11').AsFloat   <> 0) or
       (CdsJudicial.FieldByName('MAR11').AsFloat   <> 0) or
       (CdsJudicial.FieldByName('ABR11').AsFloat   <> 0) or
       (CdsJudicial.FieldByName('MAI11').AsFloat   <> 0) or
       (CdsJudicial.FieldByName('JUN11').AsFloat   <> 0) or
       (CdsJudicial.FieldByName('JUL11').AsFloat   <> 0) or
       (CdsJudicial.FieldByName('AGO11').AsFloat   <> 0) or
       (CdsJudicial.FieldByName('SET11').AsFloat   <> 0) or
       (CdsJudicial.FieldByName('OUT11').AsFloat   <> 0) or
       (CdsJudicial.FieldByName('NOV11').AsFloat   <> 0) or
       (CdsJudicial.FieldByName('DEZ11').AsFloat   <> 0) or
       (CdsJudicial.FieldByName('VLR1311').AsFloat <> 0) then
    Begin
      GRegBeneficiario(sCGCBenef,sAno,bGravaDadosBeneficiario,pArquivo,pCodNatureza);
      //Wylliam Leite da Silva - SOL 249269 PPM 737170 - Inicio
      if (pCodNatureza <> '') and (pCodNatureza <> '3540') then
         GravaLinhaValores(pArquivo,'RTPA','11',pCodNatureza,CdsJudicial);
      //else
          //GravaLinhaValores(pArquivo,'ESPA','11','0561',CdsJudicial);
      //Wylliam Leite da Silva - SOL 249269 PPM 737170 - Fim
    end;
    //Marcio Sanches - SOL 248634 PPM 735735 - Fim                }
End;

Procedure TCtrlGeraDirfNova.GRegDeducoesPrevidenciaOficial(Const pArquivo: TextFile;
  Const pCodNatureza: String;
  Const sCGCBenef,
  sAno: String;
  Var bGravaDadosBeneficiario: Boolean);
Begin
  If (CdsJudicial.FieldByName('JAN9').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('FEV9').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('MAR9').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('ABR9').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('MAI9').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('JUN9').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('JUL9').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('AGO9').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('SET9').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('OUT9').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('NOV9').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('DEZ9').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('VLR139').AsFloat <> 0) Then
    Begin
      GRegBeneficiario(sCGCBenef, sAno, bGravaDadosBeneficiario, pArquivo, pCodNatureza);
      GravaLinhaValores(pArquivo, 'ESPO', '9', '0561', CdsJudicial);
    End;
End;

Procedure TCtrlGeraDirfNova.GRegDeducoesPrevidenciaPrivada(Const pArquivo: TextFile;
  Const pCodNatureza: String;
  Const sCGCBenef,
  sAno: String;
  Var bGravaDadosBeneficiario: Boolean);
Begin
  If (CdsJudicial.FieldByName('JAN12').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('FEV12').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('MAR12').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('ABR12').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('MAI12').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('JUN12').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('JUL12').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('AGO12').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('SET12').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('OUT12').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('NOV12').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('DEZ12').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('VLR1312').AsFloat <> 0) Then
    Begin
      GRegBeneficiario(sCGCBenef, sAno, bGravaDadosBeneficiario, pArquivo, pCodNatureza);
      GravaLinhaValores(pArquivo, 'ESPP', '12', pCodNatureza, CdsJudicial);
    End;
End;

Procedure TCtrlGeraDirfNova.GRegExigibilidadeSuspensa(Const pArquivo: TextFile;
  Const pCodNatureza: String;
  Const sCGCBenef,
  sAno: String;
  Var bGravaDadosBeneficiario: Boolean);
Begin
  //Verifica se tem exigibilidade suspensa para gerar o arquivo
  If (CdsJudicial.FieldByName('JAN5').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('FEV5').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('MAR5').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('ABR5').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('MAI5').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('JUN5').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('JUL5').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('AGO5').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('SET5').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('OUT5').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('NOV5').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('DEZ5').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('VLR135').AsFloat <> 0) Then
    Begin
      GRegBeneficiario(sCGCBenef, sAno, bGravaDadosBeneficiario, pArquivo, pCodNatureza);
      GravaLinhaValores(pArquivo, 'ESRT', '5', pCodNatureza, CdsJudicial);
    End;
End;

Procedure TCtrlGeraDirfNova.GRegDeducoesImpostoRenda(Const pArquivo: TextFile;
  Const pCodNatureza: String;
  Const sCGCBenef,
  sAno: String;
  Var bGravaDadosBeneficiario: Boolean);
Begin
  //Verifica se tem exigibilidade suspensa para gerar o arquivo
  If (CdsJudicial.FieldByName('JAN7').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('FEV7').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('MAR7').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('ABR7').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('MAI7').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('JUN7').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('JUL7').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('AGO7').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('SET7').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('OUT7').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('NOV7').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('DEZ7').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('VLR137').AsFloat <> 0) Then
    Begin
      GRegBeneficiario(sCGCBenef, sAno, bGravaDadosBeneficiario, pArquivo, pCodNatureza);
      GravaLinhaValores(pArquivo, 'ESIR', '7', pCodNatureza, CdsJudicial);
    End;
End;

Procedure TCtrlGeraDirfNova.GRegDepositoJudicial(Const pArquivo: TextFile;
  Const pCodNatureza: String;
  Const sCGCBenef,
  sAno: String;
  Var bGravaDadosBeneficiario: Boolean);
Begin
  //Verifica se tem depósito judicial
  If (CdsJudicial.FieldByName('JAN8').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('FEV8').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('MAR8').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('ABR8').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('MAI8').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('JUN8').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('JUL8').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('AGO8').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('SET8').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('OUT8').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('NOV8').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('DEZ8').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('VLR138').AsFloat <> 0) Then
    Begin
      //    GravaLinhaValores(pArquivo,'ESDJ','8',pCodNatureza,CdsJudicial);
      GRegBeneficiario(sCGCBenef, sAno, bGravaDadosBeneficiario, pArquivo, pCodNatureza);
      GravaeCompensaLinhaValores(pArquivo, 'ESDJ', '8', pCodNatureza, CdsJudicial);
    End;
End;

Procedure TCtrlGeraDirfNova.GRegAjudaCusto(Const pArquivo: TextFile;
  Const pCodNatureza: String;
  Const pValorIndenizacao: Real;
  Const sCGCBenef,
  sAno: String;
  Var bGravaDadosBeneficiario: Boolean);
Var dValorTotal: Double;
Begin
  If (CdsJudicial.FieldByName('JAN13').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('FEV13').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('MAR13').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('ABR13').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('MAI13').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('JUN13').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('JUL13').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('AGO13').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('SET13').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('OUT13').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('NOV13').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('DEZ13').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('VLR1313').AsFloat <> 0) Then
    Begin
      dValorTotal := (CdsJudicial.FieldByName('JAN13').AsFloat + CdsJudicial.FieldByName('FEV13').AsFloat +
        CdsJudicial.FieldByName('MAR13').AsFloat + CdsJudicial.FieldByName('ABR13').AsFloat +
        CdsJudicial.FieldByName('MAI13').AsFloat + CdsJudicial.FieldByName('JUN13').AsFloat +
        CdsJudicial.FieldByName('JUL13').AsFloat + CdsJudicial.FieldByName('AGO13').AsFloat +
        CdsJudicial.FieldByName('SET13').AsFloat + CdsJudicial.FieldByName('OUT13').AsFloat +
        CdsJudicial.FieldByName('NOV13').AsFloat + CdsJudicial.FieldByName('DEZ13').AsFloat);
      If dValorTotal >= (pValorIndenizacao * 100) Then
        Begin
          GRegBeneficiario(sCGCBenef, sAno, bGravaDadosBeneficiario, pArquivo, pCodNatureza);
          GravaLinhaValores(pArquivo, 'RIDAC', '13', pCodNatureza, CdsJudicial);
        End
    End;
End;

Procedure TCtrlGeraDirfNova.GRegIndenizacao(Const pArquivo: TextFile;
  Const pCodNatureza: String;
  Const pValorIndenizacao: Real;
  Const sCGCBenef,
  sAno: String;
  Var bGravaDadosBeneficiario: Boolean);
Var dValorTotal: Double;
Begin
  If (CdsJudicial.FieldByName('JAN14').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('FEV14').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('MAR14').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('ABR14').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('MAI14').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('JUN14').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('JUL14').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('AGO14').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('SET14').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('OUT14').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('NOV14').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('DEZ14').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('VLR1314').AsFloat <> 0) Then
    Begin
      dValorTotal := (CdsJudicial.FieldByName('JAN14').AsFloat + CdsJudicial.FieldByName('FEV14').AsFloat +
        CdsJudicial.FieldByName('MAR14').AsFloat + CdsJudicial.FieldByName('ABR14').AsFloat +
        CdsJudicial.FieldByName('MAI14').AsFloat + CdsJudicial.FieldByName('JUN14').AsFloat +
        CdsJudicial.FieldByName('JUL14').AsFloat + CdsJudicial.FieldByName('AGO14').AsFloat +
        CdsJudicial.FieldByName('SET14').AsFloat + CdsJudicial.FieldByName('OUT14').AsFloat +
        CdsJudicial.FieldByName('NOV14').AsFloat + CdsJudicial.FieldByName('DEZ14').AsFloat);
      If dValorTotal >= (pValorIndenizacao * 100) Then
        Begin
          GRegBeneficiario(sCGCBenef, sAno, bGravaDadosBeneficiario, pArquivo, pCodNatureza);
          GravaLinhaValores(pArquivo, 'RIIRP', '14', pCodNatureza, CdsJudicial);
        End;
    End;
End;

function TCtrlGeraDirfNova.GravaLinhaValores(Const pArquivo: TextFile;
  Const pIdentificador,
  pColuna,
  pCodNatureza: String;
  Const oCds: TClientDataSet;
  Const bValidaSeVazio: Boolean;
  bRRA: boolean; //Vinicius Maciel SOL 170987 KTN 1528710
  bGrava13: boolean;  //Vinicius Maciel SOL 173822 KTN 1568567
  pLinha: string;     // Andre Imakawa - SIG 61321
  bGravaLinha : boolean) : string;     //edilaine SIG97214

Var sLinha: String;
  bGravar: Boolean;
Begin
  bGravar := True;
  If bValidaSeVazio Then
    bGravar := (oCds.fieldByname('JAN' + pColuna).AsFloat + oCds.fieldByname('FEV' + pColuna).AsFloat +
      oCds.fieldByname('MAR' + pColuna).AsFloat + oCds.fieldByname('ABR' + pColuna).AsFloat +
      oCds.fieldByname('MAI' + pColuna).AsFloat + oCds.fieldByname('JUN' + pColuna).AsFloat +
      oCds.fieldByname('JUL' + pColuna).AsFloat + oCds.fieldByname('AGO' + pColuna).AsFloat +
      oCds.fieldByname('SET' + pColuna).AsFloat + oCds.fieldByname('OUT' + pColuna).AsFloat +
      oCds.fieldByname('NOV' + pColuna).AsFloat + oCds.fieldByname('DEZ' + pColuna).AsFloat +
      oCds.fieldByname('VLR13' + pColuna).AsFloat) <> 0;

  If bGravar Then
    Begin
      //Darivaldo Alencar SIG 34429 -inicio
      if (not bInfPA) and (pIdentificador = 'RTPA')then
        begin
          // Andre Imakawa - SIG 61321 - Inicio
          {
          if pLinha = EmptyStr then
            sLinha := InfoPcPA(oCds.fieldByname('CGCBENEF').AsString, pIdentificador, pCodNatureza)
          else }
          sLinha := pLinha;
          // Andre Imakawa - SIG 61321 - Fim
          bInfPA:= true;
        end
      else if (not bInfPC) and (pIdentificador='RTPP') then
        begin
          sLinha := 'INFPC|'+
                     CompletaZero(oCds.FieldByName('CGCEMPRE').asString,14)+'|'+
                     Completa(oCds.FieldByName('NOMEEMPRE').asString,150)  + '|'+
                     #13#10+
                     pIdentificador + '|';
          bInfPC:= true;
        end
      else
      //Darivaldo Alencar SIG 34429 -fim
      sLinha := pIdentificador + '|';
      If (bRRA And (iSistema2 = 1) And
        (CdsRRA.locate('CGCBENEF', oCds.FieldByName('CGCBENEF').asString, [])) And
        ((pIdentificador = 'RTRT') Or (pIdentificador = 'RTIRF') Or (pIdentificador = 'RIMOG'))) Then
        Begin
          If (pIdentificador = 'RTRT') Then
            Begin
              sLinha := sLinha +
                //Marcio Sanches Spinosa SOL 236012 PPM 499021 - Inicio
                CompletaZero(StringReplace(FloatToStr(ajustaValor(oCds.fieldByname('JAN' + pColuna).AsFloat {-ajustaValor(cdsRRA.FieldByName('JAN16').asFloat-cdsRRA.FieldByName('VLR1316').asFloat)})), '-', '', [rfReplaceAll]), 13) + '|' +
                CompletaZero(StringReplace(FloatToStr(ajustaValor(oCds.fieldByname('FEV' + pColuna).AsFloat {-ajustaValor(cdsRRA.FieldByName('FEV16').asFloat-cdsRRA.FieldByName('VLR1316').asFloat)})), '-', '', [rfReplaceAll]), 13) + '|' +
                CompletaZero(StringReplace(FloatToStr(ajustaValor(oCds.fieldByname('MAR' + pColuna).AsFloat {-ajustaValor(cdsRRA.FieldByName('MAR16').asFloat-cdsRRA.FieldByName('VLR1316').asFloat)})), '-', '', [rfReplaceAll]), 13) + '|' +
                CompletaZero(StringReplace(FloatToStr(ajustaValor(oCds.fieldByname('ABR' + pColuna).AsFloat {-ajustaValor(cdsRRA.FieldByName('ABR16').asFloat-cdsRRA.FieldByName('VLR1316').asFloat)})), '-', '', [rfReplaceAll]), 13) + '|' +
                CompletaZero(StringReplace(FloatToStr(ajustaValor(oCds.fieldByname('MAI' + pColuna).AsFloat {-ajustaValor(cdsRRA.FieldByName('MAI16').asFloat-cdsRRA.FieldByName('VLR1316').asFloat)})), '-', '', [rfReplaceAll]), 13) + '|' +
                CompletaZero(StringReplace(FloatToStr(ajustaValor(oCds.fieldByname('JUN' + pColuna).AsFloat {-ajustaValor(cdsRRA.FieldByName('JUN16').asFloat-cdsRRA.FieldByName('VLR1316').asFloat)})), '-', '', [rfReplaceAll]), 13) + '|' +
                CompletaZero(StringReplace(FloatToStr(ajustaValor(oCds.fieldByname('JUL' + pColuna).AsFloat {-ajustaValor(cdsRRA.FieldByName('JUL16').asFloat-cdsRRA.FieldByName('VLR1316').asFloat)})), '-', '', [rfReplaceAll]), 13) + '|' +
                CompletaZero(StringReplace(FloatToStr(ajustaValor(oCds.fieldByname('AGO' + pColuna).AsFloat {-ajustaValor(cdsRRA.FieldByName('AGO16').asFloat-cdsRRA.FieldByName('VLR1316').asFloat)})), '-', '', [rfReplaceAll]), 13) + '|' +
                CompletaZero(StringReplace(FloatToStr(ajustaValor(oCds.fieldByname('SET' + pColuna).AsFloat {-ajustaValor(cdsRRA.FieldByName('SET16').asFloat-cdsRRA.FieldByName('VLR1316').asFloat)})), '-', '', [rfReplaceAll]), 13) + '|' +
                CompletaZero(StringReplace(FloatToStr(ajustaValor(oCds.fieldByname('OUT' + pColuna).AsFloat {-ajustaValor(cdsRRA.FieldByName('OUT16').asFloat-cdsRRA.FieldByName('VLR1316').asFloat)})), '-', '', [rfReplaceAll]), 13) + '|' +
                CompletaZero(StringReplace(FloatToStr(ajustaValor(oCds.fieldByname('NOV' + pColuna).AsFloat {-ajustaValor(cdsRRA.FieldByName('NOV16').asFloat-cdsRRA.FieldByName('VLR1316').asFloat)})), '-', '', [rfReplaceAll]), 13) + '|' +
                CompletaZero(StringReplace(FloatToStr(ajustaValor(oCds.fieldByname('DEZ' + pColuna).AsFloat {-ajustaValor(cdsRRA.FieldByName('DEZ16').asFloat-cdsRRA.FieldByName('VLR1316').asFloat)})), '-', '', [rfReplaceAll]), 13) + '|' +
                Ajusta13oSalario(pCodNatureza, ajustaValor(oCds.fieldByname('VLR13' + pColuna).AsFloat {-cdsRRA.FieldByName('VLR1316').asFloat})) + '|';
              //Marcio Sanches Spinosa SOL 236012 PPM 499021 - Fim
            End;
          If (pIdentificador = 'RTIRF') Then
            Begin
              CompensaValoresDasLinhas(pArquivo,
                pIdentificador,
                pColuna,
                pCodNatureza,
                oCds);
              sLinha := sLinha +
                //Marcio Sanches Spinosa SOL 236012 PPM 499021 - Inicio
              CompletaZero(StringReplace(FloatToStr(ajustaValor(oCds.fieldByname('JAN' + pColuna).AsFloat {-cdsRRA.FieldByName('JAN17').asFloat})), '-', '', [rfReplaceAll]), 13) + '|' +
                CompletaZero(StringReplace(FloatToStr(ajustaValor(oCds.fieldByname('FEV' + pColuna).AsFloat {-cdsRRA.FieldByName('FEV17').asFloat})), '-', '', [rfReplaceAll]), 13) + '|' +
                CompletaZero(StringReplace(FloatToStr(ajustaValor(oCds.fieldByname('MAR' + pColuna).AsFloat {-cdsRRA.FieldByName('MAR17').asFloat})), '-', '', [rfReplaceAll]), 13) + '|' +
                CompletaZero(StringReplace(FloatToStr(ajustaValor(oCds.fieldByname('ABR' + pColuna).AsFloat {-cdsRRA.FieldByName('ABR17').asFloat})), '-', '', [rfReplaceAll]), 13) + '|' +
                CompletaZero(StringReplace(FloatToStr(ajustaValor(oCds.fieldByname('MAI' + pColuna).AsFloat {-cdsRRA.FieldByName('MAI17').asFloat})), '-', '', [rfReplaceAll]), 13) + '|' +
                CompletaZero(StringReplace(FloatToStr(ajustaValor(oCds.fieldByname('JUN' + pColuna).AsFloat {-cdsRRA.FieldByName('JUN17').asFloat})), '-', '', [rfReplaceAll]), 13) + '|' +
                CompletaZero(StringReplace(FloatToStr(ajustaValor(oCds.fieldByname('JUL' + pColuna).AsFloat {-cdsRRA.FieldByName('JUL17').asFloat})), '-', '', [rfReplaceAll]), 13) + '|' +
                CompletaZero(StringReplace(FloatToStr(ajustaValor(oCds.fieldByname('AGO' + pColuna).AsFloat {-cdsRRA.FieldByName('AGO17').asFloat})), '-', '', [rfReplaceAll]), 13) + '|' +
                CompletaZero(StringReplace(FloatToStr(ajustaValor(oCds.fieldByname('SET' + pColuna).AsFloat {-cdsRRA.FieldByName('SET17').asFloat})), '-', '', [rfReplaceAll]), 13) + '|' +
                CompletaZero(StringReplace(FloatToStr(ajustaValor(oCds.fieldByname('OUT' + pColuna).AsFloat {-cdsRRA.FieldByName('OUT17').asFloat})), '-', '', [rfReplaceAll]), 13) + '|' +
                CompletaZero(StringReplace(FloatToStr(ajustaValor(oCds.fieldByname('NOV' + pColuna).AsFloat {-cdsRRA.FieldByName('NOV17').asFloat})), '-', '', [rfReplaceAll]), 13) + '|' +
                CompletaZero(StringReplace(FloatToStr(ajustaValor(oCds.fieldByname('DEZ' + pColuna).AsFloat {-cdsRRA.FieldByName('DEZ17').asFloat})), '-', '', [rfReplaceAll]), 13) + '|' +
                //Marcio Sanches Spinosa SOL 236012 PPM 499021 - Fim
              Ajusta13oSalario(pCodNatureza, oCds.fieldByname('VLR13' + pColuna).AsFloat) + '|';
            End;
          If (pIdentificador = 'RIMOG') Then
            Begin
              sLinha := sLinha +
                //Marcio Sanches Spinosa SOL 236012 PPM 499021 - Inicio
              CompletaZero(StringReplace(FloatToStr(ajustaValor(oCds.fieldByname('JAN' + pColuna).AsFloat {-ajustaValor(cdsRRA.FieldByName('JAN18').asFloat-cdsRRA.FieldByName('VLR1318').asFloat)})), '-', '', [rfReplaceAll]), 13) + '|' +
                CompletaZero(StringReplace(FloatToStr(ajustaValor(oCds.fieldByname('FEV' + pColuna).AsFloat {-ajustaValor(cdsRRA.FieldByName('FEV18').asFloat-cdsRRA.FieldByName('VLR1318').asFloat)})), '-', '', [rfReplaceAll]), 13) + '|' +
                CompletaZero(StringReplace(FloatToStr(ajustaValor(oCds.fieldByname('MAR' + pColuna).AsFloat {-ajustaValor(cdsRRA.FieldByName('MAR18').asFloat-cdsRRA.FieldByName('VLR1318').asFloat)})), '-', '', [rfReplaceAll]), 13) + '|' +
                CompletaZero(StringReplace(FloatToStr(ajustaValor(oCds.fieldByname('ABR' + pColuna).AsFloat {-ajustaValor(cdsRRA.FieldByName('ABR18').asFloat-cdsRRA.FieldByName('VLR1318').asFloat)})), '-', '', [rfReplaceAll]), 13) + '|' +
                CompletaZero(StringReplace(FloatToStr(ajustaValor(oCds.fieldByname('MAI' + pColuna).AsFloat {-ajustaValor(cdsRRA.FieldByName('MAI18').asFloat-cdsRRA.FieldByName('VLR1318').asFloat)})), '-', '', [rfReplaceAll]), 13) + '|' +
                CompletaZero(StringReplace(FloatToStr(ajustaValor(oCds.fieldByname('JUN' + pColuna).AsFloat {-ajustaValor(cdsRRA.FieldByName('JUN18').asFloat-cdsRRA.FieldByName('VLR1318').asFloat)})), '-', '', [rfReplaceAll]), 13) + '|' +
                CompletaZero(StringReplace(FloatToStr(ajustaValor(oCds.fieldByname('JUL' + pColuna).AsFloat {-ajustaValor(cdsRRA.FieldByName('JUL18').asFloat-cdsRRA.FieldByName('VLR1318').asFloat)})), '-', '', [rfReplaceAll]), 13) + '|' +
                CompletaZero(StringReplace(FloatToStr(ajustaValor(oCds.fieldByname('AGO' + pColuna).AsFloat {-ajustaValor(cdsRRA.FieldByName('AGO18').asFloat-cdsRRA.FieldByName('VLR1318').asFloat)})), '-', '', [rfReplaceAll]), 13) + '|' +
                CompletaZero(StringReplace(FloatToStr(ajustaValor(oCds.fieldByname('SET' + pColuna).AsFloat {-ajustaValor(cdsRRA.FieldByName('SET18').asFloat-cdsRRA.FieldByName('VLR1318').asFloat)})), '-', '', [rfReplaceAll]), 13) + '|' +
                CompletaZero(StringReplace(FloatToStr(ajustaValor(oCds.fieldByname('OUT' + pColuna).AsFloat {-ajustaValor(cdsRRA.FieldByName('OUT18').asFloat-cdsRRA.FieldByName('VLR1318').asFloat)})), '-', '', [rfReplaceAll]), 13) + '|' +
                CompletaZero(StringReplace(FloatToStr(ajustaValor(oCds.fieldByname('NOV' + pColuna).AsFloat {-ajustaValor(cdsRRA.FieldByName('NOV18').asFloat-cdsRRA.FieldByName('VLR1318').asFloat)})), '-', '', [rfReplaceAll]), 13) + '|' +
                CompletaZero(StringReplace(FloatToStr(ajustaValor(oCds.fieldByname('DEZ' + pColuna).AsFloat {-ajustaValor(cdsRRA.FieldByName('DEZ18').asFloat-cdsRRA.FieldByName('VLR1318').asFloat)})), '-', '', [rfReplaceAll]), 13) + '|' +
                Ajusta13oSalario(pCodNatureza, ajustaValor(oCds.fieldByname('VLR13' + pColuna).AsFloat {-cdsRRA.FieldByName('VLR1318').asFloat})) + '|';
              //Marcio Sanches Spinosa SOL 236012 PPM 499021 - Fim
            End;
        End
      Else
        Begin
          If (pIdentificador = 'RTIRF') Then
            CompensaValoresDasLinhas(pArquivo,
              pIdentificador,
              pColuna,
              pCodNatureza,
              oCds)
          //Wylliam Leite da Silva - SOL 249269 PPM 737170 - Inicio
          else If (pIdentificador = 'RTPA')
               and (1 = 2) //Darivaldo Alencar SIG 34429
               Then
            CompensaValoresDasLinhas(pArquivo,
              pIdentificador,
              pColuna,
              pCodNatureza,
              oCds);
          //Wylliam Leite da Silva - SOL 249269 PPM 737170 - Fim
          if (pIdentificador <> 'RTPA') then //Darivaldo Alencar SIG 34429
          sLinha := sLinha +
            CompletaZero(StringReplace(oCds.fieldByname('JAN' + pColuna).AsString, '-', '', [rfReplaceAll]), 13) + '|' +
            CompletaZero(StringReplace(oCds.fieldByname('FEV' + pColuna).AsString, '-', '', [rfReplaceAll]), 13) + '|' +
            CompletaZero(StringReplace(oCds.fieldByname('MAR' + pColuna).AsString, '-', '', [rfReplaceAll]), 13) + '|' +
            CompletaZero(StringReplace(oCds.fieldByname('ABR' + pColuna).AsString, '-', '', [rfReplaceAll]), 13) + '|' +
            CompletaZero(StringReplace(oCds.fieldByname('MAI' + pColuna).AsString, '-', '', [rfReplaceAll]), 13) + '|' +
            CompletaZero(StringReplace(oCds.fieldByname('JUN' + pColuna).AsString, '-', '', [rfReplaceAll]), 13) + '|' +
            CompletaZero(StringReplace(oCds.fieldByname('JUL' + pColuna).AsString, '-', '', [rfReplaceAll]), 13) + '|' +
            CompletaZero(StringReplace(oCds.fieldByname('AGO' + pColuna).AsString, '-', '', [rfReplaceAll]), 13) + '|' +
            CompletaZero(StringReplace(oCds.fieldByname('SET' + pColuna).AsString, '-', '', [rfReplaceAll]), 13) + '|' +
            CompletaZero(StringReplace(oCds.fieldByname('OUT' + pColuna).AsString, '-', '', [rfReplaceAll]), 13) + '|' +
            CompletaZero(StringReplace(oCds.fieldByname('NOV' + pColuna).AsString, '-', '', [rfReplaceAll]), 13) + '|' +
            CompletaZero(StringReplace(oCds.fieldByname('DEZ' + pColuna).AsString, '-', '', [rfReplaceAll]), 13) + '|';

           if (pIdentificador <> 'RTPA') then //Darivaldo Alencar SIG 34429
              begin
                //Vinicius Maciel SOL 173822 KTN 1568567
                If (bGrava13)  Then
                  sLinha := sLinha + Ajusta13oSalario(pCodNatureza, oCds.fieldByname('VLR13' + pColuna).AsFloat) + '|'
                Else
                  sLinha := sLinha + '|';
                //Vinicius Maciel SOL 173822 KTN 1568567 - FIM
              end
        End;

      //edilaine SIG97214 : inicio
      if (sLinha<> EmptyStr) and (bGravaLinha) then //Darivaldo Alencar SIG 34429
      begin
        WriteLn(pArquivo, sLinha);
        sLinha := '';
      end;
      //edilaine SIG97214 : fim

    End;
    Result := sLinha;               //edilaine SIG97214
End;

Procedure TCtrlGeraDirfNova.CompensaValoresDasLinhas(Const pArquivo: TextFile;
  Const pIdentificador,
  pColuna,
  pCodNatureza: String;
  Const oCds: TClientDataSet);
Const aMeses: Array[0..11] Of String = ('JAN', 'FEV', 'MAR', 'ABR', 'MAI', 'JUN',
    'JUL', 'AGO', 'SET', 'OUT', 'NOV', 'DEZ');

Var iMes: Integer;
  dValorCompensar: Double;
  i: Integer;

  Procedure AjustaRegistro(Const iMes: integer);
  Var dValor: Double;
    i: Integer;
  Begin
    For i := iMes - 1 Downto 0 Do
      Begin
        dValor := oCds.fieldByname(aMeses[i] + pColuna).AsFloat;
        If dValorCompensar < 0 Then
          Begin
            If dValor + dValorCompensar < 0 Then
              Begin
                dValorCompensar := dValorCompensar + dValor;
                dValor := 0;
              End
            Else
              Begin
                dValor := dValor + dValorCompensar;
                dValorCompensar := 0
              End;
            oCds.Edit;
            oCds.fieldByname(aMeses[i] + pColuna).AsFloat := dValor;
            oCds.Post;
          End;
      End;
  End;

Begin
  iMes := -1;
  For i := 11 Downto 1 Do
    Begin
      If oCds.fieldByname(aMeses[i] + pColuna).AsFloat < 0 Then
        Begin
          If (iMes = -1) Then iMes := i;
          dValorCompensar := dValorCompensar + oCds.fieldByname(aMeses[i] + pColuna).AsFloat;
          oCds.Edit;
          oCds.fieldByname(aMeses[i] + pColuna).AsFloat := 0;
          oCds.Post;
        End;
    End;

  If dValorCompensar <> 0 Then
    AjustaRegistro(iMes);
End;

Procedure TCtrlGeraDirfNova.GravaeCompensaLinhaValores(Const pArquivo: TextFile;
  Const pIdentificador,
  pColuna,
  pCodNatureza: String;
  Const oCds: TClientDataSet;
  Const bValidaSeVazio: Boolean);

Var sLinha: String;
  bGravar: Boolean;
Begin
  bGravar := True;
  CompensaValoresDasLinhas(pArquivo,
    pIdentificador,
    pColuna,
    pCodNatureza,
    oCds);

  If bValidaSeVazio Then
    bGravar := (oCds.fieldByname('JAN' + pColuna).AsFloat + oCds.fieldByname('FEV' + pColuna).AsFloat +
      oCds.fieldByname('MAR' + pColuna).AsFloat + oCds.fieldByname('ABR' + pColuna).AsFloat +
      oCds.fieldByname('MAI' + pColuna).AsFloat + oCds.fieldByname('JUN' + pColuna).AsFloat +
      oCds.fieldByname('JUL' + pColuna).AsFloat + oCds.fieldByname('AGO' + pColuna).AsFloat +
      oCds.fieldByname('SET' + pColuna).AsFloat + oCds.fieldByname('OUT' + pColuna).AsFloat +
      oCds.fieldByname('NOV' + pColuna).AsFloat + oCds.fieldByname('DEZ' + pColuna).AsFloat +
      oCds.fieldByname('VLR13' + pColuna).AsFloat) <> 0;

  If bGravar Then
    Begin
      sLinha := pIdentificador + '|' +
        //Vinicius Maciel SOL 170987 KTN 1528710
//MUDEI O ULTIMO PARAMETRO DE 15 PARA 13.
      CompletaZero(StringReplace(oCds.fieldByname('JAN' + pColuna).AsString, '-', '', [rfReplaceAll]), 13) + '|' +
        CompletaZero(StringReplace(oCds.fieldByname('FEV' + pColuna).AsString, '-', '', [rfReplaceAll]), 13) + '|' +
        CompletaZero(StringReplace(oCds.fieldByname('MAR' + pColuna).AsString, '-', '', [rfReplaceAll]), 13) + '|' +
        CompletaZero(StringReplace(oCds.fieldByname('ABR' + pColuna).AsString, '-', '', [rfReplaceAll]), 13) + '|' +
        CompletaZero(StringReplace(oCds.fieldByname('MAI' + pColuna).AsString, '-', '', [rfReplaceAll]), 13) + '|' +
        CompletaZero(StringReplace(oCds.fieldByname('JUN' + pColuna).AsString, '-', '', [rfReplaceAll]), 13) + '|' +
        CompletaZero(StringReplace(oCds.fieldByname('JUL' + pColuna).AsString, '-', '', [rfReplaceAll]), 13) + '|' +
        CompletaZero(StringReplace(oCds.fieldByname('AGO' + pColuna).AsString, '-', '', [rfReplaceAll]), 13) + '|' +
        CompletaZero(StringReplace(oCds.fieldByname('SET' + pColuna).AsString, '-', '', [rfReplaceAll]), 13) + '|' +
        CompletaZero(StringReplace(oCds.fieldByname('OUT' + pColuna).AsString, '-', '', [rfReplaceAll]), 13) + '|' +
        CompletaZero(StringReplace(oCds.fieldByname('NOV' + pColuna).AsString, '-', '', [rfReplaceAll]), 13) + '|' +
        CompletaZero(StringReplace(oCds.fieldByname('DEZ' + pColuna).AsString, '-', '', [rfReplaceAll]), 13) + '|' +
        //Vinicius Maciel SOL 170987 KTN 1528710 - FIM
      Ajusta13oSalario(pCodNatureza, oCds.fieldByname('VLR13' + pColuna).AsFloat) + '|';
      WriteLn(pArquivo, sLinha);
    End;
End;

Procedure TCtrlGeraDirfNova.AjustaNaturezas(Const pCodNatureza: String);
Var sMes: String;
Begin
  If ((pCodNatureza = '3323') Or (pCodNatureza = '5565')) Then
    Begin
      sMes := DataUltimoBeneficioRecebido5565(Cds.fieldByname('CGCBENEF').AsString);
      Cds.Edit;
      Cds.fieldByname(sMes + '1').AsFloat := Cds.fieldByname(sMes + '1').AsFloat +
        Cds.fieldByname('VLR131').AsFloat;
      Cds.FieldByname('VLR131').AsFloat := 0;
      Cds.Post;
    End;
End;

Function TCtrlGeraDirfNova.Ajusta13oSalario(Const sCodNatureza: String;
  Const fValor: Double): String;
Begin
  If (sCodNatureza = '3223') { or (sCodNatureza = '5565') } Or (fValor = 0) //Marcio Sanches Spinosa SOL 226003 KINTANA 2060052
  Or (sCodNatureza = '3556') Or (sCodNatureza = '3579') Then //Marcio Sanches Spinosa SOL 223465 KINTANA 2058652
    Result := ''
  Else
    //Vinicius Maciel SOL 170987 KTN 1528710
    //MUDEI O ULTIMO PARAMETRO DE 15 PARA 13.
    Result := CompletaZero(StringReplace(FloatToStr(fValor), '-', '', [rfReplaceAll]), 13);
End;

Function TCtrlGeraDirfNova.ExisteNaLista(Const pLista: TStringList; Const pCPF: String): Integer;
Var iCount, iPos: Integer;
  sCPF: String;
Begin
  Result := -1;
  For iCount := 0 To pLista.Count - 1 Do
    Begin
      sCPF := pLista[iCount];
      iPos := Pos(' - ', sCPF);
      If iPos = 0 Then
        iPos := length(sCPF) + 1;
      sCPF := Copy(sCPF, 1, iPos - 1);
      If sCPF = pCPF Then
        Begin
          Result := iCount;
          break;
        End;
    End;
End;

Procedure TCtrlGeraDirfNova.Principal(IdResponsavel,
  TipoArquivo,
  NaturDeclar: Integer;
  Retencao,
  PesExi: Boolean;
  rValorMinimo: Real;
  sNomeArquivo,
  sAno,
  sAnoref: String;
  IdPessoa,
  iSistema: Longint;
  DataIni,
  DataFim,
  Numdocumento,
  sNumeroRecibo: String;
  rValorIndenizacao: Real;
  idPlanoSaude: Integer;
  idPlanoOdonto: Integer; //Vinicius Maciel SOL 170987 KTN 1528710
  sCPFFiltro: String);
Var sLinha,
  SEI,
    sNatureza: String;
  ArquivoTexto: TextFile;
  sPesExi,
    sCGCBenef,
    sCodNatureza: String;
  sNomeBenef: String;
  iContador: Integer;

  bTemTipoZero: Boolean;
  bTemRendMin: Boolean;
  bEntra: Boolean;
  bGeraNovaNatureza: Boolean;
  bGravaDadosBeneficiario: Boolean;

  //sLinhaRTPA: string; // Andre Imakawa - SIG 61321              //edilaine SIG9714
  sLinhaArq : string;                                             //edilaine SIG9714

  dRendimentoBruto,
    dImpostoRetido: Double;
  dTributo: Double; //Marcio Sanches Spinosa SOL 245373 PPM 620985
  dPensaAlimenticia : Double;//Marcio Sanches Spinosa SOL 248634 PPM 735735
  iNumArq: integer; // Fernando Xavier/Edilaine Ferraresi/Marcio Spinosa SOL 226715 KINTANA 2061081
  sArqParcial: String; // Fernando Xavier/Edilaine Ferraresi/Marcio Spinosa SOL 226715 KINTANA 2061081
  srRec: TSearchRec; // Fernando Xavier/Edilaine Ferraresi/Marcio Spinosa SOL 226715 KINTANA 2061081
  dContribuicao: double; // Fernando Xavier/Edilaine Ferraresi/Marcio Spinosa SOL 226715 KINTANA 2061081
  bTemContribuicao: boolean; // Fernando Xavier/Edilaine Ferraresi/Marcio Spinosa SOL 226715 KINTANA 2061081

  { // Felipe A. Santos SOL 223584 KTN 2057497
  lstNatureza, lstCPFBenef: TStringList;  // Edilaine - SOL 198116 / KTN 1914302
  iInd                    : integer;      // Edilaine - SOL 198116 / KTN 1914302
                                                                  }// Felipe A. Santos SOL 223584 KTN 2057497
  lstFuncef: TstringList;
  bGrava: Boolean;
//Darivaldo Alencar SIG 28407 -inicio
  dVlrRendimento : double;

  function VlrRendimentoIsendo(sCpf: String): double;
   var sSQL:String;
    begin
       sSQL:= 'SELECT NVL(SUM(LI.VLRLANC), 0) AS VALOR' + #13#10 +
              '  FROM LANCXINFORME LI' + #13#10 +
              ' INNER JOIN LANCIRRF L' + #13#10 +
              '    ON L.IDLANCIRRF = LI.IDLANCIRRF' + #13#10 +
              ' INNER JOIN INFORME I' + #13#10 +
              '    ON I.IDINFORME = LI.IDINFORME' + #13#10 +
              ' INNER JOIN PESSOA P' + #13#10 +
              '    ON L.IDBENEFIRRF = P.IDPESSOA' + #13#10 +
              ' WHERE L.DATAPAGAMENTO BETWEEN TO_DATE('+QuotedStr(DataIni)+', ''DD/MM/YYYY'') AND' + #13#10 +
              '       TO_DATE('+ QuotedStr(DataFim) +', ''DD/MM/YYYY'')' + #13#10 +
              '   AND I.CODDIRF IN (47) ' +#13#10 +
              ' AND L.CODNATUREZA = '+ sNatureza +#13#10 ;

       if sCpf <> EmptyStr then
          begin
              sSQL:= sSQL +   ' AND P.NUMDOCUMENTO IN ('+ QuotedStr(sCpf) +')';
              CdsRIO.data :=  GetDataPacket(sSQL);
              result := CdsRIO.FieldByName('VALOR').AsCurrency ;
          end
       else result := 0;
    end;
  //Darivaldo Alencar SIG 28407 -fim

Begin

  lstInsNatureza := TStringList.create;                          //edilaine SIG97214

  sDataIni:= DataIni;
  sDataFim:= DataFim; //Darivaldo Alencar SIG 34429
  CdsResponsavel.Data := ListResponsavel(IdResponsavel);
  CdsJudicial.data := ListGeraDirfJudicial_Suspensa(IdPessoa,
    iSistema,
    DataIni,
    DataFim,
    Copy(cdsEmpresa.FieldByName('NUMDOCUMENTO').AsString, 1, 8),
    rValorMinimo,
    rValorIndenizacao,
    sCPFFiltro);
  //Vinicius Maciel SOL 170987 KTN 1528710
  CdsRra.data := dadosRRA(IdPessoa,
    iSistema,
    DataIni,
    DataFim,
    Copy(cdsEmpresa.FieldByName('NUMDOCUMENTO').AsString, 1, 8),
    rValorMinimo,
    rValorIndenizacao,
    sCPFFiltro);
  //Vinicius Maciel SOL 170987 KTN 1528710 - FIM

  Case TipoArquivo Of
    0: SEI := 'N';
    1: SEI := 'S';
  End;

  // Fernando Xavier/Edilaine Ferraresi/Marcio Spinosa SOL 226715 KINTANA 2061081 - inicio
  If FindFirst('c:\planus\temp\ArqDirf_*.*', faAnyFile - faDirectory, srRec) = 0 Then
    Begin
      Try
        Repeat
          DeleteFile('c:\planus\temp\' + srRec.Name);
        Until FindNext(srRec) <> 0;
      Finally
        FindClose(srRec);
      End;
    End;

  inc(iNumArq);
  sArqParcial := 'c:\Planus\Temp\ArqDirf_' + CompletaZero(intToStr(iNumArq), 3);
  AssignFile(ArquivoTexto, sArqParcial);
  // Fernando Xavier/Edilaine Ferraresi/Marcio Spinosa SOL 226715 KINTANA 2061081 - fim

  //AssignFile(ArquivoTexto, sNomeArquivo);    // Fernando Xavier/Edilaine Ferraresi/Marcio Spinosa SOL 226715 KINTANA 2061081 - comentado

  ReWrite(ArquivoTexto);

  sMens := 'Primeira Fase';

  If iSistema = 0 Then
    lstFuncef := TStringList.Create();

  { // Felipe A. Santos SOL 223584 KTN 2057497 - inicio comentário
lstNatureza := TStringList.Create();  // Edilaine - SOL 198116 / KTN 1914302
lstCPFBenef := TStringList.Create();  // Edilaine - SOL 198116 / KTN 1914302
                                                                  }// Felipe A. Santos SOL 223584 KTN 2057497 - fim comentário
  FMaxProgresso := cds.RecordCount;
  FProgresso := 0;
  Cds.First;

  FMaxProgresso := Cds.RecordCount;
  FProgresso := 0;
  sMens := 'Terceira Fase';
  If Not PesExi Then
    sPesExi := '0'
  Else
    sPesExi := '1';

  // Geração do Dados Principais do Arquivo
  GRegDadosPrincipais(ArquivoTexto,
    sAno,
    sAnoRef,
    SEI,
    sNumeroRecibo,
    NaturDeclar);

  iContador := 0;
  frmProgresso.MostraFormProgresso('Processando', True, False, True, 0, cds.RecordCount);
  bInfPA:= false;  bInfPC:= false;  //Darivaldo Alencar SIG 34429
  sCgcBenef := ''; //CPrev - Pend. 27026
  //  Cds.Filtered := False;
  //  Cds.Filter := 'CODNATUREZA = 0561';
  //  Cds.Filtered := True;
    // 1º while
    // Este while é para gerar os registros de rendimentos comuns do beneficiário.
  While Not Cds.EOF Do
    Begin
      sNatureza := Cds.fieldByname('CODNATUREZA').AsString;
      bGeraNovaNatureza := True;                                    
      bGravaDadosBeneficiario := True;

      While (sNatureza = Cds.fieldByname('CODNATUREZA').AsString) And (Not Cds.EOF) Do
        Begin
          // Gera Linha de Nova Natureza;
          //GRegNatureza(bGeraNovaNatureza,ArquivoTexto);    // Edilaine - SOL 198116 / KTN 1914302 - comentado

           bTemContribuicao := false;

           //William Moreira da Silva - SIG 41009
           dPensaAlimenticia := 0;
           //William Moreira da Silva - SIG 41009

          //      Fernando Xavier/Edilaine Ferraresi/Marcio Spinosa SOL 226715 KINTANA 2061081 - Inicio
                //if (sCgcBenef <> Cds.fieldByname('CGCBENEF').AsString) then
          If Cds.fieldByname('TIPOREG').AsString = '0' Then
            Begin
              dRendimentoBruto := cds.fieldByname('JAN1').AsFloat + cds.fieldByname('FEV1').AsFloat +
                cds.fieldByname('MAR1').AsFloat + cds.fieldByname('ABR1').AsFloat +
                cds.fieldByname('MAI1').AsFloat + cds.fieldByname('JUN1').AsFloat +
                cds.fieldByname('JUL1').AsFloat + cds.fieldByname('AGO1').AsFloat +
                cds.fieldByname('SET1').AsFloat + cds.fieldByname('OUT1').AsFloat +
                cds.fieldByname('NOV1').AsFloat + cds.fieldByname('DEZ1').AsFloat +
                cds.fieldByname('VLR131').AsFloat; // Andre Imakawa - SIG 63027

              dImpostoRetido := cds.fieldByname('JAN2').AsFloat + cds.fieldByname('FEV2').AsFloat +
                cds.fieldByname('MAR2').AsFloat + cds.fieldByname('ABR2').AsFloat +
                cds.fieldByname('MAI2').AsFloat + cds.fieldByname('JUN2').AsFloat +
                cds.fieldByname('JUL2').AsFloat + cds.fieldByname('AGO2').AsFloat +
                cds.fieldByname('SET2').AsFloat + cds.fieldByname('OUT2').AsFloat +
                cds.fieldByname('NOV2').AsFloat + cds.fieldByname('DEZ2').AsFloat +
                cds.fieldByname('VLR132').AsFloat; // Andre Imakawa - SIG 63027

              bTemTipoZero := (dImpostoRetido > 0) And (cds.fieldByname('TIPOREG').AsFloat = 0);
              bTemRendMin := (dRendimentoBruto >= (rValorMinimo * 100)) And (cds.fieldByname('TIPOREG').AsFloat = 0);
            End
              //Marcio Sanches Spinosa SOL 245373 PPM 620985 - Inicio
          Else If (Cds.fieldByname('TIPOREG').AsString = '1')
          {And (Cds.fieldByname('CODNATUREZA').AsString = '3540') }Then  //Wylliam Leite da Silva - SOL 249269 PPM 737170 - Inicio
            Begin
              dRendimentoBruto := cds.fieldByname('JAN1').AsFloat + cds.fieldByname('FEV1').AsFloat +
                cds.fieldByname('MAR1').AsFloat + cds.fieldByname('ABR1').AsFloat +
                cds.fieldByname('MAI1').AsFloat + cds.fieldByname('JUN1').AsFloat +
                cds.fieldByname('JUL1').AsFloat + cds.fieldByname('AGO1').AsFloat +
                cds.fieldByname('SET1').AsFloat + cds.fieldByname('OUT1').AsFloat +
                cds.fieldByname('NOV1').AsFloat + cds.fieldByname('DEZ1').AsFloat;

              dTributo := cds.fieldByname('JAN3').AsFloat + cds.fieldByname('FEV3').AsFloat +
                cds.fieldByname('MAR3').AsFloat + cds.fieldByname('ABR3').AsFloat +
                cds.fieldByname('MAI3').AsFloat + cds.fieldByname('JUN3').AsFloat +
                cds.fieldByname('JUL3').AsFloat + cds.fieldByname('AGO3').AsFloat +
                cds.fieldByname('SET3').AsFloat + cds.fieldByname('OUT3').AsFloat +
                cds.fieldByname('NOV3').AsFloat + cds.fieldByname('DEZ3').AsFloat;

              //marcio sanches spinosa SOL 248634 PPM 735735 -Inicio
              dPensaAlimenticia := cds.fieldByname('JAN2').AsFloat + cds.fieldByname('FEV2').AsFloat +
                cds.fieldByname('MAR2').AsFloat + cds.fieldByname('ABR2').AsFloat +
                cds.fieldByname('MAI2').AsFloat + cds.fieldByname('JUN2').AsFloat +
                cds.fieldByname('JUL2').AsFloat + cds.fieldByname('AGO2').AsFloat +
                cds.fieldByname('SET2').AsFloat + cds.fieldByname('OUT2').AsFloat +
                cds.fieldByname('NOV2').AsFloat + cds.fieldByname('DEZ2').AsFloat;
              //marcio sanches spinosa SOL 248634 PPM 735735 - Fim
            End
              //Marcio Sanches Spinosa SOL 245373 PPM 620985 - Fim
            Else If Cds.fieldByname('TIPOREG').AsString = '2' Then
            Begin
              dContribuicao := cds.fieldByname('JAN1').AsFloat + cds.fieldByname('FEV1').AsFloat +
                cds.fieldByname('MAR1').AsFloat + cds.fieldByname('ABR1').AsFloat +
                cds.fieldByname('MAI1').AsFloat + cds.fieldByname('JUN1').AsFloat +
                cds.fieldByname('JUL1').AsFloat + cds.fieldByname('AGO1').AsFloat +
                cds.fieldByname('SET1').AsFloat + cds.fieldByname('OUT1').AsFloat +
                cds.fieldByname('NOV1').AsFloat + cds.fieldByname('DEZ1').AsFloat;

                bTemContribuicao := (dContribuicao > 0);
            End;
          //      Fernando Xavier/Edilaine Ferraresi/Marcio Spinosa SOL 226715 KINTANA 2061081 - Fim
          sCodNatureza := Cds.fieldByname('CODNATUREZA').AsString;
          sCgcBenef := Cds.fieldByname('CGCBENEF').AsString;
          sNomeBenef := StringReplace(BuscaNome(sCgcBenef), '''', '', [rfReplaceAll]);

          // Felipe A. Santos SOL 223584 KTN 2057497 - inicio comentário
          {
          // Edilaine - SOL 198116 / KTN 1914302
          if lstNatureza.IndexOf(sCodNatureza) = -1 then
          begin
            lstNatureza.Add(sCodNatureza);
            lstCPFBenef.add(sCgcBenef);
          end;
          // Edilaine - SOL 198116 / KTN 1914302 - fim
                                                                          }// Felipe A. Santos SOL 223584 KTN 2057497 - fim comentário

          bEntra := False;
          //William Moreira da Silva - SIG 36758
          //btIN1343:= possui_IN1343(Cds.fieldByname('CGCBENEF').AsString); //Darivaldo Alencar SOL 269619 ppm 1314059
          btIN1343:= possui_IN1343(Cds.fieldByname('CGCBENEF').AsString, sCodNatureza, rValorMinimo);   //edilaine - SIG57460
          //William Moreira da Silva - SIG 36758

          If Retencao Then
             bEntra := (bTemTipoZero Or ((rValorMinimo <> 0) And bTemRendMin))
              Or (dPensaAlimenticia <> 0) //marcio sanches spinosa SOL 248634 PPM 735735
              Or (bTemContribuicao)or // Fernando Xavier/Edilaine Ferraresi/Marcio Spinosa SOL 226715 KINTANA 2061081
              //SIG80938 -Inicio
              (
              (btIN1343) //Darivaldo Alencar -SOL 269619 ppm 1314059
               and
                ((PossuiValorCds(Cds,'1', '0', sCodNatureza, True))or
                 (PossuiValorCds(Cds,'1', '1', sCodNatureza, True))or
                 (PossuiValorCds(Cds,'1', '2', sCodNatureza, True)))
               )
             //SIG80938 -Fim
          Else
            bEntra := (((bTemRendMin) And (rValorMinimo <> 0))
              Or (dImpostoRetido > 0)) //Marcio Sanches Spinosa SOL 239224 e 239239 PPM 515112 e 515109
            Or ((dRendimentoBruto = 0) And (dTributo > 0) And (Cds.fieldByname('CODNATUREZA').AsString = '3540')) //Marcio Sanches Spinosa SOL 245373 PPM 620985
            Or (dPensaAlimenticia > 0) //marcio sanches spinosa SOL 248634 PPM 735735
            Or (bTemContribuicao) //Fernando Xavier/Edilaine Ferraresi/Marcio Spinosa SOL 226715 KINTANA 2061081
            or (btIN1343); //Darivaldo Alencar -SOL 269619 ppm 1314059

          If bEntra Then
            Begin
              // Gera Linha de Nova Natureza;
              // Andre Imakawa - SIG 63547 - Inicio
              {
              If Not (((dRendimentoBruto = 0) And (dTributo > 0))
                 And (Cds.fieldByname('CODNATUREZA').AsString = '3540')) Or  //Marcio Sanches Spinosa SOL 245373 PPM 620985
                 ((bTemContribuicao) and(Cds.fieldByname('CODNATUREZA').AsString = '3540')) Then  // Andre Imakawa - SIG 61321
              }
              // Andre Imakawa - SIG 63547 - Fim
              //  GRegNatureza(bGeraNovaNatureza, ArquivoTexto, sCodNatureza); // Edilaine - SOL 198116 / KTN 1914302       //edilaine SIG97214

              If iSistema = 0 Then
                Begin
                  If Cds.FieldByName('TIPOREG').AsString = '0' Then
                    lstFuncef.Add(Cds.fieldByname('CGCBENEF').AsString + ' - ' + sCodNatureza);
                End;

              // edilaine - SOL 248651 / PPM 672554 - comentada a condição abaixo
              //If Not (((dRendimentoBruto = 0) And (dTributo > 0)) And (Cds.fieldByname('CODNATUREZA').AsString = '3540')) Then //Marcio Sanches Spinosa SOL 245373 PPM 620985

              //edilaine SIG97214 : inicio
              if bGravaDadosBeneficiario then
                 GeraRTPA(sAno, sCodNatureza, sLinhaRTPA);

              {// Andre Imakawa - SIG 61321 - Inicio
              sLinhaRTPA :=  GRegBeneficiario(Cds.fieldByname('CGCBENEF').AsString,
                  sAno,
                  bGravaDadosBeneficiario,
                  ArquivoTexto,
                  sCodNatureza);
              }// Andre Imakawa - SIG 61321 - Fim
              //edilaine SIG97214 : fim

              Case Cds.FieldByName('TIPOREG').AsString[1] Of
                '0': Begin
                    //Vinicius Maciel - SOL 173822 - KTN 1568567
                   //AjustaNaturezas(sCodNatureza);

                    If sCodNatureza = '5565' Then
                      SomaValores65Anos('5565', sCgcBenef);

                    //GravaLinhaValores(ArquivoTexto,'RTRT', '1',sCodNatureza,Cds,True);
                    //GravaLinhaValores(ArquivoTexto,'RTRT', '1',sCodNatureza,Cds,True,not(CdsRRA.isEmpty));  // Edilaine - SOL 197745 / KTN 1895223  - comentado
                    //GravaLinhaValores(ArquivoTexto, 'RTRT', '1', sCodNatureza, Cds, True, (Not (CdsRRA.isEmpty)) And (sAno = '2011')); // Edilaine - SOL 197745 / KTN 1895223     //edilaine SIG97214

                    //edilaine SIG97214 : inicio
                    sLinhaArq := GravaLinhaValores(ArquivoTexto, 'RTRT', '1', sCodNatureza, Cds, True, (Not (CdsRRA.isEmpty)) And (sAno = '2011'), true, '', (not bGravaDadosBeneficiario) );
                    GRegBeneficiario(sLinhaArq, sCGCBenef, sAno, bGravaDadosBeneficiario, ArquivoTexto, sCodNatureza);

                    //GravaLinhaValores(ArquivoTexto,'RTIRF','2',sCodNatureza,Cds,True);
                    //GravaLinhaValores(ArquivoTexto, 'RTIRF', '2', sCodNatureza, Cds, True, Not (CdsRRA.isEmpty), true); //Marcio Sanches Spinosa SOL 226003 KINTANA 2060052       //edilaine SIG97214

                    sLinhaArq := GravaLinhaValores(ArquivoTexto, 'RTIRF', '2', sCodNatureza, Cds, True, Not (CdsRRA.isEmpty), true, '', (not bGravaDadosBeneficiario));
                    GRegBeneficiario(sLinhaArq, sCGCBenef, sAno, bGravaDadosBeneficiario, ArquivoTexto, sCodNatureza);
                    //edilaine SIG97214 : fim

                    //Cássio Rovaroto - SIG nº 78096 - Início
                    if sCodNatureza = '3540' then
                    begin
                      CdsJudicial.First;
                      if CdsJudicial.Locate('CODNATUREZA;CGCBENEF',
                                            VarArrayOf([sCodNatureza, sCgcBenef]), []) then
                      begin
                        bGrava := True;
                        If (iSistema = 0) And (ExisteNaLista(lstFuncef, sCgcBenef) = -1) Then
                          bGrava := False;

                        if bGrava then
                        begin
                          //CJAC
                          GRegCompensacaoImpostoAnoAtual(ArquivoTexto, sCodNatureza, sCGCBenef, sAno, bGravaDadosBeneficiario);
                          //CJAA
                          GRegCompensacaoImpostoAnoAnterior(ArquivoTexto, sCodNatureza, sCGCBenef, sAno, bGravaDadosBeneficiario);
                          //ESRT
                          GRegExigibilidadeSuspensa(ArquivoTexto, sCodNatureza, sCGCBenef, sAno, bGravaDadosBeneficiario);
                          //ESPO
                          GRegDeducoesPrevidenciaOficial(ArquivoTexto,sCodNatureza,sCGCBenef,sAno,bGravaDadosBeneficiario);
                          //ESIR
                          GRegDeducoesImpostoRenda(ArquivoTexto, sCodNatureza, sCGCBenef, sAno, bGravaDadosBeneficiario);
                          //ESDJ
                          GRegDepositoJudicial(ArquivoTexto, sCodNatureza, sCGCBenef, sAno, bGravaDadosBeneficiario);
                        end;
                      end;
                    end;
                  End;
                '1': Begin
                    //edilaine SIG97214 : inicio
                    sLinhaArq := GravaLinhaValores(ArquivoTexto, 'RTPO', '1', sCodNatureza, Cds, True, false, true, '', (not bGravaDadosBeneficiario));
                    GRegBeneficiario(sLinhaArq, sCGCBenef, sAno, bGravaDadosBeneficiario, ArquivoTexto, sCodNatureza);
                    //edilaine SIG97214 : fim

                    //Marcio Sanches Spinosa SOL 245373 PPM 620985 - Inicio
                    If ((dRendimentoBruto = 0) And (dTributo > 0) And (Cds.fieldByname('CODNATUREZA').AsString = '3540')) Then
                      Begin
                        sCodNatureza := '3533';
                        //edilaine SIG97214 : inicio
                        sLinhaArq := GravaLinhaValores(ArquivoTexto, 'RTDP', '3', sCodNatureza, Cds, True, false, true, '', (not bGravaDadosBeneficiario));
                        sCodNatureza := '3540';
                        GRegBeneficiario(sLinhaArq, sCGCBenef, sAno, bGravaDadosBeneficiario, ArquivoTexto, sCodNatureza);
                        //edilaine SIG97214 : fim
                        bEntra := False;
                        dTributo := 0;
                      End;
                    If (bEntra) Then
                    begin
                      //edilaine SIG97214 : inicio
                      sLinhaArq := GravaLinhaValores(ArquivoTexto, 'RTDP', '3', sCodNatureza, Cds, True, false, true, '', (not bGravaDadosBeneficiario));
                      GRegBeneficiario(sLinhaArq, sCGCBenef, sAno, bGravaDadosBeneficiario, ArquivoTexto, sCodNatureza);
                      //edilaine SIG97214 : fim
                    end;
                    //Marcio Sanches Spinosa SOL 245373 PPM 620985 - Fim
                    //GravaLinhaValores(ArquivoTexto, 'RTPA', '2', sCodNatureza, Cds, True); // Andre Imakawa - SIG 61321
                    //if (sNatureza) = '3540' then

                    // WO13395 - Impostos - Geração da DIRF - Desconto simplificado
                    // Alterado por Arnaldo V. Scarin em 02/10/2024
                    //
                    // Gravacao do Registro - RTDS
                    sLinhaArq := GravaLinhaValores(ArquivoTexto, 'RTDS', '52', sCodNatureza, Cds, True, False, True, '', (not bGravaDadosBeneficiario));
                    GRegBeneficiario(sLinhaArq, sCGCBenef, sAno, bGravaDadosBeneficiario, ArquivoTexto, sCodNatureza);
                    // WO13395 - FIM


                    //edilaine SIG97214 : inicio
                    //GravaLinhaValores(ArquivoTexto, 'RTPA', '2', sCodNatureza, Cds, True, False, True, sLinhaRTPA); // Andre Imakawa - SIG 61321
                    sLinhaArq := GravaLinhaValores(ArquivoTexto, 'RTPA', '2', sCodNatureza, Cds, True, False, True, sLinhaRTPA, (not bGravaDadosBeneficiario));
                    GRegBeneficiario(sLinhaArq, sCGCBenef, sAno, bGravaDadosBeneficiario, ArquivoTexto, sCodNatureza);
                    //edilaine SIG97214 : fim

                  End;
                '2': Begin
                    If (sCodNatureza = '0561') Or
                       (sCodNatureza = '3556') Or  // Andre Imakawa - SIG 63867
                       (sCodNatureza = '5565') Or  // edilaine - SIG81238
                       (sCodNatureza = '3540') Then // Felipe A. Santos SOL 223584 KTN 2057497
                      Begin
                        if sCodNatureza <> '5565' then   // edilaine - SIG81238
                        begin
                           //edilaine SIG97214 : inicio
                           sLinhaArq := GravaLinhaValores(ArquivoTexto, 'RTPP', '1', sCodNatureza, Cds, True, False, True, sLinhaRTPA, (not bGravaDadosBeneficiario));
                           GRegBeneficiario(sLinhaArq, sCGCBenef, sAno, bGravaDadosBeneficiario, ArquivoTexto, sCodNatureza);
                           //edilaine SIG97214 : fim
                        end;

                        //ESPP
                        if sCodNatureza = '3540' then
                        begin
                          CdsJudicial.First;
                          if CdsJudicial.Locate('CODNATUREZA;CGCBENEF',
                                                VarArrayOf([sCodNatureza, sCgcBenef]), []) then
                          begin

                            bGrava := True;
                            if (iSistema = 0) And (ExisteNaLista(lstFuncef, sCgcBenef) = -1) then
                              bGrava := False;

                            if bGrava then
                              GRegDeducoesPrevidenciaPrivada(ArquivoTexto,
                                                             sCodNatureza,
                                                             sCGCBenef,
                                                             sAno,
                                                             bGravaDadosBeneficiario);
                          end;
                        end;
                        //Cássio Rovaroto - SIG nº 78096 - Início
                        // Paulo SOL243508/16869 PPM 630406 - início
                        //CdsIN1343.data := dadosIN1343(IdPessoa,
                        //  iSistema,
                        //  DataIni,
                        //  DataFim,
                        //  Copy(cdsEmpresa.FieldByName('NUMDOCUMENTO').AsString, 1, 8),
                        //  sCGCBenef);
                        //
                        //If Not CdsIN1343.isEmpty Then
                        //  GRegIR1343(ArquivoTexto, sCodNatureza, sCGCBenef, sAno, bGravaDadosBeneficiario);
                        // Paulo SOL243508/16869 PPM 630406 - fim
                        //Cássio Rovaroto - SIG nº 78096 - Fim

                      End;
                  End;
              End;
          //Cássio Rovaroto - SIG nº 82682 - Início
            End
          else
            if (Cds.FieldByName('TIPOREG').AsString = '0') and (Cds.fieldByname('CODNATUREZA').AsString = '3540') then
            begin
              //GRegNatureza(bGeraNovaNatureza, ArquivoTexto, sCodNatureza); // Edilaine - SOL 198116 / KTN 1914302    //edilaine SIG97214

              //CJAC
              GRegCompensacaoImpostoAnoAtual(ArquivoTexto, sCodNatureza, sCGCBenef, sAno, bGravaDadosBeneficiario);
              //CJAA
              GRegCompensacaoImpostoAnoAnterior(ArquivoTexto, sCodNatureza, sCGCBenef, sAno, bGravaDadosBeneficiario);
              //ESRT
              GRegExigibilidadeSuspensa(ArquivoTexto, sCodNatureza, sCGCBenef, sAno, bGravaDadosBeneficiario);
              //ESPO
              GRegDeducoesPrevidenciaOficial(ArquivoTexto,sCodNatureza,sCGCBenef,sAno,bGravaDadosBeneficiario);
              //ESIR
              GRegDeducoesImpostoRenda(ArquivoTexto, sCodNatureza, sCGCBenef, sAno, bGravaDadosBeneficiario);
              //ESDJ
              GRegDepositoJudicial(ArquivoTexto, sCodNatureza, sCGCBenef, sAno, bGravaDadosBeneficiario);
            end;
          //Cássio Rovaroto - SIG nº 82682 - Fim

          AtualizaFrmProgresso(iContador);

          Cds.Next;

          If (sCGCBenef <> Cds.FieldByName('CGCBENEF').AsString) Or
            (cds.Eof) Or (sNatureza <> Cds.FieldByName('CODNATUREZA').AsString) Then // alterado por Felipe A. Santos SOL 223584 KTN 2057497
            Begin
               bInfPA:= false; bInfPC:= false; //Darivaldo Alencar SIG 34429

              // Felipe A. Santos SOL 223584 KTN 2057497 - inicio comentário
              { for iInd := 0 to lstNatureza.count-1 do    // Edilaine - SOL 198116 / KTN 1914302
               begin
                 sCodNatureza := lstNatureza.Strings[iInd];
                 sCgcBenef    := lstCPFBenef[iInd];
                 // Edilaine - SOL 198116 / KTN 1914302 - fim
               }
              // Felipe A. Santos SOL 223584 KTN 2057497 - fim Comentário

              CdsJudicial.First;
              If CdsJudicial.Locate('CODNATUREZA;CGCBENEF',
                VarArrayOf([sCodNatureza, sCgcBenef]), []) Then
                Begin
                  bGrava := True;
                  If (iSistema = 0) And (ExisteNaLista(lstFuncef, sCgcBenef) = -1) Then
                    bGrava := False;

                  If bGrava Then
                    Begin
                      //            GRegBeneficiario(sCGCBenef,
                      //                             sAno,
                      //                             bGravaDadosBeneficiario,
                      //                             ArquivoTexto,
                      //                             sCodNatureza);
                                  //Fernando Xavier/Edilaine Ferraresi/Marcio Spinosa SOL 226715 KINTANA 2061081 - inicio
                      //Cássio rovaroto - SIG nº 78096 - Início
                      //If (sCodNatureza <> '3223') And (sCodNatureza <> '5565')
                      //  And (sCodNatureza <> '3556') And (sCodNatureza <> '3579') //Marcio Sanches Spinosa SOL 223465 KINTANA 2058652
                      {  and ((sCodNatureza <> '0561') and (StrToDate(sAno) >= 2014)) }//Then //Marcio Sanches Spinosa SOL 236783 KINTANA 497770
                      //  Begin
                          // Gera Linha de Nova Natureza;
                          //GRegNatureza(bGeraNovaNatureza, ArquivoTexto, sCodNatureza); // Edilaine - SOL 198116 / KTN 1914302 - comentado    //edilaine SIG97214

                          //GRegDeducoesPrevidenciaOficial(ArquivoTexto,
                          //  sCodNatureza,
                          //  sCGCBenef,
                          //  sAno,
                          //  bGravaDadosBeneficiario);

                          //GRegDeducoesPrevidenciaPrivada(ArquivoTexto,
                          //  sCodNatureza,
                          //  sCGCBenef,
                          //  sAno,
                          //  bGravaDadosBeneficiario);

                          //GReg65Anos(ArquivoTexto,
                          //  sCodNatureza,
                          //  sCGCBenef,
                          //  sAno,
                          //  bGravaDadosBeneficiario);
                          //GRegMolestiaGrave(ArquivoTexto,
                          //  sCodNatureza,
                          //  sCGCBenef,
                          //  sAno,
                          //  bGravaDadosBeneficiario);
                      //  End
                     // Else If (sCodNatureza = '5565') Then
                     //   Begin
                     //     GRegNatureza(bGeraNovaNatureza, ArquivoTexto, sCodNatureza); // Edilaine - SOL 198116 / KTN 1914302 - comentado
                     //
                     //     GRegMolestiaGrave(ArquivoTexto,
                     //       sCodNatureza,
                     //       sCGCBenef,
                     //       sAno,
                     //       bGravaDadosBeneficiario);
                     //   End;
                      //Fernando Xavier/Edilaine Ferraresi/Marcio Spinosa SOL 226715 KINTANA 2061081 - Fim
                      GRegDeducoesDependentes(ArquivoTexto, sCodNatureza, sCGCBenef, sAno, bGravaDadosBeneficiario);

                      //GRegCompensacaoImpostoAnoAtual(ArquivoTexto, sCodNatureza, sCGCBenef, sAno, bGravaDadosBeneficiario);
                      //GRegCompensacaoImpostoAnoAnterior(ArquivoTexto, sCodNatureza, sCGCBenef, sAno, bGravaDadosBeneficiario);

                      //GRegExigibilidadeSuspensa(ArquivoTexto, sCodNatureza, sCGCBenef, sAno, bGravaDadosBeneficiario);
                      //GRegDeducoesImpostoRenda(ArquivoTexto, sCodNatureza, sCGCBenef, sAno, bGravaDadosBeneficiario);
                      GRegDeducoesPensaoAlimenticia(ArquivoTexto, sCodNatureza, sCGCBenef, sAno, bGravaDadosBeneficiario);
                      //GRegDepositoJudicial(ArquivoTexto, sCodNatureza, sCGCBenef, sAno, bGravaDadosBeneficiario);

                      //GRegAjudaCusto(ArquivoTexto, sCodNatureza, rValorMinimo, sCGCBenef, sAno, bGravaDadosBeneficiario);
                      //GRegIndenizacao(ArquivoTexto, sCodNatureza, rValorIndenizacao, sCGCBenef, sAno, bGravaDadosBeneficiario);
                      //GRegAbono(ArquivoTexto, sCodNatureza, sCGCBenef, sAno, bGravaDadosBeneficiario);

                      //Cássio Rovaroto - SIG  nº 78096 - Início
                      GRegAjudaCusto(ArquivoTexto, sCodNatureza, rValorMinimo, sCGCBenef, sAno, bGravaDadosBeneficiario);
                      GRegIndenizacao(ArquivoTexto, sCodNatureza, rValorIndenizacao, sCGCBenef, sAno, bGravaDadosBeneficiario);
                      GRegAbono(ArquivoTexto, sCodNatureza, sCGCBenef, sAno, bGravaDadosBeneficiario);
                      if (sCodNatureza = '5565') then
                      begin
                        //GRegNatureza(bGeraNovaNatureza, ArquivoTexto, sCodNatureza); // Edilaine - SOL 198116 / KTN 1914302 - comentado    //edilaine SIG97214

                        GRegMolestiaGrave(ArquivoTexto,
                                          sCodNatureza,
                                          sCGCBenef,
                                          sAno,
                                          bGravaDadosBeneficiario);
                      end
                      else
                      if (sCodNatureza <> '3223') and (sCodNatureza <> '5565') and (sCodNatureza <> '3556') and (sCodNatureza <> '3579') then
                      begin
                        // Gera Linha de Nova Natureza;
                        //GRegNatureza(bGeraNovaNatureza, ArquivoTexto, sCodNatureza); // Edilaine - SOL 198116 / KTN 1914302 - comentado   //edilaine SIG97214

                        GReg65Anos(ArquivoTexto,
                                   sCodNatureza,
                                   sCGCBenef,
                                   sAno,
                                   bGravaDadosBeneficiario);
                        GRegMolestiaGrave(ArquivoTexto,
                                          sCodNatureza,
                                          sCGCBenef,
                                          sAno,
                                          bGravaDadosBeneficiario);
                      end;
                      //Cássio Rovaroto - SIG  nº 78096 - Fim
                    End; // if bGrava
                End; // if Locate

                if (sCodNatureza = '0561') or
                   (sCodNatureza = '3556') or
                   (sCodNatureza = '3540') or
                   (sCodNatureza = '5565') then
                begin
                  CdsIN1343.data := dadosIN1343(IdPessoa,
                                                iSistema,
                                                DataIni,
                                                DataFim,
                                                Copy(cdsEmpresa.FieldByName('NUMDOCUMENTO').AsString, 1, 8),
                                                sCGCBenef,
                                                sCodNatureza);
                                                //iff(sCodNatureza = '5565', sCodNatureza, ''));    // edilaine - SIG81238);
                        //
                        If Not CdsIN1343.isEmpty Then
                          GRegIR1343(ArquivoTexto, sCodNatureza, sCGCBenef, sAno, bGravaDadosBeneficiario);
                end;
                //Cássio Rovaroto - SIG nº 78096 - Fim

              //end; // Felipe A. Santos SOL 223584 KTN 2057497 End do For retirado

      //        If bEntra or Not bGravaDadosBeneficiario Then
      //        begin
      //          sLinha := 'INF|'+
      //                    CompletaZero(Copy(sCgcBenef,1,11),11)+'||';
      //          WriteLn(ArquivoTexto, sLinha);
      //        end;

              { // Felipe A. Santos SOL 223584 KTN 2057497 - inicio comentário
              lstNatureza.clear;   // Edilaine - SOL 198116 / KTN 1914302
              lstCPFBenef.clear;   // Edilaine - SOL 198116 / KTN 1914302
               // Felipe A. Santos SOL 223584 KTN 2057497 - fimcom}

              //bGravaDadosBeneficiario := True; //Denis Horongoso - SIG 73497

            //Luiz Carlos - SIG63948 - inicio
              if not(cds.eof) then
                 dVlrRendimento := VlrRendimentoIsendo(sCGCBenef)
              else
                 dVlrRendimento := VlrRendimentoIsendo(Cds.FieldByName('CGCBENEF').AsString);

            // Andre Imakawa - SIG 62774 - Inicio
	       if bLancaLinhaRIO or (dVlrRendimento > 0) then
            begin
              //Darivaldo Alencar SIG 28407 -inicio
              //if not(cds.eof) then
              //   dVlrRendimento:= VlrRendimentoIsendo(sCGCBenef)
              //else  dVlrRendimento:= VlrRendimentoIsendo(Cds.FieldByName('CGCBENEF').AsString);
              //Luiz Carlos - SIG63948 - Fim
              if (dVlrRendimento > 0 ) then
                begin
                   //GRegNatureza(bGeraNovaNatureza, ArquivoTexto, sCodNatureza);  //edilaine 97214
                   //GRegBeneficiario(Cds.fieldByname('CGCBENEF').AsString,sAno,bGravaDadosBeneficiario,ArquivoTexto,sCodNatureza); //Denis Horongoso - SIG 73497
                   GRegBeneficiario(sCGCBenef,sAno,bGravaDadosBeneficiario,ArquivoTexto,sCodNatureza); //Denis Horongoso - SIG 73497

                   //Luiz Carlos - SIG63948 - Fim
                   sLinha:= 'RIO|' +
                            CompletaZero(StringReplace(FormatFloat('#.00', dVlrRendimento),'.','',[rfReplaceAll, rfIgnoreCase]),13) +'|'+
                            Completa('OUTROS - RENDIMENTOS ISENTOS AÇÃO JUDICIAL/PECÚLIO',60)+'|';
                   writeln(ArquivoTexto, sLinha);
                end;
              //Darivaldo Alencar SIG 28407 - fim
            end;
            bLancaLinhaRIO := False;

            bGravaDadosBeneficiario := True; //Denis Horongoso - SIG 73497

            // Andre Imakawa - SIG 62774 - Fim

            End;
        End; // end 2 while

      // Fernando Xavier/Edilaine Ferraresi/Marcio Spinosa SOL 226715 KINTANA 2061081 - Inicio
      If (Cds.eof) Or (Cds.RecNo Mod 2000 = 0) Then
        Begin
          CloseFile(ArquivoTexto);

          inc(iNumArq);
          sArqParcial := 'c:\Planus\Temp\ArqDirf_' + CompletaZero(intToStr(iNumArq), 3);
          AssignFile(ArquivoTexto, sArqParcial);
          ReWrite(ArquivoTexto);
        End;
      // Fernando Xavier/Edilaine Ferraresi/Marcio Spinosa SOL 226715 KINTANA 2061081 - fim

    End; // end 1 while
  //Vinicius Maciel SOL 170987 KTN 1528710
  //Procedimento para se gravar o RRA
  If iSistema = 1 Then
    IncluiDadosRRA(ArquivoTexto, lstFuncef, sAno); // Andre Imakawa - SIG 61321
  //Vinicius Maciel SOL 170987 KTN 1528710 - FIM
  If iSistema = 0 Then
    Begin
      //Vinicius Maciel SOL 170987 KTN 1528710
      If StrToInt(sAno) >= 2011 Then
        Begin
          CdsPlanoOdonto.data := ListDadosPlanoSaude(IdPessoa,
            iSistema,
            DataIni,
            DataFim,
            Copy(cdsEmpresa.FieldByName('NUMDOCUMENTO').AsString, 1, 8),
            2,
            sCPFFiltro);
          CdsDependentePlanoOdonto.data := ListDadosDependentesPlanoSaude(IdPessoa,
            iSistema,
            sAno,
            Copy(cdsEmpresa.FieldByName('NUMDOCUMENTO').AsString, 1, 8),
            2,
            sCPFFiltro);
          CdsResponsavelOdonto.Data := ListResponsavelPlano(idPlanoOdonto);
        End;
      //Vinicius Maciel SOL 170987 KTN 1528710 - FIM

      CdsResponsavelPlano.Data := ListResponsavelPlano(idPlanoSaude);
      CdsPlanoSaude.data := ListDadosPlanoSaude(IdPessoa,
        iSistema,
        DataIni,
        DataFim,
        Copy(cdsEmpresa.FieldByName('NUMDOCUMENTO').AsString, 1, 8),
        1, //Vinicius Maciel SOL 170987 KTN 1528710
        sCPFFiltro);
      CdsDependentePlanoSaude.Data := ListDadosDependentesPlanoSaude(IdPessoa,
        iSistema,
        sAno,
        Copy(cdsEmpresa.FieldByName('NUMDOCUMENTO').AsString, 1, 8),
        1, //Vinicius Maciel SOL 170987 KTN 1528710
        sCPFFiltro);
      IncluiDadosPlanoSaude(ArquivoTexto, lstFuncef);
    End;

  //sLinha := 'FIMDIRF|';            // William Santana - 34429 - merge
  //writeln(ArquivoTexto, sLinha);   // William Santana - 34429 - merge
  FreeAndNil(lstFuncef);

  FreeAndNil(lstInsNatureza);        //edilaine SIG97214

  frmProgresso.EscondeFormProgresso;
  CloseFile(ArquivoTexto);

  // Fernando Xavier/Edilaine Ferraresi/Marcio Spinosa SOL 226715 KINTANA 2061081 - Inicio
  WinExec(PChar('cmd /c COPY /B C:\planus\temp\ArqDirf_*.* c:\planus\temp\ArqDirf_geral.txt'), sw_hide);
  Sleep(3000); //Marcio Sanches Spinosa SOL 238101, 235991 e 236972 PPM 497515, 497580 e 499001 //Andre Imakawa - SIG 40287
  While Not FileExists('c:\planus\temp\ArqDirf_geral.txt') Do
    Sleep(3000); //Marcio Sanches Spinosa SOL 238101, 235991 e 236972 PPM 497515, 497580 e 499001 //Andre Imakawa - SIG 40287
  If Not CopyFile(Pchar('c:\planus\temp\ArqDirf_geral.txt'), Pchar(sNomeArquivo), false) Then
    MessageInfo := 'Erro ao gerar arquivo';

  WinExec(PChar('cmd /c COPY /B c:\planus\temp\ArqDirf_geral.txt ' + Pchar(sNomeArquivo)), sw_hide); //Marcio Sanches Spinosa SOL 238101, 235991 e 236972 PPM 497515, 497580 e 499001
  // Fernando Xavier/Edilaine Ferraresi/Marcio Spinosa SOL 226715 KINTANA 2061081 - fim

End;

Procedure TCtrlGeraDirfNova.SomaValores65Anos(Const pCodNatureza, pCPF: String);
Begin
  // Se estiver tudo certo, a Joelma disse que está lindo!!!!!
  If CdsJudicial.Locate('CODNATUREZA;CGCBENEF', VarArrayOf([pCodNatureza, pCPF]), []) Then
    Begin
      With Cds Do
        Begin
          Edit;
          FieldByName('JAN1').AsFloat := Cds.FieldByName('JAN1').AsFloat + CdsJudicial.FieldByName('JAN10').AsFloat;
          FieldByName('FEV1').AsFloat := Cds.FieldByName('FEV1').AsFloat + CdsJudicial.FieldByName('FEV10').AsFloat;
          FieldByName('MAR1').AsFloat := Cds.FieldByName('MAR1').AsFloat + CdsJudicial.FieldByName('MAR10').AsFloat;
          FieldByName('ABR1').AsFloat := Cds.FieldByName('ABR1').AsFloat + CdsJudicial.FieldByName('ABR10').AsFloat;
          FieldByName('MAI1').AsFloat := Cds.FieldByName('MAI1').AsFloat + CdsJudicial.FieldByName('MAI10').AsFloat;
          FieldByName('JUN1').AsFloat := Cds.FieldByName('JUN1').AsFloat + CdsJudicial.FieldByName('JUN10').AsFloat;
          FieldByName('JUL1').AsFloat := Cds.FieldByName('JUL1').AsFloat + CdsJudicial.FieldByName('JUL10').AsFloat;
          FieldByName('AGO1').AsFloat := Cds.FieldByName('AGO1').AsFloat + CdsJudicial.FieldByName('AGO10').AsFloat;
          FieldByName('SET1').AsFloat := Cds.FieldByName('SET1').AsFloat + CdsJudicial.FieldByName('SET10').AsFloat;
          FieldByName('OUT1').AsFloat := Cds.FieldByName('OUT1').AsFloat + CdsJudicial.FieldByName('OUT10').AsFloat;
          FieldByName('NOV1').AsFloat := Cds.FieldByName('NOV1').AsFloat + CdsJudicial.FieldByName('NOV10').AsFloat;
          FieldByName('DEZ1').AsFloat := Cds.FieldByName('DEZ1').AsFloat + CdsJudicial.FieldByName('DEZ10').AsFloat;
          FieldByName('VLR131').AsFloat := Cds.FieldByName('VLR131').AsFloat + CdsJudicial.FieldByName('DEZ10').AsFloat;
          Post;
        End;
    End;
End;

Procedure TCtrlGeraDirfNova.AtualizaFrmProgresso(Var iContador: Integer);
Begin
  Inc(FProgresso);
  inc(iContador);
  frmProgresso.AndaFormProgresso(iContador);
  Application.ProcessMessages;
  frmProgresso.Repaint;
End;

Procedure TCtrlGeraDirfNova.IncluiDadosPlanoSaude(Const pArquivo: TextFile; Const pLista: TStringList);
Var iContador: Integer;
Begin
  iContador := 0;
  WriteLn(pArquivo, 'PSE|');
  //Vinicius Maciel SOL 170987 KTN 1528710
  If StrToInt(sAno2011) >= 2011 Then
    Begin
      GravaLinhaPlanoOdontologico(pArquivo);
      cdsPlanoOdonto.First;
      FMaxProgresso := CdsPlanoOdonto.RecordCount;
      FProgresso := 0;
      While Not CdsPlanoOdonto.Eof Do
        Begin
          GravaLinhaPessoaOdonto(pArquivo, pLista);
          CdsPlanoOdonto.Next;
          AtualizaFrmProgresso(iContador);
        End;
    End;
  //Vinicius Maciel SOL 170987 KTN 1528710 - FIM
  iContador := 0;
  GravaLinhaPlanoSaude(pArquivo);
  cdsPlanoSaude.First;
  FMaxProgresso := CdsPlanoSaude.RecordCount;
  FProgresso := 0;
  While Not CdsPlanoSaude.Eof Do
    Begin
      GravaLinhaPessoa(pArquivo, pLista);
      CdsPlanoSaude.Next;
      AtualizaFrmProgresso(iContador);
    End;
End;

Procedure TCtrlGeraDirfNova.GravaLinhaPlanoSaude(Const pArquivo: TextFile);
Var sLinha: String;
Begin
  sLinha := 'OPSE|' +
    CompletaZero(Copy(CdsResponsavelPlano.fieldByname('NUMDOCUMENTO').AsString, 1, 14), 14) + '|' +
    CaracteresEspeciais(CdsResponsavelPlano.FieldByName('RAZAOSOCIAL').asString) + '|' +
    CompletaZero(StringReplace(CdsResponsavelPlano.fieldByname('ANS').AsString, '-', '', [rfReplaceAll]), 6) + '|';
  WriteLn(pArquivo, sLinha);
End;

Function TCtrlGeraDirfNova.LocalizaNome(Const pCPF: String): String;
Var sSql: String;
  oSql: TClientDataSet;
Begin
  oSql := TClientDataSet.Create(Nil);
  Try
    //Vinicius Maciel SOL 170987 KTN 1528710
    //Ajustado para não retornar em Branco o nome do funcionário que possuir * no final DO NOME
    sSql := ' Select Nome from Pessoa ' + #13#10 +
      ' where Numdocumento = ' + QuotedStr(pCPF) + //;
    ' and Nome not like ''%*%''';
    oSql.Data := GetDataPacket(sSql);
    If Not oSql.isEmpty Then
      result := oSql.FieldByName('Nome').asString
    Else
      Begin
        sSql := ' Select Nome from Pessoa ' + #13#10 +
          ' where Numdocumento = ' + QuotedStr(pCPF);
        oSql.Data := GetDataPacket(sSql);
        result := ajustaCaracteresNome(oSql.FieldByName('Nome').asString);
      End;
    {While Not oSql.EOF do
    begin
      If Pos('*',oSql.FieldByName('Nome').asString) = 0 then
      begin
        Result := oSql.FieldByName('Nome').asString;
        break;
      end;
      oSql.next;
    end;     }
  Finally
    oSql.Close;
    FreeAndNil(oSql);
  End;
End;

Procedure TCtrlGeraDirfNova.GravaLinhaPessoa(Const pArquivo: TextFile; Const pLista: TStringList);
Var sLinha: String;
Begin
  If ExisteNaLista(pLista, CdsPlanoSaude.fieldByname('NUMDOCUMENTO').AsString) <> -1 Then
    Begin
      sLinha := 'TPSE|' +
        CompletaZero(Copy(CdsPlanoSaude.fieldByname('NUMDOCUMENTO').AsString, 1, 11), 11) + '|' + // CPF Resp.
      //Vinicius Maciel SOL 170987 KTN 1528710
      //CaracteresEspeciais(LocalizaNome(CdsPlanoSaude.fieldByname('NUMDOCUMENTO').AsString))+'|'+
      LocalizaNome(CdsPlanoSaude.fieldByname('NUMDOCUMENTO').AsString) + '|' +
        //CompletaZero(StringReplace(CdsPlanoSaude.fieldByname('Valor').AsString, '-', '', [rfReplaceAll]),15)+'|';
      CompletaZero(StringReplace(CdsPlanoSaude.fieldByname('Valor').AsString, '-', '', [rfReplaceAll]), 13) + '|';
      //Vinicius Maciel SOL 170987 KTN 1528710 - FIM
      WriteLn(pArquivo, sLinha);
      GravaLinhasDependentes(pArquivo, pLista, CdsPlanoSaude.FieldbyName('NumDocumento').asString)
    End;
End;

//Vinicius Maciel SOL 170987 KTN 1528710

Procedure TCtrlGeraDirfNova.GravaLinhaPessoaOdonto(Const pArquivo: TextFile; Const pLista: TStringList);
Var sLinha: String;
Begin
  If ExisteNaLista(pLista, CdsPlanoOdonto.fieldByname('NUMDOCUMENTO').AsString) <> -1 Then
    Begin
      sLinha := 'TPSE|' +
        CompletaZero(Copy(CdsPlanoOdonto.fieldByname('NUMDOCUMENTO').AsString, 1, 11), 11) + '|' + // CPF Resp.
      //CaracteresEspeciais(LocalizaNome(CdsPlanoOdonto.fieldByname('NUMDOCUMENTO').AsString))+'|'+
      LocalizaNome(CdsPlanoOdonto.fieldByname('NUMDOCUMENTO').AsString) + '|' +
        CompletaZero(StringReplace(CdsPlanoOdonto.fieldByname('Valor').AsString, '-', '', [rfReplaceAll]), 13) + '|';
      WriteLn(pArquivo, sLinha);
      GravaLinhasDependentesOdonto(pArquivo, pLista, CdsPlanoOdonto.FieldbyName('NumDocumento').asString)
    End;
End;
//Vinicius Maciel SOL 170987 KTN 1528710 - FIM

Procedure TCtrlGeraDirfNova.GravaLinhasDependentes(Const pArquivo: TextFile;
  Const pLista: TStringList;
  Const pNumDocumento: String);
Var sLinha: String;
Begin
  If CdsDependentePlanoSaude.Locate('CPFTITULAR', pNumDocumento, [loCaseInsensitive]) Then
    Begin
      While CdsDependentePlanoSaude.FieldByName('CPFTITULAR').asString = pNumDocumento Do
        Begin
          sLinha := ''; // Edilaine - SOL 200079 / KTN 1927638

          ///Vinicius Maciel SOL 170987 KTN 1528710
          //Adicionado o if abaixo para retornar nulo quando não possuir CPF.
          //Mudado a data de nascimento de posição
          //Mudado o tamanho do último campo de 15 para 13
          If (sTrToInt(sAno2011) >= 2011) Then
            Begin
              If (CdsDependentePlanoSaude.FieldByName('CPFTITULAR').asString <> // Edilaine - SOL 200079 / KTN 1927638
                CdsDependentePlanoSaude.fieldByname('NUMDOCUMENTO').AsString) Then // Edilaine - SOL 200079 / KTN 1927638
                Begin
                  sLinha := 'DTPSE|';
                  If (CdsDependentePlanoSaude.fieldByname('NUMDOCUMENTO').AsString = '') Then //procedimento para DIRF 2011
                    sLinha := sLinha + '|'
                  Else
                    sLinha := sLinha + CompletaZero(Copy(CdsDependentePlanoSaude.fieldByname('NUMDOCUMENTO').AsString, 1, 11), 11) + '|'; // CPF Resp.
                  sLinha := sLinha + FormatDateTime('YYYYMMDD', CdsDependentePlanoSaude.FieldByName('DataNasc').asDateTime) + '|' +
                    CaracteresEspeciais(AjustaNome(CdsDependentePlanoSaude.fieldByname('NOME').AsString, 60)) + '|' +
                    CdsDependentePlanoSaude.FieldByName('Dependencia').asString + '|' +
                    CompletaZero(StringReplace(CdsDependentePlanoSaude.fieldByname('Valor').AsString, '-', '', [rfReplaceAll]), 13) + '|';
                End;
            End
          Else
            Begin
              { sLinha := 'DTPSE|' +
               CompletaZero(Copy(CdsDependentePlanoSaude.fieldByname('NUMDOCUMENTO').AsString,1,11),11)+'|'+  // CPF Resp.
               CaracteresEspeciais(AjustaNome(CdsDependentePlanoSaude.fieldByname('NOME').AsString,60))+'|'+
               FormatDateTime('DDMMYYYY',CdsDependentePlanoSaude.FieldByName('DataNasc').asDateTime)+'|' +
               CdsDependentePlanoSaude.FieldByName('Dependencia').asString+'|'+
               CompletaZero(StringReplace(CdsDependentePlanoSaude.fieldByname('Valor').AsString, '-', '', [rfReplaceAll]),15)+'|'; }
            End;
          //Vinicius Maciel SOL 170987 KTN 1528710 - FIM

          If sLinha <> '' Then // Edilaine - SOL 200079 / KTN 1927638
            WriteLn(pArquivo, sLinha);

          CdsDependentePlanoSaude.Next;
          If CdsDependentePlanoSaude.Eof Then
            Break;
        End;
    End;
End;

//Vinicius Maciel SOL 170987 KTN 1528710

Procedure TCtrlGeraDirfNova.GravaLinhasDependentesOdonto(Const pArquivo: TextFile;
  Const pLista: TStringList;
  Const pNumDocumento: String);
Var sLinha: String;
Begin
  If CdsDependentePlanoOdonto.Locate('CPFTITULAR', pNumDocumento, [loCaseInsensitive]) Then
    Begin
      While CdsDependentePlanoOdonto.FieldByName('CPFTITULAR').asString = pNumDocumento Do
        Begin
          If (CdsDependentePlanoOdonto.fieldByname('NUMDOCUMENTO').AsString <> // Edilaine - SOL 200079 / KTN 1927638
            CdsDependentePlanoOdonto.FieldByName('CPFTITULAR').asString) Then // Edilaine - SOL 200079 / KTN 1927638
            Begin
              sLinha := 'DTPSE|';
              If (CdsDependentePlanoOdonto.fieldByname('NUMDOCUMENTO').AsString = '') Then
                sLinha := sLinha + '|'
              Else
                sLinha := sLinha + CompletaZero(Copy(CdsDependentePlanoOdonto.fieldByname('NUMDOCUMENTO').AsString, 1, 11), 11) + '|'; // CPF Resp.
              sLinha := sLinha + FormatDateTime('YYYYMMDD', CdsDependentePlanoOdonto.FieldByName('DataNasc').asDateTime) + '|' +
                CaracteresEspeciais(AjustaNome(CdsDependentePlanoOdonto.fieldByname('NOME').AsString, 60)) + '|' +
                CdsDependentePlanoOdonto.FieldByName('Dependencia').asString + '|' +
                CompletaZero(StringReplace(CdsDependentePlanoOdonto.fieldByname('Valor').AsString, '-', '', [rfReplaceAll]), 13) + '|';
              WriteLn(pArquivo, sLinha);
            End;
          CdsDependentePlanoOdonto.Next;
          If CdsDependentePlanoOdonto.Eof Then
            Break;
        End;
    End;
End;
//Vinicius Maciel SOL 170987 KTN 1528710 - FIM

Function TCtrlGeraDirfNova.AjustaNome(Const pNome: String; Const pTamanho: Integer): String;
Var nTamanho: integer;
Begin
  Result := Trim(pNome);
  nTamanho := length(Result);
  If nTamanho < pTamanho Then
    result := Result + StringOfChar(' ', (pTamanho - nTamanho))
  Else
    Result := Copy(Result, 1, pTamanho);
End;

Procedure TCtrlGeraDirfNova.Rodape(contador_: integer);
Var
  k, j, i, temp: integer;
  scontador, temp3: String;
  somatorioA, somatorioB: extended;
Begin
  temp3 := '';
  scontador := '';
  scontador := completaZERO(inttostr(contador_), 8);
  temp3 := listaDirf[listaDirf.count - 1];
  For k := 1 To 8 Do
    temp3[k] := scontador[k];
  scontador := CompletaZero(inttostr(listaDirf.count + listaImport.count - 4), 4);
  For k := 29 To 32 Do
    temp3[k] := scontador[k - 28];
  temp := 103;
  For i := 1 To 39 Do
    Begin
      scontador := '';
      For k := temp To temp + 14 Do
        scontador := scontador + listaDirf[listaDirf.count - 1][k];
      somatorioA := strtofloat(scontador);
      scontador := '';
      For k := temp To temp + 14 Do
        scontador := scontador + listaImport[listaImport.count - 1][k];
      somatorioB := strtofloat(scontador);
      scontador := CompletaZero(floattostr(somatorioA + somatorioB), 15);
      j := 1;
      For k := temp To temp + 14 Do
        Begin
          temp3[k] := scontador[j];
          inc(j);
        End;
      inc(temp, 15);
    End;
  listatemp.add(temp3);
End;

Function TCtrlGeraDirfNova.ListValoresModulo21Normal(Const iIDBenefIrrf: Extended; sCodNatureza, DataIni, DataFim: String): OleVariant;
Var sSQL: String;
Begin
  sSQl :=
    'SELECT  ' +
    '    NVL((SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0))) * 100,0) AS AGO3, ' +
    '    NVL((SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0))) * 100,0) AS SET3, ' +
    '    NVL((SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0))) * 100,0) AS OUT3, ' +
    '    NVL((SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0))) * 100,0) AS NOV3, ' +
    '    NVL((SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0))) * 100,0) AS DEZ3, ' +
    '    NVL((SUM(DECODE(I.CODDIRF,''6'',LI.VLRLANC,0))) * 100,0) AS VLR132 ' +
    'FROM ' +
    '    INFORME I, ' +
    '    LANCXINFORME LI, ' +
    '    LANCIRRF L, ' +
    '    NATURENDIMENTO N ' +
    'WHERE ' +
    '    (I.IDINFORME = LI.IDINFORME) ' +
    'AND (LI.IDLANCIRRF = L.IDLANCIRRF) ' +
    'AND (L.CODNATUREZA = N.CODNATUREZA) ' +
    'AND (N.FLGUSADONADIRF = ''S'') ' +
    'AND (L.datapagamento BETWEEN TO_DATE(' + quotedStr(DataIni) + ',''DD/MM/YYYY'') AND TO_DATE(' + quotedStr(DataFim) + ',''DD/MM/YYYY'')) ' +
    'AND (L.IDBENEFIRRF = ' + FloatToStr(iIDBenefIrrf) + ') ' +
    'AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 21) ' +
    'AND (L.CODNATUREZA = ' + QuotedStr(sCodNatureza) + ') ';
  Result := GetDataPacket(sSQL);
End;

Function TCtrlGeraDirfNova.ListValoresModuloDif21Normal(Const iIDBenefIrrf: Extended; sCodNatureza, DataIni, DataFim: String): OleVariant;
Var sSQL: String;
Begin
  sSQl :=
    'SELECT  ' +
    '    NVL((SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0))+100) * 100,0) AS AGO3, ' +
    '    NVL((SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0))+100) * 100,0) AS SET3, ' +
    '    NVL((SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0))+100) * 100,0) AS OUT3, ' +
    '    NVL((SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0))+100) * 100,0) AS NOV3, ' +
    '    NVL((SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0))+100) * 100,0) AS DEZ3, ' +
    '    NVL((SUM(DECODE(I.CODDIRF,''6'',LI.VLRLANC,0))+100) * 100,0) AS VLR132 ' +
    'FROM ' +
    '    INFORME I, ' +
    '    LANCXINFORME LI, ' +
    '    LANCIRRF L, ' +
    '    NATURENDIMENTO N ' +
    'WHERE ' +
    '    (I.IDINFORME = LI.IDINFORME) ' +
    'AND (LI.IDLANCIRRF = L.IDLANCIRRF) ' +
    'AND (L.CODNATUREZA = N.CODNATUREZA) ' +
    'AND (N.FLGUSADONADIRF = ''S'') ' +
    'AND (L.datapagamento BETWEEN TO_DATE(' + quotedStr(DataIni) + ',''DD/MM/YYYY'') AND TO_DATE(' + quotedStr(DataFim) + ',''DD/MM/YYYY'')) ' +
    'AND (L.IDBENEFIRRF = ' + FloatToStr(iIDBenefIrrf) + ') ' +
    'AND (NVL(L.IDMODULORESPON,L.IDMODULO) <> 21) ' +
    'AND (L.CODNATUREZA = ' + QuotedStr(sCodNatureza) + ') ';

  Result := GetDataPacket(sSQL);
End;

Function TCtrlGeraDirfNova.ListValoresModulo21Judicial(Const iIDBenefIrrf: Extended; sCodNatureza, DataIni, DataFim: String): OleVariant;
Var sSQL: String;
Begin
  sSQl :=
    'SELECT  ' +
    '    NVL((SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0))) * 100,0) AS AGO7, ' +
    '    NVL((SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0))) * 100,0) AS SET7, ' +
    '    NVL((SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0))) * 100,0) AS OUT7, ' +
    '    NVL((SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0))) * 100,0) AS NOV7, ' +
    '    NVL((SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0))) * 100,0) AS DEZ7, ' +
    '    NVL((SUM(DECODE(I.CODDIRF,''11'',LI.VLRLANC,0))) * 100,0) AS VLR135 ' +
    'FROM ' +
    '    INFORME I, ' +
    '    LANCXINFORME LI, ' +
    '    LANCIRRF L, ' +
    '    NATURENDIMENTO N ' +
    'WHERE ' +
    '    (I.IDINFORME = LI.IDINFORME) ' +
    'AND (LI.IDLANCIRRF = L.IDLANCIRRF) ' +
    'AND (L.CODNATUREZA = N.CODNATUREZA) ' +
    'AND (N.FLGUSADONADIRF = ''S'') ' +
    'AND (L.datapagamento BETWEEN TO_DATE(' + quotedStr(DataIni) + ',''DD/MM/YYYY'') AND TO_DATE(' + quotedStr(DataFim) + ',''DD/MM/YYYY'')) ' +
    'AND (L.IDBENEFIRRF = ' + FloatToStr(iIDBenefIrrf) + ') ' +
    'AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 21) ' +
    'AND (L.CODNATUREZA = ' + QuotedStr(sCodNatureza) + ') ';
  Result := GetDataPacket(sSQL);
End;

Function TCtrlGeraDirfNova.ListValoresModuloDif21Judicial(Const iIDBenefIrrf: Extended; sCodNatureza, DataIni, DataFim: String): OleVariant;
Var sSQL: String;
Begin
  sSQl :=
    'SELECT  ' +
    '    NVL((SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0))+100) * 100,0) AS AGO7, ' +
    '    NVL((SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0))+100) * 100,0) AS SET7, ' +
    '    NVL((SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0))+100) * 100,0) AS OUT7, ' +
    '    NVL((SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0))+100) * 100,0) AS NOV7, ' +
    '    NVL((SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0))+100) * 100,0) AS DEZ7, ' +
    '    NVL((SUM(DECODE(I.CODDIRF,''11'',LI.VLRLANC,0))+100) * 100,0) AS VLR135 ' +
    'FROM ' +
    '    INFORME I, ' +
    '    LANCXINFORME LI, ' +
    '    LANCIRRF L, ' +
    '    NATURENDIMENTO N ' +
    'WHERE ' +
    '    (I.IDINFORME = LI.IDINFORME) ' +
    'AND (LI.IDLANCIRRF = L.IDLANCIRRF) ' +
    'AND (L.CODNATUREZA = N.CODNATUREZA) ' +
    'AND (N.FLGUSADONADIRF = ''S'') ' +
    'AND (L.datapagamento BETWEEN TO_DATE(' + quotedStr(DataIni) + ',''DD/MM/YYYY'') AND TO_DATE(' + quotedStr(DataFim) + ',''DD/MM/YYYY'')) ' +
    'AND (L.IDBENEFIRRF = ' + FloatToStr(iIDBenefIrrf) + ') ' +
    'AND (NVL(L.IDMODULORESPON,L.IDMODULO) <> 21) ' +
    'AND (L.CODNATUREZA = ' + QuotedStr(sCodNatureza) + ') ';

  Result := GetDataPacket(sSQL);
End;

Function TCtrlGeraDirfNova.ListGeraDirfFUNCEF(IdPessoa,
  iSistema: Integer;
  DataIni,
  DataFim,
  NumDocumento: String;
  bRetencao: Boolean;
  rValorMinimo: Real;
  chkParticipMantido: Boolean;
  edPessoanotin: String;
  sCPFFiltro: String): OleVariant;
Var

  Ssql: TstringList;
  iAno, iMes, iDia: word;
Begin

  DecodeDate(StrToDate(DataIni), iAno, iMes, iDia);

  Ssql := TStringList.Create;
  sSql.Clear;                         //Arnaldo - WO13395
  With Ssql Do
    Begin
      Append('SELECT distinct');
      Append('        P.TIPO, (TRIM(DECODE(P.RAZAOSOCIAL, '''', P.NOME, P.RAZAOSOCIAL))) AS NOMEBENEF, RTRIM(P.NUMDOCUMENTO) AS CGCBENEF,'); //Marilza Colpani-SOL 125645/KTN 649749
      Append(' XB.TIPOREG, '); //CPREV - Pend. 27026
      Append('        E.NUMDOCUMENTO AS CGCEMPRE, (DECODE(E.RAZAOSOCIAL, '''', E.NOME, E.RAZAOSOCIAL)) AS NOMEEMPRE, RTRIM(XB.CODNATUREZA) AS CODNATUREZA,'); //Marilza Colpani-SOL 125645/KTN 649749
      // Andre Imakawa - SIG 81206 - Inicio
      //Append('        NVL(TRUNC(DECODE(SIGN(XB.JAN1),-1,0,XB.JAN1*100)),0) AS JAN1,NVL(TRUNC(XB.JAN2*100),0) AS JAN2,NVL(TRUNC(DECODE(SIGN(XB.JAN3),-1,0,XB.JAN3*100)),0) AS JAN3,');
      //Append('        NVL(TRUNC(DECODE(SIGN(XB.FEV1),-1,0,XB.FEV1*100)),0) AS FEV1,NVL(TRUNC(XB.FEV2*100),0) AS FEV2,NVL(TRUNC(DECODE(SIGN(XB.FEV3),-1,0,XB.FEV3*100)),0) AS FEV3,');
      //Append('        NVL(TRUNC(DECODE(SIGN(XB.MAR1),-1,0,XB.MAR1*100)),0) AS MAR1,NVL(TRUNC(XB.MAR2*100),0) AS MAR2,NVL(TRUNC(DECODE(SIGN(XB.MAR3),-1,0,XB.MAR3*100)),0) AS MAR3,');
      //Append('        NVL(TRUNC(DECODE(SIGN(XB.ABR1),-1,0,XB.ABR1*100)),0) AS ABR1,NVL(TRUNC(XB.ABR2*100),0) AS ABR2,NVL(TRUNC(DECODE(SIGN(XB.ABR3),-1,0,XB.ABR3*100)),0) AS ABR3,');
      //Append('        NVL(TRUNC(DECODE(SIGN(XB.MAI1),-1,0,XB.MAI1*100)),0) AS MAI1,NVL(TRUNC(XB.MAI2*100),0) AS MAI2,NVL(TRUNC(DECODE(SIGN(XB.MAI3),-1,0,XB.MAI3*100)),0) AS MAI3,');
      //Append('        NVL(TRUNC(DECODE(SIGN(XB.JUN1),-1,0,XB.JUN1*100)),0) AS JUN1,NVL(TRUNC(XB.JUN2*100),0) AS JUN2,NVL(TRUNC(DECODE(SIGN(XB.JUN3),-1,0,XB.JUN3*100)),0) AS JUN3,');
      //Append('        NVL(TRUNC(DECODE(SIGN(XB.JUL1),-1,0,XB.JUL1*100)),0) AS JUL1,NVL(TRUNC(XB.JUL2*100),0) AS JUL2,NVL(TRUNC(DECODE(SIGN(XB.JUL3),-1,0,XB.JUL3*100)),0) AS JUL3,');
      //Append('        NVL(TRUNC(DECODE(SIGN(XB.AGO1),-1,0,XB.AGO1*100)),0) AS AGO1,NVL(TRUNC(XB.AGO2*100),0) AS AGO2,NVL(TRUNC(DECODE(SIGN(XB.AGO3),-1,0,XB.AGO3*100)),0) AS AGO3,');
      //Append('        NVL(TRUNC(DECODE(SIGN(XB.SET1),-1,0,XB.SET1*100)),0) AS SET1,NVL(TRUNC(XB.SET2*100),0) AS SET2,NVL(TRUNC(DECODE(SIGN(XB.SET3),-1,0,XB.SET3*100)),0) AS SET3,');
      //Append('        NVL(TRUNC(DECODE(SIGN(XB.OUT1),-1,0,XB.OUT1*100)),0) AS OUT1,NVL(TRUNC(XB.OUT2*100),0) AS OUT2,NVL(TRUNC(DECODE(SIGN(XB.OUT3),-1,0,XB.OUT3*100)),0) AS OUT3,');
      //Append('        NVL(TRUNC(DECODE(SIGN(XB.NOV1),-1,0,XB.NOV1*100)),0) AS NOV1,NVL(TRUNC(XB.NOV2*100),0) AS NOV2,NVL(TRUNC(DECODE(SIGN(XB.NOV3),-1,0,XB.NOV3*100)),0) AS NOV3,');
      //Append('        NVL(TRUNC(DECODE(SIGN(XB.DEZ1),-1,0,XB.DEZ1*100)),0) AS DEZ1,NVL(TRUNC(XB.DEZ2*100),0) AS DEZ2,NVL(TRUNC(DECODE(SIGN(XB.DEZ3),-1,0,XB.DEZ3*100)),0) AS DEZ3,');
      Append('        DECODE(XB.TIPOREG,2,NVL(TRUNC(XB.JAN1*100),0),NVL(TRUNC(DECODE(SIGN(XB.JAN1),-1,0,XB.JAN1*100)),0)) AS JAN1,NVL(TRUNC(XB.JAN2*100),0) AS JAN2,NVL(TRUNC(DECODE(SIGN(XB.JAN3),-1,0,XB.JAN3*100)),0) AS JAN3,');
      Append('        DECODE(XB.TIPOREG,2,NVL(TRUNC(XB.FEV1*100),0),NVL(TRUNC(DECODE(SIGN(XB.FEV1),-1,0,XB.FEV1*100)),0)) AS FEV1,NVL(TRUNC(XB.FEV2*100),0) AS FEV2,NVL(TRUNC(DECODE(SIGN(XB.FEV3),-1,0,XB.FEV3*100)),0) AS FEV3,');
      Append('        DECODE(XB.TIPOREG,2,NVL(TRUNC(XB.MAR1*100),0),NVL(TRUNC(DECODE(SIGN(XB.MAR1),-1,0,XB.MAR1*100)),0)) AS MAR1,NVL(TRUNC(XB.MAR2*100),0) AS MAR2,NVL(TRUNC(DECODE(SIGN(XB.MAR3),-1,0,XB.MAR3*100)),0) AS MAR3,');
      Append('        DECODE(XB.TIPOREG,2,NVL(TRUNC(XB.ABR1*100),0),NVL(TRUNC(DECODE(SIGN(XB.ABR1),-1,0,XB.ABR1*100)),0)) AS ABR1,NVL(TRUNC(XB.ABR2*100),0) AS ABR2,NVL(TRUNC(DECODE(SIGN(XB.ABR3),-1,0,XB.ABR3*100)),0) AS ABR3,');
      Append('        DECODE(XB.TIPOREG,2,NVL(TRUNC(XB.MAI1*100),0),NVL(TRUNC(DECODE(SIGN(XB.MAI1),-1,0,XB.MAI1*100)),0)) AS MAI1,NVL(TRUNC(XB.MAI2*100),0) AS MAI2,NVL(TRUNC(DECODE(SIGN(XB.MAI3),-1,0,XB.MAI3*100)),0) AS MAI3,');
      Append('        DECODE(XB.TIPOREG,2,NVL(TRUNC(XB.JUN1*100),0),NVL(TRUNC(DECODE(SIGN(XB.JUN1),-1,0,XB.JUN1*100)),0)) AS JUN1,NVL(TRUNC(XB.JUN2*100),0) AS JUN2,NVL(TRUNC(DECODE(SIGN(XB.JUN3),-1,0,XB.JUN3*100)),0) AS JUN3,');
      Append('        DECODE(XB.TIPOREG,2,NVL(TRUNC(XB.JUL1*100),0),NVL(TRUNC(DECODE(SIGN(XB.JUL1),-1,0,XB.JUL1*100)),0)) AS JUL1,NVL(TRUNC(XB.JUL2*100),0) AS JUL2,NVL(TRUNC(DECODE(SIGN(XB.JUL3),-1,0,XB.JUL3*100)),0) AS JUL3,');
      Append('        DECODE(XB.TIPOREG,2,NVL(TRUNC(XB.AGO1*100),0),NVL(TRUNC(DECODE(SIGN(XB.AGO1),-1,0,XB.AGO1*100)),0)) AS AGO1,NVL(TRUNC(XB.AGO2*100),0) AS AGO2,NVL(TRUNC(DECODE(SIGN(XB.AGO3),-1,0,XB.AGO3*100)),0) AS AGO3,');
      Append('        DECODE(XB.TIPOREG,2,NVL(TRUNC(XB.SET1*100),0),NVL(TRUNC(DECODE(SIGN(XB.SET1),-1,0,XB.SET1*100)),0)) AS SET1,NVL(TRUNC(XB.SET2*100),0) AS SET2,NVL(TRUNC(DECODE(SIGN(XB.SET3),-1,0,XB.SET3*100)),0) AS SET3,');
      Append('        DECODE(XB.TIPOREG,2,NVL(TRUNC(XB.OUT1*100),0),NVL(TRUNC(DECODE(SIGN(XB.OUT1),-1,0,XB.OUT1*100)),0)) AS OUT1,NVL(TRUNC(XB.OUT2*100),0) AS OUT2,NVL(TRUNC(DECODE(SIGN(XB.OUT3),-1,0,XB.OUT3*100)),0) AS OUT3,');
      Append('        DECODE(XB.TIPOREG,2,NVL(TRUNC(XB.NOV1*100),0),NVL(TRUNC(DECODE(SIGN(XB.NOV1),-1,0,XB.NOV1*100)),0)) AS NOV1,NVL(TRUNC(XB.NOV2*100),0) AS NOV2,NVL(TRUNC(DECODE(SIGN(XB.NOV3),-1,0,XB.NOV3*100)),0) AS NOV3,');
      Append('        DECODE(XB.TIPOREG,2,NVL(TRUNC(XB.DEZ1*100),0),NVL(TRUNC(DECODE(SIGN(XB.DEZ1),-1,0,XB.DEZ1*100)),0)) AS DEZ1,NVL(TRUNC(XB.DEZ2*100),0) AS DEZ2,NVL(TRUNC(DECODE(SIGN(XB.DEZ3),-1,0,XB.DEZ3*100)),0) AS DEZ3,');

      // WO13395 - Impostos - Geração da DIRF - Desconto simplificado
      // Alterado por Arnaldo V. Scarin em 02/10/2024
      Append('        NVL(TRUNC(XB.JAN52*100),0) AS JAN52,NVL(TRUNC(XB.JAN54*100),0) AS JAN54,');
      Append('        NVL(TRUNC(XB.FEV52*100),0) AS FEV52,NVL(TRUNC(XB.FEV54*100),0) AS FEV54,');
      Append('        NVL(TRUNC(XB.MAR52*100),0) AS MAR52,NVL(TRUNC(XB.MAR54*100),0) AS MAR54,');
      Append('        NVL(TRUNC(XB.ABR52*100),0) AS ABR52,NVL(TRUNC(XB.ABR54*100),0) AS ABR54,');
      Append('        NVL(TRUNC(XB.MAI52*100),0) AS MAI52,NVL(TRUNC(XB.MAI54*100),0) AS MAI54,');
      Append('        NVL(TRUNC(XB.JUN52*100),0) AS JUN52,NVL(TRUNC(XB.JUN54*100),0) AS JUN54,');
      Append('        NVL(TRUNC(XB.JUL52*100),0) AS JUL52,NVL(TRUNC(XB.JUL54*100),0) AS JUL54,');
      Append('        NVL(TRUNC(XB.AGO52*100),0) AS AGO52,NVL(TRUNC(XB.AGO54*100),0) AS AGO54,');
      Append('        NVL(TRUNC(XB.SET52*100),0) AS SET52,NVL(TRUNC(XB.SET54*100),0) AS SET54,');
      Append('        NVL(TRUNC(XB.OUT52*100),0) AS OUT52,NVL(TRUNC(XB.OUT54*100),0) AS OUT54,');
      Append('        NVL(TRUNC(XB.NOV52*100),0) AS NOV52,NVL(TRUNC(XB.NOV54*100),0) AS NOV54,');
      Append('        NVL(TRUNC(XB.DEZ52*100),0) AS DEZ52,NVL(TRUNC(XB.DEZ54*100),0) AS DEZ54,');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.VLR1352),-1,0,XB.VLR1352*100)),0) AS VLR1352,');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.VLR1354),-1,0,XB.VLR1354*100)),0) AS VLR1354,');
      // WO13395 - FIM


      // Andre Imakawa - SIG 81206 - Fim
      Append('        NVL(TRUNC(DECODE(SIGN(XB.VLR131),-1,0,XB.VLR131*100)),0) AS VLR131,');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.VLR132),-1,0,XB.VLR132*100)),0) AS VLR132,');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.VLR133),-1,0,XB.VLR133*100)),0) AS VLR133');
      Append('        FROM  (SELECT ');
      //CPREV - Pend. 27026 - Append('                                    U.NOME, U.NUMDOCUMENTO, U.CODNATUREZA,');
      Append('                                    U.NOME, U.NUMDOCUMENTO, U.TIPOREG, U.CODNATUREZA,'); //CPREV - Pend. 27026
      Append('                                    SUM(U.JAN1) AS JAN1,  SUM(U.FEV1) AS FEV1,');
      Append('                                    SUM(U.MAR1) AS MAR1,  SUM(U.ABR1) AS ABR1,');
      Append('                                    SUM(U.MAI1) AS MAI1,  SUM(U.JUN1) AS JUN1,');
      Append('                                    SUM(U.JUL1) AS JUL1,  SUM(U.AGO1) AS AGO1,');
      Append('                                    SUM(U.SET1) AS SET1,  SUM(U.OUT1) AS OUT1,');
      Append('                                    SUM(U.NOV1) AS NOV1,  SUM(U.DEZ1) AS DEZ1,');
      Append('                                    SUM(U.JAN2) AS JAN2,  SUM(U.FEV2) AS FEV2,');
      Append('                                    SUM(U.MAR2) AS MAR2,  SUM(U.ABR2) AS ABR2,');
      Append('                                    SUM(U.MAI2) AS MAI2,  SUM(U.JUN2) AS JUN2,');
      Append('                                    SUM(U.JUL2) AS JUL2,  SUM(U.AGO2) AS AGO2,');
      Append('                                    SUM(U.SET2) AS SET2,  SUM(U.OUT2) AS OUT2,');
      Append('                                    SUM(U.NOV2) AS NOV2,  SUM(U.DEZ2) AS DEZ2,');
      Append('                                    SUM(U.JAN3) AS JAN3,  SUM(U.FEV3) AS FEV3,');
      Append('                                    SUM(U.MAR3) AS MAR3,  SUM(U.ABR3) AS ABR3,');
      Append('                                    SUM(U.MAI3) AS MAI3,  SUM(U.JUN3) AS JUN3,');
      Append('                                    SUM(U.JUL3) AS JUL3,  SUM(U.AGO3) AS AGO3,');
      Append('                                    SUM(U.SET3) AS SET3,  SUM(U.OUT3) AS OUT3,');
      Append('                                    SUM(U.NOV3) AS NOV3,  SUM(U.DEZ3) AS DEZ3,');

      // WO13395 - Impostos - Geração da DIRF - Desconto simplificado
      // Alterado por Arnaldo V. Scarin em 02/10/2024
      //
      // idInforme: 52 - IRRF - Dedução - Desconto simplificado / 53 - 13º IRRF - Dedução - Desconto simplificado
      //
      Append('                                    SUM(U.JAN52) AS JAN52,  SUM(U.FEV52) AS FEV52,');
      Append('                                    SUM(U.MAR52) AS MAR52,  SUM(U.ABR52) AS ABR52,');
      Append('                                    SUM(U.MAI52) AS MAI52,  SUM(U.JUN52) AS JUN52,');
      Append('                                    SUM(U.JUL52) AS JUL52,  SUM(U.AGO52) AS AGO52,');
      Append('                                    SUM(U.SET52) AS SET52,  SUM(U.OUT52) AS OUT52,');
      Append('                                    SUM(U.NOV52) AS NOV52,  SUM(U.DEZ52) AS DEZ52,');
      Append('                                    SUM(U.VLR1352) AS VLR1352,');
      //
      // idInforme: 54 - IRRF - Dedução - Desc.Simplif. - Exigib. Susp. / 55 - 13º IRRF - Dedução - Desc.Simplific. - Exigib. Susp.
      //
      Append('                                    SUM(U.JAN54) AS JAN54,  SUM(U.FEV54) AS FEV54,');
      Append('                                    SUM(U.MAR54) AS MAR54,  SUM(U.ABR54) AS ABR54,');
      Append('                                    SUM(U.MAI54) AS MAI54,  SUM(U.JUN54) AS JUN54,');
      Append('                                    SUM(U.JUL54) AS JUL54,  SUM(U.AGO54) AS AGO54,');
      Append('                                    SUM(U.SET54) AS SET54,  SUM(U.OUT54) AS OUT54,');
      Append('                                    SUM(U.NOV54) AS NOV54,  SUM(U.DEZ54) AS DEZ54,');
      Append('                                    SUM(U.VLR1354) AS VLR1354,');
      // WO13395 - Fim
      
      Append('                                    SUM(U.VLR131) AS VLR131, SUM(U.VLR132) AS VLR132,');
      Append('                                    SUM(U.VLR133) AS VLR133');
      Append('                              FROM  ((');
      Append('                                            SELECT ');
      Append('                                            /*+ INDEX (LI XIE1LANCXINFORME) USE_NL(LI , L) */');
      Append('                                            P.NOME, P.NUMDOCUMENTO, ');
      Append('                                            ''0'' AS TIPOREG, '); //CPREV - Pend. 27026
      ////Marcio Sanches Spinosa SOL 219636/15413 KINTANA 2053647 - Inicio
  //    Append('                                            DECODE(L.CODNATUREZA,''7416'',''0561'', ''7431'',''0561'', ''3533'', ''0561'',''3540'', ''0561'',L.CODNATUREZA) AS CODNATUREZA,');     // Edilaine - SOL 197682 / KTN 1894005
      // Append('                                            DECODE(L.CODNATUREZA,''7416'',''0561'', ''7431'',''0561'', L.CODNATUREZA) AS CODNATUREZA,');     // Edilaine - SOL 197682 / KTN 1894005 // Alterado por Felipe A. Santos SOL 223584 KTN 2057497
      ////Marcio Sanches Spinosa SOL 219636/15413 KINTANA 2053647 - Fim

      // Felipe A. Santos SOL 223584 KTN 2057497
      Append('                                           case ');
      Append('                                            when TO_CHAR(L.datapagamento,''YYYYMM'') <= ''201301'' then ');
      Append('                                                 DECODE(L.CODNATUREZA,''7416'',''0561'', ''7431'',''0561'', L.CODNATUREZA) ');
      Append('                                            else ');
      Append('                                                  DECODE(L.CODNATUREZA,''7416'',''3540'', ''7431'',''3540'', L.CODNATUREZA) ');
      Append('                                           end  CODNATUREZA, ');
      // Felipe A. Santos SOL 223584 KTN 2057497 - fim
      //Darivaldo Alencar SIG 28407 -inicio
      //      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS JAN1,');
      //      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS FEV1,');
      //      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS MAR1,');
      //      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS ABR1,');
      //      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS MAI1,');
      //      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS JUN1,');
      //      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS JUL1,');
      //      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS AGO1,');
      //      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS SET1,');
      //      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS OUT1,');
      //      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS NOV1,');
      //      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS DEZ1,');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF, ''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),');
      Append('                                                                ''45'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),');
      Append('                                                                ''46'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS JAN1,');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF, ''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),');
      Append('                                                                ''45'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),');
      Append('                                                                ''46'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS FEV1,');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF, ''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),');
      Append('                                                                ''45'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),');
      Append('                                                                ''46'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS MAR1,');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF, ''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),');
      Append('                                                                ''45'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),');
      Append('                                                                ''46'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS ABR1,');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF, ''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),');
      Append('                                                                ''45'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),');
      Append('                                                                ''46'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS MAI1,');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF, ''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),');
      Append('                                                                ''45'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),');
      Append('                                                                ''46'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS JUN1,');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF, ''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),');
      Append('                                                                ''45'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),');
      Append('                                                                ''46'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS JUL1,');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF, ''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),');
      Append('                                                                ''45'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),');
      Append('                                                                ''46'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS AGO1,');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF, ''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),');
      Append('                                                                ''45'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),');
      Append('                                                                ''46'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS SET1,');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF, ''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),');
      Append('                                                                ''45'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),');
      Append('                                                                ''46'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS OUT1,');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF, ''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),');
      Append('                                                                ''45'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),');
      Append('                                                                ''46'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS NOV1,');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF, ''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),');
      Append('                                                                ''45'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),');
      Append('                                                                ''46'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS DEZ1,');
      //Darivaldo Alencar SIG 28407 -fim
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS JAN2,');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS FEV2,');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS MAR2,');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS ABR2,');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS MAI2,');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS JUN2,');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS JUL2,');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS AGO2,');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS SET2,');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS OUT2,');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS NOV2,');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS DEZ2,');
      Append(' 0 AS JAN3, 0 AS FEV3, 0 AS MAR3, 0 AS ABR3, 0 AS MAI3, 0 AS JUN3, 0 AS JUL3, 0 AS AGO3, 0 AS SET3, 0 AS OUT3, 0 AS NOV3, 0 AS DEZ3, '); //CPrev - Pend. 27026

      // WO13395 - Impostos - Geração da DIRF - Desconto simplificado
      Append(' 0 AS JAN52, 0 AS FEV52, 0 AS MAR52, 0 AS ABR52, 0 AS MAI52, 0 AS JUN52, 0 AS JUL52, 0 AS AGO52, 0 AS SET52, 0 AS OUT52, 0 AS NOV52, 0 AS DEZ52, 0 AS VLR1352, ');
      Append(' 0 AS JAN54, 0 AS FEV54, 0 AS MAR54, 0 AS ABR54, 0 AS MAI54, 0 AS JUN54, 0 AS JUL54, 0 AS AGO54, 0 AS SET54, 0 AS OUT54, 0 AS NOV54, 0 AS DEZ54, 0 AS VLR1354, ');
      // WO13395 - Fim
      
      Append('                                            SUM(DECODE(I.CODDIRF,''5'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0)) AS VLR131,');
      //Marcio Sanches Spinosa SOL 226003 KINTANA 2060052 - Inicio
  //    Append('                                            SUM(DECODE(I.CODDIRF,''7'',DECODE(L.CODNATUREZA,''5565'',0,''3223'',0, ''3556'',0, ''3579'',0, LI.VLRLANC),0)) AS VLR132,');//Marcio Sanches Spinosa SOL 223465 KINTANA 2058652
      Append('                                            SUM(DECODE(I.CODDIRF,''7'',DECODE(L.CODNATUREZA,''5565'',LI.VLRLANC,''3223'',0, ''3556'',0, ''3579'',LI.VLRLANC, LI.VLRLANC),0)) AS VLR132,'); //Marcio Sanches Spinosa SOL 223465 KINTANA 2058652
      //Marcio Sanches Spinosa SOL 226003 KINTANA 2060052 - Fim
      Append(' 0 AS VLR133  '); //CPrev - Pend. 27026
      Append('                                       FROM INFORME I, LANCXINFORME LI, LANCIRRF L, NATURENDIMENTO N, PESSOA P');
      Append('                                      WHERE (P.IDPESSOA = L.IDBENEFIRRF)');
      Append('                                        AND (p.NUMDOCUMENTO IS NOT NULL AND p.NUMDOCUMENTO <> ''00000000000'')'); // xxx
      Append('                                        AND (L.datapagamento BETWEEN TO_DATE(' + quotedStr(DataIni) + ',''DD/MM/YYYY'') AND TO_DATE(' + quotedStr(DataFim) + ',''DD/MM/YYYY''))          ');
      Append('                                        AND (L.IDLANCIRRF = LI.IDLANCIRRF)');
      Append('                                        AND (L.CODNATUREZA = N.CODNATUREZA)');
      Append('                                        AND (LI.IDINFORME = I.IDINFORME)');
      If (iSistema = 0) Then
        Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 21) ')
      Else If (iSistema = 1) Then
        Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 18) ')
      Else If (iSistema = 2) Then
        Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 3) ');

      Append('                                        AND (N.FLGUSADONADIRF = ''S'')');
      Append('                                        AND (I.CODDIRF <> 1)');

      If (iSistema = 2) Then
        Append(' AND (L.CODNATUREZA NOT IN (''5952'', ''5960'', ''5979'', ''5987'')) ');

      //Append('                                        AND           (L.datapagamento BETWEEN TO_DATE('+quotedStr(DataIni)+',''DD/MM/YYYY'') AND TO_DATE('+quotedStr(DataFim)+',''DD/MM/YYYY''))          ');
      ////Marcio Sanches Spinosa SOL 219636/15413 KINTANA 2053647 - Inicio
  //    Append('                                        GROUP BY P.NOME, P.NUMDOCUMENTO, DECODE(L.CODNATUREZA,''7416'',''0561'', ''7431'',''0561'', ''3533'', ''0561'',''3540'', ''0561'', L.CODNATUREZA)');   // Edilaine - SOL 197682 / KTN 1894005

      // Felipe A. Santos SOL 223584 KTN 2057497
      // Append('                                        GROUP BY P.NOME, P.NUMDOCUMENTO, DECODE(L.CODNATUREZA,''7416'',''0561'', ''7431'',''0561'', L.CODNATUREZA)');   // Edilaine - SOL 197682 / KTN 1894005
      Append(' GROUP BY P.NOME, P.NUMDOCUMENTO, L.DATAPAGAMENTO, L.CODNATUREZA');
      // Felipe A. Santos SOL 223584 KTN 2057497
      ////Marcio Sanches Spinosa SOL 219636/15413 KINTANA 2053647 - Fim
      Append(' ,''0'' '); //CPREV - Pend. 27026
      Append('                                        )');
      {*    Append('                        UNION ALL');
          Append('                        (');
          Append('                        SELECT  ');

          Append('                                 P.NOME, P.NUMDOCUMENTO, ''0'' AS TIPOREG, DECODE(L.CODNATUREZA,''7416'',''0561'',L.CODNATUREZA) AS CODNATUREZA, '); //CPREV - Pend. 27026

          Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',L.VLRBASE,0)) AS JAN1,');
          Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',L.VLRBASE,0)) AS FEV1,');
          Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',L.VLRBASE,0)) AS MAR1,');
          Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',L.VLRBASE,0)) AS ABR1,');
          Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',L.VLRBASE,0)) AS MAI1,');
          Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',L.VLRBASE,0)) AS JUN1,');
          Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',L.VLRBASE,0)) AS JUL1,');
          Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',L.VLRBASE,0)) AS AGO1,');
          Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',L.VLRBASE,0)) AS SET1,');
          Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',L.VLRBASE,0)) AS OUT1,');
          Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',L.VLRBASE,0)) AS NOV1,');
          Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',L.VLRBASE,0)) AS DEZ1,');
          Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',L.VLRIRRF,0)) AS JAN2,');
          Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',L.VLRIRRF,0)) AS FEV2,');
          Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',L.VLRIRRF,0)) AS MAR2,');
          Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',L.VLRIRRF,0)) AS ABR2,');
          Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',L.VLRIRRF,0)) AS MAI2,');
          Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',L.VLRIRRF,0)) AS JUN2,');
          Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',L.VLRIRRF,0)) AS JUL2,');
          Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',L.VLRIRRF,0)) AS AGO2,');
          Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',L.VLRIRRF,0)) AS SET2,');
          Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',L.VLRIRRF,0)) AS OUT2,');
          Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',L.VLRIRRF,0)) AS NOV2,');
          Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',L.VLRIRRF,0)) AS DEZ2,');

          Append(' 0 AS JAN3, 0 AS FEV3, 0 AS MAR3, 0 AS ABR3, 0 AS MAI3, 0 AS JUN3, 0 AS JUL3, 0 AS AGO3, 0 AS SET3, 0 AS OUT3, 0 AS NOV3, 0 AS DEZ3, '); //CPrev - Pend. 27026

          Append('                                 0 AS VLR131, 0 AS VLR132, 0 AS VLR133');
          Append('                            FROM LANCIRRF L, PESSOA P');
          Append('                           WHERE (NOT EXISTS (SELECT I.IDLANCIRRF FROM LANCXINFORME I WHERE L.IDLANCIRRF = I.IDLANCIRRF))');

          if (iSistema = 0) then
            Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 21) ')
          else if (iSistema = 1) then
            Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 18) ')
         else if (iSistema = 2) then
            Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 3) ');

          If (iSistema = 2) Then
            Append(' AND (L.CODNATUREZA NOT IN (''5952'', ''5960'', ''5979'', ''5987'')) ');

          Append('                           AND           (L.datapagamento BETWEEN TO_DATE('+quotedStr(DataIni)+',''DD/MM/YYYY'') AND TO_DATE('+quotedStr(DataFim)+',''DD/MM/YYYY''))          ');
          Append('                           AND P.IDPESSOA = L.IDBENEFIRRF');

          //CPREV - Pend. 27026 - Append('                        GROUP BY P.NOME, P.NUMDOCUMENTO, DECODE(L.CODNATUREZA,''7416'',''0561'',L.CODNATUREZA))');
          Append('                        GROUP BY P.NOME, P.NUMDOCUMENTO, DECODE(L.CODNATUREZA,''7416'',''0561'',L.CODNATUREZA), ''0'')');//CPREV - Pend. 27026
      *}
      Append('                        UNION ALL');
      Append('                        SELECT');
      Append('                               P.NOME, P.NUMDOCUMENTO,');
      Append(' ''0'' AS TIPOREG, '); //CPREV - Pend. 27026

      Append('                               ''9999'' AS CODNATUREZA,');
      Append('                               0 AS JAN1, 0 AS FEV1, 0 AS MAR1, 0 AS ABR1, 0 AS MAI1, 0 AS JUN1,');
      Append('                               0 AS JUL1, 0 AS AGO1, 0 AS SET1, 0 AS OUT1, 0 AS NOV1, 0 AS DEZ1,');
      Append('                               0 AS JAN2, 0 AS FEV2, 0 AS MAR2, 0 AS ABR2, 0 AS MAI2, 0 AS JUN2,');
      Append('                               0 AS JUL2, 0 AS AGO2, 0 AS SET2, 0 AS OUT2, 0 AS NOV2, 0 AS DEZ2,');
      Append(' 0 AS JAN3, 0 AS FEV3, 0 AS MAR3, 0 AS ABR3, 0 AS MAI3, 0 AS JUN3, 0 AS JUL3, 0 AS AGO3, 0 AS SET3, 0 AS OUT3, 0 AS NOV3, 0 AS DEZ3, '); //CPrev - Pend. 27026

      // WO13395 - Impostos - Geração da DIRF - Desconto simplificado
      Append(' 0 AS JAN52, 0 AS FEV52, 0 AS MAR52, 0 AS ABR52, 0 AS MAI52, 0 AS JUN52, 0 AS JUL52, 0 AS AGO52, 0 AS SET52, 0 AS OUT52, 0 AS NOV52, 0 AS DEZ52, 0 AS VLR1352, ');
      Append(' 0 AS JAN54, 0 AS FEV54, 0 AS MAR54, 0 AS ABR54, 0 AS MAI54, 0 AS JUN54, 0 AS JUL54, 0 AS AGO54, 0 AS SET54, 0 AS OUT54, 0 AS NOV54, 0 AS DEZ54, 0 AS VLR1354, ');
      // WO13395 - Fim


      Append('                               0 AS VLR131, 0 AS VLR132,');
      Append('                               SUM(DECODE(SUBSTR(H.MESCOBRANCA,6,2),''13'',DECODE(NVL(H.FLGDEVOLUCAO,0),0,H.VALORRECEBIDO,-H.VALORRECEBIDO),0)) AS VLR133');
      Append('                        FROM   PESSOA P,');
      Append('                               ELEGPATRO EL,');
      Append('                               HSTCONTRIBPREV H,');
      Append('                               CONTPREV CP,');
      Append('                               PROVDESC PD,');
      Append('                               INFORME I');
      Append('                        WHERE  CP.FLGPAGADOR IN (''C'',''P'')');
      Append('                        AND    CP.IDCONTRIBUICAO IN (19,215,358,560,580,600,601,621)');
      Append('                        AND    NVL(H.FLGDESCFOLHA,0) = 0');
      Append('                        AND    NVL(H.SITRECEBIMENTO,0) IN (2,3,5)');
      Append('                        AND    CP.FLGINTERNO IN (''MA'',''MP'')');
      Append('                        AND    H.MESCOBRANCA >= ' + QuotedStr(FloatToStr(iAno) + '/01'));
      Append('                        AND    H.MESCOBRANCA <= ' + QuotedStr(FloatToStr(iAno) + '/13'));
      Append('                        AND    CP.IDPLANOPREV    = H.IDPLANOPREV');
      Append('                        AND    CP.IDCONTRIBUICAO = H.IDCONTRIBUICAO');
      Append('                        AND    EL.IDPESSJUR = H.IDPESSJUR');
      Append('                        AND    EL.IDPESSOA = H.IDPESSOA');
      Append('                        AND    P.IDPESSOA = EL.IDPESSOA');
      Append('                        AND    PD.IDPROVENTO = CP.IDRUBRICA');
      Append('                        AND    I.IDINFORME   = PD.IDINFORME');

      Append('                        GROUP BY');
      Append('                               P.NOME, P.NUMDOCUMENTO');

      If (iSistema = 2) Then
        Append(' UNION ALL (SELECT ' +
          ' P.NOME, P.NUMDOCUMENTO, ' +
          ' ''0'' AS TIPOREG, ' + //CPREV - Pend. 27026
          ' T.CODNATUREZA, ' +
          ' SUM(T.JAN1) AS JAN1, SUM(T.FEV1) AS FEV1, SUM(T.MAR1) AS MAR1, ' +
          ' SUM(T.ABR1) AS ABR1, SUM(T.MAI1) AS MAI1, SUM(T.JUN1) AS JUN1, ' +
          ' SUM(T.JUL1) AS JUL1, SUM(T.AGO1) AS AGO1, SUM(T.SET1) AS SET1, ' +
          ' SUM(T.OUT1) AS OUT1, SUM(T.NOV1) AS NOV1, SUM(T.DEZ1) AS DEZ1, ' +
          ' 0 AS JAN2, 0 AS FEV2, 0 AS MAR2, 0 AS ABR2, 0 AS MAI2, 0 AS JUN2, ' +
          ' 0 AS JUL2, 0 AS AGO2, 0 AS SET2, 0 AS OUT2, 0 AS NOV2, 0 AS DEZ2, ' +
          ' 0 AS JAN3, 0 AS FEV3, 0 AS MAR3, 0 AS ABR3, 0 AS MAI3, 0 AS JUN3, ' +
          ' 0 AS JUL3, 0 AS AGO3, 0 AS SET3, 0 AS OUT3, 0 AS NOV3, 0 AS DEZ3, ' +
          ' 0 AS VLR131, 0 AS VLR132, 0 AS VLR133 ' +
          ' FROM PESSOA P, (SELECT DISTINCT L.CODDOCUMENTO, L.IDBENEFIRRF, L.CODNATUREZA, ' +
          ' MIN(L.IDLANCIRRF) AS IDLANCIRRF, ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS JAN1, ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS FEV1, ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS MAR1, ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS ABR1, ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS MAI1, ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS JUN1, ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS JUL1, ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS AGO1, ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS SET1, ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS OUT1, ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS NOV1, ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS DEZ1  ' +
          ' FROM LANCXINFORME LI, LANCIRRF L, INFORME I ' +
          ' WHERE ' +
          //CPREV - Pend. 27159 - ' (SUBSTR(L.NUMDOCUMENTO,1,8) = '+quotedStr(NumDocumento)+') '+
          ' (LI.IDLANCIRRF              = L.IDLANCIRRF) ' +
          ' AND (L.datapagamento BETWEEN TO_DATE(' + quotedStr(DataIni) + ',''DD/MM/YYYY'') AND TO_DATE(' + quotedStr(DataFim) + ',''DD/MM/YYYY'')) ' +
          ' AND (I.IDINFORME                = LI.IDINFORME) ' +
          ' AND (I.CODDIRF                 <> 1) ' +
          ' AND (L.CODNATUREZA IN (''5952'', ''5960'', ''5979'', ''5987'')) ' +
          ' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 3) ' +
          ' GROUP BY ' +
          ' L.CODDOCUMENTO, L.IDBENEFIRRF, L.CODNATUREZA, ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), ' +
          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) ) T ' +

          ' WHERE P.IDPESSOA = T.IDBENEFIRRF ' +
          ' GROUP BY P.NOME, P.NUMDOCUMENTO, T.CODNATUREZA, ' +
          ' ''0'') ' + //CPREV - Pend. 27026
          ' UNION ALL ' +
          ' (SELECT P.NOME, P.NUMDOCUMENTO, ' +
          ' ''0'' AS TIPOREG, ' + //CPREV - Pend. 27026
          ' L.CODNATUREZA, ' +
          ' 0 AS JAN1, 0 AS FEV1, 0 AS MAR1, ' +
          ' 0 AS ABR1, 0 AS MAI1, 0 AS JUN1, ' +
          ' 0 AS JUL1, 0 AS AGO1, 0 AS SET1, ' +
          ' 0 AS OUT1, 0 AS NOV1, 0 AS DEZ1, ' +
          ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS JAN2, ' +
          ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS FEV2, ' +
          ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS MAR2, ' +
          ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS ABR2, ' +
          ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS MAI2, ' +
          ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS JUN2, ' +
          ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS JUL2, ' +
          ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS AGO2, ' +
          ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS SET2, ' +
          ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS OUT2, ' +
          ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS NOV2, ' +
          ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS DEZ2, ' +
          ' 0 AS JAN3, ' +
          ' 0 AS FEV3, ' +
          ' 0 AS MAR3, ' +
          ' 0 AS ABR3, ' +
          ' 0 AS MAI3, ' +
          ' 0 AS JUN3, ' +
          ' 0 AS JUL3, ' +
          ' 0 AS AGO3, ' +
          ' 0 AS SET3, ' +
          ' 0 AS OUT3, ' +
          ' 0 AS NOV3, ' +
          ' 0 AS DEZ3, ' +

           // WO13395 - Impostos - Geração da DIRF - Desconto simplificado
          ' 0 AS JAN52, 0 AS FEV52, 0 AS MAR52, 0 AS ABR52, 0 AS MAI52, 0 AS JUN52, 0 AS JUL52, 0 AS AGO52, 0 AS SET52, 0 AS OUT52, 0 AS NOV52, 0 AS DEZ52, 0 AS VLR1352, '+
          ' 0 AS JAN54, 0 AS FEV54, 0 AS MAR54, 0 AS ABR54, 0 AS MAI54, 0 AS JUN54, 0 AS JUL54, 0 AS AGO54, 0 AS SET54, 0 AS OUT54, 0 AS NOV54, 0 AS DEZ54, 0 AS VLR1354, '+
          // WO13395 - Fim

          ' 0 AS VLR131, 0 AS VLR132, 0 AS VLR133 ' +
          ' FROM LANCIRRF L, PESSOA P ' +
          ' WHERE (L.datapagamento BETWEEN TO_DATE(' + quotedStr(DataIni) + ',''DD/MM/YYYY'') AND TO_DATE(' + quotedStr(DataFim) + ',''DD/MM/YYYY'')) ' +
          //CPREV - Pend. 27159 - ' AND (SUBSTR(L.NUMDOCUMENTO,1,8) = '+quotedStr(NumDocumento)+') '+
          ' AND (L.CODNATUREZA IN (''5952'', ''5960'', ''5979'', ''5987'')) ' +
          ' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 3) ' +

          ' AND (P.IDPESSOA = L.IDBENEFIRRF) ' +
          ' GROUP BY P.NOME, P.NUMDOCUMENTO, L.CODNATUREZA, ' +
          ' ''0'') '); //CPREV - Pend. 27026

      Append('                        ) U');
      Append('        GROUP BY U.NOME, U.NUMDOCUMENTO, U.CODNATUREZA');
      Append(' , U.TIPOREG  '); //CPrev - Pend. 27026 - 29/01/2007

      //CPREV - Pend. 27026 - Início
      Append(' ,U.TIPOREG ');
      Append(' UNION ALL ');
      Append(' SELECT ');
      Append('   P.NOME, P.NUMDOCUMENTO, ''1'' AS TIPOREG, ');
      //Marcio Sanches Spinosa SOL 219636/15413 KINTANA 2053647 - Inicio
  //    Append('   DECODE(L.CODNATUREZA,''7416'',''0561'', ''7431'',''0561'', ''3533'', ''0561'',''3540'', ''0561'', L.CODNATUREZA) AS CODNATUREZA, ');  // Edilaine - SOL 197682 / KTN 1894005
      // Append('   DECODE(L.CODNATUREZA,''7416'',''0561'', ''7431'',''0561'', L.CODNATUREZA) AS CODNATUREZA, ');  // Edilaine - SOL 197682 / KTN 1894005 // Alterado por Felipe A. Santos SOL 223584 KTN 2057497
      ////Marcio Sanches Spinosa SOL 219636/15413 KINTANA 2053647 - Fim

      // Felipe A. Santos SOL 223584 KTN 2057497
      Append('   case ');
      Append('    when TO_CHAR(L.datapagamento,''YYYYMM'') <= ''201301'' then ');
      Append('         DECODE(L.CODNATUREZA,''7416'',''0561'', ''7431'',''0561'', L.CODNATUREZA) ');
      Append('    else ');
      Append('          DECODE(L.CODNATUREZA,''7416'',''3540'', ''7431'',''3540'', L.CODNATUREZA) ');
      Append('   end  CODNATUREZA, ');
      // Felipe A. Santos SOL 223584 KTN 2057497

      If iSistema = 0 Then
        Begin
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''18'',DECODE(I.FLGNATUREZA,''P'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS JAN1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''18'',DECODE(I.FLGNATUREZA,''P'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS FEV1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''18'',DECODE(I.FLGNATUREZA,''P'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS MAR1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''18'',DECODE(I.FLGNATUREZA,''P'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS ABR1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''18'',DECODE(I.FLGNATUREZA,''P'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS MAI1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''18'',DECODE(I.FLGNATUREZA,''P'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS JUN1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''18'',DECODE(I.FLGNATUREZA,''P'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS JUL1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''18'',DECODE(I.FLGNATUREZA,''P'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS AGO1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''18'',DECODE(I.FLGNATUREZA,''P'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS SET1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''18'',DECODE(I.FLGNATUREZA,''P'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS OUT1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''18'',DECODE(I.FLGNATUREZA,''P'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS NOV1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''18'',DECODE(I.FLGNATUREZA,''P'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS DEZ1, ');
        End
      Else
        Begin
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''18'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS JAN1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''18'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS FEV1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''18'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS MAR1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''18'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS ABR1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''18'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS MAI1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''18'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS JUN1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''18'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS JUL1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''18'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS AGO1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''18'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS SET1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''18'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS OUT1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''18'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS NOV1, ');
          Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''18'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS DEZ1, ');
        End;
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS JAN2, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS FEV2, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS MAR2, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS ABR2, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS MAI2, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS JUN2, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS JUL2, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS AGO2, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS SET2, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS OUT2, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS NOV2, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS DEZ2, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS JAN3, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS FEV3, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS MAR3, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS ABR3, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS MAI3, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS JUN3, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS JUL3, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS AGO3, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS SET3, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS OUT3, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS NOV3, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS DEZ3, ');

      // WO13395 - Impostos - Geração da DIRF - Desconto simplificado
      // Alterado por Arnaldo V. Scarin em 02/10/2024
      //
      // idInforme: 52 - IRRF - Dedução - Desconto simplificado / 53 - 13º IRRF - Dedução - Desconto simplificado
      //
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''52'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)), 2) AS JAN52,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''52'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)), 2) AS FEV52,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''52'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)), 2) AS MAR52,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''52'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)), 2) AS ABR52,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''52'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)), 2) AS MAI52,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''52'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)), 2) AS JUN52,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''52'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)), 2) AS JUL52,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''52'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)), 2) AS AGO52,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''52'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)), 2) AS SET52,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''52'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)), 2) AS OUT52,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''52'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)), 2) AS NOV52,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''52'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)), 2) AS DEZ52,');
      Append('                                       ROUND(SUM(DECODE(I.CODDIRF,''53'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0)), 2) AS VLR1352,');
      //
      // idInforme: 54 - IRRF - Dedução - Desc.Simplif. - Exigib. Susp. / 55 - 13º IRRF - Dedução - Desc.Simplific. - Exigib. Susp.
      //
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''54'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)), 2) AS JAN54,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''54'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)), 2) AS FEV54,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''54'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)), 2) AS MAR54,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''54'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)), 2) AS ABR54,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''54'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)), 2) AS MAI54,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''54'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)), 2) AS JUN54,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''54'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)), 2) AS JUL54,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''54'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)), 2) AS AGO54,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''54'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)), 2) AS SET54,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''54'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)), 2) AS OUT54,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''54'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)), 2) AS NOV54,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''54'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)), 2) AS DEZ54,');
      Append('                                       ROUND(SUM(DECODE(I.CODDIRF,''55'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0)), 2) AS VLR1354,');
      //
      // WO13395 - FIM


      Append('   SUM(DECODE(I.CODDIRF,''22'',LI.VLRLANC,0)) AS VLR131, ');
      Append('   SUM(DECODE(I.CODDIRF,''24'',LI.VLRLANC,0)) AS VLR132, ');
      Append('   SUM(DECODE(I.CODDIRF,''23'',LI.VLRLANC,0)) AS VLR133 ');
      Append(' FROM INFORME I, LANCXINFORME LI, LANCIRRF L, NATURENDIMENTO N, PESSOA P ');
      Append(' WHERE (P.IDPESSOA                       = L.IDBENEFIRRF) ');
      Append('   AND (p.NUMDOCUMENTO IS NOT NULL AND p.NUMDOCUMENTO <> ''00000000000'')'); // Fernando Xavier/Edilaine Ferraresi/Marcio Spinosa SOL 226715 KINTANA 2061081
      Append('   AND (L.datapagamento            BETWEEN TO_DATE(' + quotedStr(DataIni) + ', ''DD/MM/YYYY'') AND TO_DATE(' + quotedStr(DataFim) + ',''DD/MM/YYYY'')) ');
      Append('   AND (L.IDLANCIRRF                     = LI.IDLANCIRRF) ');
      Append('   AND (L.CODNATUREZA                    = N.CODNATUREZA) ');
      Append('   AND (LI.IDINFORME                     = I.IDINFORME) ');
      If (iSistema = 0) Then
        Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 21) ')
      Else If (iSistema = 1) Then
      Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 18) ');
      Append('   AND (N.FLGUSADONADIRF                 = ''S'') ');
      Append('   AND (I.CODDIRF                       <> 1) ');

      //Append('   AND (L.datapagamento            BETWEEN TO_DATE('+quotedStr(DataIni)+', ''DD/MM/YYYY'') AND TO_DATE('+quotedStr(DataFim)+',''DD/MM/YYYY'')) ');
      ////Marcio Sanches Spinosa SOL 219636/15413 KINTANA 2053647 - Inicio
  //    Append(' GROUP BY P.NOME, P.NUMDOCUMENTO, DECODE(L.CODNATUREZA,''7416'',''0561'', ''7431'',''0561'', ''3533'', ''0561'',''3540'', ''0561'', L.CODNATUREZA), ''1'' '); // Edilaine - SOL 197682 / KTN 1894005
      //Append(' GROUP BY P.NOME, P.NUMDOCUMENTO, DECODE(L.CODNATUREZA,''7416'',''0561'', ''7431'',''0561'',  L.CODNATUREZA), ''1'' '); // Edilaine - SOL 197682 / KTN 1894005   // Alterado por Felipe A. Santos SOL 223584 KTN 2057497

      Append(' GROUP BY P.NOME, P.NUMDOCUMENTO, L.DATAPAGAMENTO, L.CODNATUREZA, ''1'' '); // Felipe A. Santos SOL 223584 KTN 2057497

      //Marcio Sanches Spinosa SOL 219636/15413 KINTANA 2053647 - Fim
      Append(' UNION ALL');
      // Andre Imakawa - SIG 81206 - Inicio
      Append('SELECT   AA.NOME, AA.NUMDOCUMENTO, AA.TIPOREG, AA.CODNATUREZA,' );
      Append('         SUM(AA.JAN1)JAN1,SUM(AA.FEV1)FEV1,SUM(AA.MAR1)MAR1,'            );
      Append('         SUM(AA.ABR1)ABR1,SUM(AA.MAI1)MAI1,SUM(AA.JUN1)JUN1,'            );
      Append('         SUM(AA.JUL1)JUL1,SUM(AA.AGO1)AGO1,SUM(AA.SET1)SET1,'            );
      Append('         SUM(AA.OUT1)OUT1,SUM(AA.NOV1)NOV1,SUM(AA.DEZ1)DEZ1,'            );
      Append('         SUM(AA.JAN2)JAN2,SUM(AA.FEV2)FEV2,SUM(AA.MAR2)MAR21,'           );
      Append('         SUM(AA.ABR2)ABR2,SUM(AA.MAI2)MAI2,SUM(AA.JUN2)JUN2,'            );
      Append('         SUM(AA.JUL2)JUL2,SUM(AA.AGO2)AGO2,SUM(AA.SET2)SET2,'            );
      Append('         SUM(AA.OUT2)OUT2,SUM(AA.NOV2)NOV2,SUM(AA.DEZ2)DEZ2,'            );
      Append('         SUM(AA.JAN3)JAN3,SUM(AA.FEV3)FEV3,SUM(AA.MAR3)MAR3,'            );
      Append('         SUM(AA.ABR3)ABR3,SUM(AA.MAI3)MAI3,SUM(AA.JUN3)JUN3,'            );
      Append('         SUM(AA.JUL3)JUL3,SUM(AA.AGO3)AGO3,SUM(AA.SET3)SET3,'            );
      Append('         SUM(AA.OUT3)OUT3,SUM(AA.NOV3)NOV3,SUM(AA.DEZ3)DEZ3,'            );
      // WO13395 - Impostos - Geração da DIRF - Desconto simplificado
      // Alterado por Arnaldo V. Scarin em 02/10/2024
      //
      Append('         SUM(AA.JAN52)JAN52,SUM(AA.FEV52)FEV52,SUM(AA.MAR52)MAR52,'            );
      Append('         SUM(AA.ABR52)ABR52,SUM(AA.MAI52)MAI52,SUM(AA.JUN52)JUN52,'            );
      Append('         SUM(AA.JUL52)JUL52,SUM(AA.AGO52)AGO52,SUM(AA.SET52)SET52,'            );
      Append('         SUM(AA.OUT52)OUT52,SUM(AA.NOV52)NOV52,SUM(AA.DEZ52)DEZ52,SUM(AA.VLR1352)VLR1352,');
      Append('         SUM(AA.JAN54)JAN52,SUM(AA.FEV54)FEV54,SUM(AA.MAR54)MAR54,'            );
      Append('         SUM(AA.ABR54)ABR52,SUM(AA.MAI54)MAI54,SUM(AA.JUN54)JUN54,'            );
      Append('         SUM(AA.JUL54)JUL52,SUM(AA.AGO54)AGO54,SUM(AA.SET54)SET54,'            );
      Append('         SUM(AA.OUT54)OUT52,SUM(AA.NOV54)NOV54,SUM(AA.DEZ54)DEZ54,SUM(AA.VLR1354)VLR1354,');
      // WO13395 - FIM

      Append('         SUM(VLR131)VLR131,SUM(VLR132)VLR132, SUM(VLR133)VLR133 ' );
      Append('         FROM(                                              ' );
      // Andre Imakawa - SIG 81206 - Fim
      Append(' SELECT ');
      Append('   /*+ INDEX (LI XIE1LANCXINFORME) USE_NL(LI , L) */');
      Append('   P.NOME, P.NUMDOCUMENTO, ''2'' AS TIPOREG, ');
      //Marcio Sanches Spinosa SOL 219636/15413 KINTANA 2053647 - Inicio
  //    Append('   DECODE(L.CODNATUREZA,''7416'',''0561'', ''7431'',''0561'', ''3533'', ''0561'',''3540'', ''0561'', L.CODNATUREZA) AS CODNATUREZA, '); // Edilaine - SOL 197682 / KTN 1894005
      // Append('   DECODE(L.CODNATUREZA,''7416'',''0561'', ''7431'',''0561'',  L.CODNATUREZA) AS CODNATUREZA, '); // Edilaine - SOL 197682 / KTN 1894005 // Felipe A. Santos SOL 223584 KTN 2057497
      //Marcio Sanches Spinosa SOL 219636/15413 KINTANA 2053647 - Fim

      // Felipe A. Santos SOL 223584 KTN 2057497
      Append('   case ');
      Append('    when TO_CHAR(L.datapagamento,''YYYYMM'') <= ''201301'' then ');
      Append('         DECODE(L.CODNATUREZA,''7416'',''0561'', ''7431'',''0561'', L.CODNATUREZA) ');
      Append('    else ');
      //edilaine - SIG81238 - inicio
      // Andre Imakawa - SIG 40102 - Inicio
      //Append('          DECODE(L.CODNATUREZA,''7416'',''3540'', ''7431'',''3540'', L.CODNATUREZA) ');
      //Append('          DECODE(L.CODNATUREZA,''7416'',''3540'', ''7431'',''3540'', ''5565'',''3540'', L.CODNATUREZA) ');
      Append('          DECODE(L.CODNATUREZA,''7416'', ''3540'', ');
      Append('                               ''7431'', ''3540'', ');
      Append('                               ''5565'', DECODE(I.CODDIRF, ''43'', L.CODNATUREZA, ''3540''), ');
      Append('                               L.CODNATUREZA) ');
      // Andre Imakawa - SIG 40102 - Fim
      //edilaine - SIG81238 - fim
      Append('   end  CODNATUREZA, ');
      // Felipe A. Santos SOL 223584 KTN 2057497

      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS JAN1, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS FEV1, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS MAR1, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS ABR1, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS MAI1, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS JUN1, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS JUL1, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS AGO1, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS SET1, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS OUT1, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS NOV1, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS DEZ1, ');
      //edilaine - SIG81238 - inicio (I.CODDIRF,''0'' para I.CODDIRF,''43'')
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''43'',LI.VLRLANC,0),0)) AS JAN2, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''43'',LI.VLRLANC,0),0)) AS FEV2, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''43'',LI.VLRLANC,0),0)) AS MAR2, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''43'',LI.VLRLANC,0),0)) AS ABR2, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''43'',LI.VLRLANC,0),0)) AS MAI2, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''43'',LI.VLRLANC,0),0)) AS JUN2, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''43'',LI.VLRLANC,0),0)) AS JUL2, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''43'',LI.VLRLANC,0),0)) AS AGO2, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''43'',LI.VLRLANC,0),0)) AS SET2, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''43'',LI.VLRLANC,0),0)) AS OUT2, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''43'',LI.VLRLANC,0),0)) AS NOV2, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''43'',LI.VLRLANC,0),0)) AS DEZ2, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''43'',LI.VLRLANC,0),0)) AS JAN3, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''43'',LI.VLRLANC,0),0)) AS FEV3, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''43'',LI.VLRLANC,0),0)) AS MAR3, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''43'',LI.VLRLANC,0),0)) AS ABR3, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''43'',LI.VLRLANC,0),0)) AS MAI3, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''43'',LI.VLRLANC,0),0)) AS JUN3, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''43'',LI.VLRLANC,0),0)) AS JUL3, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''43'',LI.VLRLANC,0),0)) AS AGO3, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''43'',LI.VLRLANC,0),0)) AS SET3, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''43'',LI.VLRLANC,0),0)) AS OUT3, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''43'',LI.VLRLANC,0),0)) AS NOV3, ');
      Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''43'',LI.VLRLANC,0),0)) AS DEZ3, ');
      //edilaine - SIG81238 - fim


      // WO13395 - Impostos - Geração da DIRF - Desconto simplificado
      // Alterado por Arnaldo V. Scarin em 02/10/2024
      //
      // idInforme: 52 - IRRF - Dedução - Desconto simplificado / 53 - 13º IRRF - Dedução - Desconto simplificado
      //
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''52'',LI.VLRLANC,0),0)), 2) AS JAN52,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''52'',LI.VLRLANC,0),0)), 2) AS FEV52,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''52'',LI.VLRLANC,0),0)), 2) AS MAR52,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''52'',LI.VLRLANC,0),0)), 2) AS ABR52,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''52'',LI.VLRLANC,0),0)), 2) AS MAI52,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''52'',LI.VLRLANC,0),0)), 2) AS JUN52,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''52'',LI.VLRLANC,0),0)), 2) AS JUL52,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''52'',LI.VLRLANC,0),0)), 2) AS AGO52,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''52'',LI.VLRLANC,0),0)), 2) AS SET52,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''52'',LI.VLRLANC,0),0)), 2) AS OUT52,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''52'',LI.VLRLANC,0),0)), 2) AS NOV52,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''52'',LI.VLRLANC,0),0)), 2) AS DEZ52,');
      Append('                                       ROUND(SUM(DECODE(I.CODDIRF,''53'',LI.VLRLANC,0)), 2) AS VLR1352,');
      //
      // idInforme: 54 - IRRF - Dedução - Desc.Simplif. - Exigib. Susp. / 55 - 13º IRRF - Dedução - Desc.Simplific. - Exigib. Susp.
      //
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''54'',LI.VLRLANC,0),0)), 2) AS JAN54,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''54'',LI.VLRLANC,0),0)), 2) AS FEV54,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''54'',LI.VLRLANC,0),0)), 2) AS MAR54,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''54'',LI.VLRLANC,0),0)), 2) AS ABR54,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''54'',LI.VLRLANC,0),0)), 2) AS MAI54,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''54'',LI.VLRLANC,0),0)), 2) AS JUN54,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''54'',LI.VLRLANC,0),0)), 2) AS JUL54,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''54'',LI.VLRLANC,0),0)), 2) AS AGO54,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''54'',LI.VLRLANC,0),0)), 2) AS SET54,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''54'',LI.VLRLANC,0),0)), 2) AS OUT54,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''54'',LI.VLRLANC,0),0)), 2) AS NOV54,');
      Append('                                       ROUND(SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''54'',LI.VLRLANC,0),0)), 2) AS DEZ54,');
      Append('                                       ROUND(SUM(DECODE(I.CODDIRF,''55'',LI.VLRLANC,0)), 2) AS VLR1354,');
      //
      // WO13395 - FIM


      Append('   SUM(DECODE(I.CODDIRF,''25'',LI.VLRLANC,0)) AS VLR131, ');
      //Append('   SUM(DECODE(I.CODDIRF,''0'' ,LI.VLRLANC,0)) AS VLR132, ');    //edilaine - SIG81238
      Append('   SUM(DECODE(I.CODDIRF,''44'' ,LI.VLRLANC,0)) AS VLR132, ');     //edilaine - SIG81238
      Append('   SUM(DECODE(I.CODDIRF,''0'' ,LI.VLRLANC,0)) AS VLR133 ');
      Append(' FROM INFORME I, LANCXINFORME LI, LANCIRRF L, NATURENDIMENTO N, PESSOA P ');
      Append(' WHERE (P.IDPESSOA                        = L.IDBENEFIRRF) ');
      Append('   AND (p.NUMDOCUMENTO IS NOT NULL AND p.NUMDOCUMENTO <> ''00000000000'')'); // Fernando Xavier/Edilaine Ferraresi/Marcio Spinosa SOL 226715 KINTANA 2061081
      Append('   AND (L.datapagamento            BETWEEN TO_DATE(' + quotedStr(DataIni) + ', ''DD/MM/YYYY'') AND TO_DATE(' + quotedStr(DataFim) + ',''DD/MM/YYYY'')) ');
      Append('   AND (L.IDLANCIRRF                     = LI.IDLANCIRRF) ');
      Append('   AND (L.CODNATUREZA                    = N.CODNATUREZA) ');
      Append('   and (LI.IDINFORME                     = I.IDINFORME) ');
      //CPrev - Pend. 27026 - 30/01/2008 - Início
      If (iSistema = 0) Then
        Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 21) ')
      Else If (iSistema = 1) Then
        Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 18) ');
      //CPrev - Pend. 27026 - 30/01/2008 - Fim

      Append('   AND (N.FLGUSADONADIRF                 = ''S'') ');
      Append('   AND (I.CODDIRF                       <> 1) ');

      //Pend. 27026 - Append('   AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 18) ');
      //Append('   AND (L.datapagamento            BETWEEN TO_DATE('+quotedStr(DataIni)+', ''DD/MM/YYYY'') AND TO_DATE('+quotedStr(DataFim)+',''DD/MM/YYYY'')) ');
      //Marcio Sanches Spinosa SOL 219636/15413 KINTANA 2053647 - Inicio
  //    Append(' GROUP BY P.NOME, P.NUMDOCUMENTO, DECODE(L.CODNATUREZA,''7416'',''0561'', ''7431'',''0561'', ''3533'', ''0561'',''3540'', ''0561'',L.CODNATUREZA), ''2'' ');  // Edilaine - SOL 197682 / KTN 1894005
      //Append(' GROUP BY P.NOME, P.NUMDOCUMENTO, DECODE(L.CODNATUREZA,''7416'',''0561'', ''7431'',''0561'', L.CODNATUREZA), ''2'' ');  // Edilaine - SOL 197682 / KTN 1894005 // Alterador por Felipe A. Santos SOL 223584 KTN 2057497
      //Marcio Sanches Spinosa SOL 219636/15413 KINTANA 2053647 - Fim

      //edilaine - SIG81238 - inicio
      //Append(' GROUP BY P.NOME, P.NUMDOCUMENTO, L.DATAPAGAMENTO, L.CODNATUREZA, ''2'' '); // Felipe A. Santos SOL 223584 KTN 2057497
      Append(' GROUP BY P.NOME, P.NUMDOCUMENTO, L.DATAPAGAMENTO, L.CODNATUREZA, I.CODDIRF, ''2'' ');

      Append(' ) AA GROUP BY AA.NOME, AA.NUMDOCUMENTO, AA.TIPOREG, AA.CODNATUREZA '); // Andre Imakawa - SIG 81206

      //edilaine - SIG81238 - fim

      //CPREV - Pend. 27026 - Fim

      Append(' ) XB,');
      Append(' PESSOA P,PESSOA E');
      Append('WHERE  (XB.NUMDOCUMENTO = P.NUMDOCUMENTO)');
      Append('AND  (XB.NOME = P.NOME)');
      //Append('AND (XB.NUMDOCUMENTO IS NOT NULL AND XB.NUMDOCUMENTO <> ''00000000000'')');  //Fernando Xavier/Edilaine Ferraresi/Marcio Spinosa SOL 226715 KINTANA 2061081 - comentaoo

      If sCPFFIltro <> '' Then
        Append(' AND (XB.NUMDOCUMENTO IN (' + sCPFFiltro + '))');

      Append('AND  (E.IDPESSOA = 1)');
      //Vinicius Maciel SOL 170987 KTN 1528710
      //Para não duplicar os lançamneto do RRA
     //Append('AND CODNATUREZA <> ''9999''');
      Append('AND CODNATUREZA NOT IN (''9999'',''1889'')');
      //Vinicius Maciel SOL 170987 KTN 1528710 - FIM
      Append('ORDER BY CODNATUREZA, P.TIPO, CGCBENEF, NOMEBENEF, XB.TIPOREG ');

    End; //fim do with

  sSql.Text := 'Select TIPO,' + #13#10 +
    '       CGCBENEF,' + #13#10 +
    '       TIPOREG,' + #13#10 +
    '       CGCEMPRE,' + #13#10 +
    '       NOMEEMPRE,' + #13#10 +
    '       CODNATUREZA,' + #13#10 + // Felipe A. Santos SOL 223584 KTN 2057497

  { // Felipe A. Santos SOL 223584 KTN 2057497
//               '       DECODE(CODNATUREZA, ''3533'', ''0561'', ''7416'',''0561'', ''7431'',''0561'', '+#13#10+                             // Edilaine - SOL 211939 / KTN 2044010
  '       DECODE(CODNATUREZA,  ''7416'',''0561'', ''7431'',''0561'', '+#13#10+                             // Edilaine - SOL 211939 / KTN 2044010
  //Marcio Sanches Spinosa SOL 219636/15413 KINTANA 2053647 - Inicio
//               '                           ''3540'', ''0561'', CODNATUREZA) CODNATUREZA,'+#13#10+    // Edilaine - SOL 211939 / KTN 2044010
  '                            CODNATUREZA) CODNATUREZA,'+#13#10+    // Edilaine - SOL 211939 / KTN 2044010
  //Marcio Sanches Spinosa SOL 219636/15413 KINTANA 2053647 - Fim
  //'       CODNATUREZA,'+#13#10+ // Edilaine - SOL 211939 / KTN 2044010 - comentado
  }// Felipe A. Santos SOL 223584 KTN 2057497

    // WO13395 - Impostos - Geração da DIRF - Desconto simplificado
    '       Sum(JAN1) as JAN1,SUM(JAN2) AS JAN2, SUM(JAN3) AS JAN3, SUM(JAN52) AS JAN52, SUM(JAN54) AS JAN54,' + #13#10 +
    '       Sum(FEV1) as FEV1,SUM(FEV2) AS FEV2, SUM(FEV3) AS FEV3, SUM(FEV52) AS FEV52, SUM(FEV54) AS FEV54,' + #13#10 +
    '       Sum(MAR1) as MAR1,SUM(MAR2) AS MAR2, SUM(MAR3) AS MAR3, SUM(MAR52) AS MAR52, SUM(MAR54) AS MAR54,' + #13#10 +
    '       Sum(ABR1) as ABR1,SUM(ABR2) AS ABR2, SUM(ABR3) AS ABR3, SUM(ABR52) AS ABR52, SUM(ABR54) AS ABR54,' + #13#10 +
    '       Sum(MAI1) as MAI1,SUM(MAI2) AS MAI2, SUM(MAI3) AS MAI3, SUM(MAI52) AS MAI52, SUM(MAI54) AS MAI54,' + #13#10 +
    '       Sum(JUN1) as JUN1,SUM(JUN2) AS JUN2, SUM(JUN3) AS JUN3, SUM(JUN52) AS JUN52, SUM(JUN54) AS JUN54,' + #13#10 +
    '       Sum(JUL1) as JUL1,SUM(JUL2) AS JUL2, SUM(JUL3) AS JUL3, SUM(JUL52) AS JUL52, SUM(JUL54) AS JUL54,' + #13#10 +
    '       Sum(AGO1) as AGO1,SUM(AGO2) AS AGO2, SUM(AGO3) AS AGO3, SUM(AGO52) AS AGO52, SUM(AGO54) AS AGO54,' + #13#10 +
    '       Sum(SET1) as SET1,SUM(SET2) AS SET2, SUM(SET3) AS SET3, SUM(SET52) AS SET52, SUM(SET54) AS SET54,' + #13#10 +
    '       Sum(OUT1) as OUT1,SUM(OUT2) AS OUT2, SUM(OUT3) AS OUT3, SUM(OUT52) AS OUT52, SUM(OUT54) AS OUT54,' + #13#10 +
    '       Sum(NOV1) as NOV1,SUM(NOV2) AS NOV2, SUM(NOV3) AS NOV3, SUM(NOV52) AS NOV52, SUM(NOV54) AS NOV54,' + #13#10 +
    '       Sum(DEZ1) as DEZ1,SUM(DEZ2) AS DEZ2, SUM(DEZ3) AS DEZ3, SUM(DEZ52) AS DEZ52, SUM(DEZ54) AS DEZ54,' + #13#10 +
    // WO13395 - Fim
    '       Sum(VLR131) as VLR131, SUM(VLR132) as VLR132, SUM(VLR133) AS VLR133, SUM(VLR1352) AS VLR1352, SUM(VLR1354) AS VLR1354' + #13#10 +
    'FROM (' + sSql.Text + ' ) P' + #13#10 +
    '  WHERE CODNATUREZA NOT IN (0473,9466) ';  //Darivaldo Alencar SIG 28411

    sSql.Text := sSql.Text + 'GROUP BY CGCBENEF,' + #13#10 +
    '         TIPO,' + #13#10 +
    '         TIPOREG,' + #13#10 +
    '         CGCEMPRE,' + #13#10 +
    '         NOMEEMPRE,' + #13#10 +
    '         CODNATUREZA' + #13#10 + // Felipe A. Santos SOL 223584 KTN 2057497
  { // Felipe A. Santos SOL 223584 KTN 2057497
  //Marcio Sanches Spinosa SOL 219636/15413 KINTANA 2053647 - Inicio
//               '         decode(CODNATUREZA, ''3533'', ''0561'', ''7416'',''0561'', ''7431'',''0561'', '+#13#10+                // Edilaine - SOL 211939 / KTN 2044010
//               '                             ''3540'', ''0561'', CODNATUREZA)'+#13#10+    // Edilaine - SOL 211939 / KTN 2044010
  '         decode(CODNATUREZA,  ''7416'',''0561'', ''7431'',''0561'', '+#13#10+                // Edilaine - SOL 211939 / KTN 2044010
  '                              CODNATUREZA)'+#13#10+    // Edilaine - SOL 211939 / KTN 2044010
  //Marcio Sanches Spinosa SOL 219636/15413 KINTANA 2053647 - Fim

  //'         CODNATUREZA'+#13#10+                                           // Edilaine - SOL 211939 / KTN 2044010 - comentado
//      'ORDER BY CODNATUREZA, TIPO, CGCBENEF, TIPOREG';
                                                                  }// Felipe A. Santos SOL 223584 KTN 2057497
  ' ORDER BY CODNATUREZA, CGCBENEF, TIPO, TIPOREG';
  //Henrique Massão
  //sSql.SaveToFile('c:\QueryDirf_FUNCEF.txt');

  sSql.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\QueryDirf_FUNCEF2011.txt');
  Result := GetDataPacket(sSql);
  sSql.Clear;                                 //Arnaldo - WO13395
  FreeAndNil(sSql);                           //Arnaldo - WO13395
End;

//Marilza Colpani-SOL 125645/KTN 649749
//Função que substitui caracteres que possuem acentuações.

Function TCtrlGeraDirfNova.SubstCarEspeciais(Const pString: String): String;
Begin
  {Esta procedure foi implementada para retirar alguns caracteres especiais dos dados em
   uso. Caso muito comum quando se usando dados de clientes de outros países}

  Result := StringReplace(pString, 'Á', 'A', [rfReplaceAll]);
  Result := StringReplace(Result, 'À', 'A', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ã', 'A', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ä', 'A', [rfReplaceAll]);
  Result := StringReplace(Result, 'Â', 'A', [rfReplaceAll]);

  Result := StringReplace(Result, 'á', 'a', [rfReplaceAll]);
  Result := StringReplace(Result, 'à', 'a', [rfReplaceAll]);
  Result := StringReplace(Result, 'ã', 'a', [rfReplaceAll]);
  Result := StringReplace(Result, 'ä', 'a', [rfReplaceAll]);
  Result := StringReplace(Result, 'â', 'a', [rfReplaceAll]);

  Result := StringReplace(Result, 'É', 'E', [rfReplaceAll]);
  Result := StringReplace(Result, 'È', 'E', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ë', 'E', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ê', 'E', [rfReplaceAll]);

  Result := StringReplace(Result, 'é', 'e', [rfReplaceAll]);
  Result := StringReplace(Result, 'è', 'e', [rfReplaceAll]);
  Result := StringReplace(Result, 'ë', 'e', [rfReplaceAll]);
  Result := StringReplace(Result, 'ê', 'e', [rfReplaceAll]);

  Result := StringReplace(Result, 'Í', 'I', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ì', 'I', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ï', 'I', [rfReplaceAll]);
  Result := StringReplace(Result, 'Î', 'I', [rfReplaceAll]);

  Result := StringReplace(Result, 'í', 'i', [rfReplaceAll]);
  Result := StringReplace(Result, 'ì', 'i', [rfReplaceAll]);
  Result := StringReplace(Result, 'ï', 'i', [rfReplaceAll]);
  Result := StringReplace(Result, 'î', 'i', [rfReplaceAll]);

  Result := StringReplace(Result, 'Ó', 'O', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ò', 'O', [rfReplaceAll]);
  Result := StringReplace(Result, 'Õ', 'O', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ö', 'O', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ô', 'O', [rfReplaceAll]);

  Result := StringReplace(Result, 'ó', 'o', [rfReplaceAll]);
  Result := StringReplace(Result, 'ò', 'o', [rfReplaceAll]);
  Result := StringReplace(Result, 'õ', 'o', [rfReplaceAll]);
  Result := StringReplace(Result, 'ö', 'o', [rfReplaceAll]);
  Result := StringReplace(Result, 'ô', 'o', [rfReplaceAll]);

  Result := StringReplace(Result, 'Ú', 'U', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ù', 'U', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ü', 'U', [rfReplaceAll]);
  Result := StringReplace(Result, 'Û', 'U', [rfReplaceAll]);

  Result := StringReplace(Result, 'ú', 'u', [rfReplaceAll]);
  Result := StringReplace(Result, 'ù', 'u', [rfReplaceAll]);
  Result := StringReplace(Result, 'ü', 'u', [rfReplaceAll]);
  Result := StringReplace(Result, 'û', 'u', [rfReplaceAll]);

  Result := StringReplace(Result, 'Ñ', 'N', [rfReplaceAll]);
  Result := StringReplace(Result, 'ñ', 'n', [rfReplaceAll]);

  Result := StringReplace(Result, 'Ç', 'C', [rfReplaceAll]);
  Result := StringReplace(Result, 'ç', 'c', [rfReplaceAll]);

  Result := StringReplace(Result, '&', 'e', [rfReplaceAll]);
End;

//Marilza Colpani-SOL 125645/KTN 649749
//Função que substitui caracteres especiais.

Function TCtrlGeraDirfNova.CaracteresEspeciais(Const sTexto: String;
  Const bDesconsideraEmail: Boolean = false): String;
Var iCount: integer;
  cCar: Char;
Begin
  Result := SubstCarEspeciais(sTexto);
  For iCount := 1 To length(Result) Do
    Begin
      cCar := Result[iCount];
      If bDesconsideraEmail Then
        Begin
          If Not (cCar In ['a'..'z', 'A'..'Z', '0'..'9', ' ', '|', '@', '.']) Then
            Result := Copy(Result, 1, iCount - 1) + ' ' + Copy(Result, iCount + 1, length(Result));
        End
      Else
        Begin
          If Not (cCar In ['a'..'z', 'A'..'Z', '0'..'9', ' ', '|']) Then
            Result := Copy(Result, 1, iCount - 1) + ' ' + Copy(Result, iCount + 1, length(Result));
        End;
    End;
End;

Procedure TCtrlGeraDirfNova.GReg65Anos(Const pArquivo: TextFile;
  Const pCodNatureza: String;
  Const sCGCBenef,
  sAno: String;
  Var bGravaDadosBeneficiario: Boolean);
Begin
  //Verifica se tem exigibilidade suspensa para gerar o arquivo
  If (CdsJudicial.FieldByName('JAN10').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('FEV10').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('MAR10').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('ABR10').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('MAI10').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('JUN10').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('JUL10').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('AGO10').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('SET10').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('OUT10').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('NOV10').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('DEZ10').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('VLR1310').AsFloat <> 0) Then
    Begin
      GRegBeneficiario(sCGCBenef, sAno, bGravaDadosBeneficiario, pArquivo, pCodNatureza);
      GravaLinhaValores(pArquivo, 'RIP65', '10', pCodNatureza, CdsJudicial);
    End;
End;

Procedure TCtrlGeraDirfNova.GRegMolestiaGrave(Const pArquivo: TextFile;
  Const pCodNatureza: String;
  Const sCGCBenef,
  sAno: String;
  Var bGravaDadosBeneficiario: Boolean);
Begin
  //Verifica se tem exigibilidade suspensa para gerar o arquivo
  If (CdsJudicial.FieldByName('JAN11').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('FEV11').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('MAR11').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('ABR11').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('MAI11').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('JUN11').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('JUL11').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('AGO11').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('SET11').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('OUT11').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('NOV11').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('DEZ11').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('VLR1311').AsFloat <> 0) Then
    Begin
      GRegBeneficiario(sCGCBenef, sAno, bGravaDadosBeneficiario, pArquivo, pCodNatureza);
      //GravaLinhaValores(pArquivo,'RIMOG','11',pCodNatureza,CdsJudicial);
      GravaLinhaValores(pArquivo, 'RIMOG', '11', pCodNatureza, CdsJudicial, true, Not (CdsRRA.isEmpty));
    End;
End;

Procedure TCtrlGeraDirfNova.GRegAbono(Const pArquivo: TextFile;
  Const pCodNatureza: String;
  Const sCGCBenef,
  sAno: String;
  Var bGravaDadosBeneficiario: Boolean);
Begin
  //Verifica se tem exigibilidade suspensa para gerar o arquivo
  If (CdsJudicial.FieldByName('JAN15').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('FEV15').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('MAR15').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('ABR15').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('MAI15').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('JUN15').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('JUL15').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('AGO15').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('SET15').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('OUT15').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('NOV15').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('DEZ15').AsFloat <> 0) Or
    (CdsJudicial.FieldByName('VLR1315').AsFloat <> 0) Then
    Begin
      GRegBeneficiario(sCGCBenef, sAno, bGravaDadosBeneficiario, pArquivo, pCodNatureza);
      GravaLinhaValores(pArquivo, 'RIAP', '15', pCodNatureza, CdsJudicial);
    End;
End;

// Paulo SOL243508/16869 PPM 630406 - início

Procedure TCtrlGeraDirfNova.GRegIR1343(Const pArquivo: TextFile;
  Const pCodNatureza: String;
  Const sCGCBenef,
  sAno: String;
  Var bGravaDadosBeneficiario: Boolean);
Begin
  If (CdsIN1343.FieldByName('JAN20').AsFloat <> 0) Or
    (CdsIN1343.FieldByName('FEV20').AsFloat <> 0) Or
    (CdsIN1343.FieldByName('MAR20').AsFloat <> 0) Or
    (CdsIN1343.FieldByName('ABR20').AsFloat <> 0) Or
    (CdsIN1343.FieldByName('MAI20').AsFloat <> 0) Or
    (CdsIN1343.FieldByName('JUN20').AsFloat <> 0) Or
    (CdsIN1343.FieldByName('JUL20').AsFloat <> 0) Or
    (CdsIN1343.FieldByName('AGO20').AsFloat <> 0) Or
    (CdsIN1343.FieldByName('SET20').AsFloat <> 0) Or
    (CdsIN1343.FieldByName('OUT20').AsFloat <> 0) Or
    (CdsIN1343.FieldByName('NOV20').AsFloat <> 0) Or
    (CdsIN1343.FieldByName('DEZ20').AsFloat <> 0) Or
    (CdsIN1343.FieldByName('VLR1320').AsFloat <> 0) Then
    Begin
      GRegBeneficiario(sCGCBenef, sAno, bGravaDadosBeneficiario, pArquivo, pCodNatureza);
      GravaLinhaValores(pArquivo, 'RICAP', '20', pCodNatureza, CdsIN1343);
    End;
End;
// Paulo SOL243508/16869 PPM 630406 - fim

Function TCtrlGeraDirfNova.ListDadosPlanoSaude(IdPessoa,
  iSistema: Integer;
  DataIni,
  DataFim: String;
  edPessoanotin: String;
  iFlgPlano: integer; //Vinicius Maciel SOL 170987 KTN 1528710
  sCPFFiltro: String): OleVariant;
Var sSql: TstringList;
Begin
  sSql := TStringList.Create;
  With Ssql Do
    Begin
      {Text := 'SELECT pe.numdocumento,' + #13#10 +
              '       Sum(h.valorprovento)*100 as valor' + #13#10 +
              'FROM HISTRUBSAL H' + #13#10 +
              'JOIN PROVDESC PD on PD.IDPROVENTO = h.idrubrica' + #13#10 +
              'JOIN Pessoa PE on h.idpessoa = pe.idpessoa' + #13#10 +
               'WHERE (H.IDMODULO = 21)' + #13#10 +
              '  AND (H.IDPESSJUR = 1)' + #13#10 +
              '  AND H.DataPagamento >= To_date('+QuotedStr(dataIni)+',''dd/mm/yyyy'')' + #13#10 +
              '  AND H.DataPagamento <= To_date('+QuotedStr(DataFim)+',''dd/mm/yyyy'')' + #13#10 +
              '  AND pd.idprovento in (32159,33091,39864,39227)' + #13#10 +
              '  AND pe.numdocumento is not null';}
      Text := 'SELECT pe.numdocumento,' + #13#10 +
        '       Sum(h.valor)*100 as valor' + #13#10 +
        'FROM RETASSIST H' + #13#10 +
        'JOIN PROVDESC PD on PD.IDPROVENTO = h.IDPROVENTO' + #13#10 +
        'JOIN Pessoa PE on h.idpessoa = pe.idpessoa' + #13#10 +
        '  WHERE ' + #13#10 +
        '  H.ANO = ' + formatDateTime('yyyy', strToDate(dataini)) + #13#10 +
        '  AND pd.flgassistencial = ' + IntToStr(iFlgPlano) + #13#10 + //Vinicius Maciel SOL 170987 KTN 1528710
      '  AND pe.numdocumento is not null';

      If sCPFFIltro <> '' Then
        Text := Text + ' AND (PE.NUMDOCUMENTO IN (' + sCPFFiltro + '))';

      Text := Text + 'GROUP BY pe.numdocumento ' + #13#10 +
        'ORDER BY NUMDOCUMENTO';

    End; //fim do with

  sSql.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\QueryPlanoSaude2011.txt');
  Result := GetDataPacket(sSql);
End;

Function TCtrlGeraDirfNova.ListDadosDependentesPlanoSaude(Const IdPessoa,
  iSistema: Integer;
  Const sAno,
  edPessoanotin: String;
  iFlgPlano: integer; //Vinicius Maciel SOL 170987 KTN 1528710
  sCPFFiltro: String): OleVariant;
Var sSql: TstringList;
Begin
  sSql := TStringList.Create;
  With sSql Do
    Begin
      Text := 'SELECT RA.IDTITULAR,' + #13#10 +
        '       P.NUMDOCUMENTO AS CPFTITULAR,' + #13#10 +
        '       RA.IDPESSOA,' + #13#10 +
        '       pe.numdocumento,' + #13#10 +
        '       pe.nome,' + #13#10 +
        '       pf.datanasc,' + #13#10 +
        '       DECODE(DT.IDDEPENDENCIA,''PAI'',''08'',' + #13#10 +
        '                               ''MAE'',''08'',' + #13#10 +
        '                               ''COM'',''03'',' + #13#10 +
        '                               ''FIL'',''04'',' + #13#10 +
        '                               ''OUT'',''10'',' + #13#10 +
        '                               ''AFL'',''06'',' + #13#10 +
        '                               ''ENT'',''06'',''10'') AS DEPENDENCIA,' + #13#10 +
        '       sum(ra.valor)*100 as Valor' + #13#10 +
        '  FROM RetAssist RA' + #13#10 +
        '  JOIN PESSOA P ON P.IDPESSOA = RA.IDTITULAR' + #13#10 +
        '  JOIN PROVDESC PD     on PD.IDPROVENTO = RA.IDPROVENTO' + #13#10 +
        '  JOIN Pessoa PE       on PE.idpessoa = RA.IDPESSOA' + #13#10 +
        '  Join PessoaFisica PF on PF.Idpessoa = PE.IDPESSOA' + #13#10 +
        '  join DEPENTIT DT     ON DT.IDTITULAR = RA.IDTITULAR AND DT.IDPESSOA = RA.IDPESSOA' + #13#10 +
        ' WHERE ra.ano = ' + sAno + #13#10 +
        '   AND P.NUMDOCUMENTO IS NOT NULL';

      If sCPFFIltro <> '' Then
        Text := Text + ' AND (P.NUMDOCUMENTO IN (' + sCPFFiltro + '))';

      //Vinicius Maciel SOL 170987 KTN 1528710
      If iflgPlano = 1 Then
        Begin
          Text := Text + ' AND DT.FLGPLSAUDE = 1' + #13#10 +
            ' AND PD.FLGASSISTENCIAL = 1'
        End;
      If iflgPlano = 2 Then
        Text := Text + ' AND DT.FLGPLODONTO = 1' + #13#10 +
          ' AND PD.FLGASSISTENCIAL = 2';
      //Vinicius Maciel SOL 170987 KTN 1528710 - FIM

      Text := Text + 'GROUP BY RA.IDTITULAR,' + #13#10 +
        '         P.NUMDOCUMENTO,' + #13#10 +
        '         RA.IDPESSOA,' + #13#10 +
        '         pe.numdocumento,' + #13#10 +
        '         pe.nome,' + #13#10 +
        '         pf.datanasc,' + #13#10 +
        '         DT.IDDEPENDENCIA' + #13#10 +
        //'ORDER BY NUMDOCUMENTO ';
      'ORDER BY CPFTITULAR, NUMDOCUMENTO ,DATANASC'; //Vinicius Maciel SOL 170987 KTN 1528710
    End; //fim do with
  sSql.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\QueryDependentesPlanoSaude2011.txt');
  Result := GetDataPacket(sSql);
End;

Function TCtrlGeraDirfNova.ListResponsavelPlano(IdPessoa: Integer): OleVariant;
Var
  sSql: String;
Begin
  sSql := 'SELECT P.NUMDOCUMENTO, DP.NUMDOCUMENTO ANS, P.NOME, P.RAZAOSOCIAL' + #13#10 +
    'FROM PESSOA P' + #13#10 +
    'JOIN DOCPESSOA DP ON (P.IDPESSOA = DP.IDPESSOA)' + #13#10 +
    'WHERE P.IDPESSOA = ' + IntToStr(IdPessoa) + #13#10 +
    '  AND DP.IDDOCUMENTO = 42';
  Result := GetDataPacket(Ssql);
End;

//Vinicius Maciel SOL 170987 KTN 1528710

Procedure TCtrlGeraDirfNova.GravaLinhaPlanoOdontologico(
  Const pArquivo: TextFile);
Var sLinha: String;
Begin
  sLinha := 'OPSE|' +
    CompletaZero(Copy(CdsResponsavelOdonto.fieldByname('NUMDOCUMENTO').AsString, 1, 14), 14) + '|' +
    CaracteresEspeciais(CdsResponsavelOdonto.FieldByName('RAZAOSOCIAL').asString) + '|' +
    CompletaZero(StringReplace(CdsResponsavelOdonto.fieldByname('ANS').AsString, '-', '', [rfReplaceAll]), 6) + '|';
  WriteLn(pArquivo, sLinha);
End;
//Vinicius Maciel SOL 170987 KTN 1528710 - FIM

//Vinicius Maciel SOL 170987 KTN 1528710

Procedure TCtrlGeraDirfNova.IncluiDadosRRA(Const pArquivo: TextFile;
  Const pLista: tStringList;
  Const pAno: String);    // Andre Imakawa - SIG 61321
Var
  sLinhaBen: String;
  sLinhaRra: String;
  sCodNatureza: String; // SOL 206552 KTN 2000044 Otacilio
  sLinhaRTPA: string; // Andre Imakawa - SIG 61321
Begin
  sCodNatureza := ''; // SOL 206552 KTN 2000044 Otacilio
  cdsRra.First;
  If Not CdsRra.isEmpty Then
    Begin
      sLinhaRra := 'RRA' + '|' +
        '1' + '|' +
        '|' + //Espaço para o número do processo
      '|' + //Flag de Advogado/escritório de advogacia
      '|' + //Espaço para o cpf/cnpj do advogado/escritório de advogacia
      '|' + //Nome do advogado/escritório de advogacia
      '|' ; //Valor pago para o advogado  //William Santana - SIG 34429

      {// Fernando Xavier/Edilaine Ferraresi/Marcio Spinosa SOL 226715 KINTANA 2061081 - comentado
      WriteLn(pArquivo,sLinhaRra);
      WriteLn(pArquivo, 'IDREC|'+CompletaZero(CdsRra.fieldByname('CODNATUREZA').AsString,4)+'|');
      sCodNatureza := Trim(CdsRra.fieldByname('CODNATUREZA').AsString); // SOL 206552 KTN 2000044 Otacilio
      }// Fernando Xavier/Edilaine Ferraresi/Marcio Spinosa SOL 226715 KINTANA 2061081 - fim

      While Not CdsRRA.eof Do
        Begin
          {// Fernando Xavier/Edilaine Ferraresi/Marcio Spinosa SOL 226715 KINTANA 2061081 - comentado
          // SOL 206552 KTN 2000044 Otacilio ** Inicio **
          // Verificar o CodNatureza tem que incluir no arquivo cada codigo e seus respectivos registros
          if Trim(sCodNatureza) <> Trim(CdsRra.fieldByname('CODNATUREZA').AsString) then
             WriteLn(pArquivo, 'IDREC|'+CompletaZero(CdsRra.fieldByname('CODNATUREZA').AsString,4)+'|');
          // // SOL 206552 KTN 2000044 Otacilio ** Fim **
          }// Fernando Xavier/Edilaine Ferraresi/Marcio Spinosa SOL 226715 KINTANA 2061081- fim

          // Fernando Xavier/Edilaine Ferraresi/Marcio Spinosa SOL 226715 KINTANA 2061081 - inicio
          If (CdsRra.FieldByName('JAN16').AsFloat +
            CdsRra.FieldByName('FEV16').AsFloat +
            CdsRra.FieldByName('MAR16').AsFloat +
            CdsRra.FieldByName('ABR16').AsFloat +
            CdsRra.FieldByName('MAI16').AsFloat +
            CdsRra.FieldByName('JUN16').AsFloat +
            CdsRra.FieldByName('JUL16').AsFloat +
            CdsRra.FieldByName('AGO16').AsFloat +
            CdsRra.FieldByName('SET16').AsFloat +
            CdsRra.FieldByName('OUT16').AsFloat +
            CdsRra.FieldByName('NOV16').AsFloat +
            CdsRra.FieldByName('DEZ16').AsFloat +
            CdsRra.FieldByName('VLR1316').AsFloat +

            // Paulo Nobre SOL 269130 PPM 1284502
            CdsRra.FieldByName('JAN17').AsFloat +
            CdsRra.FieldByName('FEV17').AsFloat +
            CdsRra.FieldByName('MAR17').AsFloat +
            CdsRra.FieldByName('ABR17').AsFloat +
            CdsRra.FieldByName('MAI17').AsFloat +
            CdsRra.FieldByName('JUN17').AsFloat +
            CdsRra.FieldByName('JUL17').AsFloat +
            CdsRra.FieldByName('AGO17').AsFloat +
            CdsRra.FieldByName('SET17').AsFloat +
            CdsRra.FieldByName('OUT17').AsFloat +
            CdsRra.FieldByName('NOV17').AsFloat +
            CdsRra.FieldByName('DEZ17').AsFloat +
            CdsRra.FieldByName('VLR1317').AsFloat +
            CdsRra.FieldByName('JAN18').AsFloat +
            CdsRra.FieldByName('FEV18').AsFloat +
            CdsRra.FieldByName('MAR18').AsFloat +
            CdsRra.FieldByName('ABR18').AsFloat +
            CdsRra.FieldByName('MAI18').AsFloat +
            CdsRra.FieldByName('JUN18').AsFloat +
            CdsRra.FieldByName('JUL18').AsFloat +
            CdsRra.FieldByName('AGO18').AsFloat +
            CdsRra.FieldByName('SET18').AsFloat +
            CdsRra.FieldByName('OUT18').AsFloat +
            CdsRra.FieldByName('NOV18').AsFloat +
            CdsRra.FieldByName('DEZ18').AsFloat +
            CdsRra.FieldByName('VLR1318').AsFloat +
            CdsRra.FieldByName('JAN19').AsFloat +
            CdsRra.FieldByName('FEV19').AsFloat +
            CdsRra.FieldByName('MAR19').AsFloat +
            CdsRra.FieldByName('ABR19').AsFloat +
            CdsRra.FieldByName('MAI19').AsFloat +
            CdsRra.FieldByName('JUN19').AsFloat +
            CdsRra.FieldByName('JUL19').AsFloat +
            CdsRra.FieldByName('AGO19').AsFloat +
            CdsRra.FieldByName('SET19').AsFloat +
            CdsRra.FieldByName('OUT19').AsFloat +
            CdsRra.FieldByName('NOV19').AsFloat +
            CdsRra.FieldByName('DEZ19').AsFloat +
            CdsRra.FieldByName('VLR1319').AsFloat) > 0 Then
            //
            Begin
              If (sLinhaRra <> EmptyStr) Then
                Begin
                  WriteLn(pArquivo, sLinhaRra);
                  sLinhaRra := EmptyStr;
                End;
              // Fernando Xavier/Edilaine Ferraresi/Marcio Spinosa SOL 226715 KINTANA 2061081 - fim

              If Trim(sCodNatureza) <> Trim(CdsRra.fieldByname('CODNATUREZA').AsString) Then
                Begin
                  WriteLn(pArquivo, 'IDREC|' + CompletaZero(CdsRra.fieldByname('CODNATUREZA').AsString, 4) + '|');
                  sCodNatureza := Trim(CdsRra.fieldByname('CODNATUREZA').AsString);
                End;

              PossuiValorRTPA(CdsRra, '19', CdsRra.fieldByname('CODNATUREZA').AsString, sLinhaRTPA, False); // Andre Imakawa - SIG 61321

              sLinhaBen := 'BPFRRA|' +
                CompletaZero(CdsRra.fieldByname('CGCBENEF').AsString, 11) + '|' +
                Completa(CdsRra.fieldByname('NOMEBENEF').AsString, 60) + '|' +
                '|' + //Espaço para a natureza do RRA
              '|'; //Espaço para a moléstia Grave

              // Andre Imakawa - SIG 61321 - Inicio
              if (pAno >= '2017') then
              Begin
                if sLinhaRTPA <> EmptyStr then
                  sLinhaBen := sLinhaBen + 'S|'
                else
                  sLinhaBen := sLinhaBen + 'N|';
              end;
              // Andre Imakawa - SIG 61321 - Fim

              WriteLn(pArquivo, sLinhaBen);
              GReg_RRA_RendimentoTributavel(pArquivo, CdsRra);
              GReg_RRA_PensaoAlimenticia(pArquivo, CdsRra, sLinhaRTPA);
              GReg_RRA_IRRF(pArquivo, CdsRra);
              GReg_RRA_Molestia(pArquivo, CdsRra);
              GReg_RRA_QtdMeses(pArquivo, CdsRra);
            End;
          cdsRRA.next; // Fernando Xavier/Edilaine Ferraresi/Marcio Spinosa SOL 226715 KINTANA 2061081
        End;
    End;
End;
//Vinicius Maciel SOL 170987 KTN 1528710

Function TCtrlGeraDirfNova.dadosRRA(IdPessoa,
  iSistema: Integer;
  DataIni,
  DataFim,
  NumDocumento: String;
  rValorMinimo,
  rValorIndenizacao: Real;
  sCPFFiltro: String): Olevariant;
Var
  sSQL: TStringList;
Begin
  sSql := TStringList.Create;
  sSQL.Text := ' SELECT TIPO, NOMEBENEF, CGCBENEF,CGCEMPRE,NOMEEMPRE,CODNATUREZA,' + #13#10 +
    ' SUM(JAN16) AS JAN16, SUM(FEV16) AS FEV16, SUM(MAR16) AS MAR16, ' + #13#10 +
    ' SUM(ABR16) AS ABR16, SUM(MAI16) AS MAI16, SUM(JUN16) AS JUN16, ' + #13#10 +
    ' SUM(JUL16) AS JUL16, SUM(AGO16) AS AGO16, SUM(SET16) AS SET16, ' + #13#10 +
    ' SUM(OUT16) AS OUT16, SUM(NOV16) AS NOV16, SUM(DEZ16) AS DEZ16, ' + #13#10 +
    ' SUM(JAN17) AS JAN17, SUM(FEV17) AS FEV17, SUM(MAR17) AS MAR17, ' + #13#10 +
    ' SUM(ABR17) AS ABR17, SUM(MAI17) AS MAI17, SUM(JUN17) AS JUN17, ' + #13#10 +
    ' SUM(JUL17) AS JUL17, SUM(AGO17) AS AGO17, SUM(SET17) AS SET17, ' + #13#10 +
    ' SUM(OUT17) AS OUT17, SUM(NOV17) AS NOV17, SUM(DEZ17) AS DEZ17, ' + #13#10 +
    ' SUM(JAN18) AS JAN18, SUM(FEV18) AS FEV18, SUM(MAR18) AS MAR18, ' + #13#10 +
    ' SUM(ABR18) AS ABR18, SUM(MAI18) AS MAI18, SUM(JUN18) AS JUN18, ' + #13#10 +
    ' SUM(JUL18) AS JUL18, SUM(AGO18) AS AGO18, SUM(SET18) AS SET18, ' + #13#10 +
    ' SUM(OUT18) AS OUT18, SUM(NOV18) AS NOV18, SUM(DEZ18) AS DEZ18, ' + #13#10 +
    ' SUM(JAN19) AS JAN19, SUM(FEV19) AS FEV19, SUM(MAR19) AS MAR19, ' + #13#10 +
    ' SUM(ABR19) AS ABR19, SUM(MAI19) AS MAI19, SUM(JUN19) AS JUN19, ' + #13#10 +
    ' SUM(JUL19) AS JUL19, SUM(AGO19) AS AGO19, SUM(SET19) AS SET19, ' + #13#10 +
    ' SUM(OUT19) AS OUT19, SUM(NOV19) AS NOV19, SUM(DEZ19) AS DEZ19, ' + #13#10 +
    ' SUM(VLR1316) AS VLR1316, SUM(VLR1317) AS VLR1317, ' + #13#10 +
    ' SUM(VLR1318) AS VLR1318, SUM(VLR1319) AS VLR1319 ' + #13#10 +
    ' FROM (SELECT  XB.IDBENEFIRRF, P.TIPO, P.RAZAOSOCIAL AS NOMEBENEF,  ' + #13#10 +
    ' RTRIM(P.NUMDOCUMENTO) AS CGCBENEF, ' + #13#10 +
    ' E.NUMDOCUMENTO AS CGCEMPRE, E.RAZAOSOCIAL AS NOMEEMPRE, XB.CODNATUREZA,' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.JAN16),-1,0,XB.JAN16*100)),0) AS JAN16, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.FEV16),-1,0,XB.FEV16*100)),0) AS FEV16, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.MAR16),-1,0,XB.MAR16*100)),0) AS MAR16,  ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.ABR16),-1,0,XB.ABR16*100)),0) AS ABR16, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.MAI16),-1,0,XB.MAI16*100)),0) AS MAI16, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.JUN16),-1,0,XB.JUN16*100)),0) AS JUN16, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.JUL16),-1,0,XB.JUL16*100)),0) AS JUL16, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.AGO16),-1,0,XB.AGO16*100)),0) AS AGO16, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.SET16),-1,0,XB.SET16*100)),0) AS SET16, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.OUT16),-1,0,XB.OUT16*100)),0) AS OUT16, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.NOV16),-1,0,XB.NOV16*100)),0) AS NOV16, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.DEZ16),-1,0,XB.DEZ16*100)),0) AS DEZ16, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.JAN17),-1,0,XB.JAN17*100)),0) AS JAN17, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.FEV17),-1,0,XB.FEV17*100)),0) AS FEV17, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.MAR17),-1,0,XB.MAR17*100)),0) AS MAR17, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.ABR17),-1,0,XB.ABR17*100)),0) AS ABR17, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.MAI17),-1,0,XB.MAI17*100)),0) AS MAI17, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.JUN17),-1,0,XB.JUN17*100)),0) AS JUN17, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.JUL17),-1,0,XB.JUL17*100)),0) AS JUL17, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.AGO17),-1,0,XB.AGO17*100)),0) AS AGO17, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.SET17),-1,0,XB.SET17*100)),0) AS SET17, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.OUT17),-1,0,XB.OUT17*100)),0) AS OUT17, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.NOV17),-1,0,XB.NOV17*100)),0) AS NOV17, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.DEZ17),-1,0,XB.DEZ17*100)),0) AS DEZ17, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.JAN18),-1,0,XB.JAN18*100)),0) AS JAN18, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.FEV18),-1,0,XB.FEV18*100)),0) AS FEV18, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.MAR18),-1,0,XB.MAR18*100)),0) AS MAR18, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.ABR18),-1,0,XB.ABR18*100)),0) AS ABR18, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.MAI18),-1,0,XB.MAI18*100)),0) AS MAI18, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.JUN18),-1,0,XB.JUN18*100)),0) AS JUN18, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.JUL18),-1,0,XB.JUL18*100)),0) AS JUL18, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.AGO18),-1,0,XB.AGO18*100)),0) AS AGO18, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.SET18),-1,0,XB.SET18*100)),0) AS SET18, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.OUT18),-1,0,XB.OUT18*100)),0) AS OUT18, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.NOV18),-1,0,XB.NOV18*100)),0) AS NOV18, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.DEZ18),-1,0,XB.DEZ18*100)),0) AS DEZ18, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.JAN19),-1,0,XB.JAN19*100)),0) AS JAN19, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.FEV19),-1,0,XB.FEV19*100)),0) AS FEV19, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.MAR19),-1,0,XB.MAR19*100)),0) AS MAR19, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.ABR19),-1,0,XB.ABR19*100)),0) AS ABR19, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.MAI19),-1,0,XB.MAI19*100)),0) AS MAI19, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.JUN19),-1,0,XB.JUN19*100)),0) AS JUN19, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.JUL19),-1,0,XB.JUL19*100)),0) AS JUL19, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.AGO19),-1,0,XB.AGO19*100)),0) AS AGO19, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.SET19),-1,0,XB.SET19*100)),0) AS SET19, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.OUT19),-1,0,XB.OUT19*100)),0) AS OUT19, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.NOV19),-1,0,XB.NOV19*100)),0) AS NOV19, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.DEZ19),-1,0,XB.DEZ19*100)),0) AS DEZ19, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.VLR1316),-1,0,XB.VLR1316*100)),0) AS VLR1316, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.VLR1317),-1,0,XB.VLR1317*100)),0) AS VLR1317, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.VLR1318),-1,0,XB.VLR1318*100)),0) AS VLR1318, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.VLR1319),-1,0,XB.VLR1319*100)),0) AS VLR1319 ' + #13#10 +
    ' FROM PESSOA P,PESSOA E,  (SELECT U.IDBENEFIRRF, U.CODNATUREZA, ' + #13#10 +
    ' SUM(U.JAN16) AS JAN16,  SUM(U.FEV16) AS FEV16, ' + #13#10 +
    ' SUM(U.MAR16) AS MAR16,  SUM(U.ABR16) AS ABR16, ' + #13#10 +
    ' SUM(U.MAI16) AS MAI16,  SUM(U.JUN16) AS JUN16, ' + #13#10 +
    ' SUM(U.JUL16) AS JUL16,  SUM(U.AGO16) AS AGO16, ' + #13#10 +
    ' SUM(U.SET16) AS SET16,  SUM(U.OUT16) AS OUT16, ' + #13#10 +
    ' SUM(U.NOV16) AS NOV16,  SUM(U.DEZ16) AS DEZ16, ' + #13#10 +
    ' SUM(U.JAN17) AS JAN17,  SUM(U.FEV17) AS FEV17, ' + #13#10 +
    ' SUM(U.MAR17) AS MAR17,  SUM(U.ABR17) AS ABR17, ' + #13#10 +
    ' SUM(U.MAI17) AS MAI17,  SUM(U.JUN17) AS JUN17, ' + #13#10 +
    ' SUM(U.JUL17) AS JUL17,  SUM(U.AGO17) AS AGO17, ' + #13#10 +
    ' SUM(U.SET17) AS SET17,  SUM(U.OUT17) AS OUT17, ' + #13#10 +
    ' SUM(U.NOV17) AS NOV17,  SUM(U.DEZ17) AS DEZ17, ' + #13#10 +
    ' SUM(U.JAN18) AS JAN18,  SUM(U.FEV18) AS FEV18, ' + #13#10 +
    ' SUM(U.MAR18) AS MAR18,  SUM(U.ABR18) AS ABR18, ' + #13#10 +
    ' SUM(U.MAI18) AS MAI18,  SUM(U.JUN18) AS JUN18, ' + #13#10 +
    ' SUM(U.JUL18) AS JUL18,  SUM(U.AGO18) AS AGO18, ' + #13#10 +
    ' SUM(U.SET18) AS SET18,  SUM(U.OUT18) AS OUT18, ' + #13#10 +
    ' SUM(U.NOV18) AS NOV18,  SUM(U.DEZ18) AS DEZ18, ' + #13#10 +
    ' SUM(U.JAN19) AS JAN19,  SUM(U.FEV19) AS FEV19, ' + #13#10 +
    ' SUM(U.MAR19) AS MAR19,  SUM(U.ABR19) AS ABR19, ' + #13#10 +
    ' SUM(U.MAI19) AS MAI19,  SUM(U.JUN19) AS JUN19, ' + #13#10 +
    ' SUM(U.JUL19) AS JUL19,  SUM(U.AGO19) AS AGO19, ' + #13#10 +
    ' SUM(U.SET19) AS SET19,  SUM(U.OUT19) AS OUT19, ' + #13#10 +
    ' SUM(U.NOV19) AS NOV19,  SUM(U.DEZ19) AS DEZ19, ' + #13#10 +
    ' SUM(U.VLR1316) AS VLR1316, ' + #13#10 +
    ' SUM(U.VLR1317) AS VLR1317, ' + #13#10 +
    ' SUM(U.VLR1318) AS VLR1318, ' + #13#10 +
    ' SUM(U.VLR1319) AS VLR1319 ' + #13#10 +
    ' FROM ((SELECT L.IDBENEFIRRF, DECODE(L.CODNATUREZA, ''7416'',''0561'', ''7431'',''0561'', L.CODNATUREZA) AS CODNATUREZA,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''01'',DECODE(I.CODDIRF,''37'',LI.VLRLANC,0),0)) AS JAN16,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''02'',DECODE(I.CODDIRF,''37'',LI.VLRLANC,0),0)) AS FEV16,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''03'',DECODE(I.CODDIRF,''37'',LI.VLRLANC,0),0)) AS MAR16,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''04'',DECODE(I.CODDIRF,''37'',LI.VLRLANC,0),0)) AS ABR16,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''05'',DECODE(I.CODDIRF,''37'',LI.VLRLANC,0),0)) AS MAI16,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''06'',DECODE(I.CODDIRF,''37'',LI.VLRLANC,0),0)) AS JUN16,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''07'',DECODE(I.CODDIRF,''37'',LI.VLRLANC,0),0)) AS JUL16,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''08'',DECODE(I.CODDIRF,''37'',LI.VLRLANC,0),0)) AS AGO16,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''09'',DECODE(I.CODDIRF,''37'',LI.VLRLANC,0),0)) AS SET16,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''10'',DECODE(I.CODDIRF,''37'',LI.VLRLANC,0),0)) AS OUT16,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''11'',DECODE(I.CODDIRF,''37'',LI.VLRLANC,0),0)) AS NOV16,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''12'',DECODE(I.CODDIRF,''37'',LI.VLRLANC,0),0)) AS DEZ16,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''01'',DECODE(I.CODDIRF,''38'',LI.VLRLANC,0),0)) AS JAN17,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''02'',DECODE(I.CODDIRF,''38'',LI.VLRLANC,0),0)) AS FEV17,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''03'',DECODE(I.CODDIRF,''38'',LI.VLRLANC,0),0)) AS MAR17,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''04'',DECODE(I.CODDIRF,''38'',LI.VLRLANC,0),0)) AS ABR17,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''05'',DECODE(I.CODDIRF,''38'',LI.VLRLANC,0),0)) AS MAI17,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''06'',DECODE(I.CODDIRF,''38'',LI.VLRLANC,0),0)) AS JUN17,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''07'',DECODE(I.CODDIRF,''38'',LI.VLRLANC,0),0)) AS JUL17,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''08'',DECODE(I.CODDIRF,''38'',LI.VLRLANC,0),0)) AS AGO17,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''09'',DECODE(I.CODDIRF,''38'',LI.VLRLANC,0),0)) AS SET17,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''10'',DECODE(I.CODDIRF,''38'',LI.VLRLANC,0),0)) AS OUT17,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''11'',DECODE(I.CODDIRF,''38'',LI.VLRLANC,0),0)) AS NOV17,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''12'',DECODE(I.CODDIRF,''38'',LI.VLRLANC,0),0)) AS DEZ17,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''01'',DECODE(I.CODDIRF,''39'',LI.VLRLANC,0),0)) AS JAN18,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''02'',DECODE(I.CODDIRF,''39'',LI.VLRLANC,0),0)) AS FEV18,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''03'',DECODE(I.CODDIRF,''39'',LI.VLRLANC,0),0)) AS MAR18,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''04'',DECODE(I.CODDIRF,''39'',LI.VLRLANC,0),0)) AS ABR18,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''05'',DECODE(I.CODDIRF,''39'',LI.VLRLANC,0),0)) AS MAI18,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''06'',DECODE(I.CODDIRF,''39'',LI.VLRLANC,0),0)) AS JUN18,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''07'',DECODE(I.CODDIRF,''39'',LI.VLRLANC,0),0)) AS JUL18,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''08'',DECODE(I.CODDIRF,''39'',LI.VLRLANC,0),0)) AS AGO18,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''09'',DECODE(I.CODDIRF,''39'',LI.VLRLANC,0),0)) AS SET18,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''10'',DECODE(I.CODDIRF,''39'',LI.VLRLANC,0),0)) AS OUT18,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''11'',DECODE(I.CODDIRF,''39'',LI.VLRLANC,0),0)) AS NOV18,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''12'',DECODE(I.CODDIRF,''39'',LI.VLRLANC,0),0)) AS DEZ18,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''01'',DECODE(I.CODDIRF,''40'',LI.VLRLANC,0),0)) AS JAN19,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''02'',DECODE(I.CODDIRF,''40'',LI.VLRLANC,0),0)) AS FEV19,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''03'',DECODE(I.CODDIRF,''40'',LI.VLRLANC,0),0)) AS MAR19,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''04'',DECODE(I.CODDIRF,''40'',LI.VLRLANC,0),0)) AS ABR19,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''05'',DECODE(I.CODDIRF,''40'',LI.VLRLANC,0),0)) AS MAI19,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''06'',DECODE(I.CODDIRF,''40'',LI.VLRLANC,0),0)) AS JUN19,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''07'',DECODE(I.CODDIRF,''40'',LI.VLRLANC,0),0)) AS JUL19,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''08'',DECODE(I.CODDIRF,''40'',LI.VLRLANC,0),0)) AS AGO19,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''09'',DECODE(I.CODDIRF,''40'',LI.VLRLANC,0),0)) AS SET19,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''10'',DECODE(I.CODDIRF,''40'',LI.VLRLANC,0),0)) AS OUT19,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''11'',DECODE(I.CODDIRF,''40'',LI.VLRLANC,0),0)) AS NOV19,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''12'',DECODE(I.CODDIRF,''40'',LI.VLRLANC,0),0)) AS DEZ19,' + #13#10 +
    ' SUM(DECODE(I.CODDIRF,''41'',LI.VLRLANC,0)) AS VLR1316, ' + #13#10 +
    ' SUM(DECODE(I.CODDIRF,''42'',LI.VLRLANC,0)) AS VLR1318,' + #13#10 +
    ' 0 as VLR1317, 0 as VLR1319' + #13#10 +
    ' FROM INFORME I, LANCXINFORME LI, LANCIRRF L, NATURENDIMENTO N' + #13#10 +
    ' WHERE (I.IDINFORME = LI.IDINFORME)' + #13#10 +
    ' AND (LI.IDLANCIRRF = L.IDLANCIRRF)' + #13#10 +
    ' AND (L.CODNATUREZA = N.CODNATUREZA)' + #13#10 +
    ' AND (N.FLGUSADONADIRF = ''S'')' + #13#10 +
    ' AND (I.CODDIRF <> 1)';
  If (iSistema = 0) Then
    sSQL.Text := sSQL.Text + ' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 21) ' + #13#10
  Else
    If (iSistema = 1) Then
      Begin
        sSQL.Text := sSQL.Text + ' AND (L.IDMODULO IN (18,24)) ' + #13#10;
        If sCPFFIltro <> '' Then
          sSQL.Text := sSQL.Text + ' AND (L.IDBENEFIRRF  IN ( SELECT IDPESSOA FROM PESSOA P WHERE P.NUMDOCUMENTO IN (' + sCPFFiltro + ')))' + #13#10;
      End
    Else
      If (iSistema = 2) Then
        sSQL.Text := sSQL.Text + ' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 3) ' + #13#10;
  sSQL.Text := sSQL.Text + ' AND (L.datapagamento BETWEEN TO_DATE(' + quotedStr(DataIni) + ',''DD/MM/YYYY'') AND TO_DATE(' + quotedStr(DataFim) + ',''DD/MM/YYYY''))' + #13#10 +
    ' GROUP BY L.IDBENEFIRRF, DECODE(L.CODNATUREZA,''7416'',''0561'', ''7431'',''0561'',' + #13#10 +
    ' L.CODNATUREZA))) U' + #13#10 +
    ' GROUP BY U.IDBENEFIRRF, U.CODNATUREZA) XB' + #13#10 +
    ' WHERE  (XB.IDBENEFIRRF = P.IDPESSOA)' + #13#10 +
    ' AND  (E.IDPESSOA = ' + IntToStr(IdPessoa) + ')' + #13#10 +
    ' AND  ( ((XB.JAN16 + XB.FEV16 + XB.MAR16 + XB.ABR16 + XB.MAI16 +' + #13#10 +
    ' XB.JUN16 + XB.JUL16 + XB.AGO16 + XB.SET16 + XB.OUT16 +' + #13#10 +
    ' XB.NOV16 + XB.DEZ16 + XB.VLR1316) <> 0 )' + #13#10 +
    ' OR ((XB.JAN17 + XB.FEV17 + XB.MAR17 + XB.ABR17 + XB.MAI17 +' + #13#10 +
    ' XB.JUN17 + XB.JUL17 + XB.AGO17 + XB.SET17 + XB.OUT17 +' + #13#10 +
    ' XB.NOV17 + XB.DEZ17 + XB.VLR1317) <> 0 )' + #13#10 +
    ' OR ((XB.JAN18 + XB.FEV18 + XB.MAR18 + XB.ABR18 + XB.MAI18 +' + #13#10 +
    ' XB.JUN18 + XB.JUL18 + XB.AGO18 + XB.SET18 + XB.OUT18 +' + #13#10 +
    ' XB.NOV18 + XB.DEZ18 + XB.VLR1318) <> 0 )' + #13#10 +
    ' OR ((XB.JAN19 + XB.FEV19 + XB.MAR19 + XB.ABR19 + XB.MAI19 +' + #13#10 +
    ' XB.JUN19 + XB.JUL19 + XB.AGO19 + XB.SET19 + XB.OUT19 +' + #13#10 +
    ' XB.NOV19 + XB.DEZ19 + XB.VLR1319) <> 0 ))' + #13#10;
  If sCPFFIltro <> '' Then
    sSQL.Text := sSQL.Text + ' AND (P.NUMDOCUMENTO IN (' + sCPFFiltro + '))' + #13#10;
  sSQL.Text := sSQL.Text + ' ORDER BY CODNATUREZA, NOMEBENEF, P.TIPO, CGCBENEF) P' + #13#10 +
    ' GROUP BY TIPO, NOMEBENEF,CGCBENEF,CGCEMPRE,NOMEEMPRE, CODNATUREZA' + #13#10 +
    ' Order By tipo,codnatureza,cgcbenef';
  sSql.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\QueryRRA.txt');
  result := GetDataPacket(sSQL);
  FreeAndNil(sSql);
End;
//Vinicius Maciel SOL 170987 KTN 1528710 - FIM
//Vinicius Maciel SOL 170987 KTN 1528710

// Paulo SOL243508/16869 PPM 630406 - início

Function TCtrlGeraDirfNova.dadosIN1343(IdPessoa,
  iSistema: Integer;
  DataIni,
  DataFim,
  NumDocumento: String;
  sCPF: String;
  const sCodNatureza : string = ''    //edilaine - SIG81238
  ): Olevariant;
Var
  sSQL: TStringList;
Begin
  sCPF := quotedstr(sCPF);
  sSql := TStringList.Create;
  sSQL.Text := ' SELECT TIPO, NOMEBENEF, CGCBENEF,CGCEMPRE,NOMEEMPRE,CODNATUREZA,' + #13#10 +
    ' SUM(JAN20) AS JAN20, SUM(FEV20) AS FEV20, SUM(MAR20) AS MAR20, ' + #13#10 +
    ' SUM(ABR20) AS ABR20, SUM(MAI20) AS MAI20, SUM(JUN20) AS JUN20, ' + #13#10 +
    ' SUM(JUL20) AS JUL20, SUM(AGO20) AS AGO20, SUM(SET20) AS SET20, ' + #13#10 +
    ' SUM(OUT20) AS OUT20, SUM(NOV20) AS NOV20, SUM(DEZ20) AS DEZ20, ' + #13#10 +
    ' SUM(VLR1320) AS VLR1320 ' + #13#10 +
    ' FROM (SELECT  XB.IDBENEFIRRF, P.TIPO, P.RAZAOSOCIAL AS NOMEBENEF,  ' + #13#10 +
    ' RTRIM(P.NUMDOCUMENTO) AS CGCBENEF, ' + #13#10 +
    ' E.NUMDOCUMENTO AS CGCEMPRE, E.RAZAOSOCIAL AS NOMEEMPRE, XB.CODNATUREZA,' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.JAN20),-1,0,XB.JAN20*100)),0) AS JAN20, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.FEV20),-1,0,XB.FEV20*100)),0) AS FEV20, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.MAR20),-1,0,XB.MAR20*100)),0) AS MAR20,  ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.ABR20),-1,0,XB.ABR20*100)),0) AS ABR20, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.MAI20),-1,0,XB.MAI20*100)),0) AS MAI20, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.JUN20),-1,0,XB.JUN20*100)),0) AS JUN20, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.JUL20),-1,0,XB.JUL20*100)),0) AS JUL20, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.AGO20),-1,0,XB.AGO20*100)),0) AS AGO20, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.SET20),-1,0,XB.SET20*100)),0) AS SET20, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.OUT20),-1,0,XB.OUT20*100)),0) AS OUT20, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.NOV20),-1,0,XB.NOV20*100)),0) AS NOV20, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.DEZ20),-1,0,XB.DEZ20*100)),0) AS DEZ20, ' + #13#10 +
    ' NVL(TRUNC(DECODE(SIGN(XB.VLR1320),-1,0,XB.VLR1320*100)),0) AS VLR1320 ' + #13#10 +
    ' FROM PESSOA P,PESSOA E,  (SELECT U.IDBENEFIRRF, U.CODNATUREZA, ' + #13#10 +
    ' SUM(U.JAN20) AS JAN20,  SUM(U.FEV20) AS FEV20, ' + #13#10 +
    ' SUM(U.MAR20) AS MAR20,  SUM(U.ABR20) AS ABR20, ' + #13#10 +
    ' SUM(U.MAI20) AS MAI20,  SUM(U.JUN20) AS JUN20, ' + #13#10 +
    ' SUM(U.JUL20) AS JUL20,  SUM(U.AGO20) AS AGO20, ' + #13#10 +
    ' SUM(U.SET20) AS SET20,  SUM(U.OUT20) AS OUT20, ' + #13#10 +
    ' SUM(U.NOV20) AS NOV20,  SUM(U.DEZ20) AS DEZ20, ' + #13#10 +
    ' SUM(U.VLR1320) AS VLR1320 ' + #13#10 +
    ' FROM ((SELECT L.IDBENEFIRRF, L.CODNATUREZA,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''01'',DECODE(I.CODDIRF,''43'',LI.VLRLANC,0),0)) AS JAN20,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''02'',DECODE(I.CODDIRF,''43'',LI.VLRLANC,0),0)) AS FEV20,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''03'',DECODE(I.CODDIRF,''43'',LI.VLRLANC,0),0)) AS MAR20,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''04'',DECODE(I.CODDIRF,''43'',LI.VLRLANC,0),0)) AS ABR20,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''05'',DECODE(I.CODDIRF,''43'',LI.VLRLANC,0),0)) AS MAI20,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''06'',DECODE(I.CODDIRF,''43'',LI.VLRLANC,0),0)) AS JUN20,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''07'',DECODE(I.CODDIRF,''43'',LI.VLRLANC,0),0)) AS JUL20,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''08'',DECODE(I.CODDIRF,''43'',LI.VLRLANC,0),0)) AS AGO20,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''09'',DECODE(I.CODDIRF,''43'',LI.VLRLANC,0),0)) AS SET20,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''10'',DECODE(I.CODDIRF,''43'',LI.VLRLANC,0),0)) AS OUT20,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''11'',DECODE(I.CODDIRF,''43'',LI.VLRLANC,0),0)) AS NOV20,' + #13#10 +
    ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''), ''12'',DECODE(I.CODDIRF,''43'',LI.VLRLANC,0),0)) AS DEZ20,' + #13#10 +
    // SOL 248824/16980 PPM 680604 - Paulo Nobre
//  ' SUM(DECODE(I.CODDIRF,''43'',LI.VLRLANC,0)) AS VLR1320 ' + #13#10 +
  ' SUM(DECODE(I.CODDIRF,''44'',LI.VLRLANC,0)) AS VLR1320 ' + #13#10 +
    //
  ' FROM INFORME I, LANCXINFORME LI, LANCIRRF L, NATURENDIMENTO N' + #13#10 +
    ' WHERE (I.IDINFORME = LI.IDINFORME)' + #13#10 +
    ' AND (LI.IDLANCIRRF = L.IDLANCIRRF)' + #13#10 +
    ' AND (L.CODNATUREZA = N.CODNATUREZA)' + #13#10 +
    ' AND (N.FLGUSADONADIRF = ''S'')' + #13#10 +
    ' AND (I.CODDIRF <> 1)';

  sSQL.Text := sSQL.Text + ' AND (L.IDMODULO IN (18,24)) ' + #13#10;
  If sCPF <> '' Then
    sSQL.Text := sSQL.Text + ' AND (L.IDBENEFIRRF  IN ( SELECT IDPESSOA FROM PESSOA P WHERE P.NUMDOCUMENTO IN (' + sCPF + ')))' + #13#10;

  //edilaine - SIG81238 - inicio
  If sCodNatureza <> '' Then
    sSQL.Text := sSQL.Text + ' AND (L.CODNATUREZA = ' + Quotedstr(sCodNatureza) + ')' + #13#10;
  //edilaine - SIG81238 - fim

  sSQL.Text := sSQL.Text + ' AND (L.datapagamento BETWEEN TO_DATE(' + quotedStr(DataIni) + ',''DD/MM/YYYY'') AND TO_DATE(' + quotedStr(DataFim) + ',''DD/MM/YYYY''))' + #13#10 +
    ' GROUP BY L.IDBENEFIRRF, L.CODNATUREZA)) U' + #13#10 +
    ' GROUP BY U.IDBENEFIRRF, U.CODNATUREZA) XB' + #13#10 +
    ' WHERE  (XB.IDBENEFIRRF = P.IDPESSOA)' + #13#10 +
    ' AND  (E.IDPESSOA = ' + IntToStr(IdPessoa) + ')' + #13#10 +
    ' AND  ( ((XB.JAN20 + XB.FEV20 + XB.MAR20 + XB.ABR20 + XB.MAI20 +' + #13#10 +
    ' XB.JUN20 + XB.JUL20 + XB.AGO20 + XB.SET20 + XB.OUT20 +' + #13#10 +
    ' XB.NOV20 + XB.DEZ20 + XB.VLR1320) <> 0 ))' + #13#10;

  If sCPF <> '' Then
    sSQL.Text := sSQL.Text + ' AND (P.NUMDOCUMENTO IN (' + sCPF + '))' + #13#10;
  sSQL.Text := sSQL.Text + ' ORDER BY CODNATUREZA, NOMEBENEF, P.TIPO, CGCBENEF) P' + #13#10 +
    ' GROUP BY TIPO, NOMEBENEF,CGCBENEF,CGCEMPRE,NOMEEMPRE, CODNATUREZA' + #13#10 +
    ' Order By tipo,codnatureza,cgcbenef';
  sSql.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\QueryIN1343.txt');
  result := GetDataPacket(sSQL);
  FreeAndNil(sSql);
End;
// Paulo SOL243508/16869 PPM 630406 - fim

Procedure TCtrlGeraDirfNova.GReg_RRA_IRRF(Const pArquivo: TextFile; CdsRra: TClientDataSet);
Begin
  If (CdsRra.FieldByName('JAN17').AsFloat <> 0) Or
    (CdsRra.FieldByName('FEV17').AsFloat <> 0) Or
    (CdsRra.FieldByName('MAR17').AsFloat <> 0) Or
    (CdsRra.FieldByName('ABR17').AsFloat <> 0) Or
    (CdsRra.FieldByName('MAI17').AsFloat <> 0) Or
    (CdsRra.FieldByName('JUN17').AsFloat <> 0) Or
    (CdsRra.FieldByName('JUL17').AsFloat <> 0) Or
    (CdsRra.FieldByName('AGO17').AsFloat <> 0) Or
    (CdsRra.FieldByName('SET17').AsFloat <> 0) Or
    (CdsRra.FieldByName('OUT17').AsFloat <> 0) Or
    (CdsRra.FieldByName('NOV17').AsFloat <> 0) Or
    (CdsRra.FieldByName('DEZ17').AsFloat <> 0) Or
    (CdsRra.FieldByName('VLR1317').AsFloat <> 0) Then
    GravaLinhaValores(pArquivo, 'RTIRF', '17', CdsRra.fieldByname('CODNATUREZA').AsString, CdsRra, false, false, false); //Vinicius Maciel SOL 173822 KTN 1568567
End;

Procedure TCtrlGeraDirfNova.GReg_RRA_Molestia(Const pArquivo: TextFile; CdsRra: TClientDataSet);
Begin
  If (CdsRra.FieldByName('JAN18').AsFloat <> 0) Or
    (CdsRra.FieldByName('FEV18').AsFloat <> 0) Or
    (CdsRra.FieldByName('MAR18').AsFloat <> 0) Or
    (CdsRra.FieldByName('ABR18').AsFloat <> 0) Or
    (CdsRra.FieldByName('MAI18').AsFloat <> 0) Or
    (CdsRra.FieldByName('JUN18').AsFloat <> 0) Or
    (CdsRra.FieldByName('JUL18').AsFloat <> 0) Or
    (CdsRra.FieldByName('AGO18').AsFloat <> 0) Or
    (CdsRra.FieldByName('SET18').AsFloat <> 0) Or
    (CdsRra.FieldByName('OUT18').AsFloat <> 0) Or
    (CdsRra.FieldByName('NOV18').AsFloat <> 0) Or
    (CdsRra.FieldByName('DEZ18').AsFloat <> 0) Or
    (CdsRra.FieldByName('VLR1318').AsFloat <> 0) Then
    GravaLinhaValores(pArquivo, 'RIMOG', '18', CdsRra.fieldByname('CODNATUREZA').AsString, CdsRra, false, false, false); //Vinicius Maciel SOL 173822 KTN 1568567
End;

Procedure TCtrlGeraDirfNova.GReg_RRA_PensaoAlimenticia(Const pArquivo: TextFile; CdsRra: TClientDataSet; pLinha: String);
Begin
  If (CdsRra.FieldByName('JAN19').AsFloat <> 0) Or
    (CdsRra.FieldByName('FEV19').AsFloat <> 0) Or
    (CdsRra.FieldByName('MAR19').AsFloat <> 0) Or
    (CdsRra.FieldByName('ABR19').AsFloat <> 0) Or
    (CdsRra.FieldByName('MAI19').AsFloat <> 0) Or
    (CdsRra.FieldByName('JUN19').AsFloat <> 0) Or
    (CdsRra.FieldByName('JUL19').AsFloat <> 0) Or
    (CdsRra.FieldByName('AGO19').AsFloat <> 0) Or
    (CdsRra.FieldByName('SET19').AsFloat <> 0) Or
    (CdsRra.FieldByName('OUT19').AsFloat <> 0) Or
    (CdsRra.FieldByName('NOV19').AsFloat <> 0) Or
    (CdsRra.FieldByName('DEZ19').AsFloat <> 0) Or
    (CdsRra.FieldByName('VLR1319').AsFloat <> 0) Then
    GravaLinhaValores(pArquivo, 'RTPA', '19', CdsRra.fieldByname('CODNATUREZA').AsString, CdsRra, false, false, false, plinha); //Vinicius Maciel SOL 173822 KTN 1568567 // Andre Imakawa - SIG 61321 - Fim

End;

Procedure TCtrlGeraDirfNova.GReg_RRA_RendimentoTributavel(Const pArquivo: TextFile; CdsRra: TClientDataSet);
Begin
  If (CdsRra.FieldByName('JAN16').AsFloat <> 0) Or
    (CdsRra.FieldByName('FEV16').AsFloat <> 0) Or
    (CdsRra.FieldByName('MAR16').AsFloat <> 0) Or
    (CdsRra.FieldByName('ABR16').AsFloat <> 0) Or
    (CdsRra.FieldByName('MAI16').AsFloat <> 0) Or
    (CdsRra.FieldByName('JUN16').AsFloat <> 0) Or
    (CdsRra.FieldByName('JUL16').AsFloat <> 0) Or
    (CdsRra.FieldByName('AGO16').AsFloat <> 0) Or
    (CdsRra.FieldByName('SET16').AsFloat <> 0) Or
    (CdsRra.FieldByName('OUT16').AsFloat <> 0) Or
    (CdsRra.FieldByName('NOV16').AsFloat <> 0) Or
    (CdsRra.FieldByName('DEZ16').AsFloat <> 0) Or
    (CdsRra.FieldByName('VLR1316').AsFloat <> 0) Then
    GravaLinhaValores(pArquivo, 'RTRT', '16', CdsRra.fieldByname('CODNATUREZA').AsString, CdsRra, false, false, false); //Vinicius Maciel SOL 173822 KTN 1568567
End;

Function TCtrlGeraDirfNova.ajustaCaracteresNome(sNome: String): String;
Var
  sResultado, sNomeAjustado, sCaracter: String;
  iTamanho, i: integer;
Begin
  sNomeAjustado := trim(sNome);
  iTamanho := length(sNome);
  sResultado := '';
  sCaracter := '';
  For i := 0 To iTamanho - 1 Do
    Begin
      sCaracter := copy(sNomeAjustado, i + 1, 1);
      If (sCaracter <> '*') Then
        sResultado := sResultado + sCaracter;
    End;
  Result := sResultado;
End;

Procedure TCtrlGeraDirfNova.GReg_RRA_QtdMeses(Const pArquivo: TextFile;
  CdsRra: TClientDataSet);
Var
  sLinha, sSQL: String;
  bGravar: Boolean;
  cdsAux: TClientDataSet;
Begin
  cdsAux := TClientDataSet.create(Nil);
  sSQL := ' SELECT SUM(DECODE(TO_CHAR(L.DATALANCAMENTO,''MM''),''01'',QTDMESES,0)) AS MES01,' +
    ' SUM(DECODE(TO_CHAR(L.DATALANCAMENTO,''MM''),''02'',QTDMESES,0)) AS MES02, ' +
    ' SUM(DECODE(TO_CHAR(L.DATALANCAMENTO,''MM''),''03'',QTDMESES,0)) AS MES03, ' +
    ' SUM(DECODE(TO_CHAR(L.DATALANCAMENTO,''MM''),''04'',QTDMESES,0)) AS MES04, ' +
    ' SUM(DECODE(TO_CHAR(L.DATALANCAMENTO,''MM''),''05'',QTDMESES,0)) AS MES05, ' +
    ' SUM(DECODE(TO_CHAR(L.DATALANCAMENTO,''MM''),''06'',QTDMESES,0)) AS MES06, ' +
    ' SUM(DECODE(TO_CHAR(L.DATALANCAMENTO,''MM''),''07'',QTDMESES,0)) AS MES07, ' +
    ' SUM(DECODE(TO_CHAR(L.DATALANCAMENTO,''MM''),''08'',QTDMESES,0)) AS MES08, ' +
    ' SUM(DECODE(TO_CHAR(L.DATALANCAMENTO,''MM''),''09'',QTDMESES,0)) AS MES09, ' +
    ' SUM(DECODE(TO_CHAR(L.DATALANCAMENTO,''MM''),''10'',QTDMESES,0)) AS MES10, ' +
    ' SUM(DECODE(TO_CHAR(L.DATALANCAMENTO,''MM''),''11'',QTDMESES,0)) AS MES11, ' +
    ' SUM(DECODE(TO_CHAR(L.DATALANCAMENTO,''MM''),''12'',QTDMESES,0)) AS MES12  ' +
    ' FROM LANCIRRF L, Pessoa P ' +
    ' WHERE L.IDBENEFIRRF = P.IDPESSOA' +
    ' AND P.NUMDOCUMENTO = ' + QuotedStr(CdsRRA.fieldByName('CGCBENEF').asString) +
    ' AND L.DATALANCAMENTO >= TO_DATE(' + QuotedStr('01/01/' + sAno2011) + ', ''DD/MM/YYYY'')' + //Marcio Sanches Spinosa SOL 236012 PPM 499021
  ' AND L.DATALANCAMENTO <= TO_DATE(' + QuotedStr('31/12/' + sAno2011) + ', ''DD/MM/YYYY'')' + //Marcio Sanches Spinosa SOL 236012 PPM 499021
  ' AND L.CODNATUREZA = 1889 ';
  cdsAux.data := GetDataPacket(sSQL);
  If (CdsRra.FieldByName('JAN16').AsFloat <> 0) Or
    (CdsRra.FieldByName('FEV16').AsFloat <> 0) Or
    (CdsRra.FieldByName('MAR16').AsFloat <> 0) Or
    (CdsRra.FieldByName('ABR16').AsFloat <> 0) Or
    (CdsRra.FieldByName('MAI16').AsFloat <> 0) Or
    (CdsRra.FieldByName('JUN16').AsFloat <> 0) Or
    (CdsRra.FieldByName('JUL16').AsFloat <> 0) Or
    (CdsRra.FieldByName('AGO16').AsFloat <> 0) Or
    (CdsRra.FieldByName('SET16').AsFloat <> 0) Or
    (CdsRra.FieldByName('OUT16').AsFloat <> 0) Or
    (CdsRra.FieldByName('NOV16').AsFloat <> 0) Or
    (CdsRra.FieldByName('DEZ16').AsFloat <> 0) Or
    (CdsRra.FieldByName('VLR1316').AsFloat <> 0)
    //Início - William Santana - SOL 271393 PPM 1371672
     Or
    (CdsRra.FieldByName('JAN18').AsFloat <> 0) Or
    (CdsRra.FieldByName('FEV18').AsFloat <> 0) Or
    (CdsRra.FieldByName('MAR18').AsFloat <> 0) Or
    (CdsRra.FieldByName('ABR18').AsFloat <> 0) Or
    (CdsRra.FieldByName('MAI18').AsFloat <> 0) Or
    (CdsRra.FieldByName('JUN18').AsFloat <> 0) Or
    (CdsRra.FieldByName('JUL18').AsFloat <> 0) Or
    (CdsRra.FieldByName('AGO18').AsFloat <> 0) Or
    (CdsRra.FieldByName('SET18').AsFloat <> 0) Or
    (CdsRra.FieldByName('OUT18').AsFloat <> 0) Or
    (CdsRra.FieldByName('NOV18').AsFloat <> 0) Or
    (CdsRra.FieldByName('DEZ18').AsFloat <> 0) Or
    (CdsRra.FieldByName('VLR1318').AsFloat <> 0)
    //Término - William Santana - SOL 271393 PPM 1371672
    Then
    Begin
      sLinha := 'QTMESES' + '|';
      sLinha := sLinha +
        // Andre Imakawa - SIG 63547 - Inicio
        {
        // Andre Imakawa - SIG 60776 - Inicio
        iff(CdsRra.FieldByName('JAN16').AsFloat <> 0, CompletaZero(CdsAux.fieldByname('MES01').AsString, 3),'000') + '0' + '|' +
        iff(CdsRra.FieldByName('FEV16').AsFloat <> 0, CompletaZero(CdsAux.fieldByname('MES02').AsString, 3),'000') + '0' + '|' +
        iff(CdsRra.FieldByName('MAR16').AsFloat <> 0, CompletaZero(CdsAux.fieldByname('MES03').AsString, 3),'000') + '0' + '|' +
        iff(CdsRra.FieldByName('ABR16').AsFloat <> 0, CompletaZero(CdsAux.fieldByname('MES04').AsString, 3),'000') + '0' + '|' +
        iff(CdsRra.FieldByName('MAI16').AsFloat <> 0, CompletaZero(CdsAux.fieldByname('MES05').AsString, 3),'000') + '0' + '|' +
        iff(CdsRra.FieldByName('JUN16').AsFloat <> 0, CompletaZero(CdsAux.fieldByname('MES06').AsString, 3),'000') + '0' + '|' +
        iff(CdsRra.FieldByName('JUL16').AsFloat <> 0, CompletaZero(CdsAux.fieldByname('MES07').AsString, 3),'000') + '0' + '|' +
        iff(CdsRra.FieldByName('AGO16').AsFloat <> 0, CompletaZero(CdsAux.fieldByname('MES08').AsString, 3),'000') + '0' + '|' +
        iff(CdsRra.FieldByName('SET16').AsFloat <> 0, CompletaZero(CdsAux.fieldByname('MES09').AsString, 3),'000') + '0' + '|' +
        iff(CdsRra.FieldByName('OUT16').AsFloat <> 0, CompletaZero(CdsAux.fieldByname('MES10').AsString, 3),'000') + '0' + '|' +
        iff(CdsRra.FieldByName('NOV16').AsFloat <> 0, CompletaZero(CdsAux.fieldByname('MES11').AsString, 3),'000') + '0' + '|' +
        iff(CdsRra.FieldByName('DEZ16').AsFloat <> 0, CompletaZero(CdsAux.fieldByname('MES12').AsString, 3),'000') + '0' + '|';
        // Andre Imakawa - SIG 60776 - Fim
        }
        iff((CdsRra.FieldByName('JAN16').AsFloat <> 0)OR(CdsRra.FieldByName('JAN18').AsFloat <> 0), CompletaZero(CdsAux.fieldByname('MES01').AsString, 3),'000') + '0' + '|' +
        iff((CdsRra.FieldByName('FEV16').AsFloat <> 0)OR(CdsRra.FieldByName('FEV18').AsFloat <> 0), CompletaZero(CdsAux.fieldByname('MES02').AsString, 3),'000') + '0' + '|' +
        iff((CdsRra.FieldByName('MAR16').AsFloat <> 0)OR(CdsRra.FieldByName('MAR18').AsFloat <> 0), CompletaZero(CdsAux.fieldByname('MES03').AsString, 3),'000') + '0' + '|' +
        iff((CdsRra.FieldByName('ABR16').AsFloat <> 0)OR(CdsRra.FieldByName('ABR18').AsFloat <> 0), CompletaZero(CdsAux.fieldByname('MES04').AsString, 3),'000') + '0' + '|' +
        iff((CdsRra.FieldByName('MAI16').AsFloat <> 0)OR(CdsRra.FieldByName('MAI18').AsFloat <> 0), CompletaZero(CdsAux.fieldByname('MES05').AsString, 3),'000') + '0' + '|' +
        iff((CdsRra.FieldByName('JUN16').AsFloat <> 0)OR(CdsRra.FieldByName('JUN18').AsFloat <> 0), CompletaZero(CdsAux.fieldByname('MES06').AsString, 3),'000') + '0' + '|' +
        iff((CdsRra.FieldByName('JUL16').AsFloat <> 0)OR(CdsRra.FieldByName('JUL18').AsFloat <> 0), CompletaZero(CdsAux.fieldByname('MES07').AsString, 3),'000') + '0' + '|' +
        iff((CdsRra.FieldByName('AGO16').AsFloat <> 0)OR(CdsRra.FieldByName('AGO18').AsFloat <> 0), CompletaZero(CdsAux.fieldByname('MES08').AsString, 3),'000') + '0' + '|' +
        iff((CdsRra.FieldByName('SET16').AsFloat <> 0)OR(CdsRra.FieldByName('SET18').AsFloat <> 0), CompletaZero(CdsAux.fieldByname('MES09').AsString, 3),'000') + '0' + '|' +
        iff((CdsRra.FieldByName('OUT16').AsFloat <> 0)OR(CdsRra.FieldByName('OUT18').AsFloat <> 0), CompletaZero(CdsAux.fieldByname('MES10').AsString, 3),'000') + '0' + '|' +
        iff((CdsRra.FieldByName('NOV16').AsFloat <> 0)OR(CdsRra.FieldByName('NOV18').AsFloat <> 0), CompletaZero(CdsAux.fieldByname('MES11').AsString, 3),'000') + '0' + '|' +
        iff((CdsRra.FieldByName('DEZ16').AsFloat <> 0)OR(CdsRra.FieldByName('DEZ18').AsFloat <> 0), CompletaZero(CdsAux.fieldByname('MES12').AsString, 3),'000') + '0' + '|';
        // Andre Imakawa - SIG 63547 - Fim
      WriteLn(pArquivo, sLinha);
    End;
  FreeAndNil(cdsAux);
End;

//Marcio Sanches Spinosa SOL 216222 KINTANA 2045931 - Ini

Function TCtrlGeraDirfNova.ajustaValor(fValor: double): double;
Begin
  If (fValor <= 0.00) Then
    result := 0
  Else
    result := fValor;
End;
//Vinicius Maciel SOL 170987 KTN 1528710 - FIM

//Marcio Sanches Spinosa SOL 216222 KINTANA 2045931 - Inicio

Function TCtrlGeraDirfNova.ListGeraDirfCAP(IdPessoa, iSistema: Integer;
  DataIni, DataFim, NumDocumento: String; bRetencao: Boolean;
  rValorMinimo: Real; chkParticipMantido: Boolean; edPessoanotin,
  sCPFFiltro: String): OleVariant;
Var
  Ssql: TstringList;
  iAno, iMes, iDia: word;
Begin
  DecodeDate(StrToDate(DataIni), iAno, iMes, iDia);

  Ssql := TStringList.Create;
  With Ssql Do
    Begin
      Append(' Select TIPO, CGCBENEF, TIPOREG, CGCEMPRE, NOMEEMPRE, ');
      //Append(' DECODE(CODNATUREZA, ''3533'', ''0561'', ''3540'', ''0561'', CODNATUREZA) CODNATUREZA, ');  // Felipe A. Santos SOL 223584 KTN 2057497
      Append(' CODNATUREZA, ');
      Append(' Sum(JAN1) as JAN1, SUM(JAN2) AS JAN2, SUM(JAN3) AS JAN3, ');
      Append(' Sum(FEV1) as FEV1, SUM(FEV2) AS FEV2, SUM(FEV3) AS FEV3, ');
      Append(' Sum(MAR1) as MAR1, SUM(MAR2) AS MAR2, SUM(MAR3) AS MAR3, ');
      Append(' Sum(ABR1) as ABR1, SUM(ABR2) AS ABR2, SUM(ABR3) AS ABR3, ');
      Append(' Sum(MAI1) as MAI1, SUM(MAI2) AS MAI2, SUM(MAI3) AS MAI3, ');
      Append(' Sum(JUN1) as JUN1, SUM(JUN2) AS JUN2, SUM(JUN3) AS JUN3, ');
      Append(' Sum(JUL1) as JUL1, SUM(JUL2) AS JUL2, SUM(JUL3) AS JUL3, ');
      Append(' Sum(AGO1) as AGO1, SUM(AGO2) AS AGO2, SUM(AGO3) AS AGO3, ');
      Append(' Sum(SET1) as SET1, SUM(SET2) AS SET2, SUM(SET3) AS SET3, ');
      Append(' Sum(OUT1) as OUT1, SUM(OUT2) AS OUT2, SUM(OUT3) AS OUT3, ');
      Append(' Sum(NOV1) as NOV1, SUM(NOV2) AS NOV2, SUM(NOV3) AS NOV3, ');
      Append(' Sum(DEZ1) as DEZ1, SUM(DEZ2) AS DEZ2, SUM(DEZ3) AS DEZ3, ');
      Append(' Sum(VLR131) as VLR131, SUM(VLR132) as VLR132, SUM(VLR133) AS VLR133 ');
      Append(' FROM (SELECT distinct P.TIPO, ');
      Append(' (TRIM(DECODE(P.RAZAOSOCIAL, '''', P.NOME, P.RAZAOSOCIAL))) AS NOMEBENEF, ');
      Append(' RTRIM(P.NUMDOCUMENTO) AS CGCBENEF, XB.TIPOREG, E.NUMDOCUMENTO AS CGCEMPRE, ');
      Append(' (DECODE(E.RAZAOSOCIAL, '''', E.NOME, E.RAZAOSOCIAL)) AS NOMEEMPRE, ');
      Append(' RTRIM(XB.CODNATUREZA) AS CODNATUREZA, ');
      Append(' NVL(TRUNC(DECODE(SIGN(XB.JAN1), -1, 0, XB.JAN1 * 100)), 0) AS JAN1, ');
      Append(' NVL(TRUNC(XB.JAN2 * 100), 0) AS JAN2, ');
      Append(' NVL(TRUNC(DECODE(SIGN(XB.JAN3), -1, 0, XB.JAN3 * 100)), 0) AS JAN3, ');
      Append(' NVL(TRUNC(DECODE(SIGN(XB.FEV1), -1, 0, XB.FEV1 * 100)), 0) AS FEV1, ');
      Append(' NVL(TRUNC(XB.FEV2 * 100), 0) AS FEV2, ');
      Append(' NVL(TRUNC(DECODE(SIGN(XB.FEV3), -1, 0, XB.FEV3 * 100)), 0) AS FEV3, ');
      Append(' NVL(TRUNC(DECODE(SIGN(XB.MAR1), -1, 0, XB.MAR1 * 100)), 0) AS MAR1, ');
      Append(' NVL(TRUNC(XB.MAR2 * 100), 0) AS MAR2, ');
      Append(' NVL(TRUNC(DECODE(SIGN(XB.MAR3), -1, 0, XB.MAR3 * 100)), 0) AS MAR3, ');
      Append(' NVL(TRUNC(DECODE(SIGN(XB.ABR1), -1, 0, XB.ABR1 * 100)), 0) AS ABR1, ');
      Append(' NVL(TRUNC(XB.ABR2 * 100), 0) AS ABR2, ');
      Append(' NVL(TRUNC(DECODE(SIGN(XB.ABR3), -1, 0, XB.ABR3 * 100)), 0) AS ABR3, ');
      Append(' NVL(TRUNC(DECODE(SIGN(XB.MAI1), -1, 0, XB.MAI1 * 100)), 0) AS MAI1, ');
      Append(' NVL(TRUNC(XB.MAI2 * 100), 0) AS MAI2, ');
      Append(' NVL(TRUNC(DECODE(SIGN(XB.MAI3), -1, 0, XB.MAI3 * 100)), 0) AS MAI3, ');
      Append(' NVL(TRUNC(DECODE(SIGN(XB.JUN1), -1, 0, XB.JUN1 * 100)), 0) AS JUN1, ');
      Append(' NVL(TRUNC(XB.JUN2 * 100), 0) AS JUN2, ');
      Append(' NVL(TRUNC(DECODE(SIGN(XB.JUN3), -1, 0, XB.JUN3 * 100)), 0) AS JUN3, ');
      Append(' NVL(TRUNC(DECODE(SIGN(XB.JUL1), -1, 0, XB.JUL1 * 100)), 0) AS JUL1, ');
      Append(' NVL(TRUNC(XB.JUL2 * 100), 0) AS JUL2, ');
      Append(' NVL(TRUNC(DECODE(SIGN(XB.JUL3), -1, 0, XB.JUL3 * 100)), 0) AS JUL3, ');
      Append(' NVL(TRUNC(DECODE(SIGN(XB.AGO1), -1, 0, XB.AGO1 * 100)), 0) AS AGO1, ');
      Append(' NVL(TRUNC(XB.AGO2 * 100), 0) AS AGO2, ');
      Append(' NVL(TRUNC(DECODE(SIGN(XB.AGO3), -1, 0, XB.AGO3 * 100)), 0) AS AGO3, ');
      Append(' NVL(TRUNC(DECODE(SIGN(XB.SET1), -1, 0, XB.SET1 * 100)), 0) AS SET1, ');
      Append(' NVL(TRUNC(XB.SET2 * 100), 0) AS SET2, ');
      Append(' NVL(TRUNC(DECODE(SIGN(XB.SET3), -1, 0, XB.SET3 * 100)), 0) AS SET3, ');
      Append(' NVL(TRUNC(DECODE(SIGN(XB.OUT1), -1, 0, XB.OUT1 * 100)), 0) AS OUT1, ');
      Append(' NVL(TRUNC(XB.OUT2 * 100), 0) AS OUT2, ');
      Append(' NVL(TRUNC(DECODE(SIGN(XB.OUT3), -1, 0, XB.OUT3 * 100)), 0) AS OUT3, ');
      Append(' NVL(TRUNC(DECODE(SIGN(XB.NOV1), -1, 0, XB.NOV1 * 100)), 0) AS NOV1, ');
      Append(' NVL(TRUNC(XB.NOV2 * 100), 0) AS NOV2, ');
      Append(' NVL(TRUNC(DECODE(SIGN(XB.NOV3), -1, 0, XB.NOV3 * 100)), 0) AS NOV3, ');
      Append(' NVL(TRUNC(DECODE(SIGN(XB.DEZ1), -1, 0, XB.DEZ1 * 100)), 0) AS DEZ1, ');
      Append(' NVL(TRUNC(XB.DEZ2 * 100), 0) AS DEZ2, ');
      Append(' NVL(TRUNC(DECODE(SIGN(XB.DEZ3), -1, 0, XB.DEZ3 * 100)), 0) AS DEZ3, ');
      Append(' NVL(TRUNC(DECODE(SIGN(XB.VLR131), -1, 0, XB.VLR131 * 100)), 0) AS VLR131, ');
      Append(' NVL(TRUNC(DECODE(SIGN(XB.VLR132), -1, 0, XB.VLR132 * 100)), 0) AS VLR132, ');
      Append(' NVL(TRUNC(DECODE(SIGN(XB.VLR133), -1, 0, XB.VLR133 * 100)), 0) AS VLR133 ');
      Append(' FROM ( ');
      Append(' SELECT /*+ INDEX (LI XIE1LANCXINFORME) USE_NL(LI , L) */ ');
      Append(' P.NOME, P.NUMDOCUMENTO, ''0'' AS TIPOREG, ');

      // Felipe A. Santos SOL 223584 KTN 2057497
      //Append(' DECODE(L.CODNATUREZA, ''7416'', ''0561'', ''7431'', ''0561'', L.CODNATUREZA) AS CODNATUREZA, ');
      Append(' case ');
      Append('  when TO_CHAR(L.datapagamento,''YYYYMM'') <= ''201301'' then ');
      Append('       DECODE(L.CODNATUREZA,''7416'',''0561'', ''7431'',''0561'', L.CODNATUREZA) ');
      Append('  else ');
      Append('        DECODE(L.CODNATUREZA,''7416'',''3540'', ''7431'',''3540'', L.CODNATUREZA) ');
      Append(' end  CODNATUREZA, ');
      // Felipe A. Santos SOL 223584 KTN 2057497

      Append(' SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''), ''01'', ');
      Append(' NVL(DECODE(I.CODDIRF, ''2'', DECODE(I.FLGNATUREZA, ''N'', LI.VLRLANC * -1, LI.VLRLANC), ');
      Append(' ''''), l.vlrbase), 0)) AS JAN1, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''), ''02'', ');
      Append(' NVL(DECODE(I.CODDIRF, ''2'', DECODE(I.FLGNATUREZA, ''N'', LI.VLRLANC * -1, LI.VLRLANC), ');
      Append(' ''''), l.vlrbase), 0)) AS FEV1, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''), ''03'', ');
      Append(' NVL(DECODE(I.CODDIRF, ''2'', DECODE(I.FLGNATUREZA, ''N'', LI.VLRLANC * -1, LI.VLRLANC), ');
      Append(' ''''), l.vlrbase), 0)) AS MAR1, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''), ''04'', ');
      Append(' NVL(DECODE(I.CODDIRF, ''2'', DECODE(I.FLGNATUREZA, ''N'', LI.VLRLANC * -1, LI.VLRLANC), ');
      Append(' ''''), l.vlrbase), 0)) AS ABR1, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''), ''05'', ');
      Append(' NVL(DECODE(I.CODDIRF, ''2'', DECODE(I.FLGNATUREZA, ''N'', LI.VLRLANC * -1, LI.VLRLANC), ');
      Append(' ''''), l.vlrbase), 0)) AS MAI1, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''), ''06'', ');
      Append(' NVL(DECODE(I.CODDIRF, ''2'', DECODE(I.FLGNATUREZA, ''N'', LI.VLRLANC * -1, LI.VLRLANC), ');
      Append(' ''''), l.vlrbase), 0)) AS JUN1, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''), ''07'', ');
      Append(' NVL(DECODE(I.CODDIRF, ''2'', DECODE(I.FLGNATUREZA, ''N'', LI.VLRLANC * -1, LI.VLRLANC), ');
      Append(' ''''), l.vlrbase), 0)) AS JUL1, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''), ''08'', ');
      Append(' NVL(DECODE(I.CODDIRF, ''2'', DECODE(I.FLGNATUREZA, ''N'', LI.VLRLANC * -1, LI.VLRLANC), ');
      Append(' ''''), l.vlrbase), 0)) AS AGO1, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''), ''09'', ');
      Append(' NVL(DECODE(I.CODDIRF, ''2'', DECODE(I.FLGNATUREZA, ''N'', LI.VLRLANC * -1, LI.VLRLANC), ');
      Append(' ''''), l.vlrbase), 0)) AS SET1, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''), ''10'', ');
      Append(' NVL(DECODE(I.CODDIRF, ''2'', DECODE(I.FLGNATUREZA, ''N'', LI.VLRLANC * -1, LI.VLRLANC), ');
      Append(' ''''), l.vlrbase), 0)) AS OUT1, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''), ''11'', ');
      Append(' NVL(DECODE(I.CODDIRF, ''2'', DECODE(I.FLGNATUREZA, ''N'', LI.VLRLANC * -1, LI.VLRLANC), ');
      Append(' ''''), l.vlrbase), 0)) AS NOV1, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''), ''12'', ');
      Append(' NVL(DECODE(I.CODDIRF, ''2'', DECODE(I.FLGNATUREZA, ''N'', LI.VLRLANC * -1, LI.VLRLANC), ');
      Append(' ''''), l.vlrbase), 0)) AS DEZ1, ');
      // Thiago Melo SOL 217776 Kintana 2047946
 {     Append(' SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''), ''01'', ');
      Append(' NVL(DECODE(I.CODDIRF, ''3'', LI.VLRLANC, ''''), l.vlrirrf), 0)) AS JAN2, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''), ''02'', ');
      Append(' NVL(DECODE(I.CODDIRF, ''3'', LI.VLRLANC, ''''), l.vlrirrf), 0)) AS FEV2, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''), ''03'', ');
      Append(' NVL(DECODE(I.CODDIRF, ''3'', LI.VLRLANC, ''''), l.vlrirrf), 0)) AS MAR2, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''), ''04'', ');
      Append(' NVL(DECODE(I.CODDIRF, ''3'', LI.VLRLANC, ''''), l.vlrirrf), 0)) AS ABR2, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''), ''05'', ');
      Append(' NVL(DECODE(I.CODDIRF, ''3'', LI.VLRLANC, ''''), l.vlrirrf), 0)) AS MAI2, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''), ''06'', ');
      Append(' NVL(DECODE(I.CODDIRF, ''3'', LI.VLRLANC, ''''), l.vlrirrf), 0)) AS JUN2, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''), ''07'', ');
      Append(' NVL(DECODE(I.CODDIRF, ''3'', LI.VLRLANC, ''''), l.vlrirrf), 0)) AS JUL2, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''), ''08'', ');
      Append(' NVL(DECODE(I.CODDIRF, ''3'', LI.VLRLANC, ''''), l.vlrirrf), 0)) AS AGO2, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''), ''09'', ');
      Append(' NVL(DECODE(I.CODDIRF, ''3'', LI.VLRLANC, ''''), l.vlrirrf), 0)) AS SET2, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''), ''10'', ');
      Append(' NVL(DECODE(I.CODDIRF, ''3'', LI.VLRLANC, ''''), l.vlrirrf), 0)) AS OUT2, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''), ''11'', ');
      Append(' NVL(DECODE(I.CODDIRF, ''3'', LI.VLRLANC, ''''), l.vlrirrf), 0)) AS NOV2, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento, ''MM''), ''12'', ');
      Append(' NVL(DECODE(I.CODDIRF, ''3'', LI.VLRLANC, ''''), l.vlrirrf), 0)) AS DEZ2, ');   }

      Append('SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(L.CODNATUREZA,''5952'', L.VLRCSCOFPIS,NVL(DECODE(I.CODDIRF, ''3'', LI.VLRLANC, ''''), l.vlrirrf)), 0)) AS JAN2,');
      Append('SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(L.CODNATUREZA,''5952'', L.VLRCSCOFPIS,NVL(DECODE(I.CODDIRF, ''3'', LI.VLRLANC, ''''), l.vlrirrf)), 0)) AS FEV2,');
      Append('SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(L.CODNATUREZA,''5952'', L.VLRCSCOFPIS,NVL(DECODE(I.CODDIRF, ''3'', LI.VLRLANC, ''''), l.vlrirrf)), 0)) AS MAR2,');
      Append('SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(L.CODNATUREZA,''5952'', L.VLRCSCOFPIS,NVL(DECODE(I.CODDIRF, ''3'', LI.VLRLANC, ''''), l.vlrirrf)), 0)) AS ABR2,');
      Append('SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(L.CODNATUREZA,''5952'', L.VLRCSCOFPIS,NVL(DECODE(I.CODDIRF, ''3'', LI.VLRLANC, ''''), l.vlrirrf)), 0)) AS MAI2,');
      Append('SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(L.CODNATUREZA,''5952'', L.VLRCSCOFPIS,NVL(DECODE(I.CODDIRF, ''3'', LI.VLRLANC, ''''), l.vlrirrf)), 0)) AS JUN2,');
      Append('SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(L.CODNATUREZA,''5952'', L.VLRCSCOFPIS,NVL(DECODE(I.CODDIRF, ''3'', LI.VLRLANC, ''''), l.vlrirrf)), 0)) AS JUL2,');
      Append('SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(L.CODNATUREZA,''5952'', L.VLRCSCOFPIS,NVL(DECODE(I.CODDIRF, ''3'', LI.VLRLANC, ''''), l.vlrirrf)), 0)) AS AGO2,');
      Append('SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(L.CODNATUREZA,''5952'', L.VLRCSCOFPIS,NVL(DECODE(I.CODDIRF, ''3'', LI.VLRLANC, ''''), l.vlrirrf)), 0)) AS SET2,');
      Append('SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(L.CODNATUREZA,''5952'', L.VLRCSCOFPIS,NVL(DECODE(I.CODDIRF, ''3'', LI.VLRLANC, ''''), l.vlrirrf)), 0)) AS OUT2,');
      Append('SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(L.CODNATUREZA,''5952'', L.VLRCSCOFPIS,NVL(DECODE(I.CODDIRF, ''3'', LI.VLRLANC, ''''), l.vlrirrf)), 0)) AS NOV2,');
      Append('SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(L.CODNATUREZA,''5952'', L.VLRCSCOFPIS,NVL(DECODE(I.CODDIRF, ''3'', LI.VLRLANC, ''''), l.vlrirrf)), 0)) AS DEZ2,');
      // Thiago Melo SOL 217776 Kintana 2047946

      Append(' 0 AS JAN3, 0 AS FEV3, 0 AS MAR3, 0 AS ABR3, 0 AS MAI3, 0 AS JUN3, ');
      Append(' 0 AS JUL3, 0 AS AGO3, 0 AS SET3, 0 AS OUT3, 0 AS NOV3, 0 AS DEZ3, ');
      Append(' SUM(DECODE(I.CODDIRF, ''5'', DECODE(I.FLGNATUREZA, ''N'', LI.VLRLANC * -1, LI.VLRLANC), ');
      Append(' 0)) AS VLR131, ');
      //Marcio Sanches Spinosa SOL 226003 KINTANA 2060052 - Inicio
 //     Append(' SUM(DECODE(I.CODDIRF, ''7'', DECODE(L.CODNATUREZA, ''5565'', 0, ''3223'', 0, ''3556'',0, ''3579'',0, LI.VLRLANC), ');//Marcio Sanches Spinosa SOL 223465 KINTANA 2058652
      Append(' SUM(DECODE(I.CODDIRF, ''7'', DECODE(L.CODNATUREZA, ''5565'', LI.VLRLANC, ''3223'', 0, ''3556'',0, ''3579'',LI.VLRLANC, LI.VLRLANC), '); //Marcio Sanches Spinosa SOL 223465 KINTANA 2058652
      //Marcio Sanches Spinosa SOL 226003 KINTANA 2060052 - Fim
      Append(' 0)) AS VLR132, ');
      Append(' 0 AS VLR133 ');
      Append(' FROM LANCIRRF L ');
      Append(' LEFT JOIN LANCXINFORME LI   ON (LI.IDLANCIRRF = L.IDLANCIRRF) ');
      Append(' LEFT JOIN INFORME I ON (I.IDINFORME = LI.IDINFORME) ');
      Append(' INNER JOIN NATURENDIMENTO N ON (L.CODNATUREZA = N.CODNATUREZA) ');
      Append(' INNER JOIN PESSOA P ON (P.IDPESSOA = L.IDBENEFIRRF) ');
      Append(' WHERE (N.FLGUSADONADIRF = ''S'') ');
      Append(' AND (NVL(L.IDMODULORESPON, L.IDMODULO) = 3) ');
      Append('AND (L.datapagamento BETWEEN TO_DATE(' + quotedStr(DataIni) + ',''DD/MM/YYYY'') AND TO_DATE(' + quotedStr(DataFim) + ',''DD/MM/YYYY''))          ');

      // Felipe A. Santos SOL 223584 KTN 2057497
      //Append(' GROUP BY P.NOME, P.NUMDOCUMENTO, DECODE(L.CODNATUREZA, ');
      //Append(' ''7416'', ''0561'', ''7431'', ''0561'', L.CODNATUREZA), ''0'' ');
      Append(' GROUP BY P.NOME, P.NUMDOCUMENTO, L.DATAPAGAMENTO, L.CODNATUREZA, ''0'' ');
      // Felipe A. Santos SOL 223584 KTN 2057497 - fim

      Append(' ) XB, PESSOA P,PESSOA E ');
      Append(' WHERE  (XB.NUMDOCUMENTO = P.NUMDOCUMENTO) ');

      // Thiago SOL 217776 Kintana 2047946
      If sCPFFIltro <> '' Then Begin
          Append(' AND (P.NUMDOCUMENTO IN (' + sCPFFiltro + '))');
        End;
      // Thiago SOL 217776 Kintana 2047946

      Append(' AND  (XB.NOME = P.NOME) AND (XB.NUMDOCUMENTO IS NOT NULL AND XB.NUMDOCUMENTO <> ''00000000000'') ');
      Append(' AND  (E.IDPESSOA = 1) AND CODNATUREZA NOT IN (''9999'',''1889'') ');
      Append(' ORDER BY CODNATUREZA, P.TIPO, CGCBENEF, NOMEBENEF, XB.TIPOREG ) P ');
      Append(' GROUP BY CGCBENEF, TIPO, TIPOREG, CGCEMPRE, NOMEEMPRE, ');
      Append({' decode(CODNATUREZA, ''3533'', ''0561'', ''3540'', ''0561'', }' CODNATUREZA '); // Felipe A. Santos SOL 223584 KTN 2057497
      Append(' ORDER BY CODNATUREZA, CGCBENEF, TIPO, TIPOREG ');
    End;

  sSql.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\QueryDirf2011CAP.txt');
  Result := GetDataPacket(Ssql);

End;
//Marcio Sanches Spinosa SOL 216222 KINTANA 2045931 - Fim

//Darivaldo Alencar SIG 34429 -inicio
function TCtrlGeraDirfNova.InfoPcPA(sCpf, sIdentificador,sNatureza: String): String;
var
  sTexto:array [1..2] of String;
  CdsInfo: TClientDataSet;
  sCPFAlimentado: String;
  bGravar: boolean;
  sSQL: TStringList;
begin
  try
      CdsInfo:= TClientDataSet.Create(nil);
      sTexto[1]:= 'SELECT TIPO,' + #13#10 +
      '       CGCBENEF,' + #13#10 +
      '       NOMEBENEF,' + #13#10 +
      '       ''1'' AS TIPOREG,' + #13#10 +
      '       CGCALIMEN,' + #13#10 +
      '       NOMEALIMEN,' + #13#10 +
      '       DATANASCALIMEN, ' + #13#10 +//Cássio Rovaroto -  SIG nº 82239
      //'       CODNATUREZA,' + #13#10 + //SIG85183.92415
      '       ''10'' AS TIPODEPEN,' + #13#10 +
      //edilaine - SIG41234: inicio (substituido 20 por 1 no DECODE(CODDIRF, 20...
      '       SUM(DECODE(CODDIRF, 1, DECODE(MES, ''01'', VLRLANC, 0),0)) AS JAN1,' + #13#10 +
      '       SUM(DECODE(CODDIRF, 1, DECODE(MES, ''02'', VLRLANC, 0),0)) AS FEV1,' + #13#10 +
      '       SUM(DECODE(CODDIRF, 1, DECODE(MES, ''03'', VLRLANC, 0),0)) AS MAR1,' + #13#10 +
      '       SUM(DECODE(CODDIRF, 1, DECODE(MES, ''04'', VLRLANC, 0),0)) AS ABR1,' + #13#10 +
      '       SUM(DECODE(CODDIRF, 1, DECODE(MES, ''05'', VLRLANC, 0),0)) AS MAI1,' + #13#10 +
      '       SUM(DECODE(CODDIRF, 1, DECODE(MES, ''06'', VLRLANC, 0),0)) AS JUN1,' + #13#10 +
      '       SUM(DECODE(CODDIRF, 1, DECODE(MES, ''07'', VLRLANC, 0),0)) AS JUL1,' + #13#10 +
      '       SUM(DECODE(CODDIRF, 1, DECODE(MES, ''08'', VLRLANC, 0),0)) AS AGO1,' + #13#10 +
      '       SUM(DECODE(CODDIRF, 1, DECODE(MES, ''09'', VLRLANC, 0),0)) AS SET1,' + #13#10 +
      '       SUM(DECODE(CODDIRF, 1, DECODE(MES, ''10'', VLRLANC, 0),0)) AS OUT1,' + #13#10 +
      '       SUM(DECODE(CODDIRF, 1, DECODE(MES, ''11'', VLRLANC, 0),0)) AS NOV1,' + #13#10 +
      '       SUM(DECODE(CODDIRF, 1, DECODE(MES, ''12'', VLRLANC, 0),0)) AS DEZ1,' + #13#10 +
      '       SUM(DECODE(CODDIRF, 98, VLRLANC,0)) AS VLR131' + #13#10 +
      '  FROM (--consulta a '+ #13#10 +
      //edilaine - SIG41234: fim
      '        SELECT distinct PT.TIPO AS TIPO,' + #13#10 +        //edilaine - SIG40992
      '               PT.NUMDOCUMENTO AS CGCBENEF,' + #13#10 +
      '               PT.NOME AS NOMEBENEF,' + #13#10 +
      '               PA.NUMDOCUMENTO AS CGCALIMEN,' + #13#10 +
      '               PA.NOME AS NOMEALIMEN,' + #13#10 +
      '               PFA.DATANASC AS DATANASCALIMEN, ' + #13#10 +//Cássio Rovaroto - SIG nº 82239
      '               L.CODNATUREZA,' + #13#10 +
      '               TO_CHAR(L.DATAPAGAMENTO, ''MM'') AS MES,' + #13#10 +
      '               LI.VLRLANC,' + #13#10 +
      //'             I.CODDIRF' + #13#10 +           //edilaine - SIG41234
      //'               1 AS CODDIRF' + #13#10 +        //edilaine - SIG41234   // Andre Imakawa - SIG 62962
      '             I.CODDIRF' + #13#10 +                                       // Andre Imakawa - SIG 62962
      '          FROM HISTRUBSAL H' + #13#10 +
      //Andre Imakawa - SIG 40287 - Inicio
      //'          JOIN INFORME I ON I.IDINFORME = H.IDINFORME AND I.CODDIRF = 20' + #13#10 +
     // '          JOIN INFORME I ON I.IDINFORME = H.IDINFORME ' + #13#10 +     // Andre Imakawa - SIG 62962
      //Andre Imakawa - SIG 40287 - Fim
      '          JOIN LANCIRRF L ON H.IDFAVORECIDO = L.IDBENEFIRRF' + #13#10 +
      '           AND H.IDHSTFOLHABENEF = L.IDHSTFOLHABENEF' + #13#10 +
      '           AND L.DATAPAGAMENTO = H.DATAPAGAMENTO' + #13#10 +
      '           AND L.CODNATUREZA = H.CODIRRFDARF' + #13#10 +
      '          JOIN LANCXINFORME LI' + #13#10 +
      '            ON LI.IDLANCIRRF = L.IDLANCIRRF' + #13#10 +
      //'           AND LI.IDINFORME <> 98' + #13#10 +                     //edilaine - SIG40992
      '           AND LI.IDINFORME = 97' + #13#10 +                        //edilaine - SIG40992
      '          JOIN INFORME I ON I.IDINFORME = LI.IDINFORME '+ #13#10 +       // Andre Imakawa - SIG 62962
      '          JOIN PESSOA PT' + #13#10 +
      //Andre Imakawa - SIG 40287 - Inicio
      //'            ON PT.IDPESSOA = H.IDTITULAR' + #13#10 +
      '            ON PT.IDPESSOA = H.IDPESSOA' + #13#10 +
      //Andre Imakawa - SIG 40287 - Fim
      '          JOIN PESSOA PA' + #13#10 +
      '            ON PA.IDPESSOA = H.IDFAVORECIDO' + #13#10 +
      //Cássio Rovaroto - SIG nº 82239 - Início
      '          JOIN PESSOAFISICA PFA     ' + #13#10 +
      '            ON PFA.IDPESSOA = PA.IDPESSOA ' + #13#10 +
      //Cássio Rovaroto - SIG nº 82239 - Fim
      //Andre Imakawa - SIG 40287 - Inicio
      //'         WHERE H.IDTITULAR IN (SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO = '+ QuotedStr(sCpf) +')' + #13#10 +
      '         WHERE H.IDPESSOA IN (SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO = '+ QuotedStr(sCpf) +')' + #13#10 +
      //Andre Imakawa - SIG 40287 - Fim
      '           AND H.DATAPAGAMENTO BETWEEN TO_DATE('+QuotedStr(sDataIni)+', ''DD/MM/YYYY'') AND' + #13#10 +
      '               TO_DATE('+QuotedStr(sDataFim)+', ''DD/MM/YYYY'')' + #13#10 +
      '        UNION ALL' + #13#10 +
      '        --consulta b '+ #13#10 +            //edilaine - SIG41234
      '        SELECT distinct PT.TIPO AS TIPO,   ' + #13#10 +             //edilaine - SIG40992
      '               PT.NUMDOCUMENTO AS CGCBENEF,' + #13#10 +
      '               PT.NOME AS NOMEBENEF,' + #13#10 +
      '               PA.NUMDOCUMENTO AS CGCALIMEN,' + #13#10 +
      '               PA.NOME AS NOMEALIMEN,' + #13#10 +
      '               PFA.DATANASC AS DATANASCALIMEN, ' + #13#10 + //Cássio Rovaroto - SIG nº 82239
      '               L.CODNATUREZA,' + #13#10 +
      '               TO_CHAR(L.DATAPAGAMENTO, ''MM'') AS MES,' + #13#10 +
      '               LI.VLRLANC,' + #13#10 +
      //Andre Imakawa - SIG 40287 - Inicio
      //'               I.IDINFORME AS CODDIRF' + #13#10 +
      //'               I.CODDIRF ' + #13#10 +
      '               DECODE(H.IDINFORME, 97, I.CODDIRF, 98) CODDIRF' + #13#10 +// Andre Imakawa - SIG 62962
      //Andre Imakawa - SIG 40287 - Fim
      '          FROM HISTRUBSAL H' + #13#10 +
      //'          JOIN INFORME I ON I.IDINFORME = H.IDINFORME AND I.IDINFORME = 98' + #13#10 +    // Andre Imakawa - SIG 62962
      //'          JOIN LANCIRRF L ON H.IDPESSOA = L.IDBENEFIRRF' + #13#10 +                       // Andre Imakawa - SIG 62962
      '          JOIN LANCIRRF L ON H.IDFAVORECIDO = L.IDBENEFIRRF' + #13#10 +                     // Andre Imakawa - SIG 62962
      '           AND H.IDHSTFOLHABENEF = L.IDHSTFOLHABENEF' + #13#10 +
      '           AND L.DATAPAGAMENTO =  H.DATAPAGAMENTO' + #13#10 +
      '           AND L.CODNATUREZA = H.CODIRRFDARF' + #13#10 +
      '          JOIN LANCXINFORME LI' + #13#10 +
      '            ON LI.IDLANCIRRF = L.IDLANCIRRF' + #13#10 +
      '           AND LI.IDINFORME = 98' + #13#10 +                                                // Andre Imakawa - SIG 62962
      //'           AND LI.IDINFORME = H.IDINFORME' + #13#10 +                                     // Andre Imakawa - SIG 62962
      '          JOIN INFORME I ON I.IDINFORME = LI.IDINFORME ' + #13#10 +                         // Andre Imakawa - SIG 62962
      '          JOIN PESSOA PT' + #13#10 +
      //Andre Imakawa - SIG 40287 - Inicio
      //'            ON PT.IDPESSOA = H.IDTITULAR' + #13#10 +
      '            ON PT.IDPESSOA = H.IDPESSOA' + #13#10 +
      //Andre Imakawa - SIG 40287 - Fim
      '          JOIN PESSOA PA' + #13#10 +
      //'            ON PA.IDPESSOA = H.IDPESSOA' + #13#10 +                                      // Andre Imakawa - SIG 62962
      '            ON PA.IDPESSOA = H.IDFAVORECIDO' + #13#10 +                                    // Andre Imakawa - SIG 62962
      //Cássio Rovaroto - SIG nº 82239 - Início
      '          JOIN PESSOAFISICA PFA     ' + #13#10 +
      '            ON PFA.IDPESSOA = PA.IDPESSOA ' + #13#10 +
      //Cássio Rovaroto - SIG nº 82239 - Fim
      //Andre Imakawa - SIG 40287 - Inicio
      //'         WHERE H.IDTITULAR IN (SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO = '+ QuotedStr(sCpf) +')' + #13#10 +
      '         WHERE H.IDPESSOA IN (SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO = '+ QuotedStr(sCpf) +')' + #13#10 +
      //Andre Imakawa - SIG 40287 - Fim
      '           AND H.DATAPAGAMENTO BETWEEN TO_DATE('+ QuotedStr(sDataIni) + ', ''DD/MM/YYYY'') AND' + #13#10 +
      '                                       TO_DATE('+QuotedStr(sDataFim)+', ''DD/MM/YYYY'')' + #13#10 +   //edilaine - SIG41234 - inicio
      '        UNION ALL ' + #13#10 +
      '        --consulta c ' + #13#10 +
      '        SELECT distinct PT.TIPO AS TIPO,       ' + #13#10 +
      '               PT.NUMDOCUMENTO AS CGCBENEF,    ' + #13#10 +
      '               PT.NOME AS NOMEBENEF,           ' + #13#10 +
      '               PA.NUMDOCUMENTO AS CGCALIMEN,   ' + #13#10 +
      '               PA.NOME AS NOMEALIMEN,          ' + #13#10 +
      '               PFA.DATANASC AS DATANASCALIMEN, ' + #13#10 + //Cássio Rovaroto - SIG nº 82239
      '               H.CODIRRFDARF CODNATUREZA,      ' + #13#10 +
      '               TO_CHAR(H.DATAPAGAMENTO, ''MM'') AS MES,     ' + #13#10 +
      '               H.VALORPROVENTO VLRLANC,                     ' + #13#10 +
      '               DECODE(H.IDINFORME,97,I.CODDIRF,98) CODDIRF  ' + #13#10 +
      '          FROM HISTRUBSAL H                                 ' + #13#10 +
      '          JOIN INFORME I ON I.IDINFORME = H.IDINFORME       ' + #13#10 +
      '          JOIN PESSOA PT                                    ' + #13#10 +
      '            ON PT.IDPESSOA = H.IDTITULAR                    ' + #13#10 +
      '          JOIN PESSOA PA                                    ' + #13#10 +
      '            ON PA.IDPESSOA = H.IDPESSOA                     ' + #13#10 +
      //Cássio Rovaroto - SIG nº 82239 - Início
      '          JOIN PESSOAFISICA PFA                             ' + #13#10 +
      '            ON PFA.IDPESSOA = PA.IDPESSOA                   ' + #13#10 +
      //Cássio Rovaroto - SIG nº 82239 - Fim
      '         WHERE H.IDPESSOA IN (SELECT DISTINCT IDFAVORECIDO  ' + #13#10 +
      '                              FROM   HISTRUBSAL HH          ' + #13#10 +
      //Andre Imakawa - SIG 40287 - Inicio
      //'                              WHERE  HH.IDTITULAR IN (SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO = '+ QuotedStr(sCpf) +')' + #13#10 +
      '                              WHERE  HH.IDPESSOA IN (SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO = '+ QuotedStr(sCpf) +')' + #13#10 +
      //Andre Imakawa - SIG 40287 - Fim
      '                              AND    HH.IDFAVORECIDO IS NOT NULL  ' + #13#10 +
      '                              AND    HH.DATAPAGAMENTO BETWEEN TO_DATE('+QuotedStr(sDataIni)+', ''DD/MM/YYYY'') AND' + #13#10 +
      '                                                              TO_DATE('+QuotedStr(sDataFim)+', ''DD/MM/YYYY'')' + #13#10 +
      '                              AND    HH.IDINFORME IN (SELECT IDINFORME FROM INFORME WHERE CODDIRF = 20)) ' + #13#10 +
      '           AND H.NUMDOCUMENTO IS NULL  ' + #13#10 +
      '           AND H.DATAPAGAMENTO BETWEEN TO_DATE('+QuotedStr(sDataIni)+', ''DD/MM/YYYY'') AND' + #13#10 +
      '                                       TO_DATE('+QuotedStr(sDataFim)+', ''DD/MM/YYYY'')' + #13#10 +
      //SIG85183.92415 - início
      '        UNION ALL                                                                     ' + #13#10 +
      '        --consulta d                                                                  ' + #13#10 +
      ' SELECT distinct PT.TIPO AS TIPO,                                                     ' + #13#10 +
      '        PT.NUMDOCUMENTO AS CGCBENEF,                                                  ' + #13#10 +
      '        PT.NOME AS NOMEBENEF,                                                         ' + #13#10 +
      '        PA.NUMDOCUMENTO AS CGCALIMEN,                                                 ' + #13#10 +
      '        PA.NOME AS NOMEALIMEN,                                                        ' + #13#10 +
      '        PFA.DATANASC AS DATANASCALIMEN,                                               ' + #13#10 +
      '        L.CODNATUREZA,                                                                ' + #13#10 +
      '        TO_CHAR(L.DATAPAGAMENTO, ''MM'') AS MES,                                        ' + #13#10 +
      '        LI.VLRLANC,                                                                   ' + #13#10 +
      '        DECODE(I.CODDIRF, 20, 1, 98) AS CODDIRF                                       ' + #13#10 +
      '   FROM HISTRUBSAL H                                                                  ' + #13#10 +
      '   JOIN LANCIRRF L ON H.IDFAVORECIDO = L.IDBENEFIRRF                                  ' + #13#10 +
      '    AND H.IDHSTFOLHABENEF = L.IDHSTFOLHABENEF                                         ' + #13#10 +
      '    AND L.DATAPAGAMENTO = H.DATAPAGAMENTO                                             ' + #13#10 +
      '   JOIN LANCXINFORME LI                                                               ' + #13#10 +
      '     ON LI.IDLANCIRRF = L.IDLANCIRRF                                                  ' + #13#10 +
      '    AND LI.IDINFORME IN (161,162)                                                     ' + #13#10 +
      '   JOIN INFORME I ON I.IDINFORME = LI.IDINFORME                                       ' + #13#10 +
      '   JOIN PESSOA PT                                                                     ' + #13#10 +
      '     ON PT.IDPESSOA = H.IDPESSOA                                                      ' + #13#10 +
      '   JOIN PESSOA PA                                                                     ' + #13#10 +
      '     ON PA.IDPESSOA = H.IDFAVORECIDO                                                  ' + #13#10 +
      '   JOIN PESSOAFISICA PFA                                                              ' + #13#10 +
      '     ON PFA.IDPESSOA = PA.IDPESSOA                                                    ' + #13#10 +
      '  WHERE H.IDPESSOA IN (SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO = '+ QuotedStr(sCpf) +')' + #13#10 +
      '    AND H.DATAPAGAMENTO BETWEEN TO_DATE('+QuotedStr(sDataIni)+', ''DD/MM/YYYY'') AND  ' + #13#10 +
      '        TO_DATE('+QuotedStr(sDataFim)+', ''DD/MM/YYYY'')                              ' + #13#10 +
      '    AND L.CODNATUREZA = 3533                                                          ' + #13#10 +
      //SIG85183.92415 - fim
      '       )' + #13#10 +
      //edilaine - SIG41234 - fim
      //'         WHERE CODNATUREZA = ' + sNatureza + #13#10 + //SIG85183.92415
      ' GROUP BY TIPO,' + #13#10 +
      '          CGCBENEF,' + #13#10 +
      '          NOMEBENEF,' + #13#10 +
      '          CGCALIMEN,' + #13#10 +
      '          NOMEALIMEN,' + #13#10 +
      '          DATANASCALIMEN ' + #13#10;//Cássio Rovaroto -  SIG nº 82239
      //'          CODNATUREZA'; //SIG85183.92415
    sSQL := TStringList.create;
    sSQL.text := sTexto[1];
    sSQL.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\BuscaRTPA.txt');
    CdsInfo.data:= GetDataPacket(sTexto[1]);
    sTexto[2]:= EmptyStr;
    while not(CdsInfo.eof) do
      begin
        bGravar:= (CdsInfo.fieldByname('JAN1').AsFloat +
                   CdsInfo.fieldByname('FEV1').AsFloat +
                   CdsInfo.fieldByname('MAR1').AsFloat +
                   CdsInfo.fieldByname('ABR1').AsFloat +
                   CdsInfo.fieldByname('MAI1').AsFloat +
                   CdsInfo.fieldByname('JUN1').AsFloat +
                   CdsInfo.fieldByname('JUL1').AsFloat +
                   CdsInfo.fieldByname('AGO1').AsFloat +
                   CdsInfo.fieldByname('SET1').AsFloat +
                   CdsInfo.fieldByname('OUT1').AsFloat +
                   CdsInfo.fieldByname('NOV1').AsFloat +
                   CdsInfo.fieldByname('DEZ1').AsFloat +
                   CdsInfo.fieldByname('VLR131').AsFloat) > 0;
        if (bGravar) then
           begin
              sTexto[2] :=  sTexto[2] + 'INFPA|' +
//Cássio Rovaroto - SIG nº 82239 - Início
//                           CompletaZero(CdsInfo.FieldByName('CGCALIMEN').AsString, 11) + '|'+
//                           Completa(EmptyStr,8) + '|'+
                           CompletaZero(CdsInfo.FieldByName('CGCALIMEN').AsString, 11) + '|';
              if CdsInfo.FieldByName('DATANASCALIMEN').IsNull then
                sTexto[2] := sTexto[2] + '|'
              else
                sTexto[2] := sTexto[2] + StringReplace(CdsInfo.FieldByName('DATANASCALIMEN').AsString, '/', '', [rfReplaceAll, rfIgnoreCase]) + '|';
              sTexto[2] := sTexto[2] +
//Cássio Rovaroto - SIG nº 82239 - Fim
                           Completa(CdsInfo.FieldByName('NOMEALIMEN').AsString,8) + '|' +
//Cássio Rovaroto - SIG nº 82239 - Início
                           //'10'+ '|' + #13#10;
                           CdsInfo.FieldByName('TIPODEPEN').AsString + '|' + #13#10;
//Cássio Rovaroto - SIG nº 82239 - Fim

              sTexto[2] := sTexto[2]  + sIdentificador  + '|' +
                           CompletaZero(StringReplace(FormatFloat('0.00',ajustaValor(CdsInfo.fieldByname('JAN1').AsFloat)), '.', '', [rfReplaceAll]), 13) + '|' +
                           CompletaZero(StringReplace(FormatFloat('0.00',ajustaValor(CdsInfo.fieldByname('FEV1').AsFloat)), '.', '', [rfReplaceAll]), 13) + '|' +
                           CompletaZero(StringReplace(FormatFloat('0.00',ajustaValor(CdsInfo.fieldByname('MAR1').AsFloat)), '.', '', [rfReplaceAll]), 13) + '|' +
                           CompletaZero(StringReplace(FormatFloat('0.00',ajustaValor(CdsInfo.fieldByname('ABR1').AsFloat)), '.', '', [rfReplaceAll]), 13) + '|' +
                           CompletaZero(StringReplace(FormatFloat('0.00',ajustaValor(CdsInfo.fieldByname('MAI1').AsFloat)), '.', '', [rfReplaceAll]), 13) + '|' +
                           CompletaZero(StringReplace(FormatFloat('0.00',ajustaValor(CdsInfo.fieldByname('JUN1').AsFloat)), '.', '', [rfReplaceAll]), 13) + '|' +
                           CompletaZero(StringReplace(FormatFloat('0.00',ajustaValor(CdsInfo.fieldByname('JUL1').AsFloat)), '.', '', [rfReplaceAll]), 13) + '|' +
                           CompletaZero(StringReplace(FormatFloat('0.00',ajustaValor(CdsInfo.fieldByname('AGO1').AsFloat)), '.', '', [rfReplaceAll]), 13) + '|' +
                           CompletaZero(StringReplace(FormatFloat('0.00',ajustaValor(CdsInfo.fieldByname('SET1').AsFloat)), '.', '', [rfReplaceAll]), 13) + '|' +
                           CompletaZero(StringReplace(FormatFloat('0.00',ajustaValor(CdsInfo.fieldByname('OUT1').AsFloat)), '.', '', [rfReplaceAll]), 13) + '|' +
                           CompletaZero(StringReplace(FormatFloat('0.00',ajustaValor(CdsInfo.fieldByname('NOV1').AsFloat)), '.', '', [rfReplaceAll]), 13) + '|' +
                           CompletaZero(StringReplace(FormatFloat('0.00',ajustaValor(CdsInfo.fieldByname('DEZ1').AsFloat)), '.', '', [rfReplaceAll]), 13) + '|' +
                           CompletaZero(StringReplace(FormatFloat('0.00',ajustaValor(CdsInfo.fieldByname('VLR131').AsFloat)),'.', '',[rfReplaceAll]), 13) + '|';
           end;
        CdsInfo.next;
         if not(CdsInfo.eof) then
            sTexto[2]:= sTexto[2] +  #13#10;
      end;
    result:= sTexto[2];
  finally
     FreeAndNil(CdsInfo);
  end
end;
//Darivaldo Alencar SIG 34429 -fim


//Darivaldo Alencar SIG 28411 -inicio
function TCtrlGeraDirfNova.ListGeraDirfFUNCEFEst(
  DataIni, DataFim, sCPFFiltro: String): OleVariant;
var sSQL: TStringList;
begin
    sSQL:= TStringList.Create;
    sSql.Clear;                      //Arnaldo - WO13395
	//Taffarel - SIG64008 - Início
//    sSQL.Append('SELECT PP.NUMDOCUMENTO AS CGCEMPRE,' + #13#10 +
//                '       PP.RAZAOSOCIAL AS NOMEEMPRE,' + #13#10 +
//                '       P.IDPESSOA,' + #13#10 +
//                '       DECODE(P.TIPO, ''F'', 1, 2) AS BENEFICIARIO,' + #13#10 +
//                '       PA.CODRECEITAFEDERAL AS IDPAIS,' + #13#10 +
//                '       '' '' AS NIF,' + #13#10 +
//                //'       ''S'' AS BENEF_DISPENSA_NIF,' + #13#10 +
//                //'       DECODE(PA.IDPAIS, 2, ''N'', ''S'') AS PAIS_DISPENSA_NIF,' + #13#10 +
//                '       ''N'' AS BENEF_DISPENSA_NIF,' + #13#10 +
//                '       ''S'' AS PAIS_DISPENSA_NIF,' + #13#10 +
//                '       P.NUMDOCUMENTO AS CGCBENEF,' + #13#10 +
//                '       SUBSTR(P.RAZAOSOCIAL, 1, 150) AS NOME,' + #13#10 +
//                '       DECODE(P.TIPO, ''J'', LPAD(LI.FONTEPAGADORA, 3, ''0''), NULL) AS FONTEPAGADORA,' + #13#10 +
//                '       SUBSTR(E.LOGRADOURO, 1, 60) AS LOGRADOURO,' + #13#10 +
//                '       E.NUMERO,' + #13#10 +
//                '       E.COMPLEMENTO,' + #13#10 +
//                '       SUBSTR(E.BAIRRO, 1, 20) AS BAIRRO,' + #13#10 +
//                '       E.CEP,' + #13#10 +
//                '       UPPER(SUBSTR(CD.NOME, 1, 40)) AS CIDADE,' + #13#10 +
//                '       TRANSLATE(SUBSTR(UPPER(ED.NOMEESTADO), 1, 40),' + #13#10 +
//                '                 ''ÁÇÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕËÜ'',' + #13#10 +
//                '                 ''ACEIOUAEIOUAEIOUAOEU'') AS ESTADO,' + #13#10 +
//                '       SUBSTR(TRIM(T.DDD) || T.NUMERO, 1, 15) AS TELEFONE,' + #13#10 +
//                '       L.DATAPAGAMENTO AS DATA_PAGAMENTO,' + #13#10 +
//                '       L.CODNATUREZA,' + #13#10 +
//                '       300 AS TIPO_RENDIMENTO,' + #13#10 +
//                '       L.VLRBASE AS RENDDIMENTO_PAGO,' + #13#10 +
//                '       L.VLRIRRF AS IMPOSTO_RETIDO,' + #13#10 +
//                '       10 AS FORMA_TRIBUTACAO' + #13#10 +
//                '  FROM LANCIRRF L' + #13#10 +
//                ' INNER JOIN LANCXINFORME LI' + #13#10 +
//                '    ON LI.IDLANCIRRF = L.IDLANCIRRF' + #13#10 +
//                ' INNER JOIN PESSOA P' + #13#10 +
//                '    ON P.IDPESSOA = L.IDBENEFIRRF' + #13#10 +
//                ' INNER JOIN PESSOA PP' + #13#10 +
//                '    ON PP.IDPESSOA = L.IDPESSOA' + #13#10 +
//                ' INNER JOIN ENDPESS E' + #13#10 +
//                '    ON E.IDPESSOA = P.IDPESSOA' + #13#10 +
//                '   AND E.IDENDERECO = P.IDENDRESIDENCIAL' + #13#10 +
//                '  LEFT JOIN CIDADES CD' + #13#10 +
//                '    ON CD.IDCIDADES = E.IDCIDADES' + #13#10 +
//                ' INNER JOIN ESTADO ED' + #13#10 +
//                '    ON ED.IDESTADO = CD.IDESTADO' + #13#10 +
//                ' INNER JOIN PAIS PA' + #13#10 +
//                '    ON PA.IDPAIS = ED.IDPAIS' + #13#10 +
//                '  LEFT JOIN TELENDPESS T' + #13#10 +
//                '    ON P.IDPESSOA = T.IDPESSOA' + #13#10 +
//                '   AND T.TIPO = ''P'''+ #13#10 +
//                ' WHERE L.DATAPAGAMENTO BETWEEN TO_DATE(' + quotedStr(DataIni) + ',' + quotedStr('DD/MM/YYYY')+ ') ' + #13#10+
//                '                            AND TO_DATE(' + quotedStr(DataFim) + ',' + quotedStr('DD/MM/YYYY')+ ')'
//                 );
//
//    if (sCPFFiltro<> EmptyStr) then
//        sSQL.Append(' AND P.NUMDOCUMENTO IN(' + sCPFFiltro +')');
//
//        sSQL.Append('   AND L.CODNATUREZA IN (9466, 0473)' + #13#10 +
//                    ' AND L.VLRIRRF <> 0' + #13#10 +
//                    ' GROUP BY P.TIPO,' + #13#10 +
//                    '          PA.CODRECEITAFEDERAL,' + #13#10 +
//                    '          PA.IDPAIS,' + #13#10 +
//                    '          P.NUMDOCUMENTO,' + #13#10 +
//                    '          P.RAZAOSOCIAL,' + #13#10 +
//                    '          LI.FONTEPAGADORA,' + #13#10 +
//                    '          E.LOGRADOURO,' + #13#10 +
//                    '          E.NUMERO,' + #13#10 +
//                    '          E.COMPLEMENTO,' + #13#10 +
//                    '          E.BAIRRO,' + #13#10 +
//                    '          E.CEP,' + #13#10 +
//                    '          CD.NOME,' + #13#10 +
//                    '          ED.NOMEESTADO,' + #13#10 +
//                    '          TRIM(T.DDD) || T.NUMERO,' + #13#10 +
//                    '          L.DATAPAGAMENTO,' + #13#10 +
//                    '          L.CODNATUREZA,' + #13#10 +
//                    '          L.VLRBASE,' + #13#10 +
//                    '          L.VLRIRRF,' + #13#10 +
//                    '          P.IDPESSOA,' + #13#10 +
//                    '          PP.NUMDOCUMENTO,' + #13#10 +
//                    '          PP.RAZAOSOCIAL' + #13#10 +
//                    ' ORDER BY NOMEEMPRE, IDPAIS, NIF, NOME, DATA_PAGAMENTO, CODNATUREZA ');
    sSQL.Append('SELECT GERAL.CGCEMPRE,                                                ' + #13#10 +
'       GERAL.NOMEEMPRE,                                                               ' + #13#10 +
'       GERAL.IDPESSOA,                                                                ' + #13#10 +
'       GERAL.BENEFICIARIO,                                                            ' + #13#10 +
'       GERAL.IDPAIS,                                                                  ' + #13#10 +
'       GERAL.NIF,                                                                     ' + #13#10 +
'       GERAL.BENEF_DISPENSA_NIF,                                                      ' + #13#10 +
'       GERAL.PAIS_DISPENSA_NIF,                                                       ' + #13#10 +
'       GERAL.CGCBENEF,                                                                ' + #13#10 +
'       GERAL.NOME,                                                                    ' + #13#10 +
'       GERAL.FONTEPAGADORA,                                                           ' + #13#10 +
'       GERAL.LOGRADOURO,                                                              ' + #13#10 +
'       GERAL.NUMERO,                                                                  ' + #13#10 +
'       GERAL.COMPLEMENTO,                                                             ' + #13#10 +
'       GERAL.BAIRRO,                                                                  ' + #13#10 +
'       GERAL.CEP,                                                                     ' + #13#10 +
'       GERAL.CIDADE,                                                                  ' + #13#10 +
'       GERAL.ESTADO,                                                                  ' + #13#10 +
'       GERAL.TELEFONE,                                                                ' + #13#10 +
'       GERAL.DATA_PAGAMENTO,                                                          ' + #13#10 +
'       GERAL.CODNATUREZA,                                                             ' + #13#10 +
'       GERAL.TIPO_RENDIMENTO,                                                         ' + #13#10 +
'       SUM(GERAL.RENDDIMENTO_PAGO) RENDDIMENTO_PAGO,                                  ' + #13#10 +
'       SUM(GERAL.IMPOSTO_RETIDO) IMPOSTO_RETIDO ,                                     ' + #13#10 +
'       GERAL.FORMA_TRIBUTACAO                                                         ' + #13#10 +
' FROM   ( SELECT PP.NUMDOCUMENTO AS CGCEMPRE,                                         ' + #13#10 +
'           PP.RAZAOSOCIAL AS NOMEEMPRE,                                               ' + #13#10 +
'           P.IDPESSOA,                                                                ' + #13#10 +
'           DECODE(P.TIPO, ''F'', 1, 2) AS BENEFICIARIO,                                 ' + #13#10 +
'           PA.CODRECEITAFEDERAL AS IDPAIS,                                            ' + #13#10 +
'           '' '' AS NIF,                                                                ' + #13#10 +
'           ''N'' AS BENEF_DISPENSA_NIF,                                                 ' + #13#10 +
'           ''S'' AS PAIS_DISPENSA_NIF,                                                  ' + #13#10 +
'           P.NUMDOCUMENTO AS CGCBENEF,                                                ' + #13#10 +
'           SUBSTR(P.RAZAOSOCIAL, 1, 150) AS NOME,                                     ' + #13#10 +
'           DECODE(P.TIPO, ''J'', LPAD(LI.FONTEPAGADORA, 3, ''0''), NULL) AS FONTEPAGADORA,' + #13#10 +
'           SUBSTR(E.LOGRADOURO, 1, 60) AS LOGRADOURO,                                 ' + #13#10 +
'           E.NUMERO,                                                                  ' + #13#10 +
'           E.COMPLEMENTO,                                                             ' + #13#10 +
'           SUBSTR(E.BAIRRO, 1, 20) AS BAIRRO,                                         ' + #13#10 +
'           E.CEP,                                                                     ' + #13#10 +
'           UPPER(SUBSTR(CD.NOME, 1, 40)) AS CIDADE,                                   ' + #13#10 +
'           TRANSLATE(SUBSTR(UPPER(ED.NOMEESTADO), 1, 40),                             ' + #13#10 +
'                     ''ÁÇÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕËÜ'',                                          ' + #13#10 +
'                     ''ACEIOUAEIOUAEIOUAOEU'') AS ESTADO,                               ' + #13#10 +
'           SUBSTR(TRIM(T.DDD) || T.NUMERO, 1, 15) AS TELEFONE,                        ' + #13#10 +
'           L.DATAPAGAMENTO AS DATA_PAGAMENTO,                                         ' + #13#10 +
'           L.CODNATUREZA,                                                             ' + #13#10 +
'           300 AS TIPO_RENDIMENTO,                                                    ' + #13#10 +
'           SUM(L.VLRBASE) AS RENDDIMENTO_PAGO,                                        ' + #13#10 +
'           SUM(L.VLRIRRF) AS IMPOSTO_RETIDO,                                          ' + #13#10 +
'           10 AS FORMA_TRIBUTACAO,                                                    ' + #13#10 +
'           L.IDPLANOPREV                                                              ' + #13#10 +
'        FROM LANCIRRF L                                                               ' + #13#10 +
'        INNER JOIN LANCXINFORME LI                                                    ' + #13#10 +
'        ON LI.IDLANCIRRF = L.IDLANCIRRF                                               ' + #13#10 +
'        INNER JOIN PESSOA P                                                           ' + #13#10 +
'        ON P.IDPESSOA = L.IDBENEFIRRF                                                 ' + #13#10 +
'        INNER JOIN PESSOA PP                                                          ' + #13#10 +
'        ON PP.IDPESSOA = L.IDPESSOA                                                   ' + #13#10 +
'        INNER JOIN ENDPESS E                                                          ' + #13#10 +
'        ON E.IDPESSOA = P.IDPESSOA                                                    ' + #13#10 +
'        AND E.IDENDERECO = P.IDENDRESIDENCIAL                                         ' + #13#10 +
'        LEFT JOIN CIDADES CD                                                          ' + #13#10 +
'        ON CD.IDCIDADES = E.IDCIDADES                                                 ' + #13#10 +
'        INNER JOIN ESTADO ED                                                          ' + #13#10 +
'        ON ED.IDESTADO = CD.IDESTADO                                                  ' + #13#10 +
'        INNER JOIN PAIS PA                                                            ' + #13#10 +
'        ON PA.IDPAIS = ED.IDPAIS                                                      ' + #13#10 +
'        LEFT JOIN TELENDPESS T                                                        ' + #13#10 +
'        ON P.IDPESSOA = T.IDPESSOA                                                    ' + #13#10 +
'        AND T.TIPO = ''P''                                                              ' + #13#10 +
'        AND T.IDENDERECO = NVL(P.IDENDRESIDENCIAL, P.IDENDCORRESP)                    ' + #13#10 +
'         WHERE L.DATAPAGAMENTO BETWEEN TO_DATE(' + quotedStr(DataIni) + ',' + quotedStr('DD/MM/YYYY')+ ') ' + #13#10 +
'                                    AND TO_DATE(' + quotedStr(DataFim) + ',' + quotedStr('DD/MM/YYYY')+ ')');
 
if (sCPFFiltro<> EmptyStr) then
sSQL.Append(' AND P.NUMDOCUMENTO IN(' + sCPFFiltro +')');
        
sSQL.Append('AND L.CODNATUREZA =  0473                                                  ' + #13#10 +
'        AND L.VLRIRRF <> 0                                                             ' + #13#10 +
'        GROUP BY P.TIPO,                                                               ' + #13#10 +
'              PA.CODRECEITAFEDERAL,                                                    ' + #13#10 +
'              PA.IDPAIS,                                                               ' + #13#10 +
'              P.NUMDOCUMENTO,                                                          ' + #13#10 +
'              P.RAZAOSOCIAL,                                                           ' + #13#10 +
'              LI.FONTEPAGADORA,                                                        ' + #13#10 +
'              E.LOGRADOURO,                                                            ' + #13#10 +
'              E.NUMERO,                                                                ' + #13#10 +
'              E.COMPLEMENTO,                                                           ' + #13#10 +
'              E.BAIRRO,                                                                ' + #13#10 +
'              E.CEP,L.IDBENEFIRRF,L.IDHSTFOLHABENEF,                                   ' + #13#10 +
'              CD.NOME,                                                                 ' + #13#10 +
'              ED.NOMEESTADO,                                                           ' + #13#10 +
'              TRIM(T.DDD) || T.NUMERO,                                                 ' + #13#10 +
'              L.DATAPAGAMENTO,                                                         ' + #13#10 +
'              L.CODNATUREZA,                                                           ' + #13#10 +
'              L.VLRBASE,                                                               ' + #13#10 +
'              L.VLRIRRF,                                                               ' + #13#10 +
'              P.IDPESSOA,                                                              ' + #13#10 +
'              PP.NUMDOCUMENTO,                                                         ' + #13#10 +
'              PP.RAZAOSOCIAL,                                                          ' + #13#10 +
'              L.IDPLANOPREV                                                            ' + #13#10 +
'UNION                                                                                  ' + #13#10 +
'SELECT PP.NUMDOCUMENTO AS CGCEMPRE,                                                    ' + #13#10 +
'               PP.RAZAOSOCIAL AS NOMEEMPRE,                                            ' + #13#10 +
'               P.IDPESSOA,                                                             ' + #13#10 +
'               DECODE(P.TIPO, ''F'', 1, 2) AS BENEFICIARIO,                              ' + #13#10 +
'               PA.CODRECEITAFEDERAL AS IDPAIS,                                         ' + #13#10 +
'               '' '' AS NIF,                                                             ' + #13#10 +
'               ''N'' AS BENEF_DISPENSA_NIF,                                              ' + #13#10 +
'               ''S'' AS PAIS_DISPENSA_NIF,                                               ' + #13#10 +
'               P.NUMDOCUMENTO AS CGCBENEF,                                             ' + #13#10 +
'               SUBSTR(P.RAZAOSOCIAL, 1, 150) AS NOME,                                  ' + #13#10 +
'               DECODE(P.TIPO, ''J'', LPAD(LI.FONTEPAGADORA, 3, ''0''), NULL) AS FONTEPAGADORA,' + #13#10 +
'               SUBSTR(E.LOGRADOURO, 1, 60) AS LOGRADOURO,                                 ' + #13#10 +
'               E.NUMERO,                                                                  ' + #13#10 +
'               E.COMPLEMENTO,                                                             ' + #13#10 +
'               SUBSTR(E.BAIRRO, 1, 20) AS BAIRRO,                                         ' + #13#10 +
'               E.CEP,                                                                     ' + #13#10 +
'               UPPER(SUBSTR(CD.NOME, 1, 40)) AS CIDADE,                                   ' + #13#10 +
'               TRANSLATE(SUBSTR(UPPER(ED.NOMEESTADO), 1, 40),                             ' + #13#10 +
'                         ''ÁÇÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕËÜ'',                                          ' + #13#10 +
'                         ''ACEIOUAEIOUAEIOUAOEU'') AS ESTADO,                               ' + #13#10 +
'               SUBSTR(TRIM(T.DDD) || T.NUMERO, 1, 15) AS TELEFONE,                        ' + #13#10 +
'               L.DATAPAGAMENTO AS DATA_PAGAMENTO,                                         ' + #13#10 +
'               L.CODNATUREZA,                                                             ' + #13#10 +
'               300 AS TIPO_RENDIMENTO,                                                    ' + #13#10 +
'               SUM(L.VLRBASE) AS RENDDIMENTO_PAGO,                                        ' + #13#10 +
'               SUM(L.VLRIRRF) AS IMPOSTO_RETIDO,                                          ' + #13#10 +
'               10 AS FORMA_TRIBUTACAO,                                                    ' + #13#10 +
'               L.IDPLANOPREV                                                              ' + #13#10 +
'          FROM LANCIRRF L                                                                 ' + #13#10 +
'         INNER JOIN LANCXINFORME LI                                                       ' + #13#10 +
'            ON LI.IDLANCIRRF = L.IDLANCIRRF                                               ' + #13#10 +
'         INNER JOIN PESSOA P                                                              ' + #13#10 +
'            ON P.IDPESSOA = L.IDBENEFIRRF                                                 ' + #13#10 +
'         INNER JOIN PESSOA PP                                                             ' + #13#10 +
'            ON PP.IDPESSOA = L.IDPESSOA                                                   ' + #13#10 +
'         INNER JOIN ENDPESS E                                                             ' + #13#10 +
'            ON E.IDPESSOA = P.IDPESSOA                                                    ' + #13#10 +
'           AND E.IDENDERECO = P.IDENDRESIDENCIAL                                          ' + #13#10 +
'          LEFT JOIN CIDADES CD                                                            ' + #13#10 +
'            ON CD.IDCIDADES = E.IDCIDADES                                                 ' + #13#10 +
'         INNER JOIN ESTADO ED                                                             ' + #13#10 +
'            ON ED.IDESTADO = CD.IDESTADO                                                  ' + #13#10 +
'         INNER JOIN PAIS PA                                                               ' + #13#10 +
'            ON PA.IDPAIS = ED.IDPAIS                                                      ' + #13#10 +
'          LEFT JOIN TELENDPESS T                                                          ' + #13#10 +
'            ON P.IDPESSOA = T.IDPESSOA                                                    ' + #13#10 +
'           AND T.TIPO = ''P''                                                               ' + #13#10 +
'           AND T.IDENDERECO = NVL(P.IDENDRESIDENCIAL, P.IDENDCORRESP)                     ' + #13#10 +
'         WHERE L.DATAPAGAMENTO BETWEEN TO_DATE(' + quotedStr(DataIni) + ',' + quotedStr('DD/MM/YYYY')+ ') ' + #13#10 +
'                                    AND TO_DATE(' + quotedStr(DataFim) + ',' + quotedStr('DD/MM/YYYY')+ ')');
         
 if (sCPFFiltro<> EmptyStr) then
 sSQL.Append(' AND P.NUMDOCUMENTO IN(' + sCPFFiltro +')');

 sSQL.Append('AND L.CODNATUREZA = 9466                                                       ' + #13#10 +
'            AND L.VLRIRRF <> 0                                                             ' + #13#10 +
'            GROUP BY P.TIPO,                                                               ' + #13#10 +
'                  PA.CODRECEITAFEDERAL,                                                    ' + #13#10 +
'                  PA.IDPAIS,                                                               ' + #13#10 +
'                  P.NUMDOCUMENTO,                                                          ' + #13#10 +
'                  P.RAZAOSOCIAL,                                                           ' + #13#10 +
'                  LI.FONTEPAGADORA,                                                        ' + #13#10 +
'                  E.LOGRADOURO,                                                            ' + #13#10 +
'                  E.NUMERO,                                                                ' + #13#10 +
'                  E.COMPLEMENTO,                                                           ' + #13#10 +
'                  E.BAIRRO,                                                                ' + #13#10 +
'                  E.CEP,L.IDBENEFIRRF,L.IDHSTFOLHABENEF,                                   ' + #13#10 +
'                  CD.NOME,                                                                 ' + #13#10 +
'                  ED.NOMEESTADO,                                                           ' + #13#10 +
'                  TRIM(T.DDD) || T.NUMERO,                                                 ' + #13#10 +
'                  L.DATAPAGAMENTO,                                                         ' + #13#10 +
'                  L.CODNATUREZA,                                                           ' + #13#10 +
'                  L.VLRBASE,                                                               ' + #13#10 +
'                  L.VLRIRRF,                                                               ' + #13#10 +
'                  P.IDPESSOA,                                                              ' + #13#10 +
'                  PP.NUMDOCUMENTO,                                                         ' + #13#10 +
'                  PP.RAZAOSOCIAL,                                                          ' + #13#10 +
'                  L.IDPLANOPREV                                                            ' + #13#10 +
//Cássio Rovaroto - SIG nº 78096 - Início
//'         ORDER BY NOMEEMPRE, IDPAIS, NIF, NOME, DATA_PAGAMENTO, CODNATUREZA
'                                ) GERAL                                                    ' + #13#10 +
//Cássio Rovaroto - SIG nº 78096 - Fim
'GROUP BY GERAL.CGCEMPRE,                                      ' + #13#10 +
'       GERAL.NOMEEMPRE,                                       ' + #13#10 +
'       GERAL.IDPESSOA,                                        ' + #13#10 +
'       GERAL.BENEFICIARIO,                                    ' + #13#10 +
'       GERAL.IDPAIS,                                          ' + #13#10 +
'       GERAL.NIF,                                             ' + #13#10 +
'       GERAL.BENEF_DISPENSA_NIF,                              ' + #13#10 +
'       GERAL.PAIS_DISPENSA_NIF,                               ' + #13#10 +
'       GERAL.CGCBENEF,                                        ' + #13#10 +
'       GERAL.NOME,                                            ' + #13#10 +
'       GERAL.FONTEPAGADORA,                                   ' + #13#10 +
'       GERAL.LOGRADOURO,                                      ' + #13#10 +
'       GERAL.NUMERO,                                          ' + #13#10 +
'       GERAL.COMPLEMENTO,                                     ' + #13#10 +
'       GERAL.BAIRRO,                                          ' + #13#10 +
'       GERAL.CEP,                                             ' + #13#10 +
'       GERAL.CIDADE,                                          ' + #13#10 +
'       GERAL.ESTADO,                                          ' + #13#10 +
'       GERAL.TELEFONE,                                        ' + #13#10 +
'       GERAL.DATA_PAGAMENTO,                                  ' + #13#10 +
'       GERAL.CODNATUREZA,                                     ' + #13#10 +
'       GERAL.TIPO_RENDIMENTO,                                 ' + #13#10 +
//Cássio Rovaroto - SIG nº 78096 - Início
//'       GERAL.FORMA_TRIBUTACAO                                 ');
'       GERAL.FORMA_TRIBUTACAO                                 ' + #13#10 +
'ORDER BY GERAL.BENEFICIARIO, GERAL.IDPAIS, GERAL.IDPESSOA, GERAL.DATA_PAGAMENTO,GERAL.CODNATUREZA     ');
//Cássio Rovaroto - SIG nº 78096 - Fim
//Taffarel - SIG64008 - Fim
   sSQL.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\QueryDirf_FUNCEF2011_Est.txt');
   Result := GetDataPacket(sSQL);
   sSql.Clear;                  //Arnaldo - WO13395
   FreeAndNil(sSql);            //Arnaldo - WO13395
end;

procedure TCtrlGeraDirfNova.PrincipalEst(
  sNumeroRecibo,
  sAno,
  sAnoref,
  sNomeArquivo: string;
  IdResponsavel,
  TipoArquivo,
  NaturDeclar: Integer);
Var
  iContador,iNumArq: Integer;
  ArquivoTextoEst: TextFile;
  sArqParcial,sLinha,SEI,sCGCBenef: String;

procedure GravaTXT;
begin
  WriteLn(ArquivoTextoEst, sLinha);
end;

function RemoveSeparadorDecimal(sTxt: String):String;
begin
  sTxt := StringReplace(sTxt, '.', EmptyStr,[rfReplaceAll, rfIgnoreCase]);
  result:= Trim(StringReplace(sTxt, ',', EmptyStr,[rfReplaceAll, rfIgnoreCase]));
end;

procedure GravaBRPDE;
begin
   sCGCBenef:= Trim(CdsEst.FieldByName('CGCBENEF').AsString);
   sLinha :='BRPDE';
   sLinha := sLinha + '|' + CdsEst.FieldByName('BENEFICIARIO').AsString;
   sLinha := sLinha + '|' + CdsEst.FieldByName('IDPAIS').AsString;
   sLinha := sLinha + '|' + CdsEst.FieldByName('NIF').AsString;
   sLinha := sLinha + '|' + CdsEst.FieldByName('BENEF_DISPENSA_NIF').AsString;
   sLinha := sLinha + '|' + CdsEst.FieldByName('PAIS_DISPENSA_NIF').AsString;
   sLinha := sLinha + '|' + CdsEst.FieldByName('CGCBENEF').AsString;
   sLinha := sLinha + '|' + CdsEst.FieldByName('NOME').AsString;
   sLinha := sLinha + '|' + CdsEst.FieldByName('FONTEPAGADORA').AsString;
   sLinha := sLinha + '|' + CdsEst.FieldByName('LOGRADOURO').AsString;
   sLinha := sLinha + '|' + CdsEst.FieldByName('NUMERO').AsString;
   sLinha := sLinha + '|' + CdsEst.FieldByName('COMPLEMENTO').AsString;
   sLinha := sLinha + '|' + CdsEst.FieldByName('BAIRRO').AsString;
   sLinha := sLinha + '|' + CdsEst.FieldByName('CEP').AsString;
   sLinha := sLinha + '|' + CdsEst.FieldByName('CIDADE').AsString;
   sLinha := sLinha + '|' + CdsEst.FieldByName('ESTADO').AsString;
   sLinha := sLinha + '|' + CdsEst.FieldByName('TELEFONE').AsString;
   sLinha := sLinha + '|';
   GravaTXT;
end;

procedure GravaVRPDE;
begin
   sLinha := 'VRPDE';
   sLinha := sLinha + '|' + FormatDateTime('YYYYMMDD',CdsEst.FieldByName('DATA_PAGAMENTO').asDateTime);
   sLinha := sLinha + '|' + CdsEst.FieldByName('CODNATUREZA').AsString;
   sLinha := sLinha + '|' + CdsEst.FieldByName('TIPO_RENDIMENTO').AsString;
   sLinha := sLinha + '|' + CompletaZero(RemoveSeparadorDecimal(FormatFloat('#.00',CdsEst.FieldByName('RENDDIMENTO_PAGO').AsCurrency)),13);
   sLinha := sLinha + '|' + CompletaZero(RemoveSeparadorDecimal(FormatFloat('#.00',CdsEst.FieldByName('IMPOSTO_RETIDO').AsCurrency)),13);
   sLinha := sLinha + '|' + CdsEst.FieldByName('FORMA_TRIBUTACAO').AsString;
   sLinha := sLinha + '|';
   GravaTXT;
end;

Function ExluirRodapeTXT(sCaminho: String):boolean;
 var
   sDado: TStringList;
   i    : Integer;
begin
  try
     result:= false;
     sDado:= TStringList.Create;
     sDado.LoadFromFile(sCaminho);
     sDado.BeginUpdate;
     for i := sDado.Count - 1 downto 0 do
       begin
         if (Trim(sDado.Strings[i])= 'FIMDIRF|') then
           begin
            sDado.Delete(i);
            sDado.EndUpdate;
            sDado.SaveToFile(sCaminho);
            Break;
           end;
       end;
     result:= true;
  finally
     FreeAndNil(sDado);
  end;
end;

{Inclui naturezas 0473 e 9466 no TXT ArqDirf_geral.txt}
function IncluirEstrangeiroNoTXT: boolean;
var
   i: Integer;
   sArqEst, sArq: TStringList;
begin
  result:= false;
  try
    sArqEst    := TStringList.Create;
    sArq       := TStringList.Create;
    sArqParcial:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\ArqDirf_geral.txt';
    sArqEst.LoadFromFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\ArqDirf_Est');

    if FileExists(sArqParcial) then
      begin
         if ExluirRodapeTXT(sArqParcial) then
           begin
             sArq.LoadFromFile(sArqParcial);

             {Remove o cabeçalho para não duplicar}
             for i := 3 to sArqEst.Count - 1 do
               sArq.Add(sArqEst.Strings[i]);

             sArq.SaveToFile(sArqParcial);
             result:= true;
           end;
      end;
   finally
      FreeAndNil(sArq);
      FreeAndNil(sArqEst);
   end;
end;

procedure GerarTXT(sTxt: String; bForca: boolean);
var
  ArquivoX: TextFile;
begin
  if not(bForca) then
     begin
        if not(FileExists(sTxt)) then
          begin
             AssignFile(ArquivoX, sTxt);
             ReWrite(ArquivoX);
             CloseFile(ArquivoX);
          end
     end
  else
     begin
         AssignFile(ArquivoX, sTxt);
         ReWrite(ArquivoX);
         CloseFile(ArquivoX);
     end;
end;

{TXT gerado onde o usuário informa o caminho no início da DIRF}
procedure AtlzTX_UsuarioInformou;
var
  ArquivoX: TextFile;
  bAtualizaTXTGeral: boolean;
begin
   GerarTXT(sArqParcial,false);
   GerarTXT(sNomeArquivo,false);

   if (FileExists(sArqParcial)) and (FileExists(sNomeArquivo)) then
     begin
       bAtualizaTXTGeral := (Trim(sArqParcial) <> Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\ArqDirf_geral.txt');

       {Atualiza ArqDirf_geral.txt a DIRF contenha somente naturezas 0473 e 9466}
       if (bAtualizaTXTGeral) then
          begin
             GerarTXT(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\ArqDirf_geral.txt',true);
             If Not CopyFile(Pchar(sArqParcial), Pchar(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\ArqDirf_geral.txt'), false) Then
                 MessageInfo := 'Erro ao gerar arquivo';
              WinExec(PChar('cmd /c COPY /B ' + sArqParcial + Pchar(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\ArqDirf_geral.txt')), sw_hide);
          end;

        {Atualiza arquivo TXT da área de trabalho}
        If Not CopyFile(Pchar(sArqParcial), Pchar(sNomeArquivo), false) Then
           MessageInfo := 'Erro ao gerar arquivo';
        WinExec(PChar('cmd /c COPY /B ' + sArqParcial + Pchar(sNomeArquivo)), sw_hide);
     end;
end;


begin
   CdsResponsavel.Data := ListResponsavel(IdResponsavel);
   iContador:= 0;
   iNumArq  := 1;

   Case TipoArquivo Of
    0: SEI := 'N';
    1: SEI := 'S';
   End;

   sArqParcial := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\ArqDirf_Est';
   if FileExists(sArqParcial) then
      DeleteFile(sArqParcial);

   AssignFile(ArquivoTextoEst, sArqParcial);
   ReWrite(ArquivoTextoEst);

   FMaxProgresso := CdsEst.RecordCount;
   FProgresso := 0;
   CdsEst.First;

   {Cabeçalho da DIRF}
   GRegDadosPrincipais(ArquivoTextoEst,
    sAno,
    sAnoRef,
    SEI,
    sNumeroRecibo,
    NaturDeclar,
    2);

   frmProgresso.MostraFormProgresso('Processando', True, False, True, 0, CdsEst.RecordCount);

   {corpo da DIRF parte 01/03}
   sLinha :='RPDE|';
   GravaTXT;

   {corpo da DIRF parte 02/03}
   GravaBRPDE;
   repeat
     {corpo da DIRF parte 03/03}
     if (sCGCBenef <> Trim(CdsEst.FieldByName('CGCBENEF').AsString)) then
        GravaBRPDE;

     GravaVRPDE;

     CdsEst.next;
     AtualizaFrmProgresso(iContador);
   until(CdsEst.Eof);

   {Final da DIRF}
  // sLinha := 'FIMDIRF|'; //William Santana - 34429 - merge
  // GravaTXT;             //William Santana - 34429 - merge
   CloseFile(ArquivoTextoEst);

  frmProgresso.EscondeFormProgresso;

  {quando existe outros tipos de natureza, é necessário incluir todas no mesmo arquivo gerado}
   if not(Cds.IsEmpty) then
     begin
       IncluirEstrangeiroNoTXT;
       sArqParcial:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\ArqDirf_geral.txt';
       AtlzTX_UsuarioInformou;
     end
   else begin
       sArqParcial:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\ArqDirf_Est';
       AtlzTX_UsuarioInformou;
   end;
end;
//Darivaldo Alencar SIG 28411 -fim

// Andre Imakawa - SIG 61321 - Inicio

function TCtrlGeraDirfNova.PossuiValorCds(Const oCds: TClientDataSet; Const pColuna, pTipoReg, pNatureza: String; pUsaLocate: Boolean): Boolean;
var
  RegAtual: TBookMark;
  bResultado: Boolean;
Begin
  if pUsaLocate then
  begin
    RegAtual := oCds.GetBookmark;
    If oCds.Locate('CGCBENEF; TIPOREG; CODNATUREZA', VarArrayOf([oCds.fieldByname('CGCBENEF').AsString,
                    pTipoReg, pNatureza]), []) Then
    bResultado :=  (oCds.fieldByname('JAN' + pColuna).AsFloat + oCds.fieldByname('FEV' + pColuna).AsFloat +
                    oCds.fieldByname('MAR' + pColuna).AsFloat + oCds.fieldByname('ABR' + pColuna).AsFloat +
                    oCds.fieldByname('MAI' + pColuna).AsFloat + oCds.fieldByname('JUN' + pColuna).AsFloat +
                    oCds.fieldByname('JUL' + pColuna).AsFloat + oCds.fieldByname('AGO' + pColuna).AsFloat +
                    oCds.fieldByname('SET' + pColuna).AsFloat + oCds.fieldByname('OUT' + pColuna).AsFloat +
                    oCds.fieldByname('NOV' + pColuna).AsFloat + oCds.fieldByname('DEZ' + pColuna).AsFloat +
                    oCds.fieldByname('VLR13' + pColuna).AsFloat) <> 0;
    If RegAtual <> Nil Then
      oCds.GotoBookmark(RegAtual);
  end
  else
  begin
    bResultado :=  (oCds.fieldByname('JAN' + pColuna).AsFloat + oCds.fieldByname('FEV' + pColuna).AsFloat +
                    oCds.fieldByname('MAR' + pColuna).AsFloat + oCds.fieldByname('ABR' + pColuna).AsFloat +
                    oCds.fieldByname('MAI' + pColuna).AsFloat + oCds.fieldByname('JUN' + pColuna).AsFloat +
                    oCds.fieldByname('JUL' + pColuna).AsFloat + oCds.fieldByname('AGO' + pColuna).AsFloat +
                    oCds.fieldByname('SET' + pColuna).AsFloat + oCds.fieldByname('OUT' + pColuna).AsFloat +
                    oCds.fieldByname('NOV' + pColuna).AsFloat + oCds.fieldByname('DEZ' + pColuna).AsFloat +
                    oCds.fieldByname('VLR13' + pColuna).AsFloat) <> 0;
  end;


  Result := bResultado;
end;

Procedure TCtrlGeraDirfNova.PossuiValorRTPA(Const oCds: TClientDataSet; Const pColuna, pCodNatureza: String; var sLinhaRTPA: string; pUsaLocate: Boolean);
Begin
  sLinhaRTPA := EmptyStr;
  if PossuiValorCds(oCds, pColuna, '1', pCodNatureza, pUsaLocate) then
  begin
    sLinhaRTPA := InfoPcPA(oCds.fieldByname('CGCBENEF').AsString, 'RTPA', pCodNatureza);
  end;
end;
// Andre Imakawa - SIG 61321 - Fim

function TCtrlGeraDirfNova.VerificaAcaoJudEqua(pNumDocumento, pDataIni, pDataFim: string): Boolean;
var
    cdsAux: TClientDataSet;
    sSQL: string;
begin
  Result := False;
  cdsAux := TClientDataSet.Create(nil);
  sSQL := 'SELECT DISTINCT 1  ' +#13#10+
          '  FROM PROCJUD     ' +#13#10+
          '  JOIN DETPROCJUD ON DETPROCJUD.IDPROCJUD = PROCJUD.IDPROCJUD AND DETPROCJUD.IDPESSOA = PROCJUD.IDPESSOA ' +#13#10+
          '    AND DETPROCJUD.IDREGRA IN (26973, 26987, 26989) ' +#13#10+
          ' WHERE PROCJUD.IDPESSOA IN (SELECT IDPESSOA FROM PESSOA WHERE TRIM(PESSOA.NUMDOCUMENTO) IN ('+ pNumDocumento +')) ' +#13#10+
          '   AND ((PROCJUD.SITPROCESSO = 0 AND TO_CHAR(PROCJUD.DATAINICIO, ''MM/YYYY'') <= TO_CHAR(TO_DATE('+ QuotedStr(pDataFim) +', ''DD/MM/YYYY''), ''MM/YYYY'') AND ' +#13#10+
          '         ((TO_CHAR(PROCJUD.DATAFINAL, ''MM/YYYY'') > TO_CHAR(TO_DATE('+ QuotedStr(pDataIni) +', ''DD/MM/YYYY''),''MM/YYYY'')) OR (TO_CHAR(PROCJUD.DATAFINAL, ''MM/YYYY'') IS NULL))) ' +#13#10+
          '		OR (PROCJUD.SITPROCESSO = 2 AND TO_CHAR(PROCJUD.DATAINICIO, ''MM/YYYY'') <= TO_CHAR(TO_DATE('+ QuotedStr(pDataFim) +', ''DD/MM/YYYY''), ''MM/YYYY'') AND ' +#13#10+
          '			TO_CHAR(PROCJUD.DATAFINAL, ''MM/YYYY'') >= TO_CHAR(TO_DATE('+ QuotedStr(pDataIni) +', ''DD/MM/YYYY''),''MM/YYYY''))) ' +#13#10+
          '   AND PROCJUD.PERCACAO <> 0';
  try
      cdsAux.Data := GetDataPacket(sSQL);
      if not cdsAux.IsEmpty then
        Result := True;
  finally
    FreeAndNil(cdsAux);
  end;
end;

//edilaine SIG134189 : inicio
function TCtrlGeraDirfNova.GetVersaoLeiaute(pAno: string): string;
var
  sSQL: string;
  cdsAux: TClientDataSet;
begin
  cdsAux := TClientDataSet.Create(nil);
  try
    sSQL := 'SELECT NUMVERSAOLAYOUT    ' +#13#10+
            '  FROM DIRF               ' +#13#10+
            ' WHERE EXERCICIODIRF = ' + QuotedStr(pAno) +#13#10+
            ' GROUP BY NUMVERSAOLAYOUT ';
    cdsAux.Data := GetDataPacket(sSQL);

    if not cdsAux.isEmpty then
       Result := cdsAux.FieldByName('NUMVERSAOLAYOUT').asString;

  finally
    FreeAndNil(cdsAux);
  end
end;
//edilaine SIG134189 : fim

End.

