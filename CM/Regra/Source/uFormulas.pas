{==============================================================================}
{  Sistema - REGRA                                                             }
{  Unit    - uFormulas                                                         }
{  Data    - 06/11/2001                                                        }
{  Objetivo: Guardar as Fórmulas utilizadas no Componente Regra, e as rotinas  }
{            necessárias diminuindo assim o tamanho da unit uREGRA             }
{------------------------------------------------------------------------------}
{  Alterações:                                                                 }
{------------------------------------------------------------------------------}
//------------------------------------------------------------------------------
//  Autor     : Ediaine
//  Pendencia : WO27996
//  Descrição : Ajustar Formula PAGAPECULIOSALDADO
//  Data      : 17/12/2025
//------------------------------------------------------------------------------
//  Autor     : Ediaine
//  Pendencia : WO24119
//  Descrição : Criar Formula PAGAPECULIOSALDADO e ajustar NOVOCALCPENSAOSALDADA
//  Data      : 04/08/2025
//------------------------------------------------------------------------------
//  Autor     : Ediaine
//  Pendencia : WO12189
//  Descrição : Alterar uso do parametro IDPESSOA na formula VALORESBENEFICIO
//  Data      : 21/05/2025
//------------------------------------------------------------------------------
//  Autor     : Ediaine
//  Pendencia : WO18367
//  Descrição : Criar Formula NOVOCALCPENSAOSALDADA e TEMPORALIDADE
//  Data      : 28/02/2025
//------------------------------------------------------------------------------
//  Autor     : Ediaine
//  Pendencia : SIG115844-115954
//  Descrição : Criar Formula EXISTERESERVA
//  Data      : 18/05/2021
//------------------------------------------------------------------------------
//  Autor     : Ediaine
//  Pendencia : SIG 114117-114326
//  Descrição : Criar Formula EXISTERESERVA
//  Data      : 15/04/2021
//------------------------------------------------------------------------------
//  Autor     : Andre Imakawa
//  Pendencia : SIG 103583
//  Descrição : Criar Formula PARAMPESSOADTFIM
//  Data      : 28/10/2020
//------------------------------------------------------------------------------
//  Autor     : Peterson Victor
//  Pendencia : SOL 262534 PPM 1089618
//  Descrição : Alteração da Formula ValorBeneficio
//  Data      : 29/09/2015
//------------------------------------------------------------------------------
//  Autor     : André Oliveira
//  Pendencia : SOL 136384/11722 Kintana  1664442
//  Descrição : Alteração da formula função confiança inteira
//  Data      : 30/04/2013
//------------------------------------------------------------------------------
//  Autor     : Thiago melo
//  Pendencia : SOL 202236 Kintana  1953678
//  Descrição : Alteração da Formula FUNCAOCONFIANCA
//  Data      : 05/03/2013
//------------------------------------------------------------------------------
//  Autor     : André Oliveira
//  Pendencia : SOL 193327 Kintana  1839657
//  Descrição : Criação da formula VWFORMRUBJUD
//  Data      : 31/10/2012
//------------------------------------------------------------------------------
//  Autor     : William Moreira da Silva
//  Rotina    : FUNCAOCONFIANCA
//  Pendencia : SOL 136384/12342 Kintana 1846834
//  Descrição : Ajuste na consulta para considerar três casas decimais
//  Data      : 28/09/2012
//------------------------------------------------------------------------------
//  Autor     : BRUNO AZEVEDO
//  Rotina    : PERCFUNPBC
//  Pendencia : SOL 193897 kintana 1846827
//              Ajuste na função PERCFUNPBC
//------------------------------------------------------------------------------
//  Autor     : Rodrigo de Brito Figueredo
//  Rotina    : FUNCAOCONFIANCA
//  Pendencia : SOL 136384/11743 Kintana 1815484
//  Descrição : Alteração da fórmula FUNCAOCONFIANCA
//  Data      : 03/10/2012
//------------------------------------------------------------------------------
//  Autor     : Monica Gonzaga
//  Rotina    : FUNCAOCONFIANCA
//  Pendencia : SOL 136384/11662 Kintana 1805159
//  Descrição : Alteração da fórmula FUNCAOCONFIANCA
//  Data      : 28/09/2012
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//  Autor     : André Oliveira
//  Pendencia : SOL 136384/10362 Kintana 1712325
//  Descrição : Criação da formula VALORSRBNP
//  Data      : 09/07/2012
//------------------------------------------------------------------------------
//  Autor     : André Oliveira
//  Pendencia : SOL 136384/11583 Kintana 1797827
//  Descrição : ajuste na Formula BUSCADETCALCULO.
//  Data      : 19/09/2012
//------------------------------------------------------------------------------
//  Autor     : André Oliveira
//  Pendencia :  SOL 136384/11302 Kintana 1786550
//  Descrição : Criação da formula VALORBENEFICIOINSS
//  Data      : 05/09/2012
//------------------------------------------------------------------------------
//  Autor     : André Oliveira
//  Pendencia : SOL 136384/10342 Kintana 1712175
//  Descrição : Criação da formula EXCLUIDETCALCULO
//  Data      : 03/07/2012
//------------------------------------------------------------------------------
//  Autor     : André Oliveira
//  Pendencia : SOL 136384/10262 Kintana 1688458
//  Descrição : Alteração da fórmula ADICIONALPERC
//  Data      : 25/06/2012
//------------------------------------------------------------------------------
//  Autor     : André Oliveira
//  Pendencia : SOL 136384/10042 Kintana 1688458
//  Descrição : Criação da formula MAIORCFCOD
//  Data      : 18/06/2012
//------------------------------------------------------------------------------
//  Autor     : André Oliveira
//  Rotina    : FUNCAOCONFIANCA
//  Pendencia : SOL 136384/10002 Kintana 1685939
//  Descrição : Criação da fórmula FUNCAOCONFIANCA
//  Data      : 18/06/2012
//------------------------------------------------------------------------------
//  Autor     : André Oliveira
//  Pendencia : SOL 136384/9641 Kintana 1664442
//  Descrição : Criação da formula DUPLICADETCALCULOTITULAR
//  Data      : 18/06/2012
//------------------------------------------------------------------------------
//  Autor     : Fernando Xavier
//  Pendencia : SOL 136384/9642 Kintana 1664883
//  Descrição : ajuste na fórmula ADICIONALPERC
//  Data      : 15/05/2012
//------------------------------------------------------------------------------
//  Autor     : Fanuel Marinho
//  Pendencia : SOL 136384/8823 Kintana 1680341
//  Descrição : Erro ao buscar adicional compensatório
//  Data      : 31/05/2012
//------------------------------------------------------------------------------
//  Autor     : Fanuel Marinho
//  Pendencia : SOL 179801 Kintana 1666905
//  Descrição : Erro na query que busca valor do VALORPECULIO
//  Data      : 17/05/2012
//------------------------------------------------------------------------------
//  Autor     : Fanuel Marinho
//  Pendencia : SOL 178717/9365  Kintana1653326
//  Descrição : Ao tentar requerer o benefício de pecúlio por morte de assistido
//  está ocorrendo o erro especificado no anexo "2012-05-02 - 2. Evidência do
//  proplema relatada pelo Gestor"
//  Data      : 02/05/2012
//------------------------------------------------------------------------------
//  Autor     : Fanuel Marinho
//  Pendencia : SOL 178717 Kintana 1642152
//  Descrição : A formula VALORPECULIO(@BENEFICIO,@DATAINI,@ID_PESSOA,
//              @ID_TITULAR,@INSS) do modulo de regra esta gerando erro quando
//              o valor @INSS é informado com dec
//  Data      : 20/04/2012
//------------------------------------------------------------------------------
//  Autor     : Vinicius Ferreira
//  Pendencia : SOL 153972 KINTANA 1169147
//  Descrição : Criação da fórmula QTDDIASCFPESSOA
//  Data      : 05/04/2012
//------------------------------------------------------------------------------
//  Autor     : Eraldo Luis da Silva
//  Pendencia : SOL 159196 KINTANA 1302968 INICI
//  Descrição : Criação da fórmula ADICIONALPERC
//  Data      : 29/01/2012
//------------------------------------------------------------------------------
//  Autor     : BRUNO AZEVEDO
//  Rotina    : VALORPECULIO
//  Pendencia : SOL 171158/7442 KINTANA 1532044
//              ADICIONADO "DECODE(to_char(to_date('+QuotedStr(sDataPeculio)+'),''mm''),9,1,"
//------------------------------------------------------------------------------
//  Autor     : Fernando Xavier
//  Rotina    : VALORPECULIO
//  Pendencia : SOL 136385/7422 Kintana 1530999.
//              Retirado o GROUP BY SUBSTR(CM.COTMESREF, 3, 4)do IDBENEFICIO 485
//------------------------------------------------------------------------------
//  Autor     : Fernando Xavier
//  Rotina    : VALORPECULIO
//  Pendencia : SOL 136385/7221 Kintana 1512983
//  Descrição : Criação da fórmula VALORPECULIO
//------------------------------------------------------------------------------
//  Autor     : Fanuel Junior
//  Rotina    : VALORESBENEFICIO
//  Pendencia : SOL 136385.7221 Kintana 1250247
//  Descrição : Criação da fórmula VALORESBENEFICIO
//------------------------------------------------------------------------------
//  Autor     : Fanuel Junior
//  Rotina    : COMPARAVALBENEF
//  Pendencia : SOL 157238 Kintana 1250247
//  Descrição : Criação da fórmula COMPARAVALBENEF
//------------------------------------------------------------------------------
//  Autor     : BRUNO AZEVEDO
//  Rotina    : PERCFUNPBC
//  Pendencia : SOL 137062 kintana 829361
//  Descrição : Ajuste na fórmula.
//------------------------------------------------------------------------------
//  Autor     : Renato Visoni
//  Rotina    : VALORBENEFICIO
//  Pendencia : SOL 126535 kintana 671960
//  Descrição : A fórmula VALORBENEFICIO está buscando o valor do campo VALORTOTAL
//  na BENEFBFCIARIO, entretanto este não é o campo que reflete o valor do benefício
//  do associado. Alterar a regra para que seja buscado o valor do campo VALORATUAL.
//------------------------------------------------------------------------------
//  Autor     : Jéssica Santos
//  Rotina    : Formula PercFunpbc
//  Pendencia : SOL 60443 KINTANA 523817
//  Descrição : Alteração para 4 digitos
//------------------------------------------------------------------------------
//  Autor     : Renato Visoni
//  Rotina    : BUSCAOPCAOBENEF
//  Pendencia : SOL 122084 KINTANA 595029
//  Descrição : Criação da formula BUSCAOPCAOBENEF
//------------------------------------------------------------------------------
//  Autor     : Renato Visoni
//  Rotina    : VALORBENEFICIO
//  Pendencia : SOL 114098 KINTANA 531664
//  Descrição : Criação da formula VALORBENEFICIO
//------------------------------------------------------------------------------

// Autor - Data : Claudio Faria - 03/01/2008
// Descricao    : Formula CTVA - 26850 - Inclui parametro, DATAEFETIVACAO
// Autor - Data : Augusto - 03/01/2008
// Descricao    : Formula VLRBENEFICIO - 27173 - Opção para indicar o IDPESSOA que será usado na consulta
// Autor - Data : Augusto  - 23/10/2007
// Descricao    : Formula RMTRANSFERENCIA - 26070 (Reabertura)
//                Seguindo recomendação da FUNCEF, filtrar apenas pela DATAALIMENTACAO
// Autor - Data : Augusto - 24/09/2007
// Descricao    : Formula SOMACOTASRESERVA - 26092 - Criação
// Autor - Data : Paulo Ramos - 14/08/2007
// Descricao    : Formula RMTRANSFERENCIA - 26070 - Fiz join com PLANPREV para tratar registros com
//                                                  mês referência de abono
// Autor - Data : Augusto - 20/06/2007
// Descricao    : Formula PERCFUNPBC - 25544 - Acerto nas pesquisa
// Autor - Data : Augusto - 27/03/2007
// Descricao    : Formula SOMACONTRIB - 24913 - Novo parametro MESCOBRANCA
// Autor - Data : Augusto - 21/02/2007
// Descricao    : Formula VLRBENEFICIO - 24203 - Opção para escolher MES a pesquisar (COBRANÇA ou REFERENCIA)
// Autor - Data : Augusto - 26/01/2007
// Descricao    : Formula POSSUIMIGRACAO - 24040 - opção para Pesquisar na EVENTOSPREV
// Autor - Data : Augusto - 22/12/2006
// Descricao    : Formula SOMAHSTBENEF - Trocar VLRBENEFPATO para VLRBENEFPGTO
// Autor - Data : Claudio Faria - 17/11/2006 - Pendência 23054 (Reabertura)
// Descricao    : Refiz a query para retornar o valor do CTVA
// Autor - Data : Augusto - 09/10/2006 - Pendência 23503
// Descricao    : Novo parametro SOMENTEVALORESAPAGAR na formula VLRBENEFICIO
// Autor - Data : Claudio Faria - 05/10/2006 - Pendência 23054
// Descricao    : Inclusão da fórmula CTVA
// Autor - Data : Claudio Faria - 03/10/2006 - Pendência 23055
// Descricao    : Alteração na formula VLRBENEFICIO
// Autor - Data : Augusto - 12/09/2006 - Pendência 23270
// Autor - Data : Claudio Faria - 07/08/2006 - Pendência 22691
// Descricao    : Alteração no select para retornar a porcentagem correta
// Autor - Data : Augusto - 10/05/2006 - Pendência 21936
// Descricao    : Inclusão da fórmula RUBREEMBINSS
// Autor - Data : Augusto - 08/03/2006 - Pendência 21619
// Descricao    : Alteração na chamada da formula TRUNC
// Autor - Data : Augusto - 06/03/2006 - Pendência 21628
// Descricao    : Acerto na formula TEMPOFUNDACAO
// Autor - Data : Augusto - 23/01/2006 - Pendência 21313
// Descricao    : Inclusão de uma lista de reservas na formula VALORRESERVA
// Autor - Data : Augusto - 19/12/2005 - Pendência 20710
// Descricao    : Criação da Fórmula SOMACONJUNTORUBRICA
// Autor - Data : Augusto - 07/12/2005 - Pendência 20990
// Descricao    : Alteração na formula VLRBENEFICIO
// Autor - Data : Augusto - 05/12/2005 - Pendência 20917
// Descricao    : Alteração na formula VALORRESERVA
// Autor - Data : Augusto - 17/11/2005 - Pendência 20668
// Descricao    : Novo filtro no SQL da fórmula PARCANTEP
// Autor - Data : Augusto - 13/10/2005 - Pendência 19046
// Descricao    : Novo parametro para a fórmula SOMARUBRICA, indicando se filtra
//                ou não pela patrocinadora
// Autor - Data : Augusto - 26/09/2005 - Pendência 20166
// Descricao    : Criação da Fórmula TOTALIZAITENSEP
// Autor - Data : Augusto - 13/09/2005 - Pendência 19900
// Descricao    : Criação da Fórmula ULTDATAEVENTO
// Rotina       : TEMPOFUNDACAO
// Autor - Data : Augusto - 23/08/2005 - Alteração do campo DATAINICIOINSC para INSCRICAODATA
// Autor - Data : Augusto - 01/08/2005
// Descricao    : Acerto na lógica
// Rotina       : ULTDATACONTRIB
// Autor - Data : Augusto - 30/06/2005 - Pendência 19527
// Descricao    : Criação da Fórmula ULTDATACONTRIB
// Rotina       : TEMPOFUNDACAO
// Autor - Data : Augusto - 09/05/2005 - Pendência 17735
// Descricao    : Não contar para tempo de fundação, eventos com resgate de Reserva
// Rotina       : TEMPOFUNDACAO
// Autor - Data : Paulo Ramos - 28/04/2005 - Pendência 19141
// Descricao    : Não está levando em consideração o parâmetro de FLGCANCELAMENTO quando definido como "S".
// Rotina       : PARAMPESSOA
// Autor - Data : Augusto - 05/04/2005
// Descricao    : Novo parametro para informar o IDPESSOA a pesquisar caso deseje
// Rotina       : VLRREFRUBMES
// Autor - Data : Augusto - 07/01/2005
// Descricao    : Parametro para retornar o maior valor
// Rotina       : PERCFUNPBC
// Autor - Data : Augusto - 29/12/2004
// Descricao    : Acertos no calculo do Adicional Compensatório
// Rotina       : PERCFUNPBC
// Autor - Data : Augusto - 01/12/2004
// Descricao    : Retornar PERC2AC
// Rotina       : SOMAHSTBENEF
// Autor - Data : Augusto - 23/11/2004
// Descricao    : Criação da formula para somar historico de BENEFICIOS
// Rotina       : SOMABENEFICIOS
// Autor - Data : Augusto - 22/11/2004
// Descricao    : Novo parametro para pesquisar na HISTRUBSAL ou HSTBENEFBFCIARIO
// Rotina       : SOMACONTRIB
// Autor - Data : Augusto - 19/11/2004
// Descricao    : Novo parametro para utilizar ou não filtro por PLANOPATRO
// Rotina       : SOMACONTRIB
// Autor - Data : Augusto - 26/08/2004
// Descricao    : Filtrar HSTCONTRIBPRE por lote, para caso de adiantamento de abono (desdobramento)
// Rotina       : RMTRANSFERENCIA
// Autor - Data : Augusto - 03/08/2004
// Descricao    : Alteração para trazer o ultimo saldo da reserva
// Rotina       : POSSUIMIGRACAO
// Autor - Data : Augusto - 21/07/2004
// Descricao    : Criação da Formula
// Rotina       : PERCFUNPBC
// Autor - Data : Augusto - 01/06/2004
// Descricao    : Alteração no formato de retorno
// Autor - Data : Augusto - 01/06/2004
// Descricao    : Acertos na Formula SOMACONTRIB
//-----------------------------------------------------------------------------
// Rotina       : VLRBENEFICIOTOTAL
// Autor - Data : Camille - 27/04/2004
// Descricao    : FORMULA NOVA
//------------------------------------------------------------------------------
// Rotina       : VLRBENEFICIO
// Autor - Data : Augusto - 08/04/2004
// Descricao    : Acerto nos campos de retorno.
//------------------------------------------------------------------------------
// Rotina       : PERCFUNPBC
// Autor - Data : Augusto - 05/04/2004
// Descricao    : Inclusão das mascaras no TO_DATE
//------------------------------------------------------------------------------
// Rotina       : PlanoAnterior
// Autor - Data : Gleyber - 18/03/2004 - Pendencia 16250
// Descricao    : Criada uma condição para atribuir à variavel iIdPessoa o valor
//                do campo IDTITULAR se este existir.
//------------------------------------------------------------------------------
// Autor - Data : Camille - 02.12.2002 - Pendencia 15695
// Descricao    : Voltar cálculo do indice acumulado para considerar 1 no 1o. mes
//------------------------------------------------------------------------------
//  Rotina     : VLRBENEFICIO
//  Autor - Data : David - 12/12/2003 - Pendencia 14653
//  Descrição  : Alterado o ORDER BY do SELECT.
//------------------------------------------------------------------------------

unit uFormulas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, BDE, DB, Stdctrls, Math, finputvar, VcF1, grids, fpassoapasso,
  registry, uPilha, uCalcIrrf, fPegaTab, wwQuery, wwTable,  dsgnintf,
  uMensErro, UDataBase, uRegra, uDiasUteisInvest;

  {----------------------------------------------------------------------------}
  { Declaração das Fórmulas}

  Function VWFORMRUBJUD(Regra : TRegra; Formula : String) : String;//André Oliveira SOL 193327 Kintana  1839657
  Function VALORSRBNP(Regra : TRegra; Formula : String) : String;//André Oliveira SOL 136384/10362 Kintana 1712325
  Function VALORBENEFICIOINSS(Regra : TRegra; Formula : String) : String;//André Oliveira SOL 136384/11302 Kintana 1786550
  Function EXCLUIDETCALCULO(Regra : TRegra; Formula : String) : String;//André Oliveira SOL 136384/10342 Kintana 1712175
  Function FUNCAOCONFIANCA(Regra : TRegra; Formula : String) : String;//SOL 136384/10002 Kintana 1685939
  Function DUPLICADETCALCULOTITULAR (Regra : TRegra; Formula : String) : String;//André Oliveira SOL 136384/9641 Kintana 1664442
  Function ADICIONALPERC(Regra : TRegra; Formula : String) : String;//ELS SOL 159196 Kintana 1302968
  Function VALORESBENEFICIO(Regra : TRegra; Formula : String) : String;//Fanuel Junior SOL Kintana
  Function VALORPECULIO(Regra : TRegra; Formula : String) : String;//SOL 136385/7221 Kintana 1512983
  Function COMPARAVALBENEF(Regra : TRegra; Formula : String) : String;//Fanuel Junior SOL157238 Kintana1250247
  Function CFPBC        (Regra : TRegra; Formula : String) : String;
  Function SOMARUBRICA  (Regra : TRegra; Formula : String) : String;
  Function PARCANTEP    (Regra : TRegra; Formula : String) : String;
  Function MEDIARUBRICA (Regra : TRegra; Formula : String) : String;
  Function FERIADO      (Regra : TRegra; Formula : String) : String;
  Function FUNDATAFINAL (Regra : TRegra; Formula : String) : String;
  Function PERCFUNPBC   (Regra : TRegra; Formula : String) : String;
  Function VLRBENEFICIO (Regra : TRegra; Formula : String) : String;
  Function VALORBENEFICIO (Regra : TRegra; Formula : String) : String; //RENATO VISONI SOL 114098 KINTANA 531664
  Function BUSCAOPCAOBENEF (Regra : TRegra; Formula : String) : string; //RENATO VISONI SOL 122084 KINTANA 595029
  Function BUSCAPLANO   (Regra : TRegra; Formula : String) : string; //ÁDLER
  Function VALORSRB     (Regra : TRegra; Formula : String) : String;
  Function EXISTECAMPO  (Regra : TRegra; Formula : String) : String;
  Function BUSCAMATRICULA  (Regra : TRegra; Formula : String) : String;
  Function VALORRESERVA    (Regra : TRegra; Formula : String) : String;
  Function TEMPOFUNDACAO   (Regra : TRegra; Formula : String) : String;
  Function DIA2            (Regra : TRegra; Formula : String) : String;
  Function VLRCF           (Regra : TRegra; Formula : String) : String;
  Function CTVA            (Regra : TRegra; Formula : String) : String;
  Function DATACONTRIB     (Regra : TRegra; Formula : String) : String;
  Function PLANOANTERIOR   (Regra : TRegra; Formula : String) : String;
  Function BUSCAPERCENTUAL (Regra : TRegra; Formula : String) : String;
  Function VLRCALCINSS     (Regra : TRegra; Formula : String) : String;
  Function DADOSPATROANT   (Regra : TRegra; Formula : String) : String;
  Function CALCULASALPART  (Regra : TRegra; Formula : String) : String;
  Function ENTREDATAS      (Regra : TRegra; Formula : String) : String;
  Function COTACAORENFIX   (Regra : TRegra; Formula : String) : String;
  Function BUSCADETCALCULO (Regra : TRegra; Formula : String) : String;
  Function SOMACONTRIB     (Regra : TRegra; Formula : String) : String;
  Function SOMADIASBENEF   (Regra : TRegra; Formula : String) : String;
  Function SOMABENEFICIOS  (Regra : TRegra; Formula : String) : String;
  Function SOMAHSTBENEF    (Regra : TRegra; Formula : String) : String;
  Function PARAMPESSOA     (Regra : TRegra; Formula : String) : String;
  Function VLRREFRUBMES      (Regra : TRegra; Formula : String) : String;
  Function RMTRANSFERENCIA   (Regra : TRegra; Formula : String) : String;
  Function RESERVAORIGINAL   (Regra : TRegra; Formula : String) : String;
  Function POSSUIMIGRACAO    (Regra : TRegra; Formula : String) : String;
  Function ULTDATACONTRIB    (Regra : TRegra; Formula : String) : String;
  Function ULTDATAEVENTO     (Regra : TRegra; Formula : String) : String;
  Function TOTALIZAITENSEP   (Regra : TRegra; Formula : String) : String;
  Function RUBREEMBINSS    (Regra : TRegra; Formula : String) : String;

  Function SOMACOTASRESERVA  (Regra : TRegra; Formula : String) : String;
  Function SOMACONJUNTORUBRICA (Regra : TRegra; Formula : String) : String;

  Function VLRBENEFICIOTOTAL (Regra : TRegra; Formula : String) : String;

  Function ProcessaRubricaSRB(Regra : TRegra; IdRubrica, SeqProcesso : Integer;
                              AnoMesInicio, AnoMesFim, NomeIndice,
                              NumMesesMedia, FlgGrava :String;
                              cTipoIndice : string;
                              DataRef : String; sFiltrapatro : String = 'S') : Double;

  Function AtualizaParcelaA  (Regra : TRegra; IdRubrica, SeqProcesso  : Integer): Double;

  Function BuscaIndiceReajSalPatro( psProxMesAnoBuscar : String ) : Double;

  function CarregaTabIndice2( Regra: TRegra;
                              psIdPessJur,
                              psIdPessoa,
                              sRubricasAConsiderar,
                              vGruposAConsiderar,
                              psDIB,
                              psNumMeses : string;
                              sFiltrapatro : String = 'S') : boolean;

  Function QTDDIASCFPESSOA  (Regra : TRegra; Formula : String) : String;//Vinicius Ferreira SOL 153972 KINTANA 1169147

  Function PARAMPESSOADTFIM (Regra : TRegra; Formula : String) : String; // Andre Imakawa - SIG 103583

  Function EXISTERESERVA (Regra : TRegra; Formula : String) : String;  //edilaine 114117-114326

  Function MOLESTIAGRAVE (Regra : TRegra; Formula : String) : String;  //edilaine 115844-115954

  Function NOVOCALCPENSAOSALDADA (Regra : TRegra; Formula : String) : String;  //edilaine WO18367
  function TEMPORALIDADE (Regra : TRegra; Formula : String) : String;          //edilaine WO18367

  function PAGAPECULIOSALDADO(Regra : TRegra; Formula : String) : String;      //edilaine WO24119

Type
  {----------------------------------------------------------------------------}
  { Declaração de Tipos                                                        }

  TRecIndice2    = Record
                    AnoMes            : string;
                    Reajuste          : double;
                    Indice            : double;
                    IndiceProRata     : double;
                    IndiceAcumulado   : double;
                    Teto              : double;
                    Salario           : double;
                    SalarioReajustado : double;
                  End;

Var
  {----------------------------------------------------------------------------}
  { Variaveis Globais                                                          }
  X : Integer;

  QryAuxFormula : TwwQuery;

  aTabIndice2 : Array[1..60] of TRecIndice2;


implementation

Uses uFuncoesRegra, uDiasUteis, uSistema ;

{==============================================================================}
{ Formula, CFPBC                                                               }
{   Retorna composição mês a mês dos valores e a media do prazo apurados para  }
{  um Cargo ou Funcao do Hitorico Evolucional                                  }
{------------------------------------------------------------------------------}
Function CFPBC(Regra:TRegra; Formula : String): String;
Type
  TRegDataValorFC = Record
                      AnoMes: String;
                      Valor : Double;
                    End;
  TRegVariaveisFC = Record
                      VarAnoMes: String;
                      VarValor : String;
                    End;
Var
  sDataRef, sDataFinal, sTipo, sDescTipo, sPrazo, sAnoMesRef,
  FormulaAux, sIdPessoa, sSQL, sMesAux : String;
  sAnoMesIni, sAnoMesFim, sAnoMesAtu, sDataAtu : String;

  I, W, iNumDiasMes, iNumDiasCF, iAnoAux, iMesAux,
  iIdDetCalculo : Integer;

  dDataRef : TDateTime;
  A,M,D : Word;
  dValorTotal, dValorMesCF, dValorCF : Currency;
  FlgAnoMes, FlgValor,  FlgPossuiVariaveis : Boolean;

  VetDataValorFC : Array [1..24] Of TRegDataValorFC;
  VetVariaveisFC : Array [1..24] Of TRegVariaveisFC;

  FlgGrava, Letra, Palavra, sValorAux :String;

Begin
  FlgGrava := '0';
  FlgPossuiVariaveis := True;

  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }

  { Retira Nome da Formula }
  FormulaAux := Copy(Formula, 7, Length(Formula));
  FormulaAux := Copy(FormulaAux,1,Length(FormulaAux)-1); { Retira parenteses final ) }

  { Inicia Variaveis  }
  sTipo := '';

  { Pega Data de Referencia }
  I := Pos(',',FormulaAux);
  sDataRef := Copy(FormulaAux,1,I-1);
  sDataRef := Regra.PegaValor(sDataRef);

  { Atualiza texto da Formula }
  FormulaAux := Copy(FormulaAux,I+1,Length(FormulaAux));
  { Pega prazo de processamento }
  I := Pos(',',FormulaAux);
  sPrazo := Copy(FormulaAux,1,(I-1));
  sPrazo := Regra.PegaValor(sPrazo);

  { Atualiza texto da Formula }
  FormulaAux := Copy(FormulaAux,I+1,Length(FormulaAux));
  { Pega Tipo de Processamento (C - Cargo F - Funcao) }
  I := Pos(',',FormulaAux);
  sTipo := Copy(FormulaAux,1,(I-1));
  sTipo := Regra.PegaValor(sTipo);

  { Atualiza texto da Formula }
  FormulaAux := Copy(FormulaAux,I+1,Length(FormulaAux));
  { Pega Tipo de Processamento (C - Cargo F - Funcao) }
  I := Pos(',',FormulaAux);
  FlgGrava := Copy(FormulaAux,1,(I-1));
  FlgGrava := Regra.PegaValor(FlgGrava);

  { * Pega as variaveis de retorno, caso existam * }
  If Pos('[',FormulaAux) <> 0 Then Begin

    { Atualiza texto da Formula }
    FormulaAux := Copy(FormulaAux,I+1,Length(FormulaAux));
    FormulaAux := Copy(Trim(FormulaAux),2,Length(FormulaAux)-1); { Retira Colchetes inicial [ e final ) ] }

    FlgPossuiVariaveis := True;
    FlgAnoMes:= True;
    FlgValor := False;
    I:=1;
    Repeat
      If Pos(Letra,',') <> 0 Then Begin
        If Palavra <> '' Then Begin
          If FlgAnoMes Then Begin
            VetVariaveisFC[I].VarAnoMes := Regra.PegaValor(Palavra);
            FlgAnoMes := False;
          End Else Begin
            VetVariaveisFC[I].VarValor  := Regra.PegaValor(Palavra);
            FlgAnoMes:= True;
            FlgValor := True;
          End;
          Palavra := '';
        End; { If Palavra <> '' }

        If FlgValor Then Begin
          Inc(I);
          FlgValor := False;
        End;

        Letra := '';
      End;

      Palavra := Palavra+Letra;
      Letra   := Copy(FormulaAux,1,1);
      FormulaAux := Copy(FormulaAux,2,Length(FormulaAux)-1);

    Until Letra = ']';

    { Como Ultima Data de Parametro não tem virgula Apos, Guarda ela Aqui Fora. }
    VetVariaveisFC[I].VarValor  := Regra.PegaValor(Palavra);
  End Else Begin
    FlgPossuiVariaveis := False;
  End;

  { Fim da Decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Inicia Resultado }
  Result := '0';

  { Caso esteja executando com tabela auxiliar busca dados nela }
  If Regra.TemQuery Then Begin
    sIdPessoa := Regra.QryOutraRegra.FieldByName('IDPESSOA').AsString;
  End Else Begin
    sIdPessoa := Regra.FQueryIn.FieldByName('IDPESSOA').AsString;
  End;

  sAnoMesRef := Copy(sDataRef,7,4)+'/'+Copy(sDataRef,4,2);

  { Monta consulta e pesquisa no historico de Evolução Funcional }
  {--------------------------------------------------------------}

  If sTipo = 'C' Then Begin { Cargo }
    sDescTipo := 'CAR';
    sSQL := ' SELECT CN.IDCARGOEXT, CN.IDNIVEL, ADD_MONTHS(TO_DATE('+QuotedStr(sDataRef)+', ''DD/MM/YYYY''),-'+sPrazo+') AS DATAINIPROC,  '+
            '        DECODE(GREATEST(E.DATAINICIO, ADD_MONTHS(TO_DATE('+QuotedStr(sDataRef)+', ''DD/MM/YYYY''),-'+sPrazo+' )) , '+
            '               E.DATAINICIO, '+
            '               E.DATAINICIO, '+
            '               ADD_MONTHS(TO_DATE('+QuotedStr(sDataRef)+', ''DD/MM/YYYY''),-'+sPrazo+') ) AS DATAINICIO, '+
            '        DECODE(E.DATAFINAL, NULL, TO_DATE('+QuotedStr(sDataRef)+', ''DD/MM/YYYY''), '+
            '                                  E.DATAFINAL) AS DATAFINAL  '+
            ' FROM   CARGOXNIVEL CN, EVOLFUNCPREV E '+
            ' WHERE  E.IDPESSOA    = '+Regra.FQueryIn.FieldByName('IDPESSOA').AsString+
            ' AND    E.IDCARGOEXT IS NOT NULL           '+
            ' AND    ( (E.DATAINICIO  >= ADD_MONTHS(TO_DATE('+QuotedStr(sAnoMesRef)+', ''YYYY/MM''),-'+sPrazo+'))  '+
            ' OR       ( DECODE(E.DATAFINAL, NULL, TO_DATE('+QuotedStr(sAnoMesRef)+
                        ', ''YYYY/MM''), E.DATAFINAL)   >= ADD_MONTHS(TO_DATE('+QuotedStr(sAnoMesRef)+', ''YYYY/MM''),-'+sPrazo+')) )'+
            ' AND    E.IDPESSJURCG = CN.IDPESSJUR     '+
            ' AND    E.IDCARGOEXT  = CN.IDCARGOEXT    '+
            ' ORDER BY E.DATAINICIO, E.DATAFINAL DESC   ';

  End Else Begin            { Funcao (F) ou Adicional Compensartorio (A) }
    sSQL := 'SELECT '+
            '  E.IDCARGOEXT, E.IDFUNCAO,   E.PERC1AC,    E.PERC2AC, '+
            '  E.PERCFUNCAO, E.MODOFUNCAO, E.IDGRUPOFUNC,           '+
            '  GREATEST(E.DATAINICIO,ADD_MONTHS(TO_DATE('+
                        QuotedStr(sDataRef)+', ''DD/MM/YYYY''),-'+sPrazo+' )) AS DATAINICIO, '+
            '  DECODE(E.DATAFINAL, NULL, TO_DATE('+QuotedStr(sDataRef)+', ''DD/MM/YYYY''), '+
            '                            E.DATAFINAL) AS DATAFINAL  '+
            'FROM   '+
            '  EVOLFUNCPREV E '+
            'WHERE            '+
            '  E.IDPESSOA = '+Regra.FQueryIn.FieldByName('IDPESSOA').AsString+ ' AND '+
            '  E.IDFUNCAO  IS NOT NULL  AND ';

    If sTipo = 'A' Then Begin { Funcao do Adcional Compensatorio }
      sDescTipo := 'ADC';
      sSQL := sSQL + '  E.PERC1AC   IS NOT NULL      AND '
    End Else Begin            { Funcao }
      sDescTipo := 'FUN';
      sSQL := sSQL + '  E.PERC1AC   IS NULL      AND ';
    End;

      sSQL := sSQL + '  ( (E.DATAINICIO  >= ADD_MONTHS(TO_DATE('+QuotedStr(sAnoMesRef)+
                     ', ''YYYY/MM''),-'+sPrazo+')) OR   '+
                     '    (DECODE(E.DATAFINAL, NULL, TO_DATE('+QuotedStr(sAnoMesRef)+
                     ', ''YYYY/MM''), E.DATAFINAL) >= ADD_MONTHS(TO_DATE('+
                     QuotedStr(sAnoMesRef)+', ''YYYY/MM''),-'+sPrazo+')) ) ';
  End; { If sTipo = 'C' }


  { Busca Dados, caso não encontre sai }
  If Not FazQuery(Regra.QueryRegra,sSql) Then Begin
    Exit;
  End;

  { Caso encontre dados, inicia processo }
  {--------------------------------------}
  I:=0;
  While Not Regra.QueryRegra.EOF Do Begin

    { * Busca o Valor do Cargo Funcao * }
    If sTipo = 'C' Then Begin
      sSQL := ' SELECT F.VALOR FROM FAIXANIVEL F '+
              ' WHERE F.IDPESSJUR= '''+Regra.FQueryIn.FieldByName('IDPESSJUR').AsString+''' '+
              ' AND   F.IDNIVEL  = '''+Regra.QueryRegra.FieldByName('IDNIVEL').AsString+''' '+
              ' AND   F.IDFAIXASALEXT IN ( SELECT MAX(IDFAIXASALEXT) FROM FAIXANIVEL '+
              '                            WHERE IDPESSJUR= '''+Regra.FQueryIn.FieldByName('IDPESSJUR').AsString+''' '+
              '                            AND   IDNIVEL  = '''+Regra.QueryRegra.FieldByName('IDNIVEL').AsString+''' '+
              '                            AND   TO_CHAR(DATAEFETIVACAO,''YYYY/MM'') <= '+
              '                                  TO_CHAR(TO_DATE('''+sDataRef+''',''DD/MM/YYYY''),''YYYY/MM'')'+
              '                           ) '
    End Else Begin
      sSQL := ' SELECT F.VALOR FROM FAIXAGRUPO F, GRUPOCARGOEXT G '+
              ' WHERE G.IDPESSJUR   = '''+Regra.FQueryIn.FieldByName('IDPESSJUR').AsString +''' '+
              ' AND   G.IDCARGOEXT  = '''+Regra.QueryRegra.FieldByName('IDFUNCAO').AsString+''' '+
              ' AND   F.IDFAIXASALEXT IN ( SELECT MAX(IDFAIXASALEXT) FROM FAIXAGRUPO F, GRUPOCARGOEXT G '+
              '                            WHERE G.IDPESSJUR   = '''+Regra.FQueryIn.FieldByName('IDPESSJUR').AsString +''' '+
              '                            AND   G.IDCARGOEXT  = '''+Regra.QueryRegra.FieldByName('IDFUNCAO').AsString+''' '+
              '                            AND   F.IDPESSJUR   = G.IDPESSJUR  '+
              '                            AND   F.IDGRUPOFUNC = G.IDGRUPOFUNC '+
              '                            AND   G.DATAVIGENCIA <= TO_DATE('''+sDataRef+''',''DD/MM/YYYY'') '+
              '                            AND   ((G.DATAFIM >= TO_DATE('''+sDataRef+''',''DD/MM/YYYY'') ) OR (G.DATAFIM IS NULL)) '+
              '                            AND   TO_CHAR(F.DATAEFETIVACAO,''YYYY/MM'') <= '+
              '                                  TO_CHAR(TO_DATE('''+sDataRef+''',''DD/MM/YYYY''),''YYYY/MM'')'+
              '                           ) '+
              ' AND   F.IDPESSJUR   = G.IDPESSJUR  '+
              ' AND   F.IDGRUPOFUNC = G.IDGRUPOFUNC '+
              ' AND   G.DATAVIGENCIA <= TO_DATE('''+sDataRef+''',''DD/MM/YYYY'') '+
              ' AND   ((G.DATAFIM    >= TO_DATE('''+sDataRef+''',''DD/MM/YYYY'') ) OR (G.DATAFIM IS NULL)) ';
    End; { If }

    { Busca Dados, caso não encontre sai fora }
    If Not FazQuery(Regra.QueryRegraAux,sSql) Then Begin
      Exit;
    End;

    { Guarda Meses do Processo }
    sDataAtu   := Regra.QueryRegra.FieldByName('DATAINICIO').AsString;
    sAnoMesAtu := Copy(sDataAtu,7,4)+Copy(sDataAtu,4,2);
    sAnoMesFim := Copy(Regra.QueryRegra.FieldByName('DATAFINAL').AsString,7,4)+
                  Copy(Regra.QueryRegra.FieldByName('DATAFINAL').AsString,4,2);

    If sTipo = 'A' Then { Funcao do Adcional Compensatorio }
      dValorCF   := (Regra.QueryRegraAux.FieldByName('VALOR').AsFloat*
                     Regra.QueryRegra.FieldByName('PERC1AC').AsFloat/100)
    Else                { Funcao }
      dValorCF   := (Regra.QueryRegraAux.FieldByName('VALOR').AsFloat);

    { Processa o Periodo }
    {--------------------}
    While sAnoMesAtu <= sAnoMesFim Do Begin

      Inc(I); { Acumula contador de processamento }

      { Pega o ultimo dia do Mes Atual }
      dDataRef := DiasUteis.UltDiaMes(StrToInt(Copy(sAnoMesAtu,1,4)),
                                      StrToInt(Copy(sAnoMesAtu,5,2)));
      { Caso o ultimo do mês seja maior que a data final, usa a data final }
      If dDataRef > Regra.QueryRegra.FieldByName('DATAFINAL').AsDateTime Then Begin
        dDataRef := Regra.QueryRegra.FieldByName('DATAFINAL').AsDateTime;
      End;

      { Caso a data final seja maior que a data de limite, usa a data de limite }
      If dDataRef > StrToDate(sDataRef) Then Begin
        dDataRef := StrToDate(sDataRef);
      End;
      sDataFinal := DateToStr(dDataRef);

      { Guarda numero de dias do mes atual }
      DecodeDate(DiasUteis.UltDiaMes(StrToInt(Copy(sAnoMesAtu,1,4)),
                                     StrToInt(Copy(sAnoMesAtu,5,2))),A,M,D);
      iNumDiasMes := D;
      { Calcula o Numero de dias no Cargo/Funcao }
      iNumDiasCF := (DiasUteis.IntervaloDias(StrToDate(sDataAtu), StrToDate(sDataFinal))+1);
      If iNumDiasCF = 1 Then Begin
        iNumDiasCF := 0;
      End;

      { Gera e Acumula os Valores }
      dValorMesCF := ( (dValorCF*iNumDiasCF)/iNumDiasMes );
      dValorTotal := (dValorTotal + dValorMesCF);

      { Guarda Registro no Vetor de Historico }
      VetDataValorFC[I].AnoMes := sAnoMesAtu;
      VetDataValorFC[I].Valor  := dValorMesCF;

      {---------------------------------}
      { Acerta proxima data a processar }
      iAnoAux := StrToInt(Copy(sAnoMesAtu,1,4));
      iMesAux := StrToInt(Copy(sAnoMesAtu,5,2));
      { Caso pule ano }
      iMesAux := iMesAux + 1;
      if iMesAux > 12 then begin
        iMesAux := 1;
        iAnoAux := iAnoAux + 1;
      end;
      { Caso mes menor que 9 concatena com 0 }
      If iMesAux < 10 Then
        sMesAux := '0'+IntToStr(iMesAux)
      Else
        sMesAux := IntToStr(iMesAux);

      sAnoMesAtu := IntToStr(iAnoAux)+sMesAux;
      sDataAtu   := '01/'+Copy(sAnoMesAtu,5,2)+'/'+Copy(sAnoMesAtu,1,4);

    End; { While sAnoMesAtu <= }

    { Proximo registro a processar }
    Regra.QueryRegra.Next;

  End; { While }

  sAnoMesAtu := Copy(sDataRef,7,4)+Copy(sDataRef,4,2);

  For I := 1 To StrToInt(sPrazo) do Begin

    dValorMesCF := 0;
    { Busca Mes atual no Vetor }
    For W := 1 To 24 do Begin
      { Caso Encontre o Mes, grava }
      If (VetDataValorFC[W].AnoMes = sAnoMesAtu) Then Begin
        dValorMesCF := dValorMesCF + VetDataValorFC[W].Valor;
      End;

    End;

    { Grava dados na Memória de Calculo }
    {-----------------------------------}
    If (FlgGrava = '1') And (Regra.FlgGravaCalculo = True) Then Begin
      { Gera identificador do calculo }
      If Regra.FIdCalculo = 0 Then Begin
        Regra.FIdCalculo := LeUltRegistro(Nil,'CALCULO');
        ExecutarQuery(Regra.QueryRegraAux,'INSERT INTO CALCULO (IDCALCULO) VALUES ('+
                                          IntToStr(Regra.FIdCalculo)+')');
      End;

      { Verifica se a linha já foi incluida }
      sSQL := 'SELECT IDDETCALCULO FROM DETCALCULO WHERE IDCALCULO = '+
              IntToStr(Regra.FIdCalculo)+' AND DESCRICAO = '+QuotedStr(sAnoMesAtu);

      { Caso Encontre dados, Atualiza o valor caso contrário insere registro }
      If FazQuery(Regra.QueryRegraAux,sSQL) Then Begin
        { Monta SQL }
        sSQL := 'UPDATE DETCALCULO SET '+
                ' VALOR = (VALOR+'+FloatToStrF(dValorMesCF,ffgeneral,15,2)+''','+')'+
                'WHERE IDDETCALCULO = '+Regra.QueryRegraAux.FieldByName('IDDETCALCULO').AsString;

        ExecutarQuery(Regra.QueryRegraAux,sSQL);
      End Else Begin
        { Gera identificador do detalhe do calculo }
        iIdDetCalculo := LeUltRegistro(Nil, 'DETCALCULO');
        { Acerta Numero }
        sValorAux := FloatToStr(dValorMesCF);
        sValorAux := Regra.TrocaCaracter(sValorAux,'.',',');
        { Monta SQL }
        sSQL := 'INSERT INTO DETCALCULO '+
                '(IDCALCULO, IDDETCALCULO, DESCRICAO, VALOR, IDREGRA, IDPESSOA) VALUES ('+
                IntToStr(Regra.FIdCalculo)    +','+
                IntToStr(iIdDetCalculo) +','''+
                sDescTipo+sAnoMesAtu+''','''+
                sValorAux +''','+
                Regra.Rulename    +','+
                sIdPessoa          +')';
        ExecutarQuery(Regra.QueryRegraAux,sSQL);
      End;

    End; { If FlgGrava = '1' }

    { Alimenta variaveis de retorno com o resultado do processo, caso existam  }
    If  FlgPossuiVariaveis = True Then Begin
      Regra.SetVariavel(VetVariaveisFC[I].VarAnoMes,sDescTipo+sAnoMesAtu,VetVariaveisFC[I].VarAnoMes);
      Regra.SetVariavel(VetVariaveisFC[I].VarValor,FloatToStr(dValorMesCF),VetVariaveisFC[I].VarValor);
    End;

    {---------------------------------}
    { Acerta proxima data a processar }
    iAnoAux := StrToInt(Copy(sAnoMesAtu,1,4));
    iMesAux := StrToInt(Copy(sAnoMesAtu,5,2));
    { Caso pule ano }
    iMesAux := iMesAux - 1;
    if iMesAux < 1 then begin
      iMesAux := 12;
      iAnoAux := iAnoAux - 1;
    end;
    { Caso mes menor que 10 concatena com 0 }
    If iMesAux < 10 Then
      sMesAux := '0'+IntToStr(iMesAux)
    Else
      sMesAux := IntToStr(iMesAux);

    sAnoMesAtu := IntToStr(iAnoAux)+sMesAux;
  End;

  Result := (FloatToStr(dValorTotal/StrToInt(sPrazo)));

End; { CFPBC() }


{==============================================================================}
{ Formula, SOMARUBRICA                                                         }
{ Retornar a soma de rubricas, que pertençam a um mesmo grupo, e  que atendam  }
{ a uma determinada condição, e a frequência com que esta condição é atendida, }
{ em um determinado mês.                                                       }
{------------------------------------------------------------------------------}
Function SOMARUBRICA(Regra: TRegra; Formula : String) : String;
Type
  TRecSalario = Record
                  MesRef :String;
                  Indice :Double;
                  SalarioSemTeto:Double;
                  Salario:Double;
                  SalarioIndexado:Currency;
                  ValorTeto:Currency;
                End;
  TRecGrupoIndice = Record
                      Grupo,
                      Indice : String;
                    End;

Var
  aTabSal : Array [1..700] Of TRecSalario;
  aTabGrp : Array [1..20]  Of TRecGrupoIndice;

  sSQL : String;

  sNomeIndice, sAnoMesIni, sAnoMesFim, sAnoMesAtual, FlgGrava, sIdPessoa,
  sIdPessJur, sIdTitular, sIdBeneficio, sSeqProposta, sIdPlanoPrev,
  sDataRef,
  sProxMesBuscar, sProxAnoBuscar, sProxMesAnoBuscar, sNomeIndiceTeto,
  sDataIndiceTeto, sGrupoSRBAtual, sRetroage, sLimiteRetro : String;

  vFormulaAux, vGruposAConsiderar, vAnoMesInicio, sIdRubrica,
  vAnoMesFinal, vOpCondicao, vValorCondicao,
  sNumMesesPesquisa, sNumMesesMedia, sIdIndiceReaj, sIdIndiceTeto,
  Letra, Palavra, sGrupoSRB, sDataInicio : String;

  I, W, wNumRubProc : Word;

  dVlrIndiceAcumulado,
  dVlrUltIndice, dFrequencia, dVlrIndice,
  dValorTeto :  Double;

  dTotalSalarioIndexado : Currency;

  bPulaMes, FlgGrupo, FlgIndice, FlgTemIndice: Boolean;

  cTipoIndice : string; // 1 - Indice na COTACAOMOEDA, 2 - Indice de Reajuste na Patro

  // TRATAMENTO DE GRATIFICACAO DE FERIAS
  bUsaQueryGeral  : boolean;
  sAnoMesRubrica1,
  sAnoMesRubrica2,
  sMesesEncontrados,    sUtilizado,
  sMenorAnoMesRubrica1, sAnoMesRubrica,
  sRubricasAConsiderar : string;
  sRubricasANAOConsiderar : string;
  iContRubrica1        : word;
  iSomaDias            : longint;

  sFiltraPatro, sUltAnoMesGravado    : string;

Begin
   Sistema.NomeEmpresa := 'FCRT';
  Result        := 'False';
  FlgGrava      := '0';
  FlgTemIndice  := False;
  sIdIndiceReaj := '';
  sIdIndiceTeto := '';
  sRetroage     := '0';
  sLimiteRetro  := '0';

  sFiltraPatro  := 'S';

  {----------------------------------------------------------------------------}
  { Decodifica a Formula                                                       }

  { Retira Parenteses () }
  vFormulaAux := Copy(Formula, 12,Length(Formula));
  vFormulaAux := Copy(vFormulaAux,1,Length(vFormulaAux)-1);

  { Guarda grupos de rubricas e indices a Considerar }
  I := Pos('[',vFormulaAux); { Tira [ }
  vFormulaAux := Copy(vFormulaAux, I + 1, Length(vFormulaAux));
  I := Pos(']',vFormulaAux);
  { caso Somente um grupo }
  If Pos(',',Copy(vFormulaAux, 1, I)) = 0 Then Begin
    vGruposAConsiderar := Copy(vFormulaAux, 1, I-1);
    vGruposAConsiderar := QuotedStr(Regra.PegaValor(vGruposAConsiderar));
  End Else Begin
    vGruposAConsiderar := Copy(vFormulaAux, 1, I);
    FlgGrupo  := True;
    FlgIndice := False;
    I:=1;
    Repeat
      If (Pos(Letra,',') <> 0) or (Pos(Letra,',') <> 0) Then Begin

        If Palavra <> '' Then Begin

          If FlgGrupo Then Begin
            aTabGrp[I].Grupo := Regra.PegaValor(Palavra);
            FlgGrupo := False;
          End Else Begin
            aTabGrp[I].Indice:= Regra.PegaValor(Palavra);
            FlgGrupo  := True;
            FlgIndice := True;
            FlgTemIndice := True;
          End;
          Palavra := '';
        End; { If Palavra <> '' }

        If FlgIndice Then Begin
          Inc(I);
          FlgIndice := False;
        End;

        Letra := '';
      End;

      Palavra := Palavra+Letra;
      Letra   := Copy(vGruposAConsiderar,1,1);
      vGruposAConsiderar := Copy(vGruposAConsiderar,2,Length(vGruposAConsiderar)-1);
    Until Letra = ']';
    { Como ultimo valor (Indice) não é preenchido, Guarda ela Aqui Fora. }
    aTabGrp[I].Indice := Regra.PegaValor(Palavra);
    If aTabGrp[I].Indice <> '' Then FlgTemIndice := True;

    { Monta string de grupos de rubricas a pesquisar }
    vGruposAConsiderar :='';
    For W:=1 to 20 Do Begin
      If aTabGrp[W].Grupo = '' Then Break;
      vGruposAConsiderar := vGruposAConsiderar + QuotedStr(aTabGrp[W].Grupo) + ',';
    End;
    vGruposAConsiderar := Copy(vGruposAConsiderar,1,Length(vGruposAConsiderar)-1);
  End; { If Not Pos(',',vFormulaAux) Then Begin }

  { Continua a decodificar a Formula }
  I := Pos(']',vFormulaAux);
  vFormulaAux := Copy(vFormulaAux, I + 1,Length(vFormulaAux));
  I := Pos(',',vFormulaAux);
  vFormulaAux := Copy(vFormulaAux, I + 1,Length(vFormulaAux));

  { Guarda Data de Inicio  }
  I := Pos(',',vFormulaAux);
  If I <= 0 Then I := (Length(vFormulaAux)+1);
  sDataInicio :=  Copy(vFormulaAux,1,I-1);
  sDataInicio :=  Regra.PegaValor(sDataInicio);
  { Gera datas controle }
  vAnoMesInicio := Copy(sDataInicio,7,4)+'/'+Copy(sDataInicio,4,2);
  sAnoMesFim    := Copy(sDataInicio,7,4)+Copy(sDataInicio,4,2);

  { Guarda numero de meses para Media }
  vFormulaAux := Copy(vFormulaAux, I+1,Length(vFormulaAux));
  I := Pos(',',vFormulaAux);
  If I <= 0 Then I := (Length(vFormulaAux)+1);
  sNumMesesMedia := Copy(vFormulaAux,1,I-1);
  If Copy(sNumMesesMedia,1,1) = '@' Then
    sNumMesesMedia := Regra.PegaValor(sNumMesesMedia);
  sNumMesesMedia := '-'+sNumMesesMedia;

  { Flag de Gravação }
  vFormulaAux := Copy(vFormulaAux, I + 1, Length(vFormulaAux));
  I := Pos(',',vFormulaAux);

  If I <= 0 Then begin
    FlgGrava := Copy(vFormulaAux, 1, Length(vFormulaAux));
    I := Length(vFormulaAux);
  End Else
    FlgGrava := Copy(vFormulaAux, 1, I-1);
  FlgGrava := Regra.PegaValor(FlgGrava);

  { Tratamento de Teto }
  sNomeIndiceTeto := '';
  sDataIndiceTeto := '';
  dValorTeto      :=0;

  { Caso tenha Teto guarda }
  vFormulaAux := Copy(vFormulaAux, I + 1, Length(vFormulaAux));
  I := Pos(',',vFormulaAux);
  If I <= 0 Then I := Length(vFormulaAux) Else I := (I - 1);
  sNomeIndiceTeto := Copy(vFormulaAux,1, I);
  sNomeIndiceTeto := Regra.PegaValor(sNomeIndiceTeto);

  { Guarda Indicador para Retroagir }
  vFormulaAux := Copy(vFormulaAux, I + 2, Length(vFormulaAux));
  I := Pos(',',vFormulaAux);
  If I <= 0 Then I := Length(vFormulaAux) Else I := (I - 1);
  sRetroage := Copy(vFormulaAux,1, I);
  sRetroage := Regra.PegaValor(sRetroage);

  { Guarda Limite para Retroagir }
  vFormulaAux := Copy(vFormulaAux, I + 2, Length(vFormulaAux));
  I := Pos(',',vFormulaAux);
  If I <= 0 Then I := Length(vFormulaAux) Else I := (I - 1);
  sLimiteRetro := Copy(vFormulaAux,1, I);
  sLimiteRetro := Regra.PegaValor(sLimiteRetro);

  { Guardar Tipo de Calculo }
  vFormulaAux := Copy(vFormulaAux, I + 2, Length(vFormulaAux));
  I := Pos(',',vFormulaAux);
  If I <= 0 Then I := Length(vFormulaAux) Else I := (I - 1);
  cTipoIndice := Copy(vFormulaAux,1, I);
  cTipoIndice := Regra.PegaValor(cTipoIndice);
  if cTipoIndice = '' then cTipoIndice := '1';

  { Guardar Flg de filtro da Patro }
  vFormulaAux := Copy(vFormulaAux, I + 2, Length(vFormulaAux));
  I := Pos(',',vFormulaAux);
  If I <= 0 Then I := Length(vFormulaAux) Else I := (I - 1);
  sFiltrapatro := Copy(vFormulaAux,1, I);
  sFiltrapatro := Regra.PegaValor(sFiltrapatro);
  if sFiltrapatro = '' then sFiltrapatro := 'S';

  { Fim da Decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Testa campos obrigatorios na Query de Entrada }
  If Regra.FQueryIn.FindField('IDPESSOA') = NIL Then Begin
    MsgDlg('Campo IDPESSOA Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk],0);
    Regra.FError := True;
    SairDaRegra := True;
    Exit;
  End Else If Regra.FQueryIn.FindField('IDTITULAR') = NIL Then Begin
    MsgDlg('Campo IDTITULAR Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk],0);
    Regra.FError := True;
    SairDaRegra := True;
    Exit;
  End Else If Regra.FQueryIn.FindField('IDPESSJUR') = NIL Then Begin
    MsgDlg('Campo IDPESSJUR Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk],0);
    Regra.FError := True;
    SairDaRegra := True;
    Exit;
  End;

  { Caso esteja executando com tabela auxiliar  busca dados nela }
  If Regra.TemQuery Then Begin
    sIdPessoa := Regra.QryOutraRegra.FieldByName('IDPESSOA').AsString;
  End Else Begin
    sIdPessoa := Regra.fQueryIn.FieldByName('IDPESSOA').AsString;
  End;
  sDataRef := sDataInicio;
  {-----------------------------------------------------------------}
  If FlgTemIndice = True Then Begin
    { Inicia Array com Indices }
    For W:=1 to 700 Do Begin
      aTabSal[W].MesRef           := '';
      aTabSal[W].Indice           := 0;
      aTabSal[W].Salario          := 0;
      aTabSal[W].SalarioSemTeto   := 0;
      aTabSal[W].SalarioIndexado  := 0;
      aTabSal[W].ValorTeto        := 0;
    End;

    For W:=1 to 60 Do Begin
      aTabIndice2[W].AnoMes            := '';
      aTabIndice2[W].Reajuste          := 0;
      aTabIndice2[W].Indice            := 0;
      aTabIndice2[W].IndiceProRata     := 0;
      aTabIndice2[W].IndiceAcumulado   := 0;
      aTabIndice2[W].Teto              := 0;
      aTabIndice2[W].Salario           := 0;
      aTabIndice2[W].SalarioReajustado := 0;
    End;

    if cTipoIndice = '2' then begin
       CarregaTabIndice2( Regra,
                          Regra.FQueryIn.FieldByName('IDPESSJUR').AsString,
                          Regra.FQueryIn.FieldByName('IDPESSOA').AsString,
                          sRubricasAConsiderar,
                          vGruposAConsiderar,
                          sDataInicio,
                          sNumMesesMedia,
                          sFiltraPatro );
    end;

    With Regra.QueryRegraAux Do
    Begin
      { Busca salarios e Indexa }
      { Monta consulta e busca salarios }

      bUsaQueryGeral       := True;
      sRubricasAConsiderar := '';
      sRubricasANAOConsiderar := '';

      sUltAnoMesGravado    := '0000/00';

      // ROTINA DE TRATAMENTO DE GRATIFICACAO DE FERIAS
      if (Pos('CRT', UpperCase(Sistema.NomeEmpresa)) > 0) and (Trim(Regra.RuleName) <> '1377')
      then begin
         if Regra.FQueryIn.FieldByName('IDPESSJUR').AsInteger = 1
         then begin
            // -----------------------------------------------------------------
            // Se dentro dos 12 meses, existir mais de uma rubrica 1194
            // - Gratificação de Férias, então considerar apenas a última,
            // desprezar as incidências anteriores no cálculo da média aritmética
            // e considerar a rubrica 1396 - Devolução Gratificação de Férias,
            // somente quando ela ocorrer após a última incidência da rubrica 1194.
            // -----------------------------------------------------------------
            // Buscar as ocorrencias da rubrica 1194 nos 12 ultimos meses
            sSQL := ' SELECT DISTINCT H.MES, H.IDRUBRICA  '+
                    ' FROM   HISTRUBSAL H, PROVDESC P '+
                    ' WHERE  H.IDPESSOA   = '+sIdPessoa;

            If sFiltraPatro = 'S' Then
              sSQL := sSQL +
                    ' AND    H.'+Regra.sCampoPesquisa+'    = '+Regra.FQueryIn.FieldByName('IDPESSJUR').AsString;

            sSQL := sSQL +
                    ' AND    H.MES        < '''+vAnoMesInicio+''''+
                    ' AND    H.MES        >= TO_CHAR(ADD_MONTHS(TO_DATE('+
                                             QuotedStr(vAnoMesInicio)+', ''YYYY/MM''),'+sNumMesesMedia+'), ''YYYY/MM'')  '+
                    ' AND    SUBSTR(H.MES,6,2) <> ''13'' '+
                    ' AND    ((P.IDPROVENTO = 1194) OR (P.IDPROVENTO = 1396))         '+
                    ' AND    H.IDRUBRICA = P.IDPROVENTO '+
                    ' ORDER BY H.MES' ;

            FazQuery(Regra.QueryRegraAux, sSQL);
            if not IsEmpty
            then begin // Pessoa teve uma ou mais gratificacao de ferias
               bUsaQueryGeral       := False;
               sAnoMesRubrica1      := '0000/00';
               sAnoMesRubrica2      := '0000/00';
               iContRubrica1        := 0;
               sRubricasAConsiderar := '';
               sRubricasANAOConsiderar := '';

               while not Eof do
               begin
                  if (FieldbyName('IDRUBRICA').AsString = '1194') and
                     (FieldbyName('MES').AsString > sAnoMesRubrica1)
                  then begin
                     sAnoMesRubrica1 := FieldbyName('MES').AsString;
                     inc(iContRubrica1);
                  end;

                  if (FieldbyName('IDRUBRICA').AsString = '1396') and
                     (FieldbyName('MES').AsString > sAnoMesRubrica2)
                  then sAnoMesRubrica2 := FieldbyName('MES').AsString;

                  Next;
               end;

               sRubricasAConsiderar := ' ( (H.IDRUBRICA = 1194) AND (H.MES = '''+sAnoMesRubrica1+''') ) ';
               if Trim(sRubricasANAOConsiderar) = ''
               then sRubricasANAOConsiderar := '1194'
               else sRubricasANAOConsiderar := sRubricasANAOConsiderar +',1194';

               if sAnoMesRubrica2 > sAnoMesRubrica1
               then begin
                  sRubricasAConsiderar := '( '+ sRubricasAConsiderar + ' OR '+
                                            '  ( (H.IDRUBRICA = 1396) AND (H.MES = '''+sAnoMesRubrica2+''') ) '+
                                            ') ';
               if Trim(sRubricasANAOConsiderar) = ''
               then sRubricasANAOConsiderar := '1396'
               else sRubricasANAOConsiderar := sRubricasANAOConsiderar +',1396';
               end
            end;
         end
         else if Regra.FQueryIn.FieldByName('IDPESSJUR').AsInteger = 50028
         then begin
            // -----------------------------------------------------------------
            // Se dentro dos 12 últimos meses, existir mais de uma rubrica 5051
            // (1/3 CONST.FÉRIAS) então somar a quantidade de dias do código
            // 5787 (Qtde. dias férias mês)
            // Se a quantidade for <= que 30 dias,
            // Entao deixar no cálculo as duas rubricas 5051
            // Senão utilizar a última incidência da rubrica  e para este caso
            // também deverá ser utilizado as rubricas de devolução (=5227, 5226 e 5286)
            // e as de diferenças (= 5053 e 5052), pagas nesta última incidência ou posteriormente.
            // Se dentor dos 12 ultimos meses, existir apenas uma rubrica 5051
            // Entao pegar esta rubrica e suas diferencas
            // -----------------------------------------------------------------
            // Buscar as ocorrencias da rubrica 5051 nos 12 ultimos meses
            sSQL := ' SELECT DISTINCT H.MES, H.IDRUBRICA  '+
                    ' FROM   HISTRUBSAL H, PROVDESC P '+
                    ' WHERE  H.IDPESSOA   = '+sIdPessoa;

            If sFiltraPatro = 'S' Then
              sSQL := sSQL +
                    ' AND    H.'+Regra.sCampoPesquisa+'    = '+Regra.FQueryIn.FieldByName('IDPESSJUR').AsString;

            sSQL := sSQL +
                    ' AND    H.MES        < '''+vAnoMesInicio+''''+
                    ' AND    H.MES        >= TO_CHAR(ADD_MONTHS(TO_DATE('+
                                             QuotedStr(vAnoMesInicio)+', ''YYYY/MM''),'+sNumMesesMedia+'), ''YYYY/MM'')  '+
                    ' AND    SUBSTR(H.MES,6,2) <> ''13'' '+
                    ' AND    P.IDPROVENTO = 5051         '+
                    ' AND    H.IDRUBRICA = P.IDPROVENTO  '+
                    ' ORDER BY H.MES' ;

            FazQuery(Regra.QueryRegraAux, sSQL);

            sAnoMesRubrica1      := '0000/00';
            sAnoMesRubrica2      := '0000/00';
            sMenorAnoMesRubrica1 := '2999/12';
            sMesesEncontrados    := '';
            iContRubrica1        := 0;
            sRubricasAConsiderar := '';
            sRubricasANAOConsiderar := '';

            if not IsEmpty
            then begin // Pessoa teve uma ou mais rubrica de ferias
               sAnoMesRubrica1      := '0000/00';
               sAnoMesRubrica2      := '0000/00';
               sMesesEncontrados    := '';
               iContRubrica1        := 0;
               sRubricasAConsiderar := '';
               sRubricasANAOConsiderar := '';
               while not Eof do
               begin
                  if (FieldbyName('MES').AsString > sAnoMesRubrica1)
                  then begin
                     sAnoMesRubrica1 := FieldbyName('MES').AsString;
                     inc(iContRubrica1);
                     if Trim(sMesesEncontrados) = ''
                     then sMesesEncontrados := ''''+sAnoMesRubrica1+''''
                     else sMesesEncontrados := sMesesEncontrados + ','''+sAnoMesRubrica1+'''';

                     if sAnoMesRubrica1 < sMenorAnoMesRubrica1
                     then sMenorAnoMesRubrica1 := sAnoMesRubrica1;
                  end;

                  Next;
               end;
            end;

            if iContRubrica1 > 1 // Existe mais de uma rubrica 5051
            then begin           // Entao, somar a qtde de dias da rubrica 5787
              sSQL :=  ' SELECT DISTINCT H.MES, SUM(H.VALORPROVENTO) AS NUMDIAS '+
                       ' FROM   HISTRUBSAL H, PROVDESC P '+
                       ' WHERE  H.IDPESSOA   = '+sIdPessoa;

              If sFiltraPatro = 'S' Then
                sSQL := sSQL +
                       ' AND    H.'+Regra.sCampoPesquisa+' = '+Regra.FQueryIn.FieldByName('IDPESSJUR').AsString;

              sSQL := sSQL +
                       ' AND    H.MES        < '''+vAnoMesInicio+''''+
                       ' AND    H.MES        >= TO_CHAR(ADD_MONTHS(TO_DATE('+
                                                QuotedStr(vAnoMesInicio)+', ''YYYY/MM''),'+sNumMesesMedia+'), ''YYYY/MM'')  '+
                       ' AND    SUBSTR(H.MES,6,2) <> ''13'' '+
                       ' AND    P.IDPROVENTO = 5787         '+
                       ' AND    H.IDRUBRICA  = P.IDPROVENTO '+
                       ' GROUP BY H.MES                     '+
                       ' ORDER BY H.MES                     ';
               FazQuery(Regra.QueryRegraAux, sSQL);

               First;
               iSomaDias := 0;
               while not Eof do
               begin
                  if (FieldbyName('MES').AsString > sAnoMesRubrica2)
                  then begin
                     sAnoMesRubrica2 := FieldbyName('MES').AsString;
                     iSomaDias       := iSomaDias + FieldByName('NUMDIAS').AsInteger;
                  end;
                  Next;
               end;

               // Se NumDias <= 30 Entao incluir no calculo as duas rubricas 5051
               // Senao, utilizar a ultima incidencia e as rubricas 5227,5226,5286,5053,5052
               if iSomaDias <= 30
               then begin
                  sRubricasAConsiderar := ' ( (  (H.IDRUBRICA = 5051) AND (H.MES  IN ('+sMesesEncontrados+') )  ) OR  '+
                                          '   (  ((H.IDRUBRICA IN ( 5227,5226,5286,5053,5052)) AND (H.MES  >= '''+sMenorAnoMesRubrica1+''') )'+
                                          '    )  '+
                                          '  ) ';
                  if Trim(sRubricasANAOConsiderar) = ''
                  then sRubricasANAOConsiderar := '5051,5227,5226,5286,5053,5052'
                  else sRubricasANAOConsiderar := sRubricasANAOConsiderar +',5051,5227,5226,5286,5053,5052';

               end
               else begin
                  sRubricasAConsiderar := ' ( ( ( (H.IDRUBRICA = 5051) AND (H.MES  = '''+sAnoMesRubrica1+''') ) ) OR '+
                                          '   ( ( (H.IDRUBRICA IN ( 5227,5226,5286,5053,5052)) AND (H.MES  >= '''+sAnoMesRubrica1+''') ) )  '+
                                          ' ) ';
                  if Trim(sRubricasANAOConsiderar) = ''
                  then sRubricasANAOConsiderar := '5051,5227,5226,5286,5053,5052'
                  else sRubricasANAOConsiderar := sRubricasANAOConsiderar +',5051,5227,5226,5286,5053,5052';
               end;
            end
            else begin
               if iContRubrica1 > 0 // só tem 1 rubrica 5051 no periodo de 12 meses
               then begin
                  sRubricasAConsiderar := ' ( ( ( (H.IDRUBRICA = 5051) AND (H.MES  = '''+sAnoMesRubrica1+''') ) ) OR '+
                                          '   ( ( (H.IDRUBRICA IN ( 5227,5226,5286,5053,5052)) AND (H.MES  >= '''+sAnoMesRubrica1+''') ) )  '+
                                          ' ) ';
                  if Trim(sRubricasANAOConsiderar) = ''
                  then sRubricasANAOConsiderar := '5051,5227,5226,5286,5053,5052'
                  else sRubricasANAOConsiderar := sRubricasANAOConsiderar +',5051,5227,5226,5286,5053,5052';
               end;
            end;
         end
         else
         begin
            // -----------------------------------------------------------------
            // Se dentro dos 12 últimos meses de salários-de-participação, existir
            // mais de uma rubrica 21140-Gratif. de Férias, então somar a quantidade
            // de dias do código 23318-Res Quant Dias Férias Mês e se a quantidade
            // de dias for < ou = a 31 dias, deixar no cálculo as duas rubricas 21140
            // e seus códigos de devoluções ou diferenças em suas incidências ou
            // posteriores a elas.
            // Se for > que 31 dias, deixar apenas a última incidência( mais atual)
            // da rubrica e seus códigos de devolução e/ou diferenças dessa incidência
            // ou posteriores a ela.
            // Se dentro dos 12 últimos meses de salários-de-participação,
            // existir apenas uma rubrica 21140-Gratif. de Férias, deixar no cálculo
            // a rubrica 21140 e seus códigos de devoluções ou diferenças
            // em sua incidência ou posterior a ela.
            // Se dentro dos 12 últimos meses de salários-de-participação,
            // não existir a rubrica 21140-Gratif. de Férias, verificar se existe a
            // rubrica  20045 nesse período.
            // Se houver, utilizar os valores da incidência do código mais atual
            // Buscar as ocorrencias da rubrica 21140 nos 12 ultimos meses
            sSQL := ' SELECT DISTINCT H.MES, H.IDRUBRICA  '+
                    ' FROM   HISTRUBSAL H, PROVDESC P '+
                    ' WHERE  H.IDPESSOA   = '+sIdPessoa;

            If sFiltraPatro = 'S' Then
              sSQL := sSQL +
                    ' AND    H.'+Regra.sCampoPesquisa+' = '+Regra.FQueryIn.FieldByName('IDPESSJUR').AsString;

            sSQL := sSQL +
                    ' AND    H.MES        < '''+vAnoMesInicio+''''+
                    ' AND    H.MES        >= TO_CHAR(ADD_MONTHS(TO_DATE('+
                                             QuotedStr(vAnoMesInicio)+', ''YYYY/MM''),'+sNumMesesMedia+'), ''YYYY/MM'')  '+
                    ' AND    SUBSTR(H.MES,6,2) <> ''13''  '+
                    ' AND    P.IDPROVENTO = 21140         '+
                    ' AND    H.IDRUBRICA  = P.IDPROVENTO  '+
                    ' ORDER BY H.MES' ;

            FazQuery(Regra.QueryRegraAux, sSQL);

            sAnoMesRubrica1      := '0000/00';
            sAnoMesRubrica2      := '0000/00';
            sMenorAnoMesRubrica1 := '2999/12';
            sMesesEncontrados    := '';
            iContRubrica1        := 0;
            sRubricasAConsiderar := '';
            sRubricasANAOConsiderar := '';

            if not IsEmpty
            then begin // Pessoa teve uma ou mais rubrica de ferias
               sAnoMesRubrica1      := '0000/00';
               sAnoMesRubrica2      := '0000/00';
               sMesesEncontrados    := '';
               iContRubrica1        := 0;
               sRubricasAConsiderar := '';
               sRubricasANAOConsiderar := '';
               while not Eof do
               begin
                  if (FieldbyName('MES').AsString > sAnoMesRubrica1)
                  then begin
                     sAnoMesRubrica1 := FieldbyName('MES').AsString;
                     inc(iContRubrica1);
                     if Trim(sMesesEncontrados) = ''
                     then sMesesEncontrados := ''''+sAnoMesRubrica1+''''
                     else sMesesEncontrados := sMesesEncontrados + ','''+sAnoMesRubrica1+'''';

                     if sAnoMesRubrica1 < sMenorAnoMesRubrica1
                     then sMenorAnoMesRubrica1 := sAnoMesRubrica1;
                  end;

                  Next;
               end;
            end;

            if iContRubrica1 > 1 // Existe mais de uma rubrica 21140
            then begin           // Entao, somar a qtde de dias da rubrica 23318
              sSQL :=  ' SELECT DISTINCT H.MES, SUM(H.VALORPROVENTO) AS NUMDIAS '+
                       ' FROM   HISTRUBSAL H, PROVDESC P '+
                       ' WHERE  H.IDPESSOA   = '+sIdPessoa;

              If sFiltraPatro = 'S' Then
                sSQL := sSQL +
                       ' AND    H.'+Regra.sCampoPesquisa+'    = '+Regra.FQueryIn.FieldByName('IDPESSJUR').AsString;

              sSQL := sSQL +
                       ' AND    H.MES        < '''+vAnoMesInicio+''''+
                       ' AND    H.MES        >= TO_CHAR(ADD_MONTHS(TO_DATE('+
                                                QuotedStr(vAnoMesInicio)+', ''YYYY/MM''),'+sNumMesesMedia+'), ''YYYY/MM'')  '+
                       ' AND    SUBSTR(H.MES,6,2) <> ''13'' '+
                       ' AND    P.IDPROVENTO = 23318        '+
                       ' AND    H.IDRUBRICA  = P.IDPROVENTO '+
                       ' GROUP BY H.MES                     '+
                       ' ORDER BY H.MES                     ';
              FazQuery(Regra.QueryRegraAux, sSQL);

              First;
              iSomaDias := 0;
              while not Eof do
              begin
                  if (FieldbyName('MES').AsString > sAnoMesRubrica2)
                  then begin
                     sAnoMesRubrica2 := FieldbyName('MES').AsString;
                     iSomaDias       := iSomaDias + FieldByName('NUMDIAS').AsInteger;
                  end;
                  Next;
               end;

               // Se NumDias <= 31 Entao incluir no calculo as duas rubricas 21140
               // Senao, utilizar a ultima incidencia e as rubricas :
               // [21142,21240,21154,21141,21153,21158,21239,21152,21242,21385,
               //  21384,9091,9283,9285,21147]
               if iSomaDias <= 31
               then begin
                  sRubricasAConsiderar := ' ( (  (H.IDRUBRICA = 21140) AND (H.MES  IN ('+sMesesEncontrados+') )  ) OR  '+
                                          '   (  ((H.IDRUBRICA IN (21142,21240,21154,21141,21153,21158,21239,21152,21242,21385,21384,9091,9283,9285,21147)) AND (H.MES  >= '''+sMenorAnoMesRubrica1+''') )'+
                                          '    )  '+
                                          '  ) ';

                  if Trim(sRubricasANAOConsiderar) = ''
                  then sRubricasANAOConsiderar := '21140,21142,21240,21154,21141,21153,21158,21239,21152,21242,21385,21384,9091,9283,9285,21147'
                  else sRubricasANAOConsiderar := sRubricasANAOConsiderar +',21140,21142,21240,21154,21141,21153,21158,21239,21152,21242,21385,21384,9091,9283,9285,21147';

               end
               else begin
                  sRubricasAConsiderar := ' ( ( ( (H.IDRUBRICA = 21140) AND (H.MES  = '''+sAnoMesRubrica1+''') ) ) OR '+
                                          '   ( ( (H.IDRUBRICA IN ( 21142,21240,21154,21141,21153,21158,21239,21152,21242,21385,21384,9091,9283,9285,21147)) AND (H.MES  >= '''+sAnoMesRubrica1+''') ) )  '+
                                          ' ) ';

                  if Trim(sRubricasANAOConsiderar) = ''
                  then sRubricasANAOConsiderar := '21140,21142,21240,21154,21141,21153,21158,21239,21152,21242,21385,21384,9091,9283,9285,21147,21158'
                  else sRubricasANAOConsiderar := sRubricasANAOConsiderar +',21140,21142,21240,21154,21141,21153,21158,21239,21152,21242,21385,21384,9091,9283,9285,21147, 21158';

               end;
            end
            else begin
               if iContRubrica1 > 0 // só tem 1 rubrica 21140 no periodo de 12 meses
               then begin
                  sRubricasAConsiderar := ' ( ( ( (H.IDRUBRICA = 21140) AND (H.MES  = '''+sAnoMesRubrica1+''') ) ) OR '+
                                          '   ( ( (H.IDRUBRICA IN (21142,21240,21154,21141,21153,21158,21239,21152,21242,21385,21384,9091,9283,9285,21147)) AND (H.MES  >= '''+sAnoMesRubrica1+''') ) )  '+
                                          ' ) ';
                  if Trim(sRubricasANAOConsiderar) = ''
                  then sRubricasANAOConsiderar := '21140,21142,21240,21154,21141,21153,21158,21239,21152,21242,21385,21384,9091,9283,9285,21147'
                  else sRubricasANAOConsiderar := sRubricasANAOConsiderar +',21140,21142,21240,21154,21141,21153,21158,21239,21152,21242,21385,21384,9091,9283,9285,21147';

               end
               else begin // nao existe a rubrica 21140. Buscar ultima incidencia da 20045
                  sSQL := ' SELECT DISTINCT H.MES, H.IDRUBRICA  '+
                          ' FROM   HISTRUBSAL H, PROVDESC P '+
                          ' WHERE  H.IDPESSOA   = '+sIdPessoa;
                  If sFiltraPatro = 'S' Then
                     sSQL := sSQL +
                          ' AND    H.'+Regra.sCampoPesquisa+'    = '+Regra.FQueryIn.FieldByName('IDPESSJUR').AsString;
                  sSQL := sSQL +
                          ' AND    H.MES        < '''+vAnoMesInicio+''''+
                          ' AND    H.MES        >= TO_CHAR(ADD_MONTHS(TO_DATE('+
                                                   QuotedStr(vAnoMesInicio)+', ''YYYY/MM''),'+sNumMesesMedia+'), ''YYYY/MM'')  '+
                          ' AND    SUBSTR(H.MES,6,2) <> ''13''  '+
                          ' AND    P.IDPROVENTO = 20045         '+
                          ' AND    H.IDRUBRICA  = P.IDPROVENTO  '+
                          ' ORDER BY H.MES';
                  FazQuery(Regra.QueryRegraAux, sSQL);
                  sAnoMesRubrica1      := '0000/00';
                  sAnoMesRubrica2      := '0000/00';
                  sMenorAnoMesRubrica1 := '2999/12';
                  sMesesEncontrados    := '';
                  iContRubrica1        := 0;
                  sRubricasAConsiderar := '';
                  sRubricasANAOConsiderar := '';

                  if not IsEmpty
                  then begin // Pessoa teve uma ou mais rubrica de ferias
                     sAnoMesRubrica1      := '0000/00';
                     sAnoMesRubrica2      := '0000/00';
                     sMesesEncontrados    := '';
                     iContRubrica1        := 0;
                     sRubricasAConsiderar := '';
                     while not Eof do
                     begin
                        if (FieldbyName('MES').AsString > sAnoMesRubrica1)
                        then begin
                           sAnoMesRubrica1 := FieldbyName('MES').AsString;
                           inc(iContRubrica1);
                           if Trim(sMesesEncontrados) = ''
                           then sMesesEncontrados := ''''+sAnoMesRubrica1+''''
                           else sMesesEncontrados := sMesesEncontrados + ','''+sAnoMesRubrica1+'''';

                           if sAnoMesRubrica1 < sMenorAnoMesRubrica1
                           then sMenorAnoMesRubrica1 := sAnoMesRubrica1;
                        end;

                        Next;
                     end;
                  end;

                  if iContRubrica1 >= 1 // Existe uma ou mais rubrica 20045
                  then begin            // Utilizar ultima incidencia da rubrica 20045
                     sRubricasAConsiderar := ' ( (H.IDRUBRICA = 20045 ) AND (H.MES  = '''+sAnoMesRubrica1+''') )  ';

                     if Trim(sRubricasANAOConsiderar) = ''
                     then sRubricasANAOConsiderar := '20045'
                     else sRubricasANAOConsiderar := sRubricasANAOConsiderar +',20045';
                  end

               end;

            end;
         end;
      end;
      {------------------------------------------------------------------------}

      { Caso pesquisa de rubricas seja retroagindo busca salarios até limite }
      If sRetroage = '1' Then Begin
        sNumMesesPesquisa := '-'+sLimiteRetro;
      End Else Begin
      { Caso contrário pesquisa no numero de meses de média }
        sNumMesesPesquisa := sNumMesesMedia;
      End;

      Close;
      SQL.Clear;

      sSQL := ' SELECT '+ { /*+ INDEX (HISTRUBSAL XIE9HISTRUBSAL) */ }
              '        DECODE(P.IDGRUPORUBRICA, NULL, ''A'', P.IDGRUPORUBRICA) AS IDGRUPORUBRICA, '+
              '               H.IDPESSJUR, H.IDRUBRICA, H.CODPROVDESC, '+
              '        H.VALORPROVENTO,  H.MES '+
              ' FROM   HISTRUBSAL H, PROVDESC P '+
              ' WHERE  H.IDPESSOA   = '+sIdPessoa;

      If sFiltraPatro = 'S' Then
        sSQL := sSQL +
              ' AND    H.'+Regra.sCampoPesquisa+'    = '+Regra.FQueryIn.FieldByName('IDPESSJUR').AsString;

        sSQL := sSQL +
              ' AND    H.MES        < '''+vAnoMesInicio+''''+
              ' AND    H.MES        >= TO_CHAR(ADD_MONTHS(TO_DATE('+
                                       QuotedStr(vAnoMesInicio)+', ''YYYY/MM''),'+sNumMesesPesquisa+'), ''YYYY/MM'')  '+
              ' AND    SUBSTR(H.MES,6,2) <> ''13'' ';

      If (Pos('CRT', UpperCase(Sistema.NomeEmpresa)) > 0) Then Begin
        sSQL := sSQL + ' AND H.IDRUBRICA NOT IN (21737, 22499)';
      End;

      if Trim(sRubricasAConsiderar) = '' then
        sSQL := sSQL +' AND  P.IDGRUPORUBRICA IN ('+vGruposAConsiderar+') '
      else begin
        sSQL := sSQL +' AND  (                                                     '+
                       '        ( (P.IDGRUPORUBRICA IN ('+vGruposAConsiderar+
                                ') AND H.IDRUBRICA NOT IN ('+sRubricasANAOConsiderar+'))) OR '+
                                sRubricasAConsiderar+
                       '       ) ';
      end;

      sSQL := sSQL +' AND  H.IDRUBRICA = P.IDPROVENTO ';

      If (Pos('CRT', UpperCase(Sistema.NomeEmpresa)) > 0) Then Begin
        sSQL := sSQL +
                ' UNION ALL SELECT '+ { /*+ INDEX (HISTRUBSAL XIE9HISTRUBSAL) */ }
                '        DECODE(P.IDGRUPORUBRICA, NULL, ''A'', P.IDGRUPORUBRICA) AS IDGRUPORUBRICA, '+
                '               H.IDPESSJUR, H.IDRUBRICA, H.CODPROVDESC, '+
                '        GREATEST(SUM(DECODE(H.VALORPROVENTO,2000, H.VALORPROVENTO, -H.VALORPROVENTO)),0) AS VALORPROVENTO,  H.MES '+
                ' FROM   HISTRUBSAL H, PROVDESC P '+
                ' WHERE  H.IDPESSOA   = '+sIdPessoa;
        If sFiltraPatro = 'S' Then
          sSQL := sSQL +
                ' AND    H.'+Regra.sCampoPesquisa+'    = '+Regra.FQueryIn.FieldByName('IDPESSJUR').AsString;

        sSQL := sSQL +
                ' AND    H.MES        < '''+vAnoMesInicio+''''+
                ' AND    H.MES        >= TO_CHAR(ADD_MONTHS(TO_DATE('+
                                         QuotedStr(vAnoMesInicio)+', ''YYYY/MM''),'+sNumMesesPesquisa+'), ''YYYY/MM'')  '+
                ' AND    SUBSTR(H.MES,6,2) <> ''13'' ';
        sSQL := sSQL +' AND H.IDRUBRICA IN (21737, 22499)';
        sSQL := sSQL +' AND  H.IDRUBRICA = P.IDPROVENTO '+
                      ' GROUP BY  '+
                      '   DECODE(P.IDGRUPORUBRICA, NULL, ''A'', P.IDGRUPORUBRICA), '+
                      '          H.IDPESSJUR, H.IDRUBRICA, H.CODPROVDESC, H.MES'+
                      ' ORDER BY MES DESC, VALORPROVENTO ';
      End Else Begin
        sSQL := sSQL +' ORDER BY H.MES DESC, H.VALORPROVENTO' ;
      End;

      SQL.Add(sSQL);
      Open;

      { Caso não encontre Salarios retorna 0 }
      If IsEmpty then begin
        dTotalSalarioIndexado := 0;
        dFrequencia           := 0;
        Close;
        Exit;
      End Else Begin
        W :=1;
        wNumRubProc := 0;
        sProxMesAnoBuscar := FieldByName('MES').AsString;
        sGrupoSRBAtual    := FieldByName('IDGRUPORUBRICA').AsString;

        { Varre todos os Salarios encontrados buscando os Indices de Reajuste }
        { e reajustando                                                       }
        While Not EOF Do Begin
          { Caso Retroagindo pula salários zerados }
          If sRetroage = '1' Then Begin
            If FieldByName('VALORPROVENTO').AsFloat = 0 Then Begin
              Next;
              { Continua Rotina }
              If (sProxMesAnoBuscar <> FieldByName('MES').AsString) Then Begin
                sProxMesAnoBuscar  := FieldByName('MES').AsString;
                sGrupoSRBAtual     := FieldByName('IDGRUPORUBRICA').AsString;

              End;
              Continue;
            End;
          End;

          { Soma salarios do mesmo mês }
          aTabSal[W].SalarioSemTeto := aTabSal[W].SalarioSemTeto + FieldByName('VALORPROVENTO').AsFloat;
          aTabSal[W].Salario        := (aTabSal[W].Salario       + FieldByName('VALORPROVENTO').AsFloat);

          { Monta proximo mes a pesquisar }
          sAnoMesIni := Copy(FieldByName('MES').AsString,1,4)+
                        Copy(FieldByName('MES').AsString,6,2);
          { Guarda Dados Processada }
          sIdRubrica := FieldByName('IDRUBRICA').AsString;
          sGrupoSRB  := FieldByName('IDGRUPORUBRICA').AsString;
          { Pessoa processada }
          sIdPessJur   := Regra.FQueryIn.FieldByName('IDPESSJUR').AsString;
          sIdTitular   := Regra.FQueryIn.FieldByName('IDTITULAR').AsString;
          sSeqProposta := Regra.FQueryIn.FieldByName('SEQPROPOSTA').AsString;
          sIdPlanoPrev := Regra.FQueryIn.FieldByName('IDPLANOPREV').AsString;

          { Proximo registro }
          Next;

          {-------------------------------------------------------------------- }
          { Caso tenha mudado o Mes da Rubrica ou seja final do Arquivo         }
          { executa indexação                                                   }
          If (sProxMesAnoBuscar <> FieldByName('MES').AsString) Or
             (sGrupoSRBAtual    <> FieldByName('IDGRUPORUBRICA').AsString) Or
             (EOF) Then Begin

            aTabSal[W].MesRef := sProxMesAnoBuscar;

            { Busca o Indice de Teto caso utilize }
            If Trim(sNomeIndiceTeto) <> '' Then Begin
              sSQL := 'SELECT '+
                      '  1 AS REGRA, M.MOECODIGO, C.COTVALOR, C.COTMESREF AS MES '+
                      'FROM   '+
                      '  MOEDA M, COTACAOMOEDA C  '+
                      'WHERE  '+
                      '  M.MOESIGLA  = '''+sNomeIndiceTeto+''' AND '+
                      '  M.MOECODIGO = C.MOECODIGO             AND '+
                      '  SUBSTR(C.COTMESREF,3,4)||''/''||SUBSTR(C.COTMESREF,1,2) <= '+
                      QuotedStr(Copy(sAnoMesIni,1,4)+'/'+Copy(sAnoMesIni,5,2)) +' '+
                      'ORDER BY SUBSTR(C.COTMESREF,3,4)||''/''||SUBSTR(C.COTMESREF,1,2) DESC ';
              { Guarda Teto caso encontre algum }
              If FazQuery(Regra.QueryRegra, sSQL) Then Begin
                dValorTeto    := Regra.QueryRegra.FieldByName('COTVALOR').AsFloat;
                sIdIndiceTeto := Regra.QueryRegra.FieldByName('MOECODIGO').AsString;
              End Else
                dValorTeto := 0;

              { Se a soma das Rubricas for menor que o Teto, utiliza para calculo, }
              { senão utiliza o valor do Teto                                      }
              If aTabSal[W].SalarioSemTeto > dValorTeto Then Begin
                aTabSal[W].Salario := dValorTeto;
              End;
            End;

            { Pega o Indice relativo ao Grupo }
            For I:=1 to 20 Do Begin
              If aTabGrp[I].Grupo = '' Then Break;
              If Trim(aTabGrp[I].Grupo) = Trim(sGrupoSRB) Then
                sNomeIndice := aTabGrp[I].Indice;
            End;

            if cTipoIndice = '1'
            then begin
               // Busca Indices a Reajustar da tabela COTACAOMOEDA
               Regra.QueryRegra.Close;
               Regra.QueryRegra.Sql.Clear;
               Regra.QueryRegra.Sql.Add('SELECT 1 AS REGRA, M.MOECODIGO, C.COTMESREF AS MES, '+
                                        'COTVALOR, '+
                                        '       TO_DATE(COTMESREF,''MMYYYY'') AS ANOMES '+
                                        'FROM   MOEDA M, COTACAOMOEDA C  '+
                                        'WHERE  '+
                                        '  M.MOESIGLA  = '''+sNomeIndice+''' AND '+
                                        '  M.MOECODIGO = C.MOECODIGO         AND '+
                                        '  SUBSTR(C.COTMESREF,3,4)||SUBSTR(C.COTMESREF,1,2) >= '+ QuotedStr(Copy(sProxMesAnoBuscar,1,4)+Copy(sProxMesAnoBuscar,6,2))  + ' AND '+
                                        '  SUBSTR(C.COTMESREF,3,4)||SUBSTR(C.COTMESREF,1,2) < '+ QuotedStr(AnoMesAnterior(sAnoMesFim))+ '     ');
               Regra.QueryRegra.Sql.Add('  ORDER BY TO_DATE(COTMESREF,''MMYYYY'') ');
               Regra.QueryRegra.Open;

               { Acumular indice }
               Regra.QueryRegra.First;
               dVlrIndiceAcumulado := 1;
               sIdIndiceReaj := Regra.QueryRegra.FieldByName('MOECODIGO').AsString;
               While Not Regra.QueryRegra.EOF Do Begin
                 if (StrToInt(Copy(sProxMesAnoBuscar,1,4) + Copy(sProxMesAnoBuscar,6,2) ) ) =
                    (StrToInt(AnoMesAnterior(sAnoMesFim)))
                 then
                   dVlrIndiceAcumulado := 1
                 else begin
                    dVlrIndice := ( (Regra.QueryRegra.FieldByName('COTVALOR').AsFloat/100)+1 );
                    dVlrIndiceAcumulado := dVlrIndiceAcumulado * dVlrIndice;
                 end;
                 Regra.QueryRegra.Next;
               End; { While Not QryRegra.EOF }
            end
            else begin // tipo de indice = 2, reajsalpatro
               dVlrIndiceAcumulado := BuscaIndiceReajSalPatro( sProxMesAnoBuscar );
            end;

            aTabSal[W].SalarioIndexado := aTabSal[W].Salario * dVlrIndiceAcumulado;

            dTotalSalarioIndexado := (dTotalSalarioIndexado + aTabSal[W].SalarioIndexado);

            { Caso não encontre indices soma sem reajustar }
            If (Regra.QueryRegra.IsEmpty) and (cTipoIndice = '1') Then Begin
              dVlrIndice := 1;
              aTabSal[W].SalarioIndexado := ( aTabSal[W].Salario * dVlrIndice )  ;
              { Acumula Salarios }
              dTotalSalarioIndexado := (dTotalSalarioIndexado + aTabSal[W].SalarioIndexado);
            End;

            {------------------------------------------------------}
            { Grava na memoria de calculo caso desejado na Formula }
            If (FlgGrava = '1') And (Regra.FlgGravaCalculo = True) Then Begin
              { Gera novo Identificador }
              If Regra.FidCalculo = 0 Then Begin
                if (Trim(sIdBeneficio) <> 'NULL') and ((Trim(sIdBeneficio) = '') or
                   (StrToInt(sIdBeneficio) <= 0)) then sIdBeneficio := 'NULL';
                Regra.FIdCalculo := LeUltRegistro(Nil, 'CALCULO');
                Regra.QueryRegra.Close;
                Regra.QueryRegra.SQL.Clear;
                Regra.QueryRegra.SQL.Add(
                             'INSERT INTO CALCULO (IDCALCULO, IDPESSJUR,'+
                             ' IDTITULAR, IDPLANOPREV, IDPESSOA, IDBENEFICIO, SEQPROPOSTA, '+
                             ' IDREGRA, DATACALCULO, DATAREF, INDICETETO, INDICEREAJ ) '+
                             'VALUES '+
                             '('+
                              FloatToStr(Regra.FidCalculo)      +','+
                              sIdPessJur                        +','+
                              sIdTitular                        +','+
                              sIdPlanoPrev                      +','+
                              sIdPessoa                         +','+
                              sIdBeneficio                      +','+
                              sSeqProposta                      +','+
                              IntToStr(Regra.IRegraMaster)      +','+
                              'TO_CHAR(SYSDATE, ''DD/MM/YYYY'')'+','+
                              'TO_DATE('+QuotedStr(sDataRef)+', ''DD/MM/YYYY'')'+','+
                              QuotedStr(sIdIndiceTeto)          +','+
                              QuotedStr(sIdIndiceReaj)          +')');
                Regra.QueryRegra.ExecSQL;
              End;
              { Caso tenha salario, grava no Historico }
              If (aTabSal[W].Salario <> 0)
              Then Begin
                if dVlrIndiceAcumulado <= 0 then dVlrIndiceAcumulado := 1;
                Regra.QueryRegra.close;
                Regra.QueryRegra.SQL.clear;
                if (sUltAnoMesGravado  <> Copy(sAnoMesIni,1,4)+'/'+Copy(sAnoMesIni,5,2) )
                then Regra.QueryRegra.SQL.Add(
                                   'INSERT INTO DETCALCULO (IDCALCULO, IDDETCALCULO, DESCRICAO, '+
                                   ' VLRCALCULO, VLRINDICE, VLRRUBRICA, VLRTETO, VLRCORRIGIDO, '+
                                   ' ANOMESREF, IDREGRA, TIPOCALCULO )'+
                                   'VALUES '+
                                   '('+
                                    FloatToStr(Regra.FidCalculo)                           +','+
                                    ' SEQDETCALCULO.NEXTVAL, '+
                                    QuotedStr('RUBRICA TIPO '+sGrupoSRB)                   +','+
                                    Regra.OraNumero(FloatToStr(aTabSal[w].SalarioSemTeto)) +','+
                                    Regra.OraNumero(FloatToStr(dVlrIndiceAcumulado))       +','+
                                    Regra.OraNumero(FloatToStr(aTabSal[W].Salario))        +','+
                                    Regra.OraNumero(FloatToStr(dValorTeto))                +','+
                                    Regra.OraNumero(FloatToStr(aTabSal[W].SalarioIndexado)) +','+
                                    ''''+Copy(sAnoMesIni,1,4)+'/'+Copy(sAnoMesIni,5,2)     +''','+
                                    IntToStr(Regra.IRegraMaster)                           +','+
                                    QuotedStr('SUM')                                       +')')
                else Regra.QueryRegra.SQL.Add(
                                   ' UPDATE DETCALCULO SET VLRCALCULO   = '+Regra.OraNumero(FloatToStr(aTabSal[w].SalarioSemTeto)) +','+
                                   '                       VLRRUBRICA   = '+Regra.OraNumero(FloatToStr(aTabSal[W].Salario))        +','+
                                   '                       VLRCORRIGIDO = '+Regra.OraNumero(FloatToStr(aTabSal[W].SalarioIndexado))+
                                   ' WHERE IDCALCULO   = '+FloatToStr(Regra.FidCalculo)+
                                   ' AND   ANOMESREF   = '''+Copy(sAnoMesIni,1,4)+'/'+Copy(sAnoMesIni,5,2)+''''+
                                   ' AND   TIPOCALCULO = ''SUM'' ');
                Regra.QueryRegra.ExecSQL;
                sUltAnoMesGravado := Copy(sAnoMesIni,1,4)+'/'+Copy(sAnoMesIni,5,2);
              End; { If (aTabSal[I].Salario }

            End; { If FlgGrava = '1' }


            { Continua Rotina }
            If (sProxMesAnoBuscar <> Regra.QueryRegraAux.FieldByName('MES').AsString) Then Begin
              Inc(W); { Proximo Indice caso troque o mês }
              Inc(wNumRubProc); { mais um mês processado }
            End;

            sProxMesAnoBuscar  := FieldByName('MES').AsString;
            sGrupoSRBAtual     := FieldByName('IDGRUPORUBRICA').AsString;

          End;
          dFrequencia := (dFrequencia + 1);

          { Caso Retroaginto testa se Passou do Limite, passando sai fora do loop }
          If sRetroage = '1' Then Begin
            If wNumRubProc >= Abs(StrToInt(sNumMesesMedia)) Then Begin
              Break;
            End;
          End;

        End; { While Not EOF }
        {----------------------------------------------------------------------}

        dTotalSalarioIndexado := 0;
        for i := 1 to 700 do begin
            dTotalSalarioIndexado := (dTotalSalarioIndexado + aTabSal[I].SalarioIndexado);
        end;

        Result := FloatToStr(dTotalSalarioIndexado);

      End; { Else IsEmpty }

      Close;
    End; { With }

  {---------------------------------------------------------------------------}
  End Else Begin { If TemIndice }

    { Monta consulta e busca salarios }
    With Regra.QueryRegraAux do begin
       Close;
       SQL.Clear;
       sSQL := 'SELECT '+ { /*+ INDEX (HISTRUBSAL XIE9HISTRUBSAL) */ }
               '  SUM(DECODE(P.FLGDESCONTO,0,H.VALORPROVENTO,2,H.VALORPROVENTO,0,0)+'+
               '      DECODE(P.FLGDESCONTO,1,(H.VALORPROVENTO*-1),0)) AS SOMA,  '+
               '  COUNT(DISTINCT H.IDPESSOA) AS FREQUENCIA '+
               'FROM   HISTRUBSAL H, PROVDESC P '+
               'WHERE H.IDPESSOA  = '+sIdPessoa;
       If sFiltraPatro = 'S' Then
         sSQL := sSQL +
               ' AND  '+Regra.sCampoPesquisa+' = '+Regra.fQueryin.FieldByName('IDPESSJUR').AsString;
         sSQL := sSQL +
               ' AND  H.MES      >= '''+vAnoMesInicio+''''+
               ' AND  H.MES      <= '''+vAnoMesInicio+''''+
               ' AND  P.IDGRUPORUBRICA   IN ('+vGruposAConsiderar+')'+
               ' AND H.IDRUBRICA = P.IDPROVENTO ';

       SQL.Add( sSQL );
       Open;

       if not IsEmpty then begin
         dTotalSalarioIndexado  := FieldByName('SOMA').AsFloat;
         dFrequencia := FieldByName('FREQUENCIA').AsFloat;
         Result      := FieldByName('SOMA').AsString;
       end else begin
         dTotalSalarioIndexado  := 0;
         dFrequencia            := 0;
       end;
       Close;
    End;

  End; { If TemIndice }

  {----------------------------------------------------------------------------}
  { Gera Query com as diferencas dos ultimos 60 meses para o Teto. Esta Query  }
  { será usada na Formula MEDIARUBRICA, não alterar o componente QryRegra      }
  Regra.QueryRegra.Close;
  Regra.QueryRegra.SQL.Clear;
        sSQL := 'SELECT '+ { /*+ INDEX (HISTRUBSAL XIE9HISTRUBSAL) */ }
                '  H.IDRUBRICA, H.MES, H.VALORPROVENTO  '+
                'FROM   HISTRUBSAL H, PROVDESC P '+
                'WHERE H.IDPESSOA  = '+sIdPessoa;
        If sFiltraPatro = 'S' Then
          sSQL := sSQL +
                '  AND  H.'+Regra.sCampoPesquisa+'   = '+Regra.FQueryIn.FieldByName('IDPESSJUR').AsString;
        sSQL := sSQL +
                '  AND  H.MES       <= '''+vAnoMesInicio+''''+
                '  AND  H.MES >= TO_CHAR(ADD_MONTHS(TO_DATE('+
                QuotedStr(vAnoMesInicio)+', ''YYYY/MM''),-60), ''YYYY/MM'')  '+
                '  AND  P.IDGRUPORUBRICA IN ('+vGruposAConsiderar+') '+
                '  AND  H.IDRUBRICA = P.IDPROVENTO '+
                'ORDER BY H.MES ' ;
  Regra.QueryRegra.SQL.Add( sSQL );

  Regra.QueryRegra.Open;

  { }
  sAnoMesRubrica := '';
  While Not Regra.QueryRegra.Eof Do Begin
    { Muda o mes das Rubricas }
    sUtilizado := '';
    If sAnoMesRubrica <> Regra.QueryRegra.FieldByName('MES').AsString Then Begin
      sAnoMesRubrica := Regra.QueryRegra.FieldByName('MES').AsString;
      sUtilizado     := 'S';
    End;
    { Busca o Indice de Teto caso utilize }
    If Trim(sNomeIndiceTeto) <> '' Then Begin
      sSQL := 'SELECT '+
              '  1 AS REGRA, C.COTVALOR, C.COTMESREF AS MES '+
              'FROM   '+
              '  MOEDA M, COTACAOMOEDA C  '+
              'WHERE  '+
              '  M.MOESIGLA  = '''+sNomeIndiceTeto+''' AND '+
              '  M.MOECODIGO = C.MOECODIGO             AND '+
              '  SUBSTR(C.COTMESREF,3,4)||''/''||SUBSTR(C.COTMESREF,1,2) <= '+
              QuotedStr(Regra.QueryRegra.FieldByName('MES').AsString) +' '+
              'ORDER BY SUBSTR(C.COTMESREF,3,4)||''/''||SUBSTR(C.COTMESREF,1,2) DESC ';
      { Guarda Teto caso encontre algum }
      If FazQuery(Regra.QueryRegraAux, sSQL) Then
        dValorTeto := Regra.QueryRegraAux.FieldByName('COTVALOR').AsFloat
      Else
        dValorTeto := 0;
    End;

      { Grava na memoria de calculo caso desejado na Formula }
      If (FlgGrava = '1') And (Regra.FlgGravaCalculo = True) Then Begin
        Regra.QueryRegraAux.close;
        Regra.QueryRegraAux.SQL.clear;
        Regra.QueryRegraAux.SQL.Add(
                         'INSERT INTO DETCALCULO (IDCALCULO, IDDETCALCULO, DESCRICAO, IDRUBRICA, '+
                         ' VLRINDICE, VLRRUBRICA, VLRCALCULO, VLRTETO, ANOMESREF, '+
                         ' IDREGRA, FLGUTILIZADO, TIPOCALCULO )'+
                         'VALUES '+
                         '('+
                          FloatToStr(Regra.FidCalculo) +','+
                          ' SEQDETCALCULO.NEXTVAL, '+
                          QuotedStr('RUBRICAS DA PARCELA A RETROAGIDAS')  +','+
                          Regra.OraNumero(FloatToStr(Regra.QueryRegra.FieldByName('IDRUBRICA').AsFloat)) +','+
                          FloatToStr(0)                +','+
                          Regra.OraNumero(FloatToStr(Regra.QueryRegra.FieldByName('VALORPROVENTO').AsFloat)) +','+
                          Regra.OraNumero(FloatToStr(Regra.QueryRegra.FieldByName('VALORPROVENTO').AsFloat)) +','+
                          FloatToStr(dValorTeto)       +','''+
                          Regra.QueryRegra.FieldByName('MES').AsString+''','+
                          IntToStr(Regra.IRegraMaster) +','+
                          QuotedStr(sUtilizado)        +','+  { Indica que esta linha é utilizada para descontar os calculos feitos pela MEDIARUBRICA }
                          QuotedStr('RA1')             +')'); { Retroagido }
        Regra.QueryRegraAux.ExecSQL;
      End; { If (FlgGrava = ' }

    Regra.QueryRegra.Next
  End;
  Regra.QueryRegra.Close;

End; { SOMARUBRICA() }

{******************************************************************************}
{ Formula, PARCANTEP                                                           }
{   Retorna o Valor da ultima parcela de emprestimo imediatamente anetrior a   }
{  parcela de referencia.                                                      }
{------------------------------------------------------------------------------}
Function PARCANTEP(Regra : TRegra; Formula : String) : String;
Var
  sParcRef, sSQL, sIdContrato, FormulaAux : String;
  I : Integer;
Begin
  {----------------------------------------------------------------------------}
  { Fórmula não possui parametros, todos localizados na query de entrada.      }
  {----------------------------------------------------------------------------}

  { Critica campos obrigatorios }
  If Regra.FQueryIn.FindField('IDCONTRATOEMPTMO') = NIL Then Begin
    MsgDlg('Campo IDCONTRATOEMPTMO, necessário no Sql de entrada! ',
           'Regra - Erro',mtError,[mbOk],0);
    Regra.fError := True;
    Exit;
  End;

  If Regra.FQueryIn.FindField('PARCATUAL') = NIL Then Begin
    MsgDlg('Campo PARCATUAL, necessário no Sql de entrada! ',
           'Regra - Erro',mtError,[mbOk],0);
    Regra.fError := True;
    Exit;
  End;

  { Guarda os dados necessarios para consulta }
  sIdContrato := Regra.FQueryIn.FieldByName('IDCONTRATOEMPTMO').AsString;
  sParcRef    := IntToStr(Regra.FQueryIn.FieldByName('PARCATUAL').AsInteger-1);

  { Monta SQL de consulta }
  sSQL := 'SELECT IDHISTMOVEMPTMO, IDCONTRATOEMPTMO, HMEPARCELA, HMEVLRPREVISTO '+
          'FROM HISTMOVEMPTMO '+
          'WHERE (IDCONTRATOEMPTMO = '+sIdContrato+') AND '+
          '      (HMEPARCELA       = '+sParcRef   +') AND '+
          '      (HMETIPOMOV       = 1)  AND '+
          '      (HMESEQCOBRANCA   = 1)  AND '+
          '      (HMECENTRALIZA    = 1)  AND '+
          '      (NVL(FLGESTORNADO,0) = 0)   ';
  { Caso Encontre dados, retorna o valor da parcela, caso contrario retorna }
  If FazQuery(Regra.QueryRegraAux,sSQL) Then Begin
    Result := Regra.QueryRegraAux.FieldByName('HMEVLRPREVISTO').AsString;
  End Else Begin
    Result := '0';
  End;
End; { PARCANTEP() }

{******************************************************************************}
{ Formula, MEDIARUBRICA                                                        }
{ Retornar a soma de rubricas, que pertençam a um mesmo grupo, e  que atendam  }
{ a uma determinada condição, e a frequência com que esta condição é atendida, }
{ em um determinado mês.                                                       }
Function MEDIARUBRICA(Regra: TRegra; Formula : String) : String;
Type
  TRecRubricaProc = Record
                      IdRubrica   : Integer;
                      Valor       : Currency;
                      FlgProcessa : Boolean;
                      NomeIndice  : String;
                    End;
  TRecGrupoIndice = Record
                      Grupo,
                      Indice : String;
                    End;
Var
  aTabProc : Array [1..30]  Of TRecRubricaProc;
  aTabGrp  : Array [1..30]  Of TRecGrupoIndice;

  sNomeIndice, sAnoMesIni, sAnoMesFim, sAnoMesAtual, FlgGrava, sIdPessoa,
  sIdPessJur, sIdTitular,  sSeqProposta, sIdPlanoPrev,
  sProxMesBuscar, sProxAnoBuscar, sProxMesAnoBuscar,
  sNumMesesPesquisa, sNumMesesMedia, sDataInicio, sNomeIndiceTeto,
  sDataIndiceTeto : String;

  vFormulaAux, vGruposAConsiderar, vAnoMesInicio, sIdRubrica,
  vAnoMesFinal, vOpCondicao, vValorCondicao, sSQL, sDataRef,
  Letra, Palavra, sGrupoSRB : String;

  I, W, wTotRubr : Word;

  dVlrUltIndice, dFrequencia, dTotalSalarioIndexado, dVlrIndice,
  dValorTeto, dVlrDiferenca, dVlrMaiorSRB :  Double;

  bPulaMes, FlgGrupo, FlgIndice, FlgTemIndice, FlgFimProcesso :Boolean;

  iIdMaiorSRB, SeqProcesso : Integer;

  cTipoIndice : string;
Begin
  Result   := 'False';
  FlgGrava := '1';
  FlgTemIndice := True;

  {----------------------------------------------------------------------------}
  { Decodifica a Formula                                                       }

  { Retira Parenteses () }
  vFormulaAux := Copy(Formula, 14,Length(Formula));
  vFormulaAux := Copy(vFormulaAux,1,Length(vFormulaAux)-1);

  { Guarda grupos de rubricas e indices a Considerar }
  I := Pos('[',vFormulaAux);{ Tira [ }
  vFormulaAux := Copy(vFormulaAux, I + 1, Length(vFormulaAux));
  I := Pos(']',vFormulaAux);
  vGruposAConsiderar := Copy(vFormulaAux, 1, I);
  FlgGrupo  := True;
  FlgIndice := False;
  I:=1;
  Repeat
    If Pos(Letra,',') <> 0 Then Begin

      If Palavra <> '' Then Begin

        If FlgGrupo Then Begin
          aTabGrp[I].Grupo := Regra.PegaValor(Palavra);
          FlgGrupo := False;
        End Else Begin
          aTabGrp[I].Indice:= Regra.PegaValor(Palavra);
          FlgGrupo  := True;
          FlgIndice := True;
          FlgTemIndice := True;
        End;
        Palavra := '';
      End; { If Palavra <> '' }

      If FlgIndice Then Begin
        Inc(I);
        FlgIndice := False;
      End;

      Letra := '';
    End;

    Palavra := Palavra+Letra;
    Letra   := Copy(vGruposAConsiderar,1,1);
    vGruposAConsiderar := Copy(vGruposAConsiderar,2,Length(vGruposAConsiderar)-1);

  Until Letra = ']';

  { Como Ultima Data de Parametro não tem virgula Apos, Guarda ela Aqui Fora. }
  aTabGrp[I].Indice:= Regra.PegaValor(Palavra);

  { Monta string de grupos de rubricas a pesquisar }
  vGruposAConsiderar :='';
  For W:=1 to 30 Do Begin
    If aTabGrp[W].Grupo = '' Then Break;
    vGruposAConsiderar := vGruposAConsiderar + QuotedStr(aTabGrp[W].Grupo) + ',';
  End;
  vGruposAConsiderar := Copy(vGruposAConsiderar,1,Length(vGruposAConsiderar)-1);
  { Continua a decodificar a Formula }
  I := Pos(']',vFormulaAux);
  vFormulaAux := Copy(vFormulaAux, I + 1,Length(vFormulaAux));
  I := Pos(',',vFormulaAux);
  vFormulaAux := Copy(vFormulaAux, I + 1,Length(vFormulaAux));

  { Guarda Data de Inicio  }
  I := Pos(',',vFormulaAux);
  sDataInicio := Copy(vFormulaAux,1,I-1);
  sDataInicio := Regra.PegaValor(sDataInicio);
  sDataRef    := sDataInicio;
  { Gera datas controle }
  vAnoMesInicio := Copy(sDataInicio,7,4)+'/'+Copy(sDataInicio,4,2);
  sAnoMesFim    := Copy(sDataInicio,7,4)+Copy(sDataInicio,4,2);

  { Guarda numero de meses para pesquisa }
  I := Pos(',',vFormulaAux);
  vFormulaAux := Copy(vFormulaAux, I+1,Length(vFormulaAux));
  W := Pos(',',vFormulaAux);
  sNumMesesPesquisa := Copy(vFormulaAux,1,(W-1));
  If Copy(sNumMesesPesquisa,1,1) = '@' Then
    sNumMesesPesquisa := Regra.PegaValor(sNumMesesPesquisa);
  sNumMesesPesquisa := '-'+sNumMesesPesquisa;

  { Guarda numero de meses para Media }
  I := Pos(',',vFormulaAux);
  vFormulaAux := Copy(vFormulaAux, I+1,Length(vFormulaAux));

  If I <= 0 Then I := (Length(vFormulaAux)+1);
  sNumMesesMedia := Copy(vFormulaAux,1,I-1);
  If Copy(sNumMesesMedia,1,1) = '@' Then
    sNumMesesMedia := Regra.PegaValor(sNumMesesMedia);
  sNumMesesMedia := '-'+sNumMesesMedia;

  { Flag de Gravação }
  vFormulaAux := Copy(vFormulaAux, I + 1, Length(vFormulaAux));
  I := Pos(',',vFormulaAux);

  If I <= 0 Then begin
    FlgGrava := Copy(vFormulaAux, 1, Length(vFormulaAux));
    I := Length(vFormulaAux);
  End Else
    FlgGrava := Copy(vFormulaAux, 1, I-1);
  FlgGrava := Regra.PegaValor(FlgGrava);

  { Tratamento de Teto }
  sNomeIndiceTeto := '';
  sDataIndiceTeto := '';
  dValorTeto      :=0;
  { Caso tenha Teto guarda }
  vFormulaAux := Copy(vFormulaAux, I + 1, Length(vFormulaAux));
  I := Pos(',',vFormulaAux);
  If I <= 0 Then I := Length(vFormulaAux) Else I := (I - 1);
  sNomeIndiceTeto := Copy(vFormulaAux,1, I);
  sNomeIndiceTeto := Regra.PegaValor(sNomeIndiceTeto);

  { Guardar Tipo de Calculo }
  vFormulaAux := Copy(vFormulaAux, I + 2, Length(vFormulaAux));
  I := Pos(',',vFormulaAux);
  If I <= 0 Then I := Length(vFormulaAux) Else I := (I - 1);
  cTipoIndice := Copy(vFormulaAux,1, I);
  cTipoIndice := Regra.PegaValor(cTipoIndice);
  if cTipoIndice = '' then cTipoIndice := '1';

  { Fim da Decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Testa campos obrigatorios na Query de Entrada }
  If Regra.FQueryIn.FindField('IDPESSOA') = NIL Then Begin
    MsgDlg('Campo IDPESSOA Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk],0);
    Regra.FError := True;
    SairDaRegra := True;
    Exit;
  End Else If Regra.FQueryIn.FindField('IDPESSJUR') = NIL Then Begin
    MsgDlg('Campo IDPESSJUR Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk],0);
    Regra.FError := True;
    SairDaRegra := True;
    Exit;
  End;

  { Caso esteja executando com tabela auxiliar  busca dados nela }
  If Regra.TemQuery Then Begin
    sIdPessoa := Regra.QryOutraRegra.FieldByName('IDPESSOA').AsString;
  End Else Begin
    sIdPessoa := Regra.fQueryIn.FieldByName('IDPESSOA').AsString;
  End;

  {-----------------------------------------------------------------}
  If FlgTemIndice = True Then Begin

    For W:=1 to 60 Do Begin
      aTabIndice2[W].AnoMes            := '';
      aTabIndice2[W].Reajuste          := 0;
      aTabIndice2[W].Indice            := 0;
      aTabIndice2[W].IndiceProRata     := 0;
      aTabIndice2[W].IndiceAcumulado   := 0;
      aTabIndice2[W].Teto              := 0;
      aTabIndice2[W].Salario           := 0;
      aTabIndice2[W].SalarioReajustado := 0;
    End;

    if cTipoIndice = '2'
    then begin
           CarregaTabIndice2( Regra,
                              Regra.FQueryIn.FieldByName('IDPESSJUR').AsString,
                              Regra.FQueryIn.FieldByName('IDPESSOA').AsString,
                              '',
                              vGruposAConsiderar,
                              sDataInicio,
                              sNumMesesMedia);
    end;

    With Regra.QueryRegraAux Do Begin

      { Busca salarios e Indexa }
      {-------------------------}

      { Monta consulta para pesquisar a existencia de rubrica no periodo, caso }
      { encontre processa as rubricas.                                         }
      Close;
      SQL.Clear;
      SQL.Add('SELECT '+ { /*+ INDEX (HISTRUBSAL XIE9HISTRUBSAL) */ }
              '  H.VALORPROVENTO , H.IDPESSOA, H.MES  '+
              'FROM   HISTRUBSAL H, PROVDESC P '+
              'WHERE H.IDPESSOA = '+sIdPessoa+
              '  AND  H.MES     < '''+vAnoMesInicio+''''+
              '  AND  H.MES >= TO_CHAR(ADD_MONTHS(TO_DATE('+
              QuotedStr(vAnoMesInicio)+', ''YYYY/MM''),'+sNumMesesPesquisa+'), ''YYYY/MM'')  '+
              '  AND  SUBSTR(H.MES,6,2) <> ''13'' '+
              '  AND  P.IDGRUPORUBRICA IN ('+vGruposAConsiderar+') '+
              '  AND  H.IDRUBRICA = P.IDPROVENTO '+
              'ORDER BY H.MES' );
      Open;

      { Caso não encontre a Rubrica retorna 0 }
      If IsEmpty Then Begin
        dTotalSalarioIndexado := 0;
        dFrequencia           := 0;
        Exit;
      End Else Begin
        {----------------------------------------------------------------------}
        { Busca Rubricas a processar (parcela escolhida que estão no Histórico)}
        With Regra.QueryRegraAux Do Begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT DISTINCT R.IDGRUPORUBRICA, R.IDPROVENTO, R.CODPROVDESC '+
                  'FROM PROVDESC R, HISTRUBSAL H '+
                  'WHERE H.IDPESSOA = '+sIdPessoa+' AND  '+
                  '      H.MES < '''+vAnoMesInicio+''' AND '+
                  '      H.MES >= TO_CHAR(ADD_MONTHS(TO_DATE('+
                  QuotedStr(vAnoMesInicio)+', ''YYYY/MM''),'+sNumMesesPesquisa+'), ''YYYY/MM'') AND  '+
                  '      R.IDGRUPORUBRICA IN ('+vGruposAConsiderar+') AND '+
                  '      R.IDPROVENTO = H.IDRUBRICA '+
                  'ORDER BY R.CODPROVDESC ' );
          Open;
          { Caso não encontre a Rubrica retorna 0 }
          If IsEmpty Then Begin
            dTotalSalarioIndexado := 0;
            dFrequencia           := 0;
            Exit;
          End;
          { Guarda Rubricas que serão processadas }
          wTotRubr := 0;
          While Not Eof Do Begin
            Inc(wTotRubr);
            aTabProc[wTotRubr].IdRubrica := FieldByName('IDPROVENTO').AsInteger;
            aTabProc[wTotRubr].Valor     := 0;
            aTabProc[wTotRubr].FlgProcessa := True;

            { Pega o Indice relativo ao Grupo }
            sGrupoSRB := FieldByName('IDGRUPORUBRICA').AsString;
            For I:=1 to 30 Do Begin
              If aTabGrp[I].Grupo = '' Then Break;
              If aTabGrp[I].Grupo = sGrupoSRB Then
                aTabProc[wTotRubr].NomeIndice := aTabGrp[I].Indice;
            End;

            Next;
          End;

          {--------------------------------------------------------------------}
          { Processa as Rubricas recursivamente até acabarem os testes         }
          iIdMaiorSRB := aTabProc[1].IdRubrica;
          SeqProcesso := 1; { Sequencia de processamento das rubricas (passada) }
          While True Do Begin
            { Processa rubricas }
            dVlrMaiorSRB   := 0;
            FlgFimProcesso := True;
            For I := 1 To wTotRubr Do Begin
              { Busca resultados das rubrica da parcela A }
              With Regra.QueryRegra Do Begin
                Close;
                SQL.Clear;
                SQL.Add('SELECT '+
                        '  C.IDCALCULO, D.ANOMESREF, D.VLRTETO, SUM(VLRCALCULO) AS VLRCALCULO '+
                        'FROM   '+
                        '   CALCULO C, DETCALCULO D '+
                        'WHERE C.IDCALCULO   = '+IntToStr(Regra.FIdCalculo)+ '  '+
                        '  AND C.IDTITULAR   = '+Regra.FQueryIn.FieldByName('IDTITULAR').AsString+
                        '  AND C.IDPESSOA    = '+sIdPessoa+' '+
                        '  AND C.IDPESSJUR   = '+Regra.FQueryIn.FieldByName('IDPESSJUR').AsString+
                        '  AND C.IDPLANOPREV = '+Regra.FQueryIn.FieldByName('IDPLANOPREV').AsString+
                        '  AND D.TIPOCALCULO = ''RA1'' '+ // Retroagido Parcela A
                        '  AND C.IDCALCULO   =  D.IDCALCULO '+
                        'GROUP BY '+
                        '  C.IDCALCULO, D.ANOMESREF, D.VLRTETO '+
                        'ORDER BY '+
                        '  D.ANOMESREF');
                Open;
                // Caso não encontre retorna 0
                If IsEmpty Then Begin
                  Result := '0';
                  dTotalSalarioIndexado := 0;
                  dFrequencia           := 0;
                  Exit;
                End;

                { Caso não marcada Processa os calculos para a rubrica da vez }
                If aTabProc[I].FlgProcessa = True Then Begin
                  aTabProc[I].Valor := ProcessaRubricaSRB(Regra,
                                                          aTabProc[I].IdRubrica,
                                                          SeqProcesso {Sequencia de Processo},
                                                          vAnoMesInicio, sAnoMesFim,
                                                          aTabProc[I].NomeIndice,
                                                          sNumMesesMedia, FlgGrava, cTipoIndice,
                                                          sDataRef);
                  FlgFimProcesso := False;

                  { Guarda a rubrica com maior valor }
                  If aTabProc[I].Valor >= dVlrMaiorSRB Then Begin
                    dVlrMaiorSRB := aTabProc[I].Valor;
                    iIdMaiorSRB  := aTabProc[I].IdRubrica;
                  End;

                End;
              End; { With Regra.QueryRegra }
            End; { For }

            If FlgFimProcesso = True Then Break;

            { Marca a rubrica que possui o maior valor }
            For I := 1 To wTotRubr Do Begin
              If aTabProc[I].IdRubrica = iIdMaiorSRB Then Begin
                aTabProc[I].FlgProcessa := False;
                { Executa Atualização dos descontos da parcela A }
                AtualizaParcelaA(Regra, iIdMaiorSRB, SeqProcesso {Sequencia de Processo});
              End;
            End;

            dTotalSalarioIndexado := (dTotalSalarioIndexado + StrToFloat(FloatToStrF(dVlrMaiorSRB,ffgeneral,13,2)));
            Inc(SeqProcesso); { Sequencia de processamento das rubricas (passada) }

          End; { While True }

        End; { With Regra.QueryRegraAux }
        {----------------------------------------------------------------------}
      End;

    End; { With }

  End; { If }

  // Gravar resultado final na memoria de calculo
  if (FlgGrava = '1') and (Regra.FlgGravaCalculo = True) and (Regra.FidCalculo > 0)
  Then Begin
     Regra.QueryRegraAux.Close;
     Regra.QueryRegraAux.SQL.Clear;
     Regra.QueryRegraAux.SQL.Add(
                        'INSERT INTO DETCALCULO (IDCALCULO, IDDETCALCULO, DESCRICAO, '+
                        ' VLRINDICE, VLRCORRIGIDO, VLRCALCULO, VLRTETO, VLRRUBRICA, ANOMESREF, IDRUBRICA, '+
                        ' IDREGRA, TIPOCALCULO)'+
                        'VALUES '+
                        '('+
                         FloatToStr(Regra.FidCalculo)           +','+
                         ' SEQDETCALCULO.NEXTVAL, '+
                         QuotedStr('TOTAL PARCELA B ')          +','+
                         Regra.OraNumero(FloatToStr(dTotalSalarioIndexado) ) +','+ { Valor do indice no Mes processado }
                         Regra.OraNumero(FloatToStr(dTotalSalarioIndexado) ) +','+ { Salario Indexado                  }
                         Regra.OraNumero(FloatToStr(dTotalSalarioIndexado) ) +','+ { Resultado do calculo Prorrata dia }
                         Regra.OraNumero(FloatToStr(0)                     ) +','+ { Teto                              }
                         Regra.OraNumero(FloatToStr(dTotalSalarioIndexado) ) +','+ { Salario                           }
                         ''''+Copy(sAnoMesFim,1,4)+'/'+Copy(sAnoMesFim,5,2)+''','+
                         'NULL'                                              +','+
                         IntToStr(Regra.IRegraMaster)                        +','+
                         QuotedStr('TPB')+')');
     Regra.QueryRegraAux.ExecSQL;
  End;


  Result := FloatToStr(dTotalSalarioIndexado);

end; { MEDIARUBRICA() }

{******************************************************************************}
{ Formula, ProcessaRubricaSRB                                                  }
{ Processa as Rubricas do SRB Parcela B                                        }
Function ProcessaRubricaSRB(Regra : TRegra; IdRubrica, SeqProcesso : Integer;
                            AnoMesInicio, AnoMesFim, NomeIndice,
                            NumMesesMedia, FlgGrava :String;
                            cTipoIndice : string;
                            DataRef : String; sFiltrapatro : String = 'S') : Double;
Type
  TRecSalario = Record
                  MesRef :String;
                  Indice :Double;
                  Salario:Double;
                  SalarioIndexado:Currency;
                  Proporcao:Currency;
                  ValorTeto:Currency;
                End;

  TRecGrupoIndice = Record
                      Grupo,
                      Indice : String;
                    End;
Var
  aTabSal  : Array [1..700] Of TRecSalario;
  aTabGrp  : Array [1..30]  Of TRecGrupoIndice;

  I, W, wTotRubr : Word;

  sAnoMesIni, sAnoMesFim, sAnoMesAtual, sIdPessoa,
  sIdPessJur, sIdTitular, sIdBeneficio, sSeqProposta, sIdPlanoPrev,
  sProxMesBuscar, sProxAnoBuscar, sProxMesAnoBuscar,
  sNumMesesPesquisa, sDataInicio, sDataRef,
  sDataIndiceTeto : String;

  vFormulaAux, vGruposAConsiderar, vAnoMesInicio, sIdRubrica,
  vAnoMesFinal, vOpCondicao, vValorCondicao, sSQL,
  Letra, Palavra, sGrupoSRB : String;

  dVlrUltIndice, dFrequencia,   dTotalSalarioIndexado, dVlrIndice, dVlrIndiceMes,
  dValorTeto,    dVlrDiferenca, dTotalProporcao,       dVlrIndiceAcumulado :  Double;
Begin
  { Inicia Array com Indices }
  For W:=1 to 700 Do Begin
    aTabSal[W].MesRef  := '';
    aTabSal[W].Indice  := 0;
    aTabSal[W].Salario := 0;
    aTabSal[W].SalarioIndexado := 0;
    aTabSal[W].Proporcao       := 0;
    aTabSal[W].ValorTeto       := 0;
  End;


  { Cria objetos locais }
  QryAuxFormula := TwwQuery.Create(Nil);
  QryAuxFormula.DataBaseName := Regra.DatabaseName;

  With QryAuxFormula Do Begin
    { Monta consulta para buscar as rubricas que serão atualizadas }
    Close;
    SQL.Clear;
    SQL.Add('SELECT '+ { /*+ INDEX (HISTRUBSAL XIE9HISTRUBSAL) */ }
            '  R.IDGRUPORUBRICA, H.IDPESSJUR, H.IDRUBRICA, H.CODPROVDESC, H.VALORPROVENTO, H.MES '+
            'FROM   HISTRUBSAL H, PROVDESC R '+
            'WHERE H.IDPESSOA   = '+Regra.FQueryIn.FieldByName('IDPESSOA').AsString);

    If sFiltraPatro = 'S' Then
      SQL.Add(
            '  AND  H.'+Regra.sCampoPesquisa+' = '+Regra.FQueryIn.FieldByName('IDPESSJUR').AsString);

      SQL.Add(
            '  AND  H.MES      < '''+AnoMesInicio+''''+
            '  AND  H.MES >= TO_CHAR(ADD_MONTHS(TO_DATE('+
                   QuotedStr(AnoMesInicio)+', ''YYYY/MM''),-60), ''YYYY/MM'')  '+
            '  AND  SUBSTR(H.MES,6,2) <> ''13'' '+
            '  AND  H.IDRUBRICA = '+IntToStr(IdRubrica)+' '+
            '  AND  H.IDRUBRICA = R.IDPROVENTO '+
            'ORDER BY H.MES ' );
    Open;

    W :=1;
    sProxMesAnoBuscar := FieldByName('MES').AsString;

    { Varre todos os Salarios encontrados buscando os Indices de Reajuste }
    { e reajustando                                                       }
    While Not EOF Do Begin
      { Busca valor Correspondente do calculo da Parcela "A"}
      If Not Regra.QueryRegra.Locate('ANOMESREF',FieldByName('MES').AsString,[]) Then Begin
        Next;
        Continue;
      End Else Begin
        dValorTeto := Regra.QueryRegra.FieldByName('VLRTETO').AsFloat;
        If dValorTeto > 0 Then
          dVlrDiferenca :=(dValorTeto-Regra.QueryRegra.FieldByName('VLRCALCULO').AsFloat)
        Else
          dVlrDiferenca :=(FieldByName('VALORPROVENTO').AsFloat);

        { Caso não tenha diferenca atinjiu o Teto - Pula  }
        If dVlrDiferenca <= 0 Then Begin
          Next;
          Continue;
        End;
      End;
      { Calcula valor a processar (Falta para Teto-Valor Rubrica)              }
      aTabSal[W].Salario := (FieldByName('VALORPROVENTO').AsFloat);
      { Caso Passou do Teto usa o necessario }
      If aTabSal[W].Salario > dVlrDiferenca Then
        aTabSal[W].Salario := dVlrDiferenca
      Else
        aTabSal[W].Salario := FieldByName('VALORPROVENTO').AsFloat;

      {------------------------------------------------------------------------}
      { Processa a atualização monetária das diferenças das Rubricas ao Teto   }
      {------------------------------------------------------------------------}

      { Monta proximo mes a pesquisar }
      sAnoMesIni := Copy(FieldByName('MES').AsString,1,4)+
                    Copy(FieldByName('MES').AsString,6,2);

      aTabSal[W].MesRef := sAnoMesIni;

      { Guarda Dados Processada }
      sIdRubrica   := FieldByName('IDRUBRICA').AsString;
      sGrupoSRB    := FieldByName('IDGRUPORUBRICA').AsString;
      { Pessoa processada }
      sIdPessJur   := Regra.FQueryIn.FieldByName('IDPESSJUR').AsString;
      sIdTitular   := Regra.FQueryIn.FieldByName('IDTITULAR').AsString;
      sSeqProposta := Regra.FQueryIn.FieldByName('SEQPROPOSTA').AsString;
      sIdPlanoPrev := Regra.FQueryIn.FieldByName('IDPLANOPREV').AsString;
      sDataRef     := DataRef;

      if cTipoIndice = '1'
      then begin
         { Busca Indices a Reajustar }
         Regra.QueryRegraAux.Close;
         Regra.QueryRegraAux.Sql.Clear;
         Regra.QueryRegraAux.Sql.Add(
                            'SELECT '+
                            '  1 AS REGRA, C.COTMESREF AS MES, '+
                            'COTVALOR '+
                            'FROM   '+
                            '  MOEDA M, COTACAOMOEDA C  '+
                            'WHERE  '+
                            '  M.MOESIGLA  = '''+NomeIndice+''' AND '+
                            '  M.MOECODIGO = C.MOECODIGO         AND '+
                            '  SUBSTR(C.COTMESREF,3,4)||SUBSTR(C.COTMESREF,1,2) >= '+ QuotedStr(sAnoMesIni) + ' AND '+
                            '  SUBSTR(C.COTMESREF,3,4)||SUBSTR(C.COTMESREF,1,2) <  '+ QuotedStr(ANOMESANTERIOR(AnoMesFim)) + '     '+
                            'ORDER BY '+
                            ' TO_DATE(COTMESREF,''MMYYYY'') ');
         Regra.QueryRegraAux.Open;
         { Caso encontre indices faz calculo }
         aTabSal[W].SalarioIndexado := aTabSal[W].Salario;
         dVlrIndiceMes := 1;

         Regra.QueryRegraAux.First;
         dVlrIndiceAcumulado := 1;
         While Not Regra.QueryRegraAux.EOF Do Begin
           if (StrToInt(Copy(sProxMesAnoBuscar,1,4) + Copy(sProxMesAnoBuscar,6,2) ) ) =
              (StrToInt(AnoMesAnterior(AnoMesFim)))
           then
             dVlrIndiceAcumulado := 1
           else begin
              dVlrIndice := ( (Regra.QueryRegraAux.FieldByName('COTVALOR').AsFloat/100)+1 );
              dVlrIndiceAcumulado := dVlrIndiceAcumulado * dVlrIndice;
           end;
           Regra.QueryRegraAux.Next;
         End; // While Not QryRegra.EOF
      end
      else begin
         dVlrIndiceAcumulado := BuscaIndiceReajSalPatro( Copy(sAnoMesIni,1,4) +'/'+Copy(sAnoMesIni,5,2) );
      end;

      aTabSal[W].SalarioIndexado := aTabSal[W].Salario * dVlrIndiceAcumulado;

      { Acumula valor do Salario indexado para Resultado }
      dTotalSalarioIndexado := (dTotalSalarioIndexado + aTabSal[W].SalarioIndexado);

      { Calculo do valor proporcional }
      aTabSal[W].Proporcao := (aTabSal[W].SalarioIndexado / Abs( StrToInt(NumMesesMedia) ) );
      aTabSal[W].Proporcao := StrToFloat(FloatToStrF(aTabSal[W].Proporcao,ffgeneral,13,2));

      { Calcula Media dos meses informados na Formula }
      dTotalProporcao := (dTotalProporcao + aTabSal[W].Proporcao);

      { Caso não encontre indices soma sem reajustar }
      If Regra.QueryRegraAux.IsEmpty Then Begin
        dVlrIndice := 1;
        aTabSal[W].Proporcao := ( aTabSal[W].Proporcao * dVlrIndice )  ;
      End;

      {------------------------------------------------------}
      { Grava na memoria de calculo caso desejado na Formula }
      If (FlgGrava = '1') And (Regra.FlgGravaCalculo = True) Then Begin

        { Gera novo Identificador }
        If Regra.FidCalculo = 0 Then Begin
          if (Trim(sIdBeneficio) <> 'NULL') and ((Trim(sIdBeneficio) = '') or
             (StrToInt(sIdBeneficio) <= 0)) then sIdBeneficio := 'NULL';

          Regra.FIdCalculo := LeUltRegistro(Nil, 'CALCULO');
          Regra.QueryRegraAux.Close;
          Regra.QueryRegraAux.SQL.Clear;
          Regra.QueryRegraAux.SQL.Add(
                       'INSERT INTO CALCULO (IDCALCULO, IDPESSJUR,'+
                       ' IDTITULAR, IDPLANOPREV, IDPESSOA, IDBENEFICIO, SEQPROPOSTA, '+
                       ' IDREGRA, DATAREF, DATACALCULO ) '+
                       'VALUES '+
                       '('+
                        FloatToStr(Regra.FidCalculo)     +','+
                        sIdPessJur                       +','+
                        sIdTitular                       +','+
                        sIdPlanoPrev                     +','+
                        sIdPessoa                        +','+
                        sIdBeneficio                     +','+
                        sSeqProposta                     +','+
                        IntToStr(Regra.IRegraMaster)     +','+
                        'TO_DATE('+QuotedStr(sDataRef)+', ''DD/MM/YYYY'')'+','+
                        'TO_CHAR(SYSDATE, ''DD/MM/YYYY''))');
          Regra.QueryRegraAux.ExecSQL;
        End;

        { Caso tenha salario, grava no Historico }
        If (aTabSal[W].SalarioIndexado <> 0) Then Begin
          Regra.QueryRegraAux.Close;
          Regra.QueryRegraAux.SQL.Clear;
          Regra.QueryRegraAux.SQL.Add(
                             'INSERT INTO DETCALCULO (IDCALCULO, IDDETCALCULO, DESCRICAO, '+
                             ' VLRINDICE, VLRCORRIGIDO, VLRCALCULO, VLRTETO, VLRRUBRICA, ANOMESREF, IDRUBRICA, '+
                             ' IDREGRA, TIPOCALCULO)'+
                             'VALUES '+
                             '('+
                              FloatToStr(Regra.FidCalculo)           +','+
                              ' SEQDETCALCULO.NEXTVAL, '+
                              QuotedStr('PROCESSAMENTO DAS RUBRICAS DA PARCELA B ('+IntToStr(SeqProcesso)+')')  +','+
                              Regra.OraNumero(FloatToStr(dVlrIndiceAcumulado)       ) +','+ { Valor do indice no Mes processado  }
                              Regra.OraNumero(FloatToStr(aTabSal[W].Salario)) +','+         { Diferença entre o Salario e o Teto }
                              Regra.OraNumero(FloatToStr(aTabSal[W].Proporcao)      ) +','+ { Resultado do calculo Prorrata dia  }
                              Regra.OraNumero(FloatToStr(dVlrDiferenca)             ) +','+ { Teto                               }
                              Regra.OraNumero(FloatToStr(aTabSal[W].Salario)        ) +','+ { Salario                            }
                              ''''+Copy(sAnoMesIni,1,4)+'/'+Copy(sAnoMesIni,5,2)      +''','''+
                              sIdRubrica                                              +''','  +
                              IntToStr(Regra.IRegraMaster)                            +','    +
                              QuotedStr('RB'+IntToStr(SeqProcesso))                   +')');  { Retroagido Parcela B              }
          Regra.QueryRegraAux.ExecSQL;
        End; { If (aTabSal[I].Salario }

      End; { If FlgGrava = '1' }


      { Continua Rotina }
      Inc(W); { Proximo Indice }
      sProxMesAnoBuscar := FieldByName('MES').AsString;

      { Proximo Registro }
      Next;
    End;
    dFrequencia := (dFrequencia + 1);

  End; { With }

  Result := dTotalProporcao;

  { Libera objetos Locais }
  QryAuxFormula.Free;
End;



{******************************************************************************}
{ Formula, AtualizaParcelaA                                                    }
{ Processa as Rubricas do SRB Parcela B                                        }
Function AtualizaParcelaA(Regra: TRegra; IdRubrica, SeqProcesso : Integer):Double;
Begin
  { Busca os dados da Rubrica com maior media }
  With Regra.QueryRegra Do Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT D.IDCALCULO, D.IDDETCALCULO, D.ANOMESREF, D.VLRCORRIGIDO, D.VLRCALCULO '+
            'FROM CALCULO C, DETCALCULO D '+
            'WHERE C.IDCALCULO   = '+IntToStr(Regra.FIdCalculo)+
            '  AND D.IDRUBRICA   = '+IntToStr(IdRubrica)+
            '  AND D.TIPOCALCULO = '+QuotedStr('RB'+IntToStr(SeqProcesso))+
            '  AND C.IDCALCULO   =  D.IDCALCULO '+
            'ORDER BY D.ANOMESREF' );
    Open;
    { Atualiza rubricas da parcela "A" com o valor calculado na "B" }
    While Not Eof Do Begin
      Regra.QueryRegraAux.Close;
      Regra.QueryRegraAux.SQL.Clear;
      Regra.QueryRegraAux.SQL.Add('UPDATE DETCALCULO SET VLRCALCULO = VLRCALCULO + '+
                                  FieldByName('VLRCORRIGIDO').AsString+' '+
                                  'WHERE IDCALCULO    = '+FieldByName('IDCALCULO').AsString +
                                  '  AND ANOMESREF    = '+QuotedStr(FieldByName('ANOMESREF').AsString) +
                                  '  AND FLGUTILIZADO = ''S'' '+
                                  '  AND TIPOCALCULO  = ''RA1''');
      Regra.QueryRegraAux.ExecSQL;
      Next;
    End;
    { Atualiza parcelas Utilizadas }
    Close;
    SQL.Clear;
    SQL.Add('UPDATE DETCALCULO SET FLGUTILIZADO = ''S'' '+
            'WHERE IDCALCULO   = '+IntToStr(Regra.FIdCalculo)+
            '  AND IDRUBRICA   = '+IntToStr(IdRubrica)+
            '  AND TIPOCALCULO = '+QuotedStr('RB'+IntToStr(SeqProcesso)));
    ExecSQL;

    Close;
  End;

End;

{******************************************************************************}
{ Formula, FERIADO                                                             }
{   Retorna "True" se a data for um feriado CM e "False" se não.               }
{------------------------------------------------------------------------------}
Function FERIADO(Regra : TRegra; Formula : String) : String;
Var
  sDataRef, sCodEstado, FormulaAux, sTipoInvest, sTipoCalculo : String;
  dDataRef : TDate;
  iTipoCalculo, I, iIdCidades, iIdPais :Integer;
Begin
  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }
  iTipoCalculo := 0;
  { Retira Nome da Formula }
  FormulaAux := Copy(Formula,9,Length(Formula));
  FormulaAux := Copy(FormulaAux,1,Length(FormulaAux)-1);

  { Pega Primeira Data }
  I := Pos(',', FormulaAux);
  If I <= 0 Then I := Length(FormulaAux) Else I := (I - 1);
  sDataRef := Copy(FormulaAux,1,I);
  sDataRef := Regra.PegaValor(sDataRef);

  Try
    dDataRef := StrToDate(sDataRef);
  Except
    MsgDlg('Erro na Data de Referencia - "'+sDataRef+'"', 'Regra - Erro',mtError,[mbOk],0);
    Regra.fError := True;
    Exit;
  End;

  { Guarda tipo de Investimento }
  FormulaAux := Copy(FormulaAux,(I+2),Length(FormulaAux));
  I := Pos(',', FormulaAux);
  If I <= 0 Then I := Length(FormulaAux) Else I := (I - 1);
  If I > 0 Then Begin
    sTipoInvest := Copy(FormulaAux, 1, I);
    sTipoInvest := Regra.PegaValor(sTipoInvest);
  End;

  { Fim da decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Verifica Campos Obrigatórios }
  If Regra.FQueryIn.FindField('IDPAIS') = NIL Then Begin                      { IDPAIS }
    MsgDlg('Campo IDPAIS, necessário no Sql de entrada '+
           'para se verificar os dias Úteis.', 'Regra - Erro',mtError,[mbOk],0);
    Regra.fError := True;
    Exit;
  End Else If Regra.FQueryIn.FindField('IDCIDADES') = NIL Then Begin          { IDCIDADES }
    MsgDlg('Campo IDCIDADES, necessário no Sql de entrada '+
           'para se verificar os dias Úteis.', 'Regra - Erro',mtError,[mbOk],0);
    Regra.fError := True;
    Exit;
  End Else If Regra.FQueryIn.FindField('CODESTADO') = NIL Then Begin          { CODESTADO }
    MsgDlg('Campo CODESTADO, necessário no Sql de entrada '+
           'para se verificar os dias Úteis.', 'Regra - Erro',mtError,[mbOk],0);
    Regra.fError := True;
    Exit;
  End;

  { Guarda Dados da Localidade do Processo }
  iIdCidades := Regra.FQueryIn.FieldByName('IDCIDADES').AsInteger;
  sCodEstado := Regra.FQueryIn.FieldByName('CODESTADO').AsString;
  iIdPais    := Regra.FQueryIn.FieldByName('IDPAIS').AsInteger;

  { Verifica se a data é feriado nesta localidade }
  If iTipoCalculo = 0  Then Begin
    If DiasUteis.Feriado(dDataRef,
                         iIdCidades, iIdPais, sCodEstado,
                         True  {bConsideraBancario},
                         False {bConsideraExtraordinario}
                        )
    Then begin
      Result := 'True';
    End Else Begin
      Result := 'False';
    End;
  End Else Begin
    If DiasUteisInvest.Feriado(dDataRef,
                         iIdCidades, iIdPais, sCodEstado,
                         True  {bConsideraBancario},
                         False {bConsideraExtraordinario}
                        )
    Then begin
      Result := 'True';
    End Else Begin
      Result := 'False';
    End;
  End;

End; { FERIADO }

{******************************************************************************}
{ Formula, FUNDATAFINAL                                                        }
{   Retorna Data Final do CARGO, FUNCAO ou ADIC. COMP.                         }
{------------------------------------------------------------------------------}
Function FUNDATAFINAL(Regra : TRegra; Formula : String) : String;
Var
  sCodFuncao, sTipo, sFormulaAux,
  sIdPessoa, sSQL, sDataRef : String;
  I : Integer;
Begin
  Result := '0';

  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }

  { Retira Nome da Formula }
  sFormulaAux := Copy(Formula,14,Length(Formula));
  sFormulaAux := Copy(sFormulaAux,1,Length(sFormulaAux)-1);

  { Continua a decodificar a Formula }
  I := Pos(',', sFormulaAux);
  { Pega codigo do processo }
  sCodFuncao := Copy(sFormulaAux,1,I-1);
  sCodFuncao := Regra.PegaValor(sCodFuncao);

  { Continua a decodificar a Formula }
  I := Pos(',', sFormulaAux);
  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

  { Pega Tipo do processo }
  sTipo := Copy(sFormulaAux,1,Length(sFormulaAux));
  sTipo := Regra.PegaValor(sTipo);

  { Fim da decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Verifica Campos Obrigatórios }
  If Regra.FQueryIn.FindField('IDPESSOA') = NIL Then Begin                      { IDPESSOA }
    MsgDlg('Campo IDPESSOA, necessário no Sql de entrada '+
           'para se verificar os dias Úteis.', 'Regra - Erro',mtError,[mbOk],0);
    Regra.fError := True;
    Exit;
  End;

  { Guarda Dados da Localidade do Processo }
  sIdPessoa  := Regra.FQueryIn.FieldByName('IDPESSOA').AsString;
  sDataRef   := '01/01/3000';

  { Monta SQL }
  sSQL := 'SELECT 1 AS REGRA, '+
          '  MAX(DECODE(E.DATAFINAL, NULL, TO_DATE('+QuotedStr(sDataRef)+', ''DD/MM/YYYY''), '+
          '                                E.DATAFINAL)) AS DATAFINAL  '+
          'FROM   '+
          '  EVOLFUNCPREV E '+
          'WHERE            '+
          '  E.IDPESSOA = '+sIdPessoa+ ' AND '+
          '  E.IDFUNCAO  IS NOT NULL     AND '+
          '  E.PERC1AC   IS NULL             ';
  If Not FazQuery(Regra.QueryRegraAux,sSql) Then Begin
    Exit;
  End;
  { Seta Resultado }
  Result := Regra.QueryRegraAux.FieldByName('DATAFINAL').AsString;

  If Trim(Result) = '' Then
    Result := '0';

End;


{******************************************************************************}
{ Formula, PERCFUNPBC                                                          }
{   Retorna os percentuais, códigos e modos para cada função (inclusive AC)    }
{   encontrada no periodo do cálculo do PBC.                                   }
{------------------------------------------------------------------------------}
Function PERCFUNPBC(Regra : TRegra; Formula : String) : String;
Type
  TRecValores = Record
                  Codigo : Double;
                  Valor,
                  Modo : String;
                End;
Var
  sDataRef, sPeriodo, sTipo, sFormulaAux,
  sIdPessoa, sSQL : String;
  dDataRef : TDate;
  I, tam, n, iIdCidades, iIdPais :Integer;
  VetValores : Array [1..20] Of TRecValores;
  VetRetorno : Array [1..5,1..2]  Of String;
Begin
  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }

  { Retira Nome da Formula }
   sFormulaAux := Copy(Formula,12,Length(Formula));
  sFormulaAux := Copy(sFormulaAux,1,Length(sFormulaAux)-1);

  { Continua a decodificar a Formula }
  I := Pos(',', sFormulaAux);
  { Pega Data de Referencia }
  sDataRef := Copy(sFormulaAux,1,I-1);
  sDataRef := Regra.PegaValor(sDataRef);
  Try
    dDataRef := StrToDate(sDataRef);
  Except
    MsgDlg('Erro na Data de Referencia - "'+sDataRef+'"',
           'Regra - Erro',mtError,[mbOk],0);
    Regra.fError := True;
    Exit;
  End;

  { Continua a decodificar a Formula }
  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

  { Pega Periodo }
  I := Pos(',', sFormulaAux);
  sPeriodo := Copy(sFormulaAux,1,I-1);
  sPeriodo := Regra.PegaValor(sPeriodo);

  { Continua a decodificar a Formula }
  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));
  I := Pos(',', sFormulaAux);
  { Pega Tipo do processo }
  If I <> 0 Then
    sTipo := Copy(sFormulaAux,1,I-1)
  Else
    sTipo := Copy(sFormulaAux,1,Length(sFormulaAux));
  sTipo := Regra.PegaValor(sTipo);

  { Pega Variaveis de Retorno }
  VetRetorno[1,1] := '';
  VetRetorno[2,1] := '';
  VetRetorno[3,1] := '';
  VetRetorno[4,1] := '';
  VetRetorno[5,1] := '';

  { Continua a decodificar a Formula }
  I := Pos(',', sFormulaAux);
  n := 1;
  While True do begin
    if i > 0 then
    begin
      sFormulaAux := Copy(sFormulaAux, i + 1, Length(sFormulaAux));
      I := Pos(',', sFormulaAux);
      if i > 0 then
        tam := i - 1
      else
        tam := Length(sFormulaAux);
      VetRetorno[n,1] := Copy( sFormulaAux, 1, tam );
      VetRetorno[n,1] := Regra.TrocaLetra( '@', '', VetRetorno[n,1] );
      Inc( n );
    end
    else
      Break;
  end;

  { Fim da decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Verifica Campos Obrigatórios }
  If Regra.FQueryIn.FindField('IDPESSOA') = NIL Then Begin                      { IDPESSOA }
    MsgDlg('Campo IDPESSOA, necessário no Sql de entrada '+
           'para se verificar os dias Úteis.', 'Regra - Erro',mtError,[mbOk],0);
    Regra.fError := True;
    Exit;
  End;

  { Guarda Dados do Processo }
  sIdPessoa := Regra.FQueryIn.FieldByName('IDPESSOA').AsString;

  sSQL := 'SELECT '+
          '  E.IDCARGOEXT, E.IDFUNCAO,   E.PERC1AC,     E.PERC2AC, '+
          '              E.PERCFUNCAO, E.MODOFUNCAO, E.IDGRUPOFUNC, C.CODIGO, ' +
          '  E.DATAINICIO, E.DATAFINAL, '+

          '  TO_NUMBER( '+
          '  NVL(TO_CHAR( (DECODE(E.DATAFINAL, NULL, TO_DATE('+QuotedStr(sDataRef)+',''DD/MM/YYYY''), '+
          '  LEAST( E.DATAFINAL, (TO_DATE('+QuotedStr(sDataRef)+',''DD/MM/YYYY'')'+' ) ) )-'+
          //BRUNO AZEVEDO SOL 137062 kintana 829361
          '      decode(GREATEST(E.DATAINICIO,(TO_DATE('+QuotedStr(sDataRef)+',''DD/MM/YYYY'')'+'-'+sPeriodo+')),E.DATAINICIO,E.DATAINICIO-1,GREATEST(E.DATAINICIO,(TO_DATE('+QuotedStr(sDataRef)+',''DD/MM/YYYY'')'+'-'+sPeriodo+'))))/'+sPeriodo+
          //'             GREATEST(E.DATAINICIO, (TO_DATE('+QuotedStr(sDataRef)+',''DD/MM/YYYY'')'+'-'+sPeriodo+')))/'+sPeriodo+
                 ',''000.99999''),0) '+ //BRUNO AZEVEDO SOL 193897 kintana 1846827
          ', ''9999999999.9999999999'')'+
          ' AS PERCENTUAL '+

          'FROM   '+
          '  EVOLFUNCPREV E, CARGOEXT C '+
          'WHERE          '+
          '  E.IDPESSOA = '+sIdPessoa+ ' AND '+
          '  E.IDFUNCAO  IS NOT NULL  AND ';

  If (  (sTipo = 'A') {or (sTipo = 'A2')} ) Then { Funcao do Adcional Compensatorio }
    sSQL := sSQL + '  E.PERC1AC   IS NOT NULL      AND '
  Else Begin

  //Fanuel Marinho SOL136384/8823 Kintana1680341
    if (sTipo = 'A2') then
       sSQL := sSQL + '  E.PERC1AC   IS NOT NULL      AND '
    else { Funcao }
       sSQL := sSQL + '  E.PERC1AC   IS NULL      AND ';

       sSQL := sSQL + '  ( (E.DATAINICIO <= TO_DATE('+QuotedStr(sDataRef)+',''DD/MM/YYYY'')) AND '+
                      '    (DECODE(E.DATAFINAL, NULL, (TO_DATE('+QuotedStr(sDataRef)+',''DD/MM/YYYY'') '+'-'+sPeriodo+'+1), E.DATAFINAL) >= '+
                      '(TO_DATE('+QuotedStr(sDataRef)+',''DD/MM/YYYY'') '+'-'+sPeriodo+'+1)) ) AND ';
  End; { If sTipo = 'C' }

  sSQL := sSQL + ' E.IDFUNCAO = C.IDCARGOEXT AND E.IDPESSJUR = C.IDPESSJUR ';

  sSQL := sSQL + ' ORDER BY DATAINICIO ';

  { Busca Dados, caso não encontre sai fora }
  If Not FazQuery(Regra.QueryRegra,sSQL) Then Begin
    Exit;
  End;

  I:=1;
  While Not Regra.QueryRegra.EOF Do Begin

    VetValores[I].Codigo := Regra.QueryRegra.FieldByName('CODIGO').AsFloat;

    If sTipo = 'A' Then { Funcao do Adcional Compensatorio }
      VetValores[I].Valor  := FormatFloat( '000.000',
                                           Regra.QueryRegra.FieldByName('PERC1AC').AsFloat )
    Else If sTipo = 'A2' Then { As duas funções do Adcional Compensatorio }
      VetValores[I].Valor  := FormatFloat( '000.000',
                                           Regra.QueryRegra.FieldByName('PERC1AC').AsFloat )
                              + '/' +
                              FormatFloat( '000.000',
                                           Regra.QueryRegra.FieldByName('PERCENTUAL').AsFloat*100
                                          )
    Else                { Funcao }
      VetValores[I].Valor  := FormatFloat( '000.000',
                                           Regra.QueryRegra.FieldByName('PERCENTUAL').AsFloat *
                                           Regra.QueryRegra.FieldByName('PERCFUNCAO').AsFloat );


    VetValores[I].Modo   := Regra.QueryRegra.FieldByName('MODOFUNCAO').AsString;

    Inc(I);
    Regra.QueryRegra.Next;
  End;

  { Monta linha de Resultado }
  Result := '';
  For I := 1 to 20 Do Begin
    If VetValores[I].Codigo = 0 Then Break;
      //Jéssica Lana SOL 60443 KTN 523817  [Acrescenta um digito no resultado]
    Result := Result + FormatFloat('0000',VetValores[I].Codigo)+'/'+
                       VetValores[I].Valor +'/'+
                       VetValores[I].Modo  +';';

    { Alimenta Variaveis com os 5 primeiros valores }
    If I <= 5 Then
      If VetRetorno[I,1] <> '' Then
        VetRetorno[I,2] := FormatFloat('0000',VetValores[I].Codigo)+'/'+
                           VetValores[I].Valor +'/'+
                           VetValores[I].Modo  ;

  End;

  { Alimenta variaveis de Retorno }
  Regra.SetVariavel(VetRetorno[1,1], VetRetorno[1,2], VetRetorno[1,1]);
  Regra.SetVariavel(VetRetorno[2,1], VetRetorno[2,2], VetRetorno[2,1]);
  Regra.SetVariavel(VetRetorno[3,1], VetRetorno[3,2], VetRetorno[3,1]);
  Regra.SetVariavel(VetRetorno[4,1], VetRetorno[4,2], VetRetorno[4,1]);
  Regra.SetVariavel(VetRetorno[5,1], VetRetorno[5,2], VetRetorno[5,1]);

  Result := Copy(Result,1, Length(Trim(Result))-1);

End; { PERCFUNPBC }


{******************************************************************************}
{ Formula, VLRBENEFICIO                                                        }
{   VLRBENEFICIO(MESANO,[IDBENEFICIO1,IDBENEFICIO2....], MESIGUALREFERENCIA,   }
{                IDPLANOPREV, FONTEPAGADORA, SOMENTEVALORESAPAGAR,             }
{                FLGMESFILTRO, IDPESSOAPESQUISA)                               }
{   Retorna o valor de um beneficio em um Mes/Ano.                             }
{------------------------------------------------------------------------------}
Function VLRBENEFICIO(Regra : TRegra; Formula : String) : String;
Var
  sDataRef, sIdBeneficios, sListaBeneficios, sFormulaAux, sAnoMesRef,
  sIdPessJur, sIdPessoa, sIdTitular, sIdPlanoPrev,
  sSeqProposta, sFlgIgualaMeses, sSQL : String;
  I :Integer;
  bPossuiLista : Boolean;
  sFiltroMesCobranca, sFontePagadora, sSomenteAPagar : String;
Begin
  sFlgIgualaMeses := '0';
  sIdBeneficios   := '';
  bPossuiLista    := False;

  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }

  { Retira Nome da Formula }
  sFormulaAux := Copy(Formula,14,Length(Formula));
  sFormulaAux := Copy(sFormulaAux,1,Length(sFormulaAux)-1);

  { Pega Data de Referencia }
  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sDataRef := Copy(sFormulaAux,1,I-1);
  sDataRef := Regra.PegaValor(sDataRef);
  sAnoMesRef := Copy(sDataRef,4,4)+'/'+Copy(sDataRef,1,2);

  { Pega beneficios}
  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

  If Trim(sFormulaAux) <> ''  Then Begin

    If (Pos('[',sFormulaAux) <> 0) Then Begin

      I := Pos('[', sFormulaAux);
      sListaBeneficios := Copy( sFormulaAux, (I+1), Length( sFormulaAux ) );
      sListaBeneficios := Copy( sListaBeneficios, 1,( Pos(']', sListaBeneficios)-1 ));

      Repeat

        I := Pos(',', sListaBeneficios);

        If I <= 0 Then I := (Length(sListaBeneficios)+1) Else bPossuiLista := True;

        If Trim( sIdBeneficios ) = '' Then
          sIdBeneficios := QuotedStr( Copy(sListaBeneficios, 1, (I-1)) )
        Else
          sIdBeneficios := sIdBeneficios + ',' + QuotedStr( Copy(sListaBeneficios, 1, (I-1)) ) ;

        sListaBeneficios := Copy(sListaBeneficios, (I+1), Length(sListaBeneficios));

      Until sListaBeneficios = '';

      I := Pos(']', sFormulaAux);
      sFormulaAux := Copy(sFormulaAux,I+1, Length(sFormulaAux));

    End Else Begin

      I := Pos(',', sFormulaAux);
      If I <= 0 Then I := (Length(sFormulaAux)+1);

      sIdBeneficios := Copy(sFormulaAux, 1, I-1);
      sIdBeneficios := Regra.PegaValor( sIdBeneficios );

    End; { End Else Begin }

  End; { If Trim(sFormulaAux) <> '' }

  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := ( Length( sFormulaAux )+1 );

  sFormulaAux := Copy( sFormulaAux, I + 1, Length( sFormulaAux ) );

  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := ( Length( sFormulaAux )+1 );

  { Pega Flag iguala meses caso exista }
  If Trim( sFormulaAux ) <> ''  Then Begin
    sFlgIgualaMeses := Copy( sFormulaAux, 1, (I-1) );
    sFlgIgualaMeses := Regra.PegaValor( sFlgIgualaMeses );
  End;
  sFormulaAux := Copy( sFormulaAux, (I+1), Length( sFormulaAux ) );

  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);

  { Pega IDPLANOPREV caso exista }
  sIdPlanoPrev := '';
  If ( Trim( sFormulaAux ) <> '' ) Then Begin
    sIdPlanoPrev := Copy( sFormulaAux,1, (I-1) );
    sIdPlanoPrev := Regra.PegaValor( sIdPlanoPrev );
  End;
  sFormulaAux := Copy( sFormulaAux, (I+1), Length( sFormulaAux ) );

  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);

  { Pega FONTEPAGADORA caso exista }
  sFontePagadora := '';
  If ( Trim( sFormulaAux ) <> '' ) Then Begin
    sFontePagadora := Copy( sFormulaAux,1, (I-1) );
    sFontePagadora := Regra.PegaValor( sFontePagadora );
  End;
  sFormulaAux := Copy( sFormulaAux, (I+1), Length( sFormulaAux ) );

  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);

  { Pega SOMENTEVALORESAPAGAR caso exista }
  sSomenteAPagar := 'N';
  If ( Trim( sFormulaAux ) <> '' ) Then Begin
    sSomenteAPagar := Copy( sFormulaAux,1, (I-1) );
    sSomenteAPagar := Regra.PegaValor( sSomenteAPagar );
  End;
  sFormulaAux := Copy( sFormulaAux, (I+1), Length( sFormulaAux ) );

  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);

  { Pega FLGMESFILTRO caso exista }
  sFiltroMesCobranca := '0';
  If ( Trim( sFormulaAux ) <> '' ) Then Begin
    sFiltroMesCobranca := Copy( sFormulaAux,1, (I-1) );
    sFiltroMesCobranca := Regra.PegaValor( sFiltroMesCobranca );
  End;
  sFormulaAux := Copy( sFormulaAux, (I+1), Length( sFormulaAux ) );

  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);

  { Pega IDPESSOAPESQUISA caso exista }
  sIdPessoa := '';
  If ( Trim( sFormulaAux ) <> '' ) Then Begin
    sIdPessoa := Copy( sFormulaAux,1, (I-1) );
    sIdPessoa := Regra.PegaValor( sIdPessoa );
  End;

  { Fim da decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Verifica Campos Obrigatórios ( IDPESSOA ) }
  If Regra.FQueryIn.FindField('IDPESSOA') = NIL Then Begin                      { IDPESSOA }
    MsgDlg('Campo IDPESSOA, necessário no Sql de entrada ',
           'Regra - Erro',mtError,[mbOk],0);
    Regra.fError := True;
    Exit;
  End;

  { Guarda Dados do Processo }
  sIdPessJur := Regra.FQueryIn.FieldByName('IDPESSJUR').AsString;
  sIdTitular := Regra.FQueryIn.FieldByName('IDTITULAR').AsString;

  If ( Trim( sIdPessoa ) = '' ) Then Begin
     sIdPessoa  := Regra.FQueryIn.FieldByName('IDPESSOA').AsString;
  End;

  If ( sIdPlanoPrev = '' )
  Then sIdPlanoPrev := Regra.FQueryIn.FieldByName('IDPLANOPREV').AsString;

  sSeqProposta := Regra.FQueryIn.FieldByName('SEQPROPOSTA').AsString;

  { Monta SQL }

  If ( bPossuiLista = True ) Or ( Trim(sIdBeneficios) = '' ) Then Begin
    sSQL := 'SELECT   '+
            '  1 AS REGRA, H.MESREFERENCIA, '+
            '  SUM(VALORINTEGRAL) AS VALORINTEGRAL, SUM(VALORTOTAL) AS VALORTOTAL ';
  End Else Begin
    sSQL := 'SELECT   '+
            '  1 AS REGRA, H.MESREFERENCIA, H.VALORINTEGRAL, H.VALORTOTAL ';
  End;

  sSQL := sSQL +
          'FROM     '+
          '  HSTBENEFBFCIARIO H '+
          'WHERE    '+
          '  H.IDPESSJUR   = '+ sIdPessJur   + ' AND '+
          '  H.IDPLANOPREV = '+ sIdPlanoPrev + ' AND '+
          '  H.IDTITULAR   = '+ sIdTitular   + ' AND '+
          '  H.IDPESSOA    = '+ sIdPessoa    + ' AND '+
          '  H.SEQPROPOSTA = '+ sSeqProposta + ' AND ';

  { Caso Flag iguala meses }
  If sFiltroMesCobranca = '0' Then Begin
    sSQL := sSQL + '  H.MESREFERENCIA  = '+QuotedStr(sAnoMesRef);
  End Else Begin
    sSQL := sSQL + '  H.MES = '+QuotedStr(sAnoMesRef);
  End;

  { Caso tenha especificado o beneficio }
  If Trim(sIdBeneficios) <> '' Then
    sSQL := sSQL + ' AND H.IDBENEFICIO IN ('+ sIdBeneficios+ ') ';

  { Caso tenha especificado FONTEPAGADORA }
  If Trim( sFontePagadora ) <> '' Then
    sSQL := sSQL + ' AND H.FONTEPAGADORA = '+ sFontePagadora;

  { Caso tenha especificado SOMENTE A PAGAR }
  If Trim( sSomenteAPagar ) = 'S' Then
    sSQL := sSQL + ' AND NVL(H.VLBENEFPGTO,0) = 0 ';

  { Caso Flag iguala meses }
  If sFlgIgualaMeses = '1' Then Begin
    sSQL := sSQL + ' AND H.MES = H.MESREFERENCIA ';
  End;

  If ( bPossuiLista = True ) Or ( Trim(sIdBeneficios) = '' ) Then Begin
    sSQL := sSQL + ' GROUP BY H.MESREFERENCIA';
  End;

  If Trim(sIdBeneficios) <> '' Then Begin
    sSQL := sSQL + ' ORDER BY H.MESREFERENCIA DESC ';
  End;

  If Not FazQuery(Regra.QueryRegraAux, sSql) Then Begin
    Result := '0';
    Exit;
  End;

  If sIdTitular <> sIdPessoa Then Begin { Beneficio para o Participante }
    Result := Regra.QueryRegraAux.FieldByName('VALORINTEGRAL').AsString;
  End Else Begin                       { Beneficio para o Beneficiario }
    Result := Regra.QueryRegraAux.FieldByName('VALORTOTAL').AsString;
  End;

  If Trim(Result) = '' Then
    Result := '0';

End; { VLRBENEFICIO }

{******************************************************************************}
{ Formula, VLRBENEFICIOTOTAL -                                                 }
{   Retorna o valor TOTAL de um beneficio em um Mes/Ano.                       }
{------------------------------------------------------------------------------}


//RENATO VISONI SOL 114098 KINTANA 531664
{******************************************************************************}
{ Formula, VALORBENEFICIO                                                        }
{   VALORBENEFICIO(SITUACAO,[IDBENEFICIO1,IDBENEFICIO2....],
                   IDPLANOPREV, FONTEPAGADORA, SOMENTEVALORESAPAGAR,
                   IDPESSOAPESQUISA)
{------------------------------------------------------------------------------}
{------------------------------------------------------------------------------}
Function VALORBENEFICIO(Regra : TRegra; Formula : String) : String;
Var
  sSituacao, sIdBeneficios, sListaBeneficios, sFormulaAux,
  sIdPessJur, sIdPessoa, sIdTitular, sIdPlanoPrev,
  sSeqProposta,  sSQL : String;
  I :Integer;
  bPossuiLista : Boolean;
  sFiltroMesCobranca, sFontePagadora, sSomenteAPagar : String;
  sMesRef, sDesconsideraMesCob : string; // RENATO VISONI SOL 126535 kintana 671960
Begin

  sIdBeneficios   := '';
  sSituacao       := '';
  bPossuiLista    := False;

  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }

  { Retira Nome da Formula }
  sFormulaAux := Copy(Formula,16,Length(Formula));
  sFormulaAux := Copy(sFormulaAux,1,Length(sFormulaAux)-1);

  { Pega Situacao }
  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sSituacao := Copy(sFormulaAux,1,I-1);


  if (trim(sSituacao) = '') then begin
    sSituacao := Regra.FQueryIn.FieldByName('IDSITBENEFICIO').AsString;
  end;

  { Pega beneficios}
  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

  If Trim(sFormulaAux) <> ''  Then Begin

    If (Pos('[',sFormulaAux) <> 0) Then Begin

      I := Pos('[', sFormulaAux);
      sListaBeneficios := Copy( sFormulaAux, (I+1), Length( sFormulaAux ) );
      sListaBeneficios := Copy( sListaBeneficios, 1,( Pos(']', sListaBeneficios)-1 ));

      Repeat

        I := Pos(',', sListaBeneficios);

        If I <= 0 Then I := (Length(sListaBeneficios)+1) Else bPossuiLista := True;

        If Trim( sIdBeneficios ) = '' Then
          sIdBeneficios := QuotedStr( Copy(sListaBeneficios, 1, (I-1)) )
        Else
          sIdBeneficios := sIdBeneficios + ',' + QuotedStr( Copy(sListaBeneficios, 1, (I-1)) ) ;

        sListaBeneficios := Copy(sListaBeneficios, (I+1), Length(sListaBeneficios));

      Until sListaBeneficios = '';

      I := Pos(']', sFormulaAux);
      sFormulaAux := Copy(sFormulaAux,I+1, Length(sFormulaAux));

    End Else Begin

      I := Pos(',', sFormulaAux);
      If I <= 0 Then I := (Length(sFormulaAux)+1);

      sIdBeneficios := Copy(sFormulaAux, 1, I-1);
      sIdBeneficios := Regra.PegaValor( sIdBeneficios );

    End; { End Else Begin }

  End; { If Trim(sFormulaAux) <> '' }

  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := ( Length( sFormulaAux )+1 );

  sFormulaAux := Copy( sFormulaAux, I + 1, Length( sFormulaAux ) );


  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := ( Length( sFormulaAux )+1 );

  { Pega IDPLANOPREV caso exista }
  sIdPlanoPrev := '';
  If ( Trim( sFormulaAux ) <> '' ) Then Begin
    sIdPlanoPrev := Copy( sFormulaAux,1, (I-1) );
    sIdPlanoPrev := Regra.PegaValor( sIdPlanoPrev );
  End;

  sFormulaAux := Copy( sFormulaAux, (I+1), Length( sFormulaAux ) );

  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);

  { Pega FONTEPAGADORA caso exista }
  sFontePagadora := '';
  If ( Trim( sFormulaAux ) <> '' ) Then Begin
    sFontePagadora := Copy( sFormulaAux,1, (I-1) );
    sFontePagadora := Regra.PegaValor( sFontePagadora );
  End;
  sFormulaAux := Copy( sFormulaAux, (I+1), Length( sFormulaAux ) );

  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);

  { Pega SOMENTEVALORESAPAGAR caso exista }
  sSomenteAPagar := 'N';
  If ( Trim( sFormulaAux ) <> '' ) Then Begin
    sSomenteAPagar := Copy( sFormulaAux,1, (I-1) );
    sSomenteAPagar := Regra.PegaValor( sSomenteAPagar );
  End;
  sFormulaAux := Copy( sFormulaAux, (I+1), Length( sFormulaAux ) );

  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);

  { Pega IDPESSOAPESQUISA caso exista }
  sIdPessoa := '';
  If ( Trim( sFormulaAux ) <> '' ) Then Begin
    sIdPessoa := Copy( sFormulaAux,1, (I-1) );
    sIdPessoa := Regra.PegaValor( sIdPessoa );
  End;

  // RENATO VISONI SOL 126535 kintana 671960
  sFormulaAux := Copy( sFormulaAux, (I+1), Length( sFormulaAux ) );
  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);

  { Pega MesReferencia caso exista }
  sMesRef := '';
  If ( Trim( sFormulaAux ) <> '' ) Then Begin
    sMesRef := Copy( sFormulaAux,1, (I-1) );
    sMesRef := Regra.PegaValor( sMesRef );
  End;

  // SOL 262534 PPM 1089618 inicio

  sFormulaAux := Copy( sFormulaAux, (I+1), Length( sFormulaAux ) );
  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);

  { Pega flag que considera filtro MesCobrança caso exista }
  sDesconsideraMesCob := '';
  If ( Trim( sFormulaAux ) <> '' ) and (I > 0) Then Begin
    sDesconsideraMesCob := Copy( sFormulaAux,1, (I-1) );
    sDesconsideraMesCob := Regra.PegaValor( sDesconsideraMesCob );
  End;

  // SOL 262534 PPM 1089618 fim

  //RENATO VISONI SOL 126535 kintana 671960


  { Fim da decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Verifica Campos Obrigatórios ( IDPESSOA ) }
  If Regra.FQueryIn.FindField('IDPESSOA') = NIL Then Begin                      { IDPESSOA }
    MsgDlg('Campo IDPESSOA, necessário no Sql de entrada ',
           'Regra - Erro',mtError,[mbOk],0);
    Regra.fError := True;
    Exit;
  End;

  { Guarda Dados do Processo }
  sIdPessJur := Regra.FQueryIn.FieldByName('IDPESSJUR').AsString;
  sIdTitular := Regra.FQueryIn.FieldByName('IDTITULAR').AsString;

  If ( Trim( sIdPessoa ) = '' ) Then Begin
     sIdPessoa  := Regra.FQueryIn.FieldByName('IDPESSOA').AsString;
  End;

  if (trim(sIdPlanoPreV) ='') then sIdPlanoPreV := Regra.FQueryIn.FieldByName('IDPLANOPREV').AsString;



  { Monta SQL }
   sSQL := sSQL +
   // Renato Visoni
   ' SELECT SUM(H.VALORPREV) AS VALORTOTAL '+
   ' FROM BENEFBFCIARIO BF, HSTBENEFBFCIARIO H '+


   ' WHERE BF.IDPESSJUR = '+ sIdPessJur   + ' AND '+
   '     BF.IDTITULAR =  '+ sIdTitular   + ' AND '+
   '     BF.IDPESSOA =   '+ sIdPessoa    + ' AND '+
   '     BF.IDSITBENEFICIO = '+ sSituacao;



  if (trim(sIdPlanoPreV) <>'0') then
    sSQL := sSQL + ' AND BF.IDPLANOPREV = '+ sIdPlanoPrev ;

  { Caso tenha especificado o beneficio }
  If Trim(sIdBeneficios) <> '' Then
    sSQL := sSQL + ' AND BF.IDBENEFICIO IN ('+ sIdBeneficios+ ') ';

  { Caso tenha especificado FONTEPAGADORA }
  If Trim( sFontePagadora ) <> '' Then
    sSQL := sSQL + ' AND BF.FONTEPAGADORA = '+ sFontePagadora;

  { Caso tenha especificado SOMENTE A PAGAR }
  If Trim( sSomenteAPagar ) = 'S' Then
    sSQL := sSQL + ' AND NVL(H.VLBENEFPGTO,0) = 0 '; //RENATO VISONI SOL 126535 kintana 671960


  //RENATO VISONI SOL 126535 kintana 671960
   if Trim(sMesRef)<>'' then begin
     sSQL := sSQL + ' AND H.MESREFERENCIA =' + QuotedStr(sMesRef);

     if trim(sDesconsideraMesCob) = '' then
        sSQL := sSQL + ' AND H.MES =' + QuotedStr(sMesRef);
   end;


  sSQL := sSQL + ' AND (BF.NUMEROPROCESSO = H.NUMEROPROCESSO) '+
                 ' AND (BF.IDTITULAR = H.IDTITULAR)           '+
                 ' AND (BF.IDPESSOA = H.IDPESSOA )            '+
                 ' AND (BF.IDBENEFICIO = H.IDBENEFICIO)       '+
                 ' AND (BF.IDPLANOPREV = H.IDPLANOPREV)       '+
                 ' AND (BF.IDPESSJUR = H.IDPESSJUR)           '+
                 ' AND (BF.SEQPROPOSTA = H.SEQPROPOSTA )      ';
  //RENATO VISONI SOL 126535 kintana 671960


  If Not FazQuery(Regra.QueryRegraAux, sSql) Then Begin
    Result := '0';
    Exit;
  End;

  Result := Regra.QueryRegraAux.FieldByName('VALORTOTAL').AsString;

  If Trim(Result) = '' Then
    Result := '0';

End; { VALORBENEFICIO }
//RENATO VISONI SOL 114098 KINTANA 531664


//RENATO VISONI SOL 122084 KINTANA 595029
{******************************************************************************}
{ Formula, BUSCAOPCAOBENEF (CODBENEFICIO, CODPLANOPREV, CODPESSOA, VALORBASE1, VALORBASE2, VALORBASE3)
{------------------------------------------------------------------------------}
Function BUSCAOPCAOBENEF(Regra : TRegra; Formula : String) : string;
Var
  sCodBeneficio,sCodPlanoPrev,sCodPessoa,sRetorno1,sRetorno2,sRetorno3,sFormulaAux,sSQL : String;
  I :Integer;
  QryAux : TwwQuery;
Begin

  sCodBeneficio := '';
  sCodPlanoPrev := '';
  sCodPessoa    := '';
  sRetorno1     := '';
  sRetorno2     := '';
  sRetorno3     := '';

  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }

  { Retira Nome da Formula }
  sFormulaAux := Copy(Formula,17,Length(Formula));
  sFormulaAux := Copy(sFormulaAux,1,Length(sFormulaAux)-1);


  { Pega CodBeneficio }
  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sCodBeneficio := Regra.PegaValor(Copy(sFormulaAux,1,I-1));

  { Pega sCodPlanoPrev}
  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));
  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sCodPlanoPrev := Regra.PegaValor(Copy(sFormulaAux,1,I-1));

  { Pega sCODPESSOA}
  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));
  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sCODPESSOA := Regra.PegaValor(Copy(sFormulaAux,1,I-1));

  { Pega variavel Retorno 1}
  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));
  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sRetorno1 := Regra.PegaValor(Copy(sFormulaAux,1,I-1));
  sRetorno1 := trim(StringReplace(sRetorno1,'@','',[rfReplaceAll]));

  { Pega variavel Retorno 2}
  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));
  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sRetorno2 := Regra.PegaValor(Copy(sFormulaAux,1,I-1));
  sRetorno2 := trim(StringReplace(sRetorno2,'@','',[rfReplaceAll]));


  { Pega variavel Retorno 3}
  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));
  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sRetorno3 := Regra.PegaValor(Copy(sFormulaAux,1,I-1));
  sRetorno3 := trim(StringReplace(sRetorno3,'@','',[rfReplaceAll]));


  { Fim da decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Verifica Campos Obrigatórios ( IDPESSOA ) }
  If Regra.FQueryIn.FindField('IDPESSOA') = NIL Then Begin                      { IDPESSOA }
    MsgDlg('Campo IDPESSOA, necessário no Sql de entrada ',
           'Regra - Erro',mtError,[mbOk],0);
    Regra.fError := True;
    Exit;
  End;

  If (Regra.FQueryIn.FindField('IDBENEFICIO') = NIL) and (sCodBeneficio='') Then Begin    { IDBENEFICIO }
    MsgDlg('Campo IDBENEFICIO, necessário no Sql de entrada ',
           'Regra - Erro',mtError,[mbOk],0);
    Regra.fError := True;
    Exit;
  End;

  If (Regra.FQueryIn.FindField('IDPLANOPREV') = NIL) and (sCodPlanoPrev ='') Then Begin  { IDPLANOPREV }
    MsgDlg('Campo IDPLANOPREV, necessário no Sql de entrada ',
           'Regra - Erro',mtError,[mbOk],0);
    Regra.fError := True;
    Exit;
  End;


  if (trim(sCODPESSOA)    ='') or (trim(sCODPESSOA) ='0')    then sCODPESSOA    := Regra.FQueryIn.FieldByName('IDPESSOA').asstring;
  if (trim(sCodBeneficio) ='') or (trim(sCodBeneficio) ='0') then sCodBeneficio := Regra.FQueryIn.FieldByName('IDBENEFICIO').asstring;
  if (trim(sCodPlanoPrev) ='') or (trim(sCodPlanoPrev) ='0') then sCodPlanoPrev := Regra.FQueryIn.FieldByName('IDPLANOPREV').asstring;


  { Monta SQL }
   sSQL := sSQL +
   ' SELECT '+
   '    NVL (valorbase1, 0) as valorbase1,  '+
   '    NVL (valorbase2, 0) as valorbase2, '+
   '    NVL (valorbase3, 0) as valorbase3  '+
   ' FROM BENEFPLANOPART                   '+
   ' WHERE IDPESSOA = '+sCODPESSOA +
   ' AND IDBENEFICIO ='+sCodBeneficio+
   ' AND IDPLANOPREV ='+sCodPlanoPrev;

   QryAux := TwwQuery.Create(Application);
   QryAux.DatabaseName  := 'BASEDADOS';
   QryAux.CLose;
   QryAux.SQL.Clear;
   QryAux.SQL.Text := sSQL;
   QryAux.Open;

   Regra.SetVariavel(sRetorno1,floatTostr(QryAux.FieldByname('ValorBase1').asFloat),sRetorno1);
   Regra.SetVariavel(sRetorno2,floatTostr(QryAux.FieldByname('ValorBase2').asFloat),sRetorno2);
   Regra.SetVariavel(sRetorno3,floatTostr(QryAux.FieldByname('ValorBase3').asFloat),sRetorno3);

   If QryAux.Recordcount = 0 Then Begin
     Result := 'FALSE';
     QryAux.Free;
     Exit;
   End;

   Result := 'TRUE';


   QryAux.Free;

End;
//RENATO VISONI SOL 122084 KINTANA 595029



//ÁDLER
{******************************************************************************}
{ Formula, BUSCAPLANO (IDPESSOA,IDPLANOPREV,IDPESSJUR,FLGATIVO)
{------------------------------------------------------------------------------}
Function BUSCAPLANO(Regra : TRegra; Formula : String) : string;
Var
  sIdPessoa,
  sIdPlanoPrev,
  sIdPessJur,
  sFlgAtivo,
  sFormulaAux,
  sSQL : String;
  I :Integer;
  QryAux : TwwQuery;
Begin

  sIdPessoa    := '';
  sIdPlanoPrev := '';
  sIdPessJur   := '';
  sFlgAtivo    := '';

  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }

  { Retira Nome da Formula }
  sFormulaAux := Copy(Formula,12,Length(Formula));
  sFormulaAux := Copy(sFormulaAux,1,Length(sFormulaAux)-1);

  { Pega sIdPessoa}
  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sIdPessoa := Regra.PegaValor(Copy(sFormulaAux,1,I-1));

  { Pega sIdPlanoPrev}
  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));
  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sIdPlanoPrev := Regra.PegaValor(Copy(sFormulaAux,1,I-1));

  { Pega sIdPessJur }
  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));
  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sIdPessJur := Regra.PegaValor(Copy(sFormulaAux,1,I-1));

  { Pega sFlgAtivo }
  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));
  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sFlgAtivo := Regra.PegaValor(Copy(sFormulaAux,1,I-1));


  { Fim da decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Verifica Campos Obrigatórios ( IDPESSOA ) }
  If Regra.FQueryIn.FindField('IDPESSOA') = NIL Then Begin                      { IDPESSOA }
    MsgDlg('Campo IDPESSOA, necessário no Sql de entrada ',
           'Regra - Erro',mtError,[mbOk],0);
    Regra.fError := True;
    Exit;
  End;

  If (Regra.FQueryIn.FindField('IDPESSJUR') = NIL) and (sIdPessJur='') Then Begin    { IDPESSJUR }
    MsgDlg('Campo IDPESSJUR, necessário no Sql de entrada ',
           'Regra - Erro',mtError,[mbOk],0);
    Regra.fError := True;
    Exit;
  End;

{  if (trim(sIdPessoa)    ='') or (trim(sIdPessoa) ='0')    then sIdPessoa    := Regra.FQueryIn.FieldByName('IDPESSOA').AsString;
  if (trim(sIdPlanoPrev) ='') or (trim(sIdPlanoPrev) ='0') then sIdPessJur   := Regra.FQueryIn.FieldByName('IDPLANOPREV').AsString;
  if (trim(sIdPessJur) ='')   or (trim(sIdPessJur) ='0')   then sIdPlanoPrev := Regra.FQueryIn.FieldByName('IDPESSJUR').AsString;
  if (trim(sFlgAtivo) ='')    or (trim(sFlgAtivo) ='0')    then sFlgAtivo    := Regra.FQueryIn.FieldByName('FLGATIVO').AsString;}

  { Monta SQL }
  sSQL := sSQL +
  ' SELECT IDPESSOA    '+
  '  FROM PARTPREVPLAN '+
  ' WHERE IDPESSJUR = '+ sIdPessJur +
  '   AND IDPESSOA  = '+ sIdPessoa +
  '   AND IDPLANOPREV = '+ sIdPlanoPrev;
  if sFlgAtivo = '1' then
    sSQL := sSQL + '   AND FLGDESATIVADO = 0';

  QryAux := TwwQuery.Create(Application);
  QryAux.DatabaseName  := 'BASEDADOS';
  QryAux.CLose;
  QryAux.SQL.Clear;
  QryAux.SQL.Text := sSQL;
  QryAux.Open;

  If QryAux.Recordcount = 0 Then Begin
    Result := 'FALSE';
    QryAux.Free;
    Exit;
  End;

  Result := 'TRUE';

  QryAux.Free;
End;
//ÁDLER


Function VLRBENEFICIOTOTAL (Regra : TRegra; Formula : String) : String;
Var
  sDataRef, sBeneficio, sFormulaAux, sAnoMesRef,
  sIdPessJur, sIdPessoa, sIdTitular, sIdPlanoPrev,
  sSeqProposta, sFlgIgualaMeses, sSQL : String;
  I :Integer;
Begin
  sFlgIgualaMeses := '0'; sBeneficio := '';
  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }

  { Retira Nome da Formula }
  sFormulaAux := Copy(Formula,19,Length(Formula));
  sFormulaAux := Copy(sFormulaAux,1,Length(sFormulaAux)-1);

  { Pega Data de Referencia }
  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sDataRef := Copy(sFormulaAux,1,I-1);
  sDataRef := Regra.PegaValor(sDataRef);
  sAnoMesRef := Copy(sDataRef,4,4)+'/'+Copy(sDataRef,1,2);
  //sAnoMesRef := sDataRef;

  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));
  { Pega Periodo }
  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sBeneficio := Copy(sFormulaAux,1,I-1);
  sBeneficio := Regra.PegaValor(sBeneficio);

  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));
  { Pega Flag iguala meses caso exista }
  If Trim(sFormulaAux) <> ''  Then Begin
    sFlgIgualaMeses := Copy(sFormulaAux,1,Length(sFormulaAux));
    sFlgIgualaMeses := Regra.PegaValor(sFlgIgualaMeses);
  End;

  { Fim da decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Verifica Campos Obrigatórios }
  If Regra.FQueryIn.FindField('IDPESSOA') = NIL Then Begin                      { IDPESSOA }
    MsgDlg('Campo IDPESSOA, necessário no Sql de entrada ',
           'Regra - Erro',mtError,[mbOk],0);
    Regra.fError := True;
    Exit;
  End;

  { Guarda Dados do Processo }
  sIdPessJur := Regra.FQueryIn.FieldByName('IDPESSJUR').AsString;
  sIdTitular := Regra.FQueryIn.FieldByName('IDTITULAR').AsString;
  sIdPessoa  := Regra.FQueryIn.FieldByName('IDPESSOA').AsString;
  sIdPlanoPrev := Regra.FQueryIn.FieldByName('IDPLANOPREV').AsString;
  sSeqProposta := Regra.FQueryIn.FieldByName('SEQPROPOSTA').AsString;

  { Monta SQL }

  { Caso BENEFICIO não tenha sido passado, soma os beneficios do mês }
  If Trim(sBeneficio) = '' Then Begin
    sSQL := 'SELECT   '+
            '  1 AS REGRA, TO_CHAR(H.TRGDTINCLUSAO,''DD/MM/YYYY''), SUM(H.VALORINTEGRAL) AS VALORINTEGRAL, SUM(H.VALORTOTAL) AS VALORTOTAL ';
  End Else Begin
    sSQL := 'SELECT   '+
            '  1 AS REGRA, TO_CHAR(H.TRGDTINCLUSAO,''DD/MM/YYYY''), H.VALORINTEGRAL, H.VALORTOTAL ';
  End;

  sSQL := sSQL +
          'FROM     '+
          '  HSTBENEFBFCIARIO H '+
          'WHERE    '+
          '  H.IDPESSJUR   = '+sIdPessJur+   ' AND '+
          '  H.IDPLANOPREV = '+sIdPlanoPrev+ ' AND '+
          '  H.IDTITULAR   = '+sIdTitular+   ' AND '+
          '  H.IDPESSOA    = '+sIdPessoa +   ' AND '+
          '  H.SEQPROPOSTA = '+sSeqProposta+ ' AND '+
          '  H.MESREFERENCIA  = '+QuotedStr(sAnoMesRef);

  { Caso tenha especificado o beneficio }
  If Trim(sBeneficio) <> '' Then
    sSQL := sSQL + ' AND H.IDBENEFICIO    = '+sBeneficio+ '     ';

  { Caso Flag iguala meses }
  If sFlgIgualaMeses = '1' Then Begin
    sSQL := sSQL + ' AND H.MES = H.MESREFERENCIA ';
  End;

  If Trim(sBeneficio) = '' Then
     sSQL := sSQL + ' GROUP BY TO_CHAR(H.TRGDTINCLUSAO,''DD/MM/YYYY'') ';

  sSQL := sSQL + ' ORDER BY H.TRGDTINCLUSAO DESC                    ';

  If Not FazQuery(Regra.QueryRegraAux, sSql) Then Begin
    Result := '0';
    Exit;
  End;

  { Retornar VALORINTEGRAL para beneficiario }
  If sIdTitular <> sIdPessoa Then Begin { Beneficio para o Participante }
    Result := Regra.QueryRegraAux.FieldByName('VALORINTEGRAL').AsString;
  End Else Begin                       { Beneficio para o Beneficiario }
    Result := Regra.QueryRegraAux.FieldByName('VALORTOTAL').AsString;
  End;

  If Trim(Result) = '' Then
    Result := '0';

End; { VLRBENEFICIOTOTAL }


{******************************************************************************}
{ Formula, EXISTECAMPO                                                         }
{   Retorna TRUE se o campo existir na query de entrada e FALSE senão.         }
{------------------------------------------------------------------------------}
Function EXISTECAMPO (Regra : TRegra; Formula : String) : String;
Var
  sCampo, sFormulaAux : String;
  I : Integer;
Begin
  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }

  { Retira Nome da Formula }
  sFormulaAux := Copy(Formula,13,Length(Formula));
  sFormulaAux := Copy(sFormulaAux,1,Length(sFormulaAux)-1);
  I := Length(sFormulaAux);
  { Pega o Nome do Campo a verificar }
  sCampo := Copy(sFormulaAux,1,I);

  { Fim da decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Verifica se campo existe no SQL de entrada }
  If Regra.FQueryIn.FindField(sCampo) = NIL Then Begin
    Result := 'FALSE'; { não existe }
  End Else Begin
    Result := 'TRUE';  { existe     }
  End;

End;

{******************************************************************************}
{ Formula, BUSCAMATRICULA                                                      }
{   Retorna o Numero da matricula de uma Pessoa (ELEGPATRO)                    }
{------------------------------------------------------------------------------}
Function BUSCAMATRICULA(Regra : TRegra; Formula : String) : String;
Var
  sFormulaAux, sIdPessJur, sIdPessoa, sSQL : String;
  I :Integer;
Begin

  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }

  { Retira Nome da Formula }
  sFormulaAux := Copy(Formula,14,Length(Formula));
  sFormulaAux := Copy(sFormulaAux,1,Length(sFormulaAux)-1);

  { Fim da decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Verifica Campos Obrigatórios }
  If Regra.FQueryIn.FindField('IDPESSOA') = NIL Then Begin    { IDPESSOA }
    MsgDlg('Campo IDPESSOA, necessário no Sql de entrada ',
           'Regra - Erro',mtError,[mbOk],0);
    Regra.fError := True;
    Exit;
  End;
  If Regra.FQueryIn.FindField('IDPESSJUR') = NIL Then Begin   { IDPESSJUR }
    MsgDlg('Campo IDPESSJUR, necessário no Sql de entrada ',
           'Regra - Erro',mtError,[mbOk],0);
    Regra.fError := True;
    Exit;
  End;

  { Caso esteja executando com tabela auxiliar  busca dados nela }
  If Regra.TemQuery Then Begin
    sIdPessJur := Regra.QryOutraRegra.FieldByName('IDPESSJUR').AsString;
    sIdPessoa  := Regra.QryOutraRegra.FieldByName('IDPESSOA').AsString;
  End Else Begin
    sIdPessJur := Regra.FQueryIn.FieldByName('IDPESSJUR').AsString;
    sIdPessoa  := Regra.FQueryIn.FieldByName('IDPESSOA').AsString;
  End;

  { Monta SQL }
  sSQL := 'SELECT E.MATRICULA FROM ELEGPATRO E '+
          'WHERE            '+
          '  E.IDPESSJUR   = '+sIdPessJur+   ' AND '+
          '  E.IDPESSOA    = '+sIdPessoa;

  If Not FazQuery(Regra.QueryRegraAux, sSql) Then Begin
    Result := 'FALSE';
    Exit;
  End;
  { Seta Resultado }
  Result := Regra.QueryRegraAux.FieldByName('MATRICULA').AsString;

  If Trim(Result) = '' Then
    Result := '';

End;


{******************************************************************************}
{ Formula, TEMPOFUNDACAO                                                       }
{   Retorna o Tempo de Fundação de um participante                             }
{------------------------------------------------------------------------------}
Function TEMPOFUNDACAO(Regra : TRegra; Formula : String) : String;
Var
   vSQL, sFormulaAux  :  String;
   vTempoANaoContar, vTempoFundacaoEmDias : Double;
   vIdPlanoNaDataRef, vIdPessoa, I : LongInt;
   sDataRef, sOp_Plano, sOp_Cancelamento: String;
   vUltimoCancelamento,
   vUltimaDataLida, vDataIniPeriodo, vDataFimPeriodo : TDate;
   bAchouAlgumCancelamento, bAchouMigracao : boolean;

   iUltimoCancelamento: integer;


   function DiferencaEmDiasComerciais ( vDataMaior, vDataMenor : TDate ) : double;
   var iMesInicial, iMesFinal, iDiaFinal, iAnoInicial, iAnoFinal, iDiaInicial : integer;
       vDiferencaEmDias : double;
   begin
      Result := 0;
      iDiaInicial := StrToInt( FormatDateTime( 'dd', vDataMenor ) );
      iMesInicial := StrToInt( FormatDateTime( 'mm', vDataMenor ) );
      iAnoInicial := StrToInt( FormatDateTime( 'yyyy', vDataMenor ) );
      iDiaFinal   := StrToInt( FormatDateTime( 'dd', vDataMaior ) );
      iMesFinal   := StrToInt( FormatDateTime( 'mm', vDataMaior ) );
      iAnoFinal   := StrToInt( FormatDateTime( 'yyyy', vDataMaior ) );
      vDiferencaEmDias := 0;
      //Se a data inicial e a final forem o mesmo dia...
      if vDataMenor = vDataMaior then
        //...calcula apenas 1 dia.
        vDiferencaEmDias := 1
      else
        //Se a data inicial e a final estiverem no mesmo mês...
        if ( iAnoInicial = iAnoFinal ) and ( iMesInicial = iMesFinal ) then
          //...calcula apenas a diferença entre os dias (inclusive estes).
          vDiferencaEmDias := ( iDiaFinal - iDiaInicial ) + 1
        else
        begin
          //Se a data inicial e a final estiverem no mesmo ano...
          if iAnoInicial = iAnoFinal then
            //Calcula o número de dias comerciais ENTRE as datas.
            vDiferencaEmDias := ( iMesFinal - iMesInicial - 1 ) * 30
          else
          begin
            //Se a diferença entre os anos for maior que um...
            if iAnoFinal - iAnoInicial > 1 then
              //Considera cada ano do intervalo como 12 meses comerciais.
              vDiferencaEmDias := ( ( iAnoFinal - iAnoInicial - 1 ) * 12 ) * 30;

            //Calcula o no. de dias comerciais do ano inicial (exclusive o mês da data inicial)
            vDiferencaEmDias := vDiferencaEmDias + ( 12 - iMesInicial ) * 30;
            //Calcula o no. de dias comerciais do ano final (exclusive o mês da data final)
            vDiferencaEmDias := vDiferencaEmDias + ( ( iMesFinal - 1 )  * 30 );
          end;

          //Calcula o no. de dias comerciais do mês inicial
          vDiferencaEmDias := vDiferencaEmDias + ( 30 - iDiaInicial ) + 1;
          //Calcula o no. de dias comerciais do mês final
          vDiferencaEmDias := vDiferencaEmDias + iDiaFinal;

          Result := vDiferencaEmDias;
        end;

   end;
   {- Fim da Função -------------}
Begin

  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }

  { Retira Nome da Formula }
  sFormulaAux := Copy(Formula,15,Length(Formula));
  sFormulaAux := Copy(sFormulaAux,1,Length(sFormulaAux)-1);

  I := Pos(',', sFormulaAux);
  { Pega Data de Referencia }
  sDataRef := Copy(sFormulaAux,1,I-1);
  sDataRef := Regra.PegaValor(sDataRef);

  { Pega Flg do Plano }
  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));
  I := Pos(',', sFormulaAux);
  sOp_Plano := Copy(sFormulaAux,1,I-1);
  sOp_Plano := Regra.PegaValor(sOp_Plano);

  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));
  sOp_Cancelamento := Copy(sFormulaAux,1,Length(sFormulaAux));
  sOp_Cancelamento := Regra.PegaValor(sOp_Cancelamento);

  { Fim da decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}


  { Caso esteja executando com tabela auxiliar  busca dados nela }
  If Regra.TemQuery Then Begin
    vIdPessoa  := Regra.QryOutraRegra.FieldByName('IDPESSOA').AsInteger;
  End Else Begin
    vIdPessoa  := Regra.FQueryIn.FieldByName('IDPESSOA').AsInteger;
  End;

{
   'DP' = 'Demissão da Patrocinadora'
   'DC' = 'Demissão com Cancelamento'
   'DM' = 'Demissão com Manutenção de Contribuição'     *
   'DS' = 'Demissão com Manutenção de Saldo de Conta'
   'DA' = 'Demissão para Aposentadoria'
   'MP' = 'Manutenção Parcial'                          *
   'AF' = 'Afastamento com Manutenção'                  *
   'AR' = 'Afastamento sem Manutenção'
   'TS' = 'Tempo de Serviço'
   'ID' = 'Idade'
   'IN' = 'Invalidez'
   'DO' = 'Doença'                                      *
   'AC' = 'Acidente'                                    *
   'OE' = 'Outros Eventos Temporários'                  *
   'CP' = 'Cancelamento por Iniciativa do Participante'
   'CI' = 'Cancelamento por Inadimplência'
   'CD' = 'Cancelamento por Descumprimento de Prazo'
   'RI' = 'Registro de Inadimplência'
   'FL' = 'Falecimento'
   'FR' = 'Função de Risco' // Acabou
   'TR' = 'Transferência de Reserva'
   'TP' = 'Transferência de Plano'
   'RA' = 'Retorno de Mantido Para Ativo'               *
   'IP' = 'Inscrição do Participante'                   *
   'RM' = 'Reinscrição do Participante'                 *
   'PD' = 'Programa de Demissão Voluntária'             *
   'RC' = 'Reclusao'
   'TE  = 'Transferência de Patrocinadora/Empresa
   'AI' = 'Aposentadoria INSS'
   'BI' = 'Falecimento INSS'
}

   // Buscar todos os eventos da pessoa da dataref para trás e a situação NO PLANO
   // que o participante ficou naquele evento.
   // Somar todos os tempos até encontrar um evento de cancelamento e
   // diminuindo os tempos de evento de afastamento
   // OBS.:
   //       Eventos de Cancelamento : DC, DS, CP, CI, CD
   //       Eventos de Afastamento  : AR, OE
   vSql := ' SELECT EP.IDEVENTOSPREV, EP.IDPLANOPREV, EP.DATAEVENTO, EP.DATAVOLTA, SP.FLGINTERNO, '+
           '        EV.FLGINTERNO AS FLGINTEVENTO, PP.DTINICIOINSC, PP.INSCRICAODATA '+
           ' FROM   EVENTOSPREV EP, PARTPREVPLAN PP, EVENTOGERADOR EV, SITPLANOPREV SP '+
           ' WHERE  EP.IDPESSOA       = '+IntToStr(vIdPessoa)+
           ' AND    EP.DATAEVENTO     < TO_DATE('''+sDataRef+''', ''DD/MM/YYYY'') '+
           ' AND    EP.IDSITPLANONOVO = SP.IDSITPLANOPREV                         '+
           ' AND    EV.IDEVENTOGERADOR = EP.IDEVENTOGERADOR                       '+
           ' AND    PP.IDPESSJUR       = EP.IDPESSJUR                             '+
           ' AND    PP.IDPLANOPREV     = EP.IDPLANOPREV                           '+
           ' AND    PP.IDPESSOA        = EP.IDPESSOA                              '+
           ' AND    PP.SEQPROPOSTA     = EP.SEQPROPOSTA                           ';

           If sOp_Plano = 'N'
           Then vSql := vSQL + ' AND    PP.FLGDESATIVADO   = 0                      ';

           vSql := vSQL + ' ORDER BY EP.DATAEVENTO DESC, SP.FLGINTERNO DESC    ';

   with Regra.QueryRegra do begin
      Close;
      Sql.Clear;
      Sql.Add(vSql);
      Open;
   end;

   if not Regra.QueryRegra.IsEmpty
   then begin
      vTempoFundacaoEmDias := 0;
      vTempoANaoContar     := 0;

      vDataFimPeriodo      := StrToDate(sDataRef);
      vUltimaDataLida      := StrToDate(sDataRef);
      vUltimoCancelamento  := StrToDate(sDataRef);

      iUltimoCancelamento:=0;

      bAchouAlgumCancelamento := False;
      bAchouMigracao          := False;

      with Regra.QueryRegra do begin
        First;
        while not Eof do begin

          If sOp_Cancelamento = 'S' Then Begin
            if ((FieldByName('FLGINTEVENTO').AsString = 'DC') or
                (FieldByName('FLGINTEVENTO').AsString = 'CP') or
                (FieldByName('FLGINTEVENTO').AsString = 'CI') or
                (FieldByName('FLGINTEVENTO').AsString = 'DE') or
                (FieldByName('FLGINTEVENTO').AsString = 'CD') )
            then begin

              { este periodo não vai contar para TEMPOFUNDACAO                           }
              vSQL := 'SELECT P.NUMEROPROCESSO, P.IDEVENTOGERADOR '+
                      'FROM PROCESSOBENEF P, BENEFBFCIARIO BB, EVENTOGERADOR E, BENEFICIO B '+
                      'WHERE P.NUMEROPROCESSO   = BB.NUMEROPROCESSO '+
                      '      AND BB.IDPESSOA    = '+IntToStr(vIdPessoa)+
                      '      AND BB.IDBENEFICIO = B.IDBENEFICIO    '+
                      '      AND B.FLGRESGATE   = 1                '+
                      '      AND E.IDEVENTOGERADOR = P.IDEVENTOGERADOR '+
                      '      AND E.FLGINTERNO IN (''DC'', ''DS'', ''CP'', ''CI'', ''CD'', ''DE'') '+
                      '      AND BB.DATAINICIO >= TO_DATE('''+FieldByName('DATAEVENTO').AsString+''', ''DD/MM/YYYY'') '+
                      '      AND BB.DATAINICIO <= ( SELECT MIN(D1.DATAEVENTO) AS DATAEVENTO '+
                      '                             FROM EVENTOSPREV D1 '+
                      '                             WHERE D1.IDPESSOA = BB.IDPESSOA AND '+
                      '                                   D1.DATAEVENTO > TO_DATE('''+FieldByName('DATAEVENTO').AsString+''', ''DD/MM/YYYY'') ) ';
              If FazQuery(Regra.QueryRegraAux, vSQL) Then Begin
                Next;
                if bAchouAlgumCancelamento then
                begin
                  if (iUltimoCancelamento = 1) then
                  begin
                    vTempoFundacaoEmDias:=vTempoFundacaoEmDias +
                      DiferencaEmDiasComerciais(vUltimoCancelamento, vUltimaDataLida);
                  end;
                end;
                iUltimoCancelamento:=2; {0-sem cancelamento;1-sem resgate;2-com resgate}
                Continue;
              End;

              iUltimoCancelamento:=1;

              vDataIniPeriodo         := vUltimaDataLida;
              vDataFimPeriodo         := vUltimoCancelamento;
              bAchouAlgumCancelamento := True;

              vTempoFundacaoEmDias := vTempoFundacaoEmDias + DiferencaEmDiasComerciais ( vDataFimPeriodo, vDataIniPeriodo );

              vUltimoCancelamento  := FieldByName('DATAEVENTO').AsDateTime-1;

              if FieldByName('FLGINTERNO').AsString = 'DE'
              then break;

            end else if (FieldByName('FLGINTEVENTO').AsString = 'TP') then begin

              bAchouMigracao := True;

            end;

          end; { If sOp_Cancelamento = 'S' }

          vUltimaDataLida    := FieldByName('DATAEVENTO').AsDateTime;
          Next;

        end; { while }

        if not bAchouAlgumCancelamento
        then begin
            First;
            If bAchouMigracao = False Then
              vDataIniPeriodo := StrToDate(FieldByName('INSCRICAODATA').AsString) // era DTINICIOINSC
            Else
              vDataIniPeriodo := StrToDate(FieldByName('DTINICIOINSC').AsString);

            vDataFimPeriodo := StrToDate(sDataRef);

            vTempoFundacaoEmDias := DiferencaEmDiasComerciais ( vDataFimPeriodo, vDataIniPeriodo );
        end
        else
        begin
          if sOp_Cancelamento = 'S' then
          begin
            if (iUltimoCancelamento = 1) then
              vTempoFundacaoEmDias:=vTempoFundacaoEmDias +
                DiferencaEmDiasComerciais(vUltimoCancelamento, vUltimaDataLida);
          end;
        end;
      end; // with


      if vTempoFundacaoEmDias < 0 then
      begin
        Result := '0';
        vTempoFundacaoEmDias := 0;
        Exit;
      end;
   end;

   Result := FloatToStr(vTempoFundacaoEmDias);

end;

{==============================================================================}
{ Formula, DIA2                                                                }
{   Retorna o Dia de uma Data (DD/MM/YYYY)                                     }
{------------------------------------------------------------------------------}
Function DIA2(Regra : TRegra; Formula : String) : String;
Var
   sFormulaAux, sDataRef :  String;
   dDataRef : TDate;
begin
  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }

  { Retira Nome da Formula }
  sFormulaAux := Copy(Formula,6,Length(Formula));
  sFormulaAux := Copy(sFormulaAux,1,Length(sFormulaAux)-1);

  { Pega Data de Referencia }
  sDataRef := Copy(sFormulaAux,1,Length(sFormulaAux));
  sDataRef := Regra.PegaValor(sDataRef);

  Try
    dDataRef := StrToDate(sDataRef);
  Except
    Regra.fError := True;
    Result       := '';
    Exit;
  End;

  Result := Copy(sDataRef,1,2);
end;

{******************************************************************************}
{ Formula, (VLRCF(CODIGO, TIPO))                                               }
{   Retorna o valor do Cargo/Função passando-se o Código do mesmo.             }
{------------------------------------------------------------------------------}
Function VLRCF(Regra : TRegra; Formula : String) : String;
Var
  sFormulaAux, sCodigo, sTipo, sIdCargoExt, sIdGrupoFunc, sSQL : String;
  vPisoMercado ,vPisoMercadoLic , Op1, Op2:String;
  I:Integer;
Begin
  {----------------------------------------------------------------------------}
  { Decodifica a Formula }
  sFormulaAux := Copy(Formula,7,Length(Formula));
  sFormulaAux := Copy(sFormulaAux,1,Length(sFormulaAux)-1);

  { Guarda a Codigo a pesquisar }
  I := Pos(',',sFormulaAux);
  sCodigo := Copy(sFormulaAux,1,I-1);
  sCodigo := Regra.PegaValor(sCodigo);
  sFormulaAux := Copy(sFormulaAux,I+1,Length(sFormulaAux));

  { Guarda Tipo de pesquisa }
  I := Pos(',',sFormulaAux);
  If I > 0 Then Begin
     sTipo := Copy(sFormulaAux,1,I-1);
     sTipo := Regra.PegaValor(sTipo);
     sTipo := UpperCase(sTipo);
     sFormulaAux := Copy(sFormulaAux,I+1,Length(sFormulaAux));

     { Iniciar Variaveis }
     vPisoMercado := '';
     vPisoMercadoLic := '';

     { Guarda Piso Mercado (Opcional) }
     I := Pos(',',sFormulaAux);
     If I > 0 Then Begin
        vPisoMercado := Copy(sFormulaAux,1,I-1);
        if copy(vPisoMercado,1,1) = '@' Then
           vPisoMercado := copy(vPisoMercado,2,length(vPisoMercado));
        sFormulaAux := Copy(sFormulaAux,I+1,Length(sFormulaAux));

       { Guarda Piso Mercado Licenciado (Opcional) }
       vPisoMercadoLic := Copy(sFormulaAux,1,Length(sFormulaAux));
       if copy(vPisoMercadoLic,1,1) = '@' Then
          vPisoMercadoLic := copy(vPisoMercadoLic,2,length(vPisoMercadoLic));
     End
     Else Begin
        vPisoMercado := Copy(sFormulaAux,1,Length(sFormulaAux));
        if copy(vPisoMercado,1,1) = '@' Then
           vPisoMercado := copy(vPisoMercado,2,length(vPisoMercado));
        sFormulaAux := Copy(sFormulaAux,I+1,Length(sFormulaAux));
     End;

  End
  Else Begin
  sTipo := Copy(sFormulaAux,1,Length(sFormulaAux));
  sTipo := Regra.PegaValor(sTipo);
  sTipo := UpperCase(sTipo);
     sFormulaAux := Copy(sFormulaAux,I+1,Length(sFormulaAux));
  End;

  { Fim da decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Teste se IDPESSOA esta no SQL de Entrada (Obrigatorio) }
  Try
    Regra.fQueryIn.FieldByName('IDPESSJUR').AsString;
  Except
    MsgDlg('Campo IDPESSJUR Necessário no Sql de entrada.',
           'Regra - Erro (VLRCF)',mtError,[mbOk,mbHelp],0);
    Exit;
  End;

  {----------------------------------------------------------------------------}
  { INICIA PROCESSAMENTO                                                       }

  If sTipo = 'C' Then Begin            { Cargo }
    sSQL := 'SELECT NV.CODIGO, FN.DATAEFETIVACAO, FN.VALOR  '+
            'FROM NIVEL NV, CARGOXNIVEL CN, FAIXANIVEL FN   '+
            'WHERE CN.IDPESSJUR  = '+Regra.fQueryIn.FieldByName('IDPESSJUR').AsString+
            '  AND CN.IDCARGOEXT = (SELECT IDCARGOEXT FROM CARGOEXT WHERE RTRIM(CODIGO)='+QuotedStr(sCodigo)+')'+
            '  AND NV.IDNIVEL    = CN.IDNIVEL     '+
            '  AND NV.IDPESSJUR  = CN.IDPESSJUR   '+
            '  AND FN.IDPESSJUR  = CN.IDPESSJUR   '+
            '  AND FN.IDNIVEL    = CN.IDNIVEL     '+
            'ORDER BY FN.DATAEFETIVACAO DESC      ';
  End Else If sTipo = 'F' Then Begin   { Função }

    { Busca o ID do CargoExt na CargoExt }
    sSQL := 'SELECT IDCARGOEXT FROM CARGOEXT WHERE RTRIM(CODIGO)='+QuotedStr(sCodigo);
    FazQuery(Regra.QueryRegraAux, sSQL);
    sIdCargoExt := Regra.QueryRegraAux.FieldByName('IDCARGOEXT').AsString;

    { Busca o Id do Grupo }
    sSQL := 'SELECT IDGRUPOFUNC FROM GRUPOCARGOEXT '+
            'WHERE  IDPESSJUR  = '+Regra.fQueryIn.FieldByName('IDPESSJUR').AsString+ ' AND '+
            '       IDCARGOEXT ='+QuotedStr(sIdCargoExt)     +' AND '+
            '       DATAVIGENCIA = (SELECT MAX(DATAVIGENCIA)        '+
            '                       FROM GRUPOCARGOEXT              '+
            '                       WHERE IDPESSJUR  = '+Regra.fQueryIn.FieldByName('IDPESSJUR').AsString+ ' AND '+
            '                             IDCARGOEXT = '+QuotedStr(sIdCargoExt)+' )';

    FazQuery(Regra.QueryRegraAux, sSQL);
    sIdGrupoFunc := Regra.QueryRegraAux.FieldByName('IDGRUPOFUNC').AsString;

    { Busca o valor da Funcao }
    sSQL := 'SELECT VALOR, PISOMERCADO, PISOMERCADOLIC '+
            'FROM FAIXAGRUPO '+
            'WHERE '+
            '  IDPESSJUR   = '+Regra.fQueryIn.FieldByName('IDPESSJUR').AsString+ ' AND '+
            '  IDGRUPOFUNC = '+QuotedStr(sIdGrupoFunc)+' AND '+
            '  DATAEFETIVACAO = (SELECT MAX(DATAEFETIVACAO)      '+
            '                    FROM   FAIXAGRUPO               '+
            '                    WHERE  IDPESSJUR   = '+Regra.fQueryIn.FieldByName('IDPESSJUR').AsString+ ' AND '+
            '                           IDGRUPOFUNC = '+QuotedStr(sIdGrupoFunc)+')';

  End Else If sTipo = 'AC' Then Begin   { Adicional Compensatório }

  End Else Begin   { Outros sai da Regra com erro! }
    MsgDlg('O Tipo "'+sTipo+'" não esta sendo tratado por esta Fórmula! ',
           'Regra - Erro (VLRCF)', mterror,[mbOk],0);
    Regra.FError := True;
    Exit;
  End;

  FazQuery(Regra.QueryRegraAux, sSQL);

  If sTipo <> 'C' Then
  Begin
    If Regra.QueryRegraAux.IsEmpty Then begin
      Op1 := '0';
      Op2 := '0';
    End
    Else Begin
      If Regra.QueryRegraAux.FieldByName('PISOMERCADO').AsString = '' Then
         Op1 := '0'
      Else
         Op1 := Regra.QueryRegraAux.FieldByName('PISOMERCADO').AsString;

      If Regra.QueryRegraAux.FieldByName('PISOMERCADOLIC').AsString = '' Then
         Op2 := '0'
      Else
         Op2 := Regra.QueryRegraAux.FieldByName('PISOMERCADOLIC').AsString;
    End;

    If vPisoMercado <> '' Then
       Regra.SetVariavel(vPisoMercado, Op1, vPisoMercado);

    If vPisoMercadoLic <> '' Then
       Regra.SetVariavel(vPisoMercadoLic, Op2, vPisoMercadoLic);
  End;

  { Seta Resultado }
  Result := Regra.QueryRegraAux.FieldByName('VALOR').AsString;
  If Trim(Result) = '' Then
    Result := '0';
end;

{==============================================================================}
{ Formula, (CTVA(CODIGO))                                                      }
{   Retorna a diferença entre o valor da função com o valor de piso de mercado,}
{       passando-se o Código do mesmo.                                         }
{------------------------------------------------------------------------------}
Function CTVA(Regra : TRegra; Formula : String) : String;
Var
  sFormulaAux, sCodigo, sData, sIdCargoExt, sIdGrupoFunc, sSQL : String;
  I:Integer;
Begin
  {----------------------------------------------------------------------------}
  { Decodifica a Formula                                                       }
  sFormulaAux := Copy(Formula,6,Length(Formula));
  sFormulaAux := Copy(sFormulaAux,1,Length(sFormulaAux)-1);

  { Guarda a Codigo a pesquisar }
  I := Pos(',',sFormulaAux);
  sCodigo := Copy(sFormulaAux,1,I-1);

  If copy(sCodigo,1,1) = '@' Then
  sCodigo := Regra.PegaValor(sCodigo);

  sFormulaAux := Copy(sFormulaAux,I+1,Length(sFormulaAux));

  { Guarda a data da Pesquisa }
  sData := sFormulaAux;

  If copy(sData,1,1) = '@' Then
    sData := Regra.PegaValor(sData);

  sFormulaAux := Copy(sFormulaAux,I+1,Length(sFormulaAux));

  { Fim da decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Teste se IDPESSOA esta no SQL de Entrada (Obrigatorio) }
  Try
    Regra.fQueryIn.FieldByName('IDPESSJUR').AsString;
  Except
    Regra.MessageInfo := 'Campo IDPESSJUR Necessário no Sql de entrada.';
    Exit;
  End;

  {----------------------------------------------------------------------------}
  { INICIA PROCESSAMENTO                                                       }

  { Busca o valor do CTVA}
  sSQL := ' SELECT ' + #13 +
          '    ( F.PISOMERCADO - F.VALOR ) AS CTVA ' + #13 +
          ' FROM ' + #13 +
          '    CARGOEXT C, ' + #13 +
          '    GRUPOCARGOEXT GE, ' + #13 +
          '    GRUPOFUNC G, ' + #13 +
          '    FAIXAGRUPO F ' + #13 +
          ' WHERE ( C.IDPESSJUR = ' + Regra.fQueryIn.FieldByName('IDPESSJUR').AsString +  ' ) ' + #13 +
          '   AND ( C.TIPO        = ''F'' ) ' + #13 +
          '   AND ( GE.IDPESSJUR  = C.IDPESSJUR ) ' + #13 +
          '   AND ( GE.IDCARGOEXT = C.IDCARGOEXT ) ' + #13 +
          '   AND ( G.IDPESSJUR   = GE.IDPESSJUR ) ' + #13 +
          '   AND ( G.IDGRUPOFUNC = GE.IDGRUPOFUNC ) ' + #13 +
          '   AND ( F.IDGRUPOFUNC = G.IDGRUPOFUNC ) ' + #13 +
          '   AND ( C.CODIGO      = ' + sCodigo + ' ) ' + #13 +

          //CPrev - 26850 - Inicio
          '   AND ( F.DATAEFETIVACAO = ' + QuotedStr(sData) + ' ) ';

          // '   AND ( F.DATAEFETIVACAO = ( SELECT MAX( FG.DATAEFETIVACAO ) ' + #13 +
          // '                              FROM  FAIXAGRUPO FG ' + #13 +
          // '                              WHERE ( FG.IDPESSJUR   = ' + Regra.fQueryIn.FieldByName('IDPESSJUR').AsString +  ' ) ' + #13 +
          // '                                AND ( FG.IDGRUPOFUNC = GE.IDGRUPOFUNC ) ) ) ';
          //CPrev - 26850 - Fim

  FazQuery(Regra.QueryRegraAux, sSQL);

  { Seta Resultado }
  Result := Regra.QueryRegraAux.FieldByName('CTVA').AsString;

  If Trim(Result) = '' Then
    Result := '0';
end;

{******************************************************************************}
{ Formula, VALORRESERVA (VALORRESERVA(CODHIERARQUIA,DATAREF,TIPORESULTADO,     }
{                                     CAMPOPESQUISA)                           }
{   Retorna o valor da reserva com a hierarquia informada.                     }
{------------------------------------------------------------------------------}
Function VALORRESERVA(Regra : TRegra; Formula : String) : String;
Var
  sIdPessJur, sIdPessoa, sIdTitular, sIdPlanoPrev,
  sSeqProposta, sTipoIdPesquisaPessoa, sTipoIdPesquisaReserva,
  sIdPesquisaPessoa, sCampoPesquisaReserva,
  sFormulaAux, sValorPesquisa, sDataRef, sTipoResultado, sSQL,
  sListaReservas, sIdTipoReserva, sCodIndice : String;
  I:Integer;
  dValorReserva, dTotalReserva, dValorIndice: Double;
  bPossuiLista : Boolean;
Begin
  sTipoIdPesquisaPessoa  := '0'; { Pesquisa por IDPESSOA }
  sTipoIdPesquisaReserva := '0'; { Pesquisa por CODHIERARQUIA }
  bPossuiLista           := False;
  {----------------------------------------------------------------------------}
  { Decodifica a Formula                                                       }
  sFormulaAux := Copy(Formula,14,Length(Formula));
  sFormulaAux := Copy(sFormulaAux,1,Length(sFormulaAux)-1);


  { Pega reservas }
  If Trim(sFormulaAux) <> ''  Then Begin

    If (Pos('[',sFormulaAux) <> 0) Then Begin

      I := Pos('[', sFormulaAux);
      sListaReservas := Copy( sFormulaAux, (I+1), Length( sFormulaAux ) );
      sListaReservas := Copy( sListaReservas, 1,( Pos(']', sListaReservas)-1 ));

      Repeat

        I := Pos(',', sListaReservas);

        If I <= 0 Then I := (Length(sListaReservas)+1) Else bPossuiLista := True;

        If Trim( sValorPesquisa ) = '' Then
          sValorPesquisa := QuotedStr( Copy(sListaReservas, 1, (I-1)) )
        Else
          sValorPesquisa := sValorPesquisa + ',' + QuotedStr( Copy(sListaReservas, 1, (I-1)) ) ;

        sListaReservas := Copy(sListaReservas, (I+1), Length(sListaReservas));

      Until sListaReservas = '';

      I := Pos(']', sFormulaAux);
      sFormulaAux := Copy(sFormulaAux,I+1, Length(sFormulaAux));

    End Else Begin

      I := Pos(',', sFormulaAux);
      If I <= 0 Then I := (Length(sFormulaAux)+1);

      sValorPesquisa := Copy(sFormulaAux, 1, I-1);
      sValorPesquisa := QuotedStr( Regra.PegaValor( sValorPesquisa ) );

    End; { End Else Begin }

  End; { If Trim(sFormulaAux) <> '' }

  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);

  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

  { Guarda Data de referencia }
  I := Pos(',',sFormulaAux);
  sDataRef := Copy(sFormulaAux,1,I-1);
  sDataRef := Regra.PegaValor(sDataRef);

  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));
  { Guarda Tipo de Resultado }
  I := Pos(',',sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sTipoResultado := Copy(sFormulaAux,1,I-1);
  sTipoResultado := Regra.PegaValor(sTipoResultado);
  sTipoResultado := UpperCase(sTipoResultado);

  If bPossuiLista = True Then sTipoResultado := '1'; { Caso tenha lista, sempre retorna em Real }

  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));
  { Pega Tipo de pesquisa para a pessoa 0 - IDTITULAR (default) / 1 - IDPESSOA }
  If Trim(sFormulaAux) <> ''  Then Begin
    I := Pos(',',sFormulaAux);
    If I <= 0 Then I := (Length(sFormulaAux)+1);

    sTipoIdPesquisaPessoa := Copy(sFormulaAux,1,I-1);
    sTipoIdPesquisaPessoa := Regra.PegaValor(sTipoIdPesquisaPessoa);
    If Trim( sTipoIdPesquisaPessoa ) = '' Then sTipoIdPesquisaPessoa := '0';
  End;

  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));
  { Pega Tipo de pesquisa para a reserva 0 - CODHIERARQUIA(default)  / 1 - IDTIPORESERVA  }
  If Trim(sFormulaAux) <> ''  Then Begin
    I := Pos(',',sFormulaAux);
    If I <= 0 Then I := (Length(sFormulaAux)+1);

    sTipoIdPesquisaReserva := Copy(sFormulaAux,1,I-1);
    sTipoIdPesquisaReserva := Regra.PegaValor(sTipoIdPesquisaReserva);
    If Trim( sTipoIdPesquisaReserva ) = '' Then sTipoIdPesquisaReserva := '0';
  End;

  { Fim da decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Teste se IDPESSJUR esta no SQL de Entrada (Obrigatorio) }
  If (Regra.FQueryIn.FindField('IDPESSOA') = NIL) Then Begin
    MsgDlg('Campos obrigatórios faltando no Sql de entrada.',
           'Regra - Erro (VALORRESERVA)',mtError,[mbOk,mbHelp],0);
    Exit;
  End;

  { Guarda Dados do Processo }
  sIdPessJur := Regra.FQueryIn.FieldByName('IDPESSJUR').AsString;
  sIdPessoa  := Regra.FQueryIn.FieldByName('IDPESSOA').AsString;
  sIdPlanoPrev := Regra.FQueryIn.FieldByName('IDPLANOPREV').AsString;

  { Altera pessoa a pesquisar }
  If sTipoIdPesquisaPessoa = '1' Then Begin
    sIdPesquisaPessoa := Regra.FQueryIn.FieldByName('IDTITULAR').AsString;
    sIdTitular        := Regra.FQueryIn.FieldByName('IDTITULAR').AsString;
  End Else Begin
    sIdPesquisaPessoa := Regra.FQueryIn.FieldByName('IDPESSOA').AsString;
  End;

  { Altera campo a pesquisar }
  If sTipoIdPesquisaReserva = '0' Then Begin
    sCampoPesquisaReserva := 'CODHIERARQUIA';
  End Else Begin
    sCampoPesquisaReserva := 'IDTIPORESERVA';
  End;

  { Busca o Identificador da Reserva de acordo com o Codigo Hierárquico }
  sSQL := 'SELECT IDTIPORESERVA, INDICEREAJUSTE  '+
          'FROM RESERVAXPLANO   '+
          'WHERE IDPLANOPREV   = '+ sIdPlanoPrev + ' AND '+
          sCampoPesquisaReserva+' IN ('+ sValorPesquisa + ')   ';

  If Not FazQuery(Regra.QueryRegra, sSQL) Then Begin
    { Não encontrei a reserva }
    Result := '0';
    Exit;
  End;

  dTotalReserva := 0;
  dValorIndice  := 1;
  While Not Regra.QueryRegra.Eof Do Begin
    { Guardar dados }
    sIdTipoReserva := Regra.QueryRegra.FieldByName('IDTIPORESERVA').AsString;
    sCodIndice     := Regra.QueryRegra.FieldByName('INDICEREAJUSTE').AsString;

    { Encontrando o Identificador da Reserva busca o valor  }
    sSQL := 'SELECT VALORRESERVA  '+
            'FROM RESERVAPART   '+
            'WHERE IDPESSOA      = '+ sIdPesquisaPessoa    + ' AND '+
            '      IDPESSJUR     = '+ sIdPessJur           + ' AND '+
            '      IDPLANOPREV   = '+ sIdPlanoPrev         + ' AND '+
            '      IDTIPORESERVA = '+ sIdTipoReserva + '     ';
    If Not FazQuery(Regra.QueryRegraAux, sSQL) Then Begin
      { Não encontrei a reserva no participante }
      Result := '0';
      Regra.QueryRegra.Next;
      Continue;
    End;

    dValorReserva := Regra.QueryRegraAux.FieldByName('VALORRESERVA').AsFloat;

    { Caso Resultado em Real, busca valor de conversão }
    If sTipoResultado = '1' Then Begin
      { Encontrando o Identificador da Reserva busca o valor  }
      sSQL := 'SELECT C.COTVALOR '+
              'FROM COTACAOMOEDA C '+
              'WHERE C.MOECODIGO = '+ sCodIndice  + ' AND '+
              '      C.COTDATA  <= TO_DATE('+QuotedStr(sDataRef)+ ',''DD/MM/YYYY'')'+
              'ORDER BY C.COTDATA DESC ';
       If Not FazQuery(Regra.QueryRegraAux, sSQL) Then Begin
        { Não encontrei cotação da moeda }
        Result := '0';
        Regra.QueryRegra.Next;
        Continue;
      End;
      dValorIndice := Regra.QueryRegraAux.FieldByName('COTVALOR').AsFloat;

      dTotalReserva := dTotalReserva + (dValorReserva*dValorIndice);
    End Else Begin
      dTotalReserva := dValorReserva;
    End;

    Regra.QueryRegra.Next;
  End;

  Result := FloatToStr(dTotalReserva);

end; { VALORRESERVA }


{******************************************************************************}
{ Formula, DATACONTRIB (IDCONTRIBUICAO,DATAREF,@RETORNO1,@RETORNO2)            }
{   Retorna a Data Inicial e Final de uma Contribuição.                        }
{------------------------------------------------------------------------------}
Function DATACONTRIB(Regra : TRegra; Formula : String) : String;
Var
  FormulaAux, NumContrib, vData, vSql, Op1, Op2, Op3,
  NomeVar1, NomeVar2 : String;
  I : Integer;
Begin
   FormulaAux := Copy(formula,13,length(formula));
   FormulaAux := Copy(FormulaAux,1,Length(FormulaAux)-1);

   i := pos(',',FormulaAux);
   NumContrib := Copy(FormulaAux,1,i-1);
   NumContrib := Regra.Pegavalor(NumContrib);
   FormulaAux := Copy(FormulaAux,i+1,length(FormulaAux));

   I := pos(',',FormulaAux);
   vData := Copy(FormulaAux,1,i-1);
   vData := Regra.pegavalor(vData);
   vData := Regra.DataParaMes(vData,0,'I');

   FormulaAux := Copy(FormulaAux,i+1,length(FormulaAux));

   i := pos(',',FormulaAux);
   NomeVar1 := copy(FormulaAux,1,i-1);
   if copy(NomeVar1,1,1) = '@' Then
      Nomevar1 := copy(NomeVar1,2,length(NomeVar1));
   FormulaAux := Copy(FormulaAux,i+1,length(FormulaAux));

   NomeVar2     := FormulaAux;
   if copy(NomeVar2,1,1) = '@' Then
      Nomevar2 := copy(NomeVar2,2,length(NomeVar2));

   if vData = '' then begin
      try
         Regra.QueryIn.FieldbyName('IDPESSOA').AsString;
      except
          MsgDlg('Campo IDPESSOA necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
          Exit;
      end;

      vSql := 'SELECT IDPESSOA, DATAINICIO, DATAFINAL '+
              'FROM CONTRIBPREVPARTP WHERE '+
              '(IDPESSOA = '+Regra.QueryIn.FieldbyName('IDPESSOA').AsString+') AND '+
              '(IDCONTRIBUICAO = '+NumContrib+')';
     If Not FazQuery(Regra.QueryRegra,vSQL) Then Begin
         Op1 := '-1';
         Op2 := '-1';
      end else begin
         Op1 := Regra.QueryRegra.FieldbyName('DATAINICIO').AsString;
         Op2 := Regra.QueryRegra.FieldbyName('DATAFINAL').AsString;
      end;

      if Op1 = '' then
         Op1 := '0';
      if Op2 = '' then
         Op2 := '0';
      if Op3 = '' then
         Op3 := '0';

      Regra.SetVariavel(NomeVar1,Op1,NomeVar1);
      Regra.SetVariavel(NomeVar2,Op2,NomeVar2);
      Result := 'VERDADEIRO';
      if (Op1 = '-1') and (Op2 = '-1') and (Op3 = '-1') then
         Result := 'FALSO'
      else if (Op1 = '0') and (Op2 = '0') and (Op3 = '0') then
           Result := 'FALSO';
      Exit;
   end else begin
       try
          Regra.QueryIn.FieldbyName('IDPESSOA').AsString;
       except
          MsgDlg('Campo IDPESSOA necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
          Exit;
       end;

       vSql := 'SELECT 1 AS REGRA, DATAINICIO, DATAFINAL FROM HSTCONTRIBPREV WHERE '+
               '(IDPESSOA = '+Regra.QueryIn.FieldbyName('IDPESSOA').AsString+') AND '+
               '(IDCONTRIBUICAO = '+NumContrib+') AND (MESREFERENCIA = '''+vData+''')';
       If Not FazQuery(Regra.QueryRegra,vSQL) Then Begin
          Op1 := '-1';
          Op2 := '-1';
       end else begin
           Op1 := Regra.QueryRegra.FieldbyName('DATAINICIO').AsString;
           Op2 := Regra.QueryRegra.FieldbyName('DATAFINAL').AsString;
       end;
       if Op1 = '' then
          Op1 := '0';
       if Op2 = '' then
          Op2 := '0';

       Result := 'VERDADEIRO';
       if (Op1 = '-1') and (Op2 = '-1') and (Op3 = '-1') then
          Result := 'FALSO'
       else if (Op1 = '0') and (Op2 = '0') and (Op3 = '0') then
            Result := 'FALSO';

       Regra.SetVariavel(NomeVar1,Op1,NomeVar1);
       Regra.SetVariavel(NomeVar2,Op2,NomeVar2);
   end;


End; { DATACONTRIB }

{******************************************************************************}
{ Formula, PLANOANTERIOR(@VARPLANO, @VARDATAINSCRICAO)                         )
{   Retorna o Plano e a Data de inscrição do plano a anterior ao atual.        }
{------------------------------------------------------------------------------}
Function PLANOANTERIOR(Regra : TRegra; Formula : String) : String;
Var
  FormulaAux, sSQL, sVarRetorno1, sVarRetorno2,
  sIdPlanoAnt, sDataInscAnt : String;

  I, iIdPessoa, iIdPessjur, iIdPlanoPrev, iSeqProposta : Integer;
Begin
  Result := '';
  FormulaAux := Copy(formula,15,length(formula));
  FormulaAux := Copy(FormulaAux,1,Length(FormulaAux)-1);

  { Guarda Variavel de Retorno do Identficador do Plano Anterior }
  I := pos(',',FormulaAux);
  sVarRetorno1 := Copy(FormulaAux,1,I-1);
  If Copy(sVarRetorno1,1,1) = '@' Then sVarRetorno1 := Copy(sVarRetorno1,2,Length(sVarRetorno1));
  FormulaAux := Copy(FormulaAux,I+1,Length(FormulaAux));
  { Guarda Variavel de Retorno da Data de Inscrição no Plano Anterior }
  sVarRetorno2 := FormulaAux;
  If Copy(sVarRetorno2,1,1) = '@' Then sVarRetorno2 := Copy(sVarRetorno2,2,Length(sVarRetorno2));

  { Guarda Dados da Consulta de Entrada }

  // Gleyber - Pendência 16250 - 18/03/2004 - Início
  If Regra.FQueryIn.FindField('IDTITULAR') = NIL
   Then iIdPessoa    := Regra.QueryIn.FieldbyName('IDPESSOA').AsInteger
   Else iIdPessoa    := Regra.QueryIn.FieldbyName('IDTITULAR').AsInteger;
  // Gleyber - Pendência 16250 - 18/03/2004 - Fim

  iIdPessjur   := Regra.QueryIn.FieldbyName('IDPESSJUR').AsInteger;
  iIdPlanoPrev := Regra.QueryIn.FieldbyName('IDPLANOPREV').AsInteger;
  iSeqProposta := Regra.QueryIn.FieldbyName('SEQPROPOSTA').AsInteger;

  { Monta Consulta }
  sSql := 'SELECT '+
          '  IDPLANOPREV, INSCRICAODATA '+
          'FROM   '+
          '  PARTPREVPLAN ' +
          'WHERE '+
          '  (IDPESSJUR   =  '+ IntToStr(iIdPessJur)   +') AND '+
          '  (IDPESSOA    =  '+ IntToStr(iIdPessoa)    +') AND '+
          '  (IDPLANOPREV <> '+ IntToStr(iIdPlanoPrev) +') AND '+
          '  (SEQPROPOSTA =  '+ IntToStr(iSeqProposta) +') AND '+
          '  (FLGDESATIVADO  = '+ IntToStr(1)          +') '+ { Desativado }
          'ORDER  BY '+
          '  INSCRICAODATA DESC  ';
  { Executa a Consulta e testa resultados }
  If Not FazQuery(Regra.QueryRegra,sSQL) Then Begin
    Result := 'FALSO';
  End Else Begin
    Result := 'VERDADEIRO';
    sIdPlanoAnt := Regra.QueryRegra.FieldbyName('IDPLANOPREV').AsString;
    sDataInscAnt := Regra.QueryRegra.FieldbyName('INSCRICAODATA').AsString;
  End;
  { Atualiza variaveis de retorno }
  Regra.SetVariavel(sVarRetorno1,sIdPlanoAnt ,sVarRetorno1);
  Regra.SetVariavel(sVarRetorno2,sDataInscAnt,sVarRetorno2);

End; { PLANOANTERIOR }

{******************************************************************************}
{ Formula, BUSCAPERCENTUAL(DATAREF)                                            }
{   Retorna o Plano e a Data de inscrição do plano a anterior ao atual.        }
{------------------------------------------------------------------------------}
Function BUSCAPERCENTUAL(Regra : TRegra; Formula : String) : String;
Var
  FormulaAux, sSQL, sAnoMesRef, sDataRef : String;

  I, iIdPessoa, iIdPessjur, iIdPlanoPrev, iSeqProposta : Integer;
Begin
  Result := '';
  FormulaAux := Copy(Formula,17,length(Formula));
  FormulaAux := Copy(FormulaAux,1,Length(FormulaAux)-1);

  { Guarda Data de Referencia }
  sDataRef := FormulaAux;
  sDataRef := Regra.Pegavalor(sDataRef);
  { Pega Ano/Mes da data de Referencia }
  sAnoMesRef := Copy(sDataRef,7,4)+'/'+Copy(sDataRef,4,2);

  { Guarda Dados da Consulta de Entrada }
  iIdPessoa    := Regra.QueryIn.FieldbyName('IDPESSOA').AsInteger;
  iIdPessjur   := Regra.QueryIn.FieldbyName('IDPESSJUR').AsInteger;
  iIdPlanoPrev := Regra.QueryIn.FieldbyName('IDPLANOPREV').AsInteger;
  iSeqProposta := Regra.QueryIn.FieldbyName('SEQPROPOSTA').AsInteger;

  { Monta Consulta }
  sSql := 'SELECT '+
          '  PERCENTUAL '+
          'FROM   '+
          '  REAJSALPATRO ' +
          'WHERE '+
          '  (IDPLANOPREV =  '+ IntToStr(iIdPlanoPrev) +') AND '+
          '  (IDPESSJUR   =  '+ IntToStr(iIdPessJur)   +') AND '+
          '  (MESREAJ     =  '+ QuotedStr(sAnoMesRef)  +')     ';
  { Executa a Consulta e testa resultados }
  If Not FazQuery(Regra.QueryRegra,sSQL) Then Begin
    Result := '0';
   End Else Begin
    Result := Regra.QueryRegra.FieldbyName('PERCENTUAL').AsString;
  End;
End; { BUSCAPERCENTUAL }

{******************************************************************************}
{ Formula, VLRCALCINSS ( VLRCALCINSS )                                         }
{   Retorna o valor calculado do INSS na tabela BENEFBFCIARIO                  }
{------------------------------------------------------------------------------}
Function VLRCALCINSS(Regra : TRegra; Formula : String) : String;
Var
  FormulaAux, sSql, sDataInicio : String;

  I, iIdPessoa, iIdPessjur, iIdPlanoPrev, iSeqProposta : Integer;
Begin
  Result := '';
  FormulaAux := Copy(Formula,17,length(Formula));
  FormulaAux := Copy(FormulaAux,1,Length(FormulaAux)-1);

  { Guarda Dados da Consulta de Entrada }
  iIdPessoa    := Regra.QueryIn.FieldbyName('IDPESSOA').AsInteger;
  iIdPessjur   := Regra.QueryIn.FieldbyName('IDPESSJUR').AsInteger;
  iIdPlanoPrev := Regra.QueryIn.FieldbyName('IDPLANOPREV').AsInteger;
  iSeqProposta := Regra.QueryIn.FieldbyName('SEQPROPOSTA').AsInteger;
  sDataInicio  := Regra.QueryIn.FieldbyName('DATAINICIO').AsString;

  { Monta Consulta }
  sSql := 'SELECT '+
          '  VLRCALCINSS '+
          'FROM   '+
          '  BENEFBFCIARIO ' +
          'WHERE '+
          '  (IDPESSJUR   =  '+ IntToStr(iIdPessJur)   +') AND '+
          '  (IDPESSOA    =  '+ IntToStr(iIdPessoa)    +') AND '+
          '  (IDPLANOPREV =  '+ IntToStr(iIdPlanoPrev) +') AND '+
          '  (SEQPROPOSTA =  '+ IntToStr(iSeqProposta) +') AND '+
          '  (DATAINICIO  =  TO_DATE('+ QuotedStr(sDataInicio)  +',''DD/MM/YYYY''))';
  { Executa a Consulta e testa resultados }
  If Not FazQuery(Regra.QueryRegra,sSQL) Then Begin
    Result := '0';
   End Else Begin
    Result := Regra.QueryRegra.FieldbyName('VLRCALCINSS').AsString;
  End;

End; { VLRCALCINSS }

{******************************************************************************}
{ Formula, DADOSPATROANT ( DADOSPATROANT([VARIAVEL DE RETORNOn], [FLGCAMPOn]) )}
{   Retorna o Plano e a Data de inscrição do plano a anterior ao atual.        }
{------------------------------------------------------------------------------}
Function DADOSPATROANT(Regra : TRegra; Formula : String) : String;
Type
  RecResult = Record
               Variavel,
               FlgCampo,
               Valor     : String;
              End;
Var
  FormulaAux, sSQL, sVarsRetorno, sFlgsCampo : String;

  I, W, iIdPessoa, iIdPessjur : Integer;

  VetRecResult : Array[1..7] Of RecResult;
  VetCampos    : Array[1..7] Of String;
Begin
  Result := '';
  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }
  FormulaAux := Copy(Formula,   15, Length(Formula));
  FormulaAux := Copy(FormulaAux, 2, Length(FormulaAux)); { Retira primeiro e ultimo colchete aberto [ e ] }
  FormulaAux := Copy(FormulaAux, 1, Length(FormulaAux)-2);

  { Guarda Variaveis de Retorno }
  I := Pos(']', FormulaAux);
  sVarsRetorno := Copy(FormulaAux,1,I-1);
  For I := 1 To 7 Do Begin
    W := Pos(',', sVarsRetorno);
    If W = 0 Then W := (Length(sVarsRetorno)+1);

    VetRecResult[I].Variavel := Copy(sVarsRetorno,1,W-1);

    { Acerta Variavel }
    If Copy(VetRecResult[I].Variavel,1,1) = '@' Then Begin
      VetRecResult[I].Variavel :=
        Copy(VetRecResult[I].Variavel, 2, Length(VetRecResult[I].Variavel));
    End;

    { Atualiza Lista de variaveis }
    sVarsRetorno := Copy(sVarsRetorno,(W+1) ,Length(sVarsRetorno));
    If Trim(sVarsRetorno) = '' Then Break;

  End;

  { Guarda Flags dos Campos }
  I := Pos('[', FormulaAux);
  sFlgsCampo := Copy(FormulaAux,(I+1),Length(FormulaAux) );
  For I := 1 To 7 Do Begin
    W := Pos(',', sFlgsCampo);
    If W = 0 Then W := (Length(sFlgsCampo)+1);

    VetRecResult[I].FlgCampo := Copy(sFlgsCampo,1 ,W-1);

    { Atualiza Lista de variaveis }
    sFlgsCampo := Copy(sFlgsCampo,(W+1) ,Length(sFlgsCampo));
    If Trim(sFlgsCampo) = '' Then Break;
  End;
  { Fim da Decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Guarda Dados da Consulta de Entrada }
  iIdPessoa    := Regra.QueryIn.FieldbyName('IDPESSOA').AsInteger;

  { Monta Consulta }
  sSql := 'SELECT '+
          '  IDSITFUNC, DATAADMISSAO, TEMPOSERVANTERIOR, TEMPOSERVTOTAL, '+
          '  VALORBASE1, VALORBASE2, VALORBASE3                          '+
          'FROM   '+
          '  ELEGPATRO    ' +
          'WHERE '+
          { '  (IDPESSJUR   =  '+ IntToStr(iIdPessJur)   +') AND '+ }
          '  (IDPESSOA    =  '+ IntToStr(iIdPessoa)    +')     '+
          'ORDER  BY '+
          '  DATAADMISSAO  DESC  ';
  { Executa a Consulta e testa resultados }
  If Not (FazQuery(Regra.QueryRegra,sSQL)) Or (Regra.QueryRegra.RecordCount = 1) Then Begin
    Result := 'FALSO';
    Exit;
  End Else Begin
    Result := 'VERDADEIRO';
    { Proximo Registro, pois 1º é a patrocinadora atual  }
    Regra.QueryRegra.Next;

    { Guarda resultados }
    VetCampos[1] := Regra.QueryRegra.FieldbyName('IDSITFUNC').AsString;
    VetCampos[2] := Regra.QueryRegra.FieldbyName('DATAADMISSAO').AsString;
    VetCampos[3] := Regra.QueryRegra.FieldbyName('TEMPOSERVANTERIOR').AsString;
    VetCampos[4] := Regra.QueryRegra.FieldbyName('TEMPOSERVTOTAL').AsString;
    VetCampos[5] := Regra.QueryRegra.FieldbyName('VALORBASE1').AsString;
    VetCampos[6] := Regra.QueryRegra.FieldbyName('VALORBASE2').AsString;
    VetCampos[7] := Regra.QueryRegra.FieldbyName('VALORBASE3').AsString;
  End;

  { Atualiza variaveis de retorno informadas }
  For I := 1 To 7 Do Begin
    { Caso terminado sai fora }
    If VetRecResult[I].Variavel = '' Then Break;
    { Pega valor e seta variavel Regra }
    VetRecResult[I].Valor := VetCampos[StrToInt(VetRecResult[I].FlgCampo)];
    Regra.SetVariavel(VetRecResult[I].Variavel,VetRecResult[I].Valor ,VetRecResult[I].Variavel);
  End;

End; { DADOSPATROANT }

{******************************************************************************}
{ Formula, CALCULASALPART ( CALCULASALPART(ANOMESREF) )                        }
{   Retorna a Soma das rubricas que compoes o salarior de Participação no Mês. }
{------------------------------------------------------------------------------}
Function CALCULASALPART(Regra : TRegra; Formula : String) : String;
Var
  FormulaAux, sSQL, sMes : String;

  I, iIdPessoa, iIdPessjur, iIdPlanoPrev, iSeqProposta : Integer;
Begin
  Result := '';
  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }
  FormulaAux := Copy(Formula,   16, Length(Formula));
  FormulaAux := Copy(FormulaAux, 1, Length(FormulaAux)-1); { Retira ")" }

  { Guarda Mes de Referencia }
  sMes := Copy(FormulaAux, 1, Length(FormulaAux));
  sMes := Regra.PegaValor(sMes);

  { Fim da Decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Guarda Dados da Consulta de Entrada }
  iIdPessoa    := Regra.QueryIn.FieldbyName('IDPESSOA').AsInteger;
  iIdPessjur   := Regra.QueryIn.FieldbyName('IDPESSJUR').AsInteger;

  { Monta Consulta }
  sSQL := 'SELECT '+
          '  SUM(DECODE(P.FLGDESCONTO,0,VALORPROVENTO,0)+'+
          '      DECODE(P.FLGDESCONTO,1,(VALORPROVENTO*-1),0)) AS VALORPROVENTO '+
          'FROM   '+
          '  HISTRUBSAL H, PROVDESC P '+
          'WHERE  '+
          '  (H.IDPESSOA  = '+ IntToStr(iIdPessoa)  +') AND '+
          '  (H.'+Regra.sCampoPesquisa+' = '+ IntToStr(iIdPessJur) +') AND '+
          '  (H.MES       = '+ QuotedStr(sMes)      +') AND '+
          '  (H.IDRUBRICA = P.IDPROVENTO ) AND '+
          '  (P.FLGCOMPOESALPART = 1) AND '+
          '  (P.FLGDESCONTO <> 2) ';

  { Executa a Consulta e testa resultados }
  If Not (FazQuery(Regra.QueryRegra,sSQL)) Then Begin
    Result := '0';
    Exit;
  End Else Begin
    Result := Regra.QueryRegra.FieldbyName('VALORPROVENTO').AsString;
  End;

End; { CALCULASALPART }

{******************************************************************************}
{ Rotina auxiliar BUSCAINDICEREAJSALPATRO                                      }
{ Retorna o indice acumulado de um determinado mês para uma determinada patro  }
{ baseado na tabela de reajuste da patrocinadora                               }
function BuscaIndiceReajSalPatro( psProxMesAnoBuscar : string ) : double;
var dIndiceAcumulado, dIndice : double;
    i : word;
begin
   dIndiceAcumulado := 1;
   for i := 1 to 60 do
   begin
      if aTabIndice2[i].AnoMes = psProxMesAnoBuscar
      then begin
         dIndiceAcumulado := aTabIndice2[i].IndiceAcumulado;
         break;
      end;
   end;
   Result := dIndiceAcumulado;
end;

function CarregaTabIndice2( Regra: TRegra;
                            psIdPessJur,
                            psIdPessoa,
                            sRubricasAConsiderar,
                            vGruposAConsiderar,
                            psDIB,
                            psNumMeses : string; sFiltrapatro : String = 'S') : boolean;
type
   TPeriodoReajuste = Record
                         AnoMesInicio      : string;
                         AnoMesFinal       : string;
                       End;

var dIndiceAcumulado,
    dIndiceProRata,
    dUltimoIndice,
    dIndice,
    dIndiceAux,
    dSalarioNoMes          : double;
    sAux,
    sData1,
    sData2,
    sAnoMesInicio,
    sAnoMesFinal,
    sAnoMesAtual,
    sAnoMesReajAntesPeriodo,
    sConsulta,
    sUltAnoMesReaj,
    sIndice,
    sSQL             : string;
    iCtrlPeriodo,
    i                : word;
    iDifMeses,
    iNumMeses,
    iTotPeriodo      : integer;
    aTabPeriodo      : array[1..60] of TPeriodoReajuste;
    sNomeTabReaj     : string;
    sColTabReaj      : string;
    sMatricula       : string;
    // -------------------------------------------------------------------------
    //                           ROTINAS AUXILIARES
    // -------------------------------------------------------------------------

    function AnoMesAnteriorLocal(iMes, iAno : integer) : string;
    var sAnoMes : string;
    begin
      Result := '';
      if iMes = 1
      then begin
         sAnoMes := IntToStr(iAno-1)+'/';
         sAnoMes := sAnoMes+'12';
      end
      else begin
        sAnoMes := IntToStr(iAno)+'/';
        iMes := iMes - 1;
        if iMes <= 9
        then sAnoMes := sAnoMes+'0'+IntToStr(iMes)
        else sAnoMes := sAnoMes+IntToStr(iMes);
      end;
      Result := sAnoMes;
    end;//AnoMesAnteriorLocal
    // -------------------------------------------------------------------------
    function SAnoMesAnterior(sAnoMes : string) : string;
    var iAno, iMes : integer;
    begin
       Result := '';
       iAno := StrToInt(Copy(sAnoMes,1,4));
       iMes := StrToInt(Copy(sAnoMes,6,2));
       Result := AnoMesAnteriorLocal(iMes,iAno);
    end;

    function ClienteNumero(sNumero : string):string;
    var i : integer;
        sResult,
        sCliente : string;
        bPrimPonto : boolean;
    begin
       if Trim(sNumero)  = ''
       then begin
          Result := '0';
          exit;
       end;

       sCliente := '';
       bPrimPonto := False;
       for i := length(Trim(sNumero)) downto 1
       do begin
         if sNumero[i] = '.'
         then begin
            if not bPrimPonto
            then begin
               sCliente := sCliente + DecimalSeparator;
               bPrimPonto := True;
            end
            else sCliente := sCliente;
         end
         else begin
            if sNumero[i] <> DecimalSeparator
            then sCliente := sCliente + sNumero[i]
            else begin
               if not bPrimPonto
               then begin
                  sCliente := sCliente+DecimalSeparator;
                  bPrimPonto := True;
               end
               else sCliente := sCliente;
            end;
         end;
       end;
       sResult := '';
       for i := length(sCliente) downto 1
       do begin
          sResult := sResult + sCliente[i];
       end;
       Result := sResult;
    end;

    function OraNumero(sNumero : string):string;
    var i : integer;
        sResult,
        sOra : string;
        bPrimPonto : boolean;
    begin
       if Trim(sNumero)  = ''
       then begin
          Result := '0';
          exit;
       end;
       sOra := '';
       bPrimPonto := False;
       for i := length(Trim(sNumero)) downto 1
       do begin
         if sNumero[i] = ','
         then begin
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
       for i := length(sOra) downto 1
       do begin
          sResult := sResult + sOra[i];
       end;
       Result := sResult;
    end;


    // -------------------------------------------------------------------------
    //                         FIM DAS ROTINAS AUXILIARES
    // -------------------------------------------------------------------------

begin
   // -------------------------------------------------------------------------
   //                         ROTINA PRINCIPAL
   // -------------------------------------------------------------------------
   Result           := False;
   dIndiceAcumulado := 0;
   dIndice          := 0;
   dIndiceAux       := 0;
   iNumMeses        := Abs(StrToInt(psNumMeses));

   sAnoMesInicio    := SAnoMesAnterior(Copy(psDIB,7,4)+'/'+Copy(psDIB,4,2));
   sAnoMesFinal     := sAnoMesInicio;
   for i := 1 To iNumMeses-1 do
       sAnoMesFinal := SAnoMesAnterior(sAnoMesFinal);

   for i := 1 to 60 do
   begin
       aTabPeriodo[i].AnoMesInicio := '0000/00';
       aTabPeriodo[i].AnoMesFinal  := '0000/00';
       aTabIndice2[i].Reajuste          := 0;
       aTabIndice2[i].Indice            := 1;
       aTabIndice2[i].IndiceProRata     := 1;
       aTabIndice2[i].IndiceAcumulado   := 1;
       aTabIndice2[i].Teto              := 0;
       aTabIndice2[i].Salario           := 0;
       aTabIndice2[i].SalarioReajustado := 0;
   end;

   sAnoMesAtual     := sAnoMesInicio;
   sUltAnoMesReaj   := '0000/00';
   i                := 0;
   iTotPeriodo      := 0;
   dUltimoIndice    := 1;

   { Buscar somente a matricula na ELEGPATRO }
   sSQL := 'SELECT MATRICULA FROM ELEGPATRO WHERE IDPESSOA = '+psIdPessoa;
   If FazQuery(Regra.QueryRegra, sSQL) Then Begin
     sMatricula := Regra.QueryRegra.FieldByName('MATRICULA').AsString;
   End;

   // buscar salário no 1o. mes do periodo para utilizá-lo para buscar todos os indices
   sSQL := ' SELECT H.MES, SUM(DECODE(P.FLGDESCONTO,0,H.VALORPROVENTO, -H.VALORPROVENTO)) AS VALORPROVENTO '+
           ' FROM   HISTRUBSAL H, PROVDESC P                                                              '+
           ' WHERE  H.IDPESSOA   = '+psIdPessoa;
   If sFiltraPatro = 'S' Then
     sSQL := sSQL +
           ' AND    H.IDPATRO    = '+psIdPessJur;
     sSQL := sSQL +
           ' AND    H.MES        = '''+sAnoMesFinal+''''+
           ' AND    H.IDRUBRICA NOT IN (21737, 22499) ';


   if Trim(sRubricasAConsiderar) = ''
   then sSQL := sSQL +' AND  P.IDGRUPORUBRICA = ''A''  '
   else sSQL := sSQL +' AND  (                                                     '+
                 '         (P.IDGRUPORUBRICA = ''A'' ) OR '+
                          sRubricasAConsiderar+
                 '       ) ';

   sSQL := sSQL +' AND  H.IDRUBRICA = P.IDPROVENTO ';
   sSQL := sSQL +' GROUP BY H.MES ';
   sSQL := sSQL +
          ' UNION ALL SELECT H.MES, '+
          '        GREATEST(SUM(DECODE(H.VALORPROVENTO,2000, H.VALORPROVENTO, -H.VALORPROVENTO)),0) AS VALORPROVENTO '+
          ' FROM   HISTRUBSAL H, PROVDESC P '+
          ' WHERE  H.IDPESSOA   = '+psIdPessoa;
   If sFiltraPatro = 'S' Then
     sSQL := sSQL +
          ' AND    H.IDPATRO    = '+psIdPessJur;
     sSQL := sSQL +
          ' AND    H.MES        = '''+sAnoMesFinal+'''';
   sSQL := sSQL +' AND H.IDRUBRICA IN (21737, 22499)';
   sSQL := sSQL +' AND  H.IDRUBRICA = P.IDPROVENTO '+
                 ' GROUP BY H.MES    ';

   If FazQuery(Regra.QueryRegra, sSQL) then
     dSalarioNoMes := Regra.QueryRegra.FieldByName('VALORPROVENTO').AsFloat
   else
     dSalarioNoMes := 0;

   // Preencher INDICE
   while sAnoMesAtual >= sAnoMesFinal do
   begin
      inc(i);

      aTabIndice2[i].AnoMes   := sAnoMesAtual;
      aTabIndice2[i].Indice   := dUltimoIndice;

      // Buscar nome da tabela de reajuste para esta patrocinadora neste mes
      sConsulta               := '[#ANOMES='+sAnoMesAtual+','+
                                  '#PATRO='+psIdPessJur+']#TABREAJUSTES,#NOMETAB,1';
      sNomeTabReaj            := Regra.CONSULTA(sConsulta);

      if Trim(sNomeTabReaj) = '0'
      then begin
         sAnoMesAtual            := SAnoMesAnterior(sAnoMesAtual);
         continue;
      end;

      sConsulta               := '[#ANOMES='+sAnoMesAtual+','+
                                  '#PATRO='+psIdPessJur+']#TABREAJUSTES,#COLUNAABUSCAR,1';
      sColTabReaj             := Regra.CONSULTA(sConsulta);

      if Trim(sColTabReaj) = '0'
      then begin
         sAnoMesAtual            := SAnoMesAnterior(sAnoMesAtual);
         continue;
      end;

      sConsulta               := '[#MATRICULA='+sMatricula+']#'+sNomeTabReaj+',#'+sColTabReaj+',1';
      sIndice                 := Regra.CONSULTA(sConsulta);

      if StrToFloat(ClienteNumero(sIndice)) <= 0
      then begin
         sAnoMesAtual            := SAnoMesAnterior(sAnoMesAtual);
         continue;
      end;

      sIndice                 := ClienteNumero(sIndice);

      if StrToFloat(ClienteNumero(sIndice)) > 1
      then sIndice := FloatToStr(StrToFloat(sIndice)/100+1);

      aTabIndice2[i].AnoMes   := sAnoMesAtual;
      aTabIndice2[i].Reajuste := StrToFloat(sIndice);
      dUltimoIndice           := StrToFloat(sIndice);
      inc(iTotPeriodo);
      aTabPeriodo[iTotPeriodo].AnoMesInicio := sUltAnoMesReaj;
      aTabPeriodo[iTotPeriodo].AnoMesFinal  := sAnoMesAtual;
      sUltAnoMesReaj          := sAnoMesAtual;
      sAnoMesAtual            := SAnoMesAnterior(sAnoMesAtual);
   end; // while

   // Completar tabela até o ultimo reajusta imediatamente anterior ao periodo
   sSQL := ' SELECT MAX(VALOR) AS MAIORANOMES                              '+
           ' FROM   VALTABGENER                                            '+
           ' WHERE  CODTABELA = ''TABREAJUSTES''                           '+
           ' AND    CODCAMPO  = ''ANOMES''                                 '+
           ' AND    NUMLINHA  IN (SELECT NUMLINHA                          '+
           '                      FROM   VALTABGENER                       '+
           '                      WHERE  CODTABELA = ''TABREAJUSTES''      '+
           '                      AND    CODCAMPO  = ''PATRO''             '+
           '                      AND    VALOR     = '''+psIdPessJur+''')  '+
           ' AND    VALOR     < '''+sAnoMesFinal+'''                       ';

   FazQuery(Regra.QueryRegra, sSQL);
   if (Regra.QueryRegra.IsEmpty) or (Regra.QueryRegra.FieldByName('MAIORANOMES').AsString = '')
   then sAnoMesReajAntesPeriodo := sAnoMesFinal
   else sAnoMesReajAntesPeriodo := Regra.QueryRegra.FieldByName('MAIORANOMES').AsString;

   inc(iTotPeriodo);
   aTabPeriodo[iTotPeriodo].AnoMesInicio := sUltAnoMesReaj;
   aTabPeriodo[iTotPeriodo].AnoMesFinal  := sAnoMesReajAntesPeriodo;


   aTabPeriodo[1].AnoMesInicio := sAnoMesInicio;

   // Calcular Indice Pro-Rata
   // O ultimo periodo ( mais recente ) não tem pro-rata pois os indices são 1,
   // por isto o FOR começa no periodo 2
   for iCtrlPeriodo := 2 to iTotPeriodo do
   begin
      // Prepara para executar a formula DIFMESES ( menor data, maior data )
      sData1 := '01/'+Copy(aTabPeriodo[iCtrlPeriodo].AnoMesInicio,6,2)+'/'+Copy(aTabPeriodo[iCtrlPeriodo].AnoMesInicio,1,4);
      sData2 := '01/'+Copy(aTabPeriodo[iCtrlPeriodo].AnoMesFinal,6,2) +'/'+Copy(aTabPeriodo[iCtrlPeriodo].AnoMesFinal,1,4);

      Regra.sFormulaAux:='DIFMESES(#'+sData1+',#'+sData2+')';
      Regra.DIFMESES;
      iDifMeses := StrToInt(Regra.Result);

      for i := 1 to iNumMeses do
      begin
         if aTabIndice2[i].Reajuste > 0
         then begin
            dIndiceAux := aTabIndice2[i].Reajuste;
            // Se for um mês de reajuste no meio de um periodo com outro reajuste
            // entao usar o reajuste anterior
            if aTabIndice2[i].AnoMes = aTabPeriodo[iCtrlPeriodo+1].AnoMesInicio
            then dIndice := dIndice
            else dIndice := dIndiceAux;
         end;

         if (aTabIndice2[i].AnoMes >= aTabPeriodo[iCtrlPeriodo].AnoMesFinal) and
            (aTabIndice2[i].AnoMes < aTabPeriodo[iCtrlPeriodo].AnoMesInicio)
         then begin
            if dIndice > 1 // Verificar se o indice já está com 1 somado para o mes de reajuste o indice é 1
            then dIndiceProRata := Power ( (0 + dIndice), ( 1 / iDifMeses ) )
            else dIndiceProRata := Power ( (1 + dIndice), ( 1 / iDifMeses ) );
            aTabIndice2[i].IndiceProRata := dIndiceProRata;
         end;

         dIndice := dIndiceAux;

      end;
   end;// calculo de pro-rata dos periodos

   // Calcular Indice Acumulado
   for i := 1 to iNumMeses do
   begin
     if aTabIndice2[i].AnoMes = sAnoMesInicio
     then dIndiceAcumulado := 1
     else dIndiceAcumulado := aTabIndice2[i-1].IndiceAcumulado * aTabIndice2[i].IndiceProRata;
     aTabIndice2[i].IndiceAcumulado := dIndiceAcumulado;
   end;

   // Arredondar indices
   for i := 1 to iNumMeses do
   begin
     aTabIndice2[i].IndiceAcumulado := Regra.ArredValor(aTabIndice2[i].IndiceAcumulado,7);
     aTabIndice2[i].IndiceProRata   := Regra.ArredValor(aTabIndice2[i].IndiceProRata  ,7);
   end;

   Result := True;
end;

{==============================================================================}
{ Formula, ENTREDATAS (ENTREDATAS(DATAINICIO, DATAFIM, DATAREFERENCIA)         }
{   Retorna "True" se a DATAREFERENCIA estiver entre DATAINICIO e DATAFIM      }
{   exclusível, e "False" se não.                                              }
{------------------------------------------------------------------------------}
Function ENTREDATAS(Regra : TRegra; Formula : String) : String;
Var
  sDataInicio , sDataFim, sDataRef, sTipoVerific,
  FormulaAux : String;
  I : Integer;
Begin
  sTipoVerific := '0';
  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }

  { Retira Nome da Formula }
  FormulaAux := Trim(Copy(Formula,12,Length(Formula)));
  FormulaAux := Copy(FormulaAux,1,Length(FormulaAux)-1);

  { Pega Data Inicio }
  I := Pos(',', FormulaAux);
  sDataInicio := Copy(FormulaAux,1,(I-1));
  sDataInicio := Regra.PegaValor(sDataInicio);

  { Pega Data Fim }
  FormulaAux := Copy(FormulaAux,(I+1), Length(FormulaAux));
  I := Pos(',', FormulaAux);
  sDataFim := Copy(FormulaAux,1,(I-1));
  sDataFim := Regra.PegaValor(sDataFim);

  { Pega Data de Referencia }
  FormulaAux := Copy(FormulaAux,(I+1), Length(FormulaAux));
  I := Pos(',', FormulaAux);
  sDataRef := Copy(FormulaAux,1,(I-1));
  sDataRef := Regra.PegaValor(sDataRef);

  { Pega Tipo de Verificação }
  FormulaAux := Copy(FormulaAux,(I+1), Length(FormulaAux));
  I := Pos(',', FormulaAux);
  sTipoVerific := Copy(FormulaAux,1,Length(FormulaAux));
  sTipoVerific := Regra.PegaValor(sTipoVerific);
  { Fim da Decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  Result := 'FALSE';
  { Verifica Incluindo Limites }
  If sTipoVerific = '0' Then Begin
    If (StrToDate(sDataRef) < StrToDate(sDataFim)) And
       (StrToDate(sDataRef) > StrToDate(sDataInicio)) Then Begin
      Result := 'TRUE';
    End;
  End Else Begin
    If (StrToDate(sDataRef) <= StrToDate(sDataFim)) And
       (StrToDate(sDataRef) >= StrToDate(sDataInicio)) Then Begin
      Result := 'TRUE';
    End;
  End;

End; { ENTREDATAS }

{******************************************************************************}
{ Formula, VALORSRB(ANOMES,BENEFICIO)                                          }
{   Retorna o valor do SRB de um beneficio em um ANO/MES.                      }
{------------------------------------------------------------------------------}
Function VALORSRB(Regra : TRegra; Formula : String) : String;
Var
  sDataRef, sBeneficio, sFormulaAux, sAnoMesRef,
  sIdPessJur, sIdPessoa, sIdTitular, sIdPlanoPrev,
  sSeqProposta,
  sSQL : String;
  I :Integer;
Begin
  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }

  { Retira Nome da Formula }
  sFormulaAux := Copy(Formula,10,Length(Formula));
  sFormulaAux := Copy(sFormulaAux,1,Length(sFormulaAux)-1);

  { Continua a decodificar a Formula }
  I := Pos(',', sFormulaAux);
  { Pega Data de Referencia }
  sAnoMesRef := Copy(sFormulaAux,1,I-1);
  sAnoMesRef := Regra.PegaValor(sAnoMesRef);

  { Continua a decodificar a Formula }
  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));
  { Pega Periodo }
  I := Pos(',', sFormulaAux);
  sBeneficio := Copy(sFormulaAux,1,Length(sFormulaAux));
  sBeneficio := Regra.PegaValor(sBeneficio);

  { Fim da decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Verifica Campos Obrigatórios }
  If Regra.FQueryIn.FindField('IDPESSOA') = NIL Then Begin                      { IDPESSOA }
    MsgDlg('Campo IDPESSOA, necessário no Sql de entrada ',
           'Regra - Erro',mtError,[mbOk],0);
    Regra.fError := True;
    Exit;
  End;

  { Guarda Dados do Processo }
  sIdPessJur   := Regra.FQueryIn.FieldByName('IDPESSJUR').AsString;
  sIdTitular   := Regra.FQueryIn.FieldByName('IDTITULAR').AsString;
  sIdPessoa    := Regra.FQueryIn.FieldByName('IDPESSOA').AsString;
  sIdPlanoPrev := Regra.FQueryIn.FieldByName('IDPLANOPREV').AsString;
  sSeqProposta := Regra.FQueryIn.FieldByName('SEQPROPOSTA').AsString;

  { Monta SQL }
  sSQL := 'SELECT VALORSRB '+
          'FROM     '+
          '  HSTBENEFBFCIARIO H '+
          'WHERE            '+
          '  H.IDPESSJUR   = '+sIdPessJur+   ' AND '+
          '  H.IDPLANOPREV = '+sIdPlanoPrev+ ' AND '+
          '  H.IDTITULAR   = '+sIdTitular+   ' AND '+
          '  H.IDPESSOA    = '+sIdPessoa +   ' AND '+
          '  H.SEQPROPOSTA = '+sSeqProposta+ ' AND '+
          '  H.MESREFERENCIA  = '+QuotedStr(sAnoMesRef)+ ' AND '+
          '  H.IDBENEFICIO    = '+sBeneficio + '     ';

  If Not FazQuery(Regra.QueryRegraAux, sSql) Then Begin
    Result := '0';
    Exit;
  End;
  { Seta Resultado }
  Result := Regra.QueryRegraAux.FieldByName('VALORSRB').AsString;

  If Trim(Result) = '' Then
    Result := '0';

End; { VALORSRB }

{==============================================================================}
{ Formula, COTACAORENFIX (COTACAORENFIX(DATAREFERECIA, DATAVENCIMENTO, INVESTIMENTO)) }
{   Retorna a cotação de um investimento de Renda Fixa que vence em uma        }
{   determinada data de referencia.                                            }
{------------------------------------------------------------------------------}
Function COTACAORENFIX(Regra : TRegra; Formula : String) : String;
Var
  sDataRef , sDataVenc, sIdInvestimento, FormulaAux,
  sSQL : String;
  I : Integer;
Begin
  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }

  { Retira Nome da Formula }
  FormulaAux := Trim(Copy(Formula,15,Length(Formula)));
  FormulaAux := Copy(FormulaAux,1,Length(FormulaAux)-1);

  { Pega Data Inicio }
  I := Pos(',', FormulaAux);
  sDataRef := Copy(FormulaAux,1,(I-1));
  sDataRef := Regra.PegaValor(sDataRef);

  { Pega Data Fim }
  FormulaAux := Copy(FormulaAux,(I+1), Length(FormulaAux));
  I := Pos(',', FormulaAux);
  sDataVenc := Copy(FormulaAux,1,(I-1));
  sDataVenc := Regra.PegaValor(sDataVenc);

  { Pega Tipo de Verificação }
  FormulaAux := Copy(FormulaAux,(I+1), Length(FormulaAux));
  I := Pos(',', FormulaAux);
  sIdInvestimento := Copy(FormulaAux,1,Length(FormulaAux));
  sIdInvestimento := Regra.PegaValor(sIdInvestimento);

  { Fim da Decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Monta e executa pesquisa no banco }
  sSQL := 'SELECT  '+
          '  VLRCOTACAO    '+
          'FROM    '+
          '  COTACAORENFIX '+
          'WHERE   '+
          '  DATACOTACAO <= TO_DATE('+QuotedStr(sDataRef) +',''DD/MM/YYYY'') AND '+
          '  DATAVENCTO  = TO_DATE('+QuotedStr(sDataVenc)+',''DD/MM/YYYY'') AND '+
          '  IDINVESTIMENTO = '+ sIdInvestimento+' '+
          'ORDER BY '+
          '  DATACOTACAO DESC ';

  If Not FazQuery(Regra.QueryRegraAux, sSQL) Then Begin
    Result := '0';
    Exit;
  End;
  Result := Regra.QueryRegraAux.FieldByName('VLRCOTACAO').AsString;
End; { COTACAORENFIX }

{==============================================================================}
{ Formula, BUSCADETCALCULO (BUSCADETCALCULO(VALOR A PESQUISAR ))               }
{   Busca um determinado valor na tabela de Cetalhes de Calculo do Regra       }
{   (DETCALCULO).                                                              }
{------------------------------------------------------------------------------}
Function BUSCADETCALCULO(Regra : TRegra; Formula : String) : String;
Var
  sValor, FormulaAux, sSQL, sSQLComplemento, sUpper,
  sIdPessoa, sTipoCalculo, sTrataCaixa, sParFinal : String;
  I : Integer;
  sValorRet        : string;
  bExisteLetra     : boolean;

Begin
  sTipoCalculo := 'C';
  sTrataCaixa  := 'S';

  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }

  { Retira Nome da Formula }
  FormulaAux := Trim(Copy(Formula,17,Length(Formula)));
  FormulaAux := Copy(FormulaAux,1,Length(FormulaAux)-1);

  { Pega valor a pesquisar }
  I := Pos(',', FormulaAux);
  If I <= 0 Then I := Length(FormulaAux) Else I := (I - 1) ;
  sValor := Copy(FormulaAux,1,I);
  sValor := Regra.PegaValor(sValor);

  { Pega Tipo de Pesquisa }
  FormulaAux := Copy(FormulaAux,(I+2), Length(FormulaAux));
  I := Pos(',', FormulaAux);
  If I <= 0 Then I := Length(FormulaAux) Else I := (I - 1) ;
  sTipoCalculo := Trim(Copy(FormulaAux,1,(I)));
  sTipoCalculo := Regra.PegaValor(sTipoCalculo);

  { Pega Data Fim }
  FormulaAux := Copy(FormulaAux,(I+2), Length(FormulaAux));
  I := Pos(',', FormulaAux);
  If I <= 0 Then I := Length(FormulaAux) Else I := (I - 1) ;
  sTrataCaixa := Trim(Copy(FormulaAux,1,(I)));
  sTrataCaixa := Regra.PegaValor(sTrataCaixa);
  //Inicio - Andre SOL 136384/11583 Kintana 1797827

  { Pega  o IDPESSOAPESQUISA }
  FormulaAux := Copy(FormulaAux,(I+2), Length(FormulaAux));
  I := Pos(',', FormulaAux);
  If I <= 0 Then I := Length(FormulaAux) Else I := (I - 1) ;
  sIdPessoa := Trim(Copy(FormulaAux,1,(I)));
  sIdPessoa := Regra.PegaValor(sIdPessoa);


  { Fim da Decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Caso esteja executando com tabela auxiliar  busca dados nela }
  {
  If Regra.TemQuery Then Begin
    sIdPessoa := Regra.QryOutraRegra.FieldByName('IDPESSOA').AsString;
  End Else Begin
    sIdPessoa := Regra.FQueryIn.FieldByName('IDPESSOA').AsString;
  End;
  }
  if(sIdPessoa = '')then
  begin
      If Regra.TemQuery Then Begin
        sIdPessoa := Regra.QryOutraRegra.FieldByName('IDPESSOA').AsString;
      End Else Begin
        sIdPessoa := Regra.FQueryIn.FieldByName('IDPESSOA').AsString;
      End;
  end;
  //Fim - Andre SOL 136384/11583 Kintana 1797827
  { Trata comparação de CAIXA }
  If sTrataCaixa = 'N' Then Begin
    sUpper    := 'UPPER(';
    sParFinal := ')';
  End Else Begin
    sUpper    := '';
    sParFinal := '';
  End;

  { Monta e executa pesquisa no banco }
  If sTipoCalculo = 'D' Then Begin
    sSQLComplemento := '  ORDER BY TRGDTINCLUSAO DESC';
  End Else Begin
    sSQLComplemento := '  AND IDCALCULO = (SELECT MAX(D.IDCALCULO) FROM DETCALCULO D '+
                       ' WHERE IDPESSOA = '+sIdPessoa+' AND RTRIM('+sUpper+'D.DESCRICAO)'+sParFinal+' = '+QuotedStr(Trim(sValor))+') ';
  End;

  sSQL := 'SELECT  '+
          '  VALOR         '+
          'FROM    '+
          '  DETCALCULO    '+
          'WHERE   '+
          '  IDPESSOA  = '+sIdPessoa+' AND '+
          '  RTRIM('+sUpper+'DESCRICAO)'+sParFinal+' = '+QuotedStr(Trim(sValor))+' '+
          sSQLComplemento;

  if not FazQuery(Regra.QueryRegraAux,sSQL) then begin
    Result := '0';
    Exit;
  End;
  // TRATAMENTO DE VALORES NUMERICOS POIS ESTÁ RETORNANDO NUMEROS COM SEPARADOR DE MILHAR
  // Exemplo : 21.906,75210
  sValorRet           := Regra.QueryRegraAux.FieldByName('VALOR').AsString;
  bExisteLetra     := False;

  for i := 1 to Length(sValorRet) do
  begin
     if not (sValorRet[i] in ['0','1','2','3','4','5','6','7','8','9','.',','] )
     then begin
        bExisteLetra := True;
        break;
     end;
  end;

  if not bExisteLetra
  then begin
     if (Pos('.',sValorRet) > 0) and (Pos(',',sValorRet) > 0)
     then begin
        if Pos('.',sValorRet) < Pos(',',sValorRet)
        then begin // o ponto está como separador de milhar e a , como separador decimal
           sValorRet := Copy(sValorRet,1,Pos('.',sValorRet)-1)+Copy(sValorRet,Pos('.',sValorRet)+1,Length(sValorRet) );
           if DecimalSeparator = '.'
           then sValorRet:= StringReplace(sValorRet,',','.',[rfReplaceAll]);
        end
        else begin // a virgula está como separador de milhar e o ponto como separador decimal
           sValorRet := Copy(sValorRet,1,Pos(',',sValorRet)-1)+Copy(sValorRet,Pos(',',sValorRet)+1,Length(sValorRet) );
           if DecimalSeparator = ','
           then sValorRet:= StringReplace(sValorRet,'.',',',[rfReplaceAll]);
        end;
     end;
  end;

  Result := sValorRet;

End; { BUSCADETCALCULO }

{=============================================================================================}
{ Formula, SOMACONTRIB (SOMACONTRIB([MOTIVO1, MOTIVO2,..],MESREFERENCIA,[IDCONTR1,IDCONTR2..] }
{                                   FLGFILTRAPESSOA, FLGRETORNO, IDLOTE, FLGFILTRAPLANOPATRO, }
{                                   ANOMESCOBRANCA)                                           }
{  Retornar a soma dos valores recebidos, de uma determinada contribuição gravada             }
{  na HSTCONTRIBPREV, em determinado mês                                                      }
{---------------------------------------------------------------------------------------------}
Function SOMACONTRIB(Regra : TRegra; Formula : String) : String;
Var
  sAnoMesRef , sIdContribuicoes, sSQL, sIdLote, sFiltraPlanoPrev,
  FormulaAux, sIdMotivos, sMesCobranca : String;
  sIdPessJur, sIdPessoa, sIdPlanoPrev, sFlgCampoRetorno, sFiltraPessoa : String;
  VetMotivos    : Array[1..10] Of String;
  VetContribuicoes : Array[1..12] Of String;
  I, W : Integer;
Begin
  sFiltraPessoa    := '0';
  sFlgCampoRetorno := 'R';
  sFiltraPlanoPrev := 'S';
  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }

  { Retira Nome da Formula }
  FormulaAux := Trim(Copy(Formula,14,Length(Formula)));
  FormulaAux := Copy(FormulaAux,1,Length(FormulaAux)-1);

  { Pega Motivos }
  I := Pos(']', FormulaAux);
  sIdMotivos := Copy(FormulaAux,1,I-1);
  For I := 1 To 10 Do Begin
    W := Pos(',', sIdMotivos);
    If W = 0 Then W := (Length(sIdMotivos)+1);
    VetMotivos[I] := Copy(sIdMotivos,1,W-1);
    { Acerta Variavel }
    If Copy(sIdMotivos,1,1) = '@' Then Begin
      VetMotivos[I] := Copy(sIdMotivos, 2, Length(sIdMotivos));
    End;

    { Atualiza Lista de variaveis }
    sIdMotivos := Copy(sIdMotivos,(W+1) ,Length(sIdMotivos));
    If Trim(sIdMotivos) = '' Then Break;
  End;

  { Monta linha de motivos }
  For W := 1 To 10 do Begin
    { Caso Encontre o Mes, guarda }
    If (VetMotivos[W] <> '' ) Then Begin
      sIdMotivos := sIdMotivos + VetMotivos[W]+ ','
    End;
  End;
  sIdMotivos := Copy(sIdMotivos,1,(Length(sIdMotivos)-1));

  I := Pos(']', FormulaAux);
  FormulaAux := Copy(FormulaAux,I+1,Length(FormulaAux));

  { Pega Mes de Referencia  }
  I := Pos(',', FormulaAux);
  sAnoMesRef := Copy(FormulaAux,1,(I-1));
  sAnoMesRef := Regra.PegaValor(sAnoMesRef);

  { Pega Contribuicao }
  FormulaAux := Copy(FormulaAux,(I+1), Length(FormulaAux));
  I := Pos('[', FormulaAux);
  sIdContribuicoes := Copy(FormulaAux,I+1,Length(FormulaAux));
  I := Pos(']', sIdContribuicoes);
  sIdContribuicoes := Copy(sIdContribuicoes,1,I-1);

  For I := 1 To 12 Do Begin
    W := Pos(',', sIdContribuicoes);
    If W = 0 Then W := (Length(sIdContribuicoes)+1);
    VetContribuicoes[I] := Copy(sIdContribuicoes,1,W-1);
    { Acerta Variavel }
    If Copy(sIdContribuicoes,1,1) = '@' Then Begin
      VetContribuicoes[I] := Copy(sIdContribuicoes, 2, Length(sIdContribuicoes));
    End;
    VetContribuicoes[I] := Regra.PegaValor(VetContribuicoes[I]);

    { Atualiza Lista de variaveis }
    sIdContribuicoes := Copy(sIdContribuicoes,(W+1) ,Length(sIdContribuicoes));
    If Trim(sIdContribuicoes) = '' Then Break;
  End;

  { Monta linha de motivos }
  For W := 1 To 12 do Begin
    { Caso Encontre o Mes, guarda }
    If (VetContribuicoes[W] <> '' ) Then Begin
      sIdContribuicoes := sIdContribuicoes + VetContribuicoes[W]+ ','
    End;
  End;

  sIdContribuicoes := Copy(sIdContribuicoes,1,(Length(sIdContribuicoes)-1));

  { Pega Filtro de Pessoa }
  I := Pos(']', FormulaAux);
  FormulaAux := Copy(FormulaAux,(I+1), Length(FormulaAux));
  I := Pos(',', FormulaAux);
  If I <= 0 Then I := (Length(FormulaAux)+1);
  sFiltraPessoa := Copy(FormulaAux,1,I-1);
  sFiltraPessoa := Regra.PegaValor(sFiltraPessoa);

  { Pega Flag de campo para retorno, R - VALORRECEBIDO  E - VALORESPERADO }
  I := Pos(',', FormulaAux);
  If I > 0 Then Begin
    FormulaAux := Copy(FormulaAux,(I+1), Length(FormulaAux));
    I := Pos(',', FormulaAux);
    If I <= 0 Then I := (Length(FormulaAux)+1);
    sFlgCampoRetorno := Copy(FormulaAux,1,I-1);
    sFlgCampoRetorno := Regra.PegaValor(sFlgCampoRetorno);
  End;

  sIdLote := '';
  I := Pos(',', FormulaAux);
  If I > 0 Then Begin
    FormulaAux := Copy(FormulaAux,(I+1), Length(FormulaAux));
    I := Pos(',', FormulaAux);
    If I <= 0 Then I := (Length(FormulaAux)+1);
    sIdLote := Copy(FormulaAux,1,I-1);
    sIdLote := Regra.PegaValor(sIdLote);
  End;

  I := Pos(',', FormulaAux);
  If I > 0 Then Begin
    FormulaAux := Copy(FormulaAux,(I+1), Length(FormulaAux));
    I := Pos(',', FormulaAux);
    If I <= 0 Then I := (Length(FormulaAux)+1);
    sFiltraPlanoPrev := Copy(FormulaAux,1,I-1);
    sFiltraPlanoPrev := Regra.PegaValor(sFiltraPlanoPrev);
  End;

  I := Pos(',', FormulaAux);
  sMesCobranca := '';
  If I > 0 Then Begin
    FormulaAux := Copy(FormulaAux,(I+1), Length(FormulaAux));
    I := Pos(',', FormulaAux);
    If I <= 0 Then I := (Length(FormulaAux)+1);
    sMesCobranca := Copy(FormulaAux,1,I-1);
    sMesCobranca := Regra.PegaValor(sMesCobranca);
  End;

  { Fim da Decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Guarda Dados }
  sIdPessJur   := Regra.QueryIn.FieldByName('IDPESSJUR').AsString;
  sIdPlanoPrev := Regra.QueryIn.FieldByName('IDPLANOPREV').AsString;
  If sFiltraPessoa = '1' Then sIdPessoa := Regra.QueryIn.FieldByName('IDPESSOA').AsString;

  { Monta e executa pesquisa no banco }
  sSQL := 'SELECT  '+
          '  SUM( DECODE(FLGDEVOLUCAO, 1, -NVL(VALORRECEBIDO,0),           '+
          '                                NVL(VALORRECEBIDO,0))) AS VALORRECEBIDO, '+
          '  SUM( DECODE(FLGDEVOLUCAO, 1, -NVL(VALORESPERADO,0),           '+
          '                                NVL(VALORESPERADO,0))) AS VALORESPERADO '+
          'FROM    '+
          '  HSTCONTRIBPREV '+
          'WHERE   ';
  If sFiltraPessoa = '1' Then
     sSQL := sSQL + '  IDPESSOA    = '+ sIdPessoa    +' AND ';

  If sIdLote <> '' Then
     sSQL := sSQL + '  IDLOTE    = '+ sIdLote    +' AND ';

  If sMesCobranca <> '' Then
     sSQL := sSQL + '  MESCOBRANCA = '+ QuotedStr( sMesCobranca ) +' AND ';

  If sFiltraPlanoPrev = '' Then sFiltraPlanoPrev := 'S';

  If sFiltraPlanoPrev = 'S' Then Begin
    sSQL := sSQL +
            '  IDPESSJUR   = '+ sIdPessJur   +' AND '+
            '  IDPLANOPREV = '+ sIdPlanoPrev +' AND ';
  End;

  sSQL := sSQL +
          '  IDCONTRIBUICAO IN ('+ sIdContribuicoes   +') AND '+
          '  MESREFERENCIA = '+ QuotedStr(sAnoMesRef) +' AND '+
          '  IDMOTIVO IN ('+ sIdMotivos +')  ';

  If Not FazQuery(Regra.QueryRegraAux,sSQL) Then Begin
    Result := '0';
    Exit;
  End;
  If sFlgCampoRetorno = 'R' Then begin
    Result := Regra.QueryRegraAux.FieldByName('VALORRECEBIDO').AsString;
  End Else Begin
    Result := Regra.QueryRegraAux.FieldByName('VALORESPERADO').AsString;
  End;
End; { SOMACONTRIB }


{==============================================================================}
{ Formula, SOMADIASBENEF (SOMADIASBENEF(DATAINICIAL, DATAFINAL))               }
{  Somar o número de dias que uma pessoa esteve em benefício dentro de um      }
{  determinado período de meses.                                               }
{------------------------------------------------------------------------------}
Function SOMADIASBENEF(Regra : TRegra; Formula : String) : String;
Var
  FormulaAux, sDataInicio, sDataFim, sSQL,
  sIdBeneficios : String;
  dDataInicio, dDataFim : TDateTime;
  I, W : Integer;
  dNumDias : Double;
  sIdPessJur, sIdTitular, sIdPessoa : String;
  VetBeneficios    : Array[1..50] Of String;
Begin
  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }

  { Retira Nome da Formula }
  FormulaAux := Trim(Copy(Formula,16,Length(Formula)));
  FormulaAux := Copy(FormulaAux,1,Length(FormulaAux)-1);

  { Pega Beneficios }
  I := Pos(']', FormulaAux);
  sIdBeneficios := Copy(FormulaAux,1,I-1);
  For I := 1 To 50 Do Begin
    W := Pos(',', sIdBeneficios);
    If W = 0 Then W := (Length(sIdBeneficios)+1);
    VetBeneficios[I] := Copy(sIdBeneficios,1,W-1);
    { Acerta Variavel }
    If Copy(sIdBeneficios,1,1) = '@' Then Begin
      VetBeneficios[I] := Copy(sIdBeneficios, 2, Length(sIdBeneficios));
    End;
    { Atualiza Lista de variaveis }
    sIdBeneficios := Copy(sIdBeneficios,(W+1) ,Length(sIdBeneficios));
    If Trim(sIdBeneficios) = '' Then Break;
  End;

  { Monta linha de motivos }
  For W := 1 To 50 do Begin
    { Caso Encontre o Mes, guarda }
    If (VetBeneficios[W] <> '' ) Then Begin
      sIdBeneficios := sIdBeneficios + VetBeneficios[W]+ ','
    End;
  End;
  sIdBeneficios := Copy(sIdBeneficios,1,(Length(sIdBeneficios)-1));

  I := Pos(']', FormulaAux);
  FormulaAux := Copy(FormulaAux,I+1,Length(FormulaAux));

  { Pega DataInicio }
  I := Pos(',', FormulaAux);
  sDataInicio := Copy(FormulaAux,1,(I-1));
  sDataInicio := Regra.PegaValor(sDataInicio);

  { Pega Data Fim }
  FormulaAux := Copy(FormulaAux,(I+1), Length(FormulaAux));
  I := Pos(',', FormulaAux);
  sDataFim := Copy(FormulaAux,1,Length(FormulaAux));
  sDataFim := Regra.PegaValor(sDataFim);

  { Fim da Decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Guarda Dados }
  sIdPessoa  := Regra.QueryIn.FieldByName('IDPESSOA').AsString;
  sIdTitular := Regra.QueryIn.FieldByName('IDTITULAR').AsString;
  sIdPessJur := Regra.QueryIn.FieldByName('IDPESSJUR').AsString;

  { Monta e executa pesquisa no banco }
  sSQL := 'SELECT  '+
          '  BB.DATAINICIO, DECODE(BB.DATAFINAL,NULL,'+ QuotedStr(sDataFim) +',BB.DATAFINAL) AS DATAFINAL '+
          'FROM    '+
          '  BENEFBFCIARIO BB, BENEFPLANPREV BP, BENEFICIO C '+
          'WHERE   '+
          '  BB.IDTITULAR   = '+ sIdTitular +' AND '+
          '  BB.IDPESSOA    = '+ sIdPessoa  +' AND '+
          '  BB.IDPESSJUR   = '+ sIdPessJur +' AND '+
          '  BB.DATAINICIO < TO_DATE('+ QuotedStr(sDataFim) +', ''DD/MM/YYYY'') AND'+
          '  ((BB.DATAFINAL  >= TO_DATE('+ QuotedStr(sDataInicio) +', ''DD/MM/YYYY'')) OR (BB.DATAFINAL IS NULL)) AND '+
          '  BP.FLGREFERENCIA = 0 AND '+
          '  BB.IDPLANOPREV = BP.IDPLANOPREV AND '+
          '  BB.IDBENEFICIO = BP.IDBENEFICIO AND '+
          '  BB.IDBENEFICIO = C.IDBENEFICIO  AND '+
          '  C.IDTPPAGTOBENEFIC = 2          AND '+
          '  BB.IDBENEFICIO IN ('+ sIdBeneficios +')  ';

  If Not FazQuery(Regra.QueryRegraAux,sSQL) Then Begin
    Result := '0';
    Exit;
  End;

  {------------------------------------------------------}
  { Calcula numero de dias entre as datas dos beneficios }

  { Processa Registros }
  dNumDias := 0;
  While Not Regra.QueryRegraAux.Eof Do Begin
    { Guarda Dados }
    dDataInicio := Regra.QueryRegraAux.FieldByName('DATAINICIO').AsDateTime;
    dDataFim    := Regra.QueryRegraAux.FieldByName('DATAFINAL').AsDateTime;
    dNumDias := dNumDias + (dDataFim - dDataInicio) + 1;

    Regra.QueryRegraAux.Next;
  End;

  Result := FloatToStr(dNumDias);
End; { SOMADIASBENEF }

{==============================================================================}
{ Formula, SOMABENEFICIOS (SOMABENEFICIOS([IDBENEFICIO1, IDBENEFICIO2...]ANOMESINICIAL, ANOMESFINAL)) }
{  Somar os benefícios no período.                                             }
{  OBS.: Pelo fato das tabelas de beneficio não estarem preenchidas, a fórmula }
{        esta lendo a tabela de histórico de rubricas (HISTRUBSAL).            }
{------------------------------------------------------------------------------}
Function SOMABENEFICIOS(Regra : TRegra; Formula : String) : String;
Var
  sAnoMesInicio, sAnoMesFim, sSQL, FormulaAux, sIdBeneficios : String;
  sIdPessJur, sIdTitular, sIdPessoa, sIdPlanoPrev, sVarQuantidade,
  sQtdMesesBeneficio, sTipoPesquisa : String;
  VetBeneficios    : Array[1..50] Of String;
  I, W : Integer;
Begin
  sTipoPesquisa := 'R'; { R - Rubricas na HISTRUBSAL, B - Beneficios na BENEFBFCIARIO }

  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }

  { Retira Nome da Formula }
  FormulaAux := Trim(Copy(Formula,17,Length(Formula)));
  FormulaAux := Copy(FormulaAux,1,Length(FormulaAux)-1);

  { Pega Beneficios }
  I := Pos(']', FormulaAux);
  sIdBeneficios := Copy(FormulaAux,1,I-1);
  For I := 1 To 50 Do Begin
    W := Pos(',', sIdBeneficios);
    If W = 0 Then W := (Length(sIdBeneficios)+1);
    VetBeneficios[I] := Copy(sIdBeneficios,1,W-1);
    { Acerta Variavel }
    If Copy(sIdBeneficios,1,1) = '@' Then Begin
      VetBeneficios[I] := Copy(sIdBeneficios, 2, Length(sIdBeneficios));
    End;
    { Atualiza Lista de variaveis }
    sIdBeneficios := Copy(sIdBeneficios,(W+1) ,Length(sIdBeneficios));
    If Trim(sIdBeneficios) = '' Then Break;
  End;

  { Monta linha de motivos }
  For W := 1 To 50 do Begin
    { Caso Encontre o Mes, guarda }
    If (VetBeneficios[W] <> '' ) Then Begin
      sIdBeneficios := sIdBeneficios + VetBeneficios[W]+ ','
    End;
  End;
  sIdBeneficios := Copy(sIdBeneficios,1,(Length(sIdBeneficios)-1));

  I := Pos(']', FormulaAux);
  FormulaAux := Copy(FormulaAux,I+1,Length(FormulaAux));

  { Pega Mes de Inicio }
  I := Pos(',', FormulaAux);
  sAnoMesInicio := Copy(FormulaAux,1,(I-1));
  sAnoMesInicio := Regra.PegaValor(sAnoMesInicio);

  { Pega Mes de Final }
  FormulaAux := Copy(FormulaAux,(I+1), Length(FormulaAux));
  I := Pos(',', FormulaAux);
  sAnoMesFim := Copy(FormulaAux,1,(I-1));
  sAnoMesFim := Regra.PegaValor(sAnoMesFim);

  { Pega Quantidade de beneficios, é uma variavel não precisa verificar valor }
  FormulaAux := Copy(FormulaAux,(I+1), Length(FormulaAux));
  I := Pos(',', FormulaAux);
  If I <= 0 Then I := (Length(FormulaAux)+1);
  sVarQuantidade := Copy(FormulaAux,1,I-1);
  //sVarQuantidade := Regra.PegaValor(sVarQuantidade);

  { Pega tipo de pesquisa; R - Rubricas na HISTRUBSAL, B - Beneficios na BENEFBFCIARIO }
  FormulaAux := Copy(FormulaAux,(I+1), Length(FormulaAux));
  If Trim(FormulaAux) <> '' Then Begin
    I := Pos(',', FormulaAux);
    If I <= 0 Then I := (Length(FormulaAux)+1);
    sTipoPesquisa := Copy(FormulaAux,1,(I-1));
    sTipoPesquisa := Regra.PegaValor(sTipoPesquisa);
  End;

  { Fim da Decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Guarda Dados }
  sIdPessJur   := Regra.QueryIn.FieldByName('IDPESSJUR').AsString;
  sIdTitular   := Regra.QueryIn.FieldByName('IDTITULAR').AsString;
  sIdPessoa    := Regra.QueryIn.FieldByName('IDPESSOA').AsString;
  sIdPlanoPrev := Regra.QueryIn.FieldByName('IDPLANOPREV').AsString;

  If sTipoPesquisa = 'B' Then Begin
    { PESQUISA NA HSTBENEFBFCIARIO, POR IDBENEFICIO  }
    sSQL := 'SELECT  '+
            '  NVL(SUM( DECODE(H.FLGDEVOLUCAO, 1, -NVL(H.VLBENEFPGTO,H.VALORPREV),               '+
            '                                      NVL(H.VLBENEFPGTO,H.VALORPREV))),0) AS TOTAL, '+
            '  COUNT(DISTINCT H.MES) AS QTDMESESRUBRICA '+
            'FROM    '+
            '  HSTBENEFBFCIARIO H '+
            'WHERE   '+
            ' H.IDTITULAR      = '+ sIdPessoa                +' AND '+
            ' H.MESREFERENCIA >= '+ QuotedStr(sAnoMesInicio) +' AND '+
            ' H.MESREFERENCIA <= '+ QuotedStr(sAnoMesFim)    +' AND '+
            ' H.IDBENEFICIO IN ('+ sIdBeneficios +')  ';
  End Else Begin
    { PESQUISA NA HISTRUBSAL - POR IDRUBRICAS  }
    sSQL := 'SELECT  '+
            '  NVL(SUM(DECODE(P.FLGDESCONTO, 1, -H.VALORPROVENTO, 0, H.VALORPROVENTO)), 0) AS TOTAL, '+
            '  COUNT(DISTINCT H.MES) AS QTDMESESRUBRICA                                              '+
            'FROM    '+
            '  HISTRUBSAL H, PROVDESC P '+
            'WHERE   '+
            ' H.IDTITULAR      = '+ sIdTitular             +' AND '+
            ' H.IDPESSOA       = '+ sIdPessoa              +' AND '+
            ' H.MES >= '+ QuotedStr(sAnoMesInicio)         +' AND '+
            ' H.MES <= '+ QuotedStr(sAnoMesFim)            +' AND '+
            ' H.IDMODULO    = 18 '                         +' AND '+
            ' H.IDHSTFOLHABENEF IS NOT NULL '              +' AND '+
            ' H.IDRUBRICA   = P.IDPROVENTO '               +' AND '+
            ' (H.FLGESTORNO = 0 OR H.FLGESTORNO  IS NULL)' +' AND '+
            ' (P.FLGESPECIAL= 0 OR P.FLGESPECIAL IS NULL)' +' AND '+
            ' H.IDRUBRICA IN ('+ sIdBeneficios +')  ';
  End;

  FazQuery(Regra.QueryRegraAux, sSQL);
  if Regra.QueryRegraAux.IsEmpty then begin
    Result := '0';
    Exit;
  End;
  sQtdMesesBeneficio := Regra.QueryRegraAux.FieldByName('QTDMESESRUBRICA').AsString;
  Regra.SetVariavel(sVarQuantidade,sQtdMesesBeneficio,sVarQuantidade);

  Result := Regra.QueryRegraAux.FieldByName('TOTAL').AsString;

End; { SOMABENEFICIOS }

{==============================================================================}
{ Formula, SOMAHSTBENEF([IDBENEFICIO1,IDBENEFICIO2....]ANOMESINICIAL,ANOMESFINAL,  }
{                        QTDMESESBENEFICIO, FLGCAMPOPESQUISA)                  }
{  Somar os benefícios da HSTBENEFBFCIARIO no período.                         }
{------------------------------------------------------------------------------}
Function SOMAHSTBENEF(Regra : TRegra; Formula : String) : String;
Var
  sAnoMesInicio, sAnoMesFim, sSQL, FormulaAux, sIdBeneficios : String;
  sIdPessJur, sIdTitular, sIdPessoa, sIdPlanoPrev, sVarQuantidade,
  sQtdMesesBeneficio, sCampoResposta : String;
  VetBeneficios    : Array[1..50] Of String;
  I, W : Integer;
Begin
  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }

  { Retira Nome da Formula }
  FormulaAux    := Trim(Copy(Formula,15,Length(Formula)));
  FormulaAux    := Copy(FormulaAux,1,Length(FormulaAux)-1);

  { Pega Beneficios }
  I := Pos(']', FormulaAux);
  sIdBeneficios := Copy(FormulaAux,1,I-1);
  For I := 1 To 50 Do Begin
    W := Pos(',', sIdBeneficios);
    If W = 0 Then W := (Length(sIdBeneficios)+1);
    VetBeneficios[I] := Copy(sIdBeneficios,1,W-1);
    { Acerta Variavel }
    If Copy(sIdBeneficios,1,1) = '@' Then Begin
      VetBeneficios[I] := Copy(sIdBeneficios, 2, Length(sIdBeneficios));
    End;
    { Atualiza Lista de variaveis }
    sIdBeneficios := Copy(sIdBeneficios,(W+1) ,Length(sIdBeneficios));
    If Trim(sIdBeneficios) = '' Then Break;
  End;

  { Monta linha de motivos }
  For W := 1 To 50 do Begin
    { Caso Encontre o Mes, guarda }
    If (VetBeneficios[W] <> '' ) Then Begin
      sIdBeneficios := sIdBeneficios + VetBeneficios[W]+ ','
    End;
  End;
  sIdBeneficios := Copy(sIdBeneficios,1,(Length(sIdBeneficios)-1));

  I := Pos(']', FormulaAux);
  FormulaAux := Copy(FormulaAux,I+1,Length(FormulaAux));

  { Pega Mes de Inicio }
  I := Pos(',', FormulaAux);
  sAnoMesInicio := Copy(FormulaAux,1,(I-1));
  sAnoMesInicio := Regra.PegaValor(sAnoMesInicio);

  { Pega Mes de Final }
  FormulaAux := Copy(FormulaAux,(I+1), Length(FormulaAux));
  I := Pos(',', FormulaAux);
  sAnoMesFim := Copy(FormulaAux,1,(I-1));
  sAnoMesFim := Regra.PegaValor(sAnoMesFim);

  { Pega Quantidade de beneficios, é uma variavel não precisa verificar valor }
  FormulaAux := Copy(FormulaAux,(I+1), Length(FormulaAux));
  I := Pos(',', FormulaAux);
  If I <= 0 Then I := (Length(FormulaAux)+1);
  sVarQuantidade := Copy(FormulaAux,1,I-1);

  { Pega campo de pesquisa;                                         }
  { VP - Soma o campo VALORPREV     (Valor previsto para pagamento) }
  { VI - Soma o campo VALORINTEGRAL (Valor do beneficio rateado)    }
  { VT - Soma o campo VALORTOTAL    (Valor total do beneficio)      }
  { VB - Soma o campo VLRBENEFPGTO  (Valor efetivamente pago)       }
  FormulaAux := Copy(FormulaAux,(I+1), Length(FormulaAux));
  If Trim(FormulaAux) <> '' Then Begin
    I := Pos(',', FormulaAux);
    If I <= 0 Then I := (Length(FormulaAux)+1);
    sCampoResposta := Copy(FormulaAux,1,(I-1));
    sCampoResposta := Regra.PegaValor(sCampoResposta);
  End;

  { Fim da Decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Guarda Dados }
  sIdPessJur   := Regra.QueryIn.FieldByName('IDPESSJUR').AsString;
  sIdTitular   := Regra.QueryIn.FieldByName('IDTITULAR').AsString;
  sIdPessoa    := Regra.QueryIn.FieldByName('IDPESSOA').AsString;
  sIdPlanoPrev := Regra.QueryIn.FieldByName('IDPLANOPREV').AsString;

  sSQL := 'SELECT  '+
          '  NVL( SUM( DECODE(H.FLGDEVOLUCAO, 1, -H.VALORPREV, H.VALORPREV) ) ,0 )         AS VALORPREV, '+
          '  NVL( SUM( DECODE(H.FLGDEVOLUCAO, 1, -H.VALORINTEGRAL, H.VALORINTEGRAL) ) ,0 ) AS VALORINTEGRAL, '+
          '  NVL( SUM( DECODE(H.FLGDEVOLUCAO, 1, -H.VALORTOTAL, H.VALORTOTAL) ) ,0 )       AS VALORTOTAL, '+
          '  NVL( SUM( DECODE(H.FLGDEVOLUCAO, 1, -H.VLBENEFPGTO, H.VLBENEFPGTO) ) ,0 )     AS VLBENEFPGTO, '+

          '  COUNT(DISTINCT H.MES) AS QTDMESESRUBRICA '+
          'FROM    '+
          '  HSTBENEFBFCIARIO H '+
          'WHERE   '+
          ' H.IDTITULAR      = '+ sIdTitular               +' AND '+
          ' H.IDPESSOA       = '+ sIdPessoa                +' AND '+
          ' H.MESREFERENCIA >= '+ QuotedStr(sAnoMesInicio) +' AND '+
          ' H.MESREFERENCIA <= '+ QuotedStr(sAnoMesFim)    +' AND '+
          //' H.MES >= '+ QuotedStr(sAnoMesInicio)           +' AND '+
          //' H.MES <= '+ QuotedStr(sAnoMesFim)              +' AND '+
          ' H.IDBENEFICIO IN ('+ sIdBeneficios +')  ';

  FazQuery(Regra.QueryRegraAux, sSQL);
  if Regra.QueryRegraAux.IsEmpty then begin
    Result := '0';
    Exit;
  End;

  sQtdMesesBeneficio := Regra.QueryRegraAux.FieldByName('QTDMESESRUBRICA').AsString;
  Regra.SetVariavel(sVarQuantidade,sQtdMesesBeneficio,sVarQuantidade);

  If sCampoResposta = 'VP' Then Begin          { VALORPREV }
    Result := Regra.QueryRegraAux.FieldByName('VALORPREV').AsString;
  End Else If sCampoResposta = 'VI' Then Begin { VALORINTEGRAL }
    Result := Regra.QueryRegraAux.FieldByName('VALORINTEGRAL').AsString;
  End Else If sCampoResposta = 'VT' Then Begin { VALORTOTAL }
    Result := Regra.QueryRegraAux.FieldByName('VALORTOTAL').AsString;
  End Else If sCampoResposta = 'VB' Then Begin { VLBENEFPGTO }
    Result := Regra.QueryRegraAux.FieldByName('VLBENEFPGTO').AsString;
  End;

End; { SOMAHSTBENEF }


{==============================================================================}
{ Formula, PARAMPESSOA - 04/03/2003 PARAMPESSOA(IDPARAMETRO, DATAREF, IDPESSOAPESQUISA) }
{   Retorna o valor do Parametro especificado na tabela PESSOAPARAM            }
{------------------------------------------------------------------------------}
Function PARAMPESSOA(Regra : TRegra; Formula : String) : String;
Var
  sFormulaAux,
  sIdTitular, sIdPessoa,  sIdParametro, sDataInicio,
  sSQL : String;
  I :Integer;
Begin
  sDataInicio := '';
  sIdPessoa   := '';

  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }

  { Retira Nome da Formula }
  sFormulaAux := Copy(Formula,13,Length(Formula));
  sFormulaAux := Copy(sFormulaAux,1,Length(sFormulaAux)-1);

  { Pega parametro }
  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sIdParametro := Copy(sFormulaAux,1,(I-1));
  sIdParametro := Regra.PegaValor(sIdParametro);

  { Pega data Inicio }
  sFormulaAux := Copy(sFormulaAux,(I+1),Length(sFormulaAux));
  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sDataInicio := Copy(sFormulaAux,1,(I-1));
  sDataInicio := Regra.PegaValor(sDataInicio);

  { Pega IDPESSOA alternativo }
  sFormulaAux := Copy(sFormulaAux,(I+1),Length(sFormulaAux));
  sIdPessoa := Copy(sFormulaAux,1,Length(sFormulaAux));
  sIdPessoa := Regra.PegaValor(sIdPessoa);

  { Fim da decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Verifica Campos Obrigatórios ( IDPESSOA ) }
  If Regra.QueryIn.FindField('IDPESSOA') = NIL Then Begin
    MsgDlg('Campo IDPESSOA, necessário no Sql de entrada ', 'Regra - Erro',mtError,[mbOk],0);
    Regra.fError := True;
    Exit;
  End;

  { Guarda Dados do Processo }
  //sIdTitular := Regra.QueryIn.FieldByName('IDTITULAR').AsString;
  If sIdPessoa = '' Then
    sIdPessoa  := Regra.QueryIn.FieldByName('IDPESSOA').AsString;

  { Monta SQL }
  sSQL := 'SELECT   '+
          '  VALOR  '+
          'FROM     '+
          '  PESSOAPARAM  '+
          'WHERE    '+
          '  IDPESSOA   = '+sIdPessoa+ ' AND '+
          '  IDPARAM    = '+sIdParametro;

  If sDataInicio <> '' Then Begin
    sSQL := sSQL +
          ' AND   '+
          '  DATAINICIO <= TO_DATE('+QuotedStr(sDataInicio)+', ''DD/MM/YYYY'') AND '+
          '  (DATAFIM   >= TO_DATE('+QuotedStr(sDataInicio)+', ''DD/MM/YYYY'') OR DATAFIM IS NULL) '+
          'ORDER BY '+
          '  DATAINICIO DESC';
  End;

  If Not FazQuery(Regra.QueryRegraAux,sSQL) Then Begin
    Result := '';
    Exit;
  End;

  { Seta Resultado }
  Result := Regra.QueryRegraAux.FieldByName('VALOR').AsString;

  If Trim(Result) = '' Then
    Result := '';

End; { PARAMPESSOA }


{==============================================================================}
{ Formula, VLRRUBMES(RUBRICA,DATA,FLGTIPORETORNO)                              }
{   Retorna o valor da referencia na Rubrica na data.                          }
{------------------------------------------------------------------------------}
Function VLRREFRUBMES   (Regra : TRegra; Formula : String) : String;
Var
   vSql, vRub, vMes, vFormula, sTipoRetorno : String;
   i : LongInt;
Begin
  vFormula := Copy(Formula,14,Length(Formula));
  vFormula := Copy(vFormula,1,Length(vFormula)-1);

  I := Pos(',',vFormula);
  vRub := Copy(vFormula,1,i-1);
  vRub := Regra.PegaValor(vRub);

  vFormula := Copy(vFormula, I + 1,Length(vFormula));

  I := Pos(',',vFormula);
  If I <= 0 Then I := (Length(vFormula)+1);
  vMes := Copy(vFormula,1,I-1);
  vMes := Regra.PegaValor(vMes);
  vMes := Regra.DataParaMes(vMes,0,'I');

  { Pega tipo de Retorno }
  { 0 - Primeiro Valor    }
  { 1 - Maior Valor       }
  vFormula := Copy(vFormula,(I+1), Length(vFormula));
  sTipoRetorno := '0';
  If Trim(vFormula) <> '' Then Begin
    I := Pos(',', vFormula);
    If I <= 0 Then I := (Length(vFormula)+1);
    sTipoRetorno := Copy(vFormula,1,(I-1));
    sTipoRetorno := Regra.PegaValor(sTipoRetorno);
  End;


  Try
    Regra.QueryIn.FieldByName('IDPESSOA').AsString;
  Except
    MsgDlg('Campo IDPESSOA, necessário no Sql de entrada ',
           'Regra - Erro',mtError,[mbOk],0);
    Regra.fError := True;
    Exit;
  End;

  Try
    Regra.QueryIn.FieldByName('IDPESSJUR').AsString;
  Except
    MsgDlg('Campo IDPESSJUR, necessário no Sql de entrada ',
           'Regra - Erro',mtError,[mbOk],0);
    Regra.fError := True;
    Exit;
  End;

  vSql := 'SELECT 1 AS REGRA, H.MES, H.VALORPROVENTO, H.CODPROVDESC, H.REFERENCIA '+
          'FROM HISTRUBSAL H '+
          'WHERE (H.IDPESSOA = '+ Regra.QueryIn.FieldbyName('IDPESSOA').AsString+ ') AND '+
          '(H.'+Regra.sCampoPesquisa+' = '+ Regra.QueryIn.FieldbyName('IDPESSJUR').AsString+') AND '+
          '(H.MES='''+vMes+''') AND (H.CODPROVDESC = '''+vRub+''')';

  If sTipoRetorno = '1' Then vSQL := vSQL + ' ORDER BY REFERENCIA DESC ';

  If FazQuery(Regra.QueryRegraAux, vSQL) Then Begin
    Result := Regra.QueryRegraAux.FieldbyName('REFERENCIA').AsString;
  End;

  If Result = '' Then Result := '0';

end; { VLRREFRUBMES }

{==============================================================================}
{ Formula, RMTRANSFERENCIA - RMTRANSFERENCIA(TIPORESERVA,ANOMESREFERENCIA,     }
{                                            FLGVALORDESEJADO)                 }
{   Retorna um valor determinado da tabela de Hitoricos de reserva no AnoMes   }
{   de Referencia.                                                             }
{------------------------------------------------------------------------------}
Function RMTRANSFERENCIA(Regra : TRegra; Formula : String) : String;
Var
   sFormula, sSQL,
   sIdPessJur, sIdPlanoPrev, sIdPessoa,  sIdParametro,
   sIdTipoReserva, sAnoMesRef, sFlgValorDesejado : String;
   I : Word;
Begin

  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }

  { Retira Nome da Formula }
  sFormula := Copy(Formula,17,Length(Formula));
  sFormula := Copy(sFormula,1,Length(sFormula)-1);
  { Pega Tipo de Reserva }
  I := Pos(',',sFormula);
  sIdTipoReserva := Copy(sFormula,1,I-1);
  sIdTipoReserva := Regra.PegaValor(sIdTipoReserva);
  { Pega AnoMes Referencia }
  sFormula := Copy(sFormula,I+1,Length(sFormula));
  I := Pos(',',sFormula);
  sAnoMesRef := Copy(sFormula,1,I-1);
  sAnoMesRef := Regra.PegaValor(sAnoMesRef);
  { Pega Tipo de Resultado }
  sFormula := Copy(sFormula,I+1,I);
  I := Pos(',',sFormula);
  If I <= 0 Then I := Length(sFormula) Else I := (I - 1) ;
  sFlgValorDesejado := Copy(sFormula,1,I);
  sFlgValorDesejado := Regra.PegaValor(sFlgValorDesejado);

  { Fim da decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Testa campos obrigatórios }
  If Regra.QueryIn.FindField('IDPESSOA') = Nil Then Begin
    Regra.MessageInfo := 'Campo IDPESSOA Necessário no Sql de entrada.';
    Regra.FError := True;
    Exit;
  End Else If Regra.QueryIn.FindField('IDPLANOPREV') = Nil Then Begin
    Regra.MessageInfo := 'Campo IDPLANOPREV Necessário no Sql de entrada.';
    Regra.FError := True;
    Exit;
  End Else If Regra.QueryIn.FindField('IDPESSJUR') = Nil Then Begin
    Regra.MessageInfo := 'Campo IDPESSJUR Necessário no Sql de entrada.';
    Regra.FError := True;
    Exit;
  End;

  { Guarda Valores }
  sIdPessJur   := Regra.QueryIn.FieldByName('IDPESSJUR').AsString;
  sIdPlanoPrev := Regra.QueryIn.FieldByName('IDPLANOPREV').AsString;
  sIdPessoa    := Regra.QueryIn.FieldByName('IDPESSOA').AsString;
  Result       := '0';

  { Nova consulta filtra apenas a DATAALIMENTACAO  }
  { que deve acompanhar o MESREFERENCIA.                                       }

  If sFlgValorDesejado = '1' Then
    sSQL := 'SELECT NVL(SUM(DECODE(H.FLGENTRADA,1,H.VLRREAL,-H.VLRREAL)),0) AS VLRREAL '
  Else
    sSQL := 'SELECT '+
            '   NVL(H.VLRREAL,0) AS VLRREAL, NVL(H.SALDOCOTAS,0) AS SALDOCOTAS, '+
            '   NVL(H.SALDOCORRIGIDO,0) AS SALDOCORRIGIDO                     ';

  sSQL := sSQL +
          'FROM   '+
          '  HISTMOVRESERVA H '+
          'WHERE  '+
          '  H.IDPESSJUR     = '+ sIdPessJur     + ' AND '+
          '  H.IDPLANOPREV   = '+ sIdPlanoPrev   + ' AND '+
          '  H.IDPESSOA      = '+ sIdPessoa      + ' AND '+
          '  H.IDTIPORESERVA = '+ sIdTipoReserva + ' AND '+
          '  TO_CHAR( H.DATAALIMENTACAO, ''YYYY/MM'' ) <= '+ QuotedStr( sAnoMesRef ) +' ';

  If sFlgValorDesejado <> '1' Then
    sSQL := sSQL +
            'ORDER BY H.IDHISTRESERVA DESC ';

  If FazQuery(Regra.QueryRegraAux, sSQL) Then Begin
    { Gera Resultado }
    If sFlgValorDesejado = '1' Then
      Result := Regra.QueryRegraAux.FieldbyName('VLRREAL').AsString
    Else If sFlgValorDesejado = '2' Then
      Result := Regra.QueryRegraAux.FieldbyName('SALDOCOTAS').AsString
    Else If sFlgValorDesejado = '3' Then
      Result := Regra.QueryRegraAux.FieldbyName('SALDOCORRIGIDO').AsString
    Else
      Result := 'ERRO';
  End;

end; { RMTRANSFERENCIA }

{==============================================================================}
{ Formula, RESERVAORIGINAL - RESERVAORIGINAL(TIPORESERVA,BENEFICIO)            }
{   Retorna o valor orginal de uma reserva da tabela MOVRESERVATEMP            }
{------------------------------------------------------------------------------}
Function RESERVAORIGINAL(Regra : TRegra; Formula : String) : String;
Var
   sFormula, sSQL,
   sIdPessJur, sIdPlanoPrev, sIdPessoa,  sIdBeneficio,
   sIdTipoReserva : String;
   I : Word;
Begin
  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }

  { Retira Nome da Formula }
  sFormula := Copy(Formula,17,Length(Formula));
  sFormula := Copy(sFormula,1,Length(sFormula)-1);
  { Pega Tipo de Reserva }
  I := Pos(',',sFormula);
  sIdTipoReserva := Copy(sFormula,1,I-1);
  sIdTipoReserva := Regra.PegaValor(sIdTipoReserva);
  { Pega Tipo de Resultado }
  sFormula := Copy(sFormula,I+1,I);
  I := Pos(',',sFormula);
  If I <= 0 Then I := Length(sFormula) Else I := (I - 1) ;
  sIdBeneficio := Copy(sFormula,1,I);
  sIdBeneficio := Regra.PegaValor(sIdBeneficio);

  { Fim da decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Testa campos obrigatórios }
  If Regra.QueryIn.FindField('IDPESSOA') = Nil Then Begin
    Regra.MessageInfo := 'Campo IDPESSOA Necessário no Sql de entrada.';
    Regra.FError := True;
    Exit;
  End Else If Regra.QueryIn.FindField('IDPLANOPREV') = Nil Then Begin
    Regra.MessageInfo := 'Campo IDPLANOPREV Necessário no Sql de entrada.';
    Regra.FError := True;
    Exit;
  End Else If Regra.QueryIn.FindField('IDPESSJUR') = Nil Then Begin
    Regra.MessageInfo := 'Campo IDPESSJUR Necessário no Sql de entrada.';
    Regra.FError := True;
    Exit;
  End;

  { Guarda Valores }
  sIdPessJur   := Regra.QueryIn.FieldByName('IDPESSJUR').AsString;
  sIdPlanoPrev := Regra.QueryIn.FieldByName('IDPLANOPREV').AsString;
  sIdPessoa    := Regra.QueryIn.FieldByName('IDPESSOA').AsString;
  Result       := '0';

  { Monta e executa Consulta }
  sSQL := 'SELECT '+
          '   NVL(VLRORIGINAL,0) AS VLRORIGINAL '+
          'FROM   '+
          '  MOVRESERVATEMP '+
          'WHERE  '+
          '  IDPESSJUR     = '+ sIdPessJur     +' AND '+
          '  IDPLANOPREV   = '+ sIdPlanoPrev   +' AND '+
          '  IDPESSOA      = '+ sIdPessoa      +' AND '+
          '  IDTIPORESERVA = '+ sIdTipoReserva +' AND '+
          '  IDBENEFICIO   = '+ sIdBeneficio   +' ';

  If FazQuery(Regra.QueryRegraAux, sSQL) Then Begin
    Result := Regra.QueryRegraAux.FieldbyName('VLRORIGINAL').AsString;
  End;

end; { RESERVAORIGINAL }


{******************************************************************************}
{ Formula, POSSUIMIGRACAO                                                      }
{   Retorna "True" se houver migração de beneficio para o IDPESSOA em questão  }
{------------------------------------------------------------------------------}
Function POSSUIMIGRACAO(Regra : TRegra; Formula : String) : String;
Var
  FormulaAux, sSQL, sIdPessoa, sIdPlanoPrev, sIdTitular,
  sVerificaEvento : String;
Begin
  Result := 'False';

  sVerificaEvento := '';

  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }

  { Retira Nome da Formula }
  FormulaAux := Copy(Formula,16,Length(Formula));
  FormulaAux := Copy(FormulaAux,1,Length(FormulaAux)-1);

  { Pega Verircação do evento }
  sVerificaEvento := Copy(FormulaAux, 1, 1);

  { Fim da decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Guarda Dados }

  { Caso esteja executando com tabela auxiliar  busca dados nela }
  If Regra.TemQuery Then Begin
    sIdPessoa := Regra.QryOutraRegra.FieldByName('IDPESSOA').AsString;
  End Else Begin
    sIdPessoa := Regra.FQueryIn.FieldByName('IDPESSOA').AsString;
  End;

  sIdPlanoPrev := Regra.FQueryIn.FieldByName('IDPLANOPREV').AsString;
  sIdTitular   := Regra.FQueryIn.FieldByName('IDTITULAR').AsString;

  If sIdTitular = sIdPessoa Then Begin

    sSQL :=  'SELECT PPP.IDPESSOA, PPP.IDPLANOPREV '+
             'FROM PARTPREVPLAN PPP '+
             'WHERE PPP.IDPESSOA = '+sIdPessoa+' AND PPP.IDPLANOPREV <> '+sIdPlanoPrev+ '  ';

    If ( sVerificaEvento = 'S') Then Begin
      sSQL := sSQL +
              '      AND EXISTS ( SELECT 1 FROM EVENTOSPREV EVP, EVENTOGERADOR EVG '+
              '                   WHERE EVP.IDPESSOA = PPP.IDPESSOA AND EVP.IDEVENTOGERADOR = EVG.IDEVENTOGERADOR AND EVG.FLGINTERNO = ''TP'' ) ';
    End;

  End Else Begin
    sSQL := 'SELECT IDPLANOPREV FROM BENEFBFCIARIO WHERE IDPESSOA = '+sIdPessoa+' AND '+
            'IDPLANOPREV <> '+sIdPlanoPrev;
  End;

  If FazQuery(Regra.QueryRegra,sSQL) Then Begin
    Result := 'True';
  End;

End; { POSSUIMIGRACAO }


{******************************************************************************}
{ Formula, ULTDATACONTRIB (IDCONTRIBUICAO)                                     }
{   Retorna a ultima data de Recebimento de uma contribuição.                  }
{------------------------------------------------------------------------------}
Function ULTDATACONTRIB(Regra : TRegra; Formula : String) : String;
Var
  sSQL, sFormulaAux, sIdContribuicao,
  sIdPessoa, sIdPessjur : String;
  I : Integer;
Begin
  Result := '';

  sFormulaAux := Copy(Formula,16,Length(Formula));
  sFormulaAux := Copy(sFormulaAux,1,Length(sFormulaAux)-1);

  { Guarda identificador da cintribuição   }
  I := Pos(',',sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sIdContribuicao :=  Copy(sFormulaAux,1,I-1);

  sIdPessoa  := Regra.QueryIn.FieldbyName('IDPESSOA').AsString;
  sIdPessJur := Regra.QueryIn.FieldbyName('IDPESSJUR').AsString;

  sSQL := 'SELECT '+Regra.RuleNumber+' AS IDREGRA, MAX(DATARECEBIMENTO) AS DATARECEBIMENTO '+
          'FROM HSTCONTRIBPREV '+
          'WHERE (IDPESSOA  = '+ sIdPessoa  +') AND '+
          '      (IDPESSJUR = '+ sIdPessJur +') AND '+
          '      (IDCONTRIBUICAO = '+ sIdContribuicao +') AND '+
          '      (DATARECEBIMENTO IS NOT NULL )';

  If FazQuery(Regra.QueryRegra,sSQL) Then Begin
    If Regra.QueryRegra.FieldByName('DATARECEBIMENTO').AsString <> '' Then
      Result := Regra.QueryRegra.FieldByName('DATARECEBIMENTO').AsString;
  End;

End; { ULTDATACONTRIB }


{******************************************************************************}
{ Formula, ULTDATAEVENTO (IEVENTOGERADOR)                                      }
{   Retorna a última data registrada do evento informado.                      }
{------------------------------------------------------------------------------}
Function ULTDATAEVENTO(Regra : TRegra; Formula : String) : String;
Var
  sSQL, sFormulaAux, sIdEventoGerador,
  sIdPessoa, sIdPessjur : String;
  I : Integer;
Begin
  Result := '';

  sFormulaAux := Copy(Formula,15,Length(Formula));
  sFormulaAux := Copy(sFormulaAux,1,Length(sFormulaAux)-1);

  { Guarda identificador do evento }
  I := Pos(',',sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sIdEventoGerador :=  Copy(sFormulaAux,1,I-1);
  sIdEventoGerador :=  Regra.PegaValor(sIdEventoGerador);

  sIdPessoa  := Regra.QueryIn.FieldbyName('IDPESSOA').AsString;
  sIdPessJur := Regra.QueryIn.FieldbyName('IDPESSJUR').AsString;

  sSQL := 'SELECT '+Regra.RuleNumber+' AS IDREGRA, MAX(DATAEVENTO) AS DATAEVENTO '+
          'FROM EVENTOSPREV '+
          'WHERE (IDPESSOA  = '+ sIdPessoa  +') AND '+
          '      (IDPESSJUR = '+ sIdPessJur +') AND '+
          '      (IDEVENTOGERADOR = '+ sIdEventoGerador +') ';

  If FazQuery(Regra.QueryRegra,sSQL) Then Begin
    If Regra.QueryRegra.FieldByName('DATAEVENTO').AsString <> '' Then
      Result := Regra.QueryRegra.FieldByName('DATAEVENTO').AsString;
  End;

End; { ULTDATAEVENTO }


{==============================================================================}
{ Formula, TOTALIZAITENSEP (NUMERO DO CONTRATO, [ITEM1,ITEM2,ITEM3....], DATAINICIO, DATAFIM) }
{  Totalizar o valor de uma lista de itens durante um periodo.                 }
{------------------------------------------------------------------------------}
Function TOTALIZAITENSEP(Regra : TRegra; Formula : String) : String;
Var
  sFormulaAux, sDataInicio, sDataFim, sSQL,
  sIdContrato, sIdItens  : String;

  I, W : Integer;
  sIdPessJur, sIdTitular, sIdPessoa : String;
  aListaItens : Array[1..50] Of String;
Begin
  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }

  { Retira Nome da Formula }
  sFormulaAux := Trim(Copy(Formula,17,Length(Formula)));
  sFormulaAux := Copy(sFormulaAux,1,Length(sFormulaAux)-1);

  { Pega Identificador do contrato }
  I := Pos(',', sFormulaAux);
  sIdContrato := Copy(sFormulaAux, 1, (I-1));
  sIdContrato := Regra.PegaValor(sIdContrato);

  { Pega Itens de empréstimo }
  I := Pos('[', sFormulaAux);
  sFormulaAux := Copy(sFormulaAux, (I+1), Length(sFormulaAux));

  I := Pos(']', sFormulaAux);
  sIdItens := Copy(sFormulaAux,1,I-1);
  sFormulaAux := Copy(sFormulaAux, (I+1), Length(sFormulaAux));

  For I := 1 To 50 Do Begin

    W := Pos(',', sIdItens);
    If W = 0 Then W := (Length(sIdItens) + 1);
    aListaItens[I] := Copy(sIdItens, 1, W-1);

    If Copy(sIdItens,1,1) = '@' Then Begin
      aListaItens[I] := Copy(sIdItens, 2, Length(sIdItens));
    End;

    sIdItens := Copy(sIdItens,(W+1) ,Length(sIdItens));

    If Trim(sIdItens) = '' Then Break;

  End;

  { Monta linha de motivos }
  For W := 1 To 50 do Begin
    { Caso Encontre o Mes, guarda }
    If (aListaItens[W] <> '' ) Then Begin
      sIdItens := sIdItens + aListaItens[W]+ ','
    End;
  End;
  sIdItens := Copy(sIdItens,1,(Length(sIdItens)-1));

  I := Pos(',', sFormulaAux);
  sFormulaAux := Copy(sFormulaAux, (I+1), Length(sFormulaAux));

  { Pega DataInicio }
  I := Pos(',', sFormulaAux);
  sDataInicio := Copy(sFormulaAux,1,(I-1));
  sDataInicio := Regra.PegaValor(sDataInicio);

  { Pega Data Fim }
  sFormulaAux := Copy(sFormulaAux, (I+1), Length(sFormulaAux));
  I := Pos(',', sFormulaAux);
  sDataFim := Copy(sFormulaAux, 1, Length(sFormulaAux));
  sDataFim := Regra.PegaValor(sDataFim);

  { Fim da Decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Monta e executa pesquisa no banco }

  sSQL := 'SELECT  '+
          '  SUM(HME.HMEVLRPREVISTO) AS VALOR '+
          'FROM    '+
          '  HISTMOVEMPTMO HME '+
          'WHERE   '+
          '  HME.IDCONTRATOEMPTMO = '+ sIdContrato +'  '+
          '  AND HME.HMEDATAPREVISTA BETWEEN TO_DATE('+ QuotedStr(sDataInicio) + ', ''DD/MM/YYYY'') AND '+
          '                                  TO_DATE('+ QuotedStr(sDataFim)    + ', ''DD/MM/YYYY'')     '+
          '  AND NVL(HME.FLGESTORNADO, 0) = 0        '+
          '  AND HME.IDITEMEMPTMO IN  ('+ sIdItens +')  ';

  If Not FazQuery(Regra.QueryRegraAux,sSQL) Then Begin
    Result := '0';
    Exit;
  End;

  Result := Regra.QueryRegraAux.FieldByName('VALOR').AsString;
End; { TOTALIZAITENSEP }


{==============================================================================}
{ Formula, SOMACOTASRESERVA                                                    }
{   Retornar o somatório das reservas informadas no periodo desejado.          }
{ SINTAXE:                                                                     }
{   SOMACOTASRESERVA([LISTA_RESERVA],DATAINICIO,DATAFINAL)                     }
Function SOMACOTASRESERVA(Regra : TRegra; Formula : String) : String;
Var
  sSQL, FormulaAux, sDataInicio, sDataFim, sListaDeItens : String;

  sIdPessJur, sIdPlanoPrev, sIdTitular, sIdPessoa : String;

  arrItens    : Array[1..50] Of String;

  I, W : Integer;
Begin

  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }

  { Retira Nome da Formula }
  FormulaAux := Trim( Copy( Formula, 18, Length( Formula ) ) );
  FormulaAux := Copy( FormulaAux, 1, Length( FormulaAux ) - 1 );

  FormulaAux := Trim( Copy( FormulaAux, 2, Length( Formula ) ) ); { Retirar o [ }

  { Pega itens da lista de pesquisa }
  I := Pos(']', FormulaAux);
  sListaDeItens := Copy(FormulaAux, 1, (I-1) );

  For I := 1 To 50 Do Begin

    W := Pos(',', sListaDeItens);

    If W = 0 Then W := ( Length( sListaDeItens ) + 1 );

    arrItens[I] := Copy(sListaDeItens, 1, ( W - 1 ) );

    If Copy( sListaDeItens, 1, 1) = '@' Then Begin
      arrItens[I] := Copy( sListaDeItens, 2, Length( sListaDeItens ) );
    End;

    sListaDeItens := Copy( sListaDeItens, (W+1) ,Length( sListaDeItens ) );

    If Trim( sListaDeItens ) = '' Then Break;

  End;

  { Monta linha de itens }
  For W := 1 To 50 do Begin

    If (arrItens[W] <> '' ) Then Begin

      sListaDeItens := sListaDeItens + QuotedStr( arrItens[W] )+ ','

    End;

  End;

  sListaDeItens := Copy( sListaDeItens, 1, ( Length( sListaDeItens ) - 1 ) );

  I := Pos(']', FormulaAux);
  FormulaAux := Copy(FormulaAux,I+1,Length(FormulaAux));

  I := Pos(',', FormulaAux);
  FormulaAux := Copy(FormulaAux,I+1,Length(FormulaAux));

  { Pega data de inicio da pesquisa }
  I := Pos(',', FormulaAux);
  If I <= 0 Then I := (Length(FormulaAux)+1);

  sDataInicio := Copy( FormulaAux, 1, (I - 1) );
  sDataInicio := Regra.PegaValor( sDataInicio );

  I := Pos(',', FormulaAux);
  FormulaAux := Copy(FormulaAux,I+1,Length(FormulaAux));

  { Pega data final da pesquisa }
  I := Pos( ',', FormulaAux );
  If I <= 0 Then I := (Length(FormulaAux)+1);

  sDataFim := Copy( FormulaAux, 1, (I - 1) );
  sDataFim := Regra.PegaValor( sDataFim );

  { Fim da Decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Guarda Dados }
  sIdPessJur   := Regra.QueryIn.FieldByName('IDPESSJUR').AsString;
  sIdPessoa    := Regra.QueryIn.FieldByName('IDPESSOA').AsString;
  sIdPlanoPrev := Regra.QueryIn.FieldByName('IDPLANOPREV').AsString;


  sSQL := 'SELECT '+
          '   SUM( NVL(HMR.VLRCOTAS,0) ) AS SALDOCOTAS ';

  sSQL := sSQL +
          'FROM   '+
          '  HISTMOVRESERVA HMR '+
          'WHERE  '+
          '  HMR.IDPESSJUR     = '+ sIdPessJur       +' AND '+
          '  HMR.IDPLANOPREV   = '+ sIdPlanoPrev     +' AND '+
          '  HMR.IDPESSOA      = '+ sIdPessoa        +' AND '+
          '  HMR.IDTIPORESERVA IN ( '+ sListaDeItens +' ) AND '+

          '  HMR.DATAALIMENTACAO BETWEEN TO_DATE('+ QuotedStr( sDataInicio ) + ', ''DD/MM/YYYY'') AND '+
          '                              TO_DATE('+ QuotedStr( sDataFim )    + ', ''DD/MM/YYYY'')     ';


  If Not FazQuery(Regra.QueryRegraAux,sSQL) Then Begin

    Result := '0';
    Exit;

  End;

  Result := Regra.QueryRegraAux.FieldByName('SALDOCOTAS').AsString;

End; { SOMACOTASRESERVA }


{==============================================================================}
{ Formula, SOMACONJUNTORUBRICA (SOMACONJUNTORUBRICA([CONJUNTO1,CONJUNTO2,CONJUNTO3....], ANOMESREFERENCIA)) }
{  Somar o valor das rubricas associadas a uma lista de Conjunto de Rubricas.  }
{------------------------------------------------------------------------------}
Function SOMACONJUNTORUBRICA(Regra : TRegra; Formula : String) : String;
Var

  sSQL, FormulaAux, sAnoMesRef, sCodigoRubricas : String;

  sIdPessJur, sIdPlanoPrev, sIdTitular, sIdPessoa : String;

  VetConjuntoRubricas    : Array[1..50] Of String;

  I, W : Integer;
Begin

  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }

  { Retira Nome da Formula }
  FormulaAux := Trim(Copy(Formula,21,Length(Formula)));
  FormulaAux := Copy(FormulaAux,1,Length(FormulaAux)-1);

  FormulaAux := Trim(Copy(FormulaAux,2,Length(Formula))); { Retirar o [ }
  { Pega Beneficios }
  I := Pos(']', FormulaAux);
  sCodigoRubricas := Copy(FormulaAux, 1, (I-1) );

  For I := 1 To 50 Do Begin
    W := Pos(',', sCodigoRubricas);
    If W = 0 Then W := (Length(sCodigoRubricas)+1);

    VetConjuntoRubricas[I] := Copy(sCodigoRubricas,1,W-1);

    { Acerta caso seja variavel }
    If Copy(sCodigoRubricas,1,1) = '@' Then Begin
      VetConjuntoRubricas[I] := Copy(sCodigoRubricas, 2, Length(sCodigoRubricas));
    End;

    { Atualiza lista de variaveis }
    sCodigoRubricas := Copy(sCodigoRubricas,(W+1) ,Length(sCodigoRubricas));

    If Trim(sCodigoRubricas) = '' Then Break;

  End;

  { Monta linha de rubricas }
  For W := 1 To 50 do Begin
    { Caso Encontre o Mes, guarda }
    If (VetConjuntoRubricas[W] <> '' ) Then Begin
      sCodigoRubricas := sCodigoRubricas + QuotedStr( VetConjuntoRubricas[W] )+ ','
    End;
  End;

  sCodigoRubricas := Copy(sCodigoRubricas,1,(Length(sCodigoRubricas)-1));

  I := Pos(']', FormulaAux);
  FormulaAux := Copy(FormulaAux,I+1,Length(FormulaAux));
  I := Pos(',', FormulaAux);
  FormulaAux := Copy(FormulaAux,I+1,Length(FormulaAux));

  { Pega mes de referencia }
  I := Pos(',', FormulaAux);
  If I <= 0 Then I := (Length(FormulaAux)+1);

  sAnoMesRef := Copy(FormulaAux,1,(I-1));
  sAnoMesRef := Regra.PegaValor(sAnoMesRef);

  { Fim da Decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Guarda Dados }
  sIdPessJur   := Regra.QueryIn.FieldByName('IDPESSJUR').AsString;
  sIdTitular   := Regra.QueryIn.FieldByName('IDTITULAR').AsString;
  sIdPessoa    := Regra.QueryIn.FieldByName('IDPESSOA').AsString;

  sSQL := 'SELECT  '+
          '  NVL(SUM(DECODE(PRV.FLGDESCONTO, 1, -HST.VALORPROVENTO, 0, HST.VALORPROVENTO)), 0) AS TOTAL '+
          'FROM    '+
          '  HISTRUBSAL HST, PROVDESC PRV, CONJUNTORUBXRUB CXR, CONJUNTORUBRICA CJR '+
          'WHERE   '+
          '  HST.IDTITULAR   = '+ sIdTitular              +' AND '+
          '  HST.IDPESSOA    = '+ sIdPessoa               +' AND '+
          '  HST.MES         = '+ QuotedStr(sAnoMesRef)   +' AND '+

          '  (HST.FLGESTORNO = 0 OR HST.FLGESTORNO IS NULL)  AND '+
          '  (PRV.FLGESPECIAL= 0 OR PRV.FLGESPECIAL IS NULL) AND '+

          '  CJR.CODIGO    IN ('+ sCodigoRubricas        +') AND '+

          '  HST.IDRUBRICA = CXR.IDRUBRICA                   AND '+
          '  CXR.IDCONJUNTORUBRICA = CJR.IDCONJUNTORUBRICA   AND '+

          '  HST.IDRUBRICA   = PRV.IDPROVENTO                    ';

  FazQuery(Regra.QueryRegraAux, sSQL);
  if Regra.QueryRegraAux.IsEmpty then begin
    Result := '0';
    Exit;
  End;

  Result := Regra.QueryRegraAux.FieldByName('TOTAL').AsString;

End; { SOMACONJUNTORUBRICA }

{==============================================================================}
{ Formula, RUBREEMBINSS                                                        }
{   Retornar o valor da rubrica no Reembolso INSS.                             }
{ SINTAXE:                                                                     }
{    RUBREEMBINSS(IDRUBRICA, ANOMESCOBRANCA)                                   }
Function RUBREEMBINSS ( Regra : TRegra; Formula : String) : String;
Var
  sFormulaAux,
  sSQL, sAnoMesCob, sIdPessoa, sIdRubrica : String;
  I :Integer;
Begin
  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }

  { Retira Nome da Formula }
  sFormulaAux := Copy(Formula,14,Length(Formula));
  sFormulaAux := Copy(sFormulaAux,1,Length(sFormulaAux)-1);

  { Pega identificador da rubrica }
  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sIdRubrica := Copy(sFormulaAux,1,I-1);
  sIdRubrica := Regra.PegaValor(sIdRubrica);

  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

  { Pega ano/mês de cobrança }
  I := Pos(',', sFormulaAux);
  If Trim(sFormulaAux) <> ''  Then Begin
    sAnoMesCob := Copy(sFormulaAux,1,Length(sFormulaAux));
    sAnoMesCob := Regra.PegaValor(sAnoMesCob);
  End;
  { Fim da decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Verifica Campos Obrigatórios ( IDPESSOA ) }
  If Regra.QueryIn.FindField('IDPESSOA') = Nil Then Begin
    Regra.MessageInfo := 'Campo IDPESSOA, necessário no Sql de entrada ';
    Regra.fError := True;
    Exit;
  End;

  { Guarda Dados do Processo }
  sIdPessoa  := Regra.QueryIn.FieldByName('IDPESSOA').AsString;

  { Monta SQL }
  sSQL := 'SELECT   '+
          '  DET.VALORINSS '+
          'FROM     '+
          '  DETCONCINSS DET '+
          'WHERE    '+
          '  DET.IDPESSOA  = '+ sIdPessoa                + ' AND '+
          '  DET.IDRUBRICA = '+ QuotedStr( sIdRubrica )  + ' AND ';

  If Trim( sAnoMesCob ) = '' Then Begin
    sSQL := sSQL + '  DET.MESCOBRANCA  = (SELECT MAX(DET2.MESCOBRANCA) FROM DETCONCINSS DET2 '+
                   '                      WHERE DET2.IDPESSOA  = DET.IDPESSOA AND DET2.IDRUBRICA = DET.IDRUBRICA )';
  End Else Begin
    sSQL := sSQL + '  DET.MESCOBRANCA  = '+QuotedStr( sAnoMesCob );
  End;

  If Not FazQuery(Regra.QueryRegraAux, sSQL) Then Begin
    Result := '0';
    Exit;
  End;

  { Seta Resultado }
  Result := Regra.QueryRegraAux.FieldByName('VALORINSS').AsString;

  If Trim(Result) = '' Then Result := '0';

End; { RUBREEMBINSS }





//Fanuel Junior SOL157238 Kintana1250247
{==============================================================================}
{ Formula, COMPARAVALBENEF                                                     }
{   Retorna o maior ou menor valor passado                                     }
{ SINTAXE:                                                                     }
{   COMPARAVALBENEF(FLGMAIORMENOR, FLGEXIBEMSG, VALOR1, VALOR2, VALOR3)        }
Function COMPARAVALBENEF(Regra : TRegra; Formula : String) : String;
Var
  sMsg,sResult, sFormulaAux ,sValor : String;
  iFlgmsg, iFlgMaiorMenor ,I : Integer;
  iValor1, iValor2, iValor3
  ,iMaior, iMenor: Double;
Begin
  Result := '';

  sFormulaAux := Copy(Formula,17,Length(Formula));
  sFormulaAux := Copy(sFormulaAux,1,Length(sFormulaAux)-1);

//FLGMSG

  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sValor := Copy(sFormulaAux,1,I-1);
  sValor := Regra.PegaValor(sValor);
    sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

  If Regra.QueryIn.FindField('FLGMAIORMENOR') = Nil then
     iFlgMaiorMenor := StrToInt(sValor)
  else
     iFlgMaiorMenor := Regra.QueryIn.FieldByName('FLGMAIORMENOR').AsInteger;


  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sValor := Copy(sFormulaAux,1,I-1);
  sValor := Regra.PegaValor(sValor);
  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

  If Regra.QueryIn.FindField('FLGEXIBEMSG') = Nil then
     iFlgmsg := StrToInt(sValor)
  else
     iFlgmsg := Regra.QueryIn.FieldByName('FLGEXIBEMSG').AsInteger;


  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sValor := Copy(sFormulaAux,1,I-1);
  sValor := Regra.PegaValor(sValor);
  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

  If Regra.QueryIn.FindField('VALOR1') = Nil then
     iValor1 := StrToFloat(sValor)
  else
     iValor1 := Regra.QueryIn.FieldByName('VALOR1').AsFloat;


  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sValor := Copy(sFormulaAux,1,I-1);
  sValor := Regra.PegaValor(sValor);
  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

  If Regra.QueryIn.FindField('VALOR2') = Nil then
     iValor2 := StrToFloat(sValor)
  else
     iValor2 := Regra.QueryIn.FieldByName('VALOR2').AsFloat;


  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sValor := Copy(sFormulaAux,1,I-1);
  sValor := Regra.PegaValor(sValor);
  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

  If Regra.QueryIn.FindField('VALOR3') = Nil then
     iValor3 := StrToFloat(sValor)
  else
     iValor3 := Regra.QueryIn.FieldByName('VALOR3').AsFloat;


 if ((iValor1 - iValor2) >= 0) and ((iValor1 - iValor3) >= 0) then begin
     iMaior := iValor1;
     if ((iValor2 - iValor3) <= 0) then
        iMenor := iValor2
     else
        iMenor := iValor3
  end
  else
  if ((iValor2 - iValor3) >= 0) and ((iValor2 - iValor1) >= 0) then begin
     iMaior := iValor1;
     if ((iValor1 - iValor3) <= 0) then
        iMenor := iValor1
     else
        iMenor := iValor3;
  end
  else
  if ((iValor3 - iValor2) >= 0) and ((iValor3 - iValor1) >= 0) then begin
     iMaior := iValor3;
     if ((iValor2 - iValor1) <= 0) then
        iMenor := iValor2
     else
        iMenor := iValor1;
  end
  else begin
     iMaior := iValor1;
     iMenor := iValor1;
  end;

  if iFlgMaiorMenor = 0 then begin
     sMsg := 'Menor Valor : '+FormatFloat('0.00########',iMenor) ;
     sResult := FormatFloat('0.00########',iMenor);
  end
  else begin
     sMsg := 'Maior Valor : '+FormatFloat('0.00########',iMaior) ;
     sResult := FormatFloat('0.00########',iMaior);
  end;

  if iFlgMsg = 1 then
       MessageDlg(sMsg, mtInformation, [mbOK], 0);

  Result := sResult;
end;
//Fanuel Junior SOL157238 Kintana1250247

// SOL 136385/7221 Kintana 1512983
{==============================================================================}
{ Formula,  VALORPECULIO                                                    }
{   Retorna o maior ou menor valor passado                                     }
{ SINTAXE:                                                                     }
{   COMPARAVALBENEF(FLGMAIORMENOR, FLGEXIBEMSG, VALOR1, VALOR2, VALOR3)        }
Function VALORPECULIO(Regra : TRegra; Formula : String) : String;
Var
  sMsg,sResult, sFormulaAux ,sValor : String;
  iFlgmsg, iFlgMaiorMenor ,I : Integer;
  sIdBeneficio, sDataPeculio, sIdPessoaPesquisa, sIdTitularPesquisa, sValorInss : String;

Begin
  Result := '0';

  sFormulaAux := Copy(Formula,14,Length(Formula));
  sFormulaAux := Copy(sFormulaAux,1,Length(sFormulaAux)-1);

//FLGMSG

  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sValor := Copy(sFormulaAux,1,I-1);
  sIdBeneficio := Regra.PegaValor(sValor);
    sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

  {if sIdBeneficio = '' then
  begin
     if Regra.QueryIn.FindField('IDBENEFICIO') <> Nil then
     sIdBeneficio := Regra.QueryIn.FieldByName('IDBENEFICIO').AsString;
  end;  }


  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sValor := Copy(sFormulaAux,1,I-1);
  sDataPeculio := Regra.PegaValor(sValor);
  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

 { if sDataPeculio = '' then
  begin
     if Regra.QueryIn.FindField('DATAPECULIO') <> Nil then
     sDataPeculio := Regra.QueryIn.FieldByName('DATAPECULIO').AsString;
  end; }


  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sValor := Copy(sFormulaAux,1,I-1);
  sIdPessoaPesquisa := Regra.PegaValor(sValor);
  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

  {if sIdPessoaPesquisa = '' then
  begin
     if Regra.QueryIn.FindField('IDPESSOA') <> Nil then
     sIdPessoaPesquisa := Regra.QueryIn.FieldByName('IDPESSOA').AsString;
  end; }


  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sValor := Copy(sFormulaAux,1,I-1);
  sIdTitularPesquisa := Regra.PegaValor(sValor);
  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

  {if sIdTitularPesquisa = '' then
  begin
     if Regra.QueryIn.FindField('IDTITULAR') <> Nil then
     sIdTitularPesquisa := Regra.QueryIn.FieldByName('IDTITULAR').AsString;
  end;}

  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sValor := Copy(sFormulaAux,1,I-1);
  sValorInss := Regra.PegaValor(sValor);
  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

  QryAuxFormula := TwwQuery.Create(Nil);
  QryAuxFormula.DataBaseName := Regra.DatabaseName;

  sMsg := '';

  if Trim(sIdBeneficio)       = '' then
     sMsg := 'IDBENEFICIO';
  if Trim(sDataPeculio)       = '' then
     if trim(sMsg) <> '' then
        sMsg := sMsg + ', DATAPECULIO'
     else
        sMsg := 'DATAPECULIO';
  if Trim(sIdPessoaPesquisa)  = '' then
     if trim(sMsg) <> '' then
        sMsg := sMsg + ', IDPESSOAPESQUISA'
     else
        sMsg := 'IDPESSOAPESQUISA';

  if Trim(sIdTitularPesquisa) = '' then
     if trim(sMsg) <> '' then
        sMsg := sMsg + ', IDTITULARPESQUISA'
     else
        sMsg := 'IDTITULARPESQUISA';

  if trim(sMsg) <> '' then
  begin
     MessageDlg('Campos Obrigatórios não preenchidos: '+sMsg, mtWarning, [mbOK], 0);
     Exit;
  end;

  //Fanuel Marinho SOL178717 Kintana1642152
  sValorInss :=  StringReplace(sValorInss ,',','.',[rfReplaceAll]);

  With QryAuxFormula Do
  Begin
  //Pecúlio Novo Plano Assitido------------------------------------------------------------------------------------------
  //IDBENEFICIO = 486
     if  trim(sIdBeneficio) = '486' then
     begin
        Close;
        SQL.Clear;
        //Fanuel Marinho SOL178717 Kintana1642152
        //SQL.Add(' SELECT ROUND((nvl(nvl('+QuotedStr(sValorInss)+',VALORINSS),0) + nvl(VALORFUNCEF,0)) * 2.5, 2) VALORPECULIO ');
        SQL.Add(' SELECT ROUND((nvl(nvl('+sValorInss+',VALORINSS),0) + nvl(VALORFUNCEF,0)) * 2.5, 2) VALORPECULIO ');
        SQL.Add(' FROM (SELECT D.MATRICULA, (SELECT VALORATUAL FROM BENEFBFCIARIO BF ');
        SQL.Add(' WHERE BF.IDBENEFICIO IN (148,153,155,157,158,191,192,193,195,254) ');
        SQL.Add(' AND BF.FONTEPAGADORA = 2  AND BF.IDSITBENEFICIO = 3  AND BF.IDPESSOA = D.IDPESSOA ');
        SQL.Add(' AND BF.IDTITULAR = D.IDTITULAR  AND BF.IDTITULAR = BF.IDPESSOA ');
        SQL.Add(' AND BF.DATAFINAL = (SELECT MAX(BF1.DATAFINAL) FROM BENEFBFCIARIO BF1 ');
        SQL.Add(' WHERE BF1.IDPESSOA = BF.IDPESSOA AND BF1.IDTITULAR = BF.IDTITULAR AND ');
        SQL.Add(' BF1.IDBENEFICIO IN (148,153,155,157,158,191,192,193,195,254) AND ');
        SQL.Add(' BF1.FONTEPAGADORA = 2 AND BF1.IDSITBENEFICIO = 3) ');
        SQL.Add(' UNION ');
        SQL.Add(' SELECT VALORATUAL FROM BENEFBFCIARIO BF WHERE BF.IDBENEFICIO IN (163,168,166,169,162) ');
        SQL.Add(' AND BF.FONTEPAGADORA = 2 AND BF.IDSITBENEFICIO = 3 AND BF.IDPESSOA = D.IDPESSOA ');
        SQL.Add(' AND BF.IDTITULAR = D.IDTITULAR AND BF.IDTITULAR <> BF.IDPESSOA ');
        SQL.Add(' AND BF.DATAFINAL = (SELECT MAX(BF1.DATAFINAL) FROM BENEFBFCIARIO BF1 ');
        SQL.Add(' WHERE BF1.IDPESSOA = BF.IDPESSOA AND BF1.IDTITULAR = BF.IDTITULAR AND ');
        SQL.Add(' BF1.IDBENEFICIO IN (163,168,166,169,162) AND BF1.FONTEPAGADORA = 2 AND ');
        SQL.Add(' BF1.IDSITBENEFICIO = 3)) VALORINSS, (SELECT VALORATUAL FROM BENEFBFCIARIO BF ');
        SQL.Add(' WHERE BF.IDBENEFICIO IN (479,480,481,487) AND BF.FONTEPAGADORA = 1 AND BF.IDSITBENEFICIO = 3 ');
        SQL.Add(' AND BF.IDPESSOA = D.IDPESSOA AND BF.IDTITULAR = D.IDTITULAR AND BF.IDTITULAR = BF.IDPESSOA ');
        SQL.Add(' AND BF.DATAFINAL = (SELECT MAX(BF1.DATAFINAL) FROM BENEFBFCIARIO BF1 ');
        SQL.Add(' WHERE BF1.IDPESSOA = BF.IDPESSOA AND BF1.IDTITULAR = BF.IDTITULAR AND ');
        SQL.Add(' BF1.IDBENEFICIO IN (479,480,481,487) AND BF1.FONTEPAGADORA = 1 AND BF1.IDSITBENEFICIO = 3) ');
        SQL.Add(' UNION ');
        SQL.Add(' SELECT VALORATUAL FROM BENEFBFCIARIO BF WHERE BF.IDBENEFICIO IN (482,488) ');
        SQL.Add(' AND BF.FONTEPAGADORA = 1 AND BF.IDSITBENEFICIO = 3 AND BF.IDPESSOA = D.IDPESSOA ');
        SQL.Add(' AND BF.IDTITULAR = D.IDTITULAR AND BF.IDTITULAR <> BF.IDPESSOA AND BF.DATAFINAL = (SELECT MAX(BF1.DATAFINAL) ');
        SQL.Add(' FROM BENEFBFCIARIO BF1 WHERE BF1.IDPESSOA = BF.IDPESSOA AND BF1.IDTITULAR = BF.IDTITULAR AND ');
        SQL.Add(' BF1.IDBENEFICIO IN (482,488) AND BF1.FONTEPAGADORA = 1 AND BF1.IDSITBENEFICIO = 3)) VALORFUNCEF ');
        SQL.Add(' FROM DEPENTIT D ');
        SQL.Add(' WHERE D.IDPESSOA =  '+ sIdPessoaPesquisa );
        SQL.Add(' AND D.IDTITULAR =   '+ sIdTitularPesquisa +' ) ');
        Open;
        sResult  := FieldByName('valorpeculio').AsString;
     end;

    //Pecúlio Novo Plano Ativo---------------------------------------------------------------------------------------------
    //IDBENEFICIO = 485

     if  trim(sIdBeneficio) = '485' then
     begin
        Close;
        SQL.Clear;
        //BRUNO AZEVEDO SOL 171158/7442 KINTANA 1532044
        SQL.Add(' SELECT ((PPP.SALPARTICIPACAO * 2.5) * DECODE(to_char(to_date('+QuotedStr(sDataPeculio)+'),''mm''),9,1, ');
        SQL.Add(' (SELECT (EXP(SUM(LN(((CM.COTVALOR / 100) + 1)))) - 1) + 1 COTACAO FROM COTACAOMOEDA CM ');

        SQL.Add(' WHERE CM.MOECODIGO = 7 AND CM.COTDATA BETWEEN TO_DATE(''01/09/'' || CASE  WHEN TO_CHAR(last_day(add_months(to_date('+QuotedStr(sDataPeculio)+'),-1)), ''mm'')<9 THEN ');
        SQL.Add(' TO_CHAR(last_day(add_months(to_date('+QuotedStr(sDataPeculio)+'),-1)), ''yyyy'')-1 ELSE TO_CHAR(last_day(add_months(to_date('+QuotedStr(sDataPeculio)+'),-1)), ''yyyy'')-0 ' );
        SQL.Add(' END) AND last_day(add_months(to_date('+QuotedStr(sDataPeculio)+'),-1)) AND SUBSTR(CM.COTMESREF, 3, 4) BETWEEN ''2001'' AND ');
        //Fanuel Junior SOL179801 Kintana1666905   Adicionado /*AND EXISTS(... ... >= 11) */
        SQL.Add(' TO_CHAR(SYSDATE, ''yyyy'') /*AND EXISTS (SELECT 1 FROM COTACAOMOEDA CM1 WHERE CM.MOECODIGO = CM1.MOECODIGO ');
        SQL.Add(' AND SUBSTR(CM.COTMESREF, 3, 4) = SUBSTR(CM1.COTMESREF, 3, 4) HAVING COUNT(*) >= 11)*/ ');
        SQL.Add(' ))) VALORPECULIO FROM DEPENTIT D JOIN PARTPREVPLAN PPP  ON D.IDPESSOA = PPP.IDPESSOA ');
        SQL.Add(' AND  D.IDTITULAR = PPP.IDPESSOA WHERE ppp.idplanoprev = 74 ');
        SQL.Add(' AND  D.IDPESSOA  = '+ sIdPessoaPesquisa );
        SQL.Add(' AND  D.IDTITULAR =  '+ sIdTitularPesquisa );

        Open;
        sResult  := FieldByName('valorpeculio').AsString;
     end;

     //Pecúlio REB Assitido-------------------------------------------------------------------------------------------------
     //IDBENEFICIO = 322

     if  trim(sIdBeneficio) = '322' then
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT ROUND((VALORFUNCEF)*2,2) VALORPECULIO FROM (SELECT D.MATRICULA, ');
        SQL.Add(' (SELECT VALORATUAL FROM BENEFBFCIARIO BF WHERE BF.IDBENEFICIO IN (160,328,161,329,320,152,151,318) ');
        SQL.Add(' AND BF.FONTEPAGADORA = 1 AND BF.IDSITBENEFICIO = 3 AND BF.IDPESSOA = D.IDPESSOA ');
        SQL.Add(' AND BF.IDTITULAR = D.IDTITULAR AND BF.IDTITULAR = BF.IDPESSOA AND BF.DATAFINAL = (SELECT MAX(BF1.DATAFINAL) ');
        SQL.Add(' FROM BENEFBFCIARIO BF1 WHERE BF1.IDPESSOA = BF.IDPESSOA AND BF1.IDTITULAR = BF.IDTITULAR AND ');
        SQL.Add(' BF1.IDBENEFICIO IN (160,328,161,329,320,152,151,318) AND BF1.FONTEPAGADORA = 1 AND BF1.IDSITBENEFICIO = 3) ');
        SQL.Add(' UNION ');
        SQL.Add(' SELECT VALORATUAL FROM BENEFBFCIARIO BF WHERE BF.IDBENEFICIO IN (325,278,165,324,171,326) AND BF.FONTEPAGADORA = 1 ');
        SQL.Add(' AND BF.IDSITBENEFICIO = 3 AND BF.IDPESSOA = D.IDPESSOA AND BF.IDTITULAR = D.IDTITULAR AND BF.IDTITULAR <> BF.IDPESSOA ');
        SQL.Add(' AND BF.DATAFINAL = (SELECT MAX(BF1.DATAFINAL) FROM BENEFBFCIARIO BF1 WHERE BF1.IDPESSOA = BF.IDPESSOA AND ');
        SQL.Add(' BF1.IDTITULAR = BF.IDTITULAR AND BF1.IDBENEFICIO IN (325,278,165,324,171,326) AND BF1.FONTEPAGADORA = 1 AND ');
        SQL.Add(' BF1.IDSITBENEFICIO = 3)) VALORFUNCEF FROM DEPENTIT D ');
        SQL.Add(' WHERE D.IDPESSOA  =  '+ sIdPessoaPesquisa );
        SQL.Add(' AND   D.IDTITULAR =  '+ sIdTitularPesquisa +' ) ');
        Open;
        sResult  := FieldByName('valorpeculio').AsString;
     end;

     //Pecúlio REB Ativo----------------------------------------------------------------------------------------------------
     //IDBENEFICIO = 321  e 253
     if  (trim(sIdBeneficio) = '321') or (trim(sIdBeneficio) = '253') then
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT (((SELECT AVG(h.valorprovento*(SELECT (exp(sum(ln(((cm.cotvalor/100)+1))))-1)+1 cotacao ');
        SQL.Add(' FROM cotacaomoeda cm WHERE cm.moecodigo = 7 AND ');
        SQL.Add(' cm.cotdata BETWEEN to_date(''01''||SUBSTR(h.mes,6,2)||''/''||SUBSTR(h.mes,0,4),''dd/mm/yyyy'') AND ');
        SQL.Add(' last_day(add_months(TO_DATE('+QuotedStr(sDataPeculio)+',''DD/MM/YYYY''),-1)) AND EXISTS (SELECT 1 FROM cotacaomoeda cm1 ');
        SQL.Add(' WHERE cm.moecodigo = cm1.moecodigo AND SUBSTR(cm.cotmesref,3,4) = SUBSTR(cm1.cotmesref,3,4) HAVING COUNT(*) >= 11))) ');
        SQL.Add(' FROM histrubsal h WHERE h.codprovdesc = ''RBAS'' AND h.idrubrica = 32480 AND h.idpessoa = d.idpessoa AND h.idtitular = d.idtitular AND ');
        SQL.Add(' h.mes < to_char(add_months(to_date('+QuotedStr(sDataPeculio)+',''dd/mm/yyyy''),-1),''yyyy/mm'') AND ');
        SQL.Add(' h.mes >= to_char(add_months(to_date('+QuotedStr(sDataPeculio)+',''dd/mm/yyyy''),-13),''yyyy/mm''))*2)) valorpeculio ');
        SQL.Add(' FROM depentit d ');
        SQL.Add(' WHERE  D.IDPESSOA  =  '+ sIdPessoaPesquisa );
        SQL.Add(' AND    D.IDTITULAR =  '+ sIdTitularPesquisa );
        Open;
        sResult  := FieldByName('valorpeculio').AsString;
     end;

     //Pecúlio REG/REPLAN Saldado Assitido----------------------------------------------------------------------------------
     //IDBENEFICIO = 500

     if  trim(sIdBeneficio) = '500' then
     begin
        Close;
        SQL.Clear;
        //Fanuel Marinho SOL178717 Kintana1642152
        SQL.Add(' SELECT ROUND((nvl(nvl('+sValorInss+',VALORINSS),0)+ nvl(VALORFUNCEF,0))*2.5,2) VALORPECULIO FROM (SELECT D.MATRICULA, ');

        //Fanuel Marinho SOL178717/9365  Kintana1653326
        SQL.Add(' (SELECT VALORATUAL FROM BENEFBFCIARIO BF WHERE BF.IDBENEFICIO IN (148,153,155,157,158,191,192,193,195,254) ');
        //Fanuel Marinho SOL178717/9365  Kintana1653326

        //SQL.Add(' SELECT ROUND((nvl(nvl('+QuotedStr(sValorInss)+',VALORINSS),0)+ nvl(VALORFUNCEF,0))*2.5,2) VALORPECULIO FROM (SELECT D.MATRICULA, ');
        SQL.Add(' AND BF.FONTEPAGADORA = 2 AND BF.IDSITBENEFICIO = 3 AND BF.IDPESSOA = D.IDPESSOA AND BF.IDTITULAR = D.IDTITULAR ');
        SQL.Add(' AND BF.IDTITULAR = BF.IDPESSOA AND BF.DATAFINAL = (SELECT MAX(BF1.DATAFINAL) FROM BENEFBFCIARIO BF1 ');
        SQL.Add(' WHERE BF1.IDPESSOA = BF.IDPESSOA AND BF1.IDTITULAR = BF.IDTITULAR AND ');
        SQL.Add(' BF1.IDBENEFICIO IN (148,153,155,157,158,191,192,193,195,254) AND BF1.FONTEPAGADORA = 2 AND BF1.IDSITBENEFICIO = 3) ');
        SQL.Add(' UNION ');
        SQL.Add(' SELECT VALORATUAL FROM BENEFBFCIARIO BF WHERE BF.IDBENEFICIO IN (163,168,166,169,162) AND BF.FONTEPAGADORA = 2 ');
        SQL.Add(' AND BF.IDSITBENEFICIO = 3 AND BF.IDPESSOA = D.IDPESSOA AND BF.IDTITULAR = D.IDTITULAR AND BF.IDTITULAR <> BF.IDPESSOA ');
        SQL.Add(' AND BF.DATAFINAL = (SELECT MAX(BF1.DATAFINAL) FROM BENEFBFCIARIO BF1 WHERE BF1.IDPESSOA = BF.IDPESSOA AND ');
        SQL.Add(' BF1.IDTITULAR = BF.IDTITULAR AND BF1.IDBENEFICIO IN (163,168,166,169,162) AND BF1.FONTEPAGADORA = 2 AND ');
        SQL.Add(' BF1.IDSITBENEFICIO = 3)) VALORINSS, (SELECT VALORATUAL FROM BENEFBFCIARIO BF WHERE BF.IDBENEFICIO IN (495,503,504,505,513,514) ');
        SQL.Add(' AND BF.FONTEPAGADORA = 1  AND BF.IDSITBENEFICIO = 3 AND BF.IDPESSOA = D.IDPESSOA AND BF.IDTITULAR = D.IDTITULAR ');
        SQL.Add(' AND BF.IDTITULAR = BF.IDPESSOA AND BF.DATAFINAL = (SELECT MAX(BF1.DATAFINAL) FROM BENEFBFCIARIO BF1 ');
        SQL.Add(' WHERE BF1.IDPESSOA = BF.IDPESSOA AND BF1.IDTITULAR = BF.IDTITULAR AND BF1.IDBENEFICIO IN (495,503,504,505,513,514) AND ');
        SQL.Add(' BF1.FONTEPAGADORA = 1 AND BF1.IDSITBENEFICIO = 3) ');
        SQL.Add(' UNION ');
        SQL.Add(' SELECT VALORATUAL FROM BENEFBFCIARIO BF WHERE BF.IDBENEFICIO IN (496,497) AND BF.FONTEPAGADORA = 1 ');
        SQL.Add(' AND BF.IDSITBENEFICIO = 3 AND BF.IDPESSOA = D.IDPESSOA AND BF.IDTITULAR = D.IDTITULAR AND BF.IDTITULAR <> BF.IDPESSOA ');
        SQL.Add(' AND BF.DATAFINAL = (SELECT MAX(BF1.DATAFINAL) FROM BENEFBFCIARIO BF1 WHERE BF1.IDPESSOA = BF.IDPESSOA AND ');
        SQL.Add(' BF1.IDTITULAR = BF.IDTITULAR AND BF1.IDBENEFICIO IN (496,497) AND BF1.FONTEPAGADORA = 1 AND ');
        SQL.Add(' BF1.IDSITBENEFICIO = 3)) VALORFUNCEF FROM DEPENTIT D ');
        SQL.Add(' WHERE D.IDPESSOA  =  '+ sIdPessoaPesquisa );
        SQL.Add(' AND   D.IDTITULAR =  '+ sIdTitularPesquisa +' ) ');
        Open;
        sResult  := FieldByName('valorpeculio').AsString;
     end;

     //Pecúlio REG/REPLAN Saldado Ativo-------------------------------------------------------------------------------------
     //IDBENEFICIO = 499

     if  trim(sIdBeneficio) = '499' then
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT (SELECT AVG(h.valorprovento) FROM histrubsal h WHERE h.codprovdesc = ''RBAS'' AND ');
        SQL.Add(' h.idrubrica = 32480 AND h.idpessoa = d.idpessoa AND h.idtitular = d.idtitular AND ');
        SQL.Add(' h.mes = ''2006/08'') * (SELECT (exp(sum(ln(((cm.cotvalor/100)+1))))-1)+1 cotacao ');
        SQL.Add(' FROM cotacaomoeda cm WHERE cm.moecodigo = 7 AND cm.cotdata BETWEEN ''01/06/2008'' AND ''01/11/2010'' AND EXISTS (SELECT 1 ');
        SQL.Add(' FROM cotacaomoeda cm1 WHERE cm.moecodigo = cm1.moecodigo AND SUBSTR(cm.cotmesref,3,4) = SUBSTR(cm1.cotmesref,3,4) ');
        SQL.Add(' HAVING COUNT(*) >= 11)) valorpeculio FROM depentit d ');
        SQL.Add(' WHERE D.IDPESSOA  =  '+ sIdPessoaPesquisa );
        SQL.Add(' AND   D.IDTITULAR =  '+ sIdTitularPesquisa );
        Open;
        sResult  := FieldByName('valorpeculio').AsString;
     end;

     //Auxílio Funeral REG/REPLAN Não Saldado Assitido----------------------------------------------------------------------
     //IDBENEFICIO = 298

     if  trim(sIdBeneficio) = '298' then
     begin
        Close;
        SQL.Clear;
        //Fanuel Marinho SOL178717 Kintana1642152
        SQL.Add(' SELECT ROUND((nvl(nvl('+sValorInss+',VALORINSS),0)+nvl(VALORFUNCEF,0))*2,2) VALORPECULIO FROM (SELECT D.MATRICULA, ');
        //SQL.Add(' SELECT ROUND((nvl(nvl('+QuotedStr(sValorInss)+',VALORINSS),0)+nvl(VALORFUNCEF,0))*2,2) VALORPECULIO FROM (SELECT D.MATRICULA, ');

        //Fanuel Marinho SOL178717/9365  Kintana1653326
        SQL.Add(' (SELECT VALORATUAL FROM BENEFBFCIARIO BF WHERE BF.IDBENEFICIO IN (148,153,155,157,158,191,192,193,195,254) ');
        //Fanuel Marinho SOL178717/9365  Kintana1653326

        SQL.Add(' AND BF.FONTEPAGADORA = 2 AND BF.IDSITBENEFICIO = 3 AND BF.IDPESSOA = D.IDPESSOA AND BF.IDTITULAR = D.IDTITULAR AND BF.IDTITULAR = BF.IDPESSOA ');
        SQL.Add(' AND BF.DATAFINAL = (SELECT MAX(BF1.DATAFINAL) FROM BENEFBFCIARIO BF1 WHERE BF1.IDPESSOA = BF.IDPESSOA AND BF1.IDTITULAR = BF.IDTITULAR AND ');
        SQL.Add(' BF1.IDBENEFICIO IN (148,153,155,157,158,191,192,193,195,254) AND BF1.FONTEPAGADORA = 2 AND BF1.IDSITBENEFICIO = 3) ');
        SQL.Add(' UNION ');
        SQL.Add(' SELECT VALORATUAL FROM BENEFBFCIARIO BF WHERE BF.IDBENEFICIO IN (163,168,166,169,162) AND BF.FONTEPAGADORA = 2 ');
        SQL.Add(' AND BF.IDSITBENEFICIO = 3 AND BF.IDPESSOA = D.IDPESSOA AND BF.IDTITULAR = D.IDTITULAR AND BF.IDTITULAR <> BF.IDPESSOA ');
        SQL.Add(' AND BF.DATAFINAL = (SELECT MAX(BF1.DATAFINAL) FROM BENEFBFCIARIO BF1 WHERE BF1.IDPESSOA = BF.IDPESSOA AND BF1.IDTITULAR = BF.IDTITULAR AND ');
        SQL.Add(' BF1.IDBENEFICIO IN (163,168,166,169,162) AND BF1.FONTEPAGADORA = 2 AND BF1.IDSITBENEFICIO = 3)) VALORINSS,  (SELECT VALORATUAL ');
        SQL.Add(' FROM BENEFBFCIARIO BF WHERE BF.IDBENEFICIO IN (149,154,159,156) AND BF.FONTEPAGADORA = 1 AND BF.IDSITBENEFICIO = 3 AND BF.IDPESSOA = D.IDPESSOA ');
        SQL.Add(' AND BF.IDTITULAR = D.IDTITULAR AND BF.IDTITULAR = BF.IDPESSOA AND BF.DATAFINAL = (SELECT MAX(BF1.DATAFINAL) ');
        SQL.Add(' FROM BENEFBFCIARIO BF1 WHERE BF1.IDPESSOA = BF.IDPESSOA AND BF1.IDTITULAR = BF.IDTITULAR AND ');
        SQL.Add(' BF1.IDBENEFICIO IN (149,154,159,156) AND BF1.FONTEPAGADORA = 1 AND BF1.IDSITBENEFICIO = 3) ');
        SQL.Add(' UNION ');
        SQL.Add(' SELECT VALORATUAL FROM BENEFBFCIARIO BF WHERE BF.IDBENEFICIO IN (164,338) AND BF.FONTEPAGADORA = 1 ');
        SQL.Add(' AND BF.IDSITBENEFICIO = 3 AND BF.IDPESSOA = D.IDPESSOA AND BF.IDTITULAR = D.IDTITULAR AND BF.IDTITULAR <> BF.IDPESSOA ');
        SQL.Add(' AND BF.DATAFINAL = (SELECT MAX(BF1.DATAFINAL) FROM BENEFBFCIARIO BF1 WHERE BF1.IDPESSOA = BF.IDPESSOA AND ');
        SQL.Add(' BF1.IDTITULAR = BF.IDTITULAR AND BF1.IDBENEFICIO IN (164,338) AND BF1.FONTEPAGADORA = 1 AND BF1.IDSITBENEFICIO = 3)) VALORFUNCEF ');
        SQL.Add(' FROM DEPENTIT D ');
        SQL.Add(' WHERE D.IDPESSOA  =  '+ sIdPessoaPesquisa );
        SQL.Add(' AND   D.IDTITULAR =  '+ sIdTitularPesquisa +' ) ');
        Open;
        sResult  := FieldByName('valorpeculio').AsString;
     end;

     //Auxílio Funeral REG/REPLAN Não Saldado Ativo-------------------------------------------------------------------------
     //IDBENEFICIO = 256

     if  trim(sIdBeneficio) = '256' then
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT d.matricula,d.idpessoa, d.idtitular, pf.datamorte, (SELECT AVG(h.valorprovento) FROM histrubsal h ');
        SQL.Add(' WHERE h.codprovdesc = ''RBAS'' AND h.idrubrica = 32480 AND h.idpessoa = d.idpessoa AND h.idtitular = d.idtitular AND ');
        SQL.Add(' h.mes = to_char(add_months(pf.datamorte,-1),''YYYY/MM'')) valorpeculio ');
        SQL.Add(' FROM depentit d JOIN pessoafisica pf ON d.idpessoa = pf.idpessoa ');
        SQL.Add(' WHERE D.IDPESSOA  =  '+ sIdPessoaPesquisa );
        SQL.Add(' AND   D.IDTITULAR =  '+ sIdTitularPesquisa );
        Open;
        sResult  := FieldByName('valorpeculio').AsString;
     end;


  end;
  if trim(sResult) = '' Then
     sResult := '0';
  Result := sResult;
end;
// SOL 136385/7221 Kintana 1512983


//Fanuel Junior SOL136385.7221 Kintana1250247
{===========================================================================================}
{ Formula VALORESBENEFICIO                                                                  }
{   A formula retorna os valores da tabela BENEFBFCIARIO de acordo com os valores passados  }
{ SINTAXE:                                                                                  }
{  VALORESBENEFICIO(IDBENEFICIO,FLGVALOR,IDPLANOPREV,FONTEPAGADORA,SITUACAOBENEFICIO,IDPESSOAPESQUISA)        }
Function VALORESBENEFICIO(Regra : TRegra; Formula : String) : String;
Var
  sResult, sFormulaAux ,sValor,
  sIdBeneficio, sIdPlanoPrev, sCampo,
  sFontePagadora, sSituacao, sSQL ,
  sIdPessoa, sIdTitular: String;
  I, iFlgValor : Integer;
  qryBenef : TwwQuery;
Begin


  Result := '';
  //Retorna o nome da formula
  sFormulaAux := Copy(Formula,18,Length(Formula));
  sFormulaAux := Copy(sFormulaAux,1,Length(sFormulaAux)-1);
   //VALORESBENEFICIO(,,,,,,)

  {Retira o IDBENEFICIO}

  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sValor := Copy(sFormulaAux,1,I-1);
  sValor := Regra.PegaValor(sValor);
  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

  //If Regra.QueryIn.FindField('IDBENEFICIO') = Nil then
  if sValor <> '' then
     sIdBeneficio := sValor
  else
     If Regra.QueryIn.FindField('IDBENEFICIO') <> Nil then
        sIdBeneficio := Regra.QueryIn.FieldByName('IDBENEFICIO').AsString;
  {IDBENEFICIO}

  {Retira o FLGVALOR}
  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sValor := Copy(sFormulaAux,1,I-1);
  sValor := Regra.PegaValor(sValor);
  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

  //If Regra.QueryIn.FindField('FLGVALOR') = Nil then
  if sValor <> '' then
     iFlgValor := StrToInt(sValor)
  else
     If Regra.QueryIn.FindField('FLGVALOR') <> Nil then
        iFlgValor := Regra.QueryIn.FieldByName('FLGVALOR').AsInteger;
  {FLGVALOR}


  {Retira o IDPLANOPREV}
  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sValor := Copy(sFormulaAux,1,I-1);
  sValor := Regra.PegaValor(sValor);
  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

  //If Regra.QueryIn.FindField('IDPLANOPREV') = Nil then
  if sValor <> '' then
     sIdPlanoPrev := sValor
  else
     If Regra.QueryIn.FindField('IDPLANOPREV') <> Nil then
        sIdPlanoPrev := Regra.QueryIn.FieldByName('IDPLANOPREV').AsString;
  {IDPLANOPREV}

  {Retira o FONTEPAGADORA}
  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sValor := Copy(sFormulaAux,1,I-1);
  sValor := Regra.PegaValor(sValor);
  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

  //If Regra.QueryIn.FindField('FONTEPAGADORA') = Nil then
  if sValor <> '' then
     sFontePagadora := sValor
  else
     If Regra.QueryIn.FindField('FONTEPAGADORA') <> Nil then
        sFontePagadora := Regra.QueryIn.FieldByName('FONTEPAGADORA').AsString;
  {FONTEPAGADORA}

  {Retira o SITUACAOBENEFICIO}
  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sValor := Copy(sFormulaAux,1,I-1);
  sValor := Regra.PegaValor(sValor);
    sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

  //If Regra.QueryIn.FindField('IDSITBENEFICIO ') = Nil then
  if sValor <> '' then
     sSituacao := sValor
  else
     If Regra.QueryIn.FindField('IDSITBENEFICIO ') <> Nil then
        sSituacao := Regra.QueryIn.FieldByName('IDSITBENEFICIO ').AsString;
  {SITUACAOBENEFICIO}

  {Retira o IDPESSOAPESQUISA}
  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sValor := Copy(sFormulaAux,1,I-1);
  sValor := Regra.PegaValor(sValor);
  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

  //If Regra.QueryIn.FindField('IDPESSOA') = Nil then
  if sValor <> '' then
     sIdPessoa := sValor
  else
     If Regra.QueryIn.FindField('IDPESSOA') <> Nil then
        sIdPessoa := Regra.QueryIn.FieldByName('IDPESSOA').AsString;
  {IDPESSOAPESQUISA}

  {Retira o IDTITULARPESQUISA}
  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sValor := Copy(sFormulaAux,1,I-1);
  sValor := Regra.PegaValor(sValor);
  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

  //If Regra.QueryIn.FindField('IDTITULAR') = Nil then
  If sValor <> '' then
     sIdTitular := sValor
  else
     If Regra.QueryIn.FindField('IDTITULAR') <> Nil then
        sIdTitular := Regra.QueryIn.FieldByName('IDTITULAR').AsString;
  {IDTITULARPESQUISA}

  {Paramentro da query}
  sSQL := '';

  case iFlgValor of
     0 : begin
            sSQL   := 'SELECT VALORSRB FROM BENEFBFCIARIO WHERE';
            sCampo := 'VALORSRB';

         end;
     1 : begin
            sSQL   := 'SELECT VALORTOTAL FROM BENEFBFCIARIO WHERE';
            sCampo := 'VALORTOTAL';

         end;
     2 : begin
            sSQL   := 'SELECT VALORATUAL FROM BENEFBFCIARIO WHERE';
            sCampo := 'VALORATUAL';
         end;
  end;

  sSQL := sSQL + ' IDBENEFICIO = '+sIdBeneficio+#13;


  if sIdPlanoPrev <> '' then
     sSQL := sSQL + 'AND IDPLANOPREV = '+sIdPlanoPrev+#13;

  if sFontePagadora <> '' then
     sSQL := sSQL + 'AND FONTEPAGADORA = '+sFontePagadora+#13;

  if sSituacao <> '' then
     sSQL := sSQL + 'AND IDSITBENEFICIO = '+sSituacao+#13;

  //if sIdPessoa <> '' then                             //edilaine WO12189
  if (sIdPessoa <> '') and (sIdPessoa <> '-1') then     //edilaine WO12189
     sSQL := sSQL + 'AND IDPESSOA = '+sIdPessoa +#13;

  if sIdTitular <> '' then
     sSQL := sSQL + 'AND IDTITULAR = '+sIdTitular+#13;
  {Paramentro da query}

  {ExecutaQuery}
  qryBenef := TwwQuery.Create(nil);
  qryBenef.DataBaseName := Regra.DatabaseName;
  qryBenef.Close;
  qryBenef.SQL.Clear;
  qryBenef.SQL.Add(sSQL);
  qryBenef.Open;

  Result := qryBenef.FieldByName(sCampo).AsString;

  qryBenef.Close;
  FreeAndNil(qryBenef);
end;
//Fanuel Junior SOL136385.7221 Kintana1250247

 //ELS SOL 159196 KINTANA 1302968 INICIO
{******************************************************************************}
{ Formula, ADICIONALPERC (DATAREF, TIPO_ADICIONAL, CODPESSOA)
{------------------------------------------------------------------------------}
Function ADICIONALPERC(Regra : TRegra; Formula : String) : string;
Var
  sCodPessoa,sFormulaAux,sSQL,sDataRef, sFiltro,sTipoAdicional, sPercentualPeric : String;//SOL 136384/10262 Kintana 1688458
  I :Integer;
  QryAux, QryAuxPreric1, QryAuxPreric2, QryAuxPreric3, QryAuxPreric4 : TwwQuery;
Begin

  sCodPessoa    := '';
  sDataRef   := '';
  sPercentualPeric := '';

  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                          }

  { Retira Nome da Formula }
  sFormulaAux := Copy(Formula,15,Length(Formula));
  sFormulaAux := Copy(sFormulaAux,1,Length(sFormulaAux)-1);
  //ADICIONALPERC
  //inicio SOL 136384/10262 Kintana 1688458
  { Pega data Inicio }
  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sDataRef := Copy(sFormulaAux,1,(I-1));
  sDataRef := Regra.PegaValor(sDataRef);
  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

  if sDataRef = '' then
    if Regra.FQueryIn.FindField('DATAREF') <> NIL Then
       sDataRef := Regra.FQueryIn.FieldByName('DATAREF').AsString;
  //fim SOL 136384/10262 Kintana 1688458
  { Pega sTipoAdicional}
  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sTipoAdicional := Copy(sFormulaAux,1,I-1);
  sTipoAdicional := Regra.PegaValor(sTipoAdicional);
  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

  if sTipoAdicional = '' then
    if Regra.FQueryIn.FindField('TIPO_ADICIONAL') <> NIL Then
       sTipoAdicional := Regra.FQueryIn.FieldByName('TIPO_ADICIONAL').AsString;

  { Verifica Campos Obrigatórios ( IDPESSOA ) }
  If Regra.FQueryIn.FindField('IDPESSOA') = NIL Then
     Begin                      { IDPESSOA }
        MsgDlg('Campo IDPESSOA, necessário no Sql de entrada ',
               'Regra - Erro',mtError,[mbOk],0);
        Regra.fError := True;
        Exit;
     End
  else
    sCodPessoa := Regra.FQueryIn.FieldByName('IDPESSOA').AsString;
  //inicio André Oliveira SOL 136384/10262 Kintana 1688458
  QryAux := TwwQuery.Create(Application);
  QryAux.DatabaseName  := 'BASEDADOS';
  QryAuxPreric1 := TwwQuery.Create(Application);
  QryAuxPreric1.DatabaseName  := 'BASEDADOS';
  QryAuxPreric2 := TwwQuery.Create(Application);
  QryAuxPreric2.DatabaseName  := 'BASEDADOS';
  QryAuxPreric3 := TwwQuery.Create(Application);
  QryAuxPreric3.DatabaseName  := 'BASEDADOS';
  QryAuxPreric4 := TwwQuery.Create(Application);
  QryAuxPreric4.DatabaseName  := 'BASEDADOS';

   (*
 'T'   PERCATS                   Percentual do ATS
 'I'   PERCINSALUB               Percentual de Insalubridade
 'P'   PERCPERICUL y              Percentual de Periculosidade
 'C'   PERC1AC                   Primeiro Percentual do Adicional Compensatório
 'N'   PERCADNOT                 Percentual de Adicional Noturno
 'C2'  PERC2AC                   Segundo Percentual do Adicional Compensatório
 'A'   PERCINCORP                Percentual do adicional de incorporação
  *)


  {if sTipoAdicional = 'T' then
     sFiltro := ' AND EFP.PERCATS > 0 ';

  if sTipoAdicional = 'I' then
     sFiltro := ' AND EFP.PERCINSALUB > 0 ';

  if sTipoAdicional = 'P' then
     sFiltro := ' AND EFP.PERCPERICUL > 0 ';

  if sTipoAdicional = 'C' then
     sFiltro := ' AND EFP.PERC1AC > 0 ';

  if sTipoAdicional = 'N' then
     sFiltro := ' AND EFP.PERCADNOT > 0 ';

  if sTipoAdicional = 'C2' then
     sFiltro := ' AND EFP.PERC2AC > 0 ';

    if sTipoAdicional = 'A' then
     sFiltro := ' AND EFP.PERCINCORP > 0 ';   }

  { Monta SQL }
   {sSQL := sSQL +
   ' SELECT (MEDIA12 / 100) * (OCORRENCIAS36 / 36) AS M12                                    '+
   ' FROM (SELECT COUNT(*) OCORRENCIAS36                                                     '+
   '       FROM (SELECT DISTINCT REPLACE(TO_CHAR(TO_CHAR(P.PEREXERCICIO) || ''/'' ||         '+
   '                                             TO_CHAR(P.PERNUMERO, ''00'')),              '+
   '                                     '' '',                                              '+
   '                                     '''') ANOMES,                                       '+ // SOL 136384/9642 Kintana 1664883 ' ' para ''
   '                             P.PERNUMERO                                                 '+
   '               FROM PERIODO P                                                            '+
   '              WHERE P.PERNUMERO NOT IN (0, 13)) P                                        '+
   '       JOIN EVOLFUNCPREV EFP ON P.ANOMES BETWEEN                                         '+
   '                                TO_CHAR(EFP.DATAINICIO, ''YYYY/MM'') AND                 '+
   '                                TO_CHAR(EFP.DATAFINAL, ''YYYY/MM'')                      '+
   '                            AND EFP.IDPESSOA = '+sCODPESSOA +
   sFiltro +
   '      WHERE P.ANOMES BETWEEN                                                             '+
   '            TO_CHAR(ADD_MONTHS('+QuotedStr(sDataRef)+', -36), ''YYYY/MM'') AND                      '+
   '            TO_CHAR(TO_DATE(ADD_MONTHS('+QuotedStr(sDataRef)+', -1)), ''YYYY/MM'')                  '+
   '      ORDER BY P.ANOMES) OC36,                                                           '+
   '    (SELECT SUM(EFP.PERCPERICUL) / 12 MEDIA12                                            '+
   '       FROM (SELECT DISTINCT REPLACE(TO_CHAR(TO_CHAR(P.PEREXERCICIO) || ''/'' ||         '+
   '                                             TO_CHAR(P.PERNUMERO, ''00'')),              '+
   '                                     '' '',                                              '+
   '                                     '''') ANOMES,                                       '+ // SOL 136384/9642 Kintana 1664883 ' ' para ''
   '                             P.PERNUMERO  FROM PERIODO P                                 '+
   '                             WHERE P.PERNUMERO NOT IN (0, 13)                            '+
   '             ) P                                                                         '+
   '       JOIN EVOLFUNCPREV EFP ON P.ANOMES BETWEEN                                         '+
   '                                TO_CHAR(EFP.DATAINICIO, ''YYYY/MM'') AND                 '+
   '                                TO_CHAR(EFP.DATAFINAL, ''YYYY/MM'')                      '+
   '                            AND EFP.IDPESSOA = '+sCODPESSOA +
   sFiltro +
   '      WHERE P.ANOMES BETWEEN                                                              '+
   '           TO_CHAR(ADD_MONTHS('+QuotedStr(sDataRef)+', -12), ''YYYY/MM'') AND                       '+
   '           TO_CHAR(TO_DATE(ADD_MONTHS('+QuotedStr(sDataRef)+', -1)), ''YYYY/MM'')                   '+
   '     ORDER BY P.ANOMES) MD12                                                             ';


   if(sTipoAdicional = 'P')then
   begin
        sSQL := sSQL+
        'SELECT NVL(ROUND((LEAST(((OCORRENCIAS12/30)/12),1)*LEAST(((OCORRENCIAS36/30)/36),1)*MEDIA12),2),0) PERCENTUAL'
        '  FROM (SELECT COUNT(*) OCORRENCIAS36'
        '          FROM (SELECT DISTINCT datacalend'
        '                FROM cm.datascalend@tst'
        '                WHERE datacalend BETWEEN last_day(ADD_MONTHS('+QuotedStr(sDataRef)+',-37)) AND'
        '                                         last_day(ADD_MONTHS('+QuotedStr(sDataRef)+',-1))) P'
        '          JOIN EVOLFUNCPREV EFP'
        '            ON P.datacalend >= EFP.DATAINICIO AND'
        '               (P.datacalend <= EFP.DATAFINAL OR efp.datafinal IS NULL)'
        '           AND EFP.IDPESSOA = ''+sCODPESSOA'
        '           AND EFP.PERCPERICUL > 0) OC36,'
        '       (SELECT COUNT(*) OCORRENCIAS12'
        '          FROM (SELECT DISTINCT datacalend'
        '                FROM cm.datascalend@tst'
        '                WHERE datacalend BETWEEN last_day(ADD_MONTHS('+QuotedStr(sDataRef)+',-13)) AND'
        '                                         last_day(ADD_MONTHS('+QuotedStr(sDataRef)+',-1))) P'
        '          JOIN EVOLFUNCPREV EFP'
        '            ON P.datacalend >= EFP.DATAINICIO AND'
        '               (P.datacalend <= EFP.DATAFINAL OR efp.datafinal IS NULL)'
        '           AND EFP.IDPESSOA = ''+sCODPESSOA'
        '           AND EFP.PERCPERICUL > 0) OC12,'
        '       (SELECT SUM(EFP.PERCPERICUL)/COUNT(*) MEDIA12'
        '          FROM (SELECT DISTINCT datacalend'
        '                FROM cm.datascalend@tst'
        '                WHERE datacalend BETWEEN last_day(ADD_MONTHS('+QuotedStr(sDataRef)+',-13)) AND'
        '                                         last_day(ADD_MONTHS('+QuotedStr(sDataRef)+',-1))) P'
        '          JOIN EVOLFUNCPREV EFP'
        '            ON P.datacalend >= EFP.DATAINICIO AND'
        '               (P.datacalend <= EFP.DATAFINAL OR efp.datafinal IS NULL)'
        '           AND EFP.IDPESSOA = '+sCODPESSOA+
        '           AND EFP.PERCPERICUL > 0) MD12';        }
   if(sTipoAdicional = 'P') then
         with QryAux do
         begin
              CLose;
              SQL.Clear;
              SQL.Add('SELECT NVL(ROUND((LEAST(((OCORRENCIAS12/30)/12),1)*LEAST(((OCORRENCIAS36/30)/36),1)*MEDIA12),2),0) PERCENTUAL');
              SQL.Add('  FROM (SELECT COUNT(*) OCORRENCIAS36');
              SQL.Add('          FROM (SELECT DISTINCT DATAADIC');
              SQL.Add('                FROM DTPERCADIC');
              SQL.Add('                WHERE DATAADIC BETWEEN last_day(ADD_MONTHS(' +QuotedStr(sDataRef)+',-37)) AND');
              SQL.Add('                                         last_day(ADD_MONTHS(' +QuotedStr(sDataRef)+',-1))) P');
              SQL.Add('          JOIN EVOLFUNCPREV EFP');
              SQL.Add('            ON P.DATAADIC >= EFP.DATAINICIO AND');
              SQL.Add('               (P.DATAADIC <= EFP.DATAFINAL OR efp.datafinal IS NULL)');
              SQL.Add('           AND EFP.IDPESSOA = ' +sCODPESSOA);
              SQL.Add('           AND EFP.PERCPERICUL > 0) OC36,');
              SQL.Add('       (SELECT COUNT(*) OCORRENCIAS12');
              SQL.Add('          FROM (SELECT DISTINCT DATAADIC');
              SQL.Add('                FROM DTPERCADIC');
              SQL.Add('                WHERE DATAADIC BETWEEN last_day(ADD_MONTHS(' +QuotedStr(sDataRef)+',-13)) AND');
              SQL.Add('                                         last_day(ADD_MONTHS(' +QuotedStr(sDataRef)+',-1))) P');
              SQL.Add('          JOIN EVOLFUNCPREV EFP');
              SQL.Add('            ON P.DATAADIC >= EFP.DATAINICIO AND');
              SQL.Add('               (P.DATAADIC <= EFP.DATAFINAL OR efp.datafinal IS NULL)');
              SQL.Add('           AND EFP.IDPESSOA = ' +sCODPESSOA );
              SQL.Add('           AND EFP.PERCPERICUL > 0) OC12,');
              SQL.Add('       (SELECT SUM(EFP.PERCPERICUL)/COUNT(*) MEDIA12');
              SQL.Add('          FROM (SELECT DISTINCT DATAADIC');
              SQL.Add('                FROM DTPERCADIC');
              SQL.Add('                WHERE DATAADIC BETWEEN last_day(ADD_MONTHS(' +QuotedStr(sDataRef)+',-13)) AND');
              SQL.Add('                                         last_day(ADD_MONTHS(' +QuotedStr(sDataRef)+',-1))) P');
              SQL.Add('          JOIN EVOLFUNCPREV EFP');
              SQL.Add('            ON P.DATAADIC >= EFP.DATAINICIO AND');
              SQL.Add('               (P.DATAADIC <= EFP.DATAFINAL OR efp.datafinal IS NULL)');
              SQL.Add('           AND EFP.IDPESSOA = ' +sCODPESSOA);
              SQL.Add('           AND EFP.PERCPERICUL > 0) MD12');
              Open;
              if not Eof then
              begin
                   Result :=  FieldByName('PERCENTUAL').AsString;
              end;

         end
   else if(sTipoAdicional = 'I')then
   begin
        with QryAuxPreric1 do
        begin
            CLose;
            SQL.Clear;
            SQL.Add('SELECT NVL(ROUND((LEAST(((OCORRENCIAS12/30)/12),1)*LEAST(((OCORRENCIAS36/30)/36),1)*MEDIA12),2),0) PERCENTUAL');
            SQL.Add('  FROM (SELECT COUNT(*) OCORRENCIAS36');
            SQL.Add('          FROM (SELECT DISTINCT DATAADIC');
            SQL.Add('                FROM DTPERCADIC');
            SQL.Add('                WHERE DATAADIC BETWEEN last_day(ADD_MONTHS('+QuotedStr(sDataRef)+',-37)) AND');
            SQL.Add('                                         last_day(ADD_MONTHS('+QuotedStr(sDataRef)+',-1))) P');
            SQL.Add('          JOIN EVOLFUNCPREV EFP');
            SQL.Add('            ON P.DATAADIC >= EFP.DATAINICIO AND');
            SQL.Add('               (P.DATAADIC <= EFP.DATAFINAL OR efp.datafinal IS NULL)');
            SQL.Add('           AND EFP.IDPESSOA = '+sCODPESSOA);
            SQL.Add('           AND EFP.PERCINSALUB > 0) OC36,');
            SQL.Add('       (SELECT COUNT(*) OCORRENCIAS12');
            SQL.Add('          FROM (SELECT DISTINCT DATAADIC');
            SQL.Add('                FROM DTPERCADIC');
            SQL.Add('                WHERE DATAADIC BETWEEN last_day(ADD_MONTHS('+QuotedStr(sDataRef)+', -13)) AND');
            SQL.Add('                                         last_day(ADD_MONTHS('+QuotedStr(sDataRef)+',-1))) P');
            SQL.Add('          JOIN EVOLFUNCPREV EFP');
            SQL.Add('            ON P.DATAADIC >= EFP.DATAINICIO AND');
            SQL.Add('               (P.DATAADIC <= EFP.DATAFINAL OR efp.datafinal IS NULL)');
            SQL.Add('           AND EFP.IDPESSOA = '+sCODPESSOA);
            SQL.Add('           AND EFP.PERCINSALUB > 0) OC12,');
            SQL.Add('       (SELECT SUM(EFP.PERCINSALUB)/COUNT(*) MEDIA12');
            SQL.Add('          FROM (SELECT DISTINCT DATAADIC');
            SQL.Add('                FROM DTPERCADIC');
            SQL.Add('                WHERE DATAADIC BETWEEN last_day(ADD_MONTHS('+QuotedStr(sDataRef)+', -13)) AND');
            SQL.Add('                                         last_day(ADD_MONTHS('+QuotedStr(sDataRef)+',-1))) P');
            SQL.Add('          JOIN EVOLFUNCPREV EFP');
            SQL.Add('            ON P.DATAADIC >= EFP.DATAINICIO AND');
            SQL.Add('               (P.DATAADIC <= EFP.DATAFINAL OR efp.datafinal IS NULL)');
            SQL.Add('           AND EFP.IDPESSOA = '+sCODPESSOA);
            SQL.Add('           AND EFP.PERCINSALUB > 0) OC12');
            Open;
            if not Eof then
            begin
                 Result := FieldByName('PERCENTUAL').AsString;
                 sPercentualPeric := FieldByName('PERCENTUAL').AsString;
            end;

            if (IsEmpty) or (sPercentualPeric = '0')   then
            begin
                with QryAuxPreric2 do
                begin
                    CLose;
                    SQL.Clear;
                    SQL.Add('SELECT NVL(ROUND((LEAST(((OCORRENCIAS12/30)/12),1)*LEAST(((OCORRENCIAS36/30)/36),1)*MEDIA12),2),0) PERCENTUAL');
                    SQL.Add('  FROM (SELECT COUNT(*) OCORRENCIAS36');
                    SQL.Add('          FROM (SELECT DISTINCT DATAADIC');
                    SQL.Add('                FROM DTPERCADIC');
                    SQL.Add('                WHERE DATAADIC BETWEEN last_day(ADD_MONTHS('+QuotedStr(sDataRef)+',-37)) AND');
                    SQL.Add('                                         last_day(ADD_MONTHS('+QuotedStr(sDataRef)+',-1))) P  --31/01/1997 --31/01/2000');
                    SQL.Add('          JOIN EVOLFUNCPREV EFP');
                    SQL.Add('            ON P.DATAADIC >= EFP.DATAINICIO AND');
                    SQL.Add('               (P.DATAADIC <= EFP.DATAFINAL OR efp.datafinal IS NULL)');
                    SQL.Add('           AND EFP.IDPESSOA =  ' + sCODPESSOA);
                    SQL.Add('           AND EXISTS (SELECT 1');
                    SQL.Add('                       FROM cargoext ce');
                    SQL.Add('                       WHERE ce.idcargoext = efp.idcargoext AND');
                    SQL.Add('                             ce.tipo = ''C'' AND');
                    SQL.Add('                             (ce.codigo LIKE ''ME%'' OR');
                    SQL.Add('                              ce.codigo LIKE ''MD%'' OR');
                    SQL.Add('                              ce.codigo LIKE ''DE%'' OR');
                    SQL.Add('                              ce.codigo LIKE ''91%'' OR');
                    SQL.Add('                              ce.codigo LIKE ''94%''))) OC36,');
                    SQL.Add('       (SELECT COUNT(*) OCORRENCIAS12');
                    SQL.Add('          FROM (SELECT DISTINCT DATAADIC');
                    SQL.Add('                FROM DTPERCADIC');
                    SQL.Add('                WHERE DATAADIC BETWEEN last_day(ADD_MONTHS('+QuotedStr(sDataRef)+', -13)) AND');
                    SQL.Add('                                         last_day(ADD_MONTHS('+QuotedStr(sDataRef)+',-1))) P');
                    SQL.Add('          JOIN EVOLFUNCPREV EFP');
                    SQL.Add('            ON P.DATAADIC >= EFP.DATAINICIO AND');
                    SQL.Add('               (P.DATAADIC <= EFP.DATAFINAL OR efp.datafinal IS NULL)');
                    SQL.Add('           AND EFP.IDPESSOA =  ' + sCODPESSOA);
                    SQL.Add('           AND EXISTS (SELECT 1');
                    SQL.Add('                       FROM cargoext ce');
                    SQL.Add('                       WHERE ce.idcargoext = efp.idcargoext AND');
                    SQL.Add('                             ce.tipo = ''C'' AND');
                    SQL.Add('                             (ce.codigo LIKE ''ME%'' OR');
                    SQL.Add('                              ce.codigo LIKE ''MD%'' OR');
                    SQL.Add('                              ce.codigo LIKE ''DE%'' OR');
                    SQL.Add('                              ce.codigo LIKE ''91%'' OR');
                    SQL.Add('                              ce.codigo LIKE ''94%''))) OC12,');
                    SQL.Add('       (SELECT SUM(40)/COUNT(*) MEDIA12');
                    SQL.Add('          FROM (SELECT DISTINCT DATAADIC');
                    SQL.Add('                FROM DTPERCADIC');
                    SQL.Add('                WHERE DATAADIC BETWEEN last_day(ADD_MONTHS('+QuotedStr(sDataRef)+', -13)) AND');
                    SQL.Add('                                         last_day(ADD_MONTHS('+QuotedStr(sDataRef)+',-1))) P');
                    SQL.Add('          JOIN EVOLFUNCPREV EFP');
                    SQL.Add('            ON P.DATAADIC >= EFP.DATAINICIO AND');
                    SQL.Add('               (P.DATAADIC <= EFP.DATAFINAL OR efp.datafinal IS NULL)');
                    SQL.Add('           AND EFP.IDPESSOA =  ' + sCODPESSOA);
                    SQL.Add('           AND EXISTS (SELECT 1');
                    SQL.Add('                       FROM cargoext ce');
                    SQL.Add('                       WHERE ce.idcargoext = efp.idcargoext AND');
                    SQL.Add('                             ce.tipo = ''C'' AND');
                    SQL.Add('                             (ce.codigo LIKE ''ME%'' OR');
                    SQL.Add('                              ce.codigo LIKE ''MD%'' OR');
                    SQL.Add('                              ce.codigo LIKE ''DE%'' OR');
                    SQL.Add('                              ce.codigo LIKE ''91%'' OR');
                    SQL.Add('                              ce.codigo LIKE ''94%''))) OC12');
                    Open;
                    if not Eof then
                    begin
                         Result := FieldByName('PERCENTUAL').AsString;
                         sPercentualPeric := FieldByName('PERCENTUAL').AsString;
                    end;

                    if (IsEmpty) or (sPercentualPeric = '0')   then
                    begin
                        with QryAuxPreric3 do
                        begin
                            CLose;
                            SQL.Clear;
                            SQL.Add('SELECT OCORRENCIAS12,');
                            SQL.Add('       OCORRENCIAS36,');
                            SQL.Add('       LEAST(((OCORRENCIAS12/30)/12),1),');
                            SQL.Add('       LEAST(((OCORRENCIAS36/30)/36),1),');
                            SQL.Add('       NVL(ROUND((LEAST(((OCORRENCIAS12/30)/12),1)*LEAST(((OCORRENCIAS36/30)/36),1)*MEDIA12),2),0) PERCENTUAL');
                            SQL.Add('  FROM (SELECT COUNT(*) OCORRENCIAS36');
                            SQL.Add('          FROM (SELECT DISTINCT DATAADIC');
                            SQL.Add('                FROM DTPERCADIC');
                            SQL.Add('                WHERE DATAADIC BETWEEN last_day(ADD_MONTHS('+QuotedStr(sDataRef)+',-37)) AND');
                            SQL.Add('                                         last_day(ADD_MONTHS('+QuotedStr(sDataRef)+',-1))) P  --31/01/1997 --31/01/2000');
                            SQL.Add('          JOIN EVOLFUNCPREV EFP');
                            SQL.Add('            ON P.DATAADIC >= EFP.DATAINICIO AND');
                            SQL.Add('               (P.DATAADIC <= EFP.DATAFINAL OR efp.datafinal IS NULL)');
                            SQL.Add('           AND EFP.IDPESSOA =  '+ sCODPESSOA);
                            SQL.Add('           AND EXISTS (SELECT 1');
                            SQL.Add('                       FROM cargoext ce');
                            SQL.Add('                       WHERE ce.idcargoext = efp.idcargoext AND');
                            SQL.Add('                             ce.tipo = ''C'' AND');
                            SQL.Add('                             (ce.codigo LIKE ''ENF%'' OR');
                            SQL.Add('                              ce.codigo LIKE ''AE7%''))) OC36,');
                            SQL.Add('       (SELECT COUNT(*) OCORRENCIAS12');
                            SQL.Add('          FROM (SELECT DISTINCT DATAADIC');
                            SQL.Add('                FROM DTPERCADIC');
                            SQL.Add('                WHERE DATAADIC BETWEEN last_day(ADD_MONTHS('+QuotedStr(sDataRef)+', -13)) AND');
                            SQL.Add('                                         last_day(ADD_MONTHS('+QuotedStr(sDataRef)+',-1))) P');
                            SQL.Add('          JOIN EVOLFUNCPREV EFP');
                            SQL.Add('            ON P.DATAADIC >= EFP.DATAINICIO AND');
                            SQL.Add('               (P.DATAADIC <= EFP.DATAFINAL OR efp.datafinal IS NULL)');
                            SQL.Add('           AND EFP.IDPESSOA =  '+ sCODPESSOA);
                            SQL.Add('           AND EXISTS (SELECT 1');
                            SQL.Add('                       FROM cargoext ce');
                            SQL.Add('                       WHERE ce.idcargoext = efp.idcargoext AND');
                            SQL.Add('                             ce.tipo = ''C'' AND');
                            SQL.Add('                             (ce.codigo LIKE ''ENF%'' OR');
                            SQL.Add('                              ce.codigo LIKE ''AE7%''))) OC12,');
                            SQL.Add('       (SELECT SUM(40)/COUNT(*) MEDIA12');
                            SQL.Add('          FROM (SELECT DISTINCT DATAADIC');
                            SQL.Add('                FROM DTPERCADIC');
                            SQL.Add('                WHERE DATAADIC BETWEEN last_day(ADD_MONTHS('+QuotedStr(sDataRef)+', -13)) AND');
                            SQL.Add('                                         last_day(ADD_MONTHS('+QuotedStr(sDataRef)+',-1))) P');
                            SQL.Add('          JOIN EVOLFUNCPREV EFP');
                            SQL.Add('            ON P.DATAADIC >= EFP.DATAINICIO AND');
                            SQL.Add('               (P.DATAADIC <= EFP.DATAFINAL OR efp.datafinal IS NULL)');
                            SQL.Add('           AND EFP.IDPESSOA =  '+ sCODPESSOA);
                            SQL.Add('           AND EXISTS (SELECT 1');
                            SQL.Add('                       FROM cargoext ce');
                            SQL.Add('                       WHERE ce.idcargoext = efp.idcargoext AND');
                            SQL.Add('                             ce.tipo = ''C'' AND');
                            SQL.Add('                             (ce.codigo LIKE ''ENF%'' OR');
                            SQL.Add('                              ce.codigo LIKE ''AE7%''))) OC12');
                            Open;
                            if not Eof then
                            begin
                                 Result := FieldByName('PERCENTUAL').AsString;
                                 sPercentualPeric := FieldByName('PERCENTUAL').AsString;
                            end;

                            if (IsEmpty) or (sPercentualPeric = '0')   then
                            begin
                                with QryAuxPreric4 do
                                begin
                                    CLose;
                                    SQL.Clear;
                                    SQL.Add('SELECT NVL(ROUND((LEAST(((OCORRENCIAS12/30)/12),1)*LEAST(((OCORRENCIAS36/30)/36),1)*MEDIA12),2),0) PERCENTUAL');
                                    SQL.Add('  FROM (SELECT COUNT(*) OCORRENCIAS36');
                                    SQL.Add('          FROM (SELECT DISTINCT DATAADIC');
                                    SQL.Add('                FROM DTPERCADIC');
                                    SQL.Add('                WHERE DATAADIC BETWEEN last_day(ADD_MONTHS('+QuotedStr(sDataRef)+',-37)) AND');
                                    SQL.Add('                                         last_day(ADD_MONTHS('+QuotedStr(sDataRef)+',-1))) P  --31/01/1997 --31/01/2000');
                                    SQL.Add('          JOIN EVOLFUNCPREV EFP');
                                    SQL.Add('            ON P.DATAADIC >= EFP.DATAINICIO AND');
                                    SQL.Add('               (P.DATAADIC <= EFP.DATAFINAL OR efp.datafinal IS NULL)');
                                    SQL.Add('           AND EFP.IDPESSOA = '+sCODPESSOA);
                                    SQL.Add('           AND EXISTS (SELECT 1');
                                    SQL.Add('                       FROM cargoext ce');
                                    SQL.Add('                       WHERE ce.idcargoext = efp.idcargoext AND');
                                    SQL.Add('                             ce.tipo = ''F'' AND');
                                    SQL.Add('                             ce.titulo LIKE ''AVALIADOR%'')) OC36,');
                                    SQL.Add('       (SELECT COUNT(*) OCORRENCIAS12');
                                    SQL.Add('          FROM (SELECT DISTINCT DATAADIC');
                                    SQL.Add('                FROM DTPERCADIC');
                                    SQL.Add('                WHERE DATAADIC BETWEEN last_day(ADD_MONTHS('+QuotedStr(sDataRef)+', -13)) AND');
                                    SQL.Add('                                         last_day(ADD_MONTHS('+QuotedStr(sDataRef)+',-1))) P');
                                    SQL.Add('          JOIN EVOLFUNCPREV EFP');
                                    SQL.Add('            ON P.DATAADIC >= EFP.DATAINICIO AND');
                                    SQL.Add('               (P.DATAADIC <= EFP.DATAFINAL OR efp.datafinal IS NULL)');
                                    SQL.Add('           AND EFP.IDPESSOA = '+sCODPESSOA);
                                    SQL.Add('           AND EXISTS (SELECT 1');
                                    SQL.Add('                       FROM cargoext ce');
                                    SQL.Add('                       WHERE ce.idcargoext = efp.idcargoext AND');
                                    SQL.Add('                             ce.tipo = ''F'' AND');
                                    SQL.Add('                             ce.titulo LIKE ''AVALIADOR%'')) OC12,');
                                    SQL.Add('       (SELECT SUM(40)/COUNT(*) MEDIA12');
                                    SQL.Add('          FROM (SELECT DISTINCT DATAADIC');
                                    SQL.Add('                FROM DTPERCADIC');
                                    SQL.Add('                WHERE DATAADIC BETWEEN last_day(ADD_MONTHS('+QuotedStr(sDataRef)+', -13)) AND');
                                    SQL.Add('                                         last_day(ADD_MONTHS('+QuotedStr(sDataRef)+',-1))) P');
                                    SQL.Add('          JOIN EVOLFUNCPREV EFP');
                                    SQL.Add('            ON P.DATAADIC >= EFP.DATAINICIO AND');
                                    SQL.Add('               (P.DATAADIC <= EFP.DATAFINAL OR efp.datafinal IS NULL)');
                                    SQL.Add('           AND EFP.IDPESSOA = '+sCODPESSOA);
                                    SQL.Add('           AND EXISTS (SELECT 1');
                                    SQL.Add('                       FROM cargoext ce');
                                    SQL.Add('                       WHERE ce.idcargoext = efp.idcargoext AND');
                                    SQL.Add('                             ce.tipo = ''F'' AND');
                                    SQL.Add('                             ce.titulo LIKE ''AVALIADOR%'')) OC12');
                                    Open;
                                    if not Eof then
                                    begin
                                         Result := FieldByName('PERCENTUAL').AsString;
                                         sPercentualPeric := FieldByName('PERCENTUAL').AsString;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
   end;


   QryAux.Free;
   QryAuxPreric1.Free;
   QryAuxPreric2.Free;
   QryAuxPreric3.Free;
   QryAuxPreric4.Free;
   //fim André Oliveira SOL 136384/10262 Kintana 1688458
End;
//ELS SOL 159196 KINTANA 1302968 FIM

//Vinicius Ferreira SOL 153972 KINTANA 1169147
Function QTDDIASCFPESSOA(Regra : TRegra; Formula : String) : string;
Var
sSQL, sFormulaAux, sCodigo,sTipo,sAnoMesRef :String;
QryAux : TwwQuery;
Begin
   { Pega sCodigo caso exista }

  //Tirar Nome da Formula e deixar somente os parametros
  sFormulaAux := copy(Formula,17,Length(Formula)-17);

  //Buscar os valores dos Parametros
  sCodigo :='';
  if sFormulaAux <> '' then begin
    sCodigo := Copy(sFormulaAux,1, Pos(',',sFormulaAux)-1);
    sCodigo := Regra.PegaValor(sCodigo);
  end;

  sFormulaAux := copy(sFormulaAux,Pos(',',sFormulaAux)+1 ,Length(sFormulaAux)-Pos(',',sFormulaAux));

  sTipo :='';
  if sFormulaAux <> '' then begin
    sTipo := Copy(sFormulaAux,1, Pos(',',sFormulaAux)-1);
    sTipo := Regra.PegaValor(sTipo);
  end;

  sFormulaAux := copy(sFormulaAux,Pos(',',sFormulaAux)+1 ,Length(sFormulaAux)-Pos(',',sFormulaAux));

  sAnoMesRef :='';

  if sFormulaAux <> '' then begin
    sAnoMesRef := sFormulaAux;
    sAnoMesRef := Regra.PegaValor(sAnoMesRef);
  end;

  { Verifica Campos Obrigatórios ( IDPESSOA ) }
  If Regra.QueryIn.FindField('IDPESSOA') = Nil Then Begin
    Regra.MessageInfo := 'Campo IDPESSOA, necessário no Sql de entrada ';
    Regra.fError := True;
    Exit;
  End;

  QryAux := TwwQuery.Create(Application);
  QryAux.DatabaseName  := 'BASEDADOS';
  {
  sSQL := '';
  sSQL := 'SELECT NVL(SUM(DIAS),0) AS DIAS FROM (';
  sSQL := sSQL + ' SELECT C.CODIGO, E.IDCARGOEXT, E.IDFUNCAO,(LEAST(LAST_DAY(TO_DATE('+ QuotedStr(sAnoMesRef) +' ,''RRRR/MM'')),DATAFINAL)-GREATEST(TO_DATE('+ sAnoMesRef +',''RRRR/MM''),DATAINICIO))+1 AS DIAS    '+
                 ' FROM EVOLFUNCPREV E , CARGOEXT C '+
                 ' WHERE E.IDPESSOA  = '+ Regra.QueryIn.FieldByName('IDPESSOA').AsString +
                 ' AND TO_CHAR(DATAINICIO,''RRRR/MM'') <= '+ QuotedStr(sAnoMesRef) +
                ' AND TO_CHAR(DATAFINAL,''RRRR/MM'') >= '+ QuotedStr(sAnoMesRef);

   IF sTipo = 'C' THEN BEGIN
    sSQL := sSQL + '   AND C.CODIGO  = ' + QuotedStr(sCodigo);
    END ELSE IF sTipo = 'F' then BEGIN
    sSQL := sSQL + ' AND E.IDFUNCAO = '+ QuotedStr(sCodigo);
   end;

    sSQL := sSQL + ' AND  E.idpessjur  = c.idpessjur (+)'+
                   ' AND  E.Idcargoext = c.idcargoext(+)';

    sSQL := sSQL +')';
    }

   IF sTipo = 'F' THEN BEGIN

    sSQL := '';
    sSQL := '  SELECT NVL(SUM(DIAS), 0) AS DIAS  '+
    ' FROM (SELECT C.CODIGO,             '+
    '           E.IDCARGOEXT,            '+
    '           E.IDFUNCAO,              '+
    '           (LEAST(LAST_DAY(TO_DATE('+ QuotedStr(sAnoMesRef) +', ''RRRR/MM'')), DATAFINAL)-GREATEST(TO_DATE('+ QuotedStr(sAnoMesRef) +', ''RRRR/MM''), DATAINICIO)) + 1 AS DIAS '+
    '    FROM EVOLFUNCPREV E, CARGOEXT C                         '+
    '    WHERE E.IDPESSOA = '+ Regra.QueryIn.FieldByName('IDPESSOA').AsString +'  '+
    '      AND TO_CHAR(DATAINICIO, ''RRRR/MM'') <= '+ QuotedStr(sAnoMesRef) +'    '+
    '      AND TO_CHAR(DATAFINAL, ''RRRR/MM'') >= '+ QuotedStr(sAnoMesRef) +'     '+
    '      AND c.codigo = '+ QuotedStr(sCodigo) +'               '+
    '      AND c.tipo = ''F''                                    '+
    '      AND E.IDPESSJUR = C.IDPESSJUR(+)                      '+
    '      AND E.idfuncao = C.IDCARGOEXT(+))                     ';

  END ELSE IF sTipo = 'C' then BEGIN

    sSQL := '';
    sSQL := ' SELECT NVL(SUM(DIAS), 0) AS DIAS  '+
    ' FROM (SELECT C.CODIGO,            '+
    '             E.IDCARGOEXT,         '+
    '             E.IDFUNCAO,           '+
    '             (LEAST(LAST_DAY(TO_DATE('+ QuotedStr(sAnoMesRef) +', ''RRRR/MM'')), DATAFINAL)-GREATEST(TO_DATE('+ QuotedStr(sAnoMesRef) +', ''RRRR/MM''), DATAINICIO)) + 1 AS DIAS  '+
    '      FROM EVOLFUNCPREV E, CARGOEXT C                     '+
    '      WHERE E.IDPESSOA = '+ Regra.QueryIn.FieldByName('IDPESSOA').AsString +'    '+
    '        AND TO_CHAR(DATAINICIO, ''RRRR/MM'') <= '+ QuotedStr(sAnoMesRef) +'      '+
    '        AND TO_CHAR(DATAFINAL, ''RRRR/MM'') >= '+ QuotedStr(sAnoMesRef) +'       '+
    '        AND c.codigo = '+ QuotedStr(sCodigo) +'                                  '+
    '        AND c.tipo = ''C''                                '+
    '        AND E.IDPESSJUR = C.IDPESSJUR(+)                  '+
    '        AND E.idcargoext = C.IDCARGOEXT(+))               ';

  END;

  QryAux.CLose;
  QryAux.SQL.Clear;
  QryAux.SQL.Text := sSQL;
  QryAux.Open;

  result := QryAux.fieldByname('DIAS').asString;

  FreeAndNil(QryAux);

End;
//Vinicius Ferreira SOL 153972 KINTANA 1169147
//inicio - André Oliveira SOL 136384/9641 Kintana 1664442
Function DUPLICADETCALCULOTITULAR(Regra : TRegra; Formula : String) : String;
Var
  sMsg, sFormulaAux ,sIDPessoa, sIDTitular, sDescricao, sValor : String;
  I, iIdDetCalculo: Integer;
Begin

    sIDTitular:= '';
    sIDPessoa := '';
    sDescricao := '';
    sValor := '';
    result := 'FALSE';
    {----------------------------------------------------------------------------}
    { Decodifica Fórmula                                                          }


    { Retira Nome da Formula }
    sFormulaAux := Copy(Formula,26,Length(Formula));
    sFormulaAux := Copy(sFormulaAux,1,Length(sFormulaAux)-1);
    //DUPLICADETCALCULOTITULAR


     //Pega  sIDPessoa
    I := Pos(',', sFormulaAux);
    If I <= 0 Then I := (Length(sFormulaAux)+1);
    sValor := Copy(sFormulaAux,1,I-1);
    sIDPessoa := Trim(Regra.PegaValor(sValor));
    sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));


    if sIDPessoa = '' then
    if Regra.FQueryIn.FindField('IDPESSOA') <> NIL Then
       sIDPessoa :=  Trim(Regra.FQueryIn.FieldByName('IDPESSOA').AsString);


    //Pega  sIDTitular
    I := Pos(',', sFormulaAux);
    If I <= 0 Then I := (Length(sFormulaAux)+1);
    sValor := Copy(sFormulaAux,1,I-1);
    sIDTitular := Trim(Regra.PegaValor(sValor));
    sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

    if sIDTitular = '' then
    if Regra.FQueryIn.FindField('IDTITULAR') <> NIL Then
       sIDTitular :=  Trim(Regra.FQueryIn.FieldByName('IDTITULAR').AsString);


    //Pega  sDescricao
    I := Pos(',', sFormulaAux);
    If I <= 0 Then I := (Length(sFormulaAux)+1);
    sValor := Copy(sFormulaAux,1,I-1);
    sDescricao := Trim(Regra.PegaValor(sValor));
    sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));


    if sDescricao = '' then
    if Regra.FQueryIn.FindField('DESCRICAO') <> NIL Then
       sDescricao := Trim(Regra.FQueryIn.FieldByName('DESCRICAO').AsString);




   if Trim(sIDTitular)       = '' then
     sMsg := 'IDTITULAR';
  if Trim(sIDPessoa)       = '' then
     if trim(sMsg) <> '' then
        sMsg := sMsg + ', IDPESSOA'
     else
        sMsg := 'IDPESSOA';
  if Trim(sDescricao)  = '' then
     if trim(sMsg) <> '' then
        sMsg := sMsg + ', DESCRICAO'
     else
        sMsg := 'DESCRICAO';



  if trim(sMsg) <> '' then
  begin
     MessageDlg('Campos Obrigatórios não preenchidos: '+sMsg, mtWarning, [mbOK], 0);
     result := 'FALSE';
     Exit;
  end;

    QryAuxFormula := TwwQuery.Create(Nil);
    QryAuxFormula.DataBaseName := Regra.DatabaseName;



   With QryAuxFormula Do
    Begin

          Close;
          SQL.Clear;
          SQL.Add('SELECT *');
          SQL.Add('FROM (SELECT *');
          SQL.Add('            FROM DETCALCULO DET');
          SQL.Add('            WHERE TRIM(DET.DESCRICAO) = '+ QuotedStr(Trim(sDescricao)));
          SQL.Add('            AND DET.IDPESSOA  = '+sIDTitular);
          SQL.Add('            ORDER BY DET.IDDETCALCULO DESC)');
          SQL.Add('WHERE ROWNUM = 1');
          Open;

          if not EOF then
          begin

              if Regra.FlgGravaCalculo = True then
              begin

                    if (Regra.FIdCalculo = 0)  then
                    begin
                        Regra.FIdCalculo := LeUltRegistro(Nil,'CALCULO');
                        ExecutarQuery(Regra.QueryRegraAux,'INSERT INTO CALCULO (IDCALCULO, IDREGRA, IDTITULAR, IDPESSOA) VALUES ('+
                        IntToStr(Regra.FIdCalculo)+', '+ IntToStr(Regra.IRegraMaster)+ ', '+sIDTitular+ ', '+ sIDPessoa+ ')');
                    end;

                   Regra.QueryRegraAux.Close;
                   Regra.QueryRegraAux.Sql.Clear;
                   iIdDetCalculo := LeUltRegistro(Nil, 'DETCALCULO');
                   Regra.QueryRegraAux.SQL.Add( 'INSERT INTO DETCALCULO (IDCALCULO, IDDETCALCULO, IDRUBRICA, IDPESSOA, IDREGRA, DESCRICAO,'+
                   'VALOR, VLRRUBRICA, VLRTETO, FATOR,  TIPOCALCULO,  VLRCALCULO, VLRINDICE, VLRCORRIGIDO) VALUES ('+
                   IntToStr(Regra.FIdCalculo)  +','+
                   IntToStr(iIdDetCalculo) +','+
                   QuotedStr(FieldByName('IDRUBRICA').AsString) +','+
                   QuotedStr(sIDPessoa) +','+
                   QuotedStr(IntToStr(Regra.IRegraMaster)) +','+
                   QuotedStr (FieldByName('DESCRICAO').AsString) +','+
                   QuotedStr(FieldByName('VALOR').AsString) +','+
                   QuotedStr(FieldByName('VLRRUBRICA').AsString) +','+
                   QuotedStr(FieldByName('VLRTETO').AsString) +','+
                   QuotedStr(FieldByName('FATOR').AsString) +','+
                   QuotedStr(FieldByName('TIPOCALCULO').AsString) +','+
                   QuotedStr(FieldByName('VLRCALCULO').AsString) +','+
                   QuotedStr(FieldByName('VLRINDICE').AsString) +','+
                   QuotedStr(FieldByName('VLRCORRIGIDO').AsString) +')');

                   Regra.QueryRegraAux.ExecSQL;
              end;
              result := 'TRUE';
          end;
    end;
   QryAuxFormula.Free;
end;
//fim - André Oliveira SOL 136384/9641 Kintana 1664442

Function FUNCAOCONFIANCA(Regra : TRegra; Formula : String) : String;
//Inicio - André Oliveira SOL 136384/11722 Kintana 1664442    Alteração da formula função confiança inteira
var
     sSQL, sMsg, sFormulaAux ,sValor : String;

     vSql, vPeriodo, vDIB, vFlgInvalidez, sIDPessoa: string;
     ProcFuncaoConfianca : TStoredProc;

     iIdGravaCalculo, I : Integer;

begin
     Result := '0';

     iIdGravaCalculo := 0;



     sFormulaAux := Copy(Formula,17,Length(Formula));
     sFormulaAux := Copy(sFormulaAux,1,Length(sFormulaAux)-1);

     QryAuxFormula := TwwQuery.Create(Nil);
     QryAuxFormula.DataBaseName := Regra.DatabaseName;

     I := Pos(',', sFormulaAux);
     If I <= 0 Then I := (Length(sFormulaAux)+1);
     sValor := Copy(sFormulaAux,1,I-1);
     vDIB := Trim(Regra.PegaValor(sValor));
     sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));


     if vDIB = '' then
     begin
          if Regra.QueryIn.FindField('DIB') <> Nil then
          vDIB := Trim(Regra.QueryIn.FieldByName('DIB').AsString);
     end;

     I := Pos(',', sFormulaAux);
     If I <= 0 Then I := (Length(sFormulaAux)+1);
     sValor := Copy(sFormulaAux,1,I-1);
     vPeriodo := Trim(Regra.PegaValor(sValor));
     sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

     if vPeriodo = '' then
     begin
          if Regra.QueryIn.FindField('PERIODO') <> Nil then
          vPeriodo := Trim(Regra.QueryIn.FieldByName('PERIODO').AsString);
     end;

     I := Pos(',', sFormulaAux);
     If I <= 0 Then I := (Length(sFormulaAux)+1);
     sValor := Copy(sFormulaAux,1,I-1);
     vFlgInvalidez := Trim(Regra.PegaValor(sValor));;
     sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

     if vFlgInvalidez = '' then
     begin
          if Regra.QueryIn.FindField('FLGINVALIDEZ') <> Nil then
          vFlgInvalidez := Trim(Regra.QueryIn.FieldByName('FLGINVALIDEZ').AsString);
     end;

     {I := Pos(',', sFormulaAux);
     If I <= 0 Then I := (Length(sFormulaAux)+1);
     sValor := Copy(sFormulaAux,1,I-1);
     sIDPessoa := Regra.PegaValor(sValor);//Precisamos verificar a matricula
     sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));  }

     if sIDPessoa = '' then
     begin
          if Regra.QueryIn.FindField('IDPESSOA') <> Nil then
          sIDPessoa := Trim(Regra.QueryIn.FieldByName('IDPESSOA').AsString);
     end;

     sMsg := '';

     if Trim(vDIB)       = '' then
        sMsg := 'DIB';

     if Trim(vPeriodo)       = '' then
        if trim(sMsg) <> '' then
           sMsg := sMsg + ', PERIODO'
        else
     sMsg := 'PERIODO';

     if Trim(vFlgInvalidez)  = '' then
        if trim(sMsg) <> '' then
           sMsg := sMsg + ', FLGINVALIDEZ'
        else
     sMsg := 'FLGINVALIDEZ';

     if Trim(sIDPessoa) = '' then
        if trim(sMsg) <> '' then
           sMsg := sMsg + ', IDPESSOA'
           else
     sMsg := 'IDPESSOA';

     if trim(sMsg) <> '' then
     begin
          MessageDlg('Campos Obrigatórios não preenchidos: '+sMsg, mtWarning, [mbOK], 0);
          Exit;
     end;


    if Regra.FlgGravaCalculo = True then
    begin
     iIdGravaCalculo :=  1;
    end;

    try
      ProcFuncaoConfianca := TStoredProc.Create(Application);
      ProcFuncaoConfianca.DatabaseName   := 'BaseDados';
      ProcFuncaoConfianca.StoredProcName := 'CM.PR_FORMULAFUNCAOCONFIANCA';

      ProcFuncaoConfianca.Params.CreateParam(ftInteger, 'PIDPESSOA',        ptinput);
      ProcFuncaoConfianca.Params.CreateParam(ftString,  'PDIB',             ptinput);
      ProcFuncaoConfianca.Params.CreateParam(ftInteger, 'PGRAVADETCALCULO', ptinput);
      ProcFuncaoConfianca.Params.CreateParam(ftInteger, 'PIDREGRA',         ptinput);
      ProcFuncaoConfianca.Params.CreateParam(ftInteger, 'PQUANTDIASANO',    ptinput);
      ProcFuncaoConfianca.Params.CreateParam(ftInteger, 'PFLGINVALIDEZ',    ptinput);
      ProcFuncaoConfianca.Params.CreateParam(ftInteger, 'PMELHOR',          ptInputOutput);

      ProcFuncaoConfianca.parambyName('PIDPESSOA').AsInteger         := StrToInt(sIDPessoa);
      ProcFuncaoConfianca.parambyName('PDIB').AsDate                 := StrToDate(vDIB);
      ProcFuncaoConfianca.parambyName('PGRAVADETCALCULO').AsInteger  := iIdGravaCalculo;
      ProcFuncaoConfianca.parambyName('PIDREGRA').AsInteger          := Regra.IRegraMaster;
      ProcFuncaoConfianca.parambyName('PQUANTDIASANO').AsInteger     := StrToInt(vPeriodo);
      ProcFuncaoConfianca.parambyName('PFLGINVALIDEZ').AsInteger     := StrToInt(vFlgInvalidez);
      ProcFuncaoConfianca.parambyName('PMELHOR').AsString            := '';

      ProcFuncaoConfianca.Prepare;
      ProcFuncaoConfianca.ExecProc;

      Result := ProcFuncaoConfianca.Params.ParamByName('PMELHOR').AsString;
    finally
      ProcFuncaoConfianca.Close;
      FreeAndNil(ProcFuncaoConfianca);
    end;

//Fim - André Oliveira SOL 136384/11722 Kintana 1664442
end;
//Jonas Oliveira. William Moreira - SOL 136384/10002 Kintana 1685939

 //inicio - André Oliveira SOL 136384/9641 Kintana 1664442
Function EXCLUIDETCALCULO(Regra : TRegra; Formula : String) : String;
Var
  sMsg, sFormulaAux ,sIDPessoa, sDescricao, sValor : String;
  I : Integer;
  QryAux: TwwQuery;
Begin

    sIDPessoa := '';
    sDescricao := '';
    sValor := '';
    result := 'FALSE';
    {----------------------------------------------------------------------------}
    { Decodifica Fórmula                                                          }


    { Retira Nome da Formula }
    sFormulaAux := Copy(Formula,18,Length(Formula));
    sFormulaAux := Copy(sFormulaAux,1,Length(sFormulaAux)-1);
    //EXCLUIDETCALCULO


     //Pega  sIDPessoa
    I := Pos(',', sFormulaAux);
    If I <= 0 Then I := (Length(sFormulaAux)+1);
    sValor := Copy(sFormulaAux,1,I-1);
    sIDPessoa := Trim(Regra.PegaValor(sValor));
    sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));


    if sIDPessoa = '' then
    if Regra.FQueryIn.FindField('IDPESSOA') <> NIL Then
       sIDPessoa :=  Trim(Regra.FQueryIn.FieldByName('IDPESSOA').AsString);



    //Pega  sDescricao
    I := Pos(',', sFormulaAux);
    If I <= 0 Then I := (Length(sFormulaAux)+1);
    sValor := Copy(sFormulaAux,1,I-1);
    sDescricao := Trim(Regra.PegaValor(sValor));
    sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));


    if sDescricao = '' then
    if Regra.FQueryIn.FindField('DESCRICAO') <> NIL Then
       sDescricao := Trim(Regra.FQueryIn.FieldByName('DESCRICAO').AsString);




   if Trim(sIDPessoa)       = '' then
     sMsg := 'IDPESSOA';
  if Trim(sDescricao)  = '' then
     if trim(sMsg) <> '' then
        sMsg := sMsg + ', DESCRICAO'
     else
        sMsg := 'DESCRICAO';



  if trim(sMsg) <> '' then
  begin
     MessageDlg('Campos Obrigatórios não preenchidos: '+sMsg, mtWarning, [mbOK], 0);
     result := 'FALSE';
     Exit;
  end;

  QryAux := TwwQuery.Create(Application);
  QryAux.DatabaseName  := 'BASEDADOS';
  QryAux.Close;
  QryAux.Sql.Clear;
  QryAux.SQL.Add('SELECT COUNT(*) CONT FROM DETCALCULO WHERE IDPESSOA ='+sIDPessoa+
  'AND trim(DESCRICAO) = '+ QuotedStr(Trim(sDescricao)));
  QryAux.Open;
  if not QryAux.Eof then
  begin
     if (QryAux.FieldByName('CONT').AsString  = '0')then
     begin
        Result :='FALSE';
        QryAux.Free;
        Exit;
     end;
  end;

  if Regra.FlgGravaCalculo = True then
  begin


     Regra.QueryRegraAux.Close;
     Regra.QueryRegraAux.Sql.Clear;
     Regra.QueryRegraAux.SQL.Add('DELETE FROM DETCALCULO WHERE IDPESSOA ='+sIDPessoa+
     'AND trim(DESCRICAO) = '+ QuotedStr(Trim(sDescricao)));
     Regra.QueryRegraAux.ExecSQL;

  end;
  result := 'TRUE';
  QryAux.Free;


end;
//fim - André Oliveira SOL 136384/9641 Kintana 1664442

//inicio - André Oliveira SOL 136384/11302 Kintana 1786550
Function VALORBENEFICIOINSS(Regra : TRegra; Formula : String) : String;
var
sMsg, sFormulaAux ,sIDPessoa, sIDTitular, sMesAnoRef, sValor : String;
  I : Integer;
Begin
    sIDTitular:= '';
    sIDPessoa := '';
    sMesAnoRef := '';
    sValor := '';
    result := 'FALSE';
    {----------------------------------------------------------------------------}
    { Decodifica Fórmula                                                          }


    { Retira Nome da Formula }
    sFormulaAux := Copy(Formula,20,Length(Formula));
    sFormulaAux := Copy(sFormulaAux,1,Length(sFormulaAux)-1);
    //DUPLICADETCALCULOTITULAR


     //Pega  sIDPessoa
    I := Pos(',', sFormulaAux);
    If I <= 0 Then I := (Length(sFormulaAux)+1);
    sValor := Copy(sFormulaAux,1,I-1);
    sIDPessoa := Trim(Regra.PegaValor(sValor));
    sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));


    if sIDPessoa = '' then
    if Regra.FQueryIn.FindField('IDPESSOA') <> NIL Then
       sIDPessoa :=  Trim(Regra.FQueryIn.FieldByName('IDPESSOA').AsString);


    //Pega  sIDTitular
    I := Pos(',', sFormulaAux);
    If I <= 0 Then I := (Length(sFormulaAux)+1);
    sValor := Copy(sFormulaAux,1,I-1);
    sIDTitular := Trim(Regra.PegaValor(sValor));
    sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

    if sIDTitular = '' then
    if Regra.FQueryIn.FindField('IDTITULAR') <> NIL Then
       sIDTitular :=  Trim(Regra.FQueryIn.FieldByName('IDTITULAR').AsString);


    //Pega  sMesAnoRef
    I := Pos(',', sFormulaAux);
    If I <= 0 Then I := (Length(sFormulaAux)+1);
    sValor := Copy(sFormulaAux,1,I-1);
    sMesAnoRef := Trim(Regra.PegaValor(sValor));
    sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));


    if sMesAnoRef = '' then
    if Regra.FQueryIn.FindField('MESANO') <> NIL Then
       sMesAnoRef := Trim(Regra.FQueryIn.FieldByName('MESANO').AsString);




   if Trim(sIDTitular)       = '' then
     sMsg := 'IDTITULAR';
  if Trim(sIDPessoa)       = '' then
     if trim(sMsg) <> '' then
        sMsg := sMsg + ', IDPESSOA'
     else
        sMsg := 'IDPESSOA';
  if Trim(sMesAnoRef)  = '' then
     if trim(sMsg) <> '' then
        sMsg := sMsg + ', MESANO'
     else
        sMsg := 'MESANO';



  if trim(sMsg) <> '' then
  begin
     MessageDlg('Campos Obrigatórios não preenchidos: '+sMsg, mtWarning, [mbOK], 0);
     result := 'FALSE';
     Exit;
  end;

    QryAuxFormula := TwwQuery.Create(Nil);
    QryAuxFormula.DataBaseName := Regra.DatabaseName;



   With QryAuxFormula Do
    Begin

          Close;
          SQL.Clear;
          SQL.Add('SELECT DECODE(bf.idsitbeneficio,');
          SQL.Add('              4,');
          SQL.Add('              bf.valortotal,');
          SQL.Add('              NVL(NVL((SELECT DISTINCT hb.Valortotal');
          SQL.Add('                     FROM hstbenefbfciario hb');
          SQL.Add('                    WHERE hb.IDPLANOPREV = bf.idplanoprev');
          SQL.Add('                      AND hb.IDBENEFICIO = bf.idbeneficio');
          SQL.Add('                      AND hb.NUMEROPROCESSO = bf.numeroprocesso');
          SQL.Add('                      AND hb.IDPESSJUR = bf.idpessjur');
          SQL.Add('                      AND hb.IDTITULAR = bf.idtitular');
          SQL.Add('                      AND hb.IDPLANOORIGEM = bf.idplanoorigem');
          SQL.Add('                      AND hb.IDPESSOA = bf.idpessoa');
          SQL.Add('                      AND hb.SEQPROPOSTA = bf.seqproposta');
          SQL.Add('                      AND hb.fontepagadora = 2');
          SQL.Add('                      AND HB.MESREFERENCIA = '+QuotedStr(sMesAnoRef));
          SQL.Add('                      AND ('+QuotedStr(sMesAnoRef)+' = to_char(bf.datainiciofund, ''YYYY/MM'') OR '+QuotedStr(sMesAnoRef)+' = to_char(bf.datafinal, ''YYYY/MM''))');
          SQL.Add('                      AND NVL(TO_CHAR(hb.idseqinternofb),HB.MES) = (SELECT max(NVL(TO_CHAR(hb1.idseqinternofb),HB1.MES))');
          SQL.Add('                                                             FROM hstbenefbfciario hb1');
          SQL.Add('                                                            WHERE hb.IDPLANOPREV = hb1.idplanoprev');
          SQL.Add('                                                              AND hb.IDBENEFICIO = hb1.idbeneficio');
          SQL.Add('                                                              AND hb.NUMEROPROCESSO = hb1.numeroprocesso');
          SQL.Add('                                                              AND hb.IDPESSJUR = hb1.idpessjur');
          SQL.Add('                                                              AND hb.IDTITULAR = hb1.idtitular');
          SQL.Add('                                                              AND hb.IDPLANOORIGEM = hb1.idplanoorigem');
          SQL.Add('                                                              AND hb.IDPESSOA = hb1.idpessoa');
          SQL.Add('                                                              AND hb.SEQPROPOSTA = hb1.seqproposta');
          SQL.Add('                                                              AND HB.MESREFERENCIA = hb1.mesreferencia)),');
          SQL.Add('                  (SELECT sum(hb.valorprev)');
          SQL.Add('                     FROM hstbenefbfciario hb');
          SQL.Add('                    WHERE hb.IDPLANOPREV = bf.idplanoprev');
          SQL.Add('                      AND hb.IDBENEFICIO = bf.idbeneficio');
          SQL.Add('                      AND hb.NUMEROPROCESSO = bf.numeroprocesso');
          SQL.Add('                      AND hb.IDPESSJUR = bf.idpessjur');
          SQL.Add('                      AND hb.IDTITULAR = bf.idtitular');
          SQL.Add('                      AND hb.IDPLANOORIGEM = bf.idplanoorigem');
          SQL.Add('                      AND hb.IDPESSOA = bf.idpessoa');
          SQL.Add('                      AND hb.SEQPROPOSTA = bf.seqproposta');
          SQL.Add('                      AND HB.MESREFERENCIA = '+QuotedStr(sMesAnoRef));
          SQL.Add('                      AND '+QuotedStr(sMesAnoRef)+' <> to_char(bf.datainiciofund, ''YYYY/MM'' ))),bf.valortotal)) VALORINSS');
          SQL.Add('  FROM benefbfciario bf');
          SQL.Add('WHERE bf.idtppagtobenefic = 1');
          SQL.Add('   AND bf.fontepagadora = 2');
          SQL.Add('   AND (bf.idsitbeneficio IN (1, 2) OR');
          SQL.Add('       (bf.idsitbeneficio = 4 AND NOT EXISTS');
          SQL.Add('        (SELECT 1');
          SQL.Add('            FROM benefbfciario bf1');
          SQL.Add('           WHERE bf1.idpessoa = bf.idpessoa');
          SQL.Add('             AND bf1.idtitular = bf.idtitular');
          SQL.Add('             AND bf1.idtppagtobenefic = 1');
          SQL.Add('             AND bf1.fontepagadora = 2');
          SQL.Add('             AND bf1.idsitbeneficio IN (1, 2, 3))) OR');
          SQL.Add('       (bf.idsitbeneficio NOT IN (1, 2, 4) AND NOT EXISTS');
          SQL.Add('        (SELECT 1');
          SQL.Add('            FROM benefbfciario bf1');
          SQL.Add('           WHERE bf1.idpessoa = bf.idpessoa');
          SQL.Add('             AND bf1.idtitular = bf.idtitular');
          SQL.Add('             AND bf1.idtppagtobenefic = 1');
          SQL.Add('             AND bf1.fontepagadora = 2');
          SQL.Add('             AND bf1.idsitbeneficio IN (1, 2, 4)) AND');
          SQL.Add('        bf.datafinal =');
          SQL.Add('        (SELECT MAX(bf1.datafinal)');
          SQL.Add('            FROM benefbfciario bf1');
          SQL.Add('           WHERE bf1.idtppagtobenefic = 1');
          SQL.Add('             AND bf1.fontepagadora = 2');
          SQL.Add('             AND bf1.idpessoa = bf.idpessoa');
          SQL.Add('             AND bf1.idtitular = bf.idtitular)))');
          SQL.Add('   AND bf.idpessoa = '+sIDPessoa);
          SQL.Add('   AND bf.idtitular = '+sIDTitular);
          Open;

          if not EOF then
          begin
             result := FieldByName('VALORINSS').AsString;
          end
          else
             Result := '0';

   end;

   QryAuxFormula.Free;
end;
//fim - André Oliveira SOL 136384/11302 Kintana 1786550
//inicio - André Oliveira SOL 136384/10362 Kintana 1712325
Function VALORSRBNP(Regra : TRegra; Formula : String) : String;
Var
  sMsg,sResult, sFormulaAux ,sValor : String;
  iFlgmsg, iFlgMaiorMenor ,I : Integer;
  sIdBeneficio, sDataPeculio, sIdPessoaPesquisa, sIdTitularPesquisa, sValorInss : String;

Begin
  Result := '0';

  sFormulaAux := Copy(Formula,12,Length(Formula));
  sFormulaAux := Copy(sFormulaAux,1,Length(sFormulaAux)-1);


  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sValor := Copy(sFormulaAux,1,I-1);
  sDataPeculio := Regra.PegaValor(sValor);
  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

  if sDataPeculio = '' then
  begin
     if Regra.QueryIn.FindField('DATASRB') <> Nil then
     sDataPeculio := Regra.QueryIn.FieldByName('DATASRB').AsString;
  end;


  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sValor := Copy(sFormulaAux,1,I-1);
  sIdPessoaPesquisa := Regra.PegaValor(sValor);
  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

  if sIdPessoaPesquisa = '' then
  begin
     if Regra.QueryIn.FindField('IDPESSOA') <> Nil then
     sIdPessoaPesquisa := Regra.QueryIn.FieldByName('IDPESSOA').AsString;
  end;


  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sValor := Copy(sFormulaAux,1,I-1);
  sIdTitularPesquisa := Regra.PegaValor(sValor);
  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

  if sIdTitularPesquisa = '' then
  begin
     if Regra.QueryIn.FindField('IDTITULAR') <> Nil then
     sIdTitularPesquisa := Regra.QueryIn.FieldByName('IDTITULAR').AsString;
  end;

  QryAuxFormula := TwwQuery.Create(Nil);
  QryAuxFormula.DataBaseName := Regra.DatabaseName;

  sMsg := '';
  if Trim(sDataPeculio)       = '' then
     if trim(sMsg) <> '' then
        sMsg := sMsg + ', DATASRB'
     else
        sMsg := 'DATASRB';
  if Trim(sIdPessoaPesquisa)  = '' then
     if trim(sMsg) <> '' then
        sMsg := sMsg + ', IDPESSOAPESQUISA'
     else
        sMsg := 'IDPESSOAPESQUISA';

  if Trim(sIdTitularPesquisa) = '' then
     if trim(sMsg) <> '' then
        sMsg := sMsg + ', IDTITULARPESQUISA'
     else
        sMsg := 'IDTITULARPESQUISA';

  if trim(sMsg) <> '' then
  begin
     MessageDlg('Campos Obrigatórios não preenchidos: '+sMsg, mtWarning, [mbOK], 0);
     Exit;
  end;


  With QryAuxFormula Do
  Begin

        Close;
        SQL.Clear;
        SQL.Add(' SELECT ((PPP.SALPARTICIPACAO) * DECODE(to_char(to_date('+QuotedStr(sDataPeculio)+'),''mm''),9,1, ');
        SQL.Add(' (SELECT (EXP(SUM(LN(((CM.COTVALOR / 100) + 1)))) - 1) + 1 COTACAO FROM COTACAOMOEDA CM ');
        SQL.Add(' WHERE CM.MOECODIGO = 7 AND CM.COTDATA BETWEEN TO_DATE(''01/09/'' || CASE  WHEN TO_CHAR(last_day(add_months(to_date('+QuotedStr(sDataPeculio)+'),-1)), ''mm'')<9 THEN ');
        SQL.Add(' TO_CHAR(last_day(add_months(to_date('+QuotedStr(sDataPeculio)+'),-1)), ''yyyy'')-1 ELSE TO_CHAR(last_day(add_months(to_date('+QuotedStr(sDataPeculio)+'),-1)), ''yyyy'')-0 ' );
        SQL.Add(' END) AND last_day(add_months(to_date('+QuotedStr(sDataPeculio)+'),-1)) AND SUBSTR(CM.COTMESREF, 3, 4) BETWEEN ''2001'' AND ');
        SQL.Add(' TO_CHAR(SYSDATE, ''yyyy'')');
        SQL.Add(' ))) VALORPECULIO FROM DEPENTIT D JOIN PARTPREVPLAN PPP  ON D.IDPESSOA = PPP.IDPESSOA ');
        SQL.Add(' AND  D.IDTITULAR = PPP.IDPESSOA WHERE ppp.idplanoprev = 74 ');
        SQL.Add(' AND  D.IDPESSOA  = '+ sIdPessoaPesquisa );
        SQL.Add(' AND  D.IDTITULAR =  '+ sIdTitularPesquisa );

        Open;
        sResult  := FieldByName('valorpeculio').AsString;

  end;
  if trim(sResult) = '' Then
     sResult := '0';
  Result := sResult;
end;
//fim - André Oliveira SOL 136384/10362 Kintana 1712325
//inicio - André Oliveira SOL 193327 Kintana  1839657
Function VWFORMRUBJUD(Regra : TRegra; Formula : String) : String;
Var
  sMsg,sResult, sFormulaAux ,sValor : String;
  iFlgmsg, iFlgMaiorMenor ,I : Integer;
  sTipoValor, sCodProvDesc, sIdPlanoPrev, sMesReferencia, sMesCobranca, sIdPessoaPesquisa, sIdTitularPesquisa : String;

Begin
  Result := '0';

  sFormulaAux := Copy(Formula,14,Length(Formula));
  sFormulaAux := Copy(sFormulaAux,1,Length(sFormulaAux)-1);


  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sValor := Copy(sFormulaAux,1,I-1);
  sTipoValor := Regra.PegaValor(sValor);
  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sValor := Copy(sFormulaAux,1,I-1);
  sCodProvDesc := Regra.PegaValor(sValor);
  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sValor := Copy(sFormulaAux,1,I-1);
  sIdPlanoPrev := Regra.PegaValor(sValor);
  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

  if sIdPlanoPrev = '' then
  begin
     if Regra.QueryIn.FindField('IDPLANOPREV') <> Nil then
     sIdPessoaPesquisa := Regra.QueryIn.FieldByName('IDPLANOPREV').AsString;
  end;

  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sValor := Copy(sFormulaAux,1,I-1);
  sMesReferencia := Regra.PegaValor(sValor);
  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

  if sIdPlanoPrev = '' then
  begin
     if Regra.QueryIn.FindField('MESREFERENCIA') <> Nil then
     sIdPessoaPesquisa := Regra.QueryIn.FieldByName('MESREFERENCIA').AsString;
  end;

  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sValor := Copy(sFormulaAux,1,I-1);
  sMesCobranca := Regra.PegaValor(sValor);
  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

  if sMesCobranca = '' then
  begin
     if Regra.QueryIn.FindField('MESCOBRANCA') <> Nil then
     sIdPessoaPesquisa := Regra.QueryIn.FieldByName('MESCOBRANCA').AsString;
  end;

  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sValor := Copy(sFormulaAux,1,I-1);
  sIdPessoaPesquisa := Regra.PegaValor(sValor);
  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

  if sIdPessoaPesquisa = '' then
  begin
     if Regra.QueryIn.FindField('IDPESSOA') <> Nil then
     sIdPessoaPesquisa := Regra.QueryIn.FieldByName('IDPESSOA').AsString;
  end;


  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sValor := Copy(sFormulaAux,1,I-1);
  sIdTitularPesquisa := Regra.PegaValor(sValor);
  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

  if sIdTitularPesquisa = '' then
  begin
     if Regra.QueryIn.FindField('IDTITULAR') <> Nil then
     sIdTitularPesquisa := Regra.QueryIn.FieldByName('IDTITULAR').AsString;
  end;

  QryAuxFormula := TwwQuery.Create(Nil);
  QryAuxFormula.DataBaseName := Regra.DatabaseName;

  sMsg := '';
  if Trim(sTipoValor)       = '' then
     if trim(sMsg) <> '' then
        sMsg := sMsg + ', TIPOVALOR'
     else
        sMsg := 'TIPOVALOR';
  if Trim(sCodProvDesc)  = '' then
     if trim(sMsg) <> '' then
        sMsg := sMsg + ', CODPROVDESC'
     else
        sMsg := 'CODPROVDESC';

  if trim(sMsg) <> '' then
  begin
     MessageDlg('Campos Obrigatórios não preenchidos: '+sMsg, mtWarning, [mbOK], 0);
     Exit;
  end;


  With QryAuxFormula Do
  Begin

        Close;
        SQL.Clear;
        SQL.Add('SELECT DECODE(flgdesconto,1,-valor,valor) VALOR,');
        SQL.Add(' DECODE(flgdesconto,1,-VALORTOTAL,VALORTOTAL) VALORTOTAL');
        SQL.Add('FROM CM.VW_FORMRUBJUD');
        SQL.Add('WHERE IDPESSOA = '+ sIdPessoaPesquisa);
        SQL.Add('AND   CODPROVDESC = '+QuotedStr(sCodProvDesc));
        SQL.Add('AND   IDTITULAR = '+sIdTitularPesquisa);
        if(sMesReferencia <> '')then
        begin
            SQL.Add('AND MESREFERENCIA = '+QuotedStr(sMesReferencia));
        end;
        if(sIdPlanoPrev <> '')then
        begin
             SQL.Add('AND IDPLANOPREV   = '+sIdPlanoPrev);
        end;
        if(sMesCobranca <> '')then
        begin
             SQL.Add('AND MESCOBRANCA = '+QuotedStr(sMesCobranca));
        end;
        Open;

        if not Eof then
        begin
            if (sTipoValor = '0') then
            begin
                 sResult  := FieldByName('VALOR').AsString;
            end
            else  if(sTipoValor = '1') then
            begin
                sResult  := FieldByName('VALORTOTAL').AsString;
            end;
        end;
  end;
  if trim(sResult) = '' Then
     sResult := '0';
  Result := sResult;
end;
//fim - André Oliveira SOL 193327 Kintana  1839657

// Andre Imakawa - SIG 103583 - Inicio
Function PARAMPESSOADTFIM(Regra : TRegra; Formula : String) : String;
Var
  sFormulaAux,
  sIdTitular, sIdPessoa,  sIdParametro, sDataInicio,
  sSQL : String;
  I :Integer;
Begin
  sDataInicio := '';
  sIdPessoa   := '';

  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }

  { Retira Nome da Formula }
  sFormulaAux := Copy(Formula,18,Length(Formula));
  sFormulaAux := Copy(sFormulaAux,1,Length(sFormulaAux)-1);

  { Pega parametro }
  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sIdParametro := Copy(sFormulaAux,1,(I-1));
  sIdParametro := Regra.PegaValor(sIdParametro);

  { Pega IDPESSOA alternativo }
  sFormulaAux := Copy(sFormulaAux,(I+1),Length(sFormulaAux));
  sIdPessoa := Copy(sFormulaAux,1,Length(sFormulaAux));
  sIdPessoa := Regra.PegaValor(sIdPessoa);

  { Fim da decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Verifica Campos Obrigatórios ( IDPESSOA ) }
  If Regra.QueryIn.FindField('IDPESSOA') = NIL Then Begin
    MsgDlg('Campo IDPESSOA, necessário no Sql de entrada ', 'Regra - Erro',mtError,[mbOk],0);
    Regra.fError := True;
    Exit;
  End;

  { Guarda Dados do Processo }
  //sIdTitular := Regra.QueryIn.FieldByName('IDTITULAR').AsString;
  If sIdPessoa = '' Then
    sIdPessoa  := Regra.QueryIn.FieldByName('IDPESSOA').AsString;

  { Monta SQL }
  sSQL := 'SELECT   '+
          '  VALOR  '+
          'FROM     '+
          '  PESSOAPARAM  '+
          'WHERE    '+
          '  IDPESSOA   = '+sIdPessoa+ ' AND '+
          '  DATAFIM IS NULL AND' +
          '  IDPARAM    = '+sIdParametro;

  If Not FazQuery(Regra.QueryRegraAux,sSQL) Then Begin
    Result := '';
    Exit;
  End;

  { Seta Resultado }
  Result := Regra.QueryRegraAux.FieldByName('VALOR').AsString;

  If Trim(Result) = '' Then
    Result := '';

End; { PARAMPESSOA }
// Andre Imakawa - SIG 103583 - Fim


//edilaine 114117-114326 : inicio
Function EXISTERESERVA (Regra : TRegra; Formula : String) : String;
Var
  sFormulaAux,
  sIdPessoa, sIdPlanoPrev,  sIdParametro, sSQL : String;
  lstReservas : string;
  I :Integer;
Begin
  sIdPessoa    := '';
  sIdPlanoPrev := '';

  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }

  { Retira Nome da Formula }
  sFormulaAux := Copy(Formula,15,Length(Formula));
  sFormulaAux := Copy(sFormulaAux,1,Length(sFormulaAux)-1);

  { Pega parametro }
  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sIdParametro := Copy(sFormulaAux,1,(I-1));

  If Trim(sIdParametro) <> ''  Then Begin

    If (Pos('[',sIdParametro) <> 0) Then Begin

      I := Pos('[', sIdParametro);
      lstReservas := Copy( sIdParametro, (I+1), Length( sIdParametro ) );
      lstReservas := Copy( lstReservas, 1,( Pos(']', lstReservas)-1 ));

      I := Pos('],', sFormulaAux);
      If I <= 0 Then I := Pos(']', sFormulaAux);
      sFormulaAux := Copy(sFormulaAux,(I+2),Length(sFormulaAux));

    End; { End Else Begin }

  End; { If Trim(sIdParametro) <> '' }


  { Pega IDPESSOA alternativo }
  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sIdPessoa := Trim(Copy(sFormulaAux,1,(I-1)));
  sIdPessoa := Regra.PegaValor(sIdPessoa);
  sFormulaAux := Copy(sFormulaAux, (I+1), Length(sFormulaAux));

  { Pega IDPLANOPREV alternativo }
  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sIdPlanoPrev := Trim(Copy(sFormulaAux,1,Length(sFormulaAux)));
  sIdPlanoPrev := Regra.PegaValor(sIdPlanoPrev);

  { Fim da decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Verifica Campos Obrigatórios ( IDPESSOA ) }
  If Regra.QueryIn.FindField('IDPESSOA') = NIL Then Begin
    MsgDlg('Campo IDPESSOA, necessário no Sql de entrada ', 'Regra - Erro',mtError,[mbOk],0);
    Regra.fError := True;
    Exit;
  End;

  If Regra.QueryIn.FindField('IDPLANOPREV') = NIL Then Begin
    MsgDlg('Campo IDPLANOPREV, necessário no Sql de entrada ', 'Regra - Erro',mtError,[mbOk],0);
    Regra.fError := True;
    Exit;
  End;

  { Guarda Dados do Processo }
  If sIdPessoa = '' Then
    sIdPessoa  := Regra.QueryIn.FieldByName('IDPESSOA').AsString;

  If sIdPlanoPrev = '' Then
    sIdPlanoPrev  := Regra.QueryIn.FieldByName('IDPLANOPREV').AsString;

  { Monta SQL }
  sSQL := 'SELECT COUNT(*) AS VALOR '+
          'FROM     '+
          '  RESERVAPART  '+
          'WHERE    '+
          '  IDPESSOA   = '+sIdPessoa+ ' AND '+
          '  IDPLANOPREV   = '+sIdPlanoPrev+ ' AND '+
          '  IDTIPORESERVA IN ( '+lstReservas +' ) ';


  If Not FazQuery(Regra.QueryRegraAux,sSQL) Then Begin
    Result := '0';
    Exit;
  End;

  { Seta Resultado }
  Result := Regra.QueryRegraAux.FieldByName('VALOR').AsString;

  If Trim(Result) = '' Then
     Result := '0';
end;
//edilaine 114117-114326 : fim


//edilaine 115844-115954 : inicio
Function MOLESTIAGRAVE (Regra : TRegra; Formula : String) : String;
Var
  sFormulaAux,
  sIdPessoa, sSQL : String;
  I :Integer;
Begin
  sIdPessoa    := '';

  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }

  { Retira Nome da Formula }
  sFormulaAux := Copy(Formula,15,Length(Formula));
  sFormulaAux := Copy(sFormulaAux,1,Length(sFormulaAux)-1);

  { Pega IDPESSOA alternativo }
  sFormulaAux := Copy(sFormulaAux,(I+1),Length(sFormulaAux));
  sIdPessoa := Copy(sFormulaAux,1,Length(sFormulaAux));
  sIdPessoa := Regra.PegaValor(sIdPessoa);

  { Fim da decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Verifica Campos Obrigatórios ( IDPESSOA ) }
  If Regra.QueryIn.FindField('IDPESSOA') = NIL Then Begin
    MsgDlg('Campo IDPESSOA, necessário no Sql de entrada ', 'Regra - Erro',mtError,[mbOk],0);
    Regra.fError := True;
    Exit;
  End;

  { Guarda Dados do Processo }
  If sIdPessoa = '' Then
    sIdPessoa  := Regra.QueryIn.FieldByName('IDPESSOA').AsString;

  { Monta SQL }
  sSQL := 'SELECT P.IDPESSOA, P.FLGMOLESTIAGRAVE, P.DATAMOLESTIAGRAVE, P.DATAFIMMOLESTIA,  '+
          '       FLGISENTOIRRF,                                                           '+
          '       CASE                                                                     '+
          '         WHEN NVL(P.FLGMOLESTIAGRAVE,0) = 1 AND NVL(FLGISENTOIRRF,0) = 0 THEN 1 '+
          '         WHEN NVL(P.FLGMOLESTIAGRAVE,0) = 0 AND NVL(FLGISENTOIRRF,0) = 1 THEN 2 '+
          '         WHEN NVL(P.FLGMOLESTIAGRAVE,0) = 1 AND NVL(FLGISENTOIRRF,0) = 1 THEN 3 '+
          '         ELSE 4       '+
          '       END RETORNO    '+
          '  FROM PESSOAFISICA P '+
          ' WHERE                '+
          '  IDPESSOA = '+sIdPessoa;


  If Not FazQuery(Regra.QueryRegraAux,sSQL) Then Begin
    Result := '4';
    Exit;
  End;

  { Seta Resultado }
  Result := Regra.QueryRegraAux.FieldByName('RETORNO').AsString;

  If Trim(Result) = '' Then
     Result := '4';
end;
//edilaine 115844-115954 : fim


//edilaine WO18367 : inicio
Function NOVOCALCPENSAOSALDADA (Regra : TRegra; Formula : String) : String;
Var
  sFormulaAux,
  sIdTitular, sSQL : String;
  I :Integer;
Begin
  sIdTitular    := '';

  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }

  { Retira Nome da Formula }
  sFormulaAux := Copy(Formula,23,Length(Formula));
  sFormulaAux := Copy(sFormulaAux,1,Length(sFormulaAux)-1);

  { Pega IDTITULAR alternativo }
  sFormulaAux := Copy(sFormulaAux,(I+1),Length(sFormulaAux));
  sIdTitular := Copy(sFormulaAux,1,Length(sFormulaAux));
  sIdTitular := Regra.PegaValor(sIdTitular);

  { Fim da decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Guarda Dados do Processo }
  If sIdTitular = '' Then
  begin
    { Verifica Campos Obrigatórios ( IDPESSOA ) }
    If Regra.QueryIn.FindField('IDTITULAR') = NIL Then Begin
      MsgDlg('Campo IDTITULAR, necessário no Sql de entrada ', 'Regra - Erro',mtError,[mbOk],0);
      Regra.fError := True;
      Exit;
    End;

    { Guarda Dados do Processo }
    sIdTitular  := Regra.QueryIn.FieldByName('IDTITULAR').AsString;
  end;

  { Monta SQL }
  sSQL := 'SELECT CASE  '+
          '         WHEN PF.DATAMORTE < P.DTNOVOCALCPENSASALDADA '+
          '          THEN ''NAO''  '+
          '          ELSE ''SIM''  '+
          '       END RETORNO      '+
          //edilaine WO24119 : inicio
          //'  FROM PESSOAFISICA PF, PARAMAPREV P '+
          '  FROM PESSOAFISICA PF, PARAMAPREV P, PARTPREVPLAN PP '+
          ' WHERE PP.IDPESSOA       = PF.IDPESSOA '+
          '   AND PP.IDPLANOPREV    = 2 '+
          '   AND PP.IDSITPLANOPREV = 26 '+
          '   AND PF.IDPESSOA = '+ sIdTitular;
          //edilaine WO24119 : fim

  If FazQuery(Regra.QueryRegraAux,sSQL) Then Begin
    { Seta Resultado }
    Result := Regra.QueryRegraAux.FieldByName('RETORNO').AsString;
  end;

  If Trim(Result) = '' Then
     Result := 'ERRO';
end;


function TEMPORALIDADE (Regra : TRegra; Formula : String) : String;
Var
  sFormulaAux,
  sDataInicio, sIdade, sSQL : String;
  I :Integer;
Begin
  sDataInicio := '';
  Result      := '';

  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }

  { Retira Nome da Formula }
  sFormulaAux := Copy(Formula,15,Length(Formula));
  sFormulaAux := Copy(sFormulaAux,1,Length(sFormulaAux)-1);

  { Pega IDADE }
  { Pega parametro }
  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sIdade := Copy(sFormulaAux,1,(I-1));
  sIdade := Regra.PegaValor(sIdade);

  { Pega DATAPESQ alternativo }
  sFormulaAux := Copy(sFormulaAux,(I+1),Length(sFormulaAux));
  sDataInicio := Copy(sFormulaAux,1,Length(sFormulaAux));
  sDataInicio := Regra.PegaValor(sDataInicio);

  { Fim da decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Guarda Dados do Processo }
  If sDataInicio = '' Then
  begin
    { Verifica Campos Obrigatórios ( IDPESSOA ) }
    If Regra.QueryIn.FindField('DATAINICIO') = NIL Then Begin
      MsgDlg('Campo DATAINICIO, necessário no Sql de entrada ', 'Regra - Erro',mtError,[mbOk],0);
      Regra.fError := True;
      Exit;
    End;

    { Guarda Dados do Processo }
    sDataInicio  := Regra.QueryIn.FieldByName('DATAINICIO').AsString;
  end;

  { Monta SQL }
  sSQL := 'SELECT FN_BUSCA_PRAZO_TEMPORALIDADE('+sIdade+','+QuotedStr(sDataInicio)+') AS PRAZO FROM DUAL ';

  If FazQuery(Regra.QueryRegraAux,sSQL) Then Begin
    { Seta Resultado }
    Result := Regra.QueryRegraAux.FieldByName('PRAZO').AsString;
  end;
end;
//edilaine WO18367 : fim


//edilaine WO24119 : inicio
function PAGAPECULIOSALDADO(Regra : TRegra; Formula : String) : String;
Var
  sFormulaAux,
  sIdTitular, sSQL : String;
  sIdPessoa : String;              //edilaine WO27996
  I :Integer;
Begin
  sIdTitular := '';

  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }

  { Retira Nome da Formula }
  sFormulaAux := Copy(Formula,23,Length(Formula));
  sFormulaAux := Copy(sFormulaAux,1,Length(sFormulaAux)-1);

  { Pega IDTITULAR alternativo }
  sFormulaAux := Copy(sFormulaAux,(I+1),Length(sFormulaAux));
  sIdTitular := Copy(sFormulaAux,1,Length(sFormulaAux));
  sIdTitular := Regra.PegaValor(sIdTitular);

  { Fim da decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Guarda Dados do Processo }
  If sIdTitular = '' Then
  begin
    { Verifica Campos Obrigatórios ( IDTITULAR ) }
    If Regra.QueryIn.FindField('IDTITULAR') = NIL Then Begin
      MsgDlg('Campo IDTITULAR, necessário no Sql de entrada ', 'Regra - Erro',mtError,[mbOk],0);
      Regra.fError := True;
      Exit;
    End;

    { Guarda Dados do Processo }
    sIdTitular  := Regra.QueryIn.FieldByName('IDTITULAR').AsString;
  end;


  //edilaine WO27996 : inicio
  If sIdPessoa = '' Then
  begin
    { Verifica Campos Obrigatórios ( IDTITULAR ) }
    If Regra.QueryIn.FindField('IDPESSOA') = NIL Then Begin
      MsgDlg('Campo IDPESSOA, necessário no Sql de entrada ', 'Regra - Erro',mtError,[mbOk],0);
      Regra.fError := True;
      Exit;
    End;

    { Guarda Dados do Processo }
    sIdPessoa  := Regra.QueryIn.FieldByName('IDPESSOA').AsString;
  end;
  //edilaine WO27996 : fim


  { Monta SQL }
  //----------------------------------------------------
  // REGRA
  //----------------------------------------------------
  // -- se falecimento do pensionista (pagamento para herdeiro)
  //     - se morreu antes do inicio do novo calculo: paga peculio
  //       se morreu depois: nao paga
  // -- se titular
  //    - ativo
  //      se tiver NP estiver cancelado <> DATAOBITO ou nao tiver NP = paga peculio no Saldado
  //      ( NOVO CALCULO - TIPO = SIM ) - Busca o BENEFSALDADO na BenefSaldFab no mes obito
  //    - assistido
  //      verifica IDPLANPREVCONTAB da benefbfciario para idplanoprev = 2;


  //edilaine WO27996 : inicio
  if sIdTitular <> sIdPessoa then
  begin
    sSQL := 'select trunc(pf.datamorte) as dtmorte, pap.DTNOVOCALCPENSASALDADA        '+
            '  from movbenef b                                      '+
            '  join pessoafisica pf on pf.idpessoa = b.idpessoa     '+
            '  join paramaprev pap on pap.idpessoa = 1              '+
            ' where b.idpessoa <> b.idtitular                       '+
            '   and b.motretenc = 5  /*falecimento*/                '+
            '   and b.idpessoa  = '+ sIdPessoa +
            '   and exists (select 1 from benefbfciario bf          '+
            '                where bf.idbeneficio   = b.idbeneficio '+
            '                  and bf.idpessoa      = b.idpessoa    '+
            '                  and bf.idtitular     = b.idtitular   '+
            '                  and bf.seqproposta   = b.seqproposta '+
            '                  and bf.idpessjur     = b.idpessjur   '+
            '                  and bf.idplanoprev   = b.idplanoprev '+
            '                  and bf.fontepagadora = 1             '+
            '                  and bf.idplanprevcontab = 28         '+
            '              ) ';
    If FazQuery(Regra.QueryRegraAux,sSQL) Then
    Begin
      if (Regra.QueryRegraAux.FieldByName('dtmorte').AsString <> '') and
         (Regra.QueryRegraAux.FieldByName('dtmorte').AsDateTime < Regra.QueryRegraAux.FieldByName('DTNOVOCALCPENSASALDADA').AsDateTime) then
         Result := '1'
      else
         Result := '0';
      exit;   
    end;
  end;
  //edilaine WO27996 : fim


  sSQL := 'select s.descricao, sp.descricao, pp.*,             '+
          '       nvl((select distinct 1                       '+
          '              from benefbfciario bf                 '+
          '             where bf.idpessoa    = bf.idtitular    '+
          '               and bf.idpessoa    = pp.idpessoa     '+
          '               and bf.idplanoprev = pp.idplanoprev  '+
          '               and bf.idpessjur   = pp.idpessjur    '+
          '               and bf.seqproposta = pp.seqproposta  '+
          '               and bf.idtppagtobenefic = 1          '+  //beneficio vitalicio
          '               and bf.idsitbeneficio   = 3          '+  //beneficio encrrado
          '               and bf.idplanprevcontab = 28         '+  //plano saldado
          '          ), 0) as FLGASSISTIDO,                    '+
          '       nvl((select 1                                '+
          '              from partprevplan p1                  '+
          '              join pessoafisica pf on pf.idpessoa = p1.idpessoa     '+
          '             where p1.idpessoa    = pp.idpessoa                     '+
          '               and p1.idplanoprev = 74                              '+  //plano NovoPlano
          '               and trunc(p1.DATACANCELAMENTO) = trunc(pf.datamorte) '+
          '          ),0) FLGNOVOPLANO                                         '+
          '  from partprevplan pp                                              '+
          '  join sitpart s on s.idsitpart = pp.idsitpart                      '+
          '  join sitplanoprev sp on sp.idsitplanoprev = pp.idsitplanoprev     '+
          ' where pp.idplanoprev    = 2                                        '+  //plano RegReplan
          '   and pp.idsitplanoprev = 26                                       '+  //Situacao "Cancelado (saldado)"
          '   and pp.idpessoa       = '+ sIdTitular;

  If FazQuery(Regra.QueryRegraAux,sSQL) Then Begin
    { Seta Resultado }
    //  - TIPOS DE RESULTADO
    //    0  - Não paga peculio
    //    1  - Paga peculio no plano saldado
    //    Erro

    { assistido }
    if Regra.QueryRegraAux.FieldByName('FLGASSISTIDO').AsString = '1' then
       Result := '1'
    else
    { ativo }
    begin
      { nao tem novo plano }
      if (Regra.QueryRegraAux.FieldByName('FLGNOVOPLANO').AsString = '0') then
         Result := '1'
      else
         Result := '0';
    end
  end;

  If Trim(Result) = '' Then
     Result := 'ERRO';
end;
//edilaine WO24119 : fim

end.


