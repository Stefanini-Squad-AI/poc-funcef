unit UOperacaoInvest;

//	-------------------------------------------------------------------------------------------------
//                                    
//       Death is lighter than a feather;
//       Duty, heavier than a mountain...
//
//                               Rand Al'Thor
//
//	-------------------------------------------------------------------------------------------------
//	-------------------------------------------------------------------------------------------------
//       ATENÇÃO: UOperacaoInvest NECESSITA do DataModule dOperacaoInvest/dtmOperacaoInvest
//	-------------------------------------------------------------------------------------------------
//	-------------------------------------------------------------------------------------------------
//
//	UOperacaoInvest
//
//	Autor :  André Pontes
//             LancaControleOper
//             LancaControleDesp
//
//	Autor :  Alexandre Augusto
//             BuscaCotacoesAcao
//             BuscaSaldosLote
//             BuscaTodosSaldosNova
//
//	Autora:  Ana Maria
//             CalculaSaldoDiaTIR
//             CalculaTIRMob
//             CalculaSaldos
//             CalculaInvRenFixAtu
//             CalculaTaxaOver
//             AtualizaSaldosCustodia
//             BuscaInicioAplicacao
//             BuscaSaldosAplicacao
//             BuscaSaldosTipoAplic
//             BuscaSaldoAplicEmissor
//
//      Autor :  Carlos A. C. Lima
//             RetParamInvest
//             RetParamOperDireito
//
//	Modificações	:   18/05/1999  -  Correções de algumas cláusulas nas queries UPDATE (André)
//                   19/05/1999  -  Passagem de parâmetros nulos quando necessário (André)
//                   22/05/1999  -  Passagem do parâmetro IDHISTCARTINV, seqüencial (Augusto)
//                               -  + uma série de alterações e comentários (Augusto)
//                   26/05/1999  -  Fechamento das queries pelo nome real (André)
//                               -  'Case' substituindo 'ifs' na Definição dos Saldos Finais (André)
//                   11/08/1999  -  Alteração nos parâmetros passados para a LancaContab (máscara do
//                                  plano de contas, basicamente)
//                               -  Criação de uma nova query para trazer a máscara do plano de contas
//                                  (para suprir o novo parâmetro da LancaContab)
//                   24/08/1999  -  Alimenta Carteira passa a aceitar valores negativos (Flavio Mendonça)
//                   31/08/1999  -  Alimenta Carteira deixa de atualizar saldos: isso passa a ser feito
//                                  pela nova função Atualiza Saldos (Ana)
//                   28/09/1999  -  Alimenta Carteira: Trata mais uma natureza de operação ('R' de
//                                  de Rendimentos), ganha mais um Parâmetro (IDLOTE = Lote do Investi-
//                                  mento, que é alimentado para o mercado de opções)
//                                  Atualiza Saldo: Inclui tratamentos acima detalhados (Rendimentos e
//                                  Lote do Investimento); Alteração das queries qrySaldoInvestimento,
//                                  qryAtualizaSaldoI e qryHistoricoCarteira para tratar IDLOte e cal-
//                                  lar Saldos de Preço Atuarial, Custo de Aquisição, Custo de Carrega-
//                                  e Rendimento.
//                   13/11/2000  -  Adicionados novas subtipos ao registro TRecParamInvest, utilizado
//                                  pela função TOperacaoInvest.RetParamInvest
//                                  ( IDTIPOOPERLIQPEND e IDBMF )
//                                  .
//
// -------------------------------------------------------------------------------------------------

interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, USistema, Wwquery, OleCtrls, vcf1, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, TB97Tlbr, TB97, ExtCtrls;

Type
//------------------------------------------------------------------------------
// Registro com as Cotacoes
   TRecCotacoes = Record
                    VlrAbertura  :Double;
                    VlrFechamento:Double;
                    VlrMaxima    :Double;
                    VlrMinima    :Double;
                    VlrMedia     :Double;
                    VolNegociado :Double;
                    QtdLote      :Integer;
                    DataCotacao  :TDateTime;
                  End;
// Registro com os Saldos
   TRecSaldos = Record
                  SldQtdInvCart,
                  SldVlrInvCart,
                  SldAtuarial,
                  SldAquisicao,
                  SldRendimento,
                  SldCarregamento,
                  SldVariacao,
                  SldJuros,
                  SldPremio,
                  SldMercado:Double;
                  DataSaldo:TDateTime;
                End;

// Registro com os parâmetros de investimento
   TRecParamInvest = Record
                       MASCSETOREMISSOR  : String;
                       MOECODIGO         : LongInt;
                       MASCCLASSIFINV    : String;
                       VLRDIVERG         : Extended;
                       VLRCOTAINICART    : Extended;
                       DATAULTFECH       : TDateTime;
                       FLGORDMOVINV      : String; {Char}
                       PERCPUORDMOVINV   : Extended;
                       PERCIMPRENDA      : Extended;
                       MOEDAATU          : LongInt;
                       PERCPARTICEMPR    : Extended;
                       TRGDTINCLUSAO     : TDateTime;
                       TRGUSERINCLUSAO   : String;
                       PERCPARTICRECUR   : Extended;
                       IDPARAMPATRLIQ    : LongInt;
                       TIPOMENU          : String; {Char}
                       DATAULTFECHRF     : TDateTime;
                       IDTIPODESPIRAPU   : LongInt;
                       IDTIPODESPINVEST  : LongInt;
                       MOEDAGER          : LongInt;
                       FLGPROVISIONAIRRF : String; {Char}
                       FLGPROVISIONAIRRV : String; {Char}
                       PUCDB             : Extended;
                       DATAMOVCDBLIB     : TDateTime;
                       IDTIPODESPIRPROV  : LongInt;
                       MOEDAATULIT       : LongInt;
                       IDPROGRAMA        : LongInt;
                       IDTIPOCLIENTECOR  : LongInt;
                       IDTIPOOPERDIRINC  : LongInt;
                       IDTIPOOPERDIRCIS  : LongInt;
                       IDTIPOOPERDIRDES  : LongInt;
                       IDTIPOOPERDIRGRU  : LongInt;
                       IDTIPOOPERDIRPER  : LongInt;
                       IDTIPOOPERDIRBON  : LongInt;
                       IDTIPOOPERDIRDIV  : LongInt;
                       IDTIPOOPERDIRSUB  : LongInt;
                       IDTIPOINVEST      : LongInt;
                       IDTIPOOPERDIRJUR  : LongInt;
                       IDTIPOCLIENTEEMI  : LongInt;
                       IDTIPOCLIENTECUS  : LongInt;
                       IDTIPOCONTRRF     : LongInt;
                       IDBVSP            : LongInt;
                       IDTIPOINVESTIDOR  : LongInt;
                       IDMERCADO         : LongInt;
                       IDTIPOOPERLIQPEND : LongInt;
                       IDBMF             : LongInt;
                     End;

// Registro com os parâmetros de Operações de Direito
  TRegTipoOperacao = Record
    FLGGERACONTAB                            : Boolean;
    FLGGERACAPCAR                            : Boolean;
    FLGGERACAF                               : Boolean;
    FLGTRANSF                                : Boolean; {S/N}
    FLGCORRET                                : Boolean; {S/N}
    FLGORDMOVINV                             : Boolean; {S/N}
    FLGOPDIREITO                             : Boolean; {S/N}
    FLGAGE                                   : Boolean; {S/N}
    FLGDATAEX                                : Boolean; {S/N}
    FLGDATACOM                               : Boolean; {S/N}
    FLGINVORIGEM                             : Boolean; {S/N}
    FLGPERC                                  : Boolean; {S/N}
    FLGPARIDADE                              : Boolean; {S/N}
    FLGPRZBOLSA                              : Boolean; {S/N}
    FLGPRZEMP                                : Boolean; {S/N}
    FLGATADEC                                : Boolean; {S/N}
    FLGFORMAPAGREC                           : Boolean; {S/N}
    FLGDIVACAO                               : Boolean; {S/N}
    FLGINIPAG                                : Boolean; {S/N}
    FLGJUROS                                 : Boolean; {S/N}
    TIPSALDOCARTORIG                         : Boolean; {S/N}
    TIPSALDOCARTDEST                         : Boolean; {S/N}
    FLGTRATAIR                               : String; {S/N}
    PERCENTUAL                               : Extended;
    DIVPORACAO                               : Extended;
    PARIDADE                                 : Extended;
    IDMERCADO                                : Longint;
  End;

//------------------------------------------------------------------------------
// Definição da Classe TOperacaoInvest
   TOperacaoInvest = Class(TObject)
   private
      Function SimNao(S : String) : Boolean;
   public
      Function ExecutaQuery         (Qry:TwwQuery; Const Str:String) :Boolean;
      Function FazQuery             (Var Qry:TwwQuery; Str:String)   :Boolean;

      Function BuscaTodosSaldosNova(IdCarteira, IdInvestimento, IdHistCartInv: Integer;
                                    IdLote: String; DataReferencia:TDateTime;
                                    Var fSdoQtdeInvCart, fSdoVlrInvCart, fSdoAtu, fSdoCar,
                                        fSdoAqui, fSdoRend, fSdoMercado: Double): boolean;

      Function BuscaSaldosCustodia(IdCarteira, IdInvestimento, IdCustodia,
                                    IdCustodiante, IdMotivoBloqueio: Integer;
                                    IdLote: String; DataReferencia:TDateTime;
                                    Var fSdoBloqueado, fSdoLiberado: Double): boolean;

      // Função que Testa se existe Saldo no HistCustodia para uma Determinada Quantidade
      Function TestaSaldosCustodia(IdCarteira, IdInvestimento, IdCustodia,
                                    IdCustodiante, IdMotivoBloqueio: Integer;
                                    IdLote, sTipoCustodia: String; DataReferencia:TDateTime;
                                    fQuant: Double): boolean;

      // Função que Insere Registro no HistCustodia
      Function InsereCustodia(IdCarteira, IdInvestimento,
                                    IdCustodiante, IdMotivoBloqueio, IdOperacao: Integer;
                                    IdLote, sTipoCustodia: String; DataReferencia:TDateTime;
                                    fQuant: Double): boolean;

      Function BuscaSaldoInvestLote (IdCarteira, IdInvestimento, IdHistCartInv: Integer;
                                     IdLote: String; DataReferencia: TDateTime):Double;

      // Função que efetua o par de lançamentos Contábeis de controle (contabilização da Carteira)
      // associados a uma Operação de Investimento (de acordo com a tabela PadrLancContInv)
      function LancaControleOper(iEmpresaProp, iModuloOrigem, iTipoInvest, iTipoOperacao,
      iOperacao, iForCli, iCarteira: longint; sTipoTitulo: string; fVlrOper: currency;
      dDataOper: TDateTime; bMostraMsg: boolean; var iPlano, iPlanilhaCtrlOper: longint;
      var sHistoricoCtrlOper, sMensErro: string): shortint;

      // Função que efetua o par de lançamentos Contábeis de controle (contabilização da Carteira)
      // associados a uma Despesa de Investimento (de acordo com a tabela PadrLancContInv)
      function LancaControleDesp(iEmpresaProp, iModuloOrigem, iTipoInvest, iTipoOperacao,
      iTipoDespesa, iOperacao, iDespesa, iForCli, iCarteira: longint; sTipoTitulo: string;
      fVlrOMDesp, fVlrDesp: currency; dDataDesp, dDataVencDesp: TDateTime; bMostraMsg: boolean;
      var iPlano, iPlanilhaCtrlDesp: longint; var sHistoricoCtrlDesp, sMensErro: string): shortint;

      // Função que Calula Saldo do Dia para TIR
      function CalculaSaldoDiaTIR(iInvestimento, iCarteira: longint; sLote: string;
      dDataRef, dDataOperFim, dDataSaldoFinal: TDateTime; var iFlag: smallint): double;

      // Função que Calcula TIR de Investimentos Mobiliários - Renda Fixa e Variável
      function CalculaTIRMob(iInvestimento, iCarteira: longint; sLote: string;
      dDataOperInicio, dDataOperFim, dDataSaldoFinal : TDateTime; bMostraMsg, bDiasUteis: boolean; var fTIR: double; var iCalcula: smallint): boolean;

// Busca as Cotacoes de uma acao em uma data (Retorna um registro com as cortacoes)
      Function BuscaCotacoesAcao(IdAcao, IdBolsaValores :Integer; DataRef:TDateTime; Aproximado:Boolean):TRecCotacoes;

// Busca os Saldos de um Investimento/Lote
      Function BuscaSaldosLote(IdInvestimento: Integer; IdLote :String;
                               DataReferencia:TDateTime):TRecSaldos;

      // Função que Calcula Valor Atualizado de Título de Renda Fixa numa determinada Data.
      // Tipo = 1 (Atualiza para Data Informada), Tipo = 2 (Atualiza para Data de Vencimento)
      // Se Tipo = 1 e não informou Data, assume data corrente.
      function CalculaInvRenFixAtu(iCarteira, iInvestimento, iTipo: longint; sLote: string;
                                   dDataAtu: TDateTime;Var PuVariacao, PuJuros :Double): Double;

      // Função que Calcula Taxa Over para um Investimento num Período.
      function CalculaTaxaOver(iInvestimento: longint; dDataInicial, dDataFinal: TDateTime): double;

      // Função que Registra Custodia no HistCustodia, a partir do FlgCustodia do HistCartInv.
      function CadastraCustodia (iOperacao: longint): boolean;

      // Função que Atualiza Saldos de Carteira/Investimento/Lote/Custodiante no HistCustodia
      function AtualizaSaldosCustodia: boolean;

      // Função que Busca Data e Valor Aplicado na Primeira Operacao de um Contrato
      function BuscaInicioAplicacao(iInvestimento, iCarteira: longint; sLote: string;
                                    var dDataInicio : TDateTime; var fValInicio: double): boolean;

      // Função que Busca Saldos de Valor Aplicado, Rendimento e Resgate de um Contrato num
      //     determinado Periodo. Se nao informar data inicial, considera data da primeira
      //     operacao registrada no Histcartinv. Se nao informar data final, considera data corrente.
      function BuscaSaldosAplicacao(iInvestimento, iCarteira: longint; sLote: string;
                                    dDataInicio, dDataFim : TDateTime;
                                    var fValAplicado, fRendimento, fResgate: double): boolean;

      // Função que Busca Saldos de Valor Aplicado, Rendimento e Resgate de um Tipo de Aplicação num
      //     determinado Periodo. Se nao informar data inicial e final, considera data corrente.
      function BuscaSaldosTipoAplic(iCarteira: longint; sTipoAplicacao: string;
                                    dDataInicio, dDataFim : TDateTime;
                                    var fValAplicado, fRendimento, fResgate: double): boolean;

      // Função que Busca Saldos dos Investimentos de um Emissor numa data de referencia,
      //     para uma Classe de Investimentos de RendaFixa, a vencer no período informado.
      function BuscaSaldoAplicEmissor(iEmissor, iClasse: longint;
                                    dDataRef, dIniVenc, dFimVenc : TDateTime;
                                    var fSaldo: double): boolean;

      Function CalculaTaxaOverTaxaJuros(wValor    :Double;
                                        iTipoJuros:Integer;
                                        dDataInicial,
                                        dDataFinal: TDateTime): Double;

      Function RetParamInvest(Var RegParInv : TRecParamInvest;
                                  DatabaseTrabalho : String) : Boolean;

      Function RetParamOperDireito(OperacaoDireito : Integer;
                                   Var RegTO : TRegTipoOperacao;
                                   NomeDatabase : String) : Boolean;

      // Calcula Valor de Resgate
      Function CalculaVlrResgate(IdInvestimento, Tipo, IndexRenFix, TamPerJuros: Integer;
                                 Lote, EfetNomi, FlgPU, FlgInterpola, FlgProRata: String;
                                 dDataAtu, DataBaseIndex, DataIniJur, DataVencTitulo:TDateTime;
                                 VlrCompraTit, JurosDia, PercIndex: Double): Double;

   end;


var
  OperacaoInvest : TOperacaoInvest;
  // Variaveis de Transferencia de Informacoes para UOperacaoInvest ...
  VetSaldoDiaData : Array[1..100] of TDate;
  VetSaldoDiaVlr  : Array[1..100] of Double;
  I : Byte;


implementation
uses
  ULancContab, dOperacaoInvest, UDocumento, uIntegraBack, UMensErro, ULancFinanc, UFuncaoGeral,
  UAutorizacao, DBaseDados, UDatabase, UDiasUteis, Math, UOperComum, DOperComum;

//--------------------------------------------------------------------------------------------------
//    LancaControleOper:   Função que efetua o par de lançamentos Contábeis de controle (contabilização
//                         da Carteira) associados a uma Operação de Investimento (de acordo com a
//                         tabela PadrLancContInv)
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       iEmpresaProp      :  id da Empresa Proprietária                      (Sistema.idEmpresa)
//       iModuloOrigem     :  id do Módulo que vai gerar o lançamento         (Sistema.idModulo)
//       iTipoInvest       :  id do Tipo de Investimento, tabela TipoInvest   (idTipoInvest)
//       iTipoOperacao     :  id do Tipo de Operacao, tabela TipoOperacao     (idTipoOperacao)
//       iTipoDespesa      :  id do Tipo de Despesa, tabela TipoDespInvest    (idTipoDespInvest)
//       iOperacao         :  id da Operacao, tabela OperacaoInvest           (idOperacaoInvest)
//       iForCli           :  id do Fornecedor ou Cliente                     (idForCli)
//       iCarteira         :  id da Carteira
//       sTipoTitulo       :  código do Tipo de Título, tabela CodTipoTitulo  (CodTipTitulo)
//       fVlrOper          :  valor da operação na moeda corrente
//       dDataOper         :  data da operação
//       bMostraMsg        :  True  - mostra mensagens
//                            False - não mostra mensagens
//
//    A função retorna também
//       iPlano            :  plano de contas usado para os lançamentos contábeis
//       iPlanilhaRetorno  :  planilha onde foram efetuados os lançamentos contábeis
//       sHistoricoCtrlOper:  histórico do Controle da Operação, segundo PadrLancContInv
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
function TOperacaoInvest.LancaControleOper(iEmpresaProp, iModuloOrigem, iTipoInvest, iTipoOperacao,
iOperacao, iForCli, iCarteira: longint; sTipoTitulo: string; fVlrOper: currency;
dDataOper: TDateTime; bMostraMsg: boolean; var iPlano, iPlanilhaCtrlOper: longint;
var sHistoricoCtrlOper, sMensErro: string): shortint;
var
   iSubContaCred, iSubContaDeb, iUnidNegoc : longint;
   sContaCred, sContaDeb, sCentroCustoCred, sCentroCustoDeb, sTipoRecDes, sTipoPer, sRecPag: string;
   bTransacao, bContabiliza: boolean;
   qryPadrao: TwwQuery;
begin
(*
   Result := 0;
   Screen.Cursor  := crHourGlass;
   bTransacao     := False; // a priori, não é necessário que se inicie uma transação

   // inicialização da query para evitar ACCESS VIOLATION caso não haja contabilização
   qryPadrao := dtmOperacaoInvest.qryPadraoOperFCTTCI;

   try

      try

// -------------------------------------------------------------------------------------------------
//    Verificação dos parâmetros do Tipo de Operação
// -------------------------------------------------------------------------------------------------

         with dtmOperacaoInvest.qryTipoOperacao do begin
            Close;
            if not(Prepared) then Prepare;
            ParamByName('TIPOINVEST').asInteger    := iTipoInvest;
            ParamByName('TIPOOERACAO').asInteger   := iTipoOperacao;
            Open;

            bContabiliza   := FieldByName('FLGGERACONTAB').asInteger = 1;
            sRecPag        := FieldByName('RECPAG').asString;
         end;

         // só vai adiante se for necessário fazer lançamento contábil...
         if bContabiliza then begin

            if fVlrOper <> 0 then begin

               // verifica se já existe transação em andamento; se não houver, inicia uma
               if not(dtmBaseDados.dbBaseDados.InTransaction) then begin
                  bTransacao := True;
                  StartTransacao;
               end else begin
                  bTransacao := False;
               end;

// -------------------------------------------------------------------------------------------------
//    Verifica o Padrão de Lançamento mais adequado
// -------------------------------------------------------------------------------------------------

               // Caso mais detalhado: ForCli, TipoTitulo, Carteira preenchidos
               if ( (iForCli > 0) and (sTipoTitulo <> '') and (iCarteira > 0) ) then begin

                  with qryPadrao do begin
                     Close;
                     if not(Prepared) then Prepare;
                     ParamByName('EMPRESAPROP').asInteger   := iEmpresaProp;
                     ParamByName('TIPOMOV').asString        := 'OPE';
                     ParamByName('TIPOLANC').asString       := 'C';
                     ParamByName('TIPOINVEST').asInteger    := iTipoInvest;
                     ParamByName('TIPOOERACAO').asInteger   := iTipoOperacao;
                     ParamByName('TIPOTITULO').asString     := sTipoTitulo;
                     ParamByName('FORCLI').asInteger        := iForCli;
                     ParamByName('CARTEIRA').asInteger      := iCarteira;
                     Open;
                  end;

                  if qryPadrao.RecordCount > 1 then Result := -4; // Erro: ambigüidade no Padrão de Lançamento
               end;

// -------------------------------------------------------------------------------------------------

               // se não houver sido encontrado um padrão,
               // tenta-se ForCli + TipoTitulo
               if ( (Result = 0) and (iForCli > 0) and (sTipoTitulo <> '') ) then begin
                  if ( not(qryPadrao.Active) or (qryPadrao.isEmpty) ) then begin

                     qryPadrao.Close;
                     qryPadrao := dtmOperacaoInvest.qryPadraoOperFCTT;
                     with qryPadrao do begin
                        Close;
                        if not(Prepared) then Prepare;
                        ParamByName('EMPRESAPROP').asInteger   := iEmpresaProp;
                        ParamByName('TIPOMOV').asString        := 'OPE';
                        ParamByName('TIPOLANC').asString       := 'C';
                        ParamByName('TIPOINVEST').asInteger    := iTipoInvest;
                        ParamByName('TIPOOERACAO').asInteger   := iTipoOperacao;
                        ParamByName('TIPOTITULO').asString     := sTipoTitulo;
                        ParamByName('FORCLI').asInteger        := iForCli;
                        Open;
                     end;

                     if qryPadrao.RecordCount > 1 then Result := -4; // Erro: ambigüidade no Padrão de Lançamento

                  end;
               end;

// -------------------------------------------------------------------------------------------------

               // se não houver sido encontrado um padrão,
               // tenta-se ForCli + Carteira
               if ( (Result = 0) and (iForCli > 0) and (iCarteira > 0) ) then begin
                  if ( not(qryPadrao.Active) or (qryPadrao.isEmpty) ) then begin

                     qryPadrao.Close;
                     qryPadrao := dtmOperacaoInvest.qryPadraoOperFCCI;
                     with qryPadrao do begin
                        Close;
                        if not(Prepared) then Prepare;
                        ParamByName('EMPRESAPROP').asInteger   := iEmpresaProp;
                        ParamByName('TIPOMOV').asString        := 'OPE';
                        ParamByName('TIPOLANC').asString       := 'C';
                        ParamByName('TIPOINVEST').asInteger    := iTipoInvest;
                        ParamByName('TIPOOERACAO').asInteger   := iTipoOperacao;
                        ParamByName('FORCLI').asInteger        := iForCli;
                        ParamByName('CARTEIRA').asInteger      := iCarteira;
                        Open;
                     end;

                     if qryPadrao.RecordCount > 1 then Result := -4; // Erro: ambigüidade no Padrão de Lançamento

                  end;
               end;

// -------------------------------------------------------------------------------------------------

               // se não houver sido encontrado um padrão,
               // tenta-se TipoTitulo + Carteira
               if ( (Result = 0) and (sTipoTitulo <> '') and (iCarteira > 0) ) then begin
                  if ( not(qryPadrao.Active) or (qryPadrao.isEmpty) ) then begin

                     qryPadrao.Close;
                     qryPadrao := dtmOperacaoInvest.qryPadraoOperTTCI;
                     with qryPadrao do begin
                        Close;
                        if not(Prepared) then Prepare;
                        ParamByName('EMPRESAPROP').asInteger   := iEmpresaProp;
                        ParamByName('TIPOMOV').asString        := 'OPE';
                        ParamByName('TIPOLANC').asString       := 'C';
                        ParamByName('TIPOINVEST').asInteger    := iTipoInvest;
                        ParamByName('TIPOOERACAO').asInteger   := iTipoOperacao;
                        ParamByName('TIPOTITULO').asString     := sTipoTitulo;
                        ParamByName('CARTEIRA').asInteger      := iCarteira;
                        Open;
                     end;

                     if qryPadrao.RecordCount > 1 then Result := -4; // Erro: ambigüidade no Padrão de Lançamento

                  end;
               end;


// -------------------------------------------------------------------------------------------------

               // se não houver sido encontrado um padrão,
               // tenta-se só ForCli
               if ( (Result = 0) and (iForCli > 0) ) then begin
                  if ( not(qryPadrao.Active) or (qryPadrao.isEmpty) ) then begin

                     qryPadrao.Close;
                     qryPadrao := dtmOperacaoInvest.qryPadraoOperFC;
                     with qryPadrao do begin
                        Close;
                        if not(Prepared) then Prepare;
                        ParamByName('EMPRESAPROP').asInteger   := iEmpresaProp;
                        ParamByName('TIPOMOV').asString        := 'OPE';
                        ParamByName('TIPOLANC').asString       := 'C';
                        ParamByName('TIPOINVEST').asInteger    := iTipoInvest;
                        ParamByName('TIPOOERACAO').asInteger   := iTipoOperacao;
                        ParamByName('FORCLI').asInteger        := iForCli;
                        Open;
                     end;

                     if qryPadrao.RecordCount > 1 then Result := -4; // Erro: ambigüidade no Padrão de Lançamento

                  end;
               end;

// -------------------------------------------------------------------------------------------------

               // se não houver sido encontrado um padrão,
               // tenta-se TipoTitulo
               if ( (Result = 0) and (sTipoTitulo <> '') ) then begin
                  if ( not(qryPadrao.Active) or (qryPadrao.isEmpty) ) then begin

                     qryPadrao.Close;
                     qryPadrao := dtmOperacaoInvest.qryPadraoOperTT;
                     with qryPadrao do begin
                        Close;
                        if not(Prepared) then Prepare;
                        ParamByName('EMPRESAPROP').asInteger   := iEmpresaProp;
                        ParamByName('TIPOMOV').asString        := 'OPE';
                        ParamByName('TIPOLANC').asString       := 'C';
                        ParamByName('TIPOINVEST').asInteger    := iTipoInvest;
                        ParamByName('TIPOOERACAO').asInteger   := iTipoOperacao;
                        ParamByName('TIPOTITULO').asString     := sTipoTitulo;
                        Open;
                     end;

                     if qryPadrao.RecordCount > 1 then Result := -4; // Erro: ambigüidade no Padrão de Lançamento

                  end;
               end;


// -------------------------------------------------------------------------------------------------

               // se não houver sido encontrado um padrão,
               // tenta-se Carteira
               if ( (Result = 0) and (iCarteira > 0) ) then begin
                  if ( not(qryPadrao.Active) or (qryPadrao.isEmpty) ) then begin

                     qryPadrao.Close;
                     qryPadrao := dtmOperacaoInvest.qryPadraoOperCI;
                     with qryPadrao do begin
                        Close;
                        if not(Prepared) then Prepare;
                        ParamByName('EMPRESAPROP').asInteger   := iEmpresaProp;
                        ParamByName('TIPOMOV').asString        := 'OPE';
                        ParamByName('TIPOLANC').asString       := 'C';
                        ParamByName('TIPOINVEST').asInteger    := iTipoInvest;
                        ParamByName('TIPOOERACAO').asInteger   := iTipoOperacao;
                        ParamByName('CARTEIRA').asInteger      := iCarteira;
                        Open;
                     end;

                     if qryPadrao.RecordCount > 1 then Result := -4; // Erro: ambigüidade no Padrão de Lançamento

                  end;
               end;

// -------------------------------------------------------------------------------------------------

               // se não houver sido encontrado um padrão,
               // tenta-se o último recurso
               if ( (Result = 0) ) then begin
                  if ( not(qryPadrao.Active) or (qryPadrao.isEmpty) ) then begin

                     qryPadrao.Close;
                     qryPadrao := dtmOperacaoInvest.qryPadraoOper;
                     with qryPadrao do begin
                        Close;
                        if not(Prepared) then Prepare;
                        ParamByName('EMPRESAPROP').asInteger   := iEmpresaProp;
                        ParamByName('TIPOMOV').asString        := 'OPE';
                        ParamByName('TIPOLANC').asString       := 'C';
                        ParamByName('TIPOINVEST').asInteger    := iTipoInvest;
                        ParamByName('TIPOOERACAO').asInteger   := iTipoOperacao;
                        Open;
                     end;

                     if qryPadrao.RecordCount > 1 then Result := -4; // Erro: ambigüidade no Padrão de Lançamento

                  end;
               end;

// -------------------------------------------------------------------------------------------------

               if Result = 0 then begin
                  // verifica se agora foi encontrado algum Padrão de Lançamento
                  if ( (qryPadrao.Active) and not(qryPadrao.isEmpty) ) then with qryPadrao do begin

                     iPlano            := FieldByName('PLANO').asInteger;

                     // se o valor da Operação for negativo, inverte as contas ---------------------
                     if fVlrOper > 0 then begin
                        sContaDeb      := FieldByName('CONTADOPERFIN').asString;
                        sContaCred     := FieldByName('CONTACOPERFIN').asString;
                     end else begin
                        sContaDeb      := FieldByName('CONTACOPERFIN').asString;
                        sContaCred     := FieldByName('CONTADOPERFIN').asString;
                     end;

                     // Centro de Custo ------------------------------------------------------------
                     if FieldByName('CENCUSTDINVEST').isNULL then begin
                        sCentroCustoDeb   := '';
                     end else begin
                        sCentroCustoDeb   := FieldByName('CENCUSTDINVEST').asString;
                     end;
                     if FieldByName('CENCUSTCINVEST').isNULL then begin
                        sCentroCustoCred  := '';
                     end else begin
                        sCentroCustoCred  := FieldByName('CENCUSTCINVEST').asString;
                     end;

                     // Sub-Conta ------------------------------------------------------------------
                     if FieldByName('CODSUBCONTAD').isNULL then begin
                        iSubContaDeb      := -1;
                     end else begin
                        iSubContaDeb      := FieldByName('CODSUBCONTAD').asInteger;
                     end;
                     if FieldByName('CODSUBCONTAC').isNULL then begin
                        iSubContaCred     := -1;
                     end else begin
                        iSubContaCred     := FieldByName('CODSUBCONTAC').asInteger;
                     end;

                     // Unidade de Negócio / Atividade / Projeto -----------------------------------
                     if FieldByName('UNIDNEGOC').isNULL then begin
                        iUnidNegoc        := -1;
                     end else begin
                        iUnidNegoc        := FieldByName('UNIDNEGOC').asInteger;
                     end;

                     // Tipo de Recebimento/Desembolso ---------------------------------------------
                     if FieldByName('CODTIPRECDES').isNULL then begin
                        sTipoRecDes       := '';
                     end else begin
                        sTipoRecDes       := FieldByName('CODTIPRECDES').asString;
                     end;

                     // Tipo de Operacao -----------------------------------------------------------
                     if FieldByName('TIPCODIGO').isNULL then begin
                        sTipoPer          := '03'; // BACAAAALHO !!!
                     end else begin
                        sTipoPer          := FieldByName('TIPCODIGO').asString;
                     end;

                     sHistoricoCtrlOper   := FieldByName('HISTLANCINVEST').asString;

                     // ----------------------------------------------------------------------------
                     //    Se houver regra, passar aqui o resultado para fVlrOper
                     // ----------------------------------------------------------------------------

                     // Modula o valor da operação
                     fVlrOper := abs(fVlrOper);

                     if iPlanilhaCtrlOper = -1 then iPlanilhaCtrlOper := 0;

                     if not(OperComum.LancamentoContabil(iEmpresaProp, iModuloOrigem, iPlano, iSubContaDeb,
                     iSubContaCred, iUnidNegoc, iForCli, -1, -1, sContaDeb, sContaCred, sCentroCustoDeb,
                     sCentroCustoCred, sHistoricoCtrlOper, sTipoPer, sRecPag, dDataOper, fVlrOper,
                     bMostraMsg, iPlanilhaCtrlOper, sMensErro) )
                     then Result := -6; // não foi possível efetuar o lançamento contábil

// -------------------------------------------------------------------------------------------------
//    Finalmentes...
// -------------------------------------------------------------------------------------------------

                     // se tudo correu bem...
                     if ( (Result = 0) and (bTransacao) and (dtmBaseDados.dbBaseDados.InTransaction) ) then CommitTransacao;

                  end else begin
                     Result := -5; // Erro: nenhum Padrão de Lançamento que atenda os parâmetros passados
                  end;

               end;

            end else begin
               Result := -2; // Operação com valor igual a ZERO
            end;

         end else begin
            Result := -1; // não gera Lançamento Contábil
         end;

      except
         if bTransacao then RollBackTransacao;
         Screen.Cursor := crDefault;
         if bMostraMsg then Raise;
         Result := -3; // Erro de gravação
      end;

   finally
      if ( (Result < 0) and (bTransacao) and (dtmBaseDados.dbBaseDados.InTransaction) ) then RollBackTransacao;
      qryPadrao.Close;
      Screen.Cursor := crDefault;
   end;
*)
end;

//--------------------------------------------------------------------------------------------------
//    LancaControleDesp:   Função que efetua o par de lançamentos Contábeis de controle (contabilização
//                         da Carteira) associados a uma Despesa de Investimento (de acordo com a
//                         tabela PadrLancContInv)
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       iEmpresaProp      :  id da Empresa Proprietária                      (Sistema.idEmpresa)
//       iModuloOrigem     :  id do Módulo que vai gerar o lançamento         (Sistema.idModulo)
//       iTipoInvest       :  id do Tipo de Investimento, tabela TipoInvest   (idTipoInvest)
//       iTipoOperacao     :  id do Tipo de Operacao, tabela TipoOperacao     (idTipoOperacao)
//       iTipoDespesa      :  id do Tipo de Despesa
//       iOperacao         :  id da Operacao, tabela OperacaoInvest           (idOperacaoInvest)
//       iDespesa          :  id da Despesa
//       iCarteira         :  id da Carteira
//       sTipoTitulo       :  código do Tipo de Título, tabela CodTipoTitulo  (CodTipTitulo)
//       fVlrDesp          :  valor da operação na moeda corrente
//       dDataDesp         :  data da operação
//       bMostraMsg        :  True  - mostra mensagens
//                            False - não mostra mensagens
//
//    A função retorna também
//       iPlano            :  plano de contas usado para os lançamentos contábeis
//       iPlanilhaDesp     :  planilha onde foram efetuados os lançamentos contábeis
//       sHistoricoCtrlDesp:  histórico do Contole da Despesa, segundo PadrLancContInv
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
function TOperacaoInvest.LancaControleDesp(iEmpresaProp, iModuloOrigem, iTipoInvest, iTipoOperacao,
iTipoDespesa, iOperacao, iDespesa, iForCli, iCarteira: longint; sTipoTitulo: string;
fVlrOMDesp, fVlrDesp: currency; dDataDesp, dDataVencDesp: TDateTime; bMostraMsg: boolean;
var iPlano, iPlanilhaCtrlDesp: longint; var sHistoricoCtrlDesp, sMensErro: string): shortint;
var
   iSubContaCred, iSubContaDeb, iUnidNegoc: longint;
   sContaCred, sContaDeb, sCentroCustoCred, sCentroCustoDeb, sTipoRecDes, sTipoPer, sRecPag: string;
   bTransacao, bContabiliza: boolean;
   qryPadrao: TwwQuery;
begin
(*
   Result := 0;
   Screen.Cursor  := crHourGlass;
   bTransacao     := False; // a priori, não é necessário que se inicie uma transação
   qryPadrao      := nil;

   try

      try

// -------------------------------------------------------------------------------------------------
//    Verificação dos parâmetros do Tipo de Operação
// -------------------------------------------------------------------------------------------------

         with dtmOperacaoInvest.qryDespXTipoOper do begin
            Close;
            if not(Prepared) then Prepare;
            ParamByName('TIPOINVEST').asInteger    := iTipoInvest;
            ParamByName('TIPOOERACAO').asInteger   := iTipoOperacao;
            ParamByName('TIPODESPESA').asInteger   := iTipoDespesa;
            Open;

            bContabiliza   := FieldByName('FLGGERACONTAB').asInteger = 1;
         end;

         // só vai adiante se for necessário fazer algum tipo de lançamento (Contábil ou CAP/CAR)...
         if bContabiliza then begin

            if fVlrDesp = 0 then begin

               // verifica se já existe transação em andamento; se não houver, inicia uma
               if not(dtmBaseDados.dbBaseDados.InTransaction) then begin
                  bTransacao := True;
                  StartTransacao;
               end else begin
                  bTransacao := False;
               end;

// -------------------------------------------------------------------------------------------------
//    Verifica o Padrão de Lançamento mais adequado
// -------------------------------------------------------------------------------------------------

               qryPadrao := dtmOperacaoInvest.qryPadraoDespFCTTCI;

               // Caso mais detalhado: ForCli, TipoTitulo, Carteira preenchidos
               if ( (iForCli > 0) and (sTipoTitulo <> '') and (iCarteira > 0) ) then begin

                  with qryPadrao do begin
                     Close;
                     if not(Prepared) then Prepare;
                     ParamByName('EMPRESAPROP').asInteger   := iEmpresaProp;
                     ParamByName('TIPOMOV').asString        := 'DOP';
                     ParamByName('TIPOLANC').asString       := 'C';
                     ParamByName('TIPOINVEST').asInteger    := iTipoInvest;
                     ParamByName('TIPOOERACAO').asInteger   := iTipoOperacao;
                     ParamByName('TIPODESPESA').asInteger   := iTipoDespesa;
                     ParamByName('TIPOTITULO').asString     := sTipoTitulo;
                     ParamByName('FORCLI').asInteger        := iForCli;
                     ParamByName('CARTEIRA').asInteger      := iCarteira;
                     Open;
                  end;

                  if qryPadrao.RecordCount > 1 then Result := -4; // Erro: ambigüidade no Padrão de Lançamento
               end;

// -------------------------------------------------------------------------------------------------

               // se não houver sido encontrado um padrão,
               // tenta-se ForCli + TipoTitulo
               if ( (Result = 0) and (iForCli > 0) and (sTipoTitulo <> '') ) then begin
                  if ( not(qryPadrao.Active) or (qryPadrao.isEmpty) ) then begin

                     qryPadrao.Close;
                     qryPadrao := dtmOperacaoInvest.qryPadraoDespFCTT;
                     with qryPadrao do begin
                        Close;
                        if not(Prepared) then Prepare;
                        ParamByName('EMPRESAPROP').asInteger   := iEmpresaProp;
                        ParamByName('TIPOMOV').asString        := 'DOP';
                        ParamByName('TIPOLANC').asString       := 'C';
                        ParamByName('TIPOINVEST').asInteger    := iTipoInvest;
                        ParamByName('TIPOOERACAO').asInteger   := iTipoOperacao;
                        ParamByName('TIPODESPESA').asInteger   := iTipoDespesa;
                        ParamByName('TIPOTITULO').asString     := sTipoTitulo;
                        ParamByName('FORCLI').asInteger        := iForCli;
                        Open;
                     end;

                     if qryPadrao.RecordCount > 1 then Result := -4; // Erro: ambigüidade no Padrão de Lançamento

                  end;
               end;

// -------------------------------------------------------------------------------------------------

               // se não houver sido encontrado um padrão,
               // tenta-se ForCli + Carteira
               if ( (Result = 0) and (iForCli > 0) and (iCarteira > 0) ) then begin
                  if ( not(qryPadrao.Active) or (qryPadrao.isEmpty) ) then begin

                     qryPadrao.Close;
                     qryPadrao := dtmOperacaoInvest.qryPadraoDespFCCI;
                     with qryPadrao do begin
                        Close;
                        if not(Prepared) then Prepare;
                        ParamByName('EMPRESAPROP').asInteger   := iEmpresaProp;
                        ParamByName('TIPOMOV').asString        := 'DOP';
                        ParamByName('TIPOLANC').asString       := 'C';
                        ParamByName('TIPOINVEST').asInteger    := iTipoInvest;
                        ParamByName('TIPOOERACAO').asInteger   := iTipoOperacao;
                        ParamByName('TIPODESPESA').asInteger   := iTipoDespesa;
                        ParamByName('FORCLI').asInteger        := iForCli;
                        ParamByName('CARTEIRA').asInteger      := iCarteira;
                        Open;
                     end;

                     if qryPadrao.RecordCount > 1 then Result := -4; // Erro: ambigüidade no Padrão de Lançamento

                  end;
               end;

// -------------------------------------------------------------------------------------------------

               // se não houver sido encontrado um padrão,
               // tenta-se TipoTitulo + Carteira
               if ( (Result = 0) and (sTipoTitulo <> '') and (iCarteira > 0) ) then begin
                  if ( not(qryPadrao.Active) or (qryPadrao.isEmpty) ) then begin

                     qryPadrao.Close;
                     qryPadrao := dtmOperacaoInvest.qryPadraoDespTTCI;
                     with qryPadrao do begin
                        Close;
                        if not(Prepared) then Prepare;
                        ParamByName('EMPRESAPROP').asInteger   := iEmpresaProp;
                        ParamByName('TIPOMOV').asString        := 'DOP';
                        ParamByName('TIPOLANC').asString       := 'C';
                        ParamByName('TIPOINVEST').asInteger    := iTipoInvest;
                        ParamByName('TIPOOERACAO').asInteger   := iTipoOperacao;
                        ParamByName('TIPODESPESA').asInteger   := iTipoDespesa;
                        ParamByName('TIPOTITULO').asString     := sTipoTitulo;
                        ParamByName('CARTEIRA').asInteger      := iCarteira;
                        Open;
                     end;

                     if qryPadrao.RecordCount > 1 then Result := -4; // Erro: ambigüidade no Padrão de Lançamento

                  end;
               end;


// -------------------------------------------------------------------------------------------------

               // se não houver sido encontrado um padrão,
               // tenta-se só ForCli
               if ( (Result = 0) and (iForCli > 0) ) then begin
                  if ( not(qryPadrao.Active) or (qryPadrao.isEmpty) ) then begin

                     qryPadrao.Close;
                     qryPadrao := dtmOperacaoInvest.qryPadraoDespFC;
                     with qryPadrao do begin
                        Close;
                        if not(Prepared) then Prepare;
                        ParamByName('EMPRESAPROP').asInteger   := iEmpresaProp;
                        ParamByName('TIPOMOV').asString        := 'DOP';
                        ParamByName('TIPOLANC').asString       := 'C';
                        ParamByName('TIPOINVEST').asInteger    := iTipoInvest;
                        ParamByName('TIPOOERACAO').asInteger   := iTipoOperacao;
                        ParamByName('TIPODESPESA').asInteger   := iTipoDespesa;
                        ParamByName('FORCLI').asInteger        := iForCli;
                        Open;
                     end;

                     if qryPadrao.RecordCount > 1 then Result := -4; // Erro: ambigüidade no Padrão de Lançamento

                  end;
               end;

// -------------------------------------------------------------------------------------------------

               // se não houver sido encontrado um padrão,
               // tenta-se TipoTitulo
               if ( (Result = 0) and (sTipoTitulo <> '') ) then begin
                  if ( not(qryPadrao.Active) or (qryPadrao.isEmpty) ) then begin

                     qryPadrao.Close;
                     qryPadrao := dtmOperacaoInvest.qryPadraoDespTT;
                     with qryPadrao do begin
                        Close;
                        if not(Prepared) then Prepare;
                        ParamByName('EMPRESAPROP').asInteger   := iEmpresaProp;
                        ParamByName('TIPOMOV').asString        := 'DOP';
                        ParamByName('TIPOLANC').asString       := 'C';
                        ParamByName('TIPOINVEST').asInteger    := iTipoInvest;
                        ParamByName('TIPOOERACAO').asInteger   := iTipoOperacao;
                        ParamByName('TIPODESPESA').asInteger   := iTipoDespesa;
                        ParamByName('TIPOTITULO').asString     := sTipoTitulo;
                        Open;
                     end;

                     if qryPadrao.RecordCount > 1 then Result := -4; // Erro: ambigüidade no Padrão de Lançamento

                  end;
               end;


// -------------------------------------------------------------------------------------------------

               // se não houver sido encontrado um padrão,
               // tenta-se Carteira
               if ( (Result = 0) and (iCarteira > 0) ) then begin
                  if ( not(qryPadrao.Active) or (qryPadrao.isEmpty) ) then begin

                     qryPadrao.Close;
                     qryPadrao := dtmOperacaoInvest.qryPadraoDespCI;
                     with qryPadrao do begin
                        Close;
                        if not(Prepared) then Prepare;
                        ParamByName('EMPRESAPROP').asInteger   := iEmpresaProp;
                        ParamByName('TIPOMOV').asString        := 'DOP';
                        ParamByName('TIPOLANC').asString       := 'C';
                        ParamByName('TIPOINVEST').asInteger    := iTipoInvest;
                        ParamByName('TIPOOERACAO').asInteger   := iTipoOperacao;
                        ParamByName('TIPODESPESA').asInteger   := iTipoDespesa;
                        ParamByName('CARTEIRA').asInteger      := iCarteira;
                        Open;
                     end;

                     if qryPadrao.RecordCount > 1 then Result := -4; // Erro: ambigüidade no Padrão de Lançamento

                  end;
               end;

// -------------------------------------------------------------------------------------------------

               // se não houver sido encontrado um padrão,
               // tenta-se o último recurso
               if ( (Result = 0) ) then begin
                  if ( not(qryPadrao.Active) or (qryPadrao.isEmpty) ) then begin

                     qryPadrao.Close;
                     qryPadrao := dtmOperacaoInvest.qryPadraoDesp;
                     with qryPadrao do begin
                        Close;
                        if not(Prepared) then Prepare;
                        ParamByName('EMPRESAPROP').asInteger   := iEmpresaProp;
                        ParamByName('TIPOMOV').asString        := 'DOP';
                        ParamByName('TIPOLANC').asString       := 'C';
                        ParamByName('TIPOINVEST').asInteger    := iTipoInvest;
                        ParamByName('TIPOOERACAO').asInteger   := iTipoOperacao;
                        ParamByName('TIPODESPESA').asInteger   := iTipoDespesa;
                        Open;
                     end;

                     if qryPadrao.RecordCount > 1 then Result := -4; // Erro: ambigüidade no Padrão de Lançamento

                  end;
               end;

// -------------------------------------------------------------------------------------------------

               if Result = 0 then begin
                  // verifica se agora foi encontrado algum Padrão de Lançamento
                  if ( (qryPadrao.Active) and not(qryPadrao.isEmpty) ) then with qryPadrao do begin

                     iPlano            := FieldByName('PLANO').asInteger;

                     // se o valor da Operação for negativo, inverte as contas ---------------------
                     if fVlrDesp > 0 then begin
                        sContaDeb      := FieldByName('CONTADOPERFIN').asString;
                        sContaCred     := FieldByName('CONTACOPERFIN').asString;
                     end else begin
                        sContaDeb      := FieldByName('CONTACOPERFIN').asString;
                        sContaCred     := FieldByName('CONTADOPERFIN').asString;
                     end;

                     // Centro de Custo ------------------------------------------------------------
                     if FieldByName('CENCUSTDINVEST').isNULL then begin
                        sCentroCustoDeb   := '';
                     end else begin
                        sCentroCustoDeb   := FieldByName('CENCUSTDINVEST').asString;
                     end;
                     if FieldByName('CENCUSTCINVEST').isNULL then begin
                        sCentroCustoCred  := '';
                     end else begin
                        sCentroCustoCred  := FieldByName('CENCUSTCINVEST').asString;
                     end;

                     // Sub-Conta ------------------------------------------------------------------
                     if FieldByName('CODSUBCONTAD').isNULL then begin
                        iSubContaDeb      := -1;
                     end else begin
                        iSubContaDeb      := FieldByName('CODSUBCONTAD').asInteger;
                     end;
                     if FieldByName('CODSUBCONTAC').isNULL then begin
                        iSubContaCred     := -1;
                     end else begin
                        iSubContaCred     := FieldByName('CODSUBCONTAC').asInteger;
                     end;

                     // Unidade de Negócio / Atividade / Projeto -----------------------------------
                     if FieldByName('UNIDNEGOC').isNULL then begin
                        iUnidNegoc        := -1;
                     end else begin
                        iUnidNegoc        := FieldByName('UNIDNEGOC').asInteger;
                     end;

                     // Tipo de Recebimento/Desembolso ---------------------------------------------
                     if FieldByName('CODTIPRECDES').isNULL then begin
                        sTipoRecDes       := '';
                     end else begin
                        sTipoRecDes       := FieldByName('CODTIPRECDES').asString;
                     end;

                     // Tipo de Operacao -----------------------------------------------------------
                     if FieldByName('TIPCODIGO').isNULL then begin
                        sTipoPer          := '03'; // BACAAAALHO !!!
                     end else begin
                        sTipoPer          := FieldByName('TIPCODIGO').asString;
                     end;

                     sHistoricoCtrlDesp   := FieldByName('HISTLANCINVEST').asString;

                     // ----------------------------------------------------------------------------
                     //    Se houver regra, passar aqui o resultado para fVlrOper
                     // ----------------------------------------------------------------------------

                     // Modula o valor da despesa
                     fVlrDesp := abs(fVlrDesp);

                     if bContabiliza then begin

                        if iPlanilhaCtrlDesp = -1 then iPlanilhaCtrlDesp := 0;

                        if not(OperComum.LancamentoContabil(iEmpresaProp, iModuloOrigem, iPlano, iSubContaDeb,
                        iSubContaCred, iUnidNegoc, iForCli, -1, -1, sContaDeb, sContaCred, sCentroCustoDeb,
                        sCentroCustoCred, sHistoricoCtrlDesp, sTipoPer, sRecPag,  dDataDesp, fVlrDesp,
                        bMostraMsg, iPlanilhaCtrlDesp, sMensErro) )
                        then Result := -6; // não foi possível efetuar o lançamento contábil

                     end;

// -------------------------------------------------------------------------------------------------
//    Finalmentes...
// -------------------------------------------------------------------------------------------------

                     // se tudo correu bem...
                     if ( (Result = 0) and (bTransacao) and (dtmBaseDados.dbBaseDados.InTransaction) ) then CommitTransacao;

                  end else begin
                     Result := -5; // Erro: nenhum Padrão de Lançamento que atenda os parâmetros passados
                  end;

               end;

            end else begin
               Result := -2; // Operação com valor igual a ZERO
            end;

         end else begin
            Result := -1; // não gera Lançamento Contábil nem Lançamento CAP/CAR
         end;

      except
         if bTransacao then RollBackTransacao;
         Screen.Cursor := crDefault;
         if bMostraMsg then Raise;
         Result := -3; // Erro de gravação
      end;

   finally
      if ( (Result < 0) and (bTransacao) and (dtmBaseDados.dbBaseDados.InTransaction) ) then RollBackTransacao;
      qryPadrao.Close;
      Screen.Cursor := crDefault;
   end;
*)
end;

//--------------------------------------------------------------------------------------------------
//    Função que Alimenta Carteira
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros :
//       sNaturezaMovimento :  Tipo de movimentacao a ser efetuada na carteira:
//                               A - Aumenta quantidade de cotas (compra)
//                               D - Diminui quantidade de cotas (venda)
//                               O - Aumenta valor da cota (receita)
//                               U - Diminui valor da cota (despesa)
//                               G - Aumento da Cotacao do Investimento
//                               P - Diminuição da Cotacao do Investimento
//                               N - Não altera
//                               M - Aumenta valor cota, aumenta quant. cotas, não altera quant. investimento
//                               I - Diminui valor cota, diminui quant. cotas, não altera quant. investimento
//                               R - Aumenta valor da cota (rendimento)
//                               E - Aumenta/Diminui (despesa ligada à Operação)
//                               L - Lucro
//
//       sTipoMovimento    :  Gerador da movimentação
//                               OPE - Operação
//                               DOP - Despesa da Operação
//                               MVI - Receita / Despesa de Imóvel
//                               ATU - Atualização
//                               DES - Despesa da Carteira
//                               DEP - Depreciação
//                               RVL - Reavaliação
//                               TRN - Transferencia (Imobiliário)
//                               TRF - Transferencia (Investimento)
//                               LUC - Lucro
//
//       iInvestimento     :  id do Investimento                     (idInvestimento)
//       iTipoInvest       :  id do Tipo de Investimento             (idTipoInvest)
//       iOperacao         :  id da Operação de Investimento         (idOperacaoInvest)
//       iLancImovel       :  id do Lançamento (tabela LancamentosImovel)
//       iTipoOperacao     :  id do Tipo de Operação de Investimento (idTipoOperacao)
//       iCarteira         :  id da Carteira de Investimentos        (idCarteiraInvest)
//       iDespesaOperacao  :  id da Despesa ligada a uma Operação    (idDesOperInvest)
//       iImposto          :  id do Imposto ligado a um Investimento (idImpostoInvest)
//       iDespesaCarteira  :  id da Despesa ligada a uma Carteira    (idDespCartInvest)
//       iPlanilha         :  id da Planilha onde foram registrados os lançamentos referentes à atualização
//       iDocumento        :  id do Documento (CaP/CaR) referente ao(s) lançamentos
//       sFlgCustodia      :  Flag de tratamento de Custódia.
//       iPlano            :
//
//       -------------------------------------------------------------------------------------------
//          passar (-1) caso os parâmetros não sejam necessários
//       -------------------------------------------------------------------------------------------
//          iDespesaCarteira e os outros parâmetros acima são auto-excludentes
//       -------------------------------------------------------------------------------------------
//          as quantidade de cotas e de investimento não podem ficar negativas
//       -------------------------------------------------------------------------------------------
//
//       dDataOper         :  Data e Hora da Operação
//       fValorOperacao    :  Valor da Operação
//       fQtdInvestOperacao:  Quantidade de 'papéis' movimentada
//       fValorPrimeiraCota:  Valor da 1ª cota da Carteira
//       sHistorico        :  Historico do Lançamento
//       sRecPag           :  'P' ou 'R' - indica o sinal do caixa (Contas a Pagar/Receber)
//       bMostraMsg        :  True  - mostra mensagens
//                            False - não mostra mensagens
//--------------------------------------------------------------------------------------------------


//--------------------------------------------------------------------------------------------------
//    Função que Atualiza Saldos de Custodia de Carteira e Investimento.
//--------------------------------------------------------------------------------------------------
function TOperacaoInvest.AtualizaSaldosCustodia: boolean;
var
   qryMarca, qryTudo, qryAntes, qryUpdate: TwwQuery;
    Tipo: string;
   TotLiberado, TotBloqueado, Qtde: Double;
   IdCustodia, IdMotivoBloqueio: integer;
begin
     // Inicializa objetos Query
     qryMarca := TwwQuery.Create(Application);
     qryTudo := TwwQuery.Create(Application);
     qryAntes := TwwQuery.Create(Application);
     qryUpdate := TwwQuery.Create(Application);
     qryMarca.DatabaseName := 'BaseDados';
     qryTudo.DatabaseName := 'BaseDados';
     qryAntes.DatabaseName := 'BaseDados';
     qryUpdate.DatabaseName := 'BaseDados';

     try
      try
        // Pega todas as linhas marcadas do histórico
        FazQuery(qryMarca, 'Select H.IdCustodia, H.IdOperacaoInvest, H.IdCarteiraInvest,'+
                 'H.IdInvestimento, H.IdLote, H.DataMovCustod, H. QtdeMovCustod, '+
                 'H.SaldoLiberado, H.SaldoBloqueado, H.FlgCalcSaldo, H.IdCustodiante, '+
                 'H.IdMotivoBloqueio '+
                 'From CM.HistCustodia H '+
                 'Where FlgCalcSaldo = '+#39+'1'+#39+' '+
                 'Order By H.DataMovCustod, H.IdCustodia');
        while (not qryMarca.EOF) and (not qryMarca.IsEmpty) do
        begin
             // Para cada linha marcada, seleciona todas as linha com mesma
             // carteira, investimento, lote, custodiante e Motivo Bloqueio
             if qryMarca.FieldByName('FlgCalcSaldo').AsString = '1' then
             begin
                  FazQuery(qryTudo,'Select H.IdCustodia, H.IdOperacaoInvest, '+
                           'H.IdCarteiraInvest, H.IdInvestimento, H.IdLote, '+
                           'H.DataMovCustod, H. QtdeMovCustod, H.IdCustodiante,'+
                           'H.SaldoLiberado, H.SaldoBloqueado, H.FlgCalcSaldo, '+
                           'H.TipoCustodia, H.IdMotivoBloqueio From CM.HistCustodia H '+
                           'Where '+
                           '(H.IdCarteiraInvest='+qryMarca.FieldByName('IdCarteiraInvest').
                           AsString+') and (H.IdInvestimento='+
                           qryMarca.FieldByName('IdInvestimento').AsString+

                           ') and ((('+#39+qryMarca.FieldByName('IdLote').AsString+#39+
                           ' IS NOT NULL) AND (H.IDLOTE ='+#39+qryMarca.FieldByName('IdLote').AsString+#39+
                           ')) OR (('+#39+qryMarca.FieldByName('IdLote').AsString+#39+
                           ' IS NULL) AND (H.IDLOTE IS NULL))) AND ((H.DATAMOVCUSTOD > TO_DATE('+#39+
                           qryMarca.FieldByName('DataMovCustod').AsString+#39+
                           ','+#39+'dd/mm/yyyy'+#39+')) OR ((H.DATAMOVCUSTOD = TO_DATE('+#39+
                           qryMarca.FieldByName('DataMovCustod').AsString+#39+
                           ','+#39+'dd/mm/yyyy'+#39+')) AND (H.IDCUSTODIA >= '+
                           qryMarca.FieldByName('IdCustodia').AsString+'))) AND '+

                           '(H.IdCustodiante='+qryMarca.FieldByName('IdCustodiante').
                           AsString+') AND '+
                           '(H.IdMotivoBloqueio='+qryMarca.FieldByName('IdMotivoBloqueio').
                           AsString+
//                           ' and H.DataMovCustod>=TO_DATE('+#39+
//                           qryMarca.FieldByName('DataMovCustod').AsString+#39+
//                           ','+#39+'dd/mm/yyyy'+#39+
                           ') Order By DataMovCustod, IdCustodia');
                  while not qryTudo.EOF do
                  begin
                  // Busca Saldo Custódia

                  FazQuery(qryAntes,
                       'SELECT'+
                       '   H1.IDCUSTODIA, H1.SALDOBLOQUEADO, H1.SALDOLIBERADO '+
                       'FROM '+
                       '    HISTCUSTODIA H1 '+
                       'WHERE '+
                       '   (IDCARTEIRAINVEST ='+qryTudo.FieldByName('IdCarteiraInvest').AsString+') AND '+
                       '   (IDINVESTIMENTO = '+qryTudo.FieldByName('IdInvestimento').AsString+') AND '+
                       '   ((('+#39+qryTudo.FieldByName('IdLote').AsString+#39+' IS NOT NULL) AND (IDLOTE ='+#39+qryTudo.FieldByName('IdLote').AsString+#39+')) OR (('+#39+qryTudo.FieldByName('IdLote').AsString+#39+' IS NULL) AND (IDLOTE IS NULL))) AND '+
                       '   (IDCUSTODIANTE ='+qryTudo.FieldByName('IdCustodiante').AsString+') AND '+
                       '   (IDMOTIVOBLOQUEIO = '+qryTudo.FieldByName('IDMOTIVOBLOQUEIO').AsString+') AND '+
                       '   (H1.DATAMOVCUSTOD = '+
                       '         (SELECT MAX(H2.DATAMOVCUSTOD) '+
                       '          FROM   HISTCUSTODIA H2 '+
                       '           WHERE (H2.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND '+
                       '                          (H2.IDINVESTIMENTO   = H1.IDINVESTIMENTO) AND '+
                       '                          (((H1.IDLOTE IS NOT NULL) AND (H2.IDLOTE =H1.IDLOTE)) OR ((H1.IDLOTE IS NULL) AND (H2.IDLOTE IS NULL))) AND '+
                       '                          (H2.IDCUSTODIANTE   = H1.IDCUSTODIANTE) AND '+
                       '                          (H2.IDMOTIVOBLOQUEIO   = H1.IDMOTIVOBLOQUEIO) AND '+
                       '                          (H2.FLGCALCSALDO IS NULL) AND '+
                       '                          ((H2.DATAMOVCUSTOD  < TO_DATE('+#39+qryTudo.FieldByName('DataMovCustod').AsString+#39+','+#39+'DD/MM/YYYY'+#39+')) OR '+
                       '                          ((H2.DATAMOVCUSTOD  = TO_DATE('+#39+qryTudo.FieldByName('DataMovCustod').AsString+#39+','+#39+'DD/MM/YYYY'+#39+')) AND '+
                       '                          (H2.IDCUSTODIA    < '+qryTudo.FieldByName('IdCustodia').AsString+ '))))) AND '+
                       '   (H1.IDCUSTODIA = '+
                       '         (SELECT MAX(H3.IDCUSTODIA) '+
                       '          FROM   HISTCUSTODIA H3 '+
                       '           WHERE (H3.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND '+
                       '                          (H3.IDINVESTIMENTO   = H1.IDINVESTIMENTO) AND '+
                       '                          (((H1.IDLOTE IS NOT NULL) AND (H3.IDLOTE =H1.IDLOTE)) OR ((H1.IDLOTE IS NULL) AND (H3.IDLOTE IS NULL))) AND '+
                       '                          (H3.IDCUSTODIANTE   = H1.IDCUSTODIANTE) AND '+
                       '                          (H3.IDMOTIVOBLOQUEIO   = H1.IDMOTIVOBLOQUEIO) AND '+
                       '                          (H3.FLGCALCSALDO IS NULL) AND '+
                       '                          (H3.DATAMOVCUSTOD   = H1.DATAMOVCUSTOD) AND '+
                       '                          ((H3.DATAMOVCUSTOD < TO_DATE('+#39+qryTudo.FieldByName('DataMovCustod').AsString+#39+','+#39+'DD/MM/YYYY'+#39+')) OR '+
                       '                           (H3.IDCUSTODIA    < '+qryTudo.FieldByName('IdCustodia').AsString+ ')))) '+
                       'ORDER BY    DATAMOVCUSTOD DESC, IDCUSTODIA DESC');

                       Tipo := qryTudo.FieldByName('TipoCustodia').AsString;
                       Qtde := qryTudo.FieldByName('QtdeMovCustod').AsFloat;
                       IdMotivoBloqueio := qryTudo.FieldByName('IdMotivoBloqueio').AsInteger;

                       // Se não tem uma linha anterior o Saldo liberado e o
                       //bloqueado recebem 0
                       if not qryAntes.IsEmpty then
                       begin
                            TotLiberado  := qryAntes.FieldByName('SaldoLiberado').AsFloat;
                            TotBloqueado := qryAntes.FieldByName('SaldoBloqueado').AsFloat;
                       end
                       else
                       begin
                            TotLiberado  := 0;
                            TotBloqueado := 0
                       end;

                       // Altera os saldos dependendo do tipo de operação
                       if (Tipo = 'C') or (Tipo = 'I') then  // Compra ou Inicialização
                          TotLiberado := TotLiberado + Qtde
                       else if Tipo = 'V' then  // Venda
                          TotLiberado := TotLiberado - Qtde
                       else if Tipo = 'B' then  // Bloqueio
                       begin
                            if IdMotivoBloqueio = -1 then
                               TotLiberado  := TotLiberado  - Qtde
                            else
                               TotBloqueado := TotBloqueado + Qtde;
                       end
                       else if Tipo = 'D' then  // Desbloqueio
                       begin
                            if IdMotivoBloqueio = -1 then
                               TotLiberado  := TotLiberado  + Qtde
                            else
                               TotBloqueado := TotBloqueado - Qtde;
                       end
                       else if Tipo = 'X' then // Desbloqueia e vende
                          TotBloqueado := TotBloqueado - Qtde
                       else if Tipo = 'Y' then // Aumenta Saldo Bloqueado
                          TotBloqueado := TotBloqueado + Qtde
                       else if Tipo = 'Z' then // Diminui Saldo Bloqueado
                          TotBloqueado := TotBloqueado - Qtde;

                        // Atualiza Histórico
                        if IdMotivoBloqueio = -1 then
                           ExecutarQuery(qryUpdate,'Update HistCustodia Set '+
                                     'SaldoLiberado='+FloatToStr(TotLiberado)+
                                     ', FlgCalcSaldo='+#39+#39+
                                     ' Where IdCustodia='+qryTudo.FieldByName('IdCustodia').
                                     AsString)
                        else
                           ExecutarQuery(qryUpdate,'Update HistCustodia Set '+
                                     'SaldoBloqueado='+FloatToStr(TotBloqueado)+
                                     ', FlgCalcSaldo='+#39+#39+
                                     ' Where IdCustodia='+qryTudo.FieldByName('IdCustodia').
                                     AsString);
                        qryTudo.Next
                    end;
               end;

               // Refaz a query de linhas marcadas com '1'
               qryMarca.Close;
               qryMarca.Open;
          end;
      except
           raise
      end;
     finally
            // Libera objetos da memória
            qryMarca.Free;
            qryTudo.Free;
            qryAntes.Free;
            qryUpdate.Free;
            qryMarca := nil;
            qryTudo := nil;
            qryAntes := nil;
            qryUpdate := nil;
     end;
end;

//--------------------------------------------------------------------------------------------------
//    Função que Registra Custodia no HistCustodia, a partir do FlgCustodia do HistCartInv.
//--------------------------------------------------------------------------------------------------
function TOperacaoInvest.CadastraCustodia (iOperacao: longint) : boolean;
var
   Tipo: string;
   TotLiberado, TotBloqueado, TotInutil, Qtde: Double;
   wQtde, wIdMotivoBloqueio, wIdMotivoBloqOrig, wIdMotivoBloqDest, wIdMotOp, IdCustodia: integer;
   sTipoCustOrig, sTipoCustDest, sLoteD, sLoteA: string;
   QryLocal, QryLocal1, QryLocalA, QryLocalD :TwwQuery;
begin

// Cria Objetos Locais
  QryLocal               := TwwQuery.Create(Application);
  QryLocal.DatabaseName  := 'BaseDados';
  QryLocal1              := TwwQuery.Create(Application);
  QryLocal1.DatabaseName := 'BaseDados';
  QryLocalA              := TwwQuery.Create(Application);
  QryLocalA.DatabaseName := 'BaseDados';
  QryLocalD              := TwwQuery.Create(Application);
  QryLocalD.DatabaseName := 'BaseDados';

  Result:= true;

  if IOperacao = -1 then
     FazQuery(QryLocal,
       'SELECT  H.IDHISTCARTINV, H.IDCARTEIRAINVEST, H.IDINVESTIMENTO, H.IDLOTE, '+
       '        H.DATAMOVCARTINV, H.IDOPERACAOINVEST, H.QTDEMOVINVCART, '+
       '        OPR.QTDEOPERACAO, OPR.IDCUSTODIANTE, OPR.IDCUSTORIG, OPR.IDCUSTDEST, '+
       '        TOP.TIPOCUSTODIA, TOP.IDMOTIVOBLOQUEIO, TOP.FLGTRANSF, '+
       '        TOP.TIPSALDOCARTORIG, TOP.MOTBLOQCARTORIG, TOP.TIPSALDOCARTDEST, TOP.MOTBLOQCARTDEST '+

       'FROM HISTCARTINV H, OPERACAOINVEST OPR, TIPOOPERACAO TOP '+

       'WHERE     (H.FLGCUSTODIA = '+'''1'''+') '+
       '      AND (H.IDTIPOOPERACAO   = TOP.IDTIPOOPERACAO(+))   '+
       '      AND (H.IDOPERACAOINVEST = OPR.IDOPERACAOINVEST(+)) '+
   //    '      AND (TOP.TIPOCUSTODIA <> '+'''N'''+') '+
       'ORDER BY H.DATAMOVCARTINV, H.IDHISTCARTINV')
  else
     FazQuery(QryLocal,
       'SELECT  OPR.IDCARTEIRAINVEST, OPR.IDINVESTIMENTO, OPR.IDLOTE, '+
       '        OPR.DATAOPERACAO AS DATAMOVCARTINV, OPR.IDOPERACAOINVEST, '+
       '        OPR.QTDEOPERACAO, OPR.IDCUSTODIANTE, OPR.IDCUSTORIG, OPR.IDCUSTDEST, '+
       '        TOP.TIPOCUSTODIA, TOP.IDMOTIVOBLOQUEIO, TOP.FLGTRANSF, '+
       '        TOP.TIPSALDOCARTORIG, TOP.MOTBLOQCARTORIG, TOP.TIPSALDOCARTDEST, TOP.MOTBLOQCARTDEST '+

       'FROM OPERACAOINVEST OPR, TIPOOPERACAO TOP '+

       'WHERE     (OPR.IDOPERACAOINVEST = '+IntToStr(IOperacao)+') '+
       '      AND (OPR.IDTIPOOPERACAO   = TOP.IDTIPOOPERACAO)      ');

  while (not qryLocal.EOF) and (not qryLocal.IsEmpty) do
  begin

     if qryLocal.FieldByName('IDOPERACAOINVEST').isNull then begin
        MsgDlg('Movimento sem Operação... Inválido para Cadastramento automático de Custódia!',
               'Erro',mtError,[mbOK],0);
        Exit;
     end;

     if not qryLocal.FieldByName('IDMOTIVOBLOQUEIO').isNull then
           wIdMotivoBloqueio := qryLocal.FieldByName('IDMOTIVOBLOQUEIO').asInteger
     else
           wIdMotivoBloqueio := -1;

     if qryLocal.FieldByName('QTDEOPERACAO').AsFloat <> 0 then
        wQtde := qryLocal.FieldByName('QTDEOPERACAO').AsInteger
     else
        wQtde := qryLocal.FieldByName('QTDEMOVINVCART').AsInteger;

// Se existe Transferência antes ou depois da Operação
     if QryLocal.FieldByName('FLGTRANSF').AsString[1] in ['A', 'D'] then begin

// Busca Informações da Transferência do Tipo 'D' (Diminui - Origem)

         if (qryLocal.FieldByName('TIPSALDOCARTORIG').AsString[1] = 'B') and
            (not qryLocal.FieldByName('MOTBLOQCARTORIG').isNull) then
               wIdMotivoBloqOrig := qryLocal.FieldByName('MOTBLOQCARTORIG').asInteger
         else
               wIdMotivoBloqOrig := -1;

         if qryLocal.FieldByName('TIPSALDOCARTORIG').AsString[1] = 'L' then
               sTipoCustOrig := 'V'
         else
               sTipoCustOrig := 'Z';

         FazQuery(QryLocalD,
          'SELECT  H.IDCARTEIRAINVEST, H.IDINVESTIMENTO, H.IDLOTE, H.QTDEMOVINVCART, C.FLGTRATALOTE '+
          'FROM CM.HISTCARTINV H, CM.CARTEIRAINVEST C                       '+
          'WHERE   (H.TIPMOVCARTINV    = ''TRF'') AND '+
          '        (H.NATURMOVCARTINV  = ''D'')   AND '+
          '        (H.IDOPERACAOINVEST = '+
          QuotedStr(QryLocal.FieldByName('IDOPERACAOINVEST').AsString)+') AND '+
          '        (H.IDCARTEIRAINVEST = C.IDCARTEIRAINVEST) ');

         If QryLocalD.FieldByName('FLGTRATALOTE').AsString='N' Then
           sLoteD:= ''
         Else
           sLoteD:=QryLocalD.FieldByName('IDLOTE').AsString;

// Busca Informações da Transferência do Tipo 'A' (Aumenta - Destino)

         if (qryLocal.FieldByName('TIPSALDOCARTDEST').AsString[1] = 'B') and
            (not qryLocal.FieldByName('MOTBLOQCARTDEST').isNull) then
               wIdMotivoBloqDest := qryLocal.FieldByName('MOTBLOQCARTDEST').asInteger
         else
               wIdMotivoBloqDest := -1;

         if qryLocal.FieldByName('TIPSALDOCARTDEST').AsString[1] = 'L' then
               sTipoCustDest := 'C'
         else
               sTipoCustDest := 'Y';

         FazQuery(QryLocalA,
          'SELECT  H.IDCARTEIRAINVEST, H.IDINVESTIMENTO, H.IDLOTE, H.QTDEMOVINVCART, C.FLGTRATALOTE '+
          'FROM CM.HISTCARTINV H, CM.CARTEIRAINVEST C                       '+
          'WHERE   (H.TIPMOVCARTINV    = ''TRF'') AND '+
          '        (H.NATURMOVCARTINV  = ''A'')   AND '+
          '        (H.IDOPERACAOINVEST = '+
          QuotedStr(QryLocal.FieldByName('IDOPERACAOINVEST').AsString)+') AND '+
          '        (H.IDCARTEIRAINVEST = C.IDCARTEIRAINVEST) ');


         If QryLocalA.FieldByName('FLGTRATALOTE').AsString='N' Then
           sLoteA:= ''
         Else
           sLoteA:=QryLocalA.FieldByName('IDLOTE').AsString;

     end;

// Trata Transferência antes da Operação
     if (QryLocal.FieldByName('FLGTRANSF').AsString = 'A') Then Begin

// Cria Movimentação de Custódia para Registro do HistcartInv que Diminui Saldo na Carteira Origem

         if not TestaSaldosCustodia(
                  QryLocalD.FieldByName('IDCARTEIRAINVEST').AsInteger,
                  QryLocalD.FieldByName('IDINVESTIMENTO').AsInteger, 9999999,
                  QryLocal.FieldByName('IDCUSTORIG').AsInteger, wIdMotivoBloqOrig,
                  sLoteD, sTipoCustOrig[1],
                  QryLocal.FieldByName('DATAMOVCARTINV').AsDateTime,
                  qryLocalD.FieldByName('QTDEMOVINVCART').AsInteger) then begin

            MsgDlg('Saldos de Custódia não Atualizados... Saldo Insuficinte!',
                   'Erro',mtError,[mbOK],0);
            Result := False;
            Exit;

         end;

         OperacaoInvest.InsereCustodia(
                  QryLocalD.FieldByName('IDCARTEIRAINVEST').AsInteger,
                  QryLocalD.FieldByName('IDINVESTIMENTO').AsInteger,
                  QryLocal.FieldByName('IDCUSTORIG').AsInteger, wIdMotivoBloqOrig,
                  QryLocal.FieldByName('IDOPERACAOINVEST').AsInteger,
                  sLoteD,  sTipoCustOrig[1],
                  QryLocal.FieldByName('DATAMOVCARTINV').AsDateTime,
                  qryLocalD.FieldByName('QTDEMOVINVCART').AsInteger);

// Cria Movimentação de Custódia para Registro do HistcartInv que Aumenta Saldo na Carteira Destino

         InsereCustodia(
                  QryLocalA.FieldByName('IDCARTEIRAINVEST').AsInteger,
                  QryLocalA.FieldByName('IDINVESTIMENTO').AsInteger,
                  QryLocal.FieldByName('IDCUSTDEST').AsInteger, wIdMotivoBloqDest,
                  QryLocal.FieldByName('IDOPERACAOINVEST').AsInteger,
                  sLoteA,  sTipoCustDest[1],
                  QryLocal.FieldByName('DATAMOVCARTINV').AsDateTime,
                  qryLocalA.FieldByName('QTDEMOVINVCART').AsInteger);

         AtualizaSaldosCustodia;

     End;

// Se Tipo de Operação trata Custódia, Cria Movimentação de Custódia para Registro
// do HistcartInv referente a Operação

     if (QryLocal.FieldByName('TIPOCUSTODIA').AsString <> 'N') Then Begin

        wIdMotOp := wIdMotivoBloqueio;

        if QryLocal.FieldByName('TIPOCUSTODIA').AsString[1] = 'B' then
           wIdMotOp := -1;

        if not TestaSaldosCustodia(
                 QryLocal.FieldByName('IDCARTEIRAINVEST').AsInteger,
                 QryLocal.FieldByName('IDINVESTIMENTO').AsInteger, 9999999,
                 QryLocal.FieldByName('IDCUSTODIANTE').AsInteger, wIdMotOp,
                 QryLocal.FieldByName('IDLOTE').AsString,
                 QryLocal.FieldByName('TIPOCUSTODIA').AsString[1],
                 QryLocal.FieldByName('DATAMOVCARTINV').AsDateTime, wQtde) then begin

           MsgDlg('Saldos de Custódia não Atualizados... Saldo Insuficinte!',
                  'Erro',mtError,[mbOK],0);
           Result := False;
           Exit;

        end;

        InsereCustodia(
                 QryLocal.FieldByName('IDCARTEIRAINVEST').AsInteger,
                 QryLocal.FieldByName('IDINVESTIMENTO').AsInteger,
                 QryLocal.FieldByName('IDCUSTODIANTE').AsInteger, wIdMotivoBloqueio,
                 QryLocal.FieldByName('IDOPERACAOINVEST').AsInteger,
                 QryLocal.FieldByName('IDLOTE').AsString,
                 QryLocal.FieldByName('TIPOCUSTODIA').AsString[1],
                 QryLocal.FieldByName('DATAMOVCARTINV').AsDateTime, wQtde);

        AtualizaSaldosCustodia;

     End;

// Trata Transferência depois da Operação
     if (QryLocal.FieldByName('FLGTRANSF').AsString = 'D') Then Begin

// Cria Movimentação de Custódia para Registro do HistcartInv que Diminui Saldo na Carteira Origem

         if not TestaSaldosCustodia(
                  QryLocalD.FieldByName('IDCARTEIRAINVEST').AsInteger,
                  QryLocalD.FieldByName('IDINVESTIMENTO').AsInteger, 9999999,
                  QryLocal.FieldByName('IDCUSTORIG').AsInteger, wIdMotivoBloqOrig,
                  sLoteD, sTipoCustOrig[1],
                  QryLocal.FieldByName('DATAMOVCARTINV').AsDateTime,
                  qryLocalD.FieldByName('QTDEMOVINVCART').AsInteger) then begin

            MsgDlg('Saldos de Custódia não Atualizados... Saldo Insuficinte!',
                   'Erro',mtError,[mbOK],0);
            Result := False;
            Exit;

         end;

         InsereCustodia(
                  QryLocalD.FieldByName('IDCARTEIRAINVEST').AsInteger,
                  QryLocalD.FieldByName('IDINVESTIMENTO').AsInteger,
                  QryLocal.FieldByName('IDCUSTORIG').AsInteger, wIdMotivoBloqOrig,
                  QryLocal.FieldByName('IDOPERACAOINVEST').AsInteger,
                  sLoteD,  sTipoCustOrig[1],
                  QryLocal.FieldByName('DATAMOVCARTINV').AsDateTime,
                  qryLocalD.FieldByName('QTDEMOVINVCART').AsInteger);

// Cria Movimentação de Custódia para Registro do HistcartInv que Aumenta Saldo na Carteira Destino

         InsereCustodia(
                  QryLocalA.FieldByName('IDCARTEIRAINVEST').AsInteger,
                  QryLocalA.FieldByName('IDINVESTIMENTO').AsInteger,
                  QryLocal.FieldByName('IDCUSTDEST').AsInteger, wIdMotivoBloqDest,
                  QryLocal.FieldByName('IDOPERACAOINVEST').AsInteger,
                  sLoteA,  sTipoCustDest[1],
                  QryLocal.FieldByName('DATAMOVCARTINV').AsDateTime,
                  qryLocalA.FieldByName('QTDEMOVINVCART').AsInteger);

         AtualizaSaldosCustodia;

     End;

     if IOperacao = -1 then begin
        ExecutarQuery(qryLocal1,'Update HistCartInv Set '+
                      'FlgCustodia='+#39+#39+
                      ' Where IdHistCartInv='+QryLocal.FieldByName('IDHISTCARTINV').AsString);
   // Refaz a query de linhas do HistCartInv com FlgCustodia marcado com '1'
        qryLocal.Close;
        qryLocal.Open;
     End else
        qryLocal.Next;
  end;
  QryLocal.Free;
  QryLocal1.Free;
  QryLocalA.Free;
  QryLocalD.Free;
end;

//--------------------------------------------------------------------------------------------------
//    Função que Calula TIR de Investimentos Mobiliários - Renda Fixa e Variável
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros :
//       iInvestimento   :  id do Investimento                     (idInvestimento)
//       iCarteira       :  id da Carteira de Investimentos        (idCarteiraInvest)
//       sLote           :  Lote do Investimento                   (idLote)
//       -------------------------------------------------------------------------------------------
//          passar (-1) caso os parâmetros não sejam necessários
//       -------------------------------------------------------------------------------------------
//       dDataOperInicio :  Data da Operação Inicial para o Período a ser analisado
//       dDataOperFim    :  Data da Operação Final   para o Período a ser analisado
//       bMostraMsg      :  True  - mostra mensagens
//                          False - não mostra mensagens
//       fTIR            :  Valor da TIR calculado para o Período
//--------------------------------------------------------------------------------------------------
// Função que Calula TIR de Investimentos Mobiliários - Renda Fixa e Variável
// Função que Calula TIR de Investimentos Mobiliários - Renda Fixa e Variável
function TOperacaoInvest.CalculaTIRMob(iInvestimento, iCarteira: longint; sLote: string;
dDataOperInicio,dDataOperFim, dDataSaldoFinal : TDateTime; bMostraMsg, bDiasUteis: boolean; var fTIR: double; var iCalcula: smallint): boolean;

var
   dDataRef, dDataInicial   : TDate;
   SpreadSheet: TF1Book;
   Z, i, iexp, idiasuteis, J   : integer;
   iFlag   : smallint;
   fNulo, fSaldoInicial, fSaldoPremio, fTIRAux, fTotSaldo, fSaldo : double;
   wFormula, sSQL : String;
   Lista :TStringList;
   QryLocal :TwwQuery;
begin
   Result := True;

   QryLocal             := TwwQuery.Create(Application);
   QryLocal.DatabaseName:= 'BaseDados';

   // Cria Planilha com valores zerados.
   SpreadSheet := TF1Book.Create(Application);
   SpreadSheet.ClearRange(-1, -1, -1, -1, F1ClearAll);

   iFlag := 0;
   iCalcula := 0;

   try
      // testa se Carteira ou Investimento foram informados
      if (iInvestimento = -1) and (ICarteira = -1) then begin
         if bMostraMsg then MsgDlg('Informe Carteira e/ou Investimento!', 'Erro', mtError, [mbOk], 0);
         Result := False;
         Exit;
      end;

      // testa se Periodo foi informado
      if (dDataOPerInicio = 0) or (dDataOPerFim = 0) then begin
         if bMostraMsg then MsgDlg('Período Inválido!', 'Erro', mtError, [mbOk], 0);
         Result := False;
         Exit;
      end;

      i          := 1;
      idiasuteis := 0;
      dDataRef := dDataOperInicio - 1;

      While dDataRef <= dDataOperFim Do Begin

         If ((bDiasUteis) and (DiasUteis.DiaUtil(dDataRef, 0, 1, '', True, False, False))) or
            (not (bDiasUteis)) or
            (dDataRef = dDataOperInicio - 1)  Then begin

            QryLocal.Close;
            sSQL :=
              'SELECT DISTINCT HC.IDCARTEIRAINVEST FROM HISTCARTINV HC '+
              'WHERE  (HC.IDINVESTIMENTO = ' + IntToStr(iInvestimento)+') ';

            if sLote <> '' then
               sSQL := sSQL + ' AND (HC.IDLOTE = '''+sLote+''')  '
            else
               sSQL := sSQL + ' AND (HC.IDLOTE IS NULL)  ';

            if iCarteira <> -1 Then
                sSQL := sSQL + '    AND (HC.IDCARTEIRAINVEST = '+IntToStr(iCarteira)+')  ';

            FazQuery(QryLocal, sSQL);

// Varre Carteiras que possuem o Investimento

            QryLocal.Open;
            QryLocal.First;
            fTotSaldo := 0;
            While Not QryLocal.EOF Do Begin

               if dDataRef = dDataOperInicio - 1 then begin
                 // Busca Saldo Inicial no dia anterior a Data Inicio para simular uma Compra (-)
{                  OperacaoInvest.CalculaSaldo(iInvestimento,
                              QryLocal.FieldByName('IDCARTEIRAINVEST').AsInteger,
                              sLote, dDataRef, fNulo, fNulo,
                              fNulo, fNulo, fNulo, fNulo, fNulo, fNulo, fSaldoInicial, fNulo,
                              fNulo, fNulo, fNulo, fNulo, fNulo, fNulo, fNulo);
}
                 OperComum.CalculaSaldo(iInvestimento,
                              QryLocal.FieldByName('IDCARTEIRAINVEST').AsInteger,
                              sLote, dDataRef, fNulo, fSaldoInicial,
                              fNulo, fNulo, fNulo, fNulo, fNulo, fNulo, fNulo, fNulo,
                              fNulo, fSaldoPremio, fNulo, fNulo, fNulo, fNulo, fNulo);

                 fTotSaldo := fTotSaldo + ((fSaldoInicial - fSaldoPremio)* -1);
               end else begin
                 fSaldo   := OPeracaoInvest.CalculaSaldoDiaTIR(iInvestimento,
                                       QryLocal.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                       sLote, dDataRef, dDataOperFim, dDataSaldoFinal, iFlag);

                 if iCalcula = 0 then
                   iCalcula := iFlag;

                 fTotSaldo := fTotSaldo + fSaldo;
               end;

               QryLocal.Next;

            end;

            // ************* Alimenta Planilha com saldo do dia
            SpreadSheet.NumberRC[i,1] := fTotSaldo;

            i := i + 1;

         end;

         If DiasUteis.DiaUtil(dDataRef, 0, 1, '', True, False, False)  and
          (dDataRef <> dDataOperInicio - 1)   Then
           idiasuteis := idiasuteis + 1;

         dDataRef := dDataRef + 1;

      end;

      If bDiasUteis Then
        iexp := idiasuteis
      else
        iexp := i - 2;

      // preenche a fórmula
//      SpreadSheet.FormulaRC[1,2]    :=  'IRR(' + 'A1:A' + IntToStr(i) + '; ' + FloatToStr(1/1000) + ' )';
      wFormula := 'IF(B3=0;9999999;((IRR(' + 'A1:A' + IntToStr(i-1) + '; ' + FloatToStr(1/1000) + ' ) + 1) ^ (' + IntToStr(iexp) + ') - 1) *100)';
      SpreadSheet.FormulaRC[2,2]    := wFormula;
      SpreadSheet.FormulaRC[3,2]    := 'SUM(' + 'A2:A' + IntToStr(i) + ')';

      if iCalcula = 1 then begin
         Try
           SpreadSheet.Recalc;
           fTIR := SpreadSheet.NumberRC[2,2];
           SpreadSheet.Free;
           SpreadSheet := NIL;
           Result := True;
         Except
           Result := False;
           SpreadSheet.Free;
           SpreadSheet := NIL;
//           ShowMessage(' Erro: ' + IntToStr(iInvestimento));
         End;
//         ShowMessage(IntToStr(iInvestimento)+' - '+FloatToStr(fSaldoInicial)+' - '+FloatToStr(fTIR));
      End else begin
//         ShowMessage(IntToStr(iInvestimento));
         fTIR := 0;
      End;;

   except
      if bMostraMsg then Raise;
      Result := False;
   end;

   QryLocal.Free;

end;

//--------------------------------------------------------------------------------------------------
//    Função que Calula Saldo do Dia para TIR
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros :
//       iInvestimento   :  id do Investimento
//       iCarteira       :  id da Carteira de Investimentos
//       sLote           :  Lote do Investimento
//       dDataRef        :  Data do Saldo a ser calculado
//       dDataOperFim    :  Data Final do Período que está sendo analisado
//       -------------------------------------------------------------------------------------------
//          passar (-1) caso os parâmetros não sejam necessários
// Função que Calula Saldo do Dia para TIR
function TOperacaoInvest.CalculaSaldoDiaTIR(iInvestimento, iCarteira: longint; sLote: string;
dDataRef, dDataOperFim, dDataSaldoFinal: TDateTime; var iFlag: smallint): double;

var
   sSql       : String;
   QryLocal   : TwwQuery;
   fNulo, fSaldoFinal, fSaldoFinalMerc, fSaldoPremio, fSaldoDia, fMovim : double;
   cNaturezaMovimento, cNaturezaOPeracao: Char;
begin

   try

      // Busca Operações de HistCartInv em dDataRef

      // Cria Objetos Locais
      QryLocal              := TwwQuery.Create(Application);
      QryLocal.DatabaseName := 'BaseDados';

      iFlag := 0;

      With QryLocal Do Begin
         Close;
         Sql.Clear;
         Sql.add(' SELECT HC.VLRMOVCARTINV, HC.MOVIMATU, HC.TIPMOVCARTINV,             ');
         Sql.add(' HC.NATURMOVCARTINV, HC.NATURMOVOPER                                 ');
         Sql.add(' FROM   CM.HISTCARTINV HC                                            ');
         Sql.add(' WHERE                                                               ');
         Sql.add('    (HC.DATAMOVCARTINV   = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) ');

// INCLUIDO EM 23/01/2000 PARA TESTE - FLAVIO
         Sql.add('    AND (HC.MOVIMATU <> 0)                                           ');
         Sql.add('    AND (HC.TIPMOVCARTINV <> ''INI'')                                ');

         if iCarteira <> -1  Then
            Sql.add(' AND (HC.IDCARTEIRAINVEST = '+IntToStr(iCarteira)+')              ');
         if iInvestimento <> -1  Then
            Sql.add(' AND (HC.IDINVESTIMENTO   = '+IntToStr(iInvestimento)+')          ');
         if sLote <> '' then
            Sql.add(' AND (HC.IDLOTE = '''+slote+''')  ')
         else
            Sql.add(' AND (IDLOTE IS NULL)  ');
         Open;
      End;

      fSaldoDia := 0;
      if QryLocal.RecordCount <> 0 then iFlag :=1;

      While Not QryLocal.Eof Do Begin
         // Alimenta Saldo do Dia

// INCLUIDO EM 23/01/2000 PARA TESTE - FLAVIO

         cNaturezaOPeracao  := qryLocal.FieldByName('NATURMOVOPER').AsString[1];
         cNaturezaMovimento := qryLocal.FieldByName('NATURMOVCARTINV').AsString[1];

         if qryLocal.FieldByName('TIPMOVCARTINV').AsString = 'TRF' then

           Case qryLocal.FieldByName('NATURMOVCARTINV').AsString[1] Of
             'A': // Aumenta quantidade de cotas (Compra)
               fMovim := (-1) * (ABS(QryLocal.FieldByName('VLRMOVCARTINV').AsFloat));
             'D': // Diminui quantidade de cotas (Venda)
               fMovim := (ABS(QryLocal.FieldByName('VLRMOVCARTINV').AsFloat));
           else
             fMovim := (-1) * (ABS(QryLocal.FieldByName('VLRMOVCARTINV').AsFloat)*
                               (ABS(QryLocal.FieldByName('MOVIMATU').AsFloat)/
                                QryLocal.FieldByName('MOVIMATU').AsFloat));
           end
         Else
           fMovim := (-1) * (ABS(QryLocal.FieldByName('VLRMOVCARTINV').AsFloat)*
                             (ABS(QryLocal.FieldByName('MOVIMATU').AsFloat)/
                              QryLocal.FieldByName('MOVIMATU').AsFloat));

         If not (((cNaturezaMovimento = 'A') Or (cNaturezaMovimento = 'D') Or
            ( (cNaturezaMovimento = 'E') And ( (cNaturezaOperacao = 'A') Or
                                               (cNaturezaOperacao = 'D') ) ))
             and (dDataRef = dDataOperFim)) then begin

            fSaldoDia  := fSaldoDia + fMovim;

         end;



         QryLocal.Next;
      End;
      // Libera Objetos Locais
      QryLocal.Free;

      if dDataRef = dDataOperFim then begin
      // Busca Saldo Final na Data Fim para simular uma Venda (+)
         OperComum.CalculaSaldo(iInvestimento, iCarteira, sLote, dDataSaldoFinal,
                               fNulo, fSaldoFinal,
                               fNulo, fNulo, fNulo, fNulo, fNulo, fNulo, fSaldoFinalMerc, fNulo,
                               fNulo, fSaldoPremio, fNulo, fNulo, fNulo, fNulo, fNulo);
         fSaldoDia := fSaldoDia + fSaldoFinal - fSaldoPremio;
//         fSaldoDia := fSaldoDia + fSaldoFinalMerc;
         if fSaldoDia <> 0 then iFlag := 1;
      end;

      Result := fSaldoDia;

   except
      Raise;
   end;
end;


// Função que Calcula Valor Atualizado de Título de Renda Fixa numa determinada Data.
// Tipo = 1 (Atualiza para Data Informada), Tipo = 2 (Atualiza para Data de Vencimento)
// Se Tipo = 1 e não informou Data, assume data corrente.
Function TOperacaoInvest.CalculaInvRenFixAtu(iCarteira, iInvestimento, iTipo: LongInt;
                                             sLote: string; dDataAtu: TDateTime;
                                             Var PuVariacao, PuJuros :Double): Double;
Var
   QryLocal  :TwwQuery;
   wParam1, wParam2,wPuCompra,wVlrCorrigido : Double;
   wSaldoQtd, wSaldoAqui, wSaldoInutil, WCorrecao1, WCorrecao2: Double;
   iIntervalo: integer;
   fatorTR,wVlrSaldoInvest,fValCotacao : double;
   bSaldoIni : boolean;
   iPzIGPDI : integer;
   wDataCotacao,DataSaldoAnterior :TDateTime;
Begin
   // Inicia Variaveis
   WCorrecao1 :=1;
   WCorrecao2 :=1;
   wParam1    :=0;
   wParam2    :=0;
   PuJuros    :=0;
   PuVariacao :=0;
   Result     :=0;
   wPuCompra  :=0;
   wVlrCorrigido:=0;
   iPzIGPDI := 0;

   // Cria Objetos Locais
   QryLocal := TwwQuery.Create(Application);
   QryLocal.DatabaseName:= 'BaseDados';

   // Busca Dados dos Investimentos (Renda Fixa)
   FazQuery(QryLocal,'SELECT TR.DATAVENCTITRENFIX,TR.DATAINIJURRENFIX,TR.DATAEMTITRENFIX,TR.PERCINDEX, '+
                     '       TR.INDEXRENFIX,TR.JUROSDIA,TR.DATABASEINDRENFIX,TR.DATAINITR, '+
                     '       TR.INDEXRENFIX2,TR.DATABASEINDRENFX2,TR.PERCINDEX2,TR.JUROSRENFIX2, '+
                     '       TR.CODTIPTXJUROS2,TR.DATAINIJURRENFIX2, TR.DIASPRAZOANBID,TR.DIASPRAZOANBID2, '+
                     '       TT.FLGPU,TT.FLLGPRORATA,TT.FLGINTERPOLA,TT.IDTRATAIND, '+
                     '       CO.VLRCOMPRATITLOTE,CO.QTDECOMPRATITLOTE, '+
                     '       JR.EFETNOMI, JR.TAMPERJUROS, '+
                     '       HI.SALDOVLRINI,HI.SALDOQTDEINI, '+
                     '       TI.IDTRATAIND,TI.CODTRATAIND,TI.MOECODIGO, '+
                     '       TI1.MOECODIGO,TI1.CODTRATAIND AS CODTRATAIND2 '+
                     'FROM   TITRENFIXA TR,TIPOTITRENFIXA TT,CONTRATOINVESTIM CO,   '+
                     '       TIPOJUROS JR,TRATAINDICE TI,TRATAINDICE TI1, '+
                     '       (SELECT IDINVESTIMENTO,SALDOVLRINVCART AS SALDOVLRINI, '+
                     '              SALDOQTDEINVCART AS SALDOQTDEINI '+
 		     '        FROM HISTCARTINV                   '+
 		     '        WHERE TIPMOVCARTINV = ''INI'') HI  '+
                     'WHERE  (TR.IDTITRENFIXA   = '+InttoStr(iInvestimento)+') AND '+
                     '       (CO.IDINVESTIMENTO = '+InttoStr(iInvestimento)+') AND '+
                     '       (TR.INDEXRENFIX = TI.MOECODIGO(+))                AND '+
                     '       (TR.INDEXRENFIX2 = TI1.MOECODIGO(+))              AND '+
                     '       (CO.IDINVESTIMENTO = HI.IDINVESTIMENTO(+))        AND '+
                     '       (((CO.IDLOTE IS NOT NULL) AND (CO.IDLOTE = '''+slote+''')) OR ((CO.IDLOTE IS NULL) AND ('''+slote+''' IS NULL))) AND '+
                     '       (TR.CODTIPRENFIXA = TT.CODTIPRENFIXA)             AND '+
                     '       (TR.CODTIPTXJUROS  = JR.CODTIPTXJUROS(+))');
// Define data de Processo
    If iTipo = 1 Then
    Begin
      If DateToStr(dDataAtu) = '' then
         dDataAtu := Date;
    End
    Else
       dDataAtu := QryLocal.FieldByName('DATAVENCTITRENFIX').AsDateTime;

// Se a Atualização é feita por PU
    If QryLocal.FieldByName('FLGPU').AsInteger = 1 Then
    begin
    // Busca Cotacao do Investimento
       Result := OperComum.BuscaCotacaoInvest(iInvestimento, dDataAtu, True);

       wSaldoQtd  := 0;
       wSaldoAqui := 0;
       OperComum.BuscaTodosSaldosInvestLote(
         ICarteira, iInvestimento, 9999999, sLote, dDataAtu,
         wSaldoQtd,    wSaldoInutil,    wSaldoInutil, wSaldoInutil, wSaldoAqui,
         wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
         wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil);

       PuVariacao := Result - (wSaldoAqui / wSaldoQtd);
    End
    Else
    Begin
       // Busca Nova Cotação por Indice/Juros
       If QryLocal.FieldByName('SALDOVLRINI').IsNull Then
       begin
          Result := QryLocal.FieldByName('VLRCOMPRATITLOTE').AsFloat/
                    QryLocal.FieldByName('QTDECOMPRATITLOTE').AsFloat;
          bSaldoIni := False;
       end
       else
       begin
          Result := QryLocal.FieldByName('SALDOVLRINI').AsFloat/
                    QryLocal.FieldByName('SALDOQTDEINI').AsFloat;
          bSaldoIni := True; // Saldo inicial implantado histcartinv
       end;
       wPuCompra:=Result;
       // Atualização da Correção Monetária
       // Indice diário da REFER
       If (QryLocal.FieldByName('CODTRATAIND').AsString = 'OVER') Then
       Begin
          // So faz se for dia util
//          If DiasUteisInvest.DiaUtil(dDataAtu,-1,1,'',True,False,False) Then
//          Begin
//             If dDataAtu>QryLocal.FieldByName('DATABASEINDRENFIX').AsDateTime Then
//             Begin
//                DataSaldoAnterior:=(dDataAtu-1);
//                While not DiasUteisInvest.DiaUtil(DataSaldoAnterior,-1,1,'',True,False,False) Do
//                Begin           // Achar o anterior útil
//                  DataSaldoAnterior  := DataSaldoAnterior-1;
//                End;
//                wSaldoQtd  := 0;
//                wSaldoAqui := 0;
//                wVlrSaldoInvest:=0;
//                fValCotacao:=0;
//                OperComum.BuscaTodosSaldosInvestLote(
//                             ICarteira, iInvestimento, 9999999, sLote,DataSaldoAnterior,
//                             wSaldoQtd,    wVlrSaldoInvest, wSaldoInutil, wSaldoInutil, wSaldoAqui,
//                             wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
//                             wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil);
//                OperComum.BuscaCotacaoMoeda(
//                QryLocal.FieldByName('INDEXRENFIX').AsInteger,dDataAtu,'=',
//                fValCotacao,wDataCotacao);
//                If fValCotacao = 0 Then
//                Begin
//                   MsgDlg('Fator não encontrada '+QryLocal.FieldByName('CODTRATAIND').AsString
//                   +' em '+DateToStr(dDataAtu)+' Saldo errado ','Mensagem do Sistema ',
//                    mtError, [mbOk], 0);
//                End;                    // Saldo de ontem * Fator de Hoje
//                Result:=(wVlrSaldoInvest/wSaldoQtd)*((fValCotacao/3000)+1);
//                PuVariacao := Result - (wSaldoAqui / wSaldoQtd);
//             End;
//          End;
          Exit;
       End
       // Correção 1
       else if (QryLocal.FieldByName('CODTRATAIND').AsString = 'TR') then
//          WCorrecao1 := AcumuladoTR(dDataAtu,
//                                    QryLocal.FieldByName('DATAEMTITRENFIX').AsDateTime,
//                                    QryLocal.FieldByName('DATAINITR').AsDateTime,
//                                    QryLocal.FieldByName('DATABASEINDRENFIX').AsDateTime,
//                                    QryLocal.FieldByName('DATAVENCTITRENFIX').AsDateTime,
//                                    QryLocal.FieldByName('PERCINDEX').asFloat,
//                                    QryLocal.FieldByName('INDEXRENFIX').AsInteger,
//                                    bSaldoIni)
       else if (QryLocal.FieldByName('CODTRATAIND').AsString = 'ANBID') then
//          WCorrecao1 := AcumuladoANBID(dDataAtu,
//                                       QryLocal.FieldByName('DATAEMTITRENFIX').AsDateTime,
//                                       QryLocal.FieldByName('DATABASEINDRENFIX').AsDateTime,
//                                       QryLocal.FieldByName('DATAVENCTITRENFIX').AsDateTime,
//                                       QryLocal.FieldByName('PERCINDEX').asFloat,
//                                       QryLocal.FieldByName('INDEXRENFIX').AsInteger,
//                                       QryLocal.FieldByName('DIASPRAZOANBID').AsInteger,
//                                       bSaldoIni)
       else if QryLocal.FieldByName('CODTRATAIND').AsString = 'TJLP' then
//          WCorrecao1 := AcumuladoTJLP(dDataAtu,
//                                      QryLocal.FieldByName('DATAEMTITRENFIX').AsDateTime,
//                                      QryLocal.FieldByName('DATABASEINDRENFIX').AsDateTime,
//                                      QryLocal.FieldByName('DATAVENCTITRENFIX').AsDateTime,
//                                      QryLocal.FieldByName('PERCINDEX').asFloat,
//                                      QryLocal.FieldByName('INDEXRENFIX').AsInteger,
//                                      QryLocal.FieldByName('DIASPRAZOANBID2').AsInteger,
//                                      bSaldoIni)
       else if (QryLocal.FieldByName('CODTRATAIND').AsString = 'MOEDA') then
//          WCorrecao1 := AcumuladoPU(dDataAtu,
//                                    QryLocal.FieldByName('DATAEMTITRENFIX').AsDateTime,
//                                    QryLocal.FieldByName('DATABASEINDRENFIX').AsDateTime,
//                                    QryLocal.FieldByName('DATAVENCTITRENFIX').AsDateTime,
//                                    QryLocal.FieldByName('PERCINDEX').asFloat,
//                                    QryLocal.FieldByName('INDEXRENFIX').AsInteger,
//                                    bSaldoIni)
       else if ((QryLocal.FieldByName('CODTRATAIND').AsString = 'DI') Or
                (QryLocal.FieldByName('CODTRATAIND').AsString = 'SELIC')) Then
//          WCorrecao1 := AcumuladoDI(QryLocal.FieldByName('INDEXRENFIX').AsInteger,
//                                    QryLocal.FieldByName('CODTRATAIND').AsString,
//                                    QryLocal.FieldByName('DATABASEINDRENFIX').AsDateTime,
//                                    dDataAtu,QryLocal.FieldByName('PERCINDEX').AsFloat)
       else if (QryLocal.FieldByName('CODTRATAIND').AsString = 'IGPM') or
               (QryLocal.FieldByName('CODTRATAIND').AsString = 'INPC') then
//          WCorrecao1 := AcumuladoIGPM(QryLocal.FieldByName('INDEXRENFIX').AsInteger,
//                                      QryLocal.FieldByName('CODTRATAIND').AsString,
//                                      QryLocal.FieldByName('DATAEMTITRENFIX').AsDateTime,
//                                      QryLocal.FieldByName('DATABASEINDRENFIX').AsDateTime,
//                                      QryLocal.FieldByName('DATAVENCTITRENFIX').AsDateTime,
//                                      dDataAtu,
//                                      QryLocal.FieldByName('PERCINDEX').AsFloat)
       else if QryLocal.FieldByName('CODTRATAIND').AsString = 'IGPDI' then
//          WCorrecao1 := AcumuladoIGPDI(dDataAtu,
//                                      QryLocal.FieldByName('DATAEMTITRENFIX').AsDateTime,
//                                      QryLocal.FieldByName('DATABASEINDRENFIX').AsDateTime,
//                                      QryLocal.FieldByName('DATAVENCTITRENFIX').AsDateTime,
//                                      QryLocal.FieldByName('PERCINDEX').asFloat,
//                                      QryLocal.FieldByName('INDEXRENFIX').AsInteger,
//                                      bSaldoIni,
//                                      iPzIGPDI)
       else if (QryLocal.FieldByName('CODTRATAIND').AsString = '') and
               (QryLocal.FieldByName('INDEXRENFIX').AsInteger > 0) Then
//          WCorrecao1 := AcumuladoPUManual(dDataAtu,
//                                          QryLocal.FieldByName('DATABASEINDRENFIX').AsDateTime,
//                                          QryLocal.FieldByName('PERCINDEX').AsFloat,
//                                          QryLocal.FieldByName('INDEXRENFIX').AsInteger,
//                                          QryLocal.FieldByName('FLLGPRORATA').AsString,
//                                          QryLocal.FieldByName('FLGINTERPOLA').AsString);

(*
       // Correção 2
       if QryLocal.FieldByName('INDEXRENFIX2').AsInteger <> 0 then
       begin
          if QryLocal.FieldByName('CODTRATAIND2').AsString = 'TR' then
             WCorrecao2 := AcumuladoTR(dDataAtu,
                                       QryLocal.FieldByName('DATAEMTITRENFIX').AsDateTime,
                                       QryLocal.FieldByName('DATAINITR').AsDateTime,
                                       QryLocal.FieldByName('DATABASEINDRENFIX').AsDateTime,
                                       QryLocal.FieldByName('DATAVENCTITRENFIX').AsDateTime,
                                       QryLocal.FieldByName('PERCINDEX2').asFloat,
                                       QryLocal.FieldByName('INDEXRENFIX2').AsInteger,
                                       bSaldoIni)
          else if QryLocal.FieldByName('CODTRATAIND2').AsString = 'ANBID' then
             WCorrecao2 := AcumuladoANBID(dDataAtu,
                                          QryLocal.FieldByName('DATAEMTITRENFIX').AsDateTime,
                                          QryLocal.FieldByName('DATABASEINDRENFIX').AsDateTime,
                                          QryLocal.FieldByName('DATAVENCTITRENFIX').AsDateTime,
                                          QryLocal.FieldByName('PERCINDEX2').asFloat,
                                          QryLocal.FieldByName('INDEXRENFIX2').AsInteger,
                                          QryLocal.FieldByName('DIASPRAZOANBID').AsInteger,
                                          bSaldoIni)
          else if QryLocal.FieldByName('CODTRATAIND2').AsString = 'TJLP' then
             WCorrecao2 := AcumuladoTJLP(dDataAtu,
                                         QryLocal.FieldByName('DATAEMTITRENFIX').AsDateTime,
                                         QryLocal.FieldByName('DATABASEINDRENFIX').AsDateTime,
                                         QryLocal.FieldByName('DATAVENCTITRENFIX').AsDateTime,
                                         QryLocal.FieldByName('PERCINDEX2').asFloat,
                                         QryLocal.FieldByName('INDEXRENFIX2').AsInteger,
                                         QryLocal.FieldByName('DIASPRAZOANBID2').AsInteger,
                                         bSaldoIni)
          else if (QryLocal.FieldByName('CODTRATAIND2').AsString = 'MOEDA') then
             WCorrecao2 := AcumuladoPU(dDataAtu,
                                       QryLocal.FieldByName('DATAEMTITRENFIX').AsDateTime,
                                       QryLocal.FieldByName('DATABASEINDRENFIX').AsDateTime,
                                       QryLocal.FieldByName('DATAVENCTITRENFIX').AsDateTime,
                                       QryLocal.FieldByName('PERCINDEX2').asFloat,
                                       QryLocal.FieldByName('INDEXRENFIX2').AsInteger,
                                       bSaldoIni)
          else if ((QryLocal.FieldByName('CODTRATAIND2').AsString = 'DI') or
                   (QryLocal.FieldByName('CODTRATAIND2').AsString = 'SELIC')) then
             WCorrecao2 := AcumuladoDI(QryLocal.FieldByName('INDEXRENFIX2').AsInteger,
                                       QryLocal.FieldByName('CODTRATAIND2').AsString,
                                       QryLocal.FieldByName('DATABASEINDRENFIX').AsDateTime,
                                       dDataAtu,QryLocal.FieldByName('PERCINDEX2').AsFloat)
          else if (QryLocal.FieldByName('CODTRATAIND2').AsString = 'IGPM') or
                  (QryLocal.FieldByName('CODTRATAIND2').AsString = 'INPC') then
             WCorrecao2 := AcumuladoIGPM(QryLocal.FieldByName('INDEXRENFIX2').AsInteger,
                                         QryLocal.FieldByName('CODTRATAIND2').AsString,
                                         QryLocal.FieldByName('DATAEMTITRENFIX').AsDateTime,
                                         QryLocal.FieldByName('DATABASEINDRENFIX').AsDateTime,
                                         QryLocal.FieldByName('DATAVENCTITRENFIX').AsDateTime,
                                         dDataAtu,
                                         QryLocal.FieldByName('PERCINDEX2').AsFloat)
          else if QryLocal.FieldByName('CODTRATAIND2').AsString = 'IGPDI' then
             WCorrecao2 := AcumuladoIGPDI(dDataAtu,
                                          QryLocal.FieldByName('DATAEMTITRENFIX').AsDateTime,
                                          QryLocal.FieldByName('DATABASEINDRENFIX').AsDateTime,
                                          QryLocal.FieldByName('DATAVENCTITRENFIX').AsDateTime,
                                          QryLocal.FieldByName('PERCINDEX').asFloat,
                                          QryLocal.FieldByName('INDEXRENFIX').AsInteger,
                                          bSaldoIni,
                                          iPzIGPDI)
          else if (QryLocal.FieldByName('CODTRATAIND2').AsString = '') and
                 (QryLocal.FieldByName('INDEXRENFIX2').AsInteger > 0) Then
             WCorrecao1 := AcumuladoPUManual(dDataAtu,
                                             QryLocal.FieldByName('DATABASEINDRENFIX').AsDateTime,
                                             QryLocal.FieldByName('PERCINDEX2').AsFloat,
                                             QryLocal.FieldByName('INDEXRENFIX2').AsInteger,
                                             QryLocal.FieldByName('FLLGPRORATA').AsString,
                                             QryLocal.FieldByName('FLGINTERPOLA').AsString);
       end;
*)
       if WCorrecao1 > WCorrecao2 then
          Result := Result * WCorrecao1
       else
          Result := Result * WCorrecao2;

       if QryLocal.FieldByName('CODTRATAIND').AsString = 'IGPDI' then
       begin
          if QryLocal.FieldByName('DATAINIJURRENFIX').AsDateTime <= StrToDate('31/07/1994') then
             Result := StrToFloat(FormatFloat('#0.000000',Result-0.00000049))
          else
             Result := StrToFloat(FormatFloat('#0.00',Result-0.0049));
       end;

       // Efetua Correção pelos Juros
       // Ver qual será o juros a ser usado : o da correcao 1 ou 2
       If QryLocal.FieldByName('JUROSDIA').AsFloat <> 0 Then
       Begin
          // ver intervalo DU ou DC
          if QryLocal.FieldByName('TAMPERJUROS').AsInteger = 252 then // DU
//             iIntervalo   := DiasUteisInvest.IntervaloDiasUteis( QryLocal.FieldByName('DATAINIJURRENFIX').AsDateTime,
//                                                                 dDataAtu, -1, 1, '',True, False, False)
          else // DC
//             iIntervalo := DiasUteis.IntervaloDias(
//                                  QryLocal.FieldByName('DATAINIJURRENFIX').AsDateTime,
//                                  dDataAtu);

          If QryLocal.FieldByName('EFETNOMI').AsString = 'E' Then
          Begin
             if QryLocal.FieldByName('CODTRATAIND').AsString = 'IGPDI' then
             begin
                PuJuros := Power(Power(((QryLocal.FieldByName('JUROSDIA').AsFloat/100)+1),360),(iPzIGPDI/12));
                PuJuros := StrToFloat(FormatFloat('#0.000000000',PuJuros))
             end
             else
                PuJuros :=Power((1 + QryLocal.FieldByName('JUROSDIA').AsFloat / 100),iIntervalo);
             Result := Result * PuJuros;
             if QryLocal.FieldByName('DATAINIJURRENFIX').AsDateTime <= StrToDate('31/07/1994') then
                Result := StrToFloat(FormatFloat('#0.000000',Result-0.00000049))
             else
                Result := StrToFloat(FormatFloat('#0.00',Result-0.0049));
          End
          Else
          Begin
             PuJuros := 1 + (QryLocal.FieldByName('JUROSDIA').AsFloat * iIntervalo);
             Result := Result *PuJuros;
          End;
       End;

       PuVariacao := Result - wPuCompra - PuJuros;

    End;
   // Libera Objetos Locais                                   iIntervalo
    QryLocal.Free;
End;


// Função que Calcula Taxa Over para um Investimento num Período.
Function TOperacaoInvest.CalculaTaxaOver(iInvestimento: longint; dDataInicial, dDataFinal: TDateTime): double;

var
   QryLocal  :TwwQuery;
   iIntervalo, iIntUtil,iIntervaloDU: integer;
   wTaxaPeriodo: double;
begin
    wTaxaPeriodo :=1;
    Result := 0;
    QryLocal             := TwwQuery.Create(Application);
    QryLocal.DatabaseName:= 'BaseDados';

    FazQuery(QryLocal,'SELECT TT.JUROSDIA,TJ.TAMPERJUROS,TJ.EFETNOMI '+
                      'FROM   TITRENFIXA TT, TIPOJUROS TJ '+
                      'WHERE  (TT.IDTITRENFIXA   = '+InttoStr(iInvestimento)+') AND '+
                      '       (TT.CODTIPTXJUROS = TJ.CODTIPTXJUROS)');
//    iIntervaloDU := DiasUteisInvest.IntervaloDiasUteis( dDataInicial, dDataFinal, -1, 1, '',True, False, False);
    if qryLocal.isEmpty then
    begin
       MsgDlg('Faltam dados para calcular TaxaOver!', 'Erro', mtError, [mbOk], 0);
    end
    else
    begin
       If QryLocal.FieldByName('JUROSDIA').AsFloat <> 0 Then
       Begin
          // Efetua Correção pelos Juros
          if QryLocal.FieldByName('TamPerJuros').AsInteger  = 252 then // DU
//             iIntervalo   := DiasUteisInvest.IntervaloDiasUteis( dDataInicial, dDataFinal, -1, 1, '',True, False, False)
          else // DC
             iIntervalo := DiasUteis.IntervaloDias(dDataInicial, dDataFinal);

          If QryLocal.FieldByName('EfetNomi').AsString = 'E' Then
          begin
             wTaxaPeriodo := Power( ( 1 + (QryLocal.FieldByName('JUROSDIA').AsFloat/100)), iIntervalo);
             wTaxaPeriodo := Power( wTaxaPeriodo, (1/iIntervaloDU))
          end
          Else
             wTaxaPeriodo := (1 + (QryLocal.FieldByName('JurosDia').AsFloat))*iIntervalo;
       end;
       //Result := ((Power(wTaxaPeriodo,(1/iIntervalo))) - 1) * 3000;
       wTaxaPeriodo := StrToFloat(FormatFloat('#0.000000000',wTaxaPeriodo));
       Result := (wTaxaPeriodo - 1) * 3000;
       Result  := StrToFloat(FormatFloat('#0.0000000',Result));
      //iIntervalo := DiasUteisInvest.IntervaloDias(dDataInicial, dDataFinal);
      //iIntUtil   := DiasUteisInvest.IntervaloDiasUteis( dDataInicial, dDataFinal, -1, 1, '', True, False, False);
      //wTaxaPeriodo := Power( ( 1 + (QryLocal.FieldByName('JUROSDIA').AsFloat/100)), iIntervalo); //- 1;      //Result := ( Power( (wTaxaPeriodo), (1 / iIntUtil)) - 1) * 30;
      //Result := ((Power(wTaxaPeriodo,(1/iIntUtil))) - 1) * 3000;
    end;
    QryLocal.Free;
end;

// Função que Busca Data e Valor Aplicado na Primeira Operacao de um Contrato
function TOperacaoInvest.BuscaInicioAplicacao(iInvestimento, iCarteira: longint; sLote: string;
                              var dDataInicio : TDateTime; var fValInicio: double): boolean;
var
   QryLocal  :TwwQuery;
begin
    Result := False;
    QryLocal             := TwwQuery.Create(Application);
    QryLocal.DatabaseName:= 'BaseDados';

    if FazQuery(QryLocal,'SELECT H1.DATAMOVCARTINV, H1.VLRMOVCARTINV '+
                         'FROM   CM.HISTCARTINV H1 '+
                         'WHERE (H1.DATAMOVCARTINV = '+
                         '          (SELECT MIN(H2.DATAMOVCARTINV) '+
                         '           FROM   HISTCARTINV H2 '+
                         '           WHERE (H2.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND '+
                         '                 (H2.IDINVESTIMENTO   = H1.IDINVESTIMENTO) AND '+
                         '                 (((H1.IDLOTE IS NOT NULL) AND (H2.IDLOTE =H1.IDLOTE)) OR ((H1.IDLOTE IS NULL) AND (H2.IDLOTE IS NULL))))) AND '+
                         '      (H1.IDHISTCARTINV   = '+
                         '          (SELECT MIN(H3.IDHISTCARTINV) '+
                         '           FROM   HISTCARTINV H3 '+
                         '           WHERE (H3.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND '+
                         '                 (H3.IDINVESTIMENTO   = H1.IDINVESTIMENTO) AND '+
                         '                 (((H1.IDLOTE IS NOT NULL) AND (H3.IDLOTE =H1.IDLOTE)) OR ((H1.IDLOTE IS NULL) AND (H3.IDLOTE IS NULL))) AND '+
                         '                 (H3.DATAMOVCARTINV   = H1.DATAMOVCARTINV)))  AND '+
                         '      (H1.IDINVESTIMENTO  IS NOT NULL) AND '+
                         '      (H1.VLRMOVCARTINV <> 0) AND '+
                         '      (H1.IDTIPOINVEST = 1) AND '+
                         '      (H1.IDCARTEIRAINVEST     = '+InttoStr(iCarteira)+') AND '+
                         '      (H1.IDINVESTIMENTO       = '+InttoStr(iInvestimento)+') AND '+
                         '      (((H1.IDLOTE IS NOT NULL) AND (H1.IDLOTE = '''+slote+''')) OR ((H1.IDLOTE IS NULL) AND ('''+slote+''' IS NULL)))') then begin
      dDataInicio := QryLocal.FieldByName('DATAMOVCARTINV').AsDateTime;
      fValInicio  := QryLocal.FieldByName('VLRMOVCARTINV').AsFloat;
      Result := True;
    end;

    QryLocal.Free;
end;

// Função que Busca Saldos de Valor Aplicado, Rendimento e Resgate de um Contrato num
//     determinado Periodo. Se nao informar data inicial, considera data da primeira
//     operacao registrada no Histcartinv. Se nao informar data final, considera data corrente.
//     Se informar sLote = '-1', trazer totais de todos os Lotes do Investimento.
function TOperacaoInvest.BuscaSaldosAplicacao(iInvestimento, iCarteira: longint; sLote: string;
                                              dDataInicio, dDataFim : TDateTime;
                                              var fValAplicado, fRendimento, fResgate: double): boolean;
var
   QryLocal  :TwwQuery;
   fAux      : double;
   sSql      : string;
begin
    Result := False;

    if (sLote = '-1') and ((DateToStr(dDataInicio) = '') or (DateToStr(dDataFim) = '')) then begin
      MsgDlg('Parâmetros Incorretos... Informar Período para Totalizar Lotes',
             'Erro',mtError,[mbOK],0);
      Exit;
    end;

    fValAplicado := 0;
    fRendimento  := 0;
    fResgate     := 0;
    QryLocal             := TwwQuery.Create(Application);
    QryLocal.DatabaseName:= 'BaseDados';

    if DateToStr(dDataInicio) = '' then
         BuscaInicioAplicacao(iInvestimento, iCarteira, sLote, dDataInicio, fAux);

    if DateToStr(dDataFim) = '' then dDataFim := Date;

    sSQL := 'SELECT SUM(H1.VLRMOVCARTINV) AS VLRMOVCARTINV '+
            'FROM   CM.HISTCARTINV H1                      '+
            'WHERE (H1.IDCARTEIRAINVEST     = '+InttoStr(iCarteira)+')     AND '+
            '      (H1.IDINVESTIMENTO       = '+InttoStr(iInvestimento)+') AND ';

    if sLote <> '-1' then
      sSQL := sSQL +'      (((H1.IDLOTE IS NOT NULL) AND (H1.IDLOTE = '''+slote+''')) OR ((H1.IDLOTE IS NULL) AND ('''+slote+''' IS NULL))) AND ';

    sSQL := sSQL +  '      (H1.DATAMOVCARTINV >= TO_DATE( '''+DateToStr(dDataInicio)+''',''DD/MM/YYYY'')) AND '+
                    '      (H1.DATAMOVCARTINV <= TO_DATE( '''+DateToStr(dDataFim)+''',''DD/MM/YYYY'')) AND '+
                    '      (H1.NATURMOVCARTINV IN (''A'')) AND '+
                    '      (H1.TIPMOVCARTINV IN (''OPE'',''INI'')) AND '+
                    '      (H1.IDTIPOINVEST = 1)';

    if FazQuery(QryLocal, sSQL) then begin
      fValAplicado  := QryLocal.FieldByName('VLRMOVCARTINV').AsFloat;
      Result := True;
    end;

    sSQL := 'SELECT SUM(H1.VLRMOVCARTINV) AS VLRMOVCARTINV '+
            'FROM   CM.HISTCARTINV H1 '+
            'WHERE '+
            '      (H1.IDCARTEIRAINVEST     = '+InttoStr(iCarteira)+') AND '+
            '      (H1.IDINVESTIMENTO       = '+InttoStr(iInvestimento)+') AND ';

    if sLote <> '-1' then
      sSQL := sSQL +'      (((H1.IDLOTE IS NOT NULL) AND (H1.IDLOTE = '''+slote+''')) OR ((H1.IDLOTE IS NULL) AND ('''+slote+''' IS NULL))) AND ';

    sSQL := sSQL +  '      (H1.DATAMOVCARTINV >= TO_DATE( '''+DateToStr(dDataInicio)+''',''DD/MM/YYYY'')) AND '+
                    '      (H1.DATAMOVCARTINV <= TO_DATE( '''+DateToStr(dDataFim)+''',''DD/MM/YYYY'')) AND '+
                    '      (H1.NATURMOVCARTINV IN (''G'',''P'',''L'',''R'')) AND '+
//                    '      (H1.TIPMOVCARTINV IN (''OPE'')) AND '+
                    '      (H1.IDTIPOINVEST = 1)';

    if FazQuery(QryLocal,sSQL) then begin
      fRendimento  := QryLocal.FieldByName('VLRMOVCARTINV').AsFloat;
    end;

    sSQL := 'SELECT SUM(H1.VLRMOVCARTINV) AS VLRMOVCARTINV '+
            'FROM   CM.HISTCARTINV H1 '+
            'WHERE '+
            '      (H1.IDCARTEIRAINVEST     = '+InttoStr(iCarteira)+') AND '+
            '      (H1.IDINVESTIMENTO       = '+InttoStr(iInvestimento)+') AND ';

    if sLote <> '-1' then
      sSQL := sSQL +'      (((H1.IDLOTE IS NOT NULL) AND (H1.IDLOTE = '''+slote+''')) OR ((H1.IDLOTE IS NULL) AND ('''+slote+''' IS NULL))) AND ';

    sSQL := sSQL +  '      (H1.DATAMOVCARTINV >= TO_DATE( '''+DateToStr(dDataInicio)+''',''DD/MM/YYYY'')) AND '+
                    '      (H1.DATAMOVCARTINV <= TO_DATE( '''+DateToStr(dDataFim)+''',''DD/MM/YYYY'')) AND '+
                    '      (H1.NATURMOVCARTINV IN (''D'')) AND '+
                    '      (H1.TIPMOVCARTINV IN (''OPE'')) AND '+
                    '      (H1.IDTIPOINVEST = 1)';

    if FazQuery(QryLocal,sSQL) then begin
      fResgate  := QryLocal.FieldByName('VLRMOVCARTINV').AsFloat;
    end;

    QryLocal.Free;
end;

// Função que Busca Saldos de Valor Aplicado, Rendimento e Resgate de um Tipo de Aplicação num
//     determinado Periodo. Se nao informar data inicial e final, considera data corrente.
function TOperacaoInvest.BuscaSaldosTipoAplic(iCarteira: longint; sTipoAplicacao: string;
                              dDataInicio, dDataFim : TDateTime;
                              var fValAplicado, fRendimento, fResgate: double): boolean;
var
   QryLocal  :TwwQuery;
   fAux      : double;
   sSql      : string;
begin
    Result := False;

    fValAplicado := 0;
    fRendimento  := 0;
    fResgate     := 0;
    QryLocal             := TwwQuery.Create(Application);
    QryLocal.DatabaseName:= 'BaseDados';

    if DateToStr(dDataInicio) = '' then dDataInicio := Date;
    if DateToStr(dDataFim) = '' then dDataFim := Date;

    sSQL := 'SELECT SUM(H1.VLRMOVCARTINV) AS VLRMOVCARTINV '+
            'FROM   CM.HISTCARTINV H1, CM.TITRENFIXA TT, CM.TIPOTITRENFIXA TP '+
            'WHERE '+
            '      (H1.IDCARTEIRAINVEST     = '+InttoStr(iCarteira)+') AND '+
            '      (H1.IDINVESTIMENTO       = TT.IDTITRENFIXA) AND '+
            '      (TT.CODTIPRENFIXA = TP.CODTIPRENFIXA) AND '+
            '      (TP.CODTIPRENFIXA = '''+sTipoAplicacao+''') AND '+
            '      (H1.DATAMOVCARTINV >= TO_DATE( '''+DateToStr(dDataInicio)+''',''DD/MM/YYYY'')) AND '+
            '      (H1.DATAMOVCARTINV <= TO_DATE( '''+DateToStr(dDataFim)+''',''DD/MM/YYYY'')) AND '+
            '      (H1.NATURMOVCARTINV IN (''A'')) AND '+
            '      (H1.TIPMOVCARTINV IN (''OPE'',''INI''))';

    if FazQuery(QryLocal, sSQL) then begin
      fValAplicado  := QryLocal.FieldByName('VLRMOVCARTINV').AsFloat;
      Result := True;
    end;

    sSQL := 'SELECT SUM(H1.VLRMOVCARTINV) AS VLRMOVCARTINV '+
            'FROM   CM.HISTCARTINV H1, CM.TITRENFIXA TT, CM.TIPOTITRENFIXA TP '+
            'WHERE '+
            '      (H1.IDCARTEIRAINVEST     = '+InttoStr(iCarteira)+') AND '+
            '      (H1.IDINVESTIMENTO       = TT.IDTITRENFIXA) AND '+
            '      (TT.CODTIPRENFIXA = TP.CODTIPRENFIXA) AND '+
            '      (TP.CODTIPRENFIXA = '''+sTipoAplicacao+''') AND '+
            '      (H1.DATAMOVCARTINV >= TO_DATE( '''+DateToStr(dDataInicio)+''',''DD/MM/YYYY'')) AND '+
            '      (H1.DATAMOVCARTINV <= TO_DATE( '''+DateToStr(dDataFim)+''',''DD/MM/YYYY'')) AND '+
            '      (H1.NATURMOVCARTINV IN (''G'',''P'',''L'',''R''))  ';
//            '      (H1.TIPMOVCARTINV IN (''OPE''))';

    if FazQuery(QryLocal,sSQL) then begin
      fRendimento  := QryLocal.FieldByName('VLRMOVCARTINV').AsFloat;
    end;

    sSQL := 'SELECT SUM(H1.VLRMOVCARTINV) AS VLRMOVCARTINV '+
            'FROM   CM.HISTCARTINV H1, CM.TITRENFIXA TT, CM.TIPOTITRENFIXA TP '+
            'WHERE '+
            '      (H1.IDCARTEIRAINVEST     = '+InttoStr(iCarteira)+') AND '+
            '      (H1.IDINVESTIMENTO       = TT.IDTITRENFIXA) AND '+
            '      (TT.CODTIPRENFIXA = TP.CODTIPRENFIXA) AND '+
            '      (TP.CODTIPRENFIXA = '''+sTipoAplicacao+''') AND '+
            '      (H1.DATAMOVCARTINV >= TO_DATE( '''+DateToStr(dDataInicio)+''',''DD/MM/YYYY'')) AND '+
            '      (H1.DATAMOVCARTINV <= TO_DATE( '''+DateToStr(dDataFim)+''',''DD/MM/YYYY'')) AND '+
            '      (H1.NATURMOVCARTINV IN (''D'')) AND '+
            '      (H1.TIPMOVCARTINV IN (''OPE''))';

    if FazQuery(QryLocal,sSQL) then begin
      fResgate  := QryLocal.FieldByName('VLRMOVCARTINV').AsFloat;
    end;

    QryLocal.Free;
end;

//------------------------------------------------------------------
// Executa uma Query - ExecSQL
Function TOperacaoInvest.ExecutaQuery(Qry: TwwQuery; Const Str :String): Boolean;
begin
  Result := False;
  With Qry Do Begin
    Try
      Close;
      SQL.Clear;
      SQL.Add(Str);
      ExecSQL;
    Except
// Mostra Erro
      On E: Exception Do Begin
        ShowMessage('Erro na Execução da Query, '+#13+
                    #13+Str+#13+
                    #13+'Com a Mensagem, '+#13+
                    #13+E.Message+#13);
        Result := False;
        Exit;
      End;
    End;
  End;
  Result := True;
end;


//------------------------------------------------------------------
// Abre uma Query - Open
Function TOperacaoInvest.FazQuery(Var Qry : TwwQuery; Str : String) : Boolean;
Var
  wLinha  :String;
  wInicial,wFinal  :Integer;
Begin
  With Qry Do Begin
    Try
      Close;
      SQL.Clear;
      SQL.Add(Str);
      Open;
    Except
// Mostra Erro
      On E:Exception Do Begin
// Monta Linha da Query
        wInicial:=1;
        wFinal  :=(Pos('FROM',Str)-1);
        If wFinal <= 0 Then wFinal:= Length(Str);
        wLinha:=Copy(Str,1,wFinal)+#13;
// From Ate Where
        wInicial:=(Pos('FROM',Str)-1);
        wFinal  :=(((Pos('WHERE',Str)-1))-Length(wLinha));
        If wFinal <= 0 Then Begin
          wInicial:=Length(wLinha);wFinal:=Length(Str);
        End;
        wLinha:=wLinha+Copy(Str,wInicial,wFinal)+#13;
// Where Ate Order by
        wInicial:=(Pos('WHERE',Str)-1);
        wFinal  :=(((Pos('ORDER BY',Str)-1))-Length(wLinha));
        If wFinal <= 0 Then Begin
          wInicial:=Length(wLinha);wFinal:=Length(Str);
        End;
        wLinha:=wLinha+Copy(Str,wInicial,wFinal)+#13;
// Order By Ate Group By
        wInicial:=(Pos('ORDER BY',Str)-1);
        wFinal  :=(((Pos('GROUP BY',Str)-1))-Length(wLinha));
        If wFinal <= 0 Then Begin
          wInicial:=Length(wLinha);wFinal:=Length(Str);
        End;
        wLinha:=wLinha+Copy(Str,wInicial,wFinal)+#13;
// Group By Ate Final
        wInicial:=(Pos('GROUP BY',Str)-1);
        wFinal  :=Length(Str);
        If wInicial <= 0 Then Begin
          wInicial:=Length(wLinha);wFinal:=Length(Str);
        End;
        wLinha:=wLinha+Copy(Str,wInicial,wFinal)+#13;
        If MessageDlg('Erro na Abertura da Query, '+Qry.Name+' :'+#13+
                    #13+wLinha+
                    #13+'Com a Mensagem, '+#13+
                    #13+E.Message+#13+#13+'Deseja Capturar a Query ?',MtError,[MbYes,MbNo],0) = MrYes Then Begin
         InputBox('Mensagem do Sistema ', 'Query Errada !!', Qry.Sql.GetText);
        End;
        Result := False;
      End;
    End;
    Result := (EOF <> BOF);
  End;
End;

//--------------------------------------------------------------------------
// Calcula o Saldo de um Investimento/Carteira em um Lote na Data Informada
Function TOperacaoInvest.BuscaSaldoInvestLote(IdCarteira, IdInvestimento, IdHistCartInv: Integer;
                                              IdLote: String; DataReferencia:TDateTime):Double;
Begin
  Result:=0;
// Chama query que calcula o saldo mencionado
  With dtmOperacaoInvest.qrySaldoInvestimentoT Do Begin
    Close;
    ParamByName('IDCARTEIRA').AsInteger     := IdCarteira;
    ParamByName('IDINVESTIMENTO').AsInteger := IdInvestimento;
    ParamByName('IDHISTORICO').AsInteger    := IdHistCartInv;
    ParamByName('DATAMOV').AsDateTime       := DataReferencia;
    ParamByName('IDLOTE').AsString          := IdLote;
    Open;
  End;
  Result:= DtmOperacaoInvest.qrySaldoInvestimentoT.FieldByName('SALDOVLRINVCART').AsFloat;
End;

// Busca as Cotacoes de uma acao em uma data (Retorna um registro com as cortacoes
Function TOperacaoInvest.BuscaCotacoesAcao(IdAcao, IdBolsaValores :Integer;
                                           DataRef:TDateTime; Aproximado:Boolean):TRecCotacoes;
Var
  QryLocal:TwwQuery;
  wSQLCotacoes:String;
Begin
// Cria Objetos Locais
  QryLocal             := TwwQuery.Create(Application);
  QryLocal.DatabaseName:= 'BaseDados';

// Inicia Resultados
  Result.VlrAbertura:=0;Result.VlrFechamento:=0;Result.VlrMaxima   :=0;
  Result.VlrMinima  :=0;Result.VlrMedia     :=0;Result.VolNegociado:=0;
  Result.DataCotacao:=0;Result.QtdLote      :=0;

// Monta Linha de Pesquisa
  wSQLCotacoes:= 'SELECT  COT.DATACOTAACAO, COT.VLRABERTURA,	COT.VLRFECHAMENTO,         '+
                 '        COT.VLRMAXIMA, COT.VLRMINIMA, COT.VLRMEDIA, COT.VOLNEGOCIADO, '+
                 '        COT.QTDELOTE                                                  '+
                 'FROM CM.COTACAOACAO COT                                               '+
                 'WHERE 	(COT.IDACAO         = '''+ IntToStr(IdAcao)+''')         AND '+
                 '      	(COT.IDBOLSAVALORES = '''+ IntToStr(IdBolsaValores)+''') AND '+
                 '       (COT.DATACOTAACAO <= TO_DATE( '''+DateToStr(DataRef)+''',''DD/MM/YYYY'')) '+
                 'ORDER BY COT.DATACOTAACAO DESC ';

// Pesquisa Cotecoes
  FazQuery(QryLocal,wSQLCotacoes);

// Caso Nao tenha cotacoes ou não tenha na data e não for aproximado Zera data ....
  If (QryLocal.IsEmpty) Or (QryLocal.FieldByName('DATACOTAACAO').AsDateTime > DataRef) Or
    ( (Aproximado = False) And (QryLocal.FieldByName('DATACOTAACAO').AsDateTime <> DataRef) )
  Then Begin
    Result.DataCotacao:=0;
  End Else Begin
// Guarda Cotacoes
    Result.VlrAbertura  :=QryLocal.FieldByName('VLRABERTURA').AsFloat;
    Result.VlrFechamento:=QryLocal.FieldByName('VLRFECHAMENTO').AsFloat;
    Result.VlrMaxima    :=QryLocal.FieldByName('VLRMAXIMA').AsFloat;
    Result.VlrMinima    :=QryLocal.FieldByName('VLRMINIMA').AsFloat;
    Result.VlrMedia     :=QryLocal.FieldByName('VLRMEDIA').AsFloat;
    Result.VolNegociado :=QryLocal.FieldByName('VOLNEGOCIADO').AsFloat;
    Result.DataCotacao  :=QryLocal.FieldByName('DATACOTAACAO').AsDateTime;
    Result.QtdLote      :=QryLocal.FieldByName('QTDELOTE').Asinteger;
  End;
// Libera Objetos Locais
  QryLocal.Free;
End;

// Busca os Saldos de um Investimento/Lote em uma data
// (Retorna um registro com os Saldos)
Function TOperacaoInvest.BuscaSaldosLote(IdInvestimento: Integer; IdLote :String;
                                         DataReferencia:TDateTime):TRecSaldos;
Var
  QryLocal  :TwwQuery;
  wSQLSaldos:String;
  wCotacao  :Double;
Begin
// Cria Objetos Locais
  QryLocal             := TwwQuery.Create(Application);
  QryLocal.DatabaseName:= 'BaseDados';
  wCotacao:=1;
// Busca Cotacao do Investimento na Data de Referencia
  wCotacao := OperComum.BuscaCotacaoInvest(IdInvestimento, DataReferencia, True);

// Inicia Resultados
  Result.SldQtdInvCart:=0;Result.SldVlrInvCart  :=0;Result.SldAtuarial  :=0;
  Result.SldRendimento:=0;Result.SldCarregamento:=0;Result.SldAquisicao :=0;
  Result.SldVariacao  :=0;Result.SldJuros       :=0;Result.SldPremio    :=0;
  Result.SldMercado   :=0;Result.DataSaldo    :=0;

// Monta Linha de Pesquisa
  wSQLSaldos  :=
    'SELECT 	H1.IDINVESTIMENTO,   H1.IDLOTE, H1.IDHISTCARTINV, H1.IDCARTEIRAINVEST,   '+
    '        H1.DATAMOVCARTINV,   H1.SALDOCOTASCARTINV, H1.SALDOVLRCARTINV,              '+
    '        H1.SALDOQTDEINVCART, H1.SALDOVLRINVCART,   H1.SALDOATU,   H1.SALDOCAR,      '+
    '        H1.SALDOAQUI, H1.SALDOREND, H1.SALDOVARIACAO, H1.SALDOJUROS, H1.SALDOPREMIO '+
    'FROM                                                 '+
    '     HISTCARTINV H1,                                 '+
    '     (SELECT MAX(H2.IDHISTCARTINV) AS IDHISTCARTINV  '+
    '      FROM HISTCARTINV H2 WHERE (H2.IDLOTE = '+QuotedStr(IdLote)+')) MAXIMO '+
    'WHERE                                                '+
    '     (IDINVESTIMENTO = '+QuotedStr(IntToStr(IdInvestimento))+') AND  '+
    '     (IDLOTE         = '+QuotedStr(IdLote)+')                   AND  '+
    '     (H1.IDHISTCARTINV = MAXIMO.IDHISTCARTINV)       '+
    'ORDER BY                                             '+
    '     H1.DATAMOVCARTINV DESC, H1.IDHISTCARTINV DESC   ';

// Pesquisa Saldos
  FazQuery(QryLocal,wSQLSaldos);

// Caso Nao tenha Saldo ou não tenha na data Zera data ....
  If (QryLocal.IsEmpty) Then Begin
    Result.DataSaldo :=0;
  End Else Begin
// Guarda Saldos
    Result.SldQtdInvCart  :=QryLocal.FieldByName('SALDOQTDEINVCART').AsFloat;
    Result.SldVlrInvCart  :=QryLocal.FieldByName('SALDOVLRINVCART').AsFloat;
    Result.SldAtuarial    :=QryLocal.FieldByName('SALDOATU').AsFloat;
    Result.SldAquisicao   :=QryLocal.FieldByName('SALDOAQUI').AsFloat;
    Result.SldRendimento  :=QryLocal.FieldByName('SALDOREND').AsFloat;
    Result.SldCarregamento:=QryLocal.FieldByName('SALDOCAR').AsFloat;
    Result.SldVariacao    :=QryLocal.FieldByName('SALDOVARIACAO').AsFloat;
    Result.SldJuros       :=QryLocal.FieldByName('SALDOJUROS').AsFloat;
    Result.SldPremio      :=QryLocal.FieldByName('SALDOPREMIO').AsFloat;
    Result.SldMercado     :=(QryLocal.FieldByName('SALDOVLRINVCART').AsFloat*wCotacao);
    Result.DataSaldo      :=QryLocal.FieldByName('DATAMOVCARTINV').AsDateTime;
  End;
// Libera Objetos Locais
  QryLocal.Free;
End;

//------------------------------------------------------------------------------
// Busca Todos os Saldos de um Investimento/Carteira em um Lote na Data Informada
Function TOperacaoInvest.BuscaTodosSaldosNova(
           IdCarteira, IdInvestimento, IdHistCartInv: Integer; IdLote: String;
           DataReferencia:TDateTime;
           Var fSdoQtdeInvCart, fSdoVlrInvCart, fSdoAtu, fSdoCar, fSdoAqui, fSdoRend,
           fSdoMercado: double): Boolean;
Var
  fCotacao : Double;
Begin
// Busca Cotacao do Investimento nesta Data
  fCotacao := OperComum.BuscaCotacaoInvest(IdInvestimento, DataReferencia, True);
// Busca o Saldo Anterior deste Investimento(C-I-L)
  With DtmOperacaoInvest.QryBuscaSaldoNova Do Begin
    Close;
    ParamByName('IDCARTEIRA').AsInteger     := IdCarteira;
    ParamByName('IDINVESTIMENTO').AsInteger := IdInvestimento;
    ParamByName('IDHISTORICO').AsInteger    := IdHistCartInv;
    ParamByName('DATAMOV').AsString         := QuotedStr(DateToStr(DataReferencia));
    ParamByName('IDLOTE').AsString          := QuotedStr(IdLote);
    Open;
  End;

// Gera Retorno caso tenha encontrado Registro
  If Not DtmOperacaoInvest.QryBuscaSaldoNova.IsEmpty Then Begin
    Result := True;
    fSdoQtdeInvCart  := dtmOperacaoInvest.QryBuscaSaldoNova.FieldByName('SALDOQTDEINVCART').asFloat;
    fSdoVlrInvCart   := dtmOperacaoInvest.QryBuscaSaldoNova.FieldByName('SALDOVLRINVCART').asFloat;
    fSdoAtu          := dtmOperacaoInvest.QryBuscaSaldoNova.FieldByName('SALDOATU').asFloat;
    fSdoAqui         := dtmOperacaoInvest.QryBuscaSaldoNova.FieldByName('SALDOAQUI').asFloat;
    fSdoRend         := dtmOperacaoInvest.QryBuscaSaldoNova.FieldByName('SALDOREND').asFloat;
    fSdoCar          := dtmOperacaoInvest.QryBuscaSaldoNova.FieldByName('SALDOCAR').asFloat;
    fSdoMercado      := fSdoQtdeInvCart * fCotacao;
  End Else Begin
    FazQuery(DtmOperacaoInvest.QryBuscaSaldoNova,
      'SELECT * FROM HISTCARTINV WHERE IDCARTEIRAINVEST =2 AND IDINVESTIMENTO = 1127 ORDER BY DATAMOVCARTINV, IDHISTCARTINV ');

ShowMessage(IntToStr(IdCarteira));

    Result := False;
  End;
End;

{ ** BUSCA SALDOS NOVA **
  FazQuery(DtmOperacaoInvest.QryBuscaSaldoNova,
  'SELECT  H1.IDHISTCARTINV,      H1.TIPMOVCARTINV,   H1.IDCARTEIRAINVEST, H1.DATAMOVCARTINV,  '+
  '        H1.SALDOCOTASCARTINV,  H1.SALDOVLRCARTINV, H1.SALDOQTDEINVCART, H1.SALDOVLRINVCART, '+
  '        H1.SALDOATU, H1.SALDOCAR, H1.SALDOAQUI, H1.SALDOREND '+
  'FROM    HISTCARTINV H1 '+
  'WHERE   (IDCARTEIRAINVEST = '+QuotedStr(IntToStr(IdCarteira))    +') AND '+
  '        (IDINVESTIMENTO   = '+QuotedStr(IntToStr(IdInvestimento))+') AND '+
  '        ((('+QuotedStr(IdLote)+' IS NOT NULL) AND (IDLOTE ='+QuotedStr(IdLote)+')) OR '+
  '         (('+QuotedStr(IdLote)+' IS NULL) AND (IDLOTE IS NULL))) AND '+
  '        (H1.IDHISTCARTINV   = '+
  '        (SELECT MAX(H3.IDHISTCARTINV) FROM   HISTCARTINV H3        '+
  '         WHERE (H3.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND     '+
  '               (H3.IDINVESTIMENTO   = H1.IDINVESTIMENTO)   AND     '+
  '              (((H1.IDLOTE IS NOT NULL) AND (H3.IDLOTE =H1.IDLOTE)) OR ((H1.IDLOTE IS NULL) AND (H3.IDLOTE IS NULL))) AND '+
  '              ( (H3.DATAMOVCARTINV < TO_DATE('+QuotedStr(DateToStr(DataReferencia))+',''DD/MM/YYYY'')) OR  '+
  '              ( (H3.DATAMOVCARTINV = TO_DATE('+QuotedStr(DateToStr(DataReferencia))+',''DD/MM/YYYY'')) AND '+
  '                (H3.IDHISTCARTINV    < '+QuotedStr(IntToStr(IdHistCartInv))+') ) ) ) ) AND                   '+
  '        (SALDOVLRINVCART IS NOT NULL)  '+
  'ORDER BY DATAMOVCARTINV DESC, IDHISTCARTINV DESC ');
}

// Função que Busca Saldos dos Investimentos de um Emissor numa data de referencia,
//     para uma Classe de Investimentos de RendaFixa, a vencer no período informado.
function TOperacaoInvest.BuscaSaldoAplicEmissor(iEmissor, iClasse: longint;
                              dDataRef, dIniVenc, dFimVenc : TDateTime;
                              var fSaldo: double): boolean;
var
  QryLocal  :TwwQuery;
  fAux      : double;
  sSql      : string;
begin
  Result := False;

  fSaldo := 0;
  QryLocal             := TwwQuery.Create(Application);
  QryLocal.DatabaseName:= 'BaseDados';

  sSQL := 'SELECT SUM(H1.SALDOVLRINVCART) AS TOTAL '+
          'FROM   CM.HISTCARTINV H1, CM.INVESTIMENTO IV, '+
          'CM.TITRENFIXA TT, CM.TIPOTITRENFIXA TP '+
          'WHERE  (H1.DATAMOVCARTINV = '+
          '     (SELECT MAX(H2.DATAMOVCARTINV) '+
          '      FROM   HISTCARTINV H2 '+
          '      WHERE (H2.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND '+
          '            (H2.IDINVESTIMENTO   = H1.IDINVESTIMENTO) AND '+
          '            (((H1.IDLOTE IS NOT NULL) AND (H2.IDLOTE =H1.IDLOTE)) OR ((H1.IDLOTE IS NULL) AND (H2.IDLOTE IS NULL))) AND '+
          '            (H2.DATAMOVCARTINV  <= TO_DATE( '''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')))) AND '+
          '       (H1.IDHISTCARTINV   = '+
          '       (SELECT MAX(H3.IDHISTCARTINV) '+
          '        FROM   HISTCARTINV H3 '+
          '        WHERE (H3.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND '+
          '              (H3.IDINVESTIMENTO   = H1.IDINVESTIMENTO) AND '+
          '              (((H1.IDLOTE IS NOT NULL) AND (H3.IDLOTE =H1.IDLOTE)) OR ((H1.IDLOTE IS NULL) AND (H3.IDLOTE IS NULL))) AND '+
          '              (H3.DATAMOVCARTINV   = H1.DATAMOVCARTINV)))  AND '+
          '       (H1.IDINVESTIMENTO   = IV.IDINVESTIMENTO) AND '+
          '       (IV.IDINVESTIMENTO   = TT.IDTITRENFIXA) AND '+
          '       (TT.CODTIPRENFIXA    = TP.CODTIPRENFIXA) AND '+
          '       (IV.IDEMISSOR = '+InttoStr(iEmissor)+') AND '+
          '       (TP.IDCLASSETIT = '+InttoStr(iClasse)+') AND '+
          '       (TT.DATAVENCTITRENFIX BETWEEN TO_DATE( '''+DateToStr(dIniVenc)+''',''DD/MM/YYYY'') AND TO_DATE( '''+DateToStr(dFimVenc)+''',''DD/MM/YYYY''))';

  if FazQuery(QryLocal, sSQL) then begin
    fSaldo  := QryLocal.FieldByName('TOTAL').AsFloat;
    Result := True;
  end;
  QryLocal.Free;
end;

// Função que Calcula Taxa Over para uma taxa num Período.
Function TOperacaoInvest.CalculaTaxaOverTaxaJuros(wValor:double;iTipoJuros:integer;dDataInicial, dDataFinal: TDateTime): double;
var
   iIntervalo, iIntUtil: integer;
   wTaxaPeriodo, wJurosDia : double;
begin
    Result       := 0;
    wJurosDia    := 0;
    wTaxaPeriodo := 0;

    wJurosDia := OperComum.CalculaJurosDia(wValor, iTipoJuros);

    iIntervalo := DiasUteis.IntervaloDias(dDataInicial, dDataFinal);
    iIntUtil   := DiasUteis.IntervaloDiasUteis(dDataInicial, dDataFinal, 0, 1, '',
                                                 True, False, False);

    wTaxaPeriodo := Power( ( 1 + wJurosDia), iIntervalo) - 1;

    Result := ( Power( (1 + wTaxaPeriodo), (1 / iIntUtil)) - 1) * 30;
    Result := Result * 100;

end;


//------------------------------------------------------------------------------
// Busca Saldos (Bloqueado ou Liberado) de um Carteira/Investimento/Lote/Custodiante
//      numa determinada Data para um determinado Motivo de Bloqueio
Function TOperacaoInvest.BuscaSaldosCustodia(IdCarteira, IdInvestimento, IdCustodia,
                              IdCustodiante, IdMotivoBloqueio: Integer;
                              IdLote: String; DataReferencia:TDateTime;
                              Var fSdoBloqueado, fSdoLiberado: Double): boolean;
Var
  fCotacao : Double;
Begin

  With DtmOperacaoInvest.QrySaldoCustodia Do Begin
    Close;
    ParamByName('IDCARTEIRA').AsInteger       := IdCarteira;
    ParamByName('IDINVESTIMENTO').AsInteger   := IdInvestimento;
    ParamByName('IDCUSTODIA').AsInteger       := IdCustodia;
    ParamByName('DATAMOV').AsDateTime         := DataReferencia;
    ParamByName('IDLOTE').AsString            := IdLote;
    ParamByName('IDCUSTODIANTE').AsInteger    := IdCustodiante;
    ParamByName('IDMOTIVOBLOQUEIO').AsInteger := IdMotivoBloqueio;
    Open;
  End;

// Gera Retorno caso tenha encontrado Registro
  If Not DtmOperacaoInvest.QrySaldoCustodia.IsEmpty Then Begin
    Result := True;
    if IdMotivoBloqueio = -1 then begin
       fSdoLiberado  := dtmOperacaoInvest.QrySaldoCustodia.FieldByName('SALDOLIBERADO').asFloat;
       fSdoBloqueado := 0;
    end else begin
       fSdoLiberado  := 0;
       fSdoBloqueado := dtmOperacaoInvest.QrySaldoCustodia.FieldByName('SALDOBLOQUEADO').asFloat;
    end;
  End Else Begin
    Result := False;
    fSdoLiberado  := 0;
    fSdoBloqueado := 0;
  End;
End;

// Função que Testa se existe Saldo no HistCustodia para uma Determinada Quantidade
Function TOperacaoInvest.TestaSaldosCustodia(IdCarteira, IdInvestimento, IdCustodia,
                              IdCustodiante, IdMotivoBloqueio: Integer;
                              IdLote, sTipoCustodia: String; DataReferencia:TDateTime;
                              fQuant: Double): boolean;

var
  TotLiberado, TotBloqueado, TotInutil: Double;
begin

  Result:= true;

  Case sTipoCustodia[1] Of

     'V', // Diminui Saldo Liberado  (Usado também em Acerto)
     'B', // Aumenta Saldo Bloqueado, diminui Saldo Liberado
     'D', // Aumenta Saldo Liberado, diminui Saldo Bloqueado
     'X'  // Diminui Saldo Bloqueado
     :
     begin
        TotLiberado  := 0;
        TotBloqueado := 0;

        if IdMotivoBloqueio = -1 then begin
           BuscaSaldosCustodia( IdCarteira, IdInvestimento, IdCustodia, IdCustodiante,
                             IdMotivoBloqueio, IdLote, DataReferencia,
                             TotInutil, TotLiberado);
           if fQuant > TotLiberado then Result := False;
        end else begin
           BuscaSaldosCustodia( IdCarteira, IdInvestimento, IdCustodia, IdCustodiante,
                             IdMotivoBloqueio, IdLote, DataReferencia,
                              TotBloqueado, TotInutil);
           if fQuant > TotBloqueado then Result := False;
        end;
     end;
  end;
end;

// Função que Insere Registro no HistCustodia
Function TOperacaoInvest.InsereCustodia(IdCarteira, IdInvestimento,
                              IdCustodiante, IdMotivoBloqueio, IdOperacao: Integer;
                              IdLote, sTipoCustodia: String; DataReferencia:TDateTime;
                              fQuant: Double): boolean;
var
   QryLocal1 :TwwQuery;
   sTipo1, sTipo2 : string;
   iTipoBloqueio1, iTipoBloqueio2 : integer;
begin
// Cria Objetos Locais
  QryLocal1              := TwwQuery.Create(Application);
  QryLocal1.DatabaseName := 'BaseDados';

  With dtmOperacaoInvest.QryHistCustodia Do Begin

     if (sTipoCustodia[1] <> 'B') and (sTipoCustodia[1] <> 'D') then begin

        Close;
        If Not(Prepared) Then Prepare;
        ParamByName('IDCUSTODIA').AsInteger       := LeUltRegistro(Nil, 'HISTCUSTODIA');

        if IdOperacao <> -1 then
           ParamByName('IdOperacaoInvest').AsInteger := IdOPeracao
        else
           ParamByName('IdOperacaoInvest').Clear;

        if Trim(IdLote) <> '' then
           ParamByName('IdLote').AsString            := IdLote
        else
           ParamByName('IdLote').Clear;

        ParamByName('IdCarteiraInvest').AsInteger := IdCarteira;
        ParamByName('IdInvestimento').AsInteger   := IdInvestimento;
        ParamByName('IDCUSTODIANTE').AsInteger    := IdCustodiante;
        ParamByName('DATAMOVCUSTOD').AsDateTime   := DataReferencia;
        ParamByName('FlgCalcSaldo').AsString      := '1';
        ParamByName('QtdeMovCustod').AsFloat      := fQuant;
        ParamByName('SaldoLiberado').AsFloat      := 0;
        ParamByName('SaldoBloqueado').AsFloat     := 0;
        ParamByName('TipoCustodia').AsString      := sTipoCustodia;
        ParamByName('IdMotivoBloqueio').AsInteger := IdMotivoBloqueio;

        ExecSQL;

     end else begin

        if sTipoCustodia[1] = 'B' then begin // Bloqueia - Diminui Saldo Liberado, Aumenta Saldo Bloqueado
           sTipo1         := 'V';
           iTipoBloqueio1 := -1;
           sTipo2         := 'Y';
           iTipoBloqueio2 := IdMotivoBloqueio;
        end else begin // Desbloqueia - Diminui Saldo Bloqueado, Aumenta Saldo Liberado
           sTipo1         := 'Z';
           iTipoBloqueio1 := IdMotivoBloqueio;
           sTipo2         := 'C';
           iTipoBloqueio2 := -1;
        end;

// Diminui Saldo Origem
        Close;
        If Not(Prepared) Then Prepare;
        ParamByName('IDCUSTODIA').AsInteger       := LeUltRegistro(Nil, 'HISTCUSTODIA');
        if IdOperacao <> -1 then
           ParamByName('IdOperacaoInvest').AsInteger := IdOperacao
        else
           ParamByName('IdOperacaoInvest').Clear;

        ParamByName('IdCarteiraInvest').AsInteger := IdCarteira;
        ParamByName('IdInvestimento').AsInteger   := IdInvestimento;
        ParamByName('IDCUSTODIANTE').AsInteger    := IdCustodiante;
        ParamByName('DATAMOVCUSTOD').AsDateTime   := DataReferencia;
        ParamByName('FlgCalcSaldo').AsString      := '1';
        ParamByName('IdLote').AsString            := IdLote;
        ParamByName('QtdeMovCustod').AsFloat      := fQuant;
        ParamByName('SaldoLiberado').AsFloat      := 0;
        ParamByName('SaldoBloqueado').AsFloat     := 0;
        ParamByName('TipoCustodia').AsString      := sTipo1;
        ParamByName('IdMotivoBloqueio').AsInteger := iTipoBloqueio1;

        ExecSQL;

// Aumenta Saldo Destino
        Close;
        If Not(Prepared) Then Prepare;
        ParamByName('IDCUSTODIA').AsInteger       := LeUltRegistro(Nil, 'HISTCUSTODIA');
        if IdOperacao <> -1 then
           ParamByName('IdOperacaoInvest').AsInteger := IdOperacao
        else
           ParamByName('IdOperacaoInvest').Clear;

        ParamByName('IdCarteiraInvest').AsInteger := IdCarteira;
        ParamByName('IdInvestimento').AsInteger   := IdInvestimento;
        ParamByName('IDCUSTODIANTE').AsInteger    := IdCustodiante;
        ParamByName('DATAMOVCUSTOD').AsDateTime   := DataReferencia;
        ParamByName('FlgCalcSaldo').AsString      := '1';
        ParamByName('IdLote').AsString            := IdLote;
        ParamByName('QtdeMovCustod').AsFloat      := fQuant;
        ParamByName('SaldoLiberado').AsFloat      := 0;
        ParamByName('SaldoBloqueado').AsFloat     := 0;
        ParamByName('TipoCustodia').AsString      := sTipo2;
        ParamByName('IdMotivoBloqueio').AsInteger := iTipoBloqueio2;

        ExecSQL;
     end;
  end;

  qryLocal1.Close;
end;

//------------------------------------------------------------------------------
// Retorna Parâmetros de Investimento em uma variável do tipo TRecParamInvest

Function TOperacaoInvest.RetParamInvest(Var RegParInv : TRecParamInvest; DatabaseTrabalho : String) : Boolean;
Var
  qryTmp : TwwQuery;
begin
  Result := False;
  qryTmp := TwwQuery.Create(Application);
  Try
    qryTmp.DatabaseName := DatabaseTrabalho;

    qryTmp.Close;
    qryTmp.SQL.Clear;
    qryTmp.SQL.Add('SELECT ');
    qryTmp.SQL.Add('  IDPARAMINVEST,');
    qryTmp.SQL.Add('  MASCSETOREMISSOR,');
    qryTmp.SQL.Add('  MOECODIGO,');
    qryTmp.SQL.Add('  MASCCLASSIFINV,');
    qryTmp.SQL.Add('  VLRDIVERG,');
    qryTmp.SQL.Add('  VLRCOTAINICART,');
    qryTmp.SQL.Add('  DATAULTFECH,');
    qryTmp.SQL.Add('  FLGORDMOVINV,');
    qryTmp.SQL.Add('  PERCPUORDMOVINV,');
    qryTmp.SQL.Add('  PERCIMPRENDA,');
    qryTmp.SQL.Add('  MOEDAATU,');
    qryTmp.SQL.Add('  PERCPARTICEMPR,');
    qryTmp.SQL.Add('  TRGDTINCLUSAO,');
    qryTmp.SQL.Add('  TRGUSERINCLUSAO,');
    qryTmp.SQL.Add('  PERCPARTICRECUR,');
    qryTmp.SQL.Add('  IDPARAMPATRLIQ,');
    qryTmp.SQL.Add('  TIPOMENU,');
    qryTmp.SQL.Add('  DATAULTFECHRF,');
    qryTmp.SQL.Add('  IDTIPODESPIRAPU,');
    qryTmp.SQL.Add('  IDTIPODESPINVEST,');
    qryTmp.SQL.Add('  MOEDAGER,');
    qryTmp.SQL.Add('  FLGPROVISIONAIRRF,');
    qryTmp.SQL.Add('  FLGPROVISIONAIRRV,');
    qryTmp.SQL.Add('  PUCDB,');
    qryTmp.SQL.Add('  DATAMOVCDBLIB,');
    qryTmp.SQL.Add('  IDTIPODESPIRPROV,');
    qryTmp.SQL.Add('  MOEDAATULIT,');
    qryTmp.SQL.Add('  IDPROGRAMA,');
    qryTmp.SQL.Add('  IDTIPOCLIENTECOR,');
    qryTmp.SQL.Add('  IDTIPOOPERDIRINC,');
    qryTmp.SQL.Add('  IDTIPOOPERDIRCIS,');
    qryTmp.SQL.Add('  IDTIPOOPERDIRDES,');
    qryTmp.SQL.Add('  IDTIPOOPERDIRGRU,');
    qryTmp.SQL.Add('  IDTIPOOPERDIRPER,');
    qryTmp.SQL.Add('  IDTIPOOPERDIRBON,');
    qryTmp.SQL.Add('  IDTIPOOPERDIRDIV,');
    qryTmp.SQL.Add('  IDTIPOOPERDIRSUB,');
    qryTmp.SQL.Add('  IDTIPOINVEST,');
    qryTmp.SQL.Add('  IDTIPOOPERDIRJUR,');
    qryTmp.SQL.Add('  IDTIPOCLIENTEEMI,');
    qryTmp.SQL.Add('  IDTIPOCLIENTECUS,');
    qryTmp.SQL.Add('  IDTIPOCONTRRF,');
    qryTmp.SQL.Add('  IDTIPOINVESTIDOR,');
    qryTmp.SQL.Add('  IDBVSP,');
    qryTmp.SQL.Add('  IDMERCADO,');
    qryTmp.SQL.Add('  IDTIPOOPERLIQPEND');
    qryTmp.SQL.Add('FROM PARAMINVEST');
    qryTmp.Open;

    RegParInv.MASCSETOREMISSOR  := qryTmp.FieldByName('MASCSETOREMISSOR').AsString;
    RegParInv.MOECODIGO         := qryTmp.FieldByName('MOECODIGO').AsInteger;
    RegParInv.MASCCLASSIFINV    := qryTmp.FieldByName('MASCCLASSIFINV').AsString;
    RegParInv.VLRDIVERG         := qryTmp.FieldByName('VLRDIVERG').AsFloat;
    RegParInv.VLRCOTAINICART    := qryTmp.FieldByName('VLRCOTAINICART').AsFloat;
    RegParInv.DATAULTFECH       := qryTmp.FieldByName('DATAULTFECH').AsDateTime;
    RegParInv.FLGORDMOVINV      := qryTmp.FieldByName('FLGORDMOVINV').AsString;
    RegParInv.PERCPUORDMOVINV   := qryTmp.FieldByName('PERCPUORDMOVINV').AsFloat;
    RegParInv.PERCIMPRENDA      := qryTmp.FieldByName('PERCIMPRENDA').AsFloat;
    RegParInv.MOEDAATU          := qryTmp.FieldByName('MOEDAATU').AsInteger;
    RegParInv.PERCPARTICEMPR    := qryTmp.FieldByName('PERCPARTICEMPR').AsFloat;
    RegParInv.TRGDTINCLUSAO     := qryTmp.FieldByName('TRGDTINCLUSAO').AsDateTime;
    RegParInv.TRGUSERINCLUSAO   := qryTmp.FieldByName('TRGUSERINCLUSAO').AsString;
    RegParInv.PERCPARTICRECUR   := qryTmp.FieldByName('PERCPARTICRECUR').AsFloat;
    RegParInv.IDPARAMPATRLIQ    := qryTmp.FieldByName('IDPARAMPATRLIQ').AsInteger;
    RegParInv.TIPOMENU          := qryTmp.FieldByName('TIPOMENU').AsString;
    RegParInv.DATAULTFECHRF     := qryTmp.FieldByName('DATAULTFECHRF').AsDateTime;
    RegParInv.IDTIPODESPIRAPU   := qryTmp.FieldByName('IDTIPODESPIRAPU').AsInteger;
    RegParInv.IDTIPODESPINVEST  := qryTmp.FieldByName('IDTIPODESPINVEST').AsInteger;
    RegParInv.MOEDAGER          := qryTmp.FieldByName('MOEDAGER').AsInteger;
    RegParInv.FLGPROVISIONAIRRF := qryTmp.FieldByName('FLGPROVISIONAIRRF').AsString;
    RegParInv.FLGPROVISIONAIRRV := qryTmp.FieldByName('FLGPROVISIONAIRRV').AsString;
    RegParInv.PUCDB             := qryTmp.FieldByName('PUCDB').AsFloat;
    RegParInv.DATAMOVCDBLIB     := qryTmp.FieldByName('DATAMOVCDBLIB').AsDateTime;
    RegParInv.IDTIPODESPIRPROV  := qryTmp.FieldByName('IDTIPODESPIRPROV').AsInteger;
    RegParInv.MOEDAATULIT       := qryTmp.FieldByName('MOEDAATULIT').AsInteger;
    RegParInv.IDPROGRAMA        := qryTmp.FieldByName('IDPROGRAMA').AsInteger;
    RegParInv.IDTIPOCLIENTECOR  := qryTmp.FieldByName('IDTIPOCLIENTECOR').AsInteger;
    RegParInv.IDTIPOOPERDIRINC  := qryTmp.FieldByName('IDTIPOOPERDIRINC').AsInteger;
    RegParInv.IDTIPOOPERDIRCIS  := qryTmp.FieldByName('IDTIPOOPERDIRCIS').AsInteger;
    RegParInv.IDTIPOOPERDIRDES  := qryTmp.FieldByName('IDTIPOOPERDIRDES').AsInteger;
    RegParInv.IDTIPOOPERDIRGRU  := qryTmp.FieldByName('IDTIPOOPERDIRGRU').AsInteger;
    RegParInv.IDTIPOOPERDIRPER  := qryTmp.FieldByName('IDTIPOOPERDIRPER').AsInteger;
    RegParInv.IDTIPOOPERDIRBON  := qryTmp.FieldByName('IDTIPOOPERDIRBON').AsInteger;
    RegParInv.IDTIPOOPERDIRDIV  := qryTmp.FieldByName('IDTIPOOPERDIRDIV').AsInteger;
    RegParInv.IDTIPOOPERDIRSUB  := qryTmp.FieldByName('IDTIPOOPERDIRSUB').AsInteger;
    RegParInv.IDTIPOINVEST      := qryTmp.FieldByName('IDTIPOINVEST').AsInteger;
    RegParInv.IDTIPOOPERDIRJUR  := qryTmp.FieldByName('IDTIPOOPERDIRJUR').AsInteger;
    RegParInv.IDTIPOCLIENTEEMI  := qryTmp.FieldByName('IDTIPOCLIENTEEMI').AsInteger;
    RegParInv.IDTIPOCLIENTECUS  := qryTmp.FieldByName('IDTIPOCLIENTECUS').AsInteger;
    RegParInv.IDTIPOCONTRRF     := qryTmp.FieldByName('IDTIPOCONTRRF').AsInteger;
    RegParInv.IDBVSP            := qryTmp.FieldByName('IDBVSP').AsInteger;
    RegParInv.IDTIPOINVESTIDOR  := qryTmp.FieldByName('IDTIPOINVESTIDOR').AsInteger;
    RegParInv.IDMERCADO         := qryTmp.FieldByName('IDMERCADO').AsInteger;
    RegParInv.IDTIPOOPERLIQPEND := qryTmp.FieldByName('IDTIPOOPERLIQPEND').AsInteger;
    Result := true;
    qryTmp.Close;
  Finally
    qryTmp.Free;
  End;
end;

Function TOperacaoInvest.SimNao(S : String) : Boolean;
begin
  Result := S[1] in ['1', 'S'];
end;

Function TOperacaoInvest.RetParamOperDireito(OperacaoDireito : Integer; Var RegTO : TRegTipoOperacao; NomeDatabase : String) : Boolean;
Var
  qryTmp : TwwQuery;
begin
  Result := False;
  //FillChar(RegTO, SizeOf(TRegTipoOperacao), #00);
  qryTmp := TwwQuery.Create(Application);
  Try
    qryTmp.DatabaseName := NomeDatabase;
    qryTmp.SQL.Add('SELECT TIO.FLGGERACONTAB,');
    qryTmp.SQL.Add('       TIO.FLGGERACAPCAR,');
    qryTmp.SQL.Add('       DECODE(TIO.FLGGERACAF, NULL, '#39'N'#39', TIO.FLGGERACAF) AS FLGGERACAF,');
    qryTmp.SQL.Add('       DECODE(TIO.FLGTRANSF, NULL, '#39'N'#39', TIO.FLGTRANSF) AS FLGTRANSF,');
    qryTmp.SQL.Add('       DECODE(TIO.FLGCORRET, NULL, '#39'N'#39', TIO.FLGCORRET) AS FLGCORRET,');
    qryTmp.SQL.Add('       DECODE(TIO.FLGORDMOVINV, NULL, '#39'N'#39', TIO.FLGORDMOVINV) AS FLGORDMOVINV,');
    qryTmp.SQL.Add('       DECODE(TIO.FLGOPDIREITO, NULL, '#39'N'#39', TIO.FLGOPDIREITO) AS FLGOPDIREITO,');
    qryTmp.SQL.Add('       DECODE(TIO.FLGAGE, NULL, '#39'N'#39', TIO.FLGAGE) AS FLGAGE,');
    qryTmp.SQL.Add('       DECODE(TIO.FLGDATAEX, NULL, '#39'N'#39', TIO.FLGDATAEX) AS FLGDATAEX,');
    qryTmp.SQL.Add('       DECODE(TIO.FLGDATACOM, NULL, '#39'N'#39', TIO.FLGDATACOM) AS FLGDATACOM,');
    qryTmp.SQL.Add('       DECODE(TIO.FLGINVORIGEM, NULL, '#39'N'#39', TIO.FLGINVORIGEM) AS FLGINVORIGEM,');
    qryTmp.SQL.Add('       DECODE(TIO.FLGPERC, NULL, '#39'N'#39', TIO.FLGPERC) AS FLGPERC,');
    qryTmp.SQL.Add('       DECODE(TIO.FLGPARIDADE, NULL, '#39'N'#39', TIO.FLGPARIDADE) AS FLGPARIDADE,');
    qryTmp.SQL.Add('       DECODE(TIO.FLGPRZBOLSA, NULL, '#39'N'#39', TIO.FLGPRZBOLSA) AS FLGPRZBOLSA,');
    qryTmp.SQL.Add('       DECODE(TIO.FLGPRZEMP, NULL, '#39'N'#39', TIO.FLGPRZEMP) AS FLGPRZEMP,');
    qryTmp.SQL.Add('       DECODE(TIO.FLGATADEC, NULL, '#39'N'#39', TIO.FLGATADEC) AS FLGATADEC,');
    qryTmp.SQL.Add('       DECODE(TIO.FLGFORMAPAGREC, NULL, '#39'N'#39', TIO.FLGFORMAPAGREC) AS FLGFORMAPAGREC,');
    qryTmp.SQL.Add('       DECODE(TIO.FLGDIVACAO, NULL, '#39'N'#39', TIO.FLGDIVACAO) AS FLGDIVACAO,');
    qryTmp.SQL.Add('       DECODE(TIO.FLGINIPAG, NULL, '#39'N'#39', TIO.FLGINIPAG) AS FLGINIPAG,');
    qryTmp.SQL.Add('       DECODE(TIO.FLGJUROS, NULL, '#39'N'#39', TIO.FLGJUROS) AS FLGJUROS,');
    qryTmp.SQL.Add('       DECODE(TIO.TIPSALDOCARTORIG, NULL, '#39'N'#39', TIO.TIPSALDOCARTORIG) AS TIPSALDOCARTORIG,');
    qryTmp.SQL.Add('       DECODE(TIO.TIPSALDOCARTDEST, NULL, '#39'N'#39', TIO.TIPSALDOCARTDEST) AS TIPSALDOCARTDEST,');
    qryTmp.SQL.Add('       TIO.FLGTRATAIR,');
    qryTmp.SQL.Add('       TIO.IDMERCADO,');
    qryTmp.SQL.Add('       OD.PERCENTUAL,');
    qryTmp.SQL.Add('       OD.DIVPORACAO,');
    qryTmp.SQL.Add('       OD.PARIDADE');
    qryTmp.SQL.Add('FROM TIPOOPERACAO TIO, OPERACAODIREITO OD');
    qryTmp.SQL.Add('WHERE');
    qryTmp.SQL.Add('  TIO.IDTIPOOPERACAO = OD.IDTIPOOPERACAO AND');
    qryTmp.SQL.Add('  TIO.IDTIPOINVEST   = 2 AND');
    qryTmp.SQL.Add('  OD.IDOPERACAODIREITO = :P_IDOPERACAODIREITO');
    qryTmp.ParamByName('P_IDOPERACAODIREITO').AsInteger := OperacaoDireito;
    qryTmp.Open;

    If Not qryTmp.IsEmpty Then
      Begin
        RegTo.FLGGERACONTAB := SimNao(qryTmp.FieldByName('FLGGERACONTAB').AsString);
        RegTo.FLGGERACAPCAR := SimNao(qryTmp.FieldByName('FLGGERACAPCAR').AsString);
        RegTo.FLGGERACAF := SimNao(qryTmp.FieldByName('FLGGERACAF').AsString);
        RegTo.FLGTRANSF := SimNao(qryTmp.FieldByName('FLGTRANSF').AsString);
        RegTo.FLGCORRET := SimNao(qryTmp.FieldByName('FLGCORRET').AsString);
        RegTo.FLGORDMOVINV := SimNao(qryTmp.FieldByName('FLGORDMOVINV').AsString);
        RegTo.FLGOPDIREITO := SimNao(qryTmp.FieldByName('FLGOPDIREITO').AsString);
        RegTo.FLGAGE := SimNao(qryTmp.FieldByName('FLGAGE').AsString);
        RegTo.FLGDATAEX := SimNao(qryTmp.FieldByName('FLGDATAEX').AsString);
        RegTo.FLGDATACOM := SimNao(qryTmp.FieldByName('FLGDATACOM').AsString);
        RegTo.FLGINVORIGEM := SimNao(qryTmp.FieldByName('FLGINVORIGEM').AsString);
        RegTo.FLGPERC := SimNao(qryTmp.FieldByName('FLGPERC').AsString);
        RegTo.FLGPARIDADE := SimNao(qryTmp.FieldByName('FLGPARIDADE').AsString);
        RegTo.FLGPRZBOLSA := SimNao(qryTmp.FieldByName('FLGPRZBOLSA').AsString);
        RegTo.FLGPRZEMP := SimNao(qryTmp.FieldByName('FLGPRZEMP').AsString);
        RegTo.FLGATADEC := SimNao(qryTmp.FieldByName('FLGATADEC').AsString);
        RegTo.FLGFORMAPAGREC := SimNao(qryTmp.FieldByName('FLGFORMAPAGREC').AsString);
        RegTo.FLGDIVACAO := SimNao(qryTmp.FieldByName('FLGDIVACAO').AsString);
        RegTo.FLGINIPAG := SimNao(qryTmp.FieldByName('FLGINIPAG').AsString);
        RegTo.FLGJUROS := SimNao(qryTmp.FieldByName('FLGJUROS').AsString);
        RegTo.TIPSALDOCARTORIG := SimNao(qryTmp.FieldByName('TIPSALDOCARTORIG').AsString);
        RegTo.TIPSALDOCARTDEST := SimNao(qryTmp.FieldByName('TIPSALDOCARTDEST').AsString);
        RegTo.FLGTRATAIR := qryTmp.FieldByName('FLGTRATAIR').AsString;
        RegTo.PERCENTUAL := qryTmp.FieldByName('PERCENTUAL').AsFloat;
        RegTo.DIVPORACAO := qryTmp.FieldByName('DIVPORACAO').AsFloat;
        RegTo.PARIDADE   := qryTmp.FieldByName('PARIDADE').AsFloat;
        RegTo.IDMERCADO  := qryTmp.FieldByName('IDMERCADO').AsInteger;
        Result := True;
      End;
    qryTmp.Close;
  Finally
    qryTmp.Free;
  End;
end;

// Função que Calcula Valor do Resgate do Titulo
// Tipo = 1 (Atualiza para Data Informada), Tipo = 2 (Atualiza para Data de Vencimento)
// Se Tipo = 1 e não informou Data, assume data corrente.
Function TOperacaoInvest.CalculaVlrResgate(IdInvestimento, Tipo, IndexRenFix,TamPerJuros: Integer;
                                           Lote, EfetNomi, FlgPU, FlgInterpola, FlgProRata: String;
                                           dDataAtu, DataBaseIndex, DataIniJur, DataVencTitulo:TDateTime;
                                           VlrCompraTit, JurosDia, PercIndex: Double): Double;
Var
   QryLocal  :TwwQuery;
   wCotacao1, wCotacao2, wParam1, wParam2 : Double;
   iIntervalo: integer;
Begin
    wCotacao1:=0;
    wCotacao2:=0;
    wParam1  :=0;
    wParam2  :=0;
    Result   :=0;
    // Cria Objetos Locais
    QryLocal := TwwQuery.Create(Application);
    QryLocal.DatabaseName:= 'BaseDados';
    // Define data de Processo
    if Tipo = 1 then
       if DateToStr(dDataAtu) = '' then
          dDataAtu := Date
    else
       dDataAtu := DataVencTitulo;
    // Se a Atualização é feita por PU
    if FlgPU = '1' then
    begin
       // Busca Cotacao do Investimento
       WCotacao1 := OperComum.BuscaCotacaoInvest(IdInvestimento, dDataAtu, True);
       Result := WCotacao1;
    end
    else
    begin
       // Busca Nova Cotação por Indice/Juros
       Result := VlrCompraTit;
      if IndexRenFix <> 0 then begin
         // Efetua Correção pelo Indice
         wCotacao1 := OperComum.LeMoeda(IndexRenFix, DataBaseIndex,
                                             FlgProRata, FlgInterpola);
         wCotacao2 := OperComum.LeMoeda(IndexRenFix,
                                             dDataAtu,
                                             FlgProRata, FlgInterpola);
         If wCotacao1 <> 0 Then
            if PercIndex = 0 then
               Result := ((Result*wCotacao2)/wCotacao1)
            else
               Result := Result * (((wCotacao2/wCotacao1 - 1) * QryLocal.FieldByName('PERCINDEX').asFloat) + 1);
      end;
      If JurosDia <> 0 Then
      Begin
         // Efetua Correção pelos Juros
         if TamPerJuros = 252 then // DU
//            iIntervalo   := DiasUteisInvest.IntervaloDiasUteis( DataIniJur, dDataAtu, -1, 1, '', True, False, False)
         else // DC
            iIntervalo := DiasUteis.IntervaloDias(DataIniJur, dDataAtu);
         If EfetNomi = 'E' Then
            Result := Result *
                      Power((1 + JurosDia / 100), iIntervalo)
         Else
            Result := Result *(1 + JurosDia)*iIntervalo;
      End;
    End;
    // Libera Objetos Locais
    QryLocal.Free;
End;


end.
