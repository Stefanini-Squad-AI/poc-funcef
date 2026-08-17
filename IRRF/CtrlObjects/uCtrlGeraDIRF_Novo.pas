//--------------------------------------------------------------------------------
//N.Chamado.....: MIGRACAO-ORACLE-2025 (TAS000000006794)
//Dt.Alteração..: 17/10/2025
//Responsável...: Paulo Nobre
//Descrição.....: Ajustes na função: ListaDadosDependentesPlanos para incluir o
//                alias "PL." nos campos do ORDER BY
//---------------------------------------------------------------------------------
//***************************************************************************************
//****************************************************************************************
//N. WO..............: WO19478
//Data da Alteração..: 19/03/2025
//Responsável........: Paulo Nobre
//Descrição..........: Tratamento necessário, devido ao App da Receita não ler valores
//                     negativos. Ocorrem situações da existência de valores negativos em
//                     alguns meses, fruto de devoluções/estornos, especificamente
//                     observados na linha RIAP - Abono Pecuniário (CODIRF = 36).
//                     Solução:
//                     . Encontrar o saldo: total dos valores positivos (-) o total dos
//                       valores negativos;
//                     . Atribuir este saldo no mês em que se encontra o 1º valor positivo
//                     . Atribuir valor = 0 no restante dos meses.
//                     Função: GravaLinhasFF_EmpregadosEPFPrestadorServico
//****************************************************************************************
//N. WO..............: WO18407
//Data da Alteração..: 22/01/2025
//Responsável........: Paulo Nobre
//Descrição..........: Resolvendo problema de estar trazendo mais de um responsável do
//                     centro de custo na inserção dos dados adicionais, função:
//                     InserirDIRF_DadosAdicionais_O
//***************************************************************************************
//N. WO..............: WO13395
//Data da Alteração..: 02/09/2024
//Responsável........: Arnaldo V. Scarin
//Descrição..........: Inclusão dos Registros RTDS e ESDS
//***************************************************************************************
//Rotina.............: LocalizaDIRF_MovSintCNPJ, LocalizaDIRF_MovSintCNPJMensal,
//...................: ListaMovInformesRendimento e GravaLinhasCP_PessoaJuridica 
//N. WO..............: WO8238
//Data da Alteração..: 22/02/2024
//Responsável........: Andre Imakawa
//Descrição..........:
//****************************************************************************************
//Rotina.............: Exporta
//N. WO..............: WO7067
//Data da Alteração..: 17/01/2024
//Responsável........: Paulo Nobre
//Descrição..........: Proteção na query que seleciona o arquivo temporário (_qryAux2) para
//                     não deixar o NUMDOCUMENTO = NULL, no caso,
//                     NVL(NUMDOCUMENTO,''0'') AS NUMDOCUMENTO
//****************************************************************************************
//Rotina.............: InserirDIRF_MovAnalitico_O
//N. SIG.............: 132249         
//Data da Alteração..: 31/01/2023
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Correção na busca de tributações aplicada às naturezas 1708 e 8045.
//***************************************************************************************
//Rotina.............: InserirDIRF_MovAnalitico_O
//N. SIG.............: 131692
//Data da Alteração..: 23/01/2023
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Inclusão de movimentação da natureza de rendimento 8045.
//***************************************************************************************
//Rotina.............: InserirDIRF_MovAnalitico_O_Manual, GetVersaoLeiaute
//N. SIG.............: 131689
//Data da Alteração..: 20/01/2022
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Adequação do procedimento de atribuição de código de importação.
//***************************************************************************************
//Rotina.............: Exporta
//N. SIG.............: 124014
//Data da Alteração..: 16/03/2022
//Responsável........: Edilaine
//Descrição..........: Preenchimento incorreto para gerar DIRF anos anteriores CP
//***************************************************************************************
//Rotina.............: LocalizaDIRF_MovSintCNPJ
//N. SIG.............: 123941
//Data da Alteração..: 15/03/2022
//Responsável........: Edilaine
//Descrição..........: Divergencia entre quantidade de lançamentos por natureza
//***************************************************************************************
//Rotina.............: InserirDIRF_MovAnalitico_O
//N. SIG.............: 122439
//Data da Alteração..: 28/01/2022
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Alteração na forma de recuperar o movimento analítico Original.
//***************************************************************************************
//N. SIG.............: 122494
//Data da Alteração..: 28/01/2022
//Responsável........: Everson Cunha
//Descrição..........: sNumVersaoLayout2021 = 'XJFSFHB'
//******************************************************************************
//Rotina.............: GravaLinhasCP_PessoaJuridica
//N. SIG.............: 119890
//Data da Alteração..: 22/10/2021
//Responsável........: Edilaine
//Descrição..........: Inclusão da linha RTPP para natureza 0588
//***************************************************************************************
//Rotina.............: GerarDIRFAnual
//N. SIG.............: 113911
//Data da Alteração..: 04/10/2021
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Inclusão da indicação da versão do leiaute DIRF na interface. 
//***************************************************************************************
//Rotina.............: GravaLinhasFF_PlanoSaudeEOdonto
//N. SIG.............: 113909
//Data da Alteração..: 25/02/2021
//Responsável........: Edilaine
//Descrição..........: Alteração da rotina para segregar as informações de Plano de saude
//                     no ano de 2020, uma vez que, houve mudança de operadora do plano
//                     de saude
//***************************************************************************************
//Rotina.............: GravaLinhasFF_PlanoSaudeEOdonto
//N. SIG.............: 113729
//Data da Alteração..: 25/02/2021
//Responsável........: Edilaine
//Descrição..........: Incluir ex-funcionários sem rendimento mas com plano saude/odonto
//***************************************************************************************
//Rotina.............: GetVersaoLeiaute
//N. SIG.............: 113859
//Data da Alteração..: 25/02/2021
//Responsável........: Edilaine
//Descrição..........: Inserir identificador do layout DIRF 2020
//***************************************************************************************
//Rotina.............: InserirDIRF_DadosAdicionais_O
//N. SIG.............: 112829
//Data da Alteração..: 20/01/2021
//Responsável........: André Imakawa
//Descrição..........: Correção na query, removido o virgula, pois o trecho anterior ja insere.
//***************************************************************************************
//Rotina.............: InserirDIRF_DadosAdicionais_O, GravaLinhasFF_PlanoSaudeEOdonto,
//                     GeraDadosPlanoSaude, ListaTotalDependentesPlanosNova
//N. SIG.............: 97984
//Data da Alteração..: 21/02/2020
//Responsável........: Tiago Von P. Baia
//Descrição..........: Alteração da rotina para segregar as informações de Plano de saude
//                     no ano de 2019, uma vez que, houve mudança de operadora do plano
//                     de saude.
//***************************************************************************************
//Rotina.............: GetVersaoLeiaute
//N. SIG.............: 97516
//Data da Alteração..: 21/02/2020
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Inlcusão do novo número de versão DIRF 2019/2020.
//***************************************************************************************
//Rotina.............: GeraDadosPlanoOdontologico, GeraDadosPlanoSaude,
//                     ListaTotalDependentesPlanosNova
//N. SIG.............: 84634
//Data da Alteração..: 10/04/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Alteração na forma de geração das linhas para plano de saúde,
//                     unificando os valores dos planos de saúde dos dependentes dentro
//                     do titular.
//***************************************************************************************
//Rotina.............: InserirDIRF_MovAnalFF_Depen, ListaTotalDependentesPlanos,
//                     ListaDadosDependentesPlanos, Exporta
//N. SIG.............: 81294
//Data da Alteração..: 18/02/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Alteração na formatção no arquivo DIRF Folha de Pagamento para o
//                     bloco OPSE e subjacentes, saiam em ordem crescente de CNPJ
//***************************************************************************************
//Rotina.............: GerarDIRFAnual, GRegDadosPrincipais, GetVersaoLeiaute
//N. SIG.............: 80605
//Data da Alteração..: 23/01/2019
//Alteração Form.....: uCtrlGeraDIRF_Novo
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Alteração na forma de verificação do número de versão do arquivo DIRF.
//***************************************************************************************
//Rotina                : TCtrlGeraDIRF_Novo.LocalizaDIRF_MovSintCNPJMensal
//N. SIG..........      : SIG TIBERO
//Data da Alteração:    : 05/06/2018
//Responsável:          : Everson Luiz Pereira da Cunha
//Descrição.......      : Retirada do 'NLS_DATE_LANGUAGE = portuguese'
//***************************************************************************************
//Rotina                : VerificaSeHaLancamentosNaoGerados, InserirDIRF_MovAnalitico_O_Manual
//N. SIG..........      : 67311
//Data da Alteração:    : 25/04/2018
//Responsável:          : Luiz Carlos
//Descrição.......      : Ajuste para processar codnatureza 3208
//***************************************************************************************
//Rotina                : InserirDIRF_DadosAdicionais_O
//N. SIG..........      : 66033
//Data da Alteração:    : 05/04/2018
//Responsável:          : Luiz Carlos
//Descrição.......      : Ajuste para processar plano amil a partir de 2018
//***************************************************************************************
//Rotina                : LocalizaDIRF_MovSintCNPJ
//N. SIG..........      : 64679
//Data da Alteração:    : 02/03/2018
//Responsável:          : Darivaldo Alencar/ Andre Itiro
//Descrição.......      : Query não contempla CPFs nulos
//***************************************************************************************
//Rotina                : ListaTotalDependentesPlanos, InserirDIRF_DadosAdicionais_O,
//                        InserirDIRF_DadosAdicionais_R, ListaDIRF_MovSintFF, Exporta
//N. SIG..........      : 64340
//Data da Alteração:    : 02/03/2018
//Alteração Form:       : uCtrlGeraDIRF_Novo
//Responsável:          : Cássio Florêncio Rovaroto
//Descrição.......      : Alteração para a DIRF 2017, fazendo a quebra dos lançamentos de
//                        saúde para dois planos diferentes.
//***************************************************************************************
//Rotina                : GRegBeneficiario, GRegDadosPrincipais, Exporta
//N. SIG..........      : 61375
//Data da Alteração:    : 07/02/2018
//Responsável:          : Denis Horongoso
//Descrição.......      : Alterações para o layout DIRF 2018
//***************************************************************************************
//Rotina                : LocalizaDIRF_MovDetCNPJ
//N. SIG..........      : 40444
//Data da Alteração:    : 17/02/2016
//Responsável:          : Andre Imakawa
//Descrição.......      : Correção na query, deve ser utilizado leftJoin
//****************************************************************************************
//Rotina                : InserirDIRF_MovAnalitico_O_FF, ListaDIRF_MovSintFF, Exporta
//N. SIG..........      : 34459
//Data da Alteração:    : 25/01/2017
//Alteração Form:       :
//Responsável:          : Paulo Nobre
//Descrição.......      : 1) Alteração na estrutura do SQL que inseri os dados na tabela DIRF_MOVANALITICO_FF
//                        para trazer da HISTRUBSAL dados dos dependentes de PA. Para isso
//                        foi necessário a inclusão de 5 novos campos para abrigar estes dados.
//                        2) Por conta disso e das novas TAGS da RF da estrutura da PA, foi alterado a forma como,
//                        neste caso, será gravado os dados na tabela temporária de geração do arquivo
//****************************************************************************************
//Rotina                : qryDIRFMovDetCNPJ inclusão de join com tabela DOCUMENTO
//N. SIG..........      : 23598
//Data da Alteração:    : 27/07/2016
//Alteração Form:       : frmGeraDIRF_Novo
//Responsável:          : Darivaldo Alencar
//Descrição.......      : Inclusão do Campo OBS da tabela DOCUMENTO na tbsContasaPagar
//****************************************************************************************
//Rotina                : LocalizaDIRF_MovSintCNPJMensal
//N. SOL..........      : 270177
//N. PPM..........      : 1351703
//Data da Alteração:    : 29/03/2016
//Alteração Form:       : adição do NVL(SUM(DMA.VLRRENDIMENTO), 0) VLRRENDIMENTO no valor
//Responsável:          : William Santana
//Descrição             : correção no ?Demonstrativo mensal totalizado?
//*****************************************************************************************************
//Rotina             : GRegDadosPrincipais
//N. SOL..........   : 269633
//N. PPM..........   : 1337929
//Data da Alteração: : 24/02/2016
//Alteração Form:    :
//Responsável:       : Paulo Nobre
//Descrição          : Alterações para o layout DIRF 2015
//*****************************************************************************************************
//Rotina                : GRegDadosPrincipais
//N. SOL..........      : 269130
//N. PPM..........      : 1284502
//Data da Alteração:    : 09/02/2016
//Alteração Form:       :
//Responsável:          : Paulo Nobre
//Descrição             : Alterações para o layout DIRF 2015
//*****************************************************************************************
//Rotina                : GRegDadosPrincipais
//N. Sol..........      : 263296
//N. PPM..........      : 1268948
//Data da Alteração:    : 05/02/2016
//Alteração Form:       :
//Responsável:          : Paulo Nobre
//Descrição.......      : Alterações para o layout DIRF 2015
//***************************************************************************************
//Rotina                : VerificaSeHaLancamentosNaoGerados, InserirDIRF_MovAnalitico_O_Manual
//N. Sol..........      : 261135
//N. PPM..........      : 1072469
//Data da Alteração:    : 10/08/2015
//Alteração Form:       :
//Responsável:          : Paulo Nobre
//Descrição.......      : Retirando a clausula que protegia o IRRF ser <> 0
//***************************************************************************************
//Rotina                : Exporta
//N. Sol..........      : 252107
//N. PPM..........      : 780490
//Data da Alteração:    : 06/04/2015
//Alteração Form:       :
//Responsável:          : Paulo Nobre
//Descrição.......      : Colocando proteção para quando for gerar o arquivo
//                        do CP não gerar automaticamante os lançamentos dos Planos de
//                        assistência e sim ficar condicionado a decisão do Gestor da
//                        Contabilidade na msg: "Gera o arquivo do Contas a Pagar sem
//                        estes movimentos ?"
//***************************************************************************************
//Rotina                : ListaDIRF_MovSintFF
//N. Sol..........      : 247807
//N. PPM..........      : 703438
//Data da Alteração:    : 26/02/2015
//Alteração Form:       :
//Responsável:          : Paulo Nobre
//Descrição.......      : Acertando o SQL para carregar a Grid com os Empregados que tiveram
//                        seus pagamentos feitos em duas naturezas '0588' e '0561'.
//***************************************************************************************
//Rotina                : GRegDadosPrincipais
//N. Sol..........      : 246475
//N. PPM..........      : 636290
//Data da Alteração:    : 14/01/2015
//Alteração Form:       :
//Responsável:          : Paulo Nobre
//Descrição.......      : Acertando os anos de referência e competência na geração do Arquivo
//***************************************************************************************
//Rotina                : VerificaGrupoAcesso
//N. Sol..........      : 240461
//N. PPM..........      : 550386
//Data da Alteração:    : 01/10/2014
//Alteração Form:       : FGeraDIRF_Novo
//Responsável:          : Paulo Nobre
//Descrição.......      : Acertos para nova proposição dos nomes dos grupos (Infra-GETIF)
//***************************************************************************************
//Rotina                : uCtrlGeraDIRF_Novo
//N. Sol..........      : 228028
//N. Kintana......      : 2062085
//Data da Alteração:    : 11/03/2014
//Alteração Form:       : InserirDIRF_MovAnalitico_O
//Responsável:          : Paulo Nobre
//Descrição.......      : Acertos nas funções de geração do Mov. das Pessoas Juridicas -
//                        Contas a Pagar e inclusão do tributo '0588'
//***************************************************************************************
//Rotina                : uCtrlGeraDIRF_Novo
//N. Sol..........      : 226868
//N. Kintana......      : 2060896
//Data da Alteração:    : 18/02/2014
//Alteração Form:       : InserirDIRF_MovAnalitico_O
//Responsável:          : Paulo Nobre
//Descrição.......      : Inclusão de acertos nas funções de geração do Mov. das
//                        Pessoas Juridicas - Contas a Pagar
//***************************************************************************************
//Rotina                : uCtrlGeraDIRF_Novo
//N. Sol..........      : 220883
//N. Kintana......      : 2053164
//Data da Alteração:    : 21/11/2013
//Alteração Form:       : Novas Rotinas
//Responsável:          : Paulo Nobre
//Descrição.......      : Inclusão de novas funções para uso no novo gerador da DIRF
//                        da Folha de Empregados.
//                        O layout da DIRF 2013, pode ser encotrado na EF funcional da demanda em:
//                        https://portal.funcef.com.br/sites/diati/GETIF/CODES/GestaoMovimentoTributario/Artefatos/Forms/Especificao.aspx
//***************************************************************************************
//N. Sol..........: 126092/1347
//N. Kintana......: 814886
//Data............: 23/09/2013
//Responsável.....: Paulo Nobre
//Descrição.......: Inclusão de novas funções para uso no novo gerador da DIRF.
//                  Funções contidas na control uCtrlGeraDirf2011 foram usadas como base
//                  para a implementação das funções nesta nova control.
//***************************************************************************************
{
// Códigos da DIRF (CODDIRF) usados no Informe de Rendimentos de Empregados e Beneficiários
//
1 - Não vai para Dirf
2 - Rendimento Bruto
3 - IRRF
4 - Deduções
5 - 13º. Salário - Rendimento
6 - 13º. Salário - Deduções
7 - 13º. Salário - IRRF
8 - Compensação por decisão judicial
9 - Rendimentos - Exigibilidade suspensa
10 - 13º. Salário - por decisão judicial
11 - 13º. Salário - exigibilidade suspensa
12 - Por decisão judicial - Anos anteriores
13 - Deduções - exigibilidade suspensa
14 - IRRF - exigibilidade suspensa
15 - 13º Salário - decisão judicial anos anteriores
16 - 13º Salário - Deduções exigibilidade suspensa
17 - 13º Salário - IRRF exigibilidade suspensa
18 - Contribuição Oficial
19 - Dedução de Dependente
20 - Pensão Alimentícia
21 - Contribuição Previdência Privada
22 - 13º Contribuição Oficial
23 - 13º Dedução de Dependente
24 - 13º Pensão Alimentícia
25 - 13º Contribuição Previdência Privada
26 - Imposto de Renda Informativo
27 - Isenção 65 anos
28 - Molestia Grave
30 - 13º. Imposto de Renda Informativo
31 - 13º. Salário Isenção 65 anos
32 - 13º. Salário Molestia Grave
34 - Ajuda de Custo/Diarias
35 - Indenizações, Recisões e Acidente Trabalho
36 - Abono Pecuniario
37 - RRA - Rendimento Bruto
38 - RRA - IRRF
39 - RRA - Moléstia Grave
40 - RRA - Pensão Alimentícia
41 - RRA - 13º Rendimento
42 - RRA - 13º Rendimento - Molestia Grave
}

Unit uCtrlGeraDIRF_Novo;

Interface

Uses Sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient, Classes,
  ucmFileUtils, wwQuery, Dialogs, Mask, Controls, uMensErro, uDiasUteis, uFuncoesUteisIR,
  DBaseDados, FProgresso, Forms, uCMTypes, uCmClientDataSet, uCmSqlParams, fAguarde;

Const
  sTerminador = ''; // EOL - HEXADECIMAL '0D0A'

  // Paulo Nobre SOL 269633 PPM 1337929
// Paulo Nobre - SOL 269130 PPM 1284502
// Paulo Nobre - SOL 263296 PPM 1268948

  // Denis Horongoso SIG 61375 - Inicio
  sNumVersaoLayout = 'Q84FV63'; // Versão do layout da RF 2017/2018
  // Denis Horongoso SIG 61375 - Fim

  // Paulo Nobre SIG 34459 - Inicio
  //sNumVersaoLayout = 'P49VS72'; // Versão do layout da RF 2016/2017  // Denis Horongoso SIG 61375
  // Paulo Nobre SIG 34459 - Fim

//  sNumVersaoLayout = 'L35QJS2'; // Versão do layout da RF 2015/2016
//  sNumVersaoLayout = 'M1LB5V2'; // Versão do layout da RF 2014/2015
//   sNumVersaoLayout = '7C2DE7J'; // Versão do layout da RF 2013/2014

  sNumVersaoLayout2021 = 'XJFSFHB'; // Versão do layout da RF 2021/2022  //Everson Cunha - SIG122494
  sNumVersaoLayout2020 = 'VR4QLM8'; // Versão do layout da RF 2020/2021  //edilaine SIG113859
  //Cássio Rovaroto - SIG nº 80605 - Início
  sNumVersaoLayout2019 = 'AT65HD8'; // Versão do layout da RF 2019/2020
  sNumVersaoLayout2018 = 'T17BS45'; // Versão do layout da RF 2018/2019
  sNumVersaoLayout2017 = 'Q84FV63'; // Versão do layout da RF 2017/2018
  sNumVersaoLayout2016 = 'P49VS72'; // Versão do layout da RF 2016/2017
  sNumVersaoLayout2015 = 'L35QJS2'; // Versão do layout da RF 2015/2016
  sNumVersaoLayout2014 = 'M1LB5V2'; // Versão do layout da RF 2014/2015
  sNumVersaoLayout2013 = '7C2DE7J'; // Versão do layout da RF 2013/2014
  //Cássio Rovaroto - SIG nº 80605 - Fim

Type
  TCtrlGeraDIRF_Novo = Class(TCmControlObject)

  Private
    ArquivoEnvioRFB: TextFile;
    cdsDepPlanos: TClientDataSet;
    _cdsMovimentoFF: TClientDataSet;
    _cdsDIRFMovSintCNPJ: TClientDataSet;
    
    function GetVersaoLeiaute(pAno: string): String;

  Protected
    Procedure DoChangeDataBase; Override;

  Public
    sNumVersaoSoft: String;
    sTipoDIRF: String;
    sExercicioDIRF: String;
    sNomeGrupo: String;
    iGrupo: Integer;
    iIdDIRF: Integer;
    iIdDIRFAnt: Integer;

    Constructor Create; Override;
    Destructor Destroy; Override;

    Function CompletaZero(sNome: String; iTam: integer): String;
    Function CompletaEspaco(sNome: String; iTam: integer): String;
    Function TiraMascara(wTexto: String): String;
    Function PadLeft(aStr: String; aSize: Integer; aCh: char = ' '): String;
    Function PadRight(aStr: String; aSize: Integer; aCh: char = ' '): String;
    Function ValidaNumeroRecibo(pNumero: String): Boolean;
    Function AcharTexto(sTag, sString: String): boolean;
    Function PrepararFloat(sString: String): String;
    Function PegaValorDoCampo(sTag, sLinha: String): String;
    Function TrocaTexto(sString: String; sOld: String; sNew: String; bInsensitive: boolean = true): String;
    Function CaracteresEspeciais(Const sTexto: String; Const bDesconsideraEmail: Boolean = false): String;
    Function SubstCarEspeciais(Const pString: String): String;
    Function AjustaNome(Const pNome: String; Const pTamanho: Integer): String;
    Function ajustaCaracteresNome(sNome: String): String;
    Function ChecaSeNumero(Const pCampo: String): Boolean;
    //
    // *********************************************************************************************************
    //
    Function VerificaGrupoAcesso(IdUsuarioLogin: integer): String;
    Function ListaMovInformesRendimento(pIdDIRF, pAno, pCNPJ: String): OleVariant;
    //
    Function GerarDIRFAnual(Const pAno, pTipoDIRF: String; pVersaoLeiuate: String =  ''): Boolean;
    //
    // ******** Inserções da Original
    //
    Function InserirDIRF_MovAnalitico_O(Const pIdDIRF: Integer; pAno, pTipoCriacao: String): Boolean;
    Function InserirDIRF_MovAnalitico_O_FF(Const pIdDIRF: Integer; pAno, pTipoCriacao, pCPF: String): Boolean;
    Function InserirDIRF_MovAnalFF_Depen(Const pIdDIRF: Integer; pAno, pCPF: String): Boolean;
    Function InserirDIRF_DadosAdicionais_O(Const pIdDIRF: Integer): Boolean;
    Function InserirDIRF_MovAnalitico_O_Manual(Const pIdDIRF, pIdLANCIRRF: Integer; pAno: String): Boolean;
    //
    // ******** Inserções da Retificadora
    //
    Function InserirDIRF_MovAnalitico_R(Const pIdDIRF, pIdDIRF2: Integer): Boolean;
    Function InserirDIRF_MovAnaliticoFF_R(Const pIdDIRF, pIdDIRF2: Integer): Boolean;
    Function InserirDIRF_MovAnalFF_Depen_R(Const pIdDIRF, pIdDIRF2: Integer): Boolean;
    Function InserirDIRF_DadosAdicionais_R(Const pIdDIRF, pIdDIRF2: Integer): Boolean;
    //
    // ******** Localizadores dos Movimentos Gerados
    //
    Function LocalizaDIRF_MovSintTributos: String;
    Function LocalizaDIRF_MovSintCNPJ(Const pIdDIRF: Integer; pNat: String): OleVariant;
    Function LocalizaDIRF_MovSintCNPJMensal: String;
    //Function LocalizaDIRF_MovDetCNPJ: String; //Darivaldo Alencar SIG 23598
    Function LocalizaDIRF_MovDetCNPJ(sOrderBy: String = ''): String; //Darivaldo Alencar SIG 23598

    Function LocalizaDIRF_DadosAdicionais: String;
    Function VerificaSeHaLancamentosNaoGerados(pIdDIRF: Integer; pAno: String): OleVariant;

    Function ListaDIRF_MovSintTributosFF: String;
    Function ListaDIRF_MovSintFF(Const pIdDIRF: Integer; pNat: String): OleVariant;
    Function ListaDIRF_MovResumo(Const pIdDIRF: Integer; pNat, pCPF: String): String;
    Function ListaDIRF_MovDetFF(Const pIdDIRF: Integer; pNat, pCPF: String): String;
    //Cássio Rovaroto - SIG nº 64340 - Início
    //Function ListaTotalDependentesPlanos(pidDIRF, pTipoPlano: integer; pCPF: String): OleVariant;
    Function ListaTotalDependentesPlanos(pidDIRF, pTipoPlano: integer; pCPF: String; pAnoDIRF: integer = 0; pIdPlanoSaude: integer = 0; pCodNatureza: string = ''): OleVariant;
    //Cássio Rovaroto - SIG nº 84634
    //function ListaTotalDependentesPlanosNova(pidDIRF, pTipoPlano: integer; pCPF: String; pCodNatureza: string = ''): OleVariant;                                                 // SIG 97984 Tiago Von
    function ListaTotalDependentesPlanosNova(pidDIRF, pTipoPlano: integer; pCPF: String; pCodNatureza: string = ''; AnoDIRF: integer = 0; pIDPlanoSaude: Integer = 0): OleVariant; // SIG 97984 Tiago Von
    //Cássio Rovaroto - SIG nº 64340 - Fim
    Function ListaDadosDependentesPlanos(pidDIRF, pTipoPlano: integer; pCPFT, pCPFD, pNomeDepen: String; pCodNatureza: String = ''): OleVariant;
    Function ListaDadosBeneficiarioPA(pidDIRF: integer; pNatur, pCPFTit: String): OleVariant;
    //
    // *********************** INÍCIO DAS FUNÇÕES DE EXPORTAÇÃO DO ARQUIVO *********************************
    //
    Procedure AtualizaFrmProgresso(Var iContador: integer);
    Function CriaArquivo(pArquivo: String): Boolean;
    Function AjustaValor(pValor: double): double;

    Function Exporta(
      pTipoMov,
      pNomeArquivoCompleto,
      pGeraArqComMovFF,
      pGeraArqComMovFB: String;
      pQryDIRFGeradas,
      pQryDIRFMovSintTributos,
      pQryDadosAdicionais,
      pQryDIRFMovSintTributosFF: TwwQuery;
      // Paulo Nobre SIG 34459 - Inicio
          //      pQryDIRFMovDetFF: TwwQuery;
          //      pCdsDIRFMovSintCNPJ,
          //      pCdsDIRFMovSintFF,
      // Paulo Nobre SIG 34459 - Fim
      pCdsDepPlanoSaudeTot,
      pCdsDepPlanoOdontoTot: TCMClientDataSet): Boolean;

    Procedure GRegDadosPrincipais(
      Const pArquivo: TextFile;
      pAno,
      pAnoRef,
      pTipoDIRF,
      pNumeroRecibo,
      pQualificacaoPJ,
      pEfetuouPagExterior,
      pEfetuouPagAssSaude,
      pCPFResp,
      pNomeResp,
      pDDDResp,
      pTelResp,
      pEmailResp,
      pCNPJEmpresa,
      pNomeEmpresa,
      pCPFRepres: String);

    Procedure GRegNatureza(
      Const pArquivo: TextFile;
      sNatureza: String);

    Procedure GravaLinhaValores(
      Const pArquivo: TextFile;
      pTipoLinha: String;
      pVl1, pVl2, pVl3, pVl4, pVl5, pVl6, pVl7, pVl8, pVl9, pVl10, pVl11, pVl12, pVl13: Double);

    // Denis Horongoso SIG 61375 - Inicio
    Procedure GRegBeneficiario(
      Const pArquivo: TextFile;
      pTipoLinha,
      pDocumento,
      pNome,
      pAlimentando,
      pPrevCompl: String);
    // Denis Horongoso SIG 61375 - Fim

    Procedure GravaLinhaIdentificadoraDosPlanos(
      Const pArquivo: TextFile);

    Procedure GravaLinhaPlanoSaudeEOdontologico(
      Const pArquivo: TextFile;
      pCNPJPlano,
      pNomePlano,
      pANSPlano: String);

    Procedure GravaLinhaTitular(
      Const pArquivo: TextFile;
      pCPF,
      pNome: String;
      pValor: Double);

    Procedure GravaLinhasDependentes(
      Const pArquivo: TextFile;
      pCPF,
      pNome,
      pDepend: String;
      pDataNasc: TDateTime;
      pValor: Double);

    Procedure GravaLinhasPreviComp(
      Const pArquivo: TextFile;
      pTipoLinha,
      pCNPJFund,
      pNomeFund: String);

    Procedure GravaLinhasDependentesPA(
      Const pArquivo: TextFile;
      pTipoLinha,
      pCPF,
      pNome,
      pDepend,
      pDataNasc: String);

    Procedure InserirLinhasArquivoTempDIRF(
      p0: Integer;
      p1,
      p2,
      p3: String;
      p4: Integer;
      p5, p6, p7, p21, p22, p23: String;
      p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20: Double);

    procedure GeraDadosPlanoOdontologico(pQryDIRFMovSintTributosFF: TwwQuery; pCNPJPlano, pNomePlano, pANSPlano: String);
    procedure GeraDadosPlanoSaude(pQryDIRFMovSintTributosFF: TwwQuery; pIDPlanoSaude: Integer; pCNPJPlano, pNomePlano, pANSPlano: String);

    //
    // *********************** FIM DAS FUNÇÕES DE EXPORTAÇÃO DO ARQUIVO *********************************
    //
  Protected

  End;

Implementation
{ TCtrlGeraDIRF_Novo }

Var _qryInserirLinhasArquivoTempDIRF: Twwquery;

Constructor TCtrlGeraDIRF_Novo.Create;
Begin
  Inherited;
  sNumVersaoSoft := ''; // Versão do software da RF
  cdsDepPlanos := TClientDataSet.create(Nil);
  _qryInserirLinhasArquivoTempDIRF := Twwquery.Create(Nil);
  _qryInserirLinhasArquivoTempDIRF.DataBaseName := 'BaseDados';
  _CdsMovimentoFF := TClientDataSet.Create(Nil);
  _cdsDIRFMovSintCNPJ := TClientDataSet.Create(Nil);
End;

Destructor TCtrlGeraDIRF_Novo.Destroy;
Begin
  Inherited;
  FreeAndNil(cdsDepPlanos);
  FreeAndNil(_qryInserirLinhasArquivoTempDIRF);
  FreeAndNil(_CdsMovimentoFF);
  FreeAndNil(_cdsDIRFMovSintCNPJ);
End;

Procedure TCtrlGeraDIRF_Novo.DoChangeDataBase;
Begin
  Inherited;
End;

//******************** FUNÇÕES BÁSICAS USADAS NA GERAÇÃO DO ARQUIVO *****************************
//


Function TCtrlGeraDIRF_Novo.CompletaEspaco(sNome: String; iTam: integer): String;
Var
  i, k: integer;
  Espacos: String;
Begin
  If Length(sNome) > iTam Then sNome := Copy(sNome, 1, iTam);

  sNome := trim(sNome);
  i := length(sNome);
  Espacos := '';
  For k := 1 To (iTam - i) Do
    Espacos := Espacos + ' ';

  Result := sNome + Espacos;
End;

Function TCtrlGeraDIRF_Novo.CompletaZero(sNome: String; iTam: integer): String;
Var i, k: integer;
Begin
  If Length(sNome) > iTam Then sNome := Copy(sNome, 1, iTam);

  sNome := trim(sNome);
  i := length(sNome);
  Result := '';
  For k := 1 To (iTam - i) Do
    Result := Result + '0';
  Result := Result + sNome;
End;

Function TCtrlGeraDIRF_Novo.PadLeft(aStr: String; aSize: Integer; aCh: char = ' '): String;
Begin
  While Length(aStr) < aSize Do
    aStr := aCh + aStr;

  Result := aStr;
End;

Function TCtrlGeraDIRF_Novo.TiraMascara(wTexto: String): String;
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

Function TCtrlGeraDIRF_Novo.PadRight(aStr: String; aSize: Integer; aCh: char): String;
Begin
  While Length(aStr) < aSize Do
    aStr := aStr + aCh;

  Result := aStr;
End;

Function TCtrlGeraDIRF_Novo.AcharTexto(sTag, sString: String): boolean;
Begin
  Result := Pos(UpperCase(sTag), UpperCase(sString)) > 0;
End;

Function TCtrlGeraDIRF_Novo.PrepararFloat(sString: String): String;
Begin
  Result := sString;
  Result := TrocaTexto(Result, '.', DecimalSeparator);
  Result := TrocaTexto(Result, ',', DecimalSeparator);
End;

Function TCtrlGeraDIRF_Novo.PegaValorDoCampo(sTag, sLinha: String): String;
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

Function TCtrlGeraDIRF_Novo.TrocaTexto(sString: String; sOld: String; sNew: String; bInsensitive: boolean = true): String;
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

Function TCtrlGeraDIRF_Novo.CaracteresEspeciais(Const sTexto: String;
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

Function TCtrlGeraDIRF_Novo.SubstCarEspeciais(Const pString: String): String;
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

Function TCtrlGeraDIRF_Novo.AjustaNome(Const pNome: String; Const pTamanho: Integer): String;
Var nTamanho: integer;
Begin
  Result := Trim(pNome);
  nTamanho := length(Result);
  If nTamanho < pTamanho Then
    result := Result + StringOfChar(' ', (pTamanho - nTamanho))
  Else
    Result := Copy(Result, 1, pTamanho);
End;

Function TCtrlGeraDIRF_Novo.AjustaCaracteresNome(sNome: String): String;
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
  result := sResultado;
End;

Function TCtrlGeraDIRF_Novo.ChecaSeNumero(Const pCampo: String): Boolean;
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

Function TCtrlGeraDIRF_Novo.ValidaNumeroRecibo(pNumero: String): Boolean;
Var
  Recibo: Array[1..12] Of integer;
  apoio: Array[0..12] Of integer;
  f: integer;
  total: integer;
  D1: integer; //primeiro dígito calculado
  D2: integer; //segundo dígito calculado
Begin
  If pNumero = '' Then
    Begin
      result := True; // Para permitir estornar um numero de recibo informado
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
      //os algarismos do CNPJ e depois uma matriz apoio) que terá os números
      //que ajudarão a verificar so dígitos verificadores
      //
      //Monta matriz Recibo
      For f := 1 To 12 Do
        Recibo[f] := strtoint(pNumero[f]);
    End;
  // Monta matriz de apoio - Módulo 11 com pesos de 2 a 9 da direita p/ esquerda
  apoio[0] := 4; //só será usada no cálculo do segundo dígito verificador
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
  total := 0; // variável que conterá a soma da operação com os números
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

Function TCtrlGeraDIRF_Novo.VerificaGrupoAcesso(IdUsuarioLogin: integer): String;
Var qryAux: Twwquery;
Begin
  // SOL 240461  PPM 550386 - Paulo Nobre
  result := '';
  qryAux := Twwquery.Create(Nil);
  qryAux.DataBaseName := 'BaseDados';
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('select g.idusuario, g.idgrupo, ga.nomegrupo ');
  qryAux.SQL.Add('from grupousu g, grupoacesso ga             ');
  qryAux.SQL.Add('WHERE g.idgrupo = ga.idgrupo                ');
  qryAux.SQL.Add('      and g.idusuario = ' + IntToStr(IdUsuarioLogin));
  qryAux.SQL.Add('      and ga.idgrupo IN (977, 979) ');
  qryAux.Open;
  If Not qryAux.EOF Then
    Begin
      sNomeGrupo := qryAux.fieldbyname('nomegrupo').asString;
      Case qryAux.fieldbyname('idgrupo').asInteger Of
        977: Result := 'FF'; // 'IMPOSTO-REST-DIRF_FE' - Folha de empregados
        979: Result := 'CP'; // 'IMPOSTO-REST-TRIBUTO' - Contas a Pagar
      End;
    End;

  FreeAndNil(qryAux);
End;

// ***************************************************************************************************************
// Funções usadas no Form de Geração da DIRF
// ***************************************************************************************************************

Function TCtrlGeraDIRF_Novo.GerarDIRFAnual(Const pAno, pTipoDIRF: String; pVersaoLeiuate: String =  ''): Boolean;
Var sNumRecAnt: String;
  _qryAux, _qryAux2, _qryInserirDIRF: TwwQuery;
Begin
  Result := True;
  MessageInfo := '';
  iIdDIRFAnt := 0;
  sNumRecAnt := '000000000000';
  _qryAux := TwwQuery.Create(Nil);
  _qryAux2 := TwwQuery.Create(Nil);
  _qryInserirDIRF := TwwQuery.Create(Nil);

  _qryAux.DatabaseName := DataBaseName;
  _qryAux2.DatabaseName := DataBaseName;
  _qryInserirDIRF.DatabaseName := DataBaseName;

  If pTipoDIRF = 'R' Then
    Begin
      // Retificadora, deve ser recuperado os dados da ultima declaração (O ou R) (MAX) dentro do ano + mes !!!
      _qryAux2.Close;
      _qryAux2.SQL.Clear;
      _qryAux2.SQL.add('SELECT D.IDDIRF, D.NUMRECIBO, D.NUMRECIBOANT   ');
      _qryAux2.SQL.add('FROM DIRF D      ');
      _qryAux2.SQL.add('WHERE D.IDDIRF = (SELECT MAX(D1.IDDIRF)  ');
      _qryAux2.SQL.add('                  FROM DIRF D1                 ');
      _qryAux2.SQL.add('                  WHERE D1.EXERCICIODIRF = ' + quotedstr(pAno) + ' )');
      _qryAux2.Open;
      Result := (Not _qryAux2.EOF);
      iIdDIRFAnt := _qryAux2.fieldByname('IDDIRF').asInteger;
      sNumRecAnt := _qryAux2.fieldByname('NUMRECIBO').asString;
    End;

  _qryAux.Close;
  _qryAux.SQL.Clear;
  _qryAux.SQL.add('SELECT SEQDIRF.NEXTVAL SEQ FROM DUAL    ');
  _qryAux.Open;

  // Inserindo DIRF
  _qryInserirDIRF.Close;
  _qryInserirDIRF.SQL.Clear;
  _qryInserirDIRF.SQL.add('INSERT INTO DIRF                                                          ');
  _qryInserirDIRF.SQL.add('(IDDIRF, EXERCICIODIRF, TIPODIRF, NUMRECIBOANT, GRUPOGERADOR, IDDIRFANT,  ');
  _qryInserirDIRF.SQL.add(' NUMVERSAOSOFT, NUMVERSAOLAYOUT, FLGARQUIVOGERADO, FLGREGEXCLUIDO, FLGDIRFFINALIZADAFF )  ');
  _qryInserirDIRF.SQL.add('VALUES (:p1, :p2, :p3, :p4, :p5, :p6, :p7, :p8, :p9, :p10, :p11)                ');
  _qryInserirDIRF.ParamByName('p1').asInteger := _qryAux.fieldByname('SEQ').asInteger;
  _qryInserirDIRF.ParamByName('p2').asString := pAno;
  _qryInserirDIRF.ParamByName('p3').asString := pTipoDIRF;
  _qryInserirDIRF.ParamByName('p4').asString := sNumRecAnt;
  _qryInserirDIRF.ParamByName('p5').asString := sNomeGrupo;
  _qryInserirDIRF.ParamByName('p6').asInteger := iIdDIRFAnt;
  _qryInserirDIRF.ParamByName('p7').asString := sNumVersaoSoft; // Versão do software da RF
  //Cássio Rovaroto - SIG nº 80605 - Início
  //_qryInserirDIRF.ParamByName('p8').asString := sNumVersaoLayout; // Versão do layout da RF
  //Cássio Rovaroto - SIG n 113911 - Início
  //_qryInserirDIRF.ParamByName('p8').asString := GetVersaoLeiaute(pAno); // Versão do layout da RF
  _qryInserirDIRF.ParamByName('p8').asString := pVersaoLeiuate;
  //Cássio Rovaroto - SIG n 113911 - Fim
  //Cássio Rovaroto - SIG nº 80605 - Fim
  _qryInserirDIRF.ParamByName('p9').asString := 'N'; // Arquivo não gerado;
  _qryInserirDIRF.ParamByName('p10').asString := 'N'; // Reg. não excluido
  _qryInserirDIRF.ParamByName('p11').asString := 'N'; // DIRF FF não analisada
  If Not _qryInserirDIRF.Prepared Then
    _qryInserirDIRF.Prepare;
  _qryInserirDIRF.ExecSQL;
  If _qryInserirDIRF.RowsAffected > 0 Then
    Begin
      sTipoDIRF := pTipoDIRF;
      sExercicioDIRF := pAno;
      iIdDIRF := _qryAux.fieldByname('SEQ').asInteger;
      Result := True;
    End
  Else
    Result := False;

  _qryAux.Close;
  _qryAux2.Close;
  _qryAux.free;
  _qryAux2.free;
  _qryInserirDIRF.free;
End;

Function TCtrlGeraDIRF_Novo.InserirDIRF_MovAnalitico_O(Const pIdDIRF: Integer; pAno, pTipoCriacao: String): Boolean;
Var sSql: String;
Begin
  Result := True;
  // Paulo Nobre - SOL 226868 KTN 2060896 19/02/2014
  // SOL 228028  KTN 2062085 - Paulo Nobre

  // TODOS OS IMPOSTOS QUE ESTÃO NA LANCIRRF
  sSql := 'INSERT INTO DIRF_MOVANALITICO            ';
  sSql := sSql + 'SELECT ' + inttostr(pIdDIRF) + ', SEQDIRFMOVANALITICO.NEXTVAL, MOV.* ';
  sSql := sSql + 'FROM (                                         ';
  sSql := sSql + 'SELECT TO_CHAR(L.DATAPAGAMENTO, ''YYYY''), '; // EXERCICIODIRF
  sSql := sSql + '      L.CODNATUREZA,         ';
  sSql := sSql + '      L.IDDARF,              ';
  sSql := sSql + '      L.IDLANCIRRF,          ';
  sSql := sSql + '      L.DATALANCAMENTO,      ';
  sSql := sSql + '      L.DATAPAGAMENTO,       ';
  sSql := sSql + '      P.IDPESSOA,            ';
  sSql := sSql + '      P.NUMDOCUMENTO,        '; // CNPJ
  sSql := sSql + '      P.RAZAOSOCIAL,         ';
  sSql := sSql + '      L.CODDOCUMENTO,        ';
  sSql := sSql + '      D.NODOCUMENTO,         ';
  sSql := sSql + '      D.NUMAPGR,             ';
  sSql := sSql + '      L.VLRBASE VLRRENDIMENTO,             ';
  sSql := sSql + '      SUM(DECODE(L.CODNATUREZA, ''5952'', L.VLRPIS + L.VLRCSCOFPIS, L.VLRIRRF)) VLRIRRF,  '; // VLR IMPOSTO
  sSql := sSql + '      ' + QuotedStr(pTipoCriacao) + ',';
  sSql := sSql + '      ''S'',                 '; // FLGMARCADO
  sSql := sSql + '      SYSDATE,               ';
  sSql := sSql + '      USER                   ';
  sSql := sSql + 'FROM LANCIRRF L    ';
  sSql := sSql + '     LEFT JOIN DOCUMENTO D ON D.CODDOCUMENTO = L.CODDOCUMENTO   ';
  sSql := sSql + '     JOIN NATURENDIMENTO N ON N.CODNATUREZA = L.CODNATUREZA     ';
  sSql := sSql + '     JOIN PESSOA P ON P.IDPESSOA = L.IDBENEFIRRF                ';
  //Cássio Rovaroto -  SIG nº 132249 - Início
  //sSql := sSql + 'WHERE TO_CHAR(L.DATAPAGAMENTO, ''YYYY'') = ' + quotedstr(pAno);
  //sSql := sSql + '      AND L.CODNATUREZA IN (''0588'', ''1708'', ''5952'', ''8045'')  ';
  sSql := sSql + 'WHERE ((TO_CHAR(L.DATAPAGAMENTO, ''YYYY'') = ' + quotedstr(pAno);
  sSql := sSql + '        AND L.CODNATUREZA IN (''0588'', ''5952'')) OR ';
  sSql := sSql + '       ((TO_CHAR(L.DATAPAGAMENTO, ''YYYY'') >= ' + quotedstr(pAno) + ' AND ';
	sSql := sSql + '        (TO_CHAR(L.DATALANCAMENTO, ''YYYY'') = ' + quotedstr(pAno);
  sSql := sSql + '      AND L.CODNATUREZA IN (''1708'', ''8045''))))) ';
  //Cássio Rovaroto -  SIG nº 132249 - Fim
  sSql := sSql + '      AND DECODE(L.CODNATUREZA, ''5952'', L.VLRPIS + L.VLRCSCOFPIS, L.VLRIRRF) <> 0  ';
  sSql := sSql + '      AND NVL(N.FLGUSADONADIRF, ''S'') = ''S''                                       ';
  sSql := sSql + '      AND (L.IDMODULO <> 21 AND L.IDMODULO <> 18)          '; // Não trazer movimento das folhas

//  sSql := sSql + '      AND trim(L.numdocumento) IN (''69342903134'',  ''01842345907'', ''93146779668'', ''05989881495'', ''90806603100'' )' ;   //XXX

  sSql := sSql + 'GROUP BY TO_CHAR(L.DATAPAGAMENTO, ''YYYY''),               ';
  sSql := sSql + '          L.CODNATUREZA,                                   ';
  sSql := sSql + '          L.IDDARF,                                        ';
  sSql := sSql + '          L.IDLANCIRRF,                                    ';
  sSql := sSql + '          L.DATALANCAMENTO,                                ';
  sSql := sSql + '          L.DATAPAGAMENTO,                                 ';
  sSql := sSql + '          P.IDPESSOA,                                      ';
  sSql := sSql + '          P.NUMDOCUMENTO,                                  ';
  sSql := sSql + '          P.RAZAOSOCIAL,                                   ';
  sSql := sSql + '          L.CODDOCUMENTO,                                  ';
  sSql := sSql + '          D.NODOCUMENTO,                                   ';
  sSql := sSql + '          D.NUMAPGR,                                       ';
  sSql := sSql + '          L.VLRBASE                                        ';

  sSql := sSql + 'UNION ALL   ';

  // SOMENTE PAGAMENTOS QUE NÃO TIVERAM IMPOSTO, MAS TEM QUE IR PARA A DIRF

  // Para trazer os pagamentos correspondente ao Tributo '1708'
  sSql := sSql + 'SELECT SEG.* FROM (                              ';
  sSql := sSql + 'SELECT TO_CHAR(R.DATABAIXA, ''YYYY''),  ';
  sSql := sSql + '       DECODE(LENGTH(TRIM(P.NUMDOCUMENTO)), 11, ''0588'', ''1708'') CODNATUREZA, ';
  sSql := sSql + '       NULL IDDARF,                              ';
  sSql := sSql + '       NULL IDLANCIRRF,                          ';
  sSql := sSql + '       LD.DATALANCTO,                            ';
  sSql := sSql + '       R.DATABAIXA,                              ';
  sSql := sSql + '       D.IDFORCLI IDPESSOA,                      ';
  sSql := sSql + '       P.NUMDOCUMENTO,                           ';
  sSql := sSql + '       P.RAZAOSOCIAL,                            ';
  sSql := sSql + '       D.CODDOCUMENTO,                           ';
  sSql := sSql + '       D.NODOCUMENTO,                            ';
  sSql := sSql + '       D.NUMAPGR,                                ';
  sSql := sSql + '       LD.VALOR VLRRENDIMENTO,                   ';
  sSql := sSql + '       0.00 VLRIRRF,                             ';
  sSql := sSql + '      ' + QuotedStr(pTipoCriacao) + ',';
  sSql := sSql + '      ''S'',                 '; // FLGMARCADO
  sSql := sSql + '      SYSDATE,               ';
  sSql := sSql + '      USER                   ';
  sSql := sSql + 'FROM DOCUMENTO D    ';
  sSql := sSql + '     JOIN LANCTODOCUM LD ON LD.CODDOCUMENTO = D.CODDOCUMENTO      ';
  sSql := sSql + '     JOIN RATEIODOCUM RD ON RD.CODDOCUMENTO = D.CODDOCUMENTO      ';
  sSql := sSql + '     JOIN RECBTOPAGTO R ON R.CODDOCUMENTO = D.CODDOCUMENTO        ';
  sSql := sSql + '     JOIN PESSOA P ON P.IDPESSOA = D.IDFORCLI                 ';
  sSql := sSql + 'WHERE D.STATUS = ''2''      '; // Baixado/pago
  sSql := sSql + '      AND D.NUMAPGR IS NOT NULL  ';
  sSql := sSql + '      AND D.RECPAG = ''P''        '; // Somente do Contas a Pagar
  sSql := sSql + '      AND LD.VALOR <> 0           ';
  sSql := sSql + '      AND LD.OPERACAO = ''2''     '; // Apropriação
  sSql := sSql + '      AND TO_CHAR(R.DATABAIXA, ''YYYY'') = ' + quotedstr(pAno);
  //------------------------ Desembolsos informados pelo Gestor da CONTAB ------------------------
  sSql := sSql + '      AND (TRIM(RD.CODTIPRECDES) NOT IN (                                    ';
  sSql := sSql + '          ''0020024'', ''20027'',''20028'',''20029'',''20030'',''20031'',    ';
  sSql := sSql + '          ''20032'',''20033'',''20048'',''20050'',''20053'',''20055'',       ';
  sSql := sSql + '          ''20085'',''20086'',''20095'',''50029'',''50031'',''50034'',       ';
  sSql := sSql + '          ''50035'',''50036'',''50037'',''50048'',''50050'',''50051'',       ';
  sSql := sSql + '          ''50052'',''50053'',''50054'',''60007'',''1010041'',''1020026'',   ';
  sSql := sSql + '          ''1020027'',''1020028'',''1020029'',''1020030'',''1020043'',       ';
  sSql := sSql + '          ''1020059'',''1050009'',''1050010'',''1050077'',''1050078'',       ';
  sSql := sSql + '          ''1050084'',''1050104'',''1070062'',''1080001'', ''1080002'',       ';
  sSql := sSql + '          ''1080004'', ''1080005'', ''1080006'', ''1080007'', ''1080008'',   ';
  sSql := sSql + '          ''1080009'', ''1080010'', ''1080011'') AND RD.RECPAG = ''P'')      ';
  //--------------------------------------------------------------------------------------------
  sSql := sSql + ' GROUP BY TO_CHAR(R.DATABAIXA, ''YYYY''),  ';
  sSql := sSql + ' 			DECODE(LENGTH(TRIM(P.NUMDOCUMENTO)), 11, ''0588'', ''1708''), ';
  sSql := sSql + ' 			LD.DATALANCTO, 												  ';  
  sSql := sSql + ' 			R.DATABAIXA,												  ';
  sSql := sSql + ' 			D.IDFORCLI,													  ';
  sSql := sSql + ' 			P.NUMDOCUMENTO,												  ';
  sSql := sSql + ' 			P.RAZAOSOCIAL,												  ';
  sSql := sSql + ' 			D.CODDOCUMENTO,                                               ';
  sSql := sSql + ' 			D.NODOCUMENTO,												  ';
  sSql := sSql + ' 			D.NUMAPGR, 												   	  ';
  sSql := sSql + ' 			LD.VALOR,													  ';
  sSql := sSql + ' 			SYSDATE,													  ';
  sSql := sSql + ' 			USER) SEG                                                	  ';
  sSql := sSql + 'WHERE SEG.CODDOCUMENTO NOT IN (SELECT LI.CODDOCUMENTO                               	';
  sSql := sSql + '                    FROM LANCIRRF LI                                                  ';
  sSql := sSql + '                    WHERE LI.IDBENEFIRRF = SEG.IDPESSOA                               ';
  sSql := sSql + '                          AND LI.CODDOCUMENTO IS NOT NULL                             ';
  sSql := sSql + '                          AND TO_CHAR(LI.DATAPAGAMENTO, ''YYYY'') = ' + quotedstr(pAno);
  sSql := sSql + '                          AND LI.CODNATUREZA IN (''0588'', ''1708'')                	';
  sSql := sSql + '                          AND LI.VLRIRRF <> 0 )                                       ';
  sSql := sSql + '      AND SEG.CODNATUREZA IN (SELECT LI.CODNATUREZA  									';
  sSql := sSql + '                    FROM LANCIRRF LI                                                  ';
  sSql := sSql + '                    WHERE LI.IDBENEFIRRF = SEG.IDPESSOA                               ';
  sSql := sSql + '                          AND LI.CODDOCUMENTO IS NOT NULL                             ';
  sSql := sSql + '                          AND TO_CHAR(LI.DATAPAGAMENTO, ''YYYY'') = ' + quotedstr(pAno);
  sSql := sSql + '                          AND LI.CODNATUREZA IN (''0588'', ''1708'')                  ';
  sSql := sSql + '                          AND LI.VLRIRRF <> 0 ) 										';
  sSql := sSql + 'UNION ALL   ';

  // Para trazer os pagamentos (Valor do Rendimento) correspondeNte ao Tributo '5952' (PIS/COFINS)
  sSql := sSql + 'SELECT SEG2.* FROM (                                  ';
  sSql := sSql + 'SELECT TO_CHAR(R.DATABAIXA, ''YYYY''),  ';
  sSql := sSql + '       DECODE(LENGTH(TRIM(P.NUMDOCUMENTO)), 11, ''0588'', ''5952'') CODNATUREZA, ';
  sSql := sSql + '       NULL IDDARF,                              ';
  sSql := sSql + '       NULL IDLANCIRRF,                          ';
  sSql := sSql + '       LD.DATALANCTO,                            ';
  sSql := sSql + '       R.DATABAIXA,                              ';
  sSql := sSql + '       D.IDFORCLI IDPESSOA,                      ';
  sSql := sSql + '       P.NUMDOCUMENTO,                           ';
  sSql := sSql + '       P.RAZAOSOCIAL,                            ';
  sSql := sSql + '       D.CODDOCUMENTO,                           ';
  sSql := sSql + '       D.NODOCUMENTO,                            ';
  sSql := sSql + '       D.NUMAPGR,                                ';
  sSql := sSql + '       LD.VALOR VLRRENDIMENTO,                   ';
  sSql := sSql + '       0.00 VLRIRRF,                             ';
  sSql := sSql + '      ' + QuotedStr(pTipoCriacao) + ',';
  sSql := sSql + '      ''S'',                 '; // FLGMARCADO
  sSql := sSql + '      SYSDATE,               ';
  sSql := sSql + '      USER                   ';
  sSql := sSql + 'FROM DOCUMENTO D             ';
  sSql := sSql + '     JOIN LANCTODOCUM LD ON LD.CODDOCUMENTO = D.CODDOCUMENTO      ';
  sSql := sSql + '     JOIN RATEIODOCUM RD ON RD.CODDOCUMENTO = D.CODDOCUMENTO      ';
  sSql := sSql + '     JOIN RECBTOPAGTO R ON R.CODDOCUMENTO = D.CODDOCUMENTO        ';
  sSql := sSql + '     JOIN PESSOA P ON P.IDPESSOA = D.IDFORCLI                 ';
  sSql := sSql + 'WHERE D.STATUS = ''2''      '; // Baixado/pago
  sSql := sSql + '      AND D.NUMAPGR IS NOT NULL  ';
  sSql := sSql + '      AND D.RECPAG = ''P''        '; // Somente do Contas a Pagar
  sSql := sSql + '      AND LD.VALOR <> 0            ';
  sSql := sSql + '      AND LD.OPERACAO = ''2''   '; // Apropriação
  sSql := sSql + '      AND TO_CHAR(R.DATABAIXA, ''YYYY'') = ' + quotedstr(pAno);
  //------------------------ Desembolsos informados pelo Gestor da CONTAB ----------------------
  sSql := sSql + '      AND (TRIM(RD.CODTIPRECDES) NOT IN (                                    ';
  sSql := sSql + '          ''0020024'', ''20027'',''20028'',''20029'',''20030'',''20031'',    ';
  sSql := sSql + '          ''20032'',''20033'',''20048'',''20050'',''20053'',''20055'',       ';
  sSql := sSql + '          ''20085'',''20086'',''20095'',''50029'',''50031'',''50034'',       ';
  sSql := sSql + '          ''50035'',''50036'',''50037'',''50048'',''50050'',''50051'',       ';
  sSql := sSql + '          ''50052'',''50053'',''50054'',''60007'',''1010041'',''1020026'',   ';
  sSql := sSql + '          ''1020027'',''1020028'',''1020029'',''1020030'',''1020043'',       ';
  sSql := sSql + '          ''1020059'',''1050009'',''1050010'',''1050077'',''1050078'',       ';
  sSql := sSql + '          ''1050084'',''1050104'',''1070062'',''1080001'', ''1080002'',       ';
  sSql := sSql + '          ''1080004'', ''1080005'', ''1080006'', ''1080007'', ''1080008'',   ';
  sSql := sSql + '          ''1080009'', ''1080010'', ''1080011'') AND RD.RECPAG = ''P'')      ';
  //--------------------------------------------------------------------------------------------
  sSql := sSql + 'GROUP BY TO_CHAR(R.DATABAIXA, ''YYYY''), 							     ';
  sSql := sSql + '		   DECODE(LENGTH(TRIM(P.NUMDOCUMENTO)), 11, ''0588'', ''5952''), ';
  sSql := sSql + '			LD.DATALANCTO, 											 	 ';
  sSql := sSql + '			R.DATABAIXA, 											 	 ';
  sSql := sSql + '			D.IDFORCLI, 											 	 ';
  sSql := sSql + '			P.NUMDOCUMENTO,  										 	 ';
  sSql := sSql + '			P.RAZAOSOCIAL, 											 	 ';
  sSql := sSql + '			D.CODDOCUMENTO, 										 	 ';
  sSql := sSql + '			D.NODOCUMENTO, 											 	 ';
  sSql := sSql + '			D.NUMAPGR, 												 	 ';
  sSql := sSql + '			LD.VALOR, 												 	 ';
  sSql := sSql + '			''A'', 													 	 ';
  sSql := sSql + '			''S'', 													 	 ';
  sSql := sSql + '			SYSDATE, 												 	 ';
  sSql := sSql + '			USER) SEG2 												 	 ';           
  sSql := sSql + ' WHERE SEG2.CODDOCUMENTO NOT IN (SELECT LI.CODDOCUMENTO                      ';
  sSql := sSql + '                    FROM LANCIRRF LI                                         ';
  sSql := sSql + '                    WHERE LI.IDBENEFIRRF = SEG2.IDPESSOA                     ';
  sSql := sSql + '                          AND LI.CODDOCUMENTO IS NOT NULL                    ';
  sSql := sSql + '                          AND TO_CHAR(LI.DATAPAGAMENTO, ''YYYY'') = ' + quotedstr(pAno);
  sSql := sSql + '                          AND LI.CODNATUREZA IN (''0588'', ''5952'')                       ';
  sSql := sSql + '                          AND (LI.VLRPIS + LI.VLRCSCOFPIS) <> 0 )                                      ';
  sSql := sSql + '   AND SEG2.CODNATUREZA IN (SELECT LI.CODNATUREZA               ';
  sSql := sSql + '                    FROM LANCIRRF LI                                                                           ';
  sSql := sSql + '                    WHERE LI.IDBENEFIRRF = SEG2.IDPESSOA                        ';
  sSql := sSql + '                          AND LI.CODDOCUMENTO IS NOT NULL                    ';
  sSql := sSql + '                          AND TO_CHAR(LI.DATAPAGAMENTO, ''YYYY'') = ' + quotedstr(pAno);
  sSql := sSql + '                          AND LI.CODNATUREZA IN (''0588'', ''5952'')                        ';
  sSql := sSql + '                          AND (LI.VLRPIS + LI.VLRCSCOFPIS) <> 0 )                                      ';
  sSql := sSql + '       ) MOV    ';
  CMDebugToFile(#13#10 + sSQL + #13#10);
  If Not ExecSQL(sSQL, true) Then
    Begin
      Result := False;
      Exception.Create(Messageinfo);
    End;
End;

Function TCtrlGeraDIRF_Novo.InserirDIRF_MovAnalitico_O_Manual(Const pIdDIRF, pIdLANCIRRF: Integer; pAno: String): Boolean;
Var sSql: String;
Begin
  Result := True;
  // TODOS OS IMPOSTOS QUE ESTÃO NA LANCIRRF
  sSql := 'INSERT INTO DIRF_MOVANALITICO            ';
  sSql := sSql + 'SELECT ' + inttostr(pIdDIRF) + ', SEQDIRFMOVANALITICO.NEXTVAL, MOV.* ';
  sSql := sSql + 'FROM (                                         ';
  sSql := sSql + 'SELECT TO_CHAR(L.DATAPAGAMENTO, ''YYYY''), '; // EXERCICIODIRF
  sSql := sSql + '      L.CODNATUREZA,         ';
  sSql := sSql + '      L.IDDARF,              ';
  sSql := sSql + '      L.IDLANCIRRF,          ';
  sSql := sSql + '      L.DATALANCAMENTO,      ';
  sSql := sSql + '      L.DATAPAGAMENTO,       ';
  sSql := sSql + '      P.IDPESSOA,            ';
  sSql := sSql + '      P.NUMDOCUMENTO,        '; // CNPJ
  sSql := sSql + '      P.RAZAOSOCIAL,         ';
  sSql := sSql + '      L.CODDOCUMENTO,        ';
  sSql := sSql + '      D.NODOCUMENTO,         ';
  sSql := sSql + '      D.NUMAPGR,             ';
  sSql := sSql + '      L.VLRBASE,             ';
  sSql := sSql + '      SUM(DECODE(L.CODNATUREZA, ''5952'', L.VLRPIS + L.VLRCSCOFPIS, L.VLRIRRF)) VLRIRRF,  '; // VLR IMPOSTO
  sSql := sSql + '      ''M'',                 '; // MANUAL
  sSql := sSql + '      ''S'',                 '; // FLGMARCADO
  sSql := sSql + '      SYSDATE,               ';
  sSql := sSql + '      USER                   ';
  sSql := sSql + 'FROM LANCIRRF L    ';
  sSql := sSql + '     LEFT JOIN DOCUMENTO D ON D.CODDOCUMENTO = L.CODDOCUMENTO   ';
  sSql := sSql + '     JOIN NATURENDIMENTO N ON N.CODNATUREZA = L.CODNATUREZA     ';
  sSql := sSql + '     JOIN PESSOA P ON P.IDPESSOA = L.IDBENEFIRRF                ';
  sSql := sSql + 'WHERE TO_CHAR(L.DATAPAGAMENTO, ''YYYY'') = ' + quotedstr(pAno);
  //Luiz Carlos - SIG67311 - Inicio
  //sSql := sSql + '      AND L.CODNATUREZA IN (''0588'', ''1708'', ''5952'', ''8045'')  ';
  sSql := sSql + '      AND L.CODNATUREZA IN (''0588'', ''1708'', ''5952'', ''8045'',''3208'')  ';
  //Luiz Carlos - SIG67311 - Fim
  // Paulo Nobre - SOL 261135 PPM 1072469 -  10/08/2015
//  sSql := sSql + '      AND DECODE(L.CODNATUREZA, ''5952'', L.VLRPIS + L.VLRCSCOFPIS, L.VLRIRRF) <> 0  '; // Paulo
  sSql := sSql + '      AND (L.IDMODULO <> 21 AND L.IDMODULO <> 18)          '; // Não trazer movimento das folhas
  sSql := sSql + '      AND NVL(N.FLGUSADONADIRF, ''S'') = ''S''             ';

//  sSql := sSql + '      AND trim(L.numdocumento) IN (''69342903134'',  ''01842345907'', ''93146779668'', ''05989881495'', ''90806603100'' )' ;   //XXX

  sSql := sSql + 'GROUP BY TO_CHAR(L.DATAPAGAMENTO, ''YYYY''),               ';
  sSql := sSql + '          L.CODNATUREZA,                                   ';
  sSql := sSql + '          L.IDDARF,                                        ';
  sSql := sSql + '          L.IDLANCIRRF,                                    ';
  sSql := sSql + '          L.DATALANCAMENTO,                                ';
  sSql := sSql + '          L.DATAPAGAMENTO,                                 ';
  sSql := sSql + '          P.IDPESSOA,                                      ';
  sSql := sSql + '          P.NUMDOCUMENTO,                                  ';
  sSql := sSql + '          P.RAZAOSOCIAL,                                   ';
  sSql := sSql + '          L.CODDOCUMENTO,                                  ';
  sSql := sSql + '          D.NODOCUMENTO,                                   ';
  sSql := sSql + '          D.NUMAPGR,                                       ';
  sSql := sSql + '          L.VLRBASE                                        ';
  sSql := sSql + '       ) MOV    ';
  sSql := sSql + 'WHERE MOV.IDLANCIRRF = ' + inttostr(pIdLANCIRRF);
  CMDebugToFile(#13#10 + sSQL + #13#10);
  If Not ExecSQL(sSQL, true) Then
    Begin
      Result := False;
      Exception.Create(Messageinfo);
    End;
End;

Function TCtrlGeraDIRF_Novo.InserirDIRF_DadosAdicionais_O(Const pIdDIRF: Integer): Boolean;
Var sSql: String;
Begin
  Result := True;
  sSql := 'INSERT INTO DIRF_DADOSADICIONAIS  ';
  sSql := sSql + 'SELECT ' + inttostr(pIdDIRF) + ',' + ' EMP.*, REPR.*, RESP.*, SAUDE.*, ODONTO.*, SYSDATE, USER ';
  //Cássio Rovaroto - SIG nº 64340 - Início
  sSql := sSql + '       , SAUDE2.* ';
  //Cássio Rovaroto - SIG nº 64340 - Fim
  sSql := sSql + 'FROM           ';
  sSql := sSql + '(SELECT P.NUMDOCUMENTO,           ';
  sSql := sSql + '               P.RAZAOSOCIAL,     ';
  sSql := sSql + '               P.EMAIL,           ';
  sSql := sSql + '               F.CODFUNDSPC,      ';
  sSql := sSql + '               E.LOGRADOURO,      ';
  sSql := sSql + '               E.NUMERO,          ';
  sSql := sSql + '               E.COMPLEMENTO,     ';
  sSql := sSql + '               E.BAIRRO,          ';
  sSql := sSql + '               E.CEP,             ';
  sSql := sSql + '               C.NOME AS MUNICIPIO,     ';
  sSql := sSql + '               C.UF,                    ';
  sSql := sSql + '               TD.DDD,                  ';
  sSql := sSql + '               TD.NUMERO AS NUMEROTEL,  ';
  sSql := sSql + '               TF.DDD AS DDDFAX,        ';
  sSql := sSql + '               TF.NUMERO AS NUMEROFAX,  ';
  sSql := sSql + '               0 IDQUALIFPJ,          '; // 0 - PF ou PJ de direito privado, exceto Instituição Administradora de Fundo ou Clube de Investimento
  sSql := sSql + '               ''S'' FLGPAGASSSAUDE,  '; // Indicador de plano privado de assistência à saúde - coletivo empresarial
  sSql := sSql + '               ''N'' FLGPAGEXTERIOR   '; // Indicador de declarante de rendimentos pagos a residentes ou domiciliados no exterior
  sSql := sSql + '          FROM FUNDACAO F,            ';
  sSql := sSql + '               PESSOA P,              ';
  sSql := sSql + '               ENDPESS E,             ';
  sSql := sSql + '               CIDADES C,             ';
  sSql := sSql + '               (SELECT IDENDERECO, NUMERO, DDD  ';
  sSql := sSql + '                  FROM TELENDPESS               ';
  sSql := sSql + '                 WHERE TIPO Like ''%C%'') TD,   ';
  sSql := sSql + '               (SELECT IDENDERECO, NUMERO, DDD  ';
  sSql := sSql + '                  FROM TELENDPESS               ';
  sSql := sSql + '                 WHERE TIPO Like ''%F%'') TF    ';
  sSql := sSql + '         WHERE (F.IDPESSOA = P.IDPESSOA)        ';
  sSql := sSql + '           AND (P.IDPESSOA = E.IDPESSOA)        ';
  sSql := sSql + '           AND (P.IDENDCOMERCIAL = E.IDENDERECO)';


//  sSql := sSql + '      AND trim(P.numdocumento) IN (''69342903134'',  ''01842345907'', ''93146779668'', ''05989881495'', ''90806603100'' )' ; //XXXX

  sSql := sSql + '           AND (E.IDCIDADES = C.IDCIDADES)      ';
  sSql := sSql + '           AND (E.IDENDERECO = TD.IDENDERECO(+)) ';
  sSql := sSql + '           AND (E.IDENDERECO = TF.IDENDERECO(+))) EMP,  ';
  sSql := sSql + '(SELECT P.IDPESSOA,                                     ';
  sSql := sSql + '   TRIM(P.NUMDOCUMENTO) CPF,                            ';
  sSql := sSql + '   P.NOME,                                              ';
  sSql := sSql + '   T.DDD,                                               ';
  sSql := sSql + '   T.NUMERO,                                            ';
  sSql := sSql + '   P.EMAIL                                              ';
  sSql := sSql + '   FROM PESSOA P, ENDPESS E, TELENDPESS T               ';
  sSql := sSql + '   WHERE P.IDPESSOA = (SELECT IDPESSOA                                        ';  
  sSql := sSql + '      									 FROM (SELECT RANK () OVER (ORDER BY R.ORDEM) AS ORD, ';
  sSql := sSql + '     										     	 				R.IDPESSOA                              ';
  sSql := sSql + '     											    	 FROM RESPCENTCUST R                          ';
  sSql := sSql + '                                 JOIN CENTCUST C                              ';
  sSql := sSql + '                                   ON C.CODCENTROCUSTO = R.CODCENTROCUSTO     ';
  sSql := sSql + '                                  AND C.STATUSGRUPOCDC = ''A''                ';
  sSql := sSql + '                                  AND C.NOME = ''DIACO''                      ';
//  sSql := sSql + '     										  		   JOIN PESSOA P ON P.IDPESSOA = R.IDPESSOA     ';    // Paulo Nobre - WO18407
  sSql := sSql + '     													  WHERE (R.DTFIMVIG IS NULL                     ';
  // Paulo Nobre - WO18407 - Inicio
//  sSql := sSql + '     															  	 OR R.DTFIMVIG <= LAST_DAY(SYSDATE)))   ';
  sSql := sSql + '     															  	 OR R.DTFIMVIG = (SELECT MAX(DTFIMVIG) AS DTFIMVIG ';
  sSql := sSql + '                                                        FROM RESPCENTCUST RC             ';
  sSql := sSql + '                                                        WHERE RC.DTFIMVIG <= LAST_DAY(SYSDATE) ';
  sSql := sSql + '                                                              AND R.DTFIMVIG IS NOT NULL )))   ';
  // Paulo Nobre - WO18407 - Fim
  sSql := sSql + '      									WHERE ORD = 1)                                        ';
  sSql := sSql + '   And P.IDPESSOA = E.IDPESSOA                          ';
  sSql := sSql + '   And E.IDENDERECO = T.IDENDERECO                      ';
  sSql := sSql + '   And T.IDTELEFONE = (SELECT MAX(T1.IDTELEFONE) FROM TELENDPESS T1 WHERE T.IDENDERECO = T1.IDENDERECO)) REPR, ';
  sSql := sSql + '(SELECT P.IDPESSOA,           ';
  sSql := sSql + '   TRIM(P.NUMDOCUMENTO) CPF,  ';
  sSql := sSql + '   P.NOME,                    ';
  sSql := sSql + '   d.numdocumento NUMCRC,     ';
  sSql := sSql + '   o.codestado UFCRC,         ';
  sSql := sSql + '   T.DDD,                     ';
  sSql := sSql + '   T.NUMERO,                  ';
  sSql := sSql + '   P.EMAIL                    ';
  sSql := sSql + '   FROM PESSOA P, ENDPESS E, TELENDPESS T, docpessoa d, tipodocpessoa C, ESTADO O                 ';
  sSql := sSql + '   WHERE P.IDPESSOA = (SELECT PE.IDPESSOA                                         ';
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
  sSql := sSql + '   And P.IDPESSOA = E.IDPESSOA        ';
  sSql := sSql + '   And E.IDENDERECO = T.IDENDERECO    ';
  sSql := sSql + '   And T.IDTELEFONE = (SELECT MAX(T1.IDTELEFONE) FROM TELENDPESS T1 WHERE T1.IDENDERECO = T.IDENDERECO )  ';
  sSql := sSql + '   And p.idpessoa = d.idpessoa           ';
  sSql := sSql + '   And c.iddocumento = d.iddocumento     ';
  sSql := sSql + '   And o.idestado = d.idestado           ';
  sSql := sSql + '   And c.iddocumento = 41 ) RESP,        '; // Num CRC do Contador

  //Luiz Carlos - SIG66033 - inicio
  if StrToInt(sExercicioDIRF) < 2018 then
  begin
    sSql := sSql + '(SELECT P.IDPESSOA, P.NUMDOCUMENTO, P.RAZAOSOCIAL, DP.NUMDOCUMENTO ANS   ';
    sSql := sSql + ' FROM PESSOA P                                                           ';
    sSql := sSql + '      JOIN DOCPESSOA DP ON (P.IDPESSOA = DP.IDPESSOA)                    ';
    sSql := sSql + ' WHERE P.IDPESSOA = 1023622                                              ';
    sSql := sSql + '       AND DP.IDDOCUMENTO = 42 ) SAUDE,                                  ';
  end
  else
  begin
    sSql := sSql + '(SELECT P.IDPESSOA, P.NUMDOCUMENTO, P.RAZAOSOCIAL, DP.NUMDOCUMENTO ANS   ';
    sSql := sSql + ' FROM PESSOA P                                                           ';
    sSql := sSql + '      JOIN DOCPESSOA DP ON (P.IDPESSOA = DP.IDPESSOA)                    ';
    sSql := sSql + ' WHERE P.IDPESSOA = 1023622                                              '; //BRADESCO SAUDE
    sSql := sSql + '       AND DP.IDDOCUMENTO = 42 ) SAUDE,                                  ';
  end;
  //Luiz Carlos - SIG66033 - fim
  sSql := sSql + '(SELECT P.IDPESSOA, P.NUMDOCUMENTO, P.RAZAOSOCIAL, DP.NUMDOCUMENTO ANS   ';
  sSql := sSql + ' FROM PESSOA P                                                           ';
  sSql := sSql + '      JOIN DOCPESSOA DP ON (P.IDPESSOA = DP.IDPESSOA)                    ';
  sSql := sSql + ' WHERE P.IDPESSOA = 1012350                                              ';
  sSql := sSql + '       AND DP.IDDOCUMENTO = 42 ) ODONTO,                                 ';
  //SIG97984 Tiago Von - INICIO
  if StrToInt(sExercicioDIRF) <> 2019 then    
  begin
  //Cássio Rovaroto - SIG 64340 - Início
  //Inserindo informações da AMIL
  sSql := sSql + '  (SELECT P.IDPESSOA IDPESSOA2, P.NUMDOCUMENTO NUMDOCUMENTO2,           '; // Andre Imakawa - SIG 112829
  sSql := sSql + '           P.RAZAOSOCIAL RAZAOSOCIAL2, DP.NUMDOCUMENTO ANS2              ';
  sSql := sSql + '      FROM PESSOA P                                                      ';
  sSql := sSql + '      JOIN DOCPESSOA DP ON (P.IDPESSOA = DP.IDPESSOA)                    ';
  sSql := sSql + '     WHERE P.IDPESSOA = 304777                                           ';
  sSql := sSql + '       AND DP.IDDOCUMENTO = 42 ) SAUDE2                                  ';
  //Cássio Rovaroto - SIG 64340 - Fim
  end
  else
  begin
  sSql := sSql + '  (SELECT P.IDPESSOA IDPESSOA2, P.NUMDOCUMENTO NUMDOCUMENTO2,           ';  // Andre Imakawa - SIG 112829
  sSql := sSql + '           P.RAZAOSOCIAL RAZAOSOCIAL2, DP.NUMDOCUMENTO ANS2              ';
  sSql := sSql + '      FROM PESSOA P                                                      ';
  sSql := sSql + '      JOIN DOCPESSOA DP ON (P.IDPESSOA = DP.IDPESSOA)                    ';
  sSql := sSql + '     WHERE P.IDPESSOA = 1023622                                           ';
  sSql := sSql + '       AND DP.IDDOCUMENTO = 42 ) SAUDE2                                  ';
  end;
  //SIG97984 Tiago Von - FIM
  CMDebugToFile(#13#10 + sSQL + #13#10);
  If Not ExecSQL(sSQL) Then
    Begin
      Result := False;
      Exception.Create(Messageinfo);
    End;
End;

Function TCtrlGeraDIRF_Novo.InserirDIRF_MovAnalitico_O_FF(Const pIdDIRF: Integer; pAno, pTipoCriacao, pCPF: String): Boolean;
Var sSql: String;
Begin
  Result := True;
  sSql := 'INSERT INTO DIRF_MOVANALITICO_FF            ';
  sSql := sSql + 'SELECT ' + inttostr(pIdDIRF) + ',';
  sSql := sSql + '   SEQDIRFMOVANALITICO.NEXTVAL,'; // IDDIRFMOVANALITICO
  sSql := sSql + '   TO_CHAR(L.DATAPAGAMENTO, ''YYYY''), '; // EXERCICIODIRF
  sSql := sSql + '   DECODE(L.CODNATUREZA, ''7416'', ''0561'', ''7431'', ''0561'', L.CODNATUREZA) CODNATUREZA, ';
  sSql := sSql + '   L.IDDARF,          ';
  sSql := sSql + '   LI.IDINFORME,      ';
  sSql := sSql + '   LI.IDLANCIRRF,     ';
  sSql := sSql + '   I.CODDIRF,         ';
  sSql := sSql + '   L.DATALANCAMENTO,  ';
  sSql := sSql + '   L.DATAPAGAMENTO,   ';
  sSql := sSql + '   P.IDPESSOA,        ';
  sSql := sSql + '   P.NUMDOCUMENTO,    '; // CPF
  sSql := sSql + '   P.NOME,            ';
  sSql := sSql + '   (CASE WHEN I.CODDIRF IN (2,5) THEN DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC) END) VLRREND, '; // Rendimento Normal e Rendimento 13º
  sSql := sSql + '   (CASE WHEN I.CODDIRF IN (3,7) THEN DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC) END) VLRIMP, '; // Imposto normal e imposto 13º
  sSql := sSql + '   (CASE WHEN I.CODDIRF IN (18,19,20,21,22,23,24,25,34,35,36) THEN DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC) END) VLROUTROS,  '; // Outras deduções
  sSql := sSql + '   ' + QuotedStr(pTipoCriacao) + ',';
  sSql := sSql + '   ''S'',             '; // FLGMARCADO
  sSql := sSql + '   SYSDATE,           ';
  sSql := sSql + '   USER              ';
  sSql := sSql + 'FROM INFORME I, LANCXINFORME LI, LANCIRRF L, NATURENDIMENTO N, PESSOA P ';
  sSql := sSql + 'WHERE (I.IDINFORME = LI.IDINFORME)                 ';
  sSql := sSql + '      AND (LI.IDLANCIRRF = L.IDLANCIRRF)           ';
  sSql := sSql + '      AND (P.IDPESSOA = L.IDBENEFIRRF)             ';
  sSql := sSql + '      AND (L.CODNATUREZA = N.CODNATUREZA)          ';
  sSql := sSql + '      AND (P.NUMDOCUMENTO IS NOT NULL)             '; // Só Empregados com CPF
  //edilaine SIG113729 : inicio
  //sSql := sSql + '      AND (I.CODDIRF <> 1)                       '; // 1 não vai para Dirf
  sSql := sSql + '       AND ((I.CODDIRF <> 1)                       '; // 1 não vai para Dirf
  sSql := sSql + '        OR  ((I.CODDIRF = 1)                       ';
  sSql := sSql + '        AND EXISTS (SELECT 1                       ';
  sSql := sSql + '                     FROM FUNCIONARIO F            ';
  sSql := sSql + '                     JOIN LANCIRRF L1 ON  L1.IDBENEFIRRF = F.IDPESSOA  ';
  sSql := sSql + '                    WHERE F.IDPESSOA = P.IDPESSOA  ';
  sSql := sSql + '                      AND F.DATADESLIGAMENTO IS NOT NULL ';
  sSql := sSql + '                      AND TO_CHAR(L1.DATAPAGAMENTO, ''YYYY'') = ' + quotedstr(pAno);
  sSql := sSql + '           )))';
  //edilaine SIG113729 : fim

  sSql := sSql + '      AND TO_CHAR(L.DATAPAGAMENTO, ''YYYY'') = ' + quotedstr(pAno);
  sSql := sSql + '      AND (NVL(L.IDMODULORESPON, L.IDMODULO) = 21) '; // Módulo de Folha de Pagamento de Empregados
  sSql := sSql + '      AND (NVL(N.FLGUSADONADIRF, ''S'') = ''S'') ';
  If pCPF <> '' Then
    sSql := sSql + '   AND P.NUMDOCUMENTO = ' + pCPF;
  CMDebugToFile(#13#10 + sSQL + #13#10);
  If Not ExecSQL(sSQL, true) Then
    Begin
      Result := False;
      Exception.Create(Messageinfo);
    End;
End;

Function TCtrlGeraDIRF_Novo.InserirDIRF_MovAnalFF_Depen(Const pIdDIRF: Integer; pAno, pCPF: String): Boolean;
Var sSql: String;
Begin
  // *** DEPENDENCIA ***

  //00 - Próprio/Titular - Somente para garantir que o titular seja o primeiro

  //***** Codificação abaixo conforme regras no layuot da DIRF

  //03 - Cônjuge/Companheiro(a)
  //04 - Filho(a)
  //06 - Enteado(a)
  //08 - Pai/Mãe
  //10 - Agregado/Outros

  // Paulo Nobre SIG 34459 - Inicio
  Result := True;
  sSql := 'INSERT INTO DIRF_MOVANALFF_DEPEN            ';
  sSql := sSql + 'SELECT ' + inttostr(pIdDIRF) + ',';
  sSql := sSql + '       SEQDIRFMOVFFDEPEN.NEXTVAL, MOV.*  ';
  sSql := sSql + 'FROM ('; // IDDIRFMOVANALFFDEPEN
  sSql := sSql + 'SELECT   RA.IDTITULAR,          '; // IDPESSOA do Titular
  sSql := sSql + '   RA.IDPESSOA,           '; // IDPESSOA do Dependente
  sSql := sSql + '   P.NUMDOCUMENTO CPFTIT,        '; // CPF titular
  sSql := sSql + '   PE.NUMDOCUMENTO CPFDEP,       '; // CPF Dependente
  sSql := sSql + '   PE.NOME,               '; // Nome do Dependente
  sSql := sSql + '   PF.DATANASC,           ';
  sSql := sSql + '   (CASE                                                                               ';
  sSql := sSql + '       WHEN (RA.IDTITULAR = RA.IDPESSOA) THEN 0                    '; // Titular do Plano
  sSql := sSql + '       WHEN PE.NUMDOCUMENTO IS NULL AND DT.IDDEPENDENCIA IN (''COM'', ''COP'', ''FIL'', ''ENT'', ''AFL'') THEN 1      ';
  sSql := sSql + '       ELSE 2                                                    ';
  sSql := sSql + '   END) ORDEMDEPEN,                                              '; // Apenas p/ gerar uma ordem de apresentação na Grid
  sSql := sSql + '   DT.IDDEPENDENCIA,                                             ';
  sSql := sSql + '   DECODE(DT.IDDEPENDENCIA,''PRP'',''00'',''COM'',''03'',''COP'',''03'',''FIL'',''04'',''ENT'',''06'',''AFL'',''06'',''PAI'',''08'',''MAE'',''08'',''10'') DEPENDENCIA, ';
  sSql := sSql + '   DT.FLGPLSAUDE,     ';
  sSql := sSql + '   DT.FLGPLODONTO,    ';
  sSql := sSql + '   PD.FLGASSISTENCIAL,';
  sSql := sSql + '   RA.IDPROVENTO,     ';
  sSql := sSql + '   RA.MES,            ';
  sSql := sSql + '   RA.VALOR,          ';
  sSql := sSql + '   NULL A,              ';
  sSql := sSql + '   NULL B,              ';
  sSql := sSql + '   SYSDATE,           ';
  sSql := sSql + '   USER,              ';
//Cássio Rovaroto -  SIG nº 81294 - Início
//  sSql := sSql + '   NULL CODNATUREZA,              '; //
  sSql := sSql + '   PD.CODIRRFDARF, '; 
//Cássio Rovaroto -  SIG nº 81294 - Fim
  sSql := sSql + '   NULL IDINFORME,              '; //
  sSql := sSql + '   NULL CODDIRF              '; //
  sSql := sSql + 'FROM RETASSIST RA     ';
  sSql := sSql + '     JOIN PESSOA P ON P.IDPESSOA = RA.IDTITULAR           ';
  sSql := sSql + '     JOIN PESSOA PE ON PE.IDPESSOA = RA.IDPESSOA          ';
  sSql := sSql + '     JOIN PROVDESC PD ON PD.IDPROVENTO = RA.IDPROVENTO    ';
  sSql := sSql + '     JOIN PESSOAFISICA PF ON PF.IDPESSOA = PE.IDPESSOA    ';
  sSql := sSql + '     JOIN DEPENTIT DT ON DT.IDTITULAR = RA.IDTITULAR AND DT.IDPESSOA = RA.IDPESSOA   ';
  sSql := sSql + 'WHERE RA.ANO = ' + quotedstr(pAno);
  sSql := sSql + '      AND PD.FLGASSISTENCIAL IN (1, 2)                    ';
  sSql := sSql + 'UNION                                                        ';
  sSql := sSql + 'SELECT H.IDPESSOA,                                           ';
  sSql := sSql + '       H.IDFAVORECIDO,                                       ';
  sSql := sSql + '       P.NUMDOCUMENTO CPFTIT,                                ';
  sSql := sSql + '       P1.NUMDOCUMENTO CPFDEP,                               ';
  sSql := sSql + '       P1.NOME,                                              ';
  sSql := sSql + '       PF.DATANASC,                                          ';
  sSql := sSql + '       1 ORDEMDEPEN,                                         '; // Apenas p/ gerar uma ordem de apresentação na Grid
  sSql := sSql + '       ''COM'' IDDEPENDENCIA,                                '; // COMPANHEIRA
  sSql := sSql + '       ''03'' RELDEPENDENCIA,                                ';
  sSql := sSql + '       NULL FLGPLSAUDE,                                      ';
  sSql := sSql + '       NULL FLGPLODONTO,                                     ';
  sSql := sSql + '       NULL FLGASSISTENCIAL,                                 ';
  sSql := sSql + '       NULL IDPROVENTO,                                      ';
  sSql := sSql + '       TO_CHAR(H.DATAPAGAMENTO, ''MM'') MES,                 ';
  sSql := sSql + '       H.VALORPROVENTO,                                      ';
  sSql := sSql + '       NULL A,                                               ';
  sSql := sSql + '       NULL B,                                               ';
  sSql := sSql + '       SYSDATE,                                              ';
  sSql := sSql + '       USER,                                                 ';
  sSql := sSql + '       H.CODIRRFDARF,                                        '; // Natureza
  sSql := sSql + '       I.IDINFORME,                                          ';
  sSql := sSql + '       I.CODDIRF                                             ';
  sSql := sSql + 'FROM HISTRUBSAL H                                            ';
  sSql := sSql + '     JOIN PESSOA P ON P.IDPESSOA = H.IDPESSOA                ';
  sSql := sSql + '     JOIN PESSOA P1 ON P1.IDPESSOA = H.IDFAVORECIDO          ';
  sSql := sSql + '     JOIN PESSOAFISICA PF ON PF.IDPESSOA = H.IDFAVORECIDO    ';
  sSql := sSql + '     JOIN INFORME I ON I.IDINFORME = H.IDINFORME             ';
  sSql := sSql + 'WHERE TO_CHAR(H.DATAPAGAMENTO, ''YYYY'') = ' + quotedstr(pAno);
  sSql := sSql + '      AND H.IDMODULO = 21                                    ';
  sSql := sSql + '      AND H.IDFAVORECIDO IS NOT NULL                         ';
  sSql := sSql + '      AND I.CODDIRF In (20, 24)  ) MOV                       '; // Pensão Alimenticia
  If pCPF <> '' Then
    sSql := sSql + '   AND MOV.CPFTIT = ' + pCPF;
  // Paulo Nobre SIG 34459 - Fim
  CMDebugToFile(#13#10 + sSQL + #13#10);
  If Not ExecSQL(sSQL, true) Then
    Begin
      Result := False;
      Exception.Create(Messageinfo);
    End;
End;

// ****************************** RETIFICADORA *********************************************************************

Function TCtrlGeraDIRF_Novo.InserirDIRF_MovAnalitico_R(Const pIdDIRF, pIdDIRF2: Integer): Boolean;
Var sSql: String;
Begin
  Result := True;
  sSql := 'INSERT INTO DIRF_MOVANALITICO     ';
  sSql := sSql + 'SELECT ' + inttostr(pIdDIRF) + ',';
  sSql := sSql + '      SEQDIRFMOVANALITICO.NEXTVAL, '; // IDDIRFMOVANALITICO
  sSql := sSql + '      EXERCICIODIRF,       '; // EXERCICIODIRF
  sSql := sSql + '      CODNATUREZA,         ';
  sSql := sSql + '      IDDARF,              ';
  sSql := sSql + '      IDLANCIRRF,          ';
  sSql := sSql + '      DATALANCAMENTO,      ';
  sSql := sSql + '      DATAPAGAMENTO,       ';
  sSql := sSql + '      IDPESSOA,            ';
  sSql := sSql + '      NUMDOCUMENTO,        ';
  sSql := sSql + '      RAZAOSOCIAL,         ';
  sSql := sSql + '      CODDOCUMENTO,        ';
  sSql := sSql + '      NODOCUMENTO,         ';
  sSql := sSql + '      NUMAPGR,             ';
  sSql := sSql + '      VLRRENDIMENTO,       ';
  sSql := sSql + '      VLRIMPOSTO,          ';
  sSql := sSql + '      FLGTIPOCRIACAO,      ';
  sSql := sSql + '      FLGMARCADO,          ';
  sSql := sSql + '      SYSDATE,             ';
  sSql := sSql + '      USER                 ';
  sSql := sSql + 'FROM DIRF_MOVANALITICO     ';
  sSql := sSql + 'WHERE IDDIRF = ' + inttostr(pIdDIRF2);
  If Not ExecSQL(sSQL) Then
    Begin
      Result := False;
      Exception.Create(Messageinfo);
    End;
End;

Function TCtrlGeraDIRF_Novo.InserirDIRF_DadosAdicionais_R(Const pIdDIRF, pIdDIRF2: Integer): Boolean;
Var sSql: String;
Begin
  Result := True;
  sSql := 'INSERT INTO DIRF_DADOSADICIONAIS  ';
  sSql := sSql + 'SELECT ' + inttostr(pIdDIRF) + ',';
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
  sSql := sSql + '     IDQUALIFPJ ,      ';
  sSql := sSql + '     FLGPAGASSSAUDE,   ';
  sSql := sSql + '     FLGPAGEXTERIOR,   ';
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
  sSql := sSql + '     IDADMPLANOSAUDE,  ';
  sSql := sSql + '     CNPJPLANOSAUDE,   ';
  sSql := sSql + '     NOMEPLANOSAUDE,   ';
  sSql := sSql + '     ANSPLANOSAUDE,    ';
  sSql := sSql + '     IDADMPLANOODONTO, ';
  sSql := sSql + '     CNPJPLANOODONTO,  ';
  sSql := sSql + '     NOMEPLANOODONTO,  ';
  sSql := sSql + '     ANSPLANOODONTO,   ';
  sSql := sSql + '     SYSDATE,          ';
  sSql := sSql + '     USER              ';
  //Cássio Rovaroto - SIG nº 64340 - Início
  sSql := sSql + '     ,IDADMPLANOSAUDE2, ';
  sSql := sSql + '     CNPJPLANOSAUDE2,   ';
  sSql := sSql + '     NOMEPLANOSAUDE2,   ';
  sSql := sSql + '     ANSPLANOSAUDE2     ';
  //Cássio Rovaroto - SIG nº 64340 - Fim
  sSql := sSql + 'FROM DIRF_DADOSADICIONAIS           ';
  sSql := sSql + 'WHERE IDDIRF = ' + inttostr(pIdDIRF2);
  If Not ExecSQL(sSQL) Then
    Begin
      Result := False;
      Exception.Create(Messageinfo);
    End;
End;

Function TCtrlGeraDIRF_Novo.InserirDIRF_MovAnaliticoFF_R(Const pIdDIRF, pIdDIRF2: Integer): Boolean;
Var sSql: String;
Begin
  Result := True;
  sSql := 'INSERT INTO DIRF_MOVANALITICO_FF       ';
  sSql := sSql + 'SELECT ' + inttostr(pIdDIRF) + ',';
  sSql := sSql + '   SEQDIRFMOVANALITICO.NEXTVAL,'; // IDDIRFMOVANALITICO
  sSql := sSql + '   EXERCICIODIRF,   ';
  sSql := sSql + '   CODNATUREZA,     ';
  sSql := sSql + '   IDDARF,          ';
  sSql := sSql + '   IDINFORME,       ';
  sSql := sSql + '   IDLANCIRRF,      ';
  sSql := sSql + '   CODDIRF,         ';
  sSql := sSql + '   DATALANCAMENTO,  ';
  sSql := sSql + '   DATAPAGAMENTO,   ';
  sSql := sSql + '   IDPESSOA,        ';
  sSql := sSql + '   NUMDOCUMENTO,    '; // CPF
  sSql := sSql + '   NOME,            ';
  sSql := sSql + '   VLRRENDIMENTO,   ';
  sSql := sSql + '   VLRIMPOSTO,      ';
  sSql := sSql + '   VLROUTROS,       ';
  sSql := sSql + '   FLGTIPOCRIACAO,  ';
  sSql := sSql + '   FLGMARCADO,      ';
  sSql := sSql + '   SYSDATE,         ';
  sSql := sSql + '   USER             ';
  sSql := sSql + 'FROM DIRF_MOVANALITICO_FF ';
  sSql := sSql + 'WHERE IDDIRF = ' + inttostr(pIdDIRF2);
  If Not ExecSQL(sSQL) Then
    Begin
      Result := False;
      Exception.Create(Messageinfo);
    End;
End;

Function TCtrlGeraDIRF_Novo.InserirDIRF_MovAnalFF_Depen_R(Const pIdDIRF, pIdDIRF2: Integer): Boolean;
Var sSql: String;
Begin
  Result := True;
  sSql := 'INSERT INTO DIRF_MOVANALFF_DEPEN            ';
  sSql := sSql + 'SELECT ' + inttostr(pIdDIRF) + ',';
  sSql := sSql + '   SEQDIRFMOVFFDEPEN.NEXTVAL,'; // IDDIRFMOVANALFFDEPEN
  sSql := sSql + '   IDTITULAR,         '; // IDPESSOA do Titular
  sSql := sSql + '   IDDEPEN,           '; // IDPESSOA do Dependente
  sSql := sSql + '   CPFTITULAR,        '; // CPF titular
  sSql := sSql + '   CPFDEPEN,          '; // CPF Dependente
  sSql := sSql + '   NOME,              '; // Nome do Dependente
  sSql := sSql + '   DATANASC,          ';
  sSql := sSql + '   ORDEMDEPEN,        ';
  sSql := sSql + '   IDDEPENDENCIA,     ';
  sSql := sSql + '   DEPENDENCIA,       ';
  sSql := sSql + '   FLGPLSAUDE,        ';
  sSql := sSql + '   FLGPLODONTO,       ';
  sSql := sSql + '   FLGASSISTENCIAL,   ';
  sSql := sSql + '   IDPROVENTO,        ';
  sSql := sSql + '   MES,               ';
  sSql := sSql + '   VALOR,             ';
  sSql := sSql + '   NULL,              ';
  sSql := sSql + '   NULL,              ';
  sSql := sSql + '   SYSDATE,           ';
  sSql := sSql + '   USER,              ';
  sSql := sSql + '   CODNATUREZA,       ';
  sSql := sSql + '   IDINFORME,         ';
  sSql := sSql + '   CODDIRF            ';
  sSql := sSql + 'FROM DIRF_MOVANALFF_DEPEN   ';
  sSql := sSql + 'WHERE IDDIRF = ' + inttostr(pIdDIRF2);
  If Not ExecSQL(sSQL) Then
    Begin
      Result := False;
      Exception.Create(Messageinfo);
    End;
End;

// ---------------------- LOCALIZAR MOVIMENTOS DO CONTAS A PAGAR --------------------------------------

Function TCtrlGeraDIRF_Novo.LocalizaDIRF_MovSintTributos: String;
Var sSql: String;
Begin
  sSql := 'SELECT DMA.IDDIRF,                                          ';
  sSql := sSql + '   DMA.CODNATUREZA,                                  ';
  sSql := sSql + '   N.DESCRICAO,                                      ';
  sSql := sSql + '   NVL(SUM(DMA.VLRRENDIMENTO), 0) VLRRENDIMENTO,     ';
  sSql := sSql + '   NVL(SUM(DMA.VLRIMPOSTO), 0) VLRIMPOSTO            ';
  sSql := sSql + 'FROM DIRF_MOVANALITICO DMA, NATURENDIMENTO N         ';
  sSql := sSql + 'WHERE DMA.IDDIRF =:IDDIRF                            ';
  sSql := sSql + '      AND DMA.CODNATUREZA = N.CODNATUREZA            ';
  sSql := sSql + '      AND DMA.FLGMARCADO = ''S''                     ';
  sSql := sSql + 'GROUP BY DMA.IDDIRF, DMA.CODNATUREZA, N.DESCRICAO    ';
  sSql := sSql + 'ORDER BY DMA.CODNATUREZA                             ';
  Result := sSql;
End;

Function TCtrlGeraDIRF_Novo.LocalizaDIRF_MovSintCNPJ(Const pIdDIRF: Integer; pNat: String): OleVariant;
Var sSql: String;
Begin
 //Darivaldo Alencar SIG64679 -inicio
 sSql :='SELECT IDDIRF,' + #13#10 +
        '       CODNATUREZA,' + #13#10 +
        '       NUMDOCUMENTO,' + #13#10 +
        '       RAZAOSOCIAL,' + #13#10 +
        '       SUM(VLRRENDIMENTO) VLRRENDIMENTO,' + #13#10 +
        '       SUM(VLRIMPOSTO) VLRIMPOSTO,' + #13#10 +
        '       SUM(QTD_LANC) AS QTD_LANC' + #13#10 +
        '  FROM (';
  //sSql := '       SELECT TAB1.IDDIRF,                                        ';
  sSql :=  sSql +  '       SELECT TAB1.IDDIRF,                                        ';
  //Darivaldo Alencar SIG64679 -fim

  sSql := sSql + '       TAB1.CODNATUREZA,                   ';
  sSql := sSql + '       TAB1.NUMDOCUMENTO,                  ';
  sSql := sSql + '       TAB1.RAZAOSOCIAL,                   ';
  sSql := sSql + '       NVL(VLRREND.VLRRENDIMENTO,0) VLRRENDIMENTO,           ';
  sSql := sSql + '       NVL(VLRIMP.VLRIMPOSTO,0) VLRIMPOSTO,                  ';
  sSql := sSql + '       NVL(QTD_LANC,0) QTD_LANC                              ';
  sSql := sSql + 'FROM (SELECT DMA1.IDDIRF,                 ';
  sSql := sSql + '             DMA1.CODNATUREZA,            ';
  sSql := sSql + '             DMA1.NUMDOCUMENTO,           ';
  sSql := sSql + '             DMA1.IDPESSOA,               '; //WO8238 - Andre Imakawa
  //edilaine - SIG123941 : inicio
  //sSql := sSql + '             DMA1.RAZAOSOCIAL  ,        ';
  sSql := sSql + '             (SELECT NOME FROM PESSOA     ';
  sSql := sSql + '               WHERE IDPESSOA = (SELECT MAX(DMA3.IDPESSOA)       ';
  sSql := sSql + '                                   FROM DIRF_MOVANALITICO DMA3   ';
  sSql := sSql + '                                  WHERE DMA3.NUMDOCUMENTO = DMA1.NUMDOCUMENTO) ';
  sSql := sSql + '                                ) AS RAZAOSOCIAL,  ';
  //edilaine - SIG123941 : fim
  sSql := sSql + '             COUNT(*) QTD_LANC                     ';
  sSql := sSql + '      FROM DIRF_MOVANALITICO DMA1        ';
  //edilaine - SIG123941 : inicio
  sSql := sSql + '      WHERE DMA1.IDDIRF = ' + inttostr(pIdDIRF);
  sSql := sSql + '        AND DMA1.CODNATUREZA = ' + quotedstr(pNat);
  sSql := sSql + '        AND DMA1.FLGMARCADO = ''S''      ';
  //sSql := sSql + '      WHERE DMA1.IDPESSOA = (SELECT MAX(DMA3.IDPESSOA)    '; // Pegando o ultimo nome válido, caso o CPF tenha 2 nomes
  //sSql := sSql + '                             FROM DIRF_MOVANALITICO DMA3  ';
  //sSql := sSql + '                             WHERE DMA3.NUMDOCUMENTO = DMA1.NUMDOCUMENTO) ';
  //edilaine - SIG123941 : FIM
  sSql := sSql + '      GROUP BY DMA1.IDDIRF,               ';
  sSql := sSql + '               DMA1.CODNATUREZA,           ';
  sSql := sSql + '               DMA1.NUMDOCUMENTO,         ';
  sSql := sSql + '               DMA1.IDPESSOA,         ';   //WO8238 - Andre Imakawa
  sSql := sSql + '               DMA1.RAZAOSOCIAL) TAB1,       ';
  sSql := sSql + '     (SELECT DMA.IDDIRF,                    ';
  sSql := sSql + '             DMA.CODNATUREZA,               ';
  sSql := sSql + '             DMA.NUMDOCUMENTO,                 ';
  sSql := sSql + '             DMA.IDPESSOA,                 '; //WO8238 - Andre Imakawa
  sSql := sSql + '             NVL(SUM(DMA.VLRRENDIMENTO), 0) VLRRENDIMENTO   ';
  sSql := sSql + '      FROM DIRF_MOVANALITICO DMA                      ';
  sSql := sSql + '      WHERE DMA.IDDIRF = ' + inttostr(pIdDIRF);
  sSql := sSql + '            AND DMA.CODNATUREZA = ' + quotedstr(pNat);
  sSql := sSql + '            AND DMA.FLGMARCADO = ''S''                       ';
  sSql := sSql + '      GROUP BY DMA.IDDIRF, DMA.CODNATUREZA, DMA.IDPESSOA, DMA.NUMDOCUMENTO) VLRREND,   ';  //WO8238 - Andre Imakawa
  sSql := sSql + '     (SELECT DMA.IDDIRF,                                  ';
  sSql := sSql + '             DMA.CODNATUREZA,                            ';
  sSql := sSql + '             DMA.NUMDOCUMENTO,                             ';
  sSql := sSql + '             DMA.IDPESSOA,                             ';  //WO8238 - Andre Imakawa
  sSql := sSql + '             NVL(SUM(DMA.VLRIMPOSTO), 0) VLRIMPOSTO         ';
  sSql := sSql + '      FROM DIRF_MOVANALITICO DMA                         ';
  sSql := sSql + '      WHERE DMA.IDDIRF = ' + inttostr(pIdDIRF);
  sSql := sSql + '            AND DMA.CODNATUREZA = ' + quotedstr(pNat);
  sSql := sSql + '            AND DMA.FLGMARCADO = ''S''                          ';
  sSql := sSql + '      GROUP BY DMA.IDDIRF, DMA.CODNATUREZA, DMA.IDPESSOA, DMA.NUMDOCUMENTO) VLRIMP     ';   //WO8238 - Andre Imakawa
  sSql := sSql + 'WHERE TAB1.IDDIRF = VLRREND.IDDIRF(+)                              ';
  sSql := sSql + '      AND TAB1.CODNATUREZA = VLRREND.CODNATUREZA(+)                   ';
  sSql := sSql + '      AND TAB1.NUMDOCUMENTO = VLRREND.NUMDOCUMENTO(+)               ';
  sSql := sSql + '      AND TAB1.IDPESSOA = VLRREND.IDPESSOA(+)               ';               //WO8238 - Andre Imakawa
  sSql := sSql + '      AND TAB1.IDDIRF = VLRIMP.IDDIRF(+)                               ';
  sSql := sSql + '      AND TAB1.CODNATUREZA = VLRIMP.CODNATUREZA(+)                     ';
  sSql := sSql + '      AND TAB1.NUMDOCUMENTO = VLRIMP.NUMDOCUMENTO(+)                  ';
  sSql := sSql + '      AND TAB1.IDPESSOA = VLRIMP.IDPESSOA(+)                  ';             //WO8238 - Andre Imakawa
  sSql := sSql + '      AND TAB1.IDDIRF = ' + inttostr(pIdDIRF);
  sSql := sSql + '      AND TAB1.CODNATUREZA = ' + quotedstr(pNat);

  //Darivaldo Alencar SIG64679 -inicio
  //sSql := sSql + 'ORDER BY TAB1.CODNATUREZA, TAB1.NUMDOCUMENTO ASC                  ';
  sSql := sSql + ' UNION ALL' + #13#10 +
          '        SELECT IDDIRF,' + #13#10 +
          '               CODNATUREZA,' + #13#10 +
          '               NUMDOCUMENTO,' + #13#10 +
          '               RAZAOSOCIAL,' + #13#10 +
          '               NVL(SUM(VLRRENDIMENTO), 0) VLRRENDIMENTO,' + #13#10 +
          '               NVL(SUM(VLRIMPOSTO), 0) VLRIMPOSTO,' + #13#10 +
          '               COUNT(*) QTD_LANC' + #13#10 +
          '          FROM DIRF_MOVANALITICO DMA' + #13#10 +
          '         WHERE DMA.IDDIRF = ' +inttostr(pIdDIRF) + #13#10 +
          '           AND DMA.CODNATUREZA = '  + quotedstr(pNat) + #13#10 +
          '           AND DMA.FLGMARCADO = ''S''' + #13#10 +
          '           AND NUMDOCUMENTO IS NULL' + #13#10 +
          '           GROUP BY DMA.IDDIRF, DMA.CODNATUREZA, DMA.NUMDOCUMENTO ,DMA.RAZAOSOCIAL' + #13#10 +
          '         )' + #13#10 +
          ' GROUp BY IDDIRF, CODNATUREZA,NUMDOCUMENTO,RAZAOSOCIAL';
  //Darivaldo Alencar SIG64679 -fim

  Result := GetDataPacket(sSql);
End;

Function TCtrlGeraDIRF_Novo.LocalizaDIRF_MovSintCNPJMensal: String;
Var sSql: String;
Begin
  sSql := 'SELECT MOVTOT.IDDIRF,                          ';
  sSql := sSql + '       MOVTOT.CODNATUREZA,              ';
  sSql := sSql + '       MOVTOT.MES,                      ';
  sSql := sSql + '       MOVTOT.DESCMES,                  ';
  sSql := sSql + '       MOVTOT.NUMDOCUMENTO,             ';
  sSql := sSql + '       SUM(MOVTOT.VLRRENDIMENTO) VLRRENDIMENTO,  ';
  sSql := sSql + '       SUM(MOVTOT.VLRIMPOSTO) VLRIMPOSTO         ';
  sSql := sSql + 'FROM (SELECT DMA.IDDIRF,                         ';
  sSql := sSql + '               DMA.CODNATUREZA,                  ';
  sSql := sSql + '               DMA.NUMDOCUMENTO,                 ';
  //sSql := sSql + '               TO_CHAR(DMA.DATAPAGAMENTO, ''MM'') MES,   '; //WO8238 - Andre Imakawa
  sSql := sSql + '               CASE WHEN DMA.CODNATUREZA IN (''1708'',''8045'') THEN TO_CHAR(DMA.DATALANCAMENTO, ''MM'')   '; //WO8238 - Andre Imakawa
  sSql := sSql + '               ELSE TO_CHAR(DMA.DATAPAGAMENTO, ''MM'') END AS  MES,   '; //WO8238 - Andre Imakawa
//  sSql := sSql + '               INITCAP(TO_CHAR(DMA.DATAPAGAMENTO,''FMMONTH'',''NLS_DATE_LANGUAGE = portuguese'')) DESCMES, '; //Everson TIBERO
  //sSql := sSql + '               INITCAP(TO_CHAR(DMA.DATAPAGAMENTO,''FMMONTH'')) DESCMES, ';                                      //Everson TIBERO //WO8238 - Andre Imakawa
  sSql := sSql + '               CASE WHEN DMA.CODNATUREZA IN (''1708'',''8045'') THEN INITCAP(TO_CHAR(DMA.DATALANCAMENTO,''FMMONTH'')) '; //WO8238 - Andre Imakawa
  sSql := sSql + '               ELSE INITCAP(TO_CHAR(DMA.DATAPAGAMENTO,''FMMONTH'')) END AS   DESCMES, '; //WO8238 - Andre Imakawa
  //  sSql := sSql + '               NVL(DMA.VLRRENDIMENTO, 0) VLRRENDIMENTO,  ';  // William Santana - SOL 270177 - PPM 1351703
  sSql := sSql + '               NVL(SUM(DMA.VLRRENDIMENTO), 0) VLRRENDIMENTO,  '; // William Santana - SOL 270177 - PPM 1351703.
  sSql := sSql + '               NVL(SUM(DMA.VLRIMPOSTO), 0) VLRIMPOSTO    ';
  sSql := sSql + '      FROM DIRF_MOVANALITICO DMA                         ';
  sSql := sSql + '      WHERE DMA.IDDIRF =:IDDIRF                          ';
  sSql := sSql + '            AND DMA.CODNATUREZA =:CODNATUREZA            ';
  sSql := sSql + '            AND DMA.NUMDOCUMENTO =:NUMDOCUMENTO          ';
  sSql := sSql + '            AND DMA.FLGMARCADO = ''S''                   ';
  sSql := sSql + '      GROUP BY DMA.IDDIRF,                               ';
  sSql := sSql + '               DMA.CODNATUREZA,                          ';
  sSql := sSql + '               DMA.NUMDOCUMENTO,                         ';
  //sSql := sSql + '               TO_CHAR(DMA.DATAPAGAMENTO, ''MM''),       '; //WO8238 - Andre Imakawa
  sSql := sSql + '               CASE WHEN DMA.CODNATUREZA IN (''1708'',''8045'') THEN TO_CHAR(DMA.DATALANCAMENTO, ''MM'')       '; //WO8238 - Andre Imakawa
  sSql := sSql + '               ELSE TO_CHAR(DMA.DATAPAGAMENTO, ''MM'') END,       '; //WO8238 - Andre Imakawa
//  sSql := sSql + '               INITCAP(TO_CHAR(DMA.DATAPAGAMENTO,''FMMONTH'',''NLS_DATE_LANGUAGE = portuguese'')), '; //Everson TIBERO
  //sSql := sSql + '               INITCAP(TO_CHAR(DMA.DATAPAGAMENTO,''FMMONTH'')), ';                                      //Everson TIBERO //WO8238 - Andre Imakawa
  sSql := sSql + '               CASE WHEN DMA.CODNATUREZA IN (''1708'',''8045'') THEN INITCAP(TO_CHAR(DMA.DATALANCAMENTO,''FMMONTH'')) ';//WO8238 - Andre Imakawa
  sSql := sSql + '               ELSE INITCAP(TO_CHAR(DMA.DATAPAGAMENTO,''FMMONTH'')) END, ';//WO8238 - Andre Imakawa
  sSql := sSql + '               NVL(DMA.VLRRENDIMENTO, 0)) MOVTOT                                                   ';
  sSql := sSql + ' GROUP BY MOVTOT.IDDIRF,                                                                           ';
  sSql := sSql + '       MOVTOT.CODNATUREZA,                                                                         ';
  sSql := sSql + '       MOVTOT.MES,                                           ';
  sSql := sSql + '       MOVTOT.DESCMES,                                       ';
  sSql := sSql + '       MOVTOT.NUMDOCUMENTO                                   ';
  sSql := sSql + ' ORDER BY MOVTOT.CODNATUREZA, MOVTOT.NUMDOCUMENTO ASC, MOVTOT.MES  ';
  Result := sSql;
End;

//Darivaldo Alencar SIG 23598
//Function TCtrlGeraDIRF_Novo.LocalizaDIRF_MovDetCNPJ: String;

Function TCtrlGeraDIRF_Novo.LocalizaDIRF_MovDetCNPJ(sOrderBy: String = ''): String;
Var sSql: String;
Begin
  sSql := 'SELECT DMA.IDDIRF,              ';
  sSql := sSql + '     DMA.IDDIRFMOVANALITICO,';
  sSql := sSql + '     DMA.EXERCICIODIRF,  ';
  sSql := sSql + '     DMA.CODNATUREZA,    ';
  sSql := sSql + '     DMA.IDPESSOA,       ';
  sSql := sSql + '     DMA.RAZAOSOCIAL,    ';
  sSql := sSql + '     DMA.DATALANCAMENTO, ';
  sSql := sSql + '     DMA.DATAPAGAMENTO,  ';
  sSql := sSql + '     DMA.NUMDOCUMENTO,   ';
  sSql := sSql + '     DMA.NODOCUMENTO,    ';
  sSql := sSql + '     DMA.NUMAPGR,        ';
  sSql := sSql + '     DMA.FLGTIPOCRIACAO, ';
  sSql := sSql + '     DMA.FLGMARCADO,     ';
  sSql := sSql + '     D.OBS,              '; //Darivaldo Alencar SIG 23598
  sSql := sSql + '     NVL(DMA.VLRRENDIMENTO, 0) VLRRENDIMENTO,';
  sSql := sSql + '     NVL(DMA.VLRIMPOSTO, 0) VLRIMPOSTO       ';
  sSql := sSql + 'FROM DIRF_MOVANALITICO DMA                   ';
  sSql := sSql + ' ,DOCUMENTO D                                '; //Darivaldo Alencar SIG 23598
  sSql := sSql + 'WHERE DMA.IDDIRF =:IDDIRF                    ';
  sSql := sSql + '      AND DMA.CODNATUREZA =:CODNATUREZA      ';
  sSql := sSql + '      AND DMA.NUMDOCUMENTO =:NUMDOCUMENTO    ';
  //Darivaldo Alencar SIG 23598 -inicio
  //sSql := sSql + 'ORDER BY DMA.CODNATUREZA, DMA.NUMDOCUMENTO ASC, DMA.DATAPAGAMENTO, DMA.NODOCUMENTO, DMA.NUMAPGR  ';
  // Andre Imakawa - SIG 40444 - Inicio
  //sSql := sSql + '      AND DMA.NUMAPGR = D.NUMAPGR            ';
  sSql := sSql + '      AND DMA.NUMAPGR = D.NUMAPGR(+)            ';
  // Andre Imakawa - SIG 40444 - Fim
  If (sOrderBy = EmptyStr) Then
    sSql := sSql + 'ORDER BY DMA.CODNATUREZA, DMA.NUMDOCUMENTO ASC, DMA.DATAPAGAMENTO, DMA.NODOCUMENTO, DMA.NUMAPGR  '
  Else
    sSql := sSql + sOrderBy;
  //Darivaldo Alencar SIG 23598 -fim

  Result := sSql;
End;

Function TCtrlGeraDIRF_Novo.LocalizaDIRF_DadosAdicionais: String;
Var sSql: String;
Begin
  sSql := 'SELECT *                          ';
  sSql := sSql + 'FROM DIRF_DADOSADICIONAIS  ';
  sSql := sSql + 'WHERE IDDIRF =:IDDIRF      ';
  Result := sSql;
End;

Function TCtrlGeraDIRF_Novo.ListaMovInformesRendimento(pIdDIRF, pAno, pCNPJ: String): OleVariant;
Var sSql: String;
Begin
  sSql := '      SELECT DMA.EXERCICIODIRF,             ';
  sSql := sSql + '      DMA.RAZAOSOCIAL NOMEBENEF,     ';
  sSql := sSql + '      DMA.NUMDOCUMENTO CGCBENEF,     ';
  sSql := sSql + '      N.CODNATUREZA,                 ';
  sSql := sSql + '      N.DESCRICAO,                   ';
  //WO8238 - Andre Imakawa
  {
  sSql := sSql + '      SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''01'', DMA.VLRRENDIMENTO, 0)) As JANTOTALREND,    ';
  sSql := sSql + '      SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''02'', DMA.VLRRENDIMENTO, 0)) As FEVTOTALREND,    ';
  sSql := sSql + '      SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''03'', DMA.VLRRENDIMENTO, 0)) As MARTOTALREND,    ';
  sSql := sSql + '      SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''04'', DMA.VLRRENDIMENTO, 0)) As ABRTOTALREND,    ';
  sSql := sSql + '      SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''05'', DMA.VLRRENDIMENTO, 0)) As MAITOTALREND,    ';
  sSql := sSql + '      SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''06'', DMA.VLRRENDIMENTO, 0)) As JUNTOTALREND,    ';
  sSql := sSql + '      SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''07'', DMA.VLRRENDIMENTO, 0)) As JULTOTALREND,    ';
  sSql := sSql + '      SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''08'', DMA.VLRRENDIMENTO, 0)) As AGOTOTALREND,    ';
  sSql := sSql + '      SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''09'', DMA.VLRRENDIMENTO, 0)) As SETTOTALREND,    ';
  sSql := sSql + '      SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''10'', DMA.VLRRENDIMENTO, 0)) As OUTTOTALREND,    ';
  sSql := sSql + '      SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''11'', DMA.VLRRENDIMENTO, 0)) As NOVTOTALREND,    ';
  sSql := sSql + '      SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''12'', DMA.VLRRENDIMENTO, 0)) As DEZTOTALREND,    ';
  sSql := sSql + '      SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''01'', DMA.VLRIMPOSTO, 0)) As JANRETIDOFON,       ';
  sSql := sSql + '      SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''02'', DMA.VLRIMPOSTO, 0)) As FEVRETIDOFON,       ';
  sSql := sSql + '      SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''03'', DMA.VLRIMPOSTO, 0)) As MARRETIDOFON,       ';
  sSql := sSql + '      SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''04'', DMA.VLRIMPOSTO, 0)) As ABRRETIDOFON,       ';
  sSql := sSql + '      SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''05'', DMA.VLRIMPOSTO, 0)) As MAIRETIDOFON,       ';
  sSql := sSql + '      SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''06'', DMA.VLRIMPOSTO, 0)) As JUNRETIDOFON,       ';
  sSql := sSql + '      SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''07'', DMA.VLRIMPOSTO, 0)) As JULRETIDOFON,       ';
  sSql := sSql + '      SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''08'', DMA.VLRIMPOSTO, 0)) As AGORETIDOFON,       ';
  sSql := sSql + '      SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''09'', DMA.VLRIMPOSTO, 0)) As SETRETIDOFON,       ';
  sSql := sSql + '      SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''10'', DMA.VLRIMPOSTO, 0)) As OUTRETIDOFON,       ';
  sSql := sSql + '      SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''11'', DMA.VLRIMPOSTO, 0)) As NOVRETIDOFON,       ';
  sSql := sSql + '      SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''12'', DMA.VLRIMPOSTO, 0)) As DEZRETIDOFON        ';
  }
  sSql := sSql + '      CASE WHEN N.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO, ''MM''), ''01'', DMA.VLRRENDIMENTO, 0))    ';
  sSql := sSql + '      ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''01'', DMA.VLRRENDIMENTO, 0)) END AS JANTOTALREND,';
  sSql := sSql + '      CASE WHEN N.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO, ''MM''), ''02'', DMA.VLRRENDIMENTO, 0))    ';
  sSql := sSql + '      ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''02'', DMA.VLRRENDIMENTO, 0)) END AS FEVTOTALREND,';
  sSql := sSql + '      CASE WHEN N.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO, ''MM''), ''03'', DMA.VLRRENDIMENTO, 0))    ';
  sSql := sSql + '      ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''03'', DMA.VLRRENDIMENTO, 0)) END AS MARTOTALREND,';
  sSql := sSql + '      CASE WHEN N.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO, ''MM''), ''04'', DMA.VLRRENDIMENTO, 0))    ';
  sSql := sSql + '      ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''04'', DMA.VLRRENDIMENTO, 0)) END AS ABRTOTALREND,';
  sSql := sSql + '      CASE WHEN N.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO, ''MM''), ''05'', DMA.VLRRENDIMENTO, 0))    ';
  sSql := sSql + '      ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''05'', DMA.VLRRENDIMENTO, 0)) END AS MAITOTALREND,';
  sSql := sSql + '      CASE WHEN N.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO, ''MM''), ''06'', DMA.VLRRENDIMENTO, 0))    ';
  sSql := sSql + '      ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''06'', DMA.VLRRENDIMENTO, 0)) END AS JUNTOTALREND,';
  sSql := sSql + '      CASE WHEN N.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO, ''MM''), ''07'', DMA.VLRRENDIMENTO, 0))    ';
  sSql := sSql + '      ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''07'', DMA.VLRRENDIMENTO, 0)) END AS JULTOTALREND,';
  sSql := sSql + '      CASE WHEN N.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO, ''MM''), ''08'', DMA.VLRRENDIMENTO, 0))    ';
  sSql := sSql + '      ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''08'', DMA.VLRRENDIMENTO, 0)) END AS AGOTOTALREND,';
  sSql := sSql + '      CASE WHEN N.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO, ''MM''), ''09'', DMA.VLRRENDIMENTO, 0))    ';
  sSql := sSql + '      ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''09'', DMA.VLRRENDIMENTO, 0)) END AS SETTOTALREND,';
  sSql := sSql + '      CASE WHEN N.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO, ''MM''), ''10'', DMA.VLRRENDIMENTO, 0))    ';
  sSql := sSql + '      ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''10'', DMA.VLRRENDIMENTO, 0)) END AS OUTTOTALREND,';
  sSql := sSql + '      CASE WHEN N.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO, ''MM''), ''11'', DMA.VLRRENDIMENTO, 0))    ';
  sSql := sSql + '      ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''11'', DMA.VLRRENDIMENTO, 0)) END AS NOVTOTALREND,';
  sSql := sSql + '      CASE WHEN N.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO, ''MM''), ''12'', DMA.VLRRENDIMENTO, 0))    ';
  sSql := sSql + '      ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''12'', DMA.VLRRENDIMENTO, 0)) END AS DEZTOTALREND,';

  sSql := sSql + '      CASE WHEN N.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO, ''MM''), ''01'', DMA.VLRIMPOSTO, 0))    ';
  sSql := sSql + '      ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''01'', DMA.VLRIMPOSTO, 0)) END AS JANRETIDOFON,';
  sSql := sSql + '      CASE WHEN N.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO, ''MM''), ''02'', DMA.VLRIMPOSTO, 0))    ';
  sSql := sSql + '      ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''02'', DMA.VLRIMPOSTO, 0)) END AS FEVRETIDOFON,';
  sSql := sSql + '      CASE WHEN N.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO, ''MM''), ''03'', DMA.VLRIMPOSTO, 0))    ';
  sSql := sSql + '      ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''03'', DMA.VLRIMPOSTO, 0)) END AS MARRETIDOFON,';
  sSql := sSql + '      CASE WHEN N.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO, ''MM''), ''04'', DMA.VLRIMPOSTO, 0))    ';
  sSql := sSql + '      ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''04'', DMA.VLRIMPOSTO, 0)) END AS ABRRETIDOFON,';
  sSql := sSql + '      CASE WHEN N.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO, ''MM''), ''05'', DMA.VLRIMPOSTO, 0))    ';
  sSql := sSql + '      ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''05'', DMA.VLRIMPOSTO, 0)) END AS MAIRETIDOFON,';
  sSql := sSql + '      CASE WHEN N.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO, ''MM''), ''06'', DMA.VLRIMPOSTO, 0))    ';
  sSql := sSql + '      ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''06'', DMA.VLRIMPOSTO, 0)) END AS JUNRETIDOFON,';
  sSql := sSql + '      CASE WHEN N.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO, ''MM''), ''07'', DMA.VLRIMPOSTO, 0))    ';
  sSql := sSql + '      ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''07'', DMA.VLRIMPOSTO, 0)) END AS JULRETIDOFON,';
  sSql := sSql + '      CASE WHEN N.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO, ''MM''), ''08'', DMA.VLRIMPOSTO, 0))    ';
  sSql := sSql + '      ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''08'', DMA.VLRIMPOSTO, 0)) END AS AGORETIDOFON,';
  sSql := sSql + '      CASE WHEN N.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO, ''MM''), ''09'', DMA.VLRIMPOSTO, 0))    ';
  sSql := sSql + '      ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''09'', DMA.VLRIMPOSTO, 0)) END AS SETRETIDOFON,';
  sSql := sSql + '      CASE WHEN N.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO, ''MM''), ''10'', DMA.VLRIMPOSTO, 0))    ';
  sSql := sSql + '      ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''10'', DMA.VLRIMPOSTO, 0)) END AS OUTRETIDOFON,';
  sSql := sSql + '      CASE WHEN N.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO, ''MM''), ''11'', DMA.VLRIMPOSTO, 0))    ';
  sSql := sSql + '      ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''11'', DMA.VLRIMPOSTO, 0)) END AS NOVRETIDOFON,';
  sSql := sSql + '      CASE WHEN N.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO, ''MM''), ''12'', DMA.VLRIMPOSTO, 0))    ';
  sSql := sSql + '      ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO, ''MM''), ''12'', DMA.VLRIMPOSTO, 0)) END AS DEZRETIDOFON';
  //WO8238 - Andre Imakawa

  sSql := sSql + '      FROM DIRF_MOVANALITICO DMA, NATURENDIMENTO N                                                      ';
  sSql := sSql + 'WHERE DMA.IDDIRF = ' + quotedstr(pIdDIRF);
  sSql := sSql + '      AND N.CODNATUREZA = DMA.CODNATUREZA                                                               ';
  sSql := sSql + '      AND DMA.CODNATUREZA <> ''0588''                                                                   ';
  If pCNPJ <> '' Then
    sSql := sSql + '    AND DMA.NUMDOCUMENTO = ' + quotedstr(pCNPJ);
  sSql := sSql + '      AND DMA.FLGMARCADO = ''S''  ';
  sSql := sSql + 'GROUP BY DMA.EXERCICIODIRF,  ';
  sSql := sSql + '      DMA.RAZAOSOCIAL,       ';
  sSql := sSql + '      DMA.NUMDOCUMENTO,      ';
  sSql := sSql + '      N.CODNATUREZA,         ';
  sSql := sSql + '      N.DESCRICAO            ';
  sSql := sSql + 'ORDER BY DMA.EXERCICIODIRF, DMA.RAZAOSOCIAL, DMA.NUMDOCUMENTO, N.CODNATUREZA   ';
  Result := GetDataPacket(sSql);
End;

Function TCtrlGeraDIRF_Novo.VerificaSeHaLancamentosNaoGerados(pIdDIRF: Integer; pAno: String): OleVariant;
Var sSql: String;
Begin
  sSql := '       SELECT L.IDLANCIRRF,                         ';
  sSql := sSql + '       L.CODNATUREZA,                        ';
  sSql := sSql + '       P.NUMDOCUMENTO,                       ';
  sSql := sSql + '       P.RAZAOSOCIAL,                        ';
  sSql := sSql + '       L.DATAPAGAMENTO,                      ';
  sSql := sSql + '       L.VLRBASE,                            ';
  sSql := sSql + '       DECODE(L.CODNATUREZA, ''5952'', L.VLRPIS + L.VLRCSCOFPIS, L.VLRIRRF) VLRIRRF    ';
  sSql := sSql + ' FROM LANCIRRF L, PESSOA P                   ';
  sSql := sSql + ' WHERE L.IDLANCIRRF NOT IN                   ';
  sSql := sSql + '       (SELECT DMA.IDLANCIRRF                ';
  sSql := sSql + '        FROM DIRF_MOVANALITICO DMA           ';
  sSql := sSql + '        WHERE DMA.IDDIRF = ' + inttostr(pIdDIRF);
  sSql := sSql + '              AND TO_CHAR(DMA.DATAPAGAMENTO, ''YYYY'') = ' + quotedstr(pAno);
  //Luiz Carlos - SIG67311 - Inicio
  //sSql := sSql + '              AND DMA.CODNATUREZA IN (''0588'', ''1708'', ''5952'', ''8045'')    ';
    sSql := sSql + '              AND DMA.CODNATUREZA IN (''0588'', ''1708'', ''5952'', ''8045'', ''3208'')    ';
  //Luiz Carlos - SIG67311 - Fim
  // Paulo Nobre - SOL 226868 KTN 2060896 19/02/2014
  sSql := sSql + '              AND DMA.IDLANCIRRF IS NOT NULL  )   ';
  //
  sSql := sSql + '       AND L.IDBENEFIRRF = P.IDPESSOA             ';
  sSql := sSql + '       AND TO_CHAR(L.DATAPAGAMENTO, ''YYYY'') = ' + quotedstr(pAno);
  //Luiz Carlos - SIG67311 - Inicio
  //sSql := sSql + '       AND L.CODNATUREZA IN (''0588'', ''1708'', ''5952'', ''8045'')              ';
  sSql := sSql + '       AND L.CODNATUREZA IN (''0588'', ''1708'', ''5952'', ''8045'', ''3208'')              ';
  //Luiz Carlos - SIG67311 - Fim
  // Paulo Nobre - SOL 261135 PPM 1072469 -  10/08/2015
//  sSql := sSql + '       AND DECODE(L.CODNATUREZA, ''5952'', L.VLRPIS + L.VLRCSCOFPIS, L.VLRIRRF) <> 0   ';
  sSql := sSql + '       AND L.IDMODULO <> 21                                                            ';
  sSql := sSql + 'ORDER BY P.RAZAOSOCIAL, L.NUMDOCUMENTO, L.CODNATUREZA, L.DATAPAGAMENTO                 ';
  Result := GetDataPacket(sSql);
End;

//========================== FIM CONTAS A PAGAR =========================================================

// ---------------------- LOCALIZAR MOVIMENTOS DA FOLHA FUNCIONARIOS --------------------------------------

Function TCtrlGeraDIRF_Novo.ListaDIRF_MovSintTributosFF: String;
Var sSql: String;
Begin
  sSql := 'SELECT DMA.IDDIRF,                                            ';
  sSql := sSql + '   DMA.CODNATUREZA,                                    ';
  sSql := sSql + '   N.DESCRICAO,                                        ';
  sSql := sSql + '   NVL(ABS(SUM(DECODE(DMA.CODDIRF, 2, DMA.VLRRENDIMENTO))), 0) VLRRENDIMENTO,       ';
  sSql := sSql + '   NVL(ABS(SUM(DECODE(DMA.CODDIRF, 3, DMA.VLRIMPOSTO))), 0) VLRIMPOSTO             ';
  sSql := sSql + 'FROM DIRF_MOVANALITICO_FF DMA, NATURENDIMENTO N        ';
  sSql := sSql + 'WHERE DMA.IDDIRF =:IDDIRF                              ';
  sSql := sSql + '      AND DMA.CODNATUREZA = N.CODNATUREZA              ';
  sSql := sSql + '      AND DMA.FLGMARCADO = ''S''                       ';
  sSql := sSql + 'GROUP BY DMA.IDDIRF, DMA.CODNATUREZA, N.DESCRICAO      ';
  sSql := sSql + 'ORDER BY DMA.CODNATUREZA                               ';
  Result := sSql;
End;

Function TCtrlGeraDIRF_Novo.ListaDIRF_MovSintFF(Const pIdDIRF: Integer; pNat: String): OleVariant;
Var sSql: String;
Begin
  sSql := 'SELECT FF.IDDIRF,                    ';
  sSql := sSql + '  FF.CODNATUREZA,             ';
  sSql := sSql + '  FF.NUMDOCUMENTO,            ';
  sSql := sSql + '  FF.IDPESSOA,                ';
  sSql := sSql + '  TRANSLATE(FF.NOME, ''ÁÇÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕËÜáçéíóúàèìòùâêîôûãõëü*'',''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu '') NOME, ';
  sSql := sSql + '  FF.FLGMARCADO               ';
  //Cássio Rovaroto - SIG nº 64340
  //Incluindo o ano da declaração da DIRF, para uso em rotinas posteriores
  sSql := sSql + '  , FF.EXERCICIODIRF          ';
  sSql := sSql + 'FROM DIRF_MOVANALITICO_FF FF  ';
  // Paulo Nobre - SOL 247807 PPM 703438 26/02/2015
  // Pega o ultimo nome da pessoa, caso ela tenha mudado. Esta condição só funcionará quando a natureza for a mesma.
  sSql := sSql + 'JOIN (SELECT MAX (DMF.IDPESSOA) IDPESS, DMF.NUMDOCUMENTO, DMF.CODNATUREZA                 ';
  sSql := sSql + '      FROM DIRF_MOVANALITICO_FF DMF                                                       ';
  sSql := sSql + '      GROUP BY DMF.NUMDOCUMENTO, DMF.CODNATUREZA) MAA ON MAA.IDPESS = FF.IDPESSOA AND MAA.NUMDOCUMENTO = FF.NUMDOCUMENTO AND MAA.CODNATUREZA = FF.CODNATUREZA ';
  //
  sSql := sSql + 'WHERE FF.IDDIRF = ' + inttostr(pIdDIRF);
  sSql := sSql + '      AND FF.CODNATUREZA = ' + quotedstr(pNat);

//  sSql := sSql + '      AND trim(ff.numdocumento) IN (''69342903134'',  ''01842345907'', ''93146779668'', ''05989881495'', ''90806603100'' )' ;

  sSql := sSql + 'GROUP BY FF.IDDIRF,     ';
  sSql := sSql + '  FF.CODNATUREZA,       ';
  sSql := sSql + '  FF.NUMDOCUMENTO,      ';
  sSql := sSql + '  FF.IDPESSOA,          ';
  sSql := sSql + '  TRANSLATE(FF.NOME, ''ÁÇÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕËÜáçéíóúàèìòùâêîôûãõëü*'',''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu ''), ';
  sSql := sSql + '  FF.FLGMARCADO               ';
  //Cássio Rovaroto - SIG nº 64340
  sSql := sSql + '  , FF.EXERCICIODIRF          ';
  sSql := sSql + 'ORDER BY FF.CODNATUREZA, FF.NUMDOCUMENTO ASC  ';
  Result := GetDataPacket(sSql);
End;

Function TCtrlGeraDIRF_Novo.ListaDIRF_MovDetFF(Const pIdDIRF: Integer; pNat, pCPF: String): String;
Var sSql: String;
Begin
  sSql := 'SELECT FF.IDDIRF,                                   ';
  sSql := sSql + '     FF.IDDIRFMOVANALITICO,                  ';
  sSql := sSql + '     FF.EXERCICIODIRF,                       ';
  sSql := sSql + '     FF.CODNATUREZA,                         ';
  sSql := sSql + '     FF.DATALANCAMENTO,                      ';
  sSql := sSql + '     TO_CHAR(FF.DATAPAGAMENTO, ''MM'') MES,  ';
  sSql := sSql + '     FF.DATAPAGAMENTO,                       ';
  sSql := sSql + '     FF.IDPESSOA,                            ';
  sSql := sSql + '     FF.NOME,                                ';
  sSql := sSql + '     FF.NUMDOCUMENTO,                        ';
  sSql := sSql + '     FF.IDINFORME,                           ';
  sSql := sSql + '     FF.IDLANCIRRF,                          ';
  sSql := sSql + '     FF.CODDIRF,                             ';
  sSql := sSql + '     NVL(FF.VLRRENDIMENTO, 0) VLRRENDIMENTO, ';
  sSql := sSql + '     NVL(FF.VLRIMPOSTO, 0) VLRIMPOSTO,       ';
  sSql := sSql + '     NVL(FF.VLROUTROS, 0) VLROUTROS,         ';
  sSql := sSql + '     FF.FLGTIPOCRIACAO,                      ';
  sSql := sSql + '     FF.FLGMARCADO,                          ';
  sSql := sSql + '     I.NOMEINFORME                           ';
  sSql := sSql + 'FROM DIRF_MOVANALITICO_FF FF, INFORME I      ';
  sSql := sSql + 'WHERE FF.IDDIRF = ' + inttostr(pIdDIRF);
  sSql := sSql + '      AND FF.CODNATUREZA = ' + quotedstr(pNat);
  sSql := sSql + '      AND FF.NUMDOCUMENTO = ' + quotedstr(pCPF);
  sSql := sSql + '      AND FF.IDINFORME = I.IDINFORME        ';
  sSql := sSql + 'ORDER BY FF.CODNATUREZA,                    ';
  sSql := sSql + '         FF.NUMDOCUMENTO,                   ';
  sSql := sSql + '         MES,                               ';
  sSql := sSql + '         FF.DATAPAGAMENTO,                  ';
  sSql := sSql + '         FF.CODDIRF ASC                     ';
  Result := sSql;
End;

Function TCtrlGeraDIRF_Novo.ListaDIRF_MovResumo(Const pIdDIRF: Integer; pNat, pCPF: String): String;
Var sSql: String;
Begin
  sSql := '   SELECT * FROM (               ';
  sSql := sSql + 'SELECT 0 ORD,             ';
  sSql := sSql + '    FF.IDDIRF,            ';
  sSql := sSql + '    FF.CODNATUREZA,       ';
  sSql := sSql + '    FF.NUMDOCUMENTO,      ';
  sSql := sSql + '    FF.CODDIRF,           ';
  sSql := sSql + '    I.CODINFORME,         ';
  sSql := sSql + '    SUBSTR(TRANSLATE(I.NOMEINFORME, ''ÁÇÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕËÜáçéíóúàèìòùâêîôûãõëü*'',''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu ''),1,21) NOMEINFORME,        ';
  sSql := sSql + '    FF.FLGMARCADO,        ';
  sSql := sSql + '    CASE                  ';
  sSql := sSql + '       WHEN FF.CODDIRF IN (2, 5) THEN NVL(SUM(FF.VLRRENDIMENTO), 0)  ';
  sSql := sSql + '       WHEN FF.CODDIRF IN (3, 7) THEN NVL(SUM(FF.VLRIMPOSTO), 0)     ';
  sSql := sSql + '       ELSE NVL(SUM(FF.VLROUTROS), 0)                                ';
  sSql := sSql + '    END VLRTOTAL                                                     ';
  sSql := sSql + 'FROM DIRF_MOVANALITICO_FF FF, INFORME I                              ';
  sSql := sSql + 'WHERE FF.IDDIRF = ' + inttostr(pIdDIRF);
  sSql := sSql + '      AND FF.CODNATUREZA = ' + quotedstr(pNat);
  sSql := sSql + '      AND FF.NUMDOCUMENTO = ' + quotedstr(pCPF);
  sSql := sSql + '      AND FF.IDINFORME = I.IDINFORME        ';
  sSql := sSql + 'GROUP BY FF.IDDIRF,                         ';
  sSql := sSql + '         FF.CODNATUREZA,                    ';
  sSql := sSql + '         FF.NUMDOCUMENTO,                   ';
  sSql := sSql + '         FF.CODDIRF,                        ';
  sSql := sSql + '         I.CODINFORME,                      ';
  sSql := sSql + '         SUBSTR(TRANSLATE(I.NOMEINFORME, ''ÁÇÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕËÜáçéíóúàèìòùâêîôûãõëü*'',''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu ''),1,21),                     ';
  sSql := sSql + '         FF.FLGMARCADO                      ';
  sSql := sSql + 'UNION                                       ';
  // Por sugestão da Gestora Marta Ledur, este union foi para apresentar
  // uma totalização líquida do 13º, para efeito se simples conferência
  // esta informação não constará no arquivo da DIRF
  sSql := sSql + 'SELECT 1 ORD,                               ';
  sSql := sSql + '       IDDIRF,                              ';
  sSql := sSql + '       CODNATUREZA,                         ';
  sSql := sSql + '       NUMDOCUMENTO,                        ';
  sSql := sSql + '       NULL CODDIRF,                        ';
  sSql := sSql + '       NULL CODINFORME,                     ';
  sSql := sSql + '       NOMEINFORME,                         ';
  sSql := sSql + '       FLGMARCADO,                          ';
  sSql := sSql + '       NVL(SUM(VLRTOTAL), 0) VLRTOTAL       ';
  sSql := sSql + 'FROM (SELECT FF.IDDIRF,                     ';
  sSql := sSql + '             FF.CODNATUREZA,                ';
  sSql := sSql + '             FF.NUMDOCUMENTO,               ';
  sSql := sSql + '             FF.CODDIRF,                    ';
  sSql := sSql + '             ''Vlr.Líquido 13º salário (simples conferência)'' NOMEINFORME,  ';
  sSql := sSql + '             FF.FLGMARCADO,                 ';
  sSql := sSql + '             CASE                           ';
  sSql := sSql + '                WHEN FF.CODDIRF = 5 THEN NVL(SUM(FF.VLRRENDIMENTO), 0)   '; // 13º. Salário - Rendimento
  sSql := sSql + '                WHEN FF.CODDIRF = 7 THEN NVL(SUM(FF.VLRIMPOSTO), 0) '; // 13º. Salário - IRRF
  sSql := sSql + '                ELSE NVL(SUM(FF.VLROUTROS), 0)                                ';
  sSql := sSql + '             END VLRTOTAL                                                     ';
  sSql := sSql + '      FROM DIRF_MOVANALITICO_FF FF, INFORME I                                 ';
  sSql := sSql + '      WHERE FF.IDDIRF = ' + inttostr(pIdDIRF);
  sSql := sSql + '            AND FF.CODNATUREZA = ' + quotedstr(pNat);
  sSql := sSql + '            AND FF.NUMDOCUMENTO = ' + quotedstr(pCPF);
  sSql := sSql + '            AND FF.IDINFORME = I.IDINFORME                                    ';
  sSql := sSql + '            AND FF.CODDIRF IN (5, 7, 22, 23, 24, 25)                          ';
  sSql := sSql + '      GROUP BY FF.IDDIRF,                                                     ';
  sSql := sSql + '               FF.CODNATUREZA,                                                ';
  sSql := sSql + '               FF.NUMDOCUMENTO,                                               ';
  sSql := sSql + '               FF.CODDIRF,                                                    ';
  sSql := sSql + '               I.NOMEINFORME,                                                 ';
  sSql := sSql + '               FF.FLGMARCADO )                                                ';
  sSql := sSql + 'GROUP BY IDDIRF,                                                              ';
  sSql := sSql + '         CODNATUREZA,                                                         ';
  sSql := sSql + '         NUMDOCUMENTO,                                                        ';
  sSql := sSql + '         NULL,                                                                ';
  sSql := sSql + '         NULL,                                                                ';
  sSql := sSql + '         NOMEINFORME,                                                         ';
  sSql := sSql + '         FLGMARCADO  )                                                        ';
  sSql := sSql + 'ORDER BY ORD, IDDIRF, CODINFORME, CODDIRF                                     ';
  Result := sSql;
End;

Function TCtrlGeraDIRF_Novo.ListaTotalDependentesPlanos(pidDIRF, pTipoPlano: integer; pCPF: String; pAnoDIRF: integer = 0; pIdPlanoSaude: integer = 0; pCodNatureza: string = ''): OleVariant;
Var sSql: String;
Begin
  sSql := 'SELECT IDDIRF,                                      ';
  sSql := sSql + '    CPFTITULAR,                              ';
  sSql := sSql + '    CPFDEPEN,                                ';
  sSql := sSql + '    NOME,                                    ';
  sSql := sSql + '    DATANASC,                                ';
  sSql := sSql + '    ORDEMDEPEN,                              ';
  sSql := sSql + '    DEPENDENCIA,                             ';
  sSql := sSql + '    IDDEPENDENCIA,                           ';
  sSql := sSql + '    NVL(SUM(VALOR),0) VALOR                  ';
  sSql := sSql + '    , CODNATUREZA                            ';   //Cássio Rovaroto - SIG nº 81294
  sSql := sSql + 'FROM (SELECT P.NOME, PL.*                    ';
  sSql := sSql + '      FROM (SELECT IDDIRF,                   ';
  sSql := sSql + '                   IDDEPEN,                  ';
  sSql := sSql + '                   CPFTITULAR,               ';
  sSql := sSql + '                   CPFDEPEN,                 ';
  sSql := sSql + '                   DATANASC,                 ';
  sSql := sSql + '                   ORDEMDEPEN,               ';
  sSql := sSql + '                   DEPENDENCIA,              ';
  sSql := sSql + '                   IDDEPENDENCIA,            ';
  sSql := sSql + '                   VALOR                     ';
  sSql := sSql + '                   , CODNATUREZA             ';   //Cássio Rovaroto - SIG nº 81294
  sSql := sSql + '            FROM DIRF_MOVANALFF_DEPEN        ';
  sSql := sSql + '            WHERE IDDIRF = ' + inttostr(pIdDIRF);
  sSql := sSql + '            AND CPFTITULAR = ' + quotedstr(pCPF);
  //Cássio Rovaroto - SIG nº 81294 - Início
  if pCodNatureza <> EmptyStr then
  begin
    sSql := sSql + '                AND CODNATUREZA = ' + QuotedStr(pCodNatureza);
  end;
  //Cássio Rovaroto - SIG nº 81294 - Fim

    //Cássio Rovaroto - SIG nº 64340 - Início
  if (pAnoDIRF = 2017) and (pTipoPlano = 1) then
  begin
    //Realizando o tratamento a ser aplicado apenas para o ano de 2017 onde para o plano de saúde BRADESCO se traga as informações
    //de Janeiro a Novembro; e para o plano AMIL, somente Dezembro.
    if pIdPlanoSaude = 304777 then // 304777 => AMIL
      sSql := sSql + '               AND MES = ' + QuotedStr('12')
    else
      sSql := sSql + '               AND MES <> ' + QuotedStr('12');
  end;
  //Cássio Rovaroto - SIG nº 64340 - Fim



  If pTipoPlano = 1 Then
    sSql := sSql + '               AND FLGASSISTENCIAL = 1 ) PL'; // Plano Saúde
  If pTipoPlano = 2 Then
    sSql := sSql + '               AND FLGASSISTENCIAL = 2 ) PL'; // Plano Odonto
  sSql := sSql + '            JOIN PESSOA P ON P.IDPESSOA = (SELECT MAX(P2.IDPESSOA)  '; // Pega o ultimo nome da pessoa, caso ele tenha mudado
  sSql := sSql + '                                           FROM PESSOA P2           ';
  sSql := sSql + '                                           WHERE ((PL.CPFDEPEN = P2.NUMDOCUMENTO) OR  ';
  sSql := sSql + '                                                  (PL.IDDEPEN = P2.IDPESSOA)))   )    ';
  sSql := sSql + ' GROUP BY IDDIRF,            ';
  sSql := sSql + '          CPFTITULAR,        ';
  sSql := sSql + '          CPFDEPEN,          ';
  sSql := sSql + '          NOME,              ';
  sSql := sSql + '          DATANASC,          ';
  sSql := sSql + '          ORDEMDEPEN,        ';
  sSql := sSql + '          DEPENDENCIA,       ';
  sSql := sSql + '          IDDEPENDENCIA      ';
  sSql := sSql + '          , CODNATUREZA      ';   //Cássio Rovaroto - SIG nº 81294
  sSql := sSql + ' ORDER BY CPFTITULAR, ORDEMDEPEN, CPFDEPEN, DATANASC  ';
  Result := GetDataPacket(sSql);
End;

Function TCtrlGeraDIRF_Novo.ListaDadosDependentesPlanos(pidDIRF, pTipoPlano: integer; pCPFT, pCPFD, pNomeDepen: String; pCodNatureza: String = ''): OleVariant;
Var sSql: String;
Begin
  sSql := ' SELECT PL.*, P.NOME, PD.DESCRICAO                   ';
  sSql := sSql + 'FROM (SELECT IDDIRF,                          ';
  sSql := sSql + '             IDDIRFMOVANALFFDEPEN,            ';
  sSql := sSql + '             MES,                             ';
  sSql := sSql + '             IDTITULAR,                       ';
  sSql := sSql + '             IDDEPEN,                         ';
  sSql := sSql + '             CPFTITULAR,                      ';
  sSql := sSql + '             CPFDEPEN,                        ';
  sSql := sSql + '             DATANASC,                        ';
  sSql := sSql + '             ORDEMDEPEN,                      ';
  sSql := sSql + '             DEPENDENCIA,                     ';
  sSql := sSql + '             IDDEPENDENCIA,                   ';
  sSql := sSql + '             IDPROVENTO,                      ';
  sSql := sSql + '             VALOR                            ';
  sSql := sSql + '             , CODNATUREZA                    '; //Cássio Rovaroto - SIG nº 81294
  sSql := sSql + '      FROM DIRF_MOVANALFF_DEPEN               ';
  sSql := sSql + '      WHERE IDDIRF = ' + inttostr(pIdDIRF);
  sSql := sSql + '            AND CPFTITULAR = ' + quotedstr(pCPFT);

  //Cássio Rovaroto - SIG nº 81294 - Início
  if pCodNatureza <> EmptyStr then
  begin
    sSql := sSql + '                AND CODNATUREZA = ' + QuotedStr(pCodNatureza);
  end;
  //Cássio Rovaroto - SIG nº 81294 - Fim

  If (pCPFD <> '') And (pCPFT <> pCPFD) Then
    sSql := sSql + '         AND CPFDEPEN = ' + quotedStr(pCPFD) // Se o CPF do Dependente não for nulo, pesquisa pelo CPF
  Else
    sSql := sSql + '         AND NOME LIKE ' + quotedStr(pNomeDepen + '%'); // Usado o NOME ao invés do CPF, porque tem casos de dependentes que não tem CPF

  If pTipoPlano = 1 Then
    sSql := sSql + '         AND FLGASSISTENCIAL = 1 ) PL'; // Plano Saúde
  If pTipoPlano = 2 Then
    sSql := sSql + '         AND FLGASSISTENCIAL = 2 ) PL'; // Plano Odonto

  sSql := sSql + '      JOIN PESSOA P ON P.IDPESSOA =                                  '; // Pega o ultimo nome da pessoa, caso ele tenha mudado
  sSql := sSql + '                       (SELECT MAX(P2.IDPESSOA)                      ';
  sSql := sSql + '                        FROM PESSOA P2                               ';
  sSql := sSql + '                        WHERE ((PL.CPFDEPEN = P2.NUMDOCUMENTO) OR    ';
  sSql := sSql + '                               (PL.IDDEPEN = P2.IDPESSOA)))          ';
  sSql := sSql + '      JOIN PROVDESC PD ON PD.IDPROVENTO = PL.IDPROVENTO              ';
  sSql := sSql + 'ORDER BY PL.MES, PL.IDPROVENTO                                       ';  // Paulo Nobre - TAS000000006794
  Result := GetDataPacket(sSql);
End;

Function TCtrlGeraDIRF_Novo.ListaDadosBeneficiarioPA(pidDIRF: integer; pNatur, pCPFTit: String): OleVariant;
Var sSql: String;
Begin
  sSql := ' SELECT DISTINCT IDDIRF,                      ';
  sSql := sSql + 'CPFTITULAR,                          ';
  sSql := sSql + 'CAST(regexp_replace(REGEXP_REPLACE(CPFDEPEN, ''\D''), ''([0-9]{3})([0-9]{3})([0-9]{3})([0-9]{2})'',''\1.\2.\3-\4'') AS VARCHAR2(14)) AS CPFDEPEN,  ';
  sSql := sSql + 'NOME,                             ';
  sSql := sSql + 'DATANASC,                             ';
  sSql := sSql + 'DEPENDENCIA,                           ';
  sSql := sSql + 'DECODE(DEPENDENCIA, ''03'',''Esposa'', ''Outros'') AS DSCDEPENDENCIA,    ';
  sSql := sSql + 'I.NOMEINFORME,                           ';
  sSql := sSql + 'SUM(VALOR) AS VALOR                           ';
  sSql := sSql + 'FROM DIRF_MOVANALFF_DEPEN D                                  ';
  sSql := sSql + 'JOIN INFORME I ON I.IDINFORME = D.IDINFORME AND I.CODDIRF IN (20, 24) ';
  sSql := sSql + 'WHERE IDDIRF = ' + inttostr(pIdDIRF);
  sSql := sSql + '      AND CODNATUREZA = ' + quotedstr(pNatur);
  sSql := sSql + '      AND CPFTITULAR = ' + quotedstr(pCPFTit);
  sSql := sSql + '      AND D.CODDIRF IN (20, 24)                               ';
  sSql := sSql + 'GROUP BY IDDIRF, CPFTITULAR, CPFDEPEN, NOME, DATANASC, DEPENDENCIA, DECODE(DEPENDENCIA, ''03'',''Esposa'', ''Outros''),I.NOMEINFORME   ';
  Result := GetDataPacket(sSql);
End;

//========================== FIM FOLHA FUNCIONARIOS =========================================================

//
// ****************** FUNÇÕES PARA A GERAÇÃO DO ARQUIVO DE ENVIO A RFB  **************************************
//
// Geração do Layout do arquivo de exportação
//

Procedure TCtrlGeraDIRF_Novo.AtualizaFrmProgresso(Var iContador: Integer);
Begin
  inc(iContador);
  frmProgresso.AndaFormProgresso(iContador);
  Application.ProcessMessages;
End;

Function TCtrlGeraDIRF_Novo.AjustaValor(pValor: double): double;
Begin
  If (pValor <= 0.00) Then
    result := 0
  Else
    result := pValor;
End;

Function TCtrlGeraDIRF_Novo.CriaArquivo(pArquivo: String): Boolean;
Begin
  Result := False;
  Try
    AssignFile(ArquivoEnvioRFB, pArquivo);
    Rewrite(ArquivoEnvioRFB);
    CloseFile(ArquivoEnvioRFB);

    Result := True;
  Except
    Result := False;
  End;
End;

Function TCtrlGeraDIRF_Novo.Exporta(
  pTipoMov,
  pNomeArquivoCompleto,
  pGeraArqComMovFF,
  pGeraArqComMovFB: String;
  pQryDIRFGeradas,
  pQryDIRFMovSintTributos,
  pQryDadosAdicionais,
  pQryDIRFMovSintTributosFF: TwwQuery;
  // Paulo Nobre SIG 34459 - Inicio
  //  pQryDIRFMovDetFF: TwwQuery;
  //  pCdsDIRFMovSintCNPJ,
  //  pCdsDIRFMovSintFF,
    // Paulo Nobre SIG 34459 - Fim
  pCdsDepPlanoSaudeTot,
  pCdsDepPlanoOdontoTot: TCMClientDataSet): Boolean;
Var iContador, iOrdemDaLinha: Integer;
  sLinha, sCodNaturezaAnt, sCodNaturezaAtu, sTipoIdentLinha, pAlimentando, pPrevCompl: String; // Denis Horongoso SIG 61375
  sNumRecibo : string;   //edilaine SIG124014
  _qryAux: Twwquery;
  _qryAux2: Twwquery;

  Procedure GravaLinhasCP_PessoaJuridica; // Pessoa Jurídica
  Begin
    // *******************************************************************
    // Preparando linhas para a DIRF do Contas a Pagar (Pessoas Jurídicas)
    // *******************************************************************

    pQryDIRFMovSintTributos.First;
    While Not pQryDIRFMovSintTributos.EOF Do
      Begin
        // Paulo Nobre SIG 34459 - Inicio

        // Carregado aqui um novo CDS para melhorar a performance, pois este é o maior e como estava sendo
        // usado o CDS direto da grid, a grid no metodo onRowChanged, este executando um monte de outros cds.
        _cdsDIRFMovSintCNPJ.data := LocalizaDIRF_MovSintCNPJ(
          pQryDIRFMovSintTributos.fieldByname('IDDIRF').asInteger,
          pQryDIRFMovSintTributos.fieldByname('CODNATUREZA').asString);

        _cdsDIRFMovSintCNPJ.First;
        iContador := 0;
        frmProgresso.MostraFormProgresso('Processando Tributo (CP) -> ' + pQryDIRFMovSintTributos.fieldByname('CODNATUREZA').asString, True, False, True, 0, _cdsDIRFMovSintCNPJ.RecordCount);
        While Not _cdsDIRFMovSintCNPJ.EOF Do
          Begin

            {  BPFDEC - Beneficiário pessoa física
               1   RTRT - Rendimentos Tributáveis - Rendimento Tributável - 2 - 5 (CODDIRF)
               2   RTPO - Rendimentos Tributáveis - Dedução - Previdência Oficial - 18 - 22
               3   RTDP - Rendimentos Tributáveis - Dedução - Dependentes - 19 - 23
               // WO13395 - Inclusão do Registro RTDS
               4   RTDS - Rendimentos Tributáveis - Dedução - Desconto simplificado mensal - 52 - 53
               5(4)   RTIRF - Rendimentos Tributáveis - Imposto de Renda Retido na Fonte - 3 - 7
               // WO13395 - Inclusão do Registro ESDS
               6   ESDS - Tributação com Exigibilidade Suspensa - Dedução - Desconto simplificado mensal 54 - 55
               7(4)   RTIRF - Rendimentos Tributáveis - Imposto de Renda Retido na Fonte - 3 - 7
               8(5)   INFPC
               9(6)     RTPP - Rendimentos Tributáveis - Dedução - Previdência Privada - 21 - 25
               10(7)   INFPA
               11(8)     RTPA - Rendimentos Tributáveis - Dedução - Pensão Alimentícia - 20 - 24
               12(9)   RIDAC - Ajuda de Custo/Diarias - 34
               12(9)   RIIRP - Indenizações, Recisões e Acidente Trabalho - 35
               12(9)   RIAP  - Abono Pecuniario - 36

             Exemplo de um empregado
              Mês     01     02     03     04     05     06     07     08     09     10     11     12     13º
             BPFDEC|10545941717|BARBARA FERREIRA SPALA||
            1  RTRT|350340|350340|766334|444431|373154|426016|426016|426016|426016|491969|484686|426016|429967|
            2  RTPO|38346 |38346 |43078 |43078 |40843 |43078 |43078 |43078 |43078 |43078 |43078 |43078 |43078|
            3  RTPP|17430 |17430 |20835 |18565 |18565 |21195 |21195 |21195 |21195 |21195 |21195 |21195 |21498|
            6  RTIRF|13505 |13505 |117513 |4153 |16382 |26177 |26177 |26177 |26177 |7521  |39961 |26177 |26998|   }

            AtualizaFrmProgresso(iContador);
            // Só entra se tiver algum valor no Rendimento
            If (_cdsDIRFMovSintCNPJ.FieldByName('VLRRENDIMENTO').AsFloat <> 0.00) THEN
              Begin
                // Inserindo a linha de identificação da declaração de uma Pessoa Juridica ou Prestador de Serviço
                If length(trim(_cdsDIRFMovSintCNPJ.fieldByname('NUMDOCUMENTO').AsString)) = 11 Then // CPF
                  sTipoIdentLinha := 'BPFDEC'
                Else // CNPJ
                  sTipoIdentLinha := 'BPJDEC';

                iOrdemDaLinha := 0;
                // Inserindo no arquivo temporário a primeira linha de cada CNPJ titular
                InserirLinhasArquivoTempDIRF(
                  pQryDIRFGeradas.fieldByname('IDDIRF').asInteger,
                  pQryDIRFGeradas.fieldByname('EXERCICIODIRF').asString,
                  _cdsDIRFMovSintCNPJ.fieldByname('CODNATUREZA').asString,
                  _cdsDIRFMovSintCNPJ.fieldByname('NUMDOCUMENTO').AsString,
                  iOrdemDaLinha,
                  sTipoIdentLinha,
                  _cdsDIRFMovSintCNPJ.fieldByname('RAZAOSOCIAL').AsString,
                  pTipoMov,
                  '',
                  '',
                  _cdsDIRFMovSintCNPJ.fieldByname('NUMDOCUMENTO').AsString, // CPFTITULAR
                  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
                //
                // Selecionando as Linhas - RTRT
                //
                _qryAux.Close;
                _qryAux.SQL.Clear;
                _qryAux.SQL.Add('SELECT DMA.IDDIRF,                                                                        ');
                _qryAux.SQL.Add('       DMA.CODNATUREZA,                                                                     ');
                _qryAux.SQL.Add('       DMA.NUMDOCUMENTO,                                                                    ');
                _qryAux.SQL.Add('       ''RTRT'' TIPOLINHA,                                                                  ');
                //WO8238 - Andre Imakawa
                //_qryAux.SQL.Add('       SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''01'',DMA.VLRRENDIMENTO,0)) AS VLRJAN, ');
                //_qryAux.SQL.Add('       SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''02'',DMA.VLRRENDIMENTO,0)) AS VLRFEV, ');
                //_qryAux.SQL.Add('       SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''03'',DMA.VLRRENDIMENTO,0)) AS VLRMAR, ');
                //_qryAux.SQL.Add('       SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''04'',DMA.VLRRENDIMENTO,0)) AS VLRABR, ');
                //_qryAux.SQL.Add('       SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''05'',DMA.VLRRENDIMENTO,0)) AS VLRMAI, ');
                //_qryAux.SQL.Add('       SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''06'',DMA.VLRRENDIMENTO,0)) AS VLRJUN, ');
                //_qryAux.SQL.Add('       SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''07'',DMA.VLRRENDIMENTO,0)) AS VLRJUL, ');
                //_qryAux.SQL.Add('       SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''08'',DMA.VLRRENDIMENTO,0)) AS VLRAGO, ');
                //_qryAux.SQL.Add('       SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''09'',DMA.VLRRENDIMENTO,0)) AS VLRSET, ');
                //_qryAux.SQL.Add('       SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''10'',DMA.VLRRENDIMENTO,0)) AS VLROUT, ');
                //_qryAux.SQL.Add('       SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''11'',DMA.VLRRENDIMENTO,0)) AS VLRNOV, ');
                //_qryAux.SQL.Add('       SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''12'',DMA.VLRRENDIMENTO,0)) AS VLRDEZ, ');
                _qryAux.SQL.Add('       CASE WHEN DMA.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO,''MM''),''01'',DMA.VLRRENDIMENTO,0))');
                _qryAux.SQL.Add('              ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''01'',DMA.VLRRENDIMENTO,0)) END AS VLRJAN,');
                _qryAux.SQL.Add('       CASE WHEN DMA.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO,''MM''),''02'',DMA.VLRRENDIMENTO,0))');
                _qryAux.SQL.Add('              ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''02'',DMA.VLRRENDIMENTO,0)) END AS VLRFEV,');
                _qryAux.SQL.Add('       CASE WHEN DMA.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO,''MM''),''03'',DMA.VLRRENDIMENTO,0))');
                _qryAux.SQL.Add('              ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''03'',DMA.VLRRENDIMENTO,0)) END AS VLRMAR,');
                _qryAux.SQL.Add('       CASE WHEN DMA.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO,''MM''),''04'',DMA.VLRRENDIMENTO,0))');
                _qryAux.SQL.Add('              ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''04'',DMA.VLRRENDIMENTO,0)) END AS VLRABR,');
                _qryAux.SQL.Add('       CASE WHEN DMA.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO,''MM''),''05'',DMA.VLRRENDIMENTO,0))');
                _qryAux.SQL.Add('              ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''05'',DMA.VLRRENDIMENTO,0)) END AS VLRMAI,');
                _qryAux.SQL.Add('       CASE WHEN DMA.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO,''MM''),''06'',DMA.VLRRENDIMENTO,0))');
                _qryAux.SQL.Add('              ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''06'',DMA.VLRRENDIMENTO,0)) END AS VLRJUN,');
                _qryAux.SQL.Add('       CASE WHEN DMA.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO,''MM''),''07'',DMA.VLRRENDIMENTO,0))');
                _qryAux.SQL.Add('              ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''07'',DMA.VLRRENDIMENTO,0)) END AS VLRJUL,');
                _qryAux.SQL.Add('       CASE WHEN DMA.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO,''MM''),''08'',DMA.VLRRENDIMENTO,0))');
                _qryAux.SQL.Add('              ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''08'',DMA.VLRRENDIMENTO,0)) END AS VLRAGO,');
                _qryAux.SQL.Add('       CASE WHEN DMA.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO,''MM''),''09'',DMA.VLRRENDIMENTO,0))');
                _qryAux.SQL.Add('              ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''09'',DMA.VLRRENDIMENTO,0)) END AS VLRSET,');
                _qryAux.SQL.Add('       CASE WHEN DMA.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO,''MM''),''10'',DMA.VLRRENDIMENTO,0))');
                _qryAux.SQL.Add('              ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''10'',DMA.VLRRENDIMENTO,0)) END AS VLROUT,');
                _qryAux.SQL.Add('       CASE WHEN DMA.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO,''MM''),''11'',DMA.VLRRENDIMENTO,0))');
                _qryAux.SQL.Add('              ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''11'',DMA.VLRRENDIMENTO,0)) END AS VLRNOV,');
                _qryAux.SQL.Add('       CASE WHEN DMA.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO,''MM''),''12'',DMA.VLRRENDIMENTO,0))');
                _qryAux.SQL.Add('              ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''12'',DMA.VLRRENDIMENTO,0)) END AS VLRDEZ,');
                //WO8238 - Andre Imakawa
                _qryAux.SQL.Add('       0.00 AS VLR13                                                                        ');
                _qryAux.SQL.Add('FROM DIRF_MOVANALITICO DMA                                                                ');
                _qryAux.SQL.Add('WHERE DMA.IDDIRF = ' + inttostr(_cdsDIRFMovSintCNPJ.fieldByname('IDDIRF').asInteger));
                _qryAux.SQL.Add('      AND DMA.CODNATUREZA = ' + quotedstr(_cdsDIRFMovSintCNPJ.fieldByname('CODNATUREZA').asString));
                _qryAux.SQL.Add('      AND DMA.NUMDOCUMENTO = ' + quotedstr(_cdsDIRFMovSintCNPJ.fieldByname('NUMDOCUMENTO').AsString));
                _qryAux.SQL.Add('      AND DMA.FLGMARCADO = ''S''                                                              ');
                _qryAux.SQL.Add('GROUP BY DMA.IDDIRF,                                                                      ');
                _qryAux.SQL.Add('         DMA.CODNATUREZA,                                                                   ');
                _qryAux.SQL.Add('         DMA.NUMDOCUMENTO,                                                                  ');
                _qryAux.SQL.Add('         ''RTRT''                                                                           ');
                _qryAux.Open;
                While Not _qryAux.EOF Do
                  Begin
                    iOrdemDaLinha := iOrdemDaLinha + 1;
                    // Inserindo no arquivo temporário as linhas selecionadas
                    InserirLinhasArquivoTempDIRF(
                      pQryDIRFGeradas.fieldByname('IDDIRF').asInteger,
                      pQryDIRFGeradas.fieldByname('EXERCICIODIRF').asString,
                      _qryAux.fieldByname('CODNATUREZA').asString,
                      _qryAux.fieldByname('NUMDOCUMENTO').AsString,
                      iOrdemDaLinha,
                      _qryAux.fieldByname('TIPOLINHA').asString,
                      _cdsDIRFMovSintCNPJ.fieldByname('RAZAOSOCIAL').AsString,
                      pTipoMov,
                      '',
                      '',
                      _qryAux.fieldByname('NUMDOCUMENTO').AsString, // CPFTITULAR
                      _qryAux.fieldByname('VLRJAN').asFloat,
                      _qryAux.fieldByname('VLRFEV').asFloat,
                      _qryAux.fieldByname('VLRMAR').asFloat,
                      _qryAux.fieldByname('VLRABR').asFloat,
                      _qryAux.fieldByname('VLRMAI').asFloat,
                      _qryAux.fieldByname('VLRJUN').asFloat,
                      _qryAux.fieldByname('VLRJUL').asFloat,
                      _qryAux.fieldByname('VLRAGO').asFloat,
                      _qryAux.fieldByname('VLRSET').asFloat,
                      _qryAux.fieldByname('VLROUT').asFloat,
                      _qryAux.fieldByname('VLRNOV').asFloat,
                      _qryAux.fieldByname('VLRDEZ').asFloat,
                      _qryAux.fieldByname('VLR13').asFloat);

                    _qryAux.Next;
                  End;

                //edilaine SIG119890 : inicio
                //
                // Selecionando as Linhas - RTPP
                //
                if _cdsDIRFMovSintCNPJ.fieldByname('CODNATUREZA').asString = '0588' then
                begin
                  _qryAux.Close;
                  _qryAux.SQL.Clear;
                  _qryAux.SQL.Add('SELECT DMA.IDDIRF,                                                    ');
                  _qryAux.SQL.Add('       DMA.CODNATUREZA,                                               ');
                  _qryAux.SQL.Add('       DMA.NUMDOCUMENTO,                                              ');
                  _qryAux.SQL.Add('       ''RTPO'' TIPOLINHA,                                            ');
                  _qryAux.SQL.Add('       NVL(MAX(DECODE(LC.MES,''01'',LC.VLROUTROS,0)),0) AS VLRJAN,    ');
                  _qryAux.SQL.Add('       NVL(MAX(DECODE(LC.MES,''02'',LC.VLROUTROS,0)),0) AS VLRFEV,    ');
                  _qryAux.SQL.Add('       NVL(MAX(DECODE(LC.MES,''03'',LC.VLROUTROS,0)),0) AS VLRMAR,    ');
                  _qryAux.SQL.Add('       NVL(MAX(DECODE(LC.MES,''04'',LC.VLROUTROS,0)),0) AS VLRABR,    ');
                  _qryAux.SQL.Add('       NVL(MAX(DECODE(LC.MES,''05'',LC.VLROUTROS,0)),0) AS VLRMAI,    ');
                  _qryAux.SQL.Add('       NVL(MAX(DECODE(LC.MES,''06'',LC.VLROUTROS,0)),0) AS VLRJUN,    ');
                  _qryAux.SQL.Add('       NVL(MAX(DECODE(LC.MES,''07'',LC.VLROUTROS,0)),0) AS VLRJUL,    ');
                  _qryAux.SQL.Add('       NVL(MAX(DECODE(LC.MES,''08'',LC.VLROUTROS,0)),0) AS VLRAGO,    ');
                  _qryAux.SQL.Add('       NVL(MAX(DECODE(LC.MES,''09'',LC.VLROUTROS,0)),0) AS VLRSET,    ');
                  _qryAux.SQL.Add('       NVL(MAX(DECODE(LC.MES,''10'',LC.VLROUTROS,0)),0) AS VLROUT,    ');
                  _qryAux.SQL.Add('       NVL(MAX(DECODE(LC.MES,''11'',LC.VLROUTROS,0)),0) AS VLRNOV,    ');
                  _qryAux.SQL.Add('       NVL(MAX(DECODE(LC.MES,''12'',LC.VLROUTROS,0)),0) AS VLRDEZ,    ');
                  _qryAux.SQL.Add('       0.00 AS VLR13                                                  ');
                  _qryAux.SQL.Add('FROM DIRF_MOVANALITICO DMA                                            ');
                  _qryAux.SQL.Add('JOIN (SELECT L.NUMDOCUMENTO,                                          ');
                  _qryAux.SQL.Add('             SUM(VLRINSS) AS VLROUTROS,                               ');
                  _qryAux.SQL.Add('             TO_CHAR(L.DATAPAGAMENTO, ''MM'') AS MES                  ');
                  _qryAux.SQL.Add('        FROM LANCIRRF L, LANCXINFORME LX, LANCTODOCUM LD              ');
                  _qryAux.SQL.Add('       WHERE L.IDLANCIRRF = LX.IDLANCIRRF                             ');
                  _qryAux.SQL.Add('         AND TO_CHAR(L.DATAPAGAMENTO, ''YYYY'') = '+quotedstr(pQryDIRFGeradas.fieldByname('EXERCICIODIRF').AsString) );
                  _qryAux.SQL.Add('         AND LX.IDINFORME = 150                                       ');
                  _qryAux.SQL.Add('         AND L.CODDOCUMENTO = LD.CODDOCUMENTO                         ');
                  _qryAux.SQL.Add('         AND L.NUMLANCTO = LD.NUMLANCTO                               ');
                  _qryAux.SQL.Add('         AND LD.OPERACAO = 4                                          ');
                  _qryAux.SQL.Add('         AND LD.CODALTERADOR = 205                                    ');
                  _qryAux.SQL.Add('         AND L.NUMDOCUMENTO = ' + quotedstr(Trim(_cdsDIRFMovSintCNPJ.fieldByname('NUMDOCUMENTO').AsString)) );
                  _qryAux.SQL.Add('         GROUP BY L.NUMDOCUMENTO, TO_CHAR(L.DATAPAGAMENTO, ''MM'')    ');
                  _qryAux.SQL.Add('     ) LC ON LC.NUMDOCUMENTO = DMA.NUMDOCUMENTO                       ');

                  _qryAux.SQL.Add('WHERE DMA.IDDIRF = ' + inttostr(_cdsDIRFMovSintCNPJ.fieldByname('IDDIRF').asInteger));
                  _qryAux.SQL.Add('      AND DMA.CODNATUREZA = ' + quotedstr(_cdsDIRFMovSintCNPJ.fieldByname('CODNATUREZA').asString));
                  _qryAux.SQL.Add('      AND DMA.NUMDOCUMENTO = ' + quotedstr(_cdsDIRFMovSintCNPJ.fieldByname('NUMDOCUMENTO').AsString));
                  _qryAux.SQL.Add('      AND DMA.FLGMARCADO = ''S''                                      ');
                  _qryAux.SQL.Add('GROUP BY DMA.IDDIRF,                                                  ');
                  _qryAux.SQL.Add('         DMA.CODNATUREZA,                                             ');
                  _qryAux.SQL.Add('         DMA.NUMDOCUMENTO,                                            ');
                  _qryAux.SQL.Add('         ''RTPO''                                                     ');
                  _qryAux.Open;
                  While Not _qryAux.EOF Do
                    Begin
                      iOrdemDaLinha := iOrdemDaLinha + 1;
                      // Inserindo no arquivo temporário as linhas selecionadas
                      InserirLinhasArquivoTempDIRF(
                        pQryDIRFGeradas.fieldByname('IDDIRF').asInteger,
                        pQryDIRFGeradas.fieldByname('EXERCICIODIRF').asString,
                        _qryAux.fieldByname('CODNATUREZA').asString,
                        _qryAux.fieldByname('NUMDOCUMENTO').AsString,
                        iOrdemDaLinha,
                        _qryAux.fieldByname('TIPOLINHA').asString,
                        _cdsDIRFMovSintCNPJ.fieldByname('RAZAOSOCIAL').AsString,
                        pTipoMov,
                        '',
                        '',
                        _qryAux.fieldByname('NUMDOCUMENTO').AsString, // CPFTITULAR
                        _qryAux.fieldByname('VLRJAN').asFloat,
                        _qryAux.fieldByname('VLRFEV').asFloat,
                        _qryAux.fieldByname('VLRMAR').asFloat,
                        _qryAux.fieldByname('VLRABR').asFloat,
                        _qryAux.fieldByname('VLRMAI').asFloat,
                        _qryAux.fieldByname('VLRJUN').asFloat,
                        _qryAux.fieldByname('VLRJUL').asFloat,
                        _qryAux.fieldByname('VLRAGO').asFloat,
                        _qryAux.fieldByname('VLRSET').asFloat,
                        _qryAux.fieldByname('VLROUT').asFloat,
                        _qryAux.fieldByname('VLRNOV').asFloat,
                        _qryAux.fieldByname('VLRDEZ').asFloat,
                        _qryAux.fieldByname('VLR13').asFloat);

                      _qryAux.Next;
                    End;
                end;
                //edilaine SIG119890 : fim


                //
                // Selecionando as Linhas - RTIRF
                //
                _qryAux.Close;
                _qryAux.SQL.Clear;
                _qryAux.SQL.Add('SELECT DMA.IDDIRF,                                                                        ');
                _qryAux.SQL.Add('       DMA.CODNATUREZA,                                                                     ');
                _qryAux.SQL.Add('       DMA.NUMDOCUMENTO,                                                                    ');
                _qryAux.SQL.Add('       ''RTIRF'' TIPOLINHA,                                                                 ');
                //WO8238 - Andre Imakawa
                {
                _qryAux.SQL.Add('       SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''01'',DMA.VLRIMPOSTO,0)) AS VLRJAN,    ');
                _qryAux.SQL.Add('       SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''02'',DMA.VLRIMPOSTO,0)) AS VLRFEV,    ');
                _qryAux.SQL.Add('       SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''03'',DMA.VLRIMPOSTO,0)) AS VLRMAR,    ');
                _qryAux.SQL.Add('       SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''04'',DMA.VLRIMPOSTO,0)) AS VLRABR,    ');
                _qryAux.SQL.Add('       SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''05'',DMA.VLRIMPOSTO,0)) AS VLRMAI,    ');
                _qryAux.SQL.Add('       SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''06'',DMA.VLRIMPOSTO,0)) AS VLRJUN,    ');
                _qryAux.SQL.Add('       SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''07'',DMA.VLRIMPOSTO,0)) AS VLRJUL,    ');
                _qryAux.SQL.Add('       SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''08'',DMA.VLRIMPOSTO,0)) AS VLRAGO,    ');
                _qryAux.SQL.Add('       SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''09'',DMA.VLRIMPOSTO,0)) AS VLRSET,    ');
                _qryAux.SQL.Add('       SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''10'',DMA.VLRIMPOSTO,0)) AS VLROUT,    ');
                _qryAux.SQL.Add('       SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''11'',DMA.VLRIMPOSTO,0)) AS VLRNOV,    ');
                _qryAux.SQL.Add('       SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''12'',DMA.VLRIMPOSTO,0)) AS VLRDEZ,    ');
                }

                _qryAux.SQL.Add('       CASE WHEN DMA.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO,''MM''),''01'',DMA.VLRIMPOSTO,0))');
                _qryAux.SQL.Add('              ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''01'',DMA.VLRIMPOSTO,0)) END AS VLRJAN,');
                _qryAux.SQL.Add('       CASE WHEN DMA.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO,''MM''),''02'',DMA.VLRIMPOSTO,0))');
                _qryAux.SQL.Add('              ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''02'',DMA.VLRIMPOSTO,0)) END AS VLRFEV,');
                _qryAux.SQL.Add('       CASE WHEN DMA.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO,''MM''),''03'',DMA.VLRIMPOSTO,0))');
                _qryAux.SQL.Add('              ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''03'',DMA.VLRIMPOSTO,0)) END AS VLRMAR,');
                _qryAux.SQL.Add('       CASE WHEN DMA.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO,''MM''),''04'',DMA.VLRIMPOSTO,0))');
                _qryAux.SQL.Add('              ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''04'',DMA.VLRIMPOSTO,0)) END AS VLRABR,');
                _qryAux.SQL.Add('       CASE WHEN DMA.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO,''MM''),''05'',DMA.VLRIMPOSTO,0))');
                _qryAux.SQL.Add('              ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''05'',DMA.VLRIMPOSTO,0)) END AS VLRMAI,');
                _qryAux.SQL.Add('       CASE WHEN DMA.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO,''MM''),''06'',DMA.VLRIMPOSTO,0))');
                _qryAux.SQL.Add('              ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''06'',DMA.VLRIMPOSTO,0)) END AS VLRJUN,');
                _qryAux.SQL.Add('       CASE WHEN DMA.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO,''MM''),''07'',DMA.VLRIMPOSTO,0))');
                _qryAux.SQL.Add('              ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''07'',DMA.VLRIMPOSTO,0)) END AS VLRJUL,');
                _qryAux.SQL.Add('       CASE WHEN DMA.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO,''MM''),''08'',DMA.VLRIMPOSTO,0))');
                _qryAux.SQL.Add('              ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''08'',DMA.VLRIMPOSTO,0)) END AS VLRAGO,');
                _qryAux.SQL.Add('       CASE WHEN DMA.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO,''MM''),''09'',DMA.VLRIMPOSTO,0))');
                _qryAux.SQL.Add('              ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''09'',DMA.VLRIMPOSTO,0)) END AS VLRSET,');
                _qryAux.SQL.Add('       CASE WHEN DMA.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO,''MM''),''10'',DMA.VLRIMPOSTO,0))');
                _qryAux.SQL.Add('              ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''10'',DMA.VLRIMPOSTO,0)) END AS VLROUT,');
                _qryAux.SQL.Add('       CASE WHEN DMA.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO,''MM''),''11'',DMA.VLRIMPOSTO,0))');
                _qryAux.SQL.Add('              ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''11'',DMA.VLRIMPOSTO,0)) END AS VLRNOV,');
                _qryAux.SQL.Add('       CASE WHEN DMA.CODNATUREZA IN (''1708'',''8045'') THEN SUM(DECODE(TO_CHAR(DMA.DATALANCAMENTO,''MM''),''12'',DMA.VLRIMPOSTO,0))');
                _qryAux.SQL.Add('              ELSE SUM(DECODE(TO_CHAR(DMA.DATAPAGAMENTO,''MM''),''12'',DMA.VLRIMPOSTO,0)) END AS VLRDEZ,');
                //WO8238 - Andre Imakawa
                _qryAux.SQL.Add('       0.00 AS VLR13                                                                        ');
                _qryAux.SQL.Add('FROM DIRF_MOVANALITICO DMA                                                                ');
                _qryAux.SQL.Add('WHERE DMA.IDDIRF = ' + inttostr(_cdsDIRFMovSintCNPJ.fieldByname('IDDIRF').asInteger));
                _qryAux.SQL.Add('      AND DMA.CODNATUREZA = ' + quotedstr(_cdsDIRFMovSintCNPJ.fieldByname('CODNATUREZA').asString));
                _qryAux.SQL.Add('      AND DMA.NUMDOCUMENTO = ' + quotedstr(_cdsDIRFMovSintCNPJ.fieldByname('NUMDOCUMENTO').AsString));
                _qryAux.SQL.Add('      AND DMA.FLGMARCADO = ''S''                                                              ');
                _qryAux.SQL.Add('GROUP BY DMA.IDDIRF,                                                                      ');
                _qryAux.SQL.Add('         DMA.CODNATUREZA,                                                                   ');
                _qryAux.SQL.Add('         DMA.NUMDOCUMENTO,                                                                  ');
                _qryAux.SQL.Add('         ''RTIRF''                                                                         ');
                _qryAux.Open;
                While Not _qryAux.EOF Do
                  Begin
                    iOrdemDaLinha := iOrdemDaLinha + 1;
                    // Inserindo no arquivo temporário as linhas selecionadas
                    InserirLinhasArquivoTempDIRF(
                      pQryDIRFGeradas.fieldByname('IDDIRF').asInteger,
                      pQryDIRFGeradas.fieldByname('EXERCICIODIRF').asString,
                      _qryAux.fieldByname('CODNATUREZA').asString,
                      _qryAux.fieldByname('NUMDOCUMENTO').AsString,
                      iOrdemDaLinha,
                      _qryAux.fieldByname('TIPOLINHA').asString,
                      _cdsDIRFMovSintCNPJ.fieldByname('RAZAOSOCIAL').AsString,
                      pTipoMov,
                      '',
                      '',
                      _qryAux.fieldByname('NUMDOCUMENTO').AsString, // CPFTITULAR
                      _qryAux.fieldByname('VLRJAN').asFloat,
                      _qryAux.fieldByname('VLRFEV').asFloat,
                      _qryAux.fieldByname('VLRMAR').asFloat,
                      _qryAux.fieldByname('VLRABR').asFloat,
                      _qryAux.fieldByname('VLRMAI').asFloat,
                      _qryAux.fieldByname('VLRJUN').asFloat,
                      _qryAux.fieldByname('VLRJUL').asFloat,
                      _qryAux.fieldByname('VLRAGO').asFloat,
                      _qryAux.fieldByname('VLRSET').asFloat,
                      _qryAux.fieldByname('VLROUT').asFloat,
                      _qryAux.fieldByname('VLRNOV').asFloat,
                      _qryAux.fieldByname('VLRDEZ').asFloat,
                      _qryAux.fieldByname('VLR13').asFloat);

                    _qryAux.Next;
                  End;

              End;

            _cdsDIRFMovSintCNPJ.Next;

          End;

        pQryDIRFMovSintTributos.Next;

      End;
    // Paulo Nobre SIG 34459 - Fim
  End;

  Procedure GravaLinhasFF_EmpregadosEPFPrestadorServico; // Empregados e Pessoa Fisica Prestador de Serviço
  Var
  // Paulo Nobre - WO19478 - Inicio
  vlGravarJAN, vlGravarFEV, vlGravarMAR, vlGravarABR, vlGravarMAI, vlGravarJUN,
  vlGravarJUL, vlGravarAGO, vlGravarSET, vlGravarOUT, vlGravarNOV, vlGravarDEZ : Double;
  flgPrimeiroPositivoJAN, flgPrimeiroPositivoFEV, flgPrimeiroPositivoMAR, flgPrimeiroPositivoABR, flgPrimeiroPositivoMAI, flgPrimeiroPositivoJUN,
  flgPrimeiroPositivoJUL, flgPrimeiroPositivoAGO, flgPrimeiroPositivoSET, flgPrimeiroPositivoOUT, flgPrimeiroPositivoNOV, flgPrimeiroPositivoDEZ : Boolean;
  // Paulo Nobre - WO19478 - Fim
  Begin
    // *******************************************************
    // Preparando linhas para a DIRF da Folha de Empregados
    // *******************************************************
    pQryDIRFMovSintTributosFF.First;
    While Not pQryDIRFMovSintTributosFF.EOF Do
      Begin
        // Paulo Nobre SIG 34459 - Inicio

// Quando for gerado pela CONTAB (CP), precisa chamar a função p/ recarregar o CDS
{        If pTipoMov <> 'FF' Then
  Begin
    // Movimento Sintetico
    _CdsMovimentoFF.data := ListaDIRF_MovSintFF(
      pQryDIRFMovSintTributosFF.fieldByname('IDDIRF').asInteger,
      pQryDIRFMovSintTributosFF.fieldByname('CODNATUREZA').asString);
  End;   }

         // Carregado aqui um novo CDS para melhorar a performance, pois este é o maior e como estava sendo
         // usado o CDS direto da grid, a grid no metodo onRowChanged, este executando um monte de outros cds.
        _cdsMovimentoFF.data := ListaDIRF_MovSintFF(
          pQryDIRFMovSintTributosFF.fieldByname('IDDIRF').asInteger,
          pQryDIRFMovSintTributosFF.fieldByname('CODNATUREZA').asString);

        _CdsMovimentoFF.First;
        iContador := 0;
        frmProgresso.MostraFormProgresso('Processando Tributo (FE) -> ' + pQryDIRFMovSintTributosFF.fieldByname('CODNATUREZA').asString, True, False, True, 0, _CdsMovimentoFF.RecordCount);
        While Not _CdsMovimentoFF.EOF Do
          Begin
            AtualizaFrmProgresso(iContador);

            // Só entra Empregado que está marcado
            If (_CdsMovimentoFF.fieldByname('FLGMARCADO').asString = 'S') Then

              {            And ((TRIM(_CdsMovimentoFF.fieldByname('NUMDOCUMENTO').asString) = '57965838168') Or
                            (TRIM(_CdsMovimentoFF.fieldByname('NUMDOCUMENTO').asString) = '03920430174') Or
                            (TRIM(_CdsMovimentoFF.fieldByname('NUMDOCUMENTO').asString) = '01309334145') Or
                            (TRIM(_CdsMovimentoFF.fieldByname('NUMDOCUMENTO').asString) = '03973863113') Or
                            (TRIM(_CdsMovimentoFF.fieldByname('NUMDOCUMENTO').asString) = '71299211100') Or
                            (TRIM(_CdsMovimentoFF.fieldByname('NUMDOCUMENTO').asString) = '00832672122')) Then    }
              Begin
                {  BPFDEC - Beneficiário pessoa física
                   1   RTRT - Rendimentos Tributáveis - Rendimento Tributável - 2 - 5 (CODDIRF)
                   2   RTPO - Rendimentos Tributáveis - Dedução - Previdência Oficial - 18 - 22
                   3   RTDP - Rendimentos Tributáveis - Dedução - Dependentes - 19 - 23
                   // WO13395 - Inclusão do Registro RTDS
                   4   RTDS - Rendimentos Tributáveis - Dedução - Desconto simplificado mensal - 52 - 53
                   5(4)   RTIRF - Rendimentos Tributáveis - Imposto de Renda Retido na Fonte - 3 - 7
                   // WO13395 - Inclusão do Registro ESDS
                   6   ESDS - Tributação com Exigibilidade Suspensa - Dedução - Desconto simplificado mensal 54 - 55
                   7(5)   INFPC
                   8(6)     RTPP - Rendimentos Tributáveis - Dedução - Previdência Privada - 21 - 25
                   9(7)   INFPA
                   10(8)     RTPA - Rendimentos Tributáveis - Dedução - Pensão Alimentícia - 20 - 24
                   11(9)   RIDAC - Ajuda de Custo/Diarias - 34
                   11(9)   RIIRP - Indenizações, Recisões e Acidente Trabalho - 35
                   11(9)   RIAP  - Abono Pecuniario - 36

                 Exemplo de um empregado
                  Mês     01     02     03     04     05     06     07     08     09     10     11     12     13º
                 BPFDEC|10545941717|BARBARA FERREIRA SPALA||
                1  RTRT|350340|350340|766334|444431|373154|426016|426016|426016|426016|491969|484686|426016|429967|
                2  RTPO|38346 |38346 |43078 |43078 |40843 |43078 |43078 |43078 |43078 |43078 |43078 |43078 |43078|
                3  RTPP|17430 |17430 |20835 |18565 |18565 |21195 |21195 |21195 |21195 |21195 |21195 |21195 |21498|
                6  RTIRF|13505 |13505 |117513 |4153 |16382 |26177 |26177 |26177 |26177 |7521  |39961 |26177 |26998|
               }

                // Inserindo a linha de identificação da declaração de uma Pessoa Fisica ou Jurídica
                //
                If length(trim(_CdsMovimentoFF.fieldByname('NUMDOCUMENTO').AsString)) = 11 Then // CPF
                  sTipoIdentLinha := 'BPFDEC'
                Else // CNPJ
                  sTipoIdentLinha := 'BPJDEC';

                iOrdemDaLinha := 0;
                // Inserindo no arquivo temporário a primeira linha de cada CPF titular
                InserirLinhasArquivoTempDIRF(
                  pQryDIRFGeradas.fieldByname('IDDIRF').asInteger,
                  pQryDIRFGeradas.fieldByname('EXERCICIODIRF').asString,
                  _CdsMovimentoFF.fieldByname('CODNATUREZA').asString,
                  _CdsMovimentoFF.fieldByname('NUMDOCUMENTO').AsString,
                  iOrdemDaLinha, // Ordem
                  sTipoIdentLinha,
                  _CdsMovimentoFF.fieldByname('NOME').AsString,
                  pTipoMov,
                  '',
                  '',
                  _CdsMovimentoFF.fieldByname('NUMDOCUMENTO').AsString, // CPFTITULAR
                  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

                // Paulo Nobre SIG 34459 - Inicio
                //
                // Selecionando as Linhas - RTRT
                //
                _qryAux.Close;
                _qryAux.SQL.Clear;
                _qryAux.SQL.Add('SELECT DMA.IDDIRF,           ');
                _qryAux.SQL.Add('       DMA.CODNATUREZA,      ');
                _qryAux.SQL.Add('       DMA.NUMDOCUMENTO,     ');
                _qryAux.SQL.Add('       2 CODDIRF,            ');
                _qryAux.SQL.Add('       ''RTRT'' TIPOLINHA,   '); // Rendimento Tributáveis - Rendimento Tributável
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''01'',DECODE(CODDIRF,2,VLRRENDIMENTO,0))),0) AS VLRJAN,  ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''02'',DECODE(CODDIRF,2,VLRRENDIMENTO,0))),0) AS VLRFEV,  ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''03'',DECODE(CODDIRF,2,VLRRENDIMENTO,0))),0) AS VLRMAR,  ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''04'',DECODE(CODDIRF,2,VLRRENDIMENTO,0))),0) AS VLRABR,  ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''05'',DECODE(CODDIRF,2,VLRRENDIMENTO,0))),0) AS VLRMAI,  ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''06'',DECODE(CODDIRF,2,VLRRENDIMENTO,0))),0) AS VLRJUN,  ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''07'',DECODE(CODDIRF,2,VLRRENDIMENTO,0))),0) AS VLRJUL,   ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''08'',DECODE(CODDIRF,2,VLRRENDIMENTO,0))),0) AS VLRAGO,   ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''09'',DECODE(CODDIRF,2,VLRRENDIMENTO,0))),0) AS VLRSET,   ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''10'',DECODE(CODDIRF,2,VLRRENDIMENTO,0))),0) AS VLROUT,   ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''11'',DECODE(CODDIRF,2,VLRRENDIMENTO,0))),0) AS VLRNOV,   ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''12'',DECODE(CODDIRF,2,VLRRENDIMENTO,0))),0) AS VLRDEZ,   ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(CODDIRF,5,VLRRENDIMENTO,0)),0) AS VLR13                                                  ');
                _qryAux.SQL.Add('FROM DIRF_MOVANALITICO_FF DMA                                                                                ');
                _qryAux.SQL.Add('WHERE DMA.IDDIRF = ' + inttostr(_CdsMovimentoFF.fieldByname('IDDIRF').asInteger));
                _qryAux.SQL.Add('      AND DMA.CODNATUREZA = ' + quotedstr(_CdsMovimentoFF.fieldByname('CODNATUREZA').asString));
                _qryAux.SQL.Add('      AND DMA.NUMDOCUMENTO = ' + quotedstr(_CdsMovimentoFF.fieldByname('NUMDOCUMENTO').AsString));
                _qryAux.SQL.Add('      AND DMA.CODDIRF IN (2,5) AND DMA.FLGMARCADO = ''S''                                                        ');
                _qryAux.SQL.Add('GROUP BY DMA.IDDIRF, DMA.CODNATUREZA, DMA.NUMDOCUMENTO, 2, ''RTRT''                                         ');
                _qryAux.Open;
                While Not _qryAux.EOF Do
                  Begin
                    iOrdemDaLinha := iOrdemDaLinha + 1;
                    // Inserindo no arquivo temporário as linhas selecionadas
                    InserirLinhasArquivoTempDIRF(
                      pQryDIRFGeradas.fieldByname('IDDIRF').asInteger,
                      pQryDIRFGeradas.fieldByname('EXERCICIODIRF').asString,
                      _qryAux.fieldByname('CODNATUREZA').asString,
                      _qryAux.fieldByname('NUMDOCUMENTO').AsString,
                      iOrdemDaLinha,
                      _qryAux.fieldByname('TIPOLINHA').asString,
                      _CdsMovimentoFF.fieldByname('NOME').AsString,
                      pTipoMov,
                      '',
                      '',
                      _qryAux.fieldByname('NUMDOCUMENTO').AsString, // CPFTITULAR
                      _qryAux.fieldByname('VLRJAN').asFloat,
                      _qryAux.fieldByname('VLRFEV').asFloat,
                      _qryAux.fieldByname('VLRMAR').asFloat,
                      _qryAux.fieldByname('VLRABR').asFloat,
                      _qryAux.fieldByname('VLRMAI').asFloat,
                      _qryAux.fieldByname('VLRJUN').asFloat,
                      _qryAux.fieldByname('VLRJUL').asFloat,
                      _qryAux.fieldByname('VLRAGO').asFloat,
                      _qryAux.fieldByname('VLRSET').asFloat,
                      _qryAux.fieldByname('VLROUT').asFloat,
                      _qryAux.fieldByname('VLRNOV').asFloat,
                      _qryAux.fieldByname('VLRDEZ').asFloat,
                      _qryAux.fieldByname('VLR13').asFloat);

                    _qryAux.Next;
                  End;
                //
                // Selecionando as Linhas - RTPO
                //
                _qryAux.Close;
                _qryAux.SQL.Clear;
                _qryAux.SQL.Add('SELECT DMA.IDDIRF,                                                                                             ');
                _qryAux.SQL.Add('       DMA.CODNATUREZA,                                                                                        ');
                _qryAux.SQL.Add('       DMA.NUMDOCUMENTO,                                                                                       ');
                _qryAux.SQL.Add('       18 CODDIRF,                                                                                             ');
                _qryAux.SQL.Add('       ''RTPO'' TIPOLINHA,          '); // Rendimentos Tributáveis - Dedução - Previdência Oficial
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''01'',DECODE(CODDIRF,18,VLROUTROS,0))),0) AS VLRJAN,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''02'',DECODE(CODDIRF,18,VLROUTROS,0))),0) AS VLRFEV,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''03'',DECODE(CODDIRF,18,VLROUTROS,0))),0) AS VLRMAR,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''04'',DECODE(CODDIRF,18,VLROUTROS,0))),0) AS VLRABR,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''05'',DECODE(CODDIRF,18,VLROUTROS,0))),0) AS VLRMAI,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''06'',DECODE(CODDIRF,18,VLROUTROS,0))),0) AS VLRJUN,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''07'',DECODE(CODDIRF,18,VLROUTROS,0))),0) AS VLRJUL,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''08'',DECODE(CODDIRF,18,VLROUTROS,0))),0) AS VLRAGO,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''09'',DECODE(CODDIRF,18,VLROUTROS,0))),0) AS VLRSET,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''10'',DECODE(CODDIRF,18,VLROUTROS,0))),0) AS VLROUT,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''11'',DECODE(CODDIRF,18,VLROUTROS,0))),0) AS VLRNOV,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''12'',DECODE(CODDIRF,18,VLROUTROS,0))),0) AS VLRDEZ,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(CODDIRF,22,VLROUTROS,0)),0) AS VLR13                                                    ');
                _qryAux.SQL.Add('FROM DIRF_MOVANALITICO_FF DMA                                                                                 ');
                _qryAux.SQL.Add('WHERE DMA.IDDIRF = ' + inttostr(_CdsMovimentoFF.fieldByname('IDDIRF').asInteger));
                _qryAux.SQL.Add('      AND DMA.CODNATUREZA = ' + quotedstr(_CdsMovimentoFF.fieldByname('CODNATUREZA').asString));
                _qryAux.SQL.Add('      AND DMA.NUMDOCUMENTO = ' + quotedstr(_CdsMovimentoFF.fieldByname('NUMDOCUMENTO').AsString));
                _qryAux.SQL.Add('      AND DMA.CODDIRF IN (18,22) AND DMA.FLGMARCADO = ''S''                                                       ');
                _qryAux.SQL.Add('GROUP BY DMA.IDDIRF, DMA.CODNATUREZA, DMA.NUMDOCUMENTO, 18, ''RTPO''                                       ');
                _qryAux.Open;
                While Not _qryAux.EOF Do
                  Begin
                    iOrdemDaLinha := iOrdemDaLinha + 1;
                    // Inserindo no arquivo temporário as linhas selecionadas
                    InserirLinhasArquivoTempDIRF(
                      pQryDIRFGeradas.fieldByname('IDDIRF').asInteger,
                      pQryDIRFGeradas.fieldByname('EXERCICIODIRF').asString,
                      _qryAux.fieldByname('CODNATUREZA').asString,
                      _qryAux.fieldByname('NUMDOCUMENTO').AsString,
                      iOrdemDaLinha,
                      _qryAux.fieldByname('TIPOLINHA').asString,
                      _CdsMovimentoFF.fieldByname('NOME').AsString,
                      pTipoMov,
                      '',
                      '',
                      _qryAux.fieldByname('NUMDOCUMENTO').AsString, // CPFTITULAR
                      _qryAux.fieldByname('VLRJAN').asFloat,
                      _qryAux.fieldByname('VLRFEV').asFloat,
                      _qryAux.fieldByname('VLRMAR').asFloat,
                      _qryAux.fieldByname('VLRABR').asFloat,
                      _qryAux.fieldByname('VLRMAI').asFloat,
                      _qryAux.fieldByname('VLRJUN').asFloat,
                      _qryAux.fieldByname('VLRJUL').asFloat,
                      _qryAux.fieldByname('VLRAGO').asFloat,
                      _qryAux.fieldByname('VLRSET').asFloat,
                      _qryAux.fieldByname('VLROUT').asFloat,
                      _qryAux.fieldByname('VLRNOV').asFloat,
                      _qryAux.fieldByname('VLRDEZ').asFloat,
                      _qryAux.fieldByname('VLR13').asFloat);

                    _qryAux.Next;
                  End;
                //
                // Selecionando as Linhas - RTDP
                //
                _qryAux.Close;
                _qryAux.SQL.Clear;
                _qryAux.SQL.Add('SELECT DMA.IDDIRF,                                                                                            ');
                _qryAux.SQL.Add('       DMA.CODNATUREZA,                                                                                       ');
                _qryAux.SQL.Add('       DMA.NUMDOCUMENTO,                                                                                      ');
                _qryAux.SQL.Add('       19 CODDIRF,                                                                                            ');
                _qryAux.SQL.Add('       ''RTDP'' TIPOLINHA,         '); // Rendimentos Tributáveis - Dedução - Dependentes
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''01'',DECODE(CODDIRF,19,VLROUTROS,0))),0) AS VLRJAN,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''02'',DECODE(CODDIRF,19,VLROUTROS,0))),0) AS VLRFEV,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''03'',DECODE(CODDIRF,19,VLROUTROS,0))),0) AS VLRMAR,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''04'',DECODE(CODDIRF,19,VLROUTROS,0))),0) AS VLRABR,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''05'',DECODE(CODDIRF,19,VLROUTROS,0))),0) AS VLRMAI,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''06'',DECODE(CODDIRF,19,VLROUTROS,0))),0) AS VLRJUN,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''07'',DECODE(CODDIRF,19,VLROUTROS,0))),0) AS VLRJUL,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''08'',DECODE(CODDIRF,19,VLROUTROS,0))),0) AS VLRAGO,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''09'',DECODE(CODDIRF,19,VLROUTROS,0))),0) AS VLRSET,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''10'',DECODE(CODDIRF,19,VLROUTROS,0))),0) AS VLROUT,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''11'',DECODE(CODDIRF,19,VLROUTROS,0))),0) AS VLRNOV,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''12'',DECODE(CODDIRF,19,VLROUTROS,0))),0) AS VLRDEZ,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(CODDIRF,23,VLROUTROS,0)),0) AS VLR13                                                    ');
                _qryAux.SQL.Add('FROM DIRF_MOVANALITICO_FF DMA                                                                                 ');
                _qryAux.SQL.Add('WHERE DMA.IDDIRF = ' + inttostr(_CdsMovimentoFF.fieldByname('IDDIRF').asInteger));
                _qryAux.SQL.Add('      AND DMA.CODNATUREZA = ' + quotedstr(_CdsMovimentoFF.fieldByname('CODNATUREZA').asString));
                _qryAux.SQL.Add('      AND DMA.NUMDOCUMENTO = ' + quotedstr(_CdsMovimentoFF.fieldByname('NUMDOCUMENTO').AsString));
                _qryAux.SQL.Add('      AND DMA.CODDIRF IN (19,23) AND DMA.FLGMARCADO = ''S''                                                   ');
                _qryAux.SQL.Add('GROUP BY DMA.IDDIRF, DMA.CODNATUREZA, DMA.NUMDOCUMENTO, 19, ''RTDP''                                       ');
                _qryAux.Open;
                While Not _qryAux.EOF Do
                  Begin
                    iOrdemDaLinha := iOrdemDaLinha + 1;
                    // Inserindo no arquivo temporário as linhas selecionadas
                    InserirLinhasArquivoTempDIRF(
                      pQryDIRFGeradas.fieldByname('IDDIRF').asInteger,
                      pQryDIRFGeradas.fieldByname('EXERCICIODIRF').asString,
                      _qryAux.fieldByname('CODNATUREZA').asString,
                      _qryAux.fieldByname('NUMDOCUMENTO').AsString,
                      iOrdemDaLinha,
                      _qryAux.fieldByname('TIPOLINHA').asString,
                      _CdsMovimentoFF.fieldByname('NOME').AsString,
                      pTipoMov,
                      '',
                      '',
                      _qryAux.fieldByname('NUMDOCUMENTO').AsString, // CPFTITULAR
                      _qryAux.fieldByname('VLRJAN').asFloat,
                      _qryAux.fieldByname('VLRFEV').asFloat,
                      _qryAux.fieldByname('VLRMAR').asFloat,
                      _qryAux.fieldByname('VLRABR').asFloat,
                      _qryAux.fieldByname('VLRMAI').asFloat,
                      _qryAux.fieldByname('VLRJUN').asFloat,
                      _qryAux.fieldByname('VLRJUL').asFloat,
                      _qryAux.fieldByname('VLRAGO').asFloat,
                      _qryAux.fieldByname('VLRSET').asFloat,
                      _qryAux.fieldByname('VLROUT').asFloat,
                      _qryAux.fieldByname('VLRNOV').asFloat,
                      _qryAux.fieldByname('VLRDEZ').asFloat,
                      _qryAux.fieldByname('VLR13').asFloat);

                    _qryAux.Next;
                  End;
                // WO13395 - Impostos - Geração da DIRF - Desconto simplificado
                // Alterado por Arnaldo V. Scarin em 02/09/2024
                //
                // Selecionando as Linhas - RTDS
                //
                _qryAux.Close;
                _qryAux.SQL.Clear;
                _qryAux.SQL.Add('SELECT DMA.IDDIRF,                                                                                            ');
                _qryAux.SQL.Add('       DMA.CODNATUREZA,                                                                                       ');
                _qryAux.SQL.Add('       DMA.NUMDOCUMENTO,                                                                                      ');
                _qryAux.SQL.Add('       52 CODDIRF,                                                                                            ');
                _qryAux.SQL.Add('       ''RTDS'' TIPOLINHA,         '); // Rendimentos Tributáveis - Dedução - Dependentes
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''01'',DECODE(CODDIRF,52,VLROUTROS,0))),0) AS VLRJAN,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''02'',DECODE(CODDIRF,52,VLROUTROS,0))),0) AS VLRFEV,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''03'',DECODE(CODDIRF,52,VLROUTROS,0))),0) AS VLRMAR,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''04'',DECODE(CODDIRF,52,VLROUTROS,0))),0) AS VLRABR,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''05'',DECODE(CODDIRF,52,VLROUTROS,0))),0) AS VLRMAI,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''06'',DECODE(CODDIRF,52,VLROUTROS,0))),0) AS VLRJUN,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''07'',DECODE(CODDIRF,52,VLROUTROS,0))),0) AS VLRJUL,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''08'',DECODE(CODDIRF,52,VLROUTROS,0))),0) AS VLRAGO,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''09'',DECODE(CODDIRF,52,VLROUTROS,0))),0) AS VLRSET,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''10'',DECODE(CODDIRF,52,VLROUTROS,0))),0) AS VLROUT,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''11'',DECODE(CODDIRF,52,VLROUTROS,0))),0) AS VLRNOV,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''12'',DECODE(CODDIRF,52,VLROUTROS,0))),0) AS VLRDEZ,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(CODDIRF,53,VLROUTROS,0)),0) AS VLR13                                                    ');
                _qryAux.SQL.Add('FROM DIRF_MOVANALITICO_FF DMA                                                                                 ');
                _qryAux.SQL.Add('WHERE DMA.IDDIRF = ' + inttostr(_CdsMovimentoFF.fieldByname('IDDIRF').asInteger));
                _qryAux.SQL.Add('      AND DMA.CODNATUREZA = ' + quotedstr(_CdsMovimentoFF.fieldByname('CODNATUREZA').asString));
                _qryAux.SQL.Add('      AND DMA.NUMDOCUMENTO = ' + quotedstr(_CdsMovimentoFF.fieldByname('NUMDOCUMENTO').AsString));
                // Alterar Aqui
                _qryAux.SQL.Add('      AND DMA.CODDIRF IN (52,53) AND DMA.FLGMARCADO = ''S''                                                   ');
                _qryAux.SQL.Add('GROUP BY DMA.IDDIRF, DMA.CODNATUREZA, DMA.NUMDOCUMENTO, 52, ''RTDS''                                       ');
                _qryAux.Open;
                While Not _qryAux.EOF Do
                  Begin
                    iOrdemDaLinha := iOrdemDaLinha + 1;
                    // Inserindo no arquivo temporário as linhas selecionadas
                    InserirLinhasArquivoTempDIRF(
                      pQryDIRFGeradas.fieldByname('IDDIRF').asInteger,
                      pQryDIRFGeradas.fieldByname('EXERCICIODIRF').asString,
                      _qryAux.fieldByname('CODNATUREZA').asString,
                      _qryAux.fieldByname('NUMDOCUMENTO').AsString,
                      iOrdemDaLinha,
                      _qryAux.fieldByname('TIPOLINHA').asString,
                      _CdsMovimentoFF.fieldByname('NOME').AsString,
                      pTipoMov,
                      '',
                      '',
                      _qryAux.fieldByname('NUMDOCUMENTO').AsString, // CPFTITULAR
                      _qryAux.fieldByname('VLRJAN').asFloat,
                      _qryAux.fieldByname('VLRFEV').asFloat,
                      _qryAux.fieldByname('VLRMAR').asFloat,
                      _qryAux.fieldByname('VLRABR').asFloat,
                      _qryAux.fieldByname('VLRMAI').asFloat,
                      _qryAux.fieldByname('VLRJUN').asFloat,
                      _qryAux.fieldByname('VLRJUL').asFloat,
                      _qryAux.fieldByname('VLRAGO').asFloat,
                      _qryAux.fieldByname('VLRSET').asFloat,
                      _qryAux.fieldByname('VLROUT').asFloat,
                      _qryAux.fieldByname('VLRNOV').asFloat,
                      _qryAux.fieldByname('VLRDEZ').asFloat,
                      _qryAux.fieldByname('VLR13').asFloat);

                    _qryAux.Next;
                  End;
                // WO13395 - FIM

                //
                // Selecionando as Linhas - RTIRF
                //
                _qryAux.Close;
                _qryAux.SQL.Clear;
                _qryAux.SQL.Add('SELECT DMA.IDDIRF,                                                                                            ');
                _qryAux.SQL.Add('       DMA.CODNATUREZA,                                                                                       ');
                _qryAux.SQL.Add('       DMA.NUMDOCUMENTO,                                                                                      ');
                _qryAux.SQL.Add('       3 CODDIRF,                                                                                             ');
                _qryAux.SQL.Add('       ''RTIRF'' TIPOLINHA,          '); // Rendimentos Tributáveis - Imposto sobre a Renda Retido na Fonte
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''01'',DECODE(CODDIRF,3,VLRIMPOSTO,0))),0) AS VLRJAN,       ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''02'',DECODE(CODDIRF,3,VLRIMPOSTO,0))),0) AS VLRFEV,       ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''03'',DECODE(CODDIRF,3,VLRIMPOSTO,0))),0) AS VLRMAR,       ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''04'',DECODE(CODDIRF,3,VLRIMPOSTO,0))),0) AS VLRABR,       ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''05'',DECODE(CODDIRF,3,VLRIMPOSTO,0))),0) AS VLRMAI,       ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''06'',DECODE(CODDIRF,3,VLRIMPOSTO,0))),0) AS VLRJUN,       ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''07'',DECODE(CODDIRF,3,VLRIMPOSTO,0))),0) AS VLRJUL,       ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''08'',DECODE(CODDIRF,3,VLRIMPOSTO,0))),0) AS VLRAGO,       ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''09'',DECODE(CODDIRF,3,VLRIMPOSTO,0))),0) AS VLRSET,       ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''10'',DECODE(CODDIRF,3,VLRIMPOSTO,0))),0) AS VLROUT,       ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''11'',DECODE(CODDIRF,3,VLRIMPOSTO,0))),0) AS VLRNOV,       ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''12'',DECODE(CODDIRF,3,VLRIMPOSTO,0))),0) AS VLRDEZ,       ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(CODDIRF,7,VLRIMPOSTO,0)),0) AS VLR13                                                      ');
                _qryAux.SQL.Add('FROM DIRF_MOVANALITICO_FF DMA                                                                                   ');
                _qryAux.SQL.Add('WHERE DMA.IDDIRF = ' + inttostr(_CdsMovimentoFF.fieldByname('IDDIRF').asInteger));
                _qryAux.SQL.Add('      AND DMA.CODNATUREZA = ' + quotedstr(_CdsMovimentoFF.fieldByname('CODNATUREZA').asString));
                _qryAux.SQL.Add('      AND DMA.NUMDOCUMENTO = ' + quotedstr(_CdsMovimentoFF.fieldByname('NUMDOCUMENTO').AsString));
                _qryAux.SQL.Add('      AND DMA.CODDIRF IN (3,7) AND DMA.FLGMARCADO = ''S''                                                       ');
                _qryAux.SQL.Add('GROUP BY DMA.IDDIRF, DMA.CODNATUREZA, DMA.NUMDOCUMENTO, 3, ''RTIRF''                                         ');
                _qryAux.Open;
                While Not _qryAux.EOF Do
                  Begin
                    iOrdemDaLinha := iOrdemDaLinha + 1;
                    // Inserindo no arquivo temporário as linhas selecionadas
                    InserirLinhasArquivoTempDIRF(
                      pQryDIRFGeradas.fieldByname('IDDIRF').asInteger,
                      pQryDIRFGeradas.fieldByname('EXERCICIODIRF').asString,
                      _qryAux.fieldByname('CODNATUREZA').asString,
                      _qryAux.fieldByname('NUMDOCUMENTO').AsString,
                      iOrdemDaLinha,
                      _qryAux.fieldByname('TIPOLINHA').asString,
                      _CdsMovimentoFF.fieldByname('NOME').AsString,
                      pTipoMov,
                      '',
                      '',
                      _qryAux.fieldByname('NUMDOCUMENTO').AsString, // CPFTITULAR
                      _qryAux.fieldByname('VLRJAN').asFloat,
                      _qryAux.fieldByname('VLRFEV').asFloat,
                      _qryAux.fieldByname('VLRMAR').asFloat,
                      _qryAux.fieldByname('VLRABR').asFloat,
                      _qryAux.fieldByname('VLRMAI').asFloat,
                      _qryAux.fieldByname('VLRJUN').asFloat,
                      _qryAux.fieldByname('VLRJUL').asFloat,
                      _qryAux.fieldByname('VLRAGO').asFloat,
                      _qryAux.fieldByname('VLRSET').asFloat,
                      _qryAux.fieldByname('VLROUT').asFloat,
                      _qryAux.fieldByname('VLRNOV').asFloat,
                      _qryAux.fieldByname('VLRDEZ').asFloat,
                      _qryAux.fieldByname('VLR13').asFloat);

                    _qryAux.Next;
                  End;

                // WO13395 - Impostos - Geração da DIRF - Desconto simplificado
                // Alterado por Arnaldo V. Scarin em 02/09/2024
                //
                // Selecionando as Linhas - ESDS
                //
                _qryAux.Close;
                _qryAux.SQL.Clear;
                _qryAux.SQL.Add('SELECT DMA.IDDIRF,                                                                                            ');
                _qryAux.SQL.Add('       DMA.CODNATUREZA,                                                                                       ');
                _qryAux.SQL.Add('       DMA.NUMDOCUMENTO,                                                                                      ');
                _qryAux.SQL.Add('       54 CODDIRF,                                                                                            ');
                _qryAux.SQL.Add('       ''ESDS'' TIPOLINHA,         '); // Tributação com exigibilidade suspensa - Dedução - Desconto simplificado mensal
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''01'',DECODE(CODDIRF,54,VLROUTROS,0))),0) AS VLRJAN,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''02'',DECODE(CODDIRF,54,VLROUTROS,0))),0) AS VLRFEV,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''03'',DECODE(CODDIRF,54,VLROUTROS,0))),0) AS VLRMAR,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''04'',DECODE(CODDIRF,54,VLROUTROS,0))),0) AS VLRABR,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''05'',DECODE(CODDIRF,54,VLROUTROS,0))),0) AS VLRMAI,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''06'',DECODE(CODDIRF,54,VLROUTROS,0))),0) AS VLRJUN,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''07'',DECODE(CODDIRF,54,VLROUTROS,0))),0) AS VLRJUL,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''08'',DECODE(CODDIRF,54,VLROUTROS,0))),0) AS VLRAGO,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''09'',DECODE(CODDIRF,54,VLROUTROS,0))),0) AS VLRSET,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''10'',DECODE(CODDIRF,54,VLROUTROS,0))),0) AS VLROUT,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''11'',DECODE(CODDIRF,54,VLROUTROS,0))),0) AS VLRNOV,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''12'',DECODE(CODDIRF,54,VLROUTROS,0))),0) AS VLRDEZ,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(CODDIRF,55,VLROUTROS,0)),0) AS VLR13                                                    ');
                _qryAux.SQL.Add('FROM DIRF_MOVANALITICO_FF DMA                                                                                 ');
                _qryAux.SQL.Add('WHERE DMA.IDDIRF = ' + inttostr(_CdsMovimentoFF.fieldByname('IDDIRF').asInteger));
                _qryAux.SQL.Add('      AND DMA.CODNATUREZA = ' + quotedstr(_CdsMovimentoFF.fieldByname('CODNATUREZA').asString));
                _qryAux.SQL.Add('      AND DMA.NUMDOCUMENTO = ' + quotedstr(_CdsMovimentoFF.fieldByname('NUMDOCUMENTO').AsString));
                _qryAux.SQL.Add('      AND DMA.CODDIRF IN (54,55) AND DMA.FLGMARCADO = ''S''                                                   ');
                _qryAux.SQL.Add('GROUP BY DMA.IDDIRF, DMA.CODNATUREZA, DMA.NUMDOCUMENTO, 54, ''ESDS''                                          ');
                _qryAux.Open;
                While Not _qryAux.EOF Do
                  Begin
                    iOrdemDaLinha := iOrdemDaLinha + 1;
                    // Inserindo no arquivo temporário as linhas selecionadas
                    InserirLinhasArquivoTempDIRF(
                      pQryDIRFGeradas.fieldByname('IDDIRF').asInteger,
                      pQryDIRFGeradas.fieldByname('EXERCICIODIRF').asString,
                      _qryAux.fieldByname('CODNATUREZA').asString,
                      _qryAux.fieldByname('NUMDOCUMENTO').AsString,
                      iOrdemDaLinha,
                      _qryAux.fieldByname('TIPOLINHA').asString,
                      _CdsMovimentoFF.fieldByname('NOME').AsString,
                      pTipoMov,
                      '',
                      '',
                      _qryAux.fieldByname('NUMDOCUMENTO').AsString, // CPFTITULAR
                      _qryAux.fieldByname('VLRJAN').asFloat,
                      _qryAux.fieldByname('VLRFEV').asFloat,
                      _qryAux.fieldByname('VLRMAR').asFloat,
                      _qryAux.fieldByname('VLRABR').asFloat,
                      _qryAux.fieldByname('VLRMAI').asFloat,
                      _qryAux.fieldByname('VLRJUN').asFloat,
                      _qryAux.fieldByname('VLRJUL').asFloat,
                      _qryAux.fieldByname('VLRAGO').asFloat,
                      _qryAux.fieldByname('VLRSET').asFloat,
                      _qryAux.fieldByname('VLROUT').asFloat,
                      _qryAux.fieldByname('VLRNOV').asFloat,
                      _qryAux.fieldByname('VLRDEZ').asFloat,
                      _qryAux.fieldByname('VLR13').asFloat);

                    _qryAux.Next;
                  End;
                // WO13395 - FIM

                //
                // Selecionando as Linhas - RTPP
                //
                _qryAux.Close;
                _qryAux.SQL.Clear;
                _qryAux.SQL.Add('SELECT DMA.IDDIRF,                                                                                            ');
                _qryAux.SQL.Add('       DMA.CODNATUREZA,                                                                                       ');
                _qryAux.SQL.Add('       DMA.NUMDOCUMENTO,                                                                                      ');
                _qryAux.SQL.Add('       21 CODDIRF,                                                                                            ');
                _qryAux.SQL.Add('       ''RTPP'' TIPOLINHA,      '); // Rendimentos Tributáveis - Dedução - Previdência Privada
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''01'',DECODE(CODDIRF,21,VLROUTROS,0))),0) AS VLRJAN,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''02'',DECODE(CODDIRF,21,VLROUTROS,0))),0) AS VLRFEV,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''03'',DECODE(CODDIRF,21,VLROUTROS,0))),0) AS VLRMAR,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''04'',DECODE(CODDIRF,21,VLROUTROS,0))),0) AS VLRABR,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''05'',DECODE(CODDIRF,21,VLROUTROS,0))),0) AS VLRMAI,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''06'',DECODE(CODDIRF,21,VLROUTROS,0))),0) AS VLRJUN,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''07'',DECODE(CODDIRF,21,VLROUTROS,0))),0) AS VLRJUL,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''08'',DECODE(CODDIRF,21,VLROUTROS,0))),0) AS VLRAGO,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''09'',DECODE(CODDIRF,21,VLROUTROS,0))),0) AS VLRSET,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''10'',DECODE(CODDIRF,21,VLROUTROS,0))),0) AS VLROUT,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''11'',DECODE(CODDIRF,21,VLROUTROS,0))),0) AS VLRNOV,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''12'',DECODE(CODDIRF,21,VLROUTROS,0))),0) AS VLRDEZ,     ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(CODDIRF,25,VLROUTROS,0)),0) AS VLR13                                                    ');
                _qryAux.SQL.Add('FROM DIRF_MOVANALITICO_FF DMA                                                                                 ');
                _qryAux.SQL.Add('WHERE DMA.IDDIRF = ' + inttostr(_CdsMovimentoFF.fieldByname('IDDIRF').asInteger));
                _qryAux.SQL.Add('      AND DMA.CODNATUREZA = ' + quotedstr(_CdsMovimentoFF.fieldByname('CODNATUREZA').asString));
                _qryAux.SQL.Add('      AND DMA.NUMDOCUMENTO = ' + quotedstr(_CdsMovimentoFF.fieldByname('NUMDOCUMENTO').AsString));
                _qryAux.SQL.Add('      AND DMA.CODDIRF IN (21,25) AND DMA.FLGMARCADO = ''S''                                                   ');
                _qryAux.SQL.Add('GROUP BY DMA.IDDIRF, DMA.CODNATUREZA, DMA.NUMDOCUMENTO, 21, ''RTPP''                                         ');
                _qryAux.Open;
                While Not _qryAux.EOF Do
                  Begin
                    // INFPC - Inserindo no arquivo temporário as linhas abaixo referentes ao movimento das Informações de Previdência Complementar
                    // Esta linha ficará antes da RTPP, como sendo uma cabeçalho. Por isto a Ordem desta INFPC é 5 e a da RTPP é 6
                    //
                    /////////////////////////////////////////////////////////////////////////////////////////////////////////
                    // INFPC|00436923000190|FUNDACAO DOS ECONOMIARIOS FEDERAIS FUNCEF|
                    // RTPP|0000000100000|0000000100000|0000000100000|0000000100000|0000000100000|0000000100000|0000000100000|0000000100000|0000000100000|0000000100000|0000000100000|0000000100000|0000000100000|
                    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    //
                    iOrdemDaLinha := iOrdemDaLinha + 1;
                    // Inserindo no arquivo temporário a linha do INFPC
                    InserirLinhasArquivoTempDIRF(
                      pQryDIRFGeradas.fieldByname('IDDIRF').asInteger,
                      pQryDIRFGeradas.fieldByname('EXERCICIODIRF').asString,
                      _CdsMovimentoFF.fieldByname('CODNATUREZA').asString,
                      pQryDadosAdicionais.fieldByname('CNPJFUNDACAO').asString,
                      iOrdemDaLinha,
                      'INFPC',
                      pQryDadosAdicionais.fieldByname('NOMEFUNDACAO').asString,
                      pTipoMov,
                      '',
                      '',
                      _CdsMovimentoFF.fieldByname('NUMDOCUMENTO').AsString, // CPFTITULAR
                      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

                    iOrdemDaLinha := iOrdemDaLinha + 1;
                    //
                    // Inserindo no arquivo temporário a linha de valores do RTPP
                    //
                    InserirLinhasArquivoTempDIRF(
                      pQryDIRFGeradas.fieldByname('IDDIRF').asInteger,
                      pQryDIRFGeradas.fieldByname('EXERCICIODIRF').asString,
                      _qryAux.fieldByname('CODNATUREZA').asString,
                      _qryAux.fieldByname('NUMDOCUMENTO').AsString,
                      iOrdemDaLinha,
                      _qryAux.fieldByname('TIPOLINHA').asString,
                      _CdsMovimentoFF.fieldByname('NOME').AsString,
                      pTipoMov,
                      '',
                      '',
                      _qryAux.fieldByname('NUMDOCUMENTO').AsString, // CPFTITULAR
                      _qryAux.fieldByname('VLRJAN').asFloat,
                      _qryAux.fieldByname('VLRFEV').asFloat,
                      _qryAux.fieldByname('VLRMAR').asFloat,
                      _qryAux.fieldByname('VLRABR').asFloat,
                      _qryAux.fieldByname('VLRMAI').asFloat,
                      _qryAux.fieldByname('VLRJUN').asFloat,
                      _qryAux.fieldByname('VLRJUL').asFloat,
                      _qryAux.fieldByname('VLRAGO').asFloat,
                      _qryAux.fieldByname('VLRSET').asFloat,
                      _qryAux.fieldByname('VLROUT').asFloat,
                      _qryAux.fieldByname('VLRNOV').asFloat,
                      _qryAux.fieldByname('VLRDEZ').asFloat,
                      _qryAux.fieldByname('VLR13').asFloat);

                    _qryAux.Next;
                  End;

                // INFPA - Inserindo no arquivo temporário as linhas abaixo referentes ao movimento das Informações do beneficiário da pensão alimentícia
                //
                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                // INFPA|12345678901|99/99/9999|JOSÉ DAS COUVES|03|
                // RTPA|0000000100000|0000000100000|0000000100000|0000000100000|0000000100000|0000000100000|0000000100000|0000000100000|0000000100000|0000000100000|0000000100000|0000000100000|0000000100000|
                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                //
                _qryAux.Close;
                _qryAux.SQL.Clear;
                _qryAux.SQL.Add('SELECT DISTINCT IDDIRF, CODNATUREZA, CPFTITULAR, CPFDEPEN, NOME, DATANASC, DEPENDENCIA    ');
                _qryAux.SQL.Add('FROM DIRF_MOVANALFF_DEPEN                                                                  ');
                _qryAux.SQL.Add('WHERE IDDIRF = ' + inttostr(_CdsMovimentoFF.fieldByname('IDDIRF').asInteger));
                _qryAux.SQL.Add('      AND CODNATUREZA = ' + quotedstr(_CdsMovimentoFF.fieldByname('CODNATUREZA').asString));
                _qryAux.SQL.Add('      AND CPFTITULAR = ' + quotedstr(_CdsMovimentoFF.fieldByname('NUMDOCUMENTO').AsString));
                _qryAux.SQL.Add('      AND CODDIRF IN (20, 24)                                                      ');
                _qryAux.SQL.Add('ORDER BY IDDIRF, CODNATUREZA, CPFTITULAR, CPFDEPEN                                ');
                _qryAux.Open;
                While Not _qryAux.EOF Do
                  Begin
                    iOrdemDaLinha := iOrdemDaLinha + 1;
                    // Inserindo no arquivo temporário a linha do INFPA
                    InserirLinhasArquivoTempDIRF(
                      _qryAux.fieldByname('IDDIRF').asInteger,
                      pQryDIRFGeradas.fieldByname('EXERCICIODIRF').asString,
                      _qryAux.fieldByname('CODNATUREZA').asString,
                      _qryAux.fieldByname('CPFDEPEN').AsString,
                      iOrdemDaLinha, // Ordem
                      'INFPA',
                      _qryAux.fieldByname('NOME').AsString,
                      pTipoMov,
                      _qryAux.fieldByname('DATANASC').AsString,
                      _qryAux.fieldByname('DEPENDENCIA').AsString,
                      _CdsMovimentoFF.fieldByname('NUMDOCUMENTO').AsString, // CPFTITULAR
                      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
                    //
                    // Selecionando as Linhas - RTPA do Beneficiário
                    //
                    _qryAux2.Close;
                    _qryAux2.SQL.Clear;
                    _qryAux2.SQL.Add('SELECT IDDIRF,                                                                                            ');
                    _qryAux2.SQL.Add('       CODNATUREZA,                                                                                       ');
                    _qryAux2.SQL.Add('       CPFDEPEN,                                                                                          ');
                    _qryAux2.SQL.Add('       NOME,                                                                                              ');
                    _qryAux2.SQL.Add('       20 CODDIRF,                                                                                         ');
                    _qryAux2.SQL.Add('       ''RTPA'' TIPOLINHA,            '); // Rendimentos Tributáveis - Dedução - Pensão Alimentícia
                    _qryAux2.SQL.Add('       NVL(SUM(DECODE(MES,''01'',DECODE(CODDIRF,20,VALOR,0))),0) AS VLRJAN,     ');
                    _qryAux2.SQL.Add('       NVL(SUM(DECODE(MES,''02'',DECODE(CODDIRF,20,VALOR,0))),0) AS VLRFEV,     ');
                    _qryAux2.SQL.Add('       NVL(SUM(DECODE(MES,''03'',DECODE(CODDIRF,20,VALOR,0))),0) AS VLRMAR,     ');
                    _qryAux2.SQL.Add('       NVL(SUM(DECODE(MES,''04'',DECODE(CODDIRF,20,VALOR,0))),0) AS VLRABR,     ');
                    _qryAux2.SQL.Add('       NVL(SUM(DECODE(MES,''05'',DECODE(CODDIRF,20,VALOR,0))),0) AS VLRMAI,     ');
                    _qryAux2.SQL.Add('       NVL(SUM(DECODE(MES,''06'',DECODE(CODDIRF,20,VALOR,0))),0) AS VLRJUN,     ');
                    _qryAux2.SQL.Add('       NVL(SUM(DECODE(MES,''07'',DECODE(CODDIRF,20,VALOR,0))),0) AS VLRJUL,     ');
                    _qryAux2.SQL.Add('       NVL(SUM(DECODE(MES,''08'',DECODE(CODDIRF,20,VALOR,0))),0) AS VLRAGO,     ');
                    _qryAux2.SQL.Add('       NVL(SUM(DECODE(MES,''09'',DECODE(CODDIRF,20,VALOR,0))),0) AS VLRSET,     ');
                    _qryAux2.SQL.Add('       NVL(SUM(DECODE(MES,''10'',DECODE(CODDIRF,20,VALOR,0))),0) AS VLROUT,     ');
                    _qryAux2.SQL.Add('       NVL(SUM(DECODE(MES,''11'',DECODE(CODDIRF,20,VALOR,0))),0) AS VLRNOV,     ');
                    _qryAux2.SQL.Add('       NVL(SUM(DECODE(MES,''12'',DECODE(CODDIRF,20,VALOR,0))),0) AS VLRDEZ,     ');
                    _qryAux2.SQL.Add('       NVL(SUM(DECODE(CODDIRF,24,VALOR,0)),0) AS VLR13                                                    ');
                    _qryAux2.SQL.Add('FROM DIRF_MOVANALFF_DEPEN                                                                                     ');
                    _qryAux2.SQL.Add('WHERE IDDIRF = ' + inttostr(_qryAux.fieldByname('IDDIRF').asInteger));
                    _qryAux2.SQL.Add('      AND CODNATUREZA = ' + quotedstr(_qryAux.fieldByname('CODNATUREZA').asString));
                    _qryAux2.SQL.Add('      AND CPFTITULAR = ' + quotedstr(_qryAux.fieldByname('CPFTITULAR').AsString));
                    _qryAux2.SQL.Add('      AND CPFDEPEN = ' + quotedstr(_qryAux.fieldByname('CPFDEPEN').AsString));
                    _qryAux2.SQL.Add('      AND CODDIRF IN (20,24)                                                                                  ');
                    _qryAux2.SQL.Add('GROUP BY IDDIRF, CODNATUREZA, CPFDEPEN, NOME, 20, ''RTPA''                        ');
                    _qryAux2.Open;

                    iOrdemDaLinha := iOrdemDaLinha + 1;
                    // Inserindo no arquivo temporário a linha de valores do RTPA
                    InserirLinhasArquivoTempDIRF(
                      pQryDIRFGeradas.fieldByname('IDDIRF').asInteger,
                      pQryDIRFGeradas.fieldByname('EXERCICIODIRF').asString,
                      _qryAux2.fieldByname('CODNATUREZA').asString,
                      _qryAux2.fieldByname('CPFDEPEN').AsString,
                      iOrdemDaLinha,
                      _qryAux2.fieldByname('TIPOLINHA').asString,
                      _qryAux2.fieldByname('NOME').AsString,
                      pTipoMov,
                      '',
                      '',
                      _CdsMovimentoFF.fieldByname('NUMDOCUMENTO').AsString, // CPFTITULAR
                      _qryAux2.fieldByname('VLRJAN').asFloat,
                      _qryAux2.fieldByname('VLRFEV').asFloat,
                      _qryAux2.fieldByname('VLRMAR').asFloat,
                      _qryAux2.fieldByname('VLRABR').asFloat,
                      _qryAux2.fieldByname('VLRMAI').asFloat,
                      _qryAux2.fieldByname('VLRJUN').asFloat,
                      _qryAux2.fieldByname('VLRJUL').asFloat,
                      _qryAux2.fieldByname('VLRAGO').asFloat,
                      _qryAux2.fieldByname('VLRSET').asFloat,
                      _qryAux2.fieldByname('VLROUT').asFloat,
                      _qryAux2.fieldByname('VLRNOV').asFloat,
                      _qryAux2.fieldByname('VLRDEZ').asFloat,
                      _qryAux2.fieldByname('VLR13').asFloat);

                    _qryAux.Next;
                  End;
                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                //
                // Selecionando as Linhas - RIDAC, RIIRP, RIAP
                //                                              
                _qryAux.Close;
                _qryAux.SQL.Clear;
                _qryAux.SQL.Add('SELECT DMA.IDDIRF,                                                                                              ');
                _qryAux.SQL.Add('       DMA.CODNATUREZA,                                                                                         ');
                _qryAux.SQL.Add('       DMA.NUMDOCUMENTO,                                                                                        ');
                _qryAux.SQL.Add('       DMA.CODDIRF,                                                                                             ');
                // CODDIRF = 34 - Ajuda de Custo/Diarias     35 - Indenizações, Recisões e Acidente Trabalho     36 - Abono Pecuniario
                _qryAux.SQL.Add('       DECODE(DMA.CODDIRF, 34,''RIDAC'',DECODE(DMA.CODDIRF,35,''RIIRP'',''RIAP'')) TIPOLINHA,                   ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''01'',VLROUTROS,0)),0) AS VLRJAN,                          ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''02'',VLROUTROS,0)),0) AS VLRFEV,                          ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''03'',VLROUTROS,0)),0) AS VLRMAR,                          ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''04'',VLROUTROS,0)),0) AS VLRABR,                          ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''05'',VLROUTROS,0)),0) AS VLRMAI,                          ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''06'',VLROUTROS,0)),0) AS VLRJUN,                          ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''07'',VLROUTROS,0)),0) AS VLRJUL,                          ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''08'',VLROUTROS,0)),0) AS VLRAGO,                          ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''09'',VLROUTROS,0)),0) AS VLRSET,                          ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''10'',VLROUTROS,0)),0) AS VLROUT,                          ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''11'',VLROUTROS,0)),0) AS VLRNOV,                          ');
                _qryAux.SQL.Add('       NVL(SUM(DECODE(TO_CHAR(DATAPAGAMENTO,''MM''),''12'',VLROUTROS,0)),0) AS VLRDEZ,                          ');
                _qryAux.SQL.Add('       0.00 AS VLR13,                                                                                           ');
                // Paulo Nobre - WO19478 - Inicio
                _qryAux.SQL.Add('       NVL(SUM(VLROUTROS),0) AS SALDO                                                                           ');
                // Paulo Nobre - WO19478 - Fim
                _qryAux.SQL.Add('FROM DIRF_MOVANALITICO_FF DMA                                                                                   ');
                _qryAux.SQL.Add('WHERE DMA.IDDIRF = ' + inttostr(_CdsMovimentoFF.fieldByname('IDDIRF').asInteger));
                _qryAux.SQL.Add('      AND DMA.CODNATUREZA = ' + quotedstr(_CdsMovimentoFF.fieldByname('CODNATUREZA').asString));
                _qryAux.SQL.Add('      AND DMA.NUMDOCUMENTO = ' + quotedstr(_CdsMovimentoFF.fieldByname('NUMDOCUMENTO').AsString));
                _qryAux.SQL.Add('      AND DMA.CODDIRF IN (34,35,36) AND DMA.FLGMARCADO = ''S''                                                      ');
                _qryAux.SQL.Add('GROUP BY DMA.IDDIRF, DMA.CODNATUREZA, DMA.NUMDOCUMENTO, DMA.CODDIRF, DECODE(DMA.CODDIRF, 34,''RIDAC'',DECODE(DMA.CODDIRF,35,''RIIRP'',''RIAP''))   ');
                _qryAux.Open;
                _qryAux.First;

                // Paulo Nobre - WO19478 - Inicio

                flgPrimeiroPositivoJAN := False;
                flgPrimeiroPositivoFEV := False;
                flgPrimeiroPositivoMAR := False;
                flgPrimeiroPositivoABR := False;
                flgPrimeiroPositivoMAI := False;
                flgPrimeiroPositivoJUN := False;
                flgPrimeiroPositivoJUL := False;
                flgPrimeiroPositivoAGO := False;
                flgPrimeiroPositivoSET := False;
                flgPrimeiroPositivoOUT := False;
                flgPrimeiroPositivoNOV := False;
                flgPrimeiroPositivoDEZ := False;

                // Encontrando qual foi o primeiro mes de ocorrência de um valor positivo
                While Not _qryAux.EOF Do
                  Begin
                  // Somente as linhas tipo "RIAP"
                  if _qryAux.fieldByname('TIPOLINHA').asString = 'RIAP' Then
                  begin
                    if _qryAux.fieldByname('VLRJAN').asFloat > 0.00 Then
                    Begin
                       flgPrimeiroPositivoJAN := True;
                       break;
                    end;
                    if _qryAux.fieldByname('VLRFEV').asFloat > 0.00 Then
                    begin
                       flgPrimeiroPositivoFEV := True;
                       Break;
                    end;
                    if _qryAux.fieldByname('VLRMAR').asFloat > 0.00 Then
                    begin
                       flgPrimeiroPositivoMAR := True;
                       Break;
                    end;
                    if _qryAux.fieldByname('VLRABR').asFloat > 0.00 Then
                    begin
                       flgPrimeiroPositivoABR := True;
                       Break;
                    end;
                    if _qryAux.fieldByname('VLRMAI').asFloat > 0.00 Then
                    begin
                       flgPrimeiroPositivoMAI := True;
                       Break;
                    end;
                    if _qryAux.fieldByname('VLRJUN').asFloat > 0.00 Then
                    begin
                       flgPrimeiroPositivoJUN := True;
                       Break;
                    end;
                    if _qryAux.fieldByname('VLRJUL').asFloat > 0.00 Then
                    begin
                       flgPrimeiroPositivoJUL := True;
                       Break;
                    end;
                    if _qryAux.fieldByname('VLRAGO').asFloat > 0.00 Then
                    begin
                       flgPrimeiroPositivoAGO := True;
                       Break;
                    end;
                    if _qryAux.fieldByname('VLRSET').asFloat > 0.00 Then
                    begin
                       flgPrimeiroPositivoSET := True;
                       Break;
                    end;
                    if _qryAux.fieldByname('VLROUT').asFloat > 0.00 Then
                    begin
                       flgPrimeiroPositivoOUT := True;
                       Break;
                    end;
                    if _qryAux.fieldByname('VLRNOV').asFloat > 0.00 Then
                    begin
                       flgPrimeiroPositivoNOV := True;
                       Break;
                    end;
                    if _qryAux.fieldByname('VLRDEZ').asFloat > 0.00 Then
                    begin
                       flgPrimeiroPositivoDEZ := True;
                       Break;
                    end;
                  End;

                  _qryAux.Next;
                End;

                // Lançar este saldo no primeiro mes positivo encontrado
                // e o restante dos meses ficarão zerados.

                vlGravarJAN := 0.00;
                vlGravarFEV := 0.00;
                vlGravarMAR := 0.00;
                vlGravarABR := 0.00;
                vlGravarMAI := 0.00;
                vlGravarJUN := 0.00;
                vlGravarJUL := 0.00;
                vlGravarAGO := 0.00;
                vlGravarSET := 0.00;
                vlGravarOUT := 0.00;
                vlGravarNOV := 0.00;
                vlGravarDEZ := 0.00;

                _qryAux.First;
                While Not _qryAux.EOF Do
                  Begin
                    iOrdemDaLinha := iOrdemDaLinha + 1;

                    // Se for a linha "RIAP" e teve algum SALDO
                    if (_qryAux.fieldByname('TIPOLINHA').asString = 'RIAP') and (_qryAux.fieldByname('SALDO').asFloat <> 0.00) Then
                    begin
                      // Gravando o saldo no mes da ocorrencia do primeiro positivo
                      if flgPrimeiroPositivoJAN Then
                         vlGravarJAN := _qryAux.fieldByname('SALDO').asFloat;
                      if flgPrimeiroPositivoFEV Then
                         vlGravarFEV := _qryAux.fieldByname('SALDO').asFloat;
                      if flgPrimeiroPositivoMAR Then
                         vlGravarMAR := _qryAux.fieldByname('SALDO').asFloat;
                      if flgPrimeiroPositivoABR Then
                         vlGravarABR := _qryAux.fieldByname('SALDO').asFloat;
                      if flgPrimeiroPositivoMAI Then
                         vlGravarMAI := _qryAux.fieldByname('SALDO').asFloat;
                      if flgPrimeiroPositivoJUN Then
                         vlGravarJUN := _qryAux.fieldByname('SALDO').asFloat;
                      if flgPrimeiroPositivoJUL Then
                         vlGravarJUL := _qryAux.fieldByname('SALDO').asFloat;
                      if flgPrimeiroPositivoAGO Then
                         vlGravarAGO := _qryAux.fieldByname('SALDO').asFloat;
                      if flgPrimeiroPositivoSET Then
                         vlGravarSET := _qryAux.fieldByname('SALDO').asFloat;
                      if flgPrimeiroPositivoOUT Then
                         vlGravarOUT := _qryAux.fieldByname('SALDO').asFloat;
                      if flgPrimeiroPositivoNOV Then
                         vlGravarNOV := _qryAux.fieldByname('SALDO').asFloat;
                      if flgPrimeiroPositivoDEZ Then
                         vlGravarDEZ := _qryAux.fieldByname('SALDO').asFloat;

                    // Inserindo no arquivo temporário as linhas selecionadas
                    InserirLinhasArquivoTempDIRF(
                      pQryDIRFGeradas.fieldByname('IDDIRF').asInteger,
                      pQryDIRFGeradas.fieldByname('EXERCICIODIRF').asString,
                      _qryAux.fieldByname('CODNATUREZA').asString,
                      _qryAux.fieldByname('NUMDOCUMENTO').AsString,
                      iOrdemDaLinha,
                      _qryAux.fieldByname('TIPOLINHA').asString,
                      _CdsMovimentoFF.fieldByname('NOME').AsString,
                      pTipoMov,
                      '',
                      '',
                      _qryAux.fieldByname('NUMDOCUMENTO').AsString, // CPFTITULAR
                        vlGravarJAN,
                        vlGravarFEV,
                        vlGravarMAR,
                        vlGravarABR,
                        vlGravarMAI,
                        vlGravarJUN,
                        vlGravarJUL,
                        vlGravarAGO,
                        vlGravarSET,
                        vlGravarOUT,
                        vlGravarNOV,
                        vlGravarDEZ,
                        0.00);              // 13º
                    end
                    Else
                    begin
                      // Inserindo no arquivo temporário as linhas selecionadas
                      InserirLinhasArquivoTempDIRF(
                        pQryDIRFGeradas.fieldByname('IDDIRF').asInteger,
                        pQryDIRFGeradas.fieldByname('EXERCICIODIRF').asString,
                        _qryAux.fieldByname('CODNATUREZA').asString,
                        _qryAux.fieldByname('NUMDOCUMENTO').AsString,
                        iOrdemDaLinha,
                        _qryAux.fieldByname('TIPOLINHA').asString,
                        _CdsMovimentoFF.fieldByname('NOME').AsString,
                        pTipoMov,
                        '',
                        '',
                        _qryAux.fieldByname('NUMDOCUMENTO').AsString, // CPFTITULAR
                      _qryAux.fieldByname('VLRJAN').asFloat,
                      _qryAux.fieldByname('VLRFEV').asFloat,
                      _qryAux.fieldByname('VLRMAR').asFloat,
                      _qryAux.fieldByname('VLRABR').asFloat,
                      _qryAux.fieldByname('VLRMAI').asFloat,
                      _qryAux.fieldByname('VLRJUN').asFloat,
                      _qryAux.fieldByname('VLRJUL').asFloat,
                      _qryAux.fieldByname('VLRAGO').asFloat,
                      _qryAux.fieldByname('VLRSET').asFloat,
                      _qryAux.fieldByname('VLROUT').asFloat,
                      _qryAux.fieldByname('VLRNOV').asFloat,
                      _qryAux.fieldByname('VLRDEZ').asFloat,
                      _qryAux.fieldByname('VLR13').asFloat);
                    end;

                    _qryAux.Next;
                  End;

                // Paulo Nobre SIG 34459 - Fim

                // Paulo Nobre - WO19478 - Inicio

              End;

            _CdsMovimentoFF.Next;

          End;

        pQryDIRFMovSintTributosFF.Next;

      End;
  End;

  Procedure GravaLinhasFF_PlanoSaudeEOdonto;
  Begin
    If pQryDadosAdicionais.fieldByname('FLGPAGASSSAUDE').asString = 'S' Then
      Begin
        // Exemplo:

        //PSE|
        //OPSE|58119199000151|ODONTOPREV S.A.|301949|
        //TPSE|00009498176|FRANCISCA DA SILVA|33240|
        //DTPSE|04678598170|19950105|DARLIANE DA SILVA SANTOS|04|900|
        //DTPSE|77538579320|19711104|ANTONIO ORLANDO VIEIRA DOS SANTOS|03|900|
        //
        // PSE - Gravando a linha Identificadora dos Planos de Saúde e Odontológico
        //
        GravaLinhaIdentificadoraDosPlanos(ArquivoEnvioRFB);

//Cássio Rovaroto - SIG nº 81294 - Início
        //Verifica CNPJ das operadoras, fazendo a inserção no arquivo por ordem crescente

       if pQryDadosAdicionais.FieldByName('CNPJPLANOODONTO').AsString < pQryDadosAdicionais.FieldByName('CNPJPLANOSAUDE').AsString then
       begin
        // OPSE - Gravando a linha do Plano Odontológico
        GeraDadosPlanoOdontologico(pQryDIRFMovSintTributosFF,
                                   pQryDadosAdicionais.fieldByname('CNPJPLANOODONTO').asString,
                                   pQryDadosAdicionais.fieldByname('NOMEPLANOODONTO').asString,
                                   pQryDadosAdicionais.fieldByname('ANSPLANOODONTO').asString);

        // OPSE - Gravando linha do Plano de Saúde
        GeraDadosPlanoSaude(pQryDIRFMovSintTributosFF,
                            pQryDadosAdicionais.FieldByName('IDADMPLANOSAUDE').asInteger,
                            pQryDadosAdicionais.FieldByName('CNPJPLANOSAUDE').asString,
                            pQryDadosAdicionais.FieldByName('NOMEPLANOSAUDE').asString,
                            pQryDadosAdicionais.FieldByName('ANSPLANOSAUDE').asString);

        //edilaine SIG113909 : inicio
        if _cdsMovimentoFF.FieldByName('EXERCICIODIRF').asInteger >= 2019 THEN
        BEGIN
          if pQryDadosAdicionais.FieldByName('CNPJPLANOSAUDE2').AsString <> '' then
             GeraDadosPlanoSaude(pQryDIRFMovSintTributosFF,
                            pQryDadosAdicionais.FieldByName('IDADMPLANOSAUDE2').asInteger,
                            pQryDadosAdicionais.FieldByName('CNPJPLANOSAUDE2').asString,
                            pQryDadosAdicionais.FieldByName('NOMEPLANOSAUDE2').asString,
                            pQryDadosAdicionais.FieldByName('ANSPLANOSAUDE2').asString);
        END;
        //edilaine SIG113909 : fim

       end
       else
       begin
        // OPSE - Gravando linha do Plano de Saúde
        GeraDadosPlanoSaude(pQryDIRFMovSintTributosFF,
                            pQryDadosAdicionais.FieldByName('IDADMPLANOSAUDE').asInteger,
                            pQryDadosAdicionais.FieldByName('CNPJPLANOSAUDE').asString,
                            pQryDadosAdicionais.FieldByName('NOMEPLANOSAUDE').asString,
                            pQryDadosAdicionais.FieldByName('ANSPLANOSAUDE').asString);
        //SIG 97984 Tiago Von - INICIO
        //IF _cdsMovimentoFF.FieldByName('EXERCICIODIRF').asInteger = 2019 THEN
        if _cdsMovimentoFF.FieldByName('EXERCICIODIRF').asInteger >= 2019 THEN             //edilaine SIG113909
        BEGIN
          if pQryDadosAdicionais.FieldByName('CNPJPLANOSAUDE2').AsString <> '' then       //edilaine SIG113909
             GeraDadosPlanoSaude(pQryDIRFMovSintTributosFF,
                            pQryDadosAdicionais.FieldByName('IDADMPLANOSAUDE2').asInteger,
                            pQryDadosAdicionais.FieldByName('CNPJPLANOSAUDE2').asString,
                            pQryDadosAdicionais.FieldByName('NOMEPLANOSAUDE2').asString,
                            pQryDadosAdicionais.FieldByName('ANSPLANOSAUDE2').asString);
        END;
        //SIG97984 Tiago Von - FIM
        // OPSE - Gravando a linha do Plano Odontológico
        GeraDadosPlanoOdontologico(pQryDIRFMovSintTributosFF,
                                   pQryDadosAdicionais.FieldByName('CNPJPLANOODONTO').asString,
                                   pQryDadosAdicionais.FieldByName('NOMEPLANOODONTO').asString,
                                   pQryDadosAdicionais.FieldByName('ANSPLANOODONTO').asString);;
       end;
        (*
        //
        // OPSE - Gravando a linha do Plano Odontológico
        //
        GravaLinhaPlanoSaudeEOdontologico(ArquivoEnvioRFB,
          pQryDadosAdicionais.fieldByname('CNPJPLANOODONTO').asString,
          pQryDadosAdicionais.fieldByname('NOMEPLANOODONTO').asString,
          pQryDadosAdicionais.fieldByname('ANSPLANOODONTO').asString);

        pQryDIRFMovSintTributosFF.First;
        If pQryDIRFMovSintTributosFF.fieldByname('CODNATUREZA').asString = '0561' Then
          Begin
            // Paulo Nobre SIG 34459 - Inicio
                // Quando for gerado pela CONTAB (CP), precisa chamar a função p/ recarregar o CDS
    {            If pTipoMov <> 'FF' Then
                  Begin
                    // Movimento Sintetico
                    _CdsMovimentoFF.data := ListaDIRF_MovSintFF(
                      pQryDIRFMovSintTributosFF.fieldByname('IDDIRF').asInteger,
                      pQryDIRFMovSintTributosFF.fieldByname('CODNATUREZA').asString);
                  End;    }

            _CdsMovimentoFF.data := ListaDIRF_MovSintFF(
              pQryDIRFMovSintTributosFF.fieldByname('IDDIRF').asInteger,
              pQryDIRFMovSintTributosFF.fieldByname('CODNATUREZA').asString);
            // Paulo Nobre SIG 34459 - Fim

            _CdsMovimentoFF.First;
            iContador := 0;
            frmProgresso.MostraFormProgresso('Gravando Linhas Dependentes Pl.Odonto...', True, False, True, 0, _CdsMovimentoFF.RecordCount);
            While Not _CdsMovimentoFF.EOF Do
              Begin
                AtualizaFrmProgresso(iContador);

                // Só entra Empregado que está marcado
                If _CdsMovimentoFF.fieldByname('FLGMARCADO').asString = 'S' Then
                  Begin
                    // Plano Odonto totalizado
                    cdsDepPlanos.data := ListaTotalDependentesPlanos(
                      _CdsMovimentoFF.fieldByname('IDDIRF').asInteger,
                      2, // Tipo do Plano de assistencia odonto
                      _CdsMovimentoFF.fieldByname('NUMDOCUMENTO').asString);
                    cdsDepPlanos.First;
                    While Not cdsDepPlanos.EOF Do
                      Begin
                        // Só entra lançamentos com valor
                        If cdsDepPlanos.fieldByname('VALOR').AsFloat <> 0 Then
                          Begin
                            // Se for o registro do próprio titular
                            If cdsDepPlanos.fieldByname('CPFTITULAR').AsString = cdsDepPlanos.fieldByname('CPFDEPEN').AsString Then
                              Begin
                                // Gravando linha do Titular - TPSE|
                                GravaLinhaTitular(ArquivoEnvioRFB,
                                  cdsDepPlanos.fieldByname('CPFTITULAR').AsString,
                                  cdsDepPlanos.fieldByname('NOME').AsString,
                                  cdsDepPlanos.fieldByname('VALOR').AsFloat);
                              End
                            Else
                              Begin
                                // Gravando linha do Dependente - DTPSE|
                                GravaLinhasDependentes(ArquivoEnvioRFB,
                                  cdsDepPlanos.fieldByname('CPFDEPEN').AsString,
                                  cdsDepPlanos.fieldByname('NOME').AsString,
                                  cdsDepPlanos.fieldByname('DEPENDENCIA').AsString,
                                  cdsDepPlanos.fieldByname('DATANASC').AsDateTime,
                                  cdsDepPlanos.fieldByname('VALOR').AsFloat);
                              End;
                          End;

                        cdsDepPlanos.Next;
                      End;
                  End;

                _CdsMovimentoFF.Next;

              End;
          End;
        //
        // OPSE - Gravando linha do Plano de Saúde
        //
        GravaLinhaPlanoSaudeEOdontologico(ArquivoEnvioRFB,
          pQryDadosAdicionais.fieldByname('CNPJPLANOSAUDE').asString,
          pQryDadosAdicionais.fieldByname('NOMEPLANOSAUDE').asString,
          pQryDadosAdicionais.fieldByname('ANSPLANOSAUDE').asString);

        pQryDIRFMovSintTributosFF.First;
        If pQryDIRFMovSintTributosFF.fieldByname('CODNATUREZA').asString = '0561' Then
          Begin
            // Paulo Nobre SIG 34459 - Inicio

                // Quando for gerado pela CONTAB (CP), precisa chamar a função p/ recarregar o CDS
    {            If pTipoMov <> 'FF' Then
                  Begin
                    // Movimento Sintetico
                    _CdsMovimentoFF.data := ListaDIRF_MovSintFF(
                      pQryDIRFMovSintTributosFF.fieldByname('IDDIRF').asInteger,
                      pQryDIRFMovSintTributosFF.fieldByname('CODNATUREZA').asString);
                  End;   }

            _CdsMovimentoFF.data := ListaDIRF_MovSintFF(
              pQryDIRFMovSintTributosFF.fieldByname('IDDIRF').asInteger,
              pQryDIRFMovSintTributosFF.fieldByname('CODNATUREZA').asString);
            // Paulo Nobre SIG 34459 - Fim

            _CdsMovimentoFF.First;
            iContador := 0;
            frmProgresso.MostraFormProgresso('Gravando Linhas Dependentes Pl.Saúde ...', True, False, True, 0, _CdsMovimentoFF.RecordCount);
            While Not _CdsMovimentoFF.EOF Do
              Begin
                AtualizaFrmProgresso(iContador);

                // Só entra Empregado que está marcado
                If _CdsMovimentoFF.fieldByname('FLGMARCADO').asString = 'S' Then
                  Begin
                    // Plano de Saúde totalizado
                    //Cássio Rovaroto - SIG nº 64340 - Início
                    cdsDepPlanos.data := ListaTotalDependentesPlanos(
                      _CdsMovimentoFF.fieldByname('IDDIRF').asInteger,
                      1, // Tipo do Plano de assistencia saude
                      _CdsMovimentoFF.fieldByname('NUMDOCUMENTO').asString,
                      _cdsMovimentoFF.FieldByName('EXERCICIODIRF').asInteger, //Ano de declaração da DIRF
                      pQryDadosAdicionais.fieldByname('IDADMPLANOSAUDE').asInteger); // ID do plano de saúde BRADESCO
                    cdsDepPlanos.First;
                    While Not cdsDepPlanos.EOF Do
                      Begin
                        // Só entra lançamentos com valor
                        If cdsDepPlanos.fieldByname('VALOR').AsFloat <> 0 Then
                          Begin
                            // Se for o registro do próprio titular
                            If cdsDepPlanos.fieldByname('CPFTITULAR').AsString = cdsDepPlanos.fieldByname('CPFDEPEN').AsString Then
                              Begin
                                // Gravando linha do Titular - TPSE|
                                GravaLinhaTitular(ArquivoEnvioRFB,
                                  cdsDepPlanos.fieldByname('CPFTITULAR').AsString,
                                  cdsDepPlanos.fieldByname('NOME').AsString,
                                  cdsDepPlanos.fieldByname('VALOR').AsFloat);
                              End
                            Else
                              Begin
                                // Gravando linha do Dependente - DTPSE|
                                GravaLinhasDependentes(ArquivoEnvioRFB,
                                  cdsDepPlanos.fieldByname('CPFDEPEN').AsString,
                                  cdsDepPlanos.fieldByname('NOME').AsString,
                                  cdsDepPlanos.fieldByname('DEPENDENCIA').AsString,
                                  cdsDepPlanos.fieldByname('DATANASC').AsDateTime,
                                  cdsDepPlanos.fieldByname('VALOR').AsFloat);
                              End;
                          End;

                        cdsDepPlanos.Next;
                      End;
                  End;

                _CdsMovimentoFF.Next;

              End;
          End;

          //Cássio Rovaroto - SIG nº 64340  - Início
          // Gerando dados para AMIL, apenas para a DIRF 2017. 
        // OPSE - Gravando linha do Plano de Saúde
        //
        pQryDIRFMovSintTributosFF.First;
        If pQryDIRFMovSintTributosFF.fieldByname('CODNATUREZA').asString = '0561' Then
          Begin
            _CdsMovimentoFF.data := ListaDIRF_MovSintFF(
              pQryDIRFMovSintTributosFF.fieldByname('IDDIRF').asInteger,
              pQryDIRFMovSintTributosFF.fieldByname('CODNATUREZA').asString);
            // Paulo Nobre SIG 34459 - Fim

            if  _cdsMovimentoFF.FieldByName('EXERCICIODIRF').asInteger = 2017 then
            begin
              GravaLinhaPlanoSaudeEOdontologico(ArquivoEnvioRFB,
              pQryDadosAdicionais.fieldByname('CNPJPLANOSAUDE2').asString,
              pQryDadosAdicionais.fieldByname('NOMEPLANOSAUDE2').asString,
              pQryDadosAdicionais.fieldByname('ANSPLANOSAUDE2').asString);

              _CdsMovimentoFF.First;
              iContador := 0;
              While Not _CdsMovimentoFF.EOF Do
                Begin
                  AtualizaFrmProgresso(iContador);

                  // Só entra Empregado que está marcado
                  If _CdsMovimentoFF.fieldByname('FLGMARCADO').asString = 'S' Then
                    Begin
                      // Plano de Saúde totalizado
                      cdsDepPlanos.data := ListaTotalDependentesPlanos(
                         _CdsMovimentoFF.fieldByname('IDDIRF').asInteger,
                        1, // Tipo do Plano de assistencia saude
                        _CdsMovimentoFF.fieldByname('NUMDOCUMENTO').asString,
                        _cdsMovimentoFF.FieldByName('EXERCICIODIRF').asInteger,
                        pQryDadosAdicionais.fieldByname('IDADMPLANOSAUDE2').asInteger); //ID do Plano de Saúde AMIL.
                      cdsDepPlanos.First;
                      While Not cdsDepPlanos.EOF Do
                        Begin
                          // Só entra lançamentos com valor
                          If cdsDepPlanos.fieldByname('VALOR').AsFloat <> 0 Then
                            Begin
                              // Se for o registro do próprio titular
                              If cdsDepPlanos.fieldByname('CPFTITULAR').AsString = cdsDepPlanos.fieldByname('CPFDEPEN').AsString Then
                                Begin
                                  // Gravando linha do Titular - TPSE|
                                  GravaLinhaTitular(ArquivoEnvioRFB,
                                    cdsDepPlanos.fieldByname('CPFTITULAR').AsString,
                                    cdsDepPlanos.fieldByname('NOME').AsString,
                                    cdsDepPlanos.fieldByname('VALOR').AsFloat);
                                End
                              Else
                                Begin
                                  // Gravando linha do Dependente - DTPSE|
                                  GravaLinhasDependentes(ArquivoEnvioRFB,
                                    cdsDepPlanos.fieldByname('CPFDEPEN').AsString,
                                    cdsDepPlanos.fieldByname('NOME').AsString,
                                    cdsDepPlanos.fieldByname('DEPENDENCIA').AsString,
                                    cdsDepPlanos.fieldByname('DATANASC').AsDateTime,
                                    cdsDepPlanos.fieldByname('VALOR').AsFloat);
                                End;
                            End;

                          cdsDepPlanos.Next;
                        End;
                    End;

                  _CdsMovimentoFF.Next;

                End;
            end;
          End;
          //Cássio Rovaroto - SIG nº 64340 - Fim
          *)
          //Cássio Rovaroto - SIG nº 81294 - Fim
      End;
  End;

Begin
  Result := False;

  _qryAux := Twwquery.Create(Nil);
  _qryAux.DataBaseName := 'BaseDados';
  _qryAux2 := Twwquery.Create(Nil);
  _qryAux2.DataBaseName := 'BaseDados';

  // Inicia a Gravação do Arquivo
  If CriaArquivo(pNomeArquivoCompleto) Then
    Begin
      // Apagando os dados do arquivo temporário
      _qryAux.Close;
      _qryAux.SQL.Clear;
      _qryAux.SQL.add('DELETE FROM DIRF_MOVTEMP_ARQDIRF   ');
      If Not _qryAux.Prepared Then
        _qryAux.Prepare;
      _qryAux.ExecSQL;
      _qryAux.Close;
      //
      If pTipoMov = 'CP' Then // Movimento do Contas a Pagar
        Begin
          If pGeraArqComMovFF = 'S' Then // Sim
            GravaLinhasFF_EmpregadosEPFPrestadorServico;
          GravaLinhasCP_PessoaJuridica;
        End;
      If pTipoMov = 'FF' Then // Movimento da Folha de Empregados
        GravaLinhasFF_EmpregadosEPFPrestadorServico;

      AssignFile(ArquivoEnvioRFB, pNomeArquivoCompleto);
      ReWrite(ArquivoEnvioRFB);

      //edilaine SIG124014 : inicio
      if pQryDIRFGeradas.fieldByname('TIPODIRF').asString = 'O' then
         sNumRecibo := pQryDIRFGeradas.fieldByname('NUMRECIBO').asString
      else
         sNumRecibo := pQryDIRFGeradas.fieldByname('NUMRECIBOANT').asString;
      //edilaine SIG124014 : fim


      // Geração do Dados Principais do Arquivo (DIRF, RESPO, DECPJ)
      //pQryDIRFGeradas.First;        //edilaine SIG124014
      pQryDadosAdicionais.First;
      GRegDadosPrincipais(ArquivoEnvioRFB,
        // SOL 246475  PPM 636290 - Paulo Nobre
        inttostr(pQryDIRFGeradas.fieldByname('EXERCICIODIRF').asInteger + 1),
        pQryDIRFGeradas.fieldByname('EXERCICIODIRF').asString,
        //
        pQryDIRFGeradas.fieldByname('TIPODIRF').asString,
        sNumRecibo, //pQryDIRFGeradas.fieldByname('NUMRECIBO').asString,   //edilaine SIG124014
        pQryDadosAdicionais.fieldByname('IDQUALIFPJ').asString,
        pQryDadosAdicionais.fieldByname('FLGPAGEXTERIOR').asString,
        pQryDadosAdicionais.fieldByname('FLGPAGASSSAUDE').asString,
        pQryDadosAdicionais.fieldByname('CPFRESP').asString,
        pQryDadosAdicionais.fieldByname('NOMERESP').asString,
        pQryDadosAdicionais.fieldByname('DDDRESP').asString,
        pQryDadosAdicionais.fieldByname('FONERESP').asString,
        pQryDadosAdicionais.fieldByname('EMAILRESP').asString,
        pQryDadosAdicionais.fieldByname('CNPJFUNDACAO').asString,
        pQryDadosAdicionais.fieldByname('NOMEFUNDACAO').asString,
        pQryDadosAdicionais.fieldByname('CPFREPRES').asString);

      // Selecionando do arquivo temporário, todo o movimento dos Declarados (PF e PJ)
      _qryAux2.Close;
      _qryAux2.SQL.Clear;
      _qryAux2.SQL.Add('SELECT IDDIRF, EXERCICIODIRF, CODNATUREZA, NVL(NUMDOCUMENTO,''0'') AS NUMDOCUMENTO, NOME, TIPOLINHA '); // Paulo Nobre - WO7067
      _qryAux2.SQL.Add('FROM DIRF_MOVTEMP_ARQDIRF                                                   ');
      _qryAux2.SQL.Add('WHERE ORDEMTIPOLINHA = 0                                                    '); // Somente a linha de identificação do Declarado

//        _qryAux2.SQL.Add('      AND trim(numdocumento) IN (''69342903134'',  ''01842345907'', ''93146779668'', ''05989881495'', ''90806603100'' )' );   //XXXX


      _qryAux2.SQL.Add('GROUP BY IDDIRF, EXERCICIODIRF, CODNATUREZA, NUMDOCUMENTO, NOME, TIPOLINHA  ');
      _qryAux2.SQL.Add('ORDER BY IDDIRF, EXERCICIODIRF, CODNATUREZA, NUMDOCUMENTO, NOME, TIPOLINHA  ');      //edilaine SIG124014
      _qryAux2.Open;
      _qryAux2.First;
      iContador := 0;
      sCodNaturezaAnt := 'XXXX'; // Macete para gravar na primeira vez
      sCodNaturezaAtu := _qryAux2.fieldByname('CODNATUREZA').asString;
      While Not _qryAux2.EOF Do
        Begin
          // Geração da linha da Natureza (IDREC)
          If sCodNaturezaAnt <> sCodNaturezaAtu Then
            Begin
              frmProgresso.MostraFormProgresso('Gravando Linhas Tributo -> ' + sCodNaturezaAtu, True, False, True, 0, _qryAux2.RecordCount);
              GRegNatureza(ArquivoEnvioRFB, sCodNaturezaAtu);
            End;

          // Denis Horongoso SIG 61375 - Inicio
          // Verifica no arquivo temporário a existencia de alimentando por beneficiario
          pAlimentando := 'N';
          _qryAux.Close;
          _qryAux.SQL.Clear;
          _qryAux.SQL.Add('SELECT DISTINCT TIPOLINHA                                                     ');
          _qryAux.SQL.Add('FROM DIRF_MOVTEMP_ARQDIRF                                                     ');
          _qryAux.SQL.Add('WHERE IDDIRF = ' + _qryAux2.fieldByname('IDDIRF').asString);
          _qryAux.SQL.Add('      AND EXERCICIODIRF = ' + _qryAux2.fieldByname('EXERCICIODIRF').asString);
          _qryAux.SQL.Add('      AND CODNATUREZA = ' + sCodNaturezaAtu);
          _qryAux.SQL.Add('      AND CPFTITULAR = ' + _qryAux2.fieldByname('NUMDOCUMENTO').AsString);
          _qryAux.SQL.Add('      AND TIPOLINHA = ''INFPA''');
          _qryAux.Open;
          if not _qryAux.IsEmpty then
            pAlimentando := 'S';

          // Verifica no arquivo temporário a existencia de previdencia complementar por beneficiario
          pPrevCompl := 'N';
          _qryAux.Close;
          _qryAux.SQL.Clear;
          _qryAux.SQL.Add('SELECT DISTINCT TIPOLINHA                                                     ');
          _qryAux.SQL.Add('FROM DIRF_MOVTEMP_ARQDIRF                                                     ');
          _qryAux.SQL.Add('WHERE IDDIRF = ' + _qryAux2.fieldByname('IDDIRF').asString);
          _qryAux.SQL.Add('      AND EXERCICIODIRF = ' + _qryAux2.fieldByname('EXERCICIODIRF').asString);
          _qryAux.SQL.Add('      AND CODNATUREZA = ' + sCodNaturezaAtu);
          _qryAux.SQL.Add('      AND CPFTITULAR = ' + _qryAux2.fieldByname('NUMDOCUMENTO').AsString);
          _qryAux.SQL.Add('      AND TIPOLINHA = ''INFPC''');
          _qryAux.Open;
          if not _qryAux.IsEmpty then
            pPrevCompl := 'S';

          // Geração da linha de identificação do declarado
          GRegBeneficiario(ArquivoEnvioRFB,
            _qryAux2.fieldByname('TIPOLINHA').AsString,
            _qryAux2.fieldByname('NUMDOCUMENTO').AsString,
            _qryAux2.fieldByname('NOME').AsString,
            pAlimentando,
            pPrevCompl);
          // Denis Horongoso SIG 61375 - Fim

          // Selecionando do arquivo temporário as linhas de valores do Declarado Titular
          _qryAux.Close;
          _qryAux.SQL.Clear;
          _qryAux.SQL.Add('SELECT *                                                                      ');
          _qryAux.SQL.Add('FROM DIRF_MOVTEMP_ARQDIRF                                                     ');
          _qryAux.SQL.Add('WHERE IDDIRF = ' + _qryAux2.fieldByname('IDDIRF').asString);
          _qryAux.SQL.Add('      AND EXERCICIODIRF = ' + _qryAux2.fieldByname('EXERCICIODIRF').asString);
          _qryAux.SQL.Add('      AND CODNATUREZA = ' + sCodNaturezaAtu);
          _qryAux.SQL.Add('      AND CPFTITULAR = ' + _qryAux2.fieldByname('NUMDOCUMENTO').AsString);
          _qryAux.SQL.Add('ORDER BY IDDIRF, EXERCICIODIRF, CODNATUREZA, ORDEMTIPOLINHA               ');
          _qryAux.Open;
          While Not _qryAux.EOF Do
            Begin
              AtualizaFrmProgresso(iContador);
              If _qryAux.fieldbyname('TIPOLINHA').asString = 'INFPC' Then
                Begin
                  // Gravando linha da Previdencia Complementar - INFPC
                  GravaLinhasPreviComp(ArquivoEnvioRFB,
                    _qryAux.fieldbyname('TIPOLINHA').asString,
                    _qryAux.fieldByname('NUMDOCUMENTO').AsString,
                    _qryAux.fieldByname('NOME').AsString);
                End
              Else If _qryAux.fieldbyname('TIPOLINHA').asString = 'INFPA' Then
                Begin
                  // Gravando linha do Dependente do PA - INFPA
                  GravaLinhasDependentesPA(ArquivoEnvioRFB,
                    _qryAux.fieldbyname('TIPOLINHA').asString,
                    _qryAux.fieldByname('NUMDOCUMENTO').AsString,
                    _qryAux.fieldByname('NOME').AsString,
                    _qryAux.fieldByname('CODDEPENDENCIA').AsString,
                    _qryAux.fieldByname('DATANASC').AsString);
                End
              Else
                Begin
                  // Geração das linhas dos Valores do declarado
                  GravaLinhaValores(ArquivoEnvioRFB,
                    _qryAux.fieldbyname('TIPOLINHA').asString,
                    _qryAux.fieldbyname('VLRJAN').asFloat,
                    _qryAux.fieldbyname('VLRFEV').asFloat,
                    _qryAux.fieldbyname('VLRMAR').asFloat,
                    _qryAux.fieldbyname('VLRABR').asFloat,
                    _qryAux.fieldbyname('VLRMAI').asFloat,
                    _qryAux.fieldbyname('VLRJUN').asFloat,
                    _qryAux.fieldbyname('VLRJUL').asFloat,
                    _qryAux.fieldbyname('VLRAGO').asFloat,
                    _qryAux.fieldbyname('VLRSET').asFloat,
                    _qryAux.fieldbyname('VLROUT').asFloat,
                    _qryAux.fieldbyname('VLRNOV').asFloat,
                    _qryAux.fieldbyname('VLRDEZ').asFloat,
                    _qryAux.fieldbyname('VLR13').asFloat);
                End;

              _qryAux.Next;
            End;

          // Paulo Nobre SIG 34459 - Fim

          sCodNaturezaAnt := sCodNaturezaAtu;

          _qryAux2.Next;

          sCodNaturezaAtu := _qryAux2.fieldByname('CODNATUREZA').asString;
        End;

      // Gravando linhas dos Planos de Saúde e Odonto
      // São os últimos grupos de informações a serem gravadas no arquivo de envio
      // SOL 252107 PPM 780490 - Paulo Nobre  - 09/04/2015
      If pTipoMov = 'CP' Then // Movimento do Contas a Pagar
        Begin
          If pGeraArqComMovFF = 'S' Then // Sim
            GravaLinhasFF_PlanoSaudeEOdonto; // nobreza
        End;
      If pTipoMov = 'FF' Then // Movimento da Folha de Empregados
        GravaLinhasFF_PlanoSaudeEOdonto;

      sLinha := 'FIMDIRF|';

      writeln(ArquivoEnvioRFB, sLinha);

      frmProgresso.EscondeFormProgresso;
      CloseFile(ArquivoEnvioRFB);
      pQryDIRFMovSintTributos.First;
      pQryDIRFMovSintTributosFF.First;
      Result := True;
    End;

  FreeAndNil(_qryAux);
  FreeAndNil(_qryAux2);
End;

Procedure TCtrlGeraDIRF_Novo.GRegDadosPrincipais(
  Const pArquivo: TextFile;
  pAno,
  pAnoRef,
  pTipoDIRF,
  pNumeroRecibo,
  pQualificacaoPJ,
  pEfetuouPagExterior,
  pEfetuouPagAssSaude,
  pCPFResp,
  pNomeResp,
  pDDDResp,
  pTelResp,
  pEmailResp,
  pCNPJEmpresa,
  pNomeEmpresa,
  pCPFRepres: String);
Var sLinha: String;
Begin
  If pTipoDIRF = 'O' Then // Se Original, então (N)ão é Retificadora
    pTipoDIRF := 'N' // Não
  Else
    pTipoDIRF := 'S'; // Sim

    //Cássio Rovaroto - SIG nº 80605

  // Linha de cabeçalho da DIRF
  // PAULO
  sLinha := 'DIRF|' +
    pAno + '|' +
    pAnoRef + '|' +
    pTipoDIRF + '|' +
    pNumeroRecibo + '|' +
    //Cássio Rovaroto - SIG nº 80605 - Início
    //sNumVersaoLayout + '|'; // Versão do Layout
    GetVersaoLeiaute(pAnoRef) + '|'; // Versão do Layout
    //Cássio Rovaroto - SIG nº 80605 - Fim

  WriteLn(pArquivo, sLinha);

  // Linha do Responsavel
  sLinha := 'RESPO|' +
    pCPFResp + '|' + // CPF do Responsável
  pNomeResp + '|' + // Nome
  CompletaZero(Copy(pDDDResp, 1, 4), 2) + '|' + // DDD
  CompletaZero(Copy(pTelResp, 1, 8), 8) + '|' + // Telefone
  Copy(CompletaZero(Copy(pTelResp, 1, 8), 8), 5, 4) + '|' + // Ramal
  CompletaZero(Copy(pTelResp, 1, 8), 8) + '|'; // Fax

  // Tratamento de Erro - Retirar Caracteres Especiais
  sLinha := CaracteresEspeciais(sLinha);
  sLinha := sLinha + pEmailResp + '|'; // eMail
  WriteLn(pArquivo, sLinha);

  // Paulo Nobre - SOL 263296 PPM 1268948
  // Linha da FUNCEF
  sLinha := 'DECPJ|' + // 1
  Trim(pCNPJEmpresa) + '|' + // 2.CNPJ da FUNCEF
  pNomeEmpresa + '|' + // 3.Nome da FUNCEF
  pQualificacaoPJ + '|' + // 4.Qualificação da FUNCEF
  CompletaZero(Copy(pCPFRepres, 1, 11), 11) + '|'; // 5.CPF do Representante da FUNCEF
  // 6.Indicador de sócio ostensivo responsável por sociedade em conta de participação - SCP
  sLinha := sLinha + 'N|'; // Não
  // 7.Indicador de declarante depositário de crédito decorrente de decisão judicial.
  sLinha := sLinha + 'N|'; // Não
  // 8.Indicador de declarante de instituição administradora ou intermediadora de fundo ou clube de investimento
  sLinha := sLinha + 'N|'; // Não
  // 9.Indicador de declarante de rendimentos pagos a residentes ou domiciliados no exterior
  sLinha := sLinha + pEfetuouPagExterior + '|';
  // 10.Indicador de plano privado de assistência à saúde - coletivo empresarial
  sLinha := sLinha + pEfetuouPagAssSaude + '|';

  // Paulo Nobre SIG 34459 - Inicio
  // 11.Indicador de pagamentos relacionados à Copa das Confederações Fifa 2013 e Copa do Mundo Fifa 2014
//  sLinha := sLinha + 'N|'; // Não
  // Paulo Nobre SIG 34459 - Fim

  // 11.Indicador de pagamentos relacionados aos Jogos Olímpicos de 2016 e aos Jogos Paraolímpicos de 2016
  sLinha := sLinha + 'N|'; // Não

  // Denis Horongoso SIG 61375 - Inicio
  // 12.Indicador de entidade em que a União detém maioria do capital social sujeito a voto,
  // recebe recursos do Tesouro Nacional e está obrigada a registrar a execução
  // orçamentária no Siafi (IN 1.234/2012, art. 4º, incisos III e IV)
  sLinha := sLinha + 'N|'; // Não

  // 13.Indicador de situação especial da declaração
  sLinha := sLinha + 'N|'; // Não

  // Paulo Nobre SIG 34459 - Inicio
  // 14.Data do evento (se a 13 estiver com 'S', então o 14 deve ter umada data de evento)
  sLinha := sLinha + '|'; // Não
  // Paulo Nobre SIG 34459 - Fim 
  // Denis Horongoso SIG 61375 - Fim

  // Tratamento de Erro - Retirar Caracteres Especiais
  sLinha := CaracteresEspeciais(sLinha);
  WriteLn(pArquivo, sLinha);
End;

Procedure TCtrlGeraDIRF_Novo.GRegNatureza(
  Const pArquivo: TextFile;
  sNatureza: String);
Begin
  WriteLn(pArquivo, 'IDREC|' + CompletaZero(sNatureza, 4) + '|');
End;

Procedure TCtrlGeraDIRF_Novo.GRegBeneficiario(
  Const pArquivo: TextFile;
  pTipoLinha,
  pDocumento,
  pNome,               // Denis Horongoso SIG 61375
  pAlimentando,        // Denis Horongoso SIG 61375
  pPrevCompl: String); // Denis Horongoso SIG 61375
Var sLinha: String;
Begin
  If pTipoLinha = 'BPJDEC' Then // Pessoa Juridica
    sLinha := pTipoLinha + '|' + CompletaZero(trim(pDocumento), 14) + '|' + pNome + '|'
  Else // 'BPFDEC' - Pessoa Fisica
    sLinha := pTipoLinha + '|' + CompletaZero(trim(pDocumento), 11) + '|' + pNome + '||' + pAlimentando + '|' + pPrevCompl + '|'; // Denis Horongoso SIG 61375

  // Tratamento de Erro - Retirar Caracteres Especiais
  sLinha := CaracteresEspeciais(sLinha);
  WriteLn(pArquivo, sLinha);
End;

Procedure TCtrlGeraDIRF_Novo.GravaLinhaValores(
  Const pArquivo: TextFile;
  pTipoLinha: String;
  pVl1, pVl2, pVl3, pVl4, pVl5, pVl6, pVl7, pVl8, pVl9, pVl10, pVl11, pVl12, pVl13: Double);
Var sLinha: String;
Begin
  If (pVl1 + pVl2 + pVl3 + pVl4 + pVl5 + pVl6 + pVl7 + pVl8 + pVl9 + pVl10 + pVl11 + pVl12 + pVl13) <> 0 Then
    Begin
      sLinha := pTipoLinha + '|';

      If pVl1 <> 0 Then
        sLinha := sLinha + FormataValor(2, FloatToStr(ajustaValor(pVl1))) + '|'
      Else
        sLinha := sLinha + '|';

      If pVl2 <> 0 Then
        sLinha := sLinha + FormataValor(2, FloatToStr(ajustaValor(pVl2))) + '|'
      Else
        sLinha := sLinha + '|';

      If pVl3 <> 0 Then
        sLinha := sLinha + FormataValor(2, FloatToStr(ajustaValor(pVl3))) + '|'
      Else
        sLinha := sLinha + '|';

      If pVl4 <> 0 Then
        sLinha := sLinha + FormataValor(2, FloatToStr(ajustaValor(pVl4))) + '|'
      Else
        sLinha := sLinha + '|';

      If pVl5 <> 0 Then
        sLinha := sLinha + FormataValor(2, FloatToStr(ajustaValor(pVl5))) + '|'
      Else
        sLinha := sLinha + '|';

      If pVl6 <> 0 Then
        sLinha := sLinha + FormataValor(2, FloatToStr(ajustaValor(pVl6))) + '|'
      Else
        sLinha := sLinha + '|';

      If pVl7 <> 0 Then
        sLinha := sLinha + FormataValor(2, FloatToStr(ajustaValor(pVl7))) + '|'
      Else
        sLinha := sLinha + '|';

      If pVl8 <> 0 Then
        sLinha := sLinha + FormataValor(2, FloatToStr(ajustaValor(pVl8))) + '|'
      Else
        sLinha := sLinha + '|';

      If pVl9 <> 0 Then
        sLinha := sLinha + FormataValor(2, FloatToStr(ajustaValor(pVl9))) + '|'
      Else
        sLinha := sLinha + '|';

      If pVl10 <> 0 Then
        sLinha := sLinha + FormataValor(2, FloatToStr(ajustaValor(pVl10))) + '|'
      Else
        sLinha := sLinha + '|';

      If pVl11 <> 0 Then
        sLinha := sLinha + FormataValor(2, FloatToStr(ajustaValor(pVl11))) + '|'
      Else
        sLinha := sLinha + '|';

      If pVl12 <> 0 Then
        sLinha := sLinha + FormataValor(2, FloatToStr(ajustaValor(pVl12))) + '|'
      Else
        sLinha := sLinha + '|';

      If pVl13 <> 0 Then
        sLinha := sLinha + FormataValor(2, FloatToStr(ajustaValor(pVl13))) + '|'
      Else
        sLinha := sLinha + '|';

      WriteLn(pArquivo, sLinha);
    End;
End;

// Paulo Nobre SIG 34459 - Inicio

Procedure TCtrlGeraDIRF_Novo.GravaLinhasPreviComp(
  Const pArquivo: TextFile;
  pTipoLinha,
  pCNPJFund,
  pNomeFund: String);
Var sLinha: String;
Begin
  sLinha := pTipoLinha + '|' +
    Trim(pCNPJFund) + '|' + // CNPJ da FUNCEF
  pNomeFund + '|'; // Nome da FUNCEF

  WriteLn(pArquivo, sLinha);
End;

Procedure TCtrlGeraDIRF_Novo.GravaLinhasDependentesPA(
  Const pArquivo: TextFile;
  pTipoLinha,
  pCPF,
  pNome,
  pDepend,
  pDataNasc: String);
Var sLinha: String;
Begin
  sLinha := pTipoLinha + '|';

  If (pCPF = '') Then
    sLinha := sLinha + '|'
  Else
    sLinha := sLinha + CompletaZero(Copy(pCPF, 1, 11), 11) + '|'; // CPF Dependente

  If pDataNasc = EmptyStr Then
    sLinha := sLinha + '|'
  Else
    sLinha := sLinha + FormatDateTime('YYYYMMDD', strtodate(pDataNasc)) + '|';

  sLinha := sLinha + trim(CaracteresEspeciais(pNome)) + '|' + pDepend + '|';

  WriteLn(pArquivo, sLinha);
End;
// Paulo Nobre SIG 34459 - Fim

Procedure TCtrlGeraDIRF_Novo.GravaLinhaPlanoSaudeEOdontologico(
  Const pArquivo: TextFile;
  pCNPJPlano,
  pNomePlano,
  pANSPlano: String);
Var sLinha: String;
Begin
  sLinha := 'OPSE|' +
    CompletaZero(Copy(pCNPJPlano, 1, 14), 14) + '|' +
    trim(CaracteresEspeciais(pNomePlano)) + '|' +
    CompletaZero(StringReplace(pANSPlano, '-', '', [rfReplaceAll]), 6) + '|';
  WriteLn(pArquivo, sLinha);
End;

Procedure TCtrlGeraDIRF_Novo.GravaLinhaIdentificadoraDosPlanos(
  Const pArquivo: TextFile);
Begin
  WriteLn(pArquivo, 'PSE|');
End;

Procedure TCtrlGeraDIRF_Novo.GravaLinhaTitular(
  Const pArquivo: TextFile;
  pCPF,
  pNome: String;
  pValor: Double);
Var sLinha: String;
Begin
  sLinha := 'TPSE|' +
    CompletaZero(Copy(pCPF, 1, 11), 11) + '|' + // CPF Titular
  trim(CaracteresEspeciais(pNome)) + '|';

  If pValor <> 0 Then
    sLinha := sLinha + FormataValor(2, FloatToStr(ajustaValor(pValor))) + '|'
  Else
    sLinha := sLinha + '|';

  WriteLn(pArquivo, sLinha);
End;

Procedure TCtrlGeraDIRF_Novo.GravaLinhasDependentes(
  Const pArquivo: TextFile;
  pCPF,
  pNome,
  pDepend: String;
  pDataNasc: TDateTime;
  pValor: Double);
Var sLinha: String;
Begin
  sLinha := 'DTPSE|';
  If (pCPF = '') Then
    sLinha := sLinha + '|'
  Else
    sLinha := sLinha + CompletaZero(Copy(pCPF, 1, 11), 11) + '|'; // CPF Dependente

  sLinha := sLinha + FormatDateTime('YYYYMMDD', pDataNasc) + '|' +
    trim(CaracteresEspeciais(pNome)) + '|' +
    pDepend + '|';

  If pValor <> 0 Then
    sLinha := sLinha + FormataValor(2, FloatToStr(ajustaValor(pValor))) + '|'
  Else
    sLinha := sLinha + '|';

  WriteLn(pArquivo, sLinha);
End;

// Paulo Nobre SIG 34459

Procedure TCtrlGeraDIRF_Novo.InserirLinhasArquivoTempDIRF(
  p0: Integer;
  p1,
  p2,
  p3: String;
  p4: Integer;
  p5, p6, p7, p21, p22, p23: String;
  p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20: Double);
Begin
  // Esta tabela foi criada para resolver uma exigência da Receita, que necessita que dentro de um grupo de tributos
  // os Declarados estejam ordenados por CPF ou CNPJ.
  // Como hoje, cada Área tem o controle de alguns mesmos tributos (ex.: 0588 no CP e 0588 na Folha de Empregados) e como
  // cada área tem seu movimento registrado em tabelas próprias, foi necessário que
  // todo o movimento fosse unificado numa tabela única, base para a geração do arquivo texto.
  _qryInserirLinhasArquivoTempDIRF.Close;
  _qryInserirLinhasArquivoTempDIRF.SQL.Clear;
  _qryInserirLinhasArquivoTempDIRF.SQL.add('INSERT INTO DIRF_MOVTEMP_ARQDIRF                                       ');
  _qryInserirLinhasArquivoTempDIRF.SQL.add('(IDDIRF, EXERCICIODIRF, CODNATUREZA, NUMDOCUMENTO, ORDEMTIPOLINHA,     ');
  _qryInserirLinhasArquivoTempDIRF.SQL.add('TIPOLINHA, NOME, ORIGEMMOV,                                            ');
  _qryInserirLinhasArquivoTempDIRF.SQL.add('VLRJAN, VLRFEV, VLRMAR, VLRABR, VLRMAI, VLRJUN, VLRJUL,                ');
  _qryInserirLinhasArquivoTempDIRF.SQL.add('VLRAGO, VLRSET, VLROUT, VLRNOV, VLRDEZ, VLR13, DATANASC, CODDEPENDENCIA, CPFTITULAR) ');
  _qryInserirLinhasArquivoTempDIRF.SQL.add('VALUES (:p0, :p1, :p2, :p3, :p4, :p5, :p6, :p7, :p8, :p9, :p10, :p11,  ');
  _qryInserirLinhasArquivoTempDIRF.SQL.add(':p12, :p13, :p14, :p15, :p16, :p17, :p18, :p19, :p20,                  ');
  If p21 = '' Then
    _qryInserirLinhasArquivoTempDIRF.SQL.add('NULL, :p22, :p23)                  ')
  Else
    _qryInserirLinhasArquivoTempDIRF.SQL.add(':p21, :p22, :p23)                  ');
  _qryInserirLinhasArquivoTempDIRF.ParamByName('p0').asInteger := p0;
  _qryInserirLinhasArquivoTempDIRF.ParamByName('p1').asString := p1;
  _qryInserirLinhasArquivoTempDIRF.ParamByName('p2').asString := p2;
  _qryInserirLinhasArquivoTempDIRF.ParamByName('p3').asString := p3;
  _qryInserirLinhasArquivoTempDIRF.ParamByName('p4').asInteger := p4;
  _qryInserirLinhasArquivoTempDIRF.ParamByName('p5').asString := p5;
  _qryInserirLinhasArquivoTempDIRF.ParamByName('p6').asString := p6;
  _qryInserirLinhasArquivoTempDIRF.ParamByName('p7').asString := p7;
  _qryInserirLinhasArquivoTempDIRF.ParamByName('p8').asFloat := abs(p8);
  _qryInserirLinhasArquivoTempDIRF.ParamByName('p9').asFloat := abs(p9);
  _qryInserirLinhasArquivoTempDIRF.ParamByName('p10').asFloat := abs(p10);
  _qryInserirLinhasArquivoTempDIRF.ParamByName('p11').asFloat := abs(p11);
  _qryInserirLinhasArquivoTempDIRF.ParamByName('p12').asFloat := abs(p12);
  _qryInserirLinhasArquivoTempDIRF.ParamByName('p13').asFloat := abs(p13);
  _qryInserirLinhasArquivoTempDIRF.ParamByName('p14').asFloat := abs(p14);
  _qryInserirLinhasArquivoTempDIRF.ParamByName('p15').asFloat := abs(p15);
  _qryInserirLinhasArquivoTempDIRF.ParamByName('p16').asFloat := abs(p16);
  _qryInserirLinhasArquivoTempDIRF.ParamByName('p17').asFloat := abs(p17);
  _qryInserirLinhasArquivoTempDIRF.ParamByName('p18').asFloat := abs(p18);
  _qryInserirLinhasArquivoTempDIRF.ParamByName('p19').asFloat := abs(p19);
  _qryInserirLinhasArquivoTempDIRF.ParamByName('p20').asFloat := abs(p20);
  If p21 <> '' Then
    _qryInserirLinhasArquivoTempDIRF.ParamByName('p21').asDateTime := strtodate(p21);
  _qryInserirLinhasArquivoTempDIRF.ParamByName('p22').asString := p22;
  _qryInserirLinhasArquivoTempDIRF.ParamByName('p23').asString := p23;
  If Not _qryInserirLinhasArquivoTempDIRF.Prepared Then
    _qryInserirLinhasArquivoTempDIRF.Prepare;
  _qryInserirLinhasArquivoTempDIRF.ExecSQL;
End;

function TCtrlGeraDIRF_Novo.GetVersaoLeiaute(pAno: string): String;
var
  sSQL: string;
  cdsAux: TCMClientDataSet;
begin
  //Cássio Rovaroto - SIG nº 131689 - Início
  (*case StrToInt(pAno) of
    2013: Result := sNumVersaoLayout2013;
    2014: Result := sNumVersaoLayout2014;
    2015: Result := sNumVersaoLayout2015;
    2016: Result := sNumVersaoLayout2016;
    2017: Result := sNumVersaoLayout2017;
    2018: Result := sNumVersaoLayout2018;
    2019: Result := sNumVersaoLayout2019; //Cássio rovaroto - SIG nº 97516
    2020: Result := sNumVersaoLayout2020; //edilaine SIG113859
    2021: Result := sNumVersaoLayout2021; //Everson Cunha - SIG122494
  end;*)
  cdsAux := TCMClientDataSet.Create(nil);
  try
    sSQL := 'SELECT NUMVERSAOLAYOUT    ' +#13#10+
            '  FROM DIRF               ' +#13#10+
            ' WHERE EXERCICIODIRF = ' + QuotedStr(pAno) +#13#10+
            ' GROUP BY NUMVERSAOLAYOUT ';
    cdsAux.Data := GetDataPacket(sSQL);

    Result := cdsAux.FieldByName('NUMVERSAOLAYOUT').asString;

  finally
    FreeAndNil(cdsAux);
  end
end;

procedure TCtrlGeraDIRF_Novo.GeraDadosPlanoOdontologico(pQryDIRFMovSintTributosFF: TwwQuery; pCNPJPlano, pNomePlano, pANSPlano: String);
var
  iContador: Integer;
begin
  GravaLinhaPlanoSaudeEOdontologico(ArquivoEnvioRFB,
                                    pCNPJPlano,
                                    pNomePlano,
                                    pANSPlano);

  pQryDIRFMovSintTributosFF.First;
  if pQryDIRFMovSintTributosFF.fieldByname('CODNATUREZA').asString = '0561' then
  begin
    _CdsMovimentoFF.data := ListaDIRF_MovSintFF(pQryDIRFMovSintTributosFF.FieldByName('IDDIRF').asInteger,
                                                pQryDIRFMovSintTributosFF.FieldByName('CODNATUREZA').asString);

    _CdsMovimentoFF.First;
    iContador := 0;
    frmProgresso.MostraFormProgresso('Gravando Linhas Dependentes Pl.Odonto...', True, False, True, 0, _CdsMovimentoFF.RecordCount);

    while not _CdsMovimentoFF.Eof do
    begin
      AtualizaFrmProgresso(iContador);

      // Só entra Empregado que está marcado
      if _CdsMovimentoFF.FieldByName('FLGMARCADO').asString = 'S' then
      begin
        // Plano Odonto totalizado
        //Cássio Rovaroto - SIG nº 84634 - Início
        if _CdsMovimentoFF.FieldByName('EXERCICIODIRF').asInteger >= 2018 then
          cdsDepPlanos.data := ListaTotalDependentesPlanosNova(_CdsMovimentoFF.FieldByName('IDDIRF').asInteger,
                                                               2, // Tipo do Plano de assistencia odonto
                                                               _CdsMovimentoFF.FieldByName('NUMDOCUMENTO').asString)
        else
          cdsDepPlanos.data := ListaTotalDependentesPlanos(_CdsMovimentoFF.FieldByName('IDDIRF').asInteger,
                                                           2, // Tipo do Plano de assistencia odonto
                                                           _CdsMovimentoFF.FieldByName('NUMDOCUMENTO').asString);
        //Cássio Rovaroto - SIG nº 84634 - Fim
        cdsDepPlanos.First;
        while not cdsDepPlanos.Eof do
        begin
          // Só entra lançamentos com valor
          if (cdsDepPlanos.FieldByName('VALOR').AsFloat <> 0) then     
          begin
            // Se for o registro do próprio titular
            if cdsDepPlanos.FieldByName('CPFTITULAR').AsString = cdsDepPlanos.FieldByName('CPFDEPEN').AsString then
              // Gravando linha do Titular - TPSE|
              GravaLinhaTitular(ArquivoEnvioRFB,
                                cdsDepPlanos.FieldByName('CPFTITULAR').AsString,
                                cdsDepPlanos.FieldByName('NOME').AsString,
                                cdsDepPlanos.FieldByName('VALOR').AsFloat)
            else
              // Gravando linha do Dependente - DTPSE|
              GravaLinhasDependentes(ArquivoEnvioRFB,
                                     cdsDepPlanos.FieldByName('CPFDEPEN').AsString,
                                     cdsDepPlanos.FieldByName('NOME').AsString,
                                     cdsDepPlanos.FieldByName('DEPENDENCIA').AsString,
                                     cdsDepPlanos.FieldByName('DATANASC').AsDateTime,
                                     cdsDepPlanos.FieldByName('VALOR').AsFloat);
          end;
          cdsDepPlanos.Next;
        end;
      end;
      _CdsMovimentoFF.Next;

    end;
  end;
end;

procedure TCtrlGeraDIRF_Novo.GeraDadosPlanoSaude(pQryDIRFMovSintTributosFF: TwwQuery; pIDPlanoSaude: Integer; pCNPJPlano, pNomePlano, pANSPlano: String);
var
  iContador: Integer;
begin
  GravaLinhaPlanoSaudeEOdontologico(ArquivoEnvioRFB,
                                    pCNPJPlano,
                                    pNomePlano,
                                    pANSPlano
                                    );

  pQryDIRFMovSintTributosFF.First;
  if pQryDIRFMovSintTributosFF.fieldByname('CODNATUREZA').asString = '0561' then
  begin
    _CdsMovimentoFF.data := ListaDIRF_MovSintFF(pQryDIRFMovSintTributosFF.FieldByName('IDDIRF').asInteger,
                                                pQryDIRFMovSintTributosFF.FieldByName('CODNATUREZA').asString);

    _CdsMovimentoFF.First;
    iContador := 0;
    frmProgresso.MostraFormProgresso('Gravando Linhas Dependentes Pl.Saúde ...', True, False, True, 0, _CdsMovimentoFF.RecordCount);

    while not _CdsMovimentoFF.Eof do
    begin
      AtualizaFrmProgresso(iContador);

      // Só entra Empregado que está marcado
      if _CdsMovimentoFF.FieldByName('FLGMARCADO').asString = 'S' then
      begin
        //Cássio Rovaroto - SIG nº 84634 - Início
        //if  _cdsMovimentoFF.FieldByName('EXERCICIODIRF').asInteger >= 2018 then  //SIG 97984 Tiago Von
        if  _cdsMovimentoFF.FieldByName('EXERCICIODIRF').asInteger = 2018 then     //SIG 97984 Tiago Von
          cdsDepPlanos.data := ListaTotalDependentesPlanosNova(_CdsMovimentoFF.FieldByName('IDDIRF').asInteger,
                                                           1, // Tipo do Plano de assistencia saude
                                                           _CdsMovimentoFF.FieldByName('NUMDOCUMENTO').asString) // ID do plano de saúde
        else
        //SIG97984 Tiago Von - INICIO
        //if  _cdsMovimentoFF.FieldByName('EXERCICIODIRF').asInteger = 2019 then     //edilaine SIG113909
        if  _cdsMovimentoFF.FieldByName('EXERCICIODIRF').asInteger >= 2019 then      //edilaine SIG113909

          cdsDepPlanos.data := ListaTotalDependentesPlanosNova(_CdsMovimentoFF.FieldByName('IDDIRF').asInteger,
                                                           1, // Tipo do Plano de assistencia saude
                                                           _CdsMovimentoFF.FieldByName('NUMDOCUMENTO').asString,
                                                           '',
                                                           _cdsMovimentoFF.FieldByName('EXERCICIODIRF').asInteger, //Ano de declaração da DIRF
                                                           pIDPlanoSaude) // ID do plano de saúde
        else
        //SIG97984 Tiago Von - FIM
          cdsDepPlanos.data := ListaTotalDependentesPlanos(_CdsMovimentoFF.FieldByName('IDDIRF').asInteger,
                                                           1, // Tipo do Plano de assistencia saude
                                                           _CdsMovimentoFF.FieldByName('NUMDOCUMENTO').asString,
                                                           _cdsMovimentoFF.FieldByName('EXERCICIODIRF').asInteger, //Ano de declaração da DIRF
                                                           pIDPlanoSaude); // ID do plano de saúde
        //Cássio Rovaroto - SIG nº 84634 - Fim
        cdsDepPlanos.First;
        while not cdsDepPlanos.EOF do
        begin
          // Só entra lançamentos com valor
          if cdsDepPlanos.FieldByName('VALOR').AsFloat <> 0 then
          begin
            // Se for o registro do próprio titular
            if cdsDepPlanos.FieldByName('CPFTITULAR').AsString = cdsDepPlanos.FieldByName('CPFDEPEN').AsString Then
              // Gravando linha do Titular - TPSE|
              GravaLinhaTitular(ArquivoEnvioRFB,
                                cdsDepPlanos.fieldByname('CPFTITULAR').AsString,
                                cdsDepPlanos.fieldByname('NOME').AsString,
                                cdsDepPlanos.fieldByname('VALOR').AsFloat)
            else
              // Gravando linha do Dependente - DTPSE|
              GravaLinhasDependentes(ArquivoEnvioRFB,
                                     cdsDepPlanos.fieldByname('CPFDEPEN').AsString,
                                     cdsDepPlanos.fieldByname('NOME').AsString,
                                     cdsDepPlanos.fieldByname('DEPENDENCIA').AsString,
                                     cdsDepPlanos.fieldByname('DATANASC').AsDateTime,
                                     cdsDepPlanos.fieldByname('VALOR').AsFloat);

          end;
          cdsDepPlanos.Next;
        end;
      end;
      _CdsMovimentoFF.Next;
    end;
  end;
end;

function TCtrlGeraDIRF_Novo.ListaTotalDependentesPlanosNova(pidDIRF,
//  pTipoPlano: integer; pCPF, pCodNatureza: string): OleVariant;                                           // SIG 97984 Tiago Von
    pTipoPlano: integer; pCPF, pCodNatureza: string; AnoDIRF: integer; pIDPlanoSaude: Integer): OleVariant; // SIG 97984 Tiago Von
var
  sSQL: string;
begin
  sSQL := sSQL + ' SELECT DT.IDDIRF,                                                                       ';
  sSQL := sSQL + '       DT.CPFTITULAR,                                                                    ';
  sSQL := sSQL + '       DT.CPFTITULAR AS CPFDEPEN,                                                        ';
  sSQL := sSQL + '       DT.NOME,                                                                          ';
  sSQL := sSQL + '       DT.DATANASC,                                                                      ';
  sSQL := sSQL + '       DT.ORDEMDEPEN,                                                                    ';
  sSQL := sSQL + '       DT.DEPENDENCIA,                                                                   ';
  sSQL := sSQL + '       DT.IDDEPENDENCIA,                                                                 ';
  sSQL := sSQL + '       DT.CODNATUREZA,                                                                   ';
  sSQL := sSQL + '       SUM(VT.VALOR + NVL(VD.VALOR, 0)) AS VALOR                                         ';
  sSQL := sSQL + '  FROM (SELECT D.IDDIRF,                                                                 ';
  sSQL := sSQL + '               D.IDTITULAR,                                                              ';
  sSQL := sSQL + '               D.CPFTITULAR,                                                             ';
  sSQL := sSQL + '               P.NOME,                                                                   ';
  sSQL := sSQL + '               D.DATANASC,                                                               ';
  sSQL := sSQL + '               D.ORDEMDEPEN,                                                             ';
  sSQL := sSQL + '               D.DEPENDENCIA,                                                            ';
  sSQL := sSQL + '               D.IDDEPENDENCIA,                                                          ';
  sSQL := sSQL + '               D.CODNATUREZA                                                             ';
  sSQL := sSQL + '          FROM DIRF_MOVANALFF_DEPEN D                                                    ';
  sSQL := sSQL + '          JOIN PESSOA P ON P.IDPESSOA = (SELECT MAX(P2.IDPESSOA)                         ';
  sSQL := sSQL + '                                           FROM PESSOA P2                                ';
  sSQL := sSQL + '                                           WHERE ((D.CPFTITULAR = P2.NUMDOCUMENTO) OR    ';
  sSQL := sSQL + '                                                  (D.IDTITULAR = P2.IDPESSOA)))          ';
  sSQL := sSQL + '         WHERE IDDIRF = ' + IntToStr(pIdDIRF);
  sSQL := sSQL + '           AND CPFTITULAR = ' + QuotedStr(pCPF);
  sSQL := sSQL + '           AND FLGASSISTENCIAL = ' + IntToStr(pTipoPlano);
  sSQL := sSQL + '           AND IDDEPENDENCIA IN (''PRP'', ''OUT'')                                       ';

  //SIG 97984 Tiago Von - INICIO
  if (AnoDIRF = 2019) and (pTipoPlano = 1) then
  begin
    //Realizando o tratamento a ser aplicado apenas para o ano de 2019 onde para o plano de saúde AMIL se traga as informações
    //de Janeiro a Novembro; e para o plano BRADESCO, somente Dezembro.
    if pIdPlanoSaude = 1023622 then // 304777 => AMIL
      sSql := sSql + '               AND IDPROVENTO = 40024 AND MES = ' + QuotedStr('12')
    else
      sSql := sSql + '               AND (MES <> ' + QuotedStr('12')+ ' OR (IDPROVENTO <> 40024 AND MES = ' + QuotedStr('12') + '))';
  end;
  //SIG 97984 Tiago Von - FIM

  if pCodNatureza <> EmptyStr then
    sSQL := sSQL + '                AND CODNATUREZA = ' + QuotedStr(pCodNatureza);
    
  sSQL := sSQL + '         GROUP BY IDDIRF,                                                                ';
  sSQL := sSQL + '               IDTITULAR,                                                                ';
  sSQL := sSQL + '               CPFTITULAR,                                                               ';
  sSQL := sSQL + '               P.NOME,                                                                   ';
  sSQL := sSQL + '               DATANASC,                                                                 ';
  sSQL := sSQL + '               ORDEMDEPEN,                                                               ';
  sSQL := sSQL + '               DEPENDENCIA,                                                              ';
  sSQL := sSQL + '               IDDEPENDENCIA,                                                            ';
  sSQL := sSQL + '               CODNATUREZA) DT                                                           ';
  sSQL := sSQL + '  JOIN (SELECT IDDIRF,                                                                   ';
  sSQL := sSQL + '               IDTITULAR,                                                                ';
  sSQL := sSQL + '               SUM(VALOR) AS VALOR                                                       ';
  sSQL := sSQL + '  FROM DIRF_MOVANALFF_DEPEN                                                              ';
  sSQL := sSQL + ' WHERE IDDIRF = ' + IntToStr(pIdDIRF);
  sSQL := sSQL + '   AND CPFTITULAR = ' + QuotedStr(pCPF);
  sSQL := sSQL + '   AND FLGASSISTENCIAL = ' + IntToStr(pTipoPlano);
  sSQL := sSQL + '   AND IDDEPENDENCIA IN (''PRP'', ''OUT'')                                               '; 
    //SIG 97984 Tiago Von - INICIO
  if (AnoDIRF = 2019) and (pTipoPlano = 1) then
  begin
    //Realizando o tratamento a ser aplicado apenas para o ano de 2019 onde para o plano de saúde AMIL se traga as informações
    //de Janeiro a Novembro; e para o plano BRADESCO, somente Dezembro.
    if pIdPlanoSaude = 1023622 then // 304777 => AMIL
      sSql := sSql + '               AND IDPROVENTO = 40024 AND MES = ' + QuotedStr('12')
    else
      sSql := sSql + '               AND (MES <> ' + QuotedStr('12')+ ' OR (IDPROVENTO <> 40024 AND MES = ' + QuotedStr('12') + '))';
  end;
  //SIG 97984 Tiago Von - FIM

  //edilaine SIG113909 : inicio
  if (AnoDIRF = 2020) and (pTipoPlano = 1) then
  begin
    //Realizando o tratamento a ser aplicado apenas para o ano de 2020 onde para o plano de saúde AMIL se traga as informações
    //das rubricas 41446 e 41447 e as demais para o plano BRADESCO

    if pIdPlanoSaude = 1023622 then // 304777 => AMIL
      sSql := sSql + '               AND IDPROVENTO NOT IN (41447, 41446) '
    else
      sSql := sSql + '               AND IDPROVENTO IN (41447, 41446) ';

  end;
  //edilaine SIG113909 : fim


  sSQL := sSQL + ' GROUP BY IDDIRF, IDTITULAR) VT ON VT.IDDIRF = DT.IDDIRF AND VT.IDTITULAR = DT.IDTITULAR ';
  sSQL := sSQL + '  LEFT JOIN (SELECT IDDIRF,                                                              ';
  sSQL := sSQL + '               IDTITULAR,                                                                ';
  sSQL := sSQL + '               SUM(VALOR) AS VALOR                                                       ';
  sSQL := sSQL + '  FROM DIRF_MOVANALFF_DEPEN                                                              ';
  sSQL := sSQL + ' WHERE IDDIRF = ' + IntToStr(pIdDIRF);
  sSQL := sSQL + '   AND CPFTITULAR = ' + QuotedStr(pCPF);
  sSQL := sSQL + '   AND FLGASSISTENCIAL = ' + IntToStr(pTipoPlano);
  sSQL := sSQL + '   AND IDDEPENDENCIA NOT IN (''PRP'', ''OUT'')                                           ';
    //SIG 97984 Tiago Von - INICIO
  if (AnoDIRF = 2019) and (pTipoPlano = 1) then
  begin
    //Realizando o tratamento a ser aplicado apenas para o ano de 2019 onde para o plano de saúde AMIL se traga as informações
    //de Janeiro a Novembro; e para o plano BRADESCO, somente Dezembro.
    if pIdPlanoSaude = 1023622 then // 304777 => AMIL
      sSql := sSql + '               AND IDPROVENTO = 40024 AND MES = ' + QuotedStr('12')
    else
      sSql := sSql + '               AND (MES <> ' + QuotedStr('12')+ ' OR (IDPROVENTO <> 40024 AND MES = ' + QuotedStr('12') + '))';
  end;
  //SIG 97984 Tiago Von - FIM

  //edilaine SIG113909 : inicio
  if (AnoDIRF = 2020) and (pTipoPlano = 1) then
  begin
    //Realizando o tratamento a ser aplicado apenas para o ano de 2020 onde para o plano de saúde AMIL se traga as informações
    //das rubricas 41446 e 41447 e as demais para o plano BRADESCO

    if pIdPlanoSaude = 1023622 then // 304777 => AMIL
      sSql := sSql + '               AND IDPROVENTO NOT IN (41447, 41446) '
    else
      sSql := sSql + '               AND IDPROVENTO IN (41447, 41446) ';

  end;
  //edilaine SIG113909 : fim
  
  sSQL := sSQL + ' GROUP BY IDDIRF, IDTITULAR) VD ON VD.IDDIRF = DT.IDDIRF AND VD.IDTITULAR = DT.IDTITULAR ';
  sSQL := sSQL + ' GROUP BY DT.IDDIRF, DT.CPFTITULAR, DT.NOME, DT.DATANASC, DT.ORDEMDEPEN, DT.DEPENDENCIA, ';
  sSQL := sSQL + '       DT.IDDEPENDENCIA, DT.CODNATUREZA                                                  ';
  sSQL := sSQL + ' ORDER BY CPFTITULAR, ORDEMDEPEN, CPFDEPEN, DATANASC                                     ';

  Result := GetDataPacket(sSQL);
end;

End.

