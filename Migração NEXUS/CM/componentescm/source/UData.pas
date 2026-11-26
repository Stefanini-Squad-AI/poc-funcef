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
unit UData;

interface
uses SysUtils;

{+++ Verifica se uma data está entre outras duas +++}
function DataEntre(data, data1, data2: TDateTime): boolean;
{ Converte data para string no formato ingles }
function DateToStrIng(Data: TDateTime): String;

function Year(Data: TDateTime): Word;
function Month(Data: TDateTime): Word;
function Day(Data: TDateTime): Word;

function Hour(Hora: TDateTime): Word;
function Minutes(Hora: TDateTime): Word;
function Seconds(Hora: TDateTime): Word;

function CheckDate(sData: String): Boolean;
function UltimoDiaMes(dt: TDateTime): TDateTime;

implementation

function DateToStrIng(Data: TDateTime): String;
begin
	Result := FormatDateTime('mm/dd/yy',Data);
end;

function DataEntre(data, data1, data2: TDateTime): boolean;
var	aux : TDateTime;
begin
	if data1 > data2
   then begin
   	aux := data1;
   	data1 := data2;
		data2 := aux;
	end;

   if (data >= data1) and (data <= data2)
   then DataEntre := True
	else DataEntre := False;
end;

function UltimoDiaMes(dt: TDateTime): TDateTime;
begin
   case Month(dt) of
      1,3,5,7,8,10,12: begin
         Result := EncodeDate(Year(dt), Month(dt), 31);
      end; {:}
      2: begin
         if Year(dt) mod 4 = 0
         then Result := EncodeDate(Year(dt), Month(dt), 29)
         else Result := EncodeDate(Year(dt), Month(dt), 28);
      end; {:}
   else Result := EncodeDate(Year(dt), Month(dt), 30);
   end;
end;

function Year(Data: TDateTime): Word;
var
   a, b: Word;

begin
   DecodeDate(Data, Result, a, b);
end;

function Month(Data: TDateTime): Word;
var
   a, b: Word;

begin
   DecodeDate(Data, a, Result, b);
end;

function Day(Data: TDateTime): Word;
var
   a, b: Word;

begin
   DecodeDate(Data, a, b , Result);
end;

function Hour(Hora: TDateTime): Word;
var
   a, b, c: Word;

begin
   DecodeTime(Hora, Result, a, b, c);
end;

function Minutes(Hora: TDateTime): Word;
var
   a, b, c: Word;

begin
   DecodeTime(Hora, a, Result, b, c);
end;

function Seconds(Hora: TDateTime): Word;
var
   a, b, c: Word;

begin
   DecodeTime(Hora, a, b, Result, c);
end;

function CheckDate(sData: String): Boolean;
begin
   Result := False;

   try
      StrToDate(sData);
   except
      Exit;
   end; 

   Result := True;
end;

end.
