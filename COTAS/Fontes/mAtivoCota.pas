unit mAtivoCota;

interface

uses 
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, MontaSelect;

type
   TmolAtivoCota = class(TFrame)
      Label2: TLabel;
    edtDescAtivo: TEdit;
      btnBuscaContrato: TBitBtn;
      btnLimpaAtivo: TBitBtn;


   private  // Private declarations

      FRetornaValor  : Boolean;
      FIDAtivo       : Integer;
      FTipo          : Integer;
      FNomeAtivo     : String;


   public   // Public declarations

      property RetornouValor : Boolean read FRetornaValor;
      property IDAtivo       : Integer read FIDAtivo;
      property Tipo          : Integer read FTipo;
      property NomeAtivo     : String  read FNomeAtivo;


   end;



implementation
{$R *.DFM}
uses
   uTypesCota, dMS;




end.
