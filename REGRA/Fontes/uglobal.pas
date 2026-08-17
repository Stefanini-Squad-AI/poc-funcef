unit uglobal;
interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, BDE, DB, Stdctrls,Wwquery;

var
   ustipocampo:string[2];
   ustipocampoaux:string[2];
   usDescEscolhido:string[60];
   usidescolhido:string;
   uiTipoPasso,uTemQuery:integer;
   ualgoritmo:string;
   uoperando:string[1];
   uiregra:longint;
   ucomparacao:boolean;

Function FazQuery(  Var Qry : TwwQuery;   Str : String) : Boolean;
Function FazwwQuery(Var Qry : twwQuery; Str : String) : Boolean;


implementation

Function FazQuery(Var Qry : TwwQuery; Str : String) : Boolean;
Begin
  With qry Do Begin
       unprepare;
       prepare;
       Close;
       SQL.Clear;
       SQL.Add(str);
       Open;
       Result := not qry.IsEmpty;
  End;
End;

Function FazwwQuery(Var Qry : twwQuery; Str : String) : Boolean;
Begin
  With qry Do Begin
       Close;
       SQL.Clear;
       SQL.Add(str);
       unprepare;
       prepare;
       Open;
       Result := not qry.IsEmpty;
  End;
End;


end.
 
