unit UFuncAlienacao;

// -----------------------------------------------------------------------------
//Rotina..........: CalculaTipoCalculo20
//Solicitação.....: WO37133
//Data............: 06/05/2026
//Responsável.....: Leandro Pocebon
//Descrição.......: .Ajuste no calculo do juros da prestação
// -----------------------------------------------------------------------------
//Rotina..........: CalculaTipoCalculo20
//Solicitação.....: WO25616
//Data............: 18/09/2025
//Responsável.....: Paulo Nobre
//Descrição.......: .Ajuste no ano/mes para encontrar a útlima cotação informada.
//                  .Rotina implementada para recuperar a existência ou não do
//                   valor do alterador quando lançado para ajustar o valor da
//                   parcela anterior nos casos do cálculo equivocado. Ex.:
//                   CABO DE SANTO AGOSTINHO - CONTRATO = "000632".
// -----------------------------------------------------------------------------
//Rotina..........: CalculaTipoCalculo20
//Solicitação.....: WO24956
//Data............: 26/08/2025
//Responsável.....: Paulo Nobre
//Descrição.......: Em conscenso com a Marimar e Gestoras, ficou alinhado que a
//                  cotação usada para o cálculo, sempre será a última informada
//                  tendo como referencia o ano + mês do vencimento da parcela.
// -----------------------------------------------------------------------------
//Rotina..........: CalculaTipoCalculo20
//Solicitação.....: WO24946
//Data............: 21/08/2025
//Responsável.....: Paulo Nobre
//Descrição.......: .Implementado nova formulação para o cálculo da taxa de juros
//                   com período anual e taxa mensal;
//                  .Implementado nova regra para a apuração da parcela mensal
//                   segundo formulação apresentada na nova versão da planilha
//                   de cálculo da área.
// -----------------------------------------------------------------------------
//Rotina..........: CalculaTipoCalculo20
//Solicitação.....: WO24601
//Data............: 15/08/2025
//Responsável.....: Paulo Nobre
//Descrição.......: Implementado nova rotina para cálculo do valor da prestação,
//                  baseado nos métodos de cálculos implementado na planilha de
//                  cálculo usada pela Área. Desta forma fica mais simples e
//                  fácil de acompanhar junto aos Gestores a mesma forma de
//                  realizar e evidenciar os testes.
// -----------------------------------------------------------------------------
//Rotina..........: CalculaTipoCalculo20
//Solicitação.....: WO24125
//Data............: 04/08/2025
//Responsável.....: Leandro Pocebon
//Descrição.......: .Ajustado inicializar valor prestação anterios para calculo da parcela
// -----------------------------------------------------------------------------
//Rotina..........: CalculaTipoCalculo19 e CalculaTipoCalculo20
//Solicitação.....: WO20652
//Data............: 05/06/2025
//Responsável.....: Paulo Nobre
//Descrição.......: .Ajustado a forma de apuração do VLRJUROSPARC nas funções
//                   acima;
//                  .Inclusão de ajustes para correção de meses futuros em aberto
//                   Especificamente para o contrato de venda do ECO-RESORT DO
//                   CABO DE SANTO AGOSTINHO. Função: CalculaTipoCalculo20.
// -----------------------------------------------------------------------------
//Rotina..........: CalculaTipoCalculo19       
//Solicitação.....: WO 19054
//Data............: 06/03/2025                      
//Responsável.....: Cássio Florencio Rovaroto
//Descrição.......: Correção da rotina de cálculo de parcelas no Tipo de Cálculo 19.
//------------------------------------------------------------------------------------------------
//Rotina..........: CalculaTipoCalculo20
//Solicitação.....: WO 19287
//Data............: 06/03/2025
//Responsável.....: Cássio Florencio Rovaroto
//Descrição.......: Correção da rotina de cálculo de parcelas no Tipo de Cálculo 20.
//------------------------------------------------------------------------------------------------
//Rotina..........: CalculaTipoCalculo19, CalculaTipoCalculo20
//Solicitação.....: WO 18846
//Data............: 11/02/2025
//Responsável.....: Cássio Florencio Rovaroto
//Descrição.......: Correção da rotina de cálculo de parcelas no Tipo de Cálculo 19 e criação da
//                  rotina de cálculo de parcelas tipo 20.
//------------------------------------------------------------------------------------------------
//Rotina..........: CalculaTipoCalculo19
//Solicitação.....: WO 17768
//Data............: 08/01/2025
//Responsável.....: Cássio Florencio Rovaroto
//Descrição.......: Correção da rotina de cálculo de parcelas no Tipo de Cálculo 19, corrigindo a
//                  atribuição do valor de juros para a parcela.
//------------------------------------------------------------------------------------------------
//Rotina..........: CalculaTipoCalculo19
//Solicitação.....: WO 15334
//Data............: 05/11/2024
//Responsável.....: Cássio Florencio Rovaroto
//Descrição.......: Correção da rotina de cálculo de parcelas no Tipo de Cálculo 19.
//------------------------------------------------------------------------------------------------
//Rotina..........: GeraParcela, CalculaTipoCalculo19
//Solicitação.....: WO 7669
//Data............: 09/05/2024
//Responsável.....: Cássio Florencio Rovaroto
//Descrição.......: Criação de Nova Forma de Cálculo.
//------------------------------------------------------------------------------------------------
//Rotina..........: TemParcIntegrada
//N. Sol..........: 231549
//N. Kintana......:
//Data............: 07/05/2014
//Responsável.....: Fernando Xavier
//Descrição.......: Correção na validação da Repactuação Contratual.
//------------------------------------------------------------------------------------------------
//
//	   Funções do Módulo de Alienação
//
//	Autor             :  Vinícius Meyer Lana
//	Data de Início    :  01/09/2001
//	Data de Término   :
//
//  FUNÇÕES PUBLICADAS:
//
//    BuscaCondPag      - Procura a Condição de Pagamento Vigente em uma Data ( ou a última )
//    CalcFimCondPag    - Calcula a Data Final de uma Condição de Pagamento
//    CalcValorPresente - Calcula o Valor Presente de uma parcela
//    CalcSaldoDevedor  - Calcula o Saldo Devedor TEÓRICO de um contrato / condição em uma determinada data
//    CorrigeParcelas   - Corrige um grupo de Parcelas em Atraso até uma determinada Data,
//                        atribuindo Juros, Multa e CM
//    TipoParcela       - Retorna a Descrição por Extenso de um Tipo de Parcela
//    TipoCalculo       - Retorna a Descrição por Extenso do tipo de calculo
//    GeraParcela       - Gera as Parcelas de uma condição de pagamento pelo método PRICE
//    BuscaUltMesGerado - Procura o Ultimo Mes com Parcela Gerada de uma Cond. de Pagamento
//    GravaEstorno      - Limpa Flag de Integração e Código de Documento no Estorno de Parcelas
//    TemRepacSuperior  - Verifica se existe Repactuação superior a data informada
//    TemParcIntegrada  - Verifica se existem Parcelas integradas após a data informada
//    RecalculaParcela  - Recalcula as parcelas de uma Condição de Pagamento
//    VerificaPagto     - Verifica se o Documento já foi pago no Contas a Receber, retornando a data do pagamento
//    ExcluiIntegracao  - Exclui a Integração de Parcela
//    BuscaAlteradores  - Carrega Alteradores por tipo de Imóvel
//
// -----------------------------------------------------------------------------

{
Rotina......: CalculaTipoCalculo16
Nº SOL......: 221141
Nº KINTANA..: 2053650
Data........: 18/12/2012
Responsável.: Edilaine Ferraresi
Descrição...: crítica de duplicidade de lançamento na geração de parcelas

Rotina..........: CalculaTipoCalculo16
N. Sol..........: 174559/8321
N. Kintana......: 1584359
Data............: 23/02/2012
Responsável.....: Helen V. Bianchi
Descrição.......: Alterado função CalculaTipoCalculo16

Rotina..........: CalculaTipoCalculo16
N. Sol..........: 174559
N. Kintana......: 1577324
Data............: 17/02/2012
Responsável.....: Helen V. Bianchi
Descrição.......: Alterado função CalculaTipoCalculo16

Rotina..........: CalculaTipoCalculo16
N. Sol..........: 172911
N. Kintana......: 1558916
Data............: 27/01/2012
Responsável.....: Helen V. Bianchi
Descrição.......: Alterado a condição da função CalculaTipoCalculo16

Rotina..........: CalculaTipoCalculo16
N. Sol..........: 136335/7462
N. Kintana......: 1534371
Data............: 03/01/2012
Responsável.....: Fábio Henrique Beccaria Sampaio
Descrição.......: Alterado a condição da função CalculaTipoCalculo16

Rotina..........: CalcSaldoDevedor
N. Sol..........: 150488
N. Kintana......: 1093866
Data............: 14/01/2011
Responsável.....: Felipe de Oliveira
Descrição.......: Modificar a forma de calculo 18 no select da citada função


Rotina..........: BuscaCondPag
N. Sol..........: 145690
N. Kintana......: 980821
Data............: 19/10/2010
Responsável.....: Felipe de Oliveira
Descrição.......: alteração realizada para o vlr correto do saldo devedor ser gravado na tabela parcfinancimov
 sendo assim foi acrescentado mais 1 parâmetro a função, data de vigencia (dvigencia)



Rotina..........: GeraParcela
N. Sol..........: 137729
N. Kintana......: 836197
Data............: 17/09/2010
Responsável.....: Cássio Camargo
Descrição.......: Correção no processo de geração de parcelas, para evitar que
                  sejam linhas de Autlização de Saldo quando o valor for igual a 0 (zero).

Rotina..........: CalcSaldoDevedor
N. Sol..........: 122988
N. Kintana......: 73303712
Data............: 03/02/2010
Responsável.....: Cássio Camargo
Descrição.......: Ajuste feito para tratar problema de contratos de alienção
                  fechados que ainda possuem saldo devedor, utilizando uma
                  determinada formula de cálculo.

Rotina..........: GeraParcelas
N. Sol..........: 91849 e 95458
N. Kintana......: 390045
Data............: 05/11/2008
Responsável.....: Emerson S.
Descrição.......: Problema ao lançar Amortização/Gerar Parcelas, para contratos com 1 parcela e
                  várias amortizacoes porem não possui JUROS, MULTA E NEM CORREÇOE (TIPO 9)
}

interface

uses
   sysUtils, math, forms, WwQuery, Dialogs, DB, DBTables, uCtrlContratoImovel,
   uModuloImobiliario, UComunsImobiliarioDB, uCMClientDataSet, uCtrlOperImob, uCtrlParcFinancImov,
   {uCtrlDocumento}uCtrlImobDocumento, uCtrlPadroes;

type
    TCondPag = Record
       fIDContratoImovel : Double;
       fIDCondPagImovel  : Double;
       fIDCondInicial    : Double;
       sTipoCondPag      : String;
       fSaldoDev         : Double;
       dDataVencimento   : TDateTime;
       dDataIniAmortiz   : TDateTime;
       fSaldoDevComposto : Double;
       dUltVenctoComposto: TDateTime;
       fCorrAcumComposto : Extended;
       fJurosAcumComposto: Extended;
       bJurosCarencia    : Boolean;
       iFormaCalculo     : Integer;
       iNumParcelas      : Integer;
       iPeriodo          : Integer;
       iPeriodoMeses     : Integer;
       sPrazo            : String;
       iIDIndCorr        : Integer;
       iIDIndProj        : Integer;
       fTaxaJuros        : Double;
       fTaxaJurosAjust   : Double;
       fTaxaJurosParc    : Double;
       fCorrecaoProj     : Double;
       sPeriodoTaxa      : String;
       sFlgReajMensal    : String;
       sFlgCMMensal      : String;
       iMesRefReajuste   : Integer;
       dDataIni          : TDateTime;
       dDataFim          : TDateTime;
       dDataAssinatura   : TDateTime;
       dIniFatorCM14     : TDateTime;
       sFlgTipoContrato  : String;
       iPeriodoReajuste  : Integer;
    end;


type
   TFuncAlienacao = class(TObject)
   private
      // Marchetti - Pendencia 20265
      function  CalculaTipoCalculo14  (iCondPag:Double; dVenctoIni,dDataBase: TDateTime; qryParcTemp: TwwQuery): Double;
      // Fim - Marchetti - Pendencia 20265

      function  CalculaTipoCalculo16  (iCondPag:Double; dVenctoIni,dDataBase: TDateTime; qryParcTemp: TwwQuery): Double;

      // Marchetti - Peendencia 26485
      function CalculaTipoCalculo18   (iCondPag:Double; dVenctoIni,dDataBase: TDateTime; qryParcTemp: TwwQuery): Double;
      // Fim Marchetti - Peendencia 26485

      //Cássio Rovaroto - WO 7669
      function CalculaTipoCalculo19(iCondPag:Double; dVenctoIni,dDataBase: TDateTime; qryParcTemp: TwwQuery): Double;
      function CalculaTipoCalculo20(iCondPag:Double; dVenctoIni,dDataBase: TDateTime; qryParcTemp: TwwQuery): Double;

      function  CalcAntecipacao       (const iFormaCalculo:Integer; const iCondPag: Double; const iParc: Integer; const dVencto, dVenctoAnt: TDateTime; const fSaldoDevedor, fVlrParcela, fVlrJurosAtual, fTaxaJuros:Extended; var bAntecipaProx: Boolean) : Extended;
      function  QtdeParcMesmoVencto   (const iCondPag: Double; const dVencto: TDateTime):Integer;
      function  VerifAmortiz          (const iCondPag,rSaldoAnt:Double;
                                       const mes,ano:Integer;
                                       var rSaldo,rPerc:Double;
                                       Var dDataVencto : TDateTime;
                                       var fValorAmortiz : Double): Boolean;

      function  ApuraResiduoAcumulado (iCondPag:Double; iParcIni, iParcFim: Integer; fFator: Double; bIncorpora: Boolean;
                                       var qryParcTemp: TwwQuery) : Double;

   public
// Felipe de Oliveira SOL 145690 Ktn980821
//alteração realizada para o vlr correto do saldo devedor ser gravado na tabela parcfinancimov
// sendo assim foi acrescentado mais 1 parâmetro a função, data de vigencia (dvigencia)
      function  BuscaCondPag     (const iCond:Double; const mes,ano: Double; const bCondFinal: Boolean; var TpCondPag:TCondPag; const bSaldoComposto: Boolean = False; dvigencia : TDateTime = -1) : Boolean;
      function  BuscaSaldoComposto(const fContrato: Double; const dVencto: TDateTime; const iForma: integer; var dUltVencto: TDateTime; var fFatorAcum, fJurosAcum:Extended): Extended;
      function  CalcFimCondPag   (iIdRepactua, iIdCond: Double; iParc,iPeriodo: Integer; sPrazo: String;
                                  dtIni,dtVenc: TDateTime; var dtFim: TDateTime; bAtualiza: Boolean): Boolean;
      function  CalcValorPresente(const iIdParc: Integer; const dAntecipa: TDateTime): Extended;
      function  CalcSaldoDevedorAnt (const iContrato: Integer; const iCondPag: Integer = -1; const dData:TDateTime = -1): Extended;
      function  CalcSaldoDevedor (const iContrato: Integer; const iCondPag: Integer = -1; const dData:TDateTime = -1): Extended;
      function  CorrigeParcelas  (const iContrato, iComprador, iResponsavel,iAdministradora, iCondPag: Double; dDataBaixa: TDateTime): Boolean;
      function  TipoParcela      (const iFlgTipo, iFlgIntegra: Integer): String;
      function  TipoCalculo      (const iFlgTipo: Integer): String;
      function  GeraParcela      (iCondPag:Double; dVenctoIni,dDataBase: TDateTime; qryParcTemp: TwwQuery): Double;
      function  BuscaUltMesGerado(const iCondPag:Double): TDateTime;
      function  GravaEstorno     (const iParc: Integer): Boolean;
      function  TemRepacSuperior (const iCond, iRepac: Integer; const dDataIni: TDateTime): Boolean;
      function  TemParcIntegrada (const iCond: Integer; const dDataIni: TDateTime; var iQtde: Integer): Boolean;
      function  RecalculaParcela (const iIdCondInicial: Double; const dDataIni: TDateTime): Boolean;
      function  VerificaPagto    (const iDocumento: Integer; var dPagto : TDateTime): Boolean;
      function  ExcluiIntegracao (const iDocumento,iPlanilha,iParcela,iTipo: Integer; const dIntegra: TDateTime; const bProgresso: Boolean; var sMens: String ): Boolean;
      function  BuscaAlteradores (const iContrato,iParcela: Integer; var iAltMulta,iAltJuros,iAltCorr: Integer; var sAltMulta,sAltJuros,sAltCorr: String) : Boolean;
      function  InsereMsgBoleto  (const iDocumento: Int64; const vMensagem: array of string) : Boolean;

      //--Emerson, incio, KT 390045, SOL 91849 ------------------------------------------//
      function  GetDataAmortizacao:TDateTime;
      procedure SetDataAmortizacao          (dDataLancamentoParam : TDateTime);

      function  GetStadoDelete:Boolean;
      procedure SetStadoDelete              (bStadoDelete : Boolean);

      function  BuscaDataVencimento         (iCondPagImovel : Double; iNumParc : integer): TDateTime;
      function  CalculaPrestacao            (iCondPag : Double ; iParc : Double; dDataVencimento : TDateTime; fAmoztizacao  : double) : double;
      function  ReCalculaAmortizacao        (iCondPag : Double; iParc :integer  ): Double;
      function  sqlUltimaAmortizacao        (iCondPag : Double ): TDateTime;
      function  sqlBuscaParcela             (iCondPag : Double; iParcela : integer ): TDateTime;
      function  BuscaSaldoDevedor           (iCondPag : double; iNumParcela :integer ) : double;
      function  BuscaSaldo_antes_Amortizacao(iCondPag : double ) : double;
      function  TotalAmortizacao            (iCondPag : double ) : double;
      //--Emerson, FIM ------------------------------------------------------------------//


end;

var FuncAlienacao        : TFuncAlienacao;
    dDataAmortizacao     :TDateTime;
    fValorSD_AposAmortiz : Double;
    bDelete              : Boolean;

implementation

uses uComunsImobiliario, uFuncoesImob, uDataBase, uSistema, dFinanciamento, uDiasInUteis,
     uDiasUteis, fAguarde, uCalcDocumento, uMensErro, dBaseDados, dImobiliario,
     jclSysUtils;

{ TFuncAlienacao }

// *********** FUNCAO EM DESUSO ************
// *****************************************
//========================================================================================
// Função para Calcular o Valor Presente de Uma Parcela
// Data : 19/02/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       sImovel        : Nome do Imóvel
//       iImovelMestre  : id da Imóvel Mestre para o imóvel a ser criado
//       iImovelOrig    : id do Imóvel Original para migração
//
// Obs.: passar (-1) para o imóvel de origem, caso não deseje migrar os dados
//       passar (-1) para o imovel mestre, para criar como mestre
//
// Retorno : id do imóvel criado ou (-1) no caso de erros
//----------------------------------------------------------------------------------------
function TFuncAlienacao.CalcValorPresente(const iIdParc: Integer; const dAntecipa: TDateTime): Extended;
var CondPag               : TCondPag;
    sSql                  : String;
    mes,ano,iIdCondPagIni : Double;
    rTxMercado, rValPresente : Extended;
    fPrestacao, rNumPeriodos : Double;
    dVencto                  : TDateTime;
    rNumMeses : Extended;
begin
   Result := -1;

   // Procura a condição de pagamento original
   sSql := 'SELECT CP.IDCONDPAGIMOVEL, CP.IDCONTRATOIMOVEL,  ' +
           '       CI.PERCTXJURMERC, CI.PERITXJURMERC,       ' +
           '       PF.DATAVENCIMENTO, PF.VLRPRESTACAO        ' +
           '  FROM CONDPAGIMOVEL CP,                         ' +
           '       CONTRATOIMOVEL CI,                        ' +
           '       PARCFINANCIMOV PF                         ' +
           ' WHERE CI.IDCONTRATOIMOVEL = CP.IDCONTRATOIMOVEL ' +
           '   AND PF.IDCONDPAGIMOVEL  = CP.IDCONDPAGIMOVEL  ' +
           '   AND PF.IDPARCFINANCIMOV = ' + IntToStr(iIdParc);
   if not FazQuery(dtmFinanciamento.qryAux,sSql) then begin
      Result := -1;
      Exit;
   end else begin
      iIdCondPagIni := dtmFinanciamento.qryAux.FieldbyName('IDCONDPAGIMOVEL').AsFloat;
      fPrestacao    := dtmFinanciamento.qryAux.FieldbyName('VLRPRESTACAO').AsFloat;
      dVencto       := dtmFinanciamento.qryAux.FieldbyName('DATAVENCIMENTO').AsDateTime;
   end;

   // Converte a taxa do mercado finaceiro definida na proposta/contrato para mes
   rTxMercado := dtmFinanciamento.qryAux.FieldByName('PERCTXJURMERC').AsFloat;
   if dtmFinanciamento.qryAux.FieldByName('PERITXJURMERC').AsString = 'D' then begin
      rTxMercado := Power(((rTxMercado/100) + 1),30);
      rTxMercado := (rTxMercado - 1) * 100;
   end;
   if dtmFinanciamento.qryAux.FieldByName('PERITXJURMERC').AsString = 'A' then begin
      rTxMercado := Power(((rTxMercado/100) + 1),(1/12));
      rTxMercado := (rTxMercado - 1) * 100;
   end;
   rTxMercado := 1 + (rTxMercado / 100);

   // Calcula a Taxa de Juros do Mercado da parcela
   rNumMeses     := (dVencto - dAntecipa)/30;
   if rNumMeses < 1 then begin
      rNumMeses  := rNumMeses + 1;
   end;
   rValPresente  := fPrestacao / Power(rTxMercado, rNumMeses);

   Result := rValPresente;
end;

//========================================================================================
// Função para Buscar a Condição de Pagamento efetiva ( inicio ou repactuacao )
// Data : 19/02/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iCond          : id da Condição de Pagamento
//       mes            : mes efetivo de busca da condição    ( -1 se bCondFinal = True )
//       ano            : ano efetivo de busca da condição    ( -1 se bCondFinal = True )
//       bCondFinal     : True - Abre a última alteração da condição de pagamento
//       TpCondPag      : Retorna o registro com os dados da condição de pagamento
//       bSaldoComposto : Verifica o Saldo Inicial composto ( default = false )
//
// Retorno : True  - Caso exista alguma condição de pagamento
//           False - Caso não seja encontrada nenhuma condição de pagamento
//----------------------------------------------------------------------------------------
// Felipe de Oliveira SOL 145690 Ktn980821
//alteração realizada para o vlr correto do saldo devedor ser gravado na tabela parcfinancimov
// sendo assim foi acrescentado mais 1 parâmetro a função, data de vigencia (dvigencia)
function TFuncAlienacao.BuscaCondPag(const iCond: Double;  const mes,ano: Double;
                                     const bCondFinal: Boolean; var TpCondPag: TCondPag; const bSaldoComposto: Boolean; dvigencia : TDateTime): Boolean;
var
  qryVgv : TwwQuery;
begin
   Result := True;

   qryVgv := TwwQuery.Create(nil);
   qryVgv.DatabaseName := 'BaseDados';

   with dtmFinanciamento.qryAux do begin
      SQL.Clear;
      if bCondFinal = False then begin
         SQL.Add('  SELECT  CP.*, C.CONDATAASSINATURA, C.CONDATAINICIO, C.FLGTIPOCONTRATO, P.VLRSALDODEVEDOR       ');
         SQL.Add('    FROM  CONDPAGIMOVEL CP, CONTRATOIMOVEL C, PARCFINANCIMOV P                                   ');
         SQL.Add('   WHERE  CP.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL                                               ');
         SQL.Add('     AND  ( (CP.IDCONDPAGIMOVEL = :pIDCONDPAGIMOVEL) OR (CP.IDCONDINICIAL = :pIDCONDPAGIMOVEL))  ');
         SQL.Add('     AND  ( :pDATA >= TO_CHAR(CP.DATAINI,' + QuotedStr('YYYYMM') + ') )                          ');
         SQL.Add('     AND  ( :pDATA <= TO_CHAR(CP.DATAFIM,' + QuotedStr('YYYYMM') + ') )                          ');
         Params[0].AsFloat  := iCond;
         Params[1].AsFloat  := iCond;
         Params[2].AsString := FormatFloat('0000',ano) + FormatFloat('00',mes);
         Params[3].AsString := FormatFloat('0000',ano) + FormatFloat('00',mes);
         Open;
      end else begin
         SQL.Add('  SELECT  CP.*, C.CONDATAASSINATURA, C.CONDATAINICIO, C.FLGTIPOCONTRATO ');
         SQL.Add('    FROM  CONDPAGIMOVEL CP, CONTRATOIMOVEL C                            ');
         SQL.Add('   WHERE  CP.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL                      ');
         SQL.Add('     AND  ( (CP.IDCONDPAGIMOVEL = :pIDCONDPAGIMOVEL)                    ');
         SQL.Add('            OR (CP.IDCONDINICIAL = :pIDCONDPAGIMOVEL) )                 ');
         SQL.Add('ORDER BY CP.DATAINI                                                     ');
         Params[0].AsFloat    := iCond;
         Params[1].AsFloat    := iCond;
         Open;
         Last;
      end;

      if not isEmpty then
      begin
         Result := True;
         TpCondPag.fIDContratoImovel := FieldByName('IDCONTRATOIMOVEL').AsFloat;
         TpCondPag.fIDCondPagImovel  := FieldByName('IDCONDPAGIMOVEL').AsFloat;
         TpCondPag.fIDCondInicial    := FieldByName('IDCONDINICIAL').AsFloat;
         TpCondPag.sTipoCondPag      := FieldByName('TIPOCONDPAG').AsString;
// Felipe de Oliveira SOL 145690 Ktn980821 - inicio
//alteração realizada para o vlr correto do saldo devedor ser gravado na tabela parcfinancimov
         if bCondFinal = False then
            if (dvigencia > - 1) and (dvigencia >= StrToDate('01/09/2010')) then
            begin
              if (FieldByName('NUMPARCELAS').AsInteger = 1) and (FieldByName('TIPOCONDPAG').AsString = 'P') then
              begin
                   qryVgv.SQL.Clear;
                   qryVgv.SQL.Add('SELECT DATAVENCIMENTO,VLRSALDODEVEDOR                                ');
                   qryVgv.SQL.Add('  FROM PARCFINANCIMOV                                                ');
                   qryVgv.SQL.Add(' WHERE IDCONDPAGIMOVEL  = :PIDCONDPAGIMOVEL                          ');
                   qryVgv.SQL.Add(' AND FLGTIPOLANC <> 11                                               ');
                   qryVgv.SQL.Add(' AND DATAVENCIMENTO = (SELECT MAX(P.DATAVENCIMENTO) AS DATAVENCIMENTO');
                   qryVgv.SQL.Add(' FROM PARCFINANCIMOV P                                               ');
                   qryVgv.SQL.Add(' WHERE P.IDCONDPAGIMOVEL = :PIDCONDPAGIMOVEL                         ');
                   qryVgv.SQL.Add('   AND P.FLGTIPOLANC <> 11                                           ');
                   qryVgv.SQL.Add('   AND P.DATAVENCIMENTO < :PDATAVENCIMENTO)                          ');
                   qryVgv.ParamByName('PIDCONDPAGIMOVEL').AsFloat := iCond;
                   qryVgv.ParamByName('PDATAVENCIMENTO').AsDate := dvigencia;
                   qryVgv.Open;
              end;// end if
              if not qryVgv.IsEmpty then
                 TpCondPag.fSaldoDev         := qryVgv.FieldByName('VLRSALDODEVEDOR').AsFloat
              else
                 TpCondPag.fSaldoDev         := FieldByName('VLRFINANC').AsFloat;
            end// end if
            else
             TpCondPag.fSaldoDev         := FieldByName('VLRFINANC').AsFloat;
// Felipe de Oliveira SOL 145690 Ktn980821 - Fim 

         TpCondPag.dDataVencimento   := FieldByName('DATAVENCIMENTO').AsDateTime;
         TpCondPag.iFormaCalculo     := FieldByName('FORMACALCULO').AsInteger;
         TpCondPag.iNumParcelas      := FieldByName('NUMPARCELAS').AsInteger;
         TpCondPag.iPeriodo          := FieldByName('PERIODO').AsInteger;
         TpCondPag.sPrazo            := FieldByName('PRAZO').AsString;
         TpCondPag.iIDIndCorr        := FieldByName('INDCORRECAO').AsInteger;
         TpCondPag.iIDIndProj        := FieldByName('IDINDCORRPROJ').AsInteger;
         TpCondPag.fTaxaJuros        := FieldByName('TAXAJUROS').AsFloat;
         TpCondPag.fCorrecaoProj     := FieldByName('PERINDPROJ').AsFloat / 100;
         TpCondPag.sPeriodoTaxa      := FieldByName('PERIODOTAXA').AsString;
         TpCondPag.sFlgReajMensal    := FieldByName('FLGREAJMENSAL').AsString;
         TpCondPag.sFlgCMMensal      := FieldByName('FLGCMMENSAL').AsString;
         TpCondPag.iMesRefReajuste   := FieldByName('MESREFREAJUSTE').AsInteger;
         TpCondPag.dDataIni          := FieldByName('DATAINI').AsDateTime;
         TpCondPag.dDataFim          := FieldByName('DATAFIM').AsDateTime;
         TpCondPag.sFlgTipoContrato  := FieldByName('FLGTIPOCONTRATO').AsString;

         if FieldByName('PERIODOREAJUSTE').IsNull then
            TpCondPag.iPeriodoReajuste := 12
         else
            TpCondPag.iPeriodoReajuste := FieldByName('PERIODOREAJUSTE').AsInteger;

         if not FieldByName('DATACARENCIA').IsNull then begin
            TpCondPag.dDataAssinatura := FieldByName('DATACARENCIA').AsDateTime;
         end else begin
            if FieldByName('FLGTIPOCONTRATO').AsString = 'P' then
                 TpCondPag.dDataAssinatura := FieldByName('CONDATAINICIO').AsDateTime
            else TpCondPag.dDataAssinatura := FieldByName('CONDATAASSINATURA').AsDateTime;

            // Repactuação que gerou novas condições de pagamento (desmembramento ou fusão)
            if (FieldByName('TIPOCONDPAG').AsString = 'R') and (FieldByName('IDREPACTUA').IsNull) then begin
               TpCondPag.dDataAssinatura := FieldByName('DATAINI').AsDateTime;
            end;
         end;

         // parametro utilizado APENAS para fórmula 14 da CBS
         if FieldByName('FLGTIPOCONTRATO').AsString = 'P' then
              TpCondPag.dIniFatorCM14 := FieldByName('CONDATAINICIO').AsDateTime
         else TpCondPag.dIniFatorCM14 := FieldByName('CONDATAASSINATURA').AsDateTime;

         // Repactuação que gerou novas condições de pagamento (desmembramento ou fusão)
         if (FieldByName('TIPOCONDPAG').AsString = 'R') and (FieldByName('IDREPACTUA').IsNull) then begin
            TpCondPag.dIniFatorCM14 := FieldByName('DATAINI').AsDateTime;
         end;

         if not FieldByName('DATAINIAMORTIZ').IsNull then
              TpCondPag.dDataIniAmortiz := FieldByName('DATAINIAMORTIZ').AsDateTime
         else TpCondPag.dDataIniAmortiz := FieldByName('DATAVENCIMENTO').AsDateTime;

         if FieldByName('FLGJURCARENCIA').AsString = 'S' then
              TpCondPag.bJurosCarencia := True
         else TpCondPag.bJurosCarencia := False;

         if FieldByName('FLGCMMENSAL').IsNull   then TpCondPag.sFlgCMMensal   := 'N';
         if FieldByName('FLGREAJMENSAL').IsNull then TpCondPag.sFlgReajMensal := 'N';

         // Calcula o Nr. de meses efetivos entre as parcelas
         if TpCondPag.sPrazo = 'M' then
              TpCondPag.iPeriodoMeses := TpCondPag.iPeriodo
         else TpCondPag.iPeriodoMeses := TpCondPag.iPeriodo * 12;

         // Calcula o indice de juros a ser aplicado sobre a parcela
         if TpCondPag.fTaxaJuros > 0 then begin
            if TpCondPag.sPeriodoTaxa = 'M' then begin
               TpCondPag.fTaxaJurosParc := TpCondPag.fTaxaJuros / 100;
            end else if TpCondPag.sPeriodoTaxa = 'A' then begin
               TpCondPag.fTaxaJurosParc := TpCondPag.fTaxaJuros / 12 / 100;
            end else if TpCondPag.sPeriodoTaxa = 'C' then begin
               TpCondPag.fTaxaJurosParc := (Power( (1 + (TpCondPag.fTaxaJuros/100)), (1/12) ) -1) / 100;
            end;
         end else begin
           TpCondPag.fTaxaJurosParc := 0;
         end;

         // Ajusta a taxa de juros conforme o período  ( Taxa mensal )
         if TpCondPag.sPeriodoTaxa = 'M' then begin
            if TpCondPag.sPrazo = 'M' then begin
               TpCondPag.fTaxaJurosAjust := Power((1 + (TpCondPag.fTaxaJuros/100)), TpCondPag.iPeriodo);
            end else begin
               TpCondPag.fTaxaJurosAjust := Power((1 + (TpCondPag.fTaxaJuros/100)),(TpCondPag.iPeriodo*12));
            end;
         end;
         if TpCondPag.sPeriodoTaxa = 'A' then begin  // ( Taxa anual simples )
            if TpCondPag.sPrazo = 'M' then begin     // Mensal
               // Paulo Nobre - WO24946 - Inicio

               // TpCondPag.fTaxaJurosAjust := Power((1 + (TpCondPag.fTaxaJuros/12/100)), TpCondPag.iPeriodo);

               // Implementado nova formulação para o cálculo da taxa de juros baseada na nova versão
               // da planilha de cálculo dos Gestores - modelo tipo 20 - ex.: "(1+$E$10)^(1/12)"
               TpCondPag.fTaxaJurosAjust := Power((1 + TpCondPag.fTaxaJuros/100), (1/12));

               // Paulo Nobre - WO24946 - Fim

            end else begin
               TpCondPag.fTaxaJurosAjust := Power((1 + (TpCondPag.fTaxaJuros/12/100)),(TpCondPag.iPeriodo*12));
            end;
         end;
         
         if TpCondPag.sPeriodoTaxa = 'C' then begin
            // Calcula a taxa mensal para Juros Composto REFER
            TpCondPag.fTaxaJurosAjust := Power( (1 + (TpCondPag.fTaxaJuros/100)), (1/12) );
            if TpCondPag.sPrazo <> 'M' then begin
               TpCondPag.fTaxaJurosAjust := Power( TpCondPag.fTaxaJurosAjust, (TpCondPag.iPeriodo * 12) );
            end;
         end;

         if TpCondPag.fTaxaJurosAjust <> 0 then
            TpCondPag.fTaxaJurosAjust := TpCondPag.fTaxaJurosAjust - 1;

      end // END IF
      else
      begin
         Result := False;
         TpCondPag.sFlgTipoContrato := 'P';
         TpCondPag.fIDContratoIMovel:= 0;
         TpCondPag.fIDCondPagImovel := 0;
         TpCondPag.fIDCondInicial   := 0;
         TpCondPag.sTipoCondPag     := '';
         TpCondPag.fSaldoDev        := 0;
         TpCondPag.fSaldoDevComposto:= 0;
         TpCondPag.iNumParcelas     := 0;
         TpCondPag.iPeriodo         := 0;
         TpCondPag.sPrazo           := '';
         TpCondPag.iIDIndCorr       := 0;
         TpCondPag.iIDIndProj       := 0;
         TpCondPag.fTaxaJuros       := 0;
         TpCondPag.fTaxaJurosParc   := 0;
         TpCondPag.fCorrecaoProj    := 0;
         TpCondPag.fTaxaJurosAjust  := 0;
         TpCondPag.sPeriodoTaxa     := '';
         TpCondPag.sFlgReajMensal   := 'N';
         TpCondPag.sFlgCMMensal     := 'N';
         TpCondPag.iMesRefReajuste  := 0;
      end;
   end;

   // Busca o Saldo Devedor Composto
   if (bSaldoComposto) and (TpCondPag.iFormaCalculo = 11) then begin
      TpCondPag.fSaldoDevComposto := BuscaSaldoComposto(TpCondPag.fIDContratoImovel,
                                                        TpCondPag.dDataVencimento,
                                                        TpCondPag.iFormaCalculo,
                                                        TpCondPag.dUltVenctoComposto,
                                                        TpCondPag.fCorrAcumComposto,
                                                        TpCondPag.fJurosAcumComposto);
   end else begin
      TpCondPag.fSaldoDevComposto  := 0;
      TpCondPag.dUltVenctoComposto := -1;
   end;
end;


//========================================================================================
// Função para Calcular a Data final da Condição de Pagamento
// Data : 19/02/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iIdRepactua : id da Repactuação ( -1 )
//       iIdCond     : id da Condição de Pagamento  ( -1 )
//       iParc       : id da Parcela
//       iPeriodo    : Intervalo entre as parcelas
//       sPrazo      : Tipo de Intervalo entre as parcelas Mensal ou Anual
//       dtIni       : Data inicial da Condição de Pagamento
//       dtVenc      : Data de Vencimento inicial da Condição de pagamento
//       dtFim       : Data final da condição de Pagamento
//       bAtualiza   : True - Atualiza as datas finais das condições de pagamento anteriores
//
// Retorno : True  - Efetuou o calculo
//           False - Não efetuou o calculo
//----------------------------------------------------------------------------------------
function TFuncAlienacao.CalcFimCondPag(iIdRepactua, iIdCond: Double; iParc,iPeriodo: Integer;
                                       sPrazo: String; dtIni,dtVenc: TDateTime;
                                       var dtFim: TDateTime; bAtualiza: Boolean): Boolean;
var iMeses   : Integer;
begin
   Result := True;
   iMeses := 0;
   // define data de validade final da condição
   if iParc > 1 then begin
      if sPrazo = 'M' then begin
         iMeses := (iParc * iPeriodo) - iPeriodo;
      end else begin
         iMeses := ((iParc - 1) * (12 * iPeriodo));
      end;
      if iMeses = 1 then iMeses := 0;
   end;
   dtFim := DiasInUteis.SomaMeses(dtVenc,iMeses);

   // Ajusta as datas finais dos periodos anteriores
   if bAtualiza = True then begin
      with dtmFinanciamento do begin
         qryAux.SQL.Clear;
         qryAux.SQL.Add('  SELECT  IDCONDPAGIMOVEL');
         qryAux.SQL.Add('    FROM  CONDPAGIMOVEL ');
         if iIdRepactua > 0 then begin
            qryAux.SQL.Add('   WHERE  (IDREPACTUA = :pIDREPACTUA)');
            qryAux.Params[0].AsFloat := iIdRepactua;
         end else begin
            qryAux.SQL.Add('   WHERE  (IDCONDINICIAL = :pIDCONDPAGIMOVEL)');
            qryAux.Params[0].AsFloat := iIdCond;
         end;

         qryAux.Open;

         if not qryAux.IsEmpty then begin
            qryAux.First;
            while not qryAux.eof do begin

               LimpaParametros(dtmFinanciamento.qryUpdCondPag);
               qryUpdCondPag.ParamByName('pIDCONDPAGIMOVEL').AsFloat := qryAux.FieldByName('IDCONDPAGIMOVEL').AsFloat;
               qryUpdCondPag.ParamByName('pDATAFIM').AsString        := DateToStr(dtIni - 1);
               qryUpdCondPag.ExecSQL;

               qryAux.Next;
            end;
         end;
      end;
   end;
end;


//========================================================================================
// Função para Calcular a Correção + multa + juros das Parcelas NÃO CONCILIADAS
//        até a data Informada
// Data : 20/02/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iContrato    : id do Contrato (-1)
//       iComprador   : id do Comprador ou (-1)
//       iResponsavel : id do Responsavel ou (-1)
//       iCondPag     : id da Condição de Pagamento ou (-1)
//       dDataBaixa   : Data limite de correção - até quando será corrigido ou (-1)
//
// Retorno : True  - Efetuou o calculo
//           False - Não efetuou o calculo
//----------------------------------------------------------------------------------------
function TFuncAlienacao.CorrigeParcelas(const iContrato,iComprador,iResponsavel,iAdministradora,iCondPag: Double;
                                        dDataBaixa: TDateTime) : Boolean;
var prg : Integer;
    fCM,fMulta,fJuros,fVlrCorrige,fVlrCorrPg : Double;
    dDataLimite, dDataInicio : TDateTime;
    bPago : Boolean;
    cdsTemp : TCMClientDataSet;
    ctrlContratoImovel : TCtrlContratoImovel;
    ComunsImobiliarioDB : TComunsImobiliarioDB;

begin
   inherited;

   try
        Result      := True;
        prg         := 0;
        fCM         := 0;
        fJuros      := 0;
        fMulta      := 0;
        fVlrCorrige := 0;
        fVlrCorrPg  := 0;

        // abre query com registros a atualizar
        LimpaParametros(dtmFinanciamento.qryCalcCorrecao);
        with dtmFinanciamento.qryCalcCorrecao do begin
          if iContrato > 0 then
             ParamByName('pIDCONTRATO').AsFloat := iContrato;
          if iCondPag > 0 then
             ParamByName('pIDCONDPAGIMOVEL').AsFloat := iCondPag;
          if iComprador > 0 then
             ParamByName('pIDPESSOA').AsFloat := iComprador;
          if iResponsavel > 0 then
             ParamByName('pIDRESPONSAVEL').AsFloat := iResponsavel;
          if iAdministradora > 0 then
             ParamByName('pIDADMINIMOVEL').AsFloat := iAdministradora;
          if dDataBaixa <> -1 then
             ParamByName('pDATAF').AsDate := dDataBaixa;

             if Sistema.TipoCliente = 19991 then ParamByName('pCPMF').AsFloat := 215;
             ParamByName('pIDEMPRESA').AsInteger := Sistema.IdEmpresa;
          Open;
        end;

        if dDataBaixa = -1 then begin
          dDataBaixa := Date();
        end;

        FrmAguarde.Mostra('Atualizando Parcelas em Atraso até ' +  DateToStr(dDataBaixa) + '...');
        FrmAguarde.Max := dtmFinanciamento.qryCalcCorrecao.RecordCount;
        Application.ProcessMessages;


        // Faz as devidas inicializações - 19/01/2004 - Marcio Motta - Pendência 15799
        ctrlContratoImovel := TCtrlContratoImovel.Create( Sistema.IdEmpresa,
                                                          Sistema.IdModulo,
                                                          Sistema.IdUsuario,
                                                          Sistema.IdEspAcesso,
                                                          Sistema.UsaPlanoPatro );

        ComunsImobiliarioDB := TComunsImobiliarioDB.Create(Sistema.IDEmpresa, Sistema.IDModulo, Sistema.IDUsuario, sistema.IDEspAcesso, Sistema.UsaPlanoPatro);


        ctrlContratoImovel.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                                       Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                                       ComunsImobiliario.MensErroMT);

        ComunsImobiliarioDB.InitializeAs(ctrlContratoImovel);

        // Cria um CDS temporário para receber os dados - 19/01/2004 - Marcio Motta - Pendência 15799
        cdsTemp := TCMClientDataSet.Create( nil );

        StartTransacao;
        with dtmFinanciamento do begin
          qryCalcCorrecao.First;
          try
             while not qryCalcCorrecao.Eof do begin
                prg := prg + 1;
                FrmAguarde.Pos := prg;
                Application.ProcessMessages;

                // Busca as condições de de correção das parcelas - 19/01/2004 - Marcio Motta - Pendência 15799
                cdsTemp.Data := ctrlContratoImovel.BuscaParamCMJurosMulta
                               (dtmFinanciamento.qryCalcCorrecaoIDCONTRATOIMOVEL.AsFloat,
                                dtmFinanciamento.qryCalcCorrecaoDATAVENCIMENTO.AsDateTime);

                // Quando a parcela já tiver sido paga, aplicar juros e correcao sobre a divergencia de pagamento,
                // senão, aplicar multa, juros e correcao sobre o valor total da parcela
                if qryCalcCorrecaoDATAPAGAMENTO.IsNull then begin
                   bPago       := False;
                   fVlrCorrige := qryCalcCorrecaoVLRPRESTACAO.AsFloat;
                   dDataInicio := qryCalcCorrecaoDATAVENCIMENTO.AsDateTime;
                end else begin
                   bPago       := True;
                   fVlrCorrige := qryCalcCorrecaoVLRCORRIGIDOATRASO.AsFloat + qryCalcCorrecaoVLRMULTAATRASO.AsFloat +
                                  qryCalcCorrecaoVLRMORAATRASO.AsFloat - qryCalcCorrecaoVLRPAGO.AsFloat;
                   dDataInicio := qryCalcCorrecaoDATAPAGAMENTO.AsDateTime;
                end;

                // Calcula data limite para inicio do calculo da correcao
                if not bPago then begin
                   dDataLimite := ComunsImobiliarioDB.DataLimite(dDataInicio,
                                                                  qryCalcCorrecaoIDCIDADES.AsInteger,
                                                                  qryCalcCorrecaoIDPAIS.AsInteger,
                                                                  cdsTemp.FieldByName('DIASTOLERANCIA').AsInteger,
                                                                  cdsTemp.FieldByName('DIASREPASSE').AsInteger,
                                                                  qryCalcCorrecaoCODESTADO.AsString,
                                                                  cdsTemp.FieldByName('FLGTIPODIATOLERA').AsString,
                                                                  cdsTemp.FieldByName('FLGTIPODIAREPASS').AsString,
                                                                  True, False, False);
                end else begin
                   dDataLimite := qryCalcCorrecaoDATAPAGAMENTO.AsDateTime;
                   // se a parcela já tiver sido paga, considerar correcao do valor divergente a partir da data do pagamento
                   dDataInicio := dDataLimite;
                end;

                // Zera as Variáveis
                fCM    := 0;
                fJuros := 0;
                fMulta := 0;

                // Calcula multa, juros e correção para pagamentos em atraso
                if dDataBaixa > dDataLimite then begin

                   fCM := Arredonda(
                          ComunsImobiliarioDB.CalcCM(fVlrCorrige,
                                                     cdsTemp.FieldByName('IDINDCORRECAO').AsInteger,
                                                     dDataInicio + 1,
                                                     dDataBaixa, True,
                                                     cdsTemp.FieldByName('MESREFCORRECAO').AsInteger), 2);

// Início ------- Data: 26/01/2004 ----- Marcio Motta ----- Pendência: 15799
// O Cálculo dos Juros está sendo aplicado também sobre a diferença apurada do valor devido e o valor pago
                   fJuros := Arredonda(
                             ComunsImobiliarioDB.CalcJuros(fVlrCorrige + fCM,
                                                           cdsTemp.FieldByName('VLRJUROS').AsFloat,
                                                           cdsTemp.FieldByName('PERCJUROS').AsFloat,
                                                           cdsTemp.FieldByName('MOEDAJUROS').AsInteger,
                                                           cdsTemp.FieldByName('PERIODOJUROS').AsString,
                                                           dDataInicio + 1,
                                                           dDataBaixa,
                                                           cdsTemp.FieldByName('FLGJUROSPROPORC').AsString = 'S'), 2);

                   if not bPago then begin

                      fMulta := Arredonda(
                                ComunsImobiliarioDB.CalcMulta(qryCalcCorrecaoCODDOCUMENTO.AsInteger,
                                                              fVlrCorrige,fCM,
                                                              cdsTemp.FieldByName('VLRMULTA').AsFloat,
                                                              cdsTemp.FieldByName('PERCMULTA').AsFloat,
                                                              cdsTemp.FieldByName('MOEDAMULTA').AsInteger,
                                                              dDataBaixa,
                                                              dDataBaixa,
                                                              dDataBaixa,
                                                              qryCalcCorrecaoIDPARCFINANCIMOV.AsInteger), 2);
                   end;
                end;

// Fim ------------------------ Marcio Motta -----------------------------------

                // Grava dados do recebimento na parcela
                LimpaParametros(qryUpdCorrecao);
                if not bPago then begin
                   qryUpdCorrecao.ParamByName('pIDPARCFINANCIMOV').AsFloat := qryCalcCorrecaoIDPARCFINANCIMOV.AsFloat;
                   qryUpdCorrecao.ParamByName('pDATALIMITE').AsDateTime    := dDataLimite;
                   qryUpdCorrecao.ParamByName('pCORRIGIDO').AsFloat        := Arredonda(fVlrCorrige + fCM, 2);
                   qryUpdCorrecao.ParamByName('pMULTA').AsFloat            := Arredonda(fMulta, 2);
                   qryUpdCorrecao.ParamByName('pMORA').AsFloat             := Arredonda(fJuros, 2);
                end else begin

                   qryUpdCorrecao.ParamByName('pIDPARCFINANCIMOV').AsFloat := qryCalcCorrecaoIDPARCFINANCIMOV.AsFloat;
                   qryUpdCorrecao.ParamByName('pDATALIMITE').AsDateTime    := qryCalcCorrecaoDATALIMITE.AsDateTime;
                   qryUpdCorrecao.ParamByName('pCORRIGIDO').AsFloat        := Arredonda(fVlrCorrige + fCM, 2);   //Marcio Motta - 27/01/2004
                   qryUpdCorrecao.ParamByName('pMULTA').AsFloat            := Arredonda(fMulta, 2);
                   qryUpdCorrecao.ParamByName('pMORA').AsFloat             := Arredonda(fJuros, 2);
                end;
                qryUpdCorrecao.ExecSQL;

                qryCalcCorrecao.Next;
             end;
             CommitTransacao;
          except
             RollBackTransacao;
             Result := False;
             raise;
          end;
        end;
        frmAguarde.Apaga;

   finally
     FreeAndNil( cdsTemp );
     FreeAndNil(ctrlContratoImovel);
     FreeAndNil(ComunsImobiliarioDB);
   end;
end;



//========================================================================================
// Função para Retornar a Descrição do Tipo de Parcela
// Data : 22/02/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iFlgTipo     : Nr. do Tipo de Parcela
//       iFlgIntegra  : Nr. do Flag de Integração ou (-1)
//
// Retorno : Descrição do Tipo de Parcela
//----------------------------------------------------------------------------------------
function TFuncAlienacao.TipoParcela(const iFlgTipo, iFlgIntegra: Integer): String;
var sDesc : String;
begin

 // Alterar esta função também na uCtrlParcFinancImov (CMImobiliarioObj50.bpl)
 // Marcos Topini em 14/06/2006


   // situacao original sem integracao
   sDesc := '';
   case iFlgTipo of
      1 : sDesc := 'Saldo Inicial';
      2 : sDesc := 'Sinal';
      3 : sDesc := 'Parc. Gerada';
      4 : sDesc := 'Parc. Projetada';
      5 : sDesc := 'Amort. Extra';
      6 : sDesc := 'Acerto Divergência';
      7 : sDesc := 'Venda a Vista';
      8 : sDesc := 'Caução';
      9 : sDesc := 'Parc. Antecipada';
     10 : sDesc := 'Pagto Resíduo';
     11 : sDesc := 'Atualização de Saldo';
     12 : sDesc := 'Ajuste de Saldo';
   end;

   // considerar integracao total das parcelas geradas ( -1 não considera a integração )
   if iFlgIntegra <> -1 then begin

      if iFlgIntegra = 1 then begin    // considerar apenas para as projetadas
         case iFlgTipo of
            4 : sDesc := 'Proj. Integrada';
         end;
      end;

      if iFlgIntegra = 2 then begin
         case iFlgTipo of
            2 : sDesc := 'Sinal Integrado';
            3 : sDesc := 'Parc. Integrada';
            4 : sDesc := 'Proj. Integrada';
            5 : sDesc := 'Amort.Integrada';
            6 : sDesc := 'Acerto Integrado';
            7 : sDesc := 'A Vista Integrado';
            8 : sDesc := 'Caução Integrada';
            9 : sDesc := 'Antecip.Integrada';
           10 : sDesc := 'Pagto.Resíduo Integrado';
         end;
      end;
      if iFlgIntegra = 3 then begin
         case iFlgTipo of
            2 : sDesc := 'Sinal Baix.Man';
            3 : sDesc := 'Parc. Baix.Man';
            4 : sDesc := 'Proj. Baix.Man';
            5 : sDesc := 'Amort.Baix.Man';
            6 : sDesc := 'Acerto Baix.Man';
            7 : sDesc := 'A Vista Baix.Man';
            8 : sDesc := 'Caução Baix.Man';
            9 : sDesc := 'Antecip.Baix.Man';
           10 : sDesc := 'Pagto.Resíduo Baix.Man';
         end;
      end;

      if iFlgIntegra = 4 then begin
         case iFlgTipo of
            2 : sDesc := 'Sinal Baix.Mig';
            3 : sDesc := 'Parc. Baix.Mig';
            4 : sDesc := 'Proj. Baix.Mig';
            5 : sDesc := 'Amort.Baix.Mig';
            6 : sDesc := 'Acerto Baix.Mig';
            7 : sDesc := 'A Vista Baix.Mig';
            8 : sDesc := 'Caução Baix.Mig';
            9 : sDesc := 'Antecip.Baix.Mig';
           10 : sDesc := 'Pagto.Resíduo Baix.Mig';
         end;
      end;

      if iFlgIntegra = 5 then begin
         case iFlgTipo of
            2 : sDesc := 'Sinal Repactuado';
            3 : sDesc := 'Parc. Repactuada';
            4 : sDesc := 'Proj. Repactuada';
            5 : sDesc := 'Amort.Repactuada';
            6 : sDesc := 'Acerto Repactuado';
            7 : sDesc := 'A Vista Repactuado';
            8 : sDesc := 'Caução Repactuada';
            9 : sDesc := 'Antecip.Repactuada';
           10 : sDesc := 'Pagto.Resíduo Repactuado';
         end;
      end;

      if iFlgIntegra = 6 then begin
         case iFlgTipo of
            2 : sDesc := 'Sinal Repactuado';
            3 : sDesc := 'Parc. Repactuada';
            4 : sDesc := 'Proj. Repactuada';
            5 : sDesc := 'Amort.Repactuada';
            6 : sDesc := 'Acerto Repactuado';
            7 : sDesc := 'A Vista Repactuado';
            8 : sDesc := 'Caução Repactuada';
            9 : sDesc := 'Antecip.Repactuada';
           10 : sDesc := 'Pagto.Resíduo Repactuado';
         end;
      end;

      if iFlgIntegra = 7 then begin
         case iFlgTipo of
            2 : sDesc := 'Sinal Integ. Adm';
            3 : sDesc := 'Parc. Integ. Adm';
            4 : sDesc := 'Proj. Integ. Adm';
            5 : sDesc := 'Amort.Integ. Adm';
            6 : sDesc := 'Acerto Integ. Adm';
            7 : sDesc := 'A Vista Integ. Adm';
            8 : sDesc := 'Caução Integ. Adm';
            9 : sDesc := 'Antecip.Integ. Adm';
           10 : sDesc := 'Pagto.Resíduo Integ. Adm';
         end;
      end;

      //Ricardo Cristiano - SOL Nº 44015 KINTANA Nº 523387      
      if iFlgIntegra = 8 then begin
         case iFlgTipo of
            2 : sDesc := 'Sinal Devolução';
            3 : sDesc := 'Parc. Devolução';
            4 : sDesc := 'Proj. Devolução';
            5 : sDesc := 'Amort. Devolução';
            6 : sDesc := 'Acerto Devolução';
            7 : sDesc := 'A Vista Devolução';
            8 : sDesc := 'Caução Devolução';
            9 : sDesc := 'Antecip. Devolução';
           10 : sDesc := 'Pagto.Resíduo Devolução';
         end;
      end;

   end;
   Result := sDesc;
end;

//========================================================================================
// Função para Retornar a Descrição da forma de Calculo da condição de pagamento
// Data : 30/01/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iFlgTipo     : Nr. do Tipo de Calculo
//
// Retorno : Descrição do Tipo de Calculo
//----------------------------------------------------------------------------------------
function TFuncAlienacao.TipoCalculo(const iFlgTipo: Integer): String;
begin
  Result := '';
  case iFlgTipo of
    1 : Result := 'PRICE - Corrige Saldo Dev. anual, incorpora resíduo, recalculo anual da Parcela';
    2 : Result := 'PRICE - Corrige Saldo Dev. mensal, recalculo anual da Parcela';
    3 : Result := 'PRICE - Corrige Saldo Dev. mensal, Sem Recalculo, com Correção na Parcela';
    4 : Result := 'PRICE - Corrige Saldo Dev. anual, não incorpora resíduo, recalculo anual da parcela';
    5 : Result := 'JUROS MENSAL - Sobre Saldo Dev., com correção e recalculo anual';
    6 : Result := 'JUROS MENSAL - Sobre Saldo Dev. e Parcela, com correção e recalculo anual';
    7 : Result := 'JUROS MENSAL - Sobre Saldo Dev., resíduo cobrado na parcela';
    8 : Result := 'SAC - Corrige Saldo Dev. anual, Calcula Juros sobre a Parcela, recalculo anual da Parcela';
    9 : Result := 'FIXA - Sem juros e sem correção';
   10 : Result := 'PRICE - Corrige Saldo Dev. mensal, parcela fixa com indice projetado';
   11 : Result := 'JUROS MENSAL - Corrige Saldo COMPOSTO e Parcela mensal, Juros sobre Saldo COMPOSTO e Parcela';
   12 : Result := 'SAC - Corrige Saldo Dev. anual, Calcula Juros sobre o Saldo Devedor, recalculo anual da Parcela';
   13 : Result := 'SAC - Calcula Juros e Correção mensal sobre a Parcela';
   14 : Result := 'PRICE - Corrige Saldo Dev. mensal, Sem Recalculo, com Correção anual da Parcela';
   15 : Result := 'PRICE - Correção Mensal da Parcela';   
   16 : Result := 'SAC - Calcula Juros e Correção mensal sobre o Saldo Devedor';
   17 : Result := 'SAC - Calcula Juros sobre a Parcela, com geração de resíduo';
   18 : Result := 'Correção Mensal sobre Saldo Devedor, Parcela calculada sobre saldo devedor por parcelas restantes';
   19 : Result := 'JUROS MENSAL - Atualização mensal da parcela, a partir de índice mais juros anual sobre o saldo devedor atual';
   20 : Result := 'JUROS MENSAL - Atualização mensal da parcela, pelo valor da parcela anterior, sem alteração do saldo devedor'; // WO 18846
  end;
end;


//========================================================================================
// Função para Calculo das Parcelas de uma Condição de Pagamento
// Data : 30/01/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iCondPag    - Nr. da Condição de Pagamento que será calculada
//       dVenctoIni  - Data do Primeiro Vencimento
//       dDataBase   - Data limite para calculo de juros pelo fator real e projetado
//       qryParcTemp - Query das Parcelas que será utilizada
//
// Retorno : Soma Total das Parcelas Calculadas
//----------------------------------------------------------------------------------------
function TFuncAlienacao.GeraParcela(iCondPag:Double; dVenctoIni,dDataBase: TDateTime; qryParcTemp: TwwQuery) : Double;

{=====================================================================
  FORMULAS DOS CÁCULOS UTILIZADOS
 =====================================================================
  * Aux            = Power(1 + (Taxa de Juros/100), nº de Parcelas )
  * SaldoAux       = (Saldo Devedor * Fator) + SUM(Residuo atualizado do periodo anterior)
  * Prestação      = SaldoAux *(((Taxa de Juros/100) * Aux )/( Aux - 1 ));

  * Juros          = % sobre o SaldoDevedor do periodo Anterior - Prestação Paga
  * Amortização    = Prestação - Juros
  * Saldo Devedor  = Saldo Devedor Anterior - Amortização

  TIPOS DE LANCAMENTO - 1 -> Saldo Inicial
                        2 -> Sinal
                        3 -> Parcela Gerada
                        4 -> Parcela Projetada
                        5 -> Amortização Extra   (não é lançado aqui)
                        6 -> Valores Extras      (não é lançado aqui)
                        7 -> Venda a Vista
                        8 -> Caução
                        9 -> Parcela Antecipada }

var
   bCondPagNova  : Boolean;        // Indica se encontrou uma repactuação nova
   TpCondPag     : TCondPag;       // Dados da Condição de Pagamento
   TpCondPagAnt  : TCondPag;       // Dados da Condição de Pagamento antes de checar repactuação
   iParc         : Integer;        // Número da Parcela
   iParcRestante : Integer;        // Número de Parcelas Restantes
   iParcCarencia : Integer;        // Parcelas de Juros cobradas durante a carencia
   fSaldoDev     : Double;         // Valor do Saldo devedor
   fPrestacao    : Double;         // Valor da Prestação
   fNominal      : Double;         // Valor Nominal da Prestação
   fFator        : Double;         // Fator de Correção das parcelas ( real * projetado )
   fFatorMes     : Double;         // Fator de Correção do Mes da Parcela
   dIniFator     : TDateTime;      // Data de início para busca do Fator de Correção
   dFimFator     : TDateTime;      // Data de Término para busca do Fator de Correção
   iMesHoje      : Integer;        // Mes Atual para verificar o tipo de parcela
   iMesVenc      : Integer;        // Mes de Vencimento para verificar o tipo de parcela
   bTemAmortiz   : Boolean;        // Indica se houve Amortização Extra
   rSaldoAmortiz : Double;         // Saldo Após a Amortização Extra
   rPercAmortiz  : Double;         // Percentual de Amortização Extra
   fResiduoAcum  : Double;         // Resíduo Acumulado para acréscimo no saldo devedor
   Aux           : Double;         // Auxiliar para calculo da prestacao
   dVencto       : TDateTime;      // Data de Vencimento da Parcela
   dVenctoVira   : TDateTime;      // Data de Vencimento na virada do período
   dVenctoAnt    : TDateTime;      // Data de Vencimento da ultima parcela antes da antecipação
   dDataBusca    : TDateTime;      // Data auxiliar para busca da nova condição
   dIniJuros     : TDateTime;
   dReajAnual    : TDateTime;
   ano,mes,dia   : Word;           // Aux para verificar amortização extra
   bViraAno      : Boolean;        // Indica se completou 12 parcelas para virada do ano
   iParcIni      : Integer;        // Parcela inicial para calculo do residuo acumulado
   iParcFim      : Integer;        // Parcela final para calculo do resíduo acumulado
   bAntecipa     : Boolean;        // Se a Parcela anterior foi Antecipada e a Proxima também será antecipada
   bAntecipaProx : Boolean;        // Se a Próxima parcela tanbém foi antecipada
   bAntecipaAnt  : Boolean;        // Se a Parcela anterior foi Antecipada
   prg           : Integer;        // Somente indicador da progress bar
   fVlrJurosAntec: Extended;
   fSaldoDevAntec: Extended;
   fTaxaJuros    : Extended;
   fTaxaJurosAcum: Extended;
   iDiaVencto    : Integer;
   iMesVencto    : Integer;
   iDiaNovo      : Word;
   iMesNovo      : Word;
   iAnoNovo      : Word;
   iMeses        : Integer;
   iMesCorrAnt   : String;        // Mes de correção da parcela anterior para verificar se busca novo fator
   iMesCorrAtu   : String;
   fAmortizacao  : Extended;
   fCorrecaoSld  : Extended;      // Correção Monetária do Saldo Devedor
   fCorrecaoParc : Extended;
   bExisteCotacaoMes : Boolean;   // Existe cotação cadastrada para o mes de competencia
   sSql : String;
   iParcExtra    : Integer;
   iParcEncerra  : Integer;
   ComunsImobiliarioDB : TComunsImobiliarioDB;
   dDataVenc     : TDateTime;
   dDataTemp     : TDateTime;
   dDataVecimento: TDateTime;

   fValorAmortiz : Double;
   bJaCalculou   : boolean;
   fSaldoAntDev  : double;
   fSomaValor    : double;
   n             : integer;
   fValAuxi      : double;
   fTotalAmortizacao : double;


begin
   // inicializa variaveis
   Result        := 0;
   prg           := 0;
   iParc         := 0;
   iParcRestante := 0;
   iParcEncerra  := 0;
   iParcCarencia := 0;
   iParcExtra    := 0;
   fSaldoDev     := 0;
   fPrestacao    := 0;
   fNominal      := 0;
   fFator        := 1;
   fFatorMes     := 1;
   dIniFator     := Date;
   dFimFator     := Date;
   fResiduoAcum  := 0;
   Aux           := 0;
   dVencto       := Date;
   dVenctoAnt    := Date;
   dVenctoVira   := Date;
   bViraAno      := False;
   iParcIni      := 1;
   iParcFim      := 0;
   bAntecipa     := False;
   bAntecipaProx := False;
   bAntecipaAnt  := False;
   iDiaVencto    := 0;
   iMesVencto    := 0;
   iDiaNovo      := 0;
   iMesNovo      := 0;
   iAnoNovo      := 0;
   iMeses        := 0;
   iMesCorrAtu   := '';
   iMesCorrAnt   := '';
   fVlrJurosAntec:= 0;
   fSaldoDevAntec:= 0;
   fTaxaJuros    := 0;
   fTaxaJurosAcum:= 0;
   fAmortizacao  := 0;
   fCorrecaoSld  := 0;
   fCorrecaoParc := 0;
   bExisteCotacaoMes := True;
   bJaCalculou   := false;
   fSaldoAntDev  := 0;
   fSomaValor    := 0;
   fTotalAmortizacao := 0;

   // Verifica a condição de pagamento no Vencimento inicial
   DecodeDate(dVenctoIni, ano, mes, dia);
   if not FuncAlienacao.BuscaCondPag(iCondPag, mes, ano, False, TpCondPag, True) then begin
      MsgDlg('Erro na busca das condições de pagamento','Erro ',mtError,[mbOK],0);
      Abort;
   end;

   if TpCondPag.iFormaCalculo in [14] then
   begin

      if TpCondPag.sFlgTipoContrato = 'P' then StartTransacao;
      Result := CalculaTipoCalculo14(iCondPag,dVenctoIni,dDataBase,qryParcTemp);
      if TpCondPag.sFlgTipoContrato = 'P' then RollBackTransacao;
      Exit;
   end;

   if TpCondPag.iFormaCalculo in [16] then
   begin

      if TpCondPag.sFlgTipoContrato = 'P' then StartTransacao;
      Result := CalculaTipoCalculo16(iCondPag,dVenctoIni,dDataBase,qryParcTemp);
      if TpCondPag.sFlgTipoContrato = 'P' then RollBackTransacao;
      Exit;
   end;


   if TpCondPag.iFormaCalculo in [18] then
   begin
      if TpCondPag.sFlgTipoContrato = 'P' then StartTransacao;
      Result := CalculaTipoCalculo18(iCondPag,dVenctoIni,dDataBase,qryParcTemp);
      if TpCondPag.sFlgTipoContrato = 'P' then RollBackTransacao;
      Exit;
   end;

   //Cássio Rovaroto - WO 7669 - Início
   if TpCondPag.iFormaCalculo in [19] then
   begin
    if TpCondPag.sFlgTipoContrato = 'P' then
      StartTransacao;

    Result := CalculaTipoCalculo19(iCondPag,dVenctoIni,dDataBase,qryParcTemp);

    if TpCondPag.sFlgTipoContrato = 'P' then
      RollBackTransacao;

    Exit;
   end;
   //Cássio Rovaroto - WO 7669 - Fim

   //Cássio Rovaroto - WO 18846 - Início
   if TpCondPag.iFormaCalculo in [20] then
   begin
    if TpCondPag.sFlgTipoContrato = 'P' then
      StartTransacao;

    Result := CalculaTipoCalculo20(iCondPag,dVenctoIni,dDataBase,qryParcTemp);

    if TpCondPag.sFlgTipoContrato = 'P' then
      RollBackTransacao;
    Exit;
   end;
   //Cássio Rovaroto - WO 18846 - Fim
                        
   // Faz as devidas inicializações
   ComunsImobiliarioDB := TComunsImobiliarioDB.Create(Sistema.IDEmpresa, Sistema.IDModulo, Sistema.IDUsuario, sistema.IDEspAcesso, Sistema.UsaPlanoPatro);
   ComunsImobiliarioDB.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                                   Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                                   ComunsImobiliario.MensErroMT);

   FrmAguarde.Min := 0;
   FrmAguarde.Max := TpCondPag.iNumParcelas;
   FrmAguarde.Pos := Prg;
   FrmAguarde.Mostra('Aguarde, Gerando Parcelas...');
   Application.ProcessMessages;

   // Se a query das parcelas estiver aberta, mantém aberta para somente alterar os valores
   // que possivelmente forem recalculados, senão, abre para incluir as parcelas novas.
   if qryParcTemp.Active = False then qryParcTemp.Active := True;


   dDataVenc := qryParcTemp.FieldByName('DATAVENCIMENTO').AsDateTime;

   // Apaga os Registros de Saldo Inicial
   with qryParcTemp do begin
      First;
      while not eof do begin
         if (qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 1) and
            (qryParcTemp.FieldByName('IDCONDPAGIMOVEL').AsInteger = iCondPag) then
              Delete
         else Next;
      end;
      First;
   end;


   // define saldo devedor e vencto da primeira parcela
   if TpCondPag.iFormaCalculo in[11] then
   begin
      fSaldoDev   := TpCondPag.fSaldoDevComposto;
      if TpCondPag.dUltVenctoComposto > 0 then
           dVenctoAnt := TpCondPag.dUltVenctoComposto
      else dVenctoAnt := TpCondPag.dDataVencimento;
   end
   else
   begin
       //--Emerson, incio, KT 390045, SOL 91849, procura o ultimo lancamento de AMORTIZACAO--//
       if (TpCondPag.iFormaCalculo in[9]) and (qryParcTemp.Locate('IDCONDPAGIMOVEL;FLGTIPOLANC;DATAVENCIMENTO',VarArrayOf([iCondPag,5,GetDataAmortizacao]),[])) then
       begin
          //fSaldoDev   := BuscaSaldoDevedor( TpCondPag.fIDCondPagImovel, 0 );
          fSaldoDev    := TpCondPag.fSaldoDev;
          fSaldoAntDev := qryParcTemp.FieldByName('VLRSALDODEVEDOR').AsFloat;
       end
       else
       begin
          //--Esta gerando parcelas, pois nao existe data de amortizacao--//
          //if GetDataAmortizacao = 0 then
          //begin
              fSaldoDev    := TpCondPag.fSaldoDev;
              fSaldoAntDev := TpCondPag.fSaldoDev;
          //end
          //else
          //begin
          //    fSaldoDev    := BuscaSaldoDevedor( TpCondPag.fIDCondPagImovel, 1 );
          //    fSaldoAntDev := fSaldoDev;
          //end;
          
       end;
       qryParcTemp.First;
       //--Emerson --fim, KT 390045, SOL 91849, procura o ultimo lancamento de AMORTIZACAO--//

      dVenctoAnt  := TpCondPag.dDataVencimento;
   end;
   dVencto        := TpCondPag.dDataVencimento;
   dFimFator      := TpCondPag.dDataAssinatura;
   dReajAnual     := TpCondPag.dDataAssinatura;
   iDiaVencto     := DiasUteis.ExtraiDia(dVencto);
   iMesVencto     := DiasUteis.ExtraiMes(dVencto);
   bCondPagNova   := False;
   TpCondPagAnt   := TpCondPag;

   qryParcTemp.DisableControls;
   try
      while iParc < (TpCondPag.iNumParcelas + iParcCarencia + iParcExtra) do begin
         iParc := iParc + 1;

         fCorrecaoSld := 0;

         // Busca as codições de pagamento para a próxima parcela
         if iParc > 1 then begin
            // Guarda a condição anterior para verificar alterações
            TpCondPagAnt := TpCondPag;

            // busca a condição de pagamento vigente no próximo mes de vencimento
            if TpCondPag.sPrazo = 'M' then
                 DecodeDate(DiasInUteis.SomaMeses(dVencto,TpCondPag.iPeriodo), ano, mes, dia)
            else DecodeDate(DiasInUteis.SomaMeses(dVencto,TpCondPag.iPeriodo*12), ano, mes, dia);

            if not FuncAlienacao.BuscaCondPag(iCondPag, mes, ano, False, TpCondPag) then
               TpCondPag := TpCondPagAnt;

            if TpCondPagAnt.fIDCondPagImovel <> TpCondPag.fIDCondPagImovel then begin
               bCondPagNova := True;
            end else begin
               bCondPagNova := False;
            end;
         end;


         //--emerson--//
         bTemAmortiz := false;

         // Se houve repactuação com alteração de juros, num. parcelas, tipo de reajuste,
         // correção, saldo devedor.
         // Força a Virada de ano, para recalculo das parcelas.
         if (bCondPagNova = True) then begin
            if (TpCondPagAnt.iNumParcelas   <> TpCondPag.iNumParcelas)   or
               (TpCondPagAnt.iPeriodo       <> TpCondPag.iPeriodo)       or
               (TpCondPagAnt.sPrazo         <> TpCondPag.sPrazo)         or
               (TpCondPagAnt.fTaxaJuros     <> TpCondPag.fTaxaJuros)     or
               (TpCondPagAnt.sPeriodoTaxa   <> TpCondPag.sPeriodoTaxa)   or
               (TpCondPagAnt.iFormaCalculo  <> TpCondPag.iFormaCalculo)  or
               (TpCondPag.fSaldoDev > 0) then begin
               bViraAno := True;
               iParcFim := iParc - 1;
            end;
         end;

         // busca saldo da correção até o mês da virada.
         if (bViraAno) and (Sistema.TipoCliente = 20041) then begin
            if TpCondPag.iIDIndCorr > 0 then begin
               dIniFator := dReajAnual;
               dFimFator := DiasUteis.SomaMeses(dIniFator,12) - 1;
               fFator    := ComunsImobiliarioDB.FatorCorrecao(TpCondPag.iIDIndCorr,
                                                              dIniFator, dFimFator,
                                                              False, TpCondPag.iMesRefReajuste, True);
               dReajAnual := dFimFator + 1;
            end;
         end;

         // apura o resíduo acumulado do ano anterior das parcelas incorporando ao saldo
         //BRUNO AZEVEDO SOL 136335 comentado o 1.
         if (TpCondPag.iFormaCalculo in[{1,}5,6]) and (bViraAno = True) then begin
             fResiduoAcum := ApuraResiduoAcumulado(iCondPag,iParcIni,iParcFim,fFator,True,qryParcTemp);
         end;

         // apura o resíduo acumulado do ano anterior das parcelas SEM incorporar ao saldo
         if ((TpCondPag.iFormaCalculo in[4]) and (bViraAno = True)) or
            ((bViraAno = True) and (TpCondPagAnt.iFormaCalculo <> TpCondPag.iFormaCalculo) and
             (TpCondPagAnt.iFormaCalculo in[4])) then begin
             //BRUNO AZEVEDO SOL 136335 Comentado
             fResiduoAcum := 0;//ApuraResiduoAcumulado(iCondPag,iParcIni,iParcFim,fFator,False,qryParcTemp);
         end;

         // Define o Saldo Devedor na Virada do Ano, incorporando o resíduo
         //BRUNO AZEVEDO SOL 136335 Comentado 1
         if (TpCondPag.iFormaCalculo in[{1,}5,6]) or
            ((TpCondPagAnt.iFormaCalculo <> TpCondPag.iFormaCalculo) and
             (TpCondPagAnt.iFormaCalculo in[{1,}5,6])) then begin
            if (bViraAno = True) or (iParc = 1) then begin
               if (bCondPagNova = True) and (TpCondPag.fSaldoDev > 0) then begin
                  fSaldoDev := TpCondPag.fSaldoDev;
               end else if iParc > 1 then begin
                  fCorrecaoSld := ComunsImobiliario.Arredonda( (fSaldoDev * fFator) - fSaldoDev, 2);
                  fSaldoDev    := ComunsImobiliario.Arredonda( (fSaldoDev * fFator) + fResiduoAcum, 2);
               end;
               fFator   := 1;
               iParcIni := iParc;
            end;
         //BRUNO AZEVEDO SOL 136335 Criado o Else
         end else begin
           if (TpCondPag.iFormaCalculo in[1]) or
            ((TpCondPagAnt.iFormaCalculo <> TpCondPag.iFormaCalculo) and
             (TpCondPagAnt.iFormaCalculo in[1])) then begin
            if (bViraAno = True) or (iParc = 1) then begin
               if (bCondPagNova = True) and (TpCondPag.fSaldoDev > 0) then begin
                  fSaldoDev := TpCondPag.fSaldoDev;
               end else if iParc > 1 then begin
                  fCorrecaoSld := ComunsImobiliario.Arredonda( (fSaldoDev * fFator) - fSaldoDev, 2);
                  fSaldoDev    := ComunsImobiliario.Arredonda( (fSaldoDev * fFator), 2);
               end;
               fFator   := 1;
               iParcIni := iParc;
            end;
           end;
         end;
         //BRUNO AZEVEDO SOL 136335 Fim

         // Apenas Corrige o Saldo devedor pelo fator acumulado no periodo anterior
         // e grava como Correção anual do Saldo Devedor para contabilização
         // VINICIUS 07/06/2004 - FUNCEF - EXCETO AGENCIA MAGNÓLIA - IMPLEMENTAR OPÇÃO NA REPACTUAÇÃO.. AGUARDANDO 3S
         if (iCondPag <> 1864) or ((iCondPag = 1864) and (iParc < 16)) then begin
            if (TpCondPag.iFormaCalculo in[4,8,12]) or
               ((TpCondPagAnt.iFormaCalculo <> TpCondPag.iFormaCalculo) and
                (TpCondPagAnt.iFormaCalculo in[4,8,12])) then begin
               if bViraAno then begin
                  if (bCondPagNova = True) and (TpCondPag.fSaldoDev > 0) then begin
                     fSaldoDev := TpCondPag.fSaldoDev;
                  end else if iParc > 1 then begin
                     fCorrecaoSld := ComunsImobiliario.Arredonda( (fSaldoDev * fFator) - fSaldoDev, 2);
                     fSaldoDev    := ComunsImobiliario.Arredonda( (fSaldoDev * fFator), 2);
                  end;
                  fFator   := 1;
                  iParcIni := iParc;
               end;
            end;
         end;


         // Grava a Correção do Saldo devedor no ultimo mes do ciclo, para contabilização
         if fCorrecaoSld > 0 then begin
            qryParcTemp.Edit;
            qryParcTemp.FieldByName('VLRCORRSALDO').asFloat := fCorrecaoSld;

            qryParcTemp.Post;
            fCorrecaoSld := 0;
         end;

         // Calcula Valor da Prestação
         if (bViraAno = True) or (iParc = 1) then begin
            iParcRestante := (TpCondPag.iNumParcelas + iParcEncerra - (iParc-iParcCarencia-1));

            if TpCondPag.iFormaCalculo in[1,3,4,15] then begin    // Tabela Price
               if (TpCondPag.fTaxaJuros <> 0) then begin
                  Aux        := Power((1 + TpCondPag.fTaxaJurosAjust), (iParcRestante) );
                  fPrestacao := ComunsImobiliario.Arredonda( fSaldoDev * ((TpCondPag.fTaxaJurosAjust * Aux)/(Aux -1)), 2);
               end else begin
                  fPrestacao := ComunsImobiliario.Arredonda( fSaldoDev / iParcRestante, 2);
               end;
            end else if TpCondPag.iFormaCalculo in[2] then begin // Tabela Price - APENAS NO PRIMEIRO CICLO OU SE REPACTUAR MUDANDO O SALDO
               if (iParc = 1) or                                 //                Os demais serão calculados após a correção
                  ((bCondPagNova = True) and (TpCondPag.fSaldoDev > 0)) then begin

                  // Atualiza o Saldo pelo repactuado
                  if (bCondPagNova = True) and (TpCondPag.fSaldoDev > 0) then
                     fSaldoDev := TpCondPag.fSaldoDev;

                  if (TpCondPag.fTaxaJuros <> 0) then begin
                     Aux        := Power((1 + TpCondPag.fTaxaJurosAjust), (iParcRestante) );
                     fPrestacao := ComunsImobiliario.Arredonda( fSaldoDev * ((TpCondPag.fTaxaJurosAjust * Aux)/(Aux -1)), 2);
                  end else begin
                     fPrestacao := ComunsImobiliario.Arredonda( fSaldoDev / iParcRestante, 2);
                  end;
               end;
            end else if TpCondPag.iFormaCalculo in[8,12,13] then begin   // Tabela SAC - Amortização Constante
               // Quando não gera Parcelas de Juros no período de carência,
               // Capitaliza o juros no período de carência para incorporar ao saldo devedor
               // antes de calcular o valor da parcela
               if (iParc = 1) or (bCondPagNova = True) then begin
                  if iParc = 1 then
                       dIniJuros := TpCondPag.dDataAssinatura
                  else dIniJuros := dVencto;
                  fTaxaJuros := ComunsImobiliario.ProRata(TpCondPag.fTaxaJurosAjust,
                                                          dIniJuros,
                                                          DiasUteis.SomaMeses(TpCondPag.dDataVencimento, -1),
                                                          TpCondPag.iPeriodoMeses);

                  if (not TpCondPag.bJurosCarencia) and (fTaxaJuros > 0) then begin
                     fSaldoDev := ComunsImobiliario.Arredonda( fSaldoDev * (fTaxaJuros + 1), 2);
                  end;
               end;

               fFator       := 1;
               iParcIni     := iParc;
               if iParcRestante > 0 then
                    fPrestacao := ComunsImobiliario.Arredonda( fSaldoDev / iParcRestante, 2)
               else fPrestacao := 0;
               fAmortizacao := fPrestacao;

            end else if TpCondPag.iFormaCalculo in[17] then begin   // Tabela SAC - Amortização Constante - VALIA

               fFator       := 1;
               iParcIni     := iParc;
               if iParcRestante > 0 then
                    fPrestacao := ComunsImobiliario.Arredonda( fSaldoDev / iParcRestante, 2)
               else fPrestacao := 0;
               fAmortizacao := fPrestacao;

            end else if TpCondPag.iFormaCalculo in[10] then begin  // Tabela Price - CM Projetada
               fFatorMes := ((1 + TpCondPag.fTaxaJurosAjust) * (1 + TpCondPag.fCorrecaoProj)) - 1;
               if fFatorMes <> 0 then begin
                  Aux        := Power((1 + fFatorMes), iParcRestante );
                  fPrestacao := ComunsImobiliario.Arredonda( fSaldoDev * ((fFatorMes * Aux)/(Aux -1)), 2);
               end else begin
                  fPrestacao := ComunsImobiliario.Arredonda( fSaldoDev / iParcRestante, 2);
               end;
            end else if TpCondPag.iFormaCalculo in[11] then begin  // Juros Mensal COMPOSTO
               fPrestacao := ComunsImobiliario.Arredonda( TpCondPag.fSaldoDev / iParcRestante, 2);
               if TpCondPag.fCorrAcumComposto > 1 then
                  fPrestacao := ComunsImobiliario.Arredonda( fPrestacao * TpCondPag.fCorrAcumComposto, 2);
               if TpCondPag.fJurosAcumComposto > 1 then
                  fPrestacao := ComunsImobiliario.Arredonda( fPrestacao * TpCondPag.fJurosAcumComposto, 2);
            end
            else
            begin
                 // Juros Mensal
                 fPrestacao := ComunsImobiliario.Arredonda( fSaldoDev / iParcRestante, 2);
            end;
            fNominal := fPrestacao;
         end;

         // Efetua todas as gravações apenas se o valor da prestação for > 0
         //if fPrestacao > 0 then begin
         if fPrestacao >= 0 then begin

            // Verifica a data de Vencimento, buscando na repactuação
            if Sistema.TipoCliente = 20041 then begin
               dIniFator  := dFimFator + 1;
            end else begin
               dIniFator  := DiasUteis.SomaMeses(dVencto, 1);
            end;
            if bCondPagNova = True then begin
               dVenctoAnt  := dVencto;
               dVencto     := TpCondPag.dDataVencimento;
               iDiaVencto  := DiasUteis.ExtraiDia(dVencto);
               iMesVencto  := DiasUteis.ExtraiMes(dVencto);
               if bViraAno then dVenctoVira := dVencto;
            end else begin
               if iParc = 1 then begin
                  dVencto     := TpCondPag.dDataVencimento;
                  dVenctoAnt  := TpCondPag.dDataAssinatura;
                  iDiaVencto  := DiasUteis.ExtraiDia(dVencto);
                  iMesVencto  := DiasUteis.ExtraiMes(dVencto);
                  dVenctoVira := TpCondPag.dDataAssinatura;

                  // Considera a mesma data de vencto como inicio do fator para calcular pro-rata
                  // da CM para calculos com CORREÇÃO MENSAL, pois o indice do mes será pro-rateado
                  if (TpCondPag.iFormaCalculo in[2,3,6,10,11,15]) and (TpCondPag.iPeriodoMeses = 1) then begin  // Atualiza saldo mensal
                     if TpCondPag.dUltVenctoComposto > 0 then
                          dIniFator := DiasUteis.SomaMeses(TpCondPag.dUltVenctoComposto,1)
                     else dIniFator := dVencto;
                   end else begin
                     dIniFator := TpCondPag.dDataAssinatura;
                  end;

               end else begin

                  // Se não houve antecipação de parcelas, altera a data do prox. vencimento
                  if not bAntecipa then begin
                     dVenctoAnt := dVencto;

                     // Ajusta o dia do vencimento para o estipulado no contrato, pois o ultimo
                     // vencimento pode ter sido alterado na antecipação
                     DecodeDate(dVencto, iAnoNovo,iMesNovo,iDiaNovo);
                     if iDiaNovo <> iDiaVencto then begin
                        try
                           dVencto := EncodeDate(iAnoNovo,iMesNovo,iDiaVencto);
                        except
                           dVencto := DiasUteis.UltDiaMes(iAnoNovo,iMesNovo);
                        end;
                     end;

                     // Este IF é baca para ajuste de contrato antecipado na FUNCEF
                     if (qryParcTemp.FieldByName('IDCONDPAGIMOVEL').asFloat <> 3095) or
                        ((iParc <> 22) and (iParc <> 24) and (iParc <> 30) and (iParc <> 32) and
                         (iParc <> 34) and (iParc <> 36)) then begin

                        if (qryParcTemp.FieldByName('IDCONDPAGIMOVEL').asFloat <> 2878) or
                           ((iParc <> 48)) then begin

                           if (qryParcTemp.FieldByName('IDCONDPAGIMOVEL').asFloat <> 1798) or
                              ((iParc <> 49)) then begin

                              if TpCondPag.sPrazo = 'M' then
                                   dVencto := DiasUteis.SomaMeses( dVencto, TpCondPag.iPeriodo)
                              else dVencto := DiasUteis.SomaMeses( dVencto,(TpCondPag.iPeriodo * 12) );

                           end;
                        end;
                     end;

                     // Ajusta ultimo dia do mes
                     iDiaNovo := DiasUteis.ExtraiDia(dVencto);
                     iMesNovo := DiasUteis.ExtraiMes(dVencto);
                     if iDiaNovo < iDiaVencto then begin
                        while iDiaNovo < iDiaVencto do begin
                           dVencto := DiasUteis.SomaDias(dVencto, 1);
                           if iMesNovo <> DiasUteis.ExtraiMes(dVencto) then begin
                              dVencto := DiasUteis.SomaDias(dVencto, -1);
                              Break;
                           end;
                           iDiaNovo := DiasUteis.ExtraiDia(dVencto);
                        end;
                     end;
                  end;

                  // BACA - ajuste antecipação contrato 000247 - FUNCEF
                  if (qryParcTemp.FieldByName('IDCONDPAGIMOVEL').asFloat = 1798) and
                     ((iParc = 54)) then begin
                     if TpCondPag.sPrazo = 'M' then
                          dVencto := DiasUteis.SomaMeses( dVencto, TpCondPag.iPeriodo)
                     else dVencto := DiasUteis.SomaMeses( dVencto,(TpCondPag.iPeriodo * 12) );
                  end;

               end;
            end;
            if bViraAno then dVenctoVira := dVencto;

            // Grava Registro de Saldo Inicial antes de fazer a Amortização
            if (bViraAno = True) or (iParc = 1) then begin
               if not qryParcTemp.Locate('IDCONDPAGIMOVEL;FLGTIPOLANC;DATAVENCIMENTO',VarArrayOf([iCondPag,1,dVencto]),[]) then begin
                  qryParcTemp.Insert;
                  qryParcTemp.FieldByName('IDPARCFINANCIMOV').asFloat  := LeUltRegistro(nil,'PARCFINANCIMOV');
                  qryParcTemp.FieldByName('IDCONTRATOIMOVEL').asFloat  := TpCondPag.fIDContratoImovel;
                  qryParcTemp.FieldByName('IDCONDPAGIMOVEL').asFloat   := TpCondPag.fIDCondInicial;
                  qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger     := 1;
                  qryParcTemp.FieldByName('NUMPARCELA').AsInteger      := 0;
                  qryParcTemp.FieldByName('FATORCORRECAO').AsFloat     := 1;
               end else begin
                  qryParcTemp.Edit;
               end;
               if iParc = 1 then begin
                  qryParcTemp.FieldByName('DATAVENCIMENTO').asDateTime := TpCondPag.dDataAssinatura;
                  qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat   := TpCondPag.fSaldoDev;
               end else begin
                  qryParcTemp.FieldByName('DATAVENCIMENTO').asDateTime := dVencto;
                  qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat   := fSaldoDev;
               end;

               qryParcTemp.Post;
            end;

            // Verifica se a Parcela já existe. Se não existir, cria uma.
            if not qryParcTemp.Locate('IDCONDPAGIMOVEL;NUMPARCELA',VarArrayOf([iCondPag,iParc]),[]) then begin


               // Vinicius - 12/01/2006 - Verifica na base se realmente não existe, estava gerando em duplicidade
               sSql := 'SELECT * FROM PARCFINANCIMOV '+#13+
                       ' WHERE IDCONDPAGIMOVEL = ' + FloatToStr(TpCondPag.fIDCondInicial) +#13+
                       '   AND NUMPARCELA = ' + IntToStr(iParc);
               FazQuery(dtmBaseDados.qry, sSql);
               if not dtmBaseDados.qry.IsEmpty then begin
                  MsgDlg('Erro ao gerar a parcela ' + IntToStr(iParc) + ' - duplicidade de lançamento', 'Erro', mtError, [mbok], 0);
                  Abort;
               end else begin
                  qryParcTemp.Append;
                  qryParcTemp.FieldByName('IDPARCFINANCIMOV').asFloat := LeUltRegistro(nil,'PARCFINANCIMOV');
                  qryParcTemp.FieldByName('IDCONTRATOIMOVEL').asFloat := TpCondPag.fIDContratoImovel;
                  qryParcTemp.FieldByName('IDCONDPAGIMOVEL').asFloat  := TpCondPag.fIDCondInicial;
                  qryParcTemp.FieldByName('NUMPARCELA').asFloat := iParc;
                  qryParcTemp.FieldByName('FLGLANCINTEGRA').asInteger := 0;
                  qryParcTemp.FieldByName('CODDOCUMENTO').Clear;
                  qryParcTemp.FieldByName('PLNCODIGO').Clear;
                  qryParcTemp.FieldByName('FLGCONCILIADO').Clear;
               end;
            end else begin
               qryParcTemp.Edit;
            end;
            // Zera valores que serão recalculados
            if qryParcTemp.FieldByName('CODDOCUMENTO').IsNull then begin
                qryParcTemp.FieldByName('VLRCORRSALDO').Clear;
                qryParcTemp.FieldByName('VLRPRESTATUALIZADA').Clear;
                qryParcTemp.FieldByName('VLRRESIDUOATUALI').Clear;
            end;

            // Se o calculo for projetado na origem, utiliza o informado no contrato, senão...
            // Calculo do Fator de Correção até a data base pelo real e depois pelo projetado
            // se o mes de vencto da parcela for o mesmo da anterior, mantém o fator da parcela
            // anterior, pois ambas pertencem ao mesmo mês, e não calcula pro-rata.
            fFatorMes := 1;
            bExisteCotacaoMes := True;
            if TpCondPag.iFormaCalculo in[10] then begin
               fFatorMes := 1 + TpCondPag.fCorrecaoProj;
            end else begin
               iMesCorrAtu := FormatDateTime('MM',dVencto) + FormatDateTime('YYYY',dVencto);
               if iMesCorrAtu <> iMesCorrAnt then begin
                  if dIniFator > dVencto then dIniFator := dVencto;

                  // Verifica se a cotação do mes já foi cadastrada
                  if TpCondPag.iMesRefReajuste = 0 then begin
                     DecodeDate( dVencto, Ano, Mes, Dia );
                  end else begin
                     DecodeDate( DiasUteis.SomaMeses(dVencto, (TpCondPag.iMesRefReajuste * -1) ), Ano, Mes, Dia );
                  end;
                  with dtmImobiliario.qryCotacoesIntervalo do begin
                     LimpaParametros(dtmimobiliario.qryCotacoesIntervalo);
                     ParamByName('INDICE').AsInteger   := TpCondPag.iIDIndCorr;
                     ParamByName('ANOMESINI').AsString := IntToStrZeroPad(Ano, 4) + IntToStrZeroPad(Mes, 2);
                     Open;
                     bExisteCotacaoMes := not dtmImobiliario.qryCotacoesIntervalo.IsEmpty;
                  end;

                  // Teste para a VALIA - O Fator anterior não buscava pro-rata
                  if Sistema.TipoCliente = 20041 then begin

                     if TpCondPag.iFormaCalculo in[13,17] then begin
                        dFimFator := dVencto - 1;
                     end else begin
                        DecodeDate(dVencto, ano, mes, dia);
                        dFimFator := DiasUteis.UltDiaMes(ano, mes);
                     end;

                     if (TpCondPag.dDataVencimento <= dDatabase) and (bExisteCotacaoMes) then begin
                        if TpCondPag.iIDIndCorr > 0 then begin
                           fFatorMes := ComunsImobiliarioDB.FatorCorrecao(TpCondPag.iIDIndCorr,
                                                                          dIniFator, dFimFator,
                                                                          False, TpCondPag.iMesRefReajuste, True);
                        end;
                     end else begin
                        if TpCondPag.iIDIndProj > 0 then begin
                           fFatorMes := ComunsImobiliarioDB.FatorCorrecao(TpCondPag.iIDIndProj,
                                                                          dIniFator, dFimFator,
                                                                          False, TpCondPag.iMesRefReajuste, True);
                        end else if TpCondPag.fCorrecaoProj > 0 then begin
                           fFatorMes := 1 + TpCondPag.fCorrecaoProj;
                        end;
                     end;

                  end else begin

                     if (TpCondPag.dDataVencimento <= dDatabase) and (bExisteCotacaoMes) then begin
                        if TpCondPag.iIDIndCorr > 0 then begin
                           if TpCondPag.iMesRefReajuste = 0 then
                                fFatorMes := dtmFinanciamento.CalculaFatorCorrecao(TpCondPag.iIDIndCorr,
                                                                                   dIniFator, dVencto, True)
                           else fFatorMes := dtmFinanciamento.CalculaFatorCorrecao(TpCondPag.iIDIndCorr,
                                                                              DiasUteis.SomaMeses(dIniFator, (TpCondPag.iMesRefReajuste * -1) ),
                                                                              DiasUteis.SomaMeses(dVencto,   (TpCondPag.iMesRefReajuste * -1) ), True);
                        end;
                     end else begin
                        if TpCondPag.iIDIndProj > 0 then begin
                           if TpCondPag.iMesRefReajuste = 0 then
                                fFatorMes := dtmFinanciamento.CalculaFatorCorrecao(TpCondPag.iIDIndProj,
                                                                                   dIniFator, dVencto, True)
                           else fFatorMes := dtmFinanciamento.CalculaFatorCorrecao(TpCondPag.iIDIndProj,
                                                                              DiasUteis.SomaMeses(dIniFator, (TpCondPag.iMesRefReajuste * -1) ),
                                                                              DiasUteis.SomaMeses(dVencto,   (TpCondPag.iMesRefReajuste * -1) ), True);
                        end else if TpCondPag.fCorrecaoProj > 0 then begin
                           fFatorMes := 1 + TpCondPag.fCorrecaoProj;
                        end;
                     end;

                  end;

                  fFator := fFator * fFatorMes;
                  iMesCorrAnt := iMesCorrAtu;
               end;
            end;

            // verifica o tipo de parcela ( 2 - Sinal, 3 - Parc Gerada, 4 - Parc Projetada
            //                              7 - Venda a Vista, 8 - Caução )
            if TpCondPag.sTipoCondPag = 'S' then begin
               qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 2;
            end;
            if TpCondPag.sTipoCondPag = 'V' then begin
               qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 7;
            end;
            if TpCondPag.sTipoCondPag = 'C' then begin
               qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 8;
            end;

            // Altera o Tipo de Parcela Projetada ou Gerada, apenas se a mesma não foi antecipada
            // e o indice de reajuste já foi cadastrado no global
            if qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger <> 9 then begin
               if (TpCondPag.sTipoCondPag = 'P') or
                  (TpCondPag.sTipoCondPag = 'R') then begin
                  if (TpCondPag.iIDIndCorr = 0) and
                     (TpCondPag.iIDIndProj = 0) then begin
                      qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 3;
                  end else begin
                     iMesHoje := StrToInt(IntToStr(DiasInUteis.ExtraiAno(dDataBase)) + FormatFloat('00',DiasInUteis.ExtraiMes(dDataBase)));
                     iMesVenc := StrToInt(IntToStr(DiasInUteis.ExtraiAno(dVencto))   + FormatFloat('00',DiasInUteis.ExtraiMes(dVencto)));

                     // Só muda o status se existir a cotação do mes de processamento
                     if bExisteCotacaoMes then begin
                        qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 3;
                     end else begin
                        qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 4;
                     end;
                  end;
               end;
            end;

            // Grava o default para o Saldo devedor atual
            if qryParcTemp.FieldByName('CODDOCUMENTO').IsNull then begin
               qryParcTemp.FieldByName('VLRSALDOATUAL').AsFloat := fSaldoDev;
            end;

            // Altera o saldo devedor atual antes de calcular a parc. para os com correção mensal
            if TpCondPag.iFormaCalculo in[2,3,10,11,15] then begin

               // Efetua o prorata na correção da assinatura para o 1 vencto
               if iParc = 1 then begin
                 //BRUNO AZEVEDO SOL 136335 Criado
                 if tpCondPag.iFormaCalculo in [11] then begin
                    if TpCondPag.dUltVenctoComposto > 0 then begin
                       if TpCondPag.dUltVenctoComposto <> TpCondPag.dDataVencimento then
                          fFatorMes := ComunsImobiliario.ProRata((fFatorMes-1), TpCondPag.dUltVenctoComposto, TpCondPag.dDataVencimento) + 1;
                    end else begin
                       if TpCondPag.dDataAssinatura <> TpCondPag.dDataVencimento then
                          fFatorMes := ComunsImobiliario.ProRata((fFatorMes-1), TpCondPag.dDataAssinatura, TpCondPag.dDataVencimento) + 1;
                    end;
                 end else begin
                   if tpCondPag.iFormaCalculo in [2, 3, 10, 15] then begin
                     fFator := fFator * fFatorMes;
                     iMesCorrAnt := iMesCorrAtu;
                   end;
                 end;
                 //BRUNO AZEVEDO SOL 136335 Criado
               end;

               //BRUNO AZEVEDO SOL 136335 Comentado
               if TpCondPag.iFormaCalculo <> 15 then
                 fSaldoDev    := ComunsImobiliario.Arredonda( (fSaldoDev * fFatorMes), 2);

               fResiduoAcum := 0;  
               {if TpCondPag.iFormaCalculo <> 15 then begin
                  fResiduoAcum := ComunsImobiliario.Arredonda( (fSaldoDev * fFatorMes) - fSaldoDev, 2);
                  fSaldoDev    := ComunsImobiliario.Arredonda( (fSaldoDev * fFatorMes), 2);
               end else begin
                  fResiduoAcum := 0;
               end;}
               //BRUNO AZEVEDO SOL 136335 Comentado
            
               // Calcula o residuo da CM projetada fixa
               if TpCondPag.iFormaCalculo in[10] then
                  fResiduoAcum := ComunsImobiliario.Arredonda( fSaldoDev * TpCondPag.fCorrecaoProj, 2);

               // Recalcula o Valor da Prestação após correção do Saldo Devedor
               if (TpCondPag.iFormaCalculo in[2]) and (bViraAno = True) and (iParc > 1) then begin
                  if (TpCondPag.fTaxaJuros <> 0) then begin                  // Tabela Price
                     iParcRestante := (TpCondPag.iNumParcelas + iParcEncerra - (iParc-1));
                     Aux           := Power((1 + TpCondPag.fTaxaJurosAjust), (iParcRestante) );
                     fPrestacao    := ComunsImobiliario.Arredonda( fSaldoDev * ((TpCondPag.fTaxaJurosAjust * Aux)/(Aux -1)), 2);
                  end else begin
                     fPrestacao := ComunsImobiliario.Arredonda( fSaldoDev / (iParcRestante), 2);
                  end;
               end;

               // Recalcula a Prestação, calculando a Correção Monetária sobre a parcela
               if TpCondPag.iFormaCalculo in[3,11,15] then begin
                  fCorrecaoParc := ComunsImobiliario.Arredonda( (fPrestacao * fFatorMes) - fPrestacao, 2);
                  fPrestacao    := ComunsImobiliario.Arredonda( (fPrestacao * fFatorMes), 2);
               end;

               if qryParcTemp.FieldByName('CODDOCUMENTO').IsNull then begin
                  qryParcTemp.FieldByName('FATORCORRECAO').AsFloat     := fFatorMes;
                  qryParcTemp.FieldByName('VLRSALDOATUAL').AsFloat     := fSaldoDev;
                  qryParcTemp.FieldByName('VLRRESIDUO').asFloat        := fCorrecaoParc;
                  qryParcTemp.FieldByName('VLRCORRSALDO').asFloat      := fResiduoAcum;
                  qryParcTemp.FieldByName('FLGRESIDUOINCORP').asString := 'C';
               end;
            end;

            // Define a taxa de juros a ser aplicada, APENAS SE A PRÓXIMA PARCELA NÃO FOR ANTECIPADA
            if bAntecipaProx then begin
               fTaxaJuros := 0;
            end else begin
               // Calcula a Taxa de Juros Pro-Rata para a primeira parcela, exceto
               // para SAC - que já foi calculado na definição da parcela quando
               // incorporado ao saldo devedor
               if (iParc = 1) and
                  (DiasUteis.ExtraiDia(TpCondPag.dDataAssinatura) <> DiasUteis.ExtraiDia(TpCondPag.dDataVencimento)) and
                  ( (TpCondPag.bJurosCarencia) or ((TpCondPag.iFormaCalculo <> 8) and (TpCondPag.iFormaCalculo <> 12)) ) then begin
                  fTaxaJuros := ComunsImobiliario.ProRata(TpCondPag.fTaxaJurosAjust,
                                                          TpCondPag.dDataAssinatura,
                                                          TpCondPag.dDataVencimento,
                                                          TpCondPag.iPeriodoMeses);
               end else begin
                  fTaxaJuros := TpCondPag.fTaxaJurosAjust;
               end;

               // Calcula a Taxa de Juros Pro-Rata para parcelas antecipadas e
               //   proxima parcela pós antecipação
               if ((qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9) and
                   (qryParcTemp.FieldByName('DATAVENCIMENTO').AsDateTime <> dVenctoAnt)) or
                   (bAntecipaAnt) then begin
                   if qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9 then begin
                      fTaxaJuros := ComunsImobiliario.ProRata(TpCondPag.fTaxaJurosAjust,
                                                              dVenctoAnt,
                                                              qryParcTemp.FieldByName('DATAVENCIMENTO').AsDateTime,
                                                              TpCondPag.iPeriodoMeses);
                   end else begin
                      fTaxaJuros := ComunsImobiliario.ProRata(TpCondPag.fTaxaJurosAjust,
                                                              dVenctoAnt,
                                                              dVencto,
                                                              TpCondPag.iPeriodoMeses);
                   end;
               end;

               fTaxaJurosAcum := ((fTaxaJurosAcum + 1) * (fTaxaJuros + 1)) -1;

               // VINICIUS - ACERTO FUNCEF - CONTRATO MAGNOLIA
               if (TpCondPag.iNumParcelas <> TpCondPagAnt.iNumParcelas) and
                  (iCondPag = 1864) and (iParc > 16) then fTaxaJurosAcum := 0;

            end;

            // Calcula o Juros sobre o saldo devedor INCORPORANDO NO MESMO
            if TpCondPag.iFormaCalculo in[6] then begin
               fSaldoDev  := ComunsImobiliario.Arredonda( fSaldoDev * (fTaxaJuros + 1), 2);
               if qryParcTemp.FieldByName('CODDOCUMENTO').IsNull then begin
                  qryParcTemp.FieldByName('VLRSALDOATUAL').AsFloat := fSaldoDev;
                  qryParcTemp.FieldByName('FATORCORRECAO').AsFloat := fFator;
               end;
            end;

            // Grava os valores da parcela (valor, vencto, juros, amortizacao e saldo devedor)
            // SOMENTE PARA AS PARCELAS AINDA NAO INTEGRADAS
            if qryParcTemp.FieldByName('CODDOCUMENTO').IsNull then begin
               if qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9 then begin
                  // Se a anterior também foi antecipada, mantem o saldo devedor da anterior
                  //    para efeito de calculo do juros por antecipação
                  if not bAntecipaProx then fSaldoDevAntec := fSaldoDev;

                  // Calcula o juros pró-rata por antecipação
                  fVlrJurosAntec := CalcAntecipacao(TpCondPag.iFormaCalculo,iCondPag,iParc,
                                                    qryParcTemp.FieldByName('DATAVENCIMENTO').AsDateTime, dVenctoAnt,
                                                    fSaldoDevAntec, fPrestacao, (fSaldoDev * TpCondPag.fTaxaJurosAjust),
                                                    fTaxaJuros, bAntecipaProx);

                  dVencto := qryParcTemp.FieldByName('DATAVENCIMENTO').asDateTime;
               end else begin
                  qryParcTemp.FieldByName('DATAVENCIMENTO').asDateTime := dVencto;
               end;

               // Registra o valor do juros sobre parcela e saldo devedor
               if TpCondPag.iFormaCalculo in[5,7] then begin
                  qryParcTemp.FieldByName('VLRJUROS').asFloat := ComunsImobiliario.Arredonda( ((fSaldoDev - fPrestacao) * TpCondPag.fTaxaJurosAjust),2 );
               end else if TpCondPag.iFormaCalculo in[6,11] then begin
                  qryParcTemp.FieldByName('VLRJUROS').asFloat := ComunsImobiliario.Arredonda((fSaldoDev * fTaxaJuros),2);
                  if TpCondPag.iPeriodoMeses = 1 then
                       qryParcTemp.FieldByName('VLRJUROSPARC').asFloat := ComunsImobiliario.Arredonda((fPrestacao * fTaxaJuros),2)
                  else qryParcTemp.FieldByName('VLRJUROSPARC').asFloat := ComunsImobiliario.Arredonda((fPrestacao * TpCondPag.fTaxaJurosParc),2);
               end else if TpCondPag.iFormaCalculo in[8] then begin
                  qryParcTemp.FieldByName('VLRJUROSPARC').asFloat := ComunsImobiliario.Arredonda((fNominal * fTaxaJurosAcum),2);
                  qryParcTemp.FieldByName('VLRJUROS').Clear;
               end else if TpCondPag.iFormaCalculo in[12] then begin
                  qryParcTemp.FieldByName('VLRJUROSPARC').Clear;
                  qryParcTemp.FieldByName('VLRJUROS').asFloat := ComunsImobiliario.Arredonda((fSaldoDev * fTaxaJuros),2);
               // Marchetti - Pendencia 25979
               end else if TpCondPag.iFormaCalculo in[9] then begin
                  qryParcTemp.FieldByName('VLRJUROS').asFloat := 0;
               // Fim Marchetti - Pendencia 25979
               end else qryParcTemp.FieldByName('VLRJUROS').asFloat := ComunsImobiliario.Arredonda((fSaldoDev * TpCondPag.fTaxaJurosAjust),2);

               // Registra o valor da prestação, amortização e saldo devedor amortizado
               if TpCondPag.iFormaCalculo in[3,15] then begin
                  qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat    := ComunsImobiliario.Arredonda(fPrestacao - qryParcTemp.FieldByName('VLRJUROS').asFloat,2);
                  qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat   := ComunsImobiliario.Arredonda(fSaldoDev - qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat,2);
                  if qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9 then   // antecipação
                       qryParcTemp.FieldByName('VLRPRESTACAO').asFloat := qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat
                  else qryParcTemp.FieldByName('VLRPRESTACAO').asFloat := ComunsImobiliario.Arredonda(fPrestacao,2);
                  qryParcTemp.FieldByName('VLRNOMINAL').asFloat        := qryParcTemp.FieldByName('VLRPRESTACAO').asFloat;
               end else if TpCondPag.iFormaCalculo in[6] then begin
                  qryParcTemp.FieldByName('VLRNOMINAL').asFloat       := ComunsImobiliario.Arredonda(fPrestacao,2);
                  if TpCondPag.iPeriodoMeses = 1 then
                       qryParcTemp.FieldByName('VLRPRESTACAO').asFloat:= ComunsImobiliario.Arredonda((fPrestacao * (1 + fTaxaJuros)),2)
                  else qryParcTemp.FieldByName('VLRPRESTACAO').asFloat:= ComunsImobiliario.Arredonda((fPrestacao * (1 + TpCondPag.fTaxaJurosParc)),2);
                  qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat   := fPrestacao;
                  qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat  := ComunsImobiliario.Arredonda(fSaldoDev - qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat, 2);
               end else if TpCondPag.iFormaCalculo in[8] then begin
                  // Marchetti - Pendencia 25438
                  qryParcTemp.FieldByName('VLRNOMINAL').asFloat       := ComunsImobiliario.Arredonda(fAmortizacao + qryParcTemp.FieldByName('VLRJUROSPARC').asFloat,2);
                  // Fim Marchetti - Pendencia 25438
                  qryParcTemp.FieldByName('VLRPRESTACAO').asFloat     := ComunsImobiliario.Arredonda(fAmortizacao + qryParcTemp.FieldByName('VLRJUROSPARC').asFloat,2);
                  qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat   := fAmortizacao;
                  qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat  := ComunsImobiliario.Arredonda(fSaldoDev - fAmortizacao, 2);


               end else if TpCondPag.iFormaCalculo in[13] then begin
                  qryParcTemp.FieldByName('VLRJUROS').Clear;
                  qryParcTemp.FieldByName('FATORCORRECAO').AsFloat     := fFatorMes;
                  qryParcTemp.FieldByName('VLRNOMINAL').asFloat        := ComunsImobiliario.Arredonda(fNominal,2);
                  qryParcTemp.FieldByName('VLRRESIDUO').asFloat        := ComunsImobiliario.Arredonda(fNominal * (fFator-1),2);
                  qryParcTemp.FieldByName('VLRJUROSPARC').asFloat      := ComunsImobiliario.Arredonda(fNominal * fFator * fTaxaJuros,2);
                  qryParcTemp.FieldByName('VLRPRESTACAO').asFloat      := ComunsImobiliario.Arredonda(fAmortizacao + qryParcTemp.FieldByName('VLRJUROSPARC').asFloat + qryParcTemp.FieldByName('VLRRESIDUO').asFloat,2);
                  qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat    := fAmortizacao;
                  qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat   := ComunsImobiliario.Arredonda(fSaldoDev - fAmortizacao, 2);
                  // Marchetti - Pendencia 23373
                  qryParcTemp.FieldByName('FLGRESIDUOINCORP').AsString := 'S';
                  // Fim Marchetti - Pendencia 23373

               end else if TpCondPag.iFormaCalculo in[17] then begin
                  fPrestacao := fPrestacao + ComunsImobiliario.Arredonda(fPrestacao * fTaxaJuros,2);
                  qryParcTemp.FieldByName('VLRJUROS').Clear;
                  qryParcTemp.FieldByName('FATORCORRECAO').AsFloat     := fFatorMes;
                  qryParcTemp.FieldByName('VLRNOMINAL').asFloat        := ComunsImobiliario.Arredonda(fNominal,2);
                  qryParcTemp.FieldByName('VLRRESIDUO').asFloat        := ComunsImobiliario.Arredonda(fPrestacao * (fFator-1),2);
                  qryParcTemp.FieldByName('VLRPRESTACAO').asFloat      := fPrestacao;
                  qryParcTemp.FieldByName('VLRJUROSPARC').asFloat      := ComunsImobiliario.Arredonda((fPrestacao - fAmortizacao),2);
                  qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat    := fAmortizacao;
                  qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat   := ComunsImobiliario.Arredonda(fSaldoDev - fAmortizacao, 2);
                  qryParcTemp.FieldByName('FLGRESIDUOINCORP').AsString := 'N';
                  if qryParcTemp.FieldByName('VLRRESIDUO').asFloat < 0 then qryParcTemp.FieldByName('VLRRESIDUO').asFloat := 0;


               end else if TpCondPag.iFormaCalculo in[12] then begin
                  if (not TpCondPag.bJurosCarencia) or (dVencto >= TpCondPag.dDataIniAmortiz) then begin
                     qryParcTemp.FieldByName('VLRPRESTACAO').asFloat     := ComunsImobiliario.Arredonda(fAmortizacao + qryParcTemp.FieldByName('VLRJUROS').asFloat,2);
                     qryParcTemp.FieldByName('VLRNOMINAL').asFloat       := qryParcTemp.FieldByName('VLRPRESTACAO').asFloat;
                     qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat   := fAmortizacao;
                     qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat  := ComunsImobiliario.Arredonda(fSaldoDev - fAmortizacao, 2);
                  end else begin
                     qryParcTemp.FieldByName('VLRAMORTIZACAO').Clear;
                     qryParcTemp.FieldByName('VLRNOMINAL').Clear;
                     qryParcTemp.FieldByName('VLRPRESTACAO').asFloat     := ComunsImobiliario.Arredonda(qryParcTemp.FieldByName('VLRJUROS').asFloat,2);
                     qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat  := fSaldoDev;
                  end;
               end else if TpCondPag.iFormaCalculo in[10] then begin
                  qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat    := ComunsImobiliario.Arredonda(fPrestacao - qryParcTemp.FieldByName('VLRJUROS').asFloat - qryParcTemp.FieldByName('VLRRESIDUO').asFloat,2);
                  qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat   := ComunsImobiliario.Arredonda(fSaldoDev - qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat - qryParcTemp.FieldByName('VLRRESIDUO').asFloat,2);
                  if qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9 then   // antecipação
                       qryParcTemp.FieldByName('VLRPRESTACAO').asFloat := qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat
                  else qryParcTemp.FieldByName('VLRPRESTACAO').asFloat := ComunsImobiliario.Arredonda(fPrestacao,2);
                  qryParcTemp.FieldByName('VLRNOMINAL').asFloat        := qryParcTemp.FieldByName('VLRPRESTACAO').asFloat;
               end else if TpCondPag.iFormaCalculo in[11] then begin
                  qryParcTemp.FieldByName('VLRNOMINAL').asFloat       := ComunsImobiliario.Arredonda(fPrestacao,2);
                  if TpCondPag.iPeriodoMeses = 1 then
                       qryParcTemp.FieldByName('VLRPRESTACAO').asFloat:= ComunsImobiliario.Arredonda((fPrestacao * (1 + fTaxaJuros)),2)
                  else qryParcTemp.FieldByName('VLRPRESTACAO').asFloat:= ComunsImobiliario.Arredonda((fPrestacao * (1 + TpCondPag.fTaxaJurosParc)),2);
                  qryParcTemp.FieldByName('VLRPRESTACAO').asFloat     := qryParcTemp.FieldByName('VLRPRESTACAO').asFloat + qryParcTemp.FieldByName('VLRJUROS').asFloat;
                  qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat   := fPrestacao;
                  qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat  := ComunsImobiliario.Arredonda(fSaldoDev - qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat, 2);
               end
               else
               if TpCondPag.iFormaCalculo in[09] then //--Emerson, incio, KT 390045, SOL 91849, Ajusta o calculo da prestacao, no caso de Amortizacao Extra--//
               begin
                //--Quando > 0, significa que esta gerando Parcelas--//
                if (GetDataAmortizacao>0) then
                begin
                    fSomaValor := fSomaValor + qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat;
                    dDataTemp := GetDataAmortizacao;
                    dDataVecimento := BuscaDataVencimento( TpCondPag.fIDCondPagImovel, iParc);

                    //--verifica se foi lancada alguma amortizacao, se sim, faz o recalculo das parcelas--//
                    if  (dDataTemp > 0) and (dDataVecimento>dDataTemp) and (GetStadoDelete = false) then
                    begin

                         if (bJaCalculou = false) then
                         begin
                             DecodeDate(dDataTemp,ano,mes,dia);
                             bTemAmortiz := VerifAmortiz(iCondPag, fSaldoDev, mes, ano, rSaldoAmortiz, rPercAmortiz, dDataTemp, fValorAmortiz );

                             //--Caso o contrato tenha apenas uma parcela--//
                             if TpCondPag.iNumParcelas = 1 then
                             begin
                                 fPrestacao  := fSaldoDev - TotalAmortizacao ( iCondPag );
                                 fSaldoDev   := fPrestacao;
                                 fSaldoAntDev:= fSaldoDev;
                             end
                             else
                             begin
                                  //-caso seja a ultima parcela, apenas deve ser subtrair do o valor da amortizacao nesta parcela--//
                                  if iParc = TpCondPag.iNumParcelas then
                                  begin
                                     fPrestacao := fSaldoDev - fValorAmortiz; //qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat;
                                  end
                                  else
                                  begin
                                     fPrestacao := ComunsImobiliario.Arredonda( CalculaPrestacao (iCondPag, iParc, dDataTemp, fValorAmortiz ),2);
                                  end;
                             end; 
                             bJaCalculou  := true;
                         end
                         else
                         begin

                             DecodeDate(dVencto,ano,mes,dia);

                             if not bJaCalculou then
                             begin
                                  bTemAmortiz := VerifAmortiz(iCondPag, fSaldoDev, mes, ano, rSaldoAmortiz, rPercAmortiz, dVencto, fValorAmortiz );
                             end;

                             // Se teve amortização extra, ajustar aqui o fPrestação
                             if bTemAmortiz then begin
                                fSaldoDev    := rSaldoAmortiz;
                                if TpCondPag.iFormaCalculo in[8,12] then
                                begin
                                   fPrestacao   := ComunsImobiliario.Arredonda( fAmortizacao * rPercAmortiz, 2);
                                end
                                else
                                begin
                                   fPrestacao   := ComunsImobiliario.Arredonda( fPrestacao * rPercAmortiz, 2);
                                end;
                                fAmortizacao := fPrestacao;
                                fNominal     := fPrestacao;
                                bJaCalculou  := true;
                             end;
                         end;
                    end;

                    //----Só recalcula as parcelas caso seja um evento de EXCLUSAO ---//
                    if (GetStadoDelete = true) and (bJaCalculou = false) and (GetDataAmortizacao>0) then
                    begin
                       //--critica para fazer o recalculo apenas das parcelas à frente da ultima AMORTIZACAO--//
                       if  sqlBuscaParcela( iCondPag, iParc ) > sqlUltimaAmortizacao( iCondPag ) then
                       begin
                             //--sempre deve recalcular a partir da ULTIMA AMORTIZACAO EXCLUIDA--//
                             fValAuxi := ComunsImobiliario.Arredonda( ReCalculaAmortizacao( iCondPag, iParc), 2);
                             if (fValAuxi>0) then
                             begin
                                   fPrestacao   := fValAuxi;
                                   fAmortizacao := fPrestacao;
                                   fNominal     := fPrestacao;
                                   bJaCalculou  := true;
                                   dDataTemp    := 0;
                             end;
                             bJaCalculou := false;
                             SetStadoDelete(false);
                       end
                       else
                       if sqlUltimaAmortizacao( iCondPag ) = 0 then //--neste caso, não existe nenhuma AMORTIZACAO--//
                           begin
                                 //--sempre deve recalcular a partir da ULTIMA AMORTIZACAO EXCLUIDA--//
                                 fValAuxi := ComunsImobiliario.Arredonda( ReCalculaAmortizacao( iCondPag, iParc), 2);
                                 if (fValAuxi>0) then
                                 begin
                                       fPrestacao   := fValAuxi;
                                       fAmortizacao := fPrestacao;
                                       fNominal     := fPrestacao;
                                       bJaCalculou  := true;
                                       dDataTemp    := 0;
                                 end;
                                 bJaCalculou := false;
                                 SetStadoDelete(false);
                           end;
                    end;

                    //--Neste evento, significa que é para recalcular as parcelas--//
                    if dDataTemp = 0 then
                    begin
                        //-Só regrava as parcelas apos a ultima amortizacao--//
                        if  (sqlBuscaParcela( iCondPag, iParc ) > sqlUltimaAmortizacao( iCondPag )) and (bJaCalculou  = false) then
                        begin
                            bTemAmortiz  := true;
                            bJaCalculou  := true;
                        end;
                    end;
                end
                else
                begin   //-- Gerando Parcelas --//

                    fSomaValor     := fSomaValor + qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat;
                    dDataTemp      := GetDataAmortizacao;
                    dDataVecimento := BuscaDataVencimento( TpCondPag.fIDCondPagImovel, iParc);

                    //--1º caso, não existe nenhuma Amortizacao lancada, apenas divide o total pelo n de parcelas--//
                    if (sqlUltimaAmortizacao( iCondPag ) = 0) and (bJaCalculou  = false) then
                    begin
                       fPrestacao   := ComunsImobiliario.Arredonda( fSaldoDev  / (TpCondPag.iNumParcelas - (iParc-1))  ,2);
                       bTemAmortiz  := true;
                       bJaCalculou  := true;
                    end
                    else //--2º caso, existe Amortizacao lancada, apenas sera recalculada as parcelas apos a ultima amortizacao--//
                    if (sqlUltimaAmortizacao( iCondPag ) > 0) and (sqlBuscaParcela( iCondPag, iParc ) > sqlUltimaAmortizacao( iCondPag )) and (bJaCalculou  = false) then
                    begin
                        //--Caso o contrato tenha apenas uma parcela--//
                        if (TpCondPag.iNumParcelas=1) then
                        begin

                              //--busca saldo antes do ultimo lancamento de amortizacao--//
                              //fSaldoDev  := BuscaSaldo_antes_Amortizacao(iCondPag);
                              fTotalAmortizacao := TotalAmortizacao( iCondPag );
                              fPrestacao        := fSaldoAntDev - fTotalAmortizacao;
                              fSaldoAntDev      := fSaldoDev - fTotalAmortizacao;
                              bTemAmortiz:= true;
                              bJaCalculou:= true;
                        end
                        else  //--contrato com mais de uma parcela--//
                        begin
                              //--busca saldo antes do ultimo lancamento de amortizacao--//
                              fSaldoDev         := BuscaSaldo_antes_Amortizacao(iCondPag);
                              fPrestacao        := ComunsImobiliario.Arredonda( fSaldoDev  / (TpCondPag.iNumParcelas - (iParc-1))  ,2);
                              bTemAmortiz       := true;
                              bJaCalculou       := true;
                        end;
                    end;
                end; //-- if (GetDataAmortizacao>0) --//

                if (bJaCalculou  = true) then
                begin
                    qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat    := ComunsImobiliario.Arredonda(fPrestacao - qryParcTemp.FieldByName('VLRJUROS').asFloat,2);

                    //--Emerson, KT 390045, SOL 91849, Caso ocorreu AMORIZACAO, pega o valor do SD da linha anterior (tabela)--//
                    if bTemAmortiz then
                    begin
                       qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat   := ComunsImobiliario.Arredonda(fSaldoAntDev - qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat,2);
                       fSaldoAntDev := qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat;
                    end
                    else
                    begin
                       qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat   := ComunsImobiliario.Arredonda(fSaldoDev - qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat,2);
                    end;

                    if qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9 then   // antecipação
                         qryParcTemp.FieldByName('VLRPRESTACAO').asFloat := qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat
                    else qryParcTemp.FieldByName('VLRPRESTACAO').asFloat := ComunsImobiliario.Arredonda(fPrestacao,2);
                    qryParcTemp.FieldByName('VLRNOMINAL').asFloat        := qryParcTemp.FieldByName('VLRPRESTACAO').asFloat;
                end;
               end
               else
               begin
                  qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat    := ComunsImobiliario.Arredonda(fPrestacao - qryParcTemp.FieldByName('VLRJUROS').asFloat,2);
                  qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat   := ComunsImobiliario.Arredonda(fSaldoDev - qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat,2);
                  if qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9 then   // antecipação
                       qryParcTemp.FieldByName('VLRPRESTACAO').asFloat := qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat
                  else qryParcTemp.FieldByName('VLRPRESTACAO').asFloat := ComunsImobiliario.Arredonda(fPrestacao,2);
                  qryParcTemp.FieldByName('VLRNOMINAL').asFloat        := qryParcTemp.FieldByName('VLRPRESTACAO').asFloat;

                   //qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat    := ComunsImobiliario.Arredonda(fPrestacao - qryParcTemp.FieldByName('VLRJUROS').asFloat,2);
                   //qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat   := ComunsImobiliario.Arredonda(fSaldoDev - qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat,2);
                   //if qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9 then   // antecipação
                   //    qryParcTemp.FieldByName('VLRPRESTACAO').asFloat := qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat
                   // else qryParcTemp.FieldByName('VLRPRESTACAO').asFloat := ComunsImobiliario.Arredonda(fPrestacao,2);
                   // qryParcTemp.FieldByName('VLRNOMINAL').asFloat        := qryParcTemp.FieldByName('VLRPRESTACAO').asFloat;
               end;

               //--Emerson, FIM, KT 390045, SOL 91849, Ajusta o calculo da prestacao, no caso de Amortizacao Extra--//

               if (bJaCalculou  = true) then
               begin
                   // Ajusta o saldo devedor final
                   if qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat < 0.5 then begin
                      qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat := 0;
                   end;
               end;



            end else begin
               // Pend 24444
               if TpCondPag.iFormaCalculo in[17] then begin
                  fPrestacao := qryParcTemp.FieldByName('VLRPRESTACAO').AsFloat;
               end;
            end;

            // Grava o Fator acumulado para o recalculo anual
            if TpCondPag.iFormaCalculo in[8,12] then begin
               qryParcTemp.FieldByName('FATORCORRECAO').AsFloat := fFator;
            end;

            // Grava o fator acumulado utilizado para a correção anual
            if TpCondPag.iFormaCalculo in[1,4,5] then begin
               qryParcTemp.FieldByName('FATORCORRECAO').AsFloat    := fFator;
               qryParcTemp.FieldByName('VLRRESIDUOATUALI').asFloat := 0;
            end;

            // Calcula (ou recalcula) o Resíduo pelo novo fator para os atualizados anualmente
            if qryParcTemp.FieldByName('CODDOCUMENTO').IsNull then begin
               if TpCondPag.iFormaCalculo in[1,4,5,6] then begin
                  qryParcTemp.FieldByName('VLRPRESTATUALIZADA').asFloat := ComunsImobiliario.Arredonda((qryParcTemp.FieldByName('VLRPRESTACAO').asFloat * fFator),2);
                  //BRUNO AZEVEDO SOL 136335
                  //qryParcTemp.FieldByName('VLRRESIDUO').asFloat         := ComunsImobiliario.Arredonda(qryParcTemp.FieldByName('VLRPRESTATUALIZADA').asFloat -
                  //                                                         qryParcTemp.FieldByName('VLRPRESTACAO').asFloat, 2);
                  qryParcTemp.FieldByName('VLRRESIDUO').asFloat         := 0;
                  //BRUNO AZEVEDO SOL 136335
                  qryParcTemp.FieldByName('VLRCORRSALDO').Clear;
               end;
            end;

            // Se a CM for cobrada na parcela, incorpora a mesma no valor da prestação
            if TpCondPag.iFormaCalculo in[7] then begin
               qryParcTemp.FieldByName('VLRPRESTACAO').AsFloat := qryParcTemp.FieldByName('VLRPRESTACAO').asFloat + qryParcTemp.FieldByName('VLRRESIDUO').asFloat;
            end;

            // grava o ID do indice de correção na parcela
            qryParcTemp.FieldByName('IDINDCORRECAO').Clear;

            // Marchetti - Pendencia 25979
            if TpCondPag.iFormaCalculo <> 9 then
            begin
               if qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger in [3,9,15] then begin
                  if TpCondPag.iIDIndCorr = 0 then begin
                     qryParcTemp.FieldByName('IDINDCORRECAO').Clear;
                  end else begin
                     qryParcTemp.FieldByName('IDINDCORRECAO').AsInteger := TpCondPag.iIDIndCorr;
                  end;
               end else begin
                  if TpCondPag.iIDIndProj = 0 then begin
                     qryParcTemp.FieldByName('IDINDCORRECAO').Clear;
                  end else begin
                     qryParcTemp.FieldByName('IDINDCORRECAO').AsInteger := TpCondPag.iIDIndProj;
                  end;
               end;
            end;
            // Fim Marchetti - Pendencia 25979

            fSaldoDev := qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat;
            Result    := Result + qryParcTemp.FieldByName('VLRPRESTACAO').asFloat;

            qryParcTemp.Post;

         end;

         // Incrementa a parcela de juros cobrada no período de Carencia
         if (TpCondPag.bJurosCarencia) and (dVencto < TpCondPag.dDataIniAmortiz) then
            Inc(iParcCarencia);
       

         // Verifica se houve AMORTIZAÇÃO EXTRA
         //DecodeDate(dVencto,ano,mes,dia);
         //bTemAmortiz := VerifAmortiz(iCondPag, fSaldoDev, mes, ano, rSaldoAmortiz, rPercAmortiz, dVencto, fValorAmortiz);

         // Se teve amortização extra, ajustar aqui o fPrestação
         //if bTemAmortiz then begin
         //   fSaldoDev    := rSaldoAmortiz;
         //   if TpCondPag.iFormaCalculo in[8,12] then begin
         //      fPrestacao   := ComunsImobiliario.Arredonda( fAmortizacao * rPercAmortiz, 2);
         //   end else begin
         //      fPrestacao   := ComunsImobiliario.Arredonda( fPrestacao * rPercAmortiz, 2);
         //   end;
         //   fAmortizacao := fPrestacao;
         //   fNominal     := fPrestacao;
         //end;

         // Se o reajuste for mensal, aplica a taxa de juros (pode ter sido pro-rata na antecipação)
         if TpCondPag.iFormaCalculo in[5,6,7,11] then begin
            if TpCondPag.iPeriodoMeses = 1 then
                 fPrestacao := ComunsImobiliario.Arredonda(fPrestacao * (1 + fTaxaJuros),2)
            else fPrestacao := ComunsImobiliario.Arredonda(fPrestacao * (1 + TpCondPag.fTaxaJurosParc),2);
         end;

         FrmAguarde.Pos := prg;
         Application.ProcessMessages;
         Inc(Prg);


         if (iCondPag = 1798) and (iParc >= 34) and (iParc <= 48) then begin
            bAntecipaProx := True;
         end;

         // Testa se a parcela corrente foi Antecipada e a proxima será antecipada para ajuste do prox. vencto.
         if (qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9) and (bAntecipaProx) then
              bAntecipa := True
         else bAntecipa := False;

         // Testa se a parcela corrente foi Antecipada
         if (qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9) then
              bAntecipaAnt := True
         else bAntecipaAnt := False;


         // Testa Virada do Ano para os tipos com recalculo anual ( EM MESES )
         if TpCondPag.iFormaCalculo in[1,2,4,5,6,7,8,12] then begin
           iMeses := DiasUteis.IntervaloMeses(dVenctoVira,dVencto);
           if (iMeses >= 11) or (TpCondPag.sPrazo = 'A') or
              ( (TpCondPag.iPeriodo > 1) and (iMeses + TpCondPag.iPeriodo > 11) ) then begin
              bViraAno := True;
              iParcFim := iParc;
           end else begin
              bViraAno := False;
           end;
         end;

         if (iCondPag = 1798) and (iParc >= 34) then begin
            bViraAno := False;
         end;


         // Atualiza e Grava o Resíduo Final da Condição de Pagamento
         //BRUNO AZEVEDO SOL 136335 Comentado 1 e 4
         if TpCondPag.iFormaCalculo in[{1,4,}5,6] then begin  // incorpora residuo anualmente
           if iParc = TpCondPag.iNumParcelas  then begin
              ApuraResiduoAcumulado(iCondPag,iParcIni,iParc,fFator,False,qryParcTemp);
           end;
         end;

         // Inicia nova condição repactuada após o término das parcelas da cond. inicial
         if iParc = (TpCondPag.iNumParcelas + iParcCarencia + iParcExtra) then begin
            with dtmFinanciamento do begin
               sSql := 'SELECT *  '+#13+
                       '  FROM CONDPAGIMOVEL  '+#13+
                       ' WHERE IDCONDINICIAL = ' + FloatToStr(TpCondPag.fIDCondInicial) +#13+
                       '   AND TIPOCONDPAG = ''R''  '+#13+
                       '   AND DATAINI > TO_DATE('+ QuotedStr(FormatDateTime('DD/MM/YYYY',dVencto))+',''DD/MM/YYYY'') ' +#13+
                       ' ORDER BY DATAINI ';
               if FazQuery(qryAux, sSql) then begin
                  if not qryAux.IsEmpty then begin
                     // Determina o nr. de parcelas extras e a nova data de vencimento
                     if TpCondPag.sPrazo = 'M' then
                          dVencto := DiasInUteis.SomaMeses(qryAux.FieldByName('DATAVENCIMENTO').AsDateTime,TpCondPag.iPeriodo *  -1)
                     else dVencto := DiasInUteis.SomaMeses(qryAux.FieldByName('DATAVENCIMENTO').AsDateTime,TpCondPag.iPeriodo * -12);

                     // Verifica o novo saldo devedor
                     if qryAux.FieldByName('VLRFINANC').AsInteger > 0 then
                        fSaldoDev := qryAux.FieldByName('VLRFINANC').AsFloat;

                     iParcExtra   := iParcExtra + qryAux.FieldByName('NUMPARCELAS').AsInteger;
                     iParcEncerra := iParcEncerra + TpCondPag.iNumParcelas;
                  end;
               end;
            end;
         end;

      end;
   finally;
      qryParcTemp.EnableControls;
      FrmAguarde.Apaga;
   end;

   qryParcTemp.First;

   //--Emerson--//
   SetStadoDelete(false);
   //--Fim------//

end;



//========================================================================================
// Função INTERNA para Apuração da Antecipação de Parcelas
// Data : 08/01/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iCondPag    - id da Condição de Pagamento que será calculada
//       iParcIni    - Nr. da Parcela Inicial
//       iParcFim    - Nr. da Parcela Final
//       fFator      - Fator de Correção na Parcela Final
//       bIncorpora  - Se o Resíduo estará sendo incorporado ao saldo devedor ou não
//       qryParcTemp - Query das Parcelas que será utilizada
//
// Retorno : Resíduo Acumulado das parcelas entre iParcIni e iParcFim
//----------------------------------------------------------------------------------------
function TFuncAlienacao.CalcAntecipacao(const iFormaCalculo: Integer; const iCondPag: Double; const iParc: Integer;
                                        const dVencto, dVenctoAnt: TDateTime; const fSaldoDevedor, fVlrParcela, fVlrJurosAtual, fTaxaJuros: Extended;
                                        var bAntecipaProx: Boolean): Extended;
var fVlrJuros: Extended;
    iAntecipa, iNumDias : Integer;
begin
  Result        := -1;
  // Calcula a antecipação quando o juros é calculado na parcela
  if iFormaCalculo in[5,6,7,8] then begin
    // Marchetti - Pendencia 22447
    bAntecipaProx := False;
    iAntecipa    := 0;
    fVlrJuros    := 0;
    try
      // Busca as parcelas antecipadas para a mesma data
      with dtmFinanciamento do begin
        qryAux.Close;
        qryAux.Sql.Clear;
        qryAux.Sql.Text := 'SELECT NUMPARCELA     ' +#13+
                           '  FROM PARCFINANCIMOV ' +#13+
                           ' WHERE IDCONDPAGIMOVEL = ' + FloatToStr(iCondPag) +#13+
                           '   AND FLGTIPOLANC > 1 ' +#13+
                           '   AND DATAVENCIMENTO = TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', dVencto)) + ',''DD/MM/YYYY'') ' +#13+
                           'ORDER BY NUMPARCELA ';
        qryAux.Open;
        if not qryAux.isEmpty then begin
           // Verifica quantas parcelas foram antecipadas para o mesmo vencimento
           while not qryAux.Eof do begin
             inc(iAntecipa);
             if qryAux.FieldByName('NUMPARCELA').AsInteger < iParc then bAntecipaProx := True;
             qryAux.Next;
           end;
           // Calcula o juros sobre o saldo devedor, rateando pelo nr. de parcelas antecipadas
           fVlrJuros  := ((fSaldoDevedor - (fVlrParcela * iAntecipa)) * fTaxaJuros) / iAntecipa;
        end;
      end;
    except
      raise;
    end;
  end else
  if iFormaCalculo = 14 then begin
     iNumDias  := DiasUteis.IntervaloDias(dVenctoAnt, dVencto);
     if iNumDias = 0 then fVlrJuros := 0
     else                 fVlrJuros := (fVlrJurosAtual/30) * iNumDias;
  end else begin
    // Desconto do juros embutido na tabela price
    iNumDias  := DiasUteis.IntervaloDias(dVenctoAnt, dVencto);
    fVlrJuros := fVlrJurosAtual - ((fVlrJurosAtual/30) * iNumDias);
  end;
  Result := fVlrJuros;
end;


function TFuncAlienacao.QtdeParcMesmoVencto(const iCondPag: Double; const dVencto: TDateTime): Integer;
begin
  Result := 0;
  with dtmFinanciamento do begin
    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Text := 'SELECT COUNT(NUMPARCELA) AS QTDE ' +#13+
                       '  FROM PARCFINANCIMOV ' +#13+
                       ' WHERE IDCONDPAGIMOVEL = ' + FloatToStr(iCondPag) +#13+
                       '   AND DATAVENCIMENTO = TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', dVencto)) + ',''DD/MM/YYYY'') ' +#13+
                       'ORDER BY NUMPARCELA ';
    qryAux.Open;
    Result := qryAux.FieldByName('QTDE').AsInteger;
  end;
end;


//========================================================================================
// Função INTERNA para Apuração do Resíduo Acumulado para incorporação ao Saldo Devedor
// Data : 22/02/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iCondPag    - id da Condição de Pagamento que será calculada
//       iParcIni    - Nr. da Parcela Inicial
//       iParcFim    - Nr. da Parcela Final
//       fFator      - Fator de Correção na Parcela Final
//       bIncorpora  - Se o Resíduo estará sendo incorporado ao saldo devedor ou não
//       qryParcTemp - Query das Parcelas que será utilizada
//
// Retorno : Resíduo Acumulado das parcelas entre iParcIni e iParcFim
//----------------------------------------------------------------------------------------
function TFuncAlienacao.ApuraResiduoAcumulado(iCondPag:Double; iParcIni,iParcFim:Integer; fFator:Double; bIncorpora : Boolean;
                                              var qryParcTemp: TwwQuery) : Double;
var  fResAcum, fResNovo, fResDif : Double;
     iRecno : TBookmark;
begin
   Result   := 0;
   fResAcum := 0;
   fResNovo := 0;
   fResDif  := 0;
   iRecno := qryParcTemp.GetBookmark;
   qryParcTemp.First;
   while not qryParcTemp.Eof do begin
      if qryParcTemp.FieldByName('IDCONDPAGIMOVEL').AsFloat = iCondPag then begin
         if (qryParcTemp.FieldByName('NUMPARCELA').asInteger >= iParcIni) and
            (qryParcTemp.FieldByName('NUMPARCELA').asInteger <= iParcFim) then begin

            qryParcTemp.Edit;
            qryParcTemp.FieldByName('VLRRESIDUOATUALI').asFloat := 0;

            fResNovo := qryParcTemp.FieldByName('VLRRESIDUO').asFloat / qryParcTemp.FieldByName('FATORCORRECAO').AsFloat * fFator;
            fResDif  := fResDif + (fResNovo - qryParcTemp.FieldByName('VLRRESIDUO').asFloat);
            fResAcum := fResAcum + fResNovo;

            // Soma a diferença total no resíduo da última prestação para contabilização
            if (qryParcTemp.FieldByName('NUMPARCELA').asInteger = iParcFim) and
               (qryParcTemp.FieldByName('CODDOCUMENTO').IsNull) then begin
               qryParcTemp.FieldByName('VLRRESIDUO').asFloat := ComunsImobiliario.Arredonda(qryParcTemp.FieldByName('VLRRESIDUO').asFloat + fResDif, 2);
            end;

            // Se o resíduo não foi cobrado através de parcela extra
            if qryParcTemp.FieldByName('FLGRESIDUOINCORP').AsString <> 'C' then begin
               if bIncorpora = True then
                    qryParcTemp.FieldByName('FLGRESIDUOINCORP').AsString := 'S'
               else qryParcTemp.FieldByName('FLGRESIDUOINCORP').AsString := 'N';
               qryParcTemp.FieldByName('VLRRESIDUOATUALI').asFloat := fResNovo;
            end;

            qryParcTemp.Post;
         end;
      end;
      qryParcTemp.Next;
   end;
   qryParcTemp.GotoBookmark(iRecno);
   Result := fResAcum;
end;



//========================================================================================
// Função INTERNA para Apurar Amortizações Extras no Período da Parcela
// Data : 22/02/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iCondPag  - id da Condição de Pagamento que será calculada
//       rSaldoAnt - Saldo Devedor Anterior a Amortização
//       mes       - Nr. da Parcela Inicial
//       ano       - Nr. da Parcela Final
//       rSaldo    - Retorna o Saldo Devedor após a Amortização Extra
//       rPerc     - Retorna o Percentual Amortizado na Amortização Extra
//
// Retorno : True  - Existe Amortização Extra no mês informado
//           False - Não Existe Amortização Extra no mês informado
//----------------------------------------------------------------------------------------
function TFuncAlienacao.VerifAmortiz(const iCondPag,rSaldoAnt:Double; const mes,ano:Integer;
                                     var rSaldo,rPerc:Double; Var dDataVencto : TDateTime;
                                     var fValorAmortiz : Double): Boolean;
Var sMes : string;
    iSaldoProRata, iSaldoPosAmort, iSaldoDescapit, iProporcao : Double;
begin
   if Length(IntToStr(mes)) = 1 then
   begin
      sMes := '0'+IntToStr(mes);
   end
   else
   begin
      sMes := IntToStr(mes);
   end;

   with dtmFinanciamento do
   begin
      LimpaParametros(dtmFinanciamento.qryVerifAmortiz_new);
      qryVerifAmortiz_new.ParamByName('pCONDPAG').AsFloat   := iCondPag;
      qryVerifAmortiz_new.ParamByName('MES').AsString       := sMes;
      qryVerifAmortiz_new.ParamByName('ANO').AsString       := IntToStr(ano);
      qryVerifAmortiz_new.Open;


      if not qryVerifAmortiz_new.IsEmpty then
      begin

         iSaldoProRata  := rSaldoAnt * qryVerifAmortiz_newFATORCORRECAO.asFloat;

         iSaldoPosAmort := iSaldoProRata - qryVerifAmortiz_newVLRPRESTACAO.asFloat;
         iSaldoDescapit := iSaldoPosAmort / qryVerifAmortiz_newFATORCORRECAO.asFloat;

         iProporcao     := iSaldoDescapit / rSaldoAnt;

         fValorAmortiz  := qryVerifAmortiz_newVLRAMORTIZACAO.AsFloat;

         rSaldo := iSaldoDescapit;
         rPerc  := iProporcao;

         dDataVencto := qryVerifAmortiz_newDATAVENCIMENTO.AsDateTime;

         Result := True;
      end else begin
         rSaldo := 0;
         rPerc  := 0;
         Result := False;
      end;
   end;
end;


//========================================================================================
// Função para Procurar o Mes da Ultima Parcela de uma condição de Pagamento
//        Gerada (competência)
// Data : 22/02/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iCondPag  - id da Condição de Pagamento
//
// Retorno : Ultimo dia do mes da ultima geração, ou a data do sistema se não existir
//           parcela gerada
//----------------------------------------------------------------------------------------
function TFuncAlienacao.BuscaUltMesGerado(const iCondPag:Double): TDateTime;
var sData : String;
begin
   with dtmFinanciamento.qryAux do begin
      Sql.Clear;
      Sql.Add('SELECT MAX(DATAVENCIMENTO) AS DATA ');
      Sql.Add('FROM   PARCFINANCIMOV ');
      Sql.Add('WHERE  FLGTIPOLANC IN(2,3) ');
      Sql.Add('  AND  IDCONDPAGIMOVEL = :pIDCONDPAGIMOVEL ');
      Params[0].AsFloat := iCondPag;
      Open;
      if FieldByName('DATA').AsDateTime > 0 then begin
         sData := FormatDateTime('DD/MM/YYYY',FieldByName('DATA').AsDateTime);
      end else begin
         sData := FormatDateTime('DD/MM/YYYY',Date());
      end;
   end;
   Result := DiasInUteis.UltDiaMes(Word(StrToInt(Copy(sData,7,4))), StrToInt(Copy(sData,4,2)));
end;



//========================================================================================
// Função para Limpar o Flag de Integração e Código de Documento no Estorno de Parcelas
// Data : 25/02/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iParc  - id da Parcela
//
// Retorno : True  - Atualizou a Parcela
//           False - Não Atualizou a Parcela
//----------------------------------------------------------------------------------------
function TFuncAlienacao.GravaEstorno(const iParc: Integer): Boolean;
Var sSql : String;
begin
   Result := True;
   sSql := ' UPDATE PARCFINANCIMOV SET '+
           ' CODDOCUMENTO    = NULL, ' +
           ' PLNCODIGO       = NULL, ' +
           ' FLGLANCINTEGRA  = 0,    ' +
           ' FLGCONCILIADO   = NULL, ' +
           ' DATALANCINTEGRA = TO_DATE(''' + DateToStr(Date()) + ''',''DD/MM/YYYY'')' +
           ' WHERE (IDPARCFINANCIMOV = '+IntToStr(iParc)+')';
   if not ExecutarQuery(dtmFinanciamento.qryAux,sSql) then Result := False;
end;



//========================================================================================
// Função para Verificar se Existe alguma Repactuação com início Superior ao Informado
// Data : 12/03/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iCond    - id da Condição de Pagamento inicial
//       iRepac   - id da Repactuação                     ( -1 )
//       dDataIni - Data base para verificação
//
// Retorno : True  - Existe Repactuação com início superior
//           False - Não Existe Repactuação com início superior
//----------------------------------------------------------------------------------------
function TFuncAlienacao.TemRepacSuperior(const iCond, iRepac: Integer; const dDataIni: TDateTime): Boolean;
var dVenctoParc : TDateTime;
    iCondPag    : Integer;
begin
   Result := False;
   with dtmFinanciamento.qryAux do begin
      SQL.Clear;
      SQL.Add('SELECT  IDCONDPAGIMOVEL, DATAINI, R.DATAREPACTUA ');
      SQL.Add('  FROM CONDPAGIMOVEL C, REPCONDPAGIMOV R ');
      SQL.Add(' WHERE C.IDREPACTUA = R.IDREPACTUA ');
      SQL.Add('   AND (IDCONDPAGIMOVEL = :pIDCONDPAGIMOVEL OR IDCONDINICIAL = :pIDCONDPAGIMOVEL) ');
      SQL.Add(' ORDER BY  DATAREPACTUA ');
      Params[0].AsInteger := iCond;
      Open;

      if not IsEmpty then begin
         Last;
         dVenctoParc := FieldByName('DATAINI').AsDateTime;
         iCondPag    := FieldByName('IDCONDPAGIMOVEL').AsInteger;
         if iRepac = -1 then begin
            if (dVenctoParc >= dDataIni) and (iCondPag <> iCond) then begin
               Result := True;
            end;
         end else begin
            if (FieldByName('DATAINI').AsDateTime >= dDataIni) and
               (FieldByName('IDCONDPAGIMOVEL').AsInteger <> iCond) and
               (FieldByName('IDCONDPAGIMOVEL').AsInteger <> iRepac) then begin
               Result := True;
            end;
         end;
      end;
      dtmFinanciamento.qryAux.Close;
   end;
end;



//========================================================================================
// Função para Verificar se Existe parcelas integradas após a data informada
// Data : 12/03/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iCond    - id da Condição de Pagamento inicial
//       dDataIni - Data base para verificação
//       iQtde    - Quantidade de Parcelas Integradas     ( Retorno )
//
// Retorno : True  - Existem Parcelas Integradas
//           False - Não Existem Parcelas Integradas
//----------------------------------------------------------------------------------------
function TFuncAlienacao.TemParcIntegrada(const iCond: Integer; const dDataIni: TDateTime;
                                         var iQtde: Integer): Boolean;
var dia, mes, ano: Word;
begin
   Result := False;
   iQtde  := 0;
   DecodeDate(dDataIni, ano, mes, dia);
   with dtmFinanciamento.qryAux do begin
      SQL.Clear;
      SQL.Add('  SELECT  COUNT(*) AS QTDE ');
      SQL.Add('    FROM  PARCFINANCIMOV ');
      SQL.Add('   WHERE  FLGLANCINTEGRA > 0 ');
      SQL.Add('     AND  FLGTIPOLANC <> 6 ');        // Acertos de Divergencias
      SQL.Add('     AND  (IDCONDPAGIMOVEL = :pIDCONDPAGIMOVEL) ');
      SQL.Add('     AND  (DATAVENCIMENTO >= :pDATA) ');
      Params[0].AsInteger := iCond;
      Params[1].AsString  := FormatDateTime('dd/mm/yyyy',dDataIni);   // SOL 231549
      Open;

      if FieldByName('QTDE').AsInteger > 0 then begin
         Result := True;
         iQtde  := FieldByName('QTDE').AsInteger;
      end;
   end;
end;



//========================================================================================
// Função para Recalcular as parcelas de uma Condição de Pagamento
// Data : 12/03/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iCond    - id da Condição de Pagamento inicial
//       dDataIni - Data do Primeiro Vencimento
//
// Retorno : True  - Recalculo com sucesso
//           False - Falha do Recalculo
//----------------------------------------------------------------------------------------
function TFuncAlienacao.RecalculaParcela(const iIdCondInicial: Double; const dDataIni: TDateTime): Boolean;
var dDataBase : TDateTime;
begin
   Result    := True;
   dDataBase := FuncAlienacao.BuscaUltMesGerado(iIdCondInicial);
   with dtmFinanciamento do begin
      LimpaParametros(qryParc);
      qryParc.ParamByName('IDCONDPAGIMOVEL').AsFloat := iIdCondInicial;
      qryParc.Open;
      try
         FuncAlienacao.GeraParcela(iIdCondInicial, dDataIni, dDataBase, DtmFinanciamento.qryParc);
         qryParc.ApplyUpdates;
         qryParc.CommitUpdates;
      except
         Result := False;
      end;
   end;
end;


//========================================================================================
// Função para Verificar se o Documento já foi pago no Contas a Receber
// Data : 29/05/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iDocumento - Nr. do Documento
//       dPagto     - Variável para retorno da Data do Pagamento
//
// Retorno : True  - Documento Pago
//           False - Documento em Aberto
//----------------------------------------------------------------------------------------
function TFuncAlienacao.VerificaPagto(const iDocumento: Integer; var dPagto: TDateTime): Boolean;
var sSql : String;
begin
   Result := False;
   sSql := 'SELECT MAX(L.DATALANCTO) AS DATAPAG ' +
           '  FROM LANCTODOCUM L, ' +
           '       DOCUMENTO D ' +
           ' WHERE D.CODDOCUMENTO = ' + IntToStr(iDocumento) +
           '  AND  D.STATUS = ' + QuotedStr('2') +
           '  AND  L.OPERACAO = ' + QuotedStr('5') +
           '  AND  L.ESTORNO IS NULL ' +
           '  AND  L.CODDOCUMENTO = D.CODDOCUMENTO ';

   with dtmFinanciamento do begin
      if FazQuery(qryAux, sSql) then begin
         if not qryAux.IsEmpty then begin
            if not qryAux.FieldByName('DATAPAG').IsNull then begin
               Result := True;
               dPagto := qryAux.FieldByName('DATAPAG').AsDateTime;
            end;
         end;
      end else begin
         Result := True;
      end;
   end;
end;


//========================================================================================
// Função para Excluir Integração de Parcelas
// Data : 29/05/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iDocumento - Nr. do Documento
//       iPlanilha  - Nr. da Planilha
//       iParcela   - Id da Parcela excluída
//       dIntegra   - Data da Integração
//       bProgresso - Exibe form de Progresso
//       sMens      - Retorna a Mensagem de Erro
//
// Retorno : True  - Documento Excluído
//           False - Erros na Exclusão
//----------------------------------------------------------------------------------------
function TFuncAlienacao.ExcluiIntegracao(const iDocumento,iPlanilha,iParcela,iTipo: Integer;
                                         const dIntegra: TDateTime;
                                         const bProgresso: Boolean; var sMens: String): Boolean;
var bTransacao, bIntegrado: Boolean;
    dInt : TDateTime;
    sSql : String;
begin
   Result     := True;
   bTransacao := False;
   bIntegrado := True;
   sMens      := '';
   // define a data que foi feita a integração anterior para verificar se é possível estornar
   if dIntegra > 0 then
        dInt := dIntegra
   else dInt := Date();

   if bProgresso then begin
      if (iDocumento > 0) or (iPlanilha > 0) then begin
         FrmAguarde.Min := 0;
         FrmAguarde.Max := 0;
         FrmAguarde.Pos := 0;
         FrmAguarde.Mostra('Excluindo Doc. ' + IntToStr(iDocumento) + '...');
         Application.ProcessMessages;
      end;
   end;

   try
      try
         if not dtmBaseDados.dbBaseDados.InTransaction then begin
            StartTransacao;
            bTransacao := True;
         end;

         // exclui pagamentos extras da tabela PARCFINANCIMOV
         if iTipo = 6 then begin
            // Limpa o ID da parcela extra da parcela com divergencia
            sSQL := ' UPDATE PARCFINANCIMOV '+
                    '    SET FLGCONCILIADO = NULL '  +
                    '  WHERE IDPARCFINANCIMOV IN ( SELECT IDPARCFINANCIMOV ' +
                    '                                FROM CONCILIADOC ' +
                    '                               WHERE IDDOCDIVERGE = ' + IntToStr(iDocumento) + ' )';
            if not ExecutarQuery(dtmFinanciamento.qryAux,sSQL) then
               raise Exception.Create('Erro ao atualizar divergencias cobradas em PARCFINANCIMOV');
         end;

         // exclui o acerto do resíduo na tabela PARCEXTRAIMOV
         if iTipo = 10 then begin
            // Retorna a situação de Incorporação do Resíduo para <N>ão
            sSql := 'UPDATE PARCFINANCIMOV ' +#13+
                    '   SET FLGRESIDUOINCORP = ''N'' '+#13+
                    ' WHERE IDPARCFINANCIMOV IN( SELECT IDPARCCOBRADA ' +#13+
                    '                              FROM PARCEXTRAIMOV ' +#13+
                    '                             WHERE IDPARCCOBRANCA = ' + IntToStr(iParcela) + ')';
            if not ExecutarQuery(dtmFinanciamento.qryAux,sSQL) then
               raise Exception.Create('Erro ao atualizar cobrança de resíduo em PARCFINANCIMOV');

            // Exclui o lancamento em PARCEXTRAIMOV
            sSQL := ' DELETE FROM PARCEXTRAIMOV '+
                    '  WHERE IDPARCCOBRANCA = ' + IntToStr(iParcela);
            if not ExecutarQuery(dtmFinanciamento.qryAux,sSQL) then
               raise Exception.Create('Erro ao excluir a parcela de cobrança do resíduo em PARCEXTRAIMOV');
         end;

         // exclui a parcela extra gerada na tabela PARCFINANCIMOV
         if (iTipo in[6,10]) and (Result = True) then begin
            sSQL := ' DELETE FROM PARCFINANCIMOV '+
                    ' WHERE (IDPARCFINANCIMOV = '+IntToStr(iParcela)+')';
            if not ExecutarQuery(dtmFinanciamento.qryAux,sSQL) then
               raise Exception.Create('Erro ao excluir a parcela gerada em PARCFINANCIMOV');
         end;

         // Grava o Flag de conciliação e limpa o cod. do documento nas parcelas
         if not GravaEstorno(iParcela) then
            raise Exception.Create('Erro ao atualizar PARCFINANCIMOV');

         // Exclui o lançamento
         if (iDocumento > 0) or (iPlanilha > 0) then
              bIntegrado := True
         else bIntegrado := False;

         if FuncoesImob.ExcluiLancImovel(iDocumento,
                                         iPlanilha,
                                         dInt,
                                         (iDocumento > 0),
                                         (iPlanilha > 0),
                                         sMens) <> 0 then
            raise Exception.Create(sMens);

         if bTransacao then CommitTransacao;
      except
         on E: Exception do begin
            Result := False;
            if bTransacao then RollBackTransacao;
            MsgDlg(E.Message, 'Aviso', mtWarning, [mbOk],0);
         end;
      end;
   finally
      if bProgresso then FrmAguarde.Apaga;
   end;
end;


//========================================================================================
// Função para Procurar os Alteradores referentes ao Tipo de Imóvel do Contrato / Parcela
// Data : 04/06/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iTipoImovel - Id. do Tipo de Imóvel   ( -1 )
//       iContrato   - Id. do Contrato         ( -1 )
//       iParcela    - Id. da Parcela          ( -1 )
//       iAltMulta   - Retorna o Alterador para Multa
//       iAltJuros   - Retorna o Alterador para Juros
//       iAltCorr    - Retorna o Alterador para Correção Monetária
//       sAltMulta   - Retorna a Descrição do Alterador para Multa
//       sAltJuros   - Retorna a Descrição do Alterador para Juros
//       sAltCorr    - Retorna a Descrição do Alterador para Correção Monetária
//
// Retorno : True  - Encontrou os Alteradores
//           False - Não Encontrou os Alteradores
//----------------------------------------------------------------------------------------
function TFuncAlienacao.BuscaAlteradores(const iContrato,iParcela: Integer;
                                         var iAltMulta, iAltJuros, iAltCorr: Integer;
                                         var sAltMulta, sAltJuros, sAltCorr: String): Boolean;
var sSql, sParam, sTipo : String;
begin
   Result    := True;
   iAltMulta := -1;
   iAltJuros := -1;
   iAltCorr  := -1;
   sAltMulta := '';
   sAltJuros := '';
   sAltCorr  := '';
   // Procura o tipo de imóvel do contrato
   sParam := '';
   if iContrato > 0 then sParam := ' AND CP.IDCONTRATOIMOVEL = ' + IntToStr(iContrato);
   if iParcela  > 0 then sParam := sParam + ' AND PF.IDPARCFINANCIMOV = ' + IntToStr(iParcela);

   sSql   := 'SELECT DISTINCT IM.CODTIPIMOVEL '+
             '  FROM IMOVEL IM, '+
             '       CONTRATOXIMOVEL CXI, '+
             '       CONDPAGIMOVEL CP, '+
             '       PARCFINANCIMOV PF '+
             ' WHERE PF.IDCONDPAGIMOVEL = CP.IDCONDPAGIMOVEL '+
             '   AND CP.IDCONTRATOIMOVEL = CXI.IDCONTRATOIMOVEL '+
             '   AND CXI.IDIMOVEL = IM.IDIMOVEL '+ sParam;
   if FazQuery(dtmFinanciamento.qryAux, sSql) then begin
      sTipo  := dtmFinanciamento.qryAux.FieldByName('CODTIPIMOVEL').AsString;
   end else begin
      Result := False;
   end;

   // Busca os Alteradores do Tipo de Imóvel
   if Result then begin
      sSql := 'SELECT TI.CODALTMTAL, TI.CODALTJRAL, TI.CODALTCMAL, '+
              '   TAM.DESCRICAO AS ALTERADOR_MULTA, '+
              '   TAJ.DESCRICAO AS ALTERADOR_JUROS, '+
              '   TAR.DESCRICAO AS ALTERADOR_CORRECAO '+
              'FROM '+
              '   TIPOIMOVEL TI, TIPOALTERADOR TAM, TIPOALTERADOR TAJ, TIPOALTERADOR TAR '+
              'WHERE TI.CODALTMTAL = TAM.CODALTERADOR(+) '+
              '  AND TI.CODALTJRAL = TAJ.CODALTERADOR(+) '+
              '  AND TI.CODALTCMAL = TAR.CODALTERADOR(+) '+
              '  AND TI.CODTIPIMOVEL = ' + QuotedStr(sTipo);
      if FazQuery(dtmFinanciamento.qryAux, sSql) then begin
         with dtmFinanciamento do begin
            if not qryAux.FieldByName('CODALTMTAL').IsNull then begin
               iAltMulta := qryAux.FieldByName('CODALTMTAL').AsInteger;
               sAltMulta := qryAux.FieldByName('ALTERADOR_MULTA').AsString;
            end;
            if not qryAux.FieldByName('CODALTJRAL').IsNull then begin
               iAltJuros := qryAux.FieldByName('CODALTJRAL').AsInteger;
               sAltJuros := qryAux.FieldByName('ALTERADOR_JUROS').AsString;
            end;
            if not qryAux.FieldByName('CODALTCMAL').IsNull then begin
               iAltCorr  := qryAux.FieldByName('CODALTCMAL').AsInteger;
               sAltCorr  := qryAux.FieldByName('ALTERADOR_CORRECAO').AsString;
            end;
         end;
      end else begin
         Result := False;
      end;
   end;
end;



function TFuncAlienacao.BuscaSaldoComposto(const fContrato: Double; const dVencto: TDateTime; const iForma: integer; var dUltVencto: TDateTime; var fFatorAcum,fJurosAcum:Extended): Extended;
var iCondPagAnt : Integer;
begin
   Result     := 0;
   fFatorAcum := 1;
   fJurosAcum := 1;
   dUltVencto := -1;

   // Verifica o saldo da condição inicial, sem repactuações
   with dtmFinanciamento.qryAux do begin
      SQL.Clear;
      SQL.Add('SELECT  SUM(CP.VLRFINANC) AS VLRTOTAL, MIN(CP.DATAVENCIMENTO) AS PRIMEIRA');
      SQL.Add('  FROM  CONDPAGIMOVEL CP ');
      SQL.Add(' WHERE  CP.IDCONTRATOIMOVEL = :PIDCONTRATOIMOVEL ');
      SQL.Add('   AND  CP.FORMACALCULO = :PFORMACALCULO ');
      SQL.Add('   AND  CP.IDCONDPAGIMOVEL = CP.IDCONDINICIAL');
      Params[0].AsFloat   := fContrato;
      Params[1].AsInteger := iForma;
      Open;

      // Se for a primeira condição
      if FieldByName('PRIMEIRA').AsDateTime = dVencto then begin
         Result := FieldByName('VLRTOTAL').AsFloat;
      end else begin

         // Busca a condição de pagamento imediatamente anterior
         SQL.Clear;
         SQL.Add('SELECT  CP.IDCONDPAGIMOVEL, CP.DATAVENCIMENTO');
         SQL.Add('  FROM  CONDPAGIMOVEL CP ');
         SQL.Add(' WHERE  CP.IDCONTRATOIMOVEL = :PIDCONTRATOIMOVEL ');
         SQL.Add('   AND  CP.FORMACALCULO     = :PFORMACALCULO ');
         SQL.Add('   AND  CP.IDCONDPAGIMOVEL  = CP.IDCONDINICIAL');
         SQL.Add('ORDER BY CP.DATAVENCIMENTO' );
         Params[0].AsFloat   := fContrato;
         Params[1].AsInteger := iForma;
         Open;

         while not eof do begin
            iCondPagAnt := FieldByName('IDCONDPAGIMOVEL').AsInteger;
            Next;
            if FieldByName('DATAVENCIMENTO').AsDateTime = dVencto then break;
         end;

         // busca o saldo devedor após a amortização da ultima parcela da cond. anterior
         SQL.Clear;
         SQL.Add('SELECT  NUMPARCELA, VLRSALDODEVEDOR, DATAVENCIMENTO, FATORCORRECAO, ');
         SQL.Add('        VLRSALDOATUAL, VLRJUROS ');
         SQL.Add('  FROM  PARCFINANCIMOV ');
         SQL.Add(' WHERE  IDCONDPAGIMOVEL = :PIDCONDPAGIMOVEL ');
         SQL.Add('ORDER BY NUMPARCELA' );
         Params[0].AsInteger := iCondPagAnt;
         Open;

         // Acumula Fator de Correção e Juros
         while not eof do begin
            fFatorAcum := fFatorAcum * FieldByName('FATORCORRECAO').AsFloat;
            if (FieldByName('VLRJUROS').AsFloat > 0) and (FieldByName('VLRSALDOATUAL').AsFloat > 0) then begin
               fJurosAcum := fJurosAcum * ((FieldByName('VLRJUROS').AsFloat  / FieldByName('VLRSALDOATUAL').AsFloat) + 1);
            end;
            Next;
         end;

         Last;
         dUltVencto := FieldByName('DATAVENCIMENTO').AsDateTime;
         Result     := FieldByName('VLRSALDODEVEDOR').AsFloat;
      end;
   end;
end;

function TFuncAlienacao.InsereMsgBoleto(const iDocumento: Int64;  const vMensagem: array of string): Boolean;
var
   //CtrlDocumento : TCtrlDocumento;
   CtrlDocumento : TCtrlImobDocumento;
begin
   try
      //CtrlDocumento := TCtrlDocumento.Create;
      CtrlDocumento := TCtrlImobDocumento.Create;
      CtrlDocumento.InitializeAs(Padroes);

      FuncoesImob.InsertMsgLanc(iDocumento, '', '', -1, vMensagem);

      // Marchetti - 21/02/2006 - Pendencia 17552
      CtrlDocumento.IntBanco.SetaMensagensCNAB(iDocumento, -1, vMensagem);
      // Fim Marchetti - 21/02/2006 - Pendencia 17552

      // COLOCAR EMISBLOQ = N E CONTROLEREMESSA = NULL
      LimpaParametros(dtmFinanciamento.qryUpdateDocumento);
      dtmFinanciamento.qryUpdateDocumento.ParamByName('PCODDOCUMENTO').AsInteger := iDocumento;
      dtmFinanciamento.qryUpdateDocumento.ExecSQL;
   finally
      FreeAndNil(CtrlDocumento);
   end;
end;


// FUNÇÃO PARA BUSCAR O SALDO DEVEDOR VINCENDO DE UM CONTRATO
function TFuncAlienacao.CalcSaldoDevedorAnt(const iContrato, iCondPag: Integer;
                                            const dData: TDateTime): Extended;
var sSql      : String;
    dLimite   : TDateTime;
    fSaldo    : Extended;
    qryCond   : TwwQuery;
    updCond   : TUpdateSQL;
begin
  Result := 0;
  if dData = -1 then
       dLimite := Date
  else dLimite := dData;

  try
     // Busca o Saldo Teórico Corrigido antes de ser amortizado das condições ainda vigentes
     // Marchetti - Pendencia 28201
     //sSql := 'SELECT IDCONDPAGIMOVEL, DATAVENCIMENTO, VLRSALDOATUAL '+#13+
     sSql := 'SELECT IDCONDPAGIMOVEL, DATAVENCIMENTO, VLRSALDODEVEDOR AS VLRSALDOATUAL '+#13+
             '  FROM PARCFINANCIMOV     '+#13+
             ' WHERE NUMPARCELA > 0     '+#13+
             '   AND FLGTIPOLANC <> 6   '+#13+
      //     '   AND DATAVENCIMENTO > TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYY',dLimite)) + ',''DD/MM/YYYY'') '+#13+
             '   AND DATAVENCIMENTO <= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYY',dLimite)) + ',''DD/MM/YYYY'') '+#13+
             '   AND IDCONDPAGIMOVEL IN ( SELECT IDCONDINICIAL FROM CONDPAGIMOVEL '+#13+
             '                             WHERE IDCONTRATOIMOVEL = ' + IntToStr(iContrato) +#13;

     if iCondPag > 0 then
       sSql := sSql + '                      AND IDCONDINICIAL = ' + IntToStr(iCondPag) +#13;

     sSql := sSql + '                    ) '+#13;

     if dData = -1  then
       sSql := sSql + '   AND NVL(VLRPAGO,0) = 0 '+#13;

     //sSql := sSql + ' ORDER BY IDCONDPAGIMOVEL, DATAVENCIMENTO';
     sSql := sSql + ' ORDER BY DATAVENCIMENTO DESC, IDCONDPAGIMOVEL ASC';
     // Fim Marchetti - Pendencia 28201
     FazQuery( dtmFinanciamento.qryAux, sSql );

     qryCond  := TwwQuery.Create( nil );
     updCond  := TUpdateSQL.Create( nil );
     qryCond.DatabaseName  := dtmFinanciamento.qryAux.DatabaseName;
     qryCond.UpdateObject  := updCond;
     qryCond.CachedUpdates := True;
     FazQuery( qryCond, 'SELECT 0 AS IDCONDPAGIMOVEL FROM CONDPAGIMOVEL WHERE 1=2');

     fSaldo := 0;
     with dtmFinanciamento do begin
        while not qryAux.Eof do begin
           if not qryCond.Locate('IDCONDPAGIMOVEL',qryAux.FieldByName('IDCONDPAGIMOVEL').AsInteger,[]) then begin
              fSaldo := fSaldo + ComunsImobiliario.Arredonda(qryAux.FieldByName('VLRSALDOATUAL').AsFloat, 2);
              qryCond.Insert;
              qryCond.FieldByName('IDCONDPAGIMOVEL').AsInteger := qryAux.FieldByName('IDCONDPAGIMOVEL').AsInteger;
              qryCond.Post;
           end;
           qryAux.Next
        end;
     end;

     // Verifica as condições já encerradas que não tiveram o saldo teórico quitado
     sSql := 'SELECT P.IDPARCFINANCIMOV, P.IDCONDPAGIMOVEL, P.DATAVENCIMENTO, '+#13+
             '       ROUND(P.VLRSALDODEVEDOR, 2) AS VLRSALDODEVEDOR '+#13+
             '  FROM PARCFINANCIMOV P, '+#13+
             '       ( SELECT P.IDCONDPAGIMOVEL, '+#13+
             '                MAX(P.DATAVENCIMENTO)  AS DATAVENCIMENTO, '+#13+
             '                MAX(P.NUMPARCELA)      AS ULTPARC '+#13+
             '           FROM PARCFINANCIMOV P, CONDPAGIMOVEL C '+#13+
             '          WHERE C.IDCONDINICIAL = P.IDCONDPAGIMOVEL '+#13+
             '            AND C.IDCONTRATOIMOVEL = ' + IntToStr(iContrato) +#13+
             '            AND P.NUMPARCELA > 0 '+#13+
             '            AND C.IDREPACTUA IS NULL '+#13+
             '          GROUP BY P.IDCONDPAGIMOVEL  ) UP '+#13+
             ' WHERE P.IDCONDPAGIMOVEL = UP.IDCONDPAGIMOVEL '+#13+
             '   AND P.DATAVENCIMENTO  = UP.DATAVENCIMENTO  '+#13+
             '   AND P.NUMPARCELA      = UP.ULTPARC         '+#13+
             '   AND P.VLRSALDODEVEDOR > 0 '+#13+
             '   AND P.NUMPARCELA > 0 ';
     if iCondPag > 0 then
       sSql := sSql + ' AND P.IDCONDPAGIMOVEL = ' + IntToStr(iCondPag);

     FazQuery( dtmFinanciamento.qryAux, sSql );
     with dtmFinanciamento do begin
        while not qryAux.Eof do begin
           if not qryCond.Locate('IDCONDPAGIMOVEL',qryAux.FieldByName('IDCONDPAGIMOVEL').AsInteger,[]) then begin
              fSaldo := fSaldo + ComunsImobiliario.Arredonda(qryAux.FieldByName('VLRSALDODEVEDOR').AsFloat, 2);
              qryCond.Insert;
              qryCond.FieldByName('IDCONDPAGIMOVEL').AsInteger := qryAux.FieldByName('IDCONDPAGIMOVEL').AsInteger;
              qryCond.Post;
           end;
           qryAux.Next
        end;
     end;

  finally
     FreeAndNil( updCond );
     FreeAndNil( qryCond );
     Result := fSaldo;
  end;
end;


function TFuncAlienacao.CalcSaldoDevedor(const iContrato, iCondPag: Integer; const dData: TDateTime): Extended;
var sSql      : String;
    dLimite   : TDateTime;
    fSaldo    : Extended;
    qryCond   : TwwQuery;
    updCond   : TUpdateSQL;
begin
  Result := 0;
  if dData = -1 then
       dLimite := Date
  else dLimite := dData;

  // Ajustar para FUNCEF contrato 000444 não funciona para a nova função
  if (Sistema.TipoCliente = 19991) and (iContrato = 2720) then begin
     Result := CalcSaldoDevedorAnt(iContrato, iCondPag, dData);
     Exit;
  end;

  try
     // Busca o Saldo Teórico Corrigido antes de ser amortizado das condições ainda vigentes
     sSql := 'SELECT P.IDCONDPAGIMOVEL, P.DATAVENCIMENTO, '+#13+
             '       DECODE(ULT.FORMACALCULO,             '+#13+
             '              1, ROUND((NVL(P.VLRSALDOATUAL,0) - NVL(P.VLRAMORTIZACAO,0) + NVL(P.VLRCORRSALDO,0) ),2),    '+#13+
             '               9, ROUND(NVL(P.VLRSALDODEVEDOR,0),2),    '+#13+
             '              10, ROUND(NVL(P.VLRSALDODEVEDOR,0),2),    '+#13+
             '              14, ROUND(NVL(P.VLRSALDODEVEDOR,0),2),    '+#13+
//             '              18, ROUND((NVL(P.VLRSALDOATUAL,0)- NVL(P.VLRPRESTACAO,0) ),2),' + #13+   // VINICIUS 10/04/2008 FUSESC
             '              18, ROUND((DECODE(P.FLGTIPOLANC, 11, P.VLRSALDODEVEDOR - NVL(P.VLRCORRSALDO,0) - NVL(P.VLRJUROS,0)  , ' + #13+
             '                 DECODE(P.VLRSALDOATUAL,NULL,P.VLRSALDODEVEDOR,NVL(P.VLRSALDOATUAL,0)- NVL(P.VLRPRESTACAO,0)))),2),' + #13+
             '              2, ROUND((NVL(P.VLRSALDOATUAL,0) - NVL(P.VLRAMORTIZACAO,0)),2),    '+#13+
             '              4, ROUND((NVL(P.VLRSALDOATUAL,0) - NVL(P.VLRAMORTIZACAO,0) + NVL(P.VLRCORRSALDO,0) ),2),    '+#13+
             // Cássio - SOL Nº 122988 KINTANA Nº 733037 - Início
             // Condição incluída para tratar o problema encontrado no contrato 000525, que utiliza a Fórmula de Cálculo nº 8
             '              8, ROUND((P.VLRSALDOATUAL - P.VLRAMORTIZACAO),2), ' +#13 +
             // Cássio - SOL Nº 122988 KINTANA Nº 733037 - Fim
             '                 ROUND((P.VLRSALDOATUAL - P.VLRAMORTIZACAO),2) ) AS SALDOATUAL '+#13+
             '  FROM PARCFINANCIMOV P, '+#13+
             '       ( SELECT P2.IDCONDPAGIMOVEL, C2.FORMACALCULO, MAX(P2.DATAVENCIMENTO) AS DATAVENCIMENTO '+#13+
             '           FROM PARCFINANCIMOV P2, CONDPAGIMOVEL C2, '+#13+

             // Marchetti - Pendencia 21541
             '           ( '+#13+
             '             SELECT /*+ INDEX(LD) INDEX(RP)*/   '+#13+
             '                    IDPARCFINANCIMOV, '+#13+
             '                    DECODE(P.CODDOCUMENTO, NULL, MAX(P.DATAPAGAMENTO), MAX(RP.DATABAIXA) ) AS DATAPAGAMENTO, '+#13+
             '                    DECODE(P.CODDOCUMENTO, NULL, MAX(P.VLRPAGO), SUM(LD.VALOR) ) AS VLRPAGO '+#13+
             '               FROM PARCFINANCIMOV P, LANCTODOCUM LD, RECBTOPAGTO RP '+#13+
             '              WHERE P.CODDOCUMENTO  = LD.CODDOCUMENTO(+) '+#13+
             '                AND LD.CODDOCUMENTO = RP.CODDOCUMENTO(+) '+#13+
             '                AND LD.NUMLANCTO    = RP.NUMLANCTO(+)    '+#13+
             '                AND ( (P.CODDOCUMENTO IS NULL) OR        '+#13+
             '                      (P.CODDOCUMENTO IS NOT NULL AND (RP.DATABAIXA IS NOT NULL OR LD.CODALTERADOR = 215) ) )        '+#13+
             '                AND ((P.CODDOCUMENTO IS NULL     AND DATAPAGAMENTO <= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYY',dLimite)) + ',''DD/MM/YYYY'') ) OR '+#13+
             '                     (P.CODDOCUMENTO IS NOT NULL AND ( RTRIM(LD.OPERACAO) = ''5'' OR LD.CODALTERADOR = 215 ) '+#13+
             '                                                 AND LD.ESTORNO IS NULL                  '+#13+
             '                                                 AND LD.DATALANCTO <= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYY',dLimite)) + ',''DD/MM/YYYY'') ) )  '+#13+
             '              GROUP BY IDPARCFINANCIMOV, P.CODDOCUMENTO                                  '+#13+
             '           ) PP '+#13+
             // Fim Marchetti - Pendencia 21541


             '          WHERE P2.IDCONDPAGIMOVEL = C2.IDCONDINICIAL '+#13+
             // Cássio - SOL Nº 122988 KINTANA Nº 733037 - Início
             //'            AND (P2.NUMPARCELA > 0 OR P2.FLGTIPOLANC IN(12,5,11) ) '+#13+
             '            AND (P2.NUMPARCELA > 0 OR P2.FLGTIPOLANC IN(12,5,11,9) ) '+#13+
             // Cássio - SOL Nº 122988 KINTANA Nº 733037 - Fim

             // Marchetti - Pendencia 21541
             '            AND (PP.IDPARCFINANCIMOV(+) = P2.IDPARCFINANCIMOV) '+#13+
              '           AND ( (P2.DATAVENCIMENTO IS NULL) OR (P2.DATAVENCIMENTO <= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYY',dLimite)) + ',''DD/MM/YYYY'')) OR ' + #13 +
              '                 (PP.DATAPAGAMENTO <= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYY',dLimite)) + ',''DD/MM/YYYY'')) )' + #13 +
             // Fim Marchetti - Pendencia 21541

             '            AND P2.FLGTIPOLANC <> 6   '+#13+

// VINICIUS - 04/01/2006 - Verificar ordem cronologica das repactuações
             '            AND (C2.IDREPACTUA IS NULL OR C2.DATAFIM >= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYY',dLimite)) + ',''DD/MM/YYYY'') ) '+#13+
// Fim VINICIUS - 04/01/2006

             '            AND P2.IDCONDPAGIMOVEL IN ( SELECT IDCONDINICIAL FROM CONDPAGIMOVEL '+#13+
             '                                         WHERE IDCONTRATOIMOVEL = ' + IntToStr(iContrato) +#13;
     if iCondPag > 0 then
       sSql := sSql + '                      AND IDCONDINICIAL = ' + IntToStr(iCondPag) +#13;

     sSql := sSql + '                    ) '+#13+

             '          GROUP BY P2.IDCONDPAGIMOVEL, C2.FORMACALCULO ) ULT    '+#13+
             ' WHERE P.IDCONDPAGIMOVEL = ULT.IDCONDPAGIMOVEL '+#13+
             '   AND P.DATAVENCIMENTO  = ULT.DATAVENCIMENTO  '+#13+
             '   AND FLGTIPOLANC <> 6 '+#13+
             // Cássio - SOL Nº 122988 KINTANA Nº 733037 - Início
             //'   AND (NUMPARCELA > 0 OR P.FLGTIPOLANC IN(12,5,11) )'+#13+
             //'   AND DECODE(P.FLGTIPOLANC,5,1,DECODE(P.FLGTIPOLANC,11,1,P.VLRSALDOATUAL - P.VLRAMORTIZACAO)) > 0 '+ #13+
             '   AND (NUMPARCELA > 0 OR P.FLGTIPOLANC IN(12,5,11,9) )'+#13+
             '   AND DECODE(P.FLGTIPOLANC,5,1,DECODE(P.FLGTIPOLANC,11,1,DECODE(P.FLGTIPOLANC,9,1,P.VLRSALDOATUAL - P.VLRAMORTIZACAO))) > 0 ' +#13+
             // Cássio - SOL Nº 122988 KINTANA Nº 733037 - Fim
             'UNION '+#13+

             'SELECT IDCONDPAGIMOVEL, DATAVENCIMENTO, '+#13+
             '       VLRFINANC  AS SALDOATUAL '+#13+
             '  FROM CONDPAGIMOVEL '+#13+
             ' WHERE IDREPACTUA IS NULL '+#13+

// VINICIUS - 04/01/2006 - Verificar ordem cronologica das repactuações
             '   AND DATAINI <= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYY',dLimite)) + ',''DD/MM/YYYY'') '+#13+
// Fim VINICIUS - 04/01/2006

             '   AND DATAVENCIMENTO > TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYY',dLimite)) + ',''DD/MM/YYYY'') '+#13+
             '   AND IDCONDPAGIMOVEL IN ( SELECT IDCONDINICIAL FROM CONDPAGIMOVEL '+#13+
             '                             WHERE IDCONTRATOIMOVEL = ' + IntToStr(iContrato) +#13;

     if iCondPag > 0 then
       sSql := sSql + '                      AND IDCONDINICIAL = ' + IntToStr(iCondPag) +#13;

     sSql := sSql + '                    ) ';


     if (Sistema.TipoCliente = 19991) and ( ((iContrato = 2756) and (dLimite < StrToDate('01/04/2006'))) or (iContrato = 2806) or (iContrato = 2802)) then
     begin
        sSQL :=
        'SELECT P.IDCONDPAGIMOVEL, P.DATAVENCIMENTO, ' + #13 +
        '       DECODE(ULT.FORMACALCULO, ' + #13 +
        '                           1, ROUND((NVL(P.VLRSALDOATUAL,0) - NVL(P.VLRAMORTIZACAO,0) + NVL(P.VLRCORRSALDO,0) ),2), ' + #13 +
        '                           2, ROUND((NVL(P.VLRSALDOATUAL,0) - NVL(P.VLRAMORTIZACAO,0)),2), ' + #13 +
        '                           4, ROUND((NVL(P.VLRSALDOATUAL,0) - NVL(P.VLRAMORTIZACAO,0) + NVL(P.VLRCORRSALDO,0) ),2), ' + #13 +
        '                           9, ROUND(P.VLRSALDODEVEDOR,2), ' + #13 +
        '                          10, ROUND(P.VLRSALDODEVEDOR,2), ' + #13 +
        '                           11, ROUND(NVL(P.VLRSALDODEVEDOR,0),2), ' + #13 +
        '                               ROUND((P.VLRSALDOATUAL - P.VLRAMORTIZACAO),2) ) AS SALDOATUAL ' + #13 +
        '               FROM PARCFINANCIMOV P, ' + #13 +
        '                    ( SELECT P2.IDCONDPAGIMOVEL, C2.FORMACALCULO, min(P2.DATAVENCIMENTO) AS DATAVENCIMENTO ' + #13 +
        '                        FROM PARCFINANCIMOV P2, CONDPAGIMOVEL C2, REPCONDPAGIMOV R ' + #13 +
        '                       WHERE P2.IDCONDPAGIMOVEL = C2.IDCONDINICIAL ' + #13 +
        '                         AND C2.IDREPACTUA = R.IDREPACTUA(+) ' + #13 +
        '                         AND P2.FLGTIPOLANC <> 6 ' + #13 +
        '                         AND (C2.IDREPACTUA IS NULL OR R.DATAREPACTUA > TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYY',dLimite)) + ',''DD/MM/YYYY'') ) '+#13+
        '                         AND P2.IDCONDPAGIMOVEL IN ( SELECT IDCONDINICIAL FROM CONDPAGIMOVEL ' + #13 +
        '                                                      WHERE IDCONTRATOIMOVEL =  ' + IntToStr(iContrato) +#13;
        if iCondPag > 0 then
          sSql := sSql + '                      AND IDCONDINICIAL = ' + IntToStr(iCondPag) +#13;

        sSQL := sSQL +
        '                         ) ' + #13 +
        '                       GROUP BY P2.IDCONDPAGIMOVEL, C2.FORMACALCULO ) ULT ' + #13 +
        '              WHERE ' + #13 +
        '                    P.IDCONDPAGIMOVEL = ULT.IDCONDPAGIMOVEL ' + #13 +
        '                AND FLGTIPOLANC <> 6 ' + #13 +
        '                AND P.DATAVENCIMENTO <= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYY',dLimite)) + ',''DD/MM/YYYY'') '+#13+
        'ORDER BY DATAVENCIMENTO DESC ' + #13;
     end;

     FazQuery( dtmFinanciamento.qryAux, sSql );

     qryCond  := TwwQuery.Create( nil );
     updCond  := TUpdateSQL.Create( nil );
     qryCond.DatabaseName  := dtmFinanciamento.qryAux.DatabaseName;
     qryCond.UpdateObject  := updCond;
     qryCond.CachedUpdates := True;
     FazQuery( qryCond, 'SELECT 0 AS IDCONDPAGIMOVEL FROM CONDPAGIMOVEL WHERE 1=2');

     if (Sistema.TipoCliente = 19991) and ( ((iContrato = 2756) and (dLimite < StrToDate('01/04/2006'))) or (iContrato = 2806) or (iContrato = 2802)) then
     begin
        fSaldo := ComunsImobiliario.Arredonda(dtmFinanciamento.qryAux.FieldByName('SALDOATUAL').AsFloat, 2);
     end
     else
     begin
        fSaldo := 0;
        with dtmFinanciamento do begin
           while not qryAux.Eof do begin
              if not qryCond.Locate('IDCONDPAGIMOVEL',qryAux.FieldByName('IDCONDPAGIMOVEL').AsInteger,[]) then begin
                 fSaldo := fSaldo + ComunsImobiliario.Arredonda(qryAux.FieldByName('SALDOATUAL').AsFloat, 2);
                 qryCond.Insert;
                 qryCond.FieldByName('IDCONDPAGIMOVEL').AsInteger := qryAux.FieldByName('IDCONDPAGIMOVEL').AsInteger;
                 qryCond.Post;
              end;
              qryAux.Next
           end;
        end;
     end;
  finally
     FreeAndNil( updCond );
     FreeAndNil( qryCond );
     Result := fSaldo;
  end;
end;



function TFuncAlienacao.CalculaTipoCalculo14(iCondPag: Double; dVenctoIni, dDataBase: TDateTime; qryParcTemp: TwwQuery): Double;
var
   bCondPagNova  : Boolean;        // Indica se encontrou uma repactuação nova
   TpCondPag     : TCondPag;       // Dados da Condição de Pagamento
   TpCondPagAnt  : TCondPag;       // Dados da Condição de Pagamento antes de checar repactuação
   iParc         : Integer;        // Número da Parcela
   iParcRestante : Integer;        // Número de Parcelas Restantes
   iParcCarencia : Integer;        // Parcelas de Juros cobradas durante a carencia
   fSaldoDev     : Double;         // Valor do Saldo devedor
   fPrestacao    : Double;         // Valor da Prestação
   fNominal      : Double;         // Valor Nominal da Prestação
   fFator        : Double;         // Fator de Correção das parcelas ( real * projetado )
   fFatorMes     : Double;         // Fator de Correção do Mes da Parcela
   dIniFator     : TDateTime;      // Data de início para busca do Fator de Correção
   dFimFator     : TDateTime;      // Data de Término para busca do Fator de Correção
   iMesHoje      : Integer;        // Mes Atual para verificar o tipo de parcela
   iMesVenc      : Integer;        // Mes de Vencimento para verificar o tipo de parcela
   bTemAmortiz   : Boolean;        // Indica se houve Amortização Extra
   rSaldoAmortiz : Double;         // Saldo Após a Amortização Extra
   rPercAmortiz  : Double;         // Percentual de Amortização Extra
   fResiduoAcum  : Double;         // Resíduo Acumulado para acréscimo no saldo devedor
   Aux           : Double;         // Auxiliar para calculo da prestacao
   dVencto       : TDateTime;      // Data de Vencimento da Parcela
   dVenctoVira   : TDateTime;      // Data de Vencimento na virada do período
   dVenctoAnt    : TDateTime;      // Data de Vencimento da ultima parcela antes da antecipação
   dDataBusca    : TDateTime;      // Data auxiliar para busca da nova condição
   dIniJuros     : TDateTime;
   dReajAnual    : TDateTime;
   ano,mes,dia   : Word;           // Aux para verificar amortização extra
   bViraAno      : Boolean;        // Indica se completou 12 parcelas para virada do ano
   iParcIni      : Integer;        // Parcela inicial para calculo do residuo acumulado
   iParcFim      : Integer;        // Parcela final para calculo do resíduo acumulado
   bAntecipa     : Boolean;        // Se a Parcela anterior foi Antecipada e a Proxima também será antecipada
   bTeveAntecipao: Boolean;        // Se a Parcela anterior foi Antecipada e a Proxima também será antecipada

   bAntecipaProx : Boolean;        // Se a Próxima parcela tanbém foi antecipada
   bAntecipaAnt  : Boolean;        // Se a Parcela anterior foi Antecipada
   prg           : Integer;        // Somente indicador da progress bar
   fVlrJurosAntec: Extended;
   fSaldoDevAntec: Extended;
   fTaxaJuros    : Extended;
   fTaxaJurosAcum: Extended;
   iDiaVencto    : Integer;
   iMesVencto    : Integer;
   iDiaNovo      : Word;
   iMesNovo      : Word;
   iAnoNovo      : Word;
   iMeses        : Integer;
   iMesCorrAnt   : String;        // Mes de correção da parcela anterior para verificar se busca novo fator
   iMesCorrAtu   : String;
   fAmortizacao  : Extended;
   fCorrecaoSld  : Extended;      // Correção Monetária do Saldo Devedor
   fCorrecaoParc : Extended;
   bExisteCotacaoMes : Boolean;   // Existe cotação cadastrada para o mes de competencia
   sSql : String;
   iParcExtra    : Integer;
   iParcEncerra  : Integer;
   ComunsImobiliarioDB : TComunsImobiliarioDB;

   CtrlOperImob       : TCtrlOperImob;
   CtrlParcFinancImov : TCtrlParcFinancImov;
   
   fJuros         : Extended;
   iDia           : Word;
   iMes           : Word;
   iAno           : Word;
   dVencimentoAnt : TDateTime;
   dVencimento    : TDateTime;
   fSaldoDevAnt   : Double;
   fValorAmortiz  : Double;

   // // Marchetti - Pendencia 22447
   iTipoLanc      : Integer;
   iNumParcelas   : Integer;

begin
   // inicializa variaveis
   Result        := 0;
   prg           := 0;
   iParc         := 0;
   iParcRestante := 0;
   iParcEncerra  := 0;
   iParcCarencia := 0;
   iParcExtra    := 0;
   fSaldoDev     := 0;
   fPrestacao    := 0;
   fNominal      := 0;
   fFator        := 1;
   fFatorMes     := 1;
   dIniFator     := Date;
   dFimFator     := Date;
   fResiduoAcum  := 0;
   Aux           := 0;
   dVencto       := Date;
   dVenctoAnt    := Date;
   dVenctoVira   := Date;
   bViraAno      := False;
   iParcIni      := 1;
   iParcFim      := 0;
   bAntecipa     := False;
   bTeveAntecipao:= False;   
   bAntecipaProx := False;
   bAntecipaAnt  := False;
   iDiaVencto    := 0;
   iMesVencto    := 0;
   iDiaNovo      := 0;
   iMesNovo      := 0;
   iAnoNovo      := 0;
   iMeses        := 0;
   iMesCorrAtu   := '';
   iMesCorrAnt   := '';
   fVlrJurosAntec:= 0;
   fSaldoDevAntec:= 0;
   fTaxaJuros    := 0;
   fTaxaJurosAcum:= 0;
   fAmortizacao  := 0;
   fCorrecaoSld  := 0;                    
   fCorrecaoParc := 0;
   bExisteCotacaoMes := True;

   fValorAmortiz := 0;

   // Verifica a condição de pagamento no Vencimento inicial
   DecodeDate(dVenctoIni, ano, mes, dia);
   FuncAlienacao.BuscaCondPag(iCondPag, mes, ano, False, TpCondPag, True);

   // Faz as devidas inicializações
   ComunsImobiliarioDB := TComunsImobiliarioDB.Create(Sistema.IDEmpresa, Sistema.IDModulo, Sistema.IDUsuario, sistema.IDEspAcesso, Sistema.UsaPlanoPatro);
   ComunsImobiliarioDB.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                                   Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                                   ComunsImobiliario.MensErroMT);

   CtrlOperImob       := TCtrlOperImob.Create(Sistema.IDEmpresa, Sistema.IDModulo, Sistema.IDUsuario, sistema.IDEspAcesso, -1,-1,Sistema.UsaPlanoPatro);
   CtrlOperImob.InitializeAs(ComunsImobiliarioDB);

   CtrlParcFinancImov := TCtrlParcFinancImov.Create;
   CtrlParcFinancImov.InitializeAs(ComunsImobiliarioDB);




   FrmAguarde.Min := 0;
   FrmAguarde.Max := TpCondPag.iNumParcelas;
   FrmAguarde.Pos := Prg;
   FrmAguarde.Mostra('Aguarde, Gerando Parcelas...');
   Application.ProcessMessages;

   // Se a query das parcelas estiver aberta, mantém aberta para somente alterar os valores
   // que possivelmente forem recalculados, senão, abre para incluir as parcelas novas.
   if qryParcTemp.Active = False then qryParcTemp.Active := True;


   // Apaga os Registros de Saldo Inicial
   with qryParcTemp do begin
      First;
      while not eof do begin
         if (qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 1) and
            (qryParcTemp.FieldByName('IDCONDPAGIMOVEL').AsInteger = iCondPag) then
              Delete
         else Next;
      end;
      First;
   end;

   // define saldo devedor e vencto da primeira parcela
   fSaldoDev      := TpCondPag.fSaldoDev;
   dVenctoAnt     := TpCondPag.dDataVencimento;
   dVencto        := TpCondPag.dDataVencimento;

   dFimFator      := TpCondPag.dIniFatorCM14;
   dReajAnual     := TpCondPag.dIniFatorCM14;

   iDiaVencto     := DiasUteis.ExtraiDia(dVencto);
   iMesVencto     := DiasUteis.ExtraiMes(dVencto);
   bCondPagNova   := False;
   TpCondPagAnt   := TpCondPag;

   // // Marchetti - Pendencia 22447
   iTipoLanc      := -1;

   iNumParcelas := TpCondPag.iNumParcelas;
   qryParcTemp.DisableControls;
   try
      while iParc < (iNumParcelas + iParcCarencia + iParcExtra) do begin
         iParc := iParc + 1;

         if (iParc = 1) and (TpCondPag.iPeriodoReajuste = 1) then
         begin
            bViraAno      := True;
            iParcRestante := (TpCondPag.iNumParcelas + iParcEncerra - (iParc-iParcCarencia-1));

            if (TpCondPag.fTaxaJuros <> 0) then begin
               Aux        := Power((1 + TpCondPag.fTaxaJurosAjust), (iParcRestante) );
               fPrestacao := fSaldoDev * ((TpCondPag.fTaxaJurosAjust * Aux)/(Aux -1));
            end else begin
               fPrestacao := fSaldoDev / (iParcRestante);
            end;
            fNominal := fPrestacao;
         end;

         // // Marchetti - Pendencia 22447
         dVenctoAnt := qryParcTemp.FieldByName('DATAVENCIMENTO').AsDateTime;
         if qryParcTemp.Locate('IDCONDPAGIMOVEL;NUMPARCELA',VarArrayOf([iCondPag,iParc]),[]) then
         begin
            bAntecipa      := (qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9);
            bTeveAntecipao := True;
         end;

         fCorrecaoSld := 0;

         // Busca as codições de pagamento para a próxima parcela
         if iParc > 1 then begin
            // Guarda a condição anterior para verificar alterações
            TpCondPagAnt := TpCondPag;

            // busca a condição de pagamento vigente no próximo mes de vencimento
            if TpCondPag.sPrazo = 'M' then
                 DecodeDate(DiasInUteis.SomaMeses(dVencto,TpCondPag.iPeriodo), ano, mes, dia)
            else DecodeDate(DiasInUteis.SomaMeses(dVencto,TpCondPag.iPeriodo*12), ano, mes, dia);

            if not FuncAlienacao.BuscaCondPag(iCondPag, mes, ano, False, TpCondPag) then
               TpCondPag := TpCondPagAnt;

            if TpCondPagAnt.fIDCondPagImovel <> TpCondPag.fIDCondPagImovel then begin
               bCondPagNova := True;
            end else begin
               bCondPagNova := False;
            end;
         end;

         // Se houve repactuação com alteração de juros, num. parcelas, tipo de reajuste,
         // correção, saldo devedor.
         // Força a Virada de ano, para recalculo das parcelas.
         if (bCondPagNova = True) then begin
            if (TpCondPagAnt.iNumParcelas   <> TpCondPag.iNumParcelas)   or
               (TpCondPagAnt.iPeriodo       <> TpCondPag.iPeriodo)       or
               (TpCondPagAnt.sPrazo         <> TpCondPag.sPrazo)         or
               (TpCondPagAnt.fTaxaJuros     <> TpCondPag.fTaxaJuros)     or
               (TpCondPagAnt.sPeriodoTaxa   <> TpCondPag.sPeriodoTaxa)   or
               (TpCondPagAnt.iFormaCalculo  <> TpCondPag.iFormaCalculo)  or
               (TpCondPag.fSaldoDev > 0) then begin
               bViraAno := True;
               iParcFim := iParc - 1;
            end;
         end;

         // busca saldo da correção até o mês da virada.
         if (bViraAno) then begin
            if TpCondPag.iIDIndCorr > 0 then begin
               dIniFator := dReajAnual;
               // Vinicius - 01/02/2005 - o fator é calculado até o ultimo vencimento
               dFimFator := dVencto;

               if TpCondPag.iPeriodoReajuste = 1 then
               begin
                  dFimFator := DiasUteis.SomaMeses(dIniFator,TpCondPag.iPeriodoReajuste);
                  dFimFator := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dFimFator),DiasUteis.ExtraiMes(dFimFator));
               end;

               fFator    := ComunsImobiliarioDB.FatorCorrecao(TpCondPag.iIDIndCorr,
                                                              dIniFator + 1, dFimFator,
                                                              False, TpCondPag.iMesRefReajuste, True);
               dReajAnual := dFimFator;
            end;
         end;

         // Grava a Correção do Saldo devedor no ultimo mes do ciclo, para contabilização
         if fCorrecaoSld > 0 then begin
            qryParcTemp.Edit;
            qryParcTemp.FieldByName('VLRCORRSALDO').asFloat := fCorrecaoSld;
            qryParcTemp.Post;
            fCorrecaoSld := 0;
         end;

         // Calcula Valor da Prestação
         if (bViraAno = True) or (iParc = 1) then begin
            iParcRestante := (TpCondPag.iNumParcelas + iParcEncerra - (iParc-iParcCarencia-1));

            if bViraAno then
            begin
               fPrestacao := fPrestacao * fFator;
            end
            else
            if (TpCondPag.fTaxaJuros <> 0) then begin
               Aux        := Power((1 + TpCondPag.fTaxaJurosAjust), (iParcRestante) );
               fPrestacao := fSaldoDev * ((TpCondPag.fTaxaJurosAjust * Aux)/(Aux -1));
            end else begin
               fPrestacao := fSaldoDev / (iParcRestante);
            end;
            fNominal := fPrestacao;
         end;

         // Efetua todas as gravações apenas se o valor da prestação for > 0
         if fPrestacao > 0 then begin

            // Verifica a data de Vencimento, buscando na repactuação
            dIniFator  := DiasUteis.SomaMeses(dVencto, 1);

            if bCondPagNova = True then begin
               dVenctoAnt  := dVencto;
               dVencto     := TpCondPag.dDataVencimento;
               iDiaVencto  := DiasUteis.ExtraiDia(dVencto);
               iMesVencto  := DiasUteis.ExtraiMes(dVencto);
               if bViraAno then
                  dVenctoVira := dVencto;
            end else begin
               if iParc = 1 then begin
                  dVencto     := TpCondPag.dDataVencimento;
                  dVenctoAnt  := TpCondPag.dDataAssinatura;
                  iDiaVencto  := DiasUteis.ExtraiDia(dVencto);
                  iMesVencto  := DiasUteis.ExtraiMes(dVencto);
                  dVenctoVira := TpCondPag.dDataVencimento;

                  // Considera a mesma data de vencto como inicio do fator para calcular pro-rata
                  // da CM para calculos com CORREÇÃO MENSAL, pois o indice do mes será pro-rateado
                  if TpCondPag.dUltVenctoComposto > 0 then
                       dIniFator := DiasUteis.SomaMeses(TpCondPag.dUltVenctoComposto,1)
                  else dIniFator := dVencto;

               end else begin

                  // Se não houve antecipação de parcelas, altera a data do prox. vencimento
                  if not bAntecipa then begin
                     dVenctoAnt := dVencto;

                     // Ajusta o dia do vencimento para o estipulado no contrato, pois o ultimo
                     // vencimento pode ter sido alterado na antecipação
                     DecodeDate(dVencto, iAnoNovo,iMesNovo,iDiaNovo);
                     if iDiaNovo <> iDiaVencto then begin
                        try
                           dVencto := EncodeDate(iAnoNovo,iMesNovo,iDiaVencto);
                        except
                           dVencto := DiasUteis.UltDiaMes(iAnoNovo,iMesNovo);
                        end;
                     end;

                     if TpCondPag.sPrazo = 'M' then
                          dVencto := DiasUteis.SomaMeses( dVencto, TpCondPag.iPeriodo)
                     else dVencto := DiasUteis.SomaMeses( dVencto,(TpCondPag.iPeriodo * 12) );

                     // Ajusta ultimo dia do mes
                     iDiaNovo := DiasUteis.ExtraiDia(dVencto);
                     iMesNovo := DiasUteis.ExtraiMes(dVencto);
                     if iDiaNovo < iDiaVencto then begin
                        while iDiaNovo < iDiaVencto do begin
                           dVencto := DiasUteis.SomaDias(dVencto, 1);
                           if iMesNovo <> DiasUteis.ExtraiMes(dVencto) then begin
                              dVencto := DiasUteis.SomaDias(dVencto, -1);
                              Break;
                           end;
                           iDiaNovo := DiasUteis.ExtraiDia(dVencto);
                        end;
                     end;
                  end;

                  // Verifica e ajusta se o vencimento inicial cai no ultimo dia do mês
                  //  caso de vcncto nos dias 28,29/02 ou 30 )
                  if DiasUteis.ExtraiDia(TpCondPag.dDataVencimento) =
                     DiasUteis.ExtraiDia(
                     DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(TpCondPag.dDataVencimento),
                                         DiasUteis.ExtraiMes(TpCondPag.dDataVencimento)) ) then begin

                     dVencto := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dVencto),
                                                    DiasUteis.ExtraiMes(dVencto));
                  end;   

               end;
            end;
            if (bViraAno) and (TpCondPag.iPeriodoReajuste <> 1) then
               dVenctoVira := dVencto;

            DecodeDate(dVenctoVira, iAno, iMes, iDia);

            if qryParcTemp.Locate('IDCONDPAGIMOVEL;FLGTIPOLANC;DATAVENCIMENTO',VarArrayOf([iCondPag,1,dVencto]),[]) then
               qryParcTemp.Delete;

            // Grava Registro de Saldo Inicial antes de fazer a Amortização
            if ((dVenctoVira <> DiasUteis.UltDiaMes(iAno, iMes)) and (bViraAno = True)) or (iParc = 1)  then begin
               if not qryParcTemp.Locate('IDCONDPAGIMOVEL;FLGTIPOLANC;DATAVENCIMENTO',VarArrayOf([iCondPag,1,dVencto]),[]) then begin
                  qryParcTemp.Insert;
                  qryParcTemp.FieldByName('IDPARCFINANCIMOV').asFloat  := LeUltRegistro(nil,'PARCFINANCIMOV');
                  qryParcTemp.FieldByName('IDCONTRATOIMOVEL').asFloat  := TpCondPag.fIDContratoImovel;
                  qryParcTemp.FieldByName('IDCONDPAGIMOVEL').asFloat   := TpCondPag.fIDCondInicial;
                  qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger     := 1;
                  qryParcTemp.FieldByName('NUMPARCELA').AsInteger      := 0;
                  qryParcTemp.FieldByName('FATORCORRECAO').AsFloat     := 1;
               end else begin
                  qryParcTemp.Edit;
               end;
               if iParc = 1 then begin
                  qryParcTemp.FieldByName('DATAVENCIMENTO').asDateTime := TpCondPag.dDataAssinatura;
                  qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat   := TpCondPag.fSaldoDev;
               end else begin
                  qryParcTemp.FieldByName('DATAVENCIMENTO').asDateTime := dVencto;
                  qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat   := fSaldoDev;
               end;

               qryParcTemp.Post;
            end;


            // Verifica se houve AMORTIZAÇÃO EXTRA
            DecodeDate(dVencto,ano,mes,dia);
            dVencimento := dVencto;
            bTemAmortiz := VerifAmortiz(iCondPag, fSaldoDev, mes, ano, rSaldoAmortiz, rPercAmortiz, dVencto, fValorAmortiz);

            // Se teve amortização extra, ajustar aqui o fPrestação
            if bTemAmortiz then begin
               fSaldoDevAnt := fSaldoDev;
               fSaldoDev    := rSaldoAmortiz;
               fPrestacao   := ComunsImobiliario.Arredonda(fPrestacao * rPercAmortiz,2);
               fAmortizacao := fPrestacao;
               fNominal     := fPrestacao;
            end;

            // Marchetti - 21/12/2005
            DecodeDate(dVencto, iAno, iMes, iDia);
            if dVencto <> DiasUteis.UltDiaMes(iAno, iMes) then begin
               dVenctoAnt := DiasUteis.SomaMeses(dVencto,-1);
               DecodeDate(dVenctoAnt, iAno, iMes, iDia);
               dVenctoAnt := DiasUteis.UltDiaMes(iAno, iMes);
               if qryParcTemp.Locate('IDCONDPAGIMOVEL;DATAVENCIMENTO;FLGTIPOLANC;NUMPARCELA',VarArrayOf([iCondPag,dVenctoAnt,11,0]),[]) then
               begin
                  while (qryParcTemp.FieldByName('IDCONDPAGIMOVEL').AsInteger = iCondPag) and
                        (qryParcTemp.FieldByName('DATAVENCIMENTO').AsDateTime = dVenctoAnt) and
                        (qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 11) and
                        (qryParcTemp.FieldByName('NUMPARCELA').AsInteger = 0) do
                  begin
                     qryParcTemp.Delete;
                  end;
                  fJuros        := 0;
                  fCorrecaoParc := 0;
               end
               else

                  CtrlParcFinancImov.BuscaValoresUltimaAtualizacao(StrToInt(FloatToStr(TpCondPag.fIDContratoImovel)),
                                                                StrToInt(FloatToStr(iCondPag)),dVenctoAnt, fJuros, fCorrecaoParc);

               if (fJuros + fCorrecaoParc) = 0 then
               begin
                  if iParc = 1 then
                     CtrlOperImob.CalculaAtualSaldo14('', fCorrecaoParc,
                                                      fJuros, StrToInt(FloatToStr(TpCondPag.fIDContratoImovel)),
                                                      StrToInt(FloatToStr(iCondPag)),
                                                      dVenctoAnt, -1, ModuloImobiliario.Alienacao.iTipoRecCorrecao,
                                                      ModuloImobiliario.Alienacao.iTipoRecJuros,True,False,fSaldoDev)
                  else
                     CtrlOperImob.CalculaAtualSaldo14('', fCorrecaoParc,
                                                      fJuros, StrToInt(FloatToStr(TpCondPag.fIDContratoImovel)),
                                                      StrToInt(FloatToStr(iCondPag)),
                                                      dVenctoAnt, dVencimentoAnt, ModuloImobiliario.Alienacao.iTipoRecCorrecao,
                                                      ModuloImobiliario.Alienacao.iTipoRecJuros,True,False,fSaldoDev);

               end;

               if (bTemAmortiz) then
               begin

                   if qryParcTemp.Locate('IDCONDPAGIMOVEL;DATAVENCIMENTO;FLGTIPOLANC',VarArrayOf([iCondPag,dVencto,11]),[]) then
                   begin
                      while (qryParcTemp.FieldByName('IDCONDPAGIMOVEL').AsInteger = iCondPag) and
                            (qryParcTemp.FieldByName('DATAVENCIMENTO').AsDateTime = dVencto) and
                            (qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 11) do
                      begin
                         qryParcTemp.Delete;
                      end;
                   end;

                   if (dVencto <> dVenctoAnt)  then
                   begin
                      CtrlOperImob.CalculaAtualSaldo14('', fCorrecaoParc,
                                                       fJuros, StrToInt(FloatToStr(TpCondPag.fIDContratoImovel)),
                                                       StrToInt(FloatToStr(iCondPag)),
                                                       dVencto, dVencimentoAnt, ModuloImobiliario.Alienacao.iTipoRecCorrecao,
                                                       ModuloImobiliario.Alienacao.iTipoRecJuros,True,False,fSaldoDevAnt);

                      fSaldoDevAnt := fSaldoDevAnt + fCorrecaoParc + fJuros;

                      qryParcTemp.Append;
                      qryParcTemp.FieldByName('IDPARCFINANCIMOV').asFloat  := LeUltRegistro(nil,'PARCFINANCIMOV');
                      qryParcTemp.FieldByName('IDCONTRATOIMOVEL').asFloat  := TpCondPag.fIDContratoImovel;
                      qryParcTemp.FieldByName('IDCONDPAGIMOVEL').asFloat   := TpCondPag.fIDCondInicial;
                      qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger     := 11;
                      qryParcTemp.FieldByName('NUMPARCELA').AsInteger      := 0;
                      qryParcTemp.FieldByName('FATORCORRECAO').AsFloat     := 1;
                      qryParcTemp.FieldByName('DATAVENCIMENTO').asDateTime := dVencto;
                      qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat   := fSaldoDevAnt;
                      qryParcTemp.FieldByName('VLRJUROS').asFloat          := fJuros;
                      qryParcTemp.FieldByName('VLRCORRSALDO').asFloat      := fCorrecaoParc;
                      qryParcTemp.Post;
                   end;

                   if qryParcTemp.Locate('IDCONDPAGIMOVEL;DATAVENCIMENTO;FLGTIPOLANC',VarArrayOf([iCondPag,dVencto,5]),[]) then
                   begin
                      qryParcTemp.Edit;
                      qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat   := fSaldoDevAnt - fValorAmortiz;
                      qryParcTemp.Post;
                   end;

                   dVencto   := dVencimento;
                   fSaldoDev := fSaldoDevAnt - fValorAmortiz;

                   // Calcula Valor da Prestação
                   iParcRestante := (TpCondPag.iNumParcelas + iParcEncerra - (iParc-iParcCarencia-1));

                   if bViraAno then
                   begin
                      fPrestacao := fPrestacao * fFator;
                   end
                   else
                   if (TpCondPag.fTaxaJuros <> 0) then begin
                      Aux        := Power((1 + TpCondPag.fTaxaJurosAjust), (iParcRestante) );
                      fPrestacao := fSaldoDev * ((TpCondPag.fTaxaJurosAjust * Aux)/(Aux -1));
                   end else begin
                      fPrestacao := fSaldoDev / (iParcRestante);
                   end;
                   fNominal := fPrestacao;
               end
               else
               begin

                  fSaldoDev := fSaldoDev + fCorrecaoParc + fJuros;
                  if dVenctoAnt >= TpCondPag.dDataAssinatura then
                  begin
                     qryParcTemp.Append;
                     qryParcTemp.FieldByName('IDPARCFINANCIMOV').asFloat  := LeUltRegistro(nil,'PARCFINANCIMOV');
                     qryParcTemp.FieldByName('IDCONTRATOIMOVEL').asFloat  := TpCondPag.fIDContratoImovel;
                     qryParcTemp.FieldByName('IDCONDPAGIMOVEL').asFloat   := TpCondPag.fIDCondInicial;
                     qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger     := 11;
                     qryParcTemp.FieldByName('NUMPARCELA').AsInteger      := 0;
                     qryParcTemp.FieldByName('FATORCORRECAO').AsFloat     := 1;
                     qryParcTemp.FieldByName('DATAVENCIMENTO').asDateTime := dVenctoAnt;
                     qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat   := fSaldoDev;
                     qryParcTemp.FieldByName('VLRJUROS').asFloat          := fJuros;
                     qryParcTemp.FieldByName('VLRCORRSALDO').asFloat      := fCorrecaoParc;
                     qryParcTemp.Post;
                  end;
               end;
            end;
            
            CtrlParcFinancImov.BuscaValoresUltimaAtualizacao(StrToInt(FloatToStr(TpCondPag.fIDContratoImovel)),
                                                             StrToInt(FloatToStr(iCondPag)),dVencto,
                                                             fJuros, fCorrecaoParc);

            if (bTeveAntecipao) and ((qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger <> 9)) then
               CtrlParcFinancImov.BuscaValoresUltimaAtualizacao(StrToInt(FloatToStr(TpCondPag.fIDContratoImovel)),
                                                                StrToInt(FloatToStr(iCondPag)),
                                                                qryParcTemp.FieldByName('DATAVENCIMENTO').AsDateTime,
                                                                fJuros, fCorrecaoParc);

            fSaldoDevAntec := fSaldoDev;

            if (fJuros + fCorrecaoParc) = 0 then
            begin
               CtrlOperImob.CalculaAtualSaldo14('', fCorrecaoParc,
                                                fJuros, StrToInt(FloatToStr(TpCondPag.fIDContratoImovel)),
                                                StrToInt(FloatToStr(iCondPag)),
                                                dVencto, dVenctoAnt, ModuloImobiliario.Alienacao.iTipoRecCorrecao,
                                                ModuloImobiliario.Alienacao.iTipoRecJuros,True,False,fSaldoDev);
            end;

            fSaldoDev := fSaldoDev + fCorrecaoParc + fJuros;
            // Fim Marchetti - 21/12/2005

            // Verifica se a Parcela já existe. Se não existir, cria uma.
            if not qryParcTemp.Locate('IDCONDPAGIMOVEL;NUMPARCELA',VarArrayOf([iCondPag,iParc]),[]) then begin
               // Vinicius - 12/01/2006 - Verifica na base se realmente não existe, estava gerando em duplicidade
               sSql := 'SELECT * FROM PARCFINANCIMOV '+#13+
                       ' WHERE IDCONDPAGIMOVEL = ' + FloatToStr(TpCondPag.fIDCondInicial) +#13+
                       '   AND NUMPARCELA = ' + IntToStr(iParc);
               FazQuery(dtmBaseDados.qry, sSql);
               if not dtmBaseDados.qry.IsEmpty then begin
                  MsgDlg('Erro ao gerar a parcela ' + IntToStr(iParc) + ' - duplicidade de lançamento', 'Erro', mtError, [mbok], 0);
                  Abort;
               end else
               begin
                  qryParcTemp.Append;
                  qryParcTemp.FieldByName('IDPARCFINANCIMOV').asFloat := LeUltRegistro(nil,'PARCFINANCIMOV');
                  qryParcTemp.FieldByName('IDCONTRATOIMOVEL').asFloat := TpCondPag.fIDContratoImovel;
                  qryParcTemp.FieldByName('IDCONDPAGIMOVEL').asFloat  := TpCondPag.fIDCondInicial;
                  qryParcTemp.FieldByName('NUMPARCELA').asFloat       := iParc;
                  qryParcTemp.FieldByName('FLGLANCINTEGRA').asInteger := 0;
                  qryParcTemp.FieldByName('CODDOCUMENTO').Clear;
                  qryParcTemp.FieldByName('PLNCODIGO').Clear;
                  qryParcTemp.FieldByName('FLGCONCILIADO').Clear;
               end;
            end
            else
            begin
               qryParcTemp.Edit;
            end;

            // 26/05/2005
            if (qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9) and
               (iTipoLanc <> qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger) then
               bAntecipaProx := True;

            // Zera valores que serão recalculados
            if qryParcTemp.FieldByName('CODDOCUMENTO').IsNull then begin
                qryParcTemp.FieldByName('VLRCORRSALDO').Clear;
                qryParcTemp.FieldByName('VLRPRESTATUALIZADA').Clear;
                qryParcTemp.FieldByName('VLRRESIDUOATUALI').Clear;
            end;

            // Se o calculo for projetado na origem, utiliza o informado no contrato, senão...
            // Calculo do Fator de Correção até a data base pelo real e depois pelo projetado
            // se o mes de vencto da parcela for o mesmo da anterior, mantém o fator da parcela
            // anterior, pois ambas pertencem ao mesmo mês, e não calcula pro-rata.
            fFatorMes := 1;
            bExisteCotacaoMes := True;

            iMesCorrAtu := FormatDateTime('MM',dVencto) + FormatDateTime('YYYY',dVencto);
            if iMesCorrAtu <> iMesCorrAnt then begin
               if dIniFator > dVencto then dIniFator := dVencto;

               // Verifica se a cotação do mes já foi cadastrada
               if TpCondPag.iMesRefReajuste = 0 then begin
                  DecodeDate( dVencto, Ano, Mes, Dia );
               end else begin
                  DecodeDate( DiasUteis.SomaMeses(dVencto, (TpCondPag.iMesRefReajuste * -1) ), Ano, Mes, Dia );
               end;
               with dtmImobiliario.qryCotacoesIntervalo do begin
                  LimpaParametros(dtmimobiliario.qryCotacoesIntervalo);
                  ParamByName('INDICE').AsInteger   := TpCondPag.iIDIndCorr;
                  ParamByName('ANOMESINI').AsString := IntToStrZeroPad(Ano, 4) + IntToStrZeroPad(Mes, 2);
                  Open;
                  bExisteCotacaoMes := not dtmImobiliario.qryCotacoesIntervalo.IsEmpty;
               end;

               if (TpCondPag.dDataVencimento <= dDatabase) and (bExisteCotacaoMes) then begin
                  if TpCondPag.iIDIndCorr > 0 then begin
                     if TpCondPag.iMesRefReajuste = 0 then
                          fFatorMes := dtmFinanciamento.CalculaFatorCorrecao(TpCondPag.iIDIndCorr,
                                                                             dIniFator, dVencto, True)
                     else fFatorMes := dtmFinanciamento.CalculaFatorCorrecao(TpCondPag.iIDIndCorr,
                                                                        DiasUteis.SomaMeses(dIniFator, (TpCondPag.iMesRefReajuste * -1) ),
                                                                        DiasUteis.SomaMeses(dVencto,   (TpCondPag.iMesRefReajuste * -1) ), True);
                  end;
               end else begin
                  if TpCondPag.iIDIndProj > 0 then begin
                     if TpCondPag.iMesRefReajuste = 0 then
                          fFatorMes := dtmFinanciamento.CalculaFatorCorrecao(TpCondPag.iIDIndProj,
                                                                             dIniFator, dVencto, True)
                     else fFatorMes := dtmFinanciamento.CalculaFatorCorrecao(TpCondPag.iIDIndProj,
                                                                        DiasUteis.SomaMeses(dIniFator, (TpCondPag.iMesRefReajuste * -1) ),
                                                                        DiasUteis.SomaMeses(dVencto,   (TpCondPag.iMesRefReajuste * -1) ), True);
                  end else if TpCondPag.fCorrecaoProj > 0 then begin
                     fFatorMes := 1 + TpCondPag.fCorrecaoProj;
                  end;
               end;

               fFator := fFator * fFatorMes;

               iMesCorrAnt := iMesCorrAtu;
            end;

            // verifica o tipo de parcela ( 2 - Sinal, 3 - Parc Gerada, 4 - Parc Projetada
            //                              7 - Venda a Vista, 8 - Caução )
            if TpCondPag.sTipoCondPag = 'S' then begin
               qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 2;
            end;
            if TpCondPag.sTipoCondPag = 'V' then begin
               qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 7;
            end;
            if TpCondPag.sTipoCondPag = 'C' then begin
               qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 8;
            end;

            // Altera o Tipo de Parcela Projetada ou Gerada, apenas se a mesma não foi antecipada
            // e o indice de reajuste já foi cadastrado no global
            if qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger <> 9 then begin
               if (TpCondPag.sTipoCondPag = 'P') or
                  (TpCondPag.sTipoCondPag = 'R') then begin
                  if (TpCondPag.iIDIndCorr = 0) and
                     (TpCondPag.iIDIndProj = 0) then begin
                      qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 3;
                  end else begin
                     iMesHoje := StrToInt(IntToStr(DiasInUteis.ExtraiAno(dDataBase)) + FormatFloat('00',DiasInUteis.ExtraiMes(dDataBase)));
                     iMesVenc := StrToInt(IntToStr(DiasInUteis.ExtraiAno(dVencto))   + FormatFloat('00',DiasInUteis.ExtraiMes(dVencto)));

                     // Só muda o status se existir a cotação do mes de processamento
                     if (iMesVenc <= iMesHoje) and (bExisteCotacaoMes) then begin
                        qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 3;
                     end else begin
                        qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 4;
                     end;
                  end;
               end;
            end;

            // Grava o default para o Saldo devedor atual
            qryParcTemp.FieldByName('VLRSALDOATUAL').AsFloat := ComunsImobiliario.Arredonda(fSaldoDev,2);

            // Altera o saldo devedor atual antes de calcular a parc. para os com correção mensal

            // Efetua o prorata na correção da assinatura para o 1 vencto
            if iParc = 1 then begin
               if TpCondPag.dUltVenctoComposto > 0 then begin
                  if TpCondPag.dUltVenctoComposto <> TpCondPag.dDataVencimento then
                     fFatorMes := ComunsImobiliario.ProRata((fFatorMes-1), TpCondPag.dUltVenctoComposto, TpCondPag.dDataVencimento) + 1;
               end else begin
                  if TpCondPag.dDataAssinatura <> TpCondPag.dDataVencimento then
                     fFatorMes := ComunsImobiliario.ProRata((fFatorMes-1), TpCondPag.dDataAssinatura, TpCondPag.dDataVencimento) + 1;
               end;
            end;
            //BRUNO AZEVEDO SOL 136335
            //fResiduoAcum := (fSaldoDev * fFatorMes) - fSaldoDev;
            fResiduoAcum := 0;
            //BRUNO AZEVEDO SOL 136335

            qryParcTemp.FieldByName('FATORCORRECAO').AsFloat := fFatorMes;
            qryParcTemp.FieldByName('VLRRESIDUO').Clear;
            qryParcTemp.FieldByName('VLRCORRSALDO').asFloat  := fCorrecaoParc;

            // Define a taxa de juros a ser aplicada, APENAS SE A PRÓXIMA PARCELA NÃO FOR ANTECIPADA
            if bAntecipaProx then begin
               fTaxaJuros := 0;
            end else begin
               // Calcula a Taxa de Juros Pro-Rata para a primeira parcela
               DecodeDate(dVencto, iAno, iMes, iDia);

               if (dVencto <> DiasUteis.UltDiaMes(iAno, iMes)) or ((iParc = 1) and

                  (DiasUteis.ExtraiDia(TpCondPag.dDataAssinatura) <> DiasUteis.ExtraiDia(TpCondPag.dDataVencimento)) and
                  ( (TpCondPag.bJurosCarencia) or ((TpCondPag.iFormaCalculo <> 8) and (TpCondPag.iFormaCalculo <> 12)) )) then begin
                  fTaxaJuros := ComunsImobiliario.ProRata(TpCondPag.fTaxaJurosAjust,
                                                          TpCondPag.dDataAssinatura,
                                                          TpCondPag.dDataVencimento,
                                                          TpCondPag.iPeriodoMeses);
               end else begin
                  fTaxaJuros := TpCondPag.fTaxaJurosAjust;
               end;

               // Calcula a Taxa de Juros Pro-Rata para parcelas antecipadas e
               //   proxima parcela pós antecipação
               if ((qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9) and
                   (qryParcTemp.FieldByName('DATAVENCIMENTO').AsDateTime <> dVenctoAnt)) or
                   (bAntecipaAnt) then begin
                   if qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9 then begin
                      fTaxaJuros := ComunsImobiliario.ProRata(TpCondPag.fTaxaJurosAjust,
                                                              dVenctoAnt,
                                                              qryParcTemp.FieldByName('DATAVENCIMENTO').AsDateTime,
                                                              TpCondPag.iPeriodoMeses);
                   end else begin
                      fTaxaJuros := ComunsImobiliario.ProRata(TpCondPag.fTaxaJurosAjust,
                                                              dVenctoAnt,
                                                              dVencto,
                                                              TpCondPag.iPeriodoMeses);
                   end;
               end;

               fTaxaJurosAcum := ((fTaxaJurosAcum + 1) * (fTaxaJuros + 1)) -1;

               // VINICIUS - ACERTO FUNCEF - CONTRATO MAGNOLIA
               if (TpCondPag.iNumParcelas <> TpCondPagAnt.iNumParcelas) and
                  (iCondPag = 1864) and (iParc > 16) then fTaxaJurosAcum := 0;

            end;

            // Grava os valores da parcela (valor, vencto, juros, amortizacao e saldo devedor)
            // SOMENTE PARA AS PARCELAS AINDA NAO INTEGRADAS
            if qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9 then begin
               // Se a anterior também foi antecipada, mantem o saldo devedor da anterior
               //    para efeito de calculo do juros por antecipação
               if not bAntecipaProx then fSaldoDevAntec := fSaldoDev;

               // Calcula o juros pró-rata por antecipação
               fVlrJurosAntec := CalcAntecipacao(TpCondPag.iFormaCalculo,iCondPag,iParc,
                                                 qryParcTemp.FieldByName('DATAVENCIMENTO').AsDateTime, dVenctoAnt,
                                                 fSaldoDevAntec, fPrestacao, (fSaldoDev * TpCondPag.fTaxaJurosAjust),
                                                 fTaxaJuros, bAntecipaProx);
               dVencto := qryParcTemp.FieldByName('DATAVENCIMENTO').asDateTime;
            end else begin
               qryParcTemp.FieldByName('DATAVENCIMENTO').asDateTime := dVencto;
            end;

            qryParcTemp.FieldByName('VLRJUROS').asFloat := fJuros;

            // Registra o valor da prestação, amortização e saldo devedor amortizado
            qryParcTemp.FieldByName('VLRNOMINAL').asFloat       := ComunsImobiliario.Arredonda(fPrestacao,2);

            // // Marchetti - Pendencia 22447
            if qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9 then
            begin
               qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat   := ComunsImobiliario.Arredonda(fPrestacao - (fSaldoDevAntec * TpCondPag.fTaxaJurosAjust),2);

               qryParcTemp.FieldByName('VLRCORRSALDO').Clear;
               qryParcTemp.FieldByName('VLRJUROS').Clear;
               if fVlrJurosAntec > 0 then
               begin
                  qryParcTemp.FieldByName('VLRJUROS').asFloat      := fVlrJurosAntec;

                  CtrlOperImob.CalculaAtualSaldo14('', fCorrecaoParc,
                                                   fJuros, StrToInt(FloatToStr(TpCondPag.fIDContratoImovel)),
                                                   StrToInt(FloatToStr(iCondPag)),
                                                   dVencto, dVenctoAnt, ModuloImobiliario.Alienacao.iTipoRecCorrecao,
                                                   ModuloImobiliario.Alienacao.iTipoRecJuros,True,False,fSaldoDev);

                  qryParcTemp.FieldByName('VLRCORRSALDO').asFloat  := fCorrecaoParc;
               end;
            end
            else
            begin
// Marchetti - 18/07/2006
// conforme orientação da Marcia (CBS) o valor da amortização deve ser calculado da seguinte forma:
// Valor Nominal - Juros - Correção
               qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat   := ComunsImobiliario.Arredonda(fPrestacao - qryParcTemp.FieldByName('VLRJUROS').asFloat - qryParcTemp.FieldByName('VLRCORRSALDO').asFloat ,2);
            end;

            if qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9 then   // antecipação
            begin
               qryParcTemp.FieldByName('VLRPRESTACAO').asFloat     := qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat + fVlrJurosAntec;
               qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat  := ComunsImobiliario.Arredonda(fSaldoDevAntec - qryParcTemp.FieldByName('VLRPRESTACAO').asFloat,2);
               qryParcTemp.FieldByName('VLRSALDOATUAL').AsFloat    := ComunsImobiliario.Arredonda(fSaldoDevAntec + (fSaldoDevAntec * TpCondPag.fTaxaJurosAjust),2);
            end
            else
            begin
               qryParcTemp.FieldByName('VLRPRESTACAO').asFloat     := ComunsImobiliario.Arredonda(fPrestacao,2);
               qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat  := ComunsImobiliario.Arredonda(fSaldoDev - qryParcTemp.FieldByName('VLRPRESTACAO').asFloat,2);
               qryParcTemp.FieldByName('VLRSALDOATUAL').AsFloat    := ComunsImobiliario.Arredonda(fSaldoDev,2);
            end;
            if qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat < 0.5 then
            begin
               qryParcTemp.FieldByName('VLRJUROS').asFloat       := ComunsImobiliario.Arredonda(fJuros + Abs(qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat),2);
               qryParcTemp.FieldByName('VLRSALDOATUAL').AsFloat  := ComunsImobiliario.Arredonda(fSaldoDevAntec + qryParcTemp.FieldByName('VLRJUROS').asFloat,2);

               qryParcTemp.FieldByName('VLRPRESTACAO').asFloat   := qryParcTemp.FieldByName('VLRSALDOATUAL').AsFloat;
               qryParcTemp.FieldByName('VLRNOMINAL').asFloat     := qryParcTemp.FieldByName('VLRSALDOATUAL').AsFloat;
               qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat := ComunsImobiliario.Arredonda(qryParcTemp.FieldByName('VLRPRESTACAO').asFloat - qryParcTemp.FieldByName('VLRJUROS').asFloat,2);
            end;

            // Ajusta o saldo devedor final
            if qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat < 0.5 then begin
               qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat := 0;
            end;

            qryParcTemp.FieldByName('FATORCORRECAO').AsFloat := fFatorMes;

            // grava o ID do indice de correção na parcela
            if qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger in [3,9] then begin
               if TpCondPag.iIDIndCorr = 0 then begin
                  qryParcTemp.FieldByName('IDINDCORRECAO').Clear;
               end else begin
                  qryParcTemp.FieldByName('IDINDCORRECAO').AsInteger := TpCondPag.iIDIndCorr;
               end;
            end else begin
               if TpCondPag.iIDIndProj = 0 then begin
                  qryParcTemp.FieldByName('IDINDCORRECAO').Clear;
               end else begin
                  qryParcTemp.FieldByName('IDINDCORRECAO').AsInteger := TpCondPag.iIDIndProj;
               end;
            end;

            fSaldoDev      := qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat;
            Result         := Result + qryParcTemp.FieldByName('VLRPRESTACAO').asFloat;
            dVencimentoAnt := dVencto;
            qryParcTemp.Post;

         end;

         // Incrementa a parcela de juros cobrada no período de Carencia
         if (TpCondPag.bJurosCarencia) and (dVencto < TpCondPag.dDataIniAmortiz) then
            Inc(iParcCarencia);

         FrmAguarde.Pos := prg;
         Application.ProcessMessages;
         Inc(Prg);

         // Testa se a parcela corrente foi Antecipada e a proxima será antecipada para ajuste do prox. vencto.
         if (qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9) and (bAntecipaProx) then
              bAntecipa := True
         else bAntecipa := False;

         // Testa se a parcela corrente foi Antecipada
         if (qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9) then
              bAntecipaAnt := True
         else bAntecipaAnt := False;

         // // Marchetti - Pendencia 22447
         iTipoLanc := qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger;

         iMeses := DiasUteis.IntervaloMeses(dVenctoVira,dVencto);

         if (iMeses >= (TpCondPag.iPeriodoReajuste-1)) or (TpCondPag.sPrazo = 'A') or
            ( (TpCondPag.iPeriodo > 1) and (iMeses + TpCondPag.iPeriodo > (TpCondPag.iPeriodoReajuste-1)) ) then begin
            bViraAno := True;
            iParcFim := iParc;
         end else begin
            bViraAno := False;
         end;

         // Inicia nova condição repactuada após o término das parcelas da cond. inicial
         if iParc = (TpCondPag.iNumParcelas + iParcCarencia + iParcExtra) then begin
            with dtmFinanciamento do begin
               sSql := 'SELECT *  '+#13+
                       '  FROM CONDPAGIMOVEL  '+#13+
                       ' WHERE IDCONDINICIAL = ' + FloatToStr(TpCondPag.fIDCondInicial) +#13+
                       '   AND TIPOCONDPAG = ''R''  '+#13+
                       '   AND DATAINI > TO_DATE('+ QuotedStr(FormatDateTime('DD/MM/YYYY',dVencto))+',''DD/MM/YYYY'') ' +#13+
                       ' ORDER BY DATAINI ';
               if FazQuery(qryAux, sSql) then begin
                  if not qryAux.IsEmpty then begin
                     // Determina o nr. de parcelas extras e a nova data de vencimento
                     if TpCondPag.sPrazo = 'M' then
                          dVencto := DiasInUteis.SomaMeses(qryAux.FieldByName('DATAVENCIMENTO').AsDateTime,TpCondPag.iPeriodo *  -1)
                     else dVencto := DiasInUteis.SomaMeses(qryAux.FieldByName('DATAVENCIMENTO').AsDateTime,TpCondPag.iPeriodo * -12);

                     // Verifica o novo saldo devedor
                     if qryAux.FieldByName('VLRFINANC').AsInteger > 0 then
                        fSaldoDev := qryAux.FieldByName('VLRFINANC').AsFloat;

                     iParcExtra   := iParcExtra + qryAux.FieldByName('NUMPARCELAS').AsInteger;
                     iParcEncerra := iParcEncerra + TpCondPag.iNumParcelas;
                  end;
               end;
            end;
         end;

      end;
   finally;

      qryParcTemp.First;
      while not qryParcTemp.eof do
      begin
         if (qryParcTemp.FieldByName('IDCONDPAGIMOVEL').AsInteger = iCondPag) and
            (qryParcTemp.FieldByName('DATAVENCIMENTO').AsDateTime > dVencto) and
            (qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 11) then
            qryParcTemp.Delete
         else
            qryParcTemp.Next;
      end;

      iParc         := 0;
      iParcRestante := 1;

      if (TpCondPag.iNumParcelas - iNumParcelas) > 0 then
      begin
         repeat;
            if qryParcTemp.Locate('IDCONDPAGIMOVEL;NUMPARCELA',VarArrayOf([iCondPag,TpCondPag.iNumParcelas-iParc]),[]) then
            begin
               qryParcTemp.Delete;
            end;
            inc(iParcRestante);
            inc(iParc);
         until
            iParcRestante > (TpCondPag.iNumParcelas - iNumParcelas);
      end;

      qryParcTemp.EnableControls;

      FreeAndNil(ComunsImobiliarioDB);
      FreeAndNil(CtrlOperImob);
      FreeAndNil(CtrlParcFinancImov);

      FrmAguarde.Apaga;
   end;
   qryParcTemp.First;
end;



function TFuncAlienacao.CalculaTipoCalculo16(iCondPag: Double; dVenctoIni, dDataBase: TDateTime; qryParcTemp: TwwQuery): Double;
var
   bCondPagNova  : Boolean;        // Indica se encontrou uma repactuação nova
   TpCondPag     : TCondPag;       // Dados da Condição de Pagamento
   TpCondPagAnt  : TCondPag;       // Dados da Condição de Pagamento antes de checar repactuação
   iParc         : Integer;        // Número da Parcela
   iParcRestante : Integer;        // Número de Parcelas Restantes
   iParcCarencia : Integer;        // Parcelas de Juros cobradas durante a carencia
   fSaldoDev     : Double;         // Valor do Saldo devedor
   fPrestacao    : Double;         // Valor da Prestação
   fNominal      : Double;         // Valor Nominal da Prestação
   fFator        : Double;         // Fator de Correção das parcelas ( real * projetado )
   fFatorMes     : Double;         // Fator de Correção do Mes da Parcela
   dIniFator     : TDateTime;      // Data de início para busca do Fator de Correção
   dFimFator     : TDateTime;      // Data de Término para busca do Fator de Correção
   iMesHoje      : Integer;        // Mes Atual para verificar o tipo de parcela
   iMesVenc      : Integer;        // Mes de Vencimento para verificar o tipo de parcela
   bTemAmortiz   : Boolean;        // Indica se houve Amortização Extra
   rSaldoAmortiz : Double;         // Saldo Após a Amortização Extra
   rPercAmortiz  : Double;         // Percentual de Amortização Extra
   fResiduoAcum  : Double;         // Resíduo Acumulado para acréscimo no saldo devedor
   Aux           : Double;         // Auxiliar para calculo da prestacao
   dVencto       : TDateTime;      // Data de Vencimento da Parcela
   dVenctoVira   : TDateTime;      // Data de Vencimento na virada do período
   dVenctoAnt    : TDateTime;      // Data de Vencimento da ultima parcela antes da antecipação
   dDataBusca    : TDateTime;      // Data auxiliar para busca da nova condição
   dIniJuros     : TDateTime;
   dReajAnual    : TDateTime;
   ano,mes,dia   : Word;           // Aux para verificar amortização extra
   bViraAno      : Boolean;        // Indica se completou 12 parcelas para virada do ano
   iParcIni      : Integer;        // Parcela inicial para calculo do residuo acumulado
   iParcFim      : Integer;        // Parcela final para calculo do resíduo acumulado
   bAntecipa     : Boolean;        // Se a Parcela anterior foi Antecipada e a Proxima também será antecipada
   bAntecipaProx : Boolean;        // Se a Próxima parcela tanbém foi antecipada
   bAntecipaAnt  : Boolean;        // Se a Parcela anterior foi Antecipada
   prg           : Integer;        // Somente indicador da progress bar
   fVlrJurosAntec: Extended;
   fSaldoDevAntec: Extended;
   fTaxaJuros    : Extended;
   fTaxaJurosAcum: Extended;
   iDiaVencto    : Integer;
   iMesVencto    : Integer;
   iDiaNovo      : Word;
   iMesNovo      : Word;
   iAnoNovo      : Word;
   iMeses        : Integer;
   iMesCorrAnt   : String;        // Mes de correção da parcela anterior para verificar se busca novo fator
   iMesCorrAtu   : String;
   fAmortizacao  : Extended;
   fCorrecaoSld  : Extended;      // Correção Monetária do Saldo Devedor
   fCorrecaoParc : Extended;
   bExisteCotacaoMes : Boolean;   // Existe cotação cadastrada para o mes de competencia
   sSql : String;
   iParcExtra    : Integer;
   iParcEncerra  : Integer;
   ComunsImobiliarioDB : TComunsImobiliarioDB;

   fValorAmortiz : Double;
begin
   // inicializa variaveis
   Result        := 0;
   prg           := 0;
   iParc         := 0;
   iParcRestante := 0;
   iParcEncerra  := 0;
   iParcCarencia := 0;
   iParcExtra    := 0;
   fSaldoDev     := 0;
   fPrestacao    := 0;
   fNominal      := 0;
   fFator        := 1;
   fFatorMes     := 1;
   dIniFator     := Date;
   dFimFator     := Date;
   fResiduoAcum  := 0;
   Aux           := 0;
   dVencto       := Date;
   dVenctoAnt    := Date;
   dVenctoVira   := Date;
   bViraAno      := False;
   iParcIni      := 1;
   iParcFim      := 0;
   bAntecipa     := False;
   bAntecipaProx := False;
   bAntecipaAnt  := False;
   iDiaVencto    := 0;
   iMesVencto    := 0;
   iDiaNovo      := 0;
   iMesNovo      := 0;
   iAnoNovo      := 0;
   iMeses        := 0;
   iMesCorrAtu   := '';
   iMesCorrAnt   := '';
   fVlrJurosAntec:= 0;
   fSaldoDevAntec:= 0;
   fTaxaJuros    := 0;
   fTaxaJurosAcum:= 0;
   fAmortizacao  := 0;
   fCorrecaoSld  := 0;
   fCorrecaoParc := 0;
   bExisteCotacaoMes := True;

   // Verifica a condição de pagamento no Vencimento inicial
   DecodeDate(dVenctoIni, ano, mes, dia);
   if not FuncAlienacao.BuscaCondPag(iCondPag, mes, ano, False, TpCondPag, True) then begin
      MsgDlg('Erro na busca das condições de pagamento','Erro ',mtError,[mbOK],0);
      Abort;
   end;

   // Faz as devidas inicializações
   ComunsImobiliarioDB := TComunsImobiliarioDB.Create(Sistema.IDEmpresa, Sistema.IDModulo, Sistema.IDUsuario, sistema.IDEspAcesso, Sistema.UsaPlanoPatro);
   ComunsImobiliarioDB.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                                   Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                                   ComunsImobiliario.MensErroMT);

   FrmAguarde.Min := 0;
   FrmAguarde.Max := TpCondPag.iNumParcelas;
   FrmAguarde.Pos := Prg;
   FrmAguarde.Mostra('Aguarde, Gerando Parcelas...');
   Application.ProcessMessages;

   // Se a query das parcelas estiver aberta, mantém aberta para somente alterar os valores
   // que possivelmente forem recalculados, senão, abre para incluir as parcelas novas.
   if qryParcTemp.Active = False then qryParcTemp.Active := True;


   // Apaga os Registros de Saldo Inicial
   with qryParcTemp do begin
      First;

      while not eof do begin
         if (qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 1) and
            (qryParcTemp.FieldByName('IDCONDPAGIMOVEL').AsInteger = iCondPag) then
              Delete
         else Next;
      end;
      First;
   end;

   // define saldo devedor e vencto da primeira parcela
   fSaldoDev      := TpCondPag.fSaldoDev;
   dVenctoAnt     := TpCondPag.dDataVencimento;
   dVencto        := TpCondPag.dDataVencimento;
   dFimFator      := TpCondPag.dDataAssinatura;
   dReajAnual     := TpCondPag.dDataAssinatura;
   iDiaVencto     := DiasUteis.ExtraiDia(dVencto);
   iMesVencto     := DiasUteis.ExtraiMes(dVencto);
   bCondPagNova   := False;
   TpCondPagAnt   := TpCondPag;

   qryParcTemp.DisableControls;
   try
      while iParc < (TpCondPag.iNumParcelas + iParcCarencia + iParcExtra) do begin
         iParc := iParc + 1;

         fCorrecaoSld := 0;

         // Busca as codições de pagamento para a próxima parcela

         if iParc > 1 then begin
            // Guarda a condição anterior para verificar alterações
            TpCondPagAnt := TpCondPag;

            // busca a condição de pagamento vigente no próximo mes de vencimento
            if TpCondPag.sPrazo = 'M' then
                 DecodeDate(DiasInUteis.SomaMeses(dVencto,TpCondPag.iPeriodo), ano, mes, dia)
            else DecodeDate(DiasInUteis.SomaMeses(dVencto,TpCondPag.iPeriodo*12), ano, mes, dia);

            if not FuncAlienacao.BuscaCondPag(iCondPag, mes, ano, False, TpCondPag) then
               TpCondPag := TpCondPagAnt;

            if TpCondPagAnt.fIDCondPagImovel <> TpCondPag.fIDCondPagImovel then begin
               bCondPagNova := True;
            end else begin
               bCondPagNova := False;
            end;
         end;

         // Se houve repactuação com alteração de juros, num. parcelas, tipo de reajuste,
         // correção, saldo devedor.
         // Força a Virada de ano, para recalculo das parcelas.
         if (bCondPagNova = True) then begin
            if (TpCondPagAnt.iNumParcelas   <> TpCondPag.iNumParcelas)   or
               (TpCondPagAnt.iPeriodo       <> TpCondPag.iPeriodo)       or
               (TpCondPagAnt.sPrazo         <> TpCondPag.sPrazo)         or
               (TpCondPagAnt.fTaxaJuros     <> TpCondPag.fTaxaJuros)     or
               (TpCondPagAnt.sPeriodoTaxa   <> TpCondPag.sPeriodoTaxa)   or
               (TpCondPagAnt.iFormaCalculo  <> TpCondPag.iFormaCalculo)  or
               (TpCondPag.fSaldoDev > 0) then begin
               bViraAno := True;
               iParcFim := iParc - 1;
            end;
         end;

         // Calcula Valor da Prestação
         if (bViraAno = True) or (iParc = 1) then begin
            iParcRestante := (TpCondPag.iNumParcelas + iParcEncerra - (iParc-iParcCarencia-1));

            // Quando não gera Parcelas de Juros no período de carência,
            // Capitaliza o juros no período de carência para incorporar ao saldo devedor
            // antes de calcular o valor da parcela
            if (iParc = 1) or (bCondPagNova = True) then begin
               if iParc = 1 then
                    dIniJuros := TpCondPag.dDataAssinatura
               else dIniJuros := dVencto;
               fTaxaJuros := ComunsImobiliario.ProRata(TpCondPag.fTaxaJurosAjust,
                                                       dIniJuros,
                                                       DiasUteis.SomaMeses(TpCondPag.dDataVencimento, -1),
                                                       TpCondPag.iPeriodoMeses);

               if (not TpCondPag.bJurosCarencia) and (fTaxaJuros > 0) then begin
                  fSaldoDev := ComunsImobiliario.Arredonda( fSaldoDev * (fTaxaJuros + 1), 2);
               end;
            end;

            fFator       := 1;
            iParcIni     := iParc;
            if iParcRestante > 0 then
                 fPrestacao := ComunsImobiliario.Arredonda( fSaldoDev / iParcRestante, 2)
            else fPrestacao := 0;
            fAmortizacao := fPrestacao;

            fNominal := fPrestacao;
         end;

         // Efetua todas as gravações apenas se o valor da prestação for > 0
         if fPrestacao > 0 then begin

            dIniFator  := DiasUteis.SomaMeses(dVencto, 1);
            if bCondPagNova = True then begin
               dVenctoAnt  := dVencto;
               dVencto     := TpCondPag.dDataVencimento;
               iDiaVencto  := DiasUteis.ExtraiDia(dVencto);
               iMesVencto  := DiasUteis.ExtraiMes(dVencto);
               if bViraAno then dVenctoVira := dVencto;
            end else begin
               if iParc = 1 then begin
                  dVencto     := TpCondPag.dDataVencimento;
                  dVenctoAnt  := TpCondPag.dDataAssinatura;
                  iDiaVencto  := DiasUteis.ExtraiDia(dVencto);
                  iMesVencto  := DiasUteis.ExtraiMes(dVencto);
                  dVenctoVira := TpCondPag.dDataAssinatura;

               end else begin

                  // Se não houve antecipação de parcelas, altera a data do prox. vencimento
                  if not bAntecipa then begin
                     dVenctoAnt := dVencto;

                     // Ajusta o dia do vencimento para o estipulado no contrato, pois o ultimo
                     // vencimento pode ter sido alterado na antecipação
                     DecodeDate(dVencto, iAnoNovo,iMesNovo,iDiaNovo);
                     if iDiaNovo <> iDiaVencto then begin
                        try
                           dVencto := EncodeDate(iAnoNovo,iMesNovo,iDiaVencto);
                        except
                           dVencto := DiasUteis.UltDiaMes(iAnoNovo,iMesNovo);
                        end;
                     end;

                     // Ajusta ultimo dia do mes
                     iDiaNovo := DiasUteis.ExtraiDia(dVencto);
                     iMesNovo := DiasUteis.ExtraiMes(dVencto);
                     if iDiaNovo < iDiaVencto then begin
                        while iDiaNovo < iDiaVencto do begin
                           dVencto := DiasUteis.SomaDias(dVencto, 1);
                           if iMesNovo <> DiasUteis.ExtraiMes(dVencto) then begin
                              dVencto := DiasUteis.SomaDias(dVencto, -1);
                              Break;
                           end;
                           iDiaNovo := DiasUteis.ExtraiDia(dVencto);
                        end;
                     end;
                  end;
                end;
            end;
            if bViraAno then dVenctoVira := dVencto;

            // Grava Registro de Saldo Inicial antes de fazer a Amortização
            if (bViraAno = True) or (iParc = 1) then begin
               if not qryParcTemp.Locate('IDCONDPAGIMOVEL;FLGTIPOLANC;DATAVENCIMENTO',VarArrayOf([iCondPag,1,dVencto]),[]) then begin
                  qryParcTemp.Insert;
                  qryParcTemp.FieldByName('IDPARCFINANCIMOV').asFloat  := LeUltRegistro(nil,'PARCFINANCIMOV');
                  qryParcTemp.FieldByName('IDCONTRATOIMOVEL').asFloat  := TpCondPag.fIDContratoImovel;
                  qryParcTemp.FieldByName('IDCONDPAGIMOVEL').asFloat   := TpCondPag.fIDCondInicial;
                  qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger     := 1;
                  qryParcTemp.FieldByName('NUMPARCELA').AsInteger      := 0;
                  qryParcTemp.FieldByName('FATORCORRECAO').AsFloat     := 1;
               end else begin
                  qryParcTemp.Edit;
               end;
               if iParc = 1 then begin
                  qryParcTemp.FieldByName('DATAVENCIMENTO').asDateTime := TpCondPag.dDataAssinatura;
                  qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat   := TpCondPag.fSaldoDev;
               end else begin
                  qryParcTemp.FieldByName('DATAVENCIMENTO').asDateTime := dVencto;
                  qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat   := fSaldoDev;
               end;

               qryParcTemp.Post;
            end;

            // Verifica se a Parcela já existe. Se não existir, cria uma.
            if not qryParcTemp.Locate('IDCONDPAGIMOVEL;NUMPARCELA',VarArrayOf([iCondPag,iParc]),[]) then begin
               // Vinicius - 12/01/2006 - Verifica na base se realmente não existe, estava gerando em duplicidade
               sSql := 'SELECT * FROM PARCFINANCIMOV '+#13+
                       ' WHERE IDCONDPAGIMOVEL = ' + FloatToStr(TpCondPag.fIDCondInicial) +#13+
                       '   AND NUMPARCELA = ' + IntToStr(iParc);
               FazQuery(dtmBaseDados.qry, sSql);
               if not dtmBaseDados.qry.IsEmpty then begin
                  MsgDlg('Erro ao gerar a parcela ' + IntToStr(iParc) + ' - duplicidade de lançamento', 'Erro', mtError, [mbok], 0);
                  Abort;
               end else begin
                  qryParcTemp.Append;
                  qryParcTemp.FieldByName('IDPARCFINANCIMOV').asFloat := LeUltRegistro(nil,'PARCFINANCIMOV');
                  qryParcTemp.FieldByName('IDCONTRATOIMOVEL').asFloat := TpCondPag.fIDContratoImovel;
                  qryParcTemp.FieldByName('IDCONDPAGIMOVEL').asFloat  := TpCondPag.fIDCondInicial;
                  qryParcTemp.FieldByName('NUMPARCELA').asFloat       := iParc;
                  qryParcTemp.FieldByName('FLGLANCINTEGRA').asInteger := 0;
                  qryParcTemp.FieldByName('CODDOCUMENTO').Clear;
                  qryParcTemp.FieldByName('PLNCODIGO').Clear;
                  qryParcTemp.FieldByName('FLGCONCILIADO').Clear;
               end;
            end else begin
               qryParcTemp.Edit;
            end;
            // Zera valores que serão recalculados
            if qryParcTemp.FieldByName('CODDOCUMENTO').IsNull then begin
                qryParcTemp.FieldByName('VLRCORRSALDO').Clear;
                qryParcTemp.FieldByName('VLRPRESTATUALIZADA').Clear;
                qryParcTemp.FieldByName('VLRRESIDUOATUALI').Clear;
            end;

            // Se o calculo for projetado na origem, utiliza o informado no contrato, senão...
            // Calculo do Fator de Correção até a data base pelo real e depois pelo projetado
            // se o mes de vencto da parcela for o mesmo da anterior, mantém o fator da parcela
            // anterior, pois ambas pertencem ao mesmo mês, e não calcula pro-rata.
            fFatorMes := 1;
            bExisteCotacaoMes := True;

            iMesCorrAtu := FormatDateTime('MM',dVencto) + FormatDateTime('YYYY',dVencto);
            if (iMesCorrAtu <> iMesCorrAnt) or (TpCondPag.iPeriodoReajuste = 1) then begin
               if dIniFator > dVencto then dIniFator := dVencto;

               // Verifica se a cotação do mes já foi cadastrada
               if TpCondPag.iMesRefReajuste = 0 then begin
                  DecodeDate( dVencto, Ano, Mes, Dia );
               end else begin
                  DecodeDate( DiasUteis.SomaMeses(dVencto, (TpCondPag.iMesRefReajuste * -1) ), Ano, Mes, Dia );
               end;
               with dtmImobiliario.qryCotacoesIntervalo do begin
                  LimpaParametros(dtmimobiliario.qryCotacoesIntervalo);
                  ParamByName('INDICE').AsInteger   := TpCondPag.iIDIndCorr;
                  ParamByName('ANOMESINI').AsString := IntToStrZeroPad(Ano, 4) + IntToStrZeroPad(Mes, 2);
                  Open;
                  bExisteCotacaoMes := not dtmImobiliario.qryCotacoesIntervalo.IsEmpty;
               end;

               if (TpCondPag.dDataVencimento <= dDatabase) and (bExisteCotacaoMes) then begin
                  if TpCondPag.iIDIndCorr > 0 then begin
                     if TpCondPag.iMesRefReajuste = 0 then
                          fFatorMes := dtmFinanciamento.CalculaFatorCorrecao(TpCondPag.iIDIndCorr,
                                                                             dIniFator, dVencto, True)
                     else fFatorMes := dtmFinanciamento.CalculaFatorCorrecao(TpCondPag.iIDIndCorr,
                                                                        DiasUteis.SomaMeses(dIniFator, (TpCondPag.iMesRefReajuste * -1) ),
                                                                        DiasUteis.SomaMeses(dVencto,   (TpCondPag.iMesRefReajuste * -1) ), True);
                  end;
               end else begin
                  if TpCondPag.iIDIndProj > 0 then begin
                     if TpCondPag.iMesRefReajuste = 0 then
                          fFatorMes := dtmFinanciamento.CalculaFatorCorrecao(TpCondPag.iIDIndProj,
                                                                             dIniFator, dVencto, True)
                     else fFatorMes := dtmFinanciamento.CalculaFatorCorrecao(TpCondPag.iIDIndProj,
                                                                        DiasUteis.SomaMeses(dIniFator, (TpCondPag.iMesRefReajuste * -1) ),
                                                                        DiasUteis.SomaMeses(dVencto,   (TpCondPag.iMesRefReajuste * -1) ), True);
                  end else if TpCondPag.fCorrecaoProj > 0 then begin
                     fFatorMes := 1 + TpCondPag.fCorrecaoProj;
                  end;
               end;

               fFator := fFator * fFatorMes;
               iMesCorrAnt := iMesCorrAtu;
            end;

            // verifica o tipo de parcela ( 2 - Sinal, 3 - Parc Gerada, 4 - Parc Projetada
            //                              7 - Venda a Vista, 8 - Caução )
            if TpCondPag.sTipoCondPag = 'S' then begin
               qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 2;
            end;
            if TpCondPag.sTipoCondPag = 'V' then begin
               qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 7;
            end;
            if TpCondPag.sTipoCondPag = 'C' then begin
               qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 8;
            end;

            // Altera o Tipo de Parcela Projetada ou Gerada, apenas se a mesma não foi antecipada
            // e o indice de reajuste já foi cadastrado no global
            if qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger <> 9 then begin
               if (TpCondPag.sTipoCondPag = 'P') or
                  (TpCondPag.sTipoCondPag = 'R') then begin
                  if (TpCondPag.iIDIndCorr = 0) and
                     (TpCondPag.iIDIndProj = 0) then begin
                      qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 3;
                  end else begin
                     iMesHoje := StrToInt(IntToStr(DiasInUteis.ExtraiAno(dDataBase)) + FormatFloat('00',DiasInUteis.ExtraiMes(dDataBase)));
                     iMesVenc := StrToInt(IntToStr(DiasInUteis.ExtraiAno(dVencto))   + FormatFloat('00',DiasInUteis.ExtraiMes(dVencto)));

                     // Só muda o status se existir a cotação do mes de processamento
                     if (iMesVenc <= iMesHoje) and (bExisteCotacaoMes) then begin
                        qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 3;
                     end else begin
                        qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 4;
                     end;
                  end;
               end;
            end;

            // Grava o default para o Saldo devedor atual
            if qryParcTemp.FieldByName('CODDOCUMENTO').IsNull then begin
               if iParc = 1 then
                  qryParcTemp.FieldByName('VLRSALDOATUAL').AsFloat := TpCondPag.fSaldoDev
               else
                  qryParcTemp.FieldByName('VLRSALDOATUAL').AsFloat := fSaldoDev;
            end;

            // Define a taxa de juros a ser aplicada, APENAS SE A PRÓXIMA PARCELA NÃO FOR ANTECIPADA
            if bAntecipaProx then begin
               fTaxaJuros := 0;
            end else begin
               // Calcula a Taxa de Juros Pro-Rata para a primeira parcela, exceto
               // para SAC - que já foi calculado na definição da parcela quando
               // incorporado ao saldo devedor
              {if (iParc = 1) and
                  (DiasUteis.ExtraiDia(TpCondPag.dDataAssinatura) <> DiasUteis.ExtraiDia(TpCondPag.dDataVencimento)) and
                  ( (TpCondPag.bJurosCarencia) or ((TpCondPag.iFormaCalculo <> 8) and (TpCondPag.iFormaCalculo <> 12)) ) then begin}
               //Helen - SOL : 172911 KTN : 1558916 - Retirado - or ((TpCondPag.iFormaCalculo <> 8) and (TpCondPag.iFormaCalculo <> 12))
               if (iParc = 1) and
                  (DiasUteis.ExtraiDia(TpCondPag.dDataAssinatura) <> DiasUteis.ExtraiDia(TpCondPag.dDataVencimento)) and
                  (TpCondPag.bJurosCarencia) then begin              
                  fTaxaJuros := ComunsImobiliario.ProRata(TpCondPag.fTaxaJurosAjust,
                                                          TpCondPag.dDataAssinatura,
                                                          TpCondPag.dDataVencimento,
                                                          TpCondPag.iPeriodoMeses);
               end else begin
                  fTaxaJuros := TpCondPag.fTaxaJurosAjust;
               end;

               // Calcula a Taxa de Juros Pro-Rata para parcelas antecipadas e
               //   proxima parcela pós antecipação
               if ((qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9) and
                   (qryParcTemp.FieldByName('DATAVENCIMENTO').AsDateTime <> dVenctoAnt)) or
                   ((bAntecipaAnt) and (qryParcTemp.FieldByName('DATAVENCIMENTO').AsDateTime <> dVenctoAnt)) then begin   // edilaine.ferraresi - SOL 221141 / KTN 2053650
                   if qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9 then begin
                      fTaxaJuros := ComunsImobiliario.ProRata(TpCondPag.fTaxaJurosAjust,
                                                              dVenctoAnt,
                                                              qryParcTemp.FieldByName('DATAVENCIMENTO').AsDateTime,
                                                              TpCondPag.iPeriodoMeses);
                   end else begin
                      fTaxaJuros := ComunsImobiliario.ProRata(TpCondPag.fTaxaJurosAjust,
                                                              dVenctoAnt,
                                                              dVencto,
                                                              TpCondPag.iPeriodoMeses);
                   end;
               end;

               fTaxaJurosAcum := ((fTaxaJurosAcum + 1) * (fTaxaJuros + 1)) -1;

            end;

            // Grava os valores da parcela (valor, vencto, juros, amortizacao e saldo devedor)
            // SOMENTE PARA AS PARCELAS AINDA NAO INTEGRADAS
            if (qryParcTemp.FieldByName('CODDOCUMENTO').IsNull) then begin
               if qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9 then begin
                  // Se a anterior também foi antecipada, mantem o saldo devedor da anterior
                  //    para efeito de calculo do juros por antecipação
                  if not bAntecipaProx then fSaldoDevAntec := fSaldoDev;

                  // Calcula o juros pró-rata por antecipação
                  fVlrJurosAntec := CalcAntecipacao(TpCondPag.iFormaCalculo,iCondPag,iParc,
                                                    qryParcTemp.FieldByName('DATAVENCIMENTO').AsDateTime, dVenctoAnt,
                                                    fSaldoDevAntec, fPrestacao, (fSaldoDev * TpCondPag.fTaxaJurosAjust),
                                                    fTaxaJuros, bAntecipaProx);

                  dVencto := qryParcTemp.FieldByName('DATAVENCIMENTO').asDateTime;
               end else begin
                  qryParcTemp.FieldByName('DATAVENCIMENTO').asDateTime := dVencto;
               end;

               if TpCondPag.iIDIndCorr > 0 then begin
                  dIniFator := dReajAnual;
                  dFimFator := DiasUteis.SomaMeses(dIniFator,TpCondPag.iPeriodoReajuste) - 1;
                  fFator    := ComunsImobiliarioDB.FatorCorrecao(TpCondPag.iIDIndCorr,
                                                                 dIniFator, dFimFator,
                                                                 False, TpCondPag.iMesRefReajuste, True);
               end;

               if iParc = 1 then
                  qryParcTemp.FieldByName('VLRJUROS').AsFloat := ComunsImobiliario.Arredonda((TpCondPag.fSaldoDev * fTaxaJuros),2)
               else
                  qryParcTemp.FieldByName('VLRJUROS').AsFloat := ComunsImobiliario.Arredonda((fSaldoDev * fTaxaJuros),2);

               if iParc = 1 then
               begin
                  fCorrecaoSld := ComunsImobiliario.Arredonda( ((TpCondPag.fSaldoDev + qryParcTemp.FieldByName('VLRJUROS').AsFloat )* (fFatorMes-1)), 2);
                  fSaldoDev    := TpCondPag.fSaldoDev;
               end
               else
               begin
                  fCorrecaoSld := ComunsImobiliario.Arredonda( ( (fSaldoDev + qryParcTemp.FieldByName('VLRJUROS').AsFloat ) * (fFatorMes-1)), 2);
               end;

               if iParc = 1 then
                  fNominal     := ComunsImobiliario.Arredonda( (fPrestacao * fFatorMes) * (1 + fTaxaJuros), 2)
               else
                  fNominal     := ComunsImobiliario.Arredonda( (fNominal * fFatorMes) * (1 + fTaxaJuros), 2);

               fPrestacao := fNominal;
               dVencto    := DiasUteis.SomaMeses(dVencto, 1);

               // Grava a Correção do Saldo devedor no ultimo mes do ciclo, para contabilização
               // Grava a Correção do Saldo devedor no ultimo mes do ciclo, para contabilização
               // Alterado por FHBS - SOL: 136335/7462 KTN: 1534371 - 03/01/2012
               // Alterado o fCorrecaoSld > 0 para fCorrecaoSld <> 0
               if (fCorrecaoSld <> 0) and (not qryParcTemp.IsEmpty) then begin
                  qryParcTemp.FieldByName('VLRCORRSALDO').asFloat  := fCorrecaoSld;
                  qryParcTemp.FieldByName('FATORCORRECAO').asFloat := fFatorMes;
                  fCorrecaoSld := 0;
               end;

               qryParcTemp.FieldByName('FATORCORRECAO').AsFloat := fFatorMes;
               qryParcTemp.FieldByName('VLRNOMINAL').asFloat    := ComunsImobiliario.Arredonda(fNominal,2);
               qryParcTemp.FieldByName('VLRPRESTACAO').asFloat  := qryParcTemp.FieldByName('VLRNOMINAL').asFloat;

               fAmortizacao := ComunsImobiliario.Arredonda(qryParcTemp.FieldByName('VLRNOMINAL').asFloat - qryParcTemp.FieldByName('VLRJUROS').AsFloat - qryParcTemp.FieldByName('VLRCORRSALDO').asFloat,2);

               qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat  := fAmortizacao;
               qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat := ComunsImobiliario.Arredonda(fSaldoDev - fAmortizacao, 2);

               // Ajusta o saldo devedor final
               if qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat < 0.5 then begin
                  qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat := 0;
               end;

            end;
            //Helen - SOL 174559 KINTANA - 1577324 - Inicio
            if not (qryParcTemp.FieldByName('CODDOCUMENTO').IsNull) then
            begin
                 // Procura a condição de pagamento original
                 sSql := 'SELECT *  ' +
                 '  FROM PARCFINANCIMOV PF                         ' +
                 ' WHERE                                           ' +
                 '    PF.CODDOCUMENTO  =  ' + qryParcTemp.FieldByName('CODDOCUMENTO').asString;
                if FazQuery(dtmFinanciamento.qryAux,sSql) then
                   dVencto    := dtmFinanciamento.qryAux.FieldbyName('DATAVENCIMENTO').AsFloat;
                if TpCondPag.sPrazo = 'M' then
                   dVencto    := DiasInUteis.SomaMeses(dVencto,TpCondPag.iPeriodo)
                else
                   dVencto    := DiasInUteis.SomaMeses(dVencto,TpCondPag.iPeriodo*12);
                //Helen - SOL 174559/8321 KINTANA - 1584359 - Inicio
                qryParcTemp.FieldByName('VLRCORRSALDO').asFloat  := dtmFinanciamento.qryAux.FieldbyName('VLRCORRSALDO').AsFloat;
                fCorrecaoSld := qryParcTemp.FieldByName('VLRCORRSALDO').asFloat;
                qryParcTemp.FieldByName('FATORCORRECAO').asFloat := dtmFinanciamento.qryAux.FieldbyName('FATORCORRECAO').AsFloat;
                fFatorMes    := qryParcTemp.FieldByName('FATORCORRECAO').asFloat;
                qryParcTemp.FieldByName('VLRCORRSALDO').asFloat  := dtmFinanciamento.qryAux.FieldbyName('VLRCORRSALDO').AsFloat;
                fCorrecaoSld := qryParcTemp.FieldByName('VLRCORRSALDO').asFloat ;
                qryParcTemp.FieldByName('VLRNOMINAL').asFloat    := dtmFinanciamento.qryAux.FieldbyName('VLRNOMINAL').AsFloat;
                fNominal := qryParcTemp.FieldByName('VLRNOMINAL').asFloat;
                qryParcTemp.FieldByName('VLRPRESTACAO').asFloat  := qryParcTemp.FieldByName('VLRNOMINAL').asFloat;
                fAmortizacao := ComunsImobiliario.Arredonda(qryParcTemp.FieldByName('VLRNOMINAL').asFloat - qryParcTemp.FieldByName('VLRJUROS').AsFloat - qryParcTemp.FieldByName('VLRCORRSALDO').asFloat,2);
                qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat  := fAmortizacao;
                qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat := dtmFinanciamento.qryAux.FieldbyName('VLRSALDODEVEDOR').AsFloat;
                //Helen - SOL 174559/8321 KINTANA - 1584359 - Fim

            end;
            //Helen - SOL 174559 KINTANA - 1577324 - Fim

            // grava o ID do indice de correção na parcela
            if qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger in [3,9,15] then begin
               if TpCondPag.iIDIndCorr = 0 then begin
                  qryParcTemp.FieldByName('IDINDCORRECAO').Clear;
               end else begin
                  qryParcTemp.FieldByName('IDINDCORRECAO').AsInteger := TpCondPag.iIDIndCorr;
               end;
            end else begin
               if TpCondPag.iIDIndProj = 0 then begin
                  qryParcTemp.FieldByName('IDINDCORRECAO').Clear;
               end else begin
                  qryParcTemp.FieldByName('IDINDCORRECAO').AsInteger := TpCondPag.iIDIndProj;
               end;
            end;

            fSaldoDev := qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat;
            Result    := Result + qryParcTemp.FieldByName('VLRPRESTACAO').asFloat;

            qryParcTemp.Post;

         end;

         // Incrementa a parcela de juros cobrada no período de Carencia
         if (TpCondPag.bJurosCarencia) and (dVencto < TpCondPag.dDataIniAmortiz) then
            Inc(iParcCarencia);

         // Verifica se houve AMORTIZAÇÃO EXTRA
         DecodeDate(dVencto,ano,mes,dia);
         bTemAmortiz := VerifAmortiz(iCondPag, fSaldoDev, mes, ano, rSaldoAmortiz, rPercAmortiz, dVencto, fValorAmortiz);

         // Se teve amortização extra, ajustar aqui o fPrestação
         if bTemAmortiz then begin
            fSaldoDev    := rSaldoAmortiz;
            fPrestacao   := ComunsImobiliario.Arredonda( fPrestacao * rPercAmortiz, 2);
            fAmortizacao := fPrestacao;
            fNominal     := fPrestacao;
         end;

         FrmAguarde.Pos := prg;
         Application.ProcessMessages;
         Inc(Prg);

         // Testa se a parcela corrente foi Antecipada e a proxima será antecipada para ajuste do prox. vencto.
         if (qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9) and (bAntecipaProx) then
              bAntecipa := True
         else bAntecipa := False;

         // Testa se a parcela corrente foi Antecipada
         if (qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9) then
              bAntecipaAnt := True
         else bAntecipaAnt := False;

         // Inicia nova condição repactuada após o término das parcelas da cond. inicial
         if iParc = (TpCondPag.iNumParcelas + iParcCarencia + iParcExtra) then begin
            with dtmFinanciamento do begin
               sSql := 'SELECT *  '+#13+
                       '  FROM CONDPAGIMOVEL  '+#13+
                       ' WHERE IDCONDINICIAL = ' + FloatToStr(TpCondPag.fIDCondInicial) +#13+
                       '   AND TIPOCONDPAG = ''R''  '+#13+
                       '   AND DATAINI > TO_DATE('+ QuotedStr(FormatDateTime('DD/MM/YYYY',dVencto))+',''DD/MM/YYYY'') ' +#13+
                       ' ORDER BY DATAINI ';
               if FazQuery(qryAux, sSql) then begin
                  if not qryAux.IsEmpty then begin
                     // Determina o nr. de parcelas extras e a nova data de vencimento
                     if TpCondPag.sPrazo = 'M' then
                          dVencto := DiasInUteis.SomaMeses(qryAux.FieldByName('DATAVENCIMENTO').AsDateTime,TpCondPag.iPeriodo *  -1)
                     else dVencto := DiasInUteis.SomaMeses(qryAux.FieldByName('DATAVENCIMENTO').AsDateTime,TpCondPag.iPeriodo * -12);

                     // Verifica o novo saldo devedor
                     if qryAux.FieldByName('VLRFINANC').AsInteger > 0 then
                        fSaldoDev := qryAux.FieldByName('VLRFINANC').AsFloat;

                     iParcExtra   := iParcExtra + qryAux.FieldByName('NUMPARCELAS').AsInteger;
                     iParcEncerra := iParcEncerra + TpCondPag.iNumParcelas;
                  end;
               end;
            end;
         end;

      end;
   finally;
      qryParcTemp.EnableControls;
      FrmAguarde.Apaga;
   end;
   qryParcTemp.First;
end;



function TFuncAlienacao.CalculaTipoCalculo18(iCondPag: Double; dVenctoIni, dDataBase: TDateTime; qryParcTemp: TwwQuery): Double;
var
   ComunsImobiliarioDB     : TComunsImobiliarioDB;
   CtrlOperImob            : TCtrlOperImob;
   CtrlParcFinancImov      : TCtrlParcFinancImov;

   bCondPagNova            : Boolean;        // Indica se encontrou uma repactuação nova
   bViraAno                : Boolean;        // Indica se completou 12 parcelas para virada do ano
   bAntecipa               : Boolean;        // Se a Parcela anterior foi Antecipada e a Proxima também será antecipada
   bTeveAntecipao          : Boolean;        // Se a Parcela anterior foi Antecipada e a Proxima também será antecipada
   bAntecipaProx           : Boolean;        // Se a Próxima parcela tanbém foi antecipada
   bAntecipaAnt            : Boolean;        // Se a Parcela anterior foi Antecipada
   bTemAmortiz             : Boolean;        // Indica se houve Amortização Extra
   bExisteCotacaoMes       : Boolean;        // Existe cotação cadastrada para o mes de competencia

   TpCondPag               : TCondPag;       // Dados da Condição de Pagamento
   TpCondPagAnt            : TCondPag;       // Dados da Condição de Pagamento antes de checar repactuação

   iParc                   : Integer;        // Número da Parcela
   iParcRestante           : Integer;        // Número de Parcelas Restantes
   iParcCarencia           : Integer;        // Parcelas de Juros cobradas durante a carencia
   iMesHoje                : Integer;        // Mes Atual para verificar o tipo de parcela
   iMesVenc                : Integer;        // Mes de Vencimento para verificar o tipo de parcela
   prg                     : Integer;        // Somente indicador da progress bar
   iParcIni                : Integer;        // Parcela inicial para calculo do residuo acumulado
   iParcFim                : Integer;        // Parcela final para calculo do resíduo acumulado
   iParcExtra              : Integer;
   iParcEncerra            : Integer;
   iDiaVencto              : Integer;
   iMesVencto              : Integer;
   iAnoVencto              : Integer;
   iMeses                  : Integer;
   iContador               : Integer;
   iMesesEntre             : Integer;
   iTipoLanc               : Integer;
   iNumParcelas            : Integer;

   fSaldoDev               : Double;         // Valor do Saldo devedor
   fPrestacao              : Double;         // Valor da Prestação
   fNominal                : Double;         // Valor Nominal da Prestação
   fFator                  : Double;         // Fator de Correção das parcelas ( real * projetado )
   fFatorMes               : Double;         // Fator de Correção do Mes da Parcela
   rSaldoAmortiz           : Double;         // Saldo Após a Amortização Extra
   rPercAmortiz            : Double;         // Percentual de Amortização Extra
   fResiduoAcum            : Double;         // Resíduo Acumulado para acréscimo no saldo devedor
   Aux                     : Double;         // Auxiliar para calculo da prestacao
   fSaldoDevAnt            : Double;
   fValorAmortiz           : Double;

   dIniFator               : TDateTime;      // Data de início para busca do Fator de Correção
   dFimFator               : TDateTime;      // Data de Término para busca do Fator de Correção
   dVencto                 : TDateTime;      // Data de Vencimento da Parcela
   dVenctoVira             : TDateTime;      // Data de Vencimento na virada do período
   dVenctoAnt              : TDateTime;      // Data de Vencimento da ultima parcela antes da antecipação
   dDataBusca              : TDateTime;      // Data auxiliar para busca da nova condição
   dIniJuros               : TDateTime;
   dReajAnual              : TDateTime;
   dVencimentoAnt          : TDateTime;
   dVencimento             : TDateTime;
   dVenctoAmort            : TDateTime;
   dUltimoDiaMesAssinatura : TDateTime;
   dUltimoVencimento       : TDateTime;

   ano,mes,dia             : Word;           // Aux para verificar amortização extra
   iDiaNovo                : Word;
   iMesNovo                : Word;
   iAnoNovo                : Word;
   iDia                    : Word;
   iMes                    : Word;
   iAno                    : Word;
   iDiaAssinatura          : word;
   iMesAssinatura          : word;
   iAnoAssinatura          : word;

   iMesCorrAnt             : String;        // Mes de correção da parcela anterior para verificar se busca novo fator
   iMesCorrAtu             : String;
   sSql                    : String;

   fCorrecaoSld            : Extended;      // Correção Monetária do Saldo Devedor
   fVlrJurosAntec          : Extended;
   fSaldoDevAntec          : Extended;
   fTaxaJuros              : Extended;
   fTaxaJurosAcum          : Extended;
   fAmortizacao            : Extended;
   fCorrecaoParc           : Extended;
   fJuros                  : Extended;
begin
   // inicializa variaveis
   Result             := 0;
   prg                := 0;
   iParc              := 0;
   iParcRestante      := 0;
   iParcEncerra       := 0;
   iParcCarencia      := 0;
   iParcExtra         := 0;
   fSaldoDev          := 0;
   fPrestacao         := 0;
   fNominal           := 0;
   fResiduoAcum       := 0;
   Aux                := 0;
   iDiaVencto         := 0;
   iMesVencto         := 0;
   iDiaNovo           := 0;
   iMesNovo           := 0;
   iAnoNovo           := 0;
   iMeses             := 0;
   iParcFim           := 0;
   fVlrJurosAntec     := 0;
   fSaldoDevAntec     := 0;
   fTaxaJuros         := 0;
   fTaxaJurosAcum     := 0;
   fAmortizacao       := 0;
   fCorrecaoSld       := 0;
   fCorrecaoParc      := 0;
   fValorAmortiz      := 0;
   iParcIni           := 1;
   fFator             := 1;
   fFatorMes          := 1;
   dIniFator          := Date;
   dFimFator          := Date;
   dVencto            := Date;
   dVenctoAnt         := Date;
   dVenctoVira        := Date;
   bViraAno           := False;
   bAntecipa          := False;
   bTeveAntecipao     := False;
   bAntecipaProx      := False;
   bAntecipaAnt       := False;
   iMesCorrAtu        := '';
   iMesCorrAnt        := '';
   bExisteCotacaoMes  := True;


   // Verifica a condição de pagamento no Vencimento inicial
   DecodeDate(dVenctoIni, ano, mes, dia);
// Felipe de Oliveira SOL 145690 Ktn980821
// acrescentado o parametro com a data inicial para poder pegar o saldo devedor correto
   FuncAlienacao.BuscaCondPag(iCondPag, mes, ano, False, TpCondPag, True,dVenctoIni);

   // Faz as devidas inicializações
   ComunsImobiliarioDB := TComunsImobiliarioDB.Create(Sistema.IDEmpresa, Sistema.IDModulo, Sistema.IDUsuario, sistema.IDEspAcesso, Sistema.UsaPlanoPatro);
   ComunsImobiliarioDB.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                                   Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                                   ComunsImobiliario.MensErroMT);

   CtrlOperImob       := TCtrlOperImob.Create(Sistema.IDEmpresa, Sistema.IDModulo, Sistema.IDUsuario, sistema.IDEspAcesso, -1,-1,Sistema.UsaPlanoPatro);
   CtrlOperImob.InitializeAs(ComunsImobiliarioDB);

   CtrlParcFinancImov := TCtrlParcFinancImov.Create;
   CtrlParcFinancImov.InitializeAs(ComunsImobiliarioDB);

   FrmAguarde.Min := 0;
   FrmAguarde.Max := TpCondPag.iNumParcelas;
   FrmAguarde.Pos := Prg;
   FrmAguarde.Mostra('Aguarde, Gerando Parcelas...');
   Application.ProcessMessages;

   // Se a query das parcelas estiver aberta, mantém aberta para somente alterar os valores
   // que possivelmente forem recalculados, senão, abre para incluir as parcelas novas.
   if qryParcTemp.Active = False then qryParcTemp.Active := True;

   with qryParcTemp do begin
      First;
      while not eof do
      begin
         if (qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 1) and
            (qryParcTemp.FieldByName('IDCONDPAGIMOVEL').AsInteger = iCondPag) then
            Delete
         else Next;
      end;
      First;
   end;

   // define saldo devedor e vencto da primeira parcela
   fSaldoDev      := TpCondPag.fSaldoDev;
   dVenctoAnt     := TpCondPag.dDataVencimento;
   dVencto        := TpCondPag.dDataVencimento;

   dFimFator      := TpCondPag.dIniFatorCM14;
   dReajAnual     := TpCondPag.dIniFatorCM14;

   iDiaVencto     := DiasUteis.ExtraiDia(dVencto);
   iMesVencto     := DiasUteis.ExtraiMes(dVencto);
   bCondPagNova   := False;
   TpCondPagAnt   := TpCondPag;

   // // Marchetti - Pendencia 22447
   iTipoLanc      := -1;

   iNumParcelas := TpCondPag.iNumParcelas;
   qryParcTemp.DisableControls;
   try
      while iParc < (TpCondPag.iNumParcelas + iParcCarencia + iParcExtra) do
      begin
         bViraAno := False;

         iParc    := iParc + 1;

         if (iParc = 1) and (TpCondPag.iPeriodoReajuste = 1) then
         begin
            bViraAno      := True;
            iParcRestante := (TpCondPag.iNumParcelas + iParcEncerra - (iParc-iParcCarencia-1));

            if (TpCondPag.fTaxaJuros <> 0) then
            begin
               Aux        := Power((1 + TpCondPag.fTaxaJurosAjust), (iParcRestante) );
               fPrestacao := fSaldoDev * ((TpCondPag.fTaxaJurosAjust * Aux)/(Aux -1));
            end
            else
            begin
               fPrestacao := fSaldoDev / (iParcRestante);
            end;
            fNominal := fPrestacao;
         end;

         // // Marchetti - Pendencia 22447
         dVenctoAnt := qryParcTemp.FieldByName('DATAVENCIMENTO').AsDateTime;
         if qryParcTemp.Locate('IDCONDPAGIMOVEL;NUMPARCELA',VarArrayOf([iCondPag,iParc]),[]) then
         begin
            bAntecipa      := (qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9);
            bTeveAntecipao := True;
         end;

         fCorrecaoSld := 0;

         // Busca as codições de pagamento para a próxima parcela
         if iParc > 1 then
         begin
            // Guarda a condição anterior para verificar alterações
            TpCondPagAnt := TpCondPag;

            // busca a condição de pagamento vigente no próximo mes de vencimento
            if TpCondPag.sPrazo = 'M' then
                 DecodeDate(DiasInUteis.SomaMeses(dVencto,TpCondPag.iPeriodo), ano, mes, dia)
            else DecodeDate(DiasInUteis.SomaMeses(dVencto,TpCondPag.iPeriodo*12), ano, mes, dia);

            if not FuncAlienacao.BuscaCondPag(iCondPag, mes, ano, False, TpCondPag) then TpCondPag := TpCondPagAnt;

            if TpCondPagAnt.fIDCondPagImovel <> TpCondPag.fIDCondPagImovel then bCondPagNova := True
            else                                                                bCondPagNova := False;
         end;

         // Se houve repactuação com alteração de juros, num. parcelas, tipo de reajuste,
         // correção, saldo devedor.
         // Força a Virada de ano, para recalculo das parcelas.
         if (bCondPagNova) then
         begin
            if (TpCondPagAnt.iNumParcelas   <> TpCondPag.iNumParcelas)   or
               (TpCondPagAnt.iPeriodo       <> TpCondPag.iPeriodo)       or
               (TpCondPagAnt.sPrazo         <> TpCondPag.sPrazo)         or
               (TpCondPagAnt.fTaxaJuros     <> TpCondPag.fTaxaJuros)     or
               (TpCondPagAnt.sPeriodoTaxa   <> TpCondPag.sPeriodoTaxa)   or
               (TpCondPagAnt.iFormaCalculo  <> TpCondPag.iFormaCalculo)  or
               (TpCondPag.fSaldoDev > 0) then
            begin
               iParcFim := iParc - 1;
            end;
         end;

         // busca saldo da correção até o mês da virada.
         if (bViraAno) then
         begin
            if TpCondPag.iIDIndCorr > 0 then
            begin
               dIniFator := dReajAnual;
               // Vinicius - 01/02/2005 - o fator é calculado até o ultimo vencimento
               dFimFator := dVencto;

               if TpCondPag.iPeriodoReajuste = 1 then
               begin
                  dFimFator := DiasUteis.SomaMeses(dIniFator,TpCondPag.iPeriodoReajuste);
                  dFimFator := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dFimFator),DiasUteis.ExtraiMes(dFimFator));
               end;

               fFator    := ComunsImobiliarioDB.FatorCorrecao(TpCondPag.iIDIndCorr,
                                                              dIniFator + 1, dFimFator,
                                                              False, TpCondPag.iMesRefReajuste, True);
               dReajAnual := dFimFator;
            end;
         end;

         // Grava a Correção do Saldo devedor no ultimo mes do ciclo, para contabilização
         if fCorrecaoSld > 0 then
         begin
            qryParcTemp.Edit;
            qryParcTemp.FieldByName('VLRCORRSALDO').asFloat := fCorrecaoSld;
            qryParcTemp.Post;
            fCorrecaoSld := 0;
         end;

         // Calcula Valor da Prestação
         if (bViraAno) or (iParc = 1) then
         begin
            iParcRestante := (TpCondPag.iNumParcelas + iParcEncerra - (iParc-iParcCarencia-1));
            fPrestacao    := fSaldoDev / (iParcRestante);
            fNominal      := fPrestacao;
         end;

         // Efetua todas as gravações apenas se o valor da prestação for > 0
         if ComunsImobiliario.Arredonda(fPrestacao,2) > 0 then
         begin

            // Verifica a data de Vencimento, buscando na repactuação
            dIniFator  := DiasUteis.SomaMeses(dVencto, 1);

            if bCondPagNova then
            begin
               dVenctoAnt  := dVencto;
               dVencto     := TpCondPag.dDataVencimento;
               iDiaVencto  := DiasUteis.ExtraiDia(dVencto);
               iMesVencto  := DiasUteis.ExtraiMes(dVencto);
               fSaldoDev   := TpCondPag.fSaldoDev;

               if bViraAno then dVenctoVira := dVencto;
            end
            else
            begin
               if iParc = 1 then
               begin
                  dVencto     := TpCondPag.dDataVencimento;
                  dVenctoAnt  := TpCondPag.dDataAssinatura;
                  iDiaVencto  := DiasUteis.ExtraiDia(dVencto);
                  iMesVencto  := DiasUteis.ExtraiMes(dVencto);
                  dVenctoVira := TpCondPag.dDataVencimento;

                  // Considera a mesma data de vencto como inicio do fator para calcular pro-rata
                  // da CM para calculos com CORREÇÃO MENSAL, pois o indice do mes será pro-rateado
                  if TpCondPag.dUltVenctoComposto > 0 then
                       dIniFator := DiasUteis.SomaMeses(TpCondPag.dUltVenctoComposto,1)
                  else dIniFator := dVencto;

               end
               else
               begin

                  // Se não houve antecipação de parcelas, altera a data do prox. vencimento
                  if not bAntecipa then
                  begin
                     dVenctoAnt := dVencto;

                     // Ajusta o dia do vencimento para o estipulado no contrato, pois o ultimo
                     // vencimento pode ter sido alterado na antecipação
                     DecodeDate(dVencto, iAnoNovo,iMesNovo,iDiaNovo);
                     if iDiaNovo <> iDiaVencto then
                     begin
                        try
                           dVencto := EncodeDate(iAnoNovo,iMesNovo,iDiaVencto);
                        except
                           dVencto := DiasUteis.UltDiaMes(iAnoNovo,iMesNovo);
                        end;
                     end;

                     if TpCondPag.sPrazo = 'M' then
                          dVencto := DiasUteis.SomaMeses( dVencto, TpCondPag.iPeriodo)
                     else dVencto := DiasUteis.SomaMeses( dVencto,(TpCondPag.iPeriodo * 12) );

                     // Ajusta ultimo dia do mes
                     iDiaNovo := DiasUteis.ExtraiDia(dVencto);
                     iMesNovo := DiasUteis.ExtraiMes(dVencto);
                     if iDiaNovo < iDiaVencto then
                     begin
                        while iDiaNovo < iDiaVencto do
                        begin
                           dVencto := DiasUteis.SomaDias(dVencto, 1);
                           if iMesNovo <> DiasUteis.ExtraiMes(dVencto) then
                           begin
                              dVencto := DiasUteis.SomaDias(dVencto, -1);
                              Break;
                           end;
                           iDiaNovo := DiasUteis.ExtraiDia(dVencto);
                        end;
                     end;
                  end;

                  // Verifica e ajusta se o vencimento inicial cai no ultimo dia do mês
                  //  caso de vcncto nos dias 28,29/02 ou 30 )
                  if DiasUteis.ExtraiDia(TpCondPag.dDataVencimento) =
                     DiasUteis.ExtraiDia(
                     DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(TpCondPag.dDataVencimento),
                                         DiasUteis.ExtraiMes(TpCondPag.dDataVencimento)) ) then begin

                     dVencto := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dVencto),
                                                    DiasUteis.ExtraiMes(dVencto));
                  end;

               end;
            end;
            if (bViraAno) and (TpCondPag.iPeriodoReajuste <> 1) then dVenctoVira := dVencto;

//----------------------------------------------------------------------------------------------------------
// Alteração
//----------------------------------------------------------------------------------------------------------
            dVenctoAnt := dVencto;

            DecodeDate(dVenctoVira, iAno, iMes, iDia);

            if qryParcTemp.Locate('IDCONDPAGIMOVEL;FLGTIPOLANC',VarArrayOf([iCondPag,1]),[]) then
            begin
               while (qryParcTemp.FieldByName('IDCONDPAGIMOVEL').AsInteger = iCondPag) and
                     (qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 1)            and
                     (qryParcTemp.FieldByName('DATAVENCIMENTO').AsDateTime = dVencto)  do
               qryParcTemp.Delete;
            end;

            // Grava Registro de Saldo Inicial antes de fazer a Amortização
            if ((dVenctoVira <> DiasUteis.UltDiaMes(iAno, iMes)) and (bViraAno)) or (iParc = 1) then
            begin
               if not qryParcTemp.Locate('IDCONDPAGIMOVEL;FLGTIPOLANC;DATAVENCIMENTO',VarArrayOf([iCondPag,1,dVencto]),[]) then
               begin
                  qryParcTemp.Append;
                  qryParcTemp.FieldByName('IDPARCFINANCIMOV').asFloat  := LeUltRegistro(nil,'PARCFINANCIMOV');
                  qryParcTemp.FieldByName('IDCONTRATOIMOVEL').asFloat  := TpCondPag.fIDContratoImovel;
                  qryParcTemp.FieldByName('IDCONDPAGIMOVEL').asFloat   := TpCondPag.fIDCondInicial;
                  qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger     := 1;
                  qryParcTemp.FieldByName('NUMPARCELA').AsInteger      := 0;
                  qryParcTemp.FieldByName('FATORCORRECAO').AsFloat     := 1;
               end
               else
               begin
                  qryParcTemp.Edit;
               end;

               if iParc = 1 then
               begin
                  qryParcTemp.FieldByName('DATAVENCIMENTO').asDateTime := TpCondPag.dDataAssinatura;
                  qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat   := TpCondPag.fSaldoDev;
               end
               else
               begin
                  qryParcTemp.FieldByName('DATAVENCIMENTO').asDateTime := dVencto;
                  qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat   := fSaldoDev;
               end;

               qryParcTemp.Post;
            end;

            // Marchetti - 21/12/2005
            DecodeDate(dVencto, iAno, iMes, iDia);
            if dVencto <> DiasUteis.UltDiaMes(iAno, iMes) then
            begin

               // Se for a primeira parcela e se dVenctoAnt <> Ultimo Dia do Mes da Assinatura
               // procura a atualização do ultimo dia do mes da assinatura. Se não existir,
               // calcula a correção do dia da assinatura ate o ultimo dia do mes da assinatura
               if (iParc = 1) and (TpCondPag.dDataAssinatura <> dVencto) then
               begin

                  iMesesEntre             := DiasUteis.MesesEntre(TpCondPag.dDataAssinatura,dVencto) + 1;
                  DecodeDate(TpCondPag.dDataAssinatura, iAnoAssinatura, iMesAssinatura, iDiaAssinatura);
                  dUltimoDiaMesAssinatura := DiasUteis.UltDiaMes(iAnoAssinatura, iMesAssinatura);
                  dUltimoVencimento       := TpCondPag.dDataAssinatura;

                  for iContador := iMesesEntre DownTo 1 do
                  begin
                     dVenctoAnt := DiasUteis.SomaMeses(dVencto,-iContador);
                     DecodeDate(dVenctoAnt, iAno, iMes, iDia);
                     dVenctoAnt := DiasUteis.UltDiaMes(iAno, iMes);

//                     if dUltimoDiaMesAssinatura <> dVenctoAnt then
//                     begin
//                        if qryParcTemp.Locate('IDCONDPAGIMOVEL;DATAVENCIMENTO;FLGTIPOLANC;NUMPARCELA',VarArrayOf([iCondPag,dUltimoDiaMesAssinatura,11,0]),[]) then
                        if qryParcTemp.Locate('IDCONDPAGIMOVEL;DATAVENCIMENTO;FLGTIPOLANC;NUMPARCELA',VarArrayOf([iCondPag,dVenctoAnt,11,0]),[]) then
                           qryParcTemp.Delete;

//                        if not qryParcTemp.Locate('IDCONDPAGIMOVEL;DATAVENCIMENTO;FLGTIPOLANC;NUMPARCELA',VarArrayOf([iCondPag,dUltimoDiaMesAssinatura,11,0]),[]) then
                        if not qryParcTemp.Locate('IDCONDPAGIMOVEL;DATAVENCIMENTO;FLGTIPOLANC;NUMPARCELA',VarArrayOf([iCondPag,dVenctoAnt,11,0]),[]) then
                        begin
//                           CtrlParcFinancImov.BuscaValoresUltimaAtualizacao(StrToInt(FloatToStr(TpCondPag.fIDContratoImovel)),
//                                                                         StrToInt(FloatToStr(iCondPag)),dUltimoDiaMesAssinatura, fJuros, fCorrecaoParc);

                           CtrlParcFinancImov.BuscaValoresUltimaAtualizacao(StrToInt(FloatToStr(TpCondPag.fIDContratoImovel)),
                                                                         StrToInt(FloatToStr(iCondPag)),dVenctoAnt, fJuros, fCorrecaoParc);

                           if (iAnoAssinatura = DiasUteis.ExtraiAno(dVenctoAnt)) and
                              (iMesAssinatura = DiasUteis.ExtraiMes(dVenctoAnt)) then
                           begin
                              DecodeDate(dUltimoDiaMesAssinatura, ano, mes, dia);
                              FuncAlienacao.BuscaCondPag(iCondPag, mes, ano, False, TpCondPag, True,dUltimoDiaMesAssinatura);
                           end
                           else
                           begin
                              DecodeDate(dVenctoAnt, ano, mes, dia);
                              FuncAlienacao.BuscaCondPag(iCondPag, mes, ano, False, TpCondPag, True,dVenctoAnt);
                           end;

                           fSaldoDev := TpCondPag.fSaldoDev;


                           if (fJuros + fCorrecaoParc) = 0 then
                           begin
//                              CtrlOperImob.CalculaAtualSaldo14('', fCorrecaoParc,
//                                                               fJuros, StrToInt(FloatToStr(TpCondPag.fIDContratoImovel)),
//                                                               StrToInt(FloatToStr(iCondPag)),
//                                                               dUltimoDiaMesAssinatura, TpCondPag.dDataAssinatura, ModuloImobiliario.Alienacao.iTipoRecCorrecao,
//                                                               ModuloImobiliario.Alienacao.iTipoRecJuros,True,False,fSaldoDev);

                              CtrlOperImob.CalculaAtualSaldo14('', fCorrecaoParc,
                                                               fJuros, StrToInt(FloatToStr(TpCondPag.fIDContratoImovel)),
                                                               StrToInt(FloatToStr(iCondPag)),
                                                               dVenctoAnt, dUltimoVencimento, ModuloImobiliario.Alienacao.iTipoRecCorrecao,
                                                               ModuloImobiliario.Alienacao.iTipoRecJuros,True,False,fSaldoDev);

                           end;

                           //Cássio - SOL Nº 137729  KINTANA Nº 836197 - Início
                           //if (fJuros <> 0) or (fCorrecaoParc <> 0) then
                           //begin
                           //Cássio - SOL Nº 137729  KINTANA Nº 836197 - Fim


                             fSaldoDev := fSaldoDev + fJuros + fCorrecaoParc;

                             qryParcTemp.Append;
                             qryParcTemp.FieldByName('IDPARCFINANCIMOV').asFloat  := LeUltRegistro(nil,'PARCFINANCIMOV');
                             qryParcTemp.FieldByName('IDCONTRATOIMOVEL').asFloat  := TpCondPag.fIDContratoImovel;
                             qryParcTemp.FieldByName('IDCONDPAGIMOVEL').asFloat   := TpCondPag.fIDCondInicial;
                             qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger     := 11;
                             qryParcTemp.FieldByName('NUMPARCELA').AsInteger      := 0;
                             qryParcTemp.FieldByName('FATORCORRECAO').AsFloat     := 1;

                             if (iAnoAssinatura = DiasUteis.ExtraiAno(dVenctoAnt)) and
                                (iMesAssinatura = DiasUteis.ExtraiMes(dVenctoAnt)) then
                                qryParcTemp.FieldByName('DATAVENCIMENTO').asDateTime := dUltimoDiaMesAssinatura
                             else
                                qryParcTemp.FieldByName('DATAVENCIMENTO').asDateTime := dVenctoAnt;

                             qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat   := fSaldoDev;
                             qryParcTemp.FieldByName('VLRJUROS').asFloat          := fJuros;
                             qryParcTemp.FieldByName('VLRCORRSALDO').asFloat      := fCorrecaoParc;
                             qryParcTemp.Post;
                           //Cássio - SOL Nº 137729  KINTANA Nº 836197 - Início
                           //end;
                           //Cássio - SOL Nº 137729  KINTANA Nº 836197 - Fim
                        end;

                          dUltimoVencimento := dVenctoAnt;

//                     end;
                  end;
                  dVenctoAnt := dVencto;
               end;

//----------------------------------------------------------------------------------------------------------
// Fim Alteração
//----------------------------------------------------------------------------------------------------------
              fJuros        := 0;
              fCorrecaoParc := 0;

//               if qryParcTemp.Locate('IDCONDPAGIMOVEL;DATAVENCIMENTO;FLGTIPOLANC;NUMPARCELA',VarArrayOf([iCondPag,dVenctoAnt,11,0]),[]) then
               if qryParcTemp.Locate('IDCONDPAGIMOVEL;DATAVENCIMENTO;FLGTIPOLANC;NUMPARCELA',VarArrayOf([iCondPag,dVenctoAnt,11,0]),[]) then
               begin
                  while (qryParcTemp.FieldByName('IDCONDPAGIMOVEL').AsInteger = iCondPag) and
                        (qryParcTemp.FieldByName('DATAVENCIMENTO').AsDateTime = dVenctoAnt) and
                        (qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 11) and
                        (qryParcTemp.FieldByName('NUMPARCELA').AsInteger = 0) do
                  begin
                     qryParcTemp.Delete;
                  end;
                  fJuros        := 0;
                  fCorrecaoParc := 0;
               end
               else

                  CtrlParcFinancImov.BuscaValoresUltimaAtualizacao(StrToInt(FloatToStr(TpCondPag.fIDContratoImovel)),
                                                                StrToInt(FloatToStr(iCondPag)),dVenctoAnt, fJuros, fCorrecaoParc);

//----------------------------------------------------------------------------------------------------------
// Alteração
//----------------------------------------------------------------------------------------------------------
               if (fJuros + fCorrecaoParc) = 0 then
               begin
                  if iParc = 1 then
//                     CtrlOperImob.CalculaAtualSaldo14('', fCorrecaoParc,
//                                                      fJuros, StrToInt(FloatToStr(TpCondPag.fIDContratoImovel)),
//                                                      StrToInt(FloatToStr(iCondPag)),
//                                                      dVenctoAnt, -1, ModuloImobiliario.Alienacao.iTipoRecCorrecao,
//                                                      ModuloImobiliario.Alienacao.iTipoRecJuros,True,False,fSaldoDev)
                     CtrlOperImob.CalculaAtualSaldo14('', fCorrecaoParc,
                                                      fJuros, StrToInt(FloatToStr(TpCondPag.fIDContratoImovel)),
                                                      StrToInt(FloatToStr(iCondPag)),
                                                      dVenctoAnt, dUltimoVencimento, ModuloImobiliario.Alienacao.iTipoRecCorrecao,
                                                      ModuloImobiliario.Alienacao.iTipoRecJuros,True,False,fSaldoDev)
                  else
                     CtrlOperImob.CalculaAtualSaldo14('', fCorrecaoParc,
                                                      fJuros, StrToInt(FloatToStr(TpCondPag.fIDContratoImovel)),
                                                      StrToInt(FloatToStr(iCondPag)),
                                                      dVenctoAnt, dVencimentoAnt, ModuloImobiliario.Alienacao.iTipoRecCorrecao,
                                                      ModuloImobiliario.Alienacao.iTipoRecJuros,True,False,fSaldoDev);
               end;
//----------------------------------------------------------------------------------------------------------
// Fim Alteração
//----------------------------------------------------------------------------------------------------------

            end;

            // Calcula Valor da Prestação
            iParcRestante := (TpCondPag.iNumParcelas + iParcEncerra - (iParc-iParcCarencia-1));

            if bViraAno then fPrestacao := fSaldoDev / (iParcRestante);
            fNominal := fPrestacao;

            if bCondPagNova then
               fSaldoDev := TpCondPag.fSaldoDev
            else
               fSaldoDev := fSaldoDev + fCorrecaoParc + fJuros;

//----------------------------------------------------------------------------------------------------------
// Alteração
//----------------------------------------------------------------------------------------------------------
//            if ( ((TpCondPag.fIDCondPagImovel = TpCondPagAnt.fIDCondPagImovel)  and (dVenctoAnt >= TpCondPag.dDataAssinatura)) or
//                 ((TpCondPag.fIDCondPagImovel <> TpCondPagAnt.fIDCondPagImovel) and (dVenctoAnt >= TpCondPagAnt.dDataAssinatura))
//               ) then
            if ((TpCondPag.fIDCondPagImovel <> TpCondPagAnt.fIDCondPagImovel) and (dVenctoAnt >= TpCondPagAnt.dDataAssinatura)) then
            begin
               qryParcTemp.Append;
               qryParcTemp.FieldByName('IDPARCFINANCIMOV').asFloat  := LeUltRegistro(nil,'PARCFINANCIMOV');
               qryParcTemp.FieldByName('IDCONTRATOIMOVEL').asFloat  := TpCondPag.fIDContratoImovel;
               qryParcTemp.FieldByName('IDCONDPAGIMOVEL').asFloat   := TpCondPag.fIDCondInicial;
               qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger     := 11;
               qryParcTemp.FieldByName('NUMPARCELA').AsInteger      := 0;
               qryParcTemp.FieldByName('FATORCORRECAO').AsFloat     := 1;
               qryParcTemp.FieldByName('DATAVENCIMENTO').asDateTime := dVenctoAnt;
               qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat   := fSaldoDev;
               qryParcTemp.FieldByName('VLRJUROS').asFloat          := fJuros;
               qryParcTemp.FieldByName('VLRCORRSALDO').asFloat      := fCorrecaoParc;
               qryParcTemp.Post;
            end;
//----------------------------------------------------------------------------------------------------------
// Fim Alteração
//----------------------------------------------------------------------------------------------------------

            CtrlParcFinancImov.BuscaValoresUltimaAtualizacao(StrToInt(FloatToStr(TpCondPag.fIDContratoImovel)),
                                                             StrToInt(FloatToStr(iCondPag)),dVencto,
                                                             fJuros, fCorrecaoParc);

            if (bTeveAntecipao) and ((qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger <> 9)) then
               CtrlParcFinancImov.BuscaValoresUltimaAtualizacao(StrToInt(FloatToStr(TpCondPag.fIDContratoImovel)),
                                                                StrToInt(FloatToStr(iCondPag)),
                                                                qryParcTemp.FieldByName('DATAVENCIMENTO').AsDateTime,
                                                                fJuros, fCorrecaoParc);

            fSaldoDevAntec := fSaldoDev;

            if dVencto > dVenctoAnt then
            begin
               CtrlOperImob.CalculaAtualSaldo14('', fCorrecaoParc,
                                                fJuros, StrToInt(FloatToStr(TpCondPag.fIDContratoImovel)),
                                                StrToInt(FloatToStr(iCondPag)),
                                                dVencto, dVenctoAnt, ModuloImobiliario.Alienacao.iTipoRecCorrecao,
                                                ModuloImobiliario.Alienacao.iTipoRecJuros,True,False,fSaldoDev);
               fSaldoDev := fSaldoDev + fCorrecaoParc + fJuros;
            end;

            iParcRestante := (TpCondPag.iNumParcelas + iParcEncerra - (iParc-iParcCarencia-1));

            fPrestacao := fSaldoDev / iParcRestante;
            // Fim Marchetti - 21/12/2005

            // Verifica se a Parcela já existe. Se não existir, cria uma.
            if not qryParcTemp.Locate('IDCONDPAGIMOVEL;NUMPARCELA',VarArrayOf([iCondPag,iParc]),[]) then
            begin
               // Vinicius - 12/01/2006 - Verifica na base se realmente não existe, estava gerando em duplicidade
               sSql := 'SELECT * FROM PARCFINANCIMOV '+#13+
                       ' WHERE IDCONDPAGIMOVEL = ' + FloatToStr(TpCondPag.fIDCondInicial) +#13+
                       '   AND NUMPARCELA = ' + IntToStr(iParc);
               FazQuery(dtmBaseDados.qry, sSql);
               if not dtmBaseDados.qry.IsEmpty then
               begin
                  MsgDlg('Erro ao gerar a parcela ' + IntToStr(iParc) + ' - duplicidade de lançamento', 'Erro', mtError, [mbok], 0);
                  Abort;
               end
               else
               begin
                  qryParcTemp.Append;
                  qryParcTemp.FieldByName('IDPARCFINANCIMOV').asFloat := LeUltRegistro(nil,'PARCFINANCIMOV');
                  qryParcTemp.FieldByName('IDCONTRATOIMOVEL').asFloat := TpCondPag.fIDContratoImovel;
                  qryParcTemp.FieldByName('IDCONDPAGIMOVEL').asFloat  := TpCondPag.fIDCondInicial;
                  qryParcTemp.FieldByName('NUMPARCELA').asFloat       := iParc;
                  qryParcTemp.FieldByName('FLGLANCINTEGRA').asInteger := 0;
                  qryParcTemp.FieldByName('CODDOCUMENTO').Clear;
                  qryParcTemp.FieldByName('PLNCODIGO').Clear;
                  qryParcTemp.FieldByName('FLGCONCILIADO').Clear;
               end;
            end
            else
            begin
               qryParcTemp.Edit;
            end;

            // 26/05/2005
            if (qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9) and
               (iTipoLanc <> qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger) then
               bAntecipaProx := True;

            // Zera valores que serão recalculados
            if qryParcTemp.FieldByName('CODDOCUMENTO').IsNull then
            begin
               qryParcTemp.FieldByName('VLRCORRSALDO').Clear;
               qryParcTemp.FieldByName('VLRPRESTATUALIZADA').Clear;
               qryParcTemp.FieldByName('VLRRESIDUOATUALI').Clear;
            end;

            // Se o calculo for projetado na origem, utiliza o informado no contrato, senão...
            // Calculo do Fator de Correção até a data base pelo real e depois pelo projetado
            // se o mes de vencto da parcela for o mesmo da anterior, mantém o fator da parcela
            // anterior, pois ambas pertencem ao mesmo mês, e não calcula pro-rata.
            fFatorMes := 1;
            bExisteCotacaoMes := True;

            iMesCorrAtu := FormatDateTime('MM',dVencto) + FormatDateTime('YYYY',dVencto);
            if iMesCorrAtu <> iMesCorrAnt then
            begin
               if dIniFator > dVencto then dIniFator := dVencto;

               // Verifica se a cotação do mes já foi cadastrada
               if TpCondPag.iMesRefReajuste = 0 then
               begin
                  DecodeDate( dVencto, Ano, Mes, Dia );
               end
               else
               begin
                  DecodeDate( DiasUteis.SomaMeses(dVencto, (TpCondPag.iMesRefReajuste * -1) ), Ano, Mes, Dia );
               end;

               with dtmImobiliario.qryCotacoesIntervalo do
               begin
                  LimpaParametros(dtmimobiliario.qryCotacoesIntervalo);
                  ParamByName('INDICE').AsInteger   := TpCondPag.iIDIndCorr;
                  ParamByName('ANOMESINI').AsString := IntToStrZeroPad(Ano, 4) + IntToStrZeroPad(Mes, 2);
                  Open;
                  bExisteCotacaoMes := not dtmImobiliario.qryCotacoesIntervalo.IsEmpty;
               end;

               if (TpCondPag.dDataVencimento <= dDatabase) and (bExisteCotacaoMes) then
               begin
                  if TpCondPag.iIDIndCorr > 0 then
                  begin
                     if TpCondPag.iMesRefReajuste = 0 then
                          fFatorMes := dtmFinanciamento.CalculaFatorCorrecao(TpCondPag.iIDIndCorr,
                                                                             dIniFator, dVencto, True)
                     else fFatorMes := dtmFinanciamento.CalculaFatorCorrecao(TpCondPag.iIDIndCorr,
                                                                        DiasUteis.SomaMeses(dIniFator, (TpCondPag.iMesRefReajuste * -1) ),
                                                                        DiasUteis.SomaMeses(dVencto,   (TpCondPag.iMesRefReajuste * -1) ), True);
                  end;
               end
               else
               begin
                  if TpCondPag.iIDIndProj > 0 then
                  begin
                     if TpCondPag.iMesRefReajuste = 0 then
                          fFatorMes := dtmFinanciamento.CalculaFatorCorrecao(TpCondPag.iIDIndProj,
                                                                             dIniFator, dVencto, True)
                     else fFatorMes := dtmFinanciamento.CalculaFatorCorrecao(TpCondPag.iIDIndProj,
                                                                        DiasUteis.SomaMeses(dIniFator, (TpCondPag.iMesRefReajuste * -1) ),
                                                                        DiasUteis.SomaMeses(dVencto,   (TpCondPag.iMesRefReajuste * -1) ), True);
                  end
                  else
                  if TpCondPag.fCorrecaoProj > 0 then fFatorMes := 1 + TpCondPag.fCorrecaoProj;
               end;

               fFator := fFator * fFatorMes;

               iMesCorrAnt := iMesCorrAtu;
            end;

            // verifica o tipo de parcela ( 2 - Sinal, 3 - Parc Gerada, 4 - Parc Projetada
            //                              7 - Venda a Vista, 8 - Caução )
            if TpCondPag.sTipoCondPag = 'S' then qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 2;
            if TpCondPag.sTipoCondPag = 'V' then qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 7;
            if TpCondPag.sTipoCondPag = 'C' then qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 8;

            // Altera o Tipo de Parcela Projetada ou Gerada, apenas se a mesma não foi antecipada
            // e o indice de reajuste já foi cadastrado no global
            if qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger <> 9 then
            begin
               if (TpCondPag.sTipoCondPag = 'P') or (TpCondPag.sTipoCondPag = 'R') then
               begin
                  if (TpCondPag.iIDIndCorr = 0) and (TpCondPag.iIDIndProj = 0) then
                  begin
                      qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 3;
                  end
                  else
                  begin
                     iMesHoje := StrToInt(IntToStr(DiasInUteis.ExtraiAno(dDataBase)) + FormatFloat('00',DiasInUteis.ExtraiMes(dDataBase)));
                     iMesVenc := StrToInt(IntToStr(DiasInUteis.ExtraiAno(dVencto))   + FormatFloat('00',DiasInUteis.ExtraiMes(dVencto)));

                     // Só muda o status se existir a cotação do mes de processamento
                     if (iMesVenc <= iMesHoje) and (bExisteCotacaoMes) then  qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 3
                     else                                                    qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 4;
                  end;
               end;
            end;

            // Grava o default para o Saldo devedor atual
            qryParcTemp.FieldByName('VLRSALDOATUAL').AsFloat := ComunsImobiliario.Arredonda(fSaldoDev,2);

            // Altera o saldo devedor atual antes de calcular a parc. para os com correção mensal

            // Efetua o prorata na correção da assinatura para o 1 vencto
            if iParc = 1 then
            begin
               if TpCondPag.dUltVenctoComposto > 0 then
               begin
                  if TpCondPag.dUltVenctoComposto <> TpCondPag.dDataVencimento then
                     fFatorMes := ComunsImobiliario.ProRata((fFatorMes-1), TpCondPag.dUltVenctoComposto, TpCondPag.dDataVencimento) + 1;
               end
               else
               begin
                  if TpCondPag.dDataAssinatura <> TpCondPag.dDataVencimento then
                     fFatorMes := ComunsImobiliario.ProRata((fFatorMes-1), TpCondPag.dDataAssinatura, TpCondPag.dDataVencimento) + 1;
               end;
            end;
            fResiduoAcum := (fSaldoDev * fFatorMes) - fSaldoDev;

            qryParcTemp.FieldByName('FATORCORRECAO').AsFloat := fFatorMes;
            qryParcTemp.FieldByName('VLRRESIDUO').Clear;
            qryParcTemp.FieldByName('VLRCORRSALDO').asFloat  := fCorrecaoParc;

            // Define a taxa de juros a ser aplicada, APENAS SE A PRÓXIMA PARCELA NÃO FOR ANTECIPADA
            if bAntecipaProx then
            begin
               fTaxaJuros := 0;
            end
            else
            begin
               // Calcula a Taxa de Juros Pro-Rata para a primeira parcela
               DecodeDate(dVencto, iAno, iMes, iDia);

               if (dVencto <> DiasUteis.UltDiaMes(iAno, iMes)) or ((iParc = 1) and
                  (DiasUteis.ExtraiDia(TpCondPag.dDataAssinatura) <> DiasUteis.ExtraiDia(TpCondPag.dDataVencimento)) and
                  ( (TpCondPag.bJurosCarencia) or ((TpCondPag.iFormaCalculo <> 8) and (TpCondPag.iFormaCalculo <> 12)) )) then
               begin
                  fTaxaJuros := ComunsImobiliario.ProRata(TpCondPag.fTaxaJurosAjust,
                                                          TpCondPag.dDataAssinatura,
                                                          TpCondPag.dDataVencimento,
                                                          TpCondPag.iPeriodoMeses);
               end
               else
               begin
                  fTaxaJuros := TpCondPag.fTaxaJurosAjust;
               end;

               // Calcula a Taxa de Juros Pro-Rata para parcelas antecipadas e
               //   proxima parcela pós antecipação
               if ((qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9) and
                   (qryParcTemp.FieldByName('DATAVENCIMENTO').AsDateTime <> dVenctoAnt)) or
                   (bAntecipaAnt) then
               begin
                   if qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9 then
                   begin
                      fTaxaJuros := ComunsImobiliario.ProRata(TpCondPag.fTaxaJurosAjust,
                                                              dVenctoAnt,
                                                              qryParcTemp.FieldByName('DATAVENCIMENTO').AsDateTime,
                                                              TpCondPag.iPeriodoMeses);
                   end
                   else
                   begin
                      fTaxaJuros := ComunsImobiliario.ProRata(TpCondPag.fTaxaJurosAjust,
                                                              dVenctoAnt,
                                                              dVencto,
                                                              TpCondPag.iPeriodoMeses);
                   end;
               end;

               fTaxaJurosAcum := ((fTaxaJurosAcum + 1) * (fTaxaJuros + 1)) -1;

            end;

            // Grava os valores da parcela (valor, vencto, juros, amortizacao e saldo devedor)
            // SOMENTE PARA AS PARCELAS AINDA NAO INTEGRADAS
            if qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9 then
            begin
               // Se a anterior também foi antecipada, mantem o saldo devedor da anterior
               //    para efeito de calculo do juros por antecipação
               if not bAntecipaProx then fSaldoDevAntec := fSaldoDev;

               // Calcula o juros pró-rata por antecipação
               fVlrJurosAntec := CalcAntecipacao(TpCondPag.iFormaCalculo,iCondPag,iParc,
                                                 qryParcTemp.FieldByName('DATAVENCIMENTO').AsDateTime, dVenctoAnt,
                                                 fSaldoDevAntec, fPrestacao, (fSaldoDev * TpCondPag.fTaxaJurosAjust),
                                                 fTaxaJuros, bAntecipaProx);
               dVencto := qryParcTemp.FieldByName('DATAVENCIMENTO').asDateTime;
            end
            else
            begin
               qryParcTemp.FieldByName('DATAVENCIMENTO').asDateTime := dVencto;
            end;

            qryParcTemp.FieldByName('VLRJUROS').asFloat := fJuros;

            // Registra o valor da prestação, amortização e saldo devedor amortizado
            qryParcTemp.FieldByName('VLRNOMINAL').asFloat       := ComunsImobiliario.Arredonda(fPrestacao,2);

            // // Marchetti - Pendencia 22447
            if qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9 then
            begin
               qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat   := ComunsImobiliario.Arredonda(fPrestacao - (fSaldoDevAntec * TpCondPag.fTaxaJurosAjust),2);

               qryParcTemp.FieldByName('VLRCORRSALDO').Clear;
               qryParcTemp.FieldByName('VLRJUROS').Clear;
               if fVlrJurosAntec > 0 then
               begin
                  qryParcTemp.FieldByName('VLRJUROS').asFloat      := fVlrJurosAntec;

                  CtrlOperImob.CalculaAtualSaldo14('', fCorrecaoParc,
                                                   fJuros, StrToInt(FloatToStr(TpCondPag.fIDContratoImovel)),
                                                   StrToInt(FloatToStr(iCondPag)),
                                                   dVencto, dVenctoAnt, ModuloImobiliario.Alienacao.iTipoRecCorrecao,
                                                   ModuloImobiliario.Alienacao.iTipoRecJuros,True,False,fSaldoDev);

                  qryParcTemp.FieldByName('VLRCORRSALDO').asFloat  := fCorrecaoParc;
               end;
            end
            else
            begin
               qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat   := ComunsImobiliario.Arredonda(fPrestacao - qryParcTemp.FieldByName('VLRJUROS').asFloat - qryParcTemp.FieldByName('VLRCORRSALDO').asFloat ,2);
            end;

            if qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9 then   // antecipação
            begin
               qryParcTemp.FieldByName('VLRPRESTACAO').asFloat     := qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat + fVlrJurosAntec;
               qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat  := ComunsImobiliario.Arredonda(fSaldoDevAntec - qryParcTemp.FieldByName('VLRPRESTACAO').asFloat,2);
               qryParcTemp.FieldByName('VLRSALDOATUAL').AsFloat    := ComunsImobiliario.Arredonda(fSaldoDevAntec + (fSaldoDevAntec * TpCondPag.fTaxaJurosAjust),2);
            end
            else
            begin
               qryParcTemp.FieldByName('VLRPRESTACAO').asFloat     := ComunsImobiliario.Arredonda(fPrestacao,2);
               qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat  := ComunsImobiliario.Arredonda(fSaldoDev - qryParcTemp.FieldByName('VLRPRESTACAO').asFloat,2);
               qryParcTemp.FieldByName('VLRSALDOATUAL').AsFloat    := ComunsImobiliario.Arredonda(fSaldoDev,2);
            end;

            if qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat < 0.5 then
            begin
               qryParcTemp.FieldByName('VLRJUROS').asFloat        := ComunsImobiliario.Arredonda(fJuros + Abs(qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat),2);
               qryParcTemp.FieldByName('VLRSALDOATUAL').AsFloat   := ComunsImobiliario.Arredonda(fSaldoDevAntec + qryParcTemp.FieldByName('VLRJUROS').asFloat,2);
               qryParcTemp.FieldByName('VLRPRESTACAO').asFloat    := qryParcTemp.FieldByName('VLRSALDOATUAL').AsFloat;
               qryParcTemp.FieldByName('VLRNOMINAL').asFloat      := qryParcTemp.FieldByName('VLRSALDOATUAL').AsFloat;
               qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat  := ComunsImobiliario.Arredonda(qryParcTemp.FieldByName('VLRPRESTACAO').asFloat - qryParcTemp.FieldByName('VLRJUROS').asFloat,2);
               qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat := 0;
            end;

//----------------------------------------------------------------------------------------------------------
// Alteração
//----------------------------------------------------------------------------------------------------------
            if (iParc = TpCondPag.iNumParcelas) then
            begin
               qryParcTemp.FieldByName('VLRSALDOATUAL').AsFloat  := ComunsImobiliario.Arredonda(fSaldoDev,2);
               qryParcTemp.FieldByName('VLRPRESTACAO').asFloat   := ComunsImobiliario.Arredonda(fPrestacao,2);
               qryParcTemp.FieldByName('VLRNOMINAL').asFloat     := qryParcTemp.FieldByName('VLRPRESTACAO').asFloat;
               qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat := ComunsImobiliario.Arredonda(qryParcTemp.FieldByName('VLRPRESTACAO').asFloat -
                                                                                                qryParcTemp.FieldByName('VLRJUROS').asFloat -
                                                                                                qryParcTemp.FieldByName('VLRCORRSALDO').asFloat,2);
            end;
//----------------------------------------------------------------------------------------------------------
// Fim Alteração
//----------------------------------------------------------------------------------------------------------

            qryParcTemp.FieldByName('FATORCORRECAO').AsFloat := fFatorMes;

            // grava o ID do indice de correção na parcela
            if qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger in [3,9] then
            begin
               if TpCondPag.iIDIndCorr = 0 then
               begin
                  qryParcTemp.FieldByName('IDINDCORRECAO').Clear;
               end
               else
               begin
                  qryParcTemp.FieldByName('IDINDCORRECAO').AsInteger := TpCondPag.iIDIndCorr;
               end;
            end
            else
            begin
               if TpCondPag.iIDIndProj = 0 then
               begin
                  qryParcTemp.FieldByName('IDINDCORRECAO').Clear;
               end
               else
               begin
                  qryParcTemp.FieldByName('IDINDCORRECAO').AsInteger := TpCondPag.iIDIndProj;
               end;
            end;

            fSaldoDev      := qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat;
            Result         := Result + qryParcTemp.FieldByName('VLRPRESTACAO').asFloat;
            dVencimentoAnt := dVencto;
            qryParcTemp.Post;

//----------------------------------------------------------------------------------------------------------
// Alteração
//----------------------------------------------------------------------------------------------------------
            DecodeDate(dVencto, iAno, iMes, iDia);
            if ( dVencto <> DiasUteis.UltDiaMes(iAno, iMes) ) and
               ( iParc < TpCondPag.iNumParcelas ) then
            begin
               DecodeDate(dVencto, iAno, iMes, iDia);
               dUltimoVencimento := DiasUteis.UltDiaMes(iAno, iMes);

               fJuros        := 0;
               fCorrecaoParc := 0;

               if qryParcTemp.Locate('IDCONDPAGIMOVEL;DATAVENCIMENTO;FLGTIPOLANC;NUMPARCELA',VarArrayOf([iCondPag,dUltimoVencimento,11,0]),[]) then
               begin
                  while (qryParcTemp.FieldByName('IDCONDPAGIMOVEL').AsInteger = iCondPag)          and
                        (qryParcTemp.FieldByName('DATAVENCIMENTO').AsDateTime = dUltimoVencimento) and
                        (qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger     = 11)                and
                        (qryParcTemp.FieldByName('NUMPARCELA').AsInteger      = 0) do
                  begin
                     qryParcTemp.Delete;
                  end;
               end
               else
                  CtrlParcFinancImov.BuscaValoresUltimaAtualizacao(StrToInt(FloatToStr(TpCondPag.fIDContratoImovel)),
                                                                   StrToInt(FloatToStr(iCondPag)),
                                                                   dUltimoVencimento,
                                                                   fJuros,
                                                                   fCorrecaoParc);

               if (fJuros + fCorrecaoParc) = 0 then
               begin
                  CtrlOperImob.CalculaAtualSaldo14('',
                                                   fCorrecaoParc,
                                                   fJuros,
                                                   StrToInt(FloatToStr(TpCondPag.fIDContratoImovel)),
                                                   StrToInt(FloatToStr(iCondPag)),
                                                   dUltimoVencimento,
                                                   dVenctoAnt,
                                                   ModuloImobiliario.Alienacao.iTipoRecCorrecao,
                                                   ModuloImobiliario.Alienacao.iTipoRecJuros,
                                                   True,
                                                   False,
                                                   fSaldoDev);
               end;

               fSaldoDev := fSaldoDev + fCorrecaoParc + fJuros;

               // Grava a atualização do periodo entre o vencimento e o ultimo dia do mes
               qryParcTemp.Append;
               qryParcTemp.FieldByName('IDPARCFINANCIMOV').asFloat  := LeUltRegistro(nil,'PARCFINANCIMOV');
               qryParcTemp.FieldByName('IDCONTRATOIMOVEL').asFloat  := TpCondPag.fIDContratoImovel;
               qryParcTemp.FieldByName('IDCONDPAGIMOVEL').asFloat   := TpCondPag.fIDCondInicial;
               qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger     := 11;
               qryParcTemp.FieldByName('NUMPARCELA').AsInteger      := 0;
               qryParcTemp.FieldByName('FATORCORRECAO').AsFloat     := 1;
               qryParcTemp.FieldByName('DATAVENCIMENTO').asDateTime := dUltimoVencimento;
               qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat   := fSaldoDev;
               qryParcTemp.FieldByName('VLRJUROS').asFloat          := fJuros;
               qryParcTemp.FieldByName('VLRCORRSALDO').asFloat      := fCorrecaoParc;
               qryParcTemp.Post;

               dVencimentoAnt := dUltimoVencimento;
            end;
//----------------------------------------------------------------------------------------------------------
// Fim Alteração
//----------------------------------------------------------------------------------------------------------
         end;

         // Incrementa a parcela de juros cobrada no período de Carencia
         if (TpCondPag.bJurosCarencia) and (dVencto < TpCondPag.dDataIniAmortiz) then Inc(iParcCarencia);

         FrmAguarde.Pos := prg;
         Application.ProcessMessages;
         Inc(Prg);

         // Testa se a parcela corrente foi Antecipada e a proxima será antecipada para ajuste do prox. vencto.
         if (qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9) and (bAntecipaProx) then
              bAntecipa := True
         else bAntecipa := False;

         // Testa se a parcela corrente foi Antecipada
         if (qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9) then
              bAntecipaAnt := True
         else bAntecipaAnt := False;

         // // Marchetti - Pendencia 22447
         iTipoLanc := qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger;

         iMeses := DiasUteis.IntervaloMeses(dVenctoVira,dVencto);

         // Inicia nova condição repactuada após o término das parcelas da cond. inicial
         if iParc = (TpCondPag.iNumParcelas + iParcCarencia + iParcExtra) then
         begin
            with dtmFinanciamento do
            begin
               sSql := 'SELECT *  '+#13+
                       '  FROM CONDPAGIMOVEL  '+#13+
                       ' WHERE IDCONDINICIAL = ' + FloatToStr(TpCondPag.fIDCondInicial) +#13+
                       '   AND TIPOCONDPAG = ''R''  '+#13+
                       '   AND DATAINI > TO_DATE('+ QuotedStr(FormatDateTime('DD/MM/YYYY',dVencto))+',''DD/MM/YYYY'') ' +#13+
                       ' ORDER BY DATAINI ';
               if FazQuery(qryAux, sSql) then
               begin
                  if not qryAux.IsEmpty then
                  begin
                     // Determina o nr. de parcelas extras e a nova data de vencimento
                     if TpCondPag.sPrazo = 'M' then
                          dVencto := DiasInUteis.SomaMeses(qryAux.FieldByName('DATAVENCIMENTO').AsDateTime,TpCondPag.iPeriodo *  -1)
                     else dVencto := DiasInUteis.SomaMeses(qryAux.FieldByName('DATAVENCIMENTO').AsDateTime,TpCondPag.iPeriodo * -12);

                     // Verifica o novo saldo devedor
                     if qryAux.FieldByName('VLRFINANC').AsInteger > 0 then
                        fSaldoDev := qryAux.FieldByName('VLRFINANC').AsFloat;

                     iParcExtra   := iParcExtra + qryAux.FieldByName('NUMPARCELAS').AsInteger;

                     iNumParcelas := qryAux.FieldByName('NUMPARCELAS').AsInteger;

                     iParcEncerra := iParcEncerra + TpCondPag.iNumParcelas;
                  end;
               end;
            end;
         end;

         // Verifica se houve AMORTIZAÇÃO EXTRA
         DecodeDate(dVencto,ano,mes,dia);
         dVencimento := dVencto;
         bTemAmortiz := VerifAmortiz(iCondPag, fSaldoDev, mes, ano, rSaldoAmortiz, rPercAmortiz, dVenctoAmort, fValorAmortiz);

         if (bTemAmortiz) then
         begin
            fSaldoDevAnt := fSaldoDev;
            fSaldoDev    := rSaldoAmortiz;
            fPrestacao   := ComunsImobiliario.Arredonda(fPrestacao * rPercAmortiz,2);
            fAmortizacao := fPrestacao;
            fNominal     := fPrestacao;

            if qryParcTemp.Locate('IDCONDPAGIMOVEL;DATAVENCIMENTO;FLGTIPOLANC',VarArrayOf([iCondPag,dVenctoAmort,11]),[]) then
            begin
               while (qryParcTemp.FieldByName('IDCONDPAGIMOVEL').AsInteger = iCondPag) and
                     (qryParcTemp.FieldByName('DATAVENCIMENTO').AsDateTime = dVenctoAmort) and
                     (qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 11) do
               begin
                  qryParcTemp.Delete;
               end;
            end;

            if (dVenctoAmort <> dVencimento)  then
            begin
               CtrlOperImob.CalculaAtualSaldo14('', fCorrecaoParc,
                                                fJuros, StrToInt(FloatToStr(TpCondPag.fIDContratoImovel)),
                                                StrToInt(FloatToStr(iCondPag)),
                                                dVencimento, dVenctoAmort, ModuloImobiliario.Alienacao.iTipoRecCorrecao,
                                                ModuloImobiliario.Alienacao.iTipoRecJuros,True,False,fSaldoDevAnt);

               fSaldoDevAnt := fSaldoDevAnt + fCorrecaoParc + fJuros;

               if (fJuros + fCorrecaoParc) <> 0 then
               begin
                  qryParcTemp.Append;
                  qryParcTemp.FieldByName('IDPARCFINANCIMOV').asFloat  := LeUltRegistro(nil,'PARCFINANCIMOV');
                  qryParcTemp.FieldByName('IDCONTRATOIMOVEL').asFloat  := TpCondPag.fIDContratoImovel;
                  qryParcTemp.FieldByName('IDCONDPAGIMOVEL').asFloat   := TpCondPag.fIDCondInicial;
                  qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger     := 11;
                  qryParcTemp.FieldByName('NUMPARCELA').AsInteger      := 0;
                  qryParcTemp.FieldByName('FATORCORRECAO').AsFloat     := 1;
                  qryParcTemp.FieldByName('DATAVENCIMENTO').asDateTime := dVenctoAmort;
                  qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat   := ComunsImobiliario.Arredonda(fSaldoDevAnt,2);
                  qryParcTemp.FieldByName('VLRJUROS').asFloat          := fJuros;
                  qryParcTemp.FieldByName('VLRCORRSALDO').asFloat      := fCorrecaoParc;
                  qryParcTemp.Post;
               end;
            end;

            if qryParcTemp.Locate('IDCONDPAGIMOVEL;DATAVENCIMENTO;FLGTIPOLANC',VarArrayOf([iCondPag,dVencto,5]),[]) then
            begin
               qryParcTemp.Edit;
               qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat   := ComunsImobiliario.Arredonda(fSaldoDevAnt - fValorAmortiz,2);
               qryParcTemp.Post;
            end;

            dVencto   := dVencimento;
            fSaldoDev := fSaldoDevAnt - fValorAmortiz;
         end;

      end;
   finally;

      iParc         := 0;
      iParcRestante := 1;

      if (TpCondPag.iNumParcelas - iNumParcelas) > 0 then
      begin
         repeat;
            if qryParcTemp.Locate('IDCONDPAGIMOVEL;NUMPARCELA',VarArrayOf([iCondPag,TpCondPag.iNumParcelas-iParc]),[]) then
               qryParcTemp.Delete;
            inc(iParcRestante);
            inc(iParc);
         until
            iParcRestante > (TpCondPag.iNumParcelas - iNumParcelas);
      end;

      qryParcTemp.EnableControls;

      FreeAndNil(ComunsImobiliarioDB);
      FreeAndNil(CtrlOperImob);
      FreeAndNil(CtrlParcFinancImov);

      FrmAguarde.Apaga;
   end;
   qryParcTemp.First;
end;


//--------------------------------------------
//Rotina..........: GetDataAmortizacao
//N. Sol..........: 91849
//N. Kintana......: 390045
//Data............: 05/09/2008
//Responsável.....: Emerson s.
//Descrição.......: Traz a Data digitada da Amortização na tela de Amortização
//
function TFuncAlienacao.GetDataAmortizacao: TDateTime;
begin
    Result := dDataAmortizacao;
end;


//--------------------------------------------
//Rotina..........: SetDataAmortizacao
//N. Sol..........: 91849
//N. Kintana......: 390045
//Data............: 05/09/2008
//Responsável.....: Emerson s.
//Descrição.......: Salva a Data digitada da Amortização na tela de Amortização
//

procedure TFuncAlienacao.SetDataAmortizacao(
  dDataLancamentoParam: TDateTime);
begin
    dDataAmortizacao := dDataLancamentoParam;
end;


//--------------------------------------------
//Rotina..........: BuscaDataVencimento
//N. Sol..........: 91849
//N. Kintana......: 390045
//Data............: 05/09/2008
//Responsável.....: Emerson s.
//Descrição.......: Tras o vencimento de cada parcela passada como valor
//
function TFuncAlienacao.BuscaDataVencimento (iCondPagImovel : Double; iNumParc : integer): TDateTime;
var sSql     : String;
    iIdParc  : integer;
begin
   // Procura a condição de pagamento original
   sSql := 'SELECT DATAVENCIMENTO  ' +
           '  FROM parcfinancimov  ' +
           ' WHERE IDCONDPAGIMOVEL  = ' + FloatToStr(iCondPagImovel) +
           ' AND NUMPARCELA = ' + FloatToStr(iNumParc) +
           ' order by datavencimento, numparcela ';

   if FazQuery(dtmFinanciamento.qryAux,sSql) then
   begin
         Result := dtmFinanciamento.qryAux.FieldbyName('DATAVENCIMENTO').AsDateTime;
   end
   else
   begin
         Result := 0;
   end;

end;

//--------------------------------------------
//Rotina..........: CalculaPrestacao
//N. Sol..........: 91849
//N. Kintana......: 390045
//Data............: 30/09/2008
//Responsável.....: Emerson s.
//Descrição.......: Devolve o valor das Prestações
//
function TFuncAlienacao.CalculaPrestacao(iCondPag, iParc: Double; dDataVencimento : TDateTime; fAmoztizacao  : double ): double;
var sSql          : string;
    fSaldoDevedor : double;
    fParcelaRest  : double;
    //fAmoztizacao  : double;
    nParcelas     : integer;
begin

// Procura a condição de pagamento original
   sSql := 'SELECT DATAVENCIMENTO, VLRSALDODEVEDOR, VLRAMORTIZACAO, FLGTIPOLANC  ' +
           '  FROM parcfinancimov  ' +
           ' WHERE IDCONDPAGIMOVEL  = ' + FloatToStr(iCondPag)+
           //' AND NUMPARCELA = ' +FloatToStr(iParc) +
           ' order by datavencimento, numparcela ';


   if FazQuery(dtmFinanciamento.qryAux,sSql) then
   begin
         //--posiciiona no primeiro registro--//
         dtmFinanciamento.qryAux.First;

         fSaldoDevedor := 0;
         fParcelaRest  := 0;
         nParcelas     := 0;

         if dtmFinanciamento.qryAux.FieldByName('FLGTIPOLANC').AsInteger = 1 then
         begin
             fSaldoDevedor := dtmFinanciamento.qryAux.FieldbyName('VLRSALDODEVEDOR').asFloat;
         end;

         if (fSaldoDevedor>=fAmoztizacao) then
         begin
             while (not dtmFinanciamento.qryAux.Eof) do
             begin
                  //--soma as parcelas restantes--//
                  if (dtmFinanciamento.qryAux.FieldbyName('FLGTIPOLANC').AsInteger = 3) and
                     (dtmFinanciamento.qryAux.FieldbyName('DATAVENCIMENTO').AsDateTime > dDataVencimento) then
                  begin
                      fParcelaRest  := fParcelaRest + dtmFinanciamento.qryAux.FieldbyName('VLRAMORTIZACAO').asFloat;
                      nParcelas := nParcelas + 1;
                  end;

                  dtmFinanciamento.qryAux.Next;
             end;

             Result := (fParcelaRest-fAmoztizacao)/(nParcelas);

             if (Result<0) then //--caso o resultado seja negativo, pois não pode ser--//
             begin
                  Result := 0;
             end;

         end
         else
         begin
             Result := 0;
         end;
   end
   else
   begin
         Result := 0;
   end;

end;

//--------------------------------------------
//Rotina..........: GetStadoDelete
//N. Sol..........: 91849
//N. Kintana......: 390045
//Data............: 30/09/2008
//Responsável.....: Emerson s.
//Descrição.......: Salva bDelete indicando se o EVENTO é EXCLUSAO
//
function TFuncAlienacao.GetStadoDelete: Boolean;
begin
    Result := bDelete;
end;

//--------------------------------------------
//Rotina..........: SetStadoDelete
//N. Sol..........: 91849
//N. Kintana......: 390045
//Data............: 30/09/2008
//Responsável.....: Emerson s.
//Descrição.......: Retorna status do EVENTO se está em EXCLUSAO
//
procedure TFuncAlienacao.SetStadoDelete(bStadoDelete: Boolean);
begin
   bDelete := bStadoDelete;
end;


//--------------------------------------------
//Rotina..........: ReCalculaAmortizacao
//N. Sol..........: 91849
//N. Kintana......: 390045
//Data............: 30/09/2008
//Responsável.....: Emerson s.
//Descrição.......: Faz o Recalculo das Parcelas qdo ocorreu uma amortizacao
//
function TFuncAlienacao.ReCalculaAmortizacao (iCondPag : Double; iParc :integer  ): Double;
var sSql_DataLanc : string;
    sSql_Parcelas : string;
    SaldoDev      : double;
    fAmortiz      : double;
    fDifeSaldo    : double;
    fDevTotal     : double;
    fParcelas     : double;
    //fAmoztizacao  : double;
    nParcelas     : integer;
    dVencimeto    : TDateTime;
begin


   sSql_DataLanc := 'SELECT DATAVENCIMENTO, VLRSALDODEVEDOR, VLRAMORTIZACAO, FLGTIPOLANC  ' +
           '  FROM parcfinancimov  ' +
           ' WHERE IDCONDPAGIMOVEL  = ' + FloatToStr(iCondPag)+
           ' AND FLGTIPOLANC = 5 ' +
           ' order by FLGTIPOLANC, DATAVENCIMENTO DESC';

   SaldoDev  := 0;
   fParcelas := 0;
   fAmortiz  := 0;
   fDevTotal := 0;
   dVencimeto:= 0;
   nParcelas := 0;

   //--Busca o ultimo lancamento de amortizacao, caso exista amortizacao--//
   if FazQuery(dtmFinanciamento.qryAux,sSql_DataLanc) then
   begin
        dVencimeto := dtmFinanciamento.qryAux.FieldbyName('DATAVENCIMENTO').AsDateTime;
        SaldoDev   := dtmFinanciamento.qryAux.FieldbyName('VLRSALDODEVEDOR').AsFloat;
   end;

  sSql_Parcelas := 'SELECT DATAVENCIMENTO, VLRSALDODEVEDOR, VLRAMORTIZACAO, FLGTIPOLANC  ' +
           '  FROM parcfinancimov  ' +
           ' WHERE IDCONDPAGIMOVEL  = ' + FloatToStr(iCondPag)+
           //' AND FLGTIPOLANC = 1  ' +
           ' order by FLGTIPOLANC, DATAVENCIMENTO ';

   if FazQuery(dtmFinanciamento.qryAux,sSql_Parcelas) then
   begin
        dtmFinanciamento.qryAux.First;
        while (not dtmFinanciamento.qryAux.Eof) do
        begin
             if (dtmFinanciamento.qryAux.FieldbyName('FLGTIPOLANC').asInteger = 1) then //--pega o valor total do SALDODEVEDOR--//
             begin
                //--busca o saldo Devedor Total--//
                fDevTotal := dtmFinanciamento.qryAux.FieldbyName('VLRSALDODEVEDOR').AsFloat;
             end;

             if (dtmFinanciamento.qryAux.FieldbyName('FLGTIPOLANC').asInteger = 3) then //--somente parcelas--//
             begin
                 if  dVencimeto = 0  then //--Neste caso nao existe AMORTIZACOES, entao ira somar todas as parcelas--//
                 begin
                      fParcelas := fParcelas + dtmFinanciamento.qryAux.FieldbyName('VLRAMORTIZACAO').AsFloat;
                      nParcelas := nParcelas + 1;
                 end
                 else if dtmFinanciamento.qryAux.FieldbyName('DATAVENCIMENTO').AsDateTime > dVencimeto then //--caso nao exista nenhuma AMOTIZACAO deve pegar TODAS as PARCELAS--//
                 begin
                      fParcelas := fParcelas + dtmFinanciamento.qryAux.FieldbyName('VLRAMORTIZACAO').AsFloat;

                      //--Caso esteja zerada, é porque ocorreu uma AMORTIZACAO no Valor Total do Saldo Devedor--//
                      if dtmFinanciamento.qryAux.FieldbyName('VLRAMORTIZACAO').AsFloat = 0 then
                      begin
                         fParcelas := SaldoDev;
                      end;   

                      nParcelas := nParcelas + 1;
                 end;
             end;

             if (dtmFinanciamento.qryAux.FieldbyName('FLGTIPOLANC').asInteger = 5) and (dVencimeto>0) then //--somente AMORTIZACOES--//
             begin
                 if dtmFinanciamento.qryAux.FieldbyName('DATAVENCIMENTO').AsDateTime <= dVencimeto then
                 begin
                      fAmortiz := fAmortiz + dtmFinanciamento.qryAux.FieldbyName('VLRAMORTIZACAO').AsFloat;
                 end;
             end;

             dtmFinanciamento.qryAux.Next;
        end;

        if (dVencimeto=0) then
        begin
             Result :=   fDevTotal /nParcelas;
        end
        else
        begin
             fAmortiz := fDevTotal - fParcelas;
             Result :=   SaldoDev / nParcelas;
        end;

   end
   else //--Caso não exista nenhum lancamento--//
   begin
        Result := 0;
   end;
end;


//--------------------------------------------
//Rotina..........: sqlUltimaAmortizacao
//N. Sol..........: 91849
//N. Kintana......: 390045
//Data............: 30/09/2008
//Responsável.....: Emerson s.
//Descrição.......: Traz a DATAVENCIMENTO da ultima AMORTIZACAO, caso exista.
//
function TFuncAlienacao.sqlUltimaAmortizacao (iCondPag : Double ): TDateTime;
var sSql_DataLanc : string;

begin

   Result := 0;
   
   sSql_DataLanc := 'SELECT DATAVENCIMENTO, VLRSALDODEVEDOR, VLRAMORTIZACAO, FLGTIPOLANC  ' +
           '  FROM parcfinancimov  ' +
           ' WHERE IDCONDPAGIMOVEL  = ' + FloatToStr(iCondPag)+
           ' AND FLGTIPOLANC = 5 ' +
           ' order by FLGTIPOLANC, DATAVENCIMENTO DESC';


   //--Busca o ultimo lancamento de amortizacao, caso exista amortizacao--//
   if FazQuery(dtmFinanciamento.qryAux,sSql_DataLanc) then
   begin
        Result := dtmFinanciamento.qryAux.FieldbyName('DATAVENCIMENTO').AsDateTime;
   end
   else
   begin
       Result := 0;
   end;
end;


//--------------------------------------------
//Rotina..........: sqlBuscaParcela
//N. Sol..........: 91849
//N. Kintana......: 390045
//Data............: 30/09/2008
//Responsável.....: Emerson s.
//Descrição.......: Traz a DATAVENCIMENTO, passando o CondPag e o Numero da Parcela
//
function TFuncAlienacao.sqlBuscaParcela (iCondPag : Double; iParcela : integer ): TDateTime;
var sSql_DataLanc : string;

begin

   Result := 0;

   sSql_DataLanc := 'SELECT DATAVENCIMENTO, VLRSALDODEVEDOR, VLRAMORTIZACAO, FLGTIPOLANC  ' +
           '  FROM parcfinancimov  ' +
           ' WHERE IDCONDPAGIMOVEL  = ' + FloatToStr(iCondPag)+
           ' AND FLGTIPOLANC = 3 ' +
           ' AND NUMPARCELA = ' + IntToStr(iParcela) +
           ' order by FLGTIPOLANC, DATAVENCIMENTO DESC';


   //--Busca o ultimo lancamento de amortizacao, caso exista amortizacao--//
   if FazQuery(dtmFinanciamento.qryAux,sSql_DataLanc) then
   begin
        Result := dtmFinanciamento.qryAux.FieldbyName('DATAVENCIMENTO').AsDateTime;
   end
   else
   begin
       Result := 0;
   end;
end;



//--------------------------------------------
//Rotina..........: BuscaSaldoDevedor
//N. Sol..........: 91849
//N. Kintana......: 390045
//Data............: 29/10/2008
//Responsável.....: Emerson s.
//Descrição.......: Devolve o saldo devedor
//
function TFuncAlienacao.BuscaSaldoDevedor( iCondPag : double; iNumParcela :integer ) : double;
var sSql        : String;
    iIdParc     : integer;
    fValorSDeve : double;

begin

   Result := 0;

   if iNumParcela = 0 then
   begin
         sSql := 'SELECT DATAVENCIMENTO, VLRSALDODEVEDOR, VLRAMORTIZACAO, FLGTIPOLANC  ' +
                 '  FROM parcfinancimov  ' +
                 ' WHERE IDCONDPAGIMOVEL  = ' + FloatToStr(iCondPag)+
                 ' AND FLGTIPOLANC = 3 ' +
                 ' order by datavencimento, numparcela ';

         if FazQuery(dtmFinanciamento.qryAux,sSql) then
            begin

               fValorSDeve := 0;
               dtmFinanciamento.qryAux.First;
               while (not dtmFinanciamento.qryAux.Eof) do
               begin
                    if  dtmFinanciamento.qryAux.FieldbyName('DATAVENCIMENTO').AsDateTime > FuncAlienacao.GetDataAmortizacao then
                    begin
                        fValorSDeve := fValorSDeve + dtmFinanciamento.qryAux.FieldbyName('VLRAMORTIZACAO').asFloat;
                    end;
                    dtmFinanciamento.qryAux.Next;
               end;

               Result := fValorSDeve;
             end
             else
             begin
                 Result :=  0;
            end;
   end
   else
   begin
         //--Busca o Saldo Devedor--//
         sSql := 'SELECT DATAVENCIMENTO, VLRSALDODEVEDOR, VLRAMORTIZACAO, FLGTIPOLANC  ' +
                     '  FROM parcfinancimov  ' +
                     ' WHERE IDCONDPAGIMOVEL  = ' + FloatToStr(iCondPag)+
                     ' AND NUMPARCELA = '         + FloatToStr(iNumParcela)+
                     ' order by datavencimento, numparcela ';

         FazQuery(dtmFinanciamento.qryAux,sSql);
         fValorSDeve := dtmFinanciamento.qryAux.FieldbyName('VLRSALDODEVEDOR').asFloat;
         Result := fValorSDeve;
   End;
end;


//--------------------------------------------
//Rotina..........: BuscaSaldo_antes_Amortizacao
//N. Sol..........: 91849
//N. Kintana......: 390045
//Data............: 29/10/2008
//Responsável.....: Emerson s.
//Descrição.......: Busca o Saldo Devedor apos ultima Amortizacao lançada
//
function TFuncAlienacao.BuscaSaldo_antes_Amortizacao( iCondPag : double ) : double;
var sSql        : String;
    iIdParc     : integer;
    fAmortizacao: double;

begin

     sSql := 'SELECT idparcfinancimov, VLRAMORTIZACAO, VLRSALDODEVEDOR, FLGTIPOLANC  ' +
             '  FROM parcfinancimov  ' +
             ' WHERE IDCONDPAGIMOVEL  = ' + FloatToStr(iCondPag)+
             ' AND FLGTIPOLANC = 5 ' +
             ' order by idparcfinancimov DESC';

     if FazQuery(dtmFinanciamento.qryAux,sSql) then
     begin
         fAmortizacao := dtmFinanciamento.qryAux.FieldbyName('VLRSALDODEVEDOR').asFloat;
      end
     else
     begin
         fAmortizacao := 0;
     end;
     Result := fAmortizacao;

end;


//--------------------------------------------
//Rotina..........: TotalAmortizacao
//N. Sol..........: 91849
//N. Kintana......: 390045
//Data............: 29/10/2008
//Responsável.....: Emerson s.
//Descrição.......: Devolve a soma TOTAL de Amortizacoes
//
function TFuncAlienacao.TotalAmortizacao( iCondPag : double ) : double;
var sSql        : String;
    iIdParc     : integer;
    fAmortizacao: double;

begin

     sSql := 'SELECT SUM (VLRAMORTIZACAO) as TOTAL ' +
             '  FROM parcfinancimov  ' +
             ' WHERE IDCONDPAGIMOVEL  = ' + FloatToStr(iCondPag)+
             ' AND FLGTIPOLANC = 5 ';


     if FazQuery(dtmFinanciamento.qryAux,sSql) then
     begin
         fAmortizacao := dtmFinanciamento.qryAux.FieldbyName('TOTAL').asFloat;
      end
     else
     begin
         fAmortizacao := 0;
     end;
     Result := fAmortizacao;

end;

function TFuncAlienacao.CalculaTipoCalculo19(iCondPag: Double; dVenctoIni,
  dDataBase: TDateTime; qryParcTemp: TwwQuery): Double;
var
   ComunsImobiliarioDB     : TComunsImobiliarioDB;
   CtrlParcFinancImov      : TCtrlParcFinancImov;

   bCondPagNova  : Boolean;        // Indica se encontrou uma repactuação nova
   TpCondPag     : TCondPag;       // Dados da Condição de Pagamento
   TpCondPagAnt  : TCondPag;       // Dados da Condição de Pagamento antes de checar repactuação
   iParc         : Integer;        // Número da Parcela
   iParcRestante : Integer;        // Número de Parcelas Restantes
   iParcCarencia : Integer;        // Parcelas de Juros cobradas durante a carencia
   fSaldoDev     : Double;         // Valor do Saldo devedor
   fPrestacao    : Double;         // Valor da Prestação
   fNominal      : Double;         // Valor Nominal da Prestação
   fFator        : Double;         // Fator de Correção das parcelas ( real * projetado )
   fFatorMes     : Double;         // Fator de Correção do Mes da Parcela
   dIniFator     : TDateTime;      // Data de início para busca do Fator de Correção
   dFimFator     : TDateTime;      // Data de Término para busca do Fator de Correção
   iMesHoje      : Integer;        // Mes Atual para verificar o tipo de parcela
   iMesVenc      : Integer;        // Mes de Vencimento para verificar o tipo de parcela
   bTemAmortiz   : Boolean;        // Indica se houve Amortização Extra
   rSaldoAmortiz : Double;         // Saldo Após a Amortização Extra
   rPercAmortiz  : Double;         // Percentual de Amortização Extra
   fResiduoAcum  : Double;         // Resíduo Acumulado para acréscimo no saldo devedor
   Aux           : Double;         // Auxiliar para calculo da prestacao
   dVencto       : TDateTime;      // Data de Vencimento da Parcela
   dVenctoVira   : TDateTime;      // Data de Vencimento na virada do período
   dVenctoAnt    : TDateTime;      // Data de Vencimento da ultima parcela antes da antecipação
   dDataBusca    : TDateTime;      // Data auxiliar para busca da nova condição
   dIniJuros     : TDateTime;
   dReajAnual    : TDateTime;
   ano,mes,dia   : Word;           // Aux para verificar amortização extra
   bViraAno      : Boolean;        // Indica se completou 12 parcelas para virada do ano
   iParcIni      : Integer;        // Parcela inicial para calculo do residuo acumulado
   iParcFim      : Integer;        // Parcela final para calculo do resíduo acumulado
   bAntecipa     : Boolean;        // Se a Parcela anterior foi Antecipada e a Proxima também será antecipada
   bAntecipaProx : Boolean;        // Se a Próxima parcela tanbém foi antecipada
   bAntecipaAnt  : Boolean;        // Se a Parcela anterior foi Antecipada
   prg           : Integer;        // Somente indicador da progress bar
   fVlrJurosAntec: Extended;
   fSaldoDevAntec: Extended;
   fTaxaJuros    : Extended;
   fTaxaJurosAcum: Extended;
   iDiaVencto    : Integer;
   iMesVencto    : Integer;
   iDiaNovo      : Word;
   iMesNovo      : Word;
   iAnoNovo      : Word;
   iMeses        : Integer;
   iMesCorrAnt   : String;        // Mes de correção da parcela anterior para verificar se busca novo fator
   iMesCorrAtu   : String;
   fAmortizacao  : Extended;
   fCorrecaoSld  : Extended;      // Correção Monetária do Saldo Devedor
   fCorrecaoParc : Extended;
   bExisteCotacaoMes : Boolean;   // Existe cotação cadastrada para o mes de competencia
   sSql : String;
   iParcExtra    : Integer;
   iParcEncerra  : Integer;
   dDataVenc     : TDateTime;
   dDataTemp     : TDateTime;
   dDataVecimento: TDateTime;
   fValorAmortiz : Double;
   bJaCalculou   : boolean;
   fSaldoAntDev  : double;
   fSomaValor    : double;
   n             : integer;
   fValAuxi      : double;
   fTotalAmortizacao : double;
begin
  // inicializa variaveis
  Result        := 0;
  prg           := 0;
  iParc         := 0;
  iParcRestante := 0;
  iParcEncerra  := 0;
  iParcCarencia := 0;
  iParcExtra    := 0;
  fSaldoDev     := 0;
  fPrestacao    := 0;
  fNominal      := 0;
  fFator        := 1;
  fFatorMes     := 1;
  dIniFator     := Date;
  dFimFator     := Date;
  fResiduoAcum  := 0;
  Aux           := 0;
  dVencto       := Date;
  dVenctoAnt    := Date;
  dVenctoVira   := Date;
  bViraAno      := False;
  iParcIni      := 1;
  iParcFim      := 0;
  bAntecipa     := False;
  bAntecipaProx := False;
  bAntecipaAnt  := False;
  iDiaVencto    := 0;
  iMesVencto    := 0;
  iDiaNovo      := 0;
  iMesNovo      := 0;
  iAnoNovo      := 0;
  iMeses        := 0;
  iMesCorrAtu   := '';
  iMesCorrAnt   := '';
  fVlrJurosAntec:= 0;
  fSaldoDevAntec:= 0;
  fTaxaJuros    := 0;
  fTaxaJurosAcum:= 0;
  fAmortizacao  := 0;
  fCorrecaoSld  := 0;
  fCorrecaoParc := 0;
  bExisteCotacaoMes := True;
  bJaCalculou   := false;
  fSaldoAntDev  := 0;
  fSomaValor    := 0;
  fTotalAmortizacao := 0;

  // Verifica a condição de pagamento no Vencimento inicial
  DecodeDate(dVenctoIni, ano, mes, dia);
  if not FuncAlienacao.BuscaCondPag(iCondPag, mes, ano, False, TpCondPag, True) then
  begin
    MsgDlg('Erro na busca das condições de pagamento','Erro ',mtError,[mbOK],0);
    Abort;
  end;

  // Faz as devidas inicializações
  ComunsImobiliarioDB := TComunsImobiliarioDB.Create(Sistema.IDEmpresa, Sistema.IDModulo, Sistema.IDUsuario, sistema.IDEspAcesso, Sistema.UsaPlanoPatro);
  ComunsImobiliarioDB.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                                  Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                                  ComunsImobiliario.MensErroMT);

  FrmAguarde.Min := 0;
  FrmAguarde.Max := TpCondPag.iNumParcelas;
  FrmAguarde.Pos := Prg;
  FrmAguarde.Mostra('Aguarde, Gerando Parcelas...');
  Application.ProcessMessages;

  {Se a query das parcelas estiver aberta, mantém aberta para somente alterar os valores
   que possivelmente forem recalculados, senão, abre para incluir as parcelas novas.}
  if qryParcTemp.Active = False then
    qryParcTemp.Active := True;

  dDataVenc := qryParcTemp.FieldByName('DATAVENCIMENTO').AsDateTime;

  // Apaga os Registros de Saldo Inicial
  qryParcTemp.First;
  while not qryParcTemp.eof do
  begin
    if (qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 1) and
       (qryParcTemp.FieldByName('IDCONDPAGIMOVEL').AsInteger = iCondPag) then
     qryParcTemp. Delete
    else
      qryParcTemp.Next;
  end;
  qryParcTemp.First;

  fSaldoDev    := TpCondPag.fSaldoDev;
  fSaldoAntDev := TpCondPag.fSaldoDev;
  dVenctoAnt  := TpCondPag.dDataVencimento;
  dVencto        := TpCondPag.dDataVencimento;
  dFimFator      := TpCondPag.dDataAssinatura;
  dReajAnual     := TpCondPag.dDataAssinatura;
  iDiaVencto     := DiasUteis.ExtraiDia(dVencto);
  iMesVencto     := DiasUteis.ExtraiMes(dVencto);
  bCondPagNova   := False;
  TpCondPagAnt   := TpCondPag;


  qryParcTemp.DisableControls;
  try
    while iParc < (TpCondPag.iNumParcelas + iParcCarencia + iParcExtra) do
    begin
      Inc(iParc);
      fCorrecaoParc := 0;

      if iParc > 1 then
      begin
        TpCondPagAnt := TpCondPag;

        if TpCondPag.sPrazo = 'M' then
          DecodeDate(DiasInUteis.SomaMeses(dVencto, TpCondPag.iPeriodo), ano, mes, dia)
        else
          DecodeDate(DiasInUteis.SomaMeses(dVencto, TpCondPag.iPeriodo * 12), ano, mes, dia);

        if not FuncAlienacao.BuscaCondPag(iCondPag, mes, ano, False, TpCondPag) then
          TpCondPag := TpCondPagAnt;

        if TpCondPagAnt.fIDCondPagImovel <> TpCondPag.fIDCondPagImovel then
          bCondPagNova := True
        else
          bCondPagNova := False;
      end;

      bTemAmortiz := false;

      if (bCondPagNova = True) then
      begin
        if (TpCondPagAnt.iNumParcelas   <> TpCondPag.iNumParcelas)   or
           (TpCondPagAnt.iPeriodo       <> TpCondPag.iPeriodo)       or
           (TpCondPagAnt.sPrazo         <> TpCondPag.sPrazo)         or
           (TpCondPagAnt.fTaxaJuros     <> TpCondPag.fTaxaJuros)     or
           (TpCondPagAnt.sPeriodoTaxa   <> TpCondPag.sPeriodoTaxa)   or
           (TpCondPagAnt.iFormaCalculo  <> TpCondPag.iFormaCalculo)  or
           (TpCondPag.fSaldoDev > 0) then
        begin
          bViraAno := True;
          iParcFim := iParc - 1;
        end;
      end;


      // Calcula Valor da Prestação
      iParcRestante := (TpCondPag.iNumParcelas + iParcEncerra - (iParc-iParcCarencia-1));
      fPrestacao := ComunsImobiliario.Arredonda(fSaldoDev / iParcRestante, 2);

      fNominal := fPrestacao;

      if fPrestacao >= 0 then
      begin
        // Verifica a data de Vencimento, buscando na repactuação
        dIniFator  := DiasUteis.SomaMeses(dVencto, 1);

        if bCondPagNova = True then
        begin
          dVenctoAnt  := dVencto;
          dVencto     := TpCondPag.dDataVencimento;
          iDiaVencto  := DiasUteis.ExtraiDia(dVencto);
          iMesVencto  := DiasUteis.ExtraiMes(dVencto);

          if bViraAno then
            dVenctoVira := dVencto;
        end
        else
        begin
          if iParc = 1 then
          begin
            dVencto     := TpCondPag.dDataVencimento;
            dVenctoAnt  := TpCondPag.dDataAssinatura;
            iDiaVencto  := DiasUteis.ExtraiDia(dVencto);
            iMesVencto  := DiasUteis.ExtraiMes(dVencto);
            dVenctoVira := TpCondPag.dDataAssinatura;
            dIniFator := TpCondPag.dDataAssinatura;
          end
          else
          begin
            // Se não houve antecipação de parcelas, altera a data do prox. vencimento
            if not bAntecipa then
            begin
              dVenctoAnt := dVencto;
              dVencto := DiasUteis.SomaMeses(dVencto, 1);
              {Ajusta o dia do vencimento para o estipulado no contrato, pois o ultimo
               vencimento pode ter sido alterado na antecipação}
              DecodeDate(dVencto, iAnoNovo,iMesNovo,iDiaNovo);
              if iDiaNovo <> iDiaVencto then
                try
                  dVencto := EncodeDate(iAnoNovo,iMesNovo,iDiaVencto);
                except
                  dVencto := DiasUteis.UltDiaMes(iAnoNovo,iMesNovo);
                end;

              // Ajusta ultimo dia do mes
              iDiaNovo := DiasUteis.ExtraiDia(dVencto);
              iMesNovo := DiasUteis.ExtraiMes(dVencto);
              if iDiaNovo < iDiaVencto then
              begin
                while iDiaNovo < iDiaVencto do
                begin
                  dVencto := DiasUteis.SomaDias(dVencto, 1);
                  if iMesNovo <> DiasUteis.ExtraiMes(dVencto) then
                  begin
                    dVencto := DiasUteis.SomaDias(dVencto, -1);
                    Break;
                  end;
                  iDiaNovo := DiasUteis.ExtraiDia(dVencto);
                end;
              end;
            end;
          end;
        end;
        if bViraAno then
          dVenctoVira := dVencto;

        // Grava Registro de Saldo Inicial antes de fazer a Amortização
        if (bViraAno = True) or (iParc = 1) then
        begin
          if not qryParcTemp.Locate('IDCONDPAGIMOVEL;FLGTIPOLANC;DATAVENCIMENTO',VarArrayOf([iCondPag,1,dVencto]),[]) then
          begin
            qryParcTemp.Insert;
            qryParcTemp.FieldByName('IDPARCFINANCIMOV').asFloat  := LeUltRegistro(nil,'PARCFINANCIMOV');
            qryParcTemp.FieldByName('IDCONTRATOIMOVEL').asFloat  := TpCondPag.fIDContratoImovel;
            qryParcTemp.FieldByName('IDCONDPAGIMOVEL').asFloat   := TpCondPag.fIDCondInicial;
            qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger     := 1;
            qryParcTemp.FieldByName('NUMPARCELA').AsInteger      := 0;
            qryParcTemp.FieldByName('FATORCORRECAO').AsFloat     := 1;
          end
          else
            qryParcTemp.Edit;

          if iParc = 1 then
          begin
            qryParcTemp.FieldByName('DATAVENCIMENTO').asDateTime := TpCondPag.dDataAssinatura;
            qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat   := TpCondPag.fSaldoDev;
          end
          else
          begin
            qryParcTemp.FieldByName('DATAVENCIMENTO').asDateTime := dVencto;
            qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat   := fSaldoDev;
          end;
          qryParcTemp.Post;
        end;

        // Verifica se a Parcela já existe. Se não existir, cria uma.
        if not qryParcTemp.Locate('IDCONDPAGIMOVEL;NUMPARCELA',VarArrayOf([iCondPag,iParc]),[]) then
        begin
          sSql := 'SELECT * FROM PARCFINANCIMOV '+#13+
                  ' WHERE IDCONDPAGIMOVEL = ' + FloatToStr(TpCondPag.fIDCondInicial) +#13+
                  '   AND NUMPARCELA = ' + IntToStr(iParc);
          FazQuery(dtmBaseDados.qry, sSql);

          if not dtmBaseDados.qry.IsEmpty then
          begin
            MsgDlg('Erro ao gerar a parcela ' + IntToStr(iParc) + ' - duplicidade de lançamento', 'Erro', mtError, [mbok], 0);
            Abort;
          end
          else
          begin
            qryParcTemp.Append;
            qryParcTemp.FieldByName('IDPARCFINANCIMOV').asFloat := LeUltRegistro(nil,'PARCFINANCIMOV');
            qryParcTemp.FieldByName('IDCONTRATOIMOVEL').asFloat := TpCondPag.fIDContratoImovel;
            qryParcTemp.FieldByName('IDCONDPAGIMOVEL').asFloat  := TpCondPag.fIDCondInicial;
            qryParcTemp.FieldByName('NUMPARCELA').asFloat := iParc;
            qryParcTemp.FieldByName('FLGLANCINTEGRA').asInteger := 0;
            qryParcTemp.FieldByName('CODDOCUMENTO').Clear;
            qryParcTemp.FieldByName('PLNCODIGO').Clear;
            qryParcTemp.FieldByName('FLGCONCILIADO').Clear;
          end;
        end
        else
          qryParcTemp.Edit;

        // Zera valores que serão recalculados
        if qryParcTemp.FieldByName('CODDOCUMENTO').IsNull then
        begin
          qryParcTemp.FieldByName('VLRCORRSALDO').Clear;
          qryParcTemp.FieldByName('VLRPRESTATUALIZADA').Clear;
          qryParcTemp.FieldByName('VLRRESIDUOATUALI').Clear;
        end;

        fFatorMes := 1;
        bExisteCotacaoMes := True;
        iMesCorrAtu := FormatDateTime('MM', dVencto) + FormatDateTime('YYYY', dVencto);

        if iMesCorrAtu <> iMesCorrAnt then
        begin
          if dIniFator > dVencto then
            dIniFator := dVencto;

          // Verifica se a cotação do mes já foi cadastrada
          if TpCondPag.iMesRefReajuste = 0 then
            DecodeDate( dVencto, Ano, Mes, Dia )
          else
            DecodeDate( DiasUteis.SomaMeses(dVencto, (TpCondPag.iMesRefReajuste * -1)), Ano, Mes, Dia) ;

          LimpaParametros(dtmImobiliario.qryCotacoesIntervalo);
          dtmImobiliario.qryCotacoesIntervalo.ParamByName('INDICE').AsInteger   := TpCondPag.iIDIndCorr;
          dtmImobiliario.qryCotacoesIntervalo.ParamByName('ANOMESINI').AsString := IntToStrZeroPad(Ano, 4) + IntToStrZeroPad(Mes, 2);
          dtmImobiliario.qryCotacoesIntervalo.Open;
          bExisteCotacaoMes := not dtmImobiliario.qryCotacoesIntervalo.IsEmpty;

          if (TpCondPag.dDataVencimento <= dDataBase) and (bExisteCotacaoMes) then
          begin
            if TpCondPag.iIDIndCorr > 0 then
              if TpCondPag.iMesRefReajuste = 0 then
                fFatorMes := dtmFinanciamento.CalculaFatorCorrecao(TpCondPag.iIDIndCorr,
                                                                   dIniFator, dVencto, True)
              else fFatorMes := dtmFinanciamento.CalculaFatorCorrecao(TpCondPag.iIDIndCorr,
                                                                      DiasUteis.SomaMeses(dIniFator, (TpCondPag.iMesRefReajuste * -1) ),
                                                                      DiasUteis.SomaMeses(dVencto,   (TpCondPag.iMesRefReajuste * -1) ), True);
          end
          else
            if TpCondPag.iIDIndProj > 0 then
              if TpCondPag.iMesRefReajuste = 0 then
                fFatorMes := dtmFinanciamento.CalculaFatorCorrecao(TpCondPag.iIDIndProj,
                                                                   dIniFator, dVencto, True)
              else
                fFatorMes := dtmFinanciamento.CalculaFatorCorrecao(TpCondPag.iIDIndProj,
                                                                   DiasUteis.SomaMeses(dIniFator, (TpCondPag.iMesRefReajuste * -1) ),
                                                                   DiasUteis.SomaMeses(dVencto,   (TpCondPag.iMesRefReajuste * -1) ), True)
            else
              if TpCondPag.fCorrecaoProj > 0 then
                fFatorMes := 1 + TpCondPag.fCorrecaoProj;

          fFator := fFator * fFatorMes;
          iMesCorrAnt := iMesCorrAtu;
        end;

        {Verifica o tipo de parcela (2 - Sinal, 3 - Parc Gerada, 4 - Parc Projetada
                                     7 - Venda a Vista, 8 - Caução)}
        if TpCondPag.sTipoCondPag = 'S' then
          qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 2;

        if TpCondPag.sTipoCondPag = 'V' then
          qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 7;

        if TpCondPag.sTipoCondPag = 'C' then
          qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 8;

        {Altera o Tipo de Parcela Projetada ou Gerada, apenas se a mesma não foi antecipada
         e o indice de reajuste já foi cadastrado no global}
        if qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger <> 9 then
        begin
          if (TpCondPag.sTipoCondPag = 'P') or
             (TpCondPag.sTipoCondPag = 'R') then
          begin
            if (TpCondPag.iIDIndCorr = 0) and (TpCondPag.iIDIndProj = 0) then
              qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 3
            else
            begin
              iMesHoje := StrToInt(IntToStr(DiasInUteis.ExtraiAno(dDataBase)) + FormatFloat('00',DiasInUteis.ExtraiMes(dDataBase)));
              iMesVenc := StrToInt(IntToStr(DiasInUteis.ExtraiAno(dVencto))   + FormatFloat('00',DiasInUteis.ExtraiMes(dVencto)));

              // Só muda o status se existir a cotação do mes de processamento
              if bExisteCotacaoMes then
                qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 3
              else
                qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 4;
            end;
          end;
        end;
        // Grava o default para o Saldo devedor atual
        if qryParcTemp.FieldByName('CODDOCUMENTO').IsNull then
          qryParcTemp.FieldByName('VLRSALDOATUAL').AsFloat := fSaldoDev;

        // Define a taxa de juros a ser aplicada.
        if bAntecipaProx then
          fTaxaJuros := 0
        else
        begin
          if (iParc = 1) and
             (DiasUteis.ExtraiDia(TpCondPag.dDataAssinatura) <> DiasUteis.ExtraiDia(TpCondPag.dDataVencimento)) and
             (TpCondPag.bJurosCarencia) then
            fTaxaJuros := ComunsImobiliario.ProRata(TpCondPag.fTaxaJurosAjust,
                                                    TpCondPag.dDataAssinatura,
                                                    TpCondPag.dDataVencimento,
                                                    TpCondPag.iPeriodoMeses)
          else
            fTaxaJuros := TpCondPag.fTaxaJurosAjust;
        end;

        {Calcula a Taxa de Juros Pro-Rata para parcelas antecipadas e
         proxima parcela pós antecipação}
        if ((qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9) and
            (qryParcTemp.FieldByName('DATAVENCIMENTO').AsDateTime <> dVenctoAnt)) or
           (bAntecipaAnt) then
          if qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9 then
            fTaxaJuros := ComunsImobiliario.ProRata(TpCondPag.fTaxaJurosAjust,
                                                    dVenctoAnt,
                                                    qryParcTemp.FieldByName('DATAVENCIMENTO').AsDateTime,
                                                    TpCondPag.iPeriodoMeses)
          else
            fTaxaJuros := ComunsImobiliario.ProRata(TpCondPag.fTaxaJurosAjust,
                                                    dVenctoAnt,
                                                    dVencto,
                                                    TpCondPag.iPeriodoMeses);

        //fTaxaJurosAcum := ((fTaxaJurosAcum + 1) * (fTaxaJuros + 1)) -1;

        // Grava os valores da parcela (valor, vencto, juros, amortizacao e saldo devedor)
        if qryParcTemp.FieldByName('CODDOCUMENTO').IsNull then
        begin
          if qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9 then
          begin
            {Se a anterior também foi antecipada, mantem o saldo devedor da anterior
             para efeito de calculo do juros por antecipação}
            if not bAntecipaProx then
              fSaldoDevAntec := fSaldoDev;

            // Calcula o juros pró-rata por antecipação
            fVlrJurosAntec := CalcAntecipacao(TpCondPag.iFormaCalculo,iCondPag,iParc,
                                              qryParcTemp.FieldByName('DATAVENCIMENTO').AsDateTime, dVenctoAnt,
                                              fSaldoDevAntec, fPrestacao, (fSaldoDev * TpCondPag.fTaxaJurosAjust),
                                              fTaxaJuros, bAntecipaProx);

            dVencto := qryParcTemp.FieldByName('DATAVENCIMENTO').asDateTime;
          end
          else
            qryParcTemp.FieldByName('DATAVENCIMENTO').asDateTime := dVencto;

          // Paulo Nobre - WO20652 - Inicio
          // Registra o valor do juros sobre parcela
          // WO17768 - Início
{          qryParcTemp.FieldByName('VLRJUROSPARC').asFloat := ComunsImobiliario.Arredonda(fSaldoDev * ((fFatorMes) *(1 + fTaxaJuros)-1),2);
          //qryParcTemp.FieldByName('VLRJUROSPARC').asFloat := ComunsImobiliario.Arredonda(fNominal * ((fFatorMes) *(1 + fTaxaJuros)-1),2);
          // WO17768 - Fim
          qryParcTemp.FieldByName('VLRJUROS').Clear;
}
          // Paulo Nobre - WO20652 - Fim

          // Registra o valor da prestação, amortização e saldo devedor amortizado
          qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat := ComunsImobiliario.Arredonda(fSaldoDev / iParcRestante,2);
          qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat := ComunsImobiliario.Arredonda(fSaldoDev - qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat,2);
          qryParcTemp.FieldByName('VLRNOMINAL').asFloat := ComunsImobiliario.Arredonda(fNominal,2);
          qryParcTemp.FieldByName('FATORCORRECAO').AsFloat := fFatorMes;
          qryParcTemp.FieldByName('FLGRESIDUOINCORP').AsString := 'N';
          qryParcTemp.FieldByName('VLRPRESTACAO').asFloat := qryParcTemp.FieldByName('VLRNOMINAL').asFloat + qryParcTemp.FieldByName('VLRJUROSPARC').asFloat;
          qryParcTemp.FieldByName('VLRRESIDUOATUALI').asFloat := 0;
          qryParcTemp.FieldByName('IDINDCORRECAO').AsInteger := TpCondPag.iIDIndCorr;

          // Paulo Nobre - WO20652 - Inicio
          qryParcTemp.FieldByName('VLRJUROSPARC').asFloat := qryParcTemp.FieldByName('VLRPRESTACAO').asFloat - qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat;
          // Paulo Nobre - WO20652 - Fim

          //fSaldoDev := qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat; //WO17768
          Result    := Result + qryParcTemp.FieldByName('VLRPRESTACAO').asFloat;
          qryParcTemp.Post;
        end;
      end;
      // Incrementa a parcela de juros cobrada no período de Carencia
      if (TpCondPag.bJurosCarencia) and (dVencto < TpCondPag.dDataIniAmortiz) then
        Inc(iParcCarencia);

      //Cássio Rovaroto - WO 15334 - Início
      // Se caso for a 1ª parcela, atualiza a variável fSaldoDev descontado da
      // amortização, para considerar o saldo devedor da próxima parcela.
      //if (iParc =  1)  then // WO17768
      //Cássio Rovaroto - WO 19054 - Início
      if (iCondPag = 4202) then
        case iParc of
          6:
            fSaldoDev := 2519777.78;
          7:
            fSaldoDev := 2410222.22;
          8:
            fSaldoDev := 2300666.67;
        else
          fSaldoDev := fSaldoDev - qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat;
        end
      else
        fSaldoDev := fSaldoDev - qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat;
      //Cássio Rovaroto - WO 15334 - Fim
      //Cássio Rovaroto - WO 19054 - Fim

      FrmAguarde.Pos := prg;
      Application.ProcessMessages;
      Inc(Prg);

      // Testa se a parcela corrente foi Antecipada e a proxima será antecipada para ajuste do prox. vencto.
      if (qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9) and (bAntecipaProx) then
        bAntecipa := True
      else bAntecipa := False;

      // Testa se a parcela corrente foi Antecipada
      if (qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9) then
        bAntecipaAnt := True
      else bAntecipaAnt := False;
    end;
  finally
    qryParcTemp.EnableControls;
    FrmAguarde.Apaga;
  end;
  qryParcTemp.First;
end;

function TFuncAlienacao.CalculaTipoCalculo20(iCondPag: Double; dVenctoIni,
  dDataBase: TDateTime; qryParcTemp: TwwQuery): Double;
var
   ComunsImobiliarioDB     : TComunsImobiliarioDB;
   CtrlParcFinancImov      : TCtrlParcFinancImov;

   bCondPagNova  : Boolean;        // Indica se encontrou uma repactuação nova
   TpCondPag     : TCondPag;       // Dados da Condição de Pagamento
   TpCondPagAnt  : TCondPag;       // Dados da Condição de Pagamento antes de checar repactuação
   iParc         : Integer;        // Número da Parcela
   iParcRestante : Integer;        // Número de Parcelas Restantes
   iParcCarencia : Integer;        // Parcelas de Juros cobradas durante a carencia
   fSaldoDev     : Double;         // Valor do Saldo devedor
   fPrestacao    : Double;         // Valor da Prestação
   fNominal      : Double;         // Valor Nominal da Prestação
   fFator        : Double;         // Fator de Correção das parcelas ( real * projetado )
   fFatorMes     : Double;         // Fator de Correção do Mes da Parcela
   dIniFator     : TDateTime;      // Data de início para busca do Fator de Correção
   dFimFator     : TDateTime;      // Data de Término para busca do Fator de Correção
   iMesHoje      : Integer;        // Mes Atual para verificar o tipo de parcela
   iMesVenc      : Integer;        // Mes de Vencimento para verificar o tipo de parcela
   bTemAmortiz   : Boolean;        // Indica se houve Amortização Extra
   rSaldoAmortiz : Double;         // Saldo Após a Amortização Extra
   rPercAmortiz  : Double;         // Percentual de Amortização Extra
   fResiduoAcum  : Double;         // Resíduo Acumulado para acréscimo no saldo devedor
   Aux           : Double;         // Auxiliar para calculo da prestacao
   dVencto       : TDateTime;      // Data de Vencimento da Parcela
   dVenctoVira   : TDateTime;      // Data de Vencimento na virada do período
   dVenctoAnt    : TDateTime;      // Data de Vencimento da ultima parcela antes da antecipação
   dDataBusca    : TDateTime;      // Data auxiliar para busca da nova condição
   dIniJuros     : TDateTime;
   dReajAnual    : TDateTime;
   ano,mes,dia   : Word;           // Aux para verificar amortização extra
   bViraAno      : Boolean;        // Indica se completou 12 parcelas para virada do ano
   iParcIni      : Integer;        // Parcela inicial para calculo do residuo acumulado
   iParcFim      : Integer;        // Parcela final para calculo do resíduo acumulado
   bAntecipa     : Boolean;        // Se a Parcela anterior foi Antecipada e a Proxima também será antecipada
   bAntecipaProx : Boolean;        // Se a Próxima parcela tanbém foi antecipada
   bAntecipaAnt  : Boolean;        // Se a Parcela anterior foi Antecipada
   prg           : Integer;        // Somente indicador da progress bar
   fVlrJurosAntec: Extended;
   fSaldoDevAntec: Extended;
   fTaxaJuros    : Extended;
   fTaxaJurosAcum: Extended;
   iDiaVencto    : Integer;
   iMesVencto    : Integer;
   iDiaNovo      : Word;
   iMesNovo      : Word;
   iAnoNovo      : Word;
   iMeses        : Integer;
   iMesCorrAnt   : String;        // Mes de correção da parcela anterior para verificar se busca novo fator
   iMesCorrAtu   : String;
   fAmortizacao  : Extended;
   fCorrecaoSld  : Extended;      // Correção Monetária do Saldo Devedor
   fCorrecaoParc : Extended;
   bExisteCotacaoMes : Boolean;   // Existe cotação cadastrada para o mes de competencia
   sSql : String;
   iParcExtra    : Integer;
   iParcEncerra  : Integer;
   dDataVenc     : TDateTime;
   dDataTemp     : TDateTime;
   dDataVecimento: TDateTime;
   fValorAmortiz : Double;
   bJaCalculou   : boolean;
   fSaldoAntDev  : double;
   fSomaValor    : double;
   n             : integer;
   fValAuxi      : double;
   fTotalAmortizacao : double;
   fParcelaAnterior: Extended;

   fCotacaoMoedaValor : Double;     // Paulo Nobre - WO24601
   fPercJurosTotal : Double;        // Paulo Nobre - WO24946

   qryCotacao : TwwQuery;           // Paulo Nobre = WO24956

   // Paulo Nobre - WO25616 - Inicio
   sAnoMesCot : String;
   qryBuscaParcelaAnterior : TwwQuery;
   qryParcelaAlterador : TwwQuery;
   // Paulo Nobre - WO25616 - Fim

begin
  // inicializa variaveis
  Result        := 0;
  prg           := 0;
  iParc         := 0;
  iParcRestante := 0;
  iParcEncerra  := 0;
  iParcCarencia := 0;
  iParcExtra    := 0;
  fSaldoDev     := 0;
  fPrestacao    := 0;
  fNominal      := 0;
  fFator        := 1;
  fFatorMes     := 1;
  dIniFator     := Date;
  dFimFator     := Date;
  fResiduoAcum  := 0;
  Aux           := 0;
  dVencto       := Date;
  dVenctoAnt    := Date;
  dVenctoVira   := Date;
  bViraAno      := False;
  iParcIni      := 1;
  iParcFim      := 0;
  bAntecipa     := False;
  bAntecipaProx := False;
  bAntecipaAnt  := False;
  iDiaVencto    := 0;
  iMesVencto    := 0;
  iDiaNovo      := 0;
  iMesNovo      := 0;
  iAnoNovo      := 0;
  iMeses        := 0;
  iMesCorrAtu   := '';
  iMesCorrAnt   := '';
  fVlrJurosAntec:= 0;
  fSaldoDevAntec:= 0;
  fTaxaJuros    := 0;
  fTaxaJurosAcum:= 0;
  fAmortizacao  := 0;
  fCorrecaoSld  := 0;
  fCorrecaoParc := 0;
  bExisteCotacaoMes := True;
  bJaCalculou   := false;
  fSaldoAntDev  := 0;
  fSomaValor    := 0;
  fTotalAmortizacao := 0;
  fParcelaAnterior := 0;

  fCotacaoMoedaValor := 0;   // Paulo Nobre - WO24601
  fPercJurosTotal := 0;      // Paulo Nobre - WO24946

  // Paulo Nobre - WO24956 - Inicio
  qryCotacao := TwwQuery.Create(nil);
  qryCotacao.DatabaseName := 'BaseDados';
  // Paulo Nobre - WO24956 - Fim

  // Paulo Nobre - WO25616 - Inicio
  sAnoMesCot := '';
  qryBuscaParcelaAnterior := TwwQuery.Create(nil);
  qryBuscaParcelaAnterior.DatabaseName := 'BaseDados';
  qryParcelaAlterador := TwwQuery.Create(nil);
  qryParcelaAlterador.DatabaseName := 'BaseDados';
  // Paulo Nobre - WO25616 - Fim

  // Verifica a condição de pagamento no Vencimento inicial
  DecodeDate(dVenctoIni, ano, mes, dia);
  if not FuncAlienacao.BuscaCondPag(iCondPag, mes, ano, False, TpCondPag, True) then
  begin
    MsgDlg('Erro na busca das condições de pagamento','Erro ',mtError,[mbOK],0);
    Abort;
  end;

  // Faz as devidas inicializações
  ComunsImobiliarioDB := TComunsImobiliarioDB.Create(Sistema.IDEmpresa, Sistema.IDModulo, Sistema.IDUsuario, sistema.IDEspAcesso, Sistema.UsaPlanoPatro);
  ComunsImobiliarioDB.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                                  Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                                  ComunsImobiliario.MensErroMT);

  FrmAguarde.Min := 0;
  FrmAguarde.Max := TpCondPag.iNumParcelas;
  FrmAguarde.Pos := Prg;
  FrmAguarde.Mostra('Aguarde, Gerando Parcelas...');
  Application.ProcessMessages;

  {Se a query das parcelas estiver aberta, mantém aberta para somente alterar os valores
   que possivelmente forem recalculados, senão, abre para incluir as parcelas novas.}
  if qryParcTemp.Active = False then
    qryParcTemp.Active := True;

  dDataVenc := qryParcTemp.FieldByName('DATAVENCIMENTO').AsDateTime;

  // Apaga os Registros de Saldo Inicial
  qryParcTemp.First;
  while not qryParcTemp.eof do
  begin
    if (qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 1) and
       (qryParcTemp.FieldByName('IDCONDPAGIMOVEL').AsInteger = iCondPag) then
     qryParcTemp. Delete
    else
      qryParcTemp.Next;
  end;
  qryParcTemp.First;

  fSaldoDev    := TpCondPag.fSaldoDev;
  fSaldoAntDev := TpCondPag.fSaldoDev;
  dVenctoAnt  := TpCondPag.dDataVencimento;
  dVencto        := TpCondPag.dDataVencimento;
  dFimFator      := TpCondPag.dDataAssinatura;
  dReajAnual     := TpCondPag.dDataAssinatura;
  iDiaVencto     := DiasUteis.ExtraiDia(dVencto);
  iMesVencto     := DiasUteis.ExtraiMes(dVencto);
  bCondPagNova   := False;
  TpCondPagAnt   := TpCondPag;


  qryParcTemp.DisableControls;
  try
    while iParc < (TpCondPag.iNumParcelas + iParcCarencia + iParcExtra) do
    begin
      Inc(iParc);
      fCorrecaoParc := 0;

      if iParc > 1 then
      begin
        TpCondPagAnt := TpCondPag;

        if TpCondPag.sPrazo = 'M' then
          DecodeDate(DiasInUteis.SomaMeses(dVencto, TpCondPag.iPeriodo), ano, mes, dia)
        else
          DecodeDate(DiasInUteis.SomaMeses(dVencto, TpCondPag.iPeriodo * 12), ano, mes, dia);

        if not FuncAlienacao.BuscaCondPag(iCondPag, mes, ano, False, TpCondPag) then
          TpCondPag := TpCondPagAnt;

        if TpCondPagAnt.fIDCondPagImovel <> TpCondPag.fIDCondPagImovel then
          bCondPagNova := True
        else
          bCondPagNova := False;
      end;

      bTemAmortiz := false;

      if (bCondPagNova = True) then
      begin
        if (TpCondPagAnt.iNumParcelas   <> TpCondPag.iNumParcelas)   or
           (TpCondPagAnt.iPeriodo       <> TpCondPag.iPeriodo)       or
           (TpCondPagAnt.sPrazo         <> TpCondPag.sPrazo)         or
           (TpCondPagAnt.fTaxaJuros     <> TpCondPag.fTaxaJuros)     or
           (TpCondPagAnt.sPeriodoTaxa   <> TpCondPag.sPeriodoTaxa)   or
           (TpCondPagAnt.iFormaCalculo  <> TpCondPag.iFormaCalculo)  or
           (TpCondPag.fSaldoDev > 0) then
        begin
          bViraAno := True;
          iParcFim := iParc - 1;
        end;
      end;

      // Calcula Valor da Prestação
      iParcRestante := (TpCondPag.iNumParcelas + iParcEncerra - (iParc-iParcCarencia-1));
      fPrestacao := ComunsImobiliario.Arredonda(fSaldoDev / iParcRestante, 2);

      fNominal := fPrestacao;

      if fPrestacao >= 0 then
      begin
        // Verifica a data de Vencimento, buscando na repactuação
        dIniFator  := DiasUteis.SomaMeses(dVencto, 1);

        if bCondPagNova = True then
        begin
          dVenctoAnt  := dVencto;
          dVencto     := TpCondPag.dDataVencimento;
          iDiaVencto  := DiasUteis.ExtraiDia(dVencto);
          iMesVencto  := DiasUteis.ExtraiMes(dVencto);

          if bViraAno then
            dVenctoVira := dVencto;
        end
        else
        begin
          if iParc = 1 then
          begin
            dVencto     := TpCondPag.dDataVencimento;
            dVenctoAnt  := TpCondPag.dDataAssinatura;
            iDiaVencto  := DiasUteis.ExtraiDia(dVencto);
            iMesVencto  := DiasUteis.ExtraiMes(dVencto);
            dVenctoVira := TpCondPag.dDataAssinatura;
            dIniFator := TpCondPag.dDataAssinatura;
          end
          else
          begin
            // Se não houve antecipação de parcelas, altera a data do prox. vencimento
            if not bAntecipa then
            begin
              dVenctoAnt := dVencto;
              dVencto := DiasUteis.SomaMeses(dVencto, 1);
              {Ajusta o dia do vencimento para o estipulado no contrato, pois o ultimo
               vencimento pode ter sido alterado na antecipação}
              DecodeDate(dVencto, iAnoNovo,iMesNovo,iDiaNovo);
              if iDiaNovo <> iDiaVencto then
                try
                  dVencto := EncodeDate(iAnoNovo,iMesNovo,iDiaVencto);
                except
                  dVencto := DiasUteis.UltDiaMes(iAnoNovo,iMesNovo);
                end;

              // Ajusta ultimo dia do mes
              iDiaNovo := DiasUteis.ExtraiDia(dVencto);
              iMesNovo := DiasUteis.ExtraiMes(dVencto);
              if iDiaNovo < iDiaVencto then
              begin
                while iDiaNovo < iDiaVencto do
                begin
                  dVencto := DiasUteis.SomaDias(dVencto, 1);
                  if iMesNovo <> DiasUteis.ExtraiMes(dVencto) then
                  begin
                    dVencto := DiasUteis.SomaDias(dVencto, -1);
                    Break;
                  end;
                  iDiaNovo := DiasUteis.ExtraiDia(dVencto);
                end;
              end;
            end;
          end;
        end;
        if bViraAno then
          dVenctoVira := dVencto;

        // Grava Registro de Saldo Inicial antes de fazer a Amortização
        if (bViraAno = True) or (iParc = 1) then
        begin
          if not qryParcTemp.Locate('IDCONDPAGIMOVEL;FLGTIPOLANC;DATAVENCIMENTO',VarArrayOf([iCondPag,1,dVencto]),[]) then
          begin
            qryParcTemp.Insert;
            qryParcTemp.FieldByName('IDPARCFINANCIMOV').asFloat  := LeUltRegistro(nil,'PARCFINANCIMOV');
            qryParcTemp.FieldByName('IDCONTRATOIMOVEL').asFloat  := TpCondPag.fIDContratoImovel;
            qryParcTemp.FieldByName('IDCONDPAGIMOVEL').asFloat   := TpCondPag.fIDCondInicial;
            qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger     := 1;
            qryParcTemp.FieldByName('NUMPARCELA').AsInteger      := 0;
            qryParcTemp.FieldByName('FATORCORRECAO').AsFloat     := 1;
          end
          else
            qryParcTemp.Edit;

          if iParc = 1 then
          begin
            qryParcTemp.FieldByName('DATAVENCIMENTO').asDateTime := TpCondPag.dDataAssinatura;
            qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat   := TpCondPag.fSaldoDev;
          end
          else
          begin
            qryParcTemp.FieldByName('DATAVENCIMENTO').asDateTime := dVencto;
            qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat   := fSaldoDev;
          end;
          qryParcTemp.Post;
        end;

        // Verifica se a Parcela já existe. Se não existir, cria uma.
        if not qryParcTemp.Locate('IDCONDPAGIMOVEL;NUMPARCELA',VarArrayOf([iCondPag,iParc]),[]) then
        begin
          sSql := 'SELECT * FROM PARCFINANCIMOV '+#13+
                  ' WHERE IDCONDPAGIMOVEL = ' + FloatToStr(TpCondPag.fIDCondInicial) +#13+
                  '   AND NUMPARCELA = ' + IntToStr(iParc);
          FazQuery(dtmBaseDados.qry, sSql);

          if not dtmBaseDados.qry.IsEmpty then
          begin
            MsgDlg('Erro ao gerar a parcela ' + IntToStr(iParc) + ' - duplicidade de lançamento', 'Erro', mtError, [mbok], 0);
            Abort;
          end
          else
          begin
            qryParcTemp.Append;
            qryParcTemp.FieldByName('IDPARCFINANCIMOV').asFloat := LeUltRegistro(nil,'PARCFINANCIMOV');
            qryParcTemp.FieldByName('IDCONTRATOIMOVEL').asFloat := TpCondPag.fIDContratoImovel;
            qryParcTemp.FieldByName('IDCONDPAGIMOVEL').asFloat  := TpCondPag.fIDCondInicial;
            qryParcTemp.FieldByName('NUMPARCELA').asFloat := iParc;
            qryParcTemp.FieldByName('FLGLANCINTEGRA').asInteger := 0;
            qryParcTemp.FieldByName('CODDOCUMENTO').Clear;
            qryParcTemp.FieldByName('PLNCODIGO').Clear;
            qryParcTemp.FieldByName('FLGCONCILIADO').Clear;
          end;
        end
        else
          qryParcTemp.Edit;

        // Zera valores que serão recalculados
        if qryParcTemp.FieldByName('CODDOCUMENTO').IsNull then
        begin
          qryParcTemp.FieldByName('VLRCORRSALDO').Clear;
          qryParcTemp.FieldByName('VLRPRESTATUALIZADA').Clear;
          qryParcTemp.FieldByName('VLRRESIDUOATUALI').Clear;
        end;

        fFatorMes := 1;
        bExisteCotacaoMes := True;
        iMesCorrAtu := FormatDateTime('MM', dVencto) + FormatDateTime('YYYY', dVencto);

        if iMesCorrAtu <> iMesCorrAnt then
        begin
          if dIniFator > dVencto then
            dIniFator := dVencto;

          // Verifica se a cotação do mes já foi cadastrada
          if TpCondPag.iMesRefReajuste = 0 then
            DecodeDate( dVencto, Ano, Mes, Dia )
          else
            DecodeDate( DiasUteis.SomaMeses(dVencto, (TpCondPag.iMesRefReajuste * -1)), Ano, Mes, Dia) ;

          // Paulo Nobre - WO24956 - Inicio
   //       LimpaParametros(dtmImobiliario.qryCotacoesIntervalo);
   //       dtmImobiliario.qryCotacoesIntervalo.ParamByName('INDICE').AsInteger   := TpCondPag.iIDIndCorr;
   //       dtmImobiliario.qryCotacoesIntervalo.ParamByName('ANOMESINI').AsString := IntToStrZeroPad(Ano, 4) + IntToStrZeroPad(Mes, 2);
   //       dtmImobiliario.qryCotacoesIntervalo.Open;
   //       bExisteCotacaoMes := not dtmImobiliario.qryCotacoesIntervalo.IsEmpty;

          // Paulo Nobre - WO25616 - Inicio
          sAnoMesCot := copy(iMesCorrAtu,3, 4) + copy(iMesCorrAtu, 1, 2);
          
          qryCotacao.Close;
          qryCotacao.Sql.Clear;
          qryCotacao.Sql.add('SELECT M.MOECODIGO, CM1.COTVALOR, CM1.COTMESREF, M.MOEDESC, M.MOESIGLA,           ');
          qryCotacao.Sql.add('       (SUBSTR(CM1.COTMESREF, 3, 4)||SUBSTR(CM1.COTMESREF, 1, 2)) AS ANOMES       ');
          qryCotacao.Sql.add('FROM COTACAOMOEDA CM1, MOEDA M                                                    ');
          qryCotacao.Sql.add('WHERE CM1.MOECODIGO = ' + IntToStr(TpCondPag.iIDIndCorr) );
          qryCotacao.Sql.add('      AND CM1.MOECODIGO = M.MOECODIGO                                             ');
          qryCotacao.Sql.add('      AND  TO_CHAR(CM1.COTDATA, ''YYYYMM'') = (SELECT MAX(TO_CHAR(CM2.COTDATA, ''YYYYMM''))  ');
          qryCotacao.Sql.add('                                               FROM COTACAOMOEDA CM2                         ');
          qryCotacao.Sql.add('                                               WHERE CM2.MOECODIGO = ' + IntToStr(TpCondPag.iIDIndCorr) );
//          qryCotacao.Sql.add('                                                     AND TO_CHAR(CM2.COTDATA, ''YYYYMM'') < '''' + IntToStrZeroPad(Ano, 4) + IntToStrZeroPad(Mes, 2) + '''' + ')' );
          qryCotacao.Sql.add('                                                     AND TO_CHAR(CM2.COTDATA, ''YYYYMM'') < ' + sAnoMesCot + ')' );
          qryCotacao.Open;
          // Paulo Nobre - WO25616 - Fim

          // Paulo Nobre - WO24601 - Inicio
          If TpCondPag.iIDIndCorr = 7 Then // INPC em %
//             fCotacaoMoedaValor := dtmImobiliario.qryCotacoesIntervalo.FieldByName('COTVALOR').asFloat / 100
             fCotacaoMoedaValor := qryCotacao.FieldByName('COTVALOR').asFloat / 100
          else
//             fCotacaoMoedaValor := dtmImobiliario.qryCotacoesIntervalo.FieldByName('COTVALOR').asFloat;
             fCotacaoMoedaValor := qryCotacao.FieldByName('COTVALOR').asFloat;
          // Paulo Nobre - WO24601 - Fim

          // Paulo Nobre - WO24956 - Fim

          if (TpCondPag.dDataVencimento <= dDataBase) and (bExisteCotacaoMes) then
          begin
            if TpCondPag.iIDIndCorr > 0 then
              if TpCondPag.iMesRefReajuste = 0 then
                fFatorMes := dtmFinanciamento.CalculaFatorCorrecao(TpCondPag.iIDIndCorr,
                                                                   dIniFator, dVencto, True)
              else
                fFatorMes := dtmFinanciamento.CalculaFatorCorrecao(TpCondPag.iIDIndCorr,
                                                                      DiasUteis.SomaMeses(dIniFator, (TpCondPag.iMesRefReajuste * -1) ),
                                                                      DiasUteis.SomaMeses(dVencto,   (TpCondPag.iMesRefReajuste * -1) ), True);
          end
          else
            if TpCondPag.iIDIndProj > 0 then
              if TpCondPag.iMesRefReajuste = 0 then
                fFatorMes := dtmFinanciamento.CalculaFatorCorrecao(TpCondPag.iIDIndProj,
                                                                   dIniFator, dVencto, True)
              else
                fFatorMes := dtmFinanciamento.CalculaFatorCorrecao(TpCondPag.iIDIndProj,
                                                                   DiasUteis.SomaMeses(dIniFator, (TpCondPag.iMesRefReajuste * -1) ),
                                                                   DiasUteis.SomaMeses(dVencto,   (TpCondPag.iMesRefReajuste * -1) ), True)
            else
              if TpCondPag.fCorrecaoProj > 0 then
                fFatorMes := 1 + TpCondPag.fCorrecaoProj;

          fFator := fFator * fFatorMes;
          iMesCorrAnt := iMesCorrAtu;
        end;

        {Verifica o tipo de parcela (2 - Sinal, 3 - Parc Gerada, 4 - Parc Projetada
                                     7 - Venda a Vista, 8 - Caução)}
        if TpCondPag.sTipoCondPag = 'S' then
          qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 2;

        if TpCondPag.sTipoCondPag = 'V' then
          qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 7;

        if TpCondPag.sTipoCondPag = 'C' then
          qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 8;

        {Altera o Tipo de Parcela Projetada ou Gerada, apenas se a mesma não foi antecipada
         e o indice de reajuste já foi cadastrado no global}
        if qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger <> 9 then
        begin
          if (TpCondPag.sTipoCondPag = 'P') or
             (TpCondPag.sTipoCondPag = 'R') then
          begin
            if (TpCondPag.iIDIndCorr = 0) and (TpCondPag.iIDIndProj = 0) then
              qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 3
            else
            begin
              iMesHoje := StrToInt(IntToStr(DiasInUteis.ExtraiAno(dDataBase)) + FormatFloat('00',DiasInUteis.ExtraiMes(dDataBase)));
              iMesVenc := StrToInt(IntToStr(DiasInUteis.ExtraiAno(dVencto))   + FormatFloat('00',DiasInUteis.ExtraiMes(dVencto)));

              // Só muda o status se existir a cotação do mes de processamento
              if bExisteCotacaoMes then
                qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 3
              else
                qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 4;
            end;
          end;
        end;
        // Grava o default para o Saldo devedor atual
        if qryParcTemp.FieldByName('CODDOCUMENTO').IsNull then
          qryParcTemp.FieldByName('VLRSALDOATUAL').AsFloat := fSaldoDev;

        // Define a taxa de juros a ser aplicada.
        if bAntecipaProx then
          fTaxaJuros := 0
        else
        begin
          if (iParc = 1) and
             (DiasUteis.ExtraiDia(TpCondPag.dDataAssinatura) <> DiasUteis.ExtraiDia(TpCondPag.dDataVencimento)) and
             (TpCondPag.bJurosCarencia) then
            fTaxaJuros := ComunsImobiliario.ProRata(TpCondPag.fTaxaJurosAjust,
                                                    TpCondPag.dDataAssinatura,
                                                    TpCondPag.dDataVencimento,
                                                    TpCondPag.iPeriodoMeses)
          else
            fTaxaJuros := TpCondPag.fTaxaJurosAjust;
        end;

        {Calcula a Taxa de Juros Pro-Rata para parcelas antecipadas e
         proxima parcela pós antecipação}
        if ((qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9) and
            (qryParcTemp.FieldByName('DATAVENCIMENTO').AsDateTime <> dVenctoAnt)) or
           (bAntecipaAnt) then
          if qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9 then
            fTaxaJuros := ComunsImobiliario.ProRata(TpCondPag.fTaxaJurosAjust,
                                                    dVenctoAnt,
                                                    qryParcTemp.FieldByName('DATAVENCIMENTO').AsDateTime,
                                                    TpCondPag.iPeriodoMeses)
          else
            fTaxaJuros := ComunsImobiliario.ProRata(TpCondPag.fTaxaJurosAjust,
                                                    dVenctoAnt,
                                                    dVencto,
                                                    TpCondPag.iPeriodoMeses);

        //fTaxaJurosAcum := ((fTaxaJurosAcum + 1) * (fTaxaJuros + 1)) -1;

        // Grava os valores da parcela (valor, vencto, juros, amortizacao e saldo devedor)
        if qryParcTemp.FieldByName('CODDOCUMENTO').IsNull then
        begin
          if qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9 then
          begin
            {Se a anterior também foi antecipada, mantem o saldo devedor da anterior
             para efeito de calculo do juros por antecipação}
            if not bAntecipaProx then
              fSaldoDevAntec := fSaldoDev;

            // Calcula o juros pró-rata por antecipação
            fVlrJurosAntec := CalcAntecipacao(TpCondPag.iFormaCalculo,iCondPag,iParc,
                                              qryParcTemp.FieldByName('DATAVENCIMENTO').AsDateTime, dVenctoAnt,
                                              fSaldoDevAntec, fPrestacao, (fSaldoDev * TpCondPag.fTaxaJurosAjust),
                                              fTaxaJuros, bAntecipaProx);

            dVencto := qryParcTemp.FieldByName('DATAVENCIMENTO').asDateTime;
          end
          else
            qryParcTemp.FieldByName('DATAVENCIMENTO').asDateTime := dVencto;

          // Paulo Nobre - WO20652 - Inicio
          // Registra o valor do juros sobre parcela
          {   if (iParc = 1) then
               qryParcTemp.FieldByName('VLRJUROSPARC').asFloat := ComunsImobiliario.Arredonda(fNominal * ((fFatorMes) *(1 + fTaxaJuros)-1),2)
             else
               qryParcTemp.FieldByName('VLRJUROSPARC').asFloat := ComunsImobiliario.Arredonda(fParcelaAnterior * ((fFatorMes) *(1 + fTaxaJuros)-1),2);
          }
          // Paulo Nobre - WO20652 - Fim

          // WO17768 - Fim

          qryParcTemp.FieldByName('VLRJUROS').Clear;

          // Paulo Nobre - WO24601 - Inicio
          // Rotinas comentadas abaixo não fazem mais sentido

          // Registra o valor da prestação, amortização e saldo devedor amortizado
//          qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat := ComunsImobiliario.Arredonda(fSaldoDev / iParcRestante,2);
  //        qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat := ComunsImobiliario.Arredonda(fSaldoDev - qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat,2);

          //WO24125 - Leandro - inicio
//          if (iParc = 1) and (fParcelaAnterior = 0) then
//          begin
//            fParcelaAnterior := qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat;
//          end;
          //WO24125 - Leandro - Fim

          // Paulo Nobre - WO24601 - Fim

          qryParcTemp.FieldByName('VLRNOMINAL').asFloat := ComunsImobiliario.Arredonda(fNominal,2);
          qryParcTemp.FieldByName('FATORCORRECAO').AsFloat := fFatorMes;
          qryParcTemp.FieldByName('FLGRESIDUOINCORP').AsString := 'N';

          // Paulo Nobre - WO24601 - Inicio
    //      qryParcTemp.FieldByName('VLRPRESTACAO').asFloat := ComunsImobiliario.Arredonda(fParcelaAnterior * (1 + (fFatorMes * (1 + fTaxaJuros) - 1)), 2);
         // Paulo Nobre - WO24601 - Fim

          qryParcTemp.FieldByName('VLRRESIDUOATUALI').asFloat := 0;
          qryParcTemp.FieldByName('IDINDCORRECAO').AsInteger := TpCondPag.iIDIndCorr;

          // Paulo Nobre - WO24601 - Inicio

          // Paulo Nobre - WO20652 - Inicio
          // qryParcTemp.FieldByName('VLRJUROSPARC').asFloat := qryParcTemp.FieldByName('VLRPRESTACAO').asFloat - qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat;
          // Paulo Nobre - WO20652 - Fim

          // Implementando nova rotina para cálculo do valor da prestação, baseado nos métodos de cálculos usados na
          // planilha de cálculo usada pela Área. Desta forma fica mais simples e fácil de fazer testes e evidencias.

          qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat := ComunsImobiliario.Arredonda(fSaldoDev / iParcRestante,2);
          qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat := ComunsImobiliario.Arredonda(fSaldoDev - qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat,2);

          // Paulo Nobre - WO24946 - Inicio

          // Amortização + Juros
//          qryParcTemp.FieldByName('VLRPRESTACAO').asFloat := ComunsImobiliario.Arredonda(qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat + qryParcTemp.FieldByName('VLRJUROSPARC').asFloat,2);

          // Paulo Nobre - WO24601 - Fim


//          fPercJurosTotal := 1 + (fCotacaoMoedaValor + fTaxaJuros);

          // Juros total = INPC * Prêmio Mensal  - "(1+H15)*(1+$E$11)-1"
          fPercJurosTotal := 1 + (((1 + fCotacaoMoedaValor) * (1 + fTaxaJuros)) - 1);

          if (iParc = 1) then
          Begin
            // Valor da Prestação = Valor da Amortização * fPercJurosTotal
            qryParcTemp.FieldByName('VLRPRESTACAO').asFloat := ComunsImobiliario.Arredonda(qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat * fPercJurosTotal,2,true);

            // Valor do Juros Mensal
            qryParcTemp.FieldByName('VLRJUROSPARC').asFloat := qryParcTemp.FieldByName('VLRPRESTACAO').asFloat - qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat;
          end
          else
          Begin

             // Paulo Nobre - WO25616 - Inicio
             //
             // Rotina implementada para recuperar o valor do alterador quando lançado para ajustar o valor da parcela.
             // Mais necessário no caso do contrato do CABO DE SANTO AGOSTINHO o qual as parcelas foram calculadas
             // erradas desde o inicio
             //
             qryBuscaParcelaAnterior.Close;
             qryBuscaParcelaAnterior.Sql.Clear;
             qryBuscaParcelaAnterior.Sql.add('SELECT NVL(CODDOCUMENTO,0) CODDOCUMENTO   ');
             qryBuscaParcelaAnterior.Sql.add('FROM CM.PARCFINANCIMOV                    ');
             qryBuscaParcelaAnterior.Sql.add('WHERE IDCONDPAGIMOVEL = ' + floattostr(iCondPag)  );
             qryBuscaParcelaAnterior.Sql.add('      AND NUMPARCELA = ' + inttostr(iparc - 1)    );   // Parcela anterior
             qryBuscaParcelaAnterior.Sql.add('      AND CODDOCUMENTO <> 0               ');
             qryBuscaParcelaAnterior.Open;
             if not qryBuscaParcelaAnterior.EOF Then
             Begin                             // Por encontrar o CODDOCUMENTO significa que teve alterador de ajuste lançado
                qryParcelaAlterador.Close;
                qryParcelaAlterador.Sql.Clear;
                qryParcelaAlterador.Sql.add('SELECT NVL(VALOR,0) VALOR                  ');
                qryParcelaAlterador.Sql.add('FROM CM.LANCTODOCUM                        ');
                qryParcelaAlterador.Sql.add('WHERE CODDOCUMENTO = ' + qryBuscaParcelaAnterior.FieldByName('CODDOCUMENTO').asString   );
                qryParcelaAlterador.Sql.add('      AND OPERACAO = 4                     '); // CODALTERADOR = 314 - Acréscimo (Alien. Hotel)
                qryParcelaAlterador.Open;

                fParcelaAnterior := fParcelaAnterior + qryParcelaAlterador.FieldByName('VALOR').asFloat;
             End;
            // Paulo Nobre - WO25616 - Fim

            // Valor da Prestação = Valor da Parcela Anterior * fPercJurosTotal
            qryParcTemp.FieldByName('VLRPRESTACAO').asFloat := ComunsImobiliario.Arredonda(fParcelaAnterior * fPercJurosTotal,2,true);

            // Valor do Juros Mensal
            //qryParcTemp.FieldByName('VLRJUROSPARC').asFloat := qryParcTemp.FieldByName('VLRPRESTACAO').asFloat - fParcelaAnterior;                                //WO37133 Leandro
            qryParcTemp.FieldByName('VLRJUROSPARC').asFloat := qryParcTemp.FieldByName('VLRPRESTACAO').asFloat - qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat; //WO37133 Leandro
          End;

          // Paulo Nobre - WO24946 - Fim

          Result    := Result + qryParcTemp.FieldByName('VLRPRESTACAO').asFloat;
          qryParcTemp.Post;
        end;
      end;

      // Incrementa a parcela de juros cobrada no período de Carencia
      if (TpCondPag.bJurosCarencia) and (dVencto < TpCondPag.dDataIniAmortiz) then
        Inc(iParcCarencia);

      //Cássio Rovaroto - WO 19287 - Inìcio
      //if (iParc = 2) and (iCondPag = 4229) then
      //  fParcelaAnterior := 1610459.18

      // Paulo Nobre - WO25616 - Inicio

      // Paulo Nobre - WO20652 - Inicio
      //
      // Contrato especifico do CABO DE SANTO AGOSTINHO
      // Acerto paliativo quando encontrado erros nas parcelas
      //
  {    if (iCondPag = 4229) then
        case iParc of
          2: fParcelaAnterior := 1610459.18;
          3: fParcelaAnterior := 1616377.31;
          4: fParcelaAnterior := 1646327.48;
          7: fParcelaAnterior := 1674908.85;  // Parcela 7 - Mês de Junho com Valor da parcela de Maio
        else
          fParcelaAnterior := qryParcTemp.FieldByName('VLRPRESTACAO').asFloat;
        end
      else     }

      fParcelaAnterior := qryParcTemp.FieldByName('VLRPRESTACAO').asFloat;
      //Cássio Rovaroto - WO 19287 - Fim

      // Paulo Nobre - WO20652 - Fim

      // Paulo Nobre - WO25616 - Fim

      fSaldoDev := fSaldoDev - qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat;

      FrmAguarde.Pos := prg;
      Application.ProcessMessages;
      Inc(Prg);

      // Testa se a parcela corrente foi Antecipada e a proxima será antecipada para ajuste do prox. vencto.
      if (qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9) and (bAntecipaProx) then
        bAntecipa := True
      else bAntecipa := False;

      // Testa se a parcela corrente foi Antecipada
      if (qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9) then
        bAntecipaAnt := True
      else bAntecipaAnt := False;
    end;
  finally
    // Paulo Nobre - WO24956 - Inicio
    qryCotacao.Close;
    qryCotacao.Free;
    // Paulo Nobre - WO24956 - Fim

    // Paulo Nobre - WO25616 - Inicio
    qryBuscaParcelaAnterior.Close;
    qryBuscaParcelaAnterior.Free;
    qryParcelaAlterador.Close;
    qryParcelaAlterador.Free;
    // Paulo Nobre - WO25616 - Fim

    qryParcTemp.EnableControls;
    FrmAguarde.Apaga;
  end;
  qryParcTemp.First;

end;

end.
