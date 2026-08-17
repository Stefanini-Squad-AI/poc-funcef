unit UDividasEmp;

interface

uses
  Db, DBTables, Wwquery, Wwdatsrc, DBCtrls, Mask, wwdbedit,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls;

   function SaldoDevEmp (idpessoa:integer; var sValor : double; var sSQL:string) : double;
   function ParcAtrasoEmp (idpessoa:integer; var sSQL:String) :string;
   function BaixaParcEmp (idpessoa, idcontrato, quitasaldo:integer;
                       mesref,  dtrealrec, parcela: string;
                       var sSQL:String) : Boolean;
   procedure QuitaEInsere(Qry : TwwQuery; Contr : Integer;
                          SitCtr, sMes, sData : String; ValRec : Double;
                          bVaiInserir : Boolean);


implementation

function SaldoDevEmp (IdPessoa:integer;var sValor : double; var sSQL:string) : double;
var QryDiv : TwwQuery;
begin
   Result := 0;
end;

function ParcAtrasoEmp (idpessoa:integer; var sSQL:string) : string;
var QryDiv : TwwQuery;
begin

end;

function BaixaParcEmp (idpessoa, idcontrato, quitasaldo:integer;
                       mesref,  dtrealrec, parcela: string;
                       var sSQL:String) : boolean;
var QryDiv : TwwQuery; 
    saldodev, sParcela : string;
    rSaldoDev: double;
begin
 Result := False;
 Result := True;
end;

procedure QuitaEInsere(Qry : TwwQuery; Contr : Integer;
                       SitCtr, sMes, sData : String; ValRec : Double;
                       bVaiInserir : Boolean);
var sSQL : String;
    ind : Integer;
begin


end;


end.
