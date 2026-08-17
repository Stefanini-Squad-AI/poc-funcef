unit UModuloAgendamento;

interface

type TModuloAgendamento = Class
   private
     FExemplo : string;
   public
     property Exemplo : string read FExemplo write FExemplo;
   end;

var
  ModuloAgendamento : TModuloAgendamento;

  // 1 - Geral; 2 - Por Atendente; 3 - Por Data
  iReportAgendamento : integer;


implementation

end.
