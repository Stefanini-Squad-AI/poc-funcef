unit FPedeFormaPagto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls;

type
  TfrmPedeFormaPagto = class(TfrmOkCancelar)
    rgrpFormaPagto: TRadioGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedeFormaPagto: TfrmPedeFormaPagto;

implementation

{$R *.DFM}

end.
