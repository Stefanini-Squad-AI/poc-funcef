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
//                - dOperComum/dtmOperComum;
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

   // Faz Clear p/ todos os parâmetros de uma query
   procedure LimpaParametros(const qry: TwwQuery);
   function ExecutaQuery(qry: TwwQuery; const str: string): boolean;
   function FazQuery(var qry: TwwQuery; str: string): boolean;


type
   TFuncoesImob = Class

   private
      procedure CriaGrupoNovo(sCodigo: string);
      procedure InsereImovelGrupo(const iGrupo, iImovel: integer; fPercent: double);

      function ExisteRecDes(const iImovel, iTipoRecDes: integer): boolean;
      procedure AtualizaRecDes(const iImovel: integer);
      procedure CriaRecDes(const iImovel: integer);

      procedure MensagemErroContab(iResultado: integer);
      procedure MensagemErroPeriodo(iErroPeriodo: integer);

   public

      // função de busca de cotação de moeda
      function BuscaCotacao(iMoeda: integer; dDataCotacao : TDateTime; bDataExata: boolean): extended;

      // função de conversão de moeda (já devolve o valor convertido)
      function ConverteMoeda(iMoeda: integer; fValor: currency; dData: TDateTime; bDataExata: boolean): currency;
      function ReConverteMoeda(iMoeda: integer; fValor: currency; dData: TDateTime; bDataExata: boolean): currency;

      // função que busca o valor inicial da Cota de Carteiras de Investimento
      function BuscaPrimeiraCota: currency;

      // calcula o fator de correção (baseado em 1 índice) entre 2 determinadas datas
      function CalculaFatorCorrecao(iIndice: integer; dDataIni, dDataFim: TDateTime; bPodeNegativo: boolean): double;

      // exclui o compromisso orçamentario
      function ExcluiOrcamento(const iOrcamento: integer): shortint;

      // exclui um lançamento do Imobiliário
      function ExcluiLancImovel(const iDocumento, iPlanilha: integer; dData: TDateTime): shortint;

      // estorna um lançamento do Imobiliário
      function EstornaLancImovel(const iDocumento, iCodDocumento, iPlanilha: integer; dDataEstorno: TDateTime): shortint;

      // verifica em que dia deve vencer o aluguel do contrato em um determinado mês/ano
      function DataVencAluguel(const iContrato, iAno, iMes: integer; sTipoAluguel: char;
               bSomaTolera: boolean): TDateTime;

      function AgrupaDocumentos(iMesCompetencia, iAnoCompetencia: integer; dDataVenc: TDateTime;
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

      // Associa a parametrização contábil por tipo de imóvel ao imóvel
      procedure AssociaRecDes(const iImovel, iTipoRecDes: integer; sTipoImovel: string; bAtualiza: boolean);

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

      // Funções do Investimento -------------------------------------------------------------------

      // Função que retorna o saldo do Investimento Imovel em uma determinada data
      function SaldoImovelInvest(const iImovel: int64; const dData: TDateTime): currency;

      // Função que efetua o par de lançamentos Contábeis e o lançamento de CAPCAR (se aplicáveis)
      // associados a uma Operação de Investimento (de acordo com a tabela PadrLancContInv)
      function LancaOperInvest(iEmpresaProp, iModuloOrigem, iTipoInvest, iTipoOperacao, iOperacao,
      iForCli, iCarteira, iMoeda, iInvestimento, iPrograma, iPatro, iPlanoPrev: integer; sTipoTitulo,
      sComplemento, sTipoParcela, sCentroCustoAP, sHistCompl, sReferenciaAP, sObs: string; fVlrOMOper,
      fVlrOper: currency; dDataOper, dDataVencOper: TDateTime; bMostraMsg, bParcelado: boolean; var iPlano,
      iPlanilhaOper, iDocumentoOper, iFatura: integer; var fNoDoc: extended; var sHistoricoOper,
      sMensErro: string): integer;

      // Função que efetua o lançamento de Contas a Pagar / Receber
      function LancamentoCAPCARAP( iEmpresaProp, iModuloOrigem, iPlano, iPlanilha,
      iSubConta, iCodTipDoc, iUnidNegoc, iForCli, iMoeda, iPrograma, iPatro, iPlanoPrev: integer;
      fVlrOM, fVlrLanc: currency; sCentroRespon, sTipoRecDes, sConta, sCentroCusto, sDebCre,
      sComplementoDoc, sTipoParcelamento, sCentroCustoAP, sHistCompl, sReferenciaAP, sObs: string;
      dDataLanc, dDataVenc: TDateTime; cRecPagNao: char; bParcelar, bMostraMsg: boolean; var iDocumento,
      iNumFatura: integer; fNoDocumento: extended): boolean;
      // -------------------------------------------------------------------------------------------

      // Retorna a máscara do Plano de Contas
      function GetMascaraPlano(iPlano: integer): string;

      // Gera um nº de documento único
      function GeraNoDocumento(c: char): extended;

      // Retorna o "Grupo" do bem por extenso
      function GrupoExtenso(const sGrupo: string): string;

      // Função que "cria" um Imóvel, retornando seu IDIMOVEL
      function CriaImovel(const iImovelMestre: int64; const sImovel: string): int64;

	end;



var
  FuncoesImob : TFuncoesImob;



implementation
uses
   dBaseDados, uDataBase, uSistema, uDocumento, uModulo, uDiasInUteis, dImobiliario,
   uLancContab, uIntegraBack, uMensErro, uOperComum, dOperComum, uFuncaoGeral, uOrcamento,
   dLancImovel;



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

      //VerificaCondicoes
      -11: Result := 'Erro -11 = Lançamento de despesa cujo responsável não é a fundação';
      -12: Result := 'Erro -12 = Código de tipo de desembolso não informado';
      -13: Result := 'Erro -13 = Código de tipo de recebimento não informado';
      -14: Result := 'Erro -14 = Unidade de negócio não informado';
      -15: Result := 'Erro -15 = Código de centro de responsabilidade não informado';
      -16: Result := 'Erro -16 = Número de documento inválido';
      // -17: ERA USADO COM O FLGESTORNADO NULL - ANTES FLGESTORNADO GUARDAVA O CODDOCUMENTO
      -18: Result := 'Erro -18 = Tipo código não informado';

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
      -32: Result := 'Erro -31 = Não conseguiu criar o rateio do documento';
      -33: Result := 'Erro -33 = Erro ao atualizar "Número do Imóvel" ao lançar rateio de documento';
      -34: Result := 'Erro -34 = Erro genérico na integração do contas à pagar/receber';

      //Integra
      -40: Result := 'Erro -40 = Erro ao atualizar Lançamentos Imovel';

      //Alimenta Carteira
      -45: Result := 'Erro -45 = O Imóvel não consta em nenhuma Carteira de Investimento!';
      -46: Result := 'Erro -46 = Não foi possível alimentar a Carteira de Investimento!';

      //Contabilizar ou Financeiro
      -50: Result := 'Erro -50 = É necessário que os parâmetros sejam marcados para Integração na Contabilidadeo ou no Contas a pagar/receber.';

      //Responsável pela Cobrança
      -55: Result := 'Erro -55 = A tabela de parâmetros do sistema está vazia.';
      -56: Result := 'Erro -56 = Despesas de responsabilidade do Locatário.';
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
      'D' : result := 'Lançamento de Dívidas';
      'E' : result := 'Lançamento de Reembolso';
      'F' : result := 'Folha de Aluguéis';
      'I' : result := 'Imp. Prestação de Contas';
      'L' : result := 'Lançamento Individual';
      'M' : result := 'Lançamento Múltiplo';
      'P' : result := 'Prestação de Contas';
      'R' : result := 'Folha de Remunerações';
      'T' : result := 'Lançamento com Rateio';
      'V' : result := 'Lançamento de Previsão';
   else
      result := '';
   end;
end;


// retorna o nome do mes por extenso
function MesExtenso(const iMes: integer): string;
begin
   case iMes of
       1: result := 'Janeiro';
       2: result := 'Fevereiro';
       3: result := 'Março';
       4: result := 'Abril';
       5: result := 'Maio';
       6: result := 'Junho';
       7: result := 'Julho';
       8: result := 'Agosto';
       9: result := 'Setembro';
      10: result := 'Outubro';
      11: result := 'Novembro';
      12: result := 'Dezembro';
   else
      result := '';
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

            if fCotacaoFim >= 0 then begin
               fFatorCorrecao := fFatorCorrecao * (1 + abs(fCotacaoFim / 100) );
            end else begin
               fFatorCorrecao := fFatorCorrecao / (1 + abs(fCotacaoFim / 100) );
            end;

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

function TFuncoesImob.BuscaPrimeiraCota: currency;
begin
   dtmImobiliario.qryParamInvest.Close;
   dtmImobiliario.qryParamInvest.Open;

   Result := 0;
   if not(dtmImobiliario.qryParamInvest.isEmpty) then Result := dtmImobiliario.qryParamInvestVLRCOTAINICART.asFloat;

   dtmImobiliario.qryParamInvest.Close;
end;

//==================================================================================================



//==================================================================================================
//    Exclusão do Orçamento
//==================================================================================================

function TFuncoesImob.ExcluiOrcamento(const iOrcamento: integer): shortint;
var
   Orcamento      : TOrcamentoBack;
   iNumOrcamento  : integer;
begin
   Result := 0;

   Orcamento := nil;

   try

      Orcamento      := TOrcamentoBack.Create;
      iNumOrcamento  := Orcamento.BuscaIdNumReserva(iOrcamento, 0, True);

      Orcamento.CancelaCompromisso(iNumOrcamento, True);

   finally
      Orcamento.Free;
   end;
end;



//==================================================================================================
//    Estorno / Exclusão de Lançamentos
//==================================================================================================

function TFuncoesImob.ExcluiLancImovel(const iDocumento, iPlanilha: integer; dData: TDateTime): shortint;
var
   bTransacao           : boolean;
   iExercicio           : integer;
   iPeriodo, iEmpresa   : integer;
   sMsg                 : string;
begin
   Result := 0;

// -------------------------------------------------------------------------------------------------

   // Primeiro, verifica se é possível excluir a planilha
   // Senão, pára por aqui...
   iEmpresa := Sistema.idEmpresa;

   if TestaPeriodo(False, 'BASEDADOS', DateToStr(dData), '64', iExercicio, iPeriodo, iEmpresa, sMsg) > 0 then begin
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

         // excluir o orcamento
         if not(dtmImobiliario.qryLancImovelIDRESERVAORCAMEN.IsNull) then begin
            ExcluiOrcamento(dtmImobiliario.qryLancImovelIDRESERVAORCAMEN.AsInteger);
         end;

         // encontra o registro na HistCartInv
         with dtmImobiliario.qryBuscaHistLanc do begin
            LimpaParametros(dtmImobiliario.qryBuscaHistLanc);
            ParamByName('PIDDOCUMENTO').asInteger := iDocumento;
            Open;

            while not(EOF) do begin
               // marca os registros necessários p/ recálculo dos saldos da Carteira de Investimentos
               OperComum.MarcaFlgHistCartInv('HST', dtmImobiliario.qryBuscaHistLancIDHISTCARTINV.AsInteger);

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

   // -------------------------------------------------------------------------------------------------

         // exclui o Lançamento no Imobiliário
         with dtmImobiliario.qryExcluiLancImovel do begin
            LimpaParametros(dtmImobiliario.qryExcluiLancImovel);
            ParamByName('PIDDOCUMENTO').asInteger := iDocumento;
            ExecSQL;
         end;

         Application.ProcessMessages;

         // exclui a Observação (se houver)
         FuncoesImob.DeleteObsLanc(iDocumento);

         Application.ProcessMessages;

   // -------------------------------------------------------------------------------------------------

         // exclui os RecbtoPagto
         with dtmImobiliario.qryExcluiRecbtoPagto do begin
            LimpaParametros(dtmImobiliario.qryExcluiRecbtoPagto);
            ParamByName('PCODDOCUMENTO').asInteger := iDocumento;
            ExecSQL;
         end;

         Application.ProcessMessages;

         // exclui os LanctoDocum
         with dtmImobiliario.qryExcluiLanctoDocum do begin
            LimpaParametros(dtmImobiliario.qryExcluiLanctoDocum);
            ParamByName('PCODDOCUMENTO').asInteger := iDocumento;
            ExecSQL;
         end;

         Application.ProcessMessages;

         // exclui os LoteXDocum
         with dtmImobiliario.qryExcluiLotexDocum do begin
            LimpaParametros(dtmImobiliario.qryExcluiLotexDocum);
            ParamByName('PCODDOCUMENTO').asInteger := iDocumento;
            ExecSQL;
         end;

         Application.ProcessMessages;

         // exclui os RateioDocum
         with dtmImobiliario.qryExcluiRateioDocum do begin
            LimpaParametros(dtmImobiliario.qryExcluiRateioDocum);
            ParamByName('PCODDOCUMENTO').asInteger := iDocumento;
            ExecSQL;
         end;

         Application.ProcessMessages;

         // exclui o Documento
         with dtmImobiliario.qryExcluiDocumento do begin
            LimpaParametros(dtmImobiliario.qryExcluiDocumento);
            ParamByName('PCODDOCUMENTO').asInteger := iDocumento;
            ExecSQL;
         end;

   // -------------------------------------------------------------------------------------------------

         // só exclui a planilha se esta existir, é claro...
         if iPlanilha <> -1 then begin

            // exclui os lançamentos da planilha
            with dtmImobiliario.qryExcluiLancContab do begin
               LimpaParametros(dtmImobiliario.qryExcluiLancContab);
               ParamByName('PPLNCODIGO').asInteger := iPlanilha;
               ExecSQL;
            end;

            Application.ProcessMessages;

            // exclui a planilha
            with dtmImobiliario.qryExcluiPlanilha do begin
               LimpaParametros(dtmImobiliario.qryExcluiPlanilha);
               ParamByName('PPLNCODIGO').asInteger := iPlanilha;
               ExecSQL;
            end;

         end;

         // Commit aqui, senão lançamentos sem contabilização näo commitam
         if ( (bTransacao) and (dtmBaseDados.dbBaseDados.InTransaction) ) then CommitTransacao;

   // -------------------------------------------------------------------------------------------------

      except
         if ( (bTransacao) and (dtmBaseDados.dbBaseDados.InTransaction) ) then RollBackTransacao;
         Result := 1;
      end;

   finally
      LimpaParametros(dtmImobiliario.qryBuscaHistLanc);
      LimpaParametros(dtmImobiliario.qryExcluiHistLanc);
      LimpaParametros(dtmImobiliario.qryExcluiLancImovel);
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

         // encontra o registro na HistCartInv
         with dtmImobiliario.qryBuscaHistLanc do begin
            LimpaParametros(dtmImobiliario.qryBuscaHistLanc);
            ParamByName('PIDDOCUMENTO').asInteger := iDocumento;
            Open;

            while not(EOF) do begin
               // marca os registros necessários p/ recálculo dos saldos da Carteira de Investimentos
               OperComum.MarcaFlgHistCartInv('HST', dtmImobiliario.qryBuscaHistLancIDHISTCARTINV.AsInteger);

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

// -------------------------------------------------------------------------------------------------

         // Marca o Lançamento como "Estornado"
         with dtmImobiliario.qryEstornaLancImovel do begin
            LimpaParametros(dtmImobiliario.qryEstornaLancImovel);
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
function TFuncoesImob.DataVencAluguel(const iContrato, iAno, iMes: integer; sTipoAluguel: char; bSomaTolera: boolean): TDateTime;
var
   iPais, iCidade, iDiasTolera                         : integer;
   iDiaAluguel, iMesAluguel, iAnoAluguel, iDiaCompl    : integer;

   bPrimeiroUtil, bUtilTolera,bUtilAluguel, bUtilCompl : boolean;

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
         iDiaCompl         := dtmImobiliario.qryDataVencAluguelCONDIACOMPLEMENTO.AsInteger;
         iDiasTolera       := dtmImobiliario.qryDataVencAluguelCONDIASTOLERANCIA.AsInteger;

         bUtilAluguel      := dtmImobiliario.qryDataVencAluguelFLGTIPODIAVENC.AsString = 'U';
         bUtilCompl        := dtmImobiliario.qryDataVencAluguelFLGTIPODIACOMPL.AsString = 'U';
         bUtilTolera       := dtmImobiliario.qryDataVencAluguelFLGTIPODIATOLERA.AsString = 'U';

      end else begin
         // erro (Result := 0)
         Result := dDataVenc;
         Exit;
      end;

      // TODO -oAndre : Que porra é essa ?
      // ALEX REFER 27/03/2001
      // DEFINIR MES DE VENCIMENTO DO ALUGUEL
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
      // FIM ALEX REFER 27/03/2001
      // DEFINIR MES DE VENCIMENTO DO ALUGUEL

      // faz a calculeira
      Case sTipoAluguel of

         'A': // Principal
         begin

            // 1º: só vencimento
            if bUtilAluguel then begin
               dDataVenc := DiasInUteis.EnesimoDiaUtilMes(iAno, iMes, iDiaAluguel, iCidade, iPais,
               sEstado, True, False, False);
            end else begin
               if iDiaAluguel >= 29 then begin
                  dDataVenc := DiasInUteis.UltDiaMes(iAno, iMes);
               end else begin
                  dDataVenc := EncodeDate(iAno, iMes, iDiaAluguel);
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

function TFuncoesImob.AgrupaDocumentos(iMesCompetencia, iAnoCompetencia: integer; dDataVenc: TDateTime;
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
            if dDataVenc > 0 then         ParamByName('PDATAVENCIMENTO').AsDateTime := dDataVenc;

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




//==================================================================================================
//    Associação de parametrização contábil a Imóveis
//==================================================================================================

procedure TFuncoesImob.AssociaRecDes(const iImovel, iTipoRecDes: integer; sTipoImovel: string; bAtualiza: boolean);
var
   iTipoRecDesRetorno : integer;
begin
   try
      with dtmImobiliario.qryRecDesXTipoImovel do begin
         LimpaParametros(dtmImobiliario.qryRecDesXTipoImovel);

         ParamByName('PCODTIPIMOVEL').asString := sTipoImovel;
         if iTipoRecDes > -1 then ParamByName('PIDTIPOCUSTORECIMO').asInteger := iTipoRecDes;

         Open;

         if not(isEmpty) then begin

            StartTransacao;

            try

               First;
               while not(EOF) do begin

                  iTipoRecDesRetorno := dtmImobiliario.qryRecDesXTipoImovelIDTIPOCUSTORECIMO.AsInteger;

                  if ExisteRecDes(iImovel, iTipoRecDesRetorno) then begin

// ----------------- // bacalho ----------------------------------------------------------------

                     RollBackTransacao;
                     Exit;

// ----------------- // bacalho ----------------------------------------------------------------

                     if bAtualiza then AtualizaRecDes(iImovel);

                  end else begin
                     CriaRecDes(iImovel);
                  end;

                  Application.ProcessMessages;
                  Next;
               end;

               CommitTransacao;

            except
               RollBackTransacao;
            end;
         end;

      end;

   finally
      LimpaParametros(dtmImobiliario.qryRecDesXTipoImovel);
   end;
end;

//==================================================================================================

function TFuncoesImob.ExisteRecDes(const iImovel, iTipoRecDes: integer): boolean;
begin
   try
      with dtmImobiliario.qryExisteRecDesXImovel do begin
         LimpaParametros(dtmImobiliario.qryTipoRecDesXImovel);
         ParamByName('PIDIMOVEL').AsInteger           := iImovel;
         ParamByName('PIDTIPOCUSTORECIMO').AsInteger  := iTipoRecDes;
         Open;

         Result := not(IsEmpty);
      end;

   finally
      LimpaParametros(dtmImobiliario.qryExisteRecDesXImovel);
   end;
end;

//==================================================================================================

procedure TFuncoesImob.AtualizaRecDes(const iImovel: integer);
begin
   try
      with dtmImobiliario.qryUpdateRecDesImovel do begin
         LimpaParametros(dtmImobiliario.qryUpdateRecDesImovel);

         ParamByName('PIDTIPOCUSTORECIMO').AsInteger     := dtmImobiliario.qryRecDesXTipoImovelIDTIPOCUSTORECIMO.AsInteger;
         ParamByName('PIDIMOVEL').AsInteger              := iImovel;
         ParamByName('PIDPESSOA').AsInteger              := dtmImobiliario.qryRecDesXTipoImovelIDPESSOA.AsInteger;
         ParamByName('PFLGINTEGRACAPCAR').AsInteger      := dtmImobiliario.qryRecDesXTipoImovelFLGINTEGRACAPCAR.AsInteger;
         ParamByName('PFLGINTEGRACONTAB').AsInteger      := dtmImobiliario.qryRecDesXTipoImovelFLGINTEGRACONTAB.AsInteger;
         ParamByName('PRECPAG').AsString                 := dtmImobiliario.qryRecDesXTipoImovelRECPAG.AsString;

         if not(dtmImobiliario.qryRecDesXTipoImovelCODCENTRORESPON.IsNULL) then
            ParamByName('PCODCENTRORESPON').AsString     := dtmImobiliario.qryRecDesXTipoImovelCODCENTRORESPON.AsString;

         if not(dtmImobiliario.qryRecDesXTipoImovelCENTROCUSTOResult.IsNULL) then
            ParamByName('PCENTROCUSTOResult').AsString   := dtmImobiliario.qryRecDesXTipoImovelCENTROCUSTOResult.AsString;

         if not(dtmImobiliario.qryRecDesXTipoImovelCONTAResult.IsNULL) then
            ParamByName('PCONTAResult').AsString         := dtmImobiliario.qryRecDesXTipoImovelCONTAResult.AsString;

         if not(dtmImobiliario.qryRecDesXTipoImovelTIPCODIGO.IsNULL) then
            ParamByName('PTIPCODIGO').AsString           := dtmImobiliario.qryRecDesXTipoImovelTIPCODIGO.AsString;

         if not(dtmImobiliario.qryRecDesXTipoImovelSUBCONTAResult.IsNULL) then
            ParamByName('PSUBCONTAResult').AsInteger     := dtmImobiliario.qryRecDesXTipoImovelSUBCONTAResult.AsInteger;

         if not(dtmImobiliario.qryRecDesXTipoImovelCODTIPDESEMB.IsNULL) then
            ParamByName('PCODTIPDESEMB').AsString        := dtmImobiliario.qryRecDesXTipoImovelCODTIPDESEMB.AsString;

         if not(dtmImobiliario.qryRecDesXTipoImovelCODTIPRECEB.IsNULL) then
            ParamByName('PCODTIPRECEB').AsString         := dtmImobiliario.qryRecDesXTipoImovelCODTIPRECEB.AsString;

         if not(dtmImobiliario.qryRecDesXTipoImovelPLANO.IsNULL) then
            ParamByName('PPLANO').AsInteger              := dtmImobiliario.qryRecDesXTipoImovelPLANO.AsInteger;

         if not(dtmImobiliario.qryRecDesXTipoImovelCONTADEBCRE.IsNULL) then
            ParamByName('PCONTADEBCRE').AsInteger        := dtmImobiliario.qryRecDesXTipoImovelCONTADEBCRE.AsInteger;

         if not(dtmImobiliario.qryRecDesXTipoImovelSUBCONTADEBCRE.IsNULL) then
            ParamByName('PSUBCONTADEBCRE').AsInteger     := dtmImobiliario.qryRecDesXTipoImovelSUBCONTADEBCRE.AsInteger;

         if not(dtmImobiliario.qryRecDesXTipoImovelUNIDNEGOC.IsNULL) then
            ParamByName('PUNIDNEGOC').AsInteger          := dtmImobiliario.qryRecDesXTipoImovelUNIDNEGOC.AsInteger;

         if not(dtmImobiliario.qryRecDesXTipoImovelIDEMPRESA.IsNULL) then
            ParamByName('PIDEMPRESA').AsInteger          := dtmImobiliario.qryRecDesXTipoImovelIDEMPRESA.AsInteger;

         if not(dtmImobiliario.qryRecDesXTipoImovelCENTROCUSTODEBCRE.IsNULL) then
            ParamByName('PCENTROCUSTODEBCRE').AsString   := dtmImobiliario.qryRecDesXTipoImovelCENTROCUSTODEBCRE.AsString;

         ExecSQL;
      end;

   finally
      LimpaParametros(dtmImobiliario.qryUpdateRecDesImovel);
   end;
end;

//==================================================================================================

procedure TFuncoesImob.CriaRecDes(const iImovel: integer);
begin
   try
      with dtmImobiliario.qryInsertRecDesImovel do begin
         LimpaParametros(dtmImobiliario.qryInsertRecDesImovel);

         ParamByName('PIDTIPOCUSTORECIMO').AsInteger     := dtmImobiliario.qryRecDesXTipoImovelIDTIPOCUSTORECIMO.AsInteger;
         ParamByName('PIDIMOVEL').AsInteger              := iImovel;
         ParamByName('PIDPESSOA').AsInteger              := dtmImobiliario.qryRecDesXTipoImovelIDPESSOA.AsInteger;
         ParamByName('PFLGINTEGRACAPCAR').AsInteger      := dtmImobiliario.qryRecDesXTipoImovelFLGINTEGRACAPCAR.AsInteger;
         ParamByName('PFLGINTEGRACONTAB').AsInteger      := dtmImobiliario.qryRecDesXTipoImovelFLGINTEGRACONTAB.AsInteger;
         ParamByName('PRECPAG').AsString                 := dtmImobiliario.qryRecDesXTipoImovelRECPAG.AsString;

         if not(dtmImobiliario.qryRecDesXTipoImovelCODCENTRORESPON.IsNULL) then
            ParamByName('PCODCENTRORESPON').AsString     := dtmImobiliario.qryRecDesXTipoImovelCODCENTRORESPON.AsString;

         if not(dtmImobiliario.qryRecDesXTipoImovelCENTROCUSTOResult.IsNULL) then
            ParamByName('PCENTROCUSTOResult').AsString   := dtmImobiliario.qryRecDesXTipoImovelCENTROCUSTOResult.AsString;

         if not(dtmImobiliario.qryRecDesXTipoImovelCONTAResult.IsNULL) then
            ParamByName('PCONTAResult').AsString         := dtmImobiliario.qryRecDesXTipoImovelCONTAResult.AsString;

         if not(dtmImobiliario.qryRecDesXTipoImovelTIPCODIGO.IsNULL) then
            ParamByName('PTIPCODIGO').AsString           := dtmImobiliario.qryRecDesXTipoImovelTIPCODIGO.AsString;

         if not(dtmImobiliario.qryRecDesXTipoImovelSUBCONTAResult.IsNULL) then
            ParamByName('PSUBCONTAResult').AsInteger     := dtmImobiliario.qryRecDesXTipoImovelSUBCONTAResult.AsInteger;

         if not(dtmImobiliario.qryRecDesXTipoImovelCODTIPDESEMB.IsNULL) then
            ParamByName('PCODTIPDESEMB').AsString        := dtmImobiliario.qryRecDesXTipoImovelCODTIPDESEMB.AsString;

         if not(dtmImobiliario.qryRecDesXTipoImovelCODTIPRECEB.IsNULL) then
            ParamByName('PCODTIPRECEB').AsString         := dtmImobiliario.qryRecDesXTipoImovelCODTIPRECEB.AsString;

         if not(dtmImobiliario.qryRecDesXTipoImovelPLANO.IsNULL) then
            ParamByName('PPLANO').AsInteger              := dtmImobiliario.qryRecDesXTipoImovelPLANO.AsInteger;

         if not(dtmImobiliario.qryRecDesXTipoImovelCONTADEBCRE.IsNULL) then
            ParamByName('PCONTADEBCRE').AsInteger        := dtmImobiliario.qryRecDesXTipoImovelCONTADEBCRE.AsInteger;

         if not(dtmImobiliario.qryRecDesXTipoImovelSUBCONTADEBCRE.IsNULL) then
            ParamByName('PSUBCONTADEBCRE').AsInteger     := dtmImobiliario.qryRecDesXTipoImovelSUBCONTADEBCRE.AsInteger;

         if not(dtmImobiliario.qryRecDesXTipoImovelUNIDNEGOC.IsNULL) then
            ParamByName('PUNIDNEGOC').AsInteger          := dtmImobiliario.qryRecDesXTipoImovelUNIDNEGOC.AsInteger;

         if not(dtmImobiliario.qryRecDesXTipoImovelIDEMPRESA.IsNULL) then
            ParamByName('PIDEMPRESA').AsInteger          := dtmImobiliario.qryRecDesXTipoImovelIDEMPRESA.AsInteger;

         if not(dtmImobiliario.qryRecDesXTipoImovelCENTROCUSTODEBCRE.IsNULL) then
            ParamByName('PCENTROCUSTODEBCRE').AsString   := dtmImobiliario.qryRecDesXTipoImovelCENTROCUSTODEBCRE.AsString;

         if dtmImobiliario.qryRecDesXTipoImovelRECPAG.AsString = 'P' then begin
            ParamByName('PFLGRESPPAGAMENTO').AsString := 'F';
         end else begin
            ParamByName('PFLGRESPPAGAMENTO').AsString := 'L';
         end;

         ExecSQL;
      end;

   finally
      LimpaParametros(dtmImobiliario.qryInsertRecDesImovel);
   end;
end;

//==================================================================================================
//    Fim de Associação de parametrização contábil
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

   LimpaParametros(dtmImobiliario.qryCC_Imovel);

   try

      with dtmImobiliario.qryCC_Imovel do begin

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

   LimpaParametros(dtmImobiliario.qryCC_Mestre);

   try

      with dtmImobiliario.qryCC_Mestre do begin

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
//    Funções de Investimento
//==================================================================================================

// Função que retorna o saldo do investimento Imóvel em uma determinada data
function TFuncoesImob.SaldoImovelInvest(const iImovel: int64; const dData: TDateTime): currency;
begin
   with dtmImobiliario.qrySaldoImovelInvest do begin
      LimpaParametros(dtmImobiliario.qrySaldoImovelInvest);
      ParamByName('PIDINVESTIMENTO').AsInteger  := iImovel;
      ParamByName('PDATAMOVCARTINV').AsDateTime := dData;
      Open;

      Result := dtmImobiliario.qrySaldoImovelInvestSALDOVLRINVCART.asCurrency;
   end;
end;

// -------------------------------------------------------------------------------------------------
//    LancaOperInvest:  Função que efetua o par de lançamentos Contábeis e o lançamento de CAPCAR
//                      (se aplicáveis) associados a uma Operação de Investimento (de acordo com a
//                      tabela PadrLancContInv), não considerando, contudo, as Despesas
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       iEmpresaProp      :  id da Empresa Proprietária                      (Sistema.idEmpresa)
//       iModuloOrigem     :  id do Módulo que vai gerar o lançamento         (Sistema.idModulo)
//       iTipoInvest       :  id do Tipo de Investimento, tabela TipoInvest   (idTipoInvest)
//       iTipoOperacao     :  id do Tipo de Operacao, tabela TipoOperacao     (idTipoOperacao)
//       iOperacao         :  id da Operacao, tabela OperacaoInvest           (idOperacaoInvest)
//       iForCli           :  id do Fornecedor ou Cliente                     (idForCli)
//       iCarteira         :  id da Carteira
//       iMoeda            :  id da Moeda da Operação                         (idMoeda)
//       sTipoTitulo       :  código do Tipo de Título, tabela CodTipoTitulo  (CodTipTitulo)
//       sRecPagNao        :  string que define o lançamento (P=Pagar, R=Receber, N=Não há)
//       fVlrOM            :  valor da operação em outra moeda
//       fVlrOper          :  valor da operação na moeda corrente
//       dDataOper         :  data da operação
//       dDataVencimento   :  data da operação
//       bMostraMsg        :  True  - mostra mensagens
//                            False - não mostra mensagens
//
//    A função retorna também
//       iPlano            :  plano de contas usado para os lançamentos contábeis
//       iPlanilhaRetorno  :  planilha onde foram efetuados os lançamentos contábeis
//       iDocumentoRetorno :  documento que contém o lançamento a Pagar / Receber
//       sHistoricoOper    :  histórico da Operação, segundo PadrLancContInv
//       sMensErro         :  mensagem de erro devolvida pela LancaContab
//
//    Códigos de retorno (controle de erro):
//        0 : Lançamento(s) realizados com sucesso
//       -1 : Tipo de Operação não gera Lançamento Contábil nem Lançamento CAP/CAR
//       -2 : Operação com valor igual a ZERO
//       -3 : Erro de gravação
//       -4 : Erro: ambigüidade no Padrão de Lançamento
//       -5 : Erro: nenhum Padrão de Lançamento que atenda os parâmetros passados
//       -6 : Erro: não foi possível efetuar o lançamento contábil
//       -7 : Erro: não foi possível efetuar o lançamento de CAP/CAR
//
//--------------------------------------------------------------------------------------------------
function TFuncoesImob.LancaOperInvest(iEmpresaProp, iModuloOrigem, iTipoInvest, iTipoOperacao,
iOperacao, iForCli, iCarteira, iMoeda, iInvestimento, iPrograma, iPatro, iPlanoPrev: integer;
sTipoTitulo, sComplemento, sTipoParcela, sCentroCustoAP, sHistCompl, sReferenciaAP, sObs: string;
fVlrOMOper, fVlrOper: currency; dDataOper, dDataVencOper: TDateTime; bMostraMsg, bParcelado: boolean;
var iPlano, iPlanilhaOper, iDocumentoOper, iFatura: integer; var fNoDoc: extended; var sHistoricoOper,
sMensErro: string): integer;
var
   iSubContaCred, iSubContaDeb, iUnidNegoc, iTipoDoc : integer;
   sContaCred, sContaDeb, sCentroCustoCred, sCentroCustoDeb, sCentroRespon, sRecPagNao,
   sTipoPer, sRecPag, sTipoRecDes: string;
   bTransacao, bContabiliza, bLancaCAPCAR: boolean;
begin
   Result := 0;
   bTransacao     := False; // a priori, não é necessário que se inicie uma transação

   try

      try

// @X Verificação dos parâmetros do Tipo de Operação -----------------------------------------------

         with dtmOperComum.qryTipoOperacao do begin
            LimpaParametros(dtmOperComum.qryTipoOperacao);
            ParamByName('TIPOINVEST').AsInteger    := iTipoInvest;
            ParamByName('TIPOOERACAO').AsInteger   := iTipoOperacao;
            Open;

            iTipoDoc       := FieldByName('CODTIPDOC').AsInteger;
            bContabiliza   := FieldByName('FLGGERACONTAB').AsInteger = 1;
            bLancaCAPCAR   := FieldByName('FLGGERACAPCAR').AsInteger = 1;
            sRecPag        := FieldByName('RECPAG').AsString;
         end;


// @X Início do processamento ----------------------------------------------------------------------

         // só vai adiante se for necessário fazer algum tipo de lançamento (Contábil ou CAP/CAR)...
         if ( (bContabiliza) or (bLancaCAPCAR) ) then begin

            if fVlrOper <> 0 then begin

               // verifica se já existe transação em andamento; se não houver, inicia uma
               if not(dtmBaseDados.dbBaseDados.InTransaction) then begin
                  bTransacao := True;
                  StartTransacao;
               end else begin
                  bTransacao := False;
               end;


// @X Busca da PadrLancContInv p/ fazer os lançamentos ---------------------------------------------

               // Verifica o Padrão de Lançamento mais adequado
               Result := OperComum.BuscaPadrLanc(iEmpresaProp, iTipoInvest, iTipoOperacao, 0{iTipoDespesa},
                         iInvestimento, iCarteira, fVlrOper, sTipoTitulo, 'OPE', iPlano, iSubContaDeb,
                         iSubContaCred, iUnidNegoc, sContaDeb, sContaCred, sCentroCustoDeb,
                         sCentroCustoCred, sCentroRespon, sTipoRecDes, sTipoPer, sHistoricoOper,
                         sRecPagNao);

               // Se vai tudo bem ainda...
               if Result = 0 then begin

                  // Modula o valor da operação
                  fVlrOper := abs(fVlrOper);


// @X Chamada às funções de integração Contábil e Financeira ---------------------------------------

                  if bContabiliza then begin

                     if iPlanilhaOper = -1 then iPlanilhaOper := 0;

                     if not(OperComum.LancamentoContabil(iEmpresaProp, iModuloOrigem, iPlano, iSubContaDeb,
                     iSubContaCred, iUnidNegoc, iForCli, -1, -1, sContaDeb, sContaCred, sCentroCustoDeb,
                     sCentroCustoCred, sHistoricoOper, sTipoPer, sRecPag, dDataOper, fVlrOper,
                     bMostraMsg, iPlanilhaOper, sMensErro) )
                     then Result := -6; // não foi possível efetuar o lançamento contábil

                  end;

                  // se é para ser feita contabilização e esta tiver sido efetuada com sucesso,
                  // ou se não é necessário contabilizar
                  if ( (bLancaCAPCAR) and (sRecPagNao <> 'N') ) then begin
                     if ( ((bContabiliza) and (Result = 0)) or (not(bContabiliza)) ) then begin

                        case sRecPagNao[1] of
                           'P':
                           if not(LancamentoCAPCARAP(iEmpresaProp, iModuloOrigem, iPlano, iPlanilhaOper,
                           iSubContaCred, iTipoDoc, iUnidNegoc, iForCli, iMoeda, iPrograma, iPatro,
                           iPlanoPrev, fVlrOMOper, fVlrOper, sCentroRespon, sTipoRecDes, sContaCred,
                           sCentroCustoCred, 'C', sComplemento, sTipoParcela, sCentroCustoAP, sHistCompl,
                           sReferenciaAP, sObs, dDataOper, dDataVencOper, sRecPagNao[1], bParcelado,
                           bMostraMsg, iDocumentoOper, iFatura, fNoDoc))
                           then Result := -7; // não foi possível efetuar o lançamento de CAP/CAR

                           'R':
                           if not(LancamentoCAPCARAP(iEmpresaProp, iModuloOrigem, iPlano, iPlanilhaOper,
                           iSubContaCred, iTipoDoc, iUnidNegoc, iForCli, iMoeda, iPrograma, iPatro,
                           iPlanoPrev, fVlrOMOper, fVlrOper, sCentroRespon, sTipoRecDes, sContaCred,
                           sCentroCustoCred, 'D', sComplemento, sTipoParcela, sCentroCustoAP, sHistCompl,
                           sReferenciaAP, sObs, dDataOper, dDataVencOper, sRecPagNao[1], bParcelado,
                           bMostraMsg, iDocumentoOper, iFatura, fNoDoc))
                           then Result := -7; // não foi possível efetuar o lançamento de CAP/CAR
                        end;
                     end;

                  end else begin
                     iDocumentoOper := -1;
                  end;


// @X Finalmentes (integração já foi disparada, com sucesso ou não) --------------------------------

                  // Tudo havendo corrido bem...
                  if ( (bTransacao) and (dtmBaseDados.dbBaseDados.InTransaction) ) then CommitTransacao;

               end;

            end else begin
               iDocumentoOper := -1;
               iPlanilhaOper  := -1;

               Result := -2; // Operação com valor igual a ZERO
            end;

         end else begin
            iDocumentoOper := -1;
            iPlanilhaOper  := -1;

            Result := -1; // não gera Lançamento Contábil nem Lançamento CAP/CAR
         end;

      except
         if bTransacao then RollBackTransacao;

         Result := -3; // Erro de gravação
         if bMostraMsg then Raise;
      end;

   finally
      if ( (Result < 0) and (bTransacao) and (dtmBaseDados.dbBaseDados.InTransaction) ) then RollBackTransacao;
   end;
end;





//--------------------------------------------------------------------------------------------------
//    LancamentoCAPCARAP:   Função que efetua o lançamento de Contas a Pagar / Receber
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       iEmpresaProp   :  id da Empresa Proprietária                      (Sistema.idEmpresa)
//       iModuloOrigem  :  id do Módulo que vai gerar o lançamento         (Sistema.idModulo)
//       iPlano         :  plano de contas da empresa em questão           (IntegraBack.Plano)
//       iSubConta      :  sub-conta da "perna" de contas a pagar/receber
//       iCodTipDoc     :  id do tipo de documento de contas a Pagar/Receber
//       iUnidNegoc     :  atividade/projeto
//       iForCli        :  id do Cliente / Fornecedor associado ao lançamento
//       iMoeda         :  id da Moeda do lançamento
//       fVlrOM         :  valor do lançamento
//       fVlrLanc       :  valor do lançamento
//       sCentroRespon  :  código do Centro de Responsabilidade
//       sTipoRecDes    :  código do Tipo de Recebimento ou Desembolso
//       sConta         :  conta da "perna" de contas a pagar/receber
//       sCentroCusto   :  centro de custo da "perna" de contas a pagar/receber
//       sCentroCustoAP :  centro de custo necessário à AP
//       sCebCre        :
//       sComplemento   :  complemento do nº do Documento (NoDoc)
//       sTipoParcela   :  'T' - Total
//                         'P' - Parcela
//       dDataLanc      :  data do lançamento
//       dDataVenc      :  data de vencimento do lançamento
//       cRecPagNao     :  flag que indica se o lançamento é de Contas a Pagar ou Contas a Receber
//       bParcelado     :  indica se haverá parcelamento
//       bMostraMsg     :  True  - mostra mensagens
//                         False - não mostra mensagens
//
//    A função retorna também
//       iDocumento     :  documento que contém o lançamento
//       iNumFatura     :  nº da Fatura (para reaproveitamento quando parcelado)
//       fNumDocumento  :  NoDoc (para reaproveitamento quando parcelado)
//
//--------------------------------------------------------------------------------------------------
function TFuncoesImob.LancamentoCAPCARAP( iEmpresaProp, iModuloOrigem, iPlano, iPlanilha,
iSubConta, iCodTipDoc, iUnidNegoc, iForCli, iMoeda, iPrograma, iPatro, iPlanoPrev: integer; fVlrOM,
fVlrLanc: currency; sCentroRespon, sTipoRecDes, sConta, sCentroCusto, sDebCre, sComplementoDoc,
sTipoParcelamento, sCentroCustoAP, sHistCompl, sReferenciaAP, sObs: string; dDataLanc, dDataVenc: TDateTime;
cRecPagNao: char; bParcelar, bMostraMsg: boolean; var iDocumento, iNumFatura: integer; fNoDocumento: extended): boolean;
var
   iNumLancamento, iPortador: integer;
   sPlano, sModulo, sOperacao, sStatus : string;
   sDataLanc, sDataVenc : string;
   qryLancaDocumento, qryAuxiliar : TwwQuery;
begin

   try
      qryAuxiliar := dtmOperComum.qryAuxiliar;
      // gera o identificador incremental da tabela DOCUMENTO
      iDocumento  := Documento.GetCodigo(qryAuxiliar);
      iPortador   := -1;

      sModulo     := IntToStr(iModuloOrigem);

      sDataLanc   := DateToStr(dDataLanc);
      sDataVenc   := DateToStr(dDataVenc);

      qryLancaDocumento := dtmOperComum.qryLancaDocumento;
      qryAuxiliar       := dtmOperComum.qryAuxiliar;

      // se o documento não houver sido informado
      if fNoDocumento <= 0 then fNoDocumento := GeraNoDocumento(cRecPagNao);

      // se for parcelado e não houver sido informado um nº de fatura
      if bParcelar then begin
         if iNumFatura <=0 then iNumFatura := Documento.GetNumFatura(qryAuxiliar);
      end else begin
         iNumFatura := 0;
      end;

      // define os parâmetros em função do tipo de lançamento
      if bParcelar then begin
         if sTipoParcelamento = 'T' then begin
            sOperacao   := '1';
            sStatus     := '2';
         end;
         if sTipoParcelamento = 'P' then begin
            sOperacao   := '3';
            sStatus     := '';
         end;
      end else begin
         sOperacao   := '2';
         sStatus     := '';
      end;

      // Observação do documento = Histórico contabilidade
      Documento.Obs        := sObs;
      Documento.Referencia := sReferenciaAP;

      Documento.Inserir(qryLancaDocumento, iDocumento, sModulo, sPlano, sConta, sCentroCusto, iMoeda,
      iUnidNegoc, Sistema.idEmpresa, iForCli, iCodTipDoc, iPortador, cRecPagNao, fNoDocumento,
      sComplementoDoc, FormatDateTime('dd/mm/yyyy', Date), sDataVenc, sDataVenc{DataProgramada}, sStatus,
      iNumFatura, sOperacao, Sistema.idUsuario, iSubConta, -1, '', '', False,
       -1, -1, -1);

      // gera o identificador incremental da tabela LANCAMENTO
      iNumLancamento := Documento.GerarNumLancto(qryAuxiliar, iDocumento);

      Documento.CriarLanctoDoc(qryLancaDocumento, iDocumento, iNumLancamento, -1{CodAlterador},
      iPlanilha, sDataLanc, fVlrLanc, fVlrOM, -1{Estorno}, sDebCre, sOperacao, sHistCompl{HistoricoCompl},
      Sistema.idUsuario, False{bContabiliza}, -1, '');

      Documento.Rateio.Inserir(iDocumento, sTipoRecDes, cRecPagNao, sCentroRespon,
      Sistema.idEmpresa, fVlrLanc, fVlrOM, Sistema.idUsuario, iUnidNegoc, -1, sCentroCustoAP, iPatro,
      iPrograma, iPlanoPrev);

      // se conseguiu, retorna...
      Result := True;

   except
      if bMostraMsg then Raise;
//      Raise;
      Result := False;
   end;
end;



// =================================================================================================
//    Integração Financeira / Contábil
// =================================================================================================

// Retorna a máscara do Plano de Contas
function TFuncoesImob.GetMascaraPlano(iPlano: integer): string;
var
   qryContab : TwwQuery;
begin
   qryContab := dtmOperComum.qryIntegraContab;

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





// Retorna o "Grupo" do bem por extenso
function TFuncoesImob.GrupoExtenso(const sGrupo: string): string;
begin
   if length(trim(sGrupo)) > 0 then begin

      case sGrupo[1] of
         'A': Result := 'Ar-Condicionado';
         'E': Result := 'Edificação';
         'I': Result := 'Instalações (Gerais)';
         'L': Result := 'Instalações Elétricas';
         'M': Result := 'Máquinas e Equip.';
         'T': Result := 'Terreno';
         'U': Result := 'Utilitários';
         'V': Result := 'Veículos';
      else
         Result := '';
      end;

   end else begin
      Result := '';
   end;
end;




function TFuncoesImob.CriaImovel(const iImovelMestre: int64; const sImovel: string): int64;
var
   iImovel : int64;
begin
   iImovel := LeUltRegistro(nil, 'IMOVEL');

   try

      with dtmImobiliario.qryCriaImovel do begin
         LimpaParametros(dtmImobiliario.qryCriaImovel);
         ParamByName('PIDIMOVELMESTRE').AsInteger  := iImovelMestre;
         ParamByName('PIDIMOVEL').AsInteger        := iImovel;
         ParamByName('PIMONOME').AsString          := sImovel;
         ExecSQL;
      end;

      Result := iImovel;
   except
      Result := -1;
   end;
end;






// =================================================================================================
//    Uso interno (por outras funções)
// =================================================================================================

procedure TFuncoesImob.MensagemErroContab(iResultado: integer);
begin
   case iResultado of
      -1: MsgDlg('A Conta Contábil de débito está bloqueada ou inativa', 'Erro', mtError, [mbOk], 0);
      -2: MsgDlg('A Conta Contábil de crédito está bloqueada ou inativa', 'Erro', mtError, [mbOk], 0);
      -3: MsgDlg('', 'Erro', mtError, [mbOk], 0);
      -4: MsgDlg('A Conta Contábil de débito não existe', 'Erro', mtError, [mbOk], 0);
      -5: MsgDlg('A Conta Contábil de crédito não existe', 'Erro', mtError, [mbOk], 0);
      -6: MsgDlg('Não exite cotação cadastrada para a Moeda escolhida', 'Erro', mtError, [mbOk], 0);
      -7: MsgDlg('Não existe a Planilha escolhida', 'Erro', mtError, [mbOk], 0);
      -8: MsgDlg('Os parâmetros contábeis não estão corretamente cadastrados', 'Erro', mtError, [mbOk], 0);
   end;
end;





procedure TFuncoesImob.MensagemErroPeriodo(iErroPeriodo: integer);
begin
   case iErroPeriodo of
      1: MsgDlg('O Período escolhido não Existe', 'Erro', mtError, [mbOk], 0);
      2: MsgDlg('O Período escolhido existe mas não é único', 'Erro', mtError, [mbOk], 0);
      3: MsgDlg('O Período escolhido está bloqueado', 'Erro', mtError, [mbOk], 0);
      4: MsgDlg('O Período escolhido está bloqueado', 'Erro', mtError, [mbOk], 0);
   end;
end;




end.
