unit UIntegraModulo;

interface


type

   TIntegraModulo = Class
   private

   public
       iAssunto        : Extended;
       iEvento         : Integer;
       iContratoEmptmo : Extended;
       fValorSolic     : Currency;
       iNumParcelas    : Integer;
   end;
(*
 Eventos:
       0 -> Inscrição / Contratação
       1 -> Consulta de Contratos
       2 -> Quitação
       3 -> Cancelamento de Quitação
       4 -> Amortização
       5 -> Cancelamento de Amortização
       6 -> Tratamento Individual de Parcelas
       7 -> Assinatura de Contrato Padrão
       8 -> Lançamento e Histórico de Suspensão de Cobrança
*)


var
   IntegraModulo : TIntegraModulo;



implementation



end.

