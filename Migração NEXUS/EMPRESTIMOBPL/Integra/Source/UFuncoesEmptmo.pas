// Alterações:
{
--------------------------------------------------------------------------------
Alterações  : LimpaParametros
Pendência   : SIG81952
Responsável : Fábio Sampaio
Data        : 01/04/2019
Descrição   : Correção para liberar o preparo da query após o seu fechamento 
              evitando assim o erro de "Insufficient Memory".
--------------------------------------------------------------------------------
Alterações  : iif
Pendência   : SIG57627
Responsável : Edilaine
Data        : 21/11/2017
Descrição   : Ajustar queries para adequação a segregação contábil (perfil de investimento)
-------------------------------------------------------------------------------
Pendência   : SOL 181899 KINTANA 1688596
Data        : 05/06/2012
Autor       : Otacilio Aquino
Descrição   : Alterado o valor de retorno da função ValidaMargemConsAtual e
              ValidaPrestacaoProjetada.
--------------------------------------------------------------------------------
Pendência   : SOL 143413 Kintana 938370
Responsável : Fanuel Junior
Data        : 05/11/2010
Descrição   : Criação da procedure "buscaMutuario" para bloquear o usuario que
for mutuario do contrato pesquisado.
--------------------------------------------------------------------------------
Pendência   : SOL 149542 KINTANA 1074985
Responsável : BRUNO AZEVEDO
Data        : 21/12/2010
Descrição   : Correção ao limpar o componente "Regra" antes de cada execução.
--------------------------------------------------------------------------------
Pendência   : SOL 149245 KINTANA 1065029
Responsável : BRUNO AZEVEDO
Data        : 16/12/2010
Descrição   : Limpar o componente "Regra" antes de cada execução.
--------------------------------------------------------------------------------
Pendência   : SOL 138228 Kintana 843767
Responsável : BRUNO AZEVEDO
Data        : 08/09/2010
Descrição   : Criação do relatório "Evolução de contrato"
--------------------------------------------------------------------------------
//******************************************************************************
//Rotina: Regra
//Nº SOL: 131928
//Nº KINTANA: 754978
//Data da Alteração: 04/03/2010
//Responsável: Ádler Souza
//Descrição:   Criação de excessão ao criar um arquivo de log da Regra.
//******************************************************************************
Pendência   : SOL 114575  KINTANA 535771
Responsável :
Data        :
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
--------------------------------------------------------------------------------
Rotina    : -
Data      : 02/12/2003
Autor     : André Pontes
Pendencia : -
Descrição : - Declaração das funções MostraFormProgresso, AndaFormProgresso e EscondeFormProgresso
              transferidas para o próprio form, para compatibilização do mesmo com os FProgresso do
              Imobiliário e Orçamento
---------------------------------------------------------------------------------------------------}

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
   CMDateTimePicker, dbgrids, Db, Wwdbspin, checklst, uCMFileUtils, shellapi, Windows,

   uTypesEmptmo;

   //edilaine - SIG57627 - inicio
   function iif(condicao : Boolean; sVerdadeiro, sFalso : string) : String;
   procedure Split(Delimiter: Char; Str: string; ListOfStrings: TStrings) ;
   //edilaine - SIG57627 - fim

   //Fanuel Marinho dos Santos Junior
   procedure buscaUsuarioMutuario(idbenef : integer);

   //BRUNO AZEVEDO SOL 138228 Kintana 843767
   function Parse(sExpressao: String; sChar: String = ' '; Branco: Boolean = False): TStringList;

   // ----------------------------------------------------------------------------------------------
   //SOL 114575
   function ftempregra  : string;
   //FIM
   function LogToFile(const sLog   : String;
                      const sArq   : String;
                      const bPasta : Boolean = True;
                      const bHora  : Boolean = True;
                      const bMem       : Boolean = False;
                      const bNovoArq   : Boolean = False
                     ): Boolean;

   function LogBPL(const sArq  : String;
                   const bHora : Boolean = False
                  ): Boolean;

   // ----------------------------------------------------------------------------------------------

   function SysDate: TDateTime;
   function SysTime: TDateTime;

   // Retorna string com formato de data para o Oracle (TO_DATE)
   function OraData(const dData : TDateTime) : String;
   function OraNumero(sNumero: String): String;

   function ConvertePonto(sConverter: String): String;
   function ConverteVirg(sConverter: String): String;

   function DiaUtil(sDiaUtil, sMesAno : String) : String;

   // retorna no formato mm/aaaa
   function ProximoMesAno(iMes, iAno: Integer): String;

   // retorna no formato mm/aaaa
   function MesAnoAnterior(iMes, iAno: Integer): String;

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
   procedure Concatena(const N: Extended; var S: String);

   // ----------------------------------------------------------------------------------------------

   (* Marca um CheckListBox conforme o paramentro passado *)
   procedure MarcaCheckListBox(ListBox: TCheckListBox; const Checked: Boolean = True);

   (* Inverte as marcações de uma lista (CheckListBox) *)
   procedure InverteChekListBox(ListBox: TCheckListBox);

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------

   function GravaLogTotalPrev(var rLogTotalPrev: TLogTotalPrev): Int64;

   function UpdateLogTotalPrev(const rLogPesquisa  : TLogTotalPrev;
                               const rLogUpdate    : TLogTotalPrev
                              ): Integer;

   function DeleteLogTotalPrev(const rLogPesquisa : TLogTotalPrev): Integer;

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------

   (* função que cria uma query e um objeto regra em tempo de execução,
      recebendo como parâmetro o Sql que será passado para a Regra, o número
      da regra, a mensagem de texto que será exibida caso haja erro e uma
      variável passada por referência que armazenará o Result da Regra.
      A função retornará se a Regra foi executada com êxito ou não *)
   function UtilizaRegraData(const iRuleName   : Int64;
                             const sSql        : String;
                             const sTexto      : String;
                             var   Resultado   : String;
                             const bMostraMsg  : Boolean;
                             const bCriaObjeto : Boolean = False
                            ): Boolean;

   function UtilizaRegraValor(const iRuleName   : Int64;
                              const sSql        : String;
                              const sTexto      : String;
                              var   Resultado   : String;
                              const bMostraMsg  : Boolean;
                              const bCriaObjeto : Boolean = False;
                              const bGravaSQL   : Boolean = True;
                              const bLimpaVariaveis: Boolean = False //BRUNO AZEVEDO SOL 149542 KINTANA 1074985
                             ): Boolean;

   function UtilizaRegraValorNOVA(const iRuleName   : Int64;
                                  const sSql        : String;
                                  const sTexto      : String;
                                  var   Resultado   : String;
                                  const bMostraMsg  : Boolean;
                                  const bCriaObjeto : Boolean = False;
                                  const bGravaSQL   : Boolean = True
                                 ): Boolean;

   function UtilizaRegraBool(const iRuleName   : Int64;
                             const sSQL        : String;
                             const sTexto      : String;
                             var   Resultado   : String;
                             const bMostraMsg  : Boolean;
                             const bCriaObjeto : Boolean = False
                            ): Boolean;

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------


type
   TFuncoesEmptmo = Class
   private

   public

      // função de busca de cotação de moeda
      function BuscaCotacao(iMoeda: integer; dDataCotacao : TDateTime; bDataExata: boolean): extended;

      // função de conversão de moeda (já devolve o valor convertido)
      function ConverteMoeda(const iMoeda          : Integer;
                             const iMoedaCorrente  : Integer;
                             const fValor          : Currency;
                             const dData           : TDateTime;
                             const bDataExata      : Boolean
                             ): currency;

      function ReConverteMoeda(const iMoeda          : Integer;
                               const iMoedaCorrente  : Integer;
                               const fValor          : Currency;
                               const dData           : TDateTime;
                               const bDataExata      : Boolean
                               ): currency;

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
  bBuscaMutuario : Boolean;


implementation
uses
   dBaseDados, uDataBase, uSistema, uDiasUteis, uIntegraBack, uMensErro,
   dEmptmo, dLookEmptmo, FEsperaEP, FProgresso, URegra;

//BRUNO AZEVEDO SOL 138228 Kintana 843767
function Parse(sExpressao: String; sChar: String = ' '; Branco: Boolean = False): TStringList;
var
  Lista: TStringList;
  i: Integer;
  sTemp: String;
begin
  sExpressao := Trim(sExpressao) + sChar;

  Lista := TStringlist.Create;
  sTemp := '';

  i := 1;
  while i <= Length(sExpressao) do begin
    if (Copy(sExpressao, i, Length(sChar)) = sChar) then begin
      Inc(i,Length(sChar)-1);

      if ((sTemp = '') and (Branco)) or (sTemp <> '') then begin
        Lista.Add(sTemp);
      end;
      sTemp := '';
    end else begin
      sTemp := sTemp + Copy(sExpressao, i, 1);
    end;

    Inc(i);
  end;
  Result := Lista;

end;
//BRUNO AZEVEDO SOL 138228 Kintana 843767

//SOL 114575
function ftempregra : string;

 begin
      result := sistema.retornacaminhoarquivos(sistema.idempresa);

      end;
//FIM
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
         Result := trunc(qrySysdate.FieldByName('SYSDATE').AsDateTime);
      except
      end;

   finally
      qrySysDate.Close;
      qrySysDate.Free;
   end;
end;



function SysTime: TDateTime;
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
      qrySysDate.Close;
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

   for i := length(Trim(sNumero)) downto 1 do
   begin
      if sNumero[i] = ',' then
      begin
         if not bPrimPonto then
         begin
            sOra        := sOra + '.';
            bPrimPonto  := True;
         end
         else
         begin
            sOra := sOra;
         end;
      end
      else
      begin
         if sNumero[i] <> '.' then
         begin
            sOra := sOra + sNumero[i]
         end
         else
         begin
            if not bPrimPonto then
            begin
               sOra := sOra + '.';
               bPrimPonto := True;
            end
            else
            begin
               sOra := sOra;
            end;
         end;  // if sNumero[i] <> '.'
      end;  // if sNumero[i] = ','
   end;  // for i downto

   sResult := '';

   for i := length(sOra) downto 1 do
   begin
      sResult := sResult + sOra[i];
   end;

   Result := sResult;
end;



// Retorna string com formato de data para o Oracle (TO_DATE)
function OraData(const dData : TDateTime) : String;
begin
   Result := 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dData)) + ', ''DD/MM/YYYY'')';
end;



function ConvertePonto(sConverter: String): String;
var
   iPosPonto : Integer;
begin
   iPosPonto := Pos(',', sConverter);

   if iPosPonto <> 0 then
   begin
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

   if iPosPonto <> 0 then
   begin
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
   if StrToInt(sDiaUtil) > 20 then sDiaUtil := IntToStr(20);

   while StrToInt(sDiaUtil) <> iDiaUtil do
   begin
      if Length(IntToStr(iDia)) = 1 then
      begin
         dData := StrToDate('0' + IntToStr(iDia) + '/' + sMesAno)
      end else begin
         dData := StrToDate(IntToStr(iDia) + '/' + sMesAno);
      end;

      // Se Dia da Semana nao for Domingo nem Sabado
      if (DayOfWeek(dData) <> 1) and (DayOfWeek(dData) <> 7) then iDiaUtil := iDiaUtil + 1;

      iDia := iDia + 1;
   end;

   Result := IntToStr(iDia - 1);
end;



function ProximoMesAno(iMes, iAno : Integer): String;
var
   sMesAno: String;
begin
   Result := '';

   if iMes = 12 then
   begin
      sMesAno := '01/' + IntToStr(iAno + 1);
   end
   else
   begin
      iMes := iMes + 1;

      if iMes <= 9 then
      begin
         sMesAno  := '0' + IntToStr(iMes);
      end
      else
      begin
         sMesAno  := IntToStr(iMes);
      end;

      sMesAno  := sMesAno + '/' + IntToStr(iAno);
   end;
   Result := sMesAno;
end;



function MesAnoAnterior(iMes, iAno : Integer) : String;
var
   sMesAno: String;
begin
   Result := '';

   if iMes = 1 then
   begin
      sMesAno := '12/' + IntToStr(iAno - 1);
   end
   else
   begin
      iMes := iMes - 1;

      if iMes <= 9 then
      begin
         sMesAno  := '0' + IntToStr(iMes);
      end
      else
      begin
         sMesAno  := IntToStr(iMes);
      end;

      sMesAno  := sMesAno + '/' + IntToStr(iAno);
   end;

   Result := sMesAno;
end;

//faz uma consulta para verificar se o mutuario
//do contrato e o usuario logado no sistema
procedure buscaUsuarioMutuario(idbenef : integer);
var
  qryBuscaUsuarioMutuario: TwwQuery;
begin
  try
    qryBuscaUsuarioMutuario := TwwQuery.Create(Nil);
       with qryBuscaUsuarioMutuario do begin
          DatabaseName := 'BaseDados';
          Close;
          Sql.Clear;
          Sql.Add('SELECT US.NOMEUSUARIO ');
          Sql.Add('FROM CONTRATOEMPTMO CE,');
          Sql.Add('USUARIOSISTEMA US      ');
          Sql.Add('WHERE CE.IDBENEF = US.IDUSUARIO');
          Sql.Add('AND US.IDUSUARIO = '+IntToStr(idbenef));
          Sql.Add('AND US.IDUSUARIO = '+IntToStr(Sistema.IdUsuario));
          Open;

          bBuscaMutuario := (not(qryBuscaUsuarioMutuario.isEmpty));
    end;
  finally
    FreeAndNil(qryBuscaUsuarioMutuario);
  end;
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
   if bDataExata then
   begin
      qryCotacao := TwwQuery(dtmEmptmo.qryCotacaoExata);
   end
   else
   begin
      qryCotacao := TwwQuery(dtmEmptmo.qryCotacaoNaoExata);
   end;

   with qryCotacao do
   begin
      LimpaParametros(qryCotacao);

      ParamByName('MOEDA').AsInteger   := iMoeda;
      ParamByName('DATA').AsDateTime   := dDataCotacao;

      Open;
      First;
   end;

   // retorna -1 se não houver cotação
   if qryCotacao.IsEmpty then
   begin
      Result := -1;
   end
   else
   begin
      Result := qryCotacao.FieldByName('COTVALOR').AsFloat;
   end;
end;

//--------------------------------------------------------------------------------------------------

function TFuncoesEmptmo.ConverteMoeda(const iMoeda          : Integer;
                                      const iMoedaCorrente  : Integer;
                                      const fValor          : Currency;
                                      const dData           : TDateTime;
                                      const bDataExata      : Boolean
                                      ): currency;
var
   fFator : extended;
begin
   // a princípio, presume-se que não há conversão: a moeda é a corrente
   fFator := 1;

   // só busca cotações e converte se a moeda for diferente da moeda corrente
   if iMoeda <> iMoedaCorrente then fFator := BuscaCotacao(iMoeda, dData, bDataExata);

   if fFator = -1 then
   begin
      Result   := -1;
   end
   else
   begin
      Result   := fValor * fFator;
   end;
end;

//--------------------------------------------------------------------------------------------------

function TFuncoesEmptmo.ReConverteMoeda(const iMoeda          : Integer;
                                        const iMoedaCorrente  : Integer;
                                        const fValor          : Currency;
                                        const dData           : TDateTime;
                                        const bDataExata      : Boolean
                                        ): currency;
var
   fFator : extended;
begin
   // a princípio, presume-se que não há conversão: a moeda é a corrente
   fFator := 1;

   // só busca cotações e converte se a moeda for diferente da moeda corrente
   if iMoeda <> iMoedaCorrente then fFator := BuscaCotacao(iMoeda, dData, bDataExata);

   if fFator = -1 then
   begin
      Result   := -1;
   end
   else
   begin
      if fFator = 0 then
      begin
         Result   := 0;
      end
      else
      begin
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
   with dtmEmptmo.qryIndice do
   begin
      LimpaParametros(dtmEmptmo.qryIndice);
      ParamByName('MOEDA').AsInteger := iIndice;

      Open;

      // se não se encontrar a moeda ou se as flags forem nulas, sai com Resultado 1
      if ( (dtmEmptmo.qryIndice.IsEmpty) or (dtmEmptmo.qryIndiceFLGPERCVALOR.isNull) or
           (dtmEmptmo.qryIndiceMOEPERIODICIDADE.isNULL)
         ) then
      begin
         Result := 1;
         dtmEmptmo.qryIndice.Close;
         Exit;
      end;

      sTipoCotacao      := dtmEmptmo.qryIndiceFLGPERCVALOR.asString;
      sPeriodicidade    := dtmEmptmo.qryIndiceMOEPERIODICIDADE.asString;

      Close;
   end;

   sAnoIni := IntToStr(DiasUteis.ExtraiAno(dDataIni));
   sMesIni := IntToStr(DiasUteis.ExtraiMes(dDataIni));
   if length(sMesIni) = 1 then sMesIni := '0' + sMesIni;

   sAnoFim := IntToStr(DiasUteis.ExtraiAno(dDataFim));
   sMesFim := IntToStr(DiasUteis.ExtraiMes(dDataFim));
   if length(sMesFim) = 1 then sMesFim := '0' + sMesFim;

   case sTipoCotacao[1] of

      'P': // percentual
      with dtmEmptmo.qryCotacoesIntervalo do
      begin
         LimpaParametros(dtmEmptmo.qryCotacoesIntervalo);

         ParamByName('INDICE').AsInteger     := iIndice;
         ParamByName('ANOMESINI').AsString   := sAnoIni + sMesIni;
         ParamByName('ANOMESFIM').AsString   := sAnoFim + sMesFim;

         Open;
         First;

         while not(EOF) do
         begin
            fCotacaoFim := dtmEmptmo.qryCotacoesIntervaloCOTVALOR.asFloat;

            if fCotacaoFim >= 0 then
            begin
               fFatorCorrecao := fFatorCorrecao * (1 + abs(fCotacaoFim / 100) );
            end
            else
            begin
               fFatorCorrecao := fFatorCorrecao / (1 + abs(fCotacaoFim / 100) );
            end;

            Next;
         end;  // while not(EOF)
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



procedure TFuncoesEmptmo.TrazAValorPresente(var fValor: extended;
                                            dDataHistorica, dDataPresente: TDateTime;
                                            fFator: extended;
                                            sTipoConversao: string);
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
         if dDataHistorica < StrToDate('01/02/1986') then
         begin
            if dDataPresente >= StrToDate('01/02/1986') then fValor := fValor / 1000;
            if dDataPresente >= StrToDate('01/01/1989') then fValor := fValor / 1000;
            if dDataPresente >= StrToDate('01/08/1993') then fValor := fValor / 1000;
            if dDataPresente >= StrToDate('01/07/1994') then fValor := fValor / 2750;
            Exit;
         end;

         if dDataHistorica < StrToDate('01/01/1989') then
         begin
            if dDataPresente >= StrToDate('01/01/1989') then fValor := fValor / 1000;
            if dDataPresente >= StrToDate('01/08/1993') then fValor := fValor / 1000;
            if dDataPresente >= StrToDate('01/07/1994') then fValor := fValor / 2750;
            Exit;
         end;

         if dDataHistorica < StrToDate('01/08/1993') then
         begin
            if dDataPresente >= StrToDate('01/08/1993') then fValor := fValor / 1000;
            if dDataPresente >= StrToDate('01/07/1994') then fValor := fValor / 2750;
            Exit;
         end;

         if dDataHistorica < StrToDate('01/07/1994') then
         begin
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
   with frmProgresso do
   begin
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
   frmEsperaEP.Config('Empréstimo', sMensagem, False);
   frmEsperaEP.Show;
   Application.ProcessMessages;
end;



procedure EscondeEspera;
begin
   frmEsperaEP.Hide;
   frmEsperaEP.Config('', '', False);
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
   if (qry.Prepared) then qry.UnPrepare; // Alterado por FHBS - 01/04/2019 - SIG81952

   // prepara a query se já não estiver preparada
   if not(qry.Prepared) then qry.Prepare;

   // zera os parâmetros
   for i := 0 to (qry.ParamCount - 1) do
   begin
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
      11: Result := FormatMaskText('000.000.000-00;0; ', CPFCGC);
      14: Result := FormatMaskText('00.000.000/0000-00;0; ', CPFCGC);
   else
      Result := CPFCGC;
   end;
end;



// abre a query de Parametros do Sistema
function ParametrosSistema: boolean;
begin
   try
      // Marchetti - Pendencia 26177
      ShortDateFormat := 'dd/mm/yyyy';
      // Fim Marchetti - Pendencia 26177

      with dtmEmptmo.qryParamEmptmo do
      begin
         LimpaParametros(dtmEmptmo.qryParamEmptmo);
         ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.idEmpresa;
         Open;
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
   for i := 0 to (length(vMsg) - 1) do
   begin
      bTerminou := False;

      // enquanto houver curingas a substituir...
      while not(bTerminou) do
      begin
         // passar duas vezes pelo for pois podem ter várias ocorrências do mesmo curinga em uma linha
         for j := 0 to (length(vCuringa) - 1) do
         begin
            bTerminou := False;
            // procurar todas as ocorrências deste curinga nesta linha
            while not(bTerminou) do
            begin
               // procurar na lista de curingas
               k := pos(AnsiLowerCase(vCuringa[j]), AnsiLowerCase(vMsg[i]));

               if k > 0 then
               begin
                  // achei um curinga
                  sNova       := copy(vMsg[i], 1, (k - 1));    // 1 parte
                  sNova       := sNova + vValor[j];            // curinga
                  sNova       := sNova + copy(vMsg[i], length(vCuringa[j]) + k, length(vMsg[i]));  //3 parte
                  vMsg[i]     := copy(sNova, 1, 69);
               end
               else
               begin
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

   with qryContab do
   begin
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
   if bDataExata then
   begin
      qryCotacao := TwwQuery(dtmEmptmo.qryCotacaoExata);
   end
   else
   begin
      qryCotacao := TwwQuery(dtmEmptmo.qryCotacaoNaoExata);
   end;

   with qryCotacao do
   begin
      LimpaParametros(qryCotacao);

      ParamByName('MOEDA').AsInteger   := iMoeda;
      ParamByName('DATA').AsDateTime   := dDataCotacao;

      Open;
      First;
   end;

   // retorna -1 se não houver cotação
   if qryCotacao.IsEmpty then
   begin
      Result := -1;
   end
   else
   begin
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

   if bState then
   begin
      Cor := clWindow;
   end
   else
   begin
      Cor := clBtnFace;
   end;

   for i := 0 to (Conjunto.ControlCount - 1) do
   begin

      if (Conjunto.Controls[i] is TEdit) then
      begin
         (Conjunto.Controls[i] as TEdit).Color := Cor;
         if bLimpa then (Conjunto.Controls[i] as TEdit).Clear;
      end;

      if (Conjunto.Controls[i] is TDBEdit) then
      begin
         (Conjunto.Controls[i] as TDBEdit).Color := Cor;
         if bLimpa then (Conjunto.Controls[i] as TDBEdit).Clear;
      end;

      if (Conjunto.Controls[i] is TwwDBLookupCombo) then
      begin
         (Conjunto.Controls[i] as TwwDBLookupCombo).Color := Cor;
         if not bState then
         begin
            if bLimpa then (Conjunto.Controls[i] as TwwDBLookupCombo).Clear;
         end;
      end;

      if (Conjunto.Controls[i] is TRealEdit) then
      begin
         (Conjunto.Controls[i] as TRealEdit).Color := Cor;
         if bLimpa then (Conjunto.Controls[i] as TRealEdit).Clear;
      end;

      if (Conjunto.Controls[i] is TMaskEdit) then
      begin
         (Conjunto.Controls[i] as TMaskEdit).Color := Cor;
         if bLimpa then (Conjunto.Controls[i] as TMaskEdit).Clear;
      end;

      if (Conjunto.Controls[i] is TwwDBSpinEdit) then
      begin
         (Conjunto.Controls[i] as TwwDBSpinEdit).Color := Cor;
         if bLimpa then (Conjunto.Controls[i] as TwwDBSpinEdit).Value := 0;
      end;

      if (Conjunto.Controls[i] is TCMDateTimePicker) then
      begin
         (Conjunto.Controls[i] as TCMDateTimePicker).Color := Cor;
         if bLimpa then (Conjunto.Controls[i] as TCMDateTimePicker).Clear;
      end;

      if (Conjunto.Controls[i] is TDBGrid) then
      begin
         (Conjunto.Controls[i] as TDBGrid).Color := Cor;
         (Conjunto.Controls[i] as TDBGrid).Enabled := bState;
      end;

      if (Conjunto.Controls[i] is TBitBtn) then
      begin
         (Conjunto.Controls[i] as TBitBtn).Enabled := bState;
      end;

   end; (* for *)
end;



function TFuncoesEmptmo.BuscaSitPart(IDPessoa: Int64): TSitPart;
begin
   Result.IDSitPart  := -1;
   Result.flgInterno := '';

   try
      with dtmEmptmo.qrySitPart do
      begin
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
procedure Concatena(const N: Extended; var S: String);
begin
   if Trim(S) <> '' then S := S + ',';
   S := S + '''' + FormatFloat('#0', N) + '''';
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



// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------

function GravaLogTotalPrev(var rLogTotalPrev: TLogTotalPrev): Int64;
begin
   rLogTotalPrev.IDLogTotalPrev := LeUltRegistro(nil, 'LOGTOTALPREV');

   with dtmEmptmo.qryInsertLogTotalPrev do
   begin
      LimpaParametros(dtmEmptmo.qryInsertLogTotalPrev);

      ParamByName('PIDLOGTOTALPREV').AsInteger  := rLogTotalPrev.IDLogTotalPrev;
      ParamByName('PIDMODULO').AsInteger        := rLogTotalPrev.IDModulo;

      // -------------------------------------------------------------------------------------------

      if rLogTotalPrev.IDContrato > 0 then
         ParamByName('PIDPESQUISA1').AsFloat    := rLogTotalPrev.IDContrato;

      if rLogTotalPrev.IDHistMov > 0 then
         ParamByName('PIDPESQUISA2').AsFloat    := rLogTotalPrev.IDHistMov;

      if rLogTotalPrev.CodPlanDoc > 0 then
         ParamByName('PIDPESQUISA3').AsFloat    := rLogTotalPrev.CodPlanDoc;

      // -------------------------------------------------------------------------------------------

      if rLogTotalPrev.Origem >= 0 then
         ParamByName('PORIGEM').AsInteger       := rLogTotalPrev.Origem;

      // -------------------------------------------------------------------------------------------

      ParamByName('PDESCOPERACAO').AsString     := rLogTotalPrev.Operacao;
      ParamByName('PIDUSUARIO').AsInteger       := rLogTotalPrev.IDUsuario;
      ParamByName('PVERSAO').AsString           := rLogTotalPrev.Versao;

      try
         ExecSQL;
         Result := rLogTotalPrev.IDLogTotalPrev;
      except
         Result := -1;
      end;
   end;
end;



function UpdateLogTotalPrev(const rLogPesquisa  : TLogTotalPrev;
                            const rLogUpdate    : TLogTotalPrev
                           ): Integer;
begin
   //
end;



function DeleteLogTotalPrev(const rLogPesquisa : TLogTotalPrev): Integer;
begin
   //
end;

// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------

function UtilizaRegraValor(const iRuleName   : Int64;
                           const sSql        : String;
                           const sTexto      : String;
                           var   Resultado   : String;
                           const bMostraMsg  : Boolean;
                           const bCriaObjeto : Boolean = False;
                           const bGravaSQL   : Boolean = True;
                           const bLimpaVariaveis: Boolean = False //BRUNO AZEVEDO SOL 149542 KINTANA 1074985
                          ): Boolean;
var
   ObjRegra    : TRegra;
   qryIntRegra : TwwQuery;

   fResult     : Extended;
   i           : Integer;
   sSQLNovo    : String;

   //Pendência 24595 - 27/02/2007 - Alberto
   bExibeMensagens : Boolean;
   //Fim Pendência 24595

begin
   Result := False;

   //BRUNO AZEVEDO SOL 149245 KINTANA 1065029
   if (bLimpaVariaveis) then begin   //BRUNO AZEVEDO SOL 149542 KINTANA 1074985
     dtmEmptmo.Regra.Free();
     dtmEmptmo.Regra := TRegra.Create(dtmEmptmo);
     dtmEmptmo.Regra.DatabaseName   := 'BaseDados';
     dtmEmptmo.Regra.DataRef        := '';
     dtmEmptmo.Regra.DistinctFields := '';
     dtmEmptmo.Regra.GrpHipotese    := '';
     dtmEmptmo.Regra.IdCalculo      := 0;
     dtmEmptmo.Regra.IdEmpresa      := 0;
     dtmEmptmo.Regra.ParamOut       := '';
     dtmEmptmo.Regra.QueryIn        := dtmEmptmo.qryRegra;
     dtmEmptmo.Regra.QueryOut       := Nil;
     dtmEmptmo.Regra.RuleName       := '';
     dtmEmptmo.Regra.TabBiometrica  := '';
   end;
   //BRUNO AZEVEDO SOL 149245 KINTANA 1065029
   
   // Verifica se existe uma regra associada. Caso negativo o procedimento será abortado
   if iRuleName <= 0 then
   begin
      if bMostraMsg then
      begin
         MsgDlg('Não foi indicada a regra d' + sTexto + '.' + #13 + #13 + 'Favor Verificar.', 'Empréstimo', mtWarning, [mbOk], 0);
         Exit;
      end;
   end;  // if iRuleName <= 0

   // ----------------------------------------------------------------------------------------------

   // Retira TAB, LF e CR do SQL -------------------------------------------------------------------
   if length(sSQL) > 10240 then
   begin
      sSQLNovo := '';
      for i := 1 to length(sSQL) do
      begin
         if ( (sSQL[i] <> #9) and (sSQL[i] <> #10) and (sSQL[i] <> #13) ) then
         begin
            sSQLNovo := sSQLNovo + sSQL[i];
         end;
      end;
   end
   else  // if length(sSQL) > 10240 
   begin
      sSQLNovo := sSQL;
   end;
   // Fim (Retira LF e CR do SQL) ------------------------------------------------------------------

   if bCriaObjeto then
   begin
      qryIntRegra              := TwwQuery.Create(nil);
      qryIntRegra.DatabaseName := 'BaseDados';

      // Cria e Executa o objeto Regra
      ObjRegra                := TRegra.Create(Application);
      ObjRegra.DatabaseName   := 'BaseDados';
      ObjRegra.QueryIn        := qryIntRegra;
   end;

   if not(bCriaObjeto) then
   begin
      dtmEmptmo.qryRegra.SQL.Clear;
      if length(sSQL) > 10240 then
      begin
         dtmEmptmo.qryRegra.SQL.Add(sSQLNovo);
      end
      else  // if length(sSQL) > 10240
      begin
         dtmEmptmo.qryRegra.SQL.Text := sSQLNovo;
      end;

      // Grava o SQL de entrada para permitir verificação
      if bGravaSQL then
      //SOL 114575
//         dtmEmptmo.qryRegra.SQL.SaveToFile(Sistema.TempDir + 'Regra ' + IntToStr(iRuleName) + ' - ' + 'd' + sTexto + '.txt');
        try/// Ádler Souza - SOL 131928 Kintana 754978
          dtmEmptmo.qryRegra.SQL.SaveToFile(ftempregra + '\' + 'Regra ' + IntToStr(iRuleName) + ' - ' + 'd' + sTexto + '.txt');
        except
        end;// Fim - Ádler Souza - SOL 131928 Kintana 754978
      //FIM
      dtmEmptmo.qryRegra.Open;

      // Verifica se a query retornou com registros.
      // Caso negativo o procedimento será abortado
      if dtmEmptmo.qryRegra.IsEmpty then
      begin
         dtmEmptmo.qryRegra.Close;
         Exit;
      end;

      dtmEmptmo.Regra.RuleName   := IntToStr(iRuleName);
      dtmEmptmo.Regra.IDEmpresa  := Sistema.IDEmpresa;

   end
   else
   begin

      qryIntRegra.SQL.Clear;
      if length(sSQL) > 10240 then
      begin
         qryIntRegra.SQL.Add(sSQLNovo);
      end
      else  // if length(sSQL) > 10240
      begin
         qryIntRegra.SQL.Text := sSQLNovo;
      end;

      // Grava o SQL de entrada para permitir verificação
      if bGravaSQL then
      //SOL 114575
//         qryIntRegra.SQL.SaveToFile(Sistema.TempDir + 'Regra ' + IntToStr(iRuleName) + ' - ' + 'd' + sTexto + '.txt');
        Try // Ádler Souza - SOL 131928 Kintana 754978
         qryIntRegra.SQL.SaveToFile(ftempregra + '\' + 'Regra ' + IntToStr(iRuleName) + ' - ' + 'd' + sTexto + '.txt');
        Except
        end;// Fim Ádler Souza - SOL 131928 Kintana 754978
       //FIM            
      qryIntRegra.Open;


      // Verifica se a query retornou com registros.
      // Caso negativo o procedimento será abortado
      if qryIntRegra.IsEmpty then
      begin
         qryIntRegra.Close;
         Exit;
      end;

      ObjRegra.RuleName   := IntToStr(iRuleName);
      ObjRegra.IDEmpresa  := Sistema.IDEmpresa;
   end;

   try
      // -------------------------------------------------------------------------------------------
      //    Executa a Regra
      // -------------------------------------------------------------------------------------------

      if not(bCriaObjeto) then
      begin
         try
            //Pendência 24595 - 27/02/2007 - Alberto
            
            bExibeMensagens :=  dtmEmptmo.Regra.ExibeMensagens;
            dtmEmptmo.Regra.ExibeMensagens := bMostraMsg;

            dtmEmptmo.Regra.Execute;

            dtmEmptmo.Regra.ExibeMensagens := bExibeMensagens;
            //Fim Pendência 24595

            if dtmEmptmo.Regra.Error = False then
            begin
               try
                  fResult := StrToFloat(ConverteVirg(dtmEmptmo.Regra.Result));

                  // SOL 181899 KTN 1688596 Otacilio Aquino
                  Resultado   := ConverteVirg(dtmEmptmo.Regra.Result);
                  Result      := True;

               except
                  if bMostraMsg then
                  begin
                     MsgDlg('Erro na Regra nº ' + dtmEmptmo.Regra.RuleName + ', d' + sTexto + #13 + dtmEmptmo.Regra.Result,
                            'Empréstimo', mtError, [mbOk], 0);
                  end;
               end; (* try *)

            end
            else  // if dtmEmptmo.Regra.Error = False
            begin

               if bMostraMsg then
               begin
                  MsgDlg('Erro na Regra nº ' + dtmEmptmo.Regra.RuleName + ', d' + sTexto + #13 + dtmEmptmo.Regra.Result,
                         'Empréstimo', mtError, [mbOk], 0);
               end;

               dtmEmptmo.qryRegra.Close;
               Exit;

            end; (* if Regra.Error = False *)

         except

            on E:Exception do
            begin
               if bMostraMsg then
               begin
                  MsgDlg('Erro na Regra nº ' + dtmEmptmo.Regra.RuleName + ', d' + sTexto + #13 + E.Message,
                         'Empréstimo', mtError, [mbOk], 0);
               end;
            end;

         end; (* try *)

      end
      else  // if not(bCriaObjeto)
      begin

         try
            //Pendência 24595 - 27/02/2007 - Alberto
            ObjRegra.ExibeMensagens := bMostraMsg;
            //Fim Pendência 24595

            ObjRegra.Execute;

            if ObjRegra.Error = False then
            begin

               try
                  fResult := StrToFloat(ConverteVirg(ObjRegra.Result));

                  // SOL 181899 KTN 1688596 Otacilio Aquino
                  Resultado   := ConverteVirg(ObjRegra.Result);
                  Result      := True;

               except

                  if bMostraMsg then
                  begin
                     MsgDlg('Erro na Regra nº ' + ObjRegra.RuleName + ', d' + sTexto + #13 + ObjRegra.Result,
                            'Empréstimo', mtError, [mbOk], 0);
                  end;

               end; (* try *)

            end
            else  // if ObjRegra.Error = False
            begin

               if bMostraMsg then
               begin
                  MsgDlg('Erro na Regra nº ' + ObjRegra.RuleName + ', d' + sTexto + #13 + ObjRegra.Result,
                         'Empréstimo', mtError, [mbOk], 0);
               end;

               ObjRegra.Free;
               qryIntRegra.Close;
               qryIntRegra.Free;

               Exit;

            end; (* if Regra.Error = False *)

         except

            on E:Exception do
            begin
               if bMostraMsg then
               begin
                  MsgDlg('Erro na Regra nº ' + ObjRegra.RuleName + ', d' + sTexto + #13 + E.Message,
                         'Empréstimo', mtError, [mbOk], 0);
               end;
            end;

         end;  // try

     end;

     // -------------------------------------------------------------------------------------------
     //    Fim da execução da Regra
     // -------------------------------------------------------------------------------------------

   finally
      if not bCriaObjeto then
      begin
         dtmEmptmo.qryRegra.Close;
      end
      else
      begin
         ObjRegra.Free;
         qryIntRegra.Free;
      end;
   end;
end;



function UtilizaRegraBool(const iRuleName   : Int64;
                          const sSQL        : String;
                          const sTexto      : String;
                          var   Resultado   : String;
                          const bMostraMsg  : Boolean;
                          const bCriaObjeto : Boolean = False): Boolean;
var
   ObjRegra    : TRegra;
   qryIntRegra : TwwQuery;

   i           : Integer;
   sSQLNovo    : String;

   //Pendência 24595 - 27/02/2007 - Alberto
   bExibeMensagens : Boolean;
   //Fim Pendência 24595
begin
   Result := False;

   // Verifica se existe uma regra associada. Caso negativo o procedimento será abortado
   if iRuleName <= 0 then
   begin
      if bMostraMsg then
      begin
         MsgDlg('Não foi indicada a regra d' + sTexto + '.' + #13 + #13 + 'Favor Verificar.', 'Empréstimo', mtWarning, [mbOk], 0);
         Exit;
      end;
   end;  // if iRuleName <= 0

   // ----------------------------------------------------------------------------------------------

   // Retira TAB, LF e CR do SQL -------------------------------------------------------------------
   if length(sSQL) > 10240 then
   begin
      sSQLNovo := '';
      for i := 1 to length(sSQL) do
      begin
         if ( (sSQL[i] <> #9) and (sSQL[i] <> #10) and (sSQL[i] <> #13) ) then
         begin
            sSQLNovo := sSQLNovo + sSQL[i];
         end;
      end;
   end
   else
   begin
      sSQLNovo := sSQL;
   end;
   // Fim (Retira LF e CR do SQL) ------------------------------------------------------------------

   if bCriaObjeto then
   begin
      qryIntRegra              := TwwQuery.Create(nil);
      qryIntRegra.DatabaseName := 'BaseDados';

      // Cria e Executa o objeto Regra
      ObjRegra                := TRegra.Create(Application);
      ObjRegra.DatabaseName   := 'BaseDados';
      ObjRegra.QueryIn        := qryIntRegra;
   end;

   if not(bCriaObjeto) then
   begin
      dtmEmptmo.qryRegra.SQL.Clear;
      if length(sSQL) > 10240 then
      begin
         dtmEmptmo.qryRegra.SQL.Add(sSQLNovo);
      end
      else
      begin
         dtmEmptmo.qryRegra.SQL.Text := sSQLNovo;
      end;

      // Grava o SQL de entrada para permitir verificação
      //SOL 114575
//      dtmEmptmo.qryRegra.SQL.SaveToFile(Sistema.TempDir + 'Regra ' + IntToStr(iRuleName) + ' - ' + 'd' + sTexto + '.txt');
      Try // Ádler Souza - SOL 131928 Kintana 754978
         dtmEmptmo.qryRegra.SQL.SaveToFile(ftempregra + '\' + 'Regra ' + IntToStr(iRuleName) + ' - ' + 'd' + sTexto + '.txt');
      Except
      end;// Fim - Ádler Souza - SOL 131928 Kintana 754978

      //FIM
      dtmEmptmo.qryRegra.Open;


      // Verifica se a query retornou com registros.
      // Caso negativo o procedimento será abortado
      if dtmEmptmo.qryRegra.IsEmpty then
      begin
         dtmEmptmo.qryRegra.Close;
         Exit;
      end;

      dtmEmptmo.Regra.RuleName   := IntToStr(iRuleName);
      dtmEmptmo.Regra.IDEmpresa  := Sistema.IDEmpresa;

   end
   else  // if not(bCriaObjeto)
   begin

      qryIntRegra.SQL.Clear;
      if length(sSQL) > 10240 then
      begin
         qryIntRegra.SQL.Add(sSQLNovo);
      end
      else
      begin
         qryIntRegra.SQL.Text := sSQLNovo;
      end;

      // Grava o SQL de entrada para permitir verificação
      //SOL 114575
//      qryIntRegra.SQL.SaveToFile(Sistema.TempDir + 'Regra ' + IntToStr(iRuleName) + ' - ' + 'd' + sTexto + '.txt');
      Try // Ádler Souza - SOL 131928 Kintana 754978
        qryIntRegra.SQL.SaveToFile(ftempregra + '\' + 'Regra ' + IntToStr(iRuleName) + ' - ' + 'd' + sTexto + '.txt');
      Except
      end;//Fim - Ádler Souza - SOL 131928 Kintana 754978 
        //FIM
      qryIntRegra.Open;


      // Verifica se a query retornou com registros.
      // Caso negativo o procedimento será abortado
      if qryIntRegra.IsEmpty then
      begin
         qryIntRegra.Close;
         Exit;
      end;

      ObjRegra.RuleName   := IntToStr(iRuleName);
      ObjRegra.IDEmpresa  := Sistema.IDEmpresa;
   end;

   try
      // -------------------------------------------------------------------------------------------
      //    Executa a Regra
      // -------------------------------------------------------------------------------------------

      if not(bCriaObjeto) then
      begin
         try
            //Pendência 24595 - 27/02/2007 - Alberto
            bExibeMensagens :=  dtmEmptmo.Regra.ExibeMensagens;
            dtmEmptmo.Regra.ExibeMensagens := bMostraMsg;

            dtmEmptmo.Regra.Execute;

            dtmEmptmo.Regra.ExibeMensagens := bExibeMensagens;
            //Fim Pendência 24595

            if dtmEmptmo.Regra.Error = False then
            begin
               if ( (lowercase(dtmEmptmo.Regra.Result) = 'true') or (lowercase(dtmEmptmo.Regra.Result) = 'false') ) then
               begin
                  (* variável passada por referência para ser usada como valor retornado pela Regra *)
                  Resultado   := dtmEmptmo.Regra.Result;
                  Result      := True;
               end
               else
               begin
                  if bMostraMsg then
                  begin
                     MsgDlg('Erro na Regra nº ' + dtmEmptmo.Regra.RuleName + ', d' + sTexto + #13 + dtmEmptmo.Regra.Result,
                            'Empréstimo', mtError, [mbOk], 0);
                  end;

               end; (* if lowercase... *)

            end
            else  // if dtmEmptmo.Regra.Error = False
            begin

               if bMostraMsg then
               begin
                  MsgDlg('Erro na Regra nº ' + dtmEmptmo.Regra.RuleName + ', d' + sTexto + #13 + dtmEmptmo.Regra.Result,
                         'Empréstimo', mtError, [mbOk], 0);
               end;

               dtmEmptmo.qryRegra.Close;
               Exit;

            end; (* if Regra.Error = False *)

         except

            on E:Exception do
            begin
               if bMostraMsg then
               begin
                  MsgDlg('Erro na Regra nº ' + dtmEmptmo.Regra.RuleName + ', d' + sTexto + #13 + E.Message,
                         'Empréstimo', mtError, [mbOk], 0);
               end;
            end;

         end; (* try *)

      end
      else
      begin

         try
            //Pendência 24595 - 27/02/2007 - Alberto
            ObjRegra.ExibeMensagens := bMostraMsg;
            //Fim Pendência 24595

            ObjRegra.Execute;

            if ObjRegra.Error = False then
            begin
               if ( (lowercase(ObjRegra.Result) = 'true') or (lowercase(ObjRegra.Result) = 'false') ) then
               begin
                  (* variável passada por referência para ser usada como valor retornado pela Regra *)
                  Resultado   := ObjRegra.Result;
                  Result      := True;
               end
               else
               begin
                  if bMostraMsg then
                  begin
                     MsgDlg('Erro na Regra nº ' + ObjRegra.RuleName + ', d' + sTexto + #13 + ObjRegra.Result,
                            'Empréstimo', mtError, [mbOk], 0);
                  end;

               end; (* if lowercase... *)

            end
            else  // if ObjRegra.Error = False
            begin

               if bMostraMsg then
               begin
                  MsgDlg('Erro na Regra nº ' + ObjRegra.RuleName + ', d' + sTexto + #13 + ObjRegra.Result,
                         'Empréstimo', mtError, [mbOk], 0);
               end;

               ObjRegra.Free;
               qryIntRegra.Close;
               qryIntRegra.Free;

               Exit;

            end; (* if Regra.Error = False *)

         except

            on E:Exception do
            begin
               if bMostraMsg then
               begin
                  MsgDlg('Erro na Regra nº ' + ObjRegra.RuleName + ', d' + sTexto + #13 + E.Message,
                         'Empréstimo', mtError, [mbOk], 0);
               end;
            end;

         end; (* try *)

      end;

      // -------------------------------------------------------------------------------------------
      //    Fim da execução da Regra
      // -------------------------------------------------------------------------------------------

   finally
      if not bCriaObjeto then
      begin
         dtmEmptmo.qryRegra.Close;
      end
      else
      begin
         ObjRegra.Free;
         qryIntRegra.Free;
      end;
   end;
end;



function UtilizaRegraData(const iRuleName  : Int64;
                          const sSql       : String;
                          const sTexto     : String;
                          var   Resultado  : String;
                          const bMostraMsg : Boolean;
                          const bCriaObjeto : Boolean = False): Boolean;
var
   ObjRegra    : TRegra;
   qryIntRegra : TwwQuery;

   i           : Integer;
   sSQLNovo    : String;

   //Pendência 24595 - 27/02/2007 - Alberto
   bExibeMensagens : Boolean;
   //Fim Pendência 24595
begin
   Result := False;

   // Verifica se existe uma regra associada. Caso negativo o procedimento será abortado
   if iRuleName <= 0 then
   begin
      if bMostraMsg then
      begin
         MsgDlg('Não foi indicada a regra d' + sTexto + '.' + #13 + #13 + 'Favor Verificar.', 'Empréstimo', mtWarning, [mbOk], 0);
         Exit;
      end;
   end;  // if iRuleName <= 0

   // ----------------------------------------------------------------------------------------------

   // Retira TAB, LF e CR do SQL -------------------------------------------------------------------
   if length(sSQL) > 10240 then
   begin
      sSQLNovo := '';
      for i := 1 to length(sSQL) do
      begin
         if ( (sSQL[i] <> #9) and (sSQL[i] <> #10) and (sSQL[i] <> #13) ) then
         begin
            sSQLNovo := sSQLNovo + sSQL[i];
         end;
      end;
   end
   else
   begin
      sSQLNovo := sSQL;
   end;
   // Fim (Retira LF e CR do SQL) ------------------------------------------------------------------

   if bCriaObjeto then
   begin
      qryIntRegra                := TwwQuery.Create(nil);
      qryIntRegra.DatabaseName   := 'BaseDados';

      // Cria e Executa o objeto Regra
      ObjRegra                   := TRegra.Create(Application);
      ObjRegra.DatabaseName      := 'BaseDados';
      ObjRegra.QueryIn           := qryIntRegra;
   end;

   if not bCriaObjeto then
   begin
      dtmEmptmo.qryRegra.SQL.Clear;
      if length(sSQL) > 10240 then
      begin
         dtmEmptmo.qryRegra.SQL.Add(sSQLNovo);
      end
      else
      begin
         dtmEmptmo.qryRegra.SQL.Text := sSQLNovo;
      end;

      // Grava o SQL de entrada para permitir verificação
      //SOL 114575
      //      dtmEmptmo.qryRegra.SQL.SaveToFile(Sistema.TempDir + 'Regra ' + IntToStr(iRuleName) + ' - ' + 'd' + sTexto + '.txt');
      Try // Ádler Souza - SOL 131928 Kintana 754978
        dtmEmptmo.qryRegra.SQL.SaveToFile(ftempregra + '\' + 'Regra ' + IntToStr(iRuleName) + ' - ' + 'd' + sTexto + '.txt');
      Except
      end;//Fim - Ádler Souza - SOL 131928 Kintana 754978
      //FIM
      dtmEmptmo.qryRegra.Open;


      // Verifica se a query retornou com registros.
      // Caso negativo o procedimento será abortado
      if dtmEmptmo.qryRegra.IsEmpty then
      begin
         dtmEmptmo.qryRegra.Close;
         Exit;
      end;

      dtmEmptmo.Regra.RuleName   := IntToStr(iRuleName);
      dtmEmptmo.Regra.IDEmpresa  := Sistema.IDEmpresa;

   end
   else
   begin

      qryIntRegra.SQL.Clear;
      if length(sSQL) > 10240 then
      begin
         qryIntRegra.SQL.Add(sSQLNovo);
      end
      else
      begin
         qryIntRegra.SQL.Text := sSQLNovo;
      end;

      // Grava o SQL de entrada para permitir verificação
      //SOL 114575
//      qryIntRegra.SQL.SaveToFile(Sistema.TempDir + 'Regra ' + IntToStr(iRuleName) + ' - ' + 'd' + sTexto + '.txt');
      Try // Ádler Souza - SOL 131928 Kintana 754978
        qryIntRegra.SQL.SaveToFile(ftempregra + '\' + 'Regra ' + IntToStr(iRuleName) + ' - ' + 'd' + sTexto + '.txt');
      Except
      end;//Fim - Ádler Souza - SOL 131928 Kintana 754978

        //FIM
      qryIntRegra.Open;


      // Verifica se a query retornou com registros.
      // Caso negativo o procedimento será abortado
      if qryIntRegra.IsEmpty then
      begin
         qryIntRegra.Close;
         Exit;
      end;

      ObjRegra.RuleName   := IntToStr(iRuleName);
      ObjRegra.IDEmpresa  := Sistema.IDEmpresa;

   end;

   try

      // -------------------------------------------------------------------------------------------
      //    Executa a Regra
      // -------------------------------------------------------------------------------------------

      if not(bCriaObjeto) then
      begin
         try
            //Pendência 24595 - 27/02/2007 - Alberto
            bExibeMensagens :=  dtmEmptmo.Regra.ExibeMensagens;
            dtmEmptmo.Regra.ExibeMensagens := bMostraMsg;

            dtmEmptmo.Regra.Execute;

            dtmEmptmo.Regra.ExibeMensagens := bExibeMensagens;
            //Fim Pendência 24595

            if dtmEmptmo.Regra.Error = False then
            begin

               try

                  Resultado   := dtmEmptmo.Regra.Result;
                  Result      := True;

               except

                  if bMostraMsg then
                  begin
                     MsgDlg('Erro na Regra nº ' + dtmEmptmo.Regra.RuleName + ', d' + sTexto + #13 + dtmEmptmo.Regra.Result,
                            'Empréstimo', mtError, [mbOk], 0);
                  end;

               end; (* try *)

            end
            else
            begin

               if bMostraMsg then
               begin
                  MsgDlg('Erro na Regra nº ' + dtmEmptmo.Regra.RuleName + ', d' + sTexto + #13 + dtmEmptmo.Regra.Result,
                         'Empréstimo', mtError, [mbOk], 0);
               end;

               dtmEmptmo.qryRegra.Close;
               Exit;

            end; (* if Regra.Error = False *)

         except

            on E:Exception do
            begin
               if bMostraMsg then
               begin
                  MsgDlg('Erro na Regra nº ' + dtmEmptmo.Regra.RuleName + ', d' + sTexto + #13 + E.Message,
                         'Empréstimo', mtError, [mbOk], 0);
               end;
            end;

         end; (* try *)

      end
      else  // if not(bCriaObjeto)
      begin

         try
            //Pendência 24595 - 27/02/2007 - Alberto
            ObjRegra.ExibeMensagens := bMostraMsg;
            //Fim Pendência 24595

            ObjRegra.Execute;

            if ObjRegra.Error = False then
            begin

               try

                  Resultado   := ObjRegra.Result;
                  Result      := True;

               except

                  if bMostraMsg then
                  begin
                     MsgDlg('Erro na Regra nº ' + ObjRegra.RuleName + ', d' + sTexto + #13 + ObjRegra.Result,
                            'Empréstimo', mtError, [mbOk], 0);
                  end;

               end; (* try *)

            end
            else
            begin

               if bMostraMsg then
               begin
                  MsgDlg('Erro na Regra nº ' + ObjRegra.RuleName + ', d' + sTexto + #13 + ObjRegra.Result,
                         'Empréstimo', mtError, [mbOk], 0);
               end;

               ObjRegra.Free;
               qryIntRegra.Close;
               qryIntRegra.Free;
               Exit;

            end; (* if Regra.Error = False *)

         except

            on E:Exception do
            begin
               if bMostraMsg then
               begin
                  MsgDlg('Erro na Regra nº ' + ObjRegra.RuleName + ', d' + sTexto + #13 + E.Message,
                         'Empréstimo', mtError, [mbOk], 0);
               end;
            end;

         end; (* try *)

      end;

      // -------------------------------------------------------------------------------------------
      //    Fim da execução da Regra
      // -------------------------------------------------------------------------------------------

   finally
      if not bCriaObjeto then
      begin
         dtmEmptmo.qryRegra.Close;
      end
      else
      begin
         ObjRegra.Free;
         qryIntRegra.Free;
      end;
   end;
end;



function UtilizaRegraValorNOVA(const iRuleName   : Int64;
                               const sSQL        : String;
                               const sTexto      : String;
                               var   Resultado   : String;
                               const bMostraMsg  : Boolean;
                               const bCriaObjeto : Boolean = False;
                               const bGravaSQL   : Boolean = True
                              ): Boolean;
var
   ObjRegra    : TRegra;
   qryIntRegra : TwwQuery;

   fResult     : Extended;
   i           : Integer;
   sSQLNovo    : String;

   //Pendência 24595 - 27/02/2007 - Alberto
   bExibeMensagens : Boolean;
   //Fim Pendência 24595
begin
   Result := False;

   // ----------------------------------------------------------------------------------------------

   // Verifica se existe uma regra associada. Caso negativo o procedimento será abortado
   if iRuleName <= 0 then
   begin
      if bMostraMsg then
      begin
         MsgDlg('Não foi indicada a regra d' + sTexto + '.' + #13 + #13 + 'Favor Verificar.', 'Empréstimo', mtWarning, [mbOk], 0);
         Exit;
      end;
   end;  // if iRuleName <= 0

   // ----------------------------------------------------------------------------------------------

   // Grava o SQL de entrada para permitir verificação
   if bGravaSQL then
      LogToFile(sSQL, 'Regra ' + IntToStr(iRuleName) + ' - ' + 'd' + sTexto + '.txt', False, False, False, True);

   // ----------------------------------------------------------------------------------------------

   // Verifica se a query retornou com registros.
   // Caso negativo o procedimento será abortado
   if dtmEmptmo.qryRegra.IsEmpty then
   begin
      dtmEmptmo.qryRegra.Close;
      Exit;
   end;

   // ----------------------------------------------------------------------------------------------

   dtmEmptmo.Regra.RuleName   := IntToStr(iRuleName);
   dtmEmptmo.Regra.IDEmpresa  := Sistema.IDEmpresa;

   try
      // -------------------------------------------------------------------------------------------
      //    Executa a Regra
      // -------------------------------------------------------------------------------------------

      try
         //Pendência 24595 - 27/02/2007 - Alberto
         bExibeMensagens :=  dtmEmptmo.Regra.ExibeMensagens;
         dtmEmptmo.Regra.ExibeMensagens := bMostraMsg;

         dtmEmptmo.Regra.Execute;

         dtmEmptmo.Regra.ExibeMensagens := bExibeMensagens;
         //Fim Pendência 24595

         if dtmEmptmo.Regra.Error = False then
         begin
            try
               fResult := StrToFloat(ConverteVirg(dtmEmptmo.Regra.Result));

               Resultado   := dtmEmptmo.Regra.Result;
               Result      := True;

            except
               if bMostraMsg then
               begin
                  MsgDlg('Erro na Regra nº ' + dtmEmptmo.Regra.RuleName + ', d' + sTexto + #13 + dtmEmptmo.Regra.Result,
                         'Empréstimo', mtError, [mbOk], 0);
               end;
            end; (* try *)

         end
         else  // if dtmEmptmo.Regra.Error = False
         begin

            if bMostraMsg then
            begin
               MsgDlg('Erro na Regra nº ' + dtmEmptmo.Regra.RuleName + ', d' + sTexto + #13 + dtmEmptmo.Regra.Result,
                      'Empréstimo', mtError, [mbOk], 0);
            end;

            dtmEmptmo.qryRegra.Close;
            Exit;

         end; (* if Regra.Error = False *)

      except

         on E:Exception do
         begin
            if bMostraMsg then
            begin
               MsgDlg('Erro na Regra nº ' + dtmEmptmo.Regra.RuleName + ', d' + sTexto + #13 + E.Message,
                      'Empréstimo', mtError, [mbOk], 0);
            end;
         end;

      end; (* try *)


      // -------------------------------------------------------------------------------------------
      //    Fim da execução da Regra
      // -------------------------------------------------------------------------------------------

   finally
   end;
end;



function LogToFile(const sLog   : String;
                   const sArq   : String;
                   const bPasta : Boolean = True;
                   const bHora  : Boolean = True;
                   const bMem       : Boolean = False;
                   const bNovoArq   : Boolean = False
                  ): Boolean;
var
   mem      : TMemoryStatus;
   Arquivo  : TextFile;
   sPasta   : String;
   sArquivo : String;
   sLinha   : String;
begin
   // ----------------------------------------------------------------------------------------------

   if sArq = '' then
   begin
      Result := True;
      Exit;
   end;

   // ----------------------------------------------------------------------------------------------
//SOL 114575
//   sPasta := Sistema.TempDir;
     sPasta := ftempregra + '\';
//FIM
   if bPasta then
      sPasta := sPasta + 'LogEP\';

   sArquivo := sPasta + sArq;

   // ----------------------------------------------------------------------------------------------

   try
      {$I-} // Diretiva do Delphi - Não pode ser retirada

      CriaDiretorio(sPasta);
      AssignFile(Arquivo, sArquivo);

      if FileExists(sArquivo) and not(bNovoArq) then
      begin
         Append(Arquivo);
      end
      else
      begin
         ReWrite(Arquivo);
      end;

      // -------------------------------------------------------------------------------------------

      sLinha := '';
      if bHora then sLinha := FormatDateTime('hh:nn:ss', Now) + ' - ';
      sLinha := sLinha + sLog;

      Writeln(Arquivo, sLinha);

      if bMem then
      begin
         // ----------------------------------------------------------------------------------------

         mem.dwLength:= SizeOf(TMemoryStatus);
         GlobalMemoryStatus(mem);

         // ----------------------------------------------------------------------------------------
         Writeln(Arquivo, StringOfChar(' ', 75) +
                          '--> Memória Disponivel: ' +
                          FormatFloat('#,###" KB"', mem.dwAvailPhys  div 1024) + ' / ' +
                       //   FormatFloat('#,#0.00"%"', mem.dwMemoryLoad) + ' / ' +
                          FormatFloat('#,###" KB"', mem.dwAvailPageFile div 1024)
                );
         // ----------------------------------------------------------------------------------------
      end;

      // -------------------------------------------------------------------------------------------

      CloseFile(Arquivo);

      Result := True;

      {$I+}
      Application.ProcessMessages;

   except
      Result := False;
   end;
end;



function LogBPL(const sArq  : String;
                const bHora : Boolean = False
               ): Boolean;
var
   Arquivo  : TextFile;
   sPasta   : String;
   sArquivo : String;
   sLinha   : String;
   sLog     : String;
   iQuant   : Integer;
   i        : Integer;
   bGrava   : Boolean;
begin
//SOL 114575
//    sPasta   := Sistema.TempDir + 'LogEP';
     sPasta   := ftempregra + '\' + 'LogEP';
//FIM
   sArquivo := sPasta + '\' + sArq;

   try
      // -------------------------------------------------------------------------------------------

      {$I-} // Diretiva do Delphi - Não pode ser retirada

      CriaDiretorio(sPasta);
      AssignFile(Arquivo, sArquivo);

      // -------------------------------------------------------------------------------------------

      if FileExists(sArquivo) then
      begin
         Append(Arquivo);
      end
      else
      begin
         ReWrite(Arquivo);
      end;

      // -------------------------------------------------------------------------------------------

      sLinha := '';
      sLinha := FormatDateTime('hh:nn:ss', Now) + ' - ';

      sLog   := FormatDateTime('hh:nn:ss', Systime) + ' (horário do servidor)';

      sLinha := sLinha + sLog;

      Writeln(Arquivo, sLinha);

      // -------------------------------------------------------------------------------------------

      sLinha := '';
      if bHora then sLinha := FormatDateTime('hh:nn:ss', Now) + ' - ';

      sLog  := CompletaFim('Usuário', ' ', 15) +
               CompletaFim(Sistema.NomeUsuario, ' ', 12);

      sLinha := sLinha + sLog;

      Writeln(Arquivo, sLinha);

      // -------------------------------------------------------------------------------------------

      sLinha := '';
      if bHora then sLinha := FormatDateTime('hh:nn:ss', Now) + ' - ';

      sLog  := CompletaFim('Sistema', ' ', 15) +
               CompletaFim(' (' + Sistema.Versao + ') ', ' ', 12) + ' - ' +
               Sistema.NomeModulo + ' (' + IntToStr(Sistema.IDModulo) + ')';

      sLinha := sLinha + sLog;

      Writeln(Arquivo, sLinha);

      // -------------------------------------------------------------------------------------------

      iQuant := dtmEmptmo.ResourceManager.RetornaBplsAssociadas;

      for i := 0 to (iQuant - 1) do
      begin
         bGrava   := ( pos('execep', lowercase(dtmEmptmo.ResourceManager.BplsAssociadas(i).BPL)) > 0 ) or
                     ( pos('objetosep', lowercase(dtmEmptmo.ResourceManager.BplsAssociadas(i).BPL)) > 0 ) or
                     ( pos('integraep', lowercase(dtmEmptmo.ResourceManager.BplsAssociadas(i).BPL)) > 0 ) or
                     ( pos('regra', lowercase(dtmEmptmo.ResourceManager.BplsAssociadas(i).BPL)) > 0 );

         if bGrava then
         begin
            sLinha := '';
            if bHora then sLinha := FormatDateTime('hh:nn:ss', Now) + ' - ';

            sLog  := CompletaFim(dtmEmptmo.ResourceManager.BplsAssociadas(i).BPL, ' ', 15) +
                     CompletaFim(' (' + dtmEmptmo.ResourceManager.BplsAssociadas(i).Versao + ') ', ' ', 12) + ' - ' +
                     DateToStr(dtmEmptmo.ResourceManager.BplsAssociadas(i).Data) + ' - ' +
                     dtmEmptmo.ResourceManager.BplsAssociadas(i).Descricao;

            sLinha := sLinha + sLog;

            Writeln(Arquivo, sLinha);
         end;
      end;

      // -------------------------------------------------------------------------------------------

      CloseFile(Arquivo);

      Result := True;

      {$I+}
      Application.ProcessMessages;

   except
      Result := False;
   end;
end;

//edilaine - SIG57627 - inicio
function iif(condicao : Boolean; sVerdadeiro, sFalso : string) : String;
begin
  if condicao then
     Result := sVerdadeiro
  else
     Result := sFalso; 
end;

procedure Split(Delimiter: Char; Str: string; ListOfStrings: TStrings) ;
var
  ini, fim : integer;
begin
   ListOfStrings.Clear;

   while  Pos('|', Str) > 0 do
   begin
     ListOfStrings.Add( Trim(copy(Str, 1, Pos('|', Str)-1)) );
     Str := StringReplace(Str, ListOfStrings.Strings[ ListOfStrings.count-1 ]+'|' , '', []);
   end;
end;
//edilaine - SIG57627 - fim


end.
