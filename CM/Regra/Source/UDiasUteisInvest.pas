unit UDiasUteisInvest;
//------------------------------------------------------------------------------
// Autor(a)    :  Higor Nayde Ferreira 
// Data        :  15/07/2013
// Pendência   :  SOL 199535 KTN 1920413 INICIO
// Descricao   :  A query que verifica feriado da fórmula DIFDIAS está 
// considerando feriados municipais ou estaduais em outras cidades e estado
//------------------------------------------------------------------------------

interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db,
  Wwquery;

type
   TDiasUteisInvest = Class(TObject)
   private

   public

      // -------------------------------------------------------------------------------------------------
      //    Funções que devam retornar um valor inteiro terão resultado (-1) em caso de erro
      //    (quando DataFim < DataIni, p.ex.)
      // -------------------------------------------------------------------------------------------------

      // Função que retorna se um determinado ano é bissexto ou não
      function AnoBissexto(iAno: word): boolean;

      // Função que retorna o Dia de uma determinada data
      function ExtraiDia(dData: tDateTime): word;

      // Função que retorna o Mês de uma determinada data
      function ExtraiMes(dData: tDateTime): word;

      // Função que retorna o Ano de uma determinada data
      function ExtraiAno(dData: tDateTime): word;

      // Função que retorna o total de feriados em um determinado período
      function ContaFeriados(dDataIni, dDataFim: TDateTime; iCidade, iPais: longint; sEstado: string;
      bConsideraBancario, bConsideraExtraordinario: boolean): longint;

      // Função que retorna o total de domingos em um determinado período
      function ContaDomingos(dDataIni, dDataFim: TDateTime): longint;

      // Função que retorna o total de sábados em um determinado período
      function ContaSabados(dDataIni, dDataFim: TDateTime): longint;

      // Função que retorna o total de dias não úteis (feriados + sábados/domingos) em um determinado período
      function ContaDiasNaoUteis(dDataIni, dDataFim: TDateTime; iCidade, iPais: longint;
      sEstado: string; bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): longint;

      // Função que retorna se um determinado dia é feriado ou não
      function Feriado(dData: TDateTime; iCidade, iPais: longint; sEstado: string;
                       bConsideraBancario, bConsideraExtraordinario: boolean): boolean;

      // Função que retorna se um determinado dia é útil ou não
      function DiaUtil(dData: TDateTime; iCidade, iPais: longint; sEstado: string; bConsideraBancario,
      bConsideraExtraordinario, bSabadoUtil: boolean): boolean;

      // Função que retorna o ultimo dia de um determinado mês
      function UltDiaMes(iAno, iMes: word): TDateTime;

      // Função que retorna o ultimo dia útil de um determinado mês
      function UltDiaUtilMes(iAno, iMes: word; iCidade, iPais: longint; sEstado: string;
      bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): TDateTime;

      // Função que retorna o ene-ésimo dia útil de um determinado mês
      function EnesimoDiaUtilMes(iAno, iMes, iDia: word; iCidade, iPais: longint; sEstado: string;
      bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): TDateTime;

      // Função que retorna a data resultante do incremento de um determindado nº de dias a partir
      // de uma data inicial
      function SomaDias(dDataIni: TDateTime; iDias: longint): TDateTime;

      // Função que retorna a data resultante do incremento de um determindado nº de meses a partir
      // de uma data inicial
      function SomaMeses(dDataIni: TDateTime; iMeses: longint): TDateTime;

      // Função que retorna a data resultante do incremento de um determindado nº de anos a partir
      // de uma data inicial
      function SomaAnos(dDataIni: TDateTime; iAnos: longint): TDateTime;

      // Função que retorna a data resultante do incremento de um determindado nº de dias úteis
      // a partir de uma data inicial
      function SomaDiasUteis(dDataIni: TDateTime; iDiasUteis: longint; iCidade, iPais: longint;
      sEstado: string; bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): TDateTime;

      // Função que retorna o 1º dia útil posterior a uma determinada data
      function PrimeiroDiaUtilPosterior(dData: TDateTime; iCidade, iPais: longint; sEstado: string;
      bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): TDateTime;

      // Função que retorna o último dia útil anterior a uma determinada data
      function UltDiaUtilAnterior(dData: TDateTime; iCidade, iPais: longint; sEstado: string;
      bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): TDateTime;

      // Função que retorna a quantidade de meses (inteiros) entre os meses definidos por 2 datas
      function MesesEntre(dDataIni, dDataFim: TDateTime): longint;

      // Função que retorna o intervalo de meses entre 2 determindadas datas
      function IntervaloMeses(dDataIni, dDataFim: TDateTime): longint;

      // Função que retorna o intervalo de dias entre 2 determindadas datas
      function IntervaloDias(dDataIni, dDataFim: TDateTime): longint;

      // Função que retorna o intervalo de dias úteis entre 2 determindadas datas
      function IntervaloDiasUteis(dDataIni, dDataFim: TDateTime; iCidade, iPais: longint;
      sEstado: string; bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): longint;

      // Função que retorna o nº de dias úteis em um mês
      function DiasUteisMes(iAno, iMes: word; iCidade, iPais: longint; sEstado: string;
      bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): word;

      // Set o Tipo de Investimento utilizado ( Augusto 21/08/2002 )
      Procedure SetaTipoInvest ( IdTipoInvest : Integer );

   end;

var
  DiasUteisInvest : TDiasUteisInvest;
  iTipoInvest  : Integer;

implementation

//--------------------------------------------------------------------------------------------------
//    AnoBissexto:   Função que retorna se um determinado ano é bissexto ou não
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       iAno  :  ano em questão
//
//--------------------------------------------------------------------------------------------------
function TDiasUteisInvest.AnoBissexto(iAno: word): boolean;
begin
   Result := False;
   // Ano bissexto:
   //    é múltiplo de 4
   if iAno mod 4 = 0 then begin
      // porém, se for múltiplo de 100,
      if iAno mod 100 = 0 then begin
         // deve ser também múltiplo de 400
         if iAno mod 400 = 0 then Result := True;
      end else begin
         Result := True;
      end;
   end;
end;

//--------------------------------------------------------------------------------------------------
//    ExtraiDia: Função que retorna o Dia de uma determinada data
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       dData    :  data cujo dia se deseja saber
//--------------------------------------------------------------------------------------------------
function TDiasUteisInvest.ExtraiDia(dData: tDateTime): word;
var
   iAno, iMes, iDia: word;
begin
   DecodeDate(dData, iAno, iMes, iDia);
   Result := iDia;
end;

//--------------------------------------------------------------------------------------------------
//    ExtraiDia: Função que retorna o Dia de uma determinada data
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       dData    :  data cujo dia se deseja saber
//--------------------------------------------------------------------------------------------------
function TDiasUteisInvest.ExtraiMes(dData: tDateTime): word;
var
   iAno, iMes, iDia: word;
begin
   DecodeDate(dData, iAno, iMes, iDia);
   Result := iMes;
end;

//--------------------------------------------------------------------------------------------------
//    ExtraiDia: Função que retorna o Dia de uma determinada data
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       dData    :  data cujo dia se deseja saber
//--------------------------------------------------------------------------------------------------
function TDiasUteisInvest.ExtraiAno(dData: tDateTime): word;
var
   iAno, iMes, iDia: word;
begin
   DecodeDate(dData, iAno, iMes, iDia);
   Result := iAno;
end;

//--------------------------------------------------------------------------------------------------
//    ContaFeriados: Função que retorna o total de feriados em um determinado período
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       dDataIni             :  data inicial do período que se deseja pesquisar
//       dDataFim             :  data final do período que se deseja pesquisar
//       iCidade              :  id da Cidade (idCidades)
//       iPais                :  id do País (idPais)
//       sEstado              :  código do Estado (CodEstado)
//       bConsidera[_tipo_]   :  True  - conta também feriados [_tipo_]
//                               False - ignora feriados [_tipo_]
//       -------------------------------------------------------------------------------------------
//          passar (-1) caso os parâmetros inteiros não sejam necessários
//          passar ('') caso os parâmetros string não sejam necessários
//--------------------------------------------------------------------------------------------------
function TDiasUteisInvest.ContaFeriados(dDataIni, dDataFim: TDateTime; iCidade, iPais: longint; sEstado: string;
bConsideraBancario, bConsideraExtraordinario: boolean): longint;
var
   qryFeriado: TwwQuery;
   sTipos: string;
   iFeriados : integer;
begin
   Result := 0;
   iFeriados := 0;
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
         with qryFeriado do
         begin
            Close;
            SQL.Clear;
            SQL.Text :=
            'SELECT ' +
            '   DISTINCT(DATAFERIADO) ' +
            'FROM  ' +
            '   FERIADOS ' +
            'WHERE  ' +
            '   ( DATAFERIADO BETWEEN :DATAINI AND :DATAFIM ) ' +
            '   AND ' +
            '   ( ' +  //Higor Nayde Ferreira  SOL 199535 KTN 1920413 INICIO
            '   ( IDPAIS = ' + IntToStr(iPais) +  ' AND FLGAMBITO = ''F'' ) OR ' +
            '   ( ( IDPAIS = ' + IntToStr(iPais) +  ' ) AND (CODESTADO = ''' + sEstado + ''' ) AND (FLGAMBITO = ''E'')  ) OR ' +
            '   ( IDCIDADES = ' + IntToStr(iCidade) +  '  AND FLGAMBITO = ''M'' ) ' +
            '   ) ' +  //Higor Nayde Ferreira  SOL 199535 KTN 1920413 FIM
            '   AND ' +
            '   ( FLGTIPO IN (' + sTipos + ') ) AND (DATAFERIADO NOT IN '+
            '   ( SELECT DATAFERIADO FROM CM.FERIADOINVEST WHERE FLGFERIADO=''N''))';
            ParamByName('DATAINI').DataType     := ftDateTime;
            ParamByName('DATAFIM').DataType     := ftDateTime;
            Prepare;
            ParamByName('DATAINI').asDateTime   := dDataIni;
            ParamByName('DATAFIM').asDateTime   := dDataFim;
            Open;
            if not IsEmpty then
            begin
               First;
               while not EOF do
               begin
                  if (DayOfWeek(qryFeriado.FieldByName('DATAFERIADO').AsDateTime) <> 1) and    // Domingo
                     (DayOfWeek(qryFeriado.FieldByName('DATAFERIADO').AsDateTime) <> 7) then   // Sabado
                     iFeriados := iFeriados + 1;
                  Next;
         end;
               Result := iFeriados;
            end;
         end;
         //Result := qryFeriado.RecordCount;
      finally
         qryFeriado.Close;
         qryFeriado.Free;
      end;
   end;
end;

//--------------------------------------------------------------------------------------------------
//    ContaDomingos: Função que retorna o total de domingos em um determinado período
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       dDataIni :  data inicial do período que se deseja pesquisar
//       dDataFim :  data final do período que se deseja pesquisar
//
//--------------------------------------------------------------------------------------------------
function TDiasUteisInvest.ContaDomingos(dDataIni, dDataFim: TDateTime): longint;
begin
   Result := -1;
   if dDataFim >= dDataIni then begin
      Result := 0;
      while dDataFim > (dDataIni - 1) do begin
         if DayOfWeek(dDataFim) = 1 then inc(Result);
         dDataFim := dDataFim - 1;
      end;
   end;
end;

//--------------------------------------------------------------------------------------------------
//    ContaSabados: Função que retorna o total de sábados em um determinado período
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       dDataIni :  data inicial do período que se deseja pesquisar
//       dDataFim :  data final do período que se deseja pesquisar
//--------------------------------------------------------------------------------------------------
function TDiasUteisInvest.ContaSabados(dDataIni, dDataFim: TDateTime): longint;
begin
   Result := -1;
   if dDataFim >= dDataIni then begin
      Result := 0;
      while dDataFim >= dDataIni do begin
         if DayOfWeek(dDataFim) = 7 then
            inc(Result);
         dDataFim := dDataFim - 1;
      end;
   end;
end;

//--------------------------------------------------------------------------------------------------
//    ContaDiasNaoUteis:   Função que retorna o total de dias não úteis (feriados + sábados/domingos)
//                         em um determinado período
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
//       -------------------------------------------------------------------------------------------
//          passar (-1) caso os parâmetros (inteiros) não sejam necessários
//          passar ('') caso os parâmetros string não sejam necessários
//--------------------------------------------------------------------------------------------------
function TDiasUteisInvest.ContaDiasNaoUteis(dDataIni, dDataFim: TDateTime; iCidade, iPais: longint;
sEstado: string; bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): longint;
var
   iSabados,iDomingos : integer;
begin
   Result := -1;
   if dDataFim >= dDataIni then
   begin
      Result := 0;
      Result := Result + ContaFeriados(dDataIni, dDataFim, iCidade, iPais, sEstado,
                                       bConsideraBancario, bConsideraExtraordinario);
      iDomingos := ContaDomingos(dDataIni, dDataFim);
      Result := Result + iDomingos;
      if not(bSabadoUtil) then
      begin
         iSabados := ContaSabados(dDataIni, dDataFim);
         Result := Result + iSabados;
      end;
   end;
end;

// Considerar feriados ordinários
// despreza os extraordinários
// criar tabela de feriado investimento
function TDiasUteisInvest.Feriado(dData: TDateTime; iCidade, iPais: longint; sEstado: string;
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
         'SELECT SUM(NO_FERIADOS) AS NO_FERIADOS  FROM ( ' +
         'SELECT COUNT(IDFERIADO) AS NO_FERIADOS ' +
         'FROM  FERIADOS WHERE ( DATAFERIADO = :DATA) AND ' +
         '   ( ( IDPAIS = ' + IntToStr(iPais) + {:PAIS1} ' ) OR ' +
         '   ( ( IDPAIS = ' + IntToStr(iPais) + {:PAIS2} ' ) AND (CODESTADO = ''' + sEstado + {:ESTADO} ''' ) ) OR ' +
         '   ( IDCIDADES = ' + IntToStr(iCidade) + {:CIDADE} ' ) ) AND ' +
         '   ( FLGTIPO IN (' + sTipos + ') ) AND (DATAFERIADO NOT IN '+
         '   ( SELECT DATAFERIADO FROM CM.FERIADOINVEST WHERE FLGFERIADO=''N'')) '+
         'UNION  SELECT COUNT(IDFERIADOINVEST) AS NO_FERIADOS ' +
         'FROM FERIADOINVEST WHERE ( DATAFERIADO = :DATA )  AND ( IDTIPOINVEST =:IDTIPOINVEST)  AND '+
         '   ( FLGFERIADO=''S''))   ';
         ParamByName('DATA').DataType     := ftDateTime;
         Prepare;
         ParamByName('DATA').asDateTime   := dData;
         ParamByName('IDTIPOINVEST').asInteger := iTipoInvest;
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
//    Parâmetros:
//       dData                :  data em questão
//       iCidade              :  id da Cidade (idCidades)
//       iPais                :  id do País (idPais)
//       sEstado              :  código do Estado (CodEstado)
//       bConsidera[_tipo_]   :  True  - conta também feriados [_tipo_]
//                               False - ignora feriados [_tipo_]
//       bSabadoUtil          :  True  - sábados serão considerados dias úteis
//                               False - sábados não serão considerados dias úteis
//       -------------------------------------------------------------------------------------------
//          passar (-1) caso os parâmetros (inteiros) não sejam necessários
//          passar ('') caso os parâmetros string não sejam necessários
//--------------------------------------------------------------------------------------------------
function TDiasUteisInvest.DiaUtil(dData: TDateTime; iCidade, iPais: longint; sEstado: string;
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
//    Parâmetros:
//       iAno  :  ano em questão
//       iMes  :  mês em questão
//--------------------------------------------------------------------------------------------------
function TDiasUteisInvest.UltDiaMes(iAno, iMes: word): TDateTime;
var
   iDia: word;
begin
   iDia := 31;
   if iMes in [4, 6, 9, 11] then iDia := 30;
   if iMes = 2 then iDia := 28;
   // verifica se o ano é bissexto
   if iMes = 2 then if AnoBissexto(iAno) then iDia := 29;
   Result := EncodeDate(iAno, iMes, iDia);
end;

//--------------------------------------------------------------------------------------------------
//    UltDiaUtilMes: Função que retorna o ultimo dia útil de um determinado mês
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
//       -------------------------------------------------------------------------------------------
//          passar (-1) caso os parâmetros (inteiros) não sejam necessários
//          passar ('') caso os parâmetros string não sejam necessários
//--------------------------------------------------------------------------------------------------
function TDiasUteisInvest.UltDiaUtilMes(iAno, iMes: word; iCidade, iPais: longint; sEstado: string;
bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): TDateTime;
var
   iDia: word;
begin
   iDia := 31;
   if iMes in [4, 6, 9, 11] then iDia := 30;
   if iMes = 2 then iDia := 28;
   // verifica se o ano é bissexto
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
//       -------------------------------------------------------------------------------------------
//          passar (-1) caso os parâmetros (inteiros) não sejam necessários
//          passar ('') caso os parâmetros string não sejam necessários
//--------------------------------------------------------------------------------------------------
function TDiasUteisInvest.EnesimoDiaUtilMes(iAno, iMes, iDia: word; iCidade, iPais: longint; sEstado: string;
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
//    Parâmetros:
//       dDataIni    :  data em questão
//       iDias       :  total de dias que se deseja somar
//--------------------------------------------------------------------------------------------------
function TDiasUteisInvest.SomaDias(dDataIni: TDateTime; iDias: longint): TDateTime;
begin
   Result := dDataIni + iDias;
end;

//--------------------------------------------------------------------------------------------------
//    SomaMeses:  Função que retorna a data resultante do incremento de um determindado nº de meses
//                a partir de uma data inicial
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       dDataIni    :  data em questão
//       iMeses      :  total de meses que se deseja somar
//--------------------------------------------------------------------------------------------------
function TDiasUteisInvest.SomaMeses(dDataIni: TDateTime; iMeses: longint): TDateTime;
var
   iDiaIni, iMesIni, iMesFim, iAnoIni, iAnoFim : word;
   bDataValida : boolean;
begin
   iDiaIni  := ExtraiDia(dDataIni);
   iMesIni  := ExtraiMes(dDataIni);
   iAnoIni  := ExtraiAno(dDataIni);
   // calcula quantos Anos inteiros há no período em meses e já calcula o ano resultante
   iAnoFim  := iAnoIni + iMeses div 12;
   // calcula o "saldo" em meses (entre 0 e 12)
   iMeses   := iMeses mod 12;
   // soma o "saldo"
   if iMesIni + iMeses > 12 then begin
      iAnoFim := iAnoFim + 1;
      iMesFim := iMesIni + iMeses - 12;
   end else begin
      if iMesIni + iMeses <= 0 then begin
         iAnoFim := iAnoFim - 1;
         iMesFim := 12 + (iMesIni + iMeses); { (12 -) Turon - 05/02/2003 }
      end else begin
         iMesFim := iMesIni + iMeses;
      end;
   end;
   Result := 0;
   Repeat
      try
         Result      := EncodeDate(iAnoFim, iMesFim, iDiaIni);
         bDataValida := True;
      except
         Dec(iDiaIni);
         bDataValida := False;
      end;
   until bDataValida;
end;

//--------------------------------------------------------------------------------------------------
//    SomaAnos:  Função que retorna a data resultante do incremento de um determindado nº de anos
//                a partir de uma data inicial
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       dDataIni    :  data em questão
//       iAnos       :  total de anos que se deseja somar
//--------------------------------------------------------------------------------------------------
function TDiasUteisInvest.SomaAnos(dDataIni: TDateTime; iAnos: longint): TDateTime;
var
   iDiaIni, iMesIni, iAnoIni, iAnoFim : word;
   bDataValida : boolean;
begin
   iDiaIni  := ExtraiDia(dDataIni);
   iMesIni  := ExtraiMes(dDataIni);
   iAnoIni  := ExtraiAno(dDataIni);

   iAnoFim  := iAnoIni + iAnos;

   Result := 0;
   Repeat
      try
         Result      := EncodeDate(iAnoFim, iMesIni, iDiaIni);
         bDataValida := True;
      except
         Dec(iDiaIni);
         bDataValida := False;
      end;
   until bDataValida;
end;

//--------------------------------------------------------------------------------------------------
//    SomaDiasUteis: Função que retorna a data resultante do incremento de um determindado nº de dias
//                   úteis a partir de uma data inicial
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
//       -------------------------------------------------------------------------------------------
//          passar (-1) caso os parâmetros (inteiros) não sejam necessários
//          passar ('') caso os parâmetros string não sejam necessários
//--------------------------------------------------------------------------------------------------
function TDiasUteisInvest.SomaDiasUteis(dDataIni: TDateTime; iDiasUteis: longint; iCidade, iPais: longint;
sEstado: string; bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): TDateTime;
var
   i: longint;
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
//    Parâmetros:
//       dDataIni             :  data em questão
//       iCidade              :  id da Cidade (idCidades)
//       iPais                :  id do País (idPais)
//       sEstado              :  código do Estado (CodEstado)
//       bConsidera[_tipo_]   :  True  - conta também feriados [_tipo_]
//                               False - ignora feriados [_tipo_]
//       bSabadoUtil          :  True  - sábados serão considerados dias úteis
//                               False - sábados não serão considerados dias úteis
//       -------------------------------------------------------------------------------------------
//          passar (-1) caso os parâmetros (inteiros) não sejam necessários
//          passar ('') caso os parâmetros string não sejam necessários
//--------------------------------------------------------------------------------------------------
function TDiasUteisInvest.PrimeiroDiaUtilPosterior(dData: TDateTime; iCidade, iPais: longint; sEstado: string;
bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): TDateTime;
begin
   Result := dData + 1;

   while not(DiaUtil(Result, iCidade, iPais, sEstado, bConsideraBancario, bConsideraExtraordinario, bSabadoUtil)) do Result := Result + 1;
end;

//--------------------------------------------------------------------------------------------------
//    UltDiaUtilAnterior:  Função que retorna o último dia útil anterior a uma determinada data
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
//--------------------------------------------------------------------------------------------------
function TDiasUteisInvest.UltDiaUtilAnterior(dData: TDateTime; iCidade, iPais: longint; sEstado: string;
bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): TDateTime;
begin
   Result := dData - 1;

   while not(DiaUtil(Result, iCidade, iPais, sEstado, bConsideraBancario, bConsideraExtraordinario, bSabadoUtil)) do Result := Result - 1;
end;

//--------------------------------------------------------------------------------------------------
//    MesesEntre: Função que retorna a quantidade de meses (inteiros) entre os meses definidos por 2 datas
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       dDataIni :  data inicial do período que se deseja pesquisar
//       dDataFim :  data final do período que se deseja pesquisar
//--------------------------------------------------------------------------------------------------
function TDiasUteisInvest.MesesEntre(dDataIni, dDataFim: TDateTime): longint;
var
   iMesIni, iMesFim  : word;
   iAnoIni, iAnoFim  : word;
   iMeses            : longint;
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
//    Parâmetros:
//       dDataIni :  data inicial do período que se deseja pesquisar
//       dDataFim :  data final do período que se deseja pesquisar
//
//--------------------------------------------------------------------------------------------------
function TDiasUteisInvest.IntervaloMeses(dDataIni, dDataFim: TDateTime): longint;
var
   iMesIni, iAnoIni  : word;
   iMesFim, iAnoFim  : word;
   iMeses            : longint;
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
//    Parâmetros:
//       dDataIni :  data inicial do período que se deseja pesquisar
//       dDataFim :  data final do período que se deseja pesquisar
//--------------------------------------------------------------------------------------------------
function TDiasUteisInvest.IntervaloDias(dDataIni, dDataFim: TDateTime): longint;
begin
   Result := -1;

   if dDataFim >= dDataIni then Result := trunc(dDataFim) - trunc(dDataIni);
end;

//--------------------------------------------------------------------------------------------------
//    IntervaloDiasUteis: Função que retorna o intervalo de dias úteis entre 2 determindadas datas
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
//       -------------------------------------------------------------------------------------------
//          passar (-1) caso os parâmetros (inteiros) não sejam necessários
//          passar ('') caso os parâmetros string não sejam necessários
//       -------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
function TDiasUteisInvest.IntervaloDiasUteis(dDataIni, dDataFim: TDateTime; iCidade, iPais: longint;
sEstado: string; bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): longint;
var
   iDiasNaoUteis: longint;
begin
   Result := 0;
   dDataIni := dDataIni + 1;
   while not DiaUtil(dDataFim, iCidade, iPais, sEstado, bConsideraBancario, bConsideraExtraordinario, bSabadoUtil) do
         dDataFim := dDataFim + 1;

   while dDataIni <= dDataFim do
   begin
      if DiaUtil(dDataIni, iCidade, iPais, sEstado, bConsideraBancario, bConsideraExtraordinario, bSabadoUtil) then
         Result := Result + 1;
         dDataIni := dDataIni + 1;
   end;
end;

//--------------------------------------------------------------------------------------------------
//    DiasUteisMes:  Função que retorna o nº de dias úteis em um mês
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
//       -------------------------------------------------------------------------------------------
//          passar (-1) caso os parâmetros (inteiros) não sejam necessários
//          passar ('') caso os parâmetros string não sejam necessários
//--------------------------------------------------------------------------------------------------
function TDiasUteisInvest.DiasUteisMes(iAno, iMes: word; iCidade, iPais: longint; sEstado: string;
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

procedure TDiasUteisInvest.SetaTipoInvest(IdTipoInvest: Integer);
begin
  iTipoInvest := IdTipoInvest;
end;

end.