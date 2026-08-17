unit mRegra;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls;

type
  TmolRegra = class(TFrame)
    Regra: TLabel;
    DBedtRegra: TDBEdit;
    btnBuscaRegra: TBitBtn;
    btnLimpaRegra: TBitBtn;
    DBedtIDContrato: TDBEdit;


  private { Private declarations }

  public { Public declarations }
   iRegra   : int64;
   sRegra   : string;

  end;



implementation
{$R *.DFM}



end.
