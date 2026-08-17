unit UOperComum;

// -------------------------------------------------------------------------------------------------
//
//       Death is lighter than a feather;
//       Duty, heavier than a mountain...
//
//                               Rand Al'Thor
//
//	-------------------------------------------------------------------------------------------------
//	-------------------------------------------------------------------------------------------------
//       ATENÇÃO: UOperacaoInvest NECESSITA do DataModule dOperComum/dtmOperComum
//	-------------------------------------------------------------------------------------------------
//	-------------------------------------------------------------------------------------------------
//
//	   UOperComum
//       Unit que contém as funções (que ficavam na uOperacaoInvest) que serão
//       de uso comum entre Investimentos e Imobiliário
//
//	   Modificações	:
//
//
// -------------------------------------------------------------------------------------------------

interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, USistema, Wwquery, OleCtrls, vcf1, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, TB97Tlbr, TB97, ExtCtrls, dOperComum, DBTables;

  Function  ExecutaQuery         (Qry:TQuery; Const Str:String) :Boolean;
  Function  FazQuery             (Var Qry:TwwQuery; Str:String) :Boolean;

type

   TRecBuscaTipoOperVarRV = Record
                         TIPOOPERACAO : Integer;
                         PLANO        : Integer;
                         IDPLANOPREV  : Integer;
                         IDPATRO      : Integer;
                         PEREXERCICIO : Integer;
                         PERNUMERO    : Integer;
                         PLNDATDIA    : TDateTime;
                         IDPESSOA     : Integer;
                         PLACONTADEB  : String;
                         PLACONTACRED : String;
                       end;

   TOperComum = Class(TObject)

   private

// =================================================================================================
//    Uso interno (por outras funções)
// =================================================================================================

      procedure MensagemErroContab(iResultado: integer);
      procedure MensagemErroPeriodo(iErroPeriodo: integer);

      // Função que testa a consistência dos parâmetros passados para AlimentaCarteira
      function VerificaParametros(var iInvestimento, iTipoInvest, iOperacao, iTipoOperacao,
      iCarteira, iDespesaOperacao, iDespesaCarteira: integer; fValorPrimeiraCota: currency;
      sNaturezaMovimento: string): boolean;

      procedure MostraErroAtualiza(sCarteira, sInvestimento, sTipoMov, sLancamento, sDataLanc, sMsg: string);
      procedure MostraErroAtualizaInvest(sCarteira, sInvestimento, sLote, sData, sMsg: string);

   public

// =================================================================================================
//    Integração Financeira / Contábil
// =================================================================================================

      // Retorna a máscara do Plano de Contas
      function GetMascaraPlano(iPlano: integer): string;

      // Gera um nº de documento único
      function GeraNoDocumento(c: char): extended;

      // Abre a qryPadrLanc de acordo com os parâmetros passados
      procedure AbrePadrLanc(iEmpresaProp, iTipoInvest, iTipoOperacao, iTipoDespesa, iInvestimento,
      iCarteira: integer; sTipoTitulo, sTipoMov: string);

      // Função que busca na tabela PadrLancContInv o conjunto de parâmetros de integração mais
      // apropriado, dadas as condições passadas. Mesma função p/ Operação quanto p/ Despesa de Operação
      function BuscaPadrLanc(iEmpresaProp, iTipoInvest, iTipoOperacao, iTipoDespesa, iInvestimento,
      iCarteira: integer; fValor: double; sTipoTitulo, sTipoMov: string; var iPlano, iSubContaDeb,
      iSubContaCred, iUnidNegoc: integer; var sContaDeb, sContaCred, sCentroCustoDeb, sCentroCustoCred,
      sCentroRespon, sTipoRecDes, sTipoPer, sHistoricoOper, sRecPagNao: string): integer;

      // Função que efetua o par de lançamentos Contábeis e o lançamento de CAPCAR (se aplicáveis)
      // associados a uma Operação de Investimento (de acordo com a tabela PadrLancContInv)
      function LancaOperInvest(iEmpresaProp, iModuloOrigem, iTipoInvest, iTipoOperacao, iOperacao,
      iForCli, iCarteira, iMoeda, iInvestimento: integer; sTipoTitulo, sComplemento,
      sTipoParcela: string; fVlrOMOper, fVlrOper: currency; dDataOper, dDataVencOper: TDateTime;
      bMostraMsg, bParcelado: boolean; var iPlano, iPlanilhaOper, iDocumentoOper, iFatura: integer;
      var fNoDoc: extended; var sHistoricoOper, sMensErro: string): integer;

      // Função que efetua todos os lançamentos Contábeis e de CAPCAR associados a uma
      // Despesa de Investimento (de acordo com a tabela PadrLancContInv)
      function LancaDespInvest(iEmpresaProp, iModuloOrigem, iTipoInvest, iTipoOperacao, iTipoDespesa,
      iOperacao, iDespesa, iForCli, iCarteira, iMoeda, iInvestimento: integer; sTipoTitulo: string;
      fVlrOMDesp, fVlrDesp: currency; dDataDespesa, dDataVencDesp: TDateTime; bMostraMsg: boolean;
      var iPlano, iPlanilhaDesp, iDocumentoDesp: integer; var sHistoricoDesp, sMensErro: string): integer;

      // Função que efetua o par de lançamentos Contábeis de Atualização de Cotações de um Título
      // (de acordo com a tabela PadrLancContInv)
      function LancaAtualizacao(iEmpresaProp, iModuloOrigem, iTipoInvest, iCarteira: integer;
      sTipoTitulo: string; fVlrAtu: currency; dDataAtu: TDateTime; bMostraMsg: boolean;
      var iPlanilhaAtu: integer; var sHistoricoAtu, sMensErro: string): shortint;


      // Função que efetua o par de lançamentos Contábeis e o lançamento de CAPCAR (se aplicáveis)
      // associados a uma Operação de Investimento (de acordo com a tabela PadrLancContInv)
      function LancaOperRFRV(iEmpresaProp, iModuloOrigem, iTipoInvest, iInvestimento,
      iTipoOperacao, iOperacao, iForCli, iCarteira, iMoeda: integer; sTipoTitulo, sLote, sHistCapCar, sRecPagBol: string;
      var sTipoRecDesBol: string; var bCriaLancto: boolean; fTotalLiquido, fVlrOper: currency; dDataOper, dDataVenc: TDateTime;
      var iPlano, iPlanilhaOper, iDocumentoOper : integer; var sMensErro: string): shortint;


      // Função que efetua cada par de lançamentos contábeis
      function LancamentoContabil(iEmpresaProp, iModuloOrigem, iPlano, iSubContaD, iSubContaC,
      iUnidNegoc, iForCli, iPlanoPrev, iPatro: integer; sContaD, sContaC, sCentroCustoD, sCentroCustoC, sHistorico, sTipoPer,
      sRecPag: string; dDataLanc: TDateTime; fValorLanc: currency; bMostraMsg: boolean; var iPlanilha: integer;
      var sMensContab: string): boolean;

      // Função que efetua o lançamento de Contas a Pagar / Receber
      function LancamentoCAPCAR(iEmpresaProp, iModuloOrigem, iPlano, iPlanilha, iSubConta,
      iCodTipDoc, iUnidNegoc, iForCli, iMoeda: integer; fVlrOM, fVlrLanc: currency; sCentroRespon,
      sTipoRecDes, sConta, sCentroCusto, sDebCre, sComplementoDoc, sTipoParcelamento: string; dDataLanc,
      dDataVenc: TDateTime; cRecPagNao: char; bParcelar, bMostraMsg: boolean; var iDocumento,
      iNumFatura: integer; fNoDocumento: extended): boolean;

// =================================================================================================
//    Movimentação / Atualização
// =================================================================================================

      // Função que alimenta Carteira
      function AlimentaCarteira(iEmpresaProp, iModuloOrigem, iInvestimento, iTipoInvest, iOperacao,
      iLancImovel, iTipoOperacao, iCarteira, iDespesaOperacao, iDespesaCarteira, iPlanilha, iDocumento,
      iPlano: integer; dDataOper: TDateTime; fValorOperacao :currency; fQtdInvestOperacao :Double;fValorPrimeiraCota,
      fValorVariacao, fValorJuros, fValorIRProv, fValorIRApu, fValorIOFProv, fValorIOFApu,
      fValorAgio: currency; sNaturMov, sNaturOper, sLote, sHistorico, sTipoMov, sFlgCustodia,
      sRecPag: string; bMostraMsg: boolean): int64;

      // Função que Atualiza Saldos de Carteira/Investimento/Lote no HistCartInv
      function AtualizaSaldos(fValorPrimeiraCota: currency; dDataFinal: TDateTime) : boolean;

      // Marca registros quando excluindo da HistCartInv
      Procedure MarcaFlgHistCartInv(TipoMovCart:String; IdLancamento:Integer);

      function  ProcEstorna(iDocumento, iPlanilha, iPlano : longint; dDataEstorno: TDateTime;
                            bMostraMsg : boolean) : Boolean;

      function  ProcExclui(iDocumento, iPlanilha, iPlano : longint;
                           dDataExclusao: TDateTime; bMostraMsg : boolean) : Boolean;

      function EstornaOper(iOperacao, iEmpresaProp, iModuloOrigem: integer;
      fValorPrimeiraCota: currency; dDataEstorno: TDateTime; bMostraMsg: boolean): boolean;

      // Função que Retorna Valor a Contabilizar
      function BuscaValorAContabilizar(iIdHistcartinv, iIdTipoDespInvest,iTipoInvest: longint; bOperVenda: boolean;
                                       var fValorAContabilizar: Double): boolean;

// =================================================================================================
//    Saldos
// =================================================================================================

      // necessária p/ AlimentaCarteira
      function BuscaTodosSaldosInvestLote(iCarteira, iInvestimento, iHistCartInv: integer; sLote: string;
      dDataRef: TDateTime; var fSdoQtdeInvCart, fSdoVlrInvCart, fSdoAtu, fSdoCar, fSdoAqui, fSdoRend,
      fSdoMercado, fSdoVar, fSdoJur, fSdoPre, fSdoIRProv, fSdoIRApu, fSdoIOFProv, fSdoIOFApu,
      fSdoAgio: double): boolean;

      // Função que Calcula Saldo de Combinações de Carteira/Investimento/Lote no dia
      function CalculaSaldo(iInvestimento, iCarteira: integer; sLote: string; dDataOper: TDateTime;
      var fSaldoQtdeInvCart, fSaldoVlrInvCart, fSaldoCotasCartInv, fSaldoVlrCartInv, fSaldoAtu, fSaldoCar,
      fSaldoAqui, fSaldoRend, fSaldoMercado, fSaldoVar, fSaldoJur, fSaldoPre, fSaldoIRProv, fSaldoIRApu,
      fSaldoIOFProv, fSaldoIOFApu, fSaldoAgio: double): boolean;

      // Função que Soma Saldos dos  Investimentos na Carteira para uma determinada data
      function SaldosInvCart(iCarteira: integer; dDataRef: TDateTime; var fSaldoQtdeInvCart,
      fSaldoVlrInvCart, fSaldoAtu, fSaldoCar, fSaldoAqui, fSaldoRend, fSaldoMercado: double) : boolean;

      // Função que Busca Cotação de um Investimento numa determinada data.
      function BuscaCotacaoInvest(iInvestimento: integer; dDataRef: TDateTime; bUsaLote: boolean): double;

      function BuscaVlrCotaCarteira(iCarteira: integer; dDataRef: TDateTime): double;
      function BuscaSaldoCarteira(iCarteira: integer; dDataRef: TDateTime): double;

// =================================================================================================
//    Moedas / Índices
// =================================================================================================

      // Função que Busca Cotação de uma Moeda numa determinada data, segundo um Operador de
      // Procura : (=, <, <=, >, >=)
      function BuscaCotacaoMoeda(iMoeda: integer; dDataRef: TDateTime; sOperador: string;
      var fCotacao: double; var dDataCotacao: TDateTime): boolean;

      // Função que Busca Cotação de uma Moeda numa determinada data.
      function LeMoeda(iMoeCodigo: integer; dCotData: TDateTime; sFlgProRata, sFlgInterpola: string): double;

      // Função que Calcula Juros Diários a partir de um Valor e o Tipo de Juros.
      function CalculaJurosDia(fValorJuros: double; iTipoJuros: integer): double;

      // Função que retorna o Saldo das contas contábeis de variação Positiva e Negativa para contabilização
      function BuscaTipoOperVarRV(var RecBuscaTipoOperVarRV : TRecBuscaTipoOperVarRV):Integer;

      function DivValorZero(Valor1, Valor2: Extended): Extended;

      function Trunca(rValor: Double;iQtdDec: Integer):Double;

      function Round(rValor: Double;iQtdDec: Integer): Double;

      function ConvertePonto(sConverter : string):string;

      function StripChar(S : String; C : Char) : String;      
   end;



var
  OperComum : TOperComum;



implementation
uses
  uLancContab, uDocumento, uIntegraBack, uMensErro, uFuncaoGeral, uDataBase, uDiasUteis,
  dBaseDados, dOperacaoInvest, UOperacaoInvest, Math;



//-- INICIO DAS FUNCOES --\\
//------------------------------------------------------------------
// Executa uma Query - ExecSQL
Function ExecutaQuery(Qry: TQuery; Const Str :String): Boolean;
begin
  Result := False;
  With Qry Do Begin
    Try
      Close;
      SQL.Clear;
      SQL.Add(str);
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
Function FazQuery(Var Qry : TwwQuery; Str : String) : Boolean;
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



// =================================================================================================
//    Uso interno (por outras funções)
// =================================================================================================

procedure TOperComum.MensagemErroContab(iResultado: integer);
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





procedure TOperComum.MensagemErroPeriodo(iErroPeriodo: integer);
begin
   case iErroPeriodo of
      1: MsgDlg('O Período escolhido não Existe', 'Erro', mtError, [mbOk], 0);
      2: MsgDlg('O Período escolhido existe mas não é único', 'Erro', mtError, [mbOk], 0);
      3: MsgDlg('O Período escolhido está bloqueado', 'Erro', mtError, [mbOk], 0);
      4: MsgDlg('O Período escolhido está bloqueado', 'Erro', mtError, [mbOk], 0);
   end;
end;





// -------------------------------------------------------------------------------------------------
// Função que testa a consistência dos parâmetros passados para Alimenta Carteira
// -------------------------------------------------------------------------------------------------
function TOperComum.VerificaParametros(var iInvestimento, iTipoInvest, iOperacao, iTipoOperacao,
iCarteira, iDespesaOperacao, iDespesaCarteira: integer; fValorPrimeiraCota: currency;
sNaturezaMovimento:string): boolean;
begin
   Result := False;

   // o valor da 1ª cota deve ser informado e positivo
   if fValorPrimeiraCota <= 0 then Exit;
   // Natureza da Operacao deve ser Informada
   if sNaturezaMovimento = '' then Exit;

   // se não foi informada a carteira, a operacao
   if iCarteira <= 0 then Exit;

   // se não for uma despesa
   if iDespesaCarteira > -1 then begin

      // 'zera' todos os outros parâmetros
      iInvestimento     := -1;
      iOperacao         := -1;
      iDespesaOperacao  := -1;
      iTipoInvest       := -1;
      iTipoOperacao     := -1;

   end else begin

      // verifica os outros parâmetros obrigatórios
      if iInvestimento <= 0 then Exit;
      if iTipoInvest <= 0 then Exit;

      iDespesaCarteira := -1;

   end;

   Result := True;
end;





procedure TOperComum.MostraErroAtualiza(sCarteira, sInvestimento, sTipoMov, sLancamento, sDataLanc, sMsg: string);
var
   sMensagem : string;
begin
   sMensagem :=
   'Houve ERRO na tentativa de atualização dos saldos. ' + chr(13) +
   'Carteira           : ' + sCarteira + chr(13) +
   'Investimento       : ' + sInvestimento + chr(13) +
   'Tipo de Movimento  : "' + sTipoMov + '"' + chr(13) +
   'Lançamento         : ' + sLancamento + chr(13) +
   'Data do Lançamento : ' + sDataLanc + chr(13) + chr(10) +
   'Mensagem: ' + sMsg;

   MsgDlg(sMensagem, 'Erro', mtError, [mbOk], 0);
end;





procedure TOperComum.MostraErroAtualizaInvest(sCarteira, sInvestimento, sLote, sData, sMsg: string);
var
   sMensagem : string;
begin
   sMensagem :=
   'Houve ERRO na tentativa de atualização dos saldos. ' + chr(13) +
   'Carteira     : ' + sCarteira + chr(13) +
   'Investimento : ' + sInvestimento + chr(13) +
   'Lote         : ' + sLote + chr(13) +
   'Data         : ' + sData + chr(13) + chr(10) +
   'Mensagem: ' + sMsg;

   MsgDlg(sMensagem, 'Erro', mtError, [mbOk], 0);
end;





procedure LimpaParametros(const qry: TwwQuery);
var
   i: integer;
begin
   // fecha a query p/ evitar problemas
   qry.Close;

   // prepara a query se já não estiver preparada
   if not(qry.Prepared) then qry.Prepare;

   // zera os parâmetros
   for i := 0 to (qry.ParamCount - 1) do qry.Params[i].Clear;
end;





// =================================================================================================
//    Integração Financeira / Contábil
// =================================================================================================

// Retorna a máscara do Plano de Contas
function TOperComum.GetMascaraPlano(iPlano: integer): string;
var
   qryContab : TwwQuery;
begin
   qryContab := dtmOperComum.qryIntegraContab;

   with qryContab do begin
      Close;
      if not(Prepared) then Prepare;
      ParamByName('PLANO').AsInteger := iPlano;
      Open;
   end;

   if not(qryContab.isEmpty) then Result := trim(qryContab.FieldbyName('MASCARA').AsString);
   qryContab.Close;
end;





// Gera um nº de documento único
function TOperComum.GeraNoDocumento(c: char): extended;
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





// -------------------------------------------------------------------------------------------------
// Abre a qryPadrLanc de acordo com os parâmetros passados
//--------------------------------------------------------------------------------------------------
procedure TOperComum.AbrePadrLanc(iEmpresaProp, iTipoInvest, iTipoOperacao, iTipoDespesa,
iInvestimento, iCarteira: integer; sTipoTitulo, sTipoMov: string);
begin
   with dtmOperComum.qryPadrLanc do begin
      Close;
      if not(Prepared) then Prepare;

      ParamByName('EMPRESAPROP').AsInteger   := iEmpresaProp;
      ParamByName('TIPOINVEST').AsInteger    := iTipoInvest;
      ParamByName('TIPOMOV').AsString        := sTipoMov;

      ParamByName('TIPOOERACAO').AsInteger   := iTipoOperacao;
      if iTipoOperacao = 0 then                 ParamByName('TIPOOERACAO').Clear;

      ParamByName('TIPOLANC').AsString       := 'N';
      if sTipoMov = 'ATU' then                  ParamByName('TIPOLANC').Clear;

      ParamByName('TIPODESPESA').AsInteger   := iTipoDespesa;
      if iTipoDespesa = 0 then                  ParamByName('TIPODESPESA').Clear;

      ParamByName('TIPOTITULO').AsString     := sTipoTitulo;
      if length(trim(sTipoTitulo)) = 0 then     ParamByName('TIPOTITULO').Clear;

      ParamByName('CARTEIRA').AsInteger      := iCarteira;
      if iCarteira = -1 then                    ParamByName('CARTEIRA').Clear;

      ParamByName('INVESTIMENTO').AsInteger  := iInvestimento;
      if iInvestimento = -1 then                ParamByName('INVESTIMENTO').Clear;

      Open;
   end;
end;





// -------------------------------------------------------------------------------------------------
// Função que busca na tabela PadrLancContInv o conjunto de parâmetros de integração mais
// apropriado, dadas as condições passadas. Mesma função p/ Operação quanto p/ Despesa de Operação
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       iEmpresaProp      :  id da Empresa Proprietária                      (Sistema.idEmpresa)
//       iTipoInvest       :  id do Tipo de Investimento, tabela TipoInvest   (idTipoInvest)
//       iTipoOperacao     :  id do Tipo de Operacao, tabela TipoOperacao     (idTipoOperacao)
//       iTipoDespesa      :
//       iInvestimento     :
//       iCarteira         :  id da Carteira
//       sTipoTitulo       :  código do Tipo de Título, tabela CodTipoTitulo  (CodTipTitulo)
//
//       sTipoMov          :  OPE -> Operação
//                            DOP -> Despesa de Operação
//                            ATU -> Atualização
//
//    A função retorna também os parâmetros de integração:
//       iPlano            :  plano de contas usado para os lançamentos contábeis
//       sContaDeb
//       sContaCred
//       sCentroCustoDeb
//       sCentroCustoCred
//       iSubContaDeb
//       iSubContaCred
//       sTipoPer
//       sCentroRespon
//       iUnidNegoc
//       sTipoRecDes
//       sHistoricoOper    :  histórico da Operação, segundo PadrLancContInv
//       sRecPagNao
//
//    Códigos de retorno (controle de erro):
//        0 : Situação normal
//       -4 : Erro: ambigüidade no Padrão de Lançamento
//       -5 : Erro: nenhum Padrão de Lançamento que atenda os parâmetros passados
//
//--------------------------------------------------------------------------------------------------
function TOperComum.BuscaPadrLanc(iEmpresaProp, iTipoInvest, iTipoOperacao, iTipoDespesa, iInvestimento,
iCarteira: integer; fValor: double; sTipoTitulo, sTipoMov: string; var iPlano, iSubContaDeb,
iSubContaCred, iUnidNegoc: integer; var sContaDeb, sContaCred, sCentroCustoDeb, sCentroCustoCred,
sCentroRespon, sTipoRecDes, sTipoPer, sHistoricoOper, sRecPagNao: string): integer;
begin
   // nenhum padrão encontrado, a princípio
   Result := 0;

   try

      // 1º Passo: TipoOperacao + Carteira + TipoTitulo + Investimento (caso mais detalhado)
      if ( (iCarteira > 0) and (sTipoTitulo <> '') and (iInvestimento > 0) ) then begin

         OperComum.AbrePadrLanc(iEmpresaProp, iTipoInvest, iTipoOperacao, iTipoDespesa,
         iInvestimento, iCarteira, sTipoTitulo, sTipoMov);

         // Erro: ambigüidade no Padrão de Lançamento
         if dtmOperComum.qryPadrLanc.RecordCount > 1 then Result := -4;
      end;


      // 2º Passo: TipoOperacao + TipoTitulo + Investimento
      if ( (Result = 0) and (sTipoTitulo <> '') and (iInvestimento > 0) ) then begin
         if ( not(dtmOperComum.qryPadrLanc.Active) or (dtmOperComum.qryPadrLanc.isEmpty) ) then begin

            OperComum.AbrePadrLanc(iEmpresaProp, iTipoInvest, iTipoOperacao, iTipoDespesa,
            iInvestimento, -1{iCarteira}, sTipoTitulo, sTipoMov);

            if dtmOperComum.qryPadrLanc.RecordCount > 1 then Result := -4; // Erro: ambigüidade no Padrão de Lançamento
         end;
      end;


      // 3º Passo: TipoOperacao + TipoTitulo + Carteira
      if ( (Result = 0) and (sTipoTitulo <> '') and (iCarteira > 0) ) then begin
         if ( not(dtmOperComum.qryPadrLanc.Active) or (dtmOperComum.qryPadrLanc.isEmpty) ) then begin

            OperComum.AbrePadrLanc(iEmpresaProp, iTipoInvest, iTipoOperacao, iTipoDespesa,
            -1{iInvestimento}, iCarteira, sTipoTitulo, sTipoMov);

            // Erro: ambigüidade no Padrão de Lançamento
            if dtmOperComum.qryPadrLanc.RecordCount > 1 then Result := -4;
         end;
      end;


      // 4º Passo: TipoOperacao + TipoTitulo
      if ( (Result = 0) and (sTipoTitulo <> '') ) then begin
         if ( not(dtmOperComum.qryPadrLanc.Active) or (dtmOperComum.qryPadrLanc.isEmpty) ) then begin

            OperComum.AbrePadrLanc(iEmpresaProp, iTipoInvest, iTipoOperacao, iTipoDespesa,
            -1{iInvestimento}, -1{iCarteira}, sTipoTitulo, sTipoMov);

            // Erro: ambigüidade no Padrão de Lançamento
            if dtmOperComum.qryPadrLanc.RecordCount > 1 then Result := -4;
         end;
      end;


      // 5º Passo: TipoOperacao + Carteira
      if ( (Result = 0) and (iCarteira > 0) ) then begin
         if ( not(dtmOperComum.qryPadrLanc.Active) or (dtmOperComum.qryPadrLanc.isEmpty) ) then begin

            OperComum.AbrePadrLanc(iEmpresaProp, iTipoInvest, iTipoOperacao, iTipoDespesa,
            -1{iInvestimento}, iCarteira, ''{sTipoTitulo}, sTipoMov);

            // Erro: ambigüidade no Padrão de Lançamento
            if dtmOperComum.qryPadrLanc.RecordCount > 1 then Result := -4;
         end;
      end;


      // 6º Passo: só TipoOperacao
      if ( (Result = 0) ) then begin
         if ( not(dtmOperComum.qryPadrLanc.Active) or (dtmOperComum.qryPadrLanc.isEmpty) ) then begin

            OperComum.AbrePadrLanc(iEmpresaProp, iTipoInvest, iTipoOperacao, iTipoDespesa,
            -1{iInvestimento}, -1{iCarteira}, ''{sTipoTitulo}, sTipoMov);

            // Erro: ambigüidade no Padrão de Lançamento
            if dtmOperComum.qryPadrLanc.RecordCount > 1 then Result := -4;
         end;
      end;


      // Finalmentes: resultado da Busca
      if Result = 0 then begin
         // verifica se agora foi encontrado algum Padrão de Lançamento
         if ( (dtmOperComum.qryPadrLanc.Active) and not(dtmOperComum.qryPadrLanc.isEmpty) ) then begin

            iPlano            := dtmOperComum.qryPadrLancPLANO.AsInteger;

            // se o valor da Operação for negativo, inverte as contas
            if fValor > 0 then begin
               sContaDeb      := dtmOperComum.qryPadrLancCONTADOPERFIN.AsString;
               sContaCred     := dtmOperComum.qryPadrLancCONTACOPERFIN.AsString;
            end else begin
               sContaDeb      := dtmOperComum.qryPadrLancCONTACOPERFIN.AsString;
               sContaCred     := dtmOperComum.qryPadrLancCONTADOPERFIN.AsString;
            end;

            // Centro de Custo
            if dtmOperComum.qryPadrLancCENCUSTDINVEST.isNULL then begin
               sCentroCustoDeb   := '';
            end else begin
               sCentroCustoDeb   := dtmOperComum.qryPadrLancCENCUSTDINVEST.AsString;
            end;
            if dtmOperComum.qryPadrLancCENCUSTCINVEST.isNULL then begin
               sCentroCustoCred  := '';
            end else begin
               sCentroCustoCred  := dtmOperComum.qryPadrLancCENCUSTCINVEST.AsString;
            end;

            // Sub-Conta
            if dtmOperComum.qryPadrLancCODSUBCONTAD.isNULL then begin
               iSubContaDeb      := -1;
            end else begin
               iSubContaDeb      := dtmOperComum.qryPadrLancCODSUBCONTAD.AsInteger;
            end;
            if dtmOperComum.qryPadrLancCODSUBCONTAC.isNULL then begin
               iSubContaCred     := -1;
            end else begin
               iSubContaCred     := dtmOperComum.qryPadrLancCODSUBCONTAC.AsInteger;
            end;

            // Unidade de Negócio ou "Atividade/Projeto"
            if dtmOperComum.qryPadrLancUNIDNEGOC.isNULL then begin
               iUnidNegoc        := -1;
            end else begin
               iUnidNegoc        := dtmOperComum.qryPadrLancUNIDNEGOC.AsInteger;
            end;

            // Centro de Responsabilidade
            if dtmOperComum.qryPadrLancCODCENTRORESPON.isNULL then begin
               sCentroRespon     := '';
            end else begin
               sCentroRespon     := dtmOperComum.qryPadrLancCODCENTRORESPON.AsString;
            end;

            // Tipo de Recebimento/Desembolso
            if dtmOperComum.qryPadrLancCODTIPRECDES.isNULL then begin
               sTipoRecDes       := '';
            end else begin
               sTipoRecDes       := dtmOperComum.qryPadrLancCODTIPRECDES.AsString;
            end;

            // Tipo de Operacao
            if dtmOperComum.qryPadrLancTIPCODIGO.isNULL then begin
               sTipoPer          := '';
            end else begin
               sTipoPer          := dtmOperComum.qryPadrLancTIPCODIGO.AsString;
            end;

            sHistoricoOper       := dtmOperComum.qryPadrLancHISTLANCINVEST.AsString;
            sRecPagNao           := dtmOperComum.qryPadrLancFLGPAGRECNAO.AsString;

         end else begin
            // Erro: nenhum Padrão de Lançamento que atenda os parâmetros passados
            Result := -5;
         end;
      end;
      //if Result = -4 then
      //   MsgDlg('Atenção : Foi encontrado ambigüidade no '#13+
      //          'padrão de lançamento contábil da operação!','Mensagem do Sistema ',mtWarning,[mbOK],0)
      //else if Result = -5 then
      //   MsgDlg('Atenção : Não foi encontrado o padrão de lançamento '#13+
      //          'contábil da operação ','Mensagem do Sistema ',mtWarning,[mbOK],0);
   finally
      dtmOperComum.qryPadrLanc.Close;
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
function TOperComum.LancaOperInvest(iEmpresaProp, iModuloOrigem, iTipoInvest, iTipoOperacao,
iOperacao, iForCli, iCarteira, iMoeda, iInvestimento: integer; sTipoTitulo, sComplemento,
sTipoParcela: string; fVlrOMOper, fVlrOper: currency; dDataOper, dDataVencOper: TDateTime; bMostraMsg,
bParcelado: boolean; var iPlano, iPlanilhaOper, iDocumentoOper, iFatura: integer; var fNoDoc: extended;
var sHistoricoOper, sMensErro: string): integer;
var
   iSubContaCred, iSubContaDeb, iUnidNegoc, iTipoDoc : integer;
   sContaCred, sContaDeb, sCentroCustoCred, sCentroCustoDeb, sCentroRespon, sRecPagNao,
   sTipoPer, sRecPag, sTipoRecDes: string;
   bTransacao, bContabiliza, bLancaCAPCAR: boolean;
begin
   Result := 0;
   Screen.Cursor  := crHourGlass;
   bTransacao     := False; // a priori, não é necessário que se inicie uma transação

   try

      try

// @X Verificação dos parâmetros do Tipo de Operação -----------------------------------------------

         with dtmOperComum.qryTipoOperacao do begin
            Close;
            if not(Prepared) then Prepare;
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

                     if not(LancamentoContabil(iEmpresaProp, iModuloOrigem, iPlano, iSubContaDeb,
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
                           if not(LancamentoCAPCAR(iEmpresaProp, iModuloOrigem, iPlano, iPlanilhaOper,
                           iSubContaCred, iTipoDoc, iUnidNegoc, iForCli, iMoeda, fVlrOMOper,
                           fVlrOper, sCentroRespon, sTipoRecDes, sContaCred, sCentroCustoCred, 'C',
                           sComplemento, sTipoParcela, dDataOper, dDataVencOper, sRecPagNao[1],
                           bParcelado, bMostraMsg, iDocumentoOper, iFatura, fNoDoc))
                           then Result := -7; // não foi possível efetuar o lançamento de CAP/CAR

                           'R':
                           if not(LancamentoCAPCAR(iEmpresaProp, iModuloOrigem, iPlano, iPlanilhaOper,
                           iSubContaCred, iTipoDoc, iUnidNegoc, iForCli, iMoeda, fVlrOMOper,
                           fVlrOper, sCentroRespon, sTipoRecDes, sContaCred, sCentroCustoCred, 'D',
                           sComplemento, sTipoParcela, dDataOper, dDataVencOper, sRecPagNao[1],
                           bParcelado, bMostraMsg, iDocumentoOper, iFatura, fNoDoc))
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
         Screen.Cursor := crDefault;

         Result := -3; // Erro de gravação
         if bMostraMsg then Raise;
      end;

   finally
      if ( (Result < 0) and (bTransacao) and (dtmBaseDados.dbBaseDados.InTransaction) ) then RollBackTransacao;
      Screen.Cursor := crDefault;
   end;
end;





//--------------------------------------------------------------------------------------------------
//    LancaDespInvest:  Função que efetua o par de lançamentos Contábeis e o lançamento de CAPCAR
//                      (se aplicáveis) associados a uma Operação de Investimento (de acordo com a
//                      tabela PadrLancContInv), não considerando, contudo, as Despesas
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
//       iForCli           :  id do Fornecedor ou Cliente                     (idForCli)
//       iCarteira         :  id da Carteira
//       iMoeda            :  id da Moeda da Operação                         (idMoeda)
//       sTipoTitulo       :  código do Tipo de Título, tabela CodTipoTitulo  (CodTipTitulo)
//       sRecPagNao        :  string que define o lançamento (P=Pagar, R=Receber, N=Não há)
//       fVlrOMDesp        :  valor da operação em outra moeda
//       fVlrDesp          :  valor da operação na moeda corrente
//       dDataOper         :  data da operação
//       dDataVencimento   :  data da operação
//       bMostraMsg        :  True  - mostra mensagens
//                            False - não mostra mensagens
//
//    A função retorna também
//       iPlano            :  plano de contas usado para os lançamentos contábeis
//       iPlanilhaDesp     :  planilha onde foram efetuados os lançamentos contábeis
//       iDocumentoDesp    :  documento que contém o lançamento a Pagar / Receber
//       sHistoricoDesp    :  histórico da Despesa, segundo PadrLancContInv
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
function TOperComum.LancaDespInvest(iEmpresaProp, iModuloOrigem, iTipoInvest, iTipoOperacao,
iTipoDespesa, iOperacao, iDespesa, iForCli, iCarteira, iMoeda, iInvestimento: integer;
sTipoTitulo: string; fVlrOMDesp, fVlrDesp: currency; dDataDespesa, dDataVencDesp: TDateTime;
bMostraMsg: boolean; var iPlano, iPlanilhaDesp, iDocumentoDesp: integer; var sHistoricoDesp,
sMensErro: string): integer;
var
   iSubContaCred, iSubContaDeb, iUnidNegoc, iTipoDoc, iFatura : integer;
   sContaCred, sContaDeb, sCentroCustoCred, sCentroCustoDeb, sCentroRespon, sTipoRecDes, sRecPag,
   sTipoPer, sRecPagNao, sComplemento, sTipoParcela: string;
   bTransacao, bContabiliza, bLancaCAPCAR, bParcelado: boolean;
   fNoDoc: extended;
begin
   Result := 0;
   Screen.Cursor  := crHourGlass;
   bTransacao     := False; // a priori, não é necessário que se inicie uma transação

   try

      try

// @X Verificação dos parâmetros do Tipo de Despesa ------------------------------------------------

         with dtmOperComum.qryDespXTipoOper do begin
            Close;
            if not(Prepared) then Prepare;
            ParamByName('TIPOINVEST').AsInteger    := iTipoInvest;
            ParamByName('TIPOOERACAO').AsInteger   := iTipoOperacao;
            ParamByName('TIPODESPESA').AsInteger   := iTipoDespesa;
            Open;

            iTipoDoc       := FieldByName('CODTIPDOC').AsInteger;
            bContabiliza   := FieldByName('FLGGERACONTAB').AsInteger = 1;
            bLancaCAPCAR   := FieldByName('FLGGERACAPCAR').AsInteger = 1;
         end;

         // só vai adiante se for necessário fazer algum tipo de lançamento (Contábil ou CAP/CAR)...
         if ( (bContabiliza) or (bLancaCAPCAR) ) then begin

            if fVlrDesp <> 0 then begin

               // verifica se já existe transação em andamento; se não houver, inicia uma
               if not(dtmBaseDados.dbBaseDados.InTransaction) then begin
                  bTransacao := True;
                  StartTransacao;
               end else begin
                  bTransacao := False;
               end;

// @X Busca da PadrLancContInv p/ fazer os lançamentos ---------------------------------------------

               // Verifica o Padrão de Lançamento mais adequado
               Result := OperComum.BuscaPadrLanc(iEmpresaProp, iTipoInvest, iTipoOperacao, iTipoDespesa,
                         iInvestimento, iCarteira, fVlrDesp, sTipoTitulo, 'DOP', iPlano, iSubContaDeb,
                         iSubContaCred, iUnidNegoc, sContaDeb, sContaCred, sCentroCustoDeb,
                         sCentroCustoCred, sCentroRespon, sTipoRecDes, sTipoPer, sHistoricoDesp,
                         sRecPagNao);

               // Se vai tudo bem ainda...
               if Result = 0 then begin

                  // Modula o valor da despesa
                  fVlrDesp := abs(fVlrDesp);


// @X Chamada às funções de integração Contábil e Financeira ---------------------------------------

                  if bContabiliza then begin

                     if iPlanilhaDesp = -1 then iPlanilhaDesp := 0;

                     if not(LancamentoContabil(iEmpresaProp, iModuloOrigem, iPlano, iSubContaDeb,
                     iSubContaCred, iUnidNegoc, iForCli, -1, -1, sContaDeb, sContaCred, sCentroCustoDeb,
                     sCentroCustoCred, sHistoricoDesp, sTipoPer, sRecPag, dDataDespesa, fVlrDesp,
                     bMostraMsg, iPlanilhaDesp, sMensErro) )
                     then Result := -6; // não foi possível efetuar o lançamento contábil

                  end;

                  // se é para ser feita contabilização e esta tiver sido efetuada com sucesso,
                  // ou se não é necessário contabilizar
                  if ( (bLancaCAPCAR) and (sRecPagNao <> 'N') ) then begin
                     if ( ((bContabiliza) and (Result = 0)) or (not(bContabiliza)) ) then begin

                        // despesas não são parceladas
                        sComplemento   := '';
                        sTipoParcela   := '';
                        bParcelado     := False;
                        iFatura        := 0;
                        fNoDoc         := -1;

                        case sRecPagNao[1] of
                           'D':
                           if not(LancamentoCAPCAR(iEmpresaProp, iModuloOrigem, iPlano, iPlanilhaDesp,
                           iSubContaCred, iTipoDoc, iUnidNegoc, iForCli, iMoeda, fVlrOMDesp,
                           fVlrDesp, sCentroRespon, sTipoRecDes, sContaCred, sCentroCustoCred, 'D',
                           sComplemento, sTipoParcela, dDataDespesa, dDataVencDesp, sRecPagNao[1],
                           bParcelado, bMostraMsg, iDocumentoDesp, iFatura, fNoDoc))
                           then Result := -7; // não foi possível efetuar o lançamento de CAP/CAR
                           'P':
                           if not(LancamentoCAPCAR(iEmpresaProp, iModuloOrigem, iPlano, iPlanilhaDesp,
                           iSubContaCred, iTipoDoc, iUnidNegoc, iForCli, iMoeda, fVlrOMDesp,
                           fVlrDesp, sCentroRespon, sTipoRecDes, sContaCred, sCentroCustoCred, 'C',
                           sComplemento, sTipoParcela, dDataDespesa, dDataVencDesp, sRecPagNao[1],
                           bParcelado, bMostraMsg, iDocumentoDesp, iFatura, fNoDoc))
                           then Result := -7; // não foi possível efetuar o lançamento de CAP/CAR
                           'R':
                           if not(LancamentoCAPCAR(iEmpresaProp, iModuloOrigem, iPlano, iPlanilhaDesp,
                           iSubContaCred, iTipoDoc, iUnidNegoc, iForCli, iMoeda, fVlrOMDesp,
                           fVlrDesp, sCentroRespon, sTipoRecDes, sContaCred, sCentroCustoCred, 'D',
                           sComplemento, sTipoParcela, dDataDespesa, dDataVencDesp, sRecPagNao[1],
                           bParcelado, bMostraMsg, iDocumentoDesp, iFatura, fNoDoc))
                           then Result := -7; // não foi possível efetuar o lançamento de CAP/CAR
                           'U':
                           if not(LancamentoCAPCAR(iEmpresaProp, iModuloOrigem, iPlano, iPlanilhaDesp,
                           iSubContaCred, iTipoDoc, iUnidNegoc, iForCli, iMoeda, fVlrOMDesp,
                           fVlrDesp, sCentroRespon, sTipoRecDes, sContaCred, sCentroCustoCred, 'C',
                           sComplemento, sTipoParcela, dDataDespesa, dDataVencDesp, sRecPagNao[1],
                           bParcelado, bMostraMsg,  iDocumentoDesp, iFatura, fNoDoc))
                           then Result := -7; // não foi possível efetuar o lançamento de CAP/CAR
                        end;
                     end;

                  end else begin
                     iDocumentoDesp := -1;
                  end;

// @X Finalmentes (integração já foi disparada, com sucesso ou não) --------------------------------

                  // se tudo correu bem...
                  if ( (Result = 0) and (bTransacao) and (dtmBaseDados.dbBaseDados.InTransaction) ) then CommitTransacao;

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

         Result := -3; // Erro de gravação
         if bMostraMsg then Raise;
      end;

   finally
      if ( (Result < 0) and (bTransacao) and (dtmBaseDados.dbBaseDados.InTransaction) ) then RollBackTransacao;
      Screen.Cursor := crDefault;
   end;
end;

// Função que retorna o Saldo das contas contábeis de variação Positiva e Negativa para contabilização
function TOperComum.BuscaTipoOperVarRV(var RecBuscaTipoOperVarRV : TRecBuscaTipoOperVarRV):Integer;
var
wSldVarPositiva,wSldVarNegativa : double;
begin
   Result := RecBuscaTipoOperVarRV.TIPOOPERACAO;

   dtmOperComum.QrySaldoVariacao.Close;
   dtmOperComum.QrySaldoVariacao.ParamByName('PLANO').AsInteger        := RecBuscaTipoOperVarRV.PLANO;
   dtmOperComum.QrySaldoVariacao.ParamByName('IDPLANOPREV').AsInteger  := RecBuscaTipoOperVarRV.IDPLANOPREV;
   dtmOperComum.QrySaldoVariacao.ParamByName('IDPATRO').AsInteger      := RecBuscaTipoOperVarRV.IDPATRO;
   dtmOperComum.QrySaldoVariacao.ParamByName('PEREXERCICIO').AsInteger := RecBuscaTipoOperVarRV.PEREXERCICIO;
   dtmOperComum.QrySaldoVariacao.ParamByName('PERNUMERO').AsInteger    := RecBuscaTipoOperVarRV.PERNUMERO;
   dtmOperComum.QrySaldoVariacao.ParamByName('PLNDATDIA').AsDateTime   := RecBuscaTipoOperVarRV.PLNDATDIA;
   dtmOperComum.QrySaldoVariacao.ParamByName('IDPESSOA').AsInteger     := RecBuscaTipoOperVarRV.IDPESSOA;
   dtmOperComum.QrySaldoVariacao.ParamByName('PLACONTA').AsString      := RecBuscaTipoOperVarRV.PLACONTACRED;
   dtmOperComum.QrySaldoVariacao.Open;
   wSldVarPositiva := dtmOperComum.QrySaldoVariacao.FieldByName('SALDO').AsFloat;

   dtmOperComum.QrySaldoVariacao.Close;
   dtmOperComum.QrySaldoVariacao.ParamByName('PLACONTA').AsString  := RecBuscaTipoOperVarRV.PLACONTADEB;
   dtmOperComum.QrySaldoVariacao.Open;
   wSldVarNegativa := dtmOperComum.QrySaldoVariacao.FieldByName('SALDO').AsFloat;

   if RecBuscaTipoOperVarRV.TIPOOPERACAO = -1 then               // Variação Positiva
   begin
      if (wSldVarPositiva = 0 ) and (wSldVarNegativa > 0 ) then  // Baixa o saldo Var.Negativa
         Result := -14;
   end
   else if RecBuscaTipoOperVarRV.TIPOOPERACAO = -9 then          // Variação Negativa
   begin
      if (wSldVarNegativa = 0 ) and (wSldVarPositiva > 0) then   // Baixa o saldo Var.Positiva
         Result := -15;
   end;
   dtmOperComum.QrySaldoVariacao.Close;
   {se Saldo(-1)>=0 and Saldo(-14)=0 então  // Aumenta Var.Positiva
    se Saldo(-1)=0  and Saldo(-14)>0 então  // Baixa o saldo Var.Negativa
    se Saldo(-1)>=0 and Saldo(-14)>0 então  // Aumenta Variação Positiva
    se Saldo(-9)>=0 and Saldo(-15)=0 então  // Aumenta Var. Negativa
    se Saldo(-9)=0  and Saldo(-15)>0 então  // Baixa o saldo Var.Positiva
    se Saldo(-9)>=0 and Saldo(-15)>0 então  // Aumenta Var. Negativa}
end;

// Função que efetua o par de lançamentos Contábeis e o lançamento de CAPCAR (se aplicáveis)
// associados a uma Operação de Investimento de Renda Fixa e Raviável (de acordo com a tabela
// PadrLancContInv), já contabilizando inclusive as despesas da Operação.
function TOperComum.LancaOperRFRV(iEmpresaProp, iModuloOrigem, iTipoInvest, iInvestimento,
iTipoOperacao, iOperacao, iForCli, iCarteira, iMoeda: integer; sTipoTitulo, sLote, sHistCapCar, sRecPagBol: string;
var sTipoRecDesBol: string; var bCriaLancto: boolean; fTotalLiquido, fVlrOper: currency; dDataOper, dDataVenc: TDateTime;
var iPlano, iPlanilhaOper, iDocumentoOper : integer; var sMensErro: string): shortint;

var
   iTipoDespesa, iNumFatura, iPlanoDs, iPlanoPrev, iPatro : integer;
   iSubContaDebOp, iSubContaCredOp, iUnidNegocOp, iTipoDocOp : integer;
   iSubContaDebDs, iSubContaCredDs, iUnidNegocDs, iTipoDocDs : integer;
   sContaCredOp, sContaDebOp, sCentroCustoCredOp, sCentroCustoDebOp, sCentroResponOp,
   sRecPagNaoOp, sTipoPerOp, sRecPagOp, sTipoRecDesOp, sComplementoOp, sTipoParcelaOp,
   sHistoricoOp,
   sContaCredDs, sContaDebDs, sCentroCustoCredDs, sCentroCustoDebDs, sCentroResponDs,
   sRecPagNaoDs, sTipoPerDs, sRecPagDs, sTipoRecDesDs, sComplementoDs, sTipoParcelaDs,
   sHistoricoDs, sContaDoc: string;

   bTransacao, bContabOper, bLancaCAPCAROper, bContabDesp, bLancaCAPCARDesp, bAchouOperacao,
   bAchouDespesa, bMostraMsg, bVenda : boolean;
   iNumLancamento, iPortador, iAchouPadrao, iIdHistCartInv, iIdHistCartInvLucro : integer;
   sPlano, sModulo, sOperacao, sStatus, sDebCre, sContaAux, sDataLanc, sDataVenc,
   sSQL : string;
   qryLancaDocumento, qryAuxiliar, qryDespOper, qryLocal, qryInvestimento, qryCarteira : TwwQuery;
   fVlrOperAbs, fVlrDesp, fVlrDespAbs, fVlrLiquido, fVlrLancto : double;
   fNoDocumento: extended;
   rRecBuscaTipoOperVarRV : TRecBuscaTipoOperVarRV;
   iAno,iMes, iDia : word;
   begin
   Result := 0;

   QryLocal              := TwwQuery.Create(Application);
   QryLocal.DatabaseName := 'BaseDados';

   Screen.Cursor := crHourGlass;
   bTransacao    := False; // a priori, não é necessário que se inicie uma transação
   bMostraMsg    := True;

   iNumFatura     := 0;
   sOperacao      := '2';
   sStatus        := '';
   sComplementoOp := '';
   sComplementoDs := '';

   fVlrLiquido    := 0;

//   iDocumentoOper := -1;
   iPlano         := -1;
   iPlanoDs       := -1;
//   iPlanilhaOper  := -1;

   try

      try

         iIdHistCartInv      := 0;
         iIdHistCartInvLucro := 0;

         // Busca registro de HistCartInv correspondente à Movimentação
         if iTipoOperacao > 0 then begin

            FazQuery(QryLocal,
              'SELECT IDHISTCARTINV '+
              'FROM HISTCARTINV '+
              'WHERE (TIPMOVCARTINV    = ''OPE'') AND '+
              '      (IDOPERACAOINVEST = '+
                        QuotedStr(IntToStr(iOperacao))+')');

            iIdHistCartInv := QryLocal.FieldByName('IDHISTCARTINV').AsInteger;
            QryLocal.Close;

            if FazQuery(QryLocal,
                 'SELECT IDHISTCARTINV '+
                 'FROM HISTCARTINV '+
                 'WHERE 	(TIPMOVCARTINV    = ''LUC'') AND '+
                 '      	(IDOPERACAOINVEST = '+
                 QuotedStr(IntToStr(iOperacao))+')') then

               iIdHistCartInvLucro := QryLocal.FieldByName('IDHISTCARTINV').AsInteger;

            QryLocal.Close;

         end else begin
         // Operações Internas
            case iTipoOperacao of
               -1, -2, -9:  // Atualização de Renda Fixa e Variável
               begin
                  sSQL :=
                     'SELECT MAX(IDHISTCARTINV) AS IDHISTCARTINV '+
                     'FROM HISTCARTINV '+
                     'WHERE (IDCARTEIRAINVEST = '+QuotedStr(IntToStr(iCarteira))+') AND '+
                     '      (IDINVESTIMENTO   = '+QuotedStr(IntToStr(iInvestimento))+') AND ';

                  if Slote <> '' then
                     sSQL := sSQL + '      (IDLOTE           = '+QuotedStr(sLote)+') AND '
                  else
                     sSQL := sSQL + '      (IDLOTE IS NULL) AND ';

                  sSQL := sSQL +
                   '      (TIPMOVCARTINV    = ''ATU'') AND '+
                   '      (DATAMOVCARTINV   = TO_DATE('+QuotedStr(DateToStr(dDataOper))+',''DD/MM/YYYY'')) ';

                  FazQuery(QryLocal, sSQL);

                  iIdHistCartInv := QryLocal.FieldByName('IDHISTCARTINV').AsInteger;
                  bVenda := false;
                  QryLocal.Close;

               end;
               -6:  // Baixa por Transferência de Renda Variável
               begin
                   FazQuery(QryLocal,
                    'SELECT IDHISTCARTINV '+
                    'FROM HISTCARTINV '+
                    'WHERE (TIPMOVCARTINV    = ''TRF'') AND '+
                    '      (NATURMOVCARTINV  = ''D'')   AND '+
                    '      (IDOPERACAOINVEST = '+
                              QuotedStr(IntToStr(iOperacao))+')');

                  iIdHistCartInv := QryLocal.FieldByName('IDHISTCARTINV').AsInteger;
                  bVenda := false;
                  QryLocal.Close;

               end;
               -4:  // Acréscimo por Transferência de Renda Variável
               begin
                   FazQuery(QryLocal,
                    'SELECT IDHISTCARTINV '+
                    'FROM HISTCARTINV '+
                    'WHERE (TIPMOVCARTINV    = ''TRF'') AND '+
                    '      (NATURMOVCARTINV  = ''A'')   AND '+
                    '      (IDOPERACAOINVEST = '+
                              QuotedStr(IntToStr(iOperacao))+')');

                  iIdHistCartInv := QryLocal.FieldByName('IDHISTCARTINV').AsInteger;
                  bVenda := false;
                  QryLocal.Close;

               end;
            end;
         end;

         with dtmOperComum.qryParamInvest do begin
            Close;
            if not(Prepared) then Prepare;
            Open;
         end;

         with dtmOperComum.qryInvestimento do begin
            Close;
            if not(Prepared) then Prepare;
            ParamByName('INVESTIMENTO').AsInteger    := iInvestimento;
            Open;
         end;

         with dtmOperComum.qryCarteira do begin
            Close;
            if not(Prepared) then Prepare;
            ParamByName('CARTEIRA').AsInteger    := iCarteira;
            Open;
            iPlanoPrev := FieldByName('IDPLANOPREV').AsInteger;
            iPatro     := FieldByName('IDPATROCINADORA').AsInteger;
         end;

         // Verifica o padrão para Contabilização da Var.Positiva/Negativa com compensação
         if (iTipoOperacao = -1) or (iTipoOperacao = -9) then
         begin
            rRecBuscaTipoOperVarRV.IDPLANOPREV      := iPlanoPrev;
            rRecBuscaTipoOperVarRV.IDPATRO          := iPatro;
            DecodeDate(dDataOper, iAno, iMes,iDia);
            rRecBuscaTipoOperVarRV.PEREXERCICIO     := iAno;
            rRecBuscaTipoOperVarRV.PERNUMERO        := iMes;
            rRecBuscaTipoOperVarRV.PLNDATDIA        := dDataOper;
            rRecBuscaTipoOperVarRV.IDPESSOA         := iEmpresaProp;
            rRecBuscaTipoOperVarRV.TIPOOPERACAO     := iTipoOperacao;

            fVlrOper := ABS(fVlrOper);
            iAchouPadrao := OperComum.BuscaPadrLanc(iEmpresaProp, iTipoInvest, -1, 0{iTipoDespesa},
                           iInvestimento, iCarteira, fVlrOper, sTipoTitulo, 'OPE', iPlano, iSubContaDebOp,
                           iSubContaCredOp, iUnidNegocOp, sContaDebOp, sContaCredOp, sCentroCustoDebOp,
                           sCentroCustoCredOp, sCentroResponOp, sTipoRecDesOp, sTipoPerOp, sHistoricoOp,
                           sRecPagNaoOp);
            rRecBuscaTipoOperVarRV.PLACONTACRED     := sContaCredOp;
            rRecBuscaTipoOperVarRV.PLANO            := iPlano;

            iAchouPadrao := OperComum.BuscaPadrLanc(iEmpresaProp, iTipoInvest, -9, 0{iTipoDespesa},
                           iInvestimento, iCarteira, fVlrOper, sTipoTitulo, 'OPE', iPlano, iSubContaDebOp,
                           iSubContaCredOp, iUnidNegocOp, sContaDebOp, sContaCredOp, sCentroCustoDebOp,
                           sCentroCustoCredOp, sCentroResponOp, sTipoRecDesOp, sTipoPerOp, sHistoricoOp,
                           sRecPagNaoOp);
            rRecBuscaTipoOperVarRV.PLACONTADEB     := sContaDebOp;

            iTipoOperacao := BuscaTipoOperVarRV(rRecBuscaTipoOperVarRV);
         end;

         // Verifica o Padrão de Lançamento mais adequado
         iAchouPadrao := OperComum.BuscaPadrLanc(iEmpresaProp, iTipoInvest, iTipoOperacao, 0{iTipoDespesa},
                   iInvestimento, iCarteira, fVlrOper, sTipoTitulo, 'OPE', iPlano, iSubContaDebOp,
                   iSubContaCredOp, iUnidNegocOp, sContaDebOp, sContaCredOp, sCentroCustoDebOp,
                   sCentroCustoCredOp, sCentroResponOp, sTipoRecDesOp, sTipoPerOp, sHistoricoOp,
                   sRecPagNaoOp);

         bAchouOperacao := (iAchouPadrao = 0);

         // @X Verificação dos parâmetros do Tipo de Operação -----------------------------------------------

         with dtmOperComum.qryTipoOperacao do begin
            Close;
            if not(Prepared) then Prepare;
            ParamByName('TIPOINVEST').AsInteger    := iTipoInvest;
            ParamByName('TIPOOERACAO').AsInteger   := iTipoOperacao;
            Open;

            iTipoDocOp       := FieldByName('CODTIPDOC').AsInteger;
            bContabOper      := FieldByName('FLGGERACONTAB').AsInteger = 1;
            bLancaCAPCAROper := FieldByName('FLGGERACAPCAR').AsInteger = 1;
            sRecPagOp        := FieldByName('RECPAG').AsString;
            bVenda           := (FieldByName('NATUREZAOPERACAO').AsString = 'D');
         end;


// @X Início do processamento ----------------------------------------------------------------------

//         if ( ((bContabOper) or (bLancaCAPCAROper)) and (fVlrOper <> 0) ) then begin
         if (fVlrOper <> 0) then begin

            // verifica se já existe transação em andamento; se não houver, inicia uma
            if not(dtmBaseDados.dbBaseDados.InTransaction) then begin
               bTransacao := True;
               StartTransacao;
            end;

            // Modula o valor da operação
            fVlrOperAbs := abs(fVlrOper);


// @X Chamada às funções de integração Contábil e Financeira ---------------------------------------

            if ( (bContabOper) and (bAchouOperacao) ) then begin

               if iPlanilhaOper = -1 then iPlanilhaOper := 0;

               sHistoricoOp := trim(sHistoricoOp) + '  ' +
                               trim(dtmOperComum.QryInvestimento.FieldByName('DESCINVESTIMENTO').AsString);
               if iTipoInvest = 1 then  // pega Lote da aplicação
                  sHistoricoOp := trim(sHistoricoOp) + '  ' + trim(sLote)
               else                     // pega Lote da operação
                  sHistoricoOp := trim(sHistoricoOp) + '  ' + trim(sHistCapCar);

               if not(LancamentoContabil(iEmpresaProp, iModuloOrigem, iPlano, iSubContaDebOp,
               iSubContaCredOp, iUnidNegocOp, iForCli, iPlanoPrev, iPatro, sContaDebOp, sContaCredOp, sCentroCustoDebOp,
               sCentroCustoCredOp, sHistoricoOp, sTipoPerOp, sRecPagOp, dDataOper, fVlrOperAbs,
               bMostraMsg, iPlanilhaOper, sMensErro) )
               then Result := -6; // não foi possível efetuar o lançamento contábil

            end;


            // se é para ser feita contabilização e esta tiver sido efetuada com sucesso,
            // ou se não é necessário contabilizar
            if ( ((bContabOper) and (bAchouOperacao)) or (not(bContabOper)) ) then begin

               // Se a Operação Integra CAPCAR, alimenta sRecPagBol
               if (bLancaCAPCAROper) then begin

                  if Trim(sRecPagBol) = '' then
                  begin
                     sRecPagBol := sRecPagNaoOp;
                     if Trim(sRecPagNaoOp) = '' then begin
                        sMensErro := 'Tipo de Recebimento/Desembolso não especificado.';
                        Exit;
                     end;
                  end;

                  if Trim(sTipoRecDesBol) = '' then
                  begin
                     sTipoRecDesBol := sTipoRecDesOp;
                     if Trim(sTipoRecDesOp) = '' then begin
                        sMensErro := 'Tipo de Recebimento/Desembolso não especificado.';
                        Exit;
                     end;
                  end;
               end;

               // Se a Operação Integra CAPCAR, Cria Documento
               if (bLancaCAPCAROper)  and (iDocumentoOper = -1) then begin

                  qryAuxiliar := dtmOperComum.qryAuxiliar;
                  // gera o identificador incremental da tabela DOCUMENTO
                  iDocumentoOper := Documento.GetCodigo(qryAuxiliar);
                  iPortador      := -1;

                  sModulo     := IntToStr(iModuloOrigem);

                  sDataLanc   := DateToStr(dDataOper);
                  sDataVenc   := DateToStr(dDataVenc);

                  qryLancaDocumento := dtmOperComum.qryLancaDocumento;
                  qryAuxiliar       := dtmOperComum.qryAuxiliar;

                  fNoDocumento   := GeraNoDocumento(sRecPagBol[1]);

                  if sRecPagBol[1] = 'P' then
                     sContaDoc := sContaCredOp
                  else
                     sContaDoc := sContaDebOp;

                  Documento.Inserir(qryLancaDocumento, iDocumentoOper, sModulo, sPlano, sContaDoc, sCentroCustoCredOp, iMoeda,
                  iUnidNegocOp, Sistema.idEmpresa, iForCli, iTipoDocOp, iPortador, sRecPagBol[1], fNoDocumento,
                  sComplementoOp, sDataLanc, sDataVenc, sDataVenc{DataProgramada=DataVencimento}, sStatus,
                  iNumFatura, sOperacao, Sistema.idUsuario, iSubContaCredOp, -1, '', '', False,
                   -1, -1, -1);

               end;

               if ( (bAchouOperacao) and (bLancaCAPCAROper) and (sRecPagNaoOp <> 'N') ) then begin

                  if sRecPagBol <> sRecPagNaoOp then
                     fVlrOper := - fVlrOper;

               // Cria Rateio

                  Documento.Rateio.Inserir(  iDocumentoOper, sTipoRecDesBol, sRecPagBol[1], sCentroResponOp,
                  Sistema.idEmpresa, fVlrOper, 0, Sistema.idUsuario, iUnidNegocOp, -1, '',
//                   -1, -1, -1);
                  dtmOperComum.QryCarteira.FieldByName('IDPATROCINADORA').AsInteger,
                  dtmOperComum.QryParamInvest.FieldByName('IDPROGRAMA').AsInteger,
                  dtmOperComum.QryCarteira.FieldByName('IDPLANOPREV').AsInteger);

                  fVlrLiquido := fVlrLiquido + fVlrOper;
               End;

               // Trata Despesas Internas

               qryDespOper := dtmOperComum.qryDespNegXTipoOper;

               with qryDespOper do begin
                  Close;
                  if not(Prepared) then Prepare;
                  ParamByName('TIPOINVEST').AsInteger    := iTipoInvest;
                  ParamByName('TIPOOERACAO').AsInteger   := iTipoOperacao;
                  Open;

                  While Not Eof Do Begin

                     iTipoDespesa     := FieldByName('IDTIPODESPINVEST').AsInteger;
                     iTipoDocDs       := FieldByName('CODTIPDOC').AsInteger;
                     bContabDesp      := FieldByName('FLGGERACONTAB').AsInteger = 1;
                     bLancaCAPCARDesp := FieldByName('FLGGERACAPCAR').AsInteger = 1;
                     sRecPagDs        := FieldByName('RECPAG').AsString;

                     If (iTipoDespesa = -4) or (iTipoDespesa = -5) then
                        BuscaValorAContabilizar(iIdHistCartInvLucro, iTipoDespesa,iTipoInvest, bVenda, fVlrDesp)
                     else
                        BuscaValorAContabilizar(iIdHistCartInv, iTipoDespesa,iTipoInvest, bVenda, fVlrDesp);

// Despreza Lucro na Venda quando valor Lucro é negativo, e Prejuizo na Venda quando
// Lucro é positivo.
{                     If ((iTipoDespesa = -4) and (fVlrDesp < 0)) or
                        ((iTipoDespesa = -5) and (fVlrDesp > 0 )) then begin

                        Next;
                        Continue;
                     End;
}
                     // só vai adiante se for necessário fazer algum tipo de lançamento (Contábil ou CAP/CAR)...
                     if ( (bContabDesp) or (bLancaCAPCARDesp) ) then begin

                        if fVlrDesp <> 0 then begin

                           // verifica se já existe transação em andamento; se não houver, inicia uma
                           if not(dtmBaseDados.dbBaseDados.InTransaction) then begin
                              bTransacao := True;
                              StartTransacao;
                           end;

            // @X Busca da PadrLancContInv p/ fazer os lançamentos ---------------------------------------------

                           // Usa valor absoluto do prejuizo para buscar contabilizaçao
                           If (iTipoDespesa = -5) then
                              fVlrDesp := - fVlrDesp;

                           // Verifica o Padrão de Lançamento mais adequado
                           iAchouPadrao := OperComum.BuscaPadrLanc(iEmpresaProp, iTipoInvest, iTipoOperacao, iTipoDespesa,
                                     iInvestimento, iCarteira, fVlrDesp, sTipoTitulo, 'DOP', iPlanoDs, iSubContaDebDs,
                                     iSubContaCredDs, iUnidNegocDs, sContaDebDs, sContaCredDs, sCentroCustoDebDs,
                                     sCentroCustoCredDs, sCentroResponDs, sTipoRecDesDs, sTipoPerDs, sHistoricoDs,
                                     sRecPagNaoDs);

                           bAchouDespesa := (iAchouPadrao = 0);

                           // Volta valor do prejuizo
                           If (iTipoDespesa = -5) then
                              fVlrDesp := - fVlrDesp;

                           // Modula o valor da despesa
                           fVlrDespAbs := abs(fVlrDesp);

                           // @X Chamada às funções de integração Contábil e Financeira ---------------------------------------

                           if (bContabDesp) and (bAchouDespesa) then begin

                              if iPlanilhaOper = -1 then iPlanilhaOper := 0;
                              //iPlanilhaOper := 0;

                              sHistoricoDs := trim(sHistoricoDs) + '  ' +
                                              trim(dtmOperComum.QryInvestimento.FieldByName('DESCINVESTIMENTO').AsString);
                              if iTipoInvest = 1 then  // pega Lote da aplicação
                                 sHistoricoDs := trim(sHistoricoDs) + '  ' + trim(sLote)
                              else                     // pega Lote da operação
                                 sHistoricoDs := trim(sHistoricoDs) + '  ' + trim(sHistCapCar);

                              if not(LancamentoContabil(iEmpresaProp, iModuloOrigem, iPlanoDs, iSubContaDebDs,
                                 iSubContaCredDs, iUnidNegocDs, iForCli, iPlanoPrev, iPatro, sContaDebDs, sContaCredDs, sCentroCustoDebDs,
                                 sCentroCustoCredDs, sHistoricoDs, sTipoPerDs, sRecPagDs, dDataOper, fVlrDespAbs,
                                 bMostraMsg, iPlanilhaOper, sMensErro) )
                                 then Result := -6; // não foi possível efetuar o lançamento contábil

                           end;

                           // se é para ser feita contabilização e esta tiver sido efetuada com sucesso,
                           // ou se não é necessário contabilizar
                           if ( (bLancaCAPCARDesp) and (sRecPagNaoDs <> 'N') ) then begin
                              if ( ((bContabDesp) and (Result = 0)) or (not(bContabDesp)) ) then begin

                                 if iDocumentoOper = -1 then begin

                                    qryAuxiliar := dtmOperComum.qryAuxiliar;

                                    if sRecPagBol = '' then
                                       sRecPagBol := sRecPagNaoDs;

                                    if Trim(sTipoRecDesBol) = '' then
                                       sTipoRecDesBol := sTipoRecDesDs;

                                    // gera o identificador incremental da tabela DOCUMENTO
                                    iDocumentoOper := Documento.GetCodigo(qryAuxiliar);
                                    iPortador      := -1;

                                    sModulo     := IntToStr(iModuloOrigem);

                                    sDataLanc   := DateToStr(dDataOper);
                                    sDataVenc   := DateToStr(dDataVenc);

                                    qryLancaDocumento := dtmOperComum.qryLancaDocumento;
                                    qryAuxiliar       := dtmOperComum.qryAuxiliar;

                                    fNoDocumento   := GeraNoDocumento(sRecPagBol[1]);

                                    if sContaCredOp = '' then begin
                                       sContaCredOp := sContaCredDs;
                                       sContaDebOp  := sContaDebDs;
                                    end;

                                    if sRecPagBol[1] = 'P' then
                                       sContaDoc := sContaCredOp
                                    else
                                       sContaDoc := sContaDebOp;

                                    Documento.Inserir(qryLancaDocumento, iDocumentoOper, sModulo, sPlano, sContaDoc, sCentroCustoCredDs, iMoeda,
                                    iUnidNegocDs, Sistema.idEmpresa, iForCli, iTipoDocDs, iPortador, sRecPagBol[1], fNoDocumento,
                                    sComplementoDs, sDataLanc, sDataVenc, sDataVenc{DataProgramada=DataVencimento}, sStatus,
                                    iNumFatura, sOperacao, Sistema.idUsuario, iSubContaCredDs, -1, '', '', False,
                                     -1, -1, -1);

                                 end;

                                 if sRecPagBol <> sRecPagNaoDs then
                                    fVlrDesp := - fVlrDesp;

                              // Cria Rateio

                                 Documento.Rateio.Inserir( iDocumentoOper, sTipoRecDesBol, sRecPagBol[1], sCentroResponDs,
                                 Sistema.idEmpresa, fVlrDesp, 0, Sistema.idUsuario, iUnidNegocDs, -1, '',
//                                  -1, -1, -1);
                                 dtmOperComum.QryCarteira.FieldByName('IDPATROCINADORA').AsInteger,
                                 dtmOperComum.QryParamInvest.FieldByName('IDPROGRAMA').AsInteger,
                                 dtmOperComum.QryCarteira.FieldByName('IDPLANOPREV').AsInteger);

                                 fVlrLiquido := fVlrLiquido + fVlrDesp;
                              End;
                           End;
                        End;
                     End;
                     Next;
                  End;
               end;

               // Despesas cadastradas pelo Usuário

               qryDespOper := dtmOperComum.qryDespesasOPeracao;

               with qryDespOper do begin
                  Close;
                  if not(Prepared) then Prepare;
                  ParamByName('IDOPERACAOINVEST').AsInteger := iOperacao;
                  Open;
               End;

               While Not qryDespOper.Eof Do Begin

                 iTipoDespesa := qryDespOper.FieldByName('IDTIPODESPINVEST').AsInteger;
                 fVlrDesp     := qryDespOper.FieldByName('VLRDESPOPER').AsFloat;


                  with dtmOperComum.qryDespXTipoOper do begin
                     Close;
                     if not(Prepared) then Prepare;
                     ParamByName('TIPOINVEST').AsInteger    := iTipoInvest;
                     ParamByName('TIPOOERACAO').AsInteger   := iTipoOperacao;
                     ParamByName('TIPODESPESA').AsInteger   := iTipoDespesa;
                     Open;

                     iTipoDocDs       := FieldByName('CODTIPDOC').AsInteger;
                     bContabDesp      := FieldByName('FLGGERACONTAB').AsInteger = 1;
                     bLancaCAPCARDesp := FieldByName('FLGGERACAPCAR').AsInteger = 1;
                     sRecPagDs        := FieldByName('RECPAG').AsString;
                  end;

                  // só vai adiante se for necessário fazer algum tipo de lançamento (Contábil ou CAP/CAR)...
                  if ( (bContabDesp) or (bLancaCAPCARDesp) ) then begin

                     if fVlrDesp <> 0 then begin

                        // verifica se já existe transação em andamento; se não houver, inicia uma
                        if not(dtmBaseDados.dbBaseDados.InTransaction) then begin
                           bTransacao := True;
                           StartTransacao;
                        end;

         // @X Busca da PadrLancContInv p/ fazer os lançamentos ---------------------------------------------

                        // Verifica o Padrão de Lançamento mais adequado
                        iAchouPadrao := OperComum.BuscaPadrLanc(iEmpresaProp, iTipoInvest, iTipoOperacao, iTipoDespesa,
                                  iInvestimento, iCarteira, fVlrDesp, sTipoTitulo, 'DOP', iPlanoDs, iSubContaDebDs,
                                  iSubContaCredDs, iUnidNegocDs, sContaDebDs, sContaCredDs, sCentroCustoDebDs,
                                  sCentroCustoCredDs, sCentroResponDs, sTipoRecDesDs, sTipoPerDs, sHistoricoDs,
                                  sRecPagNaoDs);

                        bAchouDespesa := (iAchouPadrao = 0);

                        if not bAchouDespesa then begin
                          iSubContaDebDs     := iSubContaDebOp;
                          iSubContaCredDs    := iSubContaCredOp;
                          iUnidNegocDs       := iUnidNegocOp;
                          iTipoDocDs         := iTipoDocOp;
                          sContaCredDs       := sContaCredOp;
                          sContaDebDs        := sContaDebOp;
                          sCentroCustoCredDs := sCentroCustoCredOp;
                          sCentroCustoDebDs  := sCentroCustoDebOp;
                          sCentroResponDs    := sCentroResponOp;
                          sRecPagNaoDs       := sRecPagNaoOp;
                          sTipoPerDs         := sTipoPerOp;
                          sRecPagDs          := sRecPagOp;
                          sTipoRecDesDs      := sTipoRecDesOp;
                          sComplementoDs     := sComplementoOp;
                          sTipoParcelaDs     := sTipoParcelaOp;
                          sHistoricoDs       := 'Despesa de '+sHistoricoOp;
                          // se o valor da Despesa for negativo, inverte as contas
                          if fVlrDesp < 0 then begin
                             sContaAux    := sContaDebDs;
                             sContaDebDs  := sContaCredDs;
                             sContaCredDs := sContaAux;
                          end;

                        End;

                        // Modula o valor da despesa
                        fVlrDespAbs := abs(fVlrDesp);


      // @X Chamada às funções de integração Contábil e Financeira ---------------------------------------

                        if bContabDesp then begin

                           if iPlanilhaOper = -1 then iPlanilhaOper := 0;
//                         iPlanilhaOper := 0;

                           sHistoricoDs := trim(sHistoricoDs) + '  ' +
                                           trim(dtmOperComum.QryInvestimento.FieldByName('DESCINVESTIMENTO').AsString);
                           if iTipoInvest = 1 then  // pega Lote da aplicação
                              sHistoricoDs := trim(sHistoricoDs) + '  ' + trim(sLote)
                           else                     // pega Lote da operação
                              sHistoricoDs := trim(sHistoricoDs) + '  ' + trim(sHistCapCar);

                           if not(LancamentoContabil(iEmpresaProp, iModuloOrigem, iPlanoDs, iSubContaDebDs,
                           iSubContaCredDs, iUnidNegocDs, iForCli, iPlanoPrev, iPatro, sContaDebDs, sContaCredDs, sCentroCustoDebDs,
                           sCentroCustoCredDs, sHistoricoDs, sTipoPerDs, sRecPagDs, dDataOper, fVlrDespAbs,
                           bMostraMsg, iPlanilhaOper, sMensErro) )
                           then Result := -6; // não foi possível efetuar o lançamento contábil

                        end;

                        // se é para ser feita contabilização e esta tiver sido efetuada com sucesso,
                        // ou se não é necessário contabilizar
                        if ( (bLancaCAPCARDesp) and (sRecPagNaoDs <> 'N') ) then begin
                           if ( ((bContabDesp) and (Result = 0)) or (not(bContabDesp)) ) then begin

                              if iDocumentoOper = -1 then begin

                                 if sRecPagBol = '' then
                                    sRecPagBol := sRecPagNaoDs;

                                 if Trim(sTipoRecDesBol) = '' then
                                    sTipoRecDesBol := sTipoRecDesDs;

                                 qryAuxiliar := dtmOperComum.qryAuxiliar;
                                 // gera o identificador incremental da tabela DOCUMENTO
                                 iDocumentoOper := Documento.GetCodigo(qryAuxiliar);
                                 iPortador      := -1;

                                 sModulo     := IntToStr(iModuloOrigem);

                                 sDataLanc   := DateToStr(dDataOper);
                                 sDataVenc   := DateToStr(dDataVenc);

                                 qryLancaDocumento := dtmOperComum.qryLancaDocumento;
                                 qryAuxiliar       := dtmOperComum.qryAuxiliar;

                                 fNoDocumento   := GeraNoDocumento(sRecPagBol[1]);

                                 if sContaCredOp = '' then begin
                                    sContaCredOp := sContaCredDs;
                                    sContaDebOp  := sContaDebDs;
                                 end;

                                 if sRecPagBol[1] = 'P' then
                                    sContaDoc := sContaCredOp
                                 else
                                    sContaDoc := sContaDebOp;

                                 Documento.Inserir(qryLancaDocumento, iDocumentoOper, sModulo, sPlano, sContaDoc, sCentroCustoCredDs, iMoeda,
                                 iUnidNegocDs, Sistema.idEmpresa, iForCli, iTipoDocDs, iPortador, sRecPagBol[1], fNoDocumento,
                                 sComplementoDs, sDataLanc, sDataVenc, sDataVenc{DataProgramada=DataVencimento}, sStatus,
                                 iNumFatura, sOperacao, Sistema.idUsuario, iSubContaCredDs, -1, '', '', False,
                                 -1, -1, -1);

                              end;

                              if sRecPagBol <> sRecPagNaoDs then
                                 fVlrDesp := - fVlrDesp;

                           // Cria Rateio

                              Documento.Rateio.Inserir( iDocumentoOper, sTipoRecDesBol, sRecPagBol[1], sCentroResponDs,
                              Sistema.idEmpresa, fVlrDesp, 0, Sistema.idUsuario, iUnidNegocDs, -1, '',
//                              -1, -1, -1);
                              dtmOperComum.QryCarteira.FieldByName('IDPATROCINADORA').AsInteger,
                              dtmOperComum.QryParamInvest.FieldByName('IDPROGRAMA').AsInteger,
                              dtmOperComum.QryCarteira.FieldByName('IDPLANOPREV').AsInteger);

                              fVlrLiquido := fVlrLiquido + fVlrDesp;
                           End;
                        End;
                     End;
                  End;
                  qryDespOper.Next;
               End;

            End;

            if ((iDocumentoOper <> -1) and ((fVlrLiquido <> 0) or (fTotalLiquido <> 0))) then begin

               if sRecPagBol[1] = 'P' then
                  sDebCre := 'C'
               else
                  sDebCre := 'D';

               if bCriaLancto then begin

                  if fTotalLiquido <> 0 then
                     fVlrLancto := fTotalLiquido
                  else
                     fVlrLancto := fVlrLiquido;

                  // gera o identificador incremental da tabela LANCAMENTO
                  iNumLancamento := Documento.GerarNumLancto(qryAuxiliar, iDocumentoOper);

                  Documento.CriarLanctoDoc(qryLancaDocumento, iDocumentoOper, iNumLancamento, -1{CodAlterador},
                  iPlanilhaOper, sDataLanc, fVlrLancto, 0, -1{Estorno}, sDebCre, sOperacao, sHistCapCar,
                  Sistema.idUsuario, False{bContabiliza}, -1, '');

                  bCriaLancto := false;
               end;

            end;

            // Atualiza Plano, Planilha e Documento no HistCartInv
            if ((iIdHistCartInv <> 0) and (Result = 0) and
               ((iPlanilhaOper <> -1) or (iDocumentoOper <> -1))) then begin

               if iPlano = -1 then
                  iPlano := iPlanoDs;

               with qryLocal do
               begin
                  Close;
                  SQL.Clear;
                  SQL.Add(' UPDATE HISTCARTINV SET ');

                  If iPlanilhaOper <> -1 then begin
                     SQL.Add(' PLANO     = ' + QuotedStr(IntToStr(iPlano))    + ', ');
                     SQL.Add(' PLNCODIGO = ' + QuotedStr(IntToStr(iPlanilhaOper)) + ', ');
                  end else begin
                     SQL.Add(' PLANO     = '''' ,');
                     SQL.Add(' PLNCODIGO = '''' ,');
                  end;

                  If iDocumentoOper <> -1 then begin
                     SQL.Add(' CODDOCUMENTO = ' + QuotedStr(IntToStr(iDocumentoOper)));
                  end else begin
                     SQL.Add(' CODDOCUMENTO = '''' ');
                  end;

                  SQL.Add(' WHERE (IDHISTCARTINV = '+
                                  QuotedStr(IntToStr(iIdHistCartInv))+')');
                  Prepare;
                  ExecSQL;
                  UnPrepare;
                  Close;
               end;
            end;

            // Tudo havendo corrido bem...
            if ( (bTransacao) and (dtmBaseDados.dbBaseDados.InTransaction) ) then CommitTransacao;

         end;

         if (Result = 0) and (bLancaCAPCAROper) and (fVlrLiquido = 0) then
            Result := -7;// Não foi possível efetuar o lançamento de CAP/CAR.

      except
         if bTransacao then RollBackTransacao;
         Screen.Cursor := crDefault;

         Result := -3; // Erro de gravação
         if bMostraMsg then Raise;
      end;

      // Atualiza Plano, Planilha para Atualização de IR Litígio
      if (((iTipoOperacao = -7) or (iTipoOperacao = -8)) and (iPlanilhaOper <> -1)) then
      begin
         Try
         begin
            if not(dtmBaseDados.dbBaseDados.InTransaction) then begin
               bTransacao := True;
               StartTransacao;
            end;
            with qryLocal do
            begin
               Close;
               SQL.Clear;
               SQL.Add(' UPDATE SALDOIRLITIGIO SET ');
               SQL.Add(' PLANO     = ' + QuotedStr(IntToStr(iPlano))    + ', ');
               SQL.Add(' PLNCODIGO = ' + QuotedStr(IntToStr(iPlanilhaOper)));
               Sql.add(' WHERE (DATAATUALIZACAO = TO_DATE('''+DateToStr(dDataOper)+''',''DD/MM/YYYY'')) AND ');
               SQL.Add('       (IDIRLITIGIO IN ');
               SQL.Add('       (SELECT IR.IDIRLITIGIO FROM IRLITIGIO IR,  ACAO AC, TITRENFIXA TR ');
               SQL.Add('        WHERE  (AC.CODTIPOACAO    = ' + QuotedStr(sTipoTitulo) + '  OR  ');
               SQL.Add('                TR.CODTIPRENFIXA  = ' + QuotedStr(sTipoTitulo) + ') AND ');
               SQL.Add('                IR.IDINVESTIMENTO = AC.IDACAO(+) AND');
               SQL.Add('                IR.IDINVESTIMENTO = TR.IDTITRENFIXA(+))) ');
               Prepare;
               ExecSQL;
               UnPrepare;
               Close;
               if ( (bTransacao) and (dtmBaseDados.dbBaseDados.InTransaction) ) then CommitTransacao;
            end;
         end;
         except
            if bTransacao then RollBackTransacao;
            Screen.Cursor := crDefault;

            Result := -3; // Erro de gravação
            if bMostraMsg then Raise;
         end;
      end;
   finally
      if ( (Result < 0) and (bTransacao) and (dtmBaseDados.dbBaseDados.InTransaction) ) then RollBackTransacao;
      Screen.Cursor := crDefault;
      dtmOperComum.qryParamInvest.Close;
      dtmOperComum.qryInvestimento.Close;
      dtmOperComum.qryCarteira.Close;
      dtmOperComum.qryTipoOperacao.Close;
      dtmOperComum.qryDespNegXTipoOper.Close;
      dtmOperComum.qryDespesasOPeracao.Close;
      dtmOperComum.qryDespXTipoOper.Close;
      QryLocal.Free;
   end;
end;

//--------------------------------------------------------------------------------------------------
//    LancaAtualizacao: Função que efetua o par de lançamentos Contábeis associados a uma
//                      Atualização de Cotação de um Investimento
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       iEmpresaProp      :  id da Empresa Proprietária                      (Sistema.idEmpresa)
//       iModuloOrigem     :  id do Módulo que vai gerar o lançamento         (Sistema.idModulo)
//       iTipoInvest       :  id do Tipo de Investimento, tabela TipoInvest   (idTipoInvest)
//       iCarteira         :  id da Carteira
//       sTipoTitulo       :  código do Tipo de Título, tabela CodTipoTitulo  (CodTipTitulo)
//       fVlrAtu           :  valor da operação na moeda corrente
//       dDataAtu          :  data da operação
//       bMostraMsg        :  True  - mostra mensagens
//                            False - não mostra mensagens
//
//    A função retorna também
//       iPlanilhaAtu      :  planilha onde foram efetuados os lançamentos contábeis
//       sHistoricoAtu     :  histórico da Atualização segundo PadrLancContInv
//       sMensErro         :  mensagem de erro devolvida pela LancaContab
//
//    Códigos de retorno (controle de erro):
//        0 : Lançamento(s) realizados com sucesso
//       -2 : Operação com valor igual a ZERO
//       -3 : Erro de gravação
//       -4 : Erro: ambigüidade no Padrão de Lançamento
//       -5 : Erro: nenhum Padrão de Lançamento que atenda os parâmetros passados
//       -6 : Erro: não foi possível efetuar o lançamento contábil
//
//--------------------------------------------------------------------------------------------------
function TOperComum.LancaAtualizacao(iEmpresaProp, iModuloOrigem, iTipoInvest, iCarteira: integer;
sTipoTitulo: string; fVlrAtu: currency; dDataAtu: TDateTime; bMostraMsg: boolean;
var iPlanilhaAtu: integer; var sHistoricoAtu, sMensErro: string): shortint;
var
   iPlano, iSubContaCred, iSubContaDeb, iUnidNegoc : integer;
   sContaCred, sContaDeb, sCentroCustoCred, sCentroCustoDeb, sCentroRespon, sRecPagNao,
   sRecPag, sTipoRecDes, sTipoPer : string;
   bTransacao: boolean;
begin
   Result := 0;
   Screen.Cursor  := crHourGlass;
   bTransacao     := False; // a priori, não é necessário que se inicie uma transação

   try

      try

         if fVlrAtu <> 0 then begin

            // verifica se já existe transação em andamento; se não houver, inicia uma
            if not(dtmBaseDados.dbBaseDados.InTransaction) then begin
               bTransacao := True;
               StartTransacao;
            end else begin
               bTransacao := False;
            end;

// @X Busca da PadrLancContInv p/ fazer os lançamentos ---------------------------------------------

            // Verifica o Padrão de Lançamento mais adequado
            Result := OperComum.BuscaPadrLanc(iEmpresaProp, iTipoInvest, 0{iTipoOperacao}, 0{iTipoDespesa},
                      -1{iInvestimento}, iCarteira, fVlrAtu, sTipoTitulo, 'ATU', iPlano, iSubContaDeb,
                      iSubContaCred, iUnidNegoc, sContaDeb, sContaCred, sCentroCustoDeb, sCentroCustoCred,
                      sCentroRespon, sTipoRecDes, sTipoPer, sHistoricoAtu, sRecPagNao);

            if Result = 0 then begin

               // Modula o valor da operação
               fVlrAtu := abs(fVlrAtu);


// @X Chamada às funções de integração Contábil ----------------------------------------------------

               if iPlanilhaAtu = -1 then iPlanilhaAtu := 0;

               if not(LancamentoContabil(iEmpresaProp, iModuloOrigem, iPlano, iSubContaDeb,
               iSubContaCred, iUnidNegoc, -1, -1, -1, sContaDeb, sContaCred, sCentroCustoDeb,
               sCentroCustoCred, sHistoricoAtu, sTipoPer, sRecPag,  dDataAtu, fVlrAtu, bMostraMsg,
               iPlanilhaAtu, sMensErro) ) then Result := -6; // não foi possível efetuar o lançamento contábil


// @X Finalmentes (integração já foi disparada, com sucesso ou não) --------------------------------

               // se tudo correu bem...
               if ( (Result = 0) and (bTransacao) and (dtmBaseDados.dbBaseDados.InTransaction) ) then CommitTransacao;

            end;

         end else begin
            Result := -2; // Operação com valor igual a ZERO
         end;

      except
         if bTransacao then RollBackTransacao;
         Screen.Cursor := crDefault;

         Result := -3; // Erro de gravação
         if bMostraMsg then Raise;
      end;

   finally
      if ( (Result < 0) and (bTransacao) and (dtmBaseDados.dbBaseDados.InTransaction) ) then RollBackTransacao;
      Screen.Cursor := crDefault;
   end;
end;





//--------------------------------------------------------------------------------------------------
//    LancamentoContabil:  Função que efetua cada par de lançamentos contábeis
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       iEmpresaProp      :  id da Empresa Proprietária                      (Sistema.idEmpresa)
//       iModuloOrigem     :  id do Módulo que vai gerar o lançamento         (Sistema.idModulo)
//       iPlano            :  plano de contas da empresa em questão           (IntegraBack.Plano)
//       iSubContaD        :  sub-conta para débito
//       iSubContaC        :  sub-conta para crédito
//       iUnidNegoc        :  atividade/projeto (unidade de negócio) para crédito
//       iForCli           :  id do Fornecedor ou Cliente (para buscar SubConta)
//       sContaContabilD   :  conta contábil para débito
//       sContaContabilC   :  conta contábil para crédito
//       sCentroCustoD     :  centro de custo para débito
//       sCentroCustoC     :  centro de custo para crédito
//       sTipoPer          :  Tipo de Operação (TIPCODIGO, tabela TIPOPER)
//       sRecPag           :  indica se é a Operação/Despesa é a Pagar (Fornecedor) ou Receber (Cliente)
//       dDataLanc         :  data do lançamento
//       fValorLanc        :  valor do lançamento
//       bMostraMsg        :  True  - mostra mensagens
//                            False - não mostra mensagens
//
//    A função retorna também
//       iPlanilha         :  planilha onde foram efetuados os lançamentos contábeis
//       sMensContab       :  mensagem de erro devolvida pela LancaContab
//
//--------------------------------------------------------------------------------------------------
function TOperComum.LancamentoContabil(iEmpresaProp, iModuloOrigem, iPlano, iSubContaD, iSubContaC,
iUnidNegoc, iForCli, iPlanoPrev, iPatro: integer; sContaD, sContaC, sCentroCustoD, sCentroCustoC, sHistorico, sTipoPer,
sRecPag: string; dDataLanc: TDateTime; fValorLanc: currency; bMostraMsg: boolean; var iPlanilha: integer;
var sMensContab: string): boolean;
var
   sHist1, sHist2, sHist3, sHist4, sHist5, sMascaraPlano: string;
   sModulo, sUnidNegoc, sObrigaCC, sNome, sSubContaD, sSubContaC, sDataLanc, sNoDoc : string;
   iTestaPeriodo: integer;
   bPermiteSubConta: boolean;
   liExercicio, liPeriodo        : integer;
begin
   Result := False;
   Screen.Cursor := crHourGlass;

   sDataLanc     := DateToStr(dDataLanc);
   sModulo       := IntToStr(iModuloOrigem);
   sUnidNegoc    := IntToStr(iUnidNegoc);
   iTestaPeriodo := 0;
   liExercicio   := 0;
   liPeriodo     := 0;

   // testa o período junto à Contabilidade

   {@A Verificar as variáveis de referência - liExercicio, liPeriodo}

   iTestaPeriodo := TestaPeriodo(True, 'BASEDADOS', sDataLanc, sModulo, liExercicio, liPeriodo, iEmpresaProp, sMensContab);
   if iTestaPeriodo = 0 then begin

      sMascaraPlano := GetMascaraPlano(iPlano);

      sNoDoc := ''; // não há previsão...

      // divide o histórico em sub-históricos se exceder a quantidade de caracteres
      FuncaoGeral.ArrumaHistorico(sHistorico, sHist1, sHist2, sHist3, sHist4, sHist5);

      // verifica se é obrigatório o preenchimento dos centros de custo; se não for, os passa em branco
      FuncaoGeral.TestaContaCC(False, iPlano, sContaD, sObrigaCC, sNome, sSubContaD);
      if sObrigaCC <> 'S' then sCentroCustoD := '';
      FuncaoGeral.TestaContaCC(False, iPlano, sContaC, sObrigaCC, sNome, sSubContaC);
      if sObrigaCC <> 'S' then sCentroCustoC := '';

      // verifica se deve passar a SubConta e decide qual
      with dtmOperComum.qryVerificaConta do begin
         Close;
         if not(Prepared) then Prepare;
         ParamByName('PLANO').AsInteger  := iPlano;
         ParamByName('CONTA').AsString   := sContaD;
         Open;
         bPermiteSubConta := FieldByName('PLASUBCONTA').AsString = 'S';
         Close;
      end;

      if bPermiteSubConta then begin
         if iSubContaD > 0 then begin
            sSubContaD   := IntToStr(iSubContaD);
         end else begin
            case sRecPag[1] of
               'P':
               with dtmOperComum.qryBuscaForn do begin
                  Close;
                  if not(Prepared) then Prepare;
                  ParamByName('EMPRESAFORN').AsInteger   := iEmpresaProp;
                  ParamByName('FORCLI').AsInteger        := iForCli;
                  ParamByName('PLANO').AsInteger         := iPlano;
                  Open;
                  if not(FieldByName('CODSUBCONTA').isNULL) then sSubContaD := IntToStr(FieldByName('CODSUBCONTA').AsInteger);
                  Close;
               end;
               'R':
               with dtmOperComum.qryBuscaCli do begin
                  Close;
                  if not(Prepared) then Prepare;
                  ParamByName('EMPRESAFORN').AsInteger   := iEmpresaProp;
                  ParamByName('FORCLI').AsInteger        := iForCli;
                  ParamByName('PLANO').AsInteger         := iPlano;
                  Open;
                  if not(FieldByName('CODSUBCONTA').isNULL) then sSubContaD := IntToStr(FieldByName('CODSUBCONTA').AsInteger);
                  Close;
               end;
            end;
         end;
      end else begin
         sSubContaD  := '';
      end;

      with dtmOperComum.qryVerificaConta do begin
         Close;
         if not(Prepared) then Prepare;
         ParamByName('PLANO').AsInteger  := iPlano;
         ParamByName('CONTA').AsString   := sContaC;
         Open;
         bPermiteSubConta := FieldByName('PLASUBCONTA').AsString = 'S';
         Close;
      end;

      if bPermiteSubConta then begin
         if iSubContaC > 0 then begin
            sSubContaC   := IntToStr(iSubContaC);
         end else begin
            case sRecPag[1] of
               'P':
               with dtmOperComum.qryBuscaForn do begin
                  Close;
                  if not(Prepared) then Prepare;
                  ParamByName('EMPRESAFORN').AsInteger   := iEmpresaProp;
                  ParamByName('FORCLI').AsInteger        := iForCli;
                  ParamByName('PLANO').AsInteger         := iPlano;
                  Open;
                  if not(FieldByName('CODSUBCONTA').isNULL) then sSubContaC := IntToStr(FieldByName('CODSUBCONTA').AsInteger);
                  Close;
               end;
               'R':
               with dtmOperComum.qryBuscaCli do begin
                  Close;
                  if not(Prepared) then Prepare;
                  ParamByName('EMPRESAFORN').AsInteger   := iEmpresaProp;
                  ParamByName('FORCLI').AsInteger        := iForCli;
                  ParamByName('PLANO').AsInteger         := iPlano;
                  Open;
                  if not(FieldByName('CODSUBCONTA').isNULL) then sSubContaC := IntToStr(FieldByName('CODSUBCONTA').AsInteger);
                  Close;
               end;
            end;
         end;
      end else begin
         sSubContaC  := '';
      end;

      Screen.Cursor  := crHourGlass;

   {@A Verificar as variáveis de referência - liExercicio, liPeriodo}

      iPlanilha      := LancaContab(True, 'BASEDADOS', sDataLanc, sModulo, '1', 'D',
                        '', '', '', '', '', '', '', '', '', '',   // tudo em branco mesmo
                        sNoDoc,                                   // número do documento
                        sHist1, sHist2, sHist3, sHist4, sHist5,   // histórico pode extrapolar para os Hist 2-5 (Histórico ?)
                        sTipoPer,                                 // Passar o tipo de operacao conforme cadastrada na tabela tipoper
                        '', '', sCentroCustoC, sContaC, liExercicio, liPeriodo, iEmpresaProp,
                        Sistema.idUsuario, iPlano, fValorLanc, 0, 0, 0, 0, 0, 0, 0, 0, sUnidNegoc,
                        False {bJunta}, 0, 0, '', sSubContaC, ''{sCodHist}, '', iPlanilha, sMensContab,
                        sMascaraPlano, True, 0,
//                        -1, -1, false);
                        iPlanoPrev,                       // Plano Previdenciário
                        iPatro,                           // Patrocinadora
                        Sistema.UsaPlanoPatro);           // Empresa usa Plano/Patrocinadora
      iPlanilha      := LancaContab(True, 'BASEDADOS', sDataLanc, sModulo, '0', 'D',
                        '', '', '', '', '', '', '', '', '', '',   // tudo em branco mesmo
                        sNoDoc,                                   // número do documento
                        sHist1, sHist2, sHist3, sHist4, sHist5,   // histórico pode extrapolar para os Hist 2-5 (Histórico ?)
                        sTipoPer,                                 // Passar o tipo de operacao conforme cadastrada na tabela tipoper
                        sCentroCustoD, sContaD, '', '', liExercicio, liPeriodo, iEmpresaProp,
                        Sistema.idUsuario, iPlano, fValorLanc, 0, 0, 0, 0, 0, 0, 0, 0, sUnidNegoc,
                        False {bJunta}, 0, 0, sSubContaD, '', ''{sCodHist}, '', iPlanilha, sMensContab,
                        sMascaraPlano, True, 0,
//                         -1, -1, false);
                        iPlanoPrev,                       // Plano Previdenciário
                        iPatro,                           // Patrocinadora
                        Sistema.UsaPlanoPatro);           // Empresa usa Plano/Patrocinadora

      if iPlanilha <= 0 then begin
         // integração com contabilidade falhou; exibe a mensagem de erro correspondente
         Screen.Cursor := crDefault;
         if bMostraMsg then MensagemErroContab(iPlanilha);

      end else begin
         // se tudo certo...
         Result := True;
      end;

   end else begin
      // TestaPeriodo falhou; exibe a mensagem de erro correspondente
      Screen.Cursor := crDefault;
      if bMostraMsg then MensagemErroPeriodo(iTestaPeriodo);
   end;

   Screen.Cursor := crDefault;
end;





//--------------------------------------------------------------------------------------------------
//    LancamentoCAPCAR:   Função que efetua o lançamento de Contas a Pagar / Receber
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
function TOperComum.LancamentoCAPCAR(iEmpresaProp, iModuloOrigem, iPlano, iPlanilha, iSubConta,
iCodTipDoc, iUnidNegoc, iForCli, iMoeda: integer; fVlrOM, fVlrLanc: currency; sCentroRespon, sTipoRecDes,
sConta, sCentroCusto, sDebCre, sComplementoDoc, sTipoParcelamento: string; dDataLanc, dDataVenc: TDateTime;
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

      Documento.Inserir(qryLancaDocumento, iDocumento, sModulo, sPlano, sConta, sCentroCusto, iMoeda,
      iUnidNegoc, Sistema.idEmpresa, iForCli, iCodTipDoc, iPortador, cRecPagNao, fNoDocumento,
      sComplementoDoc, sDataLanc, sDataVenc, sDataVenc{DataProgramada=DataVencimento}, sStatus,
      iNumFatura, sOperacao, Sistema.idUsuario, iSubConta, -1, '', '', False,
       -1, -1, -1);

      // gera o identificador incremental da tabela LANCAMENTO
      iNumLancamento := Documento.GerarNumLancto(qryAuxiliar, iDocumento);

      Documento.CriarLanctoDoc(qryLancaDocumento, iDocumento, iNumLancamento, -1{CodAlterador},
      iPlanilha, sDataLanc, fVlrLanc, fVlrOM, -1{Estorno}, sDebCre, sOperacao, ''{HistoricoCompl},
      Sistema.idUsuario, False{bContabiliza}, -1, '');

      Documento.Rateio.Inserir(iDocumento, sTipoRecDes, cRecPagNao, sCentroRespon,
      Sistema.idEmpresa, fVlrLanc, fVlrOM, Sistema.idUsuario, iUnidNegoc, -1, '', -1, -1, -1);

      // se conseguiu, retorna...
      Result := True;

   except
      if bMostraMsg then Raise;
//      Raise;
      Result := False;
   end;
end;

//--------------------------------------------------------------------------------------------------
//    Função com o processo de estorno de uma determinada Operação(Finceiro/Tesouraria/Contabilidade)
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros :
//
//       iOperacao      :  id da Operação de Investimento   (idOperacaoInvest)
//       dDataEstorno   :  data do estorno
//
//--------------------------------------------------------------------------------------------------
function TOperComum.ProcEstorna(iDocumento, iPlanilha, iPlano : longint; dDataEstorno: TDateTime;
                                bMostraMsg : boolean) : Boolean;
Var
   sDataEstorno, sMensErro, sMascara   : string;
   iLanc, iCodDocumento, iTestaPeriodo : integer;
   iIdModulo, iIdEmpresa, liExercicio, liPeriodo        : integer;
   bTransacao                    : boolean;
begin
   Result      := True;

   Try
      Try

         // verifica se já existe transação em andamento; se não houver, inicia uma
         if not(dtmBaseDados.dbBaseDados.inTransaction) then begin
            bTransacao := True;
            StartTransacao;
         end else begin
            bTransacao := False;
         end;

         sDataEstorno   := FormatDateTime('dd/mm/yyyy', dDataEstorno);

         // existindo documento, estorna tudo por aí...
         if iDocumento <> -1 then begin

            iLanc             := 0;

            // Faz o Estorno no CAP/CAR e Contab
            Documento.EstornoCAPCAR(sDataEstorno, iDocumento, iLanc, iCodDocumento);

         end else begin

            // senão, estorna só na contabilidade
            if iPlanilha <> -1 then begin

               liExercicio    := 0;
               liPeriodo      := 0;

               iIdModulo  := Sistema.IdModulo;
               iIdEmpresa := Sistema.IdEmpresa;
               // verifica se o estorno pode ser realizado
               iTestaPeriodo  := TestaPeriodo(True, 'BASEDADOS', sDataEstorno,
                                 IntToStr(iIdModulo), liExercicio, liPeriodo,
                                 iIdEmpresa, sMensErro);

               sMascara    := GetMascaraPlano(iPlano);

               if iTestaPeriodo = 0 then begin

                  // faz o estorno contábil
                  if EstornaLanc(bMostraMsg, iPlanilha, 'BASEDADOS', sDataEstorno, liExercicio,
                  liPeriodo, Sistema.IdEmpresa, sMascara) < 1 then
                     Result := False;

               end else begin
                  MensagemErroPeriodo(iTestaPeriodo);
                  Result := False;
               end;

            end;

         end;

      Except
         Screen.Cursor := crDefault;
         if bMostraMsg then Raise;
         Result := False;
      End;
   finally
      if ( (bTransacao) and (dtmBaseDados.dbBaseDados.InTransaction) ) then
         if Result then
            CommitTransacao
         else
            RollBackTransacao;
   end;
End;

//--------------------------------------------------------------------------------------------------
//    Função com o processo de exclui os lançamentos de uma determinada Operação (Finceiro/Tesoura-
//          ria/Contabilidade)
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros :
//
//--------------------------------------------------------------------------------------------------
function TOperComum.ProcExclui(iDocumento, iPlanilha, iPlano : longint;
                               dDataExclusao: TDateTime; bMostraMsg : boolean) : Boolean;
Var
   sDataEstorno, sMensErro, sMascara   : string;
   iTestaPeriodo : integer;
   iIdModulo, iIdEmpresa, liExercicio, liPeriodo        : integer;
   bTransacao                    : boolean;
begin
   Result      := True;

   Try
      Try

         sDataEstorno   := FormatDateTime('dd/mm/yyyy', dDataExclusao);

         liExercicio    := 0;
         liPeriodo      := 0;

         iIdModulo  := Sistema.IdModulo;
         iIdEmpresa := Sistema.IdEmpresa;
         // verifica se o estorno pode ser realizado
         iTestaPeriodo  := TestaPeriodo(True, 'BASEDADOS', sDataEstorno,
                           IntToStr(iIdModulo), liExercicio, liPeriodo,
                           iIdEmpresa, sMensErro);

         if iTestaPeriodo <> 0 then begin
            MensagemErroPeriodo(iTestaPeriodo);
            Result := False;
         end else begin

            // verifica se já existe transação em andamento; se não houver, inicia uma
            if not(dtmBaseDados.dbBaseDados.inTransaction) then begin
               bTransacao := True;
               StartTransacao;
            end else begin
               bTransacao := False;
            end;

            // HistCartinv - Limpa Planilha e Documento
            with dtmOperComum.qryAuxiliar do begin
               Close;
               SQL.Clear;
               SQL.Text := 'UPDATE HISTCARTINV SET PLANO = NULL, PLNCODIGO = NULL, '+
                           'CODDOCUMENTO = NULL WHERE PLNCODIGO = ' + IntToStr(iPlanilha) +
                           ' OR CODDOCUMENTO = ' + IntToStr(iDocumento);
               ExecSQL;
            end;

            // Exclui Documento da Tesouraria
            if iDocumento <> -1 then begin

               with dtmOperComum.qryAuxiliar do begin
                  Close;
                  SQL.Clear;
                  SQL.Text := 'DELETE FROM RECBTOPAGTO WHERE CODDOCUMENTO = ' + IntToStr(iDocumento);
                  ExecSQL;
               end;

               with dtmOperComum.qryAuxiliar do begin
                  Close;
                  SQL.Clear;
                  SQL.Text := 'DELETE FROM RATEIODOCUM WHERE CODDOCUMENTO = ' + IntToStr(iDocumento);
                  ExecSQL;
               end;

               with dtmOperComum.qryAuxiliar do begin
                  Close;
                  SQL.Clear;
                  SQL.Text := 'DELETE FROM LANCTODOCUM WHERE CODDOCUMENTO = ' + IntToStr(iDocumento);
                  ExecSQL;
               end;

               with dtmOperComum.qryAuxiliar do begin
                  Close;
                  SQL.Clear;
                  SQL.Text := 'DELETE FROM DOCUMENTO WHERE CODDOCUMENTO = ' + IntToStr(iDocumento);
                  ExecSQL;
               end;
            end;

            // Exclui Planilha da Contabilidade
            if iPlanilha <> -1 then begin

               with dtmOperComum.qryAuxiliar do begin
                  Close;
                  SQL.Clear;
                  SQL.Text := 'DELETE FROM LANCAMENTO WHERE PLNCODIGO = ' + IntToStr(iPlanilha);
                  ExecSQL;
               end;

               with dtmOperComum.qryAuxiliar do begin
                  Close;
                  SQL.Clear;
                  SQL.Text := 'DELETE FROM PLANILHA WHERE PLNCODIGO = ' + IntToStr(iPlanilha);
                  ExecSQL;
               end;
            end;
         end;

      Except
         Screen.Cursor := crDefault;
         if bMostraMsg then Raise;
         Result := False;
      End;
   finally
      if ( (bTransacao) and (dtmBaseDados.dbBaseDados.InTransaction) ) then
         if Result then
            CommitTransacao
         else
            RollBackTransacao;
      dtmOperComum.qryAuxiliar.Close;
   end;
End;

//--------------------------------------------------------------------------------------------------
//    Função que estorna uma determinada Operação de Investimento
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros :
//
//       iOperacao      :  id da Operação de Investimento   (idOperacaoInvest)
//       iEmpresaProp   :  id da Empresa proprietária       (Sistema.idEmpresa)
//       iModuloOrigem  :  id do Módulo de Origem           (Sistema.idModulo)
//
//       dDataEstorno   :  data do estorno
//
//--------------------------------------------------------------------------------------------------
function TOperComum.EstornaOper(iOperacao, iEmpresaProp, iModuloOrigem: integer;
fValorPrimeiraCota: currency; dDataEstorno: TDateTime; bMostraMsg: boolean): boolean;
var
   sDataEstorno, sMensErro, sMascara : string;

   iCodDocumentoAnt, iLanc       : integer;
   iCodDocumento, iTestaPeriodo  : integer;
   liExercicio, liPeriodo        : integer;

   qryHistorico                  : TwwQuery;
   iPlanilha                     : integer;

   bTransacao                    : boolean;

begin
   bTransacao  := False; // a priori, não é necessário que se inicie uma transação
   Result      := True;

   try

      sDataEstorno   := FormatDateTime('dd/mm/yyyy', dDataEstorno);

      try

         qryHistorico := dtmOperComum.qryBuscaHistorico;
         with qryHistorico do begin
            Close;
            if not(Prepared) then Prepare;
            ParamByName('HISTORICO').AsInteger  := -1;
            ParamByName('OPERACAO').AsInteger   := iOperacao;
            Open;

            if not(isEmpty) then begin

               // verifica se já existe transação em andamento; se não houver, inicia uma
               if not(dtmBaseDados.dbBaseDados.inTransaction) then begin
                  bTransacao := True;
                  StartTransacao;
               end else begin
                  bTransacao := False;
               end;

               // levando em conta os registros que vão ser excluídos, marca as flags de recálculo
               MarcaFlgHistCartInv('OPE', iOperacao);

               First;
               while not(EOF) do begin

                  // existindo documento, estorna tudo por aí...
                  if not(qryHistorico.FieldByName('CODDOCUMENTO').isNULL) then begin

                     iLanc             := 0;
                     iCodDocumentoAnt  := FieldByName('CODDOCUMENTO').AsInteger;

                     // Faz o Estorno no CAP/CAR e Contab
                     Documento.EstornoCAPCAR(sDataEstorno, iCodDocumentoAnt, iLanc, iCodDocumento);

                  end else begin

                     // senão, estorna só na contabilidade
                     if not(FieldByName('PLNCODIGO').isNULL) then begin

                        iPlanilha      := FieldByName('PLNCODIGO').AsInteger;
                        liExercicio    := 0;
                        liPeriodo      := 0;

                        // verifica se o estorno pode ser realizado
                        iTestaPeriodo  := TestaPeriodo(True, 'BASEDADOS', sDataEstorno,
                                          IntToStr(iModuloOrigem), liExercicio, liPeriodo,
                                          iEmpresaProp, sMensErro);

                        sMascara    := GetMascaraPlano(FieldByName('PLANO').AsInteger);

                        if iTestaPeriodo = 0 then begin

                           // faz o estorno contábil
                           if EstornaLanc(bMostraMsg, iPlanilha, 'BASEDADOS', sDataEstorno, liExercicio,
                           liPeriodo, iEmpresaProp, sMascara) < 1 then
                           begin
                              Result := False;
                              if bTransacao then RollBackTransacao;
                           end;

                        end else begin
                           MensagemErroPeriodo(iTestaPeriodo);
                           Result := False;
                           if bTransacao then RollBackTransacao;
                        end;

                     end;

                  end;

                  Next;
               end;

               // fecha a tabela Historico
               Close;

               // HistCartinv
               with dtmOperComum.qryAuxiliar do begin
                  Close;
                  SQL.Clear;
                  SQL.Text := 'DELETE FROM HISTCARTINV WHERE IDOPERACAOINVEST = ' + IntToStr(iOperacao);
                  ExecSQL;
               end;

               // DespOperInvest
               with dtmOperComum.qryAuxiliar do begin
                  Close;
                  SQL.Clear;
                  SQL.Text := 'DELETE FROM DESPOPERINVEST WHERE IDOPERACAOINVEST = ' + IntToStr(iOperacao);
                  ExecSQL;
               end;

               // OperXContrato
               with dtmOperComum.qryAuxiliar do begin
                  Close;
                  SQL.Clear;
                  SQL.Text := 'DELETE FROM OPERXCONTRATO WHERE IDOPERACAOINVEST = ' + IntToStr(iOperacao);
                  ExecSQL;
               end;

               // OperacaoInvest
               with dtmOperComum.qryAuxiliar do begin
                  Close;
                  SQL.Clear;
                  SQL.Text := 'DELETE FROM OPERACAOINVEST WHERE IDOPERACAOINVEST = ' + IntToStr(iOperacao);
                  ExecSQL;
               end;

               // OprAcao
               with dtmOperComum.qryAuxiliar do begin
                  Close;
                  SQL.Clear;
                  SQL.Text := 'DELETE FROM OPRACAO WHERE IDOPERACAOINVEST = ' + IntToStr(iOperacao);
                  ExecSQL;
               end;

               // atualiza os saldos da carteira após o estorno
               AtualizaSaldos(fValorPrimeiraCota, -1{Data "até"});

               if ( (bTransacao) and (dtmBaseDados.dbBaseDados.InTransaction) ) then CommitTransacao;

            end;
         end;

      except
         if ( (bTransacao) and (dtmBaseDados.dbBaseDados.InTransaction) ) then RollBackTransacao;
         Screen.Cursor := crDefault;
         if bMostraMsg then Raise;
      end;

   finally
      qryHistorico.Close;
   end;
end;

//-------------------------------------------------------------------------------------------------------
//    Função que Alimenta Carteira
//-------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------
//    Parâmetros :
//       sNaturMov         :  Tipo de movimentacao a ser efetuada na carteira:
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
//       sTipoMov          :  Gerador da movimentação
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
//       iInvestimento     :  id do Investimento                        (idInvestimento)
//       iTipoInvest       :  id do Tipo de Investimento                (idTipoInvest)
//       iOperacao         :  id da Operação de Investimento            (idOperacaoInvest)
//       iLancImovel       :  id do Lançamento                          (tabela LancamentosImovel)
//       iTipoOperacao     :  id do Tipo de Operação de Investimento    (idTipoOperacao)
//       iCarteira         :  id da Carteira de Investimentos           (idCarteiraInvest)
//       iDespesaOperacao  :  id da Despesa ligada a uma Operação       (idDesOperInvest)
//       iImposto          :  id do Imposto ligado a um Investimento    (idImpostoInvest)
//       iDespesaCarteira  :  id da Despesa ligada a uma Carteira       (idDespCartInvest)
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

function TOperComum.AlimentaCarteira(iEmpresaProp, iModuloOrigem, iInvestimento, iTipoInvest, iOperacao,
  iLancImovel, iTipoOperacao, iCarteira, iDespesaOperacao, iDespesaCarteira, iPlanilha, iDocumento,
  iPlano: integer; dDataOper: TDateTime; fValorOperacao :currency; fQtdInvestOperacao :Double; fValorPrimeiraCota,
  fValorVariacao, fValorJuros, fValorIRProv, fValorIRApu, fValorIOFProv, fValorIOFApu,
  fValorAgio: currency; sNaturMov, sNaturOper, sLote, sHistorico, sTipoMov, sFlgCustodia,
  sRecPag: string; bMostraMsg: boolean): int64;
var
   fValorCota, fSaldoInicialCotas, fValorPremio : double;
   fSaldoInicialValor, fQtdeInicialInvest       : double;
   fSaldoFinalCotas, fQtdeFinalInvest, fNulo    : double;
   sTipoAtualizacao, sMensagem                  : string;
   iHistCartInv   : int64;
begin
   fNulo  := 0;

   // para evitar qq Access Violation que pudesse ocorrer
   if length(trim(sNaturMov)) = 0 then sNaturMov := ' ';
   if length(trim(sNaturOper)) = 0 then sNaturOper := ' ';

   try {...Finally}

      try {...Except}

         // Testa a consistência dos parâmetros passados;
         // se estiverem OK, define as outras variáveis necessárias a partir dos mesmos
         if not(VerificaParametros(iInvestimento, iTipoInvest, iOperacao, iTipoOperacao, iCarteira,
               iDespesaOperacao, iDespesaCarteira, fValorPrimeiraCota, sNaturMov)) then
         begin
            if bMostraMsg then MsgDlg('Parâmetros inconsistentes (Movimentação da Carteira)!', 'Erro', mtError, [mbOk], 0);
            Result := -1;
            Exit;
         end;

         // Se a natureza indicar que não há alimentação da carteira, sai (com Result = True)
         if sNaturMov[1] = 'N' then Exit;

         // Se (Valor = 0 _e_ Qtde = 0), sai (com Result = True)
         if (fValorOperacao = 0) and (fQtdInvestOperacao = 0) then Exit;

         // Verifica a HistCartInv p/ saber se esta será a primeira movimentação da carteira
         with dtmOperComum.qrySaldoCarteira do begin
            Close;
            if not(Prepared) then Prepare;
            ParamByName('CARTEIRA').AsInteger   := iCarteira;
            ParamByName('DATAMOV').AsDateTime   := dDataOper;
            ParamByName('HISTORICO').AsInteger  := high(integer);
            Open;
            First;
         end;



// @X Verificação dos saldos iniciais e cálculo do Valor da Cota -----------------------------------

         // Carteira ainda não possui movimentações: saldos zerados
         if dtmOperComum.qrySaldoCarteira.IsEmpty then begin

            // Caso seja a 1ª movimentação da carteira, não permite movimento que diminua o saldo
            if (
               ( (fValorOperacao < 0) and (sNaturMov[1] in ['A','G','L','O','R']) ) or
               ( (sNaturMov[1] in ['D','P','U']) )
               )
            then begin

               if bMostraMsg then begin
                  sMensagem := 'A Carteira de Investimentos ainda não foi movimentada. ' +
                               'A primeira movimentação de uma Carteira não pode diminuir seu saldo!';
                  MsgDlg(sMensagem, 'Erro', mtError, [mbOk], 0);
               end;

               // Sai, (com Result = False)
               Result := -1;
               Exit;

            end else begin

               // É a 1ª movimentacao da carteira;
               // Caso a 1ª movimentação aumente o saldo, inicializa os saldos
               if sNaturMov[1] = 'A' then begin

                  fSaldoInicialCotas   := 0;
                  fValorCota           := fValorPrimeiraCota;
                  fQtdeInicialInvest   := 0;

               end else begin

                  // O primeiro movimento DEVE aumentar o nº de cotas
                  if bMostraMsg then begin
                     sMensagem := 'A Carteira de Investimentos ainda não foi movimentada. ' +
                                  'A movimentação não é permitida!';
                     MsgDlg(sMensagem, 'Erro', mtError, [mbOk], 0);
                  end;

                  // Sai, (com Result = False)
                  Result := -1;
                  Exit;
               end;

            end;


         end else begin { dtmOperComum.qrySaldoCarteira.IsEmpty }

            // Carteira já possui movimentações anteriores
            // Lê os saldos
            fSaldoInicialCotas   := dtmOperComum.qrySaldoCarteiraSALDOCOTASCARTINV.AsFloat;
            fSaldoInicialValor   := dtmOperComum.qrySaldoCarteiraSALDOVLRCARTINV.AsFloat;

            // Calcula o valora da Cota
            if fSaldoInicialCotas <> 0 then begin

               // Se o saldo em cotas não estiver zerado...
               fValorCota := fSaldoInicialValor / fSaldoInicialCotas;

            end else begin

               // Se o saldo em cotas estiver zerado, avança até achar encontrar saldo válido
               repeat

                  fSaldoInicialCotas := dtmOperComum.qrySaldoCarteiraSALDOCOTASCARTINV.AsFloat;
                  fSaldoInicialValor := dtmOperComum.qrySaldoCarteiraSALDOVLRCARTINV.AsFloat;

                  dtmOperComum.qrySaldoCarteira.Next

               until ( (dtmOperComum.qrySaldoCarteira.EOF) or (fSaldoInicialCotas <> 0) )

            end;

            // Se o saldo zerado persistir, sai (com Result = False)
            if fSaldoInicialCotas = 0 then begin
               if bMostraMsg then begin
                  sMensagem := 'O saldo em cotas da Carteira é ZERO, apesar de ' +
                               'já possuir movimentação!';
                  MsgDlg(sMensagem, 'Erro', mtError, [mbOk], 0);
               end;

               Result := -1;
               Exit;

            end else begin
               // Exite saldo; calcula o valor da Cota
               fValorCota := fSaldoInicialValor / fSaldoInicialCotas;
            end;

            // volta ao 1º registro da query (dtmOperComum.qrySaldoCarteira)
            dtmOperComum.qrySaldoCarteira.First;
         end;

         // Verificação do saldo do INVESTIMENTO
         fQtdeInicialInvest   := 0;

         BuscaTodosSaldosInvestLote(iCarteira, iInvestimento, high(integer), sLote, dDataOper, fQtdeInicialInvest,
         {saldos:} fNulo, fNulo, fNulo, fNulo, fNulo, fNulo, fNulo, fNulo, fNulo, fNulo, fNulo, fNulo, fNulo, fNulo);

// FIM da Verificação dos saldos iniciais e cálculo do Valor da Cota -------------------------------




// @X Cálculo dos saldos finais --------------------------------------------------------------------

         case sNaturMov[1] of

            'A': // Aumenta quantidade de cotas (Compra)
            begin
               fSaldoFinalCotas  := fSaldoInicialCotas  + fValorOperacao / abs(fValorCota);
               fQtdeFinalInvest  := fQtdeInicialInvest  + fQtdInvestOperacao;
            end;

            'D': // Diminui quantidade de cotas (Venda)
            begin
               fSaldoFinalCotas  := fSaldoInicialCotas - (fValorOperacao / abs(fValorCota));
               fQtdeFinalInvest  := fQtdeInicialInvest - fQtdInvestOperacao;
               fValorOperacao    := (fValorOperacao * -1);
            end;

            'E': // Despesa
            case sNaturOper[1] of

               'A', 'D':
               // Operacao = Compra('C') ou Venda('V'), aumenta qtde Cotas mas NÃO altera qtde Investimento
               begin
                  fSaldoFinalCotas     := fSaldoInicialCotas  + fValorOperacao / abs(fValorCota);
                  fQtdeFinalInvest     := fQtdeInicialInvest;
               end;

               'O', 'U':
               // Operacao = Venda(O) ou Compra(U) de Opção(O), NÃO altera qtde, diminui valores
               begin
                  fSaldoFinalCotas     := fSaldoInicialCotas;
                  fQtdeFinalInvest     := fQtdeInicialInvest;
                  fValorOperacao       := (fValorOperacao * -1);
                  fQtdInvestOperacao   := 0;
               end;

            else
               // O primeiro movimento DEVE aumentar o nº de cotas
               if bMostraMsg then begin
                  sMensagem := 'Natureza de Operação não Prevista. ';
                  MsgDlg(sMensagem, 'Erro', mtError, [mbOk], 0);
               end;
               // Sai, (com Result = False)
               Result := -1;
               Exit;
            end;

            'G': // Aumento da Cotacao do Investimento (Ganho)
            begin
               fSaldoFinalCotas     := fSaldoInicialCotas;
               fQtdeFinalInvest     := fQtdeInicialInvest;
               fQtdInvestOperacao   := 0;
            end;

            'I': // Diminui valor da cota (Baixa Parcial - Imobiliário(?))
            begin
               fSaldoFinalCotas     := fSaldoInicialCotas;
               fQtdeFinalInvest     := fQtdeInicialInvest;
               fValorOperacao       := fValorOperacao * (-1);
            end;

            'L','O','R': // Aumenta valor da cota (Venda de Opção / Lucro / Rendimento)
            begin
               fSaldoFinalCotas     := fSaldoInicialCotas;
               fQtdeFinalInvest     := fQtdeInicialInvest;
               fQtdInvestOperacao   := 0;
            end;

            'P': // Diminuição da Cotacao do Investimento (Perda)
            begin
               fSaldoFinalCotas     := fSaldoInicialCotas;
               fQtdeFinalInvest     := fQtdeInicialInvest;
               fValorOperacao       := fValorOperacao * (-1);
               fQtdInvestOperacao   := 0;
            end;

            'U': // Diminui valor da cota (Compra de Opção)
            begin
               fSaldoFinalCotas     := fSaldoInicialCotas;
               fQtdeFinalInvest     := fQtdeInicialInvest;
               fValorOperacao       := fValorOperacao * (-1);
               fQtdInvestOperacao   := 0;
            end;

         else
            fSaldoFinalCotas  := fSaldoInicialCotas;
            fQtdeFinalInvest  := fQtdeInicialInvest;
            fValorOperacao    := 0;
         end;

// FIM do Cálculo dos saldos finais ----------------------------------------------------------------




// @X Crítica do resultado dos Saldos de Cotas -----------------------------------------------------

         if fSaldoFinalCotas < 0 then begin
            // Não se pode ter zero ou menos cotas em uma determinada carteira
            if bMostraMsg then begin
               sMensagem := 'O saldo em cotas de uma Carteira não pode ser Negativo!';
               MsgDlg(sMensagem, 'Erro', mtError, [mbOk], 0);
            end;
            // Sai, (com Result = False)
            Result := -1;
            Exit;
         end;

           // if fQtdeFinalInvest < 0 then begin
         // FormatFloat('###,###,###,##0.000000000', fQtdeFinalInvest) (MEGA)

         if (StrToFloat(FormatFloat('#0.000000000', fQtdeFinalInvest))) < 0 then begin
            // Não se pode ter uma quantidade negativa para um determindado investimento
            if bMostraMsg then begin
               sMensagem := 'O saldo final de um Investimento em uma Carteira não pode ser Negativo!';
               MsgDlg(sMensagem, 'Erro', mtError, [mbOk], 0);
            end;
            // Sai, (com Result = False)
            Result := -1;
            Exit;
         end;

// FIM da Crítica do resultado dos Saldos de Cotas -------------------------------------------------




// @X Decisão do tipo de atualização ---------------------------------------------------------------
//       'A' = (A)tualização = Edit
//       'I' = (I)nclusão    = Insert

         // Por default, é inclusão
         sTipoAtualizacao := 'I';

         // DOP - Despesa da Operação, LUC - Lucro
         if (sTipoMov = 'DOP') or (sTipoMov = 'LUC') then begin

            with dtmOperComum.qryBuscaHistDesp do begin
               Close;
               if not(Prepared) then Prepare;
               ParamByName('DESPESA').AsInteger := iDespesaOperacao;
               Open;

               if not(isEmpty) then sTipoAtualizacao := 'A';

               Close;
            end;

         end else begin

            // OPE - Operação
            if sTipoMov = 'OPE' then begin

               with dtmOperComum.qryBuscaHistOper do begin
                  Close;
                  if not(Prepared) then Prepare;
                  ParamByName('OPERACAO').AsInteger := iOperacao;
                  Open;

                  if not(isEmpty) then sTipoAtualizacao := 'A';

                  Close;
               end;
            end;

         end;

// FIM da Decisão do tipo de atualização -----------------------------------------------------------




// @X Inclusão de Registro na HistCartInv ----------------------------------------------------------

         if sTipoAtualizacao = 'I' then begin

            // Ajusta Flag de Custódia
            if sFlgCustodia <> '' then begin
               with dtmOperComum.qryBuscaCustodia do begin
                  Close;
                  if not(Prepared) then Prepare;
                  ParamByName('TIPOINVEST').AsInteger := iTipoInvest;
                  ParamByName('TIPOOPER').AsInteger   := iTipoOperacao;
                  Open;

                  if ( not(isEmpty) and (FieldByName('TIPOCUSTODIA').AsString = 'N') ) then sFlgCustodia := '';
                  Close;
               end;
            end;

            with dtmOperComum.qryInsertHistCartInv do begin
               Close;
               if not(Prepared) then Prepare;

               iHistCartInv := LeUltRegistro(nil, 'HISTCARTINV');

               ParamByName('IDHISTCARTINV').AsInteger := iHistCartInv;

               // Passa como NULL os parâmetros, quando necessário
               // não há preocupação aqui em verificar quais parâmetros _podem_ ser nulos...
               ParamByName('CARTEIRA').AsInteger      := iCarteira;         if iCarteira = -1        then ParamByName('CARTEIRA').Clear;
               ParamByName('INVESTIMENTO').AsInteger  := iInvestimento;     if iInvestimento = -1    then ParamByName('INVESTIMENTO').Clear;
               ParamByName('DESPESAINVEST').AsInteger := iDespesaOperacao;  if iDespesaOperacao = -1 then ParamByName('DESPESAINVEST').Clear;
               ParamByName('DESPESACART').AsInteger   := iDespesaCarteira;  if iDespesaCarteira = -1 then ParamByName('DESPESACART').Clear;
               ParamByName('OPERACAO').AsInteger      := iOperacao;         if iOperacao = -1        then ParamByName('OPERACAO').Clear;
               ParamByName('TIPOINVEST').AsInteger    := iTipoInvest;       if iTipoInvest = -1      then ParamByName('TIPOINVEST').Clear;
               ParamByName('TIPOOPER').AsInteger      := iTipoOperacao;     if iTipoOperacao = -1    then ParamByName('TIPOOPER').Clear;
               ParamByName('PLANILHA').AsInteger      := iPlanilha;         if iPlanilha <= 0        then ParamByName('PLANILHA').Clear;
               ParamByName('DOCUMENTO').AsInteger     := iDocumento;        if iDocumento = -1       then ParamByName('DOCUMENTO').Clear;
               ParamByName('PLANO').AsInteger         := iPlano;            if iPlano = -1           then ParamByName('PLANO').Clear;
               ParamByName('LANCAMENTO').AsInteger    := iLancImovel;       if iLancImovel = -1      then ParamByName('LANCAMENTO').Clear;

               // Preenche os outros parametros ..
               ParamByName('EMPRESAPROP').AsInteger   := iEmpresaProp;
               ParamByName('MODULO').AsInteger        := iModuloOrigem;
               ParamByName('HISTMOVCARTINV').AsString := copy(sHistorico, 1, 59);
               ParamByName('NATURMOVCARTINV').AsString:= sNaturMov;
               ParamByName('NATURMOVOPER').AsString   := sNaturOper;
               ParamByName('LOTE').AsString           := sLote;
               ParamByName('TIPMOVCARTINV').AsString  := sTipoMov;
               ParamByName('RECPAG').AsString         := sRecPag;
               ParamByName('DATA').AsDateTime         := dDataOper;
               ParamByName('MOVIMENTO').AsFloat       := fValorOperacao;
               ParamByName('QUANTIDADE').AsFloat      := fQtdInvestOperacao;
               ParamByName('COTAS').AsFloat           := (fSaldoFinalCotas - fSaldoInicialCotas);
               ParamByName('FLGCALCSALDO').AsString   := '1';
               ParamByName('FLGCUSTODIA').AsString    := sFlgCustodia;
               ParamByName('VLRVARIACAO').AsFloat     := fValorVariacao;
               ParamByName('VLRJUROS').AsFloat        := fValorJuros;
               ParamByName('VLRIRPROV').AsFloat       := fValorIRProv;
               ParamByName('VLRIRAPU').AsFloat        := fValorIRApu;
               ParamByName('VLRIOFPROV').AsFloat      := fValorIOFProv;
               ParamByName('VLRIOFAPU').AsFloat       := fValorIOFApu;
               ParamByName('VLRAGIO').AsFloat         := fValorAgio;

               ExecSQL;

               Result := iHistCartInv;
            end;

// FIM de Inclusão de Registro na HistCartInv ------------------------------------------------------


         end else begin


// @X Update de Registro na HistCartInv ------------------------------------------------------------

            // Despesa ou Lucro
            if ( (sTipoMov = 'DOP') or (sTipoMov = 'LUC') ) then begin

               with dtmOperComum.qryUpdateHistPorDesp do begin
                  Close;
                  if not(Prepared) then Prepare;

                  ParamByName('DESPESA').AsInteger    := iDespesaOperacao;
                  ParamByName('DATA').AsDateTime      := dDataOper;
                  ParamByName('MOVIMENTO').AsFloat    := fValorOperacao;
                  ParamByName('QUANTIDADE').AsFloat   := fQtdInvestOperacao;
                  ParamByName('VLRVARIACAO').AsFloat  := fValorVariacao;
                  ParamByName('VLRJUROS').AsFloat     := fValorJuros;
                  ParamByName('VLRIRPROV').AsFloat    := fValorIRProv;
                  ParamByName('VLRIRAPU').AsFloat     := fValorIRApu;
                  ParamByName('VLRIOFPROV').AsFloat   := fValorIOFProv;
                  ParamByName('VLRIOFAPU').AsFloat    := fValorIOFApu;
                  ParamByName('VLRAGIO').AsFloat      := fValorAgio;
                  ParamByName('COTAS').AsFloat        := fSaldoFinalCotas - fSaldoInicialCotas;

                  ExecSQL;
               end;

            // Operação
            end else if sTipoMov = 'OPE' then begin

               with dtmOperComum.qryUpdateHistPorOper do begin
                  Close;
                  if not(Prepared) then Prepare;

                  ParamByName('OPERACAO').AsInteger := iOperacao;
                  ParamByName('DATA').AsDateTime      := dDataOper;
                  ParamByName('MOVIMENTO').AsFloat    := fValorOperacao;
                  ParamByName('QUANTIDADE').AsFloat   := fQtdInvestOperacao;
                  ParamByName('VLRVARIACAO').AsFloat  := fValorVariacao;
                  ParamByName('VLRJUROS').AsFloat     := fValorJuros;
                  ParamByName('VLRIRPROV').AsFloat    := fValorIRProv;
                  ParamByName('VLRIRAPU').AsFloat     := fValorIRApu;
                  ParamByName('VLRIOFPROV').AsFloat   := fValorIOFProv;
                  ParamByName('VLRIOFAPU').AsFloat    := fValorIOFApu;
                  ParamByName('VLRAGIO').AsFloat      := fValorAgio;
                  ParamByName('COTAS').AsFloat        := fSaldoFinalCotas - fSaldoInicialCotas;

                  ExecSQL;
               end;

            end;

         end;


// FIM ---------------------------------------------------------------------------------------------

      except
         if bMostraMsg then Raise;
         Result := -1;
      end;

   finally
      dtmOperComum.qrySaldoCarteira.Close;
      dtmOperComum.qryBuscaHistDesp.Close;
      dtmOperComum.qryBuscaHistOper.Close;
      dtmOperComum.qryBuscaCustodia.Close;
      dtmOperComum.qryInsertHistCartInv.Close;
      dtmOperComum.qryUpdateHistPorDesp.Close;
      dtmOperComum.qryUpdateHistPorOper.Close;
   end;
end;






//--------------------------------------------------------------------------------------------------
//    Função que Atualiza Saldos de Carteira e Investimento
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros :
//       fValorPrimeiraCota   : valor da 1ª cota da Carteira
//       dDataFinal           : Data até quando devem ser atualizados os saldos
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//       FlgCalcSaldo         :  1 - Atualiza Saldo Carteira e Investimento
//                               2 - Atualiza Saldo Investimento
//                               3 - Atualiza Saldo Carteira
//                               4 - Lucro
//--------------------------------------------------------------------------------------------------
function TOperComum.AtualizaSaldos(fValorPrimeiraCota: currency; dDataFinal: TDateTime): boolean;
Var
  fValorCota, fSaldoInicialCotas, fSaldoInicialValor, fQtdeInicialInvest,
  fValorInicialInvest, fSaldoFinalCotas, fSaldoFinalValor, fQtdeFinalInvest,
  fValorFinalInvest, fValorOperacao, fValorCotasOperacao, fQtdInvestOperacao, wSaldoInutil,
  wSaldoQtdInvest, wSaldoVlrInvest, wVlrMovimento, wCotMovimento, fValorAgio : Double;

  wSaldoAtuAnt, wSaldoAtu, wSaldoAquiAnt, wSaldoAqui, wSaldoRendAnt, wTotDespOper, wVlrMovOperacao,
  wSaldoMercadoAnt, wSaldoRend, wMovimCar, wVlrTotVendido, wQtdMovOperacao : Double;

  wSaldoCarAnt, wSaldoCar, wQtdInvestAnt, wMovimAtu, wMovimAqui, wCotaMoeda,
  wMovimJur, wSaldoJur, wSaldoJurant, wMovimPre, wSaldoPre, wSaldoPreAnt,
  wMovimVar, wSaldoVar, wSaldoVarant,
  wMovimIRProv,  wSaldoIRProv,  wSaldoIRProvant,  wMovimIRApu,  wSaldoIRApu,  wSaldoIRApuAnt,
  wMovimIOFProv, wSaldoIOFProv, wSaldoIOFProvant, wMovimIOFApu, wSaldoIOFApu, wSaldoIOFApuAnt,
  wMovimAgio,    wSaldoAgio   , wSaldoAgioant : Double;

  QrySaldoCarteira, qrySaldoInvest, qryAtualizaSaldoC, qryAtualizaSaldoI,
  qryFlgAtualSaldo: TwwQuery; // Só para encurtar o nome das queries

  wFlgCalcSaldo, wTipoMov , Mensagem, sLote, wTipoAtualizacao: String;

  wFlgSair, cNaturezaMovimento, cNaturezaOPeracao, cNaturezaOPDesp, wDec: Char;

  iInvestimento, iCarteira, iHistorico, iMoeda : LongInt;

  dDataOper, dDataMov, dDataCotacao: TDateTime;

  QryLocal, QryLocal1 :TwwQuery;

  wIdCarteira, wIdInvestimento, wIdLancamento :Integer;
  RPI : TRecParamInvest;

Begin
// Cria Objetos Locais
  QryLocal              := TwwQuery.Create(Application);
  QryLocal.DatabaseName := 'BaseDados';
  QryLocal1              := TwwQuery.Create(Application);
  QryLocal1.DatabaseName := 'BaseDados';

// Busca Moeda Atuarial
  Operacaoinvest.RetParamInvest(RPI, 'BaseDados');
  iMoeda := RPI.MOEDAATU;

// Caso a Moeda Atuarial não tenha sido cadastrada, Sai .
  if iMoeda = 0 then begin
    MsgDlg('Saldos não Atualizados... Cadastre Moeda Atuarial nos Parâmetros do Sistema',
           'Erro',mtError,[mbOK],0);
    Exit;
  end;
// Inicia Variaveis
  Result := True;

  Try
// PROCESSA REGISTROS COM O FLAG 1 / 3 / 4 ENQUANTO EXISTIREM
    While True Do Begin
      Try
// Abre a query que Busca os Registros
        QryFlgAtualSaldo := TwwQuery(dtmOperacaoInvest.qryFlgAtualSaldo13);
        With QryFlgAtualSaldo Do Begin
          Close;
          Open;
          First;
        End;
// Caso não existam mais, sai da Rotina e atualiza Invesimentos
        If QryFlgAtualSaldo.IsEmpty then begin
          Break
        End Else Begin
// Testa se So Existem Registros com Flg 4.
          wFlgSair := 'S';
          While Not QryFlgAtualSaldo.Eof Do Begin
            If QryFlgAtualSaldo.FieldByName('FLGCALCSALDO').AsInteger <> 4 Then Begin
              wFlgSair := 'N';
              Break;
            End;
            QryFlgAtualSaldo.Next;
          End;
          If wFlgSair = 'S' Then Break;

// Caso existam guarda dados
          iCarteira     := qryFlgAtualSaldo.FieldByName('IDCARTEIRAINVEST').AsInteger;
          dDataOper     := qryFlgAtualSaldo.FieldByName('DATAMOVCARTINV').AsDateTime;
          iHistorico    := qryFlgAtualSaldo.FieldByName('IDHISTCARTINV').AsInteger;
          iInvestimento := qryFlgAtualSaldo.FieldByName('IDINVESTIMENTO').AsInteger;
          cNaturezaMovimento := qryFlgAtualSaldo.FieldByName('NATURMOVCARTINV').AsString[1];
        end;
// Busca registros de HistCartInv que devem ter saldos atualizados
        qryAtualizaSaldoC:= TwwQuery(dtmOperacaoInvest.qryAtualizaSaldoC);
        with qryAtualizaSaldoC do begin
          Close;
          ParamByName('IDCARTEIRA').asInteger  := iCarteira;
          ParamByName('DATAMOV').asDateTime    := dDataOper;
          ParamByName('IDHISTORICO').asInteger := iHistorico;
          Open;
          First;
        end;
        fSaldoInicialCotas:=0;
//******************************************************************************
// ATUALIZA SALDOS DOS REGISTROS DAS CARTEIRAS
        While (Not QryAtualizaSaldoC.EOF) Do Begin
// Busca Movimentos da Carteira, para verificar o Saldo Anterior
// Testa se o Saldo em Cotas esta Zerado (1 VEZ)
        If fSaldoInicialCotas <= 0 Then Begin
          QrySaldoCarteira := TwwQuery(dtmOperacaoInvest.qrySaldoCarteira);
          With QrySaldoCarteira Do Begin
            Close;
            ParamByName('IDCARTEIRA').asInteger := QryAtualizaSaldoC.FieldByName('IDCARTEIRAINVEST').AsInteger;
            ParamByName('DATAMOV').asDateTime   := QryAtualizaSaldoC.FieldByName('DATAMOVCARTINV').AsDateTime;
            ParamByName('IDHISTORICO').asInteger:= QryAtualizaSaldoC.FieldByName('IDHISTCARTINV').AsInteger;
            Open;
            First;
          End;
// Verifica se esta será a primeira movimentação da carteira
          If QrySaldoCarteira.IsEmpty then begin
            fSaldoInicialCotas   := 0;
            fSaldoInicialValor   := 0;
            fValorCota           := fValorPrimeiraCota;
          End Else Begin
// Caso já existe saldo para a Carteira, guarda os saldos
            fSaldoInicialCotas   := qrySaldoCarteira.FieldByName('SALDOCOTASCARTINV').asFloat;
            fSaldoInicialValor   := qrySaldoCarteira.FieldByName('SALDOVLRCARTINV').asFloat;
// Testa se o Saldo em Cotas esta Zerado
            If fSaldoInicialCotas <> 0 Then Begin
              fValorCota := (fSaldoInicialValor / fSaldoInicialCotas);
            End Else Begin
// Caso Saldo em cotas zerado, Avança até achar saldo Ok.
              While Not QrySaldoCarteira.Eof Do Begin
                fSaldoInicialCotas := QrySaldoCarteira.FieldByName('SALDOCOTASCARTINV').AsFloat;
                fSaldoInicialValor := QrySaldoCarteira.FieldByName('SALDOVLRCARTINV').AsFloat;

                If fSaldoInicialCotas <> 0 Then Break;
// Proximo Registro
                QrySaldoCarteira.Next;
              End;
// Caso não tenha achado saldo Ok, erro e sai .
              If fSaldoInicialCotas = 0 Then Begin
                MsgDlg('Saldo em Cotas desta Carteira está zerado.','Mensagem do Sistema',
                       MtError,[MbOk],0);
                Result :=False;
                Exit;
              End Else Begin
// Caso Achou saldo Calcula Valor da Cota
                fValorCota := fSaldoInicialValor / fSaldoInicialCotas;
              End;
// Pula Pro Registro Final
              QrySaldoCarteira.First;
            End;
          End;
        End;

// Caso Data Final passada e data Maior que Final sai
          If (dDataFinal <> -1) And (dDataFinal > QryAtualizaSaldoC.FieldByName('DATAMOVCARTINV').AsDateTime)
          Then Begin
            Break;
          End;
// Guarda Dados
          fValorOperacao     := QryAtualizaSaldoC.FieldByName('VLRMOVCARTINV').AsFloat;
          fValorCotasOperacao:= QryAtualizaSaldoC.FieldByName('COTASMOVCARTINV').AsFloat;
          cNaturezaMovimento := QryAtualizaSaldoC.FieldByName('NATURMOVCARTINV').AsString[1];
          cNaturezaOPeracao  := QryAtualizaSaldoC.FieldByName('NATURMOVOPER').AsString[1];
          wTipoMov           := QryAtualizaSaldoC.FieldByName('TIPMOVCARTINV').AsString;

// Guarda Dados nas Variaveis de DeBug
          wIdCarteira     := QryAtualizaSaldoC.FieldByName('IDCARTEIRAINVEST').AsInteger;
          wIdInvestimento := QryAtualizaSaldoC.FieldByName('IDINVESTIMENTO').AsInteger;
          wIdLancamento   := QryAtualizaSaldoC.FieldByName('IDHISTCARTINV').AsInteger;

// Guarda os Valores da Operacao e de Cotas
          wVlrMovimento:=fValorOperacao;
          wCotMovimento:=fValorCotasOperacao;


//******************************************************************************
// CASO SEJA TRANSFERENCIA (NA CARTEIRA)
          If (wTipoMov = 'TRF') Then Begin
// Caso Diminua (D)
            If (cNaturezaMovimento = 'D') Then Begin
// Busca ultimo Saldo deste Investimento
              BuscaTodosSaldosInvestLote(
                QryAtualizaSaldoC.FieldByName('IDCARTEIRAINVEST').AsInteger,
                QryAtualizaSaldoC.FieldByName('IDINVESTIMENTO').AsInteger,
                QryAtualizaSaldoC.FieldByName('IDHISTCARTINV').AsInteger,
                QryAtualizaSaldoC.FieldByName('IDLOTE').AsString,
                QryAtualizaSaldoC.FieldByName('DATAMOVCARTINV').AsDateTime,
                wSaldoQtdInvest, wSaldoVlrInvest,
                wSaldoInutil, wSaldoInutil,wSaldoInutil, wSaldoInutil,
                wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
                wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil);

// Calcula Valor da Movimentacao e Altera Variavel de Calculo Interno (fValorOperacao)
              wVlrMovimento:=( (QryAtualizaSaldoC.FieldByName('QTDEMOVINVCART').AsFloat*
                               (wSaldoVlrInvest/wSaldoQtdInvest)) *-1);
              fValorOperacao:=wVlrMovimento;
            End;
// Caso Aumente (A)
            If (cNaturezaMovimento = 'A') Then Begin
// Busca Ultimo Lancamento que Diminui de Transferencia
              FazQuery(QryLocal,
                'SELECT  VLRMOVCARTINV                    '+
                'FROM CM.HISTCARTINV                      '+
                'WHERE 	(TIPMOVCARTINV    = ''TRF'') AND '+
                '        (NATURMOVCARTINV  = ''D'')   AND '+
                '      	(IDOPERACAOINVEST = '+
                QuotedStr(QryAtualizaSaldoC.FieldByName('IDOPERACAOINVEST').AsString)+')');
// Calcula Valor da Movimentacao
              wVlrMovimento:=((QryLocal.FieldByName('VLRMOVCARTINV').AsFloat)*-1);
              QryLocal.Close;
            End;
          End;

//------------------------------------------------------------------------------
// DEFINIÇÃO DOS SALDOS FINAIS DE ACORDO COM A NATUREZA DA OPERACAO
          Case cNaturezaMovimento of
// Aumenta Valor e Quantidade de cotas (COMPRA)
// Aumenta Valor e Quantidade de cotas (COMPRA)
            'A':Begin
                wCotMovimento    := (fValorOperacao*10000 / Abs(fValorCota))/10000; // Valor Multiplicado por 1000 por erro nos calculos com mais de 9 decimais
                fSaldoFinalCotas := (fSaldoInicialCotas + wCotMovimento);
                fSaldoFinalValor := fSaldoInicialValor  + fValorOperacao;
            End;
// Diminui valor quantidade de cotas (VENDA)  ** FVALOROPERAÇÃO JÁ FOI GRAVADO NEGATIVO **
            'D':Begin
                wCotMovimento    := (fValorOperacao*10000 / Abs(fValorCota))/10000; // Valor Multiplicado por 1000 por erro nos calculos com mais de 9 decimais
                fSaldoFinalCotas := (fSaldoInicialCotas + wCotMovimento);
                fSaldoFinalValor := fSaldoInicialValor + fValorOperacao;
            End;
// Aumenta Valor (Atualizacao de Saldos - GANHO/RENDIMENTO/OPCOES/LUCRO/PERDA)
{
            'G','R','O','U','L','P':Begin
                fSaldoFinalCotas := fSaldoInicialCotas;
                fSaldoFinalValor := fSaldoInicialValor + fValorOperacao;
}
// Refer nao quer usar Rendimentos e Opcoes para valorizar Cota.
// Colocar como parametro do sistema
            'G','L','P':Begin
                fSaldoFinalCotas := fSaldoInicialCotas;
                fSaldoFinalValor := fSaldoInicialValor + fValorOperacao;
            End;
// Acrescimo de valor, baixa parcial
            'M','I':Begin
// Nao Altera Qtd de Investimento
               wCotMovimento    := (fValorOperacao*10000 / Abs(fValorCota))/10000; // Valor Multiplicado por 1000 por erro nos calculos com mais de 9 decimais
               fSaldoFinalCotas := (fSaldoInicialCotas + wCotMovimento);
               fSaldoFinalValor  := fSaldoInicialValor  + fValorOperacao;
            End;
// DESPESAS
            'E':Begin
// Guarda a Natureza da Operacao
               cNaturezaOPeracao := QryAtualizaSaldoC.FieldByName('NATURMOVOPER').AsString[1];
// Caso Operacao de Compra(C) ou Venda(V), Aumenta Qtd de Cotas e
// Nao Altera Qtd de Investimento
               If (cNaturezaOPeracao = 'A') Or (cNaturezaOPeracao = 'D') Then Begin
                wCotMovimento    := (fValorOperacao*10000 / Abs(fValorCota))/10000; // Valor Multiplicado por 1000 por erro nos calculos com mais de 9 decimais
                fSaldoFinalCotas := (fSaldoInicialCotas + wCotMovimento);
                fSaldoFinalValor  := fSaldoInicialValor  + fValorOperacao;
// Caso Operacao de Venda(O) ou Compra(U) de Opcao(O), Nao Altera Qtds, Diminui Valores
              End Else If (cNaturezaOPeracao = 'O') Or (cNaturezaOPeracao = 'U') Then Begin
// Refer nao quer usar Rendimentos e Opcoes para valorizar Cota.
// Colocar como parametro do sistema
{
                fSaldoFinalCotas  := fSaldoInicialCotas;
                fSaldoFinalValor  := fSaldoInicialValor + fValorOperacao;
}
              End Else Begin
// O primeiro movimento DEVE aumentar o nº de cotas
                MsgDlg('Atualiza Saldo, Natureza de Operação não Prevista. ', 'Erro', mtError, [mbOk], 0);
                Result := False;
                Exit;
            End;
          End;
// Caso Diferente de Todos, Não altera Nada
            Else Begin
                fSaldoFinalCotas  := fSaldoInicialCotas;
                fSaldoFinalValor  := fSaldoInicialValor;
            End;
          End;

// Crítica do Resultado \\
// Não se pode ter zero ou menos cotas em uma determinada carteira
// MEGA
          If StrToFloat(FormatFloat('################0.0000',fSaldoFinalCotas)) < 0 Then Begin
            MostraErroAtualiza(QryAtualizaSaldoC.FieldByName('IDCARTEIRAINVEST').AsString,
                               QryAtualizaSaldoC.FieldByName('IDINVESTIMENTO').AsString,
                               wTipoMov,
                               QryAtualizaSaldoC.FieldByName('IDHISTCARTINV').AsString,
                               QryAtualizaSaldoC.FieldByName('DATAMOVCARTINV').AsString,
                               'Saldo Final de Cotas de uma Carteira não pode ser Negativo.');
// Sai do Sistema
             Result := False;
             Exit;
          End;

//------------------------------------------------------------------------------
// ATUALIZAÇÃO DOS SALDOS DE CARTEIRA
// Acerta Flag de Calculo de Saldo ( 1 -> 2 ou 3-> '' ou 4-> 4)
          wTipoAtualizacao := '';
          If Trim(qryAtualizaSaldoC.FieldByName('FLGCALCSALDO').asString) = '1' Then Begin
            wTipoAtualizacao := '2';
          End Else If Trim(qryAtualizaSaldoC.FieldByName('FLGCALCSALDO').asString) = '3' Then Begin
            wTipoAtualizacao := '';
          End Else If Trim(qryAtualizaSaldoC.FieldByName('FLGCALCSALDO').asString) = '4' Then Begin
            wTipoAtualizacao := '4';
          End;
// Muda o Separador Decimal
          wDec:=DecimalSeparator;
          DecimalSeparator :='.';
// Tenta atualizar o Arquivo
          If Not ExecutaQuery(QryLocal,
                   'UPDATE HISTCARTINV SET '+
                   'SALDOVLRCARTINV   = '+FloatToStr(fSaldoFinalValor)+', '+
                   'VLRMOVCARTINV     = '+FloatToStr(wVlrMovimento)   +', '+
                   'COTASMOVCARTINV   = '+FloatToStr(wCotMovimento)   +', '+
                   'SALDOCOTASCARTINV = '+FloatToStr(fSaldoFinalCotas)+', '+
                   'FLGCALCSALDO      = '+QuotedStr(wTipoAtualizacao) +'  '+
                   'WHERE (IDHISTCARTINV = '+
                          QuotedStr(QryAtualizaSaldoC.FieldByName('IDHISTCARTINV').AsString)+')')
          Then Begin
            MsgDlg('Saldos não Atualizados, Erro ao atualizar Histórico das Carteiras. ',
                   'Mensagem do Sistema',mtError,[mbOK],0);
// Volta Decimal Separator
            DecimalSeparator :=wDec;
            Exit;
          End;
          DecimalSeparator :=wDec;
          QryLocal.Close;

// Calcula Saldos

          fSaldoInicialCotas   := fSaldoFinalCotas;
          fSaldoInicialValor   := fSaldoFinalValor;
          If fSaldoInicialCotas > 0 Then
            fValorCota := fSaldoInicialValor / fSaldoInicialCotas;

          qryAtualizaSaldoC.Next;

        End;
        If not Result then begin
          mensagem := 'Foram encontradas Inconsistências no Cálculo dos Saldos de Carteira!';
          MsgDlg(mensagem, 'Erro', mtError, [mbOk], 0);
        end;
      Except
        On E:Exception Do Begin
          MsgDlg('Erro na tentativa de Atualização dos Saldos da Carteira '+
                 QryAtualizaSaldoC.FieldByName('IDCARTEIRAINVEST').AsString+#13+
                 'Investimento '+QryAtualizaSaldoC.FieldByName('IDINVESTIMENTO').AsString+', '+#13+
                 'Tipo de Movimento "'+wTipoMov+'", '+#13+
                 'Lançamento '+QryAtualizaSaldoC.FieldByName('IDHISTCARTINV').AsString+', '+#13+
                 'Data de lançamento '+DateToStr(dDataoper)+#13+#13+
                 'Com a Mensagem :'+#13+
                 E.Message,
                 'Erro',mtError,[mbOK],0);
          Result := false;
          Exit;
        End;
      End;
    End;

//******************************************************************************
// PROCESSA REGISTROS COM FLAG 2 / 4 (SALDOS DOS INVESTIMENTOS)
//******************************************************************************
    While True do begin
      Try
// Busca registros de HistCartInv com flag para atualizacao de Saldo em Investimento (2)
        qryFlgAtualSaldo := TwwQuery(dtmOperacaoInvest.qryFlgAtualSaldo2);
        with qryFlgAtualSaldo do begin
           Close;
           Open;
           First;
        end;

        if qryFlgAtualSaldo.isEmpty then begin
          break
        end else begin
          icarteira     := qryFlgAtualSaldo.FieldByName('IDCARTEIRAINVEST').asInteger;
          iInvestimento := qryFlgAtualSaldo.FieldByName('IDINVESTIMENTO').asInteger;
          sLote         := qryFlgAtualSaldo.FieldByName('IDLOTE').asString;
          dDataOper     := qryFlgAtualSaldo.FieldByName('DATAMOVCARTINV').asDateTime;
          iHistorico    := qryFlgAtualSaldo.FieldByName('IDHISTCARTINV').asInteger;
        end;
// Busca Movimentos do Investimento, para verificar o Saldo Anterior
        fQtdeInicialInvest   := 0;
        fValorInicialInvest  := 0;
        wQtdInvestAnt        := 0;
        wSaldoAtuAnt         := 0;
        wSaldoCarAnt         := 0;
        wSaldoAquiAnt        := 0;
        wSaldoRendAnt        := 0;
        wSaldoVarAnt         := 0;
        wSaldoJurAnt         := 0;
        wSaldoVarAnt         := 0;
        wSaldoPreAnt         := 0;
        wSaldoMercadoAnt     := 0;
        wSaldoIRProvAnt      := 0;
        wSaldoIRApuAnt       := 0;
        wSaldoIOFProvAnt     := 0;
        wSaldoIOFApuAnt      := 0;
        wSaldoAgioAnt        := 0;
        BuscaTodosSaldosInvestLote(
                iCarteira, iInvestimento, iHistorico, sLote, dDataOper,
                fQtdeInicialInvest, fValorInicialInvest, wSaldoAtuAnt, wSaldoCarAnt,wSaldoAquiAnt,
                wSaldoRendAnt,  wSaldoMercadoAnt, wSaldoVarAnt, wSaldoJurAnt, wSaldoPreAnt,
                wSaldoIRProvAnt,  wSaldoIRApuAnt, wSaldoIOFProvAnt, wSaldoIOFApuAnt, wSaldoAgioAnt);

        wQtdInvestAnt := fQtdeInicialInvest;

// Busca registros de HistCartInv que devem ter saldos atualizados
        QryAtualizaSaldoI := TwwQuery(dtmOperacaoInvest.qryAtualizaSaldoIL);
        with qryAtualizaSaldoI do begin
           Close;
           ParamByName('IDCARTEIRA').asInteger     := iCarteira;
           ParamByName('IDINVESTIMENTO').asInteger := iInvestimento;
           ParamByName('IDLOTE').asString          := sLote;
           ParamByName('DATAMOV').asDateTime       := dDataOper;
           ParamByName('IDHISTORICO').asInteger    := iHistorico;
           Open;
           First;
        end;
// Faz enquanto Existem Saldos a Atualizar
        While Not QryAtualizaSaldoI.EOF Do Begin
//------------------------------------------------------------------------------
// Caso Tipo de Movimento = INI -> Inicialização Pula sem fazer nada.
         If (QryAtualizaSaldoI.FieldByName('TIPMOVCARTINV').AsString = 'INI') Then Begin
// Desmarca o Flg do Registro de INI
           ExecutaQuery(QryLocal,
             'UPDATE HISTCARTINV SET '+
             'FLGCALCSALDO   = '''''+
             'WHERE (IDHISTCARTINV = '+
                     QuotedStr(QryAtualizaSaldoI.FieldByName('IDHISTCARTINV').AsString)+')');
           QryLocal.Close;
// Pula para o Proximo Registro
           QryAtualizaSaldoI.Next;
// Guarda Dados do Proximo Registro
           icarteira     := QryAtualizaSaldoI.FieldByName('IDCARTEIRAINVEST').asInteger;
           iInvestimento := QryAtualizaSaldoI.FieldByName('IDINVESTIMENTO').asInteger;
           sLote         := QryAtualizaSaldoI.FieldByName('IDLOTE').asString;
           dDataOper     := QryAtualizaSaldoI.FieldByName('DATAMOVCARTINV').asDateTime;
           iHistorico    := QryAtualizaSaldoI.FieldByName('IDHISTCARTINV').asInteger;
// Busca Saldos Anteriores deste Registro (do INI)
           BuscaTodosSaldosInvestLote(
             iCarteira, iInvestimento, iHistorico, sLote, dDataOper,
             fQtdeInicialInvest, fValorInicialInvest, wSaldoAtuAnt, wSaldoCarAnt,wSaldoAquiAnt,
             wSaldoRendAnt,  wSaldoMercadoAnt, wSaldoVarAnt, wSaldoJurAnt, wSaldoPreAnt,
             wSaldoIRProvAnt,  wSaldoIRApuAnt, wSaldoIOFProvAnt, wSaldoIOFApuAnt, wSaldoAgioAnt);
             wQtdInvestAnt := fQtdeInicialInvest;
// Loop
           Continue;
         End;

// Caso Data Final passada e data Maior que Final sai
         If (dDataFinal <> -1) And (dDataFinal > QryAtualizaSaldoI.FieldByName('DATAMOVCARTINV').AsDateTime)
         Then Begin
            Break;
         End;

// Guarda dados
          fValorOperacao     := qryAtualizaSaldoI.FieldByName('VLRMOVCARTINV').asFloat;
          fQtdInvestOperacao := qryAtualizaSaldoI.FieldByName('QTDEMOVINVCART').asFloat;
          wTipoMov           := QryAtualizaSaldoI.FieldByName('TIPMOVCARTINV').AsString;
          dDataMov           := QryAtualizaSaldoI.FieldByName('DATAMOVCARTINV').AsDateTime;
          cNaturezaMovimento := QryAtualizaSaldoI.FieldByName('NATURMOVCARTINV').asString[1];
          wFlgCalcSaldo      := QryAtualizaSaldoI.FieldByName('FLGCALCSALDO').AsString;
          fValorAgio         := QryAtualizaSaldoI.FieldByName('VLRAGIO').AsFloat;

// Guarda os Valores da Operacao e de Cotas
          wVlrMovimento:=fValorOperacao;
          wCotMovimento:=fValorCotasOperacao;

//------------------------------------------------------------------------------
// CASO LUCRO OU PREJUIZO (NO INVESTIMENTO)
          If (wTipoMov = 'LUC') Then Begin
// Busca Valor da Operacao
            FazQuery(QryLocal,
              'SELECT  VLRMOVCARTINV, QTDEMOVINVCART    '+
              'FROM CM.HISTCARTINV                      '+
              'WHERE 	(TIPMOVCARTINV    = ''OPE'') AND '+
              '      	(IDOPERACAOINVEST = '+
              QuotedStr(QryAtualizaSaldoI.FieldByName('IDOPERACAOINVEST').AsString)+')');
// Guarda Valor e Quantidade da Operacao Deste Movimento
            wVlrMovOperacao:=QryLocal.FieldByName('VLRMOVCARTINV').AsFloat;
            wQtdMovOperacao:=QryLocal.FieldByName('QTDEMOVINVCART').AsFloat;
// Zera MovimAtu
            wMovimAtu:=0;
            wSaldoInutil:=wMovimAtu;
            QryLocal.Close;

// Busca Total de Despesas desta Operacao
            FazQuery(QryLocal,
              'SELECT  SUM(VLRMOVCARTINV) AS VLRMOVCARTINV '+
              'FROM CM.HISTCARTINV                         '+
              'WHERE 	(TIPMOVCARTINV    = ''DOP'') AND    '+
              '       	(IDOPERACAOINVEST = '+
              QuotedStr(QryAtualizaSaldoI.FieldByName('IDOPERACAOINVEST').AsString)+')');
// Guarda Total de Despesas Da Operacao deste Movimento
            wTotDespOper:=QryLocal.FieldByName('VLRMOVCARTINV').AsFloat;
            QryLocal.Close;

// Calcula Valor total vendido desse Investimento
            wVlrTotVendido :=DivValorZero((wQtdMovOperacao*fValorInicialInvest),fQtdeInicialInvest);
// Calcula Lucro
            wVlrMovimento:=( ((wVlrMovOperacao*-1) - wTotDespOper ) - wVlrTotVendido );

// Altera Valores das Variveis
            fValorOperacao    := wVlrMovimento;
//------------------------------------------------------------------------------
// ATUALIZA O REGISTRO DO LUCRO COM O VALOR E O FLAG "4 OU NULO" CASO ESTEJA COM
// FLAG DIFERENTE DE 4
            If (Trim(qryAtualizaSaldoI.FieldByName('FLGCALCSALDO').asString) <> '4') And
               (fValorOperacao <>0)  Then Begin
// Muda o Separador Decimal
              wDec:=DecimalSeparator;
              DecimalSeparator :='.';
// Tenta atualizar o Arquivo
              ExecutaQuery(QryLocal,
                   'UPDATE HISTCARTINV SET '+
                   'VLRMOVCARTINV  = '+FloatToStr(fValorOperacao) +', '+
                   'FLGCALCSALDO   = ''4'' '+
                   'WHERE (IDHISTCARTINV = '+
                           QuotedStr(QryAtualizaSaldoI.FieldByName('IDHISTCARTINV').AsString)+')');
              DecimalSeparator:=wDec;
              QryLocal.Close;

// Rechama a Rotina de Atualizar os Saldos
              AtualizaSaldos(fValorPrimeiraCota,-1);
// Sai da Rotina
              Exit;
            End Else Begin
              wTipoAtualizacao := '';
            End;
          End;
//------------------------------------------------------------------------------
// Definição dos Saldos Finais
          Case cNaturezaMovimento of
            'A': // Aumenta quantidade
            begin
               fQtdeFinalInvest  := fQtdeInicialInvest  + fQtdInvestOperacao;
               fValorFinalInvest := fValorInicialInvest + fValorOperacao;
            end;

            'D': // Diminui quantidade  (venda)  ** fValorOPeração já foi gravado negativo
            begin
               fQtdeFinalInvest := fQtdeInicialInvest - fQtdInvestOperacao;
               fValorFinalInvest:= ( fValorInicialInvest-((fValorInicialInvest*fQtdInvestOperacao)/
                                                           fQtdeInicialInvest) );
            end;

            'G','P': // Aumento da Cotacao do Investimento (GANHO/PERDA)
            begin
               fQtdeFinalInvest  := fQtdeInicialInvest;
               fValorFinalInvest := fValorInicialInvest + fValorOperacao;
            end;

            'L': // LUCRO Nao Altera saldos
            begin
               fQtdeFinalInvest  := fQtdeInicialInvest;
               fValorFinalInvest := fValorInicialInvest;
            end;

// ACRESCIMO DE VALOR, BAIXA PARCIAL
            'M','I':Begin
// Nao Altera Qtd de Investimento
              fQtdeFinalInvest  := fQtdeInicialInvest;
              fValorFinalInvest := fValorInicialInvest + fValorOperacao;
            End;

// Despesas
            'E':Begin
// Guarda a Natureza da Operacao
              cNaturezaOPeracao := QryAtualizaSaldoI.FieldByName('NATURMOVOPER').AsString[1];
// Caso Operacao de Compra(A), Aumenta Valores do Investimento
              If (cNaturezaOPeracao = 'A') Then Begin
                fQtdeFinalInvest  := fQtdeInicialInvest;
                fValorFinalInvest := fValorInicialInvest + fValorOperacao;
// Caso Operacao de Venda de Acoes(D), Compra ou Venda de Opcao (O/U),
// Repete Valores do Investimento
              End Else Begin
                fQtdeFinalInvest  := fQtdeInicialInvest;
                fValorFinalInvest := fValorInicialInvest;
              End

            end else begin
               fQtdeFinalInvest  := fQtdeInicialInvest;
               fValorFinalInvest := fValorInicialInvest;
            end;
          End;

// Crítica do Resultado \\

// não se pode ter zero ou menos cotas em uma determinada carteira
// MEGA
          if fQtdeFinalInvest < 0 then begin
             MsgDlg('Saldo Negativo na data "'+DateToStr(dDataOper)+'"'#13+
                    'carteira "'+IntToStr(iCarteira)+'", '#13+
                    'investimento "'+IntToStr(iInvestimento)+'", lote "'+sLote+'"'#13+
                    'esta Operação não poderá ser confirmada ','Mensagem do Sistema',
                    MtError,[MbOk],0);
             Result := False;
             Exit;
          end;
// Busca Cotacao da Moeda Atuarial
          BuscaCotacaoMoeda(iMoeda, dDataMov, '', wCotaMoeda, dDataCotacao);
          If wCotaMoeda = 0 Then Begin
            MsgDlg('Cotação da Moeda Atuarial não encontrada até esta Data : '+DateToStr(dDataMov),'Mensagem do Sistema',
                   MtError,[MbOk],0);
            Result := False;
            Exit;
          End;

// Caso Seja uma Atualizacao Nao mexe nos Saldos Atuariais, Carregamento e
// Aquisicao
          If (wTipoMov <> 'ATU') Then Begin

            wMovimAtu  :=0;
// Caso Movimento A(COMPRA),D(VENDA) ou despesas de A/D, Calcula Movimento e Saldo Atuarial
            If (cNaturezaMovimento = 'A') Or (cNaturezaMovimento = 'D') Or
               ( (cNaturezaMovimento = 'E') And ( (cNaturezaOperacao = 'A') Or
                                                  (cNaturezaOperacao = 'D') ) )
              Then Begin
              wMovimAtu  := (fValorOperacao / wCotaMoeda);
            End;

            wMovimAgio := 0;
// Caso Movimento A(COMPRA), Atualiza Saldo de Agio
            If (cNaturezaMovimento = 'A') Or (cNaturezaMovimento = 'D') Or
               ( (cNaturezaMovimento = 'E') And ( (cNaturezaOperacao = 'A') Or
                                                  (cNaturezaOperacao = 'D') ) )
              Then Begin
              wMovimAgio  := fValorAgio;
            End;

// Caso Movimento R(RENDIM),O/U(OPCOES) ou despesas de O/U,
// Calcula Movimento e Saldo Atuarial
            If (cNaturezaMovimento = 'R') Or (cNaturezaMovimento = 'O') Or
               (cNaturezaMovimento = 'U') Or
               ( (cNaturezaMovimento = 'E') And ( (cNaturezaOperacao = 'O') Or
                                                  (cNaturezaOperacao = 'U') ) )
              Then Begin
              wMovimAtu  := ((fValorOperacao / wCotaMoeda)*-1);
            End;

// Inicia Custo de Carregamento e Custo de Aquisicao, Variação, Juros e Prêmio
            wMovimCar  := 0;
            wMovimAqui := 0;
            wMovimVar  := 0;
            wMovimJur  := 0;
            wMovimPre  := 0;
            wMovimIRProv  := 0;
            wMovimIRApu   := 0;
            wMovimIOFProv := 0;
            wMovimIOFApu  := 0;

// Caso seja uma DIMINUIÇÃO (D)
            If (cNaturezaMovimento = 'D')  Then Begin

// Carregamento é igual a Negativo de (QUANTIDADE DA OPERACAO *
//                                     CUSTO DE CARREGAMENTO MEDIO ANTERIOR)
               wMovimCar  := ((fQtdInvestOperacao * (wSaldoCarAnt  / wQtdInvestAnt))*-1);

// Variacao, Juros e Premio (Baixa pela Media)
               wMovimVar  := ((fQtdInvestOperacao * (wSaldoVarAnt  / wQtdInvestAnt))*-1);
               wMovimJur  := ((fQtdInvestOperacao * (wSaldoJurAnt  / wQtdInvestAnt))*-1);
               wMovimPre  := ((fQtdInvestOperacao * (wSaldoPreAnt  / wQtdInvestAnt))*-1);
               wMovimIRProv  := QryAtualizaSaldoI.FieldByName('VLRIRPROV').asFloat;
               wMovimIRApu   := QryAtualizaSaldoI.FieldByName('VLRIRAPU').asFloat;
               wMovimIOFProv := QryAtualizaSaldoI.FieldByName('VLRIOFPROV').asFloat;
               wMovimIOFApu  := QryAtualizaSaldoI.FieldByName('VLRIOFAPU').asFloat;

// Custo de Aquisicao é igual a Negativo de (QUANTIDADE DA OPERACAO *
//                                           CUSTO DE AQUISICAO MEDIO ANTERIOR)
               wMovimAqui := ((fQtdInvestOperacao * (wSaldoAquiAnt / wQtdInvestAnt))*-1);

// Caso Compra(A) Ou despesa de Compra
            End Else If ( (cNaturezaMovimento = 'A')  Or ( (cNaturezaMovimento = 'E') And
                                                           (cNaturezaOperacao = 'A') ) )
              Then Begin
// Juros é igual ao Carregamento
                wMovimCar  := (fValorOperacao / wCotaMoeda);
                wMovimAqui := fValorOperacao;
            End;

// Caso Movimento O/U(OPCOES) ou despesas de O/U,
// Calcula Premio
{            If (cNaturezaMovimento = 'O') Or (cNaturezaMovimento = 'U') Or
               ( (cNaturezaMovimento = 'E') And ( (cNaturezaOperacao = 'O') Or
}
            If (cNaturezaMovimento = 'O') Or (cNaturezaMovimento = 'U') Then Begin
// Premio (Valor da Operacao)
              wMovimPre  := fValorOperacao;
            End;
          End Else Begin
// Caso Atualização, Apaga os Movimentos e Repete os Saldos
            wMovimAtu :=0;
            wMovimAqui:=0;
            wMovimCar :=0;
            wMovimVar := QryAtualizaSaldoI.FieldByName('VLRVARIACAO').asFloat;
            wMovimJur := QryAtualizaSaldoI.FieldByName('VLRJUROS').asFloat;
            wMovimIRProv  := QryAtualizaSaldoI.FieldByName('VLRIRPROV').asFloat;
            wMovimIRApu   := QryAtualizaSaldoI.FieldByName('VLRIRAPU').asFloat;
            wMovimIOFProv := QryAtualizaSaldoI.FieldByName('VLRIOFPROV').asFloat;
            wMovimIOFApu  := QryAtualizaSaldoI.FieldByName('VLRIOFAPU').asFloat;
            wMovimAgio    := QryAtualizaSaldoI.FieldByName('VLRAGIO').asFloat;
//            wMovimPre :=
            wSaldoAtu :=wSaldoAtuAnt;
          End;

//------------------------------------------------------------------------------
// CASO SEJA TRANSFERENCIA (NO INVESTIMENTO)
          If (wTipoMov = 'TRF') Then Begin
// Caso Diminua (D)
            If (cNaturezaMovimento = 'D') Then Begin
// Atuarial, Custo de Carregamento e Aquisicao com o Anterior *-1)
              wMovimAtu :=((fQtdInvestOperacao*(wSaldoAtuAnt/wQtdInvestAnt)) *-1);
              wMovimCar :=((fQtdInvestOperacao*(wSaldoCarAnt/wQtdInvestAnt)) *-1);
              wMovimAqui:=((fQtdInvestOperacao*(wSaldoAquiAnt/wQtdInvestAnt))*-1);
              wMovimVar :=((fQtdInvestOperacao*(wSaldoVarAnt /wQtdInvestAnt))*-1);
              wMovimJur :=((fQtdInvestOperacao*(wSaldoJurAnt /wQtdInvestAnt))*-1);
              wMovimPre :=((fQtdInvestOperacao*(wSaldoPreAnt /wQtdInvestAnt))*-1);
              wMovimIRProv  := ((fQtdInvestOperacao * (wSaldoIRProvAnt  / wQtdInvestAnt))*-1);
              wMovimIRApu   := ((fQtdInvestOperacao * (wSaldoIRApuAnt   / wQtdInvestAnt))*-1);
              wMovimIOFProv := ((fQtdInvestOperacao * (wSaldoIOFProvAnt / wQtdInvestAnt))*-1);
              wMovimIOFApu  := ((fQtdInvestOperacao * (wSaldoIOFApuAnt  / wQtdInvestAnt))*-1);
              wMovimAgio    := ((fQtdInvestOperacao * (wSaldoAgioAnt    / wQtdInvestAnt))*-1);
            End;

// Caso Diminua (A)
            If (cNaturezaMovimento = 'A') Then Begin
              FazQuery(QryLocal,
                'SELECT  MOVIMAQUI, MOVIMCAR, MOVIMATU, VLRVARIACAO, VLRJUROS, VLRPREMIO, '+
                '        VLRIRPROV, VLRIRAPU, VLRIOFPROV, VLRIOFAPU, VLRAGIO, QTDEMOVINVCART '+
                'FROM CM.HISTCARTINV                      '+
                'WHERE 	(TIPMOVCARTINV    = ''TRF'') AND '+
                '        (NATURMOVCARTINV  = ''D'')   AND '+
                '      	(IDOPERACAOINVEST = '+
                QuotedStr(QryAtualizaSaldoI.FieldByName('IDOPERACAOINVEST').AsString)+')');

// Percentual informado em OperacaoInvest para Rateio de Custo no caso de Cisão.
              if QryAtualizaSaldoI.FieldByName('IDTIPOOPERACAO').asInteger = RPI.IDTIPOOPERDIRCIS then begin
                 FazQuery(QryLocal1,
                   'SELECT  PERCENTUAL      '+
                   'FROM CM.OPERACAOINVEST  '+
                   'WHERE 	(IDOPERACAOINVEST = '+
                   QuotedStr(QryAtualizaSaldoI.FieldByName('IDOPERACAOINVEST').AsString)+') ');
                 wMovimAqui := (QryLocal1.FieldByName('PERCENTUAL').AsFloat /100 *
                               (fQtdInvestOperacao*
                                (QryLocal.FieldByName('MOVIMAQUI').AsFloat /
                                 QryLocal.FieldByName('QTDEMOVINVCART').AsFloat))*-1);
              end else
                 wMovimAqui := (QryLocal.FieldByName('MOVIMAQUI').AsFloat*-1);
              QryLocal1.Close;

// Atuarial, Custo de Carregamento e Aquisicao com o Anterior *-1)
              wMovimAtu  := (QryLocal.FieldByName('MOVIMATU').AsFloat *-1);
              wMovimCar  := (QryLocal.FieldByName('MOVIMCAR').AsFloat *-1);
              wMovimVar  := (QryLocal.FieldByName('VLRVARIACAO').AsFloat*-1);
              wMovimJur  := (QryLocal.FieldByName('VLRJUROS').AsFloat*-1);
              wMovimPre  := (QryLocal.FieldByName('VLRPREMIO').AsFloat*-1);
              wMovimIRProv   := (QryLocal.FieldByName('VLRIRPROV').AsFloat*-1);
              wMovimIRApu    := (QryLocal.FieldByName('VLRIRAPU').AsFloat*-1);
              wMovimIOFProv  := (QryLocal.FieldByName('VLRIOFPROV').AsFloat*-1);
              wMovimIOFApu   := (QryLocal.FieldByName('VLRIOFAPU').AsFloat*-1);
              wMovimAgio     := (QryLocal.FieldByName('VLRAGIO').AsFloat*-1);
              QryLocal.Close;
            End;
          End;

// Caso Movimento seja de Rendimento Zera o Movimento de Aquisicao e Acumula Rendimento
          If (cNaturezaMovimento = 'R') Then Begin
             wSaldoRend:= wSaldoRendAnt + fValorOperacao;
             wMovimAqui:=0;
             wMovimCar :=0;
          End Else
             wSaldoRend := wSaldoRendAnt;

// Calcula Sados de Carregamento, Aquisicao, Variação, Juros e Premio
          wSaldoCar  := (wSaldoCarAnt  + wMovimCar);
          wSaldoAqui := (wSaldoAquiAnt + wMovimAqui);
          wSaldoAtu  := (wSaldoAtuAnt  + wMovimAtu);

          wSaldoVar  := (wSaldoVarAnt  + wMovimVar);
          wSaldoJur  := (wSaldoJurAnt  + wMovimJur);
          wSaldoPre  := (wSaldoPreAnt  + wMovimPre);

          wSaldoIRProv  := (wSaldoIRProvAnt  + wMovimIRProv);
          wSaldoIRApu   := (wSaldoIRApuAnt   + wMovimIRApu);
          wSaldoIOFProv := (wSaldoIOFProvAnt + wMovimIOFProv);
          wSaldoIOFApu  := (wSaldoIOFApuAnt  + wMovimIOFApu);
          wSaldoAgio    := (wSaldoAgioAnt    + wMovimAgio);

// Acerta Flag de Calculo de Saldo ( 1 -> 2 ou 3-> '')
          If Trim(QryAtualizaSaldoI.FieldByName('FLGCALCSALDO').asString) = '2' Then Begin
            wTipoAtualizacao := '';
          End;
// Caso a o Saldo em quantidade da Carteira Zere, Zera os saldos de
// Rendimento e Atarial
          If fQtdeFinalInvest = 0 Then Begin
            wSaldoRend := 0;
            wSaldoAtu  := 0;
          End;

// Muda o Separador Decimal
          wDec:=DecimalSeparator;
          DecimalSeparator :='.';
//------------------------------------------------------------------------------
// Tenta atualizar o Arquivo
          If Not ExecutaQuery(QryLocal,
                   'UPDATE HISTCARTINV SET '+
                   'SALDOQTDEINVCART   = '+FloatToStr(fQtdeFinalInvest) +', '+
                   'SALDOVLRINVCART    = '+FloatToStr(fValorFinalInvest)+', '+
                   'MOVIMATU       = '+FloatToStr(wMovimAtu) +', '+
                   'SALDOATU       = '+FloatToStr(wSaldoAtu) +', '+
                   'MOVIMCAR       = '+FloatToStr(wMovimCar) +', '+
                   'SALDOCAR       = '+FloatToStr(wSaldoCar) +', '+
                   'MOVIMAQUI      = '+FloatToStr(wMovimAqui)+', '+
                   'SALDOAQUI      = '+FloatToStr(wSaldoAqui)+', '+
                   'SALDOREND      = '+FloatToStr(wSaldoRend)+', '+
//                   'VLRJUROS    = '+FloatToStr(wMovimJur) +', '+
                   'SALDOVARIACAO  = '+FloatToStr(wSaldoVar) +', '+
                   'SALDOJUROS     = '+FloatToStr(wSaldoJur) +', '+
                   'VLRVARIACAO    = '+FloatToStr(wMovimVar) +', '+
                   'VLRJUROS       = '+FloatToStr(wMovimJur) +', '+
                   'VLRPREMIO      = '+FloatToStr(wMovimPre) +', '+
                   'SALDOPREMIO    = '+FloatToStr(wSaldoPre) +', '+
                   'VLRIRPROV      = '+FloatToStr(wMovimIRProv) +', '+
                   'SALDOIRPROV    = '+FloatToStr(wSaldoIRProv) +', '+
                   'VLRIRAPU       = '+FloatToStr(wMovimIRApu) +', '+
                   'SALDOIRAPU     = '+FloatToStr(wSaldoIRApu) +', '+
                   'VLRIOFPROV     = '+FloatToStr(wMovimIOFProv) +', '+
                   'SALDOIOFPROV   = '+FloatToStr(wSaldoIOFProv) +', '+
                   'VLRIOFAPU      = '+FloatToStr(wMovimIOFApu) +', '+
                   'SALDOIOFAPU    = '+FloatToStr(wSaldoIOFApu) +', '+
                   'VLRAGIO        = '+FloatToStr(wMovimAgio) +', '+
                   'SALDOAGIO      = '+FloatToStr(wSaldoAgio) +', '+
                   'FLGCALCSALDO      = '+QuotedStr(wTipoAtualizacao) +'  '+
                   'WHERE (IDHISTCARTINV = '+
                          QuotedStr(QryAtualizaSaldoI.FieldByName('IDHISTCARTINV').AsString)+')')
          Then Begin
            MsgDlg('Saldos não Atualizados, Erro ao atualizar Histórico dos Investimentos . ',
                   'Mensagem do Sistema',mtError,[mbOK],0);
// Libera Objetos Locais
            DecimalSeparator :=wDec;
//            QryLocal.Free;
            Exit;
          End;
          DecimalSeparator :=wDec;
          QryLocal.Close;

          fQtdeInicialInvest   := fQtdeFinalInvest;
          fValorInicialInvest  := fValorFinalInvest;
          wQtdInvestAnt        := fQtdeFinalInvest;
          wSaldoAtuAnt         := wSaldoAtu;
          wSaldoCarAnt         := wSaldoCar;
          wSaldoAquiAnt        := wSaldoAqui;
          wSaldoRendAnt        := wSaldoRend;
          wSaldoVarAnt         := wSaldoVar;
          wSaldoJurAnt         := wSaldoJur;
          wSaldoPreAnt         := wSaldoPre;
          wSaldoIRProvAnt      := wSaldoIRProv;
          wSaldoIRApuAnt       := wSaldoIRApu;
          wSaldoIOFProvAnt     := wSaldoIOFProv;
          wSaldoIOFApuAnt      := wSaldoIOFApu;
          wSaldoAgioAnt        := wSaldoAgio;

          qryAtualizaSaldoI.Next;
        End;
        if not Result then begin
          mensagem := 'Foram encontradas Inconsistências no Cálculo dos Saldos de Investimentos!';
          MsgDlg(mensagem, 'Erro', mtError, [mbOk], 0);
        end;

      Except
         MsgDlg('Erro na tentativa de Atualização dos Saldos','Erro',mtError,[mbOK],0);
         Raise;
         Result := false;
//         QryLocal.Free;
         Exit;
      end;
    End;

// Final do Processo \\
  Finally
    dtmOperacaoInvest.qrySaldoCarteira.Close;       {qrySaldoCarteira.Close}
    dtmOperacaoInvest.qryFlgAtualSaldo13.Close;     {qryFlgAtualSaldo13.Close}
    dtmOperacaoInvest.qryFlgAtualSaldo2.Close;      {qryFlgAtualSaldo2.Close}
    dtmOperacaoInvest.qryAtualizaSaldoC.Close;      {qryAtualizaSaldoC.Close}
    dtmOperacaoInvest.qryAtualizaSaldoIL.Close;     {qryAtualizaSaldoI.Close}
    QryLocal.Free;
    QryLocal1.Free;
  End;

end;


//--------------------------------------------------------------------------------------------------
//    Função que Calcula Saldo de Carteira, Investimento ou Carteira/Investimento no dia
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros :
//       iInvestimento   :  id do Investimento                     (idInvestimento)
//       iCarteira       :  id da Carteira de Investimentos        (idCarteiraInvest)
//       -------------------------------------------------------------------------------------------
//          passar (-1) caso os parâmetros não sejam necessários
//       -------------------------------------------------------------------------------------------
//       dDataOper  :  Data do Saldo desejado
//--------------------------------------------------------------------------------------------------
// Função que Calcula Saldos de Carteira, Investimento ou Carteira/Investimento no dia
function TOperComum.CalculaSaldo(iInvestimento, iCarteira: integer; sLote: string; dDataOper: TDateTime;
                var fSaldoQtdeInvCart, fSaldoVlrInvCart, fSaldoCotasCartInv,
                    fSaldoVlrCartInv, fSaldoAtu, fSaldoCar, fSaldoAqui, fSaldoRend, fSaldoMercado,
                    fSaldoVar, fSaldoJur, fSaldoPre, fSaldoIRProv, fSaldoIRApu, fSaldoIOFProv,
                    fSaldoIOFApu, fSaldoAgio: double)
                    : boolean;

var
   qrySaldoCarteira, qrySaldoInvest, QryLocal : TwwQuery;
   bRetorno : boolean;
   fSdoParcQtdeInvCart, fSdoParcVlrInvCart, fSdoParcAtu, fSdoParcAqui,
   fSdoParcRend, fSdoParcCar, fSdoParcMercado, fSdoParcVar, fSdoParcJur,
   fSdoParcPre, fSdoParcInutil, fSdoParcIRProv, fSdoParcIRApu, fSdoParcIOFProv,
   fSdoParcIOFApu, fSdoParcAgio : double;

begin
   try
      fSaldoCotasCartInv  := 0;
      fSaldoVlrCartInv    := 0;
      fSaldoQtdeInvCart   := 0;
      fSaldoVlrInvCart    := 0;
      fSaldoAtu           := 0;
      fSaldoAqui          := 0;
      fSaldoRend          := 0;
      fSaldoCar           := 0;
      fSaldoMercado       := 0;
      fSaldoVar           := 0;
      fSaldoJur           := 0;
      fSaldoPre           := 0;
      fSaldoIRProv        := 0;
      fSaldoIRApu         := 0;
      fSaldoIOFProv       := 0;
      fSaldoIOFApu        := 0;
      fSaldoAgio          := 0;

      if (iInvestimento = -1) and (sLote = '-1') and (ICarteira <> -1) then begin
         // Busca Saldo da Carteira
         qrySaldoCarteira := TwwQuery(dtmOperComum.qrySaldoCarteira);
         with qrySaldoCarteira do begin
            Close;
            if not(Prepared) then Prepare;
            ParamByName('IDCARTEIRA').AsInteger     := iCarteira;
            ParamByName('DATAMOV').AsDateTime       := dDataOper;
            ParamByName('IDHISTORICO').AsInteger    := high(integer);
            Open;
            First;
         end;
         if not qrySaldoCarteira.isEmpty then
            fSaldoCotasCartInv := qrySaldoCarteira.FieldByName('SALDOCOTASCARTINV').AsFloat;
            fSaldoVlrCartInv   := qrySaldoCarteira.FieldByName('SALDOVLRCARTINV').AsFloat;
      end;

      if (iInvestimento <> -1) and (sLote <> '-1') and (ICarteira <> -1) then
         // Busca Saldo do Lote do Investimento em questão na Carteira
         BuscaTodosSaldosInvestLote (
                 iCarteira, iInvestimento, 99999999, sLote, dDataOper,
                 fSaldoQtdeInvCart, fSaldoVlrInvCart, fSaldoAtu,     fSaldoCar,
                 fSaldoAqui,        fSaldoRend,       fSaldoMercado, fSaldoVar,
                 fSaldoJur,         fSaldoPre,        fSaldoIRProv,  fSaldoIRApu,
                 fSaldoIOFProv,     fSaldoIOFApu,     fSaldoAgio);

      if (iInvestimento <> -1) and (sLote = '-1') and (ICarteira = -1) then begin
         // Busca Saldo do Investimento em todas as Carteira em que ele existir

         // Cria Objetos Locais
         QryLocal              := TwwQuery.Create(Application);
         QryLocal.DatabaseName := 'BaseDados';

         // Busca Carteiras que possuem o Investimento
         with QryLocal do
           begin
               Close;
               Sql.Clear;
               Sql.add(' SELECT DISTINCT IDCARTEIRAINVEST, IDLOTE              ');
               Sql.add(' FROM CM.HISTCARTINV                                   ');
               Sql.add(' WHERE (IDINVESTIMENTO = '+InttoStr(iInvestimento)+')  ');
               Sql.add(' ORDER BY IDCARTEIRAINVEST, IDLOTE                  ');
               Open;
           end;

         while not QryLocal.EOF do begin
         // Acumula Saldo do Investimento em questão nessa Carteira

            fSdoParcQtdeInvCart  := 0;
            fSdoParcVlrInvCart   := 0;
            fSdoParcAtu          := 0;
            fSdoParcAqui         := 0;
            fSdoParcRend         := 0;
            fSdoParcCar          := 0;
            fSdoParcMercado      := 0;
            fSdoParcVar          := 0;
            fSdoParcJur          := 0;
            fSdoParcPre          := 0;
            fSdoParcIRProv       := 0;
            fSdoParcIRApu        := 0;
            fSdoParcIOFProv      := 0;
            fSdoParcIRApu        := 0;
            fSdoParcAgio         := 0;
            if BuscaTodosSaldosInvestLote (
                    QryLocal.FieldByName('IDCARTEIRAINVEST').AsInteger,
                    iInvestimento, 99999999,
                    QryLocal.FieldByName('IDLOTE').AsString, dDataOper,
                    fSdoParcQtdeInvCart, fSdoParcVlrInvCart, fSdoParcAtu, fSdoParcCar,
                    fSdoParcAqui       , fSdoParcRend      , fSdoParcMercado,
                    fSdoParcVar        , fSdoParcJur       , fSdoParcPre,
                    fSdoParcIRProv     , fSdoParcIRApu     , fSdoParcIOFProv,
                    fSdoParcIRApu      , fSdoParcAgio) then begin

               fSaldoQtdeInvCart   := fSaldoQtdeInvCart + fSdoParcQtdeInvCart;
               fSaldoVlrInvCart    := fSaldoVlrInvCart  + fSdoParcVlrInvCart;
               fSaldoAtu           := fSaldoAtu         + fSdoParcAtu;
               fSaldoAqui          := fSaldoAqui        + fSdoParcAqui;
               fSaldoRend          := fSaldoRend        + fSdoParcRend;
               fSaldoCar           := fSaldoCar         + fSdoParcCar;
               fSaldoMercado       := fSaldoMercado     + fSdoParcMercado;
               fSaldoVar           := fSaldoVar         + fSdoParcVar;
               fSaldoJur           := fSaldoJur         + fSdoParcJur;
               fSaldoPre           := fSaldoPre         + fSdoParcPre;
               fSaldoIRProv        := fSaldoIRProv      + fSdoParcIRProv;
               fSaldoIRApu         := fSaldoIRApu       + fSdoParcIRApu;
               fSaldoIOFProv       := fSaldoIOFProv     + fSdoParcIOFProv;
               fSaldoIOFApu        := fSaldoIOFApu      + fSdoParcIOFApu;
               fSaldoAgio          := fSaldoAgio        + fSdoParcAgio;
            end;
            // Pula para o Proximo Registro
            QryLocal.Next;
         end;
         // Libera Objetos Locais
         QryLocal.Free;
      end;

      if (iInvestimento <> -1) and (sLote = '-1') and (ICarteira <> -1) then begin
         // Busca Saldo do Investimento na Carteira (percorre todos os lotes)

         // Cria Objetos Locais
         QryLocal              := TwwQuery.Create(Application);
         QryLocal.DatabaseName := 'BaseDados';

         // Busca Carteiras que possuem o Investimento
         with QryLocal do
           begin
               Close;
               Sql.Clear;
               Sql.add(' SELECT DISTINCT IDLOTE              ');
               Sql.add(' FROM CM.HISTCARTINV                                   ');
               Sql.add(' WHERE (IDCARTEIRAINVEST = '+InttoStr(iCarteira)+')  ');
               Sql.add('   and (IDINVESTIMENTO   = '+InttoStr(iInvestimento)+')  ');
               Sql.add(' ORDER BY IDLOTE                  ');
               Open;
           end;

         while not QryLocal.EOF do begin
            // Acumula Saldo do Investimento em questão nessa Carteira

            fSdoParcQtdeInvCart  := 0;
            fSdoParcVlrInvCart   := 0;
            fSdoParcAtu          := 0;
            fSdoParcAqui         := 0;
            fSdoParcRend         := 0;
            fSdoParcCar          := 0;
            fSdoParcMercado      := 0;
            fSdoParcVar          := 0;
            fSdoParcJur          := 0;
            fSdoParcPre          := 0;
            fSdoParcIRProv       := 0;
            fSdoParcIRApu        := 0;
            fSdoParcIOFProv      := 0;
            fSdoParcIRApu        := 0;
            fSdoParcAgio         := 0;
            if BuscaTodosSaldosInvestLote (
                    iCarteira, iInvestimento, 99999999,
                    QryLocal.FieldByName('IDLOTE').AsString, dDataOper,
                    fSdoParcQtdeInvCart, fSdoParcVlrInvCart, fSdoParcAtu, fSdoParcCar,
                    fSdoParcAqui       , fSdoParcRend      , fSdoParcMercado,
                    fSdoParcVar        , fSdoParcJur       , fSdoParcPre,
                    fSdoParcIRProv     , fSdoParcIRApu     , fSdoParcIOFProv,
                    fSdoParcIRApu      , fSdoParcAgio) then begin
               fSaldoQtdeInvCart   := fSaldoQtdeInvCart + fSdoParcQtdeInvCart;
               fSaldoVlrInvCart    := fSaldoVlrInvCart  + fSdoParcVlrInvCart;
               fSaldoAtu           := fSaldoAtu         + fSdoParcAtu;
               fSaldoAqui          := fSaldoAqui        + fSdoParcAqui;
               fSaldoRend          := fSaldoRend        + fSdoParcRend;
               fSaldoCar           := fSaldoCar         + fSdoParcCar;
               fSaldoMercado       := fSaldoMercado     + fSdoParcMercado;
               fSaldoVar           := fSaldoVar         + fSdoParcVar;
               fSaldoJur           := fSaldoJur         + fSdoParcJur;
               fSaldoPre           := fSaldoPre         + fSdoParcPre;
               fSaldoIRProv        := fSaldoIRProv      + fSdoParcIRProv;
               fSaldoIRApu         := fSaldoIRApu       + fSdoParcIRApu;
               fSaldoIOFProv       := fSaldoIOFProv     + fSdoParcIOFProv;
               fSaldoIOFApu        := fSaldoIOFApu      + fSdoParcIOFApu;
               fSaldoAgio          := fSaldoAgio        + fSdoParcAgio;
            end;
            // Pula para o Proximo Registro
            QryLocal.Next;
         end;
         // Libera Objetos Locais
         QryLocal.Free;
      end;

   finally
      dtmOperComum.qrySaldoCarteira.Close;       {qrySaldoCarteira.Close}
   end;
end;





// Função que Soma Saldos dos  Investimentos na Carteira para uma determinada data
function TOperComum.SaldosInvCart(iCarteira: integer; dDataRef: TDateTime;
                var fSaldoQtdeInvCart, fSaldoVlrInvCart,
                    fSaldoAtu, fSaldoCar, fSaldoAqui, fSaldoRend, fSaldoMercado: double)
                    : boolean;
var
   QryLocal  :TwwQuery;
   bRetorno : boolean;
   fSdoParcQtdeInvCart, fSdoParcVlrInvCart, fSdoParcAtu, fSdoParcAqui, fSdoParcRend,
   fSdoParcCar, fSdoParcMercado, fSaldoInutil : double;
begin
    fSaldoQtdeInvCart  := 0;
    fSaldoVlrInvCart   := 0;
    fSaldoAtu          := 0;
    fSaldoAqui         := 0;
    fSaldoRend         := 0;
    fSaldoCar          := 0;
    fSaldoMercado      := 0;

    QryLocal             := TwwQuery.Create(Application);
    QryLocal.DatabaseName:= 'BaseDados';

    with QryLocal do
      begin
          Close;
          Sql.Clear;
          Sql.add(' SELECT DISTINCT IDINVESTIMENTO, IDLOTE            ');
          Sql.add(' FROM CM.HISTCARTINV                               ');
          Sql.add(' WHERE (IDCARTEIRAINVEST = '+InttoStr(iCarteira)+')  ');
          Sql.add('   and (IDINVESTIMENTO IS not NULL)                ');
          Sql.add(' ORDER BY IDINVESTIMENTO, IDLOTE                ');
          Open;
      end;
      while not QryLocal.EOF do begin
      // Acumula Saldo do Investimento em questão nessa Carteira
         fSdoParcQtdeInvCart  := 0;
         fSdoParcVlrInvCart   := 0;
         fSdoParcAtu          := 0;
         fSdoParcAqui         := 0;
         fSdoParcRend         := 0;
         fSdoParcCar          := 0;
         if BuscaTodosSaldosInvestLote ( iCarteira,
                 QryLocal.FieldByName('IDINVESTIMENTO').AsInteger,
                 99999999,
                 QryLocal.FieldByName('IDLOTE').AsString, dDataRef,
                 fSdoParcQtdeInvCart, fSdoParcVlrInvCart, fSdoParcAtu, fSdoParcCar,
                 fSdoParcAqui       , fSdoParcRend      ,  fSdoParcMercado,
                 fSaldoInutil       , fSaldoInutil      , fSaldoInutil,
                 fSaldoInutil       , fSaldoInutil      , fSaldoInutil,
                 fSaldoInutil       , fSaldoInutil) then begin
            fSaldoQtdeInvCart   := fSaldoQtdeInvCart + fSdoParcQtdeInvCart;
            fSaldoVlrInvCart    := fSaldoVlrInvCart  + fSdoParcVlrInvCart;
            fSaldoAtu           := fSaldoAtu         + fSdoParcAtu;
            fSaldoAqui          := fSaldoAqui        + fSdoParcAqui;
            fSaldoRend          := fSaldoRend        + fSdoParcRend;
            fSaldoCar           := fSaldoCar         + fSdoParcCar;
            fSaldoMercado       := fSaldoMercado     + fSdoParcMercado;
         end;
         // Pula para o Proximo Registro
         QryLocal.Next;
      end;

  QryLocal.Free;

end;




// Função que Busca Cotação de um Investimento numa determinada data
function TOperComum.BuscaCotacaoInvest(iInvestimento: integer; dDataRef: TDateTime; bUsaLote: boolean): double;
var
   QryLocal  :TwwQuery;
begin
    Result := 0;
    QryLocal             := TwwQuery.Create(Application);
    QryLocal.DatabaseName:= 'BaseDados';

    FazQuery(QryLocal,
      'SELECT DATACOTACAO, VLRCONTABIL, QTDTITLOTE '+
      'FROM COTACAOINVEST '+
      'WHERE 	(IDINVESTIMENTO = '''+ InttoStr(iInvestimento)+''') and '+
      '      	(DATACOTACAO <= TO_DATE( '''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) '+
      'ORDER BY DATACOTACAO DESC ');
// Caso Utilize Lote Faz Calculo
    if bUsaLote then begin
      if QryLocal.FieldByName('QTDTITLOTE').AsFloat <> 0 then
         Result := (QryLocal.FieldByName('VLRCONTABIL').AsFloat /
                   QryLocal.FieldByName('QTDTITLOTE').AsFloat)
      else
         Result := QryLocal.FieldByName('VLRCONTABIL').AsFloat;
    end else begin
// Caso Não Utilize Lote. Guarda
      Result := QryLocal.FieldByName('VLRCONTABIL').AsFloat;
    end;
    QryLocal.Free;
end;





// Função que Busca Cotação de uma Moeda numa determinada data.
function TOperComum.LeMoeda(iMoeCodigo: integer; dCotData: TDateTime; sFlgProRata, sFlgInterpola: string): double;
var
   QryMoeda  :TwwQuery;
   fCotacao1, fCotacao2, fCotacao3 : double;
   dDataCotacao1, dDataCotacao2, dDataCotacao3 : TDateTime;
   iIntervalo1, iIntervalo2: integer;
   sMsgErro: string;
begin
   Result := 0;
//   ShowMessage('D');
   sMsgErro := 'Erro, Cadastro de Cotação de Moeda tem dados insuficientes para Cálculo Pró-Rata, Verifique !!!';
   try
      // testa valores de sFlgProRata
      if (sFlgProRata <> 'N') and (sFlgProRata <> 'L') and (sFlgProRata <> 'C') then begin
         MsgDlg('Parâmetro para Tipo de Cálculo informado incorretamente!', 'Erro', mtError, [mbOk], 0);
         Result := 0;
         Exit;
      end;
      // testa valores de sFlgInterpola
      if (sFlgProRata <> 'N') and ((sFlgInterpola <> 'I') and (sFlgInterpola <> 'E')) then begin
         MsgDlg('Parâmetro para Cálculo Pró-Rata informado incorretamente!', 'Erro', mtError, [mbOk], 0);
         Result := 0;
         Exit;
      end;

      qryMoeda := TwwQuery(dtmOperComum.qryMoeda);

      with qryMoeda do begin
         Close;
         if not(Prepared) then Prepare;
         ParamByName('MOEDA').AsInteger    := iMoeCodigo;
         Open;
         First;
      end;
      if qryMoeda.isEmpty then begin
         MsgDlg('Moeda não encontrada : '+QryMoeda.FieldByName('MOESIGLA').AsString,'Mensagem do Sistema',MtError,[MbOk],0);
         Result := 0;
         Exit;
      end;
//    Se não calcula Pró-Rata
      if sFlgProRata = 'N' then begin
         BuscaCotacaoMoeda(iMoeCodigo, dCotData, '', fCotacao1, dDataCotacao1);
         Result := fCotacao1;
      end else begin
         if QryMoeda.FieldByName('MOEPERIODICIDADE').AsString = 'D' then begin
            BuscaCotacaoMoeda(iMoeCodigo, dCotData, '', fCotacao1, dDataCotacao1);
            Result := fCotacao1;
         end else begin
            if QryMoeda.FieldByName('FLGPERCVALOR').AsString = 'V' then begin
//             Se existir cotação na data de referência
               if BuscaCotacaoMoeda(iMoeCodigo, dCotData, '=', fCotacao1, dDataCotacao1) then begin
                  Result := fCotacao1;
               end else begin
//                Alimenta Parâmetros de Calculo Pró-Rata por Interpolação
                  if sFlgInterpola = 'I' then begin
                     if not BuscaCotacaoMoeda(iMoeCodigo, dCotData, '<', fCotacao1, dDataCotacao1) then begin
                        MsgDlg(sMsgErro, 'Erro', mtError, [mbOk], 0);
                        Result := 0;
                        Exit;
                     end;
                     fCotacao3     := fCotacao1;
                     dDataCotacao3 := dDataCotacao1;
                     if not BuscaCotacaoMoeda(iMoeCodigo, dCotData, '>', fCotacao2, dDataCotacao2) then begin
                        MsgDlg(sMsgErro, 'Erro', mtError, [mbOk], 0);
                        Result := 0;
                        Exit;
                     end;
                     iIntervalo1   := DiasUteis.IntervaloDias(dDataCotacao1, dDataCotacao2);
                     iIntervalo2   := DiasUteis.IntervaloDias(dDataCotacao1, dCotData);
                  end else begin
//                   Alimenta Parâmetros de Calculo Pró-Rata por Extrapolação
                     if not BuscaCotacaoMoeda(iMoeCodigo, dCotData, '<', fCotacao2, dDataCotacao2) then begin
                        MsgDlg(sMsgErro, 'Erro', mtError, [mbOk], 0);
                        Result := 0;
                        Exit;
                     end;
                     fCotacao3     := fCotacao2;
                     dDataCotacao3 := dDataCotacao2;
                     if not BuscaCotacaoMoeda(iMoeCodigo, dDataCotacao2, '<', fCotacao1, dDataCotacao1) then begin
                        MsgDlg(sMsgErro, 'Erro', mtError, [mbOk], 0);
                        Result := 0;
                        Exit;
                     end;
                     iIntervalo1   := DiasUteis.IntervaloDias(dDataCotacao1, dDataCotacao2);
                     iIntervalo2   := DiasUteis.IntervaloDias(dDataCotacao2, dCotData);
                  end;
//                Executa Cáculo Pró-Rata Linear
                  if sFlgProRata = 'L' then
                     Result := fCotacao3 * ((((fCotacao2/fCotacao1) - 1)
                                         * (iIntervalo2/iIntervalo1)) + 1)
                  else
//                Executa Cáculo Pró-Rata Exponencial
                     Result := fCotacao3 * Power((fCotacao2/fCotacao1),
                                                 (iIntervalo2/iIntervalo1));
               end;
            end else if QryMoeda.FieldByName('FLGPERCVALOR').AsString = 'P' then begin
//             Se existir cotação na data de referência
               if BuscaCotacaoMoeda(iMoeCodigo, dCotData, '=', fCotacao1, dDataCotacao1) then begin
                  Result := 0;
               end else begin
//                Alimenta Parâmetros de Calculo Pró-Rata por Interpolação
                  if sFlgInterpola = 'I' then begin
                     if not BuscaCotacaoMoeda(iMoeCodigo, dCotData, '>', fCotacao2, dDataCotacao2) then begin
                        MsgDlg('Erro, Cadastro de Cotação de Moeda tem dados insuficientes para Cálculo Pró-Rata, Verifique !!!', 'Erro', mtError, [mbOk], 0);
                        Result := 0;
                        Exit;
                     end;            
                     iIntervalo1 := DiasUteis.ExtraiDia(
                                      DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dDataCotacao2),
                                                          DiasUteis.ExtraiMes(dDataCotacao2)));
                     iIntervalo2 := DiasUteis.IntervaloDias(
                                      EncodeDate(DiasUteis.ExtraiAno(dDataCotacao2),
                                              DiasUteis.ExtraiMes(dDataCotacao2), 1),
                                      dCotData + 1);
                  end else begin
//                   Alimenta Parâmetros de Calculo Pró-Rata por Extrapolação
                     if not BuscaCotacaoMoeda(iMoeCodigo, dCotData, '<', fCotacao2, dDataCotacao2) then begin
                        MsgDlg(sMsgErro, 'Erro', mtError, [mbOk], 0);
                        Result := 0;
                        Exit;
                     end;
                     iIntervalo1 := DiasUteis.ExtraiDia(
                                      DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dDataCotacao2),
                                                          DiasUteis.ExtraiMes(dDataCotacao2)));
                     iIntervalo2 := DiasUteis.IntervaloDias(
                                      DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dDataCotacao2),
                                                          DiasUteis.ExtraiMes(dDataCotacao2)),
                                      dCotData);
                  end;
//                Executa Cáculo Pró-Rata Linear
                  if sFlgProRata = 'L' then
                     Result := fCotacao2 * (iIntervalo2/iIntervalo1)
                  else
//                Executa Cáculo Pró-Rata Exponencial
                     Result := Power((1 + fCotacao2), (iIntervalo2/iIntervalo1)) - 1;
               end;
            end;
         end;
      end;
   except
      Raise;
      Result := 0;
   end;
end;





// Função que Busca Cotação de uma Moeda numa determinada data.
function TOperComum.BuscaCotacaoMoeda(iMoeda: integer; dDataRef: TDateTime; sOperador: string;
var fCotacao: double; var dDataCotacao: TDateTime): boolean;
var
   sOrdenacao : string;
begin
   if sOperador = '' then sOperador := '<=';

   if sOperador[1] = '<' then begin
      sOrdenacao := 'DESC';
   end else begin
      sOrdenacao := '';
   end;

   try

      with dtmOperComum.qryAuxiliar do begin
         Close;
         SQL.Text :=
         'SELECT ' + chr(13) +
         '   M.MOECODIGO, M.COTDATA, M.COTVALOR ' + chr(13) +
         'FROM ' + chr(13) +
         '   COTACAOMOEDA M ' + chr(13) +
         'WHERE ' + chr(13) +
         '   ( M.MOECODIGO = ' + InttoStr(iMoeda) + ' ) ' + chr(13) +
         '   AND ( M.COTDATA ' + sOPerador + ' TO_DATE(''' + DateToStr(dDataRef) + ''',''DD/MM/YYYY'') ) ' + chr(13) +
         'ORDER BY ' + chr(13) +
         '   M.COTDATA ' + sOrdenacao;
         Open;

         Result := not(dtmOperComum.qryAuxiliar).isEmpty;

         fCotacao       := dtmOperComum.qryAuxiliar.FieldByName('COTVALOR').AsFloat;
         dDataCotacao   := dtmOperComum.qryAuxiliar.FieldByName('COTDATA').AsDateTime;
      end;

   finally
      dtmOperComum.qryAuxiliar.Close;
   end;
end;





// Função que Calcula Juros Diários a partir de um Valor e o Tipo de Juros.
function TOperComum.CalculaJurosDia(fValorJuros: double; iTipoJuros: integer): double;
var
   QryLocal  :TwwQuery;
   wParam1, wParam2: double;
begin
    Result := 0;
    QryLocal             := TwwQuery.Create(Application);
    QryLocal.DatabaseName:= 'BaseDados';

    FazQuery(QryLocal,
      'SELECT TAMPERJUROS, EFETNOMI '+
      'FROM TIPOJUROS '+
      'WHERE 	(CODTIPTXJUROS = '''+ InttoStr(iTipoJuros)+''')');

    if qryLocal.isEmpty then begin
      MsgDlg('Faltam dados para calcular Juros Diários!', 'Erro', mtError, [mbOk], 0);
    end else begin
      if QryLocal.FieldByName('EFETNOMI').AsString = 'E' then begin
         wParam1 := 1 + (fValorJuros / 100);
         wParam2 := 1 / QryLocal.FieldByName('TAMPERJUROS').AsFloat;
         Result := Power(wParam1, wParam2) - 1
      end else
         Result := fValorJuros / QryLocal.FieldByName('TAMPERJUROS').AsFloat;
    end;
    Result := Result * 100;

    QryLocal.Free;
end;





//--------------------------------------------------------------------------------------------------
//    MarcaFlgHistCartInv:  Exclui Lancamento na Carteira, e marca proximos registros do Investimento
//                          e Carteira com Flags
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       sTipoMovCart   :  'OPE' = Operação
//                         'DES' = Despesa
//       iHistCartInv   :  id do registro da HistCartInv
//
//--------------------------------------------------------------------------------------------------
Procedure TOperComum.MarcaFlgHistCartInv(TipoMovCart:String; IdLancamento:Integer);
Var
  QryLocalAux1, QryLocalAux2:TwwQuery;
  wIdCarteira, wIdInvestimento, wIdHistCartInv:Integer;
  wIdLote: String;
  wDataMov:TDate;
Begin
// Critica Parametros
  If (TipoMovCart <> 'OPE') And (TipoMovCart <> 'HST') Then Begin
    MsgDlg('Tipo de Movimento, "'+TipoMovCart+'" Inválido.','Mensagem do Sistema',
           MtError, [MbOk],0);
    Exit;
  End;

// Cria/Inicia Objetos e Variaveis Locais
  QryLocalAux1:= TwwQuery.Create(Application);
  QryLocalAux1.DatabaseName:='BaseDados';
  QryLocalAux2:= TwwQuery.Create(Application);
  QryLocalAux2.DatabaseName:='BaseDados';


// Busca Registro a Excluir de Acordo com o Tipo de Lancamento

//-- Lancamento de Operacao --\\
  If (TipoMovCart = 'OPE') Or (TipoMovCart = 'HST') Then Begin
    If (TipoMovCart = 'OPE') Then Begin
      If FazQuery(QryLocalAux1,
        'SELECT IDHISTCARTINV, FLGCALCSALDO, IDCARTEIRAINVEST, IDINVESTIMENTO, IDLOTE, DATAMOVCARTINV '+
        'FROM CM.HISTCARTINV WHERE IDOPERACAOINVEST = '+IntToStr(IdLancamento)+' '+
        'ORDER BY IDHISTCARTINV DESC ') Then Begin
// Guarda Variaveis
        wIdCarteira    :=QryLocalAux1.FieldByname('IDCARTEIRAINVEST').AsInteger;
        wIdInvestimento:=QryLocalAux1.FieldByname('IDINVESTIMENTO').AsInteger;
        wIdLote        :=QryLocalAux1.FieldByname('IDLOTE').AsString;
        wIdHistCartInv :=QryLocalAux1.FieldByname('IDHISTCARTINV').AsInteger;
        wDataMov       :=QryLocalAux1.FieldByname('DATAMOVCARTINV').AsDateTime;
      End;
    End Else If (TipoMovCart = 'HST') Then Begin
      If FazQuery(QryLocalAux1,
        'SELECT IDHISTCARTINV, FLGCALCSALDO, IDCARTEIRAINVEST, IDINVESTIMENTO, IDLOTE, DATAMOVCARTINV '+
        'FROM CM.HISTCARTINV WHERE IDHISTCARTINV = '+IntToStr(IdLancamento)) Then Begin
// Guarda Variaveis
        wIdCarteira    :=QryLocalAux1.FieldByname('IDCARTEIRAINVEST').AsInteger;
        wIdInvestimento:=QryLocalAux1.FieldByname('IDINVESTIMENTO').AsInteger;
        wIdLote        :=QryLocalAux1.FieldByname('IDLOTE').AsString;
        wIdHistCartInv :=QryLocalAux1.FieldByname('IDHISTCARTINV').AsInteger;
        wDataMov       :=QryLocalAux1.FieldByname('DATAMOVCARTINV').AsDateTime;
      End;
    End;
// Busca Proximo Lancamento da Mesma Carteira, Caso Não encontre Sai Fora
    If Not FazQuery(QryLocalAux1,
      'SELECT  IDHISTCARTINV, IDCARTEIRAINVEST, IDINVESTIMENTO, IDLOTE FROM CM.HISTCARTINV  '+
      'WHERE (IDCARTEIRAINVEST  = '+IntToStr(wIdCarteira)   +') AND '+
      '      ((DATAMOVCARTINV   > TO_DATE('''+DateToStr(wDataMov)+''',''DD/MM/YYYY'')) OR  '+
      '        ((DATAMOVCARTINV = TO_DATE('''+DateToStr(wDataMov)+''',''DD/MM/YYYY'')) AND '+
      '         (IDHISTCARTINV  > '+IntToStr(wIdHistCartInv)+')) )    '+
      'ORDER BY DATAMOVCARTINV, IDHISTCARTINV ') Then Begin

// Libera Objetos Locais
      QryLocalAux1.Free;
      QryLocalAux2.Free;
      Exit;
    End;

// Se o Investimento é o Mesmo do Anterior Marca com Flg "1" (Cart/Inv),
// caso não seja Marca com Flg "3" (Cart),
    If (QryLocalAux1.FieldByname('IDINVESTIMENTO').AsInteger = wIdInvestimento) and
       ( ((QryLocalAux1.FieldByname('IDLOTE').isNull) and (wIdLote = '')) or
         ((not QryLocalAux1.FieldByname('IDLOTE').isNull) and
                   (wIdLote = QryLocalAux1.FieldByname('IDLOTE').asString)) ) Then Begin
// Monta e Executa a Atualizacao
      QryLocalAux2.SQL.Clear;
      QryLocalAux2.SQL.Add(
        'UPDATE HISTCARTINV SET FLGCALCSALDO = ''1'' WHERE IDHISTCARTINV = '+
        QryLocalAux1.FieldByname('IDHISTCARTINV').AsString);
        QryLocalAux2.ExecSQL;
    End Else Begin
// Monta e Executa a Atualizacao
      QryLocalAux2.SQL.Clear;
      QryLocalAux2.SQL.Add(
        'UPDATE HISTCARTINV SET FLGCALCSALDO = ''3'' WHERE IDHISTCARTINV = '+
        QryLocalAux1.FieldByname('IDHISTCARTINV').AsString);
        Try
          QryLocalAux2.ExecSQL;
        Except
          Raise;
        End;
// Busca Proximo Lancamento do Mesmo Investimento
      If FazQuery(QryLocalAux1,
        'SELECT  IDHISTCARTINV, IDINVESTIMENTO FROM CM.HISTCARTINV  '+
        'WHERE (IDCARTEIRAINVEST = '+IntToStr(wIdCarteira)    +') AND '+
        '      (IDINVESTIMENTO   = '+IntToStr(wIdInvestimento)+') AND '+
        '      ((('''+wIdLote+''' IS NOT NULL) AND (IDLOTE ='''+wIdLote+''')) OR (('''+wIdLote+''' IS NULL) AND (IDLOTE IS NULL))) AND '+
        '      ( (DATAMOVCARTINV  > TO_DATE('''+DateToStr(wDataMov)+''',''DD/MM/YYYY'')) OR '+
        '        ((DATAMOVCARTINV  = TO_DATE('''+DateToStr(wDataMov)+''',''DD/MM/YYYY'')) AND '+
        '         (IDHISTCARTINV   > '+IntToStr(wIdHistCartInv)+')) )    '+
        'ORDER BY DATAMOVCARTINV, IDHISTCARTINV ') Then Begin
// Monta e Executa a Atualizacao
        QryLocalAux2.SQL.Clear;
        QryLocalAux2.SQL.Add(
          'UPDATE HISTCARTINV SET FLGCALCSALDO = ''2'' WHERE IDHISTCARTINV = '+
          QryLocalAux1.FieldByname('IDHISTCARTINV').AsString);
        Try
          QryLocalAux2.ExecSQL;
        Except
          Raise;
        End;
      End;
    End;
  End;
// Libera Objetos Locais
  QryLocalAux1.Free;
  QryLocalAux2.Free;
End;




// Calcula o valor da cota de uma Carteira na data informada
function TOperComum.BuscaVlrCotaCarteira(iCarteira: integer; dDataRef: TDateTime): double;
var
   fSaldoInicialCotas   : double;
   fSaldoInicialValor   : double;
begin
   Result := 0;

   // Verifica a HistCartInv para saber se já foi movimentada
   with dtmOperComum.qrySaldoCarteira do begin
      Close;
      if not(Prepared) then Prepare;
      ParamByName('CARTEIRA').AsInteger   := iCarteira;
      ParamByName('DATAMOV').AsDateTime   := dDataRef;
      ParamByName('HISTORICO').AsInteger  := high(integer);
      Open;
      First;
   end;

   // LEITURA DOS SALDOS INICIAIS
   // Verifica se esta será a primeira movimentação da carteira
   if not(dtmOperComum.qrySaldoCarteira.IsEmpty) then begin

      fSaldoInicialCotas   := dtmOperComum.qrySaldoCarteiraSALDOCOTASCARTINV.AsFloat;
      fSaldoInicialValor   := dtmOperComum.qrySaldoCarteiraSALDOVLRCARTINV.AsFloat;

      // Verifica se o Saldo em cotas é ZERO
      if fSaldoInicialCotas <> 0 then begin
         Result := fSaldoInicialValor / fSaldoInicialCotas;
      end else begin

         // Avança até achar saldo OK
         while not(dtmOperComum.qrySaldoCarteira.EOF) do begin
            fSaldoInicialCotas   := dtmOperComum.qrySaldoCarteiraSALDOCOTASCARTINV.AsFloat;
            fSaldoInicialValor   := dtmOperComum.qrySaldoCarteiraSALDOVLRCARTINV.AsFloat;

            if fSaldoInicialCotas <> 0 then begin
               Result := fSaldoInicialValor / fSaldoInicialCotas;
               Break;
            end;

            dtmOperComum.qrySaldoCarteira.Next;
         end;

      end;
   end;
end;





// Calcula o Saldo de uma Carteira na Data Informada
function TOperComum.BuscaSaldoCarteira(iCarteira: integer; dDataRef: TDateTime): double;
begin
   Result := 0;

   // Verifica o Histórico da Carteira para saber se já foi movimentada
   with dtmOperComum.qrySaldoCarteira do begin
      Close;
      if not(Prepared) then Prepare;
      ParamByName('CARTEIRA').AsInteger   := iCarteira;
      ParamByName('DATAMOV').AsDateTime   := dDataRef;
      ParamByName('HISTORICO').AsInteger  := high(integer);
      Open;
      First;

      // Se não for a primeira movimentação da carteira
      if not(IsEmpty) then Result := dtmOperComum.qrySaldoCarteiraSALDOVLRCARTINV.AsFloat;
   end;
end;





// Busca Todos os Saldos de um Investimento/Carteira em um Lote na Data Informada
function TOperComum.BuscaTodosSaldosInvestLote(iCarteira, iInvestimento, iHistCartInv: integer; sLote: string;
dDataRef: TDateTime; var fSdoQtdeInvCart, fSdoVlrInvCart, fSdoAtu, fSdoCar, fSdoAqui, fSdoRend, fSdoMercado,
fSdoVar, fSdoJur, fSdoPre, fSdoIRProv, fSdoIRApu, fSdoIOFProv, fSdoIOFApu, fSdoAgio: double): boolean;
var
   fCotacao : double;
begin
   fSdoQtdeInvCart   := 0;
   fSdoVlrInvCart    := 0;
   fSdoAtu           := 0;
   fSdoCar           := 0;
   fSdoAqui          := 0;
   fSdoRend          := 0;
   fSdoMercado       := 0;
   fSdoVar           := 0;
   fSdoJur           := 0;
   fSdoPre           := 0;
   fSdoIRProv        := 0;
   fSdoIRApu         := 0;
   fSdoIOFProv       := 0;
   fSdoIOFApu        := 0;
   fSdoAgio          := 0;

   // Chama query que calcula o saldo mencionado
   fCotacao := OperComum.BuscaCotacaoInvest(iInvestimento, dDataRef, True);

   with dtmOperComum.qrySaldoInvestimentoT do begin
      Close;
      if not(Prepared) then Prepare;
      ParamByName('CARTEIRA').AsInteger      := iCarteira;
      ParamByName('INVESTIMENTO').AsInteger  := iInvestimento;
      ParamByName('HISTORICO').AsInteger     := iHistCartInv;
      ParamByName('DATAMOV').AsDateTime      := dDataRef;
      ParamByName('LOTE').AsString           := sLote;
      Open;

      if not(isEmpty) then begin

         fSdoQtdeInvCart   := FieldByName('SALDOQTDEINVCART').AsFloat;
         fSdoVlrInvCart    := FieldByName('SALDOVLRINVCART').AsFloat;
         fSdoAtu           := FieldByName('SALDOATU').AsFloat;
         fSdoAqui          := FieldByName('SALDOAQUI').AsFloat;
         fSdoRend          := FieldByName('SALDOREND').AsFloat;
         fSdoCar           := FieldByName('SALDOCAR').AsFloat;
         fSdoJur           := FieldByName('SALDOJUROS').AsFloat;
         fSdoVar           := FieldByName('SALDOVARIACAO').AsFloat;
         fSdoPre           := FieldByName('SALDOPREMIO').AsFloat;
         fSdoMercado       := FieldByName('SALDOQTDEINVCART').AsFloat * fCotacao;
         fSdoIRProv        := FieldByName('SALDOIRPROV').AsFloat;
         fSdoIRApu         := FieldByName('SALDOIRAPU').AsFloat;
         fSdoIOFProv       := FieldByName('SALDOIOFPROV').AsFloat;
         fSdoIOFApu        := FieldByName('SALDOIOFAPU').AsFloat;
         fSdoAgio          := FieldByName('SALDOAGIO').AsFloat;

         Result := True;
      end else begin
         Result := False;
      end;
   end;
   dtmOperComum.qrySaldoInvestimentoT.Close;
end;

// Função que Retorna Valor a Contabilizar
function TOperComum.BuscaValorAContabilizar(iIdHistcartinv, iIdTipoDespInvest,iTipoInvest: longint; bOperVenda: boolean;
                                 var fValorAContabilizar: Double): boolean;
var
  QryLocal  :TwwQuery;
begin
// Cria Objetos Locais
  QryLocal              := TwwQuery.Create(Application);
  QryLocal.DatabaseName := 'BaseDados';

  Result := true;
  fValorAContabilizar := 0;

  if FazQuery(QryLocal,
       'SELECT VLRJUROS, VLRPREMIO, VLRVARIACAO, MOVIMAQUI, VLRMOVCARTINV, NATURMOVCARTINV, '+
       '       VLRIRAPU, VLRIRPROV, VLRIOFAPU, VLRIOFPROV, VLRAGIO '+
       'FROM HISTCARTINV '+
       'WHERE (IDHISTCARTINV = '+QuotedStr(IntToStr(iIdHistCartInv))+') ') then begin

     Case iIdTipoDespInvest Of

        -1: // Custo de Aquisição Registrado
        begin
           fValorAContabilizar := QryLocal.FieldByName('MOVIMAQUI').AsFloat;
           if QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'D' then
              fValorAContabilizar := - fValorAContabilizar;
        end;
        -2: // Variação Positiva Registrada
        begin
           fValorAContabilizar := QryLocal.FieldByName('VLRVARIACAO').AsFloat;
           if iTipoInvest = 1 then           // RF
              if QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'D' then
                 fValorAContabilizar := - fValorAContabilizar
           else if iTipoInvest = 2 then      // RV
              if fValorAContabilizar < 0 then
                 fValorAContabilizar := 0;   // Variação Negativa RV
        end;
        -3: // Prêmio Registrado
        begin
           fValorAContabilizar := QryLocal.FieldByName('VLRPREMIO').AsFloat;
           if QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'D' then
              fValorAContabilizar := - fValorAContabilizar;
        end;
        -4: // Lucro na Venda
        begin
           if not bOperVenda then begin
              MsgDlg('Parametrização Incorreta. Lucro/Prejuizo sem Operação de Venda associada. ',
                     'Mensagem do Sistema ', MtWarning,[MbOk],0);
              Result := false;
           end;
           fValorAContabilizar := QryLocal.FieldByName('VLRMOVCARTINV').AsFloat;
           if fValorAContabilizar < 0 then
              fValorAContabilizar := 0;   // Prejuízo
        end;
        -5: // Prejuízo na Venda
        begin
           if not bOperVenda then begin
              MsgDlg('Parametrização Incorreta. Lucro/Prejuizo sem Operação de Venda associada. ',
                     'Mensagem do Sistema ', MtWarning,[MbOk],0);
              Result := false;
           end;
           fValorAContabilizar := QryLocal.FieldByName('VLRMOVCARTINV').AsFloat;
           if fValorAContabilizar > 0 then
              fValorAContabilizar := 0;   // Lucro
        end;
        -6: // Juros Registrados
        begin
           fValorAContabilizar := QryLocal.FieldByName('VLRJUROS').AsFloat;
           if QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'D' then
              fValorAContabilizar := - fValorAContabilizar;
        end;
        -7: // IR Apurado
        begin
           fValorAContabilizar := QryLocal.FieldByName('VLRIRAPU').AsFloat;
        end;
        -8: // IR Provisionado
        begin
           fValorAContabilizar := QryLocal.FieldByName('VLRIRPROV').AsFloat;
        end;
        -9: // IOF Apurado
        begin
           fValorAContabilizar := QryLocal.FieldByName('VLRIOFAPU').AsFloat;
        end;
        -10: // IOF Provisionado
        begin
           fValorAContabilizar := QryLocal.FieldByName('VLRIOFPROV').AsFloat;
        end;
        -11: // Ágio
        begin
           fValorAContabilizar := QryLocal.FieldByName('VLRAGIO').AsFloat;
        end;
        -12: // Provisão de Perda (Juros)
        begin
           fValorAContabilizar := QryLocal.FieldByName('VLRJUROS').AsFloat;
           if QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'D' then
              fValorAContabilizar := - fValorAContabilizar;
        end;
        -13: // Provisão de Perda (C.Monetária)
        begin
           fValorAContabilizar := QryLocal.FieldByName('VLRVARIACAO').AsFloat;
           //if QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'D' then
           //   fValorAContabilizar := - fValorAContabilizar;
           if fValorAContabilizar > 0 then
              fValorAContabilizar := 0;   // Variação Positiva
        end;
        {
        -14 Taxa Operacional Basica Normal
        -15 Taxa Operacional  Basica Day-Trade
        -16 Taxa da Bolsa (BM&F)
        -17 Taxa de Registro (BM&F)
        -18 Taxa de Liquidacao (BM&F)
        }
        -19: // Variação Negativa Registrada
        begin
           fValorAContabilizar := QryLocal.FieldByName('VLRVARIACAO').AsFloat;
           if iTipoInvest = 1 then           // RF
              if QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'D' then
                 fValorAContabilizar := - fValorAContabilizar
           else if iTipoInvest = 2 then      // RV
              if fValorAContabilizar < 0 then
                 fValorAContabilizar := 0;   // Variação Positiva RV
        end;
     Else begin
        MsgDlg('Impossível Contabilizar. Tipo de Despesa Interna não prevista. ',
               'Mensagem do Sistema ', MtWarning,[MbOk],0);
        Result := false;
          end;
     End;
  end else begin
     MsgDlg('Impossível Contabilizar. Valores não encontrados. ',
            'Mensagem do Sistema ', MtWarning,[MbOk],0);
     Result := false;
  end;
end;

function TOperComum.DivValorZero(Valor1, Valor2: Extended): Extended;
Begin
   If Valor2 <> 0 Then
      Result :=Valor1/Valor2
   Else
      Result := 0;
End;

Function TOperComum.Trunca(rValor: Double;iQtdDec: Integer):Double;
Var
   i : Integer;
   sValor, sValor1 : String;
Begin
   sValor := FloatToStrF(rValor, ffNumber, 22,iQtdDec);
   For i := 1 To Length(sValor) Do
   Begin
       If Copy(sValor,i,1)<>'.' Then
          sValor1 := sValor1+Copy(sValor,i,1);
   End;
   Result := StrToFloat(sValor1);
End;

Function TOperComum.Round(rValor: Double;iQtdDec: Integer): Double;
Var
   i : Integer;
   sValor, sValor1 : String;
Begin
   If iQtdDec<2 Then
      iQtdDec:=2;
   sValor := FloatToStrF(rValor, ffNumber, 22,iQtdDec);
   For i := 1 To Length(sValor) Do
   Begin
      If (Copy(sValor,i,1)<>'.') Then
      Begin
         sValor1 := sValor1+Copy(sValor,i,1);
      End;
   End;
   Result := StrToFloat(sValor1);
end;

function TOperComum.ConvertePonto(sConverter : string):string;
var
 iPosPonto : Integer;
begin

  iPosPonto := Pos('.', sConverter); // Tira o Ponto
  if iPosPonto <> 0 then
    sConverter:= Copy(sConverter,1,iPosPonto-1)+Copy(sConverter,iPosPonto+1,Length(sConverter));

  iPosPonto := Pos(',', sConverter);
  if iPosPonto <> 0 then
    sConverter:= Copy(sConverter,1,iPosPonto-1)+'.'+Copy(sConverter,iPosPonto+1,Length(sConverter));
  Result:= sConverter;
end;

Function TOperComum.StripChar(S : String; C : Char) : String;
Var
  I : Integer;
begin
  Result := '';
  For I := 1 To Length(S) Do
    If S[I] <> C Then
       result := result + S[I];
end;

end.
