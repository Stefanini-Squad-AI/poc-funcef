unit Global;

interface

uses
     Forms, SysUtils, Db, Dialogs;
     function DiaUtil(DataEntrada: String): String;
     procedure ExcluiRegistroTabela(Tabela, Chave: string; Codigo: longint);

implementation

uses
    DBTables,UDiasUteis;


function DiaUtil(DataEntrada: String): String;
var
DataUtil : TDateTime;
begin
   { Quando o Dia da Semana igual a Domingo. }
   if (DayOfWeek(StrToDate(DataEntrada)) = 1) then  DataUtil := StrToDate(DataEntrada) + 1
   else begin
      { Quando o Dia da Semana igual a Sábado. }
      if (DayOfWeek(StrToDate(DataEntrada)) = 7) then DataUtil := StrToDate(DataEntrada) + 2
      else  DataUtil := StrToDate(DataEntrada);
   end;
   DiaUtil := DateToStr(DataUtil);
end;

procedure ExcluiRegistroTabela(Tabela,Chave: String; Codigo: longint);
var
QryDel : TQuery;
begin
   { Criando a Query . }
   QryDel := TQuery.Create(Application);
   QryDel.DataBaseName := 'basedados';

   QryDel.SQL.Clear;
   { Passando os parâmetros. }
   QryDel.SQL.Add('DELETE FROM '+Tabela+' WHERE '+Chave+' = '+IntToStr(Codigo));

   { Excluindo...}
   QryDel.ExecSQL;
   QryDel.Destroy;
end;


end.
