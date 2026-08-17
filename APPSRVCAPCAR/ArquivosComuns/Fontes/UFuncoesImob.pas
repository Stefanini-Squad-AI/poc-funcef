unit UFuncoesImob;

// -------------------------------------------------------------------------------------------------
//
//       Death is lighter than a feather;
//       Duty, heavier than a mountain...
//
//                               Rand Al'Thor
//
//	-------------------------------------------------------------------------------------------------
//   *   ª   º   ²   ¹   ¼   ½   ¾
//	-------------------------------------------------------------------------------------------------
//       ATENÇÃO: UFuncoesImob NECESSITA dos DataModules:
//                - dImobiliario / dtmImobiliario;
//	-------------------------------------------------------------------------------------------------

interface

uses
  SysUtils, Math, wwQuery, wwDBGrid, Forms, ComCtrls, StdCtrls, Mask, Dialogs, MontaSelect, Classes;

   // retorna a descricao do erro da integração
   function DescricaoErro(const iFlgErro: integer): string;

   // retorna a origem do lançamento em string
   function OrigemLancamento(const cOrigemLanc: char): string;

   // retorna o nome do mes por extenso
   function MesExtenso(const iMes: integer): string;

   // Abre a query de Parametros do Sistema
   function ParametrosSistema: boolean;

   // função de arredondamento de valores
   function Arredonda(fValor: extended; iDecimais: word): extended;

   // Retorna um número formatado no padrão Ingles (".") --> formato do banco
   function NumeroIngles(fValor: extended): string;

   // procedimentos para manipulação de barras de progressão
   procedure MostraProgresso(var Barra: TProgressBar; var Legenda, Contador: TLabel; fMaximo: double; sLegenda: string);
   procedure AndaProgresso(var Barra: TProgressBar; var Legenda, Contador: TLabel; fPosicao, fMaximo: double);
   procedure EscondeProgresso(var Barra: TProgressBar; var Legenda, Contador: TLabel);

   // manipulação de TwwQueries --------------------------------------------------------------------
   procedure LimpaParametros(const qry: TwwQuery);
   procedure AtribuiSQL(qry: TwwQuery; const sTextoSQL: string);
   function ExecutaQuery(qry: TwwQuery; const str: string): boolean;
   function FazQuery(var qry: TwwQuery; str: string): boolean;
   // ----------------------------------------------------------------------------------------------

   // manipulação de Strings --------------------------------------------------------------------
   function CompletaInicio(sOriginal, sCompleta: string; iLimiteTamanho: word): string;
   function CompletaFim(sOriginal, sCompleta: string; iLimiteTamanho: word): string;
   // ----------------------------------------------------------------------------------------------
   
type
   TParamContabeis = Record
      sContaContabilDebito    : string;
      sSubContaDebito         : string;
      sCentroCustoDebito      : string;
      sContaContabilCredito   : string;
      sSubContaCredito        : string;
      sCentroCustoCredito     : string;
      sHistorico              : string;
      sHist1, sHist2, sHist3, sHist4, sHist5 : string;
      iPlanilha               : integer;
      iExercicio              : integer;
      iPeriodo                : integer;
      iIdRateioDocum          : double;
      iCodDocumento           : integer;

      // campos inseridos devidos a nova parametrização contábil
      // morte da tabela CUSTOSRECXIMOVEIS
      sContaDebCred           : string;
      sContaResult            : string;
      sCentroCustoDebCred     : string;
      sCentroCustoResult      : string;
      iUnidNegoc              : integer;
      sSubContaDebCred        : string;
      sSubContaResult         : string;
      sCodTipRecDes           : string;
      iFlgIntegraCapCar       : integer;
      iFlgIntegraContab       : integer;
      sCodCentroRespon        : string;
      sTipCodigo              : string;
   end;

   TFuncoesImob = Class
   private
      procedure CriaGrupoNovo(sCodigo: string);
      procedure InsereImovelGrupo(const iGrupo, iImovel: integer; fPercent: double);

      function  DesfazCobraDiverge(const iDocumento: Integer) : Boolean;

   public

      // registra o erro da integração
      function RegistraErroDocumento(const iDocumento, iFlgErro: integer): Boolean;

      // função de busca de cotação de moeda
      function BuscaCotacao(iMoeda: integer; dDataCotacao : TDateTime; bDataExata: boolean): extended;

      // função de conversão de moeda (já devolve o valor convertido)
      function ConverteMoeda(iMoeda: integer; fValor: currency; dData: TDateTime; bDataExata: boolean): currency;
      function ReConverteMoeda(iMoeda: integer; fValor: currency; dData: TDateTime; bDataExata: boolean): currency;

      // calcula o fator de correção (baseado em 1 índice) entre 2 determinadas datas
      function CalculaFatorCorrecao(iIndice: integer; dDataIni, dDataFim: TDateTime; bPodeNegativo: boolean): double;

      // exclui um lançamento do Imobiliário
      function ExcluiLancImovel(const iDocumento, iPlanilha: int64; const dData: TDateTime; const bIntegradoCAR, bIntegradoCTB: boolean; var sErro: string; const iLancImovel: Integer = -1): shortint;

      // estorna um lançamento do Imobiliário
      function EstornaLancImovel(const iDocumento, iCodDocumento, iPlanilha: integer; dDataEstorno: TDateTime): shortint;

      // verifica em que dia deve vencer o aluguel do contrato em um determinado mês/ano
      function DataVencAluguel(iContrato, iAno, iMes: integer; sTipoAluguel: char;
               bSomaTolera: boolean): TDateTime;

      function AgrupaDocumentos(iMesCompetencia, iAnoCompetencia: integer; dDataVencIni, dDataVencFim: TDateTime;
               BarraProgresso: TProgressBar; Legenda, Contador: TLabel): shortint;

      function PreencheMsgLinhaBoleto(iMsgBoleto: integer; iLinha: byte): string;

      // função que atualiza a flag de ocupação de 1 ou mais imoveis
      function AtualizaOcupacao(iImovel, iContrato: integer; sOcupacao: string; bMostraMsg: boolean): boolean;

      // Traz um valor histórico (atualização monetária + correção monetária) p/ valor presente
      procedure TrazAValorPresente(var fValor: extended; dDataHistorica, dDataPresente: TDateTime; fFator: extended; sTipoConversao: string);

      // "Calcula" a data de lançamento default a partir de um mes e uma Data de Vencimento
      function DataLancamento(iMes, iAno: integer; dDataVenc: TDateTime): TDateTime;

      // Mascara um CPF ou CGC
      function FormataCPFCGC(const CPFCGC: string): string;

      // Cria um grupo de rateio baseado no código
      function GeraGrupoRateio(const sCodigoGrupo: string; fArea, fAreaGerencial: double): string;

      // incrementa o número do contrato (de acordo com parâmetros do sistema)
      function IncrementaContrato: string;

      // calcula o custo contábil
      function CC_Imovel(const iImovel: integer; dData: TDateTime): extended;
      function CC_Mestre(const iMestre: integer; dData: TDateTime): extended;

      // Funções de Manipulação de Observação de Lançamentos ---------------------------------------
      function SelectObsLanc(const iDocumento: integer): string;
      function InsertObsLanc(const iDocumento: integer; sObs: string): shortint;
      function UpdateObsLanc(const iDocumento: integer; sObs: string): shortint;
      function DeleteObsLanc(const iDocumento: integer): shortint;
      // -------------------------------------------------------------------------------------------

      // Funções de Manipulação de Mensagens para Boletos ------------------------------------------
      procedure SelectMsgLanc(const iDocumento: int64);
      function InsertMsgLanc(const iDocumento: int64; const sCabecalho, sTipoContrato: string;
               const iCuringa: integer; const vMsg: array of string): int64;
      procedure UpdateMsgLanc(const iDocumento: int64; const vMsg: array of string);
      procedure DeleteMsgLanc(const iDocumento: integer);
      procedure SubstituiCuringa(var vMsg: array of string; const vCuringa, vValor: array of string);
      // -------------------------------------------------------------------------------------------

      // Retorna a máscara do Plano de Contas
      function GetMascaraPlano(iPlano: integer): string;

      // Gera um nº de documento único
      function GeraNoDocumento(c: char): extended;

      // Funções de busca da nova parametrização ---------------------------------------------------

      // Abre a qryPadrLanc de acordo com os parâmetros passados
      // bDiario = true pega a parametrização diária da receita/despesa
      procedure AbrePadrLanc(const sRecPag, sTipoImovel: string; const iEmpresaProp, iModulo,
                iTipoRecDes, iImovel, iContrato: int64; const bDiario: boolean);

      // Função que busca na tabela PadrLancContInv o conjunto de parâmetros de integração mais
      // apropriado, dadas as condições passadas. Mesma função p/ Operação quanto p/ Despesa de Operação
      // bDiario = true pega a parametrização diária da receita/despesa
      function BuscaPadrLanc(const sRecPag, sTipoImovel: string; const iEmpresaProp, iModulo,
               iTipoRecDes, iImovel, iContrato: int64; var ParamIntegra: TParamContabeis; const bDiario: boolean = false): integer;

      // -------------------------------------------------------------------------------------------

	end;



var
  FuncoesImob : TFuncoesImob;



implementation
uses
   dBaseDados, uDataBase, uSistema, uDocumento, uModulo, uDiasInUteis, dImobiliario, uLancContab,
   uIntegraBack, uMensErro, uFuncaoGeral, uOrcamento, dLancImovel, uCalcDocumento, fProgresso;



// retorna a descricao do erro da integração
function DescricaoErro(const iFlgErro: integer): string;
begin
   case iFlgErro of
      //DefineParamContabeis
      -1: Result := 'Erro -1 = Conta contábil de débito não informada';
      -2: Result := 'Erro -2 = Sub conta contábil de débito obrigatória mas não informada';
      -3: Result := 'Erro -3 = Centro de Custos da conta de débito obrigatório mas não informado';
      -4: Result := 'Erro -4 = Conta contábil de crédito não informada';
      -5: Result := 'Erro -5 = Sub conta contábil de crédito obrigatória mas não informada';
      -6: Result := 'Erro -6 = Centro de Custos da conta crédito obrigatório mas não informado';
      -7: Result := 'Erro -7 = Ambiguidade de parametrização';
      -8: Result := 'Erro -8 = Nenhuma parametrização atende o lançamento';
      -9: Result := 'Erro -9 = Tipo de Recebimento / Desembolso Inativo';
      -10:Result := 'Erro -10 = Ambiguidade de parametrização do segundo lançamento contábil';
      -11:Result := 'Erro -11 = Nenhuma parametrização atende ao segundo lançamento contábil';


      //VerificaCondicoes
      -12: Result := 'Erro -12 = Código de tipo de desembolso não informado';
      -13: Result := 'Erro -13 = Código de tipo de recebimento não informado';
      -14: Result := 'Erro -14 = Unidade de negócio não informado';
      -15: Result := 'Erro -15 = Código de centro de responsabilidade não informado';
      -16: Result := 'Erro -16 = Número de documento inválido';
      // -17: ERA USADO COM O FLGESTORNADO NULL - ANTES FLGESTORNADO GUARDAVA O CODDOCUMENTO
      -18: Result := 'Erro -18 = Tipo código não informado';
      -19: Result := 'Erro -19 = Centro de Custo inativo para conta contábil';

      //FazerLancamentoContab
      -20: Result := 'Erro -20 = Data não pertence a nehum período';
      -21: Result := 'Erro -21 = Data pertence a mais de um período';
      -22: Result := 'Erro -22 = Período bloqueado na contabilidade';
      -23: Result := 'Erro -23 = Período já integrado. Lançamentos bloqueados';
      -24: Result := 'Erro -24 = Erro genérico funcao Testa Periodo';
      -25: Result := 'Erro -25 = Erro genérico funcao Fazer Lançamento Contabilidade';
      -26: Result := 'Erro -26 = Erro genérico função Fazer Lançamento Contabilidade';
      -27: Result := 'Erro -27 = Erro genérico função Fazer Lançamento Contabilidade';

      //Integração CAPCAR
      -30: Result := 'Erro -30 = Existem documentos com o mesmo número e parametização diferentes';
      -31: Result := 'Erro -31 = Não conseguiu criar o documento e o lançamento';
      -32: Result := 'Erro -32 = Não conseguiu criar o rateio do documento';
      -33: Result := 'Erro -33 = Erro ao atualizar "Número do Imóvel" ao lançar rateio de documento';
      -34: Result := 'Erro -34 = Erro genérico na integração do contas à pagar/receber';

      //Funçao SetMensagem
      -37: Result := 'Erro -37 = Erro genérico na função de Mensagem do Boleto';
      -38: Result := 'Erro -38 = Erro genérico na função de Mensagem do Boleto';

      //Integra
      -40: Result := 'Erro -40 = Erro ao atualizar Lançamentos Imovel';

      //Alimenta Carteira
      -45: Result := 'Erro -45 = O Imóvel não consta em nenhuma Carteira de Investimento!';
      -46: Result := 'Erro -46 = Não foi possível alimentar a Carteira de Investimento!';

      //Contabilizar ou Financeiro
      -50: Result := 'Erro -50 = É necessário que os parâmetros sejam marcados para Integração na Contabilidadeo ou no Contas a pagar/receber.';

      //Responsável pela Cobrança
      -55: Result := 'Erro -55 = A tabela de parâmetros do sistema está vazia.';
      -56: Result := 'Erro -56 = Despesas sob responsabilidade do Locatário.';
      -57: Result := 'Erro -57 = Verificar Parâmetro do Sistema '+#13+''' Despesas de responsabilidade do Locatário .''';

      // integração com o Orçamento
      -60: Result := 'Erro -60 = Usuário corrente sem alçada para criar o Compromisso';
      -61: Result := 'Erro -61 = Existem Compromissos entre as Reservas passadas como parâmetro';
      -62: Result := 'Erro -62 = Existem Reservas Canceladas ou Efetivadas entre as Reservas passadas como parâmetro';
      -63: Result := 'Erro -63 = Existem Reservas com Contas Orçamentárias diferentes entre as Reservas passadas como parâmetro';
      -64: Result := 'Erro -64 = Houve um erro inesperado no Banco de Dados';
      -65: Result := 'Erro -65 = Novo erro não identificado na função CriaCompromisso';

      -66: Result := 'Erro -66 = Usuário corrente sem alçada para a Efetivação';
      -67: Result := 'Erro -67 = O número enviado é de uma Reserva Orçamentária, não de um Compromisso';
      -68: Result := 'Erro -68 = O número enviado é de um Compromisso já Cancelado';
      -69: Result := 'Erro -69 = O número enviado é de um Compromisso já Efetivado';
      -70: Result := 'Erro -70 = Houve um erro inesperado no Banco de Dados';
      -71: Result := 'Erro -71 = O valor passado como parâmetro é maior que o valor do compromisso';
      -72: Result := 'Erro -72 = Novo erro não identificado na função EfetivaCompromisso';

      -75: Result := 'Erro -75 = Algum erro genérico na integração com o Orçamento';

      // geração do reembolso automático
      -80: Result := 'Erro -80 = Falta parametrização do lançamento de receita referente ao reembolso automático.';
      -81: Result := 'Erro -81 = Erro genério na criação do reembolso.';

      // integração dos alteradores
      -85: Result := 'Erro -85 = Não consegui integrar o(s) alterador(es).';

      // Obriga liberação
      -90: Result := 'Erro -90 = Receita de imóvel que nunca foi locado.';
      -91: Result := 'Erro -91 = Despesa de imóvel inativo.';
      -92: Result := 'Erro -92 = Registro contábil fora da competência gerencial.';

   else
      if iFlgErro < 0 then
         Result := 'Erro: '+inttostr(iFlgErro)+' - não tratado'
      else
         Result := '';
   end;

end;




// retorna a origem do lançamento em string
function OrigemLancamento(const cOrigemLanc: char): string;
begin
   case cOrigemLanc of
      'A' : Result := 'Acréscimo de Valor';
      'C' : Result := 'Aquisição à Vista';
      'D' : Result := 'Lançamento de Dívidas';
      'E' : Result := 'Lançamento de Reembolso';
      'F' : Result := 'Folha de Aluguéis';
      'G' : Result := 'Acerto de Divergências';
      'I' : Result := 'Importação';
      'L' : Result := 'Lançamento Individual';
      'M' : Result := 'Lançamento Múltiplo';
      'O' : Result := 'Obras';
      'P' : Result := 'Prestação de Contas';
      'R' : Result := 'Folha de Remunerações';
      'S' : Result := 'Alienação à Vista';
      'T' : Result := 'Lançamento com Rateio';
      'V' : Result := 'Lançamento de Previsão';
      // TODO -oAndre : se for feita alteração aqui, alterar no molOrigemLanc
   else
      Result := '';
   end;
end;


// =================================================================================================
//    Manipulação de Strings
// =================================================================================================

function CompletaInicio(sOriginal, sCompleta: string; iLimiteTamanho: word): string;
var
   i     : Integer;
   sAux  : String;
begin
   sAux := '';
   for i := 1 to iLimiteTamanho do sAux := sAux + sCompleta;

   Result := copy((sAux + sOriginal), (length((sAux + sOriginal)) - (iLimiteTamanho - 1)), iLimiteTamanho);
end;

function CompletaFim(sOriginal, sCompleta: string; iLimiteTamanho: word): string;
var
   i     : Integer;
   sAux  : String;
begin
   sAux := '';
   for i := 1 to iLimiteTamanho do sAux := sAux + sCompleta;

   Result := copy((sOriginal + sAux), 1, iLimiteTamanho);
end;


// retorna o nome do mes por extenso
function MesExtenso(const iMes: integer): string;
begin
   case iMes of
       1: Result := 'Janeiro';
       2: Result := 'Fevereiro';
       3: Result := 'Março';
       4: Result := 'Abril';
       5: Result := 'Maio';
       6: Result := 'Junho';
       7: Result := 'Julho';
       8: Result := 'Agosto';
       9: Result := 'Setembro';
      10: Result := 'Outubro';
      11: Result := 'Novembro';
      12: Result := 'Dezembro';
   else
      Result := '';
   end;
end;



//==================================================================================================

function NumeroIngles(fValor: extended): string;
var
   cAux : char;
begin
   cAux := DecimalSeparator;
   DecimalSeparator  := '.';

   Result := FloatToStr(fValor);

   DecimalSeparator  := cAux;
end;



//==================================================================================================
//    Funções ligadas a moeda / cotação
//==================================================================================================

function TFuncoesImob.BuscaCotacao(iMoeda: integer; dDataCotacao : TDateTime; bDataExata: boolean): extended;
var
   qryCotacao : TwwQuery;
begin
   // escolhe qual query usar de acordo com o tipo de cotação
   if bDataExata then begin
      qryCotacao := TwwQuery(dtmImobiliario.qryCotacaoExata);
   end else begin
      qryCotacao := TwwQuery(dtmImobiliario.qryCotacaoNaoExata);
   end;

   with qryCotacao do begin
      LimpaParametros(qryCotacao);

      ParamByName('MOEDA').AsInteger   := iMoeda;
      ParamByName('DATA').AsDateTime   := dDataCotacao;

      Open;
      First;
   end;

   // retorna -1 se não houver cotação
   if qryCotacao.IsEmpty then begin
      Result := -1;
   end else begin
      Result := qryCotacao.FieldByName('COTVALOR').AsFloat;
   end;
end;

//--------------------------------------------------------------------------------------------------

function TFuncoesImob.ConverteMoeda(iMoeda: integer; fValor: currency; dData : TDateTime; bDataExata: boolean): currency;
var
   fFator : extended;
begin
   // a princípio, presume-se que não há conversão: a moeda é a corrente
   fFator := 1;

   // só busca cotações e converte se a moeda for diferente da moeda corrente
   if iMoeda <> Modulo.iMoedaCorrente then fFator := BuscaCotacao(iMoeda, dData, bDataExata);

   if fFator = -1 then begin
      Result   := -1;
   end else begin
      Result   := fValor * fFator;
   end;
end;

//--------------------------------------------------------------------------------------------------

function TFuncoesImob.ReConverteMoeda(iMoeda: integer; fValor: currency; dData: TDateTime; bDataExata: boolean): currency;
var
   fFator : extended;
begin
   // a princípio, presume-se que não há conversão: a moeda é a corrente
   fFator := 1;

   // só busca cotações e converte se a moeda for diferente da moeda corrente
   if iMoeda <> Modulo.iMoedaCorrente then fFator := BuscaCotacao(iMoeda, dData, bDataExata);

   if fFator = -1 then begin
      Result   := -1;
   end else begin
      if fFator = 0 then begin
         Result   := 0;
      end else begin
         Result   := fValor / fFator;
      end;
   end;
end;

//--------------------------------------------------------------------------------------------------

function TFuncoesImob.CalculaFatorCorrecao(iIndice: integer; dDataIni, dDataFim: TDateTime; bPodeNegativo: boolean): double;
var
   sTipoCotacao, sPeriodicidade, sAnoIni, sMesIni, sAnoFim, sMesFim : string;
   fCotacaoIni, fCotacaoFim, fFatorCorrecao : extended;
begin
   fFatorCorrecao := 1;

   // primeiro verifica a periodicidade e tipo da cotação
   with dtmImobiliario.qryIndice do begin
      LimpaParametros(dtmImobiliario.qryIndice);
      ParamByName('MOEDA').AsInteger := iIndice;

      Open;

      // se não se encontrar a moeda ou se as flags forem nulas, sai com Resultado 1
      if ( (dtmImobiliario.qryIndice.IsEmpty) or (dtmImobiliario.qryIndiceFLGPERCVALOR.isNull) or (dtmImobiliario.qryIndiceMOEPERIODICIDADE.isNULL) ) then begin
         Result := 1;
         dtmImobiliario.qryIndice.Close;
         Exit;
      end;

      sTipoCotacao      := dtmImobiliario.qryIndiceFLGPERCVALOR.asString;
      sPeriodicidade    := dtmImobiliario.qryIndiceMOEPERIODICIDADE.asString;

      Close;
   end;

   sAnoIni := IntToStr(DiasInUteis.ExtraiAno(dDataIni));
   sMesIni := IntToStr(DiasInUteis.ExtraiMes(dDataIni));
   if length(sMesIni) = 1 then sMesIni := '0' + sMesIni;

   sAnoFim := IntToStr(DiasInUteis.ExtraiAno(dDataFim));
   sMesFim := IntToStr(DiasInUteis.ExtraiMes(dDataFim));
   if length(sMesFim) = 1 then sMesFim := '0' + sMesFim;

   case sTipoCotacao[1] of

      'P': // percentual
      with dtmImobiliario.qryCotacoesIntervalo do begin

         LimpaParametros(dtmImobiliario.qryCotacoesIntervalo);

         ParamByName('INDICE').AsInteger     := iIndice;
         ParamByName('ANOMESINI').AsString   := sAnoIni + sMesIni;
         ParamByName('ANOMESFIM').AsString   := sAnoFim + sMesFim;

         Open;
         First;

         while not(EOF) do begin
            fCotacaoFim := dtmImobiliario.qryCotacoesIntervaloCOTVALOR.asFloat;

            // Calcula Fator acumulado - SEM PRO-RATA: FUNCEF ( demais utilizar uComunsImobiliario.FatorCorrecao )
            fFatorCorrecao := fFatorCorrecao * (1 + (fCotacaoFim / 100) );

// Vinicius - 18/03/2005 - Pend.18850 - Fator acumulado sem ser felo valor absoluto.
//            if fCotacaoFim >= 0 then begin
//               fFatorCorrecao := fFatorCorrecao * (1 + abs(fCotacaoFim / 100) );
//            end else begin
//               fFatorCorrecao := fFatorCorrecao / (1 + abs(fCotacaoFim / 100) );
//            end;

            Next;
         end;

      end;

      'V': // valor
      begin
         fCotacaoIni    := BuscaCotacao(iIndice, dDataIni, False);
         fCotacaoFim    := BuscaCotacao(iIndice, dDataFim, False);
         fFatorCorrecao := fCotacaoFim / fCotacaoIni;
      end;
   end;

   // verifica se o fator pode ser negativo, se não puder, zera a correção
   if not(bPodeNegativo) then if fFatorCorrecao < 1 then fFatorCorrecao := 1;

   Result := fFatorCorrecao;
end;

//==================================================================================================
//    Fim de Moeda / Cotação
//==================================================================================================


//==================================================================================================
//    Estorno / Exclusão de Lançamentos
//==================================================================================================

function TFuncoesImob.ExcluiLancImovel(const iDocumento, iPlanilha: int64; const dData: TDateTime; const bIntegradoCAR, bIntegradoCTB: boolean; var sErro: string; const iLancImovel : Integer): shortint;
var bTransacao           : boolean;
    iExercicio           : integer;
    iPeriodo, iEmpresa   : integer;
begin
   Result := 0;

   // Verifica se é possível excluir a planilha, senão, pára por aqui...
   iEmpresa := Sistema.idEmpresa;
   if (bIntegradoCTB ) and (TestaPeriodo(False, 'BASEDADOS', DateToStr(dData), IntToStr(Sistema.IdModulo), iExercicio, iPeriodo, iEmpresa, sErro) > 0) then begin
      Result := 1;
      Exit;
   end;

// -------------------------------------------------------------------------------------------------

   // verifica se já existe transação em andamento; se não houver, inicia uma
   if not(dtmBaseDados.dbBaseDados.InTransaction) then begin
      bTransacao := True;
      StartTransacao;
   end else begin
      bTransacao := False;
   end;

   try

      try
   // ----------------------------------------------------------------------------------------------

         // Verifica se é um documento de cobrança de Divergencias e Desfaz os Abonos Existentes
         if not DesfazCobraDiverge(iDocumento) then begin
            raise Exception.Create('Erro no desfazer os abonos de divergências');
         end;

         // Exclui as mensagens do imobiliário e cnab
         DeleteMsgLanc(iDocumento);

   // ----------------------------------------------------------------------------------------------

         // exclui o Lançamento no Imobiliário
         if (iDocumento > 0) or (iLancImovel > 0) then begin
            with dtmLancImovel.qryExcluiLancImovel do begin
               LimpaParametros(dtmLancImovel.qryExcluiLancImovel);
               if iDocumento  > 0 then ParamByName('PIDDOCUMENTO').asInteger  := iDocumento;
               if iLancImovel > 0 then ParamByName('PIDLANCIMOVEL').asInteger := iLancImovel;
               ExecSQL;
            end;
         end;

         // exclui os Lançamentos de Alteadores no Imobiliário
         with dtmLancImovel.qryDeleteAlteraLanc do begin
            LimpaParametros(dtmLancImovel.qryDeleteAlteraLanc);
            ParamByName('PIDDOCUMENTO').asInteger := iDocumento;
            ExecSQL;
         end;

         Application.ProcessMessages;

         // exclui a Observação (se houver)
         FuncoesImob.DeleteObsLanc(iDocumento);

         Application.ProcessMessages;

   // -------------------------------------------------------------------------------------------------

         // exclui os RecbtoPagto, Compromisso Orçamentário e Planilha Contábil
         if (bIntegradoCAR) then begin
            documento.Excluir(dtmImobiliario.qryAux, iDocumento, 0);
         end;

   // -------------------------------------------------------------------------------------------------

         // exclui a Planilha Contábil qdo o lançamento não tiver sido integrado com CapCar
         if (bIntegradoCTB) and (not bIntegradoCAR) and (iPlanilha > 0) then begin

              ExcluiLanc(True, iPlanilha, 'BASEDADOS',
                         IntToStr(Sistema.IdModulo),
                         IntegraBack.Plano, Sistema.idEmpresa,
                         Sistema.idUsuario, True, 0, IntegraBack.MascaraPlano);
         end;

         // Commit aqui, senão lançamentos sem contabilização näo commitam
         if ( (bTransacao) and (dtmBaseDados.dbBaseDados.InTransaction) ) then CommitTransacao;

   // -------------------------------------------------------------------------------------------------

      except
         on e:Exception do begin
            if ( (bTransacao) and (dtmBaseDados.dbBaseDados.InTransaction) ) then RollBackTransacao;
            Result := 1;
            sErro  := e.Message;
         end;
      end;
   finally
      LimpaParametros(dtmLancImovel.qryExcluiLancImovel);
      LimpaParametros(dtmImobiliario.qryExcluiRecbtoPagto);
      LimpaParametros(dtmImobiliario.qryExcluiLanctoDocum);
      LimpaParametros(dtmImobiliario.qryExcluiLotexDocum);
      LimpaParametros(dtmImobiliario.qryExcluiRateioDocum);
      LimpaParametros(dtmImobiliario.qryExcluiDocumento);
      LimpaParametros(dtmImobiliario.qryExcluiLancContab);
      LimpaParametros(dtmImobiliario.qryExcluiPlanilha);

      if ( (bTransacao) and (dtmBaseDados.dbBaseDados.InTransaction) ) then RollBackTransacao;
   end;
end;



//==================================================================================================
//    EstornaLancImovel :  Estorna um lançamento do Imobiliário
//==================================================================================================
//    Parâmetros:
//       iDocumento     :  IDDOCUMENTO
//       iCodDocumento  :  CODDOCUMENTO
//       iPlanilha      :  PLNCODIGO
//       dDataEstorno   :  Data dos lançamentos de estorno
//
//       Result         :  0 --> Ok
//                      : -1 --> Erro
//==================================================================================================
function TFuncoesImob.EstornaLancImovel(const iDocumento, iCodDocumento, iPlanilha: integer; dDataEstorno: TDateTime): shortint;
var
   bTransacao           : boolean;
   iDocumentoRetorno    : integer;
   iDocumentoAnterior   : integer;
   iLanc, iExercicio    : integer;
   iPeriodo, iEmpresa   : integer;
begin
   Result := 0;

// -------------------------------------------------------------------------------------------------

   if ( (iDocumento > 0) or (iPlanilha > 0) ) then begin

      // verifica se já existe transação em andamento; se não houver, inicia uma
      if not(dtmBaseDados.dbBaseDados.InTransaction) then begin
         bTransacao := True;
         StartTransacao;
      end else begin
         bTransacao := False;
      end;

      try

{ EXCLUIDO A EXCLUSÃO DA HISTCARTINV 08/04/02 - DETONADA CONSTRAINT: HISTCARTINV.IDLANCIMOVEL
         // encontra o registro na HistCartInv
         with dtmImobiliario.qryBuscaHistLanc do begin
            LimpaParametros(dtmImobiliario.qryBuscaHistLanc);
            ParamByName('PIDDOCUMENTO').asInteger := iDocumento;
            Open;

            while not(EOF) do begin
               // marca os registros necessários p/ recálculo dos saldos da Carteira de Investimentos
//               OperComum.MarcaFlgHistCartInv('HST', dtmImobiliario.qryBuscaHistLancIDHISTCARTINV.AsInteger);
//               MORREU !!!

               // exclui o registro da HistCartInv
               with dtmImobiliario.qryExcluiHistLanc do begin
                  LimpaParametros(dtmImobiliario.qryExcluiHistLanc);
                  ParamByName('PIDHISTCARTINV').asInteger := dtmImobiliario.qryBuscaHistLancIDHISTCARTINV.AsInteger;
                  ExecSQL;
               end;

               Next;
               Application.ProcessMessages;
            end;

            Close;
         end;

}// -------------------------------------------------------------------------------------------------

         // Marca o Lançamento como "Estornado"
         with dtmLancImovel.qryEstornaLancImovel do begin
            LimpaParametros(dtmLancImovel.qryEstornaLancImovel);
            ParamByName('PIDDOCUMENTO').asInteger := iDocumento;
            ExecSQL;
         end;

         Application.ProcessMessages;

// -------------------------------------------------------------------------------------------------

         // Verifica onde estornar (CaP/CaR e/ou Contabilidade)
         if iCodDocumento > -1 then begin

            // atribui valor aos parâmetros necessários ao estorno
            iLanc                := 0;
            iDocumentoAnterior   := iCodDocumento;

            // Faz o Estorno no CAP/CAR e Contab
            Documento.EstornoCAPCAR(DateToStr(dDataEstorno), iDocumentoAnterior, iLanc, iDocumentoRetorno);

         end else begin
            if iPlanilha > -1 then begin

               iLanc       := 0;
               iExercicio  := 0;
               iPeriodo    := 0;
               iEmpresa    := 0;

               EstornaLanc(False, iPlanilha, 'BASEDADOS', DateToStr(dDataEstorno), iExercicio, iPeriodo, iEmpresa, IntegraBack.MascaraPlano);

            end else begin
               Result := -1;
            end;
         end;



// -------------------------------------------------------------------------------------------------

         if ( (bTransacao) and (dtmBaseDados.dbBaseDados.InTransaction) ) then CommitTransacao;

      except
         if bTransacao then RollBackTransacao;
         Result := 1;
      end;

   end else begin
      Result := 1;
   end;
end;

//==================================================================================================
//    Fim de Estorno / Exclusão
//==================================================================================================


// TODO -oAndré : Alex, temos que estudar isso em relação à Conciliação

//==================================================================================================
//    DiaVencAluguel :  Retorna a data em que deve vencer o aluguel de contrato, em um determinado
//                      mês/ano de competência.  Levará em conta dias úteis de acordo com o
//                      parâmetro do Sistema.
//==================================================================================================
//==================================================================================================
//    Parâmetros:
//       iContrato      :  id do Contrato                      ( CONTRATOIMOVEL     - idContratoImovel )
//       iAno           :  ano de competência do aluguel       ( LANCAMENTOSIMOVEL  - ANOCOMPETENCIA )
//       iAno           :  mês de competência do aluguel       ( LANCAMENTOSIMOVEL  - MESCOMPETENCIA )
//       sTipoAluguel   :  indica o parte do aluguel           ( LANCAMENTOSIMOVEL  - FLGTIPOLANCAMENTO )
//                            'A' - principal (parte fixa)
//                            'C' - complemento (parte variável)
//
//==================================================================================================
function TFuncoesImob.DataVencAluguel(iContrato, iAno, iMes: integer; sTipoAluguel: char; bSomaTolera: boolean): TDateTime;
var
   iPais, iCidade, iDiasTolera                         : integer;
   iDiaAluguel, iMesAluguel, iAnoAluguel{, iDiaCompl}    : integer;

   bPrimeiroUtil, bUtilTolera,bUtilAluguel : boolean;

   dDataVenc   : TDateTime;
   sEstado     : string;
begin
   dDataVenc := 0;

   try
      // verifica nos parâmetros do Sistema se
      // o vencimento de aluguéis deve ser no 1º dia útil posterior ao vencimento original
      ParametrosSistema;
      bPrimeiroUtil := dtmImobiliario.qryParamImobFLGVENCDIAUTIL.AsInteger = 1;
      LimpaParametros(dtmImobiliario.qryParamImob);

      // verifica os parâmetros do Contrato
      with dtmImobiliario.qryDataVencAluguel do begin
         LimpaParametros(dtmImobiliario.qryDataVencAluguel);
         ParamByName('EMPRESAPROP').AsInteger      := Sistema.idEmpresa;
         ParamByName('TIPOCONTRATO').AsString      := 'L';
         ParamByName('CONTRATO').AsInteger         := iContrato;
         Open;
      end;

      // armazena o valor das variáveis
      if not(dtmImobiliario.qryDataVencAluguel.isEmpty) then begin

         iPais             := dtmImobiliario.qryDataVencAluguelIDPAIS.AsInteger;
         sEstado           := dtmImobiliario.qryDataVencAluguelCODESTADO.AsString;
         iCidade           := dtmImobiliario.qryDataVencAluguelIDCIDADES.AsInteger;

         iDiaAluguel       := dtmImobiliario.qryDataVencAluguelCONDIAVENCIMENTO.AsInteger;
//         iDiaCompl         := dtmImobiliario.qryDataVencAluguelCONDIACOMPLEMENTO.AsInteger;
         iDiasTolera       := dtmImobiliario.qryDataVencAluguelCONDIASTOLERANCIA.AsInteger;

         bUtilAluguel      := dtmImobiliario.qryDataVencAluguelFLGTIPODIAVENC.AsString = 'U';
         bUtilTolera       := dtmImobiliario.qryDataVencAluguelFLGTIPODIATOLERA.AsString = 'U';

      end else begin
         // erro (Result := 0)
         MsgDlg ('Não consegui gerar o vencimento com os dados abaixo:'+#13+
                 'Empresa: '+IntToStr(Sistema.idEmpresa) + #13+
                 'Tipo Contrato: L' + #13 +
                 'Contrato: '+ inttostr(iContrato), 'Erro', mtError, [mbok], 0);
         Result := dDataVenc;
         Exit;
      end;

      // Tratamento da Competência (Anterior, Corrente, Posterior) ---------------------------------
      case dtmImobiliario.qryDataVencAluguelFLGCOMPETALUGUEL.AsString[1] of
         'A':
         begin
            //  mês de competência anterior -> vencimento no mês seguinte
            if iMes = 12 then begin
               iMesAluguel := 1;
               iAnoAluguel := iAno + 1;
            end else begin
               iMesAluguel := iMes + 1;
               iAnoAluguel := iAno;
            end;
         end;

         'C':
         begin
            //  mês de competência corrente -> vencimento no próprio mês
            iMesAluguel := iMes;
            iAnoAluguel := iAno;
         end;

         'P':
         begin
            //  mês de competência posterior -> vencimento no mês anterior
            if iMes = 1 then begin
               iMesAluguel := 12;
               iAnoAluguel := iAno - 1;
            end else begin
               iMesAluguel := iMes - 1;
               iAnoAluguel := iAno;
            end;
         end;
      else
         iMesAluguel := iMes;
         iAnoAluguel := iAno;
      end;
      // -------------------------------------------------------------------------------------------


      // faz a calculeira
      Case sTipoAluguel of

         'A': // Principal
         begin

            // 1º: só vencimento
            if bUtilAluguel then begin
               dDataVenc := DiasInUteis.EnesimoDiaUtilMes(iAnoAluguel, iMesAluguel, iDiaAluguel, iCidade, iPais,
               sEstado, True, False, False);
            end else begin
               if iDiaAluguel >= 29 then begin
                  dDataVenc := DiasInUteis.UltDiaMes(iAnoAluguel, iMesAluguel);
               end else begin
                  dDataVenc := EncodeDate(iAnoAluguel, iMesAluguel, iDiaAluguel);
               end;
            end;

            // 2º: aplicação da tolerância - ???
            if bSomaTolera then begin
               if bUtilTolera then begin
                  dDataVenc := DiasInUteis.SomaDiasUteis(dDataVenc, iDiasTolera, iCidade, iPais, sEstado, True, False, False);
               end else begin
                  dDataVenc := dDataVenc + iDiasTolera;
               end;
            end;

            // 3º: próximo dia útil (se aplicável...)
            if ( (bPrimeiroUtil) and not(DiasInUteis.DiaUtil(dDataVenc, iCidade, iPais, sEstado, True, False, False)) ) then
            begin
               dDataVenc := DiasInUteis.PrimeiroDiaUtilPosterior(dDataVenc, iCidade, iPais, sEstado, True, False, False);
            end;

         end;

         'C': // Complemento
         begin
{
            // 1º: só vencimento
            if bUtilCompl then begin
               dDataVenc := DiasInUteis.EnesimoDiaUtilMes(iAno, iMes, iDiaCompl, iCidade, iPais,
               sEstado, True, False, False);
            end else begin
               if iDiaCompl >= 29 then begin
                  dDataVenc := DiasInUteis.UltDiaMes(iAno, iMes);
               end else begin
                  dDataVenc := EncodeDate(iAno, iMes, iDiaCompl);
               end;
            end;

            // @A Depende de parâmetro - verificar

            // 2º: aplicação da tolerância
            if bUtilTolera then begin
               dDataVenc := DiasInUteis.SomaDiasUteis(dDataVenc, iDiasTolera, iCidade, iPais, sEstado, True, False, False);
            end else begin
               dDataVenc := dDataVenc + iDiasTolera;
            end;

            // 3º: próximo dia útil (se aplicável...)
            if ( (bPrimeiroUtil) and not(DiasInUteis.DiaUtil(dDataVenc, iCidade, iPais, sEstado, True, False, False)) ) then
            begin
               dDataVenc := DiasInUteis.PrimeiroDiaUtilPosterior(dDataVenc, iCidade, iPais, sEstado, True, False, False);
            end;
}
         end;

      end;

   finally
      Result := dDataVenc;
      dtmImobiliario.qryDataVencAluguel.Close;
   end;
end;


//==================================================================================================
//    Agrupamento de Documentos
//==================================================================================================

function TFuncoesImob.AgrupaDocumentos(iMesCompetencia, iAnoCompetencia: integer; dDataVencIni, dDataVencFim: TDateTime;
BarraProgresso: TProgressBar; Legenda, Contador: TLabel): shortint;
var
   vMsgCnab    : array[0..8] of string;
   iMsgBoleto  : integer;
   iGrupoCNAB  : integer;
   iContador   : integer;
begin
   Result := 0;

   try

      try

         // verifica todos os Contratos que possuem lancamentos não agrupados
         with dtmImobiliario.qryContratosAgrupar do begin
            LimpaParametros(dtmImobiliario.qryContratosAgrupar);
            if iMesCompetencia > 0 then   ParamByName('PMESCOMPETENCIA').AsInteger  := iMesCompetencia;
            if iAnoCompetencia > 0 then   ParamByName('PANOCOMPETENCIA').AsInteger  := iAnoCompetencia;
            if dDataVencIni > 0 then begin
               ParamByName('PDATAVENCIMENTOINI').AsDateTime := dDataVencIni;
               ParamByName('PDATAVENCIMENTOFIM').AsDateTime := dDataVencFim;
            end;

            Open;
         end;

         if not(dtmImobiliario.qryContratosAgrupar.IsEmpty) then begin

            iContador := 0;
            MostraProgresso(BarraProgresso, Legenda, Contador, dtmImobiliario.qryContratosAgrupar.RecordCount, 'Agrupando Documentos...');

            Application.ProcessMessages;

            dtmImobiliario.qryContratosAgrupar.First;
            while not(dtmImobiliario.qryContratosAgrupar.EOF) do begin

               with dtmImobiliario.qryDocumentosCNAB do begin
                  LimpaParametros(dtmImobiliario.qryDocumentosCNAB);
                  ParamByName('PIDCONTRATOIMOVEL').AsInteger := dtmImobiliario.qryContratosAgruparIDCONTRATOIMOVEL.AsInteger;
                  Open;
               end;

               Application.ProcessMessages;

               with dtmImobiliario.qryMsgBoleto do begin
                  LimpaParametros(dtmImobiliario.qryMsgBoleto);
                  ParamByName('PIDCONTRATOIMOVEL').asInteger := dtmImobiliario.qryContratosAgruparIDCONTRATOIMOVEL.AsInteger;
                  Open;

                  iMsgBoleto := -1;
                  if not(isEmpty) then iMsgBoleto := dtmImobiliario.qryMsgBoletoIDMSGBOLETO.asInteger;
               end;

               // agrupa todos os documentos daquele contrato que tenham o mesmo vencimento
               // e já altera o EMISBLOQ para 'N'
               Documento.IntBanco.AgrupaDocCNAB(dtmImobiliario.qryDocumentosCNAB, False, False, True, True, ['DATAVENCTO']);

               //--------------------------------------------------------------------------------------------
               //    Processamento para definir o texto dos bloquetos
               //--------------------------------------------------------------------------------------------
               vMsgCnab[0] := PreencheMsgLinhaBoleto(iMsgBoleto, 1);
               vMsgCnab[1] := PreencheMsgLinhaBoleto(iMsgBoleto, 2);
               vMsgCnab[2] := PreencheMsgLinhaBoleto(iMsgBoleto, 3);
               vMsgCnab[3] := PreencheMsgLinhaBoleto(iMsgBoleto, 4);
               vMsgCnab[4] := PreencheMsgLinhaBoleto(iMsgBoleto, 5);
               vMsgCnab[5] := PreencheMsgLinhaBoleto(iMsgBoleto, 6);
               vMsgCnab[6] := PreencheMsgLinhaBoleto(iMsgBoleto, 7);
               vMsgCnab[7] := PreencheMsgLinhaBoleto(iMsgBoleto, 8);
               vMsgCnab[8] := PreencheMsgLinhaBoleto(iMsgBoleto, 9);

               if Documento.IntBanco.CodigosGrupo.Count > 0 then begin
                  iGrupoCNAB := StrToInt(Documento.IntBanco.CodigosGrupo[0]);
               end else begin
                  iGrupoCNAB := -1;
               end;

               if not(Documento.IntBanco.SetaMensagensCNAB(-1, iGrupoCNAB, vMsgCNAB)) then begin
                  Result := -1;
                  Exit;
      //            MsgDlg('Não foi possível gravar o texto do bloqueto. Favor verificar.', 'Erro', mtError, [mbOk], 0);
               end;

               // Marca os lançamentos como "agrupados" FLGAGRUPADO = 1
               if not(dtmImobiliario.qryDocumentosCNAB.isEmpty) then begin
                  dtmImobiliario.qryDocumentosCNAB.First;
                  while not(dtmImobiliario.qryDocumentosCNAB.EOF) do begin

                     LimpaParametros(dtmImobiliario.qryMarcaAgrupado);
                     dtmImobiliario.qryMarcaAgrupado.ParamByName('PIDLANCIMOVEL').asInteger := dtmImobiliario.qryDocumentosCNABIDLANCIMOVEL.asInteger;
                     dtmImobiliario.qryMarcaAgrupado.ExecSQL;
                     LimpaParametros(dtmImobiliario.qryMarcaAgrupado);

                     dtmImobiliario.qryDocumentosCNAB.Next;
                  end;
               end;

               dtmImobiliario.qryContratosAgrupar.Next;
               inc(iContador);

               AndaProgresso(BarraProgresso, Legenda, Contador, iContador, dtmImobiliario.qryContratosAgrupar.RecordCount);
               Application.ProcessMessages;
            end;
         end;

      except
         Raise;
         Result := -1;
      end;

   finally
      dtmImobiliario.qryContratosAgrupar.Close;
      dtmImobiliario.qryDocumentosCNAB.Close;
      dtmImobiliario.qryMsgBoleto.Close;
   end;
end;

//--------------------------------------------------------------------------------------------------

function TFuncoesImob.PreencheMsgLinhaBoleto(iMsgBoleto: integer; iLinha: byte): string;
begin
   if iMsgBoleto = -1 then begin

      Result := '';

   end else begin

      with dtmImobiliario.qryMsgLinhaBoleto do begin
         LimpaParametros(dtmImobiliario.qryMsgLinhaBoleto);
         ParamByName('PIDMSGBOLETO').asInteger  := iMsgBoleto;
         ParamByName('PLMBNUMLINHA').asInteger  := iLinha;
         Open;

         if not(isEmpty) then begin
            Result := dtmImobiliario.qryMsgLinhaBoletoLMBTEXTOLINHA.asString;
         end else begin
            Result := '';
         end;

         Close;
      end;

   end;
end;

//==================================================================================================
//    Fim do Agrupamento
//==================================================================================================





//==================================================================================================

function TFuncoesImob.AtualizaOcupacao(iImovel, iContrato: integer; sOcupacao: string; bMostraMsg: boolean): boolean;
var
   bTransacao  : boolean;
   qry         : TwwQuery;
begin
   Result := True;

   bTransacao := False;
   // verifica se já existe transação em andamento; se não houver, inicia uma
   if not(dtmBaseDados.dbBaseDados.InTransaction) then begin
      bTransacao := True;
      StartTransacao;
   end;

   try

      // define o que marcar: (O)cupação ou (D)esocupacao
      case sOcupacao[1] of
         'D': qry := dtmImobiliario.qryMarcaImovelDesocupado;
         'O': qry := dtmImobiliario.qryMarcaImovelOcupado;
      else
         qry := nil;
      end;

      // executa a query de update
      with qry do begin
         LimpaParametros(qry);

         if iImovel > 0 then     ParamByName('IMOVEL').asInteger     := iImovel;
         if iContrato > 0 then   ParamByName('CONTRATO').asInteger   := iContrato;

         ExecSQL;
      end;

      if ( (bTransacao) and (dtmBaseDados.dbBaseDados.InTransaction) ) then CommitTransacao;

   except
      if ( (bTransacao) and (dtmBaseDados.dbBaseDados.InTransaction) ) then RollBackTransacao;
      if bMostraMsg then Raise;
      Result := False;
   end;
end;



//==================================================================================================



procedure TFuncoesImob.TrazAValorPresente(var fValor: extended; dDataHistorica, dDataPresente: TDateTime;
fFator: extended; sTipoConversao: string);
begin
//   Mar/1970 --> Cruzeiro       (Cr$)
//   Fev/1986 --> Cruzado        (Cz$)    = / 1000
//   Jan/1989 --> Cruzado Novo   (NCz$)   = / 1000
//   Mar/1990 --> Cruzeiro       (Cr$)    =
//   Ago/1993 --> Cruzeiro Real  (CR$)    = / 1000
//   Jul/1994 --> Real           (R$)     = / 2750

   // primeiro aplica a correção monetária
   fValor := fValor * fFator;

   // de acordo com as datas, converte o valor
   case sTipoConversao[1] of

      // fixo, não leva em conta a tabela de moedas, apenas as datas
      // o valor histórico necessita estar na moeda corrente do Brasil à época
      'F':
      begin
         if dDataHistorica < StrToDate('01/02/1986') then begin
            if dDataPresente >= StrToDate('01/02/1986') then fValor := fValor / 1000;
            if dDataPresente >= StrToDate('01/01/1989') then fValor := fValor / 1000;
            if dDataPresente >= StrToDate('01/08/1993') then fValor := fValor / 1000;
            if dDataPresente >= StrToDate('01/07/1994') then fValor := fValor / 2750;
            Exit;
         end;

         if dDataHistorica < StrToDate('01/01/1989') then begin
            if dDataPresente >= StrToDate('01/01/1989') then fValor := fValor / 1000;
            if dDataPresente >= StrToDate('01/08/1993') then fValor := fValor / 1000;
            if dDataPresente >= StrToDate('01/07/1994') then fValor := fValor / 2750;
            Exit;
         end;

         if dDataHistorica < StrToDate('01/08/1993') then begin
            if dDataPresente >= StrToDate('01/08/1993') then fValor := fValor / 1000;
            if dDataPresente >= StrToDate('01/07/1994') then fValor := fValor / 2750;
            Exit;
         end;

         if dDataHistorica < StrToDate('01/07/1994') then begin
            if dDataPresente >= StrToDate('01/07/1994') then fValor := fValor / 2750;
            Exit;
         end;

      end;

   end;
end;


//==================================================================================================



//==================================================================================================
//    Manipulação de Barras de Progressão
//==================================================================================================

procedure MostraProgresso(var Barra: TProgressBar; var Legenda, Contador: TLabel;
fMaximo: double; sLegenda: string);
begin
   Barra.Max         := word(trunc(fMaximo));
   Barra.Position    := 0;

   Legenda.Caption   := sLegenda;
   Contador.Caption  := FormatFloat('#0', 0) + ' de ' + FormatFloat('#0', fMaximo);

   Barra.Visible     := True;
   Legenda.Visible   := True;
   Contador.Visible  := True;

   Application.ProcessMessages;
end;

procedure AndaProgresso(var Barra: TProgressBar; var Legenda, Contador: TLabel;
fPosicao, fMaximo: double);
begin
   Barra.Position    := word(trunc(fPosicao));
   Contador.Caption  := FormatFloat('#0', fPosicao) + ' de ' + FormatFloat('#0', fMaximo);

   Application.ProcessMessages;
end;

procedure EscondeProgresso(var Barra: TProgressBar; var Legenda, Contador: TLabel);
begin
   Barra.Visible     := False;
   Legenda.Visible   := False;
   Contador.Visible  := False;

   Barra.Max         := 0;
   Legenda.Caption   := '';
   Contador.Caption  := FormatFloat('00000', 0) + ' de ' + FormatFloat('00000', 0);

   Application.ProcessMessages;
end;

//==================================================================================================





//==================================================================================================
//    Manipulação de TQueries
//==================================================================================================

// Fecha, prepara uma TwwQuery e atribui todos os parâmetros como NULL, inicialmente
procedure LimpaParametros(const qry: TwwQuery);
var
   i: integer;
begin
   // fecha a query p/ evitar problemas
   qry.Close;

   // prepara a query se já não estiver preparada
   if not(qry.Prepared) then qry.Prepare;

   // zera os parâmetros
   for i := 0 to (qry.ParamCount - 1) do begin
      qry.Params[i].Bound := False;
      qry.Params[i].Clear;
      qry.Params[i].Bound := True;
   end;
end;

// -------------------------------------------------------------------------------------------------

// Fecha, limpa o SQL de uma TwwQuery e atribui um novo SQL
procedure AtribuiSQL(qry: TwwQuery; const sTextoSQL: string);
begin
   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Text := sTextoSQL;
end;

// -------------------------------------------------------------------------------------------------

function ExecutaQuery(qry: TwwQuery; const str: string): boolean;
begin
   Result := False;

   with qry do begin

      try
         Close;
         SQL.Clear;
         SQL.Add(str);
         ExecSQL;
      except
         on E:Exception do begin
            ShowMessage('Erro na Execução da Query, ' + #13 + #13 + Str + #13 + #13 +
                        'Com a Mensagem, ' + #13 + #13 + E.Message);
            Result := False;
            Exit;
         end;
      end;
   end;

   Result := True;
end;

// -------------------------------------------------------------------------------------------------

function FazQuery(var qry: TwwQuery; str: string): boolean;
var
   sLinha            : string;
   iInicial, iFinal  : integer;
begin
   with qry do begin
      try
         Close;
         SQL.Clear;
         SQL.Add(Str);
         Open;
      except
         On E:Exception do begin
// Monta Linha da Query
        iInicial:=1;
        iFinal  :=(Pos('FROM',Str)-1);
        If iFinal <= 0 Then iFinal:= Length(str);
        sLinha:=Copy(Str,1,iFinal)+#13;
// From Ate Where
        iInicial:=(Pos('FROM',Str)-1);
        iFinal  :=(((Pos('WHERE',Str)-1))-Length(sLinha));
        If iFinal <= 0 Then begin
          iInicial:=Length(sLinha);
          iFinal:=Length(Str);
        end;
        sLinha:=sLinha+Copy(Str,iInicial,iFinal)+#13;
// Where Ate Order by
        iInicial:=(Pos('WHERE',Str)-1);
        iFinal  :=(((Pos('ORDER BY',Str)-1))-Length(sLinha));
        If iFinal <= 0 Then begin
          iInicial:=Length(sLinha);iFinal:=Length(Str);
        end;
        sLinha:=sLinha+Copy(Str,iInicial,iFinal)+#13;
// Order By Ate Group By
        iInicial:=(Pos('ORDER BY',Str)-1);
        iFinal  :=(((Pos('GROUP BY',Str)-1))-Length(sLinha));
        If iFinal <= 0 Then begin
          iInicial:=Length(sLinha);iFinal:=Length(Str);
        end;
        sLinha:=sLinha+Copy(Str,iInicial,iFinal)+#13;
// Group By Ate Final
        iInicial:=(Pos('GROUP BY',Str)-1);
        iFinal  :=Length(Str);
        If iInicial <= 0 Then begin
          iInicial:=Length(sLinha);iFinal:=Length(Str);
        end;
        sLinha:=sLinha+Copy(Str,iInicial,iFinal)+#13;
//        If MessageDlg('Erro na Abertura da Query, '+Qry.Name+' :'+#13+
//                    #13+sLinha+
//                    #13+'Com a Mensagem, '+#13+
//                    #13+E.Message+#13+#13+'Deseja Capturar a Query ?', mtError, [mbYes, mbNo], 0) = mrYes then begin
//         InputBox('Mensagem do Sistema ', 'Query Errada !!', Qry.Sql.GetText);
//        end;
        Result := False;
      end;
    end;
    Result := (EOF <> BOF);
  end;
end;

//==================================================================================================
//    Fim de Manipulação de TQueries
//==================================================================================================





//==================================================================================================

// "Calcula" a data de lançamento default a partir de um mes e uma Data de Vencimento
function TFuncoesImob.DataLancamento(iMes, iAno: integer; dDataVenc: TDateTime): TDateTime;
var
   dUltDiaMes : TDateTime;
begin
   dUltDiaMes := DiasInUteis.UltDiaMes(iAno, iMes);

   if dDataVenc > dUltDiaMes then begin
      Result := dUltDiaMes;
   end else begin
      Result := dDataVenc;
   end;

   Result := EncodeDate(iAno, iMes, 1);
end;

//==================================================================================================

// Mascara um CPF ou CGC
function TFuncoesImob.FormataCPFCGC(const CPFCGC: string): string;
begin
   Case length(CPFCGC) of
      // 11: Result := Format('%s.%s.%s-%s', [copy(CPFCGC, 1, 3),copy(CPFCGC, 4, 3),copy(CPFCGC, 7, 3),copy(CPFCGC, 10, 2)]);
      11: Result := FormatMaskText('000.000.000-00;0; ', CPFCGC);
      // 14: Result := Format('%s.%s.%s/%s-%s', [copy(CPFCGC, 1, 2), copy(CPFCGC, 3, 3), copy(CPFCGC, 6, 3), copy(CPFCGC, 9, 4), copy(CPFCGC, 13, 2)]);
      14: Result := FormatMaskText('00.000.000/0000-00;0; ', CPFCGC);
   else
      Result := CPFCGC;
   end;
end;



//==================================================================================================
//    Criação / Atualização de Grupos de Rateio
//==================================================================================================

procedure TFuncoesImob.CriaGrupoNovo(sCodigo: string);
begin
   try

      with dtmImobiliario.qryInsertGrupoRateio do begin
         LimpaParametros(dtmImobiliario.qryInsertGrupoRateio);
         ParamByName('PIDGRUPORATEIO').AsInteger   := LeUltRegistro(nil, 'GRUPORATEIO');
         ParamByName('PGRRDESCRICAO').AsString     := 'Grupo ' + sCodigo;
         ParamByName('PIMOCODIGO').AsString        := sCodigo;
         ExecSQL;
      end;

   finally
      LimpaParametros(dtmImobiliario.qryInsertGrupoRateio);
   end;
end;

//==================================================================================================

procedure TFuncoesImob.InsereImovelGrupo(const iGrupo, iImovel: integer; fPercent: double);
begin
   try

      with dtmImobiliario.qryInsertGrupoXImovel do begin
         LimpaParametros(dtmImobiliario.qryInsertGrupoXImovel);
         ParamByName('PIDGRUPORATEIO').AsInteger   := iGrupo;
         ParamByName('PIDIMOVEL').AsInteger        := iImovel;
         ParamByName('PGXIPERCENTRATEIO').AsFloat  := fPercent;
         ExecSQL;
      end;

   finally
      LimpaParametros(dtmImobiliario.qryInsertGrupoXImovel);
   end;
end;

//==================================================================================================

function TFuncoesImob.GeraGrupoRateio(const sCodigoGrupo: string; fArea, fAreaGerencial: double): string;
var
   fPercent          : currency;
   fPercentRestante  : currency;
   iContador         : integer;
begin
   fPercentRestante := 100;

   with dtmImobiliario.qryImovel do begin

      LimpaParametros(dtmImobiliario.qryImovel);
      ParamByName('PIDEMPRESAPROP').asInteger  := Sistema.idEmpresa;
      ParamByName('PFLGTIPOIMOVEL').asInteger  := 1;
      ParamByName('PFLGATIVO').asInteger       := 1;
      ParamByName('PIMOCODIGO').asString       := trim(sCodigoGrupo);
      Open;

      if not(IsEmpty) then begin

         First;
         iContador := 1;

         try

            StartTransacao;

            // verifica se já existe pelo menos um grupo de rateio
            with dtmImobiliario.qryGrupoRateio do begin
               LimpaParametros(dtmImobiliario.qryGrupoRateio);
               ParamByName('PIMOCODIGO').asString := sCodigoGrupo;
               Open;

               // não havendo, cria um grupo p/ código passado
               if isEmpty then begin
                  CriaGrupoNovo(sCodigoGrupo);
               end else begin
                  // exclui o(s) imóvel(eis) do(s) grupo(s)
                  with dtmImobiliario.qryExcluiGrupoXImovel do begin
                     LimpaParametros(dtmImobiliario.qryExcluiGrupoXImovel);
                     ParamByName('PIMOCODIGO').asString := sCodigoGrupo;
                     ExecSQL;
                  end;
               end;

               Close;
            end;

            while not(EOF) do begin

               if fArea = 0 then begin
                  fPercent := 0;
               end else begin
                  fPercent := Arredonda(dtmImobiliario.qryImovelIMOAREA.asFloat / fArea * 100, 4);
               end;

               // se estiver no último registro, usa o "saldo" restante
               // (para não gerar erro de arredondamento)
               if iContador = dtmImobiliario.qryImovel.RecordCount then fPercent := fPercentRestante;

               // subtrai do restante;
               fPercentRestante  := fPercentRestante - fPercent;

               with dtmImobiliario.qryGrupoRateio do begin
                  LimpaParametros(dtmImobiliario.qryGrupoRateio);
                  ParamByName('PIMOCODIGO').asString := sCodigoGrupo;
                  Open;
                  First;

                  while not(EOF) do begin
                     InsereImovelGrupo(dtmImobiliario.qryGrupoRateioIDGRUPORATEIO.asInteger,
                                       dtmImobiliario.qryImovelIDIMOVEL.asInteger, fPercent);
                     Next;
                  end;

                  Close;
               end;

               Next;
               inc(iContador);
            end;

            CommitTransacao;
            Result := '';

         except
            RollBackTransacao;
            Result := sCodigoGrupo;
         end;

      end;
      Close;
   end;
end;

//==================================================================================================
//    Fim de Grupos de Rateio
//==================================================================================================



// incrementa o número do contrato (de acordo com parâmetros do sistema)
function TFuncoesImob.IncrementaContrato: string;
var
   iContrato : integer;
   sContrato : string;
begin
   sContrato := '';

   try

      // verifica se é necessário gerar um número
      if ParametrosSistema then begin

         // se o número do contrato deve ser sugerido...
         if dtmImobiliario.qryParamImobFLGSUGERECONTRATO.AsInteger = 1 then begin

            iContrato := dtmImobiliario.qryParamImobPROXNUMCONTRATO.AsInteger;
            sContrato := IntToStr(iContrato);

            dtmImobiliario.qryParamImob.Edit;
            dtmImobiliario.qryParamImobPROXNUMCONTRATO.AsInteger := iContrato + 1;
            dtmImobiliario.qryParamImob.Post;

            // se é para concatenar o ano...
            if dtmImobiliario.qryParamImobFLGCONCATENAANO.asInteger = 1 then begin

               sContrato := sContrato + '/' + IntToStr(DiasInUteis.ExtraiAno(Date));

            end;
         end;
      end;

   finally
      dtmImobiliario.qryParamImob.Close;
   end;

   Result := sContrato;
end;



// abre a query de Parametros do Sistema
function ParametrosSistema: boolean;
begin
   Result := False;

   if not(dtmImobiliario.qryParamImob.Active) then begin
      LimpaParametros(dtmImobiliario.qryParamImob);
      dtmImobiliario.qryParamImob.ParamByName('PIDPESSOA').AsInteger := Sistema.idEmpresa;
      dtmImobiliario.qryParamImob.Open;
   end;

   Result := not(dtmImobiliario.qryParamImob.IsEmpty);
end;



function Arredonda(fValor: extended; iDecimais: word): extended;
begin
   Result := (round(fValor * Power(10, iDecimais))) / Power(10, iDecimais);
end;



//==================================================================================================
//    Cálculo do Custo Contábil
//==================================================================================================

// Custo Contábil de um Imóvel
function TFuncoesImob.CC_Imovel(const iImovel: integer; dData: TDateTime): extended;
begin
   Result := -1;

   try

      with dtmImobiliario.qryCC_Imovel do begin
         LimpaParametros(dtmImobiliario.qryCC_Imovel);

         ParamByName('PIDPESSOA').AsInteger  := Sistema.idEmpresa;
         ParamByName('PIDIMOVEL').AsInteger  := iImovel;
         ParamByName('PDATAMOV').AsDateTime  := dData;

         Open;

         if not(isEmpty) then Result := dtmImobiliario.qryCC_ImovelSUMVALCTB.AsFloat;
      end;

   finally
      dtmImobiliario.qryCC_Imovel.Close;
   end;
end;


// Custo Contábil de um Imóvel Mestre
function TFuncoesImob.CC_Mestre(const iMestre: integer; dData: TDateTime): extended;
begin
   Result := -1;

   try

      with dtmImobiliario.qryCC_Mestre do begin
         LimpaParametros(dtmImobiliario.qryCC_Mestre);

         ParamByName('PIDPESSOA').AsInteger        := Sistema.idEmpresa;
         ParamByName('PIDIMOVELMESTRE').AsInteger  := iMestre;
         ParamByName('PDATAMOV').AsDateTime        := dData;

         Open;

         if not(isEmpty) then Result := dtmImobiliario.qryCC_ImovelSUMVALCTB.AsFloat;
      end;

   finally
      dtmImobiliario.qryCC_Mestre.Close;
   end;
end;

//==================================================================================================
//    Fim do Custo Contábil
//==================================================================================================



//==================================================================================================
//    Manipulação de Observações de Lançamento
//==================================================================================================

// retorna o conteúdo de uma determinada observação
function TFuncoesImob.SelectObsLanc(const iDocumento: integer): string;
begin
   Result := '';

   try

      with dtmLancImovel.qrySelectObsLanc do begin

         LimpaParametros(dtmLancImovel.qrySelectObsLanc);
         ParamByName('PIDDOCUMENTO').asInteger := iDocumento;
         Open;

         if not(isEmpty) then Result := dtmLancImovel.qrySelectObsLancOBS.AsString;
      end;

   finally
      dtmLancImovel.qrySelectObsLanc.Close;
   end;
end;



// insere uma nova observação
function TFuncoesImob.InsertObsLanc(const iDocumento: integer; sObs: string): shortint;
begin
   Result := 1;
   try
      with dtmLancImovel.qryInsertObsLanc do begin
         LimpaParametros(dtmLancImovel.qryInsertObsLanc);
         ParamByName('PIDDOCUMENTO').AsInteger  := iDocumento;
         ParamByName('POBS').AsString           := sObs;
         ExecSQL;
      end;
   except
      Result := -1;
   end;
end;



// altera uma observação
function TFuncoesImob.UpdateObsLanc(const iDocumento: integer; sObs: string): shortint;
begin
   try

      with dtmLancImovel.qryUpdateObsLanc do begin
         LimpaParametros(dtmLancImovel.qryInsertObsLanc);
         ParamByName('PIDDOCUMENTO').AsInteger  := iDocumento;
         ParamByName('POBS').AsString           := sObs;

         ExecSQL;

         Result := RowsAffected;
      end;

   except
      Result := -1;
   end;
end;



// exclui uma observação
function TFuncoesImob.DeleteObsLanc(const iDocumento: integer): shortint;
begin
   try
      try

         with dtmLancImovel.qryDeleteObsLanc do begin
            LimpaParametros(dtmLancImovel.qryDeleteObsLanc);
            ParamByName('PIDDOCUMENTO').AsInteger  := iDocumento;

            ExecSQL;

            Result := RowsAffected;
         end;

      except
         Result := -1;
      end;

   finally
      LimpaParametros(dtmLancImovel.qryDeleteObsLanc);
   end;
end;

//==================================================================================================
//    Fim de Manipulação de Observações de Lançamento
//==================================================================================================





//==================================================================================================
//    Manipulação de Mensagens para Boletos
//==================================================================================================

// IDMSGBOLETO       NUMBER(,)      Não
// MSGDESCRICAO      VARCHAR2(60)   Sim
// IDDOCUMENTO       NUMBER(,)      Sim

// LMBNUMLINHA       NUMBER(1)      Não
// IDMSGBOLETO       NUMBER(,)      Não
// LMBTEXTOLINHA     VARCHAR2(69)   Sim


procedure TFuncoesImob.SelectMsgLanc(const iDocumento: int64);
begin
// seleciona as mensagens de boleto
// quem chamar este procedimento deve fechar a query dtmLancImovel.qrySelectMsgLanc
   LimpaParametros(dtmLancImovel.qrySelectMsgLanc);
   dtmLancImovel.qrySelectMsgLanc.ParamByName('PIDDOCUMENTO').AsInteger := iDocumento;
   dtmLancImovel.qrySelectMsgLanc.Open;
end;



function TFuncoesImob.InsertMsgLanc(const iDocumento: int64; const sCabecalho, sTipoContrato: string;
         const iCuringa: integer; const vMsg: array of string): int64;
var
   i           : byte;
   iMsg        : int64;
   bTransacao  : boolean;
begin
   Result := -1;

   // verifica se já existe transação em andamento; se não houver, inicia uma
   if not(dtmBaseDados.dbBaseDados.InTransaction) then begin
      bTransacao := True;
      StartTransacao;
   end else begin
      bTransacao := False;
   end;

   try

      with dtmLancImovel.qryInsertMsgBoleto do begin
         LimpaParametros(dtmLancImovel.qryInsertMsgBoleto);

         iMsg := LeUltRegistro(nil, 'MSGBOLETO');
         ParamByName('PIDMSGBOLETO').AsInteger := iMsg;
         ParamByName('PIDMODULO').AsInteger := Sistema.IdModulo;


         if iDocumento > 0 then        ParamByName('PIDDOCUMENTO').AsInteger     := iDocumento;
         if sCabecalho <> '' then      ParamByName('PMSGDESCRICAO').AsString     := sCabecalho;
         if sTipoContrato <> '' then   ParamByName('PFLGTIPOCONTRATO').AsString  := sTipoContrato;
         if iCuringa > -1 then         ParamByName('PFLGCURINGA').asInteger      := iCuringa;

         ExecSQL;
      end;

      for i := 0 to 8 do begin
         // só insere se houver mensagem para a linha;
         if length(trim(vMsg[i])) > 0 then begin
            with dtmLancImovel.qryInsertLinhaMsg do begin
               LimpaParametros(dtmLancImovel.qryInsertMsgBoleto);

               ParamByName('PIDMSGBOLETO').AsInteger  := iMsg;
               ParamByName('PLMBNUMLINHA').AsInteger  := (i + 1);
               ParamByName('PLMBTEXTOLINHA').AsString := vMsg[i];
               ExecSQL;
            end;
         end;
      end;

      // Commit aqui, senão lançamentos sem contabilização näo commitam
      if ( (bTransacao) and (dtmBaseDados.dbBaseDados.InTransaction) ) then CommitTransacao;

      Result := iMsg;

   except
      if ( (bTransacao) and (dtmBaseDados.dbBaseDados.InTransaction) ) then RollBackTransacao;
      Result := -1;
   end;
end;



procedure TFuncoesImob.UpdateMsgLanc(const iDocumento: int64; const vMsg: array of string);
var
   i: integer; // vMsg = array [0..8]
   iIdMsgBoleto: integer;
begin
   // selecionar a linhasmsgboleto
   SelectMsgLanc(iDocumento);

   iIdMsgBoleto := dtmLancImovel.qrySelectMsgLancIDMSGBOLETO.AsInteger;
   // fechar a query de seleção
   dtmLancImovel.qrySelectMsgLanc.Close;


   if iIdMsgBoleto = 0 then begin  // não possui mensagens cadastradas - incluir
      iIdMsgBoleto := FuncoesImob.InsertMsgLanc(iDocumento,'','',-1,vMsg);

   end else begin
      // já existem mensagens cadastradas
      // excluir todas as LINHAS da mensagem cadastrada
      with dtmLancImovel.qryDeleteLinhaMsg do begin
         LimpaParametros(dtmLancImovel.qryDeleteLinhaMsg);
         ParamByName('PIDMSGBOLETO').AsInteger := iIdMsgBoleto;
         ExecSQL;
      end;

      // incluir novas mensagens sem criar novo id
      for i := 0 to (length(vMsg) - 1) do begin
         if vMsg[i] <> '' then begin
            with dtmLancImovel.qryInsertLinhaMsg do begin
               LimpaParametros(dtmLancImovel.qryInsertLinhaMsg);
               ParamByName('PIDMSGBOLETO').AsInteger  := iIdMsgBoleto;
               ParamByName('PLMBNUMLINHA').AsInteger  := i + 1;
               ParamByName('PLMBTEXTOLINHA').AsString := vMsg[i];
               ExecSQL;
            end;
         end;
      end;
   end;

end;



procedure TFuncoesImob.DeleteMsgLanc(const iDocumento: integer);
begin
   SelectMsgLanc(iDocumento);

   // apaga as linhas do boleto no nosso sistema
   LimpaParametros(dtmLancImovel.qryDeleteLinhaMsg);
   dtmLancImovel.qryDeleteLinhaMsg.ParamByName('PIDMSGBOLETO').AsInteger := dtmLancImovel.qrySelectMsgLancIDMSGBOLETO.AsInteger;
   dtmLancImovel.qryDeleteLinhaMsg.ExecSQL;

   // apaga o cabeçalho do boleto no nosso sistema
   LimpaParametros(dtmLancImovel.qryDeleteMsgBoleto);
   dtmLancImovel.qryDeleteMsgBoleto.ParamByName('PIDDOCUMENTO').AsInteger := iDocumento;
   dtmLancImovel.qryDeleteMsgBoleto.ExecSQL;

   // apaga a mensagemCNAB
   LimpaParametros(dtmLancImovel.qryDeleteMsgCnab);
   dtmLancImovel.qryDeleteMsgCnab.ParamByName('PCODDOCUMENTO').AsInteger := iDocumento;
   dtmLancImovel.qryDeleteMsgCnab.ExecSQL;

end;



// -------------------------------------------------------------------------------------------------
//    SubstituiCuringa: função que substitui os curingas pelos valores que interessam
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//
//       vMsg     :  vetor [0..8] contendo a mensagem a processar (que será retornada)
//                   ex: ['Cálculos válidos até: <vencimento>', '', 'Correção: <cm>', 'Multa: <multa>', 'Juros: <juros>' ]
//
//       vCuringa :  vetor [0..?] com os "nomes" dos curingas a serem pesquisados
//                   ex: ['<vencimento>', '<multa>', '<juros>', '<cm>']
//
//       vValor   :  vetor [0..?] com os "valores" que substituirão os curingas
//                   ex : ['15/05/2001', '10.000,00', '1.000,00', '500,00']
//
//    Retorno:
//
//       vMsg     :  [ 'Cálculos válidos até: 15/05/2001', '', 'Correção: 500.00', 'Multa: 10.000,00', 'Juros: 1.000,00' ]
//
//    Curingas:
//
//       <parcela>   -->   nº da parcela
//       <parcelas>  -->   quant. de parcelas
//       <vo>        -->   valor original
//       <cm>        -->   valor de correção monetária
//       <juros>     -->   valor de juros
//       <multa>     -->   valor de multa
//       <dataval>   -->   validade do cálculo
//       <imovel>    -->   nome do Imóvel
//       <recdes>    -->   tipo de receita / despesa
//
//--------------------------------------------------------------------------------------------------
procedure TFuncoesImob.SubstituiCuringa(var vMsg: array of string; const vCuringa, vValor: array of string);
var
   i, j, k     : integer;
   bTerminou   : boolean;  // se terminou de procurar curingas na linha
   sNova       : string;   // receberá a linha a ser tratada
begin
   // procurar em todas as linhas da mensagem
   for i := 0 to (length(vMsg) - 1) do begin

      bTerminou := False;

      // enquanto houver curingas a substituir...
      while not(bTerminou) do begin

         // passar duas vezes pelo for pois podem ter várias ocorrências do mesmo curinga em uma linha
         for j := 0 to (length(vCuringa) - 1) do begin

            bTerminou := False;
            // procurar todas as ocorrências deste curinga nesta linha
            while not(bTerminou) do begin

               // procurar na lista de curingas
               k := pos(AnsiLowerCase(vCuringa[j]), AnsiLowerCase(vMsg[i]));

               if k > 0 then begin
                  // achei um curinga
                  sNova       := copy(vMsg[i], 1, (k - 1));    // 1 parte
                  sNova       := sNova + vValor[j];            // curinga
                  sNova       := sNova + copy(vMsg[i], length(vCuringa[j]) + k, length(vMsg[i]));  //3 parte
                  vMsg[i]     := copy(sNova, 1, 69);

               end else begin
                  bTerminou   := True; // não achei este curinga ajustar busca para True, pode ser setado False no próximo índice do for
               end;

            end;
         end;
      end;
   end;
end;



//==================================================================================================
//    Fim de Manipulação de Mensagens para Boletos
//==================================================================================================





// =================================================================================================
//    Integração Financeira / Contábil
// =================================================================================================

// Retorna a máscara do Plano de Contas
function TFuncoesImob.GetMascaraPlano(iPlano: integer): string;
var
   qryContab : TwwQuery;
begin
   qryContab := dtmImobiliario.qryIntegraContab;

   with qryContab do begin
      LimpaParametros(qryContab);
      ParamByName('PLANO').AsInteger := iPlano;
      Open;
   end;

   if not(qryContab.isEmpty) then Result := trim(qryContab.FieldbyName('MASCARA').AsString);
   qryContab.Close;
end;





// Gera um nº de documento único
function TFuncoesImob.GeraNoDocumento(c: char): extended;
var
   ano, mes, dia, hora, min, seg, mseg: word;
   s, sNoDoc, sAleatorio: string;
begin
   DecodeDate(Now, ano, mes, dia);
   DecodeTime(Now, hora, min, seg, mseg);

   Randomize;

   case c of
      'P': c := '0';
      'R': c := '1';
      else
   end;

   if ( (c <> '1') or (c <> '0') ) then begin
      s := IntToStr(Random(1));
      c := s[1];
   end;

   // gera um nº aleatorio de 2 dígitos
   sAleatorio := IntToStr( (10 + Random(89)) );

   sNoDoc := '';
   sNoDoc := sNoDoc + sAleatorio;
   sNoDoc := sNoDoc + c;
   sNoDoc := sNoDoc + copy(IntToStr(ano), 3, 2);

   if length(IntToStr(mes)) = 1 then begin
      sNoDoc := sNoDoc + '0' + IntToStr(mes);
   end else begin
      sNoDoc := sNoDoc + IntToStr(mes);
   end;

   if length(IntToStr(dia)) = 1 then begin
      sNoDoc := sNoDoc + '0' + IntToStr(dia);
   end else begin
      sNoDoc := sNoDoc + IntToStr(dia);
   end;

   if length(IntToStr(hora)) = 1 then begin
      sNoDoc := sNoDoc + '0' + IntToStr(hora);
   end else begin
      sNoDoc := sNoDoc + IntToStr(hora);
   end;

   if length(IntToStr(min)) = 1 then begin
      sNoDoc := sNoDoc + '0' + IntToStr(min);
   end else begin
      sNoDoc := sNoDoc + IntToStr(min);
   end;

   if length(IntToStr(mseg)) = 1 then begin
      sNoDoc := sNoDoc + '00' + IntToStr(mseg);
   end else begin
      if length(IntToStr(mseg)) = 2 then begin
         sNoDoc := sNoDoc + '0' + IntToStr(mseg);
      end else begin
         sNoDoc := sNoDoc + IntToStr(mseg);
      end;
   end;

   Result := StrToFloat(sNoDoc);
end;





// =================================================================================================
//    Busca da nova Parametrização
// =================================================================================================

// -------------------------------------------------------------------------------------------------
//    Abre a qryPadrLanc de acordo com os parâmetros passados
//--------------------------------------------------------------------------------------------------
procedure TFuncoesImob.AbrePadrLanc(const sRecPag, sTipoImovel: string; const iEmpresaProp, iModulo,
                       iTipoRecDes, iImovel, iContrato: int64; const bDiario: boolean);
begin

   with dtmImobiliario.qryPadrLancImovel do begin
      LimpaParametros(dtmImobiliario.qryPadrLancImovel);

      // parâmetros obrigatórios
      ParamByName('PIDPESSOA').AsInteger  := iEmpresaProp;
      ParamByName('PIDMODULO').AsInteger  := iModulo;
      ParamByName('PRECPAG').AsString     := sRecPag;
      if bDiario then
         ParamByName('PFLGDIARIO').AsString  := 'S'
      else
         ParamByName('PFLGDIARIO').AsString  := 'N';

      // filtros hierárquicos
      ParamByName('PCODTIPIMOVEL').AsString := sTipoImovel;
      if sTipoImovel = '-1' then begin
         ParamByName('PTIPIMOVELNULL').AsString := 'nulos';
      end;

      ParamByName('PIDTIPOCUSTORECIMO').AsInteger := iTipoRecDes;
      if iTipoRecDes = -1 then begin
         ParamByName('PCUSTORECIMONULL').AsString := 'nulos';
      end;

      ParamByName('PIDIMOVEL').AsInteger := iImovel;
      if iImovel = -1 then begin
         ParamByName('PIMOVELNULL').AsString := 'nulos';
      end;

      ParamByName('PIDCONTRATOIMOVEL').AsInteger   := iContrato;
      if iContrato = -1 then begin
         ParamByName('PCONTRATONULL').AsString := 'nulos';
      end;

      Open;
   end;

end;




// -------------------------------------------------------------------------------------------------
//    Retorna os parâmetros contábeis através de um registro passado por referência
//    Retorna um dígito de controle, indicando se correu tudo bem ou se houve erro (especificado)
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Códigos de retorno (controle de erro):
//        0 : Situação normal
//       -1 : Não encontrada parametrização
//       -4 : Erro: ambigüidade na parametrização
//       -5 : Erro: nenhuma parametrização encontrada
//       -6 : Erro: Tipo de Desembolso Inativo
//
//    Parâmetro sFlgDiario: true  - contabilização diária
//                          false - contabilização não diária
//--------------------------------------------------------------------------------------------------
function TFuncoesImob.BuscaPadrLanc(const sRecPag, sTipoImovel: string; const iEmpresaProp, iModulo,
         iTipoRecDes, iImovel, iContrato: int64; var ParamIntegra: TParamContabeis; const bDiario: boolean): integer;
var
   bAcheiParametros: boolean;
   iImovelMestre   : Integer;
begin
(*  ORDEM DE PESQUISA, SE ALTERAR MUDAR O HELP
7) Tipo de Imóvel
6) Tipo de Receita/Despesa
5) Imóvel
4) Contrato
3) Tipo de Imóvel + Tipo de Receita/Despesa
2) Imóvel + Tipo de Receita
1) Contrato + Tipo de Receita/Despesa
*)
   // nenhum padrão encontrado, a princípio
   Result := 0;
   bAcheiParametros := false;

   try

      // 1º Passo: Contrato + Tipo de Receita (caso mais detalhado)
      if ( (iContrato > 0) and (iTipoRecDes > 0) ) then begin
         FuncoesImob.AbrePadrLanc(sRecPag, '-1', iEmpresaProp, iModulo, iTipoRecDes, -1, iContrato, bDiario);
         // Erro: ambigüidade no Padrão de Lançamento
         if dtmImobiliario.qryPadrLancImovel.RecordCount > 1 then begin
            Result := -4;
            exit;
         end else if dtmImobiliario.qryPadrLancImovel.RecordCount = 1 then begin
            bAcheiParametros := true;
         end;
      end;

      // 2º Passo: Imóvel + Tipo de Receita/Despesa
      if ( not(bAcheiParametros) and (iImovel > 0) and (iTipoRecDes > 0) ) then begin
         FuncoesImob.AbrePadrLanc(sRecPag, '-1', iEmpresaProp, iModulo, iTipoRecDes, iImovel, -1, bDiario);
         // Erro: ambigüidade no Padrão de Lançamento
         if dtmImobiliario.qryPadrLancImovel.RecordCount > 1 then begin
            Result := -4;
            exit;
         end else if dtmImobiliario.qryPadrLancImovel.RecordCount = 1 then begin
            bAcheiParametros := true;
         end;
      end;

      // Marchetti - Pendencia 19719

      // 3º Passo: Imóvel Mestre + Tipo de Receita/Despesa
      if ( not(bAcheiParametros) and (iImovel > 0) and (iTipoRecDes > 0) ) then begin

         LimpaParametros(dtmImobiliario.qryImovel);
         dtmImobiliario.qryImovel.ParamByName('PIDEMPRESAPROP').AsInteger := iEmpresaProp;
         dtmImobiliario.qryImovel.ParamByName('PIDIMOVEL').AsInteger      := iImovel;
         dtmImobiliario.qryImovel.Open;

         if (not dtmImobiliario.qryImovel.IsEmpty) and
            (not dtmImobiliario.qryImovel.FieldByName('IDIMOVELMESTRE').IsNull) then
         begin
            iImovelMestre := dtmImobiliario.qryImovel.FieldByName('IDIMOVELMESTRE').AsInteger;
         end
         else
         begin
            iImovelMestre := iImovel;
         end;

         dtmImobiliario.qryImovel.Close;

         FuncoesImob.AbrePadrLanc(sRecPag, '-1', iEmpresaProp, iModulo, iTipoRecDes, iImovelMestre, -1, bDiario);
         // Erro: ambigüidade no Padrão de Lançamento
         if dtmImobiliario.qryPadrLancImovel.RecordCount > 1 then begin
            Result := -4;
            exit;
         end else if dtmImobiliario.qryPadrLancImovel.RecordCount = 1 then begin
            bAcheiParametros := true;
         end;
      end;
      // Fim Marchetti - Pendencia 19719


      // 4º Passo: Tipo de Imóvel + Tipo de Receita/Despesa
      if ( not(bAcheiParametros) and (sTipoImovel <> '') and (iTipoRecDes > 0) ) then begin
         FuncoesImob.AbrePadrLanc(sRecPag, sTipoImovel, iEmpresaProp, iModulo, iTipoRecDes, -1, -1, bDiario);
         // Erro: ambigüidade no Padrão de Lançamento
         if dtmImobiliario.qryPadrLancImovel.RecordCount > 1 then begin
            Result := -4;
            exit;
         end else if dtmImobiliario.qryPadrLancImovel.RecordCount = 1 then begin
            bAcheiParametros := true;
         end;
      end;

      // 4º Passo: Contrato
      if ( not(bAcheiParametros) and (iContrato > 0) ) then begin
         FuncoesImob.AbrePadrLanc(sRecPag, '-1', iEmpresaProp, iModulo, -1, -1, iContrato, bDiario);
         // Erro: ambigüidade no Padrão de Lançamento
         if dtmImobiliario.qryPadrLancImovel.RecordCount > 1 then begin
            Result := -4;
            exit;
         end else if dtmImobiliario.qryPadrLancImovel.RecordCount = 1 then begin
            bAcheiParametros := true;
         end;
      end;

      // 5º Passo: Imóvel
      if ( not(bAcheiParametros) and (iImovel > 0) ) then begin
         FuncoesImob.AbrePadrLanc(sRecPag, '-1', iEmpresaProp, iModulo, -1, iImovel, -1, bDiario);
         // Erro: ambigüidade no Padrão de Lançamento
         if dtmImobiliario.qryPadrLancImovel.RecordCount > 1 then begin
            Result := -4;
            exit;
         end else if dtmImobiliario.qryPadrLancImovel.RecordCount = 1 then begin
            bAcheiParametros := true;
         end;
      end;

      // 6º Passo: Tipo de Receita/Despesa
      if ( not(bAcheiParametros) and (iTipoRecDes > 0) ) then begin
         FuncoesImob.AbrePadrLanc(sRecPag, '-1', iEmpresaProp, iModulo, iTipoRecDes, -1, -1, bDiario);
         // Erro: ambigüidade no Padrão de Lançamento
         if dtmImobiliario.qryPadrLancImovel.RecordCount > 1 then begin
            Result := -4;
            exit;
         end else if dtmImobiliario.qryPadrLancImovel.RecordCount = 1 then begin
            bAcheiParametros := true;
         end;
      end;

      // 7º Passo: Tipo de Imóvel
      if ( not(bAcheiParametros) and (sTipoImovel <> '') ) then begin
         FuncoesImob.AbrePadrLanc(sRecPag, sTipoImovel, iEmpresaProp, iModulo, -1, -1, -1, bDiario);
         // Erro: ambigüidade no Padrão de Lançamento
         if dtmImobiliario.qryPadrLancImovel.RecordCount > 1 then begin
            Result := -4;
            exit;
         end else if dtmImobiliario.qryPadrLancImovel.RecordCount = 1 then begin
            bAcheiParametros := true;
         end;
      end;


      // 8º Passo: Todas as despesas
      if not(bAcheiParametros) then begin
         FuncoesImob.AbrePadrLanc(sRecPag, '-1', iEmpresaProp, iModulo, -1, -1, -1, bDiario);
         // Erro: ambigüidade no Padrão de Lançamento
         if dtmImobiliario.qryPadrLancImovel.RecordCount > 1 then begin
            Result := -4;
            exit;
         end else if dtmImobiliario.qryPadrLancImovel.RecordCount = 1 then begin
            bAcheiParametros := true;
         end;
      end;


      // Finalmentes: resultado da Busca
      // verifica se agora foi encontrado algum Padrão de Lançamento
      if ( bAcheiParametros ) then begin

         ParamIntegra.sContaDebCred       := dtmImobiliario.qryPadrLancImovelCONTADEBCRE.AsString;
         ParamIntegra.sContaResult        := dtmImobiliario.qryPadrLancImovelCONTARESULT.AsString;
         ParamIntegra.sCentroCustoDebCred := dtmImobiliario.qryPadrLancImovelCENTROCUSTODEBCRE.AsString;
         ParamIntegra.sCentroCustoResult  := dtmImobiliario.qryPadrLancImovelCENTROCUSTORESULT.AsString;
         ParamIntegra.iUnidNegoc          := dtmImobiliario.qryPadrLancImovelUNIDNEGOC.AsInteger;
         ParamIntegra.sCodTipRecDes       := dtmImobiliario.qryPadrLancImovelCODTIPRECDES.AsString;
         ParamIntegra.iFlgIntegraCapCar   := dtmImobiliario.qryPadrLancImovelFLGINTEGRACAPCAR.AsInteger;
         ParamIntegra.iFlgIntegraContab   := dtmImobiliario.qryPadrLancImovelFLGINTEGRACONTAB.AsInteger;
         ParamIntegra.sCodCentroRespon    := dtmImobiliario.qryPadrLancImovelCODCENTRORESPON.AsString;
         ParamIntegra.sTipCodigo          := dtmImobiliario.qryPadrLancImovelTIPCODIGO.AsString;

         if (sRecPag = 'R') or (sRecPag = 'O') then begin
            ParamIntegra.sCentroCustoCredito    := dtmImobiliario.qryPadrLancImovelCENTROCUSTORESULT.AsString;
            ParamIntegra.sCentroCustoDebito     := dtmImobiliario.qryPadrLancImovelCENTROCUSTODEBCRE.AsString;
            ParamIntegra.sContaContabilCredito  := dtmImobiliario.qryPadrLancImovelCONTARESULT.AsString;
            ParamIntegra.sContaContabilDebito   := dtmImobiliario.qryPadrLancImovelCONTADEBCRE.AsString;
         end else begin
            ParamIntegra.sCentroCustoCredito    := dtmImobiliario.qryPadrLancImovelCENTROCUSTODEBCRE.AsString;
            ParamIntegra.sCentroCustoDebito     := dtmImobiliario.qryPadrLancImovelCENTROCUSTORESULT.AsString;
            ParamIntegra.sContaContabilCredito  := dtmImobiliario.qryPadrLancImovelCONTADEBCRE.AsString;
            ParamIntegra.sContaContabilDebito   := dtmImobiliario.qryPadrLancImovelCONTARESULT.AsString;
         end;

         // Verifica se o tipo de desembolso está ativo
         if dtmImobiliario.qryPadrLancImovelRECDES_ATIVO.AsString = 'N' then begin
            Result := -6;
         end;
         
         // Verifica se o os centros de custos estão ativo
         if ( (not dtmImobiliario.qryPadrLancImovelCENTROCUSTODEBCRE.IsNull) and
                  (dtmImobiliario.qryPadrlancImovelCCUSTD_ATIVO.AsString = 'N') ) or
            ( (not dtmImobiliario.qryPadrLancImovelCENTROCUSTORESULT.IsNull) and
                  (dtmImobiliario.qryPadrlancImovelCCUSTR_ATIVO.AsString = 'N') ) then begin
            Result := -7;
         end;

      end else begin
         // Erro: nenhum Padrão de Lançamento que atenda os parâmetros passados
         Result := -5;
      end;
   finally
      dtmImobiliario.qryPadrLancImovel.Close;
   end;
//*)
end;



//========================================================================================
// Função para Desfazer o abono de lancamentos abonados pela cobranca de divergencia
// Data : 28/02/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iDocumento  - id do Documento de Divergencia que será excluido
//
// Retorno : True  - Desfez o abono
//           False - Não Desfez o abono
//----------------------------------------------------------------------------------------
function TFuncoesImob.DesfazCobraDiverge(const iDocumento: Integer): Boolean;
var sSql : String;
    iDoc, iParc : Integer;
begin
   Result := True;
   // Procura Abonos relativos ao documento
   with dtmLancImovel do begin
      LimpaParametros(dtmLancImovel.qryConciliaDoc);

      qryConciliaDoc.ParamByName('PIDDOCDIVERGE').AsInteger := iDocumento;
      qryConciliaDoc.Open;
      // Desfaz os abonos feitos pela cobrança no documento
      if not qryConciliaDoc.isEmpty then begin
         qryConciliaDoc.First;

         try
            while not qryConciliaDoc.Eof do begin
               // Limpa o Flag de Conciliado no documento abonado
               sSql := 'UPDATE DOCUMENTO ' +
                       '   SET FLGNAOCONCILIADO = 1 ' +
                       ' WHERE CODDOCUMENTO = ' + IntToStr(qryConciliaDocIDDOCUMENTO.AsInteger);
               if not ExecutaQuery(dtmImobiliario.qryAux, sSql) then begin
                  Result := False;
               end;

               // Exclui os Lançamentos de Baixa por cobrança das divergências
               if (qryConciliaDocIDDOCUMENTO.AsInteger > 0) and
                  (qryConciliaDocNUMLANCTODIVERGE.AsInteger > 0) then begin
                  Documento.Excluir(dtmImobiliario.qryAux,
                                    qryConciliaDocIDDOCUMENTO.AsInteger,
                                    qryConciliaDocNUMLANCTODIVERGE.AsInteger);
               end;

               // Exclui o registro em CONCILIADOC
               if not qryConciliaDocIDDOCUMENTO.IsNull then
                    iDoc  := qryConciliaDocIDDOCUMENTO.AsInteger
               else iDoc  := -1;
               if not qryConciliaDocIDPARCFINANCIMOV.IsNull then
                    iParc := qryConciliaDocIDPARCFINANCIMOV.AsInteger
               else iParc := -1;

               CalcDocumento.ApagarMotivoConciliacao(iDoc, iParc, qryConciliaDocFLGTIPO.AsString);

               qryConciliaDoc.Next;
            end;
         except
            Result := False;
            Exit;
         end;
      end;
   end;
end;

function TFuncoesImob.RegistraErroDocumento(const iDocumento, iFlgErro: integer): Boolean;
var bTransacao : boolean;
begin
   Result := True;
   // Grava erro em TODOS os lançamentos com o idDocumento
   if not(dtmBaseDados.dbBaseDados.InTransaction) then begin
      bTransacao := True;
      StartTransacao;
   end else begin
      bTransacao := False;
   end;
   try
      with dtmLancImovel.qryRegistraErroDoc do begin
         LimpaParametros(dtmLancImovel.qryRegistraErroDoc);
         ParamByName('PIDDOCUMENTO').asInteger   := iDocumento;
         ParamByName('PFLGERRO').asInteger       := iFlgErro;
         ParamByName('PMSGERROINTEGRA').AsString := DescricaoErro(iFlgErro);
         ExecSQL;
      end;
      if bTransacao then CommitTransacao;
   except
      if bTransacao then RollBackTransacao;
      Result := False;
   end;
end;

end.

