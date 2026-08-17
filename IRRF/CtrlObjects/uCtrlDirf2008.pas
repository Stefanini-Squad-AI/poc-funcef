Unit uCtrlDirf2008;
{ Alterações
{*******************************************************************************
Analista.: Wylliam Leite da Silva - SOL:246488 PPM:1026389
SOL......: 246488
PPM......: 1026389
Data.....: 18/08/2015
Rotina...: Rotina de Busca IRRF
Descrição: Correção do Valor Idoso.
*******************************************************************************
Analista.: Wylliam Leite da Silva - SOL:246299 PPM:1022706
SOL......: 246299
PPM......: 1022706
Data.....: 13/08/2015
Rotina...: Folha de Pagamento e Beneficios
Descrição: Adicionado a natureza de rendimento referente às linhas de informe de
           ação judicial '7416'
*******************************************************************************
Analista.: Wylliam Leite da Silva
SOL......: 246623
PPM......: 732617
Data.....: 31/03/2015
Rotina...: VerificaFimMolestia13Pagamento, OrderByPadrao,
           ValidaAcaoJudicialEDataFolhaPagamento, ValidaIdosoeAbono,
           TratarRotinasAbono, TrataAcertoAbonoFund,
           TrataAcertoAbonoFund_CalculaMolestiaGrave13Salario,
           TrataAcertoAbonoFund_Calcula13Salario
Descrição: COMPROVANTE 2014 AS PESSOAS QUE TIVERAM DATA FIM DA MOLESTIA ANTES DE
           NOVEMBRO OU DATA INICIO DEPOIS DE FEVEREIRO NÃO ESTÁ JOGANDO O 13º NA
           LINHA CORRETA. EX. 00136134807 (TEVE DATA FIM ANTES DE NOVEMBRO, LOGO
           TODO O 13º DEVERIA SAIR NA LINHA DE 13º POR MOLESTIA GRAVE.
*******************************************************************************
Analista.: Wylliam Leite da Silva
SOL......: 247702
PPM......: 732173
Data.....: 30/03/2015
Rotina...: ValidaAcaoJudicialEDataFolhaPagamento
Descrição: ERRO NA BUSCA Solicitamos verificar porque algumas pessoas, a busca
           do mês é realizada é somente algumas linhas não aparecem na busca.
           Ex. Informe 45- Rendimento INSS, dentre outros. Ex.: 015868140304
           (busca setembro) Fazer levantamento de todos os casos
*******************************************************************************
Analista.: marcio sanches spinosa SOL 244696 PPM 610842
SOL......: 244696
PPM......: 610842
Data.....: 16/12/2014
Rotina...: _Calcula13SalarioIdosoSemAcaoJudicial_
Descrição: Ajuste nas pessoas que encerraram o processo judicial e precisa devolver.
{*******************************************************************************
Analista.: marcio sanches spinosa SOL 244483 PPM 605995
SOL......: 244483
PPM......: 605995
Data.....: 11/12/2014
Rotina...: TrataIdosoAbono
Descrição: Ajuste na validação do 13 em Agosto.
{*******************************************************************************
Analista.: Marcio Sanches Spinosa SOL 239290 PPM 515062
SOL......: 239290
PPM......: 515062
Data.....: 08/10/2014
Rotina...: VerificaSituacaoProcesso
Descrição: Ajuste para a gravação do IDPROCJUD.
{*******************************************************************************
Analista.: Marcio Sanches Spinosa SOL 236012 PPM 446324
SOL......: 236012
PPM......: 446324
Data.....: 27/08/2014
Rotina...: TrataIdosoMensal
Descrição: Ajuste para lançamento do RRA.
{*******************************************************************************
Analista.: Marcio Sanches Spinosa SOL 235271 PPM 446324
SOL......: 235271
PPM......: 446324
Data.....: 22/07/2014
Rotina...: VerificaSituacaoProcessoEncerrado
Descrição: Ajuste no tratamento dos processos judiciais.
{*******************************************************************************
Analista.: Marcio Sanches Spinosa SOL 235686 PPM 459048
SOL......: 235686
PPM......: 459048
Data.....: 22/07/2014
Rotina...: TrataAcertoAbonoINSS
Descrição: Validação da fonte pagadora na ultima hipotese.
{*******************************************************************************
Analista.: Marcio Sanches Spinosa SOL 232181 PPM 386423
SOL......: 232181
PPM......: 386423
Data.....: 23/05/2014
Rotina...: VerificaSituacaoProcessoEncerrado
Descrição: Ajuste para verificar se o processo encerrado foi no ano de
lançamento da folha.
{*******************************************************************************
Analista.: Marcio Sanches Spinosa SOL 228926 PPM 358284
SOL......: 228926
PPM......: 358284
Data.....: 28/04/2014
Rotina...: TrataIdosoAbono
Descrição: Ajuste para tratamento do flag para idoso
{*******************************************************************************
Analista.: Marcio Sanches Spinosa SOL 229216 KINTANA 2063107
SOL......: 229216
Kintana..: 2063107
Data.....: 01/04/2014
Rotina...: TrataIdosoAbono
Descrição: Ajuste para tratamento do flag para idoso
{*******************************************************************************
Analista.: Marcio Sanches Spinosa SOL 227199 KINTANA 2061171
SOL......: 227199
Kintana..: 2061171
Data.....: 26/02/2014
Rotina...: TrataIdosoAbono
Descrição: Ajuste para tratamento do flag para idoso
{*******************************************************************************
Analista.: Marcio Sanches Spinosa SOL 225900 KINTANA 2059548
SOL......: 225900
Kintana..: 2059548
Data.....: 07/02/2014
Rotina...: TrataIdosoAbono
Descrição: Ajuste para quando encerrar a ação judicial, devolver o 167 e lançar 62
{*******************************************************************************
Analista.: Marcio Sanches Spinosa SOL 225765 KINTANA 2059367
SOL......: 225765
Kintana..: 2059367
Data.....: 05/02/2014
Rotina...: _Calcula13SalarioNaoIdosoComAcaoJudicial_
Descrição: Ajuste para quando encerrar a ação judicial, devolver o 167 e lançar 62
{*******************************************************************************
Analista.: Marcio Sanches Spinosa SOL 224376 KINTANA 2058123
SOL......: 224376
Kintana..: 2058123
Data.....: 23/01/2014
Rotina...: TrataAcertoAbonoFund_Calcula13Salario
Descrição: Ajuste no calculo do 13 de idoso, para verificar o desconto do valor total
{*******************************************************************************
Analista.: Thiago Melo
SOL......: 222748
Kintana..: 2056742
Data.....: 03/01/2014
Rotina...: FazUpdateHistRubSal, TrataIdosoMensal
Descrição: A busca não esta aplicando as regras de isenção por idade corretamente
{*******************************************************************************
Analista.: Marcio Sanches Spinosa SOL 222275 KINTANA 2055206
SOL......: 222275
Kintana..: 2055206
Data.....: 11/12/2013
Rotina...: TrataIdosoAbono
Descrição: Ajuste no desempenho da busca melhorando alguns selects
{*******************************************************************************
Analista.: Marcio Sanches Spinosa SOL 219023 KINTANA 2054837
SOL......: 219023
Kintana..: 2054837
Data.....: 09/12/2013
Rotina...: TrataIdosoAbono
Descrição: Criação da variavel Verifica62Folha13Salario para atendimento do sol
{*******************************************************************************
Analista.: Marcio Sanches Spinosa SOL 219474 KINTANA 2054063
SOL......: 219474
Kintana..: 2054063
Data.....: 26/11/2013
Rotina...: TrataIdosoAbono
Descrição: Ajuste na funcionalidade processo judicial inss
{*******************************************************************************
Analista.: Marcio Sanches Spinosa SOL 219219 KINTANA 2051170
SOL......: 219219
Kintana..: 2051170
Data.....: 25/11/2013
Rotina...: TrataIdosoAbono
Descrição: Ajuste na funcionalidade TrataIdosoAbono
{*******************************************************************************
Analista.: Marcio Sanches Spinosa SOL 219409 KINTANA 2052737
SOL......: 219409
Kintana..: 2052737
Data.....: 25/11/2013
Rotina...: _IsFolhaCalculoBUA
Descrição: Ajuste na validação da ação judicial.
{*******************************************************************************
Analista.: Edilaine Ferraresi
SOL......: 221561
Kintana..: 2054178
Data.....: 29/11/2013
Rotina...: GetQtdeMesesRRA
Descrição: Erro na busca do RRA
********************************************************************************
Analista.: Felipe A. Santos SOL 195438 KINTANA 1878097
SOL......: 195438
Kintana..: 1878097
Data.....: 01/10/2013
Rotina...: GetQtdeMesesRRA, GravarFontePagadora1, GravarFontePagadora2
Descrição: Gravação da quantidade de meses de RRA na lancIRRF
********************************************************************************
Analista.: Thiago Melo
SOL......: 219227
Kintana..: 20519253
Data.....: 07/11/2013
Rotina...: CalcularDadosIndividuais
Descrição: A rotina de 13º não esta considerando as as pessoas que possuem
           2 IDPESSOA e sao isentos em ambas...
********************************************************************************
Analista.: Marcio Sanches Spinosa SOL 218825 KINTANA 2050633
SOL......: 218825
Kintana..: 2050633
Data.....: 23/10/2013
Rotina...: TrataIdosoAbono, LocalizaNatureza
Descrição: Ajuste no codigo 45 para efetuar o lançamento
********************************************************************************
Analista.: Marcio Sanches Spinosa SOL 218897 KINTANA 2050606
SOL......: 218897
Kintana..: 2050606
Data.....: 17/10/2013
Rotina...: _AvaliaHistoricoMolestiagrave
Descrição: Ajuste na validação da molestia grave
********************************************************************************
Analista.: Marcio Sanches Spinosa SOL 218741 KINTANA 2050535
SOL......: 218741
Kintana..: 2050535
Data.....: 16/10/2013
Rotina...: TrataIdosoAbono
Descrição: Ajuste no codigo 61 para não deduzir valor do imposto abono
********************************************************************************
Analista.: Marcio Sanches Spinosa SOL 218322 KINTANA 2049567
SOL......: 218322
Kintana..: 2049567
Data.....: 10/10/2013
Rotina...: PreparaQuerysIndividual
Descrição: Ajuste no codigonatureza 3533 com fontepagadora 2
********************************************************************************
Analista.: Marcio Sanches Spinosa SOL 215733 KINTANA 2044850
SOL......: 215733
Kintana..: 2044850
Data.....: 04/09/2013
Rotina...: PreparaQuerysIndividual
Descrição: criação de uma const para sempre preencher a qrysalarioNormal
********************************************************************************
Analista.: Edilaine Ferraresi
SOL......: 211939
Kintana..: 2044010
Data.....: 27/08/2013
Rotina...: OrderByPadrao, GravarFontePagadora1, GravarFontePagadora2
Descrição: não está gravando idlancirrf correto na histrubsal quando tem pensao
           alimenticia para o mesmo cpf mas idpessoa diferente
********************************************************************************
Analista.: Edilaine
SOL......: 196824
Kintana..: 1884092
Data.....: 13/12/2012
Rotina...: BuscaLancamentos
Descrição: nao esta considerando ações judiciais
********************************************************************************
Analista.: Edilaine Ferraresi
SOL......: 212983
Kintana..: 212983
Data.....: 02/08/2013
Rotina...: OrderByPadrao, PreparaQuerysIndividual, _CalculoSalarioNormal_
Descrição: A busca esta duplicando os valores de 65 anos. Este problema ocorreu
           depois da criação das naturezas referente à IN 1343 (3540 e 3533)
********************************************************************************
Analista.: Marcio Sanches Spinosa SOL 207209 Kintana 2028864
SOL......: 207209
Kintana..: 2028864
Data.....: 03/07/2013
Descrição: Ajuste para não efetuar lançamento em dobro do valor para idinforme = 89
********************************************************************************
Analista.: Marcio Sanches Spinosa SOL 209527 Kintana 2021934
SOL......: 209527
Kintana..: 2021934
Data.....: 18/06/2013
Descrição: Ajuste no calculo para molestiagrave não isenta de IRRF
********************************************************************************
Analista.: Otacilio aquino
SOL......: 207809
Kintana..: 2007910
Data.....: 25/05/2013
Descrição: Ajuste na rotina de verificação Avalia Historico Molestia grave
********************************************************************************
Analista.: Edilaine Ferraresi SOL 201486 KINTANA 1948483
SOL......: 201486
Kintana..: 1948483
Data.....: 19/04/2013
Descrição: ajuste na rotina de busca de 13º no que diz respeito a Idade
********************************************************************************
Analista.: Edilaine Ferraresi
SOL......: 199978
Kintana..: 1925538
Data.....: 01/02/2013
Rotina...: CalcularDadosIndividuais, TrataAcertoAbonoINSS, _CalculoSalarioNormal_
           _VerificaEventosQuitacao13Salario_, TrataIdosoAbono
Descrição: ajustes para geração correta do informe de rendimentos
********************************************************************************
Analista.: Rodrigo de Brito Figueredo
SOL......: 200283
Kintana..: 1929907
Data.....: 05/02/2013
Rotina...: TrataIdosoMensal, _CalculaMesVersaoFolha13Sal_, VerificarInforme,
           ValidaDataFinalMolestiaEDataFolhaPagamento.
Descrição: destruidos componentes que estavam dentro de laço de repetição e que
		   anteriormente não eram destruidos.
********************************************************************************
Analista.: Edilaine Ferraresi
SOL......: 199086
Kintana..: 1915798
Data.....: 18/01/2013
Rotina...: TrataIdosoMensal
Descrição: Remover validação para salvar ou a fonte INSS ou a Funcef
********************************************************************************
Analista.: William Moreira da Silva
SOL......: 198432
Kintana..: 1910001
Data.....: 08/11/2012
Rotina...: TrataIdosoMensal
Descrição: Calculo entre as fontes (INSS e Funcef) sendo feita indevidamente.
********************************************************************************
Analista.: Higor Nayde Ferreira
SOL......: 198961
Kintana..: 1914051
Data.....: 17/01/2013
Rotina...: _CalculaMesVersaoFolha13Sal_
Descrição: verificar porque a busca não está gravando o IDHSTFOLHABENEF
//         referente ao rendimento 13º INSS do mês de dezembro/2012

********************************************************************************
Analista.: Higor Nayde Ferreira
SOL......: 198077
Kintana..: 1904811
Data.....: 10/01/2013
Rotina...: VerificarInforme
Descrição: correção de Informes para molestia grave
********************************************************************************
Analista.: William Moreira da Silva
SOL......: 198423
Kintana..: 1908786
Data.....: 08/11/2012
Rotina...: TrataIdosoMensal
Descrição: Calculo entre as fontes (INSS e Funcef) sendo feita indevidamente.
********************************************************************************
Analista.: Higor Nayde Ferreira
SOL......: 197522
Kintana..: 1897639
Data.....: 03/01/2013
Rotina...: VerificarInforme
Descrição: Validação para evitar a criação de duas linhas com IdInforme 91
********************************************************************************
********************************************************************************
Analista.: Otacilio aquino
SOL......: 191639
Kintana..: 1849849
Data.....: 08/11/2012
Rotina...: ValidaDataFinalMolestiaEDataFolhaPagamento
Descrição: Validação data molestia grave com o campo datapagamento
********************************************************************************
Analista.: Edilaine Ferraresi
SOL......: 190361
Kintana..: 1801585
Data.....: 19/09/2012
Rotina...: GravarFontePagadora1
Descrição: Quando a função SelecionarDadosFontePagadora retornar FALSE, não efetuar
           o AjustaCodigoNaturezas que mudará a fonte pagadora para 2
********************************************************************************
Analista.: Paulo Nobre / Fábio Sampaio
SOL......: 179500
Kintana..: 1654736
Data.....: 10/05/2012
Rotina...: TrataIdosoMensal
Descrição: Implementada nova condição que permita que a rotina de fazer a BUSCA
           considere o valor do rendimento FUNCEF sendo maior que o da dedução
           por idade (65 anos) e o que INSS seja DESCONSIDERADO quando utilizado
           como condição para trazer apenas valores maiores que 0, ou seja, pode
           ter qualquer valor
********************************************************************************
Analista.: Vinicius Eduardo Nascimento Maciel
SOL......: 168331
Kintana..: 1482898
Data.....: 05/01/2012
Rotina...: SelectPadrao, ProcurarParamIRRF
Descrição: Foi adicionado o filtro por ano Vigência na query para que as
           alterações na tabela informe tenham sentido.
********************************************************************************
Analista.: Arnaldo V. Scarin
Data.....: 13/12/2011
Kintana..: 1515234
Sol......: 169684
Descrição: Foi feita a correção na Rotina _DefinePropriedades_, para que não seja
           identificado como Idoso o Beneficiário que recebe pensão alimenticia
           alimentado recebe (IDInforme 97/98), e que a busca seja feita de forma
           correta
********************************************************************************
Analista.: Vinicius Eduardo Nascimento Maciel
Data.....: 24/08/2011
Kintana..: 1397058
Sol......: 163450
Descrição: A rotina ValidaAcaoJudicialEDataFolhaPagamento for alterada para que
           não retorne ações judicias perdidas em que a data de encerramento
           da ação judicial for menor  que a data de fechamento da folha.
********************************************************************************
Analista.: Helen V. Bianchi
Data.....: 28/07/2011
Kintana..: 1376019
Sol......: 162179
Descrição: A rotina CalcularDadosIndividuais() Estava travando a Busca para a
           Natureza: 0561  no registro 340 para a folha 8333.
********************************************************************************
Analista.: Arnaldo V. Scarin
Data.....: 10/05/2011
Kintana..: 1264451
Sol......: 155305/4701
Descrição: Correção do Select, para que a busca que for feita utilizando anos que
           não exista CPF cadastrado na HistRubSal, seja utilizado o CPF da tabela
           Pessoa.
********************************************************************************
Analista.: Helen V. Bianchi
Data.....: 20/04/2011
Kintana..: 1240208
Sol......: 156643/4541
Descrição: Funcao SelectPadrao Add: NVL(H.FLGMOLESTIAGRAVE,0) AS FLGMOLESTIAGRAVE
********************************************************************************
Analista.: Arnaldo V. Scarin
Data.....: 10/09/2010
Kintana..: 775063
Sol......: 133232
Descrição: Correção do Calculo de Ação Judicial para um CPF que possue 2 matrículas
********************************************************************************
Analista.: Bruno Bastos
Data.....: 11/07/2010
Kintana..: 852340
Sol......: 136825-1981
Descrição: Fechar a query
********************************************************************************
Analista.: Ricardo Alves
Data.....: 03/12/2009
Kintana..: 122239
Sol......: 599155
Descrição: Criação de bind variables em algumas queries para melhoria de performance.
********************************************************************************

Analista.: Arnaldo V. Scarin
Data.....: 22/09/2009
Kintana..: 636056
Sol......: 124712
Descrição: Correção da rotina de busca, que apresenta problemas quando é feita a
           busca para um único codigo de natureza (codIRRFDarf), e existem
           folhas diferentes.
********************************************************************************
Analista.: Ricardo Alves
Data.....: 05/08/2009
Kintana..: 122481
Sol......: 601965
Rotina...: CondicaoNaturezaEspecifica, GerarQueryOtimizada, GetViewNormal,
  GetView13Salario, GetView13SalarioMolestia, GetViewNormalMolestia
Descrição: Utilização de natureza específica.
********************************************************************************
}
{ Alterações
**********************************************************************
Analista.: Arnaldo V. Scarin
Data.....: 08/02/2009
Kintana..: 128371
Sol......: 686870
Descrição: Criação de Flag para calcular exclusivamente os beneficiários
           que tenham 13o.Salario Encerrado.
********************************************************************************
Analista.: Bruno Bastos
Kintana..: 598749
Sol......: 122341
Data.....: 22/07/2009
Rotina...: CalcularDadosIndividuais, _DefinePropriedades_
Descrição: Alteração para usar o campo idresponsavel no lugar de idpessoa na
           quebra do laço.
********************************************************************************
}

{
  CODDIRF
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
}

Interface

Uses Classes, Db, DbClient, SysUtils, contnrs, controls, adodb,
   UDiasUteis, umenserro, uSistema, uCmControlObject, uCmMath,
   uCtrLancIRRF, uCmDbObject, uDataBase, uCMTypes,
   DBaseDados, Forms, comCtrls, dbTables, Wwquery, uCmSqlParams, math, CMwwQuery;

//Marcio Sanches Spinosa SOL 215733 KINTANA 2044850 - Inicio
const
  carregaQueryIndividual65Anos = (' SELECT SUM(LI.VLRLANC) AS VLRBASE65 ' +
                                  ' FROM LANCXINFORME LI, LANCIRRF L ' +
                                  ' WHERE LI.IDLANCIRRF = L.IDLANCIRRF ' +
                                  '   AND LI.IDINFORME IN ( :pLinhaAbono1, :pLinhaAbono2 )' +
                                  '   AND TO_CHAR(L.DATAPAGAMENTO, ''YYYY/MM'') = :pData' +
                                  '   AND L.IDBENEFIRRF in (SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO = :CPF)') ;
  //Marcio Sanches Spinosa SOL 219023 KINTANA 2054837 - Inicio
  carregaQueryIndividual65Anos13 = (' SELECT SUM(LI.VLRLANC) AS VLRBASE65 ' +
                                  ' FROM LANCXINFORME LI, LANCIRRF L ' +
                                  ' WHERE LI.IDLANCIRRF = L.IDLANCIRRF ' +
                                  '   AND LI.IDINFORME IN ( :pLinhaAbono1, :pLinhaAbono2, :pLinhaAbono3 )' +
                                  '   AND TO_CHAR(L.DATAPAGAMENTO, ''YYYY'') = :pData' +
                                  '   AND L.DATAPAGAMENTO < :PDATA1 ' +
                                  '   AND L.IDBENEFIRRF in (SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO = :CPF) ') ;
  //Marcio Sanches Spinosa SOL 219023 KINTANA 2054837 - Fim
//Marcio Sanches Spinosa SOL 215733 KINTANA 2044850 - Fim

Const aProc2: Array[0..3] Of String = ('Normal', 'Molestia', '13o.Sal', '13o.SBE'); //Wylliam Leite da Silva - SOL:246488 PPM:1026389

Type

   //  tTipoDirf = ( tdNone, tdNormal, tdNormalMolestia, td13Salario, td13Molestia );
   tTipoDirf = (tdNone, tdNormal, tdNormalMolestia, td13Salario, td13SalBeneficioEncerrado);

   tProcessaDirfIndividual = Class;

   tNatureza = Class
   Public
      CodigoNatureza: String;
      rValBase: double;
      rValIRRF: double;
      rValBaseINSS: double;
      rValIRRFINSS: double;
      rTotRend1: Double;
      rTotRend2: Double;
      rTotRend3: Double; // Thiago Melo SOL 219219 Kintana 2051170
      rTotalRend13: Double;
      rTotalRend13A: Double;
      FlgPensaoAlim: String;
      FontePagadora: Integer;
   End;

   // Thiago Melo SOL 219219 Kintana 2051170
   TotRendaINSS = Record
     IdInforme : Integer;
     Valor : Double;
     Natureza : String;
   end;
   TListaTotRend = Array of TotRendaINSS;
   // Thiago Melo SOL 219219 Kintana 2051170

   tCodigosNatureza = Class
   Private
      FNaturezas: tList;
      Function GetNaturezas(Index: Integer): tNatureza;
      Procedure SetNaturezas(Index: Integer; Const Value: tNatureza);
   Public
      Constructor Create;
      Destructor Destroy; Override;
      Function Add: tNatureza;
      Function Adiciona(Const pCodigoNatureza: String;
         Const pFlgPensaoAlin: Integer;
         Const pFontePagadora: Integer): tNatureza;
      Function Count: Integer;
      Procedure Clear;
      Procedure Delete(Const pIndex: Integer);
      Function IndexOfNatureza(Const pCodigoNatureza: String; Const pFontePagadora: Integer): Integer;
      Function LocalizaNatureza(Const pTotRend1, pTotRend2, pTotRend3: Double): String; // Thiago Melo SOL 219219 Kintana 2051170
      Function LocalizaNaturezaAbono(Const pTotRend13, pTotRend13a: Double): String;
      Property Naturezas[Index: Integer]: tNatureza Read GetNaturezas Write SetNaturezas; Default;
   End;

   tLinhaInformeDirf = Class
   Public
      IdInforme: Integer; // idInforme
      idLancamento: Integer; // idLancIrrf
      PercLancamento: Double; // PERCLANC,
      ValorLancamentoSinal: Double; // VLRLANCSINAL,
      ValorLancamento: Double; // VLRLANC,
      FontePagadora: Integer; // FONTEPAGADORA
      CodigoNatureza: String; // Codigo na Natureza do Darf
      TipoRegistro: String; // FLGTIPOREG
      PensaoALimenticia: Integer;
      Constructor Create;
      Procedure AtualizarValores(Const pValor,
         pValorSinal: Double);
      Procedure InserirValores(Const pIdInforme: Integer;
         Const pValor,
         pValorSinal: Double;
         Const PFontePagadora: Integer;
         Const pCodigoNatureza: String;
         Const pPensaoAlimenticia: Integer;
         Const pFlagTipo: String = '');
   End;

   tLinhasInformeDirf = Class
   Protected
      FLinhas: tList;
      Function GetLinhas(Index: Integer): tLinhaInformeDirf;
      Procedure SetLinhas(Index: Integer; Const Value: tLinhaInformeDirf);
   Public
      Constructor Create;
      Destructor Destroy; Override;
      Function Add: tLinhaInformeDirf;
      Function AdicionarValores(Const pIdInforme: Integer;
         Const pValor,
         pValorSinal: Double;
         Const pFontePagadora: Integer;
         Const pCodigoNatureza: String;
         Const pPensaoAlimenticia: Integer;
         Const pFlagTipo: String = ''): tLinhaInformeDirf;
      Function Count: Integer;
      Procedure Clear;
      Procedure Delete(Const pIndex: Integer);
      Function IndexOfLinha(Const pIdInforme: Integer): Integer; Overload;
      Function IndexOfLinha(Const pIdInforme, pFontePagadora: Integer;
         Const pCodigoNatureza: String): Integer; Overload;

      Property Linhas[Index: Integer]: tLinhaInformeDirf Read GetLinhas Write SetLinhas; Default;
   End;

   tProcessaDirf = Class(tCmControlObject)
   Protected
      fDataIni,
         fDataFim: tDateTime;
      fTipo: tTipoDirf;
      fPessoas: tStringList;
      fView: String;
      FItens: tList;
      LancIRRF: TCtrLancIRRF;

      Function GetItens(Index: Integer): tProcessaDirfIndividual;
      Procedure SetItens(Index: Integer; Const Value: tProcessaDirfIndividual);

      Function GetView(Const pIndividuo: Boolean = false): String;
      Function GetViewNormal(Const pIndividuo: Boolean = false): String;
      Function GetViewNormalMolestia(Const pIndividuo: Boolean = false): String;
      Function GetView13Salario(Const pIndividuo: Boolean = false): String;
      Function GetView13SalarioMolestia(Const pIndividuo: Boolean = false): String;

      Function AdicionarFiltroData(Const pIndividuo: Boolean = false): String;
      Function AdicionarFiltroFolhaBeneficio: String;
      Function AdicionarFiltroPessoas: String;
      Function AdicionarFiltroIndividuo(): String;
      Function CondicaoCom13Salario: String;
      Function CondicaoSem13Salario: String;
      Function CondicaoComMolestiaGrave: String;
      Function CondicaoSemMolestiaGrave: String;

      // Ricardo A. SOL 122481 KTN 601965
      Function CondicaoNaturezaEspecifica: String;

      Function SelectPadrao(Const pIndividuo: Boolean): String;
      Function GroupByPadrao(Const pIndividuo: Boolean): String;
      Function OrderByPadrao: String;

      Procedure CriarDirfIndividual;

      Function GerarQuery: Boolean;
      Function GerarQueryOtimizada: Boolean;
      Function CriarQueryIndividual: Boolean;
      Function CarregarDadosDirf: Boolean;
      Function GerarInformacoesAuxiliares: Boolean;
      Function ConverteListaPessoas: String;

      Procedure BuscaParametros(Const iEmpresa: Integer);
      Procedure ProcurarParamIRRF(Const iEmpresa: integer);
      Procedure AtualizaParamHist(Const piIdVersao: Integer);

      Procedure DoChangeDataBase; Override;
      Procedure AfterInitialize; Override;

      // Ricardo A. SOL 122339 KTN 599155
      Procedure PreparaQuerysIndividual;
      // FIM SOL 122339

   Private
      qryDados: TQuery;

      sqlDadosIndividuais: TCMSqlParams;
      qryDadosAuxiliares: TClientDataSet;
      qryDadosIndividuais: TClientDataset;

      qryAuxiliar,
         qryInformeDePara,
         qryParamIRRF,
         qryParamFolha,
         qryRubricas: TClientDataSet;
      qryProvDesc: TClientDataSet;
      lstRubricaEspecial: tStringList;

      qryQtdMesesRRA : TClientDataSet; // Felipe A. Santos SOL 195438 KINTANA 1878097

      // Ricardo A. SOL 122339 KTN 599155
      qryVerificaExistenciaAcaoJudicial: TCMwwQuery;
      qryVerificaRegraIT: TCMwwQuery;
      qrySalarioNormal: TCMwwQuery;
      qrySalarioNormal2: TCMwwQuery;
      qryHistoricoMolestiaGrave: TCMwwQuery;
      // FIM SOL 122339

      bFaltaParmMolestia: Boolean;
      bFaltaParmMais65: Boolean;
      bFaltaPrograma: Boolean;
      bProcessa: Boolean;
      b65acumprimvez: Boolean;
      b65acumprimvezabono: Boolean;

      iLinhaDedDepAbono: Integer;
      iLinhaDedDepAbonoMol: Integer;
      iIdPrograma: Integer;

      iIdMolestiagrave: Integer;
      iIdAbonoMolestiaGrave : integer;//Wylliam Silva SOL 246623 PPM 732617
      iIdMolestiagraveINSS: Integer;

      iLinhaRendAcJud: Integer;
      iLinhaRendAcJud13: Integer;
      iLinhaAcima65: Integer;
      iLinhaAcima65INSS: Integer;
      iLinhaAbonoAcima65: Integer;
      iLinhaAbonoAcima65INSS: Integer;
      iLinhaExigibilidadeSuspensa: Integer;
      iLinhaAcaoJudicialInss: Integer;
      iLinhaAcaoJudicialInss13: Integer;
      iRegraInss: Integer;
      CodigoCentroCusto: String;
      iErrados: Integer;
      iGravados: Integer;
      FisCpf: Boolean;
      fCPFInicial: Integer;
      fCPF :String; // higor Nayde Ferreira SOL - 197522 KTN - 1897639
      fCPFFinal: Integer;
      FUsarAnoTodo13Sal: Boolean;

      // Ricardo A. SOL 122481 KTN 601965
      FUtilizaNaturezaEspecifica: Boolean;
      FIdNaturezaEspecifica: String;
      Function GetAno: String;
   Public

      Empresa: Integer;
      UsaPlanoPatro: Boolean;
      BuscaProvDesc: Boolean;
      CodigoRubricas: String;
      Versao: Integer;
      iQtdDecVlrIdosoFixo: Integer; //Wylliam Leite da Silva - SOL:246488 PPM:1026389
      sIDPESSOA: String; //Wylliam Leite da Silva - SOL:246488 PPM:1026389

      { Propriedades }
      Property TipoDirf: tTipoDirf Read fTipo Write fTipo;
      Property DataInicial: tDateTime Read fDataIni Write fDataIni;
      Property DataFinal: tDateTime Read fDataFim Write fDataFim;
      Property Pessoas: tStringList Read fPessoas Write fPessoas;
      Property IsCPF: Boolean Read FIsCpf Write FisCpf;
      Property View: String Read fView Write fView;
      Property Itens[Index: Integer]: tProcessaDirfIndividual Read GetItens Write SetItens; Default;
      Property CPFInicial: Integer Read fCPFInicial Write fCPFInicial;
      Property CPFFinal: Integer Read fCPFFinal Write fCPFFinal;
      Property UsarAnoTodo13Sal: Boolean Read FUsarAnoTodo13Sal Write FUsarAnoTodo13Sal;

      Property cpf : String Read fCPF Write fCPF;// higor Nayde Ferreira SOL - 197522 KTN - 1897639

      Property Ano: String Read GetAno;

      // Ricardo A. SOL 122481 KTN 601965
      Property IDNaturezaEspecifica: String Read FIdNaturezaEspecifica Write FIdNaturezaEspecifica;
      Property UtilizaNaturezaEspecifica: Boolean Read FUtilizaNaturezaEspecifica Write FUtilizaNaturezaEspecifica;

      { Métodos }
      Constructor Create; Override;
      Destructor Destroy; Override;
      Function Add(Const pCodigoPessoa, pNomePessoa: String): tProcessaDirfIndividual;
      Function Count: Integer;
      Procedure Clear;
      Procedure Delete(Const pIndex: Integer);
      Function IndexOfCodigo(Const pCodigoPessoa: String): Integer;
      procedure ExecutarDirf(var prQtdDecVlrIdosoFixo: Integer; var prIDPESSOA: String); //Wylliam Leite da Silva - SOL:246488 PPM:1026389
      Function ProcessarDadosDirf: boolean;
      Function GetQtdeProcessados: Integer;
      Function GetQtdeErrados: Integer;
      Function GetQtdeTotal: Integer;
      Function GetQtdeMesesRRA : integer; // Felipe A. Santos SOL 195438 KINTANA 1878097


   End;

   tProcessaDirfIndividual = Class
   Protected
      { Variáveis }
      FLinhas: tLinhasInformeDirf;
      FLinhasAbono: tLinhasInformeDirf;
      FCodigoNaturezas: tCodigosNatureza;

      // Thiago Melo SOL 219219 Kintana 2051170
      FListaTotRend : TListaTotRend;
      possuiMaisDeUmaNaturazaINSS : Boolean;
      // Thiago Melo SOL 219219 Kintana 2051170

      { Métodos }
      // Rotinas de Gravação dos dados na Base de Dados da Dirf
      Function GravarDados(Const sPeriodo: String;
         Const bGravarSeparado: Boolean): Boolean;
      Function GravarFontePagadora1(Const sPeriodo: String;
         Const bGravarSeparado: Boolean): Boolean;
      Function GravarFontePagadora2(Const sPeriodo: String;
         Const bGravarSeparado: Boolean): Boolean;
      Function SelecionarDadosFontePagadora(Const oCds: TClientDataSet;
         Const iFontePagadora: Integer;
         Const sCodigoNatureza: String;
         Const iFlgGravaPensaoAlim: Integer): Boolean;

      Procedure AcertaFlgPensaoAlim(Const iCount,
         iFontePagadora,
         iFlgPensaoAlim: integer;
         Var rBase,
         rIRRF: Double);
      Function FazUpdateHistRubSal(Const iLancamento: Double;
         Const iFontePagadora: Integer;
         Const sCodigoNatureza,
         sPeriodo: String;
         Const sFlgPensaoAlim: String): Boolean;
   Private
      // Referencia da Classe Ancestral (Classe Pai)
      bTem2IdPessoaeAcao: Boolean;
      bTem2IdPessoaePALinha97: Boolean;
      bTemUmaUnicaPessoa: Boolean;
      Pai: tProcessaDirf;
      iAno: Word;
      // Variaveis utilizadas na classe
      IdPessoa: Integer;
      IdTitular: Integer;
      Nome: String;
      IdPlanoPrev: Integer;
      IdPlanoPrevidenc: Integer;
      IdPatro: Integer;
      IdFoBenef: Integer;
      IdMotivo: Integer;
      IdModulo: Integer;
      IdPlanoContab: Integer;
      FlgPensaoAlim: Integer;
      BaseSeparada: Boolean;
      Idoso: Boolean;
      MolestiaGrave: Boolean;
      IsentoIRRF: Boolean;
      Tem13oSalario: Boolean;
      TemAcaoJudicial: Boolean;
      TemAcaoJudicialINSS: Boolean;
      VerificaMesesIdade65 : integer;//Marcio Sanches Spinosa SOL 228926 PPM 358284
      pDataFimProcJud      : TDateTime;//Marcio Sanches Spinosa SOL 223865 KINTANA 2058724
      PidPessoaProc        : Integer;  //Marcio Sanches Spinosa SOL 235271 PPM 446324
      pIprocjud167         : Integer;//Marcio Sanches Spinosa SOL 225765 KINTANA 2059367
      pVerificaLancD       : Boolean; //Marcio Sanches Spinosa SOL 229216 KINTANA 2063107
      Verifica62Folha13Salario : Boolean;//Marcio Sanches Spinosa SOL 219023 KINTANA 2054837
      Verifica61Folha13Salario : Boolean;////Marcio Sanches Spinosa SOL 225900 KINTANA 2059548
      PercAcaoJudicial: Double;

      iLinhaAbonoOrigFund: Integer;
      iLinhaAbonoOrigINSS: Integer;
      iLinhaInformeOrig: Integer;

      iIdProcJudFund: Integer;
      iIdProcJudINSS: Integer;
      iIdPessoaProcJud: Integer;
      iLinhaRend: Integer;
      iLinhaRendINSS: Integer;
      iLinhaRend13: Integer;
      iLinhaRend13INSS: Integer;
      iVersaoFolha: Integer;
      iVersaoFolha08 : Integer;
      iQtdMeses: integer; // Felipe A. Santos SOL 195438 KINTANA 1878097
      iLinhaRRA : Integer;  // Thiago Melo SOL 219219 Kintana 2051170
      ValorIdosoFixo: Double;
      ValorIdoso: Double;
      ValorIdoso13: Double;

      rValBase: double;
      rValIRRF: double;
      rValBaseINSS: double;
      rValIRRFINSS: double;

      rTotRend1: Double;
      rTotRend2: Double;
      rTotRend3: Double; // Thiago Melo SOL 219219 Kintana 2051170
      rTotRend131: Double;
      rTotRend132: Double;
      rTotRend131A: Double;
      rTotRend132A: Double;

      rValorIdosoacum: Double;
      rValorIdoso13acum: Double;

      DataEfetivacao: String;
      CodigoNatureza: String;
      CodigoCentroCusto: String;
      CodigoCentroRespon: String;
      CodigoTipoRecDes: String;
      PlanoContaCredito: String;
      ListaIdMotivoAtuHist: String;
      ListaIdPlanoPrev: String;
      ListaIdPessoa: String;
      ListaIdHstFolha: String;
      ExisteEventoQuitacao: Boolean;
      ExisteRegraIT: Boolean;
      Existe141 : Boolean;
      TratamentoIdosoAbono: Boolean; //Wylliam Leite da Silva - SOL:246488 PPM:1026389
      VerificaIdosoAbonoINSS: Boolean; //Wylliam Leite da Silva - SOL:246488 PPM:1026389
      iQtdDecVlrIdosoFixo: Integer; //Wylliam Leite da Silva - SOL:246488 PPM:1026389
      sIDPESSOA: String; //Wylliam Leite da Silva - SOL:246488 PPM:1026389
      valor13acumNovo: Double; //Wylliam Leite da Silva - SOL:246488 PPM:1026389
      { Propriedades }
      Property Linhas: tLinhasInformeDirf Read fLinhas;
      Property LinhasAbono: tLinhasInformeDirf Read fLinhasAbono;
      Property CodigoNaturezas: tCodigosNatureza Read FCodigoNaturezas;
      Property ListaTotRend : TListaTotRend read FListaTotRend write FListaTotRend; // Thiago Melo SOL 219219 Kintana 2051170

      { metódos }
  //    function  ValidaRubricas()           : Boolean;
      Function ValidaRubricaIndividual(): Boolean;
      Function CarregarDadosIndividuais(): Boolean;
      Function CalcularDadosIndividuais(TipoDirf: tTipoDirf): Boolean;

      // Rotinas auxiliares de Processamento //
      Procedure TratarRotinasAbono();
      Procedure TrataIdosoMensal(Const bPodeCalcular: Boolean);
      function TrataIdosoAbono(Const bPodeCalcular: Boolean; TipoDirf: tTipoDirf): Integer; //Wylliam Leite da Silva - SOL:246488 PPM:1026389
      Procedure TrataAcertoAbonoFund();
      Procedure TrataAcertoAbonoFund_Calcula13Salario();
      Procedure TrataAcertoAbonoFund_CalculaMolestiaGrave13Salario();
      Procedure TrataAcertoAbonoINSS();
      Procedure TrataDeducaoDepAbono();
      Function BuscaLinhasAbono: Boolean;
      Function CarregarDadosGravacaoAbono(poQry: TClientDataSet): Boolean;
      //    function  ValidaExigibilidadeSuspensa() : boolean;
      Procedure Clear;
      Function LocalizaDataEfetivacao(Const iVersao: Integer): String;
      Function RetornaVersaoFolhaParaGravacao: Integer;
      Procedure AdicionaDadosClientDataSets(Const oQry: TCmSqlParams;
         Const oClient: TClientDataSet);
      Function VerificaExistenciaAcaoJudicialGravarSeparado(Const lstIdPessoa: TStringList): Boolean;
      Function ValidaIdosoeAbono(Const bPodeCalcular: Boolean; TipoDirf: tTipoDirf): Boolean;
      Function VerificaExistenciaLinha97PensaoAlimenticia: Boolean;
      Function ValidaDataFinalMolestiaEDataFolhaPagamento: Boolean;
      Function VerificaExistenciaLinha97UmaPessoa: Boolean;
      Procedure MudaLinhaDependente(Const pIdPessoaAcao, pIdPessoaNovo: Integer);
      Function ValidaAcaoJudicialEDataFolhaPagamento(pIdProcJud: Integer): Boolean;
      function iif(c: boolean; a, b: integer): integer; overload;  //
      function iif(c: boolean; a, b: string): string; overload;  //

      //    procedure InsereLinhasClientDataSet(const oCds: TClientDataSet;
      //                                        const oClient : TClientDataSet);


      // Thiago Melo SOL 219219 Kintana 2051170
      procedure organizaValoresTotIRRF;
      function SomaValoresTotInforme(_idInforme : Integer) : Double;
      function SomaValoresTotNatureza(_natureza : String) : Double;
      procedure verificaQtdFontePagadoraINSS;
      procedure VerificaSituacaoProcessoEncerrado(pIdPessoa : integer);//Marcio Sanches Spinosa SOL 235271 PPM 446324
      procedure VerificaFimMolestia13Pagamento(pDataFimMolestia : TDateTime; pCPF : String);
      procedure verificaPagamento13Anterior;
      // Thiago Melo SOL 219219 Kintana 2051170

      function VerificaQtdLinhas123(prLinhaAbono1: Integer; prDataPagamento: String; prAno: TDateTime; prCPF: String): Integer;
   Public
      CodigoPessoa: String;
      { Métodos }
      Constructor Create(Const AOnwer: tProcessaDirf;
         Const CodPessoa: String);
      Destructor Destroy; Override;

      Function Processar(var prQtdVlrIdosoFixo: Integer; var prIDPESSOA: String; TipoDirf: tTipoDirf): Boolean; //Wylliam Leite da Silva - SOL:246488 PPM:1026389
   End;

   //----------------------------------------------------------------------------//
   //                                                                            //
   //            Métodos para Visualização do Contador de processo               //
   //                                                                            //
   //----------------------------------------------------------------------------//
Procedure InicializaFormulario(Const pIncluiLinha: Boolean = False);
Procedure MostraMensagem(Const psTexto: String;
   Const pIncluiLinha: Boolean = False);
Procedure MostraMensagemComLinha(Const psTexto: String);
Procedure IncrementaPasso(Const pPosicao, pQuantidade: Integer);
Procedure Linha();
Procedure LimpaBarraStatus();

Implementation

Uses FGeraFolhaMT;

//----------------------------------------------------------------------------//
//                                                                            //
//            Métodos para Visualização do Contador de processo               //
//                                                                            //
//----------------------------------------------------------------------------//

Procedure InicializaFormulario(Const pIncluiLinha: Boolean);
Begin
   With frmGeraFolhaMT Do
      Begin
         memResult.Text := '';
         repaint;
         Invalidate;
      End;
   If pIncluiLinha Then
      Linha();
End;

Procedure MostraMensagem(Const psTexto: String; Const pIncluiLinha: Boolean);
Begin
   frmGeraFolhaMT.memResult.Lines.Add(psTexto);
   If pIncluiLinha Then
      Linha();
   frmGeraFolhaMT.Repaint;
   application.processmessages;
End;

Procedure Linha;
Begin
   MostraMensagem('--------------------------------------------------------------------------------');
End;

Procedure MostraMensagemComLinha(Const psTexto: String);
Begin
   MostraMensagem(psTexto, true);
End;

Procedure LimpaBarraStatus();
Begin
   FrmGeraFolhaMt.lblcontagem.caption := '';
End;

Procedure IncrementaPasso(Const pPosicao, pQuantidade: integer);
Begin
   FrmGeraFolhaMt.lblcontagem.caption := Format('Processando %d de %d', [pPosicao, pQuantidade]);
End;

//----------------------------------------------------------------------------//
//                                                                            //
//                            { tLinhaInformeDirf }                           //
//                                                                            //
//----------------------------------------------------------------------------//

Procedure tLinhaInformeDirf.AtualizarValores(Const pValor,
   pValorSinal: Double);
Begin
   ValorLancamento := ValorLancamento + pValor;
   ValorLancamentoSinal := ValorLancamentoSinal + pValorSinal;
End;

Constructor tLinhaInformeDirf.Create;
Begin
   IdInforme := -1; // Inicializado com -1 p/indicar que não tem id
   idLancamento := -1; // Inicializado com -1 p/indicar que não tem id
   PercLancamento := 0.00; // PERCLANC,
   ValorLancamentoSinal := 0.00; // VLRLANCSINAL,
   ValorLancamento := 0.00; // VLRLANC
   FontePagadora := 0; // FONTEPAGADORA
   TipoRegistro := ''; // FLGTIPOREG
   PensaoAlimenticia := -1; // FLGPensaoAlim
End;

Procedure tLinhaInformeDirf.InserirValores(Const pIdInforme: Integer;
   Const pValor,
   pValorSinal: Double;
   Const PFontePagadora: Integer;
   Const pCodigoNatureza: String;
   Const pPensaoAlimenticia: Integer;
   Const pFlagTipo: String = '');
Begin
   IdInforme := pIdInforme;
   ValorLancamento := pValor;
   ValorLancamentoSinal := pValorSinal;
   FontePagadora := pFontePagadora;
   CodigoNatureza := pCodigoNatureza;
   TipoRegistro := pFlagTipo;
   PensaoALimenticia := pPensaoAlimenticia;
End;

//----------------------------------------------------------------------------//
//                                                                            //
//                           { tLinhasInformeDirf }                           //
//                                                                            //
//----------------------------------------------------------------------------//

Function tLinhasInformeDirf.Add: tLinhaInformeDirf;
Begin
   Result := tLinhaInformeDirf.Create;
   FLinhas.Add(Result);
End;

Function tLinhasInformeDirf.AdicionarValores(Const pIdInforme: Integer;
   Const pValor,
   pValorSinal: Double;
   Const pFontePagadora: Integer;
   Const pCodigoNatureza: String;
   Const pPensaoAlimenticia: Integer;
   Const pFlagTipo: String = ''): tLinhaInformeDirf;
Begin
   Result := Add;
   Result.InserirValores(pIdInforme,
      pValor,
      pValorSinal,
      pFontePagadora,
      pCodigoNatureza,
      pPensaoAlimenticia,
      pFlagTipo);
End;

Procedure tLinhasInformeDirf.Clear;
Begin
   While Count > 0 Do
      Delete(0);
   FLinhas.Clear;
End;

Function tLinhasInformeDirf.Count: Integer;
Begin
   Result := FLinhas.Count;
End;

Constructor tLinhasInformeDirf.Create;
Begin
   Inherited;
   FLinhas := TList.Create;
   FLinhas.Clear;
End;

Procedure tLinhasInformeDirf.Delete(Const pIndex: Integer);
Begin
   tLinhaInformeDirf(FLinhas[pIndex]).Free;
   FLinhas.Delete(pIndex);
End;

Destructor tLinhasInformeDirf.Destroy;
Begin
   Inherited;
   Clear;
   FreeAndNil(FLinhas);
End;

Function tLinhasInformeDirf.GetLinhas(Index: Integer): tLinhaInformeDirf;
Begin
   Result := tLinhaInformeDirf(fLinhas[Index]);
End;

Function tLinhasInformeDirf.IndexOfLinha(Const pIdInforme: Integer): Integer;
Var i: integer;
Begin
   result := -1;
   For i := 0 To Count - 1 Do
      Begin
         If (TLinhaInformeDirf(FLinhas[i]).IdInforme = pIdInforme) Then
            Begin
               result := i;
               break;
            End;
      End;
End;

Function tLinhasInformeDirf.IndexOfLinha(Const pIdInforme, pFontePagadora: Integer;
   Const pCodigoNatureza: String): Integer;
Var i: integer;
   Linha: tLinhaInformeDirf;
Begin
   result := -1;
   For i := 0 To Count - 1 Do
      Begin
         Linha := TLinhaInformeDirf(FLinhas[i]);
         If (Linha.IdInforme = pIdInforme) And
            (Linha.FontePagadora = pFontePagadora) And
            (Linha.CodigoNatureza = pCodigoNatureza) Then
            Begin
               result := i;
               break;
            End;
      End;
End;

Procedure tLinhasInformeDirf.SetLinhas(Index: Integer; Const Value: tLinhaInformeDirf);
Begin
   fLinhas[Index] := Value;
End;

//----------------------------------------------------------------------------//
//                                                                            //
//                             { tProcessaDirf }                              //
//                                                                            //
//----------------------------------------------------------------------------//

Function tProcessaDirf.Add(Const pCodigoPessoa, pNomePessoa: String): tProcessaDirfIndividual;
Begin
   Result := tProcessaDirfIndividual.Create(Self, pCodigoPessoa);
   Result.Nome := pNomePessoa;
   fItens.Add(Result);
End;

Procedure tProcessaDirf.Clear;
Begin
   While Count > 0 Do
      Delete(0);
   FItens.Clear;
End;

Function tProcessaDirf.Count: Integer;
Begin
   result := fItens.Count;
End;

Function tProcessaDirf.GetView(Const pIndividuo: Boolean): String;
Begin
   Case TipoDirf Of
      tdNormal: Result := GetViewNormal(pIndividuo);
      tdNormalMolestia: Result := GetViewNormalMolestia(pIndividuo);
      //    td13Salario      : Result := GetView13Salario();
      //    td13Molestia     : Result := GetView13SalarioMolestia();
   End;
   Result := '(' + Result + ')';
End;

Function tProcessaDirf.AdicionarFiltroData(Const pIndividuo: Boolean): String;
Begin
   If (TipoDirf In [td13Salario, td13SalBeneficioEncerrado]) And pIndividuo
   and (FormatDateTime('MM', DataInicial) <> '08')  Then  //Marcio Sanches Spinosa SOL 229216 KINTANA 2063107
      Result :=
         '  and H.DataPagamento >= To_date(' + QuotedStr(FormatDateTime('01/01/yyyy', DataInicial)) + ',''dd/mm/yyyy'')' + #13#10 +
         '  and H.DataPagamento <= To_date(' + QuotedStr(FormatDateTime('31/12/yyyy', DataFinal)) + ',''dd/mm/yyyy'')' + #13#10
   Else
      Result :=
         '  and H.DataPagamento >= To_date(' + QuotedStr(FormatDateTime('dd/mm/yyyy', DataInicial)) + ',''dd/mm/yyyy'')' + #13#10 +
         '  and H.DataPagamento <= To_date(' + QuotedStr(FormatDateTime('dd/mm/yyyy', DataFinal)) + ',''dd/mm/yyyy'')' + #13#10;
   //  Result := '  and H.DataPagamento >= To_date(:DataInicial,''dd/mm/yyyy'')'+#13#10+
   //            '  and H.DataPagamento <= To_date(:DataFinal,''dd/mm/yyyy'')'+#13#10;
End;

Function tProcessaDirf.AdicionarFiltroFolhaBeneficio: String;
Begin
   //If Not (TipoDirf In [td13Salario, td13SalBeneficioEncerrado]) And (Versao <> -1) Then    // Edilaine - SOL 199086 / KTN 1915798 - comentado
   If {Not (TipoDirf In [td13Salario, td13SalBeneficioEncerrado]) And} (Versao <> -1) Then    // Edilaine - SOL 199086 / KTN 1915798
      Result := '  AND (H.IDHSTFOLHABENEF = ' + IntToStr(Versao) + ')' + #13#10;
   //    Result := '  AND (H.IDHSTFOLHABENEF = :VersaoFolha)'+#13#10;
End;

Function tProcessaDirf.AdicionarFiltroPessoas: String;
Begin
   If Pessoas.Count > 0 Then
      Begin
         If IsCPf Then
            Begin
               // Alterado por Arnaldo V. Scarin em 10/05/2011 - SOL: 155305/4701 Kintana: 1264451
               If Ano < '2009' Then
                  Result := '  AND (NVL(H.NUMDOCUMENTO,PE.NUMDOCUMENTO) IN ' + ConverteListaPessoas() + ')' + #13#10
               Else
                  Result := '  AND (H.NUMDOCUMENTO IN ' + ConverteListaPessoas() + ')' + #13#10;
            End
         Else
            Begin
               // Alterado por Arnaldo V. Scarin em 10/05/2011 - SOL: 155305/4701 Kintana: 1264451
               If Ano < '2009' Then
                  Result := '  AND (NVL(H.NUMDOCUMENTO,PE.NUMDOCUMENTO) IN (SELECT NUMDOCUMENTO FROM PESSOA' + #13#10 +
                     '                          WHERE IDPESSOA IN ' + ConverteListaPessoas() + '))' + #13#10
               Else
                  Result := '  AND (H.NUMDOCUMENTO IN (SELECT NUMDOCUMENTO FROM PESSOA' + #13#10 +
                     '                          WHERE IDPESSOA IN ' + ConverteListaPessoas() + '))' + #13#10;

            End;
      End;
End;

Function tProcessaDirf.AdicionarFiltroIndividuo(): String;
//var i : Integer;
Begin
   // Alterado por Arnaldo V. Scarin em 10/05/2011 - SOL: 155305/4701 Kintana: 1264451
   If Ano < '2009' Then
      Result := '  and NVL(H.NUMDOCUMENTO,PE.NUMDOCUMENTO) = :NumDocumento' + #13#10
   Else
      Result := '  and H.NUMDOCUMENTO = :NumDocumento' + #13#10
End;

Function tProcessaDirf.SelectPadrao(Const pIndividuo: Boolean): String;
Begin
   Result :=
      'SELECT ' + #13#10 +
      '     ABS(SUM(DECODE(H.VALORPROVENTO, 0, DECODE(H.FLGDESCONTO, 2, H.VALORINFO, H.VALORPROVENTO), H.VALORPROVENTO) * DECODE(PD.FLGDESCONTO, 1, -1, 1))) AS VALOR,' + #13#10 +
      '     SUM(DECODE(H.VALORPROVENTO, 0, DECODE(H.FLGDESCONTO, 2, H.VALORINFO, H.VALORPROVENTO), H.VALORPROVENTO) * ' + #13#10 +
      '         DECODE(I.CODDIRF, 22,  DECODE(PD.FLGDESCONTO, 0, 1, -1), 16, DECODE(PD.FLGDESCONTO, 0, 1, -1), 23, DECODE(PD.FLGDESCONTO, 0, 1, -1), 24,' + #13#10 +
      '         DECODE(PD.FLGDESCONTO, 0, 1, -1), 25, DECODE(PD.FLGDESCONTO, 0, 1, -1), DECODE(PD.FLGDESCONTO, 1, -1, 1))) AS VALORSINAL,' + #13#10 +
      '     H.IDINFORME,' + #13#10 +
      '     H.IDPESSOA,' + #13#10 +
      '     H.IDTITULAR,' + #13#10;
   // Alterado por Arnaldo V. Scarin em 10/05/2011 - SOL: 155305/4701 Kintana: 1264451
   If Ano < '2009' Then
      Result := Result + '     NVL(H.NUMDOCUMENTO,PE.NUMDOCUMENTO) AS CPFCNPJ,' + #13#10
   Else
      Result := Result + '     H.NUMDOCUMENTO AS CPFCNPJ,' + #13#10;

   Result := Result +
      '     PE.NOME AS NOME,' + #13#10 +
      '     H.IDRESPONSAVEL,' + #13#10 +
      '     NVL(PF.FLGMOLESTIAGRAVE,-1) PESSOA_FLGMOLESTIAGRAVE,' + #13#10 +
      '     PF.DATAMOLESTIAGRAVE,' + #13#10 +
      '     PF.DATAFIMMOLESTIA,' + #13#10 +
      '     PF.DATANASC,' + #13#10 +
      '     H.FLGISENTOIRRF,' + #13#10 +
      '     PF.FLGSOMAIRSUPINSS,' + #13#10 +
      '     H.FONTEPAGADORA,' + #13#10 +
      '     H.IDHSTFOLHABENEF,' + #13#10 +
      '     H.IDMOTIVO,' + #13#10 +
      '     H.IDPATRO AS IDPESSJUR,' + #13#10 +
      '     H.IDPATRO,' + #13#10 +
      '     H.DATAPAGAMENTO,' + #13#10 +
      '     I.FLGIRRF,' + #13#10 +
      '     I.FLGBASE,' + #13#10 +
      '     I.CODDIRF,' + #13#10 +
      '     P.NUMDOCUMENTO,' + #13#10 +
      '     H.CODIRRFDARF,' + #13#10 +
      '     NVL(H.IDPLANOCONTABIL, H.IDPLANOPREV) AS IDPLANOPREV,' + #13#10 +
      '     H.IDPLANOPREV AS IDPLANOPREVIDENCIARIO,' + #13#10 +
      '     H.IDMODULO,' + #13#10 +
      '     NVL(H.FLGMOLESTIAGRAVE,0) AS FLGMOLESTIAGRAVE ,' + #13#10 +
      '     PD.CODPROVDESC,' + #13#10 +
      '     PD.IDPROVENTO,' + #13#10 +
      '     H.VALORINFO,' + #13#10 +
      '     DECODE(PD.FLGDESCONTO, 0, NVL(H.PLACONTAD, RX.PLACONTAD), NVL(H.PLACONTAC, RX.PLACONTAC)) AS PLACONTAC,' + #13#10 +
      '     DECODE(H.FLGTIPODESC, ''I'', DECODE(TRIM(RX.CODTIPRECDESFAV), '''', H.CODTIPRECDES, RX.CODTIPRECDESFAV), DECODE(TRIM(H.CODTIPRECDES), '''', RX.CODTIPRECDES, H.CODTIPRECDES)) AS CODTIPRECDES,' + #13#10 +
      '     DECODE(H.PLANO, NULL, RX.PLANO, H.PLANO) AS PLANOCONTAB,' + #13#10 +
      '     PD.FLGDESCONTO,' + #13#10 +
      '     H.CODCENTRORESPON,' + #13#10 +
      '     PD.FLGESPECIAL,' + #13#10 +
      '     PR.PERCACAO,' + #13#10 +
      '     DECODE(NVL(PR.PERCACAO, 0), 0, 0, 1) AS TEMACAO,' + #13#10 +
      '     DECODE(H.FLGPENSAOALIM, 2, H.FLGPENSAOALIM, 0) AS FLGPENSAOALIM,' + #13#10 +
      '     PR.IDPROCJUD' + #13#10 +
      '     , QAN.ANOVIGENCIA ' + #13#10 + //Vinicius Maciel - SOL 168331 - KTN 1482898
   'FROM HISTRUBSAL H,' + #13#10 +
      '     PROVDESC PD,' + #13#10 +
      '     INFORME I,' + #13#10 +
      '     PESSOA P,' + #13#10 +
      '     PESSOA PE,' + #13#10 +
      '     PESSOAFISICA PF,' + #13#10 +
      '     RUBRICAXPLANO RX,' + #13#10 +
      '     PROCJUD PR' + #13#10 +
      '     ,(SELECT MAX(ANOVIGENCIA) AS ANOVIGENCIA FROM INFORME WHERE  ANOVIGENCIA <=' + ano + ') QAN' + #13#10 + //Vinicius Maciel - SOL 168331 - KTN 1482898
   'WHERE (H.IDRUBRICA = PD.IDPROVENTO)' + #13#10 +
      //  '  AND (I.IDINFORME = QAN.IDINFORME)'+#13#10+ //Vinicius Maciel - SOL 168331 - KTN 1482898
   '  AND (H.IDINFORME = I.IDINFORME)' + #13#10 +
      '  AND (I.ANOVIGENCIA <= QAN.ANOVIGENCIA)' + #13#10 +
      '  AND (H.IDMODULO = 18)' + #13#10 +
      '  AND (NVL(H.FLGESTORNO,0) = 0)' + #13#10 +
      '  AND (H.IDLANCIRRF IS NULL)' + #13#10 +
      '  AND (H.IDPESSJUR = 1)' + #13#10 +
      '  AND (H.IDRESPONSAVEL = PF.IDPESSOA)' + #13#10 +
      '  AND (P.IDPESSOA = H.IDPESSJUR)' + #13#10 +
      '  AND (H.IDRESPONSAVEL = PE.IDPESSOA)' + #13#10 +
      '  AND (RX.IDPESSJUR(+) = H.IDPATRO)' + #13#10 +
      '  AND (RX.IDRUBRICA(+) = H.IDRUBRICA)' + #13#10 +
      '  AND (RX.IDPLANOPREV(+) = H.IDPLANOPREV)' + #13#10 +
      '  AND ( ( (PD.FLGDESCONTO IN (0, 1)) AND' + #13#10 +
      '          (PD.FLGESPECIAL = 0)       AND' + #13#10 +
      '          (DECODE(H.VALORPROVENTO, 0, DECODE(H.FLGDESCONTO, 2, H.VALORINFO, H.VALORPROVENTO), H.VALORPROVENTO) > 0) )    OR' + #13#10 +
      '        ( (PD.FLGDESCONTO = 2)       AND' + #13#10 +
      '          (PD.FLGESPECIAL <> 0) ) )' + #13#10 +
      '  AND (H.IDINFORME IS NOT NULL)' + #13#10 +
      '  AND (H.IDINFORME <> 164)' + #13#10 +
      '  AND (H.IDRESPONSAVEL = PR.IDPESSOA(+))' + #13#10 +
      '  AND (H.IDPROCJUD = PR.IDPROCJUD(+))' + #13#10 +
      '  AND (H.FONTEPAGADORA IN (1,2))' + #13#10 +

      AdicionarFiltroData(pIndividuo) +
      AdicionarFiltroFolhaBeneficio();
   If Not pIndividuo Then
      Result := Result + AdicionarFiltroPessoas()
   Else
      Result := Result + AdicionarFiltroIndividuo();
End;

Function tProcessaDirf.CondicaoSemMolestiaGrave(): String;
Begin
   Result :=
      '-- Condição para Não portadores Molestia Grave' + #13#10 +
      '  AND (NVL(PF.FLGMOLESTIAGRAVE,0) <> 1)' + #13#10;

End;

Function tProcessaDirf.CondicaoComMolestiaGrave(): String;
Begin
   Result :=
      '-- Condição para Molestia Grave' + #13#10 +
      '  AND (NVL(PF.FLGMOLESTIAGRAVE,0) = 1)' + #13#10;
End;

Function tProcessaDirf.CondicaoCom13Salario(): String;
Begin
   Result :=
      '-- Condição para filtro de 13o. Salario' + #13#10 +
      '  AND PD.FLGRUBRICA13SALARIO = 1' + #13#10;
End;

Function tProcessaDirf.CondicaoSem13Salario(): String;
Begin
   Result :=
      '-- Condição para filtro de 13o. Salario' + #13#10 +
      '  AND PD.FLGRUBRICA13SALARIO = 0' + #13#10;
End;

Function tProcessaDirf.GroupByPadrao(Const pIndividuo: Boolean): String;
Begin
   Result :=
      'GROUP BY H.IDINFORME,' + #13#10 +
      '         QAN.ANOVIGENCIA,' + #13#10 + //Vinicius Maciel - SOL 168331 - KTN 1482898
   '         H.IDPESSOA,' + #13#10 +
      '         H.IDTITULAR,' + #13#10;
   // Alterado por Arnaldo V. Scarin em 10/05/2011 - SOL: 155305/4701 Kintana: 1264451
   If Ano < '2009' Then
      Result := Result + '         NVL(H.NUMDOCUMENTO,PE.NUMDOCUMENTO),' + #13#10
   Else
      Result := Result + '         H.NUMDOCUMENTO,' + #13#10;

   Result := Result +
      '         PE.NOME,' + #13#10 +
      '         H.IDRESPONSAVEL,' + #13#10 +
      '         PF.FLGMOLESTIAGRAVE,' + #13#10 +
      '         PF.DATAMOLESTIAGRAVE,' + #13#10 +
      '         PF.DATAFIMMOLESTIA,' + #13#10 +
      '         PF.DATANASC,' + #13#10 +
      '         H.FLGISENTOIRRF,' + #13#10 +
      '         PF.FLGSOMAIRSUPINSS,' + #13#10 +
      '         H.FONTEPAGADORA,' + #13#10 +
      '         H.IDPESSJUR,' + #13#10 +
      '         I.FLGIRRF,' + #13#10 +
      '         I.FLGBASE,' + #13#10 +
      '         P.NUMDOCUMENTO,' + #13#10 +
      '         NVL(H.IDPLANOCONTABIL, H.IDPLANOPREV),' + #13#10 +
      '         H.IDPLANOPREV,' + #13#10 +
      '         H.CODIRRFDARF,' + #13#10 +
      '         H.IDPATRO,' + #13#10 +
      '         H.IDMODULO,' + #13#10 +
      '         H.IDHSTFOLHABENEF,' + #13#10 +
      '         I.CODDIRF,' + #13#10 +
      '         H.DATAPAGAMENTO,' + #13#10 +
      '         H.FLGMOLESTIAGRAVE,' + #13#10 +
      '         PD.CODPROVDESC,' + #13#10 +
      '         PD.IDPROVENTO,' + #13#10 +
      '         H.VALORINFO,' + #13#10 +
      '         DECODE(PD.FLGDESCONTO, 0, NVL(H.PLACONTAD, RX.PLACONTAD), NVL(H.PLACONTAC, RX.PLACONTAC)),' + #13#10 +
      '         DECODE(NVL(H.CODTIPRECDES, ''''), '''', RX.CODTIPRECDES, H.CODTIPRECDES),' + #13#10 +
      '         DECODE(H.FLGTIPODESC, ''I'', DECODE(TRIM(RX.CODTIPRECDESFAV), '''', H.CODTIPRECDES, RX.CODTIPRECDESFAV), DECODE(TRIM(H.CODTIPRECDES), '''', RX.CODTIPRECDES, H.CODTIPRECDES)),' + #13#10 +
      '         DECODE(H.PLANO, NULL, RX.PLANO, H.PLANO),' + #13#10 +
      '         PD.FLGDESCONTO,' + #13#10 +
      '         H.IDMOTIVO,' + #13#10 +
      '         H.CODCENTRORESPON,' + #13#10 +
      '         PD.FLGESPECIAL,' + #13#10 +
      '         PR.PERCACAO,' + #13#10 +
      '         DECODE(H.FLGPENSAOALIM, 2, H.FLGPENSAOALIM, 0),' + #13#10 +
      '         PR.IDPROCJUD' + #13#10 +
      OrderByPadrao();
End;

Function tProcessaDirf.OrderByPadrao(): String;
Begin
   If (TipoDirf In [td13Salario, td13SalBeneficioEncerrado]) Then
      Result :=
         'ORDER BY FLGPENSAOALIM desc,' + #13#10 +          // Edilaine - SOL 211939 / KTN 2044010
         '         CODIRRFDARF desc,' + #13#10 +            //Wylliam Silva SOL 246623 PPM 732617
         '         H.IDRESPONSAVEL,' + #13#10 +
         '         H.FONTEPAGADORA,' + #13#10 +             // Edilaine - SOL 212983 / KTN 2039612 - colocado antes do CODIRRFDARF
         '         H.IDHSTFOLHABENEF,' + #13#10 +
         '         IDMOTIVO,' + #13#10 +
         '         FLGIRRF DESC,' + #13#10 +
         '         H.IDPATRO' //+ #13#10 +
         //'         FLGPENSAOALIM'                         // Edilaine - SOL 211939 / KTN 2044010 - comentado
   Else
      Result :=
         'ORDER BY FLGPENSAOALIM desc,' + #13#10 +          // Edilaine - SOL 211939 / KTN 2044010
         '         CODIRRFDARF DESC,' + #13#10 +            //Wylliam Silva SOL 246623 PPM 732617
         '         H.IDRESPONSAVEL,' + #13#10 +
         '         H.IDHSTFOLHABENEF,' + #13#10 +
         '         IDPLANOPREV,' + #13#10 +
         '         H.FONTEPAGADORA,' + #13#10 +             // Edilaine - SOL 212983 / KTN 2039612 - colocado antes do CODIRRFDARF
         '         CODIRRFDARF,' + #13#10 +
         '         IDMOTIVO,' + #13#10 +
         '         FLGIRRF DESC,' + #13#10 +
         '         H.IDPATRO'; // + #13#10 +
         //'         FLGPENSAOALIM';                        // Edilaine - SOL 211939 / KTN 2044010 - comentado
End;

Function tProcessaDirf.GetView13Salario(Const pIndividuo: Boolean): String;
Begin
   // Ricardo A. SOL 122481 KTN 601965
   If (FUtilizaNaturezaEspecifica) Then
      Result := SelectPadrao(pIndividuo) +
         CondicaoCom13Salario() +
         CondicaoNaturezaEspecifica +
         GroupByPadrao(pIndividuo)

   Else
      Result := SelectPadrao(pIndividuo) +
         CondicaoCom13Salario() +
         GroupByPadrao(pIndividuo);
End;

Function tProcessaDirf.GetView13SalarioMolestia(Const pIndividuo: Boolean): String;
Begin
   // Ricardo A. SOL 122481 KTN 601965
   If (FUtilizaNaturezaEspecifica) Then
      Result := SelectPadrao(pIndividuo) +
         CondicaoComMolestiaGrave() +
         CondicaoCom13Salario() +
         CondicaoNaturezaEspecifica +
         GroupByPadrao(pIndividuo)

   Else
      Result := SelectPadrao(pIndividuo) +
         CondicaoComMolestiaGrave() +
         CondicaoCom13Salario() +
         GroupByPadrao(pIndividuo);
End;

Function tProcessaDirf.GetViewNormal(Const pIndividuo: Boolean): String;
Begin
   // Ricardo A. SOL 122481 KTN 601965
   If (FUtilizaNaturezaEspecifica) Then
      Result := SelectPadrao(pIndividuo) +
         CondicaoSemMolestiaGrave() +
         CondicaoSem13Salario() +
         CondicaoNaturezaEspecifica +
         GroupByPadrao(pIndividuo)

   Else
      Result := SelectPadrao(pIndividuo) +
         CondicaoSemMolestiaGrave() +
         CondicaoSem13Salario() +
         GroupByPadrao(pIndividuo)

End;

Function tProcessaDirf.GetViewNormalMolestia(Const pIndividuo: Boolean): String;
Begin
   // Ricardo A. SOL 122481 KTN 601965
   If (FUtilizaNaturezaEspecifica) Then
      Result := SelectPadrao(pIndividuo) +
         CondicaoComMolestiaGrave() +
         CondicaoSem13Salario() +
         CondicaoNaturezaEspecifica +
         GroupByPadrao(pIndividuo)

   Else
      Result := SelectPadrao(pIndividuo) +
         CondicaoComMolestiaGrave() +
         CondicaoSem13Salario() +
         GroupByPadrao(pIndividuo);
End;

Procedure tProcessaDirf.AfterInitialize;
Begin
   Inherited;
   LancIRRF.InitializeAs(self);
   LancIRRF.OpenTransaction := False;
End;

Procedure tProcessaDirf.DoChangeDataBase;
Begin
   Inherited;
End;

Constructor tProcessaDirf.Create;
   Procedure _CriarQuerys_();
   Begin
      qryDados := TQuery.Create(Nil);
      qryDados.DatabaseName := 'BaseDados';
      sqlDadosIndividuais := TCMSqlParams.Create(Nil);
      qryDadosAuxiliares := TClientDataSet.Create(Nil);
      sqlDadosIndividuais.ClientDataSet := qryDadosAuxiliares;
      qryDadosIndividuais := tClientDataSet.Create(Nil);
      qryAuxiliar := TClientDataSet.Create(Nil);
      qryInformeDePara := TClientDataSet.Create(Nil);
      qryParamIRRF := TClientDataSet.Create(Nil);
      qryParamFolha := TClientDataSet.Create(Nil);
      qryRubricas := TClientDataSet.Create(Nil);
      qryProvDesc := TClientDataSet.Create(Nil);

      // Ricardo A. SOL 122339 KTN 599155
      qryVerificaExistenciaAcaoJudicial := TCMwwQuery.Create(Nil);
      qryVerificaRegraIT := TCMwwQuery.Create(Nil);
      qrySalarioNormal := TCMwwQuery.Create(Nil);
      qrySalarioNormal2 := TCMwwQuery.Create(Nil);
      qryHistoricoMolestiaGrave := TCMwwQuery.Create(Nil);

      // FIM SOL 122339
      qryQtdMesesRRA := TClientDataSet.Create(Nil); // Felipe A. Santos SOL 195438 KINTANA 1878097
   End;
Begin
   Inherited;
   _CriarQuerys_();
   fPessoas := tStringList.Create;
   fTipo := tdNone;
   fDataIni := -1;
   fDataFim := -1;
   fView := '';
   fItens := Tlist.Create;
   LancIRRF := TCtrLancIRRF.Create;
   fCPFInicial := -1;
   fCPFFinal := -1;
   fCPF := '';// higor Nayde Ferreira SOL - 197522 KTN - 1897639
   // Ricardo A. SOL 122481 KTN 601965
   FUtilizaNaturezaEspecifica := False;

   // Ricardo A. SOL 122339 KTN 599155
   PreparaQuerysIndividual;
   // FIM SOL 122339
End;

Procedure tProcessaDirf.Delete(Const pIndex: Integer);
Begin
   tProcessaDirfIndividual(fItens[pIndex]).Free;
   FItens.Delete(pIndex);
End;

Destructor tProcessaDirf.Destroy;
   Procedure _destruirQuerys_();
   Begin
      qryDados.Close;
      qryDadosIndividuais.Close;
      qryDadosAuxiliares.Close;
      qryAuxiliar.Close;
      qryInformeDePara.Close;
      qryParamIRRF.Close;
      qryParamFolha.Close;
      qryRubricas.Close;
      qryProvDesc.Close;
      qryQtdMesesRRA.Close; // Felipe A. Santos SOL 195438 KINTANA 1878097

      // Ricardo A. SOL 122339 KTN 599155
      qryVerificaExistenciaAcaoJudicial.Close;
      qryVerificaRegraIT.Close;
      qrySalarioNormal.Close;
      qrySalarioNormal2.Close;
      qryHistoricoMolestiaGrave.Close;
      qryVerificaExistenciaAcaoJudicial.UnPrepare;
      qryVerificaRegraIT.UnPrepare;
      qrySalarioNormal.UnPrepare;
      qrySalarioNormal2.UnPrepare;
      qryHistoricoMolestiaGrave.UnPrepare;
      // FIM SOL 122339

      FreeAndNil(qryDados);
      FreeAndNil(sqlDadosIndividuais);
      FreeAndNil(qryDadosAuxiliares);
      FreeAndNil(qryDadosIndividuais);
      FreeAndNil(qryAuxiliar);
      FreeAndNil(qryInformeDePara);
      FreeAndNil(qryParamIRRF);
      FreeAndNil(qryParamFolha);
      FreeAndNil(qryRubricas);
      FreeAndNil(qryProvDesc);

      // Ricardo A. SOL 122339 KTN 599155
      FreeAndNil(qryVerificaExistenciaAcaoJudicial);
      FreeAndNil(qryVerificaRegraIT);
      FreeAndNil(qrySalarioNormal);
      FreeAndNil(qrySalarioNormal2);
      FreeAndNil(qryHistoricoMolestiaGrave);
      // FIM SOL 122339

      FreeAndNil(qryQtdMesesRRA); // Felipe A. Santos SOL 195438 KINTANA 1878097
   End;
Begin
   Inherited;
   fPessoas.Clear;
   Clear;
   FreeAndNil(FItens);
   FreeAndNil(fPessoas);
   _DestruirQuerys_();
   LancIRRF.Free;
End;

Procedure tProcessaDirf.CriarDirfIndividual();
Begin
   // Cria Select com Bind Variable para que possa não estourar a
   // Área de Shared Pool
   CriarQueryIndividual();
   With qryDados Do
      Begin
         While Not Eof Do
            Begin
               // Esse Self se refere ao Classe
               Self.Add(FieldByName('CPFCNPJ').asString,
                  FieldByName('Nome').asString);
               Next;
            End;
         Close;
      End;
End;

Function tProcessaDirf.CarregarDadosDirf(): Boolean;
Const aProc: Array[0..3] Of String = ('Normal', 'Molestia', '13o.Sal', '13o.SBE');
Begin
   Result := False;
   If View = '' Then
      Begin
         Raise Exception.Create('Deve ser informado o Nome da View que será utilizada para o processamento!');
         exit;
      End;

   //  If GerarQuery() then
   If GerarQueryOtimizada() Then
      Begin
         If GerarInformacoesAuxiliares() Then
            Begin
               If BuscaProvDesc Then
                  AtualizaParamHist(Versao);
               CriarDirfIndividual();
               FrmGeraFolhaMt.lblcontagem.caption := Format('Proc. %S: %d de %d', [aProc[Integer(TipoDirf)], 0, Count]);
               Result := True;
            End;
      End;
End;

Procedure tProcessaDirf.BuscaParametros(Const iEmpresa: Integer);
Begin
   {Busca parâmetros do IRRF}
   qryParamIRRF.Data := GetDataPacket('SELECT IDPROGRAMA FROM PROGRAMA WHERE FLGTIPOPROGRAMA = ''PRE''');

   {Busca rubricas de adiantamento da Folha de Benefícios}
   qryRubricas.Data := GetDataPacket('SELECT IDPROVENTO, TRIM(CODPROVDESC) AS CODPROVDESC, DESCRICAO, 1 AS TIPO ' + #13#10 +
      'FROM PROVDESC                                                             ' + #13#10 +
      'WHERE IDPROVENTO IN (SELECT IDRUBANTECABONO FROM BENEFPLANPREV)           ' + #13#10 +
      'UNION                                                                     ' + #13#10 +
      'SELECT IDPROVENTO, TRIM(CODPROVDESC) AS CODPROVDESC, DESCRICAO, 2 AS TIPO ' + #13#10 +
      'FROM PROVDESC                                                             ' + #13#10 +
      'WHERE IDPROVENTO IN (SELECT IDRUBDEVANTABONO FROM BENEFPLANPREV)          ');

   {Busca parâmetros da Folha de Benefícios e linhas de dedução de dependente de abono normal e de molestia grave}
   qryParamFolha.Data := GetDataPacket('SELECT PRV.IDINFORME,' + #13#10 +
      '       INF.IDINFORMEDESTINO,' + #13#10 +
      '       NVL(PAR2.VALORPARAM,0) AS PARAMRESGATE' + #13#10 +
      'FROM PARAMFOLHA    PAR,' + #13#10 +
      '     PROVDESC      PRV, ' + #13#10 +
      '     INFORMEDEPARA INF, ' + #13#10 +
      '     PARAMFOLHA    PAR2 ' + #13#10 +
      'WHERE PAR.NOMEPARAM   = ''IDRUBDEDDEPABONO'' ' + #13#10 +
      '  AND PAR.VALORPARAM  = PRV.IDPROVENTO ' + #13#10 +
      '  AND PRV.IDINFORME   = INF.IDINFORMEORIGEM(+) ' + #13#10 +
      '  AND PAR2.NOMEPARAM  = ''FLGCALCULAIRRESGATEISENTO'' ' + #13#10 +
      '  AND PAR2.IDFUNDACAO = ' + InttoStr(iEmpresa));
End;

Procedure tProcessaDirf.ProcurarParamIRRF(Const iEmpresa: integer);
Begin
   //Vinicius Maciel - SOL 168331 - KTN 1482898
   {qryParamIRRF.Data := GetDataPacket('SELECT P.*, M.MOESIGLA, T.DESCCUSTAGREG '+#13#10+
                                      'FROM PARAMIRRF P, MOEDA M, TIPOAGRE T '+#13#10+
                                      'WHERE P.IDPESSOA = '+intTostr(iEmpresa)+#13#10+
                                      '  AND P.MOECODIGO = M.MOECODIGO(+) '+#13#10+
                                      '  AND P.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG(+)');}

   qryParamIRRF.Data := GetDataPacket(' SELECT P.*, M.MOESIGLA, T.DESCCUSTAGREG ' + #13#10 +
      ' FROM PARAMIRRFVIGENCIA P, MOEDA M, TIPOAGRE T, ' + #13#10 +
      ' (SELECT MAX(ANOVIGENCIA) AS ANOVIGENCIA FROM PARAMIRRFVIGENCIA WHERE ANOVIGENCIA <=' + ano + ') QAX ' + #13#10 +
      ' WHERE P.IDPESSOA = ' + intTostr(iEmpresa) + #13#10 +
      ' AND P.MOECODIGO = M.MOECODIGO(+) ' + #13#10 +
      ' AND P.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG(+)' + #13#10 +
      ' AND P.ANOVIGENCIA = QAX.ANOVIGENCIA');
   //Vinicius Maciel - SOL 168331 - KTN 1482898 - FIm
End;

Function tProcessaDirf.GerarInformacoesAuxiliares(): Boolean;
Begin
   Result := True;

   qryAuxiliar.Data := GetDataPacket('SELECT VALORPARAM FROM PARAMFOLHA WHERE NOMEPARAM = ''CODCCUSTOFINAN''');

   qryInformeDePara.Data := GetDataPacket('SELECT * FROM cm.INFORMEDEPARA ORDER BY IDSITUACAO, IDINFORMEORIGEM ');

   qryProvDesc.Data := GetDataPacket('SELECT IDPROVENTO FROM PROVDESC WHERE FLGRUBRICA13SALARIO = 1');
   If qryAuxiliar.FieldByName('VALORPARAM').AsString = '' Then
      CodigoCentroCusto := ' '
   Else
      CodigoCentroCusto := qryAuxiliar.FieldByName('VALORPARAM').AsString;

   qryAuxiliar.Close;

   bFaltaParmMolestia := False;
   bFaltaParmMais65 := False;
   bFaltaPrograma := False;
   bProcessa := True;
   b65acumprimvez := True;

   // Busca os Paramentros necessarios para as validações.
   BuscaParametros(Empresa);

   iLinhaDedDepAbono := qryParamFolha.FieldByName('IDINFORME').AsInteger;
   iLinhaDedDepAbonoMol := qryParamFolha.FieldByName('IDINFORMEDESTINO').AsInteger;

   If qryParamIRRF.IsEmpty Then
      Begin
         bFaltaPrograma := True;
         Result := false;
      End;
   iIdPrograma := qryParamIRRF.FieldByName('IDPROGRAMA').AsInteger;

   ProcurarParamIRRF(Empresa);

   If (trim(qryParamIrrf.fieldbyname('IDINFORMEMOLESTIA').asString) = '') Then
      Begin
         bfaltaParmMolestia := true;
         Result := false;
      End
   Else
      Begin
         iIdMolestiagrave := qryParamIrrf.fieldbyname('IDINFORMEMOLESTIA').AsInteger;
         iIdMolestiagraveINSS := qryParamIrrf.fieldbyname('IDINFORMEMOLINSS').AsInteger;
      End;

   If (trim(qryParamIrrf.fieldbyname('IDINFORME65ANOS').asString) = '') Then
      Begin
         bFaltaParmMais65 := True;
         Result := False;
      End
   Else
      Begin
         iLinhaAcima65 := qryParamIrrf.fieldbyname('IDINFORME65ANOS').asInteger;
         iLinhaAcima65INSS := qryParamIrrf.fieldbyname('IDINFORME65INSS').asInteger;
         iLinhaRendAcJud := qryParamIrrf.fieldbyname('IDINFORMEACJUD').asInteger;
         iLinhaRendAcJud13 := qryParamIrrf.fieldbyname('IDINFORMEACJUD13').asInteger;
         iLinhaAbonoAcima65 := qryParamIRRF.FieldByName('IDINFORME65ANOS13').AsInteger;
         iLinhaAbonoAcima65INSS := qryParamIRRF.FieldByName('IDINFORME65INSS13').AsInteger;
         iLinhaExigibilidadeSuspensa := qryParamIRRF.FieldByName('IDEXIGIBILIDADESUSPENSA').asInteger;
         iLinhaAcaoJudicialInss := qryParamIRRF.FieldByName('IdAcaoJudicialInss').asInteger;
         iLinhaAcaoJudicialInss13 := qryParamIRRF.FieldByName('IdAcaoJudicialInss13').asInteger;
         iRegraInss := qryParamIRRF.FieldByName('IdRegraInss').asInteger;
      End;
    //Wylliam Leite da Silva SOL: 247702 PPM:732173 - Inicio
    if not (qryInformeDePara.IsEmpty) then
    begin
      qryInformeDePara.Filtered := False;
      qryInformeDePara.Filter := 'IDINFORMEORIGEM = ' + IntToStr(iLinhaAbonoAcima65);
      qryInformeDePara.Filtered := True;

      iIdAbonoMolestiaGrave := qryInformeDePara.FieldbyName('IDINFORMEDESTINO').asinteger;

      qryInformeDePara.filtered := False;

    end;
	//Wylliam Leite da Silva SOL: 247702 PPM:732173 - Fim
End;

Procedure tProcessaDirf.AtualizaParamHist(Const piIdVersao: Integer);
Var sSql: String;
Begin
   sSql := 'UPDATE HISTRUBSAL H ' + #13#10 +
      //  sSql := 'UPDATE HISTRUBSAL_TEMP H '+#13#10+
   'SET H.IDINFORME   = (SELECT IDINFORME   FROM PROVDESC WHERE IDPROVENTO = H.IDRUBRICA),' + #13#10 +
      '    H.CODIRRFDARF = (SELECT CODIRRFDARF FROM PROVDESC WHERE IDPROVENTO = H.IDRUBRICA) ' + #13#10 +
      'WHERE EXISTS (SELECT 1 FROM PROVDESC P ' + #13#10 +
      '              WHERE P.IDPROVENTO       = H.IDRUBRICA ' + #13#10 +
      '                AND P.CODIRRFDARF IS NOT NULL ' + #13#10 +
      '                AND P.IDINFORME   IS NOT NULL )' + #13#10 +
      '  AND H.IDLANCIRRF IS NULL ';
   //CPrev - 24663 - Inicio
   //If Trim(psListaPessoa) <> '' Then
   //  sSql := sSql + '   AND (H.IDRESPONSAVEL  IN ('+psListaPessoa+')) ';

   //If Trim(psListaPessoa) = '' Then
   //  If piIdPessoa > 0 then
   //    ssql := ssql + '   AND (H.IDRESPONSAVEL  = '+Inttostr(piIdPessoa)+' ) ';

   If Pessoas.Count > 0 Then
      Begin
         sSql := sSql + '   AND (H.IDRESPONSAVEL  IN ' + ConverteListaPessoas() + ') ';
         //    sSql := sSql + '   AND EXISTS (SELECT 1 FROM LISTAFOLHABENEFDET LD '+#13#10+
         //                   '               WHERE H.IDTITULAR     = LD.IDTITULAR '+#13#10+
         //                   '                 AND H.IDRESPONSAVEL = LD.IDPESSOA '+#13#10+
         //                   '                 AND LD.IDLISTA      in '+ ConverteListaPessoas() +')';
      End;
   //CPrev - 24663 - Fim

   //  If TipoDirf in [ td13Salario, td13Molestia ] then
   If TipoDirf In [td13Salario, td13SalBeneficioEncerrado] Then
      sSql := sSql + '   AND (H.DATAPAGAMENTO   >= TO_DATE(''' + FormatDateTime('01/01/yyyy', DataInicial) + ''',''DD/MM/YYYY'')) ' + #13#10 +
         '   AND (H.DATAPAGAMENTO   <= TO_DATE(''' + FormatDateTime('31/12/yyyy', DataFinal) + ''',''DD/MM/YYYY'')) '
   Else
      sSql := sSql + '   AND (H.DATAPAGAMENTO   >= TO_DATE(''' + DateToStr(DataInicial) + ''',''DD/MM/YYYY'')) ' + #13#10 +
         '   AND (H.DATAPAGAMENTO   <= TO_DATE(''' + DateToStr(DataFinal) + ''',''DD/MM/YYYY'')) ';

   If Pos(',', CodigoRubricas) > 0 Then
      Begin
         If Trim(CodigoRubricas) <> '' Then
            sSql := sSql + '   AND (H.IDRUBRICA IN (' + CodigoRubricas + ')) ';
      End
   Else
      If Trim(CodigoRubricas) <> '' Then
         sSql := sSql + '   AND (H.IDRUBRICA = ' + CodigoRubricas + ') ';

   sSql := sSql + '   AND H.IDMODULO         = 18' + #13#10 +
      '   AND (H.CODIRRFDARF     IS NULL OR' + #13#10 +
      '        H.IDINFORME       IS NULL)';

   If piIdVersao > 0 Then
      sSql := sSql + ' AND (H.IDHSTFOLHABENEF = ' + IntToStr(piIdVersao) + ')';

   MostraMensagem('Inicio do ajuste da HISTRUBSAL: ' + FormatDateTime('hh:nn:ss', Time));

   Try
      ExecSQL(sSql);
   Except
      MostraMensagem('Não foi possível atualizar os parâmetros no histórico de rubricas salariais.');
      Raise Exception.Create('Não foi possível atualizar os parâmetros no histórico de rubricas salariais.');
   End;
   MostraMensagem('Final do ajuste da HISTRUBSAL: ' + FormatDateTime('hh:nn:ss', Time));
End;

Function tProcessaDirf.ProcessarDadosDirf(): boolean;
Var i: Integer;
   bGravar: Boolean;
   iTotal: Integer;
   oIndividuo: tProcessaDirfIndividual;
Const aProc: Array[0..3] Of String = ('N ormal', 'Molestia', '13o.Sal', '13o.SBE');
Begin
   Result := True;
   bGravar := False;
   If Not InTransaction Then
      StartTransaction;
   iTotal := Count;
   frmGeraFolhaMT.lbl_decorrido.Caption := 'Tempo Decorrido: ' + FormatDateTime('hh:nn:ss', now - FrmGeraFolhaMt.dInicio);
   For i := 0 To iTotal - 1 Do
      Begin
         oIndividuo := Itens[i];
         bGravar := True;
         Linha();
         FrmGeraFolhaMt.lblcontagem.caption := Format('Proc. %S: %d de %d', [aProc[Integer(TipoDirf) - 1], i + 1, iTotal]);
         MostraMensagem(Format('Processando %s . . .', [oIndividuo.Nome]));
         //Wylliam Leite da Silva - SOL:246488 PPM:1026389 - Início
         oIndividuo.Processar(iQtdDecVlrIdosoFixo, sIDPESSOA, TipoDirf);
         iQtdDecVlrIdosoFixo:= oIndividuo.iQtdDecVlrIdosoFixo;
         sIDPESSOA := oIndividuo.sIDPESSOA;
         //Wylliam Leite da Silva - SOL:246488 PPM:1026389 - Fim
         frmGeraFolhaMT.lbl_decorrido.Caption := 'Tempo Decorrido: ' + FormatDateTime('hh:nn:ss', now - FrmGeraFolhaMt.dInicio);
         oIndividuo.Clear;
         If (i Mod 200 = 0) And (i > 0) Then
            Begin
               If InTransaction Then
                  Begin
                     Commit;
                     StartTransaction;
                  End;
            End;
      End;
   Self.Clear;
   If bGravar Then
      Begin
         If InTransaction Then
            Commit;
      End
   Else
      Rollback;
End;

//Wylliam Leite da Silva - SOL:246488 PPM:1026389
procedure tProcessaDirf.ExecutarDIRF(var prQtdDecVlrIdosoFixo: Integer; var prIDPESSOA: String);
Begin
   If CarregarDadosDirf() Then
      ProcessarDadosDirf()
   Else
      Inc(iErrados);

   prQtdDecVlrIdosoFixo := iQtdDecVlrIdosoFixo;
   prIDPESSOA := sIDPESSOA;
End;

Function tProcessaDirf.ConverteListaPessoas(): String;
Var I: Integer;
Begin
   result := '(';
   For i := 0 To Pessoas.Count - 1 Do
      If isCPF Then
         result := result + QuotedStr(Pessoas[i]) + ','
      Else
         result := result + Pessoas[i] + ',';
   Result := Copy(Result, 1, Length(Result) - 1) + ')';
End;

Function tProcessaDirf.GerarQuery: boolean;
Begin
   With qryDados Do
      Begin
         Sql.Clear;
         Sql.Add('Select Distinct CPFCNPJ');
         Sql.Add('               ,Nome');
         If TipoDirf In [td13Salario, td13SalBeneficioEncerrado] Then
            Begin
               Sql.Add('from (' + GetView13Salario() + ') H');
               Sql.Add('Where H.DataPagamento >= To_date(' + QuotedStr(FormatDateTime('01/01/yyyy', DataInicial)) + ',''dd/mm/yyyy'')');
               Sql.Add('  AND H.DataPagamento <= To_date(' + QuotedStr(FormatDateTime('31/12/yyyy', DataFinal)) + ',''dd/mm/yyyy'')');
            End
         Else
            Begin
               Sql.Add('from ' + GetView() + ' H');
               Sql.Add('Where H.DataPagamento >= To_date(' + QuotedStr(FormatDateTime('dd/mm/yyyy', DataInicial)) + ',''dd/mm/yyyy'')');
               Sql.Add('  AND H.DataPagamento <= To_date(' + QuotedStr(FormatDateTime('dd/mm/yyyy', DataFinal)) + ',''dd/mm/yyyy'')');
            End;
         If Pessoas.Count > 0 Then
            Sql.Add(AdicionarFiltroPessoas());
         //      Sql.Add('  AND (H.IDRESPONSAVEL  IN '+ConverteListaPessoas()+')');
         Sql.Add('  AND CPFCNPJ <> ''00000000000  ''');
         Prepare;
         Open;
      End;
   result := Not qryDados.IsEmpty;
End;

Function tProcessaDirf.GerarQueryOtimizada: boolean;
Begin
   With qryDados Do
      Begin
         Close;
         Sql.Clear;
         // Alterado por Arnaldo V. Scarin em 10/05/2011 - SOL: 155305/4701 Kintana: 1264451
         If Ano < '2009' Then
            Sql.Text := 'SELECT DISTINCT NVL(H.NUMDOCUMENTO,PE.NUMDOCUMENTO) AS CPFCNPJ,' + #13#10
         Else
            Sql.Text := 'SELECT DISTINCT H.NUMDOCUMENTO AS CPFCNPJ,' + #13#10;

         Sql.Text := Sql.Text +
            '                PE.NOME AS NOME' + #13#10 +
            'FROM HISTRUBSAL H,' + #13#10 +
            '     PROVDESC PD,' + #13#10 +
            '     INFORME I,' + #13#10 +
            '     PESSOA P,' + #13#10 +
            '     PESSOA PE,' + #13#10 +
            '     PESSOAFISICA PF,' + #13#10 +
            '     RUBRICAXPLANO RX,' + #13#10 +
            '     PROCJUD PR' + #13#10 +
            'WHERE (H.IDRUBRICA = PD.IDPROVENTO)' + #13#10 +
            '  AND (H.IDINFORME = I.IDINFORME)' + #13#10 +
            '  AND (H.IDMODULO = 18)' + #13#10 +
            '  AND (NVL(H.FLGESTORNO,0) = 0)' + #13#10 +
            '  AND (H.IDLANCIRRF IS NULL)' + #13#10 +
            '  AND (H.IDPESSJUR = 1)' + #13#10 +
            '  AND (H.IDRESPONSAVEL = PF.IDPESSOA)' + #13#10 +
            '  AND (P.IDPESSOA = H.IDPESSJUR)' + #13#10 +
            '  AND (H.IDRESPONSAVEL = PE.IDPESSOA)' + #13#10 +
            '  AND (RX.IDPESSJUR(+) = H.IDPATRO)' + #13#10 +
            '  AND (RX.IDRUBRICA(+) = H.IDRUBRICA)' + #13#10 +
            '  AND (RX.IDPLANOPREV(+) = H.IDPLANOPREV)' + #13#10 +
            '  AND ( ( (PD.FLGDESCONTO IN (0, 1)) AND' + #13#10 +
            '          (PD.FLGESPECIAL = 0)       AND' + #13#10 +
            '          (DECODE(H.VALORPROVENTO, 0, DECODE(H.FLGDESCONTO, 2, H.VALORINFO, H.VALORPROVENTO), H.VALORPROVENTO) > 0) )    OR' + #13#10 +
            '        ( (PD.FLGDESCONTO = 2)       AND' + #13#10 +
            '          (PD.FLGESPECIAL <> 0) ) )' + #13#10 +
            '  AND (H.IDINFORME IS NOT NULL)' + #13#10 +
            '  AND (H.IDRESPONSAVEL = PR.IDPESSOA(+))' + #13#10 +
            '  AND (H.IDPROCJUD = PR.IDPROCJUD(+))' + #13#10 +
            '  AND (H.FONTEPAGADORA IN (1,2))' + #13#10;

         // Apesar da Rotina AdicionarFiltroData receber um parametro boolean
         // que indica se o processamento é individual ou não, quando o parametro
         // UsarAnoTodo13Sal for verdadeiro, a função entenderá que deverá ser
         // processado como se fosse um individuo, e nesse caso passará a data inicial
         // como 01/01 e a data final como 31/12, o que servirá plenamente para as
         // necessidades de correção.
         Sql.Text := Sql.Text + AdicionarFiltroData(UsarAnoTodo13Sal);
         Sql.Text := Sql.Text + AdicionarFiltroFolhaBeneficio;
         If Not (TipoDirf In [td13Salario, td13SalBeneficioEncerrado]) Then
            Begin
               If TipoDirf = tdNormal Then
                  Sql.Text := Sql.Text + CondicaoSemMolestiaGrave()
               Else
                  Sql.Text := Sql.Text + CondicaoComMolestiaGrave();
               Sql.Text := Sql.Text + CondicaoSem13Salario();
            End
         Else
            Begin
               Sql.Text := Sql.Text + CondicaoCom13Salario();
               If CPFInicial <> -1 Then
                  // Alterado por Arnaldo V. Scarin em 10/05/2011 - SOL: 155305/4701 Kintana: 1264451
                  If Ano < '2009' Then
                     Begin
                        Sql.Text := Sql.Text + '  And SubStr(NVL(H.NUMDOCUMENTO,PE.NUMDOCUMENTO),1,1) >= ' + QuotedStr(IntToStr(CPFInicial)) + #13#10 +
                           '  And SubStr(NVL(H.NUMDOCUMENTO,PE.NUMDOCUMENTO),1,1) <= ' + QuotedStr(IntToStr(CPFFinal)) + #13#10;
                     End
                  Else
                     Begin
                        Sql.Text := Sql.Text + '  And SubStr(H.NUMDOCUMENTO,1,1) >= ' + QuotedStr(IntToStr(CPFInicial)) + #13#10 +
                           '  And SubStr(H.NUMDOCUMENTO,1,1) <= ' + QuotedStr(IntToStr(CPFFinal)) + #13#10;
                     End;
            End;

         // Ricardo A. SOL 122481 KTN 601965
         If (FUtilizaNaturezaEspecifica) Then
            SQL.Text := SQL.Text + CondicaoNaturezaEspecifica;

         Sql.Text := Sql.Text + AdicionarFiltroPessoas;
         // Alterado por Arnaldo V. Scarin em 10/05/2011 - SOL: 155305/4701 Kintana: 1264451
         If Ano < '2009' Then
            Begin
               Sql.Add('  AND NVL(H.NUMDOCUMENTO,PE.NUMDOCUMENTO) <> ''00000000000  ''');
               Sql.Add('Order By NVL(H.NUMDOCUMENTO,PE.NUMDOCUMENTO)');
            End
         Else
            Begin
               Sql.Add('  AND H.NUMDOCUMENTO <> ''00000000000  ''');
               Sql.Add('Order By H.NUMDOCUMENTO');
            End;
         Prepare;
         Open;
      End;
   result := Not qryDados.IsEmpty;
End;

Function tProcessaDirf.GetItens(Index: Integer): tProcessaDirfIndividual;
Begin
   Result := tProcessaDirfIndividual(FItens[Index]);
End;

Function tProcessaDirf.IndexOfCodigo(Const pCodigoPessoa: String): Integer;
Var I: Integer;
Begin
   Result := -1;
   For i := 0 To Count - 1 Do
      Begin
         If Itens[i].CodigoPessoa = pCodigoPessoa Then
            Begin
               Result := I;
               Break;
            End;
      End;
End;

Procedure tProcessaDirf.SetItens(Index: Integer; Const Value: tProcessaDirfIndividual);
Begin
   FItens[Index] := Value;
End;

Function tProcessaDirf.GetQtdeErrados: Integer;
Begin
   Result := iErrados;
End;

Function tProcessaDirf.GetQtdeProcessados: Integer;
Begin
   Result := iGravados;
End;

Function tProcessaDirf.GetQtdeTotal: Integer;
Begin
   Result := FItens.Count;
End;

Function tProcessaDirf.CriarQueryIndividual: Boolean;
Begin
   Result := True;
   With SqlDadosIndividuais Do
      Begin
         Sql.Clear;
         Sql.Add('Select VALOR,VALORSINAL,IDINFORME,IDPESSOA,IDTITULAR,CPFCNPJ,NOME,');
         Sql.Add('       ANOVIGENCIA, '); //Vinicius Maciel - SOL 168331 - KTN 1482898
         Sql.Add('       IDRESPONSAVEL,PESSOA_FLGMOLESTIAGRAVE,DATAMOLESTIAGRAVE,');
         Sql.Add('       DATAFIMMOLESTIA,DATANASC,H.FLGISENTOIRRF,FLGSOMAIRSUPINSS,');
         Sql.Add('       FONTEPAGADORA,IDHSTFOLHABENEF,IDMOTIVO,IDPESSJUR,IDPATRO,');
         Sql.Add('       DATAPAGAMENTO,FLGIRRF,FLGBASE,CODDIRF,NUMDOCUMENTO,CODIRRFDARF,');
         Sql.Add('       IDPLANOPREV,IDPLANOPREVIDENCIARIO,IDMODULO,FLGMOLESTIAGRAVE,');
         Sql.Add('       CODPROVDESC,IDPROVENTO,VALORINFO,PLACONTAC,CODTIPRECDES,');
         Sql.Add('       PLANOCONTAB,FLGDESCONTO,CODCENTRORESPON,FLGESPECIAL,');
         Sql.Add('       PERCACAO,TEMACAO,FLGPENSAOALIM,IDPROCJUD,');
         Sql.Add('      ' + QuotedStr(CodigoCentroCusto) + ' as CODCENTROCUSTO');
         If TipoDirf In [td13Salario, td13SalBeneficioEncerrado] Then
            Sql.Add('from (' + GetView13Salario(True) + ') H')
         Else
            Sql.Add('from ' + GetView(True) + ' H');
      End;
End;

//----------------------------------------------------------------------------//
//                                                                            //
//                       { tProcessaDirfIndividual }                          //
//                                                                            //
//----------------------------------------------------------------------------//
{Function tProcessaDirfIndividual.ValidaExigibilidadeSuspensa() : boolean;
var iParam : Integer;
    sParam : String;
    iPosicao : Integer;
    rValorLinha,rValorLinhaSinal : Double;
begin
  sParam := copy(Pai.qryDadosIndividuais.FieldByName('CodProvDesc').asString,2,3);
  iParam := StrToIntDef(sParam,0);
  Result := (iParam in [031,195,123,225,185]);

  if Result then
  begin
    rValorLinha      := Pai.qryDadosIndividuais.FieldByName('VALOR').AsFloat;
    rValorLinhaSinal := Pai.qryDadosIndividuais.FieldByName('VALORSINAL').AsFloat;

    iPosicao := Linhas.IndexOfLinha(pai.iLinhaExigibilidadeSuspensa,1,CodigoNatureza);
    If iPosicao > -1 then
    begin
      Linhas[iPosicao].AtualizarValores(rValorLinha,
                                        rValorLinhaSinal);
    end
    else
    begin
      Linhas.AdicionarValores(pai.iLinhaExigibilidadeSuspensa,
                              rValorLinha,
                              rValorLinhaSinal,
                              1,
                              CodigoNatureza,
                              FlgPensaoAlim);
    end;
  end;
end; }

Function tProcessaDirfIndividual.LocalizaDataEfetivacao(Const iVersao: integer): String;
Var oSql: TClientDataSet;
   sSql: String;
Begin
   oSql := TClientDataSet.Create(Nil);
   Try
      sSql := 'SELECT DISTINCT DATAPAGAMENTO FROM HISTRUBSAL H' + #13#10 +
         'WHERE H.IDHSTFOLHABENEF = ' + IntToStr(iVersao) + #13#10 +
         '  and H.IDRESPONSAVEL = ' + IntToStr(IdPessoa);
      oSql.Data := pai.GetDataPacket(sSql);

      if (FormatDateTime('MM', Pai.DataInicial) <> '08') then
        result := oSql.FieldByName('DataPagamento').AsString
      else
        result := '20/' + FormatDateTime('MM/YYYY', Pai.DataInicial);
   Finally
      oSql.Close;
      FreeAndNil(oSql);
   End;
End;

Function tProcessaDirfIndividual.VerificaExistenciaAcaoJudicialGravarSeparado(Const lstIdPessoa: TStringList): Boolean;
Var oSql: TClientDataSet;
   oLstSql: TStringList;
Begin
   Result := False;
   oSql := TClientDataSet.Create(Nil);
   oLstSql := TStringList.Create;
   Try
      oLstSql.Text := 'Select distinct p.idpessoa, pj.idprocjud' + #13 + #10 +
         'from (' + pai.sqlDadosIndividuais.SqlChanged + ') p, procjud pj' + #13 + #10 +
         'where p.idpessoa = pj.idpessoa(+)' + #13 + #10 +
         '  and ( (pj.Datafinal is Null) or' + #13 + #10 +
         '        To_Char(pj.dataFinal,''YYYYMM'') >= ' +
         QuotedStr(FormatDateTime('YYYYMM', Pai.qryDadosIndividuais.FieldByName('DataPagamento').asDateTime)) + ')' + #13 + #10 +
         'order by idpessoa';
      oSql.Data := pai.GetDataPacket(oLstSql.Text);
      If (oSql.RecordCount > 0) Then
         Begin
            oSql.First;
            While Not oSql.Eof Do
               Begin
                  lstIdPessoa.Add(oSql.FieldByName('idpessoa').asString);
                  If Not Result Then
                     Begin
                        If oSql.FieldByName('IdProcjud').asInteger <> 0 Then
                           Begin
                              If Not TemAcaoJudicial Then
                                 iIdPessoaProcJud := oSql.FieldByName('idpessoa').asInteger;
                              Result := True;
                              //            Break;
                           End;
                     End;
                  oSql.Next;
               End;
            Result := ValidaAcaoJudicialEDataFolhaPagamento(oSql.FieldByname('IdProcJud').asInteger);
            If Not Result Then
            begin
               iIdPessoaProcJud := 0;
               pIprocjud167     := 0;//Marcio Sanches Spinosa SOL 235271 PPM 446324
            end;
         End;
   Finally
      oSql.Close;
      FreeAndNil(oLstSql);
      FreeAndNil(oSql);
   End;
End;

Function tProcessaDirfIndividual.ValidaAcaoJudicialEDataFolhaPagamento(pIdProcJud: Integer): Boolean;
Var oSql: TClientDataSet;
   oLstSql: TStringList;
   dDataEfetivacao: TDateTime;
Begin
   Result := False;
   oSql := TClientDataSet.Create(Nil);
   oLstSql := TStringList.Create;
   Try
      oLstSql.Text := 'select idhstfolhabenef,dataefetivacao' + #13#10 +
         'from hstfolhabenef' + #13#10 +
         'where idhstfolhabenef = ' + IntToStr(pai.Versao);
      oSql.Data := pai.GetDataPacket(oLstSql.Text);
      dDataEfetivacao := oSql.FieldByName('DataEfetivacao').asDateTime;
      oLstSql.Text := 'Select distinct p.idpessoa, pj.idprocjud, pj.DataFinal, ' + #13 + #10 +
      'pj.DataInicio, pj.SitProcesso ' + #13 + #10 + //Wylliam Silva SOL 246623 PPM 732617
         'from (' + pai.sqlDadosIndividuais.SqlChanged + ') p, procjud pj' + #13 + #10 +
         'where p.idpessoa = pj.idpessoa(+)' + #13 + #10 +
         //Vinicius Maciel SOL 163450 KTN 1397051
      'AND ((PJ.SITPROCESSO <> 2)' +
         'OR (TO_CHAR(PJ.DATAFINAL,' + QuotedStr('YYYYMM') + ')' +
         ' >= ' + FormatDateTime('yyyymm', Pai.qryDadosIndividuais.FieldByName('DATAPAGAMENTO').AsDateTime) + ' ))' +
         //Vinicius Maciel SOL 163450 KTN 1397051 - FIM
      ' order by idpessoa';
      oSql.Data := pai.GetDataPacket(oLstSql.Text);
      //Marcio Sanches Spinosa SOL 235271 PPM 446324 - Inicio
      while not oSql.Eof do
      begin
      If Not oSql.isEmpty Then
         Result := (oSql.FieldByName('DataFinal').asDateTime > dDataEfetivacao) Or (oSql.FieldByName('DataFinal').isNull) or
         //Wylliam Silva SOL 247702 PPM 732173 - Inicio
		 (oSql.FieldByName('DataInicio').asDateTime = oSql.FieldByName('DataFinal').AsDateTime) or  //Marcio Sanches Spinosa SOL 235271 PPM 446324
         (FormatDateTime('mm/yyyy', dDataEfetivacao) = FormatDateTime('mm/yyyy', oSql.FieldByName('DataFinal').asDateTime));
		 //Wylliam Silva SOL 247702 PPM 732173 - Fim
       oSql.Next;
      end;
      //Marcio Sanches Spinosa SOL 235271 PPM 446324 - Fim
   Finally
      oSql.Close;
      FreeAndNil(oLstSql);

      FreeAndNil(oSql);
   End;
End;

Function tProcessaDirfIndividual.VerificaExistenciaLinha97UmaPessoa: Boolean;
Var oSql: TClientDataSet;
   oLstSql: TStringList;
Begin
   oSql := TClientDataSet.Create(Nil);
   oLstSql := TStringList.Create;
   Try
      oLstSql.Text := 'Select distinct p.idpessoa' + #13 + #10 +
         'from (' + pai.sqlDadosIndividuais.SqlChanged + ') p' + #13 + #10 +
         'order by idpessoa';
      oSql.Data := pai.GetDataPacket(oLstSql.Text);
      Result := oSql.RecordCount = 1;
   Finally
      oSql.Close;
      FreeAndNil(oLstSql);
      FreeAndNil(oSql);
   End;
End;

Function tProcessaDirfIndividual.VerificaExistenciaLinha97PensaoAlimenticia: Boolean;
Var oSql: TClientDataSet;
   oLstSql: TStringList;
Begin
   oSql := TClientDataSet.Create(Nil);
   oLstSql := TStringList.Create;
   Try
      oLstSql.Text := 'Select distinct p.idpessoa, p.idInforme' + #13 + #10 +
         'from (' + pai.sqlDadosIndividuais.SqlChanged + ') p' + #13 + #10 +
         'where p.idInforme in (97,98)' + #13 + #10 +
         'order by idpessoa';
      oSql.Data := pai.GetDataPacket(oLstSql.Text);
      Result := Not oSql.isEmpty;
   Finally
      oSql.Close;
      FreeAndNil(oLstSql);
      FreeAndNil(oSql);
   End;
End;

Function tProcessaDirfIndividual.ValidaDataFinalMolestiaEDataFolhaPagamento(): Boolean;
Var oSql: TClientDataSet;
   oLstSql: TStringList;
Begin
   Result := False;
   oSql := TClientDataSet.Create(Nil);
   oLstSql := TStringList.Create;
   Try
      // SOL 191639 KTN 1849849 Otacilio aquino ** Inicio **
      oLstSql.Text := 'select idhstfolhabenef, /*dataefetivacao*/ (DATAPREVPAGTO - 1) AS DATAPREVPAGTO' + #13#10 +
         'from hstfolhabenef' + #13#10 +
         'where idhstfolhabenef = ' + IntToStr(pai.Versao);
      oSql.Data := pai.GetDataPacket(oLstSql.Text);
      If Not oSql.isEmpty Then
         Begin
            Result := (Pai.qryDadosIndividuais.FieldByName('DATAFIMMOLESTIA').asDateTime >=
               oSql.FieldByName('DATAPREVPAGTO').asDateTime) Or Pai.qryDadosIndividuais.FieldByName('DATAFIMMOLESTIA').isNull;
         End;
      // SOL 191639 KTN 1849849 Otacilio aquino ** Fim **
   Finally
      oSql.Close;
      FreeAndNil(oLstSql);
      FreeAndNil(oSql);
   End;
End;

Function tProcessaDirfIndividual.CalcularDadosIndividuais(TipoDirf: tTipoDirf): boolean;
Var bAlterouQuery: Boolean;
   bDefineIsentoIRRF: Boolean;
   bFazFiltro: Boolean;

   //-----------------------------------------------------------------------//
   // Higor Nayde Ferreira SOL 198077 ktn 1904811
   function _AvaliaHistoricoMolestiagrave(idpessoa: integer):boolean;
var qryAuxMolestia : TwwQuery;
   MesCobraca : String;     //higor
   dataprevpagto :TDateTime;  // :String;
   nulo : String;
   // SOL 207809 Otacilio
   //cdsMolestia: TClientDataSet;
   begin
        nulo:= '';
        // SOL 207809 Otacilio
        //cdsMolestia := TClientDataSet.Create(Nil);
        qryAuxMolestia := TwwQuery.Create(Nil);
        qryAuxMolestia.close;
        qryAuxMolestia.DatabaseName := 'BaseDados';
        qryAuxMolestia.sql.Clear;
        qryAuxMolestia.SQL.Add('select dataprevpagto, to_char(dataprevpagto,''yyyy/mm'') as MesMolestia');
        qryAuxMolestia.SQL.Add('from hstfolhabenef WHERE IDHSTFOLHABENEF = '+ IntToStr(pai.Versao));
        qryAuxMolestia.open;


        MesCobraca:= qryAuxMolestia.FieldByName('MesMolestia').AsString;
        dataprevpagto:=qryAuxMolestia.FieldByName('dataprevpagto').AsDatetime ;

        //// SOL 207809 Otacilio ** Inicio **
        {Ao verificar periodo de molestia buscar da propria query dos dados Individuais}
        {cdsMolestia.Data := Pai.GetDataPacket('SELECT DTInicio,DTFinal, to_char(DTInicio,''yyyy/mm'')as datames,'+ #13#10 +
                  'to_char(DTFinal,''yyyy/mm'')as datamesFinal FROM HSTMOLESTIAGRAVE  WHERE IDPESSOA = '+ IntToStr(idpessoa)); }




        result := False;
        if pai.qryDadosIndividuais.FieldbyName('DATAFIMMOLESTIA').IsNull then
        begin
          if  (pai.qryDadosIndividuais.FieldbyName('DATAMOLESTIAGRAVE').AsDateTime < dataprevpagto)
          and (pai.qryDadosIndividuais.FieldbyName('DATAFIMMOLESTIA').AsString <> EmptyStr)then//Marcio Sanches Spinosa SOL 218897 KINTANA 2050606
            Result := True;
        end
        else
        begin
          if (pai.qryDadosIndividuais.FieldbyName('DATAMOLESTIAGRAVE').AsDateTime < dataprevpagto) and
             (pai.qryDadosIndividuais.FieldbyName('DATAFIMMOLESTIA').AsDateTime > dataprevpagto) and
             (FormatDateTime('YYYY/MM', pai.qryDadosIndividuais.FieldbyName('DATAFIMMOLESTIA').AsDateTime) = MesCobraca) then
             Result := True;
        end;

        {If (cdsMolestia.RecordCount > 0) Then
         Begin
            cdsMolestia.First;
            While Not cdsMolestia.Eof Do
             begin
                 if(cdsMolestia.FieldByName('DTFinal').IsNull)then begin
                      if(cdsMolestia.FieldByName('DTInicio').AsDatetime < dataprevpagto)

                      then
                        result := True;

                  end else begin
                     if(cdsMolestia.FieldByName('DTInicio').AsDatetime < dataprevpagto) and
                      ((cdsMolestia.FieldByName('DTFinal').AsDatetime > dataprevpagto) or
                      (cdsMolestia.FieldByName('datamesFinal').AsString = MesCobraca))then begin
                          result := True;
                      end;

                 end;
                  cdsMolestia.next;
             end;
         end; }

        FreeAndNil(qryAuxMolestia);   // Rodrigo de Brito Figueredo SOL 200283 KINTANA 1929907

        //FreeAndNil(cdsMolestia);   // Rodrigo de Brito Figueredo SOL 200283 KINTANA 1929907

        // SOL 207809 Otacilio ** Fim **
   end;
   // Higor Nayde Ferreira SOL 198077 ktn 1904811
   Function _ValidaHistoricoMolestiaGrave_(Const pIdPessoa: Integer): Boolean;
   Begin
      Result := False;
      With pai.qryHistoricoMolestiaGrave Do
         Begin
            ParamByName('pIdPessoa').asInteger := pIdPessoa;
            Open;
            // Higor Nayde Ferreira SOL 198077 ktn 1904811
            Result:= _AvaliaHistoricoMolestiagrave(pIdPessoa);
            {While Not eof Do
               Begin
                  // Periodo -> 01/05/2010 à 31/05/2010
                  // Molestia Grave 1o. Caso -> 01/03/2010 ate 31/12/2010
                  //                2o. Caso -> 15/05/2010 ate 31/12/2010
                  //                3o. Caso -> 01/03/2010 até Agora (null)
                  //                4o. Caso -> 15/05/2010 até Agora (null)
                  //                5o. Caso -> 01/04/2010 ate 15/05/2010
                  //                6o. Caso -> 15/05/2010 até 25/05/2010
                  If ((FieldByName('DTInicio').asDateTime <= pai.DataFinal) And
                     ((FieldByName('DTFinal').asDateTime >= pai.DataInicial) Or
                     FieldByName('DTFinal').isNull)) Then
                     Begin
                        Result := True;
                        break;
                     End;
                  Next;
               End;}// Higor Nayde Ferreira SOL 198077 ktn 1904811
         End;
   End;
   //-----------------------------------------------------------------------//
   Function _ValidaMolestiaGrave_(Const pIdPessoa: Integer): Boolean;
   var qryAuxDataMolestia : TwwQuery; // Higor Nayde Ferreira SOL 198077 ktn 1904811
   Begin
   qryAuxDataMolestia := TwwQuery.Create(Nil);
      qryAuxDataMolestia.close;
      qryAuxDataMolestia.DatabaseName := 'BaseDados';
      qryAuxDataMolestia.sql.Clear;
      qryAuxDataMolestia.SQL.Add('select dataprevpagto, to_char(dataprevpagto,''yyyy/mm'') as MesMolestia');
      qryAuxDataMolestia.SQL.Add('from hstfolhabenef WHERE IDHSTFOLHABENEF = '+ IntToStr(pai.Versao));
      qryAuxDataMolestia.open;
      Result := _ValidaHistoricoMolestiaGrave_(pIdPessoa);
      If Not Result Then
         Begin
            If Pai.qryDadosIndividuais.fieldByname('DATAMOLESTIAGRAVE').IsNull Then
               Result := (Pai.qryDadosIndividuais.fieldByName('FLGMOLESTIAGRAVE').AsInteger = 1)
            Else
               Begin
                  Result := (Pai.qryDadosIndividuais.fieldByname('DATAMOLESTIAGRAVE').AsDateTime <= pai.DataFinal) And
                     (Pai.qryDadosIndividuais.fieldByname('FLGMOLESTIAGRAVE').AsInteger = 1);
                  If Not Result And (Pai.qryDadosIndividuais.FieldByName('PESSOA_FLGMOLESTIAGRAVE').asInteger <> -1) Then
                     Begin
                        If Pai.qryDadosIndividuais.FieldByName('PESSOA_FLGMOLESTIAGRAVE').asInteger = 0 Then
                           Result := ((Pai.qryDadosIndividuais.FieldbyName('DATAMOLESTIAGRAVE').asDateTime <= pai.DataFinal) And
                              (Pai.qryDadosIndividuais.FieldbyName('DATAMOLESTIAGRAVE').asDateTime <> 0)) And
                              ((Pai.qryDadosIndividuais.FieldByName('DATAFIMMOLESTIA').asDateTime >= pai.DataInicial) And
                              (Pai.qryDadosIndividuais.FieldByName('DATAFIMMOLESTIA').AsDateTime <> 0))

                        Else
						Result := (Pai.qryDadosIndividuais.FieldbyName('DATAMOLESTIAGRAVE').asDateTime <=
                               qryAuxDataMolestia.FieldbyName('dataprevpagto').asDateTime) And
                              ((Pai.qryDadosIndividuais.FieldByName('DATAFIMMOLESTIA').asDateTime >= pai.DataInicial) Or
                              (Pai.qryDadosIndividuais.FieldByName('DATAFIMMOLESTIA').AsDateTime = 0))

                           {Result := (Pai.qryDadosIndividuais.FieldbyName('DATAMOLESTIAGRAVE').asDateTime <= pai.DataFinal) And
                              ((Pai.qryDadosIndividuais.FieldByName('DATAFIMMOLESTIA').asDateTime >= pai.DataInicial) Or
                              (Pai.qryDadosIndividuais.FieldByName('DATAFIMMOLESTIA').AsDateTime = 0));}
						// Higor Nayde Ferreira SOL 198077 ktn 1904811
					End;
               End;
         End;

         FreeAndNil(qryAuxDataMolestia); // Rodrigo de Brito Figueredo SOL 200283 KINTANA 1929907

      // Alterado por Arnaldo Vicente Scarin em 06/10/2010
      // SOL: 143513 - Isençao Encerrada
      If Result And (Pai.qryDadosIndividuais.FieldbyName('DATAMOLESTIAGRAVE').asDateTime > 0) Then
         Result := ValidaDataFinalMolestiaEDataFolhaPagamento();
   End;
   //-----------------------------------------------------------------------//
   Function _DefinePropriedades_(Var iIdPessoa: Integer): Word;
   Var iAno, iMes, iDia: word;
      dDataComparaIdade: double;
      iMeses: integer;
   Begin
      //Bruno Bastos - Buscar data para verificar se a pessoa é idosa
      DecodeDate(Pai.qryDadosIndividuais.FieldByName('DATAPAGAMENTO').AsDateTime, iAno, iMes, iDia);

      //Bruno Bastos - 02/01/2009 - Início
      If Pai.TipoDirf In [td13Salario, td13SalBeneficioEncerrado] Then
         dDataComparaIdade := Pai.DataFinal
      Else
         dDataComparaIdade := DiasUteis.UltDiaMes(iAno, iMes);
      //Bruno Bastos - 02/01/2009 - Fim

      //Bruno Bastos - 02/01/2009 - dDataComparaIdade := DiasUteis.UltDiaMes(iAno, iMes);
      iMeses := DiasUteis.IntervaloMeses(Pai.qryDadosIndividuais.fieldByname('DATANASC').AsDateTime,
         dDataComparaIdade) div 12;

      //Marcio Sanches Spinosa SOL 228926 PPM 358284 - Inicio
      VerificaMesesIdade65 := DiasUteis.IntervaloMeses(Pai.qryDadosIndividuais.fieldByname('DATANASC').AsDateTime,
         dDataComparaIdade);
      //Marcio Sanches Spinosa SOL 228926 PPM 358284 - Fim
      // Arnaldo V. Scarin - 31/10/2008 - Sol: 94152 - Kintana: 404062
      // Regra de Negócio RN007 - Verificar Idade

      Idoso := (Not Pai.qryDadosIndividuais.fieldByname('DATANASC').IsNull) And
         (iMeses >= pai.qryParamIRRF.fieldByname('IDADEIDOSO').AsInteger);

      // Alterado por Arnaldo V. Scarin em 04/02/2011
      // Essa alteração faz com que os casos que o Beneficiário possua Ação Judicial
      // e mais de 65 anos, seja calculado o valor do idoso para a matricula da ação
      If bTem2IdPessoaeAcao And
         (pai.qryDadosIndividuais.FieldByName('IDPessoa').asInteger <> iIdPessoaProcJud) Then
         Begin
            Idoso := False;
         End;

      // Alterado Por Arnaldo V. Scarin em 13/12/2011 - SOL 169684 - KTN: 1515234
      // Essa alteração faz com que os calculos de Idoso não sejam considerados quando
      // o processamento for de pensão alimenticia Alimentado recebe (IDInforme 97 ou 98)
      If bTem2IdPessoaePALinha97 And Not bFazFiltro And Idoso Then
         Idoso := False;
      // Arnaldo V. Scarin - 31/10/2008 - Sol: 94152 - Kintana: 404062
      // Regra de Negócio RN005 - Isento Moléstia Grave

      { Testa se o recebedor está em molestia grave - Início }
      If pai.TipoDirf In [tdNormal, tdNormalMolestia] Then
         Begin
//            if (Pai.qryDadosIndividuais.FieldByName('DATAFIMMOLESTIA').ASSTRING <> EMPTYSTR) THEN XXXXXXX
            MolestiaGrave := _ValidaMolestiaGrave_(Pai.qryDadosIndividuais.FieldByName('IDRESPONSAVEL').AsInteger);
            IsentoIRRF := (pai.qryDadosIndividuais.fieldByName('FLGISENTOIRRF').AsString = '1');
            // Alterado por Arnaldo Vicente Scarin em 27/09/2010
            // SOL: 132334 - Fazer com que os isentos de IRRF tenham o mesmo tratamento da molestia grave
            If Not MolestiaGrave Then
               MolestiaGrave := IsentoIRRF;
         End;

      { Testa se o recebedor está em molestia grave - Fim }
      //Bruno Bastos - Kintana: 598749 - Sol: 122341 - 22/07/2009 - iIdPessoa        := Pai.qryDadosIndividuais.FieldByName('IDPESSOA').AsInteger;
      iIdPessoa := Pai.qryDadosIndividuais.FieldByName('IDRESPONSAVEL').AsInteger; //Bruno Bastos - Kintana: 598749 - Sol: 122341 - 22/07/2009

      // Alterado por Helen V. Bianchi em 28/07/2011 - Adioionei o if abaixo
      //SOL : 162179 - Estava travando a Busca para a Natureza: 0561
      If bTem2IdPessoaeAcao Or (bTem2IdPessoaePALinha97 And Not bTemUmaUnicaPessoa) Then
         iIdPessoa := Pai.qryDadosIndividuais.FieldByName('idpessoa').AsInteger
      Else
         iIdPessoa := Pai.qryDadosIndividuais.FieldByName('IDRESPONSAVEL').AsInteger;
      //SOL : 162179 - Fim

      IdPlanoPrev := Pai.qryDadosIndividuais.FieldByName('IDPLANOPREV').AsInteger;
      IdPlanoPrevidenc := Pai.qryDadosIndividuais.FieldByName('IDPLANOPREVIDENCIARIO').AsInteger;
      IdFoBenef := Pai.qryDadosIndividuais.FieldByName('IDHSTFOLHABENEF').AsInteger;
      CodigoNatureza := trim(Pai.qryDadosIndividuais.FieldByName('CODIRRFDARF').AsString);

      If ListaIdPessoa = '' Then
         ListaIdPessoa := IntToStr(iIdPessoa)
      Else
         Begin
            If Pos(IntToStr(iIdPessoa), ListaIdPessoa) = 0 Then
               ListaIdPessoa := ListaIdPessoa + ',' + IntToStr(iIdPessoa);
         End;

      IdMotivo := Pai.qryDadosIndividuais.FieldByName('IDMOTIVO').AsInteger;
      FlgPensaoAlim := Pai.qryDadosIndividuais.FieldByName('FLGPENSAOALIM').AsInteger;
      BaseSeparada := (Pai.qryDadosIndividuais.FieldByName('FLGSOMAIRSUPINSS').AsInteger = 0);
      Tem13oSalario := False;
      result := iAno;
      bAlterouQuery := False;
   End;
   //-----------------------------------------------------------------------//
   Function _CalculaMesVersaoFolha13Sal_(Const vDados: Variant;
      Const sMes: String): integer;
   Var oSql: TClientDataSet;

   Begin
      result := -1;

      oSql := TClientDataSet.Create(Nil);
      Try
         oSql.Data := vDados;
         oSql.Last;
         While Not oSql.Bof Do
            Begin
               //Higor Nayde Ferrerira  SOL - 198961 TKN 1914051 INICIO
               If ((FormatDateTime('mm', oSql.FieldByName('DataPagamento').asDateTime) <= sMes)or
                  ((FormatDateTime('mm', oSql.FieldByName('DataPagamento').asDateTime) ='12')
                   and (sMes = '11')))Then  //Higor Nayde Ferrerira  SOL - 198961 TKN 1914051 FIM
                  Begin
                     Result := oSql.FieldbyName('IdHstFolhaBenef').asInteger;
                     Break;
                  End
               Else
                  oSql.Prior;
            End;

      Finally
         FreeAndNil(oSql);
      End;
   End;
   //-----------------------------------------------------------------------//
   Function ValidaIsencaoIRRF(Var bJaDefinada: Boolean): boolean;
   Var rPos: TbookMark;
   Begin
      Result := False;
      bJaDefinada := True;
      rPos := pai.qryDadosIndividuais.GetBookmark;
      pai.qryDadosIndividuais.First;
      While Not pai.qryDadosIndividuais.eof Do
         Begin
            If pai.qryDadosIndividuais.FieldByName('IDHSTFOLHABENEF').AsInteger = pai.Versao Then
               Begin
                  Result := pai.qryDadosIndividuais.FieldByName('FLGISENTOIRRF').AsInteger = 1;
                  break;
               End;
            pai.qryDadosIndividuais.Next;
         End;
      pai.qryDadosIndividuais.GotoBookmark(rPos);
      pai.qryDadosIndividuais.FreeBookmark(rPos);
   End;

   //-----------------------------------------------------------------------//
   Function _VerificaEventosQuitacao13Salario_(Const iIdPessoa, iIdPlanoPrevidenciario: Integer): boolean;
   Var sSql: String;
      sMesQuitacao: String;
      oSql: TClientDataSet;
   Begin
      oSql := TClientDataSet.Create(Nil);
      Try
         sSql := 'Select idpessoa, Max(datafinal) as DataFinal' + #13#10 +
            'from benefbfciario' + #13#10 +
            'where idpessoa = ' + IntToStr(iIdPessoa) + #13#10 +
            '  and datafinal >= to_date(' + QuotedStr(FormatDateTime('01/01/yyyy', pai.DataInicial)) + ',''dd/mm/yyyy'')' + #13#10 +
            '  and datafinal <= to_date(' + QuotedStr(FormatDateTime('31/12/yyyy', pai.DataFinal)) + ',''dd/mm/yyyy'')' + #13#10 +
            '  and not exists (select 1 from benefbfciario bf2 ' + #13#10 +
            '                  where bf2.idsitbeneficio = 1' + #13#10 +
            '                    and bf2.idpessoa = ' + IntToStr(iIdPessoa) + ')' + #13#10 +
            'group by idPessoa';
         oSql.data := Pai.GetDataPacket(sSql);
         Result := Not oSql.IsEmpty And
            (oSql.FieldByName('DataFinal').asDateTime >= pai.DataInicial) And
            (oSql.FieldByName('DataFinal').asDateTime <= pai.DataFinal);
         If Result Then
            Begin
               If (Pai.qryDadosIndividuais.FieldByName('DataPagamento').AsDateTime >= pai.DataInicial) And
                  (Pai.qryDadosIndividuais.FieldByName('DataPagamento').asDateTime <= pai.DataFinal) Then
                      iVersaoFolha := Pai.qryDadosIndividuais.FieldbyName('IdhstFolhaBenef').asInteger;
            End
         Else
            Begin
               // Alterado por Arnaldo V. Scarin
               // Sol: 128371 Ktn: 686870
               If Not oSql.IsEmpty And
                  (oSql.FieldByName('DataFinal').asDateTime >= StrToDate(FormatDateTime('01/01/yyyy', pai.DataInicial))) And
                  (oSql.FieldByName('DataFinal').asDateTime <= pai.DataInicial - 1) Then
                  Begin
                     If Not (pai.TipoDirf in [td13Salario, td13SalBeneficioEncerrado]) Then      // Edilaine - SOL 199978 / KTN 1925538
                        Result := False
                     Else
                        Result := True;
                  End
               Else
                  Begin
                     oSql.Close;
                     sSql := 'Select IdPlanoPrev, MesPgAbono' + #13#10 +
                        'from planprev' + #13#10 +
                        'where IdPlanoPrev = ' + IntToStr(iIdPlanoPrevidenciario);
                     oSql.data := Pai.GetDataPacket(sSql);
                     sMesQuitacao := oSql.FieldByName('MesPgAbono').AsString;
                     Result := Not (oSql.IsEmpty) And (sMesQuitacao = FormatDateTime('mm', pai.DataFinal));
                     If Not Result Then
                        Result := (sMesQuitacao = '11') And(FormatDateTime('mm', pai.DataFinal) = '12');

                     // Edilaine - SOL 199978 / KTN 1925538
                     If Not Result Then
                     begin
                        Pai.qrySalarioNormal2.close;
                        Pai.qrySalarioNormal2.ParamByName('pLinhaAbono1').Value := pai.iLinhaAbonoAcima65;
                        Pai.qrySalarioNormal2.ParamByName('pLinhaAbono2').Value := pai.iLinhaAbonoAcima65INSS;
                        Pai.qrySalarioNormal2.ParamByName('pData').Value := Copy(Pai.qryDadosIndividuais.fieldByname('DATAPAGAMENTO').AsString, 7, 4);
                        Pai.qrySalarioNormal2.sql.Text := StringReplace( Pai.qrySalarioNormal2.sql.Text, ':CPF', QuotedStr(Trim(Pai.qryDadosIndividuais.fieldByname('CPFCNPJ').AsString)), [] );   // Edilaine - SOL 199978 / KTN 1925538
                        Pai.qrySalarioNormal2.Open;

                        Result := ((Pai.qrySalarioNormal2.FieldByName('VLRBASE65').asFloat > 0) and
                                  (Pai.qrySalarioNormal2.FieldByName('VLRBASE65').asFloat = ValorIdosofixo));
                     end;
                     // Edilaine - SOL 199978 / KTN 1925538 - fim

                        iVersaoFolha := _CalculaMesVersaoFolha13Sal_(pai.qryDadosIndividuais.Data, sMesQuitacao);
                  End;
            End;
         ExisteEventoQuitacao := Result;
      Finally
         FreeAndNil(oSql);
      End;
   End;
   //-----------------------------------------------------------------------//
   Procedure _VerificaFlagMolestiaGrave13Salario_(Const pIdPessoa: Integer;
      Const piIdPlanoPrevidenciario: Integer);
   Var sqlCds: TCMSqlParams;
      oAux: TClientDataSet;
      oCds: TClientDataSet;
   Begin
      _VerificaEventosQuitacao13Salario_(pIdPessoa, piIdPlanoPrevidenciario);
	  //Marcio Sanches Spinosa SOL 209527 Kintana 2021934 - Inicio
//      If Not ExisteEventoQuitacao Then
//         MolestiaGrave := _ValidaHistoricoMolestiaGrave_(pIdPessoa)
////            //          MolestiaGrave := False
//      Else
//         Begin
// Marcio Sanches Spinosa SOL 209527 Kintana 2021934 - Fim
            sqlCds := TCMSqlParams.Create(Nil);
            oAux := TclientDataSet.Create(Nil);
            oCds := TClientDataSet.Create(Nil);
            sqlCds.ClientDataSet := oAux;
            sqlCds.Sql.Text := 'Select M.*' + #13#10 +
               'from (' + #13#10 +
               '  Select distinct H.IdPessoa,' + #13#10 +
               '                  H.DataPagamento,' + #13 + #10 +
               '                  H.FLGMOLESTIAGRAVE,' + #13#10 +
               '                  H.PESSOA_FLGMOLESTIAGRAVE,' + #13#10 +
               '                  H.DATAMOLESTIAGRAVE,' + #13#10 +
               '                  H.DATAFIMMOLESTIA, ' + #13#10 +
               '                  H.FLGISENTOIRRF ' + #13#10 +
               '  from (' + pai.GetView13Salario(true) + ') H' + #13#10 +
               '  Where H.DataPagamento >= To_date(' + QuotedStr(FormatDateTime('01/01/yyyy', pai.DataInicial)) + ',''dd/mm/yyyy'')' + #13#10 +
               '    and H.DataPagamento <= To_date(' + QuotedStr(FormatDateTime('31/12/yyyy', pai.DataFinal)) + ',''dd/mm/yyyy'')' + #13#10 +
               '    and H.IdPessoa = ' + IntToStr(IdPessoa) + #13#10 +
               ') M' + #13#10 +
               'Order By DataPagamento Desc';
            AdicionaDadosClientDataSets(SqlCds, oCds);
            MolestiaGrave := (oCds.FieldByName('FlgMolestiaGrave').asInteger = 1);
            If Not bDefineIsentoIRRF Then
               IsentoIRRF := ValidaIsencaoIRRF(bDefineIsentoIRRF);
            DataEfetivacao := oCds.FieldByName('DataPagamento').asString;
            If Not MolestiaGrave And (oCds.FieldByName('PESSOA_FLGMOLESTIAGRAVE').AsInteger <> -1) Then
               Begin
                  If (oCds.FieldByName('PESSOA_FLGMOLESTIAGRAVE').AsInteger = 0) Then
                     MolestiaGrave := ((oCds.FieldbyName('DATAMOLESTIAGRAVE').asDateTime <= pai.DataFinal) And
                        (oCds.FieldbyName('DATAMOLESTIAGRAVE').asDateTime <> 0)) And
                        ((oCds.FieldByName('DATAFIMMOLESTIA').asDateTime >= pai.DataInicial) And
                        (oCds.FieldByName('DATAFIMMOLESTIA').AsDateTime <> 0))
                  Else
                     MolestiaGrave := (oCds.FieldbyName('DATAMOLESTIAGRAVE').asDateTime <= pai.DataFinal) And
                        ((oCds.FieldByName('DATAFIMMOLESTIA').asDateTime >= pai.DataInicial) Or
                        (oCds.FieldByName('DATAFIMMOLESTIA').AsDateTime = 0));
               End;
            // Alterado por Arnaldo Vicente Scarin em 27/09/2010
            // SOL: 132334 - Fazer com que os isentos de IRRF tenham o mesmo tratamento da molestia grave
            If Not MolestiaGrave Then
               MolestiaGrave := IsentoIRRF;
            oCds.Close;
            FreeAndNil(oCds);
            FreeAndNil(sqlCds);
            FreeAndNil(oAux);
//            bDefineIsentoIRRF := false;//Marcio Sanches Spinosa SOL 209527 Kintana 2021934
//         End;
   End;
   //-----------------------------------------------------------------------//
   Procedure _DefineValorIdosos_();
   Var sSql: String;
      bFazQuery: Boolean;
   Begin
      // Arnaldo V. Scarin - 31/10/2008 - Sol: 94152 - Kintana: 404062
      // Regra de Negócio RN008 - Calculo do Valor de Isenção
      bFazQuery := false;

      If Not (Pai.TipoDirf In [td13Salario, td13SalBeneficioEncerrado]) Then
         Begin
            If DataEfetivacao <> Pai.qryDadosIndividuais.FieldByName('DATAPAGAMENTO').AsString Then
               Begin
                  DataEfetivacao := Pai.qryDadosIndividuais.FieldByName('DATAPAGAMENTO').AsString;
                  bFazQuery := True;
               End;
         End
      Else
         Begin
            If DataEfetivacao = '' Then
               DataEfetivacao := LocalizaDataEfetivacao(pai.Versao);
            bFazQuery := True;
         End;

      If bFazQuery Then
         Begin
            sSql := 'SELECT VLRIDOSO AS VLRIDOSOS, ' + #13#10 +
               '       IDADEIDOSO ' + #13#10 +
               'FROM HSTPARAMIRRF   ' + #13#10 +
               'WHERE DATAINIVIGENCIA = (SELECT MAX(DATAINIVIGENCIA) ' + #13#10 +
               '                         FROM   HSTPARAMIRRF   ' + #13#10 +
               '                         WHERE  DATAINIVIGENCIA <= TO_DATE(' + QuotedStr(DataEfetivacao) + ',''DD/MM/YYYY''))';
            pai.qryParamIRRF.data := pai.GetDataPacket(sSql);
         End;
      //Wylliam Leite da Silva - SOL:246488 PPM:1026389 - Add condição (rValorIdoso13acum = 0)
      verificaPagamento13Anterior;
      if (TratamentoIdosoAbono = True) then
      begin
        If (ValorIdoso = 0) and (rValorIdoso13acum < ValorIdosoFixo) Then
           Begin
              ValorIdosoFixo := pai.qryParamIRRF.FieldByName('VLRIDOSOS').AsFloat;
              ValorIdoso := pai.qryParamIRRF.FieldByName('VLRIDOSOS').AsFloat;
              ValorIdoso13 := pai.qryParamIRRF.FieldByName('VLRIDOSOS').AsFloat;
           End
        Else
           If pai.TipoDirf In [td13Salario, td13SalBeneficioEncerrado] Then
              ValorIdoso13 := ValorIdoso
      end
      else
      begin
           If (ValorIdoso = 0) Then
           Begin
              ValorIdosoFixo := pai.qryParamIRRF.FieldByName('VLRIDOSOS').AsFloat;
              ValorIdoso := pai.qryParamIRRF.FieldByName('VLRIDOSOS').AsFloat;
              ValorIdoso13 := pai.qryParamIRRF.FieldByName('VLRIDOSOS').AsFloat;
           End
        Else
           If pai.TipoDirf In [td13Salario, td13SalBeneficioEncerrado] Then
              ValorIdoso13 := ValorIdoso
      end;
   End;
   //-----------------------------------------------------------------------//
   Procedure _VerificaListaRubricas_();
   Begin
      If (Pai.qryDadosIndividuais.FieldByName('FLGESPECIAL').AsInteger = 1) And
         (Not Pai.qryDadosIndividuais.FieldByName('IDINFORME').IsNull) Then
         Begin
            If Pai.lstRubricaEspecial.IndexOf(Pai.qryDadosIndividuais.FieldByName('IDPROVENTO').AsString) = -1 Then
               Pai.lstRubricaEspecial.Add(Pai.qryDadosIndividuais.FieldByName('IDPROVENTO').AsString);
         End;
   End;
   //-----------------------------------------------------------------------//
   Procedure _VerificaListaMotivoAtuHist_();
   Begin
      If Trim(ListaIdMotivoAtuHist) = '' Then
         ListaIdMotivoAtuHist := Pai.qryDadosIndividuais.FieldByName('IDMOTIVO').AsString
      Else
         If Pos(Pai.qryDadosIndividuais.FieldByName('IDMOTIVO').AsString, ListaIdMotivoAtuHist) = 0 Then
            ListaIdMotivoAtuHist := ListaIdMotivoAtuHist + ',' + Pai.qryDadosIndividuais.FieldByName('IDMOTIVO').AsString;
   End;
   //-----------------------------------------------------------------------//
   Procedure _CalculoSalarioNormalMolestiaGrave_(Var iLinhaInforme: Integer);
   Begin
      If (CodigoNatureza <> '3223') Then
         Begin
            If (Pai.qryDadosIndividuais.FieldByName('FLGBASE').AsString = 'S') Then
               Begin
                  If Pai.qryDadosIndividuais.FieldByName('CODDIRF').AsInteger <> 5 Then
                     Begin
                        If pai.qryInformeDePara.Locate('IDSITUACAO; IDINFORMEORIGEM', VarArrayOf(['1', Pai.qryDadosIndividuais.FieldByName('IDINFORME').AsString]), []) Then
                           iLinhaInforme := pai.qryInformeDePara.FieldByName('IDINFORMEDESTINO').AsInteger;
                     End
                  Else
                     Begin
                        If pai.qryInformeDePara.Locate('IDSITUACAO; IDINFORMEORIGEM', VarArrayOf(['1', Pai.qryDadosIndividuais.FieldByName('IDINFORME').AsString]), []) Then
                           Begin
                              iLinhaInforme := pai.qryInformeDePara.FieldByName('IDINFORMEDESTINO').AsInteger;
                           End;
                        iLinhaRend13 := Pai.qryDadosIndividuais.FieldByName('IDINFORME').AsInteger;
                     End;
               End;
         End
      Else
         Begin
            If (pai.qryParamFolha.Fieldbyname('PARAMRESGATE').asInteger = 1) Then
               Begin
                  If (Pai.qryDadosIndividuais.FieldByName('FLGBASE').AsString = 'S') Then
                     iLinhaInforme := Pai.qryDadosIndividuais.FieldByName('IDINFORME').AsInteger
                  Else
                     Begin
                        If (Pai.qryDadosIndividuais.FieldByName('FLGBASE').AsString = 'S') Then
                           iLinhaInforme := pai.iIdMolestiaGrave;
                     End;

                  If BaseSeparada Then
                     Begin
                        If Pai.qryDadosIndividuais.FieldByName('FONTEPAGADORA').AsInteger = 1 Then
                           iLinhaInforme := pai.iIdMolestiaGrave
                        Else
                           iLinhaInforme := pai.iIdMolestiaGraveINSS;
                     End;
               End;
         End;
   End;
   //-----------------------------------------------------------------------//
   Procedure _CalculoSalarioNormal_(Const iLinhaInforme: Integer;
      Var rValorLinha,
      rValorLinhaSinal: Double);
      //var sSql : String;
   Begin
      If Idoso Then
         Begin
            pai.qryAuxiliar.Close;

            If (Pai.qryDadosIndividuais.FieldByName('CODDIRF').AsInteger <> 5) And
               (rValorIdosoAcum = 0) And
               (pai.b65acumprimvez) Then
               Begin
                  pai.b65acumprimvez := False;
                  If iVersaoFolha = 0 Then
                     _VerificaEventosQuitacao13Salario_(IdPessoa, IdPlanoPrevidenc);
                  //Marcio Sanches Spinosa SOL 215733 KINTANA 2044850 - Inicio
                  Pai.qrySalarioNormal.SQL.Clear;
                  Pai.qrySalarioNormal.sql.Add(carregaQueryIndividual65Anos);
                  //Marcio Sanches Spinosa SOL 215733 KINTANA 2044850 - Fim

                  // Ricardo A. SOL 122339 KTN 599155
                  If ((FormatDateTime('MM', pai.DataInicial) = '02') Or
                     (iVersaoFolha < pai.Versao) And (iVersaoFolha <> 0)) And
                     Not bAlterouQuery Then
                     Begin
                        pai.qrySalarioNormal.SQL.Text := pai.qrySalarioNormal.SQL.Text + ' AND LI.IDINFORME <> 62';     // Edilaine - SOL 196824 / KTN 1884092 - de H. para LI.
                        bAlterouQuery := True;
                     End;

                  // Edilaine - SOL 212983 / KTN 2039612
                  Pai.qrySalarioNormal.ParamByName('pLinhaAbono1').Value := pai.iLinhaAcima65;
                  Pai.qrySalarioNormal.ParamByName('pLinhaAbono2').Value := pai.iLinhaAcima65INSS;
                  Pai.qrySalarioNormal.ParamByName('pData').Value := FormatDateTime('yyyy/mm', StrToDate(DataEfetivacao));
                  Pai.qrySalarioNormal.sql.Text := StringReplace( Pai.qrySalarioNormal.sql.Text, ':CPF', QuotedStr(Trim(Pai.qryDadosIndividuais.fieldByname('CPFCNPJ').AsString)), [] );

                  //Pai.qrySalarioNormal.ParamByName('pIdPessoa').Value := Pai.qryDadosIndividuais.FieldByName('IDPESSOA').AsInteger;
                  //Pai.qrySalarioNormal.ParamByName('pData').Value := FormatDateTime('yyyy/mm', StrToDate(DataEfetivacao));
                  // Edilaine - SOL 212983 / KTN 2039612 - fim

                  Pai.qrySalarioNormal.Open;
                  //pai.qryAuxiliar.data := pai.GetDataPacket(SSql);

                  If Not Pai.qrySalarioNormal.IsEmpty Then
                     rValorIdosoAcum := Pai.qrySalarioNormal.FieldByName('VLRBASE65').AsFloat;
                  // FIM Ricardo A. SOL 122339 KTN 599155
               End
            Else
               Begin
                  If (rValorIdoso13acum = 0) And
                     ((ExisteEventoQuitacao) or  // Edilaine - SOL 199978 / KTN 1925538
                     (Verifica62Folha13Salario)) and  //Marcio Sanches Spinosa SOL 219023 KINTANA 2054837
                     (pai.b65acumprimvezabono) Then
                     Begin
                        pai.b65acumprimvezabono := False;

                        // Ricardo A. SOL 122339 KTN 599155
                        Pai.qrySalarioNormal2.Close;
                        Pai.qrySalarioNormal2.sql.clear;
                        Pai.qrySalarioNormal2.sql.Add(carregaQueryIndividual65Anos13);
                        Pai.qrySalarioNormal2.ParamByName('pLinhaAbono3').Value := 141;
                        Pai.qrySalarioNormal2.ParamByName('pLinhaAbono1').Value := pai.iLinhaAbonoAcima65;
                        Pai.qrySalarioNormal2.ParamByName('pLinhaAbono2').Value := pai.iLinhaAbonoAcima65INSS;
                        Pai.qrySalarioNormal2.ParamByName('pData').Value := Copy(Pai.qryDadosIndividuais.fieldByname('DATAPAGAMENTO').AsString, 7, 4);
                        Pai.qrySalarioNormal2.ParamByName('pData1').Value := Pai.DataInicial;
                        //Pai.qrySalarioNormal2.ParamByName('pIdBenef').Value := Pai.qryDadosIndividuais.fieldByname('IDPESSOA').AsInteger;   // Edilaine - SOL 199978 / KTN 1925538 - comentado
                        Pai.qrySalarioNormal2.sql.Text := StringReplace( Pai.qrySalarioNormal2.sql.Text, ':CPF', QuotedStr(Trim(Pai.qryDadosIndividuais.fieldByname('CPFCNPJ').AsString)), [] );   // Edilaine - SOL 199978 / KTN 1925538
                        Pai.qrySalarioNormal2.Open;

                        If Not(Pai.qrySalarioNormal2.IsEmpty) Then
                        begin
                           rValorIdoso13acum := Pai.qrySalarioNormal2.FieldByName('VLRBASE65').AsFloat;
                        end;
                       // FIM Ricardo A. SOL 122339 KTN 599155
                     End;
               End;

            If Pai.qryDadosIndividuais.FieldByName('CODDIRF').AsInteger <> 5 Then
               Begin

                  Case Pai.qryDadosIndividuais.FieldByName('FONTEPAGADORA').AsInteger Of
                     1: Begin
                           rTotRend1 := rTotRend1 + Pai.qryDadosIndividuais.FieldByName('VALORSINAL').AsFloat;
                           iLinhaRend := iLinhaInforme;
                        End;
                     2: Begin
                          // Thiago Melo SOL 219219 Kintana 2051170
                          if Pai.qryDadosIndividuais.FieldByName('IDINFORME').AsInteger = iLinhaRRA then begin
                            rTotRend3 := rTotRend3 + Pai.qryDadosIndividuais.FieldByName('VALORSINAL').AsFloat;
                          // Thiago Melo SOL 219219 Kintana 2051170
                          end else begin
                           rTotRend2 := rTotRend2 + Pai.qryDadosIndividuais.FieldByName('VALORSINAL').AsFloat;
                           iLinhaRendINSS := iLinhaInforme;
                          end;
                        End;
                  End;

                  rValorLinha := 0;
                  rValorLinhaSinal := 0;

               End
            Else
               Begin
                  pai.qryRubricas.First;
                  If pai.qryRubricas.Locate('CODPROVDESC', Trim(Pai.qryDadosIndividuais.FieldByName('CODPROVDESC').AsString), []) Then
                     Begin
                        Case Pai.qryDadosIndividuais.FieldByName('FONTEPAGADORA').AsInteger Of
                           1: Begin
                                 rTotRend131A := rTotRend131A + Pai.qryDadosIndividuais.FieldByName('VALORSINAL').AsFloat;
                                 iLinhaRend13 := iLinhaInforme;
                              End;
                           2: Begin
                                 //Wylliam Leite da Silva - SOL:246488 PPM:1026389 - Início
                                 //if (iQtdDecVlrIdosoFixo <= 1) then
                                 //begin
                                   rTotRend132A := rTotRend132A + Pai.qryDadosIndividuais.FieldByName('VALORSINAL').AsFloat;
                                   iLinhaRend13INSS := iLinhaInforme;
                                 //end
                                 //else
                                 //begin
                                   //rTotRend132A := 0;
                                   //iLinhaRend13INSS := 0;
                                 //end;
                                 //Wylliam Leite da Silva - SOL:246488 PPM:1026389 - Fim
                              End;
                        End;
                     End
                  Else
                     Begin
                        Case Pai.qryDadosIndividuais.FieldByName('FONTEPAGADORA').AsInteger Of
                           1: Begin
                                 rTotRend131 := rTotRend131 + Pai.qryDadosIndividuais.FieldByName('VALORSINAL').AsFloat;
                                 iLinhaRend13 := iLinhaInforme;
                              End;
                           2: Begin
                                 //Wylliam Leite da Silva - SOL:246488 PPM:1026389 - Início
                                 //if (iQtdDecVlrIdosoFixo <= 1) then
                                 //begin
                                    rTotRend132 := rTotRend132 + Pai.qryDadosIndividuais.FieldByName('VALORSINAL').AsFloat;
                                    iLinhaRend13INSS := iLinhaInforme;
                                 //end
                                 //else
                                 //begin
                                    //rTotRend132 := 0;
                                    //iLinhaRend13INSS := 0;
                                 //end;
                                 //Wylliam Leite da Silva - SOL:246488 PPM:1026389 - Fim
                              End;
                        End;
                     End;
                  rValorLinha := 0;
                  rValorLinhaSinal := 0;
               End;
         End;
   End;
   //-----------------------------------------------------------------------//
   Function _VerificaRegraIT_(Const iIdPessoa: Integer): Boolean;
   Begin

      // Ricardo A. SOL 122339 KTN 599155
      Pai.qryVerificaRegraIT.ParamByName('pIdRegra').Value := Pai.iRegraInss;
      Pai.qryVerificaRegraIT.ParamByName('pIdPessoa').Value := iIdPessoa;
      Pai.qryVerificaRegraIT.Open;
      Result := Not Pai.qryVerificaRegraIT.IsEmpty;

      // FIM Ricardo A. SOL 122339 KTN 599155
   End;
   //-----------------------------------------------------------------------//
   Procedure _ZeraVariaveis_(Const pZera65anos: Boolean = true);
   Begin
      // Zera as linhas existentes, para que, se o processamento for em mais de
      // um mes, os valores não sejam acumulados
      Linhas.Clear;
      LinhasAbono.Clear;

      DataEfetivacao := '';
      ListaIdPlanoPrev := '';
      ListaIdMotivoAtuHist := '';
      ListaIdPessoa := '';

      rTotRend1 := 0;
      rTotRend2 := 0;
      rTotRend3 := 0; // Thiago Melo SOL 219219 Kintana 2051170
      rTotRend131 := 0;
      rTotRend132 := 0;
      rTotRend131A := 0;
      rTotRend132A := 0;
      rValorIdosoacum := 0;
      rValorIdoso13acum := 0;
      //ValorIdosoFixo := 0;  //Wylliam Leite da Silva - SOL:246488 PPM:1026389 - Fim
      //ValorIdoso := 0;      //Wylliam Leite da Silva - SOL:246488 PPM:1026389 - Fim

      rValIRRF := 0;
      rValBase := 0;
      rValIRRFINSS := 0;
      rValBaseINSS := 0;

      iLinhaRend13 := 0;
      iLinhaRend13INSS := 0;
      iLinhaRend := 0;
      iLinhaRendINSS := 0;
      iLinhaRRA := 0; // Thiago Melo SOL 219219 Kintana 2051170

      iLinhaAbonoOrigFund := 0;
      iLinhaAbonoOrigINSS := 0;
      iIdProcJudFund := 0;
      iIdProcJudINSS := 0;
      iIdPessoaProcJud := 0;

      pai.b65acumprimvez := pZera65anos;
      pai.b65acumprimvezabono := pZera65anos;
      rValIRRF := 0;
      rValBase := 0;
      rValIRRFINSS := 0;
      rValBaseINSS := 0;
   End;
   //-----------------------------------------------------------------------//
   Function _ExisteRegraBUA(Const IDProcJud, IdPessoa: Integer): Boolean;
   Var oSql: TClientDataSet;
   Begin
      oSql := TClientDataSet.Create(Nil);
      Try
         oSql.Data := pai.GetDataPacket('select distinct 1 from DETPROCJUD' + #13#10 +
            'where IDPROCJUD = ' + IntToStr(IdProcJud) + #13#10 +
            '   and IdPessoa = ' + IntToStr(IdPessoa) + #13#10 +
            '   and idregra in (25296,25297,25298,' + #13#10 + // BU1, BU2 E BU3
            '                   22323,22324,22356,' + #13#10 + // RA1, RA2 E RA3
            '                   25293,25294,25295,' + #13#10 + // PB1, PB2 E PB3
            '                   25289,25290,25291)'); // PC1, PC2 E PC3
         Result := Not oSql.isEmpty;
         oSql.Close;
      Finally
         FreeAndNil(oSql);
      End;
   End;
   //-----------------------------------------------------------------------//
   Function _IsFolhaCalculoBUA(Const IDProcJud, IdPessoa: Integer;
      Const pDataInicial, pDataFinal: TDateTime): Boolean;
   Var oSql: TClientDataSet;
   Begin
      oSql := TClientDataSet.Create(Nil);
      Try
         oSql.Data := pai.GetDataPacket('select IdProcJud,IdPessoa, DataInicio, DataFinal, sitprocesso from PROCJUD' + #13#10 +
            'where IDPROCJUD = ' + IntToStr(IdProcJud) + #13#10 +
            '   and IdPessoa = ' + IntToStr(IdPessoa));
         Result := Not oSql.isEmpty;
         If Result Then
            Begin
               // 05/06/2010 a 30/06/2010 -> 01/01/2010 a 31/01/2010 -> Falso
               //                         -> 01/06/2010 a 30/06/2010 -> Verdadeiro
               //                         -> 01/07/2010 a 31/07/2010 -> Falso
   //Marcio Sanches Spinosa SOL 219409 KINTANA 2052737 - Inicio
//               Result := {(((oSql.FieldByName('DataInicio').asDateTime >= pDataInicial) And
//                  (oSql.FieldByName('DataInicio').asDateTime <= pDataFinal)) And }
//                  ((oSql.FieldByName('DataFinal').asDateTime >= pDataInicial) {or
//                  (oSql.FieldByName('DataFinal').asDateTime <= pDataFinal))) }or oSql.FieldByName('DataFinal').IsNull)
//                  or (osql.FieldByName('SITPROCESSO').AsInteger = 0) ;

               Result := ((oSql.FieldByName('DataFinal').asDateTime <= pDataInicial) or oSql.FieldByName('DataFinal').IsNull)
                  or (osql.FieldByName('SITPROCESSO').AsInteger = 0) ;
// Marcio Sanches Spinosa SOL 219409 KINTANA 2052737 - Fim

            End;
      Finally
         FreeAndNil(oSql);
      End;

   End;
   //-----------------------------------------------------------------------//
   Procedure _VerificaExistenciaAcaoJudicial_();
      // var sSql : String;
   Begin
      VerificaSituacaoProcessoEncerrado(IdPessoa);//Marcio Sanches Spinosa SOL 235271 PPM 446324
      // Ricardo A. SOL 122339 KTN 599155
      Pai.qryVerificaExistenciaAcaoJudicial.close; //Bruno Bastos - Teste 11/07/2010

      Pai.qryVerificaExistenciaAcaoJudicial.ParamByName('pIdPessoa').Value := IdPessoa;
      Pai.qryVerificaExistenciaAcaoJudicial.ParamByName('pDataFinal').Value := pai.DataFinal;
      Pai.qryVerificaExistenciaAcaoJudicial.ParamByName('pDataInicial').Value := pai.DataInicial;
      Pai.qryVerificaExistenciaAcaoJudicial.ParamByName('pIdFolha').Value := pai.Versao;//Marcio Sanches Spinosa SOL 219474 KINTANA 2054063
      Pai.qryVerificaExistenciaAcaoJudicial.ParamByName('PMESCOBRANCA').Value := FormatDateTime('YYYY/MM', Pai.DataFinal);//Marcio Sanches Spinosa SOL 222275 KINTANA 2055206
      Pai.qryVerificaExistenciaAcaoJudicial.Open;

      //TemAcaoJudicial  := (pai.qryAuxiliar.FieldByName('TEMACAO').AsInteger = 1);
      TemAcaoJudicial := (Pai.qryVerificaExistenciaAcaoJudicial.FieldByName('TEMACAO').AsInteger = 1);
      //PercAcaoJudicial := pai.qryAuxiliar.FieldByName('PERCACAO').AsFloat;
      PercAcaoJudicial := Pai.qryVerificaExistenciaAcaoJudicial.FieldByName('PERCACAO').AsFloat;

      TemAcaoJudicialINSS := Pai.qryVerificaExistenciaAcaoJudicial.locate('IDINFORME', '169',[]);//Marcio Sanches Spinosa SOL 219474 KINTANA 2054063


      If TemAcaoJudicial Then
         Begin
            iIdPessoaProcJud := Pai.qryVerificaExistenciaAcaoJudicial.FieldbyName('IdPessoa').asInteger;
            //          iIdPessoaProcJud := Pai.qryDadosIndividuais.FieldbyName('IdPessoa').asInteger;
            //          If pai.TipoDirf in [td13Salario, td13SalBeneficioEncerrado] then
            iIdProcJudFund := Pai.qryVerificaExistenciaAcaoJudicial.FieldbyName('IdProcJud').asInteger;
         End;

      If TemAcaoJudicial Then
         Begin
            // Verifica se é uma ação judicial ou se é um BUA
            If _ExisteRegraBUA(iIdProcJudFund, idpessoa) Then
               // Se for um BUA, verifica se é o mes de cálculo
               // Se não for, ignora a ação judicial
               TemAcaoJudicial := _IsFolhaCalculoBUA(iIdProcJudFund, idpessoa, pai.DataInicial, pai.DataFinal);
         End;

      // Alterado por Arnaldo Vicente Scarin
      // Essa rotina foi adicionada, pois existe um erro quando a ação judicial termina antes da
      // efetivacao da folha, fazendo com que os valores de ação sejam considerados para os calculos
      // mensais, quando não deveria ser calculado.
      If TemAcaoJudicial
      and (pDataFimProcJud = 0) Then////Marcio Sanches Spinosa SOL 223865 KINTANA 2058724
         Begin
            TemAcaoJudicial := ValidaAcaoJudicialEDataFolhaPagamento(iIdProcJudFund);
            If Not TemAcaoJudicial Then
               Begin
                  iIdPessoaProcJud := 0;
                  iIdProcJudFund := 0;
                  pIprocjud167 := 0;//Marcio Sanches Spinosa SOL 235271 PPM 446324
               End;
         End;
         //Marcio Sanches Spinosa SOL 235271 PPM 446324 - Inicio
//         else
//           iIdProcJudFund := pIprocjud167 ; //Marcio Sanches Spinosa SOL 225765 KINTANA 2059367
         //Marcio Sanches Spinosa SOL 235271 PPM 446324 - Fim
      // FIM Ricardo A. SOL 122339 KTN 599155
   End;
   //-----------------------------------------------------------------------//
   Function PesquisaProcJud(Const pFiltro: String): Boolean;
   Var oQry: TClientDataSet;
      oSql: TStringList;
   Begin
      oQry := TCLientDataSet.Create(Nil);
      oSql := TStringList.Create;
      Try
         oSql.Text := 'Select FontePagadora,IdProcJud From (' + Pai.sqlDadosIndividuais.SQLChanged +
            ') Where CODIRRFDARF in (' + pFiltro + ') and IdProcJud <> 0';
         If Pos('  AND PD.FLGRUBRICA13SALARIO = 1', oSql.Text) > 0 Then
            Begin
               oSql.Text := StringReplace(oSql.Text,
                  'Select FontePagadora,',
                  'Select distinct FontePagadora,',
                  [rfReplaceAll]);
               oSql.Text := StringReplace(oSql.text,
                  '  AND PD.FLGRUBRICA13SALARIO = 1',
                  '--  AND PD.FLGRUBRICA13SALARIO = 1',
                  [rfReplaceAll]);
            End;
         oQry.Data := pai.GetDataPacket(oSql.Text);
         Result := Not oQry.IsEmpty;
         If Result Then
            Begin
               If (oQry.FieldByName('FONTEPAGADORA').AsInteger = 1) Then
                  iIdProcJudFund := oQry.fieldByname('IDPROCJUD').AsInteger
               Else
                  iIdProcJudINSS := oQry.fieldByname('IDPROCJUD').AsInteger;
            End;
      Finally
         oQry.Close;
         FreeAndNil(oSql);
         FreeAndNil(oQry);
      End;
   End;

   //-----------------------------------------------------------------------//
   Procedure _ValidaFazerDepositoOu65AnosSemValorAcao();
   Var oQry: TClientDataSet;
      oSql: TStringList;
   Begin
      oQry := TCLientDataSet.Create(Nil);
      oSql := TStringList.Create;
      Try
         oSql.Text := 'Select distinct p.idpessoa, pj.idprocjud, pj.flgfazdeposito' + #13 + #10 +
            'from (' + pai.sqlDadosIndividuais.SqlChanged + ') p, procjud pj' + #13 + #10 +
            'where p.idpessoa = pj.idpessoa(+)' + #13 + #10 +
            '  and ( (pj.Datafinal is Null) or' + #13 + #10 +
            '        To_Char(pj.dataFinal,''YYYYMM'') >= ' +
            QuotedStr(FormatDateTime('YYYYMM', Pai.qryDadosIndividuais.FieldByName('DataPagamento').asDateTime)) + ')' + #13 + #10 +
            //                        '  and pj.flgfazdeposito = 0'+#13+#10+
         'order by idpessoa';
         oQry.Data := pai.GetDataPacket(oSql.Text);
         If Not oQry.IsEmpty Then
            If TemAcaoJudicial And ((oQry.FieldByName('FlgFazDeposito').AsInteger = 0) Or Idoso) Then
               iIdProcJudFund := oQry.fieldByname('IDPROCJUD').AsInteger;
      Finally
         oQry.Close;
         FreeAndNil(oSql);
         FreeAndNil(oQry);
      End;
   End;
   //----------------------------------------------------------------------------------//
   Function _MudaDependentesParaOutraMatricula(Const lstIdPessoa: TStringList;
      Const IdPessoa: Integer): Boolean;
   Var iPos: Integer;
      iOutraMatricula: Integer;
      rPos: TBookMark;
   Begin
      iPos := lstIdPessoa.IndexOf(intToStr(IdPessoa));
      Result := (iPos <> -1);
      If Result Then
         Begin
            lstIdPessoa.Delete(iPos);
            iOutraMatricula := StrToInt(lstIdPessoa[0]);
            rPos := pai.qryDadosIndividuais.GetBookmark;
            Result := Not Pai.qryDadosIndividuais.Locate('IdPessoa;IDINFORME', VarArrayOf([iOutraMatricula, 91]), []);
            pai.qryDadosIndividuais.GotoBookmark(rPos);
            pai.qryDadosIndividuais.FreeBookmark(rPos);
            If Result Then
               lstIdPessoa.Add(IntToStr(IdPessoa));
         End;

   End;

    // higor Nayde Ferreira SOL - 197522 KTN - 1897639
    function VerificarInforme(): Boolean;
    var qryAux : TwwQuery;
    begin
        qryAux := TwwQuery.Create(Nil);
        qryAux.close;
        qryAux.DatabaseName := 'BaseDados';
        qryAux.sql.Clear;

        qryAux.Sql.Add('Select IdInforme');
        qryAux.Sql.Add('  From (Select l.iddarf,               ');
        qryAux.Sql.Add('               l.idlancirrf,               ');
        qryAux.Sql.Add('               pe.numdocumento,               ');
        qryAux.Sql.Add('               l.idbenefirrf,               ');
        qryAux.Sql.Add('               l.idhstfolhabenef,               ');
        qryAux.Sql.Add('               l.idprocjud,               ');
        qryAux.Sql.Add('               l.codnatureza,               ');
        qryAux.Sql.Add('               lx.idinforme,               ');
        qryAux.Sql.Add('               i.nomeinforme,               ');
        qryAux.Sql.Add('               i.coddirf,               ');
        qryAux.Sql.Add('               i.codinforme,               ');
        qryAux.Sql.Add('               round(lx.vlrlanc, 2) as vlrlanc,  ');
        qryAux.Sql.Add('               lx.flgtiporeg,               ');
        qryAux.Sql.Add('               l.flgpensaoalim,               ');
        qryAux.Sql.Add('               l.datapagamento,               ');
        qryAux.Sql.Add('               lx.fontepagadora,               ');
        qryAux.Sql.Add('               l.trgdtinclusao        ');
        qryAux.Sql.Add('          from lancirrf     l,');
        qryAux.Sql.Add('               lancxinforme lx,');
        qryAux.Sql.Add('               informe      i,');
        qryAux.Sql.Add('               pessoa       pe,');
        qryAux.Sql.Add('               (SELECT MAX(ANOVIGENCIA) AS ANOVIGENCIA, idinforme');
        qryAux.Sql.Add('                  FROM informe');
        qryAux.Sql.Add('                 WHERE ANOVIGENCIA <= '+ pai.Ano);  //   ''2012''');
        qryAux.Sql.Add('                 group by idinforme) QAX        ');
        qryAux.Sql.Add('         where l.idlancirrf = lx.idlancirrf              ');
        qryAux.Sql.Add('           and lx.idinforme = i.idinforme              ');
        qryAux.Sql.Add('           and l.idbenefirrf = pe.idpessoa              ');
        qryAux.Sql.Add('           and lx.idinforme = 91                        ');//William Moreira da Silva - SOL 198432 Kintana 1910001
        qryAux.Sql.Add('           and l.idbenefirrf in');
        qryAux.Sql.Add('               (Select idpessoa');
        qryAux.Sql.Add('                  from pessoa                ');
        qryAux.Sql.Add('                 where numdocumento = ' +quotedstr(pai.qryDadosIndividuais.fieldByName('CPFCNPJ').AsString) );//''42316065953''              ');//'+ IntToStr(ConverteListaPessoas));
        qryAux.Sql.Add('           )and to_char(l.datapagamento, ''yyyy'') = '+ pai.Ano);//''2012''');//+Ano);
        qryAux.Sql.Add('           and i.idinforme = qax.idinforme(+)              ');
        qryAux.Sql.Add('           and i.anovigencia = qax.anovigencia(+)        ');
        qryAux.Sql.Add('         order by idhstfolhabenef, idbenefirrf, idinforme)');
        qryAux.Sql.Add('         ORDER BY 1');

        try
          qryAux.open;

          //William Moreira da Silva - SOL 198432 Kintana 1910001
          result := (not qryAux.IsEmpty);

          // se não houver um IDINFORME 91 na lancxinforme, verificar se já foi processado (evitar que duas linhas 91 na
          // histrubsal sejam processadas
          if not result then
             result := Linhas.IndexOfLinha(91, Pai.qryDadosIndividuais.FieldByName('FONTEPAGADORA').AsInteger, CodigoNatureza) > -1;

          //result:= false;

        {while not qryAux.eof do  begin
          if (qryAux.FieldByName('IDINFORME').AsInteger = 91)then begin
             result := true;
             qryAux.Next;
          end else begin
             qryAux.Next;
          end;
        end;}

       Finally
          FreeAndNil(qryAux);
       End;
       //William Moreira da Silva - SOL 198432 Kintana 1910001

    end;
    // higor Nayde Ferreira SOL - 197522 KTN - 1897639

Var iLinhaInforme: Integer;
   iLinha: Integer;
   rValorLinha: Double;
   rValorLinhaSinal: Double;
   iFontePagadora: Integer;
   iPosicao: Integer;
   iPosDARF: Integer;
   sChave: String;
   sAnoMes: String;
   sMascara: String;
   lstNaturezaFonte: tStringList;
   CampoValidacao: String;
   bPodeCalcular: Boolean;
   lstIdPessoa: TStringList;
   bMudaDependente: Boolean;
   bRecalcula65Anos: Boolean;
Begin
   result := False;
   bMudaDependente := False;

   verificaQtdFontePagadoraINSS; // Thiago Melo SOL 219219 Kintana 2051170
   organizaValoresTotIRRF; // Thiago Melo SOL 219219 Kintana 2051170

   If pai.TipoDirf In [td13Salario, td13SalBeneficioEncerrado] Then
   begin
      sMascara := 'yyyy';
      Verifica62Folha13Salario := pai.qryDadosIndividuais.Locate('IDINFORME', '62', []); ////Marcio Sanches Spinosa SOL 219023 KINTANA 2054837
      Verifica61Folha13Salario := pai.qryDadosIndividuais.Locate('IDINFORME', '61', []); ////Marcio Sanches Spinosa SOL 219023 KINTANA 2054837
   end
   Else
   begin
      sMascara := 'yyyy/mm';
      Verifica62Folha13Salario := False; ////Marcio Sanches Spinosa SOL 219023 KINTANA 2054837
      Verifica61Folha13Salario := False;
   end;
   Try
      bPodeCalcular := True;

      Pai.qryDadosIndividuais.First;

      // Zera todas as variaveis para que todo o mes possa ser iniciado.
      _ZeraVariaveis_();

      // O Campo TEMACAO na view não funciona para todas as rubricas, pois ele está
      // vinculdado ao idprocjud, e dessa forma, não são todas as rubricas que trazem
      // a informação de ter rubrica.
      _VerificaExistenciaAcaoJudicial_();

      // Esse Select estava sendo executado para cada linha desnecessariamente
      // pois não são utilizados nenhum dado específico da linha da histrubsal
      ExisteRegraIT := _VerificaRegraIT_(IdPessoa);

      If pai.TipoDirf In [td13Salario, td13SalBeneficioEncerrado] Then
         _VerificaFlagMolestiaGrave13Salario_(Pai.qryDadosIndividuais.FieldByName('IDRESPONSAVEL').AsInteger,
            Pai.qryDadosIndividuais.FieldByName('IDPLANOPREVIDENCIARIO').AsInteger);

      lstIdPessoa := TStringList.Create;

      bTem2IdPessoaeAcao := VerificaExistenciaAcaoJudicialGravarSeparado(lstIdPessoa);
      bTem2IdPessoaePALinha97 := VerificaExistenciaLinha97PensaoAlimenticia();
      bTemUmaUnicaPessoa := VerificaExistenciaLinha97UmaPessoa();

      bFazFiltro := bTem2IdPessoaePALinha97;
      bRecalcula65Anos := True;

      While (true) Do
         Begin
            If bFazFiltro Then
               Begin
                  If pai.TipoDirf In [td13Salario, td13SalBeneficioEncerrado] Then
                     pai.qryDadosIndividuais.Filter := 'IdInforme <> 98'
                  Else
                     pai.qryDadosIndividuais.Filter := 'IdInforme <> 97';
                  pai.qryDadosIndividuais.Filtered := True;
               End;

            While Not Pai.qryDadosIndividuais.EOF Do
               Begin
                  {if not (sIDPESSOA = '') then
                   begin
                        if (sIDPESSOA <> Pai.qryDadosIndividuais.FieldByName('IDPESSOA').AsString) then
                           iQtdDecVlrIdosoFixo := 0;
                   end;}

                  sIDPESSOA:= Pai.qryDadosIndividuais.FieldByName('IDPESSOA').AsString;
                  sAnoMes := FormatDateTime(sMascara, Pai.qryDadosIndividuais.FieldByName('DataPagamento').asDateTime);

                  iAno := _DefinePropriedades_(IdPessoa);

                  // Esse calculo vai forçar que as rubricas de 13o salario, quando o que estiver
                  // sendo calculado for a parte de 13 salario não sejam processadas

                  // Edilaine - SOL 199978 / KTN 1925538 - comentado
                  {If pai.TipoDirf In [td13Salario, td13SalBeneficioEncerrado] Then
                     If Not ExisteEventoQuitacao Then
                        Exit;
                  } // Edilaine - SOL 199978 / KTN 1925538 - fim

                  lstNaturezaFonte := TStringList.Create;

                  While (sAnoMes = FormatDateTime(sMascara, Pai.qryDadosIndividuais.FieldByName('DataPagamento').asDateTime)) Do
                     Begin

                        // Arnaldo V. Scarin - 19/06/2011
                        // Essa variável foi criada para corrigir o problema de duplicação dos 65 anos quando existe
                        // Pensão Alimentícia - Alimentado Recebe, que está calculando errado, considerando esse valor
                        // como dedução de 65 anos.
                        If bFazFiltro Then
                           bRecalcula65Anos := True;

                        // Arnaldo V. Scarin - 31/10/2008 - Sol: 94152 - Kintana: 404062
                        // Regra de Negócio RN005 e RN009
                        // Essa regra não executa nenhum select, só atualiza os dados das propriedades do método.
                        // Não está sendo o gargalo do processamento
                        iAno := _DefinePropriedades_(IdPessoa);

                        // Arnaldo V. Scarin - 31/10/2008 - Sol: 94152 - Kintana: 404062
                        // Regra de Negócio RN008 - Calculo do Valor de Isenção
                        _DefineValorIdosos_();

                        // Arnaldo V. Scarin - 03/02/2011 - Essa alteração foi implementada especificamente para
                        // os casos de idosos que estejam calculando a Folha de resgate (3223), pois não devem
                        // ser calculados os valores de 65 anos para essa folha.

                        If (Pai.qryDadosIndividuais.FieldByName('CODIRRFDARF').asString = '3223') And Idoso Then
                           Idoso := False;

                        If pai.TipoDirf In [td13Salario, td13SalBeneficioEncerrado] Then
                           _VerificaFlagMolestiaGrave13Salario_(Pai.qryDadosIndividuais.FieldByName('IDRESPONSAVEL').AsInteger,
                              Pai.qryDadosIndividuais.FieldByName('IDPLANOPREVIDENCIARIO').AsInteger);

                        Try
                           // Bruno Bastos - Kintana: 598749 - Sol: 122341 - 21/07/2009 -
                           // While (Pai.qryDadosIndividuais.FieldByName('IDPESSOA').AsFloat           = IdPessoa)       and

                           // Arnaldo V. Scarin - Kintana:   - SOL: 133232 - 27/08/2010
                           // Como solicitado no SOL, os beneficiarios que tem 2 ou mais IDpessoas para o mesmo cpf
                           // e tem ação judical tem de ser gravados em Buscas diferentes, modifiquei novamente o código
                           // para que seja analisado corretamente a quebra.
                           // While (Pai.qryDadosIndividuais.FieldByName('IDResponsavel').AsFloat      = IdPessoa)       and

                           If bTem2IdPessoaeAcao Or (bTem2IdPessoaePALinha97 And Not bTemUmaUnicaPessoa) Then
                              CampoValidacao := 'IDPessoa'
                           Else
                              CampoValidacao := 'IDRESPONSAVEL';

                           While (Pai.qryDadosIndividuais.FieldByName(CampoValidacao).asFloat = IdPessoa) And //Bruno Bastos - Kintana: 598749 - Sol: 122341 - 21/07/2009
                           (trim(Pai.qryDadosIndividuais.FieldByName('CODIRRFDARF').AsString) = CodigoNatureza) And
                              //                  (Pai.qryDadosIndividuais.FieldByName('IDPLANOPREV').AsInteger      = IdPlanoPrev)    and
                           (Pai.qryDadosIndividuais.FieldByName('FLGPENSAOALIM').AsInteger = FlgPensaoAlim) And
                              (Not Pai.qryDadosIndividuais.EOF) Do
                              Begin
                                 // Alterado por Arnaldo V. Scarin em 22/09/2009
                                 // Sol: 124712 Kintana: 636056
                                 // Correção da rotina de busca, que apresenta problemas quando é feita a busca para um único
                                 // codigo de natureza (codIRRFDarf), e existem folhas diferentes.

                                 IdFoBenef := Pai.qryDadosIndividuais.FieldByName('IDHSTFOLHABENEF').AsInteger;

                                 IdPatro := Pai.qryDadosIndividuais.FieldByName('IDPESSJUR').AsInteger;
                                 IdPlanoPrev := Pai.qryDadosIndividuais.FieldByName('IDPLANOPREV').AsInteger;
                                 IdMotivo := Pai.qryDadosIndividuais.FieldByName('IDMOTIVO').AsInteger;
                                 IdModulo := Pai.qryDadosIndividuais.FieldByName('IDMODULO').AsInteger;
                                 CodigoCentroCusto := Pai.qryDadosIndividuais.FieldByName('CODCENTROCUSTO').AsString;
                                 CodigoCentroRespon := Pai.qryDadosIndividuais.FieldByName('CODCENTRORESPON').AsString;
                                 If ListaIdPlanoPrev = '' Then
                                    ListaIdPlanoPrev := Pai.qryDadosIndividuais.FieldByName('IDPLANOPREV').AsString
                                 Else
                                    Begin
                                       If Pos(Pai.qryDadosIndividuais.FieldByName('IDPLANOPREV').AsString, ListaIdPlanoPrev) = 0 Then
                                          ListaIdPlanoPrev := ListaIdPlanoPrev + ',' + Pai.qryDadosIndividuais.FieldByName('IDPLANOPREV').AsString;
                                    End;

                                 // Alterado por Arnaldo V. Scarin em 02/09/2010
                                 // SOL 133232 - Se existe a gravação individual, por que tem ação judicial,
                                 // pesquisa IdProcJud de forma diferenciada.
                                 If bTem2IdPessoaeAcao Then
                                    Begin
                                       If (TemAcaoJudicial) Then
                                          Begin
                                             If Not PesquisaProcJud('''7416'',''7431''') Then
                                                _ValidaFazerDepositoOu65AnosSemValorAcao();
                                          End;
                                    End
                                 Else
                                    Begin
                                       If (TemAcaoJudicial) Then
                                          Begin
                                             If ((Pai.qryDadosIndividuais.FieldByName('CODIRRFDARF').AsString = '7416') Or
                                                (Pai.qryDadosIndividuais.FieldByName('CODIRRFDARF').AsString = '7431')) Then
                                                Begin
                                                   If (Pai.qryDadosIndividuais.FieldByName('FONTEPAGADORA').AsInteger = 1) Then
                                                      iIdProcJudFund := Pai.qryDadosIndividuais.fieldByname('IDPROCJUD').AsInteger
                                                   Else
                                                      iIdProcJudINSS := Pai.qryDadosIndividuais.fieldByname('IDPROCJUD').AsInteger;
                                                End
                                             Else
                                                Begin
                                                   _ValidaFazerDepositoOu65AnosSemValorAcao();
                                                End;
                                          End;
                                    End;

                                 // Bruno Bastos - Kintana: 598749 - Sol: 122341 - 21/07/2009
                                 // While (Pai.qryDadosIndividuais.FieldByName('IDPESSOA').AsFloat           = IdPessoa)       and
                                 // Arnaldo V. Scarin
                                 // While (Pai.qryDadosIndividuais.FieldByName('IDRESPONSAVEL').AsFloat      = IdPessoa)       and //Bruno Bastos -  Kintana: 598749 - Sol: 122341 - 21/07/2009
                                 While (Pai.qryDadosIndividuais.FieldByName(CampoValidacao).asFloat = IdPessoa) And
                                    (Pai.qryDadosIndividuais.FieldByName('IDHSTFOLHABENEF').AsInteger = IdFoBenef) And
                                    (Pai.qryDadosIndividuais.FieldByName('IDPESSJUR').AsInteger = IdPatro) And
                                    //                    (Pai.qryDadosIndividuais.FieldByName('IDPLANOPREV').AsInteger      = IdPlanoPrev)    and
                                 (Pai.qryDadosIndividuais.FieldByName('FLGPENSAOALIM').AsInteger = FlgPensaoAlim) And
                                    (trim(Pai.qryDadosIndividuais.FieldByName('CODIRRFDARF').AsString) = CodigoNatureza) And
                                    (Not Pai.qryDadosIndividuais.EOF) Do
                                    Begin
				      // higor Nayde Ferreira SOL - 197522 KTN - 1897639
                                      if (Pai.qryDadosIndividuais.FieldByName('IDINFORME').AsInteger = 91)then
                                      begin
                                              if (VerificarInforme) then
                                              begin
                                                  Pai.qryDadosIndividuais.Next;
                                                  Continue;   //William Moreira da Silva - SOL 198432 Kintana 1910001
                                              end;
                                      end;                //William Moreira da Silva - SOL 198432 Kintana 1910001
                                      //else begin        //William Moreira da Silva - SOL 198432 Kintana 1910001 - comentado
				      // higor Nayde Ferreira SOL - 197522 KTN - 1897639

                                       // Se tem que gravar de forma diferencia, verifica se pode calcular a Ação Judicial para todos os
                                       // os IdPessoa (nesse caso só poderá ser calculada a ação judicial para o IdPessoa que tem a acao
                                       // e não para o outro IdPessoa.
                                       If bTem2IdPessoaeAcao Then
                                          bPodeCalcular := Pai.qryDadosIndividuais.FieldByName(CampoValidacao).asFloat = iIdPessoaProcJud
                                       Else
                                          bPodeCalcular := True;

                                       // os 2 métodos abaixo só verificam situações dos campos já existentes na qryDadosIndividuais
                                       // não causam impacto com processamento
                                       _VerificaListaRubricas_();
                                       _VerificaListaMotivoAtuHist_();
                                       If Not ValidaRubricaIndividual Then
                                          Begin
                                             Pai.qryDadosIndividuais.next;
                                             Continue;
                                          End;
                                       If pai.TipoDirf In [td13Salario, td13SalBeneficioEncerrado] Then
                                          Begin
                                             If ListaIdHstFolha = '' Then
                                                ListaIdHstFolha := Pai.qryDadosIndividuais.FieldbyName('IdhstFolhaBenef').asString
                                             Else
                                                Begin
                                                   If Pos(Pai.qryDadosIndividuais.FieldbyName('IdhstFolhaBenef').asString, ListaIdHstFolha) = 0 Then
                                                      ListaIdHstFolha := ListaIdHstFolha + ',' + Pai.qryDadosIndividuais.FieldbyName('IdhstFolhaBenef').asString;
                                                End;
                                             _VerificaEventosQuitacao13Salario_(IdPessoa, IdPlanoPrevidenc);
                                          End;
                                       iLinhaInforme := Pai.qryDadosIndividuais.FieldByName('IDINFORME').AsInteger;
                                       If pai.TipoDirf In [td13Salario, td13SalBeneficioEncerrado] Then
                                          Begin
                                             If Not ExisteEventoQuitacao And
                                                pai.qryProvDesc.Locate('IDPROVENTO', Pai.qryDadosIndividuais.Fieldbyname('IDPROVENTO').asInteger, []) and
                                                (not ((Pai.qryDadosIndividuais.FieldByName('DataPagamento').AsDateTime >= pai.DataInicial) And     // Edilaine - SOL 199978 / KTN 1925538
                                                      (Pai.qryDadosIndividuais.FieldByName('DataPagamento').asDateTime <= pai.DataFinal))) Then    // Edilaine - SOL 199978 / KTN 1925538
                                                Begin
                                                   Pai.qryDadosIndividuais.next;
                                                   Continue;
                                                End;
                                          End;

                                       If (iLinhaInforme = pai.iLinhaAcima65) Or
                                          (iLinhaInforme = pai.iLinhaAcima65INSS) Then
                                          Begin
                                             Pai.qryDadosIndividuais.next;
                                             Continue;
                                          End;
                                       // Alterado por Arnaldo V. Scarin, em 10/09/2010 - SOL 133232
                                       // Esse if foi adicionado para resolver o problema que NÃO pode ser
                                       // lançada dedução de dependentes para o beneficiário que tem ação
                                       // e que tem 2 idpessoas para o mesmo CPF
                                       If (pai.TipoDirf In [td13Salario, td13SalBeneficioEncerrado]) Then
                                          Begin
                                             // Alterado por Arnaldo V. Scarin, em 13/12/2010 - SOL 148777
                                             // Correção da Rotina de calculo dos dependentes de 13o salario.
                                             If (Pai.qryDadosIndividuais.FieldByName(CampoValidacao).asFloat = iIdPessoaProcJud) And
                                                bTem2IdPessoaeAcao And Not bTemUmaUnicaPessoa And
                                                bPodeCalcular And (iLinhaInforme = 91) Then
                                                Begin
                                                   bMudaDependente := _MudaDependentesParaOutraMatricula(lstIdPessoa, iIdPessoaProcJud);
                                                   If Not bMudaDependente Then
                                                      Begin
                                                         Pai.qryDadosIndividuais.next;
                                                         Continue;
                                                      End;
                                                End;
                                             // Alterado por Arnaldo V. Scarin em 14/04/2011 - SOL 151580.
                                             // A regra de negócio que envolve o cálculo dos dependentes para o 13o salario
                                             // foi modificada de forma que não sejam considerados os dependentes de ação
                                             // judicial (como anteriormente), os lançamentos de dependentes em folha adiantamento
                                             // de 13o. salario (como anteriormente) e agora, no caso do lançamento do dependente
                                             // estar relacionado ao recebedor de pensao alimenticia.
                                             If (iLinhaInforme = 91) And
                                                (pai.TipoDirf = td13Salario) And
                                                //(
                                                (pai.qryDadosIndividuais.FieldByName('IDHSTFOLHABENEF').asInteger <> Pai.Versao) //Or
                                                //(pai.qryDadosIndividuais.FieldByName('IDPESSOA').asInteger <> pai.qryDadosIndividuais.FieldByName('IDTITULAR').asInteger))
												//William Moreira da Silva - SOL 198432 Kintana 1910001
                                                Then
                                                Begin
                                                   Pai.qryDadosIndividuais.next;
                                                   Continue;
                                                End;
                                          End;

                                       rValorLinha := Pai.qryDadosIndividuais.FieldByName('VALOR').AsFloat;
                                       rValorLinhaSinal := Pai.qryDadosIndividuais.FieldByName('VALORSINAL').AsFloat;

                                       iFontePagadora := Pai.qryDadosIndividuais.FieldByName('FONTEPAGADORA').AsInteger;

                                       // guardando IDINFORME referente a RRA
                                       // Thiago Melo SOL 219219 Kintana 2051170
                                       if (CodigoNatureza = '1889') and (Pai.qryDadosIndividuais.FieldByName('FLGBASE').AsString = 'S') and (iLinhaRRA = 0) then begin
                                          iLinhaRRA := iLinhaInforme;
                                       end;
                                       // Thiago Melo SOL 219219 Kintana 2051170


                                       iPosDARF := CodigoNaturezas.IndexOfNatureza(CodigoNatureza, iFontePagadora);
                                       If iPosDARF = -1 Then
                                          Begin
                                             CodigoNaturezas.Adiciona(CodigoNatureza, FlgPensaoAlim, iFontePagadora);
                                             iPosDARF := CodigoNaturezas.Count - 1;
                                             sChave := Format('%s-%d', [CodigoNatureza, iFontePagadora]);
                                             If lstNaturezaFonte.IndexOf(sChave) = -1 Then
                                                lstNaturezaFonte.AddObject(sChave, Pointer(iPosDARF));
                                          End;
                                       { Guardar o valor de IRRF nas variáveis }
                                       If Pai.qryDadosIndividuais.FieldByName('FLGIRRF').AsString = 'S' Then
                                          Begin
                                             If (Pai.qryDadosIndividuais.FieldByName('FLGESPECIAL').AsInteger = 0) Then
                                                Begin
                                                   If (iFontePagadora = 1)
                                                      or (Not BaseSeparada And (lstNaturezaFonte.Count = 1)) Then  //Marcio Sanches Spinosa SOL 218322 KINTANA 2049567
                                                      Begin
                                                         rValIRRF := rValIRRF + (Pai.qryDadosIndividuais.FieldByName('VALORSINAL').AsFloat * -1);
                                                         rValBase := rValBase + Pai.qryDadosIndividuais.FieldByName('VALORINFO').AsFloat;
                                                      End
                                                   Else
                                                      Begin
                                                         rValIRRFINSS := rValIRRFINSS + (Pai.qryDadosIndividuais.FieldByName('VALORSINAL').AsFloat * -1);
                                                         rValBaseINSS := rValBaseINSS + Pai.qryDadosIndividuais.FieldByName('VALORINFO').AsFloat;
                                                      End;
                                                   idPlanoContab := Pai.qryDadosIndividuais.FieldByName('PLANOCONTAB').AsInteger;
                                                   CodigoTipoRecDes := Pai.qryDadosIndividuais.FieldByname('CODTIPRECDES').AsString;
                                                   PlanoContaCredito := Pai.qryDadosIndividuais.FieldByname('PLACONTAC').AsString;
                                                End;
                                          End;

                                       If idPlanoContab = 0 Then
                                          idPlanoContab := Pai.qryDadosIndividuais.FieldByName('PLANOCONTAB').AsInteger;

                                       If CodigoTipoRecDes = '' Then
                                          CodigoTipoRecDes := Pai.qryDadosIndividuais.FieldByname('CODTIPRECDES').AsString;

                                       If PlanoContaCredito = '' Then
                                          PlanoContaCredito := Pai.qryDadosIndividuais.FieldByname('PLACONTAC').AsString;

                                       If (Pai.qryDadosIndividuais.FieldByName('FLGBASE').AsString = 'S') Or
                                          (Pai.qryDadosIndividuais.FieldByName('CODDIRF').AsInteger = 5) Then
                                          Begin
                                             If bPodeCalcular Then
                                                Begin
                                                   If MolestiaGrave
                                                   and IsentoIRRF Then//Marcio Sanches Spinosa SOL 209527 Kintana 2021934
                                                      _CalculoSalarioNormalMolestiaGrave_(iLinhaInforme)
                                                   Else
                                                      _CalculoSalarioNormal_(iLinhaInforme, rValorLinha, rValorLinhaSinal);
                                                End;
                                          End;

                                       If (Pai.qryDadosIndividuais.FieldByName('CODDIRF').AsInteger = 5) Then
                                          Begin
                                             Tem13oSalario := True;
                                             If Pai.qryDadosIndividuais.FieldByName('FONTEPAGADORA').AsInteger = 1 Then
                                                iLinhaAbonoOrigFund := Pai.qryDadosIndividuais.FieldByName('IDINFORME').AsInteger
                                             Else
                                                iLinhaAbonoOrigINSS := Pai.qryDadosIndividuais.FieldByName('IDINFORME').AsInteger;
                                          End;

                                       If rValorLinha <> 0 Then
                                          Begin
                                             // Acao Judicial
                                             If TemAcaoJudicial And
                                                ((iFontePagadora = 1) Or ExisteRegraIT) And
                                                (Pai.qryDadosIndividuais.fieldByname('FLGBASE').AsString = 'S') And
                                                ((CodigoNatureza <> '3223') And (CodigoNatureza <> '5565')) And
                                                (Not MolestiaGrave) And
                                                (FlgPensaoAlim <> 2) And
                                                bPodeCalcular
                                                and (pDataFimProcJud = 0) Then
                                                Begin
                                                   { Trata linha do informe mensal de ação judicial e normal }
                                                   If (Pai.qryDadosIndividuais.fieldByname('CODDIRF').AsString <> '5') Then
                                                      Begin
                                                         If iFontePagadora = 2 Then
                                                            iLinha := pai.iLinhaAcaoJudicialInss
                                                         Else
                                                            iLinha := pai.iLinhaRendAcJud;

                                                         iPosicao := Linhas.IndexOfLinha(iLinha, iFontePagadora, CodigoNatureza);
                                                         If iPosicao > -1 Then
                                                            Begin
                                                               Linhas[iPosicao].AtualizarValores(RoundCM((rValorLinha * PercAcaoJudicial) / 100, 2),
                                                                  RoundCM((rValorLinhaSinal * PercAcaoJudicial) / 100, 2));
                                                            End
                                                         Else
                                                            Begin
                                                               Linhas.AdicionarValores(iLinha,
                                                                  RoundCM((rValorLinha * PercAcaoJudicial) / 100, 2),
                                                                  RoundCM((rValorLinhaSinal * PercAcaoJudicial) / 100, 2),
                                                                  iFontePagadora,
                                                                  CodigoNatureza,
                                                                  FlgPensaoAlim);
                                                            End;

                                                         If iFontePagadora = 2 Then
                                                            iLinhaInforme := pai.iLinhaAcaoJudicialInss;

                                                         iPosicao := Linhas.IndexOfLinha(iLinhaInforme, iFontePagadora, CodigoNatureza);

                                                         If iPosicao > -1 Then
                                                            Begin
                                                               Linhas[iPosicao].AtualizarValores(RoundCM((rValorLinha * (100 - PercAcaoJudicial)) / 100, 2),
                                                                  RoundCM((rValorLinhaSinal * (100 - PercAcaoJudicial)) / 100, 2));
                                                            End
                                                         Else
                                                            Begin
                                                               Linhas.AdicionarValores(iLinhaInforme,
                                                                  RoundCM((rValorLinha * (100 - PercAcaoJudicial)) / 100, 2),
                                                                  RoundCM((rValorLinhaSinal * (100 - PercAcaoJudicial)) / 100, 2),
                                                                  iFontePagadora,
                                                                  CodigoNatureza,
                                                                  FlgPensaoAlim);
                                                            End;
                                                      End
                                                   Else
                                                      Begin
                                                         { Trata Linha do Informe de Décimo terceiro de ação judicial e normal }


                                                         If iFontePagadora = 2 Then
                                                            iLinha := pai.iLinhaAcaoJudicialInss13
                                                         Else
                                                            iLinha := pai.iLinhaRendAcJud13;

                                                         iPosicao := Linhas.IndexOfLinha(iLinha, iFontePagadora, CodigoNatureza);
                                                         If iPosicao > -1 Then
                                                            Begin
                                                               Linhas[iPosicao].AtualizarValores(RoundCM((rValorLinha * PercAcaoJudicial) / 100, 2),
                                                                  RoundCM((rValorLinhaSinal * PercAcaoJudicial) / 100, 2));
                                                            End
                                                         Else
                                                            Begin
                                                               Linhas.AdicionarValores(iLinha,
                                                                  RoundCM((rValorLinha * PercAcaoJudicial) / 100, 2),
                                                                  RoundCM((rValorLinhaSinal * PercAcaoJudicial) / 100, 2),
                                                                  iFontePagadora,
                                                                  CodigoNatureza,
                                                                  FlgPensaoAlim);
                                                            End;

                                                         If iFontePagadora = 2 Then
                                                            iLinhaInforme := Pai.iLinhaAcaoJudicialInss;

                                                         iPosicao := Linhas.IndexOfLinha(iLinhaInforme, iFontePagadora, CodigoNatureza);
                                                         If iPosicao > -1 Then
                                                            Begin
                                                               Linhas[iPosicao].AtualizarValores(RoundCM((rValorLinha * (100 - PercAcaoJudicial)) / 100, 2),
                                                                  RoundCM((rValorLinhaSinal * (100 - PercAcaoJudicial)) / 100, 2));
                                                            End
                                                         Else
                                                            Begin
                                                               Linhas.AdicionarValores(iLinhaInforme,
                                                                  RoundCM((rValorLinha * (100 - PercAcaoJudicial)) / 100, 2),
                                                                  RoundCM((rValorLinhaSinal * (100 - PercAcaoJudicial)) / 100, 2),
                                                                  iFontePagadora,
                                                                  CodigoNatureza,
                                                                  FlgPensaoAlim);
                                                            End;
                                                      End;
                                                End
                                             Else
                                                Begin
                                                   If MolestiaGrave
                                                   and IsentoIRRF Then//Marcio Sanches Spinosa SOL 209527 Kintana 2021934
                                                      Begin
                                                         If pai.qryInformeDePara.Locate('IDSITUACAO; IDINFORMEORIGEM', VarArrayOf(['1', Pai.qryDadosIndividuais.FieldByName('IDINFORME').AsString]), []) Then
                                                            iLinhaInforme := pai.qryInformeDePara.FieldByName('IDINFORMEDESTINO').AsInteger;
                                                      End;

                                                   iPosicao := Linhas.IndexOfLinha(iLinhaInforme, iFontePagadora, CodigoNatureza);
                                                   If (iPosicao > -1) Then
                                                      Begin
                                                        if not (iLinhaInforme = 89) then//Marcio Sanches Spinosa SOL 207209 Kintana 2028864
                                                         Linhas[iPosicao].AtualizarValores(RoundCM(rValorLinha, 2),
                                                            RoundCM(rValorLinhaSinal, 2));
                                                      End
                                                   Else
                                                      Begin
                                                        //Marcio Sanches Spinosa SOL 219474 KINTANA 2054063 - Inicio
                                                        if (TemAcaoJudicialINSS) and (iLinhaInforme in [45,61]) then
                                                         Linhas.AdicionarValores(iif((iLinhaInforme = 45), pai.iLinhaAcaoJudicialInss,pai.iLinhaAcaoJudicialInss13),
                                                            RoundCM(rValorLinha, 2),
                                                            RoundCM(rValorLinhaSinal, 2),
                                                            iFontePagadora,
                                                            CodigoNatureza,
                                                            FlgPensaoAlim)
                                                         else
                                                         Linhas.AdicionarValores(iLinhaInforme,
                                                            RoundCM(rValorLinha, 2),
                                                            RoundCM(rValorLinhaSinal, 2),
                                                            iFontePagadora,
                                                            CodigoNatureza,
                                                            FlgPensaoAlim);
                                                            //Marcio Sanches Spinosa SOL 219474 KINTANA 2054063 - Fim
                                                      End;
                                                End;
                                          End;

                                          Pai.qryDadosIndividuais.Next;
                                       //end;  //William Moreira da Silva - SOL 198432 Kintana 1910001 - comentado
                                    End;
                              End;

                           //          iPosDARF := CodigoNaturezas.IndexOfNatureza(CodigoNatureza,iOldFontePagadora);
                           iFontePagadora := 1;
                           For iPosicao := 0 To lstNaturezaFonte.Count - 1 Do
                              Begin
                                 iPosDARF := lstNaturezaFonte.IndexOf(Format('%s-%d', [CodigoNatureza, iFontePagadora]));
                                 If (iPosicao = lstNaturezaFonte.Count - 1) And (iPosDARF = -1) Then
                                    Begin
                                       iPosDARF := lstNaturezaFonte.IndexOf(Format('%s-%d', [CodigoNatureza, 2]));
                                       iFontePagadora := 2;
                                    End;
                                 // Alterado por Arnaldo V. Scarin - em 02/06/2009
                                 // Esse If Precisa ficar separado, para poder validar corretamente os dados
                                 // que são armazenados na variavel iPosDarf, pois ela será mudada de acordo
                                 // com o ponteiro de array que está armazenado dentro o Objeto do StringList
                                 If iPosDARF > -1 Then
                                    iPosDARF := Integer(lstNaturezaFonte.Objects[iPosDARF]);

                                 If iPosDARF > -1 Then
                                    Begin
                                       If (iFontePagadora = 1) Or (Not BaseSeparada And (lstNaturezaFonte.Count = 1)) Then
                                          Begin
                                             CodigoNaturezas[iPosDARF].rValBase := CodigoNaturezas[iPosDARF].rValBase + rValBase;
                                             CodigoNaturezas[iPosDARF].rValIRRF := CodigoNaturezas[iPosDARF].rValIRRF + rValIRRF;
                                             rValBase := 0;
                                             rValIRRF := 0;
                                          End
                                       Else
                                          Begin
                                             CodigoNaturezas[iPosDARF].rValBaseINSS := CodigoNaturezas[iPosDARF].rValBaseINSS + rValBaseINSS;
                                             CodigoNaturezas[iPosDARF].rValIRRFINSS := CodigoNaturezas[iPosDARF].rValIRRFINSS + rValIRRFINSS;
                                             rValBaseINSS := 0;
                                             rValIRRFINSS := 0;
                                          End;
                                       CodigoNaturezas[iPosDARF].rTotRend1 := rTotRend1;
                                       CodigoNaturezas[iPosDARF].rTotRend2 := rTotRend2;
                                       // Thiago Melo SOL 219219 Kintana 2051170
                                       if SomaValoresTotNatureza(CodigoNaturezas[iPosDARF].CodigoNatureza) = rTotRend3 then begin
                                         CodigoNaturezas[iPosDARF].rTotRend3 := rTotRend3;
                                       end;
                                       // Thiago Melo SOL 219219 Kintana 2051170

//                                       CodigoNaturezas[iPosDARF].rTotalRend13 := rTotRend131 + rTotRend132;
//                                       CodigoNaturezas[iPosDARF].rTotalRend13A := rTotRend131A + rTotRend132A;

                                       CodigoNaturezas[iPosDARF].rTotalRend13 := rTotRend131 + rTotRend131A ;
                                       CodigoNaturezas[iPosDARF].rTotalRend13A := rTotRend132 + rTotRend132A;

                                       If Pos(IntToStr(FlgPensaoAlim), CodigoNaturezas[iPosDARF].FlgPensaoAlim) = 0 Then
                                          CodigoNaturezas[iPosDARF].FlgPensaoAlim := CodigoNaturezas[iPosDARF].FlgPensaoAlim + ',' + IntToStr(FlgPensaoAlim)
                                       Else
                                          CodigoNaturezas[iPosDARF].FlgPensaoAlim := IntToStr(FlgPensaoAlim);
                                    End;
                                 inc(iFontePagadora);
                                 Result := True
                              End;
                        Except
                           On E: Exception Do
                              Begin
                                 Result := False;
                                 Pai.qryDadosIndividuais.Next;
                                 MostraMensagem('Verificar o IdPessoa: ' + IntToStr(IdPessoa));
                                 pai.MessageInfo := E.Message;
                              End;
                        End;
                        // Alterado por Arnaldo V. Scarin, em 30/08
                        // Ocorrerá a gravação nesse ponto, pois, se o beneficiário tem situação de 2 idpessoas e
                        // ação judicial para um deles, deverá ser gravada a busca de forma separada.
                        If Result And (bTem2IdPessoaeAcao Or (bTem2IdPessoaePALinha97 And Not bTemUmaUnicaPessoa)) Then
                           Begin
                              ValidaIdosoeAbono(bPodeCalcular, TipoDirf);
                              result := GravarDados(sAnoMes, True);

                              Linhas.Clear;
                              lstNaturezaFonte.Clear;
                              CodigoNaturezas.Clear;
                              // Essas Rotinas estão aqui para forçar o zeramento do processo, para ser calculado corretamente os dados.

                              // Zera todas as variaveis para que todo o mes possa ser iniciado.
                              _ZeraVariaveis_();

                              // O Campo TEMACAO na view não funciona para todas as rubricas, pois ele está
                              // vinculdado ao idprocjud, e dessa forma, não são todas as rubricas que trazem
                              // a informação de ter rubrica.
                              _VerificaExistenciaAcaoJudicial_();

                              // Esse Select estava sendo executado para cada linha desnecessariamente
                              // pois não são utilizados nenhum dado específico da linha da histrubsal
                              ExisteRegraIT := _VerificaRegraIT_(IdPessoa);

                              If pai.TipoDirf In [td13Salario, td13SalBeneficioEncerrado] Then
                                 _VerificaFlagMolestiaGrave13Salario_(Pai.qryDadosIndividuais.FieldByName('IDRESPONSAVEL').AsInteger,
                                    Pai.qryDadosIndividuais.FieldByName('IDPLANOPREVIDENCIARIO').AsInteger);

                           End;

                        If Pai.qryDadosIndividuais.Eof Then
                           Break
                        Else If pai.TipoDirf In [td13Salario, td13SalBeneficioEncerrado] Then
                           Begin
                              MolestiaGrave := False;
                              IsentoIRRF := False;
                              bDefineIsentoIRRF := False; // Thiago Melo SOL 219227 Kintana 2051925
                           End;

                     End;

                  If Result And Not bTem2IdPessoaeAcao And (Not bTem2IdPessoaePALinha97 Or bTemUmaUnicaPessoa) Then
                     Begin
                        If Not bRecalcula65Anos Then
                           Begin
                              ValorIdoso := 0;
                              ValorIdoso13 := 0;
                              ValorIdosoFixo := 0;
                           End;

                        //Wylliam Leite da Silva - SOL:246488 PPM:1026389 - Inicio
                        ValidaIdosoeAbono(bPodeCalcular, TipoDirf);
                        //if (iQtdDecVlrIdosoFixo <= 1) then
                        result := GravarDados(sAnoMes, False);
                        //Wylliam Leite da Silva - SOL:246488 PPM:1026389 - Fim
                        _ZeraVariaveis_(false);
                        bRecalcula65Anos := False;
                        Linhas.Clear;
                        lstNaturezaFonte.clear;
                        CodigoNaturezas.Clear;
                     End;
               End;
               // Wylliam Leite da Silva - SOL:246488 PPM:1026389 - Início
               {if (ValorIdoso <> 0) and (VerificaIdosoAbonoINSS = True) then
               begin
                 LinhasAbono.AdicionarValores(124,
                   RoundCM((ValorIdoso ) , 2),
                   RoundCM((ValorIdoso  ) , 2),
                   2,
                   CodigoNatureza,
                   FlgPensaoAlim,
                   'D');

                 LinhasAbono.AdicionarValores(61,
                   RoundCM((ValorIdoso * -1) , 2),
                   RoundCM((ValorIdoso  * -1) , 2),
                   2,
                   CodigoNatureza,
                   FlgPensaoAlim,
                   'D');

                   //CodigoNatureza, FlgPensaoAlim, iFontePagadora
                   CodigoNaturezas.Adiciona('3533', 0, 2);

                   GravarFontePagadora2(sAnoMes, False);

                   ValorIdoso := 0;
               end;
               VerificaIdosoAbonoINSS:= False;}
               //Wylliam Leite da Silva - SOL:246488 PPM:1026389 - Fim

            // Alterado por Arnaldo V. Scarin
            // Essa rotina foi alterada para que os casos de Pensão Alimentícia Alimentado Recebe estava
            // gerando problemas quando existia o recebimento da FUNCEF e do INSS.
            If bFazFiltro Then
               Begin
                  If pai.TipoDirf In [td13Salario, td13SalBeneficioEncerrado] Then
                     Pai.qryDadosIndividuais.Filter := 'IdInforme = 98'
                  Else
                     Pai.qryDadosIndividuais.Filter := 'IdInforme = 97';
                  Pai.qryDadosIndividuais.Filtered := true;
                  bFazFiltro := False;
               End
            Else
               break;
         End;
      Pai.QryDadosIndividuais.Filter := '';
      Pai.QryDadosIndividuais.Filtered := False;
   Finally
      If bMudaDependente Then
         // Rotina para correção da Linha 91 - Dependentes 13o. salario, que está na matricula da ação judicial
         MudaLinhaDependente(StrToInt(lstIdPessoa[lstIdPessoa.Count - 1]), StrToInt(lstIdPessoa[0]));

      FreeAndNil(lstNaturezaFonte);
      Pai.QryDadosIndividuais.Close;
      If Result Then
         Inc(Pai.iGravados)
      Else
         Inc(Pai.iErrados);
   End;
End;

Procedure TProcessaDirfIndividual.MudaLinhaDependente(Const pIdPessoaAcao, pIdPessoaNovo: Integer);
Var IdLancirrfOld,
   idLancirrfNew: Integer;
   oCds: TClientDataSet;
Begin
   oCds := TClientDataSet.Create(Nil);
   Try
      oCds.Data := pai.GetDataPacket('Select idLancirrf' + #13#10 +
         'from LANCXINFORME' + #13#10 +
         'where IDLANCIRRF in (select IDLANCIRRF' + #13#10 +
         '                     from LANCIRRF' + #13#10 +
         '                     where IDBENEFIRRF = ' + IntToStr(pIdPessoaAcao) + #13#10 +
         '                       and IdHstfolhabenef = ' + IntToStr(pai.Versao) + #13#10 +
         '                       and To_CHAR(datalancamento,''yyyy'') =' + QuotedStr(Pai.Ano) + ')' + #13#10 +
         '  and IDINFORME = 91' + #13#10 +
         '  and fontepagadora = 1');
      IdLancirrfOld := oCds.FieldByName('IdLancIrrf').asInteger;
      oCds.Close;

      oCds.Data := pai.GetDataPacket('Select idLancirrf' + #13#10 +
         'from LANCXINFORME' + #13#10 +
         'where IDLANCIRRF in (select IDLANCIRRF' + #13#10 +
         '                     from LANCIRRF' + #13#10 +
         '                     where IDBENEFIRRF = ' + IntToStr(pIdPessoaNovo) + #13#10 +
         '                       and IdHstfolhabenef = ' + IntToStr(pai.Versao) + #13#10 +
         '                       and To_CHAR(datalancamento,''yyyy'') =' + QuotedStr(Pai.Ano) + ')' + #13#10 +
         '  and fontepagadora = 1' + #13#10 +
         '  and idinforme in (select idinforme from informe where codinforme = ''5011'')');
      IdLancirrfNew := oCds.FieldByName('IdLancIrrf').asInteger;
      oCds.Close;

      pai.ExecSQL('Update LancxInforme' + #13#10 +
         'Set IdLancIrrf = ' + IntToStr(idLancIrrfNew) + #13#10 +
         'Where IdLancIrrf = ' + IntToStr(idLancIrrfOld) + #13#10 +
         '  and idinforme = 91');
   Finally
      FreeAndNil(oCds);
   End;
End;

Function TProcessaDirfIndividual.ValidaIdosoeAbono(Const bPodeCalcular: Boolean; TipoDirf: tTipoDirf): Boolean;
Begin
   Result := True;
   TrataIdosoMensal(bPodeCalcular);
   TrataIdosoAbono(bPodeCalcular, TipoDirf);
   If (Tem13oSalario)
   And (ExisteEventoQuitacao)
 {  and not (IsentoIRRF) } then //Wylliam Silva SOL 246623 PPM 732617
      TratarRotinasAbono();
End;

Function tProcessaDirfIndividual.SelecionarDadosFontePagadora(Const oCds: TClientDataSet;
   Const iFontePagadora: Integer;
   Const sCodigoNatureza: String;
   Const iFlgGravaPensaoALim: Integer): Boolean;
Var i: Integer;
   sSql: String;
   Linha: tLinhaInformeDirf;
Begin
   oCds.Close;
   sSql := 'SELECT (0) AS VLRLANCSINAL, IDINFORME, IDLANCIRRF, PERCLANC, VLRLANC, FONTEPAGADORA ' +
      'FROM  LANCXINFORME  ' +
      'WHERE (1 = 2)';
   oCds.data := pai.GetDataPacket(SSql);

   For i := 0 To Linhas.Count - 1 Do
      Begin
         Linha := Linhas[i];
         If Linha.ValorLancamentoSinal <> 0 Then
            Begin
               If (Linha.FontePagadora = iFontePagadora) And
                  (Linha.CodigoNatureza = sCodigoNatureza) And
                  (linha.PensaoALimenticia = iFlgGravaPensaoAlim) Then
                  Begin
                     oCds.Insert;
                     oCds.FieldByName('IDINFORME').AsInteger := Linha.IdInforme;
                     oCds.FieldByName('VLRLANC').AsFloat := Linha.ValorLancamento;
                     oCds.FieldByName('VLRLANCSINAL').AsFloat := Linha.ValorLancamentoSinal;
                     oCds.FieldByName('FONTEPAGADORA').AsInteger := Linha.FontePagadora;
                     oCds.Post;
                  End;
            End;
      End;
   Result := Not oCds.IsEmpty;
End;

Function tProcessaDirfIndividual.FazUpdateHistRubSal(Const iLancamento: Double;
   Const iFontePagadora: Integer;
   Const sCodigoNatureza: String;
   Const sPeriodo: String;
   Const sFlgPensaoAlim: String): boolean;
Var sSql: TStringList;
   lstPessoas: tStringList;
   sPessoas: String;
   i, iPos: Integer;
Begin
   Result := False;
   lstPessoas := tStringList.Create;
   sPessoas := ListaIdPessoa;
   While (sPessoas <> '') Do
      Begin
         iPos := Pos(',', sPessoas);
         If iPos = 0 Then
            iPos := Length(sPessoas) + 1;
         lstPessoas.Add(Copy(sPessoas, 1, iPos - 1));
         sPessoas := Copy(sPessoas, iPos + 1, Length(sPessoas));
      End;

   sSql := TStringList.Create;
   For i := 0 To lstPessoas.Count - 1 Do
      Begin
         With sSql Do
            Begin
               Add('UPDATE HISTRUBSAL H');
               //    Add('UPDATE HISTRUBSAL_TEMP H');
               Add('SET H.IDLANCIRRF = ' + FloatTostr(iLancamento));

               If Pai.TipoDirf In [td13Salario, td13SalBeneficioEncerrado] Then
                  Begin
                     add('Where (H.IDMOTIVO IN (' + ListaIdMotivoAtuHist + '))');
                     Add('  and (H.IDHSTFOLHABENEF IN (' + ListaIdHstFolha + '))')
                  End
               Else
                  Begin
                     If (IdFoBenef <> 0) Then
                        Begin
                           Add('Where (H.IDHSTFOLHABENEF = ' + IntToStr(IdFoBenef) + ')');
                           Add('  AND (H.IDMOTIVO IN (' + ListaIdMotivoAtuHist + '))');
                        End
                     Else
                        Add('Where (H.IDMOTIVO IN (' + ListaIdMotivoAtuHist + '))');
                  End;

               //      Add('  AND (H.IDRESPONSAVEL IN ('+ListaIdPessoa+')) ');
               Add('  AND (H.IdResponsavel = ' + lstPessoas[i] + ')');
               Add('  AND (H.IDINFORME IS NOT NULL)');

               If pai.TipoDirf In [td13Salario, td13SalBeneficioEncerrado] Then
                  Begin
                     Add('  AND (H.DATAPAGAMENTO >= TO_DATE(' + QuotedStr(FormatDateTime('01/01/yyyy', pai.DataInicial)) + ',''DD/MM/YYYY''))');
                     Add('  AND (H.DATAPAGAMENTO <= TO_DATE(' + QuotedStr(FormatDateTime('31/12/yyyy', pai.DataFinal)) + ',''DD/MM/YYYY''))');
                  End
               Else
                  Begin
                     Add('  AND (H.DATAPAGAMENTO >= TO_DATE(' + QuotedStr(DateToStr(pai.DataInicial)) + ',''DD/MM/YYYY''))');
                     Add('  AND (H.DATAPAGAMENTO <= TO_DATE(' + QuotedStr(DateToStr(pai.DataFinal)) + ',''DD/MM/YYYY''))');
                  End;

               Add('  AND (H.IDMODULO = 18)');
               Add('  AND (H.IDRUBRICA IN ( SELECT PD.IDPROVENTO');

               // Thiago Melo SOL 222748 Kintana 2056742
               //Add('                        FROM PROVDESC PD WHERE ');//Marcio Sanches Spinosa SOL 222275 KINTANA 2055206
               //Add('                        PD.IDMODULO = 18 AND PD.CODIRRFDARF in (' + QuotedStr(sCodigoNatureza) + ')');//Marcio Sanches Spinosa SOL 222275 KINTANA 2055206
               Add('                        FROM PROVDESC PD');
               Add('                       WHERE (PD.IDMODULO = 18 OR PD.IDMODULO IS NULL)');
               //Wylliam Leite da Silva - SOL:246299 PPM:1022706 - Inicio
               Add('                         AND PD.CODIRRFDARF in (''0561'',''3540'',''3533'', ''7416'')');
               //Wylliam Leite da Silva - SOL:246299 PPM:1022706 - Fim
               // Thiago Melo SOL 222748 Kintana 2056742

//               Add('                        FROM PROVDESC PD');
//               If pai.TipoDirf In [td13Salario, td13SalBeneficioEncerrado] Then
//                  Add('                        WHERE PD.FLGRUBRICA13SALARIO = 1) )')
//               Else
//                  Add('                        WHERE PD.FLGRUBRICA13SALARIO = 0) )');

               If pai.TipoDirf In [td13Salario, td13SalBeneficioEncerrado] Then
                  Add('                        AND PD.FLGRUBRICA13SALARIO = 1) )')
               Else
                  Add('                        AND PD.FLGRUBRICA13SALARIO = 0) )');


               Add('  AND H.FONTEPAGADORA = ' + IntToStr(iFontePagadora));
               //      Add('  AND (NVL(H.IDPLANOCONTABIL,H.IDPLANOPREV) in ('+ListaIdPlanoPrev+') )');
               Add('  AND (H.CODIRRFDARF in (' + QuotedStr(sCodigoNatureza) + '))');  //Marcio Sanches Spinosa SOL 222275 KINTANA 2055206

               If Pos(',', pai.CodigoRubricas) > 0 Then
                  Begin
                     If Trim(pai.CodigoRubricas) <> '' Then
                        Add('  AND (IDRUBRICA IN (' + pai.CodigoRubricas + '))');
                  End
               Else
                  Begin
                     If Trim(pai.CodigoRubricas) <> '' Then
                        Add('  AND (IDRUBRICA = ' + pai.CodigoRubricas + ')');
                  End;
               If (sFlgPensaoAlim = '0') Then
                  Add('  AND (H.FLGPENSAOALIM in (0, 1))')
               Else If (sFlgPensaoAlim = '0,2') Then
                  Add('  AND (H.FLGPENSAOALIM in (0,1,2))')
               Else If (sFlgPensaoAlim = '2') Then
                  Add('  AND (H.FLGPENSAOALIM = 2)');

               If pai.TipoDirf In [tdNormal, tdNormalMolestia] Then
                  Begin
                     Add('  AND (H.MESCOBRANCA >= ' + QuotedStr(sPeriodo) + ')');
                     Add('  AND (H.MESCOBRANCA <= ' + QuotedStr(sPeriodo) + ')');
                  End;
            End;

         Result := pai.ExecSQL(sSql.Text);
         sSql.Clear;
      End;
   FreeAndNil(sSql);
End;

Function tProcessaDirfIndividual.RetornaVersaoFolhaParaGravacao(): Integer;
Var sData: String;
Begin
   If Not (pai.TipoDirf In [td13Salario, td13SalBeneficioEncerrado]) Then
      Result := IdFoBenef
   Else
      Begin
         If iVersaoFolha = 0 Then
            Result := Pai.Versao
         Else
            Result := iVersaoFolha;
         sData := LocalizaDataEfetivacao(Result);
         If sData <> '' Then
            DataEfetivacao := sData;
      End;
End;

Procedure tProcessaDirfIndividual.AcertaFlgPensaoAlim(Const iCount,
   iFontePagadora,
   iFlgPensaoAlim: integer;
   Var rBase,
   rIRRF: Double);
Begin
   rBase := 0;
   rIRRF := 0;
   If iFlgPensaoAlim <> 2 Then
      Begin
         If iFontePagadora = 1 Then
            Begin
               rBase := CodigoNaturezas[iCount].rValBase;
               rIRRF := CodigoNaturezas[iCount].rValIRRF;
            End
         Else
            Begin
               rBase := CodigoNaturezas[iCount].rValBaseINSS;
               rIRRF := CodigoNaturezas[iCount].rValIRRFINSS;
            End
      End;
End;

Function tProcessaDirfIndividual.GravarFontePagadora1(Const sPeriodo: String;
   Const bGravarSeparado: Boolean): Boolean;
   Procedure AjustaCodigoNaturezas(Const iPonteiro: Integer);
   Begin
      If Not BaseSeparada Then
         Begin
            With codigoNaturezas[iPonteiro] Do
               Begin
                  rValBaseINSS := rValBaseINSS + rValBase;
                  rValIRRFINSS := rValIRRFINSS + rValIRRF;
                  FontePagadora := 2;
                  rValBase := 0;
                  rValIRRF := 0;
               End;
         End;
   End;

Var bPrim: Boolean;
   iIdBenef: Integer;
   iCount: Integer;
   qryFontePagadora: TClientDataSet;
   iLancamento: Double;
   iFolha: Integer;
   iFlgGravaPensaoAlim: Integer;
   sFlgPensaoAlim: String;
   iPos: Integer;
   fValorBase, fValorIRRF: Double;
   iIdProcesso: Integer;
Begin
   Result := True;

   // Faz acerto para que o Insert seja feito atraves do IDTitular
//   if not (IdTitular = -1) and (PidPessoaProc <> IdPessoa) then
//   begin
//     pIprocjud167 := 0;
//   end;

   If ((idTitular = -1) Or bGravarSeparado) Then
      IdTitular := IdPessoa;

   iIdBenef := idTitular;

   If (iIdPessoaProcJud <> 0) And Not bGravarSeparado Then
      iIdBenef := iIdPessoaProcJud;
   iIdProcesso := iIdProcJudFund;
   If bGravarSeparado And (iIdBenef <> iIdPessoaProcJud) Then
      iIdProcesso := 0;

   iFolha := RetornaVersaoFolhaParaGravacao();

   iQtdMeses := Pai.GetQtdeMesesRRA; // Felipe A. Santos SOL 195438 KINTANA 1878097

   qryFontePagadora := TClientDataSet.Create(Nil);
   Try
      For iCount := 0 To CodigoNaturezas.Count - 1 Do
         Begin

            If CodigoNaturezas[iCount].FontePagadora <> 1 Then
               Begin
                  AjustaCodigoNaturezas(iCount);
                  Continue;
               End;
            sFlgPensaoAlim := CodigoNaturezas[iCount].FlgPensaoAlim;
            While sFlgPensaoAlim <> '' Do
               Begin
                  iPos := Pos(',', sFlgPensaoAlim);
                  If iPos = 0 Then
                     iPos := Length(sFlgPensaoAlim) + 1;
                  iFlgGravaPensaoAlim := StrToInt(Copy(sFlgPensaoAlim, 1, iPos - 1));
                  sFlgPensaoAlim := Copy(sFlgPensaoAlim, iPos + 1, length(sFlgPensaoAlim));
                  iLancamento := 0;
                  If SelecionarDadosFontePagadora(qryFontePagadora,
                     1,
                     CodigoNaturezas[iCount].CodigoNatureza,
                     iFlgGravaPensaoAlim) Then
                     Begin

                        AcertaFlgPensaoAlim(iCount, 1, iFlgGravaPensaoAlim, fValorBase, fValorIrrf);

                        Result := pai.LancIRRF.GravaIRRF(pai.Empresa,
                           pai.UsaPlanoPatro,
                           0,
                           pai.Empresa,
                           iif(iIdBenef = iif(PidPessoaProc = 0, iIdBenef, PidPessoaProc), iIdBenef, PidPessoaProc),//Marcio Sanches Spinosa SOL 235271 PPM 446324
                           CodigoNaturezas[iCount].CodigoNatureza,
                           DataEfetivacao,
                           fValorBase,
                           fValorIRRF,
                           0,
                           0,
                           fValorBase,
                           0,
                           0,
                           0,
                           0,
                           qryFontePagadora.data,
                           iLancamento,
                           PlanoContaCredito,
                           idPlanoContab,
                           'S',
                           IdPlanoPrev,
                           IdPatro,
                           pai.iIdPrograma,
                           bPrim,
                           IdModulo,
                           IdModulo,
                           IdMotivo,
                           CodigoCentroCusto,
                           iFolha,
                           CodigoTipoRecDes,
                           PlanoContaCredito,
                           CodigoCentroRespon,
                           0,
                           0,
                           False,
                           0,
                           True,
                           '',
                           0,
                           iFlgGravaPensaoAlim,
                           iif(iIdProcesso > 0, iIdProcesso , pIprocjud167)
                           iQtdMeses // Felipe A. Santos SOL 195438 KINTANA 1878097
                           )
                     End;
//                  Else                                  // Edilaine - SOL 190361 / KTN 1801585
//                     AjustaCodigoNaturezas(iCount);     // Edilaine - SOL 190361 / KTN 1801585

                  If (iLancamento > 0) And Result Then
                     Begin
                        If Not FazUpdateHistRubSal(iLancamento,
                           1,
                           CodigoNaturezas[iCount].CodigoNatureza,
                           sPeriodo,
                           intToStr(iFlgGravaPensaoAlim) {CodigoNaturezas[iCount].FlgPensaoAlim}) Then  // Edilaine - SOL 211939 / KTN 2044010
                           Raise Exception.Create(pai.messageinfo);
                     End;
               End;
         End;
   Finally
      qryFontePagadora.Close;
      FreeAndNil(qryFontePagadora);
   End;
End;

Function tProcessaDirfIndividual.GravarFontePagadora2(Const sPeriodo: String;
   Const bGravarSeparado: Boolean): Boolean;
Var qryFontePagadora: TClientDataSet;
   iLancamento: Double;
   iIdBenef: Integer;
   bPrim: Boolean;
   iCount: Integer;
   iFolha: Integer;
   iFlgGravaPensaoAlim: Integer;
   sFlgPensaoAlim: String;
   iPos: Integer;
   fValorBase, fValorIrrf: Double;
   iIdProcesso: Integer;
Begin
   Result := True;

//   if not (IdTitular = -1) and (PidPessoaProc <> IdPessoa) then
//   begin
//     pIprocjud167 := 0;
//   end;
   // Faz acerto para que o Insert seja feito atraves do IDTitular
   If ((idTitular = -1) Or bGravarSeparado)Then
      IdTitular := IdPessoa;

   iIdBenef := IdTitular;

   If (iIdPessoaProcJud <> 0) And Not bGravarSeparado Then
      iIdBenef := iIdPessoaProcJud;

//   iIdProcesso := iIdProcJudINSS;
   iIdProcesso := iIdProcJudFund;
   If bGravarSeparado And (iIdBenef <> iIdPessoaProcJud) Then
      iIdProcesso := 0;

   iFolha := RetornaVersaoFolhaParaGravacao();

   iQtdMeses := Pai.GetQtdeMesesRRA; // Felipe A. Santos SOL 195438 KINTANA 1878097

   qryFontePagadora := TClientDataSet.Create(Nil);
   Try
      For iCount := 0 To CodigoNaturezas.Count - 1 Do
         Begin

            If CodigoNaturezas[iCount].FontePagadora <> 2 Then
               Continue;

            sFlgPensaoAlim := CodigoNaturezas[iCount].FlgPensaoAlim;
            While sFlgPensaoAlim <> '' Do
               Begin
                  iPos := Pos(',', sFlgPensaoAlim);
                  If iPos = 0 Then
                     iPos := Length(sFlgPensaoAlim) + 1;
                  iFlgGravaPensaoAlim := StrToInt(Copy(sFlgPensaoAlim, 1, iPos - 1));
                  sFlgPensaoAlim := Copy(sFlgPensaoAlim, iPos + 1, length(sFlgPensaoAlim));
                  iLancamento := 0;
                  If SelecionarDadosFontePagadora(qryFontePagadora,
                     2,
                     CodigoNaturezas[iCount].CodigoNatureza,
                     iFlgGravaPensaoAlim) Then
                     Begin

                        AcertaFlgPensaoAlim(iCount, 2, iFlgGravaPensaoAlim, fValorBase, fValorIrrf);

                        if (pDataFimProcJud > 0) then
                          iIdProcesso := iIdProcJudINSS;

                        Result := pai.LancIRRF.GravaIRRF(pai.Empresa,
                           pai.UsaPlanoPatro,
                           0,
                           pai.Empresa,
                           iIdBenef,
                           CodigoNaturezas[iCount].CodigoNatureza,
                           DataEfetivacao,
                           fValorBase,
                           fValorIRRF,
                           0,
                           0,
                           fValorBase,
                           0,
                           0,
                           0,
                           0,
                           qryFontePagadora.data,
                           iLancamento,
                           PlanoContaCredito,
                           idPlanoContab,
                           'S',
                           IdPlanoPrev,
                           IdPatro,
                           pai.iIdPrograma,
                           bPrim,
                           IdModulo,
                           IdModulo,
                           IdMotivo,
                           CodigoCentroCusto,
                           iFolha,
                           CodigoTipoRecDes,
                           PlanoContaCredito,
                           CodigoCentroRespon,
                           0,
                           0,
                           False,
                           0,
                           True,
                           '',
                           0,
                           iFlgGravaPensaoAlim,
                           iif(iIdProcesso > 0, iIdProcesso , pIprocjud167),
//                           iIdProcesso,
                           iQtdMeses // Felipe A. Santos SOL 195438 KINTANA 1878097
                           )
                     End;
                  If (iLancamento > 0) And Result Then
                     Begin
                        If Not FazUpdateHistRubSal(iLancamento,
                           2,
                           CodigoNaturezas[iCount].CodigoNatureza,
                           sPeriodo,
                           intToStr(iFlgGravaPensaoAlim) {CodigoNaturezas[iCount].FlgPensaoAlim}) Then  // Edilaine - SOL 211939 / KTN 2044010
                           Raise Exception.Create(pai.messageinfo);
                     End;
               End;
         End;
   Finally
      qryFontePagadora.Close;
      FreeAndNil(qryFontePagadora);
   End;
End;

Function tProcessaDirfIndividual.BuscaLinhasAbono(): Boolean;
Var sSql: String;
Begin
   //  sSql := 'SELECT (SUM(LI.VLRLANC) * -1) AS VALOR, '                      + #13#10 +
//    sSql := 'SELECT (SUM(LI.VLRLANC)) AS VALOR, ' + #13#10 +
    sSql := 'SELECT CASE WHEN LI.IDINFORME IN(62,167) AND (SUM(LI.VLRLANC)) > 0 AND NOT (SUM(LI.VLRLANC)) < 0 THEN ' +
            '   (SUM(DECODE(LI.FLGTIPOREG, ''D'', LI.VLRLANC*-1, LI.VLRLANC))) ' +
            '    ELSE (SUM(LI.VLRLANC)) END AS VALOR, ' +

      '       LI.FONTEPAGADORA, ' + #13#10 +
      '       LI.IDINFORME, PF.DATAMORTE, ' + #13#10 +//Marcio Sanches Spinosa SOL 225765 KINTANA 2059367
      '       DECODE(LI.FONTEPAGADORA,1, ''3540'', L.CODNATUREZA) AS CODNATUREZA, '  + #13#10 +
      '       I.CODDIRF ' + #13#10 +
      'FROM INFORME I, ' + #13#10 +
      '     LANCXINFORME LI, ' + #13#10 +
      '     LANCIRRF L, PESSOAFISICA PF ' + #13#10 +
      'WHERE (I.CODDIRF = ''5'' OR I.IDINFORME IN (' + IntToStr(pai.iLinhaAbonoAcima65) + ',' + IntToStr(pai.iLinhaRendAcJud13) + ', 141)) ' + #13#10 +
      '  AND LI.IDINFORME               = I.IDINFORME ' + #13#10 +
      '  AND L.IDLANCIRRF               = LI.IDLANCIRRF ' + #13#10 +
      '  AND L.IDBENEFIRRF              = PF.IDPESSOA ' + #13#10 +
      '  AND L.IDBENEFIRRF              = ' + IntToStr(IdPessoa) + #13#10 +
      '  AND NVL(LI.FLGTIPOREG, ''N'') IN  (''N'', ''D'')' + #13#10 +
      '  AND L.DATALANCAMENTO BETWEEN TO_DATE(' + QuotedStr('01/01/' + IntToStr(iAno)) + ', ''DD/MM/YYYY'') AND ' + #13#10 +
      '                               TO_DATE(' + QuotedStr('31/12/' + IntToStr(iAno)) + ', ''DD/MM/YYYY'') ' + #13#10 +
      'GROUP BY LI.FONTEPAGADORA, ' + #13#10 +
      '         LI.IDINFORME, PF.DATAMORTE, DECODE(LI.FONTEPAGADORA,1, ''3540'', L.CODNATUREZA),  ' + #13#10 +//Marcio Sanches Spinosa SOL 225765 KINTANA 2059367
      '         I.CODDIRF ' + #13#10 +
//      'HAVING SUM(LI.VLRLANC) > 0 ' + #13#10 +
      ' HAVING CASE WHEN LI.IDINFORME IN(62,167) AND (SUM(LI.VLRLANC)) > 0 AND NOT (SUM(LI.VLRLANC)) < 0  THEN  '+
      ' (SUM(DECODE(LI.FLGTIPOREG, ''D'', LI.VLRLANC*-1, LI.VLRLANC))) ' +
      'ELSE (SUM(LI.VLRLANC)) END > 0.01 ' +
      ' ORDER BY LI.FONTEPAGADORA, LI.IDINFORME ' + #13#10;
   pai.qryAuxiliar.Data := pai.GetDataPacket(sSql);
   result := Not pai.qryAuxiliar.IsEmpty;
End;

Function tProcessaDirfIndividual.CarregarDadosGravacaoAbono(poQry: TClientDataSet): Boolean;
Var sSql: String;
   i: Integer;
Begin
   sSql := 'SELECT (0) AS VLRLANCSINAL, IDINFORME, IDLANCIRRF, PERCLANC, VLRLANC, FONTEPAGADORA, FLGTIPOREG ' +
      'FROM  LANCXINFORME  ' +
      'WHERE (1 = 2)';
   poQry.data := pai.GetDataPacket(SSql);
   For i := 0 To LinhasAbono.Count - 1 Do
      Begin
         If LinhasAbono[i].ValorLancamentoSinal <> 0 Then
            Begin
               poQry.Insert;
               poQry.FieldByName('IDINFORME').asInteger := LinhasAbono[i].IdInforme;
               poQry.FieldByName('IDLANCIRRF').asInteger := LinhasAbono[i].idLancamento;
               poQry.FieldByName('PERCLANC').asFloat := LinhasAbono[i].PercLancamento;
               poQry.FieldByName('VLRLANC').asFloat := LinhasAbono[i].ValorLancamento;
               poQry.FieldByName('VLRLANCSINAL').AsFloat := LinhasAbono[i].ValorLancamentoSinal;
               poQry.FieldByName('FONTEPAGADORA').asInteger := LinhasAbono[i].FontePagadora;
               poQry.FieldByName('FLGTIPOREG').asString := LinhasAbono[i].TipoRegistro;
               poQry.Post;
            End;
      End;
   Result := Not poQry.IsEmpty;
End;

Procedure tProcessaDirfIndividual.TratarRotinasAbono();
Var qryDetAbono: TCLientDataSet;
   iLancamento: Double;
   bPrim: Boolean;
Begin
   If BuscaLinhasAbono() Then
      Begin
        if not (pai.qryAuxiliar.Locate('IDINFORME', '167', []))
        or (pDataFimProcJud <= Pai.DataFinal) then //Marcio Sanches Spinosa SOL 223865 KINTANA 2058724
        begin
         qryDetAbono := TClientDataSet.Create(Nil);
         TrataAcertoAbonoFund();
         TrataAcertoAbonoINSS();
         TrataDeducaoDepAbono();

         if (Pai.qryDadosIndividuais.FieldByName('DATAFIMMOLESTIA').AsDateTime < Pai.DataInicial)
         and ((FormatDateTime('YYYY', Pai.qryDadosIndividuais.FieldByName('DATAFIMMOLESTIA').AsDateTime) = (
         FormatDateTime('YYYY', Pai.DataInicial)))) then
         begin
            //Wylliam Silva SOL 246623 PPM 732617
            VerificaFimMolestia13Pagamento(Pai.qryDadosIndividuais.FieldByName('DATAFIMMOLESTIA').AsDateTime,
                                           Trim(Pai.qryDadosIndividuais.fieldByname('CPFCNPJ').AsString));
         end;

         If CarregarDadosGravacaoAbono(qryDetAbono) Then
            Begin
               iLancamento := 0;
               VerificaSituacaoProcessoEncerrado(IdPessoa);   //Marcio Sanches Spinosa SOL 235271 PPM 446324
               pai.LancIRRF.GravaIRRF(pai.Empresa,
                  pai.UsaPlanoPatro,
                  0,
                  pai.Empresa,
                  IdPessoa,
                  CodigoNatureza,
                  DataEfetivacao,
                  rValBaseINSS,
                  rValIRRFINSS,
                  0,
                  0,
                  rValBaseINSS,
                  0,
                  0,
                  0,
                  0,
                  qryDetAbono.data,
                  iLancamento,
                  PlanoContaCredito,
                  IdPlanoContab,
                  'S',
                  IdPlanoPrev,
                  IdPatro,
                  pai.iIdPrograma,
                  bPrim,
                  IdModulo,
                  IdModulo,
                  IdMotivo,
                  CodigoCentroCusto,
                  IdFoBenef,
                  CodigoTipoRecDes,
                  PlanoContaCredito,
                  CodigoCentroRespon,
                  0,
                  0,
                  False,
                  0,
                  True,
                  '',
                  0,
                  FlgPensaoAlim,
                  iif(iIdProcJudFund > 0, iIdProcJudFund , pIprocjud167))//Marcio Sanches Spinosa SOL 224376 KINTANA 2058123
//                  iIdProcJudFund
            End;

         qryDetAbono.Close;
         FreeAndNil(qryDetAbono);
        end;
      End;
End;

//Wylliam Leite da Silva - SOL:246488 PPM:1026389
Procedure tProcessaDirfIndividual.TrataAcertoAbonoFund();
Begin
   {Tratamento de Pessoas que ficaram Isenta ou Idosas durante o ano}
   {13º da Fundação                                                 }
   If MolestiaGrave { And (pai.TipoDirf = tdNormalMolestia)} //Wylliam Silva SOL 246623 PPM 732617
   and IsentoIRRF Then//Marcio Sanches Spinosa SOL 209527 Kintana 2021934
      TrataAcertoAbonoFund_CalculaMolestiaGrave13Salario()
   Else
      TrataAcertoAbonoFund_Calcula13Salario();
End;

Procedure tProcessaDirfIndividual.TrataAcertoAbonoFund_CalculaMolestiaGrave13Salario();
Var rTotal: Double;
   rValor: Double;
   iPosicao: Integer;
   iLinhaInforme: Integer;
Begin
   { Lançar as linhas de informe negativas }
   iLinhaInforme := 0;
   rTotal := 0;
   While (Not pai.qryAuxiliar.Eof) And (pai.qryAuxiliar.FieldByName('FONTEPAGADORA').AsInteger = 1) Do
      Begin
         rValor := pai.qryAuxiliar.FieldByName('VALOR').AsFloat;
         rTotal := rTotal + (rValor * -1);

         iPosicao := LinhasAbono.IndexOfLinha(pai.qryAuxiliar.FieldByName('IDINFORME').AsInteger, 1, CodigoNatureza);
         If iPosicao > -1 Then
            Begin
               LinhasAbono[iPosicao].AtualizarValores(RoundCM(rValor, 2),
                  RoundCM(rValor, 2));
            End
         Else
            Begin
               LinhasAbono.AdicionarValores(pai.qryAuxiliar.FieldByName('IDINFORME').AsInteger,
				  //Wylliam Silva SOL 246623 PPM 732617 - Inicio
                  RoundCM(rValor * -1 , 2),
                  RoundCM(rValor * -1, 2),
				  //Wylliam Silva SOL 246623 PPM 732617 - Fim
                  1,
                  CodigoNatureza,
                  FlgPensaoAlim,
                  'D');
            End;

         If pai.qryAuxiliar.FieldByName('CODDIRF').AsString = '5' Then
            iLinhaInforme := pai.qryAuxiliar.FieldByName('IDINFORME').AsInteger
         Else
            iLinhaInforme := iLinhaInformeOrig;

         pai.qryAuxiliar.Next;
      End;
      //Wylliam Silva SOL 246623 PPM 732617 - Inicio
      if (rTotal < 0) then
      begin
         iPosicao := LinhasAbono.IndexOfLinha(pai.iIdAbonoMolestiaGrave , 1, CodigoNatureza);
         If iPosicao > -1 Then
            Begin
               LinhasAbono[iPosicao].AtualizarValores(RoundCM(rValor, 2),
                  RoundCM(rTotal * -1, 2));
            End
         Else
            Begin
               LinhasAbono.AdicionarValores(pai.iIdAbonoMolestiaGrave,
                  RoundCM(rTotal * -1 , 2),
                  RoundCM(rTotal * -1 , 2),
                  1,
                  CodigoNatureza,
                  FlgPensaoAlim,
                  'D');
            End;
      end;
	  //Wylliam Silva SOL 246623 PPM 732617 - Fim
   { Lançar a linha de informe de molestia grave }
   If Not pai.qryAuxiliar.IsEmpty Then
      Begin
         If pai.qryInformeDePara.Locate('IDSITUACAO; IDINFORMEORIGEM', VarArrayOf(['1', IntToStr(iLinhaInforme)]), []) Then
            Begin
               iLinhaInforme := pai.qryInformeDePara.FieldByName('IDINFORMEDESTINO').AsInteger;
               iPosicao := LinhasAbono.IndexOfLinha(iLinhaInforme, 1, CodigoNatureza);
               If iPosicao > -1 Then
                  Begin
                     LinhasAbono[iPosicao].AtualizarValores(RoundCM(rTotal, 2),
                        RoundCM(rTotal, 2));
                  End
               Else
                  Begin
                     LinhasAbono.AdicionarValores(iLinhaInforme,
                        RoundCM(rTotal, 2),
                        RoundCM(rTotal, 2),
                        1,
                        CodigoNatureza,
                        FlgPensaoAlim,
                        'D');
                  End;
            End;
      End;
End;

 Procedure tProcessaDirfIndividual.TrataAcertoAbonoFund_Calcula13Salario();
//-----------------------------------------------------------------------//
   Procedure _Calcula13SalarioIdosoSemAcaoJudicial_();
   Var iPosicao: Integer;
      rValor: Double;
	  //Wylliam Silva SOL 246623 PPM 732617 - Inicio
      dDataFevereiro : TDateTime;
      rValorIdoso : Double;
	  //Wylliam Silva SOL 246623 PPM 732617 - Fim
   Begin
      While (Not pai.qryAuxiliar.Eof) And ((ValorIdoso > 0)
      or ((pDataFimProcJud > 0) and (pDataFimProcJud < Pai.DataInicial)) //marcio sanches spinosa SOL 244696 PPM 610842
      or (Pai.qryDadosIndividuais.FieldByName('DATAFIMMOLESTIA').AsDateTime < pai.DataInicial)) and //Wylliam Leite da Silva SOL: 246623 PPM:732617
         (pai.qryAuxiliar.FieldByName('FONTEPAGADORA').AsInteger = 1) Do
         Begin
            If pai.qryAuxiliar.FieldByName('IDINFORME').AsInteger = pai.iLinhaAbonoAcima65 Then
               Begin
                  pai.qryAuxiliar.Next;
                  Continue;
               End;

            //Marcio Sanches Spinosa SOL 225765 KINTANA 2059367 - Inicio
            if (pai.qryAuxiliar.FieldByName('DATAMORTE').AsDateTime < Pai.DataInicial)
            and (pai.qryAuxiliar.FieldByName('DATAMORTE').AsDateTime <> 0)  then
              rValor := ValorIdoso
            else
            begin
             if ((rTotRend131A * -1) <> pai.qryAuxiliar.FieldByName('VALOR').AsFloat) or (not temAcaoJudicial) then
               rValor := pai.qryAuxiliar.FieldByName('VALOR').AsFloat
             else
             begin
               rValor := 0;
               pai.qryAuxiliar.Next;
               Continue;
             end;
            end;
            //Marcio Sanches Spinosa SOL 225765 KINTANA 2059367 - Fim
            {Lançar linha dos proventos de abono com valor negativo (devolução)}
            iPosicao := LinhasAbono.IndexOfLinha(pai.qryAuxiliar.FieldByName('IDINFORME').AsInteger, 1, CodigoNatureza);
            If iPosicao > -1 Then
               Begin
                  LinhasAbono[iPosicao].AtualizarValores(RoundCM(rValor, 2),
                     RoundCM(rValor, 2));
               End
            Else
               Begin
                //Marcio Sanches Spinosa SOL 225765 KINTANA 2059367 - Inicio
               if ((rTotRend131 + rTotRend131A > 0) ) then
               begin
                    if (pai.qryAuxiliar.FieldByName('DATAMORTE').AsDateTime < Pai.DataInicial) then
                      LinhasAbono.AdicionarValores(pai.qryAuxiliar.FieldByName('IDINFORME').AsInteger,
                                         RoundCM(rValor * -1, 2),
                                         RoundCM(rValor * -1, 2),
                                         1,
                                         CodigoNatureza,
                                         FlgPensaoAlim,
                                         'D')
                    else
                      LinhasAbono.AdicionarValores(pai.qryAuxiliar.FieldByName('IDINFORME').AsInteger,
                         RoundCM(rValor, 2),
                         RoundCM(rValor, 2),
                         1,
                         CodigoNatureza,
                         FlgPensaoAlim,
                         'D');
                 //Marcio Sanches Spinosa SOL 225765 KINTANA 2059367 - Fim
               End;
              end;
            { Lançar linha de dedução por idade                                               }
            { Se dedução menor ou igual que o lançamento, lançar o valor total da dedução e o }
            { restante na linha de proventos   }
           if ((rTotRend131 + rTotRend131A > 0) ) then
           begin
              If (ValorIdoso <= (rValor * -1)) Then
                 Begin
                    iPosicao := LinhasAbono.IndexOfLinha(pai.iLinhaAbonoAcima65, 1, CodigoNatureza);
                    If iPosicao > -1 Then
                       Begin
                          LinhasAbono[iPosicao].AtualizarValores(RoundCM(ValorIdoso, 2),
                             RoundCM(ValorIdoso, 2));
                       End
                    Else
                       Begin
                          LinhasAbono.AdicionarValores(pai.iLinhaAbonoAcima65,
                             RoundCM(ValorIdoso, 2),
                             RoundCM(ValorIdoso, 2),
                             1,
                             CodigoNatureza,
                             FlgPensaoAlim,
                             'D');
                       End;

                    { Lança a linha dos proventos de abono (positiva) }
                    iPosicao := LinhasAbono.IndexOfLinha(pai.qryAuxiliar.FieldByName('IDINFORME').AsInteger, 1, CodigoNatureza);
                    If iPosicao > -1 Then
                       Begin
                          LinhasAbono[iPosicao].AtualizarValores(RoundCM(((rValor * -1) - ValorIdoso), 2),
                             RoundCM(((rValor * -1) - ValorIdoso), 2));
                       End
                    Else
                       Begin
                          LinhasAbono.AdicionarValores(pai.qryAuxiliar.FieldByName('IDINFORME').AsInteger,
                             RoundCM((rValor * -1) - ValorIdoso, 2),
                             RoundCM((rValor * -1) - ValorIdoso, 2),
                             1,
                             CodigoNatureza,
                             FlgPensaoAlim,
                             'D');
                       End;

                    If ValorIdoso >= (rValor * -1) Then
                       ValorIdoso := ValorIdoso - (rValor * -1)
                    Else
                       ValorIdoso := 0;
                 End
              Else
                 { Senão lançar somente o lançamento na linha de dedução }
                 Begin
                 //marcio sanches spinosa SOL 244696 PPM 610842 - Inicio
                 //Wylliam Silva SOL 246623 PPM 732617 - Inicio
                 dDataFevereiro :=  strtodate('28/02/' + FormatDateTime('yyyy', Pai.DataFinal));
                   if (pai.qryDadosIndividuais.FieldByName('DATAFIMMOLESTIA').AsDateTime < pai.DataInicial)
                   and ((pai.qryDadosIndividuais.FieldByName('DATAFIMMOLESTIA').AsDateTime) >
                   (dDataFevereiro)) then
                   begin
                    if (rvalor > pai.qryParamIRRF.FieldByName('VLRIDOSOS').AsFloat) then
                    begin
                        rValorIdoso := pai.qryParamIRRF.FieldByName('VLRIDOSOS').AsFloat;
                        rValor := rValor - pai.qryParamIRRF.FieldByName('VLRIDOSOS').AsFloat;
                    end
                    else
                    begin
                        rValorIdoso := rvalor;
                        rvalor := 0;
                    end;
                       iPosicao := LinhasAbono.IndexOfLinha(pai.iLinhaAbonoAcima65, 1, CodigoNatureza);
                       If iPosicao > -1 Then
                         Begin
                            LinhasAbono[iPosicao].AtualizarValores(RoundCM(((rValorIdoso) ), 2),
                               RoundCM(((rValorIdoso)), 2));
                         End
                       Else
                         Begin
                            LinhasAbono.AdicionarValores(pai.iLinhaAbonoAcima65,
                               RoundCM(rValorIdoso, 2),
                               RoundCM(rValorIdoso, 2),
                               1,
                               CodigoNatureza,
                               FlgPensaoAlim,
                               'D');
                         End;

                    iPosicao := LinhasAbono.IndexOfLinha(iLinhaRend13, 1, CodigoNatureza);
                       If iPosicao > -1 Then
                         Begin
                            LinhasAbono[iPosicao].AtualizarValores(RoundCM(((rValor) ), 2),
                               RoundCM(((rValor)), 2));
                         End
                       Else
                         Begin
                            LinhasAbono.AdicionarValores(iLinhaRend13,
                               RoundCM(rValor, 2),
                               RoundCM(rValor, 2),
                               1,
                               CodigoNatureza,
                               FlgPensaoAlim,
                               'D');
                         End;
                   end
                   else
                   //Wylliam Silva SOL 246623 PPM 732617 - Fim
                   if (pDataFimProcJud > 0) and (pDataFimProcJud < Pai.DataInicial) and (valorIdoso = 0) then
                   begin
                    iPosicao := LinhasAbono.IndexOfLinha(iLinhaRend13, 1, CodigoNatureza);
                       If iPosicao > -1 Then
                         Begin
                            LinhasAbono[iPosicao].AtualizarValores(RoundCM(((rValor) ), 2),
                               RoundCM(((rValor)), 2));
                         End
                       Else
                         Begin
                            LinhasAbono.AdicionarValores(iLinhaRend13,
                               RoundCM(rValor, 2),
                               RoundCM(rValor, 2),
                               1,
                               CodigoNatureza,
                               FlgPensaoAlim,
                               'D');
                         End;
                   end
                   else
                   begin
                     //marcio sanches spinosa SOL 244696 PPM 610842 - Fim
                    iPosicao := LinhasAbono.IndexOfLinha(pai.iLinhaAbonoAcima65, 1, CodigoNatureza);
                    If iPosicao > -1 Then
                       Begin
                          LinhasAbono[iPosicao].AtualizarValores(RoundCM((rValor * -1), 2),
                             RoundCM((rValor * -1), 2));
                       End
                    Else
                       Begin
                        //Marcio Sanches Spinosa SOL 225765 KINTANA 2059367 - Inicio
                        if (pai.qryAuxiliar.FieldByName('DATAMORTE').AsDateTime < Pai.DataInicial)
                        and (pai.qryAuxiliar.FieldByName('DATAMORTE').AsDateTime <> 0) then
                          LinhasAbono.AdicionarValores(pai.iLinhaAbonoAcima65,
                             RoundCM((rValor {* -1}), 2),
                             RoundCM((rValor {* -1}), 2),
                             1,
                             CodigoNatureza,
                             FlgPensaoAlim,
                             'D')
                        else if (ValorIdoso > 0) and (rTotRend131 > ValorIdosoFixo) then
                        begin
                          LinhasAbono.AdicionarValores(pai.iLinhaAbonoAcima65
                             RoundCM((ValorIdoso), 2),
                             RoundCM((ValorIdoso), 2),
                             1,
                             CodigoNatureza,
                             FlgPensaoAlim,
                             'D');

                          LinhasAbono.AdicionarValores(iLinhaRend13
                             RoundCM((rValor - ValorIdoso), 2),
                             RoundCM((rValor - ValorIdoso), 2),
                             1,
                             CodigoNatureza,
                             FlgPensaoAlim,
                             'D');

                          if rValor > ValorIdoso then
                             ValorIdoso := 0;
                        end
                        else
                        begin
                          LinhasAbono.AdicionarValores(pai.iLinhaAbonoAcima65,
                             RoundCM((rValor {* -1}), 2),
                             RoundCM((rValor {* -1}), 2),
                             1,
                             CodigoNatureza,
                             FlgPensaoAlim,
                             'D');

                             ValorIdoso := ValorIdoso - rValor; //Marcio Sanches Spinosa SOL 228926 PPM 358284
                        end;
                         //Marcio Sanches Spinosa SOL 225765 KINTANA 2059367 - Fim
                       End;
                   End;
                end;
           end;
            pai.qryAuxiliar.Next;
         End;
         //Wylliam Leite da Silva - SOL:246488 PPM:1026389 - Inicio
         if not(ValorIdoso >= 0) then
         begin
           //Marcio Sanches Spinosa SOL 228926 PPM 358284 - Inicio
           rTotRend131 := 0;
           rTotRend131A := 0;
           //Marcio Sanches Spinosa SOL 228926 PPM 358284 - Fim
         end;
         //Wylliam Leite da Silva - SOL:246488 PPM:1026389 - Fim
   End;
   //-----------------------------------------------------------------------//
   Procedure _Calcula13SalarioIdosoComAcaoJudicial_();
   Var iPosicao: Integer;
      rValor: Double;
      iFontePagadora: Integer;
   Begin
      //        While (not pai.qryAuxiliar.Eof) And
      //              (pai.qryAuxiliar.FieldByName('FONTEPAGADORA').AsInteger = 1) Do
//      if (CodigoNatureza <> '3533')
      pai.qryAuxiliar.First;

      IF (pai.qryAuxiliar.FieldByName('CODNATUREZA').ASSTRING <> '3533')
      and (pai.qryAuxiliar.FieldByName('FONTEPAGADORA').AsInteger <> 2)
      and (FormatDateTime('MM', pai.DataInicial) <> '08') and (RoundCM(rValorIdoso13acum,2) < ValorIdosoFixo) then
      begin

        if ValorIdoso = 0 then ValorIdoso := rValorIdoso13acum;

        if ValorIdoso > 0 then   // Edilaine - SOL 199978 / KTN 1925538
        begin
      While (Not pai.qryAuxiliar.Eof) Do
         Begin
            iFontePagadora := pai.qryAuxiliar.FieldByName('FONTEPAGADORA').AsInteger;
            If ((iFontePagadora = 1) Or ((iFontePagadora = 2) And ExisteRegraIT)) Then
               Begin
                  If (pai.qryAuxiliar.FieldByName('IDINFORME').AsInteger = pai.iLinhaAbonoAcima65) Then
                     Begin
                        pai.qryAuxiliar.Next;
                        if ((rTotRend131 + rTotRend131A) > 0) and (pai.Versao > -1) then//Marcio Sanches Spinosa SOL 229216 KINTANA 2063107
                          pVerificaLancD := True
                        else
                          pVerificaLancD := False;

                        Continue;
                     end;


                  rValor := pai.qryAuxiliar.FieldByName('VALOR').AsFloat;
                  ////Marcio Sanches Spinosa SOL 227199 KINTANA 2061171 - Inicio
                  Existe141 := pai.qryAuxiliar.Locate('IDINFORME', '141', []);

                  { Lançar linha dos proventos de abono com valor negativo (devolução) }
                  iPosicao := LinhasAbono.IndexOfLinha(pai.qryAuxiliar.FieldByName('IDINFORME').AsInteger, 1, CodigoNatureza);
                  If iPosicao > -1 Then
                     Begin
                        LinhasAbono[iPosicao].AtualizarValores(RoundCM(rValor * -1, 2),
                           RoundCM(rValor* -1, 2));
                     End
                  Else
                     Begin
                       IF (pDataFimProcJud <= Pai.DataInicial) and (pDataFimProcJud <> 0)
                       and (pai.qryAuxiliar.FieldByName('IDINFORME').AsInteger = 167) then
                       begin

                     //   vTesteValorErro167 := pai.qryAuxiliar.FieldByName('VALOR').AsFloat;;

                          LinhasAbono.AdicionarValores(pai.qryAuxiliar.FieldByName('IDINFORME').AsInteger,
                             RoundCM(rValor * -1, 2),
                             RoundCM(rValor * -1, 2),
                             iFontePagadora,
                             CodigoNatureza,
                             FlgPensaoAlim,
                             'D');

//                         LinhasAbono.AdicionarValores(pai.qryAuxiliar.FieldByName('IDINFORME').AsInteger,
//                             RoundCM(rValor * -1, 2),
//                             RoundCM(rValor * -1, 2),
//                             iFontePagadora,
//                             CodigoNatureza,
//                             FlgPensaoAlim,
//                             'D');


                         iPosicao := LinhasAbono.IndexOfLinha(62, 1, CodigoNatureza);
                         If iPosicao > -1 Then
                           LinhasAbono[iPosicao].AtualizarValores(RoundCM(rValor {* -1}, 2),
                                 RoundCM(rValor, 2))
                         else
                            LinhasAbono.AdicionarValores(62,
                               RoundCM(rValor {* -1}, 2),
                               RoundCM(rValor{* -1}, 2),
                               iFontePagadora,
                               CodigoNatureza,
                               FlgPensaoAlim,
                               'D');



                        end
                        else
                        begin
                          LinhasAbono.AdicionarValores(pai.qryAuxiliar.FieldByName('IDINFORME').AsInteger,
                             RoundCM(rValor * -1, 2),
                             RoundCM(rValor * -1, 2),
                             iFontePagadora,
                             CodigoNatureza,
                             FlgPensaoAlim,
                             'D');

                         IF Existe141 then
                         BEGIN
                          LinhasAbono.AdicionarValores(62,
                             RoundCM(rValor - (rValor * (PercAcaoJudicial/100)), 2),
                             RoundCM(rValor - (rValor * (PercAcaoJudicial/100)), 2),
                             iFontePagadora,
                             CodigoNatureza,
                             FlgPensaoAlim,
                             'D');
                         end;
                        end;
                     End;


                   IF (pDataFimProcJud <= Pai.DataInicial)
                   and (pai.qryAuxiliar.FieldByName('IDINFORME').AsInteger = 167) then
                      ValorIdoso := 0
                   else  if ValorIdoso = 0 then ValorIdoso := rValorIdoso13acum;

                  { Lançar linha de dedução por idade                                               }
                  { Se dedução menor ou igual que o lançamento, lançar o valor total da dedução e o }
                  { restante na linha de proventos                                                  }
                  If (ValorIdoso  ) <= (rValor ) Then
                     Begin
//                        iPosicao := LinhasAbono.IndexOfLinha(pai.iLinhaAbonoAcima65, 1, CodigoNatureza);
//                        If iPosicao > -1 Then
//                           Begin
//                              LinhasAbono[iPosicao].AtualizarValores(RoundCM(ValorIdoso, 2),
//                                 RoundCM(ValorIdoso, 2));
//                           End
//                        Else
//                           Begin
//                              LinhasAbono.AdicionarValores(pai.iLinhaAbonoAcima65,
//                                 RoundCM(ValorIdoso, 2),
//                                 RoundCM(ValorIdoso, 2),
//                                 iFontePagadora,
//                                 CodigoNatureza,
//                                 FlgPensaoAlim,
//                                 'D');
//                           End;
                        {Lança a linha dos proventos de abono (positiva)}
                        iPosicao := LinhasAbono.IndexOfLinha(iLinhaInformeOrig, 1, CodigoNatureza);
                        If iPosicao > -1 Then
                           Begin
                              LinhasAbono[iPosicao].AtualizarValores(RoundCM((((rValor * -1) - ValorIdoso) * (100 - PercAcaoJudicial)) / 100, 2),
                                 RoundCM((((rValor * -1) - ValorIdoso) * (100 - PercAcaoJudicial)) / 100, 2));
                           End
                        Else
                           Begin
                              LinhasAbono.AdicionarValores(iLinhaInformeOrig,
                                 RoundCM((((rValor * -1) - ValorIdoso) * (100 - PercAcaoJudicial)) / 100, 2),
                                 RoundCM((((rValor * -1) - ValorIdoso) * (100 - PercAcaoJudicial)) / 100, 2),
                                 iFontePagadora,
                                 CodigoNatureza,
                                 FlgPensaoAlim,
                                 'D');
                           End;

                        {Lançando linha de rendimento da fonte pagadora Fundação 13º para Ação Judicial}
                        iPosicao := LinhasAbono.IndexOfLinha(pai.iLinhaRendAcJud13, 1, CodigoNatureza);
                        If iPosicao > -1 Then
                           Begin
                              LinhasAbono[iPosicao].AtualizarValores(RoundCM((((rValor{ * -1}){ - ValorIdoso}) * PercAcaoJudicial) / 100, 2),
                                 RoundCM((((rValor {* -1}) - ValorIdoso) * PercAcaoJudicial) / 100, 2));
                           End
                        Else
                           Begin
                              LinhasAbono.AdicionarValores(pai.iLinhaRendAcJud13,
                                 RoundCM((((rValor{* -1}) {- ValorIdoso}) * PercAcaoJudicial) / 100, 2),
                                 RoundCM((((rValor {* -1}) { - ValorIdoso}) * PercAcaoJudicial) / 100, 2),
                                 iFontePagadora,
                                 CodigoNatureza,
                                 FlgPensaoAlim,
                                 'D');
                           End;

                        If ValorIdoso >= (rValor) Then
                        begin
                          if ((rValor * -1) < 0) then
                           ValorIdoso := ValorIdoso - (rValor )
                          else
                           ValorIdoso := ValorIdoso - (rValor * -1)
                        end
                        Else
                           ValorIdoso := 0;

                     End ;
//                  Else
//                     {Senão lançar somente o lançamento na linha de dedução}
//                     Begin
//                        iPosicao := LinhasAbono.IndexOfLinha(pai.iLinhaAbonoAcima65, 1, CodigoNatureza);
//                        If iPosicao > -1 Then
//                           Begin
//                              LinhasAbono[iPosicao].AtualizarValores(RoundCM((rValor {* -1}), 2),
//                                 RoundCM((rValor {* -1}), 2));
//                           End
//                        Else
//                           Begin
//                              LinhasAbono.AdicionarValores(pai.iLinhaAbonoAcima65,
//                                 RoundCM((rValor {* -1}), 2),
//                                 RoundCM((rValor {* -1}), 2),
//                                 iFontePagadora,
//                                 CodigoNatureza,
//                                 FlgPensaoAlim,
//                                 'D');
//                           End;
//                     End;
               End;
                pai.qryAuxiliar.Next;
////Marcio Sanches Spinosa SOL 227199 KINTANA 2061171 - Fim
            end;
       End;



 //     end
//      else if (pai.qrySalarioNormal2.FieldByName('FONTEPAGADORA').AsInteger = 1) THEN
//      begin
//          iPosicao := LinhasAbono.IndexOfLinha(62, 2, CodigoNatureza);
//          If iPosicao = -1 Then
//          LinhasAbono.AdicionarValores(62,
//             RoundCM((Pai.qrySalarioNormal2.fieldbyname('VLRBASE65').AsFloat - (Pai.qrySalarioNormal2.fieldbyname('VLRBASE65').AsFloat * (PercAcaoJudicial/100))) , 2),
//             RoundCM((Pai.qrySalarioNormal2.fieldbyname('VLRBASE65').AsFloat - (Pai.qrySalarioNormal2.fieldbyname('VLRBASE65').AsFloat * (PercAcaoJudicial/100))) , 2),
//             1,
//             CodigoNatureza,
//             FlgPensaoAlim,
//             'D');
//
//          iPosicao := LinhasAbono.IndexOfLinha(141, 2, CodigoNatureza);
//          If iPosicao = -1 Then
//           LinhasAbono.AdicionarValores(141,
//             RoundCM((Pai.qrySalarioNormal2.fieldbyname('VLRBASE65').AsFloat  * -1) , 2),
//             RoundCM((Pai.qrySalarioNormal2.fieldbyname('VLRBASE65').AsFloat  * -1) , 2),
//             1,
//             CodigoNatureza,
//             FlgPensaoAlim,
//             'D');
//
//
//           LinhasAbono.AdicionarValores(167,
//             RoundCM((Pai.qrySalarioNormal2.fieldbyname('VLRBASE65').AsFloat * (PercAcaoJudicial/100)) , 2),
//             RoundCM((Pai.qrySalarioNormal2.fieldbyname('VLRBASE65').AsFloat * (PercAcaoJudicial/100)) , 2),
//             1,
//             CodigoNatureza,
//             FlgPensaoAlim,
//             'D');
      end;   // Edilaine - SOL 199978 / KTN 1925538
   End;
   //-----------------------------------------------------------------------//
   Procedure _Calcula13SalarioNaoIdosoComAcaoJudicial_();
   Var iPosicao: Integer;
      rValor: Double;
      iFontePagadora: Integer;
   Begin
      While (Not pai.qryAuxiliar.Eof) Do
         Begin
            iFontePagadora := pai.qryAuxiliar.FieldByName('FONTEPAGADORA').AsInteger;
            If ((iFontePagadora = 1) Or ((iFontePagadora = 2) And ExisteRegraIT))
            and ((FormatDateTime('MM', Pai.DataFinal) <> '08')) Then
               Begin
                  If pai.qryAuxiliar.FieldByName('IDINFORME').AsInteger = pai.iLinhaAbonoAcima65 Then
                     Begin
                        pai.qryAuxiliar.Next;
                        Continue;
                     End;

                  rValor := pai.qryAuxiliar.FieldByName('VALOR').AsFloat;

                 if (CodigoNatureza <> '3533')
                 or ((pai.qryAuxiliar.FieldByName('IDINFORME').asstring = '167')//Marcio Sanches Spinosa SrenataOL 224376 KINTANA 2058123
                 and (pDataFimProcJud > 0)) then  //Marcio Sanches Spinosa SOL 223865 KINTANA 2058724
                 begin
                  {Lançar linha dos proventos de abono com valor negativo (devolução)}
                  iPosicao := LinhasAbono.IndexOfLinha(pai.qryAuxiliar.FieldByName('IDINFORME').AsInteger, 1, CodigoNatureza);
                  If iPosicao > -1 Then
                     Begin
                       //Marcio Sanches Spinosa SOL 224376 KINTANA 2058123 - Inicio
//                        LinhasAbono[iPosicao].AtualizarValores(RoundCM(rValor, 2),
//                           RoundCM(rValor * -1, 2));
                          LinhasAbono[iPosicao].AtualizarValores(RoundCM(rValor* -1, 2),
                             RoundCM(rValor * -1, 2))
                      //Marcio Sanches Spinosa SOL 224376 KINTANA 2058123 - Fim

                     End
                  Else
                     Begin
                       //Marcio Sanches Spinosa SOL 224376 KINTANA 2058123 - Inicio
//                        LinhasAbono.AdicionarValores(pai.qryAuxiliar.FieldByName('IDINFORME').AsInteger,
//                           RoundCM(rValor * -1, 2),
//                           RoundCM(rValor * -1, 2),
//                           iFontePagadora,
//                           CodigoNatureza,
//                           FlgPensaoAlim,
//                           'D');

                        //Marcio Sanches Spinosa SOL 223865 KINTANA 2058724 - Inicio
                        if (pai.qryAuxiliar.FieldByName('IDINFORME').AsInteger = 62) then
                          LinhasAbono.AdicionarValores(pai.qryAuxiliar.FieldByName('IDINFORME').AsInteger,
                             RoundCM(((rValor * -1) *  (PercAcaoJudicial)) / 100, 2),
                             RoundCM(((rValor * -1) *  (PercAcaoJudicial)) / 100, 2),
                             iFontePagadora,
                             CodigoNatureza,
                             FlgPensaoAlim,
                             'D')
                         else
                          LinhasAbono.AdicionarValores(pai.qryAuxiliar.FieldByName('IDINFORME').AsInteger,
                             RoundCM(((rValor * -1) {*  (PercAcaoJudicial)}), 2),
                             RoundCM(((rValor * -1) {*  (PercAcaoJudicial)}), 2),
                             iFontePagadora,
                             '3540',
                             FlgPensaoAlim,
                             'D');
                         ////Marcio Sanches Spinosa SOL 223865 KINTANA 2058724 - Fim
                           //Marcio Sanches Spinosa SOL 224376 KINTANA 2058123 - Fim

                     End;

                  {Lança a linha dos proventos de abono (positiva)}
                  iPosicao := LinhasAbono.IndexOfLinha(iLinhaInformeOrig, 1, CodigoNatureza);
                  If iPosicao > -1 Then
                     Begin
                        LinhasAbono[iPosicao].AtualizarValores(RoundCM(((rValor {* -1}) * (100 - PercAcaoJudicial)) / 100, 2), //Marcio Sanches Spinosa SOL 224376 KINTANA 2058123
                           RoundCM(((rValor {* -1}) * (100 - PercAcaoJudicial)) / 100, 2));
                     End
                  Else
                     Begin
                        LinhasAbono.AdicionarValores(iLinhaInformeOrig,
                           RoundCM(((rValor {* -1}) * (100 - PercAcaoJudicial)) / 100, 2), //Marcio Sanches Spinosa SOL 224376 KINTANA 2058123
                           RoundCM(((rValor {* -1}) * (100 - PercAcaoJudicial)) / 100, 2),//Marcio Sanches Spinosa SOL 224376 KINTANA 2058123
                           iFontePagadora,
                           CodigoNatureza,
                           FlgPensaoAlim,
                           'D');
                     End;

                  //Marcio Sanches Spinosa SOL 223865 KINTANA 2058724 - Inicio
                  {Lançando linha de rendimento da fonte pagadora Fundação 13º para Ação Judicial}
                  if ((pai.qryAuxiliar.FieldByName('IDINFORME').asstring = '167')
                  and (pDataFimProcJud > 0)) then
                     iPosicao := LinhasAbono.IndexOfLinha(62, 1, '3540')
                  else
                     iPosicao := LinhasAbono.IndexOfLinha(pai.iLinhaRendAcJud13, 1, CodigoNatureza);
                  ////Marcio Sanches Spinosa SOL 223865 KINTANA 2058724 - Fim
                  If iPosicao > -1 Then
                     Begin
//Marcio Sanches Spinosa SOL 224376 KINTANA 2058123 - Inicio
//                        LinhasAbono[iPosicao].AtualizarValores(RoundCM(((rValor {* -1}) * PercAcaoJudicial) / 100, 2),
//                           RoundCM(((rValor {* -1}) * PercAcaoJudicial) / 100, 2));

                        LinhasAbono[iPosicao].AtualizarValores(RoundCM(rValor {* -1) * PercAcaoJudicial) / 100}, 2),
                           RoundCM(rValor {* -1) * PercAcaoJudicial) / 100}, 2));
//Marcio Sanches Spinosa SOL 224376 KINTANA 2058123 - Fim

                     End
                  Else
                     Begin
//Marcio Sanches Spinosa SOL 224376 KINTANA 2058123 - Inicio
//                        LinhasAbono.AdicionarValores(pai.iLinhaRendAcJud13,
//                           RoundCM(((rValor {* -1}) * PercAcaoJudicial) / 100, 2),
//                           RoundCM(((rValor {* -1}) * PercAcaoJudicial) / 100, 2),
//                           iFontePagadora,
//                           CodigoNatureza,
//                           FlgPensaoAlim,
//                           'D');
                        //Marcio Sanches Spinosa SOL 223865 KINTANA 2058724 - Inicio
                        if ((pai.qryAuxiliar.FieldByName('IDINFORME').asstring = '167') and (pDataFimProcJud > 0)) then
                            LinhasAbono.AdicionarValores(62,
                               RoundCM((rValor {* -1 * PercAcaoJudicial}) , 2),
                               RoundCM((rValor {* -1 * PercAcaoJudicial}) , 2),
                               iFontePagadora,
                               '3540',
                               FlgPensaoAlim,
                               'D')
                        else
                            LinhasAbono.AdicionarValores(pai.iLinhaRendAcJud13,
                               RoundCM((rValor {* -1} * PercAcaoJudicial) / 100, 2),
                               RoundCM((rValor {* -1} * PercAcaoJudicial) / 100, 2),
                               iFontePagadora,
                               CodigoNatureza,
                               FlgPensaoAlim,
                               'D');
                       //Marcio Sanches Spinosa SOL 223865 KINTANA 2058724 - Fim
//Marcio Sanches Spinosa SOL 224376 KINTANA 2058123 - Fim
                     End;
                 end;
               End;

            pai.qryAuxiliar.Next;

         End; {While}
   End;
   //-----------------------------------------------------------------------//

Begin
   { Tratamento somente de idosos }
   If Idoso Then
      Begin
         {Tratamento de idosos sem Ação Judicial}
         If TemAcaoJudicial and ((pDataFimProcJud = 0) OR
         (FormatDateTime('YYYY', pDataFimProcJud) = FormatDateTime('YYYY', Pai.DataInicial))) Then
            _Calcula13SalarioIdosoComAcaoJudicial_()
         Else
            _Calcula13SalarioIdosoSemAcaoJudicial_();
      End//Marcio Sanches Spinosa SOL 224376 KINTANA 2058123
     //Marcio Sanches Spinosa SOL 224376 KINTANA 2058123 - Inicio
   Else
      Begin
         If TemAcaoJudicial Then
            _Calcula13SalarioNaoIdosoComAcaoJudicial_();
      End;
     //Marcio Sanches Spinosa SOL 224376 KINTANA 2058123 - Fim
End;

Procedure tProcessaDirfIndividual.TrataAcertoAbonoINSS();
Var rTotal: Double;
   rValor: Double;
   iLinhaInforme: Integer;
   iFontepagadora, iPosicao: Integer;
   rUltAcerto : double;   //Edilaine Ferraresi SOL 201486 KINTANA 1948483
Begin
   {Tratamento de Pessoas que ficaram Isenta ou Idosas durante o ano}
   {13º do INSS                                                     }
   iLinhaInforme := 0;
   If MolestiaGrave
   and IsentoIRRF Then//Marcio Sanches Spinosa SOL 209527 Kintana 2021934
      Begin

         {Lançar as linhas de informe negativas}
         rTotal := 0;
         iFontepagadora := pai.qryAuxiliar.FieldByName('FONTEPAGADORA').AsInteger;
         While (Not pai.qryAuxiliar.Eof) And (pai.qryAuxiliar.FieldByName('FONTEPAGADORA').AsInteger = 2) Do
            Begin
               rValor := pai.qryAuxiliar.FieldByName('VALOR').AsFloat;

               rTotal := rTotal + (rValor * -1);

               iPosicao := LinhasAbono.IndexOfLinha(pai.qryAuxiliar.FieldByName('IDINFORME').AsInteger, 2, CodigoNatureza);
               If iPosicao > -1 Then
                  Begin
                     LinhasAbono[iPosicao].AtualizarValores(RoundCM(rValor, 2),
                        RoundCM(rValor, 2));
                  End
               Else
                  Begin
                     LinhasAbono.AdicionarValores(pai.qryAuxiliar.FieldByName('IDINFORME').AsInteger,
                        RoundCM(rValor, 2),
                        RoundCM(rValor, 2),
                        2,
                        CodigoNatureza,
                        FlgPensaoAlim,
                        'D');
                  End;

               If pai.qryAuxiliar.FieldByName('CODDIRF').AsString = '5' Then
                  iLinhaInforme := pai.qryAuxiliar.FieldByName('IDINFORME').AsInteger
               Else
                  iLinhaInforme := iLinhaInformeOrig;

               pai.qryAuxiliar.Next;
            End;

         { Lançar a linha de informe de molestia grave }
         If Not pai.qryAuxiliar.IsEmpty Then
            Begin
               If pai.qryInformeDePara.Locate('IDSITUACAO; IDINFORMEORIGEM', VarArrayOf(['1', IntToStr(iLinhaInforme)]), []) Then
                  Begin
                     iLinhaInforme := pai.qryInformeDePara.FieldByName('IDINFORMEDESTINO').AsInteger;

                     iPosicao := LinhasAbono.IndexOfLinha(iLinhaInforme, 2, CodigoNatureza);
                     If iPosicao > -1 Then
                        Begin
                           LinhasAbono[iPosicao].AtualizarValores(RoundCM(rTotal, 2),
                              RoundCM(rTotal, 2));
                        End
                     Else
                        Begin
                           LinhasAbono.AdicionarValores(iLinhaInforme,
                              RoundCM(rTotal, 2),
                              RoundCM(rTotal, 2),
                              2,
                              CodigoNatureza,
                              FlgPensaoAlim,
                              'D');
                        End;
                  End;
            End;
      End
   Else
      Begin

         {Tratamento somente de idosos}
         If Idoso And
            (ValorIdoso > 0) and not pVerificaLancD and
            (pai.qryAuxiliar.FieldByName('DATAMORTE').AsDateTime = 0) Then
            Begin
               // lança devolução
               // Edilaine - SOL 199978 / KTN 1925538

               if pai.qryAuxiliar.FieldByName('FONTEPAGADORA').AsInteger = 2 then
               begin
                     rValor := ValorIdoso;                                       // Edilaine - SOL 199978 / KTN 1925538


                     {Lançar linha dos proventos de abono com valor negativo (devolução)}
                                             {Senão lançar somente o lançamento na linha de dedução}
//                    if not (pVerificaLancD) then//Marcio Sanches Spinosa SOL 229216 KINTANA 2063107
//                    begin
                     iPosicao := LinhasAbono.IndexOfLinha(pai.qryAuxiliar.FieldByName('IDINFORME').AsInteger, 2, CodigoNatureza);
                     If iPosicao > -1 Then
                        Begin
                           LinhasAbono[iPosicao].AtualizarValores(RoundCM(rValor, 2),
                              RoundCM(rValor, 2));
                        End
                     Else if ((rTotRend131 + rTotRend131A) = 0) then //Marcio Sanches Spinosa SOL 229216 KINTANA 2063107
                        Begin
                           LinhasAbono.AdicionarValores(pai.qryAuxiliar.FieldByName('IDINFORME').AsInteger,
                              RoundCM(rValor * -1, 2),    // Edilaine - SOL 199978 / KTN 1925538 - multiplicado por -1
                              RoundCM(rValor * -1, 2),    // Edilaine - SOL 199978 / KTN 1925538 - multiplicado por -1
                              2,
                              CodigoNatureza,
                              FlgPensaoAlim,
                              'D');
                        End;
//                    end;
                     {Lançar linha de dedução por idade                                               }
                     {Se dedução menor ou igual que o lançamento, lançar o valor total da dedução e o }
                     {restante na linha de proventos                                                  }
                     If (ValorIdoso <= (rValor * -1)) Then
                        Begin
                           iPosicao := LinhasAbono.IndexOfLinha(pai.iLinhaAbonoAcima65INSS, 2, CodigoNatureza);
                           If iPosicao > -1 Then
                              Begin
                                 LinhasAbono[iPosicao].AtualizarValores(RoundCM(ValorIdoso, 2),
                                    RoundCM(ValorIdoso, 2));
                              End
                           Else
                              Begin
                                 LinhasAbono.AdicionarValores(pai.iLinhaAbonoAcima65INSS,
                                    RoundCM(ValorIdoso, 2),
                                    RoundCM(ValorIdoso, 2),
                                    2,
                                    CodigoNatureza,
                                    FlgPensaoAlim,
                                    'D');
                              End;

                           {Lança a linha dos proventos de abono (positiva)}
                           iPosicao := LinhasAbono.IndexOfLinha(pai.qryAuxiliar.FieldByName('IDINFORME').AsInteger, 2, CodigoNatureza);
                           If iPosicao > -1 Then
                              Begin
                                 LinhasAbono[iPosicao].AtualizarValores(RoundCM(((rValor * -1) - ValorIdoso), 2),
                                    RoundCM(((rValor * -1) - ValorIdoso), 2));
                              End
                           Else
                              Begin
                                 LinhasAbono.AdicionarValores(pai.qryAuxiliar.FieldByName('IDINFORME').AsInteger,
                                    RoundCM((rValor * -1) - ValorIdoso, 2),
                                    RoundCM((rValor * -1) - ValorIdoso, 2),
                                    2,
                                    CodigoNatureza,
                                    FlgPensaoAlim,
                                    'D');
                              End;
                        End
                     Else
                        {Senão lançar somente o lançamento na linha de dedução}
                        if (codigoNatureza <> '3540') and ((FormatDateTime('MM',Pai.DataFinal)) <> '12')
//                        and not (pVerificaLancD)
                        then//Marcio Sanches Spinosa SOL 229216 KINTANA 2063107
                        Begin
                           iPosicao := LinhasAbono.IndexOfLinha(pai.iLinhaAbonoAcima65INSS, 2, CodigoNatureza);
                           If iPosicao > -1 Then
                              Begin
                                 LinhasAbono[iPosicao].AtualizarValores(RoundCM((rValor ), 2),
                                    RoundCM((rValor ), 2));
                              End
                           Else
                              Begin
                                 LinhasAbono.AdicionarValores(pai.iLinhaAbonoAcima65INSS,
                                    RoundCM((rValor ), 2),       // Edilaine - SOL 199978 / KTN 1925538 - removido o *-1
                                    RoundCM((rValor ), 2),       // Edilaine - SOL 199978 / KTN 1925538 - removido o *-1
                                    2,
                                    CodigoNatureza,
                                    FlgPensaoAlim,
                                    'D');

                                    //Wylliam Leite da Silva - SOL:246488 PPM:1026389 - Inicio -  Insere linha 61 alem da 124 que está aqui em cima
                                    LinhasAbono.AdicionarValores(iLinhaRend13INSS,
                                    RoundCM((rValor * -1), 2),       // Edilaine - SOL 199978 / KTN 1925538 - removido o *-1
                                    RoundCM((rValor * -1 ), 2),       // Edilaine - SOL 199978 / KTN 1925538 - removido o *-1
                                    2,
                                    CodigoNatureza,
                                    FlgPensaoAlim,
                                    'D');
                                    //Wylliam Leite da Silva - SOL:246488 PPM:1026389 - Fim
                              End; {If cdsDetAbono.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([cdsAux.FieldByName('IDINFORME').AsInteger, 2]), []) Then}
                        End; {If cdsDetAbono.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([cdsAux.FieldByName('IDINFORME').AsInteger, 2]), []) Then}

               // Edilaine - SOL 199978 / KTN 1925538 - fim
              end;
               // Edilaine Ferraresi SOL 201486 KINTANA 1948483
               iPosicao   := Linhas.IndexOfLinha(pai.iLinhaAbonoAcima65, 1, CodigoNatureza);
               if iPosicao > -1 then
                  rUltAcerto := Linhas[iPosicao].ValorLancamento
               else
                  rUltAcerto := 0;
               // Edilaine Ferraresi SOL 201486 KINTANA 1948483

                if ((rValorIdoso13Acum + ValorIdoso + rUltAcerto) < (rValorIdoso13Acum + ValorIdosoFixo)) and (ExisteEventoQuitacao) and     // Edilaine Ferraresi SOL 201486 KINTANA 1948483
                   (pai.qryAuxiliar.FieldByName('FONTEPAGADORA').AsInteger = 2) then
                begin
                   // Edilaine - SOL 199978 / KTN 1925538 - comentado
                   {While (Not pai.qryAuxiliar.Eof) And (ValorIdoso > 0) And
                      (pai.qryAuxiliar.FieldByName('FONTEPAGADORA').AsInteger = 2) Do
                      Begin
                         If pai.qryAuxiliar.FieldByName('IDINFORME').AsInteger = pai.iLinhaAbonoAcima65INSS Then
                            Begin
                               pai.qryAuxiliar.Next;
                               Continue;
                            End;
                        // rValor := pai.qryAuxiliar.FieldByName('VALOR').AsFloat;
                   } // Edilaine - SOL 199978 / KTN 1925538 - fim
                      {  rTotRend132A := rTotRend132A ^}

                      //Marcio Sanches Spinosa SOL 224376 KINTANA 2058123 - Inicio
                      IF (rTotRend132A < 0) and (pai.qryAuxiliar.FieldByName('DATAMORTE').AsDateTime = 0) and temAcaoJudicial then
                      begin
                           rValor := (rTotRend132A * -1);
                           if (rvalor + ValorIdoso) > (ValorIdosoFixo - (rValorIdoso13Acum)) then
                              rvalor := (ValorIdosoFixo - (rValorIdoso13Acum + ValorIdoso));
                      end
                      else if (ValorIdoso = 0 ) then
                           rValor := (ValorIdosoFixo) - (rValorIdoso13Acum + ValorIdoso )   // Edilaine - SOL 199978 / KTN 1925538
                      //Marcio Sanches Spinosa SOL 228926 PPM 358284 - Inicio
                      else if (ValorIdoso > 0) and (pai.qryAuxiliar.FieldByName('DATAMORTE').AsDateTime = 0) then
                      begin
                          ValorIdosoFixo := 0;
                          ValorIdoso := 0;
                          rValor := 0;
                      end
                      //Marcio Sanches Spinosa SOL 228926 PPM 358284 - Fim
                      else
                      begin
                           rValor := rTotRend132 - ValorIdoso;
                      end;


//                        rValor := {(ValorIdosoFixo) - (rValorIdoso13Acum + }ValorIdoso {)};   // Edilaine - SOL 199978 / KTN 1925538
                      //Marcio Sanches Spinosa SOL 224376 KINTANA 2058123 - Fim

                        {Lança a linha dos proventos de abono (positiva)}
                        iPosicao := LinhasAbono.IndexOfLinha(pai.iLinhaAbonoAcima65INSS, 2, CodigoNatureza);
                        If iPosicao > -1 Then
                           Begin
                              LinhasAbono[iPosicao].AtualizarValores(RoundCM((rValor ), 2),
                                 RoundCM((rValor ), 2));
                           End
                        Else
                           Begin
                              LinhasAbono.AdicionarValores(pai.iLinhaAbonoAcima65INSS,
                                 RoundCM((rValor ), 2),       // Edilaine - SOL 199978 / KTN 1925538 - removido o *-1
                                 RoundCM((rValor ), 2),       // Edilaine - SOL 199978 / KTN 1925538 - removido o *-1
                                 2,
                                 CodigoNatureza,
                                 FlgPensaoAlim,
                                 'D');
                           End; {If cdsDetAbono.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([cdsAux.FieldByName('IDINFORME').AsInteger, 2]), []) Then}


                        {Lança a linha dos proventos de abono (negativa)}
                        iPosicao := LinhasAbono.IndexOfLinha(pai.qryAuxiliar.FieldByName('IDINFORME').AsInteger, 2, CodigoNatureza);
                        If iPosicao > -1 Then
                           Begin
                              LinhasAbono[iPosicao].AtualizarValores(RoundCM((rValor * -1), 2),
                                 RoundCM((rValor * -1), 2));
                           End
                        Else
                           Begin
                              LinhasAbono.AdicionarValores(pai.qryAuxiliar.FieldByName('IDINFORME').AsInteger,
                                 RoundCM((rValor * -1) , 2),
                                 RoundCM((rValor * -1) , 2),
                                 2,
                                 CodigoNatureza,
                                 FlgPensaoAlim,
                                 'D');
                           End;
                  // Edilaine - SOL 199978 / KTN 1925538 - comentado
                  {If ValorIdoso >= (rValor * -1) Then
                         ValorIdoso := ValorIdoso - (rValor * -1)
                      Else
                         ValorIdoso := 0;}

                         //pai.qryAuxiliar.Next;
                      //End; {While}
                  // Edilaine - SOL 199978 / KTN 1925538 - fim

//                  pVerificaLancD := False;//
                end;
            End
            else if (rTotRend132A > 0)
                 and (ValorIdoso > 0)
                 and (pai.qryAuxiliar.FieldByName('DATAMORTE').AsDateTime = 0) THEN
            begin
             LinhasAbono.AdicionarValores(124,
               RoundCM((rTotRend132A ) , 2),
               RoundCM((rTotRend132A ) , 2),
               2,
               CodigoNatureza,
               FlgPensaoAlim,
               'N');

             LinhasAbono.AdicionarValores(61,
               RoundCM((rTotRend132A * -1) , 2),
               RoundCM((rTotRend132A * -1) , 2),
               2,
               CodigoNatureza,
               FlgPensaoAlim,
               'D');
            end
            else
            //Marcio Sanches Spinosa SOL 227199 KINTANA 2061171 - Inicio
            if (rTotRend131 + rTotRend131A < ValorIdosoFixo) and (rTotRend132 + rTotRend132A > ValorIdosoFixo) and (rvaloridoso13acum > 0)
            and (ValorIdoso > 0)
            and ((FormatDateTime('YYYY', pDataFimProcJud) <> FormatDateTime('YYYY', Pai.DataInicial)) or not (TemAcaoJudicial)) then
            //Marcio Sanches Spinosa SOL 227199 KINTANA 2061171
            begin
                  iPosicao := LinhasAbono.IndexOfLinha(61, 2, CodigoNatureza);
                 If iPosicao > -1 Then
                 Begin
                    LinhasAbono[iPosicao].AtualizarValores(RoundCM((rValor * -0), 2),
                       RoundCM((rValor * -0), 2));
                 End;
                 ////Marcio Sanches Spinosa SOL 227199 KINTANA 2061171 - Inicio
                 IF (rTotRend132 > ValorIdosoFixo) and (valoridoso >= 0) then
                 begin
                  if (RoundCM((rTotRend131+ rTotRend131A),2) <> 0) then
                  begin
                      IF ((Pai.qryDadosIndividuais.fieldByname('CPFCNPJ').AsString) <> '00141178604') then
                      begin
                             LinhasAbono.AdicionarValores(61,
                             //Wylliam Leite da Silva - SOL:246488 PPM:1026389 - Início
                             RoundCM((ValorIdosoFixo - (rTotRend131 +rTotRend131A )) * -1, 2),
                             RoundCM((ValorIdosoFixo - (rTotRend131+ rTotRend131A) )* -1, 2),
                             //RoundCM((ValorIdosoFixo - rTotRend131) * -1, 2),
                             //RoundCM((ValorIdosoFixo - (rTotRend131) )* -1, 2),
                             2,
                             CodigoNatureza,
                             FlgPensaoAlim,
                             'D');

                          LinhasAbono.AdicionarValores(124  ,
                             RoundCM((ValorIdosoFixo - (rTotRend131+rTotRend131A) {* -1}), 2),
                             RoundCM((ValorIdosoFixo - (rTotRend131+rTotRend131A) {* -1}), 2),
                             //RoundCM((ValorIdosoFixo - (rTotRend131) {* -1}), 2),
                             //RoundCM((ValorIdosoFixo - (rTotRend131) {* -1}), 2),
                             2,
                             CodigoNatureza,
                             FlgPensaoAlim,
                             'D')
                     //Wylliam Leite da Silva - SOL:246488 PPM:1026389 - Fim
                      end
                      else
                      begin
                           LinhasAbono.AdicionarValores(61,
                             //Wylliam Leite da Silva - SOL:246488 PPM:1026389 - Início
                             RoundCM((ValorIdoso - (rTotRend131 +rTotRend131A )) * -1, 2),
                             RoundCM((ValorIdoso - (rTotRend131+ rTotRend131A) )* -1, 2),
                             //RoundCM((ValorIdosoFixo - rTotRend131) * -1, 2),
                             //RoundCM((ValorIdosoFixo - (rTotRend131) )* -1, 2),
                             2,
                             CodigoNatureza,
                             FlgPensaoAlim,
                             'D');

                           LinhasAbono.AdicionarValores(124  ,
                             RoundCM((ValorIdoso - (rTotRend131+rTotRend131A) {* -1}), 2),
                             RoundCM((ValorIdoso - (rTotRend131+rTotRend131A) {* -1}), 2),
                             //RoundCM((ValorIdosoFixo - (rTotRend131) {* -1}), 2),
                             //RoundCM((ValorIdosoFixo - (rTotRend131) {* -1}), 2),
                             2,
                             CodigoNatureza,
                             FlgPensaoAlim,
                             'D');
                           //Wylliam Leite da Silva - SOL:246488 PPM:1026389 - Fim
                      end;


                  end
                  else
                  begin
                     LinhasAbono.AdicionarValores(61,
                     RoundCM((ValorIdosoFixo - (rTotRend131 +rTotRend131A )) * -1, 2),
                     RoundCM((ValorIdosoFixo - (rTotRend131+ rTotRend131A) )* -1, 2),
                     2,
                     CodigoNatureza,
                     FlgPensaoAlim,
                     'D');

                  LinhasAbono.AdicionarValores(124  ,
                     RoundCM((ValorIdosoFixo - (rTotRend131+rTotRend131A) {* -1}), 2),
                     RoundCM((ValorIdosoFixo - (rTotRend131+rTotRend131A) {* -1}), 2),
                     2,
                     CodigoNatureza,
                     FlgPensaoAlim,
                     'D');

                  end;


                end
                else IF (rTotRend132 > ValorIdosoFixo) and (valoridoso < 0) then
                begin
                   LinhasAbono.AdicionarValores(61,
                   RoundCM(rTotRend132A * -1, 2),
                   RoundCM(rTotRend132A * -1, 2),
                   2,
                   CodigoNatureza,
                   FlgPensaoAlim,
                   'D');


                LinhasAbono.AdicionarValores(124  ,
                   RoundCM(rTotRend132A, 2),
                   RoundCM(rTotRend132A, 2),
                   2,
                   CodigoNatureza,
                   FlgPensaoAlim,
                   'D');
                end
                else
                begin
                   LinhasAbono.AdicionarValores(61,
                   RoundCM(rTotRend132 * -1, 2),
                   RoundCM(rTotRend132 * -1, 2),
                   2,
                   CodigoNatureza,
                   FlgPensaoAlim,
                   'D');


                LinhasAbono.AdicionarValores(124  ,
                   RoundCM((rTotRend132 ), 2),
                   RoundCM((rTotRend132 ), 2),
                   2,
                   CodigoNatureza,
                   FlgPensaoAlim,
                   'D');
                end;
                ////Marcio Sanches Spinosa SOL 227199 KINTANA 2061171 - Fim
             end

            else
            begin
               verificaPagamento13Anterior;
               if not TemAcaoJudicial and (rValorIdoso13acum <= ValorIdosoFixo)
               and (rvaloridoso13acum > 0) and (iFontepagadora = 2) then//(pai.qrySalarioNormal2.fieldbyname('FONTEPAGADORA').asinteger = 2) then
               begin
                LinhasAbono.AdicionarValores(124,
                   RoundCM((Pai.qrySalarioNormal2.fieldbyname('VLRBASE65').AsFloat ) , 2),
                   RoundCM((Pai.qrySalarioNormal2.fieldbyname('VLRBASE65').AsFloat  ) , 2),
                   2,
                   CodigoNatureza,
                   FlgPensaoAlim,
                   'D');

                 LinhasAbono.AdicionarValores(61,
                   RoundCM((Pai.qrySalarioNormal2.fieldbyname('VLRBASE65').AsFloat  * - 1) , 2),
                   RoundCM((Pai.qrySalarioNormal2.fieldbyname('VLRBASE65').AsFloat  * -1) , 2),
                   2,
                   CodigoNatureza,
                   FlgPensaoAlim,
                   'D');
                end
                else IF (RoundCM((rValorIdoso13acum + ValorIdosoFixo),2) <> ValorIdosoFixo)//1710.78) Wylliam Leite da Silva - SOL:246488 PPM:1026389
                and not (TemAcaoJudicial)
                and (iFontepagadora = 2) then//(pai.qrySalarioNormal2.fieldbyname('FONTEPAGADORA').asinteger = 2) THEN //Marcio Sanches Spinosa SOL 235686 PPM 459048
                begin
                  LinhasAbono.AdicionarValores(124,
                     RoundCM((Pai.qrySalarioNormal2.fieldbyname('VLRBASE65').AsFloat ) , 2),
                     RoundCM((Pai.qrySalarioNormal2.fieldbyname('VLRBASE65').AsFloat  ) , 2),
                     2,
                     CodigoNatureza,
                     FlgPensaoAlim,
                     'D');

                   LinhasAbono.AdicionarValores(61,
                     RoundCM((Pai.qrySalarioNormal2.fieldbyname('VLRBASE65').AsFloat  * -1) , 2),
                     RoundCM((Pai.qrySalarioNormal2.fieldbyname('VLRBASE65').AsFloat  * -1) , 2),
                     2,
                     CodigoNatureza,
                     FlgPensaoAlim,
                     'D');
                end  //Wylliam Leite da Silva - SOL:246488 PPM:1026389 - Fim
                else IF (RoundCM((rValorIdoso13acum + ValorIdosoFixo),2) <> ValorIdosoFixo)//1710.78) Wylliam Leite da Silva - SOL:246488 PPM:1026389
                and not (TemAcaoJudicial)
                and (iFontepagadora = 1){(pai.qrySalarioNormal2.fieldbyname('FONTEPAGADORA').asinteger = 1)} and (rValorIdoso13acum < ValorIdosoFixo) THEN //Marcio Sanches Spinosa SOL 235686 PPM 459048
                begin
                  LinhasAbono.AdicionarValores(124,
                     RoundCM((ValorIdoso)-(Pai.qrySalarioNormal2.fieldbyname('VLRBASE65').AsFloat ) , 2),
                     RoundCM((ValorIdoso)-(Pai.qrySalarioNormal2.fieldbyname('VLRBASE65').AsFloat  ) , 2),
                     2,
                     CodigoNatureza,
                     FlgPensaoAlim,
                     'D');

                   LinhasAbono.AdicionarValores(61,
                     RoundCM(((ValorIdoso)-(Pai.qrySalarioNormal2.fieldbyname('VLRBASE65').AsFloat) ) * -1  , 2),
                     RoundCM(((ValorIdoso)-(Pai.qrySalarioNormal2.fieldbyname('VLRBASE65').AsFloat) ) * -1  , 2),
                     2,
                     CodigoNatureza,
                     FlgPensaoAlim,
                     'D');
                end; //Wylliam Leite da Silva - SOL:246488 PPM:1026389 - Fim
           end;
            {If bIdoso And (fValorIdoso > 0) Then}
      End; {if bMolestiaGrave Then}
End;

Procedure tProcessaDirfIndividual.TrataDeducaoDepAbono();
//-----------------------------------------------------------------------//
   Function _BuscaDedDepAbono_(): Boolean;
   Var sSql: String;
   Begin
      sSql := 'SELECT LXI.IDINFORME,' + #13#10 +
         '       LXI.VLRLANC AS VALOR' + #13#10 +
         'FROM LANCXINFORME LXI,' + #13#10 +
         '     LANCIRRF     LIR' + #13#10 +
         'WHERE LIR.IDBENEFIRRF    = ' + IntToStr(IdPessoa) + #13#10 +
         //                  '  AND LIR.DATALANCAMENTO >= TO_DATE('+QuotedStr('01/01/'+IntToStr(iAno))+', ''DD/MM/YYYY'')'+#13#10+
   //                  '  AND LIR.DATALANCAMENTO <= TO_DATE('+QuotedStr('31/12/'+IntToStr(iAno))+', ''DD/MM/YYYY'')'+#13#10+
      '  AND LIR.DATALANCAMENTO >= TO_DATE(' + QuotedStr(DateToStr(pai.DataInicial)) + ', ''DD/MM/YYYY'')' + #13#10 +
         '  AND LIR.DATALANCAMENTO <= TO_DATE(' + QuotedStr(DateToStr(pai.DataFinal)) + ', ''DD/MM/YYYY'')' + #13#10 +
         '  AND LIR.IDLANCIRRF     = LXI.IDLANCIRRF' + #13#10 +
         '  AND LXI.IDINFORME     IN (' + IntToStr(pai.iLinhaDedDepAbono) + ',' + IntToStr(pai.iLinhaDedDepAbonoMol) + ')';
      pai.qryAuxiliar.Data := pai.GetDataPacket(sSql);
      Result := Not pai.qryAuxiliar.IsEmpty;
   End;
   //-----------------------------------------------------------------------//
   Procedure _MolestiaGrave_();
   Var rValor, rValorLancto: double;
      iPosicao: Integer;
   Begin
      rValor := pai.qryAuxiliar.FieldByName('VALOR').AsFloat;
      iPosicao := Linhas.IndexOfLinha(pai.iLinhaDedDepAbonoMol);
      If iPosicao > -1 Then
         Begin
            rValorLancto := Linhas[iPosicao].ValorLancamento; // cdsDet.FieldByName('VLRLANC').AsFloat;
            Linhas.Delete(iPosicao); // cdsDet.delete;

            iPosicao := LinhasAbono.IndexOfLinha(pai.iLinhaDedDepAbono);
            If iPosicao > -1 Then
               Begin
                  LinhasAbono[iPosicao].AtualizarValores(RoundCM(rValor, 2),
                     RoundCM(rValor, 2));
               End
            Else
               Begin
                  LinhasAbono.AdicionarValores(pai.iLinhaDedDepAbono,
                     RoundCM(rValor, 2),
                     RoundCM(rValor, 2),
                     1,
                     CodigoNatureza,
                     FlgPensaoAlim,
                     'D');
               End;

            If rValorLancto = rValor Then
               Begin
                  iPosicao := LinhasAbono.IndexOfLinha(pai.iLinhaDedDepAbonoMol);
                  If iPosicao > -1 Then
                     Begin
                        LinhasAbono[iPosicao].AtualizarValores(RoundCM(rValor, 2),
                           RoundCM(rValor, 2));
                     End
                  Else
                     Begin
                        LinhasAbono.AdicionarValores(pai.iLinhaDedDepAbonoMol,
                           RoundCM(rValor * -1, 2),
                           RoundCM(rValor * -1, 2),
                           1,
                           CodigoNatureza,
                           FlgPensaoAlim,
                           'D');
                     End;
                  exit;
               End;
            If rValor <> rValorLancto Then
               Begin
                  If rValor > rValorLancto Then
                     Begin
                        Linhas.AdicionarValores(pai.iLinhaDedDepAbonoMol,
                           RoundCM(rValorLancto * -1, 2),
                           RoundCM(rValorLancto * -1, 2),
                           1,
                           CodigoNatureza,
                           FlgPensaoAlim);
                     End
                  Else
                     Begin
                        Linhas.AdicionarValores(pai.iLinhaDedDepAbonoMol,
                           RoundCM(rValorLancto * -1, 2),
                           RoundCM(rValorLancto * -1, 2),
                           1,
                           CodigoNatureza,
                           FlgPensaoAlim);
                     End;
               End;
         End;
   End;
   //-----------------------------------------------------------------------//
   Procedure _Normal_();
   Var rValor, rValorLancto: Double;
      iPosicao: Integer;
   Begin
      {Senão for molestia grave lançar a diferença na linha normal}
      rValor := pai.qryAuxiliar.FieldByName('VALOR').AsFloat;

      // Pesquisa Linha de Deducao de Dependentes Do Abono Normal
      iPosicao := Linhas.IndexOfLinha(pai.iLinhaDedDepAbono);
      // Se não encontrada a Linha de Deducao de Dependentes Do Abono Normal
      If iPosicao = -1 Then
         // Pesquisa Linha de Deducao de Dependentes Do Abono Molestia
         iPosicao := Linhas.IndexOfLinha(pai.iLinhaDedDepAbonoMol);

      If iPosicao > -1 Then
         Begin
            rValorLancto := Linhas[iPosicao].ValorLancamento; // cdsDet.FieldByName('VLRLANC').AsFloat;
            Linhas.Delete(iPosicao); // cdsDet.delete;

            If rValor <> rValorLancto Then
               Begin
                  If rValor > rValorLancto Then
                     Begin
                        Linhas.AdicionarValores(pai.iLinhaDedDepAbono,
                           RoundCM((rValorLancto - rValor) * -1, 2),
                           RoundCM((rValorLancto - rValor) * -1, 2),
                           1,
                           CodigoNatureza,
                           FlgPensaoAlim);
                     End
                  Else
                     Begin
                        Linhas.AdicionarValores(pai.iLinhaDedDepAbono,
                           RoundCM(rValor - rValorLancto, 2),
                           RoundCM(rValor - rValorLancto, 2),
                           1,
                           CodigoNatureza,
                           FlgPensaoAlim);
                     End;
               End;
         End
   End;
   //-----------------------------------------------------------------------//
Begin
   If _BuscaDedDepAbono_() Then
      Begin
         {Se o recebedor estiver em molestia grave, lançar a diferença na linha de molestia}
         If MolestiaGrave
         and IsentoIRRF Then
            _MolestiaGrave_()//Marcio Sanches Spinosa SOL 209527 Kintana 2021934
         Else
            _Normal_()
     End;
End;

Constructor tProcessaDirfIndividual.Create(Const AOnwer: TProcessaDirf;
   Const CodPessoa: String);
Begin
   Inherited Create;
   FLinhas := tLinhasInformeDirf.Create;
   FLinhasAbono := tLinhasInformeDirf.Create;
   FCodigoNaturezas := tCodigosNatureza.Create;
   Pai := AOnwer;
   CodigoPessoa := CodPessoa;
   IdTitular := -1;
//   pVerificaLancD := False;//Marcio Sanches Spinosa SOL 229216 KINTANA 2063107
End;

Procedure tProcessaDirfIndividual.Clear;
Begin
   FLinhas.Clear;
   FLinhasAbono.Clear;
   FCodigoNaturezas.Clear;
End;

Destructor tProcessaDirfIndividual.Destroy;
Begin
   Inherited;
   FreeAndNil(FLinhas);
   FreeAndNil(FLinhasAbono);
   FreeAndNil(fCodigoNaturezas);
End;

//Wylliam Leite da Silva - SOL:246488 PPM:1026389
Function tProcessaDirfIndividual.Processar(var prQtdVlrIdosoFixo: Integer; var prIDPESSOA: String; TipoDirf: tTipoDirf): Boolean;
Begin
   Result := False;
   iQtdDecVlrIdosoFixo:= prQtdVlrIdosoFixo; //Wylliam Leite da Silva - SOL:246488 PPM:1026389 - Inicio
   sIDPESSOA := prIDPESSOA;
   If CarregarDadosIndividuais() Then
      Begin
         //   If ValidaRubricas() then
         Result := CalcularDadosIndividuais(TipoDirf)
            //   else
      //   begin
      //     MostraMensagem('Ocorreu um erro na Validação das Rubricas!'+#13#10);
      //     inc(Pai.iErrados);
      //   end;
      End
   Else
      Begin
         MostraMensagem('Ocorreu um erro na localização dos dados!');
         inc(Pai.IErrados);
      End;
End;

Function tProcessaDirfIndividual.GravarDados(Const sPeriodo: String;
   Const bGravarSeparado: Boolean): Boolean;
Begin
   Result := False;
   If Linhas.Count > 0 Then
      If GravarFontePagadora1(sPeriodo, bGravarSeparado) Then
      begin
         VerificaSituacaoProcessoEncerrado(IdPessoa);
         Result := GravarFontePagadora2(sPeriodo, bGravarSeparado);
      end;
End;

{function tProcessaDirfIndividual.ValidaRubricas : Boolean;
begin
  Result := True;
  With Pai.qryDadosIndividuais do
  Begin
    First;
    While not EOF do
    begin
      If fieldbyname('FLGDESCONTO').asinteger <> 2 then
      begin
        If trim(fieldbyname('CODIRRFDARF').asstring) = '' then
        begin
          MostraMensagem(#13#10+
                         'A Rubrica '+FieldbyName('IDPROVENTO').asString + ' está sem a informação de Natureza de Rendimentos Preenchida.' +#13#10+
                         'Favor verificar o Cadastro de Rubricas Salariais, no Sistema de Folha de Benefícios. '+#13#10);
          Result := false;
        end;
      end;
      Next;
    end;
  end;
end; }

Function tProcessaDirfIndividual.ValidaRubricaIndividual: Boolean;
Begin
   Result := True;
   With Pai.qryDadosIndividuais Do
      Begin
         If FieldbyName('FLGDESCONTO').asinteger <> 2 Then
            Begin
               If trim(FieldByName('CODIRRFDARF').asstring) = '' Then
                  Begin
                     MostraMensagem(#13#10 +
                        'A Rubrica ' + FieldbyName('IDPROVENTO').asString + ' está sem a informação de Natureza de Rendimentos Preenchida.' + #13#10 +
                        'Favor verificar o Cadastro de Rubricas Salariais, no Sistema de Folha de Benefícios. ' + #13#10);
                     Result := false;
                  End;
            End;
      End;
End;

{procedure tProcessaDirfIndividual.InsereLinhasClientDataSet(const oCds : TClientDataSet;
                                                            const oClient : TClientDataSet);
var i : Integer;
begin
  while not oCds.Eof do
  begin
    oClient.Append;
    For i := 0 to oCds.FieldCount-1 do
      oClient.Fields[i].Value := oCds.Fields[i].Value;
    oClient.Post;
    oCds.Next;
  end;
end;}

Procedure tProcessaDirfIndividual.AdicionaDadosClientDataSets(Const oQry: TCMSqlParams;
   Const oClient: TClientDataSet);
//var oLst : TstringList;
Begin
   oQry.prepare;
   oQry.ParamByName('NumDocumento').AsString := Self.CodigoPessoa;
   oQry.open;
   With TStringList.Create() Do
      Begin
         Text := oQry.SQLChanged;
         SaveToFile('C:\Planus\Temp\BuscaDirfIndividual.Sql');
         Clear;
         Free;
      End;
   oClient.Data := oQry.ClientDataSet.Data;
   oClient.First;
End;

{
procedure tProcessaDirfIndividual.AdicionaDadosClientDataSets(const oQry : TCMSqlParams;
                                                              const oClient : TClientDataSet);
var oCds : TClientDataSet;
    bIgual : Boolean;
begin
  oCds := TClientDataSet.Create(nil);
  try
    bIgual := True;
//    oCds.Data := Pai.GetDataPacket('select dp.idpessoa, dp.idtitular, pes.numdocumento'+#13#10+
//                                   'from depentit dp, pessoa pes'+#13#10+
//                                   'where pes.idpessoa = dp.idpessoa'+#13#10+
//                                   '  and pes.numdocumento = '+QuotedStr(Self.CodigoPessoa)+#13#10+
//                                   'order By dp.idPessoa');

    oCds.Data := Pai.GetDataPacket('select pes.idpessoa, pes.numdocumento'+#13#10+
                                   'from pessoa pes'+#13#10+
                                   'where pes.numdocumento = '+QuotedStr(Self.CodigoPessoa)+#13#10+
                                   'order By pes.idPessoa');

    While Not oCds.Eof do
    begin
//      If oCds.FieldByName('idpessoa').asInteger = oCds.FieldByName('idtitular').asInteger then
      If bIgual then
        IdTitular := oCds.FieldByName('idpessoa').asInteger;
      oQry.prepare;
      oQry.ParamByName('Responsavel').AsInteger := oCds.FieldbyName('IdPessoa').asInteger;
      oQry.open;
      If bIgual then
      begin
        oClient.Data := oQry.ClientDataSet.Data;
        bIgual := False;
      end
      else
      begin
        If not oQry.ClientDataSet.IsEmpty then
          InsereLinhasClientDataSet(oQry.ClientDataSet,oClient);
      end;
      oCds.Next;
    end
  finally
    oClient.First;
    FreeAndNil(oCds);
  end;
end;
}

Function tProcessaDirfIndividual.CarregarDadosIndividuais: Boolean;
Begin
   Pai.QryDadosIndividuais.Close;
   AdicionaDadosClientDataSets(Pai.sqlDadosIndividuais, Pai.qryDadosIndividuais);
   result := Not Pai.qryDadosIndividuais.IsEmpty;
   idPessoa := -1;
   If Result Then
      IDPessoa := Pai.qryDadosIndividuais.FieldByName('IdPessoa').asInteger;
End;

//Wylliam Leite da Silva - SOL:246488 PPM:1026389
function tProcessaDirfIndividual.TrataIdosoAbono(Const bPodeCalcular: Boolean; TipoDirf: tTipoDirf): Integer;
Var
   rTotalRend13: Double;
   rTotalRend13A: Double;
   iPosicao: Integer;
   sCodigoNatureza: array [1..2] of String;
Begin
   TratamentoIdosoAbono:= True; //Wylliam Leite da Silva - SOL:246488 PPM:1026389
   VerificaIdosoAbonoINSS:= True; //Wylliam Leite da Silva - SOL:246488 PPM:1026389
   sCodigoNatureza[1] := '';
   sCodigoNatureza[2] := '';
   // Alterado Por Arnaldo V. Scarin, em 06/09/2010
   // SOL 133232 - Essa variavel (bPodeCalcular) indica se pode ser feito o cálculo
   // quando está sendo feita a busca de uma pessoa normal, que não tenha ação judicial
   // em sua matrícula, e que tenha 2 ou mais idpessoas para o mesmo cpf, ou no caso
   // da existência de ação judicial para um beneficiário que tenha 2 idpessoas (matriculas)
   // sendo que, nesse ultimo caso, a variável será verdadeira, caso o idpessoa que esteja
   // sendo validado é o mesmo idpessoa da ação judicial, ou falso se for o outro idpessoa.
   If bPodeCalcular Then
      Begin

         {Tratamento de Décimo Terceiro para Idosos}
//         rTotalRend13 := rTotRend131 + rTotRend132;
//         rTotalRend13A := rTotRend131A + rTotRend132A;

         rTotalRend13 := rTotRend131 + rTotRend131A;
         rTotalRend13A := rTotRend132 + rTotRend132A;


//         sCodigoNatureza[1] := CodigoNaturezas.LocalizaNatureza(rTotRend1, 0);
//         sCodigoNatureza[2] := CodigoNaturezas.LocalizaNatureza(0, rTotRend2);

         sCodigoNatureza[1] := CodigoNaturezas.LocalizaNaturezaAbono(rTotalRend13, 0); // Thiago Melo SOL 219219 Kintana 2051170
         sCodigoNatureza[2] := CodigoNaturezas.LocalizaNaturezaAbono(0, rTotalRend13A); // Thiago Melo SOL 219219 Kintana 2051170

         if (sCodigoNatureza[1] = EmptyStr) and (sCodigoNatureza[2] <> EmptyStr) then
            sCodigoNatureza[1] := sCodigoNatureza[2];


//         sCodigoNatureza := CodigoNaturezas.LocalizaNaturezaAbono(rTotalRend13, rTotalRend13A);
         if Pai.TipoDirf = td13Salario then
            verificaPagamento13Anterior;
         ValorIdoso := ValorIdoso13;
         //If (rTotalRend13 <> 0) Or (rTotalRend13A > 0) Then    // Edilaine - SOL 199086 / KTN 1915798
         If (rTotalRend13 <> 0) Or (rTotalRend13A <> 0) Then     // Edilaine - SOL 199086 / KTN 1915798
            Begin
               If (rValorIdoso13Acum > 0)
               or (FormatDateTime('MM', Pai.DataFinal) = '08') Then  //marcio sanches spinosa SOL 244483 PPM 605995
                  Begin
                     If (rValorIdoso13Acum >= ValorIdosoFixo)
                     or (FormatDateTime('MM', Pai.DataFinal) = '08') then
                        Begin
                           ValorIdosoFixo := 0;
                           ValorIdoso := 0;
                        End
                     Else
                        Begin
                          //Wylliam Leite da Silva - SOL:246488 PPM:1026389 - Inicio
                           Inc(iQtdDecVlrIdosoFixo);
                           if (iQtdDecVlrIdosoFixo = 1) then
                           begin
                             ValorIdosoFixo := ValorIdosoFixo;
                             ValorIdoso := ValorIdosoFixo;
                           end
                           else
                           begin
                             ValorIdosoFixo := ValorIdosoFixo - rValorIdoso13Acum;
                             ValorIdoso := ValorIdosoFixo;
                           end;
                           //Wylliam Leite da Silva - SOL:246488 PPM:1026389 - Fim
                        End;
                  End
////                  //Marcio Sanches Spinosa SOL 218741 KINTANA 2050535 - Inicio
                  else if not (ExisteEventoQuitacao) and
                  (not Verifica62Folha13Salario) and //Marcio Sanches Spinosa SOL 219023 KINTANA 2054837
                  (not Verifica61Folha13Salario) then////Marcio Sanches Spinosa SOL 225900 KINTANA 2059548
                  begin
                     ValorIdosoFixo := 0;
                     ValorIdoso := 0;
                  end;
                  //Marcio Sanches Spinosa SOL 218741 KINTANA 2050535 - Fim
               If Not (TemAcaoJudicial)
               or ((pDataFimProcJud > 0)
               and (FormatDateTime('YYYY',pDataFimProcJud) = FormatDateTime('YYYY',Pai.DataInicial))) Then
                  Begin
                     If ((rTotRend131 + rTotRend131A) >= ValorIdoso) Then
                        Begin
                           {Lançando linha de idoso da fonte pagadora Fundação 13º}
                           iPosicao := Linhas.IndexOfLinha(pai.iLinhaAbonoAcima65, 1, sCodigoNatureza[1]);//Marcio Sanches Spinosa SOL 219023 KINTANA 2054837
                           If iPosicao > -1 Then
                              Begin
                                 Linhas[iPosicao].AtualizarValores(RoundCM(ValorIdoso, 2),
                                    RoundCM(ValorIdoso, 2));
                              End
                           Else
                              Begin
                                 Linhas.AdicionarValores(pai.iLinhaAbonoAcima65,
                                    RoundCM(ValorIdoso, 2),
                                    RoundCM(ValorIdoso, 2),
                                    1,
                                    sCodigoNatureza[1],
                                    FlgPensaoAlim);
                              End;

                           {Lançando linha de rendimento da fonte pagadora Fundação 13º}
                           iPosicao := Linhas.IndexOfLinha(iLinhaRend13, 1, sCodigoNatureza[1]);
                           If iPosicao > -1 Then
                              Begin
                                 Linhas[iPosicao].AtualizarValores(RoundCM((rTotRend131 + rTotRend131A) - ValorIdoso, 2),
                                    RoundCM((rTotRend131 + rTotRend131A) - ValorIdoso, 2));
                              End
                           Else
                              Begin
                                 Linhas.AdicionarValores(iLInhaRend13,
                                    RoundCM((rTotRend131 + rTotRend131A) - ValorIdoso, 2),
                                    RoundCM((rTotRend131 + rTotRend131A) - ValorIdoso, 2),
                                    1,
                                    sCodigoNatureza[1],
                                    FlgPensaoAlim);
                              End;
                           ValorIdoso := 0;

                           {Lançando linha de rendimento da fonte pagadora INSS 13º}
                           ////marcio sanches spinosa SOL 244483 PPM 605995 - Inicio
//                           if (FormatDateTime('MM', Pai.DataFinal) <> '08') or (ValorIdoso = 0) then
//                           begin
                           iPosicao := Linhas.IndexOfLinha(iLinhaRend13INSS, 2, sCodigoNatureza[2]);//Marcio Sanches Spinosa SOL 219023 KINTANA 2054837
                           If iPosicao > -1 Then
                              Begin
                                 Linhas[iPosicao].AtualizarValores(RoundCM((rTotRend132 + rTotRend132A), 2),
                                    RoundCM((rTotRend132 + rTotRend132A), 2));
                              End
                           Else
                              Begin
                                 Linhas.AdicionarValores(iLinhaRend13INSS,
                                    RoundCM((rTotRend132 + rTotRend132A), 2),
                                    RoundCM((rTotRend132 + rTotRend132A), 2),
                                    2,
                                    sCodigoNatureza[2],
                                    FlgPensaoAlim);
                              End;
//                           end; //marcio sanches spinosa SOL 244483 PPM 605995 - Fim
                        End
                     Else
                        Begin
                           {Lançando linha de rendimento negativa da fonte pagadora Fundação 13º}
                           If ((rTotRend131 + rTotRend131A) < 0) Then
                              Begin
                                 iPosicao := Linhas.IndexOfLinha(iLinhaRend13, 1, sCodigoNatureza[1]);//Marcio Sanches Spinosa SOL 219023 KINTANA 2054837
                                 If iPosicao > -1 Then
                                    Begin
                                       Linhas[iPosicao].AtualizarValores(RoundCM((rTotRend131 + rTotRend131A), 2),
                                          RoundCM((rTotRend131 + rTotRend131A), 2));
                                    End
                                 Else
                                    Begin
                                       Linhas.AdicionarValores(iLinhaRend13,
                                          RoundCM((rTotRend131 + rTotRend131A), 2),
                                          RoundCM((rTotRend131 + rTotRend131A), 2),
                                          1,
                                          sCodigoNatureza[1],
                                          FlgPensaoAlim);
                                    End;
                              End
                           Else
                              Begin
                                 {Lançando linha de idoso da fonte pagadora Fundação 13º}
                                 iPosicao := Linhas.IndexOfLinha(pai.iLinhaAbonoAcima65, 1, sCodigoNatureza[1]);//Marcio Sanches Spinosa SOL 219023 KINTANA 2054837
                                 If iPosicao > -1 Then
                                    Begin
                                       Linhas[iPosicao].AtualizarValores(RoundCM((rTotRend131 + rTotRend131A), 2),
                                          RoundCM((rTotRend131 + rTotRend131A), 2));
                                    End
                                 Else if (ValorIdoso - rValorIdoso13acum)<(ValorIdoso) then
                                    Begin
                                       Linhas.AdicionarValores(pai.iLinhaAbonoAcima65,
                                          RoundCM((ValorIdoso - rValorIdoso13Acum), 2),
                                          RoundCM((ValorIdoso - rValorIdoso13Acum), 2),
                                          1,
                                          sCodigoNatureza[1],
                                          FlgPensaoAlim);

                                          Linhas.AdicionarValores(62,
                                          RoundCM(rValorIdoso13Acum - (ValorIdoso - rValorIdoso13Acum), 2),
                                          RoundCM(rValorIdoso13Acum - (ValorIdoso - rValorIdoso13Acum), 2),
                                          1,
                                          sCodigoNatureza[1],
                                          FlgPensaoAlim);
                                    End
                                    else
                                    begin
                                       Linhas.AdicionarValores(pai.iLinhaAbonoAcima65,
                                          RoundCM((rTotRend131 + rTotRend131A), 2),
                                          RoundCM((rTotRend131 + rTotRend131A), 2),
                                          1,
                                          sCodigoNatureza[1],
                                          FlgPensaoAlim);
                                    end;
                                       ValorIdoso := ValorIdoso - (rTotRend131 + rTotRend131A); //Wylliam Leite da Silva - SOL:246488 PPM:1026389
                              End;

                           If ((rTotRend132 + rTotRend132A) >= ValorIdoso)
                           and not (VerificaMesesIdade65 = 780) Then//Marcio Sanches Spinosa SOL 228926 PPM 358284
                              Begin
                                 if (FormatDateTime('MM', Pai.DataFinal) = '08') then
                                 begin
                                 {Lançando linha de idoso da fonte pagadora INSS 13º}
                                 iPosicao := Linhas.IndexOfLinha(pai.iLinhaAbonoAcima65INSS, 2, sCodigoNatureza[2]);//Marcio Sanches Spinosa SOL 219023 KINTANA 2054837
                                 If iPosicao > -1 Then
                                    Begin
                                       Linhas[iPosicao].AtualizarValores(RoundCM(ValorIdoso, 2),
                                          RoundCM(ValorIdoso, 2));
                                    End
                                 Else
                                    Begin
                                       Linhas.AdicionarValores(pai.iLinhaAbonoAcima65INSS,
                                          RoundCM(ValorIdoso, 2),
                                          RoundCM(ValorIdoso, 2),
                                          2,
                                          sCodigoNatureza[2],
                                          FlgPensaoAlim);
                                    End;
                                  end;
                                 {Lançando linha de Rendimento da fonte pagadora INSS 13º}
                                 iPosicao := Linhas.IndexOfLinha(iLinhaRend13INSS, 2, sCodigoNatureza[2]);//Marcio Sanches Spinosa SOL 219023 KINTANA 2054837
                                 If iPosicao > -1 Then
                                    Begin
                                       Linhas[iPosicao].AtualizarValores(RoundCM((rTotRend132 + rTotRend132A) - ValorIdoso, 2),
                                          RoundCM((rTotRend132 + rTotRend132A) - ValorIdoso, 2));
                                    End
                                 Else
                                    Begin
                                       Linhas.AdicionarValores(iLinhaRend13INSS,
                                          RoundCM((rTotRend132 + rTotRend132A){ - ValorIdoso}, 2), //Wylliam Silva SOL 246623 PPM 732617
                                          RoundCM((rTotRend132 + rTotRend132A) {- ValorIdoso}, 2), //Wylliam Silva SOL 246623 PPM 732617
                                          2,
                                          sCodigoNatureza[2],
                                          FlgPensaoAlim);
                                    End;
                         //        ValorIdoso := 0; //Marcio Sanches Spinosa SOL 229216 KINTANA 2063107
                              End
 //                          //Marcio Sanches Spinosa SOL 225900 KINTANA 2059548 - Inicio
 //                          Else IF (((rTotRend132 + rTotRend132A) <= ValorIdoso)) THEN
//                           begin
//                                 iPosicao := Linhas.IndexOfLinha(pai.iLinhaAbonoAcima65INSS, 2, sCodigoNatureza[2]);
//                                 If iPosicao > -1 Then
//                                    Begin
//                                       Linhas[iPosicao].AtualizarValores(RoundCM(rTotRend132 + rTotRend132A, 2),
//                                          RoundCM(rTotRend132 + rTotRend132A, 2));
//                                    End
//                                 Else
//                                    Begin
//                                       Linhas.AdicionarValores(pai.iLinhaAbonoAcima65INSS,
//                                          RoundCM(rTotRend132 + rTotRend132A, 2),
//                                          RoundCM(rTotRend132 + rTotRend132A, 2),
//                                          2,
//                                          sCodigoNatureza[2],
//                                          FlgPensaoAlim);
//                                    End;
//
//                           end
                          ELSE
//                           //Marcio Sanches Spinosa SOL 225900 KINTANA 2059548 - Fim
                              Begin

                                 If ((rTotRend132 + rTotRend132A) < 0) Then
                                    Begin
                                       {Lançando linha de rendimento negativa da fonte pagadora INSS 13º}
                                       iPosicao := Linhas.IndexOfLinha(iLinhaRend13INSS, 2, sCodigoNatureza[2]); //Marcio Sanches Spinosa SOL 219023 KINTANA 2054837
                                       If iPosicao > -1 Then
                                          Begin
                                             Linhas[iPosicao].AtualizarValores(RoundCM((rTotRend132 + rTotRend132A), 2),
                                                RoundCM((rTotRend132 + rTotRend132A), 2));
                                          End
                                       Else
                                          Begin
                                             Linhas.AdicionarValores(iLinhaRend13INSS,
                                                RoundCM((rTotRend132 + rTotRend132A), 2),
                                                RoundCM((rTotRend132 + rTotRend132A), 2),
                                                2,
                                                sCodigoNatureza[2],
                                                FlgPensaoAlim);
                                          End;
                                    End

                                 Else
                                    Begin
                                       {Lançando linha de idoso da fonte pagadora INSS 13º}
                                       //iPosicao := Linhas.IndexOfLinha(pai.iLinhaAbonoAcima65INSS, 2, CodigoNatureza);   // Edilaine - SOL 199978 / KTN 1925538 - comentado
                                       iPosicao := Linhas.IndexOfLinha(iLinhaRend13INSS, 2, sCodigoNatureza[2]);               // Edilaine - SOL 199978 / KTN 1925538 ////Marcio Sanches Spinosa SOL 219023 KINTANA 2054837
                                       If iPosicao > -1 Then
                                          Begin
                                             Linhas[iPosicao].AtualizarValores(RoundCM((rTotRend132 + rTotRend132A), 2),
                                                RoundCM((rTotRend132 + rTotRend132A), 2));
                                          End
                                       Else
                                          Begin
                                             Linhas.AdicionarValores(iLinhaRend13INSS,        // Edilaine - SOL 199978 / KTN 1925538
                                                RoundCM((rTotRend132 + rTotRend132A), 2),
                                                RoundCM((rTotRend132 + rTotRend132A), 2),
                                                2,
                                                sCodigoNatureza[2],
                                                FlgPensaoAlim);
                                          End;

                                       // Edilaine - SOL 199978 / KTN 1925538
                                       if ((rTotRend132 + rTotRend132A) > 0) and ((rTotRend132 + rTotRend132A) <= ValorIdoso ) and TemAcaoJudicial then
                                       begin
                                          ValorIdoso := (ValorIdoso - rTotRend132);
                                          rTotRend132A := (ValorIdoso + rTotRend132) ;
                                       end
                                       else if not (VerificaMesesIdade65 = 780) then//Marcio Sanches Spinosa SOL 228926 PPM 358284
                                       begin
                                          ValorIdoso := ValorIdoso //Wylliam Leite da Silva - SOL:246488 PPM:1026389
                                       end
                                       else
                                          ValorIdoso := ValorIdoso - (rTotRend132 + rTotRend132A);
                                         // Edilaine - SOL 199978 / KTN 1925538
                                    End;
                              End;
                        End;
                  End
               Else
                  Begin

                     // Tratar Regra IT - Arnaldo - 19/11/2008

                     {Ação Judicial }
                     If ((rTotRend131 + rTotRend131A) >= ValorIdoso) Then
                        Begin
                           {Lançando linha de idoso da fonte pagadora Fundação 13º}
                           iPosicao := Linhas.IndexOfLinha(pai.iLinhaAbonoAcima65, 1, sCodigoNatureza[1]);//Marcio Sanches Spinosa SOL 219023 KINTANA 2054837
                           If iPosicao > -1 Then
                              Begin
                                 Linhas[iPosicao].AtualizarValores(RoundCM(ValorIdoso, 2),
                                    RoundCM(ValorIdoso, 2));
                              End
                           Else
                              Begin
                                 Linhas.AdicionarValores(pai.iLinhaAbonoAcima65,
                                    RoundCM(ValorIdoso, 2),
                                    RoundCM(ValorIdoso, 2),
                                    1,
                                    sCodigoNatureza[1],
                                    FlgPensaoAlim);
                              End;
                           {Lançando linha de rendimento da fonte pagadora Fundação 13º}
                           iPosicao := Linhas.IndexOfLinha(iLinhaRend13, 1, sCodigoNatureza[1]);//Marcio Sanches Spinosa SOL 219023 KINTANA 2054837
                           If iPosicao > -1 Then
                              Begin
                                 Linhas[iPosicao].AtualizarValores(RoundCM((((rTotRend131 + rTotRend131A) - ValorIdoso) * (100 - PercAcaoJudicial)) / 100, 2),
                                    RoundCM((((rTotRend131 + rTotRend131A) - ValorIdoso) * (100 - PercAcaoJudicial)) / 100, 2));
                              End
                           Else
                              Begin
                                 Linhas.AdicionarValores(iLinhaRend13,
                                    RoundCM((((rTotRend131 + rTotRend131A) - ValorIdoso) * (100 - PercAcaoJudicial)) / 100, 2),
                                    RoundCM((((rTotRend131 + rTotRend131A) - ValorIdoso) * (100 - PercAcaoJudicial)) / 100, 2),
                                    1,
                                    sCodigoNatureza[1],
                                    FlgPensaoAlim);
                              End;

                           {Lançando linha de rendimento da fonte pagadora Fundação 13º para Ação Judicial}
                           iPosicao := Linhas.IndexOfLinha(pai.iLinhaRendAcJud13, 1, sCodigoNatureza[1]);//Marcio Sanches Spinosa SOL 219023 KINTANA 2054837
                           If iPosicao > -1 Then
                              Begin
                                 Linhas[iPosicao].AtualizarValores(RoundCM((((rTotRend131 + rTotRend131A) - ValorIdoso) * PercAcaoJudicial) / 100, 2),
                                    RoundCM((((rTotRend131 + rTotRend131A) - ValorIdoso) * PercAcaoJudicial) / 100, 2));
                              End
                           Else
                              Begin
                                 Linhas.AdicionarValores(pai.iLinhaRendAcJud13,
                                    RoundCM((((rTotRend131 + rTotRend131A) - ValorIdoso) * PercAcaoJudicial) / 100, 2),
                                    RoundCM((((rTotRend131 + rTotRend131A) - ValorIdoso) * PercAcaoJudicial) / 100, 2),
                                    1,
                                    sCodigoNatureza[1],
                                    FlgPensaoAlim);
                              End;
//                           ValorIdoso := 0;  //Marcio Sanches Spinosa SOL 229216 KINTANA 2063107
                        End
                     Else
                        Begin

                           If ((rTotRend131 + rTotRend131A) < 0) Then
                              Begin
                                 // Edilaine - SOL 199086 / KTN 1915798
                                 iPosicao := Linhas.IndexOfLinha(iLinhaRend13, 1, sCodigoNatureza[1]);//Marcio Sanches Spinosa SOL 219023 KINTANA 2054837
                                 If iPosicao > -1 Then
                                    Begin
                                       Linhas[iPosicao].AtualizarValores(RoundCM((rTotRend131 + rTotRend131A), 2),
                                          RoundCM((rTotRend131 + rTotRend131A), 2));
                                    End
                                 Else
                                    Begin
                                       Linhas.AdicionarValores(iLinhaRend13,
                                          RoundCM((rTotRend131 + rTotRend131A), 2),
                                          RoundCM((rTotRend131 + rTotRend131A), 2),
                                          1,
                                          sCodigoNatureza[1],
                                          FlgPensaoAlim);
                                    End;

                              End
                           Else
                              Begin
                                 {Lançando linha de idoso da fonte pagadora INSS 13º}
                                 iPosicao := Linhas.IndexOfLinha(pai.iLinhaAbonoAcima65, 1, sCodigoNatureza[1]); //Marcio Sanches Spinosa SOL 219023 KINTANA 2054837
                                 If iPosicao > -1 Then
                                    Begin
                                       Linhas[iPosicao].AtualizarValores(RoundCM((rTotRend131 + rTotRend131A), 2),
                                          RoundCM((rTotRend131 + rTotRend131A), 2));
                                    End
                                 Else
                                    Begin
                                       Linhas.AdicionarValores(pai.iLinhaAbonoAcima65,
                                          RoundCM((rTotRend131 + rTotRend131A), 2),
                                          RoundCM((rTotRend131 + rTotRend131A), 2),
                                          1,
                                          sCodigoNatureza[1],
                                          FlgPensaoAlim);
                                    End;
                                 ValorIdoso := ValorIdoso - (rTotRend131 + rTotRend131A);

//                                 pVerificaLancD := true; //Marcio Sanches Spinosa SOL 229216 KINTANA 2063107
                              End;

                        End;

                     If ((rTotRend132 + rTotRend132A) >= ValorIdoso) and not pVerificaLancD
                     and (pai.versao > -1) Then//Marcio Sanches Spinosa SOL 229216 KINTANA 2063107
                        Begin
                           {Lançando linha de idoso da fonte pagadora INSS 13º}
                           iPosicao := Linhas.IndexOfLinha(pai.iLinhaAbonoAcima65INSS, 2, sCodigoNatureza[2]); //Marcio Sanches Spinosa SOL 219023 KINTANA 2054837
                           If iPosicao > -1 Then
                              Begin
                                 Linhas[iPosicao].AtualizarValores(RoundCM(ValorIdoso, 2),
                                    RoundCM(ValorIdoso, 2));
                              End
                           Else
                              Begin
                                 Linhas.AdicionarValores(pai.iLinhaAbonoAcima65INSS,
                                    RoundCM(ValorIdoso, 2),
                                    RoundCM(ValorIdoso, 2),
                                    2,
                                    sCodigoNatureza[2],
                                    FlgPensaoAlim);
                              End;

                           {Lançando linha de Rendimento da fonte pagadora INSS 13º}
                           iPosicao := Linhas.IndexOfLinha(iLinhaRend13INSS, 2, sCodigoNatureza[2]); //Marcio Sanches Spinosa SOL 219023 KINTANA 2054837
                           If iPosicao > -1 Then
                              Begin
                                 Linhas[iPosicao].AtualizarValores(RoundCM((rTotRend132 + rTotRend132A) - ValorIdoso, 2),
                                    RoundCM((rTotRend132 + rTotRend132A) - ValorIdoso, 2));
                              End
                           Else
                              Begin
                                 Linhas.AdicionarValores(iLinhaRend13INSS,
                                    RoundCM((rTotRend132 + rTotRend132A) - ValorIdoso, 2),
                                    RoundCM((rTotRend132 + rTotRend132A) - ValorIdoso, 2),
                                    2,
                                    sCodigoNatureza[2],
                                    FlgPensaoAlim);
                              End;
                              //Marcio Sanches Spinosa SOL 229216 KINTANA 2063107 - Inicio

                            {  if ValorIdoso > 0 then
                                pVerificaLancD := True;   }
//                              /Marcio Sanches Spinosa SOL 229216 KINTANA 2063107 - Fim
//                           ValorIdoso := 0;
                        End
                     Else
                        Begin
                           If ((rTotRend132 + rTotRend132A) < 0) Then
                              Begin
                                 {Lançando linha de rendimento negativa da fonte pagadora INSS 13º}
                                 iPosicao := Linhas.IndexOfLinha(iLinhaRend13INSS, 2, sCodigoNatureza[2]); //Marcio Sanches Spinosa SOL 219023 KINTANA 2054837
                                 If iPosicao > -1 Then
                                    Begin
                                       Linhas[iPosicao].AtualizarValores(RoundCM((rTotRend132 + rTotRend132A), 2),
                                          RoundCM((rTotRend132 + rTotRend132A), 2));
                                    End
                                 Else
                                    Begin
                                       Linhas.AdicionarValores(iLinhaRend13INSS,
                                          RoundCM((rTotRend132 + rTotRend132A), 2),
                                          RoundCM((rTotRend132 + rTotRend132A), 2),
                                          2,
                                          sCodigoNatureza[2],
                                          FlgPensaoAlim);
                                    End;
                              End
                           Else if ((rTotRend132 + rTotRend132A) > 0) Then    // Edilaine - SOL 199086 / KTN 1915798
                              Begin
                                 {Lançando linha de idoso da fonte pagadora INSS 13º}
                                 iPosicao := Linhas.IndexOfLinha(iLinhaRend13INSS, 2, sCodigoNatureza[2]);  // Edilaine - SOL 199978 / KTN 1925538 //Marcio Sanches Spinosa SOL 219023 KINTANA 2054837
                                 If iPosicao > -1 Then
                                    Begin
                                       Linhas[iPosicao].AtualizarValores(RoundCM((rTotRend132 + rTotRend132A), 2),
                                          RoundCM((rTotRend132 + rTotRend132A), 2));
                                    End
                                 Else
                                    Begin
                                       Linhas.AdicionarValores(iLinhaRend13INSS,                       // Edilaine - SOL 199978 / KTN 1925538
                                          RoundCM((rTotRend132 + rTotRend132A), 2),
                                          RoundCM((rTotRend132 + rTotRend132A), 2),
                                          2,
                                          sCodigoNatureza[2],
                                          FlgPensaoAlim);
                                    End;

                                 // Edilaine - SOL 199978 / KTN 1925538
                                 if (rTotRend132 + rTotRend132A) <= ValorIdoso then
                                    ValorIdoso := (rTotRend132 + rTotRend132A)
                                 else if not (pVerificaLancD) and (Pai.Versao > -1) then
                                    ValorIdoso := ValorIdoso - (rTotRend132 + rTotRend132A);


                                 // Edilaine - SOL 199978 / KTN 1925538 - fim
                              End;
                        End;
                  End;
            End;
      End;
   TratamentoIdosoAbono:= False; //Wylliam Leite da Silva - SOL:246488 PPM:1026389
End;

Procedure tProcessaDirfIndividual.TrataIdosoMensal(Const bPodeCalcular: Boolean);
Var rTotalRend: Double;
   iPosicao: Integer;
   // Thiago Melo SOL 219219 Kintana 2051170
   //sCodigoNatureza: array[1..2] of String;
   sCodigoNatureza: array[1..3] of String;
   // Thiago Melo SOL 219219 Kintana 2051170

Begin

   // Alterado Por Arnaldo V. Scarin, em 06/09/2010
   // SOL 133232 - Essa variavel (bPodeCalcular) indica se pode ser feito o cálculo
   // quando está sendo feita a busca de uma pessoa normal, que não tenha ação judicial
   // em sua matrícula, e que tenha 2 ou mais idpessoas para o mesmo cpf, ou no caso
   // da existência de ação judicial para um beneficiário que tenha 2 idpessoas (matriculas)
   // sendo que, nesse ultimo caso, a variável será verdadeira, caso o idpessoa que esteja
   // sendo validado é o mesmo idpessoa da ação judicial, ou falso se for o outro idpessoa.
   If bPodeCalcular Then
      Begin
         {Começa o tratamento dos idosos conforme a fontepagadora dos rendimentos de Janeiro a Dezembro}
         // total dos rendimentos é a soma dos redimentos da funcef (rTotRend1) e os rendimentos do INSS (rTotRend2)
         // Thiago Melo SOL 219219 Kintana 2051170
         sCodigoNatureza[1] := CodigoNaturezas.LocalizaNatureza(rTotRend1, 0, 0);
         sCodigoNatureza[2] := CodigoNaturezas.LocalizaNatureza(0, rTotRend2, 0);
         sCodigoNatureza[3] := CodigoNaturezas.LocalizaNatureza(0, 0, rTotRend3);
//         rTotalRend := rTotRend1 + rTotRend2;
         rTotalRend := rTotRend1 + rTotRend2 + rTotRend3;

         //Wylliam Silva SOL 247702 PPM 732173 - Inicio
         if (rTotalRend = 0) then
           if (rTotRend1 * -1) = rTotRend2 then
            rtotalrend := 0.01;
		 //Wylliam Silva SOL 247702 PPM 732173 - Fim	
         // Thiago Melo SOL 219219 Kintana 2051170

//         rTotalRend := rTotRend1 + rTotRend2;
         //Marcio Sanches Spinosa SOL 236012 - Inicio
         if (sCodigoNatureza[3] = EmptyStr) and (rTotRend3 > 0) then
             sCodigoNatureza[3] := '1889';
          //Marcio Sanches Spinosa SOL 236012 - Fim
         // validar aqui a situação do idoso que tem ação judicial e
         // que deve gravar a base de 65 anos somente no registro de pensão alimenticia

         If rValorIdosoAcum > 0 Then
            Begin
               If rValorIdosoAcum >= ValorIdosoFixo Then
                  Begin
                     ValorIdosoFixo := 0;
                     ValorIdoso := 0;
                  End
               Else
                  Begin
                     ValorIdosoFixo := ValorIdosoFixo - rValorIdosoAcum;
                     ValorIdoso := ValorIdoso - rValorIdosoAcum;
                  End;
            End;

         // total de Rendimentos não está zerado
         If rTotalRend <> 0 Then
            Begin
               // Total de Rendimentos é menor que zero.
               If rTotalRend < 0 Then
                  Begin
                     // Rendimentos da Funcef e do Inss são menores ou igual a zero.
                     If (rTotRend1 <= 0) And
                        (rTotRend2 <= 0) Then
                        Begin
                           iPosicao := Linhas.IndexOfLinha(iLinhaRend, 1, sCodigoNatureza[1]);
                           If iPosicao > -1 Then
                              Begin
                                 Linhas[iPosicao].AtualizarValores(RoundCM(rTotRend1, 2),
                                    RoundCM(rTotRend1, 2));
                              End
                           Else
                              Begin
                                 Linhas.AdicionarValores(iLinhaRend,
                                    RoundCM(rTotRend1, 2),
                                    RoundCM(rTotRend1, 2),
                                    1,
                                    sCodigoNatureza[1],
                                    FlgPensaoAlim);
                              End;

                           iPosicao := Linhas.IndexOfLinha(iLinhaRendINSS, 2, sCodigoNatureza[2]);
                           If iPosicao > -1 Then
                              Begin
                                 Linhas[iPosicao].AtualizarValores(RoundCM(rTotRend2, 2),
                                    RoundCM(rTotRend2, 2));
                              End
                           Else
                              Begin
                                 Linhas.AdicionarValores(iLinhaRendINSS,
                                    RoundCM(rTotRend2, 2),
                                    RoundCM(rTotRend2, 2),
                                    2,
                                    sCodigoNatureza[2],
                                    FlgPensaoAlim);
                              End;
                        End
                           // Redimentos da Funcef e INSS são maiores que zero
                     Else
                        Begin
                           If (Abs(rTotRend1) > Abs(rTotRend2)) Then
                              Begin
                                 { Se valor absoluto do rendimento da fundação for maior que do INSS a linha de informe }
                                 { da fundação recebe a diferença dos duas fontes pagadoras ...                         }
                                 iPosicao := Linhas.IndexOfLinha(iLinhaRend, 1, sCodigoNatureza[1]);
                                 If iPosicao > -1 Then
                                    Begin
                                      // Edilaine - SOL 199086 / KTN 1915798 - comentado
                                      //Linhas[iPosicao].AtualizarValores(RoundCM(((Abs(rTotRend1) - Abs(rTotRend2)) * -1), 2),
                                      //    RoundCM(((Abs(rTotRend1) - Abs(rTotRend2)) * -1), 2));

                                      Linhas[iPosicao].AtualizarValores(RoundCM(rTotRend1, 2), RoundCM(rTotRend1, 2));   // Edilaine - SOL 199086 / KTN 1915798
                                    End
                                 Else
                                    Begin
                                    //William Moreira da Silva - SOL 198423 Kintana 1908786
                                       {Linhas.AdicionarValores(iLinhaRend,
                                          RoundCM(((Abs(rTotRend1) - Abs(rTotRend2)) * -1), 2),
                                          RoundCM(((Abs(rTotRend1) - Abs(rTotRend2)) * -1), 2),
                                          1,
                                          sCodigoNatureza,
                                          FlgPensaoAlim);}
                                          Linhas.AdicionarValores( iLinhaRend,
                                                                   RoundCM(rTotRend1, 2),
                                                                   RoundCM(rTotRend1, 2),
                                                                   1,
                                                                   sCodigoNatureza[1],
                                                                   FlgPensaoAlim);
                                    //William Moreira da Silva - SOL 198423 Kintana 1908786
                                    End;
                                 //Wylliam Leite da Silva - SOL: 247702 PPM: 732173 - Inicio
                                 if (rTotRend2 > ValorIdosoFixo) then
                                 begin

                                   iPosicao := Linhas.IndexOfLinha(pai.iLinhaAcima65INSS, 2, sCodigoNatureza[2]);
                                   If iPosicao > -1 Then
                                      Begin
                                        Linhas[iPosicao].AtualizarValores(RoundCM(ValorIdosoFixo, 2), RoundCM(ValorIdosoFixo, 2));   // Edilaine - SOL 199086 / KTN 1915798
                                      End
                                   Else
                                      Begin
                                            Linhas.AdicionarValores( pai.iLinhaAcima65INSS,
                                                                     RoundCM(ValorIdosoFixo, 2),
                                                                     RoundCM(ValorIdosoFixo, 2),
                                                                     2,
                                                                     sCodigoNatureza[2],
                                                                     FlgPensaoAlim);
                                      End;

                                   iPosicao := Linhas.IndexOfLinha(iLinhaRendINSS, 2, sCodigoNatureza[2]);
                                   If iPosicao > -1 Then
                                      Begin
                                        Linhas[iPosicao].AtualizarValores(RoundCM(ValorIdosoFixo, 2), RoundCM(ValorIdosoFixo, 2));   // Edilaine - SOL 199086 / KTN 1915798
                                      End
                                   Else
                                      Begin
                                            Linhas.AdicionarValores( iLinhaRendINSS,
                                                                     RoundCM(rTotRend2 - ValorIdosoFixo, 2),
                                                                     RoundCM(rTotRend2 - ValorIdosoFixo, 2),
                                                                     2,
                                                                     sCodigoNatureza[2],
                                                                     FlgPensaoAlim);
                                      End;


                                 end
                                 else
                                 begin
                                 iPosicao := Linhas.IndexOfLinha(pai.iLinhaAcima65INSS, 2, sCodigoNatureza[2]);
                                 If iPosicao > -1 Then
                                    Begin
                                      Linhas[iPosicao].AtualizarValores(RoundCM(rTotRend2, 2), RoundCM(rTotRend2, 2));   // Edilaine - SOL 199086 / KTN 1915798
                                    End
                                 Else
                                    Begin
                                          Linhas.AdicionarValores( pai.iLinhaAcima65INSS,
                                                                   RoundCM(rTotRend2, 2),
                                                                   RoundCM(rTotRend2, 2),
                                                                   2,
                                                                   sCodigoNatureza[2],
                                                                   FlgPensaoAlim);
                                    End;
                                 end;
                              End
                              //Wylliam Leite da Silva - SOL: 247702 PPM: 732173 - Fim
                                 // rendimento funcef é menor ou igual ao rendimento do inss
                           Else if (rTotRend1 > 0) and (rTotRend2 < 0) then
                           begin
                                      Linhas.AdicionarValores( iLinhaRend,
                                 RoundCM(rTotRend1, 2),
                                 RoundCM(rTotRend1, 2),
                                 1,
                                 sCodigoNatureza[1],
                                 FlgPensaoAlim);

                            Linhas.AdicionarValores( iLinhaRendINSS,
                                                     RoundCM(rTotRend2, 2),
                                                     RoundCM(rTotRend2, 2),
                                                     2,  //Wylliam Silva SOL 247702 PPM 732173
                                                     sCodigoNatureza[2],
                                                     FlgPensaoAlim);

                           end
                           else
                              Begin
                                if rTotRend1 > ValorIdosoFixo  then
                                begin
                                   iPosicao := Linhas.IndexOfLinha(iLinhaRendINSS, 1, sCodigoNatureza[1]);
                                   If iPosicao > -1 Then
                                      Begin
                                        // Edilaine - SOL 199086 / KTN 1915798 - comentado
                                        //Linhas[iPosicao].AtualizarValores(RoundCM(((Abs(rTotRend2) - Abs(rTotRend1)) * -1), 2),
                                        //   RoundCM(((Abs(rTotRend2) - Abs(rTotRend1)) * -1), 2));

                                        Linhas[iPosicao].AtualizarValores(RoundCM(rTotRend1, 2), RoundCM(rTotRend1, 2));  // Edilaine - SOL 199086 / KTN 1915798
                                      End
                                   Else
                                      Begin
                                         //William Moreira da Silva - SOL 198423 Kintana 1908786
                                         {Linhas.AdicionarValores(iLinhaRendINSS,
                                            RoundCM(((Abs(rTotRend2) - Abs(rTotRend1)) * -1), 2),
                                            RoundCM(((Abs(rTotRend2) - Abs(rTotRend1)) * -1), 2),
                                            2,
                                            sCodigoNatureza,
                                            FlgPensaoAlim);}
                                            Linhas.AdicionarValores( iLinhaRendINSS,
                                                                     RoundCM(rTotRend1, 2),
                                                                     RoundCM(rTotRend1, 2),
                                                                     1,
                                                                     sCodigoNatureza[1],
                                                                     FlgPensaoAlim);
                                          //William Moreira da Silva - SOL 198423 Kintana 1908786
                                      End;
                                End
                                Else
                                Begin
                                  //Marcio Sanches Spinosa SOL 218825 KINTANA 2050633 - inicio
                                  if rTotRend2 > ValorIdosoFixo  then
                                     begin
                                       iPosicao := Linhas.IndexOfLinha(iLinhaRendINSS, 2, sCodigoNatureza[2]);
                                       If iPosicao > -1 Then
                                          Begin
                                            Linhas[iPosicao].AtualizarValores(RoundCM(rTotRend2-ValorIdosoFixo, 2), RoundCM(rTotRend2-ValorIdosoFixo, 2));
                                          end
                                       else
                                          begin
                                            Linhas.AdicionarValores( iLinhaRendINSS,
                                                                     RoundCM(rTotRend2-ValorIdosoFixo, 2),
                                                                     RoundCM(rTotRend2-ValorIdosoFixo, 2),
                                                                     2,
                                                                     sCodigoNatureza[2],
                                                                     FlgPensaoAlim);
                                          end;

                                       iPosicao := Linhas.IndexOfLinha(pai.iLinhaAcima65INSS, 2, sCodigoNatureza[2]);
                                       If iPosicao > -1 Then
                                          Begin
                                            Linhas[iPosicao].AtualizarValores(RoundCM(ValorIdosoFixo, 2), RoundCM(ValorIdosoFixo, 2));
                                          End
                                       Else
                                          Begin
                                            Linhas.AdicionarValores( pai.iLinhaAcima65INSS,
                                                                     RoundCM(ValorIdosoFixo, 2),
                                                                     RoundCM(ValorIdosoFixo, 2),
                                                                     2,
                                                                     sCodigoNatureza[2],
                                                                     FlgPensaoAlim);
                                          End;

                                     end
                                  else          //Marcio Sanches Spinosa SOL 218825 KINTANA 2050633 - fim
                                     begin

                                       iPosicao := Linhas.IndexOfLinha(pai.iLinhaAcima65INSS, 2, sCodigoNatureza[2]); // Edilaine - SOL 199086 / KTN 1915798
                                       If iPosicao > -1 Then
                                          Begin
                                             // Edilaine - SOL 199086 / KTN 1915798 - comentado
                                             //Linhas[iPosicao].AtualizarValores(RoundCM(((Abs(rTotRend2) - Abs(rTotRend1)) * -1), 2),
                                             //   RoundCM(((Abs(rTotRend2) - Abs(rTotRend1)) * -1), 2));

                                             Linhas[iPosicao].AtualizarValores(RoundCM(rTotRend2, 2), RoundCM(rTotRend2, 2));  // Edilaine - SOL 199086 / KTN 1915798
                                          End
                                       Else
                                          Begin
                                            //William Moreira da Silva - SOL 198423 Kintana 1908786
                                            {Linhas.AdicionarValores(iLinhaRendINSS,
                                               RoundCM(((Abs(rTotRend2) - Abs(rTotRend1)) * -1), 2),
                                               RoundCM(((Abs(rTotRend2) - Abs(rTotRend1)) * -1), 2),
                                               2,
                                               sCodigoNatureza,
                                               FlgPensaoAlim);}
                                                 Linhas.AdicionarValores( pai.iLinhaAcima65INSS, // Edilaine - SOL 199086 / KTN 1915798
                                                                        RoundCM(rTotRend2, 2),
                                                                        RoundCM(rTotRend2, 2),
                                                                        2,
                                                                        sCodigoNatureza[2],
                                                                        FlgPensaoAlim);
                                             //William Moreira da Silva - SOL 198423 Kintana 1908786
                                          End;
                                     End;
                                  end;
                              End;
                        End;
                  End

                     // Total de Rendimentos é maior que zero (não é possivel ser zero, por que a primeira condição satisfeita
                     // é que o Total de Rendimentos tem de ser diferente de zero para chegar nesse ponto.
               Else
                  Begin

                     {1º Caso -  Somatorio das duas fontes nao ultrapassem o valor do idoso}
                     If rTotalRend < ValorIdosoFixo Then
                        Begin
                           // Rendimento da Funcef maior que zero
                           If rTotRend1 > 0 Then
                              Begin
                                 If rTotRend2 >= 0 Then
                                    Begin
                                       If Trim(pai.CodigoRubricas) = '' Then
                                          Begin
                                             iPosicao := Linhas.IndexOfLinha(pai.iLinhaAcima65, 1, sCodigoNatureza[1]);
                                             If iPosicao > -1 Then
                                                Begin
                                                   Linhas[iPosicao].AtualizarValores(rTotRend1,
                                                      rTotRend1);
                                                End
                                             Else
                                                Begin
                                                   Linhas.AdicionarValores(pai.iLinhaAcima65,
                                                      rTotRend1,
                                                      rTotRend1,
                                                      1,
                                                      sCodigoNatureza[1],
                                                      FlgPensaoAlim);
                                                End;
                                          End;
                                    End
                                 Else
                                    Begin
                                       If Trim(pai.CodigoRubricas) = '' Then
                                          Begin
                                             iPosicao := Linhas.IndexOfLinha(pai.iLinhaAcima65, 1, sCodigoNatureza[1]);
                                             If iPosicao > -1 Then
                                                Begin
                                                   Linhas[iPosicao].AtualizarValores(rTotalRend,
                                                      rTotalRend);
                                                End
                                             Else
                                                Begin
                                                   Linhas.AdicionarValores(pai.iLinhaAcima65,
                                                      rTotalRend,
                                                      rTotalRend,
                                                      1,
                                                      sCodigoNatureza[1],
                                                      FlgPensaoAlim);
                                                End;
                                          End;
                                    End;
                              End;
                           // Rendimento do Inss maior que zero
                           If rTotRend2 > 0 Then
                              Begin
                                 // Rendimento da Funcef menor que zero
                                 If rTotRend1 < 0 Then
                                    Begin
                                       If Trim(pai.CodigoRubricas) = '' Then
                                          Begin
                                             //Wylliam Silva SOL 247702 PPM 732173 - Inicio
                                             if (valoridosofixo > rTotRend2) then
                                                ValorIdosoFixo := rTotRend2;
											 //Wylliam Silva SOL 247702 PPM 732173 - Fim	
                                             iPosicao := Linhas.IndexOfLinha(pai.iLinhaAcima65INSS, 2, sCodigoNatureza[2]);
                                             If iPosicao > -1 Then
                                                Begin
                                                   // Thiago Melo SOL 222748 Kintana 2056742
                                                   Linhas[iPosicao].AtualizarValores(RoundCM(ValorIdosoFixo, 2),
                                                      RoundCM(ValorIdosoFixo, 2));
                                                   (*Linhas[iPosicao].AtualizarValores((rTotRend2 {+ rTotRend1}), // Edilaine - SOL 199086 / KTN 1915798
                                                      (rTotRend2 {+ rTotRend1}));        *)
                                                   // Thiago Melo SOL 222748 Kintana 2056742
                                                End
                                             Else
                                                Begin
                                                   Linhas.AdicionarValores(pai.iLinhaAcima65INSS,
                                                      //rTotRend2 {+ rTotRend1},              // Edilaine - SOL 199086 / KTN 1915798
                                                      //rTotRend2 {+ rTotRend1},              // Edilaine - SOL 199086 / KTN 1915798
                                                      RoundCM(ValorIdosoFixo, 2), // Thiago Melo SOL 222748 Kintana 2056742
                                                      RoundCM(ValorIdosoFixo, 2), // Thiago Melo SOL 222748 Kintana 2056742
                                                      2,
                                                      sCodigoNatureza[2],
                                                      FlgPensaoAlim);
                                                End;
                                          End;

                                         // Thiago Melo SOL 222748 Kintana 2056742
                                         iPosicao := Linhas.IndexOfLinha(iLinhaRendINSS, 2, sCodigoNatureza[2]);
                                         If iPosicao > -1 Then
                                         Begin
                                           Linhas[iPosicao].AtualizarValores(RoundCM(rTotRend2 - ValorIdosoFixo, 2),
                                             RoundCM(rTotRend2 - ValorIdosoFixo, 2));
                                         End
                                         Else
                                         Begin
                                            Linhas.AdicionarValores(iLinhaRendINSS,
                                               RoundCM(rTotRend2 - ValorIdosoFixo, 2),
                                               RoundCM(rTotRend2 - ValorIdosoFixo, 2),
                                               2,
                                               sCodigoNatureza[2],
                                               FlgPensaoAlim);
                                         End;

                                         iPosicao := Linhas.IndexOfLinha(iLinhaRend, 1, sCodigoNatureza[1]);
                                         if iPosicao > -1 then begin
                                           Linhas[iPosicao].AtualizarValores(RoundCM(rTotRend1, 2), RoundCM(rTotRend1, 2));
                                         end else begin
                                           Linhas.AdicionarValores(iLinhaRend,
                                              RoundCM(rTotRend1, 2),
                                              RoundCM(rTotRend1, 2),
                                              1,
                                              sCodigoNatureza[1],
                                              FlgPensaoAlim);
                                         end; 
                                         // Thiago Melo SOL 222748 Kintana 2056742
                                    End
                                    // Rendimento Funcef maior ou igual a Zero
                                 Else
                                    Begin
                                       If Trim(pai.CodigoRubricas) = '' Then
                                          Begin
                                             iPosicao := Linhas.IndexOfLinha(pai.iLinhaAcima65INSS, 2, sCodigoNatureza[2]);
                                             If iPosicao > -1 Then
                                                Begin
                                                   Linhas[iPosicao].AtualizarValores(rTotRend2,
                                                      rTotRend2);
                                                End
                                             Else
                                                Begin
                                                   Linhas.AdicionarValores(pai.iLinhaAcima65INSS,
                                                      rTotRend2,
                                                      rTotRend2,
                                                      2,
                                                      sCodigoNatureza[2],
                                                      FlgPensaoAlim);
                                                End;
                                          End;
                                    End;
                              End;
                        End
                           {Fim 1º Caso -  Somatorio das duas fontes nao ultrapassem o valor do idoso}

                     Else
                        Begin

                           // Tratar Regra IT - Arnaldo - 19/11/2008

                           {2º Caso - A fonte pagadora 1 (funcef) é maior ou igual ao o valor do idoso}
                           If rTotRend1 >= ValorIdosoFixo Then
                              Begin
                                 // Se tem Acão Judicial
                                 If TemAcaoJudicial
                                 and (pDataFimProcJud = 0) Then
                                    Begin
                                       iPosicao := Linhas.IndexOfLinha(iLinhaRend, 1, sCodigoNatureza[1]);
                                       If iPosicao > -1 Then
                                          Begin
                                             Linhas[iPosicao].AtualizarValores(RoundCM(((rTotRend1 - ValorIdosoFixo) * (100 - PercAcaoJudicial)) / 100, 2),
                                                RoundCM(((rTotRend1 - ValorIdosoFixo) * (100 - PercAcaoJudicial)) / 100, 2));
                                          End
                                       Else
                                          Begin
                                             Linhas.AdicionarValores(iLinhaRend,
                                                RoundCM(((rTotRend1 - ValorIdosoFixo) * (100 - PercAcaoJudicial)) / 100, 2),
                                                RoundCM(((rTotRend1 - ValorIdosoFixo) * (100 - PercAcaoJudicial)) / 100, 2),
                                                1,
                                                sCodigoNatureza[1],
                                                FlgPensaoAlim);
                                          End;

                                       iPosicao := Linhas.IndexOfLinha(pai.iLinhaRendAcJud, 1, sCodigoNatureza[1]);
                                       If iPosicao > -1 Then
                                          Begin
                                             Linhas[iPosicao].AtualizarValores(RoundCM(((rTotRend1 - ValorIdosoFixo) * PercAcaoJudicial) / 100, 2),
                                                RoundCM(((rTotRend1 - ValorIdosoFixo) * PercAcaoJudicial) / 100, 2));
                                          End
                                       Else
                                          Begin
                                             Linhas.AdicionarValores(pai.iLinhaRendAcJud,
                                                RoundCM(((rTotRend1 - ValorIdosoFixo) * PercAcaoJudicial) / 100, 2),
                                                RoundCM(((rTotRend1 - ValorIdosoFixo) * PercAcaoJudicial) / 100, 2),
                                                1,
                                                sCodigoNatureza[1],
                                                FlgPensaoAlim);
                                          End;
                                    End
                                       // Não possue Ação Judicial
                                 Else
                                    Begin
                                       iPosicao := Linhas.IndexOfLinha(iLinhaRend, 1, sCodigoNatureza[1]);
                                       If iPosicao > -1 Then
                                          Begin
                                             Linhas[iPosicao].AtualizarValores((rTotRend1 - ValorIdosoFixo),
                                                (rTotRend1 - ValorIdosoFixo));
                                          End
                                       Else
                                          Begin
                                             Linhas.AdicionarValores(iLinhaRend,
                                                (rTotRend1 - ValorIdosoFixo),
                                                (rTotRend1 - ValorIdosoFixo),
                                                1,
                                                sCodigoNatureza[1],
                                                FlgPensaoAlim);
                                          End;
                                    End;

                                 If Trim(pai.CodigoRubricas) = '' Then
                                    Begin
                                       iPosicao := Linhas.IndexOfLinha(pai.iLinhaAcima65, 1, sCodigoNatureza[1]);
                                       If iPosicao = -1 Then
                                          Begin
                                             Linhas.AdicionarValores(pai.iLinhaAcima65,
                                                ValorIdosoFixo,
                                                ValorIdosoFixo,
                                                1,
                                                sCodigoNatureza[1],
                                                FlgPensaoAlim);
                                          End;
                                    End;

                                 // Se Rendimento do INSS é maior que zero

                                 //if rTotRend2 > 0 then // SOL: 179500: Comentado a pedido de Tiago Baia e Paulo Nobre para teste // Vinicius Ferreira em 10/05/2012
                                 If rTotRend2 <> 0 Then // SOL: 179500: Incluido a pedido de Tiago Baia e Paulo Nobre para teste // Vinicius Ferreira em 10/05/2012
                                    Begin
                                       iPosicao := Linhas.IndexOfLinha(iLinhaRendINSS, 2, sCodigoNatureza[2]);
                                       If iPosicao > -1 Then
                                          Linhas[iPosicao].AtualizarValores(rTotRend2, rTotRend2)
                                       Else
                                          Begin
                                             Linhas.AdicionarValores(iLinhaRendINSS,
                                                rTotRend2,
                                                rTotRend2,
                                                2,
                                                sCodigoNatureza[2],
                                                FlgPensaoAlim);
                                          End;
                                    End;
                              End
                                 {Fim 2º Caso - A fonte pagadora 1 é maior ou igual ao o valor do idoso}
                           Else
                              Begin

                                 {3º Caso - A fonte pagadora 1 é menor que valor do idoso e a fonte pagadora 2 é maior que valor do idoso}
                                 If (rTotRend1 < ValorIdosoFixo) And (rTotRend2 >= ValorIdosoFixo) Then
                                    Begin
                                       // Se rendimento Funcef maior que zero
                                       If rTotRend1 > 0 Then
                                          Begin
                                             If Trim(pai.CodigoRubricas) = '' Then
                                                Begin
                                                   iPosicao := Linhas.IndexOfLinha(pai.iLinhaAcima65, 1, sCodigoNatureza[1]);
                                                   If iPosicao > -1 Then
                                                      Begin
                                                         Linhas[iPosicao].AtualizarValores(rTotRend1,
                                                            rTotRend1);
                                                      End
                                                   Else
                                                      Begin
                                                         Linhas.AdicionarValores(pai.iLinhaAcima65,
                                                            rTotRend1,
                                                            rTotRend1,
                                                            1,
                                                            sCodigoNatureza[1],
                                                            FlgPensaoAlim);
                                                      End;
                                                End;
                                          End
                                          else
                                          begin
                                               iPosicao := Linhas.IndexOfLinha(iLinhaRend, 1, sCodigoNatureza[1]);
                                                 If iPosicao > -1 Then
                                                    Begin
                                                       Linhas[iPosicao].AtualizarValores(rTotRend1,
                                                          rTotRend1);
                                                    End
                                                 Else
                                                    Begin
                                                       Linhas.AdicionarValores(iLinhaRend,
                                                          rTotRend1,
                                                          rTotRend1,
                                                          1,
                                                          sCodigoNatureza[1],
                                                          FlgPensaoAlim);
                                                    End;
                                          end;

                                       // Se redimento funcef maior que zero
                                       If rTotRend1 > 0 Then
                                          // Valor do Idoso passa a ser o Valor de Desconto Idoso (fixo) o valor do rendimento da funcef
                                          ValorIdoso := ValorIdosoFixo - rTotRend1
                                       Else
                                          ValorIdoso := ValorIdosoFixo;

                                       // Se rendimento Funcef for maior ou igual a zero
                                       If rTotRend1 >= 0 Then
                                          Begin
                                             iPosicao := Linhas.IndexOfLinha(iLinhaRendINSS, 2, sCodigoNatureza[2]);
                                             If iPosicao > -1 Then
                                                Begin
                                                   Linhas[iPosicao].AtualizarValores((rTotRend2 - ValorIdoso),
                                                      (rTotRend2 - ValorIdoso));
                                                End
                                             Else
                                                Begin
                                                   Linhas.AdicionarValores(iLinhaRendINSS,
                                                      (rTotRend2 - ValorIdoso),
                                                      (rTotRend2 - ValorIdoso),
                                                      2,
                                                      sCodigoNatureza[2],
                                                      FlgPensaoAlim);
                                                End;
                                          End
                                             // Se rendimento da Funcef for menor que zero
                                       Else
                                          Begin
                                             iPosicao := Linhas.IndexOfLinha(iLinhaRendINSS, 2, sCodigoNatureza[2]);
                                             If iPosicao > -1 Then
                                                Begin
                                                   Linhas[iPosicao].AtualizarValores((rTotRend2 - ValorIdoso + rTotRend1),
                                                      (rTotRend2 - ValorIdoso + rTotRend1));
                                                End
                                             Else
                                                Begin
                                                   Linhas.AdicionarValores(iLinhaRendINSS,
                                                      (rTotRend2 - ValorIdoso + rTotRend1),
                                                      (rTotRend2 - ValorIdoso + rTotRend1),
                                                      2,
                                                      sCodigoNatureza[2],
                                                      FlgPensaoAlim);
                                                End;
                                          End;
                                       If Trim(pai.CodigoRubricas) = '' Then
                                          Begin
                                             iPosicao := Linhas.IndexOfLinha(pai.iLinhaAcima65INSS, 2, sCodigoNatureza[2]);
                                             If iPosicao > -1 Then
                                                Begin
                                                   Linhas[iPosicao].AtualizarValores(ValorIdoso,
                                                      ValorIdoso);
                                                End
                                             Else
                                                Begin
                                                   Linhas.AdicionarValores(pai.iLinhaAcima65INSS,
                                                      ValorIdoso,
                                                      ValorIdoso,
                                                      2,
                                                      sCodigoNatureza[2],
                                                      FlgPensaoAlim);
                                                End;
                                          End;
                                    End
                                       {Fim 3º Caso - A fonte pagadora 1 é menor que valor do idoso e a fonte pagadora 2 é maior que valor do idoso}
                                 Else
                                    Begin

                                       {4º Caso - A fonte pagadora 1 é menor que valor do idoso e a fonte pagadora 2 é menor que valor do idoso}
                                       If (rTotRend1 + rTotRend2 > 0) And (rTotRend1 < ValorIdosoFixo) And (rTotRend2 < ValorIdosoFixo) Then
                                          Begin
                                             If rTotRend1 > 0 Then
                                                Begin
                                                   If Trim(pai.CodigoRubricas) = '' Then
                                                      Begin
                                                         iPosicao := Linhas.IndexOfLinha(pai.iLinhaAcima65, 1, sCodigoNatureza[1]);
                                                         If iPosicao > -1 Then
                                                            Begin
                                                               Linhas[iPosicao].AtualizarValores(rTotRend1,
                                                                  rTotRend1);
                                                            End
                                                         Else
                                                            Begin
                                                               Linhas.AdicionarValores(pai.iLinhaAcima65,
                                                                  rTotRend1,
                                                                  rTotRend1,
                                                                  1,
                                                                  sCodigoNatureza[1],
                                                                  FlgPensaoAlim);
                                                            End;
                                                      End;
                                                End;

                                             If rTotRend1 > 0 Then
                                                ValorIdoso := ValorIdosoFixo - rTotRend1
                                             Else
                                                ValorIdoso := ValorIdosoFixo;

                                             If rTotRend2 > 0 Then
                                                Begin
                                                   If rTotRend1 >= 0 Then
                                                      Begin
                                                         iPosicao := Linhas.IndexOfLinha(iLinhaRendINSS, 2, sCodigoNatureza[2]);
                                                         If iPosicao > -1 Then
                                                            Begin
                                                               Linhas[iPosicao].AtualizarValores((rTotRend2 - ValorIdoso),
                                                                  (rTotRend2 - ValorIdoso));
                                                            End
                                                         Else
                                                            Begin
                                                               Linhas.AdicionarValores(iLinhaRendINSS,
                                                                  (rTotRend2 - ValorIdoso),
                                                                  (rTotRend2 - ValorIdoso),
                                                                  2,
                                                                  sCodigoNatureza[2],
                                                                  FlgPensaoAlim);
                                                            End;
                                                      End
                                                   Else
                                                      Begin
                                                         iPosicao := Linhas.IndexOfLinha(iLinhaRendINSS, 2, sCodigoNatureza[2]);
                                                         If iPosicao > -1 Then
                                                            Begin
                                                               Linhas[iPosicao].AtualizarValores((rTotRend2 - ValorIdoso + rTotRend1),
                                                                  (rTotRend2 - ValorIdoso + rTotRend1));
                                                            End
                                                         Else
                                                            Begin
                                                               Linhas.AdicionarValores(iLinhaRendINSS,
                                                                  (rTotRend2 - ValorIdoso + rTotRend1),
                                                                  (rTotRend2 - ValorIdoso + rTotRend1),
                                                                  2,
                                                                  sCodigoNatureza[2],
                                                                  FlgPensaoAlim);
                                                            End;
                                                      End;

                                                   If Trim(pai.CodigoRubricas) = '' Then
                                                      Begin
                                                         iPosicao := Linhas.IndexOfLinha(pai.iLinhaAcima65INSS, 2, sCodigoNatureza[2]);
                                                         If iPosicao > -1 Then
                                                            Begin
                                                               Linhas[iPosicao].AtualizarValores(ValorIdoso,
                                                                  ValorIdoso);
                                                            End
                                                         Else
                                                            Begin
                                                               Linhas.AdicionarValores(pai.iLinhaAcima65INSS,
                                                                  ValorIdoso,
                                                                  ValorIdoso,
                                                                  2,
                                                                  sCodigoNatureza[2],
                                                                  FlgPensaoAlim);
                                                            End;
                                                      End;
                                                End;
                                          End;
                                    End;
                              End;
                        End;
                     {Fim 4º Caso - A fonte pagadora 1 é menor que valor do idoso e a fonte pagadora 2 é menor que valor do idoso}

                     {5º Caso - A fonte pagadora 1 é menor que 0 e  nao tem fonte pagadora 2}
                     If (rTotRend1 + rTotRend2 <> 0) And (rTotRend1 < 0) And (rTotRend2 = 0) Then
                        Begin
                           If rTotRend1 < 0 Then
                              Begin
                                 iPosicao := Linhas.IndexOfLinha(iLinhaRend, 1, sCodigoNatureza[1]);
                                 If iPosicao > -1 Then
                                    Begin
                                       Linhas[iPosicao].AtualizarValores(rTotRend1,
                                          rTotRend1);
                                    End
                                 Else
                                    Begin
                                       Linhas.AdicionarValores(iLinhaRend,
                                          rTotRend1,
                                          rTotRend1,
                                          1,
                                          sCodigoNatureza[1],
                                          FlgPensaoAlim);
                                    End;
                              End;
                        End;
                     {Fim 5º Caso - A fonte pagadora 1 é menor que 0 e  nao tem fonte pagadora 2}

                     {6º Caso - A fonte pagadora 2 é menor que 0 e  nao tem fonte pagadora 1}
                     If (rTotRend1 + rTotRend2 <> 0) And (rTotRend2 < 0) And (rTotRend1 = 0) Then
                        Begin
                           If rTotRend2 < 0 Then
                              Begin
                                 iPosicao := Linhas.IndexOfLinha(iLinhaRendINSS, 2, sCodigoNatureza[2]);
                                 If iPosicao > -1 Then
                                    Begin
                                       Linhas[iPosicao].AtualizarValores(rTotRend2,
                                          rTotRend2);
                                    End
                                 Else
                                    Begin
                                       Linhas.AdicionarValores(iLinhaRendINSS,
                                          rTotRend2,
                                          rTotRend2,
                                          2,
                                          sCodigoNatureza[2],
                                          FlgPensaoAlim);
                                    End;
                              End;
                        End;
                     {Fim 6º Caso - A fonte pagadora 1 é menor que 0 e  nao tem fonte pagadora 2}

                     {7º Caso - A fonte pagadora 1 e 2 são menores são menores que 0}
                     If (rTotRend1 < 0) And (rTotRend2 < 0) Then
                        Begin
                           If rTotRend1 < 0 Then
                              Begin
                                 iPosicao := Linhas.IndexOfLinha(iLinhaRend, 1, sCodigoNatureza[1]);
                                 If iPosicao > -1 Then
                                    Begin
                                       Linhas[iPosicao].AtualizarValores(rTotRend1,
                                          rTotRend1);
                                    End
                                 Else
                                    Begin
                                       Linhas.AdicionarValores(iLinhaRend,
                                          rTotRend1,
                                          rTotRend1,
                                          1,
                                          sCodigoNatureza[1],
                                          FlgPensaoAlim);
                                    End;
                              End;

                           If rTotRend2 < 0 Then
                              Begin
                                 iPosicao := Linhas.IndexOfLinha(iLinhaRendINSS, 2, sCodigoNatureza[2]);
                                 If iPosicao > -1 Then
                                    Begin
                                       Linhas[iPosicao].AtualizarValores(rTotRend2,
                                          rTotRend2);
                                    End
                                 Else
                                    Begin
                                       Linhas.AdicionarValores(iLinhaRendINSS,
                                          rTotRend2,
                                          rTotRend2,
                                          2,
                                          sCodigoNatureza[2],
                                          FlgPensaoAlim);
                                    End;
                              End;
                        End;
                     {Fim 7º Caso - A fonte pagadora 1 é menor que 0 e  nao tem fonte pagadora 2}
                  End;
                  // Thiago Melo SOL 219219 Kintana 2051170
                  if rTotRend3 <> 0 then begin // Lançamento de RRA
                    iPosicao := Linhas.IndexOfLinha(iLinhaRRA, 2, sCodigoNatureza[3]);
                    if iPosicao > -1 then begin
                      Linhas[iPosicao].AtualizarValores(rTotRend3, rTotRend3)
                    end else begin
                      Linhas.AdicionarValores(iLinhaRRA,
                                              rTotRend3,
                                              rTotRend3,
                                              2,
                                              sCodigoNatureza[3],
                                              FlgPensaoAlim);
                    end;
                  end;
                 // Thiago Melo SOL 219219 Kintana 2051170
            End;
      End;
End;

{ tCodigosNatureza }

Function tCodigosNatureza.Add: tNatureza;
Begin
   Result := tNatureza.Create;
   FNaturezas.Add(Result);
End;

Function tCodigosNatureza.Adiciona(Const pCodigoNatureza: String;
   Const pFlgPensaoAlin: Integer;
   Const pFontePagadora: Integer): tNatureza;
Begin
   result := Add;
   Result.CodigoNatureza := pCodigoNatureza;
   Result.FlgPensaoAlim := IntToStr(pFlgPensaoAlin);
   Result.FontePagadora := pFontePagadora;
End;

Procedure tCodigosNatureza.Clear;
Begin
   While Count > 0 Do
      Delete(0);
   FNaturezas.Clear;
End;

Function tCodigosNatureza.Count: Integer;
Begin
   Result := FNaturezas.Count;
End;

Constructor tCodigosNatureza.Create;
Begin
   fNaturezas := TList.Create;
   fNaturezas.Clear;
End;

Procedure tCodigosNatureza.Delete(Const pIndex: Integer);
Begin
   tNatureza(FNaturezas[pIndex]).Free;
   FNaturezas.Delete(pIndex);
End;
Destructor tCodigosNatureza.Destroy;
Begin
   Inherited;
   Clear;
   FreeAndNil(FNaturezas);
End;

Function tCodigosNatureza.GetNaturezas(Index: Integer): tNatureza;
Begin
   Result := fNaturezas[Index];
End;

Function tCodigosNatureza.IndexOfNatureza(Const pCodigoNatureza: String; Const pFontePagadora: Integer): Integer;
Var i: Integer;
Begin
   result := -1;
   For i := 0 To Count - 1 Do
      Begin
         If (TNatureza(FNaturezas[i]).CodigoNatureza = pCodigoNatureza) And
            (tNatureza(FNaturezas[i]).FontePagadora = pFontePagadora) Then
            Begin
               result := i;
               break;
            End;
      End;
End;

Function tCodigosNatureza.LocalizaNatureza(Const pTotRend1,
   pTotRend2, pTotRend3: Double): String;
Var i: Integer;
Begin
   result := '';
   For i := 0 To Count - 1 Do
      Begin
         If (TNatureza(FNaturezas[i]).rTotRend1 <> 0) and     //Marcio Sanches Spinosa SOL 218825 KINTANA 2050633
            (TNatureza(FNaturezas[i]).FontePagadora = 1) and  //Marcio Sanches Spinosa SOL 218825 KINTANA 2050633
            (TNatureza(FNaturezas[i]).rTotRend1 = pTotRend1) then
         begin
               result := tNatureza(FNaturezas[i]).CodigoNatureza;
               break;
         end;

         if (TNatureza(FNaturezas[i]).rTotRend2 <> 0) and     //Marcio Sanches Spinosa SOL 218825 KINTANA 2050633
            (TNatureza(FNaturezas[i]).FontePagadora = 2) and  //Marcio Sanches Spinosa SOL 218825 KINTANA 2050633
            (TNatureza(FNaturezas[i]).rTotRend2 = pTotRend2) then
         Begin
             result := tNatureza(FNaturezas[i]).CodigoNatureza;
             break;
          End;

         // Thiago Melo SOL 219219 Kintana 2051170
         if (TNatureza(FNaturezas[i]).rTotRend3 <> 0) and
            (TNatureza(FNaturezas[i]).FontePagadora = 2) and
            (TNatureza(FNaturezas[i]).rTotRend3 = pTotRend3) then
         Begin
             result := tNatureza(FNaturezas[i]).CodigoNatureza;
             break;
         End;
         // Thiago Melo SOL 219219 Kintana 2051170
      End;
End;

Function tCodigosNatureza.LocalizaNaturezaAbono(Const pTotRend13,
   pTotRend13a: Double): String;
Var i: Integer;
Begin
   result := '';
   For i := 0 To Count - 1 Do
      Begin
         If (TNatureza(FNaturezas[i]).rTotalRend13 <> 0) and
            (TNatureza(FNaturezas[i]).FontePagadora = 1) and
            (TNatureza(FNaturezas[i]).rTotalRend13 = pTotRend13) then
         begin
           result := tNatureza(FNaturezas[i]).CodigoNatureza;
           break;
         end;


         if (tNatureza(FNaturezas[i]).rTotalRend13A <> 0) and
            (TNatureza(FNaturezas[i]).FontePagadora = 1) and
            (tNatureza(FNaturezas[i]).rTotalRend13A = pTotRend13a) Then
          Begin
             result := tNatureza(FNaturezas[i]).CodigoNatureza;
             break;
          End;

         If (TNatureza(FNaturezas[i]).rTotalRend13 <> 0) and
            (TNatureza(FNaturezas[i]).FontePagadora = 2) and
            (TNatureza(FNaturezas[i]).rTotalRend13 = pTotRend13) then
         begin
           result := tNatureza(FNaturezas[i]).CodigoNatureza;
           break;
         end;


         if (tNatureza(FNaturezas[i]).rTotalRend13A <> 0) and
            (TNatureza(FNaturezas[i]).FontePagadora = 2)  and
            (tNatureza(FNaturezas[i]).rTotalRend13A = pTotRend13a) Then
          Begin
             result := tNatureza(FNaturezas[i]).CodigoNatureza;
             break;
          End;
      End;
End;

Procedure tCodigosNatureza.SetNaturezas(Index: Integer; Const Value: tNatureza);
Begin
   fNaturezas[Index] := Value;
End;

// Ricardo A. SOL 122481 KTN 601965

Function tProcessaDirf.CondicaoNaturezaEspecifica: String;
Begin
   Result := ' ' + #13#10 +
      '-- Condição para Natureza Específica' + #13#10 +
      '  AND (H.CODIRRFDARF = ' + QuotedStr(FIdNaturezaEspecifica) + ')' + #13#10;
End;

Procedure tProcessaDirf.PreparaQuerysIndividual;
Begin
   // Ricardo A. SOL 122339 KTN 599155
   qryVerificaExistenciaAcaoJudicial.Close;
   qryVerificaExistenciaAcaoJudicial.DatabaseName := 'BaseDados';
   qryVerificaExistenciaAcaoJudicial.SQL.Text :=
   ////Marcio Sanches Spinosa SOL 219474 KINTANA 2054063 - Inicio
      'SELECT PROCJUD.IDPessoa' + #13#10 +
      '       ,DECODE(NVL(PERCACAO,0),0,0,1) as TEMACAO' + #13#10 +
      '       ,PROCJUD.PERCACAO ' + #13#10 +
      '       ,PROCJUD.IDPROCJUD' + #13#10 +
      '       ,HISTRUBSAL.IDINFORME ' + #13#10 +
      'FROM PROCJUD ' + #13#10 +
      'LEFT JOIN HISTRUBSAL ON (PROCJUD.IDPESSOA = HISTRUBSAL.IDPESSOA  AND PROCJUD.IDPROCJUD = HISTRUBSAL.IDPROCJUD  '+ #13#10 + //Marcio Sanches Spinosa SOL 227199 KINTANA 2061171
      '  AND MESCOBRANCA = :PMESCOBRANCA ' + #13#10 + //Marcio Sanches Spinosa SOL 222275 KINTANA 2055206
      '  AND HISTRUBSAL.IDHSTFOLHABENEF = :pIdFolha ' + #13#10 +
      '  AND (HISTRUBSAL.IDINFORME IS NOT NULL) )' + #13#10 + //Marcio Sanches Spinosa SOL 227199 KINTANA 2061171
      'WHERE PROCJUD.IDPESSOA = :pIdPessoa' +
      '  AND DATAINICIO <= :pDataFinal' + #13#10 +
      '  AND  ((DATAFINAL Is Null) OR (DATAFINAL >= :pDataInicial)) ';
   ////Marcio Sanches Spinosa SOL 219474 KINTANA 2054063 - Fim
   qryVerificaExistenciaAcaoJudicial.Prepare;

   qryVerificaRegraIT.Close;
   qryVerificaRegraIT.DatabaseName := 'BaseDados';
   qryVerificaRegraIT.SQL.Text :=
      'SELECT D.IDPESSOA,' + #13#10 +
      '       D.IDPROCJUD,' + #13#10 +
      '       D.IDREGRA,' + #13#10 +
      '       D.FLGATIVA,' + #13#10 +
      '       R.NOMEREGRA,' + #13#10 +
      '       D.IDRUBRICA,' + #13#10 +
      '       P.DESCRPROVDESC AS DESCRICAO,' + #13#10 +
      '       D.IDRUBRICAABONO,' + #13#10 +
      '       P1.DESCRICAO' + #13#10 +
      '  FROM REGRA R, DETPROCJUD D, PROVDESC P, PROVDESC P1' + #13#10 +
      ' Where R.IDREGRA = D.IDREGRA' + #13#10 +
      '   AND R.IDRegra = :pIdRegra' + #13#10 +
      '   AND D.IDRUBRICA = P.IDPROVENTO' + #13#10 +
      '   AND D.IDRUBRICAABONO = P1.IDPROVENTO(+)' + #13#10 +
      '   AND D.IDPessoa = :pIdPessoa';
   qryVerificaRegraIT.Prepare;

   qrySalarioNormal.Close;
   qrySalarioNormal.DatabaseName := 'BaseDados';
   //Marcio Sanches Spinosa SOL 215733 KINTANA 2044850 - Inicio
   // Edilaine - SOL 212983 / KTN 2039612
   qrySalarioNormal.SQL.Text :=   carregaQueryIndividual65Anos;
 
   qrySalarioNormal.Prepare;

   qrySalarioNormal2.Close;
   qrySalarioNormal2.DatabaseName := 'BaseDados';
   qrySalarioNormal2.SQL.Text :=
      ' SELECT SUM(LI.VLRLANC) AS VLRBASE65 ' +
      ' FROM LANCXINFORME LI, LANCIRRF L ' +
      ' WHERE LI.IDLANCIRRF = L.IDLANCIRRF ' +
      '   AND LI.IDINFORME IN ( :pLinhaAbono1, :pLinhaAbono2 )' +
      '   AND TO_CHAR(L.DATAPAGAMENTO, ''YYYY'') = :pData' +
      //'   AND L.IDBENEFIRRF = :pIDBenef';                    // Edilaine - SOL 199978 / KTN 1925538 - comentado
      '   AND L.IDBENEFIRRF in (SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO = :CPF)';   // Edilaine - SOL 199978 / KTN 1925538
   qrySalarioNormal2.Prepare;

   qryHistoricoMolestiaGrave.Close;
   qryHistoricoMolestiaGrave.DatabaseName := 'BaseDados';
   qryHistoricoMolestiaGrave.SQL.Text :=
      ' SELECT DTInicio,DTFinal ' +
      ' FROM HSTMOLESTIAGRAVE ' +
      ' WHERE IDPESSOA = :pIDpessoa';
   qryHistoricoMolestiaGrave.Prepare;
   // FIM Ricardo A. SOL 122339 KTN 599155
End;

Function tProcessaDirf.GetAno: String;
Begin
   Result := FormatDateTime('yyyy', DataInicial);
End;

Function tProcessaDirf.GetQtdeMesesRRA: integer; // Felipe A. Santos SOL 195438 KINTANA 1878097
Var
   sSQL : string;
Begin
  try
     {RRA = rendimentos recebidos acumuladamente}
     {Em abril de 2013 foi desenvolvido na funcionalidade da Prévia da Folha de Benefícios o cálculo do imposto para registros de RRA.
     Porém, para a geração dos comprovantes de informe de rendimentos, a quantidade de número de meses utilizados como base de
     cálculo dos RRA deve ser informada ao participante}


     sSQL := 'SELECT COUNT(1) AS QTDMESES, IDPESSOA ' + //Marcio Sanches Spinosa SOL 222275 KINTANA 2055206
             '  FROM (select DISTINCT H.MES, H.IDPESSOA, ' +
             '               to_char(SUBSTR(H.MES, 1, 4)) AS MES, '+                                 // edilaine.ferraresi - SOL 221561 / KTN 2054178
             '               (to_char(SUBSTR(hf.mesreferencia, 1, 4)) - 1) AS MESREFERENCIA  '+      // edilaine.ferraresi - SOL 221561 / KTN 2054178
             '         from histrubsal h, hstfolhabenef hf, provdesc pr ' +
             ' where H.IDHSTFOLHABENEF = HF.IDHSTFOLHABENEF ' +
//             '   AND H.DATAPAGAMENTO = HF.DATAEFETIVACAO ' +
             '   AND H.DATAPAGAMENTO = HF.DATAPREVPAGTO ' +
             '   and h.mescobranca = ' + quotedStr(FormatDateTime('YYYY/MM', QryDadosIndividuais.fieldByName('DATAPAGAMENTO').asdatetime)) + //Marcio Sanches Spinosa SOL 222275 KINTANA 2055206
             '   and hf.IDHSTFOLHABENEF = ' + IntToStr(Versao) +
             '   and H.IDPESSOA = ' + QryDadosIndividuais.FieldByName('IDPESSOA').AsString +
             '   AND H.IDRUBRICA =PR.IDPROVENTO ' +
             ' AND H.CODPROVDESC = PR.CODPROVDESC ' +
             ' AND H.CODIRRFDARF = PR.CODIRRFDARF ' +
             ' AND PR.FLGRRA = 1 ' +

//             '   and exists (select 1 ' +
//             '                 from PROVDESC PR ' +
//             '                where H.IDRUBRICA = PR.IDPROVENTO ' +
//             '                  and PR.FLGRRA = 1) ' +
             //'   and TO_NUMBER(SUBSTR(H.MES, 1, 4)) <= TO_NUMBER(SUBSTR(hf.mesreferencia, 1, 4)) - 1) ' +  // edilaine.ferraresi - SOL 221561 / KTN 2054178
             ' ) GROUP BY IDPESSOA ';

     qryQtdMesesRRA.Data := GetDataPacket(sSQL);

     Result := qryQtdMesesRRA.FieldByName('QTDMESES').AsInteger;
  finally
     qryQtdMesesRRA.Close;
  end;
End;  // Felipe A. Santos SOL 195438 KINTANA 1878097 - fim
function tProcessaDirfIndividual.iif(c: boolean; a, b: integer): integer;
begin
    if c then
     iif := a
  else
     iif := b ;
end;

function tProcessaDirfIndividual.iif(c: boolean; a, b: string): string;
begin
    if c then
     iif := a
  else
     iif := b;
end;
// Thiago Melo SOL 219219 Kintana 2051170
procedure tProcessaDirfIndividual.organizaValoresTotIRRF;
var
  i : Integer;
begin
  FListaTotRend := nil;
{  for i := 0 to Linhas.Count - 1 do begin
    if (TLinhaInformeDirf(FLinhas[i]).FontePagadora = 2) then begin
      SetLength(FListaTotRend, Length(FListaTotRend) + 1);
      with FListaTotRend[Length(FListaTotRend)-1] do begin
        IdInforme   := TLinhaInformeDirf(FLinhas[i]).IdInforme;
        Valor       := TLinhaInformeDirf(FLinhas[i]).ValorLancamento;
      end;
    end;
  end;  }

  Pai.qryDadosIndividuais.First;
  while not Pai.qryDadosIndividuais.Eof do begin
    SetLength(FListaTotRend, Length(FListaTotRend) + 1);
    with FListaTotRend[Length(FListaTotRend)-1] do begin
      IdInforme   := Pai.qryDadosIndividuais.FieldByName('IDINFORME').AsInteger;
      Valor       := Pai.qryDadosIndividuais.FieldByName('VALORSINAL').AsFloat;
      Natureza    := Pai.qryDadosIndividuais.FieldByName('CODIRRFDARF').AsString;
    end;
    Pai.qryDadosIndividuais.Next;
  end;
  Pai.qryDadosIndividuais.First;
end;

function tProcessaDirfIndividual.SomaValoresTotInforme(_idInforme : Integer) : Double;
var
  i : integer;
  tot : Double;
begin
  for i := Low(FListaTotRend) to High(FListaTotRend) do begin
    if FListaTotRend[i].IdInforme = _IdInforme then begin
      tot := tot + FListaTotRend[i].Valor;
    end;
  end;
  Result := tot;
end;

function tProcessaDirfIndividual.SomaValoresTotNatureza(
  _natureza: String): Double;
var
  i : integer;
  tot : Double;
begin
  for i := Low(FListaTotRend) to High(FListaTotRend) do begin
    if FListaTotRend[i].Natureza = _natureza then begin
      tot := tot + FListaTotRend[i].Valor;
    end;
  end;
  Result := tot;
end;

procedure tProcessaDirfIndividual.verificaQtdFontePagadoraINSS;
var
  naturezasINSS, naturezasINSSTMP : array of Integer;
  x, t, qtd : Integer;

  Function retornaQtdNatINSS (qtdEncontrada : integer) : integer;
  var
    i, z, y, cod : integer;
    encontrou : boolean;
  begin
    SetLength(naturezasINSS, qtdEncontrada + 1);
    y := 0;

    for i := low(naturezasINSSTMP) to high(naturezasINSSTMP) do begin
      encontrou := False;
      cod := naturezasINSSTMP[i];
      if i = 0 then begin
        naturezasINSS[y] := cod;
      end else begin
        for z := low(naturezasINSS) to high(naturezasINSS) do begin
          if naturezasINSS[z] = cod then begin
            encontrou := True;
            break;
          end;
        end;
        if (not encontrou) then begin
          inc(y);
          naturezasINSS[y] := cod;
        end;
      end;
    end;
    SetLength(naturezasINSS, y + 1);
    Result := y;
  end;

begin
  naturezasINSS := nil;
  SetLength(naturezasINSSTMP, Pai.qryDadosIndividuais.RecordCount + 1);

  Pai.qryDadosIndividuais.First;
  x := 0;

  while (not Pai.qryDadosIndividuais.Eof) do begin
    if Pai.qryDadosIndividuais.FieldByName('FONTEPAGADORA').AsInteger = 2 then begin
      naturezasINSSTMP[x] := Pai.qryDadosIndividuais.FieldByName('CODIRRFDARF').AsInteger;
      Inc(x);
    end;
    Pai.qryDadosIndividuais.Next;
  end;
  SetLength(naturezasINSSTMP, x);
  qtd := retornaQtdNatINSS(x);
  if qtd > 0 then begin
    possuiMaisDeUmaNaturazaINSS := True;
  end else begin
    possuiMaisDeUmaNaturazaINSS := False;
  end;
end;
// Thiago Melo SOL 219219 Kintana 2051170


procedure tProcessaDirfIndividual.VerificaSituacaoProcessoEncerrado(pIdPessoa : integer);
begin
  pDataFimProcJud := 0;
  if not (TemAcaoJudicial) then
  begin
    with TwwQuery.Create(nil) do
    begin
      DatabaseName := 'BaseDados';
      close;
      sql.Clear;
      SQL.add('SELECT DATAFINAL, IDPROCJUD, IDPESSOA FROM PROCJUD WHERE IDPESSOA =  :IDPESSOA' );
      //marcio sanches spinosa SOL 244696 PPM 610842 - Inicio
      If (FormatDateTime('MM', Pai.DataInicial) = '11') then
        SQL.add(' AND SITPROCESSO = 2 AND (DATAFINAL IS NULL OR DATAFINAL <= :PDATAFINAL )')
      else
        SQL.Add(' AND SITPROCESSO = 2 AND (DATAFINAL IS NULL OR DATAFINAL >= :PDATAFINAL )'); //Marcio Sanches Spinosa SOL 239290 PPM 515062
      //marcio sanches spinosa SOL 244696 PPM 610842 - Fim  
      ParamByName('IDPESSOA').DataType := ftInteger;
      ParamByName('PDATAFINAL').DataType := ftDateTime;

//      ParamByName('IDPESSOA').Value := IdPessoa;
      ParamByName('IDPESSOA').Value := pIdPessoa;  //Marcio Sanches Spinosa SOL 235271 PPM 446324
      ParamByName('PDATAFINAL').Value := pai.DataInicial;
      Open;
      pDataFimProcJud := FieldByName('DATAFINAL').AsDateTime;
      PidPessoaProc   := FieldByName('IDPESSOA').AsInteger;

      //Marcio Sanches Spinosa SOL 232181 PPM 386423 - Inicio
      if (FormatDateTime('YYYY',pDataFimProcJud) = FormatDateTime('YYYY', Pai.DataInicial)) then
      begin
        TemAcaoJudicial := (pDataFimProcJud > 0);
        pIprocjud167    := FieldByName('IDPROCJUD').AsInteger;//Marcio Sanches Spinosa SOL 225765 KINTANA 2059367
        PidPessoaProc   := FieldByName('IDPESSOA').AsInteger;  //Marcio Sanches Spinosa SOL 235271 PPM 446324
        iIdPessoaProcJud:=PidPessoaProc;//Marcio Sanches Spinosa SOL 235271 PPM 446324
      end
      else
      begin
        TemAcaoJudicial := False;
        pIprocjud167    := 0;
        PidPessoaProc   := 0;   //Marcio Sanches Spinosa SOL 235271 PPM 446324
        iIdPessoaProcJud:=0;
      end;
      //Marcio Sanches Spinosa SOL 232181 PPM 386423 - Fim
      Free;
    end;
  end;
end;

procedure tProcessaDirfIndividual.verificaPagamento13Anterior;
begin
    // Ricardo A. SOL 122339 KTN 599155
    Pai.qrySalarioNormal2.Close;
    Pai.qrySalarioNormal2.sql.clear;
    Pai.qrySalarioNormal2.sql.Add(carregaQueryIndividual65Anos13);
    Pai.qrySalarioNormal2.ParamByName('pLinhaAbono1').Value := pai.iLinhaAbonoAcima65;
    Pai.qrySalarioNormal2.ParamByName('pLinhaAbono2').Value := pai.iLinhaAbonoAcima65INSS;
    Pai.qrySalarioNormal2.ParamByName('pLinhaAbono3').Value := 141;
    //Wylliam Leite da Silva - SOL:246488 PPM:1026389 - Início
    Pai.qrySalarioNormal2.ParamByName('pData').Value := Pai.GetAno; //Copy(Pai.qryDadosIndividuais.fieldByname('DATAPAGAMENTO').AsString, 7, 4);
    Pai.qrySalarioNormal2.ParamByName('pData1').Value := Pai.DataFinal;
    //Pai.qrySalarioNormal2.ParamByName('pData1').Value := Pai.DataInicial;
    //Wylliam Leite da Silva - SOL:246488 PPM:1026389 - Fim

    //Pai.qrySalarioNormal2.ParamByName('pIdBenef').Value := Pai.qryDadosIndividuais.fieldByname('IDPESSOA').AsInteger;   // Edilaine - SOL 199978 / KTN 1925538 - comentado
    Pai.qrySalarioNormal2.sql.Text := StringReplace( Pai.qrySalarioNormal2.sql.Text, ':CPF', QuotedStr(Trim(Pai.qryDadosIndividuais.fieldByname('CPFCNPJ').AsString)), [] );   // Edilaine - SOL 199978 / KTN 1925538
    Pai.qrySalarioNormal2.Open;

    If Not(Pai.qrySalarioNormal2.IsEmpty) Then
    begin
       rValorIdoso13acum := Pai.qrySalarioNormal2.FieldByName('VLRBASE65').AsFloat;
    end;
   // FIM Ricardo A. SOL 122339 KTN 599155

end;

//Wylliam Silva SOL 246623 PPM 732617
procedure tProcessaDirfIndividual.VerificaFimMolestia13Pagamento(
  pDataFimMolestia: TDateTime; pCPF: String);
var QryFimMolestia : TwwQuery;
begin
   QryFimMolestia := TwwQuery.Create(nil);
   QryFimMolestia.DatabaseName := 'BaseDados';

   with QryFimMolestia do
   begin
     close;
     SQL.clear;
     sql.Add(' SELECT P.IDPESSOA, P.DATAFIMMOLESTIA, LI.IDINFORME, LI.VLRLANC, L.CODNATUREZA, IP.IDINFORMEORIGEM FROM PESSOAFISICA P '+
               'INNER JOIN LANCIRRF L ON L.IDBENEFIRRF = P.IDPESSOA '+
               ' INNER JOIN LANCXINFORME LI ON LI.IDLANCIRRF = L.IDLANCIRRF '+
               ' INNER JOIN INFORMEDEPARA IP ON IP.IDINFORMEDESTINO = LI.IDINFORME ' +
               '   AND LI.IDINFORME IN (126) AND IP.IDSITUACAO = 2 AND IP.IDINFORMEORIGEM = 75 '+
               '   AND TO_CHAR(L.DATAPAGAMENTO, ''YYYY'') = '  + FormatDateTime('yyyy', pDataFimMolestia) +
               '   AND L.DATAPAGAMENTO < TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', pDataFimMolestia)) + ', ''DD/MM/YYYY'') '+
               '   AND L.IDBENEFIRRF in '+
               '       (SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO = ' + QuotedStr(pCPF) + ' ) ');
     Open;

     if recordcount > 0 then
     begin

        LinhasAbono.AdicionarValores(FieldByName('IDINFORMEORIGEM').AsInteger,
                           RoundCM(FieldByName('VLRLANC').AsCurrency * -1, 2),
                           RoundCM(FieldByName('VLRLANC').AsCurrency * -1, 2),
                           1,
                           FieldByName('CODNATUREZA').Asstring,
                           FlgPensaoAlim,
                           'D');


        LinhasAbono.AdicionarValores(FieldByName('IDINFORME').AsInteger,
           RoundCM(FieldByName('VLRLANC').AsCurrency, 2),
           RoundCM(FieldByName('VLRLANC').AsCurrency, 2),
           1,
            FieldByName('CODNATUREZA').Asstring,
           FlgPensaoAlim,
           'D');
      end;

      CodigoNatureza := FieldByName('CODNATUREZA').Asstring;
   end;

   FreeAndNil(QryFimMolestia);
end;

function tProcessaDirfIndividual.VerificaQtdLinhas123(prLinhaAbono1: Integer; prDataPagamento: String; prAno: TDateTime; prCPF: String): Integer;
var
  qry: TwwQuery;
  iQtd: Integer;
begin
  Result:= 0;
  iQtd:= 0;

  qry := TwwQuery.Create(Nil);
   try
      qry.DatabaseName := 'BaseDados';
      qry.Close;
      qry.sql.Clear;

      qry.SQL.Add(' SELECT COUNT(LI.IDINFORME) AS QUANTIDADE, SUM(LI.VLRLANC) AS VL123 ' +
              ' FROM LANCXINFORME LI, LANCIRRF L ' +
              ' WHERE LI.IDLANCIRRF = L.IDLANCIRRF ' +
              '   AND LI.IDINFORME IN ( :pLinhaAbono1 )' +
              '   AND TO_CHAR(L.DATAPAGAMENTO, ''YYYY'') = :pData' +
              '   AND L.DATAPAGAMENTO < :PDATA1 ' +
              '   AND L.IDBENEFIRRF in (SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO = :CPF) GROUP BY FONTEPAGADORA') ;

       qry.ParamByName('pLinhaAbono1').AsInteger:= prLinhaAbono1;
       qry.ParamByName('pData').AsString := prDataPagamento;
       qry.ParamByName('PDATA1').AsString := FormatDateTime('yyyy', prAno);
       qry.ParamByName('CPF').AsString := prCPF;
       qry.Open;

       iQtd:= qry.FieldByName('QUANTIDADE').AsInteger;
       valor13acumNovo := qry.FieldByName('VL123').AsFloat;
   finally
       FreeAndNil(qry);
   end;

   Result:= iQtd;
end;

End.


