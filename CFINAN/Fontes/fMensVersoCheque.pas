unit fMensVersoCheque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, ExtCtrls;

type
  TfrmMensVersoCheque = class(TfrmOkCancelar)
    MemVersoCheque: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMensVersoCheque: TfrmMensVersoCheque;

implementation

{$R *.DFM}

end.
