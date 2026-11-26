{*******************************************************}
{                                                       }
{ Padrões de Desenvolvimento                            }
{ Copyright © 1998,2002 - CM Soluções Informática       }
{                                                       }
{ - Atualização para o padrão MT (3 Camadas)            }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 10/04/2002                             }
{                                                       }
{*******************************************************}
unit UDiasUteis;

//	-------------------------------------------------------------------------------------------------
//
//       Twice and twice shall he be marked
//       Once the Heron to set his path
//       Twice the Heron for rememberance lost
//       Once the Dragon to name him true
//       Twice the Dragon for the price he must pay
//
//                               The Karatheon Cicle
//
//	-------------------------------------------------------------------------------------------------
//	-------------------------------------------------------------------------------------------------
//
//	UDiasUteis
//------------------------------------------------------------------------------
// Autor(a)    :  Higor Nayde Ferreira 
// Data        :  15/07/2013
// Pendência   :  SOL 199535 KTN 1920413 INICIO
// Descricao   :  A query que verifica feriado da fórmula DIFDIAS está 
// considerando feriados municipais ou estaduais em outras cidades e estado
//------------------------------------------------------------------------------
//
//	Autor :  André Pontes
//
//	Modificações: 17/07/1999  1) DataFim passa a ser obrigatoriamente maior que DataIni
//                    10/09/1999  2) 3 novas funções: ExtraiDia, ExtraiMes, ExtraiAno
//                    13/09/1999  3) 2 novas funções: SomaMeses e SomaAnos
//                    25/11/1999  4) Correção de SomaMeses e SomaAnos: teste do dia
//                    07/12/1999  5) Nova função: IntervaloMeses
//                                6) Troca dos parâmetros e retornos de smallint p/ integer
//                    08/12/1999  7) Correção da função IntervaloMeses (entrava em loop quando tentava
//                                   somar meses e o mes resultante deveria ser o seguinte)
//                    22/12/1999  8) Nova função IntervaloMeses (a anterior passa a se chamar MesesEntre)
//
//	Autor :  Augusto
//      Modificações: 01/02/2004  1) Acerto da formula IntervaloDiasUteis para não retornar negativo
//
//
//
// -------------------------------------------------------------------------------------------------

interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db,
  DbClient, uCMTypes, uCmControlObject;


type
   TDiasUteis = class(TCmControlObject)
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
      function ContaFeriados(dDataIni, dDataFim: TDateTime; iCidade, iPais: integer; sEstado: string;
      bConsideraBancario, bConsideraExtraordinario: boolean): integer; Overload;
      function ContaFeriados(idEmpresa: LongInt; dDataIni, dDataFim: TDateTime;
      bConsideraBancario, bConsideraExtraordinario: boolean): integer; Overload;

      // Função que retorna o total de domingos em um determinado período
      function ContaDomingos(dDataIni, dDataFim: TDateTime; iCidade, iPais: integer; sEstado: string;
      bConsideraBancario, bConsideraExtraordinario, bIgnoraFeriados: boolean): integer; Overload;
      function ContaDomingos(idEmpresa: LongInt; dDataIni, dDataFim: TDateTime;
      bConsideraBancario, bConsideraExtraordinario, bIgnoraFeriados: boolean): integer; Overload;

      // Função que retorna o total de sábados em um determinado período
      function ContaSabados(dDataIni, dDataFim: TDateTime; iCidade, iPais: integer; sEstado: string;
      bConsideraBancario, bConsideraExtraordinario, bIgnoraFeriados: boolean): integer; Overload;
      function ContaSabados(idEmpresa: LongInt; dDataIni, dDataFim: TDateTime;
      bConsideraBancario, bConsideraExtraordinario, bIgnoraFeriados: boolean): integer; Overload;

      // Função que retorna o total de dias não úteis (feriados + sábados/domingos) em um determinado período
      function ContaDiasNaoUteis(dDataIni, dDataFim: TDateTime; iCidade, iPais: integer;
      sEstado: string; bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): integer; Overload;
      function ContaDiasNaoUteis(idEmpresa: LongInt; dDataIni, dDataFim: TDateTime;
      bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): integer; Overload;


      // Função que retorna se um determinado dia é feriado ou não
      function Feriado(dData: TDateTime; iCidade, iPais: integer; sEstado: string; bConsideraBancario,
      bConsideraExtraordinario: boolean; TipoFeriado: TTipoFeriado = tfTodos): boolean; Overload;
      function Feriado(idEmpresa: LongInt; dData: TDateTime; bConsideraBancario,
      bConsideraExtraordinario: boolean; TipoFeriado: TTipoFeriado = tfTodos): boolean; Overload;

      // Função que retorna se um determinado dia é útil ou não
      function DiaUtil(dData: TDateTime; iCidade, iPais: integer; sEstado: string; bConsideraBancario,
      bConsideraExtraordinario, bSabadoUtil: boolean): boolean; Overload;
      function DiaUtil(idEmpresa: LongInt; dData: TDateTime; bConsideraBancario,
      bConsideraExtraordinario, bSabadoUtil: boolean): boolean; Overload;

      // Função que retorna o ultimo dia de um determinado mês
      function UltDiaMes(iAno, iMes: word): TDateTime;

      // Função que retorna o ultimo dia útil de um determinado mês
      function UltDiaUtilMes(iAno, iMes: word; iCidade, iPais: integer; sEstado: string;
      bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): TDateTime; Overload;
      function UltDiaUtilMes(idEmpresa: LongInt; iAno, iMes: word;
      bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): TDateTime; Overload;

      // Função que retorna o ene-ésimo dia útil de um determinado mês
      function EnesimoDiaUtilMes(iAno, iMes, iDia: word; iCidade, iPais: integer; sEstado: string;
      bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): TDateTime; Overload;
      function EnesimoDiaUtilMes(idEmpresa: LongInt; iAno, iMes, iDia: word;
      bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): TDateTime; Overload;

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
      function SomaDiasUteis(dDataIni: TDateTime; iDiasUteis: integer; iCidade, iPais: integer; sEstado: string;
      bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): TDateTime; Overload;
      function SomaDiasUteis(idEmpresa: LongInt; dDataIni: TDateTime; iDiasUteis: integer;
      bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): TDateTime; Overload;

      // Função que retorna o 1º dia útil posterior a uma determinada data
      function PrimeiroDiaUtilPosterior(dData: TDateTime; iCidade, iPais: integer; sEstado: string;
      bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): TDateTime; Overload;
      function PrimeiroDiaUtilPosterior(idEmpresa: LongInt; dData: TDateTime;
      bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): TDateTime; Overload;

      // Função que retorna o último dia útil anterior a uma determinada data
      function UltDiaUtilAnterior(dData: TDateTime; iCidade, iPais: integer; sEstado: string;
      bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): TDateTime; Overload;
      function UltDiaUtilAnterior(idEmpresa: LongInt; dData: TDateTime; 
      bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): TDateTime; Overload;


      // Função que retorna a quantidade de meses (inteiros) entre os meses definidos por 2 datas
      function MesesEntre(dDataIni, dDataFim: TDateTime): integer;

      // Função que retorna o intervalo de meses entre 2 determindadas datas
      function IntervaloMeses(dDataIni, dDataFim: TDateTime): integer;

      // Função que retorna o intervalo de dias entre 2 determindadas datas
      function IntervaloDias(dDataIni, dDataFim: TDateTime): integer;

      // Função que retorna o intervalo de dias úteis entre 2 determindadas datas
      function IntervaloDiasUteis(dDataIni, dDataFim: TDateTime; iCidade, iPais: integer; sEstado: string;
      bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): integer; Overload;
      function IntervaloDiasUteis(idEmpresa: LongInt; dDataIni, dDataFim: TDateTime;
      bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): integer; Overload;

      // Função que retorna o nº de dias úteis em um mês
      function DiasUteisMes(iAno, iMes: word; iCidade, iPais: integer; sEstado: string;
      bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): word; Overload;
      function DiasUteisMes(idEmpresa: LongInt; iAno, iMes: word;
      bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): word; Overload;

      procedure SetLogradouro(iIdEmpresa: LongInt; Var iCidade, iPais: LongInt; Var sUF: String);

      Function UltimoDiaMes(sData:String): String;

      //Função que converte uma quantidade qualquer de segundos no format "1h25m33s"
      Function SegundosParaHMS( iSegundos : integer ) : string;
   end;


implementation

//--------------------------------------------------------------------------------------------------
//    AnoBissexto:   Função que retorna se um determinado ano é bissexto ou não
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       iAno  :  ano em questão
//
//--------------------------------------------------------------------------------------------------
function TDiasUteis.AnoBissexto(iAno: word): boolean;
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
function TDiasUteis.ExtraiDia(dData: tDateTime): word;
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
function TDiasUteis.ExtraiMes(dData: tDateTime): word;
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
function TDiasUteis.ExtraiAno(dData: tDateTime): word;
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
function TDiasUteis.ContaFeriados(dDataIni, dDataFim: TDateTime; iCidade, iPais: integer; sEstado: string;
bConsideraBancario, bConsideraExtraordinario: boolean): integer;
var
   CdsFeriado: TClientDataSet;
   sTipos: string;
begin
   Result := -1;

   if dDataFim >= dDataIni then begin

      CdsFeriado := TClientDataSet.Create(Application);

      // define os tipos de feriados que se deseja levar em conta
      // Feriados ordinários são SEMPRE levados em conta
      // Feriados classistas NUNCA são contados (precisa de consistência com
      sTipos := '''O''';
      if bConsideraBancario then       sTipos := sTipos + ',' + '''B''';
      if bConsideraExtraordinario then sTipos := sTipos + ',' + '''E''';

      try

         with CdsFeriado do begin

            Close;
            Data := GetDataPacket(
                    'SELECT ' + chr(13) +
                    '   DISTINCT(DATAFERIADO) ' + chr(13) +
                    'FROM  ' + chr(13) +
                    '   FERIADOS ' + chr(13) +
                    'WHERE  ' + chr(13) +
                    '   ( DATAFERIADO BETWEEN ( TO_DATE(''' + FormatDateTime('dd/mm/yyyy', dDataIni) + ''', ''DD/MM/YYYY'') ) AND ( TO_DATE(''' + FormatDateTime('dd/mm/yyyy', dDataFim) + ''', ''DD/MM/YYYY'') ) ) ' + chr(13) +
                    '   AND ' + chr(13) +
                    '   ( ' +  //Higor Nayde Ferreira  SOL 199535 KTN 1920413 INICIO
                    '   ( IDPAIS = ' + IntToStr(iPais) +  ' AND FLGAMBITO = ''F'' ) OR ' +
                    '   ( ( IDPAIS = ' + IntToStr(iPais) +  ' ) AND (CODESTADO = ''' + sEstado + ''' ) AND (FLGAMBITO = ''E'')  ) OR ' +
                    '   ( IDCIDADES = ' + IntToStr(iCidade) +  '  AND FLGAMBITO = ''M'' ) ' +
                    '   ) ' +  //Higor Nayde Ferreira  SOL 199535 KTN 1920413 FIM
                    '   AND ( FLGTIPO IN (' + sTipos + ') )');
         end;

         Result := CdsFeriado.RecordCount;

      finally
         CdsFeriado.Close;
         CdsFeriado.Free;
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
function TDiasUteis.ContaDomingos(dDataIni, dDataFim: TDateTime; iCidade, iPais: integer;
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
function TDiasUteis.ContaSabados(dDataIni, dDataFim: TDateTime; iCidade, iPais: integer;
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
function TDiasUteis.ContaDiasNaoUteis(dDataIni, dDataFim: TDateTime; iCidade, iPais: integer;
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
function TDiasUteis.Feriado(dData: TDateTime; iCidade, iPais: integer; sEstado: string;
bConsideraBancario, bConsideraExtraordinario: boolean; TipoFeriado: TTipoFeriado = tfTodos): boolean;
var
   CdsFeriado: TClientDataSet;
   sTipos: string;
   sSql: String;
   sSQLFederal, sSQLMunicipal, sSQLEstadual: String;
begin
   CdsFeriado := TClientDataSet.Create(Application);

   // define os tipos de feriados que se deseja levar em conta
   // Feriados ordinários são SEMPRE levados em conta
   // Feriados classistas NUNCA são contados (precisa de consistência com
   sTipos := '''O''';
   if bConsideraBancario then       sTipos := sTipos + ',' + '''B''';
   if bConsideraExtraordinario then sTipos := sTipos + ',' + '''E''';

   { Feriado Federal }
   sSQLFederal := ' (( IDPAIS = ' + IntToStr(iPais) + ' ) AND ( IDCIDADES IS NULL ) AND ( CODESTADO IS NULL )) ';
   { Feriado Estadual }
   sSQLEstadual := ' (( IDPAIS = ' + IntToStr(iPais) + ' ) AND ( IDCIDADES IS NULL ) AND ( CODESTADO = ' + QuotedStr(Trim(sEstado)) + ' )) ';
   { Feriado Municipal }
   sSQLMunicipal := ' (( IDPAIS = ' + IntToStr(iPais) + ' ) AND ( IDCIDADES = ' + IntToStr(iCidade) + ' ) AND ( CODESTADO = ' + QuotedStr(Trim(sEstado)) + '  )) ';


   try

      with CdsFeriado do begin

         Close;

         sSQL := 'SELECT ' + chr(13) +
                 '   COUNT(IDFERIADO) AS NO_FERIADOS ' + chr(13) +
                 'FROM  ' + chr(13) +
                 '   FERIADOS ' + chr(13) +
                 'WHERE  ' + chr(13) +
                 '   ( DATAFERIADO = TO_DATE(''' + FormatDateTime('dd/mm/yyyy', dData) + ''', ''DD/MM/YYYY'') ) ' + chr(13) +
                 '   AND ' + chr(13) +
                 '   ( ' + chr(13);

         Case TipoFeriado of
            tfTodos: sSQL := sSQL + sSQLFederal + ' OR ' + sSQLMunicipal + ' OR ' + sSQLEstadual ;
            tfFederal: sSQL := sSQL + sSQLFederal;
            tfEstadual: sSQL := sSQL + sSQLEstadual;
            tfMunicipal: sSQL := sSQL + sSQLMunicipal;
            tfMunicipalEstadual: sSQL := sSQL + sSQLMunicipal + ' OR ' + sSQLEstadual;
            tfEstadualFederal: sSQL := sSQL + sSQLFederal + ' OR ' + sSQLEstadual;
            tfMunicipalFederal: sSQL := sSQL + sSQLFederal + ' OR ' + sSQLMunicipal;
         End;

         sSQL := sSql + '   ) ' + chr(13) +
                        '   AND ( FLGTIPO IN (' + sTipos + ') )';

         Data := GetDataPacket(sSQL);
      end;

      Result := CdsFeriado.FieldByName('NO_FERIADOS').asInteger > 0;

   finally
      CdsFeriado.Close;
      CdsFeriado.Free;
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
function TDiasUteis.DiaUtil(dData: TDateTime; iCidade, iPais: integer; sEstado: string;
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
function TDiasUteis.UltDiaMes(iAno, iMes: word): TDateTime;
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
function TDiasUteis.UltDiaUtilMes(iAno, iMes: word; iCidade, iPais: integer; sEstado: string;
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
function TDiasUteis.EnesimoDiaUtilMes(iAno, iMes, iDia: word; iCidade, iPais: integer; sEstado: string;
bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): TDateTime;
var
   dData: TDateTime;
begin
   dData := EncodeDate(iAno, iMes, 1) - 1;

   // soma iDia dias úteis a partir do último dia do mês anterior
   Result := SomaDiasUteis(dData, iDia, iCidade, iPais, sEstado, bConsideraBancario, bConsideraExtraordinario, bSabadoUtil) - 1;

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
function TDiasUteis.SomaDias(dDataIni: TDateTime; iDias: integer): TDateTime;
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
function TDiasUteis.SomaMeses(dDataIni: TDateTime; iMeses: integer): TDateTime;

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
function TDiasUteis.SomaAnos(dDataIni: TDateTime; iAnos: integer): TDateTime;

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
function TDiasUteis.SomaDiasUteis(dDataIni: TDateTime; iDiasUteis: integer; iCidade, iPais: integer;
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
function TDiasUteis.PrimeiroDiaUtilPosterior(dData: TDateTime; iCidade, iPais: integer; sEstado: string;
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
function TDiasUteis.UltDiaUtilAnterior(dData: TDateTime; iCidade, iPais: integer; sEstado: string;
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
function TDiasUteis.MesesEntre(dDataIni, dDataFim: TDateTime): integer;
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
function TDiasUteis.IntervaloMeses(dDataIni, dDataFim: TDateTime): integer;
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
function TDiasUteis.IntervaloDias(dDataIni, dDataFim: TDateTime): integer;
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
function TDiasUteis.IntervaloDiasUteis(dDataIni, dDataFim: TDateTime; iCidade, iPais: integer;
sEstado: string; bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): integer;
var
   iDiasNaoUteis: integer;
begin
   Result := -1;

   if dDataFim >= dDataIni then begin
      Result := IntervaloDias(dDataIni, dDataFim);

      iDiasNaoUteis := ContaDiasNaoUteis(dDataIni+1, dDataFim, iCidade, iPais, sEstado, bConsideraBancario, bConsideraExtraordinario, bSabadoUtil);

      Result := Result - iDiasNaoUteis;
      
      If Result < 0 Then Result := 0; 
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
function TDiasUteis.DiasUteisMes(iAno, iMes: word; iCidade, iPais: integer; sEstado: string;
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



procedure TDiasUteis.SetLogradouro(iIdEmpresa: Integer;
  var iCidade, iPais: Integer; var sUF: String);
begin
  With TClientDataSet.Create(nil) Do
    Try
       Data := GetDataPacket(' SELECT ES.IDPAIS, ES.CODESTADO, C.IDCIDADES ' +
                                     ' FROM PESSOA P, ENDPESS E, CIDADES C, ESTADO  ES ' +
                                     ' WHERE (P.IDPESSOA = ' + IntToStr(iIdEmpresa) + ') AND '  +
                                     '       (P.IDPESSOA = E.IDPESSOA) AND '  +
                                     '       (P.IDENDCOMERCIAL = E.IDENDERECO) AND '  +
                                     '       (E.IDCIDADES = C.IDCIDADES) AND '  +
                                     '       (C.IDESTADO = ES.IDESTADO) ');
       If Not IsEmpty Then
       Begin
         iPais := Fields[0].AsInteger;
         sUF := Fields[1].AsString;
         iCidade := Fields[2].AsInteger;
       End
       Else
       Begin
         iPais := 0;
         sUF := '';
         iCidade := 0;
       End;

       Close;
    finally
       Free;
    end;
end;

function TDiasUteis.ContaFeriados(idEmpresa: Integer; dDataIni,
  dDataFim: TDateTime; bConsideraBancario,
  bConsideraExtraordinario: boolean): integer;
Var
  idCidade, idPais: Integer;
  sUf: String;
begin
  SetLogradouro(idEmpresa, idCidade, idPais, sUf);
  Result := ContaFeriados(dDataIni, dDataFim, idCidade, idPais, sUf, bConsideraBancario, bConsideraExtraordinario);
end;

function TDiasUteis.ContaDiasNaoUteis(idEmpresa: Integer; dDataIni,
  dDataFim: TDateTime; bConsideraBancario, bConsideraExtraordinario,
  bSabadoUtil: boolean): integer;
Var
  idCidade, idPais: Integer;
  sUf: String;
begin
  SetLogradouro(idEmpresa, idCidade, idPais, sUf);
  Result := ContaDiasNaoUteis(dDataIni, dDataFim, idCidade, idPais, sUf, bConsideraBancario, bConsideraExtraordinario,
                              bSabadoUtil)
end;

function TDiasUteis.ContaDomingos(idEmpresa: Integer; dDataIni,
  dDataFim: TDateTime; bConsideraBancario, bConsideraExtraordinario,
  bIgnoraFeriados: boolean): integer;
Var
  idCidade, idPais: Integer;
  sUf: String;
begin
  SetLogradouro(idEmpresa, idCidade, idPais, sUf);
  Result := ContaDomingos(dDataIni, dDataFim, idCidade, idPais, sUf, bConsideraBancario, bConsideraExtraordinario, bIgnoraFeriados);
end;

function TDiasUteis.ContaSabados(idEmpresa: Integer; dDataIni,
  dDataFim: TDateTime; bConsideraBancario, bConsideraExtraordinario,
  bIgnoraFeriados: boolean): integer;
Var
  idCidade, idPais: Integer;
  sUf: String;
begin
  SetLogradouro(idEmpresa, idCidade, idPais, sUf);
  Result := ContaSabados(dDataIni, dDataFim, idCidade, idPais, sUf, bConsideraBancario, bConsideraExtraordinario, bIgnoraFeriados);
end;

function TDiasUteis.DiasUteisMes(idEmpresa: Integer; iAno, iMes: word;
  bConsideraBancario, bConsideraExtraordinario,
  bSabadoUtil: boolean): word;
Var
  idCidade, idPais: Integer;
  sUf: String;
begin
  SetLogradouro(idEmpresa, idCidade, idPais, sUf);
  Result := DiasUteisMes(iAno, iMes, idCidade, idPais, sUf, bConsideraBancario, bConsideraExtraordinario, bSabadoUtil);
end;

function TDiasUteis.DiaUtil(idEmpresa: Integer; dData: TDateTime;
  bConsideraBancario, bConsideraExtraordinario,
  bSabadoUtil: boolean): boolean;
Var
  idCidade, idPais: Integer;
  sUf: String;
begin
  SetLogradouro(idEmpresa, idCidade, idPais, sUf);
  Result := DiaUtil(dData, idCidade, idPais, sUf, bConsideraBancario, bConsideraExtraordinario, bSabadoUtil);
end;

function TDiasUteis.EnesimoDiaUtilMes(idEmpresa: Integer; iAno, iMes,
  iDia: word; bConsideraBancario, bConsideraExtraordinario,
  bSabadoUtil: boolean): TDateTime;
Var
  idCidade, idPais: Integer;
  sUf: String;
begin
  SetLogradouro(idEmpresa, idCidade, idPais, sUf);
  Result := EnesimoDiaUtilMes(iAno, iMes, iDia, idCidade, idPais, sUf, bConsideraBancario, bConsideraExtraordinario, bSabadoUtil);
end;

function TDiasUteis.Feriado(idEmpresa: Integer; dData: TDateTime;
  bConsideraBancario, bConsideraExtraordinario: boolean; TipoFeriado: TTipoFeriado = tfTodos): boolean;
Var
  idCidade, idPais: Integer;
  sUf: String;
begin
  SetLogradouro(idEmpresa, idCidade, idPais, sUf);
  Result := Feriado(dData, idCidade, idPais, sUf, bConsideraBancario, bConsideraExtraordinario, TipoFeriado);
end;

function TDiasUteis.IntervaloDiasUteis(idEmpresa: Integer; dDataIni,
  dDataFim: TDateTime; bConsideraBancario, bConsideraExtraordinario,
  bSabadoUtil: boolean): integer;
Var
  idCidade, idPais: Integer;
  sUf: String;
begin
  SetLogradouro(idEmpresa, idCidade, idPais, sUf);
  Result := IntervaloDiasUteis(dDataIni, dDataFim, idCidade, idPais, sUf, bConsideraBancario, bConsideraExtraordinario, bSabadoUtil);
end;

function TDiasUteis.PrimeiroDiaUtilPosterior(idEmpresa: Integer;
  dData: TDateTime; bConsideraBancario, bConsideraExtraordinario,
  bSabadoUtil: boolean): TDateTime;
Var
  idCidade, idPais: Integer;
  sUf: String;
begin
  SetLogradouro(idEmpresa, idCidade, idPais, sUf);
  Result := PrimeiroDiaUtilPosterior(dData, idCidade, idPais, sUf, bConsideraBancario, bConsideraExtraordinario, bSabadoUtil);
end;

function TDiasUteis.SomaDiasUteis(idEmpresa: Integer; dDataIni: TDateTime;
  iDiasUteis: integer; bConsideraBancario, bConsideraExtraordinario,
  bSabadoUtil: boolean): TDateTime;
Var
  idCidade, idPais: Integer;
  sUf: String;
begin
  SetLogradouro(idEmpresa, idCidade, idPais, sUf);
  Result := SomaDiasUteis(dDataIni, iDiasUteis, idCidade, idPais, sUf, bConsideraBancario, bConsideraExtraordinario, bSabadoUtil);
end;

function TDiasUteis.UltDiaUtilAnterior(idEmpresa: Integer;
  dData: TDateTime; bConsideraBancario, bConsideraExtraordinario,
  bSabadoUtil: boolean): TDateTime;
Var
  idCidade, idPais: Integer;
  sUf: String;
begin
  SetLogradouro(idEmpresa, idCidade, idPais, sUf);
  Result := UltDiaUtilAnterior(dData, idCidade, idPais, sUf, bConsideraBancario, bConsideraExtraordinario, bSabadoUtil);
end;

function TDiasUteis.UltDiaUtilMes(idEmpresa: Integer; iAno, iMes: word;
  bConsideraBancario, bConsideraExtraordinario,
  bSabadoUtil: boolean): TDateTime;
Var
  idCidade, idPais: Integer;
  sUf: String;
begin
  SetLogradouro(idEmpresa, idCidade, idPais, sUf);
  Result := UltDiaUtilMes(iAno, iMes, idCidade, idPais, sUf, bConsideraBancario, bConsideraExtraordinario, bSabadoUtil);
end;

function TDiasUteis.UltimoDiaMes(sData: String): String;
Var
  wAno, wMes, wDia: Word;
begin
  DecodeDate(StrToDate(sData),wAno, wMes, wDia);
  Result := DateToStr(UltDiaMes(wAno, wMes));
end;


function TDiasUteis.SegundosParaHMS(iSegundos: integer): string;
var
  fAux : real;
  i_Horas, i_Minutos, i_Segundos : integer;
  s : string;
begin
  fAux       := iSegundos / 3600;
  i_Horas    := trunc( fAux );
  fAux       := frac( fAux ) * 60;
  i_Minutos  := trunc( fAux );
  i_Segundos := round( frac( fAux ) * 60 );
  s := '';

  if i_Horas   > 0 then s := s + IntToStr( i_Horas   ) + 'h';

  if i_Minutos > 0 then
  begin
    if i_Horas > 0 then
      s := s + FormatFloat( '00', i_Minutos ) + 'm'
    else
      s := s + IntToStr( i_Minutos ) + 'm';
    Result := s + FormatFloat( '00', i_Segundos ) + 's';
  end
  else
    Result := s + IntToStr( i_Segundos ) + 's';

end;

{
- uDiasuteis
  Correção na  função de feriados onde considerava os feriados independente do ambito
  dos mesmos: Nacional, Estadual e Municipal.
  Para seleção de feriados com ambitos específicos deve se passar para o último parâmetro da
  função o Tipo de Feriado que deve ser levado em consideração de acordo com os valores:
  tfTodos, tfFederal, tfEstadual, tfMunicipal, tfMunicipalEstadual, tfEstadualFederal,
  tfMunicipalFederal. O Valor default é tfTodos;
}

end.
