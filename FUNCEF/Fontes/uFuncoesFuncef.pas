// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Paulo Ramos
// Data        : 28/05/2007
// Pendência   : 25465
// Rotina      : bbtnConfirmarClick
// Alteração   : Ajuste no controle de hora para tratar virada do dia.
//------------------------------------------------------------------------------

unit uFuncoesFuncef;

interface

uses
   SysUtils, Math, wwQuery, wwDBGrid, Forms, ComCtrls, StdCtrls, Mask, Dialogs,
   MontaSelect, Classes, Controls, Graphics, Dbctrls, wwdblook, TREdit, Buttons,
   CMDateTimePicker, dbgrids, Db, Wwdbspin, checklst;


   function SysDate: TDateTime;

   function OraNumero(sNumero: String): String;
   function ConvertePonto(sConverter: String): String;
   function ConverteVirg(sConverter: String): String;
   function StrToCurrency(sNumero : String) : Currency;
   function DiaUtil(sDiaUtil, sMesAno : String) : String;
   // Retorna string com formato de data para o Oracle (TO_DATE)
   function OraData(const dData : TDateTime) : String;
   // retorna no formato mm/aaaa
   function ProximoMesAno(iMes, iAno: Integer): String;
   // retorna no formato mm/aaaa
   function MesAnoAnterior(iMes, iAno: Integer): String;
   // retorna o nome do mes por extenso
   function MesExtenso(const iMes: integer): string;
   // função de arredondamento de valores
   function Arredonda(fValor: extended; iDecimais: word): extended;
   // Retorna um número formatado no padrão Ingles (".") --> formato do banco
   function NumeroIngles(fValor: extended): string;

   // manipulação de TwwQueries --------------------------------------------------------------------
   procedure LimpaParametros(const qry: TwwQuery);
   procedure AtribuiSQL(qry: TwwQuery; const sTextoSQL: string);
   // ----------------------------------------------------------------------------------------------

   // manipulação de Strings --------------------------------------------------------------------
   function CompletaInicio(sOriginal, sCompleta: string; iLimiteTamanho: word): string;
   function CompletaFim(sOriginal, sCompleta: string; iLimiteTamanho: word): string;
   // ----------------------------------------------------------------------------------------------

   function Replicate(aTexto:string;NumVezes:Integer):string;

   procedure MontaFiltro(ChkList : TCheckListBox;
                         ListaAux : tstrings;
                         var StrLista : string);

   procedure MarcaLista(ChkList : TCheckListBox; bMarca : boolean);
   function VerificaLista(ChkList : TCheckListBox): boolean;
   function TempoDecorrido(tIni, tFim : tDateTime) : string;
   //Formata o tempo decorrido entre 2 momentos considerando o total de dias se maior que 1.

implementation

uses dBaseDados, uDataBase, uSistema, uDocumento, uDiasUteis, uIntegraBack, uMensErro;

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

function StrToCurrency(sNumero : String) : Currency;
begin
   Result := StrToCurr(sNumero) / 100;
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

function Arredonda(fValor: extended; iDecimais: word): extended;
begin
   Result := (round(fValor * Power(10, iDecimais))) / Power(10, iDecimais);
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

//P.RAMOS-02/06/2006-PEND.22498-COLOCAR CONTRA CHEQUE DA FOLHA
procedure MarcaLista(ChkList : TCheckListBox; bMarca : boolean);
 var i : integer;
begin
  for i:=0 to ChkList.Items.Count-1 do
    ChkList.Checked[i]:=bMarca;
end;

function VerificaLista(ChkList : TCheckListBox): boolean;
 var i: integer;
     b: boolean;
begin
  b:=true;
  for i:=0 to ChkList.Items.Count-1 do
    b:=b and ChkList.Checked[i];
  result:=b;
end;

procedure MontaFiltro(ChkList : TCheckListBox; ListaAux : tstrings;
  var StrLista : string);
 var i : integer;
     btudo : boolean;
begin
  strLista:=''; btudo:=true;
  for i:=0 to chklist.items.count-1 do
    if chklist.checked[I] then
    begin
      if strLista = '' then
        strLista:=ListaAux[I]
      else
        strLista:=strLista+','+ListaAux[I];
    end
    else
      btudo:=false;
  if btudo then
    strLista:='';
end;

function Replicate(aTexto:string;NumVezes:Integer):string;
var
  I:Integer;
  Temp:string;
begin
  Temp:='';
  for I:=1 to NumVezes do
    Temp:=Temp+aTexto;
  Result:=Temp;
end;

function TempoDecorrido(tIni, tFim : tDateTime) : string;
//Formata o tempo decorrido entre 2 momentos considerando o total de dias se maior que 1.
var difdias : integer;
    hh, mm, ss, ms: word;
    s: string;
begin
  if tFim < tIni then
  begin
    result := 'Datas inválidas';
    exit;
  end;
    
  difdias := trunc(tFim - tIni);
  decodetime(tFim-tIni, hh, mm, ss, ms);
  if difdias > 2 then
  begin
    s := inttostr(difdias)+' dias, '+
      formatdatetime('hh "horas," nn "minutos e" ss "segundos"', tFim - tIni);
  end
  else
    if difdias > 0 then
    begin
      s := inttostr(difdias * 24 + hh) + ':' +
        formatdatetime('nn:ss', tFim - tIni);
    end
    else
    begin
      s := formatdatetime('hh:nn:ss', tFim - tIni);
    end;

  result := s;
end;



end.