//******************************************************************************
// Data      : 28/05/2008
// Código    : AL_3
// Pendencia : 26357, 26456, 26577, 27100
// SOL       : 69119, 70156, 71040, 70122
// Desc      : Ajustes para o novo empréstimo MT
//******************************************************************************
// Data      : 03/01/2007
// Código    : AL_2
// Pendencia : 23705
// SOL       : 40671
// Desc      : Implementação das funções IIF para a Integração de Bloqueio
//             de Penhora com o Jurídico
//------------------------------------------------------------------
// Sistema  .: INVESTIMENTOS
// Objetivo .: Unit com funcoes do Sistema
// Unit     .: UFuncoesInvest
// Data     .: 10/05/1998
//------------------------------------------------------------------

unit UFuncoesInvest;

interface

Uses
  USistema, UAutorizacao, UMensErro, UDatabase,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  DBCtrls, Mask, cmseldlg, wwidlg, Db, Wwdatsrc, TB97, MAHlpBtn, ExtCtrls,
  DBTables, Wwquery;

Type
   TFuncoesInvest = Class(TObject)

   private

   public
      //AL_2
      function IIF(BooleanExpr: Boolean; IfTrue, IfFalse: String): String; overload;
      function IIF(BooleanExpr: Boolean; IfTrue, IfFalse: Integer): Integer; overload;
      function IIF(BooleanExpr: Boolean; IfTrue, IfFalse: Extended): Extended; overload;
      function IIF(BooleanExpr: Boolean; IfTrue, IfFalse: TDateTime): TDateTime; overload;

      //AL_3 
      function TrocaPontoVirgula(Value: String): String;
      function TrocaVirgulaPonto(Value: String): String;


end;

var
   FuncoesInvest : TFuncoesInvest;

implementation

{ TFuncoesInvest }

//AL_2  
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

function TFuncoesInvest.TrocaPontoVirgula(Value: String): String;
var i, iPosVirg : Integer;
begin
  iPosVirg := Pos('.',Value);
  if iPosVirg <> 0 then
     Value := Copy(Value, 1, iPosVirg-1) + ',' + Copy(Value, iPosVirg + 1, length(Value));
  Result:=Value;
end;

function TFuncoesInvest.TrocaVirgulaPonto(Value: String): String;
var i, iPosVirg : Integer;
begin
  iPosVirg := Pos(',', Value);
  if iPosVirg <> 0 then
     Value := Copy(Value, 1, iPosVirg-1) + '.' + Copy(Value, iPosVirg + 1, length(Value));
  Result:=Value;
end;

end.
