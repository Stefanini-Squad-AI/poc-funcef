unit UModulo;

interface

uses graphics, SysUtils, uMensErro, Dialogs, dBaseDados, uDataBase;

type TModulo = Class
   private
          FLinhaAcima,FLinhaAbaixo,FSiglaMoedaCorr  : string;
          FExcluiuBloqueados : Boolean;
   public
         sMascaraContas : string;
         sMascaraCCusto : string;
         sMascaraUnidNegoc : string;
         clCorMestre : string;
         clCorMestreEsp : TColor;
         iUnidGlobal : integer;
         iExercicioAtual : integer;
         iPlano : integer;
         property bExcluiuBloqueados : Boolean read FExcluiuBloqueados write FExcluiuBloqueados;
         property sLinhaAcima   : String read FLinhaAcima write FLinhaAcima;
         property sLinhaAbaixo  : String read FLinhaAbaixo write FLinhaAbaixo;
         property sSiglaMoedaCorr : String read FSiglaMoedaCorr write FSiglaMoedaCorr;
         function TestaNatureza(sDemNat, sFlagNat:string; rVal:double):boolean;
   end;

var Modulo : TModulo;

implementation

function TModulo.TestaNatureza(sDemNat, sFlagNat:string; rVal:double):boolean;
begin
   if ((sDemNat = 'C') and
      (sFlagNat = 'C') and
      (rVal < 0)) or
      ((sDemNat = 'D') and
      (sFlagNat = 'D') and
      (rVal < 0)) or
      ((sDemNat = 'C') and
      (sFlagNat = 'D') and
      (rVal > 0)) or
      ((sDemNat = 'D') and
      (sFlagNat = 'C') and
      (rVal > 0)) then begin
      Result := true;
   end else begin
      Result := false;
   end;
end;

end.
