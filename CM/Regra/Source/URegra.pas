//*****************************************************************************
// SISTEMA : REGRA (REGRAS DE NEGÓCIO)
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//  Autor     : Ediaine
//  Pendencia : WO24119
//  Descrição : Criar Formula PAGAPECULIOSALDADO e ajustar NOVOCALCPENSAOSALDADA
//  Data      : 04/08/2025
//------------------------------------------------------------------------------
//  Autor     : Ediaine
//  Pendencia : WO18367
//  Descrição : Criar Formula NOVOCALCPENSAOSALDADA e TEMPORALIDADE
//  Data      : 28/02/2025
//------------------------------------------------------------------------------
// Alteração  : Correcao, FazCorrecao
// Nº SIG.....: 131430
// Data.......: 10/05/2023
// Responsável: Edilaine
// Descrição..: Formula Correcao com arredondamento casas decimais
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
//  Autor     : Andre Imakawa
//  Pendencia : SIG 99564
//  Descrição : Alteração do nome da Formula e criação do novo parametro.
//  Data      : 22/04/2020
//------------------------------------------------------------------------------
//  Autor     : Ewerton Beltramini
//  Pendencia : SIG99274
//  Descrição : Criação da formula ANTECIPAMESABONO
//  Data      : 24/03/2020
//------------------------------------------------------------------------------
//  Autor     : Fábio Sampaio
//  Pendencia : SIG85462
//  Descrição : Criação da formula BUSCAMINFREQCAIXA
//  Data      : 02/05/2019
//------------------------------------------------------------------------------
//  Autor     : William Moreira da Silva
//  Pendencia : SOL 42298
//  Descrição : Criação da formula VALORRUBTMPDESC
//  Data      : 21/03/2017
//------------------------------------------------------------------------------
//  Autor     : William Moreira da Silva
//  Pendencia : SOL 40538
//  Descrição : Criação de formulas VALORBENEFICIOINICIAL e VALORBENEFICIOSALDADO
//  Data      : 03/03/2017
//------------------------------------------------------------------------------
//  Autor     : Andre Imakawa
//  Pendencia : SIG 29926
//  Descrição : Alterado Regra SITBENEFICIO, busca deve ser feita pelo NUMEROPROCESSO
//  Data      : 21/09/2016
//------------------------------------------------------------------------------
//  Autor     : Peterson Victor
//  Pendencia : SOL 268938 PPM :1271773
//  Descrição : acertar arredondamento
//  Data      : 05/05/2016
//------------------------------------------------------------------------------
//  Autor     : Peterson Victor
//  Pendencia : SOL 269352 PPM 1291068
//  Descrição : Incluido parametro idpessoa na OPPATRO
//  Data      : 18/02/2016
//------------------------------------------------------------------------------
//  Autor     : Fernando Xavier
//  Pendencia : SOL 241785 PPM 560820
//  Descrição : Ajustar a rotina de calculo do campo SRB Revisado do demonstrativo
//              de beneficios. Modulo: Beneficio. Funcionalidade: Calculo Retroativo
//  Data      : 30/10/2014
//------------------------------------------------------------------------------
//  Autor     : Fernando Xavier
//  Pendencia : SOL 219617 Kintana 2051601
//  Descrição : Alteração da formula EM_VLRRUBMES
//  Data      : 30/10/2013
//------------------------------------------------------------------------------
//  Autor     : Fernando Xavier
//  Pendencia : SOL 212844 Kintana  2051020
//  Descrição : Alteração da formula EM_VLRRUBMES
//  Data      : 23/10/2013
//------------------------------------------------------------------------------
//  Autor     : André Oliveira
//  Pendencia : SOL 193327 Kintana  1839657
//  Descrição : Criação da formula VWFORMRUBJUD
//  Data      : 31/10/2012
//------------------------------------------------------------------------------
//  Autor     : André Oliveira
//  Pendencia : SOL 136384/10362 Kintana 1712325
//  Descrição : Criação da formula VALORSRBNP
//  Data      : 09/07/2012
//------------------------------------------------------------------------------
//  Autor     : André Oliveira
//  Pendencia :  SOL 136384/11302 Kintana 1786550
//  Descrição : Criação da formula VALORBENEFICIOINSS
//  Data      : 05/09/2012
//------------------------------------------------------------------------------
//  Autor     : Otacilio Aquino
//  Pendencia : SOL 184600 Kintana 1729037
//  Descrição : Ajuste na Função "CarregaAlgNova"
//  Data      : 16/07/2012
//------------------------------------------------------------------------------
//  Autor     : André Oliveira
//  Pendencia : SOL 183347 Kintana 1712386
//  Descrição : Aumentar limite de 200 passos das regras para 400
//  Data      : 02/07/2012
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
//  Autor     : Rodrigo de Brito Figueredo
//  Pendencia : SOL 183363 KINTANA 1713362
//  Descrição : Ajuste na query da fórmula VALORCF.
//  Data      : 28/06/2012
//------------------------------------------------------------------------------
//  Autor     : BRUNO AZEVEDO
//  Pendencia : SOL 179822 KINTANA 1659539
//  Descrição : Ajuste na consulta da fórmula CFPESSOA.
//  Data      : 09/05/2012
//------------------------------------------------------------------------------
//  Autor     : Vinicius Ferreira
//  Pendencia : SOL 153972 KINTANA 1169147
//  Descrição : Criação da fórmula QTDDIASCFPESSOA
//  Data      : 05/04/2012
//------------------------------------------------------------------------------
//  Autor     : Wylliam Leite da Silva
//  Pendencia : SOL 176340 KINTANA 1608819
//  Descrição : Criação da fórmula ADICIONALPERC
//  Data      : 29/01/2012
//------------------------------------------------------------------------------
//  Autor     : Eraldo Luis da Silva
//  Pendencia : SOL 159196 KINTANA 1302968 INICI
//  Descrição : Criação da fórmula ADICIONALPERC
//  Data      : 29/01/2012
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//  Autor     : Fanuel Junior
//  Pendencia : SOL171163/7441 Kintana1531659
//  Descrição : Erro fórmula RUBRINDIV
//  Data      : 29/12/2011
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
//  Autor     : BRUNO AZEVEDO
//  Pendencia : SOL 147630-6881 KINTANA 1466979
//  Descrição : Criação da fórmula RUBRINDIV13.
//  Data      : 26/10/2011
//------------------------------------------------------------------------------
//  Autor     : Fanuel Junior
//  Rotina    : COMPARAVALBENEF
//  Pendencia : SOL 157238 Kintana 1250247
//  Descrição : Criação da fórmula COMPARAVALBENEF
//------------------------------------------------------------------------------
//  Autor     : Fanuel Junior
//  Rotina    : ExecutaRegra
//  Pendencia : SOL 156987 Kintana 1246224
//  Descrição : Erro após liberação do pacote 1242691.
//------------------------------------------------------------------------------
//  Autor     : Fanuel Junior
//  Rotina    : ExecutaRegra e ExecutaOutraRegraNova
//  Pendencia : SOL 144511 Kintana 952230
//  Descrição : Implementação de funcionalidade que permita retornar o
//  passo de uma regra na tela de Execução de regras na opção Passo a Passo.
//------------------------------------------------------------------------------
//  Autor     : Fernando Xavier
//  Rotina    : CFPESSOA
//  Pendencia : SOL 153355 Kintana 1156051
//  Descrição : Erro na fórmula CFPESSOA
//------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Pendência   : SOL 150417 Kintana 1092011
// Descricao   : Favor incluir nas Qry encaminhadas por e-mail o IDPLANOORIGEM na rotina do
// preparo e ajustar o erro apresentado quando executado o qry SELECT * FROM calculo
// WHERE idpessoa = 768245 WHERE idcalculo = -1.
//------------------------------------------------------------------------------
//  Autor     : BRUNO AZEVEDO
//  Pendencia : SOL 147807 KINTANA 1027715
//  Descrição : Correção na query da função VERFUNCAOPCC.
//  Data      : 18/11/2010
//------------------------------------------------------------------------------
//  Autor     : Fernando Xavier
//  Rotina    : VERFUNCAOPCC
//  Pendencia : SOL 147291 Kintana 1015812
//  Descrição : Erro na fórmula VERFUNCAOPCC
//------------------------------------------------------------------------------
//  Autor     : Fernando Santana
//  Pendencia : SOL 146940 Kintana 1007619
//  Descrição : Desfazer o SOL 144420 kintana 950898
//------------------------------------------------------------------------------
//  Autor     : Fernando Xavier
//  Rotina    : VALORCF
//  Pendencia : SOL 147164 Kintana 1012127
//  Descrição : Erro no filtro de cargo ou função
//------------------------------------------------------------------------------
//  Autor     : Fanuel Junior
//  Rotina    : buscaVariavel
//  Pendencia : SOL 146191 Kintana 990522
//  Descrição : criação da função buscaVariavel
//------------------------------------------------------------------------------
//  Autor     : BRUNO AZEVEDO
//  Rotina    : ADICIONALMES
//  Pendencia : SOL 144420 kintana 950898
//  Descrição : Ajuste na fórmula.
//  Data      : 22/09/2010
//------------------------------------------------------------------------------
//  Autor     : Fernando Xavier
//  Rotina    : ExibeMsg
//  Pendencia : SOL 136806 Kintana 820407
//  Descrição : alteração da mensagem do regra inclusão da regra e do passo
//------------------------------------------------------------------------------
//  Autor     : Renato Visoni
//  Rotina    : RUBRINDIV
//  Pendencia : SOL 135399 Kintana 805304
//  Descrição : Alteração na query 'ND R.FLGUSAABONO IN (0,1)';
//-------------------------------------------------------------------------
//  Autor     : Ádler Souza
//  Rotina    : RUBRINDIV
//  Pendencia : SOL 121261 KINTANA 582557
//  Descrição : Tratamento para utilizar o campo IDPLANPREVCONTABIL da query de entrada
//               (quando esse campo for passado)
//-------------------------------------------------------------------------
//  Autor     : Thiago Passos
//  Rotina    : RUBRINDIV
//  Pendencia : SOL 124272 KINTANA 649353
//  Descrição : Tratamento para utilizar o campo IDPLANPREVCONTABIL da query de entrada
//               (quando esse campo for passado)
//-------------------------------------------------------------------------
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
// Autor(a)    : Daniel Begnami
// Data        : 12/09/2008
// Rotina      : TRegra.RUBRINDIV
// Pendência   : Sol: 95655 KT: 413537
// Descricao   : Na formula RUBRINDIV parametro "FLGATIVA" nao deve considerar o filtro
//               NUMOCORRENCIAS < PARCELAS quando a rubrica estiver como PERMANENTE (FLGPERMANENTE = 1).
//               O parametro "FLGATIVA" tem que verificar se a regra está ativa também: FLGDESATIVADO = 0)
//------------------------------------------------------------------------------
// Alterações no Arquivo de AltCompoRegra.Txt
// Augusto 24/09/2007 - 26092 - Criação da formula SOMACOTASRESERVA  
// Paulo Ramos 03/08/2007 - 25796 - ADICIONALDIA, ADICIONALMES, NUMDIASADICIONAL, NUMDIASPERCADICIONAL -
//   Incluir opção de adicional compensatório no parâmetro TIPOADICIONAL das fórmulas. Equalizei outros parâmetros que eventualmente não estavam contemplados.
// Augusto 17/07/2007 - 25782 - INDICE - Novo parametro para retorna a data da cotação
// Augusto 27/02/2007 - 24512 - PR2 - Inclusão do filtro de FLGESTORNO = = na consulta da HISTRUBSAL
// Augusto 12/12/2006 - 23984 - Alteração nas fórmulas de Emprestimo (PV,FV,PMT...) para resultado com ponto
// Augusto 17/11/2006 - Inclusão do log para campos faltando no SQL de entrada
// Augusto 17/10/2006 - Alteração na fórmula VERCONCEDIDO, incluir IDPESSOA
// Augusto 05/10/2006 - Alteração na fórmula RUBRINDIV
// Claudio Faria - 03/10/2006 - Alteração nas fórmulas VALORCF e VLRCF - Pendência 23055
// Augusto 23/08/2006 - CFPESSOA - Novo parametro indicando se trará somente CF ativos (DATAFINAL nula)
// Augusto 10/05/2006 - Inclusão da fórmula RUBREEMBINSS
// Augusto 09/05/2006 - Acertos diversos na logica de execução das regras 
//                      Acerto na formula IRRF (dentro da uCalcIrrf)
// Augusto 08/03/2006 - Alteração na chamada da formula TRUNC. Agora utiliza uma função interna. Pendência 21619
// Augusto 07/03/2006 - Testar valor antes de atualizar DETCALCULO
// Augusto 26/01/2006 - Filtar somente patrocinadoras na formula TEMPOPATRO. Pendencia 21316
// Augusto 19/12/2005 - Chamada da nova formula SOMACONJUNTORUBRICA
// Augusto 11/10/2005 - Não mais mostrar erro quando variavel não existir, apenas gravar um LOG
// Augusto 26/09/2005 - Chamada da nova formula TOTALIZAITENSEP
// Augusto 13/09/2005 - Chamada da nova formula ULTDATAEVENTO
// Augusto 21/07/2005 - Acerto na Formula VALORCF, Troca de IDFAIXASALEXT para DATAEFETIVACAO
// Augusto 12/07/2005 - Acerto na função TrataErros
// Augusto 30/06/2005 - Chamada da Nova Fórmula ULTDATACONTRIB
//                      Incluir IDREGRA nos select
// Augusto 14/03/2005 - Acerto na QryPro
// Augusto 21/01/2005 - Novo tratamento na formula IRRF
// Augusto 03/01/2005 - Acerto no passo comparar valores clausula "EM"
// Augusto 30/11/2004 - ADICIONALDIA - Retornar PERC2AC
// Augusto 23/11/2004 - Chamada da nova formula SOMAHSTBENEF
// Augusto 26/08/2004 - CFPESSOA Implementação nos filtros da pesquisa
// Camille 25.08.2004 - Alteração na PR2
// Camille 05.08.2004 - FORMULA NOVA - TOTALIZAINDICADOR
// Camille 05.08.2004 - PENDENCIA 17339 - Acerto na substituicao de , por AND
// Camille 05.08.2004 - PENDENCIA 17222 - Acerto na leitura dos 3 ultimos parametros
// Augusto 21/07/2004 - Chamada para formula POSSUIMIGRACAO
// David   15/07/2004 - Pendência 16740. Acertos na fórmula MED, que estava
//                      retornando valores incorretos.
// Augusto 24/06/2004 - Alteração para gravar ANOMESREF na gravação da Memoria de Calculo
// Augusto 12/02/2004 - Acertos na Formula QTDMINUTOS
// Camille 21.01.2004  CFPESSOA Criação do parâmetro modofunção
// Camille 14.01.2004  VALORCF  Criação do parâmetro modofunção
// Camille 28.10.2003  PRO      Desmembrar as rubricas a serem tratadas - Pendencia  : 15464
// David   04.12.2003  MED      Problema ao calcular a média de períodos com poucos meses. - Pendencia  : 15716
// David   10.12.2003  PRO      Correção de problema na montagem da matriz de salários para
//                               cálculo da média. - Pendencia  : 15784
// David   11.12.2003  EXECOPPATRO Inclusão do retorno dos campos VALORBASE4, VALORBASE5 e
//                                  VALORBASE6, novos na base. - Pendencia  : 15598
//------------------------------------------------------------------------------

unit URegra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, BDE, DB, Stdctrls, Math, finputvar, VcF1, grids, fpassoapasso,
  registry, uPilha, uCalcIrrf, fPegaTab, wwQuery, wwTable,  dsgnintf,
  uMensErro, UDataBase, uFuncoesRegra, FMostraPassos,
  uDiasUteisInvest, uSistema, uCtrlPadroes;
type
//------------------------------------------------------------------------------
// Tipos declarados para o Componente
  TParams = class(TPersistent);

  STR7  = string[7] ;
  STR10 = string[10];
  STR3  = string[3] ;

  Tipo  = Record
            campo : string;
            valor : string;
          End;
  TCmps = Record
            Campo : String;
            Valor : String;
          End;

  tSalario = record
               mes    : string[7];
               salario: real;
               teto   : real;
               tipo   : integer;
             end;

  TTipoCliente=(tcFundacao, tcOutros);

// tipo do ponteiro para o metodo da regra
  TOnGetResult = procedure(sender:tobject)of object;

  TOnGetResultDistinct = procedure(sender:tobject)of object;

// tipo do ponteiro para a procedure de erro
  TProcErro    = procedure(sender:tobject;e:exception)of object;

  TIndice      = record
                   Mes  : Str7;
                   Valor: Double
                 end;

  tTabIndice   = Array[0..48]  of tIndice;

  tparray      = Array[0..40]  of string;

  Tchave       = Record
                   campo : string[60];
                   op    : string[02];
                   valor : string[60];
                   Tipo  : String[01];
                 end;

// Registro que guardara os dados das regras executadas na memoria
    TRegRegra = Record
      IdRegra          : String;                       //Códigos dos algoritmos
     //inicio - SOL 183347 Kintana 1712386
      aAlgorRegra      : Array[1..400] of String;      //Códigos dos algoritmos
      aAlgorCampo      : Array[1..400] of String[12];  //Códigos dos campos
      aAlgorCampo2     : Array[1..400] of String[12];  //Códigos dos campos 2
      aAlgorFormula1   : Array[1..400] of String[38];  //Códigos das fórmula's1
      aAlgorExpressao  : Array[1..400] of String;
      aAlgorCorrelacao : Array[1..400] of String[2];   //Códigos das correlações
      aAlgorFormula2   : Array[1..400] of String[38];  //Códigos das fórmula's2
      aAlgorValor      : Array[1..400] of String[60];  //Valores constantes para atribuição ou comparação
      aAlgorSubseqTrue : Array[1..400] of String[38];  //Códigos dos algoritmos subseq se true
      aAlgorSubseqFalse: Array[1..400] of String[38];  //Códigos dos algoritmos subseq se false
      aAlgorTipo       : Array[1..400] of String[38];  //Tipo de Algoritmo
      aAlgortipocampo1 : Array[1..400] of string[1];
      aAlgortipocampo2 : Array[1..400] of string[1];
      aAlgorNomecampo1 : Array[1..400] of string[30];
      aAlgorNomecampo2 : Array[1..400] of string[30];
      aAlgorFormatacao : Array[1..400] of string[2];
      //fim - SOL 183347 Kintana 1712386
   
    End;

// Registro que Guardará a Posicao da Proxima regra a ser guardada no vetor
// e caso exista a posicao da regra pesquisada
    TRegPosRegra = Record
                     ProxPosicao,
                     PosicaoRegra : Integer;
                   End;

{******************************************************************************}
// Inicio da declaracao da Classe TREGRA
  TRegra       = class(TComponent)
  private

    { Private declarations }
    TabuaBio, Fgrphipotese, Ftabbiometrica   :string;
    Formula1         : TF1Book;
    FOnGetResult     : TOnGetResult;
    FOnGetResultDistinct : TOnGetResultDistinct;
    ProcErro     : TProcErro;
    TabelaBiometrica,
    TabelaCampoBio   : TwwTable;

    //Andre Ini
    TabelaGrHipotese  : TwwTable;           // usada na formula de HIPOTESE
    //Andre Fim

    QryPro        : twwQuery;
    Qry           : twwQuery;

    //QryINSS       : twwQuery;

    qryindice     : twwQuery;
    qrytabuabio   : twwQuery;
    qryalg        : twwQuery;
    FidEmpresa    : Integer;
    FDistinctFields : String;
    FRuleName     : String;
    FRuleNumber   : String;

    DSRegra      : TDataSource;
    FActivated   : Boolean;
    FMantemMemoria : Boolean;
    FResult      : String;
    FDatabaseName: String;
    FAlgEditBox  : TEdit;
    ErroCampo : Boolean;
    FQueryOut    : twwQuery;
    FParamOut    : String;

    FPassonumber : String; //SOL 136806 Kintana 820407

    sRegraAnt    : String;
    iContRegQryIn: Integer;
    FDataRef     : Str10;

    sPeriodos    : String;
    sJurosMedio  : String;
    sPrimeira    : String;
    sMontante    : String;
    sPrincipal   : String;
    FTipoCliente : TTipoCliente;
    FMessageInfo: String;

    function buscaVariavel (variavel : String): String;
    function GetResult  : String;
    function CarregaAlgoritmos(Value: String): Integer;
    function FazCorrelacao(Value: Integer): Integer;
    function FazAtribuicao(Value: Integer): Integer;
    function GetFormula(Value: String): String;
    function tiraTodosBrancos(Value: String): String;
    function PegaEntidade(Value: String): String;
    function PegaNomeCampo(Value: String): String;

    function VerifValor( Value : String ) : Integer;
    function BuscaBD(IdCampo : String) : String;

    function pv: String;
    function fv: String;
    function npmt: String;
    function pmt: String;
    function rate: String;

    function TotRegs : Integer;
    function Extrair:string;
    function TestaData(datain:string):tdatetime;
    Function TrazValor(texto:string):string;

    Function GrupoHipotese(texto:string):string;

    Function BuscaValor(texto:string):string;
    Function ExecutaOutraRegra(opc:char):string;
    Function DiaMesAno(tipo:str3):string;
    Function Atuarial(Var sformula:string):string;

    Function Subtrair(input:str7;qtd:integer):string;
    Function Somar   (input:str7;qtd:integer):string;

    {--------------------------------------------------------------------------}
    { Formulas do Componente Revistas                                          }

    { Formulas }
    Function MAIORCFCOD  (Formula : String) : String;//André Oliveira SOL 136384/10042 Kintana 1688458
    Function DIASINICIAIS(Formula : String) : String;
    Function DIASFINAIS  (Formula : String) : String;
    Function DIAINICIAL  (Formula : String) : String;
    Function DIAFINAL    (Formula : String) : String;
    Function EDIA        (Formula : String) : String;
    Function EMES        (Formula : String) : String;
    Function SBINSS      (Formula : String) : String;
    Function CONCAT      (Formula : String) : String;
    Function CP          (Texto   : String) : String;
    Function PR2         (Texto   : String) : String;
    Function PARADATA    (pData   : String) : String;
    Function FAZCORRECAO (Formula : String) : String;
    Function MEDIAINSS   (Formula : String) : String;
    Function DIFDIAS     (Formula : String) : String;
    Function MAXIMO      (Formula : String) : String;
    Function MINIMO      (Formula : String) : String;
    Function SITPESSOA   (Formula : String) : String;
    Function SITINTERNA  (Formula : String) : String;
    Function SITBENEFICIO(Formula : String) : String;
    Function QTDMINUTOS  (Formula : String) : String; 
    Function TOTALIZAINDICADOR(Formula : String) : String; 

    Function NUMOCORCONTRIB (Formula : String) : String;

    Function INDICE      : String;

    Function PRO         : Integer;
    Function NP          : Integer;
    Function MED         : Double;

    Procedure DIFANOS;

    { Funcoes e Procedimentos }
    Function PegaValorCMPBD(Value : String): String;
    Function Correcao      (Data1, Data2:TDateTime;
                            Moeda:String;
                            Valor:Double;
                            ArredCasas:integer    //edilaine - SIG131430
                            ):String;

    Function EhNumero      (Value : String): Boolean;
    Function EhData        (Value : String): Boolean;
    Function EhVariavel    (Value : String): Integer;
    Function EhString      (Value : String): Boolean;


    Function DiasIni       (Data : TDateTime; Tipo : LongInt): LongInt;
    Function DiasFim       (Data : TDateTime; Tipo : LongInt): LongInt;

    Function ExecutaRegraInterna (NumeroRegra, Rubrica : LongInt): String;

    { Exibe caixa de dialogo padrão }
    function MsgDlgRegra (const Msg: String; const Caption: String; AType: TMsgDlgType;
                          Buttons: TMsgDlgButtons; HelpCtx: Longint): TModalResult;

    Procedure GravaCalculo;
    Procedure TrataErros   (Sender:TObject; Erro:Exception);
    Procedure ExibeMsg     (Msg, Variavel: String);

    {--------------------------------------------------------------------------}


    Function tratapalavra:boolean;
    Function SubtrairMeses(smesmaior,smesmenor:str7):integer;

    Function Arredonda(FormulaLoc: String): String;
    Function Trunca   (FormulaLoc: String): String;

    Function ExecutarQuery(Qry: twwQuery; Const Str :String): Boolean;
    Function FazQuery(Var Qry : twwQuery; Str : String) : Boolean;
    Function Concatenar (Texto:TpArray):String;
    Function CamposDesc(formula:string):string;
    Function Replicate(Texto:String;NVezes:Integer):String;
    Function Alinha(Texto:String;Tamanho:Integer;Tipo:String):String;
    Function AlinhaTEXTO(Texto:String):String;
    Function CarregaQueryLinhas(sNomeTab:String; var tab:integer):Boolean;
    Function Dias360(vDtMenor, vDtMaior : TDateTime; Tipo : LongInt): Real;
    Function TpDadoCons(NomeTabGener, Campo : String): String;


    Function EANO(formula:string):string;
    function TrocaSeparador(Value: String): String;
    Function CarregaAlgPilha:Integer;
    Function TiraPlic(texto:string):string;
    Function IRRF(formula:string):String;
    Function IndBiometrico(texto:string):string;
    Function RUBRINDIV( Formula : String ) : String;
    //BRUNO AZEVEDO SOL 147630-6881 KINTANA 1466979
    Function RUBRINDIV13(Formula:String): String;
    Function DIASDOMES(texto:string):string;
    function NUMSALARIOS(Texto : String): String;

    function VLRRUBMES(formula:string):String;

    function NUMOCORRUB(formula:string):String;

    Function MEDPERCRUB(Formula : String): String;


    function VERCONCEDIDO(Formula : String) : String;

    function TEMPOPATRO(Formula : String) : String;
    function TEMPOPLANO(Formula : String) : String;

    function TEMPOAFAST(Formula : String) : String;

    Function SORTINSS(formula:string):String;
    Function FILTRAINSS(formula:string):String;
    Function NUMINSS(formula:string):String;
    Function NUMCONTRIB(formula:string):String;

    Function Nivel(FormulaLoc:string):string;
    Function NumProv(texto:string):string;
    Function IdadeCompleta(sDataMenor, sDataMaior:string):String;
    Function IdadeEmMeses(sDataMenor, sDataMaior : string):String;

    Function Formatar(valor:double;casas:integer):String;
    Function FazFormatacao(formula:String):String;
    function UltDiaMes(Data : TDateTime): LongInt;

    function AchaMes(Mes : String) : Boolean;
    function PegaMes(Mes : String) : String;

    procedure PegaCampo(nome:string;formula:boolean;var resultado : string);

    procedure SetResult(Value: String);
    procedure FazInput(Value: Integer);
    procedure ExecutaRegra;
    procedure FinalizaRegra;
    Procedure ExibePasso;
    procedure setDataRef(data:str10);

    procedure setIdcalculo(idcalculo:longint);

    procedure VoltaOpcoesPatro(var sOpcao1 ,sOpcao2, sOpcao3,
                                   sOpcao4 ,sOpcao5, sOpcao6 : String ;
                                   sIdPessoa , sIdpessjur    : String );
    Function ExecOpPatro(formula:String) : String;

    //William Moreira da Silva - SIG 40538
    Function ExecVALORBENEFICIOINICIAL(formula:String) : String;
    Function ExecVALORBENEFICIOSALDADO(formula:String) : String;
    //William Moreira da Silva - SIG 40538

    //William Moreira da Silva - SIG 42298
    Function ExecVALORRUBTMPDESC (formula:String) : String;
    //William Moreira da Silva - SIG 42298

    function ExecBUSCAMINFREQCAIXA(formula:String) : String; // Alterado por FHBS - 01/05/2019 - SIG85462
    function ExecABONOMES(formula:String) : String; // Ewerton Beltramini - SIG99274 // Andre Imakawa - SIG 99564

    Function OPCONTRIB(formula:String) : String;
    Function OPBENEF(formula:string):String;
    Function VEROPCONTRIB(formula:String) : String;
    Function SALCONTRIB(formula:String) : String;

    Function AnoBi(vDtMenor, vDtMaior : TDateTime) : Real;

    function VerifCalculo(Ident : LongInt) : Boolean;


// Carrega Todos os Algoritimos da Regra que será executada
    Function CarregaAlgNova(Value:String):Integer;
// Executa uma outra Regra dentro de uma regra
    Function ExecutaOutraRegraNova(OPC:Char):String;

// Verifica e Retorna a Posicao da Regra no Vetor caso ela já tenha sido
// Executada
    Function RegraJaExecutada(IdRegra:String):TRegPosRegra;

// *** FUNCOES DO GRUPO EVOLUCAO FUNCIONAL
    Function ADICIONALDIA         (Formula : String)      : String;
    Function ADICIONALMES         (Formula : String)      : String;  
    Function BUSCAPCS             (Formula : String)      : String;  
    Function VALORCF              (Formula : String)      : String;  
    Function CFPESSOA             (Formula : String)      : String;  
    function GRUPOPESSOA          (Formula : String)      : String;  
    function MAIORCF              (Formula : String)      : String;  
    function NIVELPESSOA          (Formula : String)      : String;  
    Function NUMDIASADICIONAL     (Formula : String)      : String;  
    Function NUMDIASPERCADICIONAL (Formula : String)      : String;  
    Function PERCENTUALFUNCAO     (Formula : String)      : String;  
    Function TOTALCFMES           (Formula : String)      : String;  
    Function VERFUNCAOPCC         (Formula : String)      : String;  
    Function BUSCAFUNCAOADICCOMP  (Formula : String)      : String;
    //Function ADICIONALPERC        (Formula : String)      : String;

// *** FUNCOES DE OUTROS GRUPOS
    Function PROXIMOANOMES        (iMes, iAno : integer)  : string;
    Function REAJUSTAINSS         (sFormulaAux : string ) : string;  
    Function FREQSALARIO          (Formula : String)      : String;  
    Function CONVERTEDATA         (Formula : String)      : String;
    Function CPASSIST             (Formula : String)      : String;  
    procedure SetRuleName         (const Value: String);
    procedure SetRuleNumber       (const Value: String);
    procedure SetTipoCliente      (const Value: TTipoCliente);
    procedure SetMessageInfo(const Value: String);


  protected
    { Protected declarations }

  public
    xLocal           : Boolean;
    sPrimExec        : String;
    TotComponentes   : Integer;
    // Total de váriaveis na tabela de variáveis
    iTotVariaveis    : Integer;

    // Tabela de variáveis. Coluna 1 é o nome e coluna 2 é o conteúdo
    aTabVariaveis    : Array[1..700,1..2] Of String; { Augusto 26/12/2001, era Array[1..70,1..2]  }
    StrGrdTab        : Array [0..150,0..150,0..20] Of String[20];
    NomeStrGrdTab    : Array [0..20] Of String[20];

// Ponteiros Utilizados no Controle das Pilhas do Regra.
    T,TAux           : PtNodo;
    TRep             : PtNodoRep;
    TInd             : PtNodoInd;


    { Vetor que irá guardas os registros das regras executadas na memória }
    VetRegrasMemoria : Array[0..20] Of TRegRegra;
    { Guarda o Proxima Regra / Passo a ser Debugado no caso de Passo a Passo (DEBUG) }
    wProxRegra, wProxPasso : Integer;
    { Guarda a Posibilidade da Regra possuir uma query interna (VIEWS) }
    TemQuery : Boolean;
    { Indica se deseja ou não gravar os resultados das regras na memória de Calculo }
    FlgGravaCalculo:Boolean;
    { Indica se deseja ou não recarregar a regra na memoria }
    FlgReloadRule  : Boolean;
    { Indica se deseja ou não Exibir mensagens de aviso }
    FExibeMensagens : Boolean;
    {--------------------------------------------------------------------------}
    { Dados trazidos das clausulas Protegidas para permitir, criação de nova   }
    { unit com funcoes (Formulas) do Regra                                     }
    FError          : Boolean;
    FidCalculo      : LongInt;
    FidCalculoBenef : LongInt;
    iRegraMaster    : Integer;
    iAlgorAtual     : Integer; { Numero do algoritmo que está sendo executado }
    QryOutraRegra : TwwQuery;
    FQueryIn      : TwwQuery;
    QueryRegraAux : TwwQuery;
    QueryRegra    : TwwQuery;
    sFormulaAux     : String;   // Variável de trabalho com fórmula 
    sCampoPesquisa  : String;
    FormatoData     : String;

    {--------------------------------------------------------------------------}
    { Funcões e procedimentos Revistos                                         }
    Function PegaValor     (Value   : String): String;
    Function OraNumero     (sNumero : String): String;
    Function TrocaLetra    (LetraAntiga,NovaString,Frase:String):String;

    Function TrocaCaracter (Texto   : String; De, Para:Char): String;

    Function TABGENERICA : String;                     
    Procedure DIFMESES;                                
    Function CONSULTA    (Linha   : String) : String;  

    function TruncValor(pNumero : Double; pCasas : Byte): Double;
    function ArredValor(pNumero : Double; pCasas : Byte): Double;

    {--------------------------------------------------------------------------}


    Constructor Create(AOwner:Tcomponent); Override;
    Destructor  Destroy; Override;

    { Propriedades Publicas }
    Property  Activated: Boolean Read  FActivated Write  FActivated Default False;
    Property  Result   : String  Read  FResult;
    Property  Error    : Boolean Read  FError     Write FError;
    Property  MessageInfo : String read FMessageInfo write SetMessageInfo;

    Function PegaIdAlgor(Value: Integer): Integer;
    Function TrocaVirgulaPonto(Value: String): String;
    Function Dataparames(datain:string;incmes:integer;opc:char):str7;

    procedure SetVariavel(IdVar: String; Valor: String; NomeVar: String);
    procedure SetDatabaseName(DataBaseName : String);
    procedure Execute;
    procedure PassoaPasso;
    procedure PegaCampoAux(Nome:string;Formula:boolean;var Resultado: string);
    Procedure RefazAmbiente;
    Procedure LimpaVariaveis;

  published
    { Published declarations }

    property RuleName    : String    Read FRuleName     Write SetRuleName;
    property RuleNumber  : String    Read FRuleNumber   Write SetRuleNumber;
    property QueryIn     : TwwQuery  Read FQueryIn      Write Fqueryin;
    property DatabaseName: String    Read FDatabaseName Write SetDatabaseName;
    property AlgEditBox  : TEdit     Read FAlgEditBox   Write FAlgEditBox;
    property QueryOut    : twwQuery  Read FQueryOut     Write FQueryOut;
    property ParamOut    : String    Read FParamOut     Write FParamOut;

    property OnGetResult : TOnGetResult read FOnGetResult Write FOnGetResult ;
    property OnGetResultDistinct : TOnGetResultDistinct read FOnGetResultDistinct Write FOnGetResultDistinct ;

    property Dataref        : Str10   Read FDataRef        Write SetDataRef;
    property IdCalculo      : LongInt Read FIdCalculo      Write SetIdCalculo;
    property GrpHipotese    : String  Read Fgrphipotese    Write Fgrphipotese;
    property TabBiometrica  : String  Read Ftabbiometrica  Write ftabbiometrica;
    Property IdEmpresa      : Integer Read FidEmpresa      Write FidEmpresa Default 0;
    Property DistinctFields : String  Read FDistinctFields Write FDistinctFields;
    Property TipoCliente    : TTipoCliente Read FTipoCliente Write SetTipoCliente Default tcFundacao;
    Property ExibeMensagens : Boolean Read FExibeMensagens Write FExibeMensagens  Default True;

  end;

Var
  RegraLocal : TRegra;
  SairDaRegra : Boolean;
  iTotRegs, wInt   : Integer;                      //Total de algoritmos da regra
  //inicio - SOL 183347 Kintana 1712386
  aAlgorRegra      : Array[1..400] of String;      //Códigos dos algoritmos
  aAlgorCampo      : Array[1..400] of String[12];  //Códigos dos campos
  aAlgorCampo2     : Array[1..400] of String[12];  //Códigos dos campos 2
  aAlgorFormula1   : Array[1..400] of String[38];  //Códigos das fórmula's1
  aAlgorExpressao  : Array[1..400] of String;
  aAlgorCorrelacao : Array[1..400] of String[2];   //Códigos das correlações
  aAlgorFormula2   : Array[1..400] of String[38];  //Códigos das fórmula's2
  aAlgorValor      : Array[1..400] of String[60];  //Valores constantes para atribuição ou comparação
  aAlgorSubseqTrue : Array[1..400] of String[38];  //Códigos dos algoritmos subseq se true
  aAlgorSubseqFalse: Array[1..400] of String[38];  //Códigos dos algoritmos subseq se false
  dValParamFormula : Array[1..400] of Double;      //Valores dos Parâmetros da Fórmula.
  aAlgorTipo       : Array[1..400] of String[38];  //Tipo de Algoritmo
  aAlgortipocampo1 : Array[1..400] of string[1];
  aAlgortipocampo2 : Array[1..400] of string[1];
  aAlgorNomecampo1 : Array[1..400] of string[30];
  aAlgorNomecampo2 : Array[1..400] of string[30];
  aAlgorFormatacao : Array[1..400] of string[2];
  //fim - SOL 183347 Kintana 1712386
  aHistAlgor       : Array[1..10000,1..2] of String; // Fanuel Junior SOL144511 Kintana952230
  iCtrlAlgor       : integer; // Fanuel Junior SOL144511 Kintana952230
  iUltAlgor        : integer; // Fanuel Junior SOL144511 Kintana952230
  iVoltouRegra     : integer; // Fanuel Junior SOL144511 Kintana952230


  //Var lá de baixo
  achou,passoubiometrica,passouhipotese        :boolean;
  frmInput         : TFrmInputVar;
  posicao, uposindice, passoaux, passo, flagcampo, vet, grpqry : integer;
  Separador, separadorantigo, milharantigo, sLista : Char;


  indiceatual, palavra, sFormulaP, scamporet : string;
  IidCalculo       : Longint;
  mbio : array [1..100,0..120] of tipo;
  FlgPot, flgpasso, flg100 : Boolean;
  TabSRB           : Array[1..20 ,0..48] of Double;
  TabSumSRB        : Array[1..20] of string[20];
  TabProv          : Array[1..48] of Double;
  TabMes           : Array[1..48] of Str7;
  TabIndiceAcum    : Array[1..48] of Double;
  TabChaves        : Array[1..10] of TChave;
  TabSalInss, TabSalAux    : Array [0..700] of tSalario;
  vQry : String;
  RegraAtual : LongInt;

// Indica se deseja ou não Ver os passos ao debugar a Regra
  MostraPassos:Boolean;


procedure Register;

implementation

Uses uFormulas,uCmControlObject, uCMTypes, uCmFileUtils;


procedure Register;
begin
  RegisterComponents('CM', [TRegra]);
end;

{******************************************************************************}
{ Contrutor da Classe TRegra                                                   }
{   Cria e Inicia Componentes, Consultas e Variaveis                           }
{------------------------------------------------------------------------------}
Constructor TRegra.Create(AOwner:TComponent);
Var
  Registro: TRegistry;
  Aux : String[2];
Begin
  { Executa Heranca }
  Inherited Create(AOwner);

  IdCalculo := 0;

  TabelaBiometrica := TwwTable.Create(Self);
  TabelaBiometrica.Tablename     := 'VALTABBIO';
  TabelaBiometrica.CachedUpdates := True;
  TabelaBiometrica.filtered      := True;
  TabelaBiometrica.FilterOptions:=[focaseinsensitive];

  TabelaCampoBio := TwwTable.Create(Self);
  TabelaCampoBio.Tablename    := 'CAMPOTABBIO';
  TabelaCampoBio.CachedUpdates:= True;
  TabelaCampoBio.Filtered     := True;
  TabelaCampoBio.FilterOptions:= [focaseinsensitive];

  { Cria Planilha }
  Try
    Formula1 := TF1book.Create(Self);
  Except
    On E:Exception Do Begin
      MsgDlgRegra('Erro ao tentar criar planilha interna (F1Book). '+#13+
             'Registre o componente! ' , 'Regra - Erro',mterror,[mbOk],0);
      Raise;
      Exit;
    End;
  End;

  { Cria Componentes para Consultas (Querys) }
  QueryRegra    := twwQuery.Create(Self);
  DsRegra       := TDataSource.Create(Self);
  QueryRegraAux := TwwQuery.Create(Self);
  QryIndice     := TwwQuery.Create(Self);
  QryTabuaBio   := TwwQuery.Create(Self);
  QryPro        := TwwQuery.Create(Self);
  QryAlg        := TwwQuery.Create(Self);
  QryOutraRegra := TwwQuery.Create(Self);
  Qry           := TwwQuery.Create(Self);


  { Somente Inicia as Pilhas (Pilha := NIL) }
  CriarPilhaRep(TRep);
  CriarPilhaInd(Tind);

//------------------------------------------------------------------------------
// Preenche as Querys
  { Seta Propriedade IdEmpresa caso ainda não tenha sido setada }
  If FidEmpresa = 0 Then FidEmpresa := Sistema.IdEmpresa;
  { Define campo de Pesquisa na HISTRUBSAL }
  If FTipoCliente = tcFundacao Then Begin
    sCampoPesquisa := 'IDPATRO';
  End Else Begin
    sCampoPesquisa := 'IDPESSJUR';
  End;

// Busca as ocorrencias de uma rubrica no Histórico em um periodo, por pessoa, patro
// Agrupando e Somandos os valores por Mes
  With QryPro Do Begin
    SQL.Clear;
    SQL.Add('SELECT H.MES, C.COTVALOR, SUM(H.VALORPROVENTO) AS VALORPROVENTO ');
    SQL.Add('FROM  HISTRUBSAL H, COTACAOMOEDA C, MOEDA M ');
    SQL.Add('WHERE   (UPPER(M.MOESIGLA) =   UPPER(:TETO)) ');
    SQL.Add('  AND (H.IDPESSOA=       :PESSOA) ');
    SQL.Add('  AND (H.MES >=          :MESINI) ');
    SQL.Add('  AND (H.MES <           :MESFIM) ');
    SQL.Add('  AND (H.'+sCampoPesquisa+'  =      :PESSJUR)    ');
    SQL.Add('  AND (H.CODPROVDESC IN  (:RUBRICA))  '); { O IN era = sem "()" trocado pela Dany (CRT) }
    SQL.Add('  AND (H.MES NOT LIKE ''%13'')        ');
    SQL.Add('  AND (C.MOECODIGO=M.MOECODIGO)       ');

    SQL.Add('  AND (SUBSTR(C.COTMESREF,3,4)||''/''||SUBSTR(C.COTMESREF,1,2) = ');
    SQL.Add('            (SELECT  MAX(SUBSTR(COTMESREF,3,4)||''/''||SUBSTR(COTMESREF,1,2)) AS COTMESREF ');
    SQL.Add('             FROM COTACAOMOEDA                   ');
    SQL.Add('             WHERE MOECODIGO = M.MOECODIGO AND   ');
    SQL.Add('                   SUBSTR(COTMESREF,3,4)||''/''||SUBSTR(COTMESREF,1,2) <= H.MES ) )');

    SQL.Add('GROUP BY ');
    SQL.Add('  H.MES, C.COTVALOR ');
    SQL.Add('ORDER BY ');
    SQL.Add('  H.MES DESC');
  End;

  { Lê o separador decimal que está indicado no Registro }
  Registro:=Tregistry.create;
  Registro.RootKey:=HKEY_CURRENT_USER;
  Registro.OpenKey('Control Panel\International',True);
  If Registro.ValueExists('sDecimal') then begin
    Aux := Registro.ReadString('sDecimal');
    Separador := Aux[1];
    Registro.CloseKey;
  End Else
    Separador:=',';

  { Libera Objeto de Leitura do Registro }
  Registro := NIL;
  Registro.Free;

// Inicia a variavel qua guardara a proxima regra / passo a ser debugada no
// caso de DEBUG de Regra
  wProxRegra := 0;
  wProxPasso := 0;
  ProxRegraExec := 0;
  
  FlgGravaCalculo := True;
  FlgReloadRule   := False;
  FExibeMensagens := True;

end;

{******************************************************************************}
{ Destrutor da Classe TRegra                                                   }
{   Fecha e Libera Componentes, Consultas e Variaveis                          }
{------------------------------------------------------------------------------}
Destructor  TRegra.Destroy;
begin
  { Fecha e Libera Querys }
  QueryRegra.Close;
  QueryRegra.free;
  DsRegra.Free;

  QueryRegraAux.Close;
  QueryRegraAux.free;

  QryIndice.Close;
  QryIndice.Free;

  QryTabuaBio.Close;
  QryTabuaBio.Free;

  QryPro.Close;
  QryPro.Free;

  Qry.Close;
  Qry.Free;

  QryOutraRegra.Close;
  QryOutraRegra.Free;

  QryAlg.Close;
  QryAlg.Free;

  { Componente de Planilha }
  FreeAndNil( Formula1 );
  //FreeAndNil( aHistAlgor );
  ZeroMemory(@aHistAlgor, sizeof(aHistAlgor));

  { Libera Pilhas }
  while not vaziaRep(TRep) do
     DesempilharRep(TRep);

  while not vaziaInd(TInd) do
     DesempilharInd(TInd);

  { Executa Heranca }
  Inherited Destroy;

end;

function TRegra.MsgDlgRegra(const Msg: String; const Caption: String; AType: TMsgDlgType;
                Buttons: TMsgDlgButtons; HelpCtx: Longint): TModalResult;
begin
  {Chama MsgDlgPos com a posição default.}
  { Testa se mostra mensagem ou não }
  If FExibeMensagens = True Then Begin
    Result := MsgDlg(Msg, Caption, AType, Buttons, HelpCtx);
  End; { If FExibeMensagens = True Then Begin }
end;

procedure TRegra.SetRuleName(const Value: String);
begin
  FRuleName   := Value;
  FRuleNumber := Value;
end;

procedure TRegra.SetRuleNumber(const Value: String);
begin
  FRuleNumber := Value;
  FRuleName   := Value;
end;

{******************************************************************************}
{ Este método executa toda a regra cujo "ID" esta na propriedade RuleName.     }
{------------------------------------------------------------------------------}
procedure TRegra.Execute;
begin

  // andre ini
  passoubiometrica := false;
  passouhipotese   := false;
  // andre fim

  FlgPasso    := False;
  SairDaRegra := False;
  ExecutaRegra;

  FinalizaRegra;

end;

procedure TRegra.FinalizaRegra;
begin
  { Fecha Querys }
  QryPro.Close;
  QueryRegra.Close;
  QueryRegraAux.Close;
  Qry.Close;

  { Acerta Resultado }
  FResult := TrocaVirgulaponto(Fresult);

  { Retona Ambiente }
  DecimalSeparator := Separador;
  ShortDateFormat  := FormatoData;

  Application.OnException := ProcErro;
  fTabBiometrica := '';
end;

//******************************************************************************
// Executa Rergra Passo a Passo (DEBUG)
procedure TRegra.PassoAPasso;
begin
// andre
  passoubiometrica := False;
  passouhipotese   := False;
// andrefim
  wProxRegra  := 0;
  wProxPasso  := 0;
  FlgPasso    := True;
  SairDaRegra := False;
  ExecutaRegra;
  FinalizaRegra;
end;

//******************************************************************************
// Executa Regra toda
Procedure TRegra.ExecutaRegra;
Var
  flgLoop, bFim    : Boolean;
  vCamp : Array [1..700] of TCmps;
  vLoop, I, J, Tamanho, wInt, wInt1 : LongInt;
  sSQL : String;
Begin
  xLocal := True;
  If RegraAtual = 0 then
    RegraAtual := StrToInt(FruleName)
  Else
    if RegraAtual <> StrtoInt(FRuleName) then begin
      RegraAtual := StrtoInt(FRuleName);
    end;

  { Inicia variaveis  }
  ErroCampo := False;
  FResult   := '';
  FError    := False;
  TemQuery  := False;

  { Troca o Tratamento de Excecao }
  ProcErro:=application.OnException;   { guarda o endereço da procedure de erros da aplicaçao }
  Application.OnException:=TrataErros; { modifica a procedure de erros da aplicacao           }

  { Guada formato de Data }
  FormatoData := ShortDateFormat;
  { Troca formatos de ambiente }
  DecimalSeparator:='.';
  ShortDateFormat := 'DD/MM/YYYY';

  { Cria Objetos Locais }
  TabelaBiometrica := TwwTable.Create(Self);
  TabelaBiometrica.Tablename := 'VALTABBIO';
  TabelaBiometrica.CachedUpdates := true;
  TabelaBiometrica.filtered:=true;
  TabelaBiometrica.FilterOptions:=[focaseinsensitive];

  TabelaCampoBio := TwwTable.Create(Self);
  TabelaCampoBio.Tablename     := 'CAMPOTABBIO';
  TabelaCampoBio.CachedUpdates := True;
  TabelaCampoBio.Filtered      := True;
  TabelaCampoBio.FilterOptions := [focaseinsensitive];

  TabelaGrHipotese := TwwTable.Create(Self);
  TabelaGrHipotese.DatabaseName  := FDatabaseName;
  TabelaGrHipotese.Tablename    := 'HIPOTESES';
  TabelaGrHipotese.CachedUpdates:= True;
  TabelaGrHipotese.Filtered     := True;
  TabelaGrHipotese.FilterOptions:=[focaseinsensitive];

  { Inicia a planilha de cálculos }
  Formula1.MaxCol := 2;
  Formula1.MaxRow := 256;
  Formula1.HeapMin;

  CriarPilha(T);

  { Inicia variaveis  }
  Vet := 0;
  flagcampo    := 0;
  uposindice   := 0;
  indiceatual  := '';
  IRegraMaster := StrToInt(FruleName);

  { Trata Memoria de calculo }
  If IdCalculo <> 0 Then Begin
    With QueryRegraAux Do Begin
      Close;
      SQL.clear;
      SQL.add ('DELETE FROM DETCALCULO WHERE IDCALCULO='+
               IntToStr(IdCalculo)+' AND IDREGRA = '+fRuleName);
      Execsql;
      Close;
      SQL.Clear;
      SQL.Add ('DELETE FROM CALCULOBENEF WHERE IDCALCULO='+
               IntToStr(IdCalculo)+' AND IDREGRA = '+fRuleName);
      ExecSQL;
      //Close;
      //SQL.clear;
      //SQL.add ('DELETE FROM CALCULO WHERE IDCALCULO='+
      //         IntToStr(IdCalculo)+' AND IDREGRA = '+fRuleName);
      //Execsql;
    End;
  End;

  Flg100:=False;

{------------------------------------------------------------------------------}
{ Carrega Algoritmos da Regra que será executada                               }
{------------------------------------------------------------------------------}
  iTotRegs := CarregaAlgoritmos(FRuleName);

  { Caso não existem passos na regra sair fora }
  If iTotRegs <= 0 Then Begin
     MsgDlgRegra('Esta Regra não possui passos', 'Regra - Atenção', mtError, [mbOk],0);
     Exit;
  end;

  { Caso Regra possua mais de 400 passos sai } //SOL 183347 Kintana 1712386
  If Flg100 = True Then Begin
    { Fecha e Libera Componentes }
    TabelaGrHipotese.Close;
    TabelaGrHipotese.Free;
    TabelaCampoBio.Close;
    TabelaCampoBio.Free;
    TabelaBiometrica.Close;
    TabelaBiometrica.Free;
    Exit;
  End;

  sRegraAnt := FRuleName;
  if (aAlgorTipo[iTotRegs] <> '9') and (aAlgorTipo[iTotRegs] <> '12') then begin
     MsgDlgRegra('Regra Incompleta !. Complete a regra com um passo do tipo: "Parar execução da regra"',
            'Regra - Atenção',mterror,[mbOk],0);
     Ferror:=true;
     exit;
  end;

  { Caso query de entrada não tenha sido passada pelo usuario utiliza a do     }
  { Tipo de Regra                                                              }
  If fQueryIn = Nil Then Begin
    fQueryIn := TwwQuery.Create(Self);
    fQueryIn.DatabaseName := fDataBaseName;
    fQueryIn.SQL.Clear;
    fQueryIn.SQL.Add('SELECT T.SQLREGRA FROM TIPOREGRA T, REGRA R WHERE R.IDREGRA = '+
                     fRuleName+' AND R.IDTIPOREGRA = T.IDTIPOREGRA ');
    fQueryIn.Open;
    sSQL := fQueryIn.FieldByName('SQLREGRA').AsString;
    fQueryIn.SQL.Clear;
    fQueryIn.SQL.Add(sSQL);
    fQueryIn.Open;
  End;

  { Caso Query da Regra Retorne Vazio mostra mensagem e sai com Erro }
  If FQueryIn.IsEmpty then begin
    MsgDlgRegra('A consulta de entrada do regra está retornando vazio.',
           'Regra - Atenção',mterror,[mbOk],0);
    Ferror:=True;
    { Fecha e Libera Componentes }
    TabelaGrHipotese.Close;
    TabelaGrHipotese.Free;
    TabelaCampoBio.Close;
    TabelaCampoBio.Free;
    TabelaBiometrica.Close;
    TabelaBiometrica.Free;
    Exit;
  end;

  FQueryIn.First;
  iAlgorAtual := 1;

  {  Testa se é a primeira execucao }
  If sPrimExec = '' then begin
    { Inica Vetores }
    For  wInt := 1 to 700 Do Begin 
      For  wInt1 := 1 to 2 Do Begin
        aTabVariaveis[wInt, wInt1] := '';
      End;
    End;
    For  wInt := 1 to 400 Do Begin
      dValParamFormula[wInt] := 0;
    End;

    iTotVariaveis := 0;
    aTabVariaveis[1,1] := 'HOJE';                  // Cria variável hoje
    aTabVariaveis[1,2] := DateToStr(Date);
    iTotVariaveis := iTotVariaveis + 1;
    sPrimExec     := 'X';
  End;
  iContRegQryIn := 0;

  { Caso Propriedade DATAREF esteja preenchida, }
  { inclui na lista de variaveis novamente      }
  If FDataRef <> '' Then Begin
    SetDataRef(FDataRef);
  End;

  {}
  If FDistinctFields <> '' Then Begin
    Tamanho := Length(FDistinctFields);
    j := 1;
    For i := 1 to Tamanho do begin
      If (Copy(FDistinctFields,i,1) <> ',') and (Copy(FDistinctFields,i,1) <> ';') Then
        vCamp[j].Campo := Trim(vCamp[j].Campo) + Copy(FDistinctFields,i,1)
      Else
        Inc(j);
    End;
  End;

  {----------------------------------------------------------------------------}
  { Loop dos registros na Query de Entrada                                     }
  {----------------------------------------------------------------------------}
  While (not FQueryIn.EOF) and (iAlgorAtual <> 0) do begin
    vLoop := 0;
    flgLoop := False;

    { Verifica se existe algum campo no DistinctField }
    If (FDistinctFields <> '') and Assigned(FOnGetResultDistinct) Then begin
      for i := 1 to 700 do begin
        if vCamp[i].Campo <> '' Then begin
          try
            vCamp[i].Valor := FQueryIn.FieldbyName(vCamp[i].Campo).AsString
          except
                MsgDlgRegra('Campo '+vCamp[i].Campo+' Necessário no Sql de entrada.',
                       'Regra - Erro',mtError,[mbOk,mbHelp],0);
            fQueryIn.Last;
            Exit;
          end;
        end else
          Break;
      end;

      FQueryIn.Next;

      If Not FQueryIn.Eof Then Begin
        Achou := True;
        For i := 1 To 700 Do Begin
          If vCamp[i].Campo <> '' Then Begin
            Try
              FQueryIn.FieldbyName(vCamp[i].Campo).AsString;
            Except
                MsgDlgRegra('Campo '+vCamp[i].Campo+' Necessário no Sql de entrada.',
                       'Regra - Erro',mtError,[mbOk,mbHelp],0);
              fQueryIn.Last;
              Exit;
            End;
            If vCamp[i].Valor <> FQueryIn.FieldbyName(vCamp[i].Campo).AsString Then Begin
              Achou := False;
              Break;
            End;
          End Else Begin
            Break;
          End; { Else If }
        End; { For }
        FQueryIn.Prior;
      End; { Not FQueryIn.Eof }


    End; { (FDistinctFields <> '') }

    If ErroCampo Then Begin
      FError:= True;
      bFim  := True;
      If FlgPasso Then
        ExibePasso;
      iAlgorAtual := 99;
      fQueryIn.Last;
    End;

    Inc(iContRegQryIn);

    iCtrlAlgor := 1; //Fanuel Junior SOL144511 Kintana952230
    iUltAlgor  := 1; //Fanuel Junior SOL144511 Kintana952230

    { Alimenta variaveis com a HOJE (Data Atual) }
    aTabVariaveis[1,1] := 'HOJE';
    aTabVariaveis[1,2] := DatetoStr(Date);
    bFim := False;
    Operacao := opProsseguir;  //Fanuel Junior SOL144511 Kintana952230
    iVoltouRegra := 0;         //Fanuel Junior SOL144511 Kintana952230
    {--------------------------------------------------------------------------}
    { Inicia o Loop dos Passos da Regra, Executa todos os algoritmos da Regra  }
    {--------------------------------------------------------------------------}
    While (iAlgorAtual >= 1) And ( Not bFim ) Do Begin

    //Fanuel Junior SOL144511 Kintana952230 - Inicio
    Case Operacao of

    opVoltar: begin

           //Se estiver voltando de uma regra anterior
           if ((aHistAlgor[iCtrlAlgor - 1,1]) <> (aHistAlgor[iCtrlAlgor,1]) ) then begin
                   iAlgorAtual := StrToInt(aHistAlgor[iCtrlAlgor - 2,2]);
                   iVoltouRegra := 0;
                   Operacao := opNada;
                   Dec(iCtrlAlgor);
           end
           else begin

               If (aAlgorTipo[iCtrlAlgor - 1] = '1') or (aAlgorTipo[iCtrlAlgor - 1] = '2') or
                (aAlgorTipo[iCtrlAlgor - 1] = '11') then begin
                      aTabVariaveis[iTotVariaveis,1] := '';
                      aTabVariaveis[iTotVariaveis,2] := '';
                      Dec(iTotVariaveis);
               end;
                Dec(iCtrlAlgor);
                iAlgorAtual := StrToInt(aHistAlgor[iCtrlAlgor - 1,2]);
                Operacao := opNada;
            end;                                                               
          end;//Fim Voltar

    opProsseguir, opNada :  begin

      if Operacao = opProsseguir then
         Inc(iCtrlAlgor);

      If iCtrlAlgor > iUltAlgor then
      begin
         aHistAlgor[iUltAlgor,1] := frulename;
         aHistAlgor[iUltAlgor,2] := IntToStr(iAlgorAtual);
         Inc(iUltAlgor);
     end;

     //Fanuel Junior SOL144511

      If (aAlgorTipo[iAlgorAtual] = '1') or (aAlgorTipo[iAlgorAtual] = '2') or
         (aAlgorTipo[iAlgorAtual] = '11')
      Then Begin
        FazAtribuicao(iAlgorAtual); // Atribuicao
        If flgpasso then
          ExibePasso;
        Inc(iAlgorAtual);
      End Else Begin
        If (aAlgorTipo[iAlgorAtual] >= '3') and (aAlgorTipo[iAlgorAtual] <= '8')
        Then Begin
          PassoAux    := ialgoratual; // Correlação
          iAlgorAtual := FazCorrelacao(iAlgorAtual);
          Passo       := iAlgorAtual;
          iAlgorAtual := PassoAux;
          If flgpasso Then
            ExibePasso;
          ialgoratual:=passo;
        End Else Begin
          If aAlgorTipo[iAlgorAtual] = '14' Then Begin // Executar outra regra
            Fresult:=ExecutaOutraRegraNova('E');
            GrpQry:=-1;

            //If (flgpasso) Then
            //   ExibePasso;
            //Fanuel Junior SOL144511

            If (flgpasso) and (iVoltouRegra = 0) Then begin
               ExibePasso;
            end
            else
               iVoltouRegra := 0;
               inc(iAlgorAtual); //Fanuel Junior SOL 156987 Kintana 1246224

          End Else Begin
            If aAlgorTipo[iAlgorAtual] = '10' Then Begin
              FazInput(iAlgorAtual);  // Chama tela de Input
              If flgpasso Then
                ExibePasso;
              Inc(iAlgorAtual);
            End Else Begin
              If aAlgorTipo[iAlgorAtual] = '12' Then Begin  // Finaliza a Regra
                If aAlgorValor[ialgoratual] = 'ERRO' Then
                  FError := True;
                bfim := True;
                If flgpasso Then
                  ExibePasso;
                iAlgorAtual := 99;
                fQueryin.Last;

              End Else Begin
                If aAlgorTipo[iAlgorAtual] = '13' Then Begin
                  FPassonumber        := aAlgorRegra[iAlgorAtual]; // SOL 136806 Kintana 820407
                  ExibeMsg(aAlgorValor[iAlgorAtual],aAlgorcampo[iAlgorAtual]);  // Faz Atribuição do número recebido
                  If FlgPasso Then
                    ExibePasso;  // Exibe mensagem
                  inc(iAlgorAtual);
                End Else Begin
                  If aAlgorTipo[iAlgorAtual] = '15' Then Begin
                    If flgpasso Then
                      ExibePasso; // Va para
                    iAlgoratual:=pegaidalgor(strtoint(aAlgorsubseqtrue[iAlgoratual]));
                  End Else Begin
                    If aAlgorTipo[iAlgorAtual] = '16' Then Begin
                      GravaCalculo; // Grava na memoria de calculo
                      If flgpasso Then
                        ExibePasso;
                      inc(ialgorAtual);
                    End Else Begin
                      bFim := True;
                      If aAlgorValor[ialgoratual] = 'ERRO' Then
                        FError:=true;
                    End;
                  End;
                End;
              End;
            End;
          End;
        End;
      End;

            //Fanuel Junior SOL144511 Kintana952230 - Fim

     End; //Case - Prosseguir
    End; //Case

      If SairDaRegra Then Begin
        bfim:=true;
      End;

      If Not FlgLoop Then
        inc(vLoop);

      If (vLoop > 100000) And (Not FlgLoop) Then Begin
        FlgLoop := True;

          If MsgDlgRegra('Provavelmente esta Regra está em Loop, deseja cancelar execução ?',
                    'Regra - Atenção',mtConfirmation,[mbyes,mbno,mbHelp],0)=mryes
          Then
            bFim := True;
      End;

    End; // Fim do Loop dos Passos

    DecimalSeparator := Separador;

    Application.OnException:= ProcErro;
    If Assigned(FOnGetResult) Then
      FOnGetResult(Self);           // Dispara o Evento OnGetResult

    If (Assigned(FOnGetResultDistinct)) And Not (Achou) Then
      FOnGetResultDistinct(self);   // Dispara o Evento OnGetResultDistinct

    ProcErro := Application.OnException;
    Application.OnException:=TrataErros;

    DecimalSeparator:='.';

    FQueryIn.Next;
    iAlgorAtual := 1;
  End; // Fim do Loop dos registros

  QueryRegra.Close;
  QueryRegraAux.Close;

  Tabuabio:= '';
  Fresult := TrocaVirgulaPonto(Fresult);
  Decimalseparator := Separador;

  Application.OnException :=ProcErro;

  IidCalculo := 0;

  // Andre Inicio
  TabelaGrHipotese.Close;
  TabelaGrHipotese.Free;
  TabelaCampoBio.Close;
  TabelaCampoBio.Free;
  TabelaBiometrica.Close;
  TabelaBiometrica.Free;
  // Andre Fim

End;

// Coloca uma String na propriedade Result de TRegra
procedure TRegra.SetResult(Value: String);
begin
  FResult := Value;
end;


// Pega uma String da propriedade Result de TRegra
function TRegra.GetResult:string;
begin
  GetResult := FResult;
end;


//Carrega todos os algoritmos de uma regra para a memória e devolve
//a quantidade linhas lidas do banco
Function TRegra.CarregaAlgoritmos(Value: String): Integer;
begin
  Result :=CarregaAlgNova(Value);
  Exit;                           
end;

//******************************************************************************
// Verifica se a regra sendo executada já foi executada alguma vez, caso tenha
// sido, retorna a posicao (Indice) do vetor em que ela foi carregada,
// tambem retorna a proxima posicao vazia do vetor
Function TRegra.RegraJaExecutada(IdRegra:String):TRegPosRegra;
Var
  J:Integer;
Begin
// Inicia Valores de Retorno
  Result.ProxPosicao  :=  0;
  Result.PosicaoRegra := -1;

// Executa um Loop no Vetor para Testar se a regra existe (Max = 20)
  For J := 0 To 20 Do Begin
// Caso Posicao esteja vazia, indica que é a próximma a ser preenchida,
// guarda e sai 
    If Trim(VetRegrasMemoria[J].IdRegra) = '' Then Begin
      Result.ProxPosicao := J;
      Exit;
    End;

// Caso já exista no vetor (Já foi executada) Guara a posicao, Indice.
    If VetRegrasMemoria[J].IdRegra = IdRegra Then Begin
      Result.PosicaoRegra := J;
    End;
  End;

End;

//******************************************************************************
// Carrega os Algoritmos de uma regra para um vetor e devolve a quantidade
// linhas lidas do banco.
// Augusto 06/11/00
// Obs.:
Function TRegra.CarregaAlgNova(Value: String): Integer;
Var
  I: Integer;
  RegLocal:TRegPosRegra;
Begin

//------------------------------------------------------------------------------
// Verifica  se a Regra já foi executada, caso já tenha sido, carrega os
// algoritmos da memória
  RegLocal:=RegraJaExecutada(Value);  // -1 não Achou

// Regra ainda Já executada
  If (RegLocal.PosicaoRegra <> -1) And (FlgReloadRule = False) Then Begin
    I:=1;

(* Retirado por Problema de Memoria
// Limpa conteudo dos vetores de algoritmo
    FillChar(aAlgorRegra,sizeof(aAlgorRegra),#0);
    FillChar(aAlgorTipo, sizeof(aAlgorTipo), #0);
*)

// Varre vetor de Algoritmos das regras executadas e preenche vetor dos alguritmos que
// serão executados
    While Trim(VetRegrasMemoria[RegLocal.PosicaoRegra].aAlgorRegra[I]) <> '' Do Begin
// Preenche o Vetor com os algoritmos da Regra a ser Executada
      aAlgorRegra[I]      := VetRegrasMemoria[RegLocal.PosicaoRegra].aAlgorRegra[I];
      aAlgorCampo[I]      := VetRegrasMemoria[RegLocal.PosicaoRegra].aAlgorCampo[I];
      aAlgorCampo2[I]     := VetRegrasMemoria[RegLocal.PosicaoRegra].aAlgorCampo2[I];
      aAlgorFormula1[I]   := VetRegrasMemoria[RegLocal.PosicaoRegra].aAlgorFormula1[I];
      aAlgorExpressao[I]  := VetRegrasMemoria[RegLocal.PosicaoRegra].aAlgorExpressao[I];
      aAlgorCorrelacao[I] := VetRegrasMemoria[RegLocal.PosicaoRegra].aAlgorCorrelacao[I];
      aAlgorFormula2[I]   := VetRegrasMemoria[RegLocal.PosicaoRegra].aAlgorFormula2[I];
      aAlgorValor[I]      := VetRegrasMemoria[RegLocal.PosicaoRegra].aAlgorValor[I];
      aAlgorSubseqTrue[I] := VetRegrasMemoria[RegLocal.PosicaoRegra].aAlgorSubseqTrue[I];
      aAlgorSubseqFalse[I]:= VetRegrasMemoria[RegLocal.PosicaoRegra].aAlgorSubseqFalse[I];
      aAlgorTipo[I]       := VetRegrasMemoria[RegLocal.PosicaoRegra].aAlgorTipo[I];
      aAlgortipocampo1[I] := VetRegrasMemoria[RegLocal.PosicaoRegra].aAlgortipocampo1[I];
      aAlgortipocampo2[I] := VetRegrasMemoria[RegLocal.PosicaoRegra].aAlgortipocampo2[I];
      aAlgorFormatacao[I] := VetRegrasMemoria[RegLocal.PosicaoRegra].aAlgorFormatacao[I];

      aAlgornomecampo1[I] :=VetRegrasMemoria[RegLocal.PosicaoRegra].aAlgornomecampo1[I];

      aAlgornomecampo2[I] :=VetRegrasMemoria[RegLocal.PosicaoRegra].aAlgornomecampo2[I];
      Inc(I);
    End;
    Result :=(I-1);
    Exit;
  End;

//------------------------------------------------------------------------------
// Busca os Algoritimos da Regra no Banco de Dados e Inclui no Vetor de
// Regras Executadas
  With QryAlg Do Begin
    Close;
    SQL.Clear;
    SQL.add('SELECT DISTINCT '      +
            '  A.IDALGORITMODAREG,' +
            '  A.IDCAMPO,'          +
            '  A.IDCAMPO2,'         +
            '  A.FORMULA1,        ' +
            '  F.EXPRESSAOREAL,'    +
            '  A.CORRELACAO,'       +
            '  A.FORMULA2,'         +
            '  A.VALOR,'            +
            '  A.ALGORSUBSEQTRUE,'  +
            '  A.ALGORSUBSEQFALSE,' +
            '  A.TIPOALGORITMO, '   +
            '  A.TIPOCAMPO1,     '  +
            '  A.TIPOCAMPO2,    '   +
            '  A.FORMATACAO,    '   +
            '  C.NOMEDOCAMPO AS NOMECAMPO1, '      +
            '  C2.NOMEDOCAMPO AS NOMECAMPO2 ,'     +
            '  C.APELIDO AS APELIDO1, '            +
            '  C2.APELIDO AS APELIDO2,'            +
            '  R.IDTIPOREGRA          '            +
            'FROM '+
            '  ALGREGRA A, CMPBD C, CMPBD C2, FORMULA F, REGRA R '+
            'WHERE '+
            '  A.IDREGRA = '+ VALUE +'       AND '+
            '  A.IDREGRA = R.IDREGRA         AND '+
            '  A.IDCAMPO=C.IDCAMPO(+) AND A.IDCAMPO2=C2.IDCAMPO(+) '+
            '  AND A.FORMULA1=F.IDFORMULA(+) ORDER BY IDALGORITMODAREG');
// Abre a Consulta
    Open;

// Caso consulta traga mais de 400 registros, não permite.
//inicio - SOL 183347 Kintana 1712386
    If RecordCount > 400 then begin
       MsgDlgRegra('Regra com mais de 400 passos !',
              'Regra - Atenção',mterror,[mbOk],0);
       Flg100:=True;
       Result:=0;
       Exit;
    end;
//fim - SOL 183347 Kintana 1712386
// No Caso de Regra já executada, sobrepõe a antiga
   If (RegLocal.PosicaoRegra <> -1) And (FlgReloadRule = True) Then Begin
     RegLocal.ProxPosicao := RegLocal.PosicaoRegra;
   End;

(* Retirado por Prblema de Memoria
// Limpa conteudo dos vetores de algoritmo
//    FillChar(aAlgorRegra,sizeof(aAlgorRegra),#0);
//    FillChar(aAlgorTipo, sizeof(aAlgorTipo), #0);
*)

// Inicia Indice do Vetor
    I:=0;
// Varre os Registros da Query alimentando vetor da Regra
// que será executada
    While Not Eof do begin
// Incrementa Indice do Vetor
        I := I + 1;
// Preenche o Vetor com os algoritmos da Regra a ser Executada
        FPassonumber        := FieldByName('IDALGORITMODAREG').AsString; // SOL 136806 Kintana 820407
        aAlgorRegra[I]      := FieldByName('IDALGORITMODAREG').AsString;
        aAlgorCampo[I]      := FieldByName('IDCAMPO').AsString;
        aAlgorCampo2[I]     := FieldByName('IDCAMPO2').AsString;
        aAlgorFormula1[I]   := FieldByName('FORMULA1').AsString;

        If (Pos('BUSCADETCALCULO',FieldbyName('EXPRESSAOREAL').AsString) > 0) or // SOL 136384/9641 Kintana 1664442
             (Pos('DUPLICADETCALCULOTITULAR',FieldbyName('EXPRESSAOREAL').AsString) > 0) or // SOL 136384/9641 Kintana 1664442
             (Pos('EXCLUIDETCALCULO',FieldbyName('EXPRESSAOREAL').AsString) > 0) or // SOL 136384/10342 Kintana 1712175
             (Pos('FUNCAOCONFIANCA',FieldbyName('EXPRESSAOREAL').AsString) > 0) Then // SOL 136384/9641 Kintana 1664442
          //If Pos('BUSCADETCALCULO',Cds.FieldbyName('EXPRESSAOFORMULA').AsString) = 0 Then
            aAlgorExpressao[I] := Trim(FieldbyName('EXPRESSAOREAL').AsString)
         Else
            aAlgorExpressao[I] := Trim(TiraTodosBrancos(FieldbyName('EXPRESSAOREAL').AsString)); // SOL 184600 Kintana 1729037 - Otacilio

        {If (Pos('BUSCADETCALCULO',QryAlg.FieldbyName('EXPRESSAOREAL').AsString) = 0) and // SOL 136384/9641 Kintana 1664442
           (Pos('DUPLICADETCALCULOTITULAR',QryAlg.FieldbyName('EXPRESSAOREAL').AsString) = 0) and // SOL 136384/9641 Kintana 1664442
           (Pos('FUNCAOCONFIANCA',QryAlg.FieldbyName('EXPRESSAOREAL').AsString) = 0) Then // SOL 136384/9641 Kintana 1664442
          aAlgorExpressao[I]  := trim( TiraTodosBrancos(FieldByName('EXPRESSAOREAL').AsString) )
        Else
          aAlgorExpressao[I]  := trim( FieldByName('EXPRESSAOREAL').AsString );
        }
        aAlgorCorrelacao[I] := Trim( FieldByName('CORRELACAO').AsString );
        aAlgorFormula2[I]   := Trim( FieldByName('FORMULA2').AsString );
        aAlgorValor[I]      := Trim( FieldByName('VALOR').AsString );
        aAlgorSubseqTrue[I] := Trim( FieldByName('ALGORSUBSEQTRUE').AsString );
        aAlgorSubseqFalse[I]:= Trim( FieldByName('ALGORSUBSEQFALSE').AsString );
        aAlgorTipo[I]       := Trim( FieldByName('TIPOALGORITMO').AsString );
        aAlgortipocampo1[I] := Trim( FieldByName('TIPOCAMPO1').AsString );
        aAlgortipocampo2[I] := Trim( FieldByName('TIPOCAMPO2').AsString );
        aAlgorFormatacao[I] := Trim( FieldbyName('FORMATACAO').AsString );

        If qryalg.FieldByName('APELIDO1').AsString <> '' then
           aAlgornomecampo1[I] := Trim( FieldByName('APELIDO1').AsString )
        Else
           aAlgornomecampo1[I] := Trim( FieldByName('NOMECAMPO1').AsString  );

        If qryalg.FieldByName('APELIDO2').AsString <> '' then
           aAlgornomecampo2[I] := Trim( FieldByName('APELIDO2').AsString )
        Else
           aAlgornomecampo2[I] := Trim( FieldByName('NOMECAMPO2').AsString );

// Guarda Regra no Vetor de regras executadas
        With VetRegrasMemoria[RegLocal.ProxPosicao] Do Begin
// Identificador da Regra
          IdRegra := Value;
// Preenche o Vetor com os algoritmos da Regra a ser Executada,
// para ser guardada na memória
          aAlgorRegra[I]      := Trim( FieldByName('IDALGORITMODAREG').AsString );
          aAlgorCampo[I]      := Trim( FieldByName('IDCAMPO').AsString );
          aAlgorCampo2[I]     := Trim( FieldByName('IDCAMPO2').AsString );
          aAlgorFormula1[I]   := Trim( FieldByName('FORMULA1').AsString );

         If (Pos('BUSCADETCALCULO',FieldbyName('EXPRESSAOREAL').AsString) > 0) or // SOL 136384/9641 Kintana 1664442
             (Pos('DUPLICADETCALCULOTITULAR',FieldbyName('EXPRESSAOREAL').AsString) > 0) or // SOL 136384/9641 Kintana 1664442
             (Pos('EXCLUIDETCALCULO',FieldbyName('EXPRESSAOREAL').AsString) > 0) or // SOL 136384/10342 Kintana 1712175
             (Pos('FUNCAOCONFIANCA',FieldbyName('EXPRESSAOREAL').AsString) > 0) Then // SOL 136384/9641 Kintana 1664442
          //If Pos('BUSCADETCALCULO',Cds.FieldbyName('EXPRESSAOFORMULA').AsString) = 0 Then
            aAlgorExpressao[I] := Trim(FieldbyName('EXPRESSAOREAL').AsString)
         Else
            aAlgorExpressao[I] := Trim(TiraTodosBrancos(FieldbyName('EXPRESSAOREAL').AsString)); // SOL 184600 Kintana 1729037 - Otacilio

        {If (Pos('BUSCADETCALCULO',QryAlg.FieldbyName('EXPRESSAOREAL').AsString) = 0) and // SOL 136384/9641 Kintana 1664442
           (Pos('DUPLICADETCALCULOTITULAR',QryAlg.FieldbyName('EXPRESSAOREAL').AsString) = 0) and // SOL 136384/9641 Kintana 1664442
           (Pos('FUNCAOCONFIANCA',QryAlg.FieldbyName('EXPRESSAOREAL').AsString) = 0) Then // SOL 136384/9641 Kintana 1664442
          aAlgorExpressao[I]  := trim( TiraTodosBrancos(FieldByName('EXPRESSAOREAL').AsString) )
        Else
          aAlgorExpressao[I]  := trim( FieldByName('EXPRESSAOREAL').AsString );   }

          aAlgorCorrelacao[I] := Trim( FieldByName('CORRELACAO').AsString );
          aAlgorFormula2[I]   := Trim( FieldByName('FORMULA2').AsString );
          aAlgorValor[I]      := Trim( FieldByName('VALOR').AsString );
          aAlgorSubseqTrue[I] := Trim( FieldByName('ALGORSUBSEQTRUE').AsString );
          aAlgorSubseqFalse[I]:= Trim( FieldByName('ALGORSUBSEQFALSE').AsString );
          aAlgorTipo[I]       := Trim( FieldByName('TIPOALGORITMO').AsString );
          aAlgortipocampo1[I] := Trim( FieldByName('TIPOCAMPO1').AsString );
          aAlgortipocampo2[I] := Trim( FieldByName('TIPOCAMPO2').AsString );
          aAlgorFormatacao[I] := Trim( FieldbyName('FORMATACAO').AsString );

          If qryalg.FieldByName('APELIDO1').AsString <> '' then
             aAlgornomecampo1[I] := Trim( FieldByName('APELIDO1').AsString )
          Else
             aAlgornomecampo1[I] := Trim( FieldByName('NOMECAMPO1').AsString );

          If qryalg.FieldByName('APELIDO2').AsString <> '' then
             aAlgornomecampo2[I] :=Trim( FieldByName('APELIDO2').AsString )
          Else
             aAlgornomecampo2[I] :=Trim( FieldByName('NOMECAMPO2').AsString );
        End;

// Proximo Registro
        Next;

    End;// While

    Close;

  End;// With

// Alimenta Resultado
  Result :=I;
End;
//

// Lê os passos da pilha e passa para o vetor corrente
Function TRegra.CarregaAlgPilha: Integer;
//Var
//  i: Integer;
begin
end;


{******************************************************************************}
{ Rotina de execução da correlação do algoritimo (Value). Retorna o            }
{ numero da regra para a qual o fluxo foi desviado                             }
{------------------------------------------------------------------------------}
function TRegra.FazCorrelacao(Value: Integer): Integer;
var
  sResult1, sResult1Aux,  sResult2, sFormula, sCorrelacao : String;      //Correlação
  dResult1, dResult2, dResult : Double;      //Resultado da execução da fórmula
  bResCorrelacao, EhCompString : Boolean;
  iTipo : Integer;
begin
  EhCompString := False;
  sCorrelacao  := aAlgorCorrelacao[Value];
  FlagCampo    := 1;

  // iTipo := VerifValor(aAlgorCampo[iAlgorAtual]);
  iTipo := VerifValor(aAlgortipocampo1[iAlgorAtual]);
  Case iTipo of
       -1 : begin //String
                  sResult1 := PegaValor(aAlgorCampo[iAlgorAtual]);
            end;
       0..1 : begin //Variavel ou Campo
                 sResult1Aux := aAlgorCampo[iAlgorAtual];
                 sResult1 := PegaValor(aAlgorCampo[iAlgorAtual]);
                 if (UpperCase(sResult1) = UpperCase(sResult1Aux))  then
                    sResult1 := '';
                 if (iTipo = 1) and (sResult1 = '') then
                    sResult1 := BuscaBD(aAlgorCampo[iAlgorAtual]);
                    if (UpperCase(sResult1) = UpperCase(sResult1Aux))  then
                       sResult1 := '';
              end;
  end;

  FlagCampo := 0;
  if not EhNumero(sResult1) then begin
     EhCompString := False;
     if EhData( sResult1 ) then
        dResult:=strtodate(sResult1)
     else
          EhCompString := True
  end else
      dResult := StrToFloat(sResult1);


  if not FError then begin  //Se não deu erro na formula1 vou fazer formula2
     dResult1 := dResult;
     // Vamos ver se é uma comparação com string
     sFormula := aAlgorFormula2[Value];
     if sFormula = '' then begin //Não tem fórmula, então está em valor
        //iTipo := VerifValor(aAlgorCampo2[Value]);
        iTipo := VerifValor(aAlgortipocampo2[Value]);
        Case iTipo of
             -1 : begin //String
                        sResult2 := PegaValor(aAlgorCampo2[Value]);
                        if sResult2 = '' then
                           sResult2 := aAlgorValor[Value];
                  end;
             0..1 : begin //Variavel ou Campo
                       sResult1Aux := aAlgorCampo2[Value];
                       sResult2 := PegaValor(aAlgorCampo2[Value]);
                       if (UpperCase(sResult2) = UpperCase(sResult1Aux)) then
                          sResult2 := '';
                       if (iTipo = 1) and (sResult2 = '') then begin
                          sResult2 := BuscaBD(aAlgorCampo2[iAlgorAtual]);
                          if (UpperCase(sResult2) = UpperCase(sResult1Aux)) then
                             sResult2 := '';
                       end;
                    end;
        end;

        if (EhNumero(sResult1)) And (EhNumero(sResult2)) then begin
            EhCompString := False;
            dResult2 := StrToFloat(sResult2);
        end else begin
            EhCompString := False;
            if sResult2 <> '' then
               if EhData(sResult2) then
                  dResult2:=strtodate(sResult2)
               else
                  EhCompString := True
            else
                EhCompString := True;
        end;
     end else begin
          //Alteração realizada abaixo por haver problemas de memória quando uma regra
          //que utiliza soma A+B (exemplo) para uma QueryIn muito grande.
          //Da forma que está funciona com uma quantidade grande de registro no queryin.
          //O backup do dia 04/05/2000 está sem esta alteração.
          if aAlgorValor[iAlgorAtual] = '' then begin
             sFormulaAux := 'ATUARIAL('+sFormulaAux+')';
             fResult := Atuarial(sFormulaAux);
             dResult2 := StrtoFloat(fResult);
          end else begin
              sResult2 := aAlgorValor[iAlgorAtual];
              dResult2 := StrToFloat(sResult2);
          end;
     end;
     if not FError then begin  //Se não deu erro na formula2 vou fazer correlação
        if EhCompString then begin
           if sCorrelacao = '=' then
              if sResult1 = sResult2 then bResCorrelacao := True
                 else bResCorrelacao := False
           else
               if sCorrelacao = '>'then
                  if sResult1 > sResult2 then bResCorrelacao := True
                     else bResCorrelacao := False
               else
                   if sCorrelacao = '<'then
                      if sResult1 < sResult2 then bResCorrelacao := True
                         else bResCorrelacao := False
                   else
                       if sCorrelacao = '<>'then
                          if sResult1 <> sResult2 then bResCorrelacao := True
                             else bResCorrelacao := False
                       else
                           if sCorrelacao = '>='then
                              if sResult1 >= sResult2 then bResCorrelacao := True
                                 else bResCorrelacao := False
                           else
                               if sCorrelacao = '<='then
                                  if sResult1 <= sResult2 then bResCorrelacao := True
                                     else bResCorrelacao := False
                                Else
                                   if sCorrelacao = 'Em' then
                                     If PesquisaLista (sResult1,sResult2) = True Then 
                                       bResCorrelacao := True
                                     Else
                                       bResCorrelacao := False;
        end else begin
            if sCorrelacao = '=' then
               if dResult1 = dResult2 then bResCorrelacao := True
                  else bResCorrelacao := False
            else
               if sCorrelacao = '>'then
                  if dResult1 > dResult2 then bResCorrelacao := True
                     else bResCorrelacao := False
               else
                  if sCorrelacao = '<'then
                     if dResult1 < dResult2 then bResCorrelacao := True
                        else bResCorrelacao := False
                  else
                     if sCorrelacao = '<>'then
                        if dResult1 <> dResult2 then bResCorrelacao := True
                            else bResCorrelacao := False
                        else
                            if sCorrelacao = '>=' then
                              if dResult1 >= dResult2 then bResCorrelacao := True
                              else bResCorrelacao := False
                            else
                                if sCorrelacao = '<=' then
                                  if dResult1 <= dResult2 then bResCorrelacao := True
                                  else bResCorrelacao := False
                                Else
                                   if sCorrelacao = 'Em' then
                                     if dResult1 <= dResult2 then bResCorrelacao := True
                                     else bResCorrelacao := False;

        end;
        if bResCorrelacao = True then begin
           if aAlgorSubseqtrue[Value] = '' then
              Result := 0  //Para execução da Regra
           else
               Result := PegaIdAlgor(StrToInt(aAlgorSubseqTrue[Value]));
        end else begin
            if aAlgorSubseqFalse[Value] = '' then
               Result := 0  //Para execução da Regra
            else
                Result := PegaIdAlgor(StrToInt(aAlgorSubseqFalse[Value]));
        end;
        if bResCorrelacao then SetResult('True')
           else SetResult('False');
     end else begin            // Deu Erro
         result:=-1;
         Ferror := True;
         SetResult('-999');
     end;
  end;
end;

{******************************************************************************}
{ Rotina de execução da Atribuição do algoritimo (Value). Retorna o            }
{ numero da regra para a qual o fluxo foi desviado                             }
{------------------------------------------------------------------------------}
Function TRegra.FazAtribuicao(Value: Integer): Integer;
var
  sIdCampo, sCampo,sEntidade : String[60];      // Código do Campo
  fdata   :double;
  iTotCmpChave,i,iInd  : Integer; // Total de campos chaves de uma tabela
  bVariavelExiste: Boolean;
  sAux          : String;
  sSqlAux       : String;
  sMens         : String;
  sTipoColuna   : String[15];
  i3         : Integer;
  aCmpChave     : Array[1..15] of String;  //Campos que são chave de procura de uma tabela
  aConteudoChave: Array[1..15] of String;  //Conteúdo dos campos chave
  sValorPonto   : String;  //Esta variável recebe Result com '.' no lugar de ','
  iPosVirgula   : Integer; //Posição da vírgula;
  s1, s2        :string;
  label 1;
begin
  decimalseparator:='.';
  if aAlgorTipo[Value] = '11' then begin
     sIdCampo := aAlgorCampo2[Value];
     flagcampo:=2;
     FResult := PegaValor(sIdCampo);
     flagcampo:=0
  end else begin
      if aAlgorFormula1[Value] = '' then begin
         sFormulaAux := '';
      end else begin 
          sFormulaAux := GetFormula(aAlgorFormula1[Value]);  //Pega fórmula da base

          if copy(sFormulaAux,1,6) = 'ARITM(' then begin
             sFormulaAux:='ATUARIAL'+copy(sFormulaAux,6,length(sformulaaux));
             Fresult:=ATUARIAL(sFormulaAux);
             goto 1;
          end;

          if copy(sFormulaAux,1,9) = 'HIPOTESE(' then begin
             FResult := GrupoHipotese(sFormulaAux);
             goto 1;
          end;

          if copy(sFormulaAux,1,7) = 'TABBIO(' then begin
             FResult := IndBiometrico(sFormulaAux);
             goto 1;
          end;

          if copy(sFormulaAux,1,7) = 'BUSCAX(' then begin
             FResult := BUSCAVALOR(sFormulaAux);
             goto 1;
          end; //Não será mais usada

          if copy(sFormulaAux,1,9) = 'CONSULTA(' then begin
             FResult := CONSULTA(copy(sFormulaAux,10,length(sFormulaAux)-10));
             goto 1;
          end;

          if copy(sFormulaAux,1,11) = 'DIAINICIAL(' then begin
             FResult := DIAINICIAL(sFormulaAux);
             goto 1;
          end;

          if copy(sFormulaAux,1,9) = 'DIAFINAL(' then begin
             FResult := DIAFINAL(sFormulaAux);
             goto 1;
          end;

          if copy(sFormulaAux,1,13) = 'DIASINICIAIS(' then begin
             FResult := DIASINICIAIS(sFormulaAux);
             goto 1;
          end;

          if copy(sFormulaAux,1,11) = 'DIASFINAIS(' then begin
             FResult := DIASFINAIS(sFormulaAux);
             goto 1;
          end;

          if copy(sFormulaAux,1,12) = 'TABGENERICA(' then begin
             FResult := TABGENERICA;
             goto 1;
          end;

          if copy(sFormulaAux,1,7) = 'INDICE(' then begin
             FResult := INDICE;
             goto 1;
          end;

          if copy(sFormulaAux,1,10) = 'BUSCAVALOR' then begin
             i3             := pos(',',sformulaaux);
             Ftabbiometrica := pegaValor(copy(sFormulaAux,12,i3-12));
             sformulaaux    :=copy(sformulaAux,1,11)+copy(sformulaAux,i3+1,length(sformulaAux));
             FResult        := BUSCAVALOR(sFormulaAux);
             goto 1;
          end;

          if copy(sFormulaAux,1,14) = 'IDADECOMPLETA(' then begin
             sformulaaux:=copy(sformulaaux,15,length(sformulaaux)-15);
             i3      := pos(',',sformulaaux);
             s1      := copy(sFormulaAux, 1,i3-1);
             sformulaaux:=copy(sformulaaux,i3+1,length(sformulaaux)-i3);
             s2      := sFormulaAux;
             FResult := IDADECOMPLETA(PegaValor(s1), PegaValor(s2));
             goto 1;
          end;

          if copy(sFormulaAux,1,8) = 'DIFMESES'  then begin
            DIFMESES;
            Goto 1;
          end;

          if copy(sFormulaAux,1,7) = 'DIFANOS'  then begin
            DIFANOS;
            Goto 1;
          end;

          if copy(sFormulaAux,1,7) = 'DIFDIAS'  then begin
            fResult := DIFDIAS(sFormulaAux);
            Goto 1;
          end;

          if copy(sFormulaAux,1,4) = 'PMT(' then begin
             FResult := pmt;
             goto 1;
          end;

          if copy(sFormulaAux,1,3) = 'PV(' then begin
             FResult := pv;
             goto 1;
          end;

          if copy(sFormulaAux,1,7) = 'REGATU(' then begin
             FResult :=inttostr(iContRegQryIn);
             goto 1;
          end;

          if copy(sFormulaAux,1,6) = 'ALINHA'  then begin
             Fresult:=ALINHAtexto(sFormulaAux);
             goto 1;
          end;

          if copy(sFormulaAux,1,7) = 'CONCAT(' then begin
             FResult := CONCAT(SFORMULAAUX);
             goto 1;
          end;

          if copy(sFormulaAux,1,11) = 'CAMPOSDESC(' then begin
             FResult := CAMPOSDESC(SFORMULAAUX);
             goto 1;
          end;

          if copy(sFormulaAux,1,6) = 'NIVEL('  then begin
             fResult:=Nivel(sFormulaAux);
             goto 1;
          end;

          if copy(sFormulaAux,1,3) = 'FV(' then begin
             FResult := fv;
             goto 1;
          end;

          if copy(sFormulaAux,1,5) = 'NPMT(' then begin
             FResult := npmt;
             goto 1;
          end;

          if copy(sFormulaAux,1,5) = 'RATE(' then begin
             FResult := rate;
             goto 1;
          end;

          if copy(sFormulaAux,1,8) = 'TOTREGS(' then begin
             FResult := IntToStr(TotRegs);
             goto 1;
          end;

          if copy(sFormulaAux,1,8) = 'EXTRAIR(' then begin
             FResult := EXTRAIR;
             goto 1;
          end;

          if copy(sFormulaAux,1,9) = 'PARADATA(' then begin
             FResult := PARADATA(sFormulaAux);
             goto 1;
          end;

          if copy(sFormulaAux,1,10) = 'TRAZVALOR(' then begin
             FResult := TRAZVALOR(sFormulaAux);
             goto 1;
          end;

          if copy(sFormulaAux,1,4) = 'PR2(' then begin
             FResult := PR2(sFormulaAux);
             goto 1;
          end;

          //BRUNO AZEVEDO SOL 147630-6881 KINTANA 1466979
          if copy(sFormulaAux,1,12) = 'RUBRINDIV13(' then begin
             FResult := RUBRINDIV13(sFormulaAux);
             goto 1;
          end;

          if copy(sFormulaAux,1,10) = 'RUBRINDIV(' then begin
             FResult := RUBRINDIV(sFormulaAux);
             goto 1;
          end;

          if Copy(sFormulaAux,1,10) = 'VLRRUBMES(' then begin
             FResult := VLRRUBMES(sFormulaAux);
             goto 1;
          end;

          if Copy(sFormulaAux,1,11) = 'NUMOCORRUB(' then begin
             FResult := NUMOCORRUB(sFormulaAux);
             goto 1;
          end;

          if Copy(sFormulaAux,1,15) = 'NUMOCORCONTRIB(' then begin
             FResult := NUMOCORCONTRIB(sFormulaAux);
             goto 1;
          end;

          if Copy(sFormulaAux,1,13) = 'VERCONCEDIDO(' then begin
             FResult := VERCONCEDIDO(sFormulaAux);
             goto 1;
          end;

          if Copy(sFormulaAux,1,11) = 'TEMPOPATRO(' then begin
             FResult := TEMPOPATRO(sFormulaAux);
             goto 1;
          end;

          if Copy(sFormulaAux,1,11) = 'TEMPOPLANO(' then begin
             FResult := TEMPOPLANO(sFormulaAux);
             goto 1;
          end;

          if Copy(sFormulaAux,1,11) = 'TEMPOAFAST(' then begin
             FResult := TEMPOAFAST(sFormulaAux);
             goto 1;
          end;


          if Copy(sFormulaAux,1,11) = 'MEDPERCRUB(' then begin
             FResult := MEDPERCRUB(sFormulaAux);
             goto 1;
          end;


// *** FUNCOES DO GRUPO EVOLUCAO FUNCIONAL
          if Copy(sFormulaAux,1,13) = 'ADICIONALDIA(' then begin 
             FResult := ADICIONALDIA(sFormulaAux);
             goto 1;
          end;

          if Copy(sFormulaAux,1,13) = 'ADICIONALMES(' then begin 
             FResult := ADICIONALMES(sFormulaAux);
             goto 1;
          end;

          if Copy(sFormulaAux,1,9) = 'BUSCAPCS(' then begin
             FResult := BUSCAPCS(sFormulaAux);
             goto 1;
          end;

          if Copy(sFormulaAux,1,8) = 'VALORCF(' then begin 
             FResult := VALORCF(sFormulaAux);
             goto 1;
          end;

          if Copy(sFormulaAux,1,9) = 'CFPESSOA(' then begin
             FResult := CFPESSOA(sFormulaAux);
             goto 1;
          end;

          if Copy(sFormulaAux,1,12) = 'GRUPOPESSOA(' then begin
             FResult := GRUPOPESSOA(sFormulaAux);
             goto 1;
          end;

          if Copy(sFormulaAux,1,8) = 'MAIORCF(' then begin
             FResult := MAIORCF(sFormulaAux);
             goto 1;
          end;

          if Copy(sFormulaAux,1,12) = 'NIVELPESSOA(' then begin
             FResult := NIVELPESSOA(sFormulaAux);
             goto 1;
          end;

          if Copy(sFormulaAux,1,17) = 'NUMDIASADICIONAL(' then begin
             FResult := NUMDIASADICIONAL(sFormulaAux);
             goto 1;
          end;

          if Copy(sFormulaAux,1,21) = 'NUMDIASPERCADICIONAL(' then begin
              FResult := NUMDIASPERCADICIONAL(sFormulaAux);
              goto 1;
          end;

          if Copy(sFormulaAux,1,17) = 'PERCENTUALFUNCAO(' then begin
             FResult := PERCENTUALFUNCAO(sFormulaAux);
             Goto 1;
          end;

          if Copy(sFormulaAux,1,11) = 'TOTALCFMES(' then begin
             FResult := TOTALCFMES(sFormulaAux);
             Goto 1;
          end;

          if Copy(sFormulaAux,1,13) = 'VERFUNCAOPCC(' then begin 
             FResult := VERFUNCAOPCC(sFormulaAux);
             goto 1;
          end;

          if Copy(sFormulaAux,1,20) = 'BUSCAFUNCAOADICCOMP(' then begin 
             FResult := BUSCAFUNCAOADICCOMP(sFormulaAux);
             goto 1;
          end;

          // ELS SOL 159196 KINTANA 1302968 INICIO
          if Copy(sFormulaAux,1,14) = 'ADICIONALPERC(' then begin
             FResult := ADICIONALPERC(Self,sFormulaAux);
             goto 1;
          end;
          // ELS SOL 159196 KINTANA 1302968 FIM
           //André Oliveira SOL 136384/10362 Kintana 1712325 INICIO
          if Copy(sFormulaAux,1,11) = 'VALORSRBNP(' then begin
             FResult := VALORSRBNP(Self,sFormulaAux);
             goto 1;
          end;
          // André Oliveira SOL 136384/10362 Kintana 1712325 FIM

          //André Oliveira SOL 136384/10342 Kintana 1712175 INICIO
          if Copy(sFormulaAux,1,17) = 'EXCLUIDETCALCULO(' then begin
             FResult := EXCLUIDETCALCULO(Self,sFormulaAux);
             goto 1;
          end;
          // André Oliveira SOL 136384/10342 Kintana 1712175 FIM

          // André Oliveira SOL 136384/9641 Kintana 1664442 INICIO
          if Copy(sFormulaAux,1,25) = 'DUPLICADETCALCULOTITULAR(' then begin
             FResult := DUPLICADETCALCULOTITULAR(Self,sFormulaAux);
             goto 1;
          end;
          // André Oliveira SOL 136384/9641 Kintana 1664442 FIM


          // André Oliveira SOL 136384/10042 Kintana 1688458 INICIO
          if Copy(sFormulaAux,1,11) = 'MAIORCFCOD(' then begin
             FResult := MAIORCFCOD(sFormulaAux);
             goto 1;
          end;
          // André Oliveira SOL 136384/10042 Kintana 1688458 FIM

         // André Oliveira SOL 136384/11302 Kintana 1786550  INICIO
          if Copy(sFormulaAux,1,19) = 'VALORBENEFICIOINSS(' then begin
             FResult := VALORBENEFICIOINSS(Self,sFormulaAux);
             goto 1;
          end;
          // André Oliveira SOL 136384/11302 Kintana 1786550 FIM

          // André Oliveira SOL 193327 Kintana  1839657  INICIO
          if Copy(sFormulaAux,1,13) = 'VWFORMRUBJUD(' then begin
             FResult := VWFORMRUBJUD(Self,sFormulaAux);
             goto 1;
          end;
          // André Oliveira SOL 193327 Kintana  1839657  FIM

// *** FUNCOES DE OUTROS GRUPOS
          if copy(sFormulaAux,1,13) = 'REAJUSTAINSS(' then begin
             FResult := ReajustaINSS(sFormulaAux);
             goto 1;
          end;

          if Copy(sFormulaAux,1,12) = 'FREQSALARIO(' then begin 
             FResult := FREQSALARIO(sFormulaAux);
             goto 1;
          end;

          if Copy(sFormulaAux,1,13) = 'CONVERTEDATA(' then begin
             FResult := CONVERTEDATA(sFormulaAux);
             goto 1;
          end;

          if Copy(sFormulaAux,1,9) = 'CPASSIST(' then begin
             FResult := CPASSIST(sFormulaAux);
             goto 1;
          end;

          if Copy(sFormulaAux,1,11) = 'QTDMINUTOS(' then begin
             FResult := QTDMINUTOS(sFormulaAux);
             Goto 1;
          end;

          if Copy(sFormulaAux,1,9) = 'PARCANTEP' then begin
             FResult := PARCANTEP(Self, sFormulaAux);    
             Goto 1;
          end;
          if Copy(sFormulaAux,1,6) = 'CFPBC(' then begin
             FResult := CFPBC(Self, sFormulaAux);        
             Goto 1;
          end;
          if Copy(sFormulaAux,1,12) = 'SOMARUBRICA(' then begin
             FResult := SOMARUBRICA(Self, sFormulaAux);  
             Goto 1;
          end;
          if Copy(sFormulaAux,1,13) = 'MEDIARUBRICA(' then begin
             FResult := MEDIARUBRICA(Self, sFormulaAux);  
             Goto 1;
          end;

          if Copy(sFormulaAux,1,08) = 'FERIADO(' then begin
             FResult := FERIADO(Self, sFormulaAux);  
             Goto 1;
          end;

          if Copy(sFormulaAux,1,13) = 'FUNDATAFINAL(' then begin
             FResult := FUNDATAFINAL(Self, sFormulaAux);  
             Goto 1;
          end;
          if Copy(sFormulaAux,1,11) = 'PERCFUNPBC(' then begin
             FResult := PERCFUNPBC(Self, sFormulaAux);    
             Goto 1;
          end;

          if Copy(sFormulaAux,1,13) = 'VLRBENEFICIO(' then begin
             FResult := VLRBENEFICIO(Self, sFormulaAux);
             Goto 1;
          end;

          //RENATO VISONI SOL 114098 KINTANA 531664
          if Copy(sFormulaAux,1,15) = 'VALORBENEFICIO(' then begin
             FResult := VALORBENEFICIO(Self, sFormulaAux);
             Goto 1;
          end;
          //RENATO VISONI SOL 114098 KINTANA 531664

          //Fanuel Junior SOL157238 Kintana1250247
          if Copy(sFormulaAux,1,16) = 'COMPARAVALBENEF(' then begin
             FResult := COMPARAVALBENEF(Self, sFormulaAux);
             Goto 1;
          end;
          //Fanuel Junior SOL157238 Kintana1250247

          //Fanuel Junior SOL136385.7221 Kintana1250247
          if Copy(sFormulaAux,1,17) = 'VALORESBENEFICIO(' then begin
             FResult := VALORESBENEFICIO(Self, sFormulaAux);
             Goto 1;
          end;
          //Fanuel Junior SOL136385.7221 Kintana1250247

          //SOL 136385/7221 Kintana 1512983
          if Copy(sFormulaAux,1,13) = 'VALORPECULIO(' then begin
             FResult := VALORPECULIO(Self, sFormulaAux);
             Goto 1;
          end;
          //SOL 136385/7221 Kintana 1512983

          // SOL 136384/10002 Kintana 1685939
          if Copy(sFormulaAux,1,16) = 'FUNCAOCONFIANCA(' then begin
             FResult := FUNCAOCONFIANCA(Self, sFormulaAux);
             Goto 1;
          end;
          // SOL 136384/10002 Kintana 1685939

          //RENATO VISONI SOL SOL 122084 KINTANA 595029
          if Copy(sFormulaAux,1,16) = 'BUSCAOPCAOBENEF(' then begin
             FResult := BUSCAOPCAOBENEF(Self, sFormulaAux);
             Goto 1;
          end;
          //RENATO VISONI SOL SOL 122084 KINTANA 595029

          //Ádler
          if Copy(sFormulaAux,1,11) = 'BUSCAPLANO(' then begin
             FResult := BUSCAPLANO(Self, sFormulaAux);
             Goto 1;
          end;
          //Ádler

          if Copy(sFormulaAux,1,18) = 'VLRBENEFICIOTOTAL(' then begin
             FResult := VLRBENEFICIOTOTAL(Self, sFormulaAux);  
             Goto 1;
          end;

          if Copy(sFormulaAux,1,6) = 'VLRCF(' then begin
             FResult := VLRCF(Self, sFormulaAux);    
             Goto 1;
          end;

          if Copy(sFormulaAux,1,13) = 'VALORRESERVA(' then begin
             FResult := VALORRESERVA(Self, sFormulaAux);    
             Goto 1;
          end;

          if Copy(sFormulaAux,1,12) = 'DATACONTRIB(' then begin
             FResult := DATACONTRIB(Self, sFormulaAux);    
             Goto 1;
          end;

          if Copy(sFormulaAux,1,15) = 'ULTDATACONTRIB(' then begin
             FResult := ULTDATACONTRIB(Self, sFormulaAux);    
             Goto 1;
          end;

          if Copy(sFormulaAux,1,14) = 'PLANOANTERIOR(' then begin
             FResult := PLANOANTERIOR(Self, sFormulaAux);    
             Goto 1;
          end;

          if Copy(sFormulaAux,1,16) = 'BUSCAPERCENTUAL(' then begin
             FResult := BUSCAPERCENTUAL(Self, sFormulaAux);    
             Goto 1;
          end;

          if Copy(sFormulaAux,1,11) = 'VLRCALCINSS' then begin
             FResult := VLRCALCINSS(Self, sFormulaAux);    
             Goto 1;
          end;

          if Copy(sFormulaAux,1,14) = 'DADOSPATROANT(' then begin
             FResult := DADOSPATROANT(Self, sFormulaAux);    
             Goto 1;
          end;

          if Copy(sFormulaAux,1,15) = 'CALCULASALPART(' then begin
             FResult := CALCULASALPART(Self, sFormulaAux);    
             Goto 1;
          end;

          if Copy(sFormulaAux,1,11) = 'ENTREDATAS(' then begin
             FResult := ENTREDATAS(Self, sFormulaAux);    
             Goto 1;
          end;

          if Copy(sFormulaAux,1,09) = 'VALORSRB(' then begin
             FResult := VALORSRB(Self, sFormulaAux);  
             Goto 1;
          end;

          if Copy(sFormulaAux,1,14) = 'COTACAORENFIX(' then begin
             FResult := COTACAORENFIX(Self, sFormulaAux);  
             Goto 1;
          end;

          if Copy(sFormulaAux,1,16) = 'BUSCADETCALCULO(' then begin
             FResult := BUSCADETCALCULO(Self, sFormulaAux);
             Goto 1;
          end;

          if Copy(sFormulaAux,1,12) = 'SOMACONTRIB(' then begin
             FResult := SOMACONTRIB(Self, sFormulaAux);  
             Goto 1;
          end;

          if Copy(sFormulaAux,1,14) = 'SOMADIASBENEF(' then begin
             FResult := SOMADIASBENEF(Self, sFormulaAux);  
             Goto 1;
          end;

          if Copy(sFormulaAux,1,15) = 'SOMABENEFICIOS(' then begin
             FResult := SOMABENEFICIOS(Self, sFormulaAux);  
             Goto 1;
          end;

          if Copy(sFormulaAux,1,13) = 'SOMAHSTBENEF(' then begin
             FResult := SOMAHSTBENEF(Self, sFormulaAux);  
             Goto 1;
          end;

          if Copy(sFormulaAux,1,12) = 'PARAMPESSOA(' then begin
           FResult := PARAMPESSOA(Self, sFormulaAux);  
             Goto 1;
          end;
          // Andre Imakawa - SIG 103583 - Inicio
          if Copy(sFormulaAux,1,17) = 'PARAMPESSOADTFIM(' then begin
           FResult := PARAMPESSOADTFIM(Self, sFormulaAux);
             Goto 1;
          end;
          // Andre Imakawa - SIG 103583 - Fim

          //edilaine SIG114117-114326 : inicio
          if Copy(sFormulaAux,1,14) = 'EXISTERESERVA(' then begin
             FResult := EXISTERESERVA(Self, sFormulaAux);
             Goto 1;
          end;
          //edilaine SIG114117-114326 : fim

          //edilaine SIG115844-115954 : inicio
          if Copy(sFormulaAux,1,14) = 'MOLESTIAGRAVE(' then begin
             FResult := MOLESTIAGRAVE(Self, sFormulaAux);
             Goto 1;
          end;
          //edilaine SIG115844-115954 : fim

          //edilaine WO18367 : inicio
          if Copy(sFormulaAux,1,22) = 'NOVOCALCPENSAOSALDADA(' then begin
             FResult := NOVOCALCPENSAOSALDADA(Self, sFormulaAux);
             Goto 1;
          end;

          if Copy(sFormulaAux,1,14) = 'TEMPORALIDADE(' then begin
             FResult := TEMPORALIDADE(Self, sFormulaAux);
             Goto 1;
          end;
          //edilaine WO18367 : fim


          //edilaine WO24119 : inicio
          if Copy(sFormulaAux,1,19) = 'PAGAPECULIOSALDADO(' then begin
             FResult := PAGAPECULIOSALDADO(Self, sFormulaAux);
             Goto 1;
          end;
          //edilaine WO24119 : fim


        if Copy(sFormulaAux,1,13) = 'VLRREFRUBMES(' then begin
         FResult := VLRREFRUBMES(Self, sFormulaAux);
           Goto 1;
        end;

        if Copy(sFormulaAux,1,16) = 'RMTRANSFERENCIA(' then begin
         FResult := RMTRANSFERENCIA(Self, sFormulaAux);
           Goto 1;
        end;

        if Copy(sFormulaAux,1,16) = 'RESERVAORIGINAL(' then begin
          FResult := RESERVAORIGINAL(Self, sFormulaAux);  
          Goto 1;
        end;

        if Copy(sFormulaAux,1,14) = 'POSSUIMIGRACAO' then begin
          FResult := POSSUIMIGRACAO(Self, sFormulaAux);  
          Goto 1;
        end;

          if Copy(sFormulaAux,1,10) = 'SITPESSOA(' then begin
             FResult := SITPESSOA(sFormulaAux);
             goto 1;
          end;

          if Copy(sFormulaAux,1,11) = 'SITINTERNA(' then begin
             FResult := SITINTERNA(sFormulaAux);
             goto 1;
          end;

          if Copy(sFormulaAux,1,13) = 'SITBENEFICIO(' then begin
             FResult := SITBENEFICIO(sFormulaAux);
             goto 1;
          end;


          if copy(sFormulaAux,1,7) = 'MAXIMO(' then begin
             FResult := MAXIMO(sFormulaAux);
             goto 1;
          end;

          if copy(sFormulaAux,1,7) = 'MINIMO(' then begin
             FResult := MINIMO(sFormulaAux);
             goto 1;
          end;

          if copy(sFormulaAux,1,7) = 'SBINSS(' then begin
             FResult := SBINSS(sFormulaAux);
             goto 1;
          end;

          if copy(sFormulaAux,1,9) = 'SORTINSS(' then begin
             FResult := SORTINSS(sFormulaAux);
             goto 1;
          end;

          if copy(sFormulaAux,1,11) = 'FILTRAINSS(' then begin
             FResult := FILTRAINSS(sFormulaAux);
             goto 1;
          end;

          if copy(sFormulaAux,1,8) = 'NUMINSS(' then begin
             FResult := NUMINSS(sFormulaAux);
             goto 1;
          end;

          if copy(sFormulaAux,1,10) = 'MEDIAINSS(' then begin
             FResult := MEDIAINSS(sFormulaAux);
             goto 1;
          end;


          if copy(sFormulaAux,1,11) = 'NUMCONTRIB(' then begin
             FResult := NUMCONTRIB(sFormulaAux);
             goto 1;
          end;

          if copy(sFormulaAux,1,3) = 'CP(' then begin
             FResult := CP(sFormulaAux);
             goto 1;
          end;

          if copy(sFormulaAux,1,12) = 'NUMSALARIOS(' then begin
             FResult := NUMSALARIOS(sFormulaAux);
             goto 1;
          end;

          if copy(sFormulaAux,1,10) = 'DIASDOMES(' then begin
             FResult := DIASDOMES(sFormulaAux);
             goto 1;
          end;

          if copy(sFormulaAux,1,8) = 'NUMPROV(' then begin
             FResult := NUMPROV(sFormulaAux);
             goto 1;
          end;

          if copy(sFormulaAux,1,4) = 'PRO(' then begin
             FResult := IntToStr(PRO);
             goto 1;
          end;

          if copy(sFormulaAux,1,3) = 'NP(' then begin
             FResult := InttoStr(NP);
             goto 1;
          end;

          if copy(sFormulaAux,1,4) = 'MED(' then begin
             FResult := FloattoStr(MED);
             goto 1;
          end;

          if copy(sFormulaAux,1,9) = 'ATUARIAL(' then begin
             FResult:=ATUARIAL(sFormulaAux);
             goto 1;
          end;

          if copy(sFormulaAux,1,5) = 'ROUND'  then begin
             Fresult:=Arredonda(sFormulaAux);
             goto 1;
          end;

          if copy(sFormulaAux,1,5) = 'TRUNC'  then begin
             Fresult := Trunca(sFormulaAux);
             goto 1;
          end;

          if copy(sFormulaAux,1,4)= 'EDIA'  then begin
             fresult:=EDIA(SformulaAux);
             goto 1;
          end;

          if copy(sFormulaAux,1,4)= 'EMES'  then begin
             fresult:=EMES(SformulaAux);
             goto 1;
          end;

          if copy(sFormulaAux,1,4)= 'EANO'  then begin
             fresult:=EANO(SformulaAux);
             goto 1;
          end;

          if copy(sFormulaAux,1,8)= 'CORRECAO'  then begin
             fresult:=FazCorrecao(sformulaaux);
             goto 1;
          end;

          if copy(sFormulaAux,1,7)= 'OPPATRO'  then begin
             FResult := ExecOpPatro(SformulaAux);
             goto 1;
          end;

          //William Moreira da Silva - SIG 40538
          if copy(sFormulaAux,1,21)= 'VALORBENEFICIOINICIAL'  then begin
             FResult := ExecVALORBENEFICIOINICIAL(SformulaAux);
             goto 1;
          end;

          if copy(sFormulaAux,1,21)= 'VALORBENEFICIOSALDADO'  then begin
             FResult := ExecVALORBENEFICIOSALDADO(SformulaAux);
             goto 1;
          end;
          //William Moreira da Silva - SIG 40538

          //William Moreira da Silva - SIG 42298
          if copy(sFormulaAux,1,15)= 'VALORRUBTMPDESC'  then begin
             FResult := ExecVALORRUBTMPDESC(SformulaAux);
             goto 1;
          end;
          //William Moreira da Silva - SIG 42298

          if copy(sFormulaAux,1,9)= 'OPCONTRIB'  then begin
             FResult := OPCONTRIB(SformulaAux);
             goto 1;
          end;

          if copy(sFormulaAux,1,7) = 'OPBENEF' then begin
             fResult := OPBENEF(sFormulaAux);
             goto 1;
          end;

          if copy(sFormulaAux,1,12)= 'VEROPCONTRIB'  then begin
             FResult := VEROPCONTRIB(SformulaAux);
             goto 1;
          end;

          if Copy(sFormulaAux,1,10)= 'SALCONTRIB' then begin
             FResult := SALCONTRIB(sFormulaAux);
             goto 1;
          end;


          if copy(sFormulaAux,1,08)= 'FORMATAR'  then begin
             fresult := fazformatacao(SformulaAux);
             goto 1;
          end;

          if copy(sFormulaAux,1,11)= 'EXISTECAMPO'  then begin
             FResult := EXISTECAMPO(Self, sFormulaAux);  
             goto 1;
          end;

          if copy(sFormulaAux,1,14)= 'BUSCAMATRICULA'  then begin
             FResult := BUSCAMATRICULA(Self, sFormulaAux);  
             goto 1;
          end;

          if copy(sFormulaAux,1,13)= 'TEMPOFUNDACAO'  then begin
             FResult := TEMPOFUNDACAO(Self, sFormulaAux);  
             goto 1;
          end;
          
          if copy(sFormulaAux,1,13)= 'ULTDATAEVENTO'  then begin
             FResult := ULTDATAEVENTO(Self, sFormulaAux);  
             goto 1;
          end;

          //Vinicius Ferreira SOL 153972 KINTANA 1169147
          if copy(sFormulaAux,1,15)= 'QTDDIASCFPESSOA'  then begin
             FResult := QTDDIASCFPESSOA(Self, sFormulaAux);
             goto 1;
          end;

          if Copy(sFormulaAux,1,16) = 'TOTALIZAITENSEP(' then begin
             FResult := TOTALIZAITENSEP(Self, sFormulaAux);  
             Goto 1;
          end;

          if Copy(sFormulaAux,1,20) = 'SOMACONJUNTORUBRICA(' then begin
             FResult := SOMACONJUNTORUBRICA(Self, sFormulaAux);  
             Goto 1;
          end;

          if Copy(sFormulaAux,1,13) = 'RUBREEMBINSS(' then begin
             FResult := RUBREEMBINSS(Self, sFormulaAux);  
             Goto 1;
          end;

          if Copy(sFormulaAux,1,17) = 'SOMACOTASRESERVA(' then begin
             FResult := SOMACOTASRESERVA(Self, sFormulaAux);  
             Goto 1;
          end;

          if copy(sFormulaAux,1,7) = 'SEMANA(' then begin
             FResult := inttostr(dayofweek(strtodatetime(pegavalor(copy(sformulaaux,8,length(sformulaaux)-8)))));
             goto 1;
          end;

          if copy(sFormulaAux,1,4)= 'IRRF'  then begin
             fresult:=IRRF(SformulaAux);
             goto 1;
          end;

          if copy(sFormulaAux,1,18) = 'TOTALIZAINDICADOR(' then begin
             FResult := TOTALIZAINDICADOR(sFormulaAux);
             goto 1;
          end;

          if (copy(sFormulaAux,1,3) = 'ANO') or (copy(sFormulaAux,1,3) = 'DIA') or (copy(sFormulaAux,1,3) = 'MES') then begin
             FResult := DiaMesAno(uppercase(copy(sFormulaAux,1,3)));
             goto 1;
          end;

          if (sFormulaAux = 'HOJE') or (UpperCase(sFormulaAux) = 'DATAREF') then begin
             FResult := PegaValor(sFormulaAux);
             goto 1;
          end;

          if copy(sFormulaAux,1,5) = 'CTVA(' then begin
             FResult := CTVA(Self, sFormulaAux);
             goto 1;
          end;

          // Alterado por FHBS - 02/05/2019 - SIG85462
          if copy(sFormulaAux,1,17) = 'BUSCAMINFREQCAIXA' then begin
             FResult := ExecBUSCAMINFREQCAIXA(SformulaAux);
             goto 1;
          end;
          // Fim - Alterado por FHBS - 02/05/2019 - SIG85462

          // Ewerton Beltramini - SIG99274
          if copy(sFormulaAux,1,8) = 'ABONOMES' then begin    // Andre Imakawa - SIG 99564
             FResult := ExecABONOMES(SformulaAux);            // Andre Imakawa - SIG 99564
             goto 1;
          end;
          // Fim - Ewerton Beltramini - SIG99274.


          //Alteração realizada abaixo por haver problemas de memória quando uma regra
          //que utiliza soma A+B (exemplo) para uma QueryIn muito grande.
          //Da forma que está funciona com uma quantidade grande de registro no queryin.
          if aAlgorValor[ialgorAtual]='' then begin
             sFormulaAux := 'ATUARIAL('+sFormulaAux+')';
             fResult := ATUARIAL(sFormulaAux);
             if (uppercase(copy(sFormulaAux,1,4)) = 'EDIA') or (uppercase(copy(sFormulaAux,1,4)) = 'EMES' ) or
                (uppercase(copy(sFormulaAux,1,4)) = 'EANO') then begin
                fdata:=strtofloat(fresult);
                fresult:=datetostr(fdata);
             end;
          end;

      end;
  end;

  if (aAlgorValor[iAlgorAtual] <> '') or (aAlgorTipocampo2[value] = '3') then begin    
    FResult := aAlgorValor[iAlgorAtual];
    FError  := False;
  end;

  1:  sIdCampo := aAlgorCampo[Value];

  {-- FIM DA PRIMEIRA PARTE ---------------------------------------------------}

  { Caso não tenha ocorrido erro na execucao da Regra, armazena informacoes }
  if not FError then begin

    { Caso Informação seja um campo do banco de dados }
    if aAlgorTipocampo1[value] ='1' then begin         // do Banco de Dados
       QueryRegra.Close;
       sIdCampo := aAlgorCampo[Value];
       QueryRegra.Sql.clear;
       QueryRegra.Sql.add('SELECT ENTIDADE, NOMEDOCAMPO, CAMPODOBANCO '+
                          'FROM CMPBD WHERE (UPPER(IDCAMPO) = '''+uppercase(sIdCampo)+''')' );
       QueryRegra.Open;

       sCampo := QueryRegra.FieldByName('NOMEDOCAMPO').AsString;
       sEntidade := QueryRegra.FieldByName('ENTIDADE').AsString;

       QueryRegra.Close;
       sIdCampo := aAlgorCampo[Value];
       QueryRegra.Sql.clear;
       QueryRegra.Sql.add('SELECT NOMEDOCAMPO FROM CMPBD '+
                          'WHERE (ENTIDADE = '''+sEntidade+''') AND '+
                          '      (CHAVE = 1)');
       QueryRegra.Open;
       iTotCmpChave := QueryRegra.RecordCount;
       for i := 1 to iTotCmpChave do begin
           aCmpChave[i]      := QueryRegra.FieldByName('NOMEDOCAMPO').AsString;
           try
              aConteudoChave[i] := FQueryIn.FieldByName(aCmpChave[i]).AsString;
           except
             begin
                 MsgDlgRegra('Campo '+aCmpChave[i]+' Necessário no Sql de entrada.',
                        'Regra - Erro',mtError,[mbOk,mbHelp],0);
               Exit;
             end;
           end;
           if aConteudoChave[i] = '' then
              aConteudoChave[i] := 'NULL';
           QueryRegra.Next;
       end;
       iPosVirgula := pos(',',FResult);
       if iPosVirgula <> 0 then begin
         sValorPonto := copy(FResult,1,iPosVirgula-1); // Tira vírgula
         sValorPonto := sValorPonto + '.';             // e coloca
         sValorPonto := sValorPonto +                  // ponto
                        copy(FResult,iPosVirgula+1,length(FResult));
       end else
         sValorPonto := FResult;
         
       QueryRegra.Close;
       QueryRegra.Sql.clear;
       QueryRegra.Sql.add( 'SELECT DECODE(F.TIPODEDADO, '+
                           '''NUMERICO'',''NUMBER'','+
                           '''CARACTER'',''CHAR'','+
                           '''DATA'',''DATE'','+
                           '''MEMO'',''VARCHAR2'') DATA_TYPE '+
                           'FROM DDTABLE T, DDFIELD F WHERE '+
                           'T.TABLENAME = '''+sEntidade+''' AND '+
                           'F.FIELDNAME = '''+sCampo+''' AND F.IDDDTABLE = T.IDDDTABLE');
       QueryRegra.Open;

       if QueryRegra.IsEmpty then begin
            MsgDlgRegra('Campo '+sCampo+' não encontrado no dicionário de dados.',
                   'Regra - Erro',mtError,[mbOk,mbHelp],0);
          Exit;
       end;

       sTipoColuna := QueryRegra.FieldByName('Data_Type').AsString;
       if sTipoColuna = 'DATE' then begin
          sSqlAux := 'Update ' + sEntidade +' '+
                       'Set ' + sCampo + ' = To_date(''' + DateToStr(StrToInt(sValorPonto)) +
                       ''',''dd/mm/yyyy'') '+
                       'Where ';
          sMens := 'Erro - Dado a ser gravado não é DATE';
       end else begin
           if sTipoColuna = 'NUMBER' then begin
              sSqlAux := 'Update ' + sEntidade +' '+
                         'Set ' + sCampo + '=' + sValorPonto + ' '+
                         'Where ';
              sMens := 'Erro - Dado a ser gravado não é NUMBER';
           end else begin
               if sTipoColuna = 'FLOAT' then begin
                  iPosVirgula := pos('.',sValorPonto);
                  if iPosVirgula = 0 then
                     sValorPonto := sValorPonto+'.0';
                  sSqlAux := 'Update ' + sEntidade +' '+
                           'Set ' + sCampo + '=' + sValorPonto + ' '+
                           'Where ';
                  sMens := 'Erro - Dado a ser gravado não é FLOAT';
               end else begin
                   sSqlAux := 'Update ' + sEntidade +' '+
                              'Set ' + sCampo + '=''' + sValorPonto + ''' '+
                              'Where ';
               end;
           end;
           for i := 1 to iTotCmpChave do begin
                if i = 1 then
                   sAux := ''
                else
                    sAux := ' and ';
                QueryRegra.Close;
                QueryRegra.Sql.clear;
                QueryRegra.Sql.add('SELECT DECODE(F.TIPODEDADO, '+
                                   '''NUMERICO'',''NUMBER'','+
                                   '''CARACTER'',''CHAR'','+
                                   '''DATA'',''DATE'','+
                                   '''MEMO'',''VARCHAR2'') DATA_TYPE '+
                                   'FROM DDTABLE T, DDFIELD F WHERE '+
                                   'T.TABLENAME = '''+sEntidade+''' AND '+
                                   'F.FIELDNAME = '''+aCmpChave[i]+''' AND F.IDDDTABLE = T.IDDDTABLE');
                QueryRegra.Open;
                if QueryRegra.IsEmpty then begin
                    MsgDlgRegra('Campo '+aCmpChave[i]+' não encontrado no dicionário de dados.',
                           'Regra - Erro',mtError,[mbOk,mbHelp],0);
                  Exit;
                end;


                sTipoColuna := QueryRegra.FieldByName('Data_Type').AsString;
                if sTipoColuna = 'DATE' then begin
                   sSqlAux := sSqlAux + sAux + aCmpChave[i] + ' = TO_DATE(''' + aConteudoChave[i] + ''',''dd/mm/yyyy'')';
                end else begin
                    if (sTipoColuna = 'CHAR') or (sTipoColuna = 'VARCHAR2') or (sTipoColuna = 'VARCHAR') then begin
                       sSqlAux := sSqlAux + sAux + aCmpChave[i] + ' = ''' + aConteudoChave[i] + ''' ';
                    end else begin
                        sSqlAux := sSqlAux + sAux + aCmpChave[i] + ' = ' + aConteudoChave[i];
                    end;
                    //sSqlAux := 'Update ' + sEntidade +' '+'Set ' + sCampo + '=''' + sValorPonto + ''' '+'Where '+ssqlaux;
                end;
           end;
           QueryRegra.Close;
           QueryRegra.Sql.clear;
           QueryRegra.Sql.add(sSqlAux);
           try
              QueryRegra.ExecSql;
           except
                 begin
                        MsgDlgRegra('Erro ao executar comando. '+sSqlAux,
                               'Regra - Erro',mtError,[mbOk,mbHelp],0);
                      Exit;
                 end;
           end;
       end;

    end else begin
        { Caso Informação seja uma variavel }
        if aAlgortipocampo1[value]='2' then begin
           iInd := 1;
           bVariavelExiste := False;
           while (iInd <= iTotVariaveis) and (not bVariavelExiste) do begin // Verifica se é variavel
                 if aTabVariaveis[iInd,1] = uppercase(sidCampo) then begin
                    bVariavelExiste       := True;
                    aTabVariaveis[iInd,2] := FResult;
                 end else
                     iInd := iInd + 1;
           end;
           if not bVariavelExiste then begin
              iTotVariaveis := iTotVariaveis + 1;   //Incrementa TotVariaveis e acrescenta
              if iTotVariaveis > 700 then 
                   MsgDlgRegra('Número de variáveis em memória excedeu a 700.',
                          'Regra - Erro',mtError,[mbOk,mbHelp],0);
              aTabVariaveis[iTotVariaveis,1] := uppercase(sidCampo); //variável em aTabVAriaveis
              aTabVariaveis[iTotVariaveis,2] := FResult;
           end;
        end;
    end;
  end;
end;

{*******************************************************************************
 Rotina para fazer input de valor
*******************************************************************************}
procedure TRegra.FazInput(Value: Integer);
var
  sCampo, sIdCampo, sValor : String;
begin
  sIdCampo := aAlgorCampo[Value];
  sValor := aAlgorValor[Value];
  sCampo := uppercase(PegaNomeCampo(sIdCampo));
  QueryRegra.close;
  QueryRegra.Sql.Clear;
  QueryRegra.Sql.Add('SELECT NOMEREGRA FROM REGRA WHERE IDREGRA = '+FRuleName);
  QueryRegra.Open;
  frmInput := TfrmInputVar.Create(Self);
  frmInput.Caption := 'Regra '+QueryRegra.FieldByName('NomeRegra').AsString;
  if sValor = '' then
     frmInput.lblValor.Caption := 'Informe o valor a ser atribuido à ' + sCampo
  else
      frmInput.lblValor.Caption := sValor;
  frmInput.edValor.text:='0';
  frmInput.ShowModal;
  sValor:=frmInput.edvalor.Text;
  frmInput.Free;
  if sValor = '' then begin
     FError := True;
     SetResult('-2900');
     exit;
  end else begin
      SetVariavel(sIdCampo,sValor,sCampo);
  end;
  FResult := sValor;
end;


{*******************************************************************************
 Rotina para fazer input de valor
*******************************************************************************}
procedure TRegra.SetVariavel(IdVar: String; Valor: String; NomeVar: String);
var
  iInd : Integer;
  bvariavelexiste : boolean;
begin
   iInd := 1;
   bVariavelExiste := False;
   while (iInd <= iTotVariaveis) and (not bVariavelExiste) do begin //Verifica se variável já existe.
         if aTabVariaveis[iInd,1] = uppercase(idvar) then begin //valor
            bVariavelExiste := True;
            aTabVariaveis[iInd,2] := valor;
         end else
             iInd := iInd + 1;
   end;
   if not bVariavelExiste then begin
      iTotVariaveis := iTotVariaveis + 1;
      if iTotVariaveis > 700 then 
          MsgDlgRegra('Número de variáveis em memória excedeu a 700.',
                 'Regra - Erro',mtError,[mbOk,mbHelp],0);
      aTabVariaveis[iTotVariaveis,1] := uppercase(idvar);
      aTabVariaveis[iTotVariaveis,2] := valor;
   end;
end;

{******************************************************************************}
{  Seta o nome dos "DataBase" dos componentes de acesso ao Banco.              }
{------------------------------------------------------------------------------}
procedure TRegra.SetDataBaseName(DataBaseName: String);
begin
  FDatabaseName := DatabaseName;

  If Not QryAlg.Active Then Begin
    TabelaBiometrica.DatabaseName  := FDatabaseName;
    TabelaCampoBio.DatabaseName    := FDatabaseName;

    QueryRegraAux.DatabaseName := FDatabaseName;
    QueryRegra.DatabaseName    := FDatabaseName;
    QryTabuaBio.DatabaseName   := FDatabaseName;
    Qrypro.DatabaseName        := FDatabaseName;
    Qry.DatabaseName           := FDatabaseName;
    QryOutraRegra.DatabaseName := FDatabaseName;
    QryAlg.DatabaseName        := FDatabaseName;
  End;

end;

{*******************************************************************************
Rotina para pegar a fórmula na base de dados. Value deverá conter o
Id da fórmula
*******************************************************************************}
function TRegra.GetFormula(Value: String): String;
begin
  Result:=aAlgorExpressao[iAlgorAtual];
end;


{*******************************************************************************
Função para retornar o número da linha em que se encontra um certo
algoritimo. Value receberá o Id do Algoritmo
*******************************************************************************}
function TRegra.PegaIdAlgor(Value: Integer): Integer;
var
  i:  Integer;
  iAlgAux : Integer;
  bAchou  : Boolean;
begin
  bAchou := False;
  PegaIdAlgor := 0;
  i := 1;
  while (i <= iTotRegs) or (bAchou = true) do begin
        iAlgAux := StrToInt(aAlgorRegra[i]);
        if iAlgAux = Value then begin
           bAchou := True;
           Result := i;
           exit;
        end;
        Inc(i);
  end;
end;


{******************************************************************************}
{ Funcao PegaEntidade                                                          }
{   Busca o nome da Entidade(Tabela) do Campo no Banco de Dados.               }
{------------------------------------------------------------------------------}
Function TRegra.PegaEntidade(Value: String): String;
var
  sEntidade : String;
begin
  { Busca nome da Entidade(Tabela) do Campo no Dicionario de Dados }
  QueryRegra.close;
  QueryRegra.Sql.clear;
  QueryRegra.Sql.add('SELECT ENTIDADE '+
                     'FROM CMPBD '+
                     'WHERE UPPER(NOMEDOCAMPO) = '''+uppercase(Value)+'''' );
  QueryRegra.Open;
  { Caso Encontre Retorna o Nome }
  if QueryRegra.RecordCount = 0 then
    sEntidade := ''
  else
    sEntidade := QueryRegra.FieldByName('ENTIDADE').AsString;

  { Seta Resultado }
  Result := sEntidade;
end;


{******************************************************************************}
{ Funcao PegaEntidade                                                          }
{   Busca o nome do Campo no Banco de Dados.                                   }
{------------------------------------------------------------------------------}
Function TRegra.PegaNomeCampo(Value: String): String;
Var
  sCampo : String;
Begin
  { Caso ? }
  //If aAlgorTipoCampo2[iAlgorAtual] = '1' then begin
  //  Result:=aAlgorNomeCampo2[iAlgorAtual];
  //  Exit
  //End;

  { Tenta buscar o nome do Campo no Dicionario de Dados }
  Try
    QueryRegra.Close;
    QueryRegra.Sql.Clear;
    QueryRegra.Sql.Add('SELECT NOMEDOCAMPO, APELIDO '+
                       'FROM CMPBD '+
                       'WHERE CAMPODOBANCO <> ''0'' AND '+  { 06/01/2003 }
                       ' UPPER(IDCAMPO) = '''+UpperCase(Value)+'''');
    QueryRegra.Open;
  Except
    Ferror := True;
    SetResult('-3050');
    exit;
  End;

  If QueryRegra.RecordCount = 0 then
    sCampo := Value
  Else begin
  { Caso tenha encontrado retorna o Nome ou Apelido do Campo }
    if trim(QueryRegra.FieldByName('APELIDO').AsString) <> '' then
      sCampo :=QueryRegra.FieldByName('APELIDO').AsString
    else
      sCampo := QueryRegra.FieldByName('NOMEDOCAMPO').AsString;
  End;

  { Seta Resultado }
  Result := sCampo;
end;


function TRegra.TiraTodosBrancos(Value: String): String;
Var
  I : Integer;
Begin
  I := Pos(' ',Value);
  While i <> 0 Do Begin
    Delete(Value,i,1);
    I := Pos(' ',Value);
  End;
  Result := Value;
End;

{******************************************************************************}
{ Funcao PegaValor                                                             }
{   Busca o significado no Regra do Valor passado em "Value", podendo este ser }
{   uma Variavel, Campo ou Literal.                                            }
{------------------------------------------------------------------------------}
Function TRegra.PegaValor(Value: String): String;
Var
  I,Erro   : Integer;
  sNomeVar : String;
  Teste    : Real;
  bAchouVariavel : Boolean;
Begin
  Value  := UpperCase(Value);
  Result := Value;
  bAchouVariavel := False;

  { Testa se Valor é Numerico ( Erro = 0 ) }
  Val(Value,Teste,Erro);
  { Caso Valor seja numerico retorna }
  If Erro = 0 Then Begin
    Result := Value;
    Exit;
  End Else If EhData(Value) Then Begin
    Result := Value;
    Exit;
  End Else Begin
    { Caso Valor seja um caracter especial retona }
    If (Value = '+') or (value = '-') or (value = '*') or (value = '/') or (value = '(') or
       (Value = ')') or (value = '{') or (value = '}') or (value = '[') or (value = ']') or
       (Value = ',') or (value = '^') or (value = '.') or (value = '"') or (value = '&') or
       (Value = ':') or (value = ';') or (value = '=')
    Then Begin
      Result := Value;
      Exit;
    End;
  End;

  { Caso 1º caracter seja "#" (Literal) retorna }
  If Copy(Value,1,1) = '#' Then Begin
    Result := Copy(Value,2,Length(Value));
    Exit;
  End Else Begin
    { Caso 1º caracter seja "@" (Variavel) guarda nome para buscar na Tabela   }
    { no Final da rotina                                                       }
    If Copy(Value,1,1) = '@' Then Begin
      sNomeVar := Copy(value,2,length(value))
    End Else Begin
      { Verifica se Valor é uma Variavel se for guarda nome para buscar na     }
      { Tabela no Final da rotina                                              }
      If EhVariavel(Value) <> 0 Then
        sNomeVar := Value
      Else begin
        {se não encontrar a variavel na function EhVariavel
         procura variavel na tabela CMPBD}
         Value := buscaVariavel(Value);
          if Value <> '' then
             begin
                { "Pressupõe" que Valor é uma Campo, busca seu valor retorna }
                Result := PegaValorCMPBD(value);
                Exit;
             end
             else
                Exit;
      End;

    End; { Else Copy(value,1,1)='@' }

  End; { Else Copy(value,1,1)='#' }


  { Caso não tenha ocorrido nenhum erro }
  If Not FError Then Begin
    I := 1;
    { Procura Variavel na tabela para retornar o seu valor }
    While (I <= iTotVariaveis + 1) And (Not bAchouVariavel) Do Begin
      If UpperCase(aTabVariaveis[I,1]) = UpperCase(sNomeVar) Then Begin
        bAchouVariavel := True;
        Result := aTabVariaveis[I,2];
      End Else
        I := I + 1;
    End; { While }

    If bAchouVariavel = False Then
    Begin
      CMDebugToFile(' Regra -> ' + Alinha( fRuleName, 7, 'E' ) +
                    ' Passo -> ' + Alinha( aAlgorRegra[iAlgoratual], 4, 'E' )+
                    ' Variavel -> "'+sNomeVar+'" não encontrada ',
                    'Regra.Log');
    End;

  End; { Not FError }

End;

Function TRegra.buscaVariavel(variavel :string): string;
var
qryBuscaVariavel : TwwQuery;
   begin
    try
      qryBuscaVariavel := TwwQuery.Create(Nil);
      with qryBuscaVariavel do begin
         DatabaseName := 'BaseDados';
         Close;
         Sql.Clear;
         Sql.Add('SELECT * FROM CMPBD');
         Sql.Add('WHERE CAMPODOBANCO = 0');
         Sql.Add('AND IDCAMPO = ' +''''+ variavel +''''+ '');
         Open;
             if  not(qryBuscaVariavel.isEmpty) then
                Result := ''
             else
                Result := variavel;
        end;
    finally
      FreeAndNil(qryBuscaVariavel);
    end;
  end;

{******************************************************************************}
{ Funcao EhVariavel                                                            }
{   Verifica se Parametro passado e uma Variavel da Regra                      }
{   Retorna Indice do Vetor onde a variavel foi encontrada ou ultimo indice.   }
{------------------------------------------------------------------------------}
Function TRegra.EhVariavel(Value: String): Integer;
Var
  I : Integer;
  sNomeVar : String;
  bAchouVariavel : Boolean;
Begin
  { Inicia Resultado }
  EhVariavel := 0;

  { Caso valor nao seja Nulo }
  If Value <> '' Then Begin

    { Caso campo nao inicie com plic ou seja Numero }
    If (Value[1] <> '''') And (Not EhNumero(Value)) Then Begin
      { Inicia Variaveis }
      Value := UpperCase(Trim(Value));
      bAchouVariavel := False;
      FError := False;
      { Acerta Nome da Variavel }
      If Value = 'HOJE' Then Begin
        sNomeVar := 'HOJE';
      End Else Begin
        sNomeVar := Value;
      End;

      { Caso nao tenha ocorrido erro }
      If Not FError Then Begin
        i := 1;
        { Procura variável na tabela de variaveis }
        While (I <= iTotVariaveis + 1) And (Not bAchouVariavel) Do Begin // Foi colocado mais 1 por causa da Var. HOJE
          { Achou variável }
          If aTabVariaveis[I,1] = sNomeVar Then Begin
            bAchouVariavel := True;
            EhVariavel     := I;
          End Else
            I := I + 1;
        End; { While }
      End; { Not FError }

    End; { (Value[1] <> '''') }

  End; { Value <> ''  }
End;

{******************************************************************************}
{ Funcao EhString                                                              }
{   Verifica se Parametro passado e uma String (está entre Plics)              }
{------------------------------------------------------------------------------}
Function TRegra.EhString(Value: String):Boolean;
Var
  Tam : Integer;
begin
  { Incia variaveis }
  Value := Trim(Value);
  Tam   := Length(Value);
  EhString := False;
  { Testa se exispem Plic's no inicio e fim da string }
  If ( (Value[1]   = '''') Or (Value[1]   = '"') ) And
     ( (Value[Tam] = '''') Or (Value[Tam] = '"') )
  Then
    EhString := True;
End;

{******************************************************************************}
{ Funcao EhNumero                                                              }
{   Verifica se Parametro passado e um Numero                                  }
{------------------------------------------------------------------------------}
Function TRegra.EhNumero(Value: String): Boolean;
Var
  I, Tam : Integer;
Begin
  { Inicia Variaveis }
  Value := Trim(Value);
  Tam   := Length(Value);

  { Caso parametro vazio }
  If Value = '' Then Begin
    Result := false;
    Exit
  End;

  Result := True;
  { Verifica no parametro se existem caracteres não numéricos }
  For I := 1 to Tam Do Begin
    If Not(Value[i] in ['0','1','2','3','4','5','6','7','8','9','.',',','-']) Then Begin
      Result := False;
      Break;
    End;
  End;
End;

{******************************************************************************}
{ Funcao EhData                                                                }
{   Verifica se Parametro passado e uma Data                                   }
{------------------------------------------------------------------------------}
Function TRegra.EhData(Value : String): Boolean;
Begin
  { Seta Resultado }
  Result := True;
  { Tenta transformar parametro (String) em data, dando erro não e data }
  Try
    StrToDate(Value);
  Except
    Result := False;
  End;

End;

{******************************************************************************}
{ Funcao PegaValorCMPBD                                                        }
{   Busca e retorna valor passado em "Value" no Dicionario de Dados.           }
{------------------------------------------------------------------------------}
Function TRegra.PegaValorCMPBD(Value: String): String;
Var
  CmpErro, sEntidade, sTipoColuna, sAux, sSqlAux, sMens, sNomeCampo : String;
  aCmpChave     : Array[1..15] of String;  { Campos que são chave de procura de uma tabela }
  aConteudoChave: Array[1..15] of String;  { Conteúdo dos campos chave }
  I, iTotCmpChave  : Integer;              { Total de campos chaves de uma tabela }
  vAchou : Boolean;
begin
  { Inicia Variaveis }
  ErroCampo := False;
  { Caso esteja buscando o campo 2 do Algoritmo }
  If FlagCampo = 2 Then Begin
    If trim(aAlgornomeCampo2[iAlgorAtual]) <> '' Then Begin
      sNomeCampo := aAlgornomeCampo2[iAlgorAtual];
    End;
  End Else Begin
    { Caso esteja buscando o campo 1 do Algoritmo }
    If Flagcampo = 1 Then Begin
      If trim(aAlgornomeCampo1[iAlgorAtual]) <> '' Then Begin
        sNomeCampo := aAlgornomeCampo1[iAlgorAtual]
      End;
    End Else Begin
      sNomeCampo := Value;
    End;
  End;
  FError := False;

  Try
    { Caso tenha um campo para processar }
    If trim(sNomeCampo) <> '' then Begin
      { Testa se ainda existem regra em memoria }
      If ProxRegraExec <> 0 Then Begin
        { Caso Regra tenha  Query Propria }
        If TemQuery = True Then Begin
          Result := QryOutraRegra.FieldByname(TiraPlic(sNomeCampo)).AsString
        End Else Begin
          { caso campo não exista na query de entrada busca apelidos }
          If FQueryIn.FindField(sNomeCampo) = NIL Then
            sNomeCampo := UpperCase(PegaNomeCampo(sNomeCampo));
          { Caso Regra não tenha  Query Propria }
          Result := FQueryIn.FieldByname(TiraPlic(sNomeCampo)).AsString;
        End;
      End Else Begin
        { caso campo não exista na query de entrada busca apelidos }
        If FQueryIn.FindField(sNomeCampo) = NIL Then
          sNomeCampo := UpperCase(PegaNomeCampo(sNomeCampo));
        Result := Trim( FQueryIn.FieldByname(TiraPlic(sNomeCampo)).AsString );

      End;
    End;
  Except

    CMDebugToFile(' Regra -> ' + Alinha( fRuleName, 7, 'E' ) +
                  ' Passo -> ' + Alinha( aAlgorRegra[iAlgoratual], 4, 'E' )+
                  ' Campo -> "'+sNomeCampo+'" não encontrada ',
                  'Regra.Log');

    sNomeCampo := UpperCase(PegaNomeCampo(sNomeCampo));

    sEntidade := PegaEntidade(sNomeCampo);
    If (sEntidade='') Then Begin
      If flagcampo = 1 Then
        Result := Value
      Else
        Result := sNomeCampo;
      Exit;
    End;

    QueryRegra.Close;
    QueryRegra.SQL.clear;
    QueryRegra.SQL.add('SELECT NOMEDOCAMPO FROM CMPBD '+
                       'WHERE ENTIDADE = '''+sEntidade+''' AND '+
                       '      CHAVE    = 1');
    QueryRegra.Open;
    iTotCmpChave := QueryRegra.RecordCount;

    CmpErro := '';

    For I := 1 to iTotCmpChave Do Begin
      aCmpChave[i] := QueryRegra.FieldByName('NOMEDOCAMPO').AsString;
      Try
        aConteudoChave[i] := FQueryIn.FieldByName(aCmpChave[i]).AsString;
      Except
        ErroCampo := True;
        CmpErro   := CmpErro + aCmpChave[i]+', ';
      End;
      If aConteudoChave[i] = '' Then
        aConteudoChave[i] := 'NULL';

      QueryRegra.Next;
    End; { For I }

    If CmpErro <> '' Then
      CmpErro := 'Campo(s) obrigatório(s) : '+Copy(CmpErro,1,Length(CmpErro)-2)+'. ';

    vAchou := False;

    For I := 1 To 15 Do Begin
      If aCmpChave[i] = SNomeCampo Then Begin
        vAchou := True;
        Break;
      End;

    End; { For I }

    If Not vAchou Then Begin
      Try
        FQueryIn.fieldbyname(tiraplic(sNomeCampo)).AsString;
      Except
          CmpErro := CmpErro + ' Campo(s) faltando : '+sNomeCampo+'.';
          ErroCampo := True;
      End;
    End; { If Not }

    QueryRegra.Close;
    QueryRegra.Sql.clear;
    QueryRegra.Sql.add('SELECT DECODE(F.TIPODEDADO, '+
                       '''NUMERICO'',''NUMBER'','+
                       '''CARACTER'',''CHAR'','+
                       '''DATA'',''DATE'','+
                       '''MEMO'',''VARCHAR2'') DATA_TYPE '+
                       'FROM DDTABLE T, DDFIELD F WHERE '+
                       'T.TABLENAME = '''+sEntidade+''' AND '+
                       'F.FIELDNAME = '''+sNomeCampo+''' AND F.IDDDTABLE = T.IDDDTABLE');
    QueryRegra.Open;

    sTipoColuna := QueryRegra.FieldByName('DATA_TYPE').AsString;

    { Caso tipo de coluna seja Data }
    If sTipoColuna = 'DATE' Then Begin
      sSqlAux := 'SELECT TO_CHAR(' + sNomeCampo + ',''DD/MM/YYYY'') AS '+sNomeCampo+
                 ' FROM ' + sEntidade + ' '+
                 ' WHERE ';
      sMens := 'Erro - Dado a ser gravado não é DATE';
    End Else Begin
      { outro tipo de coluna }
      sSqlAux := 'SELECT ' + sNomeCampo + ' '+
                 'FROM   ' + sEntidade  + ' '+
                 'WHERE ';
      sMens := 'Erro - Dado a ser gravado não é NUMBER';
    End;

    For I := 1 To iTotCmpChave Do Begin

      If i = 1 Then
        sAux := ''
      Else
        sAux := ' and ';

      QueryRegra.Close;
      QueryRegra.Sql.clear;
      QueryRegra.Sql.add('SELECT DECODE(F.TIPODEDADO, '+
                         '''NUMERICO'',''NUMBER'','+
                         '''CARACTER'',''CHAR'','+
                         '''DATA'',''DATE'','+
                         '''MEMO'',''VARCHAR2'') DATA_TYPE '+
                         'FROM DDTABLE T, DDFIELD F WHERE '+
                         'T.TABLENAME = '''+sEntidade+''' AND '+
                         'F.FIELDNAME = '''+aCmpChave[i]+
                         ''' AND F.IDDDTABLE = T.IDDDTABLE');
      QueryRegra.Open;

      sTipoColuna   := QueryRegra.FieldByName('Data_Type').AsString;

      If sTipoColuna = 'DATE' Then Begin
        sSqlAux := sSqlAux + sAux + aCmpChave[i] + ' = TO_DATE(''' + aConteudoChave[i] + ''',''dd/mm/yyyy'')';
      End Else Begin

        If (sTipoColuna = 'CHAR') Or (sTipoColuna = 'VARCHAR2') Or
                 (sTipoColuna = 'VARCHAR')
        Then Begin
          sSqlAux := sSqlAux + sAux + aCmpChave[i] + ' = ''' + aConteudoChave[i] + ''' ';
        End Else Begin
          sSqlAux := sSqlAux + sAux + aCmpChave[i] + ' = ' + aConteudoChave[i];
        End;

      End;

    End; { For I }

    If iTotCmpChave > 0 Then Begin
      QueryRegra.Close;
      QueryRegra.Sql.clear;
      QueryRegra.Sql.add(sSqlAux);
      Try
        QueryRegra.Open;
        Result := QueryRegra.FieldByName(sNomeCampo).AsString;
      Except
          MsgDlgRegra('Entidade inexistente no Banco. Entidade : '+sEntidade,
                 'Regra "'+fRuleName+'" Erro',mtError,[mbOk,mbHelp],0);
      End;

      If QueryRegra.IsEmpty Then Begin
        If ErroCampo Then Begin
          FQueryIn.Last;
            MsgDlgRegra(CmpErro+' (Necessários no Sql de entrada).',
                           'Regra "'+fRuleName+'"- Erro',mtError,[mbOk,mbHelp],0);
          iAlgorAtual := 199;
          Result := '';
          fError := True;
          { Incluir o Raise caso queira tratar o erro }
          FinalizaRegra;
          Exit;
        End;
      End;
    End Else Begin
      If ErroCampo Then Begin
        FQueryIn.Last;
          MsgDlgRegra(CmpErro+' (Necessários no Sql de entrada).',
                         'Regra "'+fRuleName+'" Erro',mtError,[mbOk,mbHelp],0);
        iAlgorAtual := 199;
        fError := True;
        { Incluir o Raise caso queira tratar o erro }
        FinalizaRegra;
        Result := '';
      End;
    End;

  End;

End;


function TRegra.TrocaVirgulaPonto(Value: String): String;
var
  //i : Integer;
  iPosVirg : Integer;
begin
  iPosVirg := pos(',',Value);
  if iPosVirg <> 0 then
     Value := copy(Value,1,iPosVirg-1)+'.'+copy(Value,iPosVirg+1,length(Value));
  Result := Value;
end;

function TRegra.TrocaSeparador(Value: String): String;
var
  iPosVirg : Integer;
begin
  Result := Value;
  iPosVirg := pos(',',Value);
  if iPosVirg <> 0 then
      Value := copy(Value,1,iPosVirg-1)+separador+copy(Value,iPosVirg+1,length(Value));
  iPosVirg := pos('.',Value);
  if iPosVirg <> 0 then
     result := copy(Value,1,iPosVirg-1)+separador+copy(Value,iPosVirg+1,length(Value));
end;

function TRegra.pv: String;
var
  i  : Integer;
  fim:boolean;
begin
  fim:=false;
  i := pos(',',sFormulaAux);
  sPrincipal := copy(sFormulaAux,4,i-4);

  sFormulaAux := copy(sFormulaAux,i+1,length(sFormulaAux)-i);
  i := pos(',',sFormulaAux);
  sMontante := copy(sFormulaAux,1,i-1);

  sFormulaAux := copy(sFormulaAux,i+1,length(sFormulaAux)-i);
  i := pos(',',sFormulaAux);
  if i > 0 then
     sPeriodos := copy(sFormulaAux,1,i-1)
  else begin
       i := pos(')',sFormulaAux);
       sPeriodos := copy(sFormulaAux,1,i-1);
       fim:=true;
  end;

  sFormulaAux := copy(sFormulaAux,i+1,length(sFormulaAux)-i);
  i := pos(',',sFormulaAux);
  if i > 0 then
     sJurosMedio := copy(sFormulaAux,1,i-1)
  else begin
       if not fim then begin
          i := pos(')',sFormulaAux);
          sJurosMedio := copy(sFormulaAux,1,i-1);
          fim:=true;
       end else
           sJurosMedio :='0';
  end;
  sFormulaAux := copy(sFormulaAux,i+1,length(sFormulaAux)-i);
  //i := pos(')',sFormulaAux);
  if not fim then begin
     i := pos(')',sFormulaAux);
     sPrimeira := copy(sFormulaAux,1,i-1);
     fim:=true;
  end else
      sprimeira :='0';

  sprincipal  := PegaValor(sprincipal);
  sMontante   := PegaValor(sMontante);
  sPeriodos   := PegaValor(sPeriodos);
  sJurosMedio := PegaValor(sJurosMedio);
  sPrimeira   := PegaValor(sPrimeira);


  formula1.row:=1;
  formula1.col:=1;

  formula1.number:=strtofloat(sprincipal);
  formula1.row:=formula1.row+1;
  formula1.number:=strtofloat(smontante);
  formula1.row:=formula1.row+1;
  formula1.number:=strtofloat(speriodos);
  formula1.row:=formula1.row+1;
  formula1.number:=strtofloat(sjurosmedio);
  formula1.row:=formula1.row+1;
  formula1.number:=strtofloat(sprimeira);
  formula1.row:=formula1.row+1;

  if separador=',' then
     formula1.formula:='pv(a1;a2;a3;a4;a5)'
  else
     formula1.formula:='pv(a1,a2,a3,a4,a5)';

  result:=trocavirgulaponto(formula1.text);

  {fim da alteracao}

end;

function TRegra.fv: String;
var
  i : Integer;
  fim:boolean;
begin
  fim:=false;
  i := pos(',',sFormulaAux);
  sPrincipal := copy(sFormulaAux,4,i-4);

  sFormulaAux := copy(sFormulaAux,i+1,length(sFormulaAux)-i);
  i := pos(',',sFormulaAux);
  sMontante := copy(sFormulaAux,1,i-1);

  sFormulaAux := copy(sFormulaAux,i+1,length(sFormulaAux)-i);
  i := pos(',',sFormulaAux);
  if i > 0 then
     sPeriodos := copy(sFormulaAux,1,i-1)
  else begin
       i := pos(')',sFormulaAux);
       sPeriodos := copy(sFormulaAux,1,i-1);
       fim:=true;
  end;

  sFormulaAux := copy(sFormulaAux,i+1,length(sFormulaAux)-i);
  i := pos(',',sFormulaAux);
  if i > 0 then
     sJurosMedio := copy(sFormulaAux,1,i-1)
  else begin
       if not fim then begin
          i := pos(')',sFormulaAux);
          sJurosMedio := copy(sFormulaAux,1,i-1);
          fim:=true;
       end else
           sJurosMedio :='0';
  end;
  sFormulaAux := copy(sFormulaAux,i+1,length(sFormulaAux)-i);
  //i := pos(')',sFormulaAux);
  if not fim then begin
     i := pos(')',sFormulaAux);
     sPrimeira := copy(sFormulaAux,1,i-1);
     fim:=true;
  end else
      sprimeira :='0';

  sprincipal := PegaValor(sprincipal);
  sMontante := PegaValor(sMontante);
  sPeriodos := PegaValor(sPeriodos);
  sJurosMedio := PegaValor(sJurosMedio);
  sPrimeira := PegaValor(sPrimeira);


  formula1.row:=1;
  formula1.col:=1;

  formula1.number:=strtofloat(sprincipal);
  formula1.row:=formula1.row+1;
  formula1.number:=strtofloat(smontante);
  formula1.row:=formula1.row+1;
  formula1.number:=strtofloat(speriodos);
  formula1.row:=formula1.row+1;
  formula1.number:=strtofloat(sjurosmedio);
  formula1.row:=formula1.row+1;
  formula1.number:=strtofloat(sprimeira);
  formula1.row:=formula1.row+1;

  if separador =',' then
     formula1.formula:='fv(a1;a2;a3;a4;a5)'
  else
     formula1.formula:='fv(a1,a2,a3,a4,a5)';

  result:=trocavirgulaponto(formula1.text);

end;

Function TRegra.npmt: String;
var
  i : Integer;
  fim:boolean;
begin

  fim:=false;
  i := pos(',',sFormulaAux);
  sPrincipal := copy(sFormulaAux,6,i-6);

  sFormulaAux := copy(sFormulaAux,i+1,length(sFormulaAux)-i);
  i := pos(',',sFormulaAux);
  sMontante := copy(sFormulaAux,1,i-1);

  sFormulaAux := copy(sFormulaAux,i+1,length(sFormulaAux)-i);
  i := pos(',',sFormulaAux);
  if i > 0 then
     sPeriodos := copy(sFormulaAux,1,i-1)
  else begin
       i := pos(')',sFormulaAux);
       sPeriodos := copy(sFormulaAux,1,i-1);
       fim:=true;
  end;

  sFormulaAux := copy(sFormulaAux,i+1,length(sFormulaAux)-i);
  i := pos(',',sFormulaAux);
  if i > 0 then
     sJurosMedio := copy(sFormulaAux,1,i-1)
  else begin
       if not fim then begin
          i := pos(')',sFormulaAux);
          sJurosMedio := copy(sFormulaAux,1,i-1);
          fim:=true;
       end else
           sJurosMedio :='0';
  end;
  sFormulaAux := copy(sFormulaAux,i+1,length(sFormulaAux)-i);
  //i := pos(')',sFormulaAux);
  if not fim then begin
     i := pos(')',sFormulaAux);
     sPrimeira := copy(sFormulaAux,1,i-1);
     fim:=true;
  end else
      sprimeira :='0';

  sPrincipal  := PegaValor(sPrincipal);
  sMontante   := PegaValor(sMontante);
  sPeriodos   := PegaValor(sPeriodos);
  sJurosMedio := PegaValor(sJurosMedio);
  sPrimeira   := PegaValor(sPrimeira);

  formula1.row:=1;
  formula1.col:=1;

  formula1.number:=strtofloat(sprincipal);
  formula1.row:=formula1.row+1;
  formula1.number:=strtofloat(smontante);
  formula1.row:=formula1.row+1;
  formula1.number:=strtofloat(speriodos);
  formula1.row:=formula1.row+1;
  formula1.number:=strtofloat(sjurosmedio);
  formula1.row:=formula1.row+1;
  formula1.number:=strtofloat(sprimeira);
  formula1.row:=formula1.row+1;

  if separador = ',' then
     formula1.formula:='nper(a1;a2;a3;a4;a5)'
  else
     formula1.formula:='nper(a1,a2,a3,a4,a5)';

  result:=trocavirgulaponto(formula1.text);

end;

Function TRegra.pmt: String;
var
  i : Integer;
  fim:boolean;
begin
  decimalseparator:='.';
  fim:=false;
  i := pos(',',sFormulaAux);
  sPrincipal := copy(sFormulaAux,5,i-5);
  sPrincipal := pegavalor(sPrincipal);

  sFormulaAux := copy(sFormulaAux,i+1,length(sFormulaAux)-i);
  i := pos(',',sFormulaAux);
  sMontante := copy(sFormulaAux,1,i-1);
  sMontante := pegavalor(sMontante);

  sFormulaAux := copy(sFormulaAux,i+1,length(sFormulaAux)-i);
  i := pos(',',sFormulaAux);
  if i > 0 then
    sPeriodos := copy(sFormulaAux,1,i-1)
  else begin
    i := pos(')',sFormulaAux);
    sPeriodos := copy(sFormulaAux,1,i-1);
    fim:=true;
  end;
  sPeriodos :=pegavalor(sPeriodos);

  sFormulaAux := copy(sFormulaAux,i+1,length(sFormulaAux)-i);
  i := pos(',',sFormulaAux);
  if i > 0 then
    sJurosMedio := copy(sFormulaAux,1,i-1)
  else begin
    if not fim then begin
      i := pos(')',sFormulaAux);
      sJurosMedio := copy(sFormulaAux,1,i-1);
      fim:=true;
    end else
      sJurosMedio :='0';
  end;
  sJurosMedio:=pegavalor(sJurosmedio);

  sFormulaAux := copy(sFormulaAux,i+1,length(sFormulaAux)-i);
  //i := pos(')',sFormulaAux);
  if not fim then begin
     i := pos(')',sFormulaAux);
     sPrimeira := copy(sFormulaAux,1,i-1);
     fim:=true;
  end else
      sprimeira :='0';
  sPrimeira := pegavalor(sPrimeira);

  formula1.row:=1;
  formula1.col:=1;

  formula1.number:=strtofloat(sprincipal);
  formula1.row:=formula1.row+1;
  formula1.number:=strtofloat(smontante);
  formula1.row:=formula1.row+1;
  formula1.number:=strtofloat(speriodos);
  formula1.row:=formula1.row+1;
  formula1.number:=strtofloat(sjurosmedio);
  formula1.row:=formula1.row+1;
  formula1.number:=strtofloat(sprimeira);
  formula1.row:=formula1.row+1;

  if separador=',' then
     formula1.formula:='pmt(a1;a2;a3;a4;a5)'
  else
     formula1.formula:='pmt(a1,a2,a3,a4,a5)';

  result:=trocavirgulaponto(formula1.text);
end;

function TRegra.rate: String;
var
  i : Integer;
  Fim : Boolean;
begin
  fim:=false;
  i := pos(',',sFormulaAux);
  sPrincipal := copy(sFormulaAux,6,i-6);

  sFormulaAux := copy(sFormulaAux,i+1,length(sFormulaAux)-i);
  i := pos(',',sFormulaAux);
  sMontante := copy(sFormulaAux,1,i-1);

  sFormulaAux := copy(sFormulaAux,i+1,length(sFormulaAux)-i);
  i := pos(',',sFormulaAux);
  if i > 0 then
     sPeriodos := copy(sFormulaAux,1,i-1)
  else begin
       i := pos(')',sFormulaAux);
       sPeriodos := copy(sFormulaAux,1,i-1);
       fim:=true;
  end;

  sFormulaAux := copy(sFormulaAux,i+1,length(sFormulaAux)-i);
  i := pos(',',sFormulaAux);
  if i > 0 then
     sJurosMedio := copy(sFormulaAux,1,i-1)
  else begin
       if not fim then begin
          i := pos(')',sFormulaAux);
          sJurosMedio := copy(sFormulaAux,1,i-1);
          fim:=true;
       end else
           sJurosMedio :='0';
  end;
  sFormulaAux := copy(sFormulaAux,i+1,length(sFormulaAux)-i);
  //i := pos(')',sFormulaAux);
  if not fim then begin
     i := pos(')',sFormulaAux);
     sPrimeira := copy(sFormulaAux,1,i-1);
     fim:=true;
  end else
      sprimeira :='0';

  sPrincipal := PegaValor(sPrincipal);
  sMontante := PegaValor(sMontante);
  sPeriodos := PegaValor(sPeriodos);
  sJurosMedio := PegaValor(sJurosMedio);
  sPrimeira := PegaValor(sPrimeira);

  formula1.row:=1;
  formula1.col:=1;

  formula1.number:=strtofloat(sprincipal);
  formula1.row:=formula1.row+1;
  formula1.number:=strtofloat(smontante);
  formula1.row:=formula1.row+1;
  formula1.number:=strtofloat(speriodos);
  formula1.row:=formula1.row+1;
  formula1.number:=strtofloat(sjurosmedio);
  formula1.row:=formula1.row+1;
  formula1.number:=strtofloat(sprimeira);
  formula1.row:=formula1.row+1;

  if separador=',' then
     formula1.formula:='RATE(a1;a2;a3;a4;a5)'
  else
     formula1.formula:='RATE(a1,a2,a3,a4,a5)';


  result:=trocavirgulaponto(formula1.text);

end;

{******************************************************************************}
{ Fórmula INDICE                                                               }
{   Busca cotação de uma Moeda em uma determinada data ou proxima              }
{------------------------------------------------------------------------------}
Function TRegra.INDICE: String;
Var
  I : Integer;
  sIndexador, sData, sAux, sSqlAux, sExato, sTipoRetorno  : String;
  sPer         : String[1];
Begin
  Ferror   := False;
  sTipoRetorno := '0';
  {------------------------------------------------------}
  { Decodifica Formula }
  i := pos(',',sFormulaAux);
  sIndexador := copy(sFormulaAux,8,i-8);
  sFormulaAux := copy(sFormulaAux,i+1,length(sFormulaAux)-i);
  i := pos(',',sFormulaAux);
  if i = 0 then
    sData := copy(sFormulaAux,1,length(sFormulaAux)-1)
  else begin
    sData := copy(sFormulaAux,1,i-1);
    sFormulaAux := copy(sFormulaAux,i+1,length(sFormulaAux)-i);
    i := pos(',',sFormulaAux);
    If I = 0 Then I := Length(sFormulaAux);  { Acerta posicao }
    sExato := copy(sFormulaAux,1,I-1);

    sFormulaAux := copy(sFormulaAux,I+1,length(sFormulaAux)-i);
    i := pos(')',sFormulaAux);
    If I = 0 Then I := Length(sFormulaAux);  { Acerta posicao }
    sTipoRetorno := copy(sFormulaAux,1,I-1);
  end;

  sIndexador := Tiraplic(sIndexador);
  sIndexador := PegaValor(sIndexador);

  if sData = 'HOJE' then
     sData := DateToStr(Date)
  else
      sData := PegaValor(sData);

  if sData[1] = '''' then
    sData := copy(sData,2,length(sData)-2);


  if not EhString(sIndexador) then
     sIndexador:=''''+sIndexador+'''';

  {------------------------------------------------------}

  // p:=Tind;

  sSqlAux := 'SELECT '+RuleNumber+' AS IDREGRA, MOECODIGO, MOEPERIODICIDADE '+
             'FROM MOEDA '+
             'WHERE UPPER(MOESIGLA) = UPPER('+sIndexador+')';

  QueryRegraaux.Close;
  QueryRegraaux.Sql.clear;
  QueryRegraaux.Sql.add(sSqlAux);
  QueryRegraaux.Open;


  sAux := QueryRegraaux.FieldByName('MoeCodigo').AsString;
  sPer := QueryRegraaux.FieldByName('MoePeriodicidade').AsString;

  If not FError Then Begin

    If (sExato = '0') or (sExato = '') Then Begin

      If (sPer = 'A') Then
        sSqlAux := 'SELECT '+RuleNumber+' AS IDREGRA, COTVALOR, COTDATA, COTMESREF  '+
                   'FROM COTACAOMOEDA '+
                   'WHERE MOECODIGO = '+sAux+' AND '+
                   '      SUBSTR(COTMESREF,3,4) =''' +copy(sdata,7,4)+''''
      Else If (sPer = 'M') Then
        sSqlAux := 'SELECT '+RuleNumber+' AS IDREGRA, COTVALOR, COTDATA, COTMESREF  '+
                   'FROM COTACAOMOEDA '+
                   'WHERE MOECODIGO = '+sAux+' AND '+
                   '      COTMESREF =''' +Copy(sdata,4,2) + copy(sdata,7,4)+''''
      Else
        sSqlAux := 'SELECT '+RuleNumber+' AS IDREGRA, COTVALOR, COTDATA, COTMESREF  '+
                   'FROM COTACAOMOEDA '+
                   'WHERE MOECODIGO = '+sAux+' AND '+
                   '      COTDATA=TO_DATE(''' +sdata +
                   ''',''DD/MM/YYYY'')';
    End Else Begin
      If (sPer = 'A') or (sPer = 'M') Then
        sSqlAux := 'SELECT '+RuleNumber+' AS IDREGRA, COTVALOR, COTDATA, COTMESREF '+
                   'FROM COTACAOMOEDA '+
                   'WHERE MOECODIGO = '+sAux+' AND '+
                   '      SUBSTR(COTMESREF,3,4)||SUBSTR(COTMESREF,1,2)<=''' +
                   Copy(sdata,7,4) + Copy(sdata,4,2) +
                   ''' ORDER BY COTDATA DESC'
      Else
        sSqlAux := 'SELECT '+RuleNumber+' AS IDREGRA, COTVALOR, COTDATA, COTMESREF '+
                   'FROM COTACAOMOEDA '+
                   'WHERE MOECODIGO = '+sAux+' AND '+
                   '      COTDATA<=TO_DATE(''' +sdata +
                   ''',''DD/MM/YYYY'') ORDER BY COTDATA DESC'

    End; { If (sExato = '0') }

    QueryRegraaux.Close;
    QueryRegraaux.Sql.clear;
    QueryRegraaux.Sql.add(sSqlAux);
    QueryRegraaux.Open;

    If (sTipoRetorno = '1') And (QueryRegraaux.IsEmpty) Then Begin
      Result := '';
      Exit;
    End;

    If ( sTipoRetorno = '2' )
    Then Result := QueryRegraaux.FieldByName('COTDATA').AsString
    Else Result := FloatToStr(QueryRegraaux.FieldByName('COTVALOR').AsFloat);

  End; { If not FError }

End;

function  TRegra.TotRegs : Integer;
begin
  Result := FQueryIn.RecordCount;
end;

{******************************************************************************}
{ Exime uma mensagem com o Conteudo de uma Variavel da Regra                   }
{------------------------------------------------------------------------------}
Procedure TRegra.ExibeMsg(Msg,Variavel:String);
Begin
   // SOL 136806 Kintana 820407
   while length(Msg + ' ' + Variavel) < length('Mensagem do Regra - Regra: '+ FruleName + '   Passo: ' + FPassonumber) + 15 do
     begin
        Variavel := Variavel + ' ';
     end;

     Variavel := Pegavalor(Variavel);
     MsgDlgRegra(Msg + ' ' + Variavel, 'Mensagem do Regra - Regra: '+ FruleName + '   Passo: ' + FPassonumber, mtCustom, [MbOk], 0);
   // SOL 136806 Kintana 820407
End;

function tregra.extrair:string;
var
  i,ini,tam:integer;
  texto,sini,stam:string;
begin
  FError := False;
  i := pos(',',sFormulaAux);
  texto := copy(sFormulaAux,9,i-9);
  sFormulaAux := copy(sFormulaAux,i+1,length(sFormulaAux)-i);
  i := pos(',',sFormulaAux);
  sini := copy(sFormulaAux,1,i-1);
  sFormulaAux := copy(sFormulaAux,i+1,length(sFormulaAux)-i);
  i := pos(')',sFormulaAux);
  stam := copy(sFormulaAux,1,i-1);
  sini:=pegavalor(sini);
  stam:=pegavalor(stam);

  tam:=strtoint(stam);
  ini:=strtoint(sini);
  texto:=pegavalor(texto);
  Result:=copy(texto,ini,tam);
end;

{******************************************************************************}
{ Formula PARADATA                                                             }
{  Com o Parametro OPC "D" transforma ANO/MES em data (DD/MM/YYYY) com dia 01  }
{  Com o Parametro OPC "M" transforma data (DD/MM/YYYY) em ANO/MES             }
{------------------------------------------------------------------------------}
Function TRegra.PARADATA(pData:String):String;
Var
  I:Integer;
  sData, sAno, sMes, OPC:String;
Begin
  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }

  { Retira Nome da Formula }
  FError := False;

  { Pega o ultimo parametro, Tipo de conversão }
  OPC := Copy(pData,Length(pData)-1,1);

  I := Pos(')',pData);
  If I = 0 Then
    sdata := pdata
  Else
    sData := Copy(pData,10,I-12);

  I := Pos('/',pData);

  If I = 0 Then
    sdata := PegaValor(sData);

  { Fim da Decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Tranforma as datas }
  If OPC ='D' Then Begin            { ANO/MES = DD/MM/YYYY com DD 01 }
    I    := Pos('/',sdata);
    sano := Copy(sData,1,I-1);
    smes := Copy(sData,I+1,Length(sData));
    Result:='01/'+sMes+'/'+sAno;
  End Else Begin                    { Data DD/MM/YYYY em ANO/MES     }
    sAno  := Copy(sData,7,4);
    sMes  := Copy(sData,4,2);
    Result:= sAno+'/'+sMes;
  End;

end;

{******************************************************************************}
Function TRegra.TrazValor(texto:string):string;
var
  i:integer;
  //stabela,
  stipodado,ssqlaux,scond,sorder,nlinha,snometab,sx,sn,sValorCampo:string;
begin
  FError := False;
  i := pos(',',sFormulaAux);
  snometab := copy(sFormulaAux,11,i-11);
  sFormulaAux := copy(sFormulaAux,i+1,length(sFormulaAux)-i);
  i := pos(',',sFormulaAux);
  if i > 0 then begin
     sx := copy(sFormulaAux,1,i-1);
     sFormulaAux := copy(sFormulaAux,i+1,length(sFormulaAux)-i);
     i := pos(')',sFormulaAux);
     sn := copy(sFormulaAux,1,i-1);
  end else begin
      i := pos(')',sFormulaAux);
      sx := copy(sFormulaAux,1,i-1);
      sn:='0';
  end;
  sNomeTab:=''''+pegavalor(sNomeTab)+'''';
  sx:=pegavalor(sx);
  sn:=''''+pegavalor(sn)+'''';

  nlinha:=pegavalor('NUMLINHA');

  if sn='''0''' then
     sn:=''''+nlinha+''''
  else begin
       sn := copy(sn,2,length(sn)-2); //Tira os plics
       sn:=inttostr(strtoint(sn)+strtoint(nlinha));
  end;

  sCond := ' = ';
  sOrder := '';

  sSqlAux :=     'SELECT IDTIPODADO '+
                 'FROM CAMPOTABGENER '+
                 'WHERE CODTABELA = '+sNomeTab+' AND '+
                 '      CODCAMPO  = '''+UpperCase(sx)+'''';
  QueryRegra.Close;
  QueryRegra.Sql.clear;
  QueryRegra.Sql.add(sSqlAux);
  QueryRegra.Open;
  sTipoDado := QueryRegra.FieldByName('IdTipoDado').AsString;

  if not FError then begin
    if sTipoDado = '1' then begin
       sValorCampo := ' To_Number(Valor) ';
    end else begin
       if sTipoDado = '2' then begin
            sValorCampo := ' Valor ';
            sn := copy(sn,2,length(sn)-2); //Tira os plics
       end else begin
            if sTipoDado = '3' then begin
                 sValorCampo := ' Valor ';
            end;
       end
    end;
    if not FError then begin
        //try
       sSqlAux :='SELECT VALOR '+
                 'FROM VALTABGENER '+
                 'WHERE CODTABELA = '+sNomeTab+' AND '+
                 '      CODCAMPO  = '''+UpperCase(sx)+''' AND '+
                 '      NUMLINHA  = '+sn;
       QueryRegra.Close;
       QueryRegra.Sql.clear;
       QueryRegra.Sql.add(sSqlAux);
       QueryRegra.Open;
       Result := QueryRegra.FieldByName('VALOR').AsString;

        (*except
          FError := True;
          Result := '-6030';
          end; *)
    end;
  end;
end;


{******************************************************************************}
Function TRegra.BuscaValor(Texto:String):String;
Var
  I,Tab:Integer;
  sNomeTab,sX,sN : string;
Begin
  FError   := False;
  Texto    := Copy(Texto,12,Length(Texto)-12);
  I        := Pos(',',Texto);
  sX       := Copy(Texto,1,i-1);
  Texto    := Copy(Texto,I+1,Length(sFormulaAux));
  sN       := Texto;
  sNomeTab := FTabbiometrica;
  sX       := Pegavalor(sX);
  sN       := Pegavalor(sN);

  Tab := 0;
  While Tab <= 20 Do Begin
    If sNomeTab = NomeStrGrdTab[Tab] Then
      Break;
    Inc(Tab);
  End;

  If Tab = 21 Then
    CarregaQueryLinhas(sNomeTab,Tab)
  Else
    NomeStrGrdTab[Tab]:=sNometab;

  For I :=0 To 100 Do
    If UpperCase(StrGrdTab[I,0,Tab]) = UpperCase(sX) Then
      Break;

  Result:=StrGrdTab[i,strtoint(sn),tab];
end;


{******************************************************************************}
Function TRegra.DiaMesAno(Tipo:Str3):String;
Var
  fim, tam, coderro : integer;
  sData  : String;
  fData  : Real;
  dData  : TDateTime;
Begin
  fim:=pos(')',sFormulaAux);
  tam:=fim-5;
  sData:=copy(sFormulaAux,5,tam);
  flagcampo:=0;
  sData:=pegavalor(sData);
  val(sData,fdata,coderro);
  If CodErro = 0 Then
    dData := fdata
  Else
    dData := StrToDate(sData);

  sData := FormatDateTime('DD/MM/YYYY',dData);

  If Tipo = 'DIA' Then
    Result:=Copy(sData,1,2);

  If Tipo = 'MES' Then
    Result:=Copy(sData,4,2);

  If Tipo = 'ANO' Then
    Result:=Copy(sData,7,Length(sData));

End;

{******************************************************************************}
Function TRegra.TestaData(DataIn:String):TDateTime;
Begin
  Try
    Result:=StrToDate(DataIn);
  Except
    Result:=StrToDate('01/01/01');
  End;
End;


//******************************************************************************
// Rotina de Tatamento de Erros da Regra
Procedure TRegra.TrataErros(Sender:TObject;Erro:Exception);
Var
  sRegras : String;
Begin
  { Volta o Separador Decimal padrao }
  DecimalSeparator := Separador;
  { Mostra mensagem de Erro e pergunta se deseja ver os passos da regra }
  If  MsgDlgRegra('Regra '+RuleName+' '+
             'não concluida, o passo '+aAlgorRegra[iAlgoratual]+' contem um erro. '+#13+
             'Mensagem do sistema: '+ #13 + #13 +
              Erro.Message+#13+#13+
             'Deseja visualizar o passo ? ','Regra', mtError,[mbYes, mbNo],0) = mrYes
  Then Begin
    { Mostra Formulario de Passos }
    ExibePasso;
  End;
  Application.OnException:= ProcErro;
  FError := True;
  Tabuabio:='';
end;


Function tRegra.ExecutaOutraRegra(OPC:char):string; {opc: E- empilha, D - desempilha}
//var
//  bfim     : Boolean;
//  i: Integer;
//  sSql     : String;
begin
  ShowMessage('ATENÇÃO, ESTA REGRA ESTA USANDO UMA FUNCAO QUE FOI DESATIVADA!'+#13+
              'FAVOR COMUNICAR A GETIF.');
  Exit;

end;


//******************************************************************************
// Formula: Executa Calculos Aritméticos diretos (1+2+45*5-2/2) e Funcoes da
// Planilha como: TRUNC, MIN, MAX, RAIZ(SQRT) e Etc....
Function tRegra.ATUARIAL(Var sformula:string):string;
Var
  letra : string[1];
  Vazio : Boolean;
begin
  FError := False;

// Decodifica a Formula
  sFormula := copy(sformula,9,length(sFormula)-8);
  sformulaP := '';
  formula1.row := 1;
  formula1.col := 1;

  palavra:='';
  letra:='';

  flgpot:=false;
  Repeat
    If pos(letra,'+-*/(){}[],^')<> 0 then begin
      If palavra <> '' then begin
        If not(tratapalavra) then begin
          sformulaP:=sformulaP+'a'+inttostr(formula1.row);
          formula1.row :=formula1.row +1;
        End;
        palavra:='';
      End;
      if letra=',' then
        letra:=';';
      sFormulaP:=sFormulaP+letra;
      letra:='';
    End;
    If letra=',' then
      letra:=';';
    palavra:=palavra+letra;
    letra:=copy(sformula,1,1);
    sFormula := copy(sFormula,2,length(sFormula)-1);
  until sformula='';

  If Palavra <> '' then begin
    Palavra := Pegavalor(palavra);
    Vazio := False;
    If Palavra = '' then begin
      Vazio := True;
      Palavra := '0';
    End;

    formula1.number:=StrToFloat(Palavra);
    sformulaP:=sformulaP+'a'+inttostr(formula1.row);
    formula1.row := formula1.row +1;

    If Vazio then
      Palavra := '';

    palavra:='';
  End;
// Preenche Planilha e Executa Calculo
  Formula1.Row := Formula1.Row +1;
  sFormulaP    := sFormulaP + letra;
  DecimalSeparator :='.';
  Formula1.Formula := sformulaP;

// Atribui e Formata Resultado
  Result:=Formula1.Text;
  Result:=TrocaVirgulaPonto(Result);

  { Estava ocorrendo erro de memória em regras muito complexas }
  { por isso decidimos recriar o componente a cada execução    }
  Formula1.ClearRange(1,1,256,2,1);
  Formula1.HeapMin;
end;


//******************************************************************************
Function tRegra.SUBTRAIR(Input:Str7;Qtd:integer):string;
var
  Ano,Mes  : Integer;
  Separador: String[2];
begin

  Ano := strToInt(Copy(Input,1,4));
  Mes := StrToInt(Copy(Input,6,2));

  while Qtd > 0 do begin
    if Mes=1 then begin
      Mes:=12;
      Ano:=Ano-1;
    end else
      Mes:=Mes-1;

    Qtd:=Qtd-1;
  end;

  if mes < 10 then
    separador:='/0'
  else
    separador:='/';

  Result := IntToStr(Ano)+Separador+IntToStr(Mes);
end;

Function tRegra.somar(input:str7;qtd:integer):string;
var
  ano,mes:integer;
  separador:string[2];
begin
    ano:=strtoint(copy(input,1,4));
    mes:=strtoint(copy(input,6,2));
    while qtd > 0 do begin
          if mes=12 then begin
             mes:=1;
             ano:=ano+1;
          end else
              mes:=mes+1;
          qtd:=qtd-1;
    end;
    if mes < 10 then
       separador:='/0'
    else
       separador:='/';

    result:=inttostr(ano)+separador+inttostr(mes);
end;

Function tRegra.subtrairmeses(smesmaior,smesmenor:str7):integer;
var
  anomaior,mesmaior :integer;
  Aux:integer;
  separador:string[2];
begin
    if (smesmaior= '') or (smesmenor='') then begin
       Result := 0;
       exit;
    end;
    anomaior:=strtoint(copy(smesmaior,1,4));
    mesmaior:=strtoint(copy(smesmaior,6,2));
    aux:=0;
    While smesmaior <> smesmenor do begin
          mesmaior:=mesmaior-1;
          if mesmaior = 0 then begin
             anomaior := anomaior - 1;
             mesmaior := 12;
          end;

          if mesmaior < 10 then
             separador:='/0'
          else
             separador:='/';
          smesmaior:=inttostr(anomaior)+separador+inttostr(mesmaior);
          aux:=aux+1;
    end;
    result:=aux;
end;

//******************************************************************************
// Transforma uma Data (String) em Ano/Mes (String), Incrementando ou
// decrementando numero de meses
Function tRegra.DataParaMes(DataIn:String;IncMes:Integer;OPC:Char):Str7;
var
  sMes, Separador :  String[2];
  sAno : String[4];
  Mes, Ano : Integer;
begin
// Caso Data Vazia Sai
  if datain = '' then exit;
// Decodifica a Data, Guarda Mes / Ano
  sMes:= Copy(DataIn,4,2);
  sAno:= Copy(DataIn,7,4);

  Ano := StrToInt(sAno);
  Mes := StrToInt(sMes);

// Caso deseje Incrementar numero de Meses
  If OPC ='I' Then Begin
    While IncMes > 0 Do Begin
      If Mes = 13 Then Begin
        Mes := 1;
        Ano := Ano+1;
      End;
      IncMes := IncMes-1;
      Mes    := Mes+1;
    End
  End Else Begin

// Caso deseje Decrementar numero de Meses
    While IncMes < 0 do begin
      If Mes = 0 Then Begin
        Mes := 12;
        Ano := Ano-1;
      End;
      IncMes := IncMes+1;
      Mes    := Mes-1;
    End;
  End;

// Acerta # de Casas do Mes
  If Mes < 10 Then
    Separador:='/0'
  Else
    Separador:='/';

// Seta Resultado
  Result:=IntToStr(Ano)+Separador+IntToStr(Mes);
end;


{******************************************************************************}
{ TrataPalavra, Quando formula ARITM descobre a Função a executar.             }
{------------------------------------------------------------------------------}
Function TRegra.TrataPalavra:Boolean;
Var
  svalor : string[40];
Begin
  If uppercase(palavra)='MIN' Then Begin
    sFormulaP:=SformulaP+'Min';
    result:=true;
    Exit;
  End;
  If uppercase(palavra)='LN' Then Begin
    sFormulaP:=SformulaP+'LN';
    result:=true;
    Exit;
  End;
  If uppercase(palavra)='MAX' Then Begin
    sFormulaP:=SformulaP+'Max';
    result:=true;
    Exit;
  End;
  If uppercase(palavra)='POT' Then Begin
    flgpot:=true;
    result:=true;
    Exit;
  End;
  If uppercase(palavra)='RAIZ' Then Begin
    sFormulaP:=SformulaP+'Sqrt';
    result:=true;
    Exit;
  End;
  If uppercase(palavra)='MOD' Then Begin
    sFormulaP:=SformulaP+'Mod';
    result:=true;
    Exit;
  End;
  If uppercase(palavra)='TRUNC' Then Begin
    sFormulaP:=SformulaP+'Trunc';
    result:=true;
    Exit;
  End;
  If uppercase(palavra)='INT' Then Begin
    sFormulaP:=SformulaP+'Int';
    result:=true;
    Exit;
  End;

  sValor := PegaValor(palavra);
  
  If sValor=palavra Then Begin
    sFormulaP:=SformulaP+trocaseparador(sValor);
    result:=true
  End Else Begin
    formula1.number:=strtofloat(sValor);
    result:=false
  End;

End;

//******************************************************************************
// Formula, ?
Function Tregra.PRO:Integer;
Type
  Indice = Record
             Nome:string;
             Data:string;
           End;

  tFator = Record
             Fator : Extended;
             fatoracum : Extended;
             Mes : String;
           End;

Var
  tabindices : Array [0..20]  Of Indice;
  tabfator   : Array [0..700] Of tFator;
  TabRubricas : Array[0..20]  Of String; 
  FormulaLoc, palavra, sdata, sdatafim, sdataini, sDataref, sCorrecao,
  vMesAux, sMesDataBase, smesbase, sRubrica, sTeto, sAux : string;
  sano, wAnoMesRubrica : String[4];
  Letra, FlgGrava : string[1];
  wVal, p, J, I, wNumVezesRubrica, wVal1, wValOld, wIdMotivo : integer;
  X, W, LinOK, vDif, Linha, vAno, vMesBas, vMesRef, moedabase, vTipoCalc : longint;
  vFatorAux, vFatUlt, vIni, vFator, FatAcum, vAcum, FatorAux, valorsal, fatorant : double;
  sAchou, vAchou, flgnome, flginc, flgmoedanova, ACHOU : boolean;
  bDesmembrouRubricas : boolean;
  sRubricaAux         : string;
Begin
//------------------------------------------------------------------------------
// Decodifica Formula

  For  I := 0 to 20 Do Begin
    TabIndices[I].Nome := '';
    TabIndices[I].Data := '';
  End;

  FormulaLoc:=Copy(sFormulaaux,5, Length(sFormulaAux)-5);
  P:=0;
  Letra  :='';
  Palavra:='';

// Guarda Rubrica
  I:=Pos('[',FormulaLoc);
  sRubrica:=Copy(FormulaLoc,1,I-1);
  FlgNome :=True;
  FlgInc  :=False;

//Guarda Indices
  FormulaLoc := Copy(FormulaLoc,I+1,Length(FormulaLoc)-I);
  Repeat
    If Pos(Letra,',') <> 0 Then Begin
      If Palavra <> '' Then Begin
        If FlgNome Then Begin
          TabIndices[P].Nome := PegaValor(palavra);
          FlgNome := False;
        end else begin
          TabIndices[P].Data := DataParaMes(PegaValor(Palavra),0,'I');
          FlgNome:= True;
          FlgInc := True;
        end;
        Palavra := '';
      end;
      If FlgInc Then Begin
        P := P+1;
        FlgInc := False;
      End;
      Letra:='';
    end;

    Palavra:= Palavra+Letra;
    Letra  := Copy(FormulaLoc,1,1);
    FormulaLoc := Copy(FormulaLoc,2,length(FormulaLoc)-1);
  Until letra=']';

  Palavra:=Palavra;
  TabIndices[P].Data:=DataParaMes(PegaValor(Palavra),0,'I');

// Guarda Percentual para correção apos a database
  I := Pos(',',FormulaLoc);
  sCorrecao := copy(FormulaLoc,1,i-1);
  sCorrecao := pegavalor(sCorrecao);
  sCorrecao := TrocaCaracter(sCorrecao,',','.');
  sCorrecao := FloattoStr((StrtoFloat(sCorrecao)/100)+1);
{
  Acum := 1;
  if sMesDataBase <> '' then
    vAcum := StrtoFloat(sCorrecao);
}

// Guarda Mes da Data Base
  FormulaLoc:=Copy(FormulaLoc,i+1,length(FormulaLoc));
  I := Pos(',',FormulaLoc);
  sMesbase  := Copy(FormulaLoc,1,i-1);
  sMesbase  := PegaValor(smesbase);
  FormulaLoc:= Copy(FormulaLoc,i+1,length(FormulaLoc));

// Guarda Teto limitador do Provento
  I := Pos(',',FormulaLoc);
  sTeto := Copy(FormulaLoc,1,i-1);
  sTeto := PegaValor(sTeto);

// Guarda Data de Inicio de calculo dos proventos
  FormulaLoc:=Copy(FormulaLoc,I+1,Length(FormulaLoc));
  I := Pos(',',FormulaLoc);
  sDataref := Copy(FormulaLoc,1,i-1);
  sDataref := PegaValor(sDataREF);
// Processa esta data
  vTipoCalc := 0;
  if sMesBase <> '' then begin
    vMesBas := StrtoInt(sMesBase);
    vMesRef := StrtoInt(Copy(sDataRef,4,2));
    vAno := StrtoInt(Copy(sDataRef,7,4));
    if vMesBas > vMesRef then
      vAno := vAno - 1;
    if Length(InttoStr(vMesBas)) = 1 then
      sMesBase := InttoStr(vAno)+'/0'+InttoStr(vMesBas)
    else
      sMesBase := InttoStr(vAno)+'/'+InttoStr(vMesBas);
    sMesDatabase := sMesBase;
  end;

// Guarda Flag de Gravação, 0 não - 1 Grava
// Atenção pode ou não haver mais parametros
  FormulaLoc := Copy(FormulaLoc,i+1,length(FormulaLoc));
  I := Pos(',',FormulaLoc);
  If I = 0 then begin
    FlgGrava  := PegaValor(FormulaLoc);
    vTipoCalc := 0;
  End else begin
// Caso haja mais parametros
    FlgGrava := Copy(FormulaLoc,1,I-1);
    FlgGrava := PegaValor(FlgGrava);
// Guarda Tipo de Correção - 0 ou Nada - Calucla normalmente,  1 - Calcula com Descontos
    FormulaLoc := Copy(FormulaLoc,i+1,Length(FormulaLoc));
    If FormulaLoc <> '' Then Begin
      Try
        vTipoCalc := StrtoInt(PegaValor(FormulaLoc));
      Except
        vTipoCalc := 0;
      End;
    End;
  End;

// Final da Decodificação da Formula
//------------------------------------------------------------------------------

// Inicia Vaiaveis
  sdata := sdataref;
  sdata := DataParaMes(sdata,0,'I');
  sano  := sdata;
  sdatafim  := sdata;
  moedabase := 0;
  flgmoedanova := False;
  TabFator[0].fatoracum:=1;
  I:=1;
  P:=0;
  FatorAnt:=1;
  sData:=SUBTRAIR(sdata,1);

  wValOld := 1;
  While (I <= 48) And (tabindices[p].nome<>'') Do Begin
    if tabindices[p+1].nome='' then
      sdatafim:=subtrair(sdata,48)
    else
      sdatafim:=tabindices[p+1].data;

    With QueryRegraAux Do Begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT '+
              RuleNumber+' AS IDREGRA, C.COTVALOR, SUBSTR(C.COTMESREF,3,4)||''/''||SUBSTR(C.COTMESREF,1,2) AS MES,  '+
              '  TO_DATE(C.COTMESREF,''MMYYYY'') AS COTMESREF '+ 
              'FROM   '+
              '  MOEDA M, COTACAOMOEDA C  '+
              'WHERE  '+                                          { OBS:                    }
              '  M.MOESIGLA  = '''+TabIndices[P].Nome+''' AND '+  { sData é a Data Maior    }
              '  M.MOECODIGO = C.MOECODIGO                AND '+  { sDataFim a Menor        }
              '  SUBSTR(C.COTMESREF,3,4)||SUBSTR(C.COTMESREF,1,2) <= '+ QuotedStr(Copy(sdata,1,4)   + Copy(sdata,6,2))   + ' AND '+
              '  SUBSTR(C.COTMESREF,3,4)||SUBSTR(C.COTMESREF,1,2) >= '+ QuotedStr(Copy(sdatafim,1,4)+ Copy(sdatafim,6,2))+ ' '+
              'ORDER BY '+
              '  COTMESREF DESC'); 
      Open;
    End;

    if (vTipoCalc = 1) and (sMesDatabase <> '') then begin
      if sMesDatabase > sData then
        sData := sMesDatabase;
    end;

    vDif := SubtrairMeses(sData, sDataFim);
    if wValOld = 1 then begin
      wVal1 := queryregraaux.recordcount;
      if vDif > wVal1 then
        wVal1 := vDif;
    end else begin
      wVal1 := queryregraaux.recordcount + wValOld;
      if vDif > queryregraaux.recordcount then
        wVal1 := vDif + wValOld;
     end;
// Inicia o Vetor
    vAchou := False;
    for x := wValOld to wVal1 do begin
      if not vAchou then begin
        vAchou := True;
      end else begin
        sData := Subtrair(sData,1);
      end;
      tabfator[x].Mes := sData;
      tabfator[x].fator:= 1;
      tabfator[x].fatoracum:=1;
    end;

    wValOld := wVal1+1;


// Preenchendo o Vetor com os dados da query anterior (Fatores)
    queryregraaux.First;
    while not queryregraaux.Eof do begin
      vMesAux := queryregraaux.fieldbyname('mes').AsString;
      for j := 1 to 700 do begin
        if TabFator[j].Mes = vMesAux then begin
          tabfator[j].fatoracum := 1;
          tabfator[j].fator     := queryregraaux.fieldbyname('COTVALOR').asfloat/100+1;
          Break;
        end;
        if TabFator[j].Mes = '' then
          Break;
      end;
      queryregraaux.Next;
    end;
// Atualizar o Valor do MesDatabase
    if (vTipoCalc = 1) and (sMesDatabase <> '') then
      for i := 1 to 700 do
        if TabFator[i].Mes = sMesDataBase then begin
          TabFator[i].fator := StrtoFloat(sCorrecao);
          Break;
        end;

    if sMesDatabase = '' then // Faz a acumulação dos fatores sem a database
      for x := 1 to 700 do
        tabfator[x].fatoracum:=(tabfator[x].fator*tabfator[x-1].fatoracum)
    else begin //Faz a acumulação dos fatores com a database
      if vTipoCalc = 0 then begin
        vAcum := 1;
        vFator := 1;
        for x := 1 to 700 do begin
          if sMesDatabase = tabfator[x].Mes then
            LinOK := x;
          if sMesDatabase >= tabfator[x].Mes then begin
            tabfator[x].fatoracum := (vAcum*vFator);
            vAcum := tabfator[x].fatoracum;
            vFator := tabfator[x].fator;
          end;
        end;
        vIni := 1;
        for x := LinOk - 1 downto 1 do begin
          tabfator[x].fatoracum:=(tabfator[x].fator*vIni);
          vIni := tabfator[x].fatoracum;
        End;
      End;
    End;
    Inc(P);

  End;// While

//----------------

  If vTipoCalc = 1 then begin
// Faz a Acumulação dos Descontos (DataBases)
    vFatUlt := 1;

    for x := 1 to 700 do begin
      if Copy(TabFator[x].Mes,6,2) = Copy(sMesDatabase,6,2) then begin
        TabFator[x].FatorAcum := vFatUlt;
        vFatUlt := vFatUlt * TabFator[x].Fator;
      end;
    end;

       //Faz a acumulação dos outros fatores
    vFatUlt := 1;
    for x := 700 downto 1 do begin
      if Copy(TabFator[x].Mes,6,2) = Copy(sMesDatabase,6,2) then
        vFatUlt := 1;
      if (Copy(TabFator[x].Mes,6,2) <> Copy(sMesDatabase,6,2)) and
         (TabFator[x].Mes <> '')
      then begin
        vFatUlt := vFatUlt * TabFator[x].Fator;
        TabFator[x].FatorAcum := vFatUlt;
      end;
    end;

    vFatUlt := 1;
    for x := 700 downto 1 do begin
      if TabFator[x].Mes <> '' then begin
        if Copy(TabFator[x].Mes,6,2) = Copy(sMesDatabase,6,2) then
          vFatUlt := TabFator[x].FatorAcum
        else
          TabFator[x].FatorAcum := vFatUlt / TabFator[x].FatorAcum;
      end;
    end;
  end;

//---------------

  vAcum := 1;
  if sMesDataBase <> '' then
    vAcum := StrtoFloat(sCorrecao);

  sData:=sDataref;
  sdata:=dataparames(sdata,0,'I');
  sdataini :=sdata;

  sdata:=subtrair(sdata,48);

  achou:=false;

  bDesmembrouRubricas := False;
  sRubricaAux         := sRubrica;
  vet                 := 0;
  while not bDesmembrouRubricas do
  begin
     i   := Pos(',',sRubricaAux);
     vet := vet + 1;
     if i <= 0
     then begin
        TabSumSRB[vet]      := sRubricaAux;
        bDesmembrouRubricas := True;
     end
     else begin
        TabSumSRB[vet]      := Copy(sRubricaAux,1,i-1);
        sRubricaAux         := Copy(sRubricaAux,i+1,Length(sRubricaAux));
     end;
  end;

// Teste se Campos Obrigatórios foram passados
  try
    fQueryin.fieldbyname('idpessoa').AsInteger;
  except
    begin
      MsgDlgRegra('Falta o Campo IDPESSOA no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
      Result := -1;
      Exit;
    end;
  end;

  try
    fQueryin.fieldbyname('IDPESSJUR').AsInteger;
  except
    begin
      MsgDlgRegra('Falta o Campo IDPESSJUR no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
      Result := -1;
      Exit;
    end;
  end;

// Busca os Salarios que serão Processados, QryPro Declarada no Create do Componente
  With qrypro do begin
    Close;
      parambyname('TETO').AsString    := sTeto;
      parambyname('PESSOA').AsInteger := fQueryin.fieldbyname('IDPESSOA').AsInteger;
      parambyname('MESINI').AsString  := sData;
      parambyname('MESFIM').AsString  := sDataini;
      parambyname('PESSJUR').AsInteger:= fQueryin.fieldbyname('IDPESSJUR').AsInteger;

      If Pos(',', sRubrica) = 0 Then Begin
        { Com uma rubrica, volta lógica com parametros e preenche }
        SQL.Strings[7] := '  AND (H.CODPROVDESC IN  (:RUBRICA))  ';
        parambyname('RUBRICA').AsString := sRubrica;
      End Else Begin
        { Monta linha para mais de uma rubrica }
        sAux    := sRubrica;
        sRubrica:= '';
        For I := 0 To 20 Do Begin
          TabRubricas[I] := '';
          { Busca e acerta poscionamento da rubrica }
          W := Pos(',', sAux);
          If W = 0 Then
            W := Length(sAux)
          Else
            W := (W-1);
          { Guarda Rubrica }
          TabRubricas[I] := QuotedStr(Copy(sAux, 1, W));
          sRubrica       := sRubrica+TabRubricas[I]+',';
          { Acerta linhas da Rubrica }
          sAux := Copy(sAux, (W+2), Length(sAux));
          { Caso tenha acabado as rubricas sai }
          If sAux = '' Then Break;
        End; { For }
        sRubrica := Copy(sRubrica,1,(Length(sRubrica)-1));

        If QryPro.Params.FindParam('RUBRICA') <> Nil Then
          QryPro.Params.RemoveParam(QryPro.Params[5]);

        SQL.Strings[7] := '';
        SQL.Strings[7] := ' AND (H.CODPROVDESC IN  ('+ sRubrica +') ) ';
        Prepare;
      End;
    Open;
  End;

// Guarda o Total de aparições desta Rubrica no Historico, nestas condicoes
  wNumVezesRubrica := QryPro.RecordCount;
// Processa os 48 Ultimos Salarios
  I:=1;
  wAnoMesRubrica := QryPro.fieldbyname('MES').AsString;

  while I <= 48 do begin

    sdataini := subtrair(sdataini,1);
    sdata    := qrypro.fieldbyname('MES').AsString;

    if sdataini = sdata then begin

      if qrypro.fieldByname('VALORPROVENTO').asfloat < qrypro.fieldByname('COTVALOR').asfloat then
        valorsal := qrypro.fieldByname('VALORPROVENTO').asfloat
      else
        valorsal := qrypro.fieldByname('COTVALOR').asfloat;

{Ini}
      vFator := 1;
      sAchou := False;
      for j := 0 to 700 do begin
        if sDataIni = TabFator[j].Mes then begin
          sAchou := True;
          vFator := TabFator[j].FatorAcum;
          Break;
        end;
      end;

      Case vTipoCalc of
        0:begin
            if (sdataini > sMesDatabase) and (sMesDatabase <> '') then begin
              vFatorAux := vAcum / vFator;
            end else begin
              if sAchou then begin
                vFatorAux := vFator * vAcum;
              end else begin
                vFatorAux := 1 * vAcum;
              end;
            end;
          end;

        1:vFatorAux := vFator;

      end;
{Fim}

      TabSRB[vet,i] := vFatorAux * valorsal;

      qrypro.next
    end else
      tabSRB[vet,i] := 0;

    TabMes[i] := sdataini;
    TabIndiceAcum[i] := FatAcum;

    Inc(I);

  end;

  { Retorna o Numero de Vezes que esta Rubrica Apareceu no Historico nestas condicoes }
  Result := wNumVezesRubrica;

  { Fecha Querys }
  QryPro.Close;
  QueryRegraAux.Close;
end;

//******************************************************************************
// Formula:
Function tRegra.NP:integer;
Var
  tabmedia:array [1..20] of string[20];
  sFormula,sNum,palavra,stipo :string;
  A,I,X,Y,Vet,num,Nrub, wInt,
  nRubCalc,validosNum :integer;
  letra,flgGrava:string[1];

  iAux : integer;
begin
//------------------------------------------------------------------------------
// Decodifica Formula
  For i := 1 to 20 do
    tabmedia[i] := '';

  nRub := 0;
  sFormula:=copy(sFormulaAux,5,length(sformulaaux)-5);
  Letra:= '';

  Repeat
    If letra =',' then begin
      Inc(nRub);
      TabMedia[nRub]:=PegaValor(Palavra);
      Palavra:='';
    End Else
      Palavra:=Palavra+Letra;

    Letra   := Copy(sFormula,1,1);
    sFormula:= Copy(sFormula,2,Length(sFormula)-1);
  Until Letra = ']';

  Inc(nRub);
  TabMedia[nRub]:=PegaValor(Palavra);

  I:=Pos(',',sFormula);
  sNum := Copy(sFormula,1,i-1);
  sNum := PegaValor(sNum);
  Num  := StrToInt(sNum);
  sformula:=Copy(sFormula,I+1,Length(sFormula));
  flgGrava:=Copy(sFormula,1,I-1);

  sTipo   := Copy(sFormula,I+1,Length(sFormula));

  nRubCalc:= 0;

  For Y:=1 To nRub Do Begin

// Grava na memoria de calculo
    If FlgGrava = '1' Then Begin

      If fidcalculo =0 Then Begin
        fidcalculo := LeUltRegistro(nil, 'Calculo');

        With QueryRegraAux Do Begin
          Close;
          SQL.Clear;
          SQL.Add( 'INSERT INTO CALCULO (IDCALCULO) '+
                   'VALUES ('+inttostr(fidcalculo)+')');
          ExecSQL;
        End;

      End;// If


      With QueryRegra Do Begin
        Close;
        SQL.Clear;
        SQL.Add( 'SELECT '+RuleNumber+' AS IDREGRA, IDRUBRICA,IDPESSOA FROM RUBRICAXPESS WHERE UPPER(CODPROVDESC) = '''+
                 UpperCase(TabMedia[Y])+'''');
        Open;
      End;

      With QueryRegraAux Do Begin
        Close;
        SQL.clear;
        SQL.add('SELECT '+RuleNumber+' AS IDREGRA, IDRUBRICA FROM RELRUBPART WHERE IDCALCULO = '''+
                inttostr(fidcalculo)+
                ''' AND IDPESSOA = '''+queryregra.fieldbyname('idpessoa').AsString +
                ''' AND IDRUBRICA = '''+
                queryregra.fieldbyname('idrubrica').AsString+'''');
        Open;
      End;

      If  QueryRegraAux.IsEmpty Then Begin

        With QueryRegraAux Do Begin
          Close;
          SQL.clear;
          SQL.add('INSERT INTO RELRUBPART (IDCALCULO,IDPESSOA,IDRUBRICA) '+
                  'VALUES ('+inttostr(fidcalculo)+','+
                  QueryRegra.FieldByName('IDPESSOA').AsString+
                  ','+QueryRegra.FieldByName('IDRUBRICA').AsString+')');
          ExecSQL;
        End;

      End;

    End;// If

// Fim grava na memoria de calculo
    For X := 1 To 20 Do Begin

      If TabSumSRB[X]=TabMedia[Y] Then Begin
        Vet:=X;
        TabMedia[Y]:=IntToStr(Vet);
        Inc(nRubCalc);
        Break;
      End;

    End; { For X }

  End; { For Y }

  For  wInt := 1 to 48 Do Begin 
    TabProv[wInt] := 0;
  End;

  Y := 48;

  ValidosNum := 0;

  while (y >= 1) do begin

    for a:=1 to nRubCalc do begin
      iAux := strtoint( tabmedia[a] );
      if TabSrb[iAux,y] > 0 then begin
        tabprov[y]:= tabprov[y]+ TabSrb[iAux,y];
      end;
    end;

// Guarda Numero de Salarios de acordo com o tipo desejado .

// Diferentes de ZERO
    if tabprov[y] > 0 then
      Inc(ValidosNum);


    Y:=Y-1;

  end;// While

  if (flgGrava='1') and (fidcalculo <> 0) then begin

    For x:=1 to validosnum do begin
      FidCalculoBenef := LeUltRegistro(nil, 'CalculoBenef');
      With queryregraaux do begin
        Close;
        SQL.Clear;
        SQL.Add('INSERT INTO CALCULOBENEF (IDCALCULO,IDCALCULOBENEF,INDICEACUM,SALARIOVP,MES,TIPOCALCULO,IDREGRA) '+
                'VALUES ('+inttostr(fidcalculo)+','+InttoStr(FidCalculoBenef)+','+
                floattostr(tabindiceacum[x])+','+
                floattostr(tabprov[x])+','''+tabmes[x]+''','''+stipo+''','+FruleName+')');
        ExecSQL;
      End;
    End;

  end;

// Seta Resultado da Formula
  if ValidosNum > Num then
    Result := Num
  else
    Result := ValidosNum;

end;


//******************************************************************************
// Formula: ?
Function tRegra.MED:Double;
Var
  Acm:Double;
  Num, i, j, k, A :Integer;
  SNum : String[10];
  sFlag, sFormula, sFlgInicio : String;
Begin

  //------------------------------------------------------------------------------
  //Decodificação da fórmula
  sFlgInicio := '';
  sFormula := Copy(sFormulaAux,5,Length(sFormulaAux)-5);
  I        := Pos(',',sFormula);
  sNum     := Copy(sFormula,1,I-1);
  sNum     := PegaValor(sNum);
  num      := StrToInt(sNum);
  sFormula := trim( Copy(sFormula,I+1,Length(sFormula)-I) );
  I        := Pos(',',sFormula);
  if i <= 0 then
    sFlag := sFormula
  else
  begin
    sFlag    := copy( sFormula, 1, i - 1 );
    sFormula := trim( Copy(sFormula,I+1,Length(sFormula)-I) );
    if sFormula <> '' then
    begin
      sFlgInicio := sFormula;
    end;
  end;
  //Fim da decodificação da fórmula
  //------------------------------------------------------------------------------

  if sFlgInicio <> '2' then  //sFlgInicio <> 2 -> Começar do primeiro elemento
  begin
    j := Low(tabprov)
  end
  else
  begin                      //sFlgInicio =  2 -> Começar do primeiro elemento com valor
    j := 0;
    for i := Low(tabprov) to High(tabprov) do
    begin
      if tabprov[i] > 0 then
      begin
        j := i;
        break;
      end;
    end;
    if j = 0 then
    begin
      Result := 0;
      exit;
    end;
  end;

  k := j + Num - 1;

  //Previne que não passe do tamanho do array
  if k > High( tabprov ) then
    k := High( tabprov );

  acm := 0;
  a := 0;

  //Divide pelo número de proventos (independentemente de estarem zerados ou não)
  //iniciando pelo primeiro item com valor.
  if sFlag = '0' then
  begin
    for i := j to k do
      acm := acm + tabprov[i];

    if Num > 0 then
      Result := acm / Num
    else
      Result := 0;
  end;

  //Divide pelo número de proventos maiores que 0, iniciando pelo primeiro item com valor,
  //até o máximo de "Num" elementos iniciando em j.  
  if sFlag = '1' then
  begin
    a := 0;
    for i := j to k do
    begin
      if tabprov[i] > 0 then
      begin
        acm := acm + tabprov[i];
        inc( a );
      end;
    end;

    if a > 0 then
      Result := Acm / a
    else
      Result := 0;
  end;


  //Divide pelo número de proventos maiores que 0, iniciando pelo primeiro item com valor,
  //até completar uma quantidade "Num" de elementos ou acabar o array.
  if sFlag = '2' then
  begin
    for I := j to High( TabProv ) do
    begin
      if tabprov[i] > 0 then
      begin
        acm := acm + tabprov[i];
        inc( a );
      end;
      if a >= Num then
        break;
    end;

    if a > 0 then
      Result := Acm / a
    else
      Result := 0;
  end;

end;


//******************************************************************************
// Formula, Retorna a Deferencia em Meses entre duas Datas
Procedure TRegra.DIFMESES;
Var
  vDt1, vDt2, vDt3, FormulaAux : String;
  vTipo, vMetodo, i : LongInt;
  vDias, vRes : Extended;
begin

//------------------------------------------------------------------------------
// DECODIFICA A FORMULA

  FormulaAux := copy(sFormulaaux,10,length(sFormulaAux));
  FormulaAux := Copy(FormulaAux, 1, Length(FormulaAux)-1);

  i := Pos(',',FormulaAux);
  vDt1 := Copy(FormulaAux,1,i-1);
  vDt1 := PegaValor(vDt1);
  FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux));

  i := Pos(',',FormulaAux);
  if i = 0 then begin
    vDt2 := PegaValor(FormulaAux);
    vTipo := 0;
    vMetodo := 1;
  end else begin
    vDt2 := Copy(FormulaAux,1,i-1);
    vDt2 := PegaValor(vDt2);
    FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux));
    i := Pos(',',FormulaAux);
    if i = 0 then begin
      try
        vTipo := StrtoInt(PegaValor(FormulaAux));
      except
        vTipo := 0;
      end;
      vMetodo := 1;
    end else begin
      try
        vTipo := StrtoInt(PegaValor(Copy(FormulaAux,1,i-1)));
      except
        vTipo := 0;
      end;
      FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux));
      if FormulaAux = '' then
        vMetodo := 1
      else begin
        try
          vMetodo := StrtoInt(PegaValor(FormulaAux));
        except
          vMetodo := 1;
        end;
      end;
    end;
  end;

// FIM DA DECODIFICAÇÃO DA FORMULA
//------------------------------------------------------------------------------
  if StrtoDate(vDt1) > StrtoDate(vDt2) then begin
    vDt3 := vDt1;
    vDt1 := vDt2;
    vDt2 := vDt3;
  End;

  vDias := Dias360(StrtoDate(vDt1), StrtoDate(vDt2), vMetodo);
  vRes := (vDias/30); // Faz a divisao para encontrar a quantidade de meses

  Case vTipo of
      0 : FResult := IntToStr(Trunc(vRes));
      1 : FResult := FloatToStr(vRes);
      2 : FResult := IntToStr(Round(vRes));
  else
    fResult := InttoStr(Trunc(vRes)); // Valor Padrão
  end;

end;


//******************************************************************************
// Formula, Retorna a Deferencia em Anos entre duas Datas
Procedure tRegra.DIFANOS;
Var
  vAux, vData1, vData2, vData3, sFormula : String;
  vTipo, vMetodo, i : LongInt;
  vDias, vRes : Real;
begin

//------------------------------------------------------------------------------
// DECODIFICA A FORMULA

  sFormula:=copy(sFormulaaux,9,length(sformulaaux)-9);

  i := Pos(',',sFormula);
  vData1 := Copy(sFormula,1,i-1);
  vData1 := PegaValor(vData1);

  sFormula := Copy(sFormula,i+1,Length(sFormula));

  i := Pos(',',sFormula);
  if i = 0 then
    i := Length(sFormula)+1;

  vData2 := Copy(sFormula,1,i-1);
  vData2 := PegaValor(vData2);
  sFormula := Copy(sFormula,i+1,Length(sFormula));
  i := Pos(',',sFormula);

  if i = 0 then begin
    try
      vTipo := StrtoInt(PegaValor(sFormula));
    except
      vTipo := 0;
    end;
    vMetodo := 1;
  end else begin
    vAux := PegaValor(Copy(sFormula,1,i-1));
    sFormula := Copy(sFormula,i+1,Length(sFormula));
    try
      vTipo := StrtoInt(vAux);
    except
      vTipo := 0;
    end;

    if sFormula = '' then
      vMetodo := 1
    else begin
      try
        vMetodo := StrtoInt(PegaValor(sFormula));
      except
        vMetodo := 1;
      end;
    end;
  end;

// FIM DA DECODIFICAÇÃO DA FORMULA
//------------------------------------------------------------------------------

  if StrtoDate(vData1) > StrtoDate(vData2) then begin
    vData3 := vData1;
    vData1 := vData2;
    vData2 := vData3;
  end;

  vDias := Dias360(StrtoDate(vData1), StrtoDate(vData2),vMetodo);
  vRes := (vDias / 360); // Faz a divisao para encontrar o ano
{
     Se o ultimo parâmetro for
     0 ou não colocar nada : Retorna o valor Inteiro
     1 : Retorna o Valor Fracionário
     2 : Valor Arredondado
}
  Case vTipo of
    0 : fResult := InttoStr(trunc(vRes));
    1 : fResult := FloattoStr(vRes);
    2 : fResult := IntToStr(Round(vRes));
  else
    fResult := InttoStr(Trunc(vRes)); // Valor Padrão
  end;

end;

//******************************************************************************
// Exibe o Fomulario com o os dados do Passo da Regra sendo executado
Procedure TRegra.ExibePasso;
Var
  I, J, Tam : integer;
begin
// Caso sair
  If SairDaRegra then
    Exit;
// Cria Formulario de Passo a Passo
  Application.CreateForm(tFrmPassoAPasso,FrmPassoAPasso);

// Caso sair
  If SairDaRegra then
    Exit;
  With FrmPassoAPasso Do Begin
// Busca Dados para preenche campos da Tela
    With QueryRegraAux Do Begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT NOMEREGRA FROM REGRA WHERE IDREGRA='+frulename);
      Open;
    End;
    lblmsg.caption:='';
    edregra.text:= QueryRegraAux.fieldbyname('nomeregra').AsString;
    edcodigo.text:=frulename;
    ednumero.text:=aalgorregra[ialgoratual];
    With QueryRegraAux do begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT DESCRICAOALGORIT FROM ALGREGRA WHERE IDREGRA='+frulename+
              ' AND IDALGORITMODAREG=' +ednumero.text);
      Open;
    End;
    eddesc.text  := QueryRegraAux.fieldbyname('DESCRICAOALGORIT').AsString;

    edtipo.text  := aalgortipo[ialgoratual];
    edoper1.text := aalgorcampo[ialgoratual];
    edvalor.text := aalgorvalor[ialgoratual];

    If (aalgortipo[ialgoratual] = '16') Then Begin
      edoper2.text  := fresult;
      edresult.text := 'Gravação OK';
    End Else Begin
      edoper2.text := aalgorcampo2[ialgoratual];
      edresult.text:= fresult;
    End;

// Preenche a Tela com o Proximo Passo, caso tenha sido Preenchido
    If wProxPasso <> 0 Then Begin
      FrmPassoAPasso.EdProxPasso.Text := IntToStr(wProxRegra)+'/'+
                                         IntToStr(wProxPasso);
    End;

// Busca Formulas da Rgra
    REdFormula.Clear;
    If Trim(Aalgorformula1[ialgoratual]) <> '' Then Begin
      With QueryRegraAux do begin
        Close;
        Sql.clear;
        Sql.add('SELECT EXPRESSAOFORMULA FROM FORMULA WHERE IDFORMULA='+aalgorformula1[ialgoratual]);
        Open;
       end;
      redformula.Clear;
      redformula.text:= QueryRegraAux.fieldbyname('EXPRESSAOFORMULA').AsString;
    End;
    redvar.clear;
    redcampos.Clear;

    //Fanuel Junior SOL144511 Kintana952230
    FrmPassoAPasso.btnVoltar.Enabled := (iCtrlAlgor > 2);

//------------------------------------------------------------------------------


//------------------------------------------------------------------------------
// Preenche o SQL de Entrada da Regra
    If Not TemQuery Then
      SQLRegra := QueryIn.SQL.GetText
    Else
      SQLRegra := QueryIn.SQL.GetText;

//------------------------------------------------------------------------------
// Preenche Grid com as Variaveis utilizadas e seus Valores

// Preenche Cabeçalhos
    StGrdVariaveis.Cells[0,0]:= 'VARIAVEIS';
    StGrdVariaveis.Cells[1,0]:= 'VALORES';

// Loop nas 700 variaveis possiveis de estar em memoria
    For I:=1 To 700 Do Begin 
// Caso Exista valor na Variavel
      If aTabvariaveis[I,1] <> '' Then Begin

// Guarda Nome da variavel na 1 posicao do Grid
        StGrdVariaveis.Cells[0,I]:= aTabvariaveis[I,1];
// Guarda Valor da variavel na 2 posicao do Grid
        StGrdVariaveis.Cells[1,I]:= aTabvariaveis[i,2];
// Adiciona mais uma linha
        StGrdVariaveis.RowCount := (StGrdVariaveis.RowCount+1);

// Altera as Cores do Texto da Formulas
        J:=Pos(uppercase(aTabvariaveis[I,1]),uppercase(redformula.text));
        If J <> 0 Then Begin
          Tam:=Length(aTabVariaveis[I,1]);
          RedFormula.SelStart := J-1;
          RedFormula.SelLength:= Tam;
          RedFormula.SelAttributes.Color:=ClBlue;
          RedFormula.SelStart := 0;
          RedFormula.SelLength:= 0;
          LblMsg.Caption:='Os parâmetros em azul utilizaram os valores das tabelas abaixo.';
        End;
      End;
    End;

//------------------------------------------------------------------------------
// Preenche Grid com os Campos utilizados e seus Valores

// Preenche Cabeçalhos
    StGrdCampos.Cells[0,0]:= 'CAMPOS';
    StGrdCampos.Cells[1,0]:= 'VALORES';

    For I:=0 to fqueryin.FieldCount-1 do begin
// Guarda Nome do Campo na 1 posicao do Grid
      StGrdCampos.Cells[0,I+1]:= FQueryIn.Fields[I].FieldName;
// Guarda Valor do Campo na 2 posicao do Grid
      StGrdCampos.Cells[1,I+1]:= FQueryIn.FieldByName(FQueryIn.Fields[i].FieldName).AsString;
// Adiciona mais uma linha
      StGrdCampos.RowCount := (StGrdCampos.RowCount+1);

//     redcampos.lines.add(fqueryin.fields[i].fieldname+':  ' +
//                         fqueryin.fieldbyname(fqueryin.fields[i].fieldname).AsString);

      J:=Pos(UpperCase(FQueryIn.Fields[I].FieldName), UpperCase(RedFormula.Text));
// Altera as Cores do Texto da Formulas
      If J <> 0 Then Begin
        Tam:=length(FQueryIn.Fields[I].FieldName);
        Redformula.SelStart := J-1;
        Redformula.SelLength:= Tam;
        Redformula.SelAttributes.Color:=ClBlue;
        Redformula.SelStart := 0;
        Redformula.SelLength:= 0;
      end;
    end;

  End;
//    frmpassoapasso.chkerro.checked:=fError;

// Caso Tenha dado Erro no Passo Mostra Imagem
  FrmPassoAPasso.BtErroRegra.Visible := fError;
// Caso PRoximo Passo tenha sido Preenchido, pula se o passo executado
// for diference

// Mostra Formulário Caso a Proxima Regra/Passo não tenha sido escolhido ou
// Regra/passo atual seja maior ou igual
  If ( (wProxRegra = 0) Or
       (StrtoInt(FrmPassoAPasso.EdCodigo.Text) = wProxRegra) )
  Then Begin
    If ( (wProxPasso = 0) Or
         (StrtoInt(FrmPassoAPasso.EdNumero.Text) >= wProxPasso) )
    Then Begin
// Guarda e zera o ultimo Passo parado
      If wProxPasso > 0 Then
        If wProxRegra > 0 Then
          FrmPassoAPasso.PnlUltimo.Caption := IntToStr(wProxRegra)+'/'+
                                              IntToStr(wProxPasso)
        Else
          FrmPassoAPasso.PnlUltimo.Caption := IntToStr(wProxPasso);

      FrmPassoAPasso.EdProxPasso.Clear;
      wProxPasso := 0;
// Mostra Formulário
      FrmPassoAPasso.ShowModal;
    End;
  End;
// Guarda o Proximo Passo ou zera a Variavel
  If Trim(FrmPassoAPasso.EdProxPasso.Text) <> '' Then Begin
    { Caso seja apenas passo sem "/" }
    If Pos('/', FrmPassoAPasso.EdProxPasso.Text) = 0 Then Begin
      wProxRegra := 0;
      wProxPasso := StrToInt(FrmPassoAPasso.EdProxPasso.Text)
    End Else Begin
      { Caso seja Regra "/" Passo }
      wProxRegra := StrToInt(Copy(FrmPassoAPasso.EdProxPasso.Text,1,
                                  (Pos('/',FrmPassoAPasso.EdProxPasso.Text)-1)));
      wProxPasso := StrToInt(Copy(FrmPassoAPasso.EdProxPasso.Text,
                                  (Pos('/',FrmPassoAPasso.EdProxPasso.Text)+1),
                                  Length(FrmPassoAPasso.EdProxPasso.Text)));
    End;
  End Else Begin
    wProxPasso := 0;
  End;

// Libera Formulário
  FrmPassoAPasso.Free;
end;

//******************************************************************************
// Formula de Arredondamento
Function tRegra.Arredonda(FormulaLoc:String):String;
Var
  I, iCasas :Integer;
  sValor, sCasas, sTipo, sAcertoInvest : String;
  dValor, dAcertoInvest : Double;
begin
  sTipo := '0';
  {----------------------------------------------------------------------------}
  { Decodifica formula                                                         }

  { Retira Nome da Formula }
  FormulaLoc:=Copy(FormulaLoc,7,length(FormulaLoc)-7);

  { Guarda Valor a ser arredondado }
  I := Pos(',',FormulaLoc);
  sValor := Copy(FormulaLoc,1,I-1);
  sValor := PegaValor(sValor);

  { Guarda Numero de Casas a arredondar }
  FormulaLoc := Copy(FormulaLoc,I+1,Length(FormulaLoc));
  I := Pos(',',FormulaLoc);
  If I <= 0 Then I := (Length(FormulaLoc)+1);
  sCasas := Copy(FormulaLoc,1,(I-1));
  sCasas := PegaValor(sCasas);

  { Guarda Tipo de Arredondamento 0 - Normal, 1 - Investimento, sempre para cima }
  FormulaLoc := Copy(FormulaLoc,I+1,Length(FormulaLoc));
  I := Pos(',',FormulaLoc);
  If I <= 0 Then I := (Length(FormulaLoc)+1);
  If Trim(FormulaLoc) <> '' Then Begin
    sTipo := Copy(FormulaLoc,1,(I-1));
    sTipo := PegaValor(sTipo);
  End;

  { Tranforma dados }
  iCasas := StrToInt(sCasas);
  dValor := StrToFloat(sValor);
  { Caso Tipo de arredondamento seha 1 (Investimento) gera numero de acerto }
  If sTipo = '1' Then Begin
    sAcertoInvest := '0.'+Replicate('0',iCasas)+'49';
    dAcertoInvest := StrToFloat(sAcertoInvest);
    dValor := dValor + dAcertoInvest;
  End;

  {  Fim da decodificacao da formula                                           }
  {----------------------------------------------------------------------------}

  { Seta Resultado Arredondando }
  Result := FloatToStrF(dValor,ffFixed,12,iCasas);
end;

{==============================================================================}
{ Formula de Truncagem                                                         }
Function TRegra.Trunca(FormulaLoc:String): String;
Var
  I, iCasas :Integer;
  sValor, sCasas, sTipo, sAcertoInvest : String;
  dValor, dAcertoInvest : Double;
begin
  sTipo := '0';
  {----------------------------------------------------------------------------}
  { Decodifica formula                                                         }

  { Retira Nome da Formula }
  FormulaLoc:=Copy(FormulaLoc,7,length(FormulaLoc)-7);

  { Guarda Valor a ser arredondado }
  I := Pos(',',FormulaLoc);
  sValor := Copy(FormulaLoc,1,I-1);
  sValor := PegaValor(sValor);

  { Guarda Numero de Casas a arredondar }
  FormulaLoc := Copy(FormulaLoc,I+1,Length(FormulaLoc));
  I := Pos(',',FormulaLoc);
  If I <= 0 Then I := (Length(FormulaLoc)+1);
  sCasas := Copy(FormulaLoc,1,(I-1));
  sCasas := PegaValor(sCasas);

  { Tranforma dados }
  iCasas := StrToInt(sCasas);
  dValor := StrToFloat(sValor);

  { Caso Tipo de arredondamento seha 1 (Investimento) gera numero de acerto }
  If sTipo = '1' Then Begin
    sAcertoInvest := '0.'+Replicate('0',iCasas)+'49';
    dAcertoInvest := StrToFloat(sAcertoInvest);
    dValor := dValor + dAcertoInvest;
  End;

  {  Fim da decodificacao da formula                                           }
  {----------------------------------------------------------------------------}

  { Seta Resultado Truncado - 08/05/2006 }
  //Result :=  FloatToStr( TruncValor( dValor, iCasas ) );
  dValor := TruncValor( dValor, iCasas );
  Result := FloatToStrF( dValor, ffFixed, 15, iCasas )

end;

//******************************************************************************
Procedure tregra.SetDataRef(data:str10);
begin
  Fdataref:=data;
  SetVariavel('DATAREF',Data,'DATAREF');
end;

//******************************************************************************
// Passo : Gravar Informações na Memória de Calculo.
Procedure TRegra.GRAVACALCULO;
Var
  vFormatacao, vIdDetCalculo : LongInt;
  sAnoMesRef, nValor, vSql, vMsg, wIdPessoa : String;
  SeparadorDecimal:Char;
Begin
  { Caso não deseje gravar o calculo sai }
  If (FlgGravaCalculo = False) Then Begin
    Exit;
  End;


  { Guarda Separador Decimal }
  SeparadorDecimal := DecimalSeparator;
  { Altera Separador Decimal }
  DecimalSeparator := ',';

  { Decodifica a formula }
  nValor := PegaValor(aAlgorcampo[iAlgoratual]);

  Try
    vFormatacao := StrtoInt(PegaValor(aAlgorFormatacao[iAlgorAtual]));
  Except
    vFormatacao := 0;
  End;

  If vFormatacao > 2 Then
    vFormatacao := vFormatacao - 2;

  { Cerifica se existe campo IDPESSOA na Consulta de Entrada }
  wIdPessoa :='';
  If FQueryIn.FindField('IDPESSOA') <> NIL Then Begin
    wIdPessoa :=FQueryIn.FieldByName('IDPESSOA').AsString;
  End;

  { Acerta valor para DB2 caso vazio }
  If Trim(wIdPessoa) = '' Then Begin
    wIdPessoa := 'NULL';
  End;

  { Cerifica se existe campo DATAREF na consulta de entrada }
  sAnoMesRef :='';
  If FQueryIn.FindField('DATAREF') <> NIL Then Begin
    sAnoMesRef := Copy(FQueryIn.FieldByName('DATAREF').AsString,7,4)+'/'+
                  Copy(FQueryIn.FieldByName('DATAREF').AsString,4,2);
  End;
  If Trim(sAnoMesRef) = '' Then sAnoMesRef := 'NULL';

//------------------------------------------------------------------------------
// Inicio do Processamento
  If (FidCalculo = 0) Then Begin
    FidCalculo := LeUltRegistro(nil,'calculo');
    { Grava Novos Campos IDPESSOA - DATA }
    ExecutarQuery( queryregraaux,'INSERT INTO CALCULO (IDCALCULO, IDPESSOA, DATACALCULO) VALUES ('+
    IntToStr(FidCalculo)+','+wIdPessoa+',TO_DATE('+QuotedStr(DateToStr(Date))+',''DD/MM/YYYY''))');
  End;


  If (VerifCalculo(FIdCalculo)) Then Begin

    vIdDetCalculo := LeUltRegistro(nil, 'DETCALCULO');

// Grava detalhe de acordo com a formatação indicada no Passo
    Case vFormatacao Of
      0,2:Begin // Não digitado ou  string sem decimais
          vSql := 'INSERT INTO DETCALCULO '+
                  '(IDCALCULO,IDDETCALCULO,DESCRICAO,VALOR,IDREGRA, IDPESSOA, ANOMESREF) VALUES ('+
                  IntToStr(FidCalculo)                +','+
                  InttoStr(vIdDetCalculo)             +','+
                  QuotedStr(aAlgorValor[iAlgoratual]) +','+
                  QuotedStr(nValor)                   +','+
                  FRulename                +','+
                  wIdPessoa                +','+
                  QuotedStr(sAnoMesRef)    +')';
        End;
      1:Begin // Moeda
          { Acerta Numero }
          nValor := TrocaCaracter(nValor,'.',',');

          { Testa valor }
          Try
            FloatToStrF(StrToFloat(nValor),ffNumber,15,vFormatacao);
          Except
            Exit;
          End;

          { Monta SQL }
          vSql := 'INSERT INTO DETCALCULO '+
                  '(IDCALCULO,IDDETCALCULO,DESCRICAO,VALOR,IDREGRA, IDPESSOA, ANOMESREF) VALUES ('+
                  IntToStr(FidCalculo)    +','+
                  InttoStr(vIdDetCalculo) +','''+
                  aAlgorValor[iAlgoratual]+''','''+
                  FloatToStrF(StrToFloat(nValor),ffCurrency,15,2)+''','+
                  FRulename    +','+
                  wIdPessoa                +','+
                  QuotedStr(sAnoMesRef)    +')';
        End;
      3..12:Begin // Outros
          { Acerta Numero }
          nValor := TrocaCaracter(nValor,'.',',');

          { Testa valor }
          Try
            FloatToStrF(StrToFloat(nValor),ffNumber,15,vFormatacao);
          Except
            Exit;
          End;

          { Monta SQL }
          vSql := 'INSERT INTO DETCALCULO '+
                  '(IDCALCULO,IDDETCALCULO,DESCRICAO,VALOR,IDREGRA,IDPESSOA, ANOMESREF) VALUES ('+
                  IntToStr(FidCalculo)     +','+
                  InttoStr(vIdDetCalculo)  +','''+
                  aAlgorValor[iAlgoratual] +''','''+
                  FloatToStrF(StrToFloat(nValor),ffNumber,15,vFormatacao)+''','+
                  FRulename    +','+
                  wIdPessoa                +','+
                  QuotedStr(sAnoMesRef)    +')';
            End;

    End;
// Caso Deseje gravar na memória de Calculo
    If (FlgGravaCalculo = True) Then Begin
      If Not ExecutarQuery(QueryRegraAux, vSql) Then Begin
        vMsg := 'Ocorreu um erro ao incluir dados na Memória de Calculo.';
        MsgDlgRegra(vMsg,'Regra - Erro',mterror,[mbOk],0);



      End;
    End;

  End Else Begin
    vMsg := 'O Identificador de Calculo (IdCalculo = '+IntToStr(FidCalculo)+
            ') não foi encontrado. Regra Nº '+FRulename+
            ' no Passo '+aalgorregra[ialgoratual];
      MsgDlgRegra(vMsg,'Regra - Atenção',mterror,[mbOk],0);
  End;
  { Volta Separador Decimal }
  DecimalSeparator := SeparadorDecimal;

End;

//******************************************************************************
// Executar uma Query (UPDATE/INSERT/DELETE)
Function tRegra.ExecutarQuery(Qry: TwwQuery; Const Str :String): Boolean;
Begin
  With Qry Do Begin
    Close;
    SQL.Clear;
    SQL.Add(str);
    Try
      ExecSQL;
    Except
      Result := False;
      Exit;
    End;
  End;
  Result := True;
End;

Function Tregra.FazQuery(Var Qry : twwQuery; Str : String) : Boolean;
Begin
  With qry Do Begin
       Close;
       SQL.Clear;
       SQL.Add(str);
       Open;
       Result := (EOF <> BOF);
  End;
End;

//******************************************************************************
// Formula, Concatena Valores
function tRegra.CONCAT(Formula:string):string;
Var
  X:integer;
  Letra     :string[1];
  FormulaLoc,palavra:string;
  TabVar    :tpArray;
begin
  for x:=0 to 40 do
    tabvar[x]:='';

  FormulaLoc:=copy(formula,8,length(formula)-7);
{
  letra :=copy(FormulaLoc,1,1);
  FormulaLoc:=copy(FormulaLoc,2,length(FormulaLoc));
}
  x:=0;
  palavra:='';
  while FormulaLoc <> '' do begin
    Letra     := Copy(FormulaLoc,1,1);
    FormulaLoc:= Copy(FormulaLoc,2,length(FormulaLoc));

    if (letra =',') or (letra=')') then begin
      TabVar[x] := PegaValor(Palavra);
      Inc(x);
      Palavra:='';
      Letra:='';
    end;

    palavra:=palavra+letra;
  end;

// Seta Resultado
  result:=Concatenar(TabVar);
end;

Function Tregra.Concatenar (Texto:TpArray):String;
Var
  I:Integer;
Begin
  result:='';
  For I:=0 To 40 Do
      Result:=Result+Texto[I];
End;

Function TRegra.Replicate(Texto:String;NVezes:Integer):String;
Var
  I:Integer;
Begin
  If (NVezes <=0) Then Begin
     Result:='';
     Exit;
  End;

  if texto ='' then
     texto:=' ';

  Result:='';
  For I:=1 To nVezes Do
      Result:=Result + Texto;
End;

Function Tregra.AlinhaTEXTO(texto:string):string;
var
  i:integer;
  palavras,tipo,stam:string;
begin
  texto:=copy(texto,8,length(texto)-8);
  i:=pos(',',texto);
  palavras:=copy(texto,1,i-1);
  texto:=copy(texto,i+1,length(texto));
  i:=pos(',',texto);
  stam:=copy(texto,1,i-1);
  texto:=copy(texto,i+1,length(texto));
  tipo:=texto;

  palavras:=pegavalor(palavras);
  stam:=pegavalor(stam);
  tipo:=pegavalor(tipo);

  result:=alinha(palavras,strtoint(stam),tipo);
end;

Function TRegra.Alinha(Texto:String;Tamanho:Integer;Tipo:String):String;
Var
  wEspaco:String;
Begin
  Result:='';
  If Texto = ''  Then
     Exit;
  If Tamanho = 0 Then
     Exit;
  If (Tipo <> 'D') And (Tipo <> 'E') And (Tipo <> 'C') Then
     Exit;

  If Length(Texto) > Tamanho Then Begin
     MsgDlgRegra('Erro, Alinha -> Texto Maior que Espaço ..','Regra - Atenção',mterror,[mbOk],0);
     Exit;
  End;
  wEspaco:=Replicate(' ',Tamanho-Length(Texto));
  If Tipo = 'C' Then
     wEspaco:=Replicate(' ',Trunc((Tamanho-Length(Texto))/2));
  If Tipo = 'D' Then               // Direita
    Result:=wEspaco+Texto
  Else
      If Tipo = 'E' Then           // Esquerda
         Result:=Texto+wEspaco
      Else
          If Tipo = 'C' Then       // Centralizado
             Result:=wEspaco+Texto+wEspaco;
End;

{******************************************************************************}
{ Formula EDIAS                                                                }
{   Evolui ou retroage dias de uma data (corridos ou comercial)                }
{------------------------------------------------------------------------------}
Function TRegra.EDIA(Formula:String):String;
Var
  sData, sNum, sTipoCalculo, sTempo : String[12];
  sAno, sMes, sDia : String;
  wAno, wMes, wDia : Word;
  Num,I  : Integer;
  rData  : Real;
  dData  : TDateTime;
  fTempo : Extended;
  wCodEstado, sTipoInvest : String;
  wIdCidades, wIdPais : LongInt;
Begin
  sTipoCalculo := '0';
  { Retira dados da fórmula }
  Formula := copy(Formula,6,Length(Formula));
  Formula := copy(Formula,1,Length(Formula)-1);

  I := Pos(',',Formula);
  { Guarda data de Referencia }
  sData := PegaValor(copy(formula,1,I-1));

  { Numero de Dias }
  Formula := Copy(Formula,(I+1),Length(Formula));
  I := Pos(',', Formula);
  If I = 0 Then I := Length(Formula) Else I := (I-1);  { Acerta posicao }
  sNum := PegaValor(Copy(Formula,1,(I)));
  Num  := StrToInt(sNum);

  { Guarda tipo de Calculo }
  Formula := Copy(Formula,(I+2),Length(Formula));
  I := Pos(',', Formula);
  If I <= 0 Then I := Length(Formula) Else I := (I - 1);
  If Trim(Formula) <> '' Then Begin
    sTipoCalculo := Copy(Formula, 1, I);
    sTipoCalculo := PegaValor(sTipoCalculo);
  End;

  { Guarda tipo de Investimento }
  Formula := Copy(Formula,(I+2),Length(Formula));
  I := Pos(',', Formula);
  If I <= 0 Then I := Length(Formula) Else I := (I - 1);
  If Trim(Formula) <> '' Then Begin
    sTipoInvest := Copy(Formula, 1, I);
    sTipoInvest := PegaValor(sTipoInvest);
  End;


  { Calculo normal 365 dias }
  If (sTipoCalculo = '0') Then Begin
    rData   := StrToDate(sData);
    rData   := rData + Num;
    dData   := rData;
    Result  := FormatDateTime('dd/mm/yyyy',dData);
  { Dias Comerciais }
  End Else If (sTipoCalculo = '1') Then Begin
    { Transforma numero de dias em tempo AMD }
    sTempo := TransformaDiasTempo(Num);
    sAno := Copy(sTempo,1,2);
    sMes := Copy(sTempo,3,2);
    sDia := Copy(sTempo,5,2);
    { Decodifica data de referencia }
    dData := StrToDate(sData);
    DecodeDate(dData, wAno, wMes, wDia);

    { Calcula data resultado e guarda }
    wAno := wAno + StrToInt(sAno); sAno := IntToStr(wAno);
    wMes := wMes + StrToInt(sMes); sMes := IntToStr(wMes);
    wDia := wDia + StrToInt(sDia); sDia := IntToStr(wDia);

    { Caso Dias = 30 Aumenta Mes }
    If sDia >= '30' Then Begin
      sMes:= IntToStr((StrToInt(sMes)+1));
      If (StrToInt(sMes) < 10) Then sMes:= '0'+sMes;
      wDia := Abs(wDia - 30);
      sDia := IntToStr(wDia);
      { Acerta para numero de casas }
      I := Length(sDia);
      sDia := StringOfChar('0',(2-I))+sDia;
    End;

    { Caso Meses = 12 Aumenta Ano }
    If sMes >= '12' Then Begin
      sAno:= IntToStr((StrToInt(sAno)+1));
      { Acerta Mes }
      wMes := StrToInt(sMes);
      wMes := Abs(wMes - 12);
      sMes := IntToStr(wMes);
      { Acerta para numero de casas }
      I := Length(sMes);
      sMes := StringOfChar('0',(2-I))+sMes;
    End;
    { Acerta formato do resultado } { 21/08/2002 }
    If StrToInt(sDia) <= 9 Then sDia := '0'+sDia;
    If StrToInt(sMes) <= 9 Then sMes := '0'+sMes;

    Result := sDia+'/'+sMes+'/'+sAno;
  { Dias Uteis Investimento }
  End Else If (sTipoCalculo = '2') Or (sTipoCalculo = '3') Then Begin

    { Verifica Campos Obrigatórios }
    wCodEstado := '**';
    If FQueryIn.FindField('IDPAIS') = NIL Then Begin                      { IDPAIS }
      MsgDlgRegra('Campo IDPAIS, necessário no Sql de entrada '+
             'para se verificar os dias Úteis.', 'Regra - Erro',mtError,[mbOk],0);
      fError := True;
      Exit;
    End Else If FQueryIn.FindField('IDCIDADES') = NIL Then Begin          { IDCIDADES }
      MsgDlgRegra('Campo IDCIDADES, necessário no Sql de entrada '+
             'para se verificar os dias Úteis.', 'Regra - Erro',mtError,[mbOk],0);
      fError := True;
      Exit;
    End Else If FQueryIn.FindField('CODESTADO') = NIL Then Begin          { CODESTADO }
      wCodEstado := '';
    End;
    { Guarda Dados da Localidade do Processo }
    wIdCidades := FQueryIn.FieldByName('IDCIDADES').AsInteger;
    If wCodEstado = '**' Then
      wCodEstado := FQueryIn.FieldByName('CODESTADO').AsString;
    wIdPais    := FQueryIn.FieldByName('IDPAIS').AsInteger;

    { Calcula Data }
    dData := StrToDate(sData);
    If sNum = '0' Then I := 0 Else I := 1;

    while I <= Abs(StrToInt(sNum)) do begin
       If StrToInt(sNum) > 0 Then Begin
         dData := dData + 1
       End Else If StrToInt(sNum) < 0 Then Begin
         dData := dData - 1;
       End;

       If sTipoCalculo = '2' Then Begin
         { Dias uteis normais }
         if DiasUteis.DiaUtil(dData, wIdCidades, wIdPais, wCodEstado,
                              True, False, False)
         then
           inc(I)
         Else
           If StrToInt(sNum) = 0 Then
             dData := dData + 1;
       End Else Begin
         { Dias uteis investimento }
         DiasUteisInvest.SetaTipoInvest(StrToInt(sTipoInvest));
         if DiasUteisInvest.DiaUtil(dData, wIdCidades, wIdPais, wCodEstado,
                                    True, False, False)
         then
           inc(I)
         Else
           If StrToInt(sNum) = 0 Then
             dData := dData + 1;
       End;
    end;

    Result := DateToStr(dData);
  End;

End; { EDIA }


{******************************************************************************}
{ Formula EMES                                                                 }
{   Evolui ou retroage meses de uma data (corridos ou comercial)               }
{------------------------------------------------------------------------------}
Function TRegra.EMES(Formula:String): String;
Var
  sData,sNum : String[12];
  sMes, sDia : Str7;
  Num, Num2, iDia, I : Integer;
Begin
  { Retira dados da fórmula }
  Formula := Copy(Formula, 6, Length(Formula)-6);

  { Guarda data de Referencia }
  I := Pos(',', Formula);
  sData := Pegavalor(Copy(Formula, 1, I-1));

  { Numero de Meses}
  sNum  := Pegavalor(Copy(Formula, I+1, Length(Formula)));
  Num   := StrToInt(sNum);

  sDia  := Copy(sData,1,2);
  sMes  := Paradata('paradata('+sdata+',M)');

  { Calcular resultado }
  If Num < 0 Then Begin
    Num   := 0-Num;
    sMes  := Subtrair(sMes, Num)
  End Else
    sMes  := Somar(smes,num);

  { Acertos }
  Num2  := StrToInt(copy(smes,6,2));
  iDia  := StrToInt(sDia);
  If (Num2 = 2) And (iDia > 28) Then
    sDia := '28';

  If ((Num2 = 4) Or (Num2 = 6) Or (Num2 = 9) Or (Num2 = 11)) And (iDia > 30) Then
    sDia := '30';

  sData  := Paradata('paradata('+sMes+',D)');
  sData  := Copy(sData,3,8);

  Result := sDia + sData;

End; { EMES }


Function tRegra.EANO(formula:string):string;
var
  sdata,snum:string[12];
  smes,sdia:str7;
  num,num2,idia,i:integer;
begin
    formula:=copy(formula,6,length(formula)-6);
    i:=pos(',',formula);
    sdata:=pegavalor(copy(formula,1,i-1));
    snum:=pegavalor(copy(formula,i+1,length(formula)));
    num:=strtoint(snum)*12;
    sdia  := copy(sdata,1,2);
    smes  := paradata('paradata('+sdata+',M)');

     if num < 0 then begin
        num   :=0-num;
        smes  := subtrair(smes,num)
     end else
         smes  := somar(smes,num);

    num2  := StrToInt(copy(smes,6,2));
    idia  := StrToInt(sDia);
    If (Num2 = 2) and (iDia > 28) Then
        sDia := '28';

    If ((Num2 = 4) or (Num2 = 6) or (Num2 = 9) or (Num2 = 11)) and (iDia > 30) Then
        sDia := '30';

    sdata := paradata('paradata('+smes+',D)');
    sdata := copy(sdata,3,8);
    result := sdia + sdata;

end;


function Tregra.CarregaQueryLinhas(sNometab:string; var tab:integer):Boolean;
var
  i, xLin, xCol, wInt, wInt1, wInt2 : Integer;
  xcampo,sSQL   : String;
begin

  { Inicia Vetor dos Campos }
  For  wInt := 0 to 150 Do Begin
    For  wInt1 := 0 to 150 Do Begin
      For  wInt2 := 0 to 20 Do Begin
        StrGrdTab[wInt, wInt1, wInt2] := '';
      End;
    End;
  End;

  with queryregra do begin
    close;
    sql.clear;
    sql.add('SELECT  CODTABELA, CODCAMPO, IDTIPODADO, DESCRICAO FROM '+
            ' CAMPOTABGENER WHERE CODTABELA     =  '''+sNometab+'''');
    open;
  end;

  DsRegra.DataSet:=queryregra;

  with queryregraaux do begin
    Datasource:=DsRegra;
    close;
    sql.clear;
    sql.add(  'SELECT CODTABELA, NUMLINHA, CODCAMPO, VALOR FROM VALTABGENER WHERE CODTABELA = '''+
              sNomeTab+''' AND CODCAMPO = :CODCAMPO');
    open;
  end;

  with qrytabuabio do begin
    Close;
    Sql.Clear;
    { Alterado DB2 }
    sSQL :='SELECT LIN.NUMLINHA, LIN.VALOR, COL.DESCRICAO, LIN.CODTABELA, COL.CODCAMPO '+
           'FROM   CAMPOTABGENER COL,'+
           '       VALTABGENER   LIN '+
           'WHERE  COL.CODTABELA ='''+sNomeTab+''' '+
           'AND    COL.CODTABELA = LIN.CODTABELA(+) '+
           'AND    COL.CODCAMPO  = LIN.CODCAMPO(+)  '+
           'ORDER  BY LIN.CODTABELA, LIN.CODCAMPO,LIN.NUMLINHA ';
    Sql.Add(sSQL);

    Open;
    if RecordCount = 0 then
      result := False
    else
      result := True;

    xCampo:=QryTabuaBio.FieldByName('CODCAMPO').AsString;

    i:=0;
    while i <= 20 do begin
      if nomestrgrdtab[i] = '' then begin
        nomestrgrdtab[i] := sNometab;
        break;
      end;
      inc(i);
    end;

    {inicio do proc. para preencher o grid}
    qrytabuabio.First;
    strgrdtab[0,0,i] := 'NÚM.LINHA';

    xLin:= 1;
    xcol:=1;
    while not Eof do begin
      xcampo:=qrytabuabio.fieldbyname('codcampo').AsString;
      strgrdtab[xcol,0,i] := qrytabuabio.fieldbyname('codcampo').AsString;
      while (qrytabuabio.fieldbyname('codcampo').AsString=xcampo) and (not qrytabuabio.eof) do begin
        strgrdtab[0,xlin,i]:=qrytabuabio.fieldbyname('numlinha').AsString;
        if queryregra.FieldByName('IdTipoDado').AsString = '1' then
          strgrdtab[xcol,xlin,i]:=trocavirgulaponto(qrytabuabio.fieldbyname('valor').AsString)
        else
          strgrdtab[xcol,xlin,i]:=qrytabuabio.fieldbyname('valor').AsString;
        inc(xlin);
        qrytabuabio.next;
      end;
      inc(xcol);
      xcampo:=qrytabuabio.fieldbyname('codcampo').AsString;
      xlin:=1;
    end;
  end;
  strgrdtab[0,1,i] := '1';
  tab:=i;
end;

{******************************************************************************}
{ Formula, Retorna o Numero de Dias (Uteis ou não) entre duas datas            }
{------------------------------------------------------------------------------}
Function TRegra.DIFDIAS(Formula:String):String;
Var
  vDt1, vDt2, FormulaAux, wCodEstado, sTipoInvest, sTipoCalculo : String;
  iTipoCalculo, I, wIdCidades, wIdPais : LongInt;
Begin
  iTipoCalculo := 0;
  {----------------------------------------------------------------------------}
  { DECODIFICA FÓRMULA                                                         }

  { Retira Nome da Formula }
  FormulaAux := Copy(Formula,9,Length(Formula));
  FormulaAux := Copy(FormulaAux,1,Length(FormulaAux)-1);
  I := Pos(',',FormulaAux);

  { Pega Primeira Data }
  vDt1 := Copy(FormulaAux,1,i-1);
  vDt1 := PegaValor(vDt1);

  FormulaAux := Copy(FormulaAux,I+1,Length(FormulaAux));
  I := Pos(',',FormulaAux);
  If I = 0 Then
    I := Length(FormulaAux) + 1;
  { Pega Segunda Data }
  vDt2 := Copy(FormulaAux,1,I-1);
  vDt2 := PegaValor(vDt2);

  { Guarda tipo de Calculo }
  FormulaAux := Copy(FormulaAux,(I+1),Length(FormulaAux));
  I := Pos(',', FormulaAux);
  If I <= 0 Then I := Length(FormulaAux) Else I := (I - 1);
  If I > 0 Then Begin
    sTipoCalculo := Copy(FormulaAux, 1, I);
    sTipoCalculo := PegaValor(sTipoCalculo);
    iTipoCalculo := StrToInt(sTipoCalculo);
  End;


  { Guarda tipo de Investimento }
  FormulaAux := Copy(FormulaAux,(I+2),Length(FormulaAux));
  I := Pos(',', FormulaAux);
  If I <= 0 Then I := Length(FormulaAux) Else I := (I - 1);
  If I > 0 Then Begin
    sTipoInvest := Copy(FormulaAux, 1, I);
    sTipoInvest := PegaValor(sTipoInvest);
  End;

  { FIM DA DECODIFICAÇÃO DA FÓRMULA                                            }
  {----------------------------------------------------------------------------}

  { Calcula Resultado de acroco com o Tipo:                                    }
  {  0 forma normal de calculo (Dias Corridos)                                 }
  {  1 usa formula DIAS360 (Dias Comerciais) metodo US (NASD) - Falso no Excel }
  {  2 usa formula DIAS360 (Dias Comerciais) metodo Europeu   - Verdadeiro     }

  fError := False;
  Case iTipoCalculo Of
    0 : Result := InttoStr(Trunc(StrtoDate(vDt1) - StrtoDate(vDt2)));
    1 : Result := InttoStr(Trunc(Dias360(StrtoDate(vDt2),StrtoDate(vDt1),0))); { Dias comerciais no método Americano. }
    2 : Result := InttoStr(Trunc(Dias360(StrtoDate(vDt2),StrtoDate(vDt1),1))); { Dias comerciais no método Europeu. }
    3,4: Begin                                                                 { Dias úteis (Calendário CM). }
          { Verifica Campos Obrigatórios }
          wCodEstado := '**';
          If FQueryIn.FindField('IDPAIS') = NIL Then Begin                      { IDPAIS }
            MsgDlgRegra('Campo IDPAIS, necessário no Sql de entrada '+
                   'para se verificar os dias Úteis.', 'Regra - Erro',mtError,[mbOk],0);
            fError := True;
            Exit;
          End Else If FQueryIn.FindField('IDCIDADES') = NIL Then Begin          { IDCIDADES }
            MsgDlgRegra('Campo IDCIDADES, necessário no Sql de entrada '+
                   'para se verificar os dias Úteis.', 'Regra - Erro',mtError,[mbOk],0);
            fError := True;
            Exit;
          End Else If FQueryIn.FindField('CODESTADO') = NIL Then Begin          { CODESTADO }
            wCodEstado := '';
          End;
          { Guarda Dados da Localidade do Processo }
          wIdCidades := FQueryIn.FieldByName('IDCIDADES').AsInteger;
          If wCodEstado = '**' Then
            wCodEstado := FQueryIn.FieldByName('CODESTADO').AsString;
          wIdPais    := FQueryIn.FieldByName('IDPAIS').AsInteger;

          { Verifica numero de dias uteis entre as datas nesta localidade }
          If iTipoCalculo = 3 Then Begin
           Result :=IntToStr(
                    DiasUteis.IntervaloDiasUteis(StrToDate(vDt2), StrToDate(vDt1),
                                                 wIdCidades, wIdPais, wCodEstado,
                                                 True  {bConsideraBancario},
                                                 False {bConsideraExtraordinario},
                                                 False {bSabadoUtil} )
                           );
          End Else Begin
            DiasUteisInvest.SetaTipoInvest(StrToInt(sTipoInvest));
            Result :=IntToStr(DiasUteisInvest.IntervaloDiasUteis(StrToDate(vDt2), StrToDate(vDt1),
                                                 wIdCidades, wIdPais, wCodEstado,
                                                 True  {bConsideraBancario},
                                                 False {bConsideraExtraordinario},
                                                 False {bSabadoUtil} )
                           );
          End;

        End;
    Else
      Result := InttoStr(Trunc(StrtoDate(vDt1) - StrtoDate(vDt2)));
  End;

End;

Procedure tRegra.SetIdCalculo(IdCalculo:LongInt);
begin

  if IdCalculo < 0 then IdCalculo := 0; // Renato Visoni SOL 150417 Kintana 1092011

  fidCalculo:=IdCalculo;
  
end;

Function tregra.TiraPlic(texto:string):string;
begin
    if texto[1]='''' then
       texto :=copy(texto,2,length(texto));
    if texto[length(texto)]='''' then
       texto:= copy(texto,1,length(texto)-1);
    result:=texto
end;

//******************************************************************************
// Formula, Consulta na Tabela Genérica
Function TRegra.CONSULTA(Linha:String):String;
Var
   Formula, vTipo, wAux, wSQL, vSql, wTabela, wCampoResult,
   sTabela, Aux,  Reg, vOpAux, spar, vCmp, vOp, vVal, sOrder : string;
   i, x : integer;
   QryAux : TwwQuery;
   Achou : Boolean;
Begin
  sOrder := '';
  Formula := Linha;

  i := Pos('[',Formula);
  Aux := Copy(Formula,i+1,Length(Formula));
  i := Pos(']',Aux);
  Aux := Copy(Aux,1,i-1);

  i := Pos(']',Formula);
  Formula := Copy(Formula,i+1,Length(Formula));
  i := Pos(',',Formula);
  sTabela := Copy(Formula,1,I-1);
  sTabela := PegaValor(sTabela);
  Formula := Copy(Formula,i+1,Length(Formula));
  i := Pos(',',Formula);
  sCampoRet := Copy(Formula,1,i-1);
  sCampoRet := PegaValor(sCampoRet);
  Formula := Copy(Formula,i+1,Length(Formula));
  i := Pos(',',Formula);
  if i > 0 then begin
     vTipo := Copy(Formula,i+1,Length(Formula));
     vTipo := PegaValor(vTipo);
  end else begin
       vTipo := Formula;
       i := Pos('"',Formula);
       if i > 0 then
          vTipo := Copy(Formula,i+1,Length(Formula));
       i := Pos('"',vTipo);
       if i > 0 then
          vTipo := Copy(vTipo,1,i-1);
       vTipo := PegaValor(vTipo);
       if vTipo <> '1' then
          vTipo := '0';
  end;

  for i := 1 to 10 do begin
      TabChaves[i].Campo := '';
      TabChaves[i].Valor := '';
      TabChaves[i].Op    := '';
      TabChaves[i].Tipo  := '';
  end;


  if vTipo = '1' then begin //caso vtipo seja igual a "um", consulta por CAMPOTABGENER (Tabela genérica)
     x := 1;
     repeat
           i :=   Pos(',',Aux);
           if i > 0 then begin
              Reg := Copy(Aux,1,i-1);
              Aux := Copy(Aux,i+1,Length(Aux));
           end else begin
              Reg := Aux;
              Aux := '';
           end;
           if Pos('>=', Reg) > 0 then begin
              vCmp := Copy(Reg,1,Pos('>=',Reg)-1);
              vVal := Copy(Reg,Pos('>=',Reg)+2,Length(Reg));
              TabChaves[x].Campo := PegaValor(vCmp);
              TabChaves[x].Valor := PegaValor(vVal);
              TabChaves[x].Op    := '>=';
              TabChaves[x].Tipo  := TpDadoCons(sTabela, TabChaves[x].Campo);
           end else begin
               if Pos('<=', Reg) > 0 then begin
                  vCmp := Copy(Reg,1,Pos('<=',Reg)-1);
                  vVal := Copy(Reg,Pos('<=',Reg)+2,Length(Reg));
                  TabChaves[x].Campo := PegaValor(vCmp);
                  TabChaves[x].Valor := PegaValor(vVal);
                  TabChaves[x].Op    := '<=';
                  TabChaves[x].Tipo  := TpDadoCons(sTabela, TabChaves[x].Campo);
               end else begin
                   if Pos('>', Reg) > 0 then begin
                      vCmp := Copy(Reg,1,Pos('>',Reg)-1);
                      vVal := Copy(Reg,Pos('>',Reg)+1,Length(Reg));
                      TabChaves[x].Campo := PegaValor(vCmp);
                      TabChaves[x].Valor := PegaValor(vVal);
                      TabChaves[x].Op    := '>';
                      TabChaves[x].Tipo  := TpDadoCons(sTabela, TabChaves[x].Campo);
                   end else begin
                       if Pos('<', Reg) > 0 then begin
                          vCmp := Copy(Reg,1,Pos('<',Reg)-1);
                          vVal := Copy(Reg,Pos('<',Reg)+1,Length(Reg));
                          TabChaves[x].Campo := PegaValor(vCmp);
                          TabChaves[x].Valor := PegaValor(vVal);
                          TabChaves[x].Op    := '<';
                          TabChaves[x].Tipo  := TpDadoCons(sTabela, TabChaves[x].Campo);
                       end else begin
                           if Pos('=', Reg) > 0 then begin
                              vCmp := Copy(Reg,1,Pos('=',Reg)-1);
                              vVal := Copy(Reg,Pos('=',Reg)+1,Length(Reg));
                              TabChaves[x].Campo := PegaValor(vCmp);
                              TabChaves[x].Valor := PegaValor(vVal);
                              TabChaves[x].Op    := '=';
                              TabChaves[x].Tipo  := TpDadoCons(sTabela, TabChaves[x].Campo);
                           end;
                       end;
                   end;
               end;
           end;
           spar := TabChaves[x].Op;
           Inc(x);
     until Aux = '';

     { Caso tenha dado Erro sai }
     If fError = True Then Exit; 

     QryAux := TwwQuery.Create(Self);
     QryAux.DatabaseName := FDatabaseName;
     with QryAux do begin
          Close;
          Sql.Clear;
          vSql := 'SELECT V.NUMLINHA, V.CODCAMPO, V.VALOR FROM	VALTABGENER V, ';
          for i := 1 to 10 do begin
              if TabChaves[i].Campo <> '' then begin
                 if (TabChaves[i].Tipo = 'N') then begin
                    vSql := vSql + '(SELECT AUX.NUMLINHA, AUX.CODCAMPO, AUX.VALOR FROM '+
                                   '(SELECT NUMLINHA, CODCAMPO, CODTABELA, TO_NUMBER(VALOR, ''99999999999.9999'') AS VALOR FROM VALTABGENER) AUX '+
                                   ' WHERE (AUX.CODTABELA = '''+sTabela+''') AND '+
                                   '(AUX.CODCAMPO = '''+TabChaves[i].Campo+''') AND '+
                                   '(AUX.VALOR'+TabChaves[i].Op+tabchaves[i].valor+')) '+
                                   'X'+InttoStr(i);
                    if TabChaves[i+1].Campo <> '' then
                       vSql := vSql + ', ';
                 end else begin
                     if (TabChaves[i].Tipo = 'A') then begin
	                vSql := vSql + '(SELECT NUMLINHA, CODCAMPO, VALOR FROM VALTABGENER WHERE (CODTABELA = '''+sTabela+''') AND ';
                        vSql := vSql + '(CODCAMPO = '''+TabChaves[i].Campo+''') AND '+
                        '(VALOR'+TabChaves[i].Op+''''+tabchaves[i].valor+''')) '+
                        'X'+InttoStr(i);
                        if TabChaves[i+1].Campo <> '' then
                           vSql := vSql + ', ';
                     end else begin
                         vSql := vSql + '(SELECT NUMLINHA, CODCAMPO, VALOR FROM VALTABGENER WHERE (CODTABELA = '''+sTabela+''') AND ';
                         vSql := vSql + '(CODCAMPO = '''+TabChaves[i].Campo+''') AND (TO_DATE(VALOR,''DD/MM/YYYY'')'+TabChaves[i].Op+
                                        'TO_DATE('''+tabchaves[i].valor+''',''DD/MM/YYYY''))) X'+InttoStr(i);
                         if TabChaves[i+1].Campo <> '' then
                            vSql := vSql + ', ';
                     end;
                 end;
              end;
          end;
          vSql := vSql + ' WHERE (V.CODTABELA = '''+sTabela+''') AND (V.CODCAMPO = '''+sCamporet+''')';
          for i := 1 to 10 do begin
              if (i > 1) and (TabChaves[i].Campo <> '') then
                 vSql := vSql + 'AND (X1.NUMLINHA = X'+InttoStr(i)+'.NUMLINHA) ';

              if TabChaves[i].Campo <> '' then
                 vSql := vSql + 'AND (V.NUMLINHA = X'+InttoStr(i)+'.NUMLINHA) ';
          end;

          vSql := vsql + 'ORDER BY V.NUMLINHA '+sOrder;

          Sql.Add(vSql);

          Open;

     end;

     if spar='<=' then
        QryAux.last;

     If Not QryAux.IsEmpty Then
       Result := QryAux.FieldbyName('VALOR').AsString
     Else
//       Result := 'FALSE';
       Result := '0';

     QryAux.Free;

  end else begin  //caso seja diferente de zero consulta por LONGTABGENER (Table genérica longa)
      Result := '';
      wSQL := Copy(Trim(Linha),2,(Pos(']',Trim(Linha))-2));
      If Trim(wSQL) = '' Then Begin
         MsgDlgRegra('Erro nos parâmetros da pesquisa ...','Regra - Atenção',mterror,[mbOk],0);
         Result := '0';
         Exit;
      End;
      while Pos(',',wSQL) > 0 do wSQL := TrocaLetra(',',' AND ',wSQL);
      wAux := wSql;
      Linha        := Copy(Linha,(Pos(']',Linha)+1),Length(Linha));
      wTabela      := Copy(Linha,(Pos(']',Linha)+1),(Pos(',',Linha)-1));
      wTabela      := PegaValor(wTabela);
      wCampoResult := Copy(Linha,(Pos(',',Linha)+1),Length(Linha));
      if Pos(',',wCampoResult) <> 0 then
         wCampoResult := UpperCase(Copy(wCampoResult,1, (Pos(',',wCampoResult)-1)));
      wCampoResult:=PegaValor(wCampoResult);

      QryAux := TwwQuery.Create(Self);
      QryAux.DatabaseName := FDatabaseName;
      with QryAux do begin
           Close;
           Sql.Clear;
           vSql := 'SELECT LC.IDTABELA,LC.IDCAMPO,LC.DESCRICAO AS DESCRICAO FROM LONGCMPTABGENER LC, '+
	          '(SELECT IDTABELA, DESCRICAO FROM LONGTABGENER WHERE DESCRICAO = '''+wTabela+''') L '+
                  'WHERE LC.IDTABELA = L.IDTABELA';
           Sql.Add(vSql);
           Open;
      end;

      if QryAux.Locate('DESCRICAO',wCampoResult,[]) then
         wCampoResult := 'C'+QryAux.FieldbyName('IDCAMPO').AsString
      else begin
           MsgDlgRegra('Erro nos parâmetros da pesquisa ...','Regra - Atenção',mterror,[mbOk],0);
           Result := '0';
           Exit;
      end;

      vSql := 'SELECT IDTABELA, NUMLINHA, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, '+
 	      'C15, C16, C17, C18, C19, C20, C21, C22, C23, C24, C25, C26, C27, C28, C29, C30, '+
	      'C31, C32, C33, C34, C35, C36, C37, C38, C39, C40, C41, C42, C43, C44, C45, C46, '+
	      'C47, C48, C49, C50, C51, C52, C53, C54, C55, C56, C57, C58, C59, C60, C61, C62, '+
	      'C63, C64, C65, C66, C67, C68, C69, C70, C71, C72, C73, C74, C75, C76, C77, C78, '+
	      'C79, C80, C81, C82, C83, C84, C85, C86, C87, C88, C89, C90, C91, C92, C93, C94, '+
	      'C95, C96, C97, C98, C99, C100 FROM LONGVALTABGENER WHERE '+
	      'IDTABELA = '+QryAux.FieldbyName('IDTABELA').AsString+' AND ';
      repeat
           i := Pos('=',wAux);
           Achou := False;
           if (Copy(wAux,i-1,1) = '<') or (Copy(wAux,i-1,1) = '>') or (Copy(wAux,i-1,1) = '=') then begin
              i := i -1;
              Achou := True;
           end;
           vCmp := Copy(wAux, 1,i-1); //Campo
           vCmp := pegavalor(vCmp);
           if QryAux.Locate('DESCRICAO',vCmp,[]) then
              vCmp := 'C'+QryAux.FieldbyName('IDCAMPO').AsString;

           wAux := Copy(wAux, i, Length(wAux));
           if Achou then begin
              vOp :=Copy(wAux,1,2); //Operando
              vOp := PegaValor(vOp);
              if Length(vOp) > 1 Then
                 vOpAux := vOp;
              wAux := Copy(wAux, 3, Length(wAux));
           end else begin
               vOp :=Copy(wAux,1,1); //Operando
               vOp := PegaValor(vOp);
               if Length(vOp) > 1 Then
                  vOpAux := vOp;
               wAux := Copy(wAux, 2, Length(wAux));
           end;
           i := Pos(' AND ', wAux);
           if i > 0 then begin
              vVal := Copy(wAux,1,i-1);
              vVal := pegavalor(vVal);
              wAux := Copy(wAux, i+5, Length(wAux));
              vSql := vSql + ''+vCmp+''+vOp+''''+UpperCase(vVal)+''''+' AND ';
           end else begin
               vVal := Copy(wAux,1,Length(wAux));
               vVal := pegavalor(vVal);
               vSql := vSql + ''+vCmp+''+vOp+''''+UpperCase(vVal)+'''';
           end;
           i := Pos('=',wAux);
      until i = 0;

      with QryAux do begin
           Close;
           Sql.Clear;
           Sql.Add(vSql);
           Open;
           if vOpAux = '<=' then
              Last;
      end;

      if not QryAux.IsEmpty then
         Result := QryAux.FieldbyName(wCampoResult).AsString
      else
         Result := '0';
      QryAux.Free;
  end;
  
end;

Function TRegra.TrocaLetra(LetraAntiga,NovaString,Frase:String):String;
Var
  I, W:Integer;
  sFrase : String;
Begin
  W := Length(Trim(Frase));
  For I := 1 To W Do Begin
    If Frase[I] = LetraAntiga Then
      sFrase := Copy(Frase,1,(I-1))+NovaString+Copy(Frase,I+1,Length(Frase));
  End;
  Result := sFrase;
  
//  Result := Frase;
End;

{******************************************************************************}
{ Formula,                                                                     }
{------------------------------------------------------------------------------}
Function TRegra.IRRF(Formula:String):String;
Var
  Tipo, I : Integer;
  NumDep, DataNasc, ValorBase, dataref : String;
  fAliquota, fValorBase :double;
  IRRF:TIRRF;
  vSql : String;
begin
  Formula := copy(formula,6,length(formula)-6);
  I       := pos(',',formula);
  NumDep  := pegavalor(copy(formula,1,i-1));

  Formula := copy(formula,i+1,length(formula));
  I       := pos(',',formula);
  DataNasc:= pegavalor(copy(formula,1,i-1));

  Formula := copy(formula,i+1,length(formula));
  I       := pos(',',formula);

  ValorBase  := copy(formula,1,i-1);
  fValorBase :=strtofloat(pegavalor(ValorBase));
  formula := copy(formula,i+1,length(formula));

  I       := pos(',',formula);
  If i = 0 Then
    I := Length(Formula)+1;
  DataRef  := pegavalor(Copy(formula,1,i-1));

  Formula := copy(formula,i+1,length(formula));

  Try
    Tipo := StrtoInt(PegaValor(Formula));
  Except
    Tipo := 0;
  End;
  
  IRRF := TIRRF.create;
  IRRF.CarregaFaixasIRRF(queryregraaux, FIdEmpresa, DataRef);
  Case Tipo of
    0..2 : begin
             Result := FloatToStr(IRRF.CalculaIRRF(StrToInt(NumDep),
                                                   StrToDate(DataNasc),
                                                   fValorBase, fAliquota, DataRef, Tipo));
           end;
    3 : Result := IntToStr(IRRF.IdadeIdoso);
    4 : Result := FloatToStr(IRRF.ValorIdoso);
    5 : Result := FloatToStr(IRRF.ValorDependente);
  end;
  IRRF.free;
end;

// andre ini

Function tRegra.IndBiometrico(texto:string):string;
var
 k,j : integer;
 fim1,fim2,ini,i,virgula,
 idtabela,
 numlinha,tam,limitematriz : integer;
 anuidade,nomecampo,descricao,idade,idbio    : string;
begin
 if ftabbiometrica = '' then begin
    pegacampo('BIOMETRICA',false,idbio);
    ftabbiometrica := idbio;
    if ftabbiometrica = '' then begin
       application.messagebox('Problema no acesso a tabela biométrica','Tabela  não aberta',MB_ICONSTOP);
       Ferror := True;
       exit;
    end;
 end;

 if not(passoubiometrica) then begin
    try
       TabelaBiometrica.open;
    except
          application.messagebox('Problema no acesso a tabela biométrica','Tabela  não aberta',MB_ICONSTOP);
          Ferror := True;
          exit;
    end;
    try
       TabelaCampoBio.open;
    except
          application.messagebox('Problema na tabela campo -> biométrica','Tabela  não aberta',MB_ICONSTOP);
          Ferror := True;
          exit;
    end;
    Idtabela := strtoint(ftabbiometrica);
    if not TabelaCampoBio.locate('idtabela',idtabela,[loCaseInsensitive]) then begin
       application.messagebox('Tabela Biométrica não encontrada',' Índice não encontrado',MB_ICONSTOP);
       exit;
    end;

    if not  TabelaBiometrica.locate('idtabela',idtabela,[loCaseInsensitive]) then begin
       application.messagebox('Tabela Biométrica não encontrada',' Índice não encontrado',MB_ICONSTOP);
       exit;
    end;

    for k := 1 to Tabelacampobio.FieldCount - 1 do
        if Tabelacampobio.fields[k].AsString = '' then
           break;
    limitematriz := k - 1;

    j := 0;
    while (TabelaBiometrica['idtabela'] = idtabela) and (not(TabelaBiometrica.eof)) do begin
          for k := 1 to limitematriz do begin
              nomecampo := Tabelacampobio.Fields[k].FieldName;
              tam := length(nomecampo);
              nomecampo := copy(nomecampo,2,tam -1);
              nomecampo := 'V'+ nomecampo;
              mbio[k,j].campo := Tabelacampobio.fields[k].AsString;
              mbio[k,j].valor := TabelaBiometrica[nomecampo];
          end;
          if not(TabelaBiometrica.eof) then
             TabelaBiometrica.next;
          inc(j);
    end;
    //TROCA
    passoubiometrica := true;
 end;
 fim2       := pos(')',texto);
 fim1       := pos(',',texto);
 ini        := pos('(',texto);

 // descricao será o nome do indice biometrico usado. por exemplo ax
 descricao  := copy(texto,ini  + 1,(fim1 - ini  - 1));
 idade      := copy(texto,fim1 + 1,(fim2 - fim1 - 1));
 idade      := pegavalor(idade);
 i:=pos('.',idade);
 if i > 0 then
    idade:=copy(idade,1,i-1);

 numlinha:=strtoint(idade);

 for i:= 1 to 60 do
     if descricao = mbio[i,0].campo then
        break;

 anuidade := mbio[i,numlinha].valor;
 virgula := pos(',',anuidade);
 tam     := length(anuidade);
 result  := copy(anuidade,1,virgula - 1)+'.'+copy(anuidade,virgula+1,tam - virgula);
end;

Function tRegra.GrupoHipotese(texto:string):string;
var
 fim,idGrupo : integer;
 referencia    : string;
 valor         : string;
begin
 if fGrpHipotese = '' then begin
    pegacampo('HIPOTESE',false,valor);
    fGrpHipotese := valor;
    if fGrpHipotese = ' ' then begin
       application.messagebox('Problema no acesso ao grupo de hipóteses','Tabela  não aberta',MB_ICONSTOP);
       Ferror := True;
       exit;
    end;
 end;
 if not(passouhipotese) then begin
    try
       TabelaGrHipotese.open;
    except
          Ferror := True;
          exit;
    end;
    passouhipotese := true;
 end;
 IdGrupo := strtoint(fGrpHipotese);
 fim       := pos(')',texto);
 referencia := copy(texto,10,fim - 10);
 if  TabelaGrHipotese.locate('idGrupoHipotese;referencia',vararrayof([idgrupo,referencia]),[loCaseInsensitive]) then
     result := TabelaGrHipotese['vlrhipoteses']
 else begin
      referencia := lowercase(referencia);
      if  TabelaGrHipotese.locate('idGrupoHipotese;referencia',vararrayof([idgrupo,referencia]),[]) then
          result := TabelaGrHipotese['vlrhipoteses']
      else begin
           application.messagebox('Erro na fórmula de Hipótese','Valor não encontrado',MB_ICONSTOP);
           exit;
      end;
 end;
end;
//andre fim

{******************************************************************************}
// TOTALIZAINDICADOR(CODIGO_INDICADOR,MES_COMPETENCIA,ANO_COMPETENCIA,DATA_INICIO,
//                   DATA_FIM, TIPO_LANCAMENTO, CODIGO_IMOVEL, CODIGO_CONTRATO,
//                   CODIGO_GRUPO_APURACAO, CODIGO_SUBGRUPO_APURACAO)
Function TRegra.TOTALIZAINDICADOR(Formula : String) : String; 
var i : integer;
    FormulaAux : string;
    iIdIndicador     : Integer;
    iMesComp         : Integer;
    iAnoComp         : Integer;
    dDataIni         : TDateTime;
    dDataFim         : TDateTime;
    sTipoLanca       : String;
    iIdImovel        : Integer;
    iIdContrato      : Integer;
    iIdGrpApuracao   : Integer;
    iIdSubGrpApuracao: Integer;
    sParametro       : string;
    sSql             : string;
    sParam           : string;
begin
   // **************************************************************************
   // DECODIFICAÇÃO DA FORMULA - INICIO
   // **************************************************************************
   // 01. Tirar nome da formula e parenteses de abertura e fechamento
   FormulaAux := Trim(Formula);
   i          := Pos('(',FormulaAux);
   FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux) );
   i          := Pos(')',FormulaAux);
   FormulaAux := Copy(FormulaAux,1,i-1);
   // 02. Inicializar Parametros
   iIdIndicador     := -1;
   iMesComp         := -1;
   iAnoComp         := -1;
   dDataIni         := -1;
   dDataFim         := -1;
   sTipoLanca       := '';
   iIdImovel        := -1;
   iIdContrato      := -1;
   iIdGrpApuracao   := -1;
   iIdSubGrpApuracao:= -1;
   // 03. Preencher Parametros
   i          := Pos(',',FormulaAux);
   sParametro := Copy(FormulaAux,1,i-1);
   if Trim(sParametro) <> ''
   then begin
      sParametro := PegaValor(sParametro);
      if Trim(sParametro) <> ''
      then begin
         try
            iIdIndicador := StrToInt(sParametro);
         except
            iIdIndicador := -1;
         end;
      end;
   end;
   FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux));
   // -- iMesComp
   i          := Pos(',',FormulaAux);
   sParametro := Copy(FormulaAux,1,i-1);
   if Trim(sParametro) <> ''
   then begin
      sParametro := PegaValor(sParametro);
      if Trim(sParametro) <> ''
      then begin
         try
            iMesComp := StrToInt(sParametro);
         except
            iMesComp := -1;
         end;
      end;
   end;
   FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux));
   // -- iAnoComp
   i          := Pos(',',FormulaAux);
   sParametro := Copy(FormulaAux,1,i-1);
   if Trim(sParametro) <> ''
   then begin
      sParametro := PegaValor(sParametro);
      if Trim(sParametro) <> ''
      then begin
         try
            iAnoComp := StrToInt(sParametro);
         except
            iAnoComp := -1;
         end;
      end;
   end;
   FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux));
   // -- dDataIni
   i          := Pos(',',FormulaAux);
   sParametro := Copy(FormulaAux,1,i-1);
   if Trim(sParametro) <> ''
   then begin
      sParametro := PegaValor(sParametro);
      if Trim(sParametro) <> ''
      then begin
         try
            dDataIni := StrToDate(sParametro);
         except
            dDataIni := -1;
         end;
      end;
   end;
   FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux));

   // -- dDataFim
   i          := Pos(',',FormulaAux);
   sParametro := Copy(FormulaAux,1,i-1);
   if Trim(sParametro) <> ''
   then begin
      sParametro := PegaValor(sParametro);
      if Trim(sParametro) <> ''
      then begin
         try
            dDataFim := StrToDate(sParametro);
         except
            dDataFim := -1;
         end;
      end;
   end;
   FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux));

   // -- sTipoLanca
   i          := Pos(',',FormulaAux);
   sParametro := Copy(FormulaAux,1,i-1);
   if Trim(sParametro) <> ''
   then begin
      sParametro := PegaValor(sParametro);
      if Trim(sParametro) <> ''
      then sTipoLanca := sParametro;
   end;
   FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux));
   // -- iIdImovel
   i          := Pos(',',FormulaAux);
   sParametro := Copy(FormulaAux,1,i-1);
   if Trim(sParametro) <> ''
   then begin
      sParametro := PegaValor(sParametro);
      if Trim(sParametro) <> ''
      then begin
         try
            iIdImovel := StrToInt(sParametro);
         except
            iIdImovel := -1;
         end;
      end;
   end;
   FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux));
   // -- iIdContrato
   i          := Pos(',',FormulaAux);
   sParametro := Copy(FormulaAux,1,i-1);
   if Trim(sParametro) <> ''
   then begin
      sParametro := PegaValor(sParametro);
      if Trim(sParametro) <> ''
      then begin
         try
            iIdContrato := StrToInt(sParametro);
         except
            iIdContrato := -1;
         end;
      end;
   end;
   FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux));

   // -- iIdGrpApuracao
   i          := Pos(',',FormulaAux);
   sParametro := Copy(FormulaAux,1,i-1);
   if Trim(sParametro) <> ''
   then begin
      sParametro := PegaValor(sParametro);
      if Trim(sParametro) <> ''
      then begin
         try
            iIdGrpApuracao := StrToInt(sParametro);
         except
            iIdGrpApuracao := -1;
         end;
      end;
   end;
   FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux));

   // -- iIdSubGrpApuracao
   sParametro := Copy(FormulaAux,1,Length(FormulaAux)); // ultimo parametro
   if Trim(sParametro) <> ''
   then begin
      sParametro := PegaValor(sParametro);
      if Trim(sParametro) <> ''
      then begin
         try
            iIdSubGrpApuracao := StrToInt(sParametro);
         except
            iIdSubGrpApuracao := -1;
         end;
      end;
   end;
   // **************************************************************************
   // DECODIFICAÇÃO DA FORMULA - FIM
   // **************************************************************************
  Result := '0';

  // Define Parâmetros
  sParam := ' AND IDINDICADOR = ' + IntToStr(iIdIndicador) ;
  if iMesComp > 0     then sParam := sParam + ' AND MESCOMPETENCIA = ' + IntToStr(iMesComp) ;
  if iAnoComp > 0     then sParam := sParam + ' AND ANOCOMPETENCIA = ' + IntToStr(iAnoComp) ;
  if sTipoLanca <> '' then sParam := sParam + ' AND TIPOLANCA = ' + QuotedStr(sTipoLanca) ;
  if iIdImovel > 0    then sParam := sParam + ' AND IDIMOVEL = ' + IntToStr(iIdImovel) ;
  if iIdContrato > 0  then sParam := sParam + ' AND IDCONTRATO = ' + IntToStr(iIdContrato) ;
  if iIdGrpApuracao > 0    then sParam := sParam + ' AND IDGRPAPURACAO = ' + IntToStr(iIdGrpApuracao) ;
  if iIdSubGrpApuracao > 0 then sParam := sParam + ' AND IDSUBGRPAPURACAO = ' + IntToStr(iIdSubGrpApuracao) ;

  if (dDataIni > 0) and (dDataFim > 0) then
     sParam := sParam + ' AND DATAAPURACAO BETWEEN ' +
                        'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dDataIni)) + ',''DD/MM/YYYY'') AND ' +
                        'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dDataFim)) + ',''DD/MM/YYYY'') ' ;

  // Define Sql
  sSql := 'SELECT NVL(SUM(VLRAPURACAONUM),0) AS TOTAL '+
          '  FROM INDAPURACAO '+
          ' WHERE (TIPOINCLUSAO <> ''C'') '+ sParam;

  // Executa Query
  With QueryRegraAux Do
  Begin
      Close;
      Sql.clear;
      SQL.Add(sSQL);
      Open;
      if not IsEmpty
      then Result := FieldByName('TOTAL').AsString;
      Close;
  end;
end; // TOTALIZAINDICADOR

{******************************************************************************}
{ Formula PR2                                                                  }
Function TRegra.PR2(Texto:string):string;
Type
// Tipos Declarados pelo Desenvolvedor
  FlagSRB = Record
              Tipo: Integer;
            End;
  Indice  = Record
             Nome: String;
             Data: String;
            End;
  tFator  = Record
              Fator    : Extended;
              Fatoracum: Extended;
              Mes      : String;
            End;

  tSalario= Record
              Mes    : String[7];
              Salario: Currency;
              Teto   : Double;
              Tipo   : Integer;
            End;
Var
  TabIndices:Array [0..20]  of Indice;
  TabFator  :Array [0..700] of tFator;
  TabSal    :Array [0..700] of tSalario;
  TabFlgSRB :Array [0..9]   of FlagSRB;

  vMesAux, vSqlAux, vSql, FormulaLoc, palavra, sdata, sdatad, sdatafim, sDataref,
  smesbase, smesSal, sMesSeg, sTeto, sNumSal, sTipoMedia, sTipo, vFormula,
  vMesAnt, vDtIni, sMesDataBase, sCorrecao, sTipoCalc : string;

  sAno:string[4];
  Letra,FlgGrava:string[1];
  vRes, wValAux, wVal, P, I, J, X, Y, V, T, Cont, ContSal,wVal1,
  wValOld, ContMes,iNumSal, wInt, iValCoversao :Integer;
  vZero, vTipoCalc, vDif, LinOk, Linha, vMesBas, vMesRef, vAno, vQtd,
  vFlag, moedabase :LongInt;

  FatorAnt,TotalSal :Double;
  ValorAux:Extended;

  Primeiro, sAchou, vAchou, TemFlg, flgnome, flginc, flgmoedanova : Boolean;

  vFatUlt, vFatorAux, vFator, vAcum, vIni : Real;
  wNumCasasFator, wStrAux, sDataAux :String;

  //Variável criada para conter a data final das cotações
  sDataCotacao : String;

begin
  For  I := 0 to 20 Do Begin
    TabIndices[I].Nome := '';
    TabIndices[I].Data := '';
  End;

  sCorrecao   := '';
  sMesDataBase:= '';
  vTipoCalc   := 0;
  wNumCasasFator   := '0';

//------------------------------------------------------------------------------
// DECODIFICA A FORMULA

// Retira Nome da Formula
  FormulaLoc  := Copy(sFormulaAux,5,Length(sFormulaAux)-5);

// Este é utilizado para novo parametros apos o parametro FLGSRB.
  vFormula := FormulaLoc;
  P:=0;
  I:=1;
  Letra  := '';
  Palavra:= '';
  FlgInc := False;
  FlgNome:= True;
  FormulaLoc:= Copy(FormulaLoc,I+1,Length(FormulaLoc)-1);
// Loop para separar os Indexadores e as Datas en que eles foram usados
// e preencher a Tabela de Indices
  Repeat
    if Pos(Letra,',') <> 0 then begin
      if Palavra <> '' then begin
// Guarda Nome do Indexador ou Data usada, de acordo com a vez no Loop
        if FlgNome then begin
          TabIndices[P].nome := PegaValor(palavra);
          FlgNome:=False;
        end else begin
          Tabindices[P].Data := DataParaMes(PegaValor(Palavra),0,'I');
          FlgNome:=True;
          FlgInc :=True;
        end;
        Palavra := '';
      end;
// Caso tenha lido uma data, pula para proxima posição na Tabela de Indices
      if FlgInc then begin
         P:=P+1;
         FlgInc:=False;
      end;
      Letra:='';
    end;
// Atualiza Informações da formuá sendo decodificada
    Palavra:=Palavra+Letra;
    Letra  :=Copy(FormulaLoc,1,1);
    FormulaLoc := Copy(FormulaLoc,2,Length(FormulaLoc)-1);

  Until Letra=']';

// Como Ultima Data de Parametro não tem virgula Apos, Guarda ela Aqui Fora.
  TabIndices[P].Data:=DataParames(PegaValor(Palavra),0,'I');

// Guarda Data de Referencia
  I       := Pos(',',FormulaLoc);
  sDataRef:= Copy(FormulaLoc,1,I-1);
  sDataRef:= PegaValor(sDataRef);
  FormulaLoc:=Copy(FormulaLoc,I+1,Length(FormulaLoc));

// Guarda Sigla da Moeda usada como Teto do Provento
  I    := Pos(',',FormulaLoc);
  sTeto:= Copy(FormulaLoc,1,I-1);

  // Se o usuario nao passar o teto, nao precisa parar o processamento, basta nao
  // tetar o salario
  if Trim(sTeto) = ''
  then sTeto := '0'
  else sTeto:= Pegavalor(sTeto);

  FormulaLoc:= Copy(FormulaLoc,I+1,length(FormulaLoc));

// Guarda Número de salários para fazer a média.
  I      := Pos(',',FormulaLoc);
  sNumSal:= Copy(FormulaLoc,1,I-1);
  sNumSal:= PegaValor(sNumSal);
  FormulaLoc:=Copy(FormulaLoc,I+1,length(FormulaLoc));

// Guarda Tipo de Média desejada
//   0 - Soma os salários e divide por numsal.
//   1 - Divide pelo nº de salários <> Zero.
//   2 - Média retroativa
  I         := Pos(',',FormulaLoc);
  sTipoMedia:= Copy(FormulaLoc,1,I-1);
  sTipoMedia:= PegaValor(sTipoMedia);
  FormulaLoc:= Copy(FormulaLoc,I+1,length(FormulaLoc));

// Guarda Tipo de Cálculo que será feito com a PR2,
// para fins de relatório.
  I    := Pos(',',FormulaLoc);
  sTipo:= Copy(FormulaLoc,1,I-1);
  sTipo:= Pegavalor(sTipo);


// Grava Flag de gravação na memória de cálculo.
// 1 - Grava 0 - Não Grava.
  FormulaLoc:=Copy(FormulaLoc,I+1,Length(FormulaLoc));
  I := Pos(',',FormulaLoc);
  if I = 0 then begin
    I := Length(FormulaLoc) + 1;
  end;
  FlgGrava := Copy(FormulaLoc,1,i-1);
  FlgGrava := PegaValor(FlgGrava);

// Guarda Forma de Resultado
//   0 - Sem Formato
//   1 - Arredondado
//   2 - Truncado
  vZero := 0;
  FormulaLoc := Copy(FormulaLoc,I+1,Length(FormulaLoc));
// Faz Testes para saber se esses parametros foram ou não Preenchidos
  I := Pos(',',FormulaLoc);
  J := Pos('{',FormulaLoc);

  If ((I < J) And (J > 0)) Or (I > 0) Then Begin
    if i = 0 then
      I := Length(FormulaLoc) + 1;

    try
      vRes := StrtoInt(PegaValor(Copy(FormulaLoc,1,I-1)));
    except
      vRes := 0;
    end;
    if (vRes <> 0) and (vRes <> 1) and (vRes <> 2) then
      vRes := 0;

// Guarda Tipo de Indice
//   0 ou Nulo - Utiliza Indices menores que ZERO inclusive
//   1         - Utiliza Indices menores que ZERO como ZERO
    FormulaLoc := Copy(FormulaLoc,I+1,Length(FormulaLoc));
    I := Pos(',',FormulaLoc);
    If (I < Pos('{',FormulaLoc)) Or (I = 0) then begin
      if I = 0 then
        I := Length(FormulaLoc) + 1;
      vZero := 0;
      Try
        vZero := StrtoInt(PegaValor(Copy(FormulaLoc,1,I-1)));
        FormulaLoc := Copy(FormulaLoc,i+1,Length(FormulaLoc));
      except
        vZero := 0;
      end;
    end;

    I     := Pos('{',FormulaLoc);
    TemFlg:= True;
    if  I = 0 then begin
      I := Length(FormulaLoc) + 1;
      TemFlg := False;
    end;

  end else begin
    I     := Pos('{',FormulaLoc);
    TemFlg:= True;
    if  I = 0 then begin
      I := Length(FormulaLoc) + 1;
      TemFlg := False;
    end;

    try
      vRes := StrtoInt(PegaValor(copy(FormulaLoc,1,i-1)));
    except
      vRes := 0;
    end;

    if (vRes <> 0) and (vRes <> 1) and (vRes <> 2) then
      vRes := 0;
  end;


  For I := 0 To 9 Do
    TabFlgSRB[i].Tipo := -1; // Para por em Tipo não utilizado

// Guarda Tabela de Flags de SRB (Tipo de Salário)
//   1 - Salário de ativo e mantido.
//   2 - Benefício pago pela folha de beneficios.
//   3 - Benefício pago pelo INSS.
//   4 - Salário Virtual.
//   5 - Salário de mantido parcial.
//   0 - Outro tipo de salário.
// Caso não seja declarado nada em FLGSRB, serão utilizados todos os tipos acima.
// Com a seguinte ressalva :
//   Se num mês o tipo for 4, serão desconsiderados os tipos 2 e 3.
  vQtd := 0;
  if TemFlg then begin
    I := Pos('{',FormulaLoc);
    T := Pos('}',FormulaLoc);
    If I <> 0 then
      FormulaLoc := Copy(FormulaLoc,2,Length(FormulaLoc));

    I := Pos(',',FormulaLoc);
    if I = 0 then
      I := pos('}',FormulaLoc);

    while I <> 0 do begin
      vFlag := StrtoInt(Copy(FormulaLoc,1,I-1));
      TabFlgSRB[vQtd].Tipo := vFlag;
      FormulaLoc:=Copy(FormulaLoc,I+1,length(FormulaLoc));
      Inc(vQtd);
      I := Pos(',',FormulaLoc);
      T := Pos('}',FormulaLoc);
      If T < I Then I := T;
    end;
    I := pos('}',FormulaLoc);
    if i > 0 then begin
      vFlag :=StrtoInt(copy(FormulaLoc,1,i-1));
      TabFlgSRB[vQtd].Tipo := vFlag;
      FormulaLoc := Copy(FormulaLoc,i+1,Length(FormulaLoc));
    end;
  end
  else begin
    // VERIFICAR SE TEM PARAMETROS DE CORRECAO
    if Pos('[', FormulaLoc) <= 0
    then begin
       i := Pos(',', FormulaLoc);
       FormulaLoc:=Copy(FormulaLoc,I+1,length(FormulaLoc)); // tirar virgula
    end;
  end;


// Pega novos parametros para correcao apos uma DataBase
// Implementação de codigo para correcao de valores a partir de uma database
  I := Pos('[', FormulaLoc);
  if i > 0
  then begin
     FormulaLoc:=Copy(FormulaLoc,I+1,length(FormulaLoc));
     vFormula := FormulaLoc;
     I := Pos(',', vFormula);
     If I = 0 then I := Pos(']', vFormula);
     sCorrecao := Copy(vFormula,1,i-1);
     sCorrecao := PegaValor(sCorrecao);
     sCorrecao := TrocaCaracter(sCorrecao,',','.');

     if sCorrecao <> '' then sCorrecao := FloattoStr((StrtoFloat(sCorrecao)/100)+1);
     i := Pos(',', vFormula);
     if i = 0 then i  := Pos(']', vFormula);
     vFormula := Copy(vFormula,i+1,Length(vFormula));
     i := Pos(',', vFormula);
     if i = 0 then  i  := Pos(']', vFormula);

     sMesDataBase :=  Copy(vFormula,1,I-1);
     vFormula := Copy(vFormula,I+1,Length(vFormula));
     if sMesDataBase <> ''
     then begin
       I  := Pos(']', vFormula);
       sMesDatabase := PegaValor(sMesDatabase);
       if sMesDatabase <> ''
       then begin
         vMesBas := StrtoInt(sMesDatabase);
         vMesRef := StrtoInt(Copy(sDataRef,4,2));
         vAno := StrtoInt(Copy(sDataRef,7,4));
         if vMesBas > vMesRef then vAno := vAno - 1;
         if Length(InttoStr(vMesBas)) = 1
         then sMesDatabase := InttoStr(vAno)+'/0'+InttoStr(vMesBas)
         else sMesDatabase := InttoStr(vAno)+'/'+InttoStr(vMesBas);
       end;
       sTipoCalc := Copy(vFormula,1,Length(vFormula)-1);
       sTipoCalc := PegaValor(sTipoCalc);
       try
         vTipoCalc := StrtoInt(sTipoCalc);
       except
         vTipoCalc := 0;
       end;
     end;
     if sMesDatabase = '' then sCorrecao := '';
     if sCorrecao = ''    then sMesDatabase := '';
     i := Pos(']',FormulaLoc);
     FormulaLoc := Copy(FormulaLoc,i+1,Length(FormulaLoc));
  end
  else begin
    i := Pos(',', FormulaLoc);
    FormulaLoc:=Copy(FormulaLoc,I+1,length(FormulaLoc)); // tirar virgula
  end;

// Monta SQL e ou Invalida Tabela de Tipo de Salario (SRB)
  vSqlAux := '';
  For I := 0 To 9 Do Begin
    If TabFlgSRB[I].Tipo = -1 Then
      Break
    Else Begin
      If i = 0 then
        vSqlAux := '(H.FLGSRB IN (';
        vSqlAux := vSqlAux + InttoStr(TabFlgSRB[i].Tipo);
        if TabFlgSRB[i+1].Tipo > -1 then
          vSqlAux := vSqlAux + ',';

    end;

  end;

  vSql := vSql + ' AND (NVL(FLGESTORNO, 0) = 0) ';

// Caso Tenha Flag SRB ou não Acerta Filtro da Pesquisa
  if vSqlAux <> '' then
    vSqlAux := vSql + ' AND (H.FLGSRB > 0) AND (H.FLGSRB IS NOT NULL) AND '+vSqlAux + '))) hst, '
  else
    vSqlAux := vSql +' AND (H.FLGSRB IS NOT NULL) AND (H.FLGSRB > 0)) HST, ';


  // Verificar se tem o parametro wNumCasasFator
  i := Pos(',',FormulaLoc);
  if i > 0
  then begin
     wNumCasasFator := Copy(FormulaLoc, i+1, Length(FormulaLoc));
     wNumCasasFator := PegaValor(FormulaLoc);
  end;

// FIM DA DECODIFICAÇÃO DA FORMULA
//------------------------------------------------------------------------------

  {----------------------------------------------------------------------------}
  { Busca valores dos indices (Fatores) no periodo e acumula.                  }

  { Inicia Variaveis }
  sData    := TabIndices[0].Data;
  sAno     := sData;
  sDataFim := sData;
  MoedaBase:= 0;
  FlgMoedaNova:=False;
  Tabfator[0].Fatoracum:=1;
  Tabfator[0].Mes      := '';
  I :=1;
  P :=0;                                    
  Fatorant:=1;

  sDataD  :=Subtrair(DataParaMes(sDataRef,0,'I'),1);
  sData   :=Subtrair(sData,1); 

  wValOld :=1;
  
  {----------------------------------------------------------------------------}
  { Executa Rotina de .....                                                    }
  { 48 Vezes ou caso não existam mais indexadores                              }
  While (I <= 48) and (TabIndices[P].Nome <> '') Do Begin

    if TabIndices[P+1].Nome = '' then
      sDataFim:=Subtrair(sData,48)
    else
      sDataFim:=TabIndices[P+1].Data;

    { Busca Fatores de correcao }
    With QueryRegraAux Do Begin
      Close;
      Sql.clear;

      vSql := 'SELECT '+RuleNumber+' AS IDREGRA, '+
              '  C.COTMESREF, C.COTVALOR FROM MOEDA M,COTACAOMOEDA C '+
              'WHERE (M.MOECODIGO=C.MOECODIGO) AND '+
              ' (M.MOESIGLA ='''+TabIndices[P].Nome+''') AND '+
              ' (TO_DATE(C.COTMESREF,''MMYYYY'') <=TO_DATE('''+
                Copy(sData,6,2)+Copy(sData,1,4) +''',''MMYYYY'')) AND '+
              ' (TO_DATE(C.COTMESREF,''MMYYYY'') > TO_DATE('''+
                Copy(sDataFim,6,2)+copy(sDataFim,1,4) + ''',''MMYYYY'')) '+
              'ORDER BY TO_DATE(COTMESREF,''MMYYYY'') DESC';

      Sql.Add(vSql);
      Open;
    End;// With

// Verifica a Diferença entre as datas
    if (vTipoCalc = 1) and (sMesDatabase <> '') then begin
      if sMesDatabase > sData then
        sData := sMesDatabase;
    end;
    vDif := SubtrairMeses(sData, sDataFim);

    if wValOld = 1 then begin
      wVal1 := Queryregraaux.RecordCount;
      if vDif > wVal1 then
        wVal1 := vDif;
    end else begin
      wVal1 := queryregraaux.recordcount + wValOld;
      if vDif > queryregraaux.recordcount then
        wVal1 := vDif + wValOld;
    end;

    vAchou := False;
// Inicia o Vetor. Somente a quantidade de vezes necessárias,
// Preenche as Datas dos fatores que serão utilizados
    For X := wValOld To wVal1 Do Begin
      If Not vAchou Then Begin
        vAchou := True;
      End Else Begin
        sData := Subtrair(sData,1);
      End;
// Preenche a Tabela de Fatores, Já incluindo as Datas, Decrementadas da data de
// Referencia
      TabFator[X].Mes       := sData;
      TabFator[X].fator     := 1;
      TabFator[X].fatoracum := 1;
    End;

    wValOld := wVal1+1;

// Volta ao Inicio da Consulta dos Fatores
    QueryRegraAux.First;

    { Preenchendo o Tabela de Indices com os Fatores }
    While Not QueryRegraAux.Eof Do Begin
      { Guarda o Mes do Fator na Consulta }
      vMesAux := Copy(QueryRegraAux.FieldByName('COTMESREF').AsString,3,4)+'/'+
                 Copy(QueryRegraAux.FieldByName('COTMESREF').AsString,1,2);

      { Varre a Tabela de Fatores verificando se a data da Consulta Existe na }
      { Tabela de Fatores                                                     }
      For J := 1 To 700 Do Begin
        { Caso Data na Consulta exista na Tabela de Fatores }
        if TabFator[J].Mes = vMesAux then begin
          Tabfator[J].FatorAcum := 1;
          if vZero = 0 then
            tabfator[J].fator:= QueryRegraAux.FieldByName('COTVALOR').asfloat/100+1
          else begin
            if QueryRegraAux.FieldByName('COTVALOR').asfloat > 0 then
              Tabfator[J].Fator:= QueryRegraAux.FieldByName('COTVALOR').asfloat/100+1
            else
              Tabfator[J].Fator:= 1;
          end;
          Break;
        end;

        if Trim(TabFator[J].Mes) = '' then
          Break;

      End;// For

      { Proximo Registro da Consulta do Fatores }
      QueryRegraAux.Next;

    End;// While

// Atualizar o Valor do MesDatabase
    if (vTipoCalc = 1) and (sMesDatabase <> '') then
      for i := 1 to 700 do
        if TabFator[i].Mes = sMesDataBase then begin
          TabFator[i].fator := StrtoFloat(sCorrecao);
          Break;
        end;

// Faz a acumulação dos fatores sem a database
    If sMesDatabase = '' Then
      For X := 1 to 700 do Begin
        TabFator[X].FatorAcum:=(TabFator[X].Fator*TabFator[X-1].FatorAcum);

// Arredonda o Fator de Acordo com Parametro da Formula
          If wNumCasasFator > '0' Then Begin
            wStrAux := 'ROUND('+FloatToStr(TabFator[X].FatorAcum)+','+wNumCasasFator+')';
            TabFator[X].FatorAcum  := StrToFloat(Arredonda(wStrAux));
          End;
      End
    Else begin //Faz a acumulação dos fatores com a database
      if vTipoCalc = 0 then begin
        vAcum := 1;
        vFator := 1;
        for x := 1 to 700 do begin
          if sMesDatabase = tabfator[x].Mes then
            LinOK := x;

          if sMesDatabase >= tabfator[x].Mes then begin
            tabfator[x].fatoracum := (vAcum*vFator);
            vAcum := tabfator[x].fatoracum;
            vFator := tabfator[x].fator;
          end;

        end;

        vIni := 1;
        for x := LinOk - 1 downto 1 do begin
          tabfator[x].fatoracum:=(tabfator[x].fator*vIni);
          vIni := tabfator[x].fatoracum;
        end;

      end;// If

    End;// Else

    inc(p);
    sdata:=tabindices[p].data;

  End; { While (I <= 48) and (TabIndices[P].Nome <> '') }
  {----------------------------------------------------------------------------}


  if vTipoCalc = 1 then begin
    // Faz a Acumulação dos Descontos (DataBases)
    vFatUlt := 1;
    for x := 1 to 700 do begin
      if Copy(TabFator[x].Mes,6,2) = Copy(sMesDatabase,6,2) then begin
        TabFator[x].FatorAcum := vFatUlt;
        vFatUlt := vFatUlt * TabFator[x].Fator;
      end;
    end;


  // Faz a acumulação dos outros fatores
    vFatUlt := 1;
    for x := 700 downto 1 do begin
      if Copy(TabFator[x].Mes,6,2) = Copy(sMesDatabase,6,2) then
        vFatUlt := 1;
      if (Copy(TabFator[x].Mes,6,2) <> Copy(sMesDatabase,6,2)) and
         (TabFator[x].Mes <> '')
      then begin
        vFatUlt := vFatUlt * TabFator[x].Fator;
        TabFator[x].FatorAcum := vFatUlt;
      end;
    end;


    vFatUlt := 1;

    for x := 700 downto 1 do begin
      if TabFator[x].Mes <> '' then begin
        if Copy(TabFator[x].Mes,6,2) = Copy(sMesDatabase,6,2) then
          vFatUlt := TabFator[x].FatorAcum
        else
          TabFator[x].FatorAcum := vFatUlt / TabFator[x].FatorAcum;
      end;
    end;

  end; //If

  vAcum := 1;
  if sMesDataBase <> '' then
    vAcum := StrtoFloat(sCorrecao);

  try
    QueryIn.FieldbyName('IDPESSOA').AsString;
  except
    MsgDlgRegra('Campo IDPESSOA necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
    Exit;
  end;

  try
    QueryIn.FieldbyName('IDPESSJUR').AsString;
  except
    MsgDlgRegra('Campo IDPESSJUR necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
    Exit;
  end;

//------------------------------------------------------------------------------
// MONTA VETOR DE SALARIOS

  QueryRegraAux.Close;
  QueryRegraAux.Sql.Clear;

  if sTeto = '0' then begin
    vSQL := ' SELECT H.MES, H.VALORPROVENTO, MAX(H.MES) AS MESTETO, H.FLGSRB,H.IDRUBRICA , '+
            '        999999999999 TETO '+ 
            ' FROM   HISTRUBSAL H  '+
            ' WHERE  (H.IDPESSOA  = '+QueryIn.FieldbyName('IDPESSOA').AsString+') AND  '+
            '        (H.'+sCampoPesquisa+'   = '+QueryIn.FieldbyName('IDPESSJUR').AsString+') AND '+
            '        (H.MES <='''+ sDatad+''') AND (SUBSTR(H.MES,6,2) < TO_CHAR(13))   '+
            Copy(vSqlAux,1,Length(vSQLAux) - 7)+
            ' GROUP BY H.MES, H.VALORPROVENTO, H.FLGSRB, H.IDRUBRICA '+
            ' ORDER BY H.MES DESC,H.FLGSRB DESC';
  end else begin
    vSql :=    'SELECT '+RuleNumber+' AS IDREGRA, SALTETO.MES,SALTETO.VALORPROVENTO,MESTETO,CT.COTVALOR AS TETO,SALTETO.FLGSRB,SALTETO.IDRUBRICA '+
               'FROM '+
               '    (SELECT  MES,VALORPROVENTO,MAX(MESREF) MESTETO,FLGSRB,IDRUBRICA '+
               '     FROM '+
               '         (SELECT HST.MES,HST.VALORPROVENTO,COT.MESREF,COT.COTVALOR AS TETO,'+
               '                 HST.FLGSRB,HST.IDRUBRICA '+
               '          FROM   (SELECT H.MES,H.VALORPROVENTO,H.FLGSRB,H.IDRUBRICA '+
               '                  FROM   HISTRUBSAL H  '+
               '                  WHERE  (H.IDPESSOA  = '+QueryIn.FieldbyName('idpessoa').AsString+')  AND '+
               '                         (H.'+sCampoPesquisa+'   = '+QueryIn.FieldbyName('idpessjur').AsString+') AND '+
               '                         (H.MES <='''+ sDatad +''') AND (SUBSTR(H.MES,6,2) < TO_CHAR(13))   '+
               vSqlAux+
               '                 (SELECT C.COTVALOR,SUBSTR(C.COTMESREF,3,4)||''/''||SUBSTR(C.COTMESREF,1,2) AS MESREF '+
               '                  FROM   MOEDA M, COTACAOMOEDA C '+
               '                  WHERE  (M.MOESIGLA='''+STETO+''') AND '+
               '                         (M.MOECODIGO = C.MOECODIGO) AND '+
               '                         (C.COTDATA  <= TO_DATE('''+sDataRef+''',''DD/MM/YYYY''))) COT '+
               '          WHERE  (HST.MES>=COT.MESREF) '+
               '          GROUP  BY HST.MES,HST.VALORPROVENTO,COT.COTVALOR, '+
               '                    HST.FLGSRB,HST.IDRUBRICA,COT.MESREF,COT.COTVALOR '+
               '          HAVING COT.MESREF = MAX(COT.MESREF)) '+
               '     GROUP BY MES,VALORPROVENTO,FLGSRB,IDRUBRICA) SALTETO, '+
               '     MOEDA MO, COTACAOMOEDA CT '+
               'WHERE (MO.MOESIGLA='''+sTeto+''') AND '+
               '      (MO.MOECODIGO = CT.MOECODIGO) AND '+
               '      (SALTETO.MESTETO=SUBSTR(CT.COTMESREF,3,4)||''/''||SUBSTR(CT.COTMESREF,1,2)) '+
               'ORDER BY SALTETO.MES DESC,SALTETO.FLGSRB DESC';

  end;

  QueryRegraAux.Sql.Add(vSql);
  QueryRegraAux.Open;

  if QueryRegraAux.IsEmpty then begin
    Result := '0';
    exit;
  end;

  For  wInt := 0 to 700 Do Begin
    TabSal[wInt].Salario:= 0;
    TabSal[wInt].Mes := '';
    TabSal[wInt].Teto:= 0;
    TabSal[wInt].Tipo:= 0;
  End;


  Cont   := 0;
  ContSal:= 0;

  sMesbase:= sDataRef;
  sMesSal := sDataRef; // Busca a data de referencia da formula
  sMesSeg := Paradata('PARADATA('+QueryRegraAux.FieldByName('MES').AsString+',D)'); //Busca a maior data
  ContMes := strToInt(IdadeEmMeses(sMesSeg,sMesSal));

  If ContMes > 1 Then begin
    for i:= 1 to ContMes-1 do begin
      inc(Cont);
      tabsal[cont].salario:= 0;
      tabsal[cont].mes    := subtrair(copy(smesbase,7,4)+'/'+copy(smesbase,4,2),cont);
    end;
    inc(Cont);
  end;

  If cont = 0 then
    Inc(Cont);


  { Códigos do Flag SRB:                    }
  {     1 - Salário de ativo                }
  {     2 - Auxilio doença                  }
  {     3 - Benefício do INSS               }
  {     4 - Salario Virtual                 }
  {     5 - Salario de Manutenção Parcial   }


  iValCoversao :=1;
  {----------------------------------------------------------------------------}
  { Preenche o Vetor de Salarios com os salarios pêgos na consulta anterior    }
  While Not (QueryRegraAux.Eof) And (ContSal < StrToInt(sNumSal)) do begin

    { Caso FLGSRB = 4 }
    If QueryRegraAux.FieldbyName('FLGSRB').AsInteger = 4 then begin

      TabSal[Cont].Mes := QueryRegraAux.FieldByName('MES').AsString;

      { Caso o salario seja maior que o teto, fica sendo o valor do teto }
      If QueryRegraAux.FieldByName('VALORPROVENTO').asFloat <
         QueryRegraAux.FieldByName('TETO').asFloat
      Then
        TabSal[cont].salario := QueryRegraAux.FieldByName('VALORPROVENTO').asFloat
      Else
        TabSal[cont].salario := QueryRegraAux.FieldByName('TETO').asFloat;

      TabSal[cont].teto := QueryRegraAux.FieldByName('TETO').asFloat;
      TabSal[cont].tipo := QueryRegraAux.FieldByName('FLGSRB').AsInteger;

    End Else Begin
      { Verifica se o vetor é diferente do Tipo FLGSRB 4 }
      If (TabSal[Cont].Tipo <> 4) Then Begin
        { Caso FLGSRB = 2 ou 3 }
        Case QueryRegraAux.FieldbyName('FLGSRB').AsInteger of
          2..3:begin
                 TabSal[cont].mes := QueryRegraAux.FieldByName('MES').AsString;
                 { Caso o salario seja maior que o teto, fica sendo o valor do teto }
                 if QueryRegraAux.FieldByName('VALORPROVENTO').asFloat <
                    QueryRegraAux.FieldByName('TETO').asFloat
                 then begin
                   TabSal[cont].salario :=Tabsal[cont].salario + QueryRegraAux.FieldByName('valorprovento').asFloat;
                 end else
                   TabSal[cont].salario := QueryRegraAux.FieldByName('TETO').asFloat;

                 if TabSal[cont].salario > QueryRegraAux.FieldByName('TETO').asFloat then
                   TabSal[cont].salario := QueryRegraAux.FieldByName('TETO').asFloat;

                 TabSal[cont].teto := QueryRegraAux.FieldByName('TETO').asFloat;
                 TabSal[cont].tipo := QueryRegraAux.FieldByName('FLGSRB').AsInteger;
               end;

        End;{ Case }

      End;{ If TabSal[Cont].Tipo }

      { Caso FLGSRB = 5 }
      if QueryRegraAux.FieldbyName('FLGSRB').AsInteger = 5 then begin

        TabSal[cont].mes := QueryRegraAux.FieldByName('MES').AsString;

        { Caso o salario seja maior que o teto, fica sendo o valor do teto }
        if QueryRegraAux.FieldByName('VALORPROVENTO').asFloat <
           QueryRegraAux.FieldByName('TETO').asFloat
        then begin
          TabSal[cont].salario := TabSal[cont].salario + QueryRegraAux.FieldByName('valorprovento').asFloat;
        end else
          TabSal[cont].salario := TabSal[cont].salario + QueryRegraAux.FieldByName('Teto').asFloat;

        if TabSal[cont].salario > QueryRegraAux.FieldByName('TETO').asFloat then
          TabSal[cont].salario := QueryRegraAux.FieldByName('TETO').asFloat;

        TabSal[cont].Teto := QueryRegraAux.FieldByName('TETO').asFloat;
        TabSal[cont].Tipo := QueryRegraAux.FieldByName('FLGSRB').AsInteger;

      end else begin

        { Caso FLGSRB = 1 }
        if QueryRegraAux.FieldbyName('FLGSRB').AsInteger = 1 then begin

          TabSal[cont].mes := QueryRegraAux.FieldByName('MES').AsString;

          { Caso o salario seja maior que o teto, fica sendo o valor do teto }
          if QueryRegraAux.FieldByName('VALORPROVENTO').asFloat <
             QueryRegraAux.FieldByName('TETO').asFloat
          Then begin
            TabSal[cont].salario := TabSal[Cont].Salario +
                                    QueryRegraAux.FieldByName('VALORPROVENTO').asFloat;
          end else
            TabSal[cont].salario := QueryRegraAux.FieldByName('TETO').asFloat;

          if tabsal[cont].salario > QueryRegraAux.FieldByName('TETO').asFloat then
            TabSal[cont].salario := QueryRegraAux.FieldByName('TETO').asFloat;

          TabSal[cont].teto := QueryRegraAux.FieldByName('TETO').asFloat;
          TabSal[cont].tipo := QueryRegraAux.FieldByName('FLGSRB').AsInteger;
        end;
      end;

    End;

    { Proximo Registro da Consulta de Salarios }
    QueryRegraAux.Next;

    sMesBase:= TabSal[Cont].Mes;
    sMesSal := Paradata('PARADATA('+TabSal[cont].mes+',D)');
    sMesSeg := Paradata('PARADATA('+QueryRegraAux.FieldByName('MES').AsString+',D)');

    { Pepara para executar a formula DIFMESES }
    sFormulaAux:='DifMeses(#'+sMesSal+',#'+sMesSeg+')';
    Difmeses;
    ContMes:= StrToInt(fResult); { Pega Resultado da Formula DIFMESES }
    if ContMes > 1 Then begin
      for i:= 1 to ContMes-1 do begin
        inc(Cont);
        tabsal[cont].salario :=0;
      end;
    end;

    { Pepara data para a execucao da atualização de valores, caso haja }
    If TabSal[Cont].Mes <> ''  Then Begin
      sDataAux := '01/'+
                 Copy(TabSal[Cont].Mes,6,2)+'/'+
                 Copy(TabSal[Cont].Mes,1,4);
      { Executa a Atualização do Salario nas Conversões de Moeda, caso existam }
      AtualizaValorReal(ValorAux { valor },
                        TabSal[Cont].Salario { Reais (Salario) },
                        1 { fator },
                        StrToDate(sDataAux), StrToDate(sDataRef), { Datas de Referencia }
                        'F' { fixo } );
    End;


    { Caso tenha mudado o Mes de Processo, Incrementa o Contado do Vetor }
    If QueryRegraAux.FieldByName('MES').AsString < smesbase then begin
      if TabSal[Cont].Salario > 0 then
        inc(ContSal);
      inc(Cont);
    End;

  End;{ While Not (QueryRegraAux.Eof) }


  {----------------------------------------------------------------------------}
  { Atualiza os Salarios e/ou grava na Memória e Calculo                       }
  if sTipoMedia = '2' then
    iNumsal :=Cont
  else
    iNumSal := strtoint(sNumSal);

  { Faz o Reajuste de Valores }
  For I := 1 to iNumSal do begin
    J := 1;
    sAchou := False;
    while TabFator[j].mes <> '' do begin
      if TabSal[i].Mes = TabFator[j].mes then begin
        sAchou := True;
        break;
      end;
      inc(j);
    end;

    // Verifica se achou o fator acumulado para o mes escolhido
    vFator := 1;
    Case vTipoCalc of
      0:begin
          if sAchou then
            vFator := TabFator[j].FatorAcum
          else begin
            if (TabSal[i].Mes > sMesDatabase) and (sMesDatabase <> '') then
              vFator := TabFator[1].FatorAcum;
          end;
          if (TabSal[i].Mes > sMesDatabase) and (sMesDatabase <> '') then begin
            TabSal[i].salario:=TabSal[i].salario*vAcum / vFator;
            vFatorAux := vAcum / vFator;
          end else begin
            if sAchou then begin
              TabSal[i].salario:=(TabSal[i].salario*vFator)*vAcum;
              vFatorAux := vFator * vAcum;
            end else begin
              TabSal[i].salario:=(TabSal[i].salario*1)*vAcum;
              vFatorAux := 1 * vAcum;
            end;
          end;
        end;

      1:begin
          vFatorAux := TabFator[j].FatorAcum;
          if TabSal[i].salario > 0 then
            TabSal[i].salario := TabSal[i].salario * vFatorAux;
        end;

    End;//Case

    { Grava na memoria de calculo caso desejado na Formula }
    If FlgGrava = '1' Then Begin

      If FidCalculo = 0 Then Begin
        FidCalculo := LeUltRegistro(nil, 'CALCULO');
        QueryRegra.close;
        QueryRegra.SQL.clear;
        QueryRegra.SQL.Add('INSERT INTO CALCULO (IDCALCULO) VALUES ('+inttostr(FidCalculo)+')');
        Queryregra.ExecSQL;
      End;

      If (Trim(TabSal[I].Mes) <> '') Then Begin
        FidCalculoBenef := LeUltRegistro(nil, 'CALCULOBENEF');
        QueryRegra.close;
        QueryRegra.SQL.clear;
        QueryRegra.SQL.Add('INSERT INTO CALCULOBENEF (IDCALCULO, IDCALCULOBENEF,'+
                           ' INDICEACUM,SALARIOVP,TETOINSS,MES,TIPOCALCULO,IDREGRA)'+
                           'VALUES '+
                           '('''+
                            floattostr(FidCalculo)   +''','+
                            InttoStr(FidCalculoBenef)+','+
                            floattostr(vFatorAux)    +','+
                            floattostr(TabSal[i].salario)+','+
                            floattostr(tabsal[i].teto)   +','''+
                            tabsal[i].mes+''','''+
                            sTipo        +''','''+
                            inttostr(iRegraMaster)+''')');
        QueryRegra.ExecSQL;
      End;

    End; { If FlgGrava = '1' }

  End; { For I := 1 }

  ContSal :=0;
  Cont    :=1;
  TotalSal:=0;

  {----------------------------------------------------------------------------}
  { Processa Vetor de Salarios e gera de resultado a media destes salarios de  }
  { acordo com o tipo de media desejado na formula.                            }
  Case StrtoInt(sTipoMedia) Of

    { Soma os salarios e divide por NUMSAL }
    0:Begin
        While ContSal <= StrToInt(sNumSal) Do begin

          Case vRes of
             0:TotalSal :=TotalSal+TabSal[ContSal].Salario;
             1:TotalSal :=TotalSal+ArredValor(TabSal[ContSal].Salario,2);
             2:TotalSal :=TotalSal+TruncValor(TabSal[ContSal].Salario,2);
          end;
          Inc(ContSal);
        End;

        Result := '0';
        if (TotalSal > 0) and (StrtoInt(sNumSal) > 0) then
          Result  :=FloatToStr(TotalSal/StrtoInt(sNumSal));
      End;

    { Divide pela quantidade de salários maiores que zero }
    1:Begin
        While Cont <= StrToInt(sNumSal) Do begin
          Case vRes of
            0:TotalSal :=TotalSal+TabSal[Cont].Salario;
            1:TotalSal :=TotalSal+ArredValor(TabSal[Cont].Salario,2);
            2:TotalSal :=TotalSal+TruncValor(TabSal[Cont].Salario,2);
          end;
          If TabSal[Cont].Salario > 0 then
            inc(ContSal);
          Inc(Cont);
        end;

        Result := '0';
        if (TotalSal > 0) and (ContSal > 0) then
          Result   := FloatToStr(TotalSal/ContSal);
      End;

    { Faz Media Retroativa }
    2:Begin
        While (ContSal <= StrToInt(sNumSal)) and (cont <= 700) Do begin
          Case vRes of
            0:TotalSal :=TotalSal+TabSal[Cont].Salario;
            1:TotalSal :=TotalSal+ArredValor(TabSal[Cont].Salario,2);
            2:TotalSal :=TotalSal+TruncValor(TabSal[Cont].Salario,2);
          end;
          If TabSal[Cont].Salario > 0 then
            inc(ContSal);
          Inc(Cont);
        end;

        Result := '0';
        if (TotalSal > 0) and (StrToInt(sNumSal) > 0) then
          Result:=FloatToStr(TotalSal/StrToInt(sNumSal));
      End;

  End; { Case }

End; { PR2 }

{******************************************************************************}
{ Formula, Nivel                                                               }
{------------------------------------------------------------------------------}
Function TRegra.Nivel(FormulaLoc:string):string;
Var
  sNivel,sStep,sDataRef:String;
  Qry:TwwQuery;
  I:Integer;
Begin
  FormulaLoc:= copy(FormulaLoc,7,length(FormulaLoc)-7);
  I      := Pos(',',FormulaLoc);
  sNivel := Copy(FormulaLoc,1,i-1);
  sNivel := PegaValor(sNivel);
  FormulaLoc:=Copy(FormulaLoc,i+1,length(FormulaLoc));

  I     := Pos(',',FormulaLoc);
  sStep := Copy(FormulaLoc,1,i-1);
  sStep := PegaValor(sStep);
  FormulaLoc:=copy(FormulaLoc,i+1,length(FormulaLoc));

  sDataRef  :=pegavalor(FormulaLoc);

  Qry := TwwQuery.Create(Self);
  Qry.databasename := FDatabaseName;
  Qry.sql.add('SELECT STEP'+sstep+' FROM HSTFAIXASALEXT WHERE IDFAIXASALEXT = '+sNivel+
              ' AND DATAEFETIV <= '''+sDataref+''' ORDER BY DATAEFETIV DESC');

  Qry.open;
  if  qry.fieldbyname('STEP'+sStep).AsString = '' then
    Result :='0'
  else
    Result := qry.fieldbyname('STEP'+sStep).AsString;

  { Fecha e libera componentes locais }
  Qry.Close;
  Qry.Free;

End;

Function TRegra.NumProv(texto:string):string;
Type
    tsalario = record
                   mes    : string[7];
                   salario: real;
                   teto   : real;
                   tipo   : integer;
               end;
Var
    tabsal    :array [0..350] of tsalario;
    FormulaLoc,sdata,sDataref,
    smesbase,smesSal,sMesSeg,sNumSal : string;
    i, cont,ContSal,ContMes:integer;
begin
    //--------------decodifica a formula---------------------
     FormulaLoc:=copy(sFormulaaux,9,length(sformulaaux)-9);

    i         :=pos(',',FormulaLoc);
    sDataref :=copy(FormulaLoc,1,i-1);
    sDataref :=pegavalor(sDataref);
    sdata := paradata('PARADATA('+sdataref+',M)');
    FormulaLoc:=copy(FormulaLoc,i+1,length(FormulaLoc));

    sNumSal  :=FormulaLoc;
    sNumSal  :=pegavalor(sNumSal);

    try
       QueryIn.FieldbyName('IDPESSOA').AsString;
    except
          MsgDlgRegra('Campo IDPESSOA necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
          Exit;
    end;

    QueryRegraAux.close;
    QueryRegraAux.Sql.Clear;
    QueryRegraAux.Sql.Add(' SELECT '+RuleNumber+' AS IDREGRA, SALTETO.MES,SALTETO.VALORPROVENTO,SALTETO.FLGSRB,SALTETO.IDRUBRICA '+
                          ' FROM     (SELECT  MES,VALORPROVENTO,FLGSRB,IDRUBRICA '+
                                     'FROM (SELECT HST.MES,HST.VALORPROVENTO,HST.FLGSRB,HST.IDRUBRICA '+
                                           'FROM   (SELECT H.MES,H.VALORPROVENTO,H.FLGSRB,H.IDRUBRICA '+
                                                   'FROM   HISTRUBSAL H '+
                                                   'WHERE  (H.IDPESSOA  = '+QueryIn.FieldByName('idpessoa').AsString+') AND '+
                                                         ' (H.MES <='''+sData+''') AND '+
                                                         ' (H.FLGSRB    >= 1)) HST '+
                                                         ' GROUP BY MES,VALORPROVENTO,FLGSRB,IDRUBRICA)) SALTETO '+
                          ' ORDER BY SALTETO.MES DESC,SALTETO.FLGSRB DESC  ');
    QueryRegraAux.Open;


    if QueryRegraAux.IsEmpty then begin
       Result := '0';
       exit;
    end;

    For  wInt := 0 to 350 Do Begin
      TabSal[wInt].Salario:= 0;
      TabSal[wInt].Mes := '';
      TabSal[wInt].Teto:= 0;
      TabSal[wInt].Tipo:= 0;
    End;

    Cont   :=1;
    ContSal:=0;

    smesbase:=sDataref;
    sMesSal:=sDataref;
    sMesSeg:=paradata('PARADATA('+QueryRegraAux.FieldByName('mes').AsString+',D)');
    sFormulaAux:='Difmeses(#'+sMesSal+',#'+sMesSeg+')';
    Difmeses;
    ContMes:= strToInt(fResult);
    if ContMes > 1 Then begin
       for i:= 1 to ContMes-1 do begin
            inc(Cont);
            tabsal[cont].salario :=0;
       end;
    end;

    {
     Códigos do Flag SRB:

     1 - Salário de ativo.
     2 - Auxilio doença
     3 - Benefício do INSS
     4 - Salario Virtual
     5 - Salario de Manutenção Parcial
    }

    Cont:=1;

    While Not (QueryRegraAux.Eof) and (ContSal<=strtoint(sNumSal)) do begin
          if ((tabsal[cont].tipo < 4) and (QueryRegraAux.FieldByName('flgsrb').AsInteger = 4))
             or (tabsal[cont].tipo = 0)  then begin
             tabsal[cont].mes     :=QueryRegraAux.FieldByName('mes').AsString;
             tabsal[cont].salario :=QueryRegraAux.FieldByName('valorprovento').asFloat;
             tabsal[cont].tipo    :=QueryRegraAux.FieldByName('flgsrb').AsInteger;
          end else
              if ((tabsal[cont].tipo <> 4) and ((QueryRegraAux.FieldByName('flgsrb').AsInteger = 2) or
                 (QueryRegraAux.FieldByName('flgsrb').AsInteger = 3))) or
                 (QueryRegraAux.FieldByName('flgsrb').AsInteger = 1)  then
              begin
                   tabsal[cont].mes     :=QueryRegraAux.FieldByName('mes').AsString;
                   tabsal[cont].salario :=tabsal[cont].salario +QueryRegraAux.FieldByName('valorprovento').asFloat;
                   tabsal[cont].tipo    :=QueryRegraAux.FieldByName('flgsrb').AsInteger
              end ;
          QueryRegraAux.Next;
          smesbase:=TabSal[cont].mes;
          sMesSal:=paradata('PARADATA('+tabsal[cont].mes+',D)');
          sMesSeg:=paradata('PARADATA('+QueryRegraAux.FieldByName('mes').AsString+',D)');
          sFormulaAux:='Difmeses(#'+sMesSal+',#'+sMesSeg+')';
          Difmeses;
          ContMes:= strToInt(fResult);
          If ContMes > 1 Then begin
             for i:= 1 to ContMes-1 do begin
                 inc(Cont);
                 tabsal[cont].salario :=0;
             end;
          end;
          if QueryRegraAux.FieldByName('mes').AsString < smesbase then begin
             if tabsal[cont].salario > 0 then
                inc(ContSal);
             inc(Cont);
          end;
    end;

    ContSal := 0;

    For Cont:=1 To StrToInt(sNumSal) do begin
        If TabSal[Cont].Salario > 0 then
           ContSal:= ContSal+1;
    end;
    Result := IntToStr(ContSal);
end;

Function TRegra.IdadeCompleta(sDataMenor, sDataMaior : string):String;
Var
  Qry:TwwQuery;
Begin
  result := '-1';
  Qry    :=  twwQuery.Create(Self);
  Qry.databasename := FDatabaseName;
  Qry.close;
  Qry.SQL.clear;
  Qry.SQL.add(' SELECT '+
              ' TRUNC(MONTHS_BETWEEN(TO_DATE('''+sDataMaior+''',''dd/mm/yyyy''),        '+
              '                      TO_DATE('''+sDataMenor+''',''dd/mm/yyyy'')),0) DIF '+
              ' FROM DUAL');
  Try
    Qry.open;
  Except
    Exit;
  End;

  result := IntToStr(Trunc(qry.fieldbyname('DIF').AsInteger/12));

  qry.close;
  qry.Free;
end;

Function Tregra.IdadeEmMeses(sDataMenor, sDataMaior : string):String;
var
  qry:twwQuery;
begin
  result := '-1';
  qry    :=  twwQuery.Create(Self);
  qry.databasename := FDatabaseName;
  qry.close;
  qry.sql.clear;
  qry.sql.add(' SELECT '+
              ' TRUNC(MONTHS_BETWEEN(TO_DATE('''+sDataMaior+''',''dd/mm/yyyy''),        '+
              '                      TO_DATE('''+sDataMenor+''',''dd/mm/yyyy'')),0) DIF '+
              ' FROM DUAL');
  try
    qry.open;
  except
    Exit;
  end;
  result := IntToStr(Trunc(qry.fieldbyname('DIF').AsInteger));

  qry.close;
  qry.Free;
end;

Procedure Tregra.VoltaOpcoesPatro(var sOpcao1 ,sOpcao2, sOpcao3,
                                      sOpcao4 ,sOpcao5, sOpcao6 : String ;
                                      sIdPessoa , sIdpessjur    : String);
var
  qryaux : twwQuery;
begin
  try
    sOpcao1 := '';
    sOpcao2 := '';
    sOpcao3 := '';
    sOpcao4 := '';
    sOpcao5 := '';
    sOpcao6 := '';

    qryaux := twwQuery.create(Self);
    qryaux.databasename := FDatabaseName;

    qryaux.close;

    qryaux.SQL.text := ' SELECT '+RuleNumber+' AS IDREGRA, VALORBASE1, VALORBASE2, VALORBASE3, ' +
                       ' VALORBASE4, VALORBASE5, VALORBASE6 '+
                       ' FROM ELEGPATRO WHERE '+
                       ' (IDPESSOA = '''+sIdPessoa+''' ) '+
                       ' AND (IDPESSJUR = '''+sIdPessjur+''' )';
    qryaux.open;

    if not qryaux.isempty then begin
      sOpcao1 := qryaux.fieldbyname('VALORBASE1').AsString;
      sOpcao2 := qryaux.fieldbyname('VALORBASE2').AsString;
      sOpcao3 := qryaux.fieldbyname('VALORBASE3').AsString;
      sOpcao4 := qryaux.fieldbyname('VALORBASE4').AsString;
      sOpcao5 := qryaux.fieldbyname('VALORBASE5').AsString;
      sOpcao6 := qryaux.fieldbyname('VALORBASE6').AsString;
    end else begin
      sOpcao1 := '-1';
      sOpcao2 := '-1';
      sOpcao3 := '-1';
      sOpcao4 := '-1';
      sOpcao5 := '-1';
      sOpcao6 := '-1';
    end;
    if   (sOpcao1 = '') and (sOpcao2 = '') and (sOpcao3 = '')
     and (sOpcao4 = '') and (sOpcao5 = '') and (sOpcao6 = '') then begin
      sOpcao1 := '0';
      sOpcao2 := '0';
      sOpcao3 := '0';
      sOpcao4 := '0';
      sOpcao5 := '0';
      sOpcao6 := '0';
    end;

  finally
    qryaux.Free;
  end;

end;

//William Moreira da Silva - SIG 42298
Function Tregra.ExecVALORRUBTMPDESC(formula:String) : String;
Var
  sCODPROVDESC, sMESREFERENCIA, sMESCOBRANCA, sIDPLANOPREV, sSQL : String;
  qryaux : TwwQuery;
  I : integer;
begin
    Formula    := Copy(Formula,17,Length(Formula)-17);
    I          := Pos(',',Formula);
    sCODPROVDESC   := copy(formula,1,i-1);
    if copy(sCODPROVDESC,1,1) = '@' Then
      sCODPROVDESC := copy(sCODPROVDESC,2,length(sCODPROVDESC));

    formula    := Copy(formula,i+1,length(formula));
    i          := pos(',',formula);
    sMESREFERENCIA   := copy(formula,1,i-1);
    if copy(sMESREFERENCIA,1,1) = '@' Then
      sMESREFERENCIA := copy(sMESREFERENCIA,2,length(sMESREFERENCIA));

    sMESREFERENCIA := PegaValor(sMESREFERENCIA);
    
    formula    := Copy(formula,i+1,length(formula));
    if pos(',',formula) = 0 then
    begin
        sMESCOBRANCA  := Trim(formula);
        sMESCOBRANCA := PegaValor(sMESCOBRANCA);
    end
    else
    begin
       i := pos(',',formula);
       sMESCOBRANCA   := copy(formula,1,i-1);
       if copy(sMESCOBRANCA,1,1) = '@' Then
          sMESCOBRANCA := copy(sMESCOBRANCA,2,length(sMESCOBRANCA));

       sMESCOBRANCA := PegaValor(sMESCOBRANCA);

       formula    := Copy(formula,i+1,length(formula));

       sIDPLANOPREV  := Trim(formula);
       sIDPLANOPREV := PegaValor(sIDPLANOPREV);
    end;

  sSQL := '';
  sSQL := sSQL +   ' SELECT DECODE(FLGDESCONTO,0,VALOR,-VALOR) AS VALOR ' +
                   '   FROM TMPDESC                   ' +
                   '  WHERE (IDPROVENTO = ( SELECT IDPROVENTO FROM PROVDESC WHERE CODPROVDESC = '''+sCODPROVDESC+''' ))' +
                   '    AND (IDPESSJUR = '''+fQueryIn.FieldByName('IDPESSJUR').AsString+''') ' +
                   '    AND (IDPESSOA = '''+fQueryIn.FieldByName('IDPESSOA').AsString+''' )' +
                   '    AND (IDTITULAR = '''+fQueryIn.FieldByName('IDTITULAR').AsString+''' )' +
                   '    AND (MESCOBRANCA = '''+sMESCOBRANCA+ ''' )';

  if sIDPLANOPREV <> '' then
  begin
        sSQL := sSQL + ' AND (MESREFERENCIA = '''+sMESREFERENCIA+ ''' )';
  end;

  if sIDPLANOPREV <> '' then
  begin
        sSQL := sSQL + ' AND (IDPLANOPREV = '''+sIDPLANOPREV+''') ';
  end;

  qryaux := twwQuery.create(Self);
  qryaux.databasename := FDatabaseName;

  qryaux.close;
  qryaux.SQL.text := sSQL;

  qryaux.open;

  result := FloatToStr(qryaux.fieldbyname('VALOR').AsFloat);

  qryaux.close;
end;
//William Moreira da Silva - SIG 42298

//William Moreira da Silva - SIG 40538
Function Tregra.ExecVALORBENEFICIOINICIAL(formula:String) : String;
Var
  Op1,Op2,Op3,sIdpessoa,
  NomeVar1,NomeVar2,NomeVar3, idPlanoPrev, idTpPagtoBenefic, FontePagadora, ID_PESSOA : String;
  I : integer;
  qryaux : TwwQuery;
begin
  sIdpessoa := '';

  Formula    := Copy(Formula,23,Length(Formula)-23);
  I          := Pos(',',Formula);
  NomeVar1   := copy(formula,1,i-1);
  if copy(NomeVar1,1,1) = '@' Then
    Nomevar1 := copy(NomeVar1,2,length(NomeVar1));

  formula    := Copy(formula,i+1,length(formula));
  i          := pos(',',formula);
  NomeVar2   := copy(formula,1,i-1);
  if copy(NomeVar2,1,1) = '@' Then
    Nomevar2 := copy(NomeVar2,2,length(NomeVar2));

  formula    := Copy(formula,i+1,length(formula));
  i          := pos(',',formula);
  NomeVar3   := copy(formula,1,i-1);
  if copy(NomeVar3,1,1) = '@' Then
    Nomevar3 := copy(NomeVar3,2,length(NomeVar3));

  formula    := Copy(formula,i+1,length(formula));
  i          := pos(',',formula);
  idPlanoPrev   := copy(formula,1,i-1);
  idPlanoPrev := PegaValor(idPlanoPrev);

  formula    := Copy(formula,i+1,length(formula));
  i          := pos(',',formula);
  idTpPagtoBenefic   := copy(formula,1,i-1);
  idTpPagtoBenefic := PegaValor(idTpPagtoBenefic);

  formula    := Copy(formula,i+1,length(formula));
  FontePagadora  := Trim(formula);
  FontePagadora := PegaValor(FontePagadora);

  try
    fQueryIn.FieldByName('IDPESSOA').AsString;
  except
    MessageInfo := 'Campo IDPESSOA Necessário no Sql de entrada.';
    Exit;
  end;
  try
    fQueryIn.FieldByName('IDPESSJUR').AsString;
  except
    MessageInfo := 'Campo IDPESSJUR Necessário no Sql de entrada.';
    Exit;
  end;

  qryaux := twwQuery.create(Self);
  qryaux.databasename := FDatabaseName;

  qryaux.close;
  qryaux.SQL.text := ' SELECT '+RuleNumber+' AS IDREGRA, VALORBASE1, BSDIB, FABDIB ' +
                             ' FROM BENEFBFCIARIO WHERE '+
                             ' (IDPESSOA = '''+fQueryIn.FieldByName('IDPESSOA').AsString+''' ) '+
                             ' AND (IDPESSJUR = '''+fQueryIn.FieldByName('IDPESSJUR').AsString+''' )'+
                             ' and (idplanoprev = '''+idPlanoPrev+''') '+
                             ' and (IDTPPAGTOBENEFIC = '''+idTpPagtoBenefic+''') '+
                             ' and (FONTEPAGADORA  = '''+FontePagadora+''') ';
  qryaux.open;

  if not qryaux.isempty then begin
    Op1 := qryaux.fieldbyname('VALORBASE1').AsString;
    Op2 := qryaux.fieldbyname('BSDIB').AsString;
    Op3 := qryaux.fieldbyname('FABDIB').AsString;
  end else begin
    Op1 := '-1';
    Op2 := '-1';
    Op3 := '-1';
  end;

  if   (Op1 = '') then
  begin
    Op1 := '0';
  end;

  if (Op2 = '') then
  begin
        Op2 := '0';
  end;

  if (Op3 = '') then
  begin
        Op3 := '0';
  end;

  SetVariavel(NomeVar1,Op1,NomeVar1);
  SetVariavel(NomeVar2,Op2,NomeVar2);
  SetVariavel(NomeVar3,Op3,NomeVar3);

  FResult := 'VERDADEIRO';
  if   (Op1 = '-1') and (Op2 = '-1') and (Op3 = '-1') then
    FResult := 'FALSO'
  else
    if (Op1 = '0') and (Op2 = '0') and (Op3 = '0') then
      FResult := 'FALSO';
end;

Function Tregra.ExecVALORBENEFICIOSALDADO(formula:String) : String;
var
  qryaux : twwQuery;
  FormulaAux, NumContrib, Op1, Op2, NomeVar1, NomeVar2 : String;
  I : integer;
begin
  Formula    := Copy(Formula,23,Length(Formula)-23);
  I          := Pos(',',Formula);
  NomeVar1   := copy(formula,1,i-1);
  if copy(NomeVar1,1,1) = '@' Then
    Nomevar1 := copy(NomeVar1,2,length(NomeVar1));

  formula    := Copy(formula,i+1,length(formula));
  i          := pos(',',formula);
  NomeVar2   := copy(formula,1,i-1);
  if copy(NomeVar2,1,1) = '@' Then
    Nomevar2 := copy(NomeVar2,2,length(NomeVar2));

  formula    := Copy(formula,i+1,length(formula));
  NumContrib  := Trim(formula);
  NumContrib := PegaValor(NumContrib);

   //FormulaAux := Copy(formula,23,length(formula));
   //NumContrib := Copy(FormulaAux,1,Length(FormulaAux)-1);

   //NumContrib := pegavalor(NumContrib);

   qryaux := twwQuery.create(Self);
   qryaux.databasename := FDatabaseName;

   qryaux.close;
   qryaux.SQL.text := ' SELECT BENEFSALDADO, SALDOFAB FROM BENEFSALDFAB '+
            ' WHERE IDPESSOA = ' + NumContrib +
            ' AND MESREFERENCIA = (SELECT MAX(MESREFERENCIA) '+
            ' FROM BENEFSALDFAB '+
            ' WHERE IDPESSOA = '+ NumContrib + ')';

    qryaux.open;

    Op1 := qryaux.FieldbyName('BENEFSALDADO').AsString;
    Op2 := qryaux.FieldbyName('SALDOFAB').AsString;

    SetVariavel('BENEFSALDADO', Op1,'BENEFSALDADO');
    SetVariavel('SALDOFAB', Op2,'SALDOFAB');

  FResult := 'VERDADEIRO';
  if   (Op1 = '-1')
        and (Op2 = '-1') then
    FResult := 'FALSO'
  else
    if  (Op1 = '0')
        and (Op2 = '0') then
      FResult := 'FALSO';
end;
//William Moreira da Silva - SIG 40538

Function TRegra.ExecOpPatro(formula:String) : String;
Var
  Op1,Op2,Op3,Op4,Op5,Op6,sIdpessoa,
  NomeVar1,NomeVar2,NomeVar3,NomeVar4,NomeVar5,NomeVar6 : String;
  I : integer;
begin
  sIdpessoa := '';

  Formula    := Copy(Formula,9,Length(Formula)-9);
  I          := Pos(',',Formula);
  NomeVar1   := copy(formula,1,i-1);
  if copy(NomeVar1,1,1) = '@' Then
    Nomevar1 := copy(NomeVar1,2,length(NomeVar1));

  formula    := Copy(formula,i+1,length(formula));
  i          := pos(',',formula);
  NomeVar2   := copy(formula,1,i-1);
  if copy(NomeVar2,1,1) = '@' Then
    Nomevar2 := copy(NomeVar2,2,length(NomeVar2));

  formula    := Copy(formula,i+1,length(formula));
  i          := pos(',',formula);
  NomeVar3   := copy(formula,1,i-1);
  if copy(NomeVar3,1,1) = '@' Then
    Nomevar3 := copy(NomeVar3,2,length(NomeVar3));

  formula    := Copy(formula,i+1,length(formula));
  i          := pos(',',formula);
  NomeVar4   := copy(formula,1,i-1);
  if copy(NomeVar4,1,1) = '@' Then
    Nomevar4 := copy(NomeVar4,2,length(NomeVar4));

  formula    := Copy(formula,i+1,length(formula));
  i          := pos(',',formula);
  NomeVar5   := copy(formula,1,i-1);
  if copy(NomeVar5,1,1) = '@' Then
    Nomevar5 := copy(NomeVar5,2,length(NomeVar5));

  formula    := Copy(formula,i+1,length(formula));
  // Peterson Victor SOL 269352 PPM 1291068 - Inicio
  i          := pos(',',formula);
  //NomeVar6   := formula;
  NomeVar6   := copy(formula,1,i-1);
  // Peterson Victor SOL 269352 PPM 1291068 - Fim

  if copy(NomeVar6,1,1) = '@' Then
    Nomevar6 := copy(NomeVar6,2,length(NomeVar6));


  // Peterson Victor SOL 269352 PPM 1291068 - Inicio
  formula    := Copy(formula,i+1,length(formula));
  sIdpessoa  := Trim(formula);
  sIdPessoa := PegaValor(sIdPessoa);

  //if copy(sIdpessoa,1,1) = '@' Then
  //   sIdpessoa := copy(sIdpessoa,2,length(sIdpessoa));
  // Peterson Victor SOL 269352 PPM 1291068 - Fim


  try
    fQueryIn.FieldByName('IDPESSOA').AsString;
  except
    MsgDlgRegra('Campo IDPESSOA Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
    Exit;
  end;
  try
    fQueryIn.FieldByName('IDPESSJUR').AsString;
  except
    MsgDlgRegra('Campo IDPESSJUR Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
    Exit;
  end;

  // Peterson Victor SOL 269352 PPM 1291068 - Inicio
  if sIdpessoa <> '' then
     VoltaOpcoesPatro(Op1,Op2,Op3,Op4,Op5,Op6,sidpessoa,fQueryIn.FieldByName('IdPessjur').AsString)
  else
     VoltaOpcoesPatro(Op1,Op2,Op3,Op4,Op5,Op6,fQueryIn.FieldByName('IdPessoa').AsString,
                                              fQueryIn.FieldByName('IdPessjur').AsString);
  // Peterson Victor SOL 269352 PPM 1291068 - Fim

  SetVariavel(NomeVar1,Op1,NomeVar1);
  SetVariavel(NomeVar2,Op2,NomeVar2);
  SetVariavel(NomeVar3,Op3,NomeVar3);
  SetVariavel(NomeVar4,Op4,NomeVar4);
  SetVariavel(NomeVar5,Op5,NomeVar5);
  SetVariavel(NomeVar6,Op6,NomeVar6);

  FResult := 'VERDADEIRO';
  if   (Op1 = '-1') and (Op2 = '-1') and (Op3 = '-1')
   and (Op4 = '-1') and (Op5 = '-1') and (Op6 = '-1') then
    FResult := 'FALSO'
  else
    if   (Op1 = '0') and (Op2 = '0') and (Op3 = '0')
     and (Op4 = '0') and (Op5 = '0') and (Op6 = '0') then
      FResult := 'FALSO';
end;

{******************************************************************************}
{ Funcao FazCorrecao                                                           }
{   Prepara parametros para Funcao CORRECAO                                    }
{------------------------------------------------------------------------------}
Function TRegra.FazCorrecao(Formula:String):String;
Var
  Data1,Data2 : String;
  Valor : String;
  Moeda : String;
  I : Integer;
  Casas : string;    //edilaine SIG131430
begin
  { Decodifica Formula }
  Formula := Copy(Formula,10,Length(Formula)-10);

  { Pega data de inicio }
  I := Pos(',',Formula);
  Data1   := Copy(Formula,1,I-1);
  Data1   := PegaValor(Data1);
  Formula := Copy(Formula,i+1,Length(Formula));

  { Pega data de final }
  I := Pos(',',Formula);
  Data2   := Copy(Formula,1,I-1);
  Data2   := PegaValor(data2);
  Formula := Copy(Formula,I+1,Length(Formula));

  { Pega moeda }
  I := Pos(',',Formula);
  Moeda  := Copy(Formula,1,I-1);
  Moeda  := PegaValor(Moeda);
  Formula:= Copy(Formula,I+1,Length(Formula));

  //edilaine SIG131430 : inicio
  { Pega valor }
  //Valor := Pegavalor(Formula);
  I := Pos(',',Formula);
  if I > 0 then
  begin
    Valor  := Copy(Formula,1,I-1);
    Valor  := PegaValor(Valor);
    Formula:= Copy(Formula,I+1,Length(Formula));
  end
  else
  begin
    Valor   := Pegavalor(Formula);
    Formula := '';
  end;

  { Pega Casas decimais }
  if Formula <> '' then
     Casas := Pegavalor(Formula);

  if Casas = '' then
     Casas := '-1';
  //edilaine SIG131430 : fim

  { Retona o Resultado da Formula CORRECAO }
  Result := Correcao(StrToDateTime(Data1),
                     StrToDateTime(Data2),
                     Moeda,StrToFloat(Valor),
                     StrToInt(Casas)    //edilaine SIG131430
                     );

end;

{******************************************************************************}
{ Funcao Correcao                                                              }
{   Funcao de Correcao de uma moeda em um periodo                              }
{------------------------------------------------------------------------------}
Function TRegra.CORRECAO(Data1,Data2:tDateTime;
                         Moeda:String;
                         Valor:Double;
                         ArredCasas:integer     //edilaine - SIG131430
                         ):String;
Type                     {Andre Pontes}
  TFator = Record
             Fator:Extended;
             FatorAcum:Extended
           End;
Var
  TabFator : Array [0..350] Of tFator;
  QryCor  : TwwQuery;
  cPeriodo, cPercValor : String[1];
  wVal1, iCodMoeda, I, P, X, wVal : Integer;
  sAno, sData, sData1, sData2, sDataFim : String;
  rCot1, rCot2, MoedaBase : Real;
  sCampo, sMoeSigla :String;
Begin
  { Identifica a Moeda }
  QryCor := twwQuery.Create(Self);
  QryCor.DatabaseName :=FDatabaseName;
  QryCor.SQL.Add('SELECT '+RuleNumber+' AS IDREGRA, MOESIGLA, MOECODIGO, FLGPERCVALOR, MOEPERIODICIDADE '+
                 'FROM MOEDA WHERE UPPER(MOESIGLA) = '''+UpperCase(Moeda)+'''');
  QryCor.Open;
  If QryCor.IsEmpty Then Begin
    Result := '0';
    QryCor.Close;
    QryCor.Free;
    Exit;
  End;

  iCodMoeda  := QryCor.FieldByName('MOECODIGO').AsInteger;
  cPeriodo   := QryCor.FieldByName('MOEPERIODICIDADE').AsString;
  cPercValor := QryCor.FieldByName('FLGPERCVALOR').AsString;
  sMoeSigla  := QryCor.FieldByName('MOESIGLA').AsString;
  QryCor.Close;

  { identifica a periodicidade }
  sData1 := FormatDateTime('DD/MM/YYYY',Data1);
  sData2 := FormatDateTime('DD/MM/YYYY',Data2);

  If cPeriodo <> 'D' Then Begin
    If cPercValor = 'V' Then Begin
      sData1 := ''''+Copy(sData1,4,2)+Copy(sData1,7,4)+'''';
      sData2 := ''''+Copy(sData2,4,2)+Copy(sData2,7,4)+'''';
      sCampo := 'COTMESREF';
    End;
  End Else Begin
    sData1 := 'TO_DATE('''+sData1+''',''DD/MM/YYYY'')';
    sData2 := 'TO_DATE('''+sData2+''',''DD/MM/YYYY'')';
    sCampo := 'COTDATA';
  end;

  { Pega as cotações - Caso 'V' (Valor) }
  If cPercValor = 'V' Then Begin
    Qrycor.sql.clear;
    Qrycor.SQL.add(' SELECT '+RuleNumber+' AS IDREGRA, COTVALOR,COTDATA FROM COTACAOMOEDA '+
                   ' WHERE ('+sCampo+' = '+sdata1+' OR '+
                              sCampo+' = '+sdata2+
                   ') AND MOECODIGO = '+inttostr(iCodMoeda)+' ORDER BY COTDATA');
    QryCor.open;
    rCot1 := QryCor.FieldByName('COTVALOR').asFloat;
    QryCor.next;
    rCot2 := QryCor.FieldByName('COTVALOR').AsFloat;

    Result := FloatToStr((Valor/rCot1)*rCot2);
    QryCor.Close;
    QryCor.Free;
  End Else Begin
    { Pega as cotações - Caso 'P' (Percentual) }

    { Inicia Vetor dos fatores de correção }
    // FillChar(TabFator,SizeOf(Tabfator),#0);
    For X := 0 To 350 Do Begin
      TabFator[X].Fator     := 0;
      TabFator[X].Fatoracum := 0;
    End;

    sData := sData2;
    sData := DataParaMes(sData,0,'I');
    sAno  := sData;
    MoedaBase :=0;
    TabFator[0].FatorAcum:=1;
    I:=1;
    P:=0;

    sDataFim := DataParaMes(sData1,0,'I');

    With QryCor Do Begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT '+RuleNumber+' AS IDREGRA, TO_DATE(C.COTMESREF,''MMYYYY'') AS DATACOTA, '+
              '       C.COTMESREF, C.COTVALOR FROM MOEDA M,COTACAOMOEDA C      '+
              'WHERE M.MOESIGLA='''+smoesigla+''' AND '+
              'M.MOECODIGO=C.MOECODIGO AND TO_DATE(C.COTMESREF,''MMYYYY'') <=TO_DATE('''+
              Copy(sdata,6,2)+copy(sdata,1,4) +''',''MMYYYY'') AND TO_DATE(C.COTMESREF,''MMYYYY'') >=TO_DATE('''+
              Copy(sdatafim,6,2)+copy(sdatafim,1,4) +
              ''',''MMYYYY'') ORDER BY TO_DATE(COTMESREF,''MMYYYY'') DESC');
      Open;
    End;

    wVal1  := QryCor.RecordCount;
    wVal   := 1;
    Result := FloatToStr(Valor*1);

    { Caso existam registros a processar.... }
    If wVal1 > 0 then begin
      If cPeriodo = 'D' Then Begin
      { Caso Moeda de Periodicidade Diaria }
        While QryCor.fieldbyname('DATACOTA').AsDateTime >= StrToDate(sData1) Do Begin
          TabFator[wVal].Fatoracum:=(qrycor.FieldByName('COTVALOR').asfloat/100+1)*tabfator[wVal-1].fatoracum;
          TabFator[wVal].Fator    := qrycor.FieldByName('COTVALOR').asfloat/100+1;
          Inc(wval);
          QryCor.Next;
        End;
      End Else If cPeriodo = 'M' Then Begin
      { Caso Moeda de Periodicidade Mensal }

        { Guarda Ano/Mes }
        sData1 :=Copy(sData1,7,4)+ Copy(sData1,4,2);

        While ((Copy(QryCor.FieldByName('COTMESREF').AsString,3,4)+
               Copy(QryCor.FieldByName('COTMESREF').AsString,1,2)) >= sData1) And
               (Not QryCor.Eof)
        Do Begin
          TabFator[wVal].Fatoracum:=(qrycor.FieldByName('COTVALOR').asfloat/100+1)*tabfator[wVal-1].fatoracum;
          TabFator[wVal].Fator    := qrycor.FieldByName('COTVALOR').asfloat/100+1;
          Inc(wval);
          QryCor.Next;
        End;
      End Else If cPeriodo = 'A' Then Begin
      { Caso Moeda de Periodicidade Anual }

        { Guarda Ano }
        sData1 :=Copy(sData1,7,4)+ Copy(sData1,4,2);
        While (Copy(QryCor.fieldbyname('COTMESREF').AsString,3,4)) >= sData1
        Do Begin
          TabFator[wVal].Fatoracum:=(qrycor.FieldByName('COTVALOR').asfloat/100+1)*tabfator[wVal-1].fatoracum;
          TabFator[wVal].Fator    := qrycor.FieldByName('COTVALOR').asfloat/100+1;
          Inc(wval);
          QryCor.Next;
        End;
      End;

      //edilaine SIG131430 : inicio
      if ArredCasas >= 0 then
         TabFator[wVal-1].FatorAcum := ArredValor(TabFator[wVal-1].FatorAcum, ArredCasas);
      //edilaine SIG131430 : fim

      Result := FloatToStr(Valor*TabFator[wVal-1].FatorAcum);
    End;
    QryCor.Close;
    QryCor.Free;

  End; { Else }

End;


Function TRegra.Formatar(valor:double;casas:integer):String;
var
  i:integer;
  mascara:string;
begin
  mascara:='###0.';
  for i :=1 to casas do
    mascara := mascara + '0';
  result := formatfloat(pchar(mascara),valor);
end;

Function TRegra.FazFormatacao(formula:String):String;
var
   i : integer;
   valor,casas:String;
begin
    formula := copy(formula,10,length(formula)-10);
    i:= pos(',',formula);
    valor  := copy(formula,1,i-1);
    valor  := pegavalor(valor);
    casas  := copy(formula,i+1,length(formula));
    casas  := pegavalor(casas);
    result := formatar(strtofloat(valor),strtoint(casas));
end;

//******************************************************************************
// Formula:
Function TRegra.CP(texto:string):string;
Type
// Declara Tipos definidos para a funcao
  Indice = Record
             Nome:String;
             Data:String;
           End;
  tFator = Record
             Fator:Extended;
             FatorAcum:Extended;
             Mes: String;
           End;

  tContrib = Record
               Numero   : String;
             End;

  tSalario = Record
               Mes    : string[7];
               Salario: Double;
               Teto   : Double;
               Tipo   : integer;
             End;

Var
    tabindices:array [0..20]  of indice;
    tabfator  :array [0..350] of tfator;
    tabcb     :array [0..350] of tContrib;
    tabsal    :array [0..350] of tsalario;
    wSql, vSql, sSql, FormulaLoc,palavra,sdata,sdatad,sdatafim,sdataini,sDataref,palavraAux,LetraAux,
    smesbase,smesSal,sMesSeg,sRubrica,sTpIndice,sIndice,sNumSal,sTpContrib,sTipoMedia,sTipo,stotal:string;
    sano,sanosal:string[4];
    letra : string[1];
    wValAux,wVal,p,t,p2,I,J,cont,ContSal,wVal1, wValOld, ContMes,iNumSal:integer;
    moecodigo,moedabase:longint;
    valorcotas,valorsal,salbase,fatorant,ultimoIndice,TESTE,TotalSal:double;
    flgnome,flginc,flgmoedanova,ACHOU:boolean;
    FlgCampoProcesso, wStrAux : String;
begin
//------------------------------------------------------------------------------
// Decodifica Formula
  For  I := 0 to 20 Do Begin
    TabIndices[I].Nome := '';
    TabIndices[I].Data := '';
  End;

  FormulaLoc:=copy(sFormulaaux,5,length(sformulaaux)-5);

// Inicia Variaveis
  P  := 0;
  P2 := 0;
  T  := 0;
  Letra  :='';
  Palavra:='';
  LetraAux  :='';
  PalavraAux:='';
  FlgCampoProcesso := '0';
  I:=1;

  FlgInc  := False;
  FlgNome := True;
//  FormulaLoc := Copy(FormulaLoc,i,length(FormulaLoc)-1);

// Busca os Indices da expressão
  Repeat
    If Pos(Letra,',') <> 0 Then Begin

      If Palavra <> '' Then Begin

        If FlgNome Then Begin
          TabIndices[P].Nome := PegaValor(Palavra);
          FlgNome := False;
        End Else Begin
          TabIndices[p].data := Dataparames(PegaValor(Palavra),0,'I');
          FlgNome:= True;
          FlgInc := True;
        End;
        Palavra := '';
      End Else Begin
        TabIndices[P].Nome :='1';
      End;
      If flginc Then Begin
        P := P+1;
        FlgInc:=False;
      End;
      Letra:='';
    End;
    Palavra:= Palavra+letra;
    Letra  := Copy(FormulaLoc,1,1);

    FormulaLoc := Copy(FormulaLoc,2,length(FormulaLoc)-1);

  Until Letra=']';

//  Busca as Contribuições da expressão
  PalavraAux := InttoStr(Pos('"',sFormulaAux));

  If StrtoInt(PalavraAux) > 0 then begin
    flgInc   := True;
    LetraAux := '';
    T := 0;
    PalavraAux := Copy(sFormulaaux, StrtoInt(palavraAux)+1, Length(Texto)-
                                                            StrtoInt(palavraAux)-1);
    For p2 := 1 To Length(PalavraAux) Do Begin
      if (Copy(PalavraAux,p2,1) = '"') or (Copy(PalavraAux,p2,1) = ',')
      then begin
         t := t + 1;
         TabCb[t].Numero := LetraAux;
         LetraAux := '';
         Continue;
      end;
      LetraAux := LetraAux + Copy(PalavraAux,p2,1)
    End;
  End;

  TabIndices[P].Data:=DataParaMes(PegaValor(Palavra),0,'I');

// Busca a Data de Referencia (DataRef)
  I := Pos(',',FormulaLoc);
  sDataRef  := Copy(FormulaLoc,1,I-1);
  sDataRef  := PegaValor(sDataref);
  FormulaLoc:= Copy(FormulaLoc,I+1,Length(FormulaLoc));


// Busca a quantidade de meses a pesquisar
  I := Pos(',',FormulaLoc);
  sNumSal   := Copy(FormulaLoc,1,I-1);
  sNumSal   := PegaValor(sNumSal);
  FormulaLoc:= Copy(FormulaLoc,I+1,length(FormulaLoc));

// Forma de Calculo da média de contribuições
  I := Pos(',',FormulaLoc);
  sTpContrib:= Copy(FormulaLoc,1,I-1);
  sTpContrib:= PegaValor(sTpContrib);
  FormulaLoc:= Copy(FormulaLoc,I+1,length(FormulaLoc));

// Campo para o Processo
//  - 0  VALORRECEBIDO - Default
//  - 1  VALORESPERADO
  I := Pos('"',FormulaLoc);
  FormulaLoc:= Copy(FormulaLoc,I+1,Length(FormulaLoc));
  If I <> 0 Then Begin
// Pula até ultimo parametro
    I := Pos('"',FormulaLoc);
    FormulaLoc:= Copy(FormulaLoc,I+1,length(FormulaLoc));

    I := Pos(',',FormulaLoc);
    FormulaLoc:= Copy(FormulaLoc,I+1,length(FormulaLoc));

    If I <> 0 Then Begin
// Guarda Campo de Processamento
      FlgCampoProcesso := Copy(FormulaLoc,1,Length(FormulaLoc));
      FlgCampoProcesso := PegaValor(FlgCampoProcesso);
    End;
  End Else Begin

  End;
// Fim da Decodificacao da Formula
//------------------------------------------------------------------------------
  sdata     :=sdataref;
  sdata     :=dataparames(sdata,0,'I');
  sano      :=sdata;
  sdatafim  :=sdata;
  moedabase :=0;

  flgmoedanova:=false;

  tabfator[0].fatoracum:=1;
  i:=1;
  p:=0;
  fatorant:=1;
  sdatad:=SUBTRAIR(sdata,1);
  sdata :=SUBTRAIR(sdata,1);

  wValOld := 1;

  while (i <= 48) and (tabindices[p].nome<>'') do begin
    if tabindices[p+1].nome='' then
      sdatafim:=subtrair(sdata,48)
    else
      sdatafim:=tabindices[p+1].data;

    with queryregraaux do begin
      close;
      sql.clear;
      If tabindices[p].Nome <> '1' Then Begin
        vSql := 'SELECT '+RuleNumber+' AS IDREGRA, C.COTVALOR, C.COTMESREF FROM MOEDA M,COTACAOMOEDA C '+
                ' WHERE (M.MOESIGLA='''+tabindices[p].nome+''') AND '+
                '(M.MOECODIGO=C.MOECODIGO) AND (TO_DATE(C.COTMESREF,''MMYYYY'') <=TO_DATE('''+
                copy(sdata,6,2)+copy(sdata,1,4) +''',''MMYYYY'')) AND (TO_DATE(C.COTMESREF,''MMYYYY'') > TO_DATE('''+
                copy(sdatafim,6,2)+copy(sdatafim,1,4) + ''',''MMYYYY'')) ORDER BY TO_DATE(COTMESREF,''MMYYYY'') DESC';
      End Else Begin
        vSql := 'SELECT '+RuleNumber+' AS IDREGRA, 1 AS COTVALOR, '+
                '       TO_CHAR(TO_DATE('+QuotedStr(sData)+',''YYYY/MM''),''MMYYYY'') AS  COTMESREF '+
                'FROM DUAL';
      End;
      sql.add(vSql);
      open;
    end;

    if wValOld = 1 then
      wVal1 := QueryRegraAux.recordcount
    else
      wVal1 := queryregraaux.recordcount + wValOld;


    for wVal := wValOld to wVal1 do begin
      tabfator[wVal].fatoracum:=((queryregraaux.fieldbyname('cotvalor').asfloat/100+1)*
                                  tabfator[wVal-1].fatoracum);
      tabfator[wVal].fator:= queryregraaux.fieldbyname('cotvalor').asfloat/100+1;
      tabfator[wVal].mes  := copy(queryregraaux.fieldbyname('cotmesref').AsString,3,4)+'/'+
                             copy(queryregraaux.fieldbyname('cotmesref').AsString,1,2);
      queryRegraAux.next;
      wValAux := wVal
    end;

    wValOld := wValAux;
    inc(p);
    sdata:=tabindices[p].data;
  end;

  sSql := ' ';
  t := 0;
  While tabindices[t].nome <> '' do begin
    sSql := sSql + '(M.MOESIGLA='''+tabindices[t].nome+'''';
    sSql := sSql + ' AND SUBSTR(C.COTMESREF,3,4)||''/''||SUBSTR(C.COTMESREF,1,2)<='''+tabindices[t].data+'''';
    If Tabindices[t+1].nome <> '' then begin
      sSql := sSql + ' AND SUBSTR(C.COTMESREF,3,4)||''/''||SUBSTR(C.COTMESREF,1,2)>'''+tabindices[t+1].data+'''';
    end;
    sSql := sSql + ' )';
    if tabindices[t+1].nome <> '' then sSql := sSql + ' OR ';
    inc(t);
  end;

  if sSql <> '' then sSql := '('+sSql+') AND';

  QueryRegraAux.close;
  QueryRegraAux.Sql.Clear;

// Faz o tratamento na query para selecionar na query também as contribuições selecionadas
  t := 1;
  vSql := ' HIST.IDCONTRIBUICAO IN (';

  while TabCb[t].numero <> '' do begin
    vSql := vSql + TabCb[t].Numero;
    if TabCb[t+1].Numero <> '' then
      vSql := vSql + ',';
    inc(t);
  end;

  if vSql <> '' then
    vSql :=  vSql+ ')';

  try
    QueryIn.FieldbyName('IDPESSOA').AsString;
  except
    MsgDlgRegra('Campo IDPESSOA necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
    Exit;
  end;

// Busca Salarios e Cotacoes para Correcao
  wSql := 'SELECT '+
          RuleNumber+' AS IDREGRA, HIST.IDPESSOA,      HIST.IDCONTRIBUICAO, COT.COTVALOR, '+
          '  HIST.MES,   HIST.VALORRECEBIDO, HIST.VALORESPERADO,  COT.COTDATA   '+
          'FROM ';
  If tabindices[0].Nome <> '1' Then Begin
    wSql := wSql +
// Cotacao
          '  (SELECT C.COTVALOR, SUBSTR(C.COTMESREF,3,4)||''/''||SUBSTR(C.COTMESREF,1,2) AS MESREF, C.COTDATA '+
          '   FROM MOEDA M, COTACAOMOEDA C '+
          '   WHERE '+sSql+' (M.MOECODIGO = C.MOECODIGO) AND '+
          '         (C.COTDATA  <= TO_DATE('''+sDataRef+''',''DD/MM/YYYY''))) COT,';
   End Else Begin
     wSql := wSql +
// Usando Indice 1

          '(SELECT '+RuleNumber+' AS IDREGRA, 1 AS COTVALOR, '+
                  ''''+sDatad+''' AS  MESREF, '+
          '       TO_DATE('''+sDatad+''',''YYYY/MM'') AS  COTDATA '+
          ' FROM DUAL) COT,';
  End;

  wSql := wSql +
// Historico de Salarios
          '  (SELECT H.IDPESSOA, H.MESREFERENCIA,H.VALORRECEBIDO, H.VALORESPERADO, H.IDCONTRIBUICAO, H.MESREFERENCIA MES '+
          '   FROM HSTCONTRIBPREV H '+
          '   WHERE (H.IDPESSOA  = '+QueryIn.FieldbyName('IDPESSOA').AsString+')'+
          '         AND (H.MESREFERENCIA <='''+sDatad+''') AND (SUBSTR(H.MESREFERENCIA,6,2)<TO_CHAR(13)) ';

  If tabindices[0].Nome <> '1' Then
    wSql := wSql + ' AND (H.VALORRECEBIDO > 0 )';


  wSql := wSql +
          '  ) HIST '+
          'WHERE '+
          '  (HIST.MES=COT.MESREF) AND ('+vSql+') '+
          'ORDER BY '+
          '  HIST.MES DESC, HIST.IDCONTRIBUICAO';


  QueryRegraAux.Sql.Add(wSql);
  QueryRegraAux.Open;

  if QueryRegraAux.IsEmpty then begin
    Result := '0';
    exit;
  end;

  For  wInt := 0 to 350 Do Begin
    TabSal[wInt].Mes    := '';
    TabSal[wInt].Teto   := 0;
    TabSal[wInt].Tipo   := 0;
    TabSal[wInt].Salario:= 0;
  End;
  Cont   :=0;
  ContSal:=0;

// Caso use tipo de Calculo com numero de contribuicoes informada ou todas as contrib.
  if sTpContrib = '0' then
     iNumSal := strtoint(sNumSal) // Numero de contribuicoes da Formula
  else
     iNumSal := QueryRegraAux.RecordCount; // Total de Registros

  While Not (QueryRegraAux.Eof) Do Begin
    TabSal[Cont].Mes     := QueryRegraAux.FieldByName('MES').AsString;
// Guarda a Contribuicao de Acordo com o Paramentro da Formula
    If FlgCampoProcesso = '0' Then Begin
      TabSal[Cont].Salario := QueryRegraAux.FieldByName('VALORRECEBIDO').asFloat;
    End Else Begin
      TabSal[Cont].Salario := QueryRegraAux.FieldByName('VALORESPERADO').asFloat;
    End;

    QueryRegraAux.Next;

    Inc(Cont);

// Caso use numero de contribuicoes Informado, Testa
    If sTpContrib = '0' Then Begin
      If Cont >= iNumSal Then Begin
        Break;
      End;
    End;

  end;

// Faz o Reajuste de Valores
  I:=0;
  For I := 0 to iNumSal do begin
    j := 1;

    while TabFator[I].mes <> '' do begin
      if (TabSal[I].Mes = TabFator[J].mes) then
        break;
      Inc(J);
    end;

    TabSal[i].Salario:=TabSal[i].Salario*TabFator[i].FatorAcum;

  End;

  TotalSal:=0;
  Cont:=0;
  while TabSal[Cont].Mes <> '' do begin
    TotalSal := TotalSal + TabSal[Cont].Salario;
    Inc(Cont);
  end;

  wStrAux := 'ROUND('+FloatToStr(TotalSal/iNumSal)+',2)';
  Result := Arredonda(wStrAux);
//  Result := FloatToStr(TotalSal/iNumSal);

end;

function TRegra.UltDiaMes(Data : TDateTime): LongInt;
var
   vDt : String;
   Dia, Mes, Ano : Word;
   vDataAnt : TDateTime;
begin
   vDt := DatetoStr(Data);
   Dia := StrtoInt(Copy(vDt,1,2));
   Mes := StrtoInt(Copy(vDt,4,2));
   Ano := StrtoInt(Copy(vDt,7,4));

   if Mes = 12 then Mes := 1
      else Mes := Mes + 1;

   Dia := 1;

   if Mes = 1 then
      Ano := Ano + 1;

   vDataAnt := EncodeDate(Ano, Mes, Dia);

   vDataAnt := VDataAnt - 1;

   vDt := DatetoStr(vDataAnt);

   Result := StrtoInt(Copy(vDt,1,2));
end;

Function TRegra.DIASDOMES(texto:string):string;
var
   vDt : TDateTime;
begin
   sFormulaAux := Copy(sFormulaAux,11,Length(sFormulaAux)-11);
   sFormulaAux := pegavalor(sFormulaAux);
   try
      vDt := StrToDate(sFormulaaux);
      FormatoData     := ShortDateFormat;
      ShortDateFormat := 'dd/mm/yyyy';

      Result := InttoStr(UltDiaMes(vDt));

      ShortDateFormat := FormatoData;
   except
      Result := '0';
   end;
end;

function TRegra.NUMSALARIOS(Texto : String): String;
var
   vNum, vDtUlt, vDtPri, vSql : String;
   j, i : LongInt;
begin
   //Traz a Data Inicial (Mes mais recente) e o Numero de Salários a pesquisar diminuir - NUMSALARIOS(1999/10,12)
   Result := '0';
   sFormulaAux := Copy(sFormulaAux,13,Length(sFormulaAux)-13);
   i := pos(',',sFormulaAux);

   vDtUlt := copy(sFormulaAux, 1, i-1); // Pega o Ultimo salário do funcionário
   VDtUlt := pegavalor(vDtUlt);

   j := pos(')',sFormulaAux);

   vNum := copy(sFormulaAux, i+1, Length(sFormulaAux)-j-1); //Verifica o numero de meses a pesquisar
   vNum := PegaValor(vNum);

   vDtPri := SUBTRAIR(vDtUlt, StrtoInt(vNum)); //Calcula a ultima data (mais antiga) para usar na query

   with QueryRegraAux do begin
     Close;
     Sql.Clear;
     vSql := 'SELECT COUNT(DISTINCT H.MES) QTDSAL  FROM HISTRUBSAL H  WHERE (H.FLGSRB  = 1) AND '+
             '(H.IDPESSOA = '+QueryIn.FieldbyName('IDPESSOA').AsString+') AND (H.MES <='''+
             vDtUlt+''') AND (H.MES > '''+vDtPri+''') AND (SUBSTR(H.MES,6,2)<13)';
     Sql.Add(vSql);
     Open;
   end;

   Result := QueryRegraAux.FieldbyName('QTDSAL').AsString;
end;

// andre ini
function tRegra.CamposDesc(formula:string):string;
Var
  fim,fimform,x :integer;
  desccampo,campo,FormulaLoc :string;
  tabvar    :tparray;
begin
    for x:=0 to 40 do
        tabvar[x]:='';

    FormulaLoc:=copy(formula,12,length(formula)-11);
    x:=0;
    fimform := 1000; // somente para inicializar
    while fimform <> 0 do begin
          fimform   := pos(';',FormulaLoc);
          if fimform = 0 then begin
             //       fimform := pos('.',FormulaLoc);
             desccampo := copy(FormulaLoc,1, pos('.',FormulaLoc) - 1);
          end else
              desccampo := copy(FormulaLoc,1,fimform - 1);
          fim := pos(',',desccampo);
          campo := copy(desccampo,1,fim - 1);
          delete(FormulaLoc,1,fimform);
          tabvar[x]:=pegavalor(campo);
          inc(x);
          if fimform <> 0 then begin
             tabvar[x]:=';';
             inc(x);
          end;
    end;
    result:=concatenar(tabvar);
end;

//andre fim

{*********************************************************************
Este método executa toda a regra cujo nome se encontra na propriedade
RuleName. tMinhaRegra.Execute faz os
seguintes passos:
**********************************************************************}
//andre ini
procedure TRegra.PegaCampo(nome:string;formula:boolean;var resultado: string);
begin
    application.createform(tfrmpegatab,frmpegatab);
    with frmpegatab do begin
         painel1.visible  := false;
         if formula then begin
            painel1.visible := true;
            painelgrphip.visible := true;
            dbpegatabbio.visible := false;
            dbpegahipotese.visible := false;
            textotabela.caption := 'Código do Grupo de Hipóteses : '+resultado;
            painelgrphip.top := 96;
            with QryPegaGrpHip do begin
                 close;
                 sql.clear;
                 sql.add('SELECT IDGRUPOHIPOTESE,REFERENCIA,DESCRICAO FROM HIPOTESES '+
                         'WHERE IDGRUPOHIPOTESE = :PARAM0');
                 params[0].AsInteger := strtoint(resultado);
                 try
                    open
                 except begin
                        MsgDlgRegra('Problema nos parâmetros/premissas do Grupo de Hipóteses.','Regra - Atenção',mterror,[mbOk],0);
                        frmpegatab.Free;
                        exit;
                        end;
                 end;
            end;
         end else begin
             painel1.visible := true;
             if nome = 'HIPOTESE' then begin  // Grupo de Hipóteses
                painelgrphip.visible := false;
                textotabela.caption := 'Escolha o Grupo de Hipóteses desejado';
                dbpegatabbio.visible := false;
                dbpegahipotese.top := 96;
                with QryPegaHipotese do begin
                     close;
                     sql.clear;
                     sql.add('SELECT IDGRUPOHIPOTESE, DESCRICAO, OBSERVACAO FROM GRUPOSDEHIPOTESES');
                     try
                        open;
                     except begin
                            MsgDlgRegra('Problema no Grupo de Hipóteses.','Regra - Atenção',mterror,[mbOk],0);
                            frmpegatab.Free;
                            exit
                            end;
                     end;
                end;
             end else begin  // tabela biometrica
                 dbpegahipotese.visible := false;
                 painelgrphip.visible := false;
                 dbpegatabbio.top := 96;
                 textotabela.caption := 'Escolha a Tabela Biométrica desejada';
                 with QryPegaTabBio do begin
                      close;
                      sql.clear;
                      sql.add('SELECT IDTABELA, DESCRICAO FROM TABBIO');
                      try
                         open;
                      except begin
                             MsgDlgRegra('Problema nas Tabelas Biométricas.','Regra - Atenção',mterror,[mbOk],0);
                             frmpegatab.Free;
                             exit;
                             end;
                      end;
                 end;
             end;
         end; // usa cadastro de formulas ou nao
    end;
    frmpegatab.showmodal;
    if (formula) then
       resultado := frmpegatab.QryPegaGrpHip['REFERENCIA']
    else
        if nome = 'HIPOTESE' then
           resultado := frmpegatab.QryPegaHipotese['IDGRUPOHIPOTESE']
        else
            resultado := frmpegatab.QryPegaTabbio['IDTABELA'];
    frmpegatab.Free;
end;

procedure TRegra.PegaCampoAux(nome:string;formula:boolean;var resultado: string);
begin
  pegacampo(nome, formula, resultado);
end;


//******************************************************************************
// Formula - Corrige os Salarios do participante, por um ou mais Indices no
// periodo indicado

// SBINSS(TETO,DATAINICIAL,DATAFINAL,TIPOINDICE,[INDICE,DATA...],"FLGSRB",
//       [CORREÇÃO, MESDATABASE,FLGTIPOCALC...],DATAFIMCORR, FLGDEGRAVACAO,
//        FLGTIPOGRAVA, NUMERODECIMAISINDICE)
Function TRegra.SBINSS(Formula:string):String;
Type
  Indice = Record
             Nome,
             Data,
             DataFim:String;
           End;

  tFator = Record
             fator : Extended;
             fatoracum : Extended;
             mes : String;
           End;
  tsalario = Record
               mes    : string[7];
               salario: Currency;
               teto   : Double;
               fatoracum : Double;
               tipo   : integer;
             End;
Var
  sDataRef, sMesSeg, sMesSal, smesbase, sTeto, vSqlAux, vSql, sData,
  sDataFim, vAux, vInd, vDataFim, vMes, vData, DataIni, DataFinal, vDataAux1, vDataAux2,
  sTipoCalc, vMesAux, FormulaAux, vFormula, sCorrecao, sMesDataBase,
  wDataFimCorr, wDataFimSal, wFlgGravaCalculo, wFlgTipoGravacao,
  wStrAux : String;
  LinOk, Linha, vMesBas, vMesRef, vAno, j, ContMes, ContSal, cont, vDif, vZero,
  x, W,
  vTipoCalc,
  wValOld, wVal1, wVal, wValAux, vReg, vTp, i : LongInt;
  sAchou, vFlag, vAchou : Boolean;
  tabindices:array [0..20]  of indice;

  tabfator   :array [0..700] of tfator;
  tabsal     :array [0..700] of tsalario;
  TabFiltros :array [0..30]  of String;
  vFatorAux, vFatUlt, vIni, vFator, vAcum, vFtr : Real;
  wNumCasasFator:String;

   sTipoFiltro, sFiltro : string;
begin
// Inicia Variaveis
  wFlgGravaCalculo := '0';
  wFlgTipoGravacao := '';
  wNumCasasFator   := '0';
  sTipoFiltro      := 'F'; 

//------------------------------------------------------------------------------
// DECODIFICACAO DA FORMULA
  vAcum := 1;

  FormulaAux := copy(formula,8,length(formula)-6);

  i := pos(',',FormulaAux);
  sTeto := Copy(FormulaAux,1,i-1);
  sTeto := pegavalor(sTeto);
  FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux));

  i := pos(',',FormulaAux);
  DataIni := Copy(FormulaAux,1,i-1);
  DataIni := pegavalor(DataIni);
  FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux));

  i := pos(',',FormulaAux);
  DataFinal:= Copy(FormulaAux,1,i-1);
  DataFinal:= pegavalor(DataFinal);
// Guarda a Data Final dos salarios que vão ser processados 
  wDataFimSal:=DataFinal;
  sDataRef   := DataFinal;
  FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux));

  // Tratamento para desabilitação de valores na pesquisa das cotações menores que zero.
  // Caso TipoCotacao = 0 ou nulo pesquisará normalmente os valores menores que zero.
  // Caso TipoCotacao = 1 pesquisará os valores menores que zero e mudará para zero.

  vZero := 0;
  I := Pos(',', FormulaAux);
  if i < Pos('[', FormulaAux) then begin
    try
      vZero := StrtoInt(PegaValor(Copy(FormulaAux,1,i-1)));
    except
      vZero := 0;
    end;
  end;

  if (vZero <> 0) and (vZero <> 1) then
     vZero := 0;

  sdata := DataParaMes(DataFinal,0,'I');
  sdata := SUBTRAIR(sdata,1);

  vDataFim := sData;

// Separa o pedaço da Formula que contem os indices e datas de correcao
  I := pos('[',FormulaAux);
  FormulaAux := Copy(FormulaAux,I+1,Length(FormulaAux));
  I := pos(']',FormulaAux);

  vInd := Copy(FormulaAux, 1, I-1);

  FormulaAux := Copy(FormulaAux,i+2,Length(FormulaAux)); // tirar o ] e a ,

  { Pega o Tipo de Filtro G ou F caso tenha }
  If Copy(FormulaAux,1,1) <> '"' Then Begin
    I := Pos(',',FormulaAux);
    sTipoFiltro := Copy(FormulaAux,1,I-1);
    sTipoFiltro := PegaValor(sTipoFiltro);
    FormulaAux := Copy(FormulaAux,I+1,Length(FormulaAux));
  End;

  // Preencher a string com flags de SRB desejados
  if Copy(FormulaAux,1,1) = ',' then begin
     sFiltro := '1,2,3,4,5';
     i := 1;
  end else begin
     i := Pos('"', FormulaAux);
     FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux)); // tirar o "
     i := Pos('"',FormulaAux);
     sFiltro := Copy(FormulaAux, 1, i - 1);

     FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux)); // tirar o "
     i := Pos(',',FormulaAux); // tira a , depois do flgsrb
  end;

  FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux)); // tira a , apos o FLGSRB

  // Implementação de codigo para correcao de valores a partir de uma data base
  i := Pos('[', FormulaAux);
  if i > 0
  then begin
    vFormula := Copy(FormulaAux,i+1,Length(FormulaAux));
    vFormula := Copy(vFormula,1,Length(vFormula)-2);

    i := Pos(',',vFormula);
    if i = 0 then i := Pos(']', vFormula);

    sCorrecao := Copy(vFormula,1,i-1);
    sCorrecao := PegaValor(sCorrecao);
    sCorrecao := TrocaCaracter(sCorrecao,',','.');
    if sCorrecao <> ''
    then sCorrecao := FloattoStr((StrtoFloat(sCorrecao)/100)+1);

    vFormula := Copy(vFormula,i+1,Length(vFormula));
    if vFormula <> ''
    then begin
      i := Pos(',',vFormula);
      if i = 0
      then begin
        i := Length(vFormula);
        sMesDatabase := vFormula;
      end
      else sMesDatabase := Copy(vFormula,1,i-1);

      if i = 0
      then sMesDatabase := ''
      else begin
        sMesDatabase := PegaValor(sMesDatabase);
        if sMesDatabase <> ''
        then begin
          vMesBas := StrtoInt(sMesDatabase);
          vMesRef := StrtoInt(Copy(sDataRef,4,2));
          vAno := StrtoInt(Copy(sDataRef,7,4));
          if vMesBas > vMesRef
          then vAno := vAno - 1;
          if Length(InttoStr(vMesBas)) = 1
          then sMesDatabase := InttoStr(vAno)+'/0'+InttoStr(vMesBas)
          else sMesDatabase := InttoStr(vAno)+'/'+InttoStr(vMesBas);
          vFormula := Copy(vFormula,i+1,Length(vFormula));
          sTipoCalc := PegaValor(vFormula);
          try
            vTipoCalc := StrtoInt(sTipoCalc);
          except
            vTipoCalc := 0;
          end;
        end;
      end;
    end;

    i := Pos(']', FormulaAux);
    FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux)); // tirar ]
  end;

  if sMesDatabase = '' then sCorrecao := '';
  if sCorrecao = ''    then  sMesDatabase := '';

  For  I := 0 to 20 Do Begin
    TabIndices[I].Nome := '';
    TabIndices[I].Data := '';
  End;

  vTp := 1; //Se vTp for 1 é Nome e se for 2 é Data
  vReg := 0; //Incrementador de registros na tabela
  vInd := vInd + ',';
  for i := 1 to Length(vInd)+1 do begin
    if Copy(vInd,i,1) <> ',' then
      vAux := vAux + Copy(vInd,i,1)
    else begin
      if vTp = 1 then begin
        vAux := pegavalor(Trim(vAux));
        tabindices[vReg].nome:=vAux;
        vTp := 2;
        vAux := '';
      end else begin
        vAux := pegavalor(Trim(vAux));
        // tabindices[vReg].Data := dataparames(PEGAVALOR(vAux),0,'I');
        tabindices[vReg].Data:=vAux;
        vTp := 1;
        inc(vReg);
        vAux := '';
      end;
    end;
  end;


// NESTE PONTO A VARIAVEL FORMULAAUX ESTA JA LEU O PARAMETRO FLGSRB
// O PROXIMO PARAMETRO E A CORRECAO, QUE ESTA ENTRE []
// SBINSS(TETO,DATAINICIAL,DATAFINAL,TIPOINDICE,[INDICE,DATA...],"FLGSRB",
//       [CORREÇÃO, MESDATABASE,FLGTIPOCALC...],DATAFIMCORR, FLGDEGRAVACAO,
//        FLGTIPOGRAVA, NUMERODECIMAISINDICE)

  i := Pos(',', FormulaAux);
  FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux)); // tirar , apos [correcao, mesdatabase, ...]

  // Guardar Data de Final de Correcao = DATAFIMCORR
  i := Pos(',',FormulaAux);
  if i > 0
  then begin
    wDataFimCorr := Copy(FormulaAux, 1, i - 1);
    if Trim(wDataFimCorr) <> ''
    then wDataFimCorr := PegaValor(wDataFimCorr);
  end;

  FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux)); // tirar , DATAFIMCORR

  // Testa se Existe Data de Final de Correcao
  if wDataFimCorr <> ''
  then Datafinal := wDataFimCorr;

  // Guardar Flag de Gravação = FLGDEGRAVACAO
  i := Pos(',',FormulaAux);
  if i > 0
  then wFlgGravaCalculo := Copy(FormulaAux, 1, i - 1);

  FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux)); // tirar , FLGDEGRAVACAO

  // Guarda Flag de Tipo de Gravacao = FLGTIPOGRAVA
  i := Pos(',',FormulaAux);
  if i > 0
  then begin
    wFlgTipoGravacao := Copy(FormulaAux, 1, i - 1);
    if Trim(wFlgTipoGravacao) <> ''
    then wFlgTipoGravacao := PegaValor(wFlgTipoGravacao);
  end;

  if Trim(wFlgTipoGravacao) = '' then wFlgTipoGravacao := '0';

  FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux)); // tirar , FLGDEGRAVACAO

  // Guarda Numero de Decimais a Arredondar Fator = NUMERODECIMAISINDICE
  // ATENCAO : COMO É O ULTIMO PARAMETRO, NAO BUSCAR MAIS NENHUMA VIRGULA
  i := Pos(')',FormulaAux);

  if Trim(Copy(FormulaAux, 1, i - 1 )) <> ''
  then begin
    wNumCasasFator := Copy(FormulaAux, 1, I-1);
    wNumCasasFator := PegaValor(wNumCasasFator);
  end;

// FIM DA DECODIFICACAO DA FORMULA
//------------------------------------------------------------------------------


//------------------------------------------------------------------------------
// Trata os FLGSRB Selecionados

// Inicia o vetor de variaveis
//------------------------------------------------------------------------------
// Trata fatores de Correcao

// Inicia Vetor dos fatores de correção
  For x := 1 To 700 Do Begin
    TabFator[x].Mes := '';
    TabFator[x].Fatoracum:=1;
    TabFator[x].Fator:= 1;
  End;

// Preenche Tabela de Indices com os Meses dos Indices
  tabfator[0].fatoracum:=1;
  wVal1 := 0;

  wValOld := 1;
  for i := 0 to 20 do begin
    if TabIndices[i].Data = '' then
      Break;
    if (i = 0) and (TabIndices[i+1].Data = '') then begin
      sDataFim := DataFinal;  // Data Final
      sDataFim := dataparames(sDataFim,0,'I');
      sDataFim := SUBTRAIR(sDataFim,1);
      sData    := tabindices[i].Data;   // Data Inicial
      sData    := dataparames(sdata,0,'I');
    end else begin
      sDataFim := tabindices[i+1].Data;  // Data Final
      if sDataFim = '' then
        sDataFim := DataFinal;
      sDataFim := dataparames(sDataFim,0,'I');
      sDataFim := SUBTRAIR(sDataFim,1);
      sData    := tabindices[i].Data;   // Data Inicial
      sData    := dataparames(sdata,0,'I');
    end;

    vDataAux1 := sData;
    vDataAux2 := sDataFim;

    sData := TabIndices[0].Data;
    sData := dataparames(sdata,0,'I');
    sDataFim := DataFinal;
    sDataFim := dataparames(sDataFim,0,'I');

    if i = 0 then begin
      for x := 1 to 700 do begin
        if x = 1 then
          tabfator[x].Mes := sDataFim
        else begin
          sDataFim := subtrair(sDataFim,1);
          tabfator[x].Mes := sDataFim;
        end;
        if tabfator[x].Mes = sData then
          Break;
      end;
    end;

    sData := vDataAux1;
    sDataFim := vDataAux2;

    With queryregraaux do begin
      close;
      sql.clear;
      vSql := ' SELECT C.COTMESREF, C.COTVALOR FROM MOEDA M,COTACAOMOEDA C '+
              ' WHERE (M.MOESIGLA='''+tabindices[i].nome+''') AND '+
              ' (M.MOECODIGO=C.MOECODIGO) AND (TO_DATE(C.COTMESREF,''MMYYYY'') <= TO_DATE('''+
              copy(sDataFim,6,2)+copy(sDataFim,1,4) +''',''MMYYYY'')) AND (TO_DATE(C.COTMESREF,''MMYYYY'') >= TO_DATE('''+
              copy(sData,6,2)+copy(sData,1,4) + ''',''MMYYYY'')) ORDER BY TO_DATE(COTMESREF,''MMYYYY'') DESC';
      // sData é a menor data - sDataFim é a maior data
      sql.add(vSql);
      open;
    End;

    if (vTipoCalc = 1) and (sMesDatabase <> '') then begin
      if sMesDatabase > sDataFim then
        sDataFim := sMesDatabase;
    end;

// Preenche Tabela de Indices com os Fatores
    queryregraaux.First;
    while not queryregraaux.Eof do begin

      vMesAux := Copy(queryregraaux.fieldbyname('COTMESREF').AsString,3,4)+'/'+
                 Copy(queryregraaux.fieldbyname('COTMESREF').AsString,1,2);

      for j := 1 to 700 do begin
        if TabFator[j].Mes = vMesAux then begin
          tabfator[j].fatoracum := 1;

          if vZero = 0 then
            tabfator[j].fator:= queryregraaux.fieldbyname('COTVALOR').asfloat/100+1
          else begin
            if queryregraaux.fieldbyname('COTVALOR').asfloat > 0 then
              tabfator[j].fator:= queryregraaux.fieldbyname('COTVALOR').asfloat/100+1
            else
              tabfator[j].fator:= 1;
          end;
          Break;
        end;
        if TabFator[j].Mes = '' then
          Break;
      end;

      Queryregraaux.Next;

    End;// While

  End;// For

// OK

  sData := TabFator[1].Mes;
//------------------------------------------------------------------------------
// Processa o vetor de Fatores acumulando os valores
// Atualizar o Valor do MesDatabase
  If (vTipoCalc = 1) and (sMesDatabase <> '') then
    For x := 1 to 700 do Begin
      if TabFator[x].Mes = sMesDataBase then begin
        TabFator[x].fator := StrtoFloat(sCorrecao);
        Break;
      end;
    End;

// Faz a acumulação dos Fatores sem a database
  If sMesDatabase = '' then begin
    For X := 1 to 700 do
      TabFator[X].FatorAcum:=(TabFator[X].Fator*TabFator[X-1].FatorAcum);

  end else begin
// Faz a acumulação dos Fatores com a database
    If vTipoCalc = 0 then begin
      vAcum := 1;
      vFator := 1;

      for X := 1 to 700 do begin
        if sMesDatabase = tabfator[X].Mes then
           LinOK := i;
        if sMesDatabase >= tabfator[X].Mes then begin
           tabfator[I].fatoracum := (vAcum*vFator);
           vAcum := tabfator[X].fatoracum;
           vFator := tabfator[X].fator;
        end;
      end;
      vIni := 1;

      for X := LinOk - 1 downto 1 do begin
        tabfator[X].fatoracum:=(tabfator[X].fator*vIni);
        vIni := tabfator[X].fatoracum;
      end;

    End;

  End; // If (Acumulacao dos Fatores)

  if vTipoCalc = 1 then begin
// Faz a Acumulação dos Descontos (DataBases)
    vFatUlt := 1;
    for X := 1 to 700 do begin
      if Copy(TabFator[X].Mes,6,2) = Copy(sMesDatabase,6,2) then begin
        TabFator[X].FatorAcum := vFatUlt;
        vFatUlt := vFatUlt * TabFator[X].Fator;
      end;
    end;

// Faz a acumulação dos outros fatores
    vFatUlt := 1;
    for X := 700 downto 1 do begin
      if Copy(TabFator[X].Mes,6,2) = Copy(sMesDatabase,6,2) then
        vFatUlt := 1;

      if (Copy(TabFator[X].Mes,6,2) <> Copy(sMesDatabase,6,2)) and  (TabFator[X].Mes <> '') then begin
        vFatUlt := vFatUlt * TabFator[X].Fator;
        TabFator[X].FatorAcum := vFatUlt;
      end;
    end;

    vFatUlt := 1;
    for X := 700 downto 1 do begin
      if TabFator[X].Mes <> '' then begin
        if Copy(TabFator[X].Mes,6,2) = Copy(sMesDatabase,6,2) then
          vFatUlt := TabFator[X].FatorAcum
        else
          TabFator[X].FatorAcum := vFatUlt / TabFator[X].FatorAcum;
      end;
    end;

  end;// If

// Buscando o fator de correcao
  vAcum := 1;
  if sMesDatabase <> '' then
    vAcum := StrtoFloat(sCorrecao);


  DataFinal := '01'+Copy(DataFinal,3,8);
  DataFinal := DatetoStr(StrtoDate(DataFinal)-1);

  try
    QueryIn.FieldbyName('IDPESSOA').AsString;
  except
    MsgDlgRegra('Campo IDPESSOA necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
    Exit;
  end;


  sData := dataparames(DataIni,0,'I');

// sData := DataIni;

//------------------------------------------------------------------------------
// Busca os Salarios que serão Processados
  QueryRegraAux.close;
  QueryRegraAux.Sql.Clear;
  vSql :=    'SELECT SALTETO.MES,SALTETO.VALORPROVENTO,MESTETO,CT.COTVALOR AS TETO,SALTETO.FLGSRB,SALTETO.IDRUBRICA '+
             'FROM '+
             '    (SELECT  MES,VALORPROVENTO,MAX(MESREF) MESTETO,FLGSRB,IDRUBRICA '+
             '     FROM '+
             '         (SELECT HST.MES,HST.VALORPROVENTO,COT.MESREF,COT.COTVALOR AS TETO,'+
             '                 HST.FLGSRB,HST.IDRUBRICA '+
             '          FROM   (SELECT H.MES,H.VALORPROVENTO,H.FLGSRB,H.IDRUBRICA '+
             '                  FROM   HISTRUBSAL H, PROVDESC p  '+
             '                  WHERE  (H.IDPESSOA  = '+QueryIn.FieldbyName('idpessoa').AsString+') AND '+
             '                         (H.MES > '''+ sData +''') AND (H.MES <= '''+ vDataFim +''') AND (SUBSTR(H.MES,6,2)<TO_CHAR(13)) AND '+
             '                         (H.IDRUBRICA = P.IDPROVENTO) AND ';

  If sTipoFiltro = 'F' Then Begin { Filtro por FLGSRB - HistRubSal }
    vSQL := vSQL + ' (H.FLGSRB IN ('+sFiltro+') )  ) HST, '
  End Else Begin                  { Filtro por IDGRUPORUBRICA - ProvDesc }
    { Transfere Grupos para vetor afim de incluir os Plics nas mesmas }
    W :=0;
    Repeat
      I := Pos(',', sFiltro);
      If I <= 0 Then I := Length(sFiltro) Else I := (I-1);  { Acerta posicao }
      TabFiltros[W] := Copy(sFiltro,1,I);
      sFiltro := Copy(sFiltro, I+2, Length(sFiltro));
      Inc(W);
    Until sFiltro = '';
    { Transfere Rubricas do vetor incluiindo os Plics }
    For I := 0 To 30 Do Begin
      If TabFiltros[I] = '' Then Break;
      sFiltro := sFiltro + QuotedStr(TabFiltros[I])+',';
    End;
    sFiltro := Copy(sFiltro, 1, (Length(sFiltro)-1));
    vSQL := vSQL + ' (P.IDGRUPORUBRICA IN ('+sFiltro+') )  ) HST, '
  End;

  vSQL := vSQL + '             (SELECT C.COTVALOR,SUBSTR(C.COTMESREF,3,4)||''/''||SUBSTR(C.COTMESREF,1,2) AS MESREF '+
             '                  FROM   MOEDA M, COTACAOMOEDA C '+
             '                  WHERE  (M.MOESIGLA='''+sTeto+''') AND '+
             '                         (M.MOECODIGO = C.MOECODIGO) AND '+
             '                         (C.COTDATA  <= TO_DATE('''+DataFinal+''',''DD/MM/YYYY''))) COT '+
             '          WHERE  (HST.MES>=COT.MESREF) '+
             '          GROUP  BY HST.MES,HST.VALORPROVENTO,COT.COTVALOR, '+
             '                    HST.FLGSRB,HST.IDRUBRICA,COT.MESREF,COT.COTVALOR '+
             '          HAVING COT.MESREF = MAX(COT.MESREF)) '+
             '     GROUP BY MES,VALORPROVENTO,FLGSRB,IDRUBRICA) SALTETO, '+
             '     MOEDA MO, COTACAOMOEDA CT '+
             'WHERE (MO.MOESIGLA='''+sTeto+''') AND '+
             '      (MO.MOECODIGO = CT.MOECODIGO) AND '+
             '      (SALTETO.MESTETO=SUBSTR(CT.COTMESREF,3,4)||''/''||SUBSTR(CT.COTMESREF,1,2)) '+
             '      ORDER BY SALTETO.MES DESC,SALTETO.FLGSRB DESC';
  QueryRegraAux.Sql.Add(vSql);
  QueryRegraAux.Open;

  If QueryRegraAux.IsEmpty then begin
    Result := '0';
    exit;
  end;

  For  wInt := 0 to 700 Do Begin
    TabSal[wInt].Salario:= 0;
    TabSal[wInt].Mes := '';
    TabSal[wInt].Teto:= 0;
    TabSal[wInt].Tipo:= 0;
  End;

  Cont    := 0;
  ContSal := 0;
// Subtrai um mes da data final de salarios 
  sMesBase:= wDataFimSal;

  sMesSal := wDataFimSal; // Guarda data de referencia da formula
  sMesSeg := paradata('PARADATA('+QueryRegraAux.FieldByName('mes').AsString+',D)'); //Busca a maior data
  ContMes := strToInt(idadeEmmeses(sMesSeg,sMesSal));
  If ContMes > 1 Then begin
    for i:= 1 to ContMes-1 do begin
      Inc(Cont);
      tabsal[Cont].salario  := 0;
      tabsal[Cont].fatoracum:= 0; // FUNCEF
      tabsal[Cont].mes      := subtrair(copy(smesbase,7,4)+'/'+copy(smesbase,4,2),cont);
    end;
    Inc(Cont);
  end;

  if Cont = 0 then
    Inc(Cont);

{
 Códigos do Flag SRB:

 1 - Salário de ativo.
 2 - Auxilio doença
 3 - Benefício do INSS
 4 - Salario Virtual
 5 - Salario de Manutenção Parcial
}

// Vare Tabela de Salarios Gerando um vetor com o Salario ou o Teto de acordo com
// os FLGSRB
  While Not (QueryRegraAux.Eof) do begin
// Caso FLGSRB = 4
    if QueryRegraAux.FieldbyName('FLGSRB').AsInteger = 4 then begin
      tabsal[cont].mes := QueryRegraAux.FieldByName('MES').AsString;
      if QueryRegraAux.FieldByName('VALORPROVENTO').asFloat < QueryRegraAux.FieldByName('TETO').asFloat then
        tabsal[cont].salario := QueryRegraAux.FieldByName('VALORPROVENTO').asFloat
      else
        tabsal[cont].salario := QueryRegraAux.FieldByName('TETO').asFloat;

      tabsal[cont].teto := QueryRegraAux.FieldByName('TETO').asFloat;
      tabsal[cont].tipo := QueryRegraAux.FieldByName('FLGSRB').AsInteger;

    end else begin

      if (tabsal[cont].Tipo <> 4) then begin // Verifica se o vetor é do Tipo FLGSRB = 4
        Case QueryRegraAux.FieldbyName('FlgSrb').AsInteger of
          2..3:begin //Se FLGSRB = 2 ou 3
                 tabsal[cont].mes := QueryRegraAux.FieldByName('mes').AsString;
                 if QueryRegraAux.FieldByName('valorprovento').asFloat < QueryRegraAux.FieldByName('teto').asFloat then
                   tabsal[cont].salario :=tabsal[cont].salario + QueryRegraAux.FieldByName('valorprovento').asFloat
                 else
                   tabsal[cont].salario := tabsal[cont].salario + QueryRegraAux.FieldByName('Teto').asFloat;
                 tabsal[cont].teto := QueryRegraAux.FieldByName('teto').asFloat;
                 tabsal[cont].tipo := QueryRegraAux.FieldByName('flgsrb').AsInteger;
               end;
        end;// Case

      end;// If

      if QueryRegraAux.FieldbyName('FlgSrb').AsInteger = 5 then begin //Caso FLGSRB = 5
        tabsal[cont].mes := QueryRegraAux.FieldByName('mes').AsString;
        if QueryRegraAux.FieldByName('valorprovento').asFloat < QueryRegraAux.FieldByName('teto').asFloat then
          tabsal[cont].salario := tabsal[cont].salario + QueryRegraAux.FieldByName('valorprovento').asFloat
        else
          tabsal[cont].salario :=tabsal[cont].salario + QueryRegraAux.FieldByName('Teto').asFloat;
        tabsal[cont].teto := QueryRegraAux.FieldByName('teto').asFloat;
        TabSal[cont].Tipo := QueryRegraAux.FieldByName('FlgSrb').AsInteger;
      end else begin
        if QueryRegraAux.FieldbyName('FlgSrb').AsInteger = 1 then begin //Caso FLGSRB = 1
          tabsal[cont].mes := QueryRegraAux.FieldByName('mes').AsString;
          if QueryRegraAux.FieldByName('valorprovento').asFloat < QueryRegraAux.FieldByName('teto').asFloat then
            tabsal[cont].salario := tabsal[cont].salario + QueryRegraAux.FieldByName('valorprovento').asFloat
          else
            tabsal[cont].salario := tabsal[cont].salario + QueryRegraAux.FieldByName('Teto').asFloat;
          tabsal[cont].teto := QueryRegraAux.FieldByName('teto').asFloat;
          tabsal[cont].tipo := QueryRegraAux.FieldByName('flgsrb').AsInteger;
        end;
      end;
    end;

    QueryRegraAux.Next;

    smesbase:=TabSal[cont].mes;
    sMesSal:=paradata('PARADATA('+tabsal[cont].mes+',D)');
    sMesSeg:=paradata('PARADATA('+QueryRegraAux.FieldByName('mes').AsString+',D)');
    sFormulaAux:='Difmeses(#'+sMesSal+',#'+sMesSeg+')';
    Difmeses;
    ContMes:= strToInt(fResult);

    if ContMes > 1 Then begin
      for i:= 1 to ContMes-1 do begin
        inc(Cont);
        tabsal[cont].salario :=0;
        tabsal[Cont].fatoracum  := 0; // FUNCEF
        tabsal[cont].Mes := Subtrair(TabSal[cont-1].mes,1);
      end;
    end;

    If QueryRegraAux.FieldByName('mes').AsString < smesbase then begin
      if tabsal[cont].salario > 0 then
        inc(ContSal);
      inc(Cont);
    End;

  End;// While

  For i := 1 to Cont do begin
    j := 1;
    vAchou := False;
    vMes := TabSal[i].Mes;
    while TabFator[j].Mes <> '' do begin
      if vMes = TabFator[j].Mes then begin
        vAchou := True;
        Break;
      end;
      inc(j);
    end;

// Processa o Calculo do DSalario Corrigido // Arredondar
    vFator := 1;
    Case vTipoCalc of
      0:begin
          if vAchou then
            vFator := TabFator[j].FatorAcum
          else begin
            if (TabSal[i].Mes > sMesDatabase) and (sMesDatabase <> '') then
              vFator := TabFator[1].FatorAcum;
          end;
// Arredonda o Fator de Acordo com Parametro da Formula
          If wNumCasasFator > '0' Then Begin
            wStrAux := 'ROUND('+FloatToStr(vFator)+','+wNumCasasFator+')';
            vFator  := StrToFloat(Arredonda(wStrAux));
          End;

          if (TabSal[i].Mes > sMesDatabase) and (sMesDatabase <> '') then begin
            TabSal[i].salario:=TabSal[i].salario * vAcum / vFator;
            vFatorAux := vAcum / vFator;
            TabSal[i].FatorAcum := vFatorAux;
          end else begin
            if vAchou then begin
              TabSal[i].salario:=(TabSal[i].salario*vFator)*vAcum;
              TabSal[i].FatorAcum := vFator;
              vFatorAux := vFator * vAcum;
              TabSal[i].FatorAcum := vFatorAux;
            end else begin
              TabSal[i].salario:=(TabSal[i].salario*1)*vAcum;
              vFatorAux := 1 * vAcum;
              TabSal[i].FatorAcum := vFatorAux;
            end;
          end;
        end;
      1:begin
          vFatorAux := TabFator[j].FatorAcum;
          if TabSal[i].salario > 0 then
            TabSal[i].salario := TabSal[i].salario * vFatorAux;
          TabSal[i].FatorAcum := vFatorAux;
        End;
    End;// Case
// Trunca Valor do Salario em duas casas decimais - Valor Monetario
    wStrAux := 'ATUARIAL(TRUNC('+FloatToStr(TabSal[I].Salario)+',2))';
    TabSal[I].Salario  := StrToFloat(ATUARIAL(wStrAux));
  End;

//------------------------------------------------------------------------------
// Gera o Resultado da Função
  Result := '';
  For I := 1 To 700 Do Begin

    If TabSal[i].Mes <> '' Then Begin
// Concatena Resultado
      Result := Result +
                TabSal[i].Mes+'|'+FloattoStr(TabSal[i].Salario)+'|'+
                FloattoStr(TabSal[i].Teto)+'|'+InttoStr(TabSal[i].Tipo)+'|;';
// Caso Desejado, Grava na Memoria de Calculo
      If wFlgGravaCalculo = '1' Then Begin
        If FidCalculo = 0 Then begin
          FidCalculo := LeUltRegistro(NIL, 'CALCULO');
          QueryRegra.close;
          QueryRegra.SQL.clear;
          QueryRegra.SQL.Add('INSERT INTO CALCULO (IDCALCULO) VALUES ('+IntToStr(FidCalculo)+')');
          QueryRegra.ExecSQL;
        End;

        If (Trim(TabSal[i].Mes) <> '') Then Begin
// Arredonda o Fator de Acordo com Parametro da Formula
          If wNumCasasFator > '0' Then Begin
            wStrAux := 'ROUND('+FloatToStr(TabSal[I].FatorAcum)+','+wNumCasasFator+')';
            TabSal[I].FatorAcum  := StrToFloat(Arredonda(wStrAux));
          End;


          FidCalculoBenef := LeUltRegistro(NIL, 'CALCULOBENEF');
          QueryRegra.Close;
          QueryRegra.SQL.Clear;
          QueryRegra.SQL.Add('INSERT INTO CALCULOBENEF (IDCALCULO, IDCALCULOBENEF,'+
                             ' INDICEACUM,SALARIOVP,TETOINSS,MES,TIPOCALCULO,IDREGRA)'+
                             'VALUES '+
                             '('''+
                              FloatToStr(FidCalculo)   +''','+
                              IntToStr(FidCalculoBenef)+','+
                              FloatToStr(TabSal[I].FatorAcum)    +','+
                              FloatToStr(TabSal[I].Salario)+','+
                              FloatToStr(TabSal[I].Teto)   +','''+
                              TabSal[I].Mes            +''','''+
                              wFlgTipoGravacao         +''','''+
                              IntToStr(iRegraMaster)   +''')');
          Queryregra.ExecSQL;
        End;
      End;
    End;
  End;
  Result := Copy(Result,1,Length(Result)-1);

end;


//******************************************************************************
Function TRegra.SORTINSS(formula:string):String;
var
   vMes, vAux, FormulaAux, Vetor, Opc1, Opc2 : String;
   vTip, Opcao1, Opcao2, vPos, i, Linha : LongInt;
   vSal, vTet : Real;
begin
    FormulaAux := copy(formula,10,length(formula)-8);
    FormulaAux := Copy(FormulaAux, 1, Length(FormulaAux)-1);
    fillchar(TabSalInss,sizeof(TabSalInss),#0);
    fillchar(TabSalAux,sizeof(TabSalAux),#0);

    i := pos(',',FormulaAux);
    Vetor := Copy(FormulaAux,1,i-1);
    Vetor := pegavalor(Vetor);
    FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux));

    i := pos(',',FormulaAux);
    Opc1 := Copy(FormulaAux,1,i-1);  //Se for 0 -> Data se for 1 -> valor
    Opc1 := pegavalor(Opc1);
    Opcao1 := StrtoInt(Opc1);
    FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux));

    //i := pos(',',FormulaAux);
    Opc2 := Copy(FormulaAux,1,i-1);  //Se for 0 -> Ascendente se for 1 Descendente
    Opc2 := pegavalor(Opc2);
    Opcao2 := StrtoInt(Opc2);
    FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux));

    Linha := 1;
    vAux := '';
    vPos := 1;
    vTet := 0;
    vSal := 0;
    vTip := 0;
    for i := 1 to Length(Vetor) do begin
        if Copy(Vetor,i,1) <> ';' then begin
           if Copy(Vetor,i,1) <> '|' then begin
              vAux := vAux + Copy(Vetor,i,1);
           end else begin
               Case vPos of
                    1 : TabSalAux[Linha].Mes := vAux;
                    2 : TabSalAux[Linha].Salario := StrtoFloat(vAux);
                    3 : TabSalAux[Linha].Teto := StrtoFloat(vAux);
                    4 : TabSalAux[Linha].Tipo := StrtoInt(vAux);
               end;
               vAux := '';
               Inc(vPos);
               if vPos = 5 then
                  vPos := 1;
           end;
        end else begin
            vAux := '';
            Inc(Linha);
        end;
    end;

    Linha := Linha + 1;
    vAux := '';
    case Opcao2 of
         0 : begin //Ascendente - Menor para o maior
                   if Opcao1 = 0 then begin //Testa pela data
                      vMes := TabSalAux[1].Mes;
                      vPos := 1;
                      i := 0;
                      while i <> Linha do begin
                          Inc(i);
                          if (vMes < TabSalAux[i].Mes) and (TabSalAux[i].Mes <> '') then begin
                             vMes := TabSalAux[i].Mes;
                             vTet := TabSalAux[i].Teto;
                             vSal := TabSalAux[i].Salario;
                             vTip := TabSalAux[i].Tipo;
                          end;
                          if (vMes = TabSalAux[i].Mes) and (TabSalAux[i].Mes <> '') then begin
                             vTet := TabSalAux[i].Teto;
                             vSal := TabSalAux[i].Salario;
                             vTip := TabSalAux[i].Tipo;
                          end;
                          if (i = Linha) and (vMes <> '') then begin
                             AchaMes(vMes);
                             TabSalInss[vPos].Mes := vMes;
                             TabSalInss[vPos].Teto := vTet;
                             TabSalInss[vPos].Salario := vSal;
                             TabSalInss[vPos].Tipo := vTip;
                             Inc(vPos);
                             vMes := PegaMes('');  // Mudei aqui
                             if vPos > i then
                                Break
                             else
                                i := 0;
                          end;
                      end;
                   end else begin // Testa pelo Valor
                      vSal := 0;
                      vPos := 1;
                      i := 0;
                      vMes := '';
                      while i <> Linha do begin
                          Inc(i);
                          if vMes = '' then begin
                             vMes := TabSalAux[i].Mes;
                             vTet := TabSalAux[i].Teto;
                             vSal := TabSalAux[i].Salario;
                             vTip := TabSalAux[i].Tipo;
                          end;

                          if (vSal < TabSalAux[i].Salario) and (TabSalAux[i].Mes <> '') then begin
                             vMes := TabSalAux[i].Mes;
                             vTet := TabSalAux[i].Teto;
                             vSal := TabSalAux[i].Salario;
                             vTip := TabSalAux[i].Tipo;
                          end;

                          if (i = Linha) and (vMes <> '') then begin
                             AchaMes(vMes);
                             TabSalInss[vPos].Mes := vMes;
                             TabSalInss[vPos].Teto := vTet;
                             TabSalInss[vPos].Salario := vSal;
                             TabSalInss[vPos].Tipo := vTip;
                             vMes := '';
                             vTet := 0;
                             vSal := 0;
                             vTip := 0;
                             Inc(vPos);
                             if vPos > i then
                                Break
                             else
                                i := 0;
                          end;
                      end;
                   end;
             end;
         1 : begin //Descendente
                   if Opcao1 = 0 then begin //Testa pela data
                      vMes := TabSalAux[1].Mes;
                      vPos := 1;
                      i := 0;
                      while i <> Linha do begin
                          Inc(i);
                          if (vMes > TabSalAux[i].Mes) and (TabSalAux[i].Mes <> '') then begin
                             vMes := TabSalAux[i].Mes;
                             vTet := TabSalAux[i].Teto;
                             vSal := TabSalAux[i].Salario;
                             vTip := TabSalAux[i].Tipo;
                          end;
                          if (vMes = TabSalAux[i].Mes) and (TabSalAux[i].Mes <> '') then begin
                             vTet := TabSalAux[i].Teto;
                             vSal := TabSalAux[i].Salario;
                             vTip := TabSalAux[i].Tipo;
                          end;
                          if (i = Linha) and (vMes <> '') then begin
                             AchaMes(vMes);
                             TabSalInss[vPos].Mes := vMes;
                             TabSalInss[vPos].Teto := vTet;
                             TabSalInss[vPos].Salario := vSal;
                             TabSalInss[vPos].Tipo := vTip;
                             Inc(vPos);
                             vMes := PegaMes('');  // Mudei aqui
                             if vPos > i then
                                break
                             else
                                i := 0;
                          end;
                      end;
                   end else begin //Testa pelo Valor
                      vSal := 0;
                      vPos := 1;
                      i := 0;
                      vMes := '';
                      while i <> Linha do begin
                          Inc(i);
                          if vMes = '' then begin
                             vMes := TabSalAux[i].Mes;
                             vTet := TabSalAux[i].Teto;
                             vSal := TabSalAux[i].Salario;
                             vTip := TabSalAux[i].Tipo;
                          end;

                          if (vSal > TabSalAux[i].Salario) and (TabSalAux[i].Mes <> '') then begin
                             vMes := TabSalAux[i].Mes;
                             vTet := TabSalAux[i].Teto;
                             vSal := TabSalAux[i].Salario;
                             vTip := TabSalAux[i].Tipo;
                          end;

                          if (i = Linha) and (vMes <> '') then begin
                             AchaMes(vMes);
                             TabSalInss[vPos].Mes := vMes;
                             TabSalInss[vPos].Teto := vTet;
                             TabSalInss[vPos].Salario := vSal;
                             TabSalInss[vPos].Tipo := vTip;
                             vMes := '';
                             vTet := 0;
                             vSal := 0;
                             vTip := 0;
                             Inc(vPos);
                             if vPos > i then
                                Break
                             else
                                i := 0;
                          end;
                      end;
                   end;
             end;
    end;

    Result := '';
    for i := 1 to 700 do begin
        if TabSalInss[i].Mes <> '' then begin
           Result := Result +
                     TabSalInss[i].Mes+'|'+FloattoStr(TabSalInss[i].Salario)+'|'+
                     FloattoStr(TabSalInss[i].Teto)+'|'+InttoStr(TabSalInss[i].Tipo)+'|;'
        end;
    end;
    Result := Copy(Result,1,Length(Result)-1);
end;


function TRegra.AchaMes(Mes : String) : Boolean;
var
   i : LongInt;
begin
     Result := False;
     for i := 1 to 700 do begin
         if TabSalAux[i].Mes = Mes then begin
            TabSalAux[i].Mes := '';
            TabSalAux[i].Salario := 0;
            TabSalAux[i].Teto := 0;
            TabSalAux[i].Tipo := 0;
            Result := True;
            Break;
         end;
     end;
end;


function TRegra.PegaMes(Mes : String) : String;
var
   i : LongInt;
begin
     Result := '';
     for i := 1 to 700 do begin
         if TabSalAux[i].Mes <> '' then begin
            Result := TabSalAux[i].Mes;
            Break;
         end;
     end;
end;


Function TRegra.NUMINSS(formula:string):String;
var
   vAux, Vetor, FormulaAux, wTipoResult : String;
   vRes, i, vPos, Linha : LongInt;
begin
    FillChar(TabSalAux,sizeof(TabSalAux),#0);
    FormulaAux := copy(formula,9,length(formula)-7);

    I := pos(',', FormulaAux);
    If I = 0 Then
      I := Pos(')', FormulaAux);

    Vetor := Copy(FormulaAux, 1, i - 1);
    Vetor := pegavalor(Vetor);

    FormulaAux := Copy(FormulaAux, I+1, Length(trim(FormulaAux))-1);

    wTipoResult := Copy(FormulaAux, 1, Length(trim(FormulaAux))-1);
    wTipoResult := PegaValor(wTipoResult);
// Caso não tenha parametro de tipo de resultado usa default
    If Trim(wTipoResult) = '' Then wTipoResult := '0';

    Linha := 1;
    vAux := '';
    vPos := 1;
    for i := 1 to Length(Vetor) do begin
        if Copy(Vetor,i,1) <> ';' then begin
           if Copy(Vetor,i,1) <> '|' then begin
              vAux := vAux + Copy(Vetor,i,1);
           end else begin
               Case vPos of
                    1 : TabSalAux[Linha].Mes := vAux;
                    2 : TabSalAux[Linha].Salario := StrtoFloat(vAux);
                    3 : TabSalAux[Linha].Teto := StrtoFloat(vAux);
                    4 : TabSalAux[Linha].Tipo := StrtoInt(vAux);
               end;
               vAux := '';
               Inc(vPos);
               if vPos = 5 then
                  vPos := 1;
           end;
        end else begin
            vAux := '';
            Inc(Linha);
        end;
    end;

    vRes := 0;
//    for i := 1 to Linha + 1 do begin {DANY}
    for i := 1 to Linha do begin
        if wTipoResult = '0' then begin
          if TabSalAux[i].Salario > 0 then inc(vRes)
        end else begin
          If TabSalAux[i].Salario  >= 0 then inc(vRes);
        end;
    end;

    Result := InttoStr(vRes);
end;


//******************************************************************************
// Formula - Soma os valores de um vetor(String) passado pelo SBINSS e faz a media a
//           partir de "NumerodaMedia"
Function TRegra.MEDIAINSS(formula:string):String;
Var
  vAux, NumMed, Vetor, FormulaAux : String;
  vRes, vPos, Linha, i, vNum : LongInt;
  vSal : Real;
begin
//------------------------------------------------------------------------------
// DECODIFICA FORMULA

// Inicia Vetor de Salarios /Nulo
  FillChar(TabSalAux,SizeOf(TabSalAux),#0);
// Retira nome da Formula
  FormulaAux := Copy(Formula,11,Length(Formula)-9);
  FormulaAux := Copy(FormulaAux, 1, Length(FormulaAux)-1);

// Guada String de Salarios na variavel "Vetor"
  I := Pos(',',FormulaAux);
  Vetor := Copy(FormulaAux,1,I-1);
  Vetor := Pegavalor(Vetor);

// Pega Numero para Media
  FormulaAux := Copy(FormulaAux,I+1,Length(FormulaAux));
  I := Pos(',',FormulaAux);
  if I = 0 then
     I :=  Length(FormulaAux) + 1;
  NumMed := Copy(FormulaAux,1,I-1);
  NumMed := pegavalor(NumMed);
  vNum   := StrToInt(NumMed);

// Pega Forma de Resultado
  FormulaAux := Copy(FormulaAux,I+1,Length(FormulaAux));
  I := pos(',',FormulaAux);
  If I = 0 Then
    I := Length(FormulaAux) + 1;
  Try
    vRes := StrtoInt(PegaValor(Copy(FormulaAux,1,I-1)));
  Except
    vRes := 0;
  end;
// Caso passado errado, tranforma em Zero (Sem Formatacao)
  If (vRes <> 0) And // Sem Formatacao
     (vRes <> 1) And // Arredondado
     (vRes <> 2)     // Truncado
  Then
    vRes := 0;


  Linha := 1;
  vAux  := '';
  vPos  := 1;
// Monta Vetor com os Salarios
  For I := 1 To Length(Vetor) Do Begin
    If Copy(Vetor,I,1) <> ';' Then Begin
      If Copy(Vetor,I,1) <> '|' Then Begin
        vAux := vAux + Copy(Vetor,I,1);
      End Else Begin
        Case vPos Of
          1 : TabSalAux[Linha].Mes     := vAux;
          2 : TabSalAux[Linha].Salario := StrtoFloat(vAux);
          3 : TabSalAux[Linha].Teto    := StrtoFloat(vAux);
          4 : TabSalAux[Linha].Tipo    := StrtoInt(vAux);
        End;
        vAux := '';
        Inc(vPos);
        If vPos = 5 then
          vPos := 1;
      End;
    End Else Begin
      vAux := '';
      Inc(Linha);
    End;
  End;

  vSal := 0;
  For i := 1 to vNum do begin
    if TabSalAux[i].Salario > 0 then begin
      Case vRes of
        0 : vSal := vSal + TabSalAux[i].Salario;
        1 : vSal := vSal + ArredValor(TabSalAux[i].Salario,2);
        2 : vSal := vSal + TruncValor(TabSalAux[i].Salario,2);
      end;
    end;
  end;

  If vNum > 0 Then
    vSal := vSal / vNum;

  Result := FloatToStr(vSal);
end;

Function TRegra.NUMCONTRIB(Formula:string):String;
var
   vIdPatro, vTipo, IdContrib, vSql, DataIni, DataFim, FormulaAux : String;
   i : LongInt;
begin
    FormulaAux := copy(formula,12,length(formula));
    FormulaAux := Copy(FormulaAux,1,Length(FormulaAux)-1);

    i := Pos(',',FormulaAux);
    DataIni := Copy(FormulaAux,1,i-1);
    DataIni := PegaValor(DataIni);
    DataIni := DataParaMes(DataIni,0,'I');
    FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux));

    i := Pos(',',FormulaAux);
    DataFim := Copy(FormulaAux,1,i-1);
    DataFim := PegaValor(DataFim);
    DataFim := DataParaMes(DataFim,0,'I');
    FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux));

    i := Pos(',',FormulaAux);
    if i = 0 then
       i := Length(FormulaAux)+1;
    IdContrib := Copy(FormulaAux,1,i-1);
    IdContrib := PegaValor(IdContrib);
    FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux));

    i := Pos(',',FormulaAux);
    if i = 0 then
       i := Length(FormulaAux)+1;
    vTipo := Copy(FormulaAux,1,i-1);
    vTipo := PegaValor(vTipo);
    FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux));
    try
       StrtoInt(vTipo);
    except
          vTipo := '0';
    end;

    if (StrtoInt(vTipo) <> 0) and (StrtoInt(vTipo) <> 1) then
       vTipo := '0';

    i := Pos(',',FormulaAux);
    if i = 0 then
       i := Length(FormulaAux)+1;
    vIdPatro := Copy(FormulaAux,1,i-1);
    vIdPatro := PegaValor(vIdPatro);
    FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux));

    try
       StrtoInt(vIdPatro);
    except
          vIdPatro := '';
    end;

    try
       QueryIn.FieldbyName('IDPESSOA').AsString;
    except
          MsgDlgRegra('Campo IDPESSOA necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
          Exit;
    end;

    QueryRegraAux.close;
    QueryRegraAux.Sql.Clear;
    vSql := ' select count(distinct(h.mesreferencia)) Qtde from hstcontribprev h, contprev c '+
            ' where (h.idpessoa = '+QueryIn.FieldbyName('idpessoa').AsString+')'+
            ' and (h.idcontribuicao = c.idcontribuicao) and (c.flgpagador = ''C'')';

    if vIdPatro <> '' then
       vSql := vSql + ' and (h.idpessjur = '+vIdPatro+') ';

    if vTipo = '1' then
       vSql := vSql + ' and (h.valorrecebido > 0) ';

    if IdContrib <> '' then
       vSql := vSql + ' and (h.idcontribuicao = '+IdContrib+') ';

    vSql := vSql + ' and (substr(h.mesreferencia,6,2) <> 13) and '+
                   ' (mesreferencia <= '''+DataFim+''')'+
                   ' and (mesreferencia >= '''+DataIni+''')';
    QueryRegraAux.Sql.Add(vSql);
    QueryRegraAux.Open;

    Result := '0';
    if not QueryRegraAux.IsEmpty then
       Result := QueryRegraAux.FieldbyName('Qtde').AsString;
end;


{******************************************************************************}
{ Formula de Acesso a Tabela Genérica                                          }
{------------------------------------------------------------------------------}
Function TRegra.TABGENERICA: String;
var
  vPos2, vPos, i : Integer;
  sTabela, sChave, sColPesq, sColCons, sOpcao, sTipoDado, sSqlAux2, sSqlAux,
  sValorAux, vFormula, vRes, sCond, sOrder, sValorCampo, sLinha, AuxCampo:String;
  Numero : Boolean;
  Vlr : Real;
begin
  FError := False;
//------------------------------------------------------------------------------
// Decifra String da Formula
//------------------------------------------------------------------------------
// Pega a Tabela Generica a ser Pesquisada
  vFormula:= sFormulaAux;
  vFormula:= Copy(sFormulaAux,13,Length(sFormulaAux));
  vFormula:= Copy(vFormula,1,Length(vFormula)-1);
  I := Pos(',',vFormula);
  sTabela := Copy(vFormula,1,I-1);
  sTabela := ''''+PegaValor(sTabela)+'''';

//------------------------------------------------------------------------------
// Pega Campo Chave
  vFormula := Copy(vFormula,i+1,Length(vFormula));
  I := Pos(',',vFormula);
  sChave := Copy(vFormula,1,I-1);
  sChave := ''''+PegaValor(sChave)+'''';
  sChave := TrocaVirgulaPonto(sChave);

//------------------------------------------------------------------------------
// Pega Coluna de Pesquisa
  vFormula := Copy(vFormula,I+1,Length(vFormula));
  I := Pos(',',vFormula);
  sColPesq := Copy(vFormula,1,I-1);
  sColPesq := ''''+PegaValor(sColPesq)+'''';

//------------------------------------------------------------------------------
// Pega Coluna de Consulta
  vFormula := Copy(vFormula,I+1,Length(vFormula));
  I := Pos(',',vFormula);
  if I = 0 then
     I := Length(vFormula);
  sColCons := Copy(vFormula,1,i-1);
  sColCons := ''''+PegaValor(sColCons)+'''';

//------------------------------------------------------------------------------
// Pega Tipo de Tipo de Pesquisa (0-Igual, 1-Menor,2-Maior)
  vFormula := Copy(vFormula,i+1,Length(vFormula));
  sOpcao := PegaValor(vFormula);

// Caso Tipo de Pesquisa inválido, pesquisa igual (0)
  if (sOpcao <> '0') and (sOpcao <> '1') and (sOpcao <> '2') then
     sOpcao := '0';

//------------------------------------------------------------------------------
// Monta Condicoes do SQL de acordo com o Tipo de Pesquisa
  if (sOpcao = '0') or (sOpcao = '') then begin
     sCond := ' = ';
     sOrder := '';
  end;

  if sOpcao = '1' then begin
     sCond := ' <= ';
     sOrder := ' ORDER BY 1 DESC ';
  end;

  if sOpcao = '2' then begin
     sCond := ' >= ';
     sOrder := ' ORDER BY VALOR' ;
  end;

//------------------------------------------------------------------------------
// Busca o Tipo de Dado do campo pesquisado na Tabela Genérica
  sSqlAux := 'SELECT '+
             '  IDTIPODADO    '+
             'FROM   '+
             '  CAMPOTABGENER '+
             'WHERE  '+
             '  CODTABELA = '+sTabela+' AND '+
             '  CODCAMPO  = '+UpperCase(sColPesq);

// Fecha e Abre a Query de Pesquisa
  QueryRegra.Close;
  QueryRegra.Sql.clear;
  QueryRegra.Sql.Add(sSqlAux);
  QueryRegra.Open;
// Guarda Tipo de dado do campo pesquisado
  sTipoDado := QueryRegra.FieldByName('IDTIPODADO').AsString;

  Numero := False;

  If Not FError Then Begin

// Tipo de Dado NUMERICO
    If sTipoDado = '1' Then Begin
// Acerta Valor de pesquisa
      sChave := OraNumero(sChave);
      sChave := Copy(sChave,2,Length(sChave));
      sChave := Copy(sChave,1,Length(sChave)-1);
// Acerda ordenacao
      If sOpcao = '1' Then
        sOrder := ' ORDER BY TO_NUMBER(REPLACE(VALOR,''.'','','')) DESC '
      Else If sOpcao = '2' Then
        sOrder := ' ORDER BY TO_NUMBER(REPLACE(VALOR,''.'','',''))      ';


// Seta indicados de valor numerico
      Numero := True;
// Monta e Executa a Consulta do Valor Desejado
      sSqlAux2 := 'SELECT '+
                  '  VALOR, NUMLINHA '+
                  'FROM   '+
                  '  (   '+
                  '   SELECT /*+ INDEX (VALTABGENER XPKVALTABGENER) */ '+
                  '     REPLACE(VALOR,'','',''.'') AS VALOR, NUMLINHA  '+
                  '   FROM   '+
                  '     VALTABGENER  '+
                  '   WHERE  '+
                  '     CODTABELA = '+sTabela            +' AND '+
                  '     CODCAMPO  = '+UpperCase(sColPesq)+
                  '  ) A '+
                  'WHERE TO_NUMBER(REPLACE(VALOR,''.'','','')) '+
                    sCond +
                    sChave+
                    sOrder;
// Abre a Consulta
      QueryRegra.Sql.Clear;
      QueryRegra.Sql.Add(sSqlAux2);
      QueryRegra.Open;
// Guarda a linha do valor desejado
      sLinha := QueryRegra.FieldByName('NUMLINHA').AsString;

    End else begin

// Tipo de Dado ALFANUMERICO
      If sTipoDado = '2' Then Begin
        sValorCampo := ' Valor ';
      End Else Begin

// Tipo de Dado DATA
        If sTipoDado = '3' then begin
           sValorCampo := 'TO_DATE(Valor,''DD/MM/YYYY'')';
           sChave:='TO_DATE('+schave+',''DD/MM/YYYY'')';

        End Else Begin
// Outro Tipo ERRO
          If sColPesq <>'''NUMLINHA''' Then Begin
            FError := True;
            Result := '-6010'
          End Else Begin
            sValorCampo := ' Valor ';
          End;
        End;

      End;
    End;

//------------------------------------------------------------------------------
// Caso não seja Numero Continua Rotina
    If Not Numero Then Begin

      If sColPesq <> '''NUMLINHA''' Then Begin

        If Not FError Then Begin

// Caso Dado tipo DATA
          If sTipoDado = '3' Then Begin
            sSqlAux := 'SELECT TO_DATE(VALOR,''DD/MM/YYYY'') AS VALOR, NUMLINHA '+
                       'FROM VALTABGENER '+
                       'WHERE CODTABELA = '+sTabela+' AND '+
                       '      CODCAMPO  = '+UpperCase(sColPesq)+' AND '+
                        sValorCampo+sCond+sChave+' '+
                        sOrder;
          End Else Begin
            sSqlAux := 'SELECT VALOR, NUMLINHA '+
                       'FROM VALTABGENER '+
                       'WHERE CODTABELA = '+sTabela+' AND '+
                       '      CODCAMPO  = '+UpperCase(sColPesq)+' AND '+
                       sValorCampo+sCond+sChave+' '+
                       sOrder;
          End;

          If sValorAux = '' Then
            sValorAux := sValorCampo;

          If sTipoDado = '1' Then Begin
            sSqlAux2 := 'SELECT TO_NUMBER(REPLACE(VALOR,''.'','','')) VALOR, NUMLINHA '+
                        'FROM VALTABGENER '+
                        'WHERE CODTABELA = '+sTabela+' AND '+
                        '      CODCAMPO  = '+UpperCase(sColPesq)+' AND '+
                        sValorAux+sCond+sChave+' '+
                        sOrder;
          End;

          QueryRegra.Close;
          QueryRegra.Sql.clear;
          QueryRegra.Sql.add(sSqlAux);
          QueryRegra.Open;

          sLinha := QueryRegra.FieldByName('NUMLINHA').AsString;

          if (sLinha = '') and (sTipoDado = '1') then begin
             QueryRegra.Close;
             QueryRegra.Sql.Clear;
             QueryRegra.Sql.Add(sSqlAux2); // SQL feito para acabar com o bug do Oracle 8.0
             QueryRegra.Open;
             sLinha := QueryRegra.FieldByName('NUMLINHA').AsString;
          end;

          if sLinha = '' then begin
             Result := '';
          end;

        end;

      end else

      slinha:=sChave;

    end;

    if sLinha = '' then begin
      Result := '';
      Exit;
    end;

    If Not FError Then Begin

      sSqlAux := 'SELECT VALOR '+
                 'FROM VALTABGENER '+
                 'WHERE CODTABELA = '+sTabela+' AND '+
                 '      CODCAMPO  = '+UpperCase(sColCons)+' AND '+
                 '      NUMLINHA = '+sLinha;
      QueryRegra.Close;
      QueryRegra.Sql.clear;
      QueryRegra.Sql.add(sSqlAux);
      QueryRegra.Open;
      Result := QueryRegra.FieldByName('VALOR').AsString;
    End;

    FError := False;
  End;

// Caso Resultado Nulo, Retorna 1 espaço.
  if Result = '' then
     Result := ' ';

end;


//******************************************************************************
Function TRegra.OPCONTRIB(formula:String) : String;
Var
   FormulaAux, NumContrib, vData, vSql, Op1, Op2, Op3, NomeVar1,
   NomeVar2, NomeVar3 : String;
   i : integer;
begin
   FormulaAux := Copy(formula,11,length(formula));
   FormulaAux := Copy(FormulaAux,1,Length(FormulaAux)-1);

   i := pos(',',FormulaAux);
   NumContrib := Copy(FormulaAux,1,i-1);
   NumContrib := pegavalor(NumContrib);
   FormulaAux := Copy(FormulaAux,i+1,length(FormulaAux));

   i := pos(',',FormulaAux);
   vData := Copy(FormulaAux,1,i-1);
   vData := pegavalor(vData);
   vData := DataParaMes(vData,0,'I');

   FormulaAux := Copy(FormulaAux,i+1,length(FormulaAux));

   i := pos(',',FormulaAux);
   NomeVar1 := copy(FormulaAux,1,i-1);
   if copy(NomeVar1,1,1) = '@' Then
      Nomevar1 := copy(NomeVar1,2,length(NomeVar1));
   FormulaAux := Copy(FormulaAux,i+1,length(FormulaAux));

   i := pos(',',FormulaAux);
   NomeVar2     := copy(FormulaAux,1,i-1);
   if copy(NomeVar2,1,1) = '@' Then
      Nomevar2 := copy(NomeVar2,2,length(NomeVar2));
   FormulaAux := Copy(FormulaAux,i+1,length(FormulaAux));

   NomeVar3     := FormulaAux;
   if copy(NomeVar3,1,1) = '@' Then
      Nomevar3 := copy(NomeVar3,2,length(NomeVar3));

   if vData = '' then begin
      try
         QueryIn.FieldbyName('IDPESSOA').AsString;
      except
          MsgDlgRegra('Campo IDPESSOA necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
          Exit;
      end;

      vSql := 'SELECT IDPESSOA, VALORBASE1, VALORBASE2, VALORBASE3 '+
              'FROM CONTRIBPREVPARTP WHERE '+
              '(IDPESSOA    = '+QueryIn.FieldbyName('IDPESSOA').AsString+') AND '+
              '(IDPESSJUR   = '+QueryIn.FieldbyName('IDPESSJUR').AsString+') AND '+
              '(IDPLANOPREV = '+QueryIn.FieldbyName('IDPLANOPREV').AsString+') AND '+
              '(IDCONTRIBUICAO = '+NumContrib+')';

      QueryRegra.Close;
      QueryRegra.Sql.clear;
      QueryRegra.Sql.add(vSql);
      QueryRegra.Open;
      if QueryRegra.IsEmpty then begin
         Op1 := '-1';
         Op2 := '-1';
         Op3 := '-1';
      end else begin
          Op1 := QueryRegra.FieldbyName('VALORBASE1').AsString;
          Op2 := QueryRegra.FieldbyName('VALORBASE2').AsString;
          Op3 := QueryRegra.FieldbyName('VALORBASE3').AsString;
      end;

      if Op1 = '' then
         Op1 := '0';
      if Op2 = '' then
         Op2 := '0';
      if Op3 = '' then
         Op3 := '0';

      SetVariavel(NomeVar1,Op1,NomeVar1);
      SetVariavel(NomeVar2,Op2,NomeVar2);
      SetVariavel(NomeVar3,Op3,NomeVar3);
      FResult := 'VERDADEIRO';
      if (Op1 = '-1') and (Op2 = '-1') and (Op3 = '-1') then
         FResult := 'FALSO'
      else if (Op1 = '0') and (Op2 = '0') and (Op3 = '0') then
           FResult := 'FALSO';
      Exit;
   end else begin
       try
          QueryIn.FieldbyName('IDPESSOA').AsString;
       except
          MsgDlgRegra('Campo IDPESSOA necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
          Exit;
       end;

       vSql := 'SELECT '+RuleNumber+' AS IDREGRA, VALOROP1, VALOROP2, VALOROP3 FROM HSTCONTRIBPREV WHERE '+
               '(IDPESSOA    = '+QueryIn.FieldbyName('IDPESSOA').AsString+') AND '+
               '(IDPESSJUR   = '+QueryIn.FieldbyName('IDPESSJUR').AsString+') AND '+
               '(IDPLANOPREV = '+QueryIn.FieldbyName('IDPLANOPREV').AsString+') AND '+
               '(IDCONTRIBUICAO = '+NumContrib+') AND (MESREFERENCIA = '''+vData+''')';
       QueryRegra.Close;
       QueryRegra.Sql.clear;
       QueryRegra.Sql.add(vSql);
       QueryRegra.Open;

       if QueryRegra.IsEmpty then begin
          Op1 := '-1';
          Op2 := '-1';
          Op3 := '-1';
       end else begin
           Op1 := QueryRegra.FieldbyName('VALOROP1').AsString;
           Op2 := QueryRegra.FieldbyName('VALOROP2').AsString;
           Op3 := QueryRegra.FieldbyName('VALOROP3').AsString;
       end;

       if Op1 = '' then
          Op1 := '0';
       if Op2 = '' then
          Op2 := '0';
       if Op3 = '' then
          Op3 := '0';

       FResult := 'VERDADEIRO';
       if (Op1 = '-1') and (Op2 = '-1') and (Op3 = '-1') then
          FResult := 'FALSO'
       else if (Op1 = '0') and (Op2 = '0') and (Op3 = '0') then
            FResult := 'FALSO';

       SetVariavel(NomeVar1,Op1,NomeVar1);
       SetVariavel(NomeVar2,Op2,NomeVar2);
       SetVariavel(NomeVar3,Op3,NomeVar3);
   end;
end;

//******************************************************************************
Function TRegra.VEROPCONTRIB(formula:String) : String;
Var
   FormulaAux, NumContrib, vDataIni, vDataFim, vSql : String;
   vOpcao, i : integer;
begin
   FormulaAux := Copy(formula,14,length(formula));
   FormulaAux := Copy(FormulaAux,1,Length(FormulaAux)-1);

   i := pos(',',FormulaAux);
   NumContrib := Copy(FormulaAux,1,i-1);
   NumContrib := pegavalor(NumContrib);
   FormulaAux := Copy(FormulaAux,i+1,length(FormulaAux));

   i := pos(',',FormulaAux);
   vDataIni := Copy(FormulaAux,1,i-1);
   vDataIni := pegavalor(vDataIni);
   vDataIni := DataParaMes(vDataIni,0,'I');
   FormulaAux := Copy(FormulaAux,i+1,length(FormulaAux));

   i := pos(',',FormulaAux);
   if i > 0 Then
      vDataFim := Copy(FormulaAux,1,i-1)
   else
      vDataFim := FormulaAux;
   vDataFim := pegavalor(vDataFim);
   vDataFim := DataParaMes(vDataFim,0,'I');

   if (vDataFim = '') and (vDataIni = '') then begin
      try
         QueryIn.FieldbyName('IDPESSOA').AsString;
      except
          MsgDlgRegra('Campo IDPESSOA necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
          Exit;
      end;

      vSql := 'SELECT '+RuleNumber+' AS IDREGRA, IDPESSOA, VALORBASE1, VALORBASE2, VALORBASE3, '+
              'DECODE(FLGCOBRA,0,''NAO'',1,''SIM'') SIT FROM CONTRIBPREVPARTP '+
              'WHERE (IDPESSOA = '+QueryIn.FieldbyName('idpessoa').AsString+') AND '+
              '(IDCONTRIBUICAO = '+NumContrib+')';
      QueryRegra.Close;
      QueryRegra.Sql.clear;
      QueryRegra.Sql.add(vSql);
      QueryRegra.Open;
      if QueryRegra.IsEmpty then begin
         Result := 'False';
      end else begin
          if QueryRegra.FieldbyName('SIT').AsString = 'NAO' then
             Result := 'NAO'
          else
             Result := 'True';
      end;
      Exit;
   end;
   vOpcao := 0;
   FormulaAux := Copy(FormulaAux,i+1,length(FormulaAux));
   if FormulaAux <> '' Then begin
      try
         vOpcao := StrtoInt(pegavalor(FormulaAux));
      except
            vOpcao := 0;
      end;
   end;

   if (vOpcao > 3) or (vOpcao < 0) Then
      vOpcao := 0;

   try
       QueryIn.FieldbyName('IDPESSOA').AsString;
   except
          MsgDlgRegra('Campo IDPESSOA necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
          Exit;
   end;

   vSql := 'SELECT '+RuleNumber+' AS IDREGRA, IDCONTRIBUICAO, VALOROP1, VALOROP2, VALOROP3 FROM HSTCONTRIBPREV WHERE '+
           '(IDPESSOA = '+QueryIn.FieldbyName('idpessoa').AsString+') AND '+
           '(IDCONTRIBUICAO = '+NumContrib+') AND (MESREFERENCIA >= '''+vDataIni+''') AND '+
           '(MESREFERENCIA <= '''+vDataFim+''')';
   QueryRegra.Close;
   QueryRegra.Sql.clear;
   QueryRegra.Sql.add(vSql);
   QueryRegra.Open;

   if QueryRegra.IsEmpty then
      Result := 'False'
   else begin
        Result := 'False';
        while not QueryRegra.Eof do begin
              if vOpcao = 0 then begin
                  if (QueryRegra.FieldbyName('VALOROP1').AsFloat > 0) or (QueryRegra.FieldbyName('VALOROP2').AsFloat > 0) or
                     (QueryRegra.FieldbyName('VALOROP3').AsFloat > 0) Then
                     Result := 'True'
              end else begin
                  if QueryRegra.Fields[vOpcao].AsFloat > 0 Then
                     Result := 'True';
              end;
              QueryRegra.Next;
        end;
   end;
end;

function TRegra.TrocaCaracter(Texto:string;De,Para:char):string;
var
  Posic : byte;
begin
  repeat
    Posic := pos(De,Texto);
    if Posic > 0 then
      Texto[Posic]:=Para;
  until (Posic = 0);
  TrocaCaracter:=Texto;
end;


//******************************************************************************
// Formula:
Function TRegra.SALCONTRIB(formula:String) : String;
Type
  TFlagSRB = Record
               Tipo:Integer;
             End;
var
  FormulaAux, vSql, vData : String;
  TabFlgSRB :Array [0..9] Of TFlagSRB;
  Lin, I : LongInt;
  vSal : Real;
  TemQuatro : Boolean;
begin
//------------------------------------------------------------------------------
// Decodifica a Formula
  FormulaAux := Copy(Formula,12,Length(Formula));
  FormulaAux := Copy(FormulaAux,1,Length(FormulaAux)-1);
  FillChar(TabFlgSRB,SizeOf(TabFlgSRB),#0);
// Incia tabela de SRB
  For I := 0 To 9 Do
    TabFlgSRB[i].Tipo := -1;

// Guarda Data
  I := Pos(',',FormulaAux);
  vData := Copy(FormulaAux,1,I-1);
  vData := PegaValor(vData);
  vData := DataParaMes(vData,0,'I');

// Guarda Flags SRB
  I := Pos('{',FormulaAux);
  If I > 0 Then Begin
    FormulaAux := Copy(FormulaAux,I+1,Length(FormulaAux));
    I := Pos('}',FormulaAux);
    FormulaAux := Copy(FormulaAux,1,I-1);
    Lin := 0;
    Repeat
      I := Pos(',',FormulaAux);
      If I > 0 then begin
        TabFlgSRB[Lin].Tipo := StrtoInt(Copy(FormulaAux,1,i-1));
        FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux));
      End Else Begin
        TabFlgSRB[Lin].Tipo := StrtoInt(FormulaAux);
      End;
      Inc(Lin);
    Until i = 0;
  End;//If

// Fim da decodificacao da Formula
//------------------------------------------------------------------------------

// Monta linha com os Flag SRB
  vSql := '';
  for i := 0 to 9 do begin
    if TabFlgSRB[i].Tipo > -1 then
      vSql := vSql + InttoStr(TabFlgSRB[i].Tipo)+',';
  end;
  if vSql <> '' then
    vSql := ' AND H.FLGSRB IN ('+Copy(vSql,1,Length(vSql)-1)+')';

// Testa campos obrigatórios
  try
    QueryIn.FieldbyName('IDPESSOA').AsString;
  except
    MsgDlgRegra('Campo IDPESSOA necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);

    Exit;
  end;

// Monta e abre consulta dos salarios
  vSql := 'SELECT '+RuleNumber+' AS IDREGRA, H.MES,H.VALORPROVENTO,H.FLGSRB,H.IDRUBRICA FROM HISTRUBSAL H WHERE (H.IDPESSOA  = '+
           fQueryIn.FieldbyName('IDPESSOA').AsString+') AND (H.MES='''+vData+
           ''') AND (SUBSTR(H.MES,6,2) < TO_CHAR(13)) '+VSQL+' ORDER BY H.FLGSRB DESC';

  with queryregraaux do begin
    close;
    sql.clear;
    sql.add(vSql);
    open;
  end;

  vSal := 0;
  TemQuatro := False;

// Varre salarios
  while not QueryRegraAux.Eof do begin

    vSal := vSal + QueryRegraAux.FieldByName('VALORPROVENTO').asFloat;
    
    Queryregraaux.Next;
  end;

  Result := FloattoStr(vSal);
end;

{******************************************************************************}
{ Formula, Retorna o Menor de uma Lista de Numeros                             }
{------------------------------------------------------------------------------}
Function TRegra.MINIMO(formula:String) : String;
Type
  Valor = Record
            Tipo: Real;
          End;
Var
  TbValor : Array [0..100] Of Valor;
  vVal, FormulaAux : String;
  Z, I : LongInt;
  Menor  : Real;
Begin

  {----------------------------------------------------------------------------}
  { DECODIFICA FÓRMULA                                                         }

  { Retira Nome da Formula }
  FormulaAux := Copy(Formula,8,Length(Formula));
  FormulaAux := Copy(FormulaAux,1,Length(FormulaAux)-1);

  { Inicia vetor com o menor valor possivel }
  For I := 0 To 100 Do
    TbValor[I].Tipo := -1000;

  { Guarda Valores }
  Z := 0;
  Repeat
    I := Pos(',',FormulaAux);

    If I = 0 Then
      I := Length(FormulaAux)+1;        

    vVal := Copy(FormulaAux,1,I-1);
    vVal := PegaValor(vVal);

    Try
      TbValor[Z].Tipo := StrtoFloat(vVal);
    Except
      Z := Z - 1;
    End;

    Inc(Z);
    FormulaAux := Copy(FormulaAux,I+1,Length(FormulaAux))

  Until FormulaAux = '';

  { Le todos compara e guada o menor de cada comparação }
  Menor := TbValor[0].Tipo;
  For I := 0 To 100 Do Begin
    If TbValor[i].Tipo = -1000 Then
      Break;
    If TbValor[i].Tipo < Menor Then
      Menor := TbValor[i].Tipo;
  End;

  { Seta Resultado }
  Result := FloatToStr(Menor);
end;

{******************************************************************************}
{ Formula, Retorna o Maior de uma Lista de Numeros                             }
{------------------------------------------------------------------------------}
Function TRegra.MAXIMO(Formula:String) : String;
Type
  Valor = Record
            Tipo: Real;
          End;
Var
  TbValor :array [0..100] Of Valor;
  vVal, FormulaAux : String;
  Z, I : LongInt;
  Maior : Real;
Begin
  {----------------------------------------------------------------------------}
  { DECODIFICA FÓRMULA                                                         }

  { Retira Nome da Formula }
  FormulaAux := Copy(formula,8,length(formula));
  FormulaAux := Copy(FormulaAux,1,Length(FormulaAux)-1);

  { Inicia vetor }
  For I := 0 To 100 Do
    TbValor[i].Tipo := 0;

  { Guarda Valores }
  Z := 1;
  Repeat

    I := Pos(',',FormulaAux);

    If I = 0 Then
      I := Length(FormulaAux)+1;        

    vVal := Copy(FormulaAux,1,i-1);
    vVal := PegaValor(vVal);

    Try
      TbValor[Z].Tipo := StrToFloat(vVal);
    Except
      Z := Z - 1;
    End;

    Inc(Z);
    FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux))

  Until FormulaAux = '';

  { Le todos compara e guada o Maior de cada comparação }
  Maior := 0;
  For I := 0 To 100 Do Begin
    If TbValor[i].Tipo > Maior Then
      Maior := TbValor[i].Tipo;
  End;

  { Seta Resultado }
  Result := FloatToStr(Maior);
End;

Function TRegra.Dias360(vDtMenor, vDtMaior : TDateTime; Tipo : LongInt) : Real;
var
   vDiaMaior, vDiaMenor, vMesMaior, vMesMenor,
   vAnoMaior, vAnoMenor,
   vAno, vMes, vDia : LongInt;
begin
     //Esta formula equivale a formula DIAS360 do excel.
     //Se Tipo = 0 (False ou Omitido) Metodo US (NASD) Americano, Se Tipo = 1 (True) Metodo Europeu
     vDiaMaior := StrtoInt(Copy(DatetoStr(vDtMaior),1,2));
     vMesMaior := StrtoInt(Copy(DatetoStr(vDtMaior),4,2));
     vAnoMaior := StrtoInt(Copy(DatetoStr(vDtMaior),7,4));

     vDiaMenor := StrtoInt(Copy(DatetoStr(vDtMenor),1,2));
     vMesMenor := StrtoInt(Copy(DatetoStr(vDtMenor),4,2));
     vAnoMenor := StrtoInt(Copy(DatetoStr(vDtMenor),7,4));

     Case Tipo of
          0 : begin
                   // Se a Data Menor for dia 31 de um mes ela se torna igual ao dia 30 do mesmo mes
                   // Se a Data Maior for 31 e a Data Menor for menor que 30 de um mes, a data maior
                   // torna-se igual ao dia primeiro do proximo mes e a data maior torna-se o trigesimo
                   // dia do mesmo mes
                   if vDiaMenor = 31 then
                      vDiaMenor := 30;

                   if (vDiaMaior = 31) and (vDiaMenor < 30) then begin
                      vDiaMaior := 1;
                      vMesMaior := vMesMaior + 1;
                      if vMesMaior = 13 then begin
                         vMesMaior := 1;
                         vAnoMaior := vAnoMaior + 1;
                      end;
                   end else begin
                       if vDiaMaior = 31 then
                          vDiaMaior := 30;
                   end;
              end;
          1 : begin
                   if vDiaMaior = 31 then
                      vDiaMaior := 30;
                   if vDiaMenor = 31 then
                      vDiaMenor := 30;
              end;
          else
              begin
                   if vDiaMaior = 31 then
                      vDiaMaior := 30;
                   if vDiaMenor = 31 then
                      vDiaMenor := 30;
              end;
     End;

     // Faz os Tratamentos de data
     if (vDiaMaior = 29) and (vMesMaior = 2) then
        vDiaMaior := 30;
     if (vDiaMenor = 29) and (vMesMenor = 2) then
        vDiaMenor := 30;
     if vDiaMaior > 30 then
        vDiaMaior := 30;
     if vDiaMenor > 30 then
        vDiaMenor := 30;

     if (vDiaMaior = 28) and (vMesMaior = 2) then begin
        try
           StrtoDate('29/02/'+InttoStr(vAnoMaior));
        except
              vDiaMaior := 30;
        end;
     end;

     if (vDiaMenor = 28) and (vMesMenor = 2) then begin
        try
           StrtoDate('29/02/'+InttoStr(vAnoMenor));
        except
              vDiaMenor := 30;
        end;
     end;

     vAno := vAnoMaior - vAnoMenor;
     vMes := vMesMaior - vMesMenor;
     vDia := vDiaMaior - vDiaMenor;

     if vDia < 0 then begin
        vDia := 30 + vDia;
        vMes := vMes - 1;
     end;

     if vMes < 0 then begin
        vMes := 12 + vMes;
        vAno := vAno - 1;
     end;

     Result := ((vAno * 360) + (vMes * 30) + vDia);
end;


{******************************************************************************}
{ Formula DIAINICIAL                                                           }
{   Retorna Data Alterada para 1º Dia, 01/Mes/Ano                              }
{------------------------------------------------------------------------------}
Function TRegra.DIAINICIAL(Formula : String) : String;
var
   vData, FormulaAux, wDia, wMes, wAno : String;
   vTipo, I : LongInt;
Begin
  {----------------------------------------------------------------------------}
  { DECODIFICA FÓRMULA                                                         }
  { Retira Nome da Formula }
  FormulaAux := Copy(Formula,  12,Length(Formula));
  FormulaAux := Copy(FormulaAux,1,Length(FormulaAux)-1);
  vTipo := 0;

  { Pega Data a Processar }
  i := Pos(',',FormulaAux);
  If i = 0 Then                        { Não possui parametro de tipo }
    vData := PegaValor(FormulaAux)

  Else begin                           { Possui parametro de tipo     }
    vData := Copy(FormulaAux,1,i-1);
    vData := PegaValor(vData);

    { Pega Tipo de Processameno   }
    { 0/Nulo - Mes Corrido,       }
    { 1      - Mes Comercial      }
    FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux));
    vTipo := StrtoInt(PegaValor(FormulaAux));
  End;

  { FIM DA DECODIFICAÇÃO DA FÓRMULA                                            }
  {----------------------------------------------------------------------------}

  { Desmembra a Data de Paramtero }
  wDia := Copy(vData,1,2);
  wMes := Copy(vData,4,2);
  wAno := Copy(vData,7,4);

//  Result := IntToStr(DiasIni(StrtoDate(vData),vTipo));
  Result := '01/'+wMes+'/'+wAno;
end;


{******************************************************************************}
{ Funcao DiasIni  (DESCONTINUADA)                                              }
{   Retorna                                                                    }
{------------------------------------------------------------------------------}
Function TRegra.DiasIni(Data : TDateTime; Tipo : LongInt) : LongInt;
Var
  vDtAux : TDateTime;
  vUltDia, vDia, vMes, vMesAux, vAnoAux, vAno : LongInt;
begin // Se Tipo = 0 Mes Corrido, Se Tipo = 1 Mes Comercial

  Result := -1;
  { Desmembra a Data de Parametro }
  vMes := StrtoInt(Copy(DatetoStr(Data),4,2));
  vAno := StrtoInt(Copy(DatetoStr(Data),7,4));
  vDia := StrtoInt(Copy(DatetoStr(Data),1,2));
  {}
  vMesAux := vMes + 1;
  vAnoAux := vAno;
  if vMesAux > 12 then begin
    vMesAux := 1;
    vAnoAux := vAno + 1;
  end;

  { Pega o primeiro dia do Proximo mes e diminui 1, achando o ultimo do mês de }
  { processo.                                                                  }
  vDtAux := StrToDate('01/'+InttoStr(vMesAux)+'/'+InttoStr(vAnoAux))-1;
  vUltDia := StrtoInt(Copy(DatetoStr(vDtAux),1,2));

  {}
  Case Tipo Of
    0 : Result := vUltDia - vDia + 1;
    1 : Begin
           Result := 30 - vDia + 1;
           if Result = 0 then
             Result := 1;
        End;
  End;
End;

{******************************************************************************}
{ Formula DIAFINAL                                                             }
{   Retorna Data Alterada para Ultimo Dia, 30ou31/Mes/Ano                      }
{------------------------------------------------------------------------------}
Function TRegra.DIAFINAL(Formula : String) : String;
var
  vData, FormulaAux, wDia, wMes, wAno : String;
  vTipo, I: LongInt;
begin

  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }
  { Retira Nome da Formula }
  FormulaAux := Copy(Formula,  10,Length(Formula));
  FormulaAux := Copy(FormulaAux,1,Length(FormulaAux)-1);

  vTipo := 0;

  { Pega Data a Processar }
  I := Pos(',',FormulaAux);
  If I = 0 Then                        { Não possui parametro de tipo }
    vData := PegaValor(FormulaAux)
  Else Begin
    vData := Copy(FormulaAux,1,I-1);   { Possui parametro de tipo     }
    vData := PegaValor(vData);

    { Pega Tipo de Processameno      }
    { 0/Nulo - Mes Corrido,          }
    { 1      - Mes Comercial 30 Dias }
    FormulaAux := Copy(FormulaAux,I+1,Length(FormulaAux));
    vTipo := StrtoInt(PegaValor(FormulaAux));
  End;

  { Fim da Decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Desmembra a Data de Paramtero }
  wDia := Copy(vData,1,2);
  wMes := Copy(vData,4,2);
  wAno := Copy(vData,7,4);

  { Monta Resultado usando a Funcao DiasFim }
  Result := InttoStr(DiasFim(StrtoDate(vData),vTipo))+'/'+wMes+'/'+wAno;
End;


{******************************************************************************}
{ Funcao DiasFim                                                               }
{   Retorna                                                                    }
{------------------------------------------------------------------------------}
Function TRegra.DiasFim(Data : TDateTime; Tipo : LongInt) : LongInt;
Var
  vDtAux : TDateTime;
  vUltDia, vDia, vMes, vMesAux, vAnoAux, vAno : LongInt;
Begin
  Result := 30;
  { Muda Formato de Data }
  FormatoData     := ShortDateFormat;
  ShortDateFormat := 'dd/mm/yyyy';

  { Desmembra a Data de Paramtero }
  vMes := StrtoInt(Copy(DatetoStr(Data),4,2)) ;
  vAno := StrtoInt(Copy(DatetoStr(Data),7,4));
  vDia := StrtoInt(Copy(DatetoStr(Data),1,2));

  ShortDateFormat := FormatoData;

  { }
  vMesAux := vMes + 1;
  vAnoAux := vAno;
  If vMesAux > 12 Then Begin
    vMesAux := 1;
    vAnoAux := vAno + 1;
  End;

  { Pega o primeiro dia do Proximo mes e diminui 1, achando o ultimo do mês de }
  { processo.                                                                  }
  vDtAux := StrtoDate('01/'+InttoStr(vMesAux)+'/'+InttoStr(vAnoAux))-1;
  vUltDia := StrtoInt(Copy(DatetoStr(vDtAux),1,2));

  { Caso dias corridos ou Comerciais }
  { 0/Nulo - Mes Corrido,            }
  { 1      - Mes Comercial 30 Dias   }
  Case Tipo Of
    0 : Result := vUltDia;
    1 : Begin
          Result := vUltDia;
          If (vMes = 2) And (vDia = 29) Then
            Result := 30;
          If (vUltDia = 28) And (vDia = 28) And (vMes = 2) Then
            Result := 30;
          If vUltDia > 30 Then
            Result := 30;
        End;
  End;
End;

{******************************************************************************}
{ Fórmula DIASINICIAIS                                                         }
{   Retorna Numero de dias do dia da data de referencia até o final do mês,    }
{   respeitando o segundo parametro, mês corrido ou comercial                  }
{------------------------------------------------------------------------------}
Function TRegra.DIASINICIAIS(Formula : String) : String;
Var
  vData, FormulaAux : String;
  vTipo, i : LongInt;
  vDtAux : TDateTime;
Begin
  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }

  { Retira Nome da Formula }
  FormulaAux := Copy(Formula,14,length(Formula));
  FormulaAux := Copy(FormulaAux,1,Length(FormulaAux)-1);

  { Pega o flag de tipo de data, 0 Corrido (default) - 1 Comercial }
  vTipo := 0;
  I := Pos(',',FormulaAux);

  { Pega a Data ou a Data e o tipo de data caso não tenha encontrado }
  If I = 0 Then Begin
    vData := PegaValor(FormulaAux)
  End Else begin
    vData := Copy(FormulaAux,1,i-1);
    vData := PegaValor(vData);

    FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux));
    vTipo := StrtoInt(PegaValor(FormulaAux));
  End;
  { Fim da Decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Testa a validade da data }
  Try
    vDtAux := StrToDate(vData);
  Except
    On E:Exception do Begin
       MsgDlgRegra('Data de entrada da fórmula DIASINICIAIS inválida! ',
              'Regra - Erro',mterror,[mbOk],0);
     FError := True;
     SairDaRegra := True;
     Exit;
    End;
  End;

  { Chama função que computa Resultado }
  Result := InttoStr(DiasIni(StrtoDate(vData),vTipo));
End;


{******************************************************************************}
{ Fórmula DIASFINAIS                                                           }
{   Retorna Numero de dias do inicio do mês da data de referencia até o dia da }
{   data, respeitando o segundo parametro, mês corrido ou comercial            }
{------------------------------------------------------------------------------}
Function TRegra.DIASFINAIS(Formula:String): String;
Var
  sDia, vData, FormulaAux : String;
  vTipo, I : LongInt;
  vDtAux : TDateTime;
  vUltDia, vDia, vMes, vMesAux, vAnoAux, vAno : LongInt;
Begin
  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }

  { Retira Nome da Formula }
  FormulaAux := Copy(formula,12,length(formula));
  FormulaAux := Copy(FormulaAux,1,Length(FormulaAux)-1);

  { Pega o flag de tipo de data, 0 Corrido (default) - 1 Comercial }
  vTipo := 0;
  I := Pos(',',FormulaAux);

  { Pega a Data ou a Data e o tipo de data caso não tenha encontrado }
  If I = 0 Then Begin
    vData := PegaValor(FormulaAux)
  End Else Begin
    vData := Copy(FormulaAux,1,i-1);
    vData := PegaValor(vData);

    FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux));
    vTipo := StrToInt(PegaValor(FormulaAux));
  End;
  { Fim da Decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Testa a validade da data }
  Try
    vDtAux := StrToDate(vData);
  Except
    On E:Exception do Begin
       MsgDlgRegra('Data de entrada da fórmula DIASFINAIS inválida! ',
              'Regra - Erro',mterror,[mbOk],0);
     FError := True;
     SairDaRegra := True;
     Exit;
    End;
  End;


  Result := '30';
  { Desmembra Data }
  vMes := StrtoInt(Copy(vData,4,2));
  vAno := StrtoInt(Copy(vData,7,4));
  vDia := StrtoInt(Copy(vData,1,2));

  { Variaveis de auxilio }
  vMesAux := vMes + 1;
  vAnoAux := vAno;
  If vMesAux > 12 then begin
    vMesAux := 1;
    vAnoAux := vAno + 1;
  End;

  vDtAux := StrtoDate('01/'+InttoStr(vMesAux)+'/'+InttoStr(vAnoAux))-1;
  vUltDia := StrtoInt(Copy(DatetoStr(vDtAux),1,2));

  { Gera Resultado }
  Case vTipo Of
    { Sendo dias corridos, retorna o próprio dia }
    0 : Result := IntToStr(vDia);

    { Não sendo dia corrido }
    1 : Begin
          Result := IntToStr(vDia);
          { Sendo Fevereiro e dia 29, retorna 30 pois usa mês comercial }
          If (vMes = 2) And (vDia = 29) Then
            Result := '30';

          { Sendo Fevereiro e dia 28 e ultimo dia é 28, retorna 30 pois usa mês comercial }
          If (vUltDia = 28) And (vDia = 28) And (vMes = 2) Then
            Result := '30';

          { Sendo maior que dia 30, retorna 30 pois usa mês comercial }
          If VDia > 30 Then
            Result := '30';
        End;
  End;

  { Chamada Antiga }
// Result := InttoStr(DiasFim(StrtoDate(vData),vTipo));

End;

Function TRegra.FILTRAINSS(formula:string):String;
var
   vAux, FormulaAux, Vetor, Opc1 : String;
   Opcao1, vPos, i, Linha : LongInt;
begin
    FormulaAux := copy(formula,12,length(formula)-8);
    FormulaAux := Copy(FormulaAux, 1, Length(FormulaAux)-1);
    fillchar(TabSalAux,sizeof(TabSalAux),#0);

    i := pos(',',FormulaAux);
    Vetor := Copy(FormulaAux,1,i-1);
    Vetor := pegavalor(Vetor);
    FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux));

    Opc1 := FormulaAux;
    Opc1 := pegavalor(Opc1);
    try
       Opcao1 := StrtoInt(Opc1);
    except
       Opcao1 := 700;
    end;

    Linha := 1;
    vAux := '';
    vPos := 1;
    for i := 1 to Length(Vetor) do begin
        if Copy(Vetor,i,1) <> ';' then begin
           if Copy(Vetor,i,1) <> '|' then begin
              vAux := vAux + Copy(Vetor,i,1);
           end else begin
               Case vPos of
                    1 : TabSalAux[Linha].Mes := vAux;
                    2 : TabSalAux[Linha].Salario := StrtoFloat(vAux);
                    3 : TabSalAux[Linha].Teto := StrtoFloat(vAux);
                    4 : TabSalAux[Linha].Tipo := StrtoInt(vAux);
               end;
               vAux := '';
               Inc(vPos);
               if vPos = 5 then
                  vPos := 1;
           end;
        end else begin
            vAux := '';
            Inc(Linha);
        end;
    end;

    for i := 1 to 700 do begin
        if i > Opcao1 then begin
           TabSalAux[i].Mes := '';
           TabSalAux[i].Salario := 0;
           TabSalAux[i].Teto := 0;
           TabSalAux[i].Tipo := 0;
        end;
    end;

    Result := '';
    for i := 1 to 700 do begin
        if TabSalAux[i].Mes <> '' then begin
           Result := Result +
                     TabSalAux[i].Mes+'|'+FloattoStr(TabSalAux[i].Salario)+'|'+
                     FloattoStr(TabSalAux[i].Teto)+'|'+InttoStr(TabSalAux[i].Tipo)+'|;'
        end;
    end;
    Result := Copy(Result,1,Length(Result)-1);
end;


Function TRegra.OPBENEF(formula:string):String;
var
   NomeV1, NomeV2, NomeV3, Op1, Op2, Op3, vData, vAux,
   vSql, FormulaAux : String;
   i, vBenef : LongInt;
begin
     FormulaAux := copy(formula,9,length(formula));
     FormulaAux := Copy(FormulaAux, 1, Length(FormulaAux)-1);

     i := Pos(',',FormulaAux);
     vAux := Copy(FormulaAux,1,i-1);
     FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux));
     try
        vBenef := StrtoInt(PegaValor(vAux));
     except
           vBenef := 0;
     end;
     i := Pos(',',FormulaAux);
     vAux := Copy(FormulaAux,1,i-1);
     vData := PegaValor(vAux);
     vData := DataParaMes(vData,0,'I');
     FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux));

     i := Pos(',',FormulaAux);
     vAux := Copy(FormulaAux,1,i-1);
     NomeV1 := vAux;
     if Copy(vAux,1,1) = '@' then
        NomeV1 := Copy(vAux,2,Length(vAux));
     FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux));

     i := Pos(',',FormulaAux);
     vAux := Copy(FormulaAux,1,i-1);
     NomeV2 := vAux;
     if Copy(vAux,1,1) = '@' then
        NomeV2 := Copy(vAux,2,Length(vAux));
     FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux));

     NomeV3 := FormulaAux;
     if Copy(FormulaAux,1,1) = '@' then
        NomeV3 := Copy(FormulaAux,2,Length(FormulaAux));

     if vData = '' then begin  //Pesquisa ATUAL
        try
           QueryIn.FieldbyName('IDPESSOA').AsString;
        except
              MsgDlgRegra('Campo IDPESSOA necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
              Exit;
        end;

        vSql := 'SELECT '+RuleNumber+' AS IDREGRA, IDPESSOA, VALORBASE1, VALORBASE2, VALORBASE3 '+
                ' FROM BENEFPLANOPART WHERE '+
                '(IDPESSOA = '+QueryIn.FieldbyName('IDPESSOA').AsString+') AND '+
                '(IDBENEFICIO = '+InttoStr(vBenef)+')';
        QueryRegra.Close;
        QueryRegra.Sql.clear;
        QueryRegra.Sql.add(vSql);
        QueryRegra.Open;

        if QueryRegra.IsEmpty then begin
           Op1 := '-1';
           Op2 := '-1';
           Op3 := '-1';
        end else begin
            Op1 := QueryRegra.FieldbyName('VALORBASE1').AsString;
            Op2 := QueryRegra.FieldbyName('VALORBASE2').AsString;
            Op3 := QueryRegra.FieldbyName('VALORBASE3').AsString;
        end;

        if Op1 = '' then
           Op1 := '0';
        if Op2 = '' then
           Op2 := '0';
        if Op3 = '' then
           Op3 := '0';

        SetVariavel(NomeV1,Op1,NomeV1);
        SetVariavel(NomeV2,Op2,NomeV2);
        SetVariavel(NomeV3,Op3,NomeV3);
        Result := 'VERDADEIRO';
        if (Op1 = '-1') and (Op2 = '-1') and (Op3 = '-1') then
           Result := 'FALSO'
        else if (Op1 = '0') and (Op2 = '0') and (Op3 = '0') then
             Result := 'FALSO';
        Exit;
     end else begin //Pesquisa pelo HISTORICO
         try
            QueryIn.FieldbyName('IDPESSOA').AsString;
         except
               MsgDlgRegra('Campo IDPESSOA necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
               Exit;
         end;

         vSql := 'SELECT '+RuleNumber+' AS IDREGRA, VALORBASE1, VALORBASE2, VALORBASE3, '+
                 '       VALOROP1, VALOROP2, VALOROP3 '+
                 'FROM HSTBENEFBFCIARIO WHERE '+
                 '(IDPESSOA = '+QueryIn.FieldbyName('idpessoa').AsString+') AND '+
                 '(IDBENEFICIO = '+InttoStr(vBenef)+') AND (MESREFERENCIA = '''+vData+''')';

         QueryRegra.Close;
         QueryRegra.Sql.clear;
         QueryRegra.Sql.add(vSql);
         QueryRegra.Open;

         if QueryRegra.IsEmpty then begin
            Op1 := '-1';
            Op2 := '-1';
            Op3 := '-1';
         end else begin
             Op1 := QueryRegra.FieldbyName('VALOROP1').AsString;
             Op2 := QueryRegra.FieldbyName('VALOROP2').AsString;
             Op3 := QueryRegra.FieldbyName('VALOROP3').AsString;
         end;

         if Op1 = '' then
            Op1 := '0';
         if Op2 = '' then
            Op2 := '0';
         if Op3 = '' then
            Op3 := '0';

         Result := 'VERDADEIRO';
         if (Op1 = '-1') and (Op2 = '-1') and (Op3 = '-1') then
            Result := 'FALSO'
         else if (Op1 = '0') and (Op2 = '0') and (Op3 = '0') then
              Result := 'FALSO';

         SetVariavel(NomeV1,Op1,NomeV1);
         SetVariavel(NomeV2,Op2,NomeV2);
         SetVariavel(NomeV3,Op3,NomeV3);
     end;
end;

Function TRegra.VLRRUBMES(Formula:string):String;
var
  sSQL, sCodRubrica, sAnoMes, sFormula,
  sIdPessJur, sIdPessoa
  , sIdTitular // SOL 212844 Kintana  2051020
  : String;
  I : Word;
begin

  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }
  sFormula := Copy(Formula,11,Length(Formula));
  sFormula := Copy(sFormula,1,Length(sFormula)-1);

  I := Pos(',',sFormula);
  If I <= 0 Then I := Length(sFormula) Else I := (I-1) ;
  sCodRubrica := Copy(sFormula,1,I);
  sCodRubrica := PegaValor(sCodRubrica);
  sFormula := Copy(sFormula,I+2,Length(sFormula));

  I := Pos(',',sFormula);
  If I <= 0 Then I := Length(sFormula) Else I := (I - 1) ;
  sAnoMes := sFormula;
  sAnoMes := PegaValor(sAnoMes);
  sAnoMes := DataParaMes(sAnoMes,0,'I');

  { Fim da decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Testa campos obrigatórios }
  If FQueryIn.FindField('IDPESSOA') = Nil Then Begin
    MsgDlgRegra('Campo IDPESSOA Necessário no SQL de entrada.',
                'Regra - Erro',mtError,[mbOk,mbHelp],0);
    FError := True;
    Exit;
  End Else If FQueryIn.FindField('IDPLANOPREV') = Nil Then Begin
    MsgDlgRegra('Campo IDPLANOPREV Necessário no SQL de entrada.',
                'Regra - Erro',mtError,[mbOk,mbHelp],0);
    FError := True;
    Exit;
  End Else If FQueryIn.FindField('IDPESSJUR') = Nil Then Begin
    MsgDlgRegra('Campo IDPESSJUR  Necessário no SQL de entrada.',
                'Regra - Erro',mtError,[mbOk,mbHelp],0);
    FError := True;
    Exit;
  End;
  // SOL 219903 KTN 2052118 - Comentado, pois deu impacto no preparo das contribuições
  { Else If FQueryIn.FindField('IDTITULAR') = Nil Then Begin // SOL 212844 Kintana  2051020
    MsgDlgRegra('Campo IDTITULAR  Necessário no SQL de entrada.',
                'Regra - Erro',mtError,[mbOk,mbHelp],0);
    FError := True;
    Exit;
  End;} // SOL 212844 Kintana  2051020

  { Guarda Valores }
  sIdPessJur   := FQueryIn.FieldByName('IDPESSJUR').AsString;
  sIdPessoa    := FQueryIn.FieldByName('IDPESSOA').AsString;
  sIdTitular   := FQueryIn.FieldByName('IDTITULAR').AsString; //  SOL 212844 Kintana  2051020
  Result       := '0';

  { Monta e executa Consulta }
  sSQL := 'SELECT '+
          RuleNumber+' AS IDREGRA, H.MES, '+
          '  DECODE(H.VALORPROVENTO, 0, H.VALORINFO, NULL, H.VALORINFO, H.VALORPROVENTO) VALORPROVENTO '+
          'FROM   '+
          '  HISTRUBSAL H '+
          'WHERE  '+
          '  (H.'+sCampoPesquisa+' = '+ sIdPessJur +') AND '+
          '  (H.IDPESSOA    = '+ sIdPessoa         +') AND '; // SOL 219617 Kintana 2051601
          if (sIdPessJur <> '1') then  // SOL 219617 Kintana 2051601 não filtrar o titular para empregados funcef.
             sSQL := sSQL + '  (H.IDTITULAR   = '+ sIdTitular        +') AND ';// SOL 212844 Kintana  2051020
  { Caso escolhido o mes seleciona, caso contrario busca o último }
  If Trim(sAnoMes) <> '' Then
    sSQL := sSQL + '  (H.MES         = '+ QuotedStr(sAnoMes)+') AND '
  Else
    sSQL := sSQL + '  (H.MES = (SELECT MAX(MES)    '+
                   '            FROM HISTRUBSAL HSTMAX '+
                   '            WHERE HSTMAX.IDPATRO   = H.IDPATRO  AND   '+
                   '                  HSTMAX.IDPESSOA  = H.IDPESSOA AND   '+
                   '                  HSTMAX.CODPROVDESC = H.CODPROVDESC)) AND ';


  sSQL := sSQL + '  (H.CODPROVDESC = '+QuotedStr(sCodRubrica)+')';

  If FazQuery(QueryRegraAux,sSQL) Then Begin
    { Gera Resultado }
    Result := QueryRegraAux.FieldbyName('VALORPROVENTO').AsString;
    If Result = '' Then result := '0';
  End;

end;

{******************************************************************************}
function TRegra.NUMOCORRUB(formula:string):String;
Type
    Valor = record
                  Tipo: String;
            end;
var
   vQtde, vSql, vAux, vDtMenor, vDtMaior, vReg,
   vFormula, sTipoPesquisa : String;
   TbValor :array [0..100] of Valor;
   Lin, i : LongInt;
begin
     sTipoPesquisa := 'R';

     vFormula := Copy(Formula,12,Length(Formula));
     vFormula := Copy(vFormula,1,Length(vFormula)-1);
     fillchar(TbValor,sizeof(TbValor),#0);

     i := Pos('[',vFormula);
     vAux := Copy(vFormula,i+1,Length(vFormula));

     i := Pos(']',vAux);
     vAux := Copy(vAux,1,i-1);

     Lin := 0;
     repeat
           i := Pos(',',vAux);
           if i = 0 then begin
              tbValor[Lin].Tipo := PegaValor(vAux);
              vAux := '';
           end else begin
                vReg := Copy(vAux,1,i-1);
                vReg := PegaValor(vReg);
                tbValor[Lin].Tipo := vReg;
                vAux := Copy(vAux,i+1,Length(vAux));
           end;
           Inc(Lin);
     until vAux = '';

     vAux := '';
     for i := 0 to 100 do
         if tbValor[i].Tipo <> '' then
            vAux := vAux +''''+tbValor[i].Tipo+''',';
     vAux := Copy(vAux,1,Length(vAux)-1);

     i := Pos(']',vFormula);

     vFormula := Copy(vFormula,i+1,Length(vFormula));
     i := Pos(',',vFormula);
     vDtMaior := Copy(vFormula,1,i-1);
     vDtMaior := PegaValor(vDtMaior);

     vFormula := Copy(vFormula,I+1,Length(vFormula));
     i := Pos(',',vFormula);
     If I = 0 Then I := Length(vFormula) Else I := (I-1); 
     vQtde := Copy(vFormula,1,I);
     vQtde := PegaValor(vQtde);

     vFormula := Copy(vFormula, I+2 ,Length(vFormula));
     I := Pos(',',vFormula);
     If I = 0 Then I := Length(vFormula) Else I := (I-1);
     sTipoPesquisa := Copy(vFormula,1,I);
     sTipoPesquisa := PegaValor(sTipoPesquisa);


     vDtMaior := DataParaMes(vDtMaior,0,'I');
     vDtMenor := subtrair(vDtMaior, StrtoInt(vQtde));


     try
        fQueryIn.FieldByName('IDPESSOA').AsString;
     except
          { Testa se mostra mensagem ou não }
           MsgDlgRegra('Campo IDPESSOA Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
           Exit;
     end;

     try
        fQueryIn.FieldByName('IDPESSJUR').AsString;
     except
           MsgDlgRegra('Campo IDPESSJUR Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
           Exit;
     end;
     If sTipoPesquisa = 'G' Then Begin
       vSql := 'SELECT '+
               '  COUNT(*) AS NUMMESES '+
               'FROM '+
               '  (SELECT '+
               '     DISTINCT H.MES '+
               '   FROM '+
               '     HISTRUBSAL H, PROVDESC P '+
               '   WHERE '+
               '     (H.IDPESSOA  = '+fQueryIn.FieldbyName('IDPESSOA').AsString+' ) AND '+
               '     (H.'+sCampoPesquisa+'   = '+fQueryIn.FieldbyName('IDPESSJUR').AsString+') AND '+
               '     (H.MES >= '''+vDtMenor+''') AND '+
               '     (H.MES < '''+vDtMaior+''')  AND '+
               '     (SUBSTR(H.MES,6,2) <> ''13'')  AND '+
               '     (P.IDGRUPORUBRICA IN ('+vAux+')   AND '+
               '     (H.IDRUBRICA = P.IDPROVENTO)))  ';
     End Else Begin
       vSql := 'SELECT COUNT(*) AS NUMMESES FROM (SELECT DISTINCT H.MES FROM HISTRUBSAL H WHERE '+
               '(H.IDPESSOA  = '+fQueryIn.FieldbyName('IDPESSOA').AsString+') AND (H.'+sCampoPesquisa+' = '+
               fQueryIn.FieldbyName('IDPESSJUR').AsString+') AND (H.MES >= '''+
               vDtMenor+''') AND (H.MES <= '''+vDtMaior+''') AND (SUBSTR(H.MES,6,2) <> ''13'') AND '+
               '(CODPROVDESC IN ('+vAux+')))';
     End;

     with QueryRegraAux do begin
          Close;
          Sql.Clear;          
          Sql.Add(vSql);
          Open;
     end;
     Result := QueryRegraAux.FieldbyName('NUMMESES').AsString;
end;


Function TRegra.MEDPERCRUB(Formula : String) : String;
Type
    Valor = record
                  Tipo: String;
             end;
var
   vSql, vReg, vRub, vDataMaior, vDataMenor, vQtde, vFormulaAux : String;
   Lin, i : LongInt;
   TbValor :array [0..100] of Valor;
   vPerc : Real;
begin
     vFormulaAux := Copy(Formula,12,Length(Formula));
     vFormulaAux := Copy(vFormulaAux,1,Length(vFormulaAux)-1);

     i := Pos(']',vFormulaAux);
     vRub := Copy(vFormulaAux,2,i-2);

     Lin := 0;
     repeat
           i := Pos(',',vRub);
           if i = 0 then begin
              tbValor[Lin].Tipo := PegaValor(vRub);
              vRub := '';
           end else begin
                vReg := Copy(vRub,1,i-1);
                vReg := PegaValor(vReg);
                tbValor[Lin].Tipo := vReg;
                vRub := Copy(vRub,i+1,Length(vRub));
           end;
           Inc(Lin);
     until vRub = '';

     vRub := '';
     for i := 0 to 100 do
         if tbValor[i].Tipo <> '' then
            vRub := vRub +''''+tbValor[i].Tipo+''',';
     vRub := Copy(vRub,1,Length(vRub)-1);

     i := Pos(']',vFormulaAux);
     vFormulaAux := Copy(vFormulaAux,i+1,Length(vFormulaAux));
     i := Pos(',',vFormulaAux);

     vDataMaior := Copy(vFormulaAux,1,i-1);
     vDataMaior := PegaValor(vDataMaior);
     vDataMaior := DataParaMes(vDataMaior,0,'I');

     vFormulaAux := Copy(vFormulaAux,i+1,Length(vFormulaAux));

     vQtde := vFormulaAux;
     vQtde := PegaValor(vQtde);
     vDataMenor := Subtrair(vDataMaior,StrtoInt(vQtde));

     try
        fQueryIn.FieldByName('IDPESSOA').AsString;
     except
           MsgDlgRegra('Campo IDPESSOA Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
           Exit;
     end;
     vSql := 'SELECT IDPESSOA, MES, PERCENTUAL, CODPROVDESC FROM HISTRUBSAL WHERE '+
             'IDPESSOA = '+fQueryIn.FieldByName('IDPESSOA').AsString+' AND '+
             'CODPROVDESC IN ('+vRub+') AND MES >= '''+vDataMenor+''' AND '+
             'MES <= '''+vDataMaior+''' ORDER BY MES, CODPROVDESC';

     with QueryRegraAux do begin
          Close;
          Sql.Clear;
          Sql.Add(vSql);
          Open;
     end;

     vPerc := 0;
     while not QueryRegraAux.Eof do begin
           vPerc := vPerc + QueryRegraAux.FieldbyName('PERCENTUAL').AsFloat;
           QueryRegraAux.Next;
     end;
     Result := FloattoStr(vPerc / StrtoInt(vQtde));
end;


function TRegra.VERCONCEDIDO(Formula : String) : String;
var
  sIdPessoa,
  vVar1, vVar2, Op1, Op2, vSql, Benef, vFormula : String;
  I : LongInt;
begin

  vFormula := Copy(Formula,14,Length(Formula));
  vFormula := Copy(vFormula,1,Length(vFormula)-1);

  i := Pos(',',vFormula);
  Benef := Copy(vFormula,1,i-1);
  Benef := PegaValor(Benef);
  vFormula := Copy(vFormula,i+1,Length(vFormula));

  i := Pos(',',vFormula);
  vVar1 := Copy(vFormula,1,i-1);
  if Copy(vVar1,1,1) = '@' then
     vVar1 := Copy(vVar1,2,Length(vVar1));
  vFormula := Copy(vFormula,i+1,Length(vFormula));

  I := Pos(',', vFormula);
  If I <= 0 Then I := ( Length( vFormula )+1 );

  vVar2 := Copy( vFormula, 1, (I-1) );
  if Copy(vVar2,1,1) = '@' then
    vVar2 := Copy(vVar2,2,Length(vVar2));
  vFormula := Copy(vFormula,i+1,Length(vFormula));

  sIdPessoa := '';

  I := Pos(',', vFormula);
  If I <= 0 Then I := ( Length( vFormula )+1 );

  If ( Trim( vFormula ) <> '' ) Then Begin
    sIdPessoa := Copy( vFormula, 1, (I-1) );
    sIdPessoa := PegaValor( sIdPessoa );
  End;

  try
     StrtoInt(Benef);
  except
     Benef := '0';
  end;

  try
     fQueryIn.FieldByName('IDPESSOA').AsString;
  except
        MsgDlgRegra('Campo IDPESSOA Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
        Exit;
  end;

  try
     fQueryIn.FieldByName('IDPESSJUR').AsString;
  except
        MsgDlgRegra('Campo IDPESSJUR Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
        Exit;
  end;

  vSql := 'SELECT VALORATUAL, DIBBENEFANT, DATAINICIO FROM BENEFBFCIARIO WHERE '+
          'IDPESSJUR = '+fQueryIn.FieldByName('IDPESSJUR').AsString+' AND '+
          'IDBENEFICIO = '+Benef;

  If ( Trim( sIdPessoa ) <> '' )
  Then vSQL := vSQL + ' AND IDPESSOA = '+ sIdPessoa
  Else vSQL := vSQL + ' AND IDPESSOA = '+ fQueryIn.FieldByName('IDPESSOA').AsString;

  vSQL := vSQL + ' ORDER BY DATAINICIO DESC ';

  with QueryRegraAux do begin
       Close;
       Sql.Clear;
       Sql.Add(vSql);
       Open;
  end;

  Result := 'FALSO';
  if QueryRegraAux.IsEmpty then begin
     Op1 := '';
     Op2 := '';
  end else begin
      Op1 := QueryRegraAux.FieldbyName('VALORATUAL').AsString;
      Op2 := QueryRegraAux.FieldbyName('DIBBENEFANT').AsString;
      Result := 'VERDADEIRO';
  end;
  SetVariavel(vVar1,Op1,vVar1);
  SetVariavel(vVar2,Op2,vVar2);

end; { TRegra.VERCONCEDIDO }

function TRegra.TEMPOPATRO(Formula : String) : String;
var
   vTipoCalculo, i : LongInt;
   vSql, vIdPatro, vTipo, vForma, vFormula : String;
   vAno, Tempo : Real;
begin
     //Se TIPO = 'A' (Acumulado - PADRÃO) Se TIPO = 'C' (Corrente) - Primeiro Registro somente
     //Se TIPOCALCULO = 0 (Dias Comerciais - PADRÃO) Se TIPOCALCULO = 1 (Dias Corridos)
     //Se FORMARESULTADO = 'D' Dias, = 'M' Meses (Padrão) , = 'A' Anos
     vFormula := Copy(Formula,12,Length(Formula));
     vFormula := Copy(vFormula, 1, Length(vFormula)-1);

     i := Pos(',',vFormula);
     vIdPatro := Copy(vFormula,1,i-1);
     vIdPatro := PegaValor(vIdPatro);

     If (Trim( vIdPatro ) = '') or (Trim( vIdPatro ) = '0') Then Begin
          vIdPatro := '';
     End Else Begin
       Try
          StrtoInt(vIdPatro);
       Except
          vIdPatro := '';
       End;
     End;

     vFormula := Copy(vFormula,i+1,Length(vFormula));

     i := Pos(',',vFormula);
     vTipo := Copy(vFormula,1,i-1);
     vTipo := UpperCase(PegaValor(vTipo));
     if vTipo = '' then
        vTipo := 'A';
     if (vTipo <> 'A') and (vTipo <> 'C') then
        vTipo := 'A';
     vFormula := Copy(vFormula,i+1,Length(vFormula));

     i := Pos(',',vFormula);
     try
        vTipoCalculo := StrtoInt(PegaValor(Copy(vFormula,1,i-1)));
     except
           vTipoCalculo := 0;
     end;
     if (vTipoCalculo < 0) or (vTipoCalculo > 1) then
        vTipoCalculo := 0;

     vFormula := Copy(vFormula,i+1,Length(vFormula));

     vForma := vFormula;
     vForma := UpperCase(PegaValor(vForma));
     if vForma = '' then
        vForma := 'M';
     if (vForma <> 'A') and (vForma <> 'M') and (vForma <> 'D') then
        vForma := 'M';

     try
        fQueryIn.FieldByName('IDPESSOA').AsString;
     except
           MsgDlgRegra('Campo IDPESSOA Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
           Exit;
     end;

     try
        fQueryIn.FieldByName('DATAREF').AsString;
     except
           MsgDlgRegra('Campo DATAREF Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
           Exit;
     end;

     vSql := 'SELECT DATAINICIO, '+
	     'DECODE(DATAFINAL, NULL, TO_DATE('''+fQueryIn.FieldByName('DATAREF').AsString+'''), DATAFINAL) AS DATAFINAL, '+
	     'DECODE(DATAFINAL, NULL, (TO_DATE('''+fQueryIn.FieldByName('DATAREF').AsString+''') - DATAINICIO), (DATAFINAL-DATAINICIO)) AS DIAS '+
             'FROM HISTFUNCPREV WHERE ';

     if (vIdPatro <> '') then
        vSql := vSql + 'IDPESSJUR = '+vIdPatro+' AND ';

     vSql := vSql + 'IDPESSOA = '+fQueryIn.FieldByName('IDPESSOA').AsString+
                    ' AND IDPESSJUR IS NOT NULL '+ { 26/01/2006 }
                    ' ORDER BY DATAINICIO, DATAFINAL';

     Tempo := 0;
     with QueryRegraAux do begin
          Close;
          Sql.Clear;
          Sql.Add(vSql);
          Open;
     end;

     vAno := 0;

     QueryRegraAux.First;
     while not QueryRegraAux.Eof do begin
           Case vTipoCalculo of
                0 : begin //Dias Comerciais
                          Tempo := Tempo + Dias360( QueryRegraAux.FieldbyName('DATAINICIO').AsDateTime,
                                                    QueryRegraAux.FieldbyName('DATAFINAL').AsDateTime, 1);
                    end;
                1 : begin //Dias Corridos
                          Tempo := Tempo + QueryRegraAux.FieldbyName('DIAS').AsInteger;
                          vAno := vAno + AnoBi( QueryRegraAux.FieldbyName('DATAINICIO').AsDateTime,
                                                QueryRegraAux.FieldbyName('DATAFINAL').AsDateTime);
                    end;
           End;
           if vTipo = 'C' then
              Break;
           QueryRegraAux.Next;
     end;

     if vTipoCalculo = 1 then
        vAno := vAno / QueryRegraAux.RecordCount;

     if vForma = 'M' then begin
        if vTipoCalculo = 0 then
           Tempo := Tempo / 30 //Dias360
        else
           Tempo := Tempo / (vAno/12); //Dias Corridos
     end;

     if vForma = 'A' then begin
        if vTipoCalculo = 0 then
           Tempo := Tempo / 360 //Dias360
        else
            Tempo := Tempo / vAno; //Dias Corridos
     end;
     Result := FloattoStr(Tempo);
end;

Function TRegra.AnoBi(vDtMenor, vDtMaior : TDateTime) : Real;
var
   vDtAux : TDateTime;
   Dias, Quant : LongInt;
begin
     if vDtMenor > vDtMaior then begin
        vDtAux := vDtMenor;
        vDtMenor := vDtMaior;
        vDtMaior := vDtAux;
     end;

     Quant := 0;
     Dias := 0;
     vDtAux := vDtMenor;
     while vDtMaior <> vDtAux do begin
           if (Copy(DatetoStr(vDtAux),1,2) = '29') and (Copy(DatetoStr(vDtAux),4,2) = '02') then
              Inc(Quant);
           Inc(Dias);
           vDtAux := vDtAux + 1;
     end;
     if (Quant = 0) and (Dias = 0) then
        Result := 0
     else
         Result := 365*(1+(Quant/Dias));
end;

function TRegra.TEMPOPLANO( Formula : String) : String;
var
   vFormula, vTipo, vDtIni, vDtFim, vSql : String;
   vAno, vDias : Real;
   vAfast, i : LongInt;
begin
     vFormula := Copy(Formula,12,Length(Formula));
     vFormula := Copy(vFormula,1,Length(vFormula)-1);

     i := Pos(',',vFormula);
     if i = 0 then
        i := Length(vFormula) + 1;

     vTipo := Copy(vFormula,1,i-1);
     vTipo := PegaValor(vTipo);
     if (vTipo <> 'A') and (vTipo <> 'M') and (vTipo <> 'D') then
        vTipo := 'M';

     vFormula := Copy(vFormula,i+1,Length(vFormula));
     if vFormula = '' then
        vAfast := 0
     else begin
          try
             vAfast := StrtoInt(PegaValor(vFormula));
          except
                vAfast := 0;
          end;
          if (vAfast <> 0) and (vAfast <> 1) then
             vAfast := 0;
     end;

     try
        fQueryIn.FieldByName('IDPESSOA').AsString;
     except
           MsgDlgRegra('Campo IDPESSOA Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
           Exit;
     end;

     try
        fQueryIn.FieldByName('DATAREF').AsString;
     except
           MsgDlgRegra('Campo DATAREF Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
           Exit;
     end;

     vSql := 'SELECT PP.IDPESSOA, PP.IDPESSJUR, PP.IDPLANOPREV, PP.INSCRICAODATA, '+
             'DECODE(PP.DATACANCELAMENTO,NULL,'+
             'TO_DATE('''+fQueryIn.FieldByName('DATAREF').AsString+''',''DD/MM/YYYY''),PP.DATACANCELAMENTO) AS DATACANCELAMENTO '+
             'FROM PARTPREVPLAN PP '+
             'WHERE (PP.IDPESSOA = '+fQueryIn.FieldByName('IDPESSOA').AsString+') AND '+
             //Wylliam Leite da Silva SOL: 176340 KINTANA: 1608819
             'PP.FLGDESATIVADO = 0 ';

     vSql := 'SELECT A.* FROM ('+vSql+') A WHERE (INSCRICAODATA <> DATACANCELAMENTO) '+
                    'ORDER BY IDPESSOA, INSCRICAODATA';

     with QueryRegraAux do begin
          Close;
          Sql.Clear;
          Sql.Add(vSql);
          Open;
     end;
     vDias := 0;
     vAno := 0;
     i := 0;
     while not QueryRegraAux.Eof do begin
           vDias := vDias + ( QueryRegraAux.Fieldbyname('DATACANCELAMENTO').AsDateTime -
                              QueryRegraAux.Fieldbyname('INSCRICAODATA').AsDateTime);
           vAno := vAno + AnoBi( QueryRegraAux.Fieldbyname('INSCRICAODATA').AsDateTime,
                                 QueryRegraAux.Fieldbyname('DATACANCELAMENTO').AsDateTime);
           QueryRegraAux.Next;
           Inc(i);
     end;

     Result := '0';
     if vDias = 0 then
        Result := '0'
     else begin
          vAno := vAno/i;
          Case vAfast of
               0 : begin
                        if vTipo = 'A' then
                           Result := FloattoStr((vDias/vAno));
                        if vTipo = 'M' then
                           Result := FloattoStr((vDias/(vAno/12)));
                        if vTipo = 'D' then
                           Result := FloattoStr(vDias);
                   end;
               1 : begin
                        if vTipo = 'A' then
                           Result := FloattoStr((vDias/vAno) + StrtoFloat(TempoAfast('TEMPOAFAST(,#A,#'+vTipo+')')));
                        if vTipo = 'M' then
                           Result := FloattoStr((vDias/(vAno/12)) + StrtoFloat(TempoAfast('TEMPOAFAST(,#A,#'+vTipo+')')));
                        if vTipo = 'D' then
                           Result := FloattoStr(vDias + StrtoFloat(TempoAfast('TEMPOAFAST(,#A,#'+vTipo+')')));
                   end;
          end;
     end;
end;

function TRegra.TpDadoCons(NomeTabGener, Campo : String) : String;
var
   vSql : String;
begin
     //A - Alfanumerico
     //D - Data
     //N - Numerico
     vSql := 'SELECT UPPER(SUBSTR(T.NOMETIPODADO,1,1)) AS TIPO FROM CAMPOTABGENER C, TIPODADO T '+
             'WHERE (C.CODTABELA = '''+NomeTabGener+''') AND (C.CODCAMPO = '''+Campo+''') AND '+
             '(C.IDTIPODADO = T.IDTIPODADO)';

     with QueryRegraAux do begin
          Close;
          Sql.Clear;
          Sql.Add(vSql);
          Open;
     end;

     If QueryRegraAux.IsEmpty Then Begin
       MsgDlgRegra('Campo "'+ Campo +'" não encontrado na Tabela Genérica "'+NomeTabGener+'"',
              'Regra - Erro',mterror,[mbOk],0);
       FError := True;
//       SairDaRegra := True;
       Exit;
     End;

     Result := QueryRegraAux.FieldbyName('TIPO').AsString;
end;


function TRegra.TEMPOAFAST(Formula : String) : String;
var
   vDtIni, vDtFim, vIdPatro, vTipo, vRes, vFormula, vSql : String;
   i : LongInt;
   vDias, vAno : Real;

begin
     //SELECT 1329070 AS IDPESSOA FROM DUAL (Refer)
     vFormula :=  Copy(Formula,12,Length(Formula));
     vFormula := Copy(vFormula,1,Length(vFormula)-1);

     i := Pos(',',vFormula);
     vIdPatro := Copy(vFormula,1,i-1);
     vIdPatro := PegaValor(vIdPatro);
     try
        StrtoInt(vIdPatro);
     except
           vIdPatro := '';
     end;
     vFormula := Copy(vFormula,i+1,Length(vFormula));

     i := Pos(',',vFormula);
     vTipo := Copy(vFormula,1,i-1);
     vTipo := PegaValor(vTipo);
     vFormula := Copy(vFormula,i+1,Length(vFormula));


     vRes := PegaValor(vFormula);
     if (vRes <> 'A') and (vRes <> 'M') and (vRes <> 'D') then
        vRes := 'A';

     if vTipo = '' then
        vTipo := 'A';
     if (vTipo <> 'A') and (vTipo <> 'C') then
        vTipo := 'A';

     try
        fQueryIn.FieldByName('IDPESSOA').AsString;
     except
           MsgDlgRegra('Campo IDPESSOA Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
           Exit;
     end;

     try
        fQueryIn.FieldByName('DATAREF').AsString;
     except
           MsgDlgRegra('Campo DATAREF Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
           Exit;
     end;

     vSql := 'SELECT EP.IDPESSOA, EP.IDPESSJUR, EP.DATAEVENTO, '+
             'DECODE(EP.DATAVOLTA,NULL, '''+fQueryIn.FieldByName('DATAREF').AsString+
             ''', TO_CHAR(EP.DATAVOLTA,''DD/MM/YYYY'')) AS DATAVOLTA, '+
             'EP.DATAEFETIVADO, S.TIPOSIT AS NOVO FROM EVENTOSPREV EP, '+
             '(SELECT IDSITFUNC, TIPOSIT FROM SITFUNC GROUP BY IDSITFUNC, TIPOSIT) S '+
             'WHERE (S.IDSITFUNC = EP.IDSITFUNCNOVO) AND (S.TIPOSIT = ''F'') AND '+
             '(EP.IDPESSOA = '+fQueryIn.FieldByName('IDPESSOA').AsString+') ';
     if vIdPatro <> '' then
        vSql := vSql + 'AND (EP.IDPESSJUR='+vIdPatro+') ';
     vSql := vSql + 'ORDER BY EP.IDPESSOA, EP.DATAEVENTO';

     with QueryRegraAux do begin
          Close;
          Sql.Clear;
          Sql.Add(vSql);
          Open;
     end;

     if vTipo = 'C' then begin
        if Date < QueryRegraAux.FieldbyName('DATAVOLTA').AsDateTime then begin
           vDias := Date - QueryRegraAux.FieldbyName('DATAEVENTO').AsDateTime;
           vAno := AnoBi(Date, QueryRegraAux.FieldbyName('DATAVOLTA').AsDateTime);
        end else begin
            vDias := QueryRegraAux.FieldbyName('DATAVOLTA').AsDateTime - QueryRegraAux.FieldbyName('DATAEVENTO').AsDateTime;
            vAno := AnoBi( QueryRegraAux.FieldbyName('DATAEVENTO').AsDateTime,
                           QueryRegraAux.FieldbyName('DATAVOLTA').AsDateTime);
        end;
        i := 1;
     end else begin
         vDias := 0;
         i := 0;
         vAno := 0;
         QueryRegraAux.First;
         vDtIni := '';
         vDtFim := '';
         while not QueryRegraAux.Eof do begin
               if (vDtIni = '') and (vDtFim = '') then begin
                   vDtIni := QueryRegraAux.FieldbyName('DATAEVENTO').AsString;
                   vDtFim := QueryRegraAux.FieldbyName('DATAVOLTA').AsString;
                   if StrtoDate(vDtFim) > Date then
                      vDtFim := DatetoStr(Date);
                   vDias := vDias + (StrtoDate(vDtFim) - StrtoDate(vDtIni));
                   vAno := vAno + AnoBi( StrtoDate(vDtIni), StrtoDate(vDtFim));
                   Inc(i);
               end else begin
                   if StrtoDate(vDtFim) > QueryRegraAux.FieldbyName('DATAEVENTO').AsDateTime then begin
                      vDias := vDias - (StrtoDate(vDtFim) - QueryRegraAux.FieldbyName('DATAEVENTO').AsDateTime);
                      vAno := vAno - AnoBi( StrtoDate(vDtFim), StrtoDate(vDtIni));
                      vDtFim := QueryRegraAux.FieldbyName('DATAEVENTO').AsString;
                      vAno := vAno + AnoBi( StrtoDate(vDtIni), StrtoDate(vDtFim));
                   end else begin
                       vDtIni := QueryRegraAux.FieldbyName('DATAEVENTO').AsString;
                       if QueryRegraAux.FieldbyName('DATAVOLTA').AsString <> '' then
                          vDtFim := QueryRegraAux.FieldbyName('DATAVOLTA').AsString
                       else
                           vDtFim := DatetoStr(Date);
                       vDias := vDias + (StrtoDate(vDtFim) - StrtoDate(vDtIni));
                       vAno := vAno + AnoBi( StrtoDate(vDtIni), StrtoDate(vDtFim));
                       Inc(i);
                   end;
               end;
               QueryRegraAux.Next;
         end;
     end;

     if vDias > 0 then begin
        Result := FloattoStr(vDias);
        if vRes = 'A' then //Ano
           Result := FloattoStr(vDias/(vAno/i));
        if vRes = 'M' then //Mes
           Result := FloattoStr(vDias/((vAno/i)/12));
     end else
         Result := '0';
end;

function Tregra.VerifCalculo(Ident : LongInt) : Boolean;
begin
     if Ident = 0 then
        Result := False
     else begin
          with QueryRegraAux do begin
               Close;
               Sql.Clear;
               Sql.Add('SELECT IDCALCULO FROM CALCULO WHERE IDCALCULO = '+InttoStr(Ident));
               Open;
          end;
          if QueryRegraAux.IsEmpty then Result := False
             else Result := True;
     end;
end;

{******************************************************************************}
{ Formula, ??                                                                  }
{------------------------------------------------------------------------------}
Function TRegra.SITPESSOA(Formula : String) : String;
Var
  vSql, vFormula : String;
  vTipo : LongInt;
Begin
  vFormula := Copy(Formula,11,Length(Formula));
  vFormula := Copy(vFormula,1,Length(vFormula)-1);

  vFormula := PegaValor(vFormula);
  Try
    vTipo := StrtoInt(vFormula);
  Except
    vTipo := 2;
  End;

  if (vTipo > 3) or (vTipo < 1) then
    vTipo := 1;

  Try
    fQueryIn.FieldByName('IDPESSOA').AsString;
  Except
    MsgDlgRegra('Campo IDPESSOA Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
    Exit;
  End;

  Case vTipo of
    1:Begin
      vSql := 'SELECT S.FLGINTERNO FROM '+
              'SITFUNC S, ELEGPATRO E WHERE (S.IDSITFUNC = E.IDSITFUNC) AND '+
              '(E.IDPESSOA = '+fQueryIn.FieldByName('IDPESSOA').AsString+')';
    End;
    2:Begin
      vSql := 'SELECT S.FLGINTERNO FROM '+
              'SITPART S, PARTPREVPLAN P WHERE (S.IDSITPART = P.IDSITPART) AND '+
              '(P.IDPESSOA = '+fQueryIn.FieldByName('IDPESSOA').AsString+')';
    End;
    3:Begin
     //Wylliam leite da Silva SOL 176340 KINTANA 1608819 - Inicio
      Try
    fQueryIn.FieldByName('IDPLANOPREV').AsString;
  Except
    MsgDlgRegra('Campo IDPLANOPREV Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
    Exit;
  End;
     //Wylliam leite da Silva SOL 176340 KINTANA 1608819 - Fim

      vSql := 'SELECT S.FLGINTERNO FROM '+
              'SITPLANOPREV S, PARTPREVPLAN P WHERE (S.IDSITPLANOPREV = P.IDSITPLANOPREV) AND '+
              '(P.IDPESSOA = '+fQueryIn.FieldByName('IDPESSOA').AsString+') AND'+
              '(P.IDPLANOPREV = '+fQueryIn.FieldByName('IDPLANOPREV').AsString+')'; //Wylliam leite da Silva SOL 176340 KINTANA 1608819
    End;
  End;

  With QueryRegraAux Do Begin
    Close;
    SQL.Clear;
    SQL.Add(vSql);
    Open;
  End;

  Result := QueryRegraAux.FieldbyName('FLGINTERNO').AsString;
end;

{******************************************************************************}
{ Formula, a Situação da pessoa (IDPESSOA) no Plano/Patrocinadora de acordo com}
{ parametro quando usando tabelas auxiliares (Views) pegas dessas tabelas      }
{------------------------------------------------------------------------------}
Function TRegra.SITINTERNA(Formula : String) : String;
Var
  vTipo, vFormula, vSql, sIdPessoa : String;
  vRes, i : LongInt;
Begin
  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }

  { Retira Nome da Formula }
  vFormula := Copy(Formula,12,Length(Formula));
  vFormula := Copy(vFormula,1,Length(vFormula)-1);

  { Guarda Tipo de Situacao }
  i := Pos(',',vFormula);
  If i = 0 then begin
    vTipo := PegaValor(vFormula);
    Try
      StrtoInt(vTipo);
    except
      vTipo := '0';
    end;
    vRes := 0;
  End Else Begin
    vTipo := Copy(vFormula, 1, i-1);
    vTipo := Pegavalor(vTipo);

    vFormula := Copy(vFormula,i+1,Length(vFormula));
    Try
      StrtoInt(vTipo);
    Except
      vTipo := '0';
    End;

    { Guarda Tipo de Resposta }
    vFormula := PegaValor(vFormula);
    Try
      vRes := StrtoInt(vFormula);
    Except
      vRes := 0;
    End;
  End;

  { Fim da Decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Descricao dos Parametros         }

  { vTipo                            }
  {  0 - Patrocinadora (ElegPatro)   }
  {  1 - Plano (PartPrevPlan)        }
  {  2 - Participante (PartPrevPlan) }

  { vRes                                                                    }
  {  0 - Retornará o TipoSit (Caso vTipo = 0)                               }
  {  1 - Retornará o TipoSit concatenado com FlgInterno (Caso vTipo = 0)    }

  { Caso esteja executando com tabela auxiliar (VIEWS) busca dados nela }
  If TemQuery Then Begin
    sIdPessoa := QryOutraRegra.FieldByName('IDPESSOA').AsString;
  End Else Begin
    sIdPessoa := fQueryIn.FieldByName('IDPESSOA').AsString;
  End;

  Case StrtoInt(vTipo) of
    0:Begin
      vSql := 'SELECT E.IDPESSOA, E.IDSITFUNC, S.FLGINTERNO, S.TIPOSIT '+
              'FROM ELEGPATRO E, SITFUNC S WHERE S.IDSITFUNC = E.IDSITFUNC AND '+
              'E.IDPESSOA = '+sIdPessoa;
    End;
    1:Begin
      VsQL := 'SELECT P.IDSITPLANOPREV, P.IDSITPLANOPREV, PA.FLGINTERNO FROM '+
              'PARTPREVPLAN P, SITPLANOPREV PA WHERE PA.IDSITPLANOPREV = P.IDSITPLANOPREV '+
              'AND	P.IDPESSOA = '+sIdPessoa;

    End;
    2:Begin
      vSql := 'SELECT P.IDSITPLANOPREV, P.IDSITPART, PA.FLGINTERNO FROM PARTPREVPLAN P, '+
              'SITPART PA WHERE PA.IDSITPART = P.IDSITPART AND P.IDPESSOA = '+sIdPessoa;;
    End;
  End;

  With QueryRegraAux Do Begin
    Close;
    Sql.Clear;
    Sql.Add(vSql);
    Open;
  End;

  Case StrtoInt(vTipo) of
    0:Begin
      Case vRes Of
        0:Result := QueryRegraAux.FieldbyName('TIPOSIT').AsString;
        1:Result := QueryRegraAux.FieldbyName('TIPOSIT').AsString+
                    QueryRegraAux.FieldbyName('FLGINTERNO').AsString;
      End;
    End;
    1..2:Result := QueryRegraAux.FieldbyName('FLGINTERNO').AsString;
  End;

End;

{******************************************************************************}
{ Formula, ??                                                                  }
{------------------------------------------------------------------------------}
Function TRegra.SITBENEFICIO(Formula : String ) : String;
Var
  vFormula, vSql : String;
begin
  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }
  vFormula := Copy(Formula,14,Length(Formula));
  vFormula := Copy(vFormula,1,Length(vFormula)-1);
  vFormula := PegaValor(vFormula);

  Try
    StrtoInt(vFormula);
  Except
    vFormula := '';
  End;

  { Fim da Decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Monta SQL para buscar a Situação do Beneficio }
  vSql := 'SELECT S.DESCRICAO FROM BENEFBFCIARIO B, SITBENEFICIO S WHERE '+
          'B.IDSITBENEFICIO = S.IDSITBENEFICIO AND ';

  If vFormula <> '' Then
    vSql := vSql + 'B.IDBENEFICIO IN('+vFormula+') AND ';

  // Andre Imakawa - SIG 29926 - Inicio
  //vSql := vSql + 'B.IDPESSOA = '+fQueryIn.FieldByName('IDPESSOA').AsString;
  vSql := vSql + 'B.NUMEROPROCESSO = '+fQueryIn.FieldByName('NUMEROPROCESSO').AsString;
  // Andre Imakawa - SIG 29926 - Fim

  With QueryRegraAux Do Begin
    Close;
    SQL.Clear;
    SQL.Add(vSql);
    Open;
    Last
  End;

  { Seta o Resultado }
  Result := QueryRegraAux.FieldbyName('DESCRICAO').AsString;
End;


function TRegra.OraNumero(sNumero : string):string;
var
   i : LongInt;
   sOra : string;
begin
   sOra := '';
   for i := 1 to length(Trim(sNumero)) do begin
       if sNumero[i] = ',' then
          sOra := sOra + '.'
       else
           sOra := sOra + sNumero[i]
   end;
   Result := sOra;
end;

function  TRegra.TruncValor(pNumero : double; pCasas : byte) : double;
var
  fator : double;
begin
  // Peterson Victor SOL 268938 PPM 1271773 INICIO
  try
     Qry.Close;
     Qry.sql.text := ' SELECT TRUNC( ' + FloatToStr(pNumero) + ' , ' + FloatToStr(pCasas) + ' ) AS VALOR FROM DUAL ';
     Qry.Open;
     Result := Qry.FieldByName('VALOR').AsCurrency;
  except

  end;
  // Peterson Victor SOL 268938 PPM 1271773 FIM

//  fator := exp(pCasas * ln(10));
//  Result := Trunc(pNumero * fator)/Fator;

end; // TruncValor


function tRegra.ArredValor(pNumero : double;pCasas : byte) : double;
var
  fator : double;
begin

  // Peterson Victor SOL 268938 PPM 1271773 INICIO
  try
     Qry.Close;
     Qry.sql.text := ' SELECT ROUND( ' + FloatToStr(pNumero) + ' , ' + FloatToStr(pCasas) + ' ) AS VALOR FROM DUAL ';
     Qry.Open;
     Result := Qry.FieldByName('VALOR').AsCurrency;
  except

  end;
  // Peterson Victor SOL 268938 PPM 1271773 FIM

//  fator := exp(pCasas * ln(10));
//  Result := Round(pNumero * fator)/fator;
end; // ArredValor


{******************************************************************************}
{ Formula - Retorna numero de ocorrencias de uma(s) Contribuicao(s) em um      }
{           periodo                                                            }
Function TRegra.NUMOCORCONTRIB(Formula:string):String;
Type
  Valor = Record
            Tipo: String;
          End;
Var
  vQtde, vSql, vAux, vDtMenor, vDtMaior,
  vReg, vFormula : String;
  TbValor :array [0..100] of Valor;
  Lin, i : LongInt;
begin
//------------------------------------------------------------------------------
// DECODIFICA FORMULA
// NUMOCORCONTRIB([IDCONTR1,IDCONTR2,IDCONTR3...],DATAINICIAL,
//                                                DATAFINAL,MAIORQUEZERO)
// Tira Nome da Formula e Inicia Variaveis
  vFormula := Copy(Formula,15,Length(Formula));
  vFormula := Copy(vFormula,1,Length(vFormula)-1);

  Fillchar(TbValor,sizeof(TbValor),#0);

  i := Pos('[',vFormula);
  vAux := Copy(vFormula,i+1,Length(vFormula));

  i := Pos(']',vAux);
  vAux := Copy(vAux,1,i-1);

  Lin := 0;
//------------------------------------------------------------------------------
// Guarda os Identificadores das Contribuicoes a serem apuradas
  Repeat
    i := Pos(',',vAux);
    if i = 0 then begin
      tbValor[Lin].Tipo := PegaValor(vAux);
      vAux := '';
    end else begin
      vReg := Copy(vAux,1,i-1);
      vReg := PegaValor(vReg);
      tbValor[Lin].Tipo := vReg;
      vAux := Copy(vAux,i+1,Length(vAux));
    end;
    Inc(Lin);
  Until vAux = '';

// Monta String com as Contribuicoes
  vAux := '';
  For i := 0 To 100 Do
    If tbValor[i].Tipo <> '' Then
      vAux := vAux +tbValor[i].Tipo+',';

  vAux := Copy(vAux,1,Length(vAux)-1);

// Continua a Decodificar a Formula
  i := Pos(']',vFormula);
  vFormula := Copy(vFormula,I+2,Length(vFormula));
  i := Pos(',',vFormula);

// Inicia e Preecnhe Variaveis de controle de Data
  vDtMenor := '';
  vDtMaior := '';
  vQtde    := '0';

  If i > 0 Then Begin
    vDtMenor := Copy(vFormula,1,i-1);
    vDtMenor := PegaValor(vDtMenor);
    if vDtMenor <> '' then
      vDtMenor := dataparames(vDtMenor,0,'I');

    vFormula := Copy(vFormula,i+1,Length(vFormula));

    i := Pos(',',vFormula);
    vDtMaior := Copy(vFormula,1,i-1);
    vDtMaior := PegaValor(vDtMaior);

    if vDtMaior <> '' then
      vDtMaior := DataParaMes(vDtMaior,0,'I');

    vFormula := Copy(vFormula,i+1,Length(vFormula));

    vQtde := Copy(vFormula,1,Length(vFormula));
    vQtde := PegaValor(vQtde);
  End;

  If (vDtMenor = '') or (vDtMaior = '') Then Begin
    vDtMenor := '';
    vDtMaior := '';
  End;

  If (vQtde <> '0') and (vQtde <> '1') Then
    vQtde := '0';

// FIM DA DECODIFICAÇÃO DA FORMULA
//------------------------------------------------------------------------------

// Testa se campos obrigatorios
  Try
    fQueryIn.FieldByName('IDPESSOA').AsString;
  Except
    MsgDlgRegra('Campo IDPESSOA Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
    Exit;
  End;

  Try
    fQueryIn.FieldByName('IDPESSJUR').AsString;
  Except
    MsgDlgRegra('Campo IDPESSJUR Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
    Exit;
  End;

// Monta SQL de Consulta
  vSql := 'SELECT COUNT(DISTINCT H.MESREFERENCIA) AS NUMMESES '+
          'FROM HSTCONTRIBPREV H, CONTPREV C WHERE '+
          '(H.IDCONTRIBUICAO = C.IDCONTRIBUICAO) AND (C.FLGPAGADOR = ''C'') AND '+
          '(H.IDPESSOA  = '+fQueryIn.FieldbyName('IDPESSOA').AsString+
          ') AND (H.IDPESSJUR = '+
          fQueryIn.FieldbyName('IDPESSJUR').AsString+
          ') AND (SUBSTR(H.MESREFERENCIA,6,2) <> ''13'')';

  If vQtde = '1' then
    vSql := vSql + ' AND (H.VALORRECEBIDO > 0) ';

  if (vDtMenor <> '') and (vDtMaior <> '') then
    vSql := vSql + ' AND (H.MESREFERENCIA <= '''+vDtMaior+
                ''') AND (H.MESREFERENCIA >= '''+vDtMenor+''')';

  if vAux <> '' then
    vSql := vSql + ' AND (H.IDCONTRIBUICAO IN ('+vAux+'))';

// Executa Consulta
  With QueryRegraAux Do Begin
    Close;
    Sql.Clear;
    Sql.Add(vSql);
    Open;
  End;

// Seta Resultado
  Result := QueryRegraAux.FieldbyName('NUMMESES').AsString;
end;

{******************************************************************************}
{------------------------------------------------------------------------------}
Function TRegra.VerifValor(Value : String): Integer;
Begin
  Try
    Case StrtoInt(Value) of
      1 : Result := 1;
      2 : Result := 0;
      3 : Result := -1;
    Else
      Result := -1;
    End;
  Except
    Result := -1;
  End;
end;

{******************************************************************************}
{------------------------------------------------------------------------------}
Function Tregra.BuscaBD(IdCampo : String) : String;
Begin
  With QueryRegra do begin
    Close;
    Sql.Clear;
    Sql.Add('SELECT NOMEDOCAMPO FROM CMPBD WHERE UPPER(IDCAMPO) = '''+
            UpperCase(IdCampo)+''' AND CAMPODOBANCO > 0');
    Open;
  End;

  If Not QueryRegra.IsEmpty Then Begin
    Try
      If T <> Nil Then
        If T^.TemQuery = True Then
          Result := Trim( QryOutraRegra.FieldByName(QueryRegra.FieldbyName('NOMEDOCAMPO').AsString).AsString )
        Else
          Result := Trim( FQueryIn.FieldByName(QueryRegra.FieldbyName('NOMEDOCAMPO').AsString).AsString )
      Else
        Result := Trim( FQueryIn.FieldByName(QueryRegra.FieldbyName('NOMEDOCAMPO').AsString).AsString );

    Except
      Result := PegaValorCmpBD(IdCampo);
    End;

  End;

End;


{******************************************************************************}
Function TRegra.RUBRINDIV(Formula:String): String;
Var
  sCodProvDesc, sSQL, vRub : String;
  vRegraOld, vRegra : LongInt;
  I, iAlgorAtualAnt : Integer;
  sExecutaRegra, sSomenteAtivas, sSQLAtivas, sDataInicio : String;
  iCont:integer;
  bPlanoPrevContab:Boolean;
  bTipoFolha:Boolean;
begin
  sExecutaRegra := 'N';
  sDataInicio := 'N';//SOL 121261 - Ádler Souza

  Formula := Trim(Copy(Formula, 11,Length(Formula)));
  Formula := Copy(Formula, 1, Length(Formula)-1);

  I := Pos(',', Formula);

  sCodProvDesc := Copy(Formula,1,(I-1));
  sCodProvDesc := PegaValor(sCodProvDesc);

  Formula := Copy(Formula, I + 1, Length(Formula));

  I := Pos(',', Formula);
  If I <= 0 Then I := (Length(Formula)+1);

  sExecutaRegra := Copy(Formula, 1, (I-1));
  sExecutaRegra := PegaValor(sExecutaRegra);

  Formula := Copy(Formula, I + 1, Length(Formula));

  I := Pos(',', Formula);

  If I <= 0 Then I := (Length(Formula)+1);

  sSomenteAtivas := Copy(Formula,1,(I-1));
  sSomenteAtivas := PegaValor(sSomenteAtivas);

  //SOL 121261 - Ádler Souza
  Formula := Copy(Formula, I + 1, Length(Formula));

  I := Pos(',', Formula);

  If I <= 0 Then I := (Length(Formula)+1);

  sDataInicio := Copy(Formula,1,(I-1));
  sDataInicio := PegaValor(sDataInicio);
  // Fim - SOL 121261 - Ádler Souza

  { Busca IDRUBRICA }
  sSQL := 'SELECT IDPROVENTO FROM PROVDESC WHERE  CODPROVDESC = '+QuotedStr(sCodProvDesc);
  If Not FazQuery(QueryRegraAux, sSQL) Then
    Exit;

  vRub := QueryRegraAux.FieldByName('IDPROVENTO').AsString;
  QueryRegraAux.Close;

     //Verifica se o Campo IDPLANPREVCONTAB existe na Query de Entrada
     bPlanoPrevContab:=False;
     for iCont:=0 to FQueryIn.FieldCount-1 do
       begin
          if FQueryIn.FieldList.Fields[iCont].DisplayName = 'IDPLANPREVCONTAB' then
             bPlanoPrevContab:= True;
       end;


   bTipoFolha:=False;
     for iCont:=0 to FQueryIn.FieldCount-1 do
       begin
          if FQueryIn.FieldList.Fields[iCont].DisplayName = 'TIPOFOLHA' then
             bTipoFolha:= True;
       end;




  { Daniel Begnami
    Sol: 95655 KT: 413537 }

  sSQL :=   'SELECT R.SEQRUBRICAINDIV, R.IDREGRACALCULO, R.VALORRUBRICA, FLGPERMANENTE, FLGDESATIVADO '+
            'FROM RUBRICAINDIV R, '+
       	    '     (SELECT MAX(R.SEQRUBRICAINDIV) TOT FROM RUBRICAINDIV R WHERE '+
            '      R.IDPESSOA = '+FQueryIn.fieldbyname('IDPESSOA').AsString+
            '      AND R.IDTITULAR = '+FQueryIn.fieldbyname('IDTITULAR').AsString+//Fanuel Junior SOL171163/7441 Kintana1531659
            '      AND R.IDRUBRICA = '+vRub+') X '+
            'WHERE R.IDPESSOA = '+
            FQueryIn.fieldbyname('IDPESSOA').AsString+' AND R.IDRUBRICA = '+vRub+
            '  AND R.IDTITULAR = '+FQueryIn.fieldbyname('IDTITULAR').AsString+//Fanuel Junior SOL171163/7441 Kintana1531659
            '  AND X.TOT = R.SEQRUBRICAINDIV ';

            //SOL121261 - Ádler Souza
            if (sDatainicio = 'S') then
              sSQL := sSQL+ '  AND DATAINICIO <= '+quotedstr(FQueryIn.fieldbyname('DATAREF').AsString);
            //Fim - SOL121261 - Ádler Souza

             //Thiago Passos SOL 124272 Ktn 649353 10/11/2009
              if (bPlanoPrevContab=True) and (Trim(FQueryIn.fieldbyname('IDPLANPREVCONTAB').AsString) <> '') then
                sSQL:= sSQL+ '  AND R.IDPLANOCONTABIL = ' + FQueryIn.fieldbyname('IDPLANPREVCONTAB').AsString;

              if (bTipoFolha=True) and (Trim(FQueryIn.fieldbyname('TIPOFOLHA').AsString) <> '') then begin
                if Trim(FQueryIn.fieldbyname('TIPOFOLHA').AsString) <> '2' then begin
                   //sSQL:= sSQL+ '  AND R.FLGUSAABONO = ' + FQueryIn.fieldbyname('TIPOFOLHA').AsString; // Renato Visoni SOL 135399 Kintana 805304
                   sSQL:= sSQL+ '  AND R.FLGUSAABONO IN (0,1) ' ;                                        // Renato Visoni SOL 135399 Kintana 805304
                end else begin
                   sSQL:= sSQL+ '  AND ((nvl(r.flgantecipabono,0) = 1) or  (nvl(r.flgantecipaabonoinss,0) =1))';
                end;
              end;
             //Fim - Thiago Passos SOL 124272 Ktn 649353 10/11/2009


  sSQLAtivas := '';
  If FazQuery(QueryRegraAux, sSQL) Then
  begin
    if QueryRegraAux.FieldByName('FLGDESATIVADO').AsInteger = 0 then
    begin
      if QueryRegraAux.FieldByName('FLGPERMANENTE').AsInteger <> 1 then
        if ( sSomenteAtivas = 'S' ) Then
          sSQLAtivas := ' AND NUMOCORRENCIAS < PARCELAS ';
    end
    else if QueryRegraAux.FieldByName('FLGDESATIVADO').AsInteger = 1 then
    begin
      QueryRegraAux.Close;
      Result := '';
      exit;
    end;
  end;
  QueryRegraAux.Close;
{  sSQLAtivas := '';
  If ( sSomenteAtivas = 'S' ) Then
    sSQLAtivas := ' AND NUMOCORRENCIAS < PARCELAS '; }

  { Fim - 95655 }




  With QueryRegra Do Begin
    Close;
    SQL.Clear;
    sSQL := 'SELECT R.SEQRUBRICAINDIV, R.IDREGRACALCULO, R.VALORRUBRICA '+
            'FROM RUBRICAINDIV R, '+
       	    '     (SELECT MAX(R.SEQRUBRICAINDIV) TOT FROM RUBRICAINDIV R WHERE '+
            '      R.IDPESSOA = '+FQueryIn.fieldbyname('IDPESSOA').AsString+
            '      AND R.IDTITULAR = '+FQueryIn.fieldbyname('IDTITULAR').AsString+//Fanuel Junior SOL171163/7441 Kintana1531659
            '      AND R.IDRUBRICA = '+vRub+ sSQLAtivas +') X '+
            'WHERE R.IDPESSOA = '+
            FQueryIn.fieldbyname('IDPESSOA').AsString+' AND R.IDRUBRICA = '+vRub+
            '  AND R.IDTITULAR = '+FQueryIn.fieldbyname('IDTITULAR').AsString+//Fanuel Junior SOL171163/7441 Kintana1531659
            '  AND X.TOT = R.SEQRUBRICAINDIV ';

            //SOL121261 - Ádler Souza
            if (sDatainicio = 'S') then
              sSQL := sSQL+ '  AND DATAINICIO <= '+quotedstr(FQueryIn.fieldbyname('DATAREF').AsString);
            //Fim - SOL121261 - Ádler Souza

             //Thiago Passos SOL 124272 Ktn 649353 10/11/2009
              if (bPlanoPrevContab=True) and (Trim(FQueryIn.fieldbyname('IDPLANPREVCONTAB').AsString) <> '') then
                 sSQL:=sSQL+  '  AND R.IDPLANOCONTABIL = ' + FQueryIn.fieldbyname('IDPLANPREVCONTAB').AsString ;

              if (bTipoFolha=True) and (Trim(FQueryIn.fieldbyname('TIPOFOLHA').AsString) <> '') then begin
                if Trim(FQueryIn.fieldbyname('TIPOFOLHA').AsString) <> '2' then begin
                   //sSQL:= sSQL+ '  AND R.FLGUSAABONO = ' + FQueryIn.fieldbyname('TIPOFOLHA').AsString; // Renato Visoni SOL 135399 Kintana 805304
                   sSQL:= sSQL+ '  AND R.FLGUSAABONO IN (0,1)';                                          // Renato Visoni SOL 135399 Kintana 805304
                end else begin
                   sSQL:= sSQL+ '  AND ((nvl(r.flgantecipabono,0) = 1) or  (nvl(r.flgantecipaabonoinss,0) =1))';
                end;
              end; //Fim - Thiago Passos SOL 124272 Ktn 649353 10/11/2009



           sSQL:=sSQL +' '+ sSQLAtivas;
    SQL.Add(sSql);
    Open;
  End;


  If QueryRegra.IsEmpty Then
    Result := ''
  Else Begin
    If sExecutaRegra = 'S' Then begin
      Result := QueryRegra.FieldbyName('IDREGRACALCULO').AsString;
      If Result <> '' Then Begin
        iAlgorAtualAnt := iAlgorAtual;
        Result := ExecutaRegraInterna(StrtoInt(Result), StrtoInt(vRub));
        iAlgorAtual := iAlgorAtualAnt;
        iTotRegs := CarregaAlgoritmos(fRuleName);
      End;
     End Else Begin
      Result := QueryRegra.FieldbyName('VALORRUBRICA').AsString;
    End;
  End;
End;

{******************************************************************************}
{ Utilizada no Passo que executa uma outra Regra                               }
{------------------------------------------------------------------------------}
Function TRegra.ExecutaRegraInterna(NumeroRegra, Rubrica : LongInt):string;
Var
  FlgLoop, bFim    : Boolean;
  Aux     : String[2];
  vCamp   : Array [1..700] Of TCmps;
  vLoop, I, J, Tamanho : LongInt;
  CodErro : Integer;
  sSQL    : String;
Begin
  { Testa Campos Obrigatórios }
  Try
    fQueryIn.FieldByName('IDPESSOA').AsString;
  Except
    MsgDlgRegra('Campo IDPESSOA Necessário no SQL de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
    Exit;
  End;
  Try
    fQueryIn.FieldByName('VLRBRUTO').AsString;
  Except
    MsgDlgRegra('Campo VLRBRUTO Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
    Exit;
  End;
  Try
    fQueryIn.FieldByName('VLRLIQUIDO').AsString;
  Except
    MsgDlgRegra('Campo VLRLIQUIDO Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
    Exit;
  End;
  Try
    fQueryIn.FieldByName('DATAREF').AsString;
  Except
    MsgDlgRegra('Campo DATAREF Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
    Exit;
  End;
  Try
    fQueryIn.FieldByName('VLRBASEIRRF').AsString;
  Except
    MsgDlgRegra('Campo VLRBASEIRRF Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
    Exit;
  End;

  { Monta Query Virtual }
  sSql := 'SELECT '+
          fQueryIn.FieldByName('VLRBRUTO').AsString+  ' AS VLRBRUTO, '+
          fQueryIn.FieldByName('VLRLIQUIDO').AsString+' AS VLRLIQUIDO,  '+
          QuotedStr(fQueryIn.FieldByName('DATAREF').AsString)+' AS DATAREF, '+
          fQueryIn.FieldByName('VLRBASEIRRF').AsString+' AS VLRBASEIRRF, '+
          'RI.IDPESSOA, RI.IDRUBRICA, RI.VALORRUBRICA, RI.DATAFINAL, PD.FLGIRRF, '+
          'PF.DATANASC, PF.NUMDEPIRRF FROM PESSOAFISICA PF, RUBRICAINDIV RI, PROVDESC PD '+
          'WHERE PF.IDPESSOA = RI.IDPESSOA AND RI.IDRUBRICA = PD.IDPROVENTO AND '+
          'RI.IDRUBRICA = '+InttoStr(Rubrica)+' AND RI.IDPESSOA = '+fQueryIn.FieldByName('IDPESSOA').AsString;
  FazQuery(QryOutraRegra,sSql);

  TemQuery := True;
  FlagCampo  :=0;
  UposIndice :=0;
  IndiceAtual:='';
  Vet := 0;

  { Carrega os Algoritmos da Nova Regra }
  Flg100 := False;
  iTotRegs := CarregaAlgoritmos(InttoStr(NumeroRegra));

  { Testa se Regra possui mais passos que o normal  }
  If Flg100 then
    Exit;

  sRegraAnt := FRuleName;

  { Testa integridade da Regra }
  If (aAlgorTipo[iTotRegs] <> '9') And (aAlgorTipo[iTotRegs] <> '12') Then Begin
    MsgDlgRegra('Regra Incompleta !. Complete a regra com um passo do tipo: "Parar execução da regra"','Atenção',
           mterror,[mbOk],0);
    Ferror:=true;
    Exit;
  End;
  If QryOutraRegra.IsEmpty then begin
    MsgDlgRegra('A consulta de entrada do regra está retornando vazio.','Regra - Atenção',mterror,[mbOk],0);
    Ferror:=true;
    Exit;
  End;

  { Pega primeiro registro para processar }
  QryOutraRegra.First;
  iAlgorAtual   := 1;
  iContRegQryIn := 0;

  { Inicia o Loop  dos registros da Consulta }
  While (Not QryOutraRegra.EOF) And (iAlgorAtual <> 0) Do Begin
    vLoop   := 0;
    FlgLoop := False;
    Inc(iContRegQryIn);
    { Inicia o Loop  dos Passos da Regra }
    While (iAlgorAtual >= 1) And (Not bFim) Do Begin
      { Testa o Tipo de Passo e Executa Rotina Correspondente }
      { Atribuicao }
      If (aAlgorTipo[iAlgorAtual] = '1') Or (aAlgorTipo[iAlgorAtual] = '2') Or
         (aAlgorTipo[iAlgorAtual] = '11') Then Begin
        FazAtribuicao(iAlgorAtual); { Atribuicao }
        Result := fResult;
        { Caso Debugando exibe o Passo }
        If FlgPasso Then
          ExibePasso;
        Inc(iAlgorAtual);

      End Else Begin
        If (aAlgorTipo[iAlgorAtual] >= '3') And (aAlgorTipo[iAlgorAtual] <= '8') Then Begin
          PassoAux := iAlgorAtual;
          iAlgorAtual := FazCorrelacao(iAlgorAtual); { Correlação }
          Passo := iAlgorAtual;
          iAlgorAtual:=PassoAux;
          { Caso Debugando exibe o Passo }
          If FlgPasso Then
            ExibePasso;
          iAlgorAtual := Passo;
        End Else Begin
          If aAlgorTipo[iAlgorAtual] = '14' Then Begin
            FResult:=ExecutaOutraRegraNova('E'); { Executa outra Regra }
            Result := FResult;
            GrpQry:=-1;
            { Caso Debugando exibe o Passo }
            If FlgPasso Then
              ExibePasso;
            Inc(iAlgorAtual);
          End Else Begin
            If aAlgorTipo[iAlgorAtual] = '10' Then Begin
              FazInput(iAlgorAtual);  { Chama tela de Input }
              Result := fResult;
              { Caso Debugando exibe o Passo }
              If FlgPasso Then
                ExibePasso;
              Inc(iAlgorAtual);
            End Else Begin
              If aAlgorTipo[iAlgorAtual] = '12' Then Begin   { Finaliza Regra }
                { Caso tenha ocorrido um erro, set Flag de erro  }
                If aAlgorValor[ialgoratual] = 'ERRO' then
                  FError:=true;
                bFim:=True;
                { Caso Debugando exibe o Passo }
                If FlgPasso Then
                  ExibePasso;
                iAlgorAtual := 99;
                fQueryIn.Last; { pula para o ultimo registro da Consulta de Entrada }
                Result := fResult;
              End Else Begin
                If aAlgorTipo[iAlgorAtual] = '13' then begin
                  FPassonumber        := aAlgorRegra[iAlgorAtual]; //SOL 136806 Kintana 820407
                  ExibeMsg(aAlgorValor[iAlgorAtual],aAlgorcampo[iAlgorAtual]); { Exibe Mensagem }
                  If FlgPasso Then ExibePasso;
                    Inc(iAlgorAtual);
                  Result := fResult;
                End Else Begin
                  If aAlgorTipo[iAlgorAtual] = '15' Then Begin
                    If FlgPasso Then
                      ExibePasso; { Ir para Passo }
                    iAlgoratual:=pegaidalgor(strtoint(aAlgorsubseqtrue[iAlgoratual]));
                  End Else Begin
                    If aAlgorTipo[iAlgorAtual] = '16' Then Begin
                      GravaCalculo; { Gravar na Memoria de Calculo }
                      If FlgPasso Then
                        ExibePasso;
                      Inc(iAlgorAtual);
                    End Else Begin { Erro, tipo de Passo inexistente }
                      bFim := True;
                      If aAlgorValor[ialgoratual] = 'ERRO' Then
                        FError:=true;
                    End;
                  End;
                End;
              End;
            End;
          End;
        End;
      End;
      If SairDaRegra Then Begin
        bFim:=True;
      End;

      If Not FlgLoop Then
        Inc(vLoop);
      If (vLoop > 100000) And (Not FlgLoop) Then Begin
        FlgLoop := True;
        If MsgDlgRegra('Provavelmente esta Regra está em Loop, deseja cancelar execução ?',
                  'Regra - Atenção',mtConfirmation,[mbyes,mbno,mbHelp],0) = mrYes Then
        bFim := True;
      End;

    End; { While (iAlgorAtual >= 1) - Fim do Loop dos Passos }

    DecimalSeparator:=Separador;

    Application.OnException:=ProcErro;

    { Dispara o Evento OnGetResult }
    If Assigned(FOnGetResult) Then
      FOnGetResult(Self);

    { Dispara o Evento OnGetResultDistinct }
    If (Assigned(FOnGetResultDistinct)) and not (Achou) then
      FOnGetResultDistinct(Self);

//    ProcErro :=application.OnException;
//    Application.OnException:=TrataErros;
    Decimalseparator:='.';
    QryOutraRegra.Next;
    iAlgorAtual := 1;

  End; { While Not (QryOutraRegra.EOF) - Fim do Loop dos Registros }

  { Refaz Ambiente e seta resultado da Funcao }
  QueryRegra.Close;
  Tabuabio:='';
  Result  := TrocaVirgulaponto(Result);
  Decimalseparator:=Separador;
  Application.OnException:=ProcErro;
End;


{******************************************************************************}
{ Reinicia o Ambiente do Regra, fechando as Querys e zerando as varieveis e li-}
{ stas utilizadas para controles de regras executadas                          }
{------------------------------------------------------------------------------}
Procedure TRegra.RefazAmbiente;
Var
  I,J : Longint;
Begin
  { Fecha Querys e Libera Componentes }
  QueryRegra.Close;
  QueryRegra.free;
  DSregra.Free;
  QueryRegraAux.Close;
  QueryRegraAux.free;
  QryIndice.Close;
  QryIndice.free;
  QryTabuaBio.Close;
  QryTabuaBio.free;
  QryOutraRegra.Close;
  QryOutraRegra.free;
  QryAlg.Close;
  QryAlg.Free;

  { Libera Componente de Planilha }
  Formula1.HeapMin;
  FreeAndNil( Formula1 );

  { Reinicia as Pilas de Controle (Discontinuado) }
  While not vaziaRep(TRep) do
    DesempilharRep(TRep);
  While not vaziaInd(TInd) do
    DesempilharInd(TInd);

  { Retira Regras da Memoria }
  For J := 0 To 20 Do Begin
    VetRegrasMemoria[J].IdRegra := '';
  End;


  { Recria Componentes }
  Formula1      := TF1book.Create(Self);
  QueryRegra    := TwwQuery.Create(Self);
  DsRegra       := TdataSource.Create(Self);
  QueryRegraAux := twwQuery.Create(Self);
  QryIndice     := twwQuery.Create(Self);
  QryTabuaBio   := twwQuery.Create(Self);
  QryAlg        := twwQuery.Create(Self);
  QryOutraRegra := twwQuery.Create(Self);

  QueryRegraAux.DatabaseName := FDatabaseName;
  QueryRegra.DatabaseName    := FDatabaseName;
  QryTabuaBio.DatabaseName   := FDatabaseName;
  QryOutraRegra.DatabaseName := FDatabaseName;
  QryAlg.Databasename        := FDatabaseName;

  CriarPilhaRep(TRep);
  CriarPilhaInd(Tind);

  { Preenche as Querys }
  sPrimExec := '';
End;



//******************************************************************************
// Executa uma outra Regra dentro de uma regra
Function tRegra.ExecutaOutraRegraNova(OPC:Char):String;
var
  bFim :Boolean; 
  I,CodErro:Integer;
  sSql:String;
  RegraAtualExec:TRegistro;
begin
// Caso sair da Regra
  If SairdaRegra Then
    Exit;

//------------------------------------------------------------------------------
// Controle empilhamento ou desempilhamento das Regras
//------------------------------------------------------------------------------

// Caso Deseje Empilhar a Regra na Memória
  If OPC = 'E' Then Begin

    IncluiRegraExecutada(StrtoInt(FRuleName),iAlgorAtual);

// Prepara Ambiente
    QueryRegraAux.Close;
    QueryRegraAux.Sql.Clear;

    fRuleName   := aAlgorCampo2[iAlgorAtual];

// Verifica se usa Query Interna
    Val(aAlgorValor[iAlgorAtual],GrpQry,CodErro);
// Caso Não utilise flega com -1
    if coderro <> 0 then grpqry   := -1;

// Carrega Algoritmos da Regra a ser executada
    iTotRegs    := CarregaAlgoritmos(aAlgorCampo2[iAlgorAtual]);
//    iTotRegs    := CarregaAlgoritmos(Pegavalor(fRuleName));

// Guarda Alguns dados
    iAlgorAtual := 1;
    sRegraAnt   := frulename;

// Caso Use Consulta Interna abre a Consulta Relativa
    Case GrpQry Of
      0:Begin
// DEPENDENTES
          try
            fQueryIn.FieldByName('IDTITULAR').AsString;
          except
            MsgDlgRegra('Campo IDTITULAR Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
            Exit;
          end;
// Monta e Abre Consulta dos Dependentes
          sSql := 'SELECT IDTITULAR, IDPESSOA, NOME, NUMDOCUMENTO, DATANASC,     '+
                  '       SEXO, IDDEPENDENCIA, IDSITDEPENDENTE, INICIOINVALIDEZ, '+
                  '       FIMINVALIDEZ '+
                  'FROM CM.VIEWDEPENDENTE '+
                  'WHERE IDTITULAR = '+fQueryin.FieldByName('IDTITULAR').AsString;
          FazQuery(QryOutraRegra,sSql);
          TemQuery:=True;

        End;
      1:Begin
// BENEFICIARIOS
          Try
            fQueryIn.FieldByName('IDTITULAR').AsString;
          Except
            MsgDlgRegra('Campo IDTITULAR Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
            Exit;
          End;
// Monta e Abre Consulta dos Beneficiarios
          sSql:= 'SELECT IDPESSJUR,IDPLANOPREV,IDTITULAR,SEQPROPOSTA,    '+
                 'IDPESSOA,NOME,NUMDOCUMENTO,DATANASC,SEXO,IDDEPENDENCIA,'+
                 'IDSITDEPENDENTE,PERCENTUAL,PRIORIDADE, IDBENEFICIO, ESTCIVIL, '+
                 'FLGDESIGNADO FROM CM.VIEWBENEFICIARIO WHERE IDTITULAR = '+
                 fQueryin.fieldbyname('IDTITULAR').AsString;

          FazQuery(QryOutraRegra,sSql);
          TemQuery:=True;

        End;
      2:Begin
// BENEFICIARIOS ASSISTENCIAIS

// Testa se Campos necessários existem
          Try
            fQueryIn.FieldByName('IDTITULAR').AsString;
          Except
            MsgDlgRegra('Campo IDTITULAR Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
            Exit;
          End;

          Try
            fQueryIn.FieldByName('IDPLANOPREV').AsString;
          Except
            MsgDlgRegra('Campo IDPLANOPREV Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
            Exit;
          End;

          Try
            fQueryIn.FieldByName('IDPESSJUR').AsString;
          Except
            MsgDlgRegra('Campo IDPESSJUR Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
            Exit;
          End;

          Try
            fQueryIn.FieldByName('IDPLANASS').AsString;
          Except
            MsgDlgRegra('Campo IDPLANASS Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
            Exit;
          End;

// Monta e Abre Consulta dos Beneficiarios Assistenciais
          sSql:='SELECT IDPESSJUR, IDPLANOPREV, IDTITULAR,SEQPROPOSTA, IDPESSOA,  IDPLANASS, IDDEPENDENTE,'+
                ' NOME, NUMDOCUMENTO, DATANASC,SEXO,IDDEPENDENCIA, IDSITDEPENDENTE,ESTCIVIL FROM CM.VIEWBENEFASS WHERE IDTITULAR = '+
                fQueryin.fieldbyname('IDTITULAR').AsString   + ' AND IDPLANOPREV = '+
                fQueryin.fieldbyname('IDPLANOPREV').AsString + ' AND IDPESSJUR   = '+
                fQueryin.fieldbyname('IDPESSJUR').AsString   + ' AND IDPLANASS   = '+
                fQueryin.fieldbyname('IDPLANASS').AsString ;
          FazQuery(qryOutraRegra,sSql);
          TemQuery:=True;
        End;

      3:Begin
// SITUACAO DO PARTICIPANTE

// Testa se Campos necessários existem
          Try
            fQueryIn.FieldByName('IDPESSOA').AsString;
          Except
            MsgDlgRegra('Campo IDPESSOA Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
            Exit;
          End;

          Try
            fQueryIn.FieldByName('IDPESSJUR').AsString;
          Except
            MsgDlgRegra('Campo IDPESSJUR Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
            Exit;
          End;

          Try
            fQueryIn.FieldByName('IDPLANASS').AsString;
          Except
            MsgDlgRegra('Campo IDPLANASS Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
            Exit;
          End;
// Monta e Abre Consulta de Situação dos Participantes
          sSql:='SELECT IDEVENTOSPREV,IDSITPLANOATUAL,IDSITPLANONOVO, '+
                'IDSITPARTATUAL,IDSITPARTNOVO,IDSITFUNCATUAL,IDSITFUNCNOVO '+
                'FROM EVENTOSPREV WHERE  IDEVENTOSPREV IN (SELECT MAX(IDEVENTOSPREV) '+
                'FROM EVENTOSPREV '+
                'WHERE '+
                'IDPESSOA    = '+ fQueryIn.Fieldbyname('IDPESSOA').AsString    + ' AND '+
                'IDPLANOPREV = '+ fQueryIn.Fieldbyname('IDPLANOPREV').AsString + ' AND '+
                'IDPESSJUR   = '+ fQueryIn.Fieldbyname('IDPESSJUR').AsString   +')';
          FazQuery(qryOutraRegra,sSql);
          TemQuery:=True;

        End;
    Else
      TemQuery := False;
    End;

  End Else Begin // If OPC <> E

//------------------------------------------------------------------------------
// Caso Deseje Retira a Regra da Memória
    GrpQry:=-1;

    If ProxRegraExec <> 0 Then Begin
      RegraAtualExec:=RetirarRegraExecutada(ProxRegraExec);
      fRuleName   := IntToStr(RegraAtualExec.Valor1);
      iAlgorAtual := RegraAtualExec.Valor2;
      iTotRegs    := CarregaAlgoritmos(fRuleName);
      Exit;
    End Else Begin
      Result:= TrocaVirgulaPonto(Fresult);
      Exit;
    End;

  End; // If OPC = E


//------------------------------------------------------------------------------
// Continua a Rotina Com o Processamento dos Algaritmos
//------------------------------------------------------------------------------


// Caso Esta Regra possua Query Propria \\

  If TemQuery = True Then begin

// Processa Registros da Regra
    While not QryOutraRegra.EOF do begin
      I   :=0;
      bFim:=False;

// Processa Algoritmos da Regra para o Registro atual
      While (iAlgorAtual >= 1) and  (not bFim) do begin
        If FAlgEditBox <> NIL then begin
          TEdit(FAlgEditBox).Text := aAlgorRegra[iAlgorAtual];
        End;
//------------------------------------------------------------------------------
// Processa os Tipos de Passo

// ATRIBUICAO
        if (aAlgorTipo[iAlgorAtual] = '1') or
           (aAlgorTipo[iAlgorAtual] = '2') or
           (aAlgorTipo[iAlgorAtual] = '11')
        then begin

          FazAtribuicao(iAlgorAtual);   // Executa o Tipo de Passo
          If FlgPasso then  ExibePasso; // Caso Passo a Passo Exibe o Passo

          Inc(iAlgorAtual);
        End Else
// CORRELACAO
          If (aAlgorTipo[iAlgorAtual] >= '3') And
             (aAlgorTipo[iAlgorAtual] <= '8')
          Then Begin
            PassoAux   := iAlgorAtual;
            iAlgorAtual:= FazCorrelacao(iAlgorAtual); // Executa o Tipo de Passo
            passo      := iAlgorAtual;
            iAlgorAtual:= PassoAux;

            if flgpasso then  ExibePasso; // Caso Passo a Passo Exibe o Passo

            iAlgorAtual:=Passo;
          End Else

// EXECUTA OUTRA REGRA
            If aAlgorTipo[iAlgorAtual] = '14' Then Begin

              Fresult:=ExecutaOutraRegraNova('E'); // Executa o Tipo de Passo

              if flgpasso then  ExibePasso;        // Caso Passo a Passo Exibe o Passo
              inc(iAlgorAtual);
            End Else

// RECEBE VALOR DO USUARIO PARA VARIAVEL (INPUT)
              If aAlgorTipo[iAlgorAtual] = '10' then begin
                FazInput(iAlgorAtual);        // Executa o Tipo de Passo

                if flgpasso then  ExibePasso; // Caso Passo a Passo Exibe o Passo
                inc(iAlgorAtual);
              end else

// SAIR DA REGRA
                if aAlgorTipo[iAlgorAtual] = '12' then begin
                  bfim:=true;

                  if flgpasso then  ExibePasso;
// Caso deseje que mostre mensagem de erro ao sair
                  if aAlgorValor[ialgoratual] = 'ERRO' then
                    FError:=True;
// Pula para o final dos dados
                  iAlgorAtual := 400;
                  fQueryIn.Last;
                  SairDaRegra :=True;

                end else
// EXIBE MENSAGEM
                  if aAlgorTipo[iAlgorAtual] = '13' then begin
                    FPassonumber        := aAlgorRegra[iAlgorAtual]; //SOL 136806 Kintana 820407
                    ExibeMsg(aAlgorValor[iAlgorAtual],aAlgorcampo[iAlgorAtual]);
                    if flgpasso then  ExibePasso;
                    inc(iAlgorAtual);
                  end else
// IR PARA DETERMINADO PASSO
                    if aAlgorTipo[iAlgorAtual] = '15' then begin
                      if flgpasso then  ExibePasso;
                      iAlgoratual:=pegaidalgor(strtoint(aAlgorsubseqtrue[iAlgoratual]));
                    end else

// GRAVA NA MEMORIA DE CALCULO
                      if aAlgorTipo[iAlgorAtual] = '16' then begin
                        GravaCalculo;
                        if flgpasso then  ExibePasso;
                        inc(ialgorAtual);
                      end else begin
// ERRO TIPO DE PASSO NAO EXISTE
                        bFim := True;
                        if aAlgorValor[ialgoratual] = 'ERRO' then FError:=true;
                      end;

        If bFim <> True then begin
          i := i + 1;                    //próximo algoritmo
        end;

        if sairdaregra then begin
           bfim:=true;
        end;

      end;

// FIM DO PROCESSAMENTO DOS PASSOS, CASO REGRA POSSUA PROPRIA QUERY
      QryOutraRegra.Next;
      iAlgorAtual:=1;
    end;

  End Else Begin // If TemQuery

//------------------------------------------------------------------------------
// Caso esta Regra não possua Query propria
//------------------------------------------------------------------------------

// Inicia Variaveis

    I   :=0;
    bfim:=False;

//------------------------------------------------------------------------------
// Processa os Algoritmos da Regra

    While (iAlgorAtual >= 1) And (not bFim) Do Begin

    //Fanuel Junior SOL144511 Kintana952230 - Inicio
    Case Operacao of

      opVoltar: begin

               If (aAlgorTipo[iCtrlAlgor] = '1') or (aAlgorTipo[iCtrlAlgor] = '2') or
                (aAlgorTipo[iCtrlAlgor] = '11') then begin
                      aTabVariaveis[iTotVariaveis,1] := '';
                      aTabVariaveis[iTotVariaveis,2] := '';
                      Dec(iTotVariaveis);
               end;
                Dec(iCtrlAlgor);

                if ((aHistAlgor[iCtrlAlgor - 1,1]) <> (aHistAlgor[iCtrlAlgor,1]) ) then begin
                   bfim := true;
                  // iAlgorAtual := StrToInt(aHistAlgor[iCtrlAlgor - 2,2]);
                   iVoltouRegra := 1;
                   Operacao := opVoltar;
                end
                else begin
                   iAlgorAtual := StrToInt(aHistAlgor[iCtrlAlgor - 1,2]);
                   Operacao := opNada;
                end;

               end;

     //Fanuel Junior SOL144511 Kintana952230 - Fim

     opProsseguir,opNada : begin



      If FAlgEditBox <> NIL Then Begin
        TEdit(FAlgEditBox).Text := aAlgorRegra[iAlgorAtual];
      End;

            //Fanuel Junior SOL144511 Kintana952230 - Inicio
      if Operacao = opProsseguir then
        Inc(iCtrlAlgor);

      If iCtrlAlgor > iUltAlgor then
      begin
         aHistAlgor[iUltAlgor,1] := frulename;
         aHistAlgor[iUltAlgor,2] := IntToStr(iAlgorAtual);
         Inc(iUltAlgor);
      end;
      //Fanuel Junior SOL144511 Kintana952230 - Fim

// Processa os Tipos de Passo \\

// Processa os Tipos de Passo \\

// ATRIBUICAO
      If (aAlgorTipo[iAlgorAtual] = '1') Or
         (aAlgorTipo[iAlgorAtual] = '2') Or
         (aAlgorTipo[iAlgorAtual] = '11')
      Then Begin
        FazAtribuicao(iAlgorAtual);
        If flgpasso Then  ExibePasso;
        inc(iAlgorAtual);
      End Else

// CORRELAÇÃO
        If (aAlgorTipo[iAlgorAtual] >= '3') And
           (aAlgorTipo[iAlgorAtual] <= '8')
        Then Begin
          passoaux:=ialgoratual;
          iAlgorAtual := FazCorrelacao(iAlgorAtual);
          passo       :=iAlgorAtual;
          iAlgorAtual :=passoaux;
          If flgpasso Then  ExibePasso;
          ialgoratual :=passo;
        End Else
// EXECUTA OUTRA REGRA
          If aAlgorTipo[iAlgorAtual] = '14' Then Begin
            Fresult := ExecutaOutraRegraNova('E');
            if flgpasso then  ExibePasso;
            inc(iAlgorAtual);
          end else

// RECEBE VALOR DO USUARIO PARA VARIAVEL (INPUT)
            if aAlgorTipo[iAlgorAtual] = '10' then begin

              FazInput(iAlgorAtual);

              if flgpasso then  ExibePasso;
              inc(iAlgorAtual);
            end else

// SAIR DA REGRA
              if aAlgorTipo[iAlgorAtual] = '12' then begin
                bfim:=true;
                if flgpasso then  ExibePasso;
                if aAlgorValor[ialgoratual] = 'ERRO' then FError:=true;
                iAlgorAtual := 400;
                fqueryin.last;
                sairdaregra :=true;
              end else

// EXIBE MENSAGEM
                if aAlgorTipo[iAlgorAtual] = '13' then begin
                  FPassonumber        := aAlgorRegra[iAlgorAtual]; //SOL 136806 Kintana 820407
                  ExibeMsg(aAlgorValor[iAlgorAtual],aAlgorcampo[iAlgorAtual]);  //Faz Atribuição do número recebido
                  if flgpasso then  ExibePasso;
                  inc(iAlgorAtual);
                end else
// IR PARA DETERMINADO PASSO
                  if aAlgorTipo[iAlgorAtual] = '15' then begin
                    if flgpasso then  ExibePasso;
                    iAlgoratual := pegaidalgor(strtoint(aAlgorsubseqtrue[iAlgoratual]));
                  end else
// GRAVA NA MEMORIA DE CALCULO
                    if aAlgorTipo[iAlgorAtual] = '16' then begin
                      GravaCalculo;
                      if flgpasso then  ExibePasso;
                      inc(ialgorAtual);
                    end else begin
// ERRO TIPO DE PASSO NAO EXISTE
                      bFim := True;
                      if aAlgorValor[ialgoratual] = 'ERRO' then FError:=true;
                    End;
     //Fanuel Junior SOL144511 Kintana952230 - Fim
      If bFim <> True then Begin
        i := i + 1;
      end;

      if sairdaregra then begin
        bfim:=true;
      end;

     end;
    end;//Case - prosseguir
   end;//Case

// FIM DO PROCESSAMENTO DOS PASSOS, CASO REGRA NÃO POSSUA PROPRIA QUERY
  end;

  Result:=ExecutaOutraRegraNova('D'); { Apenas Retira a Regra da Memoria }

  Result:=TrocaVirgulaPonto(FResult);
  SetVariavel(aAlgorcampo[iAlgorAtual],Fresult,aAlgorcampo[iAlgorAtual]);
end;



function TRegra.ADICIONALDIA(Formula : String) : String;
var
   vSql, vData, vCodItem, vFormulaAux, sConsideraData : String;
   i : word;
begin
  Result      := '0';
  sConsideraData := '0';

  vFormulaAux := Copy(Formula,14,Length(Formula));
  vFormulaAux := Copy(vFormulaAux,1,Length(vFormulaAux)-1);

  i           := Pos(',',vFormulaAux);
  vData       := Copy(vFormulaAux,1,I-1);
  vData       := PegaValor(vData);

  vFormulaAux := Copy(vFormulaAux,i+1,Length(vFormulaAux));

  i           := Pos(',',vFormulaAux);
  If I = 0 Then I := Length(vFormulaAux) Else I := (I-1);  { Acerta posicao }
  vCodItem    := Copy(vFormulaAux,1,I);
  vCodItem    := PegaValor(vCodItem);
  vFormulaAux := Copy(vFormulaAux,i+2,Length(vFormulaAux));

  i           := Pos(',',vFormulaAux);
  If I = 0 Then I := Length(vFormulaAux) Else I := (I-1);  { Acerta posicao }
  sConsideraData    := Copy(vFormulaAux,1,I);
  sConsideraData    := PegaValor(sConsideraData);

  try
    fQueryIn.FieldByName('IDPESSOA').AsString;
  except
    MsgDlgRegra('Campo IDPESSOA Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
    Exit;
  end;

  vSql := ' SELECT  E.DATAINICIO, E.DATAFINAL, E.PERCATS, E.PERCINSALUB, E.PERCPERICUL, E.PERC1AC, '+
          '         E.PERC2AC,  E.PERCADNOT, E.PERCINCORP '+
          ' FROM    EVOLFUNCPREV E                         '+
          ' WHERE  (E.DATAINICIO <= TO_DATE('''+vData+''',''DD/MM/YYYY'') ) ';

  If sConsideraData <> '1' Then
    vSQL := vSQL +
          ' AND    ((E.DATAFINAL  >= TO_DATE('''+vData+''',''DD/MM/YYYY'')) OR (E.DATAFINAL IS NULL) ) ';

  vSQL := vSQL +
          ' AND    (E.IDPESSOA  = '+fQueryIn.FieldByName('IDPESSOA').AsString+') ';

  if  vCodItem = 'T' then
    vSQL := vSQL +' AND (E.PERCATS > 0) AND (E.PERCATS IS NOT NULL) '
  else if vCodItem = 'P' then
    vSQL := vSQL +' AND (E.PERCPERICUL > 0) AND (E.PERCPERICUL IS NOT NULL) ' 
  else if vCodItem = 'I' then                                                 
    vSQL := vSQL +' AND (E.PERCINSALUB > 0) AND (E.PERCINSALUB IS NOT NULL) '
  else if ((vCodItem = 'C') or (vCodItem = 'C2')) then 
    vSQL := vSQL +' AND (E.PERC1AC > 0) AND (E.PERC1AC IS NOT NULL) '
  else if vCodItem = 'N' then  
    vSQL := vSQL +' AND (E.PERCADNOT > 0) AND (E.PERCADNOT IS NOT NULL) '
  else if vCodItem = 'A' then 
    vSQL := vSQL +' AND (E.PERCINCORP > 0) AND (E.PERCINCORP IS NOT NULL) ';

  If sConsideraData = '1' Then
    vSQL := vSQL + ' ORDER BY E.DATAINICIO DESC '
  Else
    vSQL := vSQL + ' ORDER BY E.DATAINICIO, E.DATAFINAL DESC ';

  with QueryRegraAux do begin
    Close;
    Sql.Clear;
    Sql.Add(vSql);
    Open;
    First;
    if IsEmpty then
      Result := '0'
    else begin
      if      UpperCase(vCodItem) = 'T' then
        Result := OraNumero(QueryRegraAux.FieldbyName('PERCATS').AsString)
      else if UpperCase(vCodItem) = 'P' then
        Result := OraNumero(QueryRegraAux.FieldbyName('PERCPERICUL').AsString)
      else if UpperCase(vCodItem) = 'I' then
        Result := OraNumero(QueryRegraAux.FieldbyName('PERCINSALUB').AsString)
      else if UpperCase(vCodItem) = 'C' then
        Result := OraNumero(QueryRegraAux.FieldbyName('PERC1AC').AsString) 
      else if UpperCase(vCodItem) = 'C2' then
        Result := OraNumero(QueryRegraAux.FieldbyName('PERC1AC').AsString)
                  +'/'+OraNumero(QueryRegraAux.FieldbyName('PERC2AC').AsString)
      else if UpperCase(vCodItem) = 'N' then
        Result := OraNumero(QueryRegraAux.FieldbyName('PERCADNOT').AsString) 
      else if UpperCase(vCodItem) = 'A' then 
        Result := OraNumero(QueryRegraAux.FieldbyName('PERCINCORP').AsString);
    end;

  end; { with }

end;

{------------------------------------------------------------------------------}
// ADICIONALMES ( DATAREF, TIPO_ADICIONAL , SEQUENCIA, VARIAVELRETORNO1, VARIAVELRETORNO2 )
//         Esta fórmula irá retornar o valor do ADICIONAL (item tipo 5) (VARIAVELRETORNO1)
//         e o número de dias válidos para a sequência indicada como parâmetro no mês
//         do parâmetro DATAREF.
//         Caso não encontre, ou o usuário informou igual a 2 e a função só retornou
//         uma vez por exemplo, tanto a VARIAVELRETORNO1 quanto a VARIAVELRETORNO2
//         deverão ser retornadas com valor ZERO.
function TRegra.ADICIONALMES(Formula : String) : String;
var
  vSql, vData, vSeq, vVar1, Op1, vVar2, Op2,
  vFormulaAux, vCodItem, sDataFinal : String;
  i : LongInt;
  wDia, wMes, wAno : Word;
begin
  Result := '0';
  vFormulaAux := Copy(Formula,14,Length(Formula));
  vFormulaAux := Copy(vFormulaAux,1,Length(vFormulaAux)-1);

  i := Pos(',',vFormulaAux);
  vData := Copy(vFormulaAux,1,i-1);
  vData := PegaValor(vData);
  vFormulaAux := Copy(vFormulaAux,i+1,Length(vFormulaAux));

  i := Pos(',',vFormulaAux);
  vCodItem := Copy(vFormulaAux,1,i-1);
  vCodItem := PegaValor(vCodItem);
  vFormulaAux := Copy(vFormulaAux,i+1,Length(vFormulaAux));

  i := Pos(',',vFormulaAux);
  vSeq := Copy(vFormulaAux,1,i-1);
  vSeq := PegaValor(vSeq);
  try
    StrtoInt(vSeq);
  except
    vSeq := '1';
  end;

  if StrtoInt(vSeq) < 1 then vSeq := '1';

  vFormulaAux := Copy(vFormulaAux,i+1,Length(vFormulaAux));

  i := Pos(',',vFormulaAux);
  vVar1 := Copy(vFormulaAux,1,i-1);
  if Copy(vVar1,1,1) = '@' then
    vVar1 := Copy(vVar1,2,Length(vVar1));

  vFormulaAux := Copy(vFormulaAux,i+1,Length(vFormulaAux));

  vVar2 := Copy(vFormulaAux,1,Length(vFormulaAux)-1 );

  if Copy(vVar2,1,1) = '@' then vVar2 := Copy(vVar2,2,Length(vVar2));

  // vFormulaAux := Copy(vFormulaAux,i+1,Length(vFormulaAux));

  try
    fQueryIn.FieldByName('IDPESSOA').AsString;
  except
    MsgDlgRegra('Campo IDPESSOA Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
    Exit;
  end;

  vSQL := ' SELECT E.IDFUNCAO , E.DATAINICIO, E.DATAFINAL, E.PERCATS, E.PERCINSALUB, E.PERCPERICUL, E.PERC1AC, '+
          '        E.PERCADNOT, E.PERCINCORP              '+
          ' FROM   EVOLFUNCPREV E                                   '+
          ' WHERE (E.IDPESSOA = '+fQueryIn.FieldByName('IDPESSOA').AsString+') '+

          //BRUNO AZEVEDO SOL 144420 kintana 950898
          ' AND   (TO_CHAR(E.DATAINICIO,''YYYY/MM'') <= '''+vData+''') '+
          ' AND   ((TO_CHAR(E.DATAFINAL, ''YYYY/MM'') >= '''+vData+''') OR (E.DATAFINAL IS NULL) ) ';

         // ' AND (TO_CHAR(E.DATAINICIO, ''YYYY/MM'') <= to_char(to_date('''+vData+'''),''YYYY/MM'')) '+
         // ' AND ((TO_CHAR(E.DATAFINAL, ''YYYY/MM'') >= to_char(to_date('''+vData+'''),''YYYY/MM'')) OR (E.DATAFINAL IS NULL)) ';
          //BRUNO AZEVEDO SOL 144420 kintana 950898
          
  if     vCodItem = 'T' then
   vSQL := vSQL +' AND (E.PERCATS > 0) AND (E.PERCATS IS NOT NULL) '
  else if vCodItem = 'P' then
    vSQL := vSQL +' AND (E.PERCPERICUL > 0) AND (E.PERCPERICUL IS NOT NULL) '  
  else if vCodItem = 'I' then                                                  
    vSQL := vSQL +' AND (E.PERCINSALUB > 0) AND (E.PERCINSALUB IS NOT NULL) '
  else if ((vCodItem = 'C') or (vCodItem = 'C2')) then   
    vSQL := vSQL +' AND (E.PERC1AC > 0) AND (E.PERC1AC IS NOT NULL) '
  else if vCodItem = 'N' then  
    vSQL := vSQL +' AND (E.PERCADNOT > 0) AND (E.PERCADNOT IS NOT NULL) '
  else if vCodItem = 'A' then 
    vSQL := vSQL +' AND (E.PERCINCORP > 0) AND (E.PERCINCORP IS NOT NULL) ';

  vSQL := vSQL + ' ORDER BY E.DATAINICIO DESC, E.DATAFINAL DESC ';

  with QueryRegraAux do begin
    Close;
    Sql.Clear;
    Sql.Add(vSql);
    Open;
  end;

  if StrToInt(vSeq) > QueryRegraAux.RecordCount then begin
    Op1 := '0';
    Op2 := '0';
  end else begin
    QueryRegraAux.First;
    if StrtoInt(vSeq) > 1 then QueryRegraAux.MoveBy(StrtoInt(vSeq)-1);

    if vCodItem = 'T' then
      Result := OraNumero(QueryRegraAux.FieldbyName('PERCATS').AsString)
    else if vCodItem = 'P' then
      Result := OraNumero(QueryRegraAux.FieldbyName('PERCPERICUL').AsString)
    else if UpperCase(vCodItem) = 'I' then
      Result := OraNumero(QueryRegraAux.FieldbyName('PERCINSALUB').AsString)
    else if UpperCase(vCodItem) = 'C' then
      Result := OraNumero(QueryRegraAux.FieldbyName('PERC1AC').AsString) 
    else if UpperCase(vCodItem) = 'N' then
      Result := OraNumero(QueryRegraAux.FieldbyName('PERCADNOT').AsString) 
    else if UpperCase(vCodItem) = 'A' then 
      Result := OraNumero(QueryRegraAux.FieldbyName('PERCINCORP').AsString);

    { Decodifica Data Inicio }
    DecodeDate(QueryRegraAux.Fieldbyname('DATAINICIO').AsDateTime, wAno, wMes, wDia);

    { Caso não tenha data final usa o ultimo dia do mês }
    sDataFinal := QueryRegraAux.Fieldbyname('DATAFINAL').AsString;
    If Trim(sDataFinal) = '' Then Begin
      sDataFinal := DateToStr(DiasUteis.UltDiaMes(wAno, wMes));
    End;

    { * Usava a Formula DIFMESES erroneamente * }

    { Calcula diferenca de dias entre as datas de inicio e fim do processamento }
    sFormulaAux:='DIFDIAS(#'+sDataFinal+',#'+
                             QueryRegraAux.Fieldbyname('DATAINICIO').AsString+',1)';
    { executa a formula DIFDIAS }
    fResult := DIFDIAS(sFormulaAux);


    { Seta Resultado }
    Op1 := fResult;
    Op2 := Result;                                        
  end;
  SetVariavel(vVar1,Op1,vVar1);
  SetVariavel(vvar2,Op2,vvar2);
  
end;

//  BUSCAPCS(TipoDeBusca, CodigoCargo<opcional>)
function TRegra.BUSCAPCS(Formula : string ) : string;
var vTipoBusca, vCodCargo         : string;
    vSQL, vFormulaAux             : string;
    i                             : word;
begin
   Result := '0';

   vFormulaAux := Copy(Formula,10,Length(Formula));
   vFormulaAux := Copy(vFormulaAux,1,Length(vFormulaAux)-1);

   i           := Pos(',',vFormulaAux);
   vTipoBusca  := Copy(vFormulaAux,1,i-1);
   vFormulaAux := Copy(vFormulaAux,i+1,Length(vFormulaAux));

   if vTipoBusca = 'C'
   then begin
      vCodCargo := vFormulaAux;
      vCodCargo := PegaValor(vCodCargo);
   end
   else vCodCargo := '';
// Fim da Decodificacao da Formula
//------------------------------------------------------------------------------

   if vTipoBusca = 'C'
   then vSQL := ' SELECT P.CODIGO '+
                ' FROM   PCS P, CARGOEXT C '+
                ' WHERE (RTRIM(C.CODIGO) = '''+Trim(vCodCargo)+''') '+
                ' AND   (P.IDPCS  = C.IDPCS) '
   else vSQL := ' SELECT P.CODIGO '+
                ' FROM   PCS P, CARGOEXT C, ELEGPATRO EL '+
                ' WHERE  EL.IDPESSJUR = '+QueryIn.FieldbyName('IDPESSJUR').AsString +
                ' AND    EL.IDPESSOA  = '+QueryIn.FieldbyName('IDPESSOA').AsString +
                ' AND    C.IDCARGOEXT = EL.IDCARGOEXT '+
                ' AND    P.IDPCS      = C.IDPCS ';

   with QueryRegraAux do
   begin
      Close;
      Sql.Clear;
      Sql.Add(vSql);
      Open;

      if not IsEmpty
      then Result := FieldByName('CODIGO').AsString;
      Close;
   end;
end;


{------------------------------------------------------------------------------}
// VALORCF(TIPO, DATAREF, CODIGO, MODOFUNÇÃO)
function TRegra.VALORCF(Formula : String) : String;
var
   vSql, vData, vTipo, vFormulaAux : string;
   vCodigo : string;
   sIdPessoa, sIdPessJur, sIdNivel, sIdFuncao  : String;
   vPisoMercado ,vPisoMercadoLic , Op1, Op2:String; 
   vModo   : string;
   i : LongInt;
begin
   vPisoMercado := '';
   vPisoMercadoLic := '';
   Result := '0';

   vFormulaAux := Copy(Formula,9,Length(Formula));
   vFormulaAux := Copy(vFormulaAux,1,Length(vFormulaAux)-1);

   i     := Pos(',',vFormulaAux);
   vTipo := Copy(vFormulaAux,1,i-1);
   vTipo := PegaValor(vTipo);
   vFormulaAux := Copy(vFormulaAux,i+1,Length(vFormulaAux));

   i := Pos(',', vFormulaAux);
   if i > 0 // tem o parametro opcional
   then begin
      vData          := Copy(vFormulaAux,1,i-1);
      vData          := PegaValor(vData);
      vFormulaAux    := Copy(vFormulaAux,i+1,Length(vFormulaAux));

      I := Pos(',', vFormulaAux);
      if i > 0
      then begin
         vCodigo     := Copy(vFormulaAux,1,i-1);
         vCodigo     := PegaValor(vCodigo);
         vFormulaAux := Copy(vFormulaAux,I+1,Length(vFormulaAux));

         I := Pos(',',vFormulaAux);
         If I > 0 Then Begin
            vModo := Copy(vFormulaAux,1,I-1);
            vModo := PegaValor(vModo);
            vFormulaAux := Copy(vFormulaAux,I+1,Length(vFormulaAux));

            { Guarda Piso Mercado (Opcional) }
            I := Pos(',',vFormulaAux);
            If I > 0 Then Begin
               vPisoMercado := Copy(vFormulaAux,1,I-1);
               if copy(vPisoMercado,1,1) = '@' Then
                  vPisoMercado := copy(vPisoMercado,2,length(vPisoMercado));
               vFormulaAux := Copy(vFormulaAux,I+1,Length(sFormulaAux));

              { Guarda Piso Mercado Licenciado (Opcional) }
              vPisoMercadoLic := Copy(vFormulaAux,1,Length(vFormulaAux));
              if copy(vPisoMercadoLic,1,1) = '@' Then
                 vPisoMercadoLic := copy(vPisoMercadoLic,2,length(vPisoMercadoLic));
            End
            Else Begin
               vPisoMercado := Copy(vFormulaAux,1,Length(vFormulaAux));
               if copy(vPisoMercado,1,1) = '@' Then
                  vPisoMercado := copy(vPisoMercado,2,length(vPisoMercado));
               vFormulaAux := Copy(vFormulaAux,I+1,Length(vFormulaAux));
            End;

         End
         Else Begin
         vModo       := Copy(vFormulaAux,i+1, Length(vFormulaAux));
            vModo := PegaValor(vModo);
         End;
      end
      else begin // não tem o parametro FUNÇÃO
         vCodigo     := Copy(vFormulaAux,i+1, Length(vFormulaAux));
         vCodigo     := PegaValor(vCodigo);
         vModo       := '';
      end;
   end
   else begin // NAO tem o parametro opcional
      vData       := Copy(vFormulaAux,1,Length(vFormulaAux));
      vData       := PegaValor(vData);
      vCodigo     := '';
      vModo       := '';
   end;

   try
      fQueryIn.FieldByName('IDPESSOA').AsString;
   except
      MsgDlgRegra('Campo IDPESSOA Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
      Exit;
   end;

   sIdPessJur   := FQueryIn.FieldByName('IDPESSJUR').AsString;
   sIdPessoa    := FQueryIn.FieldByName('IDPESSOA').AsString;

   if Trim(vCodigo) = ''
   then begin
      if vTipo = 'C' // Cargo
      then begin
          vSQL := ' SELECT E.DATAINICIO, E.DATAFINAL, CN.IDCARGOEXT, CN.IDNIVEL '+
                  ' FROM   CARGOXNIVEL CN, EVOLFUNCPREV E,     '+
                  '       (SELECT MAX(DATAINICIO) DATAINICIO   '+
                  '        FROM   EVOLFUNCPREV                 '+
                  '        WHERE  IDPESSOA = '+sIdPessoa+
                  '        AND    IDPESSJUR     = '+sidPessJur+
                  '        AND    DATAINICIO <= TO_DATE('''+vData+''',''DD/MM/YYYY'')'+
                  '        AND    (DATAFINAL >= TO_DATE('''+vData+''',''DD/MM/YYYY'''+') OR (DATAFINAL IS NULL)) '+
                  '        AND    IDCARGOEXT IS NOT NULL '+
                  '       ) ULTC '+
                  ' WHERE  E.IDPESSOA      = '+sIdPessoa+
                  ' AND    E.IDPESSJUR     = '+sIdPessJur+
                  ' AND    E.DATAINICIO    = ULTC.DATAINICIO  '+
                  ' AND    E.IDCARGOEXT IS NOT NULL           '+
                  ' AND    E.IDPESSJURCG   = CN.IDPESSJUR     '+
                  ' AND    E.IDCARGOEXT    = CN.IDCARGOEXT    '+
                  ' ORDER BY E.DATAINICIO, E.DATAFINAL DESC   ';
      end
      else begin
          vSQL := ' SELECT E.DATAINICIO, E.DATAFINAL, E.IDFUNCAO, E.IDFUNCAO, E.MODOFUNCAO '+
                  ' FROM   EVOLFUNCPREV E,     '+
                  '       (SELECT MODOFUNCAO, MAX(DATAINICIO) DATAINICIO   '+
                  '        FROM   EVOLFUNCPREV                 '+
                  '        WHERE  IDPESSOA = '+sIdPessoa+
                  '        AND    IDPESSJUR     = '+sIdPessJur+
                  '        AND    DATAINICIO <= TO_DATE('''+vData+''',''DD/MM/YYYY'')'+
                  '        AND    (DATAFINAL >= TO_DATE('''+vData+''',''DD/MM/YYYY'''+') OR (DATAFINAL IS NULL)) '+
                  '        AND    IDFUNCAO  IS NOT NULL '+
                  '        AND    PERC1AC   IS NULL     ';
          if Trim(vModo) <> ''
          then vSQL := vSQL + ' AND MODOFUNCAO = '''+vModo+'''';

          vSQL := vSQL + '  GROUP BY MODOFUNCAO ) ULTC '+
                  ' WHERE  E.IDPESSOA      = '+sIdPessoa+
                  ' AND    E.IDPESSJUR     = '+sIdPessJur+
                  ' AND    E.DATAINICIO    = ULTC.DATAINICIO  '+
                  ' AND    E.MODOFUNCAO    = ULTC.MODOFUNCAO '+
                  ' AND    E.IDFUNCAO IS NOT NULL             '+
                  ' AND    E.PERC1AC  IS NULL                 '+
                  ' ORDER BY E.DATAINICIO, E.DATAFINAL DESC   ';
      end;

      FazQuery(QueryRegraAux, vSQL);
      if QueryRegraAux.IsEmpty then Exit;
   end
   else begin
      if vTipo = 'C' // Cargo    
      then begin
          vSQL := ' SELECT CN.IDCARGOEXT, CN.IDNIVEL, CN.DATAVIGENCIA '+
                  ' FROM   CARGOXNIVEL CN, CARGOEXT C      '+
                  ' WHERE  RTRIM(C.CODIGO) = '''+vCodigo+''''+
                  ' AND    C.IDPESSJUR     = CN.IDPESSJUR     '+
                  ' AND    C.IDCARGOEXT    = CN.IDCARGOEXT    '+
                  ' AND    C.TIPO          = '+ '''C''' +     //SOL 147164 Kintana 1012127
                  ' AND    CN.DATAVIGENCIA <= TO_DATE('''+vData+''',''DD/MM/YYYY'')'+
                  ' AND    (CN.DATAFIM >= TO_DATE('''+vData+''',''DD/MM/YYYY'')'+' OR (CN.DATAFIM IS NULL)) '+

                  ' ORDER BY CN.DATAVIGENCIA DESC ';
      end
      else begin
          vSQL := ' SELECT C.IDCARGOEXT AS IDFUNCAO     '+
                  ' FROM   CARGOEXT C                   '+
                  ' WHERE  RTRIM(C.CODIGO) = '''+vCodigo+''''+
                  ' AND    C.TIPO  = '+ '''F''' ;   //SOL 147164 Kintana 1012127
      end;

      FazQuery(QueryRegraAux, vSQL);
      if QueryRegraAux.IsEmpty then Exit;
   end;

   // Buscar valor do cargo
   if vTipo = 'C' then begin
     sIdNivel := QueryRegraAux.FieldByName('IDNIVEL').AsString;

     vSQL := ' SELECT F.VALOR FROM FAIXANIVEL F '+
                ' WHERE F.IDPESSJUR= '''+sIdPessJur   +''' '+
                ' AND   F.IDNIVEL  = '''+sIdNivel+''' '+
                ' AND   F.DATAEFETIVACAO IN ( SELECT MAX(DATAEFETIVACAO) FROM FAIXANIVEL '+  // SOL 241785 PPM 560820
                '                            WHERE IDPESSJUR= '''+sIdPessJur   +''''+
                '                            AND   IDNIVEL  = '''+sIdNivel+''''+
                '                            AND   TO_CHAR(DATAEFETIVACAO,''YYYY/MM'') <= '+
                '                                  TO_CHAR(TO_DATE('''+vData+''',''DD/MM/YYYY''),''YYYY/MM'')'+
                '                           ) '
   end else begin
     sIdFuncao := QueryRegraAux.FieldByName('IDFUNCAO').AsString;
     //INICIO Rodrigo de Brito Figueredo  SOL 183363 KINTANA 1713362
     vSQL :=  {' SELECT F.VALOR, F.PISOMERCADO, F.PISOMERCADOLIC FROM FAIXAGRUPO F, GRUPOCARGOEXT G '+
                ' WHERE G.IDPESSJUR   = '''+sIdPessJur   +''' '+
                ' AND   G.IDCARGOEXT  = '+QuotedStr(sIdFuncao)+' '+
                ' AND   F.DATAEFETIVACAO IN ( SELECT MAX(DATAEFETIVACAO) FROM FAIXAGRUPO F, GRUPOCARGOEXT G '+
                '                            WHERE G.IDPESSJUR   = '''+sIdPessJur+''' '+
                '                            AND   G.IDCARGOEXT  = '+QuotedStr(sIdFuncao)+' '+
                '                            AND   F.IDPESSJUR   = G.IDPESSJUR  '+
                '                            AND   F.IDGRUPOFUNC = G.IDGRUPOFUNC '+
                '                            AND   G.DATAVIGENCIA <= TO_DATE('''+vData+''',''DD/MM/YYYY'') '+
                '                            AND   ((G.DATAFIM >= TO_DATE('''+vData+''',''DD/MM/YYYY'') ) OR (G.DATAFIM IS NULL)) '+
                '                            AND   TO_CHAR(F.DATAEFETIVACAO,''YYYY/MM'') <= '+
                '                                  TO_CHAR(TO_DATE('''+vData+''',''DD/MM/YYYY''),''YYYY/MM'')'+
                '                           ) '+
                ' AND   F.IDPESSJUR   = G.IDPESSJUR  '+
                ' AND   F.IDGRUPOFUNC = G.IDGRUPOFUNC '+
                ' AND   G.DATAVIGENCIA <= TO_DATE('''+vData+''',''DD/MM/YYYY'') '+
                ' AND   ((G.DATAFIM >= TO_DATE('''+vData+''',''DD/MM/YYYY'') ) OR (G.DATAFIM IS NULL)) ';}
         ' SELECT VALOR, PISOMERCADO, PISOMERCADOLIC FROM ( '+
                        ' SELECT F.VALOR, F.PISOMERCADO, F.PISOMERCADOLIC, f.dataefetivacao '+
                        '   FROM FAIXAGRUPO F, GRUPOCARGOEXT G '+
         ' WHERE G.IDPESSJUR = '''+sIdPessJur+''' '+
         '   AND G.IDCARGOEXT = '+QuotedStr(sIdFuncao)+' '+
         '   AND F.DATAEFETIVACAO IN '+
         '      (SELECT MAX(DATAEFETIVACAO) '+
         '          FROM FAIXAGRUPO F, GRUPOCARGOEXT G '+
         '         WHERE G.IDPESSJUR = '''+sIdPessJur   +''' '+
         '           AND G.IDCARGOEXT = '+QuotedStr(sIdFuncao)+' '+
         '           AND F.IDPESSJUR = G.IDPESSJUR '+
         '           AND F.IDGRUPOFUNC = G.IDGRUPOFUNC '+
         '           AND G.DATAVIGENCIA <= TO_DATE('''+vData+''',''DD/MM/YYYY'') '+
         '           AND ((G.DATAFIM >= TO_DATE('''+vData+''',''DD/MM/YYYY'')) OR '+
         '               (G.DATAFIM IS NULL)) '+
         '           AND TO_CHAR(F.DATAEFETIVACAO, ''YYYY/MM'') <= '+
         '               TO_CHAR(TO_DATE('''+vData+''',''DD/MM/YYYY''), ''YYYY/MM'')) '+
         '   AND F.IDPESSJUR = G.IDPESSJUR '+
         '   AND F.IDGRUPOFUNC = G.IDGRUPOFUNC '+
         '   AND G.DATAVIGENCIA <= TO_DATE('''+vData+''',''DD/MM/YYYY'') '+
         '   AND ((G.DATAFIM >= TO_DATE('''+vData+''',''DD/MM/YYYY'')) OR '+
         '       (G.DATAFIM IS NULL)) '+
        ' UNION ALL '+
        ' SELECT f.valor, 0 AS PISOMERCADO, 0 AS PISOMERCADOLIC, f.dataefetivacao '+
        ' FROM cargoext c, faixafuncao f '+
        ' WHERE c.idpessjur = '''+sIdPessJur   +''' '+
        ' AND   c.idcargoext = '+QuotedStr(sIdFuncao)+' '+
        ' AND   c.tipo = ''F'' '+
        ' AND   f.idpessjur = c.idpessjur '+
        ' AND   f.idcargoext = c.idcargoext '+
        ' AND   f.dataefetivacao = (SELECT MAX(ff.dataefetivacao) '+
        '                           FROM faixafuncao ff '+
        '                           WHERE ff.idcargoext = c.idcargoext '+
        '                           AND   ff.dataefetivacao <= TO_DATE('''+vData+''',''DD/MM/YYYY'')) '+
        ' ORDER BY DATAEFETIVACAO DESC) '+
        ' WHERE ROWNUM = 1 ';
        //FIM Rodrigo de Brito Figueredo  SOL 183363 KINTANA 1713362
   end;
   FazQuery(QueryRegraAux, vSQL);

   If QueryRegraAux.IsEmpty Then begin
     Op1 := '0';
     Op2 := '0';
   End
   Else
   Begin
     If vTipo <> 'C' Then
     Begin
     If QueryRegraAux.FieldByName('PISOMERCADO').AsString = '' Then
        Op1 := '0'
     Else
        Op1 := QueryRegraAux.FieldByName('PISOMERCADO').AsString;

     If QueryRegraAux.FieldByName('PISOMERCADOLIC').AsString = '' Then
        Op2 := '0'
     Else
        Op2 := QueryRegraAux.FieldByName('PISOMERCADOLIC').AsString;
   End;
   End;

   If vPisoMercado <> '' Then
      SetVariavel(vPisoMercado, Op1, vPisoMercado);

   If vPisoMercadoLic <> '' Then
      SetVariavel(vPisoMercadoLic, Op2, vPisoMercadoLic);

   Result := FloatToStr(QueryRegraAux.FieldByName('VALOR').AsFloat );
end;

{------------------------------------------------------------------------------}
function TRegra.CFPESSOA(Formula : String) : String;
Var
  vDifMeses, Op1, Op2, Op3,
  vSql, vTipo, vData, vSeq, sAux,
  vVar1, vVar2, vVar3, vFormulaAux {, vCodItemPCS }: String;
  i, i2 : LongInt;
  vDifDias,
  vCodigo,
  sSomenteCFAtivos, sUltDiaMes : string;
  vModo      : string; 
  VetModo : Array[0..10] Of String;
  vDataFim: String; //BRUNO AZEVEDO SOL 179822 KINTANA 1659539
begin
//------------------------------------------------------------------------------
// Decodifica a Formula
  vFormulaAux := Copy(Formula,10,Length(Formula));
  vFormulaAux := Copy(vFormulaAux,1,Length(vFormulaAux)-1);

// Guarda a Data de Referencia
  I := Pos(',',vFormulaAux);
  vData := Copy(vFormulaAux,1,I-1);
  vData := PegaValor(vData);
  vFormulaAux := Copy(vFormulaAux,I+1,Length(vFormulaAux));

// Guarda Tipo de Item de Calculo
  I := Pos(',',vFormulaAux);
  vTipo := Copy(vFormulaAux,1,I-1);
  vTipo := PegaValor(vTipo);
  vTipo := UpperCase(vTipo);
  
  vFormulaAux := Copy(vFormulaAux,I+1,Length(vFormulaAux));

// Guarda Sequencia
  I := Pos(',',vFormulaAux);
  vSeq := Copy(vFormulaAux,1,I-1);
  vSeq := PegaValor(vSeq);

  Try
    StrtoInt(vSeq);
  Except
    vSeq := '1';
  End;
// Caso a sequencia seja menor que um ??????
  If StrtoInt(vSeq) < 1 Then vSeq := '1';

// GUARDA AS DUAS VARIAVEIS DE RETORNO

// Guarda Variavel de Retorno 1
  vFormulaAux := Copy(vFormulaAux,I+1,Length(vFormulaAux));
  I := Pos(',',vFormulaAux);
  vVar1 := Copy(vFormulaAux,1,I-1);
// Caso venha com @ na frente tira
  If Copy(vVar1,1,1) = '@' Then vVar1 := Copy(vVar1,2,Length(vVar1));

// Guarda Variavel de Retorno 2
  vFormulaAux := Copy(vFormulaAux,i+1,Length(vFormulaAux));
  i := Pos(',', vFormulaAux);

  if i > 0 // entao tem variavel 2 e 3
  then begin
     vVar2 := Copy(vFormulaAux,1,i-1);
     vFormulaAux := Copy(vFormulaAux,i+1,Length(vFormulaAux));

     // Verificar se tem o ultimo parametro opcional ( CODITEMPCS )
     i := Pos(',', vFormulaAux);
     if i > 0 then begin // tem o parametro opcional
        vVar3 := Copy(vFormulaAux, 1, i-1);

        vFormulaAux := Copy(vFormulaAux,i+1,Length(vFormulaAux));
        I := Pos(',', vFormulaAux);
        If ( Pos(']', vFormulaAux) > 0 ) Then I := ( Pos(']', vFormulaAux) + 1 ) ;

        If ( I > 0 )
        Then vModo := Copy(vFormulaAux, 1, i-1)
        Else vModo := Copy(vFormulaAux, I+1, Length(vFormulaAux));
     end else begin
        vVar3 := Copy(vFormulaAux, 1, Length(vFormulaAux));
        vModo := ''; 
     end;
  end
  else begin // não tem variavel 3
     vVar2       := vFormulaAux;
     vVar3       := '';
     // vCodItemPCS := '';
     vModo := ''; 
  end;
// Caso venha com @ na frente tira
  If Copy(vVar2,1,1) = '@' then vVar2 := Copy(vVar2,2,Length(vVar2));
  If Copy(vVar3,1,1) = '@' then vVar3 := Copy(vVar3,2,Length(vVar3));

  I := Pos(']',vModo);
  If I > 0 Then Begin
    vModo := Copy(vModo,2,(I-1));
    I := Pos(']',vModo);
    vModo := Copy(vModo,1,(I-1));
    
    I2 := 0;
    Repeat
      I := Pos(',',vModo);
      If I > 0 then begin
        VetModo[I2] := PegaValor(Copy(vModo,1,(I-1)));
      End Else Begin
        VetModo[I2] := PegaValor(Copy(vModo,1,Length(vModo)));
        I := Length(vModo);
      End;
      Inc(I2);
      vModo := Copy(vModo,(I+1),Length(vModo))
    Until vModo = '';

    For I := 0 To I2 Do Begin
      If VetModo[I] <> '' Then vModo := vModo + QuotedStr(VetModo[I])+ ','
    End;
    vModo := Copy(vModo,1,(Length(vModo)-1));

  End;

  { Pegar SOMENTE_CF_ ATIVO}
  sSomenteCFAtivos := 'N';

  I := Pos(',', vFormulaAux);
  If ( Pos(']', vFormulaAux) > 0 ) Then I := ( Pos(']', vFormulaAux) + 1 ) ;

  If ( I > 0 ) Then Begin
    vFormulaAux := Copy( vFormulaAux, I+1, Length( vFormulaAux ) );
    sSomenteCFAtivos := Copy( vFormulaAux, 2, I );  //BRUNO AZEVEDO SOL 179822 KINTANA 1659539
  End;

  //BRUNO AZEVEDO SOL 179822 KINTANA 1659539
  I := Pos(',',vFormulaAux);
  If ( I > 0 ) Then Begin
    vFormulaAux := Copy( vFormulaAux, I+1, Length( vFormulaAux ) );
    vDataFim := Copy(vFormulaAux,1,Length( vFormulaAux ));
    vDataFim := PegaValor(vDataFim);
    vDataFim := Trim(vDataFim);
  end;
  //BRUNO AZEVEDO SOL 179822 KINTANA 1659539
  
  // Teste se IDPESSOA esta no SQL de Entrada (Obrigatorio)
  Try
    fQueryIn.FieldByName('IDPESSOA').AsString;
  Except
    MsgDlgRegra('Campo IDPESSOA Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
    Exit;
  End;

//----------------------------------------------------------------------------\\
// INICIA PROCESSAMENTO

   if vTipo = 'C' then begin         { Cargo }
       vSQL := ' SELECT E.IDPESSJURCG, E.IDCARGOEXT, E.DATAINICIO, E.MODOFUNCAO, '+
               '        DECODE(E.DATAFINAL, NULL, TO_DATE('''+vData+''',''DD/MM/YYYY''), E.DATAFINAL) AS DATAFINAL '+
               ' FROM   CARGOXNIVEL CN, EVOLFUNCPREV E,     '+
               //BRUNO AZEVEDO SOL 179822 KINTANA 1659539
               '       (SELECT DATAINICIO   '+
               //BRUNO AZEVEDO SOL 179822 KINTANA 1659539
               '        FROM   EVOLFUNCPREV                 '+
               '        WHERE  IDPESSOA = '+fQueryIn.FieldByName('IDPESSOA').AsString+
               '        AND    IDPESSJUR     = '+fQueryIn.FieldByName('IDPESSJUR').AsString+
               '        AND    DATAINICIO <= TO_DATE('''+vData+''',''DD/MM/YYYY'')';

       If ( sSomenteCFAtivos = 'S' ) Then Begin
         vSQL := vSQL + ' AND    (DATAFINAL IS NULL) ';
       //BRUNO AZEVEDO SOL 179822 KINTANA 1659539
       end else if (vDataFim <> '') then begin
         vSQL := vSQL + ' AND    (DATAFINAL >= TO_DATE('''+vDataFim+''',''DD/MM/YYYY'''+') OR (DATAFINAL IS NULL)) ';
       //BRUNO AZEVEDO SOL 179822 KINTANA 1659539
       End Else Begin
         vSQL := vSQL + ' AND    (DATAFINAL >= TO_DATE('''+vData+''',''DD/MM/YYYY'''+') OR (DATAFINAL IS NULL)) ';
       End;

       vSQL := vSQL +
               '        AND    IDCARGOEXT IS NOT NULL '+
               '       ) ULTC '+
               ' WHERE  E.IDPESSOA      = '+fQueryIn.FieldByName('IDPESSOA').AsString+
               ' AND    E.IDPESSJUR     = '+fQueryIn.FieldByName('IDPESSJUR').AsString+
               ' AND    E.DATAINICIO    = ULTC.DATAINICIO  '+
               ' AND    E.IDCARGOEXT IS NOT NULL           '+
               ' AND    E.IDPESSJURCG   = CN.IDPESSJUR     '+
               ' AND    E.IDCARGOEXT    = CN.IDCARGOEXT    '+
               //BRUNO AZEVEDO SOL 179822 KINTANA 1659539
               ' ORDER BY E.DATAINICIO DESC, E.DATAFINAL DESC   ';
               //BRUNO AZEVEDO SOL 179822 KINTANA 1659539

   end else if vTipo = 'F' then begin   { Função } 
       vSQL := ' SELECT E.IDPESSJURFG, E.IDFUNCAO,  E.DATAINICIO, E.MODOFUNCAO,     '+
               '        DECODE(E.DATAFINAL, NULL, TO_DATE('''+vData+''',''DD/MM/YYYY''), E.DATAFINAL) AS DATAFINAL '+
               ' FROM   EVOLFUNCPREV E,     '+
               //BRUNO AZEVEDO SOL 179822 KINTANA 1659539
               '       (SELECT DATAINICIO   '+
               //BRUNO AZEVEDO SOL 179822 KINTANA 1659539
               '        FROM   EVOLFUNCPREV                 '+
               '        WHERE  IDPESSOA = '+fQueryIn.FieldByName('IDPESSOA').AsString+
               '        AND    IDPESSJUR     = '+fQueryIn.FieldByName('IDPESSJUR').AsString+
               '        AND    DATAINICIO <= TO_DATE('''+vData+''',''DD/MM/YYYY'')';

       If ( sSomenteCFAtivos = 'S' ) Then Begin
         vSQL := vSQL + ' AND    (DATAFINAL IS NULL) ';
       //BRUNO AZEVEDO SOL 179822 KINTANA 1659539
       end else if (vDataFim <> '') then begin
         vSQL := vSQL + ' AND    (DATAFINAL >= TO_DATE('''+vDataFim+''',''DD/MM/YYYY'''+') OR (DATAFINAL IS NULL)) ';
       //BRUNO AZEVEDO SOL 179822 KINTANA 1659539
       End Else Begin
         vSQL := vSQL + ' AND    (DATAFINAL >= TO_DATE('''+vData+''',''DD/MM/YYYY'''+') OR (DATAFINAL IS NULL)) ';
       End;

       vSQL := vSQL + ' AND    IDFUNCAO  IS NOT NULL '+
               '        AND    PERC1AC  IS NULL ';

       if Trim(vModo) <> '' then begin
         if pos(',',vModo) <= 0  then
           vSQL := vSQL + ' AND MODOFUNCAO = '''+vModo+''''
         else
           vSQL := vSQL + ' AND MODOFUNCAO IN ('+vModo+')';
       end;

       vSQL := vSQL +        '       ) ULTC '+
               ' WHERE  E.IDPESSOA      = '+fQueryIn.FieldByName('IDPESSOA').AsString+
               ' AND    E.IDPESSJUR     = '+fQueryIn.FieldByName('IDPESSJUR').AsString+
               ' AND    E.DATAINICIO    = ULTC.DATAINICIO  '+
               ' AND    E.IDFUNCAO IS NOT NULL             '+
               ' AND    E.PERC1AC  IS NULL ';

       if Trim(vModo) <> '' then begin
         if pos(',',vModo) <= 0  then
           vSQL := vSQL + ' AND E.MODOFUNCAO = '''+vModo+''''
         else
           vSQL := vSQL + ' AND E.MODOFUNCAO IN ('+vModo+')';
       end;

       //BRUNO AZEVEDO SOL 179822 KINTANA 1659539
       vSQL := vSQL + ' ORDER BY E.DATAINICIO DESC, E.DATAFINAL DESC ';
       //BRUNO AZEVEDO SOL 179822 KINTANA 1659539

   end else if vTipo = 'AC' then begin   { Adicional Compensatório }
       vSQL := ' SELECT E.IDPESSJURFG, E.IDFUNCAO,  E.DATAINICIO, E.MODOFUNCAO,     '+
               '        DECODE(E.DATAFINAL, NULL, TO_DATE('''+vData+''',''DD/MM/YYYY''), E.DATAFINAL) AS DATAFINAL '+
               ' FROM   EVOLFUNCPREV E,     '+
               //BRUNO AZEVEDO SOL 179822 KINTANA 1659539
               '       (SELECT DATAINICIO   '+
               //BRUNO AZEVEDO SOL 179822 KINTANA 1659539
               '        FROM   EVOLFUNCPREV                 '+
               '        WHERE  IDPESSOA = '+fQueryIn.FieldByName('IDPESSOA').AsString+
               '        AND    IDPESSJUR     = '+fQueryIn.FieldByName('IDPESSJUR').AsString+
               '        AND    DATAINICIO <= TO_DATE('''+vData+''',''DD/MM/YYYY'')';
               //BRUNO AZEVEDO SOL 179822 KINTANA 1659539
               if (vDataFim <> '') then begin
                 vSQL := vSQL + ' AND    (DATAFINAL >= TO_DATE('''+vDataFim+''',''DD/MM/YYYY'''+') OR (DATAFINAL IS NULL)) ';
               end else begin
                 vSQL := vSQL + ' AND    (DATAFINAL >= TO_DATE('''+vData+''',''DD/MM/YYYY'''+') OR (DATAFINAL IS NULL)) ';
               end;
               //BRUNO AZEVEDO SOL 179822 KINTANA 1659539
                 vSQL := vSQL +
               '        AND    PERC1AC  IS NOT NULL '+
               '       ) ULTC '+
               ' WHERE  E.IDPESSOA      = '+fQueryIn.FieldByName('IDPESSOA').AsString+
               ' AND    E.IDPESSJUR     = '+fQueryIn.FieldByName('IDPESSJUR').AsString+
               ' AND    E.DATAINICIO    = ULTC.DATAINICIO  '+
               ' AND    E.PERC1AC IS NOT NULL           '+
               //BRUNO AZEVEDO SOL 179822 KINTANA 1659539
               ' ORDER BY E.DATAINICIO DESC, E.DATAFINAL DESC   ';
               //BRUNO AZEVEDO SOL 179822 KINTANA 1659539

   end else begin   { Outros sai da Regra com erro! }
     MsgDlgRegra('O Tipo "'+vTipo+'" não esta sendo tratado por esta Fórmula! ','CFPESSOA - Erro',
            mterror,[mbOk],0);
     FError := True;
     SairDaRegra := True;
     Exit;
   end;

  With QueryRegraAux do begin
    Close;
    Sql.Clear;
    Sql.Add(vSql);
    Open;
  end;

  // Caso a sequencia desejada seja maior que no numero de registros retornados
  // zera resposta
  if StrToInt(vSeq) > QueryRegraAux.RecordCount
  then begin
    Op1 := '0';
    Op2 := '0';
    Op3 := '';
  end
  else begin
    QueryRegraAux.First;
    if StrtoInt(vSeq) > 1
    then QueryRegraAux.MoveBy(StrtoInt(vSeq)-1);

    // Calcular o número de dias que o participante teve o cargo encontrado, no mês
    // da data de referencia
    // Se a data inicio e final forem no mesmo mes,
    // Entao o número de dias é a diferença em dias entre as duas datas
    // Senao o número de dias é a diferença entre a data de inicio e o ultimo dia do mês

    // Trabalhar com a vData, que é o primeiro dia do mes de referencia
    // Se ou a data de inicio ou a data final forem no mes que estou calculando ( mes de referencia )
    // armazenado na variavel vData, calcular a diferenca em dias
    // Exemplo : 1.) DataFinal  = 04/07/1999
    //               Formula    = DifDias(04/07/1999, 01/07/1999) onde 01/07/1999 = vData
    //           2.) DataInicio = 05/07/1999
    //               Formula    = DifDias(30/07/1999, 05/07/1999) onde 30/07/1999 = UltDiaMes
    //           3.) DataInicio = 04/07/1999 e DataFinal = 15/07/1999
    //               Formula    = DifDias(15/07/1999, 04/07/1999)


    if (Copy(QueryRegraAux.Fieldbyname('DATAINICIO').AsString,4,7) = Copy(vData,4,7) ) or
       (Copy(QueryRegraAux.Fieldbyname('DATAFINAL').AsString,4,7)  = Copy(vData,4,7) )
    then begin
       if Copy(QueryRegraAux.Fieldbyname('DATAINICIO').AsString,4,7) =
          Copy(QueryRegraAux.Fieldbyname('DATAFINAL').AsString,4,7)
       then begin
          sFormulaAux:='Difdias(#'+ QueryRegraAux.Fieldbyname('DATAINICIO').AsString+
                              ',#'+ QueryRegraAux.Fieldbyname('DATAFINAL').AsString+',1)';
       end
       else begin
          if Copy(vData, 4, 2) = '02'
          then sUltDiaMes := '28'
          else sUltDiaMes := '30';
          sUltDiaMes := sUltDiaMes +'/'+ Copy(vData,4,7);

          if Copy(QueryRegraAux.Fieldbyname('DATAINICIO').AsString,4,7) = Copy(vData,4,7)
          then sFormulaAux:='Difdias(#'+ sUltDiaMes+
                                   ',#'+ QueryRegraAux.Fieldbyname('DATAINICIO').AsString+',1)'

          else 
		  //sFormulaAux:='Difdias(#'+ vData+',#'+ '01/'+Copy(vData,4,7)+',1)';
		  //
          if Copy(QueryRegraAux.Fieldbyname('DATAINICIO').AsString,4,7) = Copy(vData,4,7) then
             sFormulaAux:='Difdias(#'+ sUltDiaMes+',#'+ QueryRegraAux.Fieldbyname('DATAINICIO').AsString+',1)'
             
			 //else sFormulaAux:='Difdias(#'+ Datav+',#'+ '01/'+Copy(vData,4,7)+',1)';  inicio SOL 153355 Kintana 1156051
          else
          if (strtodate(QueryRegraAux.Fieldbyname('DATAINICIO').AsString) < strtodate(vData)) then
              if (strtodate(QueryRegraAux.Fieldbyname('DATAFINAL').AsString) < strtodate(sUltDiaMes)) then
                 sFormulaAux:='Difdias(#'+datetostr(QueryRegraAux.Fieldbyname('DATAFINAL').AsDateTime + 1)+',#'+vData+',1)'
              else
                 sFormulaAux:='Difdias(#'+sUltDiaMes+',#'+vData+',1)'
          else
              if (strtodate(QueryRegraAux.Fieldbyname('DATAFINAL').AsString) < strtodate(sUltDiaMes)) then
                 sFormulaAux:='Difdias(#'+datetostr(QueryRegraAux.Fieldbyname('DATAFINAL').AsDateTime + 1)+',#'+QueryRegraAux.Fieldbyname('DATAINICIO').AsString+',1)'
              else
                 sFormulaAux:='Difdias(#'+sUltDiaMes+',#'+QueryRegraAux.Fieldbyname('DATAINICIO').AsString+',1)'		  
		  // Final SOL 153355 Kintana 1156051
       end;
    end
    else begin
       if Copy(vData, 4, 2) = '02'
       then sUltDiaMes := '28'
       else sUltDiaMes := '30';

       sUltDiaMes := sUltDiaMes +'/'+ Copy(vData,4,7);
       sFormulaAux:='Difdias(#'+ sUltDiaMes +',#'+ vData+',1)';
    end;

    vDifDias := Difdias(sFormulaAux);
    vDifDias := IntToStr(Abs(StrToInt(vDifDias)));

    Op2      := vDifDias;
    Op3      := QueryRegraAux.FieldbyName('MODOFUNCAO').AsString;

    if vTipo = 'C' then                           { Cargo  }
      vSql := ' SELECT CODIGO FROM CARGOEXT '+
              ' WHERE  IDPESSJUR  = '+OraNumero(QueryRegraAux.FieldbyName('IDPESSJURCG').AsString)+
              ' AND    IDCARGOEXT = '+OraNumero(QueryRegraAux.FieldbyName('IDCARGOEXT').AsString)

    else if (vTipo = 'F') Or  (vTipo = 'AC') then { Funcao }
      vSQL := ' SELECT CODIGO FROM CARGOEXT '+
              ' WHERE  IDPESSJUR  = '+OraNumero(QueryRegraAux.FieldbyName('IDPESSJURFG').AsString)+
              ' AND    IDCARGOEXT = '+OraNumero(QueryRegraAux.FieldbyName('IDFUNCAO').AsString);


    With QueryRegraAux do begin
      Close;
      Sql.Clear;
      Sql.Add(vSql);
      Open;
    End;

    Op1 := QueryRegraAux.FieldbyName('CODIGO').AsString;

    if Op1 = '0' then
      Op2 := '0';
  End;

// Preenche variaveis de Retorno
  SetVariavel(vVar1,Op1,vVar1);
  SetVariavel(vVar2,Op2,vVar2);

  if Trim(vVar3) <> ''
  then SetVariavel(vVar3,Op3,vVar3)
  else SetVariavel(vVar3,'',vVar3);


// Acerta Resultado
  if (Op1 = '0') and (Op2 = '0') then
    Result := 'FALSE'
  else
    Result := 'VERDADEIRO';
end;

{------------------------------------------------------------------------------}
function Tregra.GRUPOPESSOA(Formula : String) : String;
var
   vSql, vData, vFormulaAux : String;
begin
     vFormulaAux := Copy(Formula,13,Length(Formula));
     vFormulaAux := Copy(vFormulaAux,1,Length(vFormulaAux)-1);

     vData := PegaValor(vFormulaAux);

     try
        fQueryIn.FieldByName('IDPESSOA').AsString;
     except
           MsgDlgRegra('Campo IDPESSOA Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
           Exit;
     end;

     vSql := ' SELECT IDFUNCAO, DATAINICIO, DATAFINAL FROM EVOLFUNCPREV '+
             ' WHERE  (TO_DATE('''+vData+''',''DD/MM/YYYY'') BETWEEN DATAINICIO AND DATAFINAL) '+
             ' AND    (IDPESSOA = '+fQueryIn.FieldByName('IDPESSOA').AsString+')                 '+
             ' AND    (IDFUNCAO IS NOT NULL ) '+
             ' ORDER BY DATAINICIO, DATAFINAL DESC';
     with QueryRegraAux do begin
          Close;
          Sql.Clear;
          Sql.Add(vSql);
          Open;
          First;
     end;

     Result  := '';
     if not QueryRegraAux.IsEmpty then begin
        vSql := ' SELECT G.CODIGO FROM GRUPOFUNC G, GRUPOCARGOEXT GE '+
                ' WHERE  GE.IDFUNCAO = '+QueryRegraAux.FieldbyName('IDFUNCAO').AsString+
                ' AND    (TO_DATE('''+QueryRegraAux.FieldbyName('DATAINICIO').AsString+''',''DD/MM/YYYY'') BETWEEN GE.DATAVIGENCIA AND GE.DATAFIM) '+
                ' AND    G.IDGRUPOFUNC = GE.IDGRUPOFUNC ';
        with QueryRegraAux do begin
             Close;
             Sql.Clear;
             Sql.Add(vSql);
             Open;
        end;
        Result := QueryRegraAux.FieldbyName('CODIGO').AsString;
     end;
end;
{------------------------------------------------------------------------------}

// MAIORCF4(TIPO, DATAREF, INDICADOR_PCC  )
function TRegra.MAIORCF(Formula : String) : String;
var
   vSql, vTipo, vIndPCC, vData, vFormulaAux : string;
   i : LongInt;
begin
   Result := '0';
   vFormulaAux := Copy(Formula,9,Length(Formula));
   vFormulaAux := Copy(vFormulaAux,1,Length(vFormulaAux)-1);

   i           := Pos(',',vFormulaAux);
   vTipo       := Copy(vFormulaAux,1,i-1);
   vTipo       := PegaValor(vTipo);
   vFormulaAux := Copy(vFormulaAux,i+1,Length(vFormulaAux));

   i           := Pos(',', vFormulaAux);
   vData       := Copy(vFormulaAux,1,i-1);
   vData       := PegaValor(vData);
   vFormulaAux := Copy(vFormulaAux,i+1,Length(vFormulaAux));

   vIndPCC     := vFormulaAux;
   vIndPCC     := PegaValor(vIndPCC);

   try
      fQueryIn.FieldByName('IDPESSJUR').AsString;
   except
      MsgDlgRegra('Campo IDPESSOA Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
      Exit;
   end;

   if vIndPCC = 'S'
   then vIndPCC := ' AND    C.FLGPCC     = 1 '
   else if vIndPCC = 'N'
        then vIndPCC := ' AND    C.FLGPCC     = 0 '
        else vIndPCC := ' ';

   if vTipo = 'C' then begin { Cargo }
       vSQL := ' SELECT MAX(F.VALOR)AS VALOR  '+
               ' FROM   CARGOEXT C, CARGOXNIVEL CN, FAIXANIVEL F '+
               ' WHERE  F.DATAEFETIVACAO <= TO_DATE('''+vData+''',''DD/MM/YYYY'') '+
               ' AND    F.DATAEFETIVACAO >  TO_DATE('''+'01/06/1994'+''',''DD/MM/YYYY'') '+
               ' AND    F.IDPESSJUR  =  '+fQueryIn.FieldByName('IDPESSJUR').AsString+
               ' AND    F.IDNIVEL    = CN.IDNIVEL '+
               ' AND    C.IDPESSJUR  = CN.IDPESSJUR  '+
               ' AND    C.IDCARGOEXT = CN.IDCARGOEXT '+
               vIndPCC
   end else begin            { Funcao }
       vSQL := ' SELECT MAX(F.VALOR)AS VALOR  '+
               ' FROM   CARGOEXT C, GRUPOCARGOEXT GC, FAIXAGRUPO F '+
               ' WHERE  F.DATAEFETIVACAO <= TO_DATE('''+vData+''',''DD/MM/YYYY'') '+
               ' AND    F.DATAEFETIVACAO >  TO_DATE('''+'01/06/1994'+''',''DD/MM/YYYY'') '+
               ' AND    F.IDPESSJUR     = '+fQueryIn.FieldByName('IDPESSJUR').AsString+
               ' AND    GC.IDGRUPOFUNC  = F.IDGRUPOFUNC  '+
               ' AND    GC.IDCARGOEXT   = C.IDCARGOEXT '+
               ' AND    C.IDPESSJUR     = F.IDPESSJUR   '+
               vIndPCC
   end;

   with QueryRegraAux do
   begin
      Close;
      Sql.Clear;
      Sql.Add(vSql);
      Open;
      if IsEmpty then Exit;
   end;

   QueryRegraAux.First;

   Result := FloatToStr(QueryRegraAux.FieldByName('Valor').AsFloat );
end;
{------------------------------------------------------------------------------}

function Tregra.NIVELPESSOA(Formula : String) : String;
var
   vSql, vData, vFormulaAux : String;
begin
     vFormulaAux := Copy(Formula,13,Length(Formula));
     vFormulaAux := Copy(vFormulaAux,1,Length(vFormulaAux)-1);
     vData := PegaValor(vFormulaAux);

     try
        fQueryIn.FieldByName('IDPESSOA').AsString;
     except
           MsgDlgRegra('Campo IDPESSOA Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
           Exit;
     end;

     vSql := ' SELECT IDCARGOEXT, DATAINICIO, DATAFINAL '+
             ' FROM   EVOLFUNCPREV                      '+
             ' WHERE (TO_DATE('''+vData+''',''DD/MM/YYYY'') BETWEEN DATAINICIO AND DATAFINAL) '+
             ' AND   (IDPESSOA = '+fQueryIn.FieldByName('IDPESSOA').AsString+')               '+
             ' AND   (IDCARGOEXT IS NOT NULL)                                                 '+
             ' ORDER BY DATAINICIO, DATAFINAL DESC';
     with QueryRegraAux do begin
          Close;
          Sql.Clear;
          Sql.Add(vSql);
          Open;
          First;
     end;

     Result  := '';
     if not QueryRegraAux.IsEmpty then begin
        vSql := 'SELECT N.CODIGO '+
                ' FROM  NIVEL N, CARGOXNIVEL CN '+
                ' WHERE CN.IDCARGOEXT  = '+QueryRegraAux.FieldbyName('IDCARGOEXT').AsString+
                ' AND   (TO_DATE('''+QueryRegraAux.FieldbyName('DATAINICIO').AsString+''',''DD/MM/YYYY'') BETWEEN CN.DATAVIGENCIA AND CN.DATAFIM) '+
                ' AND   N.IDNIVEL = CN.IDNIVEL ';
        with QueryRegraAux do begin
             Close;
             Sql.Clear;
             Sql.Add(vSql);
             Open;
        end;
        Result := QueryRegraAux.FieldbyName('CODIGO').AsString;
     end;
end;

{------------------------------------------------------------------------------}
function TRegra.NUMDIASADICIONAL(Formula : String) : String;
var
   vSql, vFormulaAux, vAnoMesRef, vCodItem : String;
   i, iDifDias                             : LongInt;
   sDataInicio, sDataFinal                 : string;
begin
     Result := '0';
     vFormulaAux := Copy(Formula,18,Length(Formula));
     vFormulaAux := Copy(vFormulaAux,1,Length(vFormulaAux)-1);

     i           := Pos(',',vFormulaAux);
     vAnoMesRef  := Copy(vFormulaAux,1,i-1);
     vAnoMesRef  := PegaValor(vAnoMesRef);
     vFormulaAux := Copy(vFormulaAux,i+1,Length(vFormulaAux));

     vCodItem    := vFormulaAux;
     vCodItem    := PegaValor(vCodItem);
     vFormulaAux := Copy(vFormulaAux,i+1,Length(vFormulaAux));

     try
        fQueryIn.FieldByName('IDPESSOA').AsString;
     except
        MsgDlgRegra('Campo IDPESSOA Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
        Exit;
     end;

     vSQL := ' SELECT E.IDFUNCAO , E.DATAINICIO, E.DATAFINAL '+
             ' FROM   EVOLFUNCPREV E  '+
             ' WHERE (E.IDPESSOA = '+fQueryIn.FieldByName('IDPESSOA').AsString+') '+
             ' AND   (TO_CHAR(E.DATAINICIO,''YYYY/MM'') <= '''+vAnoMesRef+''') '+
             ' AND   ((TO_CHAR(E.DATAFINAL, ''YYYY/MM'') >= '''+vAnoMesRef+''') OR (E.DATAFINAL IS NULL) ) ';

     if vCodItem = 'T' then
       vSQL := vSQL + ' AND E.PERCATS IS NOT NULL '
     else if vCodItem = 'P' then
       vSQL := vSQL + ' AND E.PERCPERICUL IS NOT NULL '
     else if vCodItem = 'I' then 
       vSQL := vSQL +' AND E.PERCINSALUB IS NOT NULL '
     else if ((vCodItem = 'C') or (vCodItem = 'C2')) then
       vSQL := vSQL +' AND E.PERC1AC IS NOT NULL '
     else if vCodItem = 'N' then
       vSQL := vSQL +' AND E.PERCADNOT IS NOT NULL '
     else if vCodItem = 'A' then
       vSQL := vSQL +' AND E.PERCINCORP IS NOT NULL ';

     vSQL := vSQL + ' ORDER BY E.DATAINICIO, E.DATAFINAL DESC ';

     with QueryRegraAux do begin
          Close;
          Sql.Clear;
          Sql.Add(vSql);
          Open;
     end;

     iDifDias := 0;
     QueryRegraAux.First;
     while not QueryRegraAux.Eof do
     begin
        if Copy(QueryRegraAux.FieldByName('DataInicio').AsString,7,4)+'/'+
           Copy(QueryRegraAux.FieldByName('DataInicio').AsString,4,2) < vAnoMesRef
        then sDataInicio := '01/'+Copy(vAnoMesRef,6,2)+'/'+Copy(vAnoMesRef,1,4)
        else sDataInicio := QueryRegraAux.FieldByName('DataInicio').AsString;

        if (Copy(QueryRegraAux.FieldByName('DataFinal').AsString,7,4)+'/'+
            Copy(QueryRegraAux.FieldByName('DataFinal').AsString,4,2) > vAnoMesRef) or
           (trim(QueryRegraAux.FieldByName('DataFinal').AsString) = '') then 
        begin
           if (StrToInt(Copy(vAnoMesRef,6,2)) = 1)  or
              (StrToInt(Copy(vAnoMesRef,6,2)) = 3)  or
              (StrToInt(Copy(vAnoMesRef,6,2)) = 5)  or
              (StrToInt(Copy(vAnoMesRef,6,2)) = 7)  or
              (StrToInt(Copy(vAnoMesRef,6,2)) = 8)  or
              (StrToInt(Copy(vAnoMesRef,6,2)) = 10) or
              (StrToInt(Copy(vAnoMesRef,6,2)) = 12)
           then sDataFinal := '31/'+Copy(vAnoMesRef,6,2)+'/'+Copy(vAnoMesRef,1,4)
           else if (StrToInt(Copy(vAnoMesRef,6,2)) = 4)  or
                   (StrToInt(Copy(vAnoMesRef,6,2)) = 6)  or
                   (StrToInt(Copy(vAnoMesRef,6,2)) = 9)  or
                   (StrToInt(Copy(vAnoMesRef,6,2)) = 11)
                then sDataFinal := '30/'+Copy(vAnoMesRef,6,2)+'/'+Copy(vAnoMesRef,1,4)
                else sDataFinal := '28/'+Copy(vAnoMesRef,6,2)+'/'+Copy(vAnoMesRef,1,4);
        end
        else sDataFinal := QueryRegraAux.FieldByName('DataFinal').AsString;

        sFormulaAux := 'Difdias(#'+ sDataFinal+',#'+ sDataInicio +',1)';

        iDifDias    := iDifDias + StrToInt(OraNumero(DifDias(sFormulaAux))) + 1;

        QueryRegraAux.Next;
     end;

     Result   := IntToStr(iDifDias);
end; // NUMDIASADICIONAL

//    NUMDIASPERCADICIONAL(ANOMESREF, CODITEM, PERCENTUAL)
//    Descricao : Retorna o número de dias que ocorreu um determinado percentual
//                em um determinado mês
function TRegra.NUMDIASPERCADICIONAL(Formula : String) : String;
var
   vSql, vFormulaAux, vAnoMesRef, vCodItem, vPercentual : String;
   i, iDifDias                                          : LongInt;
   sDataInicio, sDataFinal                              : string;
begin
     Result := '0';
     vFormulaAux := Copy(Formula,22,Length(Formula));
     vFormulaAux := Copy(vFormulaAux,1,Length(vFormulaAux)-1);

     i           := Pos(',',vFormulaAux);
     vAnoMesRef  := Copy(vFormulaAux,1,i-1);
     if Pos('''',vAnoMesRef) > 0
     then vAnoMesRef := Copy(vAnoMesRef,Pos('''',vAnoMesRef), Length(vAnoMesRef));
     if Pos('''',vAnoMesRef) > 0
     then vAnoMesRef := Copy(vAnoMesRef,1,Pos('''',vAnoMesRef)-1);
     vFormulaAux := Copy(vFormulaAux,i+1,Length(vFormulaAux));

     i           := Pos(',',vFormulaAux);
     vCodItem    := Copy(vFormulaAux,1,i-1);

     if Pos('''',vCodItem) > 0
     then vCodItem := Copy(vCodItem, Pos('''',vCodItem), Length(vCodItem));

     if Pos('''',vCodItem) > 0
     then vCodItem := Copy(vCodItem,1, Pos('''',vCodItem)-1);

     vFormulaAux := Copy(vFormulaAux,i+1,Length(vFormulaAux)-1);
     vPercentual := vFormulaAux;
     if Pos('''',vPercentual) > 0
     then vPercentual := Copy(vPercentual,Pos('''',vPercentual), Length(vPercentual));
     if Pos('''',vPercentual) > 0
     then vPercentual := Copy(vPercentual,1,Pos('''',vPercentual)-1);


     try
        fQueryIn.FieldByName('IDPESSOA').AsString;
     except
        MsgDlgRegra('Campo IDPESSOA Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
        Exit;
     end;

     vSQL := ' SELECT E.DATAINICIO, E.DATAFINAL '+
             ' FROM   EVOLFUNCPREV E                '+
             ' WHERE (E.IDPESSOA = '+fQueryIn.FieldByName('IDPESSOA').AsString+')  '+
             ' AND   (TO_CHAR(E.DATAINICIO,''YYYY/MM'') <= '''+vAnoMesRef+''')     '+
             ' AND   ((TO_CHAR(E.DATAFINAL, ''YYYY/MM'') >= '''+vAnoMesRef+''') OR '+
             '        (E.DATAFINAL IS NULL) )                                      ';

     if vCodItem = 'T' then
       vSQL := vSQL + ' AND (E.PERCATS IS NOT NULL) AND (E.PERCATS = '+vPercentual+') '
     else if vCodItem = 'P' then
       vSQL := vSQL + ' AND (E.PERCPERICUL IS NOT NULL) AND (E.PERCPERICUL = '+vPercentual+') '
     else if vCodItem = 'I' then
       vSQL := vSQL + ' AND (E.PERCINSALUB IS NOT NULL) AND (E.PERCINSALUB = '+vPercentual+') '
     else if ((vCodItem = 'C') or (vCodItem = 'C2')) then
       vSQL := vSQL + ' AND (E.PERC1AC IS NOT NULL) AND (E.PERC1AC = '+vPercentual+') '
     else if vCodItem = 'N' then
       vSQL := vSQL + ' AND (E.PERCADNOT IS NOT NULL) AND (E.PERCADNOT = '+vPercentual+') '
     else if vCodItem = 'A' then
       vSQL := vSQL + ' AND (E.PERCINCORP IS NOT NULL) AND (E.PERCINCORP = '+vPercentual+') ';

     vSQL := vSQL + ' ORDER BY E.DATAINICIO, E.DATAFINAL DESC                             ';

     with QueryRegraAux do begin
          Close;
          Sql.Clear;
          Sql.Add(vSql);
          Open;
     end;

     iDifDias := 0;
     QueryRegraAux.First;
     while not QueryRegraAux.Eof do
     begin
        if Copy(QueryRegraAux.FieldByName('DataInicio').AsString,7,4)+'/'+
           Copy(QueryRegraAux.FieldByName('DataInicio').AsString,4,2) < vAnoMesRef
        then sDataInicio := '01/'+Copy(vAnoMesRef,6,2)+'/'+Copy(vAnoMesRef,1,4)
        else sDataInicio := QueryRegraAux.FieldByName('DataInicio').AsString;

        if (Copy(QueryRegraAux.FieldByName('DataFinal').AsString,7,4)+'/'+
            Copy(QueryRegraAux.FieldByName('DataFinal').AsString,4,2) > vAnoMesRef) or
           (trim(QueryRegraAux.FieldByName('DataFinal').AsString) = '') then 
        begin
           if (StrToInt(Copy(vAnoMesRef,6,2)) = 1)  or
              (StrToInt(Copy(vAnoMesRef,6,2)) = 3)  or
              (StrToInt(Copy(vAnoMesRef,6,2)) = 5)  or
              (StrToInt(Copy(vAnoMesRef,6,2)) = 7)  or
              (StrToInt(Copy(vAnoMesRef,6,2)) = 8)  or
              (StrToInt(Copy(vAnoMesRef,6,2)) = 10) or
              (StrToInt(Copy(vAnoMesRef,6,2)) = 12)
           then sDataFinal := '31/'+Copy(vAnoMesRef,6,2)+'/'+Copy(vAnoMesRef,1,4)
           else if (StrToInt(Copy(vAnoMesRef,6,2)) = 4)  or
                   (StrToInt(Copy(vAnoMesRef,6,2)) = 6)  or
                   (StrToInt(Copy(vAnoMesRef,6,2)) = 9)  or
                   (StrToInt(Copy(vAnoMesRef,6,2)) = 11)
                then sDataFinal := '30/'+Copy(vAnoMesRef,6,2)+'/'+Copy(vAnoMesRef,1,4)
                else sDataFinal := '28/'+Copy(vAnoMesRef,6,2)+'/'+Copy(vAnoMesRef,1,4);
        end
        else sDataFinal := QueryRegraAux.FieldByName('DataFinal').AsString;

        sFormulaAux := 'Difdias(#'+ sDataFinal+',#'+ sDataInicio +',1)';

        iDifDias    := iDifDias + StrToInt(OraNumero(DifDias(sFormulaAux))) + 1;

        QueryRegraAux.Next;
     end;

     Result   := IntToStr(iDifDias);
end; // NUMDIASPERCADICIONAL

// *****************************************************************************
// PERCENTUALFUNCAO(DATAREF, COD_FUNCAO)
function TRegra.PERCENTUALFUNCAO(Formula : String) : String;
Var
  sSQLTipo, vFormulaAux, vSql, vData, vCodFuncao, sTipo : String;
  i : longint;
begin
  Result := '0';
  //------------------------------------------------------------------------------
  // Decodifica a Formula
  vFormulaAux := Copy(Formula,18,Length(Formula));
  vFormulaAux := Copy(vFormulaAux,1,Length(vFormulaAux)-1);

  // Guarda a Data de Referencia
  i           := Pos(',',vFormulaAux);
  vData       := Copy(vFormulaAux,1,I-1);
  vData       := PegaValor(vData);
  vFormulaAux := Copy(vFormulaAux,I+1,Length(vFormulaAux));

  { Guarda codigo da função  }
  I := Pos(',',vFormulaAux);
  If I <= 0 Then I := (Length(vFormulaAux)+1);
  vCodFuncao :=  Copy(vFormulaAux,1,I-1);
  vCodFuncao :=  PegaValor(vCodFuncao);

  vFormulaAux := Copy(vFormulaAux,I+1,Length(vFormulaAux));
  { Guarda tipo de pesquisa A ou F }
  I := Pos(',',vFormulaAux);
  If I <= 0 Then I := (Length(vFormulaAux)+1);
  sTipo :=  Copy(vFormulaAux,1,I-1);
  sTipo :=  PegaValor(sTipo);
  If sTipo = '' Then sTipo := 'F';

  { Caso Tipo = A busca Adic. Comppensatorio }
  sSQLTipo := '  ';
  If sTipo = 'A' Then
    sSQLTipo := ' AND PERC1AC IS NOT NULL '
  Else
    sSQLTipo := ' AND PERC1AC IS NULL ';

  // Teste se IDPESSOA esta no SQL de Entrada (Obrigatorio)
  Try
    fQueryIn.FieldByName('IDPESSOA').AsString;
  Except
    MsgDlgRegra('Campo IDPESSOA Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
    Exit;
  End;

  //------------------------------------------------------------------------------
  vSQL := ' SELECT E.IDPESSJURFG, E.IDFUNCAO,  E.DATAINICIO, E.DATAFINAL , E.MODOFUNCAO, E.PERCFUNCAO, E.PERC1AC     '+
          ' FROM   CARGOEXT F, EVOLFUNCPREV E,     '+
          '       (SELECT MAX(DATAINICIO) DATAINICIO   '+
          '        FROM   EVOLFUNCPREV                 '+
          '        WHERE  IDPESSOA = '+fQueryIn.FieldByName('IDPESSOA').AsString+
          '        AND    TO_CHAR(DATAINICIO, ''YYYY/MM'') <= '''+Copy(vData,7,4)+'/'+Copy(vData,4,2)+''''+
          '        AND    ((TO_CHAR(DATAFINAL,''YYYY/MM'') >= '''+Copy(vData,7,4)+'/'+Copy(vData,4,2)+''''+') OR (DATAFINAL IS NULL)) '+
          '        AND    IDFUNCAO  IS NOT NULL '+
          '       ) ULTC '+
          ' WHERE  E.IDPESSOA      = '+fQueryIn.FieldByName('IDPESSOA').AsString+
          ' AND    F.CODIGO = '''+vCodFuncao+''''+
          sSQLTipo+
          ' AND    E.DATAINICIO    = ULTC.DATAINICIO  '+
          ' AND    E.IDFUNCAO IS NOT NULL           '+
          ' AND    F.IDPESSJUR = E.IDPESSJURFG      '+
          ' AND    F.IDCARGOEXT = E.IDFUNCAO        '+
          ' ORDER BY E.DATAINICIO, E.DATAFINAL DESC   ';

  With QueryRegraAux do begin
    Close;
    Sql.Clear;
    Sql.Add(vSql);
    Open;
  end;

  if not QueryRegraAux.IsEmpty then begin
    If sTipo = 'F' Then
      Result := QueryRegraAux.FieldByName('PERCFUNCAO').AsString
    Else
      Result := QueryRegraAux.FieldByName('PERC1AC').AsString;
  end;
end;

//******************************************************************************
// Formula - Valor total de um Cargo/Funcao em um MES
Function TRegra.TOTALCFMES(Formula:String):String;
Var
  vSql, vCod, vTipo, vData, vFormulaAux, vCodItemPCS : String;
  wTipoProc:String;
  I:LongInt;
  wTotalCargo:Double;
  QryLocal:TwwQuery;
begin
  Result := '0';
//------------------------------------------------------------------------------
// DECODIFICA A FORMULA

// Retira Nome da Formula
  vFormulaAux := Copy(Formula,12, Length(Formula));
  vFormulaAux := Copy(vFormulaAux,1,Length(vFormulaAux)-1);

// Guarda Tipo de Processamento
// C - Cargo / F - Funcao
  I := Pos(',',vFormulaAux);
  wTipoProc := Copy(vFormulaAux,1,I-1);
  wTipoProc := PegaValor(wTipoProc);

// Guarda a Data de Referencia
  vFormulaAux := Copy(vFormulaAux,I+1,Length(vFormulaAux));

  i := Pos(',', vFormulaAux);
  if i > 0 // tem o parametro opcional
  then begin
     vData       := Copy(vFormulaAux,1,i-1);
     vData       := PegaValor(vData);
     vCodItemPCS := Copy(vFormulaAux, i+1, Length(vFormulaAux));
  end
  else begin // NAO tem o parametro opcional
     vCodItemPCS := '';
     vData       := Copy(vFormulaAux,1,Length(vFormulaAux));
     vData       := PegaValor(vData);
  end;

//------------------------------------------------------------------------------
// TESTA CAMPOS OBRIGATORIOS
// IDPESSOA
  If FQueryIn.FindField('IDPESSOA') = NIL Then Begin
    MsgDlgRegra('Campo IDPESSOA Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk],0);
    Exit;
  End Else If FQueryIn.FindField('IDPESSJUR') = NIL Then Begin
    MsgDlgRegra('Campo IDPESSJUR Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk],0);
    Exit;
  End;


//------------------------------------------------------------------------------
// INICIO DO PROCESSO

// Cria Objetos Locais
  QryLocal:=TwwQuery.Create(Self);
  QryLocal.DatabaseName:=FDatabaseName;

// Processamento de CARGO (C)
  If UpperCase(wTipoProc) = 'C' Then Begin
// Busca os dados a Processar
    vSql := 'SELECT CN.IDNIVEL '+
            'FROM   EVOLFUNCPREV E, CARGOXNIVEL CN '+
            'WHERE  E.IDPESSJUR  = '''+fQueryIn.FieldByName('IDPESSJUR').AsString+'''  AND '+
            '       E.IDPESSOA   = '''+fQueryIn.FieldByName('IDPESSOA').AsString+'''   AND '+
            '       E.DATAINICIO <= TO_DATE('''+vData+''',''DD/MM/YYYY'') AND '+
            '       ( ( E.DATAFINAL >= TO_DATE('''+vData+''',''DD/MM/YYYY'')) OR '+
            '         ( E.DATAFINAL IS NULL) )      AND '+
            '       E.IDPESSJURCG  = CN.IDPESSJUR  AND '+
            '       E.IDCARGOEXT   = CN.IDCARGOEXT AND '+
            '       E.DATAINICIO   = CN.DATAVIGENCIA   ';


    With QueryRegraAux Do Begin
      Close;
      Sql.Clear;
      Sql.Add(vSql);
      Open;
      First;
// Caso Existam Registro a Processar
      If Not IsEmpty Then Begin
        wTotalCargo:=0;
        While Not EOF Do Begin
          QryLocal.SQL.Clear;
          QryLocal.SQL.Add(
           'SELECT F.VALOR FROM FAIXANIVEL F '+
           'WHERE '+
           '  F.IDPESSJUR= '''+fQueryIn.FieldByName('IDPESSJUR').AsString   +'''  AND '+
           '  F.IDNIVEL  = '''+QueryRegraAux.FieldByName('IDNIVEL').AsString+'''  AND '+
           '  F.IDFAIXASALEXT IN ( '+
           '                      SELECT MAX(IDFAIXASALEXT) FROM FAIXANIVEL '+
           '                      WHERE '+
           '                        IDPESSJUR= '''+fQueryIn.FieldByName('IDPESSJUR').AsString   +'''  AND '+
           '                        IDNIVEL  = '''+QueryRegraAux.FieldByName('IDNIVEL').AsString+'''  AND '+
           '                        TO_CHAR(DATAEFETIVACAO,''YYYY/MM'') <= '+
           '                        TO_CHAR(TO_DATE('''+vData+''',''DD/MM/YYYY''),''YYYY/MM'')'+
                               ')'
                         );
// Abre a Consulta
          QryLocal.Open;
// Soma Valores
          wTotalCargo:=wTotalCargo+QryLocal.FieldByName('VALOR').AsFloat;
// Proximo Registro
          Next;
        End;
// Seta Resultado
        Result:=FloatToStr(wTotalCargo);
      End;

    End;
  End Else If UpperCase(wTipoProc) = 'F' Then Begin
// Processamento de FUNCAO (F)

// Busca Dados
    vSql := 'SELECT '+
            '  SUM(NVL(F.VALOR,0)) AS VALOR '+
            'FROM   '+
            '  EVOLFUNCPREV E, GRUPOCARGOEXT G, FAIXAGRUPO F '+
            'WHERE  '+
            '  E.IDPESSJUR  = '''+fQueryIn.FieldByName('IDPESSJUR').AsString+'''  AND '+
            '  E.IDPESSOA   = '''+fQueryIn.FieldByName('IDPESSOA').AsString+'''   AND '+
            '  E.DATAINICIO <= TO_DATE('''+vData+''',''DD/MM/YYYY'') AND '+
            '  ( ( E.DATAFINAL >= TO_DATE('''+vData+''',''DD/MM/YYYY'')) OR '+
            '    (E.DATAFINAL IS NULL) )      AND '+
            '  E.IDPESSJURFG  = G.IDPESSJUR   AND '+
            '  E.IDFUNCAO     = G.IDCARGOEXT  AND '+
            '  G.DATAVIGENCIA <= TO_DATE('''+vData+''',''DD/MM/YYYY'') AND '+
            '  ( ( G.DATAFIM >= TO_DATE('''+vData+''',''DD/MM/YYYY'')) OR '+
            '    (G.DATAFIM IS NULL) )      AND '+
            '   F.IDPESSJUR = G.IDPESSJUR  AND '+
            '   F.IDGRUPOFUNC = G.IDGRUPOFUNC AND '+
            '   F.DATAEFETIVACAO >= TO_DATE('''+vData+''',''DD/MM/YYYY'') ';

    With QueryRegraAux Do Begin
      Close;
      Sql.Clear;
      Sql.Add(vSql);
      Open;

// Seta Resultado
      Result := QueryRegraAux.FieldByName('VALOR').AsString;
    End;

  End; // If PRINCIPAL

// Libera Objetos Locais
  QryLocal.Free;
  QryLocal:=NIL;
end;

{------------------------------------------------------------------------------}
// VERFUNCAOPCC (CODIGOFUNCAO)
function TRegra.VERFUNCAOPCC(Formula : String) : String;
var
   vSql, vFormulaAux, vCodFuncao : string;
begin
   Result := '0';
   vFormulaAux := Copy(Formula,14,Length(Formula));
   vCodFuncao := Copy(vFormulaAux,2,Length(vFormulaAux)-2);
   vCodFuncao := trim( PegaValor(vCodFuncao) );

   try
      fQueryIn.FieldByName('IDPESSJUR').AsString;
   except
      MsgDlgRegra('Campo IDPESSJUR Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
      Exit;
   end;

   vSql := ' SELECT FLGPCC FROM CARGOEXT '+
           ' WHERE  IDPESSJUR = '+      fQueryIn.FieldByName('IDPESSJUR').AsString+
           ' AND    TRIM( CODIGO )   = '''+vCodFuncao+''' '+
           //BRUNO AZEVEDO SOL 147807 KINTANA 1027715
           ' AND    TIPO  = '+ '''F''' ;   //SOL 147291 Kintana 1015812
           //' AND    C.TIPO  = '+ '''F''' ;   //SOL 147291 Kintana 1015812
           //BRUNO AZEVEDO SOL 147807 KINTANA 1027715
           
   with QueryRegraAux do
   begin
      Close;
      Sql.Clear;
      Sql.Add(vSql);
      Open;
      if IsEmpty then Exit;
   end;
   Result := IntToStr(QueryRegraAux.FieldByName('FLGPCC').AsInteger);
end;

function TRegra.ProximoAnoMes(iMes, iAno : integer) : string;
var sAnoMes : string;
begin
  Result := '';
  if (iMes = 12) or (iMes = 13)
  then begin
     sAnoMes := IntToStr(iAno+1)+'/';
     sAnoMes := sAnoMes+'01';
  end
  else begin
    sAnoMes := IntToStr(iAno)+'/';
    iMes := iMes + 1;
    if iMes <= 9
    then sAnoMes := sAnoMes+'0'+IntToStr(iMes)
    else sAnoMes := sAnoMes+IntToStr(iMes);
  end;
  Result := sAnoMes;
end;//ProximoAnoMes


{******************************************************************************}
{ Fórmula REAJUSTAINSS                                                         }
{   Indexa um Valor por um indice seguindo as Regras do INSS                   }
{------------------------------------------------------------------------------}
Function TRegra.REAJUSTAINSS (sFormulaAux : String ) : String;
Var
  I : Integer;
  sSQLAux,
  sFormulaOriginal, sDataAtual, sAnoMesAtual, sAnoMesFinal, sMesAnoPesquisa,
  sVlrReajustar, sIndice, sDataInicio, sDataFinal  : String;

  dVlrIndice, dVlrAcumulado : Double;
  dVlrReajustar : Currency;

Begin
  FError := False;

  {----------------------------------------------------------------------------}
  { Decodifica Formula, Transformação de variaveis em valores feitas de uma    }
  { ao final.                                                                  }

  sFormulaOriginal := sFormulaAux;
  { Retira o nome da formula da variavel FormulaAux }
  I := Pos('(',sFormulaAux);
  sFormulaAux := Copy(sFormulaAux,I+1,Length(sFormulaAux)-I);

  { Parametro VALOR }
  I := Pos(',',sFormulaAux);
  sVlrReajustar := Copy(sFormulaAux,1,i-1);
  sFormulaAux   := Copy(sFormulaAux,i+1,Length(sFormulaAux)-i);

  { Parametro INDICE }
  I := Pos(',',sFormulaAux);
  sIndice     := Copy(sFormulaAux,1,I-1);
  sFormulaAux := Copy(sFormulaAux,I+1,length(sFormulaAux)-I);

  { Parametro DATAINICIO }
  I := Pos(',',sFormulaAux);
  sDataInicio := Copy(sFormulaAux,1,I-1);
  sFormulaAux := Copy(sFormulaAux,I+1, Length(sFormulaAux)-I);

  { parametro DATAFINAL }
  I := Pos(')',sFormulaAux);
  sDataFinal := Copy(sFormulaAux,1,i-1);

  { Buscar conteudo de variaveis }
  {------------------------------}
  sVlrReajustar := PegaValor(sVlrReajustar);
  sIndice       := PegaValor(sIndice);
  sDataInicio   := PegaValor(sDataInicio);
  sDataFinal    := PegaValor(sDataFinal);

  {----------------------------------------------------------------------------}
  { Forma de Cálculo:                                                          }
  { Na primeira passada pega a Cotacao do Indice no primeiro dia do mes data de}
  { Inicio do processo, nas próximas pega a menor data de cotação do Indice no }
  { próximo mês de Referencia, até a data final.                               }
  {----------------------------------------------------------------------------}

  { Iniciar variaveis para o loop }

  dVlrReajustar := StrToFloat(sVlrReajustar);
  { Volta data Inicio para o primeiro dia do Mes }
  sDataInicio  := '01/'+Copy(sDataInicio, 4,2)+'/'+ Copy(sDataInicio,7,4);
  { Guarda Data e AnoMes atual para pesquisa }
  sDataAtual   := sDataInicio;
  sAnoMesAtual := Copy(sDataInicio, 7,4)+'/'+ Copy(sDataInicio, 4,2);  {YYYY/MM}
  sAnoMesFinal := Copy(sDataFinal, 7,4)+'/'+ Copy(sDataFinal, 4,2);    {YYYY/MM}


  { Processa até a data de Referencia do indice chegar ao AnoMes Final }
  While sAnoMesAtual <= sAnoMesFinal Do Begin
    { Monta data de Pesquisa de YYYY/MM para MMYYYY (MesRef - CotacaoMoeda) }
    sMesAnoPesquisa := Copy(sAnoMesAtual, 6,2)+Copy(sAnoMesAtual,1,4);

    { Busca Cotacao da Moeda para Reajuste }
    sSQLAux :=
      'SELECT                                             '+
      '  C.MOECODIGO, C.COTDATA, C.COTMESREF, C.COTVALOR, '+
      '  SUBSTR(C.COTMESREF,3,4)||''/''||SUBSTR(C.COTMESREF,1,2) AS COTANOMES     '+
      'FROM                                               '+
      '  MOEDA M, COTACAOMOEDA C                          '+
      'WHERE                                              '+
      '  UPPER(M.MOESIGLA) = UPPER('+QuotedStr(sIndice)+') AND '+
      '  C.MOECODIGO       = M.MOECODIGO       AND        '+
      '  C.COTDATA = (SELECT                              '+
      '                  MIN(C1.COTDATA)                  '+
      '               FROM                                '+
      '                  COTACAOMOEDA C1                  '+
      '               WHERE                               '+
      '                  C1.MOECODIGO = C.MOECODIGO AND   '+
      '               TO_DATE(C1.COTMESREF, ''MMYYYY'') > TO_DATE('+QuotedStr(sMesAnoPesquisa)+', ''MMYYYY'') AND '+
      '               C1.COTDATA >= TO_DATE('+QuotedStr(sDataInicio)+',''DD/MM/YYYY'') '+
      '              ) ';

    FazQuery(QueryRegraAux,sSQLAux);

    { Caso não encontre cotações sai }
    If QueryRegraAux.IsEmpty Then Break;

    { Atualiza dados para o próximo Loop }
    sAnoMesAtual := QueryRegraAux.FieldByName('COTANOMES').AsString;
    dVlrIndice   := QueryRegraAux.FieldByName('COTVALOR').AsFloat;

    { Caso a data da Cotação ultrapasse o Mes Final sai }

    If  sAnoMesAtual >= sAnoMesFinal Then Break;

    dVlrAcumulado := (dVlrReajustar * ( 1 + Abs(dVlrIndice / 100) ));

    dVlrReajustar := dVlrAcumulado;
  End; { while }

  Result := FloatToStr(dVlrAcumulado);
end;

function TRegra.CONVERTEDATA(Formula : String) : String;
var
   vFormulaAux, vData, vFormato :  String;
   i : LongInt;
begin
     Result := '';
     vFormulaAux := Copy(Formula,14,Length(Formula));
     vFormulaAux := Copy(vFormulaAux,1,Length(vFormulaAux)-1);

     i           := Pos(',',vFormulaAux);
     vData       := Copy(vFormulaAux,1,i-1);
     vData       := PegaValor(vData);
     vFormulaAux := Copy(vFormulaAux,i+1,Length(vFormulaAux));

     vFormato    := vFormulaAux;

     if (Trim(vData) = '') or (Trim(vData) = '') then Exit;

     if vFormato = 'AAAA/MM'
     then Result := Copy(vData,7,4)+'/'+Copy(vData,4,2)
     else if vFormato = 'MM/AAAA'
          then Result := Copy(vData,4,2)+'/'+Copy(vData,7,4)
          else if vFormato = 'MM/DD/AAAA'
               then vFormato := Copy(vData,4,2)+'/'+Copy(vData,1,2)+'/'+Copy(vData,7,4)
               else vFormato := Copy(vData,7,4)+'/'+Copy(vData,4,2)+'/'+Copy(vData,1,2); // AAAA/MM/DD

end; // CONVERTEDATA


{------------------------------------------------------------------------------}
// FREQSALARIO([RUBRICAS_A_CONSIDERAR]INDICE(OPCIONAL), ANO/MES INICIO, ANO/MES FINAL, OPERADOR_CONDICAO, VALOR_CONDICAO, ;
//             @VAR_RETORNO_SOMA, @VAR_RETORNO_FREQ                                 ');
Function TRegra.FREQSALARIO(Formula : String) : String;
Type

  TRecSalario = Record
                  MesRef :String;
                  Indice :Double;
                  Salario:Double;
                  SalarioIndexado:Currency;
                  ValorTeto:Currency;
                End;
Var
   vSql,   vFormulaAux,   vRubricasAConsiderar,   vAnoMesInicio,
   vAnoMesFinal,   vOpCondicao, vValorCondicao,   vVarRetSoma,
   vVarRetFreq : string;

   sPesquisaTitular, vSoma, vFreq, sIdTitular, sIdPessoa : string;
   I, W : word;

   sNomeIndice, sAnoMesIni, sAnoMesFim, sAnoMesAtual, FlgGrava,
   sProxMesBuscar, sProxAnoBuscar, sProxMesAnoBuscar : String;

   aTabSal : Array [1..700] Of TRecSalario;
   TabRubricas : Array [1..50] Of String;

   dVlrUltIndice, dFrequencia, dTotalSalarioIndexado, dVlrIndice :  Double;
   bPulaMes:Boolean;
Begin
   Result   := 'False';
   FlgGrava := '0';
   sPesquisaTitular := 'N';
   // --------------------------------------------------------------------------
   // Decodifica a Formula
   vFormulaAux := Copy(Formula, 12,Length(Formula));
   vFormulaAux := Copy(vFormulaAux,1,Length(vFormulaAux)-1);

   // Guarda Rubricas a Considerar
   i                 := Pos('[',vFormulaAux); // tirar [
   vFormulaAux       := Copy(vFormulaAux, i + 1, Length(vFormulaAux));

   i                 := Pos(']',vFormulaAux);
   vRubricasAConsiderar := Copy(vFormulaAux,1, i - 1);
   vFormulaAux          := Copy(vFormulaAux, i+1,Length(vFormulaAux));

   { Transfere Rubricas para vetor afim de incluir os Plics nas mesmas }
   W :=1;
   Repeat
     I := Pos(',', vRubricasAConsiderar);
     If I <= 0 Then I := Length(vRubricasAConsiderar) Else I := (I-1);  { Acerta posicao }

     TabRubricas[W] := Copy(vRubricasAConsiderar,1,I);
     vRubricasAConsiderar := Copy(vRubricasAConsiderar, I+2, Length(vRubricasAConsiderar));
     Inc(W);
   Until vRubricasAConsiderar = '';
   { Transfere Rubricas do vetor incluiindo os Plics }
   For I := 1 To 50 Do Begin
     If TabRubricas[I] = '' Then Break;
     vRubricasAConsiderar := vRubricasAConsiderar + QuotedStr(TabRubricas[I])+',';
   End;
   vRubricasAConsiderar := Copy(vRubricasAConsiderar, 1, (Length(vRubricasAConsiderar)-1));

   sNomeIndice := '';                        
   W := Pos(',',vFormulaAux);
   sNomeIndice := Copy(vFormulaAux,1,(W-1));
   sNomeIndice := PegaValor(sNomeIndice);    

   i                 := Pos(',',vFormulaAux);
   vFormulaAux       := Copy(vFormulaAux, I+1,Length(vFormulaAux));

   // Guarda Ano/Mes de Referencia
   i                 := Pos(',',vFormulaAux);
   vAnoMesInicio     := Copy(vFormulaAux,1,i-1);
   vAnoMesInicio     := PegaValor(vAnoMesInicio);
   vFormulaAux          := Copy(vFormulaAux, i+1,Length(vFormulaAux)); {MM/YYYY} 
   sAnoMesIni := Copy(vAnoMesInicio,1,4)+Copy(vAnoMesInicio,6,2);      {YYYYMM}  

   i                 := Pos(',',vFormulaAux);
   vAnoMesFinal      := Copy(vFormulaAux,1,I-1);
   vAnoMesFinal      := PegaValor(vAnoMesFinal);
   vFormulaAux       := Copy(vFormulaAux, i + 1, Length(vFormulaAux)); {MM/YYYY}
   sAnoMesFim := Copy(vAnoMesFinal,1,4)+Copy(vAnoMesFinal,6,2);        {YYYYMM}  

   // Guarda Operador de Condição
   i                 := Pos(',',vFormulaAux);
   vOpCondicao       := Copy(vFormulaAux,1,i-1);
   If Copy(vOpCondicao,1,1) = '@' Then
     vOpCondicao := PegaValor(vOpCondicao);

   vFormulaAux       := Copy(vFormulaAux, i + 1, Length(vFormulaAux)); 

   // Guarda Valor de Condição
   i                 := Pos(',',vFormulaAux);
   vValorCondicao    := Copy(vFormulaAux,1,i-1);
   if Copy(vValorCondicao,1,1) = '@' then
     vValorCondicao := PegaValor(vValorCondicao);
   vFormulaAux       := Copy(vFormulaAux, i + 1, Length(vFormulaAux));

   // Variavel de Retorno da Soma dos Salarios
   i := Pos(',',vFormulaAux);
   vVarRetSoma  := Copy(vFormulaAux,1,i-1);
   If Copy(vVarRetSoma,1,1) = '@' Then vVarRetSoma := Copy(vVarRetSoma,2,Length(vVarRetSoma));

   // Variavel de Retorno da Frequencia dos Salarios
   vFormulaAux  := Copy(vFormulaAux, I + 1, Length(vFormulaAux));
   I := Pos(',',vFormulaAux);
   If I <= 0 Then I := Length(vFormulaAux) Else I := (I - 1) ;
   vVarRetFreq  := Copy(vFormulaAux,1,I);
   If Copy(vVarRetFreq,1,1) = '@' Then vVarRetFreq := Copy(vVarRetFreq,2,Length(vVarRetFreq));
   { Pega FLG que pesquisa ou não por Titular }
   vFormulaAux  := Copy(vFormulaAux, I + 2, Length(vFormulaAux));
   I := Pos(',',vFormulaAux);
   If I <= 0 Then I := Length(vFormulaAux) Else I := (I - 1) ;
   sPesquisaTitular := Copy(vFormulaAux,1,I);
   sPesquisaTitular := PegaValor(sPesquisaTitular);

   { Testa campos obrigatorios na Query de Entrada }
   If FQueryIn.FindField('IDPESSOA') = NIL Then Begin
     MsgDlgRegra('Campo IDPESSOA Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk],0);
     FError := True;
     SairDaRegra := True;
     Exit;
   End Else If FQueryIn.FindField('IDPESSJUR') = NIL Then Begin
     MsgDlgRegra('Campo IDPESSJUR Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk],0);
     FError := True;
     SairDaRegra := True;
     Exit;
   End;

   If sPesquisaTitular = '1' Then Begin
     { Testa campos obrigatorios na Query de Entrada }
     If FQueryIn.FindField('IDTITULAR') = NIL Then Begin
       MsgDlgRegra('Campo IDTITULAR Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk],0);
       FError := True;
       SairDaRegra := True;
       Exit;
     End;
     sIdTitular := fQueryIn.FieldByName('IDTITULAR').AsString;
   End;

   { Caso esteja executando com tabela auxiliar (VIEWS) busca dados nela }
   If TemQuery Then Begin
     sIdPessoa := QryOutraRegra.FieldByName('IDPESSOA').AsString;
   End Else Begin
     sIdPessoa := fQueryIn.FieldByName('IDPESSOA').AsString;
   End;

   { Caso esteja sendo utilizada Indexação, busca Cotações do indice }
   {-----------------------------------------------------------------}
   If Trim(sNomeIndice) <> '' Then Begin

     { Inicia Array com Indices }
     For W:=1 to 700 Do Begin
       aTabSal[W].MesRef  := '';
       aTabSal[W].Indice  := 0;
       aTabSal[W].Salario := 0;
       aTabSal[W].SalarioIndexado := 0;
       aTabSal[W].ValorTeto       := 0;
     End;

     With QueryRegraAux Do Begin

       { Busca salarios e Indexa }
       {-------------------------}

       { Monta consulta e busca salarios }
       Close;
       SQL.Clear;
       SQL.Add('SELECT '+ { /*+ INDEX (HISTRUBSAL XIE9HISTRUBSAL) */ }
               '  NVL(DECODE(P.FLGDESCONTO, 1, (H.VALORPROVENTO*-1), H.VALORPROVENTO),0) AS VALORPROVENTO, '+
               '  H.CODPROVDESC, H.IDPESSOA, H.MES '+
               'FROM   HISTRUBSAL H, PROVDESC P '+
               'WHERE P.FLGDESCONTO <> 2 '+
               ' AND  H.IDPESSOA  = '+sIdPessoa);                                   

       If sPesquisaTitular = '1' Then Begin
         SQL.Add('AND  (H.IDTITULAR = '+sIdTitular+' OR IDTITULAR IS NULL)');
       End;

       SQL.Add(' AND  H.'+sCampoPesquisa+'   = '+FQueryIn.FieldByName('IDPESSJUR').AsString +  
               ' AND  H.MES       >= '''+vAnoMesInicio+''''+                       
               ' AND  H.MES       <= '''+vAnoMesFinal+''''+
               ' AND  H.CODPROVDESC IN ('+vRubricasAConsiderar+')'+
               ' AND  H.VALORPROVENTO '+vOpCondicao+' '+OraNumero(vValorCondicao)+' '+
               ' AND  H.IDRUBRICA = P.IDPROVENTO ' +
               'ORDER BY H.MES' );
       Open;
       { Caso não encontre Salarios retorna 0 }
       If IsEmpty then begin
         vSoma  := '0';
         vFreq  := '0';
       End Else Begin
         W :=1;
         sProxMesAnoBuscar := FieldByName('MES').AsString;

         { Varre todos os Salarios encontrados buscando os Indices de Reajuste }
         { e reajustando                                                       }
         While Not EOF Do Begin
           { Soma salarios do mesmo mês }
           aTabSal[W].Salario := (aTabSal[W].Salario + FieldByName('VALORPROVENTO').AsFloat);

           { Monta proximo mes a pesquisar }
           sAnoMesIni := Copy(FieldByName('MES').AsString,1,4)+
                         Copy(FieldByName('MES').AsString,6,2);

           { Proximo registro }
           Next;

           {---------------------------------------------------------------------}
           { Caso tenha mudado o Mes da Rubrica ou seja final do Arquivo executa }
           { indexação                                                           }
           If (sProxMesAnoBuscar <> FieldByName('MES').AsString) Or (EOF) Then Begin
             { Busca Indices a Reajustar }
             QueryRegra.Close;
             QueryRegra.Sql.Clear;
             QueryRegra.Sql.Add('SELECT '+
                                RuleNumber+' AS IDREGRA, C.COTVALOR, C.COTMESREF AS MES '+
                                'FROM   '+
                                '  MOEDA M, COTACAOMOEDA C  '+
                                'WHERE  '+
                                '  M.MOESIGLA  = '''+sNomeIndice+''' AND '+
                                '  M.MOECODIGO = C.MOECODIGO         AND '+
                                '  SUBSTR(C.COTMESREF,3,4)||SUBSTR(C.COTMESREF,1,2) > '+ QuotedStr(sAnoMesIni) + '     '+
                                'ORDER BY '+
                                ' TO_DATE(COTMESREF,''MMYYYY'') ');
             QueryRegra.Open;
             { Caso encontre indices faz calculo }
             While Not QueryRegra.EOF Do Begin
               dVlrIndice := ( (QueryRegra.FieldByName('COTVALOR').AsFloat/100)+1 );
               aTabSal[W].SalarioIndexado := ( aTabSal[W].Salario * dVlrIndice )  ;
               { Acumula Salarios }
               dTotalSalarioIndexado := (dTotalSalarioIndexado + aTabSal[W].SalarioIndexado);
               { Proximo Indice }
               QueryRegra.Next;
             End; { While Not QryRegra.EOF }

             { Caso não encontre indices soma sem reajustar }
             If QueryRegra.IsEmpty Then Begin
               dVlrIndice := 1;
               aTabSal[W].SalarioIndexado := ( aTabSal[W].Salario * dVlrIndice )  ;
               { Acumula Salarios }
               dTotalSalarioIndexado := (dTotalSalarioIndexado + aTabSal[W].SalarioIndexado);
             End;

             {------------------------------------------------------}
             { Grava na memoria de calculo caso desejado na Formula }
             FlgGrava := '1';
             If FlgGrava = '1' Then Begin
               { Gera novo Identificador }
               If FidCalculo = 0 Then Begin
                 FIdCalculo := LeUltRegistro(Nil, 'CALCULO');
                 QueryRegra.Close;
                 QueryRegra.SQL.Clear;
                 QueryRegra.SQL.Add('INSERT INTO CALCULO (IDCALCULO) VALUES ('+IntToStr(FIdCalculo)+')');
                 QueryRegra.ExecSQL;
               End;

               { Caso tenha salario, grava no Historico }
               If (aTabSal[W].Salario <> 0) Then Begin
                 FIdCalculoBenef := LeUltRegistro(nil, 'CALCULOBENEF');
                 QueryRegra.close;
                 QueryRegra.SQL.clear;
                 QueryRegra.SQL.Add('INSERT INTO CALCULOBENEF (IDCALCULO, IDCALCULOBENEF,'+
                                    ' INDICEACUM,SALARIOVP,TETOINSS,MES,TIPOCALCULO,IDREGRA)'+
                                    'VALUES '+
                                    '('+
                                     FloatToStr(FidCalculo)           +','+
                                     InttoStr(FIdCalculoBenef)        +','+
                                     FloatToStr(dVlrIndice)           +','+
                                     FloatToStr(aTabSal[W].Salario)   +','+
                                     FloatToStr(aTabsal[W].ValorTeto) +','''+
                                     Copy(sAnoMesIni,1,4)+'/'+
                                     Copy(sAnoMesIni,5,2)             +''','''+
                                     'CRT'                            +''','''+
                                     IntToStr(IRegraMaster)           +''')');
                 QueryRegra.ExecSQL;
               End; { If (aTabSal[I].Salario }

             End; { If FlgGrava = '1' }


             { Continua Rotina }
             Inc(W); { Proximo Indice }
             sProxMesAnoBuscar := FieldByName('MES').AsString;
           End;
           dFrequencia := (dFrequencia + 1);

         End; { While Not EOF }


         vSoma  := FloatToStr(dTotalSalarioIndexado);
         vFreq  := FloatToStr(dFrequencia);
         Result := 'True';

       End; { Else IsEmpty }

       Close;
     End; { With }

   {---------------------------------------------------------------------------}
   End Else Begin { If Trim(sNome }

     { Monta consulta e busca salarios }
     With QueryRegraAux do begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT '+ { /*+ INDEX (HISTRUBSAL XIE9HISTRUBSAL) */ }
                '  NVL(SUM(DECODE(P.FLGDESCONTO, 1, (H.VALORPROVENTO*-1), H.VALORPROVENTO)),0) AS SOMA, '+
                '  COUNT(DISTINCT H.IDPESSOA) AS FREQUENCIA '+
                'FROM   HISTRUBSAL H , PROVDESC P '+
                'WHERE P.FLGDESCONTO <> 2 '+
                ' AND  H.IDPESSOA  = '+sIdPessoa);                                   
        If sPesquisaTitular = '1' Then Begin
          SQL.Add('AND  (H.IDTITULAR = '+sIdTitular+' OR IDTITULAR IS NULL)');
        End;

        SQL.Add(' AND  H.'+sCampoPesquisa+'   = '+FQueryIn.FieldByName('IDPESSJUR').AsString+  
                ' AND  H.MES       >= '''+vAnoMesInicio+''''+                       
                ' AND  H.MES       <= '''+vAnoMesFinal+''''+
                ' AND  H.CODPROVDESC   IN ('+vRubricasAConsiderar+')'+
                ' AND  H.VALORPROVENTO '+vOpCondicao+' '+OraNumero(vValorCondicao) +' '+
                ' AND  H.IDRUBRICA = P.IDPROVENTO ');
        Open;

        if Not IsEmpty then begin
           vSoma  := FieldByName('SOMA').AsString;
           vFreq  := FieldByName('FREQUENCIA').AsString;
           Result := 'True';
        end else begin
           vSoma  := '0';
           vFreq  := '0';
        end;
        Close;
     End;

   End; { If Trim(sNome }

   SetVariavel(vVarRetSoma,vSoma,vVarRetSoma);
   SetVariavel(vVarRetFreq,vFreq,vVarRetFreq);

end;

function TRegra.CPASSIST (Formula : string ) : string;
var
    sIdContribuicoes,  sValorPesquisa, sAnoMesRef : string;
    sSQL, vFormulaAux, sCampoPesquisa             : string;
    i                                             : word;
begin
// -----------------------------------------------------------------------------
// CPASSIST("Contribuicoes", NumeroProcesso, DataReferencia)
   Result := '0';
   vFormulaAux := Copy(Formula,10,Length(Formula));
   vFormulaAux := Copy(vFormulaAux,1,Length(vFormulaAux)-1);

   i := Pos('"',vFormulaAux);
   vFormulaAux := Copy(vFormulaAux,i+1,Length(vFormulaAux));

   i := Pos('"',vFormulaAux);
   sIdContribuicoes := Copy(vFormulaAux,1,i-1);
   vFormulaAux := Copy(vFormulaAux,i+1,Length(vFormulaAux));

   i := Pos(',',vFormulaAux); // tirar virgula depois das aspas das contribuicoes
   vFormulaAux := Copy(vFormulaAux,i+1,Length(vFormulaAux));

   i := Pos(',',vFormulaAux);
   sValorPesquisa := Copy(vFormulaAux, 1, i-1);
   sValorPesquisa := PegaValor(sValorPesquisa);
   vFormulaAux := Copy(vFormulaAux,i+1,Length(vFormulaAux));

   i := Pos(',',vFormulaAux);
   If I <= 0 Then I := (Length(vFormulaAux)+1);
   sAnoMesRef := Trim(Copy(vFormulaAux, 1, i-1));
   sAnoMesRef := PegaValor(sAnoMesRef);
   vFormulaAux := Copy(vFormulaAux,i+1,Length(vFormulaAux));

   { Campo de Pesquisa }
   i := Pos(',',vFormulaAux);
   If I <= 0 Then I := (Length(vFormulaAux)+1);
   If Trim(vFormulaAux) <> '' Then Begin
     sCampoPesquisa := Copy(vFormulaAux, 1, i-1);
   End Else Begin
     sCampoPesquisa := 'NUMEROPROCESSO' 
   End;
   
// Fim da Decodificacao da Formula
//------------------------------------------------------------------------------
   sSQL := ' SELECT '+RuleNumber+' AS IDREGRA, SUM(H.VALORESPERADO) AS VALORESPERADO '+
           ' FROM   BENEFBFCIARIO BF, HSTCONTRIBPREV H '+
           ' WHERE  BF.'+sCampoPesquisa+' = '+sValorPesquisa+
           ' AND    BF.IDPESSOA       = '+QueryIn.FieldbyName('IDPESSOA').AsString +
           ' AND    TO_CHAR(BF.DATAINICIO,''YYYY/MM'')  <= '''+sAnoMesRef+''''+
           ' AND    ((TO_CHAR(BF.DATAFINAL,''YYYY/MM'') >= '''+sAnoMesRef+''') OR (BF.DATAFINAL IS NULL)) '+
           ' AND    H.IDPESSJUR       = BF.IDPESSJUR '+
           ' AND    H.IDPLANOPREV     = BF.IDPLANOPREV '+
           ' AND    H.IDPESSOA        = BF.IDTITULAR   '+
           ' AND    H.SEQPROPOSTA     = BF.SEQPROPOSTA '+
           ' AND    TO_CHAR(H.DATAINICIO,''YYYY/MM'')  <= '''+sAnoMesRef+''''+
           ' AND    ((TO_CHAR(H.DATAFINAL,''YYYY/MM'') >= '''+sAnoMesRef+''') OR (H.DATAFINAL IS NULL)) '+
           ' AND    H.MESREFERENCIA   = '''+sAnoMesRef+''''+
           ' AND    H.IDCONTRIBUICAO IN ('+sIdContribuicoes+')';


   with queryRegraAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(sSQL);
      Open;

      if (not IsEmpty) and (FieldByName('VALORESPERADO').AsString <> '')
      then Result := FieldByName('VALORESPERADO').AsString;
   end;
end;


// BUSCAFUNCAOADICCOMP (DATAREF)
function TRegra.BUSCAFUNCAOADICCOMP(Formula : String) : String;
var
   vSql, vData, vFormulaAux : String;
   i : word;
begin
     Result      := '0';
     vFormulaAux := Copy(Formula,21,Length(Formula));
     vFormulaAux := Copy(vFormulaAux,1,Length(vFormulaAux)-1);

     vData       := Copy(vFormulaAux,1,Length(vFormulaAux));
     vData       := PegaValor(vData);

     try
        fQueryIn.FieldByName('IDPESSOA').AsString;
     except
        MsgDlgRegra('Campo IDPESSOA Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
        Exit;
     end;

     vSql := ' SELECT  F.CODIGO, E.DATAINICIO, E.DATAFINAL, E.PERCATS, E.PERCINSALUB, E.PERCPERICUL, E.PERC1AC'+
             ' FROM    CARGOEXT F, EVOLFUNCPREV E                         '+
             ' WHERE  (E.DATAINICIO <= TO_DATE('''+vData+''',''DD/MM/YYYY'') ) '+
             ' AND    ((E.DATAFINAL  >= TO_DATE('''+vData+''',''DD/MM/YYYY'')) OR (E.DATAFINAL IS NULL) ) '+
             ' AND    (E.IDPESSOA  = '+fQueryIn.FieldByName('IDPESSOA').AsString+') '+
             ' AND    (E.IDPESSJUR = '+fQueryIn.FieldByName('IDPESSJUR').AsString+ ') '+
             ' AND    (E.PERC1AC > 0) AND (E.PERC1AC IS NOT NULL) '+
             ' AND    (F.IDPESSJUR  = E.IDPESSJURFG) '+
             ' AND    (F.IDCARGOEXT = E.IDFUNCAO)    ';
     vSQL := vSQL + ' ORDER BY E.DATAINICIO, E.DATAFINAL DESC ';

     with QueryRegraAux do
     begin
          Close;
          Sql.Clear;
          Sql.Add(vSql);
          Open;
          First;
          if Isempty
          then Result := '0'
          else Result := Trim(FieldByName('CODIGO').AsString);

     end;
end;

{******************************************************************************}
{ Formula QTDMINUTOS                                                           }
{   Retorna a quantidade de minutos para o Adicional Noturno ocorridos entre   }
{   duas datas.                                                                }
{------------------------------------------------------------------------------}
Function TRegra.QTDMINUTOS(Formula : String) : String;
Var
  sDataMaior, sDataMenor, sTipoAno, FormulaAux,
  sIdPessoa, sSQL : String;

  I : Integer;
Begin
  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }
  { Retira Nome da Formula }
  FormulaAux := Copy(Formula,  12, Length(Formula));
  FormulaAux := Copy(FormulaAux,1,Length(FormulaAux)-1); { Retira parenteses final ) }

  { Inicia Variaveis  }
  sTipoAno := 'A';

  { Pega Data Maior }
  I := Pos(',',FormulaAux);
  sDataMaior := Copy(FormulaAux,1,I-1);
  sDataMaior := PegaValor(sDataMaior);

  { Atualiza descricao da Formula }
  FormulaAux := Copy(FormulaAux,I+1,Length(FormulaAux));
  { Pega Data Menor }
  I := Pos(',',FormulaAux);
  If I <= 0 Then I := (Length(FormulaAux)+1); 
  sDataMenor := Copy(FormulaAux,1,I-1);
  sDataMenor := PegaValor(sDataMenor);

  { Atualiza descricao da Formula }
  FormulaAux := Copy(FormulaAux,I+1,Length(FormulaAux));
  { Pega Tipo de Ano }
  I := Pos(',',FormulaAux);
  sTipoAno := Copy(FormulaAux,1,Length(FormulaAux));
  sTipoAno := PegaValor(sTipoAno);

  { Fim da Decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Inicia Resultado }
  Result := '0';

  { Caso esteja executando com tabela auxiliar (VIEWS) busca dados nela }
  If TemQuery Then Begin
    sIdPessoa := QryOutraRegra.FieldByName('IDPESSOA').AsString;
  End Else Begin
    sIdPessoa := FQueryIn.FieldByName('IDPESSOA').AsString;
  End;

  { Monta consulta e pesquisa no historico de Evolução Funcional }
  sSQL := ' SELECT  SUM(E.QTDEMINUTOS) AS QTDEMINUTOS      '+
          ' FROM    EVOLFUNCPREV E                         '+
          ' WHERE  (E.DATAINICIO >= TO_DATE('''+sDataMenor+''',''DD/MM/YYYY'') ) AND '+
          '        (E.DATAINICIO <= TO_DATE('''+sDataMaior+''',''DD/MM/YYYY'') )     '+
          ' AND    (E.IDPESSOA  = '+sIdPessoa+') '+
          ' AND (E.PERCADNOT > 0) AND (E.PERCADNOT IS NOT NULL) ';

  QueryRegraAux.Close;
  QueryRegraAux.Sql.Clear;
  QueryRegraAux.Sql.Add(sSQL);
  QueryRegraAux.Open;

  { Caso não encontrado retorna 0 senão retorna a QTD somada }
  If (QueryRegraAux.IsEmpty) Or
     (Trim(QueryRegraaux.FieldByName('QTDEMINUTOS').AsString) = '') then Begin
    Result := '0';
  End Else Begin
    Result := QueryRegraaux.FieldByName('QTDEMINUTOS').AsString;
  End;

End; { QTDMINUTOS() }

procedure TRegra.LimpaVariaveis;
Var
  wInt, wInt1 : Integer;
begin
  For  wInt := 1 to 700 Do Begin
    For  wInt1 := 1 to 2 Do Begin
      aTabVariaveis[wInt, wInt1] := '';
    End;
  End;
  iTotVariaveis := 0;
  aTabVariaveis[1,1] := 'HOJE';                  // Cria variável hoje
  aTabVariaveis[1,2] := DateToStr(Date);
  iTotVariaveis := iTotVariaveis + 1;
end;

procedure TRegra.SetTipoCliente(const Value: TTipoCliente);
begin
  FTipoCliente := Value;

  If FTipoCliente = tcFundacao Then Begin
    sCampoPesquisa := 'IDPATRO';
  End Else Begin
    sCampoPesquisa := 'IDPESSJUR';
  End;

// Busca as ocorrencias de uma rubrica no Histórico em um periodo, por pessoa, patro
// Agrupando e Somandos os valores por Mes
  With QryPro Do Begin
    SQL.Clear;
    SQL.Add('SELECT '+RuleNumber+' AS IDREGRA, H.MES, C.COTVALOR, SUM(H.VALORPROVENTO) AS VALORPROVENTO ');
    SQL.Add('FROM  HISTRUBSAL H, COTACAOMOEDA C, MOEDA M ');
    SQL.Add('WHERE   (UPPER(M.MOESIGLA) =   UPPER(:TETO)) ');
    SQL.Add('  AND (H.IDPESSOA=       :PESSOA) ');
    SQL.Add('  AND (H.MES >=          :MESINI) ');
    SQL.Add('  AND (H.MES <           :MESFIM) ');
    SQL.Add('  AND (H.'+sCampoPesquisa+'  =      :PESSJUR)    ');
    SQL.Add('  AND (H.CODPROVDESC IN  (:RUBRICA))  '); { O IN era = sem "()" trocado pela Dany (CRT) }
    SQL.Add('  AND (H.MES NOT LIKE ''%13'')        ');
    SQL.Add('  AND (C.MOECODIGO=M.MOECODIGO)       ');
    SQL.Add('  AND (SUBSTR(C.COTMESREF,3,4)||''/''||SUBSTR(C.COTMESREF,1,2) = ');
    SQL.Add('            (SELECT  MAX(SUBSTR(COTMESREF,3,4)||''/''||SUBSTR(COTMESREF,1,2)) AS COTMESREF ');
    SQL.Add('             FROM COTACAOMOEDA                   ');
    SQL.Add('             WHERE MOECODIGO = M.MOECODIGO AND   ');
    SQL.Add('                   SUBSTR(COTMESREF,3,4)||''/''||SUBSTR(COTMESREF,1,2) <= H.MES ) )');
    SQL.Add('GROUP BY ');
    SQL.Add('  H.MES, C.COTVALOR ');
    SQL.Add('ORDER BY ');
    SQL.Add('  H.MES DESC');
  End;

end;

procedure TRegra.SetMessageInfo(const Value: String);
begin
  FMessageInfo := Value;
  MsgDlgRegra(FMessageInfo,'Regra ',mtInformation,[mbOk],0);
end;

//BRUNO AZEVEDO SOL 147630-6881 KINTANA 1466979
Function TRegra.RUBRINDIV13(Formula:String): String;
Var
  sCodProvDesc, sSQL, vRub : String;
  vRegraOld, vRegra : LongInt;
  I, iAlgorAtualAnt : Integer;
  sExecutaRegra, sSomenteAtivas, sSQLAtivas, sDataInicio : String;
  iCont:integer;
  bPlanoPrevContab:Boolean;
  bTipoFolha:Boolean;
begin
  sExecutaRegra := 'N';
  sDataInicio := 'N';//SOL 121261 - Ádler Souza

  Formula := Trim(Copy(Formula, 13,Length(Formula)));
  Formula := Copy(Formula, 1, Length(Formula)-1);

  I := Pos(',', Formula);

  sCodProvDesc := Copy(Formula,1,(I-1));
  sCodProvDesc := PegaValor(sCodProvDesc);

  Formula := Copy(Formula, I + 1, Length(Formula));

  I := Pos(',', Formula);
  If I <= 0 Then I := (Length(Formula)+1);

  sExecutaRegra := Copy(Formula, 1, (I-1));
  sExecutaRegra := PegaValor(sExecutaRegra);

  Formula := Copy(Formula, I + 1, Length(Formula));

  I := Pos(',', Formula);

  If I <= 0 Then I := (Length(Formula)+1);

  sSomenteAtivas := Copy(Formula,1,(I-1));
  sSomenteAtivas := PegaValor(sSomenteAtivas);

  //SOL 121261 - Ádler Souza
  Formula := Copy(Formula, I + 1, Length(Formula));

  I := Pos(',', Formula);

  If I <= 0 Then I := (Length(Formula)+1);

  sDataInicio := Copy(Formula,1,(I-1));
  sDataInicio := PegaValor(sDataInicio);
  // Fim - SOL 121261 - Ádler Souza

  { Busca IDRUBRICA }
  sSQL := 'SELECT IDPROVENTO FROM PROVDESC WHERE  CODPROVDESC = '+QuotedStr(sCodProvDesc);
  If Not FazQuery(QueryRegraAux, sSQL) Then
    Exit;

  vRub := QueryRegraAux.FieldByName('IDPROVENTO').AsString;
  QueryRegraAux.Close;

     //Verifica se o Campo IDPLANPREVCONTAB existe na Query de Entrada
     bPlanoPrevContab:=False;
     for iCont:=0 to FQueryIn.FieldCount-1 do
       begin
          if FQueryIn.FieldList.Fields[iCont].DisplayName = 'IDPLANPREVCONTAB' then
             bPlanoPrevContab:= True;
       end;

   bTipoFolha:=False;
     for iCont:=0 to FQueryIn.FieldCount-1 do
       begin
          if FQueryIn.FieldList.Fields[iCont].DisplayName = 'TIPOFOLHA' then
             bTipoFolha:= True;
       end;

  sSQL :=   'SELECT R.SEQRUBRICAINDIV, R.IDREGRACALCULO, R.VALORRUBRICA, FLGPERMANENTE, FLGDESATIVADO '+
            'FROM RUBRICAINDIV R, '+
       	    '     (SELECT MAX(R.SEQRUBRICAINDIV) TOT FROM RUBRICAINDIV R WHERE '+
            '      R.IDPESSOA = '+FQueryIn.fieldbyname('IDPESSOA').AsString+
            '      AND R.IDRUBRICA = '+vRub+') X '+
            'WHERE R.IDPESSOA = '+
            FQueryIn.fieldbyname('IDPESSOA').AsString+' AND R.IDRUBRICA = '+vRub+
            '  AND X.TOT = R.SEQRUBRICAINDIV ';

            //SOL121261 - Ádler Souza
            if (sDatainicio = 'S') then
              sSQL := sSQL+ '  AND DATAINICIO <= '+quotedstr(FQueryIn.fieldbyname('DATAREF').AsString);
            //Fim - SOL121261 - Ádler Souza

             //Thiago Passos SOL 124272 Ktn 649353 10/11/2009
              if (bPlanoPrevContab=True) and (Trim(FQueryIn.fieldbyname('IDPLANPREVCONTAB').AsString) <> '') then
                sSQL:= sSQL+ '  AND R.IDPLANOCONTABIL = ' + FQueryIn.fieldbyname('IDPLANPREVCONTAB').AsString;

              if (bTipoFolha=True) and (Trim(FQueryIn.fieldbyname('TIPOFOLHA').AsString) <> '') then begin
                if Trim(FQueryIn.fieldbyname('TIPOFOLHA').AsString) <> '2' then begin
                   //sSQL:= sSQL+ '  AND R.FLGUSAABONO = ' + FQueryIn.fieldbyname('TIPOFOLHA').AsString; // Renato Visoni SOL 135399 Kintana 805304
                   sSQL:= sSQL+ '  AND R.FLGUSAABONO IN (0,1) ' ;                                        // Renato Visoni SOL 135399 Kintana 805304
                end else begin
                   sSQL:= sSQL+ '  AND ((nvl(r.flgantecipabono,0) = 1) or  (nvl(r.flgantecipaabonoinss,0) =1))';
                end;
              end;

  sSQLAtivas := '';
  If FazQuery(QueryRegraAux, sSQL) Then
  begin
    if QueryRegraAux.FieldByName('FLGDESATIVADO').AsInteger = 0 then
    begin
      if QueryRegraAux.FieldByName('FLGPERMANENTE').AsInteger <> 1 then
        if ( sSomenteAtivas = 'S' ) Then
          sSQLAtivas := ' AND NUMOCORRENCIAS < PARCELAS ';
    end
    else if QueryRegraAux.FieldByName('FLGDESATIVADO').AsInteger = 1 then
    begin
      QueryRegraAux.Close;
      Result := '';
      exit;
    end;
  end;
  QueryRegraAux.Close;

  With QueryRegra Do Begin
    Close;
    SQL.Clear;
    sSQL := 'SELECT R.SEQRUBRICAINDIV, R.IDREGRACALCULO, R.VALORRUBRICA, R.FLGUSAABONO '+
            'FROM RUBRICAINDIV R, '+
       	    '     (SELECT MAX(R.SEQRUBRICAINDIV) TOT FROM RUBRICAINDIV R WHERE '+
            '      R.IDPESSOA = '+FQueryIn.fieldbyname('IDPESSOA').AsString+
            '      AND R.IDRUBRICA = '+vRub+ sSQLAtivas +') X '+
            'WHERE R.IDPESSOA = '+
            FQueryIn.fieldbyname('IDPESSOA').AsString+' AND R.IDRUBRICA = '+vRub+
            '  AND X.TOT = R.SEQRUBRICAINDIV ';

            //SOL121261 - Ádler Souza
            if (sDatainicio = 'S') then
              sSQL := sSQL+ '  AND DATAINICIO <= '+quotedstr(FQueryIn.fieldbyname('DATAREF').AsString);
            //Fim - SOL121261 - Ádler Souza

             //Thiago Passos SOL 124272 Ktn 649353 10/11/2009
              if (bPlanoPrevContab=True) and (Trim(FQueryIn.fieldbyname('IDPLANPREVCONTAB').AsString) <> '') then
                 sSQL:=sSQL+  '  AND R.IDPLANOCONTABIL = ' + FQueryIn.fieldbyname('IDPLANPREVCONTAB').AsString ;

              if (bTipoFolha=True) and (Trim(FQueryIn.fieldbyname('TIPOFOLHA').AsString) <> '') then begin
                if Trim(FQueryIn.fieldbyname('TIPOFOLHA').AsString) <> '2' then begin
                   //sSQL:= sSQL+ '  AND R.FLGUSAABONO = ' + FQueryIn.fieldbyname('TIPOFOLHA').AsString; // Renato Visoni SOL 135399 Kintana 805304
                   sSQL:= sSQL+ '  AND R.FLGUSAABONO IN (0,1)';                                          // Renato Visoni SOL 135399 Kintana 805304
                end else begin
                   sSQL:= sSQL+ '  AND ((nvl(r.flgantecipabono,0) = 1) or  (nvl(r.flgantecipaabonoinss,0) =1))';
                end;
              end; //Fim - Thiago Passos SOL 124272 Ktn 649353 10/11/2009

           sSQL:=sSQL +' '+ sSQLAtivas;
    SQL.Add(sSql);
    Open;
  End;

  If QueryRegra.IsEmpty Then
    Result := ''
  Else Begin
    If sExecutaRegra = 'S' Then begin
      Result := QueryRegra.FieldbyName('IDREGRACALCULO').AsString;
      If Result <> '' Then Begin
        iAlgorAtualAnt := iAlgorAtual;
        Result := ExecutaRegraInterna(StrtoInt(Result), StrtoInt(vRub));
        iAlgorAtual := iAlgorAtualAnt;
        iTotRegs := CarregaAlgoritmos(fRuleName);
      End;
     End Else Begin
      Result := QueryRegra.FieldbyName('VALORRUBRICA').AsString;
    End;
  End;
  if (QueryRegra.FieldbyName('FLGUSAABONO').AsString <> '1') then begin
    Result := '';
  end;
End;
//BRUNO AZEVEDO SOL 147630-6881 KINTANA 1466979

//INICIO - André Oliveira SOL 136384/10042 Kintana 1688458
Function TRegra.MAIORCFCOD(Formula : String) : string;
var
   sMsg,sResult, vSql, vTipo, vIndPCC, vData, vFormulaAux : string;
   i : LongInt;
begin
   Result := '';
   vFormulaAux := Copy(Formula,12,Length(Formula));
   vFormulaAux := Copy(vFormulaAux,1,Length(vFormulaAux)-1);

   i           := Pos(',',vFormulaAux);
   vTipo       := Copy(vFormulaAux,1,i-1);
   vTipo       := PegaValor(vTipo);
   vFormulaAux := Copy(vFormulaAux,i+1,Length(vFormulaAux));

   if vTipo = '' then
    begin
       if FQueryIn.FindField('TIPO') <> NIL Then
          vTipo := FQueryIn.FieldByName('TIPO').AsString;
    end;

   i           := Pos(',', vFormulaAux);
   vData       := Copy(vFormulaAux,1,i-1);
   vData       := PegaValor(vData);
   vFormulaAux := Copy(vFormulaAux,i+1,Length(vFormulaAux));

   if vData = '' then
    begin
       if FQueryIn.FindField('DATAREF') <> NIL Then
          vData := FQueryIn.FieldByName('DATAREF').AsString;
    end;

   vIndPCC     := vFormulaAux;
   vIndPCC     := PegaValor(vIndPCC);

   if vIndPCC = '' then
    begin
       if FQueryIn.FindField('INDICADOR_PCC') <> NIL Then
          vIndPCC := FQueryIn.FieldByName('INDICADOR_PCC').AsString;
    end;


    if Trim(vTipo)       = '' then
     sMsg := 'TIPO';

   if Trim(vData)       = '' then
    if trim(sMsg) <> '' then
       sMsg := sMsg + ', DATAREF'
    else
       sMsg := 'DATAREF';

   if Trim(vIndPCC)  = '' then
    if trim(sMsg) <> '' then
       sMsg := sMsg + ', INDICADOR_PCC'
    else
       sMsg := 'INDICADOR_PCC';


   if trim(sMsg) <> '' then
   begin
      MessageDlg('Campos Obrigatórios não preenchidos: '+sMsg, mtWarning, [mbOK], 0);
      Exit;
   end;

   try
      fQueryIn.FieldByName('IDPESSJUR').AsString;
   except
      MsgDlgRegra('Campo IDPESSJURrena Necessário no Sql de entrada.','Regra - Erro',mtError,[mbOk,mbHelp],0);
      Exit;
   end;

   if vIndPCC = 'S'
   then vIndPCC := ' AND    C.FLGPCC     = 1 '
   else if vIndPCC = 'N'
        then vIndPCC := ' AND    C.FLGPCC     = 0 '
        else vIndPCC := ' ';

   if vTipo = 'C' then begin { Cargo }
       vSQL := ' SELECT C.CODIGO  AS CODIGO '+
               ' FROM   CARGOEXT C, CARGOXNIVEL CN, FAIXANIVEL F '+
               ' WHERE  F.DATAEFETIVACAO <= TO_DATE('''+vData+''',''DD/MM/YYYY'') '+
               ' AND    F.DATAEFETIVACAO >  TO_DATE('''+'01/06/1994'+''',''DD/MM/YYYY'') '+
               ' AND    F.IDPESSJUR  =  '+fQueryIn.FieldByName('IDPESSJUR').AsString+
               ' AND    F.IDNIVEL    = CN.IDNIVEL '+
               ' AND    C.IDPESSJUR  = CN.IDPESSJUR  '+
               ' AND    C.IDCARGOEXT = CN.IDCARGOEXT '+
               vIndPCC+
                ' AND    F.VALOR  =  (SELECT MAX(F.VALOR)AS VALOR  '+
                                   ' FROM   CARGOEXT C, CARGOXNIVEL CN, FAIXANIVEL F '+
                                   ' WHERE  F.DATAEFETIVACAO <= TO_DATE('''+vData+''',''DD/MM/YYYY'') '+
                                   ' AND    F.DATAEFETIVACAO >  TO_DATE('''+'01/06/1994'+''',''DD/MM/YYYY'') '+
                                   ' AND    F.IDPESSJUR  =  '+fQueryIn.FieldByName('IDPESSJUR').AsString+
                                   ' AND    F.IDNIVEL    = CN.IDNIVEL '+
                                   ' AND    C.IDPESSJUR  = CN.IDPESSJUR  '+
                                   ' AND    C.IDCARGOEXT = CN.IDCARGOEXT '+
                                   vIndPCC  +
                                   ')'
   end else begin            { Funcao }
       vSQL := ' SELECT C.CODIGO  AS CODIGO'+
               ' FROM   CARGOEXT C, GRUPOCARGOEXT GC, FAIXAGRUPO F '+
               ' WHERE  F.DATAEFETIVACAO <= TO_DATE('''+vData+''',''DD/MM/YYYY'') '+
               ' AND    F.DATAEFETIVACAO >  TO_DATE('''+'01/06/1994'+''',''DD/MM/YYYY'') '+
               ' AND    F.IDPESSJUR     = '+fQueryIn.FieldByName('IDPESSJUR').AsString+
               ' AND    GC.IDGRUPOFUNC  = F.IDGRUPOFUNC  '+
               ' AND    GC.IDCARGOEXT   = C.IDCARGOEXT '+
               ' AND    C.IDPESSJUR     = F.IDPESSJUR   '+
               vIndPCC  +
               ' AND    F.VALOR  =  (SELECT MAX(F.VALOR)AS VALOR  '+
                                     ' FROM   CARGOEXT C, GRUPOCARGOEXT GC, FAIXAGRUPO F '+
                                     ' WHERE  F.DATAEFETIVACAO <= TO_DATE('''+vData+''',''DD/MM/YYYY'') '+
                                     ' AND    F.DATAEFETIVACAO >  TO_DATE('''+'01/06/1994'+''',''DD/MM/YYYY'') '+
                                     ' AND    F.IDPESSJUR     = '+fQueryIn.FieldByName('IDPESSJUR').AsString+
                                     ' AND    GC.IDGRUPOFUNC  = F.IDGRUPOFUNC  '+
                                     ' AND    GC.IDCARGOEXT   = C.IDCARGOEXT '+
                                     ' AND    C.IDPESSJUR     = F.IDPESSJUR   '+
                                     vIndPCC  +
                                     ')';
   end;

   with QueryRegraAux do
   begin
      Close;
      Sql.Clear;
      Sql.Add(vSql);
      SQL.SaveToFile('c:\Planus\Temp\sqlMAIORCFCOD.txt');

      Open;
      if IsEmpty then
       Exit;
       sResult := '';
      if not Eof then
      begin
           Result :=  FieldByName('CODIGO').AsString;
      end;

   end;



end;
//FIM - André Oliveira SOL 136384/10042 Kintana 1688458

// Alterado por FHBS - 02/05/2019 - SIG85462
function TRegra.ExecBUSCAMINFREQCAIXA(formula: String): String;
Var
  sNUMOCOR, sMES, sIDPESSOA, sSQL : String;
  qryAux : TwwQuery;
  i : integer;
begin
  formula    := Copy(formula,19,Length(formula)-19);
  I          := Pos(',',formula);
  sNUMOCOR   := Copy(formula,1,i-1);
  if Copy(sNUMOCOR,1,1) = '@' Then
    sNUMOCOR := copy(sNUMOCOR,2,Length(sNUMOCOR));

  formula    := Copy(formula,i+1,Length(formula));
  i          := pos(',',formula);
  sMES   := copy(formula,1,i-1);
  if copy(sMES,1,1) = '@' Then
    sMES := copy(sMES,2,length(sMES));
  sMES := PegaValor(sMES);

  formula    := Copy(formula,i+1,length(formula));
  sIDPESSOA  := Trim(formula);
  if copy(sIDPESSOA,1,1) = '@' Then
    sIDPESSOA := copy(sIDPESSOA,2,length(sIDPESSOA));
  sIDPESSOA := PegaValor(sIDPESSOA);

  sSQL := '';
  sSQL := sSQL + 'SELECT NVL(SUM(F.QTDEMINUTOS),0) FROM FREQCAIXA F ' +
                 ' WHERE F.NUMOCOR = ' + sNUMOCOR +
                 '   AND TO_CHAR(DATAINICIO, ''YYYY/MM'') = ' + QuotedStr(sMES) +
                 '   AND F.IDPESSOA = ' + sIDPESSOA;

  qryAux := TwwQuery.Create(Self);
  qryAux.DatabaseName := FDatabaseName;

  qryAux.Close;
  qryAux.SQL.Text := sSQL;

  qryAux.Open;

  Result := FloatToStr(qryAux.Fields[0].AsFloat);

  qryAux.Close;
end;
// Alterado por FHBS - 02/05/2019 - SIG85462


// Inicio - Ewerton Beltramini - SIG99274 // Andre Imakawa - SIG 99564
function TRegra.ExecABONOMES(formula: String): String;
Var
  sTipo, sFonte, sSQL : String;
  qryAux : TwwQuery;
  I, F, tamanho : integer;
begin

  formula := Copy(formula,9,Length(formula)-8);
  I       := Pos('(',formula);
  F       := Pos(',',formula);
  sTipo   := Copy(formula,I + 1,(F - I) -1);
  if Copy(sTipo,1,1) = '@' Then
     sTipo := copy(sTipo,2,Length(sTipo));
  sTipo := PegaValor(sTipo);

  formula    := Copy(formula,F,length(formula));
  I       := Pos(',',formula);
  F       := Pos(')',formula);
  sFonte  := Copy(formula,I + 1,(F - I) -1);
  if copy(sFonte,1,1) = '@' Then
    sFonte := copy(sFonte,2,length(sFonte));
  sFonte := PegaValor(sFonte);

  sSQL := 'SELECT MESADIANTABONOFUND, MESADIANTABONOINSS, MESABONOFUND, MESABONOINSS FROM CM.PARAMAPREV WHERE ROWNUM < 2';
  qryAux := TwwQuery.Create(Self);
  qryAux.DatabaseName := FDatabaseName;
  qryAux.Close;
  qryAux.SQL.Text := sSQL;
  qryAux.Open;

  if sTipo = '1' then
  begin
    if sFonte = '1' then
       Result := qryAux.FieldbyName('MESABONOFUND').AsString
    else if sFonte = '2' then
       Result := qryAux.FieldbyName('MESABONOINSS').AsString;
  end
  else if sTipo = '2' then
  begin
    if sFonte = '1' then
       Result := qryAux.FieldbyName('MESADIANTABONOFUND').AsString
    else if sFonte = '2' then
       Result := qryAux.FieldbyName('MESADIANTABONOINSS').AsString;
  end;

  qryAux.Close;

end;
// Ewerton Beltramini - SIG99274. Fim. // Andre Imakawa - SIG 99564



End.

{ Configuração Oracle NLS_LANG                }
{ LOCALMACHINE\SOFTWARE\ORACLE\NLS_LANG       }
{ BRAZILIAN PORTUGUESE_BRAZIL.WE8ISO8859P1    }
