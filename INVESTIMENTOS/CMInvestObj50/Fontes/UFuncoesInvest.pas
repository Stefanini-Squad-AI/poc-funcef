//------------------------------------------------------------------
// Sistema  .: CMInvestObj50
// Objetivo .: Unit com funcoes do Sistema
// Unit     .: UFuncoesInvest
// Data     .: 19/11/2007
// Autor    .: Marco Turon
//------------------------------------------------------------------
unit UFuncoesInvest;

interface

Uses
  USistema, UMensErro, UDatabase,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  DBCtrls, Mask, wwidlg, Db, Wwdatsrc, TB97, MAHlpBtn, ExtCtrls,
  DBTables;

Type
   TFuncoesInvest = Class(TObject)

   private

   public
      function IIF(BooleanExpr: Boolean; IfTrue, IfFalse: String): String; overload;
      function IIF(BooleanExpr: Boolean; IfTrue, IfFalse: Integer): Integer; overload;
      function IIF(BooleanExpr: Boolean; IfTrue, IfFalse: Extended): Extended; overload;
      function IIF(BooleanExpr: Boolean; IfTrue, IfFalse: TDateTime): TDateTime; overload;

      function OraNumero( sNumero: String ): String; overload;
      function OraNumero( fNumero: Double ): String; overload;


end;

var
   FuncoesInvest : TFuncoesInvest;

implementation

{ TFuncoesInvest }

function TFuncoesInvest.IIF(BooleanExpr: Boolean; IfTrue, IfFalse: String): String;
begin
   if BooleanExpr then Result := IfTrue else Result := IfFalse;
end;

function TFuncoesInvest.IIF(BooleanExpr: Boolean; IfTrue, IfFalse: Integer): Integer;
begin
   if BooleanExpr then Result := IfTrue else Result := IfFalse;
end;

function TFuncoesInvest.IIF(BooleanExpr: Boolean; IfTrue, IfFalse: Extended): Extended;
begin
   if BooleanExpr then Result := IfTrue else Result := IfFalse;
end;

function TFuncoesInvest.IIF(BooleanExpr: Boolean; IfTrue, IfFalse: TDateTime): TDateTime;
begin
   if BooleanExpr then Result := IfTrue else Result := IfFalse;
end;

function TFuncoesInvest.OraNumero( sNumero : String ): String;
var i : integer;
    sOra : string;
    bPrimPonto : boolean;
begin
   Result := '';
   if Trim(sNumero) <> '' then
   begin
      sOra := '';
      bPrimPonto := True;
      for i := length(Trim(sNumero)) downto 1 do
      begin
         if sNumero[i] = ',' then
         begin
            if bPrimPonto then
            begin
               sOra := sOra + '.';
               bPrimPonto := False;
            end;
         end
         else
         begin
            if sNumero[i] <> '.' then
               sOra := sOra + sNumero[i]
            else
            begin
               if bPrimPonto then
               begin
                  sOra := sOra + '.';
                  bPrimPonto := False;
               end;
            end;
         end;
      end;
      for i := length(sOra) downto 1 do
         Result := Result + sOra[i];
   end
   else
      Result := '0';
end;

function TFuncoesInvest.OraNumero(fNumero: Double): String;
var i : integer;
    sNumero, sOra : string;
    bPrimPonto : boolean;
begin
   sNumero := FloatToStr(fNumero);
   Result := '';
   if Trim(sNumero) <> '' then
   begin
      sOra := '';
      bPrimPonto := True;
      for i := length(Trim(sNumero)) downto 1 do
      begin
         if sNumero[i] = ',' then
         begin
            if bPrimPonto then
            begin
               sOra := sOra + '.';
               bPrimPonto := False;
            end;
         end
         else
         begin
            if sNumero[i] <> '.' then
               sOra := sOra + sNumero[i]
            else
            begin
               if bPrimPonto then
               begin
                  sOra := sOra + '.';
                  bPrimPonto := False;
               end;
            end;
         end;
      end;
      for i := length(sOra) downto 1 do
         Result := Result + sOra[i];
   end
   else
      Result := '0';
end;

end.
