unit FTelaAuxRegra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, MAHlpBtn, Buttons, TB97, ExtCtrls, IvDictio,
  IvMulti, IvEMulti, TB97Tlbr;

type
  TfrmTelaAuxRegra = class(TfrmOkCancelar)
    memRegra: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTelaAuxRegra: TfrmTelaAuxRegra;

implementation

{$R *.DFM}

end.
