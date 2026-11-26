unit UVerificaPreenchimento;

interface

uses
  SysUtils, controls;

type  
   // classe para validacao de entrada de dados
   EValidacao = class(Exception)
   private
      ctr_ : TWinControl;
      bShow_ : boolean;
   public
      constructor createVal(const msg : string; ctr : TWinControl);
    	property Control : TWinControl read ctr_;
      property Show : boolean read bShow_;
   end;

//--------------------------------------------------------------------------------------------------

implementation

// classe para validacao de entrada de dados
constructor EValidacao.CreateVal(const msg : string; ctr : TWinControl);
begin
   inherited Create(msg);
   ctr_ := ctr;
   bShow_ := msg <> '';
end;



end.
