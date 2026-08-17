{---------------------------Alteração-------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
-------------------------------------------------------------------------------}
unit UFuncoesEmptmo;

// -------------------------------------------------------------------------------------------------
//
//    Biblioteca de Funcoes do Empréstimo
//
//    ATENÇÃO: UFuncoesEmptmo NECESSITA dos DataModules:
//             dEmptmo / dLookEmptmo;
//
//	-------------------------------------------------------------------------------------------------

interface

uses
   SysUtils, Math, wwQuery, wwDBGrid, Forms, ComCtrls, StdCtrls, Mask, Dialogs,
   MontaSelect, Classes, Controls, Graphics, Dbctrls, wwdblook, TREdit, Buttons,
   CMDateTimePicker, dbgrids, Db, Wwdbspin, checklst,

   uTypesEmptmo;


   function SysDate: TDateTime;

   function OraNumero(sNumero: String): String;
   function ConvertePonto(sConverter: String): String;
   function ConverteVirg(sConverter: String): String;

   function DiaUtil(sDiaUtil, sMesAno : String) : String;

   // retorna no formato mm/aaaa
   function ProximoMesAno(iMes, iAno: Integer): String;

   // retorna o nome do mes por extenso
   function MesExtenso(const iMes: integer): string;

   // Abre a query de Parametros do Sistema
   function ParametrosSistema: boolean;

   // função de arredondamento de valores
   function Arredonda(fValor: extended; iDecimais: word): extended;

   // Retorna um número formatado no padrão Ingles (".") --> formato do banco
   function NumeroIngles(fValor: extended): string;


   // Progressão / Espera --------------------------------------------------------------------------

   (* barras de progressão no próprio form *)
   procedure MostraProgresso(var Barra: TProgressBar; var Legenda, Contador: TLabel; fMaximo: double; sLegenda: string);
   procedure AndaProgresso(var Barra: TProgressBar; var Legenda, Contador: TLabel; fPosicao, fMaximo: double);
   procedure EscondeProgresso(var Barra: TProgressBar; var Legenda, Contador: TLabel);

   (* Form de progressão *)
   procedure MostraFormProgresso(sLegenda: String; fMinimo, fMaximo: Integer; bVisivel, bHabilitado : Boolean );
   procedure AndaFormProgresso(fPosicao: Integer);
   procedure EscondeFormProgresso;

   (* form Espera *)
   procedure MostraEspera(const sMensagem: string);
   procedure EscondeEspera;

   // ----------------------------------------------------------------------------------------------


   // manipulação de TwwQueries --------------------------------------------------------------------
   procedure LimpaParametros(const qry: TwwQuery);
   procedure AtribuiSQL(qry: TwwQuery; const sTextoSQL: string);
   // ----------------------------------------------------------------------------------------------

   // manipulação de Strings --------------------------------------------------------------------
   function CompletaInicio(sOriginal, sCompleta: string; iLimiteTamanho: word): string;
   function CompletaFim(sOriginal, sCompleta: string; iLimiteTamanho: word): string;
   // ----------------------------------------------------------------------------------------------

   // função de busca de cotação de moeda
   function BuscaCotacao(iMoeda: integer; dDataCotacao : TDateTime; bDataExata: boolean): extended;

   (* Procedimento que recebe como parâmetro um componente Container (Panel, GroupBox, etc.)
      e habilita/desabilita o próprio componente e os componentes dentro dele, trocando
      inclusive a cor de Edits e Combobox *)
   procedure AtualizaConjunto(bState : Boolean; Conjunto : TWinControl; bLimpa : Boolean = True);

   (* Concatena números. Exemplo nº 10 , nº 11 e nº 12 (10,11,12,....) retornando String. *)
   procedure Concatena(const N: Int64; var S: String);

   (* Marca um CheckListBox conforme o paramentro passado *)
   procedure MarcaCheckListBox(ListBox: TCheckListBox; const Checked: Boolean = True);

   (* Inverte as marcações de uma lista (CheckListBox) *)
   procedure InverteChekListBox(ListBox: TCheckListBox);

   (* Retorna uma String concatenada de IDs de uma lista *)
   function PegaIdSelecionado(const ListBox: TCheckListBox): String;


   // ----------------------------------------------------------------------------------------------

   (* função que cria uma query e um objeto regra em tempo de execução,
      recebendo como parâmetro o Sql que será passado para a Regra, o número
      da regra, a mensagem de texto que será exibida caso haja erro e uma
      variável passada por referência que armazenará o Result da Regra.
      A função retornará se a Regra foi executada com êxito ou não *)
   function UtilizaRegraValor(const iRuleName: Int64; const sSql, sTexto: String;
                              var Resultado: String; const bMostraMsg: Boolean): Boolean;

   function UtilizaRegraBool(const iRuleName: Int64; const sSql, sTexto: String;
                             var Resultado: String; const bMostraMsg: Boolean): Boolean;

   // ----------------------------------------------------------------------------------------------


type
   TFuncoesEmptmo = Class
   private

   public

      // função de busca de cotação de moeda
      function BuscaCotacao(iMoeda: integer; dDataCotacao : TDateTime; bDataExata: boolean): extended;

      // função de conversão de moeda (já devolve o valor convertido)
      function ConverteMoeda(iMoeda: integer; fValor: currency; dData: TDateTime; bDataExata: boolean): currency;
      function ReConverteMoeda(iMoeda: integer; fValor: currency; dData: TDateTime; bDataExata: boolean): currency;

      // calcula o fator de correção (baseado em 1 índice) entre 2 determinadas datas
      function CalculaFatorCorrecao(iIndice: integer; dDataIni, dDataFim: TDateTime; bPodeNegativo: boolean): double;

      // Traz um valor histórico (atualização monetária + correção monetária) p/ valor presente
      procedure TrazAValorPresente(var fValor: extended; dDataHistorica, dDataPresente: TDateTime; fFator: extended; sTipoConversao: string);

      // Mascara um CPF ou CGC
      function FormataCPFCGC(const CPFCGC: string): string;

      procedure SubstituiCuringa(var vMsg: array of string; const vCuringa, vValor: array of string);

      // -------------------------------------------------------------------------------------------

      // Retorna a máscara do Plano de Contas
      function GetMascaraPlano(iPlano: integer): string;

      (* função que retorna o "flgInterno" da situação de um participante *)
      function BuscaSitPart(IDPessoa: Int64): TSitPart;

	end;



var
  FuncoesEmptmo : TFuncoesEmptmo;



implementation
uses
   dBaseDados, uDataBase, uSistema, uDocumento, uModulo, uDiasInUteis, uIntegraBack, uMensErro,
   dEmptmo, dLookEmptmo, FEspera, FProgresso, URegra;




function SysDate: TDateTime;
var
   qrySysDate : TwwQuery;
begin
   Result := 0;

   try
      qrySysDate              := TwwQuery.Create(Application);
      qrySysDate.DatabaseName := 'BaseDados';
      qrySysDate.SQL.Text     := 'SELECT SYSDATE FROM DUAL';

      try
         qrySysDate.Open;
         Result := qrySysdate.FieldByName('SYSDATE').AsDateTime;
      except
      end;

   finally
      qrySysDate.Free;
   end;
end;



function OraNumero(sNumero: String): String;
var
   i              : Integer;
   sResult, sOra  : String;
   bPrimPonto     : Boolean;
begin
   sOra := '';
   bPrimPonto := False;

   for i := length(Trim(sNumero)) downto 1 do begin

      if sNumero[i] = ',' then begin

         if not bPrimPonto then begin
            sOra        := sOra + '.';
            bPrimPonto  := True;
         end else begin
            sOra := sOra;
         end;

      end else begin

         if sNumero[i] <> '.' then begin

            sOra := sOra + sNumero[i]

         end else begin

            if not bPrimPonto then begin
               sOra := sOra + '.';
               bPrimPonto := True;
            end else begin
               sOra := sOra;
            end;

         end; (* if sNumero[i] <> '.' *)

      end; (* if sNumero[i] = ',' *)

   end; (* for i downto *)

   sResult := '';

   for i := length(sOra) downto 1 do begin
      sResult := sResult + sOra[i];
   end;

   Result := sResult;
end;



function ConvertePonto(sConverter: String): String;
var
   iPosPonto : Integer;
begin
   iPosPonto := Pos(',', sConverter);

   if iPosPonto <> 0 then begin
      sConverter := Copy(sConverter, 1, iPosPonto - 1) + '.' +
                    Copy(sConverter, iPosPonto + 1, Length(sConverter));
   end;

   Result:= sConverter;
end;



function ConverteVirg(sConverter: String): String;
var
   iPosPonto : Integer;
begin
   iPosPonto := Pos('.', sConverter);

   if iPosPonto <> 0 then begin
      sConverter := Copy(sConverter, 1, iPosPonto - 1) + ',' +
                    Copy(sConverter, iPosPonto + 1, Length(sConverter));
   end;

   Result := sConverter;
end;



function DiaUtil(sDiaUtil, sMesAno: String): String;
var
  iDia      : Integer;  // guarda o dia util
  iDiaUtil  : Integer;  // controla o dia util
  dData     : TDateTime;
begin
   Result   := '';
   iDia     := 1;
   iDiaUtil := 0;

   // O recurso abaixo teve de ser colocado enquanto não melhorar função

   if StrToInt(sDiaUtil) > 20 then

      sDiaUtil := IntToStr(20);

   while StrToInt(sDiaUtil) <> iDiaUtil do begin

      if Length(IntToStr(iDia)) = 1 then begin
         dData := StrToDate('0' + IntToStr(iDia) + '/' + sMesAno)
      end else begin
         dData := StrToDate(IntToStr(iDia) + '/' + sMesAno);
      end;

      if (DayOfWeek(dData) <> 1) and (DayOfWeek(dData) <> 7)  then // Se Dia da Semana nao for Domingo nem Sabado
          iDiaUtil := iDiaUtil + 1;

      iDia := iDia + 1;

   end;

   Result := IntToStr(iDia - 1);
end;



function ProximoMesAno(iMes, iAno : Integer) : String;
var
   sMesAno: String;
begin
   Result := '';

   if iMes = 12 then begin

      sMesAno := '01/' + IntToStr(iAno + 1);

   end else begin

      iMes := iMes + 1;

      if iMes <= 9 then begin
         sMesAno  := '0' + IntToStr(iMes);
      end else begin
         sMesAno  := IntToStr(iMes);
      end;

      sMesAno  := sMesAno + '/' + IntToStr(iAno);
   end;

   Result := sMesAno;
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

function TFuncoesEmptmo.BuscaCotacao(iMoeda: integer; dDataCotacao : TDateTime; bDataExata: boolean): extended;
var
   qryCotacao : TwwQuery;
begin
   // escolhe qual query usar de acordo com o tipo de cotação
   if bDataExata then begin
      qryCotacao := TwwQuery(dtmEmptmo.qryCotacaoExata);
   end else begin
      qryCotacao := TwwQuery(dtmEmptmo.qryCotacaoNaoExata);
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

function TFuncoesEmptmo.ConverteMoeda(iMoeda: integer; fValor: currency; dData : TDateTime; bDataExata: boolean): currency;
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

function TFuncoesEmptmo.ReConverteMoeda(iMoeda: integer; fValor: currency; dData: TDateTime; bDataExata: boolean): currency;
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

function TFuncoesEmptmo.CalculaFatorCorrecao(iIndice: integer; dDataIni, dDataFim: TDateTime; bPodeNegativo: boolean): double;
var
   sTipoCotacao, sPeriodicidade, sAnoIni, sMesIni, sAnoFim, sMesFim : string;
   fCotacaoIni, fCotacaoFim, fFatorCorrecao : extended;
begin
   fFatorCorrecao := 1;

   // primeiro verifica a periodicidade e tipo da cotação
   with dtmEmptmo.qryIndice do begin
      LimpaParametros(dtmEmptmo.qryIndice);
      ParamByName('MOEDA').AsInteger := iIndice;

      Open;

      // se não se encontrar a moeda ou se as flags forem nulas, sai com Resultado 1
      if ( (dtmEmptmo.qryIndice.IsEmpty) or (dtmEmptmo.qryIndiceFLGPERCVALOR.isNull) or (dtmEmptmo.qryIndiceMOEPERIODICIDADE.isNULL) ) then begin
         Result := 1;
         dtmEmptmo.qryIndice.Close;
         Exit;
      end;

      sTipoCotacao      := dtmEmptmo.qryIndiceFLGPERCVALOR.asString;
      sPeriodicidade    := dtmEmptmo.qryIndiceMOEPERIODICIDADE.asString;

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
      with dtmEmptmo.qryCotacoesIntervalo do begin

         LimpaParametros(dtmEmptmo.qryCotacoesIntervalo);

         ParamByName('INDICE').AsInteger     := iIndice;
         ParamByName('ANOMESINI').AsString   := sAnoIni + sMesIni;
         ParamByName('ANOMESFIM').AsString   := sAnoFim + sMesFim;

         Open;
         First;

         while not(EOF) do begin
            fCotacaoFim := dtmEmptmo.qryCotacoesIntervaloCOTVALOR.asFloat;

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



procedure TFuncoesEmptmo.TrazAValorPresente(var fValor: extended; dDataHistorica, dDataPresente: TDateTime;
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
//    Fim de Moeda / Cotação
//==================================================================================================





//==================================================================================================
//    Progressão / Espera
//==================================================================================================

procedure MostraProgresso(var Barra: TProgressBar; var Legenda, Contador: TLabel; fMaximo: double; sLegenda: string);
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



procedure AndaProgresso(var Barra: TProgressBar; var Legenda, Contador: TLabel; fPosicao, fMaximo: double);
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
   Contador.Caption  := FormatFloat('#0', 0) + ' de ' + FormatFloat('#0', 0);

   Application.ProcessMessages;
end;



procedure MostraFormProgresso(sLegenda: String; fMinimo, fMaximo: Integer; bVisivel, bHabilitado : Boolean );
begin
   with frmProgresso do begin
      Min := fMinimo;
      Max := fMaximo;
      BotaoVisivel    := bVisivel;
      BotaoHabilitado := bHabilitado;
      Legenda := sLegenda;
      Show;
   end;(* frmProgresso *)
end;



procedure AndaFormProgresso(fPosicao: Integer);
begin
   frmProgresso.Pos := fPosicao;
   Application.ProcessMessages;
end;



procedure EscondeFormProgresso;
begin
   frmProgresso.Hide;
end;



procedure MostraEspera(const sMensagem: string);
begin
   frmEspera.Config('Empréstimo', sMensagem, False);
   frmEspera.Show;
   Application.ProcessMessages;
end;



procedure EscondeEspera;
begin
   frmEspera.Hide;
   frmEspera.Config('', '', False);
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


//==================================================================================================
//    Fim de Manipulação de TQueries
//==================================================================================================





//==================================================================================================

// Mascara um CPF ou CGC
function TFuncoesEmptmo.FormataCPFCGC(const CPFCGC: string): string;
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



// abre a query de Parametros do Sistema
function ParametrosSistema: boolean;
begin
   try
      with dtmEmptmo.qryParamEmptmo do begin
         if not(Active) then begin
            LimpaParametros(dtmEmptmo.qryParamEmptmo);
            ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.idEmpresa;
            Open;
         end;
      end;

      Result := not(dtmEmptmo.qryParamEmptmo.IsEmpty);

   except
      Result := False;
      Raise;
   end;
end;



function Arredonda(fValor: extended; iDecimais: word): extended;
begin
   Result := (round(fValor * Power(10, iDecimais))) / Power(10, iDecimais);
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
procedure TFuncoesEmptmo.SubstituiCuringa(var vMsg: array of string; const vCuringa, vValor: array of string);
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
function TFuncoesEmptmo.GetMascaraPlano(iPlano: integer): string;
var
   qryContab : TwwQuery;
begin
   qryContab := dtmEmptmo.qryIntegraContab;

   with qryContab do begin
      LimpaParametros(qryContab);
      ParamByName('PLANO').AsInteger := iPlano;
      Open;
   end;

   if not(qryContab.isEmpty) then Result := trim(qryContab.FieldbyName('MASCARA').AsString);
   qryContab.Close;
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

//==================================================================================================
//    Funções ligadas a moeda / cotação
//==================================================================================================

function BuscaCotacao(iMoeda: integer; dDataCotacao : TDateTime; bDataExata: boolean): extended;
var
   qryCotacao : TwwQuery;
begin
   // escolhe qual query usar de acordo com o tipo de cotação
   if bDataExata then begin
      qryCotacao := TwwQuery(dtmEmptmo.qryCotacaoExata);
   end else begin
      qryCotacao := TwwQuery(dtmEmptmo.qryCotacaoNaoExata);
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



procedure AtualizaConjunto(bState : Boolean; Conjunto : TWinControl; bLimpa : Boolean = True);
var
   i : Integer;
   Cor : TColor;
begin
(* Procedimento que recebe como parâmetro um componente Container (Panel, GroupBox, etc.)
   e habilita/desabilita o próprio componente e os componentes dentro dele, trocando
   inclusive a cor de Edits e Combobox *)

   Conjunto.Enabled := bState;

   if bState then begin
      Cor := clWindow;
   end else begin
      Cor := clBtnFace;
   end;

   for i := 0 to (Conjunto.ControlCount - 1) do begin

      if (Conjunto.Controls[i] is TEdit) then begin
         (Conjunto.Controls[i] as TEdit).Color := Cor;
         if bLimpa then
            (Conjunto.Controls[i] as TEdit).Clear;
      end;

      if (Conjunto.Controls[i] is TDBEdit) then begin
         (Conjunto.Controls[i] as TDBEdit).Color := Cor;
         if bLimpa then
            (Conjunto.Controls[i] as TDBEdit).Clear;
      end;

      if (Conjunto.Controls[i] is TwwDBLookupCombo) then begin
         (Conjunto.Controls[i] as TwwDBLookupCombo).Color := Cor;
         if not bState then begin
            if bLimpa then
              (Conjunto.Controls[i] as TwwDBLookupCombo).Clear;
         end;
      end;

      if (Conjunto.Controls[i] is TRealEdit) then begin
         (Conjunto.Controls[i] as TRealEdit).Color := Cor;
         if bLimpa then
            (Conjunto.Controls[i] as TRealEdit).Clear;
      end;

      if (Conjunto.Controls[i] is TMaskEdit) then begin
         (Conjunto.Controls[i] as TMaskEdit).Color := Cor;
         if bLimpa then
            (Conjunto.Controls[i] as TMaskEdit).Clear;
      end;

      if (Conjunto.Controls[i] is TwwDBSpinEdit) then begin
         (Conjunto.Controls[i] as TwwDBSpinEdit).Color := Cor;
         if bLimpa then
            (Conjunto.Controls[i] as TwwDBSpinEdit).Value := 0;
      end;

      if (Conjunto.Controls[i] is TCMDateTimePicker) then begin
         (Conjunto.Controls[i] as TCMDateTimePicker).Color := Cor;
         if bLimpa then
            (Conjunto.Controls[i] as TCMDateTimePicker).Clear;
      end;

      if (Conjunto.Controls[i] is TDBGrid) then begin
         (Conjunto.Controls[i] as TDBGrid).Color := Cor;
         (Conjunto.Controls[i] as TDBGrid).Enabled := bState;
      end;

      if (Conjunto.Controls[i] is TBitBtn) then begin
         (Conjunto.Controls[i] as TBitBtn).Enabled := bState;
      end;

   end; (* for *)
end;



function TFuncoesEmptmo.BuscaSitPart(IDPessoa: Int64): TSitPart;
begin
   Result.IDSitPart  := -1;
   Result.flgInterno := '';

   try

      with dtmEmptmo.qrySitPart do begin
         LimpaParametros(dtmEmptmo.qrySitPart);
         ParamByName('PIDPESSOA').AsInteger := IDPessoa;
         Open;

         Result.IDSitPart  := dtmEmptmo.qrySitPartIDSITPART.AsInteger;
         Result.flgInterno := dtmEmptmo.qrySitPartFLGINTERNO.AsString;
      end;

   finally
      dtmEmptmo.qrySitPart.Close;
   end;
end;



(* Concatena para ficar: WHERE <CAMPO> IN (<string concatenada>) *)
procedure Concatena(const N: Int64; var S: String);
begin
   if Trim(S) <> '' then S := S + ',';
   S := S + '''' + IntToStr(N) + '''';
end;



(* Marca um CheckListBox conforme o paramentro passado *)
procedure MarcaCheckListBox(ListBox: TCheckListBox; const Checked: Boolean);
var
  i : Integer;
begin
   for i := 0 to  ListBox.Items.Count - 1 do ListBox.Checked[i] := Checked;
end;



(* Inverte a Marcação de um CheckListBox *)
procedure InverteChekListBox(ListBox: TCheckListBox);
var
  i : Integer;
begin
   for i := 0 to (ListBox.Items.Count - 1) do ListBox.Checked[i] := not(ListBox.Checked[i]);
end;



(* Retorna uma String concatenada de IDs de uma lista *)
function PegaIdSelecionado(const ListBox: TCheckListBox) : String;
var
   S : String;
   i : Integer;
begin
   S := '';

   for i := 0 to (ListBox.Items.Count - 1) do begin
      if ListBox.Checked[i] then begin
         Concatena(Integer(ListBox.Items.Objects[i]), S);
      end;
   end;
   Result := S;
end;



function UtilizaRegraValor(const iRuleName: Int64; const sSql, sTexto: String;
                           var Resultado: String; const bMostraMsg: Boolean): Boolean;
var
//   Regra    : TRegra;
//   qryRegra : TwwQuery;
   fResult  : Extended;
begin
   (* função que cria uma query e um objeto regra em tempo de execução,
      recebendo como parâmetro o Sql que será passado para a Regra, o número
      da regra, a mensagem de texto que será exibida caso haja erro e uma
      variável passada por referência que armazenará o Result da Regra.
      A função retornará se a Regra foi executada com êxito ou não *)

   Result := False;

   (* Verifica se existe uma regra associada. Caso negativo o procedimento
      será abortado *)
   if iRuleName <= 0 then begin

      if bMostraMsg then begin
         MsgDlg('Não foi indicada a regra d' + sTexto + '.' +
                 #13 + #13 + 'Favor Verificar.', 'Empréstimo', mtWarning, [mbOk], 0);
         Exit;
      end;

   end;(* if iRuleName *)


   (* Cria a Query da Regra *)
//   qryRegra                := TwwQuery.Create(Application);
//   qryRegra.DatabaseName   := 'BaseDados';

   (* Atribui a Query da Regra *)
   dtmEmptmo.qryRegra.SQL.Clear;
//   dtmEmptmo.qryRegra.SQL.Text := sSql;
   dtmEmptmo.qryRegra.SQL.Add(sSql);

   (* Gravando o SQL de entrada para permitir verificação *)
 //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
 //dtmEmptmo.qryRegra.SQL.SaveToFile(Sistema.TempDir + 'Regra ' + IntToStr(iRuleName) + ' - ' + sTexto + '.txt');
   dtmEmptmo.qryRegra.SQL.SaveToFile(ftempregra + '\' + 'Regra ' + IntToStr(iRuleName) + ' - ' + sTexto + '.txt');

   (* Abre a Query da Regra *)
   dtmEmptmo.qryRegra.Open;


   (* Verifica se a query retornou com registros. Caso negativo o procedimento
      será abortado *)
   if dtmEmptmo.qryRegra.IsEmpty then begin
      dtmEmptmo.qryRegra.Close;
//      qryRegra.Free;
      Exit;
   end;

   (* Cria e Executa o objeto Regra *)
//   Regra                := TRegra.Create(Application);
//   Regra.DatabaseName   := 'BaseDados';
//   Regra.QueryIn        := qryRegra;
   dtmEmptmo.Regra.RuleName       := IntToStr(iRuleName);

   try
      try

         (************************)
         (*   Executa a Regra    *)
         (************************)

         dtmEmptmo.Regra.Execute;

         if dtmEmptmo.Regra.Error = False then begin

            try
               fResult := StrToFloat(ConverteVirg(dtmEmptmo.Regra.Result));

               (* variável passada por referência para ser usada como valor retornado pela Regra *)
               Resultado   := dtmEmptmo.Regra.Result;
               Result      := True;

            except;
               if bMostraMsg then begin
                  MsgDlg('Erro na Regra nº ' + dtmEmptmo.Regra.RuleName + ', d' + sTexto + #13 + dtmEmptmo.Regra.Result,
                         'Empréstimo', mtError, [mbOk], 0);
               end;
            end;

         end else begin

            if bMostraMsg then begin
               MsgDlg('Erro na Regra nº ' + dtmEmptmo.Regra.RuleName + ', d' + sTexto + #13 + dtmEmptmo.Regra.Result,
                      'Empréstimo', mtError, [mbOk], 0);
            end;

//            Regra.Free;
            dtmEmptmo.qryRegra.Close;
//            qryRegra.Free;

            Exit;

         end; (* if Error = False *)

      except

         on E:Exception do begin
            if bMostraMsg then begin
               MsgDlg('Erro na Regra nº ' + dtmEmptmo.Regra.RuleName + ', d' + sTexto + #13 + E.Message,
                      'Empréstimo', mtError, [mbOk], 0);
            end;
         end;

      end;

   finally
      (* Destroi a Query e o objeto Regra *)
//      Regra.Free;
      dtmEmptmo.qryRegra.Close;
//      qryRegra.Free;
   end;
end;



function UtilizaRegraBool(const iRuleName: Int64; const sSql, sTexto: String;
                          var Resultado: String; const bMostraMsg: Boolean): Boolean;
//var
//   Regra    : TRegra;
//   qryRegra : TwwQuery;
begin
   (* função que cria uma query e um objeto regra em tempo de execução,
      recebendo como parâmetro o Sql que será passado para a Regra, o número
      da regra, a mensagem de texto que será exibida caso haja erro e uma
      variável passada por referência que armazenará o Result da Regra.
      A função retornará se a Regra foi executada com êxito ou não *)

   Result := False;

   (* Verifica se existe uma regra associada. Caso negativo o procedimento
      será abortado *)
   if iRuleName <= 0 then begin

      if bMostraMsg then begin
         MsgDlg('Não foi indicada a regra d' + sTexto + '.' +
                 #13 + #13 + 'Favor Verificar.', 'Empréstimo', mtWarning, [mbOk], 0);
         Exit;
      end;

   end;(* if iRuleName *)


   (* Cria a Query da Regra *)
//   qryRegra                := TwwQuery.Create(Application);
//   qryRegra.DatabaseName   := 'BaseDados';

   (* Atribui a Query da Regra *)
   dtmEmptmo.qryRegra.SQL.Clear;
//   dtmEmptmo.qryRegra.SQL.Text := sSql;
   dtmEmptmo.qryRegra.SQL.Add(sSql);

   (* Gravando o SQL de entrada para permitir verificação *)
// dtmEmptmo.qryRegra.SQL.SaveToFile(Sistema.TempDir + 'Regra ' + IntToStr(iRuleName) + ' - ' + sTexto + '.txt');
   dtmEmptmo.qryRegra.SQL.SaveToFile(ftempregra + '\' + 'Regra ' + IntToStr(iRuleName) + ' - ' + sTexto + '.txt');

   (* Abre a Query da Regra *)
   dtmEmptmo.qryRegra.Open;


   (* Verifica se a query retornou com registros. Caso negativo o procedimento
      será abortado *)
   if dtmEmptmo.qryRegra.IsEmpty then begin
      dtmEmptmo.qryRegra.Close;
//      qryRegra.Free;
      Exit;
   end;

   (* Cria e Executa o objeto Regra *)
//   Regra                := TRegra.Create(Application);
//   Regra.DatabaseName   := 'BaseDados';
//   Regra.QueryIn        := qryRegra;
   dtmEmptmo.Regra.RuleName       := IntToStr(iRuleName);

   try
      try

         (************************)
         (*   Executa a Regra    *)
         (************************)

         dtmEmptmo.Regra.Execute;

         if dtmEmptmo.Regra.Error = False then begin

            if ( (lowercase(dtmEmptmo.Regra.Result) = 'true') or (lowercase(dtmEmptmo.Regra.Result) = 'false') ) then begin

               (* variável passada por referência para ser usada como valor retornado pela Regra *)
               Resultado   := dtmEmptmo.Regra.Result;
               Result      := True;

            end else begin

               if bMostraMsg then begin
                  MsgDlg('Erro na Regra nº ' + dtmEmptmo.Regra.RuleName + ', d' + sTexto + #13 + dtmEmptmo.Regra.Result,
                         'Empréstimo', mtError, [mbOk], 0);
               end;

            end;

         end else begin

            if bMostraMsg then begin
               MsgDlg('Erro na Regra nº ' + dtmEmptmo.Regra.RuleName + ', d' + sTexto + #13 + dtmEmptmo.Regra.Result,
                      'Empréstimo', mtError, [mbOk], 0);
            end;
//            Regra.Free;
            dtmEmptmo.qryRegra.Close;
//            qryRegra.Free;

            Exit;
         end; (* if Error = False *)

      except

         on E:Exception do begin
            if bMostraMsg then begin
               MsgDlg('Erro na Regra nº ' + dtmEmptmo.Regra.RuleName + ', d' + sTexto + #13 + E.Message,
                      'Empréstimo', mtError, [mbOk], 0);
            end;
         end;

      end;

   finally
      (* Destroi a Query e o objeto Regra *)
//      Regra.Free;
      dtmEmptmo.qryRegra.Close;
//      qryRegra.Free;
   end;
end;





end.
