unit UModulo;

interface

type TModulo = Class
   private
          FExemplo : string;
          FWorkFlow: integer;

   public
         property Exemplo : string read FExemplo write FExemplo;
         property iWorkFlow : integer read FWorkFlow write FWorkFlow;
   end;

var Modulo : TModulo;

implementation

end.
 
