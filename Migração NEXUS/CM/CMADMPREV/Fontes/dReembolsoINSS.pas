unit dReembolsoINSS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery;


// -------------------------------------------------------------------------------------------------

procedure LimpaParametros(const qry: TwwQuery);

// -------------------------------------------------------------------------------------------------

type
  TdtmReembolsoINSS = class(TDataModule)
    qryConcINSS: TwwQuery;


  private // Private declarations


  public  // Public declarations

    function VerificaConcINSS(const sMesRef: string): Boolean;


  end;



var
  dtmReembolsoINSS: TdtmReembolsoINSS;



implementation
{$R *.DFM}



function TdtmReembolsoINSS.VerificaConcINSS(const sMesRef: string): Boolean;
 begin
  with qryConcINSS do
  begin
    LimpaParametros(qryConcINSS);
    ParamByName('PMESREFERENCIA').AsString := sMesRef;
    Open;

    Result := (qryConcINSS.IsEmpty) or
              (
              qryConcINSS.FieldByName('CODDOCCAP').IsNull and
              qryConcINSS.FieldByName('CODDOCCAR').IsNull
              );

    Close;
  end;
end;



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



end.
