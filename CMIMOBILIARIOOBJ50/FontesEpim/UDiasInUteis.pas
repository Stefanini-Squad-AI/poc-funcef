unit UDiasInUteis;

interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, Wwquery;


type
   TDiasInUteis = Class(TObject)
   private

   public

      // Função que retorna se um determinado ano é bissexto ou não
      function AnoBissexto(iAno: word): boolean;

      // Função que retorna o Dia de uma determinada data
      function ExtraiDia(dData: tDateTime): word;

      // Função que retorna o Mês de uma determinada data
      function ExtraiMes(dData: tDateTime): word;

      // Função que retorna o Ano de uma determinada data
      function ExtraiAno(dData: tDateTime): word;

      // Função que retorna o total de feriados em um determinado período
      function ContaFeriados(dDataIni, dDataFim: TDateTime; iCidade, iPais: integer; sEstado: string;
      bConsideraBancario, bConsideraExtraordinario: boolean): integer;

      // Função que retorna o total de domingos em um determinado período
      function ContaDomingos(dDataIni, dDataFim: TDateTime; iCidade, iPais: integer; sEstado: string;
      bConsideraBancario, bConsideraExtraordinario, bIgnoraFeriados: boolean): integer;

      // Função que retorna o total de sábados em um determinado período
      function ContaSabados(dDataIni, dDataFim: TDateTime; iCidade, iPais: integer; sEstado: string;
      bConsideraBancario, bConsideraExtraordinario, bIgnoraFeriados: boolean): integer;

      // Função que retorna o total de dias não úteis (feriados + sábados/domingos) em um determinado período
      function ContaDiasNaoUteis(dDataIni, dDataFim: TDateTime; iCidade, iPais: integer;
      sEstado: string; bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): integer;

      // Função que retorna se um determinado dia é feriado ou não
      function Feriado(dData: TDateTime; iCidade, iPais: integer; sEstado: string; bConsideraBancario,
      bConsideraExtraordinario: boolean): boolean;

      // Função que retorna se um determinado dia é útil ou não
      function DiaUtil(dData: TDateTime; iCidade, iPais: integer; sEstado: string; bConsideraBancario,
      bConsideraExtraordinario, bSabadoUtil: boolean): boolean;

      // Função que retorna o ultimo dia de um determinado mês
      function UltDiaMes(iAno, iMes: word): TDateTime;

      // Função que retorna o ultimo dia útil de um determinado mês
      function UltDiaUtilMes(iAno, iMes: word; iCidade, iPais: integer; sEstado: string;
      bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): TDateTime;

      // Função que retorna o ene-ésimo dia útil de um determinado mês
      function EnesimoDiaUtilMes(iAno, iMes, iDia: word; iCidade, iPais: integer; sEstado: string;
      bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): TDateTime;

      // Função que retorna a data resultante do incremento de um determindado nº de dias a partir
      // de uma data inicial
      function SomaDias(dDataIni: TDateTime; iDias: integer): TDateTime;

      // Função que retorna a data resultante do incremento de um determindado nº de meses a partir
      // de uma data inicial
      function SomaMeses(dDataIni: TDateTime; iMeses: integer): TDateTime;

      // Função que retorna a data resultante do incremento de um determindado nº de anos a partir
      // de uma data inicial
      function SomaAnos(dDataIni: TDateTime; iAnos: integer): TDateTime;

      // Função que retorna a data resultante do incremento de um determindado nº de dias úteis
      // a partir de uma data inicial
      function SomaDiasUteis(dDataIni: TDateTime; iDiasUteis: integer; iCidade, iPais: integer;
      sEstado: string; bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): TDateTime;

      // Função que retorna o 1º dia útil posterior a uma determinada data
      function PrimeiroDiaUtilPosterior(dData: TDateTime; iCidade, iPais: integer; sEstado: string;
      bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): TDateTime;

      // Função que retorna o último dia útil anterior a uma determinada data
      function UltDiaUtilAnterior(dData: TDateTime; iCidade, iPais: integer; sEstado: string;
      bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): TDateTime;

      // Função que retorna a quantidade de meses (inteiros) entre os meses definidos por 2 datas
      function MesesEntre(dDataIni, dDataFim: TDateTime): integer;

      // Função que retorna o intervalo de meses entre 2 determindadas datas
      function IntervaloMeses(dDataIni, dDataFim: TDateTime): integer;

      // Função que retorna o intervalo de dias entre 2 determindadas datas
      function IntervaloDias(dDataIni, dDataFim: TDateTime): integer;

      // Função que retorna o intervalo de dias úteis entre 2 determindadas datas
      function IntervaloDiasUteis(dDataIni, dDataFim: TDateTime; iCidade, iPais: integer;
      sEstado: string; bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): integer;

      // Função que retorna o nº de dias úteis em um mês
      function DiasUteisMes(iAno, iMes: word; iCidade, iPais: integer; sEstado: string;
      bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): word;

   end;



var
  DiasInUteis : TDiasInUteis;



implementation



//--------------------------------------------------------------------------------------------------
//    AnoBissexto:   Função que retorna se um determinado ano é bissexto ou não
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       iAno  :  ano em questão
//
//--------------------------------------------------------------------------------------------------
function TDiasInUteis.AnoBissexto(iAno: word): boolean;
begin
   Result := IsLeapYear(iAno);
end;



//--------------------------------------------------------------------------------------------------
//    ExtraiDia: Função que retorna o Dia de uma determinada data
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       dData    :  data cujo dia se deseja saber
//--------------------------------------------------------------------------------------------------
function TDiasInUteis.ExtraiDia(dData: tDateTime): word;
var
   iAno, iMes, iDia: word;
begin
   DecodeDate(dData, iAno, iMes, iDia);
   Result := iDia;
end;



//--------------------------------------------------------------------------------------------------
//    ExtraiDia: Função que retorna o Dia de uma determinada data
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       dData    :  data cujo dia se deseja saber
//--------------------------------------------------------------------------------------------------
function TDiasInUteis.ExtraiMes(dData: tDateTime): word;
var
   iAno, iMes, iDia: word;
begin
   DecodeDate(dData, iAno, iMes, iDia);
   Result := iMes;
end;



//--------------------------------------------------------------------------------------------------
//    ExtraiDia: Função que retorna o Dia de uma determinada data
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       dData    :  data cujo dia se deseja saber
//--------------------------------------------------------------------------------------------------
function TDiasInUteis.ExtraiAno(dData: tDateTime): word;
var
   iAno, iMes, iDia: word;
begin
   DecodeDate(dData, iAno, iMes, iDia);
   Result := iAno;
end;



//--------------------------------------------------------------------------------------------------
//    ContaFeriados: Função que retorna o total de feriados em um determinado período
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       dDataIni             :  data inicial do período que se deseja pesquisar
//       dDataFim             :  data final do período que se deseja pesquisar
//       iCidade              :  id da Cidade (idCidades)
//       iPais                :  id do País (idPais)
//       sEstado              :  código do Estado (CodEstado)
//       bConsidera[_tipo_]   :  True  - conta também feriados [_tipo_]
//                               False - ignora feriados [_tipo_]
//
//       -------------------------------------------------------------------------------------------
//          passar (-1) caso os parâmetros inteiros não sejam necessários
//          passar ('') caso os parâmetros string não sejam necessários
//       -------------------------------------------------------------------------------------------
//
//--------------------------------------------------------------------------------------------------
function TDiasInUteis.ContaFeriados(dDataIni, dDataFim: TDateTime; iCidade, iPais: integer; sEstado: string;
bConsideraBancario, bConsideraExtraordinario: boolean): integer;
var
   qryFeriado: TwwQuery;
   sTipos: string;
begin
   Result := -1;

   if dDataFim >= dDataIni then begin

      qryFeriado := twwQuery.Create(Application);
      qryFeriado.DatabaseName := 'BASEDADOS';

      // define os tipos de feriados que se deseja levar em conta
      // Feriados ordinários são SEMPRE levados em conta
      // Feriados classistas NUNCA são contados (precisa de consistência com
      sTipos := '''O''';
      if bConsideraBancario then       sTipos := sTipos + ',' + '''B''';
      if bConsideraExtraordinario then sTipos := sTipos + ',' + '''E''';

      try

         with qryFeriado do begin

            Close;
            SQL.Clear;
            SQL.Text :=
            'SELECT ' + chr(13) +
            '   DISTINCT(DATAFERIADO) ' + chr(13) +
            'FROM  ' + chr(13) +
            '   FERIADOS ' + chr(13) +
            'WHERE  ' + chr(13) +
            '   ( DATAFERIADO BETWEEN ( TO_DATE(''' + FormatDateTime('dd/mm/yyyy', dDataIni) + ''', ''DD/MM/YYYY'') ) AND ( TO_DATE(''' + FormatDateTime('dd/mm/yyyy', dDataFim) + ''', ''DD/MM/YYYY'') ) ) ' + chr(13) +
            '   AND ' + chr(13) +
            '   ( ' + chr(13) +
            '   ( IDPAIS = ' + IntToStr(iPais) + ' ) ' + chr(13) +
            '   OR ( ( IDPAIS = ' + IntToStr(iPais) + ' ) AND (CODESTADO = ''' + sEstado + ''' ) ) ' + chr(13) +
            '   OR ( IDCIDADES = ' + IntToStr(iCidade) + ' ) ' + chr(13) +
            '   ) ' + chr(13) +
            '   AND ( FLGTIPO IN (' + sTipos + ') )';

            Open;
         end;

         Result := qryFeriado.RecordCount;

      finally
         qryFeriado.Close;
         qryFeriado.Free;
      end;

   end;
end;



//--------------------------------------------------------------------------------------------------
//    ContaDomingos: Função que retorna o total de domingos em um determinado período
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       dDataIni          :  data inicial do período que se deseja pesquisar
//       dDataFim          :  data final do período que se deseja pesquisar
//       bIgnoraFeriados   :  True  - domingos que tbém sejam feriados NÃO SERÃO contados
//                            False - domingos que tbém sejam feriados SERÃO contados
//    Necessários p/ feriado:
//       iCidade              :  id da Cidade (idCidades)
//       iPais                :  id do País (idPais)
//       sEstado              :  código do Estado (CodEstado)
//       bConsidera[_tipo_]   :  True  - conta também feriados [_tipo_]
//                               False - ignora feriados [_tipo_]
//
//       -------------------------------------------------------------------------------------------
//          passar (-1) caso os parâmetros (inteiros) não sejam necessários
//          passar ('') caso os parâmetros string não sejam necessários
//       -------------------------------------------------------------------------------------------
//
//--------------------------------------------------------------------------------------------------
function TDiasInUteis.ContaDomingos(dDataIni, dDataFim: TDateTime; iCidade, iPais: integer;
sEstado: string; bConsideraBancario, bConsideraExtraordinario, bIgnoraFeriados: boolean): integer;
begin
   Result := -1;

   if dDataFim >= dDataIni then begin
      Result := 0;
      while dDataFim > (dDataIni - 1) do begin

         if bIgnoraFeriados then begin
            // nesse caso, só considera se não for feriado tbém
            if ( (DayOfWeek(dDataFim) = 1) and not(Feriado(dDataFim, iCidade, iPais, sEstado,
                  bConsideraBancario, bConsideraExtraordinario))
               ) then inc(Result);
         end else begin
            if DayOfWeek(dDataFim) = 1 then inc(Result);
         end;

         dDataFim := dDataFim - 1;
      end;
   end;
end;



//--------------------------------------------------------------------------------------------------
//    ContaSabados: Função que retorna o total de sábados em um determinado período
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       dDataIni          :  data inicial do período que se deseja pesquisar
//       dDataFim          :  data final do período que se deseja pesquisar
//       bIgnoraFeriados   :  True  - sábados que tbém sejam feriados NÃO SERÃO contados
//                            False - sábados que tbém sejam feriados SERÃO contados
//    Necessários p/ feriado:
//       iCidade              :  id da Cidade (idCidades)
//       iPais                :  id do País (idPais)
//       sEstado              :  código do Estado (CodEstado)
//       bConsidera[_tipo_]   :  True  - conta também feriados [_tipo_]
//                               False - ignora feriados [_tipo_]
//
//       -------------------------------------------------------------------------------------------
//          passar (-1) caso os parâmetros (inteiros) não sejam necessários
//          passar ('') caso os parâmetros string não sejam necessários
//       -------------------------------------------------------------------------------------------
//
//--------------------------------------------------------------------------------------------------
function TDiasInUteis.ContaSabados(dDataIni, dDataFim: TDateTime; iCidade, iPais: integer;
sEstado: string; bConsideraBancario, bConsideraExtraordinario, bIgnoraFeriados: boolean): integer;
begin
   Result := -1;

   if dDataFim >= dDataIni then begin
      Result := 0;
      while dDataFim > (dDataIni - 1) do begin

         if bIgnoraFeriados then begin
            // nesse caso, só considera se não for feriado tbém
            if ( (DayOfWeek(dDataFim) = 7) and not(Feriado(dDataFim, iCidade, iPais, sEstado,
                  bConsideraBancario, bConsideraExtraordinario))
               ) then inc(Result);
         end else begin
            if DayOfWeek(dDataFim) = 7 then inc(Result);
         end;

         dDataFim := dDataFim - 1;
      end;
   end;
end;



//--------------------------------------------------------------------------------------------------
//    ContaDiasNaoUteis:   Função que retorna o total de dias não úteis (feriados + sábados/domingos)
//                         em um determinado período
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       dDataIni             :  data inicial do período que se deseja pesquisar
//       dDataFim             :  data final do período que se deseja pesquisar
//       iCidade              :  id da Cidade (idCidades)
//       iPais                :  id do País (idPais)
//       sEstado              :  código do Estado (CodEstado)
//       bConsidera[_tipo_]   :  True  - conta também feriados [_tipo_]
//                               False - ignora feriados [_tipo_]
//       bSabadoUtil          :  True  - sábados serão considerados dias úteis
//                               False - sábados não serão considerados dias úteis
//
//       -------------------------------------------------------------------------------------------
//          passar (-1) caso os parâmetros (inteiros) não sejam necessários
//          passar ('') caso os parâmetros string não sejam necessários
//       -------------------------------------------------------------------------------------------
//
//--------------------------------------------------------------------------------------------------
function TDiasInUteis.ContaDiasNaoUteis(dDataIni, dDataFim: TDateTime; iCidade, iPais: integer;
sEstado: string; bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): integer;
begin
   Result := -1;

   if dDataFim >= dDataIni then begin
      Result := 0;

      // Feriados
      Result := Result + ContaFeriados(dDataIni, dDataFim, iCidade, iPais, sEstado,
                                       bConsideraBancario, bConsideraExtraordinario);
      // Domingos
      Result := Result + ContaDomingos(dDataIni, dDataFim, iCidade, iPais, sEstado, bConsideraBancario,
                         bConsideraExtraordinario, True);

      // Sábados
      if not(bSabadoUtil) then begin
         Result := Result + ContaSabados(dDataIni, dDataFim, iCidade, iPais, sEstado,
                            bConsideraBancario, bConsideraExtraordinario, True);
      end;

   end;
end;



//--------------------------------------------------------------------------------------------------
//    Feriado: Função que retorna se um determinado dia é feriado ou não
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       dData                :  data em questão
//       iCidade              :  id da Cidade (idCidades)
//       iPais                :  id do País (idPais)
//       sEstado              :  código do Estado (CodEstado)
//       bConsidera[_tipo_]   :  True  - conta também feriados [_tipo_]
//                               False - ignora feriados [_tipo_]
//
//       -------------------------------------------------------------------------------------------
//          passar (-1) caso os parâmetros (inteiros) não sejam necessários
//          passar ('') caso os parâmetros string não sejam necessários
//       -------------------------------------------------------------------------------------------
//
//--------------------------------------------------------------------------------------------------
function TDiasInUteis.Feriado(dData: TDateTime; iCidade, iPais: integer; sEstado: string;
bConsideraBancario, bConsideraExtraordinario: boolean): boolean;
var
   qryFeriado: TwwQuery;
   sTipos: string;
begin
   qryFeriado := twwQuery.Create(Application);
   qryFeriado.DatabaseName := 'BASEDADOS';

   // define os tipos de feriados que se deseja levar em conta
   // Feriados ordinários são SEMPRE levados em conta
   // Feriados classistas NUNCA são contados (precisa de consistência com
   sTipos := '''O''';
   if bConsideraBancario then       sTipos := sTipos + ',' + '''B''';
   if bConsideraExtraordinario then sTipos := sTipos + ',' + '''E''';

   try

      with qryFeriado do begin

         Close;
         SQL.Clear;
         SQL.Text :=
         'SELECT ' + chr(13) +
         '   COUNT(IDFERIADO) AS NO_FERIADOS ' + chr(13) +
         'FROM  ' + chr(13) +
         '   FERIADOS ' + chr(13) +
         'WHERE  ' + chr(13) +
         '   ( DATAFERIADO = TO_DATE(''' + FormatDateTime('dd/mm/yyyy', dData) + ''', ''DD/MM/YYYY'') ) ' + chr(13) +
         '   AND ' + chr(13) +
         '   ( ' + chr(13) +
         '   ( IDPAIS = ' + IntToStr(iPais) + ' ) ' + chr(13) +
         '   OR ( ( IDPAIS = ' + IntToStr(iPais) + ' ) AND (CODESTADO = ''' + sEstado + ''' ) ) ' + chr(13) +
         '   OR ( IDCIDADES = ' + IntToStr(iCidade) + ' ) ' + chr(13) +
         '   ) ' + chr(13) +
         '   AND ( FLGTIPO IN (' + sTipos + ') )';

         Open;
      end;

      Result := qryFeriado.FieldByName('NO_FERIADOS').asInteger > 0;

   finally
      qryFeriado.Close;
      qryFeriado.Free;
   end;
end;



//--------------------------------------------------------------------------------------------------
//    DiaUtil: Função que retorna se um determinado dia é útil ou não
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       dData                :  data em questão
//       iCidade              :  id da Cidade (idCidades)
//       iPais                :  id do País (idPais)
//       sEstado              :  código do Estado (CodEstado)
//       bConsidera[_tipo_]   :  True  - conta também feriados [_tipo_]
//                               False - ignora feriados [_tipo_]
//       bSabadoUtil          :  True  - sábados serão considerados dias úteis
//                               False - sábados não serão considerados dias úteis
//
//       -------------------------------------------------------------------------------------------
//          passar (-1) caso os parâmetros (inteiros) não sejam necessários
//          passar ('') caso os parâmetros string não sejam necessários
//       -------------------------------------------------------------------------------------------
//
//--------------------------------------------------------------------------------------------------
function TDiasInUteis.DiaUtil(dData: TDateTime; iCidade, iPais: integer; sEstado: string;
bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): boolean;
begin
   Result := True;

   // se for domingo não é útil
   if DayOfWeek(dData) = 1 then begin
      Result := False;
   end else begin
      // se for sábado e sábado não for considerado dia útil, não é útil
      if ( (DayOfWeek(dData) = 7) and (not(bSabadoUtil)) ) then begin
         Result := False;
      end else begin
         // senão, verifica se o dia é feriado
         if Feriado(dData, iCidade, iPais, sEstado, bConsideraBancario, bConsideraExtraordinario) then Result := False;
      end;
   end;
end;



//--------------------------------------------------------------------------------------------------
//    UltDiaMes:   Função que retorna o ultimo dia de um determinado mês
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       iAno  :  ano em questão
//       iMes  :  mês em questão
//
//--------------------------------------------------------------------------------------------------
function TDiasInUteis.UltDiaMes(iAno, iMes: word): TDateTime;
var
   iDia: word;
begin
   iDia := 31;

   if iMes in [4, 6, 9, 11] then iDia := 30;
   if iMes = 2 then iDia := 28;

   // verifica se o ano é bissexto (e se o mês é fevereiro, óbvio)
   if iMes = 2 then if AnoBissexto(iAno) then iDia := 29;

   Result := EncodeDate(iAno, iMes, iDia);
end;



//--------------------------------------------------------------------------------------------------
//    UltDiaUtilMes: Função que retorna o ultimo dia útil de um determinado mês
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       iAno                 :  ano em questão
//       iMes                 :  mês em questão
//       iCidade              :  id da Cidade (idCidades)
//       iPais                :  id do País (idPais)
//       sEstado              :  código do Estado (CodEstado)
//       bConsidera[_tipo_]   :  True  - conta também feriados [_tipo_]
//                               False - ignora feriados [_tipo_]
//       bSabadoUtil          :  True  - sábados serão considerados dias úteis
//                               False - sábados não serão considerados dias úteis
//
//       -------------------------------------------------------------------------------------------
//          passar (-1) caso os parâmetros (inteiros) não sejam necessários
//          passar ('') caso os parâmetros string não sejam necessários
//       -------------------------------------------------------------------------------------------
//
//--------------------------------------------------------------------------------------------------
function TDiasInUteis.UltDiaUtilMes(iAno, iMes: word; iCidade, iPais: integer; sEstado: string;
bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): TDateTime;
var
   iDia: word;
begin
   iDia := 31;
   if iMes in [4, 6, 9, 11] then iDia := 30;
   if iMes = 2 then iDia := 28;

   // verifica se o ano é bissexto (e se o mês é fevereiro, óbvio)
   if iMes = 2 then if AnoBissexto(iAno) then iDia := 29;

   Result := EncodeDate(iAno, iMes, iDia);

   while not(DiaUtil(Result, iCidade, iPais, sEstado, bConsideraBancario, bConsideraExtraordinario, bSabadoUtil)) do Result := Result - 1;
end;



//--------------------------------------------------------------------------------------------------
//    EnesimoDiaUtilMes: Função que retorna o ene-ésimo dia útil de um determinado mês
//                       Caso não exista o ene-ésimo dia útil no mês a função retorna 0 (ZERO)
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       iAno                 :  ano em questão
//       iMes                 :  mês em questão
//       iDia                 :  ordinal do dia que se deseja saber
//       iCidade              :  id da Cidade (idCidades)
//       iPais                :  id do País (idPais)
//       sEstado              :  código do Estado (CodEstado)
//       bConsidera[_tipo_]   :  True  - conta também feriados [_tipo_]
//                               False - ignora feriados [_tipo_]
//       bSabadoUtil          :  True  - sábados serão considerados dias úteis
//                               False - sábados não serão considerados dias úteis
//
//       -------------------------------------------------------------------------------------------
//          passar (-1) caso os parâmetros (inteiros) não sejam necessários
//          passar ('') caso os parâmetros string não sejam necessários
//       -------------------------------------------------------------------------------------------
//
//--------------------------------------------------------------------------------------------------
function TDiasInUteis.EnesimoDiaUtilMes(iAno, iMes, iDia: word; iCidade, iPais: integer; sEstado: string;
bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): TDateTime;
var
   dData: TDateTime;
begin
   dData := EncodeDate(iAno, iMes, 1) - 1;

   // soma iDia dias úteis a partir do último dia do mês anterior
   Result := SomaDiasUteis(dData, iDia, iCidade, iPais, sEstado, bConsideraBancario, bConsideraExtraordinario, bSabadoUtil);

   // Erro: o ene-ésimo dia útil do mês é maior que o último dia do mês
   if not(Result <= UltDiaMes(iAno, iMes)) then Result := 0;
end;



//--------------------------------------------------------------------------------------------------
//    SomaDias:   Função que retorna a data resultante do incremento de um determindado nº de dias
//                a partir de uma data inicial
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       dDataIni    :  data em questão
//       iDias       :  total de dias que se deseja somar
//
//--------------------------------------------------------------------------------------------------
function TDiasInUteis.SomaDias(dDataIni: TDateTime; iDias: integer): TDateTime;
begin
   Result := dDataIni + iDias;
end;



//--------------------------------------------------------------------------------------------------
//    SomaMeses:  Função que retorna a data resultante do incremento de um determindado nº de meses
//                a partir de uma data inicial
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       dDataIni    :  data em questão
//       iMeses      :  total de meses que se deseja somar
//
//--------------------------------------------------------------------------------------------------
function TDiasInUteis.SomaMeses(dDataIni: TDateTime; iMeses: integer): TDateTime;
begin
   Result := IncMonth(dDataIni, iMeses);
end;



//--------------------------------------------------------------------------------------------------
//    SomaAnos:  Função que retorna a data resultante do incremento de um determindado nº de anos
//                a partir de uma data inicial
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       dDataIni    :  data em questão
//       iAnos       :  total de anos que se deseja somar
//
//--------------------------------------------------------------------------------------------------
function TDiasInUteis.SomaAnos(dDataIni: TDateTime; iAnos: integer): TDateTime;
begin
   Result := IncMonth(dDataIni, iAnos * 12);
end;



//--------------------------------------------------------------------------------------------------
//    SomaDiasUteis: Função que retorna a data resultante do incremento de um determindado nº de dias
//                   úteis a partir de uma data inicial
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       dDataIni             :  data em questão
//       iDiasUteis           :  total de dias úteis que se quer somar
//       iCidade              :  id da Cidade (idCidades)
//       iPais                :  id do País (idPais)
//       sEstado              :  código do Estado (CodEstado)
//       bConsidera[_tipo_]   :  True  - conta também feriados [_tipo_]
//                               False - ignora feriados [_tipo_]
//       bSabadoUtil          :  True  - sábados serão considerados dias úteis
//                               False - sábados não serão considerados dias úteis
//
//       -------------------------------------------------------------------------------------------
//          passar (-1) caso os parâmetros (inteiros) não sejam necessários
//          passar ('') caso os parâmetros string não sejam necessários
//       -------------------------------------------------------------------------------------------
//
//--------------------------------------------------------------------------------------------------
function TDiasInUteis.SomaDiasUteis(dDataIni: TDateTime; iDiasUteis: integer; iCidade, iPais: integer;
sEstado: string; bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): TDateTime;
var
   i: integer;
begin

   Result := dDataIni;
   i := 1;

   while i <= iDiasUteis do begin
      Result := Result + 1;
      if DiaUtil(Result, iCidade, iPais, sEstado, bConsideraBancario, bConsideraExtraordinario, bSabadoUtil) then inc(i);
   end;
end;



//--------------------------------------------------------------------------------------------------
//    PrimeiroDiaUtilPosterior:  Função que retorna o 1º dia útil posterior a uma determinada data
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       dDataIni             :  data em questão
//       iCidade              :  id da Cidade (idCidades)
//       iPais                :  id do País (idPais)
//       sEstado              :  código do Estado (CodEstado)
//       bConsidera[_tipo_]   :  True  - conta também feriados [_tipo_]
//                               False - ignora feriados [_tipo_]
//       bSabadoUtil          :  True  - sábados serão considerados dias úteis
//                               False - sábados não serão considerados dias úteis
//
//       -------------------------------------------------------------------------------------------
//          passar (-1) caso os parâmetros (inteiros) não sejam necessários
//          passar ('') caso os parâmetros string não sejam necessários
//       -------------------------------------------------------------------------------------------
//
//--------------------------------------------------------------------------------------------------
function TDiasInUteis.PrimeiroDiaUtilPosterior(dData: TDateTime; iCidade, iPais: integer; sEstado: string;
bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): TDateTime;
begin
   Result := dData + 1;

   while not(DiaUtil(Result, iCidade, iPais, sEstado, bConsideraBancario, bConsideraExtraordinario, bSabadoUtil)) do Result := Result + 1;
end;




//--------------------------------------------------------------------------------------------------
//    UltDiaUtilAnterior:  Função que retorna o último dia útil anterior a uma determinada data
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       dDataIni             :  data em questão
//       iCidade              :  id da Cidade (idCidades)
//       iPais                :  id do País (idPais)
//       sEstado              :  código do Estado (CodEstado)
//       bConsidera[_tipo_]   :  True  - conta também feriados [_tipo_]
//                               False - ignora feriados [_tipo_]
//       bSabadoUtil          :  True  - sábados serão considerados dias úteis
//                               False - sábados não serão considerados dias úteis
//
//       -------------------------------------------------------------------------------------------
//          passar (-1) caso os parâmetros (inteiros) não sejam necessários
//          passar ('') caso os parâmetros string não sejam necessários
//       -------------------------------------------------------------------------------------------
//
//--------------------------------------------------------------------------------------------------
function TDiasInUteis.UltDiaUtilAnterior(dData: TDateTime; iCidade, iPais: integer; sEstado: string;
bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): TDateTime;
begin
   Result := dData - 1;

   while not(DiaUtil(Result, iCidade, iPais, sEstado, bConsideraBancario, bConsideraExtraordinario, bSabadoUtil)) do Result := Result - 1;
end;



//--------------------------------------------------------------------------------------------------
//    MesesEntre: Função que retorna a quantidade de meses (inteiros) entre os meses definidos por 2 datas
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       dDataIni :  data inicial do período que se deseja pesquisar
//       dDataFim :  data final do período que se deseja pesquisar
//
//--------------------------------------------------------------------------------------------------
function TDiasInUteis.MesesEntre(dDataIni, dDataFim: TDateTime): integer;
var
   iMesIni, iMesFim  : word;
   iAnoIni, iAnoFim  : word;
   iMeses            : integer;
   dPrimeiroDiaIni   : TDateTime;
   dPrimeiroDiaFim   : TDateTime;
begin
   iMesIni  := ExtraiMes(dDataIni);
   iAnoIni  := ExtraiAno(dDataIni);

   iMesFim  := ExtraiMes(dDataFim);
   iAnoFim  := ExtraiAno(dDataFim);

   Result := -1;
   if dDataFim >= dDataIni then begin

      // 1º) Verifica se as datas estão no mesmo mês
      if ( iAnoFim = iAnoIni ) and ( iMesFim = iMesIni ) then begin

         iMeses := 0;

      end else begin

         // 2º) Soma meses até que as datas coincidam
         dPrimeiroDiaIni   := EncodeDate(iAnoIni, iMesIni, 1);
         dPrimeiroDiaFim   := EncodeDate(iAnoFim, iMesFim, 1);

         iMeses := 1;
         while not(SomaMeses(dPrimeiroDiaIni, iMeses) = dPrimeiroDiaFim) do iMeses := iMeses + 1;
         iMeses := iMeses - 1;

      end;

      Result := iMeses;
   end;
end;



//--------------------------------------------------------------------------------------------------
//    IntervaloMeses: Função que retorna o intervalo de meses entre 2 determindadas datas
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       dDataIni :  data inicial do período que se deseja pesquisar
//       dDataFim :  data final do período que se deseja pesquisar
//
//--------------------------------------------------------------------------------------------------
function TDiasInUteis.IntervaloMeses(dDataIni, dDataFim: TDateTime): integer;
var
   iMesIni, iAnoIni  : word;
   iMesFim, iAnoFim  : word;
   iMeses            : integer;
begin
   iMesIni  := ExtraiMes(dDataIni);
   iAnoIni  := ExtraiAno(dDataIni);

   iMesFim  := ExtraiMes(dDataFim);
   iAnoFim  := ExtraiAno(dDataFim);

   Result := -1;
   if dDataFim >= dDataIni then begin

      // 1º) Verifica se as datas estão no mesmo mês
      if ( iAnoFim = iAnoIni ) and ( iMesFim = iMesIni ) then begin

         iMeses := 0;

      end else begin

         // 2º) Soma meses até que as datas coincidam
         iMeses := 1;
         while ( SomaMeses(dDataIni, iMeses) < dDataFim ) do inc(iMeses);
         if ( SomaMeses(dDataIni, iMeses) > dDataFim ) then dec(iMeses);

      end;

      Result := iMeses;
   end;
end;



//--------------------------------------------------------------------------------------------------
//    IntervaloDias: Função que retorna o intervalo de dias entre 2 determindadas datas
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       dDataIni :  data inicial do período que se deseja pesquisar
//       dDataFim :  data final do período que se deseja pesquisar
//
//--------------------------------------------------------------------------------------------------
function TDiasInUteis.IntervaloDias(dDataIni, dDataFim: TDateTime): integer;
begin
   Result := -1;

   if dDataFim >= dDataIni then Result := trunc(dDataFim) - trunc(dDataIni);
end;




//--------------------------------------------------------------------------------------------------
//    IntervaloDiasUteis: Função que retorna o intervalo de dias úteis entre 2 determindadas datas
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       dDataIni             :  data inicial do período que se deseja pesquisar
//       dDataFim             :  data final do período que se deseja pesquisar
//       iCidade              :  id da Cidade (idCidades)
//       iPais                :  id do País (idPais)
//       sEstado              :  código do Estado (CodEstado)
//       bConsidera[_tipo_]   :  True  - conta também feriados [_tipo_]
//                               False - ignora feriados [_tipo_]
//       bSabadoUtil          :  True  - sábados serão considerados dias úteis
//                               False - sábados não serão considerados dias úteis
//
//       -------------------------------------------------------------------------------------------
//          passar (-1) caso os parâmetros (inteiros) não sejam necessários
//          passar ('') caso os parâmetros string não sejam necessários
//       -------------------------------------------------------------------------------------------
//
//--------------------------------------------------------------------------------------------------
function TDiasInUteis.IntervaloDiasUteis(dDataIni, dDataFim: TDateTime; iCidade, iPais: integer;
sEstado: string; bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): integer;
var
   iDiasNaoUteis: integer;
begin
   Result := -1;

   if dDataFim >= dDataIni then begin
      Result := IntervaloDias(dDataIni, dDataFim);
      iDiasNaoUteis := ContaDiasNaoUteis(dDataIni, dDataFim, iCidade, iPais, sEstado, bConsideraBancario, bConsideraExtraordinario, bSabadoUtil);
      Result := Result - iDiasNaoUteis;
   end;
end;



//--------------------------------------------------------------------------------------------------
//    DiasUteisMes:  Função que retorna o nº de dias úteis em um mês
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       iAno                 :  ano em questão
//       iMes                 :  mês em questão
//       iCidade              :  id da Cidade (idCidades)
//       iPais                :  id do País (idPais)
//       sEstado              :  código do Estado (CodEstado)
//       bConsidera[_tipo_]   :  True  - conta também feriados [_tipo_]
//                               False - ignora feriados [_tipo_]
//       bSabadoUtil          :  True  - sábados serão considerados dias úteis
//                               False - sábados não serão considerados dias úteis
//
//       -------------------------------------------------------------------------------------------
//          passar (-1) caso os parâmetros (inteiros) não sejam necessários
//          passar ('') caso os parâmetros string não sejam necessários
//       -------------------------------------------------------------------------------------------
//
//--------------------------------------------------------------------------------------------------
function TDiasInUteis.DiasUteisMes(iAno, iMes: word; iCidade, iPais: integer; sEstado: string;
bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): word;
var
   dDataIni, dDataFim: TDateTime;
begin
   dDataIni := EncodeDate(iAno, iMes, 1) - 1;
   dDataFim := UltDiaMes(iAno, iMes);

   Result := IntervaloDias(dDataIni, dDataFim);
   Result := Result - ContaDiasNaoUteis(dDataIni, dDataFim, iCidade, iPais, sEstado, bConsideraBancario,
                                       bConsideraExtraordinario, bSabadoUtil);
end;



end.
